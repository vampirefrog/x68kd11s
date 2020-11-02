;=============================================
;  Filename misc/hlk.r
;
;
;  Base address 000000
;  Exec address 000000
;  Text size    0068d4 byte(s)
;  Data size    000000 byte(s)
;  Bss  size    000000 byte(s)
;  1284 Labels
;
;  Commandline dis  -h -k -m68000 -q1 -B -M -w16 -o120 -gmisc/hlk.lab --overwrite misc/hlk.r misc/hlk.s
;          DIS version 3.16
;=============================================

	.include	inc/doscall.mac
	.include	inc/iocscall.mac
	.include	inc/fefunc.mac

	.cpu	68000

	.text

Start:
	bra	Start2

HuPair:
	.dc.b	'#HUPAIR',$00
Start2:
	lea.l	($0010,a0),a0
	suba.l	a0,a1
	adda.l	#$000085e0,a1
	move.l	a1,-(a7)
	move.l	a0,-(a7)
	DOS	_SETBLOCK
	addq.l	#8,a7
	tst.l	d0
	bmi	L00054e
	lea.l	(a0,a1.l),a7
	lea.l	(End,pc),a6
	lea.l	(a6),a1
	moveq.l	#$00,d0
	move.w	#$0177,d1
L000034:
	move.l	d0,(a1)+
	dbra	d1,L000034
	move.l	(Start-$00003c,pc),d0
	andi.l	#$dfffdfdf,d0
	cmpi.l	#$47324c4b,d0		;'G2LK'
	seq.b	($05d7,a6)
	lea.l	($0064,a6),a0
	move.l	a0,($0068,a6)
	lea.l	($006c,a6),a0
	move.l	a0,($0070,a6)
	lea.l	($0074,a6),a0
	move.l	a0,($0078,a6)
	moveq.l	#$5c,d1			;'\'
	pea.l	($019c,a6)
	clr.l	-(a7)
	pea.l	(L00125d,pc)
	DOS	_GETENV
	addq.l	#8,a7
	move.l	d0,(a7)+
	bmi	L000084
	cmpi.w	#$2f00,($019c,a6)
	bne	L000084
	moveq.l	#$2f,d1			;'/'
L000084:
	move.b	d1,($05dc,a6)
	pea.l	($4004)
	DOS	_MALLOC
	move.l	d0,(a7)+
	bmi	L00054e
	move.l	d0,d2
	bsr	L0005c8
	tst.l	d0
	bmi	L00054e
	move.l	d0,-(a7)
	move.l	d2,-(a7)
	move.l	d1,-(a7)
	pea.l	($1000)
	bsr	L001366
	lea.l	($0010,a7),a7
	pea.l	($019c,a6)
	clr.l	-(a7)
	pea.l	(L001259,pc)
	DOS	_GETENV
	addq.l	#8,a7
	move.l	d0,(a7)+
	bmi	L0000d2
	pea.l	($019c,a6)
	bsr	L0013a2
	move.l	d0,(a7)+
	bmi	L000554
L0000d2:
	pea.l	($0001,a2)
	bsr	L0013a2
	move.l	d0,(a7)+
	bmi	L000554
	beq	L00056e
	move.l	($05a8,a6),d0
	st.b	d0
	addq.l	#1,d0
	move.l	d0,-(a7)
	move.l	($05ac,a6),-(a7)
	DOS	_SETBLOCK
	addq.l	#8,a7
	bsr	L001e26
	bsr	L0005c8
	tst.l	d0
	bmi	L00054e
	move.l	d0,d2
	add.l	d1,d2
	moveq.l	#$60,d3			;'`'
	sub.l	d3,d1
	bmi	L00054e
	add.l	d3,d0
	move.l	d0,($008c,a6)
	move.l	#$00001800,d3
	sub.l	d3,d1
	bmi	L00054e
	add.l	d3,d0
	move.l	d0,($0088,a6)
	move.l	d0,($0090,a6)
	moveq.l	#$60,d3			;'`'
	sub.l	d3,d1
	bmi	L00054e
	add.l	d3,d0
	move.l	d0,($007c,a6)
	move.l	d2,($0080,a6)
	move.l	d1,($0084,a6)
	bsr	L000632
	tst.w	($05cc,a6)
	bne	L000452
	movea.l	($007c,a6),a5
	move.l	($0084,a6),d7
	bsr	L000ade
	bsr	L000b20
	bsr	L000b08
	bsr	L000b64
	move.l	a5,($007c,a6)
	move.l	d7,($0084,a6)
	move.l	($05bc,a6),d7
	beq	L000186
	lea.l	(L001278,pc),a0
	movea.l	a0,a1
	movea.l	d7,a2
	sub.l	($007c,a6),d7
	neg.l	d7
	bsr	L00282c
L000186:
	tst.b	($05d0,a6)
	beq	L000198
	move.w	#$0002,-(a7)
	pea.l	(L000cd8,pc)
	DOS	_FPUTS
	addq.l	#6,a7
L000198:
	movea.l	($05a0,a6),a1
	tst.l	(a1)
	beq	L00056e
L0001a2:
	move.l	(a1)+,d1
	beq	L0001bc
	movea.l	d1,a0
	cmpi.b	#$2b,(a0)+		;'+'
	bne	L0001a2
	bsr	L002832
	tst.l	d0
	ble	L0001a2
	bsr	L00053e
	bra	L0001a2

L0001bc:
	movea.l	($05a0,a6),a1
	tst.l	(a1)
	beq	L00056e
L0001c6:
	move.l	(a1)+,d1
	beq	L0001e0
	movea.l	d1,a0
	cmpi.b	#$2b,(a0)		;'+'
	beq	L0001c6
	bsr	L002832
	tst.l	d0
	ble	L0001c6
	bsr	L00053e
	bra	L0001c6

L0001e0:
	tst.w	($05cc,a6)
	bne	L000452
	move.l	($0064,a6),d0
	beq	L000452
	tst.l	($05bc,a6)
	beq	L000200
	movea.l	d0,a0
	tst.l	($008a,a0)
	beq	L000452
L000200:
	move.l	($0064,a6),d0
L000204:
	movea.l	d0,a0
	tst.l	($0004,a0)
	bne	L000210
	bsr	L00298c
L000210:
	move.l	($008a,a0),d0
	bne	L000204
	move.l	($006c,a6),d0
	beq	L00056e
	movea.l	d0,a1
	movea.l	(a1),a0
	move.l	($05bc,a6),d0
	cmp.l	($0010,a0),d0
	bne	L000234
	tst.l	($0004,a1)
	beq	L00056e
L000234:
	bsr	L000b84
	bsr	L000c12
	move.l	($006c,a6),d0
L000240:
	movea.l	d0,a1
	movea.l	(a1),a0
	bsr	L0029e8
	move.l	($0004,a1),d0
	bne	L000240
	move.l	($006c,a6),d0
L000252:
	movea.l	d0,a1
	movea.l	(a1),a0
	bsr	L00217e
	bsr	L002a12
	move.l	($0004,a1),d0
	bne	L000252
	tst.w	($05cc,a6)
	bne	L000452
	move.l	($0040,a6),d0
	add.l	($0044,a6),d0
	tst.b	($05d7,a6)
	bne	L00028a
	tst.w	($05ce,a6)
	bne	L000562
	tst.l	d0
	bne	L000562
	bra	L000304

L00028a:
	move.l	($0040,a6),d6
	tst.b	($05ce,a6)
	bne	L00029c
	tst.l	d6
	bne	L000568
	bra	L00029e

L00029c:
	addq.l	#8,d6
L00029e:
	move.l	($0044,a6),d7
	tst.b	($05cf,a6)
	bne	L0002b0
	tst.l	d7
	bne	L000568
	bra	L0002b2

L0002b0:
	addq.l	#8,d7
L0002b2:
	movea.l	($05bc,a6),a4
	move.l	($001e,a4),d1
	movea.l	($0048,a6),a1
	move.l	d1,(a1)
	move.l	d1,($0048,a6)
	lea.l	(L001334,pc),a0
	bsr	L002402
	movea.l	d0,a0
	move.l	d1,($000c,a0)
	add.l	d6,d1
	movea.l	($004c,a6),a1
	move.l	d1,(a1)
	move.l	d1,($004c,a6)
	lea.l	(L00134a,pc),a0
	bsr	L002402
	movea.l	d0,a0
	move.l	d1,($000c,a0)
	add.l	d7,d1
	move.l	d1,($001e,a4)
	movea.l	($05c0,a6),a1
	move.l	d6,d0
	add.l	d7,d0
	add.l	d0,(a1)
	movea.l	($0064,a6),a0
	add.l	d0,($002a,a0)
L000304:
	lea.l	(L000458,pc),a3
	moveq.l	#$00,d0
	lea.l	(L000472,pc),a4
	jsr	(a3)
	move.l	d1,($0004,a6)
	lea.l	(L000486,pc),a4
	jsr	(a3)
	move.l	d1,($0008,a6)
	lea.l	(L0004c0,pc),a4
	jsr	(a3)
	move.l	d1,($0038,a6)
	lea.l	(L0004f6,pc),a4
	jsr	(a3)
	move.l	d1,($003c,a6)
	lea.l	(L00049a,pc),a4
	jsr	(a3)
	move.l	d1,($000c,a6)
	add.l	($0010,a6),d0
	lea.l	(L0004ae,pc),a4
	jsr	(a3)
	move.l	d1,($0014,a6)
	move.l	#$ffff8000,d0
	lea.l	(L0004c0,pc),a4
	jsr	(a3)
	move.l	d1,($0018,a6)
	lea.l	(L0004d2,pc),a4
	jsr	(a3)
	move.l	d1,($001c,a6)
	add.l	($0020,a6),d0
	lea.l	(L0004e4,pc),a4
	jsr	(a3)
	move.l	d1,($0024,a6)
	lea.l	(L0004f6,pc),a4
	jsr	(a3)
	move.l	d1,($0028,a6)
	lea.l	(L000508,pc),a4
	jsr	(a3)
	move.l	d1,($002c,a6)
	add.l	($0030,a6),d0
	lea.l	(L00051a,pc),a4
	jsr	(a3)
	move.l	d1,($0034,a6)
	tst.b	($05d6,a6)
	beq	L0003c8
	move.l	($0018,a6),d1
	add.l	($001c,a6),d1
	add.l	($0020,a6),d1
	add.l	($0024,a6),d1
	add.l	($0028,a6),d1
	add.l	($002c,a6),d1
	add.l	($0030,a6),d1
	add.l	($0034,a6),d1
	lea.l	(L001318,pc),a0
	bsr	L002402
	movea.l	d0,a0
	move.l	d1,($000c,a0)
L0003c8:
	move.l	($006c,a6),d0
L0003cc:
	movea.l	d0,a1
	movea.l	(a1),a0
	bsr	L002566
	move.l	($0004,a1),d0
	bne	L0003cc
	tst.w	($05cc,a6)
	bne	L000452
	bsr	L0060aa
	move.l	($0004,a6),d0
	add.l	($0008,a6),d0
	add.l	($0038,a6),d0
	add.l	($003c,a6),d0
	add.l	($0054,a6),d0
	move.l	d0,(a6)
	add.l	($000c,a6),d0
	move.l	d0,($0058,a6)
	move.l	#$ffff8000,d0
	add.l	($0018,a6),d0
	add.l	($001c,a6),d0
	move.l	d0,($005c,a6)
	add.l	($0020,a6),d0
	add.l	($0024,a6),d0
	add.l	($0028,a6),d0
	add.l	($002c,a6),d0
	move.l	d0,($0060,a6)
	move.l	($006c,a6),d0
L00042c:
	movea.l	d0,a1
	movea.l	(a1),a0
	bsr	L002450
	move.l	($0004,a1),d0
	bne	L00042c
	tst.w	($05cc,a6)
	beq	L000444
	bsr	L000c82
L000444:
	bsr	L002ad0
	tst.b	($05d5,a6)
	beq	L000452
	bsr	L00570c
L000452:
	move.w	($05cc,a6),-(a7)
	DOS	_EXIT2

L000458:
	move.l	d0,d2
	move.l	($006c,a6),d1
	beq	L00046c
L000460:
	movea.l	d1,a1
	movea.l	(a1),a0
	jsr	(a4)
	move.l	($0004,a1),d1
	bne	L000460
L00046c:
	move.l	d0,d1
	sub.l	d2,d1
	rts

L000472:
	tst.b	($0097,a0)
	beq	L00047c
	bsr	L00052c
L00047c:
	move.l	d0,($004e,a0)
	add.l	($0026,a0),d0
	rts

L000486:
	tst.b	($0098,a0)
	beq	L000490
	bsr	L00052c
L000490:
	move.l	d0,($0052,a0)
	add.l	($002a,a0),d0
	rts

L00049a:
	tst.b	($0099,a0)
	beq	L0004a4
	bsr	L00052c
L0004a4:
	move.l	d0,($0056,a0)
	add.l	($002e,a0),d0
	rts

L0004ae:
	tst.b	($009a,a0)
	beq	L0004b6
	bsr	L00052c
L0004b6:
	move.l	d0,($005a,a0)
	add.l	($0032,a0),d0
	rts

L0004c0:
	tst.b	($009b,a0)
	beq	L0004c8
	bsr	L00052c
L0004c8:
	move.l	d0,($005e,a0)
	add.l	($0036,a0),d0
	rts

L0004d2:
	tst.b	($009c,a0)
	beq	L0004da
	bsr	L00052c
L0004da:
	move.l	d0,($0062,a0)
	add.l	($003a,a0),d0
	rts

L0004e4:
	tst.b	($009d,a0)
	beq	L0004ec
	bsr	L00052c
L0004ec:
	move.l	d0,($0066,a0)
	add.l	($003e,a0),d0
	rts

L0004f6:
	tst.b	($009e,a0)
	beq	L0004fe
	bsr	L00052c
L0004fe:
	move.l	d0,($006a,a0)
	add.l	($0042,a0),d0
	rts

L000508:
	tst.b	($009f,a0)
	beq	L000510
	bsr	L00052c
L000510:
	move.l	d0,($006e,a0)
	add.l	($0046,a0),d0
	rts

L00051a:
	tst.b	($00a0,a0)
	beq	L000522
	bsr	L00052c
L000522:
	move.l	d0,($0072,a0)
	add.l	($004a,a0),d0
	rts

L00052c:
	move.l	d1,-(a7)
	move.l	($008e,a0),d1
	subq.l	#1,d1
	add.l	d1,d0
	not.l	d1
	and.l	d1,d0
	move.l	(a7)+,d1
	rts

L00053e:
	pea.l	(L0011d4,pc)
	DOS	_PRINT
	move.l	d1,-(a7)
	DOS	_PRINT
	addq.l	#8,a7
	bra	L000c82

L00054e:
	pea.l	(L00115b,pc)
	bra	L000558

L000554:
	pea.l	(L0010b9,pc)
L000558:
	DOS	_PRINT
	addq.l	#4,a7
L00055c:
	move.w	#$0001,-(a7)
	DOS	_EXIT2

L000562:
	pea.l	(L001201,pc)
	bra	L000558

L000568:
	pea.l	(L001229,pc)
	bra	L000558

L00056e:
	tst.b	($05d0,a6)
	bne	L00057c
	pea.l	(L000cd8,pc)
	DOS	_PRINT
	addq.l	#4,a7
L00057c:
	pea.l	(L000d26,pc)
	bra	L000558

L000582:
	pea.l	(L000cd8,pc)
	DOS	_PRINT
	pea.l	(L000d26,pc)
	DOS	_PRINT
	addq.l	#8,a7
	bra	L000452

L000594:
	lea.l	(L000cf5,pc),a0
	move.b	#$0a,(a0)+
	clr.b	(a0)
	pea.l	(L000cd8,pc)
	DOS	_PRINT
	addq.l	#4,a7
	bra	L000452

L0005aa:
	pea.l	(L0010cd,pc)
	DOS	_PRINT
	addq.l	#4,a7
	move.l	a0,d0
	pea.l	(Start,pc)
	sub.l	(a7)+,d0
	bsr	L000ca2
	bsr	L000c82
	pea.l	(L0010e2,pc)
	bra	L000558

L0005c8:
	pea.l	($00ffff00)
	DOS	_MALLOC
	move.l	(a7)+,d1
	tst.l	d0
	beq	L0005e0
	and.l	d0,d1
	beq	L0005e2
	move.l	d1,-(a7)
	DOS	_MALLOC
	addq.l	#4,a7
L0005e0:
	rts

L0005e2:
	moveq.l	#$ff,d0
	rts

L0005e6:
	pea.l	(L0011e4,pc)
	DOS	_PRINT
	addq.l	#4,a7
	move.w	(a0),d0
	bsr	L000c96
	pea.l	(L0011f7,pc)
	DOS	_PRINT
	addq.l	#4,a7
	move.l	a0,d0
	sub.l	($0010,a1),d0
	bsr	L000ca2
	bsr	L000c82
	pea.l	(L0011fc,pc)
	DOS	_PRINT
	move.l	($0008,a1),-(a7)
	DOS	_PRINT
	addq.l	#8,a7
	move.l	($0004,a1),d1
	beq	L00062a
	pea.l	(L0011fc,pc)
	DOS	_PRINT
	move.l	d1,-(a7)
	DOS	_PRINT
	addq.l	#8,a7
L00062a:
	bsr	L000c82
	bra	L00055c

L000632:
	movem.l	d1-d2/d7/a0-a5,-(a7)
	movea.l	($007c,a6),a5
	move.l	($0084,a6),d7
	movea.l	($05a0,a6),a1
L000642:
	move.l	(a1)+,d0
	beq	L000768
	movea.l	d0,a2
	cmpi.b	#$2d,(a2)+		;'-'
	bne	L000642
	subq.l	#4,a1
	movea.l	a1,a4
L000654:
	move.l	($0004,a4),(a4)+
	bne	L000654
	subq.l	#1,($059c,a6)
	move.b	(a2)+,d0
	beq	L000710
	cmpi.b	#$2d,d0			;'-'
	beq	L0006dc
	bra	L000670

L00066c:
	move.b	(a2)+,d0
	beq	L000642
L000670:
	cmpi.b	#$3f,d0			;'?'
	beq	L000582
	cmpi.b	#$30,d0			;'0'
	beq	L0008fc
	cmpi.b	#$31,d0			;'1'
	beq	L000904
	cmpi.b	#$4c,d0			;'L'
	beq	L0008a0
	andi.w	#$00df,d0
	subi.b	#$41,d0			;'A'
	cmpi.b	#$19,d0
	bhi	L000712
	add.w	d0,d0
	move.w	(L0006a8,pc,d0.w),d0
	jmp	(L0006a8,pc,d0.w)

L0006a8:
	.dc.w	L000934-L0006a8
	.dc.w	L00098c-L0006a8
	.dc.w	L000712-L0006a8
	.dc.w	L0009c2-L0006a8
	.dc.w	L000952-L0006a8
	.dc.w	L000712-L0006a8
	.dc.w	L0009a4-L0006a8
	.dc.w	L000582-L0006a8
	.dc.w	L000776-L0006a8
	.dc.w	L000712-L0006a8
	.dc.w	L000712-L0006a8
	.dc.w	L0007e8-L0006a8
	.dc.w	L0008b0-L0006a8
	.dc.w	L000712-L0006a8
	.dc.w	L0008c4-L0006a8
	.dc.w	L0008e2-L0006a8
	.dc.w	L000712-L0006a8
	.dc.w	L00093a-L0006a8
	.dc.w	L000984-L0006a8
	.dc.w	L00092c-L0006a8
	.dc.w	L000712-L0006a8
	.dc.w	L000914-L0006a8
	.dc.w	L00091c-L0006a8
	.dc.w	L000924-L0006a8
	.dc.w	L000712-L0006a8
	.dc.w	L00090c-L0006a8
L0006dc:
	lea.l	(L0006fe,pc),a4
L0006e0:
	move.w	(a4)+,d0
	beq	L000710
	move.w	(a4)+,d1
	pea.l	(L0006fe,pc,d0.w)
	pea.l	(a2)
	bsr	L0068a8
	addq.l	#8,a7
	bne	L0006e0
L0006f4:
	tst.b	(a2)+
	bne	L0006f4
	subq.l	#1,a2
	jmp	(L0006fe,pc,d1.w)

L0006fe:
	.dc.w	L00109e-L0006fe
	.dc.w	L000582-L0006fe
	.dc.w	L0010a3-L0006fe
	.dc.w	L00090c-L0006fe
	.dc.w	L0010a9-L0006fe
	.dc.w	L000914-L0006fe
	.dc.w	L0010b1-L0006fe
	.dc.w	L000594-L0006fe
	.dc.w	L0006fe-L0006fe
L000710:
	subq.l	#1,a2
L000712:
	pea.l	(L001173,pc)
	DOS	_PRINT
	bsr	L00072a
L00071a:
	addq.l	#4,a7
	bsr	L000c82
	move.w	#$0001,($05cc,a6)
	bra	L000642

L00072a:
	move.l	a2,-(a7)
L00072c:
	cmpi.b	#$2d,-(a2)		;'-'
	bne	L00072c
	move.l	a2,-(a7)
	DOS	_PRINT
	addq.l	#4,a7
	movea.l	(a7)+,a2
	rts

L00073c:
	pea.l	(L001185,pc)
	DOS	_PRINT
	bsr	L00072a
	tst.b	(a2)
	bne	L00071a
	bsr	L000c78
	move.l	a3,(a7)
	DOS	_PRINT
	bra	L00071a

L000752:
	pea.l	(L001185,pc)
	DOS	_PRINT
	bsr	L00072a
	bra	L00071a

L00075c:
	pea.l	(L0011ae,pc)
	DOS	_PRINT
	addq.l	#4,a7
	bra	L00066c

L000768:
	move.l	a5,($007c,a6)
	move.l	d7,($0084,a6)
	movem.l	(a7)+,d1-d2/d7/a0-a5
	rts

L000776:
	bsr	L000a18
	beq	L000752
	clr.w	-(a7)
	pea.l	(a3)
	DOS	_OPEN
	addq.l	#6,a7
	move.l	d0,d1
	bmi	L000aca
	move.w	#$0002,-(a7)
	clr.l	-(a7)
	move.w	d1,-(a7)
	DOS	_SEEK
	move.l	d0,d2
	clr.w	($0006,a7)
	DOS	_SEEK
	addq.l	#8,a7
	or.l	d2,d0
	bmi	L0007de
	moveq.l	#$fe,d0
	and.l	d2,d0
	addq.l	#2,d0
	sub.l	d0,d7
	bmi	L00054e
	sub.l	d0,($0080,a6)
	movea.l	($0080,a6),a0
	move.l	d2,-(a7)
	pea.l	(a0)
	move.w	d1,-(a7)
	DOS	_READ
	addq.l	#6,a7
	cmp.l	(a7)+,d2
	bne	L0007de
	clr.b	(a0,d2.l)
	move.w	d1,-(a7)
	DOS	_CLOSE
	addq.l	#2,a7
	pea.l	(a0)
	bsr	L001444
	move.l	d0,(a7)+
	bmi	L000554
	bra	L000642

L0007de:
	move.w	d1,-(a7)
	DOS	_CLOSE
	addq.l	#2,a7
	bra	L000642

L0007e8:
	tst.b	(a2)
	bne	L000850
	lea.l	($019c,a6),a3
	pea.l	(a3)
	clr.l	-(a7)
	pea.l	(L001255,pc)
	DOS	_GETENV
	addq.l	#8,a7
	move.l	d0,(a7)+
	bmi	L00075c
	bsr	L000808
	bra	L00066c

L000808:
	pea.l	(a3)
	bsr	L006892
	addq.l	#4,a7
	tst.l	d0
	beq	L00084e
	addq.l	#7,d0
	andi.w	#$fffe,d0
	sub.l	d0,d7
	bmi	L00054e
	sub.l	d0,($0080,a6)
	movea.l	($0080,a6),a0
	pea.l	(a0)
	clr.l	(a0)+
L00082c:
	move.b	(a3)+,(a0)+
	bne	L00082c
	subq.l	#2,a0
	cmpi.b	#$3a,(a0)+		;':'
	beq	L00083e
	move.b	#$5c,(a0)+		;'\'
	clr.b	(a0)
L00083e:
	bsr	L0067bc
	movea.l	(a7)+,a0
	movea.l	($0078,a6),a3
	move.l	a0,(a3)
	move.l	a0,($0078,a6)
L00084e:
	rts

L000850:
	pea.l	(a2)
	bsr	L006892
	addq.l	#4,a7
	addq.l	#7,d0
	andi.w	#$fffe,d0
	sub.l	d0,d7
	bmi	L00054e
	sub.l	d0,($0080,a6)
	movea.l	($0080,a6),a0
	pea.l	(L001255,pc)
	pea.l	(a0)
	bsr	L006860
	addq.l	#8,a7
	pea.l	(a2)
	pea.l	(a0)
	bsr	L006876
	addq.l	#8,a7
	pea.l	(L001263,pc)
	pea.l	(a0)
	bsr	L006876
	addq.l	#8,a7
	lea.l	(a1),a2
L000890:
	tst.l	(a2)+
	bne	L000890
	clr.l	(a2)
	move.l	a0,-(a2)
	subq.l	#1,($059c,a6)
	bra	L000642

L0008a0:
	bsr	L000a18
	beq	L000752
	bsr	L000808
	bra	L000642

L0008b0:
	bsr	L000a18
	beq	L000752
	bsr	L000a3a
	bmi	L00073c
	bra	L000642

L0008c4:
	bsr	L000a18
	beq	L000752
	moveq.l	#$5f,d0			;'_'
	movea.l	a3,a4
	lea.l	($009c,a6),a0
L0008d4:
	move.b	(a4)+,(a0)+
	dbeq	d0,L0008d4
	beq	L000642
	bra	L00073c

L0008e2:
	st.b	($05d5,a6)
	moveq.l	#$5f,d0			;'_'
	lea.l	(a2),a4
	lea.l	($011c,a6),a0
L0008ee:
	move.b	(a4)+,(a0)+
	dbeq	d0,L0008ee
	beq	L000642
	bra	L000752

L0008fc:
	sf.b	($05d7,a6)
	bra	L00066c

L000904:
	st.b	($05d7,a6)
	bra	L00066c

L00090c:
	sf.b	($05d1,a6)
	bra	L00066c

L000914:
	st.b	($05d1,a6)
	bra	L00066c

L00091c:
	st.b	($05d2,a6)
	bra	L00066c

L000924:
	st.b	($05d3,a6)
	bra	L00066c

L00092c:
	st.b	($05d0,a6)
	bra	L00066c

L000934:
	lea.l	($05d8,a6),a4
	bra	L00093e

L00093a:
	lea.l	($05da,a6),a4
L00093e:
	st.b	(a4)+
	moveq.l	#$20,d0			;' '
	or.b	(a2)+,d0
	cmpi.b	#$6e,d0			;'n'
	seq.b	(a4)
	beq	L00094e
	subq.l	#1,a2
L00094e:
	bra	L00066c

L000952:
	bsr	L000a18
	beq	L000752
	bsr	L000a3a
	bmi	L00073c
	move.l	d0,d1
	subq.l	#2,d1
	cmpi.l	#$000000fe,d1
	bhi	L00073c
	move.l	d0,d1
L000972:
	lsr.l	#1,d1
	bcc	L000972
	bne	L00073c
	lea.l	(L000cd4,pc),a4
	move.l	d0,(a4)
	bra	L000642

L000984:
	st.b	($05d6,a6)
	bra	L00066c

L00098c:
	bsr	L000a18
	beq	L000752
	bsr	L000a3a
	bmi	L00073c
	move.l	d0,($0098,a6)
	bra	L000642

L0009a4:
	bsr	L000a18
	beq	L000752
	bsr	L000a3a
	bmi	L00073c
	moveq.l	#$02,d1
	cmp.l	d1,d0
	bhi	L00073c
	move.b	d0,($05d4,a6)
	bra	L000642

L0009c2:
	bsr	L000a18
	beq	L000752
	bsr	L000b4c
	subq.l	#6,d7
	bmi	L00054e
	move.w	#$b200,(a5)+
	lea.l	(a5),a0
	clr.l	(a5)+
	movea.l	a3,a4
L0009dc:
	move.b	(a4)+,d1
	beq	L0009f0
	cmpi.b	#$3d,d1			;'='
	beq	L0009f0
	subq.l	#1,d7
	bmi	L00054e
	move.b	d1,(a5)+
	bra	L0009dc

L0009f0:
	move.w	a5,d0
	ori.w	#$0001,d0
	sub.w	a5,d0
L0009f8:
	subq.l	#1,d7
	bmi	L00054e
	clr.b	(a5)+
	dbra	d0,L0009f8
	tst.b	d1
	beq	L00073c
	movea.l	a4,a3
	bsr	L000a3a
	bmi	L00073c
	move.l	d0,(a0)
	bra	L000642

L000a18:
	movea.l	a2,a3
	tst.b	(a2)
	bne	L000a38
	move.l	(a1),d0
	beq	L000a38
	movea.l	d0,a3
	cmpi.b	#$2d,(a3)		;'-'
	beq	L000a38
	movea.l	a1,a4
L000a2c:
	move.l	($0004,a4),(a4)+
	bne	L000a2c
	subq.l	#1,($059c,a6)
	moveq.l	#$01,d0
L000a38:
	rts

L000a3a:
	movem.l	d1/a4,-(a7)
	moveq.l	#$00,d0
	moveq.l	#$00,d1
	movea.l	a3,a4
	move.b	(a4)+,d1
	beq	L000a8c
	cmpi.b	#$24,d1			;'$'
	beq	L000a98
	cmpi.b	#$39,d1			;'9'
	bhi	L000a8c
	cmpi.b	#$30,d1			;'0'
	bcs	L000a8c
	bhi	L000a68
	moveq.l	#$20,d1			;' '
	or.b	(a4)+,d1
	cmpi.b	#$78,d1			;'x'
	beq	L000a98
	subq.l	#1,a4
L000a68:
	subq.l	#1,a4
L000a6a:
	move.b	(a4)+,d1
	beq	L000a90
	subi.b	#$30,d1			;'0'
	cmpi.b	#$09,d1
	bhi	L000a8c
	cmpi.l	#$19999999,d0
	bhi	L000a8c
	add.l	d0,d0
	move.l	d0,-(a7)
	lsl.l	#2,d0
	add.l	(a7)+,d0
	add.l	d1,d0
	bcc	L000a6a
L000a8c:
	moveq.l	#$ff,d1
	bra	L000a92

L000a90:
	moveq.l	#$00,d1
L000a92:
	movem.l	(a7)+,d1/a4
	rts

L000a98:
	move.b	(a4)+,d1
	beq	L000a8c
L000a9c:
	cmpi.b	#$39,d1			;'9'
	bls	L000aae
	andi.b	#$df,d1
	cmpi.b	#$41,d1			;'A'
	bcs	L000a8c
	subq.b	#7,d1
L000aae:
	subi.b	#$30,d1			;'0'
	cmpi.b	#$0f,d1
	bhi	L000a8c
	cmpi.l	#$0fffffff,d0
	bhi	L000a8c
	lsl.l	#4,d0
	or.b	d1,d0
	move.b	(a4)+,d1
	bne	L000a9c
	bra	L000a90

L000aca:
	pea.l	(L001193,pc)
	DOS	_PRINT
	pea.l	(a3)
	DOS	_PRINT
	addq.l	#8,a7
	bsr	L000c82
	bra	L00055c

L000ade:
	tst.b	($05d7,a6)
	beq	L000b06
	bsr	L000b4c
	pea.l	($0002,a5)
	move.l	(a7)+,($0048,a6)
	moveq.l	#$16,d0
	lea.l	(L00132e,pc),a4
	bsr	L000b74
	pea.l	($0002,a5)
	move.l	(a7)+,($004c,a6)
	moveq.l	#$16,d0
	lea.l	(L001344,pc),a4
	bsr	L000b74
L000b06:
	rts

L000b08:
	tst.b	($05d7,a6)
	beq	L000b1e
	pea.l	($0008,a5)
	move.l	(a7)+,($05c0,a6)
	moveq.l	#$0c,d0
	lea.l	(L00135a,pc),a4
	bsr	L000b74
L000b1e:
	rts

L000b20:
	tst.b	($05d6,a6)
	beq	L000b4a
	bsr	L000b4c
	moveq.l	#$14,d0
	lea.l	(L0012fe,pc),a4
	bsr	L000b74
	moveq.l	#$10,d0
	lea.l	(L001312,pc),a4
	bsr	L000b74
	moveq.l	#$0c,d0
	lea.l	(L001322,pc),a4
	bsr	L000b74
	moveq.l	#$40,d0			;'@'
	movea.l	($05bc,a6),a4
	add.l	d0,($001e,a4)
L000b4a:
	rts

L000b4c:
	tst.l	($05bc,a6)
	bne	L000b62
	move.l	a5,($05bc,a6)
	move.l	#$0000008c,d0
	lea.l	(L001272,pc),a4
	bsr	L000b74
L000b62:
	rts

L000b64:
	tst.l	($05bc,a6)
	beq	L000b72
	subq.l	#2,d7
	bmi	L00054e
	clr.w	(a5)+
L000b72:
	rts

L000b74:
	sub.l	d0,d7
	bmi	L00054e
	subq.l	#1,d0
L000b7c:
	move.b	(a4)+,(a5)+
	dbra	d0,L000b7c
	rts

L000b84:
	movem.l	d1/a0-a3,-(a7)
	lea.l	($009c,a6),a0
	movea.l	a0,a2
	move.b	(a0),d1
	bne	L000bac
	movea.l	($006c,a6),a1
	movea.l	(a1),a0
	move.l	($05bc,a6),d0
	cmp.l	($0010,a0),d0
	bne	L000ba8
	movea.l	($0004,a1),a1
	movea.l	(a1),a0
L000ba8:
	movea.l	($0008,a0),a0
