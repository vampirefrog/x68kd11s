;=============================================
;  Filename mdxp.r
;  Time Stamp Sat Mar 22 00:00:00 1997
;
;  Base address 000000
;  Exec address 000000
;  Text size    00116c byte(s)
;  Data size    000000 byte(s)
;  Bss  size    000000 byte(s)
;  202 Labels
;  Code Generate date Wed Jan 16 19:07:03 2019
;  Commandline dis  -b2 -h -m68000 --sp -q1 -B -M -p -o120 -gmdxp.lab --overwrite mdxp.r mdxp.s
;          DIS version 3.16
;=============================================

	.include	inc/doscall.mac
	.include	inc/iocscall.mac
	.include	inc/fefunc.mac

	.cpu	68000

	.text

L000000:
	bra.s	L000070

L000002:
	.dc.b	$0d,$0a
	.dc.b	'-=-=-=-=-=-=あ～んえっちぃ～-=-=-=-=-=-=-=-=見ちゃいや～ん！-=-=-=-=-=-=-=-=ってなんだコレ(ｫ-=-=-=-=-=-=-=-='
L000070:
	exg.l	a4,a6
	lea.l	($0010,a0),a0
	lea.l	($162e,a1),a1
	suba.l	a0,a1
	movem.l	a0-a1,-(sp)
	DOS	_SETBLOCK
	addq.w	#8,sp
	pea.l	(L000bc2,pc)
	DOS	_PRINT
	clr.l	(sp)
	DOS	_SUPER
	move.l	d0,(sp)
	bmi.w	L0008ce
	movea.l	($0090),a0
	cmpi.l	#$6d786472,(-$0008,a0)	;'mxdr'
	bne.w	L0008c8
	cmpi.l	#$76323036,(-$0004,a0)	;'v206'
	bcs.w	L0008c2
	tst.b	(a2)+
	beq.w	L0008f8
L0000b6:
	move.b	(a2)+,d6
	cmp.b	#$20,d6			;' '
	bls.s	L0000b6
	cmp.b	#$2d,d6			;'-'
	beq.w	L0005c0
	cmp.b	#$2f,d6			;'/'
	beq.w	L0005c0
	lea.l	(-$0001,a2),a3
	lea.l	(L00116c+$000e2e,pc),a4
L0000d6:
	move.b	(a3)+,(a4)+
	bne.s	L0000d6
	pea.l	(L00116c+$0001d2,pc)
	pea.l	(L00116c+$000e2e,pc)
	DOS	_NAMECK
	pea.l	(L000f2f,pc)
	DOS	_PRINT
	pea.l	(L00116c+$000215,pc)
	DOS	_PRINT
	lea.l	($0010,sp),sp
	lea.l	(L00116c+$000e2e,pc),a0
L0000f8:
	tst.b	(a0)+
	bne.s	L0000f8
	subq.l	#1,a0
	cmpi.b	#$20,(-$0001,a0)	;' '
	bne.s	L00010e
L000106:
	cmpi.b	#$20,-(a0)		;' '
	beq.s	L000106
	addq.l	#1,a0
L00010e:
	cmpi.b	#$2e,(-$0001,a0)	;'.'
	bne.s	L000118
	subq.l	#1,a0
L000118:
	move.l	a0,($1156,a6)
	bra.s	L000160

L00011e:
	.dc.b	$10,$22,$10,$27
L000122:
	move.w	($1154,a6),d0
	cmp.w	#$0002,d0
	bcc.w	L0008da
	movea.l	(L001156,pc),a0
	add.w	d0,d0
	lea.l	(L00011e,pc),a1
	move.w	(a1,d0.w),d0
	lea.l	(a1,d0.w),a1
L000140:
	move.b	(a1)+,(a0)+
	bne.s	L000140
	addq.w	#1,($1154,a6)
	tst.b	($1160,a6)
	bne.s	L000154
	movea.l	a0,a4
	bsr.w	L000826
L000154:
	pea.l	(L00116c+$0001d2,pc)
	pea.l	(L00116c+$000e2e,pc)
	DOS	_NAMECK
	addq.l	#8,sp
L000160:
	clr.w	-(sp)
	pea.l	(L00116c+$000e2e,pc)
	DOS	_OPEN
	addq.l	#6,sp
	move.l	d0,d5
	bmi.s	L000122
	pea.l	(L00116c+$000228,pc)
	DOS	_PRINT
	addq.l	#4,sp
	bsr.w	L0007a2
	andi.l	#$2edfdfdf,($1394,a6)
	cmpi.l	#$2e5a4446,($1394,a6)	;'.ZDF'
	beq.w	L00091c
	move.l	d4,d3
	lea.l	(L00116c+$000a2e,pc),a0
	movea.l	a0,a1
	move.w	#$03ff,d7
	bra.s	L0001ae

L00019c:
	subq.l	#1,d3
	subq.w	#1,d7
L0001a0:
	subq.l	#1,d3
	subq.w	#1,d7
L0001a4:
	move.b	d0,(a0)+
	subq.l	#1,d3
	subq.w	#1,d7
	bmi.w	L0008d4
