;=============================================
;  Filename drive.x
;
;
;  Base address 000000
;  Exec address 000000
;  Text size    000786 byte(s)
;  Data size    0005bc byte(s)
;  Bss  size    0006ea byte(s)
;  144 Labels
;
;  Commandline dis  -b2 -h -m68000 --sp -q1 -B -M -o120 -gdrive.lab --overwrite drive.x drive.s
;          DIS version 3.16
;=============================================

	.include	inc/doscall.mac
	.include	inc/iocscall.mac
	.include	inc/fefunc.mac

	.cpu	68000

	.text

Start:
	lea.l	(L00142a),sp
	clr.b	(L001022)
	clr.b	(L001023)
	DOS	_VERNUM
	cmp.w	#$0332,d0
	bcc.w	L00056e
	movea.l	(Start-$0000e0),a0
	addq.l	#1,a0
	lea.l	(L000d46),a1
	lea.l	(L000e5e),a2
	bsr.w	L000616
	move.l	d0,(L000d42)
	lea.l	(L000e5e),a0
L000040:
	tst.b	(a0)
	beq.s	L000078
	bsr.w	L0006d0
L000048:
	move.b	(a0)+,d0
	beq.s	L000040
	cmp.b	#$64,d0			;'d'
	beq.s	L000064
	cmp.b	#$76,d0			;'v'
	bne.w	L00053a
	move.b	#-$01,(L001023)
	bra.s	L000048

L000064:
	tst.l	(L000d42)
	bne.w	L00053a
	move.b	#-$01,(L001022)
	bra.s	L000048

L000078:
	DOS	_CURDRV
	move.w	d0,-(sp)
	DOS	_CHGDRV
	addq.l	#2,sp
	move.w	d0,d4
	clr.l	d5
	move.l	(L000d42),d0
	bne.s	L0000cc
	tst.b	(L001022)
	beq.w	L0001d0
	DOS	_VERNUM
	cmp.w	#$0162,d0
	bcs.w	L00053a
	DOS	_CURDRV
	move.w	d0,d2
	move.w	#$ffff,-(sp)
	move.w	#$ffff,-(sp)
	DOS	_DRVXCHG
	addq.l	#4,sp
	move.w	d0,d1
	tst.l	d0
	bmi.w	L00053a
	pea.l	(L0009eb)
	DOS	_PRINT
	addq.l	#4,sp
	cmp.w	d1,d2
	beq.w	L0001d0
	bra.w	L000198

L0000cc:
	cmp.l	#$00000002,d0
	bhi.w	L00053a
	lea.l	(L000d46),a0
	cmpi.b	#$3a,($0001,a0)		;':'
	bne.w	L00053a
	tst.b	($0002,a0)
	bne.w	L00053a
	move.b	(a0),d0
	or.b	#$20,d0
	sub.b	#$61,d0			;'a'
	move.b	d0,d2
	cmp.w	d4,d0
	bhi.w	L00052a
	and.l	#$000000ff,d2
	cmpi.l	#$00000001,(L000d42)
	beq.w	L0001d2
L000114:
	tst.b	(a0)+
	bne.s	L000114
	cmpi.b	#$3a,($0001,a0)		;':'
	bne.w	L00053a
	tst.b	($0002,a0)
	bne.w	L00053a
	move.b	(a0),d0
	or.b	#$20,d0
	sub.b	#$61,d0			;'a'
	move.b	d0,d1
	cmp.w	d4,d0
	bhi.w	L00052a
	and.l	#$000000ff,d1
	cmp.w	d1,d2
	beq.w	L00052a
	move.w	d1,-(sp)
	addq.w	#1,(sp)
	move.w	d2,-(sp)
	addq.w	#1,(sp)
	DOS	_DRVXCHG
	addq.l	#4,sp
	DOS	_FFLUSH
	pea.l	(L0009a2)
	DOS	_PRINT
	addq.l	#4,sp
	move.w	d2,-(sp)
	addi.w	#$0041,(sp)
	DOS	_PUTCHAR
	addq.l	#2,sp
	pea.l	(L00099f)
	DOS	_PRINT
	addq.l	#4,sp
	move.w	d1,-(sp)
	addi.w	#$0041,(sp)
	DOS	_PUTCHAR
	addq.l	#2,sp
	pea.l	(L0009ac)
	DOS	_PRINT
	addq.l	#4,sp
	DOS	_CURDRV
	cmp.w	d2,d0
	beq.s	L000198
	cmp.w	d1,d0
	bne.s	L0001d0
	move.w	d1,d0
	move.w	d2,d1
	move.w	d0,d2
