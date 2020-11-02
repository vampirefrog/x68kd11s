;=============================================
;  Filename human302/bin/find.x
;
;
;  Base address 000000
;  Exec address 000000
;  Text size    00092a byte(s)
;  Data size    000350 byte(s)
;  Bss  size    0015f2 byte(s)
;  177 Labels
;
;  Commandline dis  -h -k -m68000 -q1 -B -M -w16 -o120 -ghuman302/bin/find.lab --overwrite human302/bin/find.x human302/bin/find.s
;          DIS version 3.16
;=============================================

	.include	inc/doscall.mac
	.include	inc/iocscall.mac
	.include	inc/fefunc.mac

	.cpu	68000

	.text

Start:
	lea.l	(L00226a),a7
	move.w	#$0001,(L000c90)
	lea.l	(L001a69),a2
	move.l	a2,(L000c86)
	clr.l	(L000c82)
	clr.l	(L000c8a)
	clr.b	(L001246)
	clr.b	(L001247)
	clr.b	(L001248)
	clr.b	(L001249)
	clr.b	(L00124a)
	clr.b	(L000ec2)
	clr.b	(L000fda)
	clr.b	(L0010f2)
	movea.l	(Start-$0000e0),a0
	addq.l	#1,a0
	lea.l	(L000c92),a1
	lea.l	(L000daa),a2
	bsr	L0004b2
	move.l	d0,(L000c7a)
	tst.l	d0
	beq	L00028e
	cmp.l	#$00000002,d0
	bhi	L00028e
	lea.l	(L000daa),a0
L00008a:
	tst.b	(a0)
	beq	L0000e8
	bsr	L00057e
L000092:
	move.b	(a0)+,d0
	beq	L00008a
	cmp.b	#$66,d0			;'f'
	beq	L0000c0
	cmp.b	#$6e,d0			;'n'
	beq	L0000ca
	cmp.b	#$6c,d0			;'l'
	beq	L0000d4
	cmp.b	#$76,d0			;'v'
	beq	L0000de
	cmp.b	#$63,d0			;'c'
	bne	L00028e
	move.b	#-$01,(L00124a)
	bra	L000092

L0000c0:
	move.b	#-$01,(L001246)
	bra	L000092

L0000ca:
	move.b	#-$01,(L001247)
	bra	L000092

L0000d4:
	move.b	#-$01,(L001248)
	bra	L000092

L0000de:
	move.b	#-$01,(L001249)
	bra	L000092

L0000e8:
	lea.l	(L000c92),a0
	move.b	(a0),d3
	tst.b	d3
	beq	L00028e
	cmp.b	#$22,d3			;'"'
	beq	L000106
	cmp.b	#$27,d3			;'''
	beq	L000106
	clr.b	d3
	bra	L000108

L000106:
	addq.l	#1,a0
L000108:
	movea.l	a0,a1
	lea.l	(L000ec2),a0
	bsr	L00055e
	bsr	L00056c
	adda.l	d0,a0
	tst.b	d3
	beq	L000126
	cmp.b	-(a0),d3
	bne	L00028e
	clr.b	(a0)
L000126:
	cmpi.l	#$00000001,(L000c7a)
	beq	L00014e
	lea.l	(L000c92),a0
	move.w	#$0001,d2
	bsr	L0007a0
	beq	L00014e
	movea.l	a0,a1
	lea.l	(L000fda),a0
	bsr	L00055e
L00014e:
	tst.b	(L000fda)
	beq.w	L0001d6
	lea.l	(L000fda),a0
	bsr	L0005e6
	move.w	#$0021,-(a7)		;'!'
	pea.l	(L000fda)
	pea.l	(L00120a)
	DOS	_FILES
	lea.l	($000a,a7),a7
	tst.l	d0
	bmi	L0001be
	lea.l	(L001228),a0
	bsr	L0007b4
	lea.l	(L0010f2),a0
	lea.l	(L000fda),a1
	bsr	L00055e
	bsr	L00075c
	lea.l	(L001228),a1
	bsr	L00055e
	clr.w	-(a7)
	pea.l	(L0010f2)
	DOS	_OPEN
	addq.l	#6,a7
	tst.l	d0
	bmi	L0002aa
	move.w	d0,(L000c8e)
	bra	L0001da