L0001ae:
	move.w	d5,-(sp)
	DOS	_FGETC
	addq.w	#2,sp
	cmp.b	#$0d,d0
	bne.s	L0001a4
	move.b	d0,(a0)+
	move.w	d5,-(sp)
	DOS	_FGETC
	addq.w	#2,sp
	cmp.b	#$0a,d0
	bne.s	L0001a0
	move.b	d0,(a0)+
	move.w	d5,-(sp)
	DOS	_FGETC
	addq.w	#2,sp
	cmp.b	#$1a,d0
	bne.s	L00019c
	clr.b	(-$0002,a0)
	subq.l	#4,d3
	lea.l	(L00116c+$00122e,pc),a2
	move.w	#$03ff,d7
	bra.s	L0001ee

L0001e6:
	subq.l	#1,d3
	subq.w	#1,d7
	bmi.w	L0008d4
L0001ee:
	move.w	d5,-(sp)
	DOS	_FGETC
	addq.w	#2,sp
	move.b	d0,(a2)+
	bne.s	L0001e6
	suba.l	a1,a0
	move.l	a0,d7
	addq.l	#8,d7
	addq.l	#1,d7
	bclr.l	#$00,d7
	move.l	d3,-(sp)
	add.l	d7,(sp)
	DOS	_MALLOC
	addq.l	#4,sp
	tst.l	d0
	bmi.w	L0008fe
	move.l	d0,($115a,a6)
	bsr.w	L0007e6
	movea.l	($115a,a6),a3
	clr.w	(a3)+
	move.w	#$ffff,(a3)+
	move.w	d7,(a3)+
	move.w	#$0008,(a3)+
	lea.l	(L00116c+$000a2e,pc),a4
L00022e:
	move.b	(a4)+,(a3)+
	bne.s	L00022e
	movea.l	($115a,a6),a3
	move.l	d3,($1168,a6)
	move.l	d3,-(sp)
	pea.l	(a3,d7.l)
	move.w	d5,-(sp)
	DOS	_READ
	lea.l	($000a,sp),sp
	cmp.l	d0,d3
	bne.w	L0008e0
	move.w	d5,-(sp)
	DOS	_CLOSE
	addq.l	#2,sp
	lea.l	(a3,d7.w),a1
	cmpi.l	#$4c5a5820,($0004,a1)	;'LZX '
	bne.s	L00026e
	sf.b	($1166,a6)
	pea.l	(L000f9b,pc)
	DOS	_PRINT
	addq.l	#4,sp
L00026e:
	pea.l	(L001061,pc)
	DOS	_PRINT
	addq.l	#4,sp
	bsr.w	L0007c2
	move.l	d7,d1
	add.l	d3,d1
	move.l	d1,($1150,a6)
L000282:
	tst.b	($239a,a6)
	beq.w	L000498
	pea.l	(L00116c+$0001d2,pc)
	pea.l	(L00116c+$00122e,pc)
	DOS	_NAMECK
	addq.l	#8,sp
	tst.l	d0
	bmi.w	L0008e6
	bsr.w	L0007f6
	pea.l	(L000f59,pc)
	DOS	_PRINT
	pea.l	(L00116c+$00122e,pc)
	DOS	_PRINT
	addq.l	#8,sp
	tst.b	($115f,a6)
	beq.s	L000304
	moveq.l	#$00,d0
	moveq.l	#$00,d7
	movea.l	a4,a1
	tst.b	($0025,a5)
	beq.s	L000304
	lea.l	(-$03d4,a5),a0
	movea.l	(a0),a0
	move.w	($0006,a0),d0
	lea.l	(a0,d0.l),a0
	lea.l	(L00116c+$00122e,pc),a3
	suba.l	a3,a1
	move.l	a1,d7
	subq.l	#5,d7
L0002d8:
	move.b	(a0)+,d0
	move.b	(a3)+,d5
	tst.b	($1161,a6)
	beq.s	L0002ea
	and.b	#$df,d0
	and.b	#$df,d5
L0002ea:
	sub.b	d5,d0
	bne.s	L000304
	dbra.w	d7,L0002d8
	pea.l	(L000fdb,pc)
	DOS	_PRINT
	addq.l	#4,sp
	move.l	(-$03d4,a5),($0010,a5)
	bra.w	L000472

L000304:
	move.w	#$0000,-(sp)
	pea.l	(L00116c+$00122e,pc)
	DOS	_OPEN
	addq.l	#6,sp
	move.l	d0,d5
	bge.w	L0003c0
	bra.s	L000328

L000318:
	sf.b	($115e,a6)
	pea.l	(L00116c+$00022e,pc)
	clr.l	-(sp)
	pea.l	(L00112a,pc)
	bra.s	L000332

L000328:
	pea.l	(L00116c+$00022e,pc)
	clr.l	-(sp)
	pea.l	(L00112e,pc)
L000332:
	DOS	_VERNUM
	cmp.w	#$0300,d0
	bcs.s	L00033e
	DOS	_GETENV
	bra.s	L000340

L00033e:
	DOS	_GETENV
L000340:
	lea.l	($000c,sp),sp
	tst.l	d0
	bmi.s	L0003b4
	lea.l	(L00116c+$00022e,pc),a0
	lea.l	(L00116c+$000e2e,pc),a3
L000350:
	movea.l	a3,a1
	lea.l	(L00116c+$00122e,pc),a2
L000356:
	move.b	(a0)+,d7
	beq.s	L00036a
	cmp.b	#$3b,d7			;';'
	beq.s	L00036a
	cmp.b	#$2c,d7			;','
	beq.s	L00036a
	move.b	d7,(a1)+
	bra.s	L000356