L000198:
	move.w	d1,-(sp)
	DOS	_CHGDRV
	addq.l	#2,sp
	pea.l	(L0009c0)
	DOS	_PRINT
	addq.l	#4,sp
	move.w	d2,-(sp)
	addi.w	#$0041,(sp)
	DOS	_PUTCHAR
	addq.l	#2,sp
	pea.l	(L0009ca)
	DOS	_PRINT
	addq.l	#4,sp
	move.w	d1,-(sp)
	addi.w	#$0041,(sp)
	DOS	_PUTCHAR
	addq.l	#2,sp
	pea.l	(L0009d7)
	DOS	_PRINT
	addq.l	#4,sp
L0001d0:
	clr.w	d2
L0001d2:
	move.w	d2,d0
	addq.w	#1,d2
	cmp.w	d4,d2
	bhi.w	L0004f8
	lea.l	(L000b59),a0
	bsr.w	L00075c
	tst.l	d0
	bne.s	L000228
	pea.l	(L000f76)
	move.w	d2,-(sp)
	DOS	_GETDPB
	addq.l	#6,sp
	tst.l	d0
	seq.b	(L001024)
	bpl.w	L000284
	pea.l	(L001026,pc)
	clr.w	-(sp)
	move.w	d2,-(sp)
	move.w	#$000d,-(sp)
	DOS	_IOCTRL
	tst.l	d0
	bmi.s	L000222
	move.w	(L001026,pc),d1
	moveq.l	#$00,d3
	move.b	d2,d0
	subq.w	#1,d0
	bra.w	L0002c8

L000222:
	lea.l	(L000b34),a0
L000228:
	tst.l	d5
	beq.s	L00025c
	cmpa.l	d5,a0
	beq.s	L000272
	move.w	d2,d0
	sub.w	d6,d0
	cmp.w	#$0002,d0
	bcs.s	L00025c
	cmp.w	#$0003,d0
	bcs.s	L00024a
	pea.l	(L000a16)
	DOS	_PRINT
	addq.l	#4,sp
L00024a:
	move.w	d2,d0
	add.w	#$003f,d0
	move.w	d0,-(sp)
	DOS	_PUTCHAR
	addq.l	#2,sp
	move.l	d5,-(sp)
	DOS	_PRINT
	addq.l	#4,sp
L00025c:
	move.l	a0,d5
	move.w	d2,d6
	move.w	d2,d0
	add.w	#$0040,d0
	move.w	d0,-(sp)
	DOS	_PUTCHAR
	addq.l	#2,sp
	move.l	a0,-(sp)
	DOS	_PRINT
	addq.l	#4,sp
L000272:
	cmpi.l	#$00000001,(L000d42)
	bne.w	L0001d2
	bra.w	L000528

L000284:
	tst.l	d5
	beq.s	L0002b6
	move.w	d2,d0
	sub.w	d6,d0
	cmp.w	#$0002,d0
	bcs.s	L0002b4
	cmp.w	#$0003,d0
	bcs.s	L0002a2
	pea.l	(L000a16)
	DOS	_PRINT
	addq.l	#4,sp
L0002a2:
	move.w	d2,d0
	add.w	#$003f,d0
	move.w	d0,-(sp)
	DOS	_PUTCHAR
	addq.l	#2,sp
	move.l	d5,-(sp)
	DOS	_PRINT
	addq.l	#4,sp
