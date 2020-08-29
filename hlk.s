;=============================================
;  Filename hlk.r
;
;
;  Base address 000000
;  Exec address 000000
;  Text size    0068d4 byte(s)
;  Data size    000000 byte(s)
;  Bss  size    000000 byte(s)
;  1281 Labels
;
;  Commandline dis  -b2 -h -m68000 --sp -q1 -B -M -o120 -ghlk.lab --overwrite hlk.r hlk.s
;          DIS version 3.16
;=============================================

	.include	inc/doscall.mac
	.include	inc/iocscall.mac
	.include	inc/fefunc.mac

	.cpu	68000

	.text

L000000:
	bra.s	L00000a

L000002:
	.dc.b	'#HUPAIR',$00
L00000a:
	lea.l	($0010,a0),a0
	suba.l	a0,a1
	adda.l	#$000085e0,a1
	move.l	a1,-(sp)
	move.l	a0,-(sp)
	DOS	_SETBLOCK
	addq.l	#8,sp
	tst.l	d0
	bmi.w	L00054e
	lea.l	(a0,a1.l),sp
	lea.l	(L0068d4,pc),a6
	lea.l	(a6),a1
	moveq.l	#$00,d0
	move.w	#$0177,d1
L000034:
	move.l	d0,(a1)+
	dbra.w	d1,L000034
	move.l	(L000000-$00003c,pc),d0
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
	clr.l	-(sp)
	pea.l	(L00125d,pc)
	DOS	_GETENV
	addq.l	#8,sp
	move.l	d0,(sp)+
	bmi.s	L000084
	cmpi.w	#$2f00,($019c,a6)
	bne.s	L000084
	moveq.l	#$2f,d1			;'/'
L000084:
	move.b	d1,($05dc,a6)
	pea.l	($4004)
	DOS	_MALLOC
	move.l	d0,(sp)+
	bmi.w	L00054e
	move.l	d0,d2
	bsr.w	L0005c8
	tst.l	d0
	bmi.w	L00054e
	move.l	d0,-(sp)
	move.l	d2,-(sp)
	move.l	d1,-(sp)
	pea.l	($1000)
	bsr.w	L001366
	lea.l	($0010,sp),sp
	pea.l	($019c,a6)
	clr.l	-(sp)
	pea.l	(L001259,pc)
	DOS	_GETENV
	addq.l	#8,sp
	move.l	d0,(sp)+
	bmi.s	L0000d2
	pea.l	($019c,a6)
	bsr.w	L0013a2
	move.l	d0,(sp)+
	bmi.w	L000554
L0000d2:
	pea.l	($0001,a2)
	bsr.w	L0013a2
	move.l	d0,(sp)+
	bmi.w	L000554
	beq.w	L00056e
	move.l	($05a8,a6),d0
	st.b	d0
	addq.l	#1,d0
	move.l	d0,-(sp)
	move.l	($05ac,a6),-(sp)
	DOS	_SETBLOCK
	addq.l	#8,sp
	bsr.w	L001e26
	bsr.w	L0005c8
	tst.l	d0
	bmi.w	L00054e
	move.l	d0,d2
	add.l	d1,d2
	moveq.l	#$60,d3			;'`'
	sub.l	d3,d1
	bmi.w	L00054e
	add.l	d3,d0
	move.l	d0,($008c,a6)
	move.l	#$00001800,d3
	sub.l	d3,d1
	bmi.w	L00054e
	add.l	d3,d0
	move.l	d0,($0088,a6)
	move.l	d0,($0090,a6)
	moveq.l	#$60,d3			;'`'
	sub.l	d3,d1
	bmi.w	L00054e
	add.l	d3,d0
	move.l	d0,($007c,a6)
	move.l	d2,($0080,a6)
	move.l	d1,($0084,a6)
	bsr.w	L000632
	tst.w	($05cc,a6)
	bne.w	L000452
	movea.l	($007c,a6),a5
	move.l	($0084,a6),d7
	bsr.w	L000ade
	bsr.w	L000b20
	bsr.w	L000b08
	bsr.w	L000b64
	move.l	a5,($007c,a6)
	move.l	d7,($0084,a6)
	move.l	($05bc,a6),d7
	beq.s	L000186
	lea.l	(L001278,pc),a0
	movea.l	a0,a1
	movea.l	d7,a2
	sub.l	($007c,a6),d7
	neg.l	d7
	bsr.w	L00282c
L000186:
	tst.b	($05d0,a6)
	beq.s	L000198
	move.w	#$0002,-(sp)
	pea.l	(L000cd8,pc)
	DOS	_FPUTS
	addq.l	#6,sp
L000198:
	movea.l	($05a0,a6),a1
	tst.l	(a1)
	beq.w	L00056e
L0001a2:
	move.l	(a1)+,d1
	beq.s	L0001bc
	movea.l	d1,a0
	cmpi.b	#$2b,(a0)+		;'+'
	bne.s	L0001a2
	bsr.w	L002832
	tst.l	d0
	ble.s	L0001a2
	bsr.w	L00053e
	bra.s	L0001a2

L0001bc:
	movea.l	($05a0,a6),a1
	tst.l	(a1)
	beq.w	L00056e
L0001c6:
	move.l	(a1)+,d1
	beq.s	L0001e0
	movea.l	d1,a0
	cmpi.b	#$2b,(a0)		;'+'
	beq.s	L0001c6
	bsr.w	L002832
	tst.l	d0
	ble.s	L0001c6
	bsr.w	L00053e
	bra.s	L0001c6

L0001e0:
	tst.w	($05cc,a6)
	bne.w	L000452
	move.l	($0064,a6),d0
	beq.w	L000452
	tst.l	($05bc,a6)
	beq.s	L000200
	movea.l	d0,a0
	tst.l	($008a,a0)
	beq.w	L000452
L000200:
	move.l	($0064,a6),d0
L000204:
	movea.l	d0,a0
	tst.l	($0004,a0)
	bne.s	L000210
	bsr.w	L00298c
L000210:
	move.l	($008a,a0),d0
	bne.s	L000204
	move.l	($006c,a6),d0
	beq.w	L00056e
	movea.l	d0,a1
	movea.l	(a1),a0
	move.l	($05bc,a6),d0
	cmp.l	($0010,a0),d0
	bne.s	L000234
	tst.l	($0004,a1)
	beq.w	L00056e
L000234:
	bsr.w	L000b84
	bsr.w	L000c12
	move.l	($006c,a6),d0
L000240:
	movea.l	d0,a1
	movea.l	(a1),a0
	bsr.w	L0029e8
	move.l	($0004,a1),d0
	bne.s	L000240
	move.l	($006c,a6),d0
L000252:
	movea.l	d0,a1
	movea.l	(a1),a0
	bsr.w	L00217e
	bsr.w	L002a12
	move.l	($0004,a1),d0
	bne.s	L000252
	tst.w	($05cc,a6)
	bne.w	L000452
	move.l	($0040,a6),d0
	add.l	($0044,a6),d0
	tst.b	($05d7,a6)
	bne.s	L00028a
	tst.w	($05ce,a6)
	bne.w	L000562
	tst.l	d0
	bne.w	L000562
	bra.s	L000304

L00028a:
	move.l	($0040,a6),d6
	tst.b	($05ce,a6)
	bne.s	L00029c
	tst.l	d6
	bne.w	L000568
	bra.s	L00029e

L00029c:
	addq.l	#8,d6
L00029e:
	move.l	($0044,a6),d7
	tst.b	($05cf,a6)
	bne.s	L0002b0
	tst.l	d7
	bne.w	L000568
	bra.s	L0002b2

L0002b0:
	addq.l	#8,d7
L0002b2:
	movea.l	($05bc,a6),a4
	move.l	($001e,a4),d1
	movea.l	($0048,a6),a1
	move.l	d1,(a1)
	move.l	d1,($0048,a6)
	lea.l	(L001334,pc),a0
	bsr.w	L002402
	movea.l	d0,a0
	move.l	d1,($000c,a0)
	add.l	d6,d1
	movea.l	($004c,a6),a1
	move.l	d1,(a1)
	move.l	d1,($004c,a6)
	lea.l	(L00134a,pc),a0
	bsr.w	L002402
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
	beq.s	L0003c8
	move.l	($0018,a6),d1
	add.l	($001c,a6),d1
	add.l	($0020,a6),d1
	add.l	($0024,a6),d1
	add.l	($0028,a6),d1
	add.l	($002c,a6),d1
	add.l	($0030,a6),d1
	add.l	($0034,a6),d1
	lea.l	(L001318,pc),a0
	bsr.w	L002402
	movea.l	d0,a0
	move.l	d1,($000c,a0)
L0003c8:
	move.l	($006c,a6),d0
L0003cc:
	movea.l	d0,a1
	movea.l	(a1),a0
	bsr.w	L002566
	move.l	($0004,a1),d0
	bne.s	L0003cc
	tst.w	($05cc,a6)
	bne.s	L000452
	bsr.w	L0060aa
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
	bsr.w	L002450
	move.l	($0004,a1),d0
	bne.s	L00042c
	tst.w	($05cc,a6)
	beq.s	L000444
	bsr.w	L000c82
L000444:
	bsr.w	L002ad0
	tst.b	($05d5,a6)
	beq.s	L000452
	bsr.w	L00570c
L000452:
	move.w	($05cc,a6),-(sp)
	DOS	_EXIT2

L000458:
	move.l	d0,d2
	move.l	($006c,a6),d1
	beq.s	L00046c
L000460:
	movea.l	d1,a1
	movea.l	(a1),a0
	jsr	(a4)
	move.l	($0004,a1),d1
	bne.s	L000460
L00046c:
	move.l	d0,d1
	sub.l	d2,d1
	rts

L000472:
	tst.b	($0097,a0)
	beq.s	L00047c
	bsr.w	L00052c
L00047c:
	move.l	d0,($004e,a0)
	add.l	($0026,a0),d0
	rts

L000486:
	tst.b	($0098,a0)
	beq.s	L000490
	bsr.w	L00052c
L000490:
	move.l	d0,($0052,a0)
	add.l	($002a,a0),d0
	rts

L00049a:
	tst.b	($0099,a0)
	beq.s	L0004a4
	bsr.w	L00052c
L0004a4:
	move.l	d0,($0056,a0)
	add.l	($002e,a0),d0
	rts

L0004ae:
	tst.b	($009a,a0)
	beq.s	L0004b6
	bsr.s	L00052c
L0004b6:
	move.l	d0,($005a,a0)
	add.l	($0032,a0),d0
	rts

L0004c0:
	tst.b	($009b,a0)
	beq.s	L0004c8
	bsr.s	L00052c
L0004c8:
	move.l	d0,($005e,a0)
	add.l	($0036,a0),d0
	rts

L0004d2:
	tst.b	($009c,a0)
	beq.s	L0004da
	bsr.s	L00052c
L0004da:
	move.l	d0,($0062,a0)
	add.l	($003a,a0),d0
	rts

L0004e4:
	tst.b	($009d,a0)
	beq.s	L0004ec
	bsr.s	L00052c
L0004ec:
	move.l	d0,($0066,a0)
	add.l	($003e,a0),d0
	rts

L0004f6:
	tst.b	($009e,a0)
	beq.s	L0004fe
	bsr.s	L00052c
L0004fe:
	move.l	d0,($006a,a0)
	add.l	($0042,a0),d0
	rts

L000508:
	tst.b	($009f,a0)
	beq.s	L000510
	bsr.s	L00052c
L000510:
	move.l	d0,($006e,a0)
	add.l	($0046,a0),d0
	rts

L00051a:
	tst.b	($00a0,a0)
	beq.s	L000522
	bsr.s	L00052c
L000522:
	move.l	d0,($0072,a0)
	add.l	($004a,a0),d0
	rts

L00052c:
	move.l	d1,-(sp)
	move.l	($008e,a0),d1
	subq.l	#1,d1
	add.l	d1,d0
	not.l	d1
	and.l	d1,d0
	move.l	(sp)+,d1
	rts

L00053e:
	pea.l	(L0011d4,pc)
	DOS	_PRINT
	move.l	d1,-(sp)
	DOS	_PRINT
	addq.l	#8,sp
	bra.w	L000c82

L00054e:
	pea.l	(L00115b,pc)
	bra.s	L000558

L000554:
	pea.l	(L0010b9,pc)
L000558:
	DOS	_PRINT
	addq.l	#4,sp
L00055c:
	move.w	#$0001,-(sp)
	DOS	_EXIT2

L000562:
	pea.l	(L001201,pc)
	bra.s	L000558

L000568:
	pea.l	(L001229,pc)
	bra.s	L000558

L00056e:
	tst.b	($05d0,a6)
	bne.s	L00057c
	pea.l	(L000cd8,pc)
	DOS	_PRINT
	addq.l	#4,sp
L00057c:
	pea.l	(L000d26,pc)
	bra.s	L000558

L000582:
	pea.l	(L000cd8,pc)
	DOS	_PRINT
	pea.l	(L000d26,pc)
	DOS	_PRINT
	addq.l	#8,sp
	bra.w	L000452

L000594:
	lea.l	(L000cf5,pc),a0
	move.b	#$0a,(a0)+
	clr.b	(a0)
	pea.l	(L000cd8,pc)
	DOS	_PRINT
	addq.l	#4,sp
	bra.w	L000452

L0005aa:
	pea.l	(L0010cd,pc)
	DOS	_PRINT
	addq.l	#4,sp
	move.l	a0,d0
	pea.l	(L000000,pc)
	sub.l	(sp)+,d0
	bsr.w	L000ca2
	bsr.w	L000c82
	pea.l	(L0010e2,pc)
	bra.s	L000558

L0005c8:
	pea.l	($00ffff00)
	DOS	_MALLOC
	move.l	(sp)+,d1
	tst.l	d0
	beq.s	L0005e0
	and.l	d0,d1
	beq.s	L0005e2
	move.l	d1,-(sp)
	DOS	_MALLOC
	addq.l	#4,sp
L0005e0:
	rts

L0005e2:
	moveq.l	#$ff,d0
	rts

L0005e6:
	pea.l	(L0011e4,pc)
	DOS	_PRINT
	addq.l	#4,sp
	move.w	(a0),d0
	bsr.w	L000c96
	pea.l	(L0011f7,pc)
	DOS	_PRINT
	addq.l	#4,sp
	move.l	a0,d0
	sub.l	($0010,a1),d0
	bsr.w	L000ca2
	bsr.w	L000c82
	pea.l	(L0011fc,pc)
	DOS	_PRINT
	move.l	($0008,a1),-(sp)
	DOS	_PRINT
	addq.l	#8,sp
	move.l	($0004,a1),d1
	beq.s	L00062a
	pea.l	(L0011fc,pc)
	DOS	_PRINT
	move.l	d1,-(sp)
	DOS	_PRINT
	addq.l	#8,sp
L00062a:
	bsr.w	L000c82
	bra.w	L00055c

L000632:
	movem.l	d1-d2/d7/a0-a5,-(sp)
	movea.l	($007c,a6),a5
	move.l	($0084,a6),d7
	movea.l	($05a0,a6),a1
L000642:
	move.l	(a1)+,d0
	beq.w	L000768
	movea.l	d0,a2
	cmpi.b	#$2d,(a2)+		;'-'
	bne.s	L000642
	subq.l	#4,a1
	movea.l	a1,a4
L000654:
	move.l	($0004,a4),(a4)+
	bne.s	L000654
	subq.l	#1,($059c,a6)
	move.b	(a2)+,d0
	beq.w	L000710
	cmpi.b	#$2d,d0			;'-'
	beq.s	L0006dc
	bra.s	L000670

L00066c:
	move.b	(a2)+,d0
	beq.s	L000642
L000670:
	cmpi.b	#$3f,d0			;'?'
	beq.w	L000582
	cmpi.b	#$30,d0			;'0'
	beq.w	L0008fc
	cmpi.b	#$31,d0			;'1'
	beq.w	L000904
	cmpi.b	#$4c,d0			;'L'
	beq.w	L0008a0
	andi.w	#$00df,d0
	subi.b	#$41,d0			;'A'
	cmpi.b	#$19,d0
	bhi.s	L000712
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
	beq.s	L000710
	move.w	(a4)+,d1
	pea.l	(L0006fe,pc,d0.w)
	pea.l	(a2)
	bsr.w	L0068a8
	addq.l	#8,sp
	bne.s	L0006e0
L0006f4:
	tst.b	(a2)+
	bne.s	L0006f4
	subq.l	#1,a2
	jmp	(L0006fe,pc,d1.w)

L0006fe:
	.dc.b	$09,$a0,$fe,$84,$09,$a5,$02,$0e
	.dc.b	$09,$ab,$02,$16,$09,$b3,$fe,$96
	.dc.b	$00,$00
L000710:
	subq.l	#1,a2
L000712:
	pea.l	(L001173,pc)
	DOS	_PRINT
	bsr.s	L00072a
L00071a:
	addq.l	#4,sp
	bsr.w	L000c82
	move.w	#$0001,($05cc,a6)
	bra.w	L000642

L00072a:
	move.l	a2,-(sp)
L00072c:
	cmpi.b	#$2d,-(a2)		;'-'
	bne.s	L00072c
	move.l	a2,-(sp)
	DOS	_PRINT
	addq.l	#4,sp
	movea.l	(sp)+,a2
	rts

L00073c:
	pea.l	(L001185,pc)
	DOS	_PRINT
	bsr.s	L00072a
	tst.b	(a2)
	bne.s	L00071a
	bsr.w	L000c78
	move.l	a3,(sp)
	DOS	_PRINT
	bra.s	L00071a

L000752:
	pea.l	(L001185,pc)
	DOS	_PRINT
	bsr.s	L00072a
	bra.s	L00071a

L00075c:
	pea.l	(L0011ae,pc)
	DOS	_PRINT
	addq.l	#4,sp
	bra.w	L00066c

L000768:
	move.l	a5,($007c,a6)
	move.l	d7,($0084,a6)
	movem.l	(sp)+,d1-d2/d7/a0-a5
	rts

L000776:
	bsr.w	L000a18
	beq.s	L000752
	clr.w	-(sp)
	pea.l	(a3)
	DOS	_OPEN
	addq.l	#6,sp
	move.l	d0,d1
	bmi.w	L000aca
	move.w	#$0002,-(sp)
	clr.l	-(sp)
	move.w	d1,-(sp)
	DOS	_SEEK
	move.l	d0,d2
	clr.w	($0006,sp)
	DOS	_SEEK
	addq.l	#8,sp
	or.l	d2,d0
	bmi.s	L0007de
	moveq.l	#$fe,d0
	and.l	d2,d0
	addq.l	#2,d0
	sub.l	d0,d7
	bmi.w	L00054e
	sub.l	d0,($0080,a6)
	movea.l	($0080,a6),a0
	move.l	d2,-(sp)
	pea.l	(a0)
	move.w	d1,-(sp)
	DOS	_READ
	addq.l	#6,sp
	cmp.l	(sp)+,d2
	bne.s	L0007de
	clr.b	(a0,d2.l)
	move.w	d1,-(sp)
	DOS	_CLOSE
	addq.l	#2,sp
	pea.l	(a0)
	bsr.w	L001444
	move.l	d0,(sp)+
	bmi.w	L000554
	bra.w	L000642

L0007de:
	move.w	d1,-(sp)
	DOS	_CLOSE
	addq.l	#2,sp
	bra.w	L000642

L0007e8:
	tst.b	(a2)
	bne.s	L000850
	lea.l	($019c,a6),a3
	pea.l	(a3)
	clr.l	-(sp)
	pea.l	(L001255,pc)
	DOS	_GETENV
	addq.l	#8,sp
	move.l	d0,(sp)+
	bmi.w	L00075c
	bsr.s	L000808
	bra.w	L00066c

L000808:
	pea.l	(a3)
	bsr.w	L006892
	addq.l	#4,sp
	tst.l	d0
	beq.s	L00084e
	addq.l	#7,d0
	andi.w	#$fffe,d0
	sub.l	d0,d7
	bmi.w	L00054e
	sub.l	d0,($0080,a6)
	movea.l	($0080,a6),a0
	pea.l	(a0)
	clr.l	(a0)+
L00082c:
	move.b	(a3)+,(a0)+
	bne.s	L00082c
	subq.l	#2,a0
	cmpi.b	#$3a,(a0)+		;':'
	beq.s	L00083e
	move.b	#$5c,(a0)+		;'\'
	clr.b	(a0)
L00083e:
	bsr.w	L0067bc
	movea.l	(sp)+,a0
	movea.l	($0078,a6),a3
	move.l	a0,(a3)
	move.l	a0,($0078,a6)
L00084e:
	rts

L000850:
	pea.l	(a2)
	bsr.w	L006892
	addq.l	#4,sp
	addq.l	#7,d0
	andi.w	#$fffe,d0
	sub.l	d0,d7
	bmi.w	L00054e
	sub.l	d0,($0080,a6)
	movea.l	($0080,a6),a0
	pea.l	(L001255,pc)
	pea.l	(a0)
	bsr.w	L006860
	addq.l	#8,sp
	pea.l	(a2)
	pea.l	(a0)
	bsr.w	L006876
	addq.l	#8,sp
	pea.l	(L001263,pc)
	pea.l	(a0)
	bsr.w	L006876
	addq.l	#8,sp
	lea.l	(a1),a2
L000890:
	tst.l	(a2)+
	bne.s	L000890
	clr.l	(a2)
	move.l	a0,-(a2)
	subq.l	#1,($059c,a6)
	bra.w	L000642

L0008a0:
	bsr.w	L000a18
	beq.w	L000752
	bsr.w	L000808
	bra.w	L000642

L0008b0:
	bsr.w	L000a18
	beq.w	L000752
	bsr.w	L000a3a
	bmi.w	L00073c
	bra.w	L000642

L0008c4:
	bsr.w	L000a18
	beq.w	L000752
	moveq.l	#$5f,d0			;'_'
	movea.l	a3,a4
	lea.l	($009c,a6),a0
L0008d4:
	move.b	(a4)+,(a0)+
	dbeq.w	d0,L0008d4
	beq.w	L000642
	bra.w	L00073c

L0008e2:
	st.b	($05d5,a6)
	moveq.l	#$5f,d0			;'_'
	lea.l	(a2),a4
	lea.l	($011c,a6),a0
L0008ee:
	move.b	(a4)+,(a0)+
	dbeq.w	d0,L0008ee
	beq.w	L000642
	bra.w	L000752

L0008fc:
	sf.b	($05d7,a6)
	bra.w	L00066c

L000904:
	st.b	($05d7,a6)
	bra.w	L00066c

L00090c:
	sf.b	($05d1,a6)
	bra.w	L00066c

L000914:
	st.b	($05d1,a6)
	bra.w	L00066c

L00091c:
	st.b	($05d2,a6)
	bra.w	L00066c

L000924:
	st.b	($05d3,a6)
	bra.w	L00066c

L00092c:
	st.b	($05d0,a6)
	bra.w	L00066c

L000934:
	lea.l	($05d8,a6),a4
	bra.s	L00093e

L00093a:
	lea.l	($05da,a6),a4
L00093e:
	st.b	(a4)+
	moveq.l	#$20,d0			;' '
	or.b	(a2)+,d0
	cmpi.b	#$6e,d0			;'n'
	seq.b	(a4)
	beq.s	L00094e
	subq.l	#1,a2
L00094e:
	bra.w	L00066c

L000952:
	bsr.w	L000a18
	beq.w	L000752
	bsr.w	L000a3a
	bmi.w	L00073c
	move.l	d0,d1
	subq.l	#2,d1
	cmpi.l	#$000000fe,d1
	bhi.w	L00073c
	move.l	d0,d1
L000972:
	lsr.l	#1,d1
	bcc.s	L000972
	bne.w	L00073c
	lea.l	(L000cd4,pc),a4
	move.l	d0,(a4)
	bra.w	L000642

L000984:
	st.b	($05d6,a6)
	bra.w	L00066c

L00098c:
	bsr.w	L000a18
	beq.w	L000752
	bsr.w	L000a3a
	bmi.w	L00073c
	move.l	d0,($0098,a6)
	bra.w	L000642

L0009a4:
	bsr.s	L000a18
	beq.w	L000752
	bsr.w	L000a3a
	bmi.w	L00073c
	moveq.l	#$02,d1
	cmp.l	d1,d0
	bhi.w	L00073c
	move.b	d0,($05d4,a6)
	bra.w	L000642

L0009c2:
	bsr.s	L000a18
	beq.w	L000752
	bsr.w	L000b4c
	subq.l	#6,d7
	bmi.w	L00054e
	move.w	#$b200,(a5)+
	lea.l	(a5),a0
	clr.l	(a5)+
	movea.l	a3,a4
L0009dc:
	move.b	(a4)+,d1
	beq.s	L0009f0
	cmpi.b	#$3d,d1			;'='
	beq.s	L0009f0
	subq.l	#1,d7
	bmi.w	L00054e
	move.b	d1,(a5)+
	bra.s	L0009dc

L0009f0:
	move.w	a5,d0
	ori.w	#$0001,d0
	sub.w	a5,d0
L0009f8:
	subq.l	#1,d7
	bmi.w	L00054e
	clr.b	(a5)+
	dbra.w	d0,L0009f8
	tst.b	d1
	beq.w	L00073c
	movea.l	a4,a3
	bsr.s	L000a3a
	bmi.w	L00073c
	move.l	d0,(a0)
	bra.w	L000642

L000a18:
	movea.l	a2,a3
	tst.b	(a2)
	bne.s	L000a38
	move.l	(a1),d0
	beq.s	L000a38
	movea.l	d0,a3
	cmpi.b	#$2d,(a3)		;'-'
	beq.s	L000a38
	movea.l	a1,a4
L000a2c:
	move.l	($0004,a4),(a4)+
	bne.s	L000a2c
	subq.l	#1,($059c,a6)
	moveq.l	#$01,d0
L000a38:
	rts

L000a3a:
	movem.l	d1/a4,-(sp)
	moveq.l	#$00,d0
	moveq.l	#$00,d1
	movea.l	a3,a4
	move.b	(a4)+,d1
	beq.s	L000a8c
	cmpi.b	#$24,d1			;'$'
	beq.s	L000a98
	cmpi.b	#$39,d1			;'9'
	bhi.s	L000a8c
	cmpi.b	#$30,d1			;'0'
	bcs.s	L000a8c
	bhi.s	L000a68
	moveq.l	#$20,d1			;' '
	or.b	(a4)+,d1
	cmpi.b	#$78,d1			;'x'
	beq.s	L000a98
	subq.l	#1,a4
L000a68:
	subq.l	#1,a4
L000a6a:
	move.b	(a4)+,d1
	beq.s	L000a90
	subi.b	#$30,d1			;'0'
	cmpi.b	#$09,d1
	bhi.s	L000a8c
	cmpi.l	#$19999999,d0
	bhi.s	L000a8c
	add.l	d0,d0
	move.l	d0,-(sp)
	lsl.l	#2,d0
	add.l	(sp)+,d0
	add.l	d1,d0
	bcc.s	L000a6a
L000a8c:
	moveq.l	#$ff,d1
	bra.s	L000a92

L000a90:
	moveq.l	#$00,d1
L000a92:
	movem.l	(sp)+,d1/a4
	rts

L000a98:
	move.b	(a4)+,d1
	beq.s	L000a8c
L000a9c:
	cmpi.b	#$39,d1			;'9'
	bls.s	L000aae
	andi.b	#$df,d1
	cmpi.b	#$41,d1			;'A'
	bcs.s	L000a8c
	subq.b	#7,d1
L000aae:
	subi.b	#$30,d1			;'0'
	cmpi.b	#$0f,d1
	bhi.s	L000a8c
	cmpi.l	#$0fffffff,d0
	bhi.s	L000a8c
	lsl.l	#4,d0
	or.b	d1,d0
	move.b	(a4)+,d1
	bne.s	L000a9c
	bra.s	L000a90

L000aca:
	pea.l	(L001193,pc)
	DOS	_PRINT
	pea.l	(a3)
	DOS	_PRINT
	addq.l	#8,sp
	bsr.w	L000c82
	bra.w	L00055c

L000ade:
	tst.b	($05d7,a6)
	beq.s	L000b06
	bsr.s	L000b4c
	pea.l	($0002,a5)
	move.l	(sp)+,($0048,a6)
	moveq.l	#$16,d0
	lea.l	(L00132e,pc),a4
	bsr.s	L000b74
	pea.l	($0002,a5)
	move.l	(sp)+,($004c,a6)
	moveq.l	#$16,d0
	lea.l	(L001344,pc),a4
	bsr.s	L000b74
L000b06:
	rts

L000b08:
	tst.b	($05d7,a6)
	beq.s	L000b1e
	pea.l	($0008,a5)
	move.l	(sp)+,($05c0,a6)
	moveq.l	#$0c,d0
	lea.l	(L00135a,pc),a4
	bsr.s	L000b74
L000b1e:
	rts

L000b20:
	tst.b	($05d6,a6)
	beq.s	L000b4a
	bsr.s	L000b4c
	moveq.l	#$14,d0
	lea.l	(L0012fe,pc),a4
	bsr.s	L000b74
	moveq.l	#$10,d0
	lea.l	(L001312,pc),a4
	bsr.s	L000b74
	moveq.l	#$0c,d0
	lea.l	(L001322,pc),a4
	bsr.s	L000b74
	moveq.l	#$40,d0			;'@'
	movea.l	($05bc,a6),a4
	add.l	d0,($001e,a4)
L000b4a:
	rts

L000b4c:
	tst.l	($05bc,a6)
	bne.s	L000b62
	move.l	a5,($05bc,a6)
	move.l	#$0000008c,d0
	lea.l	(L001272,pc),a4
	bsr.s	L000b74
L000b62:
	rts

L000b64:
	tst.l	($05bc,a6)
	beq.s	L000b72
	subq.l	#2,d7
	bmi.w	L00054e
	clr.w	(a5)+
L000b72:
	rts

L000b74:
	sub.l	d0,d7
	bmi.w	L00054e
	subq.l	#1,d0
L000b7c:
	move.b	(a4)+,(a5)+
	dbra.w	d0,L000b7c
	rts

L000b84:
	movem.l	d1/a0-a3,-(sp)
	lea.l	($009c,a6),a0
	movea.l	a0,a2
	move.b	(a0),d1
	bne.s	L000bac
	movea.l	($006c,a6),a1
	movea.l	(a1),a0
	move.l	($05bc,a6),d0
	cmp.l	($0010,a0),d0
	bne.s	L000ba8
	movea.l	($0004,a1),a1
	movea.l	(a1),a0
L000ba8:
	movea.l	($0008,a0),a0
L000bac:
	lea.l	($019c,a6),a3
	pea.l	(a3)
	pea.l	(a0)
	DOS	_NAMECK
	addq.l	#8,sp
	pea.l	(a3)
	pea.l	(a2)
	bsr.w	L006860
	addq.l	#8,sp
	pea.l	($0043,a3)
	pea.l	(a2)
	bsr.w	L006876
	addq.l	#8,sp
	pea.l	(a2)
	bsr.w	L0067bc
	addq.l	#4,sp
	tst.b	d1
	beq.s	L000be2
	lea.l	($0056,a3),a0
	tst.b	(a0)
	bne.s	L000bfe
L000be2:
	lea.l	(L001266,pc),a0
	tst.b	($05da,a6)
	bne.s	L000bfe
	addq.l	#3,a0
	tst.b	d1
	bne.s	L000bf8
	tst.b	($05d9,a6)
	bne.s	L000bfe
L000bf8:
	tst.b	($05d8,a6)
	bne.s	L000c0c
L000bfe:
	pea.l	(a0)
	pea.l	(a2)
	bsr.w	L006876
	addq.l	#8,sp
	neg.b	($05d9,a6)