L00036a:
	cmpi.b	#$5c,(-$0002,a0)	;'\'
	beq.s	L00037e
	cmpi.b	#$2f,(-$0002,a0)	;'/'
	beq.s	L00037e
	move.b	#$5c,(a1)+		;'\'
L00037e:
	move.b	(a2)+,(a1)+
	bne.s	L00037e
	cmpi.b	#$3a,($0001,a3)		;':'
	bne.s	L0003a2
	moveq.l	#$00,d5
	move.b	(a3),d5
	and.b	#$1f,d5
	move.w	d5,-(sp)
	DOS	_DRVCTRL
	addq.l	#2,sp
	eori.b	#$02,d0
	and.b	#$0a,d0
	bne.s	L0003ae
L0003a2:
	clr.w	-(sp)
	pea.l	(a3)
	DOS	_OPEN
	addq.l	#6,sp
	move.l	d0,d5
	bge.s	L0003c0
L0003ae:
	tst.b	(-$0001,a0)
	bne.s	L000350
L0003b4:
	tst.b	($115e,a6)
	bne.w	L000318
	bra.w	L000488

L0003c0:
	bsr.w	L0007a2
	lea.l	(L00116c+$00122e,pc),a3
	suba.l	a3,a4
	move.l	a4,d3
	addq.l	#8,d3
	addq.l	#1,d3
	bclr.l	#$00,d3
	move.l	d4,d2
	add.l	d3,d2
	move.l	($0018,a5),d0
	cmp.l	d2,d0
	bge.s	L0003ec
	pea.l	(L000fb9,pc)
	DOS	_PRINT
	addq.l	#4,sp
	bra.w	L000498

L0003ec:
	movea.l	(-$03d4,a5),a2
	move.l	a2,($0010,a5)
	clr.l	(a2)
	move.w	d3,($0004,a2)
	move.w	#$0008,($0006,a2)
	lea.l	($0008,a2),a1
	lea.l	(L00116c+$00122e,pc),a0
L000408:
	move.b	(a0)+,(a1)+
	bne.s	L000408
	move.l	d4,-(sp)
	pea.l	(a2,d3.l)
	move.w	d5,-(sp)
	DOS	_READ
	lea.l	($000a,sp),sp
	move.l	d0,d7
	move.w	d5,-(sp)
	DOS	_CLOSE
	addq.l	#2,sp
	cmp.l	d4,d7
	bne.s	L000488
	lea.l	(a2,d3.l),a0
	movea.l	a0,a1
	cmpi.l	#$4c5a5820,($0004,a0)	;'LZX '
	bne.s	L000472
	pea.l	(L000f9b,pc)
	DOS	_PRINT
	addq.l	#4,sp
	movem.l	a5-a6,-(sp)
	lea.l	(L00046a,pc),a4
	adda.l	d4,a1
	add.l	($0022,a0),d4
	cmp.l	($0018,a5),d4
	bcc.s	L000490
	move.l	($0010,a5),d4
	add.l	($0018,a5),d4
	move.l	d4,($0004,a0)
	move.l	a0,($0008,a0)
	bsr.w	L00083a
	jmp	($0002,a0)

L00046a:
	.dc.b	'Lﾟ`',$00
L00046e:
	.dc.b	$61,$00,$03,$e8
L000472:
	st.b	($0025,a5)
	movea.l	($115a,a6),a2
	move.w	#$0000,($0002,a2)
	move.w	#$0000,($1164,a6)
	bra.s	L000490

L000488:
	pea.l	(L000f83,pc)
	DOS	_PRINT
	addq.l	#4,sp
L000490:
	pea.l	(L001061,pc)
	DOS	_PRINT
	addq.l	#4,sp
L000498:
	movea.l	($115a,a6),a1
	move.l	($1150,a6),d1
	moveq.l	#$02,d0
	trap	#4
	tst.l	d0
	bmi.w	L0008ec
	movea.l	($0090),a2
	move.l	(-$0010,a2),d2
	cmp.l	#$4c5a4d58,d2		;'LZMX'
	beq.s	L000500
	tst.b	($1166,a6)
	bne.s	L000500
	moveq.l	#$00,d7
	lea.l	(L0004fc,pc),a4
	movea.l	(-$03d8,a5),a0
	move.w	($0004,a0),d7
	adda.l	d7,a0
	move.l	($1168,a6),d5
	movea.l	a0,a1
	adda.l	d5,a1
	add.l	($0022,a0),d5
	cmp.l	($0014,a5),d5
	bcc.w	L0008f2
	move.l	($000c,a5),d6
	add.l	($0014,a5),d6
	move.l	d6,($0004,a0)
	move.l	a0,($0008,a0)
	bsr.w	L00083a
	jmp	($0002,a0)

L0004fc:
	.dc.b	$61,$00,$03,$5a
L000500:
	move.w	(L001164,pc),d1
	or.w	(L001162,pc),d1
	moveq.l	#$0f,d0
	trap	#4
L00050c:
	moveq.l	#$00,d2
	move.w	#$ff00,d1
	tst.b	($239a,a6)
	beq.s	L000536
	move.w	#$fe00,d1
	movea.l	($000c,a5),a2
	move.w	($0004,a2),d2
	lea.l	(a2,d2.l),a2
	adda.w	($0002,a2),a2
	cmpi.b	#$e8,(a2)
	bne.s	L000536
	move.w	#$0000,d1
L000536:
	moveq.l	#$f0,d2
L000538:
	nop
	move.w	(-$0406,a5),d4
	cmp.w	#$01ff,d4
	bne.s	L00054a
	nop
	dbra.w	d2,L000538
