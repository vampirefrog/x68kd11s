;=============================================
;  Filename process.x
;  Time Stamp Mon Jan  2 12:00:00 1995
;
;  Base address 000000
;  Exec address 000000
;  Text size    0006a4 byte(s)
;  Data size    000244 byte(s)
;  Bss  size    004404 byte(s)
;  106 Labels
;
;  Commandline dis  -b2 -h -m68000 --sp -q1 -B -M -o120 -gprocess.lab --overwrite process.x process.s
;          DIS version 3.16
;=============================================

	.include	inc/doscall.mac
	.include	inc/iocscall.mac
	.include	inc/fefunc.mac

	.cpu	68000

	.text

L000000:
	lea.l	(L004cec),sp
	DOS	_VERNUM
	cmp.w	#$0332,d0
	bcc.w	L0001f2
	clr.l	-(sp)
	DOS	_SUPER
	addq.l	#4,sp
	pea.l	(L0006a4)
	DOS	_PRINT
	addq.l	#4,sp
	clr.b	(L0008e8)
	clr.b	(L0008e9)
	clr.b	(L0008ea)
	DOS	_VERNUM
	cmp.w	#$0148,d0
	bcs.s	L000042
	move.b	#-$01,(L0008ea)
L000042:
	movea.l	(L000000-$0000e0),a0
	addq.l	#1,a0
	lea.l	(L0008ec),a1
	lea.l	(L0028ec),a2
	bsr.w	L000376
	tst.l	d0
	bne.w	L0001d2
	lea.l	(L0028ec),a0
L000066:
	tst.b	(a0)
	beq.s	L0000bc
	bsr.w	L000418
L00006e:
	move.b	(a0)+,d0
	beq.s	L000066
	cmp.b	#$61,d0			;'a'
	beq.s	L00009e
	cmp.b	#$62,d0			;'b'
	bne.w	L0001d2
	tst.b	(L0008ea)
	beq.w	L0001d2
	tst.b	(L0008e8)
	bne.w	L0001d2
	move.b	#-$01,(L0008e9)
	bra.s	L00006e

L00009e:
	tst.b	(L0008ea)
	beq.w	L0001d2
	tst.b	(L0008e9)
	bne.w	L0001d2
	move.b	#-$01,(L0008e8)
	bra.s	L00006e

L0000bc:
	tst.b	(L0008e9)
	bne.w	L0001b0
	lea.l	(L000000-$000100),a0
	lea.l	(L0028ec),a1
	clr.l	(a1)+
	clr.l	(a1)+
L0000d6:
	move.l	($0004,a0),d0
	move.l	a0,(a1)+
	move.l	d0,(a1)+
	tst.l	d0
	beq.s	L0000ec
	tst.b	($0004,a0)
	bne.s	L0000ec
	movea.l	d0,a0
	bra.s	L0000d6

L0000ec:
	movea.l	a0,a2
	lea.l	(L0028ec),a0
L0000f4:
	cmpa.l	a1,a0
	bcc.s	L00010c
	move.l	(-$0008,a1),d0
	move.l	(-$0004,a1),d1
	move.l	($0004,a0),-(a1)
	move.l	(a0),-(a1)
	move.l	d0,(a0)+
	move.l	d1,(a0)+
	bra.s	L0000f4

L00010c:
	lea.l	(L0008ec),a1
L000112:
	move.l	($0004,a2),d0
	move.l	a2,(a1)+
	move.l	d0,(a1)+
	tst.l	($000c,a2)
	beq.s	L000126
	movea.l	($000c,a2),a2
	bra.s	L000112

L000126:
	clr.l	(a1)+
	clr.l	(a1)
	pea.l	(L00079d)
	DOS	_PRINT
	addq.l	#4,sp
	lea.l	(L0028ec),a2
L00013a:
	tst.l	(a2)
	beq.s	L000150
	bsr.w	L000202
	tst.l	($0008,a2)
	beq.s	L000150
	bsr.w	L0002c6
	addq.l	#8,a2
	bra.s	L00013a

