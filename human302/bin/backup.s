;=============================================
;  Filename human302/bin/backup.x
;
;
;  Base address 000000
;  Exec address 006388
;  Text size    0074da byte(s)
;  Data size    000b72 byte(s)
;  Bss  size    0012dc byte(s)
;  1426 Labels
;
;  Commandline dis  -h -k -m68000 -q1 -B -M -w16 -o120 -ghuman302/bin/backup.lab --overwrite human302/bin/backup.x human302/bin/backup.s
;          DIS version 3.16
;=============================================

	.include	inc/doscall.mac
	.include	inc/iocscall.mac
	.include	inc/fefunc.mac

	.cpu	68000

	.text

L000000:
	bra	L0001e2

L000004:
	jsr	(L005848)
	move.l	d0,(L0089ec)
	move.l	#$0000ffff,d0
	and.l	d0,(L0089ec)
	clr.l	(-$0004,a6)
L000020:
	move.l	(-$0004,a6),d0
	cmp.l	#$00000006,d0
	bge	L0000a4
	move.l	(-$0004,a6),d0
	asl.l	#2,d0
	add.l	#L007706,d0
	movea.l	d0,a0
	move.l	(a0),d0
	add.l	#$00008000,d0
	move.l	d0,-(a7)
	jsr	(L00424e)
	addq.l	#4,a7
	move.l	d0,(L008e7c)
	beq	L000064
	move.l	(L008e7c),-(a7)
	jsr	(L00429c)
	addq.l	#4,a7
	bra	L000066

L000064:
	bra	L00009c

L000066:
	move.l	(-$0004,a6),d0
	asl.l	#2,d0
	add.l	#L007706,d0
	movea.l	d0,a0
	move.l	(a0),-(a7)
	jsr	(L00424e)
	addq.l	#4,a7
	move.l	d0,(L008e7c)
	beq	L00009c
	move.l	(-$0004,a6),d0
	asl.l	#2,d0
	add.l	#L007706,d0
	movea.l	d0,a0
	move.l	(a0),(L008e80)
	bra	L0000a4

L00009c:
	addq.l	#1,(-$0004,a6)
	bra	L000020

L0000a4:
	move.l	(L008e7c),d0
	bne	L0000c0
	move.l	#L0077ea,-(a7)
	jsr	(L005b04)
	addq.l	#4,a7
	jsr	(L0058fe)
L0000c0:
	jsr	(L00367e)
	jsr	(L004c8c)
	jsr	(L00344a)
	move.l	($0008,a6),d0
	cmp.l	#$00000001,d0
	bne	L0000f2
	move.l	#$00000001,(L007702)
	jsr	(L00091c)
	bra	L0001d8

L0000f2:
	move.l	($000c,a6),-(a7)
	move.l	($0008,a6),-(a7)
	subq.l	#1,(a7)
	jsr	(L0001ea)
	addq.l	#8,a7
	move.l	d0,(-$0008,a6)
	bne	L0001b6
	move.l	(L008b08),d0
	subq.l	#1,d0
	add.l	#L008e90,d0
	movea.l	d0,a0
	move.b	(a0),d0
	ext.w	d0
	ext.l	d0
	tst.l	d0
	bne	L000140
	move.l	(L008e84),d0
	subq.l	#1,d0
	add.l	#L008e90,d0
	movea.l	d0,a0
	move.b	(a0),d0
	ext.w	d0
	ext.l	d0
	tst.l	d0
	beq	L000154
L000140:
	move.l	#L00780c,-(a7)
	jsr	(L005b04)
	addq.l	#4,a7
	jsr	(L0058fe)
L000154:
	move.l	#L0076ba,-(a7)
	move.l	#L0089f8,-(a7)
	jsr	(L002ab8)
	addq.l	#8,a7
	move.l	d0,(-$0008,a6)
	blt	L000188
	clr.l	-(a7)
	jsr	(L002fce)
	addq.l	#4,a7
	move.l	(L0074da),-(a7)
	jsr	(L004cb2)
	addq.l	#4,a7
	bra	L0001b4

L000188:
	move.l	(-$0008,a6),d0
	moveq.l	#$ff,d1
	movem.l	d0-d1,-(a7)
	FPACK	__CLMUL
	movem.l	(a7)+,d0-d1
	move.l	d0,(-$0008,a6)
	move.l	(-$0008,a6),d0
	asl.l	#2,d0
	add.l	#L0074da,d0
	movea.l	d0,a0
	move.l	(a0),-(a7)
	jsr	(L004cb2)
	addq.l	#4,a7
L0001b4:
	bra	L0001d8

L0001b6:
	move.l	#L00782c,-(a7)
	jsr	(L005b04)
	addq.l	#4,a7
	move.l	#L00750a,-(a7)
	move.l	#L007849,-(a7)
	jsr	(L005b04)
	addq.l	#8,a7
L0001d8:
	jsr	(L0058fe)
	unlk	a6
	rts

L0001e2:
	link.w	a6,#-$0008
	bra	L000004

L0001ea:
	bra	L0002f6

L0001ee:
	clr.l	(-$0008,a6)
	clr.l	(-$0004,a6)
L0001f6:
	move.l	(-$0004,a6),d0
	cmp.l	($0008,a6),d0
	bge	L0002dc
	move.l	(-$0004,a6),d0
	asl.l	#2,d0
	add.l	($000c,a6),d0
	addq.l	#4,d0
	movea.l	d0,a0
	move.l	(a0),(-$000c,a6)
	move.l	(-$000c,a6),d0
	movea.l	d0,a0
	move.b	(a0),d0
	ext.w	d0
	ext.l	d0
	cmp.l	#$0000002d,d0
	beq	L00023c
	move.l	(-$000c,a6),d0
	movea.l	d0,a0
	move.b	(a0),d0
	ext.w	d0
	ext.l	d0
	cmp.l	#$0000002f,d0
	bne	L000256
L00023c:
	addq.l	#1,(-$000c,a6)
	move.l	(-$000c,a6),-(a7)
	jsr	(L000566)
	addq.l	#4,a7
	tst.l	d0
	beq	L000256
	moveq.l	#$ff,d0
	bra	L0002f2

L000256:
	move.l	(-$000c,a6),d0
	addq.l	#1,d0
	movea.l	d0,a0
	move.b	(a0),d0
	ext.w	d0
	ext.l	d0
	cmp.l	#$0000003a,d0
	bne	L0002d4
	move.l	(-$0008,a6),d0
	beq	L00029a
	move.l	(-$000c,a6),d0
	movea.l	d0,a0
	move.b	(a0),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	(L005c42)
	addq.l	#4,a7
	moveq.l	#$61,d1			;'a'
	sub.l	d1,d0
	addq.l	#1,d0
	move.l	d0,(L008b08)
	addq.l	#1,(-$0008,a6)
	bra	L0002d4

L00029a:
	move.l	(-$000c,a6),-(a7)
	jsr	(L0002fe)
	addq.l	#4,a7
	tst.l	d0
	beq	L0002ae
	moveq.l	#$fe,d0
	bra	L0002f2

L0002ae:
	move.l	(-$000c,a6),d0
	movea.l	d0,a0
	move.b	(a0),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	(L005c42)
	addq.l	#4,a7
	moveq.l	#$61,d1			;'a'
	sub.l	d1,d0
	addq.l	#1,d0
	move.l	d0,(L008e84)
	addq.l	#1,(-$0008,a6)
L0002d4:
	addq.l	#1,(-$0004,a6)
	bra	L0001f6

L0002dc:
	move.l	(-$0008,a6),d0
	cmp.l	#$00000002,d0
	bge	L0002ec
	moveq.l	#$ff,d0
	bra	L0002f2

L0002ec:
	clr.l	d0
	bra.w	L0002f2

L0002f2:
	unlk	a6
	rts

L0002f6:
	link.w	a6,#-$000c
	bra	L0001ee

L0002fe:
	bra	L00055e

L000302:
	move.l	($0008,a6),-(a7)
	move.l	a6,d0
	add.l	#$fffffec2,d0
	move.l	d0,-(a7)
	jsr	(L005c0c)
	addq.l	#8,a7
	move.l	($0008,a6),d0
	addq.l	#2,d0
	movea.l	d0,a0
	move.b	(a0),d0
	andi.l	#$000000ff,d0
	cmp.l	#$0000005c,d0
	beq	L00034e
	moveq.l	#$5c,d0			;'\'
	move.b	d0,(-$013c,a6)
	move.l	($0008,a6),-(a7)
	addq.l	#2,(a7)
	move.l	a6,d0
	add.l	#$fffffec5,d0
	move.l	d0,-(a7)
	jsr	(L005c0c)
	addq.l	#8,a7
L00034e:
	move.l	#$0000005c,-(a7)
	move.l	a6,d0
	add.l	#$fffffec2,d0
	move.l	d0,-(a7)
	jsr	(L00599e)
	addq.l	#8,a7
	move.l	d0,(-$003a,a6)
	move.l	(-$003a,a6),d0
	addq.l	#1,d0
	move.l	d0,(-$003e,a6)
	move.l	(-$003e,a6),(-$003a,a6)
	move.l	(-$003a,a6),d0
	movea.l	d0,a0
	move.b	(a0),d0
	andi.l	#$000000ff,d0
	tst.l	d0
	bne	L0003c4
	move.l	a6,d0
	add.l	#$fffffec2,d0
	move.l	d0,-(a7)
	move.l	#L0089f8,-(a7)
	jsr	(L005c0c)
	addq.l	#8,a7
	clr.b	(L0089fa)
	move.l	#L00784e,-(a7)
	move.l	#L0076ba,-(a7)
	jsr	(L005c0c)
	addq.l	#8,a7
	clr.l	d0
	bra	L00055a

L0003c4:
	move.l	(-$003a,a6),d0
	movea.l	d0,a0
	move.b	(a0),d0
	andi.l	#$000000ff,d0
	tst.l	d0
	beq	L00040c
	move.l	(-$003a,a6),d0
	movea.l	d0,a0
	move.b	(a0),d0
	andi.l	#$000000ff,d0
	cmp.l	#$0000003f,d0
	beq	L000402
	move.l	(-$003a,a6),d0
	movea.l	d0,a0
	move.b	(a0),d0
	andi.l	#$000000ff,d0
	cmp.l	#$0000002a,d0
	bne	L000406
L000402:
	bra	L0004b2

L000406:
	addq.l	#1,(-$003a,a6)
	bra	L0003c4

L00040c:
	move.l	#$00000010,-(a7)
	move.l	a6,d0
	add.l	#$fffffec2,d0
	move.l	d0,-(a7)
	move.l	a6,d0
	add.l	#$ffffffca,d0
	move.l	d0,-(a7)
	jsr	(L0058d2)
	lea.l	($000c,a7),a7
	tst.l	d0
	bge	L000480
	move.l	a6,d0
	add.l	#$fffffec5,d0
	cmp.l	(-$003e,a6),d0
	bne	L000444
	bra	L0004b2

L000444:
	move.l	(-$003e,a6),d0
	subq.l	#1,d0
	movea.l	d0,a0
	clr.b	(a0)
	move.l	#$00000010,-(a7)
	move.l	a6,d0
	add.l	#$fffffec2,d0
	move.l	d0,-(a7)
	move.l	a6,d0
	add.l	#$ffffffca,d0
	move.l	d0,-(a7)
	jsr	(L0058d2)
	lea.l	($000c,a7),a7
	tst.l	d0
	bge	L00047c
	moveq.l	#$ff,d0
	bra	L00055a

L00047c:
	bra	L00052a

L000480:
	move.l	a6,d0
	add.l	#$fffffec2,d0
	move.l	d0,-(a7)
	move.l	#L0089f8,-(a7)
	jsr	(L005c0c)
	addq.l	#8,a7
	move.l	#L007852,-(a7)
	move.l	#L0076ba,-(a7)
	jsr	(L005c0c)
	addq.l	#8,a7
	clr.l	d0
	bra	L00055a

L0004b2:
	move.l	(-$003e,a6),d0
	subq.l	#1,d0
	movea.l	d0,a0
	clr.b	(a0)
	move.b	(-$013c,a6),d0
	andi.l	#$000000ff,d0
	tst.l	d0
	bne	L0004fe
	move.l	a6,d0
	add.l	#$fffffec2,d0
	move.l	d0,-(a7)
	move.l	#L0089f8,-(a7)
	jsr	(L005c0c)
	addq.l	#8,a7
	clr.b	(L0089fa)
	move.l	(-$003e,a6),-(a7)
	move.l	#L0076ba,-(a7)
	jsr	(L005c0c)
	addq.l	#8,a7
	clr.l	d0
	bra	L00055a

L0004fe:
	move.l	#$00000010,-(a7)
	move.l	a6,d0
	add.l	#$fffffec2,d0
	move.l	d0,-(a7)
	move.l	a6,d0
	add.l	#$ffffffca,d0
	move.l	d0,-(a7)
	jsr	(L0058d2)
	lea.l	($000c,a7),a7
	tst.l	d0
	bge	L00052a
	moveq.l	#$ff,d0
	bra	L00055a

L00052a:
	move.l	a6,d0
	add.l	#$fffffec2,d0
	move.l	d0,-(a7)
	move.l	#L0089f8,-(a7)
	jsr	(L005c0c)
	addq.l	#8,a7
	move.l	(-$003e,a6),-(a7)
	move.l	#L0076ba,-(a7)
	jsr	(L005c0c)
	addq.l	#8,a7
	clr.l	d0
	bra.w	L00055a

L00055a:
	unlk	a6
	rts

L00055e:
	link.w	a6,#-$013e
	bra	L000302

L000566:
	bra	L0006ac

L00056a:
	clr.l	(-$0004,a6)
	move.l	($0008,a6),d0
	movea.l	d0,a0
	move.b	(a0),d0
	ext.w	d0
	ext.l	d0
	bra	L000660

L00057e:
	move.l	#$00000001,(L0076f2)
	bra	L0006a0

L00058c:
	move.l	#$00000001,(L0076f6)
	bra	L0006a0

L00059a:
	move.l	#$00000001,(L0076fe)
	bra	L0006a0

L0005a8:
	move.l	($0008,a6),d0
	addq.l	#1,d0
	movea.l	d0,a0
	move.b	(a0),d0
	ext.w	d0
	ext.l	d0
	tst.l	d0
	bne	L0005c6
	move.l	#$ffffffff,(-$0004,a6)
	bra	L0006a0

L0005c6:
	move.l	($0008,a6),d0
	movea.l	d0,a0
	move.b	(a0),d0
	ext.w	d0
	ext.l	d0
	bra	L000634

L0005d4:
	move.l	#$00000001,(L0076fa)
	move.l	($0008,a6),-(a7)
	addq.l	#1,(a7)
	move.l	#L0076da,-(a7)
	jsr	(L005c0c)
	addq.l	#8,a7
	bra	L00065e

L0005f4:
	move.l	#L00771e,-(a7)
	move.l	($0008,a6),-(a7)
	addq.l	#1,(a7)
	jsr	(L0007be)
	addq.l	#8,a7
	move.l	d0,(-$0004,a6)
	bra	L00065e

L00060e:
	move.l	#L007722,-(a7)
	move.l	($0008,a6),-(a7)
	addq.l	#1,(a7)
	jsr	(L0006b4)
	addq.l	#8,a7
	move.l	d0,(-$0004,a6)
	bra	L00065e

L000628:
	move.l	#$ffffffff,(-$0004,a6)
	bra	L00065e

L000632:
	bra	L00065e

L000634:
	cmpi.l	#$00000040,d0
	beq	L0005d4
	cmpi.l	#$00000044,d0
	beq	L0005f4
	cmpi.l	#$00000054,d0
	beq	L00060e
	cmpi.l	#$00000064,d0
	beq	L0005f4
	cmpi.l	#$00000074,d0
	beq	L00060e
	bra	L000628

L00065e:
	bra	L0006a0

L000660:
	cmpi.l	#$00000041,d0
	beq	L00058c
	cmpi.l	#$00000049,d0
	beq	L00059a
	cmpi.l	#$00000053,d0
	beq	L00057e
	cmpi.l	#$00000061,d0
	beq	L00058c
	cmpi.l	#$00000069,d0
	beq	L00059a
	cmpi.l	#$00000073,d0
	beq	L00057e
	bra	L0005a8

L0006a0:
	move.l	(-$0004,a6),d0
	bra.w	L0006a8

L0006a8:
	unlk	a6
	rts

L0006ac:
	link.w	a6,#-$0004
	bra	L00056a

L0006b4:
	bra	L0007b6

L0006b8:
	move.l	($0008,a6),d0
	movea.l	d0,a0
	move.b	(a0),d0
	ext.w	d0
	ext.l	d0
	tst.l	d0
	beq	L0006dc
	move.l	($0008,a6),d0
	movea.l	d0,a0
	move.b	(a0),d0
	ext.w	d0
	ext.l	d0
	cmp.l	#$0000002a,d0
	bne	L0006f0
L0006dc:
	move.l	($000c,a6),d0
	movea.l	d0,a0
	move.l	#$0000f800,d0
	move.w	d0,(a0)
	clr.l	d0
	bra	L0007b2

L0006f0:
	move.l	a6,d0
	add.l	#$fffffff0,d0
	move.l	d0,-(a7)
	move.l	a6,d0
	add.l	#$fffffff4,d0
	move.l	d0,-(a7)
	move.l	a6,d0
	add.l	#$fffffff8,d0
	move.l	d0,-(a7)
	move.l	#L007856,-(a7)
	move.l	($0008,a6),-(a7)
	jsr	(L005b9a)
	lea.l	($0014,a7),a7
	move.l	d0,(-$0004,a6)
	move.l	(-$0004,a6),d0
	cmp.l	#$00000002,d0
	bge	L000736
	moveq.l	#$ff,d0
	bra	L0007b2

L000736:
	move.l	(-$0004,a6),d0
	cmp.l	#$00000002,d0
	bne	L000746
	clr.l	(-$0010,a6)
L000746:
	move.l	(-$0010,a6),d0
	lsr.l	#1,d0
	move.l	d0,(-$0010,a6)
	move.l	(-$0008,a6),d0
	moveq.l	#$0b,d1
	lsl.l	d1,d0
	move.l	d0,(-$0008,a6)
	move.l	(-$000c,a6),d0
	lsl.l	#5,d0
	move.l	d0,(-$000c,a6)
	move.l	#$0000f800,d0
	and.l	d0,(-$0008,a6)
	move.l	#$000007e0,d0
	and.l	d0,(-$000c,a6)
	moveq.l	#$1f,d0
	and.l	d0,(-$0010,a6)
	move.l	($000c,a6),d0
	movea.l	d0,a0
	clr.w	(a0)
	move.l	($000c,a6),d0
	movea.l	d0,a0
	move.l	(-$0008,a6),d1
	or.w	d1,(a0)
	move.l	($000c,a6),d0
	movea.l	d0,a0
	move.l	(-$000c,a6),d1
	or.w	d1,(a0)
	move.l	($000c,a6),d0
	movea.l	d0,a0
	move.l	(-$0010,a6),d1
	or.w	d1,(a0)
	clr.l	d0
	bra.w	L0007b2

L0007b2:
	unlk	a6
	rts

L0007b6:
	link.w	a6,#-$0010
	bra	L0006b8

L0007be:
	bra	L000914

L0007c2:
	move.l	($0008,a6),d0
	movea.l	d0,a0
	move.b	(a0),d0
	ext.w	d0
	ext.l	d0
	tst.l	d0
	beq	L0007e6
	move.l	($0008,a6),d0
	movea.l	d0,a0
	move.b	(a0),d0
	ext.w	d0
	ext.l	d0
	cmp.l	#$0000002a,d0
	bne	L0007fa
L0007e6:
	move.l	($000c,a6),d0
	movea.l	d0,a0
	move.l	#$0000fe00,d0
	move.w	d0,(a0)
	clr.l	d0
	bra	L000910

L0007fa:
	move.l	($0008,a6),d0
	addq.l	#2,d0
	movea.l	d0,a0
	move.b	(a0),d0
	ext.w	d0
	ext.l	d0
	cmp.l	#$0000002d,d0
	bne	L000848
	move.l	a6,d0
	add.l	#$fffffff0,d0
	move.l	d0,-(a7)
	move.l	a6,d0
	add.l	#$fffffff4,d0
	move.l	d0,-(a7)
	move.l	a6,d0
	add.l	#$fffffff8,d0
	move.l	d0,-(a7)
	move.l	#L007862,-(a7)
	move.l	($0008,a6),-(a7)
	jsr	(L005b9a)
	lea.l	($0014,a7),a7
	move.l	d0,(-$0004,a6)
	bra	L00087e

L000848:
	move.l	a6,d0
	add.l	#$fffffff0,d0
	move.l	d0,-(a7)
	move.l	a6,d0
	add.l	#$fffffff4,d0
	move.l	d0,-(a7)
	move.l	a6,d0
	add.l	#$fffffff8,d0
	move.l	d0,-(a7)
	move.l	#L00786e,-(a7)
	move.l	($0008,a6),-(a7)
	jsr	(L005b9a)
	lea.l	($0014,a7),a7
	move.l	d0,(-$0004,a6)
L00087e:
	move.l	(-$0004,a6),d0
	cmp.l	#$00000003,d0
	beq	L000890
	moveq.l	#$ff,d0
	bra	L000910

L000890:
	move.l	(-$0008,a6),d0
	cmp.l	#$000007bc,d0
	bcs	L0008a6
	subi.l	#$000007bc,(-$0008,a6)
	bra	L0008ae

L0008a6:
	subi.l	#$00000050,(-$0008,a6)
L0008ae:
	move.l	(-$0008,a6),d0
	moveq.l	#$09,d1
	lsl.l	d1,d0
	move.l	d0,(-$0008,a6)
	move.l	(-$000c,a6),d0
	lsl.l	#5,d0
	move.l	d0,(-$000c,a6)
	move.l	#$0000fe00,d0
	and.l	d0,(-$0008,a6)
	move.l	#$000001e0,d0
	and.l	d0,(-$000c,a6)
	moveq.l	#$1f,d0
	and.l	d0,(-$0010,a6)
	move.l	($000c,a6),d0
	movea.l	d0,a0
	clr.w	(a0)
	move.l	($000c,a6),d0
	movea.l	d0,a0
	move.l	(-$0008,a6),d1
	or.w	d1,(a0)
	move.l	($000c,a6),d0
	movea.l	d0,a0
	move.l	(-$000c,a6),d1
	or.w	d1,(a0)
	move.l	($000c,a6),d0
	movea.l	d0,a0
	move.l	(-$0010,a6),d1
	or.w	d1,(a0)
	clr.l	d0
	bra.w	L000910

L000910:
	unlk	a6
	rts

L000914:
	link.w	a6,#-$0010
	bra	L0007c2

L00091c:
	bra	L0009f4

L000920:
	jsr	(L005820)
	clr.l	-(a7)
	jsr	(L005808)
	addq.l	#4,a7
	move.l	d0,(-$0008,a6)
	move.l	#$0000001a,-(a7)
	jsr	(L0057fc)
	addq.l	#4,a7
	move.l	#$00000001,-(a7)
	move.l	#$00000001,-(a7)
	move.l	#$00000050,-(a7)
	move.l	#$00000001,-(a7)
	move.l	#$00000001,-(a7)
	jsr	(L004984)
	lea.l	($0014,a7),a7
	move.l	d0,(L0089f4)
	move.l	#L0078a2,-(a7)
	move.l	(L0089f4),-(a7)
	jsr	(L004ebc)
	addq.l	#8,a7
	jsr	(L0009fc)
	move.l	d0,(-$0004,a6)
	bge	L0009bc
	move.l	(-$0004,a6),d0
	moveq.l	#$ff,d1
	movem.l	d0-d1,-(a7)
	FPACK	__CLMUL
	movem.l	(a7)+,d0-d1
	move.l	d0,(-$0004,a6)
	move.l	(-$0004,a6),d0
	asl.l	#2,d0
	add.l	#L0074da,d0
	movea.l	d0,a0
	move.l	(a0),-(a7)
	jsr	(L004cb2)
	addq.l	#4,a7
L0009bc:
	move.l	(L0089f4),-(a7)
	jsr	(L004afe)
	addq.l	#4,a7
	move.l	(-$0008,a6),-(a7)
	jsr	(L005808)
	addq.l	#4,a7
	jsr	(L005816)
	move.l	#$0000001a,-(a7)
	jsr	(L0057fc)
	addq.l	#4,a7
	jsr	(L0058fe)
	unlk	a6
	rts

L0009f4:
	link.w	a6,#-$0008
	bra	L000920

L0009fc:
	bra	L0011d8

L000a00:
	jsr	(L003756)
	move.l	d0,(-$0208,a6)
	jsr	(L00133e)
	clr.l	(-$021c,a6)
	move.l	#$00000002,-(a7)
	move.l	#$00000004,-(a7)
	move.l	#$00000021,-(a7)
	move.l	#$00000005,-(a7)
	move.l	#$00000005,-(a7)
	jsr	(L004984)
	lea.l	($0014,a7),a7
	move.l	d0,(L008af8)
L000a42:
	move.l	#$00000001,-(a7)
	move.l	#$00000002,-(a7)
	move.l	#$00000032,-(a7)
	move.l	#$0000001b,-(a7)
	move.l	#$00000014,-(a7)
	jsr	(L004984)
	lea.l	($0014,a7),a7
	move.l	d0,(L0089f0)
	move.l	#L00799d,-(a7)
	move.l	(L0089f0),-(a7)
	jsr	(L004ebc)
	addq.l	#8,a7
	clr.l	-(a7)
	move.l	(L0089f0),-(a7)
	jsr	(L0011e0)
	addq.l	#8,a7
	move.l	#$00000001,-(a7)
	move.l	#L00787a,-(a7)
	move.l	(L008af8),-(a7)
	jsr	(L0047e4)
	lea.l	($000c,a7),a7
	move.l	d0,(-$0210,a6)
	move.l	(L0089f0),-(a7)
	jsr	(L004afe)
	addq.l	#4,a7
	move.l	(-$0210,a6),d0
	blt	L000ad4
	move.l	(-$0210,a6),d0
	cmp.l	#$00000003,d0
	bne	L000ae8
L000ad4:
	move.l	(L008af8),-(a7)
	jsr	(L004afe)
	addq.l	#4,a7
	moveq.l	#$f5,d0
	bra	L0011d4

L000ae8:
	move.l	#$00000002,-(a7)
	move.l	#$00000005,-(a7)
	move.l	#$0000000f,-(a7)
	move.l	#$00000007,-(a7)
	move.l	#$00000008,-(a7)
	jsr	(L004984)
	lea.l	($0014,a7),a7
	move.l	d0,(L008afc)
L000b16:
	move.l	#$00000001,-(a7)
	move.l	#$00000002,-(a7)
	move.l	#$00000032,-(a7)
	move.l	#$0000001b,-(a7)
	move.l	#$00000014,-(a7)
	jsr	(L004984)
	lea.l	($0014,a7),a7
	move.l	d0,(L0089f0)
	move.l	#L0079c4,-(a7)
	move.l	(L0089f0),-(a7)
	jsr	(L004ebc)
	addq.l	#8,a7
	move.l	#$00000001,-(a7)
	move.l	(L0089f0),-(a7)
	jsr	(L0011e0)
	addq.l	#8,a7
	move.l	#$00000001,-(a7)
	move.l	(-$0208,a6),-(a7)
	move.l	(L008afc),-(a7)
	jsr	(L0042b4)
	lea.l	($000c,a7),a7
	move.l	d0,(-$0214,a6)
	move.l	(L0089f0),-(a7)
	jsr	(L004afe)
	addq.l	#4,a7
	move.l	(-$0214,a6),d0
	bge	L000bb0
	move.l	(L008afc),-(a7)
	jsr	(L004afe)
	addq.l	#4,a7
	bra	L000a42

L000bb0:
	move.l	(-$0214,a6),d0
	asl.l	#2,d0
	add.l	(-$0208,a6),d0
	movea.l	d0,a0
	move.l	(a0),d0
	subq.l	#1,d0
	movea.l	d0,a0
	move.b	(a0),d0
	andi.l	#$000000ff,d0
	moveq.l	#$41,d1			;'A'
	sub.l	d1,d0
	move.l	d0,(-$0214,a6)
	move.l	#$00000002,-(a7)
	move.l	#$00000005,-(a7)
	move.l	#$0000000f,-(a7)
	move.l	#$00000009,-(a7)
	move.l	#$0000000b,-(a7)
	jsr	(L004984)
	lea.l	($0014,a7),a7
	move.l	d0,(L008b00)
L000c00:
	move.l	#$00000001,-(a7)
	move.l	#$00000002,-(a7)
	move.l	#$00000032,-(a7)
	move.l	#$0000001b,-(a7)
	move.l	#$00000014,-(a7)
	jsr	(L004984)
	lea.l	($0014,a7),a7
	move.l	d0,(L0089f0)
	move.l	#L0079f3,-(a7)
	move.l	(L0089f0),-(a7)
	jsr	(L004ebc)
	addq.l	#8,a7
	move.l	#$00000001,-(a7)
	move.l	(L0089f0),-(a7)
	jsr	(L0011e0)
	addq.l	#8,a7
	move.l	#$00000001,-(a7)
	move.l	(-$0208,a6),-(a7)
	move.l	(L008b00),-(a7)
	jsr	(L0042b4)
	lea.l	($000c,a7),a7
	move.l	d0,(-$0218,a6)
	move.l	(L0089f0),-(a7)
	jsr	(L004afe)
	addq.l	#4,a7
	move.l	(-$0218,a6),d0
	bge	L000c9a
	move.l	(L008b00),-(a7)
	jsr	(L004afe)
	addq.l	#4,a7
	bra	L000b16

L000c9a:
	move.l	(-$0218,a6),d0
	asl.l	#2,d0
	add.l	(-$0208,a6),d0
	movea.l	d0,a0
	move.l	(a0),d0
	subq.l	#1,d0
	movea.l	d0,a0
	move.b	(a0),d0
	andi.l	#$000000ff,d0
	moveq.l	#$41,d1			;'A'
	sub.l	d1,d0
	addq.l	#1,d0
	move.l	d0,(L008b08)
L000cc0:
	move.l	(-$0214,a6),-(a7)
	jsr	(L001b94)
	addq.l	#4,a7
	move.l	d0,(-$0204,a6)
	move.l	(-$0204,a6),d0
	bne	L000cda
	bra	L000c00

L000cda:
	move.l	(-$0204,a6),-(a7)
	move.l	a6,d0
	add.l	#$ffffff00,d0
	move.l	d0,-(a7)
	jsr	(L005c0c)
	addq.l	#8,a7
	move.l	(-$0210,a6),d0
	cmp.l	#$00000002,d0
	bne	L000dd4
	move.l	#L00804c,-(a7)
	move.l	a6,d0
	add.l	#$ffffff00,d0
	move.l	d0,-(a7)
	jsr	(L001e9c)
	addq.l	#8,a7
	tst.l	d0
	beq	L000d1c
	bra	L000cc0

L000d1c:
	clr.l	(-$020c,a6)
	move.l	#$00000002,-(a7)
	move.l	#$00000008,-(a7)
	move.l	#$00000046,-(a7)
	move.l	#$0000000b,-(a7)
	move.l	#$0000000e,-(a7)
	jsr	(L004984)
	lea.l	($0014,a7),a7
	move.l	d0,(L008eaa)
L000d4e:
	move.l	(-$020c,a6),d0
	cmp.l	#$00000041,d0
	bge	L000db8
	move.l	(-$020c,a6),d0
	moveq.l	#$17,d1
	movem.l	d0-d1,-(a7)
	FPACK	__CLMUL
	movem.l	(a7)+,d0-d1
	add.l	#L00804c,d0
	movea.l	d0,a0
	move.b	(a0),d0
	andi.l	#$000000ff,d0
	tst.l	d0
	bne	L000d80
	bra	L000db8

L000d80:
	move.l	(-$020c,a6),d0
	moveq.l	#$17,d1
	movem.l	d0-d1,-(a7)
	FPACK	__CLMUL
	movem.l	(a7)+,d0-d1
	add.l	#L00804c,d0
	move.l	d0,-(a7)
	move.l	a6,d0
	add.l	#$ffffff00,d0
	move.l	d0,-(a7)
	jsr	(L002ab8)
	addq.l	#8,a7
	move.l	d0,(-$021c,a6)
	bge	L000db2
	bra	L000db8

L000db2:
	addq.l	#1,(-$020c,a6)
	bra	L000d4e

L000db8:
	clr.l	-(a7)
	jsr	(L002fce)
	addq.l	#4,a7
	move.l	(L008eaa),-(a7)
	jsr	(L004afe)
	addq.l	#4,a7
	bra	L00118a

L000dd4:
	move.l	(-$0210,a6),d0
	bne	L000de6
	move.l	#$00000001,(L0076f2)
	bra	L000dec

L000de6:
	clr.l	(L0076f2)
L000dec:
	move.l	#$00000002,-(a7)
	move.l	#$00000004,-(a7)
	move.l	#$00000014,-(a7)
	move.l	#$0000000b,-(a7)
	move.l	#$0000000e,-(a7)
	jsr	(L004984)
	lea.l	($0014,a7),a7
	move.l	d0,(L008b04)
L000e1a:
	move.l	#$00000001,-(a7)
	move.l	#$00000002,-(a7)
	move.l	#$00000032,-(a7)
	move.l	#$0000001b,-(a7)
	move.l	#$00000014,-(a7)
	jsr	(L004984)
	lea.l	($0014,a7),a7
	move.l	d0,(L0089f0)
	move.l	#L007a22,-(a7)
	move.l	(L0089f0),-(a7)
	jsr	(L004ebc)
	addq.l	#8,a7
	move.l	#$00000001,-(a7)
	move.l	(L0089f0),-(a7)
	jsr	(L0011e0)
	addq.l	#8,a7
	move.l	#$00000001,-(a7)
	move.l	#L00788e,-(a7)
	move.l	(L008b04),-(a7)
	jsr	(L0047e4)
	lea.l	($000c,a7),a7
	move.l	d0,(-$020c,a6)
	move.l	(L0089f0),-(a7)
	jsr	(L004afe)
	addq.l	#4,a7
	move.l	(-$020c,a6),d0
	bge	L000eb6
	move.l	(L008b04),-(a7)
	jsr	(L004afe)
	addq.l	#4,a7
	bra	L000c00

L000eb6:
	move.l	(-$020c,a6),d0
	bra	L0010f2

L000ebe:
	move.l	#$00000001,-(a7)
	move.l	#$00000001,-(a7)
	move.l	#$0000003c,-(a7)
	move.l	#$0000000f,-(a7)
	move.l	#$0000000a,-(a7)
	jsr	(L004984)
	lea.l	($0014,a7),a7
	move.l	d0,(L0089f0)
L000eec:
	move.l	#L007a53,-(a7)
	move.l	(L0089f0),-(a7)
	jsr	(L004ebc)
	addq.l	#8,a7
	move.l	a6,d0
	add.l	#$fffffe00,d0
	move.l	d0,-(a7)
	move.l	(L0089f0),-(a7)
	jsr	(L0037b8)
	addq.l	#8,a7
	tst.l	d0
	bge	L000f20
	bra	L000fb8

L000f20:
	move.l	#L00771e,-(a7)
	move.l	a6,d0
	add.l	#$fffffe00,d0
	move.l	d0,-(a7)
	jsr	(L0007be)
	addq.l	#8,a7
	tst.l	d0
	beq	L000f4c
	move.l	(L0089f0),-(a7)
	jsr	(L004dce)
	addq.l	#4,a7
	bra	L000eec

L000f4c:
	move.l	(L0089f0),-(a7)
	jsr	(L0040d2)
	addq.l	#4,a7
L000f5a:
	move.l	#L007a6d,-(a7)
	move.l	(L0089f0),-(a7)
	jsr	(L004ebc)
	addq.l	#8,a7
	move.l	a6,d0
	add.l	#$fffffe00,d0
	move.l	d0,-(a7)
	move.l	(L0089f0),-(a7)
	jsr	(L0037b8)
	addq.l	#8,a7
	tst.l	d0
	bge	L000f8c
	bra	L000fb8

L000f8c:
	move.l	#L007720,-(a7)
	move.l	a6,d0
	add.l	#$fffffe00,d0
	move.l	d0,-(a7)
	jsr	(L0007be)
	addq.l	#8,a7
	tst.l	d0
	beq	L000fb8
	move.l	(L0089f0),-(a7)
	jsr	(L004dce)
	addq.l	#4,a7
	bra	L000f5a

L000fb8:
	move.l	(L0089f0),-(a7)
	jsr	(L004afe)
	addq.l	#4,a7
	bra	L001114

L000fca:
	move.l	#$00000001,-(a7)
	move.l	#$00000001,-(a7)
	move.l	#$0000003c,-(a7)
	move.l	#$0000000f,-(a7)
	move.l	#$0000000a,-(a7)
	jsr	(L004984)
	lea.l	($0014,a7),a7
	move.l	d0,(L0089f0)