L00054a:
	not.w	d4
	tst.b	($239a,a6)
	bne.s	L00055a
	tst.b	d4
	beq.s	L00055a
	move.w	d4,d1
	bra.s	L000570

L00055a:
	or.w	d4,d1
	move.w	(-$03f2,a5),d4
	not.w	d4
	and.w	d4,d1
	or.w	(-$03f0,a5),d1
	or.w	(L001162,pc),d1
	or.w	(L001164,pc),d1
L000570:
	lea.l	(L001113,pc),a3
	moveq.l	#$0f,d0
L000576:
	btst.l	d0,d1
	beq.s	L00058e
	cmp.b	#$08,d0
	bcc.s	L000588
	move.b	#$20,(a3,d0.w)		;' '
	bra.s	L00058e

L000588:
	move.b	#$20,($01,a3,d0.w)	;' '
L00058e:
	dbra.w	d0,L000576
	pea.l	(L001102,pc)
	DOS	_PRINT
	addq.l	#4,sp
	pea.l	(L001061,pc)
	DOS	_PRINT
	addq.l	#4,sp
	move.l	($115a,a6),-(sp)
	DOS	_MFREE
	addq.l	#4,sp
	move.w	#$0000,-(sp)
	DOS	_EXIT2

L0005b0:
	.dc.b	'[鳴沢唯]燃え燃え'
L0005c0:
	move.b	(a2)+,d6
	cmp.b	#$3f,d6			;'?'
	beq.w	L0008f8
	and.b	#$df,d6
	cmp.b	#$50,d6			;'P'
	beq.w	L0006a6
	cmp.b	#$4d,d6			;'M'
	beq.w	L0006a2
	cmp.b	#$4c,d6			;'L'
	beq.w	L00068a
	cmp.b	#$55,d6			;'U'
	beq.w	L000692
	cmp.b	#$49,d6			;'I'
	beq.w	L00069a
	cmp.b	#$45,d6			;'E'
	beq.s	L00065c
	cmp.b	#$53,d6			;'S'
	beq.s	L000654
	cmp.b	#$43,d6			;'C'
	beq.s	L000638
	cmp.b	#$46,d6			;'F'
	beq.s	L00064a
	cmp.b	#$48,d6			;'H'
	beq.w	L0008f8
	cmp.b	#$54,d6			;'T'
	bne.w	L0008b6
	pea.l	(L0010d5,pc)
	bra.s	L00066a

L000624:
	pea.l	(L0010c2,pc)
	bra.s	L00066a

L00062a:
	ror.w	#8,d0
	tst.b	d0
	beq.s	L000624
	pea.l	(L0010a2,pc)
	moveq.l	#$04,d0
	bra.s	L000668

L000638:
	moveq.l	#$12,d0
	trap	#4
	ror.w	#8,d0
	tst.b	d0
	beq.s	L00062a
	pea.l	(L001091,pc)
	moveq.l	#$07,d0
	bra.s	L000668

L00064a:
	pea.l	(L00106d,pc)
	moveq.l	#$0c,d0
	moveq.l	#$1e,d1
	bra.s	L000668

L000654:
	pea.l	(L001078,pc)
	moveq.l	#$06,d0
	bra.s	L000662

L00065c:
	pea.l	(L001085,pc)
	moveq.l	#$05,d0
L000662:
	move.w	#$ffff,($1162,a6)
L000668:
	trap	#4
L00066a:
	pea.l	(L001021,pc)
	DOS	_PRINT
	pea.l	(L001064,pc)
	DOS	_PRINT
	addq.l	#8,sp
	DOS	_PRINT
	pea.l	(L001069,pc)
	DOS	_PRINT
	addq.l	#8,sp
	bsr.w	L000732
	bra.w	L00050c

L00068a:
	sf.b	($115f,a6)
	bra.w	L0000b6

L000692:
	sf.b	($1160,a6)
	bra.w	L0000b6

L00069a:
	sf.b	($1161,a6)
	bra.w	L0000b6

L0006a2:
	moveq.l	#$00,d1
	bra.s	L0006a8

L0006a6:
	moveq.l	#$ff,d1
L0006a8:
	move.b	(a2),d6
	bne.s	L0006b0
	moveq.l	#$00,d1
	bra.s	L000704

L0006b0:
	cmpi.b	#$20,d6			;' '
	bls.w	L0000b6
L0006b8:
	move.b	(a2),d6
	beq.s	L000704
	and.b	#$df,d6
	cmp.b	#$20,d6			;' '
	bls.s	L0006fc
	cmp.b	#$50,d6			;'P'
	bge.s	L0006e8
	cmp.b	#$41,d6			;'A'
	bcs.w	L0008bc
	cmp.b	#$49,d6			;'I'
	bcc.w	L0008bc
	and.w	#$000f,d6
	subq.b	#1,d6
	bchg.l	d6,d1
	addq.w	#1,a2
	bra.s	L0006b8

L0006e8:
	cmp.b	#$58,d6			;'X'
	bcc.w	L0008bc
	and.w	#$000f,d6
	addq.w	#8,d6
	bchg.l	d6,d1
	addq.w	#1,a2
	bra.s	L0006b8

L0006fc:
	move.w	d1,($1162,a6)
	bra.w	L0000b6

L000704:
	bsr.s	L000716
	or.w	d2,d1
	move.w	d1,($1162,a6)
	moveq.l	#$0e,d0
	pea.l	(L0010ed,pc)
	bra.w	L000668