L000bac:
	lea.l	($019c,a6),a3
	pea.l	(a3)
	pea.l	(a0)
	DOS	_NAMECK
	addq.l	#8,a7
	pea.l	(a3)
	pea.l	(a2)
	bsr	L006860
	addq.l	#8,a7
	pea.l	($0043,a3)
	pea.l	(a2)
	bsr	L006876
	addq.l	#8,a7
	pea.l	(a2)
	bsr	L0067bc
	addq.l	#4,a7
	tst.b	d1
	beq	L000be2
	lea.l	($0056,a3),a0
	tst.b	(a0)
	bne	L000bfe
L000be2:
	lea.l	(L001266,pc),a0
	tst.b	($05da,a6)
	bne	L000bfe
	addq.l	#3,a0
	tst.b	d1
	bne	L000bf8
	tst.b	($05d9,a6)
	bne	L000bfe
L000bf8:
	tst.b	($05d8,a6)
	bne	L000c0c
L000bfe:
	pea.l	(a0)
	pea.l	(a2)
	bsr	L006876
	addq.l	#8,a7
	neg.b	($05d9,a6)
L000c0c:
	movem.l	(a7)+,d1/a0-a3
	rts

L000c12:
	movem.l	d1/a0-a2,-(a7)
	tst.b	($05d5,a6)
	beq	L000c72
	lea.l	($011c,a6),a0
	lea.l	(a0),a1
	lea.l	($019c,a6),a2
	move.b	(a0),d1
	bne	L000c2e
	lea.l	($009c,a6),a1
L000c2e:
	pea.l	(a2)
	pea.l	(a1)
	DOS	_NAMECK
	addq.l	#8,a7
	tst.l	d0
	bmi	L000c72
	pea.l	(a2)
	pea.l	(a0)
	bsr	L006860
	addq.l	#8,a7
	pea.l	($0043,a2)
	pea.l	(a0)
	bsr	L006876
	addq.l	#8,a7
	pea.l	(a0)
	bsr	L0067bc
	addq.l	#4,a7
	tst.b	d1
	beq	L000c64
	lea.l	($0056,a2),a2
	tst.b	(a2)
	bne	L000c68
L000c64:
	lea.l	(L00126c,pc),a2
L000c68:
	pea.l	(a2)
	pea.l	(a0)
	bsr	L006876
	addq.l	#8,a7
L000c72:
	movem.l	(a7)+,d1/a0-a2
	rts

L000c78:
	move.w	#$0020,-(a7)		;' '
	DOS	_PUTCHAR
	addq.l	#2,a7
	rts

L000c82:
	pea.l	(L001253,pc)
	DOS	_PRINT
	addq.l	#4,a7
	rts

L000c8c:
	movem.l	d1-d2/a0,-(a7)
	moveq.l	#$01,d2
	ror.l	#8,d0
	bra	L000ca8

L000c96:
	movem.l	d1-d2/a0,-(a7)
	move.w	#$0003,d2
	swap.w	d0
	bra	L000ca8

L000ca2:
	movem.l	d1-d2/a0,-(a7)
	moveq.l	#$07,d2
L000ca8:
	move.l	d0,d1
L000caa:
	rol.l	#4,d1
	moveq.l	#$0f,d0
	and.w	d1,d0
	move.b	(L000cc4,pc,d0.w),d0
	move.w	d0,-(a7)
	DOS	_PUTCHAR
	addq.l	#2,a7
	dbra	d2,L000caa
	movem.l	(a7)+,d1-d2/a0
	rts

L000cc4:
	.dc.b	$30,$31,$32,$33,$34,$35,$36,$37,$38,$39,$61,$62,$63,$64,$65,$66
L000cd4:
	.dc.l	$00000002
L000cd8:
	.dc.b	'HLK evolution version 3.01+12'
L000cf5:
	.dc.b	' Copyright 1989-94 SALT, 1999/07/16 立花えり子.',$0a,$00
L000d26:
	.dc.b	'usege: hlk [switch] file [+file] ...',$0a
	.dc.b	$09,'-a / -an',$09,'実行ファイルの拡張子省略時に .x を付けない',$0a
	.dc.b	$09,'-b num',$09,$09,'ベースアドレスの設定',$0a
	.dc.b	$09,'-d label=num',$09,'シンボルの定義',$0a
	.dc.b	$09,'-e num',$09,$09,'アライメント値の設定',$0a
	.dc.b	$09,'-g num',$09,$09,'ロードモードの設定(0～2)',$0a
	.dc.b	$09,'-i file',$09,$09,'インダイレクトファイルの指定',$0a
	.dc.b	$09,'-l',$09,$09,'ライブラリのパスとして環境変数 lib を使用する',$0a
	.dc.b	$09,'-l<lib>',$09,$09,'lib<lib>.a をリンクする',$0a
	.dc.b	$09,'-L path',$09,$09,'ライブラリ検索パスの指定',$0a
	.dc.b	$09,'-o file',$09,$09,'実行ファイル名の指定',$0a
	.dc.b	$09,'-p[file]',$09,'マップファイルの作成',$0a
	.dc.b	$09,'-r / -rn',$09,'.r 形式実行ファイルの作成',$0a
	.dc.b	$09,'-s',$09,$09,'セクション情報を実行ファイルに埋め込む',$0a
	.dc.b	$09,'-t',$09,$09,'起動時にタイトルを表示する',$0a
	.dc.b	$09,'-w',$09,$09,'警告の出力禁止',$0a
	.dc.b	$09,'-x',$09,$09,'シンボルテーブルの出力禁止',$0a
	.dc.b	$09,'-0 / -1',$09,$09,'.ctor/.dtor に対応しない / する',$0a
	.dc.b	$0a
	.dc.b	$09,'--help (-h)',$09,'使用法表示',$0a
	.dc.b	$09,'--quiet (-z)',$09,'--verbose (-v) オプションを取り消す',$0a
	.dc.b	$09,'--verbose (-v)',$09,'詳細表示',$0a
	.dc.b	$09,'--version',$09,'バージョン表示',$0a
	.dc.b	$0a
	.dc.b	$09,'環境変数 HLK の内容がコマンドラインの手前に挿入されます.',$0a
	.dc.b	$09,'ファイル名先頭に + をつけたオブジェクトを先頭にリンクします.',$0a,$00
L00109e:
	.dc.b	'help',$00
L0010a3:
	.dc.b	'quiet',$00
L0010a9:
	.dc.b	'verbose',$00
L0010b1:
	.dc.b	'version',$00
L0010b9:
	.dc.b	'Too many arguments',$0a,$00
L0010cd:
	.dc.b	'Internal error at : ',$00
L0010e2:
	.dc.b	'このエラーはプログラムのバグによって発生した可能性が大です．',$0a
	.dc.b	'作者にお知らせ下さい．できる限りの事はやってみます．(;_;)',$0a
	.dc.b	$0a,$00
L00115b:
	.dc.b	'Out of memory !! (ﾟ_ﾟ;',$0a,$00
L001173:
	.dc.b	'Unknown option : ',$00
L001185:
	.dc.b	'Bad option : ',$00
L001193:
	.dc.b	'Not found indirect file : ',$00
L0011ae:
	.dc.b	'Undefined environment variable ',$27,'lib',$27,$0a,$00
L0011d4:
	.dc.b	'Already read : ',$00
L0011e4:
	.dc.b	'Unknown command : ',$00
L0011f7:
	.dc.b	' at ',$00
L0011fc:
	.dc.b	' in ',$00
L001201:
	.dc.b	'Using (do)ctor/dtor without -1 option.',$0a,$00
L001229:
	.dc.b	'Using ctor/dtor without .doctor/.dodtor.',$0a,$00
L001253:
	.dc.b	$0a,$00
L001255:
	.dc.b	'lib',$00
L001259:
	.dc.b	'HLK',$00
L00125d:
	.dc.b	'SLASH',$00
L001263:
	.dc.b	$2e,$61,$00
L001266:
	.dc.b	$2e,$72,$00,$2e,$78,$00
L00126c:
	.dc.b	'.map',$00,$00
L001272:
	.dc.b	$d0,$00,$00,$00,$00,$00
L001278:
	.dc.b	'*SYSTEM*',$00,$00
L001282:
	.dc.b	'ﾀ',$01,$00,$00,$00,$00
	.dc.b	'text',$00,$00
	.dc.b	'ﾀ',$02,$00,$00,$00,$00
	.dc.b	'data',$00,$00
	.dc.b	'ﾀ',$03,$00,$00,$00,$00
	.dc.b	'bss',$00
	.dc.b	'ﾀ',$04,$00,$00,$00,$00
	.dc.b	'stack',$00
	.dc.b	'ﾀ',$05,$00,$00,$00,$00
	.dc.b	'rdata',$00
	.dc.b	'ﾀ',$06,$00,$00,$00,$00
	.dc.b	'rbss',$00,$00
	.dc.b	'ﾀ',$07,$00,$00,$00,$00
	.dc.b	'rstack',$00,$00
	.dc.b	'ﾀ',$08,$00,$00,$00,$00
	.dc.b	'rldata',$00,$00
	.dc.b	'ﾀ',$09,$00,$00,$00,$00
	.dc.b	'rlbss',$00
	.dc.b	'ﾀ',$0a,$00,$00,$00,$00
	.dc.b	'rlstack',$00
L0012fe:
	.dc.b	$b2,$02,$00,$00,$00,$00,$5f,$5f,$5f,$73,$69,$7a,$65,$5f,$69,$6e
	.dc.b	$66,$6f,$00,$00
L001312:
	.dc.b	$b2,$00,$00,$00,$00,$00
L001318:
	.dc.b	'___rsize',$00,$00
L001322:
	.dc.b	$20,$02,$00,$00,$00,$00,$30,$00,$00,$00,$00,$40
L00132e:
	.dc.b	$b2,$02,$00,$00,$00,$00
L001334:
	.dc.b	'___CTOR_LIST__',$00,$00
L001344:
	.dc.b	$b2,$02,$00,$00,$00,$00
L00134a:
	.dc.b	'___DTOR_LIST__',$00,$00
L00135a:
	.dc.b	$20,$02,$00,$00,$00,$00,$30,$00,$00,$00,$00,$00
L001366:
	link.w	a6,#$0000
	movem.l	d1-d3/a0,-(a7)
	movem.l	($0008,a6),d0-d3
	lea.l	(End,pc),a0
	move.l	d0,($05a4,a0)
	move.l	d1,($05b0,a0)
	move.l	d2,($05a0,a0)
	move.l	d3,($05b4,a0)
	move.l	d3,($05ac,a0)
	clr.l	($059c,a0)
	clr.l	($05a8,a0)
	movea.l	($05a0,a0),a0
	clr.l	(a0)
	movem.l	(a7)+,d1-d3/a0
	unlk	a6
	rts

L0013a2:
	link.w	a6,#$0000
	movem.l	d1-d4/a0-a4,-(a7)
	movea.l	($0008,a6),a0
	lea.l	(End,pc),a4
	move.l	($059c,a4),d1
	movea.l	($05a0,a4),a1
	move.l	d1,d2
	lsl.l	#2,d2
	adda.l	d2,a1
	move.l	($05b0,a4),d2
	move.l	($05a8,a4),d3
	moveq.l	#$00,d4
	movea.l	($05b4,a4),a2
	lea.l	($05a4,a4),a3
L0013d2:
	movea.l	a2,a4
	tst.l	(a3)
	bls	L001440
L0013d8:
	move.b	(a0)+,d0
	beq	L001420
	cmpi.b	#$20,d0			;' '
	beq	L0013d8
L0013e2:
	tst.b	d4
	beq	L0013ee
	cmp.b	d4,d0
	bne	L001400
L0013ea:
	eor.b	d0,d4
	bra	L00140a

L0013ee:
	cmp.b	#$22,d0			;'"'
	beq	L0013ea
	cmp.b	#$27,d0			;'''
	beq	L0013ea
	cmp.b	#$20,d0			;' '
	beq	L00140e
L001400:
	subq.l	#1,d2
	beq	L001440
	addq.l	#1,d3
	move.b	d0,(a2)+
	beq	L00140e
L00140a:
	move.b	(a0)+,d0
	bra	L0013e2

L00140e:
	subq.l	#1,d2
	beq	L001440
	addq.l	#1,d3
	clr.b	(a2)+
	move.l	a4,(a1)+
	addq.l	#1,d1
	subq.l	#1,(a3)
	tst.b	d0
	bne	L0013d2
L001420:
	clr.l	(a1)
	lea.l	(End,pc),a0
	move.l	d1,($059c,a0)
	move.l	d2,($05b0,a0)
	move.l	a2,($05b4,a0)
	move.l	d3,($05a8,a0)
	move.l	d1,d0
L001438:
	movem.l	(a7)+,d1-d4/a0-a4
	unlk	a6
	rts

L001440:
	moveq.l	#$ff,d0
	bra	L001438

L001444:
	movem.l	a0-a1/a6,-(a7)
	lea.l	(End,pc),a6
	movea.l	($0010,a7),a0
	move.l	($059c,a6),d0
	movea.l	($05a0,a6),a1
	lsl.l	#2,d0
	adda.l	d0,a1
L00145c:
	move.b	(a0)+,d0
	beq	L001494
	cmpi.b	#$1a,d0
	beq	L001494
	cmpi.b	#$20,d0			;' '
	bls	L00145c
	tst.l	($05a4,a6)
	ble	L0014a0
	subq.l	#1,a0
	subq.l	#1,($05a4,a6)
	addq.l	#1,($059c,a6)
	move.l	a0,(a1)+
L00147e:
	move.b	(a0)+,d0
	cmpi.b	#$20,d0			;' '
	bhi	L00147e
	clr.b	(-$0001,a0)
	tst.b	d0
	beq	L001494
	cmpi.b	#$1a,d0
	bne	L00145c
L001494:
	clr.l	(a1)
	move.l	($059c,a6),d0
L00149a:
	movem.l	(a7)+,a0-a1/a6
	rts

L0014a0:
	moveq.l	#$ff,d0
	bra	L00149a

L0014a4:
	movem.l	d1-d2/a0,-(a7)
	move.w	d0,d1
	beq	L0014e0
	lsr.w	#8,d1
	cmpi.b	#$10,d1
	beq	L0014e4
	add.w	d1,d1
	lea.l	(L001546,pc),a0
	move.w	(a0,d1.w),d1
	beq	L0014e8
	lea.l	(L001846,pc),a0
	move.b	d0,d2
	ext.w	d2
	add.w	d2,d2
	add.w	d1,d2
	cmp.w	(a0,d2.w),d0
	bne	L0014e8
	lsr.w	#1,d2
	moveq.l	#$00,d0
	move.w	d2,d0
L0014d8:
	movem.l	(a7)+,d1-d2/a0
	tst.l	d0
	rts

L0014e0:
	moveq.l	#$00,d0
	bra	L0014d8

L0014e4:
	moveq.l	#$01,d0
	bra	L0014d8

L0014e8:
	moveq.l	#$ff,d0
	bra	L0014d8

L0014ec:
	movem.l	d1/a1,-(a7)
	move.w	(a0)+,d0
	move.w	d0,d1
	bsr	L0014a4
	bmi	L00150e
	add.w	d0,d0
	lea.l	(L001ba8,pc),a1
	move.w	(a1,d0.w),d0
	jsr	(a1,d0.w)
	moveq.l	#$00,d0
L001508:
	movem.l	(a7)+,d1/a1
	rts

L00150e:
	subq.l	#2,a0
	moveq.l	#$ff,d0
	bra	L001508

L001514:
	subq.l	#2,a0
	rts

L001518:
	andi.w	#$00fe,d1
	addq.w	#2,d1
	adda.w	d1,a0
	rts

L001522:
	rts

L001524:
	addq.l	#2,a0
	rts

L001528:
	addq.l	#4,a0
	rts

L00152c:
	addq.l	#6,a0
	rts

L001530:
	addq.l	#8,a0
	rts

L001534:
	addq.l	#4,a0
	bra	L00153e

L001538:
	bra	L00153e

L00153a:
	tst.b	(a0)+
	beq	L001544
L00153e:
	tst.b	(a0)+
	bne	L00153a
	addq.l	#1,a0
L001544:
	rts

L001546:
	.dc.w	$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	.dc.w	$0002,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	.dc.w	$0018,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	.dc.w	$0022,$0040,$005e,$007c,$0000,$0096,$00a8,$00c2
	.dc.w	$0000,$0000,$0000,$0000,$00ca,$00cc,$0000,$0000
	.dc.w	$00d8,$00f6,$0114,$0132,$0000,$014c,$015e,$0178
	.dc.w	$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000,$0000,$0180,$0000,$0000
	.dc.w	$0000,$0194,$0000,$01a8,$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	.dc.w	$01c6,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	.dc.w	$01dc,$01de,$01e0,$01e2,$0000,$0000,$01e4,$0000
	.dc.w	$0000,$01e6,$0000,$0000,$0000,$0000,$0000,$0000
	.dc.w	$01e6,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	.dc.w	$0228,$0000,$0230,$0000,$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	.dc.w	$0244,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	.dc.w	$0260,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	.dc.w	$0262,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
L001846:
	.dc.w	$0000,$0000,$2001,$2002,$2003,$2004,$2005,$2006
	.dc.w	$2007,$2008,$2009,$200a,$3000,$40fc,$40fd,$40fe
	.dc.w	$40ff,$4000,$4001,$4002,$4003,$4004,$4005,$4006
	.dc.w	$4007,$4008,$4009,$400a,$41fc,$41fd,$41fe,$41ff
	.dc.w	$4100,$4101,$4102,$4103,$4104,$4105,$4106,$4107
	.dc.w	$4108,$4109,$410a,$42fc,$42fd,$42fe,$42ff,$4200
	.dc.w	$4201,$4202,$4203,$4204,$4205,$4206,$4207,$4208
	.dc.w	$4209,$420a,$43fc,$43fd,$43fe,$43ff,$4300,$4301
	.dc.w	$4302,$4303,$4304,$4305,$4306,$4307,$4308,$4309
	.dc.w	$430a,$45fe,$45ff,$0000,$0000,$0000,$0000,$0000
	.dc.w	$46fc,$46fd,$46fe,$46ff,$4600,$4601,$4602,$4603
	.dc.w	$4604,$4605,$4606,$4607,$4608,$4609,$460a,$47fe
	.dc.w	$47ff,$0000,$0000,$0000,$0000,$0000,$4c01,$4d01
	.dc.w	$50fc,$50fd,$50fe,$50ff,$5000,$5001,$5002,$5003
	.dc.w	$5004,$5005,$5006,$5007,$5008,$5009,$500a,$51fc
	.dc.w	$51fd,$51fe,$51ff,$5100,$5101,$5102,$5103,$5104
	.dc.w	$5105,$5106,$5107,$5108,$5109,$510a,$52fc,$52fd
	.dc.w	$52fe,$52ff,$5200,$5201,$5202,$5203,$5204,$5205
	.dc.w	$5206,$5207,$5208,$5209,$520a,$53fc,$53fd,$53fe
	.dc.w	$53ff,$5300,$5301,$5302,$5303,$5304,$5305,$5306
	.dc.w	$5307,$5308,$5309,$530a,$55fe,$55ff,$0000,$0000
	.dc.w	$0000,$0000,$0000,$56fc,$56fd,$56fe,$56ff,$5600
	.dc.w	$5601,$5602,$5603,$5604,$5605,$5606,$5607,$5608
	.dc.w	$5609,$560a,$57fe,$57ff,$0000,$0000,$0000,$0000
	.dc.w	$0000,$6501,$6502,$6503,$6504,$6505,$6506,$6507
	.dc.w	$6508,$6509,$650a,$6901,$6902,$6903,$6904,$6905
	.dc.w	$6906,$6907,$6908,$6909,$690a,$6b01,$6b02,$6b03
	.dc.w	$6b04,$6b05,$6b06,$6b07,$6b08,$6b09,$6b0a,$80fc
	.dc.w	$80fd,$80fe,$80ff,$8000,$8001,$8002,$8003,$8004
	.dc.w	$8005,$8006,$8007,$8008,$8009,$800a,$9000,$9100
	.dc.w	$9200,$9300,$9600,$9900,$a001,$a002,$a003,$a004
	.dc.w	$a005,$a006,$a007,$0000,$a009,$a00a,$a00b,$a00c
	.dc.w	$a00d,$a00e,$a00f,$a010,$a011,$a012,$a013,$a014
	.dc.w	$a015,$a016,$a017,$a018,$a019,$a01a,$a01b,$a01c
	.dc.w	$a01d,$0000,$0000,$b0ff,$b2fc,$b2fd,$b2fe,$b2ff
	.dc.w	$b200,$b201,$b202,$b203,$b204,$b205,$b206,$b207
	.dc.w	$b208,$b209,$b20a,$c001,$c002,$c003,$c004,$c005
	.dc.w	$c006,$c007,$c008,$c009,$c00a,$0000,$c00c,$c00d
	.dc.w	$d000,$e000,$e001,$0000,$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000,$0000,$e00c,$e00d,$0000
	.dc.w	$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	.dc.w	$0000
L001ba8:
	.dc.w	$f96c,$f970,$f980,$f980,$f980,$f980,$f980,$f980
	.dc.w	$f980,$f980,$f980,$f980,$f980,$f97c,$f97c,$f97c
	.dc.w	$f97c,$f980,$f980,$f980,$f980,$f980,$f980,$f980
	.dc.w	$f980,$f980,$f980,$f980,$f97c,$f97c,$f97c,$f97c
	.dc.w	$f980,$f980,$f980,$f980,$f980,$f980,$f980,$f980
	.dc.w	$f980,$f980,$f980,$f97c,$f97c,$f97c,$f97c,$f980
	.dc.w	$f980,$f980,$f980,$f980,$f980,$f980,$f980,$f980
	.dc.w	$f980,$f980,$f97c,$f97c,$f97c,$f97c,$f980,$f980
	.dc.w	$f980,$f980,$f980,$f980,$f980,$f980,$f980,$f980
	.dc.w	$f980,$f97c,$f97c,$f966,$f966,$f966,$f966,$f966
	.dc.w	$f97c,$f97c,$f97c,$f97c,$f980,$f980,$f980,$f980
	.dc.w	$f980,$f980,$f980,$f980,$f980,$f980,$f980,$f97c
	.dc.w	$f97c,$f966,$f966,$f966,$f966,$f966,$f980,$f980
	.dc.w	$f984,$f984,$f984,$f984,$f988,$f988,$f988,$f988
	.dc.w	$f988,$f988,$f988,$f988,$f988,$f988,$f988,$f984
	.dc.w	$f984,$f984,$f984,$f988,$f988,$f988,$f988,$f988
	.dc.w	$f988,$f988,$f988,$f988,$f988,$f988,$f984,$f984
	.dc.w	$f984,$f984,$f988,$f988,$f988,$f988,$f988,$f988
	.dc.w	$f988,$f988,$f988,$f988,$f988,$f984,$f984,$f984
	.dc.w	$f984,$f988,$f988,$f988,$f988,$f988,$f988,$f988
	.dc.w	$f988,$f988,$f988,$f988,$f984,$f984,$f966,$f966
	.dc.w	$f966,$f966,$f966,$f984,$f984,$f984,$f984,$f988
	.dc.w	$f988,$f988,$f988,$f988,$f988,$f988,$f988,$f988
	.dc.w	$f988,$f988,$f984,$f984,$f966,$f966,$f966,$f966
	.dc.w	$f966,$f984,$f984,$f984,$f984,$f984,$f984,$f984
	.dc.w	$f984,$f984,$f984,$f984,$f984,$f984,$f984,$f984
	.dc.w	$f984,$f984,$f984,$f984,$f984,$f984,$f984,$f984
	.dc.w	$f984,$f984,$f984,$f984,$f984,$f984,$f984,$f97c
	.dc.w	$f97c,$f97c,$f97c,$f980,$f980,$f980,$f980,$f980
	.dc.w	$f980,$f980,$f980,$f980,$f980,$f980,$f97a,$f97a
	.dc.w	$f97a,$f97a,$f97a,$f97a,$f97a,$f97a,$f97a,$f97a
	.dc.w	$f97a,$f97a,$f97a,$f966,$f97a,$f97a,$f97a,$f97a
	.dc.w	$f97a,$f97a,$f97a,$f97a,$f97a,$f97a,$f97a,$f97a
	.dc.w	$f97a,$f97a,$f97a,$f97a,$f97a,$f97a,$f97a,$f97a
	.dc.w	$f97a,$f966,$f966,$f98c,$f98c,$f98c,$f98c,$f98c
	.dc.w	$f98c,$f98c,$f98c,$f98c,$f98c,$f98c,$f98c,$f98c
	.dc.w	$f98c,$f98c,$f98c,$f98c,$f98c,$f98c,$f98c,$f98c
	.dc.w	$f98c,$f98c,$f98c,$f98c,$f98c,$f966,$f98c,$f98c
	.dc.w	$f98c,$f984,$f990,$f966,$f966,$f966,$f966,$f966
	.dc.w	$f966,$f966,$f966,$f966,$f966,$f97a,$f97a
L001e26:
	move.l	a0,-(a7)
	pea.l	($4000)
	DOS	_MALLOC
	move.l	d0,(a7)+
	bmi	L00054e
	lea.l	(End+$0005b8,pc),a0
	move.l	d0,(a0)
	movea.l	d0,a0
	move.w	#$0fff,d0
	moveq.l	#$00,d1
L001e42:
	move.l	d1,(a0)+
	dbra	d0,L001e42
	movea.l	(a7)+,a0
	rts

L001e4c:
	movem.l	d1-d3/a0-a6,-(a7)
	moveq.l	#$00,d2
	lea.l	(End+$00007c,pc),a2
	lea.l	(End+$000084,pc),a3
	lea.l	($0076,a1),a4
	subq.l	#4,(a3)
	bmi	L00054e
	movea.l	(a2),a5
	addq.l	#4,(a2)
	move.l	a5,($007a,a1)
	move.l	d2,(a5)
	bra	L001e74

L001e70:
	bsr	L00153e
L001e74:
	move.w	(a0),d1
	beq	L001f1e
	cmpi.w	#$b2ff,d1
	beq	L001f24
	cmpi.w	#$b0ff,d1
	beq	L001f24
	cmpi.w	#$b2fc,d1
	bcs	L001e98
	cmpi.w	#$b2fe,d1
	bls	L001f38
L001e98:
	cmpi.w	#$b200,d1
	bcs	L001ea6
	cmpi.w	#$b20a,d1
	bls	L001f46
L001ea6:
	cmpi.w	#$c001,d1
	bcs	L001ef6
	beq	L001fd4
	cmpi.w	#$c003,d1
	bcs	L001fea
	beq	L002000
	cmpi.w	#$c005,d1
	bcs	L002016
	beq	L00202c
	cmpi.w	#$c007,d1
	bcs	L002042
	beq	L002058
	cmpi.w	#$c009,d1
	bcs	L00206e
	beq	L002084
	cmpi.w	#$c00b,d1
	bcs	L00209a
	beq	L001ef6
	cmpi.w	#$c00d,d1
	bcs	L0020b0
	beq	L0020b8
L001ef6:
	cmpi.w	#$e001,d1
	beq	L0020de
	cmpi.w	#$e00c,d1
	beq	L0020ca
	cmpi.w	#$e00d,d1
	beq	L0020d4
	move.w	d1,d0
	bsr	L0014ec
	tst.l	d0
	bpl	L001e74
	bra	L0005e6

L001f1e:
	movem.l	(a7)+,d1-d3/a0-a6
	rts

L001f24:
	lea.l	($0082,a1),a6
	tst.l	(a6)
	bne	L001f2e
	move.l	a0,(a6)
L001f2e:
	move.l	a0,($0086,a1)
	addq.l	#6,a0
	bra	L001e70

L001f38:
	lea.l	($0082,a1),a6
	tst.l	(a6)
	bne	L001f42
	move.l	a0,(a6)
L001f42:
	move.l	a0,($0086,a1)
L001f46:
	cmpi.b	#$2a,($0006,a0)		;'*'
	beq	L001f78
	lea.l	($0096,a1),a6
	move.w	d1,d0
	ext.w	d0
	st.b	(a6,d0.w)
	exg.l	a0,a1
	bsr	L002342
	exg.l	a0,a1
	moveq.l	#$08,d3
	sub.l	d3,(a3)
	bmi	L00054e
	add.l	d3,(a2)
	move.l	a0,(a5)+
	move.l	d0,(a5)+
	move.l	d2,(a5)
	addq.l	#6,a0
	bra	L001e70

L001f78:
	move.l	($0002,a0),d0
	moveq.l	#$01,d1
	lsl.l	d0,d1
	move.l	d1,($008e,a1)
	subq.l	#2,d1
	cmpi.l	#$00000100,d1
	bhi	L001f94
L001f8e:
	addq.l	#6,a0
	bra	L001e70

L001f94:
	pea.l	(L0025b6,pc)
	DOS	_PRINT
	addq.l	#4,a7
	move.l	($008e,a1),d0
	bsr	L000ca2
	bsr	L000c82
	pea.l	(L00260e,pc)
	DOS	_PRINT
	move.l	($0008,a1),-(a7)
	DOS	_PRINT
	addq.l	#8,a7
	move.l	($0004,a1),d1
	beq	L001fc8
	pea.l	(L00260e,pc)
	DOS	_PRINT
	move.l	d1,-(a7)
	DOS	_PRINT
	addq.l	#8,a7
L001fc8:
	bsr	L000c82
	move.l	(L000cd4,pc),($008e,a1)
	bra	L001f8e

L001fd4:
	addq.l	#2,a0
	move.l	(a0)+,d0
	addq.l	#1,d0
	andi.w	#$fffe,d0
	move.l	d0,($0026,a1)
	sne.b	($0097,a1)
	bra	L001e70

L001fea:
	addq.l	#2,a0
	move.l	(a0)+,d0
	addq.l	#1,d0
	andi.w	#$fffe,d0
	move.l	d0,($002a,a1)
	sne.b	($0098,a1)
	bra	L001e70

L002000:
	addq.l	#2,a0
	move.l	(a0)+,d0
	addq.l	#1,d0
	andi.w	#$fffe,d0
	move.l	d0,($002e,a1)
	sne.b	($0099,a1)
	bra	L001e70

L002016:
	addq.l	#2,a0
	move.l	(a0)+,d0
	addq.l	#1,d0
	andi.w	#$fffe,d0
	move.l	d0,($0032,a1)
	sne.b	($009a,a1)
	bra	L001e70

L00202c:
	addq.l	#2,a0
	move.l	(a0)+,d0
	addq.l	#1,d0
	andi.w	#$fffe,d0
	move.l	d0,($0036,a1)
	sne.b	($009b,a1)
	bra	L001e70

L002042:
	addq.l	#2,a0
	move.l	(a0)+,d0
	addq.l	#1,d0
	andi.w	#$fffe,d0
	move.l	d0,($003a,a1)
	sne.b	($009c,a1)
	bra	L001e70

L002058:
	addq.l	#2,a0
	move.l	(a0)+,d0
	addq.l	#1,d0
	andi.w	#$fffe,d0
	move.l	d0,($003e,a1)
	sne.b	($009d,a1)
	bra	L001e70

L00206e:
	addq.l	#2,a0
	move.l	(a0)+,d0
	addq.l	#1,d0
	andi.w	#$fffe,d0
	move.l	d0,($0042,a1)
	sne.b	($009e,a1)
	bra	L001e70

L002084:
	addq.l	#2,a0
	move.l	(a0)+,d0
	addq.l	#1,d0
	andi.w	#$fffe,d0
	move.l	d0,($0046,a1)
	sne.b	($009f,a1)
	bra	L001e70

L00209a:
	addq.l	#2,a0
	move.l	(a0)+,d0
	addq.l	#1,d0
	andi.w	#$fffe,d0
	move.l	d0,($004a,a1)
	sne.b	($00a0,a1)
	bra	L001e70

L0020b0:
	move.l	a1,-(a7)
	lea.l	(End+$000040,pc),a1
	bra	L0020be

L0020b8:
	move.l	a1,-(a7)
	lea.l	(End+$000044,pc),a1
L0020be:
	addq.l	#2,a0
	move.l	(a0)+,d0
	add.l	d0,(a1)
	movea.l	(a7)+,a1
	bra	L001e70

L0020ca:
	addq.l	#2,a0
	st.b	($00a2,a1)
	bra	L001e74

L0020d4:
	addq.l	#2,a0
	st.b	($00a3,a1)
	bra	L001e74

L0020de:
	lea.l	(End+$000080,pc),a2
	moveq.l	#$08,d3
	sub.l	d3,(a3)
	bmi	L00054e
	sub.l	d3,(a2)
	move.l	(a2),d0
	move.l	d0,(a4)
	lea.l	(End+$00007c,pc),a2
	movea.l	d0,a4
	move.l	a0,(a4)
	addq.w	#4,a4
	move.l	d2,(a4)
	addq.l	#2,a0
	bra	L001e70

L002102:
	movem.l	d1-d3/a0-a4,-(a7)
	moveq.l	#$00,d2
	moveq.l	#$04,d3
	movea.l	a0,a1
	lea.l	(End+$00007c,pc),a2
	lea.l	(End+$000084,pc),a3
	sub.l	d3,(a3)
	bmi	L00054e
	movea.l	(a2),a4
	add.l	d3,(a2)
	move.l	a4,($007e,a1)
	move.l	d2,(a4)
	moveq.l	#$08,d3
	move.l	($0082,a1),d0
	beq	L002162
	movea.l	d0,a0
L00212e:
	cmpa.l	($0086,a1),a0
	bhi	L002162
	move.w	(a0),d1
	cmpi.w	#$b2fc,d1
	beq	L002168
	cmpi.w	#$b2fd,d1
	beq	L002168
	cmpi.w	#$b2fe,d1
	beq	L002168
	cmpi.w	#$b2ff,d1
	beq	L002168
	cmpi.w	#$b0ff,d1
	beq	L002168
	move.w	d1,d0
	bsr	L0014ec
	tst.l	d0
	bpl	L00212e
	bra	L0005e6

L002162:
	movem.l	(a7)+,d1-d3/a0-a4
	rts

L002168:
	sub.l	d3,(a3)
	bmi	L00054e
	add.l	d3,(a2)
	move.l	a0,(a4)+
	move.l	d2,(a4)+
	move.l	d2,(a4)
	addq.l	#6,a0
	bsr	L00153e
	bra	L00212e

