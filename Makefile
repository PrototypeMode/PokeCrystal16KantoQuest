roms := \
	pokecrystal.gbc
patches := pokecrystal.patch

rom_obj := \
	audio.o \
	home.o \
	main.o \
	ram.o \
	data/text/common.o \
	data/maps/map_data.o \
	data/pokemon/dex_entries.o \
	data/pokemon/egg_moves.o \
	data/pokemon/evos_attacks.o \
	engine/movie/credits.o \
	engine/overworld/events.o \
	gfx/misc.o \
	gfx/pics.o \
	gfx/sprites.o \
	gfx/tilesets.o \
	lib/mobile/main.o \
	lib/mobile/mail.o

pokecrystal_obj    := $(rom_obj:.o=.o)
pokecrystal_vc_obj := $(rom_obj:.o=_vc.o)


### Build tools

ifeq (,$(shell which sha1sum))
SHA1 := shasum
else
SHA1 := sha1sum
endif

RGBDS ?=
RGBASM  ?= $(RGBDS)rgbasm
RGBFIX  ?= $(RGBDS)rgbfix
RGBGFX  ?= $(RGBDS)rgbgfx
RGBLINK ?= $(RGBDS)rgblink


### Build targets

.SUFFIXES:
.PHONY: all crystal clean tidy tools
.SECONDEXPANSION:
.PRECIOUS:
.SECONDARY:

all: crystal
crystal:    pokecrystal.gbc
crystal_vc: pokecrystal.patch

clean: tidy
	find gfx \
	     \( -name "*.[12]bpp" \
	        -o -name "*.lz" \
	        -o -name "*.gbcpal" \
	        -o -name "*.sgb.tilemap" \) \
	     -delete
	find gfx/pokemon -mindepth 1 \
	     ! -path "gfx/pokemon/unown/*" \
	     \( -name "bitmask.asm" \
	        -o -name "frames.asm" \
	        -o -name "front.animated.tilemap" \
	        -o -name "front.dimensions" \) \
	     -delete

tidy:
	$(RM) $(roms) \
	      $(roms:.gbc=.sym) \
	      $(roms:.gbc=.map) \
	      $(patches) \
	      $(patches:.patch=_vc.gbc) \
	      $(patches:.patch=_vc.sym) \
	      $(patches:.patch=_vc.map) \
	      $(patches:%.patch=vc/%.constants.sym) \
	      $(pokecrystal_obj) \
	      $(pokecrystal_vc_obj) \
	      rgbdscheck.o
	$(MAKE) clean -C tools/

tools:
	$(MAKE) -C tools/


RGBASMFLAGS = -Q8 -P includes.asm -Weverything -Wtruncation=1
# Create a sym/map for debug purposes if `make` run with `DEBUG=1`
ifeq ($(DEBUG),1)
RGBASMFLAGS += -E
endif

$(pokecrystal_obj):         RGBASMFLAGS +=
$(pokecrystal_vc_obj):      RGBASMFLAGS += -D _CRYSTAL_VC

%.patch: %_vc.gbc %.gbc vc/%.patch.template
	tools/make_patch $*_vc.sym $^ $@

rgbdscheck.o: rgbdscheck.asm
	$(RGBASM) -o $@ $<

# Build tools when building the rom.
# This has to happen before the rules are processed, since that's when scan_includes is run.
ifeq (,$(filter clean tidy tools,$(MAKECMDGOALS)))

$(info $(shell $(MAKE) -C tools))

# The dep rules have to be explicit or else missing files won't be reported.
# As a side effect, they're evaluated immediately instead of when the rule is invoked.
# It doesn't look like $(shell) can be deferred so there might not be a better way.
preinclude_deps := includes.asm $(shell tools/scan_includes includes.asm)
define DEP
$1: $2 $$(shell tools/scan_includes $2) $(preinclude_deps) | rgbdscheck.o
	$$(RGBASM) $$(RGBASMFLAGS) -o $$@ $$<
endef

# Dependencies for shared objects objects
$(foreach obj, $(pokecrystal_obj), $(eval $(call DEP,$(obj),$(obj:.o=.asm))))
$(foreach obj, $(pokecrystal_vc_obj), $(eval $(call DEP,$(obj),$(obj:_vc.o=.asm))))

endif


pokecrystal_opt         = -Cjv -t PM_CRYSTAL -i BYTE -n 0 -k 01 -l 0x33 -m MBC3+TIMER+RAM+BATTERY -r 3 -p 0
pokecrystal_vc_opt      = -Cjv -t PM_CRYSTAL -i BYTE -n 0 -k 01 -l 0x33 -m MBC3+TIMER+RAM+BATTERY -r 3 -p 0

