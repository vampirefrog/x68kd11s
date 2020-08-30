;=============================================
;  Filename find.x
;
;
;  Base address 000000
;  Exec address 000000
;  Text size    00092a byte(s)
;  Data size    000350 byte(s)
;  Bss  size    0015f2 byte(s)
;  177 Labels
;
;  Commandline dis  -b2 -h -m68000 --sp -q1 -B -M -o120 -gfind.lab --overwrite find.x find.s
;          DIS version 3.16
;=============================================

	.include	inc/doscall.mac
	.include	inc/iocscall.mac
	.include	inc/fefunc.mac

	.cpu	68000

	.text

Start:
	lea.l	(L00226a),sp
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
	bsr.w	L0004b2
	move.l	d0,(L000c7a)
	tst.l	d0
	beq.w	L00028e
	cmp.l	#$00000002,d0
	bhi.w	L00028e
	lea.l	(L000daa),a0
L00008a:
	tst.b	(a0)
	beq.s	L0000e8
	bsr.w	L00057e
L000092:
	move.b	(a0)+,d0
	beq.s	L00008a
	cmp.b	#$66,d0			;'f'
	beq.s	L0000c0
	cmp.b	#$6e,d0			;'n'
	beq.s	L0000ca
	cmp.b	#$6c,d0			;'l'
	beq.s	L0000d4
	cmp.b	#$76,d0			;'v'
	beq.s	L0000de
	cmp.b	#$63,d0			;'c'
	bne.w	L00028e
	move.b	#-$01,(L00124a)
	bra.s	L000092

L0000c0:
	move.b	#-$01,(L001246)
	bra.s	L000092

L0000ca:
	move.b	#-$01,(L001247)
	bra.s	L000092

L0000d4:
	move.b	#-$01,(L001248)
	bra.s	L000092

L0000de:
	move.b	#-$01,(L001249)
	bra.s	L000092

L0000e8:
	lea.l	(L000c92),a0
	move.b	(a0),d3
	tst.b	d3
	beq.w	L00028e
	cmp.b	#$22,d3			;'"'
	beq.s	L000106
	cmp.b	#$27,d3			;'''
	beq.s	L000106
	clr.b	d3
	bra.s	L000108

L000106:
	addq.l	#1,a0
L000108:
	movea.l	a0,a1
	lea.l	(L000ec2),a0
	bsr.w	L00055e
	bsr.w	L00056c
	adda.l	d0,a0
	tst.b	d3
	beq.s	L000126
	cmp.b	-(a0),d3
	bne.w	L00028e
	clr.b	(a0)
L000126:
	cmpi.l	#$00000001,(L000c7a)
	beq.s	L00014e
	lea.l	(L000c92),a0
	move.w	#$0001,d2
	bsr.w	L0007a0
	beq.s	L00014e
	movea.l	a0,a1
	lea.l	(L000fda),a0
	bsr.w	L00055e
L00014e:
	tst.b	(L000fda)
	beq.w	L0001d6
	lea.l	(L000fda),a0
	bsr.w	L0005e6
	move.w	#$0021,-(sp)		;'!'
	pea.l	(L000fda)
	pea.l	(L00120a)
	DOS	_FILES
	lea.l	($000a,sp),sp
	tst.l	d0
	bmi.s	L0001be
	lea.l	(L001228),a0
	bsr.w	L0007b4
	lea.l	(L0010f2),a0
	lea.l	(L000fda),a1
	bsr.w	L00055e
	bsr.w	L00075c
	lea.l	(L001228),a1
	bsr.w	L00055e
	clr.w	-(sp)
	pea.l	(L0010f2)
	DOS	_OPEN
	addq.l	#6,sp
	tst.l	d0
	bmi.w	L0002aa
	move.w	d0,(L000c8e)
	bra.s	L0001da

L0001be:
	pea.l	(L000fda)
	DOS	_OPEN
	addq.l	#6,sp
	tst.l	d0
	bmi.w	L0002b2
	move.w	d0,(L000c8e)
	bra.s	L0001da

L0001d6:
	bsr.w	L00090e
L0001da:
	lea.l	(L001669),a0
	move.l	a0,(L000c7e)
	clr.l	(L000c82)
	moveq.l	#$01,d3
	clr.b	d4
	clr.l	d5
	clr.l	d7
	tst.b	(L001248)
	beq.s	L000206
	lea.l	(L000ec2),a0
	bsr.w	L00057e