L0001be:
	pea.l	(L000fda)
	DOS	_OPEN
	addq.l	#6,a7
	tst.l	d0
	bmi	L0002b2
	move.w	d0,(L000c8e)
	bra	L0001da

L0001d6:
	bsr	L00090e
L0001da:
	lea.l	(L001669),a0
	move.l	a0,(L000c7e)
	clr.l	(L000c82)
	moveq.l	#$01,d3
	clr.b	d4
	clr.l	d5
	clr.l	d7
	tst.b	(L001248)
	beq	L000206
	lea.l	(L000ec2),a0
	bsr	L00057e
L000206:
	bsr	L0002e2
	tst.b	d4
	beq	L000216
	tst.b	(L001259)
	beq	L000224
L000216:
	bsr	L00031c
	bsr	L00039c
	addq.l	#1,d3
	tst.b	d4
	beq	L000206
L000224:
	subq.l	#1,d3
	bsr	L000428
	tst.b	(L000fda)
	beq	L00028a
	move.w	(L000c8e),-(a7)
	DOS	_CLOSE
	addq.l	#2,a7
	tst.b	(L0010f2)
	beq	L00028a
	pea.l	(L00120a)
	DOS	_NFILES
	addq.l	#4,a7
	tst.l	d0
	bmi	L00028a
	lea.l	(L001228),a0
	bsr	L0007b4
	lea.l	(L0010f2),a0
	bsr	L00075c
	lea.l	(L001228),a1
	bsr	L00055e
	clr.w	-(a7)
	pea.l	(L0010f2)
	DOS	_OPEN
	addq.l	#6,a7
	tst.l	d0
	bmi	L0002aa
	move.w	d0,(L000c8e)
	bra	L0001da

L00028a:
	clr.l	d0
	bra	L0002de

L00028e:
	lea.l	(L000956),a0
	bsr	L00056c
	move.l	d0,-(a7)
	move.l	a0,-(a7)
	move.w	#$0002,-(a7)
	DOS	_WRITE
	lea.l	($000a,a7),a7
	moveq.l	#$01,d0
	bra	L0002de

L0002aa:
	lea.l	(L000bbb),a0
	bra	L0002c8

L0002b2:
	lea.l	(L000be0),a0
	bra	L0002c8

L0002ba:
	lea.l	(L000c01),a0
	bra	L0002c8

L0002c2:
	lea.l	(L000c1c),a0
L0002c8:
	bsr	L00056c
	move.l	d0,-(a7)
	move.l	a0,-(a7)
	move.w	#$0002,-(a7)
	DOS	_WRITE
	lea.l	($000a,a7),a7
	move.w	#$0002,d0
L0002de:
	move.w	d0,-(a7)
	DOS	_EXIT2

L0002e2:
	lea.l	(L001259),a1
	clr.l	d2
L0002ea:
	bsr	L0007e6
	tst.l	d0
	bmi	L0002ba
	beq	L000314
	cmp.b	#$1a,d1
	beq	L000314
	cmp.b	#$0d,d1
	beq	L0002ea
	cmp.b	#$0a,d1
	beq	L000318
	cmp.l	#$000001ff,d2
	bhi	L0002ea
	move.b	d1,(a1)+
	addq.l	#1,d2
	bra	L0002ea

L000314:
	move.b	#-$01,d4
L000318:
	clr.b	(a1)
	rts

L00031c:
	move.l	d3,-(a7)
	lea.l	(L000ec2),a0
	bsr	L00056c
	move.l	d0,d3
	cmp.l	d0,d2
	bcs	L000382
	lea.l	(L001259),a1
	tst.b	(L001248)
	beq	L000356
	lea.l	(L001461),a0
	bsr	L00055e
	bsr	L00057e
	lea.l	(L001461),a1
	lea.l	(L000ec2),a0
