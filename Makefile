DIS=dis
DIS_INCLUDE=inc
SJIS2UTF8=sjis2utf8.real
ifneq ($(DEBUG),)
DIS_DEBUG=-x -a1
else
DIS_DEBUG=
endif

all: iplrom30.s mxdrv17.s mxdrv17.en.s pcm8.s mxp.s

iplrom30.s: iplrom30.dat iplrom30.lab iplrom30.tab
	dis_include=$(DIS_INCLUDE) $(DIS) $(DIS_DEBUG) -b2 -h -i -m68030 -m68882 -zfe0000,ff0038 -q -p --exclude-fefunc-mac -Tiplrom30.tab -giplrom30.lab --overwrite iplrom30.dat | $(SJIS2UTF8) > $@

mxdrv17.s: mxdrv17.x mxdrv17.lab
	dis_include=$(DIS_INCLUDE) $(DIS) $(DIS_DEBUG) -b2 -h -m68000 --sp -q1 -B -M -p -o120 -g$(patsubst %.s,%.lab,$@) --overwrite $< $@
mxdrv17.en.s: mxdrv17.s mxdrv17.sed
	sed -f mxdrv17.sed < $< > $@

pcm8.s: pcm8.x pcm8.lab
	dis_include=$(DIS_INCLUDE) $(DIS) $(DIS_DEBUG) -b2 -h -m68000 --sp -q -p -g$(patsubst %.s,%.lab,$@) --overwrite $< $@

mxp.s: mxp.x mxp.lab
	dis_include=$(DIS_INCLUDE) $(DIS) $(DIS_DEBUG) -b2 -h -m68000 --sp -q -p -g$(patsubst %.s,%.lab,$@) --overwrite $< $@

clean:
	rm -f *.s
