;=============================================
;  Filename sys.x
;
;
;  Base address 000000
;  Exec address 000000
;  Text size    000388 byte(s)
;  Data size    000000 byte(s)
;  Bss  size    010494 byte(s)
;  38 Labels
;
;  Commandline dis  -b2 -h -m68000 --sp -q1 -B -M -o120 -gsys.lab --overwrite sys.x sys.s
;          DIS version 3.16
;=============================================

	.include	inc/doscall.mac
	.include	inc/iocscall.mac
	.include	inc/fefunc.mac

	.cpu	68000

	.text

Start:
	lea.l	(StackBottom),sp
	move.l	($0008,a0),d7
	sub.l	sp,d7
	DOS	_CURDRV
	move.w	d0,-(sp)
	DOS	_CHGDRV
	move.b	d0,(L00024c)
	move.w	(sp)+,d0
	add.w	#$0041,d0
	move.b	d0,(L00024d)
	move.b	d0,(L00024f)
	addq.l	#1,a2
L00002c:
	move.b	(a2)+,d1
	beq.w	L0000fa
	cmp.b	#$20,d1			;' '
	beq.s	L00002c
	and.w	#$00df,d1
	cmp.b	#$41,d1			;'A'
	bcs.w	L0000fa
	cmp.b	#$5a,d1			;'Z'
	bhi.w	L0000fa
	and.w	#$001f,d1
	cmp.b	(L00024c),d1
	bhi.w	L0000fa
	move.w	d1,d0
	add.w	#$0040,d0
	move.b	d0,(L00024e)
	cmp.b	(L00024d),d0
	beq.w	L0000fa
	sub.w	#$0040,d0
	pea.l	(L000388)
	move.w	d0,-(sp)
	DOS	_GETDPB
	addq.l	#6,sp
	tst.l	d0
	bmi.s	L0000a8
	move.b	(L00039e),d0
	cmp.b	#$fe,d0
	beq.s	L0000b0
	cmp.b	#$f8,d0
	beq.s	L0000b0
	cmp.b	#$f9,d0
	beq.s	L0000b0
	cmp.b	#$f7,d0
	beq.s	L0000b0
	cmp.b	#$f6,d0
	beq.s	L0000b0
L0000a8:
	pea.l	(L000366)
	bra.s	L000100

L0000b0:
	move.w	#$0004,-(sp)
	pea.l	(L00024f)
	pea.l	(L0003e6)
	DOS	_FILES
	lea.l	($000a,sp),sp
	tst.l	d0
	bmi.s	L0000f2
	move.w	#$0a00,d0
	move.b	(L00024e),d0
	sub.w	#$0040,d0
	move.w	d0,-(sp)
	DOS	_DRVCTRL
	addq.l	#2,sp
L0000de:
	bsr.s	L00010a
	pea.l	(L0003e6)
	DOS	_NFILES
	lea.l	($0004,sp),sp
	tst.l	d0
	bpl.s	L0000de
	DOS	_EXIT

L0000f2:
	pea.l	(L000316)
	bra.s	L000100

L0000fa:
	pea.l	(L00029a)
L000100:
	DOS	_PRINT
	addq.l	#4,sp
	move.w	#$0001,-(sp)
	DOS	_EXIT2

L00010a:
	clr.w	d4
	move.b	(L0003fb),d4
	lea.l	(L000404),a0
	move.b	#$5c,-(a0)		;'\'
	move.b	#$3a,-(a0)		;':'
	move.b	(L00024d),-(a0)
	clr.w	-(sp)
	move.l	a0,-(sp)
	DOS	_OPEN
	addq.l	#6,sp
	tst.l	d0
	bmi.w	L000202
	move.w	d0,d2
	move.b	(L00024e),(a0)
	move.w	#$ffff,-(sp)
	move.l	a0,-(sp)
	DOS	_CHMOD
	addq.l	#6,sp
	tst.l	d0
	bmi.s	L000156
	and.w	#$00fb,d0
	move.w	d0,-(sp)
	move.l	a0,-(sp)
	DOS	_CHMOD
	addq.l	#6,sp
L000156:
	move.w	d4,-(sp)
	move.l	a0,-(sp)
	DOS	_CREATE
	addq.l	#6,sp
	tst.l	d0
	bmi.s	L0001aa
	move.w	d0,d3