L000ff8:
	move.l	#L007a87,-(a7)
	move.l	(L0089f0),-(a7)
	jsr	(L004ebc)
	addq.l	#8,a7
	move.l	a6,d0
	add.l	#$fffffe00,d0
	move.l	d0,-(a7)
	move.l	(L0089f0),-(a7)
	jsr	(L0037b8)
	addq.l	#8,a7
	tst.l	d0
	bge	L00102c
	bra	L0010c4

L00102c:
	move.l	#L007722,-(a7)
	move.l	a6,d0
	add.l	#$fffffe00,d0
	move.l	d0,-(a7)
	jsr	(L0006b4)
	addq.l	#8,a7
	tst.l	d0
	beq	L001058
	move.l	(L0089f0),-(a7)
	jsr	(L004dce)
	addq.l	#4,a7
	bra	L000ff8

L001058:
	move.l	(L0089f0),-(a7)
	jsr	(L0040d2)
	addq.l	#4,a7
L001066:
	move.l	#L007aa1,-(a7)
	move.l	(L0089f0),-(a7)
	jsr	(L004ebc)
	addq.l	#8,a7
	move.l	a6,d0
	add.l	#$fffffe00,d0
	move.l	d0,-(a7)
	move.l	(L0089f0),-(a7)
	jsr	(L0037b8)
	addq.l	#8,a7
	tst.l	d0
	bge	L001098
	bra	L0010c4

L001098:
	move.l	#L007724,-(a7)
	move.l	a6,d0
	add.l	#$fffffe00,d0
	move.l	d0,-(a7)
	jsr	(L0006b4)
	addq.l	#8,a7
	tst.l	d0
	beq	L0010c4
	move.l	(L0089f0),-(a7)
	jsr	(L004dce)
	addq.l	#4,a7
	bra	L001066

L0010c4:
	move.l	(L0089f0),-(a7)
	jsr	(L004afe)
	addq.l	#4,a7
	bra	L001114

L0010d4:
	move.l	(L008b04),-(a7)
	jsr	(L004afe)
	addq.l	#4,a7
	move.l	#$fffffff5,(-$021c,a6)
	bra	L00118a

L0010ee:
	bra	L001118

L0010f0:
	bra	L001114

L0010f2:
	subq.l	#1,d0
	cmpi.l	#$00000002,d0
	bhi	L0010ee
	asl.l	#2,d0
	lea.l	(L001108,pc),a0
	movea.l	(a0,d0.l),a0
	jmp	(a0)

L001108:
	.dc.l	L000ebe
	.dc.l	L000fca
	.dc.l	L0010d4
L001114:
	bra	L000e1a

L001118:
	move.l	(L008b04),-(a7)
	jsr	(L004afe)
	addq.l	#4,a7
	move.l	#$00000002,-(a7)
	move.l	#$00000008,-(a7)
	move.l	#$00000046,-(a7)
	move.l	#$0000000b,-(a7)
	move.l	#$0000000e,-(a7)
	jsr	(L004984)
	lea.l	($0014,a7),a7
	move.l	d0,(L008eaa)
	move.l	#L007abb,-(a7)
	move.l	a6,d0
	add.l	#$ffffff00,d0
	move.l	d0,-(a7)
	jsr	(L002ab8)
	addq.l	#8,a7
	move.l	d0,(-$021c,a6)
	blt	L00117c
	clr.l	-(a7)
	jsr	(L002fce)
	addq.l	#4,a7
L00117c:
	move.l	(L008eaa),-(a7)
	jsr	(L004afe)
	addq.l	#4,a7
L00118a:
	move.l	(L008b00),-(a7)
	jsr	(L004afe)
	addq.l	#4,a7
	move.l	(L008afc),-(a7)
	jsr	(L004afe)
	addq.l	#4,a7
	move.l	(L008af8),-(a7)
	jsr	(L004afe)
	addq.l	#4,a7
	move.l	(-$021c,a6),d0
	bge	L0011c2
	move.l	(-$021c,a6),d0
	bra	L0011d4

L0011c0:
	bra	L0011d4

L0011c2:
	move.l	(L0074da),-(a7)
	jsr	(L004cb2)
	addq.l	#4,a7
	bra	L000a00

L0011d4:
	unlk	a6
	rts

L0011d8:
	link.w	a6,#-$021c
	bra	L000a00

L0011e0:
	bra	L001336

L0011e4:
	move.l	#$00000001,-(a7)
	move.l	($0008,a6),-(a7)
	jsr	(L004198)
	addq.l	#8,a7
	move.l	d0,(-$0004,a6)
	move.l	#L007abf,-(a7)
	move.l	($0008,a6),-(a7)
	jsr	(L004ebc)
	addq.l	#8,a7
	move.l	(-$0004,a6),-(a7)
	move.l	($0008,a6),-(a7)
	jsr	(L004198)
	addq.l	#8,a7
	move.l	#L007ac3,-(a7)
	move.l	($0008,a6),-(a7)
	jsr	(L004ebc)
	addq.l	#8,a7
	move.l	#$00000001,-(a7)
	move.l	($0008,a6),-(a7)
	jsr	(L004198)
	addq.l	#8,a7
	move.l	d0,(-$0004,a6)
	move.l	#L007acd,-(a7)
	move.l	($0008,a6),-(a7)
	jsr	(L004ebc)
	addq.l	#8,a7
	move.l	(-$0004,a6),-(a7)
	move.l	($0008,a6),-(a7)
	jsr	(L004198)
	addq.l	#8,a7
	move.l	#L007acf,-(a7)
	move.l	($0008,a6),-(a7)
	jsr	(L004ebc)
	addq.l	#8,a7
	move.l	($000c,a6),d0
	cmp.l	#$00000001,d0
	ble	L0012ce
	move.l	#$00000001,-(a7)
	move.l	($0008,a6),-(a7)
	jsr	(L004198)
	addq.l	#8,a7
	move.l	d0,(-$0004,a6)
	move.l	#L007ad9,-(a7)
	move.l	($0008,a6),-(a7)
	jsr	(L004ebc)
	addq.l	#8,a7
	move.l	(-$0004,a6),-(a7)
	move.l	($0008,a6),-(a7)
	jsr	(L004198)
	addq.l	#8,a7
	move.l	#L007adb,-(a7)
	move.l	($0008,a6),-(a7)
	jsr	(L004ebc)
	addq.l	#8,a7
L0012ce:
	move.l	#$00000001,-(a7)
	move.l	($0008,a6),-(a7)
	jsr	(L004198)
	addq.l	#8,a7
	move.l	d0,(-$0004,a6)
	move.l	#L007ae5,-(a7)
	move.l	($0008,a6),-(a7)
	jsr	(L004ebc)
	addq.l	#8,a7
	move.l	(-$0004,a6),-(a7)
	move.l	($0008,a6),-(a7)
	jsr	(L004198)
	addq.l	#8,a7
	move.l	($000c,a6),d0
	beq	L001320
	move.l	#L007ae7,-(a7)
	move.l	($0008,a6),-(a7)
	jsr	(L004ebc)
	addq.l	#8,a7
	bra	L001332

L001320:
	move.l	#L007af4,-(a7)
	move.l	($0008,a6),-(a7)
	jsr	(L004ebc)
	addq.l	#8,a7
L001332:
	unlk	a6
	rts

L001336:
	link.w	a6,#-$0004
	bra	L0011e4

L00133e:
	bra	L001374

L001340:
	move.l	#$0000fe00,d0
	move.w	d0,(L00771e)
	move.l	#$0000fe00,d0
	move.w	d0,(L007720)
	move.l	#$0000f800,d0
	move.w	d0,(L007722)
	move.l	#$0000f800,d0
	move.w	d0,(L007724)
	unlk	a6
	rts

L001374:
	link.w	a6,#$0000
	bra	L001340

L00137a:
	bra	L001694

L00137e:
	move.l	($000c,a6),d0
	beq	L001398
	clr.l	(L007b32)
	clr.l	(L007b36)
	move.l	($000c,a6),(L00862c)
L001398:
	move.l	($0014,a6),d0
	moveq.l	#$20,d1			;' '
	sub.l	d1,d0
	cmp.l	($0010,a6),d0
	bcc	L0013ae
	clr.l	($0010,a6)
	bra	L001672

L0013ae:
	move.l	(L007b36),d0
	cmp.l	#$000007ff,d0
	ble	L0013c4
	clr.l	($0010,a6)
	bra	L001672

L0013c4:
	move.l	(L007b32),d0
	cmp.l	($0018,a6),d0
	blt	L0013d4
	bra	L001672

L0013d4:
	move.l	($0010,a6),d0
	movea.l	d0,a0
	clr.b	(a0)
	move.l	($0008,a6),-(a7)
	move.l	a6,d0
	add.l	#$ffffff80,d0
	move.l	d0,-(a7)
	jsr	(L005c0c)
	addq.l	#8,a7
	move.l	#L007b02,-(a7)
	move.l	a6,d0
	add.l	#$ffffff80,d0
	move.l	d0,-(a7)
	jsr	(L005bde)
	addq.l	#8,a7
	move.l	#$00000010,-(a7)
	move.l	a6,d0
	add.l	#$ffffff80,d0
	move.l	d0,-(a7)
	move.l	a6,d0
	add.l	#$ffffff4a,d0
	move.l	d0,-(a7)
	jsr	(L0058d2)
	lea.l	($000c,a7),a7
	tst.l	d0
	bge	L001436
	bra	L001672

L001436:
	move.l	#L007bb8,-(a7)
	move.l	a6,d0
	add.l	#$ffffff68,d0
	move.l	d0,-(a7)
	jsr	(L005bf2)
	addq.l	#8,a7
	tst.l	d0
	beq	L001548
	move.l	#L007bba,-(a7)
	move.l	a6,d0
	add.l	#$ffffff68,d0
	move.l	d0,-(a7)
	jsr	(L005bf2)
	addq.l	#8,a7
	tst.l	d0
	beq	L001548
	addq.l	#1,(L007b32)
	move.l	a6,d0
	add.l	#$ffffff68,d0
	move.l	d0,-(a7)
	move.l	($0008,a6),-(a7)
	jsr	(L005c1a)
	addq.l	#4,a7
	add.l	a6,d0
	add.l	#$ffffff81,d0
	move.l	d0,-(a7)
	jsr	(L005c0c)
	addq.l	#8,a7
	move.l	a6,d0
	add.l	#$ffffff68,d0
	move.l	d0,-(a7)
	move.l	($0010,a6),-(a7)
	jsr	(L005c0c)
	addq.l	#8,a7
	move.l	(L00862c),d0
	movea.l	d0,a0
	move.l	(L007b32),d1
	move.w	d1,(a0)
	move.l	(L00862c),d0
	addq.l	#2,d0
	movea.l	d0,a0
	move.l	($0010,a6),(a0)
	addi.l	#$0000000a,(L00862c)
	addq.l	#1,(L007b36)
	move.l	($0014,a6),d0
	moveq.l	#$20,d1			;' '
	sub.l	d1,d0
	cmp.l	($0010,a6),d0
	bcc	L0014fa
	clr.l	($0010,a6)
	bra	L001672

L0014fa:
	move.l	a6,d0
	add.l	#$ffffff68,d0
	move.l	d0,-(a7)
	jsr	(L005c1a)
	addq.l	#4,a7
	addq.l	#1,d0
	add.l	d0,($0010,a6)
	move.l	($0018,a6),-(a7)
	move.l	($0014,a6),-(a7)
	move.l	($0010,a6),-(a7)
	clr.l	-(a7)
	move.l	a6,d0
	add.l	#$ffffff80,d0
	move.l	d0,-(a7)
	jsr	(L00137a)
	lea.l	($0014,a7),a7
	move.l	d0,($0010,a6)
	move.l	($0010,a6),d0
	bne	L001542
	bra	L001672

L001542:
	subq.l	#1,(L007b32)
L001548:
	move.l	a6,d0
	add.l	#$ffffff4a,d0
	move.l	d0,-(a7)
	jsr	(L0058e6)
	addq.l	#4,a7
	tst.l	d0
	blt	L001672
	move.l	#L007bbd,-(a7)
	move.l	a6,d0
	add.l	#$ffffff68,d0
	move.l	d0,-(a7)
	jsr	(L005bf2)
	addq.l	#8,a7
	tst.l	d0
	beq	L00166e
	move.l	#L007bbf,-(a7)
	move.l	a6,d0
	add.l	#$ffffff68,d0
	move.l	d0,-(a7)
	jsr	(L005bf2)
	addq.l	#8,a7
	tst.l	d0
	beq	L00166e
	addq.l	#1,(L007b32)
	move.l	a6,d0
	add.l	#$ffffff68,d0
	move.l	d0,-(a7)
	move.l	($0008,a6),-(a7)
	jsr	(L005c1a)
	addq.l	#4,a7
	add.l	a6,d0
	add.l	#$ffffff81,d0
	move.l	d0,-(a7)
	jsr	(L005c0c)
	addq.l	#8,a7
	move.l	a6,d0
	add.l	#$ffffff68,d0
	move.l	d0,-(a7)
	move.l	($0010,a6),-(a7)
	jsr	(L005c0c)
	addq.l	#8,a7
	move.l	(L00862c),d0
	movea.l	d0,a0
	move.l	(L007b32),d1
	move.w	d1,(a0)
	move.l	(L00862c),d0
	addq.l	#2,d0
	movea.l	d0,a0
	move.l	($0010,a6),(a0)
	addi.l	#$0000000a,(L00862c)
	addq.l	#1,(L007b36)
	move.l	($0014,a6),d0
	moveq.l	#$20,d1			;' '
	sub.l	d1,d0
	cmp.l	($0010,a6),d0
	bcc	L001622
	clr.l	($0010,a6)
	bra	L001672

L001622:
	move.l	a6,d0
	add.l	#$ffffff68,d0
	move.l	d0,-(a7)
	jsr	(L005c1a)
	addq.l	#4,a7
	addq.l	#1,d0
	add.l	d0,($0010,a6)
	move.l	($0018,a6),-(a7)
	move.l	($0014,a6),-(a7)
	move.l	($0010,a6),-(a7)
	clr.l	-(a7)
	move.l	a6,d0
	add.l	#$ffffff80,d0
	move.l	d0,-(a7)
	jsr	(L00137a)
	lea.l	($0014,a7),a7
	move.l	d0,($0010,a6)
	move.l	($0010,a6),d0
	bne	L001668
	bra	L001672

L001668:
	subq.l	#1,(L007b32)
L00166e:
	bra	L001548

L001672:
	move.l	(L00862c),d0
	movea.l	d0,a0
	clr.w	(a0)
	move.l	(L00862c),d0
	addq.l	#2,d0
	movea.l	d0,a0
	clr.l	(a0)
	move.l	($0010,a6),d0
	bra.w	L001690

L001690:
	unlk	a6
	rts

L001694:
	link.w	a6,#-$00b6
	bra	L00137e

L00169c:
	bra	L001832

L0016a0:
	move.l	($0014,a6),d0
	moveq.l	#$20,d1			;' '
	sub.l	d1,d0
	cmp.l	($0010,a6),d0
	bcc	L0016b4
	clr.l	d0
	bra	L00182e

L0016b4:
	move.l	($0008,a6),d0
	addq.l	#2,d0
	movea.l	d0,a0
	tst.l	(a0)
	bne	L0016c8
	move.l	($0010,a6),d0
	bra	L00182e

L0016c8:
	move.l	($0008,a6),d0
	movea.l	d0,a0
	move.w	(a0),(-$0006,a6)
	move.l	($000c,a6),-(a7)
	move.l	a6,d0
	add.l	#$ffffff76,d0
	move.l	d0,-(a7)
	jsr	(L005c0c)
	addq.l	#8,a7
	move.l	($0008,a6),(-$0004,a6)
L0016ee:
	clr.w	(-$0008,a6)
	addi.l	#$0000000a,(-$0004,a6)
	move.w	(-$0006,a6),d0
	ext.l	d0
	move.l	(-$0004,a6),d1
	movea.l	d1,a1
	move.w	(a1),d1
	ext.l	d1
	cmp.l	d1,d0
	bne	L001716
	moveq.l	#$01,d0
	move.w	d0,(-$0008,a6)
	bra	L00172a

L001716:
	move.w	(-$0006,a6),d0
	ext.l	d0
	move.l	(-$0004,a6),d1
	movea.l	d1,a1
	move.w	(a1),d1
	ext.l	d1
	cmp.l	d1,d0
	ble	L0016ee
L00172a:
	move.w	(-$0008,a6),d0
	beq	L001742
	move.l	#L007bc2,(-$008e,a6)
	move.l	#L007bc7,(-$0092,a6)
	bra	L001752

L001742:
	move.l	#L007bcc,(-$008e,a6)
	move.l	#L007bd1,(-$0092,a6)
L001752:
	move.l	($0008,a6),d0
	addq.l	#6,d0
	movea.l	d0,a0
	move.l	($0010,a6),(a0)
	move.l	($0008,a6),d0
	addq.l	#2,d0
	movea.l	d0,a0
	move.l	(a0),-(a7)
	move.l	(-$008e,a6),-(a7)
	move.l	($000c,a6),-(a7)
	move.l	#L007bd6,-(a7)
	move.l	($0010,a6),-(a7)
	jsr	(L005b68)
	lea.l	($0014,a7),a7
	move.w	d0,(-$000a,a6)
	move.l	($0014,a6),d0
	moveq.l	#$20,d1			;' '
	sub.l	d1,d0
	cmp.l	($0010,a6),d0
	bcc	L00179c
	clr.l	d0
	bra	L00182e

L00179c:
	move.w	(-$000a,a6),d0
	ext.l	d0
	add.l	d0,($0010,a6)
	move.l	($0010,a6),d0
	movea.l	d0,a0
	clr.b	(a0)
	addq.l	#1,($0010,a6)
	move.w	(-$0006,a6),d0
	ext.l	d0
	move.l	($0008,a6),d1
	add.l	#$0000000a,d1
	movea.l	d1,a1
	move.w	(a1),d1
	ext.l	d1
	cmp.l	d1,d0
	bge	L001816
	move.l	(-$0092,a6),-(a7)
	move.l	a6,d0
	add.l	#$ffffff76,d0
	move.l	d0,-(a7)
	jsr	(L005bde)
	addq.l	#8,a7
	move.l	($0014,a6),-(a7)
	move.l	($0010,a6),-(a7)
	move.l	a6,d0
	add.l	#$ffffff76,d0
	move.l	d0,-(a7)
	move.l	($0008,a6),-(a7)
	addi.l	#$0000000a,(a7)
	jsr	(L00169c)
	lea.l	($0010,a7),a7
	move.l	d0,($0010,a6)
	move.l	($0010,a6),d0
	bne	L001816
	clr.l	d0
	bra	L00182e

L001816:
	move.w	(-$0008,a6),d0
	beq	L001826
	move.l	(-$0004,a6),($0008,a6)
	bra	L0016c8

L001826:
	move.l	($0010,a6),d0
	bra.w	L00182e

L00182e:
	unlk	a6
	rts

L001832:
	link.w	a6,#-$0092
	bra	L0016a0

L00183a:
	bra	L00193a

L00183e:
	movea.l	($0008,a6),a5
	move.l	($000c,a6),d0
	bne	L00185e
	move.l	($0002,a5),-(a7)
	move.l	($0010,a6),-(a7)
	jsr	(L005c0c)
	addq.l	#8,a7
	clr.l	d0
	bra	L001932

L00185e:
	move.l	($000c,a6),d0
	moveq.l	#$0a,d1
	movem.l	d0-d1,-(a7)
	FPACK	__CLMUL
	movem.l	(a7)+,d0-d1
	adda.l	d0,a5
	move.w	(a5),d0
	ext.l	d0
	move.l	d0,(-$0104,a6)
	move.l	#L007bdd,-(a7)
	move.l	a6,d0
	add.l	#$ffffff00,d0
	move.l	d0,-(a7)
	jsr	(L005c0c)
	addq.l	#8,a7
	move.l	($0002,a5),-(a7)
	move.l	a6,d0
	add.l	#$ffffff00,d0
	move.l	d0,-(a7)
	jsr	(L005bde)
	addq.l	#8,a7
	suba.l	#$0000000a,a5
L0018ac:
	move.w	(a5),d0
	ext.l	d0
	tst.l	d0
	beq	L00191c
	move.w	(a5),d0
	ext.l	d0
	cmp.l	(-$0104,a6),d0
	bge	L001914
	move.l	#L007bdf,-(a7)
	move.l	($0010,a6),-(a7)
	jsr	(L005c0c)
	addq.l	#8,a7
	move.l	($0002,a5),-(a7)
	move.l	($0010,a6),-(a7)
	jsr	(L005bde)
	addq.l	#8,a7
	move.l	a6,d0
	add.l	#$ffffff00,d0
	move.l	d0,-(a7)
	move.l	($0010,a6),-(a7)
	jsr	(L005bde)
	addq.l	#8,a7
	move.l	($0010,a6),-(a7)
	move.l	a6,d0
	add.l	#$ffffff00,d0
	move.l	d0,-(a7)
	jsr	(L005c0c)
	addq.l	#8,a7
	move.w	(a5),d0
	ext.l	d0
	move.l	d0,(-$0104,a6)
L001914:
	suba.l	#$0000000a,a5
	bra	L0018ac

L00191c:
	move.l	a6,d0
	add.l	#$ffffff00,d0
	move.l	d0,-(a7)
	move.l	($0010,a6),-(a7)
	jsr	(L005c0c)
	addq.l	#8,a7
L001932:
	movem.l	(a7)+,a5
	unlk	a6
	rts

L00193a:
	link.w	a6,#-$0104
	movem.l	a5,-(a7)
	bra	L00183e

L001946:
	bra	L001a52

L00194a:
	clr.l	(-$003a,a6)
	move.l	(L007afe),-(a7)
	move.l	($0008,a6),-(a7)
	move.l	a6,d0
	add.l	#$ffffffca,d0
	move.l	d0,-(a7)
	jsr	(L0058d2)
	lea.l	($000c,a7),a7
	tst.l	d0
	bge	L00197a
	move.l	(-$003a,a6),d0
	bra	L001a4e

L001978:
	bra	L0019cc

L00197a:
	moveq.l	#$18,d0
	and.b	d0,(-$0021,a6)
	move.b	(-$0021,a6),d0
	andi.l	#$000000ff,d0
	tst.l	d0
	bne	L0019cc
	move.b	(-$0021,a6),d0
	andi.l	#$000000ff,d0
	move.l	(L007afe),d1
	beq	L0019a4
	clr.l	d1
	bra	L0019a6

L0019a4:
	moveq.l	#$01,d1
L0019a6:
	and.l	d1,d0
	bne	L0019cc
	addq.l	#1,(-$003a,a6)
	move.l	($000c,a6),-(a7)
	move.l	a6,d0
	add.l	#$ffffffca,d0
	move.l	d0,-(a7)
	jsr	(L001a5a)
	addq.l	#8,a7
	addi.l	#$00000017,($000c,a6)
L0019cc:
	move.l	a6,d0
	add.l	#$ffffffca,d0
	move.l	d0,-(a7)
	jsr	(L0058e6)
	addq.l	#4,a7
	tst.l	d0
	blt	L001a46
	moveq.l	#$18,d0
	and.b	d0,(-$0021,a6)
	move.b	(-$0021,a6),d0
	andi.l	#$000000ff,d0
	tst.l	d0
	bne	L001a44
	move.b	(-$0021,a6),d0
	andi.l	#$000000ff,d0
	move.l	(L007afe),d1
	beq	L001a0c
	clr.l	d1
	bra	L001a0e

L001a0c:
	moveq.l	#$01,d1
L001a0e:
	and.l	d1,d0
	bne	L001a44
	addq.l	#1,(-$003a,a6)
	move.l	($000c,a6),-(a7)
	move.l	a6,d0
	add.l	#$ffffffca,d0
	move.l	d0,-(a7)
	jsr	(L001a5a)
	addq.l	#8,a7
	addi.l	#$00000017,($000c,a6)
	move.l	($0010,a6),d0
	moveq.l	#$20,d1			;' '
	sub.l	d1,d0
	cmp.l	($000c,a6),d0
	bcc	L001a44
	bra	L001a46

L001a44:
	bra	L0019cc

L001a46:
	move.l	(-$003a,a6),d0
	bra.w	L001a4e

L001a4e:
	unlk	a6
	rts

L001a52:
	link.w	a6,#-$003a
	bra	L00194a

L001a5a:
	bra	L001b00

L001a5e:
	movea.l	($000c,a6),a5
	move.l	($0008,a6),d0
	add.l	#$0000001e,d0
	movea.l	d0,a4
	clr.l	d7
L001a70:
	move.l	d7,d0
	cmp.l	#$00000016,d0
	bge	L001a88
	move.l	a5,d0
	add.l	d7,d0
	movea.l	d0,a0
	moveq.l	#$20,d0			;' '
	move.b	d0,(a0)
	addq.l	#1,d7
	bra	L001a70

L001a88:
	move.l	a5,d0
	add.l	d7,d0
	movea.l	d0,a0
	clr.b	(a0)
	clr.l	d7
L001a92:
	move.l	d7,d0
	cmp.l	#$00000013,d0
	bge	L001ace
	move.b	(a4),d0
	andi.l	#$000000ff,d0
	tst.l	d0
	bne	L001aac
	clr.l	d0
	bra	L001af8

L001aac:
	move.b	(a4),d0
	andi.l	#$000000ff,d0
	cmp.l	#$0000002e,d0
	bne	L001ac0
	addq.l	#1,a4
	bra	L001ace

L001ac0:
	move.l	a5,d0
	add.l	d7,d0
	movea.l	d0,a0
	move.b	(a4),(a0)
	addq.l	#1,a4
	addq.l	#1,d7
	bra	L001a92

L001ace:
	moveq.l	#$13,d7
L001ad0:
	move.l	d7,d0
	cmp.l	#$00000016,d0
	bge	L001af8
	move.b	(a4),d0
	andi.l	#$000000ff,d0
	tst.l	d0
	bne	L001aea
	clr.l	d0
	bra	L001af8

L001aea:
	move.l	a5,d0
	add.l	d7,d0
	movea.l	d0,a0
	move.b	(a4),(a0)
	addq.l	#1,a4
	addq.l	#1,d7
	bra	L001ad0

L001af8:
	movem.l	(a7)+,d7/a4-a5
	unlk	a6
	rts

L001b00:
	link.w	a6,#$0000
	movem.l	d7/a4-a5,-(a7)
	bra	L001a5e

L001b0c:
	bra	L001b64

L001b0e:
	movea.l	($0008,a6),a5
	movea.l	a5,a4
L001b14:
	move.b	(a5),d0
	ext.w	d0
	ext.l	d0
	cmp.l	#$00000020,d0
	beq	L001b26
	addq.l	#1,a5
	bra	L001b14

L001b26:
	moveq.l	#$2e,d0			;'.'
	move.b	d0,(a5)
	addq.l	#1,a5
	adda.l	#$00000013,a4
L001b32:
	move.b	(a4),d0
	ext.w	d0
	ext.l	d0
	cmp.l	#$00000020,d0
	beq	L001b52
	move.b	(a4),d0
	ext.w	d0
	ext.l	d0
	tst.l	d0
	beq	L001b52
	move.b	(a4),(a5)
	addq.l	#1,a5
	addq.l	#1,a4
	bra	L001b32

L001b52:
	clr.b	(a5)
	move.l	($0008,a6),d0
	bra.w	L001b5c

L001b5c:
	movem.l	(a7)+,a4-a5
	unlk	a6
	rts

L001b64:
	link.w	a6,#$0000
	movem.l	a4-a5,-(a7)
	bra	L001b0e

L001b6e:
	bra	L001b8a

L001b70:
	movea.l	($0008,a6),a5
	move.l	a5,d7
	addq.l	#1,d7
	moveq.l	#$fe,d0
	and.l	d0,d7
	move.l	d7,d0
	bra.w	L001b82

L001b82:
	movem.l	(a7)+,d7/a5
	unlk	a6
	rts

L001b8a:
	link.w	a6,#$0000
	movem.l	d7/a5,-(a7)
	bra	L001b70

L001b94:
	bra	L001e94

L001b98:
	move.l	(L008e7c),(L008624)
	move.l	(L008e7c),d0
	add.l	#$00005000,d0
	move.l	d0,(L008628)
	move.l	#$00000002,-(a7)
	move.l	#$0000000e,-(a7)
	move.l	#$0000003c,-(a7)
	move.l	#$00000009,-(a7)
	move.l	#$0000000b,-(a7)
	jsr	(L004984)
	lea.l	($0014,a7),a7
	move.l	d0,(-$0004,a6)
	move.l	(-$0004,a6),d0
	addq.l	#6,d0
	movea.l	d0,a0
	move.w	(a0),d0
	andi.l	#$0000ffff,d0
	subq.l	#1,d0
	lsr.l	#1,d0
	move.l	d0,-(a7)
	move.l	#L007b3a,-(a7)
	jsr	(L005c1a)
	addq.l	#4,a7
	move.l	d0,-(a7)
	move.l	(-$0004,a6),d0
	addq.l	#4,d0
	movea.l	d0,a0
	move.w	(a0),d0
	andi.l	#$0000ffff,d0
	move.l	(a7)+,d1
	sub.l	d1,d0
	subq.l	#1,d0
	lsr.l	#1,d0
	move.l	d0,-(a7)
	move.l	(-$0004,a6),-(a7)
	jsr	(L00401e)
	lea.l	($000c,a7),a7
	move.l	#L007b3a,-(a7)
	move.l	#L007be1,-(a7)
	move.l	(-$0004,a6),-(a7)
	jsr	(L004ebc)
	lea.l	($000c,a7),a7
	move.l	($0008,a6),d0
	add.l	#$00000041,d0
	move.b	d0,(L008630)
	moveq.l	#$3a,d0			;':'
	move.b	d0,(L008631)
	clr.b	(L008632)
	move.l	#$00000020,-(a7)
	move.l	(L008e7c),d0
	add.l	(L008e80),d0
	move.l	d0,-(a7)
	move.l	(L008628),-(a7)
	move.l	(L008624),-(a7)
	addi.l	#$0000000a,(a7)
	move.l	#L008630,-(a7)
	jsr	(L00137a)
	lea.l	($0014,a7),a7
	move.l	d0,(-$0110,a6)
	bne	L001cae
	move.l	#$ffffffff,(-$0118,a6)
	bra	L001e26

L001cae:
	move.l	(-$0110,a6),-(a7)
	jsr	(L001b6e)
	addq.l	#4,a7
	move.l	d0,(-$0110,a6)
	move.l	(L008e7c),d0
	add.l	(L008e80),d0
	move.l	d0,-(a7)
	move.l	(-$0110,a6),-(a7)
	move.l	#L007be4,-(a7)
	move.l	(L008624),-(a7)
	addi.l	#$0000000a,(a7)
	jsr	(L00169c)
	lea.l	($0010,a7),a7
	move.l	d0,-(a7)
	jsr	(L001b6e)
	addq.l	#4,a7
	move.l	d0,(-$0110,a6)
	bne	L001d08
	move.l	#$ffffffff,(-$0118,a6)
	bra	L001e26

L001d08:
	move.l	(L008624),d0
	movea.l	d0,a0
	clr.w	(a0)
	move.l	(L008624),d0
	addq.l	#2,d0
	movea.l	d0,a0
	move.l	#L007be5,(a0)
	move.l	(L008624),d0
	addq.l	#2,d0
	movea.l	d0,a0
	movea.l	(a0),a0
	move.b	(L008630),(a0)
	move.l	(L008624),d0
	addq.l	#6,d0
	movea.l	d0,a0
	move.l	#L007be8,(a0)
	move.l	(L008624),d0
	addq.l	#6,d0
	movea.l	d0,a0
	movea.l	(a0),a0
	move.b	(L008630),(a0)
	move.l	(-$0110,a6),(-$0114,a6)
	move.l	(L008624),(-$000c,a6)
L001d64:
	move.l	(-$000c,a6),d0
	addq.l	#2,d0
	movea.l	d0,a0
	tst.l	(a0)
	beq	L001d8e
	move.l	(-$0114,a6),d0
	movea.l	d0,a0
	move.l	(-$000c,a6),d1
	addq.l	#6,d1
	movea.l	d1,a1
	move.l	(a1),(a0)
	addq.l	#4,(-$0114,a6)
	addi.l	#$0000000a,(-$000c,a6)
	bra	L001d64

L001d8e:
	move.l	(-$0114,a6),d0
	movea.l	d0,a0
	move.l	#L007bec,(a0)
	move.l	#$00000001,-(a7)
	move.l	#$00000002,-(a7)
	move.l	#$00000032,-(a7)
	move.l	#$0000001b,-(a7)
	move.l	#$00000014,-(a7)
	jsr	(L004984)
	lea.l	($0014,a7),a7
	move.l	d0,(-$0008,a6)
	move.l	#L007bed,-(a7)
	move.l	(-$0008,a6),-(a7)
	jsr	(L004ebc)
	addq.l	#8,a7
	move.l	#$00000001,-(a7)
	move.l	(-$0008,a6),-(a7)
	jsr	(L0011e0)
	addq.l	#8,a7
	move.l	(-$0004,a6),-(a7)
	jsr	(L0040d2)
	addq.l	#4,a7
	clr.l	-(a7)
	move.l	(-$0110,a6),-(a7)
	move.l	(-$0004,a6),-(a7)
	jsr	(L0042b4)
	lea.l	($000c,a7),a7
	move.l	d0,(-$0118,a6)
	move.l	(-$0008,a6),-(a7)
	jsr	(L004afe)
	addq.l	#4,a7
	move.l	(-$0004,a6),-(a7)
	jsr	(L004afe)
	addq.l	#4,a7
L001e26:
	move.l	(-$0118,a6),d0
	bge	L001e30
	clr.l	d0
	bra	L001e90

L001e30:
	move.l	a6,d0
	add.l	#$fffffef4,d0
	move.l	d0,-(a7)
	move.l	(-$0118,a6),-(a7)
	move.l	(L008e7c),-(a7)
	jsr	(L00183a)
	lea.l	($000c,a7),a7
	move.l	(L008624),d0
	addq.l	#2,d0
	movea.l	d0,a0
	move.l	(a0),-(a7)
	move.l	#L008630,-(a7)
	jsr	(L005c0c)
	addq.l	#8,a7
	move.l	(-$0118,a6),d0
	beq	L001e86
	move.l	a6,d0
	add.l	#$fffffef4,d0
	move.l	d0,-(a7)
	move.l	#L008630,-(a7)
	jsr	(L005bde)
	addq.l	#8,a7
L001e86:
	move.l	#L008630,d0
	bra.w	L001e90

L001e90:
	unlk	a6
	rts

L001e94:
	link.w	a6,#-$0118
	bra	L001b98

L001e9c:
	bra	L002378

L001ea0:
	move.l	(L008e7c),(L008624)
	move.l	(L008e7c),d0
	add.l	#$00005000,d0
	move.l	d0,(L008628)
	move.l	#$00000002,-(a7)
	move.l	#$0000000e,-(a7)
	move.l	#$00000017,-(a7)
	move.l	#$00000009,-(a7)
	move.l	#$0000000b,-(a7)
	jsr	(L004984)
	lea.l	($0014,a7),a7
	move.l	d0,(-$0004,a6)
	move.l	(-$0004,a6),d0
	addq.l	#6,d0
	movea.l	d0,a0
	move.w	(a0),d0
	andi.l	#$0000ffff,d0
	subq.l	#1,d0
	lsr.l	#1,d0
	move.l	d0,-(a7)
	clr.l	-(a7)
	move.l	(-$0004,a6),-(a7)
	jsr	(L00401e)
	lea.l	($000c,a7),a7
	move.l	#L007c10,-(a7)
	move.l	(-$0004,a6),-(a7)
	jsr	(L004ebc)
	addq.l	#8,a7
	move.l	($0008,a6),-(a7)
	move.l	a6,d0
	add.l	#$fffffbf0,d0
	move.l	d0,-(a7)
	jsr	(L005c0c)
	addq.l	#8,a7
	move.l	#L007c27,-(a7)
	move.l	a6,d0
	add.l	#$fffffbf0,d0
	move.l	d0,-(a7)
	jsr	(L005bde)
	addq.l	#8,a7
	move.l	(L008628),-(a7)
	move.l	a6,d0
	add.l	#$fffffbf0,d0
	move.l	d0,-(a7)
	jsr	(L001946)
	addq.l	#8,a7
	move.l	d0,(-$049e,a6)
	bne	L001ff2
	move.l	#$00000001,-(a7)
	move.l	#$00000001,-(a7)
	move.l	#L007b58,-(a7)
	jsr	(L005c1a)
	addq.l	#4,a7
	addq.l	#1,d0
	move.l	d0,-(a7)
	move.l	#$0000000f,-(a7)
	move.l	#$00000014,-(a7)
	jsr	(L004984)
	lea.l	($0014,a7),a7
	move.l	d0,(-$000c,a6)
	move.l	#L007b58,-(a7)
	move.l	#L007c2c,-(a7)
	move.l	(-$000c,a6),-(a7)
	jsr	(L004ebc)
	lea.l	($000c,a7),a7