L000c0c:
	movem.l	(sp)+,d1/a0-a3
	rts

L000c12:
	movem.l	d1/a0-a2,-(sp)
	tst.b	($05d5,a6)
	beq.s	L000c72
	lea.l	($011c,a6),a0
	lea.l	(a0),a1
	lea.l	($019c,a6),a2
	move.b	(a0),d1
	bne.s	L000c2e
	lea.l	($009c,a6),a1
L000c2e:
	pea.l	(a2)
	pea.l	(a1)
	DOS	_NAMECK
	addq.l	#8,sp
	tst.l	d0
	bmi.s	L000c72
	pea.l	(a2)
	pea.l	(a0)
	bsr.w	L006860
	addq.l	#8,sp
	pea.l	($0043,a2)
	pea.l	(a0)
	bsr.w	L006876
	addq.l	#8,sp
	pea.l	(a0)
	bsr.w	L0067bc
	addq.l	#4,sp
	tst.b	d1
	beq.s	L000c64
	lea.l	($0056,a2),a2
	tst.b	(a2)
	bne.s	L000c68
L000c64:
	lea.l	(L00126c,pc),a2
L000c68:
	pea.l	(a2)
	pea.l	(a0)
	bsr.w	L006876
	addq.l	#8,sp
L000c72:
	movem.l	(sp)+,d1/a0-a2
	rts

L000c78:
	move.w	#$0020,-(sp)		;' '
	DOS	_PUTCHAR
	addq.l	#2,sp
	rts

L000c82:
	pea.l	(L001253,pc)
	DOS	_PRINT
	addq.l	#4,sp
	rts

L000c8c:
	movem.l	d1-d2/a0,-(sp)
	moveq.l	#$01,d2
	ror.l	#8,d0
	bra.s	L000ca8

L000c96:
	movem.l	d1-d2/a0,-(sp)
	move.w	#$0003,d2
	swap.w	d0
	bra.s	L000ca8

L000ca2:
	movem.l	d1-d2/a0,-(sp)
	moveq.l	#$07,d2
L000ca8:
	move.l	d0,d1
L000caa:
	rol.l	#4,d1
	moveq.l	#$0f,d0
	and.w	d1,d0
	move.b	(L000cc4,pc,d0.w),d0
	move.w	d0,-(sp)
	DOS	_PUTCHAR
	addq.l	#2,sp
	dbra.w	d2,L000caa
	movem.l	(sp)+,d1-d2/a0
	rts

L000cc4:
	.dc.b	$30,$31,$32,$33,$34,$35,$36,$37
	.dc.b	$38,$39,$61,$62,$63,$64,$65,$66
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
	.dc.b	$c0,$01,$00,$00,$00,$00,$74,$65
	.dc.b	$78,$74,$00,$00,$c0,$02,$00,$00
	.dc.b	$00,$00,$64,$61,$74,$61,$00,$00
	.dc.b	$c0,$03,$00,$00,$00,$00,$62,$73
	.dc.b	$73,$00,$c0,$04,$00,$00,$00,$00
	.dc.b	$73,$74,$61,$63,$6b,$00,$c0,$05
	.dc.b	$00,$00,$00,$00,$72,$64,$61,$74
	.dc.b	$61,$00,$c0,$06,$00,$00,$00,$00
	.dc.b	$72,$62,$73,$73,$00,$00,$c0,$07
	.dc.b	$00,$00,$00,$00,$72,$73,$74,$61
	.dc.b	$63,$6b,$00,$00,$c0,$08,$00,$00
	.dc.b	$00,$00,$72,$6c,$64,$61,$74,$61
	.dc.b	$00,$00,$c0,$09,$00,$00,$00,$00
	.dc.b	$72,$6c,$62,$73,$73,$00,$c0,$0a
	.dc.b	$00,$00,$00,$00,$72,$6c,$73,$74
	.dc.b	$61,$63,$6b,$00
L0012fe:
	.dc.b	$b2,$02,$00,$00,$00,$00,$5f,$5f
	.dc.b	$5f,$73,$69,$7a,$65,$5f,$69,$6e
	.dc.b	$66,$6f,$00,$00
L001312:
	.dc.b	$b2,$00,$00,$00,$00,$00
L001318:
	.dc.b	'___rsize',$00,$00
L001322:
	.dc.b	$20,$02,$00,$00,$00,$00,$30,$00
	.dc.b	$00,$00,$00,$40
L00132e:
	.dc.b	$b2,$02,$00,$00,$00,$00
L001334:
	.dc.b	'___CTOR_LIST__',$00,$00
L001344:
	.dc.b	$b2,$02,$00,$00,$00,$00
L00134a:
	.dc.b	'___DTOR_LIST__',$00,$00
L00135a:
	.dc.b	$20,$02,$00,$00,$00,$00,$30,$00
	.dc.b	$00,$00,$00,$00
L001366:
	link.w	a6,#$0000
	movem.l	d1-d3/a0,-(sp)
	movem.l	($0008,a6),d0-d3
	lea.l	(L0068d4,pc),a0
	move.l	d0,($05a4,a0)
	move.l	d1,($05b0,a0)
	move.l	d2,($05a0,a0)
	move.l	d3,($05b4,a0)
	move.l	d3,($05ac,a0)
	clr.l	($059c,a0)
	clr.l	($05a8,a0)
	movea.l	($05a0,a0),a0
	clr.l	(a0)
	movem.l	(sp)+,d1-d3/a0
	unlk	a6
	rts

L0013a2:
	link.w	a6,#$0000
	movem.l	d1-d4/a0-a4,-(sp)
	movea.l	($0008,a6),a0
	lea.l	(L0068d4,pc),a4
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
	bls.s	L001440
L0013d8:
	move.b	(a0)+,d0
	beq.s	L001420
	cmpi.b	#$20,d0			;' '
	beq.s	L0013d8
L0013e2:
	tst.b	d4
	beq.s	L0013ee
	cmp.b	d4,d0
	bne.s	L001400
L0013ea:
	eor.b	d0,d4
	bra.s	L00140a

L0013ee:
	cmp.b	#$22,d0			;'"'
	beq.s	L0013ea
	cmp.b	#$27,d0			;'''
	beq.s	L0013ea
	cmp.b	#$20,d0			;' '
	beq.s	L00140e
L001400:
	subq.l	#1,d2
	beq.s	L001440
	addq.l	#1,d3
	move.b	d0,(a2)+
	beq.s	L00140e
L00140a:
	move.b	(a0)+,d0
	bra.s	L0013e2

L00140e:
	subq.l	#1,d2
	beq.s	L001440
	addq.l	#1,d3
	clr.b	(a2)+
	move.l	a4,(a1)+
	addq.l	#1,d1
	subq.l	#1,(a3)
	tst.b	d0
	bne.s	L0013d2
L001420:
	clr.l	(a1)
	lea.l	(L0068d4,pc),a0
	move.l	d1,($059c,a0)
	move.l	d2,($05b0,a0)
	move.l	a2,($05b4,a0)
	move.l	d3,($05a8,a0)
	move.l	d1,d0
L001438:
	movem.l	(sp)+,d1-d4/a0-a4
	unlk	a6
	rts

L001440:
	moveq.l	#$ff,d0
	bra.s	L001438

L001444:
	movem.l	a0-a1/a6,-(sp)
	lea.l	(L0068d4,pc),a6
	movea.l	($0010,sp),a0
	move.l	($059c,a6),d0
	movea.l	($05a0,a6),a1
	lsl.l	#2,d0
	adda.l	d0,a1
L00145c:
	move.b	(a0)+,d0
	beq.s	L001494
	cmpi.b	#$1a,d0
	beq.s	L001494
	cmpi.b	#$20,d0			;' '
	bls.s	L00145c
	tst.l	($05a4,a6)
	ble.s	L0014a0
	subq.l	#1,a0
	subq.l	#1,($05a4,a6)
	addq.l	#1,($059c,a6)
	move.l	a0,(a1)+
L00147e:
	move.b	(a0)+,d0
	cmpi.b	#$20,d0			;' '
	bhi.s	L00147e
	clr.b	(-$0001,a0)
	tst.b	d0
	beq.s	L001494
	cmpi.b	#$1a,d0
	bne.s	L00145c
L001494:
	clr.l	(a1)
	move.l	($059c,a6),d0
L00149a:
	movem.l	(sp)+,a0-a1/a6
	rts

L0014a0:
	moveq.l	#$ff,d0
	bra.s	L00149a

L0014a4:
	movem.l	d1-d2/a0,-(sp)
	move.w	d0,d1
	beq.s	L0014e0
	lsr.w	#8,d1
	cmpi.b	#$10,d1
	beq.s	L0014e4
	add.w	d1,d1
	lea.l	(L001546,pc),a0
	move.w	(a0,d1.w),d1
	beq.s	L0014e8
	lea.l	(L001846,pc),a0
	move.b	d0,d2
	ext.w	d2
	add.w	d2,d2
	add.w	d1,d2
	cmp.w	(a0,d2.w),d0
	bne.s	L0014e8
	lsr.w	#1,d2
	moveq.l	#$00,d0
	move.w	d2,d0
L0014d8:
	movem.l	(sp)+,d1-d2/a0
	tst.l	d0
	rts

L0014e0:
	moveq.l	#$00,d0
	bra.s	L0014d8

L0014e4:
	moveq.l	#$01,d0
	bra.s	L0014d8

L0014e8:
	moveq.l	#$ff,d0
	bra.s	L0014d8

L0014ec:
	movem.l	d1/a1,-(sp)
	move.w	(a0)+,d0
	move.w	d0,d1
	bsr.s	L0014a4
	bmi.s	L00150e
	add.w	d0,d0
	lea.l	(L001ba8,pc),a1
	move.w	(a1,d0.w),d0
	jsr	(a1,d0.w)
	moveq.l	#$00,d0
L001508:
	movem.l	(sp)+,d1/a1
	rts

L00150e:
	subq.l	#2,a0
	moveq.l	#$ff,d0
	bra.s	L001508

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
	bra.s	L00153e

L001538:
	bra.s	L00153e

L00153a:
	tst.b	(a0)+
	beq.s	L001544
L00153e:
	tst.b	(a0)+
	bne.s	L00153a
	addq.l	#1,a0
L001544:
	rts

L001546:
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$02,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$18,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$22,$00,$40,$00,$5e,$00,$7c
	.dc.b	$00,$00,$00,$96,$00,$a8,$00,$c2
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$ca,$00,$cc,$00,$00,$00,$00
	.dc.b	$00,$d8,$00,$f6,$01,$14,$01,$32
	.dc.b	$00,$00,$01,$4c,$01,$5e,$01,$78
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$01,$80,$00,$00,$00,$00
	.dc.b	$00,$00,$01,$94,$00,$00,$01,$a8
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$01,$c6,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$01,$dc,$01,$de,$01,$e0,$01,$e2
	.dc.b	$00,$00,$00,$00,$01,$e4,$00,$00
	.dc.b	$00,$00,$01,$e6,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$01,$e6,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$02,$28,$00,$00,$02,$30,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$02,$44,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$02,$60,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$02,$62,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
L001846:
	.dc.b	$00,$00,$00,$00,$20,$01,$20,$02
	.dc.b	$20,$03,$20,$04,$20,$05,$20,$06
	.dc.b	$20,$07,$20,$08,$20,$09,$20,$0a
	.dc.b	$30,$00,$40,$fc,$40,$fd,$40,$fe
	.dc.b	$40,$ff,$40,$00,$40,$01,$40,$02
	.dc.b	$40,$03,$40,$04,$40,$05,$40,$06
	.dc.b	$40,$07,$40,$08,$40,$09,$40,$0a
	.dc.b	$41,$fc,$41,$fd,$41,$fe,$41,$ff
	.dc.b	$41,$00,$41,$01,$41,$02,$41,$03
	.dc.b	$41,$04,$41,$05,$41,$06,$41,$07
	.dc.b	$41,$08,$41,$09,$41,$0a,$42,$fc
	.dc.b	$42,$fd,$42,$fe,$42,$ff,$42,$00
	.dc.b	$42,$01,$42,$02,$42,$03,$42,$04
	.dc.b	$42,$05,$42,$06,$42,$07,$42,$08
	.dc.b	$42,$09,$42,$0a,$43,$fc,$43,$fd
	.dc.b	$43,$fe,$43,$ff,$43,$00,$43,$01
	.dc.b	$43,$02,$43,$03,$43,$04,$43,$05
	.dc.b	$43,$06,$43,$07,$43,$08,$43,$09
	.dc.b	$43,$0a,$45,$fe,$45,$ff,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$46,$fc,$46,$fd,$46,$fe,$46,$ff
	.dc.b	$46,$00,$46,$01,$46,$02,$46,$03
	.dc.b	$46,$04,$46,$05,$46,$06,$46,$07
	.dc.b	$46,$08,$46,$09,$46,$0a,$47,$fe
	.dc.b	$47,$ff,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$4c,$01,$4d,$01
	.dc.b	$50,$fc,$50,$fd,$50,$fe,$50,$ff
	.dc.b	$50,$00,$50,$01,$50,$02,$50,$03
	.dc.b	$50,$04,$50,$05,$50,$06,$50,$07
	.dc.b	$50,$08,$50,$09,$50,$0a,$51,$fc
	.dc.b	$51,$fd,$51,$fe,$51,$ff,$51,$00
	.dc.b	$51,$01,$51,$02,$51,$03,$51,$04
	.dc.b	$51,$05,$51,$06,$51,$07,$51,$08
	.dc.b	$51,$09,$51,$0a,$52,$fc,$52,$fd
	.dc.b	$52,$fe,$52,$ff,$52,$00,$52,$01
	.dc.b	$52,$02,$52,$03,$52,$04,$52,$05
	.dc.b	$52,$06,$52,$07,$52,$08,$52,$09
	.dc.b	$52,$0a,$53,$fc,$53,$fd,$53,$fe
	.dc.b	$53,$ff,$53,$00,$53,$01,$53,$02
	.dc.b	$53,$03,$53,$04,$53,$05,$53,$06
	.dc.b	$53,$07,$53,$08,$53,$09,$53,$0a
	.dc.b	$55,$fe,$55,$ff,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$56,$fc
	.dc.b	$56,$fd,$56,$fe,$56,$ff,$56,$00
	.dc.b	$56,$01,$56,$02,$56,$03,$56,$04
	.dc.b	$56,$05,$56,$06,$56,$07,$56,$08
	.dc.b	$56,$09,$56,$0a,$57,$fe,$57,$ff
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$65,$01,$65,$02,$65,$03
	.dc.b	$65,$04,$65,$05,$65,$06,$65,$07
	.dc.b	$65,$08,$65,$09,$65,$0a,$69,$01
	.dc.b	$69,$02,$69,$03,$69,$04,$69,$05
	.dc.b	$69,$06,$69,$07,$69,$08,$69,$09
	.dc.b	$69,$0a,$6b,$01,$6b,$02,$6b,$03
	.dc.b	$6b,$04,$6b,$05,$6b,$06,$6b,$07
	.dc.b	$6b,$08,$6b,$09,$6b,$0a,$80,$fc
	.dc.b	$80,$fd,$80,$fe,$80,$ff,$80,$00
	.dc.b	$80,$01,$80,$02,$80,$03,$80,$04
	.dc.b	$80,$05,$80,$06,$80,$07,$80,$08
	.dc.b	$80,$09,$80,$0a,$90,$00,$91,$00
	.dc.b	$92,$00,$93,$00,$96,$00,$99,$00
	.dc.b	$a0,$01,$a0,$02,$a0,$03,$a0,$04
	.dc.b	$a0,$05,$a0,$06,$a0,$07,$00,$00
	.dc.b	$a0,$09,$a0,$0a,$a0,$0b,$a0,$0c
	.dc.b	$a0,$0d,$a0,$0e,$a0,$0f,$a0,$10
	.dc.b	$a0,$11,$a0,$12,$a0,$13,$a0,$14
	.dc.b	$a0,$15,$a0,$16,$a0,$17,$a0,$18
	.dc.b	$a0,$19,$a0,$1a,$a0,$1b,$a0,$1c
	.dc.b	$a0,$1d,$00,$00,$00,$00,$b0,$ff
	.dc.b	$b2,$fc,$b2,$fd,$b2,$fe,$b2,$ff
	.dc.b	$b2,$00,$b2,$01,$b2,$02,$b2,$03
	.dc.b	$b2,$04,$b2,$05,$b2,$06,$b2,$07
	.dc.b	$b2,$08,$b2,$09,$b2,$0a,$c0,$01
	.dc.b	$c0,$02,$c0,$03,$c0,$04,$c0,$05
	.dc.b	$c0,$06,$c0,$07,$c0,$08,$c0,$09
	.dc.b	$c0,$0a,$00,$00,$c0,$0c,$c0,$0d
	.dc.b	$d0,$00,$e0,$00,$e0,$01,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$e0,$0c,$e0,$0d,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00
L001ba8:
	.dc.b	''
	.dc.b	''
	.dc.b	''
	.dc.b	''
	.dc.b	''
	.dc.b	''
L001e26:
	move.l	a0,-(sp)
	pea.l	($4000)
	DOS	_MALLOC
	move.l	d0,(sp)+
	bmi.w	L00054e
	lea.l	(L0068d4+$0005b8,pc),a0
	move.l	d0,(a0)
	movea.l	d0,a0
	move.w	#$0fff,d0
	moveq.l	#$00,d1
L001e42:
	move.l	d1,(a0)+
	dbra.w	d0,L001e42
	movea.l	(sp)+,a0
	rts

L001e4c:
	movem.l	d1-d3/a0-a6,-(sp)
	moveq.l	#$00,d2
	lea.l	(L0068d4+$00007c,pc),a2
	lea.l	(L0068d4+$000084,pc),a3
	lea.l	($0076,a1),a4
	subq.l	#4,(a3)
	bmi.w	L00054e
	movea.l	(a2),a5
	addq.l	#4,(a2)
	move.l	a5,($007a,a1)
	move.l	d2,(a5)
	bra.s	L001e74

L001e70:
	bsr.w	L00153e
L001e74:
	move.w	(a0),d1
	beq.w	L001f1e
	cmpi.w	#$b2ff,d1
	beq.w	L001f24
	cmpi.w	#$b0ff,d1
	beq.w	L001f24
	cmpi.w	#$b2fc,d1
	bcs.s	L001e98
	cmpi.w	#$b2fe,d1
	bls.w	L001f38
L001e98:
	cmpi.w	#$b200,d1
	bcs.s	L001ea6
	cmpi.w	#$b20a,d1
	bls.w	L001f46
L001ea6:
	cmpi.w	#$c001,d1
	bcs.s	L001ef6
	beq.w	L001fd4
	cmpi.w	#$c003,d1
	bcs.w	L001fea
	beq.w	L002000
	cmpi.w	#$c005,d1
	bcs.w	L002016
	beq.w	L00202c
	cmpi.w	#$c007,d1
	bcs.w	L002042
	beq.w	L002058
	cmpi.w	#$c009,d1
	bcs.w	L00206e
	beq.w	L002084
	cmpi.w	#$c00b,d1
	bcs.w	L00209a
	beq.s	L001ef6
	cmpi.w	#$c00d,d1
	bcs.w	L0020b0
	beq.w	L0020b8
L001ef6:
	cmpi.w	#$e001,d1
	beq.w	L0020de
	cmpi.w	#$e00c,d1
	beq.w	L0020ca
	cmpi.w	#$e00d,d1
	beq.w	L0020d4
	move.w	d1,d0
	bsr.w	L0014ec
	tst.l	d0
	bpl.w	L001e74
	bra.w	L0005e6

L001f1e:
	movem.l	(sp)+,d1-d3/a0-a6
	rts

L001f24:
	lea.l	($0082,a1),a6
	tst.l	(a6)
	bne.s	L001f2e
	move.l	a0,(a6)
L001f2e:
	move.l	a0,($0086,a1)
	addq.l	#6,a0
	bra.w	L001e70

L001f38:
	lea.l	($0082,a1),a6
	tst.l	(a6)
	bne.s	L001f42
	move.l	a0,(a6)
L001f42:
	move.l	a0,($0086,a1)
L001f46:
	cmpi.b	#$2a,($0006,a0)		;'*'
	beq.s	L001f78
	lea.l	($0096,a1),a6
	move.w	d1,d0
	ext.w	d0
	st.b	(a6,d0.w)
	exg.l	a0,a1
	bsr.w	L002342
	exg.l	a0,a1
	moveq.l	#$08,d3
	sub.l	d3,(a3)
	bmi.w	L00054e
	add.l	d3,(a2)
	move.l	a0,(a5)+
	move.l	d0,(a5)+
	move.l	d2,(a5)
	addq.l	#6,a0
	bra.w	L001e70

L001f78:
	move.l	($0002,a0),d0
	moveq.l	#$01,d1
	lsl.l	d0,d1
	move.l	d1,($008e,a1)
	subq.l	#2,d1
	cmpi.l	#$00000100,d1
	bhi.s	L001f94
L001f8e:
	addq.l	#6,a0
	bra.w	L001e70

L001f94:
	pea.l	(L0025b6,pc)
	DOS	_PRINT
	addq.l	#4,sp
	move.l	($008e,a1),d0
	bsr.w	L000ca2
	bsr.w	L000c82
	pea.l	(L00260e,pc)
	DOS	_PRINT
	move.l	($0008,a1),-(sp)
	DOS	_PRINT
	addq.l	#8,sp
	move.l	($0004,a1),d1
	beq.s	L001fc8
	pea.l	(L00260e,pc)
	DOS	_PRINT
	move.l	d1,-(sp)
	DOS	_PRINT
	addq.l	#8,sp
L001fc8:
	bsr.w	L000c82
	move.l	(L000cd4,pc),($008e,a1)
	bra.s	L001f8e

L001fd4:
	addq.l	#2,a0
	move.l	(a0)+,d0
	addq.l	#1,d0
	andi.w	#$fffe,d0
	move.l	d0,($0026,a1)
	sne.b	($0097,a1)
	bra.w	L001e70

L001fea:
	addq.l	#2,a0
	move.l	(a0)+,d0
	addq.l	#1,d0
	andi.w	#$fffe,d0
	move.l	d0,($002a,a1)
	sne.b	($0098,a1)
	bra.w	L001e70

L002000:
	addq.l	#2,a0
	move.l	(a0)+,d0
	addq.l	#1,d0
	andi.w	#$fffe,d0
	move.l	d0,($002e,a1)
	sne.b	($0099,a1)
	bra.w	L001e70

L002016:
	addq.l	#2,a0
	move.l	(a0)+,d0
	addq.l	#1,d0
	andi.w	#$fffe,d0
	move.l	d0,($0032,a1)
	sne.b	($009a,a1)
	bra.w	L001e70

L00202c:
	addq.l	#2,a0
	move.l	(a0)+,d0
	addq.l	#1,d0
	andi.w	#$fffe,d0
	move.l	d0,($0036,a1)
	sne.b	($009b,a1)
	bra.w	L001e70

L002042:
	addq.l	#2,a0
	move.l	(a0)+,d0
	addq.l	#1,d0
	andi.w	#$fffe,d0
	move.l	d0,($003a,a1)
	sne.b	($009c,a1)
	bra.w	L001e70

L002058:
	addq.l	#2,a0
	move.l	(a0)+,d0
	addq.l	#1,d0
	andi.w	#$fffe,d0
	move.l	d0,($003e,a1)
	sne.b	($009d,a1)
	bra.w	L001e70

L00206e:
	addq.l	#2,a0
	move.l	(a0)+,d0
	addq.l	#1,d0
	andi.w	#$fffe,d0
	move.l	d0,($0042,a1)
	sne.b	($009e,a1)
	bra.w	L001e70

L002084:
	addq.l	#2,a0
	move.l	(a0)+,d0
	addq.l	#1,d0
	andi.w	#$fffe,d0
	move.l	d0,($0046,a1)
	sne.b	($009f,a1)
	bra.w	L001e70

L00209a:
	addq.l	#2,a0
	move.l	(a0)+,d0
	addq.l	#1,d0
	andi.w	#$fffe,d0
	move.l	d0,($004a,a1)
	sne.b	($00a0,a1)
	bra.w	L001e70

L0020b0:
	move.l	a1,-(sp)
	lea.l	(L0068d4+$000040,pc),a1
	bra.s	L0020be

L0020b8:
	move.l	a1,-(sp)
	lea.l	(L0068d4+$000044,pc),a1
L0020be:
	addq.l	#2,a0
	move.l	(a0)+,d0
	add.l	d0,(a1)
	movea.l	(sp)+,a1
	bra.w	L001e70

L0020ca:
	addq.l	#2,a0
	st.b	($00a2,a1)
	bra.w	L001e74

L0020d4:
	addq.l	#2,a0
	st.b	($00a3,a1)
	bra.w	L001e74

L0020de:
	lea.l	(L0068d4+$000080,pc),a2
	moveq.l	#$08,d3
	sub.l	d3,(a3)
	bmi.w	L00054e
	sub.l	d3,(a2)
	move.l	(a2),d0
	move.l	d0,(a4)
	lea.l	(L0068d4+$00007c,pc),a2
	movea.l	d0,a4
	move.l	a0,(a4)
	addq.w	#4,a4
	move.l	d2,(a4)
	addq.l	#2,a0
	bra.w	L001e70

L002102:
	movem.l	d1-d3/a0-a4,-(sp)
	moveq.l	#$00,d2
	moveq.l	#$04,d3
	movea.l	a0,a1
	lea.l	(L0068d4+$00007c,pc),a2
	lea.l	(L0068d4+$000084,pc),a3
	sub.l	d3,(a3)
	bmi.w	L00054e
	movea.l	(a2),a4
	add.l	d3,(a2)
	move.l	a4,($007e,a1)
	move.l	d2,(a4)
	moveq.l	#$08,d3
	move.l	($0082,a1),d0
	beq.s	L002162
	movea.l	d0,a0
L00212e:
	cmpa.l	($0086,a1),a0
	bhi.s	L002162
	move.w	(a0),d1
	cmpi.w	#$b2fc,d1
	beq.s	L002168
	cmpi.w	#$b2fd,d1
	beq.s	L002168
	cmpi.w	#$b2fe,d1
	beq.s	L002168
	cmpi.w	#$b2ff,d1
	beq.s	L002168
	cmpi.w	#$b0ff,d1
	beq.s	L002168
	move.w	d1,d0
	bsr.w	L0014ec
	tst.l	d0
	bpl.s	L00212e
	bra.w	L0005e6

L002162:
	movem.l	(sp)+,d1-d3/a0-a4
	rts

L002168:
	sub.l	d3,(a3)
	bmi.w	L00054e
	add.l	d3,(a2)
	move.l	a0,(a4)+
	move.l	d2,(a4)+
	move.l	d2,(a4)
	addq.l	#6,a0
	bsr.w	L00153e
	bra.s	L00212e

L00217e:
	movem.l	d1-d2/a0-a5,-(sp)
	lea.l	(L0068d4,pc),a4
	movea.l	($007a,a0),a1
L00218a:
	move.l	(a1)+,d0
	beq.w	L00233c
	movea.l	d0,a2
	movea.l	(a1)+,a3
	move.l	($0014,a3),d0
	bne.w	L002306
	move.w	($000a,a3),d0
	cmpa.l	(a3),a0
	bne.s	L0021e0
	cmpi.w	#$00fe,d0
	bne.s	L0021b8
	move.l	($0010,a3),d0
	add.l	d0,($0010,a4)
	st.b	($0008,a3)
	bra.s	L00218a

L0021b8:
	cmpi.w	#$00fd,d0
	bne.s	L0021cc
	move.l	($0010,a3),d0
	add.l	d0,($0020,a4)
	st.b	($0008,a3)
	bra.s	L00218a

L0021cc:
	cmpi.w	#$00fc,d0
	bne.s	L00218a
	move.l	($0010,a3),d0
	add.l	d0,($0030,a4)
	st.b	($0008,a3)
	bra.s	L00218a

L0021e0:
	cmpi.w	#$00fe,d0
	bne.s	L00222a
	cmp.b	($0001,a2),d0
	bne.s	L002204
	move.l	($0002,a2),d0
	move.l	($0010,a3),d1
	cmp.l	d1,d0
	bls.s	L00218a
	move.l	d0,($0010,a3)
	sub.l	d1,d0
	add.l	d0,($0010,a4)
	bra.s	L00218a

L002204:
	move.w	(a2),d0
	cmpi.b	#$fd,d0
	beq.w	L002306
	cmpi.b	#$fc,d0
	beq.w	L002306
	tst.w	($0008,a3)
	beq.w	L0022b8
	move.l	($0010,a3),d0
	sub.l	d0,($0010,a4)
	bra.w	L0022b8

L00222a:
	cmpi.w	#$00fd,d0
	bne.s	L002274
	cmp.b	($0001,a2),d0
	bne.s	L002252
	move.l	($0002,a2),d0
	move.l	($0010,a3),d1
	cmp.l	d1,d0
	bls.w	L00218a
	move.l	d0,($0010,a3)
	sub.l	d1,d0
	add.l	d0,($0020,a4)
	bra.w	L00218a

L002252:
	move.w	(a2),d0
	cmpi.b	#$fe,d0
	beq.w	L002306
	cmpi.b	#$fc,d0
	beq.w	L002306
	tst.w	($0008,a3)
	beq.s	L0022b8
	move.l	($0010,a3),d0
	sub.l	d0,($0020,a4)
	bra.s	L0022b8

L002274:
	cmpi.w	#$00fd,d0
	bne.s	L0022dc
	cmp.b	($0001,a2),d0
	bne.s	L00229c
	move.l	($0002,a2),d0
	move.l	($0010,a3),d1
	cmp.l	d1,d0
	bls.w	L00218a
	move.l	d0,($0010,a3)
	sub.l	d1,d0
	add.l	d0,($0030,a4)
	bra.w	L00218a

L00229c:
	move.w	(a2),d0
	cmpi.b	#$fd,d0
	beq.s	L002306
	cmpi.b	#$fc,d0
	beq.s	L002306
	tst.w	($0008,a3)
	beq.s	L0022b8
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
	bra.w	L00218a

L0022dc:
	tst.w	d0
	bne.s	L0022f2
	tst.b	($0001,a2)
	bne.s	L0022f2
	move.l	($000c,a3),d0
	cmp.l	($0002,a2),d0
	beq.w	L00218a
L0022f2:
	move.w	(a2),d0
	cmpi.b	#$fe,d0
	beq.s	L0022d2
	cmpi.b	#$fd,d0
	beq.s	L0022d2
	cmpi.b	#$fc,d0
	beq.s	L0022d2
L002306:
	movem.l	a0-a1,-(sp)
	lea.l	(L0068d4+$00007c,pc),a0
	lea.l	(L0068d4+$000084,pc),a1
	moveq.l	#$08,d0
	sub.l	d0,(a1)
	bmi.w	L00054e
	movea.l	(a0),a5
	add.l	d0,(a0)
	lea.l	($0014,a3),a0
L002322:
	move.l	(a0),d0
	beq.s	L00232c
	movea.l	d0,a0
	addq.w	#4,a0
	bra.s	L002322

L00232c:
	move.l	a5,(a0)
	movem.l	(sp)+,a0-a1
	move.l	a0,(a5)
	clr.l	($0004,a5)
	bra.w	L00218a

L00233c:
	movem.l	(sp)+,d1-d2/a0-a5
	rts

L002342:
	movem.l	d1-d2/a0-a5,-(sp)
	moveq.l	#$00,d0
	lea.l	($0006,a1),a2
	lea.l	(L00262c,pc),a3