L00217e:
	movem.l	d1-d2/a0-a5,-(a7)
	lea.l	(End,pc),a4
	movea.l	($007a,a0),a1
L00218a:
	move.l	(a1)+,d0
	beq	L00233c
	movea.l	d0,a2
	movea.l	(a1)+,a3
	move.l	($0014,a3),d0
	bne	L002306
	move.w	($000a,a3),d0
	cmpa.l	(a3),a0
	bne	L0021e0
	cmpi.w	#$00fe,d0
	bne	L0021b8
	move.l	($0010,a3),d0
	add.l	d0,($0010,a4)
	st.b	($0008,a3)
	bra	L00218a

L0021b8:
	cmpi.w	#$00fd,d0
	bne	L0021cc
	move.l	($0010,a3),d0
	add.l	d0,($0020,a4)
	st.b	($0008,a3)
	bra	L00218a

L0021cc:
	cmpi.w	#$00fc,d0
	bne	L00218a
	move.l	($0010,a3),d0
	add.l	d0,($0030,a4)
	st.b	($0008,a3)
	bra	L00218a

L0021e0:
	cmpi.w	#$00fe,d0
	bne	L00222a
	cmp.b	($0001,a2),d0
	bne	L002204
	move.l	($0002,a2),d0
	move.l	($0010,a3),d1
	cmp.l	d1,d0
	bls	L00218a
	move.l	d0,($0010,a3)
	sub.l	d1,d0
	add.l	d0,($0010,a4)
	bra	L00218a

L002204:
	move.w	(a2),d0
	cmpi.b	#$fd,d0
	beq	L002306
	cmpi.b	#$fc,d0
	beq	L002306
	tst.w	($0008,a3)
	beq	L0022b8
	move.l	($0010,a3),d0
	sub.l	d0,($0010,a4)
	bra	L0022b8

L00222a:
	cmpi.w	#$00fd,d0
	bne	L002274
	cmp.b	($0001,a2),d0
	bne	L002252
	move.l	($0002,a2),d0
	move.l	($0010,a3),d1
	cmp.l	d1,d0
	bls	L00218a
	move.l	d0,($0010,a3)
	sub.l	d1,d0
	add.l	d0,($0020,a4)
	bra	L00218a

L002252:
	move.w	(a2),d0
	cmpi.b	#$fe,d0
	beq	L002306
	cmpi.b	#$fc,d0
	beq	L002306
	tst.w	($0008,a3)
	beq	L0022b8
	move.l	($0010,a3),d0
	sub.l	d0,($0020,a4)
	bra	L0022b8

L002274:
	cmpi.w	#$00fd,d0
	bne	L0022dc
	cmp.b	($0001,a2),d0
	bne	L00229c
	move.l	($0002,a2),d0
	move.l	($0010,a3),d1
	cmp.l	d1,d0
	bls	L00218a
	move.l	d0,($0010,a3)
	sub.l	d1,d0
	add.l	d0,($0030,a4)
	bra	L00218a

L00229c:
	move.w	(a2),d0
	cmpi.b	#$fd,d0
	beq	L002306
	cmpi.b	#$fc,d0
	beq	L002306
	tst.w	($0008,a3)
	beq	L0022b8
	move.l	($0010,a3),d0
	sub.l	d0,($0030,a4)
L0022b8:
	moveq.l	#$00,d0
	move.w	d0,d1
	move.b	($0001,a2),d1
	move.l	($0002,a2),d2
	move.l	a0,(a3)
	move.w	d1,($000a,a3)
	move.l	d2,($000c,a3)
	move.l	d0,($0010,a3)
L0022d2:
	move.w	#$0001,($0008,a3)
	bra	L00218a

L0022dc:
	tst.w	d0
	bne	L0022f2
	tst.b	($0001,a2)
	bne	L0022f2
	move.l	($000c,a3),d0
	cmp.l	($0002,a2),d0
	beq	L00218a
L0022f2:
	move.w	(a2),d0
	cmpi.b	#$fe,d0
	beq	L0022d2
	cmpi.b	#$fd,d0
	beq	L0022d2
	cmpi.b	#$fc,d0
	beq	L0022d2
L002306:
	movem.l	a0-a1,-(a7)
	lea.l	(End+$00007c,pc),a0
	lea.l	(End+$000084,pc),a1
	moveq.l	#$08,d0
	sub.l	d0,(a1)
	bmi	L00054e
	movea.l	(a0),a5
	add.l	d0,(a0)
	lea.l	($0014,a3),a0
L002322:
	move.l	(a0),d0
	beq	L00232c
	movea.l	d0,a0
	addq.w	#4,a0
	bra	L002322

L00232c:
	move.l	a5,(a0)
	movem.l	(a7)+,a0-a1
	move.l	a0,(a5)
	clr.l	($0004,a5)
	bra	L00218a

L00233c:
	movem.l	(a7)+,d1-d2/a0-a5
	rts

L002342:
	movem.l	d1-d2/a0-a5,-(a7)
	moveq.l	#$00,d0
	lea.l	($0006,a1),a2
	lea.l	(L00262c,pc),a3
L002350:
	moveq.l	#$00,d1
	move.b	(a2)+,d1
	beq	L002360
	rol.w	#3,d0
	add.w	d1,d1
	add.w	(a3,d1.w),d0
	bra	L002350

L002360:
	andi.w	#$0fff,d0
	asl.l	#2,d0
	movea.l	(End+$0005b8,pc),a2
	adda.l	d0,a2
L00236c:
	move.l	(a2),d0
	beq	L00238e
	exg.l	d0,a2
	lea.l	($0006,a1),a3
	movea.l	($0004,a2),a4
L00237a:
	move.b	(a3)+,d1
	beq	L002384
	cmp.b	(a4)+,d1
	beq	L00237a
	bra	L002388

L002384:
	tst.b	(a4)
	beq	L0023e6
L002388:
	lea.l	($0018,a2),a2
	bra	L00236c

L00238e:
	moveq.l	#$1c,d0
	lea.l	(End+$000080,pc),a4
	lea.l	(End+$000084,pc),a5
	sub.l	d0,(a5)
	bmi	L00054e
	sub.l	d0,(a4)
	movea.l	(a4),a3
	move.l	a3,(a2)
L0023a4:
	moveq.l	#$00,d0
	move.w	d0,d1
	move.b	($0001,a1),d1
	move.l	($0002,a1),d2
	lea.l	($0006,a1),a4
	move.l	a0,(a3)+
	move.l	a4,(a3)+
	move.w	d0,(a3)+
	move.w	d1,(a3)+
	cmpi.w	#$00fe,d1
	beq	L0023d4
	cmpi.w	#$00fd,d1
	beq	L0023d4
	cmpi.w	#$00fc,d1
	beq	L0023d4
	move.l	d2,(a3)+
	move.l	d0,(a3)+
	bra	L0023de

L0023d4:
	addq.l	#1,d2
	andi.w	#$fffe,d2
	move.l	d0,(a3)+
	move.l	d2,(a3)+
L0023de:
	move.l	d0,(a3)+
	move.l	d0,(a3)+
	move.l	(a2),d0
	bra	L0023fc

L0023e6:
	movea.l	(a2),a4
	tst.l	($0004,a0)
	bne	L0023fa
	tst.l	($0004,a4)
	beq	L0023fa
	movea.l	d0,a2
	movea.l	(a2),a3
	bra	L0023a4

L0023fa:
	exg.l	d0,a2
L0023fc:
	movem.l	(a7)+,d1-d2/a0-a5
	rts

L002402:
	movem.l	d1-d2/a0-a3,-(a7)
	moveq.l	#$00,d0
	movea.l	a0,a1
	lea.l	(L00262c,pc),a2
L00240e:
	moveq.l	#$00,d1
	move.b	(a1)+,d1
	beq	L00241e
	add.w	d1,d1
	rol.w	#3,d0
	add.w	(a2,d1.w),d0
	bra	L00240e

L00241e:
	andi.w	#$0fff,d0
	asl.l	#2,d0
	movea.l	(End+$0005b8,pc),a1
	adda.l	d0,a1
L00242a:
	move.l	(a1),d0
	beq	L00244a
	movea.l	d0,a1
	movea.l	a0,a2
	movea.l	($0004,a1),a3
L002436:
	move.b	(a2)+,d1
	beq	L002440
	cmp.b	(a3)+,d1
	beq	L002436
	bra	L002444

L002440:
	tst.b	(a3)
	beq	L00244a
L002444:
	lea.l	($0018,a1),a1
	bra	L00242a

L00244a:
	movem.l	(a7)+,d1-d2/a0-a3
	rts

L002450:
	movem.l	d1/a0-a4,-(a7)
	movea.l	($007a,a0),a1
L002458:
	move.l	(a1)+,d0
	beq	L002560
	movea.l	(a1)+,a2
	cmpa.l	(a2),a0
	bne	L002458
	tst.l	($0014,a2)
	bne	L002516
	tst.w	($0008,a2)
	ble	L00248a
	move.b	(End+$0005d2,pc),d0
	bne	L00248a
	pea.l	(L0025d5,pc)
	DOS	_PRINT
	move.l	($0004,a2),-(a7)
	DOS	_PRINT
	addq.l	#8,a7
	bsr	L000c82
L00248a:
	move.l	($000c,a2),d1
	move.w	($000a,a2),d0
	addq.b	#4,d0
	cmpi.w	#$000e,d0
	bhi	L0024b2
	move.b	(L0024a2,pc,d0.w),d0
	jmp	(L0024a2,pc,d0.w)

L0024a2:
	.dc.b	$60,$5a,$54,$10,$6c,$18,$1e,$24,$2a,$30,$36,$3c,$42,$48,$4e,$00
L0024b2:
	lea.l	(L002450,pc),a0
	bra	L0005aa

L0024ba:
	add.l	($004e,a0),d1
	bra	L00250e

L0024c0:
	add.l	($0052,a0),d1
	bra	L00250e

L0024c6:
	add.l	($0056,a0),d1
	bra	L00250e

L0024cc:
	add.l	($005a,a0),d1
	bra	L00250e

L0024d2:
	add.l	($005e,a0),d1
	bra	L00250e

L0024d8:
	add.l	($0062,a0),d1
	bra	L00250e

L0024de:
	add.l	($0066,a0),d1
	bra	L00250e

L0024e4:
	add.l	($006a,a0),d1
	bra	L00250e

L0024ea:
	add.l	($006e,a0),d1
	bra	L00250e

L0024f0:
	add.l	($0072,a0),d1
	bra	L00250e

L0024f6:
	lea.l	(End+$000058,pc),a4
	bra	L002506

L0024fc:
	lea.l	(End+$00005c,pc),a4
	bra	L002506

L002502:
	lea.l	(End+$000060,pc),a4
L002506:
	add.l	(a4),d1
	move.l	($0010,a2),d0
	add.l	d0,(a4)
L00250e:
	move.l	d1,($000c,a2)
	bra	L002458

L002516:
	pea.l	(L0025f6,pc)
	DOS	_PRINT
	move.l	($0004,a2),-(a7)
	DOS	_PRINT
	addq.l	#8,a7
	bsr	L000c82
	pea.l	(L00260e,pc)
	DOS	_PRINT
	move.l	($0008,a0),-(a7)
	DOS	_PRINT
	addq.l	#8,a7
	move.l	($0014,a2),d1
L00253a:
	movea.l	d1,a3
	movea.l	(a3),a4
	bsr	L000c78
	move.l	($0008,a4),-(a7)
	DOS	_PRINT
	addq.l	#4,a7
	move.l	($0004,a3),d1
	bne	L00253a
	lea.l	(End+$0005cc,pc),a4
	move.w	#$0001,(a4)
	bsr	L000c82
	bra	L002458

L002560:
	movem.l	(a7)+,d1/a0-a4
	rts

L002566:
	movem.l	d1-d3/a0-a1,-(a7)
	moveq.l	#$00,d3
	movea.l	($007e,a0),a1
L002570:
	move.l	(a1)+,d1
	beq	L0025a8
	move.l	(a1)+,d2
	bne	L002570
	tas.b	d3
	bne	L00259a
	pea.l	(L002613,pc)
	DOS	_PRINT
	move.l	($0008,a0),-(a7)
	DOS	_PRINT
	addq.l	#8,a7
	bsr	L000c82
	move.l	a0,-(a7)
	lea.l	(End+$0005cc,pc),a0
	move.w	#$0001,(a0)
	movea.l	(a7)+,a0
L00259a:
	addq.l	#6,d1
	move.l	d1,-(a7)
	DOS	_PRINT
	addq.l	#4,a7
	bsr	L000c82
	bra	L002570

L0025a8:
	tst.b	d3
	beq	L0025b0
	bsr	L000c82
L0025b0:
	movem.l	(a7)+,d1-d3/a0-a1
	rts

L0025b6:
	.dc.b	'Warning, illegal align size : ',$00
L0025d5:
	.dc.b	'Warning, duplicate definition : ',$00
L0025f6:
	.dc.b	'Duplicate definition : ',$00
L00260e:
	.dc.b	' in ',$00
L002613:
	.dc.b	'Undefined symbol(s) in ',$00,$00
L00262c:
	.dc.w	$a75b,$ae8e,$66c2,$f127,$36f8,$75cb,$d6dc,$9882
	.dc.w	$ae45,$c35f,$e3c2,$b38f,$e65a,$a9a0,$2f4c,$99cf
	.dc.w	$2dd6,$a241,$d0e0,$0a4a,$64ca,$b89f,$5541,$4e8f
	.dc.w	$e0d5,$7b6d,$dad5,$33a6,$7b0f,$ef08,$fc74,$fc10
	.dc.w	$8909,$9b23,$d16f,$6dd5,$e3db,$841b,$eda5,$d284
	.dc.w	$e824,$38a3,$6f67,$f725,$67f5,$c411,$e394,$1e39
	.dc.w	$bfed,$a02d,$6f7d,$14c8,$c224,$df38,$9ffa,$1d61
	.dc.w	$cb24,$0201,$9371,$050c,$ad1a,$1ac9,$e4a5,$0e4a
	.dc.w	$cb90,$aa5f,$a3fc,$0623,$f19e,$bc04,$6c4e,$2f26
	.dc.w	$82e3,$d087,$54ec,$5654,$5170,$fa29,$f8b5,$c53c
	.dc.w	$b2e4,$b9b9,$6efa,$3ae6,$8057,$2178,$4b9a,$07d3
	.dc.w	$0f5a,$ab35,$ace6,$f20b,$4705,$6231,$26bd,$431d
	.dc.w	$6ef7,$d53b,$d070,$ba11,$6041,$0894,$44d7,$ae68
	.dc.w	$7782,$8b0b,$9b51,$d82a,$94d2,$52e1,$67b6,$87e6
	.dc.w	$ffc2,$fce5,$c857,$83a4,$986a,$7f58,$5813,$14e5
	.dc.w	$bb69,$7009,$203b,$01b1,$3ad0,$cc39,$c9ae,$9397
	.dc.w	$6c3e,$22b7,$5dbd,$9798,$2fcb,$7ec4,$7e47,$4943
	.dc.w	$d408,$6128,$429d,$75a0,$390d,$ce39,$3e97,$6d30
	.dc.w	$ad79,$5baa,$899b,$eefb,$185d,$ffd8,$be6c,$4490
	.dc.w	$c158,$5776,$fb70,$33f7,$8f82,$58e1,$cd7f,$06b1
	.dc.w	$ca6c,$92cc,$4bea,$89c6,$592e,$1094,$1890,$06c5
	.dc.w	$8a67,$52ec,$4ac2,$35b6,$3e28,$6c2a,$6f5f,$6e1a
	.dc.w	$c310,$d616,$abb8,$75f9,$f237,$a2f1,$8ca5,$8fe2
	.dc.w	$2f27,$5a8a,$308c,$81dd,$450d,$0122,$2b30,$9c6b
	.dc.w	$9073,$2588,$9af7,$a594,$e371,$c4fd,$13b9,$dfe7
	.dc.w	$a8a6,$6e50,$acc7,$1865,$a423,$25c2,$0100,$919d
	.dc.w	$3287,$7322,$27b5,$1f97,$33ea,$68b1,$b4c5,$f6d4
	.dc.w	$f6dd,$803e,$c681,$f25c,$5478,$cc0a,$f0c8,$54be
	.dc.w	$b05a,$d3e4,$4aeb,$dd02,$d594,$950d,$6fc2,$dba9
	.dc.w	$20c5,$9e54,$76ac,$16bb,$6405,$fafa,$f381,$d7c7
	.dc.w	$02e5,$32ce,$0492,$e4d5,$cf7d,$4a11,$3dbe,$8766
	.dc.w	$1f6c,$c892,$bd56,$8582,$cbc3,$b992,$1039,$28b8
L00282c:
	movem.l	d1-d4/d7/a1-a4,-(a7)
	bra	L002840

L002832:
	movem.l	d1-d4/d7/a1-a4,-(a7)
	bsr	L00657c
	tst.l	d0
	bne	L0028d0
L002840:
	cmpi.w	#$d100,(a2)
	beq	L002862
	cmpi.w	#$0068,(a2)		;'h'
	beq	L00288e
	moveq.l	#$00,d1
	moveq.l	#$00,d2
	moveq.l	#$00,d3
	bsr	L0028da
	movea.l	a2,a0
	movea.l	d0,a1
	bsr	L001e4c
	movea.l	a1,a0
	bra	L0028c8

L002862:
	move.l	a0,d1
	moveq.l	#$00,d2
	moveq.l	#$00,d3
	lea.l	($0006,a2),a4
L00286c:
	tst.w	(a4)
	beq	L0028c6
	move.l	a1,-(a7)
	move.l	($0018,a4),d7
	movea.l	a4,a0
	lea.l	($0020,a4),a2
	bsr	L0028da
	movea.l	a2,a0
	movea.l	d0,a1
	bsr	L001e4c
	movea.l	(a7)+,a1
	lea.l	($20,a4,d7.l),a4
	bra	L00286c

L00288e:
	move.l	a0,d1
	moveq.l	#$00,d2
	moveq.l	#$00,d3
	movea.l	a2,a3
	lea.l	($0040,a3),a4
	move.l	($0024,a3),d4
	beq	L0028c6
L0028a0:
	move.l	a1,-(a7)
	move.l	($0020,a4),d7
	movea.l	a4,a0
	movea.l	($001c,a4),a2
	adda.l	a3,a2
	bsr	L0028da
	movea.l	a2,a0
	movea.l	d0,a1
	bsr	L001e4c
	movea.l	(a7)+,a1
	lea.l	($0030,a4),a4
	sub.l	#$00000030,d4
	bne	L0028a0
L0028c6:
	suba.l	a0,a0
L0028c8:
	moveq.l	#$00,d0
L0028ca:
	movem.l	(a7)+,d1-d4/d7/a1-a4
	rts

L0028d0:
	bpl	L0028ca
	move.w	#$0001,($05cc,a6)
	bra	L0028ca

L0028da:
	movem.l	d1-d5/a0-a6,-(a7)
	moveq.l	#$00,d4
	move.l	#$000000a4,d5
	lea.l	(End+$00007c,pc),a3
	lea.l	(End+$000084,pc),a4
	sub.l	d5,(a4)
	bmi	L00054e
	movea.l	(a3),a5
	add.l	d5,(a3)
	lea.l	(End+$000068,pc),a3
	movea.l	(a3),a6
	move.l	a5,(a6)
	lea.l	($008a,a5),a6
	move.l	a6,(a3)
	move.l	d4,(a6)
	move.l	a1,(a5)
	move.l	d1,($0004,a5)
	move.l	a0,($0008,a5)
	move.l	d7,($000c,a5)
	move.l	d4,($0014,a5)
	move.l	d4,($0018,a5)
	move.l	d2,($001c,a5)
	move.l	d3,($0020,a5)
	move.l	a2,($0010,a5)
	move.w	d4,($0024,a5)
	move.l	d4,($0026,a5)
	move.l	d4,($002a,a5)
	move.l	d4,($002e,a5)
	move.l	d4,($0032,a5)
	move.l	d4,($0036,a5)
	move.l	d4,($003a,a5)
	move.l	d4,($003e,a5)
	move.l	d4,($0042,a5)
	move.l	d4,($0046,a5)
	move.l	d4,($004a,a5)
	move.l	d4,($0076,a5)
	move.l	d4,($007a,a5)
	move.l	d4,($007e,a5)
	move.l	d4,($0082,a5)
	move.l	d4,($0086,a5)
	move.l	(L000cd4,pc),($008e,a5)
	move.l	d4,($0092,a5)
	move.l	d4,($0096,a5)
	move.l	d4,($009a,a5)
	move.l	d4,($009e,a5)
	move.w	d4,($00a2,a5)
	move.l	a5,d0
	movem.l	(a7)+,d1-d5/a0-a6
	rts

L00298c:
	movem.l	d1-d2/a1-a3/a6,-(a7)
	lea.l	(End,pc),a6
	tst.b	($05d1,a6)
	beq	L0029b2
	pea.l	(L002ab4,pc)
	DOS	_PRINT
	pea.l	($000f)
	pea.l	(a0)
	bsr	L002a66
	bsr	L000c82
	lea.l	($000c,a7),a7
L0029b2:
	moveq.l	#$08,d1
	sub.l	d1,($0084,a6)
	bmi	L00054e
	movea.l	($007c,a6),a3
	add.l	d1,($007c,a6)
	move.w	#$ffff,($0024,a0)
	move.w	($00a2,a0),d0
	or.w	d0,($05ce,a6)
	movea.l	($0070,a6),a2
	move.l	a3,(a2)
	move.l	a0,(a3)
	addq.w	#4,a3
	clr.l	(a3)
	move.l	a3,($0070,a6)
	movem.l	(a7)+,d1-d2/a1-a3/a6
	rts

L0029e8:
	movem.l	a0-a1,-(a7)
	move.l	($0076,a0),d0
	beq	L002a0c
L0029f2:
	movea.l	d0,a1
	movea.l	(a1),a0
	addq.l	#2,a0
	bsr	L002832
	tst.l	d0
	bne	L002a06
	move.l	a0,d0
	beq	L002a06
	bsr	L00298c
L002a06:
	move.l	($0004,a1),d0
	bne	L0029f2
L002a0c:
	movem.l	(a7)+,a0-a1
	rts

L002a12:
	movem.l	a0-a1,-(a7)
	bsr	L002102
	movea.l	($007e,a0),a1
	move.l	(a1)+,d0
	beq	L002a60
L002a22:
	movea.l	d0,a0
	addq.l	#6,a0
	bsr	L002402
	move.l	d0,(a1)+
	beq	L002a5c
	movea.l	d0,a0
	movea.l	(a0),a0
	tst.w	($0024,a0)
	bne	L002a5c
	bsr	L00298c
	tst.l	($0004,a0)
	beq	L002a5c
	tst.l	($0076,a0)
	beq	L002a5c
	pea.l	(L002abe,pc)
	DOS	_PRINT
	clr.l	-(a7)
	pea.l	(a0)
	bsr	L002a66
	bsr	L000c82
	lea.l	($000c,a7),a7
L002a5c:
	move.l	(a1)+,d0
	bne	L002a22
L002a60:
	movem.l	(a7)+,a0-a1
	rts

L002a66:
	link.w	a6,#$0000
	movem.l	d1-d2/a0-a1,-(a7)
	movea.l	($0008,a6),a0
	move.l	($000c,a6),d1
	movea.l	($0008,a0),a1
	move.l	($0004,a0),d2
	pea.l	(a1)
	DOS	_PRINT
	move.l	d2,(a7)+
	beq	L002aac
	addq.w	#1,d1
L002a88:
	subq.w	#1,d1
	tst.b	(a1)+
	bne	L002a88
L002a8e:
	move.w	#$0009,-(a7)
	DOS	_PUTCHAR
	addq.l	#2,a7
	subq.w	#8,d1
	bgt	L002a8e
	move.w	#$0028,-(a7)		;'('
	DOS	_PUTCHAR
	move.l	d2,-(a7)
	DOS	_PRINT
	move.w	#$0029,-(a7)		;')'
	DOS	_PUTCHAR
	addq.l	#8,a7
L002aac:
	movem.l	(a7)+,d1-d2/a0-a1
	unlk	a6
	rts

L002ab4:
	.dc.b	'Linked : ',$00
L002abe:
	.dc.b	'Request error : ',$00,$00
L002ad0:
	link.w	a6,#-$005e
	movem.l	d1-d7/a0-a5,-(a7)
	lea.l	(End,pc),a0
	tst.b	($05d1,a0)
	beq	L002aea
	pea.l	(L005472,pc)
	DOS	_PRINT
	addq.l	#4,a7
L002aea:
	moveq.l	#$40,d0			;'@'
	add.l	d0,($007c,a0)
	sub.l	d0,($0084,a0)
	bmi	L002afa
	bsr	L0058e0
L002afa:
	bmi	L00054e
	movea.l	($007c,a0),a5
	move.l	a5,(-$0008,a6)
	lea.l	(a5),a1
	moveq.l	#$00,d0
	moveq.l	#$0f,d1
L002b0c:
	move.l	d0,-(a1)
	dbra	d1,L002b0c
	move.l	a1,(-$000c,a6)
	move.l	d0,(-$005a,a6)
	move.l	d0,(-$0056,a6)
	move.l	d0,(-$002e,a6)
	move.l	d0,(-$002a,a6)
	move.l	d0,(-$0026,a6)
	move.l	d0,(-$0022,a6)
	move.l	d0,(-$001e,a6)
	move.l	d0,(-$001a,a6)
	move.l	d0,(-$0016,a6)
	move.l	d0,(-$0012,a6)
	move.w	d0,(-$000e,a6)
	move.l	d0,(-$0042,a6)
	move.l	d0,(-$0052,a6)
	sub.l	($001c,a0),d0
	sub.l	($0020,a0),d0
	sub.l	($0024,a0),d0
	move.l	d0,(-$004e,a6)
	move.l	a5,d0
	move.l	d0,(-$003e,a6)
	add.l	($0004,a0),d0
	move.l	d0,(-$003a,a6)
	add.l	($0008,a0),d0
	move.l	d0,(-$0036,a6)
	move.l	d0,(-$004a,a6)
	add.l	($0038,a0),d0
	move.l	d0,(-$0032,a6)
	add.l	($003c,a0),d0
	move.l	d0,($0050,a0)
	move.l	d0,(-$0046,a6)
	move.l	(a0),d0
	move.l	($0084,a0),d7
	sub.l	d0,d7
	bmi	L00054e
	lea.l	(a5,d0.l),a4
	move.l	a4,(-$005e,a6)
	tst.b	($05ce,a0)
	beq	L002bb0
	bsr	L002eb2
	adda.l	($0048,a0),a3
	addq.l	#4,a3
	move.l	a3,($0048,a0)
L002bb0:
	tst.b	($05cf,a0)
	beq	L002bc4
	bsr	L002eb2
	adda.l	($004c,a0),a3
	addq.l	#4,a3
	move.l	a3,($004c,a0)
L002bc4:
	lea.l	($006c,a0),a2
	move.l	(a2),d0
	beq	L002c76
L002bce:
	movea.l	d0,a2
	movea.l	(a2),a1
	tst.b	($0097,a1)
	beq	L002be0
	lea.l	(-$003e,a6),a5
	bsr	L002f1c
L002be0:
	tst.b	($0098,a1)
	beq	L002bee
	lea.l	(-$003a,a6),a5
	bsr	L002ef0
L002bee:
	tst.b	($009b,a1)
	beq	L002bfc
	lea.l	(-$0036,a6),a5
	bsr	L002ef0
L002bfc:
	tst.b	($009e,a1)
	beq	L002c0a
	lea.l	(-$0032,a6),a5
	bsr	L002ef0
L002c0a:
	moveq.l	#$01,d5
	movea.l	(-$003e,a6),a5
	movea.l	($0010,a1),a0
	move.w	(a0),d0
	beq	L002c34
L002c18:
	move.w	d0,d1
	bsr	L0014a4
	bmi	L002e64
	add.w	d0,d0
	lea.l	(L00548e,pc),a3
	move.w	(a3,d0.w),d0
	jsr	(a3,d0.w)
	move.w	(a0),d0
	bne	L002c18
L002c34:
	addq.l	#2,a0
	move.l	a0,($0014,a1)
	move.l	($000c,a1),d0
	sub.l	a0,d0
	add.l	($0010,a1),d0
	move.l	d0,($0018,a1)
	subq.w	#1,d5
	bne	L002c52
	move.l	a5,(-$003e,a6)
	bra	L002c6e

L002c52:
	subq.w	#1,d5
	bne	L002c5c
	move.l	a5,(-$003a,a6)
	bra	L002c6e

L002c5c:
	subq.w	#3,d5
	bne	L002c66
	move.l	a5,(-$0036,a6)
	bra	L002c6e

L002c66:
	subq.w	#3,d5
	bne	L002c6e
	move.l	a5,(-$0032,a6)
L002c6e:
	addq.w	#4,a2
	move.l	(a2),d0
	bne	L002bce
L002c76:
	lea.l	(-$003e,a6),a5
	bsr	L002f4a
	lea.l	(-$003a,a6),a5
	bsr	L002f4a
	lea.l	(-$0036,a6),a5
	bsr	L002f4a
	lea.l	(-$0032,a6),a5
	bsr	L002f4a
	move.w	(End+$0005cc,pc),d0
	bne	L002e50
	move.l	(-$0042,a6),d0
	cmp.l	(End+$000054,pc),d0
	bne	L002ea2
	move.b	(End+$0005da,pc),d0
	bne	L002cb8
	bsr	L002f5c
	bmi	L002e80
L002cb8:
	move.b	(End+$0005d3,pc),d0
	bne	L002cce
	bsr	L00305e
	bsr	L003132
	move.w	(End+$0005cc,pc),d0
	bne	L002e50
L002cce:
	lea.l	(End,pc),a0
	tst.b	($05d6,a0)
	beq	L002d14
	bsr	L002eb2
	move.l	($0004,a0),(a3)+
	move.l	($0008,a0),(a3)+
	move.l	($000c,a0),(a3)+
	move.l	($0010,a0),(a3)+
	move.l	($0014,a0),(a3)+
	move.l	($0018,a0),(a3)+
	move.l	($001c,a0),(a3)+
	move.l	($0020,a0),(a3)+
	move.l	($0024,a0),(a3)+
	move.l	($0028,a0),(a3)+
	move.l	($002c,a0),(a3)+
	move.l	($0030,a0),(a3)+
	move.l	($0034,a0),(a3)+
	move.l	($0054,a0),(a3)+
L002d14:
	moveq.l	#$ff,d0
	tst.b	($05ce,a0)
	beq	L002d28
	movea.l	($0048,a0),a3
	clr.l	(a3)
	suba.l	($0040,a0),a3
	move.l	d0,-(a3)
L002d28:
	tst.b	($05cf,a0)
	beq	L002d3a
	movea.l	($004c,a0),a3
	clr.l	(a3)
	suba.l	($0044,a0),a3
	move.l	d0,-(a3)
L002d3a:
	movea.l	(-$000c,a6),a3
	move.w	#$4855,(a3)		;'HU'
	move.b	($05d4,a0),($0003,a3)
	move.l	($0098,a0),d0
	move.l	d0,($0004,a3)
	add.l	($0094,a0),d0
	move.l	d0,($0008,a3)
	move.l	($0004,a0),($000c,a3)
	move.l	(a0),d0
	sub.l	($0004,a0),d0
	move.l	d0,($0010,a3)
	move.l	($000c,a0),d0
	add.l	($0010,a0),d0
	add.l	($0014,a0),d0
	move.l	d0,($0014,a3)
	move.l	(-$005a,a6),($0018,a3)
	move.l	(-$0056,a6),($001c,a3)
	move.l	(-$001e,a6),($0020,a3)
	move.l	(-$001a,a6),d0
	add.l	(-$0016,a6),d0
	move.l	d0,($0024,a3)
	move.l	(-$0012,a6),($0028,a3)
	tst.b	($05da,a0)
	beq	L002dd4
	tst.b	($05db,a0)
	bne	L002dbc
	tst.l	(-$005a,a6)
	bne	L002e7a
	move.l	($0094,a0),d0
	cmp.l	($0098,a0),d0
	bne	L002e86
L002dbc:
	move.l	($0014,a3),d0
	cmp.l	d0,d7
	bcs	L00054e
	move.l	($000c,a3),d1
	add.l	($0010,a3),d1
	lea.l	($0040,a3),a3
	bra	L002df2

L002dd4:
	moveq.l	#$40,d1			;'@'
	add.l	($000c,a3),d1
	add.l	($0010,a3),d1
	add.l	($0018,a3),d1
	add.l	($001c,a3),d1
	add.l	($0020,a3),d1
	add.l	($0024,a3),d1
	add.l	($0028,a3),d1
L002df2:
	move.w	#$0020,-(a7)		;' '
	tst.b	($05d8,a0)
	beq	L002e06
	tst.b	($05d9,a0)
	bgt	L002e06
	ori.w	#$0080,(a7)
L002e06:
	pea.l	($009c,a0)
	DOS	_CREATE
	addq.l	#6,a7
	move.l	d0,d2
	bmi	L002e68
	move.l	d1,-(a7)
	pea.l	(a3)
	move.w	d2,-(a7)
	DOS	_WRITE
	addq.l	#6,a7
	move.l	d0,(a7)+
	bmi	L002e6e
	cmp.l	d0,d1
	bne	L002e74
	tst.b	($05da,a0)
	beq	L002e46
	move.l	(-$002c,a3),d1
	beq	L002e46
	bsr	L002ec6
	move.l	d1,-(a7)
	pea.l	(a4)
	move.w	d2,-(a7)
	DOS	_WRITE
	addq.l	#6,a7
	move.l	d0,(a7)+
	bmi	L002e6e
	cmp.l	d0,d1
	bne	L002e74
L002e46:
	move.w	d2,-(a7)
	DOS	_CLOSE
	addq.l	#2,a7
	tst.l	d0
	bmi	L002e6e
L002e50:
	lea.l	(End,pc),a0
	move.l	a4,($007c,a0)
	move.l	d7,($0084,a0)
L002e5c:
	movem.l	(a7)+,d1-d7/a0-a5
	unlk	a6
	rts

