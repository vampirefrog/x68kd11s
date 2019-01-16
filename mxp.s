;=============================================
;  Filename mxp.x
;  Time Stamp Mon Dec 17 21:09:21 2018
;
;  Base address 000000
;  Exec address 000000
;  Text size    000780 byte(s)
;  Data size    00021c byte(s)
;  Bss  size    004204 byte(s)
;  124 Labels
;  Code Generate date Wed Jan 16 19:02:41 2019
;  Commandline dis  -b2 -h -m68000 --sp -q1 -B -M -p -o120 -gmxp.lab --overwrite mxp.x mxp.s
;          DIS version 3.16
;=============================================

	.include	inc/doscall.mac
	.include	inc/iocscall.mac
	.include	inc/fefunc.mac

	.cpu	68000

	.text

L000000:
	lea.l	(L004ba0,pc),sp
	lea.l	($0010,a0),a0
	suba.l	a0,a1
	move.l	a1,-(sp)
	move.l	a0,-(sp)
	DOS	_SETBLOCK
	addq.l	#8,sp
	pea.l	($0001,a2)
	bsr.w	L00043e
	clr.w	-(sp)
	DOS	_EXIT2

L00001e:
	movem.l	($0004,sp),d0-d1/a1
	trap	#4
	rts

L000028:
	move.l	($0004,sp),-(sp)
	DOS	_PRINT
	move.w	#$ffff,(sp)
	DOS	_EXIT2

L000034:
	link.w	a6,#-$0100
	move.l	#$00000008,-(sp)
	pea.l	(-$0100,a6)
	move.l	#$00000024,-(sp)
	bsr.w	L000600
	addq.l	#4,sp
	subq.l	#8,d0
	move.l	d0,-(sp)
	bsr.w	L0005da
	lea.l	($000c,sp),sp
	move.l	#$00000005,-(sp)
	pea.l	(L000896,pc)
	pea.l	(-$0100,a6)
	bsr.w	L0006fe
	lea.l	($000c,sp),sp
	tst.l	d0
	beq.s	L00007c
	pea.l	(L00089c,pc)
	bsr.s	L000028
	addq.l	#4,sp
L00007c:
	move.l	#$00000003,-(sp)
	pea.l	(L0008bd,pc)
	pea.l	(-$00fb,a6)
	bsr.w	L0006fe
	lea.l	($000c,sp),sp
	tst.l	d0
	bge.s	L00009e
	pea.l	(L0008c1,pc)
	bsr.s	L000028
	addq.l	#4,sp
L00009e:
	unlk	a6
	rts

L0000a2:
	link.w	a6,#-$0004
	movem.l	a3-a5,-(sp)
	movea.l	($0008,a6),a5
	movea.l	($000c,a6),a4
	movea.l	($0010,a6),a3
	move.l	a4,d0
	beq.s	L0000c0
	move.l	a4,(L00099c)
L0000c0:
	move.l	(L00099c,pc),d0
	movea.l	d0,a0
	moveq.l	#$00,d0
	move.b	(a0),d0
	tst.l	d0
	bne.s	L0000de
L0000ce:
	move.l	(L00099c,pc),d0
	movea.l	d0,a0
	moveq.l	#$00,d0
	move.b	(a0),d0
	tst.l	d0
	beq.s	L0000fe
	bra.s	L00012e

L0000de:
	move.l	(L00099c,pc),d0
	movea.l	d0,a0
	moveq.l	#$00,d0
	move.b	(a0),d0
	move.l	d0,-(sp)
	move.l	a3,-(sp)
	bsr.w	L0006ac
	addq.l	#8,sp
	tst.l	d0
	beq.s	L0000ce
	addq.l	#1,(L00099c)
	bra.s	L0000c0

L0000fe:
	moveq.l	#$01,d0
L000100:
	movem.l	(sp)+,a3-a5
	unlk	a6
	rts

L000108:
	move.l	(L00099c,pc),d0
	movea.l	d0,a0
	moveq.l	#$00,d0
	move.b	(a0),d0
	move.l	d0,-(sp)
	move.l	a3,-(sp)
	bsr.w	L0006ac
	addq.l	#8,sp
	tst.l	d0
	bne.s	L00013c
	move.l	(L00099c,pc),d0
	movea.l	d0,a0
	move.b	(a0),(a5)+
	addq.l	#1,(L00099c)
