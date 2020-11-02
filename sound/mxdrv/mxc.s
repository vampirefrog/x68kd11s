;=============================================
;  Filename sound/mxdrv/mxc.x
;
;
;  Base address 000000
;  Exec address 000000
;  Text size    0021e2 byte(s)
;  Data size    0003cc byte(s)
;  Bss  size    00e082 byte(s)
;  506 Labels
;
;  Commandline dis  -h -k -m68030 -q1 -B -M -w16 -o120 -gsound/mxdrv/mxc.lab --overwrite sound/mxdrv/mxc.x sound/mxdrv/mxc.s
;          DIS version 3.16
;=============================================

	.include	inc/doscall.mac
	.include	inc/iocscall.mac
	.include	inc/fefunc.mac

	.cpu	68030

	.text

L000000:
	move.l	a0,(L002950)
	move.l	a1,(L002954)
	lea.l	(L010630),a7
	pea.l	($0001,a2)
	bsr	L00133e
L00001a:
	link.w	a6,#$0000
	move.l	($0008,a6),-(a7)
	bsr	L00180e
	addq.l	#4,a7
	move.l	#$ffffffff,-(a7)
	bsr	L001886
	addq.l	#4,a7
	unlk	a6
	rts

L000038:
	link.w	a6,#-$0060
	move.l	($0008,a6),-(a7)
	move.l	(L002958,pc),-(a7)
	pea.l	(L004530,pc)
	pea.l	(L0022f8,pc)
	pea.l	(-$0060,a6)
	bsr	L001918
	lea.l	($0014,a7),a7
	pea.l	(-$0060,a6)
	bsr	L001804
	addq.l	#4,a7
	addq.l	#1,(L0021e2)
	unlk	a6
	rts

L00006c:
	link.w	a6,#$0000
	movem.l	d7,-(a7)
L000074:
	move.l	(L0029cc,pc),d0
	movea.l	d0,a0
	moveq.l	#$00,d0
	move.b	(a0),d0
	move.l	d0,d7
	move.l	d0,d0
	bra	L0000d6

L000084:
	addq.l	#1,(L0029cc)
	bra	L000074

L00008c:
	move.l	(L0029cc,pc),d0
	addq.l	#1,d0
	movea.l	d0,a0
	cmpi.b	#$2a,(a0)		;'*'
	beq	L00009e
	move.l	d7,d0
	bra	L0000fc

L00009e:
	addq.l	#1,(L0029cc)
	move.l	(L0029cc,pc),d0
	movea.l	d0,a0
	tst.b	(a0)
	beq	L0000bc
	move.l	(L0029cc,pc),d0
	movea.l	d0,a0
	cmpi.b	#$0d,(a0)
	beq	L0000bc
	bra	L00009e

L0000bc:
	bra	L000074

L0000be:
	move.b	(L0021ee,pc),d0
	beq	L0000d2
	addq.l	#2,(L0029cc)
	addq.l	#1,(L002958)
	bra	L000074

L0000d2:
	move.l	d7,d0
	bra	L0000fc

L0000d6:
	cmpi.l	#$00000009,d0
	beq	L000084
	cmpi.l	#$0000000d,d0
	beq	L0000be
	cmpi.l	#$00000020,d0
	beq	L000084
	cmpi.l	#$0000002f,d0
	beq	L00008c
	bra	L0000d2

L0000f8:
	bra	L000074

L0000fc:
	movem.l	(a7)+,d7
	unlk	a6
	rts

L000104:
	link.w	a6,#$0000
	movem.l	d7,-(a7)
	move.b	(L0021ee,pc),d0
	beq	L00011c
	clr.b	(L0021ee)
	bra	L0001a4

L00011c:
	move.l	(L002958,pc),d0
	bne	L000148
	move.l	#$00000001,(L002958)
	move.l	(L002954,pc),(L0029cc)
L000134:
	move.l	(L0029cc,pc),d0
	movea.l	d0,a0
	moveq.l	#$00,d0
	move.b	(a0),d0
	move.l	d0,d7
	cmp.l	($0008,a6),d0
	beq	L0001e4
L000148:
	move.l	(L0029cc,pc),d0
	movea.l	d0,a0
	moveq.l	#$00,d0
	move.b	(a0),d0
	addq.l	#1,(L0029cc)
	move.l	d0,d7
	cmp.l	#$0000000d,d0
	beq	L0001d4
	move.l	d7,d0
	bne	L00016c
	moveq.l	#$00,d0
	bra	L0001ec

L00016c:
	cmp.l	#$00000022,d7
	bne	L00019c
L000174:
	move.l	(L0029cc,pc),d0
	movea.l	d0,a0
	moveq.l	#$00,d0
	move.b	(a0),d0
	move.l	d0,d7
	beq	L00019a
	cmp.l	#$00000022,d7
	beq	L00019a
	cmp.l	#$0000000d,d7
	beq	L00019a
	addq.l	#1,(L0029cc)
	bra	L000174

L00019a:
	bra	L0001d0

L00019c:
	cmp.l	#$0000007b,d7
	bne	L0001d0
L0001a4:
	move.l	(L0029cc,pc),d0
	movea.l	d0,a0
	moveq.l	#$00,d0
	move.b	(a0),d0
	addq.l	#1,(L0029cc)
	move.l	d0,d7
	beq	L0001d0
	cmp.l	#$0000007d,d7
	beq	L0001d0
	cmp.l	#$0000000a,d7
	bne	L0001ce
	addq.l	#1,(L002958)
L0001ce:
	bra	L0001a4

L0001d0:
	bra	L000148

L0001d4:
	addq.l	#1,(L0029cc)
	addq.l	#1,(L002958)
	bra	L000134

L0001e4:
	addq.l	#1,(L0029cc)
	moveq.l	#$01,d0
L0001ec:
	movem.l	(a7)+,d7
	unlk	a6
	rts

L0001f4:
	link.w	a6,#$0000
	bsr	L00006c
	cmp.l	($0008,a6),d0
	beq	L000206
	moveq.l	#$ff,d0
	bra	L00020e

L000206:
	addq.l	#1,(L0029cc)
	moveq.l	#$00,d0
L00020e:
	unlk	a6
	rts

L000212:
	link.w	a6,#-$0004
	movem.l	d7,-(a7)
	bsr	L00006c
	move.l	#$0000000a,-(a7)
	pea.l	(-$0004,a6)
	move.l	(L0029cc,pc),-(a7)
	bsr	L001a00
	lea.l	($000c,a7),a7
	ext.l	d0
	move.l	d0,d7
	move.l	(L0029cc,pc),d0
	cmp.l	(-$0004,a6),d0
	bne	L00024a
	move.l	#$80000000,d0
	bra	L000254

L00024a:
	move.l	(-$0004,a6),(L0029cc)
	move.l	d7,d0
L000254:
	movem.l	(a7)+,d7
	unlk	a6
	rts

L00025c:
	link.w	a6,#$0000
	movem.l	d7,-(a7)
	move.l	($000c,a6),d7
L000268:
	move.l	d7,d0
	ble	L0002ac
	move.l	($0008,a6),-(a7)
	movea.l	d0,a0
	bsr	L000212
	movea.l	(a7)+,a0
	move.l	d0,(a0)
	addq.l	#4,($0008,a6)
	cmp.l	#$80000000,d0
	bne	L000288
	moveq.l	#$ff,d0
	bra	L0002ac

L000288:
	cmp.l	#$00000001,d7
	bne	L000294
	moveq.l	#$00,d0
	bra	L0002ac

L000294:
	move.l	#$0000002c,-(a7)
	bsr	L0001f4
	addq.l	#4,a7
	tst.l	d0
	beq	L0002a8
	moveq.l	#$ff,d0
	bra	L0002ac

L0002a8:
	subq.l	#1,d7
	bra	L000268

L0002ac:
	movem.l	(a7)+,d7
	unlk	a6
	rts

L0002b4:
	link.w	a6,#-$0004
	bsr	L000212
	move.l	d0,(-$0004,a6)
	cmp.l	($0008,a6),d0
	blt	L0002d0
	move.l	(-$0004,a6),d0
	cmp.l	($000c,a6),d0
	ble	L0002e2
L0002d0:
	pea.l	(L0022b6,pc)
	bsr	L000038
	addq.l	#4,a7
	move.l	#$80000000,d0
	bra	L0002e6

L0002e2:
	move.l	(-$0004,a6),d0
L0002e6:
	unlk	a6
	rts

L0002ea:
	link.w	a6,#$0000
	movem.l	d5-d7,-(a7)
	move.l	(L0029cc,pc),d0
	movea.l	d0,a0
	cmpi.b	#$25,(a0)		;'%'
	bne	L00030e
	addq.l	#1,(L0029cc)
	bsr	L000212
	move.l	d0,d7
	bra	L0003a4

L00030e:
	moveq.l	#$00,d7
L000310:
	bsr	L000212
	move.l	d0,d5
	cmp.l	#$80000000,d0
	bne	L00032c
	move.l	($0008,a6),d0
	bne.w	L0003a4
	move.l	(L0022d8,pc),d5
	bra	L00035e

L00032c:
	move.l	#$000000c0,d0
	move.l	d5,d1
	movem.l	d0-d1,-(a7)
	FPACK	__CLMOD
	movem.l	(a7)+,d0-d1
	tst.l	d0
	beq	L00034a
	move.l	#$80000000,d5
	bra	L00035e

L00034a:
	move.l	#$000000c0,d0
	move.l	d5,d1
	movem.l	d0-d1,-(a7)
	FPACK	__CLDIV
	movem.l	(a7)+,d0-d1
	move.l	d0,d5
L00035e:
	move.l	d5,d6
L000360:
	move.l	(L0029cc,pc),d0
	movea.l	d0,a0
	cmpi.b	#$2e,(a0)		;'.'
	bne	L00038c
	move.l	d6,d0
	and.l	#$00000001,d0
	beq	L00037c
	move.l	#$80000000,d5
L00037c:
	move.l	d6,d0
	asr.l	#1,d0
	move.l	d0,d6
	add.l	d6,d5
	addq.l	#1,(L0029cc)
	bra	L000360

L00038c:
	add.l	d5,d7
	move.l	(L0029cc,pc),d0
	movea.l	d0,a0
	cmpi.b	#$5e,(a0)		;'^'
	bne	L0003a4
	addq.l	#1,(L0029cc)
	bra	L000310

L0003a4:
	cmp.l	#$00000100,d7
	bgt	L0003b4
	cmp.l	#$00000001,d7
	bge	L0003c0
L0003b4:
	pea.l	(L002307,pc)
	bsr	L000038
	addq.l	#4,a7
	bra	L0003cc

L0003c0:
	move.l	($0008,a6),d0
	beq	L0003cc
	move.l	d7,(L0022d8)
L0003cc:
	move.l	d7,d0
	movem.l	(a7)+,d5-d7
	unlk	a6
	rts

L0003d6:
	link.w	a6,#$0000
	movem.l	d7,-(a7)
	move.l	(L0029cc,pc),d0
	movea.l	d0,a0
	moveq.l	#$00,d0
	move.b	(a0),d0
	addq.l	#1,(L0029cc)
	move.l	d0,d7
	cmp.l	#$0000006e,d0
	bne	L000412
	bsr	L000212
	move.l	d0,d7
	bsr	L00006c
	cmp.l	#$0000002c,d0
	bne	L000410
	addq.l	#1,(L0029cc)
L000410:
	bra	L000472

L000412:
	move.l	d7,d0
	moveq.l	#$61,d1			;'a'
	sub.l	d1,d0
	asl.l	#2,d0
	add.l	#L0022dc,d0
	movea.l	d0,a0
	move.l	(a0),d7
	move.l	(L0029c8,pc),d0
	add.l	d0,d7
	subq.l	#3,d7
	move.l	(L0029cc,pc),d0
	movea.l	d0,a0
	moveq.l	#$00,d0
	move.b	(a0),d0
	bra	L00044c

L000438:
	addq.l	#1,(L0029cc)
	addq.l	#1,d7
	bra	L000472

L000442:
	addq.l	#1,(L0029cc)
	subq.l	#1,d7
	bra	L000472

