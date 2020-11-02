;=============================================
;  Filename human302/bin/subst.x
;
;
;  Base address 000000
;  Exec address 000000
;  Text size    0003da byte(s)
;  Data size    00028e byte(s)
;  Bss  size    001200 byte(s)
;  71 Labels
;
;  Commandline dis  -h -k -m68000 -q1 -B -M -w16 -o120 -ghuman302/bin/subst.lab --overwrite human302/bin/subst.x human302/bin/subst.s
;          DIS version 3.16
;=============================================

	.include	inc/doscall.mac
	.include	inc/iocscall.mac
	.include	inc/fefunc.mac

	.cpu	68000

	.text

L000000:
	lea.l	(L001868),a7
	DOS	_VERNUM
	cmp.w	#$014a,d0
	bcs	L000088
	addq.l	#1,a2
	clr.l	(L000668)
	clr.l	(L000768)
	lea.l	(L000668),a1
	bsr	L000370
	beq	L00003a
	lea.l	(L000768),a1
	bsr	L000370
	beq	L00003a
	bsr	L00034c
	bne	L00006e
L00003a:
	bsr	L0002f2
	move.b	(L000667),d0
	cmp.b	#$64,d0			;'d'
	beq	L0001b4
	cmp.b	#$6c,d0			;'l'
	beq	L000232
	move.l	(L000668),d0
	clr.b	d0
	move.l	(L000768),d1
	clr.b	d1
	tst.w	d1
	bne	L00014e
	tst.w	d0
	bne	L0000ae
L00006e:
	pea.l	(L0003da)
	DOS	_PRINT
	addq.l	#4,a7
	pea.l	(L000409)
L00007e:
	DOS	_PRINT
	addq.l	#4,a7
	move.w	#$0001,-(a7)
	DOS	_EXIT2

L000088:
	pea.l	(L0003da)
	DOS	_PRINT
	addq.l	#4,a7
	pea.l	(L000584)
	bra	L00007e

L00009a:
	pea.l	(L000768)
	move.w	#$0004,-(a7)
	DOS	_ASSIGN
	lea.l	($0006,a7),a7
	bra	L0002aa

L0000ae:
	tst.l	d0
	beq	L00006e
	tst.l	d1
	beq	L00006e
	cmpi.b	#$3a,(L000669)		;':'
	bne	L0002aa
	cmpi.b	#$3a,(L000769)		;':'
	bne	L0002aa
	move.b	(L000668),d0
	or.b	#$20,d0
	move.b	(L000768),d1
	or.b	#$20,d1
	cmp.b	d1,d0
	beq	L0002aa
	move.w	#$0060,-(a7)		;'`'
	pea.l	(L000668)
	pea.l	(L000768)
	move.w	#$0001,-(a7)
	DOS	_ASSIGN
	lea.l	($000c,a7),a7
	tst.l	d0
	bmi	L0002ac
	pea.l	(L000668)
	pea.l	(L000768)
	move.w	#$0000,-(a7)
	DOS	_ASSIGN
	lea.l	($000a,a7),a7
	tst.l	d0
	bmi	L0002ac
	cmpi.w	#$5c00,(L00066a)
	beq	L00009a
	bsr	L00031c
	pea.l	(L0005df)
	DOS	_PRINT
	addq.l	#4,a7
	bsr	L000328
	pea.l	(L000604)
	DOS	_PRINT
	addq.l	#4,a7
	DOS	_EXIT

L00014e:
	tst.l	d0
	beq	L00006e
	tst.l	d1
	beq	L00006e
	move.w	#$0050,-(a7)		;'P'
	pea.l	(L000768)
	pea.l	(L000668)
	move.w	#$0001,-(a7)
	DOS	_ASSIGN
	lea.l	($000c,a7),a7
	tst.l	d0
	bmi	L0002ac
	pea.l	(L000768)
	pea.l	(L000668)
	move.w	#$0000,-(a7)
	DOS	_ASSIGN
	lea.l	($000a,a7),a7
	tst.l	d0
	bmi	L0002ac
	bsr	L00031c
	pea.l	(L00059b)
	DOS	_PRINT
	addq.l	#4,a7
	bsr	L000328
	pea.l	(L0005b0)
	DOS	_PRINT
	addq.l	#4,a7
	DOS	_EXIT