L001fc0:
	move.l	#$000000ff,-(a7)
	jsr	(L005790)
	addq.l	#4,a7
	tst.l	d0
	bne	L001fd4
	bra	L001fc0

L001fd4:
	move.l	(-$000c,a6),-(a7)
	jsr	(L004afe)
	addq.l	#4,a7
	move.l	(-$0004,a6),-(a7)
	jsr	(L004afe)
	addq.l	#4,a7
	moveq.l	#$ff,d0
	bra	L002374

L001ff2:
	move.l	(-$049e,a6),d0
	moveq.l	#$17,d1
	movem.l	d0-d1,-(a7)
	FPACK	__CLMUL
	movem.l	(a7)+,d0-d1
	add.l	(L008628),d0
	move.l	d0,-(a7)
	jsr	(L001b6e)
	addq.l	#4,a7
	move.l	d0,(-$0414,a6)
	move.l	(-$0414,a6),(-$0418,a6)
	clr.l	(-$04a2,a6)
L002020:
	move.l	(-$04a2,a6),d0
	cmp.l	(-$049e,a6),d0
	bge	L002052
	move.l	(-$0414,a6),d0
	movea.l	d0,a0
	move.l	(-$04a2,a6),d1
	moveq.l	#$17,d2
	movem.l	d1-d2,-(a7)
	FPACK	__CLMUL
	movem.l	(a7)+,d1-d2
	add.l	(L008628),d1
	move.l	d1,(a0)
	addq.l	#4,(-$0414,a6)
	addq.l	#1,(-$04a2,a6)
	bra	L002020

L002052:
	move.l	(-$0414,a6),d0
	movea.l	d0,a0
	move.l	#L007c2f,(a0)
	move.l	#$00000001,-(a7)
	move.l	#$00000002,-(a7)
	move.l	#$00000038,-(a7)
	move.l	#$0000001b,-(a7)
	move.l	#$00000014,-(a7)
	jsr	(L004984)
	lea.l	($0014,a7),a7
	move.l	d0,(-$0008,a6)
	move.l	#L007c30,-(a7)
	move.l	(-$0008,a6),-(a7)
	jsr	(L004ebc)
	addq.l	#8,a7
	move.l	#$00000002,-(a7)
	move.l	(-$0008,a6),-(a7)
	jsr	(L0011e0)
	addq.l	#8,a7
	move.l	(-$0004,a6),-(a7)
	jsr	(L0040d2)
	addq.l	#4,a7
	move.l	#$00000002,-(a7)
	move.l	(-$0004,a6),d0
	addq.l	#6,d0
	movea.l	d0,a0
	move.w	(a0),d0
	andi.l	#$0000ffff,d0
	move.l	d0,-(a7)
	move.l	(-$0004,a6),d0
	addq.l	#4,d0
	movea.l	d0,a0
	move.w	(a0),d0
	andi.l	#$0000ffff,d0
	move.l	d0,-(a7)
	move.l	(-$0004,a6),d0
	addq.l	#2,d0
	movea.l	d0,a0
	move.w	(a0),d0
	andi.l	#$0000ffff,d0
	move.l	d0,-(a7)
	move.l	(-$0004,a6),d0
	movea.l	d0,a0
	move.w	(a0),d0
	andi.l	#$0000ffff,d0
	move.l	(-$0004,a6),d1
	addq.l	#4,d1
	movea.l	d1,a1
	move.w	(a1),d1
	andi.l	#$0000ffff,d1
	add.l	d1,d0
	addq.l	#4,d0
	move.l	d0,-(a7)
	jsr	(L004984)
	lea.l	($0014,a7),a7
	move.l	d0,(-$0010,a6)
	move.l	(-$0004,a6),(-$000c,a6)
	clr.l	(-$04a2,a6)
	moveq.l	#$ff,d0
	move.w	d0,(-$049a,a6)
L002138:
	move.l	(-$04a2,a6),d0
	cmp.l	#$00000041,d0
	bge	L002280
	clr.l	-(a7)
	move.l	(-$0418,a6),-(a7)
	move.l	(-$000c,a6),-(a7)
	jsr	(L00447c)
	lea.l	($000c,a7),a7
	move.l	d0,(-$04a6,a6)
	clr.l	(-$000c,a6)
	move.l	(-$04a6,a6),d0
	cmp.l	#$ffffffff,d0
	bne	L002176
	clr.l	(-$04a2,a6)
	bra	L002280

L002176:
	move.l	(-$04a6,a6),d0
	cmp.l	#$fffffffe,d0
	bne	L00219e
	move.l	(-$04a2,a6),d0
	moveq.l	#$17,d1
	movem.l	d0-d1,-(a7)
	FPACK	__CLMUL
	movem.l	(a7)+,d0-d1
	add.l	($000c,a6),d0
	movea.l	d0,a0
	clr.b	(a0)
	bra	L002280

L00219e:
	clr.l	(-$04aa,a6)
L0021a2:
	move.l	(-$04aa,a6),d0
	asl.l	#1,d0
	add.l	a6,d0
	add.l	#$fffffb66,d0
	movea.l	d0,a0
	move.w	(a0),d0
	ext.l	d0
	cmp.l	(-$04a6,a6),d0
	beq	L00227c
	move.l	(-$04aa,a6),d0
	cmp.l	(-$04a2,a6),d0
	bne	L002274
	move.l	(-$04aa,a6),d0
	asl.l	#1,d0
	add.l	a6,d0
	add.l	#$fffffb66,d0
	movea.l	d0,a0
	move.l	(-$04a6,a6),d1
	move.w	d1,(a0)
	move.l	(-$04aa,a6),d0
	asl.l	#1,d0
	add.l	a6,d0
	add.l	#$fffffb68,d0
	movea.l	d0,a0
	moveq.l	#$ff,d0
	move.w	d0,(a0)
	move.l	(-$04a6,a6),d0
	moveq.l	#$17,d1
	movem.l	d0-d1,-(a7)
	FPACK	__CLMUL
	movem.l	(a7)+,d0-d1
	add.l	(L008628),d0
	move.l	d0,-(a7)
	move.l	a6,d0
	add.l	#$fffffbf0,d0
	move.l	d0,-(a7)
	jsr	(L005c0c)
	addq.l	#8,a7
	move.l	a6,d0
	add.l	#$fffffbf0,d0
	move.l	d0,-(a7)
	move.l	#L007c61,-(a7)
	move.l	(-$0010,a6),-(a7)
	jsr	(L004ebc)
	lea.l	($000c,a7),a7
	move.l	a6,d0
	add.l	#$fffffbf0,d0
	move.l	d0,-(a7)
	jsr	(L001b0c)
	addq.l	#4,a7
	move.l	d0,-(a7)
	move.l	(-$04a2,a6),d0
	moveq.l	#$17,d1
	movem.l	d0-d1,-(a7)
	FPACK	__CLMUL
	movem.l	(a7)+,d0-d1
	add.l	($000c,a6),d0
	move.l	d0,-(a7)
	jsr	(L005c0c)
	addq.l	#8,a7
	addq.l	#1,(-$04a2,a6)
	bra	L00227c

L002274:
	addq.l	#1,(-$04aa,a6)
	bra	L0021a2

L00227c:
	bra	L002138

L002280:
	move.l	(-$0008,a6),-(a7)
	jsr	(L004afe)
	addq.l	#4,a7
	move.l	(-$04a2,a6),d0
	beq	L00234c
	move.l	#$00000001,-(a7)
	move.l	#$00000001,-(a7)
	move.l	#L007b8a,-(a7)
	jsr	(L005c1a)
	addq.l	#4,a7
	addq.l	#1,d0
	move.l	d0,-(a7)
	move.l	#$0000000f,-(a7)
	move.l	#$00000014,-(a7)
	jsr	(L004984)
	lea.l	($0014,a7),a7
	move.l	d0,(-$000c,a6)
	move.l	#L007b8a,-(a7)
	move.l	#L007c66,-(a7)
	move.l	(-$000c,a6),-(a7)
	jsr	(L004ebc)
	lea.l	($000c,a7),a7
L0022e6:
	moveq.l	#$01,d0
	beq	L00233e
	move.l	#$000000ff,-(a7)
	jsr	(L005790)
	addq.l	#4,a7
	move.l	d0,(-$04a6,a6)
	move.l	(-$04a6,a6),d0
	cmp.l	#$00000059,d0
	beq	L002314
	move.l	(-$04a6,a6),d0
	cmp.l	#$00000079,d0
	bne	L00231a
L002314:
	clr.l	(-$04a6,a6)
	bra	L00233e

L00231a:
	move.l	(-$04a6,a6),d0
	cmp.l	#$0000004e,d0
	beq	L002332
	move.l	(-$04a6,a6),d0
	cmp.l	#$0000006e,d0
	bne	L00233c
L002332:
	move.l	#$ffffffff,(-$04a6,a6)
	bra	L00233e

L00233c:
	bra	L0022e6

L00233e:
	move.l	(-$000c,a6),-(a7)
	jsr	(L004afe)
	addq.l	#4,a7
	bra	L002354

L00234c:
	move.l	#$ffffffff,(-$04a6,a6)
L002354:
	move.l	(-$0010,a6),-(a7)
	jsr	(L004afe)
	addq.l	#4,a7
	move.l	(-$0004,a6),-(a7)
	jsr	(L004afe)
	addq.l	#4,a7
	move.l	(-$04a6,a6),d0
	bra.w	L002374

L002374:
	unlk	a6
	rts

L002378:
	link.w	a6,#-$04aa
	bra	L001ea0

L002380:
	bra	L002498

L002384:
	move.l	#L008730,(-$0004,a6)
	move.l	(L008b08),d0
	add.l	#$00000040,d0
	move.b	d0,(-$0008,a6)
	moveq.l	#$3a,d0			;':'
	move.b	d0,(-$0007,a6)
	clr.b	(-$0006,a6)
	move.l	($000c,a6),d0
	ble	L002418
	move.l	($000c,a6),(L008834)
	move.l	($000c,a6),-(a7)
	move.l	#L007d38,-(a7)
	move.l	#L007d08,-(a7)
	jsr	(L005b68)
	lea.l	($000c,a7),a7
	move.l	(-$0004,a6),d0
	movea.l	d0,a0
	move.l	#$000000ff,d0
	move.b	d0,(a0)
	move.l	(-$0004,a6),d0
	addq.l	#1,d0
	movea.l	d0,a0
	move.l	($000c,a6),d1
	move.b	d1,(a0)
	move.l	($000c,a6),d0
	cmp.l	#$00000001,d0
	bne	L002416
	jsr	(L005840)
	move.l	(-$0004,a6),d1
	addq.l	#2,d1
	movea.l	d1,a1
	move.w	d0,(a1)
	jsr	(L005844)
	move.l	(-$0004,a6),d1
	addq.l	#4,d1
	movea.l	d1,a1
	move.w	d0,(a1)
L002416:
	bra	L002450

L002418:
	move.l	($000c,a6),d0
	beq	L00243c
	move.l	(L008834),-(a7)
	move.l	#L007d42,-(a7)
	move.l	#L007d08,-(a7)
	jsr	(L005b68)
	lea.l	($000c,a7),a7
	bra	L002450

L00243c:
	move.l	#L007d4c,-(a7)
	move.l	#L007d08,-(a7)
	jsr	(L005b68)
	addq.l	#8,a7
L002450:
	move.l	a6,d0
	add.l	#$fffffff8,d0
	move.l	d0,-(a7)
	move.l	($0008,a6),-(a7)
	jsr	(L005c0c)
	addq.l	#8,a7
	move.l	(L0076fa),d0
	beq	L002482
	move.l	#L0076da,-(a7)
	move.l	($0008,a6),-(a7)
	jsr	(L005bde)
	addq.l	#8,a7
	bra	L002494

L002482:
	move.l	#L007d02,-(a7)
	move.l	($0008,a6),-(a7)
	jsr	(L005bde)
	addq.l	#8,a7
L002494:
	unlk	a6
	rts

L002498:
	link.w	a6,#-$0008
	bra	L002384

L0024a0:
	bra	L002608

L0024a4:
	clr.l	-(a7)
	move.l	a6,d0
	add.l	#$ffffffe0,d0
	move.l	d0,-(a7)
	jsr	(L002380)
	addq.l	#8,a7
	move.l	#$00000027,-(a7)
	move.l	a6,d0
	add.l	#$ffffffe0,d0
	move.l	d0,-(a7)
	move.l	a6,d0
	add.l	#$ffffffaa,d0
	move.l	d0,-(a7)
	jsr	(L0058d2)
	lea.l	($000c,a7),a7
	tst.l	d0
	bge	L00258c
L0024e2:
	move.l	a6,d0
	add.l	#$ffffffa2,d0
	move.l	d0,-(a7)
	move.l	(L008b08),-(a7)
	jsr	(L00585a)
	addq.l	#8,a7
	move.l	d0,(-$0062,a6)
	cmp.l	#$00080000,d0
	bge	L002518
	move.l	#L007c94,-(a7)
	jsr	(L002a10)
	addq.l	#4,a7
	bra	L0025ee

L002518:
	move.l	($0008,a6),-(a7)
	move.l	a6,d0
	add.l	#$ffffffe0,d0
	move.l	d0,-(a7)
	jsr	(L002380)
	addq.l	#8,a7
	move.l	#$00000020,-(a7)
	move.l	a6,d0
	add.l	#$ffffffe0,d0
	move.l	d0,-(a7)
	jsr	(L005868)
	addq.l	#8,a7
	move.l	d0,(L008e8c)
	bge	L002554
	moveq.l	#$fe,d0
	bra	L002604

L002554:
	move.l	#$00000100,-(a7)
	move.l	#L008730,-(a7)
	move.l	(L008e8c),-(a7)
	jsr	(L0058a2)
	lea.l	($000c,a7),a7
	cmp.l	#$00000100,d0
	beq	L00257e
	moveq.l	#$fc,d0
	bra	L002604

L00257e:
	move.l	(-$0062,a6),d0
	move.l	#$00000300,d1
	sub.l	d1,d0
	bra	L002604

L00258c:
	move.l	(L0076fe),d0
	beq	L0025e0
	move.b	(-$0055,a6),d0
	andi.l	#$000000ff,d0
	add.l	#$00000041,d0
	move.b	d0,(-$0020,a6)
	moveq.l	#$3a,d0			;':'
	move.b	d0,(-$001f,a6)
	move.l	a6,d0
	add.l	#$ffffffc8,d0
	move.l	d0,-(a7)
	move.l	a6,d0
	add.l	#$ffffffe2,d0
	move.l	d0,-(a7)
	jsr	(L005c0c)
	addq.l	#8,a7
	move.l	a6,d0
	add.l	#$ffffffe0,d0
	move.l	d0,-(a7)
	jsr	(L0058b6)
	addq.l	#4,a7
	bra	L0024e2

L0025e0:
	move.l	#L007c6a,-(a7)
	jsr	(L002a10)
	addq.l	#4,a7
L0025ee:
	jsr	(L002872)
	move.l	d0,(-$0066,a6)
	beq	L002600
	move.l	(-$0066,a6),d0
	bra	L002604

L002600:
	bra	L0024a4

L002604:
	unlk	a6
	rts

L002608:
	link.w	a6,#-$0066
	bra	L0024a4

L002610:
	bra	L002718

L002614:
	move.l	#L008730,(-$0024,a6)
L00261c:
	clr.l	-(a7)
	move.l	a6,d0
	add.l	#$ffffffe0,d0
	move.l	d0,-(a7)
	jsr	(L002380)
	addq.l	#8,a7
	move.l	#$00000027,-(a7)
	move.l	a6,d0
	add.l	#$ffffffe0,d0
	move.l	d0,-(a7)
	move.l	a6,d0
	add.l	#$ffffffa6,d0
	move.l	d0,-(a7)
	jsr	(L0058d2)
	lea.l	($000c,a7),a7
	tst.l	d0
	bge	L00265c
	bra	L0026f0

L00265c:
	move.l	a6,d0
	add.l	#$ffffffc4,d0
	move.l	d0,-(a7)
	move.l	a6,d0
	add.l	#$ffffffe2,d0
	move.l	d0,-(a7)
	jsr	(L005c0c)
	addq.l	#8,a7
	move.l	#$00000002,-(a7)
	move.l	a6,d0
	add.l	#$ffffffe0,d0
	move.l	d0,-(a7)
	jsr	(L005876)
	addq.l	#8,a7
	move.l	d0,(L008e8c)
	move.l	#$00000100,-(a7)
	move.l	#L008730,-(a7)
	move.l	(L008e8c),-(a7)
	jsr	(L00588e)
	lea.l	($000c,a7),a7
	move.l	(-$0024,a6),d0
	movea.l	d0,a0
	move.b	(a0),d0
	andi.l	#$000000ff,d0
	cmp.l	#$000000ff,d0
	bne	L0026e2
	move.l	a6,d0
	add.l	#$ffffff9e,d0
	move.l	d0,-(a7)
	move.l	(L008b08),-(a7)
	jsr	(L00585a)
	addq.l	#8,a7
	bra	L002714

L0026e2:
	move.l	(L008e8c),-(a7)
	jsr	(L005884)
	addq.l	#4,a7
L0026f0:
	move.l	#L007cb6,-(a7)
	jsr	(L002a10)
	addq.l	#4,a7
	jsr	(L002872)
	move.l	d0,(-$0066,a6)
	beq	L002710
	move.l	(-$0066,a6),d0
	bra	L002714

L002710:
	bra	L00261c

L002714:
	unlk	a6
	rts

L002718:
	link.w	a6,#-$0066
	bra	L002614

L002720:
	bra	L002778

L002722:
	move.l	#L008730,(-$0004,a6)
	jsr	(L003622)
	move.l	(-$0004,a6),d0
	addq.l	#2,d0
	movea.l	d0,a0
	move.w	(a0),d0
	andi.l	#$0000ffff,d0
	moveq.l	#$10,d1
	lsl.l	d1,d0
	move.l	(-$0004,a6),d1
	addq.l	#4,d1
	movea.l	d1,a1
	move.w	(a1),d1
	andi.l	#$0000ffff,d1
	or.l	d1,d0
	move.l	d0,-(a7)
	move.l	(L008e8c),-(a7)
	jsr	(L0058f0)
	addq.l	#8,a7
	move.l	(L008e8c),-(a7)
	jsr	(L005884)
	addq.l	#4,a7
	unlk	a6
	rts

L002778:
	link.w	a6,#-$0004
	bra	L002722

L00277e:
	bra	L00286a

L002782:
	move.l	#L008730,(-$0004,a6)
	jsr	(L003622)
	move.l	(L008b08),-(a7)
	clr.l	-(a7)
	jsr	(L0057b6)
	addq.l	#8,a7
	and.l	#$00000040,d0
	beq	L0027b8
	move.l	(-$0004,a6),d0
	movea.l	d0,a0
	move.l	#$000000ff,d0
	move.b	d0,(a0)
	bra	L0027c0

L0027b8:
	move.l	(-$0004,a6),d0
	movea.l	d0,a0
	clr.b	(a0)
L0027c0:
	clr.l	-(a7)
	clr.l	-(a7)
	move.l	(L008e8c),-(a7)
	jsr	(L0058c0)
	lea.l	($000c,a7),a7
	move.l	#$00000100,-(a7)
	move.l	#L008730,-(a7)
	move.l	(L008e8c),-(a7)
	jsr	(L0058a2)
	lea.l	($000c,a7),a7
	cmp.l	#$00000100,d0
	beq	L0027fc
	moveq.l	#$fc,d0
	bra	L002866

L0027fc:
	move.l	(-$0004,a6),d0
	addq.l	#2,d0
	movea.l	d0,a0
	move.w	(a0),d0
	andi.l	#$0000ffff,d0
	moveq.l	#$10,d1
	lsl.l	d1,d0
	move.l	(-$0004,a6),d1
	addq.l	#4,d1
	movea.l	d1,a1
	move.w	(a1),d1
	andi.l	#$0000ffff,d1
	or.l	d1,d0
	move.l	d0,-(a7)
	move.l	(L008e8c),-(a7)
	jsr	(L0058f0)
	addq.l	#8,a7
	move.l	(L008e8c),-(a7)
	jsr	(L005884)
	addq.l	#4,a7
	move.l	#L007ce0,-(a7)
	jsr	(L002a10)
	addq.l	#4,a7
	jsr	(L002872)
	move.l	d0,(-$0008,a6)
	beq	L002860
	move.l	(-$0008,a6),d0
	bra	L002866

L002860:
	clr.l	d0
	bra.w	L002866

L002866:
	unlk	a6
	rts

L00286a:
	link.w	a6,#-$0008
	bra	L002782

L002872:
	bra	L002a08

L002876:
	move.l	(L008b08),-(a7)
	clr.l	-(a7)
	jsr	(L0057b6)
	addq.l	#8,a7
	and.l	#$00000040,d0
	beq	L0028c0
	move.l	(L007702),d0
	beq	L0028ba
	clr.l	(-$0004,a6)
L00289a:
	move.l	(-$0004,a6),d0
	cmp.l	#$0000ea60,d0
	bge	L0028ac
	addq.l	#1,(-$0004,a6)
	bra	L00289a

L0028ac:
	move.l	(L008830),-(a7)
	jsr	(L004afe)
	addq.l	#4,a7
L0028ba:
	moveq.l	#$f7,d0
	bra	L002a04

L0028c0:
	move.l	(L007702),d0
	bne	L0028de
	move.l	#L007d12,-(a7)
	move.l	#L007d53,-(a7)
	jsr	(L005b04)
	addq.l	#8,a7
	bra	L00292a

L0028de:
	move.l	#$00000002,-(a7)
	move.l	(L008830),d0
	addq.l	#4,d0
	movea.l	d0,a0
	move.w	(a0),d0
	andi.l	#$0000ffff,d0
	moveq.l	#$14,d1
	sub.l	d1,d0
	lsr.l	#1,d0
	move.l	d0,-(a7)
	move.l	(L008830),-(a7)
	jsr	(L00401e)
	lea.l	($000c,a7),a7
	move.l	#L007d28,-(a7)
	move.l	#L007d57,-(a7)
	move.l	(L008830),-(a7)
	jsr	(L004ebc)
	lea.l	($000c,a7),a7
L00292a:
	move.l	(L008b08),-(a7)
	move.l	#$00000001,-(a7)
	jsr	(L0057b6)
	addq.l	#8,a7
	tst.l	d0
	bge	L002948
	moveq.l	#$f7,d0
	bra	L002a04

L002948:
	move.l	(L008b08),-(a7)
	move.l	#$00000004,-(a7)
	jsr	(L0057b6)
	addq.l	#8,a7
L00295c:
	move.l	(L008b08),-(a7)
	clr.l	-(a7)
	jsr	(L0057b6)
	addq.l	#8,a7
	and.l	#$00000002,d0
	beq	L002976
	bra	L00295c

L002976:
	move.l	(L008b08),-(a7)
	clr.l	-(a7)
	jsr	(L0057b6)
	addq.l	#8,a7
	and.l	#$00000002,d0
	bne	L0029d4
	move.l	#$000000ff,-(a7)
	jsr	(L005790)
	addq.l	#4,a7
	cmp.l	#$0000001b,d0
	bne	L0029d2
	move.l	(L008b08),-(a7)
	move.l	#$00000005,-(a7)
	jsr	(L0057b6)
	addq.l	#8,a7
	move.l	(L007702),d0
	beq	L0029ce
	move.l	(L008830),-(a7)
	jsr	(L004afe)
	addq.l	#4,a7
L0029ce:
	moveq.l	#$f6,d0
	bra	L002a04

L0029d2:
	bra	L002976

L0029d4:
	move.l	(L008b08),-(a7)
	move.l	#$00000005,-(a7)
	jsr	(L0057b6)
	addq.l	#8,a7
	move.l	(L007702),d0
	beq	L0029fe
	move.l	(L008830),-(a7)
	jsr	(L004afe)
	addq.l	#4,a7
L0029fe:
	clr.l	d0
	bra.w	L002a04

L002a04:
	unlk	a6
	rts

L002a08:
	link.w	a6,#-$0004
	bra	L002876

L002a10:
	bra	L002ab0

L002a14:
	move.l	(L007702),d0
	bne	L002a32
	move.l	($0008,a6),-(a7)
	move.l	#L007d5b,-(a7)
	jsr	(L005b04)
	addq.l	#8,a7
	clr.l	d0
	bra	L002aac

L002a32:
	move.l	($0008,a6),-(a7)
	jsr	(L005c1a)
	addq.l	#4,a7
	move.l	d0,(-$0004,a6)
	move.l	#$00000003,-(a7)
	move.l	#$00000003,-(a7)
	move.l	(-$0004,a6),-(a7)
	addq.l	#2,(a7)
	move.l	#$0000000e,-(a7)
	moveq.l	#$60,d0			;'`'
	move.l	(-$0004,a6),d1
	sub.l	d1,d0
	addq.l	#2,d0
	asr.l	#1,d0
	move.l	d0,-(a7)
	jsr	(L004984)
	lea.l	($0014,a7),a7
	move.l	d0,(L008830)
	clr.l	-(a7)
	clr.l	-(a7)
	move.l	(L008830),-(a7)
	jsr	(L00401e)
	lea.l	($000c,a7),a7
	move.l	($0008,a6),-(a7)
	move.l	#L007d60,-(a7)
	move.l	(L008830),-(a7)
	jsr	(L004ebc)
	lea.l	($000c,a7),a7
	clr.l	d0
	bra.w	L002aac

L002aac:
	unlk	a6
	rts

L002ab0:
	link.w	a6,#-$0004
	bra	L002a14

L002ab8:
	bra	L002e26

L002abc:
	move.l	($0008,a6),-(a7)
	move.l	a6,d0
	add.l	#$fffffdbc,d0
	move.l	d0,-(a7)
	jsr	(L005c0c)
	addq.l	#8,a7
	move.l	#L007d68,-(a7)
	move.l	a6,d0
	add.l	#$fffffdbc,d0
	move.l	d0,-(a7)
	jsr	(L005bde)
	addq.l	#8,a7
	move.l	($000c,a6),-(a7)
	move.l	a6,d0
	add.l	#$fffffdbc,d0
	move.l	d0,-(a7)
	jsr	(L005bde)
	addq.l	#8,a7
	move.l	($0008,a6),-(a7)
	jsr	(L005c1a)
	addq.l	#4,a7
	add.l	a6,d0
	add.l	#$fffffdbd,d0
	move.l	d0,(-$0248,a6)
	move.l	#$00000023,-(a7)
	move.l	a6,d0
	add.l	#$fffffdbc,d0
	move.l	d0,-(a7)
	move.l	a6,d0
	add.l	#$ffffffc6,d0
	move.l	d0,-(a7)
	jsr	(L0058d2)
	lea.l	($000c,a7),a7
	tst.l	d0
	bge	L002b44
	bra	L002cc6

L002b44:
	move.b	(-$0025,a6),d0
	andi.l	#$000000ff,d0
	and.l	#$00000018,d0
	beq	L002b5a
	bra	L002bf8

L002b5a:
	move.b	(-$0025,a6),(-$0144,a6)
	move.w	(-$0024,a6),(-$0140,a6)
	move.w	(-$0022,a6),(-$0142,a6)
	move.l	(-$0020,a6),(-$013e,a6)
	move.l	($0008,a6),-(a7)
	move.l	a6,d0
	add.l	#$fffffec6,d0
	move.l	d0,-(a7)
	jsr	(L005c0c)
	addq.l	#8,a7
	move.l	#L007d6a,-(a7)
	move.l	a6,d0
	add.l	#$fffffec6,d0
	move.l	d0,-(a7)
	jsr	(L005bde)
	addq.l	#8,a7
	move.l	a6,d0
	add.l	#$ffffffe4,d0
	move.l	d0,-(a7)
	move.l	a6,d0
	add.l	#$fffffec6,d0
	move.l	d0,-(a7)
	jsr	(L005bde)
	addq.l	#8,a7
	move.l	a6,d0
	add.l	#$fffffebc,d0
	move.l	d0,-(a7)
	jsr	(L002e2e)
	addq.l	#4,a7
	tst.l	d0
	beq	L002bf8
	move.l	a6,d0
	add.l	#$fffffebc,d0
	move.l	d0,-(a7)
	jsr	(L002fce)
	addq.l	#4,a7
	move.l	d0,(-$0004,a6)
	bge	L002bf2
	move.l	(-$0004,a6),d0
	bra	L002e22

L002bf2:
	addq.l	#1,(L007d64)
L002bf8:
	move.l	a6,d0
	add.l	#$ffffffc6,d0
	move.l	d0,-(a7)
	jsr	(L0058e6)
	addq.l	#4,a7
	tst.l	d0
	blt	L002cc6
	move.b	(-$0025,a6),d0
	andi.l	#$000000ff,d0
	and.l	#$00000018,d0
	beq	L002c24
	bra	L002bf8

L002c24:
	move.b	(-$0025,a6),(-$0144,a6)
	move.w	(-$0024,a6),(-$0140,a6)
	move.w	(-$0022,a6),(-$0142,a6)
	move.l	(-$0020,a6),(-$013e,a6)
	move.l	($0008,a6),-(a7)
	move.l	a6,d0
	add.l	#$fffffec6,d0
	move.l	d0,-(a7)
	jsr	(L005c0c)
	addq.l	#8,a7
	move.l	#L007d6c,-(a7)
	move.l	a6,d0
	add.l	#$fffffec6,d0
	move.l	d0,-(a7)
	jsr	(L005bde)
	addq.l	#8,a7
	move.l	a6,d0
	add.l	#$ffffffe4,d0
	move.l	d0,-(a7)
	move.l	a6,d0
	add.l	#$fffffec6,d0
	move.l	d0,-(a7)
	jsr	(L005bde)
	addq.l	#8,a7
	move.l	a6,d0
	add.l	#$fffffebc,d0
	move.l	d0,-(a7)
	jsr	(L002e2e)
	addq.l	#4,a7
	tst.l	d0
	beq	L002cc2
	move.l	a6,d0
	add.l	#$fffffebc,d0
	move.l	d0,-(a7)
	jsr	(L002fce)
	addq.l	#4,a7
	move.l	d0,(-$0004,a6)
	bge	L002cbc
	move.l	(-$0004,a6),d0
	bra	L002e22

L002cbc:
	addq.l	#1,(L007d64)
L002cc2:
	bra	L002bf8

L002cc6:
	move.l	(L0076f2),d0
	bne	L002cd8
	move.l	(L007d64),d0
	bra	L002e22

L002cd8:
	move.l	#L007d6e,-(a7)
	move.l	(-$0248,a6),-(a7)
	jsr	(L005c0c)
	addq.l	#8,a7
	move.l	#$00000010,-(a7)
	move.l	a6,d0
	add.l	#$fffffdbc,d0
	move.l	d0,-(a7)
	move.l	a6,d0
	add.l	#$ffffffc6,d0
	move.l	d0,-(a7)
	jsr	(L0058d2)
	lea.l	($000c,a7),a7
	tst.l	d0
	bge	L002d1c
	move.l	(L007d64),d0
	bra	L002e22

L002d1c:
	move.l	#L007d72,-(a7)
	move.l	a6,d0
	add.l	#$ffffffe4,d0
	move.l	d0,-(a7)
	jsr	(L005bf2)
	addq.l	#8,a7
	tst.l	d0
	beq	L002d8e
	move.l	#L007d74,-(a7)
	move.l	a6,d0
	add.l	#$ffffffe4,d0
	move.l	d0,-(a7)
	jsr	(L005bf2)
	addq.l	#8,a7
	tst.l	d0
	beq	L002d8e
	move.l	a6,d0
	add.l	#$ffffffe4,d0
	move.l	d0,-(a7)
	move.l	(-$0248,a6),-(a7)
	jsr	(L005c0c)
	addq.l	#8,a7
	move.l	($000c,a6),-(a7)
	move.l	a6,d0
	add.l	#$fffffdbc,d0
	move.l	d0,-(a7)
	jsr	(L002ab8)
	addq.l	#8,a7
	move.l	d0,(-$0004,a6)
	bge	L002d8e
	move.l	(-$0004,a6),d0
	bra	L002e22

L002d8e:
	move.l	a6,d0
	add.l	#$ffffffc6,d0
	move.l	d0,-(a7)
	jsr	(L0058e6)
	addq.l	#4,a7
	tst.l	d0
	blt	L002e18
	move.l	#L007d77,-(a7)
	move.l	a6,d0
	add.l	#$ffffffe4,d0
	move.l	d0,-(a7)
	jsr	(L005bf2)
	addq.l	#8,a7
	tst.l	d0
	beq	L002e14
	move.l	#L007d79,-(a7)
	move.l	a6,d0
	add.l	#$ffffffe4,d0
	move.l	d0,-(a7)
	jsr	(L005bf2)
	addq.l	#8,a7
	tst.l	d0
	beq	L002e14
	move.l	a6,d0
	add.l	#$ffffffe4,d0
	move.l	d0,-(a7)
	move.l	(-$0248,a6),-(a7)
	jsr	(L005c0c)
	addq.l	#8,a7
	move.l	($000c,a6),-(a7)
	move.l	a6,d0
	add.l	#$fffffdbc,d0
	move.l	d0,-(a7)
	jsr	(L002ab8)
	addq.l	#8,a7
	move.l	d0,(-$0004,a6)
	bge	L002e14
	move.l	(-$0004,a6),d0
	bra	L002e22

L002e14:
	bra	L002d8e

L002e18:
	move.l	(L007d64),d0
	bra.w	L002e22

L002e22:
	unlk	a6
	rts

L002e26:
	link.w	a6,#-$0248
	bra	L002abc

L002e2e:
	bra	L002fc6

L002e32:
	move.l	($0008,a6),d0
	add.l	#$0000000a,d0
	movea.l	d0,a0
	move.b	(a0),d0
	andi.l	#$000000ff,d0
	move.l	d0,(-$0028,a6)
	move.l	(-$0028,a6),-(a7)
	jsr	(L005c58)
	addq.l	#4,a7
	moveq.l	#$41,d1			;'A'
	sub.l	d1,d0
	addq.l	#1,d0
	cmp.l	(L008b08),d0
	bne	L002ebe
	move.l	#$0000005c,-(a7)
	move.l	($0008,a6),-(a7)
	addi.l	#$0000000a,(a7)
	jsr	(L005c2c)
	addq.l	#8,a7
	move.l	d0,(-$0004,a6)
	beq	L002ebe
	addq.l	#1,(-$0004,a6)
	move.l	#$ffffffff,-(a7)
	move.l	a6,d0
	add.l	#$ffffffdc,d0
	move.l	d0,-(a7)
	jsr	(L002380)
	addq.l	#8,a7
	move.l	(-$0004,a6),-(a7)
	move.l	a6,d0
	add.l	#$ffffffde,d0
	move.l	d0,-(a7)
	jsr	(L005bf2)
	addq.l	#8,a7
	tst.l	d0
	bne	L002ebe
	clr.l	d0
	bra	L002fc2

L002ebe:
	move.l	($0008,a6),d0
	movea.l	d0,a0
	move.b	(a0),d0
	andi.l	#$000000ff,d0
	and.l	#$00000004,d0
	beq	L002eda
	clr.l	d0
	bra	L002fc2

L002eda:
	move.w	(L00771e),d0
	andi.l	#$0000ffff,d0
	cmp.l	#$0000fe00,d0
	beq	L002f14
	move.w	(L00771e),d0
	andi.l	#$0000ffff,d0
	move.l	($0008,a6),d1
	addq.l	#2,d1
	movea.l	d1,a1
	move.w	(a1),d1
	andi.l	#$0000ffff,d1
	cmp.l	d1,d0
	bls	L002f14
	clr.l	d0
	bra	L002fc2

L002f14:
	move.w	(L007720),d0
	andi.l	#$0000ffff,d0
	cmp.l	#$0000fe00,d0
	beq	L002f4c
	move.w	(L007720),d0
	andi.l	#$0000ffff,d0
	move.l	($0008,a6),d1
	addq.l	#2,d1
	movea.l	d1,a1
	move.w	(a1),d1
	andi.l	#$0000ffff,d1
	cmp.l	d1,d0
	bcc	L002f4c
	clr.l	d0
	bra	L002fc2

L002f4c:
	move.w	(L007722),d0
	andi.l	#$0000ffff,d0
	cmp.l	#$0000f800,d0
	beq	L002f84
	move.w	(L007722),d0
	andi.l	#$0000ffff,d0
	move.l	($0008,a6),d1
	addq.l	#4,d1
	movea.l	d1,a1
	move.w	(a1),d1
	andi.l	#$0000ffff,d1
	cmp.l	d1,d0
	bls	L002f84
	clr.l	d0
	bra	L002fc2

L002f84:
	move.w	(L007724),d0
	andi.l	#$0000ffff,d0
	cmp.l	#$0000f800,d0
	beq	L002fbc
	move.w	(L007724),d0
	andi.l	#$0000ffff,d0
	move.l	($0008,a6),d1
	addq.l	#4,d1
	movea.l	d1,a1
	move.w	(a1),d1
	andi.l	#$0000ffff,d1
	cmp.l	d1,d0
	bcc	L002fbc
	clr.l	d0
	bra	L002fc2