L00044c:
	sub.l	#$0000002b,d0
	cmpi.l	#$00000002,d0
	bhi	L000472
	asl.l	#2,d0
	lea.l	(L000466,pc),a0
	movea.l	(a0,d0.l),a0
	jmp	(a0)

L000466:
	.dc.l	L000438
	.dc.l	L000472
	.dc.l	L000442
L000472:
	move.l	d7,d0
	blt	L00047e
	cmp.l	#$0000005f,d7
	ble	L000488
L00047e:
	pea.l	(L002322,pc)
	bsr	L000038
	addq.l	#4,a7
L000488:
	move.l	d7,d0
	movem.l	(a7)+,d7
	unlk	a6
	rts

L000492:
	link.w	a6,#-$0004
	move.l	(L0029cc,pc),d0
	movea.l	d0,a0
	moveq.l	#$00,d0
	move.b	(a0),d0
	bra	L00054a

L0004a4:
	addq.l	#1,(L0029cc)
	move.l	#$00000008,-(a7)
	clr.l	-(a7)
	bsr	L0002b4
	addq.l	#8,a7
	move.l	d0,(-$0004,a6)
	cmp.l	#$80000000,d0
	beq	L0004da
	move.l	(-$0004,a6),d0
	moveq.l	#$0c,d1
	movem.l	d0-d1,-(a7)
	FPACK	__CLMUL
	movem.l	(a7)+,d0-d1
	move.l	d0,(L0029c8)
L0004da:
	bra	L000566

L0004de:
	addq.l	#1,(L0029cc)
	move.l	(L0021ea,pc),d0
	sub.l	d0,(L0029c8)
	blt	L0004fc
	cmpi.l	#$0000005f,(L0029c8)
	ble	L000510
L0004fc:
	pea.l	(L002274,pc)
	bsr	L000038
	addq.l	#4,a7
	move.l	(L0021ea,pc),d0
	add.l	d0,(L0029c8)
L000510:
	bra	L000566

L000512:
	addq.l	#1,(L0029cc)
	move.l	(L0021ea,pc),d0
	add.l	d0,(L0029c8)
	blt	L000530
	cmpi.l	#$0000005f,(L0029c8)
	ble	L000544
L000530:
	pea.l	(L002274,pc)
	bsr	L000038
	addq.l	#4,a7
	move.l	(L0021ea,pc),d0
	sub.l	d0,(L0029c8)
L000544:
	bra	L000566

L000546:
	moveq.l	#$ff,d0
	bra	L000568

L00054a:
	cmpi.l	#$0000003c,d0
	beq	L0004de
	cmpi.l	#$0000003e,d0
	beq	L000512
	cmpi.l	#$0000006f,d0
	beq	L0004a4
	bra	L000546

L000566:
	moveq.l	#$00,d0
L000568:
	unlk	a6
	rts

L00056c:
	link.w	a6,#-$1038
	movem.l	d4-d7/a4-a5,-(a7)
	movea.l	($000c,a6),a5
	move.l	#$00000030,(L0029c8)
	move.l	a5,(-$1024,a6)
	move.l	($0008,a6),d0
	asl.l	#2,d0
	add.l	#L0029a4,d0
	movea.l	d0,a0
	moveq.l	#$00,d1
	move.l	d1,(L002958)
	move.l	d1,(-$1030,a6)
	move.l	d1,(-$1034,a6)
	move.l	d1,(-$1028,a6)
	move.l	d1,(a0)
	move.l	($0008,a6),d0
	add.l	#L0021f0,d0
	movea.l	d0,a0
	moveq.l	#$00,d0
	move.b	(a0),d0
	move.l	d0,(-$102c,a6)
L0005be:
	move.l	(-$102c,a6),-(a7)
	bsr	L000104
	addq.l	#4,a7
	tst.l	d0
	beq	L00105e
L0005ce:
	bsr	L00006c
	move.l	d0,d6
	cmp.l	#$00000061,d0
	blt	L0005e4
	cmp.l	#$00000067,d6
	ble	L0005ee
L0005e4:
	cmp.l	#$0000006e,d6
	bne	L0006b4
L0005ee:
	bsr	L0003d6
	move.l	d0,d4
	clr.l	-(a7)
	bsr	L0002ea
	addq.l	#4,a7
	move.l	d0,d5
	add.l	d5,(-$1030,a6)
	move.l	(L0029cc,pc),d0
	movea.l	d0,a0
	moveq.l	#$00,d0
	move.b	(a0),d0
	move.l	d0,d6
	cmp.l	#$0000005f,d0
	bne	L00068a
	addq.l	#1,(L0029cc)
L00061c:
	bsr	L000492
	tst.l	d0
	bne	L000626
	bra	L00061c

L000626:
	move.l	(L0029cc,pc),d0
	movea.l	d0,a0
	moveq.l	#$00,d0
	move.b	(a0),d0
	move.l	d0,d6
	cmp.l	#$00000061,d0
	blt	L000642
	cmp.l	#$00000067,d6
	ble	L000658
L000642:
	cmp.l	#$0000006e,d6
	beq	L000658
	pea.l	(L0022b6,pc)
	bsr	L000038
	addq.l	#4,a7
	bra	L0005ce

L000658:
	bsr	L0003d6
	move.l	d4,d1
	sub.l	d1,d0
	moveq.l	#$0e,d1
	asl.l	d1,d0
	move.l	d5,d1
	movem.l	d0-d1,-(a7)
	FPACK	__CLDIV
	movem.l	(a7)+,d0-d1
	move.l	d0,d6
	move.l	#$000000f2,d0
	move.b	d0,(a5)+
	move.l	d6,d0
	asr.l	#8,d0
	move.b	d0,(a5)+
	move.l	d6,d0
	move.b	d0,(a5)+
	bsr	L00006c
	move.l	d0,d6
L00068a:
	cmp.l	#$00000026,d6
	bne	L0006a0
	move.l	#$000000f7,d0
	move.b	d0,(a5)+
	addq.l	#1,(L0029cc)
L0006a0:
	move.l	d4,d0
	or.l	#$00000080,d0
	move.b	d0,(a5)+
	move.l	d5,d0
	subq.l	#1,d0
	move.b	d0,(a5)+
	bra	L0005ce

L0006b4:
	bsr	L000492
	tst.l	d0
	beq	L0005ce
	addq.l	#1,(L0029cc)
	move.l	d6,d0
	bra	L000f5a

L0006ca:
	clr.l	-(a7)
	bsr	L0002ea
	addq.l	#4,a7
	move.l	d0,d5
	add.l	d5,(-$1030,a6)
	cmp.l	#$00000080,d5
	ble	L0006ea
	moveq.l	#$7f,d0
	move.b	d0,(a5)+
	sub.l	#$00000080,d5
L0006ea:
	move.l	d5,d0
	subq.l	#1,d0
	move.b	d0,(a5)+
	bra	L0005ce

L0006f4:
	move.l	#$00000004,-(a7)
	clr.l	-(a7)
	bsr	L0002b4
	addq.l	#8,a7
	move.l	d0,d6
	cmp.l	#$80000000,d0
	beq	L000718
	move.l	#$000000ed,d0
	move.b	d0,(a5)+
	move.l	d6,d0
	move.b	d0,(a5)+
L000718:
	bra	L0005ce

L00071c:
	move.l	#$00000001,-(a7)
	bsr	L0002ea
	addq.l	#4,a7
	bra	L0005ce

L00072c:
	move.l	($0008,a6),d0
	asl.l	#2,d0
	add.l	#L0029a4,d0
	movea.l	d0,a0
	tst.l	(a0)
	beq	L00074a
	pea.l	(L00233b,pc)
	bsr	L000038
	addq.l	#4,a7
	bra	L000768

L00074a:
	move.l	(-$1030,a6),(-$1034,a6)
	move.l	a5,(-$1038,a6)
	move.l	($0008,a6),d0
	asl.l	#2,d0
	add.l	#L0029a4,d0
	movea.l	d0,a0
	move.l	#$00000001,(a0)
L000768:
	bra	L0005ce

L00076c:
	bsr	L000212
	move.l	d0,d6
	cmp.l	#$80000000,d0
	beq	L0007b2
	move.l	#$00000100,d0
	move.l	d6,d2
	asl.l	#4,d2
	move.l	d2,-(a7)
	move.l	#$0001312d,d1
	move.l	d1,-(a7)
	FPACK	__CLDIV
	movem.l	(a7)+,d1-d2
	sub.l	d1,d0
	move.l	d0,d6
	blt	L0007b2
	cmp.l	#$000000ff,d6
	bgt	L0007b2
	move.l	#$000000ff,d0
	move.b	d0,(a5)+
	move.l	d6,d0
	move.b	d0,(a5)+
	bra	L0005ce

L0007b2:
	pea.l	(L0022b6,pc)
	bsr	L000038
	addq.l	#4,a7
	bra	L0005ce

L0007c0:
	move.l	(L0029cc,pc),d0
	movea.l	d0,a0
	moveq.l	#$00,d0
	move.b	(a0),d0
	bra	L00089c

L0007ce:
	addq.l	#1,(L0029cc)
	move.l	#$000000ff,-(a7)
	clr.l	-(a7)
	bsr	L0002b4
	addq.l	#8,a7
	move.l	d0,d6
	cmp.l	#$80000000,d0
	beq	L0007f8
	move.l	#$000000ff,d0
	move.b	d0,(a5)+
	move.l	d6,d0
	move.b	d0,(a5)+
L0007f8:
	bra	L0005ce

L0007fc:
	addq.l	#1,(L0029cc)
	move.l	#$0000007f,-(a7)
	clr.l	-(a7)
	bsr	L0002b4
	addq.l	#8,a7
	move.l	d0,d6
	cmp.l	#$80000000,d0
	beq	L00082e
	move.l	#$000000fb,d0
	move.b	d0,(a5)+
	move.l	#$000000ff,d0
	move.l	d6,d1
	sub.l	d1,d0
	move.b	d0,(a5)+
L00082e:
	bra	L0005ce

L000832:
	addq.l	#1,(L0029cc)
	move.l	#$000000c0,-(a7)
	move.l	#$00000001,-(a7)
	bsr	L0002b4
	addq.l	#8,a7
	move.l	d0,d6
	cmp.l	#$80000000,d0
	beq	L000862
	move.l	#$000000f8,d0
	move.b	d0,(a5)+
	move.l	d6,d0
	neg.l	d0
	move.b	d0,(a5)+
L000862:
	bra	L0005ce

L000866:
	move.l	#$000000ff,-(a7)
	clr.l	-(a7)
	bsr	L0002b4
	addq.l	#8,a7
	move.l	d0,d6
	cmp.l	#$80000000,d0
	beq	L000898
	move.l	#$000000fd,d0
	move.b	d0,(a5)+
	move.l	d6,d0
	move.b	d0,(a5)+
	move.l	d6,d0
	add.l	#L004430,d0
	movea.l	d0,a0
	moveq.l	#$02,d0
	or.b	d0,(a0)
L000898:
	bra	L0005ce

L00089c:
	sub.l	#$00000071,d0
	cmpi.l	#$00000005,d0
	bhi	L000866
	asl.l	#2,d0
	lea.l	(L0008b6,pc),a0
	movea.l	(a0,d0.l),a0
	jmp	(a0)

L0008b6:
	.dc.l	L000832
	.dc.l	L000866
	.dc.l	L000866
	.dc.l	L0007ce
	.dc.l	L000866
	.dc.l	L0007fc
L0008ce:
	move.l	#$0000000f,-(a7)
	clr.l	-(a7)
	bsr	L0002b4
	addq.l	#8,a7
	move.l	d0,d6
	cmp.l	#$80000000,d0
	beq	L0008f2
	move.l	#$000000fb,d0
	move.b	d0,(a5)+
	move.l	d6,d0
	move.b	d0,(a5)+
L0008f2:
	bra	L0005ce

L0008f6:
	move.l	#$00000008,-(a7)
	move.l	#$00000001,-(a7)
	bsr	L0002b4
	addq.l	#8,a7
	move.l	d0,d6
	cmp.l	#$80000000,d0
	beq	L00091e
	move.l	#$000000f8,d0
	move.b	d0,(a5)+
	move.l	d6,d0
	move.b	d0,(a5)+
L00091e:
	bra	L0005ce