L000356:
	move.l	d2,d1
	sub.l	d0,d1
L00035a:
	move.l	d3,d0
	bsr	L0005c4
	beq	L000388
	move.b	(a1)+,d6
	cmp.b	#$80,d6
	bcs	L00037e
	cmp.b	#$a0,d6
	bcs	L000376
	cmp.b	#$e0,d6
	bcs	L00037e
L000376:
	addq.l	#1,a1
	dbra	d1,L00037e
	bra	L000382

L00037e:
	dbra	d1,L00035a
L000382:
	clr.b	d6
	addq.l	#1,d7
	bra	L00038e

L000388:
	move.b	#-$01,d6
	addq.l	#1,d5
L00038e:
	tst.b	(L001249)
	beq	L000398
	not.b	d6
L000398:
	move.l	(a7)+,d3
	rts

L00039c:
	tst.b	(L00124a)
	bne	L000426
	tst.b	d6
	beq	L000426
	tst.b	(L001247)
	bne	L000418
	tst.b	(L001246)
	beq	L0003ec
	tst.b	(L0010f2)
	beq	L0003ec
	move.w	#$0017,d1
	lea.l	(L001228),a0
	bsr	L0008a8
	lea.l	(L001228),a0
	bsr	L00056c
	sub.w	d0,d1
	tst.w	d1
	beq	L0003ec
L0003e0:
	move.b	#$20,d0			;' '
	bsr	L00083c
	dbra	d1,L0003e0
L0003ec:
	lea.l	(L00124b),a0
	move.l	d3,d0
	bsr	L0008c8
	move.b	#$3a,(L001255)		;':'
	move.b	#$20,(L001256)		;' '
	clr.b	(L001257)
	lea.l	(L00124f),a0
	bsr	L0008a8
L000418:
	lea.l	(L001259),a0
	bsr	L0008a8
	bsr	L0008b4
L000426:
	rts

L000428:
	tst.b	(L00124a)
	beq.w	L0004b0
	lea.l	(L000c37),a0
	bsr	L0008a8
	lea.l	(L00124b),a0
	move.l	d5,d0
	bsr	L0008c8
	clr.b	(L001255)
	lea.l	(L00124e),a0
	bsr	L0008a8
	bsr	L0008b4
	lea.l	(L000c4d),a0
	bsr	L0008a8
	lea.l	(L00124b),a0
	move.l	d7,d0
	bsr	L0008c8
	clr.b	(L001255)
	lea.l	(L00124e),a0
	bsr	L0008a8
	bsr	L0008b4
	lea.l	(L000c63),a0
	bsr	L0008a8
	lea.l	(L00124b),a0
	move.l	d3,d0
	bsr	L0008c8
	clr.b	(L001255)
	lea.l	(L00124e),a0
	bsr	L0008a8
	bsr	L0008b4
L0004b0:
	rts

L0004b2:
	movem.l	d1/a0-a2,-(a7)
	clr.l	d1
L0004b8:
	bsr	L000544
	adda.l	d0,a0
	tst.b	(a0)
	beq	L000534
	move.b	(a0)+,d0
	cmp.b	#$2d,d0			;'-'
	beq	L0004d0
	cmp.b	#$2f,d0			;'/'
	bne	L0004e6
L0004d0:
	move.b	(a0)+,d0
	beq	L000534
	cmp.b	#$09,d0
	beq	L0004e2
	cmp.b	#$20,d0			;' '
	beq	L0004e2
	move.b	d0,(a2)+
L0004e2:
	clr.b	(a2)+
	bra	L0004b8

L0004e6:
	addq.l	#1,d1
L0004e8:
	move.b	d0,(a1)+
	cmp.b	#$22,d0			;'"'
	bne	L0004fe
L0004f0:
	move.b	(a0)+,d0
	beq	L000534
	move.b	d0,(a1)+
	cmp.b	#$22,d0			;'"'
	bne	L0004f0
	bra	L000510

L0004fe:
	cmp.b	#$27,d0			;'''
	bne	L000510
