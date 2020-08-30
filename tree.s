;=============================================
;  Filename tree.x
;
;
;  Base address 000000
;  Exec address 000000
;  Text size    000306 byte(s)
;  Data size    000000 byte(s)
;  Bss  size    001276 byte(s)
;  57 Labels
;
;  Commandline dis  -b2 -h -m68000 --sp -q1 -B -M -o120 -gtree.lab --overwrite tree.x tree.s
;          DIS version 3.16
;=============================================

	.include	inc/doscall.mac
	.include	inc/iocscall.mac
	.include	inc/fefunc.mac

	.cpu	68000

	.text

Start:
	lea.l	(L00157c),sp
	bsr.w	L000288
	move.l	a0,-(sp)
	bsr.w	L00027a
	movea.l	(sp)+,a0
	bsr.w	L0001c4
	bsr.w	L00009e
	clr.w	d0
	bra.w	L0002c2

L000020:
	lea.l	(L000030,pc),a0
	bsr.w	L0002e2
	move.w	#$0001,d0
	bra.w	L0002c2

L000030:
	.dc.b	'X68k Tree v1.01 Copyright 1989 SHARP/Hudson',$0d,$0a
	.dc.b	'使用法：tree ［スイッチ］［パス名］',$0d,$0a
	.dc.b	$09,'/f',$09,'ファイル名も表示する',$0d,$0a,$00,$00
L00009e:
	lea.l	(L000308),a0
	lea.l	(L000514),a1
	tst.w	(L000306)
	beq.s	L0000ba
	cmpi.b	#$3a,($0001,a0)		;':'
	beq.s	L0000c8
L0000ba:
	bsr.w	L0002c6
	add.w	#$0061,d0
	move.b	d0,(a1)+
	move.b	#$3a,(a1)+		;':'
L0000c8:
	move.b	(a0)+,(a1)+
	bne.s	L0000c8
	lea.l	(L000514),a0
	cmpi.b	#$5c,($0002,a0)		;'\'
	beq.s	L0000e0
	moveq.l	#$5c,d0			;'\'
	bsr.w	L0002ea
L0000e0:
	addq.l	#2,a0
	bsr.w	L0002e2
	bsr.w	L0002f2
	subq.l	#2,a0
L0000ec:
	link.w	a6,#-$0036
	addq.w	#1,(L000512)
	lea.l	(-$0036,a6),a1
	lea.l	(L000514),a2
L000100:
	tst.b	(a2)+
	bne.s	L000100
	move.b	#$5c,(-$0001,a2)	;'\'
	move.b	#$2a,(a2)+		;'*'
	move.b	#$2e,(a2)+		;'.'
	move.b	#$2a,(a2)+		;'*'
	clr.b	(a2)
	bsr.w	L0002ca
	tst.l	d0
	bmi.s	L000158
	clr.b	(-$0003,a2)
	lea.l	(L000514),a2
L00012a:
	btst.b	#$04,($0015,a1)
	beq.s	L000146
	cmpi.b	#$2e,($001e,a1)		;'.'
	beq.s	L000150
	bsr.s	L000178
	bsr.w	L0002f2
	bsr.s	L000162
	bsr.s	L00019a+$000004
	bra.s	L000150

L000146:
	tst.w	(L000510)
	beq.s	L000150
	bsr.s	L000162
L000150:
	bsr.w	L0002da
	tst.l	d0
	bpl.s	L00012a
L000158:
	subq.w	#1,(L000512)
	unlk	a6
	rts

L000162:
	bsr.s	L000178
	moveq.l	#$2d,d0			;'-'
	bsr.w	L0002ea
	lea.l	($001e,a1),a0
	bsr.w	L0002e2
	bsr.w	L0002f2
	rts

L000178:
	move.w	#$007c,d0		;'|'
	bsr.w	L0002ea
	move.w	(L000512),d1
	subq.w	#2,d1
	bmi.s	L000196
L00018a:
	lea.l	(L000198,pc),a0
	bsr.w	L0002e2
	dbra.w	d1,L00018a
L000196:
	rts

L000198:
	move.l	-(a0),d0