%.gbc: $$(%_obj) layout.link
	$(RGBLINK) -n $*.sym -m $*.map -l layout.link -o $@ $(filter %.o,$^)
	$(RGBFIX) $($*_opt) $@
	tools/stadium $@


### LZ compression rules

%.lz: %
	tools/lzcomp -- $< $@


### Pokemon pic animation rules

gfx/pokemon/%/front.animated.2bpp: gfx/pokemon/%/front.2bpp gfx/pokemon/%/front.dimensions
	tools/pokemon_animation_graphics -o $@ $^
gfx/pokemon/%/front.animated.tilemap: gfx/pokemon/%/front.2bpp gfx/pokemon/%/front.dimensions
	tools/pokemon_animation_graphics -t $@ $^
gfx/pokemon/%/bitmask.asm: gfx/pokemon/%/front.animated.tilemap gfx/pokemon/%/front.dimensions
	tools/pokemon_animation -b $^ > $@
gfx/pokemon/%/frames.asm: gfx/pokemon/%/front.animated.tilemap gfx/pokemon/%/front.dimensions
	tools/pokemon_animation -f $^ > $@


### Pokemon and trainer sprite rules

gfx/pokemon/%/back.2bpp: rgbgfx += --columns
gfx/pokemon/%/back.2bpp: gfx/pokemon/%/back.png gfx/pokemon/%/normal.gbcpal
	$(RGBGFX) $(rgbgfx) --colors gbc:$(word 2,$^) -o $@ $<
gfx/pokemon/%/front.2bpp: gfx/pokemon/%/front.png gfx/pokemon/%/normal.gbcpal
	$(RGBGFX) $(rgbgfx) --colors gbc:$(word 2,$^) -o $@ $<
gfx/pokemon/%/normal.gbcpal: gfx/pokemon/%/front.gbcpal gfx/pokemon/%/back.gbcpal
	tools/gbcpal $(tools/gbcpal) $@ $^

gfx/trainers/%.2bpp: rgbgfx += --columns
gfx/trainers/%.2bpp: gfx/trainers/%.png gfx/trainers/%.gbcpal
	$(RGBGFX) $(rgbgfx) --colors gbc:$(word 2,$^) -o $@ $<

# Egg does not have a back sprite, so it only uses front.gbcpal
gfx/pokemon/egg/front.2bpp: gfx/pokemon/egg/front.png gfx/pokemon/egg/front.gbcpal
gfx/pokemon/egg/front.2bpp: rgbgfx += --colors gbc:$(word 2,$^)

# Unown letters share one normal.gbcpal
unown_pngs := $(wildcard gfx/pokemon/unown_*/front.png) $(wildcard gfx/pokemon/unown_*/back.png)
$(foreach png, $(unown_pngs),\
	$(eval $(png:.png=.2bpp): $(png) gfx/pokemon/unown/normal.gbcpal))
gfx/pokemon/unown_%/back.2bpp: rgbgfx += --colors gbc:$(word 2,$^)
gfx/pokemon/unown_%/front.2bpp: rgbgfx += --colors gbc:$(word 2,$^)
gfx/pokemon/unown/normal.gbcpal: $(subst .png,.gbcpal,$(unown_pngs))
	tools/gbcpal $(tools/gbcpal) $@ $^


### Misc file-specific graphics rules

gfx/pokemon/egg/unused_front.2bpp: rgbgfx += --columns

gfx/pokemon/spearow/normal.gbcpal: tools/gbcpal += --reverse
gfx/pokemon/fearow/normal.gbcpal: tools/gbcpal += --reverse
gfx/pokemon/farfetch_d/normal.gbcpal: tools/gbcpal += --reverse
gfx/pokemon/hitmonlee/normal.gbcpal: tools/gbcpal += --reverse
gfx/pokemon/scyther/normal.gbcpal: tools/gbcpal += --reverse
gfx/pokemon/jynx/normal.gbcpal: tools/gbcpal += --reverse
gfx/pokemon/porygon/normal.gbcpal: tools/gbcpal += --reverse
gfx/pokemon/porygon2/normal.gbcpal: tools/gbcpal += --reverse

gfx/trainers/swimmer_m.gbcpal: tools/gbcpal += --reverse

gfx/new_game/shrink1.2bpp: rgbgfx += --columns
gfx/new_game/shrink2.2bpp: rgbgfx += --columns