L000150:
	clr.b	d4
	lea.l	(L0008ec),a2
L000158:
	tst.l	(a2)
	beq.s	L000182
	cmpi.b	#$ff,($0004,a2)
	bne.s	L00017e
	tst.b	d4
	bne.s	L000172
	pea.l	(L0008e4)
	DOS	_PRINT
	addq.l	#4,sp
L000172:
	bsr.w	L000278
	bsr.w	L0002c6
	move.b	#-$01,d4
L00017e:
	addq.l	#8,a2
	bra.s	L000158

L000182:
	clr.b	d4
	lea.l	(L0008ec),a2
L00018a:
	tst.l	(a2)
	beq.s	L0001b0
	cmpi.b	#$fe,($0004,a2)
	bne.s	L0001ac
	tst.b	d4
	bne.s	L0001a4
	pea.l	(L0008e4)
	DOS	_PRINT
	addq.l	#4,sp
L0001a4:
	bsr.w	L0002aa
	move.b	#-$01,d4
L0001ac:
	addq.l	#8,a2
	bra.s	L00018a

L0001b0:
	move.b	(L0008e8),d0
	or.b	(L0008e9),d0
	beq.s	L0001d0
	bsr.w	L00045e
	tst.l	d0
	beq.s	L0001d0
	pea.l	(BackgroundManagerNotLoadedString)
	DOS	_PRINT
	addq.l	#4,sp
L0001d0:
	DOS	_EXIT

L0001d2:
	tst.b	(L0008ea)
	beq.s	L0001e2
	pea.l	(L0006d8)
	bra.s	L0001e8

L0001e2:
	pea.l	(L00078b)
L0001e8:
	DOS	_PRINT
	addq.l	#4,sp
	move.w	#$0001,-(sp)
	DOS	_EXIT2

L0001f2:
	pea.l	(L00088f)
	DOS	_PRINT
	addq.l	#4,sp
	move.w	#$0002,-(sp)
	DOS	_EXIT2

L000202:
	move.l	#$00006800,d2
	tst.l	($0004,a2)
	beq.s	L000216
	move.l	(a2),d2
	add.l	#$00000010,d2
L000216:
	movea.l	(a2),a1
	move.l	($0008,a1),d3
	bsr.w	L000310
	lea.l	(L0008bf),a0
	tst.l	($0004,a2)
	beq.s	L000240
	movea.l	($0008,a2),a1
	move.w	($0044,a1),d0
	and.w	#$2000,d0
	bne.s	L000240
	lea.l	(L0008b6),a0
L000240:
	move.l	a0,-(sp)
	DOS	_PRINT
	addq.l	#4,sp
	lea.l	(L0008ac),a1
	tst.l	($0004,a2)
	beq.s	L000266
	movea.l	(a2),a1
	adda.l	#$00000080,a1
	move.l	a1,-(sp)
	DOS	_PRINT
	addq.l	#4,sp
	adda.l	#$00000044,a1
L000266:
	move.l	a1,-(sp)
	DOS	_PRINT
	addq.l	#4,sp
	pea.l	(L0008e4)
	DOS	_PRINT
	addq.l	#4,sp
	rts

L000278:
	move.l	(a2),d2
	add.l	#$00000010,d2
	movea.l	(a2),a1
	move.l	($0008,a1),d3
	bsr.w	L000310
	pea.l	(L0008c8)
	DOS	_PRINT
	addq.l	#4,sp
	movea.l	(a2),a1
	adda.l	#$00000080,a1
	move.l	a1,-(sp)
	DOS	_PRINT
	addq.l	#4,sp
	adda.l	#$00000044,a1
	bra.s	L000266

L0002aa:
	move.l	(a2),d2
	add.l	#$00000010,d2
	movea.l	(a2),a1
	move.l	($0008,a1),d3
	bsr.s	L000310
	pea.l	(L0008d1)
	DOS	_PRINT
	addq.l	#4,sp
	rts

L0002c6:
	lea.l	(L0008ec),a3