L000504:
	move.b	(a0)+,d0
	beq	L000534
	move.b	d0,(a1)+
	cmp.b	#$27,d0			;'''
	bne	L000504
L000510:
	move.b	(a0),d0
	beq	L000534
	cmp.b	#$2f,d0			;'/'
	beq	L000530
	cmp.b	#$2d,d0			;'-'
	beq	L000530
	addq.l	#1,a0
	cmp.b	#$09,d0
	beq	L000530
	cmp.b	#$20,d0			;' '
	beq	L000530
	bra	L0004e8

L000530:
	clr.b	(a1)+
	bra	L0004b8

L000534:
	clr.b	(a1)+
	clr.b	(a1)
	clr.b	(a2)+
	clr.b	(a2)
	move.l	d1,d0
	movem.l	(a7)+,d1/a0-a2
	rts

L000544:
	move.l	a0,-(a7)
L000546:
	move.b	(a0)+,d0
	cmpi.b	#$20,d0			;' '
	beq	L000546
	cmpi.b	#$09,d0
	beq	L000546
	move.l	a0,d0
	movea.l	(a7)+,a0
	sub.l	a0,d0
	subq.l	#1,d0
	rts

L00055e:
	movem.l	a0-a1,-(a7)
L000562:
	move.b	(a1)+,(a0)+
	bne	L000562
	movem.l	(a7)+,a0-a1
	rts

L00056c:
	move.l	a0,-(a7)
	moveq.l	#$ff,d0
L000570:
	addi.l	#$00000001,d0
	tst.b	(a0)+
	bne	L000570
	movea.l	(a7)+,a0
	rts

L00057e:
	movem.l	d0-d1/a0,-(a7)
	clr.b	d1
L000584:
	move.b	(a0),d0
	beq	L0005be
	tst.b	d1
	beq	L000590
	clr.b	d1
	bra	L0005a6

L000590:
	cmp.b	#$80,d0
	bcs	L0005aa
	cmp.b	#$a0,d0
	bcs	L0005a2
	cmp.b	#$e0,d0
	bcs	L0005aa
L0005a2:
	move.b	#$01,d1
L0005a6:
	addq.l	#1,a0
	bra	L000584

L0005aa:
	cmpi.b	#$41,d0			;'A'
	bcs	L0005ba
	cmpi.b	#$5a,d0			;'Z'
	bhi	L0005ba
	add.b	#$20,d0			;' '
L0005ba:
	move.b	d0,(a0)+
	bra	L000584

L0005be:
	movem.l	(a7)+,d0-d1/a0
	rts

L0005c4:
	movem.l	a0-a1,-(a7)
	bra	L0005ce

L0005ca:
	cmpm.b	(a0)+,(a1)+
	bne	L0005d6
L0005ce:
	dbra	d0,L0005ca
	clr.l	d0
	bra	L0005de

L0005d6:
	bcs	L0005dc
	moveq.l	#$01,d0
	bra	L0005de

L0005dc:
	moveq.l	#$ff,d0
L0005de:
	tst.l	d0
	movem.l	(a7)+,a0-a1
	rts

L0005e6:
	link.w	a6,#-$003c
	movem.l	d0-d6/a1-a2,-(a7)
	move.w	#$ffff,d2
	movea.l	a0,a1
	bsr	L00056c
	move.w	d0,d1
	tst.w	d1
	beq	L00073c
	clr.b	d3
L000602:
	move.b	(a1)+,d4
	beq	L000638
	tst.b	d3
	beq	L000620
	cmp.b	#$01,d3
	beq	L00061a
	cmp.b	#$2e,d4			;'.'
	beq	L000620
	clr.b	d3
	bra	L000620

L00061a:
	move.b	#$02,d3
	bra	L000602

L000620:
	cmp.b	#$80,d4
	bcs	L000602
	cmp.b	#$a0,d4
	bcs	L000632
	cmp.b	#$e0,d4
	bcs	L000602
L000632:
	move.b	#$01,d3
	bra	L000602

