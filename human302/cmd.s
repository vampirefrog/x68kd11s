;=============================================
;  Filename human302/cmd.x
;
;
;  Base address 000000
;  Exec address 00001a
;  Text size    0002a0 byte(s)
;  Data size    000000 byte(s)
;  Bss  size    001000 byte(s)
;  40 Labels
;
;  Commandline dis  -h -k -m68000 -q1 -B -M -w16 -o120 -ghuman302/cmd.lab --overwrite human302/cmd.x human302/cmd.s
;          DIS version 3.16
;=============================================

	.include	inc/doscall.mac
	.include	inc/iocscall.mac
	.include	inc/fefunc.mac

	.cpu	68000

	.text

L000000:
	.dc.l	$00000000
L000004:
	.dc.l	$00000000
L000008:
	.dc.l	$00000000
L00000c:
	.dc.b	'Command2.03Hu',$00
L00001a:
	lea.l	(L0012a0),a7
	DOS	_VERNUM
	cmp.w	#$0132,d0
	bcs	L0000da
	bsr	L000252
	lea.l	(L001000),a7
	move.l	a7,(L000008)
	lea.l	(L0002a0),a0
	lea.l	(L000000-$000080),a1
	bsr	L000208
	lea.l	(L000000-$00003c),a1
	bsr	L000208
	move.l	d0,-(a7)
	lea.l	(L000000-$0000f0),a0
	lea.l	(L001000),a1
	suba.l	a0,a1
	move.l	a1,-(a7)
	move.l	a0,-(a7)
	DOS	_SETBLOCK
	addq.l	#8,a7
	move.l	(a7)+,d0
	bne	L000096
	move.l	#$00ffffff,-(a7)
	DOS	_MALLOC
	sub.l	#$81000000,d0
	move.l	d0,d1
	move.l	d0,(a7)
	DOS	_MALLOC
	addq.l	#4,a7
	tst.l	d0
	bmi	L0000ea
	add.l	d0,d1
	move.l	d0,-(a7)
	bsr	L00018e
	move.l	(a7)+,d0
	addq.l	#4,d0
L000096:
	move.l	d0,(L000004)
	movea.l	d0,a0
	lea.l	($0012,a0),a2
	bsr	L000236
	bne	L0000e2
	subq.l	#4,a0
	clr.l	d0
L0000ac:
	tst.l	(a0)
	beq	L0000be
	tst.l	($0004,a0)
	beq	L0000ba
	add.l	($0010,a0),d0
L0000ba:
	movea.l	(a0),a0
	bra	L0000ac

L0000be:
	move.l	d0,-(a7)
	DOS	_MALLOC
	addq.l	#4,a7
	tst.l	d0
	bmi	L0000ea
	move.l	d0,(L000000)
	movea.l	(L000004),a0
	move.l	d0,(a0)
	jmp	($0010,a0)

L0000da:
	lea.l	(L000171),a0
	bra	L0000f8

L0000e2:
	lea.l	(L000152),a0
	bra	L0000f8

L0000ea:
	lea.l	(L000116),a0
	bra	L0000f8

L0000f2:
	lea.l	(L000139),a0
L0000f8:
	movea.l	a0,a1
	moveq.l	#$ff,d0
L0000fc:
	addq.l	#1,d0
	tst.b	(a0)+
	bne	L0000fc
	move.l	d0,-(a7)
	move.l	a1,-(a7)
	move.w	#$0002,-(a7)
	DOS	_WRITE
	lea.l	($000a,a7),a7
	move.w	#$0700,-(a7)
	DOS	_EXIT2

L000116:
	.dc.b	'メモリが不足です',$0d,$0a
	.dc.b	'異常終了します',$0d,$0a,$00
L000139:
	.dc.b	'常駐部が読み込めません',$0d,$0a,$00
L000152:
	.dc.b	'常駐部のバージョンが違います',$0d,$0a,$00
L000171:
	.dc.b	'このＯＳでは使用できません',$0d,$0a,$00
L00018e:
	move.l	d0,-(a7)
	move.b	#$01,d3
	movem.l	d0,-(a7)
	DOS	_VERNUM
	cmp.w	#$0162,d0
	bcs	L0001ae
	move.b	(L000000-$00009c),d3
	addq.b	#1,d3
	bne	L0001ae
	move.b	#$01,d3
L0001ae:
	movem.l	(a7)+,d0
	bsr	L0001e6
	tst.l	d0
	bmi	L0000f2
L0001ba:
	movea.l	d4,a0
L0001bc:
	clr.l	(a0)
	addq.b	#1,d3
	move.l	d4,d0
	bsr	L0001e6
	tst.l	d0
	bmi	L0001d4
	lea.l	($0014,a0),a2
	bsr	L000236
	beq	L0001ba
	move.l	a0,d4
	bra	L0001bc

L0001d4:
	move.l	(a7)+,d0
	move.l	a0,d1
	addq.l	#4,d1
	sub.l	d0,d1
	move.l	d1,-(a7)
	move.l	d0,-(a7)
	DOS	_SETBLOCK
	addq.l	#8,a7
	rts

L0001e6:
	movem.l	a0,-(a7)
	move.l	d0,d2
	bsr	L000210
	tst.l	d0
	bmi	L000202
	movea.l	d2,a0
	move.l	d2,d4
	add.l	($0008,a0),d4
	addq.l	#5,d4
	and.b	#$fe,d4
	move.l	d4,(a0)
L000202:
	movem.l	(a7)+,a0
	rts

L000208:
	move.b	(a1)+,(a0)+
	bne	L000208
	subq.l	#1,a0
	rts

L000210:
	movem.l	d1-d2/a0,-(a7)
	move.l	d1,-(a7)
	addq.l	#4,d2
	move.l	d2,-(a7)
	pea.l	(L0002a0)
	ori.b	#$03,(a7)
	move.w	#$0003,-(a7)
	or.b	d3,(a7)
	DOS	_EXEC
	lea.l	($000e,a7),a7
	movem.l	(a7)+,d1-d2/a0
	rts

L000236:
	movem.l	d0-d1/a3,-(a7)
	lea.l	(L00000c),a3
	move.w	#$0009,d0
L000244:
	move.b	(a2)+,d1
	cmp.b	(a3)+,d1
	dbne	d0,L000244
	movem.l	(a7)+,d0-d1/a3
	rts

L000252:
	clr.l	-(a7)
	DOS	_SUPER
	move.l	d0,(a7)
	lea.l	(L0003a0),a1
	lea.l	(L000000-$000100),a0
L000264:
	move.l	($0004,a0),d0
	move.l	d0,d1
	rol.l	#8,d1
	tst.b	d1
	bne	L000278
	move.l	d0,(a1)+
	beq	L00027a
	movea.l	d0,a0
	bra	L000264

L000278:
	clr.l	(a1)
L00027a:
	lea.l	(L0003a0),a1
L000280:
	move.l	(a1)+,d0
	beq	L000294
	movea.l	d0,a0
	lea.l	($010c,a0),a2
	bsr	L000236
	bne	L000280
	move.l	($0104,a0),d0
	beq	L000280
L000294:
	move.l	(a7),d1
	move.l	d0,(a7)
	move.l	d1,-(a7)
	DOS	_SUPER
	move.l	(a7)+,d0
	rts


	.bss

L0002a0:
	.ds.b	256
L0003a0:
	.ds.b	3168
L001000:
	.ds.b	672
L0012a0:

	.end	L00001a
