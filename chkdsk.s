;=============================================
;  Filename chkdsk.x
;
;
;  Base address 000000
;  Exec address 000000
;  Text size    00077c byte(s)
;  Data size    0001a8 byte(s)
;  Bss  size    012832 byte(s)
;  114 Labels
;
;  Commandline dis  -b2 -h -m68000 --sp -q1 -B -M -o120 -gchkdsk.lab --overwrite chkdsk.x chkdsk.s
;          DIS version 3.16
;=============================================

	.include	inc/doscall.mac
	.include	inc/iocscall.mac
	.include	inc/fefunc.mac

	.cpu	68000

	.text

Start:
	lea.l	(L003156),sp
	clr.b	(L000924)
	DOS	_VERNUM
	cmp.w	#$0150,d0
	bcs.s	L00001c
	move.b	#$02,(L000924)
L00001c:
	lea.l	(-$0092,sp),sp
	movea.l	sp,a6
	clr.w	(L000926)
	clr.w	(L000928)
	clr.w	(L00092a)
	clr.w	(L00092c)
	clr.w	(L00092e)
	clr.w	(L000932)
	clr.w	(L000936)
	DOS	_CURDRV
	move.w	d0,(L000942)
	add.b	#$41,d0			;'A'
	move.b	d0,(L0008bf)
	clr.w	(L000944)
	addq.l	#1,a2
L000066:
	bsr.w	L00068a
	tst.b	d0
	beq.w	L000118
	cmp.b	#$2f,d0			;'/'
	beq.s	L0000d6
	cmp.b	#$2d,d0			;'-'
	beq.s	L0000d6
	cmpi.b	#$3a,(a2)		;':'
	bne.s	L0000b0
	and.w	#$00df,d0
	cmp.b	#$41,d0			;'A'
	bcs.w	L0005ca
	cmp.b	#$5b,d0			;'['
	bcc.w	L0005ca
	move.b	d0,(L0008bf)
	sub.w	#$0041,d0
	move.w	d0,(L000942)
	addq.l	#1,a2
	bsr.w	L00068a
	tst.b	d0
	beq.s	L000118
L0000b0:
	lea.l	(L0008c8),a0
L0000b6:
	cmp.b	#$2d,d0			;'-'
	beq.s	L0000d4
	cmp.b	#$2f,d0			;'/'
	beq.s	L0000d4
	cmp.b	#$20,d0			;' '
	beq.s	L0000d0
	move.b	d0,(a0)+
	beq.s	L000118
	move.b	(a2)+,d0
	bra.s	L0000b6

L0000d0:
	clr.b	(a0)
	bra.s	L000066

L0000d4:
	clr.b	(a0)
L0000d6:
	move.b	(a2)+,d0
	beq.w	L0005ca
	or.b	#$20,d0
	cmp.b	#$61,d0			;'a'
	beq.s	L000100
	cmp.b	#$66,d0			;'f'
	beq.s	L00010c
	cmp.b	#$76,d0			;'v'
	bne.w	L0005ca
	bset.b	#$00,(L000944)
	bra.w	L000066

L000100:
	bset.b	#$01,(L000944)
	bra.w	L000066

L00010c:
	bset.b	#$02,(L000944)
	bra.w	L000066

L000118:
	lea.l	(L0008bf),a2
	pea.l	($0004,a6)
	move.l	a2,-(sp)
	DOS	_NAMESTS
	addq.l	#8,sp
	tst.l	d0
	bmi.w	L0005ca
	lea.l	($0004,a6),a0
	cmpi.b	#$ff,(a0)
	beq.w	L0005ca
	move.b	($0001,a0),d0
	add.b	#$41,d0			;'A'
	move.b	d0,(a0)+
	move.b	#$3a,(a0)+		;':'
L000148:
	tst.b	(a0)+
	bne.s	L000148
	subq.l	#1,a0
	move.l	a0,($0000.w,a6)
	move.b	(L0008bf),d0
	move.b	d0,(L0008b8)
	move.w	#$0008,-(sp)
	pea.l	(L0008b8)
	pea.l	($005c,a6)
	DOS	_FILES
	lea.l	($000a,sp),sp
	tst.l	d0
	bmi.w	L00020c
	move.b	(L0008bf),d0
	bsr.w	L000662
	move.b	#$3a,d0			;':'
	bsr.w	L000662
	lea.l	($007a,a6),a0
L00018e:
	move.b	(a0)+,d0
	beq.s	L00019e
	cmp.b	#$2e,d0			;'.'
	beq.s	L00018e
	bsr.w	L000662
	bra.s	L00018e