L00012e:
	move.l	(L00099c,pc),d0
	movea.l	d0,a0
	moveq.l	#$00,d0
	move.b	(a0),d0
	tst.l	d0
	bne.s	L000108
L00013c:
	moveq.l	#$00,d0
	move.b	d0,(a5)
	andi.l	#$000000ff,d0
	bra.s	L000100

L000148:
	link.w	a6,#-$0200
	movem.l	d7/a4-a5,-(sp)
	movea.l	($0008,a6),a5
	move.l	a5,-(sp)
	pea.l	(-$0100,a6)
	bsr.w	L0006de
	addq.l	#8,sp
	clr.l	-(sp)
	pea.l	(-$0100,a6)
	bsr.w	L00060a
	addq.l	#8,sp
	move.l	d0,d7
	bge.w	L0001fc
	pea.l	(-$0100,a6)
	clr.l	-(sp)
	pea.l	(L0008e9,pc)
	bsr.w	L000652
	lea.l	($000c,sp),sp
	tst.l	d0
	blt.s	L0001dc
	pea.l	(L0008ed,pc)
	pea.l	(-$0100,a6)
L000190:
	bsr.w	L000726
	addq.l	#8,sp
	movea.l	d0,a4
	bra.s	L0001d8

L00019a:
	move.l	a4,-(sp)
	pea.l	(-$0200,a6)
	bsr.w	L0006de
	addq.l	#8,sp
	pea.l	(L0008f1,pc)
	pea.l	(-$0200,a6)
	bsr.w	L000698
	addq.l	#8,sp
	move.l	a5,-(sp)
	pea.l	(-$0200,a6)
	bsr.w	L000698
	addq.l	#8,sp
	clr.l	-(sp)
	pea.l	(-$0200,a6)
	bsr.w	L00060a
	addq.l	#8,sp
	move.l	d0,d7
	bge.s	L0001dc
	pea.l	(L0008ef,pc)
	clr.l	-(sp)
	bra.s	L000190

L0001d8:
	move.l	a4,d0
	bne.s	L00019a
L0001dc:
	move.l	d7,d0
	bge.s	L0001fc
	pea.l	(L0008f3,pc)
	bsr.w	L0005ec
	addq.l	#4,sp
	move.l	a5,-(sp)
	bsr.w	L0005ec
	addq.l	#4,sp
	pea.l	(L0008f6,pc)
	bsr.w	L000028
	addq.l	#4,sp
L0001fc:
	move.l	d7,d0
	movem.l	(sp)+,d7/a4-a5
	unlk	a6
	rts

L000206:
	link.w	a6,#-$0004
	move.l	#$00000002,-(sp)
	clr.l	-(sp)
	move.l	($0008,a6),-(sp)
	bsr.w	L00062c
	lea.l	($000c,sp),sp
	move.l	d0,(-$0004,a6)
	clr.l	-(sp)
	clr.l	-(sp)
	move.l	($0008,a6),-(sp)
	bsr.w	L00062c
	lea.l	($000c,sp),sp
	move.l	(-$0004,a6),d0
	unlk	a6
	rts

L00023a:
	link.w	a6,#$0000
	movem.l	d4-d7/a5,-(sp)
	move.l	($0008,a6),-(sp)
	bsr.w	L000148
	addq.l	#4,sp
	move.l	d0,d5
	move.l	d0,-(sp)
	bsr.s	L000206
	addq.l	#4,sp
	move.l	d0,d6
	lea.l	(L0009a0,pc),a5
	bra.s	L000262

L00025c:
	move.l	d7,d0
	move.b	d0,(a5)+
	subq.l	#1,d6
L000262:
	move.l	d5,-(sp)
	bsr.w	L0005f6
	addq.l	#4,sp
	move.l	d0,d7
	cmp.l	#$0000000d,d0
	bne.s	L00025c
	move.l	d5,-(sp)
	bsr.w	L0005f6
	addq.l	#4,sp
	move.l	d5,-(sp)
	bsr.w	L0005f6
	addq.l	#4,sp
	clr.b	(a5)
	subq.l	#4,d6
	lea.l	(L000aa0,pc),a5
	bra.s	L000290

L00028e:
	subq.l	#1,d6