L0002b4:
	clr.l	d5
L0002b6:
	move.b	(L000f76),d0
	move.b	(L000f8c),d1
	move.b	(L000f77),d3
L0002c8:
	lea.l	(L000a1a),a0
	cmp.b	#$fe,d1
	beq.s	L000346
	lea.l	(L000a2e),a0
	cmp.b	#$f9,d1
	beq.s	L000346
	lea.l	(L000a42),a0
	cmp.b	#$f8,d1
	beq.s	L000346
	lea.l	(L000a54),a0
	cmp.b	#$f7,d1
	beq.s	L000346
	lea.l	(L000a6c),a0
	cmp.b	#$f6,d1
	beq.s	L000346
	lea.l	(L000ab0,pc),a0
	cmp.b	#$fd,d1
	beq.s	L000346
	lea.l	(L000ac4,pc),a0
	cmp.b	#$fb,d1
	beq.s	L000346
	lea.l	(L000adc,pc),a0
	cmp.b	#$fc,d1
	beq.s	L000346
	lea.l	(L000af4,pc),a0
	cmp.b	#$fa,d1
	beq.s	L000346
	lea.l	(L000a84,pc),a0
	cmpi.b	#$f5,d1
	beq.s	L000346
	lea.l	(L000a98,pc),a0
	cmpi.b	#$f4,d1
	beq.s	L000346
	lea.l	(L000b0c),a0
L000346:
	add.b	#$41,d0			;'A'
	move.w	d0,-(sp)
	DOS	_PUTCHAR
	addq.l	#2,sp
	move.l	a0,-(sp)
	DOS	_PRINT
	addq.l	#4,sp
	pea.l	(L000b20)
	DOS	_PRINT
	addq.l	#4,sp
	clr.l	d0
	move.b	d3,d0
	lea.l	(L000fda),a0
	bsr.w	L000716
	clr.b	(L000fe4)
	pea.l	(L000fe2)
	DOS	_PRINT
	addq.l	#4,sp
	tst.b	(L001023)
	beq.s	L0003de
	move.w	#$ffff,-(sp)
	move.w	#$0010,-(sp)
	DOS	_CONCTRL
	addq.l	#4,sp
	cmp.b	#$01,d0
	bhi.s	L0003de
	move.w	d2,d0
	and.w	#$00ff,d0
	move.w	d0,-(sp)
	DOS	_DRVCTRL
	addq.l	#2,sp
	and.l	#$00000004,d0
	bne.s	L0003de
	lea.l	(L000fda),a0
	lea.l	(L0007b2),a1
	bsr.w	L0006c2
	move.b	d2,d0
	add.b	#$40,d0			;'@'
	move.b	d0,(a0)
	move.w	#$0008,-(sp)
	move.l	a0,-(sp)
	pea.l	(L000fe6)
	DOS	_FILES
	lea.l	($000a,sp),sp
	tst.l	d0
	bmi.s	L0003de
	bsr.w	L0005d0
