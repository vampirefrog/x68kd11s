;=============================================
;  Filename human302/bin/pr.x
;
;
;  Base address 000000
;  Exec address 000000
;  Text size    000b6c byte(s)
;  Data size    000000 byte(s)
;  Bss  size    0010aa byte(s)
;  190 Labels
;
;  Commandline dis  -h -k -m68000 -q1 -B -M -w16 -o120 -ghuman302/bin/pr.lab --overwrite human302/bin/pr.x human302/bin/pr.s
;          DIS version 3.16
;=============================================

	.include	inc/doscall.mac
	.include	inc/iocscall.mac
	.include	inc/fefunc.mac

	.cpu	68000

	.text

Start:
	lea.l	(End),a7
	bsr	L0007b8
	move.l	a0,-(a7)
	bsr	L000624
	movea.l	(a7)+,a0
	bsr	L000656
	bsr	L0001aa
	bsr	L000910
	clr.w	d0
	bra	L0007ee

L000024:
	lea.l	(L000167,pc),a0
	bra	L000034

L00002a:
	lea.l	(L00018a,pc),a0
	bra	L000034

L000030:
	lea.l	(L00003e,pc),a0
L000034:
	bsr	L000aa2
	moveq.l	#$01,d0
	bra	L0007ee

L00003e:
	.dc.b	'X68k Print v1.01 Copyright 1989 SHARP/Hudson',$0d,$0a
	.dc.b	'使用法：pr［スイッチ］［入力ファイル］［出力ファイル］',$0d,$0a
	.dc.b	$09,'/f',$09,$09,'フォームフィードコードの出力',$0d,$0a
	.dc.b	$09,'/hタイトル',$09,'タイトルの設定',$0d,$0a
	.dc.b	$09,'/l数値',$09,$09,'ページ長',$0d,$0a
	.dc.b	$09,'/w数値',$09,$09,'ページ幅',$0d,$0a
	.dc.b	$09,'/n',$09,$09,'ラインナンバーの出力',$0d,$0a
	.dc.b	$09,'/t',$09,$09,'ヘッダーの出力禁止',$0d,$0a
	.dc.b	$09,'/b数値',$09,$09,'タブサイズ（２，４，８，１６）',$0d,$0a,$00
L000167:
	.dc.b	'pr：ファイルがオープンできません',$0d,$0a,$00
L00018a:
	.dc.b	'pr：ファィルが見つかりません',$0d,$0a,$00,$00
L0001aa:
	move.l	#L0011f4,(L0011ec)
	move.l	#L001604,(L0011f0)
	cmpi.w	#$0001,(L0010c6)
	bhi	L000202
	beq	L0001fc
	bsr	L000846
	tst.l	d0
	bmi	L000024
	bsr	L000870
	lea.l	(L000f7c),a1
	clr.w	($001e,a1)
	bsr	L0007f2
	move.l	d0,($0016,a1)
	bsr	L000274
	movem.l	a1,-(a7)
	bsr	L000908
	movem.l	(a7)+,a1
	rts

L0001fc:
	bsr	L000870
	bra	L00020c

L000202:
	lea.l	(L00110a),a0
	bsr	L0008d0
L00020c:
	lea.l	(L0010c8),a0
	lea.l	(L000f7c),a1
	lea.l	(L000fbc),a2
	bsr	L0007fe
	tst.l	d0
	bmi	L00002a
	tst.b	(L00114c)
	beq	L000238
	bsr	L0007f2
	move.l	d0,($0016,a1)
L000238:
	bsr	L000256
	bsr	L0008b8
	bsr	L000274
	movem.l	a1,-(a7)
	bsr	L000908
	movem.l	(a7)+,a1
	bsr	L000816
	tst.l	d0
	bpl	L000238
	rts

L000256:
	lea.l	(L00103c),a0
	movem.l	a0-a2,-(a7)
L000260:
	move.b	(a2)+,(a0)+
	bne	L000260
	subq.l	#1,a0
	lea.l	($001e,a1),a1
L00026a:
	move.b	(a1)+,(a0)+
	bne	L00026a
	movem.l	(a7)+,a0-a2
	rts

L000274:
	move.l	a1,-(a7)
	clr.w	(L0011dc)
	clr.w	(L0011da)
	clr.w	(L0011de)