L0002cc:
	move.l	(a3),d2
	tst.l	d2
	beq.s	L00030e
	move.l	($0004,a3),d1
	tst.l	d1
	beq.s	L00030a
	cmp.l	(a2),d1
	bne.s	L00030a
	lea.l	(L0028ec),a4
L0002e4:
	tst.l	(a4)
	beq.s	L0002f0
	cmp.l	(a4),d2
	beq.s	L00030a
	addq.l	#8,a4
	bra.s	L0002e4

L0002f0:
	move.l	(a3),d2
	add.l	#$00000010,d2
	movea.l	(a3),a1
	move.l	($0008,a1),d3
	bsr.s	L000310
	pea.l	(L0008dc)
	DOS	_PRINT
	addq.l	#4,sp
L00030a:
	addq.l	#8,a3
	bra.s	L0002cc

L00030e:
	rts

L000310:
	movem.l	d1-d3,-(sp)
	move.l	d2,d1
	bsr.s	L00033a
	move.w	#$0020,-(sp)		;' '
	DOS	_PUTCHAR
	addq.l	#2,sp
	move.l	d3,d1
	subq.l	#1,d1
	bsr.s	L00033a
	move.w	#$0020,-(sp)		;' '
	DOS	_PUTCHAR
	addq.l	#2,sp
	sub.l	d2,d3
	move.l	d3,d1
	bsr.s	L00033a
	movem.l	(sp)+,d1-d3
	rts

L00033a:
	movem.l	d2-d4,-(sp)
	bsr.s	L000346
	movem.l	(sp)+,d2-d4
	rts

L000346:
	move.l	d1,d3
	swap.w	d3
	bsr.s	L000356
	move.w	d1,d2
	move.w	d2,d3
	ror.w	#8,d3
	bsr.s	L000356
	move.b	d2,d3
L000356:
	move.b	d3,d4
	ror.b	#4,d4
	bsr.s	L00035e
	move.b	d3,d4
L00035e:
	and.w	#$000f,d4
	add.b	#$30,d4			;'0'
	cmp.b	#$39,d4			;'9'
	bls.s	L00036e
	addq.b	#7,d4
L00036e:
	move.w	d4,-(sp)
	DOS	_PUTCHAR
	addq.l	#2,sp
	rts

L000376:
	movem.l	d1/a0-a2,-(sp)
	clr.l	d1
L00037c:
	bsr.w	L000406
	tst.b	(a0)
	beq.s	L0003f6
	move.b	(a0)+,d0
	cmp.b	#$2d,d0			;'-'
	beq.s	L000392
	cmp.b	#$2f,d0			;'/'
	bne.s	L0003a8
L000392:
	move.b	(a0)+,d0
	beq.s	L0003f6
	cmp.b	#$09,d0
	beq.s	L0003a4
	cmp.b	#$20,d0			;' '
	beq.s	L0003a4
	move.b	d0,(a2)+
L0003a4:
	clr.b	(a2)+
	bra.s	L00037c

L0003a8:
	addq.l	#1,d1
L0003aa:
	move.b	d0,(a1)+
	cmp.b	#$22,d0			;'"'
	bne.s	L0003c0
L0003b2:
	move.b	(a0)+,d0
	beq.s	L0003f6
	move.b	d0,(a1)+
	cmp.b	#$22,d0			;'"'
	bne.s	L0003b2
	bra.s	L0003d2

L0003c0:
	cmp.b	#$27,d0			;'''
	bne.s	L0003d2
L0003c6:
	move.b	(a0)+,d0
	beq.s	L0003f6
	move.b	d0,(a1)+
	cmp.b	#$27,d0			;'''
	bne.s	L0003c6
L0003d2:
	move.b	(a0),d0
	beq.s	L0003f6
	cmp.b	#$2f,d0			;'/'
	beq.s	L0003f2
	cmp.b	#$2d,d0			;'-'
	beq.s	L0003f2
	addq.l	#1,a0
	cmp.b	#$09,d0
	beq.s	L0003f2
	cmp.b	#$20,d0			;' '
	beq.s	L0003f2
	bra.s	L0003aa