gfx/mail/dragonite.1bpp: tools/gfx += --remove-whitespace
gfx/mail/large_note.1bpp: tools/gfx += --remove-whitespace
gfx/mail/surf_mail_border.1bpp: tools/gfx += --remove-whitespace
gfx/mail/flower_mail_border.1bpp: tools/gfx += --remove-whitespace
gfx/mail/litebluemail_border.1bpp: tools/gfx += --remove-whitespace

gfx/pokedex/pokedex.2bpp: tools/gfx += --trim-whitespace
gfx/pokedex/pokedex_sgb.2bpp: tools/gfx += --trim-whitespace
gfx/pokedex/question_mark.2bpp: rgbgfx += --columns
gfx/pokedex/slowpoke.2bpp: tools/gfx += --trim-whitespace

gfx/pokegear/pokegear.2bpp: rgbgfx += --trim-end 2
gfx/pokegear/pokegear_sprites.2bpp: tools/gfx += --trim-whitespace

gfx/mystery_gift/mystery_gift.2bpp: tools/gfx += --trim-whitespace

gfx/title/crystal.2bpp: tools/gfx += --interleave --png=$<
gfx/title/old_fg.2bpp: tools/gfx += --interleave --png=$<
gfx/title/logo.2bpp: rgbgfx += --trim-end 4

gfx/trade/ball.2bpp: tools/gfx += --remove-whitespace
gfx/trade/game_boy.2bpp: tools/gfx += --remove-duplicates --preserve=0x23,0x27
gfx/trade/game_boy_cable.2bpp: gfx/trade/game_boy.2bpp gfx/trade/link_cable.2bpp ; cat $^ > $@

gfx/slots/slots_1.2bpp: tools/gfx += --trim-whitespace
gfx/slots/slots_2.2bpp: tools/gfx += --interleave --png=$<
gfx/slots/slots_3.2bpp: tools/gfx += --interleave --png=$< --remove-duplicates --keep-whitespace --remove-xflip

gfx/card_flip/card_flip_1.2bpp: tools/gfx += --trim-whitespace
gfx/card_flip/card_flip_2.2bpp: tools/gfx += --remove-whitespace

gfx/battle_anims/angels.2bpp: tools/gfx += --trim-whitespace
gfx/battle_anims/beam.2bpp: tools/gfx += --remove-xflip --remove-yflip --remove-whitespace
gfx/battle_anims/bubble.2bpp: tools/gfx += --trim-whitespace
gfx/battle_anims/charge.2bpp: tools/gfx += --trim-whitespace
gfx/battle_anims/egg.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/explosion.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/hit.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/horn.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/lightning.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/misc.2bpp: tools/gfx += --remove-duplicates --remove-xflip
gfx/battle_anims/noise.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/objects.2bpp: tools/gfx += --remove-whitespace --remove-xflip

gfx/battle_anims/reflect.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/rocks.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/skyattack.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/status.2bpp: tools/gfx += --remove-whitespace

gfx/battle_anims/battle_balls/pokeball.2bpp: tools/gfx += --remove-xflip --keep-whitespace
gfx/battle_anims/battle_balls/greatball.2bpp: tools/gfx += --remove-xflip --keep-whitespace
gfx/battle_anims/battle_balls/ultraball.2bpp: tools/gfx += --remove-xflip --keep-whitespace
gfx/battle_anims/battle_balls/masterball.2bpp: tools/gfx += --remove-xflip --keep-whitespace

gfx/battle_anims/battle_balls/fastball.2bpp: tools/gfx += --remove-xflip --keep-whitespace
gfx/battle_anims/battle_balls/loveball.2bpp: tools/gfx += --remove-xflip --keep-whitespace
gfx/battle_anims/battle_balls/lureball.2bpp: tools/gfx += --remove-xflip --keep-whitespace
gfx/battle_anims/battle_balls/moonball.2bpp: tools/gfx += --remove-xflip --keep-whitespace
gfx/battle_anims/battle_balls/heavyball.2bpp: tools/gfx += --remove-xflip --keep-whitespace
gfx/battle_anims/battle_balls/friendball.2bpp: tools/gfx += --remove-xflip --keep-whitespace
gfx/battle_anims/battle_balls/levelball.2bpp: tools/gfx += --remove-xflip --keep-whitespace
gfx/battle_anims/battle_balls/parkball.2bpp: tools/gfx += --remove-xflip --keep-whitespace
gfx/battle_anims/battle_balls/premierball.2bpp: tools/gfx += --remove-xflip --keep-whitespace
gfx/battle_anims/battle_balls/gsball.2bpp: tools/gfx += --remove-xflip --keep-whitespace