L000922:
	move.l	#$00007fff,-(a7)
	move.l	#$ffff8001,-(a7)
	bsr	L0002b4
	addq.l	#8,a7
	move.l	d0,d6
	cmp.l	#$80000000,d0
	beq	L000950
	move.l	#$000000f3,d0
	move.b	d0,(a5)+
	move.l	d6,d0
	asr.l	#8,d0
	move.b	d0,(a5)+
	move.l	d6,d0
	move.b	d0,(a5)+
L000950:
	bra	L0005ce

L000954:
	move.l	#$00000003,-(a7)
	clr.l	-(a7)
	bsr	L0002b4
	addq.l	#8,a7
	move.l	d0,d6
	cmp.l	#$80000000,d0
	beq	L000978
	move.l	#$000000fc,d0
	move.b	d0,(a5)+
	move.l	d6,d0
	move.b	d0,(a5)+
L000978:
	bra	L0005ce

L00097c:
	pea.l	(L002354,pc)
	bsr	L000038
	addq.l	#4,a7
	bra	L0005ce

L00098a:
	addq.l	#1,(-$1028,a6)
	move.l	(-$1028,a6),d0
	asl.l	#2,d0
	lea.l	(-$1020,a6),a0
	adda.l	d0,a0
	move.l	a0,d0
	clr.l	(a0)
	move.l	(-$1028,a6),d0
	asl.l	#2,d0
	lea.l	(-$0400,a6),a0
	adda.l	d0,a0
	move.l	a0,d0
	move.l	(-$1030,a6),(a0)
	move.l	#$000000f6,d0
	move.b	d0,(a5)+
	clr.b	(a5)
	addq.l	#1,a5
	clr.b	(a5)
	addq.l	#1,a5
	move.l	(-$1028,a6),d0
	asl.l	#2,d0
	lea.l	(-$0c20,a6),a0
	adda.l	d0,a0
	move.l	a0,d0
	move.l	a5,(a0)
	bra	L0005ce

L0009d4:
	move.l	(-$1028,a6),d0
	bne	L0009e6
	pea.l	(L002368,pc)
	bsr	L000038
	addq.l	#4,a7
	bra	L000a2e

L0009e6:
	move.l	(-$1028,a6),d0
	asl.l	#2,d0
	lea.l	(-$1020,a6),a0
	adda.l	d0,a0
	move.l	a0,d0
	tst.l	(a0)
	beq	L000a02
	pea.l	(L00237e,pc)
	bsr	L000038
	addq.l	#4,a7
L000a02:
	move.l	#$000000f4,d0
	move.b	d0,(a5)
	addq.l	#3,a5
	move.l	(-$1028,a6),d0
	asl.l	#2,d0
	lea.l	(-$1020,a6),a0
	adda.l	d0,a0
	move.l	a0,d0
	move.l	a5,(a0)
	move.l	(-$1028,a6),d0
	asl.l	#2,d0
	lea.l	(-$0800,a6),a0
	adda.l	d0,a0
	move.l	a0,d0
	move.l	(-$1030,a6),(a0)
L000a2e:
	bra	L0005ce

L000a32:
	move.l	(-$1028,a6),d0
	bne	L000a46
	pea.l	(L002394,pc)
	bsr	L000038
	addq.l	#4,a7
	bra	L000b50

L000a46:
	bsr	L000212
	move.l	d0,d6
	cmp.l	#$80000000,d0
	bne	L000a56
	moveq.l	#$02,d6
L000a56:
	cmp.l	#$00000002,d6
	blt	L000a66
	cmp.l	#$000000ff,d6
	ble	L000a74
L000a66:
	pea.l	(L0022b6,pc)
	bsr	L000038
	addq.l	#4,a7
	bra	L0005ce

L000a74:
	move.l	(-$1028,a6),d0
	asl.l	#2,d0
	lea.l	(-$0c20,a6),a0
	adda.l	d0,a0
	move.l	a0,d0
	move.l	(a0),d0
	subq.l	#2,d0
	movea.l	d0,a0
	move.l	d6,d1
	move.b	d1,(a0)
	move.l	#$000000f5,d0
	move.b	d0,(a5)+
	move.l	(-$1030,a6),d7
	move.l	d6,d1
	subq.l	#1,d1
	move.l	d1,-(a7)
	move.l	d7,d0
	move.l	(-$1028,a6),d1
	asl.l	#2,d1
	lea.l	(-$0400,a6),a1
	adda.l	d1,a1
	move.l	a1,d1
	sub.l	(a1),d0
	move.l	d0,-(a7)
	FPACK	__CLMUL
	movem.l	(a7)+,d0-d1
	add.l	d0,(-$1030,a6)
	move.l	(-$1028,a6),d0
	asl.l	#2,d0
	lea.l	(-$1020,a6),a0
	adda.l	d0,a0
	move.l	a0,d0
	tst.l	(a0)
	beq	L000b2a
	move.l	d7,d0
	move.l	(-$1028,a6),d1
	asl.l	#2,d1
	lea.l	(-$0800,a6),a1
	adda.l	d1,a1
	move.l	a1,d1
	sub.l	(a1),d0
	sub.l	d0,(-$1030,a6)
	move.l	a5,d0
	move.l	(-$1028,a6),d1
	asl.l	#2,d1
	lea.l	(-$1020,a6),a1
	adda.l	d1,a1
	move.l	a1,d1
	sub.l	(a1),d0
	move.l	d0,d7
	move.l	(-$1028,a6),d0
	asl.l	#2,d0
	lea.l	(-$1020,a6),a0
	adda.l	d0,a0
	move.l	a0,d0
	move.l	(a0),d0
	subq.l	#2,d0
	movea.l	d0,a0
	move.l	d7,d1
	asr.l	#8,d1
	move.b	d1,(a0)
	move.l	(-$1028,a6),d0
	asl.l	#2,d0
	lea.l	(-$1020,a6),a0
	adda.l	d0,a0
	move.l	a0,d0
	move.l	(a0),d0
	subq.l	#1,d0
	movea.l	d0,a0
	move.l	d7,d1
	move.b	d1,(a0)
L000b2a:
	move.l	(-$1028,a6),d0
	asl.l	#2,d0
	subq.l	#1,(-$1028,a6)
	lea.l	(-$0c20,a6),a0
	adda.l	d0,a0
	move.l	a0,d0
	move.l	(a0),d0
	move.l	a5,d1
	addq.l	#2,d1
	sub.l	d1,d0
	move.l	d0,d7
	move.l	d0,d0
	asr.l	#8,d0
	move.b	d0,(a5)+
	move.l	d7,d0
	move.b	d0,(a5)+
L000b50:
	bra	L0005ce

L000b54:
	move.l	#$000000ff,-(a7)
	clr.l	-(a7)
	bsr	L0002b4
	addq.l	#8,a7
	move.l	d0,d6
	cmp.l	#$80000000,d0
	beq	L000ba8
	move.l	#$0000002c,-(a7)
	bsr	L0001f4
	addq.l	#4,a7
	tst.l	d0
	bne	L000ba8
	move.l	#$000000ff,-(a7)
	clr.l	-(a7)
	bsr	L0002b4
	addq.l	#8,a7
	move.l	d0,d7
	cmp.l	#$80000000,d0
	beq	L000ba8
	move.l	#$000000fe,d0
	move.b	d0,(a5)+
	move.l	d6,d0
	move.b	d0,(a5)+
	move.l	d7,d0
	move.b	d0,(a5)+
	bra	L0005ce

L000ba8:
	pea.l	(L0022b6,pc)
	bsr	L000038
	addq.l	#4,a7
	bra	L0005ce

L000bb6:
	move.l	#$000000ff,-(a7)
	clr.l	-(a7)
	bsr	L0002b4
	addq.l	#8,a7
	move.l	d0,d6
	cmp.l	#$80000000,d0
	beq	L000bda
	move.l	#$000000f0,d0
	move.b	d0,(a5)+
	move.l	d6,d0
	move.b	d0,(a5)+
L000bda:
	bra	L0005ce

L000bde:
	bsr	L000212
	move.l	d0,d6
	cmp.l	#$80000000,d0
	bne	L000bf0
	moveq.l	#$00,d6
	bra	L000c10

L000bf0:
	move.l	d6,d0
	blt	L000c06
	cmp.l	#$0000001f,d6
	bgt	L000c06
	move.l	#$00000080,d0
	or.l	d0,d6
	bra	L000c10

L000c06:
	pea.l	(L0022b6,pc)
	bsr	L000038
	addq.l	#4,a7
L000c10:
	move.l	#$000000ed,d0
	move.b	d0,(a5)+
	move.l	d6,d0
	move.b	d0,(a5)+
	bra	L0005ce

L000c20:
	move.l	(L0029cc,pc),d0
	movea.l	d0,a0
	moveq.l	#$00,d0
	move.b	(a0),d0
	move.l	d0,-(a7)
	pea.l	(L0021f0,pc)
	bsr	L001990
	addq.l	#8,a7
	move.l	#L0021f0,d1
	sub.l	d1,d0
	move.l	d0,d6
	bge	L000c5e
	move.l	#$00000008,-(a7)
	clr.l	-(a7)
	bsr	L0002b4
	addq.l	#8,a7
	move.l	d0,d6
	cmp.l	#$80000000,d0
	beq	L0005ce
	bra	L000c64

L000c5e:
	addq.l	#1,(L0029cc)
L000c64:
	move.l	#$000000ef,d0
	move.b	d0,(a5)+
	move.l	d6,d0
	move.b	d0,(a5)+
	bra	L0005ce

L000c74:
	move.l	#$000000ee,d0
	move.b	d0,(a5)+
	bra	L0005ce

L000c80:
	move.l	#$000000fa,d0
	move.b	d0,(a5)+
	bra	L0005ce

L000c8c:
	move.l	#$000000f9,d0
	move.b	d0,(a5)+
	bra	L0005ce

L000c98:
	move.l	(L0029cc,pc),d0
	movea.l	d0,a0
	cmpi.b	#$44,(a0)		;'D'
	bne	L000cd2
	addq.l	#1,(L0029cc)
	move.l	#$000000ff,-(a7)
	clr.l	-(a7)
	bsr	L0002b4
	addq.l	#8,a7
	move.l	d0,d6
	cmp.l	#$80000000,d0
	beq	L000cd2
	move.l	#$000000e9,d0
	move.b	d0,(a5)+
	move.l	d6,d0
	move.b	d0,(a5)+
	bra	L0005ce

L000cd2:
	move.l	(L0029cc,pc),d0
	movea.l	d0,a0
	moveq.l	#$00,d0
	move.b	(a0),d0
	bra	L000d82

L000ce0:
	move.l	#$000000ec,d7
	bra	L000dac

L000cea:
	move.l	#$000000eb,d7
	bra	L000dac

L000cf4:
	move.l	#$000000ea,d7
	bra	L000dac

L000cfe:
	addq.l	#1,(L0029cc)
	move.l	#$00000006,-(a7)
	clr.l	-(a7)
	bsr	L0002b4
	addq.l	#8,a7
	move.l	d0,d6
	cmp.l	#$80000000,d0
	beq	L0005ce
	move.l	d6,d0
	asr.l	#1,d0
	bra	L000d3c

L000d24:
	move.l	#$000000ec,d7
	bra	L000d5c

L000d2c:
	move.l	#$000000eb,d7
	bra	L000d5c

L000d34:
	move.l	#$000000ea,d7
	bra	L000d5c

L000d3c:
	cmpi.l	#$00000002,d0
	bhi	L000d5c
	asl.l	#2,d0
	lea.l	(L000d50,pc),a0
	movea.l	(a0,d0.l),a0
	jmp	(a0)

L000d50:
	.dc.l	L000d24
	.dc.l	L000d2c
	.dc.l	L000d34
L000d5c:
	move.l	d7,d0
	move.b	d0,(a5)+
	move.l	d6,d0
	and.l	#$00000001,d0
	add.l	#$00000080,d0
	move.b	d0,(a5)+
	bra	L0005ce

L000d74:
	pea.l	(L002298,pc)
	bsr	L000038
	addq.l	#4,a7
	bra	L0005ce

L000d82:
	cmpi.l	#$00000041,d0
	beq	L000cea
	cmpi.l	#$00000046,d0
	beq	L000cfe
	cmpi.l	#$00000048,d0
	beq	L000cf4
	cmpi.l	#$00000050,d0
	beq	L000ce0
	bra	L000d74