L0003f2:
	clr.b	(a1)+
	bra.s	L00037c

L0003f6:
	clr.b	(a1)+
	clr.b	(a1)
	clr.b	(a2)+
	clr.b	(a2)
	move.l	d1,d0
	movem.l	(sp)+,d1/a0-a2
	rts

L000406:
	move.b	(a0)+,d0
	cmpi.b	#$20,d0			;' '
	beq.s	L000406
	cmpi.b	#$09,d0
	beq.s	L000406
	subq.l	#1,a0
	rts

L000418:
	movem.l	d0-d1/a0,-(sp)
	clr.b	d1
L00041e:
	move.b	(a0),d0
	beq.s	L000458
	tst.b	d1
	beq.s	L00042a
	clr.b	d1
	bra.s	L000440

L00042a:
	cmp.b	#$80,d0
	bcs.s	L000444
	cmp.b	#$a0,d0
	bcs.s	L00043c
	cmp.b	#$e0,d0
	bcs.s	L000444
L00043c:
	move.b	#$01,d1
L000440:
	addq.l	#1,a0
	bra.s	L00041e

L000444:
	cmpi.b	#$41,d0			;'A'
	bcs.s	L000454
	cmpi.b	#$5a,d0			;'Z'
	bhi.s	L000454
	add.b	#$20,d0			;' '
L000454:
	move.b	d0,(a0)+
	bra.s	L00041e

L000458:
	movem.l	(sp)+,d0-d1/a0
	rts

L00045e:
	DOS	_CHANGE_PR
	pea.l	(L000566)
	clr.w	-(sp)
	DOS	_GET_PR
	addq.l	#6,sp
	tst.l	d0
	bmi.s	L00049a
	pea.l	(L0005de)
	DOS	_PRINT
	addq.l	#4,sp
	clr.l	d7
	bsr.s	L0004a2
L00047e:
	addq.w	#1,d7
	cmp.w	#$0020,d7		;' '
	bcc.s	L00049e
	pea.l	(L000566)
	move.w	d7,-(sp)
	DOS	_GET_PR
	addq.l	#6,sp
	tst.l	d0
	bmi.s	L00047e
	bsr.s	L0004a2
	bra.s	L00047e

L00049a:
	moveq.l	#$ff,d0
	rts

L00049e:
	clr.l	d0
	rts

L0004a2:
	lea.l	(L000566),a5
	move.l	($0008,a5),d0
	beq.s	L000520
	add.l	#$00000010,d0
	bsr.s	L000532
	bsr.w	L00055c
	move.l	d7,d0
	bsr.w	L000542
	bsr.w	L00055c
	lea.l	($0060,a5),a0
	moveq.l	#$0e,d1
	bsr.s	L000522
	bsr.w	L00055c
	move.b	($0004,a5),d0
	bne.s	L0004e0
	move.b	($0006,a5),d0
	addq.w	#1,d0
	bsr.s	L000542
	bra.s	L0004ea

L0004e0:
	pea.l	(L0006a1)
	DOS	_PRINT
	addq.l	#4,sp
L0004ea:
	bsr.s	L00055c
	move.l	($0070,a5),d0
	bsr.s	L000532
	bsr.s	L00055c
	move.l	($0052,a5),d0
	bsr.s	L000532
	bsr.s	L00055c
	move.l	($000c,a5),d0
	bsr.s	L000532
	bsr.s	L00055c
	move.l	($005c,a5),d0
	bsr.s	L000532
	bsr.s	L00055c
	movea.l	($005c,a5),a1
	IOCS	_B_LPEEK
	bsr.s	L000532
	pea.l	(L00069e)
	DOS	_PRINT
	addq.l	#4,sp
L000520:
	rts

L000522:
	move.b	(a0)+,d0
	bne.s	L00052a
	subq.l	#1,a0
	moveq.l	#$20,d0			;' '