L000288:
	clr.w	(L0011e0)
	lea.l	(L000b6c),a0
	bsr	L00092e
	tst.l	d0
	bmi	L0002e6
	addq.w	#1,(L0011da)
L0002a2:
	tst.w	(L0011de)
	bne	L0002ac
	bsr	L0002f6
L0002ac:
	addq.w	#1,(L0011de)
	addq.w	#1,(L0011e0)
	bsr	L0004f2
	move.l	a0,-(a7)
	lea.l	(L000d74),a0
	bsr	L0009d2
	move.w	(L0011d2),d0
	sub.w	(L0011de),d0
	cmp.w	#$0002,d0
	bhi	L0002de
	bsr	L000446
L0002de:
	movea.l	(a7)+,a0
	tst.b	(a0)
	beq	L000288
	bra	L0002a2

L0002e6:
	tst.w	(L0011de)
	beq	L0002f2
	bsr	L000446
L0002f2:
	movea.l	(a7)+,a1
	rts

L0002f6:
	tst.w	(L0011d8)
	bne	L00035e
	move.l	a0,-(a7)
	addq.w	#1,(L0011dc)
	lea.l	(L000d74),a1
	bsr	L00038a
	move.w	#$0020,d0		;' '
	move.b	d0,(a1)+
	move.b	d0,(a1)+
	lea.l	(L00114c),a0
	tst.b	(a0)
	bne	L000326
	lea.l	(L000f9a),a0
L000326:
	bsr	L000382
	move.w	#$0020,d0		;' '
	move.b	d0,(a1)+
	move.b	d0,(a1)+
	lea.l	(L00037c,pc),a0
	bsr	L000382
	move.w	(L0011dc),d0
	bsr	L0005c8
	lea.l	(L0010bc),a0
L000346:
	cmpi.b	#$20,(a0)+		;' '
	beq	L000346
	subq.l	#1,a0
	bsr	L000382
	clr.b	(a1)
	lea.l	(L000d74),a0
	bsr	L0009d2
	movea.l	(a7)+,a0
L00035e:
	move.l	a0,-(a7)
	lea.l	(L000484,pc),a0
	bsr	L0009d2
	bsr	L0009d2
	bsr	L0009d2
	movea.l	(a7)+,a0
	move.w	#$0003,(L0011de)
	rts

L00037c:
	.dc.b	'Page ',$00
L000382:
	move.b	(a0)+,(a1)+
	bne	L000382
	subq.l	#1,a1
	rts

L00038a:
	move.l	(L000f92),d1
	move.w	d1,d0
	rol.w	#7,d0
	and.l	#$0000007f,d0
	add.w	#$07bc,d0
	bsr	L00041a
	move.b	#$2d,(a1)+		;'-'
	move.l	d1,d0
	lsr.l	#5,d0
	and.w	#$000f,d0
	subq.w	#1,d0
	lsl.w	#2,d0
	lea.l	(L0003ea,pc,d0.w),a0
	move.b	(a0)+,(a1)+
	move.b	(a0)+,(a1)+
	move.b	(a0)+,(a1)+
	move.b	#$2d,(a1)+		;'-'
	move.l	d1,d0
	and.w	#$001f,d0
	bsr	L000428
	move.b	#$20,d0			;' '
	move.b	d0,(a1)+
	move.b	d0,(a1)+
	swap.w	d1
	move.w	d1,d0
	rol.w	#5,d0
	and.w	#$001f,d0
	bsr	L000428
	move.b	#$3a,(a1)+		;':'
	move.w	d1,d0
	lsr.w	#5,d0
	and.w	#$003f,d0
	bsr	L000428
	rts

L0003ea:
	.dc.b	'Jan',$00
L0003ee:
	.dc.b	'Feb',$00
L0003f2:
	.dc.b	'Mar',$00
L0003f6:
	.dc.b	'Apl',$00
L0003fa:
	.dc.b	'May',$00
L0003fe:
	.dc.b	'Jun',$00
L000402:
	.dc.b	'Jul',$00
L000406:
	.dc.b	'Aug',$00
L00040a:
	.dc.b	'Sep',$00
L00040e:
	.dc.b	'Oct',$00
L000412:
	.dc.b	'Nov',$00
L000416:
	.dc.b	'Dec',$00
L00041a:
	and.l	#$0000ffff,d0
	divu.w	#$0064,d0
	bsr	L000428
	swap.w	d0