L002350:
	moveq.l	#$00,d1
	move.b	(a2)+,d1
	beq.s	L002360
	rol.w	#3,d0
	add.w	d1,d1
	add.w	(a3,d1.w),d0
	bra.s	L002350

L002360:
	andi.w	#$0fff,d0
	asl.l	#2,d0
	movea.l	(L0068d4+$0005b8,pc),a2
	adda.l	d0,a2
L00236c:
	move.l	(a2),d0
	beq.s	L00238e
	exg.l	d0,a2
	lea.l	($0006,a1),a3
	movea.l	($0004,a2),a4
L00237a:
	move.b	(a3)+,d1
	beq.s	L002384
	cmp.b	(a4)+,d1
	beq.s	L00237a
	bra.s	L002388

L002384:
	tst.b	(a4)
	beq.s	L0023e6
L002388:
	lea.l	($0018,a2),a2
	bra.s	L00236c

L00238e:
	moveq.l	#$1c,d0
	lea.l	(L0068d4+$000080,pc),a4
	lea.l	(L0068d4+$000084,pc),a5
	sub.l	d0,(a5)
	bmi.w	L00054e
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
	beq.s	L0023d4
	cmpi.w	#$00fd,d1
	beq.s	L0023d4
	cmpi.w	#$00fc,d1
	beq.s	L0023d4
	move.l	d2,(a3)+
	move.l	d0,(a3)+
	bra.s	L0023de

L0023d4:
	addq.l	#1,d2
	andi.w	#$fffe,d2
	move.l	d0,(a3)+
	move.l	d2,(a3)+
L0023de:
	move.l	d0,(a3)+
	move.l	d0,(a3)+
	move.l	(a2),d0
	bra.s	L0023fc

L0023e6:
	movea.l	(a2),a4
	tst.l	($0004,a0)
	bne.s	L0023fa
	tst.l	($0004,a4)
	beq.s	L0023fa
	movea.l	d0,a2
	movea.l	(a2),a3
	bra.s	L0023a4

L0023fa:
	exg.l	d0,a2
L0023fc:
	movem.l	(sp)+,d1-d2/a0-a5
	rts

L002402:
	movem.l	d1-d2/a0-a3,-(sp)
	moveq.l	#$00,d0
	movea.l	a0,a1
	lea.l	(L00262c,pc),a2
L00240e:
	moveq.l	#$00,d1
	move.b	(a1)+,d1
	beq.s	L00241e
	add.w	d1,d1
	rol.w	#3,d0
	add.w	(a2,d1.w),d0
	bra.s	L00240e

L00241e:
	andi.w	#$0fff,d0
	asl.l	#2,d0
	movea.l	(L0068d4+$0005b8,pc),a1
	adda.l	d0,a1
L00242a:
	move.l	(a1),d0
	beq.s	L00244a
	movea.l	d0,a1
	movea.l	a0,a2
	movea.l	($0004,a1),a3
L002436:
	move.b	(a2)+,d1
	beq.s	L002440
	cmp.b	(a3)+,d1
	beq.s	L002436
	bra.s	L002444

L002440:
	tst.b	(a3)
	beq.s	L00244a
L002444:
	lea.l	($0018,a1),a1
	bra.s	L00242a

L00244a:
	movem.l	(sp)+,d1-d2/a0-a3
	rts

L002450:
	movem.l	d1/a0-a4,-(sp)
	movea.l	($007a,a0),a1
L002458:
	move.l	(a1)+,d0
	beq.w	L002560
	movea.l	(a1)+,a2
	cmpa.l	(a2),a0
	bne.s	L002458
	tst.l	($0014,a2)
	bne.w	L002516
	tst.w	($0008,a2)
	ble.s	L00248a
	move.b	(L0068d4+$0005d2,pc),d0
	bne.s	L00248a
	pea.l	(L0025d5,pc)
	DOS	_PRINT
	move.l	($0004,a2),-(sp)
	DOS	_PRINT
	addq.l	#8,sp
	bsr.w	L000c82
L00248a:
	move.l	($000c,a2),d1
	move.w	($000a,a2),d0
	addq.b	#4,d0
	cmpi.w	#$000e,d0
	bhi.s	L0024b2
	move.b	(L0024a2,pc,d0.w),d0
	jmp	(L0024a2,pc,d0.w)

L0024a2:
	.dc.b	$60,$5a,$54,$10,$6c,$18,$1e,$24
	.dc.b	$2a,$30,$36,$3c,$42,$48,$4e,$00
L0024b2:
	lea.l	(L002450,pc),a0
	bra.w	L0005aa

L0024ba:
	add.l	($004e,a0),d1
	bra.s	L00250e

L0024c0:
	add.l	($0052,a0),d1
	bra.s	L00250e

L0024c6:
	add.l	($0056,a0),d1
	bra.s	L00250e

L0024cc:
	add.l	($005a,a0),d1
	bra.s	L00250e

L0024d2:
	add.l	($005e,a0),d1
	bra.s	L00250e

L0024d8:
	add.l	($0062,a0),d1
	bra.s	L00250e

L0024de:
	add.l	($0066,a0),d1
	bra.s	L00250e

L0024e4:
	add.l	($006a,a0),d1
	bra.s	L00250e

L0024ea:
	add.l	($006e,a0),d1
	bra.s	L00250e

L0024f0:
	add.l	($0072,a0),d1
	bra.s	L00250e

L0024f6:
	lea.l	(L0068d4+$000058,pc),a4
	bra.s	L002506

L0024fc:
	lea.l	(L0068d4+$00005c,pc),a4
	bra.s	L002506

L002502:
	lea.l	(L0068d4+$000060,pc),a4
L002506:
	add.l	(a4),d1
	move.l	($0010,a2),d0
	add.l	d0,(a4)
L00250e:
	move.l	d1,($000c,a2)
	bra.w	L002458

L002516:
	pea.l	(L0025f6,pc)
	DOS	_PRINT
	move.l	($0004,a2),-(sp)
	DOS	_PRINT
	addq.l	#8,sp
	bsr.w	L000c82
	pea.l	(L00260e,pc)
	DOS	_PRINT
	move.l	($0008,a0),-(sp)
	DOS	_PRINT
	addq.l	#8,sp
	move.l	($0014,a2),d1
L00253a:
	movea.l	d1,a3
	movea.l	(a3),a4
	bsr.w	L000c78
	move.l	($0008,a4),-(sp)
	DOS	_PRINT
	addq.l	#4,sp
	move.l	($0004,a3),d1
	bne.s	L00253a
	lea.l	(L0068d4+$0005cc,pc),a4
	move.w	#$0001,(a4)
	bsr.w	L000c82
	bra.w	L002458

L002560:
	movem.l	(sp)+,d1/a0-a4
	rts

L002566:
	movem.l	d1-d3/a0-a1,-(sp)
	moveq.l	#$00,d3
	movea.l	($007e,a0),a1
L002570:
	move.l	(a1)+,d1
	beq.s	L0025a8
	move.l	(a1)+,d2
	bne.s	L002570
	tas.b	d3
	bne.s	L00259a
	pea.l	(L002613,pc)
	DOS	_PRINT
	move.l	($0008,a0),-(sp)
	DOS	_PRINT
	addq.l	#8,sp
	bsr.w	L000c82
	move.l	a0,-(sp)
	lea.l	(L0068d4+$0005cc,pc),a0
	move.w	#$0001,(a0)
	movea.l	(sp)+,a0
L00259a:
	addq.l	#6,d1
	move.l	d1,-(sp)
	DOS	_PRINT
	addq.l	#4,sp
	bsr.w	L000c82
	bra.s	L002570

L0025a8:
	tst.b	d3
	beq.s	L0025b0
	bsr.w	L000c82
L0025b0:
	movem.l	(sp)+,d1-d3/a0-a1
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
	.dc.b	$a7,$5b,$ae,$8e,$66,$c2,$f1,$27
	.dc.b	$36,$f8,$75,$cb,$d6,$dc,$98,$82
	.dc.b	$ae,$45,$c3,$5f,$e3,$c2,$b3,$8f
	.dc.b	$e6,$5a,$a9,$a0,$2f,$4c,$99,$cf
	.dc.b	$2d,$d6,$a2,$41,$d0,$e0,$0a,$4a
	.dc.b	$64,$ca,$b8,$9f,$55,$41,$4e,$8f
	.dc.b	$e0,$d5,$7b,$6d,$da,$d5,$33,$a6
	.dc.b	$7b,$0f,$ef,$08,$fc,$74,$fc,$10
	.dc.b	$89,$09,$9b,$23,$d1,$6f,$6d,$d5
	.dc.b	$e3,$db,$84,$1b,$ed,$a5,$d2,$84
	.dc.b	$e8,$24,$38,$a3,$6f,$67,$f7,$25
	.dc.b	$67,$f5,$c4,$11,$e3,$94,$1e,$39
	.dc.b	$bf,$ed,$a0,$2d,$6f,$7d,$14,$c8
	.dc.b	$c2,$24,$df,$38,$9f,$fa,$1d,$61
	.dc.b	$cb,$24,$02,$01,$93,$71,$05,$0c
	.dc.b	$ad,$1a,$1a,$c9,$e4,$a5,$0e,$4a
	.dc.b	$cb,$90,$aa,$5f,$a3,$fc,$06,$23
	.dc.b	$f1,$9e,$bc,$04,$6c,$4e,$2f,$26
	.dc.b	$82,$e3,$d0,$87,$54,$ec,$56,$54
	.dc.b	$51,$70,$fa,$29,$f8,$b5,$c5,$3c
	.dc.b	$b2,$e4,$b9,$b9,$6e,$fa,$3a,$e6
	.dc.b	$80,$57,$21,$78,$4b,$9a,$07,$d3
	.dc.b	$0f,$5a,$ab,$35,$ac,$e6,$f2,$0b
	.dc.b	$47,$05,$62,$31,$26,$bd,$43,$1d
	.dc.b	$6e,$f7,$d5,$3b,$d0,$70,$ba,$11
	.dc.b	$60,$41,$08,$94,$44,$d7,$ae,$68
	.dc.b	$77,$82,$8b,$0b,$9b,$51,$d8,$2a
	.dc.b	$94,$d2,$52,$e1,$67,$b6,$87,$e6
	.dc.b	$ff,$c2,$fc,$e5,$c8,$57,$83,$a4
	.dc.b	$98,$6a,$7f,$58,$58,$13,$14,$e5
	.dc.b	$bb,$69,$70,$09,$20,$3b,$01,$b1
	.dc.b	$3a,$d0,$cc,$39,$c9,$ae,$93,$97
	.dc.b	$6c,$3e,$22,$b7,$5d,$bd,$97,$98
	.dc.b	$2f,$cb,$7e,$c4,$7e,$47,$49,$43
	.dc.b	$d4,$08,$61,$28,$42,$9d,$75,$a0
	.dc.b	$39,$0d,$ce,$39,$3e,$97,$6d,$30
	.dc.b	$ad,$79,$5b,$aa,$89,$9b,$ee,$fb
	.dc.b	$18,$5d,$ff,$d8,$be,$6c,$44,$90
	.dc.b	$c1,$58,$57,$76,$fb,$70,$33,$f7
	.dc.b	$8f,$82,$58,$e1,$cd,$7f,$06,$b1
	.dc.b	$ca,$6c,$92,$cc,$4b,$ea,$89,$c6
	.dc.b	$59,$2e,$10,$94,$18,$90,$06,$c5
	.dc.b	$8a,$67,$52,$ec,$4a,$c2,$35,$b6
	.dc.b	$3e,$28,$6c,$2a,$6f,$5f,$6e,$1a
	.dc.b	$c3,$10,$d6,$16,$ab,$b8,$75,$f9
	.dc.b	$f2,$37,$a2,$f1,$8c,$a5,$8f,$e2
	.dc.b	$2f,$27,$5a,$8a,$30,$8c,$81,$dd
	.dc.b	$45,$0d,$01,$22,$2b,$30,$9c,$6b
	.dc.b	$90,$73,$25,$88,$9a,$f7,$a5,$94
	.dc.b	$e3,$71,$c4,$fd,$13,$b9,$df,$e7
	.dc.b	$a8,$a6,$6e,$50,$ac,$c7,$18,$65
	.dc.b	$a4,$23,$25,$c2,$01,$00,$91,$9d
	.dc.b	$32,$87,$73,$22,$27,$b5,$1f,$97
	.dc.b	$33,$ea,$68,$b1,$b4,$c5,$f6,$d4
	.dc.b	$f6,$dd,$80,$3e,$c6,$81,$f2,$5c
	.dc.b	$54,$78,$cc,$0a,$f0,$c8,$54,$be
	.dc.b	$b0,$5a,$d3,$e4,$4a,$eb,$dd,$02
	.dc.b	$d5,$94,$95,$0d,$6f,$c2,$db,$a9
	.dc.b	$20,$c5,$9e,$54,$76,$ac,$16,$bb
	.dc.b	$64,$05,$fa,$fa,$f3,$81,$d7,$c7
	.dc.b	$02,$e5,$32,$ce,$04,$92,$e4,$d5
	.dc.b	$cf,$7d,$4a,$11,$3d,$be,$87,$66
	.dc.b	$1f,$6c,$c8,$92,$bd,$56,$85,$82
	.dc.b	$cb,$c3,$b9,$92,$10,$39,$28,$b8
L00282c:
	movem.l	d1-d4/d7/a1-a4,-(sp)
	bra.s	L002840

L002832:
	movem.l	d1-d4/d7/a1-a4,-(sp)
	bsr.w	L00657c
	tst.l	d0
	bne.w	L0028d0
L002840:
	cmpi.w	#$d100,(a2)
	beq.s	L002862
	cmpi.w	#$0068,(a2)		;'h'
	beq.s	L00288e
	moveq.l	#$00,d1
	moveq.l	#$00,d2
	moveq.l	#$00,d3
	bsr.w	L0028da
	movea.l	a2,a0
	movea.l	d0,a1
	bsr.w	L001e4c
	movea.l	a1,a0
	bra.s	L0028c8

L002862:
	move.l	a0,d1
	moveq.l	#$00,d2
	moveq.l	#$00,d3
	lea.l	($0006,a2),a4
L00286c:
	tst.w	(a4)
	beq.s	L0028c6
	move.l	a1,-(sp)
	move.l	($0018,a4),d7
	movea.l	a4,a0
	lea.l	($0020,a4),a2
	bsr.s	L0028da
	movea.l	a2,a0
	movea.l	d0,a1
	bsr.w	L001e4c
	movea.l	(sp)+,a1
	lea.l	($20,a4,d7.l),a4
	bra.s	L00286c

L00288e:
	move.l	a0,d1
	moveq.l	#$00,d2
	moveq.l	#$00,d3
	movea.l	a2,a3
	lea.l	($0040,a3),a4
	move.l	($0024,a3),d4
	beq.s	L0028c6
L0028a0:
	move.l	a1,-(sp)
	move.l	($0020,a4),d7
	movea.l	a4,a0
	movea.l	($001c,a4),a2
	adda.l	a3,a2
	bsr.s	L0028da
	movea.l	a2,a0
	movea.l	d0,a1
	bsr.w	L001e4c
	movea.l	(sp)+,a1
	lea.l	($0030,a4),a4
	sub.l	#$00000030,d4
	bne.s	L0028a0
L0028c6:
	suba.l	a0,a0
L0028c8:
	moveq.l	#$00,d0
L0028ca:
	movem.l	(sp)+,d1-d4/d7/a1-a4
	rts

L0028d0:
	bpl.s	L0028ca
	move.w	#$0001,($05cc,a6)
	bra.s	L0028ca

L0028da:
	movem.l	d1-d5/a0-a6,-(sp)
	moveq.l	#$00,d4
	move.l	#$000000a4,d5
	lea.l	(L0068d4+$00007c,pc),a3
	lea.l	(L0068d4+$000084,pc),a4
	sub.l	d5,(a4)
	bmi.w	L00054e
	movea.l	(a3),a5
	add.l	d5,(a3)
	lea.l	(L0068d4+$000068,pc),a3
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
	movem.l	(sp)+,d1-d5/a0-a6
	rts

L00298c:
	movem.l	d1-d2/a1-a3/a6,-(sp)
	lea.l	(L0068d4,pc),a6
	tst.b	($05d1,a6)
	beq.s	L0029b2
	pea.l	(L002ab4,pc)
	DOS	_PRINT
	pea.l	($000f)
	pea.l	(a0)
	bsr.w	L002a66
	bsr.w	L000c82
	lea.l	($000c,sp),sp
L0029b2:
	moveq.l	#$08,d1
	sub.l	d1,($0084,a6)
	bmi.w	L00054e
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
	movem.l	(sp)+,d1-d2/a1-a3/a6
	rts

L0029e8:
	movem.l	a0-a1,-(sp)
	move.l	($0076,a0),d0
	beq.s	L002a0c
L0029f2:
	movea.l	d0,a1
	movea.l	(a1),a0
	addq.l	#2,a0
	bsr.w	L002832
	tst.l	d0
	bne.s	L002a06
	move.l	a0,d0
	beq.s	L002a06
	bsr.s	L00298c
L002a06:
	move.l	($0004,a1),d0
	bne.s	L0029f2
L002a0c:
	movem.l	(sp)+,a0-a1
	rts

L002a12:
	movem.l	a0-a1,-(sp)
	bsr.w	L002102
	movea.l	($007e,a0),a1
	move.l	(a1)+,d0
	beq.s	L002a60
L002a22:
	movea.l	d0,a0
	addq.l	#6,a0
	bsr.w	L002402
	move.l	d0,(a1)+
	beq.s	L002a5c
	movea.l	d0,a0
	movea.l	(a0),a0
	tst.w	($0024,a0)
	bne.s	L002a5c
	bsr.w	L00298c
	tst.l	($0004,a0)
	beq.s	L002a5c
	tst.l	($0076,a0)
	beq.s	L002a5c
	pea.l	(L002abe,pc)
	DOS	_PRINT
	clr.l	-(sp)
	pea.l	(a0)
	bsr.s	L002a66
	bsr.w	L000c82
	lea.l	($000c,sp),sp
L002a5c:
	move.l	(a1)+,d0
	bne.s	L002a22
L002a60:
	movem.l	(sp)+,a0-a1
	rts

L002a66:
	link.w	a6,#$0000
	movem.l	d1-d2/a0-a1,-(sp)
	movea.l	($0008,a6),a0
	move.l	($000c,a6),d1
	movea.l	($0008,a0),a1
	move.l	($0004,a0),d2
	pea.l	(a1)
	DOS	_PRINT
	move.l	d2,(sp)+
	beq.s	L002aac
	addq.w	#1,d1
L002a88:
	subq.w	#1,d1
	tst.b	(a1)+
	bne.s	L002a88
L002a8e:
	move.w	#$0009,-(sp)
	DOS	_PUTCHAR
	addq.l	#2,sp
	subq.w	#8,d1
	bgt.s	L002a8e
	move.w	#$0028,-(sp)		;'('
	DOS	_PUTCHAR
	move.l	d2,-(sp)
	DOS	_PRINT
	move.w	#$0029,-(sp)		;')'
	DOS	_PUTCHAR
	addq.l	#8,sp
L002aac:
	movem.l	(sp)+,d1-d2/a0-a1
	unlk	a6
	rts

L002ab4:
	.dc.b	'Linked : ',$00
L002abe:
	.dc.b	'Request error : ',$00,$00
L002ad0:
	link.w	a6,#-$005e
	movem.l	d1-d7/a0-a5,-(sp)
	lea.l	(L0068d4,pc),a0
	tst.b	($05d1,a0)
	beq.s	L002aea
	pea.l	(L005472,pc)
	DOS	_PRINT
	addq.l	#4,sp
L002aea:
	moveq.l	#$40,d0			;'@'
	add.l	d0,($007c,a0)
	sub.l	d0,($0084,a0)
	bmi.s	L002afa
	bsr.w	L0058e0
L002afa:
	bmi.w	L00054e
	movea.l	($007c,a0),a5
	move.l	a5,(-$0008,a6)
	lea.l	(a5),a1
	moveq.l	#$00,d0
	moveq.l	#$0f,d1
L002b0c:
	move.l	d0,-(a1)
	dbra.w	d1,L002b0c
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
	bmi.w	L00054e
	lea.l	(a5,d0.l),a4
	move.l	a4,(-$005e,a6)
	tst.b	($05ce,a0)
	beq.s	L002bb0
	bsr.w	L002eb2
	adda.l	($0048,a0),a3
	addq.l	#4,a3
	move.l	a3,($0048,a0)
L002bb0:
	tst.b	($05cf,a0)
	beq.s	L002bc4
	bsr.w	L002eb2
	adda.l	($004c,a0),a3
	addq.l	#4,a3
	move.l	a3,($004c,a0)
L002bc4:
	lea.l	($006c,a0),a2
	move.l	(a2),d0
	beq.w	L002c76
L002bce:
	movea.l	d0,a2
	movea.l	(a2),a1
	tst.b	($0097,a1)
	beq.s	L002be0
	lea.l	(-$003e,a6),a5
	bsr.w	L002f1c
L002be0:
	tst.b	($0098,a1)
	beq.s	L002bee
	lea.l	(-$003a,a6),a5
	bsr.w	L002ef0
L002bee:
	tst.b	($009b,a1)
	beq.s	L002bfc
	lea.l	(-$0036,a6),a5
	bsr.w	L002ef0
L002bfc:
	tst.b	($009e,a1)
	beq.s	L002c0a
	lea.l	(-$0032,a6),a5
	bsr.w	L002ef0
L002c0a:
	moveq.l	#$01,d5
	movea.l	(-$003e,a6),a5
	movea.l	($0010,a1),a0
	move.w	(a0),d0
	beq.s	L002c34
L002c18:
	move.w	d0,d1
	bsr.w	L0014a4
	bmi.w	L002e64
	add.w	d0,d0
	lea.l	(L00548e,pc),a3
	move.w	(a3,d0.w),d0
	jsr	(a3,d0.w)
	move.w	(a0),d0
	bne.s	L002c18
L002c34:
	addq.l	#2,a0
	move.l	a0,($0014,a1)
	move.l	($000c,a1),d0
	sub.l	a0,d0
	add.l	($0010,a1),d0
	move.l	d0,($0018,a1)
	subq.w	#1,d5
	bne.s	L002c52
	move.l	a5,(-$003e,a6)
	bra.s	L002c6e

L002c52:
	subq.w	#1,d5
	bne.s	L002c5c
	move.l	a5,(-$003a,a6)
	bra.s	L002c6e

L002c5c:
	subq.w	#3,d5
	bne.s	L002c66
	move.l	a5,(-$0036,a6)
	bra.s	L002c6e

L002c66:
	subq.w	#3,d5
	bne.s	L002c6e
	move.l	a5,(-$0032,a6)
L002c6e:
	addq.w	#4,a2
	move.l	(a2),d0
	bne.w	L002bce
L002c76:
	lea.l	(-$003e,a6),a5
	bsr.w	L002f4a
	lea.l	(-$003a,a6),a5
	bsr.w	L002f4a
	lea.l	(-$0036,a6),a5
	bsr.w	L002f4a
	lea.l	(-$0032,a6),a5
	bsr.w	L002f4a
	move.w	(L0068d4+$0005cc,pc),d0
	bne.w	L002e50
	move.l	(-$0042,a6),d0
	cmp.l	(L0068d4+$000054,pc),d0
	bne.w	L002ea2
	move.b	(L0068d4+$0005da,pc),d0
	bne.s	L002cb8
	bsr.w	L002f5c
	bmi.w	L002e80
L002cb8:
	move.b	(L0068d4+$0005d3,pc),d0
	bne.s	L002cce
	bsr.w	L00305e
	bsr.w	L003132
	move.w	(L0068d4+$0005cc,pc),d0
	bne.w	L002e50
L002cce:
	lea.l	(L0068d4,pc),a0
	tst.b	($05d6,a0)
	beq.s	L002d14
	bsr.w	L002eb2
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
	beq.s	L002d28
	movea.l	($0048,a0),a3
	clr.l	(a3)
	suba.l	($0040,a0),a3
	move.l	d0,-(a3)
L002d28:
	tst.b	($05cf,a0)
	beq.s	L002d3a
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
	beq.s	L002dd4
	tst.b	($05db,a0)
	bne.s	L002dbc
	tst.l	(-$005a,a6)
	bne.w	L002e7a
	move.l	($0094,a0),d0
	cmp.l	($0098,a0),d0
	bne.w	L002e86
L002dbc:
	move.l	($0014,a3),d0
	cmp.l	d0,d7
	bcs.w	L00054e
	move.l	($000c,a3),d1
	add.l	($0010,a3),d1
	lea.l	($0040,a3),a3
	bra.s	L002df2

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
	move.w	#$0020,-(sp)		;' '
	tst.b	($05d8,a0)
	beq.s	L002e06
	tst.b	($05d9,a0)
	bgt.s	L002e06
	ori.w	#$0080,(sp)
L002e06:
	pea.l	($009c,a0)
	DOS	_CREATE
	addq.l	#6,sp
	move.l	d0,d2
	bmi.s	L002e68
	move.l	d1,-(sp)
	pea.l	(a3)
	move.w	d2,-(sp)
	DOS	_WRITE
	addq.l	#6,sp
	move.l	d0,(sp)+
	bmi.s	L002e6e
	cmp.l	d0,d1
	bne.s	L002e74
	tst.b	($05da,a0)
	beq.s	L002e46
	move.l	(-$002c,a3),d1
	beq.s	L002e46
	bsr.w	L002ec6
	move.l	d1,-(sp)
	pea.l	(a4)
	move.w	d2,-(sp)
	DOS	_WRITE
	addq.l	#6,sp
	move.l	d0,(sp)+
	bmi.s	L002e6e
	cmp.l	d0,d1
	bne.s	L002e74
L002e46:
	move.w	d2,-(sp)
	DOS	_CLOSE
	addq.l	#2,sp
	tst.l	d0
	bmi.s	L002e6e
L002e50:
	lea.l	(L0068d4,pc),a0
	move.l	a4,($007c,a0)
	move.l	d7,($0084,a0)
L002e5c:
	movem.l	(sp)+,d1-d7/a0-a5
	unlk	a6
	rts

L002e64:
	bra.w	L0005e6

L002e68:
	pea.l	(L0053ca,pc)
	bra.s	L002e8a

L002e6e:
	pea.l	(L0053dd,pc)
	bra.s	L002e8a

L002e74:
	pea.l	(L0053ef,pc)
	bra.s	L002e8a

L002e7a:
	pea.l	(L0053fe,pc)
	bra.s	L002e8a

L002e80:
	pea.l	(L005416,pc)
	bra.s	L002e8a

L002e86:
	pea.l	(L005431,pc)
L002e8a:
	DOS	_PRINT
	pea.l	(L0068d4+$00009c,pc)
	DOS	_PRINT
	addq.l	#8,sp
	bsr.w	L000c82
	lea.l	(L0068d4+$0005cc,pc),a0
	move.w	#$0001,(a0)
	bra.s	L002e5c

L002ea2:
	pea.l	(L005454,pc)
	DOS	_PRINT
	addq.l	#4,sp
	lea.l	(L002ad0,pc),a0
	bra.w	L0005aa

L002eb2:
	movea.l	($006c,a0),a2
	movea.l	(a2),a1
	movea.l	($0052,a1),a3
	adda.l	(-$000c,a6),a3
	lea.l	($0040,a3),a3
	rts

L002ec6:
	movem.l	d1/a4,-(sp)
	lsr.l	#3,d1
	moveq.l	#$00,d0
	bra.s	L002ed4

L002ed0:
	move.l	d0,(a4)+
	move.l	d0,(a4)+
L002ed4:
	dbra.w	d1,L002ed0
	clr.w	d1
	subq.l	#1,d1
	bcc.s	L002ed0
	moveq.l	#$07,d1
	and.l	(sp),d1
	bra.s	L002ee6

L002ee4:
	move.b	d0,(a4)+
L002ee6:
	dbra.w	d1,L002ee4
	movem.l	(sp)+,d1/a4
	rts

L002ef0:
	movem.l	d0-d1/a0,-(sp)
	movea.l	(a5),a0
	move.l	(-$0008,a6),d0
	sub.l	a0,d0
	move.l	($008e,a1),d1
	subq.l	#1,d1
	and.l	d1,d0
	beq.s	L002f16
	lsr.l	#1,d0
	bcc.s	L002f10
	clr.b	(a0)+
	bra.s	L002f10

L002f0e:
	clr.w	(a0)+
L002f10:
	subq.l	#1,d0
	bcc.s	L002f0e
	move.l	a0,(a5)
L002f16:
	movem.l	(sp)+,d0-d1/a0
	rts

L002f1c:
	movem.l	d0-d1/a0,-(sp)
	movea.l	(a5),a0
	move.l	(-$0008,a6),d0
	sub.l	a0,d0
	move.l	($008e,a1),d1
	subq.l	#1,d1
	and.l	d1,d0
	beq.s	L002f44
	lsr.l	#1,d0
	bcc.s	L002f3e
	clr.b	(a0)+
	bra.s	L002f3e

L002f3a:
	move.w	#$4e71,(a0)+		;'Nq'
L002f3e:
	subq.l	#1,d0
	bcc.s	L002f3a
	move.l	a0,(a5)
L002f44:
	movem.l	(sp)+,d0-d1/a0
	rts

L002f4a:
	move.l	a0,-(sp)
	movea.l	(a5),a0
	move.w	a0,-(sp)
	lsr.w	(sp)+
	bcc.s	L002f58
	clr.b	(a0)+
	move.l	a0,(a5)
L002f58:
	movea.l	(sp)+,a0
	rts

L002f5c:
	movem.l	d1-d7/a0-a1,-(sp)
	movea.l	(-$005e,a6),a0
	subq.l	#6,a0
	move.l	(-$005a,a6),d1
	move.l	d1,d2
	move.l	d1,d3
	lsr.l	#1,d3
	btst.l	#$00,d3
	beq.s	L002f78
	subq.l	#3,d3
L002f78:
	tst.l	d3
	beq.s	L002fb2
	move.l	($02,a0,d3.l),d4
	move.l	d3,d5
	move.l	d5,d6
	add.l	d6,d6
L002f86:
	cmp.l	d6,d2
	bcs.s	L002faa
	beq.s	L002f98
	move.l	($08,a0,d6.l),d7
	cmp.l	($02,a0,d6.l),d7
	bls.s	L002f98
	addq.l	#6,d6
L002f98:
	cmp.l	($02,a0,d6.l),d4
	bcc.s	L002faa
	move.l	($02,a0,d6.l),($02,a0,d5.l)
	move.l	d6,d5
	add.l	d6,d6
	bra.s	L002f86

L002faa:
	move.l	d4,($02,a0,d5.l)
	subq.l	#6,d3
	bra.s	L002f78

L002fb2:
	moveq.l	#$06,d3
L002fb4:
	cmp.l	#$00000006,d2
	bls.s	L002ff8
	move.l	($02,a0,d2.l),d4
	move.l	($0008,a0),($02,a0,d2.l)
	subq.l	#6,d2
	move.l	d3,d5
	move.l	d5,d6
	add.l	d6,d6
L002fce:
	cmp.l	d6,d2
	bcs.s	L002ff2
	beq.s	L002fe0
	move.l	($08,a0,d6.l),d7
	cmp.l	($02,a0,d6.l),d7
	bls.s	L002fe0
	addq.l	#6,d6
L002fe0:
	cmp.l	($02,a0,d6.l),d4
	bcc.s	L002ff2
	move.l	($02,a0,d6.l),($02,a0,d5.l)
	move.l	d6,d5
	add.l	d6,d6
	bra.s	L002fce

L002ff2:
	move.l	d4,($02,a0,d5.l)
	bra.s	L002fb4