L000dac:
	move.l	#$00000002,-(a7)
	pea.l	(L0023ad,pc)
	addq.l	#1,(L0029cc)
	move.l	(L0029cc,pc),-(a7)
	bsr	L0019d8
	lea.l	($000c,a7),a7
	tst.l	d0
	bne	L000de2
	move.l	d7,d0
	move.b	d0,(a5)+
	move.l	#$00000081,d0
	move.b	d0,(a5)+
	addq.l	#2,(L0029cc)
	bra	L0005ce

L000de2:
	move.l	#$00000002,-(a7)
	pea.l	(L0023b0,pc)
	move.l	(L0029cc,pc),-(a7)
	bsr	L0019d8
	lea.l	($000c,a7),a7
	tst.l	d0
	bne	L000e12
	move.l	d7,d0
	move.b	d0,(a5)+
	move.l	#$00000080,d0
	move.b	d0,(a5)+
	addq.l	#2,(L0029cc)
	bra	L0005ce

L000e12:
	cmp.l	#$000000ec,d7
	beq	L000e24
	cmp.l	#$000000eb,d7
	bne	L000f00
L000e24:
	move.l	#$00000003,-(a7)
	pea.l	(-$0820,a6)
	bsr	L00025c
	addq.l	#8,a7
	tst.l	d0
	bne	L000e42
	cmpi.l	#$00000001,(-$081c,a6)
	bge	L000e50
L000e42:
	pea.l	(L0022b6,pc)
	bsr	L000038
	addq.l	#4,a7
	bra	L0005ce

L000e50:
	move.l	(-$0818,a6),d6
	move.l	d6,d0
	asl.l	#8,d0
	move.l	d0,d6
	move.l	(-$081c,a6),d0
	asl.l	#1,d0
	move.l	d0,(-$081c,a6)
	move.l	(-$0820,a6),d0
	bra	L000eba

L000e6a:
	move.l	(-$081c,a6),d0
	asl.l	#1,d0
	move.l	d0,(-$081c,a6)
L000e74:
	cmp.l	#$000000ec,d7
	bne	L000e82
	move.l	d6,d0
	asl.l	#1,d0
	move.l	d0,d6
L000e82:
	move.l	d6,d0
	move.l	(-$081c,a6),d1
	movem.l	d0-d1,-(a7)
	FPACK	__CLDIV
	movem.l	(a7)+,d0-d1
	move.l	d0,d6
L000e94:
	cmpi.l	#$0000ffff,(-$081c,a6)
	bgt	L000eae
	move.l	d6,-(a7)
	bsr	L00188e
	addq.l	#4,a7
	cmp.l	#$00007fff,d0
	ble	L000eda
L000eae:
	pea.l	(L0022b6,pc)
	bsr	L000038
	addq.l	#4,a7
	bra	L000eda

L000eba:
	cmpi.l	#$00000002,d0
	bhi	L000eae
	asl.l	#2,d0
	lea.l	(L000ece,pc),a0
	movea.l	(a0,d0.l),a0
	jmp	(a0)

L000ece:
	.dc.l	L000e6a
	.dc.l	L000e94
	.dc.l	L000e74
L000eda:
	move.l	d7,d0
	move.b	d0,(a5)+
	move.l	(-$0820,a6),d0
	move.b	d0,(a5)+
	move.l	(-$081c,a6),d0
	asr.l	#8,d0
	move.b	d0,(a5)+
	move.l	(-$081c,a6),d0
	move.b	d0,(a5)+
	move.l	d6,d0
	asr.l	#8,d0
	move.b	d0,(a5)+
	move.l	d6,d0
	move.b	d0,(a5)+
	bra	L0005ce

L000f00:
	move.l	#$00000007,-(a7)
	pea.l	(-$0820,a6)
	bsr	L00025c
	addq.l	#8,a7
	tst.l	d0
	beq	L000f1e
	pea.l	(L0022b6,pc)
	bsr	L000038
	addq.l	#4,a7
L000f1e:
	move.l	d7,d0
	move.b	d0,(a5)+
	move.l	(-$0808,a6),d0
	asl.l	#6,d0
	or.l	(-$0820,a6),d0
	move.b	d0,(a5)+
	move.l	(-$081c,a6),d0
	move.b	d0,(a5)+
	move.l	(-$0818,a6),d0
	or.l	#$00000080,d0
	move.b	d0,(a5)+
	move.l	(-$0814,a6),d0
	move.b	d0,(a5)+
	move.l	(-$0810,a6),d0
	asl.l	#4,d0
	add.l	(-$080c,a6),d0
	move.b	d0,(a5)+
	bra	L0005ce

L000f56:
	bra	L001036

L000f5a:
	cmpi.l	#$00000026,d0
	beq	L00097c
	cmpi.l	#$00000028,d0
	beq	L000c80
	cmpi.l	#$00000029,d0
	beq	L000c8c
	cmpi.l	#$0000002f,d0
	beq	L0009d4
	cmpi.l	#$00000040,d0
	beq	L0007c0
	cmpi.l	#$00000044,d0
	beq	L000922
	cmpi.l	#$00000046,d0
	beq	L0006f4
	cmpi.l	#$0000004c,d0
	beq	L00072c
	cmpi.l	#$0000004d,d0
	beq	L000c98
	cmpi.l	#$00000053,d0
	beq	L000c20
	cmpi.l	#$00000057,d0
	beq	L000c74
	cmpi.l	#$0000005b,d0
	beq	L00098a
	cmpi.l	#$0000005d,d0
	beq	L000a32
	cmpi.l	#$0000006b,d0
	beq	L000bb6
	cmpi.l	#$0000006c,d0
	beq	L00071c
	cmpi.l	#$00000070,d0
	beq	L000954
	cmpi.l	#$00000071,d0
	beq	L0008f6
	cmpi.l	#$00000072,d0
	beq	L0006ca
	cmpi.l	#$00000074,d0
	beq	L00076c
	cmpi.l	#$00000076,d0
	beq	L0008ce
	cmpi.l	#$00000077,d0
	beq	L000bde
	cmpi.l	#$00000079,d0
	beq	L000b54
L001036:
	cmp.l	#$00000021,d6
	ble	L00104c
	pea.l	(L002298,pc)
	bsr	L000038
	addq.l	#4,a7
	bra	L0005ce

L00104c:
	cmp.l	#$00000021,d6
	beq	L00105e
	subq.l	#1,(L0029cc)
	bra	L0005be

L00105e:
	move.l	(-$1028,a6),d0
	beq	L001090
	move.l	($0008,a6),d0
	add.l	#L0021f0,d0
	movea.l	d0,a0
	moveq.l	#$00,d0
	move.b	(a0),d0
	move.l	d0,-(a7)
	pea.l	(L0023b3,pc)
	pea.l	(L0043d0,pc)
	bsr	L001918
	lea.l	($000c,a7),a7
	pea.l	(L0043d0,pc)
	bsr	L000038
	addq.l	#4,a7
L001090:
	move.l	($0008,a6),d0
	asl.l	#2,d0
	add.l	#L002980,d0
	movea.l	d0,a0
	move.l	(-$1030,a6),(a0)
	move.l	#$000000f1,d0
	move.b	d0,(a5)+
	move.l	($0008,a6),d0
	asl.l	#2,d0
	add.l	#L0029a4,d0
	movea.l	d0,a0
	tst.l	(a0)
	beq	L0010ea
	move.l	($0008,a6),d0
	asl.l	#2,d0
	add.l	#L00295c,d0
	movea.l	d0,a0
	move.l	(-$1030,a6),d1
	move.l	(-$1034,a6),d2
	sub.l	d2,d1
	move.l	d1,(a0)
	move.l	(-$1038,a6),d0
	move.l	a5,d1
	addq.l	#2,d1
	sub.l	d1,d0
	move.l	d0,d7
	move.l	d0,d0
	asr.l	#8,d0
	move.b	d0,(a5)+
	bra	L0010fc

L0010ea:
	move.l	($0008,a6),d0
	asl.l	#2,d0
	add.l	#L00295c,d0
	movea.l	d0,a0
	clr.l	(a0)
	moveq.l	#$00,d7
L0010fc:
	move.l	d7,d0
	move.b	d0,(a5)+
	move.l	a5,d0
	movem.l	(a7)+,d4-d7/a4-a5
	unlk	a6
	rts

L00110a:
	link.w	a6,#-$00bc
	movem.l	d6-d7/a4-a5,-(a7)
	move.l	#$00000100,-(a7)
	clr.l	-(a7)
	pea.l	(L004430,pc)
	bsr	L0018f4
	lea.l	($000c,a7),a7
	clr.l	(L002958)
L00112c:
	move.l	#$00000040,-(a7)
	bsr	L000104
	addq.l	#4,a7
	tst.l	d0
	beq	L0012a0
	move.l	#$000000ff,-(a7)
	clr.l	-(a7)
	bsr	L0002b4
	addq.l	#8,a7
	move.l	d0,d6
	cmp.l	#$80000000,d0
	beq	L001292
	move.l	d6,d0
	add.l	#L004430,d0
	movea.l	d0,a0
	tst.b	(a0)
	beq	L001172
	pea.l	(L0023d0,pc)
	bsr	L000038
	addq.l	#4,a7
	bra	L00112c

L001172:
	move.l	#$0000003d,-(a7)
	bsr	L0001f4
	addq.l	#4,a7
	tst.l	d0
	bne	L001292
	bsr	L00006c
	cmp.l	#$0000007b,d0
	bne	L00119e
	moveq.l	#$01,d0
	move.b	d0,(L0021ee)
	addq.l	#1,(L0029cc)
L00119e:
	move.l	#$0000002f,-(a7)
	pea.l	(-$00bc,a6)
	bsr	L00025c
	addq.l	#8,a7
	tst.l	d0
	bne	L001292
	move.l	d6,d0
	add.l	#L004430,d0
	movea.l	d0,a0
	moveq.l	#$01,d0
	move.b	d0,(a0)
	move.l	d6,d0
	moveq.l	#$1a,d1
	movem.l	d0-d1,-(a7)
	FPACK	__CLMUL
	movem.l	(a7)+,d0-d1
	add.l	#L0029d0,d0
	movea.l	d0,a5
	move.l	(-$0008,a6),d0
	asl.l	#3,d0
	or.l	(-$000c,a6),d0
	move.b	d0,(a5)+
	move.l	(-$0004,a6),d0
	move.b	d0,(a5)+
	moveq.l	#$00,d6
L0011ec:
	cmp.l	#$0000002c,d6
	bge	L00126c
	cmp.l	#$0000000b,d6
	beq	L001204
	cmp.l	#$00000016,d6
	bne	L00120c
L001204:
	moveq.l	#$21,d0			;'!'
	move.l	d6,d1
	sub.l	d1,d0
	bra	L00120e

L00120c:
	move.l	d6,d0
L00120e:
	asl.l	#2,d0
	lea.l	(-$00bc,a6),a4
	adda.l	d0,a4
	move.l	a4,d0
	move.l	($0020,a4),d0
	asl.l	#4,d0
	or.l	($001c,a4),d0
	move.b	d0,(a5)
	move.l	($0014,a4),d0
	move.b	d0,($0004,a5)
	move.l	($0018,a4),d0
	asl.l	#6,d0
	or.l	(a4),d0
	move.b	d0,($0008,a5)
	move.l	($0028,a4),d0
	asl.l	#7,d0
	or.l	($0004,a4),d0
	move.b	d0,($000c,a5)
	move.l	($0024,a4),d0
	asl.l	#6,d0
	or.l	($0008,a4),d0
	move.b	d0,($0010,a5)
	move.l	($0010,a4),d0
	asl.l	#4,d0
	or.l	($000c,a4),d0
	move.b	d0,($0014,a5)
	add.l	#$0000000b,d6
	addq.l	#1,a5
	bra	L0011ec

L00126c:
	move.b	(L0021ee,pc),d0
	beq	L001288
	bsr	L00006c
	cmp.l	#$0000007d,d0
	beq	L001288
	pea.l	(L002298,pc)
	bsr	L000038
	addq.l	#4,a7