L002e64:
	bra	L0005e6

L002e68:
	pea.l	(L0053ca,pc)
	bra	L002e8a

L002e6e:
	pea.l	(L0053dd,pc)
	bra	L002e8a

L002e74:
	pea.l	(L0053ef,pc)
	bra	L002e8a

L002e7a:
	pea.l	(L0053fe,pc)
	bra	L002e8a

L002e80:
	pea.l	(L005416,pc)
	bra	L002e8a

L002e86:
	pea.l	(L005431,pc)
L002e8a:
	DOS	_PRINT
	pea.l	(End+$00009c,pc)
	DOS	_PRINT
	addq.l	#8,a7
	bsr	L000c82
	lea.l	(End+$0005cc,pc),a0
	move.w	#$0001,(a0)
	bra	L002e5c

L002ea2:
	pea.l	(L005454,pc)
	DOS	_PRINT
	addq.l	#4,a7
	lea.l	(L002ad0,pc),a0
	bra	L0005aa

L002eb2:
	movea.l	($006c,a0),a2
	movea.l	(a2),a1
	movea.l	($0052,a1),a3
	adda.l	(-$000c,a6),a3
	lea.l	($0040,a3),a3
	rts

L002ec6:
	movem.l	d1/a4,-(a7)
	lsr.l	#3,d1
	moveq.l	#$00,d0
	bra	L002ed4

L002ed0:
	move.l	d0,(a4)+
	move.l	d0,(a4)+
L002ed4:
	dbra	d1,L002ed0
	clr.w	d1
	subq.l	#1,d1
	bcc	L002ed0
	moveq.l	#$07,d1
	and.l	(a7),d1
	bra	L002ee6

L002ee4:
	move.b	d0,(a4)+
L002ee6:
	dbra	d1,L002ee4
	movem.l	(a7)+,d1/a4
	rts

L002ef0:
	movem.l	d0-d1/a0,-(a7)
	movea.l	(a5),a0
	move.l	(-$0008,a6),d0
	sub.l	a0,d0
	move.l	($008e,a1),d1
	subq.l	#1,d1
	and.l	d1,d0
	beq	L002f16
	lsr.l	#1,d0
	bcc	L002f10
	clr.b	(a0)+
	bra	L002f10

L002f0e:
	clr.w	(a0)+
L002f10:
	subq.l	#1,d0
	bcc	L002f0e
	move.l	a0,(a5)
L002f16:
	movem.l	(a7)+,d0-d1/a0
	rts

L002f1c:
	movem.l	d0-d1/a0,-(a7)
	movea.l	(a5),a0
	move.l	(-$0008,a6),d0
	sub.l	a0,d0
	move.l	($008e,a1),d1
	subq.l	#1,d1
	and.l	d1,d0
	beq	L002f44
	lsr.l	#1,d0
	bcc	L002f3e
	clr.b	(a0)+
	bra	L002f3e

L002f3a:
	move.w	#$4e71,(a0)+		;'Nq'
L002f3e:
	subq.l	#1,d0
	bcc	L002f3a
	move.l	a0,(a5)
L002f44:
	movem.l	(a7)+,d0-d1/a0
	rts

L002f4a:
	move.l	a0,-(a7)
	movea.l	(a5),a0
	move.w	a0,-(a7)
	lsr.w	(a7)+
	bcc	L002f58
	clr.b	(a0)+
	move.l	a0,(a5)
L002f58:
	movea.l	(a7)+,a0
	rts

L002f5c:
	movem.l	d1-d7/a0-a1,-(a7)
	movea.l	(-$005e,a6),a0
	subq.l	#6,a0
	move.l	(-$005a,a6),d1
	move.l	d1,d2
	move.l	d1,d3
	lsr.l	#1,d3
	btst.l	#$00,d3
	beq	L002f78
	subq.l	#3,d3
L002f78:
	tst.l	d3
	beq	L002fb2
	move.l	($02,a0,d3.l),d4
	move.l	d3,d5
	move.l	d5,d6
	add.l	d6,d6
L002f86:
	cmp.l	d6,d2
	bcs	L002faa
	beq	L002f98
	move.l	($08,a0,d6.l),d7
	cmp.l	($02,a0,d6.l),d7
	bls	L002f98
	addq.l	#6,d6
L002f98:
	cmp.l	($02,a0,d6.l),d4
	bcc	L002faa
	move.l	($02,a0,d6.l),($02,a0,d5.l)
	move.l	d6,d5
	add.l	d6,d6
	bra	L002f86

L002faa:
	move.l	d4,($02,a0,d5.l)
	subq.l	#6,d3
	bra	L002f78

L002fb2:
	moveq.l	#$06,d3
L002fb4:
	cmp.l	#$00000006,d2
	bls	L002ff8
	move.l	($02,a0,d2.l),d4
	move.l	($0008,a0),($02,a0,d2.l)
	subq.l	#6,d2
	move.l	d3,d5
	move.l	d5,d6
	add.l	d6,d6
L002fce:
	cmp.l	d6,d2
	bcs	L002ff2
	beq	L002fe0
	move.l	($08,a0,d6.l),d7
	cmp.l	($02,a0,d6.l),d7
	bls	L002fe0
	addq.l	#6,d6
L002fe0:
	cmp.l	($02,a0,d6.l),d4
	bcc	L002ff2
	move.l	($02,a0,d6.l),($02,a0,d5.l)
	move.l	d6,d5
	add.l	d6,d6
	bra	L002fce

L002ff2:
	move.l	d4,($02,a0,d5.l)
	bra	L002fb4

L002ff8:
	movea.l	(-$005e,a6),a0
	movea.l	a0,a1
	move.l	(-$005a,a6),d2
	move.l	d2,d3
	move.l	#$00010000,d4
	moveq.l	#$40,d5			;'@'
	add.l	(-$000c,a6),d5
	moveq.l	#$00,d7
	bra	L003034

L003014:
	move.l	d5,d1
	addq.l	#2,a0
	move.l	(a0)+,d5
	or.w	d5,d7
	move.l	d5,d0
	sub.l	d1,d0
	cmp.l	d4,d0
	bcc	L00302e
	move.w	d0,(a1)+
	subq.l	#4,d3
	subq.l	#6,d2
	bcc	L003014
	bra	L003038

L00302e:
	move.w	#$0001,(a1)+
	move.l	d0,(a1)+
L003034:
	subq.l	#6,d2
	bcc	L003014
L003038:
	movea.l	a1,a4
	move.l	(-$005a,a6),d0
	sub.l	d3,d0
	move.l	d3,(-$005a,a6)
	lea.l	(End,pc),a0
	sub.l	d0,($007c,a0)
	add.l	d0,($0084,a0)
	moveq.l	#$00,d0
	btst.l	d0,d7
	beq	L003058
	moveq.l	#$ff,d0
L003058:
	movem.l	(a7)+,d1-d7/a0-a1
	rts

L00305e:
	movem.l	d1-d3/a0-a3,-(a7)
	moveq.l	#$00,d3
	lea.l	(End+$00006c,pc),a2
L003068:
	move.l	(a2),d0
	beq	L003120
	movea.l	d0,a2
	movea.l	(a2),a1
	movea.l	($007a,a1),a3
L003076:
	tst.l	(a3)
	beq	L00311a
	movea.l	($0004,a3),a0
	cmpa.l	(a0),a1
	bne	L003114
	move.w	($000a,a0),d0
	beq	L0030de
	cmpi.w	#$0001,d0
	beq	L0030c6
	cmpi.w	#$0002,d0
	beq	L0030cc
	cmpi.w	#$0003,d0
	beq	L0030d2
	cmpi.w	#$0004,d0
	beq	L0030d8
	cmpi.w	#$000a,d0
	bls	L0030de
	cmpi.w	#$00fc,d0
	beq	L0030be
	cmpi.w	#$00fd,d0
	beq	L0030be
	cmpi.w	#$00fe,d0
	beq	L0030c2
	bra	L00312a

L0030be:
	moveq.l	#$00,d1
	bra	L0030e2

L0030c2:
	moveq.l	#$03,d1
	bra	L0030e2

L0030c6:
	move.w	#$0201,d1
	bra	L0030e2

L0030cc:
	move.w	#$0202,d1
	bra	L0030e2

L0030d2:
	move.w	#$0203,d1
	bra	L0030e2

L0030d8:
	move.w	#$0204,d1
	bra	L0030e2

L0030de:
	move.w	#$0200,d1
L0030e2:
	move.l	($000c,a0),d2
	subq.l	#6,d7
	bmi	L00054e
	addq.l	#6,d3
	move.w	d1,(a4)+
	move.l	d2,(a4)+
	movea.l	($0004,a0),a0
L0030f6:
	subq.l	#1,d7
	bmi	L00054e
	addq.l	#1,d3
	move.b	(a0)+,(a4)+
	bne	L0030f6
	move.l	a4,d0
	btst.l	#$00,d0
	beq	L003114
	subq.l	#1,d7
	bmi	L00054e
	addq.l	#1,d3
	clr.b	(a4)+
L003114:
	addq.l	#8,a3
	bra	L003076

L00311a:
	addq.w	#4,a2
	bra	L003068

L003120:
	move.l	d3,(-$0056,a6)
	movem.l	(a7)+,d1-d3/a0-a3
	rts

L00312a:
	lea.l	(L00305e,pc),a0
	bra	L0005aa

L003132:
	movem.l	d1-d7/a0-a5,-(a7)
	lea.l	(End+$00006c,pc),a2
L00313a:
	move.l	(a2),d0
	beq	L003174
	movea.l	d0,a2
	movea.l	(a2),a1
	tst.l	($0018,a1)
	beq	L003170
	movea.l	($0014,a1),a3
	move.l	(a3)+,d1
	move.l	(a3)+,d3
	move.l	($0c,a3,d1.l),d2
	mulu.w	#$0012,d2
	sub.l	d2,d3
	bmi	L003690
	move.l	(a3)+,d4
	add.l	d1,(-$001e,a6)
	add.l	d2,(-$001a,a6)
	add.l	d3,(-$0016,a6)
	add.l	d4,(-$0012,a6)
L003170:
	addq.w	#4,a2
	bra	L00313a

L003174:
	move.l	(-$001e,a6),d0
	add.l	(-$001a,a6),d0
	add.l	(-$0016,a6),d0
	add.l	(-$0012,a6),d0
	sub.l	d0,d7
	bmi	L00054e
	adda.l	d0,a5
	lea.l	(End,pc),a2
	move.l	a5,($007c,a2)
	move.l	d7,($0084,a2)
	moveq.l	#$00,d0
	move.l	d0,(-$002e,a6)
	move.l	d0,(-$002a,a6)
	move.l	d0,(-$0026,a6)
	move.l	d0,(-$0022,a6)
	lea.l	(End+$00006c,pc),a2
L0031ae:
	move.l	(a2),d0
	beq	L00367a
	movea.l	d0,a2
	movea.l	(a2),a1
	tst.l	($0018,a1)
	beq	L003674
	movea.l	($0014,a1),a3
	move.l	(a3)+,d1
	move.l	(a3)+,d3
	move.l	($0c,a3,d1.l),d2
	mulu.w	#$0012,d2
	sub.l	d2,d3
	move.l	(a3)+,d4
	move.l	d1,d7
	beq	L003200
	movea.l	(-$002e,a6),a5
	adda.l	a4,a5
	move.l	($004e,a1),d5
L0031e2:
	move.l	(a3)+,d0
	move.w	(a3)+,d6
	beq	L0031f4
	add.l	d5,d0
	move.l	d0,(a5)+
	move.w	d6,(a5)+
	subq.l	#6,d7
	bhi	L0031e2
	bra	L003200

L0031f4:
	add.l	(-$002a,a6),d0
	move.l	d0,(a5)+
	move.w	d6,(a5)+
	subq.l	#6,d7
	bhi	L0031e2
L003200:
	move.l	d2,d7
	beq	L0034ee
	move.l	(-$002a,a6),d0
	mulu.w	#$0012,d0
	add.l	(-$001e,a6),d0
	lea.l	(a4,d0.l),a5
L003216:
	move.l	(a3)+,d6
	cmp.l	#$2e626600,d6		;'.bf'<<8
	beq	L00333c
	cmp.l	#$2e656600,d6		;'.ef'<<8
	beq	L003366
	cmp.l	#$2e626200,d6		;'.bb'<<8
	beq	L00333c
	cmp.l	#$2e656200,d6		;'.eb'<<8
	beq	L003366
	cmp.l	#$2e656f73,d6		;'.eos'
	beq	L00338a
	cmp.l	#$2e66696c,d6		;'.fil'
	beq	L0033ae
	cmp.l	#$2e746578,d6		;'.tex'
	beq	L0033ae
	cmp.l	#$2e646174,d6		;'.dat'
	beq	L0033ae
	cmp.l	#$2e627373,d6		;'.bss'
	beq	L0033ae
	cmp.l	#$2e726461,d6		;'.rda'
	beq	L0033ae
	cmp.l	#$2e726273,d6		;'.rbs'
	beq	L0033ae
	cmp.l	#$2e726c64,d6		;'.rld'
	beq	L0033ae
	cmp.l	#$2e726c62,d6		;'.rlb'
	beq	L0033ae
	move.l	d6,(a5)+
	move.l	(a3)+,(a5)+
	tst.l	d6
	bne	L0032aa
	move.l	-(a5),d6
	add.l	(-$0022,a6),d6
	move.l	d6,(a5)+
L0032aa:
	move.b	($0009,a3),d0
	bne	L0033d6
	move.l	(a3)+,d6
	move.w	(a3)+,d0
	cmp.w	#$0001,d0
	bne	L0032c2
	add.l	($004e,a1),d6
	bra	L003326

L0032c2:
	cmp.w	#$0002,d0
	bne	L0032d2
	add.l	($0052,a1),d6
	sub.l	(End+$000004,pc),d6
	bra	L003326

L0032d2:
	cmp.w	#$0003,d0
	bne	L0032e2
	add.l	($0056,a1),d6
	sub.l	(End,pc),d6
	bra	L003326

L0032e2:
	cmp.w	#$0005,d0
	bne	L0032ee
	add.l	($005e,a1),d6
	bra	L003326

L0032ee:
	cmp.w	#$0006,d0
	bne	L0032fa
	add.l	($0062,a1),d6
	bra	L003326

L0032fa:
	cmp.w	#$0008,d0
	bne	L003306
	add.l	($006a,a1),d6
	bra	L003326

L003306:
	cmp.w	#$0009,d0
	bne	L003312
	add.l	($006e,a1),d6
	bra	L003326

L003312:
	cmpi.w	#$fffc,d0
	bcc	L003326
	cmpi.w	#$00fc,d0
	beq	L003326
	cmpi.w	#$00fd,d0
	bne	L003690
L003326:
	move.l	d6,(a5)+
	move.w	d0,(a5)+
	move.l	(a3)+,(a5)+
L00332c:
	moveq.l	#$12,d6
	sub.l	d6,d7
	bhi	L003216
	bcs	L003688
	bra	L0034ee

L00333c:
	move.l	d6,(a5)+
	move.l	(a3)+,(a5)+
	move.l	(a3)+,d0
	add.l	($004e,a1),d0
	move.l	d0,(a5)+
	move.l	(a3)+,(a5)+
	move.w	(a3)+,(a5)+
	move.l	(a3)+,(a5)+
	move.l	(a3)+,(a5)+
	move.l	(a3)+,(a5)+
	move.l	(a3)+,d0
	add.l	(-$002a,a6),d0
	move.l	d0,(a5)+
	move.w	(a3)+,(a5)+
	moveq.l	#$12,d6
	sub.l	d6,d7
	bhi	L00332c
	bra	L003688

L003366:
	move.l	d6,(a5)+
	move.l	(a3)+,(a5)+
	move.l	(a3)+,d0
	add.l	($004e,a1),d0
	move.l	d0,(a5)+
	move.l	(a3)+,(a5)+
	move.w	(a3)+,(a5)+
	move.l	(a3)+,(a5)+
	move.l	(a3)+,(a5)+
	move.l	(a3)+,(a5)+
	move.l	(a3)+,(a5)+
	move.w	(a3)+,(a5)+
	moveq.l	#$12,d6
	sub.l	d6,d7
	bhi	L00332c
	bra	L003688

L00338a:
	move.l	d6,(a5)+
	move.l	(a3)+,(a5)+
	move.l	(a3)+,(a5)+
	move.l	(a3)+,(a5)+
	move.w	(a3)+,(a5)+
	move.l	(a3)+,d0
	add.l	(-$002a,a6),d0
	move.l	d0,(a5)+
	move.l	(a3)+,(a5)+
	move.l	(a3)+,(a5)+
	move.l	(a3)+,(a5)+
	move.w	(a3)+,(a5)+
	moveq.l	#$12,d6
	sub.l	d6,d7
	bhi	L00332c
	bra	L003688

L0033ae:
	move.l	d6,(a5)+
	move.l	(a3)+,(a5)+
	move.l	(a3)+,(a5)+
	move.l	(a3)+,(a5)+
	move.w	(a3)+,(a5)+
	move.l	(a3)+,(a5)+
	move.l	(a3)+,(a5)+
	move.l	(a3)+,(a5)+
	move.w	(a3)+,(a5)+
	move.l	(a3)+,d0
	beq	L0033c8
	add.l	(-$0022,a6),d0
L0033c8:
	move.l	d0,(a5)+
	moveq.l	#$12,d6
	sub.l	d6,d7
	bhi	L00332c
	bra	L003688

L0033d6:
	cmp.b	#$01,d0
	bne	L003690
	move.l	(a3)+,d6
	move.w	(a3)+,d0
	cmp.w	#$0001,d0
	bne	L0033ee
	add.l	($004e,a1),d6
	bra	L003462

L0033ee:
	cmp.w	#$0002,d0
	bne	L0033fe
	add.l	($0052,a1),d6
	sub.l	(End+$000004,pc),d6
	bra	L00346e

L0033fe:
	cmp.w	#$0003,d0
	bne	L00340e
	add.l	($0056,a1),d6
	sub.l	(End,pc),d6
	bra	L00346e

L00340e:
	cmp.w	#$0005,d0
	bne	L00341a
	add.l	($005e,a1),d6
	bra	L00346e

L00341a:
	cmp.w	#$0006,d0
	bne	L003426
	add.l	($0062,a1),d6
	bra	L00346e

L003426:
	cmp.w	#$0008,d0
	bne	L003432
	add.l	($006a,a1),d6
	bra	L00346e

L003432:
	cmp.w	#$0009,d0
	bne	L00343e
	add.l	($006e,a1),d6
	bra	L00346e

L00343e:
	cmpi.w	#$ffff,d0
	beq	L00346e
	cmpi.w	#$fffc,d0
	bcs	L003690
	move.w	(a3),d5
	cmp.w	#$0008,d5
	beq	L003492
	cmp.w	#$0009,d5
	beq	L003492
	cmp.w	#$000a,d5
	beq	L003492
	bra	L00346e

L003462:
	move.w	(a3),d5
	and.w	#$0030,d5
	cmp.w	#$0020,d5		;' '
	beq	L0034be
L00346e:
	move.l	d6,(a5)+
	move.w	d0,(a5)+
	move.l	(a3)+,(a5)+
	move.l	(a3)+,d0
	beq	L00347c
	add.l	(-$002a,a6),d0
L00347c:
	move.l	d0,(a5)+
	move.l	(a3)+,(a5)+
	move.l	(a3)+,(a5)+
	move.l	(a3)+,(a5)+
	move.w	(a3)+,(a5)+
	moveq.l	#$12,d6
	sub.l	d6,d7
	bhi	L00332c
	bra	L003688

L003492:
	move.l	d6,(a5)+
	move.w	d0,(a5)+
	move.l	(a3)+,(a5)+
	move.l	(a3)+,d0
	beq	L0034a0
	add.l	(-$002a,a6),d0
L0034a0:
	move.l	d0,(a5)+
	move.l	(a3)+,(a5)+
	move.l	(a3)+,(a5)+
	move.l	(a3)+,d0
	beq	L0034ae
	add.l	(-$002a,a6),d0
L0034ae:
	move.l	d0,(a5)+
	move.w	(a3)+,(a5)+
	moveq.l	#$12,d6
	sub.l	d6,d7
	bhi	L00332c
	bra	L003688

L0034be:
	move.l	d6,(a5)+
	move.w	d0,(a5)+
	move.l	(a3)+,(a5)+
	move.l	(a3)+,d0
	beq	L0034cc
	add.l	(-$002a,a6),d0
L0034cc:
	move.l	d0,(a5)+
	move.l	(a3)+,(a5)+
	move.l	(a3)+,d0
	add.l	(-$002e,a6),d0
	move.l	d0,(a5)+
	move.l	(a3)+,d0
	add.l	(-$002a,a6),d0
	move.l	d0,(a5)+
	move.w	(a3)+,(a5)+
	moveq.l	#$12,d6
	sub.l	d6,d7
	bhi	L00332c
	bra	L003688

L0034ee:
	move.l	d3,d7
	beq	L00363e
	move.l	(-$0026,a6),d0
	mulu.w	#$0012,d0
	add.l	(-$001a,a6),d0
	add.l	(-$001e,a6),d0
	lea.l	(a4,d0.l),a5
	move.l	(End,pc),d5
L00350c:
	move.l	(a3)+,d6
	move.l	d6,(a5)+
	move.l	(a3)+,(a5)+
	tst.l	d6
	bne	L00351e
	move.l	-(a5),d6
	add.l	(-$0022,a6),d6
	move.l	d6,(a5)+
L00351e:
	move.w	($0004,a3),d6
	cmpi.w	#$00fe,d6
	bhi	L003778
	cmpi.w	#$00fc,d6
	bcc	L003540
	cmpi.w	#$fffe,d6
	bhi	L003778
	cmpi.w	#$fffc,d6
	bcs	L0035d8
L003540:
	move.l	(-$0008,a5),d0
	beq	L003554
	lea.l	(End+$0001a4,pc),a0
	clr.b	(a0)
	move.l	(-$0004,a5),-(a0)
	move.l	d0,-(a0)
	bra	L003564

L003554:
	movea.l	($0014,a1),a0
	move.l	(a0)+,d0
	add.l	(a0)+,d0
	add.l	(-$0004,a3),d0
	lea.l	($04,a0,d0.l),a0
L003564:
	bsr	L002402
	tst.l	d0
	beq	L003690
	movea.l	d0,a0
	move.l	($000c,a0),d0
	move.w	($000a,a0),d6
	cmp.b	#$fe,d6
	beq	L003586
	cmp.b	#$fd,d6
	beq	L003590
	bra	L003598

L003586:
	sub.l	d5,d0
	move.l	d0,(a5)+
	move.w	#$0003,(a5)+
	bra	L00359e

L003590:
	move.l	d0,(a5)+
	move.w	#$0006,(a5)+
	bra	L00359e

L003598:
	move.l	d0,(a5)+
	move.w	#$0009,(a5)+
L00359e:
	addq.l	#6,a3
	move.l	(a3)+,(a5)+
L0035a2:
	move.b	(-$0001,a5),d0
	beq	L0035ca
	cmp.b	#$01,d0
	bne	L003690
	moveq.l	#$12,d6
	sub.l	d6,d7
	bls	L003688
	move.l	(a3)+,d0
	beq	L0035c0
	add.l	(-$002a,a6),d0
L0035c0:
	move.l	d0,(a5)+
	move.l	(a3)+,(a5)+
	move.l	(a3)+,(a5)+
	move.l	(a3)+,(a5)+
	move.w	(a3)+,(a5)+
L0035ca:
	moveq.l	#$12,d6
	sub.l	d6,d7
	bhi	L00350c
	bcs	L003688
	bra	L00363e

L0035d8:
	cmp.w	#$0001,d6
	bne	L0035e4
	move.l	($004e,a1),d0
	bra	L003632

L0035e4:
	cmp.w	#$0002,d6
	bne	L0035f4
	move.l	($0052,a1),d0
	sub.l	(End+$000004,pc),d0
	bra	L003632

L0035f4:
	cmp.w	#$0003,d6
	bne	L003604
	move.l	($0056,a1),d0
	sub.l	(End,pc),d0
	bra	L003632

L003604:
	cmp.w	#$0005,d6
	bne	L003610
	move.l	($005e,a1),d0
	bra	L003632

L003610:
	cmp.w	#$0006,d6
	bne	L00361c
	move.l	($0062,a1),d0
	bra	L003632

L00361c:
	cmp.w	#$0008,d6
	bne	L003628
	move.l	($006a,a1),d0
	bra	L003632

L003628:
	cmp.w	#$0009,d6
	bne	L003690
	move.l	($006e,a1),d0
L003632:
	add.l	(a3)+,d0
	move.l	d0,(a5)+
	move.w	(a3)+,(a5)+
	move.l	(a3)+,(a5)+
	bra	L0035a2

L00363e:
	move.l	d4,d7
	beq	L00365c
	move.l	(-$0022,a6),d0
	add.l	(-$0016,a6),d0
	add.l	(-$001a,a6),d0
	add.l	(-$001e,a6),d0
	lea.l	(a4,d0.l),a5
L003656:
	move.b	(a3)+,(a5)+
	subq.l	#1,d7
	bne	L003656
L00365c:
	divu.w	#$0012,d2
	divu.w	#$0012,d3
	add.l	d1,(-$002e,a6)
	add.l	d2,(-$002a,a6)
	add.l	d3,(-$0026,a6)
	add.l	d4,(-$0022,a6)
L003674:
	addq.w	#4,a2
	bra	L0031ae

L00367a:
	movem.l	(a7)+,d1-d7/a0-a5
	movea.l	(End+$00007c,pc),a5
	move.l	(End+$000084,pc),d7
	rts

L003688:
	lea.l	(L003132,pc),a0
	bra	L0005aa

L003690:
	pea.l	(L0052e6,pc)
	DOS	_PRINT
	move.l	($0008,a1),-(a7)
	DOS	_PRINT
	addq.l	#8,a7
	move.l	($0004,a1),d0
	beq	L0036b2
	pea.l	(L00539d,pc)
	DOS	_PRINT
	move.l	($0004,a1),-(a7)
	DOS	_PRINT
	addq.l	#8,a7
L0036b2:
	bsr	L000c82
	lea.l	(End+$0005cc,pc),a0
	move.w	#$0001,(a0)
	movem.l	(a7)+,d1-d7/a0-a5
	unlk	a6
	rts

L0036c6:
	movea.l	($007e,a1),a3
	subq.l	#1,d0
	mulu.w	#$0008,d0
	adda.l	d0,a3
	movea.l	($0004,a3),a3
	moveq.l	#$00,d0
	move.w	($000a,a3),d0
	move.l	($000c,a3),d1
	rts

L0036e2:
	cmp.l	#$000000ff,d1
	bgt	L0037a4
	cmp.l	#$ffffff80,d1
	blt	L0037a4
	rts

L0036f8:
	cmp.l	#$0000007f,d1
	bgt	L0037a4
	cmp.l	#$ffffff80,d1
	blt	L0037a4
	rts

L00370e:
	cmp.l	#$0000ffff,d1
	bgt	L0037a4
	cmp.l	#$ffff8000,d1
	blt	L0037a4
	rts

L003724:
	cmp.l	#$00007fff,d1
	bgt	L0037a4
	cmp.l	#$ffff8000,d1
	blt	L0037a4
	rts

L003736:
	pea.l	(L0053a2,pc)
	DOS	_PRINT
	moveq.l	#$c0,d0
	add.l	a5,d0
	sub.l	(-$000c,a6),d0
	move.w	d5,d1
	subq.w	#1,d1
	beq	L003790
	subq.w	#1,d1
	beq	L003786
	subq.w	#3,d1
	beq	L00376e
	subq.w	#3,d1
	beq	L00375e
	lea.l	(L003736,pc),a0
	bra	L0005aa

L00375e:
	pea.l	(L0053c0,pc)
	sub.l	#$00010000,d0
	sub.l	($006a,a1),d0
	bra	L003778

L00376e:
	pea.l	(L0053b7,pc)
	sub.l	#$00008000,d0
L003778:
	sub.l	($005e,a1),d0
	sub.l	(End+$000008,pc),d0
	sub.l	(End+$000004,pc),d0
	bra	L003798

L003786:
	pea.l	(L0053af,pc)
	sub.l	($0052,a1),d0
	bra	L003798

L003790:
	pea.l	(L0053a7,pc)
	sub.l	($004e,a1),d0
L003798:
	bsr	L000ca2
	DOS	_PRINT
	addq.l	#8,a7
	bra	L000c82

L0037a4:
	movem.l	d0-d1/a0,-(a7)
	pea.l	(L005341,pc)
	bra	L0037ca

L0037ae:
	movem.l	d0-d1/a0,-(a7)
	pea.l	(L005315,pc)
	bra	L0037ca

L0037b8:
	movem.l	d0-d1/a0,-(a7)
	pea.l	(L00532a,pc)
	bra	L0037ca

L0037c2:
	movem.l	d0-d1/a0,-(a7)
	pea.l	(L005302,pc)
L0037ca:
	DOS	_PRINT
	addq.l	#4,a7
	bsr	L00380c
	bsr	L003736
L0037d4:
	lea.l	(End+$0005cc,pc),a0
	move.w	#$0001,(a0)
	movem.l	(a7)+,d0-d1/a0
	rts

L0037e2:
	movem.l	d0-d1/a0,-(a7)
	pea.l	(L005382,pc)
	DOS	_PRINT
	addq.l	#4,a7
	bsr	L00380c
	bra	L0037d4

L0037f2:
	pea.l	(L00534f,pc)
	bra	L0037fc

L0037f8:
	pea.l	(L005368,pc)
L0037fc:
	DOS	_PRINT
	addq.l	#4,a7
	bsr	L00380c
	bsr	L003736
	move.w	#$0001,-(a7)
	DOS	_EXIT2

L00380c:
	move.l	($0008,a1),-(a7)
	DOS	_PRINT
	move.l	($0004,a1),(a7)
	beq	L003822
	pea.l	(L00539d,pc)
	DOS	_PRINT
	addq.l	#4,a7
	DOS	_PRINT
L003822:
	addq.l	#4,a7
	bra	L000c82

L003828:
	addq.l	#2,a0
	andi.w	#$00ff,d1
	cmpi.w	#$0001,d5
	beq	L003846
	cmpi.w	#$0002,d5
	beq	L003846
	cmpi.w	#$0005,d5
	beq	L003846
	cmpi.w	#$0008,d5
	bne	L003856
L003846:
	move.b	(a0)+,(a5)+
	dbra	d1,L003846
L00384c:
	move.w	a0,d0
	andi.w	#$0001,d0
	adda.w	d0,a0
	rts

L003856:
	adda.w	d1,a0
	addq.l	#1,a0
	bra	L00384c

L00385c:
	tst.l	($0002,a0)
	bne	L002e64
	addq.l	#6,a0
	move.w	d5,d0
	subq.w	#1,d0
	beq	L00388a
	subq.w	#1,d0
	beq	L003884
	subq.w	#3,d0
	beq	L00387e
	subq.w	#3,d0
	bne	L00388e
	move.l	a5,(-$0032,a6)
	bra	L00388e

L00387e:
	move.l	a5,(-$0036,a6)
	bra	L00388e

L003884:
	move.l	a5,(-$003a,a6)
	bra	L00388e

L00388a:
	move.l	a5,(-$003e,a6)
L00388e:
	moveq.l	#$00,d5
	move.b	d1,d5
	subq.b	#1,d1
	beq	L0038b4
	subq.b	#1,d1
	beq	L0038ae
	subq.b	#3,d1
	beq	L0038a8
	subq.b	#3,d1
	bne	L0038a6
	movea.l	(-$0032,a6),a5
L0038a6:
	rts

L0038a8:
	movea.l	(-$0036,a6),a5
	rts

L0038ae:
	movea.l	(-$003a,a6),a5
	rts

L0038b4:
	movea.l	(-$003e,a6),a5
	rts

L0038ba:
	addq.l	#2,a0
	move.l	(a0)+,d1
	cmpi.w	#$0001,d5
	beq	L0038d6
	cmpi.w	#$0002,d5
	beq	L0038d6
	cmpi.w	#$0005,d5
	beq	L0038d6
	cmpi.w	#$0008,d5
	bne	L0038e0
L0038d6:
	moveq.l	#$00,d0
L0038d8:
	subq.l	#1,d1
	bmi	L0038e2
	move.b	d0,(a5)+
	bra	L0038d8

L0038e0:
	adda.l	d1,a5
L0038e2:
	rts

L0038e4:
	movem.l	a3/a5,-(a7)
	lea.l	(End+$000048,pc),a3
L0038ec:
	addq.l	#2,a0
	move.l	(a0)+,d1
	add.l	($004e,a1),d1
	movea.l	(a3),a5
	subq.l	#6,d7
	bmi	L00054e
	addq.l	#6,(-$005a,a6)
	clr.w	(a4)+
	move.l	a5,(a4)+
	add.l	(End+$000098,pc),d1
	move.w	a5,-(a7)
	lsr.w	(a7)+
	bcc	L003910
	bsr	L003924
L003910:
	move.l	d1,(a5)+
	move.l	a5,(a3)
	movem.l	(a7)+,a3/a5
	rts

L00391a:
	movem.l	a3/a5,-(a7)
	lea.l	(End+$00004c,pc),a3
	bra	L0038ec

L003924:
	addq.l	#2,(a7)
L003926:
	rol.l	#8,d1
	move.b	d1,(a5)+
	move.l	d1,(a5)+
	ror.l	#8,d1
	subq.l	#1,a5
	rts

L003932:
	addq.l	#2,a0
	move.w	(a0)+,d0
	cmpi.w	#$0001,d5
	beq	L00394e
	cmpi.w	#$0002,d5
	beq	L00394e
	cmpi.w	#$0005,d5
	beq	L00394e
	cmpi.w	#$0008,d5
	bne	L003964
L00394e:
	bsr	L0036c6
	tst.w	d0
	beq	L00395c
	bsr	L0037c2
	bra	L003960

L00395c:
	bsr	L0036e2
L003960:
	clr.b	(a5)+
	move.b	d1,(a5)+
L003964:
	rts