L002ff8:
	movea.l	(-$005e,a6),a0
	movea.l	a0,a1
	move.l	(-$005a,a6),d2
	move.l	d2,d3
	move.l	#$00010000,d4
	moveq.l	#$40,d5			;'@'
	add.l	(-$000c,a6),d5
	moveq.l	#$00,d7
	bra.s	L003034

L003014:
	move.l	d5,d1
	addq.l	#2,a0
	move.l	(a0)+,d5
	or.w	d5,d7
	move.l	d5,d0
	sub.l	d1,d0
	cmp.l	d4,d0
	bcc.s	L00302e
	move.w	d0,(a1)+
	subq.l	#4,d3
	subq.l	#6,d2
	bcc.s	L003014
	bra.s	L003038

L00302e:
	move.w	#$0001,(a1)+
	move.l	d0,(a1)+
L003034:
	subq.l	#6,d2
	bcc.s	L003014
L003038:
	movea.l	a1,a4
	move.l	(-$005a,a6),d0
	sub.l	d3,d0
	move.l	d3,(-$005a,a6)
	lea.l	(L0068d4,pc),a0
	sub.l	d0,($007c,a0)
	add.l	d0,($0084,a0)
	moveq.l	#$00,d0
	btst.l	d0,d7
	beq.s	L003058
	moveq.l	#$ff,d0
L003058:
	movem.l	(sp)+,d1-d7/a0-a1
	rts

L00305e:
	movem.l	d1-d3/a0-a3,-(sp)
	moveq.l	#$00,d3
	lea.l	(L0068d4+$00006c,pc),a2
L003068:
	move.l	(a2),d0
	beq.w	L003120
	movea.l	d0,a2
	movea.l	(a2),a1
	movea.l	($007a,a1),a3
L003076:
	tst.l	(a3)
	beq.w	L00311a
	movea.l	($0004,a3),a0
	cmpa.l	(a0),a1
	bne.w	L003114
	move.w	($000a,a0),d0
	beq.s	L0030de
	cmpi.w	#$0001,d0
	beq.s	L0030c6
	cmpi.w	#$0002,d0
	beq.s	L0030cc
	cmpi.w	#$0003,d0
	beq.s	L0030d2
	cmpi.w	#$0004,d0
	beq.s	L0030d8
	cmpi.w	#$000a,d0
	bls.s	L0030de
	cmpi.w	#$00fc,d0
	beq.s	L0030be
	cmpi.w	#$00fd,d0
	beq.s	L0030be
	cmpi.w	#$00fe,d0
	beq.s	L0030c2
	bra.s	L00312a

L0030be:
	moveq.l	#$00,d1
	bra.s	L0030e2

L0030c2:
	moveq.l	#$03,d1
	bra.s	L0030e2

L0030c6:
	move.w	#$0201,d1
	bra.s	L0030e2

L0030cc:
	move.w	#$0202,d1
	bra.s	L0030e2

L0030d2:
	move.w	#$0203,d1
	bra.s	L0030e2

L0030d8:
	move.w	#$0204,d1
	bra.s	L0030e2

L0030de:
	move.w	#$0200,d1
L0030e2:
	move.l	($000c,a0),d2
	subq.l	#6,d7
	bmi.w	L00054e
	addq.l	#6,d3
	move.w	d1,(a4)+
	move.l	d2,(a4)+
	movea.l	($0004,a0),a0
L0030f6:
	subq.l	#1,d7
	bmi.w	L00054e
	addq.l	#1,d3
	move.b	(a0)+,(a4)+
	bne.s	L0030f6
	move.l	a4,d0
	btst.l	#$00,d0
	beq.s	L003114
	subq.l	#1,d7
	bmi.w	L00054e
	addq.l	#1,d3
	clr.b	(a4)+
L003114:
	addq.l	#8,a3
	bra.w	L003076

L00311a:
	addq.w	#4,a2
	bra.w	L003068

L003120:
	move.l	d3,(-$0056,a6)
	movem.l	(sp)+,d1-d3/a0-a3
	rts

L00312a:
	lea.l	(L00305e,pc),a0
	bra.w	L0005aa

L003132:
	movem.l	d1-d7/a0-a5,-(sp)
	lea.l	(L0068d4+$00006c,pc),a2
L00313a:
	move.l	(a2),d0
	beq.s	L003174
	movea.l	d0,a2
	movea.l	(a2),a1
	tst.l	($0018,a1)
	beq.s	L003170
	movea.l	($0014,a1),a3
	move.l	(a3)+,d1
	move.l	(a3)+,d3
	move.l	($0c,a3,d1.l),d2
	mulu.w	#$0012,d2
	sub.l	d2,d3
	bmi.w	L003690
	move.l	(a3)+,d4
	add.l	d1,(-$001e,a6)
	add.l	d2,(-$001a,a6)
	add.l	d3,(-$0016,a6)
	add.l	d4,(-$0012,a6)
L003170:
	addq.w	#4,a2
	bra.s	L00313a

L003174:
	move.l	(-$001e,a6),d0
	add.l	(-$001a,a6),d0
	add.l	(-$0016,a6),d0
	add.l	(-$0012,a6),d0
	sub.l	d0,d7
	bmi.w	L00054e
	adda.l	d0,a5
	lea.l	(L0068d4,pc),a2
	move.l	a5,($007c,a2)
	move.l	d7,($0084,a2)
	moveq.l	#$00,d0
	move.l	d0,(-$002e,a6)
	move.l	d0,(-$002a,a6)
	move.l	d0,(-$0026,a6)
	move.l	d0,(-$0022,a6)
	lea.l	(L0068d4+$00006c,pc),a2
L0031ae:
	move.l	(a2),d0
	beq.w	L00367a
	movea.l	d0,a2
	movea.l	(a2),a1
	tst.l	($0018,a1)
	beq.w	L003674
	movea.l	($0014,a1),a3
	move.l	(a3)+,d1
	move.l	(a3)+,d3
	move.l	($0c,a3,d1.l),d2
	mulu.w	#$0012,d2
	sub.l	d2,d3
	move.l	(a3)+,d4
	move.l	d1,d7
	beq.s	L003200
	movea.l	(-$002e,a6),a5
	adda.l	a4,a5
	move.l	($004e,a1),d5
L0031e2:
	move.l	(a3)+,d0
	move.w	(a3)+,d6
	beq.s	L0031f4
	add.l	d5,d0
	move.l	d0,(a5)+
	move.w	d6,(a5)+
	subq.l	#6,d7
	bhi.s	L0031e2
	bra.s	L003200

L0031f4:
	add.l	(-$002a,a6),d0
	move.l	d0,(a5)+
	move.w	d6,(a5)+
	subq.l	#6,d7
	bhi.s	L0031e2
L003200:
	move.l	d2,d7
	beq.w	L0034ee
	move.l	(-$002a,a6),d0
	mulu.w	#$0012,d0
	add.l	(-$001e,a6),d0
	lea.l	(a4,d0.l),a5
L003216:
	move.l	(a3)+,d6
	cmp.l	#$2e626600,d6		;'.bf'<<8
	beq.w	L00333c
	cmp.l	#$2e656600,d6		;'.ef'<<8
	beq.w	L003366
	cmp.l	#$2e626200,d6		;'.bb'<<8
	beq.w	L00333c
	cmp.l	#$2e656200,d6		;'.eb'<<8
	beq.w	L003366
	cmp.l	#$2e656f73,d6		;'.eos'
	beq.w	L00338a
	cmp.l	#$2e66696c,d6		;'.fil'
	beq.w	L0033ae
	cmp.l	#$2e746578,d6		;'.tex'
	beq.w	L0033ae
	cmp.l	#$2e646174,d6		;'.dat'
	beq.w	L0033ae
	cmp.l	#$2e627373,d6		;'.bss'
	beq.w	L0033ae
	cmp.l	#$2e726461,d6		;'.rda'
	beq.w	L0033ae
	cmp.l	#$2e726273,d6		;'.rbs'
	beq.w	L0033ae
	cmp.l	#$2e726c64,d6		;'.rld'
	beq.w	L0033ae
	cmp.l	#$2e726c62,d6		;'.rlb'
	beq.w	L0033ae
	move.l	d6,(a5)+
	move.l	(a3)+,(a5)+
	tst.l	d6
	bne.s	L0032aa
	move.l	-(a5),d6
	add.l	(-$0022,a6),d6
	move.l	d6,(a5)+
L0032aa:
	move.b	($0009,a3),d0
	bne.w	L0033d6
	move.l	(a3)+,d6
	move.w	(a3)+,d0
	cmp.w	#$0001,d0
	bne.s	L0032c2
	add.l	($004e,a1),d6
	bra.s	L003326

L0032c2:
	cmp.w	#$0002,d0
	bne.s	L0032d2
	add.l	($0052,a1),d6
	sub.l	(L0068d4+$000004,pc),d6
	bra.s	L003326

L0032d2:
	cmp.w	#$0003,d0
	bne.s	L0032e2
	add.l	($0056,a1),d6
	sub.l	(L0068d4,pc),d6
	bra.s	L003326

L0032e2:
	cmp.w	#$0005,d0
	bne.s	L0032ee
	add.l	($005e,a1),d6
	bra.s	L003326

L0032ee:
	cmp.w	#$0006,d0
	bne.s	L0032fa
	add.l	($0062,a1),d6
	bra.s	L003326

L0032fa:
	cmp.w	#$0008,d0
	bne.s	L003306
	add.l	($006a,a1),d6
	bra.s	L003326

L003306:
	cmp.w	#$0009,d0
	bne.s	L003312
	add.l	($006e,a1),d6
	bra.s	L003326

L003312:
	cmpi.w	#$fffc,d0
	bcc.s	L003326
	cmpi.w	#$00fc,d0
	beq.s	L003326
	cmpi.w	#$00fd,d0
	bne.w	L003690
L003326:
	move.l	d6,(a5)+
	move.w	d0,(a5)+
	move.l	(a3)+,(a5)+
L00332c:
	moveq.l	#$12,d6
	sub.l	d6,d7
	bhi.w	L003216
	bcs.w	L003688
	bra.w	L0034ee

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
	bhi.s	L00332c
	bra.w	L003688

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
	bhi.s	L00332c
	bra.w	L003688

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
	bhi.s	L00332c
	bra.w	L003688

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
	beq.s	L0033c8
	add.l	(-$0022,a6),d0
L0033c8:
	move.l	d0,(a5)+
	moveq.l	#$12,d6
	sub.l	d6,d7
	bhi.w	L00332c
	bra.w	L003688

L0033d6:
	cmp.b	#$01,d0
	bne.w	L003690
	move.l	(a3)+,d6
	move.w	(a3)+,d0
	cmp.w	#$0001,d0
	bne.s	L0033ee
	add.l	($004e,a1),d6
	bra.s	L003462

L0033ee:
	cmp.w	#$0002,d0
	bne.s	L0033fe
	add.l	($0052,a1),d6
	sub.l	(L0068d4+$000004,pc),d6
	bra.s	L00346e

L0033fe:
	cmp.w	#$0003,d0
	bne.s	L00340e
	add.l	($0056,a1),d6
	sub.l	(L0068d4,pc),d6
	bra.s	L00346e

L00340e:
	cmp.w	#$0005,d0
	bne.s	L00341a
	add.l	($005e,a1),d6
	bra.s	L00346e

L00341a:
	cmp.w	#$0006,d0
	bne.s	L003426
	add.l	($0062,a1),d6
	bra.s	L00346e

L003426:
	cmp.w	#$0008,d0
	bne.s	L003432
	add.l	($006a,a1),d6
	bra.s	L00346e

L003432:
	cmp.w	#$0009,d0
	bne.s	L00343e
	add.l	($006e,a1),d6
	bra.s	L00346e

L00343e:
	cmpi.w	#$ffff,d0
	beq.s	L00346e
	cmpi.w	#$fffc,d0
	bcs.w	L003690
	move.w	(a3),d5
	cmp.w	#$0008,d5
	beq.s	L003492
	cmp.w	#$0009,d5
	beq.s	L003492
	cmp.w	#$000a,d5
	beq.s	L003492
	bra.s	L00346e

L003462:
	move.w	(a3),d5
	and.w	#$0030,d5
	cmp.w	#$0020,d5		;' '
	beq.s	L0034be
L00346e:
	move.l	d6,(a5)+
	move.w	d0,(a5)+
	move.l	(a3)+,(a5)+
	move.l	(a3)+,d0
	beq.s	L00347c
	add.l	(-$002a,a6),d0
L00347c:
	move.l	d0,(a5)+
	move.l	(a3)+,(a5)+
	move.l	(a3)+,(a5)+
	move.l	(a3)+,(a5)+
	move.w	(a3)+,(a5)+
	moveq.l	#$12,d6
	sub.l	d6,d7
	bhi.w	L00332c
	bra.w	L003688

L003492:
	move.l	d6,(a5)+
	move.w	d0,(a5)+
	move.l	(a3)+,(a5)+
	move.l	(a3)+,d0
	beq.s	L0034a0
	add.l	(-$002a,a6),d0
L0034a0:
	move.l	d0,(a5)+
	move.l	(a3)+,(a5)+
	move.l	(a3)+,(a5)+
	move.l	(a3)+,d0
	beq.s	L0034ae
	add.l	(-$002a,a6),d0
L0034ae:
	move.l	d0,(a5)+
	move.w	(a3)+,(a5)+
	moveq.l	#$12,d6
	sub.l	d6,d7
	bhi.w	L00332c
	bra.w	L003688

L0034be:
	move.l	d6,(a5)+
	move.w	d0,(a5)+
	move.l	(a3)+,(a5)+
	move.l	(a3)+,d0
	beq.s	L0034cc
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
	bhi.w	L00332c
	bra.w	L003688

L0034ee:
	move.l	d3,d7
	beq.w	L00363e
	move.l	(-$0026,a6),d0
	mulu.w	#$0012,d0
	add.l	(-$001a,a6),d0
	add.l	(-$001e,a6),d0
	lea.l	(a4,d0.l),a5
	move.l	(L0068d4,pc),d5
L00350c:
	move.l	(a3)+,d6
	move.l	d6,(a5)+
	move.l	(a3)+,(a5)+
	tst.l	d6
	bne.s	L00351e
	move.l	-(a5),d6
	add.l	(-$0022,a6),d6
	move.l	d6,(a5)+
L00351e:
	move.w	($0004,a3),d6
	cmpi.w	#$00fe,d6
	bhi.w	L003778
	cmpi.w	#$00fc,d6
	bcc.s	L003540
	cmpi.w	#$fffe,d6
	bhi.w	L003778
	cmpi.w	#$fffc,d6
	bcs.w	L0035d8
L003540:
	move.l	(-$0008,a5),d0
	beq.s	L003554
	lea.l	(L0068d4+$0001a4,pc),a0
	clr.b	(a0)
	move.l	(-$0004,a5),-(a0)
	move.l	d0,-(a0)
	bra.s	L003564

L003554:
	movea.l	($0014,a1),a0
	move.l	(a0)+,d0
	add.l	(a0)+,d0
	add.l	(-$0004,a3),d0
	lea.l	($04,a0,d0.l),a0
L003564:
	bsr.w	L002402
	tst.l	d0
	beq.w	L003690
	movea.l	d0,a0
	move.l	($000c,a0),d0
	move.w	($000a,a0),d6
	cmp.b	#$fe,d6
	beq.s	L003586
	cmp.b	#$fd,d6
	beq.s	L003590
	bra.s	L003598

L003586:
	sub.l	d5,d0
	move.l	d0,(a5)+
	move.w	#$0003,(a5)+
	bra.s	L00359e

L003590:
	move.l	d0,(a5)+
	move.w	#$0006,(a5)+
	bra.s	L00359e

L003598:
	move.l	d0,(a5)+
	move.w	#$0009,(a5)+
L00359e:
	addq.l	#6,a3
	move.l	(a3)+,(a5)+
L0035a2:
	move.b	(-$0001,a5),d0
	beq.s	L0035ca
	cmp.b	#$01,d0
	bne.w	L003690
	moveq.l	#$12,d6
	sub.l	d6,d7
	bls.w	L003688
	move.l	(a3)+,d0
	beq.s	L0035c0
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
	bhi.w	L00350c
	bcs.w	L003688
	bra.s	L00363e

L0035d8:
	cmp.w	#$0001,d6
	bne.s	L0035e4
	move.l	($004e,a1),d0
	bra.s	L003632

L0035e4:
	cmp.w	#$0002,d6
	bne.s	L0035f4
	move.l	($0052,a1),d0
	sub.l	(L0068d4+$000004,pc),d0
	bra.s	L003632

L0035f4:
	cmp.w	#$0003,d6
	bne.s	L003604
	move.l	($0056,a1),d0
	sub.l	(L0068d4,pc),d0
	bra.s	L003632

L003604:
	cmp.w	#$0005,d6
	bne.s	L003610
	move.l	($005e,a1),d0
	bra.s	L003632

L003610:
	cmp.w	#$0006,d6
	bne.s	L00361c
	move.l	($0062,a1),d0
	bra.s	L003632

L00361c:
	cmp.w	#$0008,d6
	bne.s	L003628
	move.l	($006a,a1),d0
	bra.s	L003632

L003628:
	cmp.w	#$0009,d6
	bne.s	L003690
	move.l	($006e,a1),d0
L003632:
	add.l	(a3)+,d0
	move.l	d0,(a5)+
	move.w	(a3)+,(a5)+
	move.l	(a3)+,(a5)+
	bra.w	L0035a2

L00363e:
	move.l	d4,d7
	beq.s	L00365c
	move.l	(-$0022,a6),d0
	add.l	(-$0016,a6),d0
	add.l	(-$001a,a6),d0
	add.l	(-$001e,a6),d0
	lea.l	(a4,d0.l),a5
L003656:
	move.b	(a3)+,(a5)+
	subq.l	#1,d7
	bne.s	L003656
L00365c:
	divu.w	#$0012,d2
	divu.w	#$0012,d3
	add.l	d1,(-$002e,a6)
	add.l	d2,(-$002a,a6)
	add.l	d3,(-$0026,a6)
	add.l	d4,(-$0022,a6)
L003674:
	addq.w	#4,a2
	bra.w	L0031ae

L00367a:
	movem.l	(sp)+,d1-d7/a0-a5
	movea.l	(L0068d4+$00007c,pc),a5
	move.l	(L0068d4+$000084,pc),d7
	rts

L003688:
	lea.l	(L003132,pc),a0
	bra.w	L0005aa

L003690:
	pea.l	(L0052e6,pc)
	DOS	_PRINT
	move.l	($0008,a1),-(sp)
	DOS	_PRINT
	addq.l	#8,sp
	move.l	($0004,a1),d0
	beq.s	L0036b2
	pea.l	(L00539d,pc)
	DOS	_PRINT
	move.l	($0004,a1),-(sp)
	DOS	_PRINT
	addq.l	#8,sp
L0036b2:
	bsr.w	L000c82
	lea.l	(L0068d4+$0005cc,pc),a0
	move.w	#$0001,(a0)
	movem.l	(sp)+,d1-d7/a0-a5
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
	bgt.w	L0037a4
	cmp.l	#$ffffff80,d1
	blt.w	L0037a4
	rts

L0036f8:
	cmp.l	#$0000007f,d1
	bgt.w	L0037a4
	cmp.l	#$ffffff80,d1
	blt.w	L0037a4
	rts

L00370e:
	cmp.l	#$0000ffff,d1
	bgt.w	L0037a4
	cmp.l	#$ffff8000,d1
	blt.w	L0037a4
	rts

L003724:
	cmp.l	#$00007fff,d1
	bgt.s	L0037a4
	cmp.l	#$ffff8000,d1
	blt.s	L0037a4
	rts

L003736:
	pea.l	(L0053a2,pc)
	DOS	_PRINT
	moveq.l	#$c0,d0
	add.l	a5,d0
	sub.l	(-$000c,a6),d0
	move.w	d5,d1
	subq.w	#1,d1
	beq.s	L003790
	subq.w	#1,d1
	beq.s	L003786
	subq.w	#3,d1
	beq.s	L00376e
	subq.w	#3,d1
	beq.s	L00375e
	lea.l	(L003736,pc),a0
	bra.w	L0005aa

L00375e:
	pea.l	(L0053c0,pc)
	sub.l	#$00010000,d0
	sub.l	($006a,a1),d0
	bra.s	L003778

L00376e:
	pea.l	(L0053b7,pc)
	sub.l	#$00008000,d0
L003778:
	sub.l	($005e,a1),d0
	sub.l	(L0068d4+$000008,pc),d0
	sub.l	(L0068d4+$000004,pc),d0
	bra.s	L003798

L003786:
	pea.l	(L0053af,pc)
	sub.l	($0052,a1),d0
	bra.s	L003798

L003790:
	pea.l	(L0053a7,pc)
	sub.l	($004e,a1),d0
L003798:
	bsr.w	L000ca2
	DOS	_PRINT
	addq.l	#8,sp
	bra.w	L000c82

L0037a4:
	movem.l	d0-d1/a0,-(sp)
	pea.l	(L005341,pc)
	bra.s	L0037ca

L0037ae:
	movem.l	d0-d1/a0,-(sp)
	pea.l	(L005315,pc)
	bra.s	L0037ca

L0037b8:
	movem.l	d0-d1/a0,-(sp)
	pea.l	(L00532a,pc)
	bra.s	L0037ca

L0037c2:
	movem.l	d0-d1/a0,-(sp)
	pea.l	(L005302,pc)
L0037ca:
	DOS	_PRINT
	addq.l	#4,sp
	bsr.s	L00380c
	bsr.w	L003736
L0037d4:
	lea.l	(L0068d4+$0005cc,pc),a0
	move.w	#$0001,(a0)
	movem.l	(sp)+,d0-d1/a0
	rts

L0037e2:
	movem.l	d0-d1/a0,-(sp)
	pea.l	(L005382,pc)
	DOS	_PRINT
	addq.l	#4,sp
	bsr.s	L00380c
	bra.s	L0037d4

L0037f2:
	pea.l	(L00534f,pc)
	bra.s	L0037fc

L0037f8:
	pea.l	(L005368,pc)
L0037fc:
	DOS	_PRINT
	addq.l	#4,sp
	bsr.s	L00380c
	bsr.w	L003736
	move.w	#$0001,-(sp)
	DOS	_EXIT2

L00380c:
	move.l	($0008,a1),-(sp)
	DOS	_PRINT
	move.l	($0004,a1),(sp)
	beq.s	L003822
	pea.l	(L00539d,pc)
	DOS	_PRINT
	addq.l	#4,sp
	DOS	_PRINT
L003822:
	addq.l	#4,sp
	bra.w	L000c82

L003828:
	addq.l	#2,a0
	andi.w	#$00ff,d1
	cmpi.w	#$0001,d5
	beq.s	L003846
	cmpi.w	#$0002,d5
	beq.s	L003846
	cmpi.w	#$0005,d5
	beq.s	L003846
	cmpi.w	#$0008,d5
	bne.s	L003856
L003846:
	move.b	(a0)+,(a5)+
	dbra.w	d1,L003846
L00384c:
	move.w	a0,d0
	andi.w	#$0001,d0
	adda.w	d0,a0
	rts

L003856:
	adda.w	d1,a0
	addq.l	#1,a0
	bra.s	L00384c

L00385c:
	tst.l	($0002,a0)
	bne.w	L002e64
	addq.l	#6,a0
	move.w	d5,d0
	subq.w	#1,d0
	beq.s	L00388a
	subq.w	#1,d0
	beq.s	L003884
	subq.w	#3,d0
	beq.s	L00387e
	subq.w	#3,d0
	bne.s	L00388e
	move.l	a5,(-$0032,a6)
	bra.s	L00388e

L00387e:
	move.l	a5,(-$0036,a6)
	bra.s	L00388e

L003884:
	move.l	a5,(-$003a,a6)
	bra.s	L00388e

L00388a:
	move.l	a5,(-$003e,a6)
L00388e:
	moveq.l	#$00,d5
	move.b	d1,d5
	subq.b	#1,d1
	beq.s	L0038b4
	subq.b	#1,d1
	beq.s	L0038ae
	subq.b	#3,d1
	beq.s	L0038a8
	subq.b	#3,d1
	bne.s	L0038a6
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
	beq.s	L0038d6
	cmpi.w	#$0002,d5
	beq.s	L0038d6
	cmpi.w	#$0005,d5
	beq.s	L0038d6
	cmpi.w	#$0008,d5
	bne.s	L0038e0
L0038d6:
	moveq.l	#$00,d0
L0038d8:
	subq.l	#1,d1
	bmi.s	L0038e2
	move.b	d0,(a5)+
	bra.s	L0038d8

L0038e0:
	adda.l	d1,a5
L0038e2:
	rts

L0038e4:
	movem.l	a3/a5,-(sp)
	lea.l	(L0068d4+$000048,pc),a3
L0038ec:
	addq.l	#2,a0
	move.l	(a0)+,d1
	add.l	($004e,a1),d1
	movea.l	(a3),a5
	subq.l	#6,d7
	bmi.w	L00054e
	addq.l	#6,(-$005a,a6)
	clr.w	(a4)+
	move.l	a5,(a4)+
	add.l	(L0068d4+$000098,pc),d1
	move.w	a5,-(sp)
	lsr.w	(sp)+
	bcc.s	L003910
	bsr.s	L003924
L003910:
	move.l	d1,(a5)+
	move.l	a5,(a3)
	movem.l	(sp)+,a3/a5
	rts

L00391a:
	movem.l	a3/a5,-(sp)
	lea.l	(L0068d4+$00004c,pc),a3
	bra.s	L0038ec

L003924:
	addq.l	#2,(sp)
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
	beq.s	L00394e
	cmpi.w	#$0002,d5
	beq.s	L00394e
	cmpi.w	#$0005,d5
	beq.s	L00394e
	cmpi.w	#$0008,d5
	bne.s	L003964
L00394e:
	bsr.w	L0036c6
	tst.w	d0
	beq.s	L00395c
	bsr.w	L0037c2
	bra.s	L003960

L00395c:
	bsr.w	L0036e2
L003960:
	clr.b	(a5)+
	move.b	d1,(a5)+
L003964:
	rts

L003966:
	addq.l	#2,a0
	move.w	(a0)+,d0
	cmpi.w	#$0001,d5
	beq.s	L003982
	cmpi.w	#$0002,d5
	beq.s	L003982
	cmpi.w	#$0005,d5
	beq.s	L003982
	cmpi.w	#$0008,d5
	bne.s	L003996
L003982:
	bsr.w	L0036c6
	tst.w	d0
	beq.s	L003990
	bsr.w	L0037c2
	bra.s	L003994

L003990:
	bsr.w	L0036e2
L003994:
	move.b	d1,(a5)+
L003996:
	rts

L003998:
	addq.l	#2,a0
	move.w	(a0)+,d0
	cmpi.w	#$0001,d5
	beq.s	L0039b4
	cmpi.w	#$0002,d5
	beq.s	L0039b4
	cmpi.w	#$0005,d5
	beq.s	L0039b4
	cmpi.w	#$0008,d5
	bne.s	L0039e4
L0039b4:
	bsr.w	L0036c6
	tst.w	d0
	beq.s	L0039da
	cmp.w	#$00fe,d0
	beq.s	L0039c8
	cmp.w	#$0004,d0
	bhi.s	L0039ce
L0039c8:
	bsr.w	L0037c2
	bra.s	L0039de

L0039ce:
	cmp.w	#$0004,d5
	bhi.s	L0039c8
	bsr.w	L003724
	bra.s	L0039de

L0039da:
	bsr.w	L00370e
L0039de:
	move.w	d1,-(sp)
	move.b	(sp)+,(a5)+
	move.b	d1,(a5)+
L0039e4:
	rts

L0039e6:
	addq.l	#2,a0
	move.w	(a0)+,d0
	cmpi.w	#$0001,d5
	beq.s	L003a02
	cmpi.w	#$0002,d5
	beq.s	L003a02
	cmpi.w	#$0005,d5
	beq.s	L003a02
	cmpi.w	#$0008,d5
	bne.s	L003a7a
L003a02:
	bsr.w	L0036c6
	tst.w	d0
	beq.s	L003a70
	cmp.w	#$0004,d0
	bls.s	L003a5e
	cmp.w	#$00fe,d0
	beq.s	L003a5e
	cmp.w	#$0004,d5
	bls.s	L003a70
	move.l	(-$0042,a6),d0
	cmp.l	(L0068d4+$000054,pc),d0
	beq.w	L002ea2
	addq.l	#4,(-$0042,a6)
	move.l	a4,d0
	movea.l	(-$0046,a6),a4
	suba.l	(-$004a,a6),a5
	cmpa.l	(L0068d4+$000038,pc),a5
	bcc.s	L003a48
	suba.l	(-$0052,a6),a5
	move.l	a5,(a4)+
	adda.l	(-$0052,a6),a5
	bra.s	L003a52

L003a48:
	suba.l	(-$004e,a6),a5
	move.l	a5,(a4)+
	adda.l	(-$004e,a6),a5
L003a52:
	move.l	a4,(-$0046,a6)
	movea.l	d0,a4
	adda.l	(-$004a,a6),a5
	bra.s	L003a70

L003a5e:
	subq.l	#6,d7
	bmi.w	L00054e
	addq.l	#6,(-$005a,a6)
	clr.w	(a4)+
	move.l	a5,(a4)+
	add.l	(L0068d4+$000098,pc),d1
L003a70:
	move.w	a5,-(sp)
	lsr.w	(sp)+
	bcs.w	L003926
	move.l	d1,(a5)+
L003a7a:
	rts

L003a7c:
	addq.l	#2,a0
	move.l	(a0)+,d1
	cmpi.w	#$0001,d5
	beq.s	L003a98
	cmpi.w	#$0002,d5
	beq.s	L003a98
	cmpi.w	#$0005,d5
	beq.s	L003a98
	cmpi.w	#$0008,d5
	bne.s	L003aa0
L003a98:
	bsr.w	L0036e2
	clr.b	(a5)+
	move.b	d1,(a5)+
L003aa0:
	rts

L003aa2:
	addq.l	#2,a0
	move.l	(a0)+,d1
	cmpi.w	#$0001,d5
	beq.s	L003abe
	cmpi.w	#$0002,d5
	beq.s	L003abe
	cmpi.w	#$0005,d5
	beq.s	L003abe
	cmpi.w	#$0008,d5
	bne.s	L003ac4
L003abe:
	bsr.w	L0036e2
	move.b	d1,(a5)+
L003ac4:
	rts

L003ac6:
	addq.l	#2,a0
	move.l	(a0)+,d1
	cmpi.w	#$0001,d5
	beq.s	L003ae2
	cmpi.w	#$0002,d5
	beq.s	L003ae2
	cmpi.w	#$0005,d5
	beq.s	L003ae2
	cmpi.w	#$0008,d5
	bne.s	L003aec
L003ae2:
	bsr.w	L00370e
	move.w	d1,-(sp)
	move.b	(sp)+,(a5)+
	move.b	d1,(a5)+
L003aec:
	rts

L003aee:
	addq.l	#2,a0
	move.l	(a0)+,d1
	cmpi.w	#$0001,d5
	beq.s	L003b0a
	cmpi.w	#$0002,d5
	beq.s	L003b0a
	cmpi.w	#$0005,d5
	beq.s	L003b0a
	cmpi.w	#$0008,d5
	bne.s	L003b14
L003b0a:
	move.w	a5,-(sp)
	lsr.w	(sp)+
	bcs.w	L003926
	move.l	d1,(a5)+
L003b14:
	rts

