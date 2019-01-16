DIS=dis
DIS_INCLUDE=inc
SJIS2UTF8=sjis2utf8.real
ifneq ($(DEBUG),)
DIS_DEBUG=-x -a1
else
DIS_DEBUG=
endif

all: iplrom30.s

iplrom30.s: iplrom30.dat iplrom30.lab iplrom30.tab
	dis_include=$(DIS_INCLUDE) dis $(DIS_DEBUG) -b2 -h -m68030 -m68882 -zfe0000,ff0038 -q -p --exclude-fefunc-mac -Tiplrom30.tab -giplrom30.lab --overwrite iplrom30.dat | $(SJIS2UTF8) > $@

clean:
	rm *.s