L000206:
	bsr.w	L0002e2
	tst.b	d4
	beq.s	L000216
	tst.b	(L001259)
	beq.s	L000224
L000216:
	bsr.w	L00031c
	bsr.w	L00039c
	addq.l	#1,d3
	tst.b	d4
	beq.s	L000206
L000224:
	subq.l	#1,d3
	bsr.w	L000428
	tst.b	(L000fda)
	beq.s	L00028a
	move.w	(L000c8e),-(sp)
	DOS	_CLOSE
	addq.l	#2,sp
	tst.b	(L0010f2)
	beq.s	L00028a
	pea.l	(L00120a)
	DOS	_NFILES
	addq.l	#4,sp
	tst.l	d0
	bmi.s	L00028a
	lea.l	(L001228),a0
	bsr.w	L0007b4
	lea.l	(L0010f2),a0
	bsr.w	L00075c
	lea.l	(L001228),a1
	bsr.w	L00055e
	clr.w	-(sp)
	pea.l	(L0010f2)
	DOS	_OPEN
	addq.l	#6,sp
	tst.l	d0
	bmi.s	L0002aa
	move.w	d0,(L000c8e)
	bra.w	L0001da

L00028a:
	clr.l	d0
	bra.s	L0002de

L00028e:
	lea.l	(L000956),a0
	bsr.w	L00056c
	move.l	d0,-(sp)
	move.l	a0,-(sp)
	move.w	#$0002,-(sp)
	DOS	_WRITE
	lea.l	($000a,sp),sp
	moveq.l	#$01,d0
	bra.s	L0002de

L0002aa:
	lea.l	(L000bbb),a0
	bra.s	L0002c8

L0002b2:
	lea.l	(L000be0),a0
	bra.s	L0002c8

L0002ba:
	lea.l	(L000c01),a0
	bra.s	L0002c8

L0002c2:
	lea.l	(L000c1c),a0
L0002c8:
	bsr.w	L00056c
	move.l	d0,-(sp)
	move.l	a0,-(sp)
	move.w	#$0002,-(sp)
	DOS	_WRITE
	lea.l	($000a,sp),sp
	move.w	#$0002,d0
L0002de:
	move.w	d0,-(sp)
	DOS	_EXIT2

L0002e2:
	lea.l	(L001259),a1
	clr.l	d2
L0002ea:
	bsr.w	L0007e6
	tst.l	d0
	bmi.s	L0002ba
	beq.s	L000314
	cmp.b	#$1a,d1
	beq.s	L000314
	cmp.b	#$0d,d1
	beq.s	L0002ea
	cmp.b	#$0a,d1
	beq.s	L000318
	cmp.l	#$000001ff,d2
	bhi.s	L0002ea
	move.b	d1,(a1)+
	addq.l	#1,d2
	bra.s	L0002ea

L000314:
	move.b	#-$01,d4
L000318:
	clr.b	(a1)
	rts

L00031c:
	move.l	d3,-(sp)
	lea.l	(L000ec2),a0
	bsr.w	L00056c
	move.l	d0,d3
	cmp.l	d0,d2
	bcs.s	L000382
	lea.l	(L001259),a1
	tst.b	(L001248)
	beq.s	L000356
	lea.l	(L001461),a0
	bsr.w	L00055e
	bsr.w	L00057e
	lea.l	(L001461),a1
	lea.l	(L000ec2),a0
L000356:
	move.l	d2,d1
	sub.l	d0,d1
L00035a:
	move.l	d3,d0
	bsr.w	L0005c4
	beq.s	L000388
	move.b	(a1)+,d6
	cmp.b	#$80,d6
	bcs.s	L00037e
	cmp.b	#$a0,d6
	bcs.s	L000376
	cmp.b	#$e0,d6
	bcs.s	L00037e
L000376:
	addq.l	#1,a1
	dbra.w	d1,L00037e
	bra.s	L000382

L00037e:
	dbra.w	d1,L00035a
L000382:
	clr.b	d6
	addq.l	#1,d7
	bra.s	L00038e

L000388:
	move.b	#-$01,d6
	addq.l	#1,d5