L000164:
	move.l	d7,-(sp)
	pea.l	(StackBottom)
	move.w	d2,-(sp)
	DOS	_READ
	lea.l	($000a,sp),sp
	tst.l	d0
	bmi.s	L000194
	beq.s	L0001bc
	move.l	d0,d1
	move.l	d1,-(sp)
	pea.l	(StackBottom)
	move.w	d3,-(sp)
	DOS	_WRITE
	lea.l	($000a,sp),sp
	tst.l	d0
	bmi.s	L000194
	cmp.l	d0,d1
	beq.s	L000164
L000194:
	move.w	d3,-(sp)
	DOS	_CLOSE
	addq.l	#2,sp
	move.w	#$0020,-(sp)		;' '
	move.l	a0,-(sp)
	DOS	_CHMOD
	addq.l	#6,sp
	move.l	a0,-(sp)
	DOS	_DELETE
	addq.l	#4,sp
L0001aa:
	move.l	a0,-(sp)
	DOS	_PRINT
	addq.l	#4,sp
	pea.l	(L000256)
	DOS	_PRINT
	addq.l	#4,sp
	bra.s	L0001fc

L0001bc:
	clr.l	-(sp)
	move.w	d2,-(sp)
	DOS	_FILEDATE
	addq.l	#6,sp
	swap.w	d0
	cmp.w	#$ffff,d0
	beq.s	L000194
	swap.w	d0
	move.l	d0,-(sp)
	move.w	d3,-(sp)
	DOS	_FILEDATE
	addq.l	#6,sp
	move.w	d3,-(sp)
	DOS	_CLOSE
	addq.l	#2,sp
	bsr.s	L000204
	move.l	d0,-(sp)
	move.l	a0,-(sp)
	DOS	_PRINT
	addq.l	#4,sp
	move.l	(sp)+,d0
	beq.s	L0001f2
	pea.l	(L000271)
	bra.s	L0001f8

L0001f2:
	pea.l	(L000341)
L0001f8:
	DOS	_PRINT
	addq.l	#4,sp
L0001fc:
	move.w	d2,-(sp)
	DOS	_CLOSE
	addq.l	#2,sp
L000202:
	rts

L000204:
	DOS	_VERNUM
	cmp.w	#$0150,d0
	bcc.s	L000228
	pea.l	(StackBottom)
	move.l	a0,-(sp)
	DOS	_FATCHK
	addq.l	#8,sp
	cmp.l	#$00000008,d0
	beq.s	L000224
	moveq.l	#$ff,d0
	rts

L000224:
	clr.l	d0
	rts

L000228:
	move.w	#$fffe,-(sp)
	move.l	#StackBottom,d0
	bset.l	#$1f,d0
	move.l	d0,-(sp)
	move.l	a0,-(sp)
	DOS	_FATCHK
	lea.l	($000a,sp),sp
	cmp.l	#$0000000e,d0
	beq.s	L000224
	moveq.l	#$ff,d0
	rts

L00024c:
	.dc.b	$02
L00024d:
	.dc.b	$41
L00024e:
	.dc.b	$42
L00024f:
	.dc.b	$41,$3a,$5c,$2a,$2e,$2a,$00
L000256:
	.dc.b	'　は転送できませんでした',$0d,$0a,$00
L000271:
	.dc.b	'　は連続したＦＡＴに転送されていません',$0d,$0a,$00
L00029a:
	.dc.b	'X68k SystemCopy v2.10 Copyright 1987-90 SHARP/Hudson',$0d,$0a
	.dc.b	'使用法：sys ドライブ名',$0d,$0a
	.dc.b	$09,'システム属性のついたファイルをコピーします',$0d,$0a,$00
L000316:
	.dc.b	'システム属性のついたファイルはありません',$0d,$0a,$00
L000341:
	.dc.b	'　は連続したＦＡＴに転送されました',$0d,$0a,$00
L000366:
	.dc.b	'このドライブには転送できません',$0d,$0a,$00,$00

	.bss

L000388:
	.ds.b	22
L00039e:
	.ds.b	72
L0003e6:
	.ds.b	21
L0003fb:
	.ds.b	9
L000404:
	.ds.b	1048
StackBottom:
	.ds.b	65536
StackTop:

	.end	Start