L002fbc:
	moveq.l	#$01,d0
	bra.w	L002fc2

L002fc2:
	unlk	a6
	rts

L002fc6:
	link.w	a6,#-$0028
	bra	L002e32

L002fce:
	bra	L003352

L002fd2:
	move.l	($0008,a6),d0
	bne	L003008
	move.l	#$00000002,-(a7)
	move.l	#L007d7c,-(a7)
	jsr	(L003550)
	addq.l	#8,a7
	jsr	(L002720)
	clr.l	(L007d8c)
	move.l	#$00000001,(L007d90)
	clr.l	d0
	bra	L00334e

L003008:
	clr.l	(-$0008,a6)
	clr.l	-(a7)
	move.l	($0008,a6),-(a7)
	addi.l	#$0000000a,(a7)
	jsr	(L005876)
	addq.l	#8,a7
	move.l	d0,(-$0004,a6)
	bge	L00302c
	moveq.l	#$ff,d0
	bra	L00334e

L00302c:
	move.l	(L007d8c),d0
	bne	L003156
	move.l	(L0076f6),d0
	beq	L00311a
	jsr	(L002610)
	move.l	d0,(L008838)
	bge	L00305a
	move.l	(L008838),(-$0010,a6)
	bra	L00333a

L00305a:
	clr.l	-(a7)
	clr.l	-(a7)
	move.l	(L008e8c),-(a7)
	jsr	(L0058c0)
	lea.l	($000c,a7),a7
	move.l	#$00000100,-(a7)
	move.l	a6,d0
	add.l	#$fffffeec,d0
	move.l	d0,-(a7)
	move.l	(L008e8c),-(a7)
	jsr	(L00588e)
	lea.l	($000c,a7),a7
	move.l	#$00000002,-(a7)
	move.l	#$fffffffe,-(a7)
	move.l	(L008e8c),-(a7)
	jsr	(L0058c0)
	lea.l	($000c,a7),a7
	move.b	(-$0113,a6),d0
	andi.l	#$000000ff,d0
	move.l	d0,(L007d90)
	jsr	(L005840)
	and.l	#$0000ffff,d0
	move.l	d0,(-$0014,a6)
	move.l	(-$0014,a6),d0
	moveq.l	#$10,d1
	lsl.l	d1,d0
	move.l	d0,(-$0014,a6)
	jsr	(L005844)
	and.l	#$0000ffff,d0
	or.l	d0,(-$0014,a6)
	move.l	#$00000002,-(a7)
	move.l	#L007d88,-(a7)
	jsr	(L003550)
	addq.l	#8,a7
	move.l	#$00000004,-(a7)
	move.l	a6,d0
	add.l	#$ffffffec,d0
	move.l	d0,-(a7)
	jsr	(L003550)
	addq.l	#8,a7
	clr.l	(L0076f6)
	bra	L003156

L00311a:
	move.l	(L007d90),-(a7)
	jsr	(L0024a0)
	addq.l	#4,a7
	move.l	d0,(L008838)
	bge	L00313c
	move.l	(L008838),(-$0010,a6)
	bra	L00333a

L00313c:
	move.l	(-$0008,a6),d0
	beq	L003156
	move.l	#$00000002,-(a7)
	move.l	#L007d84,-(a7)
	jsr	(L003550)
	addq.l	#8,a7
L003156:
	move.l	#$00000001,(L007d8c)
	move.l	a6,d0
	add.l	#$fffffeec,d0
	move.l	d0,-(a7)
	move.l	($0008,a6),-(a7)
	jsr	(L00335a)
	addq.l	#8,a7
	move.l	d0,(-$000c,a6)
	move.l	(-$000c,a6),d0
	cmp.l	(L008838),d0
	blt	L0031c2
	move.l	#$00000002,-(a7)
	move.l	#L007d7c,-(a7)
	jsr	(L003550)
	addq.l	#8,a7
	move.l	(L007d90),-(a7)
	jsr	(L00277e)
	addq.l	#4,a7
	move.l	d0,(-$0010,a6)
	bge	L0031b2
	bra	L00333a

L0031b2:
	addq.l	#1,(L007d90)
	clr.l	(L007d8c)
	bra	L00302c

L0031c2:
	move.l	(-$000c,a6),d0
	sub.l	d0,(L008838)
	move.l	($0008,a6),d0
	addq.l	#6,d0
	movea.l	d0,a0
	move.l	(a0),d0
	cmp.l	(L008838),d0
	bls	L0032a0
	move.l	#$00000002,-(a7)
	move.l	#L007d80,-(a7)
	jsr	(L003550)
	addq.l	#8,a7
	move.l	#$00000004,-(a7)
	move.l	#L008838,-(a7)
	move.l	a6,d0
	add.l	(-$000c,a6),d0
	add.l	#$fffffeec,d0
	subq.l	#4,d0
	move.l	d0,-(a7)
	jsr	(L005ac8)
	lea.l	($000c,a7),a7
	move.l	(-$000c,a6),-(a7)
	move.l	a6,d0
	add.l	#$fffffeec,d0
	move.l	d0,-(a7)
	jsr	(L003550)
	addq.l	#8,a7
	move.l	(L008838),-(a7)
	move.l	(-$0004,a6),-(a7)
	jsr	(L003466)
	addq.l	#8,a7
	move.l	d0,(-$0010,a6)
	beq	L00324c
	bra	L00333a

L00324c:
	move.l	(L008838),d0
	move.l	($0008,a6),d1
	addq.l	#6,d1
	movea.l	d1,a1
	sub.l	d0,(a1)
	move.l	#$00000002,-(a7)
	move.l	#L007d7c,-(a7)
	jsr	(L003550)
	addq.l	#8,a7
	move.l	(L007d90),-(a7)
	jsr	(L00277e)
	addq.l	#4,a7
	move.l	d0,(-$0010,a6)
	bge	L003288
	bra	L00333a

L003288:
	addq.l	#1,(L007d90)
	move.l	#$00000001,(-$0008,a6)
	clr.l	(L007d8c)
	bra	L00302c

L0032a0:
	move.l	(-$000c,a6),-(a7)
	move.l	a6,d0
	add.l	#$fffffeec,d0
	move.l	d0,-(a7)
	jsr	(L003550)
	addq.l	#8,a7
	move.l	($0008,a6),d0
	addq.l	#6,d0
	movea.l	d0,a0
	move.l	(a0),-(a7)
	move.l	(-$0004,a6),-(a7)
	jsr	(L003466)
	addq.l	#8,a7
	move.l	d0,(-$0010,a6)
	beq	L0032d4
	bra	L00333a

L0032d4:
	move.l	($0008,a6),d0
	addq.l	#6,d0
	movea.l	d0,a0
	move.l	(a0),d0
	sub.l	d0,(L008838)
	clr.l	(-$0008,a6)
	move.l	(-$0004,a6),-(a7)
	jsr	(L005884)
	addq.l	#4,a7
	move.l	(L007702),d0
	beq	L00331e
	move.l	($0008,a6),-(a7)
	addi.l	#$0000000c,(a7)
	move.l	#L007d94,-(a7)
	move.l	(L008eaa),-(a7)
	jsr	(L004ebc)
	lea.l	($000c,a7),a7
	bra	L003336

L00331e:
	move.l	($0008,a6),-(a7)
	addi.l	#$0000000c,(a7)
	move.l	#L007d99,-(a7)
	jsr	(L005b04)
	addq.l	#8,a7
L003336:
	clr.l	d0
	bra	L00334e

L00333a:
	move.l	(-$0004,a6),-(a7)
	jsr	(L005884)
	addq.l	#4,a7
	move.l	(-$0010,a6),d0
	bra.w	L00334e

L00334e:
	unlk	a6
	rts

L003352:
	link.w	a6,#-$0124
	bra	L002fd2

L00335a:
	bra	L003442

L00335e:
	move.l	($0008,a6),-(a7)
	addi.l	#$0000000c,(a7)
	jsr	(L005c1a)
	addq.l	#4,a7
	move.l	d0,(-$0004,a6)
	move.l	($0008,a6),-(a7)
	addi.l	#$0000000c,(a7)
	move.l	($000c,a6),-(a7)
	jsr	(L005c0c)
	addq.l	#8,a7
	move.l	(-$0004,a6),d0
	addq.l	#1,d0
	move.l	d0,(-$0008,a6)
	move.l	(-$0004,a6),d0
	addq.l	#1,d0
	add.l	d0,($000c,a6)
	move.l	($000c,a6),d0
	movea.l	d0,a0
	move.l	($0008,a6),d1
	movea.l	d1,a1
	move.b	(a1),(a0)
	addq.l	#1,($000c,a6)
	move.l	($0008,a6),d0
	addq.l	#2,d0
	movea.l	d0,a0
	move.w	(a0),d0
	andi.l	#$0000ffff,d0
	move.l	d0,(-$0004,a6)
	move.l	(-$0004,a6),d0
	moveq.l	#$10,d1
	lsl.l	d1,d0
	move.l	d0,(-$0004,a6)
	move.l	($0008,a6),d0
	addq.l	#4,d0
	movea.l	d0,a0
	move.w	(a0),d0
	andi.l	#$0000ffff,d0
	or.l	d0,(-$0004,a6)
	move.l	#$00000004,-(a7)
	move.l	a6,d0
	add.l	#$fffffffc,d0
	move.l	d0,-(a7)
	move.l	($000c,a6),-(a7)
	jsr	(L005ac8)
	lea.l	($000c,a7),a7
	addq.l	#4,($000c,a6)
	move.l	($0008,a6),d0
	addq.l	#6,d0
	movea.l	d0,a0
	move.l	(a0),(-$0004,a6)
	move.l	#$00000004,-(a7)
	move.l	a6,d0
	add.l	#$fffffffc,d0
	move.l	d0,-(a7)
	move.l	($000c,a6),-(a7)
	jsr	(L005ac8)
	lea.l	($000c,a7),a7
	move.l	(-$0008,a6),d0
	add.l	#$00000009,d0
	bra.w	L00343e

L00343e:
	unlk	a6
	rts

L003442:
	link.w	a6,#-$0008
	bra	L00335e

L00344a:
	bra	L003460

L00344c:
	clr.l	(L00883c)
	move.l	(L008e7c),(L008840)
	unlk	a6
	rts

L003460:
	link.w	a6,#$0000
	bra	L00344c

L003466:
	bra	L003548

L00346a:
	move.l	(L007d9e),d0
	beq	L00347c
	move.l	(L007d9e),d0
	bra	L003544

L00347c:
	move.l	(L008e80),d0
	move.l	(L00883c),d1
	sub.l	d1,d0
	move.l	d0,(-$0004,a6)
	move.l	($000c,a6),d0
	cmp.l	(-$0004,a6),d0
	ble	L003502
	move.l	(-$0004,a6),-(a7)
	move.l	(L008840),-(a7)
	move.l	($0008,a6),-(a7)
	jsr	(L00588e)
	lea.l	($000c,a7),a7
	cmp.l	(-$0004,a6),d0
	beq	L0034c2
	moveq.l	#$fd,d0
	move.l	d0,(L007d9e)
	bra	L003544

L0034c2:
	move.l	(L008e80),-(a7)
	move.l	(L008e7c),-(a7)
	move.l	(L008e8c),-(a7)
	jsr	(L0058a2)
	lea.l	($000c,a7),a7
	cmp.l	(L008e80),d0
	beq	L0034f0
	moveq.l	#$fc,d0
	move.l	d0,(L007d9e)
	bra	L003544

L0034f0:
	jsr	(L00344a)
	move.l	(-$0004,a6),d0
	sub.l	d0,($000c,a6)
	bra	L00346a

L003502:
	move.l	($000c,a6),-(a7)
	move.l	(L008840),-(a7)
	move.l	($0008,a6),-(a7)
	jsr	(L00588e)
	lea.l	($000c,a7),a7
	cmp.l	($000c,a6),d0
	beq	L00352a
	moveq.l	#$fd,d0
	move.l	d0,(L007d9e)
	bra	L003544

L00352a:
	move.l	($000c,a6),d0
	add.l	d0,(L00883c)
	move.l	($000c,a6),d0
	add.l	d0,(L008840)
	clr.l	d0
	bra.w	L003544

L003544:
	unlk	a6
	rts

L003548:
	link.w	a6,#-$0004
	bra	L00346a

L003550:
	bra	L00361a

L003554:
	move.l	(L007d9e),d0
	beq	L003566
	move.l	(L007d9e),d0
	bra	L003616

L003566:
	move.l	(L008e80),d0
	move.l	(L00883c),d1
	sub.l	d1,d0
	move.l	d0,(-$0004,a6)
	move.l	($000c,a6),d0
	cmp.l	(-$0004,a6),d0
	ble	L0035e4
	move.l	(-$0004,a6),-(a7)
	move.l	($0008,a6),-(a7)
	move.l	(L008840),-(a7)
	jsr	(L005ac8)
	lea.l	($000c,a7),a7
	move.l	(L008e80),-(a7)
	move.l	(L008e7c),-(a7)
	move.l	(L008e8c),-(a7)
	jsr	(L0058a2)
	lea.l	($000c,a7),a7
	cmp.l	(L008e80),d0
	beq	L0035c8
	moveq.l	#$fc,d0
	move.l	d0,(L007d9e)
	bra	L003616

L0035c8:
	jsr	(L00344a)
	move.l	(-$0004,a6),d0
	sub.l	d0,($000c,a6)
	move.l	(-$0004,a6),d0
	add.l	d0,($0008,a6)
	bra	L003554

L0035e2:
	bra	L003610

L0035e4:
	move.l	($000c,a6),-(a7)
	move.l	($0008,a6),-(a7)
	move.l	(L008840),-(a7)
	jsr	(L005ac8)
	lea.l	($000c,a7),a7
	move.l	($000c,a6),d0
	add.l	d0,(L00883c)
	move.l	($000c,a6),d0
	add.l	d0,(L008840)
L003610:
	clr.l	d0
	bra.w	L003616

L003616:
	unlk	a6
	rts

L00361a:
	link.w	a6,#-$0004
	bra	L003554

L003622:
	bra	L003678

L003624:
	move.l	(L007d9e),d0
	beq	L003634
	move.l	(L007d9e),d0
	bra	L003674

L003634:
	move.l	(L00883c),-(a7)
	move.l	(L008e7c),-(a7)
	move.l	(L008e8c),-(a7)
	jsr	(L0058a2)
	lea.l	($000c,a7),a7
	cmp.l	(L00883c),d0
	beq	L003662
	moveq.l	#$fc,d0
	move.l	d0,(L007d9e)
	bra	L003674

L003662:
	jsr	(L0057a8)
	jsr	(L00344a)
	clr.l	d0
	bra.w	L003674

L003674:
	unlk	a6
	rts

L003678:
	link.w	a6,#$0000
	bra	L003624

L00367e:
	bra	L00374a

L003682:
	jsr	(L0057c8)
	move.l	d0,(-$0062,a6)
	move.l	(-$0062,a6),-(a7)
	jsr	(L0057ac)
	addq.l	#4,a7
	move.l	d0,(L008844)
	clr.l	d7
L0036a0:
	move.l	d7,d0
	cmp.l	#$0000001a,d0
	bge	L0036bc
	move.l	d7,d0
	add.l	#L008e90,d0
	movea.l	d0,a0
	moveq.l	#$ff,d0
	move.b	d0,(a0)
	addq.l	#1,d7
	bra	L0036a0

L0036bc:
	clr.l	d7
L0036be:
	move.l	d7,d0
	cmp.l	(L008844),d0
	bge	L003738
	move.l	(L0089ec),d0
	cmp.l	#$00000150,d0
	bge	L0036e4
	move.l	d7,d0
	add.l	#L008e90,d0
	movea.l	d0,a0
	clr.b	(a0)
	bra	L003734

L0036e4:
	move.l	d7,-(a7)
	jsr	(L0057ac)
	addq.l	#4,a7
	cmp.l	d7,d0
	beq	L003728
	move.l	a6,d0
	add.l	#$ffffffa2,d0
	move.l	d0,-(a7)
	move.l	d7,-(a7)
	addq.l	#1,(a7)
	jsr	(L00584c)
	addq.l	#8,a7
	tst.l	d0
	bne	L00371a
	move.l	d7,d0
	add.l	#L008e90,d0
	movea.l	d0,a0
	clr.b	(a0)
	bra	L003728

L00371a:
	move.l	d7,d0
	add.l	#L008e90,d0
	movea.l	d0,a0
	moveq.l	#$01,d0
	move.b	d0,(a0)
L003728:
	move.l	(-$0062,a6),-(a7)
	jsr	(L0057ac)
	addq.l	#4,a7
L003734:
	addq.l	#1,d7
	bra	L0036be

L003738:
	move.l	(L008844),d0
	bra.w	L003742

L003742:
	movem.l	(a7)+,d7
	unlk	a6
	rts

L00374a:
	link.w	a6,#-$0062
	movem.l	d7,-(a7)
	bra	L003682

L003756:
	bra	L0037ae

L003758:
	movea.l	#L008848,a5
	clr.l	d7
L003760:
	move.l	d7,d0
	cmp.l	(L008844),d0
	bge	L003796
	move.l	d7,d0
	add.l	#L008e90,d0
	movea.l	d0,a0
	move.b	(a0),d0
	ext.w	d0
	ext.l	d0
	tst.l	d0
	bne	L003792
	move.l	d7,d0
	asl.l	#2,d0
	add.l	#L007da2,d0
	movea.l	d0,a0
	move.l	(a0),d0
	addq.l	#1,d0
	move.l	d0,(a5)
	addq.l	#4,a5
L003792:
	addq.l	#1,d7
	bra	L003760

L003796:
	move.l	#L007faa,(a5)
	move.l	#L008848,d0
	bra.w	L0037a6

L0037a6:
	movem.l	(a7)+,d7/a5
	unlk	a6
	rts

L0037ae:
	link.w	a6,#$0000
	movem.l	d7/a5,-(a7)
	bra	L003758

L0037b8:
	bra	L003caa

L0037bc:
	movea.l	($000c,a6),a5
	move.l	($0008,a6),d0
	addq.l	#8,d0
	movea.l	d0,a0
	move.w	(a0),d0
	andi.l	#$0000ffff,d0
	move.l	d0,(-$000c,a6)
	move.l	($0008,a6),d0
	addq.l	#4,d0
	movea.l	d0,a0
	move.w	(a0),d0
	andi.l	#$0000ffff,d0
	move.l	($0008,a6),d1
	addq.l	#8,d1
	movea.l	d1,a1
	move.w	(a1),d1
	andi.l	#$0000ffff,d1
	sub.l	d1,d0
	move.l	d0,(-$0010,a6)
	jsr	(L005816)
	move.l	#$00000015,(-$0004,a6)
	clr.l	d5
L00380a:
	move.l	d5,d0
	cmp.l	#$0000000c,d0
	bge	L00383e
	move.l	d5,d0
	moveq.l	#$06,d1
	movem.l	d0-d1,-(a7)
	FPACK	__CLMUL
	movem.l	(a7)+,d0-d1
	add.l	#L0088b4,d0
	move.l	d0,-(a7)
	move.l	(-$0004,a6),-(a7)
	addq.l	#1,(-$0004,a6)
	jsr	(L0057d6)
	addq.l	#8,a7
	addq.l	#1,d5
	bra	L00380a

L00383e:
	move.l	#L007fb0,-(a7)
	move.l	#$0000001a,-(a7)
	jsr	(L0057e8)
	addq.l	#8,a7
	move.l	#L007fb6,-(a7)
	move.l	#$0000001b,-(a7)
	jsr	(L0057e8)
	addq.l	#8,a7
	move.l	#$000000ff,-(a7)
	jsr	(L00579a)
	addq.l	#4,a7
	clr.b	(a5)
	clr.l	d7
	clr.l	d6
	clr.l	(-$0008,a6)
L00387e:
	jsr	(L00582a)
	move.l	d0,(-$0004,a6)
	move.l	(-$0004,a6),d0
	cmp.l	#$00000020,d0
	bge	L003b34
	move.l	(-$0004,a6),d0
	cmp.l	#$0000001b,d0
	bne	L0038ae
	jsr	(L005820)
	moveq.l	#$ff,d0
	bra	L003ca2

L0038ae:
	move.l	a5,d0
	add.l	d7,d0
	movea.l	d0,a4
	move.l	(-$0004,a6),d0
	bra	L003b02

L0038bc:
	move.l	d7,d0
	beq	L00395c
	move.l	d7,d0
	cmp.l	#$00000002,d0
	blt	L00392c
	subq.l	#1,a4
	move.b	(a4),d0
	andi.l	#$000000ff,d0
	move.l	d0,-(a7)
	jsr	(L00597c)
	addq.l	#4,a7
	tst.l	d0
	beq	L0038e8
	moveq.l	#$02,d5
	bra	L00392a

L0038e8:
	subq.l	#1,a4
	clr.l	d5
L0038ec:
	move.b	(a4),d0
	andi.l	#$000000ff,d0
	move.l	d0,-(a7)
	jsr	(L00597c)
	addq.l	#4,a7
	tst.l	d0
	beq	L003910
	addq.l	#1,d5
	move.l	a4,d0
	cmp.l	a5,d0
	bne	L00390c
	bra	L003910

L00390c:
	subq.l	#1,a4
	bra	L0038ec

L003910:
	move.l	d5,d0
	moveq.l	#$02,d1
	movem.l	d0-d1,-(a7)
	FPACK	__CLMOD
	movem.l	(a7)+,d0-d1
	move.l	d0,d5
	move.l	d5,d0
	beq	L003928
	moveq.l	#$02,d5
	bra	L00392a

L003928:
	moveq.l	#$01,d5
L00392a:
	bra	L00392e

L00392c:
	moveq.l	#$01,d5
L00392e:
	sub.l	d5,d7
	move.l	($0008,a6),d0
	add.l	#$0000000a,d0
	movea.l	d0,a0
	move.w	(a0),d0
	andi.l	#$0000ffff,d0
	move.l	d0,-(a7)
	move.l	d7,d0
	add.l	(-$000c,a6),d0
	move.l	d0,-(a7)
	move.l	($0008,a6),-(a7)
	jsr	(L00401e)
	lea.l	($000c,a7),a7
L00395c:
	bra	L003b2c

L003960:
	move.l	d7,d0
	cmp.l	d6,d0
	bge	L0039ac
	move.b	(a4),d0
	andi.l	#$000000ff,d0
	move.l	d0,-(a7)
	jsr	(L00597c)
	addq.l	#4,a7
	tst.l	d0
	beq	L00397e
	addq.l	#1,d7
L00397e:
	addq.l	#1,d7
	move.l	($0008,a6),d0
	add.l	#$0000000a,d0
	movea.l	d0,a0
	move.w	(a0),d0
	andi.l	#$0000ffff,d0
	move.l	d0,-(a7)
	move.l	d7,d0
	add.l	(-$000c,a6),d0
	move.l	d0,-(a7)
	move.l	($0008,a6),-(a7)
	jsr	(L00401e)
	lea.l	($000c,a7),a7
L0039ac:
	bra	L003b2c

L0039b0:
	move.l	d7,d0
	beq	L003af8
	move.l	d7,d0
	cmp.l	#$00000002,d0
	blt	L003a20
	subq.l	#1,a4
	move.b	(a4),d0
	andi.l	#$000000ff,d0
	move.l	d0,-(a7)
	jsr	(L00597c)
	addq.l	#4,a7
	tst.l	d0
	beq	L0039dc
	moveq.l	#$02,d5
	bra	L003a1e

L0039dc:
	subq.l	#1,a4
	clr.l	d5
L0039e0:
	move.b	(a4),d0
	andi.l	#$000000ff,d0
	move.l	d0,-(a7)
	jsr	(L00597c)
	addq.l	#4,a7
	tst.l	d0
	beq	L003a04
	addq.l	#1,d5
	move.l	a4,d0
	cmp.l	a5,d0
	bne	L003a00
	bra	L003a04

L003a00:
	subq.l	#1,a4
	bra	L0039e0

L003a04:
	move.l	d5,d0
	moveq.l	#$02,d1
	movem.l	d0-d1,-(a7)
	FPACK	__CLMOD
	movem.l	(a7)+,d0-d1
	move.l	d0,d5
	move.l	d5,d0
	beq	L003a1c
	moveq.l	#$02,d5
	bra	L003a1e

L003a1c:
	moveq.l	#$01,d5
L003a1e:
	bra	L003a22

L003a20:
	moveq.l	#$01,d5
L003a22:
	move.l	d5,(-$0004,a6)
	move.l	d6,d5
	sub.l	d7,d5
	move.l	a5,d0
	add.l	d7,d0
	movea.l	d0,a4
	movea.l	a4,a3
	move.l	(-$0004,a6),d0
	suba.l	d0,a3
L003a38:
	move.l	d5,d0
	subq.l	#1,d5
	tst.l	d0
	beq	L003a48
	move.b	(a4),(a3)
	addq.l	#1,a3
	addq.l	#1,a4
	bra	L003a38

L003a48:
	move.l	d6,d5
	sub.l	d7,d5
	move.l	(-$0004,a6),d0
	sub.l	d0,d7
	move.l	(-$0004,a6),d0
	sub.l	d0,d6
	move.l	a5,d0
	add.l	d7,d0
	movea.l	d0,a4
	move.l	($0008,a6),d0
	add.l	#$0000000a,d0
	movea.l	d0,a0
	move.w	(a0),d0
	andi.l	#$0000ffff,d0
	move.l	d0,-(a7)
	move.l	d7,d0
	add.l	(-$000c,a6),d0
	move.l	d0,-(a7)
	move.l	($0008,a6),-(a7)
	jsr	(L00401e)
	lea.l	($000c,a7),a7
L003a8a:
	move.l	d5,d0
	subq.l	#1,d5
	tst.l	d0
	beq	L003aac
	move.l	($0008,a6),-(a7)
	move.b	(a4),d0
	andi.l	#$000000ff,d0
	move.l	d0,-(a7)
	addq.l	#1,a4
	jsr	(L003cb6)
	addq.l	#8,a7
	bra	L003a8a

L003aac:
	move.l	(-$0004,a6),d0
	subq.l	#1,(-$0004,a6)
	tst.l	d0
	beq	L003acc
	move.l	($0008,a6),-(a7)
	move.l	#$00000020,-(a7)
	jsr	(L003cb6)
	addq.l	#8,a7
	bra	L003aac

L003acc:
	move.l	($0008,a6),d0
	add.l	#$0000000a,d0
	movea.l	d0,a0
	move.w	(a0),d0
	andi.l	#$0000ffff,d0
	move.l	d0,-(a7)
	move.l	d7,d0
	add.l	(-$000c,a6),d0
	move.l	d0,-(a7)
	move.l	($0008,a6),-(a7)
	jsr	(L00401e)
	lea.l	($000c,a7),a7
L003af8:
	bra	L003b2c

L003afa:
	bra	L003c50

L003afe:
	bra	L003b2c

L003b00:
	bra	L003b2c

L003b02:
	cmpi.l	#$00000004,d0
	beq	L003960
	cmpi.l	#$00000008,d0
	beq	L0039b0
	cmpi.l	#$0000000d,d0
	beq	L003afa
	cmpi.l	#$00000013,d0
	beq	L0038bc
	bra.w	L003b2c

L003b2c:
	bra	L00387e

L003b30:
	bra	L003c50

L003b34:
	move.l	d7,d0
	cmp.l	d6,d0
	bne	L003b6a
	move.l	a5,d0
	add.l	d7,d0
	movea.l	d0,a0
	move.l	(-$0004,a6),d1
	move.b	d1,(a0)
	move.l	($0008,a6),-(a7)
	move.l	(-$0004,a6),-(a7)
	jsr	(L003cb6)
	addq.l	#8,a7
	addq.l	#1,d7
	addq.l	#1,d6
	move.l	d6,d0
	cmp.l	(-$0010,a6),d0
	blt	L003b66
	bra	L003c50

L003b66:
	bra	L00387e

L003b6a:
	move.l	(L007fac),d0
	beq	L003c24
	move.l	d6,d5
	sub.l	d7,d5
	move.l	a5,d0
	add.l	d6,d0
	movea.l	d0,a4
L003b7e:
	move.l	d5,d0
	subq.l	#1,d5
	tst.l	d0
	beq	L003b92
	move.l	a4,d0
	subq.l	#1,d0
	movea.l	d0,a0
	move.b	(a0),(a4)
	subq.l	#1,a4
	bra	L003b7e

L003b92:
	move.l	(-$0004,a6),d0
	move.b	d0,(a4)
	move.l	(-$0004,a6),-(a7)
	jsr	(L00597c)
	addq.l	#4,a7
	tst.l	d0
	beq	L003bae
	move.l	(-$0008,a6),d0
	beq	L003c16
L003bae:
	move.l	d6,d5
	sub.l	d7,d5
	addq.l	#1,d5
	move.l	(-$0008,a6),d0
	beq	L003bbe
	subq.l	#1,a4
	addq.l	#1,d5
L003bbe:
	clr.l	(-$0008,a6)
L003bc2:
	move.l	d5,d0
	subq.l	#1,d5
	tst.l	d0
	beq	L003be4
	move.l	($0008,a6),-(a7)
	move.b	(a4),d0
	andi.l	#$000000ff,d0
	move.l	d0,-(a7)
	jsr	(L003cb6)
	addq.l	#8,a7
	addq.l	#1,a4
	bra	L003bc2

L003be4:
	addq.l	#1,d7
	addq.l	#1,d6
	move.l	($0008,a6),d0
	add.l	#$0000000a,d0
	movea.l	d0,a0
	move.w	(a0),d0
	andi.l	#$0000ffff,d0
	move.l	d0,-(a7)
	move.l	d7,d0
	add.l	(-$000c,a6),d0
	move.l	d0,-(a7)
	move.l	($0008,a6),-(a7)
	jsr	(L00401e)
	lea.l	($000c,a7),a7
	bra	L003c22

L003c16:
	move.l	#$00000001,(-$0008,a6)
	addq.l	#1,d7
	addq.l	#1,d6
L003c22:
	bra	L003c42

L003c24:
	move.l	a5,d0
	add.l	d7,d0
	movea.l	d0,a0
	move.l	(-$0004,a6),d1
	move.b	d1,(a0)
	addq.l	#1,d7
	move.l	($0008,a6),-(a7)
	move.l	(-$0004,a6),-(a7)
	jsr	(L003cb6)
	addq.l	#8,a7
L003c42:
	move.l	d6,d0
	cmp.l	(-$0010,a6),d0
	blt	L003c4c
	bra	L003c50

L003c4c:
	bra	L00387e

L003c50:
	move.l	#$00000015,(-$0004,a6)
	clr.l	d5
L003c5a:
	move.l	d5,d0
	cmp.l	#$0000000c,d0
	bge	L003c8e
	move.l	d5,d0
	moveq.l	#$06,d1
	movem.l	d0-d1,-(a7)
	FPACK	__CLMUL
	movem.l	(a7)+,d0-d1
	add.l	#L0088b4,d0
	move.l	d0,-(a7)
	move.l	(-$0004,a6),-(a7)
	addq.l	#1,(-$0004,a6)
	jsr	(L0057e8)
	addq.l	#8,a7
	addq.l	#1,d5
	bra	L003c5a

L003c8e:
	move.l	a5,d0
	add.l	d6,d0
	movea.l	d0,a0
	clr.b	(a0)
	jsr	(L005820)
	move.l	d6,d0
	bra.w	L003ca2

L003ca2:
	movem.l	(a7)+,d5-d7/a3-a5
	unlk	a6
	rts

L003caa:
	link.w	a6,#-$0010
	movem.l	d5-d7/a3-a5,-(a7)
	bra	L0037bc

L003cb6:
	bra	L004012

L003cba:
	move.b	($000b,a6),d7
	movea.l	($000c,a6),a5
	move.b	($0012,a5),d0
	ext.w	d0
	ext.l	d0
	tst.l	d0
	bne	L003cd4
	moveq.l	#$ff,d0
	bra	L00400a

L003cd4:
	move.l	a5,d0
	cmp.l	(L008e88),d0
	beq	L003d1e
	move.l	a5,(L008e88)
	move.w	($000a,a5),d0
	andi.l	#$0000ffff,d0
	move.l	d0,-(a7)
	move.w	($0008,a5),d0
	andi.l	#$0000ffff,d0
	move.l	d0,-(a7)
	move.l	a5,-(a7)
	jsr	(L00401e)
	lea.l	($000c,a7),a7
	move.w	($000c,a5),d0
	andi.l	#$0000ffff,d0
	move.l	d0,-(a7)
	move.l	a5,-(a7)
	jsr	(L004198)
	addq.l	#8,a7
L003d1e:
	move.b	d7,d0
	andi.l	#$000000ff,d0
	cmp.l	#$00000020,d0
	bcc	L003d32
	bra	L003e40

L003d32:
	move.w	($0004,a5),d0
	andi.l	#$0000ffff,d0
	move.w	($0008,a5),d1
	andi.l	#$0000ffff,d1
	sub.l	d1,d0
	cmp.l	#$00000001,d0
	bne	L003d90
	move.b	d7,d0
	andi.l	#$000000ff,d0
	move.l	d0,-(a7)
	jsr	(L00597c)
	addq.l	#4,a7
	tst.l	d0
	beq	L003d90
	move.b	(L0088fc),d0
	andi.l	#$000000ff,d0
	move.l	d0,-(a7)
	jsr	(L00597c)
	addq.l	#4,a7
	tst.l	d0
	bne	L003d90
	move.l	a5,-(a7)
	move.l	#$00000020,-(a7)
	jsr	(L003cb6)
	addq.l	#8,a7
L003d90:
	move.b	d7,d0
	andi.l	#$000000ff,d0
	move.l	d0,-(a7)
	jsr	(L00576c)
	addq.l	#4,a7
	addq.w	#1,($0008,a5)
	move.w	($0008,a5),d0
	andi.l	#$0000ffff,d0
	move.w	($0004,a5),d1
	andi.l	#$0000ffff,d1
	cmp.l	d1,d0
	bne	L003e2e
	clr.w	($0008,a5)
	addq.w	#1,($000a,a5)
	move.w	($000a,a5),d0
	andi.l	#$0000ffff,d0
	move.w	($0006,a5),d1
	andi.l	#$0000ffff,d1
	cmp.l	d1,d0
	bne	L003e04
	jsr	(L005776)
	move.l	a5,-(a7)
	jsr	(L0041ea)
	addq.l	#4,a7
	jsr	(L00574e)
	move.w	($0006,a5),d0
	andi.l	#$0000ffff,d0
	subq.l	#1,d0
	move.w	d0,($000a,a5)
L003e04:
	move.w	($0002,a5),d0
	andi.l	#$0000ffff,d0
	move.w	($000a,a5),d1
	andi.l	#$0000ffff,d1
	add.l	d1,d0
	move.l	d0,-(a7)
	move.w	(a5),d0
	andi.l	#$0000ffff,d0
	move.l	d0,-(a7)
	jsr	(L005760)
	addq.l	#8,a7
L003e2e:
	move.b	d7,(L0088fc)
	move.b	d7,d0
	andi.l	#$000000ff,d0
	bra	L00400a

L003e40:
	move.b	d7,d0
	andi.l	#$000000ff,d0
	bra	L003fba

L003e4c:
	clr.w	($0008,a5)
	move.w	($0002,a5),d0
	andi.l	#$0000ffff,d0
	move.w	($000a,a5),d1
	andi.l	#$0000ffff,d1
	add.l	d1,d0
	move.l	d0,-(a7)
	move.w	(a5),d0
	andi.l	#$0000ffff,d0
	move.l	d0,-(a7)
	jsr	(L005760)
	addq.l	#8,a7
	bra	L004004

L003e7e:
	addq.w	#1,($000a,a5)
	move.w	($000a,a5),d0
	andi.l	#$0000ffff,d0
	move.w	($0006,a5),d1
	andi.l	#$0000ffff,d1
	cmp.l	d1,d0
	bne	L003ec0
	jsr	(L005776)
	move.l	a5,-(a7)
	jsr	(L0041ea)
	addq.l	#4,a7
	jsr	(L00574e)
	move.w	($0006,a5),d0
	andi.l	#$0000ffff,d0
	subq.l	#1,d0
	move.w	d0,($000a,a5)
L003ec0:
	move.w	($0002,a5),d0
	andi.l	#$0000ffff,d0
	move.w	($000a,a5),d1
	andi.l	#$0000ffff,d1
	add.l	d1,d0
	move.l	d0,-(a7)
	move.w	(a5),d0
	andi.l	#$0000ffff,d0
	move.w	($0008,a5),d1
	andi.l	#$0000ffff,d1
	add.l	d1,d0
	move.l	d0,-(a7)
	jsr	(L005760)
	addq.l	#8,a7
	bra	L004004

L003efa:
	moveq.l	#$08,d0
	move.w	($0008,a5),d1
	andi.l	#$0000ffff,d1
	and.l	#$00000007,d1
	sub.l	d1,d0
	move.l	d0,d6