L00019e:
	lea.l	(L000806),a5
	bsr.w	L0006a4
	clr.l	d1
	move.w	($0074,a6),d1
	asl.l	#7,d1
	swap.w	d1
	add.w	#$17bc,d1
	swap.w	d1
	lsr.w	#4,d1
	lsr.b	#3,d1
	lea.l	(L000946),a1
	IOCS	_DATEASC
	lea.l	(L000946),a5
	bsr.w	L0006a4
	move.b	#$20,d0			;' '
	bsr.w	L000662
	clr.l	d1
	move.w	($0072,a6),d1
	asl.l	#5,d1
	lsr.w	#2,d1
	lsr.b	#2,d1
	lea.l	(L000946),a1
	IOCS	_TIMEASC
	lea.l	(L000946),a5
	clr.b	($0005,a5)
	bsr.w	L0006a4
	lea.l	(L00080b),a5
	bsr.w	L0006a4
	addq.w	#1,(L00092a)
L00020c:
	move.w	#$00f4,-(sp)
	move.l	a2,-(sp)
	pea.l	($005c,a6)
	DOS	_FILES
	lea.l	($000a,sp),sp
	tst.l	d0
	bmi.s	L000224
	bsr.w	L0003e6
L000224:
	tst.b	(L0008c8)
	beq.w	L00030e
	move.b	(L0008bf),(L0008c6)
	pea.l	($0004,a6)
	pea.l	(L0008c6)
	DOS	_NAMESTS
	addq.l	#8,sp
	tst.l	d0
	bmi.w	L00030e
	lea.l	($0004,a6),a0
	cmpi.b	#$ff,(a0)
	beq.w	L00030e
	move.b	($0001,a0),d0
	add.b	#$41,d0			;'A'
	move.b	d0,(a0)+
	move.b	#$3a,(a0)+		;':'
L000266:
	tst.b	(a0)+
	bne.s	L000266
	subq.l	#1,a0
	move.l	a0,($0000.w,a6)
	move.w	#$0020,-(sp)		;' '
	pea.l	(L0008c6)
	pea.l	($005c,a6)
	DOS	_FILES
	lea.l	($000a,sp),sp
	tst.l	d0
	bmi.w	L00030e
L00028a:
	lea.l	($007a,a6),a0
	cmpi.w	#$2e00,(a0)
	beq.s	L000300
	cmpi.w	#$2e2e,(a0)		;'..'
	beq.s	L000300
	movea.l	($0000.w,a6),a1
L00029e:
	move.b	(a0)+,(a1)+
	bne.s	L00029e
	lea.l	(L003156),a0
	move.l	a0,-(sp)
	pea.l	($0004,a6)
	DOS	_FATCHK
	addq.l	#8,sp
	tst.l	d0
	bmi.s	L000300
	cmp.l	#$00000009,d0
	bcs.s	L000300
	move.l	d0,-(sp)
	lea.l	($0004,a6),a5
	bsr.w	L0006a4
	move.b	#$09,d0
	bsr.w	L000662
	move.l	(sp)+,d0
	subq.l	#4,d0
	lsr.l	#2,d0
	move.l	d0,d1
	clr.l	d2
	divu.w	#$03e8,d1
	bsr.w	L000762
	divu.w	#$0064,d1
	bsr.w	L000762
	divu.w	#$000a,d1
	bsr.w	L000762
	bsr.w	L00076a
	lea.l	(L00081f),a5
	bsr.w	L0006a4
L000300:
	pea.l	($005c,a6)
	DOS	_NFILES
	addq.l	#4,sp
	tst.l	d0
	bpl.w	L00028a
L00030e:
	pea.l	(L00093a)
	move.w	(L000942),d0
	addq.w	#1,d0
	move.w	d0,-(sp)
	DOS	_DSKFRE
	addq.l	#6,sp
	move.w	(L00093c),d1
	mulu.w	(L00093e),d1
	bsr.w	L0003c2
	bsr.w	L0006d0
	lea.l	(L00084c),a5
	bsr.w	L0006a4
	move.l	(L00092e),d1
	bsr.s	L0003c2
	bsr.w	L0006d0
	move.w	(L00092a),d1
	bsr.w	L000716
	lea.l	(L00085d),a5
	bsr.w	L0006a4
	move.l	(L000932),d1
	bsr.s	L0003c2
	bsr.w	L0006d0
	move.w	(L000928),d1
	bsr.w	L000716
	lea.l	(L000875),a5
	bsr.w	L0006a4
	move.l	(L000936),d1
	bsr.s	L0003c2
	bsr.w	L0006d0
	move.w	(L00092c),d1
	bsr.w	L000716
	lea.l	(L000889),a5
	bsr.w	L0006a4
	move.w	(L00093a),d1
	mulu.w	(L00093e),d1
	bsr.s	L0003c2
	bsr.w	L0006d0
	lea.l	(L0008a1),a5
	bsr.w	L0006a4
	lea.l	($0092,sp),sp
	DOS	_EXIT

