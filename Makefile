DIS=dis
DIS_INCLUDE=inc
ifneq ($(DEBUG),)
DIS_DEBUG=-x -a1
else
DIS_DEBUG=
endif
COLUMNS=120

# build tools
RUN68=run68
XPATH=./misc/
HAS=$(RUN68) $(XPATH)has.x
HLK=$(RUN68) $(XPATH)hlk.r

.PHONY: all
all: \
	iplrom/iplrom30.s \
	iplrom/iplromxv.s \
	human302/human.s \
	human302/commando.s \
	human302/cmd.s \
	human302/sys/float2.s \
	human302/bin/attrib.s \
	human302/bin/backup.s \
	human302/bin/bind.s \
	human302/bin/cache.s \
	human302/bin/chkdsk.s \
	human302/bin/copyall.s \
	human302/bin/drive.s \
	human302/bin/fc.s \
	human302/bin/find.s \
	human302/bin/key.s \
	human302/bin/more.s \
	human302/bin/pr.s \
	human302/bin/process.s \
	human302/bin/sort.s \
	human302/bin/subst.s \
	human302/bin/sys.s \
	human302/bin/tree.s \
	human302/bin/where.s \
	misc/has.s \
	misc/hlk.s \
	misc/db.s \
	sound/opmdrv3.s \
	sound/mopmdrv.s \
	sound/pcm8/0.48b/pcm8.s \
	sound/mxdrv/mxp.s \
	sound/mxdrv/mdxp.s \
	sound/mxdrv/mxc.s \
	sound/mxdrv/2.06+15/mxdrv.s \
	sound/mxdrv/2.06+162_03/mxdrv16x.s \
	sound/mxdrv/2.06+16_Rel.1/mxdrv16.s \
	sound/mxdrv/2.06+16_Rel.2/mxdrv16.s \
	sound/mxdrv/2.06+16_Rel.3/mxdrv16.s \
	sound/mxdrv/2.06+16_Rel.3/mxdrv30.s \
	sound/mxdrv/2.06+16_Rel2++/mxdrvpp.s \
	sound/mxdrv/2.06+17_Rel.X5-S/mxdrv17.s

.PHONY: translations
translations: \
	en/human302/bin/bind.x \
	en/human302/bin/process.x \
	en/human302/sys/float2.x \
	en/sound/mxdrv/mxc.x \
	en/sound/mxdrv/mxp.x \
	en/sound/mxdrv/mdxp.x \
	en/sound/mxdrv/hlk.x \
	en/sound/mxdrv/2.06+17_Rel.X5-S/mxdrv17.x

en/%.s: %.s en/%.sed
	sed -f $(patsubst %.s,%.sed,$@) < $< > $@

en/%.sed: %.en.strings xlate
	mkdir -p $(shell dirname $@)
	cat $< | ./xlate > $@

en/%.x: en/%.o
	$(HLK) $< -o $@

en/%.o: en/%.s
	$(HAS) $< -o $@

%.s: %.[xr] %.lab
	dis_include=$(DIS_INCLUDE) $(DIS) $(DIS_DEBUG) -b2 -h -m68000 --sp -q1 -B -M -o$(COLUMNS) -g$(patsubst %.s,%.lab,$@) --overwrite $< $@
	sed -i -f const.sed -f clean-s.sed $@

# Useful for new .x files
%.new.s: %.[xr]
	dis_include=$(DIS_INCLUDE) $(DIS) $(DIS_DEBUG) -b2 -h -m68000 --sp -q1 -B -M -o$(COLUMNS) -e$(patsubst %.s,%.lab,$@) --overwrite $< $@
	sed -i -f const.sed -f clean-s.sed $@

sound/mxdrv/%.s: sound/mxdrv/%.[xr] sound/mxdrv/%.lab
	dis_include=$(DIS_INCLUDE) $(DIS) $(DIS_DEBUG) -h -k -m68030 -q1 -B -M -w16 -o120 -g"$(patsubst %.s,%.lab,$@)" --overwrite "$<" "$@"
	sed -i -f const.sed -f clean-s.sed $@

