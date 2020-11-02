;=============================================
;  Filename human302/bin/copyall.x
;
;
;  Base address 000000
;  Exec address 000000
;  Text size    000624 byte(s)
;  Data size    00027a byte(s)
;  Bss  size    0000f2 byte(s)
;  103 Labels
;
;  Commandline dis  -h -k -m68000 -q1 -B -M -w16 -o120 -ghuman302/bin/copyall.lab --overwrite human302/bin/copyall.x human302/bin/copyall.s
;          DIS version 3.16
;=============================================

	.include	inc/doscall.mac
	.include	inc/iocscall.mac
	.include	inc/fefunc.mac

	.cpu	68000

	.text

Start:
	move.l	($0008,a0),d0
	and.l	#$fffffffc,d0
	movea.l	d0,a7
	DOS	_VERNUM
	move.w	d0,(L00089e)
	addq.l	#1,a2
	lea.l	(L0008a2),a0
	bsr	L000526
	lea.l	(L0008fe),a0
	bsr	L000526
	bsr	L000562
	pea.l	(L000624)
	DOS	_PRINT
	addq.l	#4,a7
	tst.b	(L0008a2)
	beq	L000070
	tst.b	(L00089a)
	beq	L000062
	DOS	_FFLUSH
	pea.l	(L00085c)
	DOS	_PRINT
	addq.l	#4,a7
	DOS	_GETC
	DOS	_FFLUSH
	pea.l	(L000800)
	DOS	_PRINT
	addq.l	#4,a7
L000062:
	clr.w	(L0008a0)
	bsr	L00007e
	tst.l	d0
	bmi	L000070
	DOS	_EXIT

L000070:
	pea.l	(L000658)
	DOS	_PRINT
	move.w	#$0001,-(a7)
	DOS	_EXIT2

L00007e:
	addq.w	#1,(L0008a0)
	movem.l	a6,-(a7)
	lea.l	(-$00f0,a7),a7
	movea.l	a7,a6
	clr.w	($00ee,a6)
	tst.b	(L00089c)
	beq	L0000a0
	move.w	#$8000,($00ee,a6)
L0000a0:
	bsr	L000492
	bmi	L00011e
	bsr	L0001d2
	tst.b	(L000896)
	beq	L0000e6
	lea.l	(L0008fe),a0
	lea.l	($0092,a6),a1
L0000bc:
	move.b	(a1)+,(a0)+
	bne	L0000bc
	clr.b	(-$0002,a0)
	cmpi.b	#$3a,(-$0003,a0)	;':'
	beq	L0000e8
	move.w	#$0010,-(a7)
	pea.l	(L0008fe)
	pea.l	(L00095a)
	DOS	_FILES
	lea.l	($000a,a7),a7
	tst.l	d0
	bmi	L00011e
L0000e6:
	bsr	L00012e
L0000e8:
	bsr	L000462
	beq	L000116
	btst.l	#$04,d0
	bne	L000106
	bsr	L000204
	bpl	L000116
	pea.l	(L000843)
	DOS	_PRINT
	addq.l	#4,a7
	bra	L000116

L000106:
	tst.b	(L000895)
	bne	L000116
	bsr	L0003c6
	bsr	L00007e
L000116:
	bsr	L000508
	bpl	L0000e8
	clr.l	d0
L00011e:
	lea.l	($00f0,a7),a7
	movem.l	(a7)+,a6
	subq.w	#1,(L0008a0)
	rts

L00012e:
	lea.l	(L0008fe),a0
	lea.l	($0092,a6),a1
	bsr	L0001d8
L00013c:
	tst.b	(a1)
	beq	L0001a8
	move.b	#$5c,(a0)+		;'\'
	bsr	L0001d8
	tst.b	(L000898)
	bne	L00018a
	movem.l	a0,-(a7)
	lea.l	(L0008fe),a0
	bsr	L000428
	movem.l	(a7)+,a0
	pea.l	(L0008fe)
	DOS	_MKDIR
	addq.l	#4,a7
	cmp.l	#$ffffffe9,d0
	beq	L00017c
	cmp.l	#$ffffffe8,d0
	bne	L000180
L00017c:
	bsr	L0001aa
	bra	L00012e

L000180:
	tst.l	d0
	bmi	L00013c
	move.w	#$8000,($00ee,a6)
L00018a:
	pea.l	(L000803)
	DOS	_PRINT
	pea.l	(L0008fe)
	DOS	_PRINT
	pea.l	(L000800)
	DOS	_PRINT
	lea.l	($000c,a7),a7
	bra	L00013c

L0001a8:
	rts