L00038e:
	tst.b	(L001249)
	beq.s	L000398
	not.b	d6
L000398:
	move.l	(sp)+,d3
	rts

L00039c:
	tst.b	(L00124a)
	bne.w	L000426
	tst.b	d6
	beq.s	L000426
	tst.b	(L001247)
	bne.s	L000418
	tst.b	(L001246)
	beq.s	L0003ec
	tst.b	(L0010f2)
	beq.s	L0003ec
	move.w	#$0017,d1
	lea.l	(L001228),a0
	bsr.w	L0008a8
	lea.l	(L001228),a0
	bsr.w	L00056c
	sub.w	d0,d1
	tst.w	d1
	beq.s	L0003ec
L0003e0:
	move.b	#$20,d0			;' '
	bsr.w	L00083c
	dbra.w	d1,L0003e0
L0003ec:
	lea.l	(L00124b),a0
	move.l	d3,d0
	bsr.w	L0008c8
	move.b	#$3a,(L001255)		;':'
	move.b	#$20,(L001256)		;' '
	clr.b	(L001257)
	lea.l	(L00124f),a0
	bsr.w	L0008a8
L000418:
	lea.l	(L001259),a0
	bsr.w	L0008a8
	bsr.w	L0008b4
L000426:
	rts

L000428:
	tst.b	(L00124a)
	beq.w	L0004b0
	lea.l	(L000c37),a0
	bsr.w	L0008a8
	lea.l	(L00124b),a0
	move.l	d5,d0
	bsr.w	L0008c8
	clr.b	(L001255)
	lea.l	(L00124e),a0
	bsr.w	L0008a8
	bsr.w	L0008b4
	lea.l	(L000c4d),a0
	bsr.w	L0008a8
	lea.l	(L00124b),a0
	move.l	d7,d0
	bsr.w	L0008c8
	clr.b	(L001255)
	lea.l	(L00124e),a0
	bsr.w	L0008a8
	bsr.w	L0008b4
	lea.l	(L000c63),a0
	bsr.w	L0008a8
	lea.l	(L00124b),a0
	move.l	d3,d0
	bsr.w	L0008c8
	clr.b	(L001255)
	lea.l	(L00124e),a0
	bsr.w	L0008a8
	bsr.w	L0008b4
L0004b0:
	rts

L0004b2:
	movem.l	d1/a0-a2,-(sp)
	clr.l	d1
L0004b8:
	bsr.w	L000544
	adda.l	d0,a0
	tst.b	(a0)
	beq.s	L000534
	move.b	(a0)+,d0
	cmp.b	#$2d,d0			;'-'
	beq.s	L0004d0
	cmp.b	#$2f,d0			;'/'
	bne.s	L0004e6
L0004d0:
	move.b	(a0)+,d0
	beq.s	L000534
	cmp.b	#$09,d0
	beq.s	L0004e2
	cmp.b	#$20,d0			;' '
	beq.s	L0004e2
	move.b	d0,(a2)+
L0004e2:
	clr.b	(a2)+
	bra.s	L0004b8

L0004e6:
	addq.l	#1,d1
L0004e8:
	move.b	d0,(a1)+
	cmp.b	#$22,d0			;'"'
	bne.s	L0004fe
L0004f0:
	move.b	(a0)+,d0
	beq.s	L000534
	move.b	d0,(a1)+
	cmp.b	#$22,d0			;'"'
	bne.s	L0004f0
	bra.s	L000510

L0004fe:
	cmp.b	#$27,d0			;'''
	bne.s	L000510
L000504:
	move.b	(a0)+,d0
	beq.s	L000534
	move.b	d0,(a1)+
	cmp.b	#$27,d0			;'''
	bne.s	L000504
L000510:
	move.b	(a0),d0
	beq.s	L000534
	cmp.b	#$2f,d0			;'/'
	beq.s	L000530
	cmp.b	#$2d,d0			;'-'
	beq.s	L000530
	addq.l	#1,a0
	cmp.b	#$09,d0
	beq.s	L000530
	cmp.b	#$20,d0			;' '
	beq.s	L000530
	bra.s	L0004e8

L000530:
	clr.b	(a1)+
	bra.s	L0004b8