L000638:
	subq.l	#1,a1
	tst.b	d3
	bne	L00065a
	cmpi.b	#$5c,(-$0001,a1)	;'\'
	bne	L00065a
	cmp.w	#$0001,d1
	beq	L00073c
	cmpi.b	#$3a,(-$0002,a1)	;':'
	beq	L00073c
	clr.b	-(a1)
L00065a:
	cmpi.b	#$3a,(-$0001,a1)	;':'
	beq	L00073c
	cmpi.b	#$2e,(-$0001,a1)	;'.'
	bne	L000692
	tst.b	d3
	bne	L000692
	cmp.w	#$0001,d1
	beq	L000686
	cmpi.b	#$3a,(-$0002,a1)	;':'
	beq	L000686
	cmpi.b	#$5c,(-$0002,a1)	;'\'
	bne	L000692
L000686:
	move.b	#$2a,(-$0001,a1)	;'*'
	move.b	#$2e,(a1)+		;'.'
	clr.b	(a1)
L000692:
	movea.l	a0,a2
L000694:
	move.b	(a2)+,d0
	beq	L0006a6
	cmp.b	#$2a,d0			;'*'
	beq	L0006c2
	cmp.b	#$3f,d0			;'?'
	beq	L0006c2
	bra	L000694

L0006a6:
	move.w	#$0010,-(a7)
	move.l	a0,-(a7)
	pea.l	(-$003c,a6)
	DOS	_FILES
	lea.l	($000a,a7),a7
	tst.l	d0
	bmi	L0006c2
	btst.b	#$04,(-$0027,a6)
	bne	L000738
L0006c2:
	clr.b	d3
	movea.l	a0,a2
	clr.b	d5
	clr.b	d6
L0006ca:
	move.b	(a2)+,d0
	beq	L000730
	tst.b	d3
	beq	L0006d6
	clr.b	d3
	bra	L0006ca

L0006d6:
	cmp.b	#$80,d0
	bcs	L0006f2
	cmp.b	#$a0,d0
	bcs	L0006e8
	cmp.b	#$e0,d0
	bcs	L0006f2
L0006e8:
	move.b	#$01,d3
	move.b	#$20,d5			;' '
	bra	L0006ca

L0006f2:
	cmp.b	#$2e,d0			;'.'
	bne	L000712
	tst.b	d5
	beq	L00070e
	cmp.b	#$3a,d5			;':'
	beq	L00070e
	cmp.b	#$5c,d5			;'\'
	beq	L00070e
	cmp.b	#$2e,d5			;'.'
	bne	L000712
L00070e:
	tst.b	(a2)
	beq	L000738
L000712:
	cmpi.b	#$5c,(a2)		;'\'
	bne	L00071e
	tst.b	($0001,a2)
	beq	L00073c
L00071e:
	move.b	d0,d5
	cmp.b	#$2e,d0			;'.'
	beq	L00072c
	cmp.b	#$5c,d0			;'\'
	bne	L0006ca
L00072c:
	move.b	d0,d6
	bra	L0006ca

L000730:
	cmp.b	#$2e,d6			;'.'
	beq	L000754
	bra	L000742

L000738:
	move.b	#$5c,(a1)+		;'\'
L00073c:
	move.b	#$2a,(a1)+		;'*'
	clr.w	d2
L000742:
	move.b	#$2e,(a1)+		;'.'
	move.b	#$2a,(a1)+		;'*'
	tst.w	d2
	beq	L000752
	clr.b	(-$0001,a1)
L000752:
	clr.b	(a1)
L000754:
	movem.l	(a7)+,d0-d6/a1-a2
	unlk	a6
	rts

L00075c:
	movem.l	d0-d1,-(a7)
	clr.b	d1
	move.l	a0,-(a7)
L000764:
	move.b	(a0)+,d0
	beq	L000798
	tst.b	d1
	beq	L000770
	clr.b	d1
	bra	L000764

L000770:
	cmp.b	#$80,d0
	bcs	L000788
	cmp.b	#$a0,d0
	bcs	L000782
	cmp.b	#$e0,d0
	bcs	L000788