L0001aa:
	move.w	#$0100,d0
	move.b	($0092,a6),d0
	and.b	#$1f,d0
	move.w	d0,-(a7)
	DOS	_DRVCTRL
	addq.l	#2,a7
	pea.l	(L00080a)
	DOS	_PRINT
	DOS	_GETC
	pea.l	(L000800)
	DOS	_PRINT
	lea.l	($0008,a7),a7
L0001d2:
	clr.l	d0
	rts

L0001d6:
	move.b	d0,(a0)+
L0001d8:
	move.b	(a1)+,d0
	beq	L0001fe
	cmp.b	#$5c,d0			;'\'
	beq	L000200
	cmp.b	#$80,d0
	bcs	L0001d6
	cmp.b	#$a0,d0
	bcs	L0001f4
	cmp.b	#$e0,d0
	bcs	L0001d6
L0001f4:
	move.b	d0,(a0)+
	move.b	(a1)+,d0
	bne	L0001d6
	move.b	#$40,(a0)+		;'@'
L0001fe:
	subq.l	#1,a1
L000200:
	clr.b	(a0)
	rts

L000204:
	bsr	L0003f6
	tst.b	(L000896)
	bne	L000218
	tst.b	(L000897)
	beq	L000266
L000218:
	move.w	#$00ff,-(a7)
	pea.l	(L0008fe)
	pea.l	(L00095a)
	DOS	_FILES
	lea.l	($000a,a7),a7
	clr.l	d1
	cmp.l	#$fffffffe,d0
	beq	L000250
	cmp.l	#$ffffffee,d0
	beq	L000250
	tst.l	d0
	bne	L00039e
	move.l	(L000970),d1
	swap.w	d1
	bra	L00025a

L000250:
	tst.b	(L000896)
	bne	L00039e
L00025a:
	move.l	($0016,a6),d0
	swap.w	d0
	cmp.l	d0,d1
	bcc	L00039e
L000266:
	pea.l	(L0007f8)
	DOS	_PRINT
	pea.l	(L0008a2)
	DOS	_PRINT
	tst.b	(L000898)
	beq	L000290
	pea.l	(L0007fe)
	DOS	_PRINT
	pea.l	(L0008fe)
	DOS	_PRINT
	addq.l	#8,a7
L000290:
	pea.l	(L000800)
	DOS	_PRINT
	lea.l	($000c,a7),a7
L00029c:
	bra	L0002ac

L00029e:
	bsr	L0001aa
	bsr	L00012e
	bsr	L0003f6
	bra	L00029c

L0002ac:
	tst.b	(L000898)
	bne	L00039e
	clr.w	d4
	clr.w	-(a7)
	pea.l	(L0008a2)
	DOS	_OPEN
	addq.l	#6,a7
	tst.l	d0
	bmi	L000374
	move.w	d0,d2
	bsr	L0003a2
	move.w	($00ee,a6),d0
	move.b	($0015,a6),d0
	move.w	d0,-(a7)
	pea.l	(L0008fe)
	DOS	_CREATE
	addq.l	#6,a7
	tst.l	d0
	bmi	L000336
	move.w	d0,d3
	move.l	a7,d7
	sub.l	#$00000040,d7
	sub.l	#End,d7
L0002f8:
	move.l	d7,-(a7)
	pea.l	(End)
	move.w	d2,-(a7)
	DOS	_READ
	lea.l	($000a,a7),a7
	tst.l	d0
	bmi	L000358
	beq	L000378
	move.l	d0,d1
	move.l	d1,-(a7)
	pea.l	(End)
	move.w	d3,-(a7)
	DOS	_WRITE
	lea.l	($000a,a7),a7
	tst.l	d0
	bmi	L000328
	cmp.l	d0,d1
	beq	L0002f8
L000328:
	movem.l	d0,-(a7)
	bsr	L000358
	movem.l	(a7)+,d0
	bra	L00029e

L000336:
	movem.l	d0,-(a7)
	bsr	L00036e
	movem.l	(a7)+,d0
	cmp.l	#$ffffffe9,d0
	beq	L00029e
	cmp.l	#$ffffffe8,d0
	beq	L00029e
	moveq.l	#$ff,d1
	rts

L000358:
	move.w	d3,-(a7)
	DOS	_CLOSE
	addq.l	#2,a7
	bsr	L0003a2
	pea.l	(L0008fe)
	DOS	_DELETE
	addq.l	#4,a7
	bra.w	L00036e

L00036e:
	move.w	d2,-(a7)
	DOS	_CLOSE
	addq.l	#2,a7
L000374:
	moveq.l	#$ff,d1
	rts