L001288:
	clr.b	(L0021ee)
	bra	L00112c

L001292:
	pea.l	(L0022b6,pc)
	bsr	L000038
	addq.l	#4,a7
	bra	L00112c

L0012a0:
	movem.l	(a7)+,d6-d7/a4-a5
	unlk	a6
	rts

L0012a8:
	link.w	a6,#$0000
	movem.l	d6-d7/a4-a5,-(a7)
	clr.l	(L002958)
	move.l	($0008,a6),-(a7)
	bsr	L0019a8
	addq.l	#4,a7
	move.l	d0,d6
L0012c2:
	move.l	#$00000023,-(a7)
	bsr	L000104
	addq.l	#4,a7
	tst.l	d0
	beq	L001334
	move.l	d6,-(a7)
	move.l	($0008,a6),-(a7)
	move.l	(L0029cc,pc),-(a7)
	bsr	L0019d8
	lea.l	($000c,a7),a7
	tst.l	d0
	bne	L001332
	move.l	(L0029cc,pc),d0
	add.l	d6,d0
	movea.l	d0,a5
L0012f0:
	cmpi.b	#$20,(a5)		;' '
	beq	L0012fc
	cmpi.b	#$09,(a5)
	bne	L001300
L0012fc:
	addq.l	#1,a5
	bra	L0012f0

L001300:
	cmpi.b	#$22,(a5)+		;'"'
	bne	L0012c2
	movea.l	($000c,a6),a4
	move.l	($0010,a6),d7
L00130e:
	cmpi.b	#$20,(a5)		;' '
	bcs	L001324
	cmpi.b	#$22,(a5)		;'"'
	beq	L001324
	move.l	d7,d0
	blt	L001324
	move.b	(a5)+,(a4)+
	subq.l	#1,d7
	bra	L00130e

L001324:
	clr.b	(a4)
	move.l	d7,d0
	bge	L00132e
	moveq.l	#$ff,d0
	bra	L001336

L00132e:
	moveq.l	#$01,d0
	bra	L001336

L001332:
	bra	L0012c2

L001334:
	moveq.l	#$00,d0
L001336:
	movem.l	(a7)+,d6-d7/a4-a5
	unlk	a6
	rts

L00133e:
	link.w	a6,#-$0224
	movem.l	d4-d7/a3-a5,-(a7)
	movea.l	($0008,a6),a5
	pea.l	(L0023df,pc)
	bsr	L00180e
	addq.l	#4,a7
L001354:
	tst.b	(a5)
	beq	L0013dc
	cmpi.b	#$20,(a5)		;' '
	beq	L001366
	cmpi.b	#$09,(a5)
	bne	L00136a
L001366:
	addq.l	#1,a5
	bra	L001354

L00136a:
	cmpi.b	#$2d,(a5)		;'-'
	beq	L001376
	cmpi.b	#$2f,(a5)		;'/'
	bne	L0013be
L001376:
	addq.l	#1,a5
	moveq.l	#$00,d0
	move.b	(a5),d0
	or.l	#$00000020,d0
	bra	L0013a8

L001384:
	move.l	#$00000001,(L0021e6)
	bra	L0013ba

L001390:
	move.l	#$fffffff4,(L0021ea)
	bra	L0013ba

L00139c:
	pea.l	(L002420,pc)
	bsr	L00001a
	addq.l	#4,a7
	bra	L0013ba

L0013a8:
	cmpi.l	#$0000006d,d0
	beq	L001384
	cmpi.l	#$00000078,d0
	beq	L001390
	bra	L00139c

L0013ba:
	addq.l	#1,a5
	bra	L0013d8

L0013be:
	lea.l	(L004530,pc),a4
L0013c2:
	tst.b	(a5)
	beq	L0013d6
	cmpi.b	#$20,(a5)		;' '
	beq	L0013d6
	cmpi.b	#$09,(a5)
	beq	L0013d6
	move.b	(a5)+,(a4)+
	bra	L0013c2

L0013d6:
	clr.b	(a4)
L0013d8:
	bra	L001354

L0013dc:
	tst.b	(L004530)
	bne	L0013ee
	pea.l	(L0021fa,pc)
	bsr	L00001a
	addq.l	#4,a7
L0013ee:
	pea.l	(L004530,pc)
	pea.l	(-$0100,a6)
	bsr	L00194a
	addq.l	#8,a7
	tst.l	d0
	bne	L00140e
	pea.l	(L00243e,pc)
	pea.l	(L004530,pc)
	bsr	L00197c
	addq.l	#8,a7
L00140e:
	pea.l	(L002443,pc)
	pea.l	(L004530,pc)
	pea.l	(-$0200,a6)
	bsr	L0019ba
	lea.l	($000c,a7),a7
	clr.l	-(a7)
	pea.l	(L004530,pc)
	bsr	L00182a
	addq.l	#8,a7
	move.l	d0,d6
	bge	L00143c
	pea.l	(L002447,pc)
	bsr	L00001a
	addq.l	#4,a7
L00143c:
	move.l	#$00000002,-(a7)
	clr.l	-(a7)
	move.l	d6,-(a7)
	bsr	L001874
	lea.l	($000c,a7),a7
	move.l	d0,d5
	move.l	d0,d0
	add.l	(L002954,pc),d0
	addq.l	#1,d0
	move.l	(L002950,pc),d1
	addq.l	#8,d1
	movea.l	d1,a1
	cmp.l	(a1),d0
	bls	L00146e
	pea.l	(L002467,pc)
	bsr	L00001a
	addq.l	#4,a7
L00146e:
	clr.l	-(a7)
	clr.l	-(a7)
	move.l	d6,-(a7)
	bsr	L001874
	lea.l	($000c,a7),a7
	move.l	d5,-(a7)
	move.l	(L002954,pc),-(a7)
	move.l	d6,-(a7)
	bsr	L001842
	lea.l	($000c,a7),a7
	move.l	d5,d0
	subq.l	#1,d0
	add.l	(L002954,pc),d0
	movea.l	d0,a0
	cmpi.b	#$1a,(a0)
	bne	L00149e
	subq.l	#1,d5
L00149e:
	move.l	(L002954,pc),d0
	add.l	d5,d0
	movea.l	d0,a0
	clr.b	(a0)
	move.l	d6,-(a7)
	bsr	L001838
	addq.l	#4,a7
	move.l	#$00000020,-(a7)
	pea.l	(-$0200,a6)
	bsr	L00181c
	addq.l	#8,a7
	move.l	d0,d6
	bge	L0014ce
	pea.l	(L002481,pc)
	bsr	L00001a
	addq.l	#4,a7
L0014ce:
	move.l	#$00000040,-(a7)
	pea.l	(-$0100,a6)
	pea.l	(L00249c,pc)
	bsr	L0012a8
	lea.l	($000c,a7),a7
	tst.l	d0
	ble	L001520
	pea.l	(-$0100,a6)
	pea.l	(L0024a2,pc)
	pea.l	(L0043d0,pc)
	bsr	L001918
	lea.l	($000c,a7),a7
	pea.l	(L0043d0,pc)
	bsr	L00180e
	addq.l	#4,a7
	pea.l	(-$0100,a6)
	bsr	L0019a8
	addq.l	#4,a7
	move.l	d0,-(a7)
	pea.l	(-$0100,a6)
	move.l	d6,-(a7)
	bsr	L001856
	lea.l	($000c,a7),a7
L001520:
	move.l	#$00000003,-(a7)
	pea.l	(L0024b7,pc)
	move.l	d6,-(a7)
	bsr	L001856
	lea.l	($000c,a7),a7
	move.l	#$00000016,-(a7)
	pea.l	(-$0100,a6)
	pea.l	(L0024bb,pc)
	bsr	L0012a8
	lea.l	($000c,a7),a7
	tst.l	d0
	ble	L001586
	pea.l	(-$0100,a6)
	pea.l	(L0024c3,pc)
	pea.l	(L0043d0,pc)
	bsr	L001918
	lea.l	($000c,a7),a7
	pea.l	(L0043d0,pc)
	bsr	L00180e
	addq.l	#4,a7
	pea.l	(-$0100,a6)
	bsr	L0019a8
	addq.l	#4,a7
	move.l	d0,-(a7)
	pea.l	(-$0100,a6)
	move.l	d6,-(a7)
	bsr	L001856
	lea.l	($000c,a7),a7
L001586:
	move.l	#$00000001,-(a7)
	pea.l	(L0024d8,pc)
	move.l	d6,-(a7)
	bsr	L001856
	lea.l	($000c,a7),a7
	lea.l	(L004644,pc),a3
	bsr	L00110a
	moveq.l	#$00,d5
L0015a4:
	cmp.l	#$00000009,d5
	bge	L0015d4
	move.l	d5,d0
	asl.l	#1,d0
	add.l	#L004632,d0
	movea.l	d0,a0
	move.l	a3,d1
	move.l	#L004630,d2
	sub.l	d2,d1
	move.w	d1,(a0)
	move.l	a3,-(a7)
	move.l	d5,-(a7)
	bsr	L00056c
	addq.l	#8,a7
	movea.l	d0,a3
	addq.l	#1,d5
	bra	L0015a4

L0015d4:
	move.l	a3,d0
	move.l	#L004630,d1
	sub.l	d1,d0
	move.w	d0,(L004630)
	moveq.l	#$00,d5
L0015e6:
	cmp.l	#$00000100,d5
	bge	L001638
	move.l	d5,d0
	add.l	#L004430,d0
	movea.l	d0,a0
	moveq.l	#$00,d0
	move.b	(a0),d0
	and.l	#$00000002,d0
	beq	L001634
	move.l	d5,d0
	move.b	d0,(a3)+
	move.l	#$0000001a,-(a7)
	move.l	d5,d0
	moveq.l	#$1a,d1
	movem.l	d0-d1,-(a7)
	FPACK	__CLMUL
	movem.l	(a7)+,d0-d1
	add.l	#L0029d0,d0
	move.l	d0,-(a7)
	move.l	a3,-(a7)
	bsr	L0018ae
	lea.l	($000c,a7),a7
	adda.l	#$0000001a,a3
L001634:
	addq.l	#1,d5
	bra	L0015e6

L001638:
	move.l	(L0021e2,pc),d0
	bne	L001656
	move.l	a3,d0
	sub.l	#L004630,d0
	move.l	d0,-(a7)
	pea.l	(L004630,pc)
	move.l	d6,-(a7)
	bsr	L001856
	lea.l	($000c,a7),a7
L001656:
	move.l	d6,-(a7)
	bsr	L001838
	addq.l	#4,a7
	move.l	(L0021e6,pc),d0
	bne	L0017ba
	pea.l	(L0024d9,pc)
	bsr	L00180e
	addq.l	#4,a7
	pea.l	(L00251c,pc)
	bsr	L00180e
	addq.l	#4,a7
	moveq.l	#$00,d5
L00167c:
	cmp.l	#$00000009,d5
	bge	L0016b0
	move.l	d5,d0
	asl.l	#2,d0
	add.l	#L002980,d0
	movea.l	d0,a0
	move.l	(a0),-(a7)
	pea.l	(L00252c,pc)
	pea.l	(L0043d0,pc)
	bsr	L001918
	lea.l	($000c,a7),a7
	pea.l	(L0043d0,pc)
	bsr	L00180e
	addq.l	#4,a7
	addq.l	#1,d5
	bra	L00167c

L0016b0:
	pea.l	(L002532,pc)
	bsr	L00180e
	addq.l	#4,a7
	moveq.l	#$00,d5
	move.l	d5,d4
L0016be:
	cmp.l	#$00000009,d5
	bge	L00172e
	move.l	d5,d0
	asl.l	#2,d0
	add.l	#L00295c,d0
	movea.l	d0,a0
	move.l	(a0),-(a7)
	pea.l	(L002542,pc)
	pea.l	(L0043d0,pc)
	bsr	L001918
	lea.l	($000c,a7),a7
	pea.l	(L0043d0,pc)
	bsr	L00180e
	addq.l	#4,a7
	move.l	d5,d0
	asl.l	#2,d0
	add.l	#L0029a4,d0
	movea.l	d0,a0
	tst.l	(a0)
	beq	L00172a
	move.l	d4,d0
	blt	L00172a
	move.l	d4,d0
	bne	L001716
	move.l	d5,d0
	asl.l	#2,d0
	add.l	#L00295c,d0
	movea.l	d0,a0
	move.l	(a0),d4
	bra	L00172a

