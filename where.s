;=============================================
;  Filename where.x
;
;
;  Base address 000000
;  Exec address 000000
;  Text size    000410 byte(s)
;  Data size    00015c byte(s)
;  Bss  size    00106c byte(s)
;  83 Labels
;
;  Commandline dis  -b2 -h -m68000 --sp -q1 -B -M -o120 -gwhere.lab --overwrite where.x where.s
;          DIS version 3.16
;=============================================

	.include	inc/doscall.mac
	.include	inc/iocscall.mac
	.include	inc/fefunc.mac

	.cpu	68000

	.text

Start:
	lea.l	(L0015d6),sp
	clr.b	(L000ae4)
	clr.b	(L000ae5)
	movea.l	(Start-$0000e0),a0
	addq.l	#1,a0
	lea.l	(L00056c),a1
	lea.l	(L000684),a2
	bsr.w	L0002ba
	cmp.l	#$00000001,d0
	bne.w	L000204
	lea.l	(L000684),a0
L00003a:
	tst.b	(a0)
	beq.s	L000068
	bsr.w	L0003ca
L000042:
	move.b	(a0)+,d0
	beq.s	L00003a
	cmp.b	#$66,d0			;'f'
	beq.s	L00005e
	cmp.b	#$61,d0			;'a'
	bne.w	L000204
	move.b	#-$01,(L000ae4)
	bra.s	L000042

L00005e:
	move.b	#-$01,(L000ae5)
	bra.s	L000042

L000068:
	clr.w	d4
	move.b	#$19,d5
	clr.b	d6
	lea.l	(L00056c),a1
	cmpi.b	#$3a,($0001,a1)		;':'
	beq.s	L00008a
	tst.b	(L000ae4)
	bne.s	L0000a0
	DOS	_CURDRV
	bra.s	L00009c

L00008a:
	move.b	(a1),d0
	or.b	#$20,d0
	sub.b	#$61,d0			;'a'
	cmp.b	#$19,d0
	bhi.w	L000216
L00009c:
	move.b	d0,d4
	move.b	d0,d5
L0000a0:
	lea.l	(L00056c),a0
	bsr.w	L000386
	movea.l	a0,a1
	lea.l	(L00079c),a0
	bsr.w	L000366
	lea.l	(L00056c),a0
	bsr.w	L000386
	clr.b	(a0)
	lea.l	(L00056c),a1
	cmpi.b	#$3a,($0001,a1)		;':'
	bne.s	L0000d2
	addq.l	#2,a1
L0000d2:
	lea.l	(L0008b4),a0
	bsr.w	L000366
	lea.l	(L00079c),a0
	tst.b	(a0)
	bne.s	L0000ec
	move.b	#$2a,(a0)+		;'*'
	clr.b	(a0)
L0000ec:
	lea.l	(L00079c),a0
L0000f2:
	move.b	(a0),d0
	beq.s	L000100
	cmp.b	#$2e,d0			;'.'
	beq.s	L00010a
	addq.l	#1,a0
	bra.s	L0000f2

L000100:
	move.b	#$2e,(a0)+		;'.'
	move.b	#$2a,(a0)+		;'*'
	clr.b	(a0)
L00010a:
	lea.l	(L0008b4),a0
	tst.b	(a0)
	bne.s	L00011a
	move.b	#$5c,(a0)+		;'\'
	clr.b	(a0)
L00011a:
	lea.l	(L0009cc),a0
	move.b	d4,d0
	add.b	#$61,d0			;'a'
	move.b	d0,(a0)+
	move.b	#$3a,(a0)+		;':'
	lea.l	(L0008b4),a1
	bsr.w	L000366
	move.w	d4,d0
	addq.w	#1,d0
	move.w	d0,-(sp)
	DOS	_DRVCTRL
	addq.l	#2,sp
	tst.l	d0
	bmi.s	L000170
	btst.l	#$02,d0
	bne.s	L00015a
	move.b	d4,d0
	add.b	#$61,d0			;'a'
	move.b	d0,(L0009cc)
	bsr.s	L00018a
	bra.s	L000170

L00015a:
	move.b	d4,d0
	add.b	#$61,d0			;'a'
	move.w	d0,-(sp)
	DOS	_PUTCHAR
	addq.l	#2,sp
	pea.l	(L000533)
	DOS	_PRINT
	addq.l	#4,sp
L000170:
	addq.b	#1,d4
	cmp.b	d5,d4
	bls.s	L00011a
	tst.b	d6
	bne.s	L000184
	pea.l	(L00054d)
	DOS	_PRINT
	addq.l	#4,sp
L000184:
	clr.w	d0
L000186:
	move.w	d0,-(sp)
	DOS	_EXIT2

