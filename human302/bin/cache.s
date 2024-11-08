;=============================================
;  Filename human302/bin/cache.x
;
;
;  Base address 000000
;  Exec address 000000
;  Text size    00032a byte(s)
;  Data size    000000 byte(s)
;  Bss  size    000400 byte(s)
;  31 Labels
;
;  Commandline dis  -h -k -m68000 -q1 -B -M -w16 -o120 -ghuman302/bin/cache.lab --overwrite human302/bin/cache.x human302/bin/cache.s
;          DIS version 3.16
;=============================================

	.include	inc/doscall.mac
	.include	inc/iocscall.mac
	.include	inc/fefunc.mac

	.cpu	68000

	.text

L000000:
	lea.l	(L00072a,pc),a7
	clr.l	-(a7)
	DOS	_SUPER
	addq.l	#4,a7
	cmpi.b	#$01,($00000cbc).l
	bls	L000022
	addq.l	#1,a2
	bsr	L000162
	bne	L00002c
	bsr	L000124
	bra	L00002a

L000022:
	pea.l	(L000288,pc)
L000026:
	DOS	_PRINT
	addq.l	#4,a7
L00002a:
	DOS	_EXIT

L00002c:
	lea.l	(L000170,pc),a1
	move.w	#$ffff,($0004,a1)
	clr.w	($0006,a1)
	lsl.w	#8,d0
	move.b	(a2)+,d0
	ori.w	#$2020,d0
	cmp.w	#$6f6e,d0		;'on'
	seq.b	($0000.w,a1)
	beq	L00006a
	cmp.w	#$6f66,d0		;'of'
	seq.b	($0001,a1)
	beq	L00006a
	cmp.w	#$6465,d0		;'de'
	seq.b	($0002,a1)
	bne	L0000ae
	move.b	($00ed0090),d2
	bra	L0000f8

L00006a:
	tst.b	(a2)
	beq	L0000cc
	cmpi.b	#$20,(a2)+		;' '
	bne	L00006a
	moveq.l	#$01,d1
	moveq.l	#$ac,d0
	trap	#15
	move.l	d0,d2
	clr.w	($0004,a1)
L000080:
	bsr	L000162
	beq	L0000cc
	ori.b	#$20,d0
	cmp.b	#$69,d0			;'i'
	bne	L000096
	st.b	($0004,a1)
	bra	L000080

L000096:
	cmp.b	#$64,d0			;'d'
	bne	L0000a2
	st.b	($0005,a1)
	bra	L000080

L0000a2:
	cmp.b	#$73,d0			;'s'
	bne	L0000ae
	st.b	($0006,a1)
	bra	L000080

L0000ae:
	pea.l	(L000178,pc)
	bra	L000026

L0000b6:
	move.b	($0004,a1),d0
	beq	L0000c0
	bset.l	#$00,d2
L0000c0:
	move.b	($0005,a1),d0
	beq	L0000f8
	bset.l	#$01,d2
	bra	L0000f8

L0000cc:
	move.b	($0006,a1),d0
	beq	L0000de
	tst.w	($0004,a1)
	bne	L0000de
	move.w	#$ffff,($0004,a1)
L0000de:
	move.b	($0000.w,a1),d0
	bne	L0000b6
	move.b	($0004,a1),d0
	beq	L0000ee
	bclr.l	#$00,d2
L0000ee:
	move.b	($0005,a1),d0
	beq	L0000f8
	bclr.l	#$01,d2
L0000f8:
	moveq.l	#$04,d1
	moveq.l	#$ac,d0
	trap	#15
	bsr	L000124
	move.b	($0006,a1),d0
	beq	L00002a
	move.b	#$31,($00e8e00d)	;'1'
	move.b	d2,($00ed0090)
	clr.b	($00e8e00d)
	pea.l	(L0002b6,pc)
	bra	L000026

L000124:
	moveq.l	#$01,d1
	moveq.l	#$ac,d0
	trap	#15
	move.l	d0,d1
	pea.l	(L0002f6,pc)
	DOS	_PRINT
	addq.l	#4,a7
	btst.l	#$00,d1
	sne.b	d0
	bsr	L00014e
	pea.l	(L000310,pc)
	DOS	_PRINT
	addq.l	#4,a7
	btst.l	#$01,d1
	sne.b	d0
	bsr	L00014e
	rts

L00014e:
	lea.l	(L0002e6,pc),a0
	tst.b	d0
	bne	L00015a
	lea.l	(L0002ed,pc),a0
L00015a:
	move.l	a0,-(a7)
	DOS	_PRINT
	addq.l	#4,a7
	rts

L000162:
	cmpi.b	#$20,(a2)		;' '
	bne	L00016c
	addq.l	#1,a2
	bra	L000162

L00016c:
	move.b	(a2)+,d0
	rts

L000170:
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
L000178:
	.dc.b	'On-Chip Cache control for MC68030 Copyright 1993 SHARP',$0d,$0a
	.dc.b	'使用法:cache on|off|def [ids]',$0d,$0a
	.dc.b	$09,'on.....キャッシュオン',$0d,$0a
	.dc.b	$09,'off....キャッシュオフ',$0d,$0a
	.dc.b	$09,'def....S-RAM に設定された状態に戻す',$0d,$0a
	.dc.b	$09,'i......命令キャッシュの指定',$0d,$0a
	.dc.b	$09,'d......データキャッシュの指定',$0d,$0a
	.dc.b	$09,'s......S-RAM に指定した状態を設定',$0d,$0a,$00
L000288:
	.dc.b	'MC68000/10 にはキャッシュメモリがありません',$0d,$0a,$00
L0002b6:
	.dc.b	'現在のキャッシュの状態を S-RAM に設定しました',$0d,$0a,$00
L0002e6:
	.dc.b	'ＯＮ',$0d,$0a,$00
L0002ed:
	.dc.b	'ＯＦＦ',$0d,$0a,$00
L0002f6:
	.dc.b	'命令キャッシュ...........',$00
L000310:
	.dc.b	'データキャッシュ.........',$00

	.bss

L00032a:
	.ds.b	1024
L00072a:

	.end	L000000