L003f10:
	move.l	d6,d0
	subq.l	#1,d6
	tst.l	d0
	beq	L003f2a
	move.l	a5,-(a7)
	move.l	#$00000020,-(a7)
	jsr	(L003cb6)
	addq.l	#8,a7
	bra	L003f10

L003f2a:
	bra	L004004

L003f2e:
	move.w	($000c,a5),d0
	andi.l	#$0000ffff,d0
	move.l	d0,-(a7)
	jsr	(L005222)
	addq.l	#4,a7
	add.w	d0,($0008,a5)
	bra	L004004

L003f4a:
	move.w	($000c,a5),d0
	andi.l	#$0000ffff,d0
	move.l	d0,-(a7)
	jsr	(L005230)
	addq.l	#4,a7
	add.w	d0,($0008,a5)
	bra	L004004

L003f66:
	move.w	($000c,a5),d0
	andi.l	#$0000ffff,d0
	move.l	d0,-(a7)
	jsr	(L00523e)
	addq.l	#4,a7
	add.w	d0,($0008,a5)
	bra	L004004

L003f82:
	move.w	($000c,a5),d0
	andi.l	#$0000ffff,d0
	move.l	d0,-(a7)
	jsr	(L00524c)
	addq.l	#4,a7
	add.w	d0,($0008,a5)
	bra	L004004

L003f9c:
	move.w	($000c,a5),d0
	andi.l	#$0000ffff,d0
	move.l	d0,-(a7)
	jsr	(L00525a)
	addq.l	#4,a7
	add.w	d0,($0008,a5)
	bra	L004004

L003fb6:
	bra	L004004

L003fb8:
	bra	L004004

L003fba:
	subq.l	#1,d0
	cmpi.l	#$0000000c,d0
	bhi	L004004
	asl.l	#2,d0
	lea.l	(L003fd0,pc),a0
	movea.l	(a0,d0.l),a0
	jmp	(a0)

L003fd0:
	.dc.l	L003f2e
	.dc.l	L003f4a
	.dc.l	L003f66
	.dc.l	L003f82
	.dc.l	L003f9c
	.dc.l	L004004
	.dc.l	L004004
	.dc.l	L004004
	.dc.l	L003efa
	.dc.l	L003e7e
	.dc.l	L004004
	.dc.l	L004004
	.dc.l	L003e4c
L004004:
	move.b	d7,(L0088fc)
L00400a:
	movem.l	(a7)+,d6-d7/a5
	unlk	a6
	rts

L004012:
	link.w	a6,#$0000
	movem.l	d6-d7/a5,-(a7)
	bra	L003cba

L00401e:
	bra	L0040c6

L004022:
	movea.l	($0008,a6),a5
	move.w	($000e,a6),d7
	move.w	($0012,a6),d6
	move.b	($0012,a5),d0
	ext.w	d0
	ext.l	d0
	tst.l	d0
	bne	L004040
	moveq.l	#$ff,d0
	bra.w	L0040be

L004040:
	move.w	d7,d0
	andi.l	#$0000ffff,d0
	move.w	($0004,a5),d1
	andi.l	#$0000ffff,d1
	cmp.l	d1,d0
	bcs	L00405a
	moveq.l	#$ff,d0
	bra	L0040be

L00405a:
	move.w	d6,d0
	andi.l	#$0000ffff,d0
	move.w	($0006,a5),d1
	andi.l	#$0000ffff,d1
	cmp.l	d1,d0
	bcs	L004074
	moveq.l	#$ff,d0
	bra	L0040be

L004074:
	move.w	d7,($0008,a5)
	move.w	d6,($000a,a5)
	move.l	a5,d0
	cmp.l	(L008e88),d0
	bne	L0040b8
	move.w	($0002,a5),d0
	andi.l	#$0000ffff,d0
	move.w	d6,d1
	andi.l	#$0000ffff,d1
	add.l	d1,d0
	move.l	d0,-(a7)
	move.w	(a5),d0
	andi.l	#$0000ffff,d0
	move.w	d7,d1
	andi.l	#$0000ffff,d1
	add.l	d1,d0
	move.l	d0,-(a7)
	jsr	(L005760)
	addq.l	#8,a7
L0040b8:
	clr.l	d0
	bra.w	L0040be

L0040be:
	movem.l	(a7)+,d6-d7/a5
	unlk	a6
	rts

L0040c6:
	link.w	a6,#$0000
	movem.l	d6-d7/a5,-(a7)
	bra	L004022

L0040d2:
	bra	L004190

L0040d6:
	move.l	($0008,a6),d0
	add.l	#$00000012,d0
	movea.l	d0,a0
	move.b	(a0),d0
	ext.w	d0
	ext.l	d0
	tst.l	d0
	bne	L0040f2
	moveq.l	#$ff,d0
	bra	L00418c

L0040f2:
	move.l	($0008,a6),d0
	movea.l	d0,a0
	move.w	(a0),d0
	andi.l	#$0000ffff,d0
	lsl.l	#3,d0
	move.w	d0,(-$000a,a6)
	move.l	($0008,a6),d0
	addq.l	#2,d0
	movea.l	d0,a0
	move.w	(a0),d0
	andi.l	#$0000ffff,d0
	lsl.l	#4,d0
	move.w	d0,(-$0008,a6)
	move.l	($0008,a6),d0
	addq.l	#4,d0
	movea.l	d0,a0
	move.w	(a0),d0
	andi.l	#$0000ffff,d0
	lsl.l	#3,d0
	move.w	d0,(-$0006,a6)
	move.l	($0008,a6),d0
	addq.l	#6,d0
	movea.l	d0,a0
	move.w	(a0),d0
	andi.l	#$0000ffff,d0
	lsl.l	#4,d0
	move.w	d0,(-$0004,a6)
	clr.w	(-$0002,a6)
	clr.w	(-$000c,a6)
	move.l	a6,d0
	add.l	#$fffffff4,d0
	move.l	d0,-(a7)
	jsr	(L005786)
	addq.l	#4,a7
	moveq.l	#$01,d0
	move.w	d0,(-$000c,a6)
	move.l	a6,d0
	add.l	#$fffffff4,d0
	move.l	d0,-(a7)
	jsr	(L005786)
	addq.l	#4,a7
	clr.l	-(a7)
	clr.l	-(a7)
	move.l	($0008,a6),-(a7)
	jsr	(L00401e)
	lea.l	($000c,a7),a7
L00418c:
	unlk	a6
	rts

L004190:
	link.w	a6,#-$000c
	bra	L0040d6

L004198:
	bra	L0041e0

L00419a:
	movea.l	($0008,a6),a5
	move.l	($000c,a6),d7
	move.l	a5,d0
	cmp.l	(L008e88),d0
	bne	L0041c0
	move.l	d7,-(a7)
	jsr	(L005744)
	addq.l	#4,a7
	move.l	d0,d6
	bge	L0041be
	moveq.l	#$ff,d0
	bra	L0041d8

L0041be:
	bra	L0041cc

L0041c0:
	move.w	($000c,a5),d0
	andi.l	#$0000ffff,d0
	move.l	d0,d6
L0041cc:
	move.l	d7,d0
	move.w	d0,($000c,a5)
	move.l	d6,d0
	bra.w	L0041d8

L0041d8:
	movem.l	(a7)+,d6-d7/a5
	unlk	a6
	rts

L0041e0:
	link.w	a6,#$0000
	movem.l	d6-d7/a5,-(a7)
	bra	L00419a

L0041ea:
	bra	L004216

L0041ec:
	clr.l	-(a7)
	jsr	(L0057cc)
	addq.l	#4,a7
	move.l	d0,(-$0004,a6)
	move.l	($0008,a6),-(a7)
	jsr	(L004eda)
	addq.l	#4,a7
	move.l	(-$0004,a6),-(a7)
	jsr	(L0057cc)
	addq.l	#4,a7
	unlk	a6
	rts

L004216:
	link.w	a6,#-$0004
	bra	L0041ec

L00421c:
	bra	L004248

L00421e:
	clr.l	-(a7)
	jsr	(L0057cc)
	addq.l	#4,a7
	move.l	d0,(-$0004,a6)
	move.l	($0008,a6),-(a7)
	jsr	(L005054)
	addq.l	#4,a7
	move.l	(-$0004,a6),-(a7)
	jsr	(L0057cc)
	addq.l	#4,a7
	unlk	a6
	rts

L004248:
	link.w	a6,#-$0004
	bra	L00421e

L00424e:
	bra	L004296

L004250:
	move.l	($0008,a6),-(a7)
	jsr	(L0059de)
	addq.l	#4,a7
	move.l	d0,(-$0004,a6)
	beq	L004268
	move.l	(-$0004,a6),d0
	bra	L004292

L004268:
	move.l	($0008,a6),-(a7)
	jsr	(L005b24)
	addq.l	#4,a7
	cmp.l	#$ffffffff,d0
	bne	L004282
	clr.l	d0
	bra	L004292

L004280:
	bra	L004292

L004282:
	move.l	($0008,a6),-(a7)
	jsr	(L0059de)
	addq.l	#4,a7
	bra.w	L004292

L004292:
	unlk	a6
	rts

L004296:
	link.w	a6,#-$0004
	bra	L004250

L00429c:
	bra	L0042ae

L00429e:
	move.l	($0008,a6),-(a7)
	jsr	(L00594a)
	addq.l	#4,a7
	unlk	a6
	rts

L0042ae:
	link.w	a6,#$0000
	bra	L00429e

L0042b4:
	bra	L004470

L0042b8:
	movea.l	($0008,a6),a5
	movea.l	($000c,a6),a4
	jsr	(L0051e6)
	move.l	a5,d0
	bne	L0042e8
	move.l	(L008902),d7
	movea.l	(L0088fe),a5
	move.l	(L008906),d6
	move.l	(L00890a),d5
	moveq.l	#$3e,d4			;'>'
	bra	L004386

L0042e8:
	move.l	a5,(L0088fe)
	clr.l	d7
L0042f0:
	move.w	($0006,a5),d0
	andi.l	#$0000ffff,d0
	cmp.l	d7,d0
	bls	L004336
	move.l	d7,d0
	asl.l	#2,d0
	add.l	a4,d0
	movea.l	d0,a0
	move.l	(a0),d0
	movea.l	d0,a0
	move.b	(a0),d0
	ext.w	d0
	ext.l	d0
	tst.l	d0
	bne	L004316
	bra	L004336

L004316:
	move.l	($0010,a6),-(a7)
	move.l	d7,-(a7)
	move.l	d7,d0
	asl.l	#2,d0
	add.l	a4,d0
	movea.l	d0,a0
	move.l	(a0),-(a7)
	move.l	a5,-(a7)
	jsr	(L004718)
	lea.l	($0010,a7),a7
	addq.l	#1,d7
	bra	L0042f0

L004336:
	clr.l	d6
	clr.l	d5
	move.l	($0010,a6),-(a7)
	move.l	#$0000000a,-(a7)
	move.l	d6,-(a7)
	move.l	(a4),-(a7)
	move.l	a5,-(a7)
	jsr	(L004654)
	lea.l	($0014,a7),a7
L004354:
	jsr	(L0047ba)
	move.l	d0,d4
	move.l	d4,d0
	cmp.l	#$0000001d,d0
	beq	L004448
	move.l	d4,d0
	cmp.l	#$0000004e,d0
	bne	L004376
	bra	L004448

L004376:
	move.l	d4,d0
	cmp.l	#$00000001,d0
	bne	L004386
	moveq.l	#$ff,d6
	bra	L00445c

L004386:
	move.l	d4,d0
	cmp.l	#$0000003e,d0
	beq	L0043a6
	move.l	d4,d0
	cmp.l	#$0000003c,d0
	beq	L0043a6
	move.l	d4,d0
	cmp.l	#$00000035,d0
	bne	L004444
L0043a6:
	move.l	($0010,a6),-(a7)
	move.l	d6,-(a7)
	move.l	d6,d0
	add.l	d5,d0
	asl.l	#2,d0
	add.l	a4,d0
	movea.l	d0,a0
	move.l	(a0),-(a7)
	move.l	a5,-(a7)
	jsr	(L004718)
	lea.l	($0010,a7),a7
	move.l	d4,d0
	cmp.l	#$0000003e,d0
	beq	L0043d8
	move.l	d4,d0
	cmp.l	#$00000035,d0
	bne	L004408
L0043d8:
	addq.l	#1,d6
	move.l	d6,d0
	cmp.l	d7,d0
	bne	L004406
	move.l	d6,d0
	add.l	d5,d0
	asl.l	#2,d0
	add.l	a4,d0
	movea.l	d0,a0
	move.l	(a0),d0
	movea.l	d0,a0
	move.b	(a0),d0
	ext.w	d0
	ext.l	d0
	tst.l	d0
	beq	L004404
	addq.l	#1,d5
	move.l	a5,-(a7)
	jsr	(L0041ea)
	addq.l	#4,a7
L004404:
	subq.l	#1,d6
L004406:
	bra	L004420

L004408:
	subq.l	#1,d6
	move.l	d6,d0
	bge	L004420
	move.l	d5,d0
	beq	L00441e
	subq.l	#1,d5
	move.l	a5,-(a7)
	jsr	(L00421c)
	addq.l	#4,a7
L00441e:
	addq.l	#1,d6
L004420:
	move.l	($0010,a6),-(a7)
	move.l	#$0000000a,-(a7)
	move.l	d6,-(a7)
	move.l	d6,d0
	add.l	d5,d0
	asl.l	#2,d0
	add.l	a4,d0
	movea.l	d0,a0
	move.l	(a0),-(a7)
	move.l	a5,-(a7)
	jsr	(L004654)
	lea.l	($0014,a7),a7
L004444:
	bra	L004354

L004448:
	move.l	d7,(L008902)
	move.l	d5,(L00890a)
	move.l	d6,(L008906)
	add.l	d5,d6
L00445c:
	jsr	(L0051fe)
	move.l	d6,d0
	bra.w	L004468

L004468:
	movem.l	(a7)+,d4-d7/a4-a5
	unlk	a6
	rts

L004470:
	link.w	a6,#$0000
	movem.l	d4-d7/a4-a5,-(a7)
	bra	L0042b8

L00447c:
	bra	L004648

L004480:
	movea.l	($0008,a6),a5
	movea.l	($000c,a6),a4
	jsr	(L0051e6)
	move.l	a5,d0
	bne	L0044b0
	move.l	(L008912),d7
	movea.l	(L00890e),a5
	move.l	(L008916),d6
	move.l	(L00891a),d5
	moveq.l	#$3e,d4			;'>'
	bra	L00455e

L0044b0:
	move.l	a5,(L00890e)
	clr.l	d7
L0044b8:
	move.w	($0006,a5),d0
	andi.l	#$0000ffff,d0
	cmp.l	d7,d0
	bls	L0044fe
	move.l	d7,d0
	asl.l	#2,d0
	add.l	a4,d0
	movea.l	d0,a0
	move.l	(a0),d0
	movea.l	d0,a0
	move.b	(a0),d0
	ext.w	d0
	ext.l	d0
	tst.l	d0
	bne	L0044de
	bra	L0044fe

L0044de:
	move.l	($0010,a6),-(a7)
	move.l	d7,-(a7)
	move.l	d7,d0
	asl.l	#2,d0
	add.l	a4,d0
	movea.l	d0,a0
	move.l	(a0),-(a7)
	move.l	a5,-(a7)
	jsr	(L004718)
	lea.l	($0010,a7),a7
	addq.l	#1,d7
	bra	L0044b8

L0044fe:
	clr.l	d6
	clr.l	d5
	move.l	($0010,a6),-(a7)
	move.l	#$0000000a,-(a7)
	move.l	d6,-(a7)
	move.l	(a4),-(a7)
	move.l	a5,-(a7)
	jsr	(L004654)
	lea.l	($0014,a7),a7
L00451c:
	jsr	(L0047ba)
	move.l	d0,d4
	move.l	d4,d0
	cmp.l	#$0000001d,d0
	beq	L004620
	move.l	d4,d0
	cmp.l	#$0000004e,d0
	bne	L00453e
	bra	L004620

L00453e:
	move.l	d4,d0
	cmp.l	#$00000001,d0
	bne	L00454e
	moveq.l	#$ff,d6
	bra	L004634

L00454e:
	move.l	d4,d0
	cmp.l	#$00000022,d0
	bne	L00455e
	moveq.l	#$fe,d6
	bra	L004634

L00455e:
	move.l	d4,d0
	cmp.l	#$0000003e,d0
	beq	L00457e
	move.l	d4,d0
	cmp.l	#$0000003c,d0
	beq	L00457e
	move.l	d4,d0
	cmp.l	#$00000035,d0
	bne	L00461c
L00457e:
	move.l	($0010,a6),-(a7)
	move.l	d6,-(a7)
	move.l	d6,d0
	add.l	d5,d0
	asl.l	#2,d0
	add.l	a4,d0
	movea.l	d0,a0
	move.l	(a0),-(a7)
	move.l	a5,-(a7)
	jsr	(L004718)
	lea.l	($0010,a7),a7
	move.l	d4,d0
	cmp.l	#$0000003e,d0
	beq	L0045b0
	move.l	d4,d0
	cmp.l	#$00000035,d0
	bne	L0045e0
L0045b0:
	addq.l	#1,d6
	move.l	d6,d0
	cmp.l	d7,d0
	bne	L0045de
	move.l	d6,d0
	add.l	d5,d0
	asl.l	#2,d0
	add.l	a4,d0
	movea.l	d0,a0
	move.l	(a0),d0
	movea.l	d0,a0
	move.b	(a0),d0
	ext.w	d0
	ext.l	d0
	tst.l	d0
	beq	L0045dc
	addq.l	#1,d5
	move.l	a5,-(a7)
	jsr	(L0041ea)
	addq.l	#4,a7
L0045dc:
	subq.l	#1,d6
L0045de:
	bra	L0045f8

L0045e0:
	subq.l	#1,d6
	move.l	d6,d0
	bge	L0045f8
	move.l	d5,d0
	beq	L0045f6
	subq.l	#1,d5
	move.l	a5,-(a7)
	jsr	(L00421c)
	addq.l	#4,a7
L0045f6:
	addq.l	#1,d6
L0045f8:
	move.l	($0010,a6),-(a7)
	move.l	#$0000000a,-(a7)
	move.l	d6,-(a7)
	move.l	d6,d0
	add.l	d5,d0
	asl.l	#2,d0
	add.l	a4,d0
	movea.l	d0,a0
	move.l	(a0),-(a7)
	move.l	a5,-(a7)
	jsr	(L004654)
	lea.l	($0014,a7),a7
L00461c:
	bra	L00451c

L004620:
	move.l	d7,(L008912)
	move.l	d5,(L00891a)
	move.l	d6,(L008916)
	add.l	d5,d6
L004634:
	jsr	(L0051fe)
	move.l	d6,d0
	bra.w	L004640

L004640:
	movem.l	(a7)+,d4-d7/a4-a5
	unlk	a6
	rts

L004648:
	link.w	a6,#$0000
	movem.l	d4-d7/a4-a5,-(a7)
	bra	L004480

L004654:
	bra	L00470c

L004658:
	movea.l	($0008,a6),a5
	movea.l	($000c,a6),a4
	move.l	($0010,a6),d7
	move.l	($0014,a6),d6
	move.l	d7,-(a7)
	clr.l	-(a7)
	move.l	a5,-(a7)
	jsr	(L00401e)
	lea.l	($000c,a7),a7
	move.l	d6,-(a7)
	move.l	a5,-(a7)
	jsr	(L004198)
	addq.l	#8,a7
	move.l	d0,(-$0004,a6)
	move.w	($0004,a5),d0
	andi.l	#$0000ffff,d0
	move.l	d0,d5
	subq.l	#1,d5
	move.l	a4,d0
	add.l	d5,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	(L0053d6)
	addq.l	#8,a7
	cmp.l	#$ffffffff,d0
	bne	L0046b0
	subq.l	#1,d5
L0046b0:
	move.b	(a4),d0
	ext.w	d0
	ext.l	d0
	tst.l	d0
	beq	L0046d6
	move.l	d5,d0
	beq	L0046d6
	move.l	a5,-(a7)
	move.b	(a4),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	(L003cb6)
	addq.l	#8,a7
	addq.l	#1,a4
	subq.l	#1,d5
	bra	L0046b0

L0046d6:
	move.l	($0018,a6),d0
	beq	L0046f6
L0046dc:
	move.l	d5,d0
	subq.l	#1,d5
	tst.l	d0
	beq	L0046f6
	move.l	a5,-(a7)
	move.l	#$00000020,-(a7)
	jsr	(L003cb6)
	addq.l	#8,a7
	bra	L0046dc

L0046f6:
	move.l	(-$0004,a6),-(a7)
	move.l	a5,-(a7)
	jsr	(L004198)
	addq.l	#8,a7
	movem.l	(a7)+,d5-d7/a4-a5
	unlk	a6
	rts

L00470c:
	link.w	a6,#-$0004
	movem.l	d5-d7/a4-a5,-(a7)
	bra	L004658

L004718:
	bra	L0047ae

L00471c:
	movea.l	($0008,a6),a5
	movea.l	($000c,a6),a4
	move.l	($0010,a6),d7
	move.l	d7,-(a7)
	clr.l	-(a7)
	move.l	a5,-(a7)
	jsr	(L00401e)
	lea.l	($000c,a7),a7
	move.w	($0004,a5),d0
	andi.l	#$0000ffff,d0
	move.l	d0,d6
	subq.l	#1,d6
	move.l	a4,d0
	add.l	d6,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	(L0053d6)
	addq.l	#8,a7
	cmp.l	#$ffffffff,d0
	bne	L004760
	subq.l	#1,d6
L004760:
	move.b	(a4),d0
	ext.w	d0
	ext.l	d0
	tst.l	d0
	beq	L004786
	move.l	d6,d0
	beq	L004786
	move.l	a5,-(a7)
	move.b	(a4),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	(L003cb6)
	addq.l	#8,a7
	addq.l	#1,a4
	subq.l	#1,d6
	bra	L004760

L004786:
	move.l	($0014,a6),d0
	beq	L0047a6
L00478c:
	move.l	d6,d0
	subq.l	#1,d6
	tst.l	d0
	beq	L0047a6
	move.l	a5,-(a7)
	move.l	#$00000020,-(a7)
	jsr	(L003cb6)
	addq.l	#8,a7
	bra	L00478c

L0047a6:
	movem.l	(a7)+,d6-d7/a4-a5
	unlk	a6
	rts

L0047ae:
	link.w	a6,#$0000
	movem.l	d6-d7/a4-a5,-(a7)
	bra	L00471c

L0047ba:
	bra	L0047de

L0047bc:
	jsr	(L00575a)
	tst.l	d0
	bne	L0047ce
	jsr	(L005848)
	bra	L0047bc

L0047ce:
	jsr	(L005754)
	asr.l	#8,d0
	bra.w	L0047da

L0047da:
	unlk	a6
	rts

L0047de:
	link.w	a6,#$0000
	bra	L0047bc

L0047e4:
	bra	L00497c

L0047e8:
	jsr	(L0051e6)
	clr.l	(-$0004,a6)
L0047f2:
	move.l	($0008,a6),d0
	addq.l	#6,d0
	movea.l	d0,a0
	move.w	(a0),d0
	andi.l	#$0000ffff,d0
	cmp.l	(-$0004,a6),d0
	bls	L00484e
	move.l	(-$0004,a6),d0
	asl.l	#2,d0
	add.l	($000c,a6),d0
	movea.l	d0,a0
	move.l	(a0),d0
	movea.l	d0,a0
	move.b	(a0),d0
	ext.w	d0
	ext.l	d0
	tst.l	d0
	bne	L004824
	bra	L00484e

L004824:
	move.l	($0010,a6),-(a7)
	move.l	(-$0004,a6),-(a7)
	move.l	(-$0004,a6),d0
	asl.l	#2,d0
	add.l	($000c,a6),d0
	movea.l	d0,a0
	move.l	(a0),-(a7)
	move.l	($0008,a6),-(a7)
	jsr	(L004718)
	lea.l	($0010,a7),a7
	addq.l	#1,(-$0004,a6)
	bra	L0047f2

L00484e:
	clr.l	(-$0008,a6)
	move.l	($0010,a6),-(a7)
	move.l	#$0000000a,-(a7)
	move.l	(-$0008,a6),-(a7)
	move.l	($000c,a6),d0
	movea.l	d0,a0
	move.l	(a0),-(a7)
	move.l	($0008,a6),-(a7)
	jsr	(L004654)
	lea.l	($0014,a7),a7
L004876:
	jsr	(L0047ba)
	move.l	d0,(-$000c,a6)
	cmp.l	#$0000001d,d0
	beq	L00496a
	move.l	(-$000c,a6),d0
	cmp.l	#$0000004e,d0
	bne	L00489a
	bra	L00496a

L00489a:
	move.l	(-$000c,a6),d0
	cmp.l	#$00000001,d0
	bne	L0048b2
	move.l	#$ffffffff,(-$0008,a6)
	bra	L00496a

L0048b2:
	move.l	(-$000c,a6),d0
	cmp.l	#$0000003e,d0
	beq	L0048d8
	move.l	(-$000c,a6),d0
	cmp.l	#$0000003c,d0
	beq	L0048d8
	move.l	(-$000c,a6),d0
	cmp.l	#$00000035,d0
	bne	L004966
L0048d8:
	move.l	($0010,a6),-(a7)
	move.l	(-$0008,a6),-(a7)
	move.l	(-$0008,a6),d0
	asl.l	#2,d0
	add.l	($000c,a6),d0
	movea.l	d0,a0
	move.l	(a0),-(a7)
	move.l	($0008,a6),-(a7)
	jsr	(L004718)
	lea.l	($0010,a7),a7
	move.l	(-$000c,a6),d0
	cmp.l	#$0000003e,d0
	beq	L004914
	move.l	(-$000c,a6),d0
	cmp.l	#$00000035,d0
	bne	L004928
L004914:
	addq.l	#1,(-$0008,a6)
	move.l	(-$0008,a6),d0
	cmp.l	(-$0004,a6),d0
	bne	L004926
	clr.l	(-$0008,a6)
L004926:
	bra	L00493c

L004928:
	subq.l	#1,(-$0008,a6)
	move.l	(-$0008,a6),d0
	bge	L00493c
	move.l	(-$0004,a6),d0
	subq.l	#1,d0
	move.l	d0,(-$0008,a6)
L00493c:
	move.l	($0010,a6),-(a7)
	move.l	#$0000000a,-(a7)
	move.l	(-$0008,a6),-(a7)
	move.l	(-$0008,a6),d0
	asl.l	#2,d0
	add.l	($000c,a6),d0
	movea.l	d0,a0
	move.l	(a0),-(a7)
	move.l	($0008,a6),-(a7)
	jsr	(L004654)
	lea.l	($0014,a7),a7
L004966:
	bra	L004876

L00496a:
	jsr	(L0051fe)
	move.l	(-$0008,a6),d0
	bra.w	L004978

L004978:
	unlk	a6
	rts

L00497c:
	link.w	a6,#-$000c
	bra	L0047e8

L004984:
	bra	L004af6

L004988:
	move.l	#L00891e,(-$0004,a6)
	clr.l	(-$0008,a6)
L004994:
	move.l	(-$0008,a6),d0
	cmp.l	#$0000000a,d0
	bge	L004aec
	move.l	(-$0004,a6),d0
	add.l	#$00000012,d0
	movea.l	d0,a0
	move.b	(a0),d0
	ext.w	d0
	ext.l	d0
	tst.l	d0
	beq	L0049c4
	addi.l	#$00000014,(-$0004,a6)
	bra	L004ae4

L0049c4:
	move.l	(-$0004,a6),d0
	movea.l	d0,a0
	move.l	($0008,a6),d1
	move.w	d1,(a0)
	move.l	(-$0004,a6),d0
	addq.l	#2,d0
	movea.l	d0,a0
	move.l	($000c,a6),d1
	move.w	d1,(a0)
	move.l	(-$0004,a6),d0
	addq.l	#4,d0
	movea.l	d0,a0
	move.l	($0010,a6),d1
	move.w	d1,(a0)
	move.l	(-$0004,a6),d0
	addq.l	#6,d0
	movea.l	d0,a0
	move.l	($0014,a6),d1
	move.w	d1,(a0)
	subq.l	#1,($0008,a6)
	subq.l	#1,($000c,a6)
	addq.l	#2,($0010,a6)
	addq.l	#2,($0014,a6)
	move.l	($0010,a6),d0
	move.l	($0014,a6),d1
	movem.l	d0-d1,-(a7)
	FPACK	__CLMUL
	movem.l	(a7)+,d0-d1
	asl.l	#5,d0
	move.l	d0,-(a7)
	jsr	(L00424e)
	addq.l	#4,a7
	move.l	d0,(-$000c,a6)
	bne	L004a64
	move.l	#L007fbc,-(a7)
	jsr	(L005b04)
	addq.l	#4,a7
	move.l	#L007fbe,-(a7)
	jsr	(L005b04)
	addq.l	#4,a7
	move.l	#L007ff4,-(a7)
	jsr	(L005b04)
	addq.l	#4,a7
	jsr	(L0058fe)
	clr.l	d0
	bra	L004af2

L004a64:
	move.l	(-$0004,a6),d0
	add.l	#$0000000e,d0
	movea.l	d0,a0
	move.l	(-$000c,a6),(a0)
	move.l	(-$0004,a6),-(a7)
	jsr	(L004b24)
	addq.l	#4,a7
	move.l	($0018,a6),-(a7)
	move.l	($0014,a6),-(a7)
	subq.l	#1,(a7)
	move.l	($0010,a6),-(a7)
	subq.l	#1,(a7)
	move.l	($000c,a6),-(a7)
	move.l	($0008,a6),-(a7)
	jsr	(L0054e0)
	lea.l	($0014,a7),a7
	move.l	(-$0004,a6),d0
	add.l	#$00000012,d0
	movea.l	d0,a0
	moveq.l	#$01,d0
	move.b	d0,(a0)
	move.l	(-$0004,a6),(L008e88)
	clr.l	-(a7)
	clr.l	-(a7)
	move.l	(-$0004,a6),-(a7)
	jsr	(L00401e)
	lea.l	($000c,a7),a7
	move.l	#$00000003,-(a7)
	move.l	(-$0004,a6),-(a7)
	jsr	(L004198)
	addq.l	#8,a7
	move.l	(-$0004,a6),d0
	bra	L004af2

L004ae4:
	addq.l	#1,(-$0008,a6)
	bra	L004994

L004aec:
	clr.l	d0
	bra.w	L004af2

L004af2:
	unlk	a6
	rts

L004af6:
	link.w	a6,#-$000c
	bra	L004988

L004afe:
	bra	L004b1e

L004b00:
	move.l	($0008,a6),-(a7)
	jsr	(L004bb4)
	addq.l	#4,a7
	move.l	($0008,a6),d0
	add.l	#$00000012,d0
	movea.l	d0,a0
	clr.b	(a0)
	unlk	a6
	rts

L004b1e:
	link.w	a6,#$0000
	bra	L004b00

L004b24:
	bra	L004bac

L004b28:
	clr.l	-(a7)
	jsr	(L0057cc)
	addq.l	#4,a7
	move.l	d0,(-$0004,a6)
	move.l	($0008,a6),d0
	add.l	#$0000000e,d0
	movea.l	d0,a0
	move.l	(a0),-(a7)
	move.l	($0008,a6),d0
	addq.l	#6,d0
	movea.l	d0,a0
	move.w	(a0),d0
	andi.l	#$0000ffff,d0
	addq.l	#2,d0
	move.l	d0,-(a7)
	move.l	($0008,a6),d0
	addq.l	#4,d0
	movea.l	d0,a0
	move.w	(a0),d0
	andi.l	#$0000ffff,d0
	addq.l	#2,d0
	move.l	d0,-(a7)
	move.l	($0008,a6),d0
	addq.l	#2,d0
	movea.l	d0,a0
	move.w	(a0),d0
	andi.l	#$0000ffff,d0
	subq.l	#1,d0
	move.l	d0,-(a7)
	move.l	($0008,a6),d0
	movea.l	d0,a0
	move.w	(a0),d0
	andi.l	#$0000ffff,d0
	subq.l	#1,d0
	move.l	d0,-(a7)
	jsr	(L004e28)
	lea.l	($0014,a7),a7
	move.l	(-$0004,a6),-(a7)
	jsr	(L0057cc)
	addq.l	#4,a7
	unlk	a6
	rts

L004bac:
	link.w	a6,#-$0004
	bra	L004b28

L004bb4:
	bra	L004c52

L004bb8:
	clr.l	-(a7)
	jsr	(L0057cc)
	addq.l	#4,a7
	move.l	d0,(-$0004,a6)
	move.l	($0008,a6),d0
	add.l	#$0000000e,d0
	movea.l	d0,a0
	move.l	(a0),-(a7)
	move.l	($0008,a6),d0
	addq.l	#6,d0
	movea.l	d0,a0
	move.w	(a0),d0
	andi.l	#$0000ffff,d0
	addq.l	#2,d0
	move.l	d0,-(a7)
	move.l	($0008,a6),d0
	addq.l	#4,d0
	movea.l	d0,a0
	move.w	(a0),d0
	andi.l	#$0000ffff,d0
	addq.l	#2,d0
	move.l	d0,-(a7)
	move.l	($0008,a6),d0
	addq.l	#2,d0
	movea.l	d0,a0
	move.w	(a0),d0
	andi.l	#$0000ffff,d0
	subq.l	#1,d0
	move.l	d0,-(a7)
	move.l	($0008,a6),d0
	movea.l	d0,a0
	move.w	(a0),d0
	andi.l	#$0000ffff,d0
	subq.l	#1,d0
	move.l	d0,-(a7)
	jsr	(L004e72)
	lea.l	($0014,a7),a7
	move.l	(-$0004,a6),-(a7)
	jsr	(L0057cc)
	addq.l	#4,a7
	move.l	($0008,a6),d0
	add.l	#$0000000e,d0
	movea.l	d0,a0
	move.l	(a0),-(a7)
	jsr	(L00594a)
	addq.l	#4,a7
	unlk	a6
	rts

L004c52:
	link.w	a6,#-$0004
	bra	L004bb8

L004c5a:
	bra	L004c86

L004c5c:
	move.l	(L007702),d0
	beq	L004c78
	jsr	(L005816)
	move.l	#$0000001a,-(a7)
	jsr	(L0057fc)
	addq.l	#4,a7
L004c78:
	move.l	(L0089e6),d0
	movea.l	d0,a0
	jsr	(a0)
	unlk	a6
	rts

L004c86:
	link.w	a6,#$0000
	bra	L004c5c

L004c8c:
	bra	L004cac

L004c8e:
	move.l	#L004c5a,-(a7)
	move.l	#$0000fff2,-(a7)
	jsr	(L005832)
	addq.l	#8,a7
	move.l	d0,(L0089e6)
	unlk	a6
	rts

L004cac:
	link.w	a6,#$0000
	bra	L004c8e

L004cb2:
	bra	L004dc6

L004cb6:
	move.l	(L007702),d0
	bne	L004cd6
	move.l	($0008,a6),-(a7)
	move.l	#L008010,-(a7)
	jsr	(L005b04)
	addq.l	#8,a7
	clr.l	d0
	bra	L004dc2

L004cd6:
	move.l	($0008,a6),-(a7)
	jsr	(L005c1a)
	addq.l	#4,a7
	move.l	d0,(-$0008,a6)
	beq	L004dbc
	move.l	(-$0008,a6),d0
	cmp.l	#$00000018,d0
	bge	L004cfe
	move.l	#$00000018,(-$0008,a6)
L004cfe:
	move.l	#$00000003,-(a7)
	move.l	#$00000003,-(a7)
	move.l	(-$0008,a6),-(a7)
	addq.l	#2,(a7)
	move.l	#$0000000e,-(a7)
	moveq.l	#$60,d0			;'`'
	move.l	(-$0008,a6),d1
	sub.l	d1,d0
	addq.l	#2,d0
	asr.l	#1,d0
	move.l	d0,-(a7)
	jsr	(L004984)
	lea.l	($0014,a7),a7
	move.l	d0,(-$0004,a6)
	clr.l	-(a7)
	clr.l	-(a7)
	move.l	(-$0004,a6),-(a7)
	jsr	(L00401e)
	lea.l	($000c,a7),a7
	move.l	($0008,a6),-(a7)
	move.l	#L008014,-(a7)
	move.l	(-$0004,a6),-(a7)
	jsr	(L004ebc)
	lea.l	($000c,a7),a7
	move.l	#$00000002,-(a7)
	move.l	(-$0008,a6),d0
	moveq.l	#$18,d1
	sub.l	d1,d0
	asr.l	#1,d0
	move.l	d0,-(a7)
	move.l	(-$0004,a6),-(a7)
	jsr	(L00401e)
	lea.l	($000c,a7),a7
	move.l	#$000000ff,-(a7)
	jsr	(L00579a)
	addq.l	#4,a7
	move.l	#L008018,-(a7)
	move.l	(-$0004,a6),-(a7)
	jsr	(L004ebc)
	addq.l	#8,a7