L000428:
	move.l	d0,-(a7)
	and.l	#$0000ffff,d0
	divu.w	#$000a,d0
	add.w	#$0030,d0
	move.b	d0,(a1)+
	swap.w	d0
	add.w	#$0030,d0
	move.b	d0,(a1)+
	move.l	(a7)+,d0
	rts

L000446:
	tst.w	(L0011d4)
	beq	L00045e
	lea.l	(L000482,pc),a0
	bsr	L0009d2
	clr.w	(L0011de)
	rts

L00045e:
	lea.l	(L000484,pc),a0
L000462:
	bsr	L0009d2
	addq.w	#1,(L0011de)
	move.w	(L0011de),d0
	cmp.w	(L0011d2),d0
	bcs	L000462
	clr.w	(L0011de)
	rts

L000482:
	.dc.b	$0c,$00
L000484:
	movep.w	($0000,a2),d6
L000488:
	clr.w	(L0011e2)
	tst.w	(L0011d6)
	bne	L000498
	rts

L000498:
	move.l	a0,-(a7)
	cmpi.w	#$0001,(L0011e0)
	bne	L0004e6
	move.b	#$20,(a1)+		;' '
	move.w	(L0011da),d0
	divu.w	#$000a,d0
	swap.w	d0
	tst.w	d0
	bne	L0004be
	move.b	#$2b,(-$0001,a1)	;'+'
L0004be:
	move.w	(L0011da),d0
	bsr	L0005c8
	lea.l	(L0010bd),a0
	bsr	L000382
	move.b	#$3a,(a1)+		;':'
L0004d6:
	move.b	#$20,(a1)+		;' '
	move.w	#$0007,(L0011e2)
	movea.l	(a7)+,a0
	rts

L0004e6:
	move.w	#$2020,d0		;'  '
	move.w	d0,(a1)+
	move.w	d0,(a1)+
	move.w	d0,(a1)+
	bra	L0004d6

L0004f2:
	lea.l	(L000d74),a1
	bsr	L000488
	clr.w	d7
L0004fc:
	move.b	(a0),d0
	beq	L00052a
	addq.l	#1,a0
	cmp.b	#$09,d0
	beq	L000536
	addq.w	#1,d7
	move.b	d0,(a1)+
	bsr	L000594
	bcs	L000518
	bsr	L000564
	bcs	L00052a
	bra	L0004fc

L000518:
	asl.w	#8,d0
	move.b	(a0)+,d0
	move.b	d0,(a1)+
	bsr	L0005b0
	bcs	L000526
	addq.w	#1,d7
L000526:
	bsr	L000564
	bcc	L0004fc
L00052a:
	move.b	#$0d,(a1)+
	move.b	#$0a,(a1)+
	clr.b	(a1)
	rts

L000536:
	move.w	d7,d1
	move.w	(L0011ce),d0
	lsl.w	#1,d0
	move.w	(L00055c,pc,d0.w),d2
	add.w	d2,d1
	addq.w	#1,d1
	not.w	d2
	and.w	d2,d1
L00054c:
	addq.w	#1,d7
	move.b	#$20,(a1)+		;' '
	bsr	L000564
	bcs	L00052a
	cmp.w	d7,d1
	bne	L00054c
	bra	L0004fc

L00055c:
	.dc.w	$0001,$0003,$0007,$000f
L000564:
	move.w	d7,d0
	addq.w	#1,d0
	add.w	(L0011e2),d0
	cmp.w	(L0011d0),d0
	bhi	L00058e
	bcs	L000588
	move.b	(a0),d0
	bsr	L000594
	bcc	L000588
	asl.w	#8,d0
	move.b	($0001,a0),d0
	bsr	L0005b0
	bcc	L00058e
L000588:
	andi.b	#$fe,ccr
	rts

L00058e:
	ori.b	#$01,ccr
	rts

L000594:
	tst.b	d0
	bpl	L0005aa
	cmp.b	#$e0,d0
	bcc	L0005a4
	cmp.b	#$a0,d0
	bcc	L0005aa
L0005a4:
	ori.b	#$01,ccr
	rts

L0005aa:
	andi.b	#$fe,ccr
	rts

L0005b0:
	cmp.w	#$8140,d0
	bcs	L0005c2
	cmp.w	#$f000,d0
	bcc	L0005c2
	andi.b	#$fe,ccr
	rts