L001716:
	move.l	d5,d0
	asl.l	#2,d0
	add.l	#L00295c,d0
	movea.l	d0,a0
	move.l	(a0),d0
	cmp.l	d4,d0
	beq	L00172a
	moveq.l	#$ff,d4
L00172a:
	addq.l	#1,d5
	bra	L0016be

L00172e:
	move.l	d4,d0
	bge	L00173c
	pea.l	(L002548,pc)
	bsr	L00180e
	addq.l	#4,a7
L00173c:
	pea.l	(L002574,pc)
	bsr	L00180e
	addq.l	#4,a7
	moveq.l	#$00,d5
L001748:
	cmp.l	#$00000100,d5
	bge	L0017b0
	move.l	d5,d0
	add.l	#L004430,d0
	movea.l	d0,a0
	moveq.l	#$00,d0
	move.b	(a0),d0
	and.l	#$00000002,d0
	beq	L0017ac
	move.l	d5,d0
	add.l	#L004430,d0
	movea.l	d0,a0
	moveq.l	#$00,d0
	move.b	(a0),d0
	and.l	#$00000001,d0
	beq	L001790
	move.l	d5,-(a7)
	pea.l	(L002584,pc)
	pea.l	(L0043d0,pc)
	bsr	L001918
	lea.l	($000c,a7),a7
	bra	L0017a2

L001790:
	move.l	d5,-(a7)
	pea.l	(L002588,pc)
	pea.l	(L0043d0,pc)
	bsr	L001918
	lea.l	($000c,a7),a7
L0017a2:
	pea.l	(L0043d0,pc)
	bsr.w	L00180e
	addq.l	#4,a7
L0017ac:
	addq.l	#1,d5
	bra	L001748

L0017b0:
	pea.l	(L00258e,pc)
	bsr.w	L00180e
	addq.l	#4,a7
L0017ba:
	move.l	(L0021e2,pc),d0
	beq	L0017f4
	move.l	(L0021e2,pc),-(a7)
	pea.l	(L002591,pc)
	pea.l	(L0043d0,pc)
	bsr	L001918
	lea.l	($000c,a7),a7
	pea.l	(L0043d0,pc)
	bsr.w	L00180e
	addq.l	#4,a7
	pea.l	(-$0200,a6)
	bsr	L00186a
	addq.l	#4,a7
	move.l	#$00000001,-(a7)
	bsr	L001886
	addq.l	#4,a7
L0017f4:
	clr.l	-(a7)
	bsr	L001886
	addq.l	#4,a7
	movem.l	(a7)+,d4-d7/a3-a5
	unlk	a6
	rts

L001804:
	move.l	($0004,a7),-(a7)
	DOS	_PRINT
	addq.l	#4,a7
	rts

L00180e:
	move.l	($0004,a7),-(a7)
	move.w	#$0001,-(a7)
	DOS	_CONCTRL
	addq.l	#6,a7
	rts

L00181c:
	move.w	($000a,a7),-(a7)
	move.l	($0006,a7),-(a7)
	DOS	_CREATE
	addq.l	#6,a7
	rts

L00182a:
	move.w	($000a,a7),-(a7)
	move.l	($0006,a7),-(a7)
	DOS	_OPEN
	addq.l	#6,a7
	rts

L001838:
	move.w	($0006,a7),-(a7)
	DOS	_CLOSE
	addq.l	#2,a7
	rts

L001842:
	move.l	($000c,a7),-(a7)
	move.l	($000c,a7),-(a7)
	move.w	($000e,a7),-(a7)
	DOS	_READ
	lea.l	($000a,a7),a7
	rts

L001856:
	move.l	($000c,a7),-(a7)
	move.l	($000c,a7),-(a7)
	move.w	($000e,a7),-(a7)
	DOS	_WRITE
	lea.l	($000a,a7),a7
	rts

L00186a:
	move.l	($0004,a7),-(a7)
	DOS	_DELETE
	addq.l	#4,a7
	rts

L001874:
	move.w	($000e,a7),-(a7)
	move.l	($000a,a7),-(a7)
	move.w	($000c,a7),-(a7)
	DOS	_SEEK
	addq.l	#8,a7
	rts

L001886:
	move.w	($0006,a7),-(a7)
	DOS	_EXIT2

L00188c:
	nop
L00188e:
	move.l	($0004,a7),d0
	bmi	L00189e
	rts

L001896:
	move.w	($0006,a7),d0
	ext.l	d0
	bge	L0018a0
L00189e:
	neg.l	d0
L0018a0:
	rts

L0018a2:
	nop
	movea.l	($0004,a7),a1
	movea.l	($0008,a7),a0
	bra	L0018b4

L0018ae:
	movem.l	($0004,a7),a0-a1
L0018b4:
	movea.l	a0,a2
	move.l	($000c,a7),d0
	ble	L0018e6
	move.l	d0,d1
	move.l	d0,d2
	subq.l	#1,d0
	move.l	d0,d1
	swap.w	d1
	cmpa.l	a0,a1
	beq	L0018e6
	bcs	L0018d8
L0018cc:
	move.b	(a1)+,(a0)+
	dbra	d0,L0018cc
	dbra	d1,L0018cc
	bra	L0018e6

L0018d8:
	adda.l	d2,a0
	adda.l	d2,a1
L0018dc:
	move.b	-(a1),-(a0)
	dbra	d0,L0018dc
	dbra	d1,L0018dc
L0018e6:
	move.l	a2,d0
	rts

L0018ea:
	move.l	($000c,a7),d2
	move.l	($0008,a7),d0
	bra	L0018fc

L0018f4:
	move.l	($0008,a7),d2
	move.l	($000c,a7),d0
L0018fc:
	ble	L001912
	movea.l	($0004,a7),a0
	subq.l	#1,d0
	move.l	d0,d1
	swap.w	d1
L001908:
	move.b	d2,(a0)+
	dbra	d0,L001908
	dbra	d1,L001908
L001912:
	move.l	($0004,a7),d0
	rts

L001918:
	pea.l	($000c,a7)
	move.l	($000c,a7),-(a7)
	pea.l	($000c,a7)
	pea.l	(L00193c)
	jsr	(L001acc)
	lea.l	($0010,a7),a7
	movea.l	($0004,a7),a0
	clr.b	(a0)
	rts

L00193c:
	movem.l	($0004,a7),d0/a0
	movea.l	(a0),a1
	move.b	d0,(a1)+
	move.l	a1,(a0)
	rts

L00194a:
	lea.l	(-$0080,a7),a7
	move.l	a7,-(a7)
	move.l	($008c,a7),-(a7)
	DOS	_NAMECK
	addq.l	#8,a7
	movea.l	($0084,a7),a0
	tst.l	d0
	bmi	L001972
	lea.l	($0056,a7),a1
	tst.b	(a1)+
	beq	L001972
	moveq.l	#$ff,d0
L00196a:
	addq.l	#1,d0
	move.b	(a1)+,(a0)+
	bne	L00196a
	bra	L001976

L001972:
	clr.b	(a0)
	clr.l	d0
L001976:
	lea.l	($0080,a7),a7
	rts

L00197c:
	movem.l	($0004,a7),a0-a1
	move.l	a0,d0
L001984:
	tst.b	(a0)+
	bne	L001984
	subq.l	#1,a0
L00198a:
	move.b	(a1)+,(a0)+
	bne	L00198a
	rts

L001990:
	movem.l	($0004,a7),a0-a1
	move.l	a1,d0
L001998:
	cmp.b	(a0),d0
	beq	L0019a4
	tst.b	(a0)+
	bne	L001998
	clr.l	d0
	rts

L0019a4:
	move.l	a0,d0
	rts

L0019a8:
	movea.l	($0004,a7),a0
	move.l	a0,d0
L0019ae:
	tst.b	(a0)+
	bne	L0019ae
	subq.l	#1,a0
	exg.l	d0,a0
	sub.l	a0,d0
	rts

L0019ba:
	movem.l	($0004,a7),a0-a2
L0019c0:
	move.b	(a1)+,(a0)+
	beq	L0019cc
	cmpi.b	#$2e,(-$0001,a0)	;'.'
	bne	L0019c0
L0019cc:
	move.b	#$2e,(-$0001,a0)	;'.'
L0019d2:
	move.b	(a2)+,(a0)+
	bne	L0019d2
	rts

L0019d8:
	clr.l	d0
	movea.l	($0004,a7),a0
	movea.l	($0008,a7),a1
	move.l	($000c,a7),d2
	ble	L0019fe
	clr.l	d1
L0019ea:
	move.b	(a0)+,d0
	move.b	(a1)+,d1
	beq	L0019fc
	sub.l	d1,d0
	bne	L0019fe
	subq.l	#1,d2
	bne	L0019ea
	clr.l	d0
	bra	L0019fe

L0019fc:
	sub.l	d1,d0
L0019fe:
	rts

L001a00:
	movea.l	($0004,a7),a0
	movea.l	($0008,a7),a2
	clr.l	d0
L001a0a:
	move.b	(a0)+,d1
	beq	L001ac6
	cmpi.b	#$09,d1
	beq	L001a0a
	cmpi.b	#$20,d1			;' '
	beq	L001a0a
	subq.l	#1,a0
	move.l	($000c,a7),d2
	bne	L001a4a
	cmpi.b	#$30,(a0)		;'0'
	bne	L001a48
	cmpi.b	#$58,($0001,a0)		;'X'
	beq	L001a3e
	cmpi.b	#$78,($0001,a0)		;'x'
	beq	L001a3e
	moveq.l	#$08,d2
	bra	L001a4a

L001a3e:
	adda.l	#$00000002,a0
	moveq.l	#$10,d2
	bra	L001a4a

L001a48:
	moveq.l	#$0a,d2
L001a4a:
	cmpi.l	#$00000001,d2
	beq	L001ac8
	cmpi.l	#$00000024,d2
	bhi	L001ac8
	cmpi.l	#$0000000a,d2
	bne	L001a76
	cmpi.b	#$2b,(a0)		;'+'
	beq	L001a74
	cmpi.b	#$2d,(a0)		;'-'
	bne	L001a76
	bsr	L001a74
	neg.w	d0
	rts

L001a74:
	addq.l	#1,a0
L001a76:
	clr.l	d1
	move.b	(a0)+,d1
	cmpi.b	#$30,d1			;'0'
	bcs	L001ac6
	cmpi.b	#$39,d1			;'9'
	bhi	L001a8c
	sub.b	#$30,d1			;'0'
	bra	L001aae

L001a8c:
	cmpi.b	#$41,d1			;'A'
	bcs	L001ac6
	cmpi.b	#$5a,d1			;'Z'
	bhi	L001a9e
	sub.b	#$37,d1			;'7'
	bra	L001aae

L001a9e:
	cmpi.b	#$61,d1			;'a'
	bcs	L001ac6
	cmpi.b	#$7a,d1			;'z'
	bhi	L001ac6
	sub.b	#$57,d1			;'W'
L001aae:
	cmp.b	d1,d2
	ble	L001ac6
	move.l	d1,-(a7)
	move.l	d0,d1
	swap.w	d0
	mulu.w	d2,d0
	mulu.w	d2,d1
	swap.w	d0
	clr.w	d0
	add.l	d1,d0
	add.l	(a7)+,d0
	bra	L001a76

L001ac6:
	subq.l	#1,a0
L001ac8:
	move.l	a0,(a2)
	rts

L001acc:
	movem.l	d3-d7/a3-a6,-(a7)
	lea.l	(-$026c,a7),a7
	movea.l	($0294,a7),a6
	movea.l	($02a0,a7),a5
	movea.l	($029c,a7),a4
	move.l	($0298,a7),d6
	clr.l	d7
L001ae6:
	clr.l	d4
	clr.l	d5
	movea.l	a7,a3
	bsr	L001b00
	btst.l	#$19,d4
	beq	L001ae6
	lea.l	($026c,a7),a7
	move.l	d7,d0
	movem.l	(a7)+,d3-d7/a3-a6
	rts

L001b00:
	move.b	(a4)+,d0
	bne	L001b0a
	bset.l	#$19,d4
	bra	L001b1a