L004d9c:
	move.l	#$000000ff,-(a7)
	jsr	(L005790)
	addq.l	#4,a7
	tst.l	d0
	bne	L004db0
	bra	L004d9c

L004db0:
	move.l	(-$0004,a6),-(a7)
	jsr	(L004afe)
	addq.l	#4,a7
L004dbc:
	clr.l	d0
	bra.w	L004dc2

L004dc2:
	unlk	a6
	rts

L004dc6:
	link.w	a6,#-$0008
	bra	L004cb6

L004dce:
	bra	L004e22

L004dd0:
	move.l	#$00000007,-(a7)
	jsr	(L005790)
	addq.l	#4,a7
	move.l	($0008,a6),-(a7)
	jsr	(L0040d2)
	addq.l	#4,a7
	move.l	#L008031,-(a7)
	move.l	($0008,a6),-(a7)
	jsr	(L004ebc)
	addq.l	#8,a7
	clr.l	(-$0004,a6)
L004e00:
	move.l	(-$0004,a6),d0
	cmp.l	#$00009c40,d0
	bge	L004e12
	addq.l	#1,(-$0004,a6)
	bra	L004e00

L004e12:
	move.l	($0008,a6),-(a7)
	jsr	(L0040d2)
	addq.l	#4,a7
	unlk	a6
	rts

L004e22:
	link.w	a6,#-$0004
	bra	L004dd0

L004e28:
	movea.l	($0014,a7),a0
	clr.l	d0
	clr.l	d1
	move.w	($0006,a7),d0
	move.w	($000a,a7),d1
	lsl.l	#7,d1
	lsl.l	#4,d1
	add.l	d1,d0
	move.l	d0,d2
	move.l	($0010,a7),d1
	lsl.w	#4,d1
	subq.l	#1,d1
L004e48:
	movea.l	d2,a1
	movea.l	d2,a2
	adda.l	#$00e00000,a1
	adda.l	#$00e20000,a2
	move.l	($000c,a7),d0
	subq.w	#1,d0
L004e5e:
	move.b	(a1)+,(a0)+
	move.b	(a2)+,(a0)+
	dbra	d0,L004e5e
	add.l	#$00000080,d2
	dbra	d1,L004e48
	rts

L004e72:
	movea.l	($0014,a7),a0
	clr.l	d0
	clr.l	d1
	move.w	($0006,a7),d0
	move.w	($000a,a7),d1
	lsl.l	#7,d1
	lsl.l	#4,d1
	add.l	d1,d0
	move.l	d0,d2
	move.l	($0010,a7),d1
	lsl.w	#4,d1
	subq.l	#1,d1
L004e92:
	movea.l	d2,a1
	movea.l	d2,a2
	adda.l	#$00e00000,a1
	adda.l	#$00e20000,a2
	move.l	($000c,a7),d0
	subq.w	#1,d0
L004ea8:
	move.b	(a0)+,(a1)+
	move.b	(a0)+,(a2)+
	dbra	d0,L004ea8
	add.l	#$00000080,d2
	dbra	d1,L004e92
	rts

L004ebc:
	pea.l	($000c,a7)
	move.l	($000c,a7),-(a7)
	move.l	($000c,a7),-(a7)
	pea.l	(L003cb6)
	jsr	(L005c72)
	lea.l	($0010,a7),a7
	rts

L004eda:
	movem.l	d3/a3-a5,-(a7)
	movea.l	($0014,a7),a5
	clr.l	d0
	clr.l	d1
	move.w	($0000.w,a5),d0
	move.w	($0002,a5),d1
	lsl.l	#7,d1
	lsl.l	#4,d1
	lea.l	($00e00000),a4
	add.l	d1,d0
	adda.l	d0,a4
	move.w	($0004,a5),d1
	lea.l	(L004fb4),a0
	btst.l	#$00,d0
	beq	L004f2e
	move.w	#$12d8,(a0)+
	move.w	d1,d0
	subq.w	#1,d0
	lsr.w	#1,d0
	beq	L004f22
	subq.w	#1,d0
L004f1a:
	move.w	#$32d8,(a0)+
	dbra	d0,L004f1a
L004f22:
	btst.l	#$00,d1
	bne	L004f48
	move.w	#$12d8,(a0)+
	bra	L004f48

L004f2e:
	move.w	d1,d0
	lsr.w	#1,d0
	beq	L004f3e
	subq.w	#1,d0
L004f36:
	move.w	#$32d8,(a0)+
	dbra	d0,L004f36
L004f3e:
	btst.l	#$00,d1
	beq	L004f48
	move.w	#$12d8,(a0)+
L004f48:
	move.w	#$4e75,(a0)+		;'Nu'
	move.w	($0006,a5),d1
	subq.w	#1,d1
	beq	L004f84
	lsl.w	#4,d1
	subq.w	#1,d1
L004f58:
	movea.l	a4,a0
	movea.l	a4,a1
	adda.l	#$00000800,a0
	movea.l	a0,a2
	movea.l	a1,a3
	adda.l	#$00020000,a2
	adda.l	#$00020000,a3
	bsr	L004fb4
	exg.l	a0,a2
	exg.l	a1,a3
	bsr	L004fb4
	adda.l	#$00000080,a4
	dbra	d1,L004f58
L004f84:
	move.w	#$000f,d1
L004f88:
	movea.l	a4,a0
	movea.l	a0,a2
	adda.l	#$00020000,a2
	move.w	($0004,a5),d0
	subq.w	#1,d0
L004f98:
	move.b	#$00,(a0)+
	move.b	#$00,(a2)+
	dbra	d0,L004f98
	adda.l	#$00000080,a4
	dbra	d1,L004f88
	movem.l	(a7)+,d3/a3-a5
	rts

L004fb4:
	.ds.b	160
L005054:
	movem.l	d3/a3-a5,-(a7)
	movea.l	($0014,a7),a5
	clr.l	d0
	clr.l	d1
	move.w	($0000.w,a5),d0
	move.w	($0002,a5),d1
	lsl.l	#7,d1
	lsl.l	#4,d1
	lea.l	($00e00000),a4
	add.l	d1,d0
	adda.l	d0,a4
	clr.l	d0
	move.w	($0006,a5),d0
	lsl.w	#7,d0
	lsl.w	#4,d0
	clr.l	d1
	move.w	($0004,a5),d1
	adda.l	d0,a4
	adda.l	d1,a4
	suba.l	#$00000080,a4
	move.l	a4,d0
	lea.l	(L005146),a0
	btst.l	#$00,d0
	beq	L0050c0
	move.w	#$1320,(a0)+
	move.w	d1,d0
	subq.w	#1,d0
	lsr.w	#1,d0
	beq	L0050b4
	subq.w	#1,d0
L0050ac:
	move.w	#$3320,(a0)+		;'3 '
	dbra	d0,L0050ac
L0050b4:
	btst.l	#$00,d1
	bne	L0050da
	move.w	#$1320,(a0)+
	bra	L0050da

L0050c0:
	move.w	d1,d0
	lsr.w	#1,d0
	beq	L0050d0
	subq.w	#1,d0
L0050c8:
	move.w	#$3320,(a0)+		;'3 '
	dbra	d0,L0050c8
L0050d0:
	btst.l	#$00,d1
	beq	L0050da
	move.w	#$1320,(a0)+
L0050da:
	move.w	#$4e75,(a0)+		;'Nu'
	move.w	($0006,a5),d1
	subq.w	#1,d1
	beq	L005116
	lsl.w	#4,d1
	subq.w	#1,d1
L0050ea:
	movea.l	a4,a0
	movea.l	a4,a1
	suba.l	#$00000800,a0
	movea.l	a0,a2
	movea.l	a1,a3
	adda.l	#$00020000,a2
	adda.l	#$00020000,a3
	bsr	L005146
	exg.l	a0,a2
	exg.l	a1,a3
	bsr	L005146
	suba.l	#$00000080,a4
	dbra	d1,L0050ea
L005116:
	move.w	#$000f,d1
L00511a:
	movea.l	a4,a0
	movea.l	a0,a2
	adda.l	#$00020000,a2
	move.w	($0004,a5),d0
	subq.w	#1,d0
L00512a:
	move.b	#$00,-(a0)
	move.b	#$00,-(a2)
	dbra	d0,L00512a
	suba.l	#$00000080,a4
	dbra	d1,L00511a
	movem.l	(a7)+,d3/a3-a5
	rts

L005146:
	.ds.b	160
L0051e6:
	IOCS	_B_SFTSNS
	move.w	#$0008,d1
	lsr.w	d1,d0
	and.l	#$000000ff,d0
	move.w	d0,(L0089ea)
	rts

L0051fe:
	move.l	d3,-(a7)
	move.w	#$0006,d3
L005204:
	move.w	(L0089ea),d2
	clr.l	d1
	move.w	d3,d1
	lsr.w	d1,d2
	and.l	#$00000001,d2
	IOCS	_LEDMOD
	dbra	d3,L005204
	move.l	(a7)+,d3
	rts

L005222:
	move.l	($0004,a7),-(a7)
	pea.l	(L00532a,pc)
	bsr	L005268
	addq.l	#8,a7
	rts

L005230:
	move.l	($0004,a7),-(a7)
	pea.l	(L00535e,pc)
	bsr	L005268
	addq.l	#8,a7
	rts

L00523e:
	move.l	($0004,a7),-(a7)
	pea.l	(L0052e2,pc)
	bsr	L005268
	addq.l	#8,a7
	rts

L00524c:
	move.l	($0004,a7),-(a7)
	pea.l	(L005306,pc)
	bsr	L005268
	addq.l	#8,a7
	rts

L00525a:
	move.l	($0004,a7),-(a7)
	pea.l	(L0053b2,pc)
	bsr	L005268
	addq.l	#8,a7
	rts

L005268:
	link.w	a6,#$0000
	movem.l	d1-d5/a0-a2,-(a7)
	moveq.l	#$ff,d1
	IOCS	_B_LOCATE
	move.l	d0,d5
	moveq.l	#$00,d0
	move.w	d5,d0
	lsl.l	#4,d0
	lsl.l	#7,d0
	swap.w	d5
	add.w	d5,d0
	move.l	d0,d4
	movea.l	($0008,a6),a1
	add.w	(a1),d5
	moveq.l	#$00,d1
	move.w	(a1)+,d1
	subq.w	#1,d1
	move.w	(a1)+,d2
	subq.w	#1,d2
	moveq.l	#$7f,d3
	sub.l	d1,d3
	moveq.l	#$18,d0
	lea.l	($00e00000),a2
	adda.l	d4,a2
	movem.l	d0-d3/a0-a2,-(a7)
	btst.b	#$00,($000f,a6)
	beq	L0052b2
	trap	#15
L0052b2:
	btst.b	#$01,($000f,a6)
	beq	L0052c6
	movem.l	(a7),d0-d3/a0-a2
	adda.l	#$00020000,a2
	trap	#15
L0052c6:
	movem.l	(a7)+,d0-d3/a0-a2
	move.w	d5,d1
	swap.w	d5
	move.w	d5,d2
	IOCS	_B_LOCATE
	moveq.l	#$00,d0
	move.w	(-$0004,a1),d0
	movem.l	(a7)+,d1-d5/a0-a2
	unlk	a6
	rts

L0052e2:
	.dc.b	$00,$02,$00,$10,$00,$00,$7f,$fe,$fe,$7f,$fd,$bf,$fb,$df,$f7,$ef
	.dc.b	$ef,$f7,$c3,$c3,$fb,$df,$fb,$df,$fb,$df,$fb,$df,$fb,$df,$fb,$df
	.dc.b	$f8,$1f,$7f,$fe
L005306:
	.dc.b	$00,$02,$00,$10,$00,$00,$7f,$fe,$f8,$1f,$fb,$df,$fb,$df,$fb,$df
	.dc.b	$fb,$df,$fb,$df,$fb,$df,$c3,$c3,$ef,$f7,$f7,$ef,$fb,$df,$fd,$bf
	.dc.b	$fe,$7f,$7f,$fe
L00532a:
	.dc.b	$00,$03,$00,$10,$00,$00,$00,$3f,$ff,$fc,$7f,$fe,$06,$7f,$fe,$f6
	.dc.b	$7f,$fe,$f6,$7e,$fe,$f6,$7c,$fe,$f6,$7a,$fe,$f6,$76,$00,$f6,$6f
	.dc.b	$ff,$f6,$5f,$ff,$f6,$6f,$ff,$ee,$76,$00,$1e,$7a,$ff,$fe,$7c,$ff
	.dc.b	$fe,$3e,$ff,$fc
L00535e:
	.dc.b	$00,$05,$00,$10,$00,$00,$00,$00,$00,$3f,$ff,$ff,$ff,$fc,$7f,$ff
	.dc.b	$ff,$ff,$fe,$78,$07,$83,$f8,$7e,$7b,$ff,$7d,$f7,$be,$7b,$fe,$fe
	.dc.b	$ef,$de,$7b,$fe,$ff,$df,$fe,$7b,$ff,$7f,$df,$fe,$78,$07,$83,$df
	.dc.b	$fe,$7b,$ff,$fd,$df,$fe,$7b,$ff,$fe,$df,$fe,$7b,$fe,$fe,$ef,$de
	.dc.b	$7b,$ff,$7d,$f7,$be,$78,$07,$83,$f8,$7e,$7f,$ff,$ff,$ff,$fe,$3f
	.dc.b	$ff,$ff,$ff,$fc
L0053b2:
	.dc.b	$00,$02,$00,$10,$00,$00,$ff,$fc,$ff,$fe,$f8,$7e,$f7,$be,$ef,$de
	.dc.b	$df,$ee,$df,$fe,$df,$fe,$de,$0e,$df,$ee,$ef,$ce,$f7,$ae,$f8,$6e
	.dc.b	$ff,$fe,$ff,$fc
L0053d6:
	bra	L0054d4

L0053da:
	move.l	($000c,a6),d0
	cmp.l	($0008,a6),d0
	bcs	L0053fa
	move.l	($0008,a6),-(a7)
	jsr	(L005c1a)
	addq.l	#4,a7
	add.l	($0008,a6),d0
	cmp.l	($000c,a6),d0
	bhi	L005400
L0053fa:
	moveq.l	#$fe,d0
	bra	L0054cc

L005400:
	move.l	($0008,a6),d0
	movea.l	d0,a0
	move.b	(a0),d7
	move.b	d7,d0
	andi.l	#$000000ff,d0
	cmp.l	#$00000080,d0
	bcs	L005428
	move.b	d7,d0
	andi.l	#$000000ff,d0
	cmp.l	#$0000009f,d0
	bls	L005448
L005428:
	move.b	d7,d0
	andi.l	#$000000ff,d0
	cmp.l	#$000000e0,d0
	bcs	L00544c
	move.b	d7,d0
	andi.l	#$000000ff,d0
	cmp.l	#$000000ff,d0
	bhi	L00544c
L005448:
	moveq.l	#$01,d6
	bra	L00544e

L00544c:
	clr.l	d6
L00544e:
	movea.l	($0008,a6),a5
L005452:
	move.b	(a5),d0
	andi.l	#$000000ff,d0
	tst.l	d0
	beq	L0054c6
	move.l	a5,d0
	cmp.l	($000c,a6),d0
	bne	L00546a
	move.l	d6,d0
	bra	L0054cc

L00546a:
	move.l	d6,d0
	cmp.l	#$00000001,d0
	bne	L005478
	moveq.l	#$ff,d6
	bra	L0054c2

L005478:
	move.b	($0001,a5),d7
	move.b	d7,d0
	andi.l	#$000000ff,d0
	cmp.l	#$00000080,d0
	bcs	L00549c
	move.b	d7,d0
	andi.l	#$000000ff,d0
	cmp.l	#$0000009f,d0
	bls	L0054bc
L00549c:
	move.b	d7,d0
	andi.l	#$000000ff,d0
	cmp.l	#$000000e0,d0
	bcs	L0054c0
	move.b	d7,d0
	andi.l	#$000000ff,d0
	cmp.l	#$000000ff,d0
	bhi	L0054c0
L0054bc:
	moveq.l	#$01,d6
	bra	L0054c2

L0054c0:
	clr.l	d6
L0054c2:
	addq.l	#1,a5
	bra	L005452

L0054c6:
	moveq.l	#$fe,d0
	bra.w	L0054cc

L0054cc:
	movem.l	(a7)+,d6-d7/a5
	unlk	a6
	rts

L0054d4:
	link.w	a6,#$0000
	movem.l	d6-d7/a5,-(a7)
	bra	L0053da

L0054e0:
	bra	L00573c

L0054e4:
	move.l	($0010,a6),d0
	cmp.l	#$00000002,d0
	blt	L0054fc
	move.l	($0014,a6),d0
	cmp.l	#$00000002,d0
	bge	L005502
L0054fc:
	moveq.l	#$ff,d0
	bra	L005738

L005502:
	move.l	($0008,a6),d0
	asl.l	#3,d0
	addq.l	#3,d0
	subq.l	#1,d0
	move.w	d0,(-$000a,a6)
	move.l	($000c,a6),d0
	asl.l	#4,d0
	addq.l	#7,d0
	subq.l	#1,d0
	move.w	d0,(-$0008,a6)
	move.l	($0010,a6),d0
	asl.l	#3,d0
	addq.l	#2,d0
	move.w	d0,(-$0006,a6)
	move.l	($0014,a6),d0
	asl.l	#4,d0
	addq.l	#2,d0
	move.w	d0,(-$0004,a6)
	clr.w	(-$0002,a6)
	clr.w	(-$000c,a6)
	move.l	a6,d0
	add.l	#$fffffff4,d0
	move.l	d0,-(a7)
	jsr	(L005786)
	addq.l	#4,a7
	moveq.l	#$01,d0
	move.w	d0,(-$000c,a6)
	move.l	a6,d0
	add.l	#$fffffff4,d0
	move.l	d0,-(a7)
	jsr	(L005786)
	addq.l	#4,a7
	move.l	($0018,a6),d0
	bne	L005574
	clr.l	d0
	bra	L005738

L005574:
	clr.w	(-$0002,a6)
	clr.w	(-$000c,a6)
	move.l	a6,d0
	add.l	#$fffffff4,d0
	move.l	d0,-(a7)
	jsr	(L00577c)
	addq.l	#4,a7
	moveq.l	#$01,d0
	move.w	d0,(-$000c,a6)
	move.l	a6,d0
	add.l	#$fffffff4,d0
	move.l	d0,-(a7)
	jsr	(L00577c)
	addq.l	#4,a7
	addq.w	#1,(-$000a,a6)
	addq.w	#1,(-$0008,a6)
	clr.w	(-$000c,a6)
	move.l	a6,d0
	add.l	#$fffffff4,d0
	move.l	d0,-(a7)
	jsr	(L00577c)
	addq.l	#4,a7
	moveq.l	#$01,d0
	move.w	d0,(-$000c,a6)
	move.l	a6,d0
	add.l	#$fffffff4,d0
	move.l	d0,-(a7)
	jsr	(L00577c)
	addq.l	#4,a7
	subq.w	#2,(-$0006,a6)
	subq.w	#2,(-$0004,a6)
	clr.w	(-$000c,a6)
	move.l	a6,d0
	add.l	#$fffffff4,d0
	move.l	d0,-(a7)
	jsr	(L00577c)
	addq.l	#4,a7
	moveq.l	#$01,d0
	move.w	d0,(-$000c,a6)
	move.l	a6,d0
	add.l	#$fffffff4,d0
	move.l	d0,-(a7)
	jsr	(L00577c)
	addq.l	#4,a7
	move.l	#$0000ffff,d0
	move.w	d0,(-$0002,a6)
	move.l	($0018,a6),d0
	bra	L00570e

L005624:
	bra	L005732

L005628:
	clr.w	(-$000c,a6)
	move.l	a6,d0
	add.l	#$fffffff4,d0
	move.l	d0,-(a7)
	jsr	(L00577c)
	addq.l	#4,a7
	addq.w	#1,(-$000a,a6)
	addq.w	#1,(-$0008,a6)
	subq.w	#2,(-$0006,a6)
	subq.w	#2,(-$0004,a6)
	move.l	a6,d0
	add.l	#$fffffff4,d0
	move.l	d0,-(a7)
	jsr	(L00577c)
	addq.l	#4,a7
	bra	L005732

L005664:
	moveq.l	#$01,d0
	move.w	d0,(-$000c,a6)
	move.l	a6,d0
	add.l	#$fffffff4,d0
	move.l	d0,-(a7)
	jsr	(L00577c)
	addq.l	#4,a7
	addq.w	#1,(-$000a,a6)
	addq.w	#1,(-$0008,a6)
	subq.w	#2,(-$0006,a6)
	subq.w	#2,(-$0004,a6)
	move.l	a6,d0
	add.l	#$fffffff4,d0
	move.l	d0,-(a7)
	jsr	(L00577c)
	addq.l	#4,a7
	bra	L005732

L0056a2:
	clr.w	(-$000c,a6)
	move.l	a6,d0
	add.l	#$fffffff4,d0
	move.l	d0,-(a7)
	jsr	(L00577c)
	addq.l	#4,a7
	moveq.l	#$01,d0
	move.w	d0,(-$000c,a6)
	move.l	a6,d0
	add.l	#$fffffff4,d0
	move.l	d0,-(a7)
	jsr	(L00577c)
	addq.l	#4,a7
	addq.w	#1,(-$000a,a6)
	addq.w	#1,(-$0008,a6)
	subq.w	#2,(-$0006,a6)
	subq.w	#2,(-$0004,a6)
	move.l	a6,d0
	add.l	#$fffffff4,d0
	move.l	d0,-(a7)
	jsr	(L00577c)
	addq.l	#4,a7
	clr.w	(-$000c,a6)
	move.l	a6,d0
	add.l	#$fffffff4,d0
	move.l	d0,-(a7)
	jsr	(L00577c)
	addq.l	#4,a7
	bra	L005732

L00570a:
	bra	L005732

L00570c:
	bra	L005732

L00570e:
	cmpi.l	#$00000003,d0
	bhi	L005732
	asl.l	#2,d0
	lea.l	(L005722,pc),a0
	movea.l	(a0,d0.l),a0
	jmp	(a0)

L005722:
	.dc.l	L005624
	.dc.l	L005628
	.dc.l	L005664
	.dc.l	L0056a2
L005732:
	clr.l	d0
	bra.w	L005738

L005738:
	unlk	a6
	rts

L00573c:
	link.w	a6,#-$0018
	bra	L0054e4

L005744:
	move.l	($0004,a7),d1
	IOCS	_B_COLOR
	rts

L00574e:
	IOCS	_B_CURON
	rts

L005754:
	clr.l	d0
	trap	#15
	rts

L00575a:
	IOCS	_B_KEYSNS
	rts

L005760:
	movem.l	($0004,a7),d1-d2
	IOCS	_B_LOCATE
	rts

L00576c:
	move.l	($0004,a7),d1
	IOCS	_B_PUTC
	rts

L005776:
	IOCS	_B_CUROFF
	rts

L00577c:
	movea.l	($0004,a7),a1
	IOCS	_TXBOX
	rts

L005786:
	movea.l	($0004,a7),a1
	IOCS	_TXFILL
	rts

L005790:
	move.w	($0006,a7),-(a7)
	DOS	_INPOUT
	addq.l	#2,a7
	rts

L00579a:
	move.w	($0006,a7),-(a7)
	move.w	#$0006,-(a7)
	DOS	_KFLUSH
	addq.l	#4,a7
	rts

L0057a8:
	DOS	_FFLUSH
	rts

L0057ac:
	move.w	($0006,a7),-(a7)
	DOS	_CHGDRV
	addq.l	#2,a7
	rts

L0057b6:
	move.l	($0004,a7),d0
	rol.w	#8,d0
	move.b	($000b,a7),d0
	move.w	d0,-(a7)
	DOS	_DRVCTRL
	addq.l	#2,a7
	rts

L0057c8:
	DOS	_CURDRV
	rts

L0057cc:
	move.l	($0004,a7),-(a7)
	DOS	_SUPER
	addq.l	#4,a7
	rts

L0057d6:
	clr.w	d0
	move.b	($0007,a7),d0
	move.l	($0008,a7),-(a7)
	move.w	d0,-(a7)
	DOS	_FNCKEY
	addq.l	#6,a7
	rts

L0057e8:
	move.w	#$0100,d0
	move.b	($0007,a7),d0
	move.l	($0008,a7),-(a7)
	move.w	d0,-(a7)
	DOS	_FNCKEY
	addq.l	#6,a7
	rts

L0057fc:
	move.w	($0006,a7),-(a7)
	clr.w	-(a7)
	DOS	_CONCTRL
	addq.l	#4,a7
	rts

L005808:
	move.w	($0006,a7),-(a7)
	move.w	#$0010,-(a7)
	DOS	_CONCTRL
	addq.l	#4,a7
	rts

L005816:
	move.w	#$0011,-(a7)
	DOS	_CONCTRL
	addq.l	#2,a7
	rts

L005820:
	move.w	#$0012,-(a7)
	DOS	_CONCTRL
	addq.l	#2,a7
	rts

L00582a:
	clr.w	-(a7)
	DOS	_KEYCTRL
	addq.l	#2,a7
	rts

L005832:
	move.l	($0008,a7),-(a7)
	move.w	($000a,a7),-(a7)
	DOS	_INTVCS
	addq.l	#6,a7
	rts

L005840:
	DOS	_GETDATE
	rts

L005844:
	DOS	_GETTIME
	rts

L005848:
	DOS	_VERNUM
	rts

L00584c:
	move.l	($0008,a7),-(a7)
	move.w	($000a,a7),-(a7)
	DOS	_GETDPB
	addq.l	#6,a7
	rts

L00585a:
	move.l	($0008,a7),-(a7)
	move.w	($000a,a7),-(a7)
	DOS	_DSKFRE
	addq.l	#6,a7
	rts

L005868:
	move.w	($000a,a7),-(a7)
	move.l	($0006,a7),-(a7)
	DOS	_CREATE
	addq.l	#6,a7
	rts

L005876:
	move.w	($000a,a7),-(a7)
	move.l	($0006,a7),-(a7)
	DOS	_OPEN
	addq.l	#6,a7
	rts

L005884:
	move.w	($0006,a7),-(a7)
	DOS	_CLOSE
	addq.l	#2,a7
	rts

L00588e:
	move.l	($000c,a7),-(a7)
	move.l	($000c,a7),-(a7)
	move.w	($000e,a7),-(a7)
	DOS	_READ
	lea.l	($000a,a7),a7
	rts

L0058a2:
	move.l	($000c,a7),-(a7)
	move.l	($000c,a7),-(a7)
	move.w	($000e,a7),-(a7)
	DOS	_WRITE
	lea.l	($000a,a7),a7
	rts

L0058b6:
	move.l	($0004,a7),-(a7)
	DOS	_DELETE
	addq.l	#4,a7
	rts

L0058c0:
	move.w	($000e,a7),-(a7)
	move.l	($000a,a7),-(a7)
	move.w	($000c,a7),-(a7)
	DOS	_SEEK
	addq.l	#8,a7
	rts

L0058d2:
	move.w	($000e,a7),-(a7)
	move.l	($000a,a7),-(a7)
	move.l	($000a,a7),-(a7)
	DOS	_FILES
	lea.l	($000a,a7),a7
	rts

L0058e6:
	move.l	($0004,a7),-(a7)
	DOS	_NFILES
	addq.l	#4,a7
	rts

L0058f0:
	move.l	($0008,a7),-(a7)
	move.w	($000a,a7),-(a7)
	DOS	_FILEDATE
	addq.l	#6,a7
	rts

L0058fe:
	jsr	(L00590a)
	jmp	(L005c6e)

L00590a:
	movem.l	d6-d7/a6,-(a7)
	clr.l	d6
	moveq.l	#$28,d7			;'('
	subq.l	#1,d7
	movea.l	#L008b0c,a6
	subq.l	#4,a7
L00591c:
	move.l	a6,(a7)
	jsr	(L006f5e)
	tst.l	d0
	bne	L00592a
	addq.l	#1,d6
L00592a:
	adda.l	#$00000016,a6
	dbra	d7,L00591c
	move.l	d6,d0
	bne	L00593a
	moveq.l	#$ff,d0
L00593a:
	addq.l	#4,a7
	movem.l	(a7)+,d6-d7/a6
	move.l	d0,-(a7)
	DOS	_FFLUSH
	movem.l	(a7)+,d0
	rts

L00594a:
	movea.l	($0004,a7),a2
	lea.l	(-$000c,a2),a2
	cmpa.l	(L008edc),a2
	bcs	L005978
	cmpa.l	(L008ee4),a2
	bcc	L005978
	move.b	#$fe,($0004,a2)
	lea.l	(L008ee8),a1
	cmpa.l	(a1),a2
	bcc	L005974
	move.l	a2,(a1)
L005974:
	clr.l	d0
	rts

L005978:
	moveq.l	#$ff,d0
	rts

L00597c:
	move.l	($0004,a7),d1
	clr.l	d0
	cmp.b	#$81,d1
	bcs	L00599c
	cmp.b	#$a0,d1
	bcs	L00599a
	cmp.b	#$e0,d1
	bcs	L00599c
	cmp.b	#$f0,d1
	bcc	L00599c
L00599a:
	moveq.l	#$01,d0
L00599c:
	rts

L00599e:
	movem.l	($0004,a7),a0-a1
	move.l	a1,d2
	suba.l	a1,a1
L0059a8:
	move.l	a0,d0
	clr.l	d1
	move.b	(a0)+,d1
	beq	L0059d6
	cmp.b	#$80,d1
	bcs	L0059ce
	cmp.b	#$a0,d1
	bcs	L0059c8
	cmp.b	#$e0,d1
	bcs	L0059ce
	cmp.b	#$f6,d1
	bcc	L0059ce
L0059c8:
	rol.w	#8,d1
	move.b	(a0)+,d1
	beq	L0059d6
L0059ce:
	cmp.w	d1,d2
	bne	L0059a8
	movea.l	d0,a1
	bra	L0059a8

L0059d6:
	move.l	a1,d0
	rts

L0059da:
	nop
	nop
L0059de:
	move.l	($0004,a7),d2
	ble	L005ab8
	moveq.l	#$0c,d0
	add.l	d0,d2
	movea.l	d0,a1
	movea.l	(L008ee8),a2
L0059f2:
	cmpi.b	#$fe,($0004,a2)
	beq	L005a20
	move.l	($0008,a2),d1
	beq	L005a60
	move.l	d1,d0
	sub.l	($0004,a2),d0
	bclr.l	#$00,d0
	cmp.l	d2,d0
	bcc	L005a76
	movea.l	d1,a2
L005a10:
	cmp.l	a1,d0
	bcs	L0059f2
	moveq.l	#$ff,d0
	movea.l	d0,a1
	move.l	a2,(L008ee8)
	bra	L0059f2

L005a20:
	move.l	($0008,a2),d1
	beq	L005a50
L005a26:
	movea.l	d1,a0
	cmpi.b	#$fe,($0004,a0)
	bne	L005a3c
	move.l	($0008,a0),d1
	bne	L005a26
	clr.l	($0008,a2)
	bra	L005a50

L005a3c:
	move.l	a0,($0008,a2)
	move.l	a2,($0000.w,a0)
	move.l	a0,d0
	sub.l	a2,d0
	cmp.l	d2,d0
	bcc	L005a8e
	movea.l	a0,a2
	bra	L005a10

L005a50:
	suba.l	a0,a0
	move.l	(L008ee4),d0
	sub.l	a2,d0
	cmp.l	d2,d0
	bcc	L005a8e
	bra	L005ab8

L005a60:
	move.l	(L008ee4),d0
	sub.l	($0004,a2),d0
	bmi	L005ab8
	bclr.l	#$00,d0
	cmp.l	d2,d0
	bcs	L005ab8
	clr.l	d1
L005a76:
	move.l	($0004,a2),d0
	addq.l	#1,d0
	bclr.l	#$00,d0
	movea.l	d0,a0
	move.l	a0,($0008,a2)
	move.l	a2,($0000.w,a0)
	movea.l	a0,a2
	movea.l	d1,a0
L005a8e:
	move.l	d2,d0
	add.l	a2,d0
	move.l	d0,($0004,a2)
	move.l	a0,($0008,a2)
	move.l	a0,d1
	beq	L005aa2
	move.l	a2,($0000.w,a0)
L005aa2:
	cmpa.l	#$ffffffff,a1
	beq	L005ab0
	move.l	a2,(L008ee8)
L005ab0:
	lea.l	($000c,a2),a2
	move.l	a2,d0
	rts

L005ab8:
	clr.l	d0
	rts

L005abc:
	nop
	movea.l	($0004,a7),a1
	movea.l	($0008,a7),a0
	bra	L005ace

L005ac8:
	movem.l	($0004,a7),a0-a1
L005ace:
	movea.l	a0,a2
	move.l	($000c,a7),d0
	ble	L005b00
	move.l	d0,d1
	move.l	d0,d2
	subq.l	#1,d0
	move.l	d0,d1
	swap.w	d1
	cmpa.l	a0,a1
	beq	L005b00
	bcs	L005af2
L005ae6:
	move.b	(a1)+,(a0)+
	dbra	d0,L005ae6
	dbra	d1,L005ae6
	bra	L005b00

L005af2:
	adda.l	d2,a0
	adda.l	d2,a1
L005af6:
	move.b	-(a1),-(a0)
	dbra	d0,L005af6
	dbra	d1,L005af6
L005b00:
	move.l	a2,d0
	rts

L005b04:
	pea.l	($0008,a7)
	move.l	($0008,a7),-(a7)
	pea.l	(L008b22)
	pea.l	(L006fba)
	jsr	(L005c72)
	lea.l	($0010,a7),a7
	rts

L005b24:
	move.l	($0004,a7),d1
	add.l	(L008ee4),d1
	cmp.l	(L008ee0),d1
	bcs	L005b5a
	movea.l	(L008eb8),a1
	move.l	d1,d0
	sub.l	a1,d0
	move.l	d0,-(a7)
	move.l	a1,-(a7)
	DOS	_SETBLOCK
	addq.l	#8,a7
	tst.l	d0
	bmi	L005b5a
	move.l	(L008ee4),d0
	move.l	d1,(L008ee4)
	rts

L005b5a:
	move.l	#$0000000c,(L008eae)
	moveq.l	#$ff,d0
	rts

L005b68:
	pea.l	($000c,a7)
	move.l	($000c,a7),-(a7)
	pea.l	($000c,a7)
	pea.l	(L005b8c)
	jsr	(L005c72)
	lea.l	($0010,a7),a7
	movea.l	($0004,a7),a0
	clr.b	(a0)
	rts

L005b8c:
	movem.l	($0004,a7),d0/a0
	movea.l	(a0),a1
	move.b	d0,(a1)+
	move.l	a1,(a0)
	rts

L005b9a:
	pea.l	($000c,a7)
	move.l	($000c,a7),-(a7)
	move.l	($000c,a7),-(a7)
	pea.l	(L005bb8)
	jsr	(L0067e0)
	lea.l	($0010,a7),a7
	rts

L005bb8:
	movem.l	($0004,a7),d0/a0
	cmp.l	#$ffffffff,d0
	beq	L005bce
	move.b	d0,-(a0)
	move.l	a0,($0008,a7)
	rts

L005bce:
	clr.l	d0
	move.b	(a0)+,d0
	beq	L005bda
	move.l	a0,($0008,a7)
	rts

L005bda:
	moveq.l	#$ff,d0
	rts

L005bde:
	movem.l	($0004,a7),a0-a1
	move.l	a0,d0
L005be6:
	tst.b	(a0)+
	bne	L005be6
	subq.l	#1,a0
L005bec:
	move.b	(a1)+,(a0)+
	bne	L005bec
	rts

L005bf2:
	movem.l	($0004,a7),a0-a1
	clr.l	d0
	clr.l	d1
L005bfc:
	move.b	(a0)+,d0
	move.b	(a1)+,d1
	beq	L005c08
	sub.l	d1,d0
	beq	L005bfc
	rts

L005c08:
	sub.l	d1,d0
	rts

L005c0c:
	movem.l	($0004,a7),a0-a1
	move.l	a0,d0
L005c14:
	move.b	(a1)+,(a0)+
	bne	L005c14
	rts

L005c1a:
	movea.l	($0004,a7),a0
	move.l	a0,d0
L005c20:
	tst.b	(a0)+
	bne	L005c20
	subq.l	#1,a0
	exg.l	d0,a0
	sub.l	a0,d0
	rts

L005c2c:
	clr.l	d0
	move.l	($0008,a7),d1
	movea.l	($0004,a7),a0
L005c36:
	cmp.b	(a0),d1
	bne	L005c3c
	move.l	a0,d0
L005c3c:
	tst.b	(a0)+
	bne	L005c36
	rts

L005c42:
	move.l	($0004,a7),d0
	cmpi.b	#$41,d0			;'A'
	bcs	L005c56
	cmpi.b	#$5b,d0			;'['
	bcc	L005c56
	add.b	#$20,d0			;' '
L005c56:
	rts

L005c58:
	move.l	($0004,a7),d0
	cmpi.b	#$61,d0			;'a'
	bcs	L005c6c
	cmpi.b	#$7b,d0			;'{'
	bcc	L005c6c
	sub.b	#$20,d0			;' '