L0003de:
	pea.l	(L000d3f)
	DOS	_PRINT
	addq.l	#4,sp
	cmpi.l	#$00000001,(L000d42)
	bne.w	L0001d2
	tst.b	(L001024)
	beq.w	L000528
	lea.l	(L000b6e),a0
	move.w	(L000f78),d0
	and.l	#$0000ffff,d0
	bsr.w	L00057e
	lea.l	(L000b97),a0
	move.b	(L000f7a),d0
	and.l	#$000000ff,d0
	addq.l	#1,d0
	bsr.w	L00057e
	lea.l	(L000bc0),a0
	move.w	(L000f84),d0
	and.l	#$0000ffff,d0
	subq.l	#1,d0
	bsr.w	L00057e
	lea.l	(L000be9),a0
	move.w	(L000f7c),d0
	and.l	#$0000ffff,d0
	bsr.w	L00057e
	lea.l	(L000c12),a0
	move.b	(L000f7f),d0
	and.l	#$000000ff,d0
	bsr.w	L00057e
	lea.l	(L000c3b),a0
	move.w	(L000f86),d0
	and.l	#$0000ffff,d0
	bsr.w	L00057e
	lea.l	(L000c64),a0
	move.w	(L000f80),d0
	and.l	#$0000ffff,d0
	bsr.w	L00057e
	lea.l	(L000c8d),a0
	move.w	(L000f82),d0
	and.l	#$0000ffff,d0
	bsr.w	L00057e
	move.w	d2,d0
	and.w	#$00ff,d0
	move.w	d0,-(sp)
	DOS	_DRVCTRL
	addq.l	#2,sp
	move.l	d0,d1
	lea.l	(L000cb6),a0
	and.l	#$00000004,d0
	bsr.w	L0005ae
	lea.l	(L000ce0),a0
	move.l	d1,d0
	and.l	#$00000040,d0
	bsr.w	L0005ae
	lea.l	(L000d0a),a0
	move.l	d1,d0
	and.l	#$0000000c,d0
	bsr.w	L0005ae
	bra.s	L000528

L0004f8:
	tst.l	d5
	beq.s	L000528
	move.w	d2,d0
	sub.w	d6,d0
	cmp.w	#$0002,d0
	bcs.s	L000528
	cmp.w	#$0003,d0
	bcs.s	L000516
	pea.l	(L000a16)
	DOS	_PRINT
	addq.l	#4,sp
L000516:
	move.w	d2,d0
	add.w	#$003f,d0
	move.w	d0,-(sp)
	DOS	_PUTCHAR
	addq.l	#2,sp
	move.l	d5,-(sp)
	DOS	_PRINT
	addq.l	#4,sp
L000528:
	DOS	_EXIT

L00052a:
	pea.l	(L000962)
	DOS	_PRINT
	addq.l	#4,sp
	move.w	#$0002,-(sp)
	DOS	_EXIT2

L00053a:
	lea.l	(L0008a8),a0
	DOS	_VERNUM
	cmp.w	#$0162,d0
	bcs.s	L00054e
	lea.l	(L00084f),a0
L00054e:
	pea.l	(L0007b9)
	DOS	_PRINT
	addq.l	#4,sp
	move.l	a0,-(sp)
	DOS	_PRINT
	addq.l	#4,sp
	pea.l	(L0008ab)
	DOS	_PRINT
	addq.l	#4,sp
	move.w	#$0001,-(sp)
	DOS	_EXIT2

L00056e:
	pea.l	(L000982)
	DOS	_PRINT
	addq.l	#4,sp
	move.w	#$0002,-(sp)
	DOS	_EXIT2

L00057e:
	move.l	d0,-(sp)
	move.l	a0,-(sp)
	DOS	_PRINT
	addq.l	#4,sp
	move.l	(sp)+,d0
	lea.l	(L000fda),a0
	bsr.w	L000716
	clr.b	(L000fe4)
	pea.l	(L000fdf)
	DOS	_PRINT
	addq.l	#4,sp
	pea.l	(L000d3f)
	DOS	_PRINT
	addq.l	#4,sp
	rts

L0005ae:
	move.l	d0,-(sp)
	move.l	a0,-(sp)
	DOS	_PRINT
	addq.l	#4,sp
	move.l	(sp)+,d0
	tst.b	d0
	beq.s	L0005c4
	pea.l	(L000d3b)
	bra.s	L0005ca

L0005c4:
	pea.l	(L000d34)
L0005ca:
	DOS	_PRINT
	addq.l	#4,sp
	rts

L0005d0:
	pea.l	(L000947)
	DOS	_PRINT
	addq.l	#4,sp
	move.w	#$0015,d1
	lea.l	(L001004),a0
	clr.w	d0