L003966:
	addq.l	#2,a0
	move.w	(a0)+,d0
	cmpi.w	#$0001,d5
	beq	L003982
	cmpi.w	#$0002,d5
	beq	L003982
	cmpi.w	#$0005,d5
	beq	L003982
	cmpi.w	#$0008,d5
	bne	L003996
L003982:
	bsr	L0036c6
	tst.w	d0
	beq	L003990
	bsr	L0037c2
	bra	L003994

L003990:
	bsr	L0036e2
L003994:
	move.b	d1,(a5)+
L003996:
	rts

L003998:
	addq.l	#2,a0
	move.w	(a0)+,d0
	cmpi.w	#$0001,d5
	beq	L0039b4
	cmpi.w	#$0002,d5
	beq	L0039b4
	cmpi.w	#$0005,d5
	beq	L0039b4
	cmpi.w	#$0008,d5
	bne	L0039e4
L0039b4:
	bsr	L0036c6
	tst.w	d0
	beq	L0039da
	cmp.w	#$00fe,d0
	beq	L0039c8
	cmp.w	#$0004,d0
	bhi	L0039ce
L0039c8:
	bsr	L0037c2
	bra	L0039de

L0039ce:
	cmp.w	#$0004,d5
	bhi	L0039c8
	bsr	L003724
	bra	L0039de

L0039da:
	bsr	L00370e
L0039de:
	move.w	d1,-(a7)
	move.b	(a7)+,(a5)+
	move.b	d1,(a5)+
L0039e4:
	rts

L0039e6:
	addq.l	#2,a0
	move.w	(a0)+,d0
	cmpi.w	#$0001,d5
	beq	L003a02
	cmpi.w	#$0002,d5
	beq	L003a02
	cmpi.w	#$0005,d5
	beq	L003a02
	cmpi.w	#$0008,d5
	bne	L003a7a
L003a02:
	bsr	L0036c6
	tst.w	d0
	beq	L003a70
	cmp.w	#$0004,d0
	bls	L003a5e
	cmp.w	#$00fe,d0
	beq	L003a5e
	cmp.w	#$0004,d5
	bls	L003a70
	move.l	(-$0042,a6),d0
	cmp.l	(End+$000054,pc),d0
	beq	L002ea2
	addq.l	#4,(-$0042,a6)
	move.l	a4,d0
	movea.l	(-$0046,a6),a4
	suba.l	(-$004a,a6),a5
	cmpa.l	(End+$000038,pc),a5
	bcc	L003a48
	suba.l	(-$0052,a6),a5
	move.l	a5,(a4)+
	adda.l	(-$0052,a6),a5
	bra	L003a52

L003a48:
	suba.l	(-$004e,a6),a5
	move.l	a5,(a4)+
	adda.l	(-$004e,a6),a5
L003a52:
	move.l	a4,(-$0046,a6)
	movea.l	d0,a4
	adda.l	(-$004a,a6),a5
	bra	L003a70

L003a5e:
	subq.l	#6,d7
	bmi	L00054e
	addq.l	#6,(-$005a,a6)
	clr.w	(a4)+
	move.l	a5,(a4)+
	add.l	(End+$000098,pc),d1
L003a70:
	move.w	a5,-(a7)
	lsr.w	(a7)+
	bcs	L003926
	move.l	d1,(a5)+
L003a7a:
	rts

L003a7c:
	addq.l	#2,a0
	move.l	(a0)+,d1
	cmpi.w	#$0001,d5
	beq	L003a98
	cmpi.w	#$0002,d5
	beq	L003a98
	cmpi.w	#$0005,d5
	beq	L003a98
	cmpi.w	#$0008,d5
	bne	L003aa0
L003a98:
	bsr	L0036e2
	clr.b	(a5)+
	move.b	d1,(a5)+
L003aa0:
	rts

L003aa2:
	addq.l	#2,a0
	move.l	(a0)+,d1
	cmpi.w	#$0001,d5
	beq	L003abe
	cmpi.w	#$0002,d5
	beq	L003abe
	cmpi.w	#$0005,d5
	beq	L003abe
	cmpi.w	#$0008,d5
	bne	L003ac4
L003abe:
	bsr	L0036e2
	move.b	d1,(a5)+
L003ac4:
	rts

L003ac6:
	addq.l	#2,a0
	move.l	(a0)+,d1
	cmpi.w	#$0001,d5
	beq	L003ae2
	cmpi.w	#$0002,d5
	beq	L003ae2
	cmpi.w	#$0005,d5
	beq	L003ae2
	cmpi.w	#$0008,d5
	bne	L003aec
L003ae2:
	bsr	L00370e
	move.w	d1,-(a7)
	move.b	(a7)+,(a5)+
	move.b	d1,(a5)+
L003aec:
	rts

L003aee:
	addq.l	#2,a0
	move.l	(a0)+,d1
	cmpi.w	#$0001,d5
	beq	L003b0a
	cmpi.w	#$0002,d5
	beq	L003b0a
	cmpi.w	#$0005,d5
	beq	L003b0a
	cmpi.w	#$0008,d5
	bne	L003b14
L003b0a:
	move.w	a5,-(a7)
	lsr.w	(a7)+
	bcs	L003926
	move.l	d1,(a5)+
L003b14:
	rts

L003b16:
	addq.l	#6,a0
	cmpi.w	#$0001,d5
	beq	L003b30
	cmpi.w	#$0002,d5
	beq	L003b30
	cmpi.w	#$0005,d5
	beq	L003b30
	cmpi.w	#$0008,d5
	bne	L003b38
L003b30:
	bsr	L0037c2
	clr.b	(a5)+
	clr.b	(a5)+
L003b38:
	rts

L003b3a:
	addq.l	#6,a0
	cmpi.w	#$0001,d5
	beq	L003b54
	cmpi.w	#$0002,d5
	beq	L003b54
	cmpi.w	#$0005,d5
	beq	L003b54
	cmpi.w	#$0008,d5
	bne	L003b5a
L003b54:
	bsr	L0037c2
	clr.b	(a5)+
L003b5a:
	rts

L003b5c:
	addq.l	#2,a0
	move.l	(a0)+,d1
	cmpi.w	#$0001,d5
	beq	L003b78
	cmpi.w	#$0002,d5
	beq	L003b78
	cmpi.w	#$0005,d5
	beq	L003b78
	cmpi.w	#$0008,d5
	bne	L003b92
L003b78:
	add.l	($005e,a1),d1
	cmp.w	#$0004,d5
	bls	L003b88
	bsr	L0037c2
	bra	L003b8c

L003b88:
	bsr	L003724
L003b8c:
	move.w	d1,-(a7)
	move.b	(a7)+,(a5)+
	move.b	d1,(a5)+
L003b92:
	rts

L003b94:
	addq.l	#2,a0
	move.l	(a0)+,d1
	cmpi.w	#$0001,d5
	beq	L003bb0
	cmpi.w	#$0002,d5
	beq	L003bb0
	cmpi.w	#$0005,d5
	beq	L003bb0
	cmpi.w	#$0008,d5
	bne	L003bca
L003bb0:
	add.l	($0062,a1),d1
	cmp.w	#$0004,d5
	bls	L003bc0
	bsr	L0037c2
	bra	L003bc4

L003bc0:
	bsr	L003724
L003bc4:
	move.w	d1,-(a7)
	move.b	(a7)+,(a5)+
	move.b	d1,(a5)+
L003bca:
	rts

L003bcc:
	addq.l	#2,a0
	move.l	(a0)+,d1
	cmpi.w	#$0001,d5
	beq	L003be8
	cmpi.w	#$0002,d5
	beq	L003be8
	cmpi.w	#$0005,d5
	beq	L003be8
	cmpi.w	#$0008,d5
	bne	L003c02
L003be8:
	add.l	($0066,a1),d1
	cmp.w	#$0004,d5
	bls	L003bf8
	bsr	L0037c2
	bra	L003bfc

L003bf8:
	bsr	L003724
L003bfc:
	move.w	d1,-(a7)
	move.b	(a7)+,(a5)+
	move.b	d1,(a5)+
L003c02:
	rts

L003c04:
	addq.l	#2,a0
	move.l	(a0)+,d1
	cmpi.w	#$0001,d5
	beq	L003c20
	cmpi.w	#$0002,d5
	beq	L003c20
	cmpi.w	#$0005,d5
	beq	L003c20
	cmpi.w	#$0008,d5
	bne	L003c40
L003c20:
	add.l	($004e,a1),d1
	subq.l	#6,d7
	bmi	L00054e
	addq.l	#6,(-$005a,a6)
	clr.w	(a4)+
	move.l	a5,(a4)+
	add.l	(End+$000098,pc),d1
	move.w	a5,-(a7)
	lsr.w	(a7)+
	bcs	L003926
	move.l	d1,(a5)+
L003c40:
	rts

L003c42:
	addq.l	#2,a0
	move.l	(a0)+,d1
	cmpi.w	#$0001,d5
	beq	L003c5e
	cmpi.w	#$0002,d5
	beq	L003c5e
	cmpi.w	#$0005,d5
	beq	L003c5e
	cmpi.w	#$0008,d5
	bne	L003c7e
L003c5e:
	add.l	($0052,a1),d1
	subq.l	#6,d7
	bmi	L00054e
	addq.l	#6,(-$005a,a6)
	clr.w	(a4)+
	move.l	a5,(a4)+
	add.l	(End+$000098,pc),d1
	move.w	a5,-(a7)
	lsr.w	(a7)+
	bcs	L003926
	move.l	d1,(a5)+
L003c7e:
	rts

L003c80:
	addq.l	#2,a0
	move.l	(a0)+,d1
	cmpi.w	#$0001,d5
	beq	L003c9c
	cmpi.w	#$0002,d5
	beq	L003c9c
	cmpi.w	#$0005,d5
	beq	L003c9c
	cmpi.w	#$0008,d5
	bne	L003cbc
L003c9c:
	add.l	($0056,a1),d1
	subq.l	#6,d7
	bmi	L00054e
	addq.l	#6,(-$005a,a6)
	clr.w	(a4)+
	move.l	a5,(a4)+
	add.l	(End+$000098,pc),d1
	move.w	a5,-(a7)
	lsr.w	(a7)+
	bcs	L003926
	move.l	d1,(a5)+
L003cbc:
	rts

L003cbe:
	addq.l	#2,a0
	move.l	(a0)+,d1
	cmpi.w	#$0001,d5
	beq	L003cda
	cmpi.w	#$0002,d5
	beq	L003cda
	cmpi.w	#$0005,d5
	beq	L003cda
	cmpi.w	#$0008,d5
	bne	L003cfa
L003cda:
	add.l	($005a,a1),d1
	subq.l	#6,d7
	bmi	L00054e
	addq.l	#6,(-$005a,a6)
	clr.w	(a4)+
	move.l	a5,(a4)+
	add.l	(End+$000098,pc),d1
	move.w	a5,-(a7)
	lsr.w	(a7)+
	bcs	L003926
	move.l	d1,(a5)+
L003cfa:
	rts

L003cfc:
	addq.l	#2,a0
	move.l	(a0)+,d1
	cmpi.w	#$0001,d5
	beq	L003d18
	cmpi.w	#$0002,d5
	beq	L003d18
	cmpi.w	#$0005,d5
	beq	L003d18
	cmpi.w	#$0008,d5
	bne	L003d6c
L003d18:
	add.l	($005e,a1),d1
	cmp.w	#$0004,d5
	bls	L003d62
	move.l	(-$0042,a6),d0
	cmp.l	(End+$000054,pc),d0
	beq	L002ea2
	addq.l	#4,(-$0042,a6)
	move.l	a4,d0
	movea.l	(-$0046,a6),a4
	suba.l	(-$004a,a6),a5
	cmpa.l	(End+$000038,pc),a5
	bcc	L003d4e
	suba.l	(-$0052,a6),a5
	move.l	a5,(a4)+
	adda.l	(-$0052,a6),a5
	bra	L003d58

L003d4e:
	suba.l	(-$004e,a6),a5
	move.l	a5,(a4)+
	adda.l	(-$004e,a6),a5
L003d58:
	move.l	a4,(-$0046,a6)
	movea.l	d0,a4
	adda.l	(-$004a,a6),a5
L003d62:
	move.w	a5,-(a7)
	lsr.w	(a7)+
	bcs	L003926
	move.l	d1,(a5)+
L003d6c:
	rts

L003d6e:
	addq.l	#2,a0
	move.l	(a0)+,d1
	cmpi.w	#$0001,d5
	beq	L003d8a
	cmpi.w	#$0002,d5
	beq	L003d8a
	cmpi.w	#$0005,d5
	beq	L003d8a
	cmpi.w	#$0008,d5
	bne	L003dde
L003d8a:
	add.l	($0062,a1),d1
	cmp.w	#$0004,d5
	bls	L003dd4
	move.l	(-$0042,a6),d0
	cmp.l	(End+$000054,pc),d0
	beq	L002ea2
	addq.l	#4,(-$0042,a6)
	move.l	a4,d0
	movea.l	(-$0046,a6),a4
	suba.l	(-$004a,a6),a5
	cmpa.l	(End+$000038,pc),a5
	bcc	L003dc0
	suba.l	(-$0052,a6),a5
	move.l	a5,(a4)+
	adda.l	(-$0052,a6),a5
	bra	L003dca

L003dc0:
	suba.l	(-$004e,a6),a5
	move.l	a5,(a4)+
	adda.l	(-$004e,a6),a5
L003dca:
	move.l	a4,(-$0046,a6)
	movea.l	d0,a4
	adda.l	(-$004a,a6),a5
L003dd4:
	move.w	a5,-(a7)
	lsr.w	(a7)+
	bcs	L003926
	move.l	d1,(a5)+
L003dde:
	rts

L003de0:
	addq.l	#2,a0
	move.l	(a0)+,d1
	cmpi.w	#$0001,d5
	beq	L003dfc
	cmpi.w	#$0002,d5
	beq	L003dfc
	cmpi.w	#$0005,d5
	beq	L003dfc
	cmpi.w	#$0008,d5
	bne	L003e50
L003dfc:
	add.l	($0066,a1),d1
	cmp.w	#$0004,d5
	bls	L003e46
	move.l	(-$0042,a6),d0
	cmp.l	(End+$000054,pc),d0
	beq	L002ea2
	addq.l	#4,(-$0042,a6)
	move.l	a4,d0
	movea.l	(-$0046,a6),a4
	suba.l	(-$004a,a6),a5
	cmpa.l	(End+$000038,pc),a5
	bcc	L003e32
	suba.l	(-$0052,a6),a5
	move.l	a5,(a4)+
	adda.l	(-$0052,a6),a5
	bra	L003e3c

L003e32:
	suba.l	(-$004e,a6),a5
	move.l	a5,(a4)+
	adda.l	(-$004e,a6),a5
L003e3c:
	move.l	a4,(-$0046,a6)
	movea.l	d0,a4
	adda.l	(-$004a,a6),a5
L003e46:
	move.w	a5,-(a7)
	lsr.w	(a7)+
	bcs	L003926
	move.l	d1,(a5)+
L003e50:
	rts

L003e52:
	addq.l	#2,a0
	move.l	(a0)+,d1
	cmpi.w	#$0001,d5
	beq	L003e6e
	cmpi.w	#$0002,d5
	beq	L003e6e
	cmpi.w	#$0005,d5
	beq	L003e6e
	cmpi.w	#$0008,d5
	bne	L003ec2
L003e6e:
	add.l	($006a,a1),d1
	cmp.w	#$0004,d5
	bls	L003eb8
	move.l	(-$0042,a6),d0
	cmp.l	(End+$000054,pc),d0
	beq	L002ea2
	addq.l	#4,(-$0042,a6)
	move.l	a4,d0
	movea.l	(-$0046,a6),a4
	suba.l	(-$004a,a6),a5
	cmpa.l	(End+$000038,pc),a5
	bcc	L003ea4
	suba.l	(-$0052,a6),a5
	move.l	a5,(a4)+
	adda.l	(-$0052,a6),a5
	bra	L003eae

L003ea4:
	suba.l	(-$004e,a6),a5
	move.l	a5,(a4)+
	adda.l	(-$004e,a6),a5
L003eae:
	move.l	a4,(-$0046,a6)
	movea.l	d0,a4
	adda.l	(-$004a,a6),a5
L003eb8:
	move.w	a5,-(a7)
	lsr.w	(a7)+
	bcs	L003926
	move.l	d1,(a5)+
L003ec2:
	rts

L003ec4:
	addq.l	#2,a0
	move.l	(a0)+,d1
	cmpi.w	#$0001,d5
	beq	L003ee0
	cmpi.w	#$0002,d5
	beq	L003ee0
	cmpi.w	#$0005,d5
	beq	L003ee0
	cmpi.w	#$0008,d5
	bne	L003f34
L003ee0:
	add.l	($006e,a1),d1
	cmp.w	#$0004,d5
	bls	L003f2a
	move.l	(-$0042,a6),d0
	cmp.l	(End+$000054,pc),d0
	beq	L002ea2
	addq.l	#4,(-$0042,a6)
	move.l	a4,d0
	movea.l	(-$0046,a6),a4
	suba.l	(-$004a,a6),a5
	cmpa.l	(End+$000038,pc),a5
	bcc	L003f16
	suba.l	(-$0052,a6),a5
	move.l	a5,(a4)+
	adda.l	(-$0052,a6),a5
	bra	L003f20

L003f16:
	suba.l	(-$004e,a6),a5
	move.l	a5,(a4)+
	adda.l	(-$004e,a6),a5
L003f20:
	move.l	a4,(-$0046,a6)
	movea.l	d0,a4
	adda.l	(-$004a,a6),a5
L003f2a:
	move.w	a5,-(a7)
	lsr.w	(a7)+
	bcs	L003926
	move.l	d1,(a5)+
L003f34:
	rts

L003f36:
	addq.l	#2,a0
	move.l	(a0)+,d1
	cmpi.w	#$0001,d5
	beq	L003f52
	cmpi.w	#$0002,d5
	beq	L003f52
	cmpi.w	#$0005,d5
	beq	L003f52
	cmpi.w	#$0008,d5
	bne	L003fa6
L003f52:
	add.l	($0072,a1),d1
	cmp.w	#$0004,d5
	bls	L003f9c
	move.l	(-$0042,a6),d0
	cmp.l	(End+$000054,pc),d0
	beq	L002ea2
	addq.l	#4,(-$0042,a6)
	move.l	a4,d0
	movea.l	(-$0046,a6),a4
	suba.l	(-$004a,a6),a5
	cmpa.l	(End+$000038,pc),a5
	bcc	L003f88
	suba.l	(-$0052,a6),a5
	move.l	a5,(a4)+
	adda.l	(-$0052,a6),a5
	bra	L003f92

L003f88:
	suba.l	(-$004e,a6),a5
	move.l	a5,(a4)+
	adda.l	(-$004e,a6),a5
L003f92:
	move.l	a4,(-$0046,a6)
	movea.l	d0,a4
	adda.l	(-$004a,a6),a5
L003f9c:
	move.w	a5,-(a7)
	lsr.w	(a7)+
	bcs	L003926
	move.l	d1,(a5)+
L003fa6:
	rts

L003fa8:
	addq.l	#2,a0
	move.w	(a0)+,d0
	move.l	(a0)+,d2
	cmpi.w	#$0001,d5
	beq	L003fc6
	cmpi.w	#$0002,d5
	beq	L003fc6
	cmpi.w	#$0005,d5
	beq	L003fc6
	cmpi.w	#$0008,d5
	bne	L003fde
L003fc6:
	bsr	L0036c6
	add.l	d2,d1
	tst.w	d0
	beq	L003fd6
	bsr	L0037c2
	bra	L003fda

L003fd6:
	bsr	L0036e2
L003fda:
	clr.b	(a5)+
	move.b	d1,(a5)+
L003fde:
	rts

L003fe0:
	addq.l	#2,a0
	move.w	(a0)+,d0
	move.l	(a0)+,d2
	cmpi.w	#$0001,d5
	beq	L003ffe
	cmpi.w	#$0002,d5
	beq	L003ffe
	cmpi.w	#$0005,d5
	beq	L003ffe
	cmpi.w	#$0008,d5
	bne	L004014
L003ffe:
	bsr	L0036c6
	add.l	d2,d1
	tst.w	d0
	beq	L00400e
	bsr	L0037c2
	bra	L004012

L00400e:
	bsr	L0036e2
L004012:
	move.b	d1,(a5)+
L004014:
	rts

L004016:
	addq.l	#2,a0
	move.w	(a0)+,d0
	move.l	(a0)+,d2
	cmpi.w	#$0001,d5
	beq	L004034
	cmpi.w	#$0002,d5
	beq	L004034
	cmpi.w	#$0005,d5
	beq	L004034
	cmpi.w	#$0008,d5
	bne	L004066
L004034:
	bsr	L0036c6
	add.l	d2,d1
	tst.w	d0
	beq	L00405c
	cmp.w	#$00fe,d0
	beq	L00404a
	cmp.w	#$0004,d0
	bhi	L004050
L00404a:
	bsr	L0037c2
	bra	L004060

L004050:
	cmp.w	#$0004,d5
	bhi	L00404a
	bsr	L003724
	bra	L004060

L00405c:
	bsr	L00370e
L004060:
	move.w	d1,-(a7)
	move.b	(a7)+,(a5)+
	move.b	d1,(a5)+
L004066:
	rts

L004068:
	addq.l	#2,a0
	move.w	(a0)+,d0
	move.l	(a0)+,d2
	cmpi.w	#$0001,d5
	beq	L004086
	cmpi.w	#$0002,d5
	beq	L004086
	cmpi.w	#$0005,d5
	beq	L004086
	cmpi.w	#$0008,d5
	bne	L004100
L004086:
	bsr	L0036c6
	add.l	d2,d1
	tst.w	d0
	beq	L0040f6
	cmp.w	#$0004,d0
	bls	L0040e4
	cmp.w	#$00fe,d0
	beq	L0040e4
	cmp.w	#$0004,d5
	bls	L0040f6
	move.l	(-$0042,a6),d0
	cmp.l	(End+$000054,pc),d0
	beq	L002ea2
	addq.l	#4,(-$0042,a6)
	move.l	a4,d0
	movea.l	(-$0046,a6),a4
	suba.l	(-$004a,a6),a5
	cmpa.l	(End+$000038,pc),a5
	bcc	L0040ce
	suba.l	(-$0052,a6),a5
	move.l	a5,(a4)+
	adda.l	(-$0052,a6),a5
	bra	L0040d8

L0040ce:
	suba.l	(-$004e,a6),a5
	move.l	a5,(a4)+
	adda.l	(-$004e,a6),a5
L0040d8:
	move.l	a4,(-$0046,a6)
	movea.l	d0,a4
	adda.l	(-$004a,a6),a5
	bra	L0040f6

L0040e4:
	subq.l	#6,d7
	bmi	L00054e
	addq.l	#6,(-$005a,a6)
	clr.w	(a4)+
	move.l	a5,(a4)+
	add.l	(End+$000098,pc),d1
L0040f6:
	move.w	a5,-(a7)
	lsr.w	(a7)+
	bcs	L003926
	move.l	d1,(a5)+
L004100:
	rts

L004102:
	addq.l	#2,a0
	move.l	(a0)+,d1
	add.l	(a0)+,d1
	cmpi.w	#$0001,d5
	beq	L004120
	cmpi.w	#$0002,d5
	beq	L004120
	cmpi.w	#$0005,d5
	beq	L004120
	cmpi.w	#$0008,d5
	bne	L004128
L004120:
	bsr	L0036e2
	clr.b	(a5)+
	move.b	d1,(a5)+
L004128:
	rts

L00412a:
	addq.l	#2,a0
	move.l	(a0)+,d1
	add.l	(a0)+,d1
	cmpi.w	#$0001,d5
	beq	L004148
	cmpi.w	#$0002,d5
	beq	L004148
	cmpi.w	#$0005,d5
	beq	L004148
	cmpi.w	#$0008,d5
	bne	L00414e
L004148:
	bsr	L0036e2
	move.b	d1,(a5)+
L00414e:
	rts

L004150:
	addq.l	#2,a0
	move.l	(a0)+,d1
	add.l	(a0)+,d1
	cmpi.w	#$0001,d5
	beq	L00416e
	cmpi.w	#$0002,d5
	beq	L00416e
	cmpi.w	#$0005,d5
	beq	L00416e
	cmpi.w	#$0008,d5
	bne	L004178
L00416e:
	bsr	L00370e
	move.w	d1,-(a7)
	move.b	(a7)+,(a5)+
	move.b	d1,(a5)+
L004178:
	rts

L00417a:
	addq.l	#2,a0
	move.l	(a0)+,d1
	add.l	(a0)+,d1
	cmpi.w	#$0001,d5
	beq	L004198
	cmpi.w	#$0002,d5
	beq	L004198
	cmpi.w	#$0005,d5
	beq	L004198
	cmpi.w	#$0008,d5
	bne	L0041a2
L004198:
	move.w	a5,-(a7)
	lsr.w	(a7)+
	bcs	L003926
	move.l	d1,(a5)+
L0041a2:
	rts

L0041a4:
	lea.l	($000a,a0),a0
	cmpi.w	#$0001,d5
	beq	L0041c0
	cmpi.w	#$0002,d5
	beq	L0041c0
	cmpi.w	#$0005,d5
	beq	L0041c0
	cmpi.w	#$0008,d5
	bne	L0041c8
L0041c0:
	bsr	L0037c2
	clr.b	(a5)+
	clr.b	(a5)+
L0041c8:
	rts

L0041ca:
	lea.l	($000a,a0),a0
	cmpi.w	#$0001,d5
	beq	L0041e6
	cmpi.w	#$0002,d5
	beq	L0041e6
	cmpi.w	#$0005,d5
	beq	L0041e6
	cmpi.w	#$0008,d5
	bne	L0041ec
L0041e6:
	bsr	L0037c2
	clr.b	(a5)+
L0041ec:
	rts

L0041ee:
	addq.l	#2,a0
	move.l	(a0)+,d1
	add.l	(a0)+,d1
	cmpi.w	#$0001,d5
	beq	L00420c
	cmpi.w	#$0002,d5
	beq	L00420c
	cmpi.w	#$0005,d5
	beq	L00420c
	cmpi.w	#$0008,d5
	bne	L004226
L00420c:
	add.l	($005e,a1),d1
	cmp.w	#$0004,d5
	bls	L00421c
	bsr	L0037c2
	bra	L004220

L00421c:
	bsr	L003724
L004220:
	move.w	d1,-(a7)
	move.b	(a7)+,(a5)+
	move.b	d1,(a5)+
L004226:
	rts

L004228:
	addq.l	#2,a0
	move.l	(a0)+,d1
	add.l	(a0)+,d1
	cmpi.w	#$0001,d5
	beq	L004246
	cmpi.w	#$0002,d5
	beq	L004246
	cmpi.w	#$0005,d5
	beq	L004246
	cmpi.w	#$0008,d5
	bne	L004260
L004246:
	add.l	($0062,a1),d1
	cmp.w	#$0004,d5
	bls	L004256
	bsr	L0037c2
	bra	L00425a

L004256:
	bsr	L003724
L00425a:
	move.w	d1,-(a7)
	move.b	(a7)+,(a5)+
	move.b	d1,(a5)+
L004260:
	rts

L004262:
	addq.l	#2,a0
	move.l	(a0)+,d1
	add.l	(a0)+,d1
	cmpi.w	#$0001,d5
	beq	L004280
	cmpi.w	#$0002,d5
	beq	L004280
	cmpi.w	#$0005,d5
	beq	L004280
	cmpi.w	#$0008,d5
	bne	L00429a
L004280:
	add.l	($0066,a1),d1
	cmp.w	#$0004,d5
	bls	L004290
	bsr	L0037c2
	bra	L004294

L004290:
	bsr	L003724
L004294:
	move.w	d1,-(a7)
	move.b	(a7)+,(a5)+
	move.b	d1,(a5)+
L00429a:
	rts

L00429c:
	addq.l	#2,a0
	move.l	(a0)+,d1
	add.l	(a0)+,d1
	cmpi.w	#$0001,d5
	beq	L0042ba
	cmpi.w	#$0002,d5
	beq	L0042ba
	cmpi.w	#$0005,d5
	beq	L0042ba
	cmpi.w	#$0008,d5
	bne	L0042da
L0042ba:
	add.l	($004e,a1),d1
	subq.l	#6,d7
	bmi	L00054e
	addq.l	#6,(-$005a,a6)
	clr.w	(a4)+
	move.l	a5,(a4)+
	add.l	(End+$000098,pc),d1
	move.w	a5,-(a7)
	lsr.w	(a7)+
	bcs	L003926
	move.l	d1,(a5)+
L0042da:
	rts

L0042dc:
	addq.l	#2,a0
	move.l	(a0)+,d1
	add.l	(a0)+,d1
	cmpi.w	#$0001,d5
	beq	L0042fa
	cmpi.w	#$0002,d5
	beq	L0042fa
	cmpi.w	#$0005,d5
	beq	L0042fa
	cmpi.w	#$0008,d5
	bne	L00431a
L0042fa:
	add.l	($0052,a1),d1
	subq.l	#6,d7
	bmi	L00054e
	addq.l	#6,(-$005a,a6)
	clr.w	(a4)+
	move.l	a5,(a4)+
	add.l	(End+$000098,pc),d1
	move.w	a5,-(a7)
	lsr.w	(a7)+
	bcs	L003926
	move.l	d1,(a5)+
L00431a:
	rts

L00431c:
	addq.l	#2,a0
	move.l	(a0)+,d1
	add.l	(a0)+,d1
	cmpi.w	#$0001,d5
	beq	L00433a
	cmpi.w	#$0002,d5
	beq	L00433a
	cmpi.w	#$0005,d5
	beq	L00433a
	cmpi.w	#$0008,d5
	bne	L00435a
L00433a:
	add.l	($0056,a1),d1
	subq.l	#6,d7
	bmi	L00054e
	addq.l	#6,(-$005a,a6)
	clr.w	(a4)+
	move.l	a5,(a4)+
	add.l	(End+$000098,pc),d1
	move.w	a5,-(a7)
	lsr.w	(a7)+
	bcs	L003926
	move.l	d1,(a5)+
L00435a:
	rts

L00435c:
	addq.l	#2,a0
	move.l	(a0)+,d1
	add.l	(a0)+,d1
	cmpi.w	#$0001,d5
	beq	L00437a
	cmpi.w	#$0002,d5
	beq	L00437a
	cmpi.w	#$0005,d5
	beq	L00437a
	cmpi.w	#$0008,d5
	bne	L00439a
L00437a:
	add.l	($005a,a1),d1
	subq.l	#6,d7
	bmi	L00054e
	addq.l	#6,(-$005a,a6)
	clr.w	(a4)+
	move.l	a5,(a4)+
	add.l	(End+$000098,pc),d1
	move.w	a5,-(a7)
	lsr.w	(a7)+
	bcs	L003926
	move.l	d1,(a5)+
L00439a:
	rts

L00439c:
	addq.l	#2,a0
	move.l	(a0)+,d1
	add.l	(a0)+,d1
	cmpi.w	#$0001,d5
	beq	L0043ba
	cmpi.w	#$0002,d5
	beq	L0043ba
	cmpi.w	#$0005,d5
	beq	L0043ba
	cmpi.w	#$0008,d5
	bne	L00440e
L0043ba:
	add.l	($005e,a1),d1
	cmp.w	#$0004,d5
	bls	L004404
	move.l	(-$0042,a6),d0
	cmp.l	(End+$000054,pc),d0
	beq	L002ea2
	addq.l	#4,(-$0042,a6)
	move.l	a4,d0
	movea.l	(-$0046,a6),a4
	suba.l	(-$004a,a6),a5
	cmpa.l	(End+$000038,pc),a5
	bcc	L0043f0
	suba.l	(-$0052,a6),a5
	move.l	a5,(a4)+
	adda.l	(-$0052,a6),a5
	bra	L0043fa

L0043f0:
	suba.l	(-$004e,a6),a5
	move.l	a5,(a4)+
	adda.l	(-$004e,a6),a5
L0043fa:
	move.l	a4,(-$0046,a6)
	movea.l	d0,a4
	adda.l	(-$004a,a6),a5
L004404:
	move.w	a5,-(a7)
	lsr.w	(a7)+
	bcs	L003926
	move.l	d1,(a5)+
L00440e:
	rts

L004410:
	addq.l	#2,a0
	move.l	(a0)+,d1
	add.l	(a0)+,d1
	cmpi.w	#$0001,d5
	beq	L00442e
	cmpi.w	#$0002,d5
	beq	L00442e
	cmpi.w	#$0005,d5
	beq	L00442e
	cmpi.w	#$0008,d5
	bne	L004482
L00442e:
	add.l	($0062,a1),d1
	cmp.w	#$0004,d5
	bls	L004478
	move.l	(-$0042,a6),d0
	cmp.l	(End+$000054,pc),d0
	beq	L002ea2
	addq.l	#4,(-$0042,a6)
	move.l	a4,d0
	movea.l	(-$0046,a6),a4
	suba.l	(-$004a,a6),a5
	cmpa.l	(End+$000038,pc),a5
	bcc	L004464
	suba.l	(-$0052,a6),a5
	move.l	a5,(a4)+
	adda.l	(-$0052,a6),a5
	bra	L00446e

L004464:
	suba.l	(-$004e,a6),a5
	move.l	a5,(a4)+
	adda.l	(-$004e,a6),a5
L00446e:
	move.l	a4,(-$0046,a6)
	movea.l	d0,a4
	adda.l	(-$004a,a6),a5
L004478:
	move.w	a5,-(a7)
	lsr.w	(a7)+
	bcs	L003926
	move.l	d1,(a5)+
L004482:
	rts

L004484:
	addq.l	#2,a0
	move.l	(a0)+,d1
	add.l	(a0)+,d1
	cmpi.w	#$0001,d5
	beq	L0044a2
	cmpi.w	#$0002,d5
	beq	L0044a2
	cmpi.w	#$0005,d5
	beq	L0044a2
	cmpi.w	#$0008,d5
	bne	L0044f6