L00052a:
	bsr.s	L00055e
	dbra.w	d1,L000522
	rts

L000532:
	move.w	d0,-(sp)
	swap.w	d0
	bsr.s	L000542
	move.w	(sp)+,d0
	move.w	d0,-(sp)
	lsr.w	#8,d0
	bsr.s	L000542
	move.w	(sp)+,d0
L000542:
	move.w	d0,-(sp)
	lsr.w	#4,d0
	bsr.s	L00054a
	move.w	(sp)+,d0
L00054a:
	and.w	#$000f,d0
	cmp.w	#$000a,d0
	bcs.s	L000556
	addq.w	#7,d0
L000556:
	add.w	#$0030,d0
	bra.s	L00055e

L00055c:
	moveq.l	#$20,d0			;' '
L00055e:
	move.w	d0,-(sp)
	DOS	_PUTCHAR
	addq.l	#2,sp
	rts

L000566:
	.dc.l	$00000000,$00000100
	.dc.l	$00000000,$00000000
	.dc.l	$00000000,$00000001
	.dc.l	$00000002,$00000003
	.dc.l	$00000004,$00000005
	.dc.l	$00000006,$00000007
	.dc.l	$00000000,$00000001
	.dc.l	$00000002,$00000003
	.dc.l	$00000004,$00000005
	.dc.l	$00000006,$00000000
	.dc.l	$00000000,$00000000
	.dc.l	$00000000,$00000000
L0005c6:
	.dc.b	'Human68k system',$00,$00,$00,$00,$00,$00,$00,$00,$00
L0005de:
	.dc.b	'---------------------------------------------------------------',$0d,$0a
	.dc.b	'PSP ID ID  プログラム名  ﾓｰﾄﾞ ｽﾘｰﾌﾟ  SSP    USP   ﾊﾞｯﾌｧ   長さ',$0d,$0a
	.dc.b	'------ -- --------------- -- ------ ------ ------ ------ ------'
L00069e:
	.dc.b	$0d,$0a,$00
L0006a1:
	.dc.b	$2d,$2d,$00

	.data

L0006a4:
	.dc.b	'X68k Process v2.10 Copyright 1989-93 SHARP/Hudson',$0d,$0a,$00
L0006d8:
	.dc.b	'使用法：process［スイッチ］',$0d,$0a
	.dc.b	$09,'/b',$09,'バックグラウンドプロセスの表示',$0d,$0a
	.dc.b	$09,'/a',$09,'全プロセスの表示',$0d,$0a
	.dc.b	$0d,$0a
	.dc.b	$09,'/a,/bはどちらか１つを指定する',$0d,$0a
	.dc.b	$09,'スイッチがない場合はフォアグラウンドプロセスを表示する',$0d,$0a,$00
L00078b:
	.dc.b	'使用法：process',$0d,$0a,$00
L00079d:
	.dc.b	'---------------------------------------------------------------',$0d,$0a
	.dc.b	' 開始   終了   長さ  モード             ファイル名',$0d,$0a
	.dc.b	'------ ------ ------ ------ -----------------------------------',$0d,$0a,$00
BackgroundManagerNotLoadedString:
	.dc.b	'バックグラウンドタスクマネージャーが組み込まれていません',$0d,$0a,$00
L00088f:
	.dc.b	'このＯＳでは使用できません',$0d,$0a,$00
L0008ac:
	.dc.b	'Human.sys',$00
L0008b6:
	.dc.b	' USER   ',$00
L0008bf:
	.dc.b	' SUPER  ',$00
L0008c8:
	.dc.b	' KEEP   ',$00
L0008d1:
	.dc.b	' MEMDRV ',$0d,$0a,$00
L0008dc:
	.dc.b	' MALLOC '
L0008e4:
	.dc.b	$0d,$0a,$00,$00

	.bss

L0008e8:
	.ds.b	1
L0008e9:
	.ds.b	1
L0008ea:
	.ds.b	2
L0008ec:
	.ds.b	8192
L0028ec:
	.ds.b	9216
L004cec:

	.end	L000000