L000290:
	move.l	d5,-(sp)
	bsr.w	L0005f6
	addq.l	#4,sp
	move.l	a5,d1
	addq.l	#1,a5
	movea.l	d1,a1
	move.b	d0,(a1)
	bne.s	L00028e
	pea.l	(L0009a0,pc)
	bsr.w	L0006ec
	addq.l	#4,sp
	move.l	d0,d7
	add.l	#$00000009,d7
	moveq.l	#$fe,d0
	and.l	d0,d7
	move.l	d6,d0
	add.l	d7,d0
	move.l	d0,-(sp)
	bsr.w	L00063e
	addq.l	#4,sp
	movea.l	d0,a5
	move.l	d0,d4
	bgt.s	L0002d4
	pea.l	(L000826,pc)
	bsr.w	L000028
	addq.l	#4,sp
L0002d4:
	clr.w	(a5)
	moveq.l	#$00,d0
	move.b	(L000aa0,pc),d0
	tst.l	d0
	beq.s	L0002e4
	moveq.l	#$00,d0
	bra.s	L0002e6

L0002e4:
	moveq.l	#$ff,d0
L0002e6:
	move.w	d0,($0002,a5)
	move.l	d7,d0
	move.w	d0,($0004,a5)
	moveq.l	#$08,d0
	move.w	d0,($0006,a5)
	pea.l	(L0009a0,pc)
	move.l	a5,-(sp)
	addq.l	#8,(sp)
	bsr.w	L0006de
	addq.l	#8,sp
	move.l	d6,-(sp)
	move.l	a5,d0
	add.l	d7,d0
	move.l	d0,-(sp)
	move.l	d5,-(sp)
	bsr.w	L000618
	lea.l	($000c,sp),sp
	cmp.l	d6,d0
	bge.s	L000324
	pea.l	(L000808,pc)
	bsr.w	L000028
	addq.l	#4,sp
L000324:
	move.l	a5,-(sp)
	move.l	d7,d0
	add.l	d6,d0
	move.l	d0,-(sp)
	move.l	#$00000002,-(sp)
	bsr.w	L00001e
	lea.l	($000c,sp),sp
	tst.l	d0
	beq.s	L000348
	pea.l	(L00090c,pc)
	bsr.w	L000028
	addq.l	#4,sp
L000348:
	move.l	a5,-(sp)
	bsr.w	L000648
	addq.l	#4,sp
	movem.l	(sp)+,d4-d7/a5
	unlk	a6
	rts

L000358:
	link.w	a6,#$0000
	movem.l	d4-d7/a5,-(sp)
	clr.l	-(sp)
	move.l	#$00000009,-(sp)
	bsr.w	L00001e
	addq.l	#8,sp
	movea.l	d0,a5
	move.l	d0,d4
	beq.s	L000386
	move.l	($0008,a6),-(sp)
	move.l	a5,-(sp)
	bsr.w	L0006c4
	addq.l	#8,sp
	tst.l	d0
	beq.w	L000436
L000386:
	move.l	($0008,a6),-(sp)
	bsr.w	L000148
	addq.l	#4,sp
	move.l	d0,d6
	move.l	d0,-(sp)
	bsr.w	L000206
	addq.l	#4,sp
	move.l	d0,d7
	move.l	($0008,a6),-(sp)
	bsr.w	L0006ec
	addq.l	#4,sp
	move.l	d0,d5
	add.l	#$00000009,d5
	moveq.l	#$fe,d0
	and.l	d0,d5
	move.l	d7,d0
	add.l	d5,d0
	move.l	d0,-(sp)
	bsr.w	L00063e
	addq.l	#4,sp
	movea.l	d0,a5
	move.l	d0,d4
	bge.s	L0003ce
	pea.l	(L000826,pc)
	bsr.w	L000028
	addq.l	#4,sp
L0003ce:
	clr.l	(a5)
	move.l	d5,d0
	move.w	d0,($0004,a5)
	moveq.l	#$08,d0
	move.w	d0,($0006,a5)
	move.l	($0008,a6),-(sp)
	move.l	a5,-(sp)
	addq.l	#8,(sp)
	bsr.w	L0006de
	addq.l	#8,sp
	move.l	d7,-(sp)
	move.l	a5,d0
	add.l	d5,d0
	move.l	d0,-(sp)
	move.l	d6,-(sp)
	bsr.w	L000618
	lea.l	($000c,sp),sp
	cmp.l	d7,d0
	bge.s	L00040a
	pea.l	(L000808,pc)
	bsr.w	L000028
	addq.l	#4,sp