L001b0a:
	movea.l	a4,a2
	cmpi.b	#$25,d0			;'%'
	bne	L001b16
	bsr	L001b1c
	bra	L001b1a

L001b16:
	bsr	L00211e
L001b1a:
	rts

L001b1c:
	move.b	(a4)+,d0
	bne	L001b26
	bset.l	#$19,d4
	rts

L001b26:
	cmpi.b	#$2d,d0			;'-'
	bne	L001b32
	bset.l	#$1f,d4
	bra	L001b1c

L001b32:
	cmpi.b	#$2b,d0			;'+'
	bne	L001b3e
	bset.l	#$1e,d4
	bra	L001b1c

L001b3e:
	cmpi.b	#$20,d0			;' '
	bne	L001b4a
	bset.l	#$16,d4
	bra	L001b1c

L001b4a:
	cmpi.b	#$23,d0			;'#'
	bne	L001b56
	bset.l	#$17,d4
	bra	L001b1c

L001b56:
	moveq.l	#$ff,d3
	cmpi.b	#$30,d0			;'0'
	bne	L001b64
	bset.l	#$1a,d4
	bra	L001b76

L001b64:
	cmpi.b	#$2a,d0			;'*'
	bne	L001b76
	move.l	(a5)+,d1
	move.w	d1,d3
	move.b	(a4)+,d0
	beq	L002118
	bra	L001b8e

L001b76:
	cmp.b	#$30,d0			;'0'
	bcs	L001b8e
	cmp.b	#$39,d0			;'9'
	bhi	L001b8e
	bsr	L002138
	bmi	L002118
	move.w	d0,d3
	swap.w	d0
L001b8e:
	cmpi.b	#$2e,d0			;'.'
	bne	L001bd0
	bset.l	#$1d,d4
	move.b	(a4)+,d0
	beq	L002118
	cmpi.b	#$2a,d0			;'*'
	bne	L001bb4
	move.l	(a5)+,d1
	swap.w	d3
	move.w	d1,d3
	swap.w	d3
	move.b	(a4)+,d0
	beq	L002118
	bra	L001bd0

L001bb4:
	cmp.b	#$30,d0			;'0'
	bcs	L001bd0
	cmp.b	#$39,d0			;'9'
	bhi	L001bd0
	bsr	L002138
	bmi	L002118
	swap.w	d3
	move.w	d0,d3
	swap.w	d3
	swap.w	d0
L001bd0:
	cmpi.b	#$6c,d0			;'l'
	beq	L001bdc
	cmpi.b	#$4c,d0			;'L'
	bne	L001be6
L001bdc:
	bset.l	#$1c,d4
	move.b	(a4)+,d0
	beq	L002118
L001be6:
	cmpi.b	#$41,d0			;'A'
	bcs	L002118
	cmpi.b	#$5a,d0			;'Z'
	bhi	L001bfe
	bset.l	#$1b,d4
	add.b	#$20,d0			;' '
	bra	L001c0e

L001bfe:
	cmpi.b	#$61,d0			;'a'
	bcs	L002118
	cmpi.b	#$7a,d0			;'z'
	bhi	L002118
L001c0e:
	cmpi.b	#$62,d0			;'b'
	bcs	L002118
	cmpi.b	#$63,d0			;'c'
	bcs	L001f9c
	cmpi.b	#$64,d0			;'d'
	bcs	L001eca
	cmpi.b	#$65,d0			;'e'
	bcs	L001f2e
	cmpi.b	#$68,d0			;'h'
	bcs	L001c58
	cmpi.b	#$6f,d0			;'o'
	beq	L001fa4
	cmpi.b	#$73,d0			;'s'
	beq	L001eee
	cmpi.b	#$75,d0			;'u'
	beq	L001f2e
	cmpi.b	#$78,d0			;'x'
	beq	L001fac
	bra	L002118

L001c58:
	clr.l	d2
	move.b	d0,d2
	move.l	(a5)+,d0
	move.l	(a5)+,d1
	cmpi.b	#$67,d2			;'g'
	beq	L001cfc
	cmpi.b	#$66,d2			;'f'
	beq	L001cba
	cmp.w	#$ffff,d3
	bne	L001c78
	move.w	#$0001,d3
L001c78:
	swap.w	d3
	cmp.w	#$ffff,d3
	bne	L001c84
	move.w	#$0006,d3
L001c84:
	move.w	d3,d2
	swap.w	d3
	bsr	L001d9c
	bsr	L001de2
L001c90:
	lea.l	($0001,a3),a0
	cmpi.b	#$2d,(a0)		;'-'
	beq	L001eba
	btst.l	#$1e,d4
	bne	L001cb2
	btst.l	#$16,d4
	beq	L001eba
	move.b	#$20,-(a0)		;' '
	bra	L001eba

L001cb2:
	move.b	#$2b,-(a0)		;'+'
	bra	L001eba

L001cba:
	cmp.w	#$ffff,d3
	bne	L001cc4
	move.w	#$0001,d3
L001cc4:
	swap.w	d3
	cmp.w	#$ffff,d3
	bne	L001cd0
	move.w	#$0006,d3
L001cd0:
	move.w	d3,d2
	swap.w	d3
	subq.l	#8,a7
	movea.l	a7,a0
	lea.l	($0004,a7),a1
	move.l	a1,-(a7)
	move.l	a0,-(a7)
	move.l	d2,-(a7)
	movem.l	d0-d1,-(a7)
	jsr	(L0021c2)
	lea.l	($0014,a7),a7
	movem.l	(a7)+,d1-d2
	movea.l	d0,a0
	bsr	L001e28
	bra	L001c90

L001cfc:
	cmp.w	#$ffff,d3
	bne	L001d06
	move.w	#$0001,d3
L001d06:
	swap.w	d3
	cmp.w	#$ffff,d3
	bne	L001d12
	move.w	#$000e,d3
L001d12:
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
	jsr	(L0021c2)
	lea.l	($0014,a7),a7
	movem.l	(a7)+,d1-d2
	movea.l	d0,a0
	subq.l	#1,d1
	cmp.w	#$fffc,d1
	blt	L001d4c
	move.l	d3,d0
	swap.w	d0
	cmp.w	d0,d1
	ble	L001d5c
L001d4c:
	movem.l	(a7)+,d0-d2
	bsr	L001d9c
	bsr	L001d6c
	bsr	L001de2
	bra	L001c90

L001d5c:
	addq.l	#1,d1
	lea.l	($000c,a7),a7
	bsr	L001e28
	bsr	L001d6c
	bra	L001c90

L001d6c:
	btst.l	#$17,d4
	bne	L001d9a
	clr.b	(a1)
	lea.l	($0001,a3),a0
L001d78:
	move.b	(a0)+,d0
	beq	L001d9a
	cmp.b	#$2e,d0			;'.'
	bne	L001d78
L001d82:
	move.b	-(a1),d0
	cmp.b	#$30,d0			;'0'
	beq	L001d82
	cmp.b	#$2e,d0			;'.'
	bne	L001d96
	btst.l	#$17,d4
	beq	L001d98
L001d96:
	addq.l	#1,a1
L001d98:
	clr.b	(a1)
L001d9a:
	rts

L001d9c:
	addq.w	#1,d2
	subq.l	#8,a7
	movea.l	a7,a0
	lea.l	($0004,a7),a1
	move.l	a1,-(a7)
	move.l	a0,-(a7)
	move.l	d2,-(a7)
	movem.l	d0-d1,-(a7)
	jsr	(L0021a2)
	movem.l	(a7)+,d1-d2
	lea.l	($000c,a7),a7
	or.l	d2,d1
	movem.l	(a7)+,d1-d2
	bne	L001dc8
	moveq.l	#$01,d1
L001dc8:
	movea.l	d0,a0
	lea.l	($0001,a3),a1
	tst.l	d2
	beq	L001dd6
	move.b	#$2d,(a1)+		;'-'
L001dd6:
	bsr	L001eae
	move.b	d0,(a1)+
	bsr	L001e84
	rts

L001de2:
	move.b	#$65,d0			;'e'
	btst.l	#$1b,d4
	beq	L001df0
	move.b	#$45,d0			;'E'
L001df0:
	move.b	d0,(a1)+
	move.b	#$2b,d0			;'+'
	subq.l	#1,d1
	tst.l	d1
	bpl	L001e02
	move.b	#$2d,d0			;'-'
	neg.l	d1
L001e02:
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

L001e28:
	lea.l	($0001,a3),a1
	tst.l	d2
	beq	L001e34
	move.b	#$2d,(a1)+		;'-'
L001e34:
	tst.l	d1
	bmi	L001e4a
	beq	L001e4a
	subq.l	#1,d1
L001e3c:
	bsr	L001eae
	move.b	d0,(a1)+
	dbra	d1,L001e3c
	bsr	L001e84
	clr.b	(a1)
	rts

L001e4a:
	neg.l	d1
	move.l	d3,d0
	swap.w	d0
	move.b	#$30,(a1)+		;'0'
	btst.l	#$17,d4
	bne	L001e5e
	tst.w	d0
	beq	L001e80
L001e5e:
	move.b	#$2e,(a1)+		;'.'
	tst.w	d0
	beq	L001e80
	subq.w	#1,d1
	bmi	L001e76
L001e6a:
	move.b	#$30,(a1)+		;'0'
	subq.w	#1,d0
	beq	L001e80
	dbra	d1,L001e6a
L001e76:
	move.l	d0,d1
L001e78:
	bsr	L001eae
	move.b	d0,(a1)+
	subq.w	#1,d1
	bne	L001e78
L001e80:
	clr.b	(a1)
	rts

L001e84:
	move.l	d3,d0
	swap.w	d0
	btst.l	#$17,d4
	bne	L001e92
	tst.w	d0
	ble	L001eac
L001e92:
	move.b	#$2e,(a1)+		;'.'
	subq.w	#1,d0
	bmi	L001eac
	movem.l	d1,-(a7)
	move.l	d0,d1
L001ea0:
	bsr	L001eae
	move.b	d0,(a1)+
	dbra	d1,L001ea0
	movem.l	(a7)+,d1
L001eac:
	rts

L001eae:
	move.b	(a0)+,d0
	bne	L001eb8
	move.b	#$30,d0			;'0'
	subq.l	#1,a0
L001eb8:
	rts

L001eba:
	movea.l	a0,a1
L001ebc:
	tst.b	(a1)+
	bne	L001ebc
	move.l	a1,d5
	sub.l	a0,d5
	subq.l	#1,d5
	bra	L002066

L001eca:
	cmp.w	#$ffff,d3
	bne	L001ed4
	move.w	#$0001,d3
L001ed4:
	swap.w	d3
	cmp.w	#$ffff,d3
	bne	L001ee0
	move.w	#$0001,d3
L001ee0:
	swap.w	d3
	lea.l	($0003,a5),a0
	tst.l	(a5)+
	moveq.l	#$01,d5
	bra	L002066

L001eee:
	move.l	(a5)+,d0
	bmi	L001efc
	bne	L001f02
	move.l	#L002192,d0
	bra	L001f02

L001efc:
	move.l	#L002199,d0
L001f02:
	movea.l	d0,a0
	movea.l	a0,a1
L001f06:
	tst.b	(a1)+
	bne	L001f06
	move.l	a1,d5
	sub.l	a0,d5
	subq.l	#1,d5
	cmp.w	#$ffff,d3
	bne	L001f18
	clr.w	d3
L001f18:
	swap.w	d3
	cmp.w	#$ffff,d3
	bne	L001f22
	move.w	d5,d3
L001f22:
	cmp.w	d3,d5
	bcs	L001f28
	move.w	d3,d5
L001f28:
	swap.w	d3
	bra	L002066

L001f2e:
	move.l	a3,-(a7)
	lea.l	(-$0022,a7),a7
	movea.l	a7,a0
	move.l	(a5)+,d1
	clr.l	d5
	cmpi.b	#$75,d0			;'u'
	beq	L001f64
	tst.l	d1
	bmi	L001f5c
	btst.l	#$1e,d4
	bne	L001f56
	btst.l	#$16,d4
	beq	L001f64
	move.b	#$20,(a3)+		;' '
	bra	L001f62

L001f56:
	move.b	#$2b,(a3)+		;'+'
	bra	L001f62