L0044a2:
	add.l	($0066,a1),d1
	cmp.w	#$0004,d5
	bls	L0044ec
	move.l	(-$0042,a6),d0
	cmp.l	(End+$000054,pc),d0
	beq	L002ea2
	addq.l	#4,(-$0042,a6)
	move.l	a4,d0
	movea.l	(-$0046,a6),a4
	suba.l	(-$004a,a6),a5
	cmpa.l	(End+$000038,pc),a5
	bcc	L0044d8
	suba.l	(-$0052,a6),a5
	move.l	a5,(a4)+
	adda.l	(-$0052,a6),a5
	bra	L0044e2

L0044d8:
	suba.l	(-$004e,a6),a5
	move.l	a5,(a4)+
	adda.l	(-$004e,a6),a5
L0044e2:
	move.l	a4,(-$0046,a6)
	movea.l	d0,a4
	adda.l	(-$004a,a6),a5
L0044ec:
	move.w	a5,-(a7)
	lsr.w	(a7)+
	bcs	L003926
	move.l	d1,(a5)+
L0044f6:
	rts

L0044f8:
	addq.l	#2,a0
	move.l	(a0)+,d1
	add.l	(a0)+,d1
	cmpi.w	#$0001,d5
	beq	L004516
	cmpi.w	#$0002,d5
	beq	L004516
	cmpi.w	#$0005,d5
	beq	L004516
	cmpi.w	#$0008,d5
	bne	L00456a
L004516:
	add.l	($006a,a1),d1
	cmp.w	#$0004,d5
	bls	L004560
	move.l	(-$0042,a6),d0
	cmp.l	(End+$000054,pc),d0
	beq	L002ea2
	addq.l	#4,(-$0042,a6)
	move.l	a4,d0
	movea.l	(-$0046,a6),a4
	suba.l	(-$004a,a6),a5
	cmpa.l	(End+$000038,pc),a5
	bcc	L00454c
	suba.l	(-$0052,a6),a5
	move.l	a5,(a4)+
	adda.l	(-$0052,a6),a5
	bra	L004556

L00454c:
	suba.l	(-$004e,a6),a5
	move.l	a5,(a4)+
	adda.l	(-$004e,a6),a5
L004556:
	move.l	a4,(-$0046,a6)
	movea.l	d0,a4
	adda.l	(-$004a,a6),a5
L004560:
	move.w	a5,-(a7)
	lsr.w	(a7)+
	bcs	L003926
	move.l	d1,(a5)+
L00456a:
	rts

L00456c:
	addq.l	#2,a0
	move.l	(a0)+,d1
	add.l	(a0)+,d1
	cmpi.w	#$0001,d5
	beq	L00458a
	cmpi.w	#$0002,d5
	beq	L00458a
	cmpi.w	#$0005,d5
	beq	L00458a
	cmpi.w	#$0008,d5
	bne	L0045de
L00458a:
	add.l	($006e,a1),d1
	cmp.w	#$0004,d5
	bls	L0045d4
	move.l	(-$0042,a6),d0
	cmp.l	(End+$000054,pc),d0
	beq	L002ea2
	addq.l	#4,(-$0042,a6)
	move.l	a4,d0
	movea.l	(-$0046,a6),a4
	suba.l	(-$004a,a6),a5
	cmpa.l	(End+$000038,pc),a5
	bcc	L0045c0
	suba.l	(-$0052,a6),a5
	move.l	a5,(a4)+
	adda.l	(-$0052,a6),a5
	bra	L0045ca

L0045c0:
	suba.l	(-$004e,a6),a5
	move.l	a5,(a4)+
	adda.l	(-$004e,a6),a5
L0045ca:
	move.l	a4,(-$0046,a6)
	movea.l	d0,a4
	adda.l	(-$004a,a6),a5
L0045d4:
	move.w	a5,-(a7)
	lsr.w	(a7)+
	bcs	L003926
	move.l	d1,(a5)+
L0045de:
	rts

L0045e0:
	addq.l	#2,a0
	move.l	(a0)+,d1
	add.l	(a0)+,d1
	cmpi.w	#$0001,d5
	beq	L0045fe
	cmpi.w	#$0002,d5
	beq	L0045fe
	cmpi.w	#$0005,d5
	beq	L0045fe
	cmpi.w	#$0008,d5
	bne	L004652
L0045fe:
	add.l	($0072,a1),d1
	cmp.w	#$0004,d5
	bls	L004648
	move.l	(-$0042,a6),d0
	cmp.l	(End+$000054,pc),d0
	beq	L002ea2
	addq.l	#4,(-$0042,a6)
	move.l	a4,d0
	movea.l	(-$0046,a6),a4
	suba.l	(-$004a,a6),a5
	cmpa.l	(End+$000038,pc),a5
	bcc	L004634
	suba.l	(-$0052,a6),a5
	move.l	a5,(a4)+
	adda.l	(-$0052,a6),a5
	bra	L00463e

L004634:
	suba.l	(-$004e,a6),a5
	move.l	a5,(a4)+
	adda.l	(-$004e,a6),a5
L00463e:
	move.l	a4,(-$0046,a6)
	movea.l	d0,a4
	adda.l	(-$004a,a6),a5
L004648:
	move.w	a5,-(a7)
	lsr.w	(a7)+
	bcs	L003926
	move.l	d1,(a5)+
L004652:
	rts

L004654:
	addq.l	#2,a0
	move.l	(a0)+,d2
	add.l	($004e,a1),d2
	move.w	(a0)+,d0
	cmpi.w	#$0001,d5
	beq	L004676
	cmpi.w	#$0002,d5
	beq	L004676
	cmpi.w	#$0005,d5
	beq	L004676
	cmpi.w	#$0008,d5
	bne	L00469c
L004676:
	bsr	L0036c6
	sub.l	d2,d1
	tst.w	d0
	beq	L00468c
	cmp.w	#$00fe,d0
	beq	L004692
	cmp.w	#$0004,d0
	bls	L004692
L00468c:
	bsr	L0037c2
	bra	L004696

L004692:
	bsr	L003724
L004696:
	move.w	d1,-(a7)
	move.b	(a7)+,(a5)+
	move.b	d1,(a5)+
L00469c:
	rts

L00469e:
	addq.l	#2,a0
	move.l	(a0)+,d2
	add.l	($0052,a1),d2
	move.w	(a0)+,d0
	cmpi.w	#$0001,d5
	beq	L0046c0
	cmpi.w	#$0002,d5
	beq	L0046c0
	cmpi.w	#$0005,d5
	beq	L0046c0
	cmpi.w	#$0008,d5
	bne	L0046e6
L0046c0:
	bsr	L0036c6
	sub.l	d2,d1
	tst.w	d0
	beq	L0046d6
	cmp.w	#$00fe,d0
	beq	L0046dc
	cmp.w	#$0004,d0
	bls	L0046dc
L0046d6:
	bsr	L0037c2
	bra	L0046e0

L0046dc:
	bsr	L003724
L0046e0:
	move.w	d1,-(a7)
	move.b	(a7)+,(a5)+
	move.b	d1,(a5)+
L0046e6:
	rts

L0046e8:
	addq.l	#2,a0
	move.l	(a0)+,d2
	add.l	($0056,a1),d2
	move.w	(a0)+,d0
	cmpi.w	#$0001,d5
	beq	L00470a
	cmpi.w	#$0002,d5
	beq	L00470a
	cmpi.w	#$0005,d5
	beq	L00470a
	cmpi.w	#$0008,d5
	bne	L004730
L00470a:
	bsr	L0036c6
	sub.l	d2,d1
	tst.w	d0
	beq	L004720
	cmp.w	#$00fe,d0
	beq	L004726
	cmp.w	#$0004,d0
	bls	L004726
L004720:
	bsr	L0037c2
	bra	L00472a

L004726:
	bsr	L003724
L00472a:
	move.w	d1,-(a7)
	move.b	(a7)+,(a5)+
	move.b	d1,(a5)+
L004730:
	rts

L004732:
	addq.l	#2,a0
	move.l	(a0)+,d2
	add.l	($005a,a1),d2
	move.w	(a0)+,d0
	cmpi.w	#$0001,d5
	beq	L004754
	cmpi.w	#$0002,d5
	beq	L004754
	cmpi.w	#$0005,d5
	beq	L004754
	cmpi.w	#$0008,d5
	bne	L00477a
L004754:
	bsr	L0036c6
	sub.l	d2,d1
	tst.w	d0
	beq	L00476a
	cmp.w	#$00fe,d0
	beq	L004770
	cmp.w	#$0004,d0
	bls	L004770
L00476a:
	bsr	L0037c2
	bra	L004774

L004770:
	bsr	L003724
L004774:
	move.w	d1,-(a7)
	move.b	(a7)+,(a5)+
	move.b	d1,(a5)+
L00477a:
	rts

L00477c:
	addq.l	#2,a0
	move.l	(a0)+,d2
	add.l	($005e,a1),d2
	move.w	(a0)+,d0
	cmpi.w	#$0001,d5
	beq	L00479e
	cmpi.w	#$0002,d5
	beq	L00479e
	cmpi.w	#$0005,d5
	beq	L00479e
	cmpi.w	#$0008,d5
	bne	L0047c0
L00479e:
	bsr	L0036c6
	sub.l	d2,d1
	cmp.w	#$00fe,d0
	beq	L0047b0
	cmp.w	#$0004,d0
	bhi	L0047b6
L0047b0:
	bsr	L0037c2
	bra	L0047ba

L0047b6:
	bsr	L003724
L0047ba:
	move.w	d1,-(a7)
	move.b	(a7)+,(a5)+
	move.b	d1,(a5)+
L0047c0:
	rts

L0047c2:
	addq.l	#2,a0
	move.l	(a0)+,d2
	add.l	($0062,a1),d2
	move.w	(a0)+,d0
	cmpi.w	#$0001,d5
	beq	L0047e4
	cmpi.w	#$0002,d5
	beq	L0047e4
	cmpi.w	#$0005,d5
	beq	L0047e4
	cmpi.w	#$0008,d5
	bne	L004806
L0047e4:
	bsr	L0036c6
	sub.l	d2,d1
	cmp.w	#$00fe,d0
	beq	L0047f6
	cmp.w	#$0004,d0
	bhi	L0047fc
L0047f6:
	bsr	L0037c2
	bra	L004800

L0047fc:
	bsr	L003724
L004800:
	move.w	d1,-(a7)
	move.b	(a7)+,(a5)+
	move.b	d1,(a5)+
L004806:
	rts

L004808:
	addq.l	#2,a0
	move.l	(a0)+,d2
	add.l	($0066,a1),d2
	move.w	(a0)+,d0
	cmpi.w	#$0001,d5
	beq	L00482a
	cmpi.w	#$0002,d5
	beq	L00482a
	cmpi.w	#$0005,d5
	beq	L00482a
	cmpi.w	#$0008,d5
	bne	L00484c
L00482a:
	bsr	L0036c6
	sub.l	d2,d1
	cmp.w	#$00fe,d0
	beq	L00483c
	cmp.w	#$0004,d0
	bhi	L004842
L00483c:
	bsr	L0037c2
	bra	L004846

L004842:
	bsr	L003724
L004846:
	move.w	d1,-(a7)
	move.b	(a7)+,(a5)+
	move.b	d1,(a5)+
L00484c:
	rts

L00484e:
	addq.l	#2,a0
	move.l	(a0)+,d2
	add.l	($006a,a1),d2
	move.w	(a0)+,d0
	cmpi.w	#$0001,d5
	beq	L004870
	cmpi.w	#$0002,d5
	beq	L004870
	cmpi.w	#$0005,d5
	beq	L004870
	cmpi.w	#$0008,d5
	bne	L004892
L004870:
	bsr	L0036c6
	sub.l	d2,d1
	cmp.w	#$00fe,d0
	beq	L004882
	cmp.w	#$0004,d0
	bhi	L004888
L004882:
	bsr	L0037c2
	bra	L00488c

L004888:
	bsr	L003724
L00488c:
	move.w	d1,-(a7)
	move.b	(a7)+,(a5)+
	move.b	d1,(a5)+
L004892:
	rts

L004894:
	addq.l	#2,a0
	move.l	(a0)+,d2
	add.l	($006e,a1),d2
	move.w	(a0)+,d0
	cmpi.w	#$0001,d5
	beq	L0048b6
	cmpi.w	#$0002,d5
	beq	L0048b6
	cmpi.w	#$0005,d5
	beq	L0048b6
	cmpi.w	#$0008,d5
	bne	L0048d8
L0048b6:
	bsr	L0036c6
	sub.l	d2,d1
	cmp.w	#$00fe,d0
	bhi	L0048c8
	cmp.w	#$0004,d0
	bhi	L0048ce
L0048c8:
	bsr	L0037c2
	bra	L0048d2

L0048ce:
	bsr	L003724
L0048d2:
	move.w	d1,-(a7)
	move.b	(a7)+,(a5)+
	move.b	d1,(a5)+
L0048d8:
	rts

L0048da:
	addq.l	#2,a0
	move.l	(a0)+,d2
	add.l	($0072,a1),d2
	move.w	(a0)+,d0
	cmpi.w	#$0001,d5
	beq	L0048fc
	cmpi.w	#$0002,d5
	beq	L0048fc
	cmpi.w	#$0005,d5
	beq	L0048fc
	cmpi.w	#$0008,d5
	bne	L00491e
L0048fc:
	bsr	L0036c6
	sub.l	d2,d1
	cmp.w	#$00fe,d0
	beq	L00490e
	cmp.w	#$0004,d0
	bhi	L004914
L00490e:
	bsr	L0037c2
	bra	L004918

L004914:
	bsr	L003724
L004918:
	move.w	d1,-(a7)
	move.b	(a7)+,(a5)+
	move.b	d1,(a5)+
L00491e:
	rts

L004920:
	addq.l	#2,a0
	move.l	(a0)+,d2
	add.l	($004e,a1),d2
	move.w	(a0)+,d0
	cmpi.w	#$0001,d5
	beq	L004942
	cmpi.w	#$0002,d5
	beq	L004942
	cmpi.w	#$0005,d5
	beq	L004942
	cmpi.w	#$0008,d5
	bne	L004964
L004942:
	bsr	L0036c6
	sub.l	d2,d1
	tst.w	d0
	beq	L004958
	cmp.w	#$00fe,d0
	beq	L00495e
	cmp.w	#$0004,d0
	bls	L00495e
L004958:
	bsr	L0037c2
	bra	L004962

L00495e:
	bsr	L0036f8
L004962:
	move.b	d1,(a5)+
L004964:
	rts

L004966:
	addq.l	#2,a0
	move.l	(a0)+,d2
	add.l	($0052,a1),d2
	move.w	(a0)+,d0
	cmpi.w	#$0001,d5
	beq	L004988
	cmpi.w	#$0002,d5
	beq	L004988
	cmpi.w	#$0005,d5
	beq	L004988
	cmpi.w	#$0008,d5
	bne	L0049aa
L004988:
	bsr	L0036c6
	sub.l	d2,d1
	tst.w	d0
	beq	L00499e
	cmp.w	#$00fe,d0
	beq	L0049a4
	cmp.w	#$0004,d0
	bls	L0049a4
L00499e:
	bsr	L0037c2
	bra	L0049a8

L0049a4:
	bsr	L0036f8
L0049a8:
	move.b	d1,(a5)+
L0049aa:
	rts

L0049ac:
	addq.l	#2,a0
	move.l	(a0)+,d2
	add.l	($0056,a1),d2
	move.w	(a0)+,d0
	cmpi.w	#$0001,d5
	beq	L0049ce
	cmpi.w	#$0002,d5
	beq	L0049ce
	cmpi.w	#$0005,d5
	beq	L0049ce
	cmpi.w	#$0008,d5
	bne	L0049f0
L0049ce:
	bsr	L0036c6
	sub.l	d2,d1
	tst.w	d0
	beq	L0049e4
	cmp.w	#$00fe,d0
	beq	L0049ea
	cmp.w	#$0004,d0
	bls	L0049ea
L0049e4:
	bsr	L0037c2
	bra	L0049ee

L0049ea:
	bsr	L0036f8
L0049ee:
	move.b	d1,(a5)+
L0049f0:
	rts

L0049f2:
	addq.l	#2,a0
	move.l	(a0)+,d2
	add.l	($005a,a1),d2
	move.w	(a0)+,d0
	cmpi.w	#$0001,d5
	beq	L004a14
	cmpi.w	#$0002,d5
	beq	L004a14
	cmpi.w	#$0005,d5
	beq	L004a14
	cmpi.w	#$0008,d5
	bne	L004a36
L004a14:
	bsr	L0036c6
	sub.l	d2,d1
	tst.w	d0
	beq	L004a2a
	cmp.w	#$00fe,d0
	beq	L004a30
	cmp.w	#$0004,d0
	bls	L004a30
L004a2a:
	bsr	L0037c2
	bra	L004a34

L004a30:
	bsr	L0036f8
L004a34:
	move.b	d1,(a5)+
L004a36:
	rts

L004a38:
	addq.l	#2,a0
	move.l	(a0)+,d2
	add.l	($005e,a1),d2
	move.w	(a0)+,d0
	cmpi.w	#$0001,d5
	beq	L004a5a
	cmpi.w	#$0002,d5
	beq	L004a5a
	cmpi.w	#$0005,d5
	beq	L004a5a
	cmpi.w	#$0008,d5
	bne	L004a78
L004a5a:
	bsr	L0036c6
	sub.l	d2,d1
	cmp.w	#$00fe,d0
	beq	L004a6c
	cmp.w	#$0004,d0
	bhi	L004a72
L004a6c:
	bsr	L0037c2
	bra	L004a76

L004a72:
	bsr	L0036f8
L004a76:
	move.b	d1,(a5)+
L004a78:
	rts

L004a7a:
	addq.l	#2,a0
	move.l	(a0)+,d2
	add.l	($0062,a1),d2
	move.w	(a0)+,d0
	cmpi.w	#$0001,d5
	beq	L004a9c
	cmpi.w	#$0002,d5
	beq	L004a9c
	cmpi.w	#$0005,d5
	beq	L004a9c
	cmpi.w	#$0008,d5
	bne	L004aba
L004a9c:
	bsr	L0036c6
	sub.l	d2,d1
	cmp.w	#$00fe,d0
	beq	L004aae
	cmp.w	#$0004,d0
	bhi	L004ab4
L004aae:
	bsr	L0037c2
	bra	L004ab8

L004ab4:
	bsr	L0036f8
L004ab8:
	move.b	d1,(a5)+
L004aba:
	rts

L004abc:
	addq.l	#2,a0
	move.l	(a0)+,d2
	add.l	($0066,a1),d2
	move.w	(a0)+,d0
	cmpi.w	#$0001,d5
	beq	L004ade
	cmpi.w	#$0002,d5
	beq	L004ade
	cmpi.w	#$0005,d5
	beq	L004ade
	cmpi.w	#$0008,d5
	bne	L004afc
L004ade:
	bsr	L0036c6
	sub.l	d2,d1
	cmp.w	#$00fe,d0
	beq	L004af0
	cmp.w	#$0004,d0
	bhi	L004af6
L004af0:
	bsr	L0037c2
	bra	L004afa

L004af6:
	bsr	L0036f8
L004afa:
	move.b	d1,(a5)+
L004afc:
	rts

L004afe:
	addq.l	#2,a0
	move.l	(a0)+,d2
	add.l	($006a,a1),d2
	move.w	(a0)+,d0
	cmpi.w	#$0001,d5
	beq	L004b20
	cmpi.w	#$0002,d5
	beq	L004b20
	cmpi.w	#$0005,d5
	beq	L004b20
	cmpi.w	#$0008,d5
	bne	L004b3e
L004b20:
	bsr	L0036c6
	sub.l	d2,d1
	cmp.w	#$00fe,d0
	beq	L004b32
	cmp.w	#$0004,d0
	bhi	L004b38
L004b32:
	bsr	L0037c2
	bra	L004b3c

L004b38:
	bsr	L0036f8
L004b3c:
	move.b	d1,(a5)+
L004b3e:
	rts

L004b40:
	addq.l	#2,a0
	move.l	(a0)+,d2
	add.l	($006e,a1),d2
	move.w	(a0)+,d0
	cmpi.w	#$0001,d5
	beq	L004b62
	cmpi.w	#$0002,d5
	beq	L004b62
	cmpi.w	#$0005,d5
	beq	L004b62
	cmpi.w	#$0008,d5
	bne	L004b80
L004b62:
	bsr	L0036c6
	sub.l	d2,d1
	cmp.w	#$00fe,d0
	bhi	L004b74
	cmp.w	#$0004,d0
	bhi	L004b7a
L004b74:
	bsr	L0037c2
	bra	L004b7e

L004b7a:
	bsr	L0036f8
L004b7e:
	move.b	d1,(a5)+
L004b80:
	rts

L004b82:
	addq.l	#2,a0
	move.l	(a0)+,d2
	add.l	($0072,a1),d2
	move.w	(a0)+,d0
	cmpi.w	#$0001,d5
	beq	L004ba4
	cmpi.w	#$0002,d5
	beq	L004ba4
	cmpi.w	#$0005,d5
	beq	L004ba4
	cmpi.w	#$0008,d5
	bne	L004bc2
L004ba4:
	bsr	L0036c6
	sub.l	d2,d1
	cmp.w	#$00fe,d0
	beq	L004bb6
	cmp.w	#$0004,d0
	bhi	L004bbc
L004bb6:
	bsr	L0037c2
	bra	L004bc0

L004bbc:
	bsr	L0036f8
L004bc0:
	move.b	d1,(a5)+
L004bc2:
	rts

L004bc4:
	addq.l	#2,a0
	move.w	(a0)+,d0
	bsr	L0036c6
	tst.w	d0
	beq	L004be6
	cmp.w	#$0004,d0
	bls	L004be2
	cmp.w	#$00fe,d0
	beq	L004be2
	move.w	#$0002,d0
	bra	L004be6

L004be2:
	move.w	#$0001,d0
L004be6:
	movea.l	(End+$000090,pc),a3
	cmpa.l	(End+$00008c,pc),a3
	beq	L0037f2
	move.l	d1,-(a3)
	move.w	d0,-(a3)
	lea.l	(End+$000090,pc),a3
	subq.l	#6,(a3)
	rts

L004bfe:
	addq.l	#2,a0
	move.l	(a0)+,d1
	movea.l	(End+$000090,pc),a3
	cmpa.l	(End+$00008c,pc),a3
	beq	L0037f2
	move.l	d1,-(a3)
	move.w	#$0000,-(a3)
	lea.l	(End+$000090,pc),a3
	subq.l	#6,(a3)
	rts

L004c1c:
	addq.l	#2,a0
	move.l	(a0)+,d1
	add.l	($004e,a1),d1
L004c24:
	movea.l	(End+$000090,pc),a3
	cmpa.l	(End+$00008c,pc),a3
	beq	L0037f2
	move.l	d1,-(a3)
	move.w	#$0001,-(a3)
	lea.l	(End+$000090,pc),a3
	subq.l	#6,(a3)
	rts

L004c3e:
	addq.l	#2,a0
	move.l	(a0)+,d1
	add.l	($0052,a1),d1
	bra	L004c24

L004c48:
	addq.l	#2,a0
	move.l	(a0)+,d1
	add.l	($0056,a1),d1
	bra	L004c24

L004c52:
	addq.l	#2,a0
	move.l	(a0)+,d1
	add.l	($005a,a1),d1
	bra	L004c24

L004c5c:
	addq.l	#2,a0
	move.l	(a0)+,d1
	add.l	($005e,a1),d1
L004c64:
	movea.l	(End+$000090,pc),a3
	cmpa.l	(End+$00008c,pc),a3
	beq	L0037f2
	move.l	d1,-(a3)
	move.w	#$0002,-(a3)
	lea.l	(End+$000090,pc),a3
	subq.l	#6,(a3)
	rts

L004c7e:
	addq.l	#2,a0
	move.l	(a0)+,d1
	add.l	($0062,a1),d1
	bra	L004c64

L004c88:
	addq.l	#2,a0
	move.l	(a0)+,d1
	add.l	($0066,a1),d1
	bra	L004c64

L004c92:
	addq.l	#2,a0
	move.l	(a0)+,d1
	add.l	($006a,a1),d1
	bra	L004c64

L004c9c:
	addq.l	#2,a0
	move.l	(a0)+,d1
	add.l	($006e,a1),d1
	bra	L004c64

L004ca6:
	addq.l	#2,a0
	move.l	(a0)+,d1
	add.l	($0072,a1),d1
	bra	L004c64

L004cb0:
	addq.l	#2,a0
	movea.l	(End+$000090,pc),a3
	cmpa.l	(End+$000088,pc),a3
	beq	L0037f8
	move.w	(a3)+,d0
	move.l	(a3)+,d1
	cmpi.w	#$0001,d5
	beq	L004cda
	cmpi.w	#$0002,d5
	beq	L004cda
	cmpi.w	#$0005,d5
	beq	L004cda
	cmpi.w	#$0008,d5
	bne	L004cee
L004cda:
	tst.w	d0
	beq	L004ce6
	bmi	L004cea
	bsr	L0037c2
	bra	L004cea

L004ce6:
	bsr	L0036e2
L004cea:
	clr.b	(a5)+
	move.b	d1,(a5)+
L004cee:
	lea.l	(End+$000090,pc),a3
	addq.l	#6,(a3)
	rts

L004cf6:
	addq.l	#2,a0
	movea.l	(End+$000090,pc),a3
	cmpa.l	(End+$000088,pc),a3
	beq	L0037f8
	move.w	(a3)+,d0
	move.l	(a3)+,d1
	cmpi.w	#$0001,d5
	beq	L004d20
	cmpi.w	#$0002,d5
	beq	L004d20
	cmpi.w	#$0005,d5
	beq	L004d20
	cmpi.w	#$0008,d5
	bne	L004d32
L004d20:
	tst.w	d0
	beq	L004d2c
	bmi	L004d30
	bsr	L0037c2
	bra	L004d30

L004d2c:
	bsr	L0036e2
L004d30:
	move.b	d1,(a5)+
L004d32:
	lea.l	(End+$000090,pc),a3
	addq.l	#6,(a3)
	rts

L004d3a:
	addq.l	#2,a0
	movea.l	(End+$000090,pc),a3
	cmpa.l	(End+$000088,pc),a3
	beq	L0037f8
	move.w	(a3)+,d0
	move.l	(a3)+,d1
	cmpi.w	#$0001,d5
	beq	L004d64
	cmpi.w	#$0002,d5
	beq	L004d64
	cmpi.w	#$0005,d5
	beq	L004d64
	cmpi.w	#$0008,d5
	bne	L004d8c
L004d64:
	tst.w	d0
	beq	L004d82
	bmi	L004d86
	cmpi.w	#$0001,d0
	beq	L004d7c
	cmpi.w	#$0004,d5
	bhi	L004d7c
	bsr	L003724
	bra	L004d86

L004d7c:
	bsr	L0037c2
	bra	L004d86

L004d82:
	bsr	L00370e
L004d86:
	move.w	d1,-(a7)
	move.b	(a7)+,(a5)+
	move.b	d1,(a5)+
L004d8c:
	lea.l	(End+$000090,pc),a3
	addq.l	#6,(a3)
	rts

L004d94:
	addq.l	#2,a0
	movea.l	(End+$000090,pc),a3
	cmpa.l	(End+$000088,pc),a3
	beq	L0037f8
	move.w	(a3)+,d0
	move.l	(a3)+,d1
	cmpi.w	#$0001,d5
	beq	L004dbe
	cmpi.w	#$0002,d5
	beq	L004dbe
	cmpi.w	#$0005,d5
	beq	L004dbe
	cmpi.w	#$0008,d5
	bne	L004e30
L004dbe:
	tst.w	d0
	beq	L004e24
	bmi	L004e24
	cmpi.w	#$0001,d0
	beq	L004e12
	cmpi.w	#$0004,d5
	bls	L004e24
	move.l	(-$0042,a6),d0
	cmp.l	(End+$000054,pc),d0
	beq	L002ea2
	addq.l	#4,(-$0042,a6)
	move.l	a4,d0
	movea.l	(-$0046,a6),a4
	suba.l	(-$004a,a6),a5
	cmpa.l	(End+$000038,pc),a5
	bcc	L004dfc
	suba.l	(-$0052,a6),a5
	move.l	a5,(a4)+
	adda.l	(-$0052,a6),a5
	bra	L004e06

L004dfc:
	suba.l	(-$004e,a6),a5
	move.l	a5,(a4)+
	adda.l	(-$004e,a6),a5
L004e06:
	move.l	a4,(-$0046,a6)
	movea.l	d0,a4
	adda.l	(-$004a,a6),a5
	bra	L004e24

L004e12:
	subq.l	#6,d7
	bmi	L00054e
	addq.l	#6,(-$005a,a6)
	clr.w	(a4)+
	move.l	a5,(a4)+
	add.l	(End+$000098,pc),d1
L004e24:
	move.w	a5,-(a7)
	lsr.w	(a7)+
	bcc	L004e2e
	bsr	L003924
L004e2e:
	move.l	d1,(a5)+
L004e30:
	lea.l	(End+$000090,pc),a3
	addq.l	#6,(a3)
	rts

L004e38:
	addq.l	#2,a0
	movea.l	(End+$000090,pc),a3
	cmpa.l	(End+$000088,pc),a3
	beq	L0037f8
	move.w	(a3)+,d0
	move.l	(a3)+,d1
	cmpi.w	#$0001,d5
	beq	L004e62
	cmpi.w	#$0002,d5
	beq	L004e62
	cmpi.w	#$0005,d5
	beq	L004e62
	cmpi.w	#$0008,d5
	bne	L004e84
L004e62:
	tst.w	d0
	beq	L004e7a
	bmi	L004e7e
	cmpi.w	#$0001,d0
	beq	L004e74
	cmpi.w	#$0004,d5
	bls	L004e7a
L004e74:
	bsr	L0037c2
	bra	L004e7e

L004e7a:
	bsr	L003724
L004e7e:
	move.w	d1,-(a7)
	move.b	(a7)+,(a5)+
	move.b	d1,(a5)+
L004e84:
	lea.l	(End+$000090,pc),a3
	addq.l	#6,(a3)
	rts

L004e8c:
	addq.l	#2,a0
	movea.l	(End+$000090,pc),a3
	cmpa.l	(End+$000088,pc),a3
	beq	L004e9e
	move.w	(a3)+,d2
	move.l	(a3)+,d0
	rts

L004e9e:
	addq.l	#4,a7
	bra	L0037f8

L004ea4:
	addq.l	#2,a0
	movea.l	(End+$000090,pc),a3
	cmpa.l	(End+$000088,pc),a3
	beq	L004e9e
	move.w	(a3)+,d2
	move.l	(a3)+,d0
	cmpa.l	(End+$000088,pc),a3
	beq	L004e9e
	move.w	(a3)+,d3
	move.l	(a3)+,d1
	rts

L004ec0:
	tst.w	d2
	ble	L004eca
	bsr	L0037b8
	moveq.l	#$ff,d2
L004eca:
	rts

L004ecc:
	moveq.l	#$00,d4
	tst.w	d2
	beq	L004eda
	bmi	L004ee4
	bsr	L0037b8
	bra	L004ee4

L004eda:
	tst.w	d3
	beq	L004ee6
	bmi	L004ee4
	bsr	L0037b8
L004ee4:
	moveq.l	#$ff,d4
L004ee6:
	rts

L004ee8:
	bsr	L004e8c
	bsr	L004ec0
	tst.w	d2
	bmi	L004ef2
	neg.l	d0
L004ef2:
	move.l	d0,-(a3)
	move.w	d2,-(a3)
	rts

L004ef8:
	bsr	L004e8c
	move.l	d0,-(a3)
	move.w	d2,-(a3)
	rts

L004f00:
	bsr	L004e8c
	bsr	L004ec0
	tst.w	d2
	bmi	L004f10
	tst.l	d0
	seq.b	d0
	ext.w	d0
	ext.l	d0
L004f10:
	move.l	d0,-(a3)
	move.w	d2,-(a3)
	rts

L004f16:
	bsr	L004e8c
	bsr	L004ec0
	tst.w	d2
	bmi	L004f24
	lsr.w	#8,d0
	ext.l	d0
L004f24:
	move.l	d0,-(a3)
	move.w	d2,-(a3)
	rts

L004f2a:
	bsr	L004e8c
	bsr	L004ec0
	tst.w	d2
	bmi	L004f3a
	andi.l	#$000000ff,d0
L004f3a:
	move.l	d0,-(a3)
	move.w	d2,-(a3)
	rts

L004f40:
	bsr	L004e8c
	bsr	L004ec0
	tst.w	d2
	bmi	L004f50
	clr.w	d0
	swap.w	d0
L004f50:
	move.l	d0,-(a3)
	move.w	d2,-(a3)
	rts

L004f56:
	bsr	L004e8c
	bsr	L004ec0
	tst.w	d2
	bmi	L004f68
	andi.l	#$0000ffff,d0
L004f68:
	move.l	d0,-(a3)
	move.w	d2,-(a3)
	rts

L004f6e:
	bsr	L004ea4
	bsr	L004ecc
	tst.l	d4
	bmi	L004f7e
	bsr	L005264
L004f7e:
	move.l	d1,-(a3)
	move.w	d4,-(a3)
	lea.l	(End+$000090,pc),a3
	addq.l	#6,(a3)
	rts

L004f8a:
	bsr	L004ea4
	bsr	L004ecc
	tst.l	d4
	bmi	L004fa6
	tst.l	d0
	bne	L004fa2
	bsr	L0037ae
	moveq.l	#$ff,d4
	bra	L004fa6

L004fa2:
	bsr	L0052a6
L004fa6:
	move.l	d1,-(a3)
	move.w	d4,-(a3)
	lea.l	(End+$000090,pc),a3
	addq.l	#6,(a3)
	rts

L004fb2:
	bsr	L004ea4
	bsr	L004ecc
	tst.l	d4
	bmi	L004fce
	tst.l	d0
	bne	L004fca
	bsr	L0037ae
	moveq.l	#$ff,d4
	bra	L004fce

L004fca:
	bsr	L0052a6
L004fce:
	move.l	d0,-(a3)
	move.w	d4,-(a3)
	lea.l	(End+$000090,pc),a3
	addq.l	#6,(a3)
	rts