L000782:
	move.b	#$01,d1
	bra	L000764

L000788:
	cmp.b	#$5c,d0			;'\'
	beq	L000794
	cmp.b	#$3a,d0			;':'
	bne	L000764
L000794:
	move.l	a0,(a7)
	bra	L000764

L000798:
	movea.l	(a7)+,a0
	movem.l	(a7)+,d0-d1
	rts

L0007a0:
	tst.w	d2
	beq	L0007b0
	tst.b	(a0)
	beq	L0007b2
L0007a8:
	tst.b	(a0)+
	bne	L0007a8
	subq.w	#1,d2
	bra	L0007a0

L0007b0:
	tst.b	(a0)
L0007b2:
	rts

L0007b4:
	tst.b	(L00124a)
	bne	L0007c4
	tst.b	(L001246)
	bne	L0007e4
L0007c4:
	move.l	a0,-(a7)
	lea.l	(L000b91),a0
	bsr	L0008a8
	movea.l	(a7)+,a0
	bsr	L0008a8
	lea.l	(L000ba6),a0
	bsr	L0008a8
	bsr	L0008b4
L0007e4:
	rts

L0007e6:
	movem.l	d2/a1,-(a7)
	movea.l	(L000c7e),a1
	move.l	(L000c82),d2
	tst.l	d2
	bne	L00081e
	move.l	#$00000400,-(a7)
	pea.l	(L001669)
	move.w	(L000c8e),-(a7)
	DOS	_READ
	lea.l	($000a,a7),a7
	lea.l	(L001669),a1
	tst.l	d0
	bls	L000824
	move.l	d0,d2
L00081e:
	move.b	(a1)+,d1
	subq.l	#1,d2
	moveq.l	#$01,d0
L000824:
	move.l	a1,(L000c7e)
	move.l	d2,(L000c82)
	movem.l	(a7)+,d2/a1
	rts

L000836:
	movem.l	d1/a1,-(a7)
	bra	L000866

L00083c:
	movem.l	d1/a1,-(a7)
	movea.l	(L000c86),a1
	move.l	(L000c8a),d1
	move.b	d0,(a1)+
	addq.l	#1,d1
	move.l	a1,(L000c86)
	move.l	d1,(L000c8a)
	moveq.l	#$01,d0
	cmp.l	#$00000400,d1
	bne	L0008a2
L000866:
	move.l	(L000c8a),d1
	tst.l	d1
	beq	L0008a2
	move.l	d1,-(a7)
	pea.l	(L001a69)
	move.w	(L000c90),-(a7)
	DOS	_WRITE
	lea.l	($000a,a7),a7
	tst.l	d0
	bmi	L0002c2
	lea.l	(L001a69),a1
	move.l	a1,(L000c86)
	move.l	#$00000000,(L000c8a)
	moveq.l	#$01,d0
L0008a2:
	movem.l	(a7)+,d1/a1
	rts

L0008a8:
	move.b	(a0)+,d0
	beq	L0008b2
	bsr	L00083c
	tst.l	d0
	bpl	L0008a8
L0008b2:
	rts

L0008b4:
	move.b	#$0d,d0
	bsr	L00083c
	move.b	#$0a,d0
	bsr	L00083c
	bsr	L000836
	rts

L0008c8:
	movem.l	d0-d2/a0-a1,-(a7)
	movem.l	a0,-(a7)
	lea.l	(L00092a),a1
L0008d6:
	clr.b	d2
	move.l	(a1)+,d1
	beq	L0008ec
L0008dc:
	addq.b	#1,d2
	sub.l	d1,d0
	bcc	L0008dc
	add.l	d1,d0
	add.b	#$2f,d2			;'/'
	move.b	d2,(a0)+
	bra	L0008d6

L0008ec:
	clr.b	(a0)
	movem.l	(a7)+,a0