L003b16:
	addq.l	#6,a0
	cmpi.w	#$0001,d5
	beq.s	L003b30
	cmpi.w	#$0002,d5
	beq.s	L003b30
	cmpi.w	#$0005,d5
	beq.s	L003b30
	cmpi.w	#$0008,d5
	bne.s	L003b38
L003b30:
	bsr.w	L0037c2
	clr.b	(a5)+
	clr.b	(a5)+
L003b38:
	rts

L003b3a:
	addq.l	#6,a0
	cmpi.w	#$0001,d5
	beq.s	L003b54
	cmpi.w	#$0002,d5
	beq.s	L003b54
	cmpi.w	#$0005,d5
	beq.s	L003b54
	cmpi.w	#$0008,d5
	bne.s	L003b5a
L003b54:
	bsr.w	L0037c2
	clr.b	(a5)+
L003b5a:
	rts

L003b5c:
	addq.l	#2,a0
	move.l	(a0)+,d1
	cmpi.w	#$0001,d5
	beq.s	L003b78
	cmpi.w	#$0002,d5
	beq.s	L003b78
	cmpi.w	#$0005,d5
	beq.s	L003b78
	cmpi.w	#$0008,d5
	bne.s	L003b92
L003b78:
	add.l	($005e,a1),d1
	cmp.w	#$0004,d5
	bls.s	L003b88
	bsr.w	L0037c2
	bra.s	L003b8c

L003b88:
	bsr.w	L003724
L003b8c:
	move.w	d1,-(sp)
	move.b	(sp)+,(a5)+
	move.b	d1,(a5)+
L003b92:
	rts

L003b94:
	addq.l	#2,a0
	move.l	(a0)+,d1
	cmpi.w	#$0001,d5
	beq.s	L003bb0
	cmpi.w	#$0002,d5
	beq.s	L003bb0
	cmpi.w	#$0005,d5
	beq.s	L003bb0
	cmpi.w	#$0008,d5
	bne.s	L003bca
L003bb0:
	add.l	($0062,a1),d1
	cmp.w	#$0004,d5
	bls.s	L003bc0
	bsr.w	L0037c2
	bra.s	L003bc4

L003bc0:
	bsr.w	L003724
L003bc4:
	move.w	d1,-(sp)
	move.b	(sp)+,(a5)+
	move.b	d1,(a5)+
L003bca:
	rts

L003bcc:
	addq.l	#2,a0
	move.l	(a0)+,d1
	cmpi.w	#$0001,d5
	beq.s	L003be8
	cmpi.w	#$0002,d5
	beq.s	L003be8
	cmpi.w	#$0005,d5
	beq.s	L003be8
	cmpi.w	#$0008,d5
	bne.s	L003c02
L003be8:
	add.l	($0066,a1),d1
	cmp.w	#$0004,d5
	bls.s	L003bf8
	bsr.w	L0037c2
	bra.s	L003bfc

L003bf8:
	bsr.w	L003724
L003bfc:
	move.w	d1,-(sp)
	move.b	(sp)+,(a5)+
	move.b	d1,(a5)+
L003c02:
	rts

L003c04:
	addq.l	#2,a0
	move.l	(a0)+,d1
	cmpi.w	#$0001,d5
	beq.s	L003c20
	cmpi.w	#$0002,d5
	beq.s	L003c20
	cmpi.w	#$0005,d5
	beq.s	L003c20
	cmpi.w	#$0008,d5
	bne.s	L003c40
L003c20:
	add.l	($004e,a1),d1
	subq.l	#6,d7
	bmi.w	L00054e
	addq.l	#6,(-$005a,a6)
	clr.w	(a4)+
	move.l	a5,(a4)+
	add.l	(L0068d4+$000098,pc),d1
	move.w	a5,-(sp)
	lsr.w	(sp)+
	bcs.w	L003926
	move.l	d1,(a5)+
L003c40:
	rts

L003c42:
	addq.l	#2,a0
	move.l	(a0)+,d1
	cmpi.w	#$0001,d5
	beq.s	L003c5e
	cmpi.w	#$0002,d5
	beq.s	L003c5e
	cmpi.w	#$0005,d5
	beq.s	L003c5e
	cmpi.w	#$0008,d5
	bne.s	L003c7e
L003c5e:
	add.l	($0052,a1),d1
	subq.l	#6,d7
	bmi.w	L00054e
	addq.l	#6,(-$005a,a6)
	clr.w	(a4)+
	move.l	a5,(a4)+
	add.l	(L0068d4+$000098,pc),d1
	move.w	a5,-(sp)
	lsr.w	(sp)+
	bcs.w	L003926
	move.l	d1,(a5)+
L003c7e:
	rts

L003c80:
	addq.l	#2,a0
	move.l	(a0)+,d1
	cmpi.w	#$0001,d5
	beq.s	L003c9c
	cmpi.w	#$0002,d5
	beq.s	L003c9c
	cmpi.w	#$0005,d5
	beq.s	L003c9c
	cmpi.w	#$0008,d5
	bne.s	L003cbc
L003c9c:
	add.l	($0056,a1),d1
	subq.l	#6,d7
	bmi.w	L00054e
	addq.l	#6,(-$005a,a6)
	clr.w	(a4)+
	move.l	a5,(a4)+
	add.l	(L0068d4+$000098,pc),d1
	move.w	a5,-(sp)
	lsr.w	(sp)+
	bcs.w	L003926
	move.l	d1,(a5)+
L003cbc:
	rts

L003cbe:
	addq.l	#2,a0
	move.l	(a0)+,d1
	cmpi.w	#$0001,d5
	beq.s	L003cda
	cmpi.w	#$0002,d5
	beq.s	L003cda
	cmpi.w	#$0005,d5
	beq.s	L003cda
	cmpi.w	#$0008,d5
	bne.s	L003cfa
L003cda:
	add.l	($005a,a1),d1
	subq.l	#6,d7
	bmi.w	L00054e
	addq.l	#6,(-$005a,a6)
	clr.w	(a4)+
	move.l	a5,(a4)+
	add.l	(L0068d4+$000098,pc),d1
	move.w	a5,-(sp)
	lsr.w	(sp)+
	bcs.w	L003926
	move.l	d1,(a5)+
L003cfa:
	rts

L003cfc:
	addq.l	#2,a0
	move.l	(a0)+,d1
	cmpi.w	#$0001,d5
	beq.s	L003d18
	cmpi.w	#$0002,d5
	beq.s	L003d18
	cmpi.w	#$0005,d5
	beq.s	L003d18
	cmpi.w	#$0008,d5
	bne.s	L003d6c
L003d18:
	add.l	($005e,a1),d1
	cmp.w	#$0004,d5
	bls.s	L003d62
	move.l	(-$0042,a6),d0
	cmp.l	(L0068d4+$000054,pc),d0
	beq.w	L002ea2
	addq.l	#4,(-$0042,a6)
	move.l	a4,d0
	movea.l	(-$0046,a6),a4
	suba.l	(-$004a,a6),a5
	cmpa.l	(L0068d4+$000038,pc),a5
	bcc.s	L003d4e
	suba.l	(-$0052,a6),a5
	move.l	a5,(a4)+
	adda.l	(-$0052,a6),a5
	bra.s	L003d58

L003d4e:
	suba.l	(-$004e,a6),a5
	move.l	a5,(a4)+
	adda.l	(-$004e,a6),a5
L003d58:
	move.l	a4,(-$0046,a6)
	movea.l	d0,a4
	adda.l	(-$004a,a6),a5
L003d62:
	move.w	a5,-(sp)
	lsr.w	(sp)+
	bcs.w	L003926
	move.l	d1,(a5)+
L003d6c:
	rts

L003d6e:
	addq.l	#2,a0
	move.l	(a0)+,d1
	cmpi.w	#$0001,d5
	beq.s	L003d8a
	cmpi.w	#$0002,d5
	beq.s	L003d8a
	cmpi.w	#$0005,d5
	beq.s	L003d8a
	cmpi.w	#$0008,d5
	bne.s	L003dde
L003d8a:
	add.l	($0062,a1),d1
	cmp.w	#$0004,d5
	bls.s	L003dd4
	move.l	(-$0042,a6),d0
	cmp.l	(L0068d4+$000054,pc),d0
	beq.w	L002ea2
	addq.l	#4,(-$0042,a6)
	move.l	a4,d0
	movea.l	(-$0046,a6),a4
	suba.l	(-$004a,a6),a5
	cmpa.l	(L0068d4+$000038,pc),a5
	bcc.s	L003dc0
	suba.l	(-$0052,a6),a5
	move.l	a5,(a4)+
	adda.l	(-$0052,a6),a5
	bra.s	L003dca

L003dc0:
	suba.l	(-$004e,a6),a5
	move.l	a5,(a4)+
	adda.l	(-$004e,a6),a5
L003dca:
	move.l	a4,(-$0046,a6)
	movea.l	d0,a4
	adda.l	(-$004a,a6),a5
L003dd4:
	move.w	a5,-(sp)
	lsr.w	(sp)+
	bcs.w	L003926
	move.l	d1,(a5)+
L003dde:
	rts

L003de0:
	addq.l	#2,a0
	move.l	(a0)+,d1
	cmpi.w	#$0001,d5
	beq.s	L003dfc
	cmpi.w	#$0002,d5
	beq.s	L003dfc
	cmpi.w	#$0005,d5
	beq.s	L003dfc
	cmpi.w	#$0008,d5
	bne.s	L003e50
L003dfc:
	add.l	($0066,a1),d1
	cmp.w	#$0004,d5
	bls.s	L003e46
	move.l	(-$0042,a6),d0
	cmp.l	(L0068d4+$000054,pc),d0
	beq.w	L002ea2
	addq.l	#4,(-$0042,a6)
	move.l	a4,d0
	movea.l	(-$0046,a6),a4
	suba.l	(-$004a,a6),a5
	cmpa.l	(L0068d4+$000038,pc),a5
	bcc.s	L003e32
	suba.l	(-$0052,a6),a5
	move.l	a5,(a4)+
	adda.l	(-$0052,a6),a5
	bra.s	L003e3c

L003e32:
	suba.l	(-$004e,a6),a5
	move.l	a5,(a4)+
	adda.l	(-$004e,a6),a5
L003e3c:
	move.l	a4,(-$0046,a6)
	movea.l	d0,a4
	adda.l	(-$004a,a6),a5
L003e46:
	move.w	a5,-(sp)
	lsr.w	(sp)+
	bcs.w	L003926
	move.l	d1,(a5)+
L003e50:
	rts

L003e52:
	addq.l	#2,a0
	move.l	(a0)+,d1
	cmpi.w	#$0001,d5
	beq.s	L003e6e
	cmpi.w	#$0002,d5
	beq.s	L003e6e
	cmpi.w	#$0005,d5
	beq.s	L003e6e
	cmpi.w	#$0008,d5
	bne.s	L003ec2
L003e6e:
	add.l	($006a,a1),d1
	cmp.w	#$0004,d5
	bls.s	L003eb8
	move.l	(-$0042,a6),d0
	cmp.l	(L0068d4+$000054,pc),d0
	beq.w	L002ea2
	addq.l	#4,(-$0042,a6)
	move.l	a4,d0
	movea.l	(-$0046,a6),a4
	suba.l	(-$004a,a6),a5
	cmpa.l	(L0068d4+$000038,pc),a5
	bcc.s	L003ea4
	suba.l	(-$0052,a6),a5
	move.l	a5,(a4)+
	adda.l	(-$0052,a6),a5
	bra.s	L003eae

L003ea4:
	suba.l	(-$004e,a6),a5
	move.l	a5,(a4)+
	adda.l	(-$004e,a6),a5
L003eae:
	move.l	a4,(-$0046,a6)
	movea.l	d0,a4
	adda.l	(-$004a,a6),a5
L003eb8:
	move.w	a5,-(sp)
	lsr.w	(sp)+
	bcs.w	L003926
	move.l	d1,(a5)+
L003ec2:
	rts

L003ec4:
	addq.l	#2,a0
	move.l	(a0)+,d1
	cmpi.w	#$0001,d5
	beq.s	L003ee0
	cmpi.w	#$0002,d5
	beq.s	L003ee0
	cmpi.w	#$0005,d5
	beq.s	L003ee0
	cmpi.w	#$0008,d5
	bne.s	L003f34
L003ee0:
	add.l	($006e,a1),d1
	cmp.w	#$0004,d5
	bls.s	L003f2a
	move.l	(-$0042,a6),d0
	cmp.l	(L0068d4+$000054,pc),d0
	beq.w	L002ea2
	addq.l	#4,(-$0042,a6)
	move.l	a4,d0
	movea.l	(-$0046,a6),a4
	suba.l	(-$004a,a6),a5
	cmpa.l	(L0068d4+$000038,pc),a5
	bcc.s	L003f16
	suba.l	(-$0052,a6),a5
	move.l	a5,(a4)+
	adda.l	(-$0052,a6),a5
	bra.s	L003f20

L003f16:
	suba.l	(-$004e,a6),a5
	move.l	a5,(a4)+
	adda.l	(-$004e,a6),a5
L003f20:
	move.l	a4,(-$0046,a6)
	movea.l	d0,a4
	adda.l	(-$004a,a6),a5
L003f2a:
	move.w	a5,-(sp)
	lsr.w	(sp)+
	bcs.w	L003926
	move.l	d1,(a5)+
L003f34:
	rts

L003f36:
	addq.l	#2,a0
	move.l	(a0)+,d1
	cmpi.w	#$0001,d5
	beq.s	L003f52
	cmpi.w	#$0002,d5
	beq.s	L003f52
	cmpi.w	#$0005,d5
	beq.s	L003f52
	cmpi.w	#$0008,d5
	bne.s	L003fa6
L003f52:
	add.l	($0072,a1),d1
	cmp.w	#$0004,d5
	bls.s	L003f9c
	move.l	(-$0042,a6),d0
	cmp.l	(L0068d4+$000054,pc),d0
	beq.w	L002ea2
	addq.l	#4,(-$0042,a6)
	move.l	a4,d0
	movea.l	(-$0046,a6),a4
	suba.l	(-$004a,a6),a5
	cmpa.l	(L0068d4+$000038,pc),a5
	bcc.s	L003f88
	suba.l	(-$0052,a6),a5
	move.l	a5,(a4)+
	adda.l	(-$0052,a6),a5
	bra.s	L003f92

L003f88:
	suba.l	(-$004e,a6),a5
	move.l	a5,(a4)+
	adda.l	(-$004e,a6),a5
L003f92:
	move.l	a4,(-$0046,a6)
	movea.l	d0,a4
	adda.l	(-$004a,a6),a5
L003f9c:
	move.w	a5,-(sp)
	lsr.w	(sp)+
	bcs.w	L003926
	move.l	d1,(a5)+
L003fa6:
	rts

L003fa8:
	addq.l	#2,a0
	move.w	(a0)+,d0
	move.l	(a0)+,d2
	cmpi.w	#$0001,d5
	beq.s	L003fc6
	cmpi.w	#$0002,d5
	beq.s	L003fc6
	cmpi.w	#$0005,d5
	beq.s	L003fc6
	cmpi.w	#$0008,d5
	bne.s	L003fde
L003fc6:
	bsr.w	L0036c6
	add.l	d2,d1
	tst.w	d0
	beq.s	L003fd6
	bsr.w	L0037c2
	bra.s	L003fda

L003fd6:
	bsr.w	L0036e2
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
	beq.s	L003ffe
	cmpi.w	#$0002,d5
	beq.s	L003ffe
	cmpi.w	#$0005,d5
	beq.s	L003ffe
	cmpi.w	#$0008,d5
	bne.s	L004014
L003ffe:
	bsr.w	L0036c6
	add.l	d2,d1
	tst.w	d0
	beq.s	L00400e
	bsr.w	L0037c2
	bra.s	L004012

L00400e:
	bsr.w	L0036e2
L004012:
	move.b	d1,(a5)+
L004014:
	rts

L004016:
	addq.l	#2,a0
	move.w	(a0)+,d0
	move.l	(a0)+,d2
	cmpi.w	#$0001,d5
	beq.s	L004034
	cmpi.w	#$0002,d5
	beq.s	L004034
	cmpi.w	#$0005,d5
	beq.s	L004034
	cmpi.w	#$0008,d5
	bne.s	L004066
L004034:
	bsr.w	L0036c6
	add.l	d2,d1
	tst.w	d0
	beq.s	L00405c
	cmp.w	#$00fe,d0
	beq.s	L00404a
	cmp.w	#$0004,d0
	bhi.s	L004050
L00404a:
	bsr.w	L0037c2
	bra.s	L004060

L004050:
	cmp.w	#$0004,d5
	bhi.s	L00404a
	bsr.w	L003724
	bra.s	L004060

L00405c:
	bsr.w	L00370e
L004060:
	move.w	d1,-(sp)
	move.b	(sp)+,(a5)+
	move.b	d1,(a5)+
L004066:
	rts

L004068:
	addq.l	#2,a0
	move.w	(a0)+,d0
	move.l	(a0)+,d2
	cmpi.w	#$0001,d5
	beq.s	L004086
	cmpi.w	#$0002,d5
	beq.s	L004086
	cmpi.w	#$0005,d5
	beq.s	L004086
	cmpi.w	#$0008,d5
	bne.s	L004100
L004086:
	bsr.w	L0036c6
	add.l	d2,d1
	tst.w	d0
	beq.s	L0040f6
	cmp.w	#$0004,d0
	bls.s	L0040e4
	cmp.w	#$00fe,d0
	beq.s	L0040e4
	cmp.w	#$0004,d5
	bls.s	L0040f6
	move.l	(-$0042,a6),d0
	cmp.l	(L0068d4+$000054,pc),d0
	beq.w	L002ea2
	addq.l	#4,(-$0042,a6)
	move.l	a4,d0
	movea.l	(-$0046,a6),a4
	suba.l	(-$004a,a6),a5
	cmpa.l	(L0068d4+$000038,pc),a5
	bcc.s	L0040ce
	suba.l	(-$0052,a6),a5
	move.l	a5,(a4)+
	adda.l	(-$0052,a6),a5
	bra.s	L0040d8

L0040ce:
	suba.l	(-$004e,a6),a5
	move.l	a5,(a4)+
	adda.l	(-$004e,a6),a5
L0040d8:
	move.l	a4,(-$0046,a6)
	movea.l	d0,a4
	adda.l	(-$004a,a6),a5
	bra.s	L0040f6

L0040e4:
	subq.l	#6,d7
	bmi.w	L00054e
	addq.l	#6,(-$005a,a6)
	clr.w	(a4)+
	move.l	a5,(a4)+
	add.l	(L0068d4+$000098,pc),d1
L0040f6:
	move.w	a5,-(sp)
	lsr.w	(sp)+
	bcs.w	L003926
	move.l	d1,(a5)+
L004100:
	rts

L004102:
	addq.l	#2,a0
	move.l	(a0)+,d1
	add.l	(a0)+,d1
	cmpi.w	#$0001,d5
	beq.s	L004120
	cmpi.w	#$0002,d5
	beq.s	L004120
	cmpi.w	#$0005,d5
	beq.s	L004120
	cmpi.w	#$0008,d5
	bne.s	L004128
L004120:
	bsr.w	L0036e2
	clr.b	(a5)+
	move.b	d1,(a5)+
L004128:
	rts

L00412a:
	addq.l	#2,a0
	move.l	(a0)+,d1
	add.l	(a0)+,d1
	cmpi.w	#$0001,d5
	beq.s	L004148
	cmpi.w	#$0002,d5
	beq.s	L004148
	cmpi.w	#$0005,d5
	beq.s	L004148
	cmpi.w	#$0008,d5
	bne.s	L00414e
L004148:
	bsr.w	L0036e2
	move.b	d1,(a5)+
L00414e:
	rts

L004150:
	addq.l	#2,a0
	move.l	(a0)+,d1
	add.l	(a0)+,d1
	cmpi.w	#$0001,d5
	beq.s	L00416e
	cmpi.w	#$0002,d5
	beq.s	L00416e
	cmpi.w	#$0005,d5
	beq.s	L00416e
	cmpi.w	#$0008,d5
	bne.s	L004178
L00416e:
	bsr.w	L00370e
	move.w	d1,-(sp)
	move.b	(sp)+,(a5)+
	move.b	d1,(a5)+
L004178:
	rts

L00417a:
	addq.l	#2,a0
	move.l	(a0)+,d1
	add.l	(a0)+,d1
	cmpi.w	#$0001,d5
	beq.s	L004198
	cmpi.w	#$0002,d5
	beq.s	L004198
	cmpi.w	#$0005,d5
	beq.s	L004198
	cmpi.w	#$0008,d5
	bne.s	L0041a2
L004198:
	move.w	a5,-(sp)
	lsr.w	(sp)+
	bcs.w	L003926
	move.l	d1,(a5)+
L0041a2:
	rts

L0041a4:
	lea.l	($000a,a0),a0
	cmpi.w	#$0001,d5
	beq.s	L0041c0
	cmpi.w	#$0002,d5
	beq.s	L0041c0
	cmpi.w	#$0005,d5
	beq.s	L0041c0
	cmpi.w	#$0008,d5
	bne.s	L0041c8
L0041c0:
	bsr.w	L0037c2
	clr.b	(a5)+
	clr.b	(a5)+
L0041c8:
	rts

L0041ca:
	lea.l	($000a,a0),a0
	cmpi.w	#$0001,d5
	beq.s	L0041e6
	cmpi.w	#$0002,d5
	beq.s	L0041e6
	cmpi.w	#$0005,d5
	beq.s	L0041e6
	cmpi.w	#$0008,d5
	bne.s	L0041ec
L0041e6:
	bsr.w	L0037c2
	clr.b	(a5)+
L0041ec:
	rts

L0041ee:
	addq.l	#2,a0
	move.l	(a0)+,d1
	add.l	(a0)+,d1
	cmpi.w	#$0001,d5
	beq.s	L00420c
	cmpi.w	#$0002,d5
	beq.s	L00420c
	cmpi.w	#$0005,d5
	beq.s	L00420c
	cmpi.w	#$0008,d5
	bne.s	L004226
L00420c:
	add.l	($005e,a1),d1
	cmp.w	#$0004,d5
	bls.s	L00421c
	bsr.w	L0037c2
	bra.s	L004220

L00421c:
	bsr.w	L003724
L004220:
	move.w	d1,-(sp)
	move.b	(sp)+,(a5)+
	move.b	d1,(a5)+
L004226:
	rts

L004228:
	addq.l	#2,a0
	move.l	(a0)+,d1
	add.l	(a0)+,d1
	cmpi.w	#$0001,d5
	beq.s	L004246
	cmpi.w	#$0002,d5
	beq.s	L004246
	cmpi.w	#$0005,d5
	beq.s	L004246
	cmpi.w	#$0008,d5
	bne.s	L004260
L004246:
	add.l	($0062,a1),d1
	cmp.w	#$0004,d5
	bls.s	L004256
	bsr.w	L0037c2
	bra.s	L00425a

L004256:
	bsr.w	L003724
L00425a:
	move.w	d1,-(sp)
	move.b	(sp)+,(a5)+
	move.b	d1,(a5)+
L004260:
	rts

L004262:
	addq.l	#2,a0
	move.l	(a0)+,d1
	add.l	(a0)+,d1
	cmpi.w	#$0001,d5
	beq.s	L004280
	cmpi.w	#$0002,d5
	beq.s	L004280
	cmpi.w	#$0005,d5
	beq.s	L004280
	cmpi.w	#$0008,d5
	bne.s	L00429a
L004280:
	add.l	($0066,a1),d1
	cmp.w	#$0004,d5
	bls.s	L004290
	bsr.w	L0037c2
	bra.s	L004294

L004290:
	bsr.w	L003724
L004294:
	move.w	d1,-(sp)
	move.b	(sp)+,(a5)+
	move.b	d1,(a5)+
L00429a:
	rts

L00429c:
	addq.l	#2,a0
	move.l	(a0)+,d1
	add.l	(a0)+,d1
	cmpi.w	#$0001,d5
	beq.s	L0042ba
	cmpi.w	#$0002,d5
	beq.s	L0042ba
	cmpi.w	#$0005,d5
	beq.s	L0042ba
	cmpi.w	#$0008,d5
	bne.s	L0042da
L0042ba:
	add.l	($004e,a1),d1
	subq.l	#6,d7
	bmi.w	L00054e
	addq.l	#6,(-$005a,a6)
	clr.w	(a4)+
	move.l	a5,(a4)+
	add.l	(L0068d4+$000098,pc),d1
	move.w	a5,-(sp)
	lsr.w	(sp)+
	bcs.w	L003926
	move.l	d1,(a5)+
L0042da:
	rts

L0042dc:
	addq.l	#2,a0
	move.l	(a0)+,d1
	add.l	(a0)+,d1
	cmpi.w	#$0001,d5
	beq.s	L0042fa
	cmpi.w	#$0002,d5
	beq.s	L0042fa
	cmpi.w	#$0005,d5
	beq.s	L0042fa
	cmpi.w	#$0008,d5
	bne.s	L00431a
L0042fa:
	add.l	($0052,a1),d1
	subq.l	#6,d7
	bmi.w	L00054e
	addq.l	#6,(-$005a,a6)
	clr.w	(a4)+
	move.l	a5,(a4)+
	add.l	(L0068d4+$000098,pc),d1
	move.w	a5,-(sp)
	lsr.w	(sp)+
	bcs.w	L003926
	move.l	d1,(a5)+
L00431a:
	rts

L00431c:
	addq.l	#2,a0
	move.l	(a0)+,d1
	add.l	(a0)+,d1
	cmpi.w	#$0001,d5
	beq.s	L00433a
	cmpi.w	#$0002,d5
	beq.s	L00433a
	cmpi.w	#$0005,d5
	beq.s	L00433a
	cmpi.w	#$0008,d5
	bne.s	L00435a
L00433a:
	add.l	($0056,a1),d1
	subq.l	#6,d7
	bmi.w	L00054e
	addq.l	#6,(-$005a,a6)
	clr.w	(a4)+
	move.l	a5,(a4)+
	add.l	(L0068d4+$000098,pc),d1
	move.w	a5,-(sp)
	lsr.w	(sp)+
	bcs.w	L003926
	move.l	d1,(a5)+
L00435a:
	rts

L00435c:
	addq.l	#2,a0
	move.l	(a0)+,d1
	add.l	(a0)+,d1
	cmpi.w	#$0001,d5
	beq.s	L00437a
	cmpi.w	#$0002,d5
	beq.s	L00437a
	cmpi.w	#$0005,d5
	beq.s	L00437a
	cmpi.w	#$0008,d5
	bne.s	L00439a
L00437a:
	add.l	($005a,a1),d1
	subq.l	#6,d7
	bmi.w	L00054e
	addq.l	#6,(-$005a,a6)
	clr.w	(a4)+
	move.l	a5,(a4)+
	add.l	(L0068d4+$000098,pc),d1
	move.w	a5,-(sp)
	lsr.w	(sp)+
	bcs.w	L003926
	move.l	d1,(a5)+
L00439a:
	rts

L00439c:
	addq.l	#2,a0
	move.l	(a0)+,d1
	add.l	(a0)+,d1
	cmpi.w	#$0001,d5
	beq.s	L0043ba
	cmpi.w	#$0002,d5
	beq.s	L0043ba
	cmpi.w	#$0005,d5
	beq.s	L0043ba
	cmpi.w	#$0008,d5
	bne.s	L00440e
L0043ba:
	add.l	($005e,a1),d1
	cmp.w	#$0004,d5
	bls.s	L004404
	move.l	(-$0042,a6),d0
	cmp.l	(L0068d4+$000054,pc),d0
	beq.w	L002ea2
	addq.l	#4,(-$0042,a6)
	move.l	a4,d0
	movea.l	(-$0046,a6),a4
	suba.l	(-$004a,a6),a5
	cmpa.l	(L0068d4+$000038,pc),a5
	bcc.s	L0043f0
	suba.l	(-$0052,a6),a5
	move.l	a5,(a4)+
	adda.l	(-$0052,a6),a5
	bra.s	L0043fa

L0043f0:
	suba.l	(-$004e,a6),a5
	move.l	a5,(a4)+
	adda.l	(-$004e,a6),a5
L0043fa:
	move.l	a4,(-$0046,a6)
	movea.l	d0,a4
	adda.l	(-$004a,a6),a5
L004404:
	move.w	a5,-(sp)
	lsr.w	(sp)+
	bcs.w	L003926
	move.l	d1,(a5)+
L00440e:
	rts

L004410:
	addq.l	#2,a0
	move.l	(a0)+,d1
	add.l	(a0)+,d1
	cmpi.w	#$0001,d5
	beq.s	L00442e
	cmpi.w	#$0002,d5
	beq.s	L00442e
	cmpi.w	#$0005,d5
	beq.s	L00442e
	cmpi.w	#$0008,d5
	bne.s	L004482
L00442e:
	add.l	($0062,a1),d1
	cmp.w	#$0004,d5
	bls.s	L004478
	move.l	(-$0042,a6),d0
	cmp.l	(L0068d4+$000054,pc),d0
	beq.w	L002ea2
	addq.l	#4,(-$0042,a6)
	move.l	a4,d0
	movea.l	(-$0046,a6),a4
	suba.l	(-$004a,a6),a5
	cmpa.l	(L0068d4+$000038,pc),a5
	bcc.s	L004464
	suba.l	(-$0052,a6),a5
	move.l	a5,(a4)+
	adda.l	(-$0052,a6),a5
	bra.s	L00446e

L004464:
	suba.l	(-$004e,a6),a5
	move.l	a5,(a4)+
	adda.l	(-$004e,a6),a5
L00446e:
	move.l	a4,(-$0046,a6)
	movea.l	d0,a4
	adda.l	(-$004a,a6),a5
L004478:
	move.w	a5,-(sp)
	lsr.w	(sp)+
	bcs.w	L003926
	move.l	d1,(a5)+
L004482:
	rts

L004484:
	addq.l	#2,a0
	move.l	(a0)+,d1
	add.l	(a0)+,d1
	cmpi.w	#$0001,d5
	beq.s	L0044a2
	cmpi.w	#$0002,d5
	beq.s	L0044a2
	cmpi.w	#$0005,d5
	beq.s	L0044a2
	cmpi.w	#$0008,d5
	bne.s	L0044f6
L0044a2:
	add.l	($0066,a1),d1
	cmp.w	#$0004,d5
	bls.s	L0044ec
	move.l	(-$0042,a6),d0
	cmp.l	(L0068d4+$000054,pc),d0
	beq.w	L002ea2
	addq.l	#4,(-$0042,a6)
	move.l	a4,d0
	movea.l	(-$0046,a6),a4
	suba.l	(-$004a,a6),a5
	cmpa.l	(L0068d4+$000038,pc),a5
	bcc.s	L0044d8
	suba.l	(-$0052,a6),a5
	move.l	a5,(a4)+
	adda.l	(-$0052,a6),a5
	bra.s	L0044e2

L0044d8:
	suba.l	(-$004e,a6),a5
	move.l	a5,(a4)+
	adda.l	(-$004e,a6),a5
L0044e2:
	move.l	a4,(-$0046,a6)
	movea.l	d0,a4
	adda.l	(-$004a,a6),a5
L0044ec:
	move.w	a5,-(sp)
	lsr.w	(sp)+
	bcs.w	L003926
	move.l	d1,(a5)+
L0044f6:
	rts

L0044f8:
	addq.l	#2,a0
	move.l	(a0)+,d1
	add.l	(a0)+,d1
	cmpi.w	#$0001,d5
	beq.s	L004516
	cmpi.w	#$0002,d5
	beq.s	L004516
	cmpi.w	#$0005,d5
	beq.s	L004516
	cmpi.w	#$0008,d5
	bne.s	L00456a