L004fda:
	bsr	L004ea4
	bsr	L004ecc
	tst.l	d4
	bmi	L004fe8
	lsr.l	d0,d1
L004fe8:
	move.l	d1,-(a3)
	move.w	d4,-(a3)
	lea.l	(End+$000090,pc),a3
	addq.l	#6,(a3)
	rts

L004ff4:
	bsr	L004ea4
	bsr	L004ecc
	tst.l	d4
	bmi	L005002
	lsl.l	d0,d1
L005002:
	move.l	d1,-(a3)
	move.w	d4,-(a3)
	lea.l	(End+$000090,pc),a3
	addq.l	#6,(a3)
	rts

L00500e:
	bsr	L004ea4
	bsr	L004ecc
	tst.l	d4
	bmi	L00501c
	asr.l	d0,d1
L00501c:
	move.l	d1,-(a3)
	move.w	d4,-(a3)
	lea.l	(End+$000090,pc),a3
	addq.l	#6,(a3)
	rts

L005028:
	bsr	L004ea4
	tst.w	d2
	beq	L00504a
	bgt	L005036
	moveq.l	#$ff,d4
	bra	L005050

L005036:
	tst.w	d3
	bge	L00503e
	moveq.l	#$ff,d4
	bra	L005050

L00503e:
	cmp.w	d2,d3
	beq	L00504a
	bsr	L0037b8
	moveq.l	#$ff,d4
	bra	L005050

L00504a:
	move.w	d3,d4
	eor.w	d2,d4
	sub.l	d0,d1
L005050:
	move.l	d1,-(a3)
	move.w	d4,-(a3)
	lea.l	(End+$000090,pc),a3
	addq.l	#6,(a3)
	rts

L00505c:
	bsr	L004ea4
	tst.w	d2
	beq	L005078
	bgt	L00506a
	moveq.l	#$ff,d4
	bra	L00507e

L00506a:
	tst.w	d3
	beq	L005078
	bmi	L005074
	bsr	L0037b8
L005074:
	moveq.l	#$ff,d4
	bra	L00507e

L005078:
	move.w	d3,d4
	eor.w	d2,d4
	add.l	d0,d1
L00507e:
	move.l	d1,-(a3)
	move.w	d4,-(a3)
	lea.l	(End+$000090,pc),a3
	addq.l	#6,(a3)
	rts

L00508a:
	bsr	L004ea4
	bsr	L004ecc
	tst.l	d4
	bmi	L00509e
	cmp.l	d0,d1
	seq.b	d1
	ext.w	d1
	ext.l	d1
L00509e:
	move.l	d1,-(a3)
	move.w	d4,-(a3)
	lea.l	(End+$000090,pc),a3
	addq.l	#6,(a3)
	rts

L0050aa:
	bsr	L004ea4
	bsr	L004ecc
	tst.l	d4
	bmi	L0050be
	cmp.l	d0,d1
	sne.b	d1
	ext.w	d1
	ext.l	d1
L0050be:
	move.l	d1,-(a3)
	move.w	d4,-(a3)
	lea.l	(End+$000090,pc),a3
	addq.l	#6,(a3)
	rts

L0050ca:
	bsr	L004ea4
	bsr	L004ecc
	tst.l	d4
	bmi	L0050de
	cmp.l	d0,d1
	scs.b	d1
	ext.w	d1
	ext.l	d1
L0050de:
	move.l	d1,-(a3)
	move.w	d4,-(a3)
	lea.l	(End+$000090,pc),a3
	addq.l	#6,(a3)
	rts

L0050ea:
	bsr	L004ea4
	bsr	L004ecc
	tst.l	d4
	bmi	L0050fe
	cmp.l	d0,d1
	sls.b	d1
	ext.w	d1
	ext.l	d1
L0050fe:
	move.l	d1,-(a3)
	move.w	d4,-(a3)
	lea.l	(End+$000090,pc),a3
	addq.l	#6,(a3)
	rts

L00510a:
	bsr	L004ea4
	bsr	L004ecc
	tst.l	d4
	bmi	L00511e
	cmp.l	d0,d1
	shi.b	d1
	ext.w	d1
	ext.l	d1
L00511e:
	move.l	d1,-(a3)
	move.w	d4,-(a3)
	lea.l	(End+$000090,pc),a3
	addq.l	#6,(a3)
	rts

L00512a:
	bsr	L004ea4
	bsr	L004ecc
	tst.l	d4
	bmi	L00513e
	cmp.l	d0,d1
	scc.b	d1
	ext.w	d1
	ext.l	d1
L00513e:
	move.l	d1,-(a3)
	move.w	d4,-(a3)
	lea.l	(End+$000090,pc),a3
	addq.l	#6,(a3)
	rts

L00514a:
	bsr	L004ea4
	bsr	L004ecc
	tst.l	d4
	bmi	L00515e
	cmp.l	d0,d1
	slt.b	d1
	ext.w	d1
	ext.l	d1
L00515e:
	move.l	d1,-(a3)
	move.w	d4,-(a3)
	lea.l	(End+$000090,pc),a3
	addq.l	#6,(a3)
	rts

L00516a:
	bsr	L004ea4
	bsr	L004ecc
	tst.l	d4
	bmi	L00517e
	cmp.l	d0,d1
	sle.b	d1
	ext.w	d1
	ext.l	d1
L00517e:
	move.l	d1,-(a3)
	move.w	d4,-(a3)
	lea.l	(End+$000090,pc),a3
	addq.l	#6,(a3)
	rts

L00518a:
	bsr	L004ea4
	bsr	L004ecc
	tst.l	d4
	bmi	L00519e
	cmp.l	d0,d1
	sgt.b	d1
	ext.w	d1
	ext.l	d1
L00519e:
	move.l	d1,-(a3)
	move.w	d4,-(a3)
	lea.l	(End+$000090,pc),a3
	addq.l	#6,(a3)
	rts

L0051aa:
	bsr	L004ea4
	bsr	L004ecc
	tst.l	d4
	bmi	L0051be
	cmp.l	d0,d1
	sge.b	d1
	ext.w	d1
	ext.l	d1
L0051be:
	move.l	d1,-(a3)
	move.w	d4,-(a3)
	lea.l	(End+$000090,pc),a3
	addq.l	#6,(a3)
	rts

L0051ca:
	bsr	L004ea4
	bsr	L004ecc
	tst.l	d4
	bmi	L0051d8
	and.l	d0,d1
L0051d8:
	move.l	d1,-(a3)
	move.w	d4,-(a3)
	lea.l	(End+$000090,pc),a3
	addq.l	#6,(a3)
	rts

L0051e4:
	bsr	L004ea4
	bsr	L004ecc
	tst.l	d4
	bmi	L0051f2
	eor.l	d0,d1
L0051f2:
	move.l	d1,-(a3)
	move.w	d4,-(a3)
	lea.l	(End+$000090,pc),a3
	addq.l	#6,(a3)
	rts

L0051fe:
	bsr	L004ea4
	bsr	L004ecc
	tst.l	d4
	bmi	L00520c
	or.l	d0,d1
L00520c:
	move.l	d1,-(a3)
	move.w	d4,-(a3)
	lea.l	(End+$000090,pc),a3
	addq.l	#6,(a3)
	rts

L005218:
	bra	L0014ec

L00521c:
	movem.l	(a0),d0-d1
	subq.w	#1,d0
	beq	L005244
	subq.w	#1,d0
	beq	L00523e
	subq.w	#1,d0
	beq	L005238
	subq.w	#1,d0
	bne	L002e64
	add.l	($005a,a1),d1
	bra	L005248

L005238:
	add.l	($0056,a1),d1
	bra	L005248

L00523e:
	add.l	($0052,a1),d1
	bra	L005248

L005244:
	add.l	($004e,a1),d1
L005248:
	tst.w	(-$000e,a6)
	beq	L005252
	bsr	L0037e2
L005252:
	addq.w	#1,(-$000e,a6)
	pea.l	($0008,a0)
	lea.l	(End+$000094,pc),a0
	move.l	d1,(a0)
	movea.l	(a7)+,a0
	rts

L005264:
	movem.l	d2-d4,-(a7)
	moveq.l	#$00,d2
	tst.l	d0
	bpl	L005272
	neg.l	d0
	not.w	d2
L005272:
	tst.l	d1
	bpl	L00527a
	neg.l	d1
	not.w	d2
L00527a:
	move.w	d1,d3
	mulu.w	d0,d3
	swap.w	d0
	move.w	d1,d4
	mulu.w	d0,d4
	swap.w	d4
	clr.w	d4
	add.l	d4,d3
	swap.w	d0
	swap.w	d1
	move.w	d1,d4
	mulu.w	d0,d4
	swap.w	d4
	clr.w	d4
	add.l	d4,d3
	tst.w	d2
	beq	L00529e
	neg.l	d3
L00529e:
	exg.l	d1,d3
	movem.l	(a7)+,d2-d4
	rts

L0052a6:
	movem.l	d2-d5,-(a7)
	moveq.l	#$00,d2
	tst.l	d0
	bpl	L0052b4
	neg.l	d0
	not.w	d2
L0052b4:
	tst.l	d1
	bpl	L0052bc
	neg.l	d1
	not.w	d2
L0052bc:
	moveq.l	#$00,d3
	moveq.l	#$00,d4
	move.w	#$001f,d5
L0052c4:
	add.l	d3,d3
	roxl.l	#1,d1
	roxl.l	#1,d4
	cmp.l	d0,d4
	bcs	L0052d2
	sub.l	d0,d4
	addq.l	#1,d3
L0052d2:
	dbra	d5,L0052c4
	move.l	d3,d1
	move.l	d4,d0
	tst.w	d2
	bpl	L0052e0
	neg.l	d1
L0052e0:
	movem.l	(a7)+,d2-d5
	rts

L0052e6:
	.dc.b	'Illegal SCD information in ',$00
L005302:
	.dc.b	'Relative error in ',$00
L005315:
	.dc.b	'Division by zero in ',$00
L00532a:
	.dc.b	'Illegal expression in ',$00
L005341:
	.dc.b	'Over flow in ',$00
L00534f:
	.dc.b	'Calc stack over flow in ',$00
L005368:
	.dc.b	'Calc stack under flow in ',$00
L005382:
	.dc.b	'Duplicate exec address in ',$00
L00539d:
	.dc.b	' in ',$00
L0053a2:
	.dc.b	' at ',$00
L0053a7:
	.dc.b	' (text)',$00
L0053af:
	.dc.b	' (data)',$00
L0053b7:
	.dc.b	' (rdata)',$00
L0053c0:
	.dc.b	' (rldata)',$00
L0053ca:
	.dc.b	'Can',$27,'t open file : ',$00
L0053dd:
	.dc.b	'File I/O error : ',$00
L0053ef:
	.dc.b	'Device full : ',$00
L0053fe:
	.dc.b	'Using relocate table : ',$00
L005416:
	.dc.b	'Relocate at odd address : ',$00
L005431:
	.dc.b	'Exec address is not top of file : ',$00
L005454:
	.dc.b	'Unmatch roffset size (?_?)!',$0a
	.dc.b	$0a,$00
L005472:
	.dc.b	'Making executable file...',$0a,$00,$00
L00548e:
	.dc.w	L002c34-L00548e
	.dc.w	L003828-L00548e
	.dc.w	L00385c-L00548e
	.dc.w	L00385c-L00548e
	.dc.w	L00385c-L00548e
	.dc.w	L00385c-L00548e
	.dc.w	L00385c-L00548e
	.dc.w	L00385c-L00548e
	.dc.w	L00385c-L00548e
	.dc.w	L00385c-L00548e
	.dc.w	L00385c-L00548e
	.dc.w	L00385c-L00548e
	.dc.w	L0038ba-L00548e
	.dc.w	L003932-L00548e
	.dc.w	L003932-L00548e
	.dc.w	L003932-L00548e
	.dc.w	L003932-L00548e
	.dc.w	L003a7c-L00548e
	.dc.w	L003b16-L00548e
	.dc.w	L003b16-L00548e
	.dc.w	L003b16-L00548e
	.dc.w	L003b16-L00548e
	.dc.w	L003b16-L00548e
	.dc.w	L003b16-L00548e
	.dc.w	L003b16-L00548e
	.dc.w	L003b16-L00548e
	.dc.w	L003b16-L00548e
	.dc.w	L003b16-L00548e
	.dc.w	L003998-L00548e
	.dc.w	L003998-L00548e
	.dc.w	L003998-L00548e
	.dc.w	L003998-L00548e
	.dc.w	L003ac6-L00548e
	.dc.w	L003b16-L00548e
	.dc.w	L003b16-L00548e
	.dc.w	L003b16-L00548e
	.dc.w	L003b16-L00548e
	.dc.w	L003b5c-L00548e
	.dc.w	L003b94-L00548e
	.dc.w	L003bcc-L00548e
	.dc.w	L003b16-L00548e
	.dc.w	L003b16-L00548e
	.dc.w	L003b16-L00548e
	.dc.w	L0039e6-L00548e
	.dc.w	L0039e6-L00548e
	.dc.w	L0039e6-L00548e
	.dc.w	L0039e6-L00548e
	.dc.w	L003aee-L00548e
	.dc.w	L003c04-L00548e
	.dc.w	L003c42-L00548e
	.dc.w	L003c80-L00548e
	.dc.w	L003cbe-L00548e
	.dc.w	L003cfc-L00548e
	.dc.w	L003d6e-L00548e
	.dc.w	L003de0-L00548e
	.dc.w	L003e52-L00548e
	.dc.w	L003ec4-L00548e
	.dc.w	L003f36-L00548e
	.dc.w	L003966-L00548e
	.dc.w	L003966-L00548e
	.dc.w	L003966-L00548e
	.dc.w	L003966-L00548e
	.dc.w	L003aa2-L00548e
	.dc.w	L003b3a-L00548e
	.dc.w	L003b3a-L00548e
	.dc.w	L003b3a-L00548e
	.dc.w	L003b3a-L00548e
	.dc.w	L003b3a-L00548e
	.dc.w	L003b3a-L00548e
	.dc.w	L003b3a-L00548e
	.dc.w	L003b3a-L00548e
	.dc.w	L003b3a-L00548e
	.dc.w	L003b3a-L00548e
	.dc.w	L003998-L00548e
	.dc.w	L003998-L00548e
	.dc.w	L002e64-L00548e
	.dc.w	L002e64-L00548e
	.dc.w	L002e64-L00548e
	.dc.w	L002e64-L00548e
	.dc.w	L002e64-L00548e
	.dc.w	L0039e6-L00548e
	.dc.w	L0039e6-L00548e
	.dc.w	L0039e6-L00548e
	.dc.w	L0039e6-L00548e
	.dc.w	L003aee-L00548e
	.dc.w	L003c04-L00548e
	.dc.w	L003c42-L00548e
	.dc.w	L003c80-L00548e
	.dc.w	L003cbe-L00548e
	.dc.w	L003cfc-L00548e
	.dc.w	L003d6e-L00548e
	.dc.w	L003de0-L00548e
	.dc.w	L003e52-L00548e
	.dc.w	L003ec4-L00548e
	.dc.w	L003f36-L00548e
	.dc.w	L003966-L00548e
	.dc.w	L003966-L00548e
	.dc.w	L002e64-L00548e
	.dc.w	L002e64-L00548e
	.dc.w	L002e64-L00548e
	.dc.w	L002e64-L00548e
	.dc.w	L002e64-L00548e
	.dc.w	L0038e4-L00548e
	.dc.w	L00391a-L00548e
	.dc.w	L003fa8-L00548e
	.dc.w	L003fa8-L00548e
	.dc.w	L003fa8-L00548e
	.dc.w	L003fa8-L00548e
	.dc.w	L004102-L00548e
	.dc.w	L0041a4-L00548e
	.dc.w	L0041a4-L00548e
	.dc.w	L0041a4-L00548e
	.dc.w	L0041a4-L00548e
	.dc.w	L0041a4-L00548e
	.dc.w	L0041a4-L00548e
	.dc.w	L0041a4-L00548e
	.dc.w	L0041a4-L00548e
	.dc.w	L0041a4-L00548e
	.dc.w	L0041a4-L00548e
	.dc.w	L004016-L00548e
	.dc.w	L004016-L00548e
	.dc.w	L004016-L00548e
	.dc.w	L004016-L00548e
	.dc.w	L004150-L00548e
	.dc.w	L0041a4-L00548e
	.dc.w	L0041a4-L00548e
	.dc.w	L0041a4-L00548e
	.dc.w	L0041a4-L00548e
	.dc.w	L0041ee-L00548e
	.dc.w	L004228-L00548e
	.dc.w	L004262-L00548e
	.dc.w	L0041a4-L00548e
	.dc.w	L0041a4-L00548e
	.dc.w	L0041a4-L00548e
	.dc.w	L004068-L00548e
	.dc.w	L004068-L00548e
	.dc.w	L004068-L00548e
	.dc.w	L004068-L00548e
	.dc.w	L00417a-L00548e
	.dc.w	L00429c-L00548e
	.dc.w	L0042dc-L00548e
	.dc.w	L00431c-L00548e
	.dc.w	L00435c-L00548e
	.dc.w	L00439c-L00548e
	.dc.w	L004410-L00548e
	.dc.w	L004484-L00548e
	.dc.w	L0044f8-L00548e
	.dc.w	L00456c-L00548e
	.dc.w	L0045e0-L00548e
	.dc.w	L003fe0-L00548e
	.dc.w	L003fe0-L00548e
	.dc.w	L003fe0-L00548e
	.dc.w	L003fe0-L00548e
	.dc.w	L00412a-L00548e
	.dc.w	L0041ca-L00548e
	.dc.w	L0041ca-L00548e
	.dc.w	L0041ca-L00548e
	.dc.w	L0041ca-L00548e
	.dc.w	L0041ca-L00548e
	.dc.w	L0041ca-L00548e
	.dc.w	L0041ca-L00548e
	.dc.w	L0041ca-L00548e
	.dc.w	L0041ca-L00548e
	.dc.w	L0041ca-L00548e
	.dc.w	L004016-L00548e
	.dc.w	L004016-L00548e
	.dc.w	L002e64-L00548e
	.dc.w	L002e64-L00548e
	.dc.w	L002e64-L00548e
	.dc.w	L002e64-L00548e
	.dc.w	L002e64-L00548e
	.dc.w	L004068-L00548e
	.dc.w	L004068-L00548e
	.dc.w	L004068-L00548e
	.dc.w	L004068-L00548e
	.dc.w	L00417a-L00548e
	.dc.w	L00429c-L00548e
	.dc.w	L0042dc-L00548e
	.dc.w	L00431c-L00548e
	.dc.w	L00435c-L00548e
	.dc.w	L00439c-L00548e
	.dc.w	L004410-L00548e
	.dc.w	L004484-L00548e
	.dc.w	L0044f8-L00548e
	.dc.w	L00456c-L00548e
	.dc.w	L0045e0-L00548e
	.dc.w	L003fe0-L00548e
	.dc.w	L003fe0-L00548e
	.dc.w	L002e64-L00548e
	.dc.w	L002e64-L00548e
	.dc.w	L002e64-L00548e
	.dc.w	L002e64-L00548e
	.dc.w	L002e64-L00548e
	.dc.w	L004654-L00548e
	.dc.w	L00469e-L00548e
	.dc.w	L0046e8-L00548e
	.dc.w	L004732-L00548e
	.dc.w	L00477c-L00548e
	.dc.w	L0047c2-L00548e
	.dc.w	L004808-L00548e
	.dc.w	L00484e-L00548e
	.dc.w	L004894-L00548e
	.dc.w	L0048da-L00548e
	.dc.w	L004654-L00548e
	.dc.w	L00469e-L00548e
	.dc.w	L0046e8-L00548e
	.dc.w	L004732-L00548e
	.dc.w	L00477c-L00548e
	.dc.w	L0047c2-L00548e
	.dc.w	L004808-L00548e
	.dc.w	L00484e-L00548e
	.dc.w	L004894-L00548e
	.dc.w	L0048da-L00548e
	.dc.w	L004920-L00548e
	.dc.w	L004966-L00548e
	.dc.w	L0049ac-L00548e
	.dc.w	L0049f2-L00548e
	.dc.w	L004a38-L00548e
	.dc.w	L004a7a-L00548e
	.dc.w	L004abc-L00548e
	.dc.w	L004afe-L00548e
	.dc.w	L004b40-L00548e
	.dc.w	L004b82-L00548e
	.dc.w	L004bc4-L00548e
	.dc.w	L004bc4-L00548e
	.dc.w	L004bc4-L00548e
	.dc.w	L004bc4-L00548e
	.dc.w	L004bfe-L00548e
	.dc.w	L004c1c-L00548e
	.dc.w	L004c3e-L00548e
	.dc.w	L004c48-L00548e
	.dc.w	L004c52-L00548e
	.dc.w	L004c5c-L00548e
	.dc.w	L004c7e-L00548e
	.dc.w	L004c88-L00548e
	.dc.w	L004c92-L00548e
	.dc.w	L004c9c-L00548e
	.dc.w	L004ca6-L00548e
	.dc.w	L004cb0-L00548e
	.dc.w	L004d3a-L00548e
	.dc.w	L004d94-L00548e
	.dc.w	L004cf6-L00548e
	.dc.w	L004d94-L00548e
	.dc.w	L004e38-L00548e
	.dc.w	L004ee8-L00548e
	.dc.w	L004ef8-L00548e
	.dc.w	L004f00-L00548e
	.dc.w	L004f16-L00548e
	.dc.w	L004f2a-L00548e
	.dc.w	L004f40-L00548e
	.dc.w	L004f56-L00548e
	.dc.w	L002e64-L00548e
	.dc.w	L004f6e-L00548e
	.dc.w	L004f8a-L00548e
	.dc.w	L004fb2-L00548e
	.dc.w	L004fda-L00548e
	.dc.w	L004ff4-L00548e
	.dc.w	L00500e-L00548e
	.dc.w	L005028-L00548e
	.dc.w	L00505c-L00548e
	.dc.w	L00508a-L00548e
	.dc.w	L0050aa-L00548e
	.dc.w	L0050ca-L00548e
	.dc.w	L0050ea-L00548e
	.dc.w	L00510a-L00548e
	.dc.w	L00512a-L00548e
	.dc.w	L00514a-L00548e
	.dc.w	L00516a-L00548e
	.dc.w	L00518a-L00548e
	.dc.w	L0051aa-L00548e
	.dc.w	L0051ca-L00548e
	.dc.w	L0051e4-L00548e
	.dc.w	L0051fe-L00548e
	.dc.w	L002e64-L00548e
	.dc.w	L002e64-L00548e
	.dc.w	L005218-L00548e
	.dc.w	L005218-L00548e
	.dc.w	L005218-L00548e
	.dc.w	L005218-L00548e
	.dc.w	L005218-L00548e
	.dc.w	L005218-L00548e
	.dc.w	L005218-L00548e
	.dc.w	L005218-L00548e
	.dc.w	L005218-L00548e
	.dc.w	L005218-L00548e
	.dc.w	L005218-L00548e
	.dc.w	L005218-L00548e
	.dc.w	L005218-L00548e
	.dc.w	L005218-L00548e
	.dc.w	L005218-L00548e
	.dc.w	L005218-L00548e
	.dc.w	L005218-L00548e
	.dc.w	L005218-L00548e
	.dc.w	L005218-L00548e
	.dc.w	L005218-L00548e
	.dc.w	L005218-L00548e
	.dc.w	L005218-L00548e
	.dc.w	L005218-L00548e
	.dc.w	L005218-L00548e
	.dc.w	L005218-L00548e
	.dc.w	L005218-L00548e
	.dc.w	L002e64-L00548e
	.dc.w	L005218-L00548e
	.dc.w	L005218-L00548e
	.dc.w	L005218-L00548e
	.dc.w	L00521c-L00548e
	.dc.w	L005218-L00548e
	.dc.w	L002e64-L00548e
	.dc.w	L002e64-L00548e
	.dc.w	L002e64-L00548e
	.dc.w	L002e64-L00548e
	.dc.w	L002e64-L00548e
	.dc.w	L002e64-L00548e
	.dc.w	L002e64-L00548e
	.dc.w	L002e64-L00548e
	.dc.w	L002e64-L00548e
	.dc.w	L002e64-L00548e
	.dc.w	L005218-L00548e
	.dc.w	L005218-L00548e
L00570c:
	move.b	(End+$0005d1,pc),d0
	beq	L00571a
	pea.l	(L005e50,pc)
	DOS	_PRINT
	addq.l	#4,a7
L00571a:
	move.w	#$0020,-(a7)		;' '
	pea.l	(End+$00011c,pc)
	DOS	_CREATE
	addq.l	#6,a7
	move.l	d0,d7
	bmi	L0058be
	bsr	L0058e0
	bsr	L005908
	moveq.l	#$00,d5
	moveq.l	#$00,d6
	movea.l	(End+$0005c8,pc),a4
	pea.l	(L005e64,pc)
	bsr	L005de8
	pea.l	(End+$00009c,pc)
	bsr	L005de8
	addq.l	#4,a7
	bsr	L005dde
	bsr	L005de8
	addq.l	#4,a7
	tst.w	d5
	bne	L0058c4
	move.l	(End+$000094,pc),-(a7)
	bsr	L005940
	moveq.l	#$00,d1
	move.l	(End+$000004,pc),d2
	pea.l	(L005fd2,pc)
	movem.l	d1-d2,-(a7)
	bsr	L005ca0
	add.l	d2,d1
	move.l	(End+$000008,pc),d2
	add.l	(End+$000054,pc),d2
	add.l	(End+$000038,pc),d2
	add.l	(End+$00003c,pc),d2
	pea.l	(L005fd7,pc)
	movem.l	d1-d2,-(a7)
	bsr	L005ca0
	add.l	d2,d1
	move.l	(End+$00000c,pc),d2
	pea.l	(L005fdc,pc)
	movem.l	d1-d2,-(a7)
	bsr	L005ca0
	add.l	d2,d1
	move.l	(End+$000010,pc),d2
	pea.l	(L005fe0,pc)
	movem.l	d1-d2,-(a7)
	bsr	L005ca0
	add.l	d2,d1
	move.l	(End+$000014,pc),d2
	pea.l	(L005fe7,pc)
	movem.l	d1-d2,-(a7)
	bsr	L005ca0
	moveq.l	#$00,d1
	move.l	(End+$000018,pc),d2
	pea.l	(L005fed,pc)
	movem.l	d1-d2,-(a7)
	bsr	L005ca0
	add.l	d2,d1
	move.l	(End+$00001c,pc),d2
	pea.l	(L005ff3,pc)
	movem.l	d1-d2,-(a7)
	bsr	L005ca0
	add.l	d2,d1
	move.l	(End+$000020,pc),d2
	pea.l	(L005ff8,pc)
	movem.l	d1-d2,-(a7)
	bsr	L005ca0
	add.l	d2,d1
	move.l	(End+$000024,pc),d2
	pea.l	(L006000,pc)
	movem.l	d1-d2,-(a7)
	bsr	L005ca0
	add.l	d2,d1
	move.l	(End+$000028,pc),d2
	pea.l	(L006007,pc)
	movem.l	d1-d2,-(a7)
	bsr	L005ca0
	add.l	d2,d1
	move.l	(End+$00002c,pc),d2
	pea.l	(L00600e,pc)
	movem.l	d1-d2,-(a7)
	bsr	L005ca0
	add.l	d2,d1
	move.l	(End+$000030,pc),d2
	pea.l	(L006014,pc)
	movem.l	d1-d2,-(a7)
	bsr	L005ca0
	add.l	d2,d1
	move.l	(End+$000034,pc),d2
	pea.l	(L00601d,pc)
	movem.l	d1-d2,-(a7)
	bsr	L005ca0
	bsr	L005dde
	bsr	L005dde
	lea.l	($00a0,a7),a7
	tst.w	d5
	bne	L0058c4
	movea.l	(End+$00006c,pc),a0
L005870:
	move.l	a0,d0
	beq	L0058aa
	movea.l	(a0),a1
	pea.l	(a1)
	bsr	L00595e
	bsr	L005aaa
	bsr	L005af8
	bsr	L005b9e
	bsr	L005bf0
	bsr	L005c48
	addq.l	#4,a7
	tst.l	($0004,a0)
	beq	L0058aa
	bsr	L005dde
	bsr	L005dde
	tst.w	d5
	bne	L0058c4
	movea.l	($0004,a0),a0
	bra	L005870

L0058aa:
	bsr	L005e16
	tst.w	d5
	bne	L0058c4
	move.w	d7,-(a7)
	DOS	_CLOSE
	addq.l	#2,a7
	tst.l	d0
	bmi	L0058c4
	rts

L0058be:
	pea.l	(L005e2e,pc)
	bra	L0058c8

L0058c4:
	pea.l	(L005e41,pc)
L0058c8:
	DOS	_PRINT
	pea.l	(End+$00011c,pc)
	DOS	_PRINT
	addq.l	#8,a7
	bsr	L000c82
	lea.l	(End+$0005cc,pc),a0
	move.w	#$0001,(a0)
	rts

L0058e0:
	move.l	a0,-(a7)
	lea.l	(End,pc),a0
	moveq.l	#$00,d0
	sub.b	($007f,a0),d0
	and.b	#$0f,d0
	sub.l	d0,($0084,a0)
	bmi	L005900
	add.l	d0,($007c,a0)
	moveq.l	#$00,d0
L0058fc:
	movea.l	(a7)+,a0
	rts

L005900:
	add.l	d0,($0084,a0)
	moveq.l	#$ff,d0
	bra	L0058fc

L005908:
	move.l	a6,-(a7)
	lea.l	(End,pc),a6
	move.l	($0084,a6),d0
	andi.l	#$fffffc00,d0
	beq	L005930
	move.l	($007c,a6),($05c8,a6)
	add.l	d0,($007c,a6)
	sub.l	d0,($0084,a6)
L005928:
	move.l	d0,($05c4,a6)
	movea.l	(a7)+,a6
	rts

L005930:
	pea.l	($019c,a6)
	move.l	(a7)+,($05c8,a6)
	move.l	#$00000400,d0
	bra	L005928

L005940:
	link.w	a6,#$0000
	pea.l	(L006025,pc)
	bsr	L005d5c
	move.l	($0008,a6),-(a7)
	bsr	L005d9e
	bsr	L005dde
	addq.l	#8,a7
	unlk	a6
	rts

L00595e:
	link.w	a6,#-$0100
	move.l	a0,-(a7)
	movea.l	($0008,a6),a0
	pea.l	(L005e64,pc)
	bsr	L005de8
	pea.l	($0010)
	pea.l	(a0)
	bsr	L005cf8
	bsr	L005dde
	pea.l	(L005e64,pc)
	bsr	L005de8
	lea.l	($0010,a7),a7
	pea.l	(L005fcc,pc)
	bsr	L005d5c
	move.l	($008e,a0),-(a7)
	bsr	L005d9e
	addq.l	#8,a7
	bsr	L005dde
	pea.l	(L005fd2,pc)
	move.l	($0026,a0),-(a7)
	move.l	($004e,a0),-(a7)
	bsr	L005ca0
	pea.l	(L005fd7,pc)
	move.l	($002a,a0),-(a7)
	move.l	($0052,a0),-(a7)
	bsr	L005ca0
	pea.l	(L005fdc,pc)
	move.l	($002e,a0),-(a7)
	move.l	($0056,a0),-(a7)
	bsr	L005ca0
	pea.l	(L005fe7,pc)
	move.l	($0032,a0),-(a7)
	move.l	($005a,a0),-(a7)
	bsr	L005ca0
	move.l	($0036,a0),d0
	beq	L005a00
	pea.l	(L005fed,pc)
	move.l	d0,-(a7)
	move.l	($005e,a0),d0
	add.l	#$00008000,d0
	move.l	d0,-(a7)
	bsr	L005ca0
	lea.l	($000c,a7),a7
L005a00:
	move.l	($003a,a0),d0
	beq	L005a20
	pea.l	(L005ff3,pc)
	move.l	d0,-(a7)
	move.l	($0062,a0),d0
	add.l	#$00008000,d0
	move.l	d0,-(a7)
	bsr	L005ca0
	lea.l	($000c,a7),a7
L005a20:
	move.l	($003e,a0),d0
	beq	L005a40
	pea.l	(L006000,pc)
	move.l	d0,-(a7)
	move.l	($0066,a0),d0
	add.l	#$00008000,d0
	move.l	d0,-(a7)
	bsr	L005ca0
	lea.l	($000c,a7),a7
L005a40:
	move.l	($0042,a0),d0
	beq	L005a60
	pea.l	(L006007,pc)
	move.l	d0,-(a7)
	move.l	($006a,a0),d0
	add.l	#$00008000,d0
	move.l	d0,-(a7)
	bsr	L005ca0
	lea.l	($000c,a7),a7
L005a60:
	move.l	($0046,a0),d0
	beq	L005a80
	pea.l	(L00600e,pc)
	move.l	d0,-(a7)
	move.l	($006e,a0),d0
	add.l	#$00008000,d0
	move.l	d0,-(a7)
	bsr	L005ca0
	lea.l	($000c,a7),a7
L005a80:
	move.l	($004a,a0),d0
	beq	L005aa0
	pea.l	(L00601d,pc)
	move.l	d0,-(a7)
	move.l	($0072,a0),d0
	add.l	#$00008000,d0
	move.l	d0,-(a7)
	bsr	L005ca0
	lea.l	($000c,a7),a7
L005aa0:
	lea.l	($0030,a7),a7
	movea.l	(a7)+,a0
	unlk	a6
	rts

L005aaa:
	link.w	a6,#$0000
	movem.l	a0-a2,-(a7)
	movea.l	($0008,a6),a0
	movea.l	($007e,a0),a1
	tst.l	(a1)
	beq	L005af0
	pea.l	(L005ea0,pc)
	bsr	L005de8
	addq.l	#4,a7
L005ac8:
	tst.l	(a1)+
	beq	L005af0
	movea.l	(a1)+,a2
	move.l	($0004,a2),-(a7)
	bsr	L005d5c
	pea.l	(L006098,pc)
	bsr	L005de8
	clr.l	-(a7)
	move.l	(a2),-(a7)
	bsr	L005cf8
	bsr	L005dde
	lea.l	($0010,a7),a7
	bra	L005ac8