L00018a:
	link.w	a6,#-$003c
	lea.l	(L000bae),a0
	cmpa.l	a0,sp
	bcs.w	L00021e
	lea.l	(L0009cc),a0
	bsr.w	L000374
	adda.l	d0,a0
	move.l	a0,-(sp)
	clr.b	(a0)
	bsr.w	L000230
	movea.l	(sp),a0
	lea.l	(L000410),a1
	bsr.w	L000366
	move.w	#$0010,-(sp)
	pea.l	(L0009cc)
	pea.l	(-$003c,a6)
	DOS	_FILES
	lea.l	($000a,sp),sp
	tst.l	d0
	bmi.s	L0001fc
L0001d2:
	lea.l	(-$001e,a6),a1
	cmpi.b	#$2e,(a1)		;'.'
	beq.s	L0001f0
	movea.l	(sp),a0
	bsr.w	L000366
	bsr.w	L000374
	adda.l	d0,a0
	move.b	#$5c,(a0)+		;'\'
	clr.b	(a0)
	bsr.s	L00018a
L0001f0:
	pea.l	(-$003c,a6)
	DOS	_NFILES
	addq.l	#4,sp
	tst.l	d0
	bpl.s	L0001d2
L0001fc:
	movea.l	(sp)+,a0
	clr.b	(a0)
	unlk	a6
	rts

L000204:
	pea.l	(L000414)
	DOS	_PRINT
	addq.l	#4,sp
	move.w	#$0001,d0
	bra.w	L000186

L000216:
	pea.l	(L000513)
	bra.s	L000224

L00021e:
	pea.l	(L0004e5)
L000224:
	DOS	_PRINT
	addq.l	#4,sp
	move.w	#$0002,d0
	bra.w	L000186

L000230:
	link.w	a6,#-$003c
	clr.b	d3
	lea.l	(L0009cc),a0
	bsr.w	L000374
	adda.l	d0,a0
	move.l	a0,-(sp)
	lea.l	(L00079c),a1
	bsr.w	L000366
	move.w	#$0021,-(sp)		;'!'
	pea.l	(L0009cc)
	pea.l	(-$003c,a6)
	DOS	_FILES
	lea.l	($000a,sp),sp
	tst.l	d0
	bmi.s	L0002b4
L000266:
	move.b	(-$0027,a6),d0
	and.b	#$18,d0
	bne.s	L0002a8
	tst.b	(L000ae5)
	beq.s	L000284
	lea.l	(-$001e,a6),a1
	movea.l	(sp),a0
	bsr.w	L000366
	bra.s	L000290

L000284:
	tst.b	d3
	bne.s	L0002a4
	move.b	#-$01,d3
	movea.l	(sp),a0
	clr.b	(a0)
L000290:
	pea.l	(L0009cc)
	DOS	_PRINT
	addq.l	#4,sp
	pea.l	(L000569)
	DOS	_PRINT
	addq.l	#4,sp
L0002a4:
	move.b	#-$01,d6
L0002a8:
	pea.l	(-$003c,a6)
	DOS	_NFILES
	addq.l	#4,sp
	tst.l	d0
	bpl.s	L000266
L0002b4:
	movea.l	(sp)+,a0
	unlk	a6
	rts

L0002ba:
	movem.l	d1/a0-a2,-(sp)
	clr.l	d1
L0002c0:
	bsr.w	L00034c
	adda.l	d0,a0
	tst.b	(a0)
	beq.s	L00033c
	move.b	(a0)+,d0
	cmp.b	#$2d,d0			;'-'
	beq.s	L0002d8
	cmp.b	#$2f,d0			;'/'
	bne.s	L0002ee
L0002d8:
	move.b	(a0)+,d0
	beq.s	L00033c
	cmp.b	#$09,d0
	beq.s	L0002ea
	cmp.b	#$20,d0			;' '
	beq.s	L0002ea
	move.b	d0,(a2)+
L0002ea:
	clr.b	(a2)+
	bra.s	L0002c0

L0002ee:
	addq.l	#1,d1
L0002f0:
	move.b	d0,(a1)+
	cmp.b	#$22,d0			;'"'
	bne.s	L000306
L0002f8:
	move.b	(a0)+,d0
	beq.s	L00033c
	move.b	d0,(a1)+
	cmp.b	#$22,d0			;'"'
	bne.s	L0002f8
	bra.s	L000318

L000306:
	cmp.b	#$27,d0			;'''
	bne.s	L000318
L00030c:
	move.b	(a0)+,d0
	beq.s	L00033c
	move.b	d0,(a1)+
	cmp.b	#$27,d0			;'''
	bne.s	L00030c