L005c6c:
	rts

L005c6e:
	addq.l	#6,a7
	DOS	_EXIT2

L005c72:
	movem.l	d3-d7/a3-a6,-(a7)
	lea.l	(-$026c,a7),a7
	movea.l	($0294,a7),a6
	movea.l	($02a0,a7),a5
	movea.l	($029c,a7),a4
	move.l	($0298,a7),d6
	clr.l	d7
L005c8c:
	clr.l	d4
	clr.l	d5
	movea.l	a7,a3
	bsr	L005ca6
	btst.l	#$19,d4
	beq	L005c8c
	lea.l	($026c,a7),a7
	move.l	d7,d0
	movem.l	(a7)+,d3-d7/a3-a6
	rts

L005ca6:
	move.b	(a4)+,d0
	bne	L005cb0
	bset.l	#$19,d4
	bra	L005cc0

L005cb0:
	movea.l	a4,a2
	cmpi.b	#$25,d0			;'%'
	bne	L005cbc
	bsr	L005cc2
	bra	L005cc0

L005cbc:
	bsr	L0062c4
L005cc0:
	rts

L005cc2:
	move.b	(a4)+,d0
	bne	L005ccc
	bset.l	#$19,d4
	rts

L005ccc:
	cmpi.b	#$2d,d0			;'-'
	bne	L005cd8
	bset.l	#$1f,d4
	bra	L005cc2

L005cd8:
	cmpi.b	#$2b,d0			;'+'
	bne	L005ce4
	bset.l	#$1e,d4
	bra	L005cc2

L005ce4:
	cmpi.b	#$20,d0			;' '
	bne	L005cf0
	bset.l	#$16,d4
	bra	L005cc2

L005cf0:
	cmpi.b	#$23,d0			;'#'
	bne	L005cfc
	bset.l	#$17,d4
	bra	L005cc2

L005cfc:
	moveq.l	#$ff,d3
	cmpi.b	#$30,d0			;'0'
	bne	L005d0a
	bset.l	#$1a,d4
	bra	L005d1c

L005d0a:
	cmpi.b	#$2a,d0			;'*'
	bne	L005d1c
	move.l	(a5)+,d1
	move.w	d1,d3
	move.b	(a4)+,d0
	beq	L0062be
	bra	L005d34

L005d1c:
	cmp.b	#$30,d0			;'0'
	bcs	L005d34
	cmp.b	#$39,d0			;'9'
	bhi	L005d34
	bsr	L0062de
	bmi	L0062be
	move.w	d0,d3
	swap.w	d0
L005d34:
	cmpi.b	#$2e,d0			;'.'
	bne	L005d76
	bset.l	#$1d,d4
	move.b	(a4)+,d0
	beq	L0062be
	cmpi.b	#$2a,d0			;'*'
	bne	L005d5a
	move.l	(a5)+,d1
	swap.w	d3
	move.w	d1,d3
	swap.w	d3
	move.b	(a4)+,d0
	beq	L0062be
	bra	L005d76

L005d5a:
	cmp.b	#$30,d0			;'0'
	bcs	L005d76
	cmp.b	#$39,d0			;'9'
	bhi	L005d76
	bsr	L0062de
	bmi	L0062be
	swap.w	d3
	move.w	d0,d3
	swap.w	d3
	swap.w	d0
L005d76:
	cmpi.b	#$6c,d0			;'l'
	beq	L005d82
	cmpi.b	#$4c,d0			;'L'
	bne	L005d8c
L005d82:
	bset.l	#$1c,d4
	move.b	(a4)+,d0
	beq	L0062be
L005d8c:
	cmpi.b	#$41,d0			;'A'
	bcs	L0062be
	cmpi.b	#$5a,d0			;'Z'
	bhi	L005da4
	bset.l	#$1b,d4
	add.b	#$20,d0			;' '
	bra	L005db4

L005da4:
	cmpi.b	#$61,d0			;'a'
	bcs	L0062be
	cmpi.b	#$7a,d0			;'z'
	bhi	L0062be
L005db4:
	cmpi.b	#$62,d0			;'b'
	bcs	L0062be
	cmpi.b	#$63,d0			;'c'
	bcs	L006142
	cmpi.b	#$64,d0			;'d'
	bcs	L006070
	cmpi.b	#$65,d0			;'e'
	bcs	L0060d4
	cmpi.b	#$68,d0			;'h'
	bcs	L005dfe
	cmpi.b	#$6f,d0			;'o'
	beq	L00614a
	cmpi.b	#$73,d0			;'s'
	beq	L006094
	cmpi.b	#$75,d0			;'u'
	beq	L0060d4
	cmpi.b	#$78,d0			;'x'
	beq	L006152
	bra	L0062be

L005dfe:
	clr.l	d2
	move.b	d0,d2
	move.l	(a5)+,d0
	move.l	(a5)+,d1
	cmpi.b	#$67,d2			;'g'
	beq	L005ea2
	cmpi.b	#$66,d2			;'f'
	beq	L005e60
	cmp.w	#$ffff,d3
	bne	L005e1e
	move.w	#$0001,d3
L005e1e:
	swap.w	d3
	cmp.w	#$ffff,d3
	bne	L005e2a
	move.w	#$0006,d3
L005e2a:
	move.w	d3,d2
	swap.w	d3
	bsr	L005f42
	bsr	L005f88
L005e36:
	lea.l	($0001,a3),a0
	cmpi.b	#$2d,(a0)		;'-'
	beq	L006060
	btst.l	#$1e,d4
	bne	L005e58
	btst.l	#$16,d4
	beq	L006060
	move.b	#$20,-(a0)		;' '
	bra	L006060

L005e58:
	move.b	#$2b,-(a0)		;'+'
	bra	L006060

L005e60:
	cmp.w	#$ffff,d3
	bne	L005e6a
	move.w	#$0001,d3
L005e6a:
	swap.w	d3
	cmp.w	#$ffff,d3
	bne	L005e76
	move.w	#$0006,d3
L005e76:
	move.w	d3,d2
	swap.w	d3
	subq.l	#8,a7
	movea.l	a7,a0
	lea.l	($0004,a7),a1
	move.l	a1,-(a7)
	move.l	a0,-(a7)
	move.l	d2,-(a7)
	movem.l	d0-d1,-(a7)
	jsr	(L006cd2)
	lea.l	($0014,a7),a7
	movem.l	(a7)+,d1-d2
	movea.l	d0,a0
	bsr	L005fce
	bra	L005e36

L005ea2:
	cmp.w	#$ffff,d3
	bne	L005eac
	move.w	#$0001,d3
L005eac:
	swap.w	d3
	cmp.w	#$ffff,d3
	bne	L005eb8
	move.w	#$000e,d3
L005eb8:
	move.w	d3,d2
	swap.w	d3
	movem.l	d0-d2,-(a7)
	subq.l	#8,a7
	movea.l	a7,a0
	lea.l	($0004,a7),a1
	move.l	a1,-(a7)
	move.l	a0,-(a7)
	move.l	d2,-(a7)
	movem.l	d0-d1,-(a7)
	jsr	(L006cd2)
	lea.l	($0014,a7),a7
	movem.l	(a7)+,d1-d2
	movea.l	d0,a0
	subq.l	#1,d1
	cmp.w	#$fffc,d1
	blt	L005ef2
	move.l	d3,d0
	swap.w	d0
	cmp.w	d0,d1
	ble	L005f02
L005ef2:
	movem.l	(a7)+,d0-d2
	bsr	L005f42
	bsr	L005f12
	bsr	L005f88
	bra	L005e36

L005f02:
	addq.l	#1,d1
	lea.l	($000c,a7),a7
	bsr	L005fce
	bsr	L005f12
	bra	L005e36

L005f12:
	btst.l	#$17,d4
	bne	L005f40
	clr.b	(a1)
	lea.l	($0001,a3),a0
L005f1e:
	move.b	(a0)+,d0
	beq	L005f40
	cmp.b	#$2e,d0			;'.'
	bne	L005f1e
L005f28:
	move.b	-(a1),d0
	cmp.b	#$30,d0			;'0'
	beq	L005f28
	cmp.b	#$2e,d0			;'.'
	bne	L005f3c
	btst.l	#$17,d4
	beq	L005f3e
L005f3c:
	addq.l	#1,a1
L005f3e:
	clr.b	(a1)
L005f40:
	rts

L005f42:
	addq.w	#1,d2
	subq.l	#8,a7
	movea.l	a7,a0
	lea.l	($0004,a7),a1
	move.l	a1,-(a7)
	move.l	a0,-(a7)
	move.l	d2,-(a7)
	movem.l	d0-d1,-(a7)
	jsr	(L006b7c)
	movem.l	(a7)+,d1-d2
	lea.l	($000c,a7),a7
	or.l	d2,d1
	movem.l	(a7)+,d1-d2
	bne	L005f6e
	moveq.l	#$01,d1
L005f6e:
	movea.l	d0,a0
	lea.l	($0001,a3),a1
	tst.l	d2
	beq	L005f7c
	move.b	#$2d,(a1)+		;'-'
L005f7c:
	bsr	L006054
	move.b	d0,(a1)+
	bsr	L00602a
	rts

L005f88:
	move.b	#$65,d0			;'e'
	btst.l	#$1b,d4
	beq	L005f96
	move.b	#$45,d0			;'E'
L005f96:
	move.b	d0,(a1)+
	move.b	#$2b,d0			;'+'
	subq.l	#1,d1
	tst.l	d1
	bpl	L005fa8
	move.b	#$2d,d0			;'-'
	neg.l	d1
L005fa8:
	move.b	d0,(a1)+
	divu.w	#$0064,d1
	add.b	#$30,d1			;'0'
	move.b	d1,(a1)+
	clr.w	d1
	swap.w	d1
	divu.w	#$000a,d1
	add.b	#$30,d1			;'0'
	move.b	d1,(a1)+
	swap.w	d1
	add.b	#$30,d1			;'0'
	move.b	d1,(a1)+
	clr.b	(a1)
	rts

L005fce:
	lea.l	($0001,a3),a1
	tst.l	d2
	beq	L005fda
	move.b	#$2d,(a1)+		;'-'
L005fda:
	tst.l	d1
	bmi	L005ff0
	beq	L005ff0
	subq.l	#1,d1
L005fe2:
	bsr	L006054
	move.b	d0,(a1)+
	dbra	d1,L005fe2
	bsr	L00602a
	clr.b	(a1)
	rts

L005ff0:
	neg.l	d1
	move.l	d3,d0
	swap.w	d0
	move.b	#$30,(a1)+		;'0'
	btst.l	#$17,d4
	bne	L006004
	tst.w	d0
	beq	L006026
L006004:
	move.b	#$2e,(a1)+		;'.'
	tst.w	d0
	beq	L006026
	subq.w	#1,d1
	bmi	L00601c
L006010:
	move.b	#$30,(a1)+		;'0'
	subq.w	#1,d0
	beq	L006026
	dbra	d1,L006010
L00601c:
	move.l	d0,d1
L00601e:
	bsr	L006054
	move.b	d0,(a1)+
	subq.w	#1,d1
	bne	L00601e
L006026:
	clr.b	(a1)
	rts

L00602a:
	move.l	d3,d0
	swap.w	d0
	btst.l	#$17,d4
	bne	L006038
	tst.w	d0
	ble	L006052
L006038:
	move.b	#$2e,(a1)+		;'.'
	subq.w	#1,d0
	bmi	L006052
	movem.l	d1,-(a7)
	move.l	d0,d1
L006046:
	bsr	L006054
	move.b	d0,(a1)+
	dbra	d1,L006046
	movem.l	(a7)+,d1
L006052:
	rts

L006054:
	move.b	(a0)+,d0
	bne	L00605e
	move.b	#$30,d0			;'0'
	subq.l	#1,a0
L00605e:
	rts

L006060:
	movea.l	a0,a1
L006062:
	tst.b	(a1)+
	bne	L006062
	move.l	a1,d5
	sub.l	a0,d5
	subq.l	#1,d5
	bra	L00620c

L006070:
	cmp.w	#$ffff,d3
	bne	L00607a
	move.w	#$0001,d3
L00607a:
	swap.w	d3
	cmp.w	#$ffff,d3
	bne	L006086
	move.w	#$0001,d3
L006086:
	swap.w	d3
	lea.l	($0003,a5),a0
	tst.l	(a5)+
	moveq.l	#$01,d5
	bra	L00620c

L006094:
	move.l	(a5)+,d0
	bmi	L0060a2
	bne	L0060a8
	move.l	#L006338,d0
	bra	L0060a8

L0060a2:
	move.l	#L00633f,d0
L0060a8:
	movea.l	d0,a0
	movea.l	a0,a1
L0060ac:
	tst.b	(a1)+
	bne	L0060ac
	move.l	a1,d5
	sub.l	a0,d5
	subq.l	#1,d5
	cmp.w	#$ffff,d3
	bne	L0060be
	clr.w	d3
L0060be:
	swap.w	d3
	cmp.w	#$ffff,d3
	bne	L0060c8
	move.w	d5,d3
L0060c8:
	cmp.w	d3,d5
	bcs	L0060ce
	move.w	d3,d5
L0060ce:
	swap.w	d3
	bra	L00620c

L0060d4:
	move.l	a3,-(a7)
	lea.l	(-$0022,a7),a7
	movea.l	a7,a0
	move.l	(a5)+,d1
	clr.l	d5
	cmpi.b	#$75,d0			;'u'
	beq	L00610a
	tst.l	d1
	bmi	L006102
	btst.l	#$1e,d4
	bne	L0060fc
	btst.l	#$16,d4
	beq	L00610a
	move.b	#$20,(a3)+		;' '
	bra	L006108

L0060fc:
	move.b	#$2b,(a3)+		;'+'
	bra	L006108

L006102:
	move.b	#$2d,(a3)+		;'-'
	neg.l	d1
L006108:
	addq.l	#1,d5
L00610a:
	tst.l	d1
	beq	L00613c
	lea.l	(L006308),a1
L006114:
	move.l	(a1)+,d0
	cmp.l	d0,d1
	bcs	L006114
L00611a:
	moveq.l	#$2f,d2			;'/'
L00611c:
	addq.b	#1,d2
	sub.l	d0,d1
	bcc	L00611c
	add.l	d0,d1
	move.b	d2,(a0)+
	move.l	(a1)+,d0
	bne	L00611a
L00612a:
	clr.b	(a0)
	movea.l	a7,a0
	moveq.l	#$ff,d1
L006130:
	addq.w	#1,d1
	tst.b	(a0)+
	bne	L006130
	movea.l	a7,a0
	bra	L0061d0

L00613c:
	move.b	#$30,(a0)+		;'0'
	bra	L00612a

L006142:
	move.l	#$00010001,d1
	bra	L006158

L00614a:
	move.l	#$00030007,d1
	bra	L006158

L006152:
	move.l	#$0004000f,d1
L006158:
	movem.l	a3,-(a7)
	clr.l	d5
	bclr.l	#$17,d4
	beq	L00618e
	move.b	#$30,(a3)+		;'0'
	addq.w	#1,d5
	cmpi.w	#$0001,d1
	bne	L006176
	move.b	#$62,(a3)+		;'b'
	bra	L006180

L006176:
	cmpi.w	#$000f,d1
	bne	L00618e
	move.b	#$78,(a3)+		;'x'
L006180:
	addq.w	#1,d5
	btst.l	#$1b,d4
	beq	L00618e
	subi.b	#$20,(-$0001,a3)	;' '
L00618e:
	movea.l	a7,a0
	lea.l	(-$0022,a7),a7
	move.l	(a5)+,d0
	clr.b	-(a0)
	move.l	d0,d2
	movem.l	d5,-(a7)
	clr.l	d5
L0061a0:
	addq.l	#1,d5
	and.b	d1,d2
	cmpi.b	#$09,d2
	bgt	L0061b0
	add.b	#$30,d2			;'0'
	bra	L0061be

L0061b0:
	add.b	#$37,d2			;'7'
	btst.l	#$1b,d4
	bne	L0061be
	add.b	#$20,d2			;' '
L0061be:
	move.b	d2,-(a0)
	swap.w	d1
	lsr.l	d1,d0
	swap.w	d1
	move.l	d0,d2
	bne	L0061a0
	move.l	d5,d1
	movem.l	(a7)+,d5
L0061d0:
	cmp.w	#$ffff,d3
	bne	L0061da
	move.w	#$0001,d3
L0061da:
	swap.w	d3
	cmp.w	#$ffff,d3
	bne	L0061e6
	move.w	#$0001,d3
L0061e6:
	move.w	d3,d0
	swap.w	d3
	sub.w	d1,d0
	ble	L0061fa
	subq.w	#1,d0
L0061f0:
	move.b	#$30,(a3)+		;'0'
	addq.l	#1,d5
	dbra	d0,L0061f0
L0061fa:
	addq.l	#1,d5
	move.b	(a0)+,(a3)+
	bne	L0061fa
	subq.l	#1,d5
	lea.l	($0022,a7),a7
	movem.l	(a7)+,a3
	movea.l	a3,a0
L00620c:
	cmp.w	d3,d5
	bcs	L006212
	move.w	d5,d3
L006212:
	btst.l	#$1f,d4
	bne	L00627c
	btst.l	#$1a,d4
	beq	L006268
	lea.l	(L006335),a1
	move.b	(a0),d0
	cmp.b	#$30,d0			;'0'
	beq	L006246
	cmp.b	#$20,d0			;' '
	beq	L00623e
	cmpi.b	#$2b,d0			;'+'
	beq	L00623e
	cmpi.b	#$2d,d0			;'-'
	bne	L00626e
L00623e:
	bsr	L00629c
	tst.b	(a0)+
	subq.w	#1,d5
	bra	L00626e

L006246:
	move.b	($0001,a0),d0
	or.b	#$20,d0
	cmp.b	#$62,d0			;'b'
	beq	L00625a
	cmp.b	#$78,d0			;'x'
	bne	L00626e
L00625a:
	bsr	L00629c
	tst.b	(a0)+
	subq.w	#1,d5
	bsr	L00629c
	tst.b	(a0)+
	subq.w	#1,d5
	bra	L00626e

L006268:
	lea.l	(L006334),a1
L00626e:
	cmp.w	d3,d5
	bcc	L00627c
	exg.l	a1,a0
L006274:
	bsr	L00629c
	cmp.w	d3,d5
	bcs	L006274
	exg.l	a1,a0
L00627c:
	tst.w	d5
	beq	L00628c
	bsr	L00629c
	tst.b	(a0)+
	tst.w	d3
	ble	L00629a
	subq.w	#1,d5
	bne	L00627c
L00628c:
	tst.w	d3
	ble	L00629a
	lea.l	(L006334),a0
L006296:
	bsr	L00629c
	bne	L006296
L00629a:
	rts

L00629c:
	movem.l	d1-d5/d7/a0-a6,-(a7)
	move.b	(a0),d0
	andi.l	#$000000ff,d0
	movem.l	d0/d6,-(a7)
	jsr	(a6)
	movem.l	(a7)+,d0/d6
	movem.l	(a7)+,d1-d5/d7/a0-a6
	moveq.l	#$01,d0
	add.l	d0,d7
	sub.w	d0,d3
	rts

L0062be:
	clr.l	d4
	movea.l	a2,a4
	move.b	(a4)+,d0
L0062c4:
	lea.l	(-$0001,a4),a0
L0062c8:
	move.b	(a4)+,d0
	beq	L0062d2
	cmpi.b	#$25,d0			;'%'
	bne	L0062c8
L0062d2:
	tst.b	-(a4)
	move.l	a4,d5
	sub.l	a0,d5
	move.w	d5,d3
	bra	L00620c

L0062de:
	clr.l	d1
L0062e0:
	cmpi.b	#$30,d0			;'0'
	bcs	L006300
	cmpi.b	#$39,d0			;'9'
	bhi	L006300
	andi.w	#$000f,d0
	add.w	d1,d1
	add.w	d1,d0
	lsl.w	#2,d1
	add.w	d0,d1
	move.b	(a4)+,d0
	bne	L0062e0
	moveq.l	#$ff,d1
	rts

L006300:
	swap.w	d0
	move.w	d1,d0
	clr.l	d1
	rts

L006308:
	.dc.b	$3b,$9a,$ca,$00,$05,$f5,$e1,$00,$00,$98,$96,$80,$00,$0f,$42,$40
	.dc.b	$00,$01,$86,$a0,$00,$00,$27,$10,$00,$00,$03,$e8,$00,$00,$00,$64
	.dc.b	$00,$00,$00,$0a,$00,$00,$00,$01,$00,$00,$00,$00
L006334:
	.dc.b	$20
L006335:
	.dc.b	$30,$0d,$00
L006338:
	.dc.b	'(NULL)',$00
L00633f:
	.dc.b	'(ERROR)',$00,$00
L006348:
	.dc.b	'C library for X68000 XCｺﾝﾊﾟｲﾗ v1.00',$00
L00636c:
	.dc.b	'Copyright 1987 SHARP/hudson',$00
L006388:
	lea.l	(L009328),a7
	move.l	a2,(L008ef8)
	move.l	a3,(L008eec)
	bsr	L006610
	lea.l	($0100,a0),a5
	move.l	a5,(L008ebc)
	move.l	($0034,a0),d0
	move.l	d0,(L008ec0)
	move.l	d0,(L008ec4)
	move.l	($0030,a0),d0
	move.l	d0,(L008ec8)
	move.l	d0,(L008ecc)
	move.l	a1,(L008ed0)
	lea.l	($0010,a0),a5
	move.l	a1,d1
	addq.l	#1,d1
	and.l	#$00fffffe,d1
	add.l	#$00000400,d1
	move.l	d1,(L008ed4)
	move.l	(L00678a),d0
	cmp.l	#$00001000,d0
	bcc	L0063fc
	move.l	#$00001000,d0
L0063fc:
	addq.l	#1,d0
	and.l	#$00fffffe,d0
	add.l	d0,d1
	move.l	d1,(L008ed8)
	move.l	d1,(L008ef4)
	movea.l	(L008eec),a0
	move.l	(a0),d0
	addq.l	#5,d0
	and.l	#$00fffffe,d0
	add.l	d0,d1
	move.l	d1,(L008ef0)
	movea.l	(L008eec),a0
	addq.l	#4,a0
	clr.l	d0
L006434:
	addq.l	#1,d0
	tst.b	(a0)+
	beq	L006442
L00643a:
	addq.l	#1,d0
	tst.b	(a0)+
	bne	L00643a
	bra	L006434

L006442:
	addq.l	#1,d0
	and.l	#$00fffffe,d0
	add.l	d0,d1
	move.l	d1,(L008edc)
	move.l	(L00678e),d0
	cmp.l	#$00002000,d0
	bcc	L006466
	move.l	#$00002000,d0
L006466:
	add.l	#$0000000d,d0
	and.l	#$00fffffe,d0
	add.l	d0,d1
	move.l	d1,(L008ee0)
	move.l	d1,(L008ee4)
	move.l	a5,(L008eb8)
	sub.l	a5,d1
	move.l	d1,-(a7)
	move.l	a5,-(a7)
	DOS	_SETBLOCK
	addq.l	#8,a7
	tst.l	d0
	bmi	L0065fa
	movea.l	(L008ed8),a7
	movea.l	(L008edc),a0
	move.l	a0,(L008ee8)
	lea.l	($0010,a0),a1
	clr.l	(a0)+
	move.l	a1,(a0)+
	clr.l	(a0)+
	move.l	#$48454150,(a0)		;'HEAP'
	movea.l	(L008eec),a0
	movea.l	(L008ef0),a1
	addq.l	#4,a0
L0064c6:
	move.b	(a0)+,(a1)+
	beq	L0064d0
L0064ca:
	move.b	(a0)+,(a1)+
	bne	L0064ca
	bra	L0064c6

L0064d0:
	movea.l	(L008ef0),a0
	movea.l	(L008ef4),a1
L0064dc:
	tst.b	(a0)
	beq	L0064e8
	move.l	a0,(a1)+
L0064e2:
	tst.b	(a0)+
	bne	L0064e2
	bra	L0064dc

L0064e8:
	clr.l	(a1)
	clr.w	(L008eb6)
	clr.l	(L009084)
	lea.l	(L008f04),a0
	lea.l	(L006768),a1
	clr.l	d1
L006504:
	move.l	d1,-(a7)
	DOS	_IOCTRL
	addq.l	#4,a7
	move.b	d1,(a0)+
	move.b	d0,(a0)+
	move.w	(a1)+,(a0)+
	addq.w	#1,d1
	cmp.w	#$0005,d1
	bne	L006504
	move.l	#$0000036f,d0
	movea.l	#L008b0c,a0
L006524:
	clr.b	(a0)+
	dbra	d0,L006524
	lea.l	(L008b0c),a0
	lea.l	(L006768),a1
	clr.l	d1
L006538:
	move.l	d1,-(a7)
	DOS	_IOCTRL
	addq.l	#4,a7
	btst.l	#$07,d0
	beq	L00654c
	move.l	#$00010008,d0
	bra	L006582

L00654c:
	move.l	#$00020000,d0
	movem.l	d0-d1/a1,-(a7)
	move.l	a0,-(a7)
	move.l	#$00000400,-(a7)
	jsr	(L0059de)
	addq.l	#4,a7
	tst.l	d0
	beq	L0065fa
	movea.l	(a7)+,a0
	move.l	d0,($0000.w,a0)
	move.l	d0,($0008,a0)
	move.l	#$00000400,($0010,a0)
	movem.l	(a7)+,d0-d1/a1
L006582:
	or.w	(a1)+,d0
	clr.l	($0004,a0)
	move.l	d0,($000c,a0)
	move.b	d1,($0014,a0)
	lea.l	($0016,a0),a0
	addq.w	#1,d1
	cmp.w	#$0005,d1
	bne	L006538
	jsr	(L007010)
	pea.l	(L0065d4)
	move.w	#$fff1,-(a7)
	DOS	_INTVCS
	addq.l	#6,a7
	move.l	(L008ef4),-(a7)
	move.l	(L008f00),-(a7)
	move.l	(L008efc),-(a7)
	jsr	(L000000)
	lea.l	($000c,a7),a7
	move.l	d0,-(a7)
	jsr	(L0058fe)
L0065d4:
	DOS	_GETPDB
	move.l	#$00000200,d1
	cmp.l	(L008eb8),d0
	beq	L0065f2
	move.w	d1,-(a7)
	DOS	_EXIT2

L0065e8:
	pea.l	(L0067b1)
	DOS	_PRINT
	moveq.l	#$7f,d1
L0065f2:
	move.l	d1,-(a7)
	jsr	(L0058fe)
L0065fa:
	pea.l	(L006792)
	DOS	_PRINT
	addq.l	#4,a7
	move.l	#$0000007f,-(a7)
	jsr	(L005c6e)
L006610:
	movem.l	a0-a2,-(a7)
	lea.l	(L009088),a2
	lea.l	(L009288),a1
	move.l	a2,(a1)+
	movem.l	a0,-(a7)
	lea.l	($0080,a0),a0
L00662a:
	move.b	(a0)+,(a2)+
	bne	L00662a
	movea.l	(a7)+,a0
	tst.b	-(a2)
	lea.l	($00c4,a0),a0
L006636:
	move.b	(a0)+,(a2)+
	bne	L006636
	clr.l	d0
	movea.l	(L008ef8),a0
	move.b	(a0)+,d1
	beq	L0066f6
L006648:
	move.b	(a0)+,d1
	beq	L0066a4
	cmpi.b	#$09,d1
	beq	L006648
	cmpi.b	#$20,d1			;' '
	beq	L006648
	addq.l	#1,d0
	move.l	a2,(a1)+
	cmp.b	#$27,d1			;'''
	beq	L006676
	cmp.b	#$22,d1			;'"'
	bne	L006684
L006668:
	move.b	(a0)+,d1
	beq	L0066a4
	cmp.b	#$22,d1			;'"'
	beq	L0066a4
	move.b	d1,(a2)+
	bra	L006668

L006676:
	move.b	(a0)+,d1
	beq	L0066a4
	cmp.b	#$27,d1			;'''
	beq	L0066a4
	move.b	d1,(a2)+
	bra	L006676

L006684:
	move.b	d1,(a2)+
	move.b	(a0),d1
	beq	L0066a4
	cmp.b	#$22,d1			;'"'
	beq	L0066a4
	cmp.b	#$27,d1			;'''
	beq	L0066a4
	addq.l	#1,a0
	cmpi.b	#$09,d1
	beq	L0066a4
	cmpi.b	#$20,d1			;' '
	bne	L006684
L0066a4:
	clr.b	(a2)+
	movem.l	d1/a0/a2,-(a7)
	movea.l	(-$0004,a1),a2
	move.b	(a2)+,d1
	cmp.b	#$2d,d1			;'-'
	beq	L0066bc
	cmp.b	#$2f,d1			;'/'
	bne	L0066ec
L0066bc:
	lea.l	(L0067d2),a0
	bsr	L006712
	beq	L0066e2
	lea.l	(L0067d9),a0
	bsr	L006712
	bne	L0066ec
	bsr	L006732
	move.l	d1,(L00678e)
L0066d8:
	movem.l	(a7)+,d1/a0/a2
	movea.l	-(a1),a2
	subq.l	#1,d0
	bra	L0066f0

L0066e2:
	bsr	L006732
	move.l	d1,(L00678a)
	bra	L0066d8

L0066ec:
	movem.l	(a7)+,d1/a0/a2
L0066f0:
	tst.b	d1
	bne	L006648
L0066f6:
	move.b	d1,(a2)+
	lea.l	(L009288),a0
	addq.l	#1,d0
	move.l	d0,(L008efc)
	move.l	a0,(L008f00)
	movem.l	(a7)+,a0-a2
	rts

L006712:
	movem.l	a2,-(a7)
L006716:
	move.b	(a0)+,d1
	beq	L00672e
	move.b	(a2)+,d2
	beq	L006726
	or.b	#$20,d2
	cmp.b	d2,d1
	beq	L006716
L006726:
	tst.b	d1
	movem.l	(a7)+,a2
	rts

L00672e:
	addq.l	#4,a7
	rts

L006732:
	clr.l	d1
	clr.l	d2
L006736:
	move.b	(a2)+,d2
	sub.b	#$30,d2			;'0'
	cmp.b	#$0a,d2
	bcc	L006750
	add.l	d1,d1
	move.l	d1,d3
	add.l	d1,d1
	add.l	d1,d1
	add.l	d3,d1
	add.l	d2,d1
	bra	L006736

L006750:
	add.b	#$30,d2			;'0'
	or.b	#$20,d2
	cmp.b	#$6b,d2			;'k'
	bne	L006762
	asl.l	#8,d1
	asl.l	#2,d1
L006762:
	bclr.l	#$00,d1
	rts

L006768:
	.dc.b	$08,$01,$08,$02,$09,$00,$09,$00,$08,$02
L006772:
	.dc.l	L00677a
	.dc.l	L00677e
L00677a:
	.dc.b	'JST',$00
L00677e:
	.dc.b	$00,$00,$00,$00
L006782:
	.dc.l	$00000000
L006786:
	.dc.l	$ffff8170
L00678a:
	.dc.l	$00010000
L00678e:
	.dc.l	$00010000
L006792:
	.dc.b	'主記憶が不足しています！！！',$0d,$0a,$00
L0067b1:
	.dc.b	'スタックが不足しています！！！',$0d,$0a,$00
L0067d2:
	.dc.b	'stack:',$00
L0067d9:
	.dc.b	'heap:',$00,$00
L0067e0:
	movem.l	d3-d7/a3-a6,-(a7)
	movem.l	($0028,a7),d6-d7/a4-a5
	movea.l	d6,a6
	clr.l	d6
L0067ee:
	bsr	L006816
	btst.l	#$1e,d6
	bne	L006804
	btst.l	#$1f,d6
	beq	L0067ee
	and.l	#$0000ffff,d6
	bra	L00680e

L006804:
	and.l	#$0000ffff,d6
	bne	L00680e
	moveq.l	#$ff,d6
L00680e:
	move.l	d6,d0
	movem.l	(a7)+,d3-d7/a3-a6
	rts

L006816:
	and.l	#$0000ffff,d6
L00681c:
	move.b	(a4)+,d0
	beq	L006840
	cmpi.b	#$25,d0			;'%'
	beq	L006858
	bsr	L006846
	beq	L00681c
L00682a:
	bsr	L006b30
	beq	L006844
	bsr	L006846
	beq	L00682a
	cmp.b	(-$0001,a4),d0
	bne	L00683c
	bra	L00681c

L00683c:
	bsr	L006b32
L006840:
	bset.l	#$1f,d6
L006844:
	rts

L006846:
	cmp.b	#$20,d0			;' '
	beq	L006856
	cmp.b	#$09,d0
	beq	L006856
	cmp.b	#$0a,d0
L006856:
	rts

L006858:
	moveq.l	#$ff,d5
	move.b	(a4)+,d0
	beq	L006840
	cmpi.b	#$2a,d0			;'*'
	bne	L00686c
	bset.l	#$1d,d6
	move.b	(a4)+,d0
	beq	L006840
L00686c:
	cmpi.b	#$30,d0			;'0'
	bcs	L00689a
	cmpi.b	#$3a,d0			;':'
	bcc	L00689a
	clr.l	d5
L00687a:
	andi.w	#$000f,d0
	add.w	d5,d5
	move.w	d5,d1
	lsl.w	#2,d5
	add.w	d1,d5
	add.w	d0,d5
	move.b	(a4)+,d0
	beq	L006840
	cmpi.b	#$30,d0			;'0'
	bcs	L00689a
	cmpi.b	#$3a,d0			;':'
	bcc	L00689a
	bra	L00687a

L00689a:
	move.b	d0,d1
	or.b	#$20,d1
	cmp.b	#$6c,d1			;'l'
	bne	L0068ac
	bset.l	#$1c,d6
	bra	L0068b6

L0068ac:
	cmp.b	#$68,d1			;'h'
	bne	L0068c0
	bset.l	#$1b,d6
L0068b6:
	move.b	(a4)+,d0
	beq	L006840
	move.b	d0,d1
	or.b	#$20,d1
L0068c0:
	cmp.b	#$41,d0			;'A'
	bcs	L0068d0
	cmp.b	#$5b,d0			;'['
	bcc	L0068d0
	bset.l	#$1c,d6
L0068d0:
	cmpi.b	#$63,d1			;'c'
	beq	L006a28
	cmpi.b	#$73,d1			;'s'
	beq	L00698c
	cmpi.b	#$64,d1			;'d'
	beq	L006a80
	cmpi.b	#$75,d1			;'u'
	beq	L006a88
	cmpi.b	#$62,d1			;'b'
	beq	L006ac2
	cmpi.b	#$6f,d1			;'o'
	beq	L006ae6
	cmpi.b	#$78,d1			;'x'
	beq	L006b0a
	cmpi.b	#$65,d1			;'e'
	beq	L006a44
	cmpi.b	#$66,d1			;'f'
	beq	L006a44
	cmpi.b	#$5b,d0			;'['
	bne	L006840
	movea.l	a4,a0
	move.b	(a4)+,d0
	beq	L006840
	cmp.b	#$5e,d0			;'^'
	bne	L00693a
	bset.l	#$19,d6
	movea.l	a4,a0
L006934:
	move.b	(a4)+,d0
	beq	L006840
L00693a:
	cmp.b	#$5d,d0			;']'
	bne	L006934
	move.l	a0,-(a7)
	bsr	L0069c0
	bra	L006954

L006946:
	bsr	L006b30
	beq	L00695e
	movea.l	(a7),a0
	bsr	L006966
	beq	L00695a
	bsr	L0069cc
L006954:
	dbra	d5,L006946
	bra	L00695e

L00695a:
	bsr	L006b32
L00695e:
	clr.l	d0
	bsr	L0069cc
	addq.l	#4,a7
	rts

L006966:
	btst.l	#$19,d6
	beq	L00697c
L00696c:
	move.b	(a0)+,d1
	cmp.b	#$5d,d1			;']'
	beq	L006988
	cmp.b	d0,d1
	bne	L00696c
L006978:
	clr.l	d1
	rts

L00697c:
	move.b	(a0)+,d1
	cmp.b	#$5d,d1			;']'
	beq	L006978
	cmp.b	d0,d1
	bne	L00697c
L006988:
	moveq.l	#$ff,d1
	rts

L00698c:
	bsr	L0069c0
	tst.w	d5
	beq	L0069ba
	subq.w	#1,d5
L006994:
	bsr	L006b30
	beq	L0069ba
	bsr	L006846
	beq	L006994
	bra	L0069ae

L0069a2:
	bsr	L006b30
	beq	L0069ba
	bsr	L006846
	beq	L0069b6
L0069ae:
	bsr	L0069cc
	dbra	d5,L0069a2
	bra	L0069ba

L0069b6:
	bsr	L006b32
L0069ba:
	clr.l	d0
	bsr	L0069cc
	rts

L0069c0:
	btst.l	#$1d,d6
	bne	L0069ca
	movea.l	(a5)+,a3
	addq.w	#1,d6
L0069ca:
	rts