L0005e6:
	tst.w	d1
	beq.s	L00060a
	move.b	(a0)+,d0
	beq.s	L000606
	cmp.b	#$2e,d0			;'.'
	beq.s	L0005e6
	move.w	d0,-(sp)
	DOS	_PUTCHAR
	addq.l	#2,sp
	subq.w	#1,d1
	bra.s	L0005e6

L0005fe:
	move.w	#$0020,-(sp)		;' '
	DOS	_PUTCHAR
	addq.l	#2,sp
L000606:
	dbra.w	d1,L0005fe
L00060a:
	pea.l	(L00095c)
	DOS	_PRINT
	addq.l	#4,sp
	rts

L000616:
	movem.l	d1/a0-a2,-(sp)
	clr.l	d1
L00061c:
	bsr.w	L0006a8
	adda.l	d0,a0
	tst.b	(a0)
	beq.s	L000698
	move.b	(a0)+,d0
	cmp.b	#$2d,d0			;'-'
	beq.s	L000634
	cmp.b	#$2f,d0			;'/'
	bne.s	L00064a
L000634:
	move.b	(a0)+,d0
	beq.s	L000698
	cmp.b	#$09,d0
	beq.s	L000646
	cmp.b	#$20,d0			;' '
	beq.s	L000646
	move.b	d0,(a2)+
L000646:
	clr.b	(a2)+
	bra.s	L00061c

L00064a:
	addq.l	#1,d1
L00064c:
	move.b	d0,(a1)+
	cmp.b	#$22,d0			;'"'
	bne.s	L000662
L000654:
	move.b	(a0)+,d0
	beq.s	L000698
	move.b	d0,(a1)+
	cmp.b	#$22,d0			;'"'
	bne.s	L000654
	bra.s	L000674

L000662:
	cmp.b	#$27,d0			;'''
	bne.s	L000674
L000668:
	move.b	(a0)+,d0
	beq.s	L000698
	move.b	d0,(a1)+
	cmp.b	#$27,d0			;'''
	bne.s	L000668
L000674:
	move.b	(a0),d0
	beq.s	L000698
	cmp.b	#$2f,d0			;'/'
	beq.s	L000694
	cmp.b	#$2d,d0			;'-'
	beq.s	L000694
	addq.l	#1,a0
	cmp.b	#$09,d0
	beq.s	L000694
	cmp.b	#$20,d0			;' '
	beq.s	L000694
	bra.s	L00064c

L000694:
	clr.b	(a1)+
	bra.s	L00061c

L000698:
	clr.b	(a1)+
	clr.b	(a1)
	clr.b	(a2)+
	clr.b	(a2)
	move.l	d1,d0
	movem.l	(sp)+,d1/a0-a2
	rts

L0006a8:
	move.l	a0,-(sp)
L0006aa:
	move.b	(a0)+,d0
	cmpi.b	#$20,d0			;' '
	beq.s	L0006aa
	cmpi.b	#$09,d0
	beq.s	L0006aa
	move.l	a0,d0
	movea.l	(sp)+,a0
	sub.l	a0,d0
	subq.l	#1,d0
	rts

L0006c2:
	movem.l	a0-a1,-(sp)
L0006c6:
	move.b	(a1)+,(a0)+
	bne.s	L0006c6
	movem.l	(sp)+,a0-a1
	rts

L0006d0:
	movem.l	d0-d1/a0,-(sp)
	clr.b	d1
L0006d6:
	move.b	(a0),d0
	beq.s	L000710
	tst.b	d1
	beq.s	L0006e2
	clr.b	d1
	bra.s	L0006f8

L0006e2:
	cmp.b	#$80,d0
	bcs.s	L0006fc
	cmp.b	#$a0,d0
	bcs.s	L0006f4
	cmp.b	#$e0,d0
	bcs.s	L0006fc
L0006f4:
	move.b	#$01,d1
L0006f8:
	addq.l	#1,a0
	bra.s	L0006d6