# gfx/player/chris.2bpp: rgbgfx += --columns
# gfx/player/chris_back.2bpp: rgbgfx += --columns

# gfx/player/kris.2bpp: rgbgfx += --columns
# gfx/player/kris_back.2bpp: rgbgfx += --columns


gfx/player/player_front/ash.2bpp: rgbgfx += --columns
gfx/player/player_back/ash_back.2bpp: rgbgfx += --columns

gfx/player/player_front/old_misty.2bpp: rgbgfx += --columns
gfx/player/player_back/old_misty_back.2bpp: rgbgfx += --columns

gfx/player/player_front/brock.2bpp: rgbgfx += --columns
gfx/player/player_back/brock_back.2bpp: rgbgfx += --columns

gfx/player/player_front/gary.2bpp: rgbgfx += --columns
gfx/player/player_back/gary_back.2bpp: rgbgfx += --columns

gfx/player/player_front/pikachu.2bpp: rgbgfx += --columns
gfx/player/player_back/pikachu_back.2bpp: rgbgfx += --columns

gfx/player/player_back/prof_oak_back.2bpp: rgbgfx += --columns
gfx/player/player_back/dude_back.2bpp: rgbgfx += --columns
gfx/player/player_back/old_dude_back.2bpp: rgbgfx += --columns

gfx/trainer_card/ash_card.2bpp: rgbgfx += --columns
gfx/trainer_card/old_misty_card.2bpp: rgbgfx += --columns
gfx/trainer_card/brock_card.2bpp: rgbgfx += --columns
gfx/trainer_card/gary_card.2bpp: rgbgfx += --columns
gfx/trainer_card/pikachu_card.2bpp: rgbgfx += --columns


gfx/trainer_card/kanto_leaders.2bpp: tools/gfx += --trim-whitespace
gfx/trainer_card/johto_leaders.2bpp: tools/gfx += --trim-whitespace
gfx/trainer_card/johto_e4.2bpp: tools/gfx += --trim-whitespace

gfx/overworld/chris_fish.2bpp: tools/gfx += --trim-whitespace
gfx/overworld/kris_fish.2bpp: tools/gfx += --trim-whitespace

gfx/sprites/big_onix.2bpp: tools/gfx += --remove-whitespace --remove-xflip

gfx/font/unused_bold_font.1bpp: tools/gfx += --trim-whitespace

gfx/sgb/sgb_border.2bpp: tools/gfx += --trim-whitespace
gfx/sgb/sgb_border.sgb.tilemap: gfx/sgb/sgb_border.bin ; tr < $< -d '\000' > $@

gfx/mobile/ascii_font.2bpp: tools/gfx += --trim-whitespace
gfx/mobile/dialpad.2bpp: tools/gfx += --trim-whitespace
gfx/mobile/dialpad_cursor.2bpp: tools/gfx += --trim-whitespace
gfx/mobile/electro_ball.2bpp: tools/gfx += --remove-duplicates --remove-xflip --preserve=0x39
gfx/mobile/mobile_splash.2bpp: tools/gfx += --remove-duplicates --remove-xflip
gfx/mobile/card.2bpp: tools/gfx += --trim-whitespace
gfx/mobile/card_2.2bpp: tools/gfx += --trim-whitespace
gfx/mobile/card_folder.2bpp: tools/gfx += --trim-whitespace
gfx/mobile/phone_tiles.2bpp: tools/gfx += --remove-whitespace
gfx/mobile/pichu_animated.2bpp: tools/gfx += --trim-whitespace
gfx/mobile/stadium2_n64.2bpp: tools/gfx += --trim-whitespace


### Catch-all graphics rules

%.2bpp: %.png
	$(RGBGFX) $(rgbgfx) -o $@ $<
	$(if $(tools/gfx),\
		tools/gfx $(tools/gfx) -o $@ $@ || $$($(RM) $@ && false))

%.1bpp: %.png
	$(RGBGFX) $(rgbgfx) --depth 1 -o $@ $<
	$(if $(tools/gfx),\
		tools/gfx $(tools/gfx) --depth 1 -o $@ $@ || $$($(RM) $@ && false))

%.gbcpal: %.png
	$(RGBGFX) -p $@ $<
	tools/gbcpal $(tools/gbcpal) $@ $@ || $$($(RM) $@ && false)

%.dimensions: %.png
	tools/png_dimensions $< $@