L0005c2:
	ori.b	#$01,ccr
	rts

L0005c8:
	move.l	a0,-(a7)
	lea.l	(L0010bc),a0
	and.l	#$0000ffff,d0
	move.w	#$2710,d1
	bsr	L000602
	move.w	#$03e8,d1
	bsr	L000602
	move.w	#$0064,d1		;'d'
	bsr	L000602
	move.w	#$000a,d1
	bsr	L000602
	move.w	#$0001,d1
	bsr	L000602
	clr.b	(a0)
	lea.l	(L0010bc),a0
	bsr	L000610
	movea.l	(a7)+,a0
	rts

L000602:
	divu.w	d1,d0
	add.w	#$0030,d0
	move.b	d0,(a0)+
	clr.w	d0
	swap.w	d0
	rts

L000610:
	moveq.l	#$03,d1
L000612:
	move.b	(a0),d0
	cmp.b	#$30,d0			;'0'
	bne	L000622
	move.b	#$20,(a0)+		;' '
	dbra	d1,L000612
L000622:
	rts

L000624:
	move.w	#$0042,(L0011d2)	;'B'
	move.w	#$0050,(L0011d0)	;'P'
	move.w	#$0002,(L0011ce)
	clr.w	(L0011d4)
	clr.w	(L00114c)
	clr.w	(L0011d6)
	clr.w	(L0011d8)
	rts

L000656:
	clr.w	(L0010c6)
	clr.w	(L0010c8)
	clr.w	(L00110a)
L000668:
	bsr	L000698
	tst.b	(a0)
	beq	L000674
	bsr	L000676
	tst.b	(a0)
	bne	L000668
L000674:
	rts

L000676:
	lea.l	(L0010c8),a1
	tst.w	(a1)
	beq	L00068c
	lea.l	(L00110a),a1
	tst.w	(a1)
	bne	L000030
L00068c:
	bsr	L0007a4
	addq.w	#1,(L0010c6)
	rts

L000698:
	bsr	L000764
	cmp.b	#$2d,d0			;'-'
	beq	L0006aa
	cmp.b	#$2f,d0			;'/'
	beq	L0006aa
	rts

L0006aa:
	addq.l	#1,a0
L0006ac:
	move.b	(a0),d0
	beq	L000698
	cmp.b	#$20,d0			;' '
	beq	L000698
	addq.l	#1,a0
	bsr	L000792
	lea.l	(L0006d0,pc),a1
L0006c0:
	move.w	(a1)+,d1
	bmi	L000030
	movea.l	(a1)+,a2
	cmp.b	d1,d0
	bne	L0006c0
	jsr	(a2)
	bra	L0006ac

L0006d0:
	.dc.b	$00,$66
	.dc.l	L0006fc
	.dc.b	$00,$68
	.dc.l	L000718
	.dc.b	$00,$6c
	.dc.l	L000724
	.dc.b	$00,$6e
	.dc.l	L000704
	.dc.b	$00,$74
	.dc.l	L00070c
	.dc.b	$00,$77
	.dc.l	L00072e
	.dc.b	$00,$62
	.dc.l	L000738
	.dc.b	$ff,$ff
L0006fc:
	lea.l	(L0011d4),a1
	bra	L000712

L000704:
	lea.l	(L0011d6),a1
	bra	L000712

L00070c:
	lea.l	(L0011d8),a1
L000712:
	eori.w	#$ffff,(a1)
	rts

L000718:
	lea.l	(L00114c),a1
	bsr	L0007a4
	rts

L000724:
	bsr	L00076e
	move.w	d0,(L0011d2)
	rts

L00072e:
	bsr	L00076e
	move.w	d0,(L0011d0)
	rts

L000738:
	bsr	L00076e
	clr.w	d1
	cmp.w	#$0002,d0
	beq	L00075c
	addq.w	#1,d1
	cmp.w	#$0004,d0
	beq	L00075c
	addq.w	#1,d1
	cmp.w	#$0008,d0
	beq	L00075c
	addq.w	#1,d1
	cmp.w	#$0010,d0
	bne	L000030
L00075c:
	move.w	d1,(L0011ce)
	rts

L000764:
	cmpi.b	#$20,(a0)+		;' '
	beq	L000764
	move.b	-(a0),d0
	rts

