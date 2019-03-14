;=============================================
;  Filename opmdrv3.x
;  Time Stamp Tue Mar  3 00:00:00 1992
;
;  Base address 000000
;  Exec address 006bde
;  Text size    0074b4 byte(s)
;  Data size    0049e2 byte(s)
;  Bss  size    00302e byte(s)
;  1910 Labels
;
;  Commandline dis  -b2 -h -m68000 --sp -q1 -B -M -o120 -w16 -gopmdrv3.lab -Topmdrv3.tab --overwrite opmdrv3.x opmdrv3.s
;          DIS version 3.16
;=============================================

	.include	inc/doscall.mac
	.include	inc/iocscall.mac
	.include	inc/fefunc.mac

	.cpu	68000

	.text

OPMStruct:
	.dc.l	MIDIStruct
OPMMode:
	.dc.w	$8020
OPMRoutine1:
	.dc.l	L0001ea
OPMRoutine2:
	.dc.l	L000228
OPMStr:
	.dc.b	'OPM     '
MIDIStruct:
	.dc.l	MIDIAStruct
MIDIMode:
	.dc.w	$8020
MIDIRoutine1:
	.dc.l	L0001ea
MIDIRoutine2:
	.dc.l	L000228
MIDIStr:
	.dc.b	'MIDI    '
MIDITable:
	.dc.l	$00000000
	.dc.l	L006f64
	.dc.l	L00021a
	.dc.l	L00021a
	.dc.l	L00021a
	.dc.l	L00021a
	.dc.l	L00021a
	.dc.l	L00021a
	.dc.l	L00021a
	.dc.l	L0005fa
	.dc.l	L0005fa
	.dc.l	L000220
	.dc.l	L000220
	.dc.l	L00021a
MIDIAStruct:
	.dc.l	MIDIBStruct
MIDIAMode:
	.dc.w	$8000
MIDIARoutine1:
	.dc.l	L0001f2
MIDIARoutine2:
	.dc.l	L00023a
MIDIAStr:
	.dc.b	'MIDIA   '
MIDIATable:
	.dc.l	$00000000
	.dc.l	L006f64
	.dc.l	L00021a
	.dc.l	L00021a
	.dc.l	L00021a
	.dc.l	L000354
	.dc.l	L00039c
	.dc.l	L000416
	.dc.l	L000442
	.dc.l	L0004b8
	.dc.l	L0004b8
	.dc.l	L00046e
	.dc.l	L000220
	.dc.l	L00021a
MIDIBStruct:
	.dc.l	MIDIAEStruct
MIDIBMode:
	.dc.w	$8000
MIDIBRoutine1:
	.dc.l	L0001fa
MIDIBRoutine2:
	.dc.l	L000254
MIDIBStr:
	.dc.b	'MIDIB   '
MIDIBTable:
	.dc.l	$00000000
	.dc.l	L006f64
	.dc.l	L00021a
	.dc.l	L00021a
	.dc.l	L00021a
	.dc.l	L0003ca
	.dc.l	L0003ca
	.dc.l	L000220
	.dc.l	L000442
	.dc.l	L000584
	.dc.l	L000584
	.dc.l	L00046e
	.dc.l	L000220
	.dc.l	L00021a
MIDIAEStruct:
	.dc.l	MIDIBEStruct
MIDIAEMode:
	.dc.w	$8020
MIDIAERoutine1:
	.dc.l	L000202
MIDIAERoutine2:
	.dc.l	L00026e
MIDIAEStr:
	.dc.b	'MIDIAE  '
MIDIAETable:
	.dc.l	$00000000
	.dc.l	L006f64
	.dc.l	L00021a
	.dc.l	L00021a
	.dc.l	L00021a
	.dc.l	L00021a
	.dc.l	L00021a
	.dc.l	L00021a
	.dc.l	L000442
	.dc.l	L0004d2
	.dc.l	L0004d2
	.dc.l	L00046e
	.dc.l	L000220
	.dc.l	L00021a
MIDIBEStruct:
	.dc.l	PCMStruct
MIDIBEMode:
	.dc.w	$8020
MIDIBERoutine1:
	.dc.l	L00020a
MIDIBERoutine2:
	.dc.l	L000288
MIDIBEStr:
	.dc.b	'MIDIBE  '
MIDIBETable:
	.dc.l	$00000000
	.dc.l	L006f64
	.dc.l	L00021a
	.dc.l	L00021a
	.dc.l	L00021a
	.dc.l	L00021a
	.dc.l	L00021a
	.dc.l	L00021a
	.dc.l	L000442
	.dc.l	L0005a4
	.dc.l	L0005a4
	.dc.l	L00046e
	.dc.l	L000220
	.dc.l	L00021a
PCMStruct:
	.dc.l	$ffffffff
PCMMode:
	.dc.w	$c020
PCMRoutine1:
	.dc.l	L000212
PCMRoutine2:
	.dc.l	L0002a2
PCMString:
	.dc.b	'PCM     '
PCMTable:
	.dc.l	$00000000
	.dc.l	L006f64
	.dc.l	L00021a
	.dc.l	L00021a
	.dc.l	L00032e
	.dc.l	L0002d2
	.dc.l	L000220
	.dc.l	L000220
	.dc.l	L000220
	.dc.l	L0002de
	.dc.l	L0002de
	.dc.l	L000220
	.dc.l	L000220
	.dc.l	L00033e
L0001ea:
	move.l	a5,(MIDITable)
	rts

L0001f2:
	move.l	a5,(MIDIATable)
	rts

L0001fa:
	move.l	a5,(MIDIBTable)
	rts

L000202:
	move.l	a5,(MIDIAETable)
	rts

L00020a:
	move.l	a5,(MIDIBETable)
	rts

L000212:
	move.l	a5,(PCMTable)
	rts

L00021a:
	move.w	#$5003,d0
	rts

L000220:
	clr.w	d0
	rts

L000224:
	moveq.l	#$01,d0
	rts

L000228:
	movem.l	d0/a4-a5,-(sp)
	movea.l	(MIDITable),a5
	lea.l	($00000030).l,a4
	bra.s	L0002b2

L00023a:
	tst.b	(L0074c8)
	bne.s	L00021a
	movem.l	d0/a4-a5,-(sp)
	movea.l	(MIDIATable),a5
	lea.l	($0000007e).l,a4
	bra.s	L0002b2

L000254:
	tst.b	(L0074c8)
	bne.s	L00021a
	movem.l	d0/a4-a5,-(sp)
	movea.l	(MIDIBTable),a5
	lea.l	($000000cc).l,a4
	bra.s	L0002b2

L00026e:
	tst.b	(L0074c8)
	bne.s	L00021a
	movem.l	d0/a4-a5,-(sp)
	movea.l	(MIDIAETable),a5
	lea.l	($0000011a).l,a4
	bra.s	L0002b2

L000288:
	tst.b	(L0074c8)
	bne.s	L00021a
	movem.l	d0/a4-a5,-(sp)
	movea.l	(MIDIBETable),a5
	lea.l	($00000168).l,a4
	bra.s	L0002b2

L0002a2:
	movem.l	d0/a4-a5,-(sp)
	movea.l	(PCMTable),a5
	lea.l	($000001b6).l,a4
L0002b2:
	moveq.l	#$00,d0
	move.b	($0002,a5),d0
	add.w	d0,d0
	add.w	d0,d0
	adda.l	d0,a4
	movea.l	(a4),a4
	jsr	(a4)
	move.b	d0,($0003,a5)
	lsr.w	#8,d0
	move.b	d0,($0004,a5)
	movem.l	(sp)+,d0/a4-a5
	rts

L0002d2:
	movem.l	d1-d2/a1-a2,-(sp)
	lea.l	(L006a44),a2
	bra.s	L0002e8

L0002de:
	movem.l	d1-d2/a1-a2,-(sp)
	lea.l	(L00694c),a2
L0002e8:
	jsr	(L006900)
	tst.l	d0
	beq.s	L0002fa
	bsr.w	L000490
	beq.s	L0002e8
	bra.s	L000326

L0002fa:
	move.b	#$01,(L006bc3)
	move.b	#$01,(L006bc7)
	move.l	($0012,a5),d2
	movea.l	($000e,a5),a1
	move.w	(L000352),d1
	jsr	(a2)
	bsr.w	L000490
	beq.s	L000326
	move.b	#$1a,(-$01,a1,d2.w)
L000326:
	movem.l	(sp)+,d1-d2/a1-a2
	clr.w	d0
	rts

L00032e:
	jsr	(L006900)
	movea.l	($000e,a5),a4
	move.b	d0,(a4)
	bra.w	L000220

L00033e:
	movea.l	($000e,a5),a4
	move.b	(a4)+,d0
	asl.w	#8,d0
	move.b	(a4)+,d0
	move.w	d0,(L000352)
	bra.w	L000220

L000352:
	.dc.w	$0403
L000354:
	movem.l	d0/a0-a2,-(sp)
	movea.l	($000e,a5),a0
	move.l	($0012,a5),d0
	beq.s	L000384
	movea.l	(L00784c),a1
	movea.l	(L007848),a2
L00036e:
	bsr.w	L000490
	bne.s	L00038c
	cmpa.l	a1,a2
	beq.s	L00038c
	move.b	(a1)+,(a0)+
	subq.l	#1,d0
	bne.s	L00036e
	move.l	a1,(L00784c)
L000384:
	movem.l	(sp)+,d0/a0-a2
	bra.w	L000220

L00038c:
	move.l	(L00783c),(L00784c)
	move.b	#$1a,(a0)
	bra.s	L000384

L00039c:
	movem.l	a0-a1,-(sp)
	tst.l	(L007844)
	beq.s	L0003be
	movea.l	(L007848),a0
	movea.l	(L00784c),a1
	cmpa.l	a0,a1
	beq.s	L0003be
	move.b	(a1),($000d,a5)
	bra.s	L0003c2

L0003be:
	clr.b	($000d,a5)
L0003c2:
	movem.l	(sp)+,a0-a1
	bra.w	L000220

L0003ca:
	movem.l	d0-d1/a0-a2,-(sp)
	movea.l	($000e,a5),a0
	move.l	($0012,a5),d0
	beq.s	L000400
	lea.l	(L00d9f0),a1
	lea.l	($0004,a1),a2
	move.w	(L000414),d1
L0003e8:
	cmp.w	(a1),d1
	beq.s	L000408
	move.b	(a2,d1.w),(a0)+
	addq.w	#1,d1
	andi.w	#$03ff,d1
	subq.l	#1,d0
	bne.s	L0003e8
	move.w	d1,(L000414)
L000400:
	movem.l	(sp)+,d0-d1/a0-a2
	bra.w	L000220

L000408:
	bsr.w	L000490
	beq.s	L0003e8
	move.b	#$1a,(a0)
	bra.s	L000400

L000414:
	.dc.w	$0000
L000416:
	movem.l	d1-d2,-(sp)
	tst.l	(L007844)
	beq.s	L00043a
	move.l	(L007848),d1
	move.l	(L00784c),d2
	cmp.l	d1,d2
	beq.s	L00043a
	movem.l	(sp)+,d1-d2
	bra.w	L000220

L00043a:
	movem.l	(sp)+,d1-d2
	bra.w	L000224

L000442:
	tst.w	(L007a30)
	bne.w	L000224
	move.l	(L007a20),d0
	move.l	d0,(L007840)
	move.l	(L007a1c),d0
	move.l	d0,(L00783c)
	move.l	d0,(L00784c)
	bra.w	L000220

L00046e:
	tst.b	(L0074c8)
	bne.w	L000220
	move.b	#$05,($00eafa03)
	btst.b	#$06,($00eafa09)
	bne.w	L000220
	moveq.l	#$01,d0
	rts

L000490:
	movem.l	d0-d1,-(sp)
	moveq.l	#$0c,d1
	IOCS	_BITSNS
	andi.b	#$02,d0
	movem.l	(sp)+,d0-d1
	rts

L0004a4:
	movem.l	d0-d1,-(sp)
	moveq.l	#$00,d1
	IOCS	_BITSNS
	andi.b	#$02,d0
	movem.l	(sp)+,d0-d1
	rts

L0004b8:
	movem.l	d0-d3/a0-a1,-(sp)
	movea.l	($000e,a5),a0
	move.l	($0012,a5),d2
	beq.w	L00056c
	lea.l	(L000570),a1
	moveq.l	#$00,d3
	bra.s	L000500

L0004d2:
	movem.l	d0-d3/a0-a1,-(sp)
	movea.l	($000e,a5),a0
	move.l	($0012,a5),d2
	beq.w	L00056c
	lea.l	(L000570),a1
	moveq.l	#$01,d3
L0004ea:
	cmpi.b	#$46,(a0)		;'F'
	bne.s	L0004f8
	cmpi.b	#$30,($0001,a0)		;'0'
	beq.s	L000500
L0004f8:
	addq.l	#1,a0
	subq.l	#1,d2
	bne.s	L0004ea
	bra.s	L00056c

L000500:
	move.b	(a0)+,d0
	cmpi.b	#$2a,d0			;'*'
	beq.s	L00055a
	cmpi.b	#$2f,d0			;'/'
	beq.s	L00055a
	cmpi.b	#$0d,d0
	beq.s	L000556
	cmpi.b	#$20,d0			;' '
	beq.s	L000560
	bcs.s	L000556
	tst.b	($0001,a1)
	bne.s	L000560
	bsr.w	L0005de
	tst.w	d0
	bmi.s	L000560
	addq.b	#1,(a1)
	btst.b	#$00,(a1)
	beq.s	L000538
	move.b	d0,($0002,a1)
	bra.s	L000560

L000538:
	move.b	($0002,a1),d1
	lsl.b	#4,d1
	add.b	d1,d0
	bsr.w	L0052f0
	tst.b	d3
	beq.s	L000560
	cmpi.b	#$f7,d0
	bne.s	L000560
	jsr	(L0049ce)
	bra.s	L000560

L000556:
	clr.w	(a1)
	bra.s	L000560

L00055a:
	move.b	#$01,($0001,a1)
L000560:
	subq.l	#1,d2
	bne.s	L000500
L000564:
	movem.l	(sp)+,d0-d3/a0-a1
	bra.w	L000220

L00056c:
	clr.l	(a1)
	bra.s	L000564

L000570:
	.dc.b	$00,$00,$00,$00
	.dc.b	'0123456789ABCDEF'
L000584:
	movem.l	d0-d1/a0,-(sp)
	movea.l	($000e,a5),a0
	move.l	($0012,a5),d1
	beq.s	L00059c
L000592:
	move.b	(a0)+,d0
	bsr.w	L0052f0
	subq.l	#1,d1
	bne.s	L000592
L00059c:
	movem.l	(sp)+,d0-d1/a0
	bra.w	L000220

L0005a4:
	movem.l	d0-d1/a0,-(sp)
	movea.l	($000e,a5),a0
	move.l	($0012,a5),d1
	beq.s	L0005d6
L0005b2:
	cmpi.b	#$f0,(a0)
	beq.s	L0005c0
	addq.l	#1,a0
	subq.l	#1,d1
	bne.s	L0005b2
	bra.s	L0005d6

L0005c0:
	move.b	(a0)+,d0
	bsr.w	L0052f0
	cmpi.b	#$f7,d0
	bne.s	L0005d2
	jsr	(L0049ce)
L0005d2:
	subq.l	#1,d1
	bne.s	L0005c0
L0005d6:
	movem.l	(sp)+,d0-d1/a0
	bra.w	L000220

L0005de:
	move.w	#$000f,d1
	cmpi.b	#$3a,d0			;':'
	bcs.s	L0005ec
	andi.b	#$df,d0
L0005ec:
	cmp.b	($04,a1,d1.w),d0
	beq.s	L0005f6
	dbra.w	d1,L0005ec
L0005f6:
	move.w	d1,d0
	rts

L0005fa:
	movem.l	d1-d7/a0-a6,-(sp)
	lea.l	(-$0200,sp),sp
	movea.l	($000e,a5),a4
	move.l	($0012,a5),d4
	beq.w	L0006aa
L00060e:
	subq.l	#1,d4
	bmi.w	L0006aa
	move.b	(a4)+,d0
	bmi.s	L00062a
	cmp.b	#$21,d0			;'!'
	bcs.s	L00060e
	cmp.b	#$29,d0			;')'
	beq.s	L00060e
	cmp.b	#$2f,d0			;'/'
	bne.s	L000646
L00062a:
	subq.l	#1,d4
	bmi.w	L0006aa
	move.b	(a4)+,d0
	cmp.b	#$09,d0
	beq.s	L00062a
	cmp.b	#$0e,d0
	bcc.s	L00062a
	clr.w	(L00073c)
	bra.s	L00060e

L000646:
	cmpi.b	#$30,d0			;'0'
	bcs.s	L00065c
	cmpi.b	#$3a,d0			;':'
	bcc.s	L00065c
	clr.w	(L00073c)
	bra.w	L000768

L00065c:
	cmp.b	#$28,d0			;'('
	beq.s	L00066e
	tst.w	(L00073c)
	beq.s	L00062a
	bra.w	L00129c

L00066e:
	subq.l	#1,d4
	bmi.w	L0006aa
	moveq.l	#$00,d0
	move.b	(a4)+,d0
	cmp.b	#$20,d0			;' '
	bcs.s	L00060e
	beq.s	L00066e
	cmp.b	#$23,d0			;'#'
	beq.w	L000e04
	cmp.b	#$2f,d0			;'/'
	beq.w	L000e04
	or.b	#$20,d0
	subi.b	#$61,d0			;'a'
	bmi.s	L00066e
	cmpi.b	#$1a,d0
	bcc.s	L00066e
	add.w	d0,d0
	add.w	d0,d0
	movea.l	(Table1,pc,d0.w),a0
	jmp	(a0)

L0006aa:
	clr.w	d0
	lea.l	($0200,sp),sp
	movem.l	(sp)+,d1-d7/a0-a6
	rts

Table1:
	.dc.l	L000ad2
	.dc.l	L000bce
	.dc.l	L0008e4
	.dc.l	L0009ae
	.dc.l	L00091a
	.dc.l	L000c16
	.dc.l	L000b86
	.dc.l	L000c82
	.dc.l	L000dee
	.dc.l	L000c98
	.dc.l	L000d10
	.dc.l	L000baa
	.dc.l	L000af6
	.dc.l	L000b62
	.dc.l	L000abc
	.dc.l	L000972
	.dc.l	L000cec
	.dc.l	L000d3c
	.dc.l	L000936
	.dc.l	L000a86
	.dc.l	L000bf2
	.dc.l	L0009e6
	.dc.l	L000a46
	.dc.l	L000cae
	.dc.l	L000c3a
	.dc.l	L000cd6
L00071e:
	subq.l	#1,a4
	addq.l	#1,d4
L000722:
	subq.l	#1,d4
	bmi.w	L0006aa
	move.b	(a4)+,d0
	cmp.b	#$29,d0			;')'
	beq.w	L00060e
	cmp.b	#$20,d0			;' '
	bcs.w	L00060e
	bra.s	L000722

L00073c:
	.dc.w	$0000
L00073e:
	movem.l	d0/a2,-(sp)
	lea.l	(a1),a2
L000744:
	move.b	(a2)+,d0
	beq.s	L000762
	cmp.b	#$2e,d0			;'.'
	beq.s	L00075e
	cmp.b	#$3a,d0			;':'
	beq.s	L00075a
	cmp.b	#$5c,d0			;'\'
	bne.s	L000744
L00075a:
	movea.l	a2,a1
	bra.s	L000744

L00075e:
	clr.b	(-$0001,a2)
L000762:
	movem.l	(sp)+,d0/a2
	rts

L000768:
	movem.l	d1-d3/d5/a0-a2,-(sp)
	subq.l	#1,a4
	addq.l	#1,d4
L000770:
	bsr.w	L001344
	andi.l	#$0000007f,d1
	cmpi.b	#$3d,d0			;'='
	beq.s	L000794
	subq.l	#1,a4
	addq.l	#1,d4
	bsr.w	L0012fa
	addq.l	#1,a4
	subq.l	#1,d4
	cmpi.b	#$3d,d0			;'='
	bne.w	L0008d0
L000794:
	bsr.w	L0012fa
	bcc.s	L0007a2
	cmpi.b	#$29,d0			;')'
	bne.w	L0008d0
L0007a2:
	lea.l	(L00e5f4),a1
	moveq.l	#$00,d2
L0007aa:
	move.b	(a4)+,d0
	subq.l	#1,d4
	bmi.s	L0007d6
	cmp.b	#$0d,d0
	beq.s	L0007d2
	cmp.b	#$1a,d0
	beq.s	L0007d6
	cmp.b	#$28,d0			;'('
	beq.w	L0008be
	move.b	d0,(a1)+
	addq.w	#1,d2
	cmpi.w	#$0074,d2		;'t'
	bcc.w	L0008d0
	bra.s	L0007aa

L0007d2:
	addq.l	#1,a4
	subq.l	#1,d4
L0007d6:
	clr.b	(a1)
	tst.w	d2
	beq.w	L0008d0
	bsr.w	L0004a4
	bne.w	L0008d0
	clr.w	-(sp)
	pea.l	(L00e5f4)
	DOS	_OPEN
	lea.l	($0006,sp),sp
	move.l	d0,d5
	bmi.s	L000876
	move.b	#$01,(L006bc6)
	move.w	d1,d3
	swap.w	d3
	move.w	#$0004,d3
	moveq.l	#$00,d2
	jsr	(L00675a)
	lea.l	(L007716),a1
	move.l	($000c,a1),d2
	cmpi.l	#$00000200,d2
	ble.w	L0008c4
	lea.l	(L00d5e0),a2
	lsl.w	#3,d1
	adda.w	d1,a2
	move.l	d2,-(sp)
	move.l	($0004,a1),-(sp)
	move.w	d5,-(sp)
	DOS	_READ
	lea.l	($000a,sp),sp
	move.l	d0,d2
	bmi.s	L00085e
	cmpi.l	#$00007fff,d2
	ble.s	L00084e
	move.l	#$00007fff,d2
L00084e:
	move.w	d2,(a2)
	move.l	($0004,a1),($0004,a2)
	add.l	d2,($0004,a1)
	sub.l	d2,($000c,a1)
L00085e:
	move.w	d5,-(sp)
	DOS	_CLOSE
	addq.l	#2,sp
	lea.l	(L00e5f4),a1
	bsr.w	L00073e
	swap.w	d3
	move.w	d3,d2
	bsr.w	L002e0c
L000876:
	clr.b	(L006bc6)
	move.b	(a4)+,d0
	subq.l	#1,d4
	beq.s	L0008d0
	bmi.s	L0008d0
	cmpi.b	#$2f,d0			;'/'
	beq.s	L0008a4
	cmpi.b	#$28,d0			;'('
	beq.s	L0008be
	cmpi.b	#$30,d0			;'0'
	bcs.s	L000876
	cmpi.b	#$3a,(a4)		;':'
	bcc.s	L000876
	subq.l	#1,a4
	addq.l	#1,d4
	bra.w	L000770

L0008a4:
	subq.l	#1,d4
	beq.s	L0008d0
	bmi.s	L0008d0
	cmpi.b	#$0d,(a4)+
	bne.s	L0008a4
	addq.l	#1,a4
	subq.l	#1,d4
	cmpi.l	#$00000001,d4
	bge.w	L000770
L0008be:
	subq.l	#1,a4
	addq.l	#1,d4
	bra.s	L0008d0

L0008c4:
	clr.b	(L006bc6)
	move.w	d5,-(sp)
	DOS	_CLOSE
	addq.l	#2,sp
L0008d0:
	moveq.l	#$00,d0
	movem.l	(sp)+,d1-d3/d5/a0-a2
	cmpi.l	#$00000003,d4
	bgt.w	L00060e
	bra.w	L0006aa

L0008e4:
	cmpi.b	#$6d,(a4)		;'m'
	beq.s	L00090c
	cmpi.b	#$4d,(a4)		;'M'
	beq.s	L00090c
	bsr.w	L001326
	bmi.w	L0006aa
	tst.l	d2
	bne.s	L000902
	move.l	#$01ffffff,d2
L000902:
	moveq.l	#$0b,d1
	bsr.w	L0013ac
	bra.w	L00060e

L00090c:
	addq.l	#1,a4
	subq.l	#1,d4
	moveq.l	#$36,d1			;'6'
	bsr.w	L0013ac
	bra.w	L00060e

L00091a:
	bsr.w	L001326
	bmi.w	L0006aa
	tst.l	d2
	bne.s	L00092c
	move.l	#$01ffffff,d2
L00092c:
	moveq.l	#$1a,d1
	bsr.w	L0013ac
	bra.w	L00060e

L000936:
	cmpi.b	#$6d,(a4)		;'m'
	beq.s	L00095e
	cmpi.b	#$4d,(a4)		;'M'
	beq.s	L00095e
	bsr.w	L001326
	bmi.w	L0006aa
	tst.l	d2
	bne.s	L000954
	move.l	#$01ffffff,d2
L000954:
	moveq.l	#$0a,d1
	bsr.w	L0013ac
	bra.w	L00060e

L00095e:
	addq.l	#1,a4
	subq.l	#1,d4
	bsr.w	L001344
	move.l	d1,d2
	moveq.l	#$35,d1			;'5'
	bsr.w	L0013ac
	bra.w	L00060e

L000972:
	cmpi.b	#$6d,(a4)		;'m'
	beq.s	L00099a
	cmpi.b	#$4d,(a4)		;'M'
	beq.s	L00099a
	bsr.w	L001326
	bmi.w	L0006aa
	tst.l	d2
	bne.s	L000990
	move.l	#$01ffffff,d2
L000990:
	moveq.l	#$08,d1
	bsr.w	L0013ac
	bra.w	L00060e

L00099a:
	addq.l	#1,a4
	subq.l	#1,d4
	bsr.w	L001344
	move.l	d1,d2
	moveq.l	#$34,d1			;'4'
	bsr.w	L0013ac
	bra.w	L00060e

L0009ae:
	bsr.w	L001344
	tst.l	d4
	beq.w	L0006aa
	move.l	d1,d2
	beq.w	L000a9e
	cmp.l	#$000000c9,d1
	bcc.w	L000a9e
	movea.l	sp,a1
	moveq.l	#$03,d1
	bsr.w	L0013ac
	bsr.w	L001344
	move.l	d1,d2
	beq.w	L0006aa
	cmp.l	#$000000c9,d2
	bcc.w	L000a9e
	bra.s	L000a3a

L0009e6:
	bsr.w	L001344
	tst.l	d4
	beq.w	L0006aa
	move.l	d1,d2
	cmp.l	#$000000c9,d1
	bcc.w	L000a9e
	movea.l	sp,a1
	moveq.l	#$03,d1
	bsr.w	L0013ac
	bsr.w	L001344
	cmp.l	#$00000037,d1
	bcc.w	L000a9e
	movea.l	sp,a1
	adda.l	d1,a1
	move.l	d1,d3
L000a18:
	tst.l	d4
	bmi.s	L000a3a
	bsr.w	L001344
	move.b	d1,(a1)+
	cmp.b	#$29,d0			;')'
	beq.s	L000a3a
	cmp.b	#$0d,d0
	bne.s	L000a32
	addq.l	#1,a4
	subq.l	#1,d4
L000a32:
	addq.l	#1,d3
	cmpi.b	#$37,d3			;'7'
	bcs.s	L000a18
L000a3a:
	movea.l	sp,a1
	moveq.l	#$04,d1
	bsr.w	L0013ac
	bra.w	L00060e

L000a46:
	bsr.w	L001344
	move.l	d1,d2
	bne.s	L000a64
L000a4e:
	bsr.s	L000a78
	tst.l	d0
	beq.s	L000a70
	bsr.w	L0004a4
	beq.s	L000a4e
	bra.s	L000a70

L000a5c:
	bsr.w	L001344
	move.l	d1,d2
	beq.s	L000a70
L000a64:
	bsr.s	L000a78
	tst.l	d0
	beq.s	L000a5c
	bsr.w	L0004a4
	beq.s	L000a64
L000a70:
	subq.l	#1,a4
	addq.l	#1,d4
	bra.w	L00071e

L000a78:
	movem.l	d1-d2/a5,-(sp)
	bsr.w	L001c5e
	movem.l	(sp)+,d1-d2/a5
	rts

L000a86:
	move.w	#$0001,(L00073c)
	bsr.w	L001344
	tst.l	d4
	beq.w	L0006aa
	move.l	d1,(L000ab8)
L000a9e:
	cmp.b	#$29,d0			;')'
	beq.w	L00060e
	subq.l	#1,d4
	bmi.w	L0006aa
	move.b	(a4)+,d0
	cmp.b	#$20,d0			;' '
	bcs.w	L00060e
	bra.s	L000a9e

L000ab8:
	.dc.l	$00000001
L000abc:
	bsr.w	L001344
	tst.l	d4
	beq.w	L0006aa
	move.l	d1,d2
	moveq.l	#$05,d1
	bsr.w	L0013ac
	bra.w	L00071e

L000ad2:
	bsr.w	L001344
	tst.l	d4
	beq.w	L0006aa
	move.l	d1,d2
	bsr.w	L001344
	tst.l	d4
	beq.w	L0006aa
	swap.w	d2
	move.w	d1,d2
	moveq.l	#$02,d1
	bsr.w	L0013ac
	bra.w	L00071e

L000af6:
	bsr.w	L001344
	tst.l	d4
	beq.w	L0006aa
	move.l	d1,(L000b5e)
	move.l	d1,d2
	bsr.w	L001344
	tst.l	d4
	beq.w	L0006aa
	subq.l	#1,d1
	cmpi.l	#$00000003,d1
	bge.s	L000b1e
	moveq.l	#$03,d1
L000b1e:
	cmp.l	#$0000ffff,d1
	ble.s	L000b2c
	move.l	#$0000ffff,d1
L000b2c:
	cmpi.w	#$0001,d2
	blt.s	L000b40
	swap.w	d2
	move.w	d1,d2
	moveq.l	#$01,d1
	bsr.w	L0013ac
	bra.w	L00071e

L000b40:
	move.l	d1,d2
	swap.w	d2
	move.w	#$0001,d2
	moveq.l	#$01,d1
L000b4a:
	swap.w	d2
	bsr.w	L0013ac
	swap.w	d2
	addq.w	#1,d2
	cmpi.w	#$0050,d2		;'P'
	ble.s	L000b4a
	bra.w	L00071e

L000b5e:
	.dc.b	$00,$00,$00,$00
L000b62:
	bsr.w	L001344
	tst.l	d4
	beq.w	L0006aa
	move.l	d1,d2
	bsr.w	L001344
	tst.l	d4
	beq.w	L0006aa
	swap.w	d2
	move.w	d1,d2
	moveq.l	#$10,d1
	bsr.w	L0013ac
	bra.w	L00071e

L000b86:
	bsr.w	L001344
	tst.l	d4
	beq.w	L0006aa
	move.l	d1,d2
	bsr.w	L001344
	tst.l	d4
	beq.w	L0006aa
	swap.w	d2
	move.w	d1,d2
	moveq.l	#$11,d1
	bsr.w	L0013ac
	bra.w	L00071e

L000baa:
	bsr.w	L001344
	tst.l	d4
	beq.w	L0006aa
	move.l	d1,d2
	bsr.w	L001344
	tst.l	d4
	beq.w	L0006aa
	swap.w	d2
	move.w	d1,d2
	moveq.l	#$12,d1
	bsr.w	L0013ac
	bra.w	L00071e

L000bce:
	bsr.w	L001344
	tst.l	d4
	beq.w	L0006aa
	move.l	d1,d2
	bsr.w	L001344
	tst.l	d4
	beq.w	L0006aa
	swap.w	d2
	move.w	d1,d2
	moveq.l	#$13,d1
	bsr.w	L0013ac
	bra.w	L00071e

L000bf2:
	bsr.w	L001344
	tst.l	d4
	beq.w	L0006aa
	move.l	d1,d2
	bsr.w	L001344
	tst.l	d4
	beq.w	L0006aa
	swap.w	d2
	move.w	d1,d2
	moveq.l	#$14,d1
	bsr.w	L0013ac
	bra.w	L00071e

L000c16:
	bsr.w	L001344
	tst.l	d4
	beq.w	L0006aa
	move.l	d1,d2
	bsr.w	L001344
	tst.l	d4
	beq.w	L0006aa
	swap.w	d2
	move.w	d1,d2
	moveq.l	#$15,d1
	bsr.w	L0013ac
	bra.w	L00071e

L000c3a:
	bsr.w	L001344
	tst.l	d4
	beq.w	L0006aa
	move.l	d1,d2
	bsr.w	L001344
	tst.l	d4
	beq.w	L0006aa
	swap.w	d2
	move.w	d1,d2
	lsl.w	#8,d2
	bsr.w	L001344
	tst.l	d4
	beq.w	L0006aa
	move.b	d1,d2
	moveq.l	#$16,d1
	bsr.w	L0013ac
	bra.w	L00071e

L000c6c:
	bsr.w	L001344
	tst.l	d4
	beq.w	L0006aa
	move.l	d1,d2
	moveq.l	#$17,d1
	bsr.w	L0013ac
	bra.w	L00071e

L000c82:
	bsr.w	L001344
	tst.l	d4
	beq.w	L0006aa
	move.l	d1,d2
	moveq.l	#$28,d1			;'('
	bsr.w	L0013ac
	bra.w	L00071e

L000c98:
	bsr.w	L001344
	tst.l	d4
	beq.w	L0006aa
	move.l	d1,d2
	moveq.l	#$18,d1
	bsr.w	L0013ac
	bra.w	L00071e

L000cae:
	movea.l	sp,a1
	moveq.l	#$00,d2
L000cb2:
	bsr.w	L001344
	tst.l	d4
	beq.s	L000cc6
	cmp.b	#$29,d0			;')'
	beq.s	L000cc6
	move.b	d1,(a1)+
	addq.l	#1,d2
	bra.s	L000cb2

L000cc6:
	move.b	d1,(a1)+
	addq.l	#1,d2
	movea.l	sp,a1
	moveq.l	#$19,d1
	bsr.w	L0013ac
	bra.w	L00071e

L000cd6:
	bsr.w	L001344
	tst.l	d4
	beq.w	L0006aa
	move.l	d1,d2
	moveq.l	#$20,d1			;' '
	bsr.w	L0013ac
	bra.w	L00071e

L000cec:
	bsr.w	L001344
	tst.l	d4
	beq.w	L0006aa
	move.l	d1,d2
	bsr.w	L001344
	tst.l	d4
	beq.w	L0006aa
	swap.w	d2
	move.w	d1,d2
	moveq.l	#$21,d1			;'!'
	bsr.w	L0013ac
	bra.w	L00071e

L000d10:
	bsr.w	L001344
	tst.l	d4
	beq.w	L0006aa
	move.l	d1,d2
	cmpi.b	#$2c,(-$0001,a4)	;','
	bne.s	L000d32
	bsr.w	L001344
	tst.l	d4
	beq.w	L0006aa
	swap.w	d2
	move.w	d1,d2
L000d32:
	moveq.l	#$22,d1			;'"'
	bsr.w	L0013ac
	bra.w	L00071e

L000d3c:
	move.b	(a4),d0
	cmp.b	#$29,d0			;')'
	beq.s	L000daa
	ori.b	#$20,d0
	cmp.b	#$65,d0			;'e'
	beq.s	L000dc6
	cmp.b	#$64,d0			;'d'
	beq.w	L000de2
	moveq.l	#$00,d3
	cmp.b	#$61,d0			;'a'
	beq.s	L000d78
	addq.w	#1,d3
	cmp.b	#$62,d0			;'b'
	beq.s	L000d78
	addq.w	#1,d3
	cmp.b	#$63,d0			;'c'
	bne.w	L0006aa
	moveq.l	#$01,d2
	moveq.l	#$22,d1			;'"'
	bsr.w	L0013ac
L000d78:
	tst.w	(L007a30)
	beq.s	L000d84
	bsr.w	L001cb6
L000d84:
	moveq.l	#$01,d2
	moveq.l	#$23,d1			;'#'
	bsr.w	L0013ac
	movea.l	(L007a1c),a1
	move.l	(L007a20),d2
	moveq.l	#$24,d1			;'$'
	bsr.w	L0013ac
	moveq.l	#$00,d2
	moveq.l	#$25,d1			;'%'
	bsr.w	L0013ac
	bra.w	L00071e

L000daa:
	moveq.l	#$00,d2
	moveq.l	#$22,d1			;'"'
	bsr.w	L0013ac
	moveq.l	#$00,d2
	moveq.l	#$26,d1			;'&'
	bsr.w	L0013ac
	moveq.l	#$00,d2
	moveq.l	#$23,d1			;'#'
	bsr.w	L0013ac
	bra.w	L00071e

L000dc6:
	move.b	($0001,a4),d0
	ori.b	#$20,d0
	cmpi.b	#$6d,d0			;'m'
	beq.w	L00062a
	moveq.l	#$01,d2
	moveq.l	#$23,d1			;'#'
	bsr.w	L0013ac
	bra.w	L00071e

L000de2:
	moveq.l	#$00,d2
	moveq.l	#$23,d1			;'#'
	bsr.w	L0013ac
	bra.w	L00071e

L000dee:
	bsr.w	L001344
	tst.l	d4
	beq.w	L0006aa
	move.l	d1,d2
	moveq.l	#$00,d1
	bsr.w	L0013ac
	bra.w	L00071e

L000e04:
	bsr.w	L0012fa
	bcs.w	L000ebe
	move.b	(a4)+,d1
	subq.l	#1,d4
	or.b	#$20,d1
	cmp.b	#$63,d1			;'c'
	beq.w	L000f7a
	cmp.b	#$73,d1			;'s'
	beq.w	L000f98
	cmp.b	#$79,d1			;'y'
	beq.w	L000ed0
	cmp.b	#$76,d1			;'v'
	beq.w	L000f0c
	cmp.b	#$61,d1			;'a'
	beq.w	L000f28
	cmp.b	#$65,d1			;'e'
	beq.w	L000eee
	cmp.b	#$30,d1			;'0'
	blt.s	L000e56
	cmp.b	#$39,d1			;'9'
	bgt.s	L000e56
	addq.l	#1,d4
	subq.l	#1,a4
	bra.s	L000ec2

L000e56:
	cmp.b	#$70,d1			;'p'
	bne.s	L000e7a
	bsr.w	L0012fa
	bcs.s	L000ebe
	cmpi.b	#$69,(a4)		;'i'
	beq.w	L00119c
	cmpi.b	#$49,(a4)		;'I'
	beq.w	L00119c
	cmpi.b	#$39,(a4)		;'9'
	ble.w	L0011a6
L000e7a:
	lsl.l	#8,d1
	bcs.s	L000ebe
	move.b	(a4)+,d1
	subq.l	#1,d4
	or.b	#$20,d1
	lsl.l	#8,d1
	bsr.w	L0012fa
	bcs.s	L000ebe
	move.b	(a4)+,d1
	subq.l	#1,d4
	or.b	#$20,d1
	lsl.l	#8,d1
	clr.b	d1
	lea.l	(L007a3e),a3
	moveq.l	#$05,d0
L000ea2:
	cmp.l	(a3)+,d1
	beq.s	L000eac
	dbra.w	d0,L000ea2
	bra.s	L000ebe

L000eac:
	moveq.l	#$05,d1
	sub.w	d0,d1
	move.w	d1,(L007a3c)
	move.w	d1,d2
	moveq.l	#$2b,d1			;'+'
	bsr.w	L0013ac
L000ebe:
	bra.w	L00071e

L000ec2:
	bsr.w	L001344
	move.l	d1,d2
	bsr.w	L002eb6
	bra.w	L00071e

L000ed0:
	bsr.w	L001344
	tst.l	d1
	beq.s	L000ee4
	move.w	#$0001,(L007a10)
	bra.w	L00071e

L000ee4:
	clr.w	(L007a10)
	bra.w	L00071e

L000eee:
	bsr.w	L001344
	tst.l	d1
	beq.s	L000f02
	move.w	#$0001,(L007a34)
	bra.w	L00071e

L000f02:
	clr.w	(L007a34)
	bra.w	L00071e

L000f0c:
	movem.l	d0-d1/a0,-(sp)
	bsr.w	L001344
	cmpi.l	#$000000c8,d1
	bgt.s	L000f72
	subq.l	#1,d1
	bmi.s	L000f72
	lea.l	(APianoStr2),a0
	bra.s	L000f3e

L000f28:
	movem.l	d0-d1/a0,-(sp)
	bsr.w	L001344
	cmpi.l	#$0000007f,d1
	bgt.s	L000f72
	lea.l	(L00d0e0),a0
L000f3e:
	mulu.w	#$000a,d1
	adda.l	d1,a0
	move.l	#$20202020,(a0)		;'    '
	move.l	#$20202020,($0004,a0)	;'    '
	move.w	#$2020,($0008,a0)	;'  '
	moveq.l	#$09,d1
L000f5a:
	move.b	(a4)+,d0
	subq.l	#1,d4
	bmi.s	L000f72
	cmpi.b	#$20,d0			;' '
	bcs.s	L000f72
	cmpi.b	#$29,d0			;')'
	beq.s	L000f72
	move.b	d0,(a0)+
	dbra.w	d1,L000f5a
L000f72:
	movem.l	(sp)+,d0-d1/a0
	bra.w	L00071e

L000f7a:
	bsr.w	L001344
	tst.l	d1
	bne.s	L000f8e
	move.w	#$0001,(L007a0e)
	bra.w	L00071e

L000f8e:
	clr.w	(L007a0e)
	bra.w	L00071e

L000f98:
	cmpi.b	#$50,(a4)		;'P'
	beq.s	L000fb4
	cmpi.b	#$76,(a4)		;'v'
	beq.w	L00108e
	cmpi.b	#$56,(a4)		;'V'
	beq.w	L00108e
	cmpi.b	#$70,(a4)		;'p'
	bne.s	L000fd2
L000fb4:
	addq.l	#1,a4
	subq.l	#1,d4
	bsr.w	L001344
	cmpi.l	#$000000ff,d1
	ble.s	L000fc8
	move.b	#$ff,d1
L000fc8:
	move.b	d1,(L007a36)
	bra.w	L00071e

L000fd2:
	cmpi.b	#$2c,(a4)		;','
	beq.s	L000fe2
	cmpi.b	#$20,(a4)		;' '
	beq.s	L000fe2
	bra.w	L00071e

L000fe2:
	addq.l	#1,a4
	subq.l	#1,d4
	movem.l	d0-d3/a1-a2,-(sp)
	lea.l	(L00e5f4),a2
	movea.l	a2,a1
	moveq.l	#$00,d2
L000ff4:
	move.b	(a4)+,d0
	subq.l	#1,d4
	bmi.s	L00101e
	cmp.b	#$20,d0			;' '
	ble.s	L00101e
	cmp.b	#$2e,d0			;'.'
	beq.s	L00101e
	cmp.b	#$29,d0			;')'
	beq.s	L00101e
	cmp.b	#$28,d0			;'('
	beq.s	L00101e
	move.b	d0,(a1)+
	addq.w	#1,d2
	cmpi.w	#$003b,d2		;';'
	bge.s	L00101e
	bra.s	L000ff4

L00101e:
	move.b	#$2e,(a1)+		;'.'
	move.b	#$53,(a1)+		;'S'
	move.b	#$4e,(a1)+		;'N'
	move.b	#$44,(a1)+		;'D'
	clr.b	(a1)+
	tst.w	d2
	beq.s	L001086
	clr.w	-(sp)
	pea.l	(a2)
	DOS	_OPEN
	lea.l	($0006,sp),sp
	move.l	d0,d3
	bmi.s	L001086
	moveq.l	#$c7,d1
	moveq.l	#$00,d2
L001046:
	move.l	#$00000050,-(sp)
	pea.l	(a1)
	move.w	d3,-(sp)
	DOS	_READ
	lea.l	($000a,sp),sp
	tst.l	d0
	beq.s	L00106a
	bmi.s	L00106a
	move.w	d2,d0
	jsr	(L006538)
	addq.w	#1,d2
	dbra.w	d1,L001046
L00106a:
	move.w	d3,-(sp)
	DOS	_CLOSE
	addq.l	#2,sp
	moveq.l	#$07,d1
L001072:
	jsr	(L006688)
	move.b	($0013,a1),d0
	jsr	(L0061b4)
	dbra.w	d1,L001072
L001086:
	movem.l	(sp)+,d0-d3/a1-a2
	bra.w	L00071e

L00108e:
	addq.l	#1,a4
	subq.l	#1,d4
	cmpi.b	#$2c,(a4)		;','
	beq.s	L0010a0
	cmpi.b	#$20,(a4)		;' '
	bne.w	L00071e
L0010a0:
	addq.l	#1,a4
	subq.l	#1,d4
	movem.l	d0-d3/d5/a0-a2,-(sp)
	lea.l	(L00e5f4),a1
	movea.l	a1,a2
	moveq.l	#$00,d2
L0010b2:
	move.b	(a4)+,d0
	subq.l	#1,d4
	bmi.s	L0010e4
	cmp.b	#$20,d0			;' '
	ble.s	L0010e4
	cmp.b	#$2e,d0			;'.'
	beq.s	L0010e4
	cmp.b	#$2c,d0			;','
	beq.s	L0010e4
	cmp.b	#$29,d0			;')'
	beq.s	L0010e4
	cmp.b	#$28,d0			;'('
	ble.w	L00116c
	move.b	d0,(a2)+
	addq.w	#1,d2
	cmpi.w	#$003b,d2		;';'
	bge.s	L0010e4
	bra.s	L0010b2

L0010e4:
	move.b	#$2e,(a2)+		;'.'
	move.b	#$53,(a2)+		;'S'
	move.b	#$4e,(a2)+		;'N'
	move.b	#$44,(a2)+		;'D'
	clr.b	(a2)
	lea.l	($0001,a2),a0
	tst.w	d2
	beq.s	L00116c
	cmpi.b	#$29,d0			;')'
	bne.s	L001120
	move.w	#$0020,-(sp)		;' '
	pea.l	(a1)
	DOS	_CREATE
	lea.l	($0006,sp),sp
	move.l	d0,d5
	bmi.s	L00116c
	move.w	#$0001,d2
	move.w	#$00c8,d3
	bsr.s	L001174
	bra.s	L001166

L001120:
	bsr.w	L001344
	move.w	d1,d2
	beq.s	L00116c
	move.w	d0,-(sp)
	move.w	#$0020,-(sp)		;' '
	pea.l	(a1)
	DOS	_CREATE
	lea.l	($0006,sp),sp
	move.l	d0,d5
	move.w	(sp)+,d0
	tst.l	d5
	bmi.s	L00116c
L00113e:
	move.w	d2,d3
	cmpi.b	#$2d,d0			;'-'
	bne.s	L001156
	bsr.w	L001344
	move.w	d1,d3
	bne.s	L001156
	move.w	#$00c8,d3
	bsr.s	L001174
	bra.s	L001166

L001156:
	bsr.s	L001174
	tst.w	d0
	bmi.s	L001166
	bsr.w	L001344
	move.w	d1,d2
	beq.s	L001166
	bra.s	L00113e

L001166:
	move.w	d5,-(sp)
	DOS	_CLOSE
	addq.l	#2,sp
L00116c:
	movem.l	(sp)+,d0-d3/d5/a0-a2
	bra.w	L00071e

L001174:
	move.w	d2,d0
	subq.w	#1,d0
	bmi.s	L00119a
	jsr	(L0065dc)
	move.l	#$00000050,-(sp)
	move.l	a0,-(sp)
	move.w	d5,-(sp)
	DOS	_WRITE
	lea.l	($000a,sp),sp
	tst.l	d0
	bmi.s	L00119a
	addq.w	#1,d2
	cmp.w	d3,d2
	ble.s	L001174
L00119a:
	rts

L00119c:
	jsr	(L0068ac)
	bra.w	L00071e

L0011a6:
	cmpi.b	#$30,(a4)		;'0'
	blt.w	L00071e
	movem.l	d0-d3/d5/a1-a2,-(sp)
	bsr.w	L001344
	cmpi.l	#$0000007f,d1
	bgt.w	L001294
	cmp.b	#$2c,d0			;','
	beq.s	L0011dc
	cmp.b	#$3d,d0			;'='
	beq.s	L0011dc
	cmp.b	#$20,d0			;' '
	bne.w	L001294
	addq.l	#1,a4
	subq.l	#1,d4
	beq.w	L001294
L0011dc:
	bsr.w	L0012fa
	bcs.w	L001294
	lea.l	(L00e5f4),a1
	moveq.l	#$00,d2
L0011ec:
	move.b	(a4)+,d0
	subq.l	#1,d4
	bmi.s	L00120a
	cmp.b	#$20,d0			;' '
	ble.s	L00120a
	cmp.b	#$29,d0			;')'
	beq.s	L00120a
	cmp.b	#$28,d0			;'('
	beq.s	L00120a
	move.b	d0,(a1)+
	addq.w	#1,d2
	bra.s	L0011ec

L00120a:
	clr.b	(a1)
	tst.w	d2
	beq.w	L001294
	clr.w	-(sp)
	pea.l	(L00e5f4)
	DOS	_OPEN
	lea.l	($0006,sp),sp
	move.l	d0,d5
	bmi.s	L001294
	move.w	d1,d3
	swap.w	d3
	move.w	#$0004,d3
	moveq.l	#$00,d2
	jsr	(L00675a)
	lea.l	(L007716),a1
	lea.l	(L00d5e0),a2
	lsl.w	#3,d1
	adda.w	d1,a2
	move.l	($000c,a1),d2
	beq.s	L00128e
	move.l	d2,-(sp)
	move.l	($0004,a1),-(sp)
	move.w	d5,-(sp)
	DOS	_READ
	lea.l	($000a,sp),sp
	move.l	d0,d2
	bmi.s	L00128e
	cmpi.l	#$00007fff,d2
	ble.s	L00126a
	move.l	#$00007fff,d2
L00126a:
	move.w	d2,(a2)
	move.l	($0004,a1),($0004,a2)
	add.l	d2,($0004,a1)
	sub.l	d2,($000c,a1)
	lea.l	(L00e5f4),a1
	bsr.w	L00073e
	swap.w	d3
	move.w	d3,d2
	jsr	(L002e0c)
L00128e:
	move.w	d5,-(sp)
	DOS	_CLOSE
	addq.l	#2,sp
L001294:
	movem.l	(sp)+,d0-d3/d5/a1-a2
	bra.w	L00071e

L00129c:
	movea.l	sp,a1
	movea.l	a1,a3
	adda.l	#$000001ff,a3
L0012a6:
	move.b	d0,(a1)+
	subq.l	#1,d4
	bmi.s	L0012e6
	cmpa.l	a3,a1
	beq.s	L0012d2
	move.b	(a4)+,d0
	cmpi.b	#$20,d0			;' '
	bcs.s	L0012d2
	cmpi.b	#$28,d0			;'('
	bne.s	L0012a6
	clr.b	(a1)
	movea.l	sp,a1
	move.l	(L000ab8),d2
	moveq.l	#$06,d1
	bsr.w	L0013ac
	bra.w	L00066e

L0012d2:
	clr.b	(a1)
	movea.l	sp,a1
	move.l	(L000ab8),d2
	moveq.l	#$06,d1
	bsr.w	L0013ac
	bra.w	L00060e

L0012e6:
	clr.b	(a1)
	movea.l	sp,a1
	move.l	(L000ab8),d2
	moveq.l	#$06,d1
	bsr.w	L0013ac
	bra.w	L0006aa

L0012fa:
	move.b	(a4),d0
	beq.s	L001320
	cmpi.b	#$20,d0			;' '
	beq.s	L00130a
	cmpi.b	#$09,d0
	bne.s	L001314
L00130a:
	addq.l	#1,a4
	subq.l	#1,d4
	beq.s	L001320
	bmi.s	L001320
	bra.s	L0012fa

L001314:
	cmp.b	#$29,d0			;')'
	beq.s	L001320
	andi.b	#$fe,ccr
	rts

L001320:
	ori.b	#$01,ccr
	rts

L001326:
	moveq.l	#$00,d2
L001328:
	bsr.s	L001344
	cmp.b	#$29,d0			;')'
	beq.s	L001338
	subq.l	#1,d1
	bmi.s	L001340
	bset.l	d1,d2
	bra.s	L001328

L001338:
	tst.l	d1
	beq.s	L001340
	subq.l	#1,d1
	bset.l	d1,d2
L001340:
	tst.l	d4
	rts

L001344:
	movem.l	d2,-(sp)
	moveq.l	#$00,d1
L00134a:
	move.b	(a4)+,d0
	subq.l	#1,d4
	bmi.s	L00137a
	cmp.b	#$21,d0			;'!'
	bcs.s	L00134a
L001356:
	cmp.b	#$30,d0			;'0'
	bcs.s	L001378
	cmp.b	#$3a,d0			;':'
	bcc.s	L001378
	and.l	#$0000000f,d0
	add.l	d1,d1
	move.l	d1,d2
	asl.l	#2,d1
	add.l	d2,d1
	add.l	d0,d1
	move.b	(a4)+,d0
	subq.l	#1,d4
	bpl.s	L001356
L001378:
	moveq.l	#$00,d2
L00137a:
	movem.l	(sp)+,d2
	rts

L001380:
	cmpi.w	#$0002,d1
	bne.s	L00138a
	moveq.l	#$00,d0
	rts

L00138a:
	cmpi.w	#$005c,d1		;'\'
	beq.s	L00139e
	cmpi.w	#$005d,d1		;']'
	bne.s	L0013ac
	move.l	(L0013a8),d0
	rts

L00139e:
	move.l	d2,(L0013a8)
	moveq.l	#$00,d0
	rts

L0013a8:
	.dc.l	$00000000
L0013ac:
	cmp.w	#$0068,d1		;'h'
	bcc.s	L001404
	clr.l	(L0013a8)
	movem.l	d1-d7/a0-a6,-(sp)
	lea.l	(Table2),a0
	add.w	d1,d1
	add.w	d1,d1
	movea.l	(a0,d1.w),a0
	cmpi.w	#$0180,d1
	bcs.s	L0013fc
	cmpi.w	#$0198,d1
	bcc.s	L0013f8
	jsr	(L006900)
	tst.l	d0
	beq.s	L0013e8
	moveq.l	#$00,d1
	jsr	(L00690a)
L0013e8:
	move.b	#$01,(L006bc3)
	move.b	#$01,(L006bc7)
L0013f8:
	move.l	d2,d1
	move.l	d3,d2
L0013fc:
	jsr	(a0)
	movem.l	(sp)+,d1-d7/a0-a6
	rts

L001404:
	moveq.l	#$ff,d0
L001406:
	rts

Table2:
	.dc.l	L00170e
	.dc.l	L001878
	.dc.l	L001916
	.dc.l	L001a30
	.dc.l	L001a60
	.dc.l	L001a90
	.dc.l	L001ac6
	.dc.l	L001aea
	.dc.l	L001b22
	.dc.l	L001c4e
	.dc.l	L001ca2
	.dc.l	L001d3a
	.dc.l	L0020da
	.dc.l	L0020fc
	.dc.l	L00214c
	.dc.l	L00215e
	.dc.l	L002190
	.dc.l	L00223c
	.dc.l	L0022b4
	.dc.l	L002326
	.dc.l	L002430
	.dc.l	L002486
	.dc.l	L002516
	.dc.l	L0025cc
	.dc.l	L002600
	.dc.l	L002634
	.dc.l	L00265c
	.dc.l	L0026d8
	.dc.l	L002710
	.dc.l	L002748
	.dc.l	L0027a0
	.dc.l	L0027e4
	.dc.l	L00286c
	.dc.l	L0028a8
	.dc.l	L0028ee
	.dc.l	L002932
	.dc.l	L00295e
	.dc.l	L0029d4
	.dc.l	L002a4c
	.dc.l	L002a74
	.dc.l	L002a80
	.dc.l	L002a98
	.dc.l	L002aa0
	.dc.l	L002b9e
	.dc.l	L002c24
	.dc.l	L002c32
	.dc.l	L002c3e
	.dc.l	L002c60
	.dc.l	L002c68
	.dc.l	L002c72
	.dc.l	L002c9e
	.dc.l	L002ca8
	.dc.l	L001d8c
	.dc.l	L001e94
	.dc.l	L002094
	.dc.l	L0020b0
	.dc.l	L002b1e
	.dc.l	L002b44
	.dc.l	L002b74
	.dc.l	L002b96
	.dc.l	L002ab2
	.dc.l	L00258c
	.dc.l	L002d62
	.dc.l	L002dac
	.dc.l	L002df6
	.dc.l	L002e56
	.dc.l	L002e0c
	.dc.l	L002e6c
	.dc.l	L002eb6
	.dc.l	L00239e
	.dc.l	L0023f8
	.dc.l	L002cca
	.dc.l	L002cec
	.dc.l	L002d0a
	.dc.l	L002d0e
	.dc.l	L002d12
	.dc.l	L001406
	.dc.l	L001406
	.dc.l	L001406
	.dc.l	L001406
	.dc.l	L001406
	.dc.l	L001406
	.dc.l	L001406
	.dc.l	L001406
	.dc.l	L001406
	.dc.l	L001406
	.dc.l	L001406
	.dc.l	L001406
	.dc.l	L001406
	.dc.l	L001406
	.dc.l	L001406
	.dc.l	L001406
	.dc.l	L001406
	.dc.l	L001406
	.dc.l	L0016ea
	.dc.l	L0016f2
	.dc.l	L00694c
	.dc.l	L006a44
	.dc.l	L001406
	.dc.l	L001406
	.dc.l	L001406
	.dc.l	L001406
	.dc.l	L006900
	.dc.l	L00690a
L0015a8:
	andi.w	#$007f,d0
	cmpi.w	#$0051,d0		;'Q'
	blt.s	L0015b6
	move.w	#$0050,d0		;'P'
L0015b6:
	rts

L0015b8:
	andi.w	#$001f,d0
	cmpi.w	#$001a,d0
	blt.s	L0015c6
	move.w	#$0019,d0
L0015c6:
	rts

L0015c8:
	move.l	a0,-(sp)
	lea.l	(L00ce63),a0
	move.b	(a0,d0.w),d0
	movea.l	(sp)+,a0
	rts

L0015d8:
	movem.l	d1/a0,-(sp)
	lea.l	(L00ce63),a0
	move.w	#$0018,d1
L0015e6:
	cmp.b	(a0,d1.w),d0
	beq.s	L0015f0
	dbra.w	d1,L0015e6
L0015f0:
	move.w	d1,d0
	movem.l	(sp)+,d1/a0
	rts

L0015f8:
	move.l	a5,-(sp)
	lea.l	(L00c616),a5
	andi.l	#$0000001f,d0
	subq.w	#1,d0
	mulu.w	#$0054,d0
	adda.w	d0,a5
	moveq.l	#$00,d0
	move.b	($0028,a5),d0
	addq.b	#1,d0
	movea.l	(sp)+,a5
	rts

L00161a:
	movem.l	d0-d1/a0/a5,-(sp)
	lea.l	(L00ce63),a0
	lea.l	(L00c616),a5
	moveq.l	#$18,d1
L00162c:
	move.b	(a0),($0028,a5)
	move.b	(a0),($0027,a5)
	move.b	(a0)+,($0009,a5)
	adda.l	#$00000054,a5
	dbra.w	d1,L00162c
	movem.l	(sp)+,d0-d1/a0/a5
	rts

L001648:
	movem.l	d0-d2/a0,-(sp)
	move.l	#$001f0001,d2
L001652:
	swap.w	d2
	bsr.w	L001878
	swap.w	d2
	addq.w	#1,d2
	cmp.w	#$0011,d2
	bne.s	L001652
	movem.l	(sp)+,d0-d2/a0
	rts

L001668:
	movem.l	d0-d2/a0-a1,-(sp)
	lea.l	(L00c4d6),a1
	moveq.l	#$4f,d0			;'O'
L001674:
	clr.l	(a1)+
	dbra.w	d0,L001674
	move.l	#$00030001,d2
L001680:
	swap.w	d2
	bsr.w	L001878
	swap.w	d2
	addq.w	#1,d2
	cmp.w	#$0051,d2		;'Q'
	bne.s	L001680
	tst.b	(L007a12)
	beq.s	L00169a
	bsr.s	L001648
L00169a:
	movem.l	(sp)+,d0-d2/a0-a1
	rts

L0016a0:
	clr.b	(a5)
	clr.b	($0001,a5)
	move.l	($0050,a5),($0002,a5)
	clr.w	($0006,a5)
	clr.b	($0014,a5)
	clr.b	($0016,a5)
	clr.b	($0018,a5)
	clr.b	($001e,a5)
	clr.b	($0020,a5)
	clr.b	($0026,a5)
	clr.w	($002e,a5)
	clr.l	($0032,a5)
	clr.l	($0036,a5)
	clr.b	($003c,a5)
	clr.b	($003e,a5)
	clr.b	($0040,a5)
	clr.b	($0042,a5)
	clr.b	($0044,a5)
	rts

L0016ea:
	move.l	(L0074c0),d0
	rts

L0016f2:
	tst.l	(L0074b8)
	bne.s	L0016fe
	moveq.l	#$ff,d0
	rts

L0016fe:
	bsr.w	L001cb6
	bsr.w	L0027a0
	move.l	#L0074b8,d0
	rts

L00170e:
	bsr.w	L002f6a
	clr.b	(L002863)
	bsr.w	L001cb6
	tst.w	(L007572)
	beq.s	L001728
	bsr.w	L004d0a
L001728:
	cmpi.w	#$0001,d2
	bne.s	L001732
	bsr.w	L005daa
L001732:
	bsr.w	L005d52
	clr.w	-(sp)
	jsr	(L004f1e)
	jsr	(L004f7a)
	jsr	(L004efa)
	addq.l	#2,sp
	clr.w	(L007850)
	clr.b	(L001e92)
	clr.w	(L007a30)
	clr.w	(L007a0c)
	move.l	#$00040004,d0
	move.l	d0,(L0028ea)
	clr.w	(L0028e8)
	jsr	(L004a4e)
	move.w	#$0078,d0		;'x'
	move.w	d0,(L007550)
	bsr.w	L004d84
	bsr.w	L001668
	bsr.w	L00161a
	moveq.l	#$ff,d2
	bsr.w	L001916
	bsr.w	L004002
	bsr.w	L003fe4
	lea.l	(L00c396),a3
	lea.l	(L0078c6),a4
	clr.w	d0
L0017ae:
	clr.l	(a4)+
	bsr.w	L003f8c
	move.l	(a3),(a1)
	move.b	#$04,($0004,a1)
	clr.b	($0005,a1)
	move.b	#$30,($0006,a1)		;'0'
	move.b	#$08,($0007,a1)
	clr.b	($0008,a1)
	clr.b	($0009,a1)
	clr.l	($000a,a1)
	clr.w	($000e,a1)
	cmpi.w	#$0018,d0
	bgt.s	L001826
	bsr.w	L003fcc
	move.l	(a3),($0002,a5)
	move.l	(a3)+,($0050,a5)
	move.b	#$7f,($0029,a5)
	move.b	#$40,($002a,a5)		;'@'
	move.b	#$40,($002b,a5)		;'@'
	clr.w	($002c,a5)
	clr.w	($002e,a5)
	clr.l	($0030,a5)
	clr.l	($0034,a5)
	clr.l	($0038,a5)
	clr.l	($003c,a5)
	clr.l	($004c,a5)
	clr.b	($0014,a5)
	move.b	#$01,($003f,a5)
L001826:
	addq.w	#1,d0
	cmp.w	#$0050,d0		;'P'
	bne.s	L0017ae
	clr.b	(L007a3a)
	clr.w	(L007852)
	clr.w	(L00783a)
	clr.l	(L007844)
	clr.b	(L007a14)
	move.l	(L007a1c),(L00783c)
	move.l	(L007a1c),(L007848)
	move.l	(L007a1c),(L00784c)
	move.l	(L007a20),(L007840)
	bra.w	L002f9c

L001878:
	bsr.w	L002f6a
	move.l	d2,-(sp)
	tst.w	(L007a30)
	beq.s	L00188a
	bsr.w	L001cb6
L00188a:
	move.l	(sp)+,d2
	move.l	d2,d0
	clr.w	d0
	swap.w	d0
	subq.w	#1,d0
	cmp.w	#$0050,d0		;'P'
	bcc.w	L002f98
	move.l	d3,-(sp)
	moveq.l	#$00,d1
	move.w	d2,d1
	addq.l	#1,d1
	move.w	d0,d3
	lea.l	(L00c4d6),a0
	lsl.w	#2,d0
	move.l	d1,(a0,d0.w)
	bsr.w	L003ec0
	tst.l	d0
	bmi.s	L0018d0
	bsr.w	L003f10
	bsr.w	L003f4a
	bsr.w	L003f6e
	bsr.w	L0019e8
	move.l	(sp)+,d3
	bra.w	L002f9c

L0018d0:
	lea.l	(L00c4d6),a0
	move.l	(L007a20),d1
	moveq.l	#$00,d0
L0018de:
	cmp.w	d0,d3
	beq.s	L0018e4
	sub.l	(a0),d1
L0018e4:
	addq.l	#4,a0
	addq.w	#1,d0
	cmpi.w	#$0050,d0		;'P'
	bne.s	L0018de
	lsl.w	#2,d3
	lea.l	(L00c4d6),a0
	subq.l	#1,d1
	move.l	d1,(a0,d3.w)
	bsr.w	L003ec0
	bsr.w	L003f10
	bsr.w	L003f4a
	bsr.w	L003f6e
	bsr.w	L0019e8
	move.l	(sp)+,d3
	bra.w	L002f94

L001916:
	bsr.w	L002f6a
	cmpi.l	#$ffffffff,d2
	beq.s	L001984
	move.w	d2,d0
	bmi.w	L0019c8
	bsr.w	L0015a8
	subq.w	#1,d0
	bmi.w	L002f98
	swap.w	d2
	subq.w	#1,d2
	bmi.w	L002f90
	cmp.w	#$0019,d2
	bcc.w	L002f90
	movem.l	a3-a5,-(sp)
	lea.l	(L00ce4a),a4
	move.b	d0,(a4,d2.w)
	lea.l	(L00c616),a5
	lea.l	(L00c396),a4
	lsl.w	#2,d0
	mulu.w	#$0054,d2
	adda.w	d2,a5
	movea.l	(a4,d0.w),a3
	move.l	a3,($0050,a5)
	bsr.w	L0016a0
	cmpi.b	#$ff,(a3)
	beq.s	L00197c
	move.b	#$01,($0014,a5)
L00197c:
	movem.l	(sp)+,a3-a5
	bra.w	L002f9c

L001984:
	movem.l	a2-a5,-(sp)
	lea.l	(L00ce4a),a3
	lea.l	(L00c396),a4
	lea.l	(L00c616),a5
	moveq.l	#$00,d0
L00199c:
	move.b	d0,(a3)+
	movea.l	(a4)+,a2
	move.l	a2,($0050,a5)
	bsr.w	L0016a0
	cmpi.b	#$ff,(a2)
	beq.s	L0019b4
	move.b	#$01,($0014,a5)
L0019b4:
	lea.l	($0054,a5),a5
	addq.w	#1,d0
	cmpi.w	#$0019,d0
	bne.s	L00199c
	movem.l	(sp)+,a2-a5
	bra.w	L002f9c

L0019c8:
	swap.w	d2
	subq.w	#1,d2
	bmi.w	L002f90
	cmp.w	#$0019,d2
	bcc.w	L002f90
	lea.l	(L00ce4a),a0
	moveq.l	#$00,d0
	move.b	(a0,d2.w),d0
	addq.w	#1,d0
	rts

L0019e8:
	movem.l	d0-d1/a0-a3,-(sp)
	lea.l	(L00ce4a),a0
	lea.l	(L00c396),a1
	lea.l	(L00c616),a2
	lea.l	(L00ce63),a3
	moveq.l	#$18,d1
L001a06:
	moveq.l	#$00,d0
	move.b	(a0)+,d0
	lsl.w	#2,d0
	move.l	(a1,d0.w),($0002,a2)
	move.l	(a1,d0.w),($0050,a2)
	move.b	(a3),($0028,a2)
	move.b	(a3)+,($0009,a2)
	adda.l	#$00000054,a2
	dbra.w	d1,L001a06
	movem.l	(sp)+,d0-d1/a0-a3
	rts

L001a30:
	bsr.w	L002f6a
	move.l	d2,d0
	subq.l	#1,d0
	bmi.w	L002f78
	cmp.l	#$000000c8,d0
	bcc.w	L002f78
	lea.l	(APianoData2),a0
	mulu.w	#$0037,d0
	adda.l	d0,a0
	move.w	#$0036,d0		;'6'
L001a56:
	move.b	(a0)+,(a1)+
	dbra.w	d0,L001a56
	bra.w	L002f9c

L001a60:
	bsr.w	L002f6a
	move.l	d2,d0
	subq.l	#1,d0
	bmi.w	L002f78
	cmp.l	#$000000c8,d0
	bcc.w	L002f78
	lea.l	(APianoData2),a0
	mulu.w	#$0037,d0
	adda.l	d0,a0
	move.w	#$0036,d0		;'6'
L001a86:
	move.b	(a1)+,(a0)+
	dbra.w	d0,L001a86
	bra.w	L002f9c

L001a90:
	bsr.w	L002f6a
	move.w	d2,d0
	bmi.s	L001abc
	cmp.w	#$0014,d0
	bcc.s	L001aa4
	move.w	#$0014,d0
	bra.s	L001aae

L001aa4:
	cmp.w	#$012c,d0
	ble.s	L001aae
	move.w	#$012c,d0
L001aae:
	move.w	d0,(L007550)
	bsr.w	L004d84
	bra.w	L002f9c

L001abc:
	moveq.l	#$00,d0
	move.w	(L007550),d0
	rts

L001ac6:
	bsr.w	L002f6a
	movea.l	a1,a0
	move.l	d2,d0
	subq.l	#1,d0
	bmi.w	L002f98
	cmp.l	#$00000050,d0
	bcc.w	L002f98
	bsr.w	L0031e8
	move.l	(L007a24),d0
	rts

L001aea:
	bsr.w	L002f6a
	move.w	d2,d0
	subq.w	#1,d0
	cmp.w	#$0050,d0		;'P'
	bcc.w	L002f98
	bsr.w	L003f8c
	lsl.w	#2,d0
	move.w	d0,d2
	lea.l	(L00c396),a0
	move.l	(a0,d2.w),d1
	move.l	(a1),d0
	sub.l	d1,d0
	lea.l	(L00c4d6),a0
	move.l	(a0,d2.w),d1
	sub.l	d0,d1
	subq.l	#1,d1
	move.l	d1,d0
	rts

L001b22:
	bsr.w	L002f6a
	tst.l	d2
	ble.s	L001b30
	bsr.s	L001b36
	bra.w	L002f9c

L001b30:
	bsr.s	L001b60
	bra.w	L002f9c

L001b36:
	bsr.s	L001bae
	tst.w	(L007a30)
	bne.s	L001b5e
	tst.w	(L007572)
	bne.s	L001b5e
	jsr	(L004b22)
	move.b	#$01,(L002863)
	move.w	#$0001,(L007a30)
L001b5e:
	rts

L001b60:
	move.l	d2,-(sp)
	moveq.l	#$ff,d2
	tst.w	(L007a30)
	beq.s	L001b70
	bsr.w	L001cb6
L001b70:
	bsr.s	L001bae
	tst.w	(L007572)
	bne.s	L001b80
	jsr	(L004b22)
L001b80:
	tst.w	(L001e92)
	bne.s	L001b8e
	clr.w	(L007a06)
L001b8e:
	move.b	#$01,(L002863)
	clr.b	(L007a14)
	clr.b	(L001e92)
	move.w	#$0001,(L007a30)
	move.l	(sp)+,d2
	rts

L001bae:
	movem.l	d1-d2/a3-a5,-(sp)
	lea.l	(L007828),a3
	move.w	($0002,a3),(a3)
	move.w	($0006,a3),($0004,a3)
	clr.w	(L007a0c)
	tst.w	(L001e92)
	bne.s	L001bea
	clr.b	(L007a1a)
	clr.b	(L006bc3)
	clr.w	(L002864)
	move.b	#-$01,(L006bc2)
L001bea:
	clr.w	d0
	lea.l	(L00ce7c),a3
	lea.l	(L00c616),a5
L001bf8:
	lsr.l	#1,d2
	bcc.s	L001c38
	tst.w	(L001e92)
	bne.s	L001c0e
	bsr.w	L0016a0
	move.l	#$ffffffff,(a3)
L001c0e:
	move.b	#$01,($004c,a5)
	movea.l	($0002,a5),a4
	clr.b	($0014,a5)
	cmpi.b	#$ff,(a4)
	beq.s	L001c28
	move.b	#$01,($0014,a5)
L001c28:
	moveq.l	#$00,d1
	move.b	($0028,a5),d1
	addq.b	#1,d1
	move.w	d1,-(sp)
	bsr.w	L004efa
	addq.l	#2,sp
L001c38:
	lea.l	($0004,a3),a3
	lea.l	($0054,a5),a5
	addq.w	#1,d0
	cmpi.w	#$0019,d0
	bne.s	L001bf8
	movem.l	(sp)+,d1-d2/a3-a5
	rts

L001c4e:
	bsr.w	L002f6a
	tst.w	(L007a30)
	bne.s	L001c5e
	moveq.l	#$00,d0
	rts

L001c5e:
	tst.l	d2
	ble.s	L001c82
	subq.l	#1,d2
	cmpi.w	#$0018,d2
	ble.s	L001c6e
	move.w	#$0018,d2
L001c6e:
	lea.l	(L00c616),a5
	mulu.w	#$0054,d2
	adda.w	d2,a5
	moveq.l	#$00,d0
	move.b	($0014,a5),d0
	rts

L001c82:
	lea.l	(L00c616),a5
	moveq.l	#$00,d0
	moveq.l	#$00,d1
L001c8c:
	tst.b	($0014,a5)
	beq.s	L001c94
	bset.l	d1,d0
L001c94:
	adda.w	#$0054,a5
	addq.w	#1,d1
	cmp.w	#$0019,d1
	bne.s	L001c8c
	rts

L001ca2:
	bsr.w	L002f6a
	tst.l	d2
	ble.s	L001cb0
	bsr.s	L001cea
	bra.w	L002f9c

L001cb0:
	bsr.s	L001cb6
	bra.w	L002f9c

L001cb6:
	move.l	d2,-(sp)
	jsr	(L004b8c)
	clr.w	(L007a30)
	clr.b	(L001e92)
	clr.b	(L002863)
	clr.w	(L002864)
	moveq.l	#$ff,d2
	bsr.s	L001cea
	clr.w	-(sp)
	jsr	(L004efa)
	lea.l	($0002,sp),sp
	move.l	(sp)+,d2
	rts

L001cea:
	movem.l	d0-d1/a5,-(sp)
	moveq.l	#$18,d1
	lea.l	(L00c616),a5
L001cf6:
	lsr.l	#1,d2
	bcc.s	L001d2a
	clr.b	($004c,a5)
	tst.w	(L007a30)
	beq.s	L001d12
	move.b	#-$01,(L007a14)
	bsr.w	L003eb6
L001d12:
	bsr.w	L00406a
	bsr.w	L00431a
	clr.w	($0006,a5)
	clr.w	($002e,a5)
	clr.l	($0032,a5)
	clr.l	($0036,a5)
L001d2a:
	adda.l	#$00000054,a5
	dbra.w	d1,L001cf6
	movem.l	(sp)+,d0-d1/a5
	rts

L001d3a:
	bsr.w	L002f6a
	tst.l	d2
	ble.s	L001d44
	bra.s	L001d46

L001d44:
	moveq.l	#$ff,d2
L001d46:
	movem.l	d1/a5,-(sp)
	lea.l	(L00c616),a5
	moveq.l	#$18,d1
L001d52:
	lsr.l	#1,d2
	bcc.s	L001d5c
	move.b	#$01,($004c,a5)
L001d5c:
	adda.l	#$00000054,a5
	dbra.w	d1,L001d52
	tst.w	(L007a30)
	bne.s	L001d84
	jsr	(L004bca)
	move.w	#$0001,(L007a30)
	move.b	#$01,(L002863)
L001d84:
	movem.l	(sp)+,d1/a5
	bra.w	L002f9c

L001d8c:
	bsr.w	L002f6a
	tst.w	(L007a30)
	beq.s	L001d9c
	bsr.w	L001cb6
L001d9c:
	clr.w	(L007a0c)
	bsr.w	L004002
	bsr.w	L003fe4
	bsr.s	L001db0
	bra.w	L002f9c

L001db0:
	movem.l	d1-d2/a0-a6,-(sp)
	subq.w	#1,d2
	bpl.s	L001dba
	moveq.l	#$00,d2
L001dba:
	andi.w	#$7fff,d2
	move.w	d2,(L007a06)
	clr.b	(L007a1a)
	lea.l	(L00e5f4),a3
	moveq.l	#$18,d0
L001dd2:
	move.l	#$ffffffff,(a3)+
	move.l	#$ffffffff,(a3)+
	move.l	#$ffffffff,(a3)+
	move.l	#$ffffffff,(a3)+
	dbra.w	d0,L001dd2
	clr.w	d0
	lea.l	(L00e5f4),a3
	lea.l	(L00c616),a5
L001dfc:
	movea.l	($0050,a5),a4
	move.l	a4,($0002,a5)
	clr.b	($003e,a5)
	clr.b	(a5)
	clr.w	($0006,a5)
	clr.w	($002e,a5)
	clr.l	($0030,a5)
	clr.l	($0034,a5)
	clr.l	($0038,a5)
	move.b	#$01,($004c,a5)
	clr.b	($0014,a5)
	cmpi.b	#$ff,(a4)
	beq.s	L001e60
	move.b	#$01,($0014,a5)
	tst.w	d2
	beq.s	L001e60
	move.w	d2,d1
	movea.l	a4,a1
	bsr.w	L001ec4
	move.l	a1,($0002,a5)
	cmpi.b	#$f0,(a1)
	beq.s	L001e56
	cmpi.b	#$ff,(a1)
	bne.s	L001e60
	clr.b	($0014,a5)
	bra.s	L001e60

L001e56:
	move.b	($0001,a1),($003e,a5)
	move.b	($0002,a1),(a5)
L001e60:
	lea.l	($0054,a5),a5
	lea.l	($0010,a3),a3
	addq.w	#1,d0
	cmp.w	#$0019,d0
	bne.s	L001dfc
	bsr.w	L001ffc
	lea.l	(L007828),a1
	move.w	($0002,a1),(a1)
	move.w	($0006,a1),($0004,a1)
	move.b	#$01,(L001e92)
	movem.l	(sp)+,d1-d2/a0-a6
	rts

L001e92:
	.dc.b	$00,$00
L001e94:
	tst.w	d2
	ble.s	L001eae
	addq.w	#1,d2
	andi.w	#$7fff,d2
	move.w	d2,(L007a0a)
	cmp.w	(L007a06),d2
	ble.s	L001eae
	rts

L001eae:
	clr.w	(L007a0c)
	move.w	#$7fff,(L007a0a)
	bsr.w	L001cb6
	bra.w	L002f9c

L001ec4:
	movem.l	d0-d3,-(sp)
	moveq.l	#$00,d3
	move.b	#$7f,($0029,a5)
	move.b	#$40,($002a,a5)		;'@'
	move.b	#$40,($002b,a5)		;'@'
L001edc:
	moveq.l	#$00,d0
	move.b	(a1)+,d0
	bmi.s	L001eee
	move.b	(a1)+,d0
	add.l	d0,d3
	addq.l	#1,a1
	bra.s	L001edc

L001eea:
	addq.l	#2,a1
	bra.s	L001edc

L001eee:
	cmp.b	#$81,d0
	beq.s	L001f5c
	cmp.b	#$82,d0
	beq.s	L001f42
	cmp.b	#$a0,d0
	beq.s	L001f66
	cmp.b	#$b0,d0
	beq.s	L001f78
	cmp.b	#$c0,d0
	beq.w	L001fa2
	cmp.b	#$f0,d0
	beq.w	L001fda
	cmp.b	#$f1,d0
	beq.w	L001fe2
	cmp.b	#$ff,d0
	beq.w	L001ff4
	cmp.b	#$90,d0
	bne.s	L001eea
	move.b	(a1)+,d0
	lsl.w	#8,d0
	move.b	(a1)+,d0
	move.w	d0,(L007550)
	move.b	#$01,(L007a1a)
	bra.s	L001edc

L001f42:
	move.b	(a1),d0
	subq.b	#1,d0
	bmi.s	L001eea
	move.b	d0,($0028,a5)
	move.l	d3,(a3)
	bra.s	L001eea

L001f50:
	move.l	d3,($0008,a3)
	move.b	(a1)+,($002a,a5)
	addq.l	#1,a1
	bra.s	L001edc

L001f5c:
	move.b	(a1)+,($0029,a5)
	addq.l	#1,a1
	bra.w	L001edc

L001f66:
	move.l	d3,($0004,a3)
	move.b	(a1)+,($002c,a5)
	subq.b	#1,($002c,a5)
	addq.l	#1,a1
	bra.w	L001edc

L001f78:
	move.b	(a1)+,d0
	move.b	(a1)+,d2
	cmpi.b	#$07,d0
	bne.s	L001f8e
	move.l	d3,($0008,a3)
	move.b	d2,($002a,a5)
	bra.w	L001edc

L001f8e:
	cmpi.b	#$0a,d0
	bne.w	L001edc
	move.l	d3,($000c,a3)
	move.b	d2,($002b,a5)
	bra.w	L001edc

L001fa2:
	move.b	(a1)+,d0
	move.b	(a1)+,d2
	tst.b	d0
	bne.s	L001fc4
	move.b	d2,($0012,a5)
	move.l	a1,($000a,a5)
	clr.b	($0040,a5)
	clr.b	($0042,a5)
	move.b	#$01,($0044,a5)
	bra.w	L001edc

L001fc4:
	cmpi.b	#$04,d0
	bne.w	L001edc
	move.b	#$01,($0020,a5)
	move.l	a1,($0022,a5)
	bra.w	L001edc

L001fda:
	subq.w	#1,d1
	beq.s	L001ff4
	bra.w	L001eea

L001fe2:
	moveq.l	#$00,d0
	move.b	(a1)+,d0
	swap.w	d0
	move.b	(a1)+,d0
	jsr	(L004a4e)
	bra.w	L001edc

L001ff4:
	subq.l	#1,a1
	movem.l	(sp)+,d0-d3
	rts

L001ffc:
	movem.l	d0-d5/a3/a5,-(sp)
	moveq.l	#$00,d0
L002002:
	lea.l	(L00e5f4),a3
	lea.l	(L00c616),a5
	moveq.l	#$18,d1
	moveq.l	#$ff,d2
	moveq.l	#$ff,d3
	moveq.l	#$ff,d4
	moveq.l	#$ff,d5
L002018:
	cmp.b	($0028,a5),d0
	bne.s	L002078
	cmp.l	(a3),d5
	bgt.s	L002024
	move.l	(a3),d5
L002024:
	cmp.l	($0004,a3),d2
	bgt.s	L002040
	move.l	($0004,a3),d2
	cmp.l	d2,d5
	bgt.s	L002040
	move.b	d0,-(sp)
	move.b	($002c,a5),-(sp)
	jsr	(L00509e)
	addq.l	#4,sp
L002040:
	cmp.l	($0008,a3),d3
	bgt.s	L00205c
	move.l	($0008,a3),d3
	cmp.l	d3,d5
	bgt.s	L00205c
	move.b	d0,-(sp)
	move.b	($002a,a5),-(sp)
	jsr	(L004fd8)
	addq.l	#4,sp
L00205c:
	cmp.l	($000c,a3),d4
	bgt.s	L002078
	move.l	($000c,a3),d4
	cmp.l	d4,d5
	bgt.s	L002078
	move.b	d0,-(sp)
	move.b	($002b,a5),-(sp)
	jsr	(L005022)
	addq.l	#4,sp
L002078:
	lea.l	($0054,a5),a5
	lea.l	($0010,a3),a3
	dbra.w	d1,L002018
	addq.w	#1,d0
	cmpi.w	#$0018,d0
	bne.w	L002002
	movem.l	(sp)+,d0-d5/a3/a5
	rts

L002094:
	tst.w	d2
	bpl.s	L0020a2
	moveq.l	#$00,d0
	move.b	(L007a37),d0
	rts

L0020a2:
	andi.b	#$7f,d2
	move.b	d2,(L007a37)
	bra.w	L002f9c

L0020b0:
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	rts

L0020da:
	bsr.w	L002f6a
	subq.w	#1,d2
	bmi.w	L002f98
	cmp.l	#$00000050,d2
	bcc.w	L002f98
	lea.l	(L00c396),a0
	lsl.l	#2,d2
	move.l	(a0,d2.w),d0
	rts

L0020fc:
	bsr.w	L002f6a
	movem.l	d0-d2/a0-a5,-(sp)
	tst.w	(L007a30)
	beq.s	L002110
	bsr.w	L001cb6
L002110:
	lea.l	(L00c4d6),a0
	moveq.l	#$4f,d0			;'O'
L002118:
	move.l	#$00000004,(a0)+
	dbra.w	d0,L002118
	bsr.w	L003ec0
	tst.l	d0
	bmi.s	L002144
	bsr.w	L003f10
	bsr.w	L00161a
	moveq.l	#$ff,d2
	bsr.w	L001916
	bsr.w	L003f4a
	bsr.w	L003f6e
	bsr.w	L003ed6
L002144:
	movem.l	(sp)+,d0-d2/a0-a5
	bra.w	L002f9c

L00214c:
	tst.l	(L007a28)
	bmi.s	L00215c
	bsr.w	L001cb6
	bsr.w	L0027a0
L00215c:
	rts

L00215e:
	tst.w	d2
	beq.w	L002f9c
	bmi.s	L00217c
	subq.w	#1,d2
	cmpi.w	#$0050,d2		;'P'
	bcc.w	L002f98
	move.w	d2,d0
	bsr.w	L003f8c
	move.l	($000a,a1),d0
	rts

L00217c:
	moveq.l	#$4f,d0			;'O'
	moveq.l	#$00,d1
L002180:
	bsr.w	L003f8c
	add.l	($000a,a1),d1
	dbra.w	d0,L002180
	move.l	d1,d0
	rts

L002190:
	move.l	d2,d0
	bmi.s	L0021c6
	swap.w	d0
	subq.w	#1,d0
	bmi.s	L0021c6
	cmpi.w	#$0018,d0
	bgt.w	L002f90
	subq.w	#1,d2
	bmi.s	L0021b4
	cmpi.w	#$0018,d2
	bgt.w	L002f90
	bsr.s	L0021da
	bra.w	L002f9c

L0021b4:
	bsr.w	L003fcc
	moveq.l	#$00,d0
	move.b	($0028,a5),d0
	bsr.w	L0015d8
	addq.w	#1,d0
	rts

L0021c6:
	tst.w	(L007a30)
	beq.s	L0021d2
	bsr.w	L001cb6
L0021d2:
	bsr.w	L00161a
	bra.w	L002f9c

L0021da:
	movem.l	d0-d1/a5,-(sp)
	lea.l	(L00c616),a5
	mulu.w	#$0054,d0
	adda.w	d0,a5
	move.w	d2,d0
	bsr.w	L0015c8
	cmp.b	($0028,a5),d0
	beq.s	L002236
	tst.w	(L007a30)
	beq.s	L00220a
	move.b	#-$01,(L007a14)
	bsr.w	L003eb6
L00220a:
	bsr.w	L00431a
	bsr.w	L00406a
	move.b	d0,($0028,a5)
	move.b	d0,-(sp)
	move.b	($002c,a5),-(sp)
	bsr.w	L00509e
	addq.l	#2,sp
	move.b	($002a,a5),-(sp)
	bsr.w	L004fd8
	addq.l	#2,sp
	move.b	($002b,a5),-(sp)
	bsr.w	L005022
	addq.l	#4,sp
L002236:
	movem.l	(sp)+,d0-d1/a5
	rts

L00223c:
	move.l	d2,d0
	lea.l	(L00ce7c),a1
	adda.l	#$00000032,a1
	swap.w	d0
	subq.w	#1,d0
	bmi.s	L00227c
	cmpi.w	#$0018,d0
	bgt.w	L002f90
	subq.w	#1,d2
	bmi.s	L00226e
	cmpi.w	#$00c7,d2
	bgt.w	L002f7c
	bsr.w	L003fcc
	bsr.s	L00229a
	bra.w	L002f9c

L00226e:
	bsr.w	L003fcc
	moveq.l	#$00,d0
	move.b	($002c,a5),d0
	addq.w	#1,d0
	rts

L00227c:
	subq.w	#1,d2
	bmi.w	L002f7c
	cmpi.w	#$00c7,d2
	bgt.w	L002f7c
	moveq.l	#$17,d0
L00228c:
	bsr.w	L003fcc
	bsr.s	L00229a
	dbra.w	d0,L00228c
	bra.w	L002f9c

L00229a:
	moveq.l	#$00,d1
	move.b	($0028,a5),d1
	move.b	d2,($002c,a5)
	move.b	d2,(a1,d1.w)
	move.b	d1,-(sp)
	move.b	d2,-(sp)
	bsr.w	L00509e
	addq.l	#4,sp
	rts

L0022b4:
	move.l	d2,d0
	lea.l	(L00ce7c),a1
	swap.w	d0
	subq.w	#1,d0
	bmi.s	L0022ee
	cmpi.w	#$0018,d0
	bgt.w	L002f90
	cmpi.w	#$0000,d2
	blt.s	L0022e2
	cmpi.w	#$007f,d2
	bgt.w	L002f7c
	bsr.w	L003fcc
	bsr.s	L00230c
	bra.w	L002f9c

L0022e2:
	bsr.w	L003fcc
	moveq.l	#$00,d0
	move.b	($002a,a5),d0
	rts

L0022ee:
	tst.w	d2
	bmi.w	L002f7c
	cmpi.w	#$007f,d2
	bgt.w	L002f7c
	moveq.l	#$17,d0
L0022fe:
	bsr.w	L003fcc
	bsr.s	L00230c
	dbra.w	d0,L0022fe
	bra.w	L002f9c

L00230c:
	moveq.l	#$00,d1
	move.b	($0028,a5),d1
	move.b	d2,($002a,a5)
	move.b	d2,(a1,d1.w)
	move.b	d1,-(sp)
	move.b	d2,-(sp)
	bsr.w	L004fd8
	addq.l	#4,sp
	rts

L002326:
	move.l	d2,d0
	lea.l	(L00ce7c),a1
	adda.l	#$00000019,a1
	swap.w	d0
	subq.w	#1,d0
	bmi.s	L002366
	cmpi.w	#$0018,d0
	bgt.w	L002f90
	cmpi.w	#$0000,d2
	blt.s	L00235a
	cmpi.w	#$007f,d2
	bgt.w	L002f7c
	bsr.w	L003fcc
	bsr.s	L002384
	bra.w	L002f9c

L00235a:
	bsr.w	L003fcc
	moveq.l	#$00,d0
	move.b	($002b,a5),d0
	rts

L002366:
	tst.w	d2
	bmi.w	L002f7c
	cmpi.w	#$007f,d2
	bgt.w	L002f7c
	moveq.l	#$17,d0
L002376:
	bsr.w	L003fcc
	bsr.s	L002384
	dbra.w	d0,L002376
	bra.w	L002f9c

L002384:
	moveq.l	#$00,d1
	move.b	($0028,a5),d1
	move.b	d2,($002b,a5)
	move.b	d2,(a1,d1.w)
	move.b	d1,-(sp)
	move.b	d2,-(sp)
	bsr.w	L005022
	addq.l	#4,sp
	rts

L00239e:
	move.l	d2,d0
	cmpi.w	#$007f,d2
	blt.s	L0023ac
	move.w	#$7f7f,d2
	bra.s	L0023be

L0023ac:
	lsl.w	#7,d2
	ror.w	#7,d2
	move.w	d2,d1
	ror.w	#1,d1
	andi.w	#$7f00,d1
	andi.w	#$007f,d2
	or.w	d1,d2
L0023be:
	swap.w	d0
	subq.w	#1,d0
	bmi.s	L0023d6
	cmpi.w	#$0018,d0
	bgt.w	L002f90
	bsr.w	L003fcc
	bsr.s	L0023e6
	bra.w	L002f9c

L0023d6:
	moveq.l	#$18,d0
L0023d8:
	bsr.w	L003fcc
	bsr.s	L0023e6
	dbra.w	d0,L0023d8
	bra.w	L002f9c

L0023e6:
	move.b	($0028,a5),-(sp)
	move.w	d2,-(sp)
	bsr.w	L005116
	move.w	d2,($0030,a5)
	addq.l	#4,sp
	rts

L0023f8:
	move.l	d2,d0
	swap.w	d0
	subq.w	#1,d0
	bmi.s	L002412
	cmpi.w	#$0018,d0
	bgt.w	L002f90
	bsr.w	L003fcc
	bsr.s	L002422
	bra.w	L002f9c

L002412:
	moveq.l	#$18,d0
L002414:
	bsr.w	L003fcc
	bsr.s	L002422
	dbra.w	d0,L002414
	bra.w	L002f9c

L002422:
	move.b	($0028,a5),-(sp)
	move.b	d2,-(sp)
	bsr.w	L00515a
	addq.l	#4,sp
	rts

L002430:
	move.l	d2,d0
	swap.w	d0
	subq.w	#1,d0
	bmi.s	L002466
	cmpi.w	#$0018,d0
	bgt.w	L002f90
	cmpi.w	#$0000,d2
	blt.s	L00245a
	cmpi.w	#$007f,d2
	bgt.w	L002f7c
	bsr.w	L003fcc
	move.b	d2,($0029,a5)
	bra.w	L002f9c

L00245a:
	bsr.w	L003fcc
	moveq.l	#$00,d0
	move.b	($0029,a5),d0
	rts

L002466:
	tst.w	d2
	bmi.w	L002f7c
	cmpi.w	#$007f,d2
	bgt.w	L002f7c
	moveq.l	#$17,d0
L002476:
	bsr.w	L003fcc
	move.b	d2,($0029,a5)
	dbra.w	d0,L002476
	bra.w	L002f9c

L002486:
	move.l	d2,d0
	swap.w	d0
	subq.w	#1,d0
	bmi.s	L0024c2
	cmpi.w	#$0018,d0
	bgt.w	L002f90
	cmpi.w	#$0000,d2
	blt.s	L0024b2
	cmpi.w	#$0030,d2		;'0'
	bgt.w	L002f7c
	subi.b	#$18,d2
	bsr.w	L003fcc
	bsr.s	L0024e4
	bra.w	L002f9c

L0024b2:
	bsr.w	L003fcc
	moveq.l	#$00,d0
	move.b	($002d,a5),d0
	addi.b	#$18,d0
	rts

L0024c2:
	tst.w	d2
	bmi.w	L002f7c
	cmpi.w	#$0030,d2		;'0'
	bgt.w	L002f7c
	subi.b	#$18,d2
	moveq.l	#$17,d0
L0024d6:
	bsr.w	L003fcc
	bsr.s	L0024e4
	dbra.w	d0,L0024d6
	bra.w	L002f9c

L0024e4:
	cmp.b	($002d,a5),d2
	beq.s	L002514
	move.b	d2,d1
	sub.b	($002d,a5),d1
	tst.w	(L007a30)
	beq.s	L002504
	move.b	#-$01,(L007a14)
	bsr.w	L003eb6
L002504:
	bsr.w	L00431a
	move.b	d2,($002d,a5)
	add.b	d1,($003b,a5)
	add.b	d1,($003d,a5)
L002514:
	rts

L002516:
	move.l	d2,d0
	swap.w	d0
	bsr.w	L0015b8
	tst.w	d2
	bmi.s	L00253c
	move.w	d2,d1
	lsr.w	#8,d1
	subq.w	#1,d0
	bmi.s	L002540
	cmpi.w	#$0018,d0
	bgt.w	L002f90
	bsr.w	L003fcc
	move.b	($0028,a5),d0
	bsr.s	L00254c
L00253c:
	bra.w	L002f9c

L002540:
	moveq.l	#$17,d0
L002542:
	bsr.s	L00254c
	dbra.w	d0,L002542
	bra.w	L002f9c

L00254c:
	move.l	d0,-(sp)
	tst.w	(L007a30)
	beq.s	L002562
	move.b	#-$01,(L007a14)
	bsr.w	L003eb6
L002562:
	cmpi.b	#$10,d0
	bcs.s	L002574
	subi.b	#$10,d0
	bsr.w	L005f36
	move.b	d2,d0
	bra.s	L002588

L002574:
	add.b	#$b0,d0
	bsr.w	L00519e
	move.b	d1,d0
	bsr.w	L00519e
	move.b	d2,d0
	bsr.w	L00519e
L002588:
	move.l	(sp)+,d0
	rts

L00258c:
	tst.w	(L007a30)
	beq.s	L0025a0
	move.b	#-$01,(L007a14)
	bsr.w	L003eb6
L0025a0:
	move.w	d2,d0
	beq.w	L002f9c
	bmi.s	L0025b4
	cmpi.w	#$001a,d2
	bcc.w	L002f90
	bsr.w	L0015f8
L0025b4:
	move.w	d0,-(sp)
	bsr.w	L004efa
	bsr.w	L004f7a
	bsr.w	L004f0c
	bsr.w	L004f1e
	addq.l	#2,sp
	bra.w	L002f9c

L0025cc:
	tst.w	(L007a30)
	beq.s	L0025e0
	move.b	#-$01,(L007a14)
	bsr.w	L003eb6
L0025e0:
	move.w	d2,d0
	beq.w	L002f9c
	bmi.s	L0025f4
	cmpi.w	#$001a,d2
	bcc.w	L002f90
	bsr.w	L0015f8
L0025f4:
	move.w	d0,-(sp)
	bsr.w	L004f1e
	addq.l	#2,sp
	bra.w	L002f9c

L002600:
	tst.w	(L007a30)
	beq.s	L002614
	move.b	#-$01,(L007a14)
	bsr.w	L003eb6
L002614:
	move.w	d2,d0
	beq.w	L002f9c
	bmi.s	L002628
	cmpi.w	#$001a,d2
	bcc.w	L002f90
	bsr.w	L0015f8
L002628:
	move.w	d0,-(sp)
	bsr.w	L004efa
	addq.l	#2,sp
	bra.w	L002f9c

L002634:
	tst.l	d2
	beq.s	L002658
	clr.w	d0
	tst.w	(L007a30)
	beq.s	L00264e
	move.b	#-$01,(L007a14)
	bsr.w	L003eb6
L00264e:
	move.b	(a1)+,d0
	bsr.w	L00519e
	subq.l	#1,d2
	bne.s	L00264e
L002658:
	bra.w	L002f9c

L00265c:
	moveq.l	#$00,d0
	tst.l	d2
	bmi.s	L0026bc
	bne.s	L002666
	moveq.l	#$ff,d2
L002666:
	bsr.w	L003fac
	bsr.w	L003fcc
	btst.l	d0,d2
	beq.s	L00268a
	tst.b	($003f,a5)
	bne.s	L0026b0
	cmpi.l	#$00000004,($000a,a1)
	ble.s	L0026b0
	move.b	#$01,($003f,a5)
	bra.s	L0026b0

L00268a:
	tst.b	($003f,a5)
	beq.s	L0026b0
	bsr.w	L00406a
	tst.w	(L007a30)
	beq.s	L0026a8
	move.b	#-$01,(L007a14)
	bsr.w	L003eb6
L0026a8:
	bsr.w	L00431a
	clr.b	($003f,a5)
L0026b0:
	addq.l	#1,d0
	cmpi.w	#$0019,d0
	bne.s	L002666
	bra.w	L002f9c

L0026bc:
	moveq.l	#$00,d0
	moveq.l	#$00,d2
L0026c0:
	bsr.w	L003fcc
	tst.b	($003f,a5)
	beq.s	L0026cc
	bset.l	d0,d2
L0026cc:
	addq.w	#1,d0
	cmpi.w	#$0019,d0
	bne.s	L0026c0
	move.l	d2,d0
	rts

L0026d8:
	swap.w	d2
	move.w	d2,d0
	beq.w	L002f90
	cmpi.w	#$001a,d0
	bcc.w	L002f90
	swap.w	d2
	move.b	d2,d1
	ror.w	#8,d2
	tst.b	d1
	bmi.w	L002f88
	tst.b	d2
	bmi.w	L002f7c
	bsr.w	L0015f8
	subq.w	#1,d0
	move.b	d0,-(sp)
	move.b	d2,-(sp)
	move.b	d1,-(sp)
	bsr.w	L004e0c
	addq.l	#6,sp
	bra.w	L002f9c

L002710:
	swap.w	d2
	move.w	d2,d0
	beq.w	L002f90
	cmpi.w	#$001a,d0
	bcc.w	L002f90
	swap.w	d2
	move.b	d2,d1
	ror.w	#8,d2
	tst.b	d1
	bmi.w	L002f88
	tst.b	d2
	bmi.w	L002f7c
	bsr.w	L0015f8
	subq.w	#1,d0
	move.b	d0,-(sp)
	move.b	d2,-(sp)
	move.b	d1,-(sp)
	bsr.w	L004e88
	addq.l	#6,sp
	bra.w	L002f9c

L002748:
	movem.l	d0/a1,-(sp)
	bsr.w	L004002
	move.w	#$0078,d0		;'x'
	move.w	d0,(L007550)
	bsr.w	L004d84
	tst.b	(L0074c8)
	bne.s	L00278a
	move.w	(L007566),d0
	bsr.w	L005248
	move.b	#$00,($00eafa03)
	move.b	#$86,($00eafa0d)
	move.b	#$b0,(L007555)
	bra.s	L002794

L00278a:
	moveq.l	#$6a,d0			;'j'
	lea.l	(L00576c),a1
	trap	#15
L002794:
	clr.l	(L007a28)
	movem.l	(sp)+,d0/a1
	rts

L0027a0:
	movem.l	d0/a1,-(sp)
	move.b	#$b0,(L007555)
	bsr.w	L004b8c
	tst.b	(L0074c8)
	bne.s	L0027ca
	move.b	#$00,($00eafa03)
	move.b	#$00,($00eafa0d)
	bra.s	L0027d4

L0027ca:
	moveq.l	#$6a,d0			;'j'
	movea.l	#$00000000,a1
	trap	#15
L0027d4:
	move.l	#$ffffffff,(L007a28)
	movem.l	(sp)+,d0/a1
	rts

L0027e4:
	movem.l	d1/a0-a1,-(sp)
	tst.w	d2
	beq.s	L00281c
	bmi.s	L002824
	lea.l	(L002862),a0
	move.l	a1,d1
	ble.s	L00281a
	tst.w	(L007a30)
	beq.s	L002804
	bsr.w	L001cb6
L002804:
	move.l	a1,($0006,a0)
	move.w	d2,($0004,a0)
	clr.w	($0002,a0)
	move.b	#$01,(a0)
	clr.b	($0001,a0)
	bra.s	L00281c

L00281a:
	clr.l	(a0)
L00281c:
	movem.l	(sp)+,d1/a0-a1
	bra.w	L002f9c

L002824:
	move.l	#L002864,d0
	addq.l	#2,d0
	movem.l	(sp)+,d1/a0-a1
	rts

L002832:
	movem.l	d0/a0,-(sp)
	lea.l	(L002862),a0
	tst.b	($0001,a0)
	beq.s	L00285c
	move.w	($0002,a0),d0
	subq.w	#1,d0
	ble.s	L002850
	move.w	d0,($0002,a0)
	bra.s	L00285c

L002850:
	move.w	($0004,a0),($0002,a0)
	movea.l	($0006,a0),a0
	jsr	(a0)
L00285c:
	movem.l	(sp)+,d0/a0
	rts

L002862:
	.dc.b	$00
L002863:
	.dc.b	$00
L002864:
	.dc.w	$0000,$0000,$0000,$0000
L00286c:
	tst.w	d2
	bne.s	L00287c
	bsr.s	L002898
	jsr	(L004d0a)
	bra.w	L002f9c

L00287c:
	subq.w	#1,d2
	bne.s	L00288c
	bsr.s	L002898
	jsr	(L004d32)
	bra.w	L002f9c

L00288c:
	bsr.s	L002898
	jsr	(L004d72)
	bra.w	L002f9c

L002898:
	tst.w	(L007a30)
	beq.s	L0028a4
	bsr.w	L001cb6
L0028a4:
	bra.w	L002f9c

L0028a8:
	move.l	d2,d0
	cmp.w	#$0010,d2
	bgt.s	L0028da
	cmp.w	#$0001,d2
	blt.s	L0028da
	swap.w	d2
	cmp.w	#$0010,d2
	bgt.s	L0028da
	cmp.w	#$0001,d2
	blt.s	L0028da
	tst.w	(L007a30)
	beq.s	L0028de
	move.l	d0,(L0028ea)
	move.w	#$0001,(L0028e8)
L0028da:
	bra.w	L002f9c

L0028de:
	jsr	(L004a4e)
	bra.w	L002f9c

L0028e8:
	.dc.w	$0000
L0028ea:
	.dc.b	$00
L0028eb:
	.dc.b	$04,$00
L0028ed:
	.dc.b	$04
L0028ee:
	tst.l	d2
	beq.s	L00291e
	cmpi.l	#$ffffffff,d2
	beq.s	L00291e
	cmpi.l	#$00000001,d2
	beq.s	L002928
	move.l	d2,d0
	swap.w	d0
	tst.w	d0
	bmi.s	L002910
	move.w	d0,(L0049ca)
L002910:
	tst.w	d2
	bmi.s	L00291a
	move.w	d2,(L0049cc)
L00291a:
	bra.w	L002f9c

L00291e:
	jsr	(L004ac0)
	bra.w	L002f9c

L002928:
	jsr	(L004aae)
	bra.w	L002f9c

L002932:
	bsr.w	L002f6a
	clr.w	(L007850)
	tst.w	d2
	bne.s	L00294e
	bsr.w	L004c66
	clr.w	(L007852)
	bra.w	L002f9c

L00294e:
	bsr.w	L004c08
	move.b	#$01,(L007852)
	bra.w	L002f9c

L00295e:
	bsr.w	L002f6a
	move.l	a1,d0
	bmi.w	L002f8c
	tst.l	d2
	bmi.w	L002f8c
	clr.w	(L007850)
	clr.w	(L007854)
	clr.b	(L007853)
	clr.w	(L00783a)
	clr.w	(L005ad4)
	clr.l	(L007844)
	move.w	(L00d9f0),(L00d9f2)
	move.w	(L00d9f0),(L000414)
	move.l	a1,(L00783c)
	move.l	a1,(L007848)
	move.l	a1,(L00784c)
	move.l	d2,(L007840)
	tst.w	d3
	ble.s	L0029c8
	move.w	d3,(L00783a)
L0029c8:
	move.b	#$01,(L007853)
	bra.w	L002f9c

L0029d4:
	bsr.w	L002f6a
	cmpi.w	#$0101,(L007852)
	bne.w	L002f80
	clr.w	(L007850)
	clr.w	(L005ad4)
	clr.l	(L007844)
	move.w	(L00d9f0),(L00d9f2)
	move.w	(L00d9f0),(L000414)
	move.l	(L00783c),d0
	move.l	d0,(L007848)
	move.l	d0,(L00784c)
	subq.w	#1,d2
	bmi.s	L002a2a
	move.w	d2,(L007854)
	bra.w	L002f9c

L002a2a:
	clr.w	(L007854)
	move.w	#$0001,(L007850)
	cmpi.w	#$0002,(L00783a)
	bne.w	L002f9c
	bsr.w	L001b60
	bra.w	L002f9c

L002a4c:
	bsr.w	L002f6a
	clr.w	(L007850)
	bsr.w	L0059de
	move.l	(L007844),d0
	cmpi.w	#$0002,(L00783a)
	bne.s	L002a72
	move.l	d0,-(sp)
	bsr.w	L001cb6
	move.l	(sp)+,d0
L002a72:
	rts

L002a74:
	bsr.w	L002f6a
	move.l	(L007844),d0
	rts

L002a80:
	bsr.w	L002f6a
	tst.b	d2
	bne.s	L002a90
	bsr.w	L005560
	bra.w	L002f9c

L002a90:
	bsr.w	L005548
	bra.w	L002f9c

L002a98:
	bsr.w	L0064f8
	bra.w	L002f9c

L002aa0:
	tst.l	d2
	bpl.s	L002aac
	bsr.w	L0068ac
	bra.w	L002f9c

L002aac:
	bsr.w	L00675a
	rts

L002ab2:
	movem.l	d1-d3/a0-a1,-(sp)
	lea.l	(L00d5e0),a0
	move.l	d2,d3
	swap.w	d2
	tst.w	d2
	bpl.s	L002aca
	move.w	#$0000,d2
	bra.s	L002ad4

L002aca:
	cmpi.w	#$0081,d2
	ble.s	L002ad4
	move.w	#$0081,d2
L002ad4:
	lsl.w	#3,d2
	adda.w	d2,a0
	tst.w	d3
	bpl.s	L002ae0
	move.w	#$0403,d3
L002ae0:
	moveq.l	#$ff,d0
	moveq.l	#$00,d2
	move.w	(a0)+,d2
	beq.s	L002b18
	addq.l	#2,a0
	movea.l	(a0)+,a1
	jsr	(L006900)
	tst.l	d0
	beq.s	L002afe
	moveq.l	#$00,d1
	jsr	(L00690a)
L002afe:
	move.b	#$01,(L006bc3)
	move.b	#$01,(L006bc7)
	move.w	d3,d1
	jsr	(L00694c)
	moveq.l	#$00,d0
L002b18:
	movem.l	(sp)+,d1-d3/a0-a1
	rts

L002b1e:
	move.b	#$01,(L006bc3)
	move.b	#$01,(L006bc7)
	jsr	(L00684a)
	beq.s	L002b42
	clr.b	(L006bc3)
	clr.b	(L006bc7)
L002b42:
	rts

L002b44:
	moveq.l	#$00,d0
	lea.l	(L00d5e0),a2
	andi.l	#$000000ff,d2
	lsl.l	#3,d2
	adda.l	d2,a2
	move.w	(a2),d0
	beq.s	L002b72
	move.l	a1,d2
	bmi.s	L002b72
	tst.l	d3
	beq.s	L002b72
	movea.l	($0004,a2),a2
	move.l	d0,d2
L002b68:
	move.b	(a2)+,(a1)+
	subq.l	#1,d2
	beq.s	L002b72
	subq.l	#1,d3
	bne.s	L002b68
L002b72:
	rts

L002b74:
	tst.w	d2
	bmi.s	L002b8e
	moveq.l	#$00,d0
	lea.l	(L00d5e0),a2
	andi.l	#$0000007f,d2
	lsl.l	#3,d2
	adda.l	d2,a2
	move.w	(a2),d0
	rts

L002b8e:
	move.l	(L007722),d0
	rts

L002b96:
	jsr	(L006900)
	rts

L002b9e:
	tst.w	d2
	bpl.s	L002bac
	moveq.l	#$00,d0
	move.w	(L007a3c),d0
	rts

L002bac:
	cmpi.w	#$0006,d2
	bcc.s	L002c08
	move.w	d2,(L007a3c)
	lea.l	(L002c0c),a0
	lsl.w	#2,d2
	adda.w	d2,a0
	moveq.l	#$00,d2
	moveq.l	#$00,d3
	moveq.l	#$00,d4
	move.b	(a0)+,d2
	move.b	(a0)+,d3
	move.b	(a0)+,d4
	lea.l	(L00ce63),a0
	moveq.l	#$00,d0
L002bd6:
	move.b	d0,(a0,d2.w)
	addq.w	#1,d2
	addq.w	#1,d0
	cmpi.w	#$0010,d0
	bne.s	L002bd6
L002be4:
	move.b	d0,(a0,d3.w)
	addq.w	#1,d3
	addq.w	#1,d0
	cmpi.w	#$0018,d0
	bne.s	L002be4
	move.b	d0,(a0,d4.w)
	bsr.w	L00161a
	clr.w	-(sp)
	jsr	(L004efa)
	addq.l	#2,sp
	bra.w	L002f9c

L002c08:
	moveq.l	#$06,d0
	rts

L002c0c:
	.dc.w	$0900,$0800,$0800,$1800,$0010,$1800,$0011,$1000
	.dc.w	$0901,$0000,$0111,$0000
L002c24:
	moveq.l	#$00,d0
	tst.b	(L0074c8)
	beq.s	L002c30
	moveq.l	#$ff,d0
L002c30:
	rts

L002c32:
	move.l	#L00be96,d0
	lsl.l	#4,d2
	add.l	d2,d0
	rts

L002c3e:
	tst.w	d2
	bmi.s	L002c56
	subq.w	#1,d2
	bmi.s	L002c56
	lea.l	(L00c616),a0
	move.l	a0,d0
	mulu.w	#$0054,d2
	add.l	d2,d0
	rts

L002c56:
	lea.l	(Table2),a0
	move.l	a0,d0
	rts

L002c60:
	move.l	(L007a20),d0
	rts

L002c68:
	move.b	d2,d0
	bsr.w	L00519e
	bra.w	L002f9c

L002c72:
	tst.b	(L0074c8)
	bne.s	L002c9a
	lea.l	(L00d9f0),a0
	move.w	(a0)+,d2
	move.w	(a0)+,d1
	cmp.w	d1,d2
	beq.s	L002c9a
	moveq.l	#$00,d0
	move.b	(a0,d1.w),d0
	addq.w	#1,d1
	andi.w	#$03ff,d1
	move.w	d1,(-$0002,a0)
	rts

L002c9a:
	moveq.l	#$ff,d0
	rts

L002c9e:
	moveq.l	#$00,d0
	move.w	(L007a06),d0
	rts

L002ca8:
	moveq.l	#$00,d0
	tst.w	d2
	bmi.s	L002cc2
	bne.s	L002cb8
	clr.w	(L007a10)
	rts

L002cb8:
	move.w	#$0001,(L007a10)
	rts

L002cc2:
	move.w	(L007a10),d0
	rts

L002cca:
	moveq.l	#$00,d0
	tst.w	d2
	bmi.s	L002ce4
	bne.s	L002cda
	clr.w	(L007a34)
	rts

L002cda:
	move.w	#$0001,(L007a34)
	rts

L002ce4:
	move.w	(L007a34),d0
	rts

L002cec:
	moveq.l	#$00,d0
	tst.w	d2
	bmi.s	L002d02
	move.b	d2,(L007a36)
	moveq.l	#$18,d1
	jsr	(L0064ae)
	rts

L002d02:
	move.b	(L007a36),d0
	rts

L002d0a:
	moveq.l	#$4d,d3			;'M'
	bra.s	L002d14

L002d0e:
	moveq.l	#$4e,d3			;'N'
	bra.s	L002d14

L002d12:
	moveq.l	#$4f,d3			;'O'
L002d14:
	move.l	d2,d0
	swap.w	d0
	subq.w	#1,d0
	bmi.s	L002d40
	tst.w	d2
	bmi.s	L002d34
	cmpi.w	#$0001,d2
	ble.s	L002d28
	moveq.l	#$01,d2
L002d28:
	bsr.w	L003fcc
	move.b	d2,(a5,d3.w)
	bra.w	L002f9c

L002d34:
	bsr.w	L003fcc
	moveq.l	#$00,d0
	move.b	(a5,d3.w),d0
	rts

L002d40:
	tst.w	d2
	bmi.s	L002d5e
	cmpi.w	#$0001,d2
	ble.s	L002d4c
	moveq.l	#$01,d2
L002d4c:
	moveq.l	#$18,d0
L002d4e:
	bsr.w	L003fcc
	move.b	d2,(a5,d3.w)
	dbra.w	d0,L002d4e
	bra.w	L002f9c

L002d5e:
	moveq.l	#$ff,d0
	rts

L002d62:
	move.w	d2,d1
	bmi.s	L002da4
	move.w	d3,d2
	bmi.s	L002d88
	tst.w	(L007a30)
	beq.s	L002d7e
	move.b	#-$01,(L007a14)
	bsr.w	L003eb6
L002d7e:
	jsr	(L0064ae)
	moveq.l	#$00,d0
	rts

L002d88:
	movem.l	a0,-(sp)
	andi.w	#$00ff,d1
	lea.l	(L00cee0),a0
	add.w	d1,d1
	move.w	(a0,d1.w),d0
	ext.l	d0
	movem.l	(sp)+,a0
	rts

L002da4:
	move.l	#L00cee0,d0
	rts

L002dac:
	movem.l	d1-d3/a0,-(sp)
	tst.b	(L0074c8)
	bne.s	L002dee
	move.l	d2,d1
	swap.w	d1
	cmpi.w	#$0009,d1
	bgt.s	L002dee
	cmpi.w	#$0007,d2
	bgt.s	L002dee
	lea.l	($00eafa01),a0
	tst.w	d1
	bne.s	L002dde
	cmpi.w	#$0003,d2
	bgt.s	L002dee
	move.b	d3,(a0,d2.w)
	bra.s	L002de6

L002dde:
	move.b	d1,($0001,a0)
	move.b	d3,(a0,d2.w)
L002de6:
	moveq.l	#$00,d0
	movem.l	(sp)+,d1-d3/a0
	rts

L002dee:
	moveq.l	#$ff,d0
	movem.l	(sp)+,d1-d3/a0
	rts

L002df6:
	movem.l	d1-d2/a0-a1,-(sp)
	lea.l	(APianoStr2),a0
	subq.w	#1,d2
	bmi.s	L002e52
	cmpi.w	#$00c7,d2
	bgt.s	L002e52
	bra.s	L002e20

L002e0c:
	movem.l	d1-d2/a0-a1,-(sp)
	lea.l	(L00d0e0),a0
	tst.w	d2
	bmi.s	L002e52
	cmpi.w	#$007f,d2
	bgt.s	L002e52
L002e20:
	mulu.w	#$000a,d2
	adda.l	d2,a0
	move.l	#$20202020,(a0)		;'    '
	move.l	#$20202020,($0004,a0)	;'    '
	move.w	#$2020,($0008,a0)	;'  '
	moveq.l	#$09,d1
L002e3c:
	move.b	(a1)+,d0
	cmpi.b	#$20,d0			;' '
	bcs.s	L002e4a
	move.b	d0,(a0)+
	dbra.w	d1,L002e3c
L002e4a:
	moveq.l	#$00,d0
L002e4c:
	movem.l	(sp)+,d1-d2/a0-a1
	rts

L002e52:
	moveq.l	#$12,d0
	bra.s	L002e4c

L002e56:
	movem.l	d1-d2/a0-a1,-(sp)
	lea.l	(APianoStr2),a0
	subq.w	#1,d2
	bmi.s	L002eb2
	cmpi.w	#$00c7,d2
	bgt.s	L002eb2
	bra.s	L002e80

L002e6c:
	movem.l	d1-d2/a0-a1,-(sp)
	lea.l	(L00d0e0),a0
	tst.w	d2
	bmi.s	L002eb2
	cmpi.w	#$007f,d2
	bgt.s	L002eb2
L002e80:
	mulu.w	#$000a,d2
	adda.l	d2,a0
	move.l	#$20202020,(a1)		;'    '
	move.l	#$20202020,($0004,a1)	;'    '
	move.w	#$2020,($0008,a1)	;'  '
	moveq.l	#$09,d1
L002e9c:
	move.b	(a0)+,d0
	cmpi.b	#$20,d0			;' '
	bcs.s	L002eaa
	move.b	d0,(a1)+
	dbra.w	d1,L002e9c
L002eaa:
	moveq.l	#$00,d0
L002eac:
	movem.l	(sp)+,d1-d2/a0-a1
	rts

L002eb2:
	moveq.l	#$12,d0
	bra.s	L002eac

L002eb6:
	movem.l	d1-d4/a0-a1/a5,-(sp)
	tst.w	d2
	bpl.s	L002ece
	moveq.l	#$00,d0
	moveq.l	#$7f,d1
	sub.b	(L007a3a),d1
	move.b	d1,d0
	bra.w	L002f64

L002ece:
	andi.b	#$7f,d2
	moveq.l	#$7f,d1
	sub.b	d2,d1
	move.b	d1,(L007a3a)
	lea.l	(L00c616),a5
	moveq.l	#$00,d0
	moveq.l	#$00,d1
	moveq.l	#$00,d2
	moveq.l	#$00,d3
	moveq.l	#$18,d4
L002eec:
	move.b	($0028,a5),d0
	move.b	($002a,a5),d1
	tst.b	($0014,a5)
	beq.s	L002f5a
	btst.l	d0,d3
	bne.s	L002f5a
	bset.l	d0,d3
	sub.b	(L007a3a),d1
	bpl.s	L002f0a
	clr.b	d1
L002f0a:
	cmpi.b	#$0f,d0
	bgt.s	L002f3c
	tst.w	(L007a30)
	beq.s	L002f24
	move.b	#-$01,(L007a14)
	bsr.w	L003eb6
L002f24:
	addi.b	#$b0,d0
	bsr.w	L00519e
	move.b	#$07,d0
	bsr.w	L00519e
	move.b	d1,d0
	bsr.w	L00519e
	bra.s	L002f5a

L002f3c:
	subi.b	#$10,d0
	exg.l	d0,d1
	tst.w	(L007a30)
	beq.s	L002f56
	move.b	#-$01,(L007a14)
	bsr.w	L003eb6
L002f56:
	bsr.w	L005f76
L002f5a:
	lea.l	($0054,a5),a5
	dbra.w	d4,L002eec
	moveq.l	#$00,d0
L002f64:
	movem.l	(sp)+,d1-d4/a0-a1/a5
	rts

L002f6a:
	tst.l	(L007a28)
	bpl.s	L002f76
	moveq.l	#$08,d0
	addq.l	#4,sp
L002f76:
	rts

L002f78:
	moveq.l	#$27,d0			;'''
	rts

L002f7c:
	moveq.l	#$12,d0
	rts

L002f80:
	moveq.l	#$0c,d0
	rts

L002f84:
	moveq.l	#$0b,d0
	rts

L002f88:
	moveq.l	#$0a,d0
	rts

L002f8c:
	moveq.l	#$07,d0
	rts

L002f90:
	moveq.l	#$06,d0
	rts

L002f94:
	moveq.l	#$05,d0
	rts

L002f98:
	moveq.l	#$02,d0
	rts

L002f9c:
	moveq.l	#$00,d0
	rts

L002fa0:
	move.l	#$00000013,(L007a24)
	bra.w	L0031ca

L002fae:
	move.l	#$00000014,(L007a24)
	bra.w	L0031ca

L002fbc:
	move.l	#$00000015,(L007a24)
	bra.w	L0031ca

L002fca:
	move.l	#$00000016,(L007a24)
	bra.w	L0031ca

L002fd8:
	move.l	#$00000017,(L007a24)
	bra.w	L0031ca

L002fe6:
	move.l	#$00000018,(L007a24)
	bra.w	L0031ca

L002ff4:
	move.l	#$00000019,(L007a24)
	bra.w	L0031ca

L003002:
	move.l	#$0000001a,(L007a24)
	bra.w	L0031ca

L003010:
	move.l	#$0000001b,(L007a24)
	bra.w	L0031ca

L00301e:
	move.l	#$0000001c,(L007a24)
	bra.w	L0031ca

L00302c:
	move.l	#$0000001d,(L007a24)
	bra.w	L0031ca

L00303a:
	move.l	#$0000001e,(L007a24)
	bra.w	L0031ca

L003048:
	move.l	#$0000001f,(L007a24)
	bra.w	L0031ca

L003056:
	move.l	#$00000020,(L007a24)
	bra.w	L0031ca

L003064:
	move.l	#$00000021,(L007a24)
	bra.w	L0031ca

L003072:
	move.l	#$00000022,(L007a24)
	bra.w	L0031ca

L003080:
	move.l	#$00000023,(L007a24)
	bra.w	L0031ca

L00308e:
	move.l	#$00000024,(L007a24)
	bra.w	L0031ca

L00309c:
	move.l	#$00000025,(L007a24)
	bra.w	L0031ca

L0030aa:
	move.l	#$00000026,(L007a24)
	bra.w	L0031ca

L0030b8:
	move.l	#$00000027,(L007a24)
	bra.w	L0031ca

L0030c6:
	move.l	#$00000029,(L007a24)
	bra.w	L0031ca

L0030d4:
	move.l	#$0000002a,(L007a24)
	bra.w	L0031ca

L0030e2:
	move.l	#$0000002b,(L007a24)
	bra.w	L0031ca

L0030f0:
	move.l	#$0000002c,(L007a24)
	bra.w	L0031ca

L0030fe:
	move.l	#$0000002d,(L007a24)
	bra.w	L0031ca

L00310c:
	move.l	#$0000002e,(L007a24)
	bra.w	L0031ca

L00311a:
	move.l	#$0000002f,(L007a24)
	bra.w	L0031ca

L003128:
	move.l	#$00000030,(L007a24)
	bra.w	L0031ca

L003136:
	move.l	#$00000031,(L007a24)
	bra.w	L0031ca

L003144:
	move.l	#$00000032,(L007a24)
	bra.s	L0031ca

L003150:
	move.l	#$00000033,(L007a24)
	bra.s	L0031ca

L00315c:
	move.l	#$00000034,(L007a24)
	bra.s	L0031ca

L003168:
	move.l	#$00000035,(L007a24)
	bra.s	L0031ca

L003174:
	move.l	#$00000036,(L007a24)
	bra.s	L0031ca

L003180:
	move.l	#$00000037,(L007a24)
	bra.s	L0031ca

L00318c:
	move.l	#$00000038,(L007a24)
	bra.s	L0031ca

L003198:
	move.l	#$00000039,(L007a24)
	bra.s	L0031ca

L0031a4:
	move.l	#$0000003a,(L007a24)
	bra.s	L0031ca

L0031b0:
	move.l	#$0000003b,(L007a24)
	bra.s	L0031ca

L0031bc:
	move.l	#$0000003c,(L007a24)
	bra.w	L0031ca

L0031ca:
	movea.l	(L0078be),sp
L0031d0:
	unlk	a6
	rtr

L0031d4:
	tst.l	(L0078b6)
	beq.s	L0031d0
	move.l	#$00000028,(L007a24)
	bra.s	L0031ca

L0031e8:
	move.w	sr,-(sp)
	link.w	a6,#-$0014
	move.l	sp,(L0078be)
	andi.l	#$0000007f,d0
	move.l	d0,(L0078c2)
	clr.l	(L007a24)
	clr.l	(L0078b6)
	clr.l	(L0078ba)
	bsr.w	L003f8c
L003216:
	bsr.w	L0032e8
	move.b	(a0)+,d0
	bmi.s	L003226
	beq.s	L0031d4
	cmpi.b	#$2f,d0			;'/'
	bne.s	L00322e
L003226:
	bsr.w	L0032fe
	bcs.s	L0031d4
	bra.s	L003216

L00322e:
	bsr.w	L003ea4
	cmpi.b	#$41,d0			;'A'
	bcs.s	L003254
	cmpi.b	#$48,d0			;'H'
	bcc.s	L003254
	andi.w	#$0007,d0
	subq.w	#1,d0
	lea.l	(L003cdc),a2
	move.b	(a2,d0.w),d0
	bsr.w	L003b42
	bra.s	L003216

L003254:
	cmpi.b	#$52,d0			;'R'
	beq.w	L0036b2
	cmpi.b	#$59,d0			;'Y'
	beq.w	L0033aa
	cmpi.b	#$26,d0			;'&'
	beq.w	L00367a
	cmpi.b	#$50,d0			;'P'
	beq.w	L003372
	cmpi.b	#$4f,d0			;'O'
	beq.w	L0036e4
	cmpi.b	#$4c,d0			;'L'
	beq.w	L003722
	cmpi.b	#$56,d0			;'V'
	beq.w	L003950
	cmpi.b	#$3c,d0			;'<'
	beq.w	L003700
	cmpi.b	#$3e,d0			;'>'
	beq.w	L003712
	cmpi.b	#$54,d0			;'T'
	beq.w	L003848
	cmpi.b	#$40,d0			;'@'
	beq.w	L003752
	cmpi.b	#$51,d0			;'Q'
	beq.w	L0036be
	cmpi.b	#$7c,d0			;'|'
	beq.w	L0035e2
	cmpi.b	#$3a,d0			;':'
	beq.w	L003658
	cmpi.b	#$5b,d0			;'['
	beq.w	L0034e2
	cmpi.b	#$7b,d0			;'{'
	beq.w	L003408
	cmpi.b	#$7d,d0			;'}'
	beq.w	L00341e
	cmpi.b	#$27,d0			;'''
	beq.w	L003ce4
	bra.w	L002fa0

L0032e8:
	tst.b	(a0)
	beq.s	L0032fc
	cmpi.b	#$20,(a0)		;' '
	beq.s	L0032f8
	cmpi.b	#$09,(a0)
	bne.s	L0032fc
L0032f8:
	addq.l	#1,a0
	bra.s	L0032e8

L0032fc:
	rts

L0032fe:
	move.b	(a0)+,d0
	beq.s	L00330a
	cmpi.b	#$0a,d0
	bne.s	L0032fe
	rts

L00330a:
	ori.b	#$01,ccr
	rts

L003310:
	move.l	d0,-(sp)
	move.b	#$00,d0
	bsr.s	L00331c
	move.l	(sp)+,d0
	rts

L00331c:
	movem.l	d1-d2/a0-a2,-(sp)
	move.l	(L0078c2),d1
	lea.l	(L00c4d6),a0
	lea.l	(L00be96),a1
	asl.l	#2,d1
	move.l	(a0,d1.w),d2
	asl.l	#2,d1
	adda.l	d1,a1
	subq.l	#4,d2
	cmp.l	($000a,a1),d2
	blt.s	L003358
	addq.l	#1,($000a,a1)
	movea.l	(a1),a2
	move.b	d0,(a2)+
	move.b	#$ff,(a2)
	move.l	a2,(a1)
	movem.l	(sp)+,d1-d2/a0-a2
	rts

L003358:
	movea.l	(a1),a2
	move.b	#$ff,(a2)
	move.b	#$ff,($0001,a2)
	move.b	#$ff,($0002,a2)
	movem.l	(sp)+,d1-d2/a0-a2
	bra.w	L00301e

L003372:
	bsr.w	L003c8a
	bmi.w	L00311a
	bsr.w	L003e66
	move.l	d0,d1
	subq.b	#1,d1
	ble.s	L00338e
	subq.b	#1,d1
	beq.s	L003392
	move.b	#$40,d1			;'@'
	bra.s	L003392

L00338e:
	move.b	#$7f,d1
L003392:
	move.b	#$b0,d0
	bsr.s	L00331c
	move.b	#$0a,d0
	bsr.w	L00331c
	move.b	d1,d0
	bsr.w	L00331c
	bra.w	L003216

L0033aa:
	bsr.w	L003c8a
	bmi.w	L0030fe
	bsr.w	L003e66
	move.w	d0,d1
	bsr.w	L0032e8
	cmpi.b	#$2c,(a0)		;','
	beq.s	L0033cc
	cmpi.b	#$20,(a0)		;' '
	beq.s	L0033cc
	bra.w	L0030fe

L0033cc:
	addq.l	#1,a0
	bsr.w	L003c8a
	bmi.w	L0030fe
	bsr.w	L003e66
	cmp.l	#$000000ff,d0
	bhi.w	L0030fe
	move.w	d0,d2
	move.b	#$b0,d0
	tst.w	(L007a10)
	beq.s	L0033f4
	addq.b	#1,d0
L0033f4:
	bsr.w	L00331c
	move.b	d1,d0
	bsr.w	L00331c
	move.b	d2,d0
	bsr.w	L00331c
	bra.w	L003216

L003408:
	move.l	(a1),d0
	move.l	d0,(L0078b2)
	move.l	#$00000001,(L0078b6)
	bra.w	L003216

L00341e:
	moveq.l	#$00,d3
	clr.l	(L0078b6)
	bsr.w	L003c8a
	bmi.s	L003452
	bsr.w	L003e66
	tst.l	d0
	beq.w	L003010
	cmp.l	#$00000060,d0
	bhi.w	L003010
	move.l	#$000000c0,d1
	divu.w	d0,d1
	and.l	#$000000ff,d1
	move.l	d1,d0
	bra.s	L003456

L003452:
	move.b	($0006,a1),d0
L003456:
	tst.l	(L0078ba)
	beq.w	L0030d4
	cmp.l	(L0078ba),d0
	bcs.w	L0030c6
	move.l	(L0078ba),d1
	divu.w	d1,d0
	move.l	d0,d2
	swap.w	d2
	and.l	#$000000ff,d2
	move.l	d0,d1
	and.l	#$000000ff,d1
	move.l	d0,-(sp)
	movea.l	(L0078b2),a2
L00348c:
	tst.b	(a2)
	bmi.s	L0034c0
	move.b	($0001,a2),d0
	cmp.b	($0002,a2),d0
	bne.s	L0034a8
	bsr.s	L0034d6
	move.b	d0,($0001,a2)
	add.w	d0,d3
	move.b	d0,($0002,a2)
	bra.s	L0034ba

L0034a8:
	bsr.s	L0034d6
	move.b	d0,($0001,a2)
	add.w	d0,d3
	move.b	d1,d0
	bsr.w	L003c3c
	move.b	d0,($0002,a2)
L0034ba:
	subq.l	#1,(L0078ba)
L0034c0:
	addq.l	#3,a2
	ext.w	d0
	tst.l	(L0078ba)
	bne.s	L00348c
	move.w	d3,d0
	bsr.w	L003bda
	bra.w	L003216

L0034d6:
	move.l	d1,d0
	tst.l	d2
	beq.s	L0034e0
	addq.l	#1,d0
	subq.l	#1,d2
L0034e0:
	rts

L0034e2:
	bsr.w	L0032e8
	bsr.w	L003586
	tst.l	d0
	bmi.w	L002fae
	bsr.w	L0032e8
	cmpi.b	#$5d,(a0)+		;']'
	bne.w	L002fbc
	tst.b	d0
	beq.s	L00352e
	cmp.b	#$01,d0
	beq.s	L00353a
	cmp.b	#$03,d0
	bls.s	L003534
	cmp.b	#$05,d0
	bls.s	L00354c
	cmp.b	#$07,d0
	bls.s	L00355e
	cmp.b	#$08,d0
	beq.s	L003540
	cmp.b	#$09,d0
	bls.s	L003564
	cmp.b	#$0a,d0
	beq.s	L00356a
	bra.w	L002fa0

L00352e:
	move.b	#$03,d0
	bra.s	L00356e

L003534:
	move.b	#$04,d0
	bra.s	L00356e

L00353a:
	move.b	#$05,d0
	bra.s	L00356e

L003540:
	move.b	#$06,d0
	move.b	#$01,($0008,a1)
	bra.s	L00356e

L00354c:
	move.b	#$07,d0
	move.b	($000e,a1),($0009,a1)
	move.b	($000f,a1),($0005,a1)
	bra.s	L00356e

L00355e:
	move.b	#$08,d0
	bra.s	L00356e

L003564:
	move.b	#$09,d0
	bra.s	L00356e

L00356a:
	move.b	#$0a,d0
L00356e:
	move.l	d0,-(sp)
	move.b	#$c0,d0
	bsr.w	L00331c
	move.l	(sp)+,d0
	bsr.w	L00331c
	bsr.w	L003310
	bra.w	L003216

L003586:
	movem.l	d1-d2/a1-a3,-(sp)
	moveq.l	#$00,d2
	moveq.l	#$00,d1
	lea.l	(L007856),a3
L003594:
	movea.l	(a3,d1.l),a1
	bsr.s	L0035bc
	tst.l	d0
	bpl.s	L0035b2
	addq.l	#4,d1
	addq.l	#1,d2
	cmp.l	#$0000000b,d2
	bne.s	L003594
	moveq.l	#$ff,d0
	movem.l	(sp)+,d1-d2/a1-a3
	rts

L0035b2:
	move.l	d2,d0
	movea.l	a2,a0
	movem.l	(sp)+,d1-d2/a1-a3
	rts

L0035bc:
	movem.l	a0-a1,-(sp)
L0035c0:
	tst.b	(a1)
	beq.s	L0035d0
	move.b	(a0)+,d0
	bsr.w	L003ea4
	cmp.b	(a1)+,d0
	bne.s	L0035da
	bra.s	L0035c0

L0035d0:
	moveq.l	#$01,d0
	movea.l	a0,a2
	movem.l	(sp)+,a0-a1
	rts

L0035da:
	moveq.l	#$ff,d0
	movem.l	(sp)+,a0-a1
	rts

L0035e2:
	cmpi.b	#$3a,(a0)		;':'
	bne.s	L003624
	addq.l	#1,a0
	bsr.w	L003c8a
	bmi.s	L0035f6
	bsr.w	L003e66
	bra.s	L0035f8

L0035f6:
	moveq.l	#$02,d0
L0035f8:
	tst.l	d0
	beq.w	L002fca
	cmp.l	#$00000100,d0
	bhi.w	L002fca
	move.b	d0,d1
	move.b	#$c0,d0
	bsr.w	L00331c
	move.b	#$00,d0
	bsr.w	L00331c
	move.b	d1,d0
	bsr.w	L00331c
	bra.w	L003216

L003624:
	bsr.w	L003c8a
	bmi.w	L002fd8
	bsr.w	L003e66
	subq.l	#1,d0
	cmp.l	#$000000ff,d0
	bhi.w	L002fe6
	move.b	d0,d1
	move.b	#$c0,d0
	bsr.w	L00331c
	move.b	#$02,d0
	bsr.w	L00331c
	move.b	d1,d0
	bsr.w	L00331c
	bra.w	L003216

L003658:
	cmpi.b	#$7c,(a0)		;'|'
	bne.w	L003216
	addq.l	#1,a0
	move.b	#$c0,d0
	bsr.w	L00331c
	move.b	#$01,d0
	bsr.w	L00331c
	bsr.w	L003310
	bra.w	L003216

L00367a:
	move.l	a0,-(sp)
	movea.l	(a1),a0
L00367e:
	subq.l	#3,a0
	move.b	(a0),d0
	bpl.s	L003694
	cmpi.b	#$f0,d0
	beq.s	L00367e
	cmpi.b	#$f1,d0
	beq.s	L00367e
	bra.w	L003128

L003694:
	tst.b	($000e,a1)
	bne.s	L00369e
	move.b	d0,($000f,a1)
L00369e:
	move.b	#$01,($000e,a1)
	move.b	($0001,a0),d0
	move.b	d0,($0002,a0)
	movea.l	(sp)+,a0
	bra.w	L003216

L0036b2:
	move.b	#$7f,d0
	bsr.w	L003b60
	bra.w	L003216

L0036be:
	bsr.w	L003e5a
	bsr.w	L003c8a
	bmi.w	L0030e2
	bsr.w	L003e66
	tst.b	d0
	beq.w	L0030e2
	cmp.b	#$08,d0
	bhi.w	L0030e2
	move.b	d0,($0007,a1)
	bra.w	L003216

L0036e4:
	bsr.w	L003c8a
	bmi.w	L002ff4
	bsr.w	L003e66
	cmp.b	#$08,d0
	bhi.w	L003002
	move.b	d0,($0004,a1)
	bra.w	L003216

L003700:
	cmpi.b	#$08,($0004,a1)
	bge.w	L003216
	addq.b	#1,($0004,a1)
	bra.w	L003216

L003712:
	tst.b	($0004,a1)
	beq.w	L003216
	subq.b	#1,($0004,a1)
	bra.w	L003216

L003722:
	bsr.w	L003e5a
	bsr.w	L003c8a
	bmi.w	L003072
	bsr.w	L003e66
	tst.l	d0
	beq.w	L003010
	cmp.l	#$00000060,d0
	bhi.w	L003010
	move.l	#$000000c0,d1
	divu.w	d0,d1
	move.b	d1,($0006,a1)
	bra.w	L003216

L003752:
	bsr.w	L003c8a
	bpl.w	L00381e
	move.b	(a0)+,d0
	andi.b	#$df,d0
	cmp.b	#$56,d0			;'V'
	beq.w	L00391e
	cmp.b	#$50,d0			;'P'
	beq.w	L0038ec
	cmp.b	#$55,d0			;'U'
	beq.w	L003988
	cmp.b	#$4e,d0			;'N'
	beq.w	L0039b2
	cmp.b	#$4d,d0			;'M'
	beq.w	L0039e8
	cmp.b	#$44,d0			;'D'
	beq.w	L003a5e
	cmp.b	#$42,d0			;'B'
	beq.w	L003a8c
	cmp.b	#$54,d0			;'T'
	beq.w	L003880
	cmp.b	#$59,d0			;'Y'
	beq.w	L003b04
	cmp.b	#$4c,d0			;'L'
	beq.s	L0037b8
	cmp.b	#$57,d0			;'W'
	beq.s	L0037e0
	bra.w	L002fa0

L0037b8:
	bsr.w	L003e5a
	bsr.w	L003c8a
	bmi.w	L00310c
	bsr.w	L003e66
	tst.l	d0
	beq.w	L00310c
	cmp.l	#$000000c0,d0
	bhi.w	L00310c
	move.b	d0,($0006,a1)
	bra.w	L003216

L0037e0:
	move.b	#$d0,d0
	bsr.w	L00331c
	bsr.w	L003c8a
	bpl.s	L0037f4
	move.b	($0006,a1),d0
	bra.s	L003812

L0037f4:
	bsr.w	L003e66
	tst.l	d0
	beq.w	L00303a
	cmp.l	#$00000060,d0
	bhi.w	L003048
	move.l	#$000000c0,d1
	divu.w	d0,d1
	move.b	d1,d0
L003812:
	bsr.w	L00331c
	bsr.w	L00331c
	bra.w	L003216

L00381e:
	bsr.w	L003e66
	move.w	d0,d1
	move.b	#$a0,d0
	cmpi.w	#$0081,d1
	bcs.s	L003836
	move.b	#$a1,d0
	subi.w	#$0080,d1
L003836:
	bsr.w	L00331c
	move.b	d1,d0
	bsr.w	L00331c
	bsr.w	L003310
	bra.w	L003216

L003848:
	move.b	#$90,d0
	bsr.w	L00331c
	bsr.w	L003c8a
	bmi.w	L003056
	bsr.w	L003e66
	cmp.l	#$00000014,d0
	bcs.w	L003064
	cmp.l	#$0000012c,d0
	bhi.w	L003064
	ror.w	#8,d0
	bsr.w	L00331c
	rol.w	#8,d0
	bsr.w	L00331c
	bra.w	L003216

L003880:
	bsr.w	L003c8a
	bmi.w	L0031a4
	bsr.w	L003e66
	cmp.l	#$0000000c,d0
	bgt.w	L0031a4
	cmp.l	#$00000001,d0
	blt.w	L0031a4
	move.b	d0,d1
	bsr.w	L0032e8
	cmpi.b	#$2c,(a0)		;','
	bne.w	L0031a4
	addq.l	#1,a0
	bsr.w	L003c8a
	bmi.w	L0031a4
	bsr.w	L003e66
	cmp.l	#$00000002,d0
	blt.w	L0031a4
	cmp.l	#$00000010,d0
	bgt.w	L0031a4
	swap.w	d0
	move.b	#$f1,d0
	bsr.w	L00331c
	swap.w	d0
	exg.l	d0,d1
	bsr.w	L00331c
	exg.l	d0,d1
	bsr.w	L00331c
	bra.w	L003216

L0038ec:
	move.b	#$b0,d0
	bsr.w	L00331c
	bsr.w	L003c8a
	bmi.w	L00315c
	bsr.w	L003e66
	cmp.l	#$0000007f,d0
	bhi.w	L00315c
	move.b	d0,d1
	move.b	#$0a,d0
	bsr.w	L00331c
	move.b	d1,d0
	bsr.w	L00331c
	bra.w	L003216

L00391e:
	bsr.w	L003c8a
	bmi.w	L003150
	bsr.w	L003e66
	cmp.l	#$0000007f,d0
	bhi.w	L003150
	move.b	d0,d1
	move.b	#$b0,d0
	bsr.w	L00331c
	move.b	#$07,d0
	bsr.w	L00331c
	move.b	d1,d0
	bsr.w	L00331c
	bra.w	L003216

L003950:
	bsr.w	L003c8a
	bmi.w	L003080
	bsr.w	L003e66
	cmp.l	#$0000000f,d0
	bhi.w	L00308e
	addq.w	#1,d0
	lsl.w	#3,d0
	subq.w	#1,d0
	move.w	d0,d1
	move.b	#$b0,d0
	bsr.w	L00331c
	move.b	#$07,d0
	bsr.w	L00331c
	move.b	d1,d0
	bsr.w	L00331c
	bra.w	L003216

L003988:
	move.b	#$81,d0
	bsr.w	L00331c
	bsr.w	L003c8a
	bmi.w	L003168
	bsr.w	L003e66
	cmp.l	#$0000007f,d0
	bhi.w	L003168
	bsr.w	L00331c
	bsr.w	L003310
	bra.w	L003216

L0039b2:
	bsr.w	L003c8a
	bmi.w	L003174
	bsr.w	L003e66
	cmp.l	#$00000019,d0
	bhi.w	L003174
	subq.w	#1,d0
	bsr.w	L0015c8
	addq.w	#1,d0
	move.w	d0,d1
	move.b	#$82,d0
	bsr.w	L00331c
	move.b	d1,d0
	bsr.w	L00331c
	bsr.w	L003310
	bra.w	L003216

L0039e8:
	moveq.l	#$32,d1			;'2'
	bsr.w	L003c8a
	bmi.s	L0039fe
	bsr.w	L003e66
	cmp.l	#$0000007f,d0
	bhi.s	L0039fe
	move.b	d0,d1
L0039fe:
	move.b	#$b0,d0
	bsr.w	L00331c
	move.b	#$01,d0
	bsr.w	L00331c
	move.b	d1,d0
	bsr.w	L00331c
	tst.b	d1
	bne.s	L003a1c
	bra.w	L003216

L003a1c:
	bsr.w	L0032e8
	cmpi.b	#$2c,(a0)		;','
	bne.w	L003216
	move.b	(L007a36),d1
	addq.l	#1,a0
	bsr.w	L003c8a
	bmi.s	L003a44
	bsr.w	L003e66
	cmp.l	#$000000ff,d0
	bgt.s	L003a44
	move.b	d0,d1
L003a44:
	move.b	#$b1,d0
	bsr.w	L00331c
	move.b	#$18,d0
	bsr.w	L00331c
	move.b	d1,d0
	bsr.w	L00331c
	bra.w	L003216

L003a5e:
	bsr.w	L003c8a
	bmi.w	L00318c
	moveq.l	#$7f,d1
	bsr.w	L003e66
	tst.l	d0
	bne.s	L003a72
	moveq.l	#$00,d1
L003a72:
	move.b	#$b0,d0
	bsr.w	L00331c
	move.b	#$40,d0			;'@'
	bsr.w	L00331c
	move.b	d1,d0
	bsr.w	L00331c
	bra.w	L003216

L003a8c:
	move.b	#$e0,d0
	bsr.w	L00331c
	bsr.w	L003c8a
	bmi.w	L003198
	bsr.w	L003e66
	cmp.l	#$0000007f,d0
	bhi.w	L003ad8
	bsr.w	L0032e8
	cmpi.b	#$2c,(a0)		;','
	bne.s	L003ae4
	bsr.w	L00331c
	addq.l	#1,a0
	bsr.w	L003c8a
	bmi.w	L003198
	bsr.w	L003e66
	cmp.l	#$0000007f,d0
	bhi.w	L003198
	bsr.w	L00331c
	bra.w	L003216

L003ad8:
	bsr.w	L0032e8
	cmpi.b	#$2c,(a0)		;','
	beq.w	L003198
L003ae4:
	andi.l	#$00003fff,d0
	move.w	d0,d1
	andi.w	#$007f,d0
	lsr.w	#7,d1
	andi.w	#$007f,d1
	bsr.w	L00331c
	move.w	d1,d0
	bsr.w	L00331c
	bra.w	L003216

L003b04:
	bsr.w	L003c8a
	bmi.w	L0031b0
	bsr.w	L003e66
	move.l	d0,d1
	bsr.w	L0032e8
	cmpi.b	#$2c,(a0)		;','
	bne.w	L0031b0
	addq.l	#1,a0
	bsr.w	L0032e8
	bsr.w	L003e66
	move.l	d0,d2
	move.b	#$b1,d0
	bsr.w	L00331c
	move.b	d1,d0
	bsr.w	L00331c
	move.b	d2,d0
	bsr.w	L00331c
	bra.w	L003216

L003b42:
	bsr.w	L003c62
	add.b	d1,d0
	move.b	($0004,a1),d1
	and.l	#$000000ff,d1
	mulu.w	#$000c,d1
	add.b	d1,d0
	cmp.b	#$7e,d0			;'~'
	bcc.w	L0030aa
L003b60:
	bsr.w	L00331c
	bsr.w	L003c8a
	bmi.s	L003b98
	bsr.w	L003e5a
	bsr.w	L003e66
	tst.l	d0
	beq.w	L003010
	cmp.l	#$00000060,d0
	bhi.w	L003010
	and.l	#$000000ff,d0
	move.l	#$000000c0,d1
	divu.w	d0,d1
	and.l	#$000000ff,d1
	bra.s	L003b9c

L003b98:
	move.b	($0006,a1),d1
L003b9c:
	tst.l	(L0078b6)
	beq.s	L003baa
	addq.l	#1,(L0078ba)
L003baa:
	move.b	d1,d0
	move.b	#$03,d2
L003bb0:
	bsr.w	L0032e8
	cmpi.b	#$2e,(a0)		;'.'
	bne.s	L003bc8
	bsr.w	L003e5a
	lsr.b	#1,d1
	add.b	d1,d0
	addq.l	#1,a0
	subq.b	#1,d2
	bne.s	L003bb0
L003bc8:
	move.b	d0,d1
	bsr.w	L00331c
	bsr.s	L003c3c
	bsr.w	L00331c
	move.b	d1,d0
	bsr.s	L003bda
	rts

L003bda:
	tst.l	(L0078b6)
	beq.s	L003be4
	rts

L003be4:
	movem.l	d0-d2/a2,-(sp)
	lea.l	(L0078c6),a2
	move.l	(L0078c2),d1
	lsl.l	#2,d1
	adda.l	d1,a2
	andi.w	#$00ff,d0
	move.w	(L007838),d1
	move.w	($0002,a2),d2
	add.w	d0,d2
	move.w	d2,d0
	sub.w	d1,d2
	bmi.s	L003c32
	move.w	d2,($0002,a2)
	addq.w	#1,(a2)
	move.b	#$f0,d0
	bsr.w	L00331c
	move.b	($0002,a2),d0
	bsr.w	L00331c
	move.b	($0003,a2),d0
	bsr.w	L00331c
	movem.l	(sp)+,d0-d2/a2
	rts

L003c32:
	move.w	d0,($0002,a2)
	movem.l	(sp)+,d0-d2/a2
	rts

L003c3c:
	move.l	d1,-(sp)
	and.l	#$000000ff,d0
	move.b	($0007,a1),d1
	and.l	#$000000ff,d1
	mulu.w	d1,d0
	lsr.w	#3,d0
	cmpi.b	#$01,d0
	beq.s	L003c5e
	subq.b	#1,d0
	bcc.s	L003c5e
	moveq.l	#$00,d0
L003c5e:
	move.l	(sp)+,d1
	rts

L003c62:
	bsr.w	L0032e8
	cmpi.b	#$23,(a0)		;'#'
	beq.s	L003c7c
	cmpi.b	#$2b,(a0)		;'+'
	beq.s	L003c7c
	cmpi.b	#$2d,(a0)		;'-'
	beq.s	L003c82
	clr.b	d1
	rts

L003c7c:
	move.b	#$01,d1
	bra.s	L003c86

L003c82:
	move.b	#$ff,d1
L003c86:
	addq.l	#1,a0
	rts

L003c8a:
	bsr.w	L0032e8
	move.b	(a0),d0
	cmpi.b	#$30,d0			;'0'
	bcs.s	L003ca0
	cmpi.b	#$39,d0			;'9'
	bhi.s	L003ca0
	clr.b	d0
	rts

L003ca0:
	move.b	#-$01,d0
	rts

L003ca6:
	movem.l	d1/a0,-(sp)
	bsr.s	L003cb2
	movem.l	(sp)+,d1/a0
	rts

L003cb2:
	cmpi.b	#$41,d0			;'A'
	bcs.s	L003cd6
	cmpi.b	#$47,d0			;'G'
	bhi.s	L003cd6
	subi.b	#$41,d0			;'A'
	andi.w	#$00ff,d0
	lea.l	(L003cdc),a0
	move.b	(a0,d0.w),d1
	clr.w	d0
	move.b	d1,d0
	rts

L003cd6:
	move.w	#$ffff,d0
	rts

L003cdc:
	.dc.b	$15,$17,$0c,$0e,$10,$11,$13,$00
L003ce4:
	bsr.w	L0032e8
	move.b	(a0)+,d0
	bsr.w	L003ea4
	bsr.w	L003e30
	tst.w	d0
	beq.s	L003ce4
	bsr.s	L003ca6
	tst.w	d0
	bmi.w	L003136
	bsr.w	L003c62
	add.b	d1,d0
	move.b	($0004,a1),d1
	and.l	#$000000ff,d1
	mulu.w	#$000c,d1
	add.b	d1,d0
	cmp.b	#$7e,d0			;'~'
	bcc.w	L003136
	clr.b	($000e,a1)
	clr.b	($000f,a1)
	bsr.w	L00331c
	move.b	#$00,d0
	bsr.w	L00331c
	bsr.w	L003c8a
	bmi.s	L003d64
	bsr.w	L003e5a
	bsr.w	L003e66
	tst.l	d0
	beq.w	L003010
	cmp.l	#$00000060,d0
	bhi.w	L003010
	and.l	#$000000ff,d0
	move.l	#$000000c0,d1
	divu.w	d0,d1
	and.l	#$000000ff,d1
	bra.s	L003d68

L003d64:
	move.b	($0006,a1),d1
L003d68:
	move.b	d1,d0
	move.b	#$03,d2
L003d6e:
	bsr.w	L0032e8
	cmpi.b	#$2e,(a0)		;'.'
	bne.s	L003d86
	bsr.w	L003e5a
	lsr.b	#1,d1
	add.b	d1,d0
	addq.l	#1,a0
	subq.b	#1,d2
	bne.s	L003d6e
L003d86:
	move.w	d0,d3
	swap.w	d3
	bsr.w	L003c3c
	move.w	d0,d3
	swap.w	d3
	movea.l	(a1),a2
	clr.w	d0
	bsr.w	L00331c
	moveq.l	#$01,d2
L003d9c:
	bsr.w	L0032e8
	move.b	(a0)+,d0
	cmp.b	#$27,d0			;'''
	beq.s	L003dea
	bsr.w	L003ea4
	bsr.w	L003e30
	tst.w	d0
	beq.s	L003d9c
	bsr.w	L003ca6
	tst.w	d0
	bmi.w	L003136
	bsr.w	L003c62
	add.b	d1,d0
	move.b	($0004,a1),d1
	and.l	#$000000ff,d1
	mulu.w	#$000c,d1
	add.b	d1,d0
	cmp.b	#$7e,d0			;'~'
	bcc.w	L003136
	bsr.w	L00331c
	addq.w	#1,d2
	cmp.w	#$0008,d2
	bhi.s	L003e1e
	bra.s	L003d9c

L003dea:
	cmp.w	#$0002,d2
	bcs.s	L003e0c
	move.b	d2,(a2)
	move.w	d3,d0
	bsr.w	L00331c
	swap.w	d3
	move.w	d3,d0
	bsr.w	L00331c
	swap.w	d3
	move.b	d3,d0
	bsr.w	L003bda
	bra.w	L003216

L003e0c:
	addq.l	#2,d2
	sub.l	d2,($000a,a1)
	subq.l	#2,a2
	move.l	a2,(a1)
	move.b	#$ff,(a2)
	bra.w	L003136

L003e1e:
	addq.l	#2,d2
	sub.l	d2,($000a,a1)
	subq.l	#2,a2
	move.l	a2,(a1)
	move.b	#$ff,(a2)
	bra.w	L003144

L003e30:
	cmp.b	#$3c,d0			;'<'
	bne.s	L003e46
	cmpi.b	#$08,($0004,a1)
	bcc.w	L003e56
	addq.b	#1,($0004,a1)
	bra.s	L003e56

L003e46:
	cmp.b	#$3e,d0			;'>'
	bne.s	L003e58
	tst.b	($0004,a1)
	beq.s	L003e56
	subq.b	#1,($0004,a1)
L003e56:
	clr.w	d0
L003e58:
	rts

L003e5a:
	tst.l	(L0078b6)
	bne.w	L0030f0
	rts

L003e66:
	movem.l	d1,-(sp)
	moveq.l	#$00,d0
	moveq.l	#$00,d1
L003e6e:
	bsr.w	L0032e8
	cmpi.b	#$30,(a0)+		;'0'
	beq.s	L003e6e
	subq.l	#1,a0
L003e7a:
	bsr.w	L0032e8
	move.b	(a0),d1
	cmp.b	#$30,d1			;'0'
	bcs.s	L003e9e
	cmp.b	#$39,d1			;'9'
	bhi.s	L003e9e
	sub.b	#$30,d1			;'0'
	mulu.w	#$000a,d0
	and.b	#$0f,d1
	add.l	d1,d0
	addq.l	#1,a0
	bra.s	L003e7a

L003e9e:
	movem.l	(sp)+,d1
	rts

L003ea4:
	cmpi.b	#$61,d0			;'a'
	bcs.s	L003eb4
	cmpi.b	#$7a,d0			;'z'
	bhi.s	L003eb4
	sub.b	#$20,d0			;' '
L003eb4:
	rts

L003eb6:
	tst.b	(L007a14)
	bne.s	L003eb6
	rts

L003ec0:
	bsr.s	L003f30
	cmp.l	(L007a20),d0
	bcc.s	L003ed2
	move.l	(L007a1c),d0
	rts

L003ed2:
	moveq.l	#$ff,d0
	rts

L003ed6:
	movem.l	d0-d1/a3-a5,-(sp)
	lea.l	(L00ce4a),a3
	lea.l	(L00c396),a4
	lea.l	(L00c616),a5
	moveq.l	#$00,d0
	moveq.l	#$18,d1
L003ef0:
	move.b	(a3)+,d0
	lsl.w	#2,d0
	move.l	(a4,d0.w),($0002,a5)
	move.l	(a4,d0.w),($0050,a5)
	adda.l	#$00000054,a5
	dbra.w	d1,L003ef0
	movem.l	(sp)+,d0-d1/a3-a5
	rts

L003f10:
	movem.l	d1/a0-a1,-(sp)
	lea.l	(L00c396),a0
	lea.l	(L00c4d6),a1
	moveq.l	#$4f,d1			;'O'
L003f22:
	move.l	d0,(a0)+
	add.l	(a1)+,d0
	dbra.w	d1,L003f22
	movem.l	(sp)+,d1/a0-a1
	rts

L003f30:
	movem.l	d1/a0,-(sp)
	lea.l	(L00c4d6),a0
	moveq.l	#$00,d0
	moveq.l	#$4f,d1			;'O'
L003f3e:
	add.l	(a0)+,d0
	dbra.w	d1,L003f3e
	movem.l	(sp)+,d1/a0
	rts

L003f4a:
	movem.l	d0/a0-a1,-(sp)
	moveq.l	#$00,d0
	lea.l	(L00c396),a0
L003f56:
	bsr.s	L003f8c
	move.l	(a0)+,(a1)
	clr.l	($000a,a1)
	addq.l	#1,d0
	cmp.l	#$00000050,d0
	bne.s	L003f56
	movem.l	(sp)+,d0/a0-a1
	rts

L003f6e:
	movem.l	d0/a0-a1,-(sp)
	lea.l	(L00c396),a0
	move.w	#$004f,d0		;'O'
L003f7c:
	movea.l	(a0)+,a1
	move.b	#$ff,(a1)
	dbra.w	d0,L003f7c
	movem.l	(sp)+,d0/a0-a1
	rts

L003f8c:
	movem.l	d0,-(sp)
	lea.l	(L00be96),a1
	cmpi.w	#$0050,d0		;'P'
	bcc.s	L003fa6
	and.l	#$000000ff,d0
	lsl.w	#4,d0
	adda.w	d0,a1
L003fa6:
	movem.l	(sp)+,d0
	rts

L003fac:
	move.l	d0,-(sp)
	lea.l	(L00ce4a),a1
	andi.l	#$000000ff,d0
	move.b	(a1,d0.w),d0
	lsl.w	#4,d0
	lea.l	(L00be96),a1
	adda.l	d0,a1
	move.l	(sp)+,d0
	rts

L003fcc:
	move.l	d0,-(sp)
	lea.l	(L00c616),a5
	andi.l	#$000000ff,d0
	mulu.w	#$0054,d0
	adda.l	d0,a5
	move.l	(sp)+,d0
	rts

L003fe4:
	movem.l	d1/a1,-(sp)
	lea.l	(L00ce7c),a1
	move.w	#$0018,d1
L003ff2:
	move.l	#$ffffffff,(a1)+
	dbra.w	d1,L003ff2
	movem.l	(sp)+,d1/a1
	rts

L004002:
	movem.l	d1/a5,-(sp)
	lea.l	(L00c616),a5
	moveq.l	#$18,d1
L00400e:
	clr.b	($0014,a5)
	clr.b	($0000.w,a5)
	clr.b	($0001,a5)
	clr.w	($0006,a5)
	clr.b	($0016,a5)
	clr.b	($0020,a5)
	clr.b	($0026,a5)
	clr.b	($001e,a5)
	clr.b	($0018,a5)
	clr.w	($002e,a5)
	clr.l	($0032,a5)
	clr.l	($0036,a5)
	clr.b	($003c,a5)
	clr.b	($0040,a5)
	clr.b	($0042,a5)
	clr.b	($0044,a5)
	lea.l	($0054,a5),a5
	dbra.w	d1,L00400e
	move.b	#-$01,(L006bc2)
	clr.b	(L006bc3)
	movem.l	(sp)+,d1/a5
	rts

L00406a:
	movem.l	d0/a4,-(sp)
	lea.l	(L00ce7c),a4
	moveq.l	#$00,d0
	move.b	($0028,a5),d0
	adda.l	d0,a4
	addq.b	#1,d0
	move.w	d0,-(sp)
	tst.b	($004b,a4)
	ble.s	L00408e
	bsr.w	L004f1e
	clr.b	($004b,a4)
L00408e:
	addq.l	#2,sp
	movem.l	(sp)+,d0/a4
	rts

L004096:
	.dc.b	'<< play int >>'
L0040a4:
	movem.l	d0-d5/d7/a0-a5,-(sp)
	tst.b	(L002862)
	beq.s	L0040b4
	bsr.w	L002832
L0040b4:
	tst.b	(L007a14)
	ble.s	L0040cc
	cmpi.b	#$01,(L007a14)
	beq.s	L004124
	bsr.w	L004002
	bra.s	L00411e

L0040cc:
	moveq.l	#$00,d7
	moveq.l	#$00,d5
	lea.l	(L00c616),a5
L0040d6:
	tst.b	($004c,a5)
	beq.s	L0040e6
	tst.b	($0014,a5)
	beq.s	L0040e6
	addq.b	#1,d7
	bsr.s	L00412a
L0040e6:
	lea.l	($0054,a5),a5
	addq.w	#1,d5
	cmpi.w	#$0019,d5
	bne.s	L0040d6
	tst.b	(L007a1a)
	beq.s	L00410a
	move.w	(L007550),d0
	bsr.w	L004d84
	clr.b	(L007a1a)
L00410a:
	tst.b	d7
	bne.s	L00411e
	tst.w	(L007850)
	bne.s	L00411e
	move.w	#$0001,(L007a0c)
L00411e:
	clr.b	(L007a14)
L004124:
	movem.l	(sp)+,d0-d5/d7/a0-a5
	rts

L00412a:
	tst.b	($0001,a5)
	beq.s	L004136
	subq.b	#1,($0001,a5)
	bne.s	L004144
L004136:
	tst.b	($0006,a5)
	bne.s	L004144
	clr.b	($0007,a5)
	bsr.w	L00431a
L004144:
	tst.b	(a5)
	beq.s	L00414e
	subq.b	#1,(a5)
	beq.s	L00414e
	rts

L00414e:
	tst.b	($003e,a5)
	beq.s	L00415e
	move.b	#$ff,(a5)
	clr.b	($003e,a5)
	rts

L00415e:
	lea.l	(L00ce7c),a4
	moveq.l	#$00,d0
	move.b	($0028,a5),d0
	adda.l	d0,a4
L00416c:
	movea.l	($0002,a5),a0
	move.b	(a0),d0
	bpl.w	L0041e8
	andi.b	#$f0,d0
	cmp.b	#$b0,d0
	beq.w	L004452
	cmp.b	#$a0,d0
	beq.w	L0043ca
	cmp.b	#$80,d0
	beq.w	L00436e
	cmp.b	#$90,d0
	beq.w	L0046f6
	cmp.b	#$c0,d0
	beq.w	L004718
	cmp.b	#$d0,d0
	beq.w	L0046a4
	cmp.b	#$e0,d0
	beq.w	L0046b6
	cmpi.b	#$ff,(a0)
	beq.s	L0041c6
	cmpi.b	#$f1,(a0)
	beq.w	L004930
L0041c0:
	addq.l	#3,($0002,a5)
	bra.s	L00416c

L0041c6:
	clr.b	($0014,a5)
	moveq.l	#$00,d0
	move.b	($0028,a5),d0
	addq.b	#1,d0
	move.w	d0,-(sp)
	jsr	(L004efa)
	lea.l	($0002,sp),sp
	clr.b	($0032,a5)
	bsr.w	L00406a
	rts

L0041e8:
	moveq.l	#$00,d3
	move.b	($0001,a0),d3
	bne.w	L00428e
	addq.l	#2,a0
	move.b	(a0)+,d3
	move.b	d3,($0032,a5)
	add.l	d3,($0002,a5)
	addq.l	#4,($0002,a5)
	tst.b	($003f,a5)
	bne.s	L004212
	subq.l	#1,d3
	adda.l	d3,a0
	clr.b	($0032,a5)
	bra.s	L004286

L004212:
	lea.l	($0033,a5),a2
	move.b	d0,d2
	moveq.l	#$00,d0
	move.b	($0028,a5),d0
	cmpi.b	#$10,d0
	bcc.s	L00425c
	add.b	#$90,d0
	bsr.w	L00519e
	move.b	d2,d0
	add.b	($002d,a5),d0
	move.b	d0,(a2)+
	bsr.w	L00519e
	move.b	($0029,a5),d0
	bsr.w	L00519e
	subq.b	#1,d3
L004242:
	move.b	(a0)+,d0
	add.b	($002d,a5),d0
	move.b	d0,(a2)+
	bsr.w	L00519e
	move.b	($0029,a5),d0
	bsr.w	L00519e
	subq.b	#1,d3
	bne.s	L004242
	bra.s	L004286

L00425c:
	subi.b	#$10,d0
	move.b	d0,d1
	move.b	($0029,a5),d0
	swap.w	d0
	move.b	d2,d0
	add.b	($002d,a5),d0
	move.b	d0,(a2)+
	bsr.w	L005e04
	subq.b	#1,d3
L004276:
	move.b	(a0)+,d0
	add.b	($002d,a5),d0
	move.b	d0,(a2)+
	bsr.w	L005e04
	subq.b	#1,d3
	bne.s	L004276
L004286:
	move.b	(a0)+,(a5)
	move.b	(a0)+,($0001,a5)
	rts

L00428e:
	move.b	($0006,a5),d4
	clr.w	($0006,a5)
	move.b	d3,(a5)
	move.b	($0002,a0),($0001,a5)
	cmp.b	($0002,a0),d3
	bne.s	L0042aa
	move.b	#$01,($0006,a5)
L0042aa:
	move.b	d0,d1
	cmp.b	#$7f,d1
	beq.s	L004314
	add.b	($002d,a5),d1
	tst.b	d4
	beq.s	L0042d0
	cmp.b	($0033,a5),d1
	beq.s	L004314
	cmpi.b	#$10,($0028,a5)
	bcs.s	L0042ce
	move.b	#$01,($0007,a5)
L0042ce:
	bsr.s	L00431a
L0042d0:
	move.b	d1,($0033,a5)
	tst.b	($003f,a5)
	beq.s	L004314
	move.b	($0028,a5),d0
	cmpi.b	#$10,d0
	bcs.s	L0042f8
	subi.b	#$10,d0
	exg.l	d0,d1
	swap.w	d0
	move.b	($0029,a5),d0
	swap.w	d0
	bsr.w	L005e04
	bra.s	L00430e

L0042f8:
	add.b	#$90,d0
	bsr.w	L00519e
	move.b	d1,d0
	bsr.w	L00519e
	move.b	($0029,a5),d0
	bsr.w	L00519e
L00430e:
	move.b	#$01,($0032,a5)
L004314:
	addq.l	#3,($0002,a5)
	rts

L00431a:
	movem.l	d0-d2,-(sp)
	tst.b	($003f,a5)
	beq.s	L004368
	clr.w	d2
	move.b	($0032,a5),d2
	beq.s	L004368
	move.b	($0028,a5),d0
	cmpi.b	#$10,d0
	bcs.s	L004342
	subi.b	#$10,d0
	move.b	d0,d1
	bsr.w	L005eb2
	bra.s	L004364

L004342:
	and.b	#$0f,d0
	add.b	#$80,d0
	bsr.w	L00519e
L00434e:
	subq.b	#1,d2
	bmi.s	L004364
	move.b	($33,a5,d2.w),d0
	bsr.w	L00519e
	move.b	#$40,d0			;'@'
	bsr.w	L00519e
	bra.s	L00434e

L004364:
	clr.b	($0032,a5)
L004368:
	movem.l	(sp)+,d0-d2
	rts

L00436e:
	clr.w	d1
	move.b	($0001,a0),d1
	cmpi.b	#$82,(a0)
	beq.s	L00438a
	cmpi.b	#$81,(a0)
	bne.w	L0041c0
	move.b	d1,($0029,a5)
	bra.w	L0041c0

L00438a:
	subq.b	#1,d1
	bmi.w	L0041c0
	andi.b	#$1f,d1
	cmp.b	($0028,a5),d1
	beq.w	L0041c0
	tst.b	($0032,a5)
	beq.s	L0043a6
	bsr.w	L00431a
L0043a6:
	move.b	d1,($0028,a5)
	lea.l	(L00ce7c),a4
	andi.w	#$001f,d1
	adda.w	d1,a4
	cmpi.w	#$0001,(L007a06)
	bgt.w	L0041c0
	move.b	d1,($0009,a5)
	bra.w	L0041c0

L0043ca:
	move.b	($0001,a0),d1
	subq.b	#1,d1
	bmi.w	L0041c0
	tst.b	($004d,a5)
	bne.w	L0041c0
	cmpi.b	#$a1,(a0)
	bne.s	L0043e6
	add.b	#$80,d1
L0043e6:
	move.b	d1,($002c,a5)
	cmp.b	($0032,a4),d1
	beq.w	L0041c0
	move.b	d1,($0032,a4)
	move.b	($0028,a5),d0
	cmpi.b	#$10,d0
	bcs.s	L00440e
	subi.b	#$10,d0
	exg.l	d0,d1
	bsr.w	L0061b4
	bra.w	L0041c0

L00440e:
	tst.b	d1
	bmi.s	L004424
	addi.b	#$c0,d0
	bsr.w	L00519e
	move.b	d1,d0
	bsr.w	L00519e
	bra.w	L0041c0

L004424:
	addi.b	#$b0,d0
	bsr.w	L00519e
	clr.b	d0
	bsr.w	L00519e
	moveq.l	#$01,d0
	bsr.w	L00519e
	move.b	($0028,a5),d0
	andi.b	#$7f,d1
	addi.b	#$c0,d0
	bsr.w	L00519e
	move.b	d1,d0
	bsr.w	L00519e
	bra.w	L0041c0

L004452:
	move.b	($0001,a0),d1
	move.b	($0002,a0),d2
	cmpi.b	#$b1,(a0)
	beq.w	L0044ec
L004462:
	cmp.b	#$07,d1
	bne.s	L004488
	tst.b	($004e,a5)
	bne.w	L0041c0
	move.b	d2,($002a,a5)
	cmp.b	(a4),d2
	beq.w	L0041c0
	move.b	d2,(a4)
	sub.b	(L007a3a),d2
	bpl.s	L0044be
	clr.b	d2
	bra.s	L0044be

L004488:
	cmp.b	#$0a,d1
	bne.s	L0044a8
	tst.b	($004f,a5)
	bne.w	L0041c0
	move.b	d2,($002b,a5)
	cmp.b	($0019,a4),d2
	beq.w	L0041c0
	move.b	d2,($0019,a4)
	bra.s	L0044be

L0044a8:
	cmp.b	#$40,d1			;'@'
	bne.s	L0044be
	move.b	d2,($002e,a5)
	cmp.b	($004b,a4),d2
	beq.w	L0041c0
	move.b	d2,($004b,a4)
L0044be:
	move.b	($0028,a5),d0
	cmpi.b	#$10,d0
	bcs.s	L0044d4
	subi.b	#$10,d0
	bsr.w	L005f36
	bra.w	L0041c0

L0044d4:
	addi.b	#$b0,d0
	bsr.w	L00519e
	move.b	d1,d0
	bsr.w	L00519e
	move.b	d2,d0
	bsr.w	L00519e
	bra.w	L0041c0

L0044ec:
	cmpi.b	#$0f,d1
	bcc.s	L004544
	move.b	d1,d0
	andi.l	#$0000000f,d0
	add.w	d0,d0
	add.w	d0,d0
	movea.l	(Table3,pc,d0.w),a1
	jmp	(a1)

Table3:
	.dc.l	L00459c
	.dc.l	L004544
	.dc.l	L0045a6
	.dc.l	L0045c0
	.dc.l	L0045e0
	.dc.l	L0041c0
	.dc.l	L0045f2
	.dc.l	L0041c0
	.dc.l	L004544
	.dc.l	L00460a
	.dc.l	L004656
	.dc.l	L004544
	.dc.l	L004544
	.dc.l	L004688
	.dc.l	L00469a
	.dc.l	L004544
L004544:
	move.b	($0028,a5),d0
	subi.b	#$10,d0
	bmi.w	L0041c0
	cmpi.b	#$08,d0
	bcc.w	L0041c0
	cmpi.b	#$20,d1			;' '
	blt.s	L00456a
	cmpi.b	#$40,d1			;'@'
	bcc.s	L00456a
	andi.b	#$f8,d1
	or.b	d0,d1
L00456a:
	bsr.w	L0064ae
	cmpi.b	#$30,d1			;'0'
	bcs.w	L0041c0
	cmpi.b	#$38,d1			;'8'
	bcc.w	L0041c0
	lea.l	(L0075b6),a1
	and.w	#$00ff,d0
	lsl.w	#3,d0
	move.w	d0,d3
	add.w	d0,d0
	add.w	d3,d0
	adda.w	d0,a1
	lsr.b	#2,d2
	move.b	d2,($0011,a1)
	bra.w	L0041c0

L00459c:
	move.b	d2,d0
	bsr.w	L00519e
	bra.w	L0041c0

L0045a6:
	tst.b	($003f,a5)
	beq.w	L0041c0
	tst.b	d2
	bmi.w	L0041c0
	move.b	d2,d0
	jsr	(L0066e8)
	bra.w	L0041c0

L0045c0:
	move.b	d2,d0
	subq.b	#1,d0
	bmi.s	L0045d6
	beq.s	L0045d2
	subq.b	#1,d0
	beq.s	L0045d6
	move.b	#$40,d0			;'@'
	bra.s	L0045d6

L0045d2:
	move.b	#$7f,d0
L0045d6:
	jsr	(L0066c4)
	bra.w	L0041c0

L0045e0:
	cmpi.b	#$05,($0004,a0)
	bne.w	L0041c0
	addq.l	#3,($0002,a5)
	bra.w	L0041c0

L0045f2:
	cmpi.b	#$07,($0004,a0)
	bne.w	L0041c0
	move.b	d2,d1
	move.b	($0005,a0),d2
	addq.l	#3,($0002,a5)
	bra.w	L004462

L00460a:
	andi.w	#$00ff,d2
	addq.w	#1,d2
	lsl.w	#6,d2
	subq.w	#1,d2
	move.w	d2,d1
	andi.w	#$007f,d1
	lsl.w	#8,d1
	lsr.w	#7,d2
	andi.w	#$007f,d2
	add.w	d2,d1
	move.b	($0028,a5),d0
	cmpi.b	#$10,d0
	bcs.s	L00463c
	subi.b	#$10,d0
	exg.l	d0,d1
	bsr.w	L006032
	bra.w	L0041c0

L00463c:
	addi.b	#$e0,d0
	bsr.w	L00519e
	move.w	d1,d0
	lsr.w	#8,d0
	bsr.w	L00519e
	move.b	d1,d0
	bsr.w	L00519e
	bra.w	L0041c0

L004656:
	move.b	d2,d1
	move.b	($0028,a5),d0
	cmpi.b	#$10,d0
	bcs.s	L004670
	subi.b	#$10,d0
	exg.l	d0,d1
	bsr.w	L0060ca
	bra.w	L0041c0

L004670:
	addi.b	#$b0,d0
	bsr.w	L00519e
	moveq.l	#$01,d0
	bsr.w	L00519e
	move.b	d1,d0
	bsr.w	L00519e
	bra.w	L0041c0

L004688:
	cmpi.b	#$05,d2
	bcc.w	L0041c0
	move.b	d2,(L006bc2)
	bra.w	L0041c0

L00469a:
	move.b	d2,(L006bc3)
	bra.w	L0041c0

L0046a4:
	move.b	($0001,a0),d1
	move.b	d1,($0000.w,a5)
	move.b	d1,($0001,a5)
	addq.l	#3,($0002,a5)
	rts

L0046b6:
	move.b	($0001,a0),d1
	bmi.w	L0041c6
	lsl.w	#8,d1
	move.b	($0002,a0),d1
	move.b	($0028,a5),d0
	cmpi.b	#$10,d0
	bcs.s	L0046dc
	subi.b	#$10,d0
	exg.l	d0,d1
	bsr.w	L006032
	bra.w	L0041c0

L0046dc:
	addi.b	#$e0,d0
	bsr.w	L00519e
	move.b	($0001,a0),d0
	bsr.w	L00519e
	move.b	d1,d0
	bsr.w	L00519e
	bra.w	L0041c0

L0046f6:
	clr.w	d0
	move.b	($0001,a0),d0
	bmi.w	L0041c6
	lsl.w	#8,d0
	move.b	($0002,a0),d0
	move.w	d0,(L007550)
	move.b	#$01,(L007a1a)
	bra.w	L0041c0

L004718:
	move.b	($0001,a0),d0
	bmi.w	L0041c6
	beq.w	L00486c
	cmp.b	#$01,d0
	beq.w	L0048bc
	cmp.b	#$02,d0
	beq.w	L0048f4
	cmp.b	#$03,d0
	beq.s	L004772
	cmp.b	#$04,d0
	beq.s	L0047a8
	cmp.b	#$05,d0
	beq.s	L0047c2
	cmp.b	#$06,d0
	beq.w	L0047fa
	cmp.b	#$07,d0
	beq.w	L0047fe
	cmp.b	#$08,d0
	beq.w	L00482e
	cmp.b	#$09,d0
	beq.w	L00483a
	cmp.b	#$0a,d0
	beq.w	L00484e
	bra.w	L0041c0

L004772:
	tst.b	($0016,a5)
	beq.s	L00477c
	bra.w	L0041c0

L00477c:
	movea.l	($0002,a5),a0
	addq.l	#3,a0
	move.l	a0,($001a,a5)
	move.b	d5,d0
	move.l	($0050,a5),($0002,a5)
	move.b	#$01,($0016,a5)
	move.b	#$01,($0018,a5)
	move.b	#$01,($001e,a5)
	clr.w	($0006,a5)
	bra.w	L00414e

L0047a8:
	move.b	#$01,($0020,a5)
	movea.l	($0002,a5),a0
	addq.l	#3,a0
	move.l	a0,($0022,a5)
	move.b	($0033,a5),($003b,a5)
	bra.w	L0041c0

L0047c2:
	tst.b	($0020,a5)
	beq.w	L0041c0
	tst.b	($0026,a5)
	bne.w	L0041c0
	move.b	#$01,($0026,a5)
	move.b	#$01,($0018,a5)
	move.b	#$01,($001e,a5)
	movea.l	($0002,a5),a0
	addq.l	#3,a0
	move.l	a0,($001a,a5)
	movea.l	($0022,a5),a0
	move.l	a0,($0002,a5)
	bra.w	L00414e

L0047fa:
	bra.w	L0041c0

L0047fe:
	tst.b	($001e,a5)
	beq.w	L0041c0
	movea.l	($001a,a5),a0
L00480a:
	cmpi.b	#$c0,(a0)
	bne.s	L004818
	cmpi.b	#$06,($0001,a0)
	beq.s	L004824
L004818:
	cmpi.b	#$ff,(a0)
	beq.w	L0041c6
	addq.l	#3,a0
	bra.s	L00480a

L004824:
	addq.l	#3,a0
	move.l	a0,($0002,a5)
	bra.w	L00414e

L00482e:
	tst.b	($0018,a5)
	beq.w	L0041c0
	bra.w	L0041c6

L00483a:
	move.b	#$01,($0046,a5)
	movea.l	($0002,a5),a0
	addq.l	#3,a0
	move.l	a0,($0048,a5)
	bra.w	L0041c0

L00484e:
	tst.b	($0046,a5)
	beq.s	L004860
	movea.l	($0048,a5),a0
	move.l	a0,($0002,a5)
	bra.w	L00414e

L004860:
	move.b	d5,d0
	move.l	($0050,a5),($0002,a5)
	bra.w	L00414e

L00486c:
	move.b	($0002,a0),d0
	bmi.w	L0041c6
	move.l	a0,($000a,a5)
	addq.l	#3,($000a,a5)
	move.b	d0,($0012,a5)
	clr.b	($0042,a5)
	clr.b	($0040,a5)
	move.b	#$01,($0044,a5)
	move.b	($0033,a5),($003b,a5)
L004894:
	move.b	(a0),d0
	beq.s	L0048a6
	bpl.s	L0048b0
	cmpi.b	#$ff,d0
	beq.w	L0041c6
	addq.l	#3,a0
	bra.s	L004894

L0048a6:
	move.b	($0033,a5),($003d,a5)
	bra.w	L0041c0

L0048b0:
	add.b	($002d,a5),d0
	move.b	d0,($003d,a5)
	bra.w	L0041c0

L0048bc:
	tst.b	($0044,a5)
	beq.w	L0041c0
	tst.b	($0040,a5)
	beq.s	L0048da
	move.b	#$01,($0042,a5)
	move.l	a0,($000e,a5)
	addq.l	#3,($000e,a5)
	bra.s	L0048e0

L0048da:
	subq.b	#1,($0012,a5)
	beq.s	L0048ec
L0048e0:
	movea.l	($000a,a5),a0
	move.l	a0,($0002,a5)
	bra.w	L00414e

L0048ec:
	clr.b	($0044,a5)
	bra.w	L0041c0

L0048f4:
	tst.b	($0040,a5)
	beq.s	L00491e
	tst.b	($0042,a5)
	beq.s	L004914
	clr.b	($0040,a5)
	clr.b	($0042,a5)
	movea.l	($000e,a5),a0
	move.l	a0,($0002,a5)
	bra.w	L00414e

L004914:
	move.b	#$ff,($0003,a0)
	bra.w	L0041c0

L00491e:
	move.b	#$01,($0040,a5)
	bra.w	L0041c0

L004928:
	cmpi.b	#$f1,(a0)
	bne.w	L0041c0
L004930:
	move.w	#$0001,(L0028e8)
	move.b	($0001,a0),(L0028eb)
	move.b	($0002,a0),(L0028ed)
	bra.w	L0041c0

L00494c:
	movem.l	d0-d2/a0-a1,-(sp)
	lea.l	(L007828),a0
	lea.l	(L007728),a1
	move.w	(a0),d1
	cmp.w	($0002,a0),d1
	bne.s	L0049ac
	tst.w	($0004,a0)
	beq.s	L004974
	move.w	(L0049ca),d0
	bsr.w	L0066e8
L004974:
	addq.w	#1,(L007a06)
	move.w	(L007a06),d0
	cmp.w	(L007a0a),d0
	bne.s	L004990
	move.w	#$0001,(L007a0c)
L004990:
	tst.w	(L0028e8)
	beq.s	L0049bc
	move.l	(L0028ea),d0
	jsr	(L004a4e)
	clr.w	(L0028e8)
	bra.s	L0049bc

L0049ac:
	tst.w	($0004,a0)
	beq.s	L0049bc
	move.w	(L0049cc),d0
	bsr.w	L0066e8
L0049bc:
	subq.w	#1,(a0)
	bne.s	L0049c4
	move.w	($0002,a0),(a0)
L0049c4:
	movem.l	(sp)+,d0-d2/a0-a1
	rts

L0049ca:
	.dc.w	$0080
L0049cc:
	.dc.w	$0081
L0049ce:
	move.w	#$0014,-(sp)
	bsr.s	L0049da
	lea.l	($0002,sp),sp
	rts

L0049da:
	move.l	d0,-(sp)
	move.w	($0008,sp),d0
	mulu.w	#$01ed,d0
L0049e4:
	nop
	subq.l	#1,d0
	bne.s	L0049e4
	move.l	(sp)+,d0
	rts

L0049ee:
	.dc.l	$00eafa00
L0049f2:
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
L004a02:
	movem.l	d0/a0,-(sp)
	andi.l	#$000000ff,d0
	cmpi.b	#$30,d0			;'0'
	bcc.s	L004a18
	move.b	#$30,d0			;'0'
	bra.s	L004a22

L004a18:
	cmpi.b	#$f1,d0
	bcs.s	L004a22
	move.b	#$f0,d0
L004a22:
	move.w	d0,(L007834)
	move.b	d0,(L007563)
	divu.w	#$0018,d0
	move.b	d0,(L00755d)
	movea.l	(L0049ee),a0
	move.b	#$07,($0003,a0)
	move.b	d0,($000b,a0)
	movem.l	(sp)+,d0/a0
	rts

L004a4e:
	movem.l	d0-d1/a0,-(sp)
	lea.l	(L007828),a0
	move.l	d0,(L007830)
	move.l	d0,d1
	move.w	(L007834),d0
	ext.l	d0
	andi.w	#$001f,d1
	divu.w	d1,d0
	move.w	d0,(L007836)
	swap.w	d1
	mulu.w	d1,d0
	move.w	d0,(L007838)
	move.w	d1,(a0)
	move.w	d1,($0002,a0)
	swap.w	d1
	moveq.l	#$60,d0			;'`'
	divu.w	d1,d0
	move.b	d0,(L00755c)
	ori.b	#$80,d0
	movea.l	(L0049ee),a0
	move.b	#$06,($0003,a0)
	move.b	d0,($000f,a0)
	bsr.w	L005ae8
	movem.l	(sp)+,d0-d1/a0
	rts

L004aae:
	move.w	#$0001,(L00782c)
	move.w	#$0001,(L00782e)
	rts

L004ac0:
	clr.w	(L00782c)
	clr.w	(L00782e)
	rts

L004ace:
	movem.l	d0/a0,-(sp)
	move.b	(L007554),d0
	bclr.l	#$02,d0
	movea.l	(L0049ee),a0
	move.b	#$01,($0003,a0)
	move.b	d0,($0009,a0)
	move.b	d0,(L007554)
	movem.l	(sp)+,d0/a0
	rts

L004af8:
	movem.l	d0/a0,-(sp)
	move.b	(L007554),d0
	bset.l	#$02,d0
	movea.l	(L0049ee),a0
	move.b	#$01,($0003,a0)
	move.b	d0,($0009,a0)
	move.b	d0,(L007554)
	movem.l	(sp)+,d0/a0
	rts

L004b22:
	movem.l	d0-d2/a0,-(sp)
	tst.b	(L0074c8)
	bne.s	L004b74
	clr.l	(L007578)
	clr.b	(L00757c)
	move.b	#$02,(L007564)
	move.b	(L00755c),d0
	addq.b	#1,d0
	movea.l	(L0049ee),a0
	move.b	#$06,($0003,a0)
	move.b	d0,($000f,a0)
	move.b	(L007555),d0
	andi.b	#$f8,d0
	ori.b	#$02,d0
	move.b	#$01,($0003,a0)
	move.b	d0,($000b,a0)
	bra.s	L004b86

L004b74:
	clr.l	(L00580c)
	move.b	#$14,d1
	move.b	#$15,d2
	bsr.w	L0064ae
L004b86:
	movem.l	(sp)+,d0-d2/a0
	rts

L004b8c:
	movem.l	d0-d2/a0,-(sp)
	tst.b	(L0074c8)
	bne.s	L004bb8
	move.b	(L007555),d0
	andi.b	#$f8,d0
	ori.b	#$04,d0
	movea.l	(L0049ee),a0
	move.b	#$01,($0003,a0)
	move.b	d0,($000b,a0)
	bra.s	L004bc4

L004bb8:
	move.b	#$14,d1
	move.b	#$04,d2
	bsr.w	L0064ae
L004bc4:
	movem.l	(sp)+,d0-d2/a0
	rts

L004bca:
	movem.l	d0-d2/a0,-(sp)
	tst.b	(L0074c8)
	bne.s	L004bf6
	move.b	(L007555),d0
	andi.b	#$f8,d0
	ori.b	#$03,d0
	movea.l	(L0049ee),a0
	move.b	#$01,($0003,a0)
	move.b	d0,($000b,a0)
	bra.s	L004c02

L004bf6:
	move.b	#$14,d1
	move.b	#$15,d2
	bsr.w	L0064ae
L004c02:
	movem.l	(sp)+,d0-d2/a0
	rts

L004c08:
	movem.l	d0/a0,-(sp)
	clr.l	(L00d9f0)
	movea.l	(L0049ee),a0
	move.b	(L007553),d0
	ori.b	#$28,d0
	move.b	d0,(L007553)
	move.b	#$00,($0003,a0)
	move.b	d0,($000d,a0)
	move.b	(L007557),d0
	ori.b	#$81,d0
	move.b	#$03,($0003,a0)
	move.b	d0,($000b,a0)
	and.b	#$7f,d0
	move.b	d0,(L007557)
	move.b	(L007555),d0
	ori.b	#$08,d0
	move.b	d0,(L007555)
	movem.l	(sp)+,d0/a0
	rts

L004c66:
	movem.l	d0/a0,-(sp)
	movea.l	(L0049ee),a0
	move.b	(L007553),d0
	andi.b	#$d7,d0
	move.b	d0,(L007553)
	move.b	#$00,($0003,a0)
	move.b	d0,($000d,a0)
	move.b	(L007557),d0
	and.b	#$7e,d0
	move.b	#$03,($0003,a0)
	move.b	d0,($000b,a0)
	move.b	d0,(L007557)
	move.b	(L007555),d0
	andi.b	#$f7,d0
	move.b	d0,(L007555)
	movem.l	(sp)+,d0/a0
	rts

L004cba:
	movem.l	d0-d1/a0,-(sp)
	move.b	(L007554),d1
	ext.w	d0
	move.w	d0,(L007572)
	bne.s	L004cd8
	andi.b	#$f4,d1
	ori.b	#$03,d1
	bra.s	L004cee

L004cd8:
	subq.w	#1,d0
	bne.s	L004ce6
	andi.b	#$f4,d1
	ori.b	#$09,d1
	bra.s	L004cee

L004ce6:
	andi.b	#$f4,d1
	ori.b	#$02,d1
L004cee:
	movea.l	(L0049ee),a0
	move.b	#$01,($0003,a0)
	move.b	d1,($0009,a0)
	move.b	d1,(L007554)
	movem.l	(sp)+,d0-d1/a0
	rts

L004d0a:
	movem.l	d0/a0,-(sp)
	clr.w	d0
	bsr.s	L004cba
	move.b	(L007553),d0
	andi.b	#$fe,d0
	movea.l	(L0049ee),a0
	move.b	#$00,($0003,a0)
	move.b	d0,($000d,a0)
	movem.l	(sp)+,d0/a0
	rts

L004d32:
	movem.l	d0/a0,-(sp)
	movea.l	(L0049ee),a0
	move.w	#$0001,d0
	bsr.w	L004cba
	move.b	(L007557),d0
	ori.b	#$01,d0
	move.b	#$03,($0003,a0)
	move.b	d0,($000b,a0)
	move.b	(L007553),d0
	ori.b	#$01,d0
	move.b	#$00,($0003,a0)
	move.b	d0,($000d,a0)
	movem.l	(sp)+,d0/a0
	rts

L004d72:
	movem.l	d0,-(sp)
	move.w	#$0002,d0
	bsr.w	L004cba
	movem.l	(sp)+,d0
	rts

L004d84:
	movem.l	d0-d1/a0,-(sp)
	andi.l	#$000001ff,d0
	cmpi.w	#$0014,d0
	bcc.s	L004d98
	move.w	#$0014,d0
L004d98:
	cmpi.w	#$012d,d0
	bcs.s	L004da2
	move.w	#$012c,d0
L004da2:
	move.w	d0,(L007550)
	tst.b	(L0074c8)
	bne.s	L004dde
	move.l	#$03938700,d1
	mulu.w	#$0018,d0
	lsl.l	#3,d0
	divu.w	d0,d1
	andi.l	#$00003fff,d1
	movea.l	(L0049ee),a0
	move.w	d1,d0
	move.b	#$08,($0003,a0)
	move.b	d0,($000d,a0)
	lsr.w	#8,d0
	move.b	d0,($000f,a0)
	bra.s	L004e04

L004dde:
	move.l	#$00004c4b,d1
	divu.w	d0,d1
	and.w	#$03ff,d1
	move.w	#$0400,d0
	sub.w	d1,d0
	move.w	d0,d1
	lsr.w	#2,d1
	and.w	#$0003,d0
	move.b	d1,(L004e0a)
	move.b	d0,(L004e0b)
L004e04:
	movem.l	(sp)+,d0-d1/a0
	rts

L004e0a:
	.dc.b	$00
L004e0b:
	.dc.b	$00
L004e0c:
	link.w	a6,#$0000
	movem.l	d0-d1/a0,-(sp)
	movea.l	(L0049ee),a0
	move.b	($000c,a6),d0
	cmpi.b	#$10,d0
	bcs.s	L004e42
	subi.b	#$10,d0
	move.b	d0,d1
	move.b	($0008,a6),d0
	swap.w	d0
	move.b	($000a,a6),d0
	jsr	(L005e04)
	movem.l	(sp)+,d0-d1/a0
	unlk	a6
	rts

L004e42:
	addi.b	#$90,d0
L004e46:
	move.b	#$05,($0003,a0)
	btst.b	#$06,($0009,a0)
	beq.s	L004e46
	move.b	d0,($000d,a0)
L004e58:
	move.b	#$05,($0003,a0)
	btst.b	#$06,($0009,a0)
	beq.s	L004e58
	move.b	($000a,a6),($000d,a0)
L004e6c:
	move.b	#$05,($0003,a0)
	btst.b	#$06,($0009,a0)
	beq.s	L004e6c
	move.b	($0008,a6),($000d,a0)
	movem.l	(sp)+,d0-d1/a0
	unlk	a6
	rts

L004e88:
	link.w	a6,#$0000
	movem.l	d0-d1/a0,-(sp)
	movea.l	(L0049ee),a0
	move.b	($000c,a6),d0
	cmpi.b	#$10,d0
	bcs.s	L004eb4
	subi.b	#$10,d0
	move.b	d0,d1
	jsr	(L005de0)
	movem.l	(sp)+,d0-d1/a0
	unlk	a6
	rts

L004eb4:
	addi.b	#$80,d0
L004eb8:
	move.b	#$05,($0003,a0)
	btst.b	#$06,($0009,a0)
	beq.s	L004eb8
	move.b	d0,($000d,a0)
L004eca:
	move.b	#$05,($0003,a0)
	btst.b	#$06,($0009,a0)
	beq.s	L004eca
	move.b	($000a,a6),($000d,a0)
L004ede:
	move.b	#$05,($0003,a0)
	btst.b	#$06,($0009,a0)
	beq.s	L004ede
	move.b	($0008,a6),($000d,a0)
	movem.l	(sp)+,d0-d1/a0
	unlk	a6
	rts

L004efa:
	link.w	a6,#$0000
	movem.l	d0-d2/a0,-(sp)
	moveq.l	#$7b,d2			;'{'
	lea.l	(L005de0),a0
	bra.s	L004f2e

L004f0c:
	link.w	a6,#$0000
	movem.l	d0-d2/a0,-(sp)
	moveq.l	#$01,d2
	lea.l	(L0060ca),a0
	bra.s	L004f2e

L004f1e:
	link.w	a6,#$0000
	movem.l	d0-d2/a0,-(sp)
	moveq.l	#$40,d2			;'@'
	lea.l	(L006002),a0
L004f2e:
	moveq.l	#$17,d1
	move.w	($0008,a6),d0
	beq.s	L004f3e
	bmi.s	L004f3e
	subq.w	#1,d0
	bsr.s	L004f4e
	bra.s	L004f46

L004f3e:
	move.w	d1,d0
	bsr.s	L004f4e
	dbra.w	d1,L004f3e
L004f46:
	movem.l	(sp)+,d0-d2/a0
	unlk	a6
	rts

L004f4e:
	cmpi.b	#$10,d0
	bcs.s	L004f64
	subi.b	#$10,d0
	move.w	d1,-(sp)
	move.w	d0,d1
	clr.w	d0
	jsr	(a0)
	move.w	(sp)+,d1
	rts

L004f64:
	add.b	#$b0,d0
	bsr.w	L00519e
	move.b	d2,d0
	bsr.w	L00519e
	clr.b	d0
	bsr.w	L00519e
	rts

L004f7a:
	link.w	a6,#$0000
	movem.l	d0-d1,-(sp)
	move.w	#$0017,d1
	move.w	($0008,a6),d0
	beq.s	L004f94
	bmi.s	L004f94
	subq.w	#1,d0
	bsr.s	L004fa4
	bra.s	L004f9c

L004f94:
	move.w	d1,d0
	bsr.s	L004fa4
	dbra.w	d1,L004f94
L004f9c:
	movem.l	(sp)+,d0-d1
	unlk	a6
	rts

L004fa4:
	cmpi.b	#$10,d0
	bcs.s	L004fc0
	subi.b	#$10,d0
	move.w	d1,-(sp)
	exg.l	d0,d1
	move.w	#$0040,d0		;'@'
	jsr	(L006032)
	move.w	(sp)+,d1
	rts

L004fc0:
	add.b	#$e0,d0
	bsr.w	L00519e
	clr.b	d0
	bsr.w	L00519e
	move.b	#$40,d0			;'@'
	bsr.w	L00519e
	rts

L004fd8:
	link.w	a6,#$0000
	movem.l	d0-d1,-(sp)
	move.b	($000a,a6),d0
	cmpi.b	#$10,d0
	bcs.s	L005002
	subi.b	#$10,d0
	move.b	d0,d1
	move.b	($0008,a6),d0
	jsr	(L005f76)
	movem.l	(sp)+,d0-d1
	unlk	a6
	rts

L005002:
	addi.b	#$b0,d0
	bsr.w	L00519e
	move.b	#$07,d0
	bsr.w	L00519e
	move.b	($0008,a6),d0
	bsr.w	L00519e
	movem.l	(sp)+,d0-d1
	unlk	a6
	rts

L005022:
	link.w	a6,#$0000
	movem.l	d0-d1,-(sp)
	move.b	($000a,a6),d0
	cmpi.b	#$10,d0
	bcs.s	L00504c
	subi.b	#$10,d0
	move.b	d0,d1
	move.b	($0008,a6),d0
	jsr	(L005fb0)
	movem.l	(sp)+,d0-d1
	unlk	a6
	rts

L00504c:
	addi.b	#$b0,d0
	bsr.w	L00519e
	move.b	#$0a,d0
	bsr.w	L00519e
	move.b	($0008,a6),d0
	bsr.w	L00519e
	movem.l	(sp)+,d0-d1
	unlk	a6
	rts

L00506c:
	link.w	a6,#$0000
	movem.l	d0-d1,-(sp)
	move.b	($000a,a6),d0
	cmpi.b	#$10,d0
	bcs.s	L005086
	movem.l	(sp)+,d0-d1
	unlk	a6
	rts

L005086:
	addi.b	#$d0,d0
	bsr.w	L00519e
	move.b	($0008,a6),d0
	bsr.w	L00519e
	movem.l	(sp)+,d0-d1
	unlk	a6
	rts

L00509e:
	link.w	a6,#$0000
	movem.l	d0-d1,-(sp)
	move.b	($000a,a6),d0
	cmpi.b	#$10,d0
	bcs.s	L0050c8
	subi.b	#$10,d0
	move.b	d0,d1
	move.b	($0008,a6),d0
	jsr	(L0061b4)
	movem.l	(sp)+,d0-d1
	unlk	a6
	rts

L0050c8:
	move.b	($0008,a6),d1
	bmi.s	L0050e4
	addi.b	#$c0,d0
	bsr.w	L00519e
	move.b	d1,d0
	bsr.w	L00519e
	movem.l	(sp)+,d0-d1
	unlk	a6
	rts

L0050e4:
	addi.b	#$b0,d0
	bsr.w	L00519e
	clr.b	d0
	bsr.w	L00519e
	moveq.l	#$01,d0
	bsr.w	L00519e
	move.b	($000a,a6),d0
	addi.b	#$c0,d0
	bsr.w	L00519e
	move.b	d1,d0
	andi.b	#$7f,d0
	bsr.w	L00519e
	movem.l	(sp)+,d0-d1
	unlk	a6
	rts

L005116:
	link.w	a6,#$0000
	movem.l	d0-d1,-(sp)
	move.b	($000a,a6),d0
	cmpi.b	#$10,d0
	bcs.s	L005140
	subi.b	#$10,d0
	move.b	d0,d1
	move.w	($0008,a6),d0
	jsr	(L006032)
	movem.l	(sp)+,d0-d1
	unlk	a6
	rts

L005140:
	addi.b	#$e0,d0
	bsr.s	L00519e
	move.b	($0008,a6),d0
	bsr.s	L00519e
	move.b	($0009,a6),d0
	bsr.s	L00519e
	movem.l	(sp)+,d0-d1
	unlk	a6
	rts

L00515a:
	link.w	a6,#$0000
	movem.l	d0-d1,-(sp)
	move.b	($000a,a6),d0
	cmpi.b	#$10,d0
	bcs.s	L005184
	subi.b	#$10,d0
	move.b	d0,d1
	move.b	($0008,a6),d0
	jsr	(L0060ca)
	movem.l	(sp)+,d0-d1
	unlk	a6
	rts

L005184:
	move.b	($0008,a6),d1
	addi.b	#$b0,d0
	bsr.s	L00519e
	moveq.l	#$01,d0
	bsr.s	L00519e
	move.b	d1,d0
	bsr.s	L00519e
	movem.l	(sp)+,d0-d1
	unlk	a6
	rts

L00519e:
	tst.b	(L0074c8)
	bne.s	L0051d8
	tst.b	d0
	bpl.s	L0051b8
	cmp.b	(L0051da),d0
	beq.s	L0051d8
	move.b	d0,(L0051da)
L0051b8:
	move.b	#$05,($00eafa03)
	btst.b	#$06,($00eafa09)
	beq.s	L0051b8
	move.b	#$05,($00eafa03)
	move.b	d0,($00eafa0d)
L0051d8:
	rts

L0051da:
	.dc.w	$0000
L0051dc:
	movem.l	d0/a0,-(sp)
	movea.l	(L0049ee),a0
	move.b	(L00755c),d0
	ori.b	#$80,d0
	move.b	#$06,($0003,a0)
	move.b	d0,($000f,a0)
	movem.l	(sp)+,d0/a0
	rts

L005200:
	movem.l	d0/a0,-(sp)
	movea.l	(L0049ee),a0
	move.b	(L00755b),d0
	ori.b	#$01,d0
	move.b	#$06,($0003,a0)
	move.b	d0,($000d,a0)
	movem.l	(sp)+,d0/a0
	rts

L005224:
	movem.l	d0/a0,-(sp)
	movea.l	(L0049ee),a0
	move.b	(L00755b),d0
	andi.b	#$fe,d0
	move.b	#$06,($0003,a0)
	move.b	d0,($000d,a0)
	movem.l	(sp)+,d0/a0
	rts

L005248:
	movem.l	d0/a0,-(sp)
	movea.l	(L0049ee),a0
	bsr.w	L005afa
	andi.w	#$7fff,d0
	move.b	#$07,($0003,a0)
	move.b	d0,($000d,a0)
	bsr.w	L005afa
	lsr.w	#8,d0
	move.b	d0,($000f,a0)
	bsr.w	L005ae8
	move.b	(L00755d),d0
	ori.b	#$30,d0
	move.b	d0,($000b,a0)
	bsr.w	L005afa
	movem.l	(sp)+,d0/a0
	rts

L00528a:
	movem.l	d0/a0,-(sp)
	movea.l	(L0049ee),a0
	andi.w	#$7fff,d0
	move.b	#$07,($0003,a0)
	move.b	d0,($000d,a0)
	bsr.w	L005afa
	lsr.w	#8,d0
	move.b	d0,($000f,a0)
	bsr.w	L005ae8
	move.b	(L00755d),d0
	ori.b	#$20,d0
	move.b	d0,($000b,a0)
	movem.l	(sp)+,d0/a0
	rts

L0052c4:
	movem.l	d0/a0,-(sp)
	bsr.w	L005afa
	move.b	(L00755d),d0
	ori.b	#$10,d0
	movea.l	(L0049ee),a0
	move.b	#$07,($0003,a0)
	move.b	d0,($000b,a0)
	bsr.w	L005afa
	movem.l	(sp)+,d0/a0
	rts

L0052f0:
	movem.l	d1/a0,-(sp)
	movea.l	(L0049ee),a0
	clr.w	d1
	swap.w	d0
	move.b	#$05,($0003,a0)
L005304:
	move.b	($0009,a0),d0
	btst.l	#$06,d0
	bne.s	L005322
	addq.w	#1,d1
	cmpi.w	#$03e8,d1
	bcs.s	L005304
	move.b	#$05,($0003,a0)
	move.b	#$81,($000b,a0)
L005322:
	swap.w	d0
	move.b	#$05,($0003,a0)
	move.b	d0,($000d,a0)
	movem.l	(sp)+,d1/a0
	rts

L005334:
	move.b	(L007552),d0
	andi.b	#$f7,d0
	bra.s	L005362

L005340:
	move.b	(L007552),d0
	ori.b	#$08,d0
	bra.s	L005362

L00534c:
	move.b	(L007552),d0
	andi.b	#$fb,d0
	bra.s	L005362

L005358:
	move.b	(L007552),d0
	ori.b	#$04,d0
L005362:
	move.l	a0,-(sp)
	movea.l	(L0049ee),a0
	move.b	#$00,($0003,a0)
	move.b	d0,($000b,a0)
	move.b	d0,(L007552)
	move.b	#$12,($0007,a0)
	movea.l	(sp)+,a0
	rts

L005384:
	movem.l	d0/a0,-(sp)
	move.b	(L007554),d0
	ori.b	#$10,d0
	bra.s	L0053e2

L005394:
	movem.l	d0/a0,-(sp)
	move.b	(L007554),d0
	andi.b	#$ef,d0
	bra.s	L0053e2

L0053a4:
	movem.l	d0/a0,-(sp)
	move.b	(L007554),d0
	ori.b	#$08,d0
	bra.s	L0053e2

L0053b4:
	movem.l	d0/a0,-(sp)
	move.b	(L007554),d0
	andi.b	#$f7,d0
	bra.s	L0053e2

L0053c4:
	movem.l	d0/a0,-(sp)
	move.b	(L007554),d0
	ori.b	#$20,d0
	bra.s	L0053e2

L0053d4:
	movem.l	d0/a0,-(sp)
	move.b	(L007554),d0
	andi.b	#$df,d0
L0053e2:
	movea.l	(L0049ee),a0
	move.b	#$01,($0003,a0)
	move.b	d0,($0009,a0)
	move.b	d0,(L007554)
	movem.l	(sp)+,d0/a0
	rts

L0053fe:
	movem.l	d0-d1/a0,-(sp)
	movea.l	(L0049ee),a0
	move.b	#$05,($0003,a0)
L00540e:
	move.b	($0009,a0),d1
	btst.l	#$00,d1
	bne.s	L00540e
	move.b	#$04,($0003,a0)
	move.b	d0,($0009,a0)
	move.b	d0,(L007558)
	lsr.w	#8,d0
	move.b	d0,($000b,a0)
	movem.l	(sp)+,d0-d1/a0
	rts

L005434:
	movem.l	d0-d1/a0,-(sp)
	movea.l	(L0049ee),a0
	move.b	#$03,($0003,a0)
L005444:
	move.b	($0009,a0),d1
	btst.l	#$00,d1
	bne.s	L005444
	move.b	#$02,($0003,a0)
	move.b	d0,($0009,a0)
	move.b	d0,(L007556)
	lsr.w	#8,d0
	move.b	d0,($000b,a0)
	movem.l	(sp)+,d0-d1/a0
	rts

L00546a:
	move.l	d0,-(sp)
	move.b	(L007557),d0
	ori.b	#$80,d0
	bra.s	L0054d8

L005478:
	move.l	d0,-(sp)
	move.b	(L007557),d0
	ori.b	#$40,d0
	bra.s	L0054d8

L005486:
	move.l	d0,-(sp)
	move.b	(L007557),d0
	ori.b	#$10,d0
	bra.s	L0054d8

L005494:
	move.l	d0,-(sp)
	move.b	(L007557),d0
	andi.b	#$ef,d0
	bra.s	L0054d8

L0054a2:
	move.l	d0,-(sp)
	move.b	(L007557),d0
	ori.b	#$02,d0
	bra.s	L0054d8

L0054b0:
	move.l	d0,-(sp)
	move.b	(L007557),d0
	andi.b	#$fd,d0
	bra.s	L0054d8

L0054be:
	move.l	d0,-(sp)
	move.b	(L007557),d0
	ori.b	#$01,d0
	bra.s	L0054d8

L0054cc:
	move.l	d0,-(sp)
	move.b	(L007557),d0
	andi.b	#$fe,d0
L0054d8:
	move.l	a0,-(sp)
	movea.l	(L0049ee),a0
	move.b	#$03,($0003,a0)
	move.b	d0,($000b,a0)
	movea.l	(sp)+,a0
	move.l	(sp)+,d0
	rts

L0054f0:
	movem.l	d0/a0,-(sp)
	move.b	(L007559),d0
	ori.b	#$80,d0
	bra.s	L005532

L005500:
	movem.l	d0/a0,-(sp)
	move.b	(L007559),d0
	ori.b	#$01,d0
	bra.s	L005532

L005510:
	movem.l	d0/a0,-(sp)
	move.b	(L007559),d0
	andi.b	#$fe,d0
	bra.s	L005532

L005520:
	movem.l	d0/a0,-(sp)
	move.b	(L007559),d0
	ori.b	#$08,d0
	bra.w	L005532

L005532:
	movea.l	(L0049ee),a0
	move.b	#$05,($0003,a0)
	move.b	d0,($000b,a0)
	movem.l	(sp)+,d0/a0
	rts

L005548:
	movem.l	d0/a0,-(sp)
	move.w	#$0001,(L00756c)
	move.b	(L007558),d0
	bset.l	#$06,d0
	bra.s	L005574

L005560:
	movem.l	d0/a0,-(sp)
	clr.w	(L00756c)
	move.b	(L007558),d0
	bclr.l	#$06,d0
L005574:
	movea.l	(L0049ee),a0
	move.b	#$04,($0003,a0)
	move.b	d0,($0009,a0)
	move.b	d0,(L007558)
	movem.l	(sp)+,d0/a0
	rts

L005590:
	movem.l	d0/a0,-(sp)
	move.b	(L00755a),d0
	bset.l	#$07,d0
	bra.s	L0055ae

L0055a0:
	movem.l	d0/a0,-(sp)
	move.b	(L00755a),d0
	bclr.l	#$07,d0
L0055ae:
	movea.l	(L0049ee),a0
	move.b	#$06,($0003,a0)
	move.b	d0,($000b,a0)
	move.b	d0,(L00755a)
	movem.l	(sp)+,d0/a0
	rts

L0055ca:
	movem.l	d0/a0,-(sp)
	movea.l	(L0049ee),a0
	move.b	#$01,($0003,a0)
	move.b	d0,($000b,a0)
	andi.b	#$0f,d0
	cmpi.b	#$0a,d0
	bne.s	L0055ee
	clr.l	(L007578)
L0055ee:
	movem.l	(sp)+,d0/a0
	rts

L0055f4:
	movem.l	d0/a0,-(sp)
	movea.l	(L0049ee),a0
	move.b	#$02,($0003,a0)
	move.b	d0,($000d,a0)
	lsr.w	#8,d0
	move.b	d0,($000f,a0)
	movem.l	(sp)+,d0/a0
	rts

L005614:
	movem.l	d0/a0,-(sp)
	movea.l	(L0049ee),a0
	move.b	(L00755c),d0
	move.b	#$06,($0003,a0)
	move.b	d0,($000f,a0)
	movem.l	(sp)+,d0/a0
	rts

L005634:
	movem.l	d0/a0,-(sp)
	movea.l	(L0049ee),a0
	andi.w	#$3fff,d0
	ori.w	#$8000,d0
	move.b	#$08,($0003,a0)
	move.b	d0,($0009,a0)
	lsr.w	#8,d0
	move.b	d0,($000b,a0)
	movem.l	(sp)+,d0/a0
	rts

L00565c:
	movem.l	d0-d1/a0,-(sp)
	movea.l	(L0049ee),a0
	clr.l	d1
	move.b	d0,d1
	move.b	(L007553),d0
	bset.l	d1,d0
	bsr.s	L0056a8
	clr.w	d0
	bset.l	d1,d0
	move.b	d0,($0007,a0)
	movem.l	(sp)+,d0-d1/a0
	rts

L005682:
	movem.l	d0-d1/a0,-(sp)
	movea.l	(L0049ee),a0
	clr.l	d1
	move.b	d0,d1
	move.b	(L007553),d0
	bclr.l	d1,d0
	bsr.s	L0056a8
	clr.w	d0
	bset.l	d1,d0
	move.b	d0,($0007,a0)
	movem.l	(sp)+,d0-d1/a0
	rts

L0056a8:
	move.l	a0,-(sp)
	movea.l	(L0049ee),a0
	move.b	#$00,($0003,a0)
	move.b	d0,($000d,a0)
	move.b	d0,(L007553)
	movea.l	(sp)+,a0
	rts

L0056c4:
	movem.l	d0/a0,-(sp)
	movea.l	(L0049ee),a0
	move.b	#$ff,d0
	move.b	d0,($0007,a0)
	movem.l	(sp)+,d0/a0
	rts

L0056dc:
	move.b	#$01,($00eafa07)
	move.l	d1,-(sp)
	move.b	#$01,($00eafa03)
	move.b	($00eafa0d),d1
	move.b	#$01,($00eafa0f)
	cmpi.b	#$fa,d1
	bne.s	L005710
	bsr.w	L004b22
	move.w	#$0001,(L007a30)
	bra.s	L005726

L005710:
	cmpi.b	#$fc,d1
	bne.s	L00571c
	bsr.w	L001cb6
	bra.s	L005726

L00571c:
	cmpi.b	#$fb,d1
	bne.s	L005726
	bsr.w	L004bca
L005726:
	move.l	(sp)+,d1
	rte

L00572a:
	movem.l	d0-d1,-(sp)
	move.b	(L007564),d1
	beq.s	L005758
	subq.b	#1,d1
	bne.s	L005752
	move.b	(L00755c),d0
	ori.b	#$80,d0
	move.b	#$06,($00eafa03)
	move.b	d0,($00eafa0f)
L005752:
	move.b	d1,(L007564)
L005758:
	jsr	(L00494c)
	move.b	#$02,($00eafa07)
	movem.l	(sp)+,d0-d1
	rte

L00576c:
	movem.l	d1-d2,-(sp)
	move.b	#$14,d1
	move.b	#$15,d2
	bsr.w	L0064ae
	move.b	#$10,d1
	move.b	(L004e0a),d2
	bsr.w	L0064ae
	move.b	#$11,d1
	move.b	(L004e0b),d2
	bsr.w	L0064ae
	subq.b	#1,(L00580c)
	bpl.s	L005806
	move.b	#$03,(L00580c)
	subq.b	#1,(L00580e)
	bpl.s	L0057bc
	move.b	#$2f,(L00580e)		;'/'
	bsr.w	L00494c
L0057bc:
	bsr.w	L0040a4
	tst.w	(L007a0c)
	beq.s	L005806
	jsr	(L004b8c)
	clr.w	(L007a30)
	clr.w	(L007a0c)
	move.w	#$7fff,(L007a0a)
	movem.l	d1/a5,-(sp)
	lea.l	(L00c616),a5
	move.b	#$18,d1
L0057f0:
	bsr.w	L00431a
	bsr.w	L00406a
	adda.l	#$00000054,a5
	subq.b	#1,d1
	bne.s	L0057f0
	movem.l	(sp)+,d1/a5
L005806:
	movem.l	(sp)+,d1-d2
	rte

L00580c:
	.dc.w	$0000
L00580e:
	ori.w	#$0500,sr
	movem.l	d0,-(sp)
	bsr.w	L0040a4
	move.w	(L007566),d0
	move.b	#$07,($00eafa03)
	move.b	d0,($00eafa0d)
	bsr.w	L005afa
	lsr.w	#8,d0
	move.b	#$07,($00eafa03)
	move.b	d0,($00eafa0f)
	bsr.w	L005afa
	move.b	(L00755d),d0
	ori.b	#$20,d0
	move.b	#$07,($00eafa03)
	move.b	d0,($00eafa0b)
	bsr.w	$00005af2
	move.b	#$04,($00eafa07)
	tst.w	(L007a0c)
	beq.s	$000058b0
	jsr	(L004b8c)
	clr.w	(L007a30)
	clr.w	(L007a0c)
	move.w	#$7fff,(L007a0a)
	movem.l	d1/a5,-(sp)
	lea.l	(L00c616),a5
	move.w	#$0018,d1
	bsr.w	L00431a
	bsr.w	L00406a
	adda.l	#$00000054,a5
	dbra.w	d1,$0000589a
	movem.l	(sp)+,d1/a5
	movem.l	(sp)+,d0
	rte

L0058b6:
	move.b	#$08,($00eafa07)
	addq.l	#1,(L007578)
	rte

L0058c6:
	move.b	#$10,($00eafa07)
	rte

L0058d0:
	ori.w	#$0700,sr
	move.b	#$20,($00eafa07)	;' '
	tst.b	(L007852)
	beq.s	L0058e8
	bsr.s	L00590a
	rte

L0058e8:
	bsr.s	L0058ec
	rte

L0058ec:
	move.l	d0,-(sp)
	move.b	(L007557),d0
	ori.b	#$80,d0
	move.b	#$03,($00eafa03)
	move.b	d0,($00eafa0b)
	move.l	(sp)+,d0
	rts

L00590a:
	movem.l	d0-d2/a0-a2,-(sp)
	lea.l	(L00d9f0),a0
	lea.l	($0004,a0),a1
	lea.l	($0400,a1),a2
	moveq.l	#$00,d2
	cmpi.w	#$0002,(L00783a)
	bne.s	L00595c
	moveq.l	#$00,d0
	moveq.l	#$00,d1
	move.l	(L007578),d2
	move.b	(L00757c),d1
	move.b	#$07,($00eafa03)
	move.b	($00eafa09),d0
	bne.s	L005954
	btst.b	#$03,($00eafa05)
	beq.s	L005954
	addq.l	#1,d2
L005954:
	lsl.l	#8,d2
	add.l	d0,d2
	add.l	d1,d2
	lsr.l	#2,d2
L00595c:
	moveq.l	#$00,d1
	move.w	(a0),d1
L005960:
	move.b	#$03,($00eafa03)
	move.b	($00eafa09),d0
	bpl.s	L00599a
	move.b	#$03,($00eafa03)
	move.b	($00eafa0d),d0
	bpl.s	L005986
	cmpi.b	#$fe,d0
	beq.s	L005960
L005986:
	move.b	d0,(a1,d1.w)
	lsl.w	#1,d1
	move.w	d2,(a2,d1.w)
	lsr.w	#1,d1
	addq.w	#1,d1
	andi.w	#$03ff,d1
	bra.s	L005960

L00599a:
	move.w	d1,(a0)
	movem.l	(sp)+,d0-d2/a0-a2
	rts

L0059a2:
	move.b	#$40,($00eafa07)	;'@'
	rte

L0059ac:
	move.b	#$80,($00eafa07)
	movem.l	a0,-(sp)
	tst.w	(L007850)
	beq.s	L0059c2
	bsr.s	L0059de
L0059c2:
	lea.l	(L0059dc),a0
	subq.b	#1,(a0)
	bpl.s	L0059d6
	move.b	($0001,a0),(a0)
	clr.w	(L0051da)
L0059d6:
	movem.l	(sp)+,a0
	rte

L0059dc:
	.dc.b	$0f,$0f
L0059de:
	movem.l	d0-d5/a0-a4,-(sp)
	lea.l	(L00d9f0),a0
	lea.l	($0004,a0),a1
	movea.l	(L007848),a2
	movea.l	(L00783c),a4
	adda.l	(L007840),a4
	subq.l	#4,a4
	cmpa.l	a4,a2
	bcc.w	L005ace
	moveq.l	#$00,d2
	move.w	($0002,a0),d2
	cmp.w	(a0),d2
	beq.w	L005ace
	move.l	(L007844),d5
	move.w	(L00783a),d4
	subq.w	#1,d4
	bmi.s	L005a62
	lea.l	($0400,a1),a3
L005a26:
	move.b	(a1,d2.w),d0
	move.b	d0,(a2)+
	bpl.s	L005a40
	tst.w	d4
	beq.s	L005a40
	lsl.w	#1,d2
	move.b	(a3,d2.w),(a2)+
	move.b	($01,a3,d2.w),(a2)+
	lsr.w	#1,d2
	addq.l	#2,d5
L005a40:
	addq.l	#1,d5
	addq.w	#1,d2
	andi.w	#$03ff,d2
	cmp.w	(a0),d2
	beq.s	L005a50
	cmpa.l	a4,a2
	bcs.s	L005a26
L005a50:
	move.w	d2,($0002,a0)
	move.l	a2,(L007848)
	move.l	d5,(L007844)
	bra.s	L005ace

L005a62:
	lea.l	(L005ad6),a3
	move.w	(L005ad4),d3
L005a6e:
	move.b	(a1,d2.w),d0
	move.b	d0,d1
	andi.w	#$000f,d1
	lsr.b	#4,d0
	andi.w	#$000f,d0
	move.b	(a3,d0.w),d0
	move.b	(a3,d1.w),d1
	cmpi.w	#$004e,d3		;'N'
	bge.s	L005a92
	cmpi.b	#$38,d0			;'8'
	blt.s	L005a9e
L005a92:
	move.b	#$0d,(a2)+
	move.b	#$0a,(a2)+
	clr.w	d3
	addq.l	#2,d5
L005a9e:
	move.b	d0,(a2)+
	move.b	d1,(a2)+
	move.b	#$20,(a2)+		;' '
	addq.l	#3,d5
	addq.w	#3,d3
	addq.w	#1,d2
	andi.w	#$03ff,d2
	cmp.w	(a0),d2
	beq.s	L005ab8
	cmpa.l	a4,a2
	bcs.s	L005a6e
L005ab8:
	move.w	d3,(L005ad4)
	move.w	d2,($0002,a0)
	move.l	a2,(L007848)
	move.l	d5,(L007844)
L005ace:
	movem.l	(sp)+,d0-d5/a0-a4
	rts

L005ad4:
	.dc.w	$0000
L005ad6:
	.dc.b	'0123456789ABCDEF'
L005ae6:
	rte

L005ae8:
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
L005afa:
	nop
	rts

L005afe:
	rts

L005b00:
	bsr.w	L005d30
	bsr.w	L005cf4
	rts

L005b0a:
	movem.l	d0-d7/a0-a6,-(sp)
	move.l	sp,(L005c72)
	move.w	sr,(L005c76)
	ori.w	#$0700,sr
	move.l	($00000008).l,d1
	move.l	d1,(L005c78)
	move.l	#L005c7c,($00000008).l
	tst.b	($00eafa01)
L005b3a:
	move.l	(L005c78),d1
	move.l	d1,($00000008).l
	move.w	(L005c76),sr
	movea.l	(L005c72),sp
	movea.l	(L0049ee),a0
	bsr.w	L005d30
	move.b	#$00,($0003,a0)
	move.b	#$00,($000d,a0)
	move.b	#$00,($0003,a0)
	move.b	#$80,($0009,a0)
	bsr.w	L005c98
	tst.b	(L0074c8)
	bne.w	L005c60
	move.b	#$08,d0
	move.b	d0,(L00755a)
	move.b	#$06,($00eafa03)
	move.b	d0,($00eafa0b)
	move.b	#$02,d0
	move.b	d0,(L00755b)
	bsr.w	L005224
	move.w	#$00c0,d0
	bsr.w	L004a02
	move.b	#$18,d0
	move.b	d0,(L00755c)
	move.b	#$06,($00eafa03)
	move.b	d0,($00eafa0f)
	move.w	#$09c4,d0
	move.b	#$08,($00eafa03)
	move.b	d0,($00eafa09)
	nop
	nop
	nop
	nop
	lsr.w	#8,d0
	ori.b	#$80,d0
	move.b	d0,($00eafa0b)
	move.b	#$7f,(L007555)
	move.b	#$10,(L007557)
	move.b	#$dc,d0
	move.b	#$03,($00eafa03)
	move.b	d0,($00eafa0b)
	move.b	#$30,d0			;'0'
	move.b	d0,(L007554)
	move.w	#$0000,d0
	bsr.w	L004cba
	move.w	#$0008,d0
	bsr.w	L0053fe
	move.b	#$05,($00eafa03)
	move.b	#$85,($00eafa0b)
	move.w	#$0008,d0
	bsr.w	L005434
	move.b	#$03,(L007552)
	move.b	#$86,(L007553)
	bsr.w	L00534c
	bsr.w	L005334
	bsr.w	L0056c4
	bra.s	L005c6c

L005c60:
	move.b	#$14,d1
	move.b	#$00,d2
	bsr.w	L0064ae
L005c6c:
	movem.l	(sp)+,d0-d7/a0-a6
	rts

L005c72:
	.dc.l	$00000000
L005c76:
	.dc.w	$0000
L005c78:
	.dc.l	$00000000
L005c7c:
	move.l	a0,-(sp)
	move.b	#$01,(L0074c8)
	lea.l	(L0049f2),a0
	move.l	a0,(L0049ee)
	movea.l	(sp)+,a0
	bra.w	L005b3a

L005c98:
	movem.l	d0-d1/a0-a3,-(sp)
	tst.b	(L0074c8)
	bne.s	L005cd6
	lea.l	(L0074ca),a1
	lea.l	(L0074ee),a2
	lea.l	(L007500),a3
	moveq.l	#$07,d1
L005cb8:
	movea.l	(a1)+,a0
	move.w	(a2)+,d0
	move.l	a0,-(sp)
	move.w	d0,-(sp)
	DOS	_INTVCS
	addq.l	#6,sp
	move.l	d0,(a3)+
	dbra.w	d1,L005cb8
	move.l	#$00000000,(L007a28)
	bra.s	L005cee

L005cd6:
	moveq.l	#$6a,d0			;'j'
	lea.l	(L00576c),a1
	trap	#15
	tst.l	d0
	beq.s	L005cee
	move.l	#$ffffffff,(L007a28)
L005cee:
	movem.l	(sp)+,d0-d1/a0-a3
	rts

L005cf4:
	movem.l	d0-d1/a0-a2,-(sp)
	tst.b	(L0074c8)
	bne.s	L005d20
	lea.l	(L007500),a0
	lea.l	(L0074ee),a1
	moveq.l	#$07,d1
L005d0e:
	movea.l	(a0)+,a2
	move.w	(a1)+,d0
	move.l	a2,-(sp)
	move.w	d0,-(sp)
	DOS	_INTVCS
	addq.l	#6,sp
	dbra.w	d1,L005d0e
	bra.s	L005d2a

L005d20:
	moveq.l	#$6a,d0			;'j'
	movea.l	#$00000000,a1
	trap	#15
L005d2a:
	movem.l	(sp)+,d0-d1/a0-a2
	rts

L005d30:
	movem.l	d0/a0,-(sp)
	movea.l	(L0049ee),a0
	move.b	#$80,($0003,a0)
	move.w	#$000f,d0
L005d44:
	dbra.w	d0,L005d44
	clr.b	($0003,a0)
	movem.l	(sp)+,d0/a0
	rts

L005d52:
	movem.l	d0-d1/a0-a1,-(sp)
	move.b	#$c6,(L007a36)
	lea.l	(L00cee0),a0
	moveq.l	#$7f,d1
L005d66:
	move.l	#$ffffffff,(a0)+
	dbra.w	d1,L005d66
	moveq.l	#$07,d1
L005d72:
	moveq.l	#$00,d0
	bsr.w	L0061b4
	moveq.l	#$40,d0			;'@'
	bsr.w	L005f76
	moveq.l	#$40,d0			;'@'
	bsr.w	L005fb0
	moveq.l	#$00,d0
	move.b	(L006bc4),d0
	bsr.w	L006184
	moveq.l	#$40,d0			;'@'
	bsr.w	L006032
	bsr.s	L005de0
	dbra.w	d1,L005d72
	moveq.l	#$00,d0
	moveq.l	#$00,d1
	bsr.w	L0060ca
	movem.l	(sp)+,d0-d1/a0-a1
	rts

L005daa:
	movem.l	d0/a0-a1,-(sp)
	lea.l	(APianoStr1),a0
	lea.l	(APianoStr2),a1
	move.w	#$00a9,d0
L005dbe:
	move.l	(a0)+,(a1)+
	dbra.w	d0,L005dbe
	lea.l	(APianoData1),a0
	lea.l	(APianoData2),a1
	move.w	#$03a6,d0
L005dd4:
	move.l	(a0)+,(a1)+
	dbra.w	d0,L005dd4
	movem.l	(sp)+,d0/a0-a1
	rts

L005de0:
	cmpi.b	#$08,d1
	bcs.s	L005de8
	rts

L005de8:
	movem.l	d0-d2/a1,-(sp)
	bsr.w	L006688
	move.w	d1,d2
	move.b	#$08,d1
	bsr.w	L0064ae
	clr.w	($0006,a1)
	movem.l	(sp)+,d0-d2/a1
	rts

L005e04:
	cmpi.b	#$08,d1
	bcc.w	L0066e8
	movem.l	d0-d4/a0-a1,-(sp)
	bsr.w	L006688
	lea.l	(L007696),a0
	andi.l	#$007f007f,d0
	move.w	d1,d2
	move.l	d0,d3
	swap.w	d3
	move.w	d0,d4
	tst.b	($0006,a1)
	beq.s	L005e36
	moveq.l	#$08,d1
	jsr	(L0064ae)
L005e36:
	move.b	#$01,($0006,a1)
	move.b	d0,($0007,a1)
	move.w	d3,d0
	bsr.s	L005e8c
	move.b	($0010,a1),d3
	add.b	($0011,a1),d3
	cmpi.b	#$40,d3			;'@'
	blt.s	L005e58
	subi.b	#$40,d3			;'@'
	addq.w	#1,d4
L005e58:
	add.b	($000f,a1),d4
	move.b	(a0,d4.w),d1
	move.w	d2,d0
	move.w	d1,d2
	moveq.l	#$28,d1			;'('
	or.b	d0,d1
	bsr.w	L0064ae
	lsl.w	#2,d3
	move.b	d3,d2
	moveq.l	#$30,d1			;'0'
	or.b	d0,d1
	bsr.w	L0064ae
	move.b	($0004,a1),d2
	or.b	d0,d2
	move.b	#$08,d1
	bsr.w	L0064ae
	movem.l	(sp)+,d0-d4/a0-a1
	rts

L005e8c:
	movem.l	d0-d1/a0,-(sp)
	andi.w	#$007f,d0
	lsr.b	#3,d0
	lea.l	(L007586),a0
	move.b	(a0,d0.w),d1
	move.b	d1,($000c,a1)
	add.b	($000b,a1),d1
	move.b	d1,d0
	bsr.s	L005ee6
	movem.l	(sp)+,d0-d1/a0
	rts

L005eb2:
	cmpi.b	#$08,d1
	bcs.s	L005eba
	rts

L005eba:
	movem.l	d0-d2/a1,-(sp)
	bsr.w	L006688
	move.w	d1,d2
	clr.b	($0006,a1)
	tst.b	($0008,a1)
	bne.s	L005ee0
	tst.b	($0007,a5)
	bne.s	L005ee0
	clr.b	($0007,a1)
	move.b	#$08,d1
	bsr.w	L0064ae
L005ee0:
	movem.l	(sp)+,d0-d2/a1
	rts

L005ee6:
	movem.l	d0-d4/a2,-(sp)
	move.w	d2,d3
	movea.l	($0014,a1),a2
	tst.b	(a1)
	beq.s	L005efa
	moveq.l	#$60,d1			;'`'
	moveq.l	#$10,d4
	bsr.s	L005f24
L005efa:
	tst.b	($0001,a1)
	beq.s	L005f06
	moveq.l	#$70,d1			;'p'
	moveq.l	#$1b,d4
	bsr.s	L005f24
L005f06:
	tst.b	($0002,a1)
	beq.s	L005f12
	moveq.l	#$68,d1			;'h'
	moveq.l	#$26,d4			;'&'
	bsr.s	L005f24
L005f12:
	tst.b	($0003,a1)
	beq.s	L005f1e
	moveq.l	#$78,d1			;'x'
	moveq.l	#$31,d4			;'1'
	bsr.s	L005f24
L005f1e:
	movem.l	(sp)+,d0-d4/a2
	rts

L005f24:
	or.b	d3,d1
	move.b	d0,d2
	add.b	(a2,d4.w),d2
	bpl.s	L005f30
	moveq.l	#$7f,d2
L005f30:
	bsr.w	L0064ae
	rts

L005f36:
	cmpi.b	#$08,d0
	bcs.s	L005f3e
	rts

L005f3e:
	movem.l	d0-d2,-(sp)
	exg.l	d2,d0
	exg.l	d1,d2
	cmpi.b	#$01,d2
	bne.s	L005f52
	bsr.w	L0060d2
	bra.s	L005f70

L005f52:
	cmpi.b	#$07,d2
	bne.s	L005f5c
	bsr.s	L005f7e
	bra.s	L005f70

L005f5c:
	cmpi.b	#$0a,d2
	bne.s	L005f66
	bsr.s	L005fb8
	bra.s	L005f70

L005f66:
	cmpi.b	#$40,d2			;'@'
	bne.s	L005f70
	bsr.w	L00600a
L005f70:
	movem.l	(sp)+,d0-d2
	rts

L005f76:
	cmpi.b	#$08,d1
	bcs.s	L005f7e
	rts

L005f7e:
	movem.l	d0-d2/a1-a2,-(sp)
	bsr.w	L006688
	move.w	d1,d2
	move.b	d0,($000d,a1)
	andi.w	#$007f,d0
	lsr.b	#2,d0
	lea.l	(L007596),a2
	move.b	(a2,d0.w),d1
	move.b	d1,($000b,a1)
	move.b	($000c,a1),d0
	add.b	d1,d0
	bsr.w	L005ee6
	movem.l	(sp)+,d0-d2/a1-a2
	rts

L005fb0:
	cmpi.b	#$08,d1
	bcc.w	L0066c4
L005fb8:
	movem.l	d0-d3/a1-a2,-(sp)
	move.b	d1,d2
	bsr.w	L0066a6
	move.b	d0,($000e,a2)
	move.w	d2,d3
	movea.l	($0014,a2),a1
	cmpi.b	#$60,d0			;'`'
	bgt.s	L005fde
	cmpi.b	#$20,d0			;' '
	blt.s	L005fe4
	move.b	#$c0,d2
	bra.s	L005fe8

L005fde:
	move.b	#$40,d2			;'@'
	bra.s	L005fe8

L005fe4:
	move.b	#$80,d2
L005fe8:
	or.b	(a1),d2
	move.b	#$20,d1			;' '
	add.b	d3,d1
	bsr.w	L0064ae
	andi.b	#$c0,d2
	move.b	d2,($000a,a2)
	movem.l	(sp)+,d0-d3/a1-a2
	rts

L006002:
	cmpi.b	#$08,d1
	bcs.s	L00600a
	rts

L00600a:
	movem.l	d0-d2/a1,-(sp)
	bsr.w	L006688
	move.w	d1,d2
	move.b	d0,($0008,a1)
	bne.s	L00602c
	tst.b	($0007,a1)
	beq.s	L00602c
	move.b	#$08,d1
	bsr.w	L0064ae
	clr.b	($0007,a1)
L00602c:
	movem.l	(sp)+,d0-d2/a1
	rts

L006032:
	cmpi.b	#$08,d1
	bcs.s	L00603a
	rts

L00603a:
	movem.l	d0-d5/a0-a2,-(sp)
	bsr.w	L006688
	move.w	d1,d3
	lea.l	(L007696),a2
	moveq.l	#$00,d1
	moveq.l	#$00,d4
	moveq.l	#$00,d5
	ror.w	#8,d0
	move.b	d0,d1
	lsr.w	#1,d0
	andi.w	#$3f80,d0
	add.w	d1,d0
	lsr.w	#5,d0
	move.w	d0,d1
	add.w	d0,d0
	add.w	d1,d0
	subi.w	#$0300,d0
	beq.s	L006096
	bmi.s	L006078
	move.w	d0,d4
	move.w	d0,d5
	lsr.w	#6,d4
	andi.w	#$003f,d5
	bra.s	L00608c

L006078:
	neg.w	d0
	move.w	d0,d4
	lsr.w	#6,d4
	neg.w	d4
	subq.w	#1,d4
	move.w	#$003f,d5		;'?'
	andi.w	#$003f,d0
	sub.w	d0,d5
L00608c:
	move.b	d4,($000f,a1)
	move.b	d5,($0010,a1)
	bra.s	L0060a2

L006096:
	clr.b	($000f,a1)
	clr.b	($0010,a1)
	move.b	($0011,a1),d5
L0060a2:
	moveq.l	#$00,d2
	move.b	($0007,a1),d2
	beq.s	L0060b8
	add.b	d4,d2
	move.b	(a2,d2.w),d2
	moveq.l	#$28,d1			;'('
	or.b	d3,d1
	bsr.w	L0064ae
L0060b8:
	moveq.l	#$30,d1			;'0'
	or.b	d3,d1
	lsl.w	#2,d5
	move.b	d5,d2
	bsr.w	L0064ae
	movem.l	(sp)+,d0-d5/a0-a2
	rts

L0060ca:
	cmpi.b	#$08,d1
	bcs.s	L0060d2
	rts

L0060d2:
	movem.l	d0-d3/a1-a2,-(sp)
	move.w	d1,d2
	bsr.w	L0066a6
	move.w	d2,d3
	movea.l	($0014,a2),a1
	move.b	d0,($0012,a2)
	beq.s	L006124
	moveq.l	#$1b,d1
	move.b	#$02,d2
	bsr.w	L0064ae
	moveq.l	#$18,d1
	move.b	(L007a36),d2
	bsr.w	L0064ae
	moveq.l	#$19,d1
	move.b	(L007a37),d2
	move.b	d2,(L007a38)
	or.b	#$80,d2
	bsr.w	L0064ae
	moveq.l	#$38,d1			;'8'
	add.b	d3,d1
	move.b	d0,d2
	and.b	#$70,d2
	bsr.w	L0064ae
	bra.s	L00617e

L006124:
	moveq.l	#$38,d1			;'8'
	add.b	d3,d1
	moveq.l	#$00,d2
	bsr.w	L0064ae
	moveq.l	#$19,d1
	moveq.l	#$80,d2
	clr.b	(L007a38)
	jsr	(L0064ae)
	tst.w	(L007a34)
	beq.s	L00617e
	moveq.l	#$18,d1
	move.b	($0004,a1),d2
	jsr	(L0064ae)
	moveq.l	#$1b,d1
	move.b	($0002,a1),d2
	jsr	(L0064ae)
	moveq.l	#$19,d1
	move.b	($0005,a1),d2
	or.b	#$80,d2
	jsr	(L0064ae)
	moveq.l	#$19,d1
	move.b	($0006,a1),d2
	and.b	#$7f,d2
	jsr	(L0064ae)
L00617e:
	movem.l	(sp)+,d0-d3/a1-a2
	rts

L006184:
	cmpi.b	#$08,d1
	bcs.s	L00618c
	rts

L00618c:
	movem.l	d0-d2/a1,-(sp)
	bsr.w	L006688
	move.b	d0,d2
	cmpi.b	#$3f,d2			;'?'
	ble.s	L0061a0
	move.b	#$3f,d2			;'?'
L0061a0:
	move.b	d2,($0011,a1)
	lsl.b	#2,d2
	addi.b	#$30,d1			;'0'
	bsr.w	L0064ae
	movem.l	(sp)+,d0-d2/a1
	rts

L0061b4:
	cmpi.b	#$08,d1
	bcs.s	L0061bc
	rts

L0061bc:
	movem.l	d0-d3/a0-a2,-(sp)
	move.b	d1,d2
	bsr.w	L0066a6
	move.w	d2,d3
	move.b	#$08,d1
	bsr.w	L0064ae
	clr.w	($0006,a2)
	move.b	d0,($0013,a2)
	lea.l	(APianoData2),a1
	and.l	#$000000ff,d0
	mulu.w	#$0037,d0
	adda.l	d0,a1
	move.l	a1,($0014,a2)
	move.b	($0003,a1),($0005,a2)
	move.b	($0001,a1),d0
	asl.b	#3,d0
	move.b	d0,($0004,a2)
	move.b	(a1),d0
	and.l	#$00000007,d0
	lsl.l	#2,d0
	lea.l	(L007676),a0
	move.l	(a0,d0.w),(a2)
	tst.w	(L007a34)
	beq.s	L006268
	moveq.l	#$1b,d1
	move.b	($0002,a1),d2
	and.b	#$03,d2
	bsr.w	L0064ae
	moveq.l	#$18,d1
	move.b	($0004,a1),d2
	jsr	(L0064ae)
	moveq.l	#$19,d1
	move.b	($0005,a1),d2
	or.b	#$80,d2
	jsr	(L0064ae)
	moveq.l	#$19,d1
	move.b	($0006,a1),d2
	and.b	#$7f,d2
	jsr	(L0064ae)
	moveq.l	#$38,d1			;'8'
	move.b	($0007,a1),d2
	asl.b	#4,d2
	or.b	($0008,a1),d2
	or.b	d3,d1
	bsr.w	L0064ae
	bra.s	L0062b0

L006268:
	moveq.l	#$1b,d1
	move.b	#$02,d2
	bsr.w	L0064ae
	moveq.l	#$18,d1
	move.b	(L007a36),d2
	jsr	(L0064ae)
	moveq.l	#$19,d1
	move.b	(L007a38),d2
	ori.b	#$80,d2
	jsr	(L0064ae)
	moveq.l	#$19,d1
	move.b	(L007a39),d2
	jsr	(L0064ae)
	moveq.l	#$38,d1			;'8'
	add.b	d3,d1
	move.b	($0012,a2),d2
	and.b	#$70,d2
	bsr.w	L0064ae
L0062b0:
	bsr.s	L0062c2
	move.b	($0012,a2),d0
	beq.s	L0062bc
	bsr.w	L0060ca
L0062bc:
	movem.l	(sp)+,d0-d3/a0-a2
	rts

L0062c2:
	movem.l	d0-d4,-(sp)
	move.b	($000b,a2),d4
	moveq.l	#$0f,d1
	move.b	($000a,a1),d2
	jsr	(L0064ae)
	move.b	#$20,d1			;' '
	move.b	($000a,a2),d2
	or.b	(a1),d2
	or.b	d3,d1
	bsr.w	L0064ae
	moveq.l	#$40,d1			;'@'
	move.b	($0013,a1),d2
	asl.b	#4,d2
	or.b	($0012,a1),d2
	or.b	d3,d1
	bsr.w	L0064ae
	moveq.l	#$50,d1			;'P'
	move.b	($001e,a1),d2
	asl.b	#4,d2
	or.b	($001d,a1),d2
	or.b	d3,d1
	bsr.w	L0064ae
	moveq.l	#$48,d1			;'H'
	move.b	($0029,a1),d2
	asl.b	#4,d2
	or.b	($0028,a1),d2
	or.b	d3,d1
	bsr.w	L0064ae
	moveq.l	#$58,d1			;'X'
	move.b	($0034,a1),d2
	asl.b	#4,d2
	or.b	($0033,a1),d2
	or.b	d3,d1
	bsr.w	L0064ae
	moveq.l	#$60,d1			;'`'
	move.b	($0010,a1),d2
	tst.b	(a2)
	beq.s	L00633e
	add.b	d4,d2
	bsr.w	L0064a4
L00633e:
	or.b	d3,d1
	bsr.w	L0064ae
	moveq.l	#$70,d1			;'p'
	move.b	($001b,a1),d2
	tst.b	($0001,a2)
	beq.s	L006356
	add.b	d4,d2
	bsr.w	L0064a4
L006356:
	or.b	d3,d1
	bsr.w	L0064ae
	moveq.l	#$68,d1			;'h'
	move.b	($0026,a1),d2
	tst.b	($0002,a2)
	beq.s	L00636e
	add.b	d4,d2
	bsr.w	L0064a4
L00636e:
	or.b	d3,d1
	bsr.w	L0064ae
	moveq.l	#$78,d1			;'x'
	move.b	($0031,a1),d2
	tst.b	($0003,a2)
	beq.s	L006386
	add.b	d4,d2
	bsr.w	L0064a4
L006386:
	or.b	d3,d1
	bsr.w	L0064ae
	moveq.l	#$80,d1
	move.b	($0011,a1),d2
	asl.b	#6,d2
	or.b	($000b,a1),d2
	or.b	d3,d1
	bsr.w	L0064ae
	moveq.l	#$90,d1
	move.b	($001c,a1),d2
	asl.b	#6,d2
	or.b	($0016,a1),d2
	or.b	d3,d1
	bsr.w	L0064ae
	moveq.l	#$88,d1
	move.b	($0027,a1),d2
	asl.b	#6,d2
	or.b	($0021,a1),d2
	or.b	d3,d1
	bsr.w	L0064ae
	moveq.l	#$98,d1
	move.b	($0032,a1),d2
	asl.b	#6,d2
	or.b	($002c,a1),d2
	or.b	d3,d1
	bsr.w	L0064ae
	moveq.l	#$a0,d1
	move.b	($0015,a1),d2
	asl.b	#7,d2
	or.b	($000c,a1),d2
	or.b	d3,d1
	bsr.w	L0064ae
	moveq.l	#$b0,d1
	move.b	($0020,a1),d2
	asl.b	#7,d2
	or.b	($0017,a1),d2
	or.b	d3,d1
	bsr.w	L0064ae
	moveq.l	#$a8,d1
	move.b	($002b,a1),d2
	asl.b	#7,d2
	or.b	($0022,a1),d2
	or.b	d3,d1
	bsr.w	L0064ae
	moveq.l	#$b8,d1
	move.b	($0036,a1),d2
	asl.b	#7,d2
	or.b	($002d,a1),d2
	or.b	d3,d1
	bsr.w	L0064ae
	moveq.l	#$c0,d1
	move.b	($0014,a1),d2
	asl.b	#6,d2
	or.b	($000d,a1),d2
	or.b	d3,d1
	bsr.w	L0064ae
	moveq.l	#$d0,d1
	move.b	($001f,a1),d2
	asl.b	#6,d2
	or.b	($0018,a1),d2
	or.b	d3,d1
	bsr.s	L0064ae
	moveq.l	#$c8,d1
	move.b	($002a,a1),d2
	asl.b	#6,d2
	or.b	($0023,a1),d2
	or.b	d3,d1
	bsr.s	L0064ae
	moveq.l	#$d8,d1
	move.b	($0035,a1),d2
	asl.b	#6,d2
	or.b	($002e,a1),d2
	or.b	d3,d1
	bsr.s	L0064ae
	moveq.l	#$e0,d1
	move.b	($000f,a1),d2
	asl.b	#4,d2
	or.b	($000e,a1),d2
	or.b	d3,d1
	bsr.s	L0064ae
	moveq.l	#$f0,d1
	move.b	($001a,a1),d2
	asl.b	#4,d2
	or.b	($0019,a1),d2
	or.b	d3,d1
	bsr.s	L0064ae
	moveq.l	#$e8,d1
	move.b	($0025,a1),d2
	asl.b	#4,d2
	or.b	($0024,a1),d2
	or.b	d3,d1
	bsr.s	L0064ae
	moveq.l	#$f8,d1
	move.b	($0030,a1),d2
	asl.b	#4,d2
	or.b	($002f,a1),d2
	or.b	d3,d1
	bsr.s	L0064ae
	movem.l	(sp)+,d0-d4
	rts

L0064a4:
	tst.b	d2
	bpl.s	L0064ac
	move.b	#$7f,d2
L0064ac:
	rts

L0064ae:
	movem.l	d1-d2/a0,-(sp)
	andi.w	#$00ff,d1
	andi.w	#$00ff,d2
	lea.l	(L00cee0),a0
L0064c0:
	tst.b	($00e90003)
	bmi.s	L0064c0
	move.b	d1,($00e90001)
L0064ce:
	tst.b	($00e90003)
	bmi.s	L0064ce
	move.b	d2,($00e90003)
	cmpi.b	#$19,d1
	bne.s	L0064ec
	tst.b	d2
	bpl.s	L0064ec
	addq.l	#2,a0
	andi.w	#$007f,d2
L0064ec:
	add.w	d1,d1
	move.w	d2,(a0,d1.w)
	movem.l	(sp)+,d1-d2/a0
	rts

L0064f8:
	movem.l	d0-d2/a1,-(sp)
	tst.l	d2
	beq.s	L006532
	bmi.s	L006532
	divu.w	#$0050,d2
	subq.w	#1,d2
	bmi.s	L006532
	moveq.l	#$00,d0
L00650c:
	bsr.s	L006538
	lea.l	($0050,a1),a1
	addq.w	#1,d0
	cmpi.w	#$00c8,d0
	beq.s	L00651e
	dbra.w	d2,L00650c
L00651e:
	move.w	#$0007,d1
L006522:
	bsr.w	L006688
	move.b	($0013,a1),d0
	bsr.w	L0061b4
	dbra.w	d1,L006522
L006532:
	movem.l	(sp)+,d0-d2/a1
	rts

L006538:
	movem.l	d0-d2/a0-a2,-(sp)
	movea.l	a1,a0
	lea.l	(APianoData2),a1
	lea.l	(APianoStr2),a2
	tst.b	($004f,a0)
	beq.s	L006556
	moveq.l	#$00,d0
	move.b	($004f,a0),d0
L006556:
	cmpi.w	#$00c8,d0
	bcc.s	L0065d6
	move.w	d0,d1
	mulu.w	#$0037,d0
	mulu.w	#$000a,d1
	adda.l	d0,a1
	adda.l	d1,a2
	moveq.l	#$09,d1
L00656c:
	move.b	(a0)+,d0
	cmpi.b	#$20,d0			;' '
	bcc.s	L006578
	move.b	#$20,d0			;' '
L006578:
	move.b	d0,(a2)+
	dbra.w	d1,L00656c
	moveq.l	#$00,d1
	moveq.l	#$0a,d2
L006582:
	move.b	(a0)+,($0b,a1,d1.w)
	move.b	(a0)+,($16,a1,d1.w)
	move.b	(a0)+,($21,a1,d1.w)
	move.b	(a0)+,($2c,a1,d1.w)
	addq.w	#1,d1
	dbra.w	d2,L006582
	move.b	(a0)+,d0
	move.b	(a0)+,d1
	lsl.b	#3,d0
	add.b	d1,d0
	move.b	d0,(a1)
	move.b	(a0)+,($0002,a1)
	move.b	(a0)+,($0004,a1)
	move.b	(a0)+,($0007,a1)
	move.b	(a0)+,($0008,a1)
	move.b	(a0)+,($0005,a1)
	move.b	(a0)+,($0006,a1)
	move.b	(a0)+,d0
	andi.b	#$01,d0
	ror.b	#1,d0
	add.b	(a0)+,d0
	move.b	d0,($000a,a1)
	move.b	#$03,($0009,a1)
	move.b	(a0)+,($0003,a1)
	move.b	(a0)+,($0001,a1)
L0065d6:
	movem.l	(sp)+,d0-d2/a0-a2
	rts

L0065dc:
	movem.l	d0-d2/a0-a2,-(sp)
	cmpi.w	#$00c8,d0
	bcc.w	L006682
	lea.l	(APianoData2),a1
	lea.l	(APianoStr2),a2
	move.b	d0,($004f,a0)
	move.w	d0,d1
	mulu.w	#$0037,d0
	mulu.w	#$000a,d1
	adda.l	d0,a1
	adda.l	d1,a2
	moveq.l	#$09,d1
L006608:
	move.b	(a2)+,d0
	cmpi.b	#$20,d0			;' '
	bcc.s	L006614
	move.b	#$20,d0			;' '
L006614:
	move.b	d0,(a0)+
	dbra.w	d1,L006608
	moveq.l	#$00,d1
	moveq.l	#$0a,d2
L00661e:
	move.b	($0b,a1,d1.w),(a0)+
	move.b	($16,a1,d1.w),(a0)+
	move.b	($21,a1,d1.w),(a0)+
	move.b	($2c,a1,d1.w),(a0)+
	addq.w	#1,d1
	dbra.w	d2,L00661e
	move.b	(a1),d0
	move.b	d0,d1
	lsr.b	#3,d0
	andi.b	#$07,d1
	move.b	d0,(a0)+
	move.b	d1,(a0)+
	move.b	($0002,a1),(a0)+
	move.b	($0004,a1),(a0)+
	move.b	($0007,a1),(a0)+
	move.b	($0008,a1),(a0)+
	move.b	($0005,a1),(a0)+
	move.b	($0006,a1),(a0)+
	move.b	($000a,a1),d0
	move.b	d0,d1
	rol.b	#1,d0
	andi.b	#$01,d0
	andi.b	#$7f,d1
	move.b	d0,(a0)+
	move.b	d1,(a0)+
	move.b	($0003,a1),(a0)+
	move.b	($0001,a1),(a0)+
	clr.b	(a0)+
	clr.b	(a0)+
	moveq.l	#$0a,d0
L00667c:
	clr.b	(a0)+
	dbra.w	d0,L00667c
L006682:
	movem.l	(sp)+,d0-d2/a0-a2
	rts

L006688:
	andi.w	#$0007,d1
	movem.l	d1-d2,-(sp)
	lea.l	(L0075b6),a1
	lsl.w	#3,d1
	move.w	d1,d2
	lsl.w	#1,d1
	add.w	d2,d1
	adda.w	d1,a1
	movem.l	(sp)+,d1-d2
	rts

L0066a6:
	andi.w	#$0007,d2
	movem.l	d1-d2,-(sp)
	lea.l	(L0075b6),a2
	lsl.w	#3,d2
	move.w	d2,d1
	lsl.w	#1,d2
	add.w	d1,d2
	adda.w	d2,a2
	movem.l	(sp)+,d1-d2
	rts

L0066c4:
	move.l	d1,-(sp)
	moveq.l	#$00,d1
	tst.b	d0
	bmi.s	L0066de
	moveq.l	#$01,d1
	cmpi.b	#$57,d0			;'W'
	bge.s	L0066de
	addq.b	#1,d1
	cmpi.b	#$29,d0			;')'
	ble.s	L0066de
	addq.b	#1,d1
L0066de:
	move.b	d1,(L007726)
	move.l	(sp)+,d1
	rts

L0066e8:
	movem.l	d0-d2/a0-a1,-(sp)
	tst.w	(L006bc6)
	bne.s	L006728
	lea.l	(L00d5e0),a0
	andi.l	#$000000ff,d0
	lsl.w	#3,d0
	adda.w	d0,a0
	moveq.l	#$00,d0
	moveq.l	#$00,d1
	move.w	(a0)+,d1
	beq.s	L006728
	move.w	(a0)+,d0
	tst.b	(L006bc2)
	bmi.s	L00671c
	move.b	(L006bc2),d0
L00671c:
	lsl.w	#8,d0
	move.b	(L007726),d0
	movea.l	(a0)+,a1
	bsr.s	L00672e
L006728:
	movem.l	(sp)+,d0-d2/a0-a1
	rts

L00672e:
	movem.l	d0-d3,-(sp)
	move.w	d0,d2
	move.l	d1,d3
	bsr.w	L006900
	tst.l	d0
	beq.s	L00674c
	tst.b	(L006bc3)
	bne.s	L006754
	moveq.l	#$00,d1
	bsr.w	L00690a
L00674c:
	move.w	d2,d1
	move.l	d3,d2
	bsr.w	L00694c
L006754:
	movem.l	(sp)+,d0-d3
	rts

L00675a:
	movem.l	d1-d5/a1-a6,-(sp)
	lea.l	(L007716),a2
	lea.l	(L00d5e0),a3
	cmpi.l	#$00007fff,d2
	bgt.w	L006822
	tst.l	($0008,a2)
	beq.w	L00682a
	cmp.l	($0008,a2),d2
	bgt.w	L006822
	move.l	d3,d0
	swap.w	d0
	tst.w	d0
	bmi.w	L006822
	cmpi.w	#$007f,d0
	bgt.w	L006822
	move.w	d0,d5
	lsl.w	#3,d0
	adda.w	d0,a3
	bsr.w	L0068f6
	move.w	(a3),d0
	beq.s	L0067ee
	andi.l	#$00007fff,d0
	movea.l	($0004,a3),a4
	movea.l	a4,a5
	adda.w	d0,a5
	movea.l	(a2),a6
	adda.l	($0008,a2),a6
L0067b8:
	move.b	(a5)+,(a4)+
	cmpa.l	a6,a5
	blt.s	L0067b8
	move.l	($0004,a3),d1
	lea.l	(L00d5e0),a4
	moveq.l	#$00,d4
L0067ca:
	tst.w	(a4)
	beq.s	L0067dc
	cmp.w	d5,d4
	beq.s	L0067dc
	cmp.l	($0004,a4),d1
	bge.s	L0067dc
	sub.l	d0,($0004,a4)
L0067dc:
	addq.l	#8,a4
	addq.w	#1,d4
	cmpi.w	#$0080,d4
	blt.s	L0067ca
	add.l	d0,($000c,a2)
	sub.l	d0,($0004,a2)
L0067ee:
	move.l	($000c,a2),d0
	cmp.l	d0,d2
	ble.s	L0067fe
	lsr.l	#1,d2
	cmp.l	d0,d2
	bgt.s	L006826
	move.l	d0,d2
L0067fe:
	sub.l	d2,($000c,a2)
	movea.l	($0004,a2),a4
	move.w	d2,(a3)
	move.w	d3,($0002,a3)
	move.l	a4,($0004,a3)
	subq.w	#1,d2
	bmi.s	L00681a
L006814:
	move.b	(a1)+,(a4)+
	dbra.w	d2,L006814
L00681a:
	move.l	a4,($0004,a2)
	clr.l	d0
	bra.s	L00682c

L006822:
	moveq.l	#$12,d0
	bra.s	L00682c

L006826:
	moveq.l	#$3c,d0			;'<'
	bra.s	L00682c

L00682a:
	moveq.l	#$3d,d0			;'='
L00682c:
	movem.l	(sp)+,d1-d5/a1-a6
	rts

L006832:
	lea.l	(L007728),a2
	move.w	#$00ff,d0
L00683c:
	move.b	(a1)+,(a2)+
	dbra.w	d0,L00683c
	clr.l	d0
	movem.l	(sp)+,d1-d5/a1-a6
	rts

L00684a:
	movem.l	d1-d4/a1,-(sp)
	andi.l	#$00000007,d3
	lsl.w	#8,d3
	move.b	#$03,d3
	move.l	#$00050000,d4
	moveq.l	#$00,d1
	bsr.w	L00690a
	move.b	#$04,($00e92001)
L00686e:
	subi.l	#$00000001,d4
	bmi.s	L00689c
	move.b	($00e92003),d0
	cmpi.b	#$f0,d0
	bcs.s	L00686e
	move.b	#$01,($00e92001)
	move.w	d3,d1
	bsr.w	L006a44
L006890:
	bsr.s	L006900
	bne.s	L006890
	moveq.l	#$00,d0
	movem.l	(sp)+,d1-d4/a1
	rts

L00689c:
	move.b	#$01,($00e92001)
	moveq.l	#$ff,d0
	movem.l	(sp)+,d1-d4/a1
	rts

L0068ac:
	movem.l	d0-d1/a0,-(sp)
	move.w	#$013f,d0
	move.l	#$20202020,d1		;'    '
	lea.l	(L00d0e0),a0
L0068c0:
	move.l	d1,(a0)+
	dbra.w	d0,L0068c0
	lea.l	(L00d5e0),a0
	move.l	(L007716),d0
	moveq.l	#$7f,d1
L0068d4:
	clr.w	(a0)+
	move.w	#$0004,(a0)+
	move.l	d0,(a0)+
	dbra.w	d1,L0068d4
	move.l	d0,(L00771a)
	move.l	(L00771e),(L007722)
	movem.l	(sp)+,d0-d1/a0
	rts

L0068f6:
	tst.b	($00000c32).l
	bne.s	L0068f6
	rts

L006900:
	moveq.l	#$00,d0
	move.b	($00000c32).l,d0
	rts

L00690a:
	tst.b	d1
	beq.s	L00691a
	subq.b	#1,d1
	beq.s	L006934
	subq.b	#1,d1
	beq.s	L006940
	moveq.l	#$ff,d0
	rts

L00691a:
	clr.b	($00000c32).l
	move.b	#$01,($00e92001)
	move.b	#$10,($00e840c7)
	moveq.l	#$00,d0
	rts

L006934:
	move.b	#$20,($00e840c7)	;' '
	moveq.l	#$00,d0
	rts

L006940:
	move.b	#$08,($00e840c7)
	moveq.l	#$00,d0
	rts

L00694c:
	tst.b	($00000c32).l
	bne.s	L00694c
	bsr.w	L006b52
	move.l	($000001a8).l,d0
	cmp.l	#L006b78,d0
	beq.s	L006976
	move.l	d0,(L006bc8)
	move.l	#L006b78,($000001a8).l
L006976:
	cmpi.l	#$0000ff00,d2
	bls.s	L006996
	move.l	d2,-(sp)
	move.l	#$0000ff00,d2
	move.b	#$80,d0
	bsr.s	L0069a0
	adda.l	d2,a1
	move.l	d2,d0
	move.l	(sp)+,d2
	sub.l	d0,d2
	bra.s	L006976

L006996:
	move.b	#$00,d0
	bsr.s	L0069a0
	moveq.l	#$00,d0
	rts

L0069a0:
	movem.l	d1,-(sp)
L0069a4:
	tst.b	($00000c32).l
	bne.s	L0069a4
	addq.b	#2,d0
	move.b	d0,($00000c32).l
	move.b	#$32,($00e840c5)	;'2'
	move.b	#$ff,($00e840c0)
	move.l	a1,($00e840cc)
	move.w	d2,($00e840ca)
	move.b	(L006bcc),d0
	ori.b	#$80,d0
	cmpi.w	#$0200,d1
	bcs.s	L0069e8
	subi.w	#$0200,d1
	andi.b	#$7f,d0
L0069e8:
	move.b	d0,(L006bcc)
	bsr.w	L006b48
	move.b	#$1b,($00e90001)
	bsr.w	L006b48
	move.b	d0,($00e90003)
	move.w	d1,d0
	andi.b	#$03,d0
	beq.s	L006a12
	cmpi.b	#$03,d0
	bne.s	L006a16
L006a12:
	eori.b	#$03,d0
L006a16:
	lsr.w	#8,d1
	asl.w	#2,d1
	or.b	d0,d1
	move.b	($00e9a005),d0
	andi.b	#$f0,d0
	or.b	d1,d0
	move.b	#$88,($00e840c7)
	move.b	d0,($00e9a005)
	move.b	#$02,($00e92001)
	movem.l	(sp)+,d1
	rts

L006a44:
	tst.b	($00000c32).l
	bne.s	L006a44
	bsr.w	L006b52
	move.l	($000001a8).l,d0
	cmp.l	#L006b78,d0
	beq.s	L006a6e
	move.l	d0,(L006bc8)
	move.l	#L006b78,($000001a8).l
L006a6e:
	movem.l	d1-d2/a1,-(sp)
L006a72:
	cmp.l	#$0000ff00,d2
	bcs.s	L006a98
	move.l	d2,-(sp)
	move.l	#$0000ff00,d2
	moveq.l	#$80,d0
	bsr.s	L006aa4
	adda.l	d2,a1
	move.l	d2,d0
	move.l	(sp)+,d2
	sub.l	d0,d2
	bne.s	L006a72
	movem.l	(sp)+,d1-d2/a1
	moveq.l	#$00,d0
	rts

L006a98:
	moveq.l	#$00,d0
	bsr.s	L006aa4
	movem.l	(sp)+,d1-d2/a1
	moveq.l	#$00,d0
	rts

L006aa4:
	tst.b	($00000c32).l
	bne.s	L006aa4
	addq.b	#4,d0
	move.b	d0,($00000c32).l
	move.b	#$b2,($00e840c5)
	bsr.s	L006ac8
	move.b	#$04,($00e92001)
	rts

L006ac8:
	move.b	#$ff,($00e840c0)
	move.l	a1,($00e840cc)
	move.w	d2,($00e840ca)
	move.w	d1,-(sp)
	move.b	(L006bcc),d0
	or.b	#$80,d0
	cmp.w	#$0200,d1
	bcs.s	L006af6
	sub.w	#$0200,d1
	and.b	#$7f,d0
L006af6:
	move.b	d0,(L006bcc)
	bsr.w	L006b48
	move.b	#$1b,($00e90001)
	bsr.w	L006b48
	move.b	d0,($00e90003)
	move.w	d1,d0
	and.b	#$03,d0
	beq.s	L006b20
	cmp.b	#$03,d0
	bne.s	L006b24
L006b20:
	eori.b	#$03,d0
L006b24:
	lsr.w	#8,d1
	asl.w	#2,d1
	or.b	d0,d1
	move.b	($00e9a005),d0
	and.b	#$f0,d0
	or.b	d1,d0
	move.w	(sp)+,d1
	move.b	#$88,($00e840c7)
	move.b	d0,($00e9a005)
	rts

L006b48:
	tst.b	($00e90003)
	bmi.s	L006b48
	rts

L006b52:
	tst.l	d1
	bmi.s	L006b70
	move.l	d1,-(sp)
	lsr.w	#7,d1
	andi.l	#$0000000e,d1
	move.l	(L006bce,pc,d1.w),d1
L006b64:
	moveq.l	#$34,d0			;'4'
L006b66:
	dbra.w	d0,L006b66
	dbra.w	d1,L006b64
	move.l	(sp)+,d1
L006b70:
	andi.l	#$00007fff,d1
	rts

L006b78:
	movem.l	d0-d1/a1,-(sp)
	move.b	($00000c32).l,d0
	clr.b	($00000c32).l
	btst.l	#$07,d0
	bne.s	L006bae
	move.b	#$01,($00e92001)
	clr.b	(L006bc3)
	clr.b	(L006bc7)
	move.l	(L006bc8),d0
	move.l	d0,($000001a8).l
L006bae:
	move.b	($00e840c0),d0
	move.b	#$ff,($00e840c0)
	movem.l	(sp)+,d0-d1/a1
	rte

L006bc2:
	.dc.b	$ff
L006bc3:
	.dc.b	$00
L006bc4:
	.dc.b	$00,$00
L006bc6:
	.dc.b	$00
L006bc7:
	.dc.b	$00
L006bc8:
	.dc.l	$00000000
L006bcc:
	.dc.b	$00,$00
L006bce:
	.dc.w	$0006,$0004,$0002,$0001,$0000,$0000,$0000,$0000
Start:
	lea.l	(StackTop),sp
	clr.l	-(sp)
	DOS	_SUPER
	addq.l	#4,sp
	addq.l	#1,a2
	movea.l	a2,a4
	bsr.w	L006da8
	bcs.w	L006cce
	bsr.w	L007236
	tst.b	(L00a82e)
	bne.w	L006d06
	tst.b	(L00a82d)
	bne.w	L006d72
	tst.b	(L00a82c)
	bne.w	L006ce6
	tst.l	d1
	bmi.w	L006cda
	bsr.w	L00715c
	tst.l	d1
	bmi.w	L006cda
	jsr	(L005b0a)
	movem.l	d1-d2,-(sp)
	bsr.w	L00729e
	moveq.l	#$0d,d1
	IOCS	_OPMDRV
	jsr	(L002748)
	move.w	(L007a3c),d2
	moveq.l	#$2b,d1			;'+'
	IOCS	_OPMDRV
	moveq.l	#$00,d1
	IOCS	_OPMDRV
	tst.w	(L007a0e)
	bne.s	L006cb6
	pea.l	(L00a251)
	DOS	_PRINT
	addq.l	#4,sp
	tst.b	(L0074c8)
	bne.s	L006c84
	pea.l	(L00a2a4)
	DOS	_PRINT
	addq.l	#4,sp
	pea.l	(L00a378)
	DOS	_PRINT
	addq.l	#4,sp
	bra.s	L006c98

L006c84:
	pea.l	(L00a314)
	DOS	_PRINT
	addq.l	#4,sp
	pea.l	(L00a378)
	DOS	_PRINT
	addq.l	#4,sp
L006c98:
	tst.l	(L00771e)
	beq.s	L006cac
	pea.l	(L00a3a8)
	DOS	_PRINT
	addq.l	#4,sp
	bra.s	L006cb6

L006cac:
	pea.l	(L00a3d8)
	DOS	_PRINT
	addq.l	#4,sp
L006cb6:
	bsr.w	L0073ec
	bsr.w	L00742a
	movem.l	(sp)+,d1-d2
	sub.l	#OPMStruct,d1
	clr.w	-(sp)
	move.l	d1,-(sp)
	DOS	_KEEPPR

L006cce:
	pea.l	(L00a3f3)
	DOS	_PRINT
	addq.l	#4,sp
	DOS	_EXIT

L006cda:
	pea.l	(L00a60f)
	DOS	_PRINT
	addq.l	#4,sp
	DOS	_EXIT

L006ce6:
	cmpi.b	#$01,(L00a82c)
	beq.s	L006d5a
	cmpi.b	#$02,(L00a82c)
	beq.s	L006d4e
	pea.l	(L00a634)
	DOS	_PRINT
	addq.l	#4,sp
	DOS	_EXIT

L006d06:
	cmpi.b	#$03,(L00a82c)
	bne.s	L006d66
	cmpi.b	#$01,(L00a82e)
	bne.s	L006d34
	moveq.l	#$1d,d1
	IOCS	_OPMDRV
	moveq.l	#$00,d2
	moveq.l	#$0b,d1
	IOCS	_OPMDRV
	pea.l	(L00a6a1)
	DOS	_PRINT
	addq.l	#4,sp
	DOS	_EXIT

L006d34:
	moveq.l	#$00,d2
	moveq.l	#$0a,d1
	IOCS	_OPMDRV
	moveq.l	#$1e,d1
	IOCS	_OPMDRV
	pea.l	(L00a6ce)
	DOS	_PRINT
	addq.l	#4,sp
	DOS	_EXIT

L006d4e:
	pea.l	(L00a6fb)
	DOS	_PRINT
	addq.l	#4,sp
	DOS	_EXIT

L006d5a:
	pea.l	(L00a73c)
	DOS	_PRINT
	addq.l	#4,sp
	DOS	_EXIT

L006d66:
	pea.l	(L00a77d)
	DOS	_PRINT
	addq.l	#4,sp
	DOS	_EXIT

L006d72:
	cmpi.b	#$03,(L00a82c)
	bne.s	L006d66
	bsr.w	L007308
	bmi.s	L006d90
	bne.s	L006d9c
	pea.l	(L00a79e)
	DOS	_PRINT
	addq.l	#4,sp
	DOS	_EXIT

L006d90:
	pea.l	(L00a7b9)
	DOS	_PRINT
	addq.l	#4,sp
	DOS	_EXIT

L006d9c:
	pea.l	(L00a7e5)
	DOS	_PRINT
	addq.l	#4,sp
	DOS	_EXIT

L006da8:
	moveq.l	#$00,d1
	moveq.l	#$ff,d4
L006dac:
	move.b	(a4)+,d0
	beq.w	L006f58
	cmp.b	#$20,d0			;' '
	beq.s	L006dac
	cmp.b	#$2d,d0			;'-'
	beq.s	L006e2e
	cmp.b	#$2f,d0			;'/'
	beq.s	L006e2e
	cmp.b	#$23,d0			;'#'
	beq.s	L006e02
	ori.b	#$20,d0
	cmp.b	#$6f,d0			;'o'
	bne.s	L006dac
	move.b	(a4)+,d0
	beq.w	L006f58
	ori.b	#$20,d0
	cmpi.b	#$6e,d0			;'n'
	beq.s	L006df6
	cmpi.b	#$66,d0			;'f'
	bne.s	L006dac
	move.b	#$02,(L00a82e)
	bra.w	L006f58

L006df6:
	move.b	#$01,(L00a82e)
	bra.w	L006f58

L006e02:
	moveq.l	#$00,d1
L006e04:
	move.b	(a4)+,d0
	beq.w	L006f58
	cmp.b	#$20,d0			;' '
	beq.s	L006dac
	cmp.b	#$30,d0			;'0'
	bcs.s	L006dac
	cmp.b	#$3a,d0			;':'
	bcc.s	L006dac
	and.l	#$0000000f,d0
	add.l	d1,d1
	move.l	d1,d3
	asl.l	#2,d1
	add.l	d3,d1
	add.l	d0,d1
	bra.s	L006e04

L006e2e:
	move.b	(a4)+,d0
	beq.w	L006f58
	cmp.b	#$20,d0			;' '
	beq.w	L006dac
	ori.b	#$20,d0
	cmp.b	#$72,d0			;'r'
	beq.w	L006f50
	cmp.b	#$61,d0			;'a'
	beq.w	L006f44
	cmp.b	#$66,d0			;'f'
	beq.w	L006f04
	cmp.b	#$63,d0			;'c'
	bne.s	L006e6a
	move.w	#$0001,(L007a0e)
	bra.w	L006dac

L006e6a:
	cmp.b	#$79,d0			;'y'
	bne.s	L006e82
	cmpi.b	#$30,(a4)		;'0'
	bne.w	L006dac
	clr.w	(L007a10)
	bra.w	L006dac

L006e82:
	cmp.b	#$3f,d0			;'?'
	beq.w	L006f5e
	cmp.b	#$70,d0			;'p'
	bne.s	L006ec8
	cmpi.b	#$4d,(a4)		;'M'
	bgt.s	L006ec8
	moveq.l	#$00,d4
L006e98:
	move.b	(a4)+,d0
	beq.w	L006f58
	cmp.b	#$20,d0			;' '
	beq.w	L006dac
	cmp.b	#$30,d0			;'0'
	bcs.w	L006dac
	cmp.b	#$3a,d0			;':'
	bcc.w	L006dac
	and.l	#$0000000f,d0
	add.l	d4,d4
	move.l	d4,d3
	asl.l	#2,d4
	add.l	d3,d4
	add.l	d0,d4
	bra.s	L006e98

L006ec8:
	lsl.l	#8,d0
	move.b	(a4)+,d0
	beq.w	L006f58
	lsl.l	#8,d0
	move.b	(a4)+,d0
	beq.w	L006f58
	lsl.l	#8,d0
	ori.l	#$20202000,d0
	clr.b	d0
	lea.l	(L007a3e),a0
	moveq.l	#$00,d2
	moveq.l	#$05,d3
L006eec:
	cmp.l	(a0)+,d0
	beq.s	L006efa
	addq.l	#1,d2
	dbra.w	d3,L006eec
	bra.w	L006dac

L006efa:
	move.w	d2,(L007a3c)
	bra.w	L006dac

L006f04:
	moveq.l	#$00,d2
L006f06:
	move.b	(a4)+,d0
	beq.s	L006f2e
	cmp.b	#$20,d0			;' '
	beq.s	L006f2e
	cmp.b	#$30,d0			;'0'
	bcs.s	L006f2e
	cmp.b	#$3a,d0			;':'
	bcc.s	L006f2e
	and.l	#$0000000f,d0
	add.l	d2,d2
	move.l	d2,d3
	asl.l	#2,d2
	add.l	d3,d2
	add.l	d0,d2
	bra.s	L006f06

L006f2e:
	cmp.l	#$00000040,d2
	bge.s	L006f3c
	move.b	d2,(L006bc4)
L006f3c:
	tst.b	d0
	bne.w	L006dac
	bra.s	L006f58

L006f44:
	move.b	#$01,(L007a12)
	bra.w	L006dac

L006f50:
	move.b	#$01,(L00a82d)
L006f58:
	andi.b	#$fe,ccr
	rts

L006f5e:
	ori.b	#$01,ccr
	rts

L006f64:
	movem.l	d1-d7/a0-a6,-(sp)
	jsr	(L005b0a)
	movea.l	($0012,a5),a4
	bsr.w	L007020
	bsr.w	L00715c
	bcs.w	L007016
	move.l	d1,($000e,a5)
	moveq.l	#$0d,d1
	IOCS	_OPMDRV
	jsr	(L002748)
	move.w	(L007a3c),d2
	moveq.l	#$2b,d1			;'+'
	IOCS	_OPMDRV
	moveq.l	#$00,d2
	moveq.l	#$00,d1
	IOCS	_OPMDRV
	tst.w	(L007a0e)
	bne.s	L007004
	pea.l	(L00a251)
	DOS	_PRINT
	addq.l	#4,sp
	tst.b	(L0074c8)
	bne.s	L006fd2
	pea.l	(L00a2a4)
	DOS	_PRINT
	addq.l	#4,sp
	pea.l	(L00a378)
	DOS	_PRINT
	addq.l	#4,sp
	bra.s	L006fe6

L006fd2:
	pea.l	(L00a314)
	DOS	_PRINT
	addq.l	#4,sp
	pea.l	(L00a378)
	DOS	_PRINT
	addq.l	#4,sp
L006fe6:
	tst.l	(L00771e)
	beq.s	L006ffa
	pea.l	(L00a3a8)
	DOS	_PRINT
	addq.l	#4,sp
	bra.s	L007004

L006ffa:
	pea.l	(L00a3d8)
	DOS	_PRINT
	addq.l	#4,sp
L007004:
	bsr.w	L0073ec
	bsr.w	L00742a
	movem.l	(sp)+,d1-d7/a0-a6
	jmp	(L000220)

L007016:
	movem.l	(sp)+,d1-d7/a0-a6
	jmp	(L00021a)

L007020:
	moveq.l	#$00,d1
	moveq.l	#$ff,d4
L007024:
	move.b	(a4)+,d0
	bne.s	L007024
	bra.s	L00702e

L00702a:
	move.b	(a4)+,d0
	bne.s	L007034
L00702e:
	move.b	(a4)+,d0
	beq.w	L00715a
L007034:
	cmp.b	#$2f,d0			;'/'
	beq.s	L00706a
	cmp.b	#$2d,d0			;'-'
	beq.s	L00706a
	cmp.b	#$23,d0			;'#'
	bne.s	L00702a
	moveq.l	#$00,d1
L007048:
	move.b	(a4)+,d0
	beq.s	L00702e
	cmp.b	#$30,d0			;'0'
	bcs.s	L007024
	cmp.b	#$3a,d0			;':'
	bcc.s	L007024
	and.l	#$0000000f,d0
	add.l	d1,d1
	move.l	d1,d3
	asl.l	#2,d1
	add.l	d3,d1
	add.l	d0,d1
	bra.s	L007048

L00706a:
	move.b	(a4)+,d0
	beq.s	L00702e
	ori.b	#$20,d0
	cmp.b	#$63,d0			;'c'
	bne.s	L007082
	move.w	#$0001,(L007a0e)
	bra.s	L007024

L007082:
	cmp.b	#$61,d0			;'a'
	beq.w	L00714e
	cmp.b	#$66,d0			;'f'
	beq.w	L007112
	cmp.b	#$79,d0			;'y'
	bne.s	L0070ac
	move.b	(a4)+,d0
	beq.s	L00702e
	cmp.b	#$30,d0			;'0'
	bne.s	L007024
	clr.w	(L007a10)
	bra.w	L007024

L0070ac:
	cmp.b	#$70,d0			;'p'
	bne.s	L0070e2
	cmpi.b	#$4d,(a4)		;'M'
	bgt.s	L0070e2
	moveq.l	#$00,d4
L0070ba:
	move.b	(a4)+,d0
	beq.w	L00702e
	cmp.b	#$30,d0			;'0'
	bcs.w	L007024
	cmp.b	#$3a,d0			;':'
	bcc.w	L007024
	and.l	#$0000000f,d0
	add.l	d4,d4
	move.l	d4,d3
	asl.l	#2,d4
	add.l	d3,d4
	add.l	d0,d4
	bra.s	L0070ba

L0070e2:
	lsl.l	#8,d0
	move.b	(a4)+,d0
	beq.w	L00702e
	ori.w	#$2020,d0
	lea.l	(L007a3e),a0
	moveq.l	#$00,d2
	moveq.l	#$05,d3
L0070f8:
	cmp.w	(a0)+,d0
	beq.s	L007108
	addq.l	#1,d2
	addq.l	#2,a0
	dbra.w	d3,L0070f8
	bra.w	L007024

L007108:
	move.w	d2,(L007a3c)
	bra.w	L007024

L007112:
	moveq.l	#$00,d2
L007114:
	move.b	(a4)+,d0
	beq.s	L00713a
	cmp.b	#$30,d0			;'0'
	bcs.w	L007024
	cmp.b	#$3a,d0			;':'
	bcc.w	L007024
	and.l	#$0000000f,d0
	add.l	d2,d2
	move.l	d2,d3
	asl.l	#2,d2
	add.l	d3,d2
	add.l	d0,d2
	bra.s	L007114

L00713a:
	cmp.l	#$00000040,d2
	bge.w	L00702e
	move.b	d2,(L006bc4)
	bra.w	L00702e

L00714e:
	move.b	#$01,(L007a12)
	bra.w	L007024

L00715a:
	rts

L00715c:
	movem.l	d0-d4/a1,-(sp)
	move.l	#$000001f0,d1
	lea.l	(L0013ac),a1
	IOCS	_B_INTVCS
	move.l	d0,(L0074bc)
	move.l	#$000001f3,d1
	lea.l	(L001380),a1
	IOCS	_B_INTVCS
	move.l	d0,(L0074b4)
	movem.l	(sp)+,d0-d4/a1
	move.l	($00001c00).l,d0
	sub.l	#L00e784,d0
	sub.l	#$00020000,d0
	bpl.s	L0071ac
	moveq.l	#$ff,d1
	ori.b	#$01,ccr
	rts

L0071ac:
	lsr.l	#8,d0
	lsr.l	#2,d0
	bsr.w	L00739a
	pea.l	(L00a38a)
	move.l	d1,-(sp)
	move.w	#$0004,-(sp)
	bsr.w	L007450
	lea.l	($000a,sp),sp
	pea.l	(L00a3ba)
	move.l	d4,-(sp)
	move.w	#$0004,-(sp)
	bsr.w	L007450
	lea.l	($000a,sp),sp
	asl.l	#8,d4
	asl.l	#2,d4
	asl.l	#8,d1
	asl.l	#2,d1
	move.l	#L00e784,d0
	move.l	d1,(L007a20)
	move.l	d0,(L007a1c)
	move.l	d0,(L007848)
	move.l	d0,(L00784c)
	move.l	d0,(L00783c)
	add.l	d0,d1
	addi.l	#$00000018,d1
	move.l	d1,(L007716)
	move.l	d1,(L00771a)
	move.l	d4,(L00771e)
	move.l	d4,(L007722)
	add.l	d4,d1
	jsr	(L0068ac)
	andi.b	#$01,ccr
	rts

L007236:
	movem.l	d0-d1,-(sp)
	clr.w	-(sp)
	pea.l	(L00a840)
	DOS	_OPEN
	addq.l	#6,sp
	move.l	d0,d1
	bmi.s	L00725a
	move.w	d1,-(sp)
	DOS	_CLOSE
	addq.l	#2,sp
	move.b	#$03,(L00a82c)
	bra.s	L007298

L00725a:
	clr.w	-(sp)
	pea.l	(L00a846)
	DOS	_OPEN
	addq.l	#6,sp
	move.l	d0,d1
	bmi.s	L00727a
	move.w	d1,-(sp)
	DOS	_CLOSE
	addq.l	#2,sp
	move.b	#$02,(L00a82c)
	bra.s	L007298

L00727a:
	clr.w	-(sp)
	pea.l	(L00a84a)
	DOS	_OPEN
	addq.l	#6,sp
	move.l	d0,d1
	bmi.s	L007298
	move.w	d1,-(sp)
	DOS	_CLOSE
	addq.l	#2,sp
	move.b	#$01,(L00a82c)
L007298:
	movem.l	(sp)+,d0-d1
	rts

L00729e:
	movem.l	d0-d1/a0-a1,-(sp)
	lea.l	($00006800).l,a0
L0072a8:
	lea.l	(L00a838),a1
	moveq.l	#$06,d1
	bsr.s	L0072e4
	cmpa.l	#L00a838,a0
	beq.s	L0072de
	cmpi.w	#$8024,(-$0012,a0)
	bne.s	L0072a8
	lea.l	(-$0016,a0),a0
L0072c6:
	movea.l	a0,a1
	movea.l	(a1),a0
	cmpa.l	#$ffffffff,a0
	bne.s	L0072c6
	move.l	#OPMStruct,(a1)
	move.l	a1,(L0074b8)
L0072de:
	movem.l	(sp)+,d0-d1/a0-a1
	rts

L0072e4:
	move.b	(a1)+,d0
L0072e6:
	cmp.b	(a0)+,d0
	bne.s	L0072e6
	movem.l	d1/a0-a1,-(sp)
L0072ee:
	move.b	(a1)+,d0
	cmp.b	(a0)+,d0
	bne.s	L0072fe
	dbra.w	d1,L0072ee
	lea.l	($000c,sp),sp
	rts

L0072fe:
	movem.l	(sp)+,d1/a0-a1
	move.b	(-$0001,a1),d0
	bra.s	L0072e6

L007308:
	movem.l	d1-d2/a0-a2,-(sp)
	moveq.l	#$5f,d1			;'_'
	IOCS	_OPMDRV
	tst.l	d0
	bmi.s	L007394
	movea.l	d0,a2
	movea.l	(a2),a1
	move.l	(a1),d0
	movea.l	d0,a0
	add.l	#$00000500,d0
L007324:
	cmpi.l	#$50434d20,(a0)		;'PCM '
	beq.s	L007332
	addq.l	#2,a0
	cmp.l	a0,d0
	bcc.s	L007324
L007332:
	cmpi.l	#$ffffffff,(-$000e,a0)
	bne.s	L007392
	move.l	(a1),d1
	move.l	d1,d2
	move.l	#$ffffffff,(a1)
	sub.l	#$000000f0,d1
	move.l	d1,-(sp)
	DOS	_MFREE
	lea.l	($0004,sp),sp
	movea.l	d2,a1
	add.l	#$00000100,d2
L00735c:
	cmpi.l	#$4f504d20,(a1)		;'OPM '
	beq.s	L00736c
	addq.l	#2,a1
	cmp.l	a1,d2
	bcc.s	L00735c
	bra.s	L007372

L00736c:
	move.l	#$4e554c20,(a1)		;'NUL '
L007372:
	move.l	#$000001f0,d1
	movea.l	($0004,a2),a1
	IOCS	_B_INTVCS
	move.l	#$000001f3,d1
	movea.l	(-$0004,a2),a1
	IOCS	_B_INTVCS
	moveq.l	#$00,d0
	bra.s	L007394

L007392:
	moveq.l	#$01,d0
L007394:
	movem.l	(sp)+,d1-d2/a0-a2
	rts

L00739a:
	movem.l	d0/d2,-(sp)
	cmpi.l	#$00000018,d1
	bge.s	L0073aa
	moveq.l	#$40,d1			;'@'
	bra.s	L0073be

L0073aa:
	cmp.l	d0,d1
	blt.s	L0073b0
	move.l	d0,d1
L0073b0:
	cmpi.l	#$00001000,d1
	ble.s	L0073be
	move.l	#$00001000,d1
L0073be:
	tst.l	d4
	bpl.s	L0073c4
	moveq.l	#$18,d4
L0073c4:
	cmpi.l	#$00001000,d4
	blt.s	L0073d2
	move.l	#$00001000,d4
L0073d2:
	move.l	d0,d2
	sub.l	d1,d2
	bpl.s	L0073de
	clr.l	d4
	move.l	d0,d1
	bra.s	L0073e6

L0073de:
	move.l	d2,d0
	sub.l	d4,d2
	bpl.s	L0073e6
	move.l	d0,d4
L0073e6:
	movem.l	(sp)+,d0/d2
	rts

L0073ec:
	movem.l	d0-d1/a0,-(sp)
	lea.l	(L00d0e0),a0
	move.l	#$20202020,d0		;'    '
	move.w	#$013f,d1
L007400:
	move.l	d0,(a0)+
	dbra.w	d1,L007400
	lea.l	(L00d9e0),a0
	move.l	#$01000004,(a0)+
	move.l	#L007728,(a0)+
	move.l	#$01000003,(a0)+
	move.l	#L007728,(a0)+
	movem.l	(sp)+,d0-d1/a0
	rts

L00742a:
	movem.l	d0-d1/a0-a2,-(sp)
	lea.l	(EmptyVoice),a0
	lea.l	($0037,a0),a1
	move.w	#$0082,d0
L00743c:
	moveq.l	#$36,d1			;'6'
	movea.l	a0,a2
L007440:
	move.b	(a2)+,(a1)+
	dbra.w	d1,L007440
	dbra.w	d0,L00743c
	movem.l	(sp)+,d0-d1/a0-a2
	rts

L007450:
	link.w	a6,#$0000
	movem.l	d1-d6/a0-a1,-(sp)
	movea.l	($000e,a6),a0
	move.w	($0008,a6),d3
	move.l	($000a,a6),d4
	lea.l	(L00a84e),a1
	moveq.l	#$0a,d2
	sub.w	d3,d2
	bpl.s	L007474
	clr.w	d2
	moveq.l	#$0a,d3
L007474:
	lsl.w	#2,d2
	adda.l	d2,a1
	subq.w	#1,d3
	clr.w	d5
L00747c:
	moveq.l	#$00,d2
	move.l	(a1)+,d1
L007480:
	or.l	d1,d1
	sub.l	d1,d4
	bcs.s	L00748a
	addq.b	#1,d2
	bra.s	L007480

L00748a:
	tst.b	d2
	beq.s	L007494
	move.w	#$0001,d5
	bra.s	L0074a0

L007494:
	tst.w	d3
	beq.s	L0074a0
	tst.w	d5
	bne.s	L0074a0
	move.b	#-$10,d2
L0074a0:
	add.l	d1,d4
	addi.b	#$30,d2			;'0'
	move.b	d2,(a0)+
	dbra.w	d3,L00747c
	movem.l	(sp)+,d1-d6/a0-a1
	unlk	a6
	rts


	.data

L0074b4:
	.dc.l	$00000000
L0074b8:
	.dc.l	$00000000
L0074bc:
	.dc.l	$00000000
L0074c0:
	.dc.l	$10920303,$00000000
L0074c8:
	.dc.b	$00,$00
L0074ca:
	.dc.l	L0056dc
	.dc.l	L00572a
	.dc.l	L00580e
	.dc.l	L0058b6
	.dc.l	L0058c6
	.dc.l	L0058d0
	.dc.l	L0059a2
	.dc.l	L0059ac
	.dc.l	L005ae6
L0074ee:
	.dc.w	$0080,$0082,$0084,$0086,$0088,$008a,$008c,$008e
	.dc.w	$0090
L007500:
	.dc.l	$00000000,$00000000,$00000000,$00000000
	.dc.l	$00000000,$00000000,$00000000,$00000000
	.dc.l	$00000000
	.dc.l	L005afe
	.dc.l	L005afe
	.dc.l	L005afe
	.dc.l	L005afe
	.dc.l	L005afe
	.dc.l	L005afe
	.dc.l	L005afe
	.dc.l	$00000000,$00000000,$00000000,$00000000
L007550:
	.dc.w	$0078
L007552:
	.dc.b	$03
L007553:
	.dc.b	$00
L007554:
	.dc.b	$00
L007555:
	.dc.b	$7f
L007556:
	.dc.b	$00
L007557:
	.dc.b	$01
L007558:
	.dc.b	$00
L007559:
	.dc.b	$01
L00755a:
	.dc.b	$00
L00755b:
	.dc.b	$00
L00755c:
	.dc.b	$00
L00755d:
	.dc.b	$0a,$00,$00,$00,$00,$00
L007563:
	.dc.b	$00
L007564:
	.dc.b	$00,$00
L007566:
	.dc.w	$0004,$0000,$0000
L00756c:
	.dc.w	$0000,$0001,$0000
L007572:
	.dc.w	$0000,$0000,$03e8
L007578:
	.dc.l	$00000000
L00757c:
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
L007586:
	.dc.b	$3f,$33,$29,$21,$1b,$16,$12,$0f,$0c,$09,$07,$05,$03,$02,$01,$00
L007596:
	.dc.b	$3f,$39,$35,$31,$2e,$2b,$28,$25,$22,$1f,$1c,$1a,$18,$16,$14,$12
	.dc.b	$10,$0e,$0d,$0c,$0b,$0a,$09,$08,$07,$06,$05,$04,$03,$02,$01,$00
L0075b6:
	.dc.b	$01,$01,$01,$01,$78,$00,$00,$00,$00,$00,$c0,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00
	.dc.l	APianoData2
	.dc.b	$01,$01,$01,$01,$78,$00,$00,$00,$00,$00,$c0,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00
	.dc.l	APianoData2
	.dc.b	$01,$01,$01,$01,$78,$00,$00,$00,$00,$00,$c0,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00
	.dc.l	APianoData2
	.dc.b	$01,$01,$01,$01,$78,$00,$00,$00,$00,$00,$c0,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00
	.dc.l	APianoData2
	.dc.b	$01,$01,$01,$01,$78,$00,$00,$00,$00,$00,$c0,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00
	.dc.l	APianoData2
	.dc.b	$01,$01,$01,$01,$78,$00,$00,$00,$00,$00,$c0,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00
	.dc.l	APianoData2
	.dc.b	$01,$01,$01,$01,$78,$00,$00,$00,$00,$00,$c0,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00
	.dc.l	APianoData2
	.dc.b	$01,$01,$01,$01,$78,$00,$00,$00,$00,$00,$c0,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00
	.dc.l	APianoData2
L007676:
	.dc.b	$00,$00,$00,$01,$00,$00,$00,$01,$00,$00,$00,$01,$00,$00,$00,$01
	.dc.b	$00,$01,$00,$01,$00,$01,$01,$01,$00,$01,$01,$01,$01,$01,$01,$01
L007696:
	.dc.b	$0c,$0d,$0e,$00,$01,$02,$04,$05,$06,$08,$09,$0a,$0c,$0d,$0e,$00
	.dc.b	$01,$02,$04,$05,$06,$08,$09,$0a,$0c,$0d,$0e,$10,$11,$12,$14,$15
	.dc.b	$16,$18,$19,$1a,$1c,$1d,$1e,$20,$21,$22,$24,$25,$26,$28,$29,$2a
	.dc.b	$2c,$2d,$2e,$30,$31,$32,$34,$35,$36,$38,$39,$3a,$3c,$3d,$3e,$40
	.dc.b	$41,$42,$44,$45,$46,$48,$49,$4a,$4c,$4d,$4e,$50,$51,$52,$54,$55
	.dc.b	$56,$58,$59,$5a,$5c,$5d,$5e,$60,$61,$62,$64,$65,$66,$68,$69,$6a
	.dc.b	$6c,$6d,$6e,$70,$71,$72,$74,$75,$76,$78,$79,$7a,$7c,$7d,$7e,$70
	.dc.b	$71,$72,$74,$75,$76,$78,$79,$7a,$7c,$7d,$7e,$70,$71,$72,$74,$75
L007716:
	.dc.l	$00000000
L00771a:
	.dc.l	$00000000
L00771e:
	.dc.l	$00000000
L007722:
	.dc.l	$00000000
L007726:
	.dc.b	$03,$00
L007728:
	.dc.b	$80,$f4,$80,$91,$a4,$bd,$17,$c0,$30,$19,$ba,$4a,$22,$f8,$a4,$82
	.dc.b	$1f,$80,$00,$01,$2f,$35,$af,$41,$a8,$b8,$71,$d0,$30,$a9,$50,$0b
	.dc.b	$99,$0d,$f4,$2a,$30,$00,$98,$05,$0e,$11,$aa,$11,$0a,$42,$ca,$00
	.dc.b	$24,$cb,$38,$01,$e1,$08,$99,$33,$a0,$40,$0b,$85,$9e,$85,$8b,$88
	.dc.b	$43,$ca,$32,$8a,$03,$1e,$a3,$8c,$83,$8b,$06,$89,$91,$38,$9a,$41
	.dc.b	$aa,$88,$21,$80,$b4,$b8,$0e,$7a,$91,$9b,$72,$c2,$29,$a8,$19,$01
	.dc.b	$00,$23,$ad,$13,$bb,$08,$93,$1e,$24,$8b,$04,$bb,$03,$91,$9f,$03
	.dc.b	$90,$29,$01,$a1,$71,$0a,$a9,$3c,$94,$99,$17,$8c,$82,$aa,$1c,$14
	.dc.b	$09,$18,$11,$a0,$4a,$b1,$90,$6a,$d8,$89,$33,$e9,$01,$2b,$35,$ac
	.dc.b	$00,$92,$10,$88,$b3,$a0,$58,$d9,$1d,$02,$10,$90,$25,$8e,$92,$99
	.dc.b	$08,$18,$48,$81,$0f,$80,$11,$01,$8a,$62,$a9,$0c,$08,$31,$80,$d0
	.dc.b	$1a,$b4,$0c,$00,$17,$3b,$a3,$8a,$d0,$38,$81,$cb,$48,$03,$ac,$08
	.dc.b	$78,$89,$19,$89,$33,$b2,$91,$18,$20,$ed,$2b,$5b,$93,$38,$c9,$29
	.dc.b	$c3,$18,$aa,$43,$80,$42,$a0,$ae,$68,$a8,$5b,$a2,$92,$a0,$b1,$1b
	.dc.b	$b4,$7a,$89,$23,$9d,$83,$1b,$a4,$31,$d8,$11,$db,$24,$99,$01,$28
	.dc.b	$98,$cf,$90,$30,$86,$29,$91,$80,$e8,$82,$9b,$05,$3b,$a1,$10,$21
L007828:
	.dc.b	$00,$04,$00,$04
L00782c:
	.dc.w	$0000
L00782e:
	.dc.w	$0000
L007830:
	.dc.l	$00040004
L007834:
	.dc.w	$00c0
L007836:
	.dc.w	$0030
L007838:
	.dc.w	$00c0
L00783a:
	.dc.w	$0000
L00783c:
	.dc.l	$00000000
L007840:
	.dc.l	$00000000
L007844:
	.dc.l	$00000000
L007848:
	.dc.l	$00000000
L00784c:
	.dc.l	$00000000
L007850:
	.dc.w	$0000
L007852:
	.dc.b	$00
L007853:
	.dc.b	$00
L007854:
	.dc.w	$0000
L007856:
	.dc.l	L007882
	.dc.l	L007887
	.dc.l	L00788c
	.dc.l	L007892
	.dc.l	L007894
	.dc.l	L00789b
	.dc.l	L00789d
	.dc.l	L0078a2
	.dc.l	L0078a4
	.dc.l	L0078a9
	.dc.l	L0078ac
L007882:
	.dc.b	'D.C.',$00
L007887:
	.dc.b	'D.S.',$00
L00788c:
	.dc.b	'SEGNO',$00
L007892:
	.dc.b	'$',$00
L007894:
	.dc.b	'TOCODA',$00
L00789b:
	.dc.b	'*',$00
L00789d:
	.dc.b	'FINE',$00
L0078a2:
	.dc.b	'^',$00
L0078a4:
	.dc.b	'CODA',$00
L0078a9:
	.dc.b	'DO',$00
L0078ac:
	.dc.b	'LOOP',$00,$00
L0078b2:
	.dc.l	$00000000
L0078b6:
	.dc.l	$00000000
L0078ba:
	.dc.l	$00000000
L0078be:
	.dc.l	$00000000
L0078c2:
	.dc.l	$00000000
L0078c6:
	.ds.b	320
L007a06:
	.dc.w	$0000,$0000
L007a0a:
	.dc.w	$7fff
L007a0c:
	.dc.w	$0000
L007a0e:
	.dc.w	$0000
L007a10:
	.dc.w	$0001
L007a12:
	.dc.b	$00,$00
L007a14:
	.dc.b	$00,$00,$00,$00,$00,$00
L007a1a:
	.dc.b	$00,$00
L007a1c:
	.dc.l	$00000000
L007a20:
	.dc.l	$00010000
L007a24:
	.dc.l	$00000000
L007a28:
	.dc.l	$00000000,$00000000
L007a30:
	.dc.w	$0000,$0000
L007a34:
	.dc.w	$0001
L007a36:
	.dc.b	$c6
L007a37:
	.dc.b	$40
L007a38:
	.dc.b	$00
L007a39:
	.dc.b	$00
L007a3a:
	.dc.b	$00,$00
L007a3c:
	.dc.w	$0000
L007a3e:
	.dc.b	'opm',$00
L007a42:
	.dc.b	'omp',$00
L007a46:
	.dc.b	'mop',$00
L007a4a:
	.dc.b	'mpo',$00
L007a4e:
	.dc.b	'pom',$00
L007a52:
	.dc.b	'pmo',$00
APianoStr1:
	.dc.b	'*A.ﾋﾟｱﾉ   '
HPianoStr1:
	.dc.b	'*H.ﾋﾟｱﾉ   '
EPianoStr1:
	.dc.b	'*E.ﾋﾟｱﾉ   '
ClavinetStr1:
	.dc.b	'*ｸﾗﾋﾞﾈｯﾄ  '
CelestaStr1:
	.dc.b	'*ｾﾚｽﾀ     '
HarpsichordStr1:
	.dc.b	'*ﾁｪﾝﾊﾞﾛ   '
AGuitarStr1:
	.dc.b	'*A.ｷﾞﾀｰ   '
EGuitarStr1:
	.dc.b	'*E.ｷﾞﾀｰ   '
WoodbassStr1:
	.dc.b	'*ｳｯﾄﾞﾍﾞｰｽ '
EBassStr1:
	.dc.b	'*E.ﾍﾞｰｽ   '
BanjoStr1:
	.dc.b	'*ﾊﾞﾝｼﾞｮｰ  '
SitarStr1:
	.dc.b	'*ｼﾀｰﾙ     '
HarpStr1:
	.dc.b	'*ﾊｰﾌﾟ     '
KotoStr1:
	.dc.b	'*ｺﾄ       '
POrgan1Str1:
	.dc.b	'*P.ｵﾙｶﾞﾝ1 '
POrgan2Str1:
	.dc.b	'*P.ｵﾙｶﾞﾝ2 '
EOrganStr1:
	.dc.b	'*E.ｵﾙｶﾞﾝ  '
AccordionStr1:
	.dc.b	'*ｱｺｰﾃﾞｨｵﾝ '
ViolinStr1:
	.dc.b	'*ﾊﾞｲｵﾘﾝ   '
CelloStr1:
	.dc.b	'*ﾁｪﾛ      '
Strings1Str1:
	.dc.b	'*ｽﾄﾘﾝｸﾞｽ1 '
Strings2Str1:
	.dc.b	'*ｽﾄﾘﾝｸﾞｽ2 '
PizzicatoStr1:
	.dc.b	'*ﾋﾟﾁｶｰﾄ   '
VoiceStr1:
	.dc.b	'*ﾎﾞｲｽ     '
ChorusStr1:
	.dc.b	'*ｺｰﾗｽ     '
GrassharpStr1:
	.dc.b	'*ｸﾞﾗｽﾊｰﾌﾟ '
WhistleStr1:
	.dc.b	'*ﾎｲｯｽﾙ    '
PiccoloStr1:
	.dc.b	'*ﾋﾟｯｺﾛ    '
FluteStr1:
	.dc.b	'*ﾌﾙｰﾄ     '
OboeStr1:
	.dc.b	'*ｵｰﾎﾞｴ    '
ClarinetStr1:
	.dc.b	'*ｸﾗﾘﾈｯﾄ   '
BassoonStr1:
	.dc.b	'*ﾊﾞｽｰﾝ    '
SaxophoneStr1:
	.dc.b	'*ｻｯｸｽ     '
TrumpetStr1:
	.dc.b	'*ﾄﾗﾝﾍﾟｯﾄ  '
HornStr1:
	.dc.b	'*ﾎﾙﾝ      '
TromboneStr1:
	.dc.b	'*ﾄﾛﾝﾎﾞｰﾝ  '
TubaStr1:
	.dc.b	'*ﾁｭｰﾊﾞ    '
Brass1Str1:
	.dc.b	'*ﾌﾞﾗｽ1    '
Brass2Str1:
	.dc.b	'*ﾌﾞﾗｽ2    '
HarmonicaStr1:
	.dc.b	'*ﾊｰﾓﾆｶ    '
OcarinaStr1:
	.dc.b	'*ｵｶﾘﾅ     '
RecorderStr1:
	.dc.b	'*ﾘｺｰﾀﾞｰ   '
SambaWhistleStr1:
	.dc.b	'*ｻﾝﾊﾞﾎｲｯｽﾙ'
PanfluteStr1:
	.dc.b	'*ﾊﾟﾝﾌﾙｰﾄ  '
SnaredrumStr1:
	.dc.b	'*ｽﾈｱﾄﾞﾗﾑ  '
RimshotStr1:
	.dc.b	'*ﾘﾑｼｮｯﾄ   '
BassdrumStr1:
	.dc.b	'*ﾊﾞｽﾄﾞﾗﾑ  '
TomtomStr1:
	.dc.b	'*ﾀﾑﾀﾑ     '
TimpaniStr1:
	.dc.b	'*ﾃｨﾝﾊﾟﾆ   '
BongoStr1:
	.dc.b	'*ﾎﾞﾝｺﾞ    '
TingPalaceStr1:
	.dc.b	'*ﾃｨﾝﾊﾟﾚｽ  '
TriangleStr1:
	.dc.b	'*ﾄﾗｲｱﾝｸﾞﾙ '
CowbellStr1:
	.dc.b	'*ｶｳﾍﾞﾙ    '
TubelabelStr1:
	.dc.b	'*ﾁｭｰﾌﾞﾗﾍﾞﾙ'
SteeldrumStr1:
	.dc.b	'*ｽﾁｰﾙﾄﾞﾗﾑ '
GlockenStr1:
	.dc.b	'*ｸﾞﾛｯｹﾝ   '
VibraphoneStr1:
	.dc.b	'*ﾋﾞﾌﾞﾗﾌｫﾝ '
MarimbaStr1:
	.dc.b	'*ﾏﾘﾝﾊﾞ    '
ClosedHHStr1:
	.dc.b	'*ｸﾛｰｽﾞH.H.'
OpenHHStr1:
	.dc.b	'*ｵｰﾌﾟﾝH.H.'
CymbalStr1:
	.dc.b	'*ｼﾝﾊﾞﾙ    '
Synthesizer1Str1:
	.dc.b	'*ｼﾝｾｻｲｻﾞ1 '
Synthesizer2Str1:
	.dc.b	'*ｼﾝｾｻｲｻﾞ2 '
SE1Str1:
	.dc.b	'*SE1      '
SE2Str1:
	.dc.b	'*SE2      '
SE3Str1:
	.dc.b	'*SE3      '
SE4Str1:
	.dc.b	'*SE4      '
SE5Str1:
	.dc.b	'*SE5      '
L007cfe:
	.dc.b	'          '
L007d08:
	.dc.b	'          '
APianoData1:
	.dc.b	$07 << 3 | $02 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$02,$00,$dc,$00,$00,$00,$00,$03,$00
	.dc.b	$1c,$04,$00,$05,$01,$25,$02,$01,$07,$00,$00
	.dc.b	$16,$09,$01,$02,$01,$2f,$02,$0c,$00,$00,$00
	.dc.b	$1d,$04,$03,$06,$01,$25,$01,$03,$03,$00,$00
	.dc.b	$0f,$07,$00,$05,$0a,$00,$02,$01,$00,$00,$01
HPianoData1:
	.dc.b	$03 << 3 | $04 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$02,$00,$dc,$00,$0a,$00,$00,$03,$00
	.dc.b	$1f,$0a,$01,$03,$0f,$18,$02,$07,$03,$01,$00
	.dc.b	$1d,$0c,$09,$07,$0a,$00,$00,$07,$04,$00,$01
	.dc.b	$1f,$05,$01,$03,$0f,$23,$02,$05,$04,$00,$00
	.dc.b	$1c,$0c,$09,$07,$0a,$00,$00,$01,$03,$00,$01
EPianoData1:
	.dc.b	$03 << 3 | $04 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$02,$00,$b4,$00,$00,$00,$00,$03,$00
	.dc.b	$1f,$0f,$00,$06,$07,$35,$02,$0f,$05,$01,$00
	.dc.b	$1f,$07,$05,$08,$02,$0d,$03,$01,$00,$00,$01
	.dc.b	$1f,$06,$00,$06,$04,$25,$02,$01,$02,$00,$00
	.dc.b	$1f,$07,$00,$07,$00,$00,$01,$01,$07,$00,$01
ClavinetData1:
	.dc.b	$07 << 3 | $02 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$02,$00,$82,$00,$00,$00,$00,$03,$00
	.dc.b	$1c,$04,$03,$07,$01,$23,$02,$01,$03,$00,$00
	.dc.b	$1b,$08,$01,$02,$00,$25,$03,$0f,$07,$00,$00
	.dc.b	$1c,$03,$00,$00,$0f,$1b,$02,$01,$06,$00,$00
	.dc.b	$1a,$09,$00,$0a,$0f,$00,$02,$0a,$00,$00,$01
CelestaData1:
	.dc.b	$01 << 3 | $05 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$03,$00
	.dc.b	$1f,$0a,$0c,$05,$0f,$48,$01,$0e,$02,$00,$01
	.dc.b	$1f,$0a,$0c,$05,$0f,$07,$01,$04,$07,$00,$01
	.dc.b	$1f,$0a,$0c,$07,$0f,$07,$01,$0c,$07,$00,$01
	.dc.b	$1f,$0a,$0c,$06,$0f,$07,$01,$09,$03,$00,$01
HarpsichordData1:
	.dc.b	$06 << 3 | $02 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$03,$00
	.dc.b	$1f,$00,$00,$0f,$00,$19,$01,$03,$00,$00,$00
	.dc.b	$1f,$00,$00,$0f,$00,$23,$03,$0c,$04,$00,$01
	.dc.b	$1f,$00,$00,$02,$00,$24,$01,$01,$00,$00,$00
	.dc.b	$1f,$06,$04,$05,$0f,$00,$02,$01,$04,$00,$01
AGuitarData1:
	.dc.b	$04 << 3 | $01 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$03,$00
	.dc.b	$1c,$05,$04,$03,$0f,$2a,$03,$02,$01,$00,$00
	.dc.b	$1f,$07,$04,$01,$02,$25,$01,$03,$07,$00,$00
	.dc.b	$1f,$03,$04,$01,$02,$23,$03,$03,$04,$00,$00
	.dc.b	$1f,$02,$01,$04,$01,$00,$02,$01,$02,$00,$00
EGuitarData1:
	.dc.b	$07 << 3 | $02 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$02,$00,$d2,$00,$00,$00,$00,$03,$00
	.dc.b	$1f,$0d,$01,$04,$0f,$29,$02,$0f,$03,$00,$00
	.dc.b	$1f,$14,$05,$0f,$0e,$39,$01,$0d,$07,$02,$00
	.dc.b	$14,$0a,$01,$07,$08,$23,$01,$03,$07,$00,$00
	.dc.b	$17,$05,$01,$07,$0f,$00,$00,$01,$03,$00,$01
WoodbassData1:
	.dc.b	$07 << 3 | $02 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$02,$00,$96,$00,$00,$00,$00,$03,$00
	.dc.b	$1f,$0d,$01,$04,$0f,$20,$01,$00,$07,$00,$00
	.dc.b	$1f,$0b,$01,$0a,$0f,$37,$01,$04,$05,$00,$00
	.dc.b	$1f,$0b,$01,$0a,$0f,$1d,$00,$00,$02,$00,$00
	.dc.b	$1f,$0b,$01,$08,$0f,$00,$01,$00,$03,$00,$01
EBassData1:
	.dc.b	$00 << 3 | $03 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$03,$00
	.dc.b	$1f,$0e,$01,$0a,$0a,$2a,$00,$06,$06,$00,$00
	.dc.b	$1f,$05,$00,$0a,$06,$1a,$00,$00,$04,$00,$00
	.dc.b	$1f,$02,$04,$06,$01,$20,$00,$00,$04,$00,$00
	.dc.b	$1c,$01,$06,$08,$01,$00,$00,$01,$03,$00,$01
BanjoData1:
	.dc.b	$07 << 3 | $02 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$03,$00
	.dc.b	$18,$0a,$00,$02,$05,$1b,$01,$05,$07,$00,$00
	.dc.b	$1a,$10,$00,$08,$0b,$1e,$00,$0f,$00,$00,$00
	.dc.b	$1c,$10,$00,$04,$03,$20,$00,$01,$06,$00,$00
	.dc.b	$18,$0b,$00,$06,$0f,$00,$02,$01,$03,$00,$00
SitarData1:
	.dc.b	$00 << 3 | $01 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$02,$00,$c8,$00,$00,$00,$00,$03,$00
	.dc.b	$1f,$1f,$08,$02,$0c,$34,$00,$03,$07,$00,$00
	.dc.b	$1f,$0b,$01,$03,$01,$23,$01,$09,$03,$00,$00
	.dc.b	$1c,$07,$09,$04,$0f,$11,$00,$01,$01,$00,$00
	.dc.b	$12,$01,$01,$04,$0f,$00,$01,$01,$00,$00,$01
HarpData1:
	.dc.b	$07 << 3 | $02 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$03,$00
	.dc.b	$1f,$19,$01,$02,$02,$4c,$00,$06,$00,$00,$00
	.dc.b	$1f,$10,$01,$02,$0d,$1a,$01,$03,$07,$00,$00
	.dc.b	$1f,$04,$02,$02,$0c,$25,$01,$01,$00,$00,$00
	.dc.b	$1f,$0a,$00,$03,$0f,$00,$01,$01,$00,$00,$01
KotoData1:
	.dc.b	$07 << 3 | $00 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$02,$00,$c8,$00,$00,$00,$00,$03,$00
	.dc.b	$1a,$08,$05,$07,$02,$1c,$03,$03,$07,$00,$00
	.dc.b	$1d,$04,$05,$05,$01,$1f,$03,$04,$01,$00,$00
	.dc.b	$1c,$04,$02,$06,$02,$20,$03,$01,$07,$00,$00
	.dc.b	$1d,$09,$03,$03,$01,$00,$03,$01,$03,$00,$01
POrgan1Data1:
	.dc.b	$07 << 3 | $06 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$02,$00,$02,$08,$01,$03,$02,$03,$00
	.dc.b	$1f,$14,$00,$0a,$00,$24,$00,$08,$03,$00,$00
	.dc.b	$14,$02,$01,$0a,$03,$00,$00,$02,$07,$00,$01
	.dc.b	$14,$02,$01,$0a,$03,$00,$00,$01,$01,$00,$01
	.dc.b	$14,$02,$01,$0a,$03,$00,$00,$06,$02,$00,$01
POrgan2Data1:
	.dc.b	$07 << 3 | $07 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$02,$00,$be,$00,$00,$00,$00,$03,$00
	.dc.b	$1f,$01,$01,$0a,$00,$1d,$00,$08,$03,$00,$01
	.dc.b	$13,$02,$01,$0a,$01,$02,$00,$03,$07,$00,$01
	.dc.b	$13,$02,$01,$0a,$01,$02,$00,$01,$00,$00,$01
	.dc.b	$13,$02,$01,$0a,$01,$02,$00,$02,$06,$00,$01
EOrganData1:
	.dc.b	$03 << 3 | $07 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$02,$00,$c8,$03,$02,$02,$01,$03,$00
	.dc.b	$1f,$14,$00,$0f,$0f,$0c,$00,$07,$00,$00,$01
	.dc.b	$1f,$02,$01,$0f,$00,$05,$00,$03,$02,$00,$01
	.dc.b	$1f,$02,$01,$0f,$00,$07,$00,$03,$00,$00,$01
	.dc.b	$1f,$02,$01,$0f,$00,$05,$00,$02,$06,$00,$01
AccordionData1:
	.dc.b	$07 << 3 | $00 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$02,$00,$b4,$1e,$00,$02,$00,$03,$00
	.dc.b	$1f,$00,$00,$00,$00,$27,$01,$06,$03,$00,$00
	.dc.b	$1f,$03,$01,$01,$01,$26,$01,$07,$03,$00,$01
	.dc.b	$13,$02,$01,$06,$01,$26,$01,$01,$07,$00,$00
	.dc.b	$10,$00,$00,$09,$00,$00,$01,$02,$07,$00,$01
ViolinData1:
	.dc.b	$07 << 3 | $02 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$02,$00,$ca,$38,$03,$03,$00,$03,$00
	.dc.b	$14,$02,$00,$05,$01,$21,$01,$01,$00,$00,$00
	.dc.b	$19,$06,$00,$08,$03,$1e,$01,$05,$07,$00,$00
	.dc.b	$1c,$03,$00,$06,$01,$30,$01,$01,$00,$00,$00
	.dc.b	$0c,$04,$00,$06,$00,$00,$01,$01,$04,$00,$01
CelloData1:
	.dc.b	$07 << 3 | $00 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$02,$00,$c8,$50,$00,$02,$00,$03,$00
	.dc.b	$12,$1f,$14,$0a,$00,$0a,$01,$0f,$07,$03,$00
	.dc.b	$1f,$11,$0c,$0a,$00,$23,$01,$06,$07,$00,$00
	.dc.b	$0d,$12,$01,$03,$00,$1b,$02,$01,$07,$00,$00
	.dc.b	$0c,$02,$01,$0a,$01,$00,$01,$01,$03,$00,$01
Strings1Data1:
	.dc.b	$07 << 3 | $02 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$02,$00,$cd,$50,$00,$02,$00,$03,$00
	.dc.b	$1e,$01,$00,$01,$01,$1e,$03,$00,$02,$00,$00
	.dc.b	$1f,$01,$00,$02,$01,$26,$03,$02,$03,$00,$00
	.dc.b	$1e,$01,$00,$01,$01,$30,$01,$01,$03,$00,$00
	.dc.b	$08,$02,$00,$06,$00,$00,$00,$01,$04,$00,$01
Strings2Data1:
	.dc.b	$07 << 3 | $05 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$02,$00,$c8,$5a,$00,$02,$00,$03,$00
	.dc.b	$1f,$01,$01,$02,$00,$1f,$03,$00,$00,$00,$00
	.dc.b	$09,$01,$00,$06,$00,$00,$00,$01,$01,$00,$00
	.dc.b	$0a,$01,$00,$07,$00,$00,$00,$01,$01,$00,$00
	.dc.b	$09,$02,$00,$07,$00,$00,$00,$01,$01,$00,$01
PizzicatoData1:
	.dc.b	$07 << 3 | $04 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$03,$00
	.dc.b	$1f,$16,$01,$03,$0f,$18,$00,$01,$03,$00,$00
	.dc.b	$12,$0f,$01,$05,$0e,$00,$01,$01,$07,$00,$01
	.dc.b	$1f,$0f,$00,$03,$0f,$20,$01,$01,$03,$00,$00
	.dc.b	$1f,$0f,$01,$05,$0e,$00,$01,$01,$03,$00,$01
VoiceData1:
	.dc.b	$00 << 3 | $06 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$02,$00,$c8,$5a,$00,$04,$00,$03,$00
	.dc.b	$0a,$00,$01,$03,$00,$4d,$00,$01,$00,$00,$00
	.dc.b	$0c,$00,$00,$05,$00,$07,$02,$03,$03,$00,$01
	.dc.b	$0c,$00,$01,$06,$02,$00,$01,$02,$07,$00,$01
	.dc.b	$12,$00,$00,$06,$00,$11,$01,$01,$03,$00,$01
ChorusData1:
	.dc.b	$05 << 3 | $01 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$02,$00,$ce,$28,$00,$04,$00,$03,$00
	.dc.b	$13,$12,$04,$04,$05,$42,$00,$06,$03,$03,$00
	.dc.b	$15,$0e,$06,$0a,$06,$34,$00,$04,$07,$03,$00
	.dc.b	$0b,$1f,$03,$0a,$00,$2d,$00,$01,$07,$00,$00
	.dc.b	$0e,$1f,$01,$08,$00,$00,$00,$01,$03,$00,$01
GrassharpData1:
	.dc.b	$04 << 3 | $04 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$00,$00,$50,$01,$02,$01,$01,$03,$00
	.dc.b	$14,$02,$01,$05,$03,$24,$01,$04,$00,$00,$01
	.dc.b	$06,$07,$07,$06,$00,$00,$00,$00,$00,$01,$01
	.dc.b	$14,$02,$01,$05,$03,$25,$03,$04,$06,$00,$00
	.dc.b	$07,$07,$07,$07,$00,$00,$00,$00,$02,$01,$01
WhistleData1:
	.dc.b	$00 << 3 | $07 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$02,$00,$c8,$46,$00,$04,$00,$03,$00
	.dc.b	$00,$00,$00,$00,$00,$7f,$00,$00,$04,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$7f,$00,$00,$04,$00,$00
	.dc.b	$0f,$0c,$00,$09,$00,$00,$00,$05,$07,$02,$00
	.dc.b	$0d,$0c,$00,$09,$00,$00,$00,$08,$07,$00,$01
PiccoloData1:
	.dc.b	$00 << 3 | $04 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$02,$00,$c8,$00,$00,$00,$00,$03,$00
	.dc.b	$12,$0a,$01,$0a,$03,$2f,$01,$02,$04,$00,$00
	.dc.b	$13,$0b,$03,$09,$02,$00,$00,$02,$04,$00,$00
	.dc.b	$12,$0a,$01,$0a,$05,$4d,$01,$06,$04,$03,$00
	.dc.b	$13,$0b,$03,$09,$02,$00,$00,$02,$04,$00,$00
FluteData1:
	.dc.b	$07 << 3 | $03 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$02,$00,$c4,$10,$00,$05,$00,$03,$00
	.dc.b	$1c,$05,$03,$05,$0e,$2a,$03,$02,$07,$01,$00
	.dc.b	$0b,$07,$00,$05,$0f,$33,$01,$02,$00,$00,$00
	.dc.b	$0e,$02,$00,$04,$02,$30,$03,$01,$03,$00,$00
	.dc.b	$0c,$10,$00,$06,$01,$00,$02,$01,$00,$00,$01
OboeData1:
	.dc.b	$07 << 3 | $02 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$02,$00,$c6,$1e,$08,$04,$01,$03,$00
	.dc.b	$19,$0b,$00,$03,$01,$25,$03,$01,$03,$00,$00
	.dc.b	$1c,$0c,$0c,$0b,$05,$25,$03,$09,$03,$00,$00
	.dc.b	$19,$10,$00,$0b,$01,$2f,$01,$02,$03,$00,$00
	.dc.b	$11,$0a,$00,$0b,$01,$00,$01,$04,$03,$00,$01
ClarinetData1:
	.dc.b	$07 << 3 | $02 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$02,$00,$c6,$0b,$00,$04,$00,$03,$00
	.dc.b	$13,$02,$02,$00,$01,$24,$01,$02,$00,$00,$00
	.dc.b	$1c,$12,$03,$0b,$04,$20,$00,$09,$00,$00,$00
	.dc.b	$1d,$14,$01,$09,$01,$37,$01,$01,$00,$00,$00
	.dc.b	$11,$0f,$00,$09,$00,$00,$00,$01,$00,$00,$01
BassoonData1:
	.dc.b	$05 << 3 | $04 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$03,$00
	.dc.b	$12,$00,$00,$0a,$00,$2f,$00,$01,$04,$00,$00
	.dc.b	$14,$00,$00,$0a,$00,$00,$01,$02,$04,$00,$00
	.dc.b	$13,$0e,$00,$0a,$01,$27,$00,$01,$04,$00,$00
	.dc.b	$14,$00,$00,$0a,$00,$00,$00,$05,$04,$00,$00
SaxophoneData1:
	.dc.b	$07 << 3 | $02 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$02,$00,$c8,$28,$00,$03,$00,$03,$00
	.dc.b	$12,$00,$00,$06,$00,$24,$00,$00,$00,$00,$00
	.dc.b	$12,$00,$00,$06,$03,$2f,$00,$04,$00,$01,$00
	.dc.b	$12,$00,$00,$06,$00,$2a,$00,$00,$00,$00,$00
	.dc.b	$0e,$08,$00,$08,$01,$00,$00,$01,$07,$00,$01
TrumpetData1:
	.dc.b	$07 << 3 | $02 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$03,$00
	.dc.b	$0e,$0e,$00,$03,$01,$1b,$02,$01,$03,$00,$00
	.dc.b	$0e,$0e,$00,$03,$0f,$25,$02,$07,$02,$00,$00
	.dc.b	$0d,$0e,$00,$03,$01,$25,$02,$01,$04,$00,$00
	.dc.b	$13,$03,$00,$0a,$00,$00,$01,$01,$06,$00,$01
HornData1:
	.dc.b	$07 << 3 | $02 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$02,$00,$cd,$00,$00,$00,$00,$03,$00
	.dc.b	$0d,$09,$00,$09,$03,$22,$00,$01,$04,$00,$00
	.dc.b	$1f,$11,$00,$0f,$0c,$2d,$01,$05,$04,$02,$00
	.dc.b	$0c,$0b,$00,$08,$01,$32,$00,$01,$04,$00,$00
	.dc.b	$0e,$1f,$00,$0a,$00,$01,$00,$01,$04,$00,$01
TromboneData1:
	.dc.b	$07 << 3 | $02 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$03,$00
	.dc.b	$10,$0c,$00,$08,$00,$1c,$00,$01,$00,$00,$00
	.dc.b	$0e,$0e,$00,$0a,$0f,$28,$00,$02,$00,$02,$00
	.dc.b	$14,$0e,$00,$0a,$07,$31,$00,$01,$00,$00,$00
	.dc.b	$10,$0e,$00,$08,$01,$00,$00,$01,$00,$00,$01
TubaData1:
	.dc.b	$06 << 3 | $06 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$02,$00,$cb,$02,$02,$01,$01,$03,$00
	.dc.b	$0f,$0a,$01,$05,$06,$15,$01,$00,$01,$00,$00
	.dc.b	$11,$02,$01,$08,$03,$00,$00,$01,$03,$00,$01
	.dc.b	$1e,$02,$12,$0a,$05,$00,$02,$01,$07,$00,$01
	.dc.b	$0f,$02,$01,$0a,$05,$00,$02,$00,$03,$00,$01
Brass1Data1:
	.dc.b	$07 << 3 | $04 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$00,$00,$c8,$00,$00,$00,$00,$03,$00
	.dc.b	$12,$0c,$01,$0a,$02,$20,$01,$01,$00,$00,$00
	.dc.b	$12,$0a,$01,$0a,$03,$00,$00,$01,$01,$00,$01
	.dc.b	$0f,$0a,$01,$0a,$05,$13,$01,$01,$02,$00,$00
	.dc.b	$14,$02,$01,$0a,$03,$07,$00,$01,$06,$00,$01
Brass2Data1:
	.dc.b	$07 << 3 | $02 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$02,$00,$ce,$28,$00,$03,$00,$03,$00
	.dc.b	$10,$0f,$00,$08,$01,$18,$00,$01,$07,$00,$00
	.dc.b	$10,$0c,$00,$04,$01,$3b,$00,$08,$00,$02,$00
	.dc.b	$12,$00,$00,$04,$00,$33,$00,$01,$00,$00,$00
	.dc.b	$10,$00,$00,$0a,$00,$00,$00,$02,$00,$00,$01
HarmonicaData1:
	.dc.b	$07 << 3 | $00 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$02,$00,$d2,$01,$05,$03,$01,$03,$00
	.dc.b	$12,$00,$00,$03,$00,$26,$00,$09,$03,$00,$00
	.dc.b	$12,$00,$00,$03,$00,$26,$00,$07,$07,$00,$00
	.dc.b	$0f,$05,$00,$03,$01,$25,$00,$01,$03,$00,$00
	.dc.b	$0f,$08,$00,$09,$02,$00,$00,$03,$07,$00,$01
OcarinaData1:
	.dc.b	$07 << 3 | $03 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$02,$00,$cc,$14,$00,$05,$00,$03,$00
	.dc.b	$1f,$10,$00,$0a,$0f,$0c,$00,$04,$00,$00,$00
	.dc.b	$18,$0a,$00,$0a,$00,$4d,$00,$02,$00,$00,$00
	.dc.b	$14,$14,$00,$0a,$03,$4d,$00,$03,$07,$01,$00
	.dc.b	$10,$05,$00,$0a,$07,$00,$00,$04,$00,$00,$01
RecorderData1:
	.dc.b	$07 << 3 | $03 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$02,$00,$c4,$12,$00,$05,$00,$03,$00
	.dc.b	$11,$11,$10,$06,$03,$37,$00,$04,$04,$01,$00
	.dc.b	$0f,$12,$01,$00,$02,$2f,$00,$02,$04,$00,$00
	.dc.b	$0d,$14,$00,$07,$02,$2f,$00,$02,$07,$00,$00
	.dc.b	$10,$1f,$00,$09,$00,$00,$00,$01,$04,$00,$01
SambaWhistleData1:
	.dc.b	$00 << 3 | $02 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$02,$00,$f4,$2f,$00,$07,$00,$03,$00
	.dc.b	$1f,$00,$00,$0a,$00,$2f,$00,$06,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$0f,$7f,$00,$01,$00,$00,$00
	.dc.b	$1f,$00,$00,$0a,$00,$2b,$00,$0a,$00,$00,$00
	.dc.b	$14,$08,$00,$0a,$01,$00,$00,$02,$00,$00,$01
PanfluteData1:
	.dc.b	$07 << 3 | $03 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$02,$00,$c8,$50,$00,$03,$00,$03,$00
	.dc.b	$14,$00,$00,$0a,$00,$00,$00,$04,$00,$00,$00
	.dc.b	$0e,$10,$00,$0a,$05,$3e,$00,$02,$03,$00,$00
	.dc.b	$12,$12,$00,$0a,$09,$26,$00,$03,$00,$01,$00
	.dc.b	$0e,$0c,$00,$0a,$02,$00,$01,$01,$00,$00,$01
SnaredrumData1:
	.dc.b	$07 << 3 | $04 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$03,$00
	.dc.b	$1f,$19,$05,$02,$00,$00,$00,$0f,$00,$00,$00
	.dc.b	$1f,$12,$12,$0c,$07,$00,$00,$01,$00,$00,$01
	.dc.b	$1f,$19,$00,$00,$0f,$00,$00,$03,$00,$01,$00
	.dc.b	$1f,$11,$0f,$0a,$0f,$00,$00,$01,$00,$00,$01
RimshotData1:
	.dc.b	$00 << 3 | $02 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$03,$00
	.dc.b	$1e,$10,$01,$0a,$0f,$2b,$00,$02,$00,$03,$00
	.dc.b	$1e,$0a,$00,$0a,$0f,$2f,$00,$00,$07,$01,$00
	.dc.b	$1e,$14,$00,$0a,$0f,$0f,$00,$00,$03,$03,$00
	.dc.b	$1e,$13,$00,$0a,$0f,$00,$00,$01,$00,$00,$01
BassdrumData1:
	.dc.b	$00 << 3 | $00 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$03,$00
	.dc.b	$1e,$1a,$00,$0d,$0f,$1a,$00,$01,$00,$01,$00
	.dc.b	$1e,$1c,$00,$0e,$0f,$25,$00,$0e,$00,$03,$00
	.dc.b	$1e,$10,$00,$08,$0f,$05,$00,$00,$00,$01,$00
	.dc.b	$1d,$10,$00,$08,$0f,$00,$00,$00,$00,$00,$01
TomtomData1:
	.dc.b	$07 << 3 | $03 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$02,$00,$6e,$00,$00,$00,$00,$03,$00
	.dc.b	$1c,$14,$0c,$0f,$0a,$16,$00,$03,$00,$02,$00
	.dc.b	$1c,$13,$05,$02,$0a,$11,$03,$01,$00,$01,$00
	.dc.b	$1c,$0f,$0a,$0a,$05,$11,$03,$00,$03,$00,$00
	.dc.b	$1e,$0c,$07,$05,$06,$00,$01,$01,$00,$00,$01
TimpaniData1:
	.dc.b	$00 << 3 | $02 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$03,$00
	.dc.b	$1c,$0c,$00,$04,$0f,$24,$01,$00,$00,$01,$00
	.dc.b	$14,$08,$00,$04,$0f,$1b,$01,$00,$00,$02,$00
	.dc.b	$1c,$0a,$00,$05,$0f,$22,$00,$00,$00,$00,$00
	.dc.b	$10,$05,$00,$02,$0f,$00,$03,$00,$00,$00,$01
BongoData1:
	.dc.b	$07 << 3 | $03 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$03,$00
	.dc.b	$18,$17,$00,$0b,$0f,$00,$00,$03,$00,$03,$00
	.dc.b	$1a,$0e,$00,$07,$0f,$28,$00,$02,$00,$02,$00
	.dc.b	$1a,$0a,$00,$05,$0f,$39,$00,$02,$00,$03,$00
	.dc.b	$16,$10,$00,$08,$0f,$00,$02,$06,$00,$00,$01
TingPalaceData1:
	.dc.b	$06 << 3 | $02 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$03,$00
	.dc.b	$1c,$0f,$00,$06,$0f,$1a,$01,$02,$03,$03,$00
	.dc.b	$18,$10,$00,$07,$0f,$20,$00,$08,$07,$02,$00
	.dc.b	$1a,$0b,$00,$07,$0f,$1d,$01,$05,$03,$00,$00
	.dc.b	$18,$07,$00,$04,$0f,$00,$02,$02,$07,$03,$01
TriangleData1:
	.dc.b	$00 << 3 | $03 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$00,$00,$64,$00,$00,$00,$00,$03,$00
	.dc.b	$1f,$06,$00,$04,$0f,$33,$00,$01,$00,$03,$00
	.dc.b	$1f,$00,$00,$02,$00,$1b,$00,$08,$07,$02,$00
	.dc.b	$1f,$08,$00,$06,$05,$43,$00,$09,$03,$01,$00
	.dc.b	$1f,$0a,$00,$05,$0f,$00,$00,$0a,$03,$02,$01
CowbellData1:
	.dc.b	$07 << 3 | $03 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$03,$00
	.dc.b	$1e,$14,$00,$0a,$0f,$1b,$00,$0f,$02,$00,$00
	.dc.b	$1e,$11,$00,$08,$0f,$1b,$01,$04,$00,$01,$00
	.dc.b	$1c,$0c,$00,$06,$0f,$2b,$01,$02,$03,$02,$00
	.dc.b	$1a,$10,$00,$08,$0f,$00,$01,$02,$00,$03,$01
TubelabelData1:
	.dc.b	$00 << 3 | $04 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$03,$00
	.dc.b	$1f,$07,$00,$01,$01,$23,$00,$07,$03,$00,$00
	.dc.b	$1f,$0a,$00,$06,$00,$00,$00,$02,$07,$00,$01
	.dc.b	$1f,$07,$00,$01,$01,$23,$00,$07,$07,$00,$00
	.dc.b	$1f,$0d,$00,$06,$00,$00,$00,$02,$03,$00,$01
SteeldrumData1:
	.dc.b	$00 << 3 | $04 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$02,$00,$d0,$00,$00,$00,$00,$03,$00
	.dc.b	$0d,$0a,$04,$04,$0f,$1d,$01,$03,$07,$00,$00
	.dc.b	$11,$07,$00,$04,$0f,$00,$02,$01,$00,$00,$01
	.dc.b	$0e,$08,$05,$03,$0f,$23,$02,$01,$07,$00,$00
	.dc.b	$0f,$08,$00,$04,$0f,$07,$02,$04,$03,$00,$01
GlockenData1:
	.dc.b	$03 << 3 | $04 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$03,$00
	.dc.b	$1f,$18,$00,$0c,$0f,$20,$00,$0e,$02,$00,$00
	.dc.b	$1f,$0f,$00,$08,$0f,$00,$00,$02,$00,$00,$00
	.dc.b	$1f,$14,$00,$04,$0f,$1b,$00,$0f,$00,$00,$00
	.dc.b	$1f,$0e,$00,$05,$0f,$00,$00,$02,$00,$00,$01
VibraphoneData1:
	.dc.b	$05 << 3 | $04 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$02,$00,$c5,$28,$0d,$02,$03,$03,$00
	.dc.b	$18,$0e,$00,$07,$0f,$32,$01,$0c,$03,$00,$00
	.dc.b	$18,$0a,$00,$07,$0f,$00,$01,$04,$00,$00,$01
	.dc.b	$1a,$0e,$00,$06,$0f,$39,$01,$04,$00,$00,$00
	.dc.b	$1a,$08,$00,$06,$0f,$00,$02,$01,$00,$00,$01
MarimbaData1:
	.dc.b	$05 << 3 | $04 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$03,$00
	.dc.b	$18,$11,$00,$07,$0f,$2a,$01,$04,$03,$00,$00
	.dc.b	$18,$04,$00,$02,$0f,$00,$03,$00,$03,$00,$01
	.dc.b	$18,$14,$00,$0a,$0f,$20,$01,$06,$07,$00,$00
	.dc.b	$18,$0c,$00,$06,$0f,$00,$02,$02,$07,$00,$01
ClosedHHData1:
	.dc.b	$07 << 3 | $03 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$03,$00
	.dc.b	$1d,$04,$03,$02,$03,$00,$00,$0e,$00,$01,$00
	.dc.b	$1d,$0f,$03,$02,$07,$1b,$00,$06,$00,$01,$00
	.dc.b	$1d,$17,$00,$0a,$0f,$1b,$00,$07,$00,$02,$00
	.dc.b	$1e,$14,$15,$0f,$0f,$00,$00,$01,$00,$00,$01
OpenHHData1:
	.dc.b	$06 << 3 | $04 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$02,$00,$6f,$00,$00,$00,$00,$03,$00
	.dc.b	$1f,$01,$00,$05,$0c,$07,$00,$00,$00,$03,$00
	.dc.b	$1f,$0d,$0f,$0a,$0f,$0e,$00,$0e,$00,$01,$00
	.dc.b	$1f,$16,$07,$08,$06,$13,$00,$00,$07,$00,$00
	.dc.b	$1f,$14,$14,$08,$0f,$02,$00,$00,$00,$01,$00
CymbalData1:
	.dc.b	$05 << 3 | $04 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$02,$00,$c8,$00,$00,$00,$00,$03,$00
	.dc.b	$1f,$04,$00,$00,$01,$04,$00,$03,$07,$01,$00
	.dc.b	$1f,$1f,$03,$02,$01,$1d,$01,$05,$00,$02,$00
	.dc.b	$19,$1c,$05,$03,$03,$07,$00,$01,$07,$02,$00
	.dc.b	$1f,$1f,$05,$03,$07,$00,$02,$07,$00,$03,$01
Synthesizer1Data1:
	.dc.b	$03 << 3 | $02 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$02,$00,$c8,$14,$03,$03,$02,$03,$00
	.dc.b	$12,$01,$01,$0a,$03,$11,$01,$02,$01,$00,$00
	.dc.b	$14,$02,$01,$0a,$00,$0c,$00,$03,$00,$01,$00
	.dc.b	$1f,$13,$01,$00,$0f,$19,$00,$00,$00,$00,$00
	.dc.b	$14,$02,$01,$0a,$03,$00,$02,$01,$03,$00,$01
Synthesizer2Data1:
	.dc.b	$03 << 3 | $04 ; Feedback << 3 | Connection
	.dc.b	$03 ; Slot Mask
	.dc.b	$02,$00,$d2,$28,$00,$03,$00,$03,$00
	.dc.b	$1f,$10,$00,$00,$0f,$07,$01,$02,$03,$00,$00
	.dc.b	$1f,$00,$00,$08,$00,$07,$01,$01,$06,$00,$01
	.dc.b	$1f,$00,$00,$08,$00,$0c,$01,$02,$07,$00,$00
	.dc.b	$1f,$00,$00,$08,$00,$00,$01,$01,$03,$00,$01
SE1Data1:
	.dc.b	$00 << 3 | $04 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$01,$00,$9e,$44,$00,$06,$00,$03,$00
	.dc.b	$00,$00,$00,$00,$0f,$7f,$00,$01,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$0f,$7f,$00,$01,$00,$00,$01
	.dc.b	$1f,$00,$00,$01,$00,$25,$00,$0e,$00,$00,$00
	.dc.b	$10,$00,$00,$04,$00,$00,$00,$05,$07,$01,$01
SE2Data1:
	.dc.b	$07 << 3 | $02 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$02,$00,$78,$78,$1e,$07,$02,$03,$00
	.dc.b	$1f,$00,$00,$00,$00,$11,$00,$02,$00,$02,$00
	.dc.b	$1f,$00,$00,$00,$00,$0a,$00,$01,$00,$01,$00
	.dc.b	$1f,$00,$00,$00,$00,$1d,$00,$01,$00,$02,$00
	.dc.b	$0c,$00,$00,$04,$00,$00,$00,$00,$00,$00,$01
SE3Data1:
	.dc.b	$00 << 3 | $04 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$00,$00,$dc,$78,$00,$07,$00,$03,$00
	.dc.b	$1f,$00,$00,$05,$00,$0f,$00,$00,$00,$03,$00
	.dc.b	$14,$00,$00,$0a,$00,$07,$00,$07,$00,$01,$01
	.dc.b	$0c,$00,$00,$05,$00,$2f,$00,$03,$00,$03,$00
	.dc.b	$10,$00,$00,$08,$00,$00,$00,$01,$00,$00,$01
SE4Data1:
	.dc.b	$00 << 3 | $06 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$03,$00,$d1,$46,$00,$06,$00,$03,$00
	.dc.b	$1f,$00,$00,$00,$00,$19,$00,$0c,$00,$00,$00
	.dc.b	$14,$0e,$00,$07,$0f,$07,$00,$04,$00,$00,$00
	.dc.b	$14,$0e,$00,$07,$0f,$00,$00,$02,$04,$03,$00
	.dc.b	$14,$0e,$00,$07,$0f,$00,$00,$02,$04,$00,$00
SE5Data1:
	.dc.b	$04 << 3 | $00 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$03,$00
	.dc.b	$1f,$08,$00,$04,$0f,$0d,$00,$03,$00,$02,$00
	.dc.b	$0a,$07,$00,$04,$0f,$11,$03,$01,$00,$01,$00
	.dc.b	$1f,$00,$00,$00,$00,$03,$00,$01,$00,$02,$00
	.dc.b	$10,$09,$00,$04,$0f,$00,$03,$00,$00,$00,$01
APianoStr2:
	.dc.b	'*A.ﾋﾟｱﾉ   '
HPianoStr2:
	.dc.b	'*H.ﾋﾟｱﾉ   '
EPianoStr2:
	.dc.b	'*E.ﾋﾟｱﾉ   '
ClavinetStr2:
	.dc.b	'*ｸﾗﾋﾞﾈｯﾄ  '
SelestatStr2:
	.dc.b	'*ｾﾚｽﾀ     '
HarpsichordStr2:
	.dc.b	'*ﾁｪﾝﾊﾞﾛ   '
AGuitarStr2:
	.dc.b	'*A.ｷﾞﾀｰ   '
EGuitarStr2:
	.dc.b	'*E.ｷﾞﾀｰ   '
WoodbaseStr2:
	.dc.b	'*ｳｯﾄﾞﾍﾞｰｽ '
EBaseStr2:
	.dc.b	'*E.ﾍﾞｰｽ   '
BanjoStr2:
	.dc.b	'*ﾊﾞﾝｼﾞｮｰ  '
SitarStr2:
	.dc.b	'*ｼﾀｰﾙ     '
HarpStr2:
	.dc.b	'*ﾊｰﾌﾟ     '
KotoStr2:
	.dc.b	'*ｺﾄ       '
POrgan1Str2:
	.dc.b	'*P.ｵﾙｶﾞﾝ1 '
POrgan2Str2:
	.dc.b	'*P.ｵﾙｶﾞﾝ2 '
EOrganStr2:
	.dc.b	'*E.ｵﾙｶﾞﾝ  '
AccordionStr2:
	.dc.b	'*ｱｺｰﾃﾞｨｵﾝ '
AviolinStr2:
	.dc.b	'*ﾊﾞｲｵﾘﾝ   '
CelloStr2:
	.dc.b	'*ﾁｪﾛ      '
Strings1Str2:
	.dc.b	'*ｽﾄﾘﾝｸﾞｽ1 '
Strings2Str2:
	.dc.b	'*ｽﾄﾘﾝｸﾞｽ2 '
PizzicatoStr2:
	.dc.b	'*ﾋﾟﾁｶｰﾄ   '
VoiceStr2:
	.dc.b	'*ﾎﾞｲｽ     '
ChorusStr2:
	.dc.b	'*ｺｰﾗｽ     '
GrassharpStr2:
	.dc.b	'*ｸﾞﾗｽﾊｰﾌﾟ '
WhistleStr2:
	.dc.b	'*ﾎｲｯｽﾙ    '
PiccoloStr2:
	.dc.b	'*ﾋﾟｯｺﾛ    '
FluteStr2:
	.dc.b	'*ﾌﾙｰﾄ     '
OboeStr2:
	.dc.b	'*ｵｰﾎﾞｴ    '
ClarinetStr2:
	.dc.b	'*ｸﾗﾘﾈｯﾄ   '
BassoonStr2:
	.dc.b	'*ﾊﾞｽｰﾝ    '
SaxophoneStr2:
	.dc.b	'*ｻｯｸｽ     '
TrumpetStr2:
	.dc.b	'*ﾄﾗﾝﾍﾟｯﾄ  '
AhornStr2:
	.dc.b	'*ﾎﾙﾝ      '
TromboneStr2:
	.dc.b	'*ﾄﾛﾝﾎﾞｰﾝ  '
TubaStr2:
	.dc.b	'*ﾁｭｰﾊﾞ    '
Brass1Str2:
	.dc.b	'*ﾌﾞﾗｽ1    '
Brass2Str2:
	.dc.b	'*ﾌﾞﾗｽ2    '
HarmonicaStr2:
	.dc.b	'*ﾊｰﾓﾆｶ    '
OcarinaStr2:
	.dc.b	'*ｵｶﾘﾅ     '
RecorderStr2:
	.dc.b	'*ﾘｺｰﾀﾞｰ   '
SambaWhistleStr2:
	.dc.b	'*ｻﾝﾊﾞﾎｲｯｽﾙ'
PanfluteStr2:
	.dc.b	'*ﾊﾟﾝﾌﾙｰﾄ  '
SnaredrumStr2:
	.dc.b	'*ｽﾈｱﾄﾞﾗﾑ  '
RimshotStr2:
	.dc.b	'*ﾘﾑｼｮｯﾄ   '
BassdrumStr2:
	.dc.b	'*ﾊﾞｽﾄﾞﾗﾑ  '
TomtomStr2:
	.dc.b	'*ﾀﾑﾀﾑ     '
TimpaniStr2:
	.dc.b	'*ﾃｨﾝﾊﾟﾆ   '
BongoStr2:
	.dc.b	'*ﾎﾞﾝｺﾞ    '
TingPalaceStr2:
	.dc.b	'*ﾃｨﾝﾊﾟﾚｽ  '
TriangleStr2:
	.dc.b	'*ﾄﾗｲｱﾝｸﾞﾙ '
CowbellStr2:
	.dc.b	'*ｶｳﾍﾞﾙ    '
TubelabelStr2:
	.dc.b	'*ﾁｭｰﾌﾞﾗﾍﾞﾙ'
SteeldrumStr2:
	.dc.b	'*ｽﾁｰﾙﾄﾞﾗﾑ '
GlockenStr2:
	.dc.b	'*ｸﾞﾛｯｹﾝ   '
VibraphoneStr2:
	.dc.b	'*ﾋﾞﾌﾞﾗﾌｫﾝ '
MarimbaStr2:
	.dc.b	'*ﾏﾘﾝﾊﾞ    '
ClosedHHStr2:
	.dc.b	'*ｸﾛｰｽﾞH.H.'
OpenHHStr2:
	.dc.b	'*ｵｰﾌﾟﾝH.H.'
CymbalStr2:
	.dc.b	'*ｼﾝﾊﾞﾙ    '
Synthesizer1Str2:
	.dc.b	'*ｼﾝｾｻｲｻﾞ1 '
Synthesizer2Str2:
	.dc.b	'*ｼﾝｾｻｲｻﾞ2 '
SE1Str2:
	.dc.b	'*SE1      '
SE2Str2:
	.dc.b	'*SE2      '
SE3Str2:
	.dc.b	'*SE3      '
SE4Str2:
	.dc.b	'*SE4      '
SE5Str2:
	.dc.b	'*SE5      '
L008e56:
	.dc.b	'          '
L008e60:
	.dc.b	'          '
L008e6a:
	.dc.b	'          '
L008e74:
	.dc.b	'          '
L008e7e:
	.dc.b	'          '
L008e88:
	.dc.b	'          '
L008e92:
	.dc.b	'          '
L008e9c:
	.dc.b	'          '
L008ea6:
	.dc.b	'          '
L008eb0:
	.dc.b	'          '
L008eba:
	.dc.b	'          '
L008ec4:
	.dc.b	'          '
L008ece:
	.dc.b	'          '
L008ed8:
	.dc.b	'          '
L008ee2:
	.dc.b	'          '
L008eec:
	.dc.b	'          '
L008ef6:
	.dc.b	'          '
L008f00:
	.dc.b	'          '
L008f0a:
	.dc.b	'          '
L008f14:
	.dc.b	'          '
L008f1e:
	.dc.b	'          '
L008f28:
	.dc.b	'          '
L008f32:
	.dc.b	'          '
L008f3c:
	.dc.b	'          '
L008f46:
	.dc.b	'          '
L008f50:
	.dc.b	'          '
L008f5a:
	.dc.b	'          '
L008f64:
	.dc.b	'          '
L008f6e:
	.dc.b	'          '
L008f78:
	.dc.b	'          '
L008f82:
	.dc.b	'          '
L008f8c:
	.dc.b	'          '
L008f96:
	.dc.b	'          '
L008fa0:
	.dc.b	'          '
L008faa:
	.dc.b	'          '
L008fb4:
	.dc.b	'          '
L008fbe:
	.dc.b	'          '
L008fc8:
	.dc.b	'          '
L008fd2:
	.dc.b	'          '
L008fdc:
	.dc.b	'          '
L008fe6:
	.dc.b	'          '
L008ff0:
	.dc.b	'          '
L008ffa:
	.dc.b	'          '
L009004:
	.dc.b	'          '
L00900e:
	.dc.b	'          '
L009018:
	.dc.b	'          '
L009022:
	.dc.b	'          '
L00902c:
	.dc.b	'          '
L009036:
	.dc.b	'          '
L009040:
	.dc.b	'          '
L00904a:
	.dc.b	'          '
L009054:
	.dc.b	'          '
L00905e:
	.dc.b	'          '
L009068:
	.dc.b	'          '
L009072:
	.dc.b	'          '
L00907c:
	.dc.b	'          '
L009086:
	.dc.b	'          '
L009090:
	.dc.b	'          '
L00909a:
	.dc.b	'          '
L0090a4:
	.dc.b	'          '
L0090ae:
	.dc.b	'          '
L0090b8:
	.dc.b	'          '
L0090c2:
	.dc.b	'          '
L0090cc:
	.dc.b	'          '
L0090d6:
	.dc.b	'          '
L0090e0:
	.dc.b	'          '
L0090ea:
	.dc.b	'          '
L0090f4:
	.dc.b	'          '
L0090fe:
	.dc.b	'          '
L009108:
	.dc.b	'          '
L009112:
	.dc.b	'          '
L00911c:
	.dc.b	'          '
L009126:
	.dc.b	'          '
L009130:
	.dc.b	'          '
L00913a:
	.dc.b	'          '
L009144:
	.dc.b	'          '
L00914e:
	.dc.b	'          '
L009158:
	.dc.b	'          '
L009162:
	.dc.b	'          '
L00916c:
	.dc.b	'          '
L009176:
	.dc.b	'          '
L009180:
	.dc.b	'          '
L00918a:
	.dc.b	'          '
L009194:
	.dc.b	'          '
L00919e:
	.dc.b	'          '
L0091a8:
	.dc.b	'          '
L0091b2:
	.dc.b	'          '
L0091bc:
	.dc.b	'          '
L0091c6:
	.dc.b	'          '
L0091d0:
	.dc.b	'          '
L0091da:
	.dc.b	'          '
L0091e4:
	.dc.b	'          '
L0091ee:
	.dc.b	'          '
L0091f8:
	.dc.b	'          '
L009202:
	.dc.b	'          '
L00920c:
	.dc.b	'          '
L009216:
	.dc.b	'          '
L009220:
	.dc.b	'          '
L00922a:
	.dc.b	'          '
L009234:
	.dc.b	'          '
L00923e:
	.dc.b	'          '
L009248:
	.dc.b	'          '
L009252:
	.dc.b	'          '
L00925c:
	.dc.b	'          '
L009266:
	.dc.b	'          '
L009270:
	.dc.b	'          '
L00927a:
	.dc.b	'          '
L009284:
	.dc.b	'          '
L00928e:
	.dc.b	'          '
L009298:
	.dc.b	'          '
L0092a2:
	.dc.b	'          '
L0092ac:
	.dc.b	'          '
L0092b6:
	.dc.b	'          '
L0092c0:
	.dc.b	'          '
L0092ca:
	.dc.b	'          '
L0092d4:
	.dc.b	'          '
L0092de:
	.dc.b	'          '
L0092e8:
	.dc.b	'          '
L0092f2:
	.dc.b	'          '
L0092fc:
	.dc.b	'          '
L009306:
	.dc.b	'          '
L009310:
	.dc.b	'          '
L00931a:
	.dc.b	'          '
L009324:
	.dc.b	'          '
L00932e:
	.dc.b	'          '
L009338:
	.dc.b	'          '
L009342:
	.dc.b	'          '
L00934c:
	.dc.b	'          '
L009356:
	.dc.b	'          '
L009360:
	.dc.b	'          '
L00936a:
	.dc.b	'          '
L009374:
	.dc.b	'          '
APianoData2:
	.dc.b	$07 << 3 | $02 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$02,$00,$dc,$00,$00,$00,$00,$03,$00
	.dc.b	$1c,$04,$00,$05,$01,$25,$02,$01,$07,$00,$00
	.dc.b	$16,$09,$01,$02,$01,$2f,$02,$0c,$00,$00,$00
	.dc.b	$1d,$04,$03,$06,$01,$25,$01,$03,$03,$00,$00
	.dc.b	$0f,$07,$00,$05,$0a,$00,$02,$01,$00,$00,$01
HPianoData2:
	.dc.b	$03 << 3 | $04 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$02,$00,$dc,$00,$0a,$00,$00,$03,$00
	.dc.b	$1f,$0a,$01,$03,$0f,$18,$02,$07,$03,$01,$00
	.dc.b	$1d,$0c,$09,$07,$0a,$00,$00,$07,$04,$00,$01
	.dc.b	$1f,$05,$01,$03,$0f,$23,$02,$05,$04,$00,$00
	.dc.b	$1c,$0c,$09,$07,$0a,$00,$00,$01,$03,$00,$01
EPianoData2:
	.dc.b	$03 << 3 | $04 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$02,$00,$b4,$00,$00,$00,$00,$03,$00
	.dc.b	$1f,$0f,$00,$06,$07,$35,$02,$0f,$05,$01,$00
	.dc.b	$1f,$07,$05,$08,$02,$0d,$03,$01,$00,$00,$01
	.dc.b	$1f,$06,$00,$06,$04,$25,$02,$01,$02,$00,$00
	.dc.b	$1f,$07,$00,$07,$00,$00,$01,$01,$07,$00,$01
ClavinetData2:
	.dc.b	$07 << 3 | $02 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$02,$00,$82,$00,$00,$00,$00,$03,$00
	.dc.b	$1c,$04,$03,$07,$01,$23,$02,$01,$03,$00,$00
	.dc.b	$1b,$08,$01,$02,$00,$25,$03,$0f,$07,$00,$00
	.dc.b	$1c,$03,$00,$00,$0f,$1b,$02,$01,$06,$00,$00
	.dc.b	$1a,$09,$00,$0a,$0f,$00,$02,$0a,$00,$00,$01
CelestaData2:
	.dc.b	$01 << 3 | $05 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$03,$00
	.dc.b	$1f,$0a,$0c,$05,$0f,$48,$01,$0e,$02,$00,$01
	.dc.b	$1f,$0a,$0c,$05,$0f,$07,$01,$04,$07,$00,$01
	.dc.b	$1f,$0a,$0c,$07,$0f,$07,$01,$0c,$07,$00,$01
	.dc.b	$1f,$0a,$0c,$06,$0f,$07,$01,$09,$03,$00,$01
HarpsichordData2:
	.dc.b	$06 << 3 | $02 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$03,$00
	.dc.b	$1f,$00,$00,$0f,$00,$19,$01,$03,$00,$00,$00
	.dc.b	$1f,$00,$00,$0f,$00,$23,$03,$0c,$04,$00,$01
	.dc.b	$1f,$00,$00,$02,$00,$24,$01,$01,$00,$00,$00
	.dc.b	$1f,$06,$04,$05,$0f,$00,$02,$01,$04,$00,$01
AGuitarData2:
	.dc.b	$04 << 3 | $01 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$03,$00
	.dc.b	$1c,$05,$04,$03,$0f,$2a,$03,$02,$01,$00,$00
	.dc.b	$1f,$07,$04,$01,$02,$25,$01,$03,$07,$00,$00
	.dc.b	$1f,$03,$04,$01,$02,$23,$03,$03,$04,$00,$00
	.dc.b	$1f,$02,$01,$04,$01,$00,$02,$01,$02,$00,$00
EGuitarData2:
	.dc.b	$07 << 3 | $02 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$02,$00,$d2,$00,$00,$00,$00,$03,$00
	.dc.b	$1f,$0d,$01,$04,$0f,$29,$02,$0f,$03,$00,$00
	.dc.b	$1f,$14,$05,$0f,$0e,$39,$01,$0d,$07,$02,$00
	.dc.b	$14,$0a,$01,$07,$08,$23,$01,$03,$07,$00,$00
	.dc.b	$17,$05,$01,$07,$0f,$00,$00,$01,$03,$00,$01
WoodbassData2:
	.dc.b	$07 << 3 | $02 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$02,$00,$96,$00,$00,$00,$00,$03,$00
	.dc.b	$1f,$0d,$01,$04,$0f,$20,$01,$00,$07,$00,$00
	.dc.b	$1f,$0b,$01,$0a,$0f,$37,$01,$04,$05,$00,$00
	.dc.b	$1f,$0b,$01,$0a,$0f,$1d,$00,$00,$02,$00,$00
	.dc.b	$1f,$0b,$01,$08,$0f,$00,$01,$00,$03,$00,$01
EBassData2:
	.dc.b	$00 << 3 | $03 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$03,$00
	.dc.b	$1f,$0e,$01,$0a,$0a,$2a,$00,$06,$06,$00,$00
	.dc.b	$1f,$05,$00,$0a,$06,$1a,$00,$00,$04,$00,$00
	.dc.b	$1f,$02,$04,$06,$01,$20,$00,$00,$04,$00,$00
	.dc.b	$1c,$01,$06,$08,$01,$00,$00,$01,$03,$00,$01
BanjoData2:
	.dc.b	$07 << 3 | $02 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$03,$00
	.dc.b	$18,$0a,$00,$02,$05,$1b,$01,$05,$07,$00,$00
	.dc.b	$1a,$10,$00,$08,$0b,$1e,$00,$0f,$00,$00,$00
	.dc.b	$1c,$10,$00,$04,$03,$20,$00,$01,$06,$00,$00
	.dc.b	$18,$0b,$00,$06,$0f,$00,$02,$01,$03,$00,$00
SitarData2:
	.dc.b	$00 << 3 | $01 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$02,$00,$c8,$00,$00,$00,$00,$03,$00
	.dc.b	$1f,$1f,$08,$02,$0c,$34,$00,$03,$07,$00,$00
	.dc.b	$1f,$0b,$01,$03,$01,$23,$01,$09,$03,$00,$00
	.dc.b	$1c,$07,$09,$04,$0f,$11,$00,$01,$01,$00,$00
	.dc.b	$12,$01,$01,$04,$0f,$00,$01,$01,$00,$00,$01
HarpData2:
	.dc.b	$07 << 3 | $02 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$03,$00
	.dc.b	$1f,$19,$01,$02,$02,$4c,$00,$06,$00,$00,$00
	.dc.b	$1f,$10,$01,$02,$0d,$1a,$01,$03,$07,$00,$00
	.dc.b	$1f,$04,$02,$02,$0c,$25,$01,$01,$00,$00,$00
	.dc.b	$1f,$0a,$00,$03,$0f,$00,$01,$01,$00,$00,$01
KotoData2:
	.dc.b	$07 << 3 | $00 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$02,$00,$c8,$00,$00,$00,$00,$03,$00
	.dc.b	$1a,$08,$05,$07,$02,$1c,$03,$03,$07,$00,$00
	.dc.b	$1d,$04,$05,$05,$01,$1f,$03,$04,$01,$00,$00
	.dc.b	$1c,$04,$02,$06,$02,$20,$03,$01,$07,$00,$00
	.dc.b	$1d,$09,$03,$03,$01,$00,$03,$01,$03,$00,$01
POrgan1Data2:
	.dc.b	$07 << 3 | $06 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$02,$00,$02,$08,$01,$03,$02,$03,$00
	.dc.b	$1f,$14,$00,$0a,$00,$24,$00,$08,$03,$00,$00
	.dc.b	$14,$02,$01,$0a,$03,$00,$00,$02,$07,$00,$01
	.dc.b	$14,$02,$01,$0a,$03,$00,$00,$01,$01,$00,$01
	.dc.b	$14,$02,$01,$0a,$03,$00,$00,$06,$02,$00,$01
POrgan2Data2:
	.dc.b	$07 << 3 | $07 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$02,$00,$be,$00,$00,$00,$00,$03,$00
	.dc.b	$1f,$01,$01,$0a,$00,$1d,$00,$08,$03,$00,$01
	.dc.b	$13,$02,$01,$0a,$01,$02,$00,$03,$07,$00,$01
	.dc.b	$13,$02,$01,$0a,$01,$02,$00,$01,$00,$00,$01
	.dc.b	$13,$02,$01,$0a,$01,$02,$00,$02,$06,$00,$01
EOrganData2:
	.dc.b	$03 << 3 | $07 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$02,$00,$c8,$03,$02,$02,$01,$03,$00
	.dc.b	$1f,$14,$00,$0f,$0f,$0c,$00,$07,$00,$00,$01
	.dc.b	$1f,$02,$01,$0f,$00,$05,$00,$03,$02,$00,$01
	.dc.b	$1f,$02,$01,$0f,$00,$07,$00,$03,$00,$00,$01
	.dc.b	$1f,$02,$01,$0f,$00,$05,$00,$02,$06,$00,$01
AccordionData2:
	.dc.b	$07 << 3 | $00 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$02,$00,$b4,$1e,$00,$02,$00,$03,$00
	.dc.b	$1f,$00,$00,$00,$00,$27,$01,$06,$03,$00,$00
	.dc.b	$1f,$03,$01,$01,$01,$26,$01,$07,$03,$00,$01
	.dc.b	$13,$02,$01,$06,$01,$26,$01,$01,$07,$00,$00
	.dc.b	$10,$00,$00,$09,$00,$00,$01,$02,$07,$00,$01
ViolinData2:
	.dc.b	$07 << 3 | $02 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$02,$00,$ca,$38,$03,$03,$00,$03,$00
	.dc.b	$14,$02,$00,$05,$01,$21,$01,$01,$00,$00,$00
	.dc.b	$19,$06,$00,$08,$03,$1e,$01,$05,$07,$00,$00
	.dc.b	$1c,$03,$00,$06,$01,$30,$01,$01,$00,$00,$00
	.dc.b	$0c,$04,$00,$06,$00,$00,$01,$01,$04,$00,$01
CelloData2:
	.dc.b	$07 << 3 | $00 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$02,$00,$c8,$50,$00,$02,$00,$03,$00
	.dc.b	$12,$1f,$14,$0a,$00,$0a,$01,$0f,$07,$03,$00
	.dc.b	$1f,$11,$0c,$0a,$00,$23,$01,$06,$07,$00,$00
	.dc.b	$0d,$12,$01,$03,$00,$1b,$02,$01,$07,$00,$00
	.dc.b	$0c,$02,$01,$0a,$01,$00,$01,$01,$03,$00,$01
Strings1Data2:
	.dc.b	$07 << 3 | $02 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$02,$00,$cd,$50,$00,$02,$00,$03,$00
	.dc.b	$1e,$01,$00,$01,$01,$1e,$03,$00,$02,$00,$00
	.dc.b	$1f,$01,$00,$02,$01,$26,$03,$02,$03,$00,$00
	.dc.b	$1e,$01,$00,$01,$01,$30,$01,$01,$03,$00,$00
	.dc.b	$08,$02,$00,$06,$00,$00,$00,$01,$04,$00,$01
Strings2Data2:
	.dc.b	$07 << 3 | $05 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$02,$00,$c8,$5a,$00,$02,$00,$03,$00
	.dc.b	$1f,$01,$01,$02,$00,$1f,$03,$00,$00,$00,$00
	.dc.b	$09,$01,$00,$06,$00,$00,$00,$01,$01,$00,$00
	.dc.b	$0a,$01,$00,$07,$00,$00,$00,$01,$01,$00,$00
	.dc.b	$09,$02,$00,$07,$00,$00,$00,$01,$01,$00,$01
PizzicatoData2:
	.dc.b	$07 << 3 | $04 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$03,$00
	.dc.b	$1f,$16,$01,$03,$0f,$18,$00,$01,$03,$00,$00
	.dc.b	$12,$0f,$01,$05,$0e,$00,$01,$01,$07,$00,$01
	.dc.b	$1f,$0f,$00,$03,$0f,$20,$01,$01,$03,$00,$00
	.dc.b	$1f,$0f,$01,$05,$0e,$00,$01,$01,$03,$00,$01
VoiceData2:
	.dc.b	$00 << 3 | $06 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$02,$00,$c8,$5a,$00,$04,$00,$03,$00
	.dc.b	$0a,$00,$01,$03,$00,$4d,$00,$01,$00,$00,$00
	.dc.b	$0c,$00,$00,$05,$00,$07,$02,$03,$03,$00,$01
	.dc.b	$0c,$00,$01,$06,$02,$00,$01,$02,$07,$00,$01
	.dc.b	$12,$00,$00,$06,$00,$11,$01,$01,$03,$00,$01
ChorusData2:
	.dc.b	$05 << 3 | $01 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$02,$00,$ce,$28,$00,$04,$00,$03,$00
	.dc.b	$13,$12,$04,$04,$05,$42,$00,$06,$03,$03,$00
	.dc.b	$15,$0e,$06,$0a,$06,$34,$00,$04,$07,$03,$00
	.dc.b	$0b,$1f,$03,$0a,$00,$2d,$00,$01,$07,$00,$00
	.dc.b	$0e,$1f,$01,$08,$00,$00,$00,$01,$03,$00,$01
GrassharpData2:
	.dc.b	$04 << 3 | $04 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$00,$00,$50,$01,$02,$01,$01,$03,$00
	.dc.b	$14,$02,$01,$05,$03,$24,$01,$04,$00,$00,$01
	.dc.b	$06,$07,$07,$06,$00,$00,$00,$00,$00,$01,$01
	.dc.b	$14,$02,$01,$05,$03,$25,$03,$04,$06,$00,$00
	.dc.b	$07,$07,$07,$07,$00,$00,$00,$00,$02,$01,$01
WhistleData2:
	.dc.b	$00 << 3 | $07 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$02,$00,$c8,$46,$00,$04,$00,$03,$00
	.dc.b	$00,$00,$00,$00,$00,$7f,$00,$00,$04,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$7f,$00,$00,$04,$00,$00
	.dc.b	$0f,$0c,$00,$09,$00,$00,$00,$05,$07,$02,$00
	.dc.b	$0d,$0c,$00,$09,$00,$00,$00,$08,$07,$00,$01
PiccoloData2:
	.dc.b	$00 << 3 | $04 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$02,$00,$c8,$00,$00,$00,$00,$03,$00
	.dc.b	$12,$0a,$01,$0a,$03,$2f,$01,$02,$04,$00,$00
	.dc.b	$13,$0b,$03,$09,$02,$00,$00,$02,$04,$00,$00
	.dc.b	$12,$0a,$01,$0a,$05,$4d,$01,$06,$04,$03,$00
	.dc.b	$13,$0b,$03,$09,$02,$00,$00,$02,$04,$00,$00
FluteData2:
	.dc.b	$07 << 3 | $03 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$02,$00,$c4,$10,$00,$05,$00,$03,$00
	.dc.b	$1c,$05,$03,$05,$0e,$2a,$03,$02,$07,$01,$00
	.dc.b	$0b,$07,$00,$05,$0f,$33,$01,$02,$00,$00,$00
	.dc.b	$0e,$02,$00,$04,$02,$30,$03,$01,$03,$00,$00
	.dc.b	$0c,$10,$00,$06,$01,$00,$02,$01,$00,$00,$01
OboeData2:
	.dc.b	$07 << 3 | $02 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$02,$00,$c6,$1e,$08,$04,$01,$03,$00
	.dc.b	$19,$0b,$00,$03,$01,$25,$03,$01,$03,$00,$00
	.dc.b	$1c,$0c,$0c,$0b,$05,$25,$03,$09,$03,$00,$00
	.dc.b	$19,$10,$00,$0b,$01,$2f,$01,$02,$03,$00,$00
	.dc.b	$11,$0a,$00,$0b,$01,$00,$01,$04,$03,$00,$01
ClarinetData2:
	.dc.b	$07 << 3 | $02 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$02,$00,$c6,$0b,$00,$04,$00,$03,$00
	.dc.b	$13,$02,$02,$00,$01,$24,$01,$02,$00,$00,$00
	.dc.b	$1c,$12,$03,$0b,$04,$20,$00,$09,$00,$00,$00
	.dc.b	$1d,$14,$01,$09,$01,$37,$01,$01,$00,$00,$00
	.dc.b	$11,$0f,$00,$09,$00,$00,$00,$01,$00,$00,$01
BassoonData2:
	.dc.b	$05 << 3 | $04 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$03,$00
	.dc.b	$12,$00,$00,$0a,$00,$2f,$00,$01,$04,$00,$00
	.dc.b	$14,$00,$00,$0a,$00,$00,$01,$02,$04,$00,$00
	.dc.b	$13,$0e,$00,$0a,$01,$27,$00,$01,$04,$00,$00
	.dc.b	$14,$00,$00,$0a,$00,$00,$00,$05,$04,$00,$00
SaxophoneData2:
	.dc.b	$07 << 3 | $02 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$02,$00,$c8,$28,$00,$03,$00,$03,$00
	.dc.b	$12,$00,$00,$06,$00,$24,$00,$00,$00,$00,$00
	.dc.b	$12,$00,$00,$06,$03,$2f,$00,$04,$00,$01,$00
	.dc.b	$12,$00,$00,$06,$00,$2a,$00,$00,$00,$00,$00
	.dc.b	$0e,$08,$00,$08,$01,$00,$00,$01,$07,$00,$01
TrumpetData2:
	.dc.b	$07 << 3 | $02 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$03,$00
	.dc.b	$0e,$0e,$00,$03,$01,$1b,$02,$01,$03,$00,$00
	.dc.b	$0e,$0e,$00,$03,$0f,$25,$02,$07,$02,$00,$00
	.dc.b	$0d,$0e,$00,$03,$01,$25,$02,$01,$04,$00,$00
	.dc.b	$13,$03,$00,$0a,$00,$00,$01,$01,$06,$00,$01
HornData2:
	.dc.b	$07 << 3 | $02 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$02,$00,$cd,$00,$00,$00,$00,$03,$00
	.dc.b	$0d,$09,$00,$09,$03,$22,$00,$01,$04,$00,$00
	.dc.b	$1f,$11,$00,$0f,$0c,$2d,$01,$05,$04,$02,$00
	.dc.b	$0c,$0b,$00,$08,$01,$32,$00,$01,$04,$00,$00
	.dc.b	$0e,$1f,$00,$0a,$00,$01,$00,$01,$04,$00,$01
TromboneData2:
	.dc.b	$07 << 3 | $02 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$03,$00
	.dc.b	$10,$0c,$00,$08,$00,$1c,$00,$01,$00,$00,$00
	.dc.b	$0e,$0e,$00,$0a,$0f,$28,$00,$02,$00,$02,$00
	.dc.b	$14,$0e,$00,$0a,$07,$31,$00,$01,$00,$00,$00
	.dc.b	$10,$0e,$00,$08,$01,$00,$00,$01,$00,$00,$01
TubaData2:
	.dc.b	$06 << 3 | $06 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$02,$00,$cb,$02,$02,$01,$01,$03,$00
	.dc.b	$0f,$0a,$01,$05,$06,$15,$01,$00,$01,$00,$00
	.dc.b	$11,$02,$01,$08,$03,$00,$00,$01,$03,$00,$01
	.dc.b	$1e,$02,$12,$0a,$05,$00,$02,$01,$07,$00,$01
	.dc.b	$0f,$02,$01,$0a,$05,$00,$02,$00,$03,$00,$01
Brass1Data2:
	.dc.b	$07 << 3 | $04 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$00,$00,$c8,$00,$00,$00,$00,$03,$00
	.dc.b	$12,$0c,$01,$0a,$02,$20,$01,$01,$00,$00,$00
	.dc.b	$12,$0a,$01,$0a,$03,$00,$00,$01,$01,$00,$01
	.dc.b	$0f,$0a,$01,$0a,$05,$13,$01,$01,$02,$00,$00
	.dc.b	$14,$02,$01,$0a,$03,$07,$00,$01,$06,$00,$01
Brass2Data2:
	.dc.b	$07 << 3 | $02 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$02,$00,$ce,$28,$00,$03,$00,$03,$00
	.dc.b	$10,$0f,$00,$08,$01,$18,$00,$01,$07,$00,$00
	.dc.b	$10,$0c,$00,$04,$01,$3b,$00,$08,$00,$02,$00
	.dc.b	$12,$00,$00,$04,$00,$33,$00,$01,$00,$00,$00
	.dc.b	$10,$00,$00,$0a,$00,$00,$00,$02,$00,$00,$01
HarmonicaData2:
	.dc.b	$07 << 3 | $00 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$02,$00,$d2,$01,$05,$03,$01,$03,$00
	.dc.b	$12,$00,$00,$03,$00,$26,$00,$09,$03,$00,$00
	.dc.b	$12,$00,$00,$03,$00,$26,$00,$07,$07,$00,$00
	.dc.b	$0f,$05,$00,$03,$01,$25,$00,$01,$03,$00,$00
	.dc.b	$0f,$08,$00,$09,$02,$00,$00,$03,$07,$00,$01
OcarinaData2:
	.dc.b	$07 << 3 | $03 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$02,$00,$cc,$14,$00,$05,$00,$03,$00
	.dc.b	$1f,$10,$00,$0a,$0f,$0c,$00,$04,$00,$00,$00
	.dc.b	$18,$0a,$00,$0a,$00,$4d,$00,$02,$00,$00,$00
	.dc.b	$14,$14,$00,$0a,$03,$4d,$00,$03,$07,$01,$00
	.dc.b	$10,$05,$00,$0a,$07,$00,$00,$04,$00,$00,$01
RecorderData2:
	.dc.b	$07 << 3 | $03 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$02,$00,$c4,$12,$00,$05,$00,$03,$00
	.dc.b	$11,$11,$10,$06,$03,$37,$00,$04,$04,$01,$00
	.dc.b	$0f,$12,$01,$00,$02,$2f,$00,$02,$04,$00,$00
	.dc.b	$0d,$14,$00,$07,$02,$2f,$00,$02,$07,$00,$00
	.dc.b	$10,$1f,$00,$09,$00,$00,$00,$01,$04,$00,$01
SambaWhistleData2:
	.dc.b	$00 << 3 | $02 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$02,$00,$f4,$2f,$00,$07,$00,$03,$00
	.dc.b	$1f,$00,$00,$0a,$00,$2f,$00,$06,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$0f,$7f,$00,$01,$00,$00,$00
	.dc.b	$1f,$00,$00,$0a,$00,$2b,$00,$0a,$00,$00,$00
	.dc.b	$14,$08,$00,$0a,$01,$00,$00,$02,$00,$00,$01
PanfluteData2:
	.dc.b	$07 << 3 | $03 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$02,$00,$c8,$50,$00,$03,$00,$03,$00
	.dc.b	$14,$00,$00,$0a,$00,$00,$00,$04,$00,$00,$00
	.dc.b	$0e,$10,$00,$0a,$05,$3e,$00,$02,$03,$00,$00
	.dc.b	$12,$12,$00,$0a,$09,$26,$00,$03,$00,$01,$00
	.dc.b	$0e,$0c,$00,$0a,$02,$00,$01,$01,$00,$00,$01
SnaredrumData2:
	.dc.b	$07 << 3 | $04 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$03,$00
	.dc.b	$1f,$19,$05,$02,$00,$00,$00,$0f,$00,$00,$00
	.dc.b	$1f,$12,$12,$0c,$07,$00,$00,$01,$00,$00,$01
	.dc.b	$1f,$19,$00,$00,$0f,$00,$00,$03,$00,$01,$00
	.dc.b	$1f,$11,$0f,$0a,$0f,$00,$00,$01,$00,$00,$01
RimshotData2:
	.dc.b	$00 << 3 | $02 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$03,$00
	.dc.b	$1e,$10,$01,$0a,$0f,$2b,$00,$02,$00,$03,$00
	.dc.b	$1e,$0a,$00,$0a,$0f,$2f,$00,$00,$07,$01,$00
	.dc.b	$1e,$14,$00,$0a,$0f,$0f,$00,$00,$03,$03,$00
	.dc.b	$1e,$13,$00,$0a,$0f,$00,$00,$01,$00,$00,$01
BassdrumData2:
	.dc.b	$00 << 3 | $00 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$03,$00
	.dc.b	$1e,$1a,$00,$0d,$0f,$1a,$00,$01,$00,$01,$00
	.dc.b	$1e,$1c,$00,$0e,$0f,$25,$00,$0e,$00,$03,$00
	.dc.b	$1e,$10,$00,$08,$0f,$05,$00,$00,$00,$01,$00
	.dc.b	$1d,$10,$00,$08,$0f,$00,$00,$00,$00,$00,$01
TomtomData2:
	.dc.b	$07 << 3 | $03 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$02,$00,$6e,$00,$00,$00,$00,$03,$00
	.dc.b	$1c,$14,$0c,$0f,$0a,$16,$00,$03,$00,$02,$00
	.dc.b	$1c,$13,$05,$02,$0a,$11,$03,$01,$00,$01,$00
	.dc.b	$1c,$0f,$0a,$0a,$05,$11,$03,$00,$03,$00,$00
	.dc.b	$1e,$0c,$07,$05,$06,$00,$01,$01,$00,$00,$01
TimpaniData2:
	.dc.b	$00 << 3 | $02 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$03,$00
	.dc.b	$1c,$0c,$00,$04,$0f,$24,$01,$00,$00,$01,$00
	.dc.b	$14,$08,$00,$04,$0f,$1b,$01,$00,$00,$02,$00
	.dc.b	$1c,$0a,$00,$05,$0f,$22,$00,$00,$00,$00,$00
	.dc.b	$10,$05,$00,$02,$0f,$00,$03,$00,$00,$00,$01
BongoData2:
	.dc.b	$07 << 3 | $03 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$03,$00
	.dc.b	$18,$17,$00,$0b,$0f,$00,$00,$03,$00,$03,$00
	.dc.b	$1a,$0e,$00,$07,$0f,$28,$00,$02,$00,$02,$00
	.dc.b	$1a,$0a,$00,$05,$0f,$39,$00,$02,$00,$03,$00
	.dc.b	$16,$10,$00,$08,$0f,$00,$02,$06,$00,$00,$01
TingPalaceData2:
	.dc.b	$06 << 3 | $02 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$03,$00
	.dc.b	$1c,$0f,$00,$06,$0f,$1a,$01,$02,$03,$03,$00
	.dc.b	$18,$10,$00,$07,$0f,$20,$00,$08,$07,$02,$00
	.dc.b	$1a,$0b,$00,$07,$0f,$1d,$01,$05,$03,$00,$00
	.dc.b	$18,$07,$00,$04,$0f,$00,$02,$02,$07,$03,$01
TriangleData2:
	.dc.b	$00 << 3 | $03 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$00,$00,$64,$00,$00,$00,$00,$03,$00
	.dc.b	$1f,$06,$00,$04,$0f,$33,$00,$01,$00,$03,$00
	.dc.b	$1f,$00,$00,$02,$00,$1b,$00,$08,$07,$02,$00
	.dc.b	$1f,$08,$00,$06,$05,$43,$00,$09,$03,$01,$00
	.dc.b	$1f,$0a,$00,$05,$0f,$00,$00,$0a,$03,$02,$01
CowbellData2:
	.dc.b	$07 << 3 | $03 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$03,$00
	.dc.b	$1e,$14,$00,$0a,$0f,$1b,$00,$0f,$02,$00,$00
	.dc.b	$1e,$11,$00,$08,$0f,$1b,$01,$04,$00,$01,$00
	.dc.b	$1c,$0c,$00,$06,$0f,$2b,$01,$02,$03,$02,$00
	.dc.b	$1a,$10,$00,$08,$0f,$00,$01,$02,$00,$03,$01
TubelabelData2:
	.dc.b	$00 << 3 | $04 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$03,$00
	.dc.b	$1f,$07,$00,$01,$01,$23,$00,$07,$03,$00,$00
	.dc.b	$1f,$0a,$00,$06,$00,$00,$00,$02,$07,$00,$01
	.dc.b	$1f,$07,$00,$01,$01,$23,$00,$07,$07,$00,$00
	.dc.b	$1f,$0d,$00,$06,$00,$00,$00,$02,$03,$00,$01
SteeldrumData2:
	.dc.b	$00 << 3 | $04 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$02,$00,$d0,$00,$00,$00,$00,$03,$00
	.dc.b	$0d,$0a,$04,$04,$0f,$1d,$01,$03,$07,$00,$00
	.dc.b	$11,$07,$00,$04,$0f,$00,$02,$01,$00,$00,$01
	.dc.b	$0e,$08,$05,$03,$0f,$23,$02,$01,$07,$00,$00
	.dc.b	$0f,$08,$00,$04,$0f,$07,$02,$04,$03,$00,$01
GlockenData2:
	.dc.b	$03 << 3 | $04 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$03,$00
	.dc.b	$1f,$18,$00,$0c,$0f,$20,$00,$0e,$02,$00,$00
	.dc.b	$1f,$0f,$00,$08,$0f,$00,$00,$02,$00,$00,$00
	.dc.b	$1f,$14,$00,$04,$0f,$1b,$00,$0f,$00,$00,$00
	.dc.b	$1f,$0e,$00,$05,$0f,$00,$00,$02,$00,$00,$01
VibraphoneData2:
	.dc.b	$05 << 3 | $04 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$02,$00,$c5,$28,$0d,$02,$03,$03,$00
	.dc.b	$18,$0e,$00,$07,$0f,$32,$01,$0c,$03,$00,$00
	.dc.b	$18,$0a,$00,$07,$0f,$00,$01,$04,$00,$00,$01
	.dc.b	$1a,$0e,$00,$06,$0f,$39,$01,$04,$00,$00,$00
	.dc.b	$1a,$08,$00,$06,$0f,$00,$02,$01,$00,$00,$01
MarimbaData2:
	.dc.b	$05 << 3 | $04 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$03,$00
	.dc.b	$18,$11,$00,$07,$0f,$2a,$01,$04,$03,$00,$00
	.dc.b	$18,$04,$00,$02,$0f,$00,$03,$00,$03,$00,$01
	.dc.b	$18,$14,$00,$0a,$0f,$20,$01,$06,$07,$00,$00
	.dc.b	$18,$0c,$00,$06,$0f,$00,$02,$02,$07,$00,$01
ClosedHHData2:
	.dc.b	$07 << 3 | $03 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$03,$00
	.dc.b	$1d,$04,$03,$02,$03,$00,$00,$0e,$00,$01,$00
	.dc.b	$1d,$0f,$03,$02,$07,$1b,$00,$06,$00,$01,$00
	.dc.b	$1d,$17,$00,$0a,$0f,$1b,$00,$07,$00,$02,$00
	.dc.b	$1e,$14,$15,$0f,$0f,$00,$00,$01,$00,$00,$01
OpenHHData2:
	.dc.b	$06 << 3 | $04 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$02,$00,$6f,$00,$00,$00,$00,$03,$00
	.dc.b	$1f,$01,$00,$05,$0c,$07,$00,$00,$00,$03,$00
	.dc.b	$1f,$0d,$0f,$0a,$0f,$0e,$00,$0e,$00,$01,$00
	.dc.b	$1f,$16,$07,$08,$06,$13,$00,$00,$07,$00,$00
	.dc.b	$1f,$14,$14,$08,$0f,$02,$00,$00,$00,$01,$00
CymbalData2:
	.dc.b	$05 << 3 | $04 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$02,$00,$c8,$00,$00,$00,$00,$03,$00
	.dc.b	$1f,$04,$00,$00,$01,$04,$00,$03,$07,$01,$00
	.dc.b	$1f,$1f,$03,$02,$01,$1d,$01,$05,$00,$02,$00
	.dc.b	$19,$1c,$05,$03,$03,$07,$00,$01,$07,$02,$00
	.dc.b	$1f,$1f,$05,$03,$07,$00,$02,$07,$00,$03,$01
Synthesizer1Data2:
	.dc.b	$03 << 3 | $02 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$02,$00,$c8,$14,$03,$03,$02,$03,$00
	.dc.b	$12,$01,$01,$0a,$03,$11,$01,$02,$01,$00,$00
	.dc.b	$14,$02,$01,$0a,$00,$0c,$00,$03,$00,$01,$00
	.dc.b	$1f,$13,$01,$00,$0f,$19,$00,$00,$00,$00,$00
	.dc.b	$14,$02,$01,$0a,$03,$00,$02,$01,$03,$00,$01
Synthesizer2Data2:
	.dc.b	$03 << 3 | $04 ; Feedback << 3 | Connection
	.dc.b	$03 ; Slot Mask
	.dc.b	$02,$00,$d2,$28,$00,$03,$00,$03,$00
	.dc.b	$1f,$10,$00,$00,$0f,$07,$01,$02,$03,$00,$00
	.dc.b	$1f,$00,$00,$08,$00,$07,$01,$01,$06,$00,$01
	.dc.b	$1f,$00,$00,$08,$00,$0c,$01,$02,$07,$00,$00
	.dc.b	$1f,$00,$00,$08,$00,$00,$01,$01,$03,$00,$01
SE1Data2:
	.dc.b	$00 << 3 | $04 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$01,$00,$9e,$44,$00,$06,$00,$03,$00
	.dc.b	$00,$00,$00,$00,$0f,$7f,$00,$01,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$0f,$7f,$00,$01,$00,$00,$01
	.dc.b	$1f,$00,$00,$01,$00,$25,$00,$0e,$00,$00,$00
	.dc.b	$10,$00,$00,$04,$00,$00,$00,$05,$07,$01,$01
SE2Data2:
	.dc.b	$07 << 3 | $02 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$02,$00,$78,$78,$1e,$07,$02,$03,$00
	.dc.b	$1f,$00,$00,$00,$00,$11,$00,$02,$00,$02,$00
	.dc.b	$1f,$00,$00,$00,$00,$0a,$00,$01,$00,$01,$00
	.dc.b	$1f,$00,$00,$00,$00,$1d,$00,$01,$00,$02,$00
	.dc.b	$0c,$00,$00,$04,$00,$00,$00,$00,$00,$00,$01
SE3Data2:
	.dc.b	$00 << 3 | $04 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$00,$00,$dc,$78,$00,$07,$00,$03,$00
	.dc.b	$1f,$00,$00,$05,$00,$0f,$00,$00,$00,$03,$00
	.dc.b	$14,$00,$00,$0a,$00,$07,$00,$07,$00,$01,$01
	.dc.b	$0c,$00,$00,$05,$00,$2f,$00,$03,$00,$03,$00
	.dc.b	$10,$00,$00,$08,$00,$00,$00,$01,$00,$00,$01
SE4Data2:
	.dc.b	$00 << 3 | $06 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$03,$00,$d1,$46,$00,$06,$00,$03,$00
	.dc.b	$1f,$00,$00,$00,$00,$19,$00,$0c,$00,$00,$00
	.dc.b	$14,$0e,$00,$07,$0f,$07,$00,$04,$00,$00,$00
	.dc.b	$14,$0e,$00,$07,$0f,$00,$00,$02,$04,$03,$00
	.dc.b	$14,$0e,$00,$07,$0f,$00,$00,$02,$04,$00,$00
SE5Data2:
	.dc.b	$04 << 3 | $00 ; Feedback << 3 | Connection
	.dc.b	$0f ; Slot Mask
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$03,$00
	.dc.b	$1f,$08,$00,$04,$0f,$0d,$00,$03,$00,$02,$00
	.dc.b	$0a,$07,$00,$04,$0f,$11,$03,$01,$00,$01,$00
	.dc.b	$1f,$00,$00,$00,$00,$03,$00,$01,$00,$02,$00
	.dc.b	$10,$09,$00,$04,$0f,$00,$03,$00,$00,$00,$01
EmptyVoice:
	.dc.b	$00,$0f,$00,$00,$00,$00,$00,$00,$00,$03,$00,$1f,$1f,$00,$0f,$00
	.dc.b	$7f,$00,$01,$00,$00,$00,$1f,$1f,$00,$0f,$00,$7f,$00,$01,$00,$00
	.dc.b	$00,$1f,$1f,$00,$0f,$00,$7f,$00,$01,$00,$00,$00,$1f,$1f,$00,$0f
	.dc.b	$00,$00,$00,$01,$00,$00,$00
L00a251:
	.dc.b	$0d,$0a
	.dc.b	'Music Device Driver for X68000 version 1.00',$0d,$0a
	.dc.b	'Copyright 1992 by SHARP/SAN/Luvex',$0d,$0a,$00
L00a2a4:
	.dc.b	$0d,$0a
	.dc.b	'OPM または MIDI のデバイス名でミュージックデータの演奏が可能です。',$0d,$0a
	.dc.b	'PCM のデバイス名で、録音/再生が可能です',$0d,$0a,$00
L00a314:
	.dc.b	$0d,$0a
	.dc.b	'OPM のデバイス名でミュージックデータの演奏が可能です。',$0d,$0a
	.dc.b	'PCM のデバイス名で、録音/再生が可能です',$0d,$0a,$00
L00a378:
	.dc.b	'トラックバッファに'
L00a38a:
	.dc.b	'    kバイトを確保しました。',$0d,$0a,$00
L00a3a8:
	.dc.b	'ＰＣＭのバッファに'
L00a3ba:
	.dc.b	'    kバイトを確保しました。',$0d,$0a,$00
L00a3d8:
	.dc.b	'ＰＣＭは使用出来ません。',$0d,$0a,$00
L00a3f3:
	.dc.b	$0d,$0a
	.dc.b	'#n',$09,':トラックバッファサイズ n=24～4096(k bytes) def=64',$0d,$0a
	.dc.b	'/Pn',$09,':ＰＣＭバッファサイズ   n=24～4096(k bytes) def=24',$0d,$0a
	.dc.b	'/OPM',$09,': OPM=ch1～8   PCM=ch9      MIDI=ch10～25',$0d,$0a
	.dc.b	'/OMP',$09,': OPM=ch1～8  MIDI=ch9～24   PCM=ch25',$0d,$0a
	.dc.b	'/MOP',$09,':MIDI=ch1～16  OPM=ch17～24  PCM=ch25',$0d,$0a
	.dc.b	'/MPO',$09,':MIDI=ch1～16  PCM=ch17      OPM=ch18～25',$0d,$0a
	.dc.b	'/PMO',$09,': PCM=ch1     MIDI=ch2～17   OPM=ch18～25',$0d,$0a
	.dc.b	'/POM',$09,': PCM=ch1      OPM=ch2～9   MIDI=ch10～25',$0d,$0a
	.dc.b	'/Yn',$09,':Ｙコマンドモード def=/Y1',$0d,$0a
	.dc.b	'/Fn',$09,':ＦＭ音源の音程微調整 n=0～63 def=0',$0d,$0a
	.dc.b	'/R ',$09,':ドライバー解除',$0d,$0a
	.dc.b	'on',$09,':タイマー割り込み再開',$0d,$0a
	.dc.b	'off',$09,':タイマー割り込み停止',$0d,$0a,$00
L00a60f:
	.dc.b	'トラックバッファが確保できません。',$0d,$0a,$00
L00a634:
	.dc.b	'OPMDRV3.X は すでに登録されています。設定を変更する時は',$0d,$0a
	.dc.b	'-R スイッチで組み込みを解除してやり直してください',$0d,$0a,$00
L00a6a1:
	.dc.b	'OPMDRV3.X のタイマー割り込みを再開しました',$0d,$0a,$00
L00a6ce:
	.dc.b	'OPMDRV3.X のタイマー割り込みを停止しました',$0d,$0a,$00
L00a6fb:
	.dc.b	'OPMDRV.X がすでに登録されているので OPMDRV3.X は登録できません',$0d,$0a,$00
L00a73c:
	.dc.b	'PCMDRV.X がすでに登録されているので OPMDRV3.X は登録できません',$0d,$0a,$00
L00a77d:
	.dc.b	'OPMDRV3.X は登録されていません',$0d,$0a,$00
L00a79e:
	.dc.b	'OPMDRV3.X を解除しました',$0d,$0a,$00
L00a7b9:
	.dc.b	'CONFIG.SYS で登録した場合は解除できません',$0d,$0a,$00
L00a7e5:
	.dc.b	'OPMDRV3.X の後から他のデバイスドライバを登録した場合は解除できません',$0d,$0a,$00
L00a82c:
	.dc.b	$00
L00a82d:
	.dc.b	$00
L00a82e:
	.dc.b	$00,$00,$4f,$50,$4d,$20,$20,$20,$20,$20
L00a838:
	.dc.b	'NUL     '
L00a840:
	.dc.b	'MIDI',$00,$00
L00a846:
	.dc.b	'OPM',$00
L00a84a:
	.dc.b	'PCM',$00
L00a84e:
	.dc.b	$3b,$9a,$ca,$00,$05,$f5,$e1,$00,$00,$98,$96,$80,$00,$0f,$42,$40
	.dc.b	$00,$01,$86,$a0,$00,$00,$27,$10,$00,$00,$03,$e8,$00,$00,$00,$64
	.dc.b	$00,$00,$00,$0a,$00,$00,$00,$01,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00

	.bss

L00be96:
	.ds.b	1280
L00c396:
	.ds.b	320
L00c4d6:
	.ds.b	320
L00c616:
	.ds.b	2100
L00ce4a:
	.ds.b	25
L00ce63:
	.ds.b	25
L00ce7c:
	.ds.b	100
L00cee0:
	.ds.b	512
L00d0e0:
	.ds.b	1280
L00d5e0:
	.ds.b	1024
L00d9e0:
	.ds.b	16
L00d9f0:
	.ds.w	1
L00d9f2:
	.ds.b	3074
L00e5f4:
	.ds.b	400
L00e784:
	.ds.b	1792
StackTop:
	.ds.b	64
End:

	.end	Start