L0003c2:
	tst.b	(L000924)
	beq.s	L0003e4
	move.w	(L000940),d0
L0003d0:
	cmp.w	#$0400,d0
	beq.s	L0003e4
	bcc.s	L0003de
	lsl.w	#1,d0
	lsr.l	#1,d1
	bra.s	L0003d0

L0003de:
	lsr.w	#1,d0
	lsl.l	#1,d1
	bra.s	L0003d0

L0003e4:
	rts

L0003e6:
	lea.l	($007a,a6),a0
	cmpi.w	#$2e00,(a0)
	beq.w	L0005ba
	cmpi.w	#$2e2e,(a0)		;'..'
	beq.w	L0005ba
	movea.l	($0000.w,a6),a1
L0003fe:
	move.b	(a0)+,(a1)+
	bne.s	L0003fe
	tst.b	(L000924)
	beq.s	L000428
	move.w	#$fff8,-(sp)
	lea.l	(L003156),a0
	move.l	a0,d0
	bset.l	#$1f,d0
	move.l	d0,-(sp)
	pea.l	($0004,a6)
	DOS	_FATCHK
	lea.l	($000a,sp),sp
	bra.s	L000438

L000428:
	lea.l	(L003156),a0
	move.l	a0,-(sp)
	pea.l	($0004,a6)
	DOS	_FATCHK
	addq.l	#8,sp
L000438:
	tst.l	d0
	bmi.w	L0005ba
	clr.w	d7
	move.b	($0071,a6),d7
	bsr.w	L0005da
	tst.b	(L000944)
	beq.w	L000530
	clr.w	d1
	move.b	#$2d,d1			;'-'
	btst.l	#$05,d7
	beq.s	L000462
	move.b	#$41,d1			;'A'
L000462:
	bsr.w	L00069c
	move.b	#$2d,d1			;'-'
	btst.l	#$04,d7
	beq.s	L000474
	move.b	#$44,d1			;'D'
L000474:
	bsr.w	L00069c
	move.b	#$2d,d1			;'-'
	btst.l	#$03,d7
	beq.s	L000486
	move.b	#$56,d1			;'V'
L000486:
	bsr.w	L00069c
	move.b	#$2d,d1			;'-'
	btst.l	#$02,d7
	beq.s	L000498
	move.b	#$53,d1			;'S'
L000498:
	bsr.w	L00069c
	move.b	#$2d,d1			;'-'
	btst.l	#$01,d7
	beq.s	L0004aa
	move.b	#$48,d1			;'H'
L0004aa:
	bsr.w	L00069c
	move.b	#$2d,d1			;'-'
	btst.l	#$00,d7
	beq.s	L0004bc
	move.b	#$52,d1			;'R'
L0004bc:
	bsr.w	L00069c
	bsr.w	L000696
	move.w	(L000926),d2
	beq.s	L0004da
	asl.w	#1,d2
L0004ce:
	move.w	#$0020,d1		;' '
	bsr.w	L00069c
	subq.w	#1,d2
	bne.s	L0004ce
L0004da:
	lea.l	($007a,a6),a5
	bsr.w	L00066e
	lea.l	($007a,a6),a5
	bsr.w	L0006a4
	btst.b	#$01,(L000944)
	beq.s	L000526
	lea.l	(L003158),a4
L0004fa:
	bsr.w	L0006ac
	beq.s	L000526
	lea.l	(L0007fe),a5
	bsr.w	L0006a4
	bsr.w	L000630
	lea.l	(L000802),a5
	bsr.w	L0006a4
	bsr.w	L0006be
	add.l	d0,d1
	subq.l	#1,d1
	bsr.w	L000630
	bra.s	L0004fa

L000526:
	lea.l	(L00077c),a5
	bsr.w	L0006a4
L000530:
	btst.l	#$04,d7
	beq.w	L0005ba
	addq.w	#1,(L000926)
	lea.l	($0004,a6),a2