L0001b4:
	tst.b	(L000768)
	bne	L00006e
	tst.b	(L000668)
	beq	L0001ec
	pea.l	(L000668)
	move.w	#$0004,-(a7)
	DOS	_ASSIGN
	lea.l	($0006,a7),a7
	tst.l	d0
	bmi	L0002ac
	bsr	L00031c
	pea.l	(L000624)
	DOS	_PRINT
	addq.l	#4,a7
	DOS	_EXIT

L0001ec:
	DOS	_CURDRV
	move.w	d0,-(a7)
	DOS	_CHGDRV
	addq.l	#2,a7
	subq.w	#1,d0
	move.w	d0,d7
	move.l	#$413a0000,d6
L0001fe:
	move.l	d6,(L000668)
	pea.l	(L000668)
	move.w	#$0004,-(a7)
	DOS	_ASSIGN
	lea.l	($0006,a7),a7
	tst.l	d0
	bmi	L000226
	bsr	L00031c
	pea.l	(L000624)
	DOS	_PRINT
	addq.l	#4,a7
L000226:
	add.l	#$01000000,d6
	dbra	d7,L0001fe
	DOS	_EXIT

L000232:
	tst.b	(L000668)
	beq	L000266
	tst.b	(L000768)
	bne	L00006e
	pea.l	(L000768)
	pea.l	(L000668)
	move.w	#$0000,-(a7)
	DOS	_ASSIGN
	lea.l	($000a,a7),a7
	tst.l	d0
	bmi	L0002ac
	bsr	L0002d0
	bsr	L0002f2
	DOS	_EXIT

L000266:
	DOS	_CURDRV
	move.w	d0,-(a7)
	DOS	_CHGDRV
	addq.l	#2,a7
	subq.w	#1,d0
	move.w	d0,d7
	move.l	#$413a0000,d6
L000278:
	move.l	d6,(L000668)
	pea.l	(L000768)
	pea.l	(L000668)
	move.w	#$0000,-(a7)
	DOS	_ASSIGN
	lea.l	($000a,a7),a7
	tst.l	d0
	bmi	L00029c
	beq	L00029c
	bsr	L0002d0
L00029c:
	add.l	#$01000000,d6
	dbra	d7,L000278
	bsr	L0002f2
	DOS	_EXIT

L0002aa:
	moveq.l	#$f2,d0
L0002ac:
	lea.l	(L0004c4),a0
L0002b2:
	move.b	(a0)+,d1
	beq	L0002c0
	cmp.b	d1,d0
	beq	L0002c0
L0002ba:
	move.b	(a0)+,d1
	bne	L0002ba
	bra	L0002b2

L0002c0:
	move.l	a0,-(a7)
	DOS	_PRINT
	addq.l	#4,a7
	pea.l	(L000664)
	bra	L00007e

L0002d0:
	cmp.b	#$40,d0			;'@'
	beq	L0002fe
	cmp.b	#$50,d0			;'P'
	beq	L000308
	cmp.b	#$60,d0			;'`'
	beq	L000312
	bsr	L00031c
	moveq.l	#$20,d0			;' '
	bsr	L000334
	pea.l	(L00065f)
	DOS	_PRINT
	addq.l	#4,a7
L0002f2:
	pea.l	(L000664)
	DOS	_PRINT
	addq.l	#4,a7
	rts

L0002fe:
	bsr	L00031c
	moveq.l	#$3d,d0			;'='
	bsr	L000334
	bsr	L000328
	bra	L0002f2

L000308:
	bsr	L00031c
	moveq.l	#$3e,d0			;'>'
	bsr	L000334
	bsr	L000328
	bra	L0002f2

L000312:
	bsr	L00031c
	moveq.l	#$3c,d0			;'<'
	bsr	L000334
	bsr	L000328
	bra	L0002f2

L00031c:
	pea.l	(L000668)
	DOS	_PRINT
	addq.l	#4,a7
	rts

L000328:
	pea.l	(L000768)
	DOS	_PRINT
	addq.l	#4,a7
	rts

L000334:
	move.w	#$0020,-(a7)		;' '
	move.w	d0,-(a7)
	move.w	#$0020,-(a7)		;' '
	DOS	_PUTCHAR
	addq.l	#2,a7
	DOS	_PUTCHAR
	addq.l	#2,a7
	DOS	_PUTCHAR
	addq.l	#2,a7
	rts

