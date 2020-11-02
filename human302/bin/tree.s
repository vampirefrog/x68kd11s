;=============================================
;  Filename human302/bin/tree.x
;
;
;  Base address 000000
;  Exec address 000000
;  Text size    000306 byte(s)
;  Data size    000000 byte(s)
;  Bss  size    001276 byte(s)
;  57 Labels
;
;  Commandline dis  -h -k -m68000 -q1 -B -M -w16 -o120 -ghuman302/bin/tree.lab --overwrite human302/bin/tree.x human302/bin/tree.s
;          DIS version 3.16
;=============================================

	.include	inc/doscall.mac
	.include	inc/iocscall.mac
	.include	inc/fefunc.mac

	.cpu	68000

	.text

Start:
	lea.l	(L00157c),a7
	bsr	L000288
	move.l	a0,-(a7)
	bsr	L00027a
	movea.l	(a7)+,a0
	bsr	L0001c4
	bsr	L00009e
	clr.w	d0
	bra	L0002c2

L000020:
	lea.l	(L000030,pc),a0
	bsr	L0002e2
	move.w	#$0001,d0
	bra	L0002c2

L000030:
	.dc.b	'X68k Tree v1.01 Copyright 1989 SHARP/Hudson',$0d,$0a
	.dc.b	'使用法：tree ［スイッチ］［パス名］',$0d,$0a
	.dc.b	$09,'/f',$09,'ファイル名も表示する',$0d,$0a,$00,$00
L00009e:
	lea.l	(L000308),a0
	lea.l	(L000514),a1
	tst.w	(L000306)
	beq	L0000ba
	cmpi.b	#$3a,($0001,a0)		;':'
	beq	L0000c8
L0000ba:
	bsr	L0002c6
	add.w	#$0061,d0
	move.b	d0,(a1)+
	move.b	#$3a,(a1)+		;':'
L0000c8:
	move.b	(a0)+,(a1)+
	bne	L0000c8
	lea.l	(L000514),a0
	cmpi.b	#$5c,($0002,a0)		;'\'
	beq	L0000e0
	moveq.l	#$5c,d0			;'\'
	bsr	L0002ea
L0000e0:
	addq.l	#2,a0
	bsr	L0002e2
	bsr	L0002f2
	subq.l	#2,a0
L0000ec:
	link.w	a6,#-$0036
	addq.w	#1,(L000512)
	lea.l	(-$0036,a6),a1
	lea.l	(L000514),a2
L000100:
	tst.b	(a2)+
	bne	L000100
	move.b	#$5c,(-$0001,a2)	;'\'
	move.b	#$2a,(a2)+		;'*'
	move.b	#$2e,(a2)+		;'.'
	move.b	#$2a,(a2)+		;'*'
	clr.b	(a2)
	bsr	L0002ca
	tst.l	d0
	bmi	L000158
	clr.b	(-$0003,a2)
	lea.l	(L000514),a2
L00012a:
	btst.b	#$04,($0015,a1)
	beq	L000146
	cmpi.b	#$2e,($001e,a1)		;'.'
	beq	L000150
	bsr	L000178
	bsr	L0002f2
	bsr	L000162
	bsr	L00019e
	bra	L000150

L000146:
	tst.w	(L000510)
	beq	L000150
	bsr	L000162
L000150:
	bsr	L0002da
	tst.l	d0
	bpl	L00012a
L000158:
	subq.w	#1,(L000512)
	unlk	a6
	rts

L000162:
	bsr	L000178
	moveq.l	#$2d,d0			;'-'
	bsr	L0002ea
	lea.l	($001e,a1),a0
	bsr	L0002e2
	bsr	L0002f2
	rts

L000178:
	move.w	#$007c,d0		;'|'
	bsr	L0002ea
	move.w	(L000512),d1
	subq.w	#2,d1
	bmi	L000196
L00018a:
	lea.l	(L000198,pc),a0
	bsr	L0002e2
	dbra	d1,L00018a
L000196:
	rts

L000198:
	move.l	-(a0),d0
L00019a:
	.dc.b	$20,$7c,$00,$00
L00019e:
	movem.l	a1-a2,-(a7)
	movea.l	a2,a0
L0001a4:
	tst.b	(a2)+
	bne	L0001a4
	subq.l	#1,a2
	move.l	a2,-(a7)
	lea.l	($001e,a1),a1