L000542:
	tst.b	(a2)+
	bne.s	L000542
	subq.l	#1,a2
	move.b	#$5c,(a2)+		;'\'
	move.b	#$2a,(a2)+		;'*'
	move.b	#$2e,(a2)+		;'.'
	move.b	#$2a,(a2)+		;'*'
	clr.b	(a2)
	lea.l	($0004,a6),a2
	move.l	a6,-(sp)
	lea.l	(-$0092,sp),sp
	movea.l	sp,a6
	pea.l	($0004,a6)
	move.l	a2,-(sp)
	DOS	_NAMESTS
	addq.l	#8,sp
	tst.l	d0
	bmi.s	L0005ae
	lea.l	($0004,a6),a0
	cmpi.b	#$ff,(a0)
	beq.s	L0005ae
	move.b	($0001,a0),d0
	add.b	#$41,d0			;'A'
	move.b	d0,(a0)+
	move.b	#$3a,(a0)+		;':'
L00058c:
	tst.b	(a0)+
	bne.s	L00058c
	subq.l	#1,a0
	move.l	a0,($0000.w,a6)
	move.w	#$00f4,-(sp)
	move.l	a2,-(sp)
	pea.l	($005c,a6)
	DOS	_FILES
	lea.l	($000a,sp),sp
	tst.l	d0
	bmi.s	L0005ae
	bsr.w	L0003e6
L0005ae:
	lea.l	($0092,sp),sp
	movea.l	(sp)+,a6
	subq.w	#1,(L000926)
L0005ba:
	pea.l	($005c,a6)
	DOS	_NFILES
	addq.l	#4,sp
	tst.l	d0
	bpl.w	L0003e6
	rts

L0005ca:
	lea.l	(L00077f),a5
	bsr.w	L0006a4
	move.w	#$0001,-(sp)
	DOS	_EXIT2

L0005da:
	btst.l	#$04,d7
	beq.s	L0005ee
	addq.w	#1,(L000928)
	lea.l	(L000932),a1
	bra.s	L00060e

L0005ee:
	btst.l	#$02,d7
	beq.s	L000602
	addq.w	#1,(L00092a)
	lea.l	(L00092e),a1
	bra.s	L00060e

L000602:
	addq.w	#1,(L00092c)
	lea.l	(L000936),a1
L00060e:
	addq.l	#2,a0
	clr.l	d0
	tst.b	(L000924)
	beq.s	L000624
L00061a:
	tst.l	(a0)+
	beq.s	L00062e
	move.l	(a0)+,d0
	add.l	d0,(a1)
	bra.s	L00061a

L000624:
	tst.w	(a0)+
	beq.s	L00062e
	move.w	(a0)+,d0
	add.l	d0,(a1)
	bra.s	L000624

L00062e:
	rts

L000630:
	tst.b	(L000924)
	beq.s	L00063e
	swap.w	d1
	bsr.s	L00063e
	swap.w	d1
L00063e:
	move.w	d1,d0
	rol.w	#4,d0
	bsr.s	L000652
	move.w	d1,d0
	ror.w	#8,d0
	bsr.s	L000652
	move.w	d1,d0
	ror.w	#4,d0
	bsr.s	L000652
	move.b	d1,d0
L000652:
	and.w	#$000f,d0
	add.b	#$30,d0			;'0'
	cmp.b	#$3a,d0			;':'
	bcs.s	L000662
	addq.b	#7,d0
L000662:
	and.w	#$00ff,d0
	move.w	d0,-(sp)
	DOS	_PUTCHAR
	addq.l	#2,sp
	rts

L00066e:
	move.w	#$000b,d1
L000672:
	tst.b	(a5)+
	beq.s	L00067c
	dbra.w	d1,L000672
	rts

L00067c:
	subq.l	#1,a5
L00067e:
	move.b	#$20,(a5)+		;' '
	dbra.w	d1,L00067e
	clr.b	(a5)
	rts

L00068a:
	move.b	(a2)+,d0
	beq.s	L000694
	cmp.b	#$20,d0			;' '
	beq.s	L00068a
L000694:
	rts

L000696:
	moveq.l	#$20,d1			;' '
	bsr.s	L00069c
	moveq.l	#$20,d1			;' '
L00069c:
	move.w	d1,-(sp)
	DOS	_PUTCHAR
	addq.l	#2,sp
	rts

L0006a4:
	move.l	a5,-(sp)
	DOS	_PRINT
	addq.l	#4,sp
	rts