L0006fc:
	cmpi.b	#$41,d0			;'A'
	bcs.s	L00070c
	cmpi.b	#$5a,d0			;'Z'
	bhi.s	L00070c
	add.b	#$20,d0			;' '
L00070c:
	move.b	d0,(a0)+
	bra.s	L0006d6

L000710:
	movem.l	(sp)+,d0-d1/a0
	rts

L000716:
	movem.l	d0-d2/a0-a1,-(sp)
	movem.l	a0,-(sp)
	lea.l	(L000786),a1
L000724:
	clr.b	d2
	move.l	(a1)+,d1
	beq.s	L00073a
L00072a:
	addq.b	#1,d2
	sub.l	d1,d0
	bcc.s	L00072a
	add.l	d1,d0
	add.b	#$2f,d2			;'/'
	move.b	d2,(a0)+
	bra.s	L000724

L00073a:
	clr.b	(a0)
	movem.l	(sp)+,a0
L000740:
	move.b	(a0)+,d0
	beq.s	L000756
	cmp.b	#$30,d0			;'0'
	bne.s	L000756
	tst.b	(a0)
	beq.s	L000756
	move.b	#$20,(-$0001,a0)	;' '
	bra.s	L000740

L000756:
	movem.l	(sp)+,d0-d2/a0-a1
	rts

L00075c:
	movem.l	d1,-(sp)
	and.l	#$000000ff,d0
	move.l	d0,d1
	DOS	_CURDRV
	move.w	d0,-(sp)
	move.w	d1,-(sp)
	DOS	_CHGDRV
	addq.l	#2,sp
	cmp.w	d1,d0
	bhi.s	L00077a
	moveq.l	#$ff,d0
	bra.s	L00077e

L00077a:
	DOS	_CHGDRV
	clr.l	d0
L00077e:
	addq.l	#2,sp
	movem.l	(sp)+,d1
	rts


	.data

L000786:
	.dc.b	$3b,$9a,$ca,$00,$05,$f5,$e1,$00
	.dc.b	$00,$98,$96,$80,$00,$0f,$42,$40
	.dc.b	$00,$01,$86,$a0,$00,$00,$27,$10
	.dc.b	$00,$00,$03,$e8,$00,$00,$00,$64
	.dc.b	$00,$00,$00,$0a,$00,$00,$00,$01
	.dc.b	$00,$00,$00,$00
L0007b2:
	.dc.b	'A:\*.*',$00
L0007b9:
	.dc.b	'X68k Drive v2.20 Copyright 1989,90,91,92,93 SHARP/Hudson',$0d,$0a
	.dc.b	'使用法：drive［スイッチ］［ドライブ名１］［ドライブ名２］',$0d,$0a
	.dc.b	$09,'/v',$09,'ボリュームラベルを表示する',$0d,$0a,$00
L00084f:
	.dc.b	$09,'/d',$09,'すべてのドライブ名を初期状態に戻す',$0d,$0a
	.dc.b	$0d,$0a
	.dc.b	$09,'/dのスイッチを付けた場合ドライブ名は指定しない'
L0008a8:
	.dc.b	$0d,$0a,$00
L0008ab:
	.dc.b	$09,'ドライブ名の指定が無いと全ドライブのタイプを表示する',$0d,$0a
	.dc.b	$09,'ドライブ名１のみ指定するとステ－タスを表示する',$0d,$0a
	.dc.b	$09,'ドライブ名１，２を指定するとドライブ名を交換する',$0d,$0a,$00
L000947:
	.dc.b	' ボリュ－ムラベルは ',$00
L00095c:
	.dc.b	' です',$00
L000962:
	.dc.b	'drive: ドライブ指定が無効です',$0d,$0a,$00
L000982:
	.dc.b	'このＯＳでは使用できません',$0d,$0a,$00
L00099f:
	.dc.b	':と'
L0009a2:
	.dc.b	'ドライブ ',$00
L0009ac:
	.dc.b	':を入れ替えました',$0d,$0a,$00