L004516:
	add.l	($006a,a1),d1
	cmp.w	#$0004,d5
	bls.s	L004560
	move.l	(-$0042,a6),d0
	cmp.l	(L0068d4+$000054,pc),d0
	beq.w	L002ea2
	addq.l	#4,(-$0042,a6)
	move.l	a4,d0
	movea.l	(-$0046,a6),a4
	suba.l	(-$004a,a6),a5
	cmpa.l	(L0068d4+$000038,pc),a5
	bcc.s	L00454c
	suba.l	(-$0052,a6),a5
	move.l	a5,(a4)+
	adda.l	(-$0052,a6),a5
	bra.s	L004556

L00454c:
	suba.l	(-$004e,a6),a5
	move.l	a5,(a4)+
	adda.l	(-$004e,a6),a5
L004556:
	move.l	a4,(-$0046,a6)
	movea.l	d0,a4
	adda.l	(-$004a,a6),a5
L004560:
	move.w	a5,-(sp)
	lsr.w	(sp)+
	bcs.w	L003926
	move.l	d1,(a5)+
L00456a:
	rts

L00456c:
	addq.l	#2,a0
	move.l	(a0)+,d1
	add.l	(a0)+,d1
	cmpi.w	#$0001,d5
	beq.s	L00458a
	cmpi.w	#$0002,d5
	beq.s	L00458a
	cmpi.w	#$0005,d5
	beq.s	L00458a
	cmpi.w	#$0008,d5
	bne.s	L0045de
L00458a:
	add.l	($006e,a1),d1
	cmp.w	#$0004,d5
	bls.s	L0045d4
	move.l	(-$0042,a6),d0
	cmp.l	(L0068d4+$000054,pc),d0
	beq.w	L002ea2
	addq.l	#4,(-$0042,a6)
	move.l	a4,d0
	movea.l	(-$0046,a6),a4
	suba.l	(-$004a,a6),a5
	cmpa.l	(L0068d4+$000038,pc),a5
	bcc.s	L0045c0
	suba.l	(-$0052,a6),a5
	move.l	a5,(a4)+
	adda.l	(-$0052,a6),a5
	bra.s	L0045ca

L0045c0:
	suba.l	(-$004e,a6),a5
	move.l	a5,(a4)+
	adda.l	(-$004e,a6),a5
L0045ca:
	move.l	a4,(-$0046,a6)
	movea.l	d0,a4
	adda.l	(-$004a,a6),a5
L0045d4:
	move.w	a5,-(sp)
	lsr.w	(sp)+
	bcs.w	L003926
	move.l	d1,(a5)+
L0045de:
	rts

L0045e0:
	addq.l	#2,a0
	move.l	(a0)+,d1
	add.l	(a0)+,d1
	cmpi.w	#$0001,d5
	beq.s	L0045fe
	cmpi.w	#$0002,d5
	beq.s	L0045fe
	cmpi.w	#$0005,d5
	beq.s	L0045fe
	cmpi.w	#$0008,d5
	bne.s	L004652
L0045fe:
	add.l	($0072,a1),d1
	cmp.w	#$0004,d5
	bls.s	L004648
	move.l	(-$0042,a6),d0
	cmp.l	(L0068d4+$000054,pc),d0
	beq.w	L002ea2
	addq.l	#4,(-$0042,a6)
	move.l	a4,d0
	movea.l	(-$0046,a6),a4
	suba.l	(-$004a,a6),a5
	cmpa.l	(L0068d4+$000038,pc),a5
	bcc.s	L004634
	suba.l	(-$0052,a6),a5
	move.l	a5,(a4)+
	adda.l	(-$0052,a6),a5
	bra.s	L00463e

L004634:
	suba.l	(-$004e,a6),a5
	move.l	a5,(a4)+
	adda.l	(-$004e,a6),a5
L00463e:
	move.l	a4,(-$0046,a6)
	movea.l	d0,a4
	adda.l	(-$004a,a6),a5
L004648:
	move.w	a5,-(sp)
	lsr.w	(sp)+
	bcs.w	L003926
	move.l	d1,(a5)+
L004652:
	rts

L004654:
	addq.l	#2,a0
	move.l	(a0)+,d2
	add.l	($004e,a1),d2
	move.w	(a0)+,d0
	cmpi.w	#$0001,d5
	beq.s	L004676
	cmpi.w	#$0002,d5
	beq.s	L004676
	cmpi.w	#$0005,d5
	beq.s	L004676
	cmpi.w	#$0008,d5
	bne.s	L00469c
L004676:
	bsr.w	L0036c6
	sub.l	d2,d1
	tst.w	d0
	beq.s	L00468c
	cmp.w	#$00fe,d0
	beq.s	L004692
	cmp.w	#$0004,d0
	bls.s	L004692
L00468c:
	bsr.w	L0037c2
	bra.s	L004696

L004692:
	bsr.w	L003724
L004696:
	move.w	d1,-(sp)
	move.b	(sp)+,(a5)+
	move.b	d1,(a5)+
L00469c:
	rts

L00469e:
	addq.l	#2,a0
	move.l	(a0)+,d2
	add.l	($0052,a1),d2
	move.w	(a0)+,d0
	cmpi.w	#$0001,d5
	beq.s	L0046c0
	cmpi.w	#$0002,d5
	beq.s	L0046c0
	cmpi.w	#$0005,d5
	beq.s	L0046c0
	cmpi.w	#$0008,d5
	bne.s	L0046e6
L0046c0:
	bsr.w	L0036c6
	sub.l	d2,d1
	tst.w	d0
	beq.s	L0046d6
	cmp.w	#$00fe,d0
	beq.s	L0046dc
	cmp.w	#$0004,d0
	bls.s	L0046dc
L0046d6:
	bsr.w	L0037c2
	bra.s	L0046e0

L0046dc:
	bsr.w	L003724
L0046e0:
	move.w	d1,-(sp)
	move.b	(sp)+,(a5)+
	move.b	d1,(a5)+
L0046e6:
	rts

L0046e8:
	addq.l	#2,a0
	move.l	(a0)+,d2
	add.l	($0056,a1),d2
	move.w	(a0)+,d0
	cmpi.w	#$0001,d5
	beq.s	L00470a
	cmpi.w	#$0002,d5
	beq.s	L00470a
	cmpi.w	#$0005,d5
	beq.s	L00470a
	cmpi.w	#$0008,d5
	bne.s	L004730
L00470a:
	bsr.w	L0036c6
	sub.l	d2,d1
	tst.w	d0
	beq.s	L004720
	cmp.w	#$00fe,d0
	beq.s	L004726
	cmp.w	#$0004,d0
	bls.s	L004726
L004720:
	bsr.w	L0037c2
	bra.s	L00472a

L004726:
	bsr.w	L003724
L00472a:
	move.w	d1,-(sp)
	move.b	(sp)+,(a5)+
	move.b	d1,(a5)+
L004730:
	rts

L004732:
	addq.l	#2,a0
	move.l	(a0)+,d2
	add.l	($005a,a1),d2
	move.w	(a0)+,d0
	cmpi.w	#$0001,d5
	beq.s	L004754
	cmpi.w	#$0002,d5
	beq.s	L004754
	cmpi.w	#$0005,d5
	beq.s	L004754
	cmpi.w	#$0008,d5
	bne.s	L00477a
L004754:
	bsr.w	L0036c6
	sub.l	d2,d1
	tst.w	d0
	beq.s	L00476a
	cmp.w	#$00fe,d0
	beq.s	L004770
	cmp.w	#$0004,d0
	bls.s	L004770
L00476a:
	bsr.w	L0037c2
	bra.s	L004774

L004770:
	bsr.w	L003724
L004774:
	move.w	d1,-(sp)
	move.b	(sp)+,(a5)+
	move.b	d1,(a5)+
L00477a:
	rts

L00477c:
	addq.l	#2,a0
	move.l	(a0)+,d2
	add.l	($005e,a1),d2
	move.w	(a0)+,d0
	cmpi.w	#$0001,d5
	beq.s	L00479e
	cmpi.w	#$0002,d5
	beq.s	L00479e
	cmpi.w	#$0005,d5
	beq.s	L00479e
	cmpi.w	#$0008,d5
	bne.s	L0047c0
L00479e:
	bsr.w	L0036c6
	sub.l	d2,d1
	cmp.w	#$00fe,d0
	beq.s	L0047b0
	cmp.w	#$0004,d0
	bhi.s	L0047b6
L0047b0:
	bsr.w	L0037c2
	bra.s	L0047ba

L0047b6:
	bsr.w	L003724
L0047ba:
	move.w	d1,-(sp)
	move.b	(sp)+,(a5)+
	move.b	d1,(a5)+
L0047c0:
	rts

L0047c2:
	addq.l	#2,a0
	move.l	(a0)+,d2
	add.l	($0062,a1),d2
	move.w	(a0)+,d0
	cmpi.w	#$0001,d5
	beq.s	L0047e4
	cmpi.w	#$0002,d5
	beq.s	L0047e4
	cmpi.w	#$0005,d5
	beq.s	L0047e4
	cmpi.w	#$0008,d5
	bne.s	L004806
L0047e4:
	bsr.w	L0036c6
	sub.l	d2,d1
	cmp.w	#$00fe,d0
	beq.s	L0047f6
	cmp.w	#$0004,d0
	bhi.s	L0047fc
L0047f6:
	bsr.w	L0037c2
	bra.s	L004800

L0047fc:
	bsr.w	L003724
L004800:
	move.w	d1,-(sp)
	move.b	(sp)+,(a5)+
	move.b	d1,(a5)+
L004806:
	rts

L004808:
	addq.l	#2,a0
	move.l	(a0)+,d2
	add.l	($0066,a1),d2
	move.w	(a0)+,d0
	cmpi.w	#$0001,d5
	beq.s	L00482a
	cmpi.w	#$0002,d5
	beq.s	L00482a
	cmpi.w	#$0005,d5
	beq.s	L00482a
	cmpi.w	#$0008,d5
	bne.s	L00484c
L00482a:
	bsr.w	L0036c6
	sub.l	d2,d1
	cmp.w	#$00fe,d0
	beq.s	L00483c
	cmp.w	#$0004,d0
	bhi.s	L004842
L00483c:
	bsr.w	L0037c2
	bra.s	L004846

L004842:
	bsr.w	L003724
L004846:
	move.w	d1,-(sp)
	move.b	(sp)+,(a5)+
	move.b	d1,(a5)+
L00484c:
	rts

L00484e:
	addq.l	#2,a0
	move.l	(a0)+,d2
	add.l	($006a,a1),d2
	move.w	(a0)+,d0
	cmpi.w	#$0001,d5
	beq.s	L004870
	cmpi.w	#$0002,d5
	beq.s	L004870
	cmpi.w	#$0005,d5
	beq.s	L004870
	cmpi.w	#$0008,d5
	bne.s	L004892
L004870:
	bsr.w	L0036c6
	sub.l	d2,d1
	cmp.w	#$00fe,d0
	beq.s	L004882
	cmp.w	#$0004,d0
	bhi.s	L004888
L004882:
	bsr.w	L0037c2
	bra.s	L00488c

L004888:
	bsr.w	L003724
L00488c:
	move.w	d1,-(sp)
	move.b	(sp)+,(a5)+
	move.b	d1,(a5)+
L004892:
	rts

L004894:
	addq.l	#2,a0
	move.l	(a0)+,d2
	add.l	($006e,a1),d2
	move.w	(a0)+,d0
	cmpi.w	#$0001,d5
	beq.s	L0048b6
	cmpi.w	#$0002,d5
	beq.s	L0048b6
	cmpi.w	#$0005,d5
	beq.s	L0048b6
	cmpi.w	#$0008,d5
	bne.s	L0048d8
L0048b6:
	bsr.w	L0036c6
	sub.l	d2,d1
	cmp.w	#$00fe,d0
	bhi.s	L0048c8
	cmp.w	#$0004,d0
	bhi.s	L0048ce
L0048c8:
	bsr.w	L0037c2
	bra.s	L0048d2

L0048ce:
	bsr.w	L003724
L0048d2:
	move.w	d1,-(sp)
	move.b	(sp)+,(a5)+
	move.b	d1,(a5)+
L0048d8:
	rts

L0048da:
	addq.l	#2,a0
	move.l	(a0)+,d2
	add.l	($0072,a1),d2
	move.w	(a0)+,d0
	cmpi.w	#$0001,d5
	beq.s	L0048fc
	cmpi.w	#$0002,d5
	beq.s	L0048fc
	cmpi.w	#$0005,d5
	beq.s	L0048fc
	cmpi.w	#$0008,d5
	bne.s	L00491e
L0048fc:
	bsr.w	L0036c6
	sub.l	d2,d1
	cmp.w	#$00fe,d0
	beq.s	L00490e
	cmp.w	#$0004,d0
	bhi.s	L004914
L00490e:
	bsr.w	L0037c2
	bra.s	L004918

L004914:
	bsr.w	L003724
L004918:
	move.w	d1,-(sp)
	move.b	(sp)+,(a5)+
	move.b	d1,(a5)+
L00491e:
	rts

L004920:
	addq.l	#2,a0
	move.l	(a0)+,d2
	add.l	($004e,a1),d2
	move.w	(a0)+,d0
	cmpi.w	#$0001,d5
	beq.s	L004942
	cmpi.w	#$0002,d5
	beq.s	L004942
	cmpi.w	#$0005,d5
	beq.s	L004942
	cmpi.w	#$0008,d5
	bne.s	L004964
L004942:
	bsr.w	L0036c6
	sub.l	d2,d1
	tst.w	d0
	beq.s	L004958
	cmp.w	#$00fe,d0
	beq.s	L00495e
	cmp.w	#$0004,d0
	bls.s	L00495e
L004958:
	bsr.w	L0037c2
	bra.s	L004962

L00495e:
	bsr.w	L0036f8
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
	beq.s	L004988
	cmpi.w	#$0002,d5
	beq.s	L004988
	cmpi.w	#$0005,d5
	beq.s	L004988
	cmpi.w	#$0008,d5
	bne.s	L0049aa
L004988:
	bsr.w	L0036c6
	sub.l	d2,d1
	tst.w	d0
	beq.s	L00499e
	cmp.w	#$00fe,d0
	beq.s	L0049a4
	cmp.w	#$0004,d0
	bls.s	L0049a4
L00499e:
	bsr.w	L0037c2
	bra.s	L0049a8

L0049a4:
	bsr.w	L0036f8
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
	beq.s	L0049ce
	cmpi.w	#$0002,d5
	beq.s	L0049ce
	cmpi.w	#$0005,d5
	beq.s	L0049ce
	cmpi.w	#$0008,d5
	bne.s	L0049f0
L0049ce:
	bsr.w	L0036c6
	sub.l	d2,d1
	tst.w	d0
	beq.s	L0049e4
	cmp.w	#$00fe,d0
	beq.s	L0049ea
	cmp.w	#$0004,d0
	bls.s	L0049ea
L0049e4:
	bsr.w	L0037c2
	bra.s	L0049ee

L0049ea:
	bsr.w	L0036f8
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
	beq.s	L004a14
	cmpi.w	#$0002,d5
	beq.s	L004a14
	cmpi.w	#$0005,d5
	beq.s	L004a14
	cmpi.w	#$0008,d5
	bne.s	L004a36
L004a14:
	bsr.w	L0036c6
	sub.l	d2,d1
	tst.w	d0
	beq.s	L004a2a
	cmp.w	#$00fe,d0
	beq.s	L004a30
	cmp.w	#$0004,d0
	bls.s	L004a30
L004a2a:
	bsr.w	L0037c2
	bra.s	L004a34

L004a30:
	bsr.w	L0036f8
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
	beq.s	L004a5a
	cmpi.w	#$0002,d5
	beq.s	L004a5a
	cmpi.w	#$0005,d5
	beq.s	L004a5a
	cmpi.w	#$0008,d5
	bne.s	L004a78
L004a5a:
	bsr.w	L0036c6
	sub.l	d2,d1
	cmp.w	#$00fe,d0
	beq.s	L004a6c
	cmp.w	#$0004,d0
	bhi.s	L004a72
L004a6c:
	bsr.w	L0037c2
	bra.s	L004a76

L004a72:
	bsr.w	L0036f8
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
	beq.s	L004a9c
	cmpi.w	#$0002,d5
	beq.s	L004a9c
	cmpi.w	#$0005,d5
	beq.s	L004a9c
	cmpi.w	#$0008,d5
	bne.s	L004aba
L004a9c:
	bsr.w	L0036c6
	sub.l	d2,d1
	cmp.w	#$00fe,d0
	beq.s	L004aae
	cmp.w	#$0004,d0
	bhi.s	L004ab4
L004aae:
	bsr.w	L0037c2
	bra.s	L004ab8

L004ab4:
	bsr.w	L0036f8
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
	beq.s	L004ade
	cmpi.w	#$0002,d5
	beq.s	L004ade
	cmpi.w	#$0005,d5
	beq.s	L004ade
	cmpi.w	#$0008,d5
	bne.s	L004afc
L004ade:
	bsr.w	L0036c6
	sub.l	d2,d1
	cmp.w	#$00fe,d0
	beq.s	L004af0
	cmp.w	#$0004,d0
	bhi.s	L004af6
L004af0:
	bsr.w	L0037c2
	bra.s	L004afa

L004af6:
	bsr.w	L0036f8
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
	beq.s	L004b20
	cmpi.w	#$0002,d5
	beq.s	L004b20
	cmpi.w	#$0005,d5
	beq.s	L004b20
	cmpi.w	#$0008,d5
	bne.s	L004b3e
L004b20:
	bsr.w	L0036c6
	sub.l	d2,d1
	cmp.w	#$00fe,d0
	beq.s	L004b32
	cmp.w	#$0004,d0
	bhi.s	L004b38
L004b32:
	bsr.w	L0037c2
	bra.s	L004b3c

L004b38:
	bsr.w	L0036f8
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
	beq.s	L004b62
	cmpi.w	#$0002,d5
	beq.s	L004b62
	cmpi.w	#$0005,d5
	beq.s	L004b62
	cmpi.w	#$0008,d5
	bne.s	L004b80
L004b62:
	bsr.w	L0036c6
	sub.l	d2,d1
	cmp.w	#$00fe,d0
	bhi.s	L004b74
	cmp.w	#$0004,d0
	bhi.s	L004b7a
L004b74:
	bsr.w	L0037c2
	bra.s	L004b7e

L004b7a:
	bsr.w	L0036f8
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
	beq.s	L004ba4
	cmpi.w	#$0002,d5
	beq.s	L004ba4
	cmpi.w	#$0005,d5
	beq.s	L004ba4
	cmpi.w	#$0008,d5
	bne.s	L004bc2
L004ba4:
	bsr.w	L0036c6
	sub.l	d2,d1
	cmp.w	#$00fe,d0
	beq.s	L004bb6
	cmp.w	#$0004,d0
	bhi.s	L004bbc
L004bb6:
	bsr.w	L0037c2
	bra.s	L004bc0

L004bbc:
	bsr.w	L0036f8
L004bc0:
	move.b	d1,(a5)+
L004bc2:
	rts

L004bc4:
	addq.l	#2,a0
	move.w	(a0)+,d0
	bsr.w	L0036c6
	tst.w	d0
	beq.s	L004be6
	cmp.w	#$0004,d0
	bls.s	L004be2
	cmp.w	#$00fe,d0
	beq.s	L004be2
	move.w	#$0002,d0
	bra.s	L004be6

L004be2:
	move.w	#$0001,d0
L004be6:
	movea.l	(L0068d4+$000090,pc),a3
	cmpa.l	(L0068d4+$00008c,pc),a3
	beq.w	L0037f2
	move.l	d1,-(a3)
	move.w	d0,-(a3)
	lea.l	(L0068d4+$000090,pc),a3
	subq.l	#6,(a3)
	rts

L004bfe:
	addq.l	#2,a0
	move.l	(a0)+,d1
	movea.l	(L0068d4+$000090,pc),a3
	cmpa.l	(L0068d4+$00008c,pc),a3
	beq.w	L0037f2
	move.l	d1,-(a3)
	move.w	#$0000,-(a3)
	lea.l	(L0068d4+$000090,pc),a3
	subq.l	#6,(a3)
	rts

L004c1c:
	addq.l	#2,a0
	move.l	(a0)+,d1
	add.l	($004e,a1),d1
L004c24:
	movea.l	(L0068d4+$000090,pc),a3
	cmpa.l	(L0068d4+$00008c,pc),a3
	beq.w	L0037f2
	move.l	d1,-(a3)
	move.w	#$0001,-(a3)
	lea.l	(L0068d4+$000090,pc),a3
	subq.l	#6,(a3)
	rts

L004c3e:
	addq.l	#2,a0
	move.l	(a0)+,d1
	add.l	($0052,a1),d1
	bra.s	L004c24

L004c48:
	addq.l	#2,a0
	move.l	(a0)+,d1
	add.l	($0056,a1),d1
	bra.s	L004c24

L004c52:
	addq.l	#2,a0
	move.l	(a0)+,d1
	add.l	($005a,a1),d1
	bra.s	L004c24

L004c5c:
	addq.l	#2,a0
	move.l	(a0)+,d1
	add.l	($005e,a1),d1
L004c64:
	movea.l	(L0068d4+$000090,pc),a3
	cmpa.l	(L0068d4+$00008c,pc),a3
	beq.w	L0037f2
	move.l	d1,-(a3)
	move.w	#$0002,-(a3)
	lea.l	(L0068d4+$000090,pc),a3
	subq.l	#6,(a3)
	rts

L004c7e:
	addq.l	#2,a0
	move.l	(a0)+,d1
	add.l	($0062,a1),d1
	bra.s	L004c64

L004c88:
	addq.l	#2,a0
	move.l	(a0)+,d1
	add.l	($0066,a1),d1
	bra.s	L004c64

L004c92:
	addq.l	#2,a0
	move.l	(a0)+,d1
	add.l	($006a,a1),d1
	bra.s	L004c64

L004c9c:
	addq.l	#2,a0
	move.l	(a0)+,d1
	add.l	($006e,a1),d1
	bra.s	L004c64

L004ca6:
	addq.l	#2,a0
	move.l	(a0)+,d1
	add.l	($0072,a1),d1
	bra.s	L004c64

L004cb0:
	addq.l	#2,a0
	movea.l	(L0068d4+$000090,pc),a3
	cmpa.l	(L0068d4+$000088,pc),a3
	beq.w	L0037f8
	move.w	(a3)+,d0
	move.l	(a3)+,d1
	cmpi.w	#$0001,d5
	beq.s	L004cda
	cmpi.w	#$0002,d5
	beq.s	L004cda
	cmpi.w	#$0005,d5
	beq.s	L004cda
	cmpi.w	#$0008,d5
	bne.s	L004cee
L004cda:
	tst.w	d0
	beq.s	L004ce6
	bmi.s	L004cea
	bsr.w	L0037c2
	bra.s	L004cea

L004ce6:
	bsr.w	L0036e2
L004cea:
	clr.b	(a5)+
	move.b	d1,(a5)+
L004cee:
	lea.l	(L0068d4+$000090,pc),a3
	addq.l	#6,(a3)
	rts

L004cf6:
	addq.l	#2,a0
	movea.l	(L0068d4+$000090,pc),a3
	cmpa.l	(L0068d4+$000088,pc),a3
	beq.w	L0037f8
	move.w	(a3)+,d0
	move.l	(a3)+,d1
	cmpi.w	#$0001,d5
	beq.s	L004d20
	cmpi.w	#$0002,d5
	beq.s	L004d20
	cmpi.w	#$0005,d5
	beq.s	L004d20
	cmpi.w	#$0008,d5
	bne.s	L004d32
L004d20:
	tst.w	d0
	beq.s	L004d2c
	bmi.s	L004d30
	bsr.w	L0037c2
	bra.s	L004d30

L004d2c:
	bsr.w	L0036e2
L004d30:
	move.b	d1,(a5)+
L004d32:
	lea.l	(L0068d4+$000090,pc),a3
	addq.l	#6,(a3)
	rts

L004d3a:
	addq.l	#2,a0
	movea.l	(L0068d4+$000090,pc),a3
	cmpa.l	(L0068d4+$000088,pc),a3
	beq.w	L0037f8
	move.w	(a3)+,d0
	move.l	(a3)+,d1
	cmpi.w	#$0001,d5
	beq.s	L004d64
	cmpi.w	#$0002,d5
	beq.s	L004d64
	cmpi.w	#$0005,d5
	beq.s	L004d64
	cmpi.w	#$0008,d5
	bne.s	L004d8c
L004d64:
	tst.w	d0
	beq.s	L004d82
	bmi.s	L004d86
	cmpi.w	#$0001,d0
	beq.s	L004d7c
	cmpi.w	#$0004,d5
	bhi.s	L004d7c
	bsr.w	L003724
	bra.s	L004d86

L004d7c:
	bsr.w	L0037c2
	bra.s	L004d86

L004d82:
	bsr.w	L00370e
L004d86:
	move.w	d1,-(sp)
	move.b	(sp)+,(a5)+
	move.b	d1,(a5)+
L004d8c:
	lea.l	(L0068d4+$000090,pc),a3
	addq.l	#6,(a3)
	rts

L004d94:
	addq.l	#2,a0
	movea.l	(L0068d4+$000090,pc),a3
	cmpa.l	(L0068d4+$000088,pc),a3
	beq.w	L0037f8
	move.w	(a3)+,d0
	move.l	(a3)+,d1
	cmpi.w	#$0001,d5
	beq.s	L004dbe
	cmpi.w	#$0002,d5
	beq.s	L004dbe
	cmpi.w	#$0005,d5
	beq.s	L004dbe
	cmpi.w	#$0008,d5
	bne.s	L004e30
L004dbe:
	tst.w	d0
	beq.s	L004e24
	bmi.s	L004e24
	cmpi.w	#$0001,d0
	beq.s	L004e12
	cmpi.w	#$0004,d5
	bls.s	L004e24
	move.l	(-$0042,a6),d0
	cmp.l	(L0068d4+$000054,pc),d0
	beq.w	L002ea2
	addq.l	#4,(-$0042,a6)
	move.l	a4,d0
	movea.l	(-$0046,a6),a4
	suba.l	(-$004a,a6),a5
	cmpa.l	(L0068d4+$000038,pc),a5
	bcc.s	L004dfc
	suba.l	(-$0052,a6),a5
	move.l	a5,(a4)+
	adda.l	(-$0052,a6),a5
	bra.s	L004e06

L004dfc:
	suba.l	(-$004e,a6),a5
	move.l	a5,(a4)+
	adda.l	(-$004e,a6),a5
L004e06:
	move.l	a4,(-$0046,a6)
	movea.l	d0,a4
	adda.l	(-$004a,a6),a5
	bra.s	L004e24

L004e12:
	subq.l	#6,d7
	bmi.w	L00054e
	addq.l	#6,(-$005a,a6)
	clr.w	(a4)+
	move.l	a5,(a4)+
	add.l	(L0068d4+$000098,pc),d1
L004e24:
	move.w	a5,-(sp)
	lsr.w	(sp)+
	bcc.s	L004e2e
	bsr.w	L003924
L004e2e:
	move.l	d1,(a5)+
L004e30:
	lea.l	(L0068d4+$000090,pc),a3
	addq.l	#6,(a3)
	rts

L004e38:
	addq.l	#2,a0
	movea.l	(L0068d4+$000090,pc),a3
	cmpa.l	(L0068d4+$000088,pc),a3
	beq.w	L0037f8
	move.w	(a3)+,d0
	move.l	(a3)+,d1
	cmpi.w	#$0001,d5
	beq.s	L004e62
	cmpi.w	#$0002,d5
	beq.s	L004e62
	cmpi.w	#$0005,d5
	beq.s	L004e62
	cmpi.w	#$0008,d5
	bne.s	L004e84
L004e62:
	tst.w	d0
	beq.s	L004e7a
	bmi.s	L004e7e
	cmpi.w	#$0001,d0
	beq.s	L004e74
	cmpi.w	#$0004,d5
	bls.s	L004e7a
L004e74:
	bsr.w	L0037c2
	bra.s	L004e7e

L004e7a:
	bsr.w	L003724
L004e7e:
	move.w	d1,-(sp)
	move.b	(sp)+,(a5)+
	move.b	d1,(a5)+
L004e84:
	lea.l	(L0068d4+$000090,pc),a3
	addq.l	#6,(a3)
	rts

L004e8c:
	addq.l	#2,a0
	movea.l	(L0068d4+$000090,pc),a3
	cmpa.l	(L0068d4+$000088,pc),a3
	beq.s	L004e9e
	move.w	(a3)+,d2
	move.l	(a3)+,d0
	rts

L004e9e:
	addq.l	#4,sp
	bra.w	L0037f8

L004ea4:
	addq.l	#2,a0
	movea.l	(L0068d4+$000090,pc),a3
	cmpa.l	(L0068d4+$000088,pc),a3
	beq.s	L004e9e
	move.w	(a3)+,d2
	move.l	(a3)+,d0
	cmpa.l	(L0068d4+$000088,pc),a3
	beq.s	L004e9e
	move.w	(a3)+,d3
	move.l	(a3)+,d1
	rts

L004ec0:
	tst.w	d2
	ble.s	L004eca
	bsr.w	L0037b8
	moveq.l	#$ff,d2
L004eca:
	rts

L004ecc:
	moveq.l	#$00,d4
	tst.w	d2
	beq.s	L004eda
	bmi.s	L004ee4
	bsr.w	L0037b8
	bra.s	L004ee4

L004eda:
	tst.w	d3
	beq.s	L004ee6
	bmi.s	L004ee4
	bsr.w	L0037b8
L004ee4:
	moveq.l	#$ff,d4
L004ee6:
	rts

L004ee8:
	bsr.s	L004e8c
	bsr.s	L004ec0
	tst.w	d2
	bmi.s	L004ef2
	neg.l	d0
L004ef2:
	move.l	d0,-(a3)
	move.w	d2,-(a3)
	rts

L004ef8:
	bsr.s	L004e8c
	move.l	d0,-(a3)
	move.w	d2,-(a3)
	rts

L004f00:
	bsr.s	L004e8c
	bsr.s	L004ec0
	tst.w	d2
	bmi.s	L004f10
	tst.l	d0
	seq.b	d0
	ext.w	d0
	ext.l	d0
L004f10:
	move.l	d0,-(a3)
	move.w	d2,-(a3)
	rts

L004f16:
	bsr.w	L004e8c
	bsr.s	L004ec0
	tst.w	d2
	bmi.s	L004f24
	lsr.w	#8,d0
	ext.l	d0
L004f24:
	move.l	d0,-(a3)
	move.w	d2,-(a3)
	rts

L004f2a:
	bsr.w	L004e8c
	bsr.s	L004ec0
	tst.w	d2
	bmi.s	L004f3a
	andi.l	#$000000ff,d0
L004f3a:
	move.l	d0,-(a3)
	move.w	d2,-(a3)
	rts

L004f40:
	bsr.w	L004e8c
	bsr.w	L004ec0
	tst.w	d2
	bmi.s	L004f50
	clr.w	d0
	swap.w	d0
L004f50:
	move.l	d0,-(a3)
	move.w	d2,-(a3)
	rts

L004f56:
	bsr.w	L004e8c
	bsr.w	L004ec0
	tst.w	d2
	bmi.s	L004f68
	andi.l	#$0000ffff,d0
L004f68:
	move.l	d0,-(a3)
	move.w	d2,-(a3)
	rts

L004f6e:
	bsr.w	L004ea4
	bsr.w	L004ecc
	tst.l	d4
	bmi.s	L004f7e
	bsr.w	L005264