L0006ac:
	tst.b	(L000924)
	beq.s	L0006b8
	move.l	(a4)+,d1
	rts

L0006b8:
	clr.l	d1
	move.w	(a4)+,d1
	rts

L0006be:
	tst.b	(L000924)
	beq.s	L0006ca
	move.l	(a4)+,d0
	rts

L0006ca:
	clr.l	d0
	move.w	(a4)+,d0
	rts

L0006d0:
	clr.l	d2
	tst.b	(L000924)
	beq.s	L0006f2
	move.l	#$00989680,d0
	bsr.s	L00073a
	move.l	#$000f4240,d0
	bsr.s	L00073a
	move.l	#$000186a0,d0
	bsr.s	L00073a
L0006f2:
	divu.w	#$2710,d1
	bsr.s	L000754
	divu.w	#$03e8,d1
	bsr.s	L000754
	divu.w	#$0064,d1
	bsr.s	L000754
	divu.w	#$000a,d1
	bsr.s	L000754
	bsr.s	L00076a
	lea.l	(L00083e),a5
	bsr.s	L0006a4
	rts

L000716:
	clr.l	d2
	and.l	#$0000ffff,d1
	divu.w	#$2710,d1
	bsr.s	L000762
	divu.w	#$03e8,d1
	bsr.s	L000762
	divu.w	#$0064,d1
	bsr.s	L000762
	divu.w	#$000a,d1
	bsr.s	L000762
	bsr.s	L00076a
	rts

L00073a:
	swap.w	d2
	clr.w	d2
L00073e:
	addq.w	#1,d2
	sub.l	d0,d1
	bcc.s	L00073e
	add.l	d0,d1
	subq.w	#1,d2
	move.l	d1,-(sp)
	move.w	d2,d1
	swap.w	d2
	bsr.s	L000754
	move.l	(sp)+,d1
	rts

L000754:
	tst.b	d2
	bne.s	L00076a
	tst.w	d1
	bne.s	L00076a
	move.w	#$0020,d0		;' '
	bra.s	L000772

L000762:
	tst.b	d2
	bne.s	L00076a
	tst.w	d1
	beq.s	L000778
L00076a:
	addq.b	#1,d2
	move.w	d1,d0
	add.b	#$30,d0			;'0'
L000772:
	bsr.w	L000662
	clr.w	d1
L000778:
	swap.w	d1
	rts


	.data

L00077c:
	.dc.b	$0d,$0a,$00
L00077f:
	.dc.b	'使用法：chkdsk [ドライブ名] [スイッチ]',$0d,$0a
	.dc.b	$09,'/v',$09,'すべてのファイルを表示します',$0d,$0a
	.dc.b	$09,'/a',$09,'すべてのファイルの使用セクタの範囲を表示します',$0d,$0a,$00
L0007fe:
	.dc.b	'  $',$00
L000802:
	.dc.b	'～$',$00
L000806:
	.dc.b	' は ',$00
L00080b:
	.dc.b	' に作成されました',$0d,$0a,$00
L00081f:
	.dc.b	'個の不連続ブロックがあります',$0d,$0a,$00
L00083e:
	.dc.b	' Ｋバイト ： ',$00
L00084c:
	.dc.b	'全ディスク容量',$0d,$0a,$00
L00085d:
	.dc.b	' 個のシステムファイル',$0d,$0a,$00
L000875:
	.dc.b	' 個のディレクトリ',$0d,$0a,$00
L000889:
	.dc.b	' 個のユーザーファイル',$0d,$0a,$00
L0008a1:
	.dc.b	'使用可能ディスク容量',$0d,$0a,$00
L0008b8:
	.dc.b	$41,$3a,$5c,$2a,$2e,$2a,$00
L0008bf:
	.dc.b	$41,$3a,$5c,$2a,$2e,$2a,$00
L0008c6:
	.dc.b	$41,$3a
L0008c8:
	.ds.b	92

	.bss

L000924:
	.ds.b	2
L000926:
	.ds.w	1
L000928:
	.ds.w	1
L00092a:
	.ds.w	1
L00092c:
	.ds.w	1
L00092e:
	.ds.l	1
L000932:
	.ds.l	1
L000936:
	.ds.l	1
L00093a:
	.ds.w	1
L00093c:
	.ds.w	1
L00093e:
	.ds.w	1
L000940:
	.ds.w	1
L000942:
	.ds.w	1
L000944:
	.ds.b	2
L000946:
	.ds.b	10256
L003156:
	.ds.b	2
L003158:
	.ds.b	65534
End:

	.end	Start
