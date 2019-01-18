DIS=dis
DIS_INCLUDE=inc
ifneq ($(DEBUG),)
DIS_DEBUG=-x -a1
else
DIS_DEBUG=
endif

all: iplrom30.s iplromxv.s human.s process.s bind.s mxdrv17.s mxdrv16.s mopmdrv.s pcm8.s mxp.s mdxp.s

translations: mxdrv17.en.s

iplrom30.s: iplrom30.dat iplrom30.lab iplrom30.tab
	dis_include=$(DIS_INCLUDE) $(DIS) $(DIS_DEBUG) -b2 -h -i -m68030 -m68882 -zfe0000,ff0038 -q -p -B -M --exclude-fefunc-mac -Tiplrom30.tab -giplrom30.lab --overwrite $< $@
	sed -i -e 's/;  Code Generate date .\+/;/' $@
iplromxv.s: iplromxv.dat iplromxv.lab iplromxv.tab
	dis_include=$(DIS_INCLUDE) $(DIS) $(DIS_DEBUG) -b2 -h -i -m68030 -m68882 -zfe0000,ff0010 -q -p -B -M --exclude-fefunc-mac -Tiplromxv.tab -giplromxv.lab --overwrite $< $@
	sed -i -e 's/;  Code Generate date .\+/;/' $@

%.en.s: %.s %.en.sed
	sed -f $(patsubst %.s,%.sed,$@) < $< > $@

%.s: %.x %.lab
	dis_include=$(DIS_INCLUDE) $(DIS) $(DIS_DEBUG) -b2 -h -m68000 --sp -q1 -B -M -p -o120 -g$(patsubst %.s,%.lab,$@) --overwrite $< $@
	sed -i -e 's/;  Code Generate date .\+/;/' $@

mdxp.s: mdxp.r mdxp.lab
	dis_include=$(DIS_INCLUDE) $(DIS) $(DIS_DEBUG) -b2 -h -m68000 --sp -q1 -B -M -p -o120 -g$(patsubst %.s,%.lab,$@) --overwrite $< $@
	sed -i -e 's/;  Code Generate date .\+/;/' $@

human.s: human.sys human.lab
	dis_include=$(DIS_INCLUDE) $(DIS) $(DIS_DEBUG) -b2 -h -m68030 --sp -q1 -B -M -p -o120 -g$(patsubst %.s,%.lab,$@) --overwrite $< $@
	sed -i -e 's/;  Code Generate date .\+/;/' $@

clean:
	rm -f *.s