L00040a:
	move.l	a5,-(sp)
	move.l	d5,d0
	add.l	d7,d0
	move.l	d0,-(sp)
	move.l	#$00000003,-(sp)
	bsr.w	L00001e
	lea.l	($000c,sp),sp
	tst.l	d0
	beq.s	L00042e
	pea.l	(L000933,pc)
	bsr.w	L000028
	addq.l	#4,sp
L00042e:
	move.l	a5,-(sp)
	bsr.w	L000648
	addq.l	#4,sp
L000436:
	movem.l	(sp)+,d4-d7/a5
	unlk	a6
	rts

L00043e:
	link.w	a6,#-$0200
	movem.l	d5-d7/a5,-(sp)
	moveq.l	#$00,d6
	moveq.l	#$00,d5
	clr.b	(L0009a0)
	clr.b	(L000aa0)
	pea.l	(L00095a,pc)
	bsr.w	L0005ec
	addq.l	#4,sp
	bsr.w	L000034
	move.l	($0008,a6),d0
	movea.l	d0,a0
	moveq.l	#$00,d0
	move.b	(a0),d0
	tst.l	d0
	bne.s	L00047c
	pea.l	(L000790,pc)
	bsr.w	L000028
	addq.l	#4,sp
L00047c:
	move.l	($0008,a6),d0
	movea.l	d0,a0
	cmpi.b	#$2d,(a0)		;'-'
	beq.s	L000494
	move.l	($0008,a6),d0
	movea.l	d0,a0
	cmpi.b	#$2f,(a0)		;'/'
	bne.s	L0004e6
L000494:
	addq.l	#1,($0008,a6)
	move.l	($0008,a6),d0
	movea.l	d0,a0
	moveq.l	#$00,d0
	move.b	(a0),d0
	or.l	#$00000020,d0
	cmpi.l	#$00000063,d0
	beq.s	L0004e2
	cmpi.l	#$00000065,d0
	beq.s	L0004da
	cmpi.l	#$00000070,d0
	beq.s	L0004d6
	cmpi.l	#$00000073,d0
	beq.s	L0004de
	pea.l	(L000790,pc)
	bsr.w	L000028
	addq.l	#4,sp
L0004d2:
	bra.w	L000584

L0004d6:
	moveq.l	#$04,d7
	bra.s	L0004d2

L0004da:
	moveq.l	#$05,d7
	bra.s	L0004d2

L0004de:
	moveq.l	#$06,d7
	bra.s	L0004d2

L0004e2:
	moveq.l	#$07,d7
	bra.s	L0004d2

L0004e6:
	pea.l	(L000984,pc)
	move.l	($0008,a6),-(sp)
	pea.l	(-$0100,a6)
	bsr.w	L0000a2
	lea.l	($000c,sp),sp
	tst.l	d0
	bne.w	L000582
	pea.l	(-$0100,a6)
	pea.l	(-$0200,a6)
	bsr.w	L000666
	addq.l	#8,sp
	tst.l	d0
	bne.s	L000520
	pea.l	(L000987,pc)
	pea.l	(-$0100,a6)
	bsr.w	L000698
	addq.l	#8,sp
L000520:
	pea.l	(-$0100,a6)
	bsr.w	L00023a
	addq.l	#4,sp
	pea.l	(L00098c,pc)
	clr.l	-(sp)
	pea.l	(-$0100,a6)
	bsr.w	L0000a2
	lea.l	($000c,sp),sp
	tst.l	d0
	bne.s	L00054e
	pea.l	(-$0100,a6)
	pea.l	(L000aa0,pc)
	bsr.w	L0006de
	addq.l	#8,sp
L00054e:
	moveq.l	#$00,d0
	move.b	(L000aa0,pc),d0
	tst.l	d0
	beq.s	L000582
	pea.l	(L000aa0,pc)
	pea.l	(-$0200,a6)
	bsr.w	L000666
	addq.l	#8,sp
	tst.l	d0
	bne.s	L000578
	pea.l	(L00098f,pc)
	pea.l	(L000aa0,pc)
	bsr.w	L000698
	addq.l	#8,sp
L000578:
	pea.l	(L000aa0,pc)
	bsr.w	L000358
	addq.l	#4,sp
L000582:
	moveq.l	#$04,d7