L000378:
	clr.l	-(a7)
	move.w	d2,-(a7)
	DOS	_FILEDATE
	addq.l	#6,a7
	swap.w	d0
	cmp.w	#$ffff,d0
	beq	L000358
	swap.w	d0
	move.l	d0,-(a7)
	move.w	d3,-(a7)
	DOS	_FILEDATE
	addq.l	#6,a7
	move.w	d3,-(a7)
	DOS	_CLOSE
	addq.l	#2,a7
	move.w	d2,-(a7)
	DOS	_CLOSE
	addq.l	#2,a7
L00039e:
	clr.l	d1
	rts

L0003a2:
	move.w	#$ffff,-(a7)
	pea.l	(L0008fe)
	DOS	_CHMOD
	addq.l	#6,a7
	tst.l	d0
	bmi	L0003c4
	and.w	#$00f8,d0
	move.w	d0,-(a7)
	pea.l	(L0008fe)
	DOS	_CHMOD
	addq.l	#6,a7
L0003c4:
	rts

L0003c6:
	bsr	L0003f6
	lea.l	(L0008a2),a0
	bsr	L000516
	move.b	#$5c,(a0)+		;'\'
	move.b	#$2a,(a0)+		;'*'
	move.b	#$2e,(a0)+		;'.'
	move.b	#$2a,(a0)+		;'*'
	clr.b	(a0)
	lea.l	(L0008fe),a0
	bsr	L000516
	move.b	#$5c,(a0)+		;'\'
	clr.b	(a0)
	rts

L0003f6:
	lea.l	(L0008a2),a0
	lea.l	($0036,a6),a1
	bsr	L00051e
	lea.l	($001e,a6),a1
	bsr	L00051e
	lea.l	(L0008fe),a0
	lea.l	($0092,a6),a1
	bsr	L00051e
	lea.l	($001e,a6),a1
	bsr	L00051e
	lea.l	(L0008fe),a0
L000428:
	tst.b	(L000899)
	beq	L000456
L000430:
	move.b	(a0)+,d0
	beq	L000456
	cmp.b	#$61,d0			;'a'
	bcs	L000430
	cmp.b	#$7b,d0			;'{'
	bcs	L000458
	cmp.b	#$81,d0
	bcs	L000430
	cmp.b	#$a0,d0
	bcs	L000452
	cmp.b	#$e0,d0
	bcs	L000430
L000452:
	move.b	(a0)+,d0
	bne	L000430
L000456:
	rts

L000458:
	sub.b	#$20,d0			;' '
	move.b	d0,(-$0001,a0)
	bra	L000430

L000462:
	move.w	($001e,a6),d0
	cmp.w	#$2e00,d0
	beq	L00048e
	cmp.w	#$2e2e,d0		;'..'
	beq	L00048e
	move.b	($0015,a6),d0
	btst.l	#$03,d0
	bne	L00048e
	tst.b	(L00089b)
	beq	L00048a
	btst.l	#$02,d0
	bne	L00048e
L00048a:
	tst.w	d0
	rts

L00048e:
	clr.l	d0
	rts

L000492:
	pea.l	($0036,a6)
	pea.l	(L0008a2)
	DOS	_NAMECK
	addq.l	#8,a7
	tst.l	d0
	bmi	L000506
	pea.l	($0092,a6)
	pea.l	(L0008fe)
	DOS	_NAMECK
	addq.l	#8,a7
	tst.l	d0
	bmi	L000506
	cmp.l	#$000000ff,d0
	beq	L0004e2
	tst.l	d0
	bne	L000504
	lea.l	($0092,a6),a0
	bsr	L000516
	lea.l	($00d5,a6),a1
	bsr	L00051e
	lea.l	($00e8,a6),a1
	bsr	L00051e
	move.b	#$5c,(a0)+		;'\'
	clr.b	(a0)+
	clr.b	($00d5,a6)
	clr.b	($00e8,a6)
L0004e2:
	move.b	($0036,a6),d0
	cmp.b	($0092,a6),d0
	beq	L000504
	move.w	#$00ff,-(a7)
	pea.l	(L0008a2)
	pea.l	($0000.w,a6)
	DOS	_FILES
	lea.l	($000a,a7),a7
	tst.l	d0
	rts

L000504:
	moveq.l	#$ff,d0
L000506:
	rts

L000508:
	pea.l	($0000.w,a6)
	DOS	_NFILES
	lea.l	($0004,a7),a7
	tst.l	d0
	rts

L000516:
	tst.b	(a0)+
	bne	L000516
	subq.l	#1,a0
	rts

L00051e:
	move.b	(a1)+,(a0)+
	bne	L00051e
	subq.l	#1,a0
	rts

L000526:
	move.b	(a2)+,d0
	beq	L00055c
	cmp.b	#$20,d0			;' '
	beq	L000526
	cmp.b	#$09,d0
	beq	L000526
	cmp.b	#$2d,d0			;'-'
	beq	L000542
	cmp.b	#$2f,d0			;'/'
	bne	L00054a