L000534:
	clr.b	(a1)+
	clr.b	(a1)
	clr.b	(a2)+
	clr.b	(a2)
	move.l	d1,d0
	movem.l	(sp)+,d1/a0-a2
	rts

L000544:
	move.l	a0,-(sp)
L000546:
	move.b	(a0)+,d0
	cmpi.b	#$20,d0			;' '
	beq.s	L000546
	cmpi.b	#$09,d0
	beq.s	L000546
	move.l	a0,d0
	movea.l	(sp)+,a0
	sub.l	a0,d0
	subq.l	#1,d0
	rts

L00055e:
	movem.l	a0-a1,-(sp)
L000562:
	move.b	(a1)+,(a0)+
	bne.s	L000562
	movem.l	(sp)+,a0-a1
	rts

L00056c:
	move.l	a0,-(sp)
	moveq.l	#$ff,d0
L000570:
	addi.l	#$00000001,d0
	tst.b	(a0)+
	bne.s	L000570
	movea.l	(sp)+,a0
	rts

L00057e:
	movem.l	d0-d1/a0,-(sp)
	clr.b	d1
L000584:
	move.b	(a0),d0
	beq.s	L0005be
	tst.b	d1
	beq.s	L000590
	clr.b	d1
	bra.s	L0005a6

L000590:
	cmp.b	#$80,d0
	bcs.s	L0005aa
	cmp.b	#$a0,d0
	bcs.s	L0005a2
	cmp.b	#$e0,d0
	bcs.s	L0005aa
L0005a2:
	move.b	#$01,d1
L0005a6:
	addq.l	#1,a0
	bra.s	L000584

L0005aa:
	cmpi.b	#$41,d0			;'A'
	bcs.s	L0005ba
	cmpi.b	#$5a,d0			;'Z'
	bhi.s	L0005ba
	add.b	#$20,d0			;' '
L0005ba:
	move.b	d0,(a0)+
	bra.s	L000584

L0005be:
	movem.l	(sp)+,d0-d1/a0
	rts

L0005c4:
	movem.l	a0-a1,-(sp)
	bra.s	L0005ce

L0005ca:
	cmpm.b	(a0)+,(a1)+
	bne.s	L0005d6
L0005ce:
	dbra.w	d0,L0005ca
	clr.l	d0
	bra.s	L0005de

L0005d6:
	bcs.s	L0005dc
	moveq.l	#$01,d0
	bra.s	L0005de

L0005dc:
	moveq.l	#$ff,d0
L0005de:
	tst.l	d0
	movem.l	(sp)+,a0-a1
	rts

L0005e6:
	link.w	a6,#-$003c
	movem.l	d0-d6/a1-a2,-(sp)
	move.w	#$ffff,d2
	movea.l	a0,a1
	bsr.w	L00056c
	move.w	d0,d1
	tst.w	d1
	beq.w	L00073c
	clr.b	d3
L000602:
	move.b	(a1)+,d4
	beq.s	L000638
	tst.b	d3
	beq.s	L000620
	cmp.b	#$01,d3
	beq.s	L00061a
	cmp.b	#$2e,d4			;'.'
	beq.s	L000620
	clr.b	d3
	bra.s	L000620

L00061a:
	move.b	#$02,d3
	bra.s	L000602

L000620:
	cmp.b	#$80,d4
	bcs.s	L000602
	cmp.b	#$a0,d4
	bcs.s	L000632
	cmp.b	#$e0,d4
	bcs.s	L000602
L000632:
	move.b	#$01,d3
	bra.s	L000602

L000638:
	subq.l	#1,a1
	tst.b	d3
	bne.s	L00065a
	cmpi.b	#$5c,(-$0001,a1)	;'\'
	bne.s	L00065a
	cmp.w	#$0001,d1
	beq.w	L00073c
	cmpi.b	#$3a,(-$0002,a1)	;':'
	beq.w	L00073c
	clr.b	-(a1)
L00065a:
	cmpi.b	#$3a,(-$0001,a1)	;':'
	beq.w	L00073c
	cmpi.b	#$2e,(-$0001,a1)	;'.'
	bne.s	L000692
	tst.b	d3
	bne.s	L000692
	cmp.w	#$0001,d1
	beq.s	L000686
	cmpi.b	#$3a,(-$0002,a1)	;':'
	beq.s	L000686
	cmpi.b	#$5c,(-$0002,a1)	;'\'
	bne.s	L000692