L000584:
	pea.l	(L000994,pc)
	bsr.w	L0005ec
	addq.l	#4,sp
	moveq.l	#$00,d0
	move.b	(L0009a0,pc),d0
	tst.l	d0
	beq.s	L0005b6
	pea.l	(L000996,pc)
	bsr.w	L0005ec
	addq.l	#4,sp
	pea.l	(L0009a0,pc)
	bsr.w	L0005ec
	addq.l	#4,sp
	pea.l	(L000998,pc)
	bsr.w	L0005ec
	addq.l	#4,sp
L0005b6:
	move.l	d7,d0
	subq.l	#4,d0
	asl.l	#2,d0
	lea.l	(L000780,pc),a0
	adda.l	d0,a0
	move.l	(a0),-(sp)
	bsr.w	L0005ec
	addq.l	#4,sp
	move.l	d7,-(sp)
	bsr.w	L00001e
	addq.l	#4,sp
	movem.l	(sp)+,d5-d7/a5
	unlk	a6
	rts

L0005da:
	movea.l	($0004,sp),a1
	movea.l	($0008,sp),a2
	move.l	($000c,sp),d1
	IOCS	_B_MEMSTR
	rts

L0005ec:
	move.l	($0004,sp),-(sp)
	DOS	_PRINT
	addq.l	#4,sp
	rts

L0005f6:
	move.w	($0006,sp),-(sp)
	DOS	_FGETC
	addq.l	#2,sp
	rts

L000600:
	move.w	($0006,sp),-(sp)
	DOS	_INTVCG
	addq.l	#2,sp
	rts

L00060a:
	move.w	($000a,sp),-(sp)
	move.l	($0006,sp),-(sp)
	DOS	_OPEN
	addq.l	#6,sp
	rts

L000618:
	move.l	($000c,sp),-(sp)
	move.l	($000c,sp),-(sp)
	move.w	($000e,sp),-(sp)
	DOS	_READ
	lea.l	($000a,sp),sp
	rts

L00062c:
	move.w	($000e,sp),-(sp)
	move.l	($000a,sp),-(sp)
	move.w	($000c,sp),-(sp)
	DOS	_SEEK
	addq.l	#8,sp
	rts

L00063e:
	move.l	($0004,sp),-(sp)
	DOS	_MALLOC
	addq.l	#4,sp
	rts

L000648:
	move.l	($0004,sp),-(sp)
	DOS	_MFREE
	addq.l	#4,sp
	rts

L000652:
	move.l	($000c,sp),-(sp)
	move.l	($000c,sp),-(sp)
	move.l	($000c,sp),-(sp)
	DOS	_GETENV
	lea.l	($000c,sp),sp
	rts

L000666:
	lea.l	(-$0080,sp),sp
	move.l	sp,-(sp)
	move.l	($008c,sp),-(sp)
	DOS	_NAMECK
	addq.l	#8,sp
	movea.l	($0084,sp),a0
	tst.l	d0
	bmi.s	L00068e
	lea.l	($0056,sp),a1
	tst.b	(a1)+
	beq.s	L00068e
	moveq.l	#$ff,d0
L000686:
	addq.l	#1,d0
	move.b	(a1)+,(a0)+
	bne.s	L000686
	bra.s	L000692

L00068e:
	clr.b	(a0)
	clr.l	d0
L000692:
	lea.l	($0080,sp),sp
	rts

L000698:
	movem.l	($0004,sp),a0-a1
	move.l	a0,d0
L0006a0:
	tst.b	(a0)+
	bne.s	L0006a0
	subq.l	#1,a0
L0006a6:
	move.b	(a1)+,(a0)+
	bne.s	L0006a6
	rts

L0006ac:
	movem.l	($0004,sp),a0-a1
	move.l	a1,d0
L0006b4:
	cmp.b	(a0),d0
	beq.s	L0006c0
	tst.b	(a0)+
	bne.s	L0006b4
	clr.l	d0
	rts

L0006c0:
	move.l	a0,d0
	rts

L0006c4:
	movem.l	($0004,sp),a0-a1
	clr.l	d0
	clr.l	d1
L0006ce:
	move.b	(a0)+,d0
	move.b	(a1)+,d1
	beq.s	L0006da
	sub.l	d1,d0
	beq.s	L0006ce
	rts

L0006da:
	sub.l	d1,d0
	rts

L0006de:
	movem.l	($0004,sp),a0-a1
	move.l	a0,d0
L0006e6:
	move.b	(a1)+,(a0)+
	bne.s	L0006e6
	rts

L0006ec:
	movea.l	($0004,sp),a0
	move.l	a0,d0