L000716:
	bsr.w	L0007ea
	move.w	#$ff00,d2
	tst.b	($0024,a5)
	beq.s	L000730
	movea.l	(-$03d8,a5),a3
	tst.w	($0002,a3)
	bmi.s	L000730
	moveq.l	#$00,d2
L000730:
	rts

L000732:
	movem.l	d0-d1/a0,-(sp)
	moveq.l	#$00,d1
	pea.l	(L000f44,pc)
	DOS	_PRINT
	moveq.l	#$08,d0
	trap	#4
	tst.l	d0
	beq.s	L000750
	movea.l	d0,a0
	tst.b	(a0)
	beq.s	L000750
	move.l	d0,-(sp)
	bra.s	L000754

L000750:
	pea.l	(L001036,pc)
L000754:
	DOS	_PRINT
	pea.l	(L001061,pc)
	DOS	_PRINT
	lea.l	($000c,sp),sp
	pea.l	(L000f6e,pc)
	DOS	_PRINT
	moveq.l	#$09,d0
	trap	#4
	tst.l	d0
	beq.s	L000784
	movea.l	d0,a0
	tst.b	(a0)
	beq.s	L000784
	move.w	#$0000,($1164,a6)
	move.b	#$40,($239a,a6)		;'@'
	move.l	d0,-(sp)
	bra.s	L00078e

L000784:
	move.b	#$00,($239a,a6)
	pea.l	(L00104e,pc)
L00078e:
	DOS	_PRINT
	pea.l	(L001061,pc)
	DOS	_PRINT
	lea.l	($000c,sp),sp
	bsr.s	L0007ea
	movem.l	(sp)+,d0-d1/a0
	rts

L0007a2:
	move.w	#$0002,-(sp)
	clr.l	-(sp)
	move.w	d5,-(sp)
	DOS	_SEEK
	addq.l	#8,sp
	move.l	d0,d4
	clr.w	-(sp)
	clr.l	-(sp)
	move.w	d5,-(sp)
	DOS	_SEEK
	addq.l	#8,sp
	tst.l	d4
	beq.w	L0008b0
	rts

L0007c2:
	pea.l	(L000f44,pc)
	DOS	_PRINT
	tst.b	($1b9a,a6)
	beq.s	L0007d4
	pea.l	(L00116c+$000a2e,pc)
	bra.s	L0007d8

L0007d4:
	pea.l	(L001036,pc)
L0007d8:
	DOS	_PRINT
	pea.l	(L001061,pc)
	DOS	_PRINT
	lea.l	($000c,sp),sp
	rts

L0007e6:
	moveq.l	#$05,d0
	trap	#4
L0007ea:
	moveq.l	#$10,d0
	trap	#4
	movea.l	d0,a5
	lea.l	($03d0,a5),a5
	rts

L0007f6:
	lea.l	(L00116c+$000229,pc),a2
	lea.l	(L00116c+$000215,pc),a3
	lea.l	(L00116c+$00122e,pc),a4
L000802:
	move.b	(a3)+,(a4)+
	bne.s	L000802
	subq.l	#1,a4
	tst.b	(a2)
	beq.s	L000816
	lea.l	(-$0001,a2),a3
L000810:
	move.b	(a3)+,(a4)+
	bne.s	L000810
	bra.s	L00081e

L000816:
	lea.l	(L00114a,pc),a2
L00081a:
	move.b	(a2)+,(a4)+
	bne.s	L00081a
L00081e:
	tst.b	($1160,a6)
	beq.s	L000826
	rts

L000826:
	andi.b	#$df,(-$0004,a4)
	andi.b	#$df,(-$0003,a4)
	andi.b	#$df,(-$0002,a4)
	rts

L00083a:
	cmpi.b	#$03,($0cbc)
	bcs.s	L000856
	movem.l	d0-d2,-(sp)
	moveq.l	#$00,d2
	moveq.l	#$04,d1
	moveq.l	#$ac,d0
	trap	#15
	move.l	d0,($133a,a6)
	movem.l	(sp)+,d0-d2
L000856:
	rts

L000858:
	.dc.b	$0c,$38,$00,$03,$0c,$bc,$65,$12
	.dc.b	$48,$e7,$e0,$00,$24,$2e,$13,$3a
	.dc.b	$72,$04,$70,$ac,$4e,$4f,$4c,$df
	.dc.b	$00,$07,$4e,$75
L000874:
	pea.l	($0000)
	DOS	_MFREE
	addq.l	#4,sp
	rts

L00087e:
	bsr.s	L000874
	pea.l	(L000e69,pc)
	bra.w	L00090a

L000888:
	bsr.s	L000874
	pea.l	(L000eab,pc)
	bra.s	L00090a

L000890:
	bsr.s	L000874
	pea.l	(L000ecc,pc)
	bra.s	L00090a

L000898:
	bsr.s	L000874
	pea.l	(L000eed,pc)
	bra.s	L00090a

L0008a0:
	bsr.s	L000874
	pea.l	(L000e8a,pc)
	bra.s	L00090a

L0008a8:
	bsr.s	L000874
	pea.l	(L000f0e,pc)
	bra.s	L00090a

L0008b0:
	pea.l	(L000da4,pc)
	bra.s	L000902

L0008b6:
	pea.l	(L000e48,pc)
	bra.s	L00090a

L0008bc:
	pea.l	(L000e27,pc)
	bra.s	L00090a