L000686:
	move.b	#$2a,(-$0001,a1)	;'*'
	move.b	#$2e,(a1)+		;'.'
	clr.b	(a1)
L000692:
	movea.l	a0,a2
L000694:
	move.b	(a2)+,d0
	beq.s	L0006a6
	cmp.b	#$2a,d0			;'*'
	beq.s	L0006c2
	cmp.b	#$3f,d0			;'?'
	beq.s	L0006c2
	bra.s	L000694

L0006a6:
	move.w	#$0010,-(sp)
	move.l	a0,-(sp)
	pea.l	(-$003c,a6)
	DOS	_FILES
	lea.l	($000a,sp),sp
	tst.l	d0
	bmi.s	L0006c2
	btst.b	#$04,(-$0027,a6)
	bne.s	L000738
L0006c2:
	clr.b	d3
	movea.l	a0,a2
	clr.b	d5
	clr.b	d6
L0006ca:
	move.b	(a2)+,d0
	beq.s	L000730
	tst.b	d3
	beq.s	L0006d6
	clr.b	d3
	bra.s	L0006ca

L0006d6:
	cmp.b	#$80,d0
	bcs.s	L0006f2
	cmp.b	#$a0,d0
	bcs.s	L0006e8
	cmp.b	#$e0,d0
	bcs.s	L0006f2
L0006e8:
	move.b	#$01,d3
	move.b	#$20,d5			;' '
	bra.s	L0006ca

L0006f2:
	cmp.b	#$2e,d0			;'.'
	bne.s	L000712
	tst.b	d5
	beq.s	L00070e
	cmp.b	#$3a,d5			;':'
	beq.s	L00070e
	cmp.b	#$5c,d5			;'\'
	beq.s	L00070e
	cmp.b	#$2e,d5			;'.'
	bne.s	L000712
L00070e:
	tst.b	(a2)
	beq.s	L000738
L000712:
	cmpi.b	#$5c,(a2)		;'\'
	bne.s	L00071e
	tst.b	($0001,a2)
	beq.s	L00073c
L00071e:
	move.b	d0,d5
	cmp.b	#$2e,d0			;'.'
	beq.s	L00072c
	cmp.b	#$5c,d0			;'\'
	bne.s	L0006ca
L00072c:
	move.b	d0,d6
	bra.s	L0006ca

L000730:
	cmp.b	#$2e,d6			;'.'
	beq.s	L000754
	bra.s	L000742

L000738:
	move.b	#$5c,(a1)+		;'\'
L00073c:
	move.b	#$2a,(a1)+		;'*'
	clr.w	d2
L000742:
	move.b	#$2e,(a1)+		;'.'
	move.b	#$2a,(a1)+		;'*'
	tst.w	d2
	beq.s	L000752
	clr.b	(-$0001,a1)
L000752:
	clr.b	(a1)
L000754:
	movem.l	(sp)+,d0-d6/a1-a2
	unlk	a6
	rts

L00075c:
	movem.l	d0-d1,-(sp)
	clr.b	d1
	move.l	a0,-(sp)
L000764:
	move.b	(a0)+,d0
	beq.s	L000798
	tst.b	d1
	beq.s	L000770
	clr.b	d1
	bra.s	L000764

L000770:
	cmp.b	#$80,d0
	bcs.s	L000788
	cmp.b	#$a0,d0
	bcs.s	L000782
	cmp.b	#$e0,d0
	bcs.s	L000788
L000782:
	move.b	#$01,d1
	bra.s	L000764

L000788:
	cmp.b	#$5c,d0			;'\'
	beq.s	L000794
	cmp.b	#$3a,d0			;':'
	bne.s	L000764
L000794:
	move.l	a0,(sp)
	bra.s	L000764

L000798:
	movea.l	(sp)+,a0
	movem.l	(sp)+,d0-d1
	rts

L0007a0:
	tst.w	d2
	beq.s	L0007b0
	tst.b	(a0)
	beq.s	L0007b2
L0007a8:
	tst.b	(a0)+
	bne.s	L0007a8
	subq.w	#1,d2
	bra.s	L0007a0

