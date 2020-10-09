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
XPATH=./
HAS=$(RUN68) $(XPATH)has.x
HLK=$(RUN68) $(XPATH)hlk.r

.PHONY: all
all: \
	iplrom30.s \
	iplromxv.s \
	human.s \
	commando.s \
	cmd.s \
	process.s \
	has.s \
	hlk.s \
	bind.s \
	opmdrv3.s \
	mopmdrv.s \
	pcm8.s \
	mxdrv/mxp.s \
	mxdrv/mdxp.s \
	mxdrv/mxc.s \
	mxdrv/2.06+15/mxdrv.s \
	mxdrv/2.06+162_03/mxdrv16x.s \
	mxdrv/2.06+16_Rel.1/mxdrv16.s \
	mxdrv/2.06+16_Rel.2/mxdrv16.s \
	mxdrv/2.06+16_Rel.3/mxdrv16.s \
	mxdrv/2.06+16_Rel.3/mxdrv30.s \
	mxdrv/2.06+16_Rel2++/mxdrvpp.s \
	mxdrv/2.06+17_Rel.X5-S/mxdrv17.s

translations: \
	en/bind.x \
	en/process.x \
	en/mxdrv/mxc.x \
	en/mxdrv/mxp.x \
	en/mxdrv/2.06+17_Rel.X5-S/mxdrv17.x

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

mxdrv/%.s: mxdrv/%.[xr] mxdrv/%.lab
	dis_include=$(DIS_INCLUDE) $(DIS) $(DIS_DEBUG) -h -k -m68030 -q1 -B -M -w16 -o120 -g"$(patsubst %.s,%.lab,$@)" --overwrite "$<" "$@"
	sed -i -f const.sed -f clean-s.sed $@

iplrom30.s: iplrom30.dat iplrom30.lab iplrom30.tab
	dis_include=$(DIS_INCLUDE) $(DIS) $(DIS_DEBUG) -b2 -h -i -m68030 -m68882 -zfe0000,ff0038 -q1 -B -M -w16 --exclude-fefunc-mac -Tiplrom30.tab -giplrom30.lab --overwrite $< $@
	sed -i -f const.sed -f clean-s.sed $@

iplromxv.s: iplromxv.dat iplromxv.lab iplromxv.tab
	dis_include=$(DIS_INCLUDE) $(DIS) $(DIS_DEBUG) -b2 -h -i -m68030 -m68882 -zfe0000,ff0010 -q1 -B -M -w16 --exclude-fefunc-mac -Tiplromxv.tab -giplromxv.lab --overwrite $< $@
	sed -i -f const.sed -f clean-s.sed $@

mdxp.s: mdxp.r mdxp.lab
	dis_include=$(DIS_INCLUDE) $(DIS) $(DIS_DEBUG) -b2 -h -m68000 --sp -q1 -B -M -o$(COLUMNS) -g$(patsubst %.s,%.lab,$@) --overwrite $< $@
	sed -i -f const.sed -f clean-s.sed $@

human.s: human.sys human.lab
	dis_include=$(DIS_INCLUDE) $(DIS) $(DIS_DEBUG) -b2 -h -m68030 --sp -q1 -B -M -o$(COLUMNS) -g$(patsubst %.s,%.lab,$@) --overwrite $< $@
	sed -i -f const.sed -f clean-s.sed $@

opmdrv3.s: opmdrv3.x opmdrv3.lab opmdrv3.tab
	dis_include=$(DIS_INCLUDE) $(DIS) $(DIS_DEBUG) -b2 -h -m68000 --sp -q1 -B -M -o$(COLUMNS) -w16 -g$(patsubst %.s,%.lab,$@) -T$(patsubst %.s,%.tab,$@) --overwrite $< $@
	sed -i -f const.sed -f clean-s.sed $@

mopmdrv.s: mopmdrv.x mopmdrv.lab mopmdrv.tab
	dis_include=$(DIS_INCLUDE) $(DIS) $(DIS_DEBUG) -b2 -h -m68000 --sp -q1 -B -M -o$(COLUMNS) -w16 -g$(patsubst %.s,%.lab,$@) -T$(patsubst %.s,%.tab,$@) --overwrite $< $@
	sed -i -f const.sed -f clean-s.sed $@

xlate: xlate.c
	gcc xlate.c -o xlate

sclean:
	find . -type f -name "*.s" -exec rm -f {} \;

clean:
	rm -f *.o mxdrv/*.o mxdrv/*/*.o
	rm -f en/*.o en/mxdrv/*.o en/mxdrv/*/*.o
	rm -f en/*.sed en/mxdrv/*.sed en/mxdrv/*/*.sed