L004f7e:
	move.l	d1,-(a3)
	move.w	d4,-(a3)
	lea.l	(L0068d4+$000090,pc),a3
	addq.l	#6,(a3)
	rts

L004f8a:
	bsr.w	L004ea4
	bsr.w	L004ecc
	tst.l	d4
	bmi.s	L004fa6
	tst.l	d0
	bne.s	L004fa2
	bsr.w	L0037ae
	moveq.l	#$ff,d4
	bra.s	L004fa6

L004fa2:
	bsr.w	L0052a6
L004fa6:
	move.l	d1,-(a3)
	move.w	d4,-(a3)
	lea.l	(L0068d4+$000090,pc),a3
	addq.l	#6,(a3)
	rts

L004fb2:
	bsr.w	L004ea4
	bsr.w	L004ecc
	tst.l	d4
	bmi.s	L004fce
	tst.l	d0
	bne.s	L004fca
	bsr.w	L0037ae
	moveq.l	#$ff,d4
	bra.s	L004fce

L004fca:
	bsr.w	L0052a6
L004fce:
	move.l	d0,-(a3)
	move.w	d4,-(a3)
	lea.l	(L0068d4+$000090,pc),a3
	addq.l	#6,(a3)
	rts

L004fda:
	bsr.w	L004ea4
	bsr.w	L004ecc
	tst.l	d4
	bmi.s	L004fe8
	lsr.l	d0,d1
L004fe8:
	move.l	d1,-(a3)
	move.w	d4,-(a3)
	lea.l	(L0068d4+$000090,pc),a3
	addq.l	#6,(a3)
	rts

L004ff4:
	bsr.w	L004ea4
	bsr.w	L004ecc
	tst.l	d4
	bmi.s	L005002
	lsl.l	d0,d1
L005002:
	move.l	d1,-(a3)
	move.w	d4,-(a3)
	lea.l	(L0068d4+$000090,pc),a3
	addq.l	#6,(a3)
	rts

L00500e:
	bsr.w	L004ea4
	bsr.w	L004ecc
	tst.l	d4
	bmi.s	L00501c
	asr.l	d0,d1
L00501c:
	move.l	d1,-(a3)
	move.w	d4,-(a3)
	lea.l	(L0068d4+$000090,pc),a3
	addq.l	#6,(a3)
	rts

L005028:
	bsr.w	L004ea4
	tst.w	d2
	beq.s	L00504a
	bgt.s	L005036
	moveq.l	#$ff,d4
	bra.s	L005050

L005036:
	tst.w	d3
	bge.s	L00503e
	moveq.l	#$ff,d4
	bra.s	L005050

L00503e:
	cmp.w	d2,d3
	beq.s	L00504a
	bsr.w	L0037b8
	moveq.l	#$ff,d4
	bra.s	L005050

L00504a:
	move.w	d3,d4
	eor.w	d2,d4
	sub.l	d0,d1
L005050:
	move.l	d1,-(a3)
	move.w	d4,-(a3)
	lea.l	(L0068d4+$000090,pc),a3
	addq.l	#6,(a3)
	rts

L00505c:
	bsr.w	L004ea4
	tst.w	d2
	beq.s	L005078
	bgt.s	L00506a
	moveq.l	#$ff,d4
	bra.s	L00507e

L00506a:
	tst.w	d3
	beq.s	L005078
	bmi.s	L005074
	bsr.w	L0037b8
L005074:
	moveq.l	#$ff,d4
	bra.s	L00507e

L005078:
	move.w	d3,d4
	eor.w	d2,d4
	add.l	d0,d1
L00507e:
	move.l	d1,-(a3)
	move.w	d4,-(a3)
	lea.l	(L0068d4+$000090,pc),a3
	addq.l	#6,(a3)
	rts

L00508a:
	bsr.w	L004ea4
	bsr.w	L004ecc
	tst.l	d4
	bmi.s	L00509e
	cmp.l	d0,d1
	seq.b	d1
	ext.w	d1
	ext.l	d1
L00509e:
	move.l	d1,-(a3)
	move.w	d4,-(a3)
	lea.l	(L0068d4+$000090,pc),a3
	addq.l	#6,(a3)
	rts

L0050aa:
	bsr.w	L004ea4
	bsr.w	L004ecc
	tst.l	d4
	bmi.s	L0050be
	cmp.l	d0,d1
	sne.b	d1
	ext.w	d1
	ext.l	d1
L0050be:
	move.l	d1,-(a3)
	move.w	d4,-(a3)
	lea.l	(L0068d4+$000090,pc),a3
	addq.l	#6,(a3)
	rts

L0050ca:
	bsr.w	L004ea4
	bsr.w	L004ecc
	tst.l	d4
	bmi.s	L0050de
	cmp.l	d0,d1
	scs.b	d1
	ext.w	d1
	ext.l	d1
L0050de:
	move.l	d1,-(a3)
	move.w	d4,-(a3)
	lea.l	(L0068d4+$000090,pc),a3
	addq.l	#6,(a3)
	rts

L0050ea:
	bsr.w	L004ea4
	bsr.w	L004ecc
	tst.l	d4
	bmi.s	L0050fe
	cmp.l	d0,d1
	sls.b	d1
	ext.w	d1
	ext.l	d1
L0050fe:
	move.l	d1,-(a3)
	move.w	d4,-(a3)
	lea.l	(L0068d4+$000090,pc),a3
	addq.l	#6,(a3)
	rts

L00510a:
	bsr.w	L004ea4
	bsr.w	L004ecc
	tst.l	d4
	bmi.s	L00511e
	cmp.l	d0,d1
	shi.b	d1
	ext.w	d1
	ext.l	d1
L00511e:
	move.l	d1,-(a3)
	move.w	d4,-(a3)
	lea.l	(L0068d4+$000090,pc),a3
	addq.l	#6,(a3)
	rts

L00512a:
	bsr.w	L004ea4
	bsr.w	L004ecc
	tst.l	d4
	bmi.s	L00513e
	cmp.l	d0,d1
	scc.b	d1
	ext.w	d1
	ext.l	d1
L00513e:
	move.l	d1,-(a3)
	move.w	d4,-(a3)
	lea.l	(L0068d4+$000090,pc),a3
	addq.l	#6,(a3)
	rts

L00514a:
	bsr.w	L004ea4
	bsr.w	L004ecc
	tst.l	d4
	bmi.s	L00515e
	cmp.l	d0,d1
	slt.b	d1
	ext.w	d1
	ext.l	d1
L00515e:
	move.l	d1,-(a3)
	move.w	d4,-(a3)
	lea.l	(L0068d4+$000090,pc),a3
	addq.l	#6,(a3)
	rts

L00516a:
	bsr.w	L004ea4
	bsr.w	L004ecc
	tst.l	d4
	bmi.s	L00517e
	cmp.l	d0,d1
	sle.b	d1
	ext.w	d1
	ext.l	d1
L00517e:
	move.l	d1,-(a3)
	move.w	d4,-(a3)
	lea.l	(L0068d4+$000090,pc),a3
	addq.l	#6,(a3)
	rts

L00518a:
	bsr.w	L004ea4
	bsr.w	L004ecc
	tst.l	d4
	bmi.s	L00519e
	cmp.l	d0,d1
	sgt.b	d1
	ext.w	d1
	ext.l	d1
L00519e:
	move.l	d1,-(a3)
	move.w	d4,-(a3)
	lea.l	(L0068d4+$000090,pc),a3
	addq.l	#6,(a3)
	rts

L0051aa:
	bsr.w	L004ea4
	bsr.w	L004ecc
	tst.l	d4
	bmi.s	L0051be
	cmp.l	d0,d1
	sge.b	d1
	ext.w	d1
	ext.l	d1
L0051be:
	move.l	d1,-(a3)
	move.w	d4,-(a3)
	lea.l	(L0068d4+$000090,pc),a3
	addq.l	#6,(a3)
	rts

L0051ca:
	bsr.w	L004ea4
	bsr.w	L004ecc
	tst.l	d4
	bmi.s	L0051d8
	and.l	d0,d1
L0051d8:
	move.l	d1,-(a3)
	move.w	d4,-(a3)
	lea.l	(L0068d4+$000090,pc),a3
	addq.l	#6,(a3)
	rts

L0051e4:
	bsr.w	L004ea4
	bsr.w	L004ecc
	tst.l	d4
	bmi.s	L0051f2
	eor.l	d0,d1
L0051f2:
	move.l	d1,-(a3)
	move.w	d4,-(a3)
	lea.l	(L0068d4+$000090,pc),a3
	addq.l	#6,(a3)
	rts

L0051fe:
	bsr.w	L004ea4
	bsr.w	L004ecc
	tst.l	d4
	bmi.s	L00520c
	or.l	d0,d1
L00520c:
	move.l	d1,-(a3)
	move.w	d4,-(a3)
	lea.l	(L0068d4+$000090,pc),a3
	addq.l	#6,(a3)
	rts

L005218:
	bra.w	L0014ec

L00521c:
	movem.l	(a0),d0-d1
	subq.w	#1,d0
	beq.s	L005244
	subq.w	#1,d0
	beq.s	L00523e
	subq.w	#1,d0
	beq.s	L005238
	subq.w	#1,d0
	bne.w	L002e64
	add.l	($005a,a1),d1
	bra.s	L005248

L005238:
	add.l	($0056,a1),d1
	bra.s	L005248

L00523e:
	add.l	($0052,a1),d1
	bra.s	L005248

L005244:
	add.l	($004e,a1),d1
L005248:
	tst.w	(-$000e,a6)
	beq.s	L005252
	bsr.w	L0037e2
L005252:
	addq.w	#1,(-$000e,a6)
	pea.l	($0008,a0)
	lea.l	(L0068d4+$000094,pc),a0
	move.l	d1,(a0)
	movea.l	(sp)+,a0
	rts

L005264:
	movem.l	d2-d4,-(sp)
	moveq.l	#$00,d2
	tst.l	d0
	bpl.s	L005272
	neg.l	d0
	not.w	d2
L005272:
	tst.l	d1
	bpl.s	L00527a
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
	beq.s	L00529e
	neg.l	d3
L00529e:
	exg.l	d1,d3
	movem.l	(sp)+,d2-d4
	rts

L0052a6:
	movem.l	d2-d5,-(sp)
	moveq.l	#$00,d2
	tst.l	d0
	bpl.s	L0052b4
	neg.l	d0
	not.w	d2
L0052b4:
	tst.l	d1
	bpl.s	L0052bc
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
	bcs.s	L0052d2
	sub.l	d0,d4
	addq.l	#1,d3
L0052d2:
	dbra.w	d5,L0052c4
	move.l	d3,d1
	move.l	d4,d0
	tst.w	d2
	bpl.s	L0052e0
	neg.l	d1
L0052e0:
	movem.l	(sp)+,d2-d5
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
	.dc.b	$d7,$a6,$e3,$9a,$e3,$ce,$e3,$ce
	.dc.b	$e3,$ce,$e3,$ce,$e3,$ce,$e3,$ce
	.dc.b	$e3,$ce,$e3,$ce,$e3,$ce,$e3,$ce
	.dc.b	$e4,$2c,$e4,$a4,$e4,$a4,$e4,$a4
	.dc.b	$e4,$a4,$e5,$ee,$e6,$88,$e6,$88
	.dc.b	$e6,$88,$e6,$88,$e6,$88,$e6,$88
	.dc.b	$e6,$88,$e6,$88,$e6,$88,$e6,$88
	.dc.b	$e5,$0a,$e5,$0a,$e5,$0a,$e5,$0a
	.dc.b	$e6,$38,$e6,$88,$e6,$88,$e6,$88
	.dc.b	$e6,$88,$e6,$ce,$e7,$06,$e7,$3e
	.dc.b	$e6,$88,$e6,$88,$e6,$88,$e5,$58
	.dc.b	$e5,$58,$e5,$58,$e5,$58,$e6,$60
	.dc.b	$e7,$76,$e7,$b4,$e7,$f2,$e8,$30
	.dc.b	$e8,$6e,$e8,$e0,$e9,$52,$e9,$c4
	.dc.b	$ea,$36,$ea,$a8,$e4,$d8,$e4,$d8
	.dc.b	$e4,$d8,$e4,$d8,$e6,$14,$e6,$ac
	.dc.b	$e6,$ac,$e6,$ac,$e6,$ac,$e6,$ac
	.dc.b	$e6,$ac,$e6,$ac,$e6,$ac,$e6,$ac
	.dc.b	$e6,$ac,$e5,$0a,$e5,$0a,$d9,$d6
	.dc.b	$d9,$d6,$d9,$d6,$d9,$d6,$d9,$d6
	.dc.b	$e5,$58,$e5,$58,$e5,$58,$e5,$58
	.dc.b	$e6,$60,$e7,$76,$e7,$b4,$e7,$f2
	.dc.b	$e8,$30,$e8,$6e,$e8,$e0,$e9,$52
	.dc.b	$e9,$c4,$ea,$36,$ea,$a8,$e4,$d8
	.dc.b	$e4,$d8,$d9,$d6,$d9,$d6,$d9,$d6
	.dc.b	$d9,$d6,$d9,$d6,$e4,$56,$e4,$8c
	.dc.b	$eb,$1a,$eb,$1a,$eb,$1a,$eb,$1a
	.dc.b	$ec,$74,$ed,$16,$ed,$16,$ed,$16
	.dc.b	$ed,$16,$ed,$16,$ed,$16,$ed,$16
	.dc.b	$ed,$16,$ed,$16,$ed,$16,$eb,$88
	.dc.b	$eb,$88,$eb,$88,$eb,$88,$ec,$c2
	.dc.b	$ed,$16,$ed,$16,$ed,$16,$ed,$16
	.dc.b	$ed,$60,$ed,$9a,$ed,$d4,$ed,$16
	.dc.b	$ed,$16,$ed,$16,$eb,$da,$eb,$da
	.dc.b	$eb,$da,$eb,$da,$ec,$ec,$ee,$0e
	.dc.b	$ee,$4e,$ee,$8e,$ee,$ce,$ef,$0e
	.dc.b	$ef,$82,$ef,$f6,$f0,$6a,$f0,$de
	.dc.b	$f1,$52,$eb,$52,$eb,$52,$eb,$52
	.dc.b	$eb,$52,$ec,$9c,$ed,$3c,$ed,$3c
	.dc.b	$ed,$3c,$ed,$3c,$ed,$3c,$ed,$3c
	.dc.b	$ed,$3c,$ed,$3c,$ed,$3c,$ed,$3c
	.dc.b	$eb,$88,$eb,$88,$d9,$d6,$d9,$d6
	.dc.b	$d9,$d6,$d9,$d6,$d9,$d6,$eb,$da
	.dc.b	$eb,$da,$eb,$da,$eb,$da,$ec,$ec
	.dc.b	$ee,$0e,$ee,$4e,$ee,$8e,$ee,$ce
	.dc.b	$ef,$0e,$ef,$82,$ef,$f6,$f0,$6a
	.dc.b	$f0,$de,$f1,$52,$eb,$52,$eb,$52
	.dc.b	$d9,$d6,$d9,$d6,$d9,$d6,$d9,$d6
	.dc.b	$d9,$d6,$f1,$c6,$f2,$10,$f2,$5a
	.dc.b	$f2,$a4,$f2,$ee,$f3,$34,$f3,$7a
	.dc.b	$f3,$c0,$f4,$06,$f4,$4c,$f1,$c6
	.dc.b	$f2,$10,$f2,$5a,$f2,$a4,$f2,$ee
	.dc.b	$f3,$34,$f3,$7a,$f3,$c0,$f4,$06
	.dc.b	$f4,$4c,$f4,$92,$f4,$d8,$f5,$1e
	.dc.b	$f5,$64,$f5,$aa,$f5,$ec,$f6,$2e
	.dc.b	$f6,$70,$f6,$b2,$f6,$f4,$f7,$36
	.dc.b	$f7,$36,$f7,$36,$f7,$36,$f7,$70
	.dc.b	$f7,$8e,$f7,$b0,$f7,$ba,$f7,$c4
	.dc.b	$f7,$ce,$f7,$f0,$f7,$fa,$f8,$04
	.dc.b	$f8,$0e,$f8,$18,$f8,$22,$f8,$ac
	.dc.b	$f9,$06,$f8,$68,$f9,$06,$f9,$aa
	.dc.b	$fa,$5a,$fa,$6a,$fa,$72,$fa,$88
	.dc.b	$fa,$9c,$fa,$b2,$fa,$c8,$d9,$d6
	.dc.b	$fa,$e0,$fa,$fc,$fb,$24,$fb,$4c
	.dc.b	$fb,$66,$fb,$80,$fb,$9a,$fb,$ce
	.dc.b	$fb,$fc,$fc,$1c,$fc,$3c,$fc,$5c
	.dc.b	$fc,$7c,$fc,$9c,$fc,$bc,$fc,$dc
	.dc.b	$fc,$fc,$fd,$1c,$fd,$3c,$fd,$56
	.dc.b	$fd,$70,$d9,$d6,$d9,$d6,$fd,$8a
	.dc.b	$fd,$8a,$fd,$8a,$fd,$8a,$fd,$8a
	.dc.b	$fd,$8a,$fd,$8a,$fd,$8a,$fd,$8a
	.dc.b	$fd,$8a,$fd,$8a,$fd,$8a,$fd,$8a
	.dc.b	$fd,$8a,$fd,$8a,$fd,$8a,$fd,$8a
	.dc.b	$fd,$8a,$fd,$8a,$fd,$8a,$fd,$8a
	.dc.b	$fd,$8a,$fd,$8a,$fd,$8a,$fd,$8a
	.dc.b	$fd,$8a,$d9,$d6,$fd,$8a,$fd,$8a
	.dc.b	$fd,$8a,$fd,$8e,$fd,$8a,$d9,$d6
	.dc.b	$d9,$d6,$d9,$d6,$d9,$d6,$d9,$d6
	.dc.b	$d9,$d6,$d9,$d6,$d9,$d6,$d9,$d6
	.dc.b	$d9,$d6,$fd,$8a,$fd,$8a
L00570c:
	move.b	(L0068d4+$0005d1,pc),d0
	beq.s	L00571a
	pea.l	(L005e50,pc)
	DOS	_PRINT
	addq.l	#4,sp
L00571a:
	move.w	#$0020,-(sp)		;' '
	pea.l	(L0068d4+$00011c,pc)
	DOS	_CREATE
	addq.l	#6,sp
	move.l	d0,d7
	bmi.w	L0058be
	bsr.w	L0058e0
	bsr.w	L005908
	moveq.l	#$00,d5
	moveq.l	#$00,d6
	movea.l	(L0068d4+$0005c8,pc),a4
	pea.l	(L005e64,pc)
	bsr.w	L005de8
	pea.l	(L0068d4+$00009c,pc)
	bsr.w	L005de8
	addq.l	#4,sp
	bsr.w	L005dde
	bsr.w	L005de8
	addq.l	#4,sp
	tst.w	d5
	bne.w	L0058c4
	move.l	(L0068d4+$000094,pc),-(sp)
	bsr.w	L005940
	moveq.l	#$00,d1
	move.l	(L0068d4+$000004,pc),d2
	pea.l	(L005fd2,pc)
	movem.l	d1-d2,-(sp)
	bsr.w	L005ca0
	add.l	d2,d1
	move.l	(L0068d4+$000008,pc),d2
	add.l	(L0068d4+$000054,pc),d2
	add.l	(L0068d4+$000038,pc),d2
	add.l	(L0068d4+$00003c,pc),d2
	pea.l	(L005fd7,pc)
	movem.l	d1-d2,-(sp)
	bsr.w	L005ca0
	add.l	d2,d1
	move.l	(L0068d4+$00000c,pc),d2
	pea.l	(L005fdc,pc)
	movem.l	d1-d2,-(sp)
	bsr.w	L005ca0
	add.l	d2,d1
	move.l	(L0068d4+$000010,pc),d2
	pea.l	(L005fe0,pc)
	movem.l	d1-d2,-(sp)
	bsr.w	L005ca0
	add.l	d2,d1
	move.l	(L0068d4+$000014,pc),d2
	pea.l	(L005fe7,pc)
	movem.l	d1-d2,-(sp)
	bsr.w	L005ca0
	moveq.l	#$00,d1
	move.l	(L0068d4+$000018,pc),d2
	pea.l	(L005fed,pc)
	movem.l	d1-d2,-(sp)
	bsr.w	L005ca0
	add.l	d2,d1
	move.l	(L0068d4+$00001c,pc),d2
	pea.l	(L005ff3,pc)
	movem.l	d1-d2,-(sp)
	bsr.w	L005ca0
	add.l	d2,d1
	move.l	(L0068d4+$000020,pc),d2
	pea.l	(L005ff8,pc)
	movem.l	d1-d2,-(sp)
	bsr.w	L005ca0
	add.l	d2,d1
	move.l	(L0068d4+$000024,pc),d2
	pea.l	(L006000,pc)
	movem.l	d1-d2,-(sp)
	bsr.w	L005ca0
	add.l	d2,d1
	move.l	(L0068d4+$000028,pc),d2
	pea.l	(L006007,pc)
	movem.l	d1-d2,-(sp)
	bsr.w	L005ca0
	add.l	d2,d1
	move.l	(L0068d4+$00002c,pc),d2
	pea.l	(L00600e,pc)
	movem.l	d1-d2,-(sp)
	bsr.w	L005ca0
	add.l	d2,d1
	move.l	(L0068d4+$000030,pc),d2
	pea.l	(L006014,pc)
	movem.l	d1-d2,-(sp)
	bsr.w	L005ca0
	add.l	d2,d1
	move.l	(L0068d4+$000034,pc),d2
	pea.l	(L00601d,pc)
	movem.l	d1-d2,-(sp)
	bsr.w	L005ca0
	bsr.w	L005dde
	bsr.w	L005dde
	lea.l	($00a0,sp),sp
	tst.w	d5
	bne.s	L0058c4
	movea.l	(L0068d4+$00006c,pc),a0
L005870:
	move.l	a0,d0
	beq.s	L0058aa
	movea.l	(a0),a1
	pea.l	(a1)
	bsr.w	L00595e
	bsr.w	L005aaa
	bsr.w	L005af8
	bsr.w	L005b9e
	bsr.w	L005bf0
	bsr.w	L005c48
	addq.l	#4,sp
	tst.l	($0004,a0)
	beq.s	L0058aa
	bsr.w	L005dde
	bsr.w	L005dde
	tst.w	d5
	bne.s	L0058c4
	movea.l	($0004,a0),a0
	bra.s	L005870

L0058aa:
	bsr.w	L005e16
	tst.w	d5
	bne.s	L0058c4
	move.w	d7,-(sp)
	DOS	_CLOSE
	addq.l	#2,sp
	tst.l	d0
	bmi.s	L0058c4
	rts

L0058be:
	pea.l	(L005e2e,pc)
	bra.s	L0058c8

L0058c4:
	pea.l	(L005e41,pc)
L0058c8:
	DOS	_PRINT
	pea.l	(L0068d4+$00011c,pc)
	DOS	_PRINT
	addq.l	#8,sp
	bsr.w	L000c82
	lea.l	(L0068d4+$0005cc,pc),a0
	move.w	#$0001,(a0)
	rts

L0058e0:
	move.l	a0,-(sp)
	lea.l	(L0068d4,pc),a0
	moveq.l	#$00,d0
	sub.b	($007f,a0),d0
	and.b	#$0f,d0
	sub.l	d0,($0084,a0)
	bmi.s	L005900
	add.l	d0,($007c,a0)
	moveq.l	#$00,d0
L0058fc:
	movea.l	(sp)+,a0
	rts

L005900:
	add.l	d0,($0084,a0)
	moveq.l	#$ff,d0
	bra.s	L0058fc

L005908:
	move.l	a6,-(sp)
	lea.l	(L0068d4,pc),a6
	move.l	($0084,a6),d0
	andi.l	#$fffffc00,d0
	beq.s	L005930
	move.l	($007c,a6),($05c8,a6)
	add.l	d0,($007c,a6)
	sub.l	d0,($0084,a6)
L005928:
	move.l	d0,($05c4,a6)
	movea.l	(sp)+,a6
	rts

L005930:
	pea.l	($019c,a6)
	move.l	(sp)+,($05c8,a6)
	move.l	#$00000400,d0
	bra.s	L005928

L005940:
	link.w	a6,#$0000
	pea.l	(L006025,pc)
	bsr.w	L005d5c
	move.l	($0008,a6),-(sp)
	bsr.w	L005d9e
	bsr.w	L005dde
	addq.l	#8,sp
	unlk	a6
	rts

L00595e:
	link.w	a6,#-$0100
	move.l	a0,-(sp)
	movea.l	($0008,a6),a0
	pea.l	(L005e64,pc)
	bsr.w	L005de8
	pea.l	($0010)
	pea.l	(a0)
	bsr.w	L005cf8
	bsr.w	L005dde
	pea.l	(L005e64,pc)
	bsr.w	L005de8
	lea.l	($0010,sp),sp
	pea.l	(L005fcc,pc)
	bsr.w	L005d5c
	move.l	($008e,a0),-(sp)
	bsr.w	L005d9e
	addq.l	#8,sp
	bsr.w	L005dde
	pea.l	(L005fd2,pc)
	move.l	($0026,a0),-(sp)
	move.l	($004e,a0),-(sp)
	bsr.w	L005ca0
	pea.l	(L005fd7,pc)
	move.l	($002a,a0),-(sp)
	move.l	($0052,a0),-(sp)
	bsr.w	L005ca0
	pea.l	(L005fdc,pc)
	move.l	($002e,a0),-(sp)
	move.l	($0056,a0),-(sp)
	bsr.w	L005ca0
	pea.l	(L005fe7,pc)
	move.l	($0032,a0),-(sp)
	move.l	($005a,a0),-(sp)
	bsr.w	L005ca0
	move.l	($0036,a0),d0
	beq.s	L005a00
	pea.l	(L005fed,pc)
	move.l	d0,-(sp)
	move.l	($005e,a0),d0
	add.l	#$00008000,d0
	move.l	d0,-(sp)
	bsr.w	L005ca0
	lea.l	($000c,sp),sp
L005a00:
	move.l	($003a,a0),d0
	beq.s	L005a20
	pea.l	(L005ff3,pc)
	move.l	d0,-(sp)
	move.l	($0062,a0),d0
	add.l	#$00008000,d0
	move.l	d0,-(sp)
	bsr.w	L005ca0
	lea.l	($000c,sp),sp
L005a20:
	move.l	($003e,a0),d0
	beq.s	L005a40
	pea.l	(L006000,pc)
	move.l	d0,-(sp)
	move.l	($0066,a0),d0
	add.l	#$00008000,d0
	move.l	d0,-(sp)
	bsr.w	L005ca0
	lea.l	($000c,sp),sp
L005a40:
	move.l	($0042,a0),d0
	beq.s	L005a60
	pea.l	(L006007,pc)
	move.l	d0,-(sp)
	move.l	($006a,a0),d0
	add.l	#$00008000,d0
	move.l	d0,-(sp)
	bsr.w	L005ca0
	lea.l	($000c,sp),sp
L005a60:
	move.l	($0046,a0),d0
	beq.s	L005a80
	pea.l	(L00600e,pc)
	move.l	d0,-(sp)
	move.l	($006e,a0),d0
	add.l	#$00008000,d0
	move.l	d0,-(sp)
	bsr.w	L005ca0
	lea.l	($000c,sp),sp
L005a80:
	move.l	($004a,a0),d0
	beq.s	L005aa0
	pea.l	(L00601d,pc)
	move.l	d0,-(sp)
	move.l	($0072,a0),d0
	add.l	#$00008000,d0
	move.l	d0,-(sp)
	bsr.w	L005ca0
	lea.l	($000c,sp),sp
L005aa0:
	lea.l	($0030,sp),sp
	movea.l	(sp)+,a0
	unlk	a6
	rts

L005aaa:
	link.w	a6,#$0000
	movem.l	a0-a2,-(sp)
	movea.l	($0008,a6),a0
	movea.l	($007e,a0),a1
	tst.l	(a1)
	beq.s	L005af0
	pea.l	(L005ea0,pc)
	bsr.w	L005de8
	addq.l	#4,sp
L005ac8:
	tst.l	(a1)+
	beq.s	L005af0
	movea.l	(a1)+,a2
	move.l	($0004,a2),-(sp)
	bsr.w	L005d5c
	pea.l	(L006098,pc)
	bsr.w	L005de8
	clr.l	-(sp)
	move.l	(a2),-(sp)
	bsr.w	L005cf8
	bsr.w	L005dde
	lea.l	($0010,sp),sp
	bra.s	L005ac8

L005af0:
	movem.l	(sp)+,a0-a2
	unlk	a6
	rts

L005af8:
	link.w	a6,#$0000
	movem.l	a0-a3,-(sp)
	movea.l	($0008,a6),a0
	movea.l	($007a,a0),a1
	tst.l	(a1)
	beq.w	L005b96
	pea.l	(L005edc,pc)
	bsr.w	L005de8
	addq.l	#4,sp
L005b18:
	tst.l	(a1)+
	beq.s	L005b96
	movea.l	(a1)+,a2
	cmpi.w	#$00fc,($000a,a2)
	beq.s	L005b18
	cmpi.w	#$00fd,($000a,a2)
	beq.s	L005b18
	cmpi.w	#$00fe,($000a,a2)
	beq.s	L005b18
	move.l	($0004,a2),-(sp)
	bsr.w	L005d5c
	move.w	($000a,a2),d0
	move.l	($000c,a2),d1
	cmp.w	#$0004,d0
	bls.s	L005b52
	add.l	#$00008000,d1
L005b52:
	move.l	d1,-(sp)
	bsr.w	L005d9e
	bsr.w	L005dd4
	addq.l	#8,sp
	move.w	($000a,a2),d0
	cmpi.w	#$000a,d0
	bls.s	L005b6a
	moveq.l	#$00,d0
L005b6a:
	add.w	d0,d0
	move.w	(L005b80,pc,d0.w),d0
	pea.l	(L005b80,pc,d0.w)
	bsr.w	L005de8
	addq.l	#4,sp
	bsr.w	L005dde
	bra.s	L005b18

L005b80:
	.dc.w	$04aa,$04b4,$04be,$04c8
	.dc.w	$04d2,$04dc,$04e6,$04f0
	.dc.w	$04fa,$0504,$050e
L005b96:
	movem.l	(sp)+,a0-a3
	unlk	a6
	rts

L005b9e:
	link.w	a6,#$0000
	movem.l	d1-d2/a0-a2,-(sp)
	movea.l	($0008,a6),a0
	movea.l	($007a,a0),a1
	tst.l	(a1)
	beq.s	L005be8
	moveq.l	#$00,d1
L005bb4:
	tst.l	(a1)
	beq.s	L005be8
	movea.l	(a1)+,a2
	cmpi.w	#$00fe,($000a,a2)
	bne.s	L005bb4
	tst.w	d1
	bne.s	L005bd2
	pea.l	(L005f18,pc)
	bsr.w	L005de8
	addq.l	#4,sp
	moveq.l	#$ff,d1
L005bd2:
	move.l	($0004,a2),-(sp)
	move.l	($0010,a2),-(sp)
	move.l	($000c,a2),-(sp)
	bsr.w	L005ca0
	lea.l	($000c,sp),sp
	bra.s	L005bb4

L005be8:
	movem.l	(sp)+,d1-d2/a0-a2
	unlk	a6
	rts

L005bf0:
	link.w	a6,#$0000
	movem.l	d1-d2/a0-a2,-(sp)
	movea.l	($0008,a6),a0
	movea.l	($007a,a0),a1
	tst.l	(a1)
	beq.s	L005c40
	moveq.l	#$00,d1