L00076e:
	clr.l	d1
	clr.l	d0
L000772:
	move.b	(a0)+,d0
	sub.w	#$0030,d0
	bmi	L000788
	cmp.w	#$000a,d0
	bcc	L000788
	mulu.w	#$000a,d1
	add.l	d0,d1
	bra	L000772

L000788:
	subq.l	#1,a0
	move.l	d1,d0
	beq	L000030
	rts

L000792:
	cmp.b	#$5b,d0			;'['
	bcc	L0007a2
	cmp.b	#$41,d0			;'A'
	bcs	L0007a2
	add.b	#$20,d0			;' '
L0007a2:
	rts

L0007a4:
	move.b	(a0)+,d0
	beq	L0007b2
	cmp.b	#$20,d0			;' '
	beq	L0007b2
	move.b	d0,(a1)+
	bra	L0007a4

L0007b2:
	subq.l	#1,a0
	clr.b	(a1)+
	rts

L0007b8:
	adda.l	#$00000010,a0
	suba.l	a0,a1
	movem.l	a0-a1,-(a7)
	DOS	_SETBLOCK
	move.l	#$00ffffff,(a7)
	DOS	_MALLOC
	and.l	#$00ffffff,d0
	move.l	d0,(a7)
	DOS	_MALLOC
	move.l	d0,(L0011e4)
	add.l	(a7)+,d0
	move.l	d0,(L0011e8)
	addq.l	#4,a7
	lea.l	($0001,a2),a0
	rts

L0007ee:
	move.w	d0,-(a7)
	DOS	_EXIT2

L0007f2:
	DOS	_GETDATE
	move.w	d0,-(a7)
	DOS	_GETTIME
	swap.w	d0
	move.w	(a7)+,d0
	rts

L0007fe:
	pea.l	(a2)
	pea.l	(a0)
	DOS	_NAMECK
	addq.l	#8,a7
	move.w	#$0020,-(a7)		;' '
	pea.l	(a0)
	pea.l	(a1)
	DOS	_FILES
	lea.l	($000a,a7),a7
	rts

L000816:
	pea.l	(a1)
	DOS	_NFILES
	addq.l	#4,a7
	rts

L00081e:
	movea.l	(L0011f0),a1
	move.l	d0,-(a7)
	move.l	a0,-(a7)
	move.w	(a1),-(a7)
	DOS	_WRITE
	lea.l	($000a,a7),a7
	rts

L000832:
	movea.l	(L0011ec),a1
	move.l	d0,-(a7)
	move.l	a0,-(a7)
	move.w	(a1),-(a7)
	DOS	_READ
	lea.l	($000a,a7),a7
	rts

L000846:
	movea.l	(L0011ec),a1
	move.w	#$0000,-(a7)
	DOS	_DUP
	tst.l	d0
	bmi	L00086c
	move.w	d0,(a1)
	DOS	_CLOSE
	move.w	#$0002,(a7)
	DOS	_DUP
	tst.l	d0
	bmi	L00086c
	addq.l	#2,a7
	move.w	#$0000,d0
	bra	L00087e

L00086c:
	addq.l	#2,a7
	rts

L000870:
	movea.l	(L0011f0),a1
	move.w	#$0001,(a1)
	move.w	#$0001,d0
L00087e:
	move.w	d0,($0002,a1)
	clr.w	($0006,a1)
	clr.w	($0004,a1)
	clr.w	($0008,a1)
	rts

L000890:
	move.l	a0,($000a,a1)
	clr.w	($0006,a1)
	clr.w	($0004,a1)
	clr.w	($0008,a1)
	clr.w	($000e,a1)
	move.w	($0002,a1),-(a7)
	move.l	a0,-(a7)
	DOS	_OPEN
	addq.l	#6,a7
	move.w	d0,($0000.w,a1)
	movea.l	($000a,a1),a0
	rts

L0008b8:
	movem.l	a0-a1,-(a7)
	movea.l	(L0011ec),a1
	move.w	#$0000,($0002,a1)
	bsr	L000890
	movem.l	(a7)+,a0-a1
	rts

L0008d0:
	movem.l	a0-a1,-(a7)
	movea.l	(L0011f0),a1
	move.w	#$0002,($0002,a1)
	move.w	#$0020,-(a7)		;' '
	pea.l	(a0)
	DOS	_DELETE
	DOS	_CREATE
	addq.l	#6,a7
	tst.l	d0
	bpl	L0008f2
	bsr	L000890