L0069cc:
	btst.l	#$1d,d6
	bne	L0069d4
	move.b	d0,(a3)+
L0069d4:
	rts

L0069d6:
	move.b	(a0)+,d1
	beq	L0069e0
	cmp.b	d1,d0
	bne	L0069d6
	rts

L0069e0:
	moveq.l	#$01,d1
	rts

L0069e4:
	move.l	a0,-(a7)
	tst.w	d5
	beq	L006a22
	subq.w	#1,d5
	cmp.w	#$0100,d5
	bcs	L0069f6
	move.w	#$0100,d5
L0069f6:
	bsr	L006b30
	beq	L006a22
	bsr	L006846
	beq	L0069f6
	bra	L006a10

L006a04:
	bsr	L006b30
	beq	L006a22
	bsr	L006846
	beq	L006a1e
L006a10:
	movea.l	(a7),a0
	bsr	L0069d6
	bne	L006a1e
	move.b	d0,(a3)+
	dbra	d5,L006a04
	bra	L006a22

L006a1e:
	bsr	L006b32
L006a22:
	clr.b	(a3)
	addq.l	#4,a7
	rts

L006a28:
	bsr	L0069c0
	cmp.w	#$ffff,d5
	bne	L006a32
	moveq.l	#$01,d5
L006a32:
	subq.w	#1,d5
	bmi	L006a42
L006a36:
	bsr	L006b30
	beq	L006a42
	bsr	L0069cc
	dbra	d5,L006a36
L006a42:
	rts

L006a44:
	lea.l	(L006b54),a0
	lea.l	(-$0102,a7),a7
	movea.l	a7,a3
	bsr	L0069e4
	movea.l	a7,a0
	tst.b	(a0)
	beq	L006a76
	bsr	L0069c0
	btst.l	#$1d,d6
	bne	L006a7a
	btst.l	#$1c,d6
	bne	L006a6e
	FPACK	__STOF
	move.l	d0,(a3)
	bra	L006a7a

L006a6e:
	FPACK	__STOD
	movem.l	d0-d1,(a3)
	bra	L006a7a

L006a76:
	bset.l	#$1f,d6
L006a7a:
	lea.l	($0102,a7),a7
	rts

L006a80:
	lea.l	(L006b57),a0
	bra	L006a8e

L006a88:
	lea.l	(L006b59),a0
L006a8e:
	lea.l	(-$0102,a7),a7
	movea.l	a7,a3
	bsr	L0069e4
	movea.l	a7,a0
	tst.b	(a0)
	beq	L006ab8
	bsr	L0069c0
	btst.l	#$1d,d6
	bne	L006abc
	FPACK	__STOL
L006aaa:
	btst.l	#$1b,d6
	bne	L006ab4
	move.l	d0,(a3)
	bra	L006abc

L006ab4:
	move.w	d0,(a3)
	bra	L006abc

L006ab8:
	bset.l	#$1f,d6
L006abc:
	lea.l	($0102,a7),a7
	rts

L006ac2:
	lea.l	(L006b61),a0
	lea.l	(-$0102,a7),a7
	movea.l	a7,a3
	bsr	L0069e4
	movea.l	a7,a0
	tst.b	(a0)
	beq	L006ab8
	bsr	L0069c0
	btst.l	#$1d,d6
	bne	L006abc
	FPACK	__STOB
	bra	L006aaa

L006ae6:
	lea.l	(L006b5b),a0
	lea.l	(-$0102,a7),a7
	movea.l	a7,a3
	bsr	L0069e4
	movea.l	a7,a0
	tst.b	(a0)
	beq	L006ab8
	bsr	L0069c0
	btst.l	#$1d,d6
	bne	L006abc
	FPACK	__STOO
	bra	L006aaa

L006b0a:
	lea.l	(L006b64),a0
	lea.l	(-$0102,a7),a7
	movea.l	a7,a3
	bsr	L0069e4
	movea.l	a7,a0
	tst.b	(a0)
	beq	L006ab8
	bsr	L0069c0
	btst.l	#$1d,d6
	bne	L006abc
	FPACK	__STOH
	bra	L006aaa

L006b30:
	moveq.l	#$ff,d0
L006b32:
	movem.l	d1-d5/a0-a6,-(a7)
	move.l	d7,-(a7)
	move.l	d0,-(a7)
	jsr	(a6)
	addq.l	#4,a7
	move.l	(a7)+,d7
	cmp.l	#$ffffffff,d0
	bne	L006b4e
	bset.l	#$1e,d6
	clr.l	d0
L006b4e:
	movem.l	(a7)+,d1-d5/a0-a6
	rts

L006b54:
	.dc.b	'eE.'
L006b57:
	.dc.b	$2b,$2d
L006b59:
	.dc.b	$39,$38
L006b5b:
	.dc.b	'765432'
L006b61:
	.dc.b	$31,$30,$00
L006b64:
	.dc.b	'fFeEdDcCbBaA9876543210',$00,$00
L006b7c:
	movem.l	($0004,a7),d0-d2/a1-a2
	movea.l	#L006b9c,a0
	clr.b	(a0)
	cmp.l	#$00000135,d2
	bcc	L006b98
	FPACK	__ECVT
	move.l	d0,(a1)
	move.l	d1,(a2)
L006b98:
	move.l	a0,d0
	rts

L006b9c:
	.ds.b	310
L006cd2:
	movem.l	($0004,a7),d0-d2/a1-a2
	lea.l	(L006cf2),a0
	clr.b	(a0)
	cmp.l	#$00000135,d2
	bcc	L006cee
	FPACK	__FCVT
	move.l	d0,(a1)
	move.l	d1,(a2)
L006cee:
	move.l	a0,d0
	rts

L006cf2:
	.ds.b	620
L006f5e:
	movea.l	($0004,a7),a2
	move.l	($000c,a2),d2
	beq	L006fb6
	btst.l	#$13,d2
	beq	L006fa0
	move.l	($0010,a2),d1
	sub.l	($0004,a2),d1
	beq	L006fa0
	movem.l	d1-d2/a2,-(a7)
	move.l	d1,-(a7)
	move.l	($0008,a2),-(a7)
	clr.l	d0
	move.b	($0014,a2),d0
	move.l	d0,-(a7)
	jsr	(L0070be)
	lea.l	($000c,a7),a7
	movem.l	(a7)+,d1-d2/a2
	cmp.l	d1,d0
	beq	L006fa0
	bset.l	#$06,d2
L006fa0:
	clr.l	($0004,a2)
	and.l	#$ffe3ffff,d2
	move.l	d2,($000c,a2)
	clr.l	d0
	btst.l	#$06,d2
	beq	L006fb8
L006fb6:
	moveq.l	#$ff,d0
L006fb8:
	rts

L006fba:
	movem.l	a6,-(a7)
	movem.l	($0008,a7),d0/a6
	move.l	($000c,a6),d2
	btst.l	#$12,d2
	beq	L006fd2
	clr.l	($0004,a6)
L006fd2:
	subq.l	#1,($0004,a6)
	bmi	L006ffe
	movea.l	($0000.w,a6),a0
	move.b	d0,(a0)+
	move.l	a0,($0000.w,a6)
	cmp.b	#$0a,d0
	bne	L00700a
	btst.l	#$08,d2
	beq	L00700a
	move.l	d0,-(a7)
	move.l	a6,-(a7)
	jsr	(L006f5e)
	addq.l	#4,a7
	move.l	(a7)+,d0
	bra	L00700a

L006ffe:
	move.l	a6,-(a7)
	move.l	d0,-(a7)
	jsr	(L007224)
	addq.l	#8,a7
L00700a:
	movem.l	(a7)+,a6
	rts

L007010:
	pea.l	(L0070b4)
	jsr	(L0072e8)
	addq.l	#4,a7
	tst.l	d0
	bne	L007028
	move.l	#L0070b7,d0
L007028:
	movea.l	d0,a0
	movea.l	#L006772,a2
	movea.l	(a2)+,a1
	move.b	(a0)+,(a1)+
	move.b	(a0)+,(a1)+
	move.b	(a0)+,(a1)+
	clr.b	(a1)+
	bsr	L00706a
	move.l	d0,(L006786)
	movea.l	(a2),a1
	clr.l	(L006782)
	tst.b	(a0)
	beq	L007066
	move.b	(a0)+,(a1)+
	move.b	(a0)+,(a1)+
	move.b	(a0)+,(a1)+
	bsr	L00706a
	tst.l	d0
	bne	L007060
	move.l	#$00000e10,d0
L007060:
	move.l	d0,(L006782)
L007066:
	clr.b	(a1)
	rts

L00706a:
	clr.l	d2
	clr.l	d0
	move.b	(a0)+,d1
	cmpi.b	#$2d,d1			;'-'
	bne	L00707a
	moveq.l	#$01,d2
	move.b	(a0)+,d1
L00707a:
	cmpi.b	#$30,d1			;'0'
	bcs	L0070a6
	cmpi.b	#$3a,d1			;':'
	bcc	L0070a6
	andi.w	#$000f,d1
	move.w	d1,d0
	move.b	(a0)+,d1
	cmpi.b	#$30,d1			;'0'
	bcs	L0070a6
	cmpi.b	#$3a,d1			;':'
	bcc	L0070a6
	andi.w	#$000f,d1
	mulu.w	#$000a,d0
	add.w	d1,d0
	tst.b	(a0)+
L0070a6:
	mulu.w	#$0e10,d0
	tst.w	d2
	beq	L0070b0
	neg.l	d0
L0070b0:
	subq.l	#1,a0
	rts

L0070b4:
	.dc.b	$54,$5a,$00
L0070b7:
	.dc.b	'JST-9',$00,$00
L0070be:
	movem.l	($0004,a7),d0-d2
	movea.l	d1,a2
	movem.l	d1-d2,-(a7)
	move.w	d0,-(a7)
	jsr	(L0074cc)
	tst.w	d0
	beq	L0071b0
	movem.l	d0/a0,-(a7)
	btst.l	#$02,d0
	beq	L0070fe
	btst.l	#$0a,d0
	beq	L0070f4
	clr.l	d0
	move.b	(a0),d0
	jsr	(L007482)
	bra	L0070fe

L0070f4:
	clr.l	d0
	move.b	(a0),d0
	jsr	(L007490)
L0070fe:
	movem.l	(a7)+,d0/a0
	btst.l	#$0a,d0
	bne	L007180
	swap.w	d0
	btst.l	#$07,d0
	beq	L007116
	btst.l	#$05,d0
	bne	L007180
L007116:
	tst.l	d2
	ble	L007180
L00711a:
	movea.l	a2,a1
	tst.l	d2
	ble	L007192
	clr.l	d1
L007122:
	move.b	(a2)+,d0
	subq.l	#1,d2
	cmp.b	#$0a,d0
	beq	L007148
	addq.l	#1,d1
	cmp.b	#$1a,d0
	beq	L00713c
	tst.l	d2
	bgt	L007122
	moveq.l	#$ff,d2
	bra	L007148

L00713c:
	moveq.l	#$ff,d2
	move.w	(a0),d0
	btst.l	#$01,d0
	beq	L007148
	subq.l	#1,d1
L007148:
	tst.l	d1
	beq	L007160
	move.l	d1,($0006,a7)
	move.l	a1,($0002,a7)
	DOS	_WRITE
	tst.l	d0
	bmi	L00719e
	adda.l	d0,a1
	cmp.l	d1,d0
	bcs	L0071a6
L007160:
	tst.l	d2
	bmi	L007192
	moveq.l	#$02,d1
	move.l	d1,($0006,a7)
	move.l	#L0071c0,($0002,a7)
	DOS	_WRITE
	tst.l	d0
	bmi	L00719e
	cmp.l	d1,d0
	bcs	L0071a6
	addq.l	#1,a1
	bra	L00711a

L007180:
	movea.l	a2,a1
	tst.l	d2
	bmi	L0071a6
	DOS	_WRITE
	tst.l	d0
	bmi	L00719e
	adda.l	d0,a1
	cmp.l	d2,d0
	bcs	L0071a6
L007192:
	lea.l	($000a,a7),a7
	move.l	a1,d0
	sub.l	($0008,a7),d0
	rts

L00719e:
	cmp.l	#$ffffffe9,d0
	bne	L0071b2
L0071a6:
	move.l	(a0),d1
	bset.l	#$0f,d1
	move.l	d1,(a0)
	bra	L007192

L0071b0:
	moveq.l	#$fa,d0
L0071b2:
	lea.l	($000a,a7),a7
	jsr	(L0071c2)
	moveq.l	#$ff,d0
	rts

L0071c0:
	.dc.b	$0d,$0a
L0071c2:
	tst.l	d0
	bge	L007202
	move.l	d0,(L008eb2)
	rol.l	#8,d0
	cmp.b	#$81,d0
	beq	L007206
	cmp.b	#$82,d0
	beq	L007206
	ror.w	#8,d0
	neg.l	d0
	cmpi.l	#$00000020,d0
	bgt	L007200
	move.l	a0,-(a7)
	lea.l	(L00720a),a0
	move.b	(-$01,a0,d0.w),d0
	movea.l	(a7)+,a0
	andi.l	#$000000ff,d0
L0071fa:
	move.l	d0,(L008eae)
L007200:
	moveq.l	#$ff,d0
L007202:
	tst.l	d0
	rts

L007206:
	moveq.l	#$0c,d0
	bra	L0071fa

L00720a:
	.dc.b	$00,$02,$02,$18,$0d,$09,$00,$0c,$00,$00,$08,$11,$16,$00,$16,$0d
	.dc.b	$0d,$02,$0d,$0d,$0d,$0d,$1c,$1c,$16,$16
L007224:
	movem.l	d6-d7/a6,-(a7)
	movem.l	($0010,a7),d7/a6
	move.l	($000c,a6),d6
	clr.l	d2
	move.b	($0014,a6),d2
	btst.l	#$03,d6
	bne	L00728a
	btst.l	#$13,d6
	beq	L007266
	move.l	($0010,a6),-(a7)
	move.l	($0008,a6),-(a7)
	move.l	d2,-(a7)
	jsr	(L0070be)
	lea.l	($000c,a7),a7
	bclr.l	#$13,d6
	tst.l	d0
	bmi	L0072a8
	cmp.l	($0010,a6),d0
	bne	L0072a8
L007266:
	move.l	($0010,a6),d1
	subq.l	#1,d1
	move.l	d1,($0004,a6)
	movea.l	($0008,a6),a0
	move.b	d7,(a0)+
	move.l	a0,($0000.w,a6)
	bset.l	#$13,d6
L00727e:
	move.l	d7,d0
L007280:
	move.l	d6,($000c,a6)
	movem.l	(a7)+,d6-d7/a6
	rts

L00728a:
	move.b	d7,($0015,a6)
	move.l	#$00000001,-(a7)
	pea.l	($0015,a6)
	move.l	d2,-(a7)
	jsr	(L0070be)
	lea.l	($000c,a7),a7
	subq.l	#1,d0
	beq	L00727e
L0072a8:
	bset.l	#$06,d6
	moveq.l	#$ff,d0
	bra	L007280

L0072b0:
	move.l	d1,-(a7)
	movea.l	#L008b0c,a0
	moveq.l	#$27,d1			;'''
L0072ba:
	tst.l	($000c,a0)
	beq	L0072de
	adda.l	#$00000016,a0
	dbra	d1,L0072ba
	move.l	#$00000018,(L008eae)
	clr.l	(L008eb2)
	moveq.l	#$ff,d0
	bra	L0072e2

L0072de:
	moveq.l	#$27,d0			;'''
	sub.w	d1,d0
L0072e2:
	movem.l	(a7)+,d1
	rts

L0072e8:
	move.l	($0004,a7),d2
	movea.l	(L008ef4),a2
L0072f2:
	movea.l	d2,a0
	move.l	(a2)+,d0
	beq	L00730c
	movea.l	d0,a1
L0072fa:
	move.b	(a0)+,d0
	beq	L007310
	move.b	(a1)+,d1
	beq	L0072f2
	cmp.b	d1,d0
	bne	L0072f2
	cmp.b	#$3d,d0			;'='
	bne	L0072fa
L00730c:
	clr.l	d0
	rts

L007310:
	move.b	(a1)+,d0
	beq	L0072f2
	cmp.b	#$3d,d0			;'='
	bne	L0072f2
	move.l	a1,d0
	rts

L00731e:
	movem.l	($0004,a7),d1-d2
	movea.l	d1,a2
	btst.l	#$02,d2
	bne	L0073ca
	btst.l	#$00,d2
	bne	L0073be
	btst.l	#$01,d2
	bne	L007398
	btst.l	#$08,d2
	bne	L0073b8
	btst.l	#$0c,d2
	bne	L007398
	btst.l	#$0e,d2
	bne	L00735a
	bra	L00742e

L007352:
	btst.l	#$0e,d2
	beq	L007430
L00735a:
	bsr	L00743a
	bmi	L007376
	bsr	L00745c
	btst.l	#$0d,d2
	bne	L00742a
	bsr	L00743e
	bmi	L007430
	bra	L00739e

L007376:
	move.l	($000c,a7),d0
	moveq.l	#$20,d1			;' '
	cmp.l	#$00000000,d0
	bne	L007388
	bset.l	#$00,d1
L007388:
	bsr	L007450
	bmi	L007430
	move.l	d0,-(a7)
	bsr	L007464
	bra	L0073fc

L007398:
	bsr	L00743e
L00739c:
	bmi	L007352
L00739e:
	move.l	d0,-(a7)
	bsr	L007464
	btst.l	#$07,d1
	bne	L0073fc
	btst.l	#$0c,d2
	beq	L0073fc
	move.l	(a7),d0
	bsr	L007470
	bra	L0073fc

L0073b8:
	bsr	L007442
	bra	L00739c

L0073be:
	bsr	L00743a
	bmi	L007352
	move.l	d0,-(a7)
	bsr	L007464
	bra	L0073fc

L0073ca:
	bsr	L007442
	bmi	L007352
	move.l	d0,-(a7)
	bsr	L007464
	btst.l	#$07,d1
	bne	L0073fc
	btst.l	#$0b,d2
	bne	L0073f6
	btst.l	#$0a,d2
	bne	L0073ee
	move.l	(L009084),d0
	beq	L0073f6
L0073ee:
	move.l	(a7),d0
	bsr	L007482
	bra	L0073fc

L0073f6:
	move.l	(a7),d0
	bsr	L007490
L0073fc:
	btst.l	#$0b,d2
	bne	L00741a
	btst.l	#$0a,d2
	bne	L00741a
	move.l	(L009084),d0
	beq	L007416
	bset.l	#$0a,d2
	bra	L00741a

L007416:
	bset.l	#$0b,d2
L00741a:
	move.l	(a7),d0
	bsr	L0074cc
	move.l	(a7)+,d0
	move.b	d0,(a0)+
	move.b	d1,(a0)+
	move.w	d2,(a0)
	rts

L00742a:
	moveq.l	#$ea,d0
	bra	L007430

L00742e:
	moveq.l	#$f4,d0
L007430:
	jsr	(L0071c2)
	moveq.l	#$ff,d0
	rts

L00743a:
	clr.l	d0
	bra	L007444

L00743e:
	moveq.l	#$01,d0
	bra	L007444

L007442:
	moveq.l	#$02,d0
L007444:
	move.w	d0,-(a7)
	move.l	a2,-(a7)
	DOS	_OPEN
	addq.l	#6,a7
	tst.l	d0
	rts

L007450:
	move.w	d1,-(a7)
	move.l	a2,-(a7)
	DOS	_CREATE
	addq.l	#6,a7
	tst.l	d0
	rts

L00745c:
	move.w	d0,-(a7)
	DOS	_CLOSE
	addq.l	#2,a7
	rts

L007464:
	move.w	d0,-(a7)
	clr.w	-(a7)
	DOS	_IOCTRL
	addq.l	#4,a7
	move.l	d0,d1
	rts

L007470:
	clr.l	-(a7)
	pea.l	(L007470)
	move.w	d0,-(a7)
	DOS	_WRITE
	lea.l	($000a,a7),a7
	rts

L007482:
	move.w	#$0002,-(a7)
	clr.l	-(a7)
	move.w	d0,-(a7)
	DOS	_SEEK
	addq.l	#8,a7
	rts

L007490:
	clr.w	-(a7)
	movea.l	a7,a0
	clr.w	-(a7)
	move.w	#$0002,-(a7)
	move.l	#$ffffffff,-(a7)
	move.w	d0,-(a7)
	DOS	_SEEK
	moveq.l	#$01,d0
	move.l	d0,($0006,a7)
	move.l	a0,($0002,a7)
	DOS	_READ
	cmpi.b	#$1a,(a0)
	bne	L0074c6
	move.w	#$0002,($0006,a7)
	move.l	#$ffffffff,($0002,a7)
	DOS	_SEEK
L0074c6:
	lea.l	($000c,a7),a7
	rts

L0074cc:
	asl.l	#2,d0
	lea.l	(L008f04),a0
	adda.l	d0,a0
	move.l	(a0),d0
	rts


	.data

L0074da:
	.dc.l	L007726
	.dc.l	L007741
	.dc.l	L00775e
	.dc.l	L007773
	.dc.l	L00778c
	.dc.l	L0077a5
	.dc.l	L0077a6
	.dc.l	L0077a7
	.dc.l	L0077a8
	.dc.l	L0077a9
	.dc.l	L0077ce
	.dc.l	L0077e9
L00750a:
	.dc.b	'使用法:BACKUP  source:[path]  destination:  [switch]',$0a
	.dc.b	$09,'source:',$09,$09,'バックアップ元のドライブ',$0a
	.dc.b	$09,'path',$09,$09,'パス名（デフォルトは \*.*）',$0a
	.dc.b	$09,'destination:',$09,'バックアップ先のドライブ（カレントディレクトリに作成）',$0a
	.dc.b	$09,'/s',$09,$09,'サブディレクトリもバックアップ',$0a
	.dc.b	$09,'/a',$09,$09,'アペンドモード',$0a
	.dc.b	$09,'/dYY-MM-DD',$09,'指定日付以降をバックアップ（例 /d88-06-24）',$0a
	.dc.b	$09,'/tHH:MM:SS',$09,'指定時刻以降をバックアップ（例 /t12:05:30 秒は省略可）',$0a
	.dc.b	$0a
	.dc.b	'コマンド例..............BACKUP a:\bin\*.x b: /s /d88-01-01',$0a,$00
L0076ba:
	.dc.b	'*.*',$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
L0076da:
	.dc.b	'Ver. 07-Mar-1989',$00,$00,$00,$00,$00,$00,$00,$00
L0076f2:
	.dc.l	$00000000
L0076f6:
	.dc.l	$00000000
L0076fa:
	.dc.l	$00000000
L0076fe:
	.dc.l	$00000000
L007702:
	.dc.l	$00000000
L007706:
	.dc.b	$00,$0a,$00,$00,$00,$08,$00,$00,$00,$06,$00,$2d,$00,$04,$00,$00
	.dc.b	$00,$02,$00,$00,$00,$01,$00,$00
L00771e:
	.dc.w	$fe00
L007720:
	.dc.w	$fe00
L007722:
	.dc.w	$f800
L007724:
	.dc.w	$f800
L007726:
	.dc.b	'バックアップは完了しました',$00
L007741:
	.dc.b	'ファイルをオープンできません',$00
L00775e:
	.dc.b	'ファイルが作れません',$00
L007773:
	.dc.b	'ファイルを読み込めません',$00
L00778c:
	.dc.b	'ファイルに書き出せません',$00
L0077a5:
	.dc.b	$00
L0077a6:
	.dc.b	$00
L0077a7:
	.dc.b	$00
L0077a8:
	.dc.b	$00
L0077a9:
	.dc.b	'このディスクでこれ以上処理できません',$00
L0077ce:
	.dc.b	'ユーティリティを終了します',$00
L0077e9:
	.dc.b	$00
L0077ea:
	.dc.b	'処理に必要なメモリが足りません！',$0a,$00
L00780c:
	.dc.b	'無効なドライブ名を指定しました',$0a,$00
L00782c:
	.dc.b	'パラメータの指定が違います',$0a
	.dc.b	$0a,$00
L007849:
	.dc.b	'%s',$0a,$00,$00
L00784e:
	.dc.b	'*.*',$00
L007852:
	.dc.b	'*.*',$00
L007856:
	.dc.b	'%2d:%2d:%2d',$00
L007862:
	.dc.b	'%2d-%2d-%2d',$00
L00786e:
	.dc.b	'%4d-%2d-%2d',$00
L00787a:
	.dc.l	L0078eb
	.dc.l	L00790a
	.dc.l	L00792b
	.dc.l	L007946
	.dc.l	L007959
L00788e:
	.dc.l	L00795a
	.dc.l	L00796b
	.dc.l	L00797a
	.dc.l	L007989
	.dc.l	L00799c
L0078a2:
	.dc.b	'ＢＡＣＫＵＰ ｆｏｒ Ｘ６８０００  Version 1.10  Copyright 1988,89  SHARP',$00
L0078eb:
	.dc.b	'サブディレクトリもバックアップ',$00
L00790a:
	.dc.b	'指定ディレクトリだけバックアップ',$00
L00792b:
	.dc.b	'ファイル単位のバックアップ',$00
L007946:
	.dc.b	'ユーティリティ終了',$00
L007959:
	.dc.b	$00
L00795a:
	.dc.b	'バックアップ開始',$00
L00796b:
	.dc.b	'日付条件の設定',$00
L00797a:
	.dc.b	'時刻条件の設定',$00
L007989:
	.dc.b	'ユーティリティ終了',$00
L00799c:
	.dc.b	$00
L00799d:
	.dc.b	'バックアップの種類を選択してください',$0d,$0a,$00
L0079c4:
	.dc.b	'バックアップ元のドライブ名を指定してください',$0d,$0a,$00
L0079f3:
	.dc.b	'バックアップ先のドライブ名を指定してください',$0d,$0a,$00
L007a22:
	.dc.b	'バックアップの条件設定があれば指定してください',$0d,$0a,$00
L007a53:
	.dc.b	'開始日付 (YY-MM-DD ～) : ',$00
L007a6d:
	.dc.b	'終了日付 (～ YY-MM-DD) : ',$00
L007a87:
	.dc.b	'開始時刻 (HH:MM:SS ～) : ',$00
L007aa1:
	.dc.b	'終了時刻 (～ HH:MM:SS) : ',$00
L007abb:
	.dc.b	'*.*',$00
L007abf:
	.dc.b	$03,$20,$04,$00
L007ac3:
	.dc.b	'（選択） ',$00
L007acd:
	.dc.b	$01,$00
L007acf:
	.dc.b	'（確定） ',$00
L007ad9:
	.dc.b	$05,$00
L007adb:
	.dc.b	'（実行） ',$00
L007ae5:
	.dc.b	$02,$00
L007ae7:
	.dc.b	'（前に戻る）',$00
L007af4:
	.dc.b	'（終了）',$00,$00
L007afe:
	.dc.l	$00000027
L007b02:
	.dc.b	'\*.*',$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
L007b1a:
	.dc.b	'\*.*',$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
L007b32:
	.dc.l	$00000000
L007b36:
	.dc.l	$00000000
L007b3a:
	.dc.b	'ディレクトリを検索しています',$00,$00
L007b58:
	.dc.b	'ファイルが存在しません  何かキーを押してください',$00,$00
L007b8a:
	.dc.b	'バックアップします、よろしいですか（Ｙ／Ｎ）',$00,$00
L007bb8:
	.dc.b	$2e,$00
L007bba:
	.dc.b	$2e,$2e,$00
L007bbd:
	.dc.b	$2e,$00
L007bbf:
	.dc.b	$2e,$2e,$00
L007bc2:
	.dc.b	'├─',$00
L007bc7:
	.dc.b	'│　',$00
L007bcc:
	.dc.b	'└─',$00
L007bd1:
	.dc.b	'　　',$00
L007bd6:
	.dc.b	'%s%s%s',$00
L007bdd:
	.dc.b	$5c,$00
L007bdf:
	.dc.b	$5c,$00
L007be1:
	.dc.b	$25,$73,$00
L007be4:
	.dc.b	$00
L007be5:
	.dc.b	$41,$3a,$00
L007be8:
	.dc.b	'A:\',$00
L007bec:
	.dc.b	$00
L007bed:
	.dc.b	'ディレクトリ名を指定してください',$0d,$0a,$00
L007c10:
	.dc.b	'しばらくお待ちください',$00
L007c27:
	.dc.b	'\*.*',$00
L007c2c:
	.dc.b	$25,$73,$00
L007c2f:
	.dc.b	$00
L007c30:
	.dc.b	'バックアップしたいファイル名を指定してください',$0d,$0a,$00
L007c61:
	.dc.b	'%s',$0d,$0a,$00
L007c66:
	.dc.b	$25,$73,$00,$00
L007c6a:
	.dc.b	'バックアップファイルが既に存在しています',$00,$00
L007c94:
	.dc.b	'ディスクに空きエリアがありません',$00,$00
L007cb6:
	.dc.b	'最後のバックアップディスクではありません',$00,$00
L007ce0:
	.dc.b	'新しいディスクと交換してください',$00,$00
L007d02:
	.dc.b	'BACKUP'
L007d08:
	.dc.b	'??.FIL',$00,$00,$00,$00
L007d12:
	.dc.b	'ＥＳＣ　で中止します',$00,$00
L007d28:
	.dc.b	$02,$81,$40,$82,$c5,$92,$86,$8e,$7e,$82,$b5,$82,$dc,$82,$b7,$00
L007d38:
	.dc.b	'%2.2d.FIL',$00
L007d42:
	.dc.b	'%2.2d.FIL',$00
L007d4c:
	.dc.b	'??.FIL',$00
L007d53:
	.dc.b	'%s',$0a,$00
L007d57:
	.dc.b	' %s',$00
L007d5b:
	.dc.b	'%s  ',$00
L007d60:
	.dc.b	' %s',$00
L007d64:
	.dc.l	$00000000
L007d68:
	.dc.b	$5c,$00
L007d6a:
	.dc.b	$5c,$00
L007d6c:
	.dc.b	$5c,$00
L007d6e:
	.dc.b	'*.*',$00
L007d72:
	.dc.b	$2e,$00
L007d74:
	.dc.b	$2e,$2e,$00
L007d77:
	.dc.b	$2e,$00
L007d79:
	.dc.b	$2e,$2e,$00
L007d7c:
	.dc.b	$ff,$ff,$00,$00
L007d80:
	.dc.b	$ff,$fe,$00,$00
L007d84:
	.dc.b	$ff,$fd,$00,$00
L007d88:
	.dc.b	$ff,$01,$00,$00
L007d8c:
	.dc.l	$00000000
L007d90:
	.dc.l	$00000001
L007d94:
	.dc.b	'%s',$0d,$0a,$00
L007d99:
	.dc.b	'%s',$0a,$00,$00
L007d9e:
	.dc.l	$00000000
L007da2:
	.dc.l	L007e0a
	.dc.l	L007e1a
	.dc.l	L007e2a
	.dc.l	L007e3a
	.dc.l	L007e4a
	.dc.l	L007e5a
	.dc.l	L007e6a
	.dc.l	L007e7a
	.dc.l	L007e8a
	.dc.l	L007e9a
	.dc.l	L007eaa
	.dc.l	L007eba
	.dc.l	L007eca
	.dc.l	L007eda
	.dc.l	L007eea
	.dc.l	L007efa
	.dc.l	L007f0a
	.dc.l	L007f1a
	.dc.l	L007f2a
	.dc.l	L007f3a
	.dc.l	L007f4a
	.dc.l	L007f5a
	.dc.l	L007f6a
	.dc.l	L007f7a
	.dc.l	L007f8a
	.dc.l	L007f9a
L007e0a:
	.dc.b	'Aドライブ　Ａ：',$00
L007e1a:
	.dc.b	'Bドライブ　Ｂ：',$00
L007e2a:
	.dc.b	'Cドライブ　Ｃ：',$00
L007e3a:
	.dc.b	'Dドライブ　Ｄ：',$00
L007e4a:
	.dc.b	'Eドライブ　Ｅ：',$00
L007e5a:
	.dc.b	'Fドライブ　Ｆ：',$00
L007e6a:
	.dc.b	'Gドライブ　Ｇ：',$00
L007e7a:
	.dc.b	'Hドライブ　Ｈ：',$00
L007e8a:
	.dc.b	'Iドライブ　Ｉ：',$00
L007e9a:
	.dc.b	'Jドライブ　Ｊ：',$00
L007eaa:
	.dc.b	'Kドライブ　Ｋ：',$00
L007eba:
	.dc.b	'Lドライブ　Ｌ：',$00
L007eca:
	.dc.b	'Mドライブ　Ｍ：',$00
L007eda:
	.dc.b	'Nドライブ　Ｎ：',$00
L007eea:
	.dc.b	'Oドライブ　Ｏ：',$00
L007efa:
	.dc.b	'Pドライブ　Ｐ：',$00
L007f0a:
	.dc.b	'Qドライブ　Ｑ：',$00
L007f1a:
	.dc.b	'Rドライブ　Ｒ：',$00
L007f2a:
	.dc.b	'Sドライブ　Ｓ：',$00
L007f3a:
	.dc.b	'Tドライブ　Ｔ：',$00
L007f4a:
	.dc.b	'Uドライブ　Ｕ：',$00
L007f5a:
	.dc.b	'Vドライブ　Ｖ：',$00
L007f6a:
	.dc.b	'Wドライブ　Ｗ：',$00
L007f7a:
	.dc.b	'Xドライブ　Ｘ：',$00
L007f8a:
	.dc.b	'Yドライブ　Ｙ：',$00
L007f9a:
	.dc.b	'Zドライブ　Ｚ：',$00
L007faa:
	.dc.b	$00,$00
L007fac:
	.dc.l	$00000001
L007fb0:
	.dc.b	$13,$00,$00,$00,$00,$00
L007fb6:
	.dc.b	$04,$00,$00,$00,$00,$00
L007fbc:
	.dc.b	$1a,$00
L007fbe:
	.dc.b	'残念ながらメモリ不足でシステムにエラーが発生しました',$0a,$00
L007ff4:
	.dc.b	'ユーティリティを終了します',$0a,$00
L008010:
	.dc.b	'%s',$0a,$00
L008014:
	.dc.b	' %s',$00
L008018:
	.dc.b	'何かキーを押してください',$00
L008031:
	.dc.b	'パラメータの指定が違います',$00

	.bss

L00804c:
	.ds.b	1496
L008624:
	.ds.l	1
L008628:
	.ds.l	1
L00862c:
	.ds.l	1
L008630:
	.ds.b	1
L008631:
	.ds.b	1
L008632:
	.ds.b	254
L008730:
	.ds.b	256
L008830:
	.ds.l	1
L008834:
	.ds.l	1
L008838:
	.ds.l	1
L00883c:
	.ds.l	1
L008840:
	.ds.l	1
L008844:
	.ds.l	1
L008848:
	.ds.b	108
L0088b4:
	.ds.b	72
L0088fc:
	.ds.b	2
L0088fe:
	.ds.l	1
L008902:
	.ds.l	1
L008906:
	.ds.l	1
L00890a:
	.ds.l	1
L00890e:
	.ds.l	1
L008912:
	.ds.l	1
L008916:
	.ds.l	1
L00891a:
	.ds.l	1
L00891e:
	.ds.b	200
L0089e6:
	.ds.l	1
L0089ea:
	.ds.w	1
L0089ec:
	.ds.l	1
L0089f0:
	.ds.l	1
L0089f4:
	.ds.l	1
L0089f8:
	.ds.b	2
L0089fa:
	.ds.b	254
L008af8:
	.ds.l	1
L008afc:
	.ds.l	1
L008b00:
	.ds.l	1
L008b04:
	.ds.l	1
L008b08:
	.ds.l	1
L008b0c:
	.ds.b	22
L008b22:
	.ds.b	858
L008e7c:
	.ds.l	1
L008e80:
	.ds.l	1
L008e84:
	.ds.l	1
L008e88:
	.ds.l	1
L008e8c:
	.ds.l	1
L008e90:
	.ds.b	26
L008eaa:
	.ds.l	1
L008eae:
	.ds.l	1
L008eb2:
	.ds.l	1
L008eb6:
	.ds.w	1
L008eb8:
	.ds.l	1
L008ebc:
	.ds.l	1
L008ec0:
	.ds.l	1
L008ec4:
	.ds.l	1
L008ec8:
	.ds.l	1
L008ecc:
	.ds.l	1
L008ed0:
	.ds.l	1
L008ed4:
	.ds.l	1
L008ed8:
	.ds.l	1
L008edc:
	.ds.l	1
L008ee0:
	.ds.l	1
L008ee4:
	.ds.l	1
L008ee8:
	.ds.l	1
L008eec:
	.ds.l	1
L008ef0:
	.ds.l	1
L008ef4:
	.ds.l	1
L008ef8:
	.ds.l	1
L008efc:
	.ds.l	1
L008f00:
	.ds.l	1
L008f04:
	.ds.b	384
L009084:
	.ds.l	1
L009088:
	.ds.b	512
L009288:
	.ds.b	160
L009328:

	.end	L006388