L00019a:
	movea.l	#$000048e7,a0
	ori.w	#$204a,-(a0)
L0001a4:
	tst.b	(a2)+
	bne.s	L0001a4
	subq.l	#1,a2
	move.l	a2,-(sp)
	lea.l	($001e,a1),a1
L0001b0:
	move.b	(a1)+,(a2)+
	bne.s	L0001b0
	clr.b	(a2)
	bsr.w	L0000ec
	movea.l	(sp)+,a2
	clr.b	(a2)
	movem.l	(sp)+,a1-a2
	rts

L0001c4:
	clr.w	(L000306)
	clr.b	(L000308)
	clr.b	(L00040c)
L0001d6:
	bsr.s	L000204
	tst.b	(a0)
	beq.s	L0001e2
	bsr.s	L0001e4
	tst.b	(a0)
	bne.s	L0001d6
L0001e2:
	rts

L0001e4:
	lea.l	(L000308),a1
	tst.w	(a1)
	beq.s	L0001fa
	lea.l	(L00040c),a1
	tst.w	(a1)
	bne.w	L000020
L0001fa:
	bsr.s	L000266
	addq.w	#1,(L000306)
	rts

L000204:
	bsr.s	L00024a
	cmp.b	#$2d,d0			;'-'
	beq.s	L000214
	cmp.b	#$2f,d0			;'/'
	beq.s	L000214
	rts

L000214:
	addq.l	#1,a0
L000216:
	move.b	(a0),d0
	beq.s	L000204
	cmp.b	#$20,d0			;' '
	beq.s	L000204
	addq.l	#1,a0
	bsr.s	L000254
	lea.l	(L000238,pc),a1
L000228:
	move.w	(a1)+,d1
	bmi.w	L000020
	movea.l	(a1)+,a2
	cmp.b	d1,d0
	bne.s	L000228
	jsr	(a2)
	bra.s	L000216

L000238:
	.dc.w	$0066
	.dc.l	L000240
	.dc.w	$ffff
L000240:
	move.w	#$ffff,(L000510)
	rts

L00024a:
	cmpi.b	#$20,(a0)+		;' '
	beq.s	L00024a
	move.b	-(a0),d0
	rts

L000254:
	cmp.b	#$5b,d0			;'['
	bcc.s	L000264
	cmp.b	#$41,d0			;'A'
	bcs.s	L000264
	add.b	#$20,d0			;' '
L000264:
	rts

L000266:
	move.b	(a0)+,d0
	beq.s	L000274
	cmp.b	#$20,d0			;' '
	beq.s	L000274
	move.b	d0,(a1)+
	bra.s	L000266

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
	movem.l	a0-a1,-(sp)
	DOS	_SETBLOCK
L000296:
	move.l	#$00ffffff,(sp)
	DOS	_MALLOC
	and.l	#$00ffffff,d0
	move.l	d0,(sp)
	DOS	_MALLOC
	tst.l	d0
	bmi.s	L000296
	move.l	d0,(L000574)
	add.l	(sp)+,d0
	move.l	d0,(L000578)
	addq.l	#4,sp
	lea.l	($0001,a2),a0
	rts

L0002c2:
	move.w	d0,-(sp)
	DOS	_EXIT

L0002c6:
	DOS	_CURDRV
	rts

L0002ca:
	move.w	#$003f,-(sp)		;'?'
	pea.l	(a0)
	pea.l	(a1)
	DOS	_FILES
	lea.l	($000a,sp),sp
	rts

L0002da:
	pea.l	(a1)
	DOS	_NFILES
	addq.l	#4,sp
	rts

L0002e2:
	pea.l	(a0)
	DOS	_PRINT
	addq.l	#4,sp
	rts

L0002ea:
	move.w	d0,-(sp)
	DOS	_PUTCHAR
	move.w	(sp)+,d0
	rts

L0002f2:
	move.l	d0,-(sp)
	move.w	#$000d,-(sp)
	DOS	_PUTCHAR
	move.w	#$000a,(sp)
	DOS	_PUTCHAR
	addq.l	#2,sp
	move.l	(sp)+,d0
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