L0001b0:
	move.b	(a1)+,(a2)+
	bne	L0001b0
	clr.b	(a2)
	bsr	L0000ec
	movea.l	(a7)+,a2
	clr.b	(a2)
	movem.l	(a7)+,a1-a2
	rts

L0001c4:
	clr.w	(L000306)
	clr.b	(L000308)
	clr.b	(L00040c)
L0001d6:
	bsr	L000204
	tst.b	(a0)
	beq	L0001e2
	bsr	L0001e4
	tst.b	(a0)
	bne	L0001d6
L0001e2:
	rts

L0001e4:
	lea.l	(L000308),a1
	tst.w	(a1)
	beq	L0001fa
	lea.l	(L00040c),a1
	tst.w	(a1)
	bne	L000020
L0001fa:
	bsr	L000266
	addq.w	#1,(L000306)
	rts

L000204:
	bsr	L00024a
	cmp.b	#$2d,d0			;'-'
	beq	L000214
	cmp.b	#$2f,d0			;'/'
	beq	L000214
	rts

L000214:
	addq.l	#1,a0
L000216:
	move.b	(a0),d0
	beq	L000204
	cmp.b	#$20,d0			;' '
	beq	L000204
	addq.l	#1,a0
	bsr	L000254
	lea.l	(L000238,pc),a1
L000228:
	move.w	(a1)+,d1
	bmi	L000020
	movea.l	(a1)+,a2
	cmp.b	d1,d0
	bne	L000228
	jsr	(a2)
	bra	L000216

L000238:
	.dc.w	$0066
	.dc.l	L000240
	.dc.w	$ffff
L000240:
	move.w	#$ffff,(L000510)
	rts

L00024a:
	cmpi.b	#$20,(a0)+		;' '
	beq	L00024a
	move.b	-(a0),d0
	rts

L000254:
	cmp.b	#$5b,d0			;'['
	bcc	L000264
	cmp.b	#$41,d0			;'A'
	bcs	L000264
	add.b	#$20,d0			;' '
L000264:
	rts

L000266:
	move.b	(a0)+,d0
	beq	L000274
	cmp.b	#$20,d0			;' '
	beq	L000274
	move.b	d0,(a1)+
	bra	L000266

L000274:
	subq.l	#1,a0
	clr.b	(a1)+
	rts

L00027a:
	clr.w	(L000510)
	clr.w	(L000512)
	rts

L000288:
	adda.l	#$00000010,a0
	suba.l	a0,a1
	movem.l	a0-a1,-(a7)
	DOS	_SETBLOCK
L000296:
	move.l	#$00ffffff,(a7)
	DOS	_MALLOC
	and.l	#$00ffffff,d0
	move.l	d0,(a7)
	DOS	_MALLOC
	tst.l	d0
	bmi	L000296
	move.l	d0,(L000574)
	add.l	(a7)+,d0
	move.l	d0,(L000578)
	addq.l	#4,a7
	lea.l	($0001,a2),a0
	rts

L0002c2:
	move.w	d0,-(a7)
	DOS	_EXIT

L0002c6:
	DOS	_CURDRV
	rts

L0002ca:
	move.w	#$003f,-(a7)		;'?'
	pea.l	(a0)
	pea.l	(a1)
	DOS	_FILES
	lea.l	($000a,a7),a7
	rts

L0002da:
	pea.l	(a1)
	DOS	_NFILES
	addq.l	#4,a7
	rts

L0002e2:
	pea.l	(a0)
	DOS	_PRINT
	addq.l	#4,a7
	rts

L0002ea:
	move.w	d0,-(a7)
	DOS	_PUTCHAR
	move.w	(a7)+,d0
	rts

L0002f2:
	move.l	d0,-(a7)
	move.w	#$000d,-(a7)
	DOS	_PUTCHAR
	move.w	#$000a,(a7)
	DOS	_PUTCHAR
	addq.l	#2,a7
	move.l	(a7)+,d0
	rts


	.bss

L000306:
	.ds.w	1
L000308:
	.ds.b	260
L00040c:
	.ds.b	260
L000510:
	.ds.w	1
L000512:
	.ds.w	1
L000514:
	.ds.b	96
L000574:
	.ds.l	1
L000578:
	.ds.b	4100
L00157c:

	.end	Start