L0008c2:
	pea.l	(L000cfe,pc)
	bra.s	L00090a

L0008c8:
	pea.l	(L000cdd,pc)
	bra.s	L00090a

L0008ce:
	pea.l	(L000cbc,pc)
	bra.s	L00090a

L0008d4:
	pea.l	(L000d62,pc)
	bra.s	L000902

L0008da:
	pea.l	(L000d20,pc)
	bra.s	L000902

L0008e0:
	pea.l	(L000d41,pc)
	bra.s	L000902

L0008e6:
	pea.l	(L000dc4,pc)
	bra.s	L00090a

L0008ec:
	pea.l	(L000de5,pc)
	bra.s	L00090a

L0008f2:
	pea.l	(L000e06,pc)
	bra.s	L000902

L0008f8:
	pea.l	(L000bff,pc)
	bra.s	L000912

L0008fe:
	pea.l	(L000d83,pc)
L000902:
	pea.l	(L001061,pc)
	DOS	_PRINT
	addq.l	#4,sp
L00090a:
	pea.l	(L00100b,pc)
	DOS	_PRINT
	addq.l	#4,sp
L000912:
	DOS	_PRINT
	addq.l	#4,sp
	move.w	#$ffff,-(sp)
	DOS	_EXIT2

L00091c:
	pea.l	(L000ff3,pc)
	DOS	_PRINT
	pea.l	(L001061,pc)
	DOS	_PRINT
	addq.l	#8,sp
	move.l	d4,-(sp)
	DOS	_MALLOC
	addq.l	#4,sp
	tst.l	d0
	bmi.w	L00087e
	move.l	d0,($0bba,a6)
	move.l	d4,-(sp)
	move.l	d0,-(sp)
	move.w	d5,-(sp)
	DOS	_READ
	lea.l	($000a,sp),sp
	cmp.l	d0,d4
	bne.s	L0008e0
	move.w	d5,-(sp)
	DOS	_CLOSE
	addq.l	#2,sp
	bsr.w	L000a5c
	move.l	(L00116c+$000004,pc),d0
	movea.l	(L00116c,pc),a4
	lea.l	(L00116c+$000a2e,pc),a0
	move.l	d0,d1
	movea.l	a0,a1
	movea.l	(-$03d4,a5),a2
	bra.s	L00096e

L00096a:
	move.b	d7,(a0)+
	subq.l	#1,d0
L00096e:
	move.b	(a4)+,d7
	cmp.b	#$0d,d7
	bne.s	L00096a
	move.b	(a4)+,d7
	cmp.b	#$0a,d7
	bne.s	L00096a
	move.b	(a4)+,d7
	cmp.b	#$1a,d7
	bne.s	L00096a
	clr.b	(a0)+
	subq.l	#4,d0
	lea.l	(L00116c+$00122e,pc),a3
	bra.s	L000992

L000990:
	subq.l	#1,d0
L000992:
	move.b	(a4)+,d6
	move.b	d6,(a3)+
	bne.s	L000990
	move.l	d0,($1150,a6)
	suba.l	a1,a0
	move.l	a0,d7
	addq.l	#8,d7
	addq.l	#1,d7
	bclr.l	#$00,d7
	add.l	d7,($1150,a6)
	move.l	d0,d1
	move.l	d0,-(sp)
	add.l	d7,(sp)
	DOS	_MALLOC
	addq.l	#4,sp
	tst.l	d0
	bmi.w	L00087e
	move.l	d0,($115a,a6)
	movea.l	d0,a3
	lea.l	(L00116c+$000a2e,pc),a0
	lea.l	($0008,a3),a1
L0009ca:
	move.b	(a0)+,(a1)+
	bne.s	L0009ca
	lea.l	(a3,d7.l),a3
L0009d2:
	move.b	(a4)+,(a3)+
	subq.l	#1,d1
	bne.s	L0009d2
	movea.l	d0,a4
	clr.w	(a4)
	tst.l	($0bbe,a6)
	bne.s	L0009ea
	move.w	#$ffff,($0002,a4)
	bra.s	L0009f0

L0009ea:
	move.w	#$0000,($0002,a4)
L0009f0:
	move.w	d7,($0004,a4)
	move.w	#$0008,($0006,a4)
	move.l	(L00116c,pc),-(sp)
	DOS	_MFREE
	addq.l	#4,sp
	bsr.w	L0007c2
	tst.b	($239a,a6)
	beq.w	L000498
	tst.b	($115f,a6)
	beq.w	L000282
	tst.l	($0bbe,a6)
	beq.w	L000282
	pea.l	(L00116c+$0001d2,pc)
	pea.l	(L00116c+$00122e,pc)
	DOS	_NAMECK
	addq.l	#8,sp
	tst.l	d0
	bmi.w	L0008e6
	bsr.w	L0007f6
	movea.l	(-$03d4,a5),a2
	addq.l	#8,a2
	lea.l	(L00116c+$00122e,pc),a3
L000a3e:
	move.b	(a3)+,(a2)+
	bne.s	L000a3e
	pea.l	(L000f6e,pc)
	DOS	_PRINT
	pea.l	(L00116c+$00122e,pc)
	DOS	_PRINT
	pea.l	(L000ff3,pc)
	DOS	_PRINT
	lea.l	($000c,sp),sp
	bra.w	L000472