L00034c:
	bsr	L0003c8
	beq	L00035e
	cmp.b	#$2d,d0			;'-'
	beq	L000362
	cmp.b	#$2f,d0			;'/'
	beq	L000362
	rts

L00035e:
	clr.l	d0
	rts

L000362:
	bsr	L0003aa
	bne	L00034c
	moveq.l	#$ff,d0
	rts

L00036a:
	bsr	L0003aa
	bne	L000370
	rts

L000370:
	bsr	L0003c8
	beq	L0003a8
	cmp.b	#$2d,d0			;'-'
	beq	L00036a
	cmp.b	#$2f,d0			;'/'
	beq	L00036a
L000380:
	move.b	d0,(a1)+
	move.b	(a2)+,d0
	beq	L0003a6
	cmp.b	#$20,d0			;' '
	beq	L00039e
	cmp.b	#$09,d0
	beq	L00039e
	cmp.b	#$2d,d0			;'-'
	beq	L00039e
	cmp.b	#$2f,d0			;'/'
	bne	L000380
L00039e:
	subq.l	#1,a2
	clr.b	(a1)
	tst.b	d0
	rts

L0003a6:
	move.b	d0,(a1)
L0003a8:
	rts

L0003aa:
	move.b	(a2)+,d0
	or.b	#$20,d0
	cmp.b	#$64,d0			;'d'
	beq	L0003c0
	cmp.b	#$6c,d0			;'l'
	beq	L0003c0
	clr.l	d0
	rts

L0003c0:
	move.b	d0,(L000667)
	rts

L0003c8:
	move.b	(a2)+,d0
	beq	L0003d8
	cmp.b	#$20,d0			;' '
	beq	L0003c8
	cmp.b	#$09,d0
	beq	L0003c8
L0003d8:
	rts


	.data

L0003da:
	.dc.b	'X68k Subst v1.01 Copyright 1989 SHARP/Hudson',$0d,$0a,$00
L000409:
	.dc.b	'使用法：subst ［スイッチ］ パス名１ パス名２',$0d,$0a
	.dc.b	$09,'パス名１をパス名２として割り当てます。',$0d,$0a
	.dc.b	$09,'ただし片方はドライブ名のみ指定して下さい。',$0d,$0a
	.dc.b	$09,'/D',$09,$09,'割り当てを解除します',$0d,$0a
	.dc.b	$09,'/L',$09,$09,'割り当てを表示します',$0d,$0a,$00
L0004c4:
	.dc.b	$ff
L0004c5:
	.dc.b	'パラメータの指定が違います',$00
L0004e0:
	.dc.b	$fe
L0004e1:
	.dc.b	'パスが見つかりません',$00
L0004f6:
	.dc.b	$fd
L0004f7:
	.dc.b	'パスが見つかりません',$00
L00050c:
	.dc.b	$f3
L00050d:
	.dc.b	'ファイル名の指定に誤りがあります',$00
L00052e:
	.dc.b	$f2
L00052f:
	.dc.b	'パラメータの指定に誤りがあります',$00
L000550:
	.dc.b	$f1
L000551:
	.dc.b	'ドライブ指定に誤りがあります',$00,$00
	.dc.b	'エラーが発生しました',$00
L000584:
	.dc.b	'バージョンが違います',$0d,$0a,$00
L00059b:
	.dc.b	'でアクセスした場合、',$00
L0005b0:
	.dc.b	'のディレクトリ下をアクセスすることになります',$0d,$0a,$00
L0005df:
	.dc.b	'のディレクトリ下をアクセスした場合、',$00
L000604:
	.dc.b	'\をアクセスすることになります',$0d,$0a,$00
L000624:
	.dc.b	'のドライブを元のドライブのルートディレクトリに戻しました',$0d,$0a,$00
L00065f:
	.dc.b	'FREE',$00
L000664:
	.dc.b	$0d,$0a,$00
L000667:
	.dc.b	$00

	.bss

L000668:
	.ds.b	1
L000669:
	.ds.b	1
L00066a:
	.ds.b	254
L000768:
	.ds.b	1
L000769:
	.ds.b	4351
L001868:

	.end	L000000