L0007b0:
	tst.b	(a0)
L0007b2:
	rts

L0007b4:
	tst.b	(L00124a)
	bne.s	L0007c4
	tst.b	(L001246)
	bne.s	L0007e4
L0007c4:
	move.l	a0,-(sp)
	lea.l	(L000b91),a0
	bsr.w	L0008a8
	movea.l	(sp)+,a0
	bsr.w	L0008a8
	lea.l	(L000ba6),a0
	bsr.w	L0008a8
	bsr.w	L0008b4
L0007e4:
	rts

L0007e6:
	movem.l	d2/a1,-(sp)
	movea.l	(L000c7e),a1
	move.l	(L000c82),d2
	tst.l	d2
	bne.s	L00081e
	move.l	#$00000400,-(sp)
	pea.l	(L001669)
	move.w	(L000c8e),-(sp)
	DOS	_READ
	lea.l	($000a,sp),sp
	lea.l	(L001669),a1
	tst.l	d0
	bls.s	L000824
	move.l	d0,d2
L00081e:
	move.b	(a1)+,d1
	subq.l	#1,d2
	moveq.l	#$01,d0
L000824:
	move.l	a1,(L000c7e)
	move.l	d2,(L000c82)
	movem.l	(sp)+,d2/a1
	rts

L000836:
	movem.l	d1/a1,-(sp)
	bra.s	L000866

L00083c:
	movem.l	d1/a1,-(sp)
	movea.l	(L000c86),a1
	move.l	(L000c8a),d1
	move.b	d0,(a1)+
	addq.l	#1,d1
	move.l	a1,(L000c86)
	move.l	d1,(L000c8a)
	moveq.l	#$01,d0
	cmp.l	#$00000400,d1
	bne.s	L0008a2
L000866:
	move.l	(L000c8a),d1
	tst.l	d1
	beq.s	L0008a2
	move.l	d1,-(sp)
	pea.l	(L001a69)
	move.w	(L000c90),-(sp)
	DOS	_WRITE
	lea.l	($000a,sp),sp
	tst.l	d0
	bmi.w	L0002c2
	lea.l	(L001a69),a1
	move.l	a1,(L000c86)
	move.l	#$00000000,(L000c8a)
	moveq.l	#$01,d0
L0008a2:
	movem.l	(sp)+,d1/a1
	rts

L0008a8:
	move.b	(a0)+,d0
	beq.s	L0008b2
	bsr.s	L00083c
	tst.l	d0
	bpl.s	L0008a8
L0008b2:
	rts

L0008b4:
	move.b	#$0d,d0
	bsr.s	L00083c
	move.b	#$0a,d0
	bsr.w	L00083c
	bsr.w	L000836
	rts

L0008c8:
	movem.l	d0-d2/a0-a1,-(sp)
	movem.l	a0,-(sp)
	lea.l	(L00092a),a1
L0008d6:
	clr.b	d2
	move.l	(a1)+,d1
	beq.s	L0008ec
L0008dc:
	addq.b	#1,d2
	sub.l	d1,d0
	bcc.s	L0008dc
	add.l	d1,d0
	add.b	#$2f,d2			;'/'
	move.b	d2,(a0)+
	bra.s	L0008d6

L0008ec:
	clr.b	(a0)
	movem.l	(sp)+,a0
L0008f2:
	move.b	(a0)+,d0
	beq.s	L000908
	cmp.b	#$30,d0			;'0'
	bne.s	L000908
	tst.b	(a0)
	beq.s	L000908
	move.b	#$20,(-$0001,a0)	;' '
	bra.s	L0008f2

L000908:
	movem.l	(sp)+,d0-d2/a0-a1
	rts

L00090e:
	clr.w	-(sp)
	DOS	_DUP
	tst.l	d0
	bmi.w	L0002ba
	move.w	d0,(L000c8e)
	DOS	_CLOSE
	move.w	#$0002,(sp)
	DOS	_DUP
	addq.l	#2,sp
	rts


	.data

L00092a:
	.dc.l	$3b9aca00,$05f5e100
	.dc.l	$00989680,$000f4240
	.dc.l	$000186a0,$00002710
	.dc.l	$000003e8,$00000064
	.dc.l	$0000000a,$00000001
	.dc.l	$00000000
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