L0008f2:
	move.w	d0,($0000.w,a1)
	clr.w	($0008,a1)
	clr.w	($000e,a1)
	move.l	a0,($000a,a1)
	movem.l	(a7)+,a0-a1
	rts

L000908:
	movea.l	(L0011ec),a1
	bra	L000920

L000910:
	movea.l	(L0011f0),a1
	tst.w	($0000.w,a1)
	ble	L000920
	bsr	L000a58
L000920:
	cmpi.w	#$0005,(a1)
	bcs	L00092c
	move.w	(a1),-(a7)
	DOS	_CLOSE
	addq.l	#2,a7
L00092c:
	rts

L00092e:
	movem.l	d1/a0-a1,-(a7)
	clr.w	d1
	lea.l	(L0011f4),a1
L00093a:
	move.w	($0008,a1),d0
	cmp.w	($0006,a1),d0
	bcs	L00094c
	bsr	L000a34
	subq.l	#1,d0
	bmi	L0009a0
L00094c:
	move.w	($0008,a1),d0
	move.b	($10,a1,d0.w),d0
	addq.w	#1,($0008,a1)
	tst.w	($000e,a1)
	bne	L000984
	cmp.b	#$0d,d0
	beq	L0009ac
	cmp.b	#$1a,d0
	beq	L00099c
	cmp.b	#$80,d0
	bcs	L000988
	cmp.b	#$a0,d0
	bcs	L00097c
	cmp.b	#$e0,d0
	bcs	L000988
L00097c:
	move.w	#$ffff,($000e,a1)
	bra	L000988

L000984:
	clr.w	($000e,a1)
L000988:
	move.b	d0,(a0)+
	addq.w	#1,d1
	cmp.w	#$00fe,d1
	bcs	L00093a
	tst.w	($000e,a1)
	bne	L00093a
	clr.b	(a0)
	bra	L0009cc

L00099c:
	subq.w	#1,($0008,a1)
L0009a0:
	cmpa.l	($0004,a7),a0
	beq	L0009ca
	clr.b	(a0)
	clr.l	d0
	bra	L0009cc

L0009ac:
	clr.b	(a0)
	move.w	($0008,a1),d0
	cmp.w	($0006,a1),d0
	bcs	L0009be
	bsr	L000a34
	subq.l	#1,d0
	bmi	L0009c6
L0009be:
	addq.w	#1,($0008,a1)
	clr.l	d0
	bra	L0009cc

L0009c6:
	clr.w	($0008,a1)
L0009ca:
	moveq.l	#$ff,d0
L0009cc:
	movem.l	(a7)+,d1/a0-a1
	rts

L0009d2:
	movem.l	a0-a1,-(a7)
	movea.l	(L0011f0),a1
L0009dc:
	clr.l	d0
	move.w	($0008,a1),d0
	cmp.w	#$0400,d0
	bcs	L000a04
	move.l	d0,-(a7)
	pea.l	($0010,a1)
	move.w	($0000.w,a1),-(a7)
	DOS	_WRITE
	adda.l	#$0000000a,a7
	cmp.w	($0008,a1),d0
	bne	L000a7a
	clr.w	($0008,a1)
L000a04:
	tst.w	($000e,a1)
	bne	L000a1c
	move.b	(a0),d0
	beq	L000a2e
	bsr	L000594
	bcc	L000a20
	move.w	#$ffff,($000e,a1)
	bra	L000a20

L000a1c:
	clr.w	($000e,a1)
L000a20:
	move.w	($0008,a1),d0
	move.b	(a0)+,($10,a1,d0.w)
	addq.w	#1,($0008,a1)
	bra	L0009dc

L000a2e:
	movem.l	(a7)+,a0-a1
	rts

L000a34:
	move.l	#$00000400,-(a7)
	pea.l	($0010,a1)
	move.w	($0000.w,a1),-(a7)
	DOS	_READ
	adda.l	#$0000000a,a7
	move.w	d0,($0006,a1)
	addq.w	#1,($0004,a1)
	clr.w	($0008,a1)
	rts