L005c06:
	tst.l	(a1)
	beq.s	L005c40
	movea.l	(a1)+,a2
	cmpi.w	#$00fd,($000a,a2)
	bne.s	L005c06
	tst.w	d1
	bne.s	L005c24
	pea.l	(L005f54,pc)
	bsr.w	L005de8
	addq.l	#4,sp
	moveq.l	#$ff,d1
L005c24:
	move.l	($0004,a2),-(sp)
	move.l	($0010,a2),-(sp)
	move.l	($000c,a2),d0
	add.l	#$00008000,d0
	move.l	d0,-(sp)
	bsr.s	L005ca0
	lea.l	($000c,sp),sp
	bra.s	L005c06

L005c40:
	movem.l	(sp)+,d1-d2/a0-a2
	unlk	a6
	rts

L005c48:
	link.w	a6,#$0000
	movem.l	d1-d2/a0-a2,-(sp)
	movea.l	($0008,a6),a0
	movea.l	($007a,a0),a1
	tst.l	(a1)
	beq.s	L005c98
	moveq.l	#$00,d1
L005c5e:
	tst.l	(a1)
	beq.s	L005c98
	movea.l	(a1)+,a2
	cmpi.w	#$00fc,($000a,a2)
	bne.s	L005c5e
	tst.w	d1
	bne.s	L005c7c
	pea.l	(L005f90,pc)
	bsr.w	L005de8
	addq.l	#4,sp
	moveq.l	#$ff,d1
L005c7c:
	move.l	($0004,a2),-(sp)
	move.l	($0010,a2),-(sp)
	move.l	($000c,a2),d0
	add.l	#$00008000,d0
	move.l	d0,-(sp)
	bsr.s	L005ca0
	lea.l	($000c,sp),sp
	bra.s	L005c5e

L005c98:
	movem.l	(sp)+,d1-d2/a0-a2
	unlk	a6
	rts

L005ca0:
	link.w	a6,#$0000
	move.l	($0010,a6),-(sp)
	bsr.w	L005d5c
	addq.l	#4,sp
	tst.l	($000c,a6)
	beq.s	L005cf0
	move.l	($0008,a6),-(sp)
	bsr.w	L005d9e
	pea.l	(L00609c,pc)
	bsr.w	L005de8
	move.l	($0008,a6),d0
	add.l	($000c,a6),d0
	subq.l	#1,d0
	move.l	d0,-(sp)
	bsr.w	L005d9e
	pea.l	(L0060a0,pc)
	bsr.w	L005de8
	move.l	($000c,a6),-(sp)
	bsr.w	L005d9e
	pea.l	(L0060a0+$000003,pc)
	bsr.w	L005de8
	lea.l	($0014,sp),sp
L005cf0:
	bsr.w	L005dde
	unlk	a6
	rts

L005cf8:
	link.w	a6,#-$0100
	movem.l	a0-a2,-(sp)
	movea.l	($0008,a6),a0
	move.l	($000c,a6),d0
	movea.l	($0008,a0),a1
	lea.l	(-$0100,a6),a2
	addq.w	#1,d0
L005d12:
	subq.w	#1,d0
	move.b	(a1)+,(a2)+
	bne.s	L005d12
	subq.l	#1,a2
	tst.l	($0004,a0)
	beq.s	L005d2a
L005d20:
	move.b	#$09,(a2)+
	subq.w	#8,d0
	bgt.s	L005d20
	clr.b	(a2)
L005d2a:
	pea.l	(-$0100,a6)
	bsr.w	L005de8
	addq.l	#4,sp
	tst.l	($0004,a0)
	beq.s	L005d54
	pea.l	(L0060a5,pc)
	bsr.w	L005de8
	move.l	($0004,a0),(sp)
	bsr.w	L005de8
	pea.l	(L0060a0+$000003,pc)
	bsr.w	L005de8
	addq.l	#8,sp
L005d54:
	movem.l	(sp)+,a0-a2
	unlk	a6
	rts

L005d5c:
	link.w	a6,#-$0100
	movem.l	a0-a1,-(sp)
	movea.l	($0008,a6),a0
	lea.l	(-$0100,a6),a1
	move.w	#$0019,d0
L005d70:
	subq.w	#1,d0
	move.b	(a0)+,(a1)+
	bne.s	L005d70
	subq.l	#1,a1
L005d78:
	move.b	#$09,(a1)+
	subq.w	#8,d0
	bgt.s	L005d78
	move.b	#$20,(a1)+		;' '
	move.b	#$3a,(a1)+		;':'
	move.b	#$20,(a1)+		;' '
	clr.b	(a1)
	pea.l	(-$0100,a6)
	bsr.s	L005de8
	addq.l	#4,sp
	movem.l	(sp)+,a0-a1
	unlk	a6
	rts

L005d9e:
	link.w	a6,#-$0010
	movem.l	d1-d2/a0-a1,-(sp)
	lea.l	(-$0010,a6),a0
	lea.l	(L000cc4,pc),a1
	move.l	($0008,a6),d1
	moveq.l	#$07,d0
L005db4:
	rol.l	#4,d1
	moveq.l	#$0f,d2
	and.w	d1,d2
	move.b	(a1,d2.w),(a0)+
	dbra.w	d0,L005db4
	clr.b	(a0)
	pea.l	(-$0010,a6)
	bsr.s	L005de8
	addq.l	#4,sp
	movem.l	(sp)+,d1-d2/a0-a1
	unlk	a6
	rts

L005dd4:
	pea.l	(L0060a7,pc)
	bsr.s	L005de8
	addq.l	#4,sp
	rts

L005dde:
	pea.l	(L005e62,pc)
	bsr.s	L005de8
	addq.l	#4,sp
	rts

L005de8:
	link.w	a6,#$0000
	movem.l	d1/a0,-(sp)
	tst.w	d5
	bmi.s	L005e0e
	movea.l	($0008,a6),a0
	move.l	(L0068d4+$0005c4,pc),d1
L005dfc:
	move.b	(a0)+,d0
	beq.s	L005e0e
	move.b	d0,(a4)+
	addq.l	#1,d6
	cmp.l	d6,d1
	bne.s	L005dfc
	bsr.s	L005e16
	tst.w	d5
	beq.s	L005dfc
L005e0e:
	movem.l	(sp)+,d1/a0
	unlk	a6
	rts

L005e16:
	movea.l	(L0068d4+$0005c8,pc),a4
	move.l	d6,-(sp)
	move.l	a4,-(sp)
	move.w	d7,-(sp)
	DOS	_WRITE
	addq.l	#6,sp
	cmp.l	(sp)+,d0
	beq.s	L005e2a
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
	bvs.s	L006106+$000002
	move.l	d0,d0
L00609c:
	move.l	($2000,a5),d0
L0060a0:
	move.l	($0029,a0),d0
L0060a4:
	.dc.b	$00
L0060a5:
	.dc.b	$28,$00
L0060a7:
	.dc.b	$20,$00,$00
L0060aa:
	link.w	a6,#-$000c
	movem.l	d1-d6/a0-a3,-(sp)
	moveq.l	#$00,d6
	lea.l	(L0068d4+$00006c,pc),a2
	move.l	(a2),d0
	beq.s	L0060ee
L0060bc:
	movea.l	d0,a2
	movea.l	(a2),a1
	move.w	#$0001,d5
	movea.l	($0010,a1),a0
	move.w	(a0),d0
	beq.s	L0060e8
L0060cc:
	move.w	d0,d1
	bsr.w	L0014a4
	bmi.w	L0005e6
	add.w	d0,d0
	lea.l	(L0062fe,pc),a3
	move.w	(a3,d0.w),d0
	jsr	(a3,d0.w)
	move.w	(a0),d0
	bne.s	L0060cc
L0060e8:
	addq.w	#4,a2
	move.l	(a2),d0
	bne.s	L0060bc
L0060ee:
	lea.l	(L0068d4+$000054,pc),a0
	move.l	d6,(a0)
	movem.l	(sp)+,d1-d6/a0-a3
	unlk	a6
	rts

L0060fc:
	tst.l	($0002,a0)
	bne.w	L0005e6
	addq.l	#6,a0
L006106:
	and.l	#$000000ff,d1
	move.l	d1,d5
	rts

L006110:
	addq.l	#2,a0
	addq.l	#2,a0
	addq.l	#2,a0
	addq.l	#4,a0
	cmp.w	#$0005,d5
	beq.s	L006124
	cmp.w	#$0008,d5
	bne.s	L006126
L006124:
	addq.l	#4,d6
L006126:
	rts

L006128:
	addq.l	#2,a0
	move.w	(a0)+,d0
	addq.l	#4,a0
	cmp.w	#$0005,d5
	beq.s	L00613a
	cmp.w	#$0008,d5
	bne.s	L00614c
L00613a:
	bsr.w	L0036c6
	cmp.w	#$0004,d0
	bls.s	L00614c
	cmp.w	#$00fe,d0
	beq.s	L00614c
	addq.l	#4,d6
L00614c:
	rts

L00614e:
	addq.l	#2,a0
	move.w	(a0)+,d0
	cmp.w	#$0005,d5
	beq.s	L00615e
	cmp.w	#$0008,d5
	bne.s	L006170
L00615e:
	bsr.w	L0036c6
	cmp.w	#$0004,d0
	bls.s	L006170
	cmp.w	#$00fe,d0
	beq.s	L006170
	addq.l	#4,d6
L006170:
	rts

L006172:
	addq.l	#2,a0
	move.w	(a0)+,d0
	bsr.w	L0036c6
	tst.w	d0
	beq.s	L006194
	cmp.w	#$0004,d0
	bls.s	L006190
	cmp.w	#$00fe,d0
	beq.s	L006190
	move.w	#$0002,d0
	bra.s	L006194

L006190:
	move.w	#$0001,d0
L006194:
	movea.l	(L0068d4+$000090,pc),a3
	cmpa.l	(L0068d4+$00008c,pc),a3
	beq.w	L0037f2
	move.l	d1,-(a3)
	move.w	d0,-(a3)
	lea.l	(L0068d4+$000090,pc),a3
	subq.l	#6,(a3)
	rts

L0061ac:
	addq.l	#2,a0
	move.l	(a0)+,d1
	movea.l	(L0068d4+$000090,pc),a3
	cmpa.l	(L0068d4+$00008c,pc),a3
	beq.w	L0037f2
	move.l	d1,-(a3)
	move.w	#$0000,-(a3)
	lea.l	(L0068d4+$000090,pc),a3
	subq.l	#6,(a3)
	rts

L0061ca:
	addq.l	#2,a0
	move.l	(a0)+,d1
	movea.l	(L0068d4+$000090,pc),a3
	cmpa.l	(L0068d4+$00008c,pc),a3
	beq.w	L0037f2
	move.l	d1,-(a3)
	move.w	#$0001,-(a3)
	lea.l	(L0068d4+$000090,pc),a3
	subq.l	#6,(a3)
	rts

L0061e8:
	addq.l	#2,a0
	move.l	(a0)+,d1
	movea.l	(L0068d4+$000090,pc),a3
	cmpa.l	(L0068d4+$00008c,pc),a3
	beq.w	L0037f2
	move.l	d1,-(a3)
	move.w	#$0002,-(a3)
	lea.l	(L0068d4+$000090,pc),a3
	subq.l	#6,(a3)
	rts

L006206:
	addq.l	#2,a0
	movea.l	(L0068d4+$000090,pc),a3
	cmpa.l	(L0068d4+$000088,pc),a3
	beq.w	L0037f8
	lea.l	(L0068d4+$000090,pc),a3
	addq.l	#6,(a3)
	rts

L00621c:
	addq.l	#2,a0
	movea.l	(L0068d4+$000090,pc),a3
	cmpa.l	(L0068d4+$000088,pc),a3
	beq.w	L0037f8
	move.w	(a3)+,d0
	move.l	(a3)+,d1
	cmp.w	#$0002,d0
	bne.s	L00623c
	cmp.w	#$0004,d5
	bls.s	L00623c
	addq.l	#4,d6
L00623c:
	lea.l	(L0068d4+$000090,pc),a3
	addq.l	#6,(a3)
	rts

L006244:
	addq.l	#2,a0
	movea.l	(L0068d4+$000090,pc),a3
	cmpa.l	(L0068d4+$000088,pc),a3
	beq.s	L006272
	move.w	(a3)+,d2
	move.l	(a3)+,d0
	rts

L006256:
	addq.l	#2,a0
	movea.l	(L0068d4+$000090,pc),a3
	cmpa.l	(L0068d4+$000088,pc),a3
	beq.s	L006272
	move.w	(a3)+,d2
	move.l	(a3)+,d0
	cmpa.l	(L0068d4+$000088,pc),a3
	beq.s	L006272
	move.w	(a3)+,d3
	move.l	(a3)+,d1
	rts

L006272:
	addq.l	#4,sp
	bra.w	L0037f8

L006278:
	tst.w	d2
	ble.s	L00627e
	moveq.l	#$ff,d2
L00627e:
	rts

L006280:
	moveq.l	#$00,d4
	tst.w	d2
	beq.s	L00628a
	moveq.l	#$ff,d4
	bra.s	L006290

L00628a:
	tst.w	d3
	beq.s	L006290
	moveq.l	#$ff,d4
L006290:
	rts

L006292:
	bsr.s	L006244
	bsr.s	L006278
	move.l	d0,-(a3)
	move.w	d2,-(a3)
	rts

L00629c:
	bsr.s	L006256
	bsr.s	L006280
	move.l	d1,-(a3)
	move.w	d4,-(a3)
	lea.l	(L0068d4+$000090,pc),a3
	addq.l	#6,(a3)
	rts

L0062ac:
	bsr.s	L006256
	tst.w	d2
	beq.s	L0062c8
	bgt.s	L0062b8
	moveq.l	#$ff,d4
	bra.s	L0062cc

L0062b8:
	tst.w	d3
	bge.s	L0062c0
	moveq.l	#$ff,d4
	bra.s	L0062cc

L0062c0:
	cmp.w	d2,d3
	beq.s	L0062c8
	moveq.l	#$ff,d4
	bra.s	L0062cc

L0062c8:
	move.w	d3,d4
	eor.w	d2,d4
L0062cc:
	move.l	d1,-(a3)
	move.w	d4,-(a3)
	lea.l	(L0068d4+$000090,pc),a3
	addq.l	#6,(a3)
	rts

L0062d8:
	bsr.w	L006256
	tst.w	d2
	beq.s	L0062ee
	bgt.s	L0062e6
	moveq.l	#$ff,d4
	bra.s	L0062f2

L0062e6:
	tst.w	d3
	beq.s	L0062ee
	moveq.l	#$ff,d4
	bra.s	L0062f2

L0062ee:
	move.w	d3,d4
	eor.w	d2,d4
L0062f2:
	move.l	d1,-(a3)
	move.w	d4,-(a3)
	lea.l	(L0068d4+$000090,pc),a3
	addq.l	#6,(a3)
	rts

L0062fe:
	.dc.b	$fd,$ea,$b1,$ee,$fd,$fe,$fd,$fe
	.dc.b	$fd,$fe,$fd,$fe,$fd,$fe,$fd,$fe
	.dc.b	$fd,$fe,$fd,$fe,$fd,$fe,$fd,$fe
	.dc.b	$b1,$ee,$b1,$ee,$b1,$ee,$b1,$ee
	.dc.b	$b1,$ee,$b1,$ee,$b1,$ee,$b1,$ee
	.dc.b	$b1,$ee,$b1,$ee,$b1,$ee,$b1,$ee
	.dc.b	$b1,$ee,$b1,$ee,$b1,$ee,$b1,$ee
	.dc.b	$b1,$ee,$b1,$ee,$b1,$ee,$b1,$ee
	.dc.b	$b1,$ee,$b1,$ee,$b1,$ee,$b1,$ee
	.dc.b	$b1,$ee,$b1,$ee,$b1,$ee,$b1,$ee
	.dc.b	$b1,$ee,$b1,$ee,$b1,$ee,$fe,$18
	.dc.b	$fe,$18,$b1,$ee,$fe,$50,$b1,$ee
	.dc.b	$b1,$ee,$b1,$ee,$b1,$ee,$b1,$ee
	.dc.b	$fe,$16,$fe,$16,$fe,$16,$fe,$16
	.dc.b	$fe,$16,$fe,$16,$b1,$ee,$b1,$ee
	.dc.b	$b1,$ee,$b1,$ee,$b1,$ee,$b1,$ee
	.dc.b	$b1,$ee,$b1,$ee,$b1,$ee,$b1,$ee
	.dc.b	$b1,$ee,$b1,$ee,$b1,$ee,$b1,$ee
	.dc.b	$b1,$ee,$b1,$ee,$b1,$ee,$a2,$e8
	.dc.b	$a2,$e8,$a2,$e8,$a2,$e8,$a2,$e8
	.dc.b	$fe,$18,$fe,$18,$b1,$ee,$fe,$50
	.dc.b	$b1,$ee,$b1,$ee,$b1,$ee,$b1,$ee
	.dc.b	$b1,$ee,$fe,$16,$fe,$16,$fe,$16
	.dc.b	$fe,$16,$fe,$16,$fe,$16,$b1,$ee
	.dc.b	$b1,$ee,$a2,$e8,$a2,$e8,$a2,$e8
	.dc.b	$a2,$e8,$a2,$e8,$b1,$ee,$b1,$ee
	.dc.b	$b1,$ee,$b1,$ee,$b1,$ee,$b1,$ee
	.dc.b	$b1,$ee,$b1,$ee,$b1,$ee,$b1,$ee
	.dc.b	$b1,$ee,$b1,$ee,$b1,$ee,$b1,$ee
	.dc.b	$b1,$ee,$b1,$ee,$b1,$ee,$b1,$ee
	.dc.b	$b1,$ee,$b1,$ee,$b1,$ee,$b1,$ee
	.dc.b	$b1,$ee,$b1,$ee,$b1,$ee,$b1,$ee
	.dc.b	$b1,$ee,$b1,$ee,$b1,$ee,$b1,$ee
	.dc.b	$b1,$ee,$b1,$ee,$fe,$14,$fe,$14
	.dc.b	$b1,$ee,$fe,$2a,$b1,$ee,$b1,$ee
	.dc.b	$b1,$ee,$b1,$ee,$b1,$ee,$fe,$12
	.dc.b	$fe,$12,$fe,$12,$fe,$12,$fe,$12
	.dc.b	$fe,$12,$b1,$ee,$b1,$ee,$b1,$ee
	.dc.b	$b1,$ee,$b1,$ee,$b1,$ee,$b1,$ee
	.dc.b	$b1,$ee,$b1,$ee,$b1,$ee,$b1,$ee
	.dc.b	$b1,$ee,$b1,$ee,$b1,$ee,$b1,$ee
	.dc.b	$b1,$ee,$b1,$ee,$a2,$e8,$a2,$e8
	.dc.b	$a2,$e8,$a2,$e8,$a2,$e8,$fe,$14
	.dc.b	$fe,$14,$b1,$ee,$fe,$2a,$b1,$ee
	.dc.b	$b1,$ee,$b1,$ee,$b1,$ee,$b1,$ee
	.dc.b	$fe,$12,$fe,$12,$fe,$12,$fe,$12
	.dc.b	$fe,$12,$fe,$12,$b1,$ee,$b1,$ee
	.dc.b	$a2,$e8,$a2,$e8,$a2,$e8,$a2,$e8
	.dc.b	$a2,$e8,$b1,$ee,$b1,$ee,$b1,$ee
	.dc.b	$b1,$ee,$b1,$ee,$b1,$ee,$b1,$ee
	.dc.b	$b1,$ee,$b1,$ee,$b1,$ee,$b1,$ee
	.dc.b	$b1,$ee,$b1,$ee,$b1,$ee,$b1,$ee
	.dc.b	$b1,$ee,$b1,$ee,$b1,$ee,$b1,$ee
	.dc.b	$b1,$ee,$b1,$ee,$b1,$ee,$b1,$ee
	.dc.b	$b1,$ee,$b1,$ee,$b1,$ee,$b1,$ee
	.dc.b	$b1,$ee,$b1,$ee,$b1,$ee,$fe,$74
	.dc.b	$fe,$74,$fe,$74,$fe,$74,$fe,$ae
	.dc.b	$fe,$cc,$fe,$cc,$fe,$cc,$fe,$cc
	.dc.b	$fe,$ea,$fe,$ea,$fe,$ea,$fe,$ea
	.dc.b	$fe,$ea,$fe,$ea,$ff,$08,$ff,$08
	.dc.b	$ff,$1e,$ff,$08,$ff,$1e,$ff,$08
	.dc.b	$ff,$94,$ff,$94,$ff,$94,$ff,$94
	.dc.b	$ff,$94,$ff,$94,$ff,$94,$a2,$e8
	.dc.b	$ff,$9e,$ff,$9e,$ff,$9e,$ff,$9e
	.dc.b	$ff,$9e,$ff,$9e,$ff,$ae,$ff,$da
	.dc.b	$ff,$9e,$ff,$9e,$ff,$9e,$ff,$9e
	.dc.b	$ff,$9e,$ff,$9e,$ff,$9e,$ff,$9e
	.dc.b	$ff,$9e,$ff,$9e,$ff,$9e,$ff,$9e
	.dc.b	$ff,$9e,$a2,$e8,$a2,$e8,$b1,$ee
	.dc.b	$b1,$ee,$b1,$ee,$b1,$ee,$b1,$ee
	.dc.b	$b1,$ee,$b1,$ee,$b1,$ee,$b1,$ee
	.dc.b	$b1,$ee,$b1,$ee,$b1,$ee,$b1,$ee
	.dc.b	$b1,$ee,$b1,$ee,$b1,$ee,$b1,$ee
	.dc.b	$b1,$ee,$b1,$ee,$b1,$ee,$b1,$ee
	.dc.b	$b1,$ee,$b1,$ee,$b1,$ee,$b1,$ee
	.dc.b	$b1,$ee,$a2,$e8,$b1,$ee,$b1,$ee
	.dc.b	$b1,$ee,$b1,$ee,$b1,$ee,$a2,$e8
	.dc.b	$a2,$e8,$a2,$e8,$a2,$e8,$a2,$e8
	.dc.b	$a2,$e8,$a2,$e8,$a2,$e8,$a2,$e8
	.dc.b	$a2,$e8,$b1,$ee,$b1,$ee
L00657c:
	link.w	a6,#-$01c0
	movem.l	d1-d4/a3-a4,-(sp)
	pea.l	(-$0180,a6)
	pea.l	(a0)
	DOS	_NAMECK
	addq.l	#8,sp
	tst.l	d0
	bne.w	L006766
	move.b	(-$012a,a6),d1
	movea.l	a0,a1
L00659a:
	tst.b	(a1)+
	bne.s	L00659a
	cmpi.b	#$2e,(-$0002,a1)	;'.'
	bne.s	L0065a8
	st.b	d1
L0065a8:
	lea.l	(L0068d4+$000074,pc),a3
	clr.b	(-$0100,a6)
L0065b0:
	pea.l	(a0)
	pea.l	(-$0100,a6)
	bsr.w	L006876
	addq.l	#8,sp
	tst.b	d1
	bne.s	L0065ce
	pea.l	(L006804,pc)
	pea.l	(-$0100,a6)
	bsr.w	L006876
	addq.l	#8,sp
L0065ce:
	move.w	#$0020,-(sp)		;' '
	pea.l	(-$0100,a6)
	pea.l	(-$01c0,a6)
	DOS	_FILES
	addq.l	#6,sp
	move.l	d0,(sp)+
	beq.s	L0065fa
	move.l	(a3),d0
	beq.w	L006766
	movea.l	d0,a3
	pea.l	($0004,a3)
	pea.l	(-$0100,a6)
	bsr.w	L006860
	addq.l	#8,sp
	bra.s	L0065b0

L0065fa:
	pea.l	(-$0100,a6)
	pea.l	(-$0080,a6)
	bsr.w	L006860
	addq.l	#8,sp
	pea.l	(-$0180,a6)
	pea.l	(-$0100,a6)
	DOS	_NAMECK
	addq.l	#8,sp
	pea.l	(-$0180,a6)
	pea.l	(-$0100,a6)
	bsr.w	L006860
	addq.l	#8,sp
	pea.l	(-$013d,a6)
	pea.l	(-$0100,a6)
	bsr.w	L006876
	addq.l	#8,sp
	pea.l	(-$012a,a6)
	pea.l	(-$0100,a6)
	bsr.w	L006876
	addq.l	#8,sp
	pea.l	(-$0100,a6)
	bsr.w	L0067bc
	addq.l	#4,sp
	moveq.l	#$ff,d4
	move.l	(L0068d4+$000064,pc),d0
	beq.s	L00667a
L006650:
	movea.l	d0,a4
	move.l	($0004,a4),d0
	beq.s	L006660
	cmp.l	d0,d4
	beq.s	L006674
	move.l	d0,d4
	bra.s	L006662

L006660:
	moveq.l	#$ff,d4
L006662:
	move.l	(a4),-(sp)
	pea.l	(-$0100,a6)
	bsr.w	L0068a8
	addq.l	#8,sp
	tst.l	d0
	beq.w	L0067b8
L006674:
	move.l	($008a,a4),d0
	bne.s	L006650
L00667a:
	lea.l	(L0068d4+$00007c,pc),a1
	lea.l	(L0068d4+$000084,pc),a2
	moveq.l	#$00,d1
	move.w	d1,-(sp)
	pea.l	(-$0100,a6)
	DOS	_OPEN
	addq.l	#6,sp
	move.l	d0,d3
	bmi.w	L006780
	move.w	#$0002,-(sp)
	move.l	d1,-(sp)
	move.w	d3,-(sp)
	DOS	_SEEK
	move.l	d0,d2
	move.l	d0,d7
	move.w	d1,($0006,sp)
	DOS	_SEEK
	addq.l	#8,sp
	btst.l	#$00,d2
	bne.w	L00677a
	moveq.l	#$20,d0			;' '
	cmp.l	d0,d2
	bcs.w	L00677a
	moveq.l	#$10,d0
	add.l	d0,d2
	sub.l	d2,(a2)
	bmi.w	L00054e
	movea.l	(a1),a3
	add.l	d2,(a1)
	sub.l	d0,d2
	move.l	d2,-(sp)
	pea.l	(a3)
	move.w	d3,-(sp)
	DOS	_READ
	lea.l	($000a,sp),sp
	cmp.l	d0,d2
	bne.w	L006780
	move.w	d3,-(sp)
	DOS	_CLOSE
	addq.l	#2,sp
	tst.l	d0
	bmi.w	L006780
	move.l	d1,(a3,d2.l)
	cmpi.w	#$d000,(a3)
	beq.s	L00670a
	cmpi.w	#$0068,(a3)		;'h'
	beq.s	L00670a
	cmpi.w	#$d100,(a3)
	bne.w	L006798
	moveq.l	#$02,d0
	cmp.l	($0002,a3),d0
	bne.w	L006798
L00670a:
	move.l	a3,d1
	pea.l	(-$0080,a6)
	bsr.w	L006892
	addq.l	#4,sp
	addq.l	#8,d0
	andi.w	#$fffe,d0
	sub.l	d0,(a2)
	bmi.w	L00054e
	movea.l	(a1),a0
	add.l	d0,(a1)
	pea.l	(-$0080,a6)
	pea.l	(a0)
	bsr.w	L006860
	addq.l	#8,sp
	pea.l	(-$0100,a6)
	bsr.w	L006892
	addq.l	#4,sp
	addq.l	#8,d0
	andi.w	#$fffe,d0
	sub.l	d0,(a2)
	bmi.w	L00054e
	movea.l	(a1),a3
	add.l	d0,(a1)
	pea.l	(-$0100,a6)
	pea.l	(a3)
	bsr.w	L006860
	addq.l	#8,sp
	movea.l	a3,a1
	movea.l	d1,a2
	moveq.l	#$00,d0
L00675e:
	movem.l	(sp)+,d1-d4/a3-a4
	unlk	a6
	rts

L006766:
	pea.l	(L006807,pc)
	DOS	_PRINT
	pea.l	(a0)
	DOS	_PRINT
	addq.l	#8,sp
	bsr.w	L000c82
	moveq.l	#$ff,d0
	bra.s	L00675e

L00677a:
	pea.l	(L006814,pc)
	bra.s	L006784

L006780:
	pea.l	(L006829,pc)
L006784:
	DOS	_PRINT
	pea.l	(-$0100,a6)
	DOS	_PRINT
	addq.l	#8,sp
	bsr.w	L000c82
	move.w	#$0001,-(sp)
	DOS	_EXIT2

L006798:
	add.l	#$00000010,d2
	add.l	d2,(a2)
	sub.l	d2,(a1)
	pea.l	(L00683b,pc)
	DOS	_PRINT
	pea.l	(-$0100,a6)
	DOS	_PRINT
	addq.l	#8,sp
	bsr.w	L000c82
	moveq.l	#$fe,d0
	bra.s	L00675e

L0067b8:
	moveq.l	#$01,d0
	bra.s	L00675e

L0067bc:
	movem.l	d0/a0-a1,-(sp)
	movea.l	($0010,sp),a0
	lea.l	(a0),a1
L0067c6:
	move.b	(a0)+,d0
	move.b	d0,(a1)+
	beq.s	L0067de
	bpl.s	L0067e4
	cmpi.b	#$a0,d0
	bcs.s	L0067da
	cmpi.b	#$e0,d0
	bcs.s	L0067e4
L0067da:
	move.b	(a0)+,(a1)+
	bne.s	L0067c6
L0067de:
	movem.l	(sp)+,d0/a0-a1
	rts

L0067e4:
	bsr.s	L0067f8
	bne.s	L0067c6
	move.b	(L0068d4+$0005dc,pc),(-$0001,a1)
L0067ee:
	move.b	(a0)+,d0
	bsr.s	L0067f8
	beq.s	L0067ee
	subq.l	#1,a0
	bra.s	L0067c6

L0067f8:
	cmpi.b	#$5c,d0			;'\'
	beq.s	L006802
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
	movem.l	a0-a1,-(sp)
	movem.l	($000c,sp),a0-a1
	move.l	a0,d0
L00686c:
	move.b	(a1)+,(a0)+
	bne.s	L00686c
	movem.l	(sp)+,a0-a1
	rts

L006876:
	movem.l	a0-a1,-(sp)
	movem.l	($000c,sp),a0-a1
	move.l	a0,d0
L006882:
	tst.b	(a0)+
	bne.s	L006882
	subq.l	#1,a0
L006888:
	move.b	(a1)+,(a0)+
	bne.s	L006888
	movem.l	(sp)+,a0-a1
	rts

L006892:
	move.l	a0,-(sp)
	movea.l	($0008,sp),a0
	move.l	a0,d0
L00689a:
	tst.b	(a0)+
	bne.s	L00689a
	subq.l	#1,a0
	suba.l	d0,a0
	move.l	a0,d0
	movea.l	(sp)+,a0
	rts

L0068a8:
	movem.l	d1/a0-a1,-(sp)
	movem.l	($0010,sp),a0-a1
L0068b2:
	move.b	(a1)+,d1
	beq.s	L0068c8
	move.b	(a0)+,d0
	beq.s	L0068c4
	cmp.b	d0,d1
	beq.s	L0068b2
	bhi.s	L0068c4
L0068c0:
	moveq.l	#$01,d0
	bra.s	L0068ce

L0068c4:
	moveq.l	#$ff,d0
	bra.s	L0068ce

L0068c8:
	cmp.b	(a0),d1
	bcs.s	L0068c0
	moveq.l	#$00,d0
L0068ce:
	movem.l	(sp)+,d1/a0-a1
	rts

L0068d4:

	.end	L000000