L000542:
	move.b	(a2)+,d0
	beq	L00055c
	bsr	L00058a
	bra	L000526

L00054a:
	move.b	d0,(a0)+
	move.b	(a2)+,d0
	beq	L00055c
	cmp.b	#$20,d0			;' '
	beq	L00055c
	cmp.b	#$09,d0
	bne	L00054a
L00055c:
	clr.b	(a0)
	subq.l	#1,a2
	rts

L000562:
	move.b	(a2)+,d0
	beq	L000586
	cmp.b	#$20,d0			;' '
	beq	L000562
	cmp.b	#$09,d0
	beq	L000562
	cmp.b	#$2d,d0			;'-'
	beq	L00057e
	cmp.b	#$2f,d0			;'/'
	bne	L000562
L00057e:
	move.b	(a2)+,d0
	beq	L000586
	bsr	L00058a
	bra	L000562

L000586:
	subq.l	#1,a2
	rts

L00058a:
	or.b	#$20,d0
	cmp.b	#$64,d0			;'d'
	beq	L0005c0
	cmp.b	#$6e,d0			;'n'
	beq	L0005ca
	cmp.b	#$74,d0			;'t'
	beq	L0005d4
	cmp.b	#$76,d0			;'v'
	beq	L0005de
	cmp.b	#$75,d0			;'u'
	beq	L0005e8
	cmp.b	#$71,d0			;'q'
	beq	L0005f2
	cmp.b	#$73,d0			;'s'
	beq	L0005fc
	cmp.b	#$63,d0			;'c'
	beq	L000606
	rts

L0005c0:
	move.b	#$01,(L000895)
	rts

L0005ca:
	move.b	#$01,(L000896)
	rts

L0005d4:
	move.b	#$01,(L000897)
	rts

L0005de:
	move.b	#$01,(L000898)
	rts

L0005e8:
	move.b	#$01,(L000899)
	rts

L0005f2:
	move.b	#$01,(L00089a)
	rts

L0005fc:
	move.b	#$01,(L00089b)
	rts

L000606:
	cmpi.w	#$020e,(L00089e)
	bcc	L00061a
	pea.l	(L0007d0,pc)
	DOS	_PRINT
	addq.l	#4,a7
	rts

L00061a:
	move.b	#$01,(L00089c)
	rts


	.data

L000624:
	.dc.b	'X68k Copyall v1.20 Copyright 1989-93 SHARP/Hudson',$0d,$0a,$00
L000658:
	.dc.b	'使用法：copyall [スイッチ] 転送元ファイル名 転送先パス名',$0d,$0a
	.dc.b	$09,'/d',$09,'サブディレクトリはコピーしない (copy)',$0d,$0a
	.dc.b	$09,'/t',$09,'転送元が新しい場合のみコピーする(tar)',$0d,$0a
	.dc.b	$09,'/n',$09,'転送先が古い場合のみコピーする(tar/n)',$0d,$0a
	.dc.b	$09,'/u',$09,'ファイル名を大文字にしてコピーします',$0d,$0a
	.dc.b	$09,'/v',$09,'チェックのみで実際は転送しない',$0d,$0a
	.dc.b	$09,'/s',$09,'システムファイルはコピーしない',$0d,$0a,$00
L000786:
	.dc.b	'/c',$09,'転送先のファイルの存在をチェックをしない',$0d,$0a
	.dc.b	$09,'/q',$09,'起動後、実行確認をする',$0d,$0a,$00
L0007d0:
	.dc.b	'このＯＳでは、/cオプションは無効です。',$0d,$0a
L0007f8:
	.dc.b	'copy ',$00
L0007fe:
	.dc.b	$20,$00
L000800:
	.dc.b	$0d,$0a,$00
L000803:
	.dc.b	'mkdir ',$00
L00080a:
	.dc.b	'ディスクがいっぱいです、入れ替えてください(CTRL-Cで中止)',$00
L000843:
	.dc.b	'コピーできませんでした',$0d,$0a,$00
L00085c:
	.dc.b	'ディスクをセットして何かキーを押して下さい(CTRL-Cで中止)',$00
L000895:
	.dc.b	$00
L000896:
	.dc.b	$00
L000897:
	.dc.b	$00
L000898:
	.dc.b	$00
L000899:
	.dc.b	$00
L00089a:
	.dc.b	$00
L00089b:
	.dc.b	$00
L00089c:
	.dc.b	$00,$00

	.bss

L00089e:
	.ds.w	1
L0008a0:
	.ds.w	1
L0008a2:
	.ds.b	92
L0008fe:
	.ds.b	92
L00095a:
	.ds.b	22
L000970:
	.ds.b	32
End:

	.end	Start