L0008f2:
	move.b	(a0)+,d0
	beq	L000908
	cmp.b	#$30,d0			;'0'
	bne	L000908
	tst.b	(a0)
	beq	L000908
	move.b	#$20,(-$0001,a0)	;' '
	bra	L0008f2

L000908:
	movem.l	(a7)+,d0-d2/a0-a1
	rts

L00090e:
	clr.w	-(a7)
	DOS	_DUP
	tst.l	d0
	bmi	L0002ba
	move.w	d0,(L000c8e)
	DOS	_CLOSE
	move.w	#$0002,(a7)
	DOS	_DUP
	addq.l	#2,a7
	rts


	.data

L00092a:
	.dc.l	$3b9aca00,$05f5e100,$00989680,$000f4240
	.dc.l	$000186a0,$00002710,$000003e8,$00000064
	.dc.l	$0000000a,$00000001,$00000000
L000956:
	.dc.b	'X68k Find v1.01 Copyright 1989 SHARP/Hudson',$0d,$0a
	.dc.b	'使用法：find［スイッチ］"検索文字列"［ファイル名］',$0d,$0a
	.dc.b	$09,'/n',$09,'行頭にファイル名や行番号を付けない',$0d,$0a
	.dc.b	$09,'/f',$09,'１ファイル検索毎にファイル名を表示しない',$0d,$0a
	.dc.b	$09,'/l',$09,'半角英数字の大文字、小文字を区別しない',$0d,$0a
	.dc.b	$09,'/v',$09,'検索文字列を含まない行を表示する',$0d,$0a
	.dc.b	$09,'/c',$09,'検索集計結果のみを表示する',$0d,$0a
	.dc.b	$0d,$0a
	.dc.b	$09,'/fのスイッチを付けた場合行頭にファイル名を表示する',$0d,$0a
	.dc.b	$09,'/cのスイッチを付けた場合 /n,/f,/v のスイッチは無視する',$0d,$0a
	.dc.b	$09,'検索文字列にスペ－スかタブが入る時は " か ',$27,' でかこむ',$0d,$0a
	.dc.b	$09,'ファイルを指定しない場合、標準入力から入力する',$0d,$0a
	.dc.b	$09,'標準入力やデバイスから入力する場合ファイル名は付かない',$0d,$0a,$00
L000b91:
	.dc.b	'==================  ',$00
L000ba6:
	.dc.b	'  ==================',$00
L000bbb:
	.dc.b	'find: ファイルがオ－プンできません',$0d,$0a,$00
L000be0:
	.dc.b	'find: ファイルが見つかりません',$0d,$0a,$00
L000c01:
	.dc.b	'find: 読み込みできません',$0d,$0a,$00
L000c1c:
	.dc.b	'find: 書き込みできません',$0d,$0a,$00
L000c37:
	.dc.b	'文字列を含む行数    :',$00
L000c4d:
	.dc.b	'文字列を含まない行数:',$00
L000c63:
	.dc.b	'全体の行数          :',$00,$00

	.bss

L000c7a:
	.ds.l	1
L000c7e:
	.ds.l	1
L000c82:
	.ds.l	1
L000c86:
	.ds.l	1
L000c8a:
	.ds.l	1
L000c8e:
	.ds.w	1
L000c90:
	.ds.w	1
L000c92:
	.ds.b	280
L000daa:
	.ds.b	280
L000ec2:
	.ds.b	280
L000fda:
	.ds.b	280
L0010f2:
	.ds.b	280
L00120a:
	.ds.b	30
L001228:
	.ds.b	30
L001246:
	.ds.b	1
L001247:
	.ds.b	1
L001248:
	.ds.b	1
L001249:
	.ds.b	1
L00124a:
	.ds.b	1
L00124b:
	.ds.b	3
L00124e:
	.ds.b	1
L00124f:
	.ds.b	6
L001255:
	.ds.b	1
L001256:
	.ds.b	1
L001257:
	.ds.b	2
L001259:
	.ds.b	520
L001461:
	.ds.b	520
L001669:
	.ds.b	1024
L001a69:
	.ds.b	2049
L00226a:
	.ds.b	2
End:

	.end	Start