human302/*/%.s: human302/*/%.[xr] human302/*/%.lab
	dis_include=$(DIS_INCLUDE) $(DIS) $(DIS_DEBUG) -h -k -m68000 -q1 -B -M -w16 -o120 -g"$(patsubst %.s,%.lab,$@)" --overwrite "$<" "$@"
	sed -i -f const.sed -f clean-s.sed $@

human302/%.s: human302/%.[xr] human302/%.lab
	dis_include=$(DIS_INCLUDE) $(DIS) $(DIS_DEBUG) -h -k -m68000 -q1 -B -M -w16 -o120 -g"$(patsubst %.s,%.lab,$@)" --overwrite "$<" "$@"
	sed -i -f const.sed -f clean-s.sed $@

misc/%.s: misc/%.[xr] misc/%.lab
	dis_include=$(DIS_INCLUDE) $(DIS) $(DIS_DEBUG) -h -k -m68000 -q1 -B -M -w16 -o120 -g"$(patsubst %.s,%.lab,$@)" --overwrite "$<" "$@"
	sed -i -f const.sed -f clean-s.sed $@

sound/pcm8/0.48b/%.s: sound/pcm8/0.48b/%.[xr] sound/pcm8/0.48b/%.lab
	dis_include=$(DIS_INCLUDE) $(DIS) $(DIS_DEBUG) -h -k -m68030 -q1 -B -M -w16 -o120 -g"$(patsubst %.s,%.lab,$@)" --overwrite "$<" "$@"
	sed -i -f const.sed -f clean-s.sed $@

iplrom/iplrom30.s: iplrom/iplrom30.dat iplrom/iplrom30.lab iplrom/iplrom30.tab
	dis_include=$(DIS_INCLUDE) $(DIS) $(DIS_DEBUG) -b2 -h -i -m68030 -m68882 -zfe0000,ff0038 -q1 -B -M -w16 --exclude-fefunc-mac -Tiplrom/iplrom30.tab -giplrom/iplrom30.lab --overwrite $< $@
	sed -i -f const.sed -f clean-s.sed $@

iplrom/iplromxv.s: iplrom/iplromxv.dat iplrom/iplromxv.lab iplrom/iplromxv.tab
	dis_include=$(DIS_INCLUDE) $(DIS) $(DIS_DEBUG) -b2 -h -i -m68030 -m68882 -zfe0000,ff0010 -q1 -B -M -w16 --exclude-fefunc-mac -Tiplrom/iplromxv.tab -giplrom/iplromxv.lab --overwrite $< $@
	sed -i -f const.sed -f clean-s.sed $@

sound/mxdrv/mdxp.s: sound/mxdrv/mdxp.r sound/mxdrv/mdxp.lab
	dis_include=$(DIS_INCLUDE) $(DIS) $(DIS_DEBUG) -b2 -h -m68000 --sp -q1 -B -M -o$(COLUMNS) -g$(patsubst %.s,%.lab,$@) --overwrite $< $@
	sed -i -f const.sed -f clean-s.sed $@

human302/human.s: human302/human.sys human302/human.lab
	dis_include=$(DIS_INCLUDE) $(DIS) $(DIS_DEBUG) -b2 -h -m68030 --sp -q1 -B -M -o$(COLUMNS) -g$(patsubst %.s,%.lab,$@) --overwrite $< $@
	sed -i -f const.sed -f clean-s.sed $@

sound/opmdrv3.s: sound/opmdrv3.x sound/opmdrv3.lab sound/opmdrv3.tab
	dis_include=$(DIS_INCLUDE) $(DIS) $(DIS_DEBUG) -b2 -h -m68000 --sp -q1 -B -M -o$(COLUMNS) -w16 -g$(patsubst %.s,%.lab,$@) -T$(patsubst %.s,%.tab,$@) --overwrite $< $@
	sed -i -f const.sed -f clean-s.sed $@

sound/mopmdrv.s: sound/mopmdrv.x sound/mopmdrv.lab sound/mopmdrv.tab
	dis_include=$(DIS_INCLUDE) $(DIS) $(DIS_DEBUG) -b2 -h -m68000 --sp -q1 -B -M -o$(COLUMNS) -w16 -g$(patsubst %.s,%.lab,$@) -T$(patsubst %.s,%.tab,$@) --overwrite $< $@
	sed -i -f const.sed -f clean-s.sed $@

xlate: xlate.c
	gcc xlate.c -o xlate

sclean:
	find . -type f -name "*.s" -exec rm -f {} \;

clean:
	find . -type f -name '*.o' -exec rm -f {} \;
	find . -type f -name '*.sed' -exec rm -f {} \;