L000a58:
	clr.l	d0
	move.w	($0008,a1),d0
	beq	L000a78
	move.l	d0,-(a7)
	pea.l	($0010,a1)
	move.w	($0000.w,a1),-(a7)
	DOS	_WRITE
	adda.l	#$0000000a,a7
	cmp.w	($0008,a1),d0
	bne	L000a7a
L000a78:
	rts

L000a7a:
	pea.l	(L000a8c)
	DOS	_PRINT
	addq.l	#4,a7
	move.w	#$0001,d0
	bra	L0007ee

L000a8c:
	.dc.b	'Abort: Device full',$0d,$0a,$00,$00
L000aa2:
	pea.l	(a0)
	DOS	_PRINT
	addq.l	#4,a7
	rts

L000aaa:
	move.w	d0,-(a7)
	DOS	_PUTCHAR
	move.w	(a7)+,d0
	rts

L000ab2:
	move.l	d0,-(a7)
	move.w	#$000d,-(a7)
	DOS	_PUTCHAR
	move.w	#$000a,(a7)
	DOS	_PUTCHAR
	addq.l	#2,a7
	move.l	(a7)+,d0
	rts

L000ac6:
	movem.l	d0-d2,-(a7)
	move.w	d0,d2
	rol.w	#8,d2
	bra	L000ade

L000ad0:
	movem.l	d0-d2,-(a7)
	move.w	d0,d2
	rol.w	#4,d2
	bsr	L000aec
	rol.w	#4,d2
	bsr	L000aec
L000ade:
	rol.w	#4,d2
	bsr	L000aec
	rol.w	#4,d2
	bsr	L000aec
	movem.l	(a7)+,d0-d2
	rts

L000aec:
	move.w	d2,d0
	and.w	#$000f,d0
	cmp.w	#$000a,d0
	bcs	L000afa
	addq.w	#7,d0
L000afa:
	add.w	#$0030,d0
	bra	L000aaa

L000b00:
	link.w	a6,#-$0006
	movem.l	d0-d2/a0,-(a7)
	lea.l	(-$0006,a6),a0
	and.l	#$0000ffff,d0
	move.w	#$2710,d1
	bsr	L000b46
	move.w	#$03e8,d1
	bsr	L000b46
	move.w	#$0064,d1		;'d'
	bsr	L000b46
	move.w	#$000a,d1
	bsr	L000b46
	move.w	#$0001,d1
	bsr	L000b46
	clr.b	(a0)
	lea.l	(-$0006,a6),a0
	bsr	L000b54
	addq.l	#1,a0
	bsr	L000aa2
	movem.l	(a7)+,d0-d2/a0
	unlk	a6
	rts

L000b46:
	divu.w	d1,d0
	add.w	#$0030,d0
	move.b	d0,(a0)+
	clr.w	d0
	swap.w	d0
	rts

L000b54:
	move.l	a0,-(a7)
	moveq.l	#$03,d1
L000b58:
	move.b	(a0),d0
	cmp.b	#$30,d0			;'0'
	bne	L000b68
	move.b	#$20,(a0)+		;' '
	dbra	d1,L000b58
L000b68:
	movea.l	(a7)+,a0
	rts


	.bss

L000b6c:
	.ds.b	520
L000d74:
	.ds.b	520
L000f7c:
	.ds.b	22
L000f92:
	.ds.b	8
L000f9a:
	.ds.b	34
L000fbc:
	.ds.b	128
L00103c:
	.ds.b	128
L0010bc:
	.ds.b	1
L0010bd:
	.ds.b	9
L0010c6:
	.ds.w	1
L0010c8:
	.ds.b	66
L00110a:
	.ds.b	66
L00114c:
	.ds.b	130
L0011ce:
	.ds.w	1
L0011d0:
	.ds.w	1
L0011d2:
	.ds.w	1
L0011d4:
	.ds.w	1
L0011d6:
	.ds.w	1
L0011d8:
	.ds.w	1
L0011da:
	.ds.w	1
L0011dc:
	.ds.w	1
L0011de:
	.ds.w	1
L0011e0:
	.ds.w	1
L0011e2:
	.ds.w	1
L0011e4:
	.ds.l	1
L0011e8:
	.ds.l	1
L0011ec:
	.ds.l	1
L0011f0:
	.ds.l	1
L0011f4:
	.ds.b	1040
L001604:
	.ds.b	1554
End:

	.end	Start