L001f5c:
	move.b	#$2d,(a3)+		;'-'
	neg.l	d1
L001f62:
	addq.l	#1,d5
L001f64:
	tst.l	d1
	beq	L001f96
	lea.l	(L002162),a1
L001f6e:
	move.l	(a1)+,d0
	cmp.l	d0,d1
	bcs	L001f6e
L001f74:
	moveq.l	#$2f,d2			;'/'
L001f76:
	addq.b	#1,d2
	sub.l	d0,d1
	bcc	L001f76
	add.l	d0,d1
	move.b	d2,(a0)+
	move.l	(a1)+,d0
	bne	L001f74
L001f84:
	clr.b	(a0)
	movea.l	a7,a0
	moveq.l	#$ff,d1
L001f8a:
	addq.w	#1,d1
	tst.b	(a0)+
	bne	L001f8a
	movea.l	a7,a0
	bra	L00202a

L001f96:
	move.b	#$30,(a0)+		;'0'
	bra	L001f84

L001f9c:
	move.l	#$00010001,d1
	bra	L001fb2

L001fa4:
	move.l	#$00030007,d1
	bra	L001fb2

L001fac:
	move.l	#$0004000f,d1
L001fb2:
	movem.l	a3,-(a7)
	clr.l	d5
	bclr.l	#$17,d4
	beq	L001fe8
	move.b	#$30,(a3)+		;'0'
	addq.w	#1,d5
	cmpi.w	#$0001,d1
	bne	L001fd0
	move.b	#$62,(a3)+		;'b'
	bra	L001fda

L001fd0:
	cmpi.w	#$000f,d1
	bne	L001fe8
	move.b	#$78,(a3)+		;'x'
L001fda:
	addq.w	#1,d5
	btst.l	#$1b,d4
	beq	L001fe8
	subi.b	#$20,(-$0001,a3)	;' '
L001fe8:
	movea.l	a7,a0
	lea.l	(-$0022,a7),a7
	move.l	(a5)+,d0
	clr.b	-(a0)
	move.l	d0,d2
	movem.l	d5,-(a7)
	clr.l	d5
L001ffa:
	addq.l	#1,d5
	and.b	d1,d2
	cmpi.b	#$09,d2
	bgt	L00200a
	add.b	#$30,d2			;'0'
	bra	L002018

L00200a:
	add.b	#$37,d2			;'7'
	btst.l	#$1b,d4
	bne	L002018
	add.b	#$20,d2			;' '
L002018:
	move.b	d2,-(a0)
	swap.w	d1
	lsr.l	d1,d0
	swap.w	d1
	move.l	d0,d2
	bne	L001ffa
	move.l	d5,d1
	movem.l	(a7)+,d5
L00202a:
	cmp.w	#$ffff,d3
	bne	L002034
	move.w	#$0001,d3
L002034:
	swap.w	d3
	cmp.w	#$ffff,d3
	bne	L002040
	move.w	#$0001,d3
L002040:
	move.w	d3,d0
	swap.w	d3
	sub.w	d1,d0
	ble	L002054
	subq.w	#1,d0
L00204a:
	move.b	#$30,(a3)+		;'0'
	addq.l	#1,d5
	dbra	d0,L00204a
L002054:
	addq.l	#1,d5
	move.b	(a0)+,(a3)+
	bne	L002054
	subq.l	#1,d5
	lea.l	($0022,a7),a7
	movem.l	(a7)+,a3
	movea.l	a3,a0
L002066:
	cmp.w	d3,d5
	bcs	L00206c
	move.w	d5,d3
L00206c:
	btst.l	#$1f,d4
	bne	L0020d6
	btst.l	#$1a,d4
	beq	L0020c2
	lea.l	(L00218f),a1
	move.b	(a0),d0
	cmp.b	#$30,d0			;'0'
	beq	L0020a0
	cmp.b	#$20,d0			;' '
	beq	L002098
	cmpi.b	#$2b,d0			;'+'
	beq	L002098
	cmpi.b	#$2d,d0			;'-'
	bne	L0020c8
L002098:
	bsr	L0020f6
	tst.b	(a0)+
	subq.w	#1,d5
	bra	L0020c8

L0020a0:
	move.b	($0001,a0),d0
	or.b	#$20,d0
	cmp.b	#$62,d0			;'b'
	beq	L0020b4
	cmp.b	#$78,d0			;'x'
	bne	L0020c8
L0020b4:
	bsr	L0020f6
	tst.b	(a0)+
	subq.w	#1,d5
	bsr	L0020f6
	tst.b	(a0)+
	subq.w	#1,d5
	bra	L0020c8

L0020c2:
	lea.l	(L00218e),a1
L0020c8:
	cmp.w	d3,d5
	bcc	L0020d6
	exg.l	a1,a0
L0020ce:
	bsr	L0020f6
	cmp.w	d3,d5
	bcs	L0020ce
	exg.l	a1,a0
L0020d6:
	tst.w	d5
	beq	L0020e6
	bsr	L0020f6
	tst.b	(a0)+
	tst.w	d3
	ble	L0020f4
	subq.w	#1,d5
	bne	L0020d6
L0020e6:
	tst.w	d3
	ble	L0020f4
	lea.l	(L00218e),a0
L0020f0:
	bsr	L0020f6
	bne	L0020f0
L0020f4:
	rts

L0020f6:
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

L002118:
	clr.l	d4
	movea.l	a2,a4
	move.b	(a4)+,d0
L00211e:
	lea.l	(-$0001,a4),a0
L002122:
	move.b	(a4)+,d0
	beq	L00212c
	cmpi.b	#$25,d0			;'%'
	bne	L002122
L00212c:
	tst.b	-(a4)
	move.l	a4,d5
	sub.l	a0,d5
	move.w	d5,d3
	bra	L002066

L002138:
	clr.l	d1
L00213a:
	cmpi.b	#$30,d0			;'0'
	bcs	L00215a
	cmpi.b	#$39,d0			;'9'
	bhi	L00215a
	andi.w	#$000f,d0
	add.w	d1,d1
	add.w	d1,d0
	lsl.w	#2,d1
	add.w	d0,d1
	move.b	(a4)+,d0
	bne	L00213a
	moveq.l	#$ff,d1
	rts

L00215a:
	swap.w	d0
	move.w	d1,d0
	clr.l	d1
	rts

L002162:
	.dc.b	$3b,$9a,$ca,$00,$05,$f5,$e1,$00,$00,$98,$96,$80,$00,$0f,$42,$40
	.dc.b	$00,$01,$86,$a0,$00,$00,$27,$10,$00,$00,$03,$e8,$00,$00,$00,$64
	.dc.b	$00,$00,$00,$0a,$00,$00,$00,$01,$00,$00,$00,$00
L00218e:
	.dc.b	$20
L00218f:
	.dc.b	$30,$0d,$00
L002192:
	.dc.b	'(NULL)',$00
L002199:
	.dc.b	'(ERROR)',$00,$00
L0021a2:
	movem.l	($0004,a7),d0-d2/a1-a2
	movea.l	#L0025ae,a0
	clr.b	(a0)
	cmp.l	#$00000135,d2
	bcc	L0021be
	FPACK	__ECVT
	move.l	d0,(a1)
	move.l	d1,(a2)
L0021be:
	move.l	a0,d0
	rts

L0021c2:
	movem.l	($0004,a7),d0-d2/a1-a2
	lea.l	(L0026e4),a0
	clr.b	(a0)
	cmp.l	#$00000135,d2
	bcc	L0021de
	FPACK	__FCVT
	move.l	d0,(a1)
	move.l	d1,(a2)
L0021de:
	move.l	a0,d0
	rts


	.data

L0021e2:
	.dc.l	$00000000
L0021e6:
	.dc.l	$00000000
L0021ea:
	.dc.l	$0000000c
L0021ee:
	.dc.b	$00,$00
L0021f0:
	.dc.b	'ABCDEFGHP',$00
L0021fa:
	.dc.b	'使い方: mxc [オプション] <MMLファイル>',$0d,$0a
	.dc.b	$09,'-m',$09,'ステータスメッセージを表示しない',$0d,$0a
	.dc.b	$09,'-x',$09,'オクターブの上下をX-BASICと同じにする',$0d,$0a,$00
L002274:
	.dc.b	'オクターブがオーバーフローしました',$00,$00
L002298:
	.dc.b	'コマンドが定義されていません',$00,$00
L0022b6:
	.dc.b	'パラメータの指定に誤りがあります',$00,$00
L0022d8:
	.dc.l	$00000030
L0022dc:
	.dc.b	$00,$00,$00,$09,$00,$00,$00,$0b,$00,$00,$00,$00,$00,$00,$00,$02
	.dc.b	$00,$00,$00,$04,$00,$00,$00,$05,$00,$00,$00,$07
L0022f8:
	.dc.b	'%-12s%4d: %s',$0d,$0a,$00
L002307:
	.dc.b	'音長の指定に誤りがあります',$00
L002322:
	.dc.b	'ノートが範囲を越えました',$00
L00233b:
	.dc.b	'再演奏コマンドの多重定義',$00
L002354:
	.dc.b	'&コマンドが無効です',$00
L002368:
	.dc.b	$27,'/',$27,'コマンドが無効です',$00
L00237e:
	.dc.b	$27,'/',$27,'コマンドの多重定義',$00
L002394:
	.dc.b	'ループコマンドが無効です',$00
L0023ad:
	.dc.b	$4f,$4e,$00
L0023b0:
	.dc.b	$4f,$46,$00
L0023b3:
	.dc.b	'Ch%cのループが閉じていません',$00
L0023d0:
	.dc.b	'音色の多重定義',$00
L0023df:
	.dc.b	'MML converter for mxdrv2  version 1.01 (c)1989 MFS soft, milk.',$0d,$0a,$00
L002420:
	.dc.b	$09,'オプションが間違っています',$0d,$0a,$00
L00243e:
	.dc.b	'.mml',$00
L002443:
	.dc.b	'mdx',$00
L002447:
	.dc.b	$09,'ファイルがオープンできません',$0d,$0a,$00
L002467:
	.dc.b	$09,'メモリが不足しています',$0d,$0a,$00
L002481:
	.dc.b	'ファイルが作成できません',$0d,$0a,$00
L00249c:
	.dc.b	'title',$00
L0024a2:
	.dc.b	'MDXタイトル : "%s"',$0d,$0a,$00
L0024b7:
	.dc.b	$0d,$0a
	.dc.b	$1a,$00
L0024bb:
	.dc.b	'pcmfile',$00
L0024c3:
	.dc.b	'PCMファイル : ',$27,'%s',$27,$0d,$0a,$00
L0024d8:
	.dc.b	$00
L0024d9:
	.dc.b	'               ChA   ChB   ChC   ChD   ChE   ChF   ChG   ChH   ChP',$00
L00251c:
	.dc.b	$0d,$0a
	.dc.b	'Clock counts:',$00
L00252c:
	.dc.b	' %05d',$00
L002532:
	.dc.b	$0d,$0a
	.dc.b	'Loop  counts:',$00
L002542:
	.dc.b	' %05d',$00
L002548:
	.dc.b	$0d,$0a
	.dc.b	'注意 : クロックカウントが一致していません',$00
L002574:
	.dc.b	$0d,$0a
	.dc.b	'使用音色番号:',$00
L002584:
	.dc.b	' %d',$00
L002588:
	.dc.b	' [%d]',$00
L00258e:
	.dc.b	$0d,$0a,$00
L002591:
	.dc.b	'%d 個のエラーがありました',$0d,$0a,$00,$00

	.bss

L0025ae:
	.ds.b	310
L0026e4:
	.ds.b	620
L002950:
	.ds.l	1
L002954:
	.ds.l	1
L002958:
	.ds.l	1
L00295c:
	.ds.b	36
L002980:
	.ds.b	36
L0029a4:
	.ds.b	36
L0029c8:
	.ds.l	1
L0029cc:
	.ds.l	1
L0029d0:
	.ds.b	6656
L0043d0:
	.ds.b	96
L004430:
	.ds.b	256
L004530:
	.ds.b	256
L004630:
	.ds.w	1
L004632:
	.ds.b	18
L004644:
	.ds.b	49132
L010630:

	.end	L000000