L0009c0:
	.dc.b	'カレント ',$00
L0009ca:
	.dc.b	':をドライブ ',$00
L0009d7:
	.dc.b	':に切り替えました',$0d,$0a,$00
L0009eb:
	.dc.b	'すべてのドライブ名を初期状態に戻しました',$0d,$0a,$00
L000a16:
	.dc.b	'|',$0d,$0a,$00
L000a1a:
	.dc.b	': ２ＨＤ（１ＭＢ）',$09,$00
L000a2e:
	.dc.b	': ＲＡＭ　ＤＩＳＫ',$09,$00
L000a42:
	.dc.b	': ハードディスク',$09,$00
L000a54:
	.dc.b	': ハードディスク(SCSI)',$09,$00
L000a6c:
	.dc.b	': 光磁気ディスク(SCSI)',$09,$00
L000a84:
	.dc.b	': ＣＤＲＯＭ(SCSI)',$09,$00
L000a98:
	.dc.b	': ＤＡＴドライブ(SCSI)',$09,$00
L000ab0:
	.dc.b	': ２ＨＣ（１ＭＢ）',$09,$00
L000ac4:
	.dc.b	': ２ＤＤ（６４０ＫＢ）',$09,$00
L000adc:
	.dc.b	': ２ＤＤ（７２０ＫＢ）',$09,$00
L000af4:
	.dc.b	': ２ＨＤ（１.４４ＭＢ）',$00
L000b0c:
	.dc.b	': その他のタイプ　',$09,$00
L000b20:
	.dc.b	'ユニット番号････   ',$00
L000b34:
	.dc.b	': ドライブの装置情報が存在しません',$0d,$0a,$00
L000b59:
	.dc.b	': 仮想ドライブです',$0d,$0a,$00
L000b6e:
	.dc.b	'１セクタあたりのバイト数････････････････',$00
L000b97:
	.dc.b	'１クラスタあたりのセクタ数･･････････････',$00
L000bc0:
	.dc.b	'総クラスタ数････････････････････････････',$00
L000be9:
	.dc.b	'ファイルアロケーションの先頭セクタ番号･･',$00
L000c12:
	.dc.b	'ファイルアロケーションのセクタ数････････',$00
L000c3b:
	.dc.b	'ルートディレクトリの先頭セクタ番号･･････',$00
L000c64:
	.dc.b	'ルートディレクトリの最大個数････････････',$00
L000c8d:
	.dc.b	'データ領域の先頭セクタ番号･･････････････',$00
L000cb6:
	.dc.b	'アクセス････････････････････････････････ ',$00
L000ce0:
	.dc.b	'イジェクト･･････････････････････････････ ',$00
L000d0a:
	.dc.b	'書き込み････････････････････････････････ ',$00
L000d34:
	.dc.b	'  可',$0d,$0a,$00
L000d3b:
	.dc.b	'不可'
L000d3f:
	.dc.b	$0d,$0a,$00

	.bss

L000d42:
	.ds.l	1
L000d46:
	.ds.b	280
L000e5e:
	.ds.b	280
L000f76:
	.ds.b	1
L000f77:
	.ds.b	1
L000f78:
	.ds.w	1
L000f7a:
	.ds.b	2
L000f7c:
	.ds.b	3
L000f7f:
	.ds.b	1
L000f80:
	.ds.w	1
L000f82:
	.ds.w	1
L000f84:
	.ds.w	1
L000f86:
	.ds.b	6
L000f8c:
	.ds.b	78
L000fda:
	.ds.b	5
L000fdf:
	.ds.b	3
L000fe2:
	.ds.b	2
L000fe4:
	.ds.b	2
L000fe6:
	.ds.b	30
L001004:
	.ds.b	30
L001022:
	.ds.b	1
L001023:
	.ds.b	1
L001024:
	.ds.b	2
L001026:
	.ds.b	1028
L00142a:
	.ds.b	2
End:

	.end	Start