L000318:
	move.b	(a0),d0
	beq.s	L00033c
	cmp.b	#$2f,d0			;'/'
	beq.s	L000338
	cmp.b	#$2d,d0			;'-'
	beq.s	L000338
	addq.l	#1,a0
	cmp.b	#$09,d0
	beq.s	L000338
	cmp.b	#$20,d0			;' '
	beq.s	L000338
	bra.s	L0002f0

L000338:
	clr.b	(a1)+
	bra.s	L0002c0

L00033c:
	clr.b	(a1)+
	clr.b	(a1)
	clr.b	(a2)+
	clr.b	(a2)
	move.l	d1,d0
	movem.l	(sp)+,d1/a0-a2
	rts

L00034c:
	move.l	a0,-(sp)
L00034e:
	move.b	(a0)+,d0
	cmpi.b	#$20,d0			;' '
	beq.s	L00034e
	cmpi.b	#$09,d0
	beq.s	L00034e
	move.l	a0,d0
	movea.l	(sp)+,a0
	sub.l	a0,d0
	subq.l	#1,d0
	rts

L000366:
	movem.l	a0-a1,-(sp)
L00036a:
	move.b	(a1)+,(a0)+
	bne.s	L00036a
	movem.l	(sp)+,a0-a1
	rts

L000374:
	move.l	a0,-(sp)
	moveq.l	#$ff,d0
L000378:
	addi.l	#$00000001,d0
	tst.b	(a0)+
	bne.s	L000378
	movea.l	(sp)+,a0
	rts

L000386:
	movem.l	d0-d1,-(sp)
	clr.b	d1
	move.l	a0,-(sp)
L00038e:
	move.b	(a0)+,d0
	beq.s	L0003c2
	tst.b	d1
	beq.s	L00039a
	clr.b	d1
	bra.s	L00038e

L00039a:
	cmp.b	#$80,d0
	bcs.s	L0003b2
	cmp.b	#$a0,d0
	bcs.s	L0003ac
	cmp.b	#$e0,d0
	bcs.s	L0003b2
L0003ac:
	move.b	#$01,d1
	bra.s	L00038e

L0003b2:
	cmp.b	#$5c,d0			;'\'
	beq.s	L0003be
	cmp.b	#$3a,d0			;':'
	bne.s	L00038e
L0003be:
	move.l	a0,(sp)
	bra.s	L00038e

L0003c2:
	movea.l	(sp)+,a0
	movem.l	(sp)+,d0-d1
	rts

L0003ca:
	movem.l	d0-d1/a0,-(sp)
	clr.b	d1
L0003d0:
	move.b	(a0),d0
	beq.s	L00040a
	tst.b	d1
	beq.s	L0003dc
	clr.b	d1
	bra.s	L0003f2

L0003dc:
	cmp.b	#$80,d0
	bcs.s	L0003f6
	cmp.b	#$a0,d0
	bcs.s	L0003ee
	cmp.b	#$e0,d0
	bcs.s	L0003f6
L0003ee:
	move.b	#$01,d1
L0003f2:
	addq.l	#1,a0
	bra.s	L0003d0

L0003f6:
	cmpi.b	#$41,d0			;'A'
	bcs.s	L000406
	cmpi.b	#$5a,d0			;'Z'
	bhi.s	L000406
	add.b	#$20,d0			;' '
L000406:
	move.b	d0,(a0)+
	bra.s	L0003d0

L00040a:
	movem.l	(sp)+,d0-d1/a0
	rts


	.data

L000410:
	.dc.b	'*.*',$00
L000414:
	.dc.b	'X68k Where v1.01 Copyright 1989 SHARP/Hudson',$0d,$0a
	.dc.b	'使用法：where［スイッチ］［検索ファイル名］',$0d,$0a
	.dc.b	$09,'/a',$09,'すべてのドライブを検索する',$0d,$0a
	.dc.b	$09,'/f',$09,'検索したファイル名も表示する',$0d,$0a
	.dc.b	$0d,$0a
	.dc.b	$09,'/aのスイッチを付けた場合ドライブ名は指定しない',$0d,$0a,$00
L0004e5:
	.dc.b	'where: ディレクトリが深すぎるので中断します',$0d,$0a,$00
L000513:
	.dc.b	'where: ドライブ指定が無効です',$0d,$0a,$00
L000533:
	.dc.b	':は準備が出来ていません',$0d,$0a,$00
L00054d:
	.dc.b	'検索ファイルは見つかりません'
L000569:
	.dc.b	$0d,$0a,$00

	.bss

L00056c:
	.ds.b	280
L000684:
	.ds.b	280
L00079c:
	.ds.b	280
L0008b4:
	.ds.b	280
L0009cc:
	.ds.b	280
L000ae4:
	.ds.b	1
L000ae5:
	.ds.b	201
L000bae:
	.ds.b	2600
L0015d6:
	.ds.b	2
End:

	.end	Start