L000a5c:
	movea.l	(L000bba,pc),a0
	cmpi.l	#$5a444630,(a0)		;'ZDF0'
	bne.w	L000888
	cmpi.w	#$0d0a,($0004,a0)
	bne.w	L000888
	moveq.l	#$01,d2
	lea.l	(L001134,pc),a0
	bra.s	L000a80

L000a7c:
	lea.l	(L00113a,pc),a0
L000a80:
	lea.l	(L00116c+$00004e,pc),a1
L000a84:
	move.b	(a0)+,(a1)+
	bne.s	L000a84
	clr.l	-(sp)
	pea.l	(L00116c+$0000ce,pc)
	pea.l	(L00116c+$00004e,pc)
	move.w	#$0002,-(sp)
	DOS	_EXEC
	lea.l	($000e,sp),sp
	tst.l	d0
	bpl.s	L000aa8
	dbra.w	d2,L000a7c
	bra.w	L000890

L000aa8:
	pea.l	(-$0001)
	DOS	_MALLOC
	and.l	#$00fffff0,d0
	beq.w	L000890
	move.l	d0,d1
	move.l	d0,(sp)
	DOS	_MALLOC
	addq.l	#4,sp
	tst.l	d0
	bmi.w	L000890
	movea.l	d0,a4
	add.l	d0,d1
	move.l	d1,-(sp)
	move.l	d0,-(sp)
	pea.l	(L00116c+$00004e,pc)
	move.b	#$01,(sp)
	move.w	#$0003,-(sp)
	DOS	_EXEC
	lea.l	($000e,sp),sp
	tst.l	d0
	bmi.w	L000890
	cmpi.l	#$4c7a7a52,($0008,a4)	;'LzzR'
	bne.w	L000898
	move.l	($0004,a4),-(sp)
	pea.l	(a4)
	DOS	_SETBLOCK
	addq.l	#8,sp
	pea.l	(L00116c+$000008,pc)
	move.l	(L000bba,pc),-(sp)
	jsr	($000c,a4)
	addq.l	#8,sp
	tst.l	d0
	bmi.w	L000888
	lea.l	(L00116c+$000008,pc),a1
	cmpi.w	#$0001,($0002,a1)
	bne.w	L0008a0
	move.l	($0008,a1),d0
	move.l	d0,($1170,a6)
	move.l	d0,-(sp)
	DOS	_MALLOC
	addq.l	#4,sp
	tst.l	d0
	bmi.w	L00087e
	move.l	d0,($116c,a6)
	move.l	d0,-(sp)
	move.l	($0004,a1),-(sp)
	jsr	($0010,a4)
	addq.l	#8,sp
	tst.l	d0
	bmi.w	L0008a8
	bsr.w	L0007e6
	cmpi.w	#$0001,(a1)
	beq.s	L000bac
	lea.l	($000a,a1),a1
	cmpi.w	#$0021,($0002,a1)	;'!'
	bne.s	L000bac
	tst.b	($115f,a6)
	beq.s	L000bac
	move.l	($0008,a1),d0
	add.l	#$0000020a,d0
	move.l	d0,($0bbe,a6)
	cmp.l	($0018,a5),d0
	bcc.s	L000bac
	movea.l	(-$03d4,a5),a2
	move.l	a2,($0010,a5)
	clr.l	(a2)
	move.w	#$020a,($0004,a2)
	move.w	#$0008,($0006,a2)
	move.w	#$0000,($0008,a2)
	pea.l	(a2)
	addi.l	#$0000020a,(sp)
	move.l	($0004,a1),-(sp)
	jsr	($0010,a4)
	addq.l	#8,sp
	tst.l	d0
	bmi.w	L00087e
L000bac:
	move.l	(L000bba,pc),-(sp)
	DOS	_MFREE
	pea.l	(a4)
	DOS	_MFREE
	addq.l	#8,sp
	rts

L000bba:
	.dc.l	$00000000
L000bc2:
	.dc.b	'MuSic Player For Mxdrv  Ver0.09c  97/03/21  byあすかにゃん',$0d,$0a,$00
L000bff:
	.dc.b	'Usage : mdxp.x  [Switch]  <FileName.mdx|.zdf>',$0d,$0a
	.dc.b	'Switch: -Yui',$09,'Yui@Narusawa',$0d,$0a
	.dc.b	$09,'-M',$09,'Mask Track',$0d,$0a
	.dc.b	$09,'-P',$09,'Play',$0d,$0a
	.dc.b	$09,'-S',$09,'Stop',$0d,$0a
	.dc.b	$09,'-E',$09,'End',$0d,$0a
	.dc.b	$09,'-C',$09,'Continue',$0d,$0a
	.dc.b	$09,'-F',$09,'Fade Out',$0d,$0a
	.dc.b	$09,'-T',$09,'Title Display',$0d,$0a
	.dc.b	$09,'-L',$09,'Force Pdx Load',$0d,$0a
	.dc.b	$0d,$0a,$00
L000cbc:
	.dc.b	'やばいエラ～が発生したぞ！！',$0d,$0a
	.dc.b	$0d,$0a,$00
L000cdd:
	.dc.b	'mxdrv が常駐してないにゃ～？',$0d,$0a
	.dc.b	$0d,$0a,$00
L000cfe:
	.dc.b	'mxdrvのバ～ジョンが低いよね？',$0d,$0a
	.dc.b	$0d,$0a,$00
L000d20:
	.dc.b	'ふぁいるお～ぷんしっぱい！！',$0d,$0a
	.dc.b	$0d,$0a,$00