L0006f2:
	tst.b	(a0)+
	bne.s	L0006f2
	subq.l	#1,a0
	exg.l	d0,a0
	sub.l	a0,d0
	rts

L0006fe:
	clr.l	d0
	movea.l	($0004,sp),a0
	movea.l	($0008,sp),a1
	move.l	($000c,sp),d2
	ble.s	L000724
	clr.l	d1
L000710:
	move.b	(a0)+,d0
	move.b	(a1)+,d1
	beq.s	L000722
	sub.l	d1,d0
	bne.s	L000724
	subq.l	#1,d2
	bne.s	L000710
	clr.l	d0
	bra.s	L000724

L000722:
	sub.l	d1,d0
L000724:
	rts

L000726:
	move.l	#$0000c000,d2
	move.l	($0004,sp),d0
	bne.s	L00073a
	move.l	(L00077c),d0
	beq.s	L00077a
L00073a:
	movea.l	($0008,sp),a1
	movea.l	a1,a2
	movea.l	d0,a0
L000742:
	movea.l	a2,a1
	move.b	(a0)+,d1
	beq.s	L00076c
L000748:
	cmp.b	(a1),d1
	beq.s	L00075c
	tst.b	(a1)+
	bne.s	L000748
	bclr.l	#$0e,d2
	beq.s	L000742
	move.l	a0,d0
	subq.l	#1,d0
	bra.s	L000742

L00075c:
	andi.w	#$7fff,d2
	bne.s	L000742
	move.l	a0,(L00077c)
	clr.b	-(a0)
	rts

L00076c:
	clr.l	(L00077c)
	btst.l	#$0e,d2
	beq.s	L00077a
	clr.l	d0
L00077a:
	rts

L00077c:
	.dc.b	$00,$00,$00,$00

	.data

L000780:
	.dc.l	L000842
	.dc.l	L000857
	.dc.l	L00086c
	.dc.l	L000881
L000790:
	.dc.b	'使い方: mxp {<コマンド>|<MDXファイル名> [PDXファイル名]}',$0d,$0a
	.dc.b	$09,'-p  演奏開始',$0d,$0a
	.dc.b	$09,'-e  演奏終了',$0d,$0a
	.dc.b	$09,'-s  演奏中断',$0d,$0a
	.dc.b	$09,'-c  演奏再開',$0d,$0a,$00,$00
L000808:
	.dc.b	$09,'ファイルが読み込めません。',$0d,$0a,$00
L000826:
	.dc.b	$09,'メモリが確保できません。',$0d,$0a,$00
L000842:
	.dc.b	'演奏を開始します。',$0d,$0a,$00
L000857:
	.dc.b	'演奏を終了します。',$0d,$0a,$00
L00086c:
	.dc.b	'演奏を中断します。',$0d,$0a,$00
L000881:
	.dc.b	'演奏を再開します。',$0d,$0a,$00
L000896:
	.dc.b	'mxdrv',$00
L00089c:
	.dc.b	$09,'mxdrvが組み込まれていません。',$0d,$0a,$00
L0008bd:
	.dc.b	'200',$00
L0008c1:
	.dc.b	$09,'v2.00以上のmxdrvを使用してください。',$0d,$0a,$00
L0008e9:
	.dc.b	'mxp',$00
L0008ed:
	.dc.b	$2c,$00
L0008ef:
	.dc.b	$2c,$00
L0008f1:
	.dc.b	$5c,$00
L0008f3:
	.dc.b	$09,$27,$00
L0008f6:
	.dc.b	$27,'が見つかりません。',$0d,$0a,$00
L00090c:
	.dc.b	$09,'MMLデータバッファが不足しています。',$0d,$0a,$00
L000933:
	.dc.b	$09,'PCMデータバッファが不足しています。',$0d,$0a,$00
L00095a:
	.dc.b	'music player version 2.01 (c)1989 milk.',$0d,$0a,$00
L000984:
	.dc.b	$20,$09,$00
L000987:
	.dc.b	'.mdx',$00
L00098c:
	.dc.b	$20,$09,$00
L00098f:
	.dc.b	'.pdx',$00
L000994:
	.dc.b	$09,$00
L000996:
	.dc.b	$22,$00
L000998:
	.dc.b	'"の',$00

	.bss

L00099c:
	.ds.l	1
L0009a0:
	.ds.b	256
L000aa0:
	.ds.b	16640
L004ba0:

	.end	L000000