L005af0:
	movem.l	(a7)+,a0-a2
	unlk	a6
	rts

L005af8:
	link.w	a6,#$0000
	movem.l	a0-a3,-(a7)
	movea.l	($0008,a6),a0
	movea.l	($007a,a0),a1
	tst.l	(a1)
	beq	L005b96
	pea.l	(L005edc,pc)
	bsr	L005de8
	addq.l	#4,a7
L005b18:
	tst.l	(a1)+
	beq	L005b96
	movea.l	(a1)+,a2
	cmpi.w	#$00fc,($000a,a2)
	beq	L005b18
	cmpi.w	#$00fd,($000a,a2)
	beq	L005b18
	cmpi.w	#$00fe,($000a,a2)
	beq	L005b18
	move.l	($0004,a2),-(a7)
	bsr	L005d5c
	move.w	($000a,a2),d0
	move.l	($000c,a2),d1
	cmp.w	#$0004,d0
	bls	L005b52
	add.l	#$00008000,d1
L005b52:
	move.l	d1,-(a7)
	bsr	L005d9e
	bsr	L005dd4
	addq.l	#8,a7
	move.w	($000a,a2),d0
	cmpi.w	#$000a,d0
	bls	L005b6a
	moveq.l	#$00,d0
L005b6a:
	add.w	d0,d0
	move.w	(L005b80,pc,d0.w),d0
	pea.l	(L005b80,pc,d0.w)
	bsr	L005de8
	addq.l	#4,a7
	bsr	L005dde
	bra	L005b18

L005b80:
	.dc.w	$04aa,$04b4,$04be,$04c8,$04d2,$04dc,$04e6,$04f0
	.dc.w	$04fa,$0504,$050e
L005b96:
	movem.l	(a7)+,a0-a3
	unlk	a6
	rts

L005b9e:
	link.w	a6,#$0000
	movem.l	d1-d2/a0-a2,-(a7)
	movea.l	($0008,a6),a0
	movea.l	($007a,a0),a1
	tst.l	(a1)
	beq	L005be8
	moveq.l	#$00,d1
L005bb4:
	tst.l	(a1)
	beq	L005be8
	movea.l	(a1)+,a2
	cmpi.w	#$00fe,($000a,a2)
	bne	L005bb4
	tst.w	d1
	bne	L005bd2
	pea.l	(L005f18,pc)
	bsr	L005de8
	addq.l	#4,a7
	moveq.l	#$ff,d1
L005bd2:
	move.l	($0004,a2),-(a7)
	move.l	($0010,a2),-(a7)
	move.l	($000c,a2),-(a7)
	bsr	L005ca0
	lea.l	($000c,a7),a7
	bra	L005bb4

L005be8:
	movem.l	(a7)+,d1-d2/a0-a2
	unlk	a6
	rts

L005bf0:
	link.w	a6,#$0000
	movem.l	d1-d2/a0-a2,-(a7)
	movea.l	($0008,a6),a0
	movea.l	($007a,a0),a1
	tst.l	(a1)
	beq	L005c40
	moveq.l	#$00,d1
L005c06:
	tst.l	(a1)
	beq	L005c40
	movea.l	(a1)+,a2
	cmpi.w	#$00fd,($000a,a2)
	bne	L005c06
	tst.w	d1
	bne	L005c24
	pea.l	(L005f54,pc)
	bsr	L005de8
	addq.l	#4,a7
	moveq.l	#$ff,d1
L005c24:
	move.l	($0004,a2),-(a7)
	move.l	($0010,a2),-(a7)
	move.l	($000c,a2),d0
	add.l	#$00008000,d0
	move.l	d0,-(a7)
	bsr	L005ca0
	lea.l	($000c,a7),a7
	bra	L005c06

L005c40:
	movem.l	(a7)+,d1-d2/a0-a2
	unlk	a6
	rts

L005c48:
	link.w	a6,#$0000
	movem.l	d1-d2/a0-a2,-(a7)
	movea.l	($0008,a6),a0
	movea.l	($007a,a0),a1
	tst.l	(a1)
	beq	L005c98
	moveq.l	#$00,d1
L005c5e:
	tst.l	(a1)
	beq	L005c98
	movea.l	(a1)+,a2
	cmpi.w	#$00fc,($000a,a2)
	bne	L005c5e
	tst.w	d1
	bne	L005c7c
	pea.l	(L005f90,pc)
	bsr	L005de8
	addq.l	#4,a7
	moveq.l	#$ff,d1
L005c7c:
	move.l	($0004,a2),-(a7)
	move.l	($0010,a2),-(a7)
	move.l	($000c,a2),d0
	add.l	#$00008000,d0
	move.l	d0,-(a7)
	bsr	L005ca0
	lea.l	($000c,a7),a7
	bra	L005c5e

L005c98:
	movem.l	(a7)+,d1-d2/a0-a2
	unlk	a6
	rts

L005ca0:
	link.w	a6,#$0000
	move.l	($0010,a6),-(a7)
	bsr	L005d5c
	addq.l	#4,a7
	tst.l	($000c,a6)
	beq	L005cf0
	move.l	($0008,a6),-(a7)
	bsr	L005d9e
	pea.l	(L00609c,pc)
	bsr	L005de8
	move.l	($0008,a6),d0
	add.l	($000c,a6),d0
	subq.l	#1,d0
	move.l	d0,-(a7)
	bsr	L005d9e
	pea.l	(L0060a0,pc)
	bsr	L005de8
	move.l	($000c,a6),-(a7)
	bsr	L005d9e
	pea.l	(L0060a3,pc)
	bsr	L005de8
	lea.l	($0014,a7),a7
L005cf0:
	bsr	L005dde
	unlk	a6
	rts

L005cf8:
	link.w	a6,#-$0100
	movem.l	a0-a2,-(a7)
	movea.l	($0008,a6),a0
	move.l	($000c,a6),d0
	movea.l	($0008,a0),a1
	lea.l	(-$0100,a6),a2
	addq.w	#1,d0
L005d12:
	subq.w	#1,d0
	move.b	(a1)+,(a2)+
	bne	L005d12
	subq.l	#1,a2
	tst.l	($0004,a0)
	beq	L005d2a
L005d20:
	move.b	#$09,(a2)+
	subq.w	#8,d0
	bgt	L005d20
	clr.b	(a2)
L005d2a:
	pea.l	(-$0100,a6)
	bsr	L005de8
	addq.l	#4,a7
	tst.l	($0004,a0)
	beq	L005d54
	pea.l	(L0060a5,pc)
	bsr	L005de8
	move.l	($0004,a0),(a7)
	bsr	L005de8
	pea.l	(L0060a3,pc)
	bsr	L005de8
	addq.l	#8,a7
L005d54:
	movem.l	(a7)+,a0-a2
	unlk	a6
	rts

L005d5c:
	link.w	a6,#-$0100
	movem.l	a0-a1,-(a7)
	movea.l	($0008,a6),a0
	lea.l	(-$0100,a6),a1
	move.w	#$0019,d0
L005d70:
	subq.w	#1,d0
	move.b	(a0)+,(a1)+
	bne	L005d70
	subq.l	#1,a1
L005d78:
	move.b	#$09,(a1)+
	subq.w	#8,d0
	bgt	L005d78
	move.b	#$20,(a1)+		;' '
	move.b	#$3a,(a1)+		;':'
	move.b	#$20,(a1)+		;' '
	clr.b	(a1)
	pea.l	(-$0100,a6)
	bsr	L005de8
	addq.l	#4,a7
	movem.l	(a7)+,a0-a1
	unlk	a6
	rts

L005d9e:
	link.w	a6,#-$0010
	movem.l	d1-d2/a0-a1,-(a7)
	lea.l	(-$0010,a6),a0
	lea.l	(L000cc4,pc),a1
	move.l	($0008,a6),d1
	moveq.l	#$07,d0
L005db4:
	rol.l	#4,d1
	moveq.l	#$0f,d2
	and.w	d1,d2
	move.b	(a1,d2.w),(a0)+
	dbra	d0,L005db4
	clr.b	(a0)
	pea.l	(-$0010,a6)
	bsr	L005de8
	addq.l	#4,a7
	movem.l	(a7)+,d1-d2/a0-a1
	unlk	a6
	rts

L005dd4:
	pea.l	(L0060a7,pc)
	bsr	L005de8
	addq.l	#4,a7
	rts

L005dde:
	pea.l	(L005e62,pc)
	bsr	L005de8
	addq.l	#4,a7
	rts

L005de8:
	link.w	a6,#$0000
	movem.l	d1/a0,-(a7)
	tst.w	d5
	bmi	L005e0e
	movea.l	($0008,a6),a0
	move.l	(End+$0005c4,pc),d1
L005dfc:
	move.b	(a0)+,d0
	beq	L005e0e
	move.b	d0,(a4)+
	addq.l	#1,d6
	cmp.l	d6,d1
	bne	L005dfc
	bsr	L005e16
	tst.w	d5
	beq	L005dfc
L005e0e:
	movem.l	(a7)+,d1/a0
	unlk	a6
	rts

L005e16:
	movea.l	(End+$0005c8,pc),a4
	move.l	d6,-(a7)
	move.l	a4,-(a7)
	move.w	d7,-(a7)
	DOS	_WRITE
	addq.l	#6,a7
	cmp.l	(a7)+,d0
	beq	L005e2a
	moveq.l	#$ff,d5
L005e2a:
	moveq.l	#$00,d6
	rts

L005e2e:
	.dc.b	'Can',$27,'t open file : ',$00
L005e41:
	.dc.b	'Device full : ',$00
L005e50:
	.dc.b	'Making map file...'
L005e62:
	.dc.b	$0a,$00
L005e64:
	.dc.b	'==========================================================',$0a,$00
L005ea0:
	.dc.b	'-------------------------- xref --------------------------',$0a,$00
L005edc:
	.dc.b	'-------------------------- xdef --------------------------',$0a,$00
L005f18:
	.dc.b	'-------------------------- comm --------------------------',$0a,$00
L005f54:
	.dc.b	'-------------------------- rcomm -------------------------',$0a,$00
L005f90:
	.dc.b	'-------------------------- rlcomm ------------------------',$0a,$00
L005fcc:
	.dc.b	'align',$00
L005fd2:
	.dc.b	'text',$00
L005fd7:
	.dc.b	'data',$00
L005fdc:
	.dc.b	'bss',$00
L005fe0:
	.dc.b	'common',$00
L005fe7:
	.dc.b	'stack',$00
L005fed:
	.dc.b	'rdata',$00
L005ff3:
	.dc.b	'rbss',$00
L005ff8:
	.dc.b	'rcommon',$00
L006000:
	.dc.b	'rstack',$00
L006007:
	.dc.b	'rldata',$00
L00600e:
	.dc.b	'rlbss',$00
L006014:
	.dc.b	'rlcommon',$00
L00601d:
	.dc.b	'rlstack',$00
L006025:
	.dc.b	'exec',$00
L00602a:
	.dc.b	'(abs    )',$00
L006034:
	.dc.b	'(text   )',$00
L00603e:
	.dc.b	'(data   )',$00
L006048:
	.dc.b	'(bss    )',$00
L006052:
	.dc.b	'(stack  )',$00
L00605c:
	.dc.b	'(rdata  )',$00
L006066:
	.dc.b	'(rbss   )',$00
L006070:
	.dc.b	'(rstack )',$00
L00607a:
	.dc.b	'(rldata )',$00
L006084:
	.dc.b	'(rlbss  )',$00
L00608e:
	.dc.b	'(rlstack)',$00
L006098:
	bvs	L006108
	move.l	d0,d0
L00609c:
	move.l	($2000,a5),d0
L0060a0:
	.dc.b	$20,$28,$00
L0060a3:
	.dc.b	$29
L0060a4:
	.dc.b	$00
L0060a5:
	.dc.b	$28,$00
L0060a7:
	.dc.b	$20,$00,$00
L0060aa:
	link.w	a6,#-$000c
	movem.l	d1-d6/a0-a3,-(a7)
	moveq.l	#$00,d6
	lea.l	(End+$00006c,pc),a2
	move.l	(a2),d0
	beq	L0060ee
L0060bc:
	movea.l	d0,a2
	movea.l	(a2),a1
	move.w	#$0001,d5
	movea.l	($0010,a1),a0
	move.w	(a0),d0
	beq	L0060e8
L0060cc:
	move.w	d0,d1
	bsr	L0014a4
	bmi	L0005e6
	add.w	d0,d0
	lea.l	(L0062fe,pc),a3
	move.w	(a3,d0.w),d0
	jsr	(a3,d0.w)
	move.w	(a0),d0
	bne	L0060cc
L0060e8:
	addq.w	#4,a2
	move.l	(a2),d0
	bne	L0060bc
L0060ee:
	lea.l	(End+$000054,pc),a0
	move.l	d6,(a0)
	movem.l	(a7)+,d1-d6/a0-a3
	unlk	a6
	rts

L0060fc:
	tst.l	($0002,a0)
	bne	L0005e6
	addq.l	#6,a0
L006106:
	.dc.b	$c2,$bc
L006108:
	ori.b	#$ff,d0
	move.l	d1,d5
	rts

L006110:
	addq.l	#2,a0
L006112:
	addq.l	#2,a0
L006114:
	addq.l	#2,a0
L006116:
	addq.l	#4,a0
	cmp.w	#$0005,d5
	beq	L006124
	cmp.w	#$0008,d5
	bne	L006126
L006124:
	addq.l	#4,d6
L006126:
	rts

L006128:
	addq.l	#2,a0
	move.w	(a0)+,d0
	addq.l	#4,a0
	cmp.w	#$0005,d5
	beq	L00613a
	cmp.w	#$0008,d5
	bne	L00614c
L00613a:
	bsr	L0036c6
	cmp.w	#$0004,d0
	bls	L00614c
	cmp.w	#$00fe,d0
	beq	L00614c
	addq.l	#4,d6
L00614c:
	rts

L00614e:
	addq.l	#2,a0
	move.w	(a0)+,d0
	cmp.w	#$0005,d5
	beq	L00615e
	cmp.w	#$0008,d5
	bne	L006170
L00615e:
	bsr	L0036c6
	cmp.w	#$0004,d0
	bls	L006170
	cmp.w	#$00fe,d0
	beq	L006170
	addq.l	#4,d6
L006170:
	rts

L006172:
	addq.l	#2,a0
	move.w	(a0)+,d0
	bsr	L0036c6
	tst.w	d0
	beq	L006194
	cmp.w	#$0004,d0
	bls	L006190
	cmp.w	#$00fe,d0
	beq	L006190
	move.w	#$0002,d0
	bra	L006194

L006190:
	move.w	#$0001,d0
L006194:
	movea.l	(End+$000090,pc),a3
	cmpa.l	(End+$00008c,pc),a3
	beq	L0037f2
	move.l	d1,-(a3)
	move.w	d0,-(a3)
	lea.l	(End+$000090,pc),a3
	subq.l	#6,(a3)
	rts

L0061ac:
	addq.l	#2,a0
	move.l	(a0)+,d1
	movea.l	(End+$000090,pc),a3
	cmpa.l	(End+$00008c,pc),a3
	beq	L0037f2
	move.l	d1,-(a3)
	move.w	#$0000,-(a3)
	lea.l	(End+$000090,pc),a3
	subq.l	#6,(a3)
	rts

L0061ca:
	addq.l	#2,a0
	move.l	(a0)+,d1
	movea.l	(End+$000090,pc),a3
	cmpa.l	(End+$00008c,pc),a3
	beq	L0037f2
	move.l	d1,-(a3)
	move.w	#$0001,-(a3)
	lea.l	(End+$000090,pc),a3
	subq.l	#6,(a3)
	rts

L0061e8:
	addq.l	#2,a0
	move.l	(a0)+,d1
	movea.l	(End+$000090,pc),a3
	cmpa.l	(End+$00008c,pc),a3
	beq	L0037f2
	move.l	d1,-(a3)
	move.w	#$0002,-(a3)
	lea.l	(End+$000090,pc),a3
	subq.l	#6,(a3)
	rts

L006206:
	addq.l	#2,a0
	movea.l	(End+$000090,pc),a3
	cmpa.l	(End+$000088,pc),a3
	beq	L0037f8
	lea.l	(End+$000090,pc),a3
	addq.l	#6,(a3)
	rts

L00621c:
	addq.l	#2,a0
	movea.l	(End+$000090,pc),a3
	cmpa.l	(End+$000088,pc),a3
	beq	L0037f8
	move.w	(a3)+,d0
	move.l	(a3)+,d1
	cmp.w	#$0002,d0
	bne	L00623c
	cmp.w	#$0004,d5
	bls	L00623c
	addq.l	#4,d6
L00623c:
	lea.l	(End+$000090,pc),a3
	addq.l	#6,(a3)
	rts

L006244:
	addq.l	#2,a0
	movea.l	(End+$000090,pc),a3
	cmpa.l	(End+$000088,pc),a3
	beq	L006272
	move.w	(a3)+,d2
	move.l	(a3)+,d0
	rts

L006256:
	addq.l	#2,a0
	movea.l	(End+$000090,pc),a3
	cmpa.l	(End+$000088,pc),a3
	beq	L006272
	move.w	(a3)+,d2
	move.l	(a3)+,d0
	cmpa.l	(End+$000088,pc),a3
	beq	L006272
	move.w	(a3)+,d3
	move.l	(a3)+,d1
	rts

L006272:
	addq.l	#4,a7
	bra	L0037f8

L006278:
	tst.w	d2
	ble	L00627e
	moveq.l	#$ff,d2
L00627e:
	rts

L006280:
	moveq.l	#$00,d4
	tst.w	d2
	beq	L00628a
	moveq.l	#$ff,d4
	bra	L006290

L00628a:
	tst.w	d3
	beq	L006290
	moveq.l	#$ff,d4
L006290:
	rts

L006292:
	bsr	L006244
	bsr	L006278
	move.l	d0,-(a3)
	move.w	d2,-(a3)
	rts

L00629c:
	bsr	L006256
	bsr	L006280
	move.l	d1,-(a3)
	move.w	d4,-(a3)
	lea.l	(End+$000090,pc),a3
	addq.l	#6,(a3)
	rts

L0062ac:
	bsr	L006256
	tst.w	d2
	beq	L0062c8
	bgt	L0062b8
	moveq.l	#$ff,d4
	bra	L0062cc

L0062b8:
	tst.w	d3
	bge	L0062c0
	moveq.l	#$ff,d4
	bra	L0062cc

L0062c0:
	cmp.w	d2,d3
	beq	L0062c8
	moveq.l	#$ff,d4
	bra	L0062cc

L0062c8:
	move.w	d3,d4
	eor.w	d2,d4
L0062cc:
	move.l	d1,-(a3)
	move.w	d4,-(a3)
	lea.l	(End+$000090,pc),a3
	addq.l	#6,(a3)
	rts

L0062d8:
	bsr	L006256
	tst.w	d2
	beq	L0062ee
	bgt	L0062e6
	moveq.l	#$ff,d4
	bra	L0062f2

L0062e6:
	tst.w	d3
	beq	L0062ee
	moveq.l	#$ff,d4
	bra	L0062f2

L0062ee:
	move.w	d3,d4
	eor.w	d2,d4
L0062f2:
	move.l	d1,-(a3)
	move.w	d4,-(a3)
	lea.l	(End+$000090,pc),a3
	addq.l	#6,(a3)
	rts

L0062fe:
	.dc.w	L0060e8-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0060fc-L0062fe
	.dc.w	L0060fc-L0062fe
	.dc.w	L0060fc-L0062fe
	.dc.w	L0060fc-L0062fe
	.dc.w	L0060fc-L0062fe
	.dc.w	L0060fc-L0062fe
	.dc.w	L0060fc-L0062fe
	.dc.w	L0060fc-L0062fe
	.dc.w	L0060fc-L0062fe
	.dc.w	L0060fc-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L006116-L0062fe
	.dc.w	L006116-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L00614e-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L006114-L0062fe
	.dc.w	L006114-L0062fe
	.dc.w	L006114-L0062fe
	.dc.w	L006114-L0062fe
	.dc.w	L006114-L0062fe
	.dc.w	L006114-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0005e6-L0062fe
	.dc.w	L0005e6-L0062fe
	.dc.w	L0005e6-L0062fe
	.dc.w	L0005e6-L0062fe
	.dc.w	L0005e6-L0062fe
	.dc.w	L006116-L0062fe
	.dc.w	L006116-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L00614e-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L006114-L0062fe
	.dc.w	L006114-L0062fe
	.dc.w	L006114-L0062fe
	.dc.w	L006114-L0062fe
	.dc.w	L006114-L0062fe
	.dc.w	L006114-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0005e6-L0062fe
	.dc.w	L0005e6-L0062fe
	.dc.w	L0005e6-L0062fe
	.dc.w	L0005e6-L0062fe
	.dc.w	L0005e6-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L006112-L0062fe
	.dc.w	L006112-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L006128-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L006110-L0062fe
	.dc.w	L006110-L0062fe
	.dc.w	L006110-L0062fe
	.dc.w	L006110-L0062fe
	.dc.w	L006110-L0062fe
	.dc.w	L006110-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0005e6-L0062fe
	.dc.w	L0005e6-L0062fe
	.dc.w	L0005e6-L0062fe
	.dc.w	L0005e6-L0062fe
	.dc.w	L0005e6-L0062fe
	.dc.w	L006112-L0062fe
	.dc.w	L006112-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L006128-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L006110-L0062fe
	.dc.w	L006110-L0062fe
	.dc.w	L006110-L0062fe
	.dc.w	L006110-L0062fe
	.dc.w	L006110-L0062fe
	.dc.w	L006110-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0005e6-L0062fe
	.dc.w	L0005e6-L0062fe
	.dc.w	L0005e6-L0062fe
	.dc.w	L0005e6-L0062fe
	.dc.w	L0005e6-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L006172-L0062fe
	.dc.w	L006172-L0062fe
	.dc.w	L006172-L0062fe
	.dc.w	L006172-L0062fe
	.dc.w	L0061ac-L0062fe
	.dc.w	L0061ca-L0062fe
	.dc.w	L0061ca-L0062fe
	.dc.w	L0061ca-L0062fe
	.dc.w	L0061ca-L0062fe
	.dc.w	L0061e8-L0062fe
	.dc.w	L0061e8-L0062fe
	.dc.w	L0061e8-L0062fe
	.dc.w	L0061e8-L0062fe
	.dc.w	L0061e8-L0062fe
	.dc.w	L0061e8-L0062fe
	.dc.w	L006206-L0062fe
	.dc.w	L006206-L0062fe
	.dc.w	L00621c-L0062fe
	.dc.w	L006206-L0062fe
	.dc.w	L00621c-L0062fe
	.dc.w	L006206-L0062fe
	.dc.w	L006292-L0062fe
	.dc.w	L006292-L0062fe
	.dc.w	L006292-L0062fe
	.dc.w	L006292-L0062fe
	.dc.w	L006292-L0062fe
	.dc.w	L006292-L0062fe
	.dc.w	L006292-L0062fe
	.dc.w	L0005e6-L0062fe
	.dc.w	L00629c-L0062fe
	.dc.w	L00629c-L0062fe
	.dc.w	L00629c-L0062fe
	.dc.w	L00629c-L0062fe
	.dc.w	L00629c-L0062fe
	.dc.w	L00629c-L0062fe
	.dc.w	L0062ac-L0062fe
	.dc.w	L0062d8-L0062fe
	.dc.w	L00629c-L0062fe
	.dc.w	L00629c-L0062fe
	.dc.w	L00629c-L0062fe
	.dc.w	L00629c-L0062fe
	.dc.w	L00629c-L0062fe
	.dc.w	L00629c-L0062fe
	.dc.w	L00629c-L0062fe
	.dc.w	L00629c-L0062fe
	.dc.w	L00629c-L0062fe
	.dc.w	L00629c-L0062fe
	.dc.w	L00629c-L0062fe
	.dc.w	L00629c-L0062fe
	.dc.w	L00629c-L0062fe
	.dc.w	L0005e6-L0062fe
	.dc.w	L0005e6-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0005e6-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0005e6-L0062fe
	.dc.w	L0005e6-L0062fe
	.dc.w	L0005e6-L0062fe
	.dc.w	L0005e6-L0062fe
	.dc.w	L0005e6-L0062fe
	.dc.w	L0005e6-L0062fe
	.dc.w	L0005e6-L0062fe
	.dc.w	L0005e6-L0062fe
	.dc.w	L0005e6-L0062fe
	.dc.w	L0005e6-L0062fe
	.dc.w	L0014ec-L0062fe
	.dc.w	L0014ec-L0062fe
L00657c:
	link.w	a6,#-$01c0
	movem.l	d1-d4/a3-a4,-(a7)
	pea.l	(-$0180,a6)
	pea.l	(a0)
	DOS	_NAMECK
	addq.l	#8,a7
	tst.l	d0
	bne	L006766
	move.b	(-$012a,a6),d1
	movea.l	a0,a1
L00659a:
	tst.b	(a1)+
	bne	L00659a
	cmpi.b	#$2e,(-$0002,a1)	;'.'
	bne	L0065a8
	st.b	d1
L0065a8:
	lea.l	(End+$000074,pc),a3
	clr.b	(-$0100,a6)
L0065b0:
	pea.l	(a0)
	pea.l	(-$0100,a6)
	bsr	L006876
	addq.l	#8,a7
	tst.b	d1
	bne	L0065ce
	pea.l	(L006804,pc)
	pea.l	(-$0100,a6)
	bsr	L006876
	addq.l	#8,a7
L0065ce:
	move.w	#$0020,-(a7)		;' '
	pea.l	(-$0100,a6)
	pea.l	(-$01c0,a6)
	DOS	_FILES
	addq.l	#6,a7
	move.l	d0,(a7)+
	beq	L0065fa
	move.l	(a3),d0
	beq	L006766
	movea.l	d0,a3
	pea.l	($0004,a3)
	pea.l	(-$0100,a6)
	bsr	L006860
	addq.l	#8,a7
	bra	L0065b0

L0065fa:
	pea.l	(-$0100,a6)
	pea.l	(-$0080,a6)
	bsr	L006860
	addq.l	#8,a7
	pea.l	(-$0180,a6)
	pea.l	(-$0100,a6)
	DOS	_NAMECK
	addq.l	#8,a7
	pea.l	(-$0180,a6)
	pea.l	(-$0100,a6)
	bsr	L006860
	addq.l	#8,a7
	pea.l	(-$013d,a6)
	pea.l	(-$0100,a6)
	bsr	L006876
	addq.l	#8,a7
	pea.l	(-$012a,a6)
	pea.l	(-$0100,a6)
	bsr	L006876
	addq.l	#8,a7
	pea.l	(-$0100,a6)
	bsr	L0067bc
	addq.l	#4,a7
	moveq.l	#$ff,d4
	move.l	(End+$000064,pc),d0
	beq	L00667a
L006650:
	movea.l	d0,a4
	move.l	($0004,a4),d0
	beq	L006660
	cmp.l	d0,d4
	beq	L006674
	move.l	d0,d4
	bra	L006662

L006660:
	moveq.l	#$ff,d4
L006662:
	move.l	(a4),-(a7)
	pea.l	(-$0100,a6)
	bsr	L0068a8
	addq.l	#8,a7
	tst.l	d0
	beq	L0067b8
L006674:
	move.l	($008a,a4),d0
	bne	L006650
L00667a:
	lea.l	(End+$00007c,pc),a1
	lea.l	(End+$000084,pc),a2
	moveq.l	#$00,d1
	move.w	d1,-(a7)
	pea.l	(-$0100,a6)
	DOS	_OPEN
	addq.l	#6,a7
	move.l	d0,d3
	bmi	L006780
	move.w	#$0002,-(a7)
	move.l	d1,-(a7)
	move.w	d3,-(a7)
	DOS	_SEEK
	move.l	d0,d2
	move.l	d0,d7
	move.w	d1,($0006,a7)
	DOS	_SEEK
	addq.l	#8,a7
	btst.l	#$00,d2
	bne	L00677a
	moveq.l	#$20,d0			;' '
	cmp.l	d0,d2
	bcs	L00677a
	moveq.l	#$10,d0
	add.l	d0,d2
	sub.l	d2,(a2)
	bmi	L00054e
	movea.l	(a1),a3
	add.l	d2,(a1)
	sub.l	d0,d2
	move.l	d2,-(a7)
	pea.l	(a3)
	move.w	d3,-(a7)
	DOS	_READ
	lea.l	($000a,a7),a7
	cmp.l	d0,d2
	bne	L006780
	move.w	d3,-(a7)
	DOS	_CLOSE
	addq.l	#2,a7
	tst.l	d0
	bmi	L006780
	move.l	d1,(a3,d2.l)
	cmpi.w	#$d000,(a3)
	beq	L00670a
	cmpi.w	#$0068,(a3)		;'h'
	beq	L00670a
	cmpi.w	#$d100,(a3)
	bne	L006798
	moveq.l	#$02,d0
	cmp.l	($0002,a3),d0
	bne	L006798
L00670a:
	move.l	a3,d1
	pea.l	(-$0080,a6)
	bsr	L006892
	addq.l	#4,a7
	addq.l	#8,d0
	andi.w	#$fffe,d0
	sub.l	d0,(a2)
	bmi	L00054e
	movea.l	(a1),a0
	add.l	d0,(a1)
	pea.l	(-$0080,a6)
	pea.l	(a0)
	bsr	L006860
	addq.l	#8,a7
	pea.l	(-$0100,a6)
	bsr	L006892
	addq.l	#4,a7
	addq.l	#8,d0
	andi.w	#$fffe,d0
	sub.l	d0,(a2)
	bmi	L00054e
	movea.l	(a1),a3
	add.l	d0,(a1)
	pea.l	(-$0100,a6)
	pea.l	(a3)
	bsr	L006860
	addq.l	#8,a7
	movea.l	a3,a1
	movea.l	d1,a2
	moveq.l	#$00,d0
L00675e:
	movem.l	(a7)+,d1-d4/a3-a4
	unlk	a6
	rts

L006766:
	pea.l	(L006807,pc)
	DOS	_PRINT
	pea.l	(a0)
	DOS	_PRINT
	addq.l	#8,a7
	bsr	L000c82
	moveq.l	#$ff,d0
	bra	L00675e

L00677a:
	pea.l	(L006814,pc)
	bra	L006784

L006780:
	pea.l	(L006829,pc)
L006784:
	DOS	_PRINT
	pea.l	(-$0100,a6)
	DOS	_PRINT
	addq.l	#8,a7
	bsr	L000c82
	move.w	#$0001,-(a7)
	DOS	_EXIT2

L006798:
	add.l	#$00000010,d2
	add.l	d2,(a2)
	sub.l	d2,(a1)
	pea.l	(L00683b,pc)
	DOS	_PRINT
	pea.l	(-$0100,a6)
	DOS	_PRINT
	addq.l	#8,a7
	bsr	L000c82
	moveq.l	#$fe,d0
	bra	L00675e

L0067b8:
	moveq.l	#$01,d0
	bra	L00675e

L0067bc:
	movem.l	d0/a0-a1,-(a7)
	movea.l	($0010,a7),a0
	lea.l	(a0),a1
L0067c6:
	move.b	(a0)+,d0
	move.b	d0,(a1)+
	beq	L0067de
	bpl	L0067e4
	cmpi.b	#$a0,d0
	bcs	L0067da
	cmpi.b	#$e0,d0
	bcs	L0067e4
L0067da:
	move.b	(a0)+,(a1)+
	bne	L0067c6
L0067de:
	movem.l	(a7)+,d0/a0-a1
	rts

L0067e4:
	bsr	L0067f8
	bne	L0067c6
	move.b	(End+$0005dc,pc),(-$0001,a1)
L0067ee:
	move.b	(a0)+,d0
	bsr	L0067f8
	beq	L0067ee
	subq.l	#1,a0
	bra	L0067c6

L0067f8:
	cmpi.b	#$5c,d0			;'\'
	beq	L006802
	cmpi.b	#$2f,d0			;'/'
L006802:
	rts

L006804:
	.dc.b	$2e,$6f,$00
L006807:
	.dc.b	'Not found : ',$00
L006814:
	.dc.b	'Illegal file size : ',$00
L006829:
	.dc.b	'File I/O error : ',$00
L00683b:
	.dc.b	'Not obj, arc file : ',$00
L006850:
	.dc.b	'Already read : ',$00
L006860:
	movem.l	a0-a1,-(a7)
	movem.l	($000c,a7),a0-a1
	move.l	a0,d0
L00686c:
	move.b	(a1)+,(a0)+
	bne	L00686c
	movem.l	(a7)+,a0-a1
	rts

L006876:
	movem.l	a0-a1,-(a7)
	movem.l	($000c,a7),a0-a1
	move.l	a0,d0
L006882:
	tst.b	(a0)+
	bne	L006882
	subq.l	#1,a0
L006888:
	move.b	(a1)+,(a0)+
	bne	L006888
	movem.l	(a7)+,a0-a1
	rts

L006892:
	move.l	a0,-(a7)
	movea.l	($0008,a7),a0
	move.l	a0,d0
L00689a:
	tst.b	(a0)+
	bne	L00689a
	subq.l	#1,a0
	suba.l	d0,a0
	move.l	a0,d0
	movea.l	(a7)+,a0
	rts

L0068a8:
	movem.l	d1/a0-a1,-(a7)
	movem.l	($0010,a7),a0-a1
L0068b2:
	move.b	(a1)+,d1
	beq	L0068c8
	move.b	(a0)+,d0
	beq	L0068c4
	cmp.b	d0,d1
	beq	L0068b2
	bhi	L0068c4
L0068c0:
	moveq.l	#$01,d0
	bra	L0068ce

L0068c4:
	moveq.l	#$ff,d0
	bra	L0068ce

L0068c8:
	cmp.b	(a0),d1
	bcs	L0068c0
	moveq.l	#$00,d0
L0068ce:
	movem.l	(a7)+,d1/a0-a1
	rts

End:

	.end	Start