L000d41:
	.dc.b	'ふぁいるの読み込みしっぱい！',$0d,$0a
	.dc.b	$0d,$0a,$00
L000d62:
	.dc.b	'ﾁｮｯﾄ感じ悪すぎなふぁいるにゃ',$0d,$0a
	.dc.b	$0d,$0a,$00
L000d83:
	.dc.b	'めもり～が確保できなかった！',$0d,$0a
	.dc.b	$0d,$0a,$00
L000da4:
	.dc.b	'ファイルのサイズがヘンだよ!',$0d,$0a
	.dc.b	$0d,$0a,$00
L000dc4:
	.dc.b	'ふぁいるね～む展開しっぱい！',$0d,$0a
	.dc.b	$0d,$0a,$00
L000de5:
	.dc.b	'mmlバッファが足りないにゃぁ!',$0d,$0a
	.dc.b	$0d,$0a,$00
L000e06:
	.dc.b	'ﾃﾞｰﾀﾊﾞｯﾌｧ不足で展開不可にゃ!',$0d,$0a
	.dc.b	$0d,$0a,$00
L000e27:
	.dc.b	'とらっくますく指定がお菓子い',$0d,$0a
	.dc.b	$0d,$0a,$00
L000e48:
	.dc.b	'スイッチの指定がおかしいにゃ',$0d,$0a
	.dc.b	$0d,$0a,$00
L000e69:
	.dc.b	'展開用メモリが確保できにゃい',$0d,$0a
	.dc.b	$0d,$0a,$00
L000e8a:
	.dc.b	'しくしくしく･･未対応ﾃﾞｰﾀなの',$0d,$0a
	.dc.b	$0d,$0a,$00
L000eab:
	.dc.b	'これZDFﾌｧｲﾙじゃない････ﾐﾀｲﾅｰ',$0d,$0a
	.dc.b	$0d,$0a,$00
L000ecc:
	.dc.b	'LZZ.rかLZM.rが見つからない!!',$0d,$0a
	.dc.b	$0d,$0a,$00
L000eed:
	.dc.b	'LZZ.rのﾊﾞｰｼﾞｮﾝ違うか異常にゃ',$0d,$0a
	.dc.b	$0d,$0a,$00
L000f0e:
	.dc.b	'デ～タ展開に失敗したみたい･･',$0d,$0a
	.dc.b	$0d,$0a,$00
L000f2f:
	.dc.b	$1b,'[31m::  MML  :: ',$1b,'[m',$00
L000f44:
	.dc.b	$1b,'[31m:: Title :: ',$1b,'[m',$00
L000f59:
	.dc.b	$1b,'[31m::(AD)PCM:: ',$1b,'[m',$00
L000f6e:
	.dc.b	$1b,'[31m::PdxName:: ',$1b,'[m',$00
L000f83:
	.dc.b	$1b,'[36m ....Read err!!',$1b,'[m',$00
L000f9b:
	.dc.b	$1b,'[31m ...LZX Compressed !!',$1b,'[m',$00
L000fb9:
	.dc.b	$1b,'[36m ...Not Enough Buffer!!',$1b,'[m',$0d,$0a,$00
L000fdb:
	.dc.b	$1b,'[31m ....on Buffer!',$1b,'[m',$00
L000ff3:
	.dc.b	$1b,'[31m ...in Archive!',$1b,'[m',$00
L00100b:
	.dc.b	$1b,'[36m::Caution!:: ',$1b,'[m',$00
L001021:
	.dc.b	$1b,'[32m:: Func. :: ',$1b,'[m',$00
L001036:
	.dc.b	$1b,'[37m(No Title-Data)',$1b,'[m',$00
L00104e:
	.dc.b	$1b,'[37m(Not Used)',$1b,'[m',$00
L001061:
	.dc.b	$0d,$0a,$00
L001064:
	.dc.b	$1b,'[1m',$00
L001069:
	.dc.b	$1b,'[m',$00
L00106d:
	.dc.b	'Fade Out',$0d,$0a,$00
L001078:
	.dc.b	'Stop MuSic',$0d,$0a,$00
L001085:
	.dc.b	'End MuSic',$0d,$0a,$00
L001091:
	.dc.b	'Continue MuSic',$0d,$0a,$00
L0010a2:
	.dc.b	'Restart ...Couldn',$27,'t Continue!',$0d,$0a,$00
L0010c2:
	.dc.b	'On Playing Now??',$0d,$0a,$00
L0010d5:
	.dc.b	'Information Display!!',$0d,$0a,$00
L0010ed:
	.dc.b	'Track Mask Change!',$0d,$0a,$00
L001102:
	.dc.b	$1b,'[31m:: Track :: '
L001113:
	.dc.b	'ABCDEFGH PQRSTUVW',$1b,'[m',$0d,$0a,$00
L00112a:
	.dc.b	'mxp',$00
L00112e:
	.dc.b	'mdxp',$00,$00
L001134:
	.dc.b	'lzz.r',$00
L00113a:
	.dc.b	'lzm.r',$00
L001140:
	.dc.b	'.mdx',$00
L001145:
	.dc.b	'.zdf',$00
L00114a:
	.dc.b	'.pdx',$00,$00,$00,$00,$00,$00,$00,$00
L001156:
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$ff,$ff,$ff,$ff
L001162:
	.dc.w	$0000
L001164:
	.dc.w	$ff00,$ffff,$0000,$0000
L00116c:

	.end	L000000
