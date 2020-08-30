;=============================================
;  Filename move.x
;
;
;  Base address 000000
;  Exec address 000000
;  Text size    000636 byte(s)
;  Data size    00012a byte(s)
;  Bss  size    000be6 byte(s)
;  123 Labels
;
;  Commandline dis  -b2 -h -m68000 --sp -q1 -B -M -o120 -gmove.lab --overwrite move.x move.s
;          DIS version 3.16
;=============================================

	.include	inc/doscall.mac
	.include	inc/iocscall.mac
	.include	inc/fefunc.mac

	.cpu	68000

	.text

L000000:
	lea.l	(L001344),sp
	movea.l	(L000000-$0000e0),a0
	addq.l	#1,a0
	lea.l	(L000760),a1
	bsr.w	L00024a
	tst.w	d0
	beq.w	L000206
	cmp.w	#$0002,d0
	bhi.w	L000206
	tst.b	(L000878)
	bne.w	L000206
	lea.l	(L000760),a1
	lea.l	(L000990),a0
	bsr.w	L0002f6
	movea.l	a1,a0
	bsr.w	L000328
	adda.l	d0,a1
	addq.l	#1,a1
	lea.l	(L000bc0),a0
	bsr.w	L0002f6
	lea.l	(L000990),a1
	lea.l	(L000cd8),a0
	cmpi.b	#$3a,($0001,a1)		;':'
	beq.s	L000076
	DOS	_CURDRV
	add.b	#$61,d0			;'a'
	move.b	d0,(a0)+
	move.b	#$3a,(a0)+		;':'
	bra.s	L00008a

L000076:
	move.b	(a1),d0
	or.b	#$20,d0
	sub.b	#$61,d0			;'a'
	bsr.w	L0004f6
	tst.l	d0
	bne.w	L00022c
L00008a:
	bsr.w	L0002f6
	bsr.w	L00037e
	lea.l	(L000bc0),a1
	lea.l	(L000cd8),a2
	lea.l	(L000df0),a0
	tst.b	(a1)
	beq.s	L0000b0
	cmpi.b	#$3a,($0001,a1)		;':'
	beq.s	L0000b6
L0000b0:
	move.b	(a2)+,(a0)+
	move.b	(a2)+,(a0)+
	bra.s	L0000ca

L0000b6:
	move.b	(a1),d0
	or.b	#$20,d0
	sub.b	#$61,d0			;'a'
	bsr.w	L0004f6
	tst.l	d0
	bne.w	L00022c
L0000ca:
	bsr.w	L0002f6
	bsr.w	L00037e
	bsr.w	L00033a
	lea.l	(L000636),a1
	bsr.w	L000304
	tst.l	d0
	bne.w	L00023c
	lea.l	(L000cd8),a0
	lea.l	(L000df0),a1
	cmpm.b	(a0)+,(a1)+
	bne.w	L00021c
	lea.l	(L000cd8),a0
	bsr.w	L000520
	movea.l	a0,a1
	lea.l	(L000aa8),a0
	bsr.w	L0002f6
	movea.l	a1,a0
	bsr.w	L00033a
	movea.l	a0,a2
	clr.b	(a0)
	lea.l	(L000df0),a0
	bsr.w	L000520
	bsr.w	L00033a
	movea.l	a0,a3
	clr.b	(a0)
	lea.l	(L000cd8),a0
	lea.l	(L000df0),a1
L000136:
	move.b	(a0)+,d0
	beq.s	L00016a
	cmp.b	#$80,d0
	bcc.s	L00015a
	cmp.b	#$a0,d0
	bcc.s	L00014c
	cmp.b	#$e0,d0
	bcc.s	L00015a
L00014c:
	cmp.b	(a1)+,d0
	bne.s	L000170
	tst.b	(a0)
	beq.s	L00016a
	cmpm.b	(a0)+,(a1)+
L000156:
	bne.s	L000170
	bra.s	L000136

L00015a:
	bsr.w	L000624
	move.b	d0,d1
	move.b	(a1)+,d0
	bsr.w	L000624
	cmp.b	d0,d1
	bra.s	L000156

L00016a:
	cmp.b	(a1),d0
	beq.w	L000224
L000170:
	lea.l	(L000990),a0
	bsr.w	L00033a
	movea.l	a0,a4
	clr.b	(a0)
	move.w	#$0020,-(sp)		;' '
	pea.l	(L000aa8)
	pea.l	(L000f08)
	DOS	_FILES
	lea.l	($000a,sp),sp
	tst.l	d0
	bmi.w	L000234
L00019a:
	move.b	(L000f1d),d0
	and.b	#$05,d0
	bne.s	L0001f2
	movea.l	a2,a0
	lea.l	(L000f26),a1
	bsr.w	L0002f6
	movea.l	a3,a0
	lea.l	(L000f26),a1
	bsr.w	L0002f6
	movea.l	a4,a0
	lea.l	(L000f26),a1
	bsr.w	L0002f6
	pea.l	(L000990)
	DOS	_PRINT
	addq.l	#4,sp
	pea.l	(L00075c)
	DOS	_PRINT
	addq.l	#4,sp
	pea.l	(L000df0)
	pea.l	(L000cd8)
	DOS	_RENAME
	addq.l	#8,sp
	tst.l	d0
	bmi.s	L000214
L0001f2:
	pea.l	(L000f08)
	DOS	_NFILES
	addq.l	#4,sp
	tst.l	d0
	bpl.s	L00019a
	clr.w	d0
L000202:
	move.w	d0,-(sp)
	DOS	_EXIT2

L000206:
	pea.l	(L00063a)
	DOS	_PRINT
	addq.l	#4,sp
	moveq.l	#$01,d0
	bra.s	L000202

L000214:
	pea.l	(L000721)
	bra.s	L000242

L00021c:
	pea.l	(L0006cb)
	bra.s	L000242

L000224:
	pea.l	(L0006f8)
	bra.s	L000242

L00022c:
	pea.l	(L000742)
	bra.s	L000242

L000234:
	pea.l	(L0006a2)
	bra.s	L000242

L00023c:
	pea.l	(L000675)
L000242:
	DOS	_PRINT
	addq.l	#4,sp
	moveq.l	#$02,d0
	bra.s	L000202

L00024a:
	movem.l	d1/a0-a2,-(sp)
	clr.l	d1
L000250:
	bsr.w	L0002dc
	adda.l	d0,a0
	tst.b	(a0)
	beq.s	L0002cc
	move.b	(a0)+,d0
	cmp.b	#$2d,d0			;'-'
	beq.s	L000268
	cmp.b	#$2f,d0			;'/'
	bne.s	L00027e
L000268:
	move.b	(a0)+,d0
	beq.s	L0002cc
	cmp.b	#$09,d0
	beq.s	L00027a
	cmp.b	#$20,d0			;' '
	beq.s	L00027a
	move.b	d0,(a2)+
L00027a:
	clr.b	(a2)+
	bra.s	L000250

L00027e:
	addq.l	#1,d1
L000280:
	move.b	d0,(a1)+
	cmp.b	#$22,d0			;'"'
	bne.s	L000296
L000288:
	move.b	(a0)+,d0
	beq.s	L0002cc
	move.b	d0,(a1)+
	cmp.b	#$22,d0			;'"'
	bne.s	L000288
	bra.s	L0002a8

L000296:
	cmp.b	#$27,d0			;'''
	bne.s	L0002a8
L00029c:
	move.b	(a0)+,d0
	beq.s	L0002cc
	move.b	d0,(a1)+
	cmp.b	#$27,d0			;'''
	bne.s	L00029c
L0002a8:
	move.b	(a0),d0
	beq.s	L0002cc
	cmp.b	#$2f,d0			;'/'
	beq.s	L0002c8
	cmp.b	#$2d,d0			;'-'
	beq.s	L0002c8
	addq.l	#1,a0
	cmp.b	#$09,d0
	beq.s	L0002c8
	cmp.b	#$20,d0			;' '
	beq.s	L0002c8
	bra.s	L000280

L0002c8:
	clr.b	(a1)+
	bra.s	L000250

L0002cc:
	clr.b	(a1)+
	clr.b	(a1)
	clr.b	(a2)+
	clr.b	(a2)
	move.l	d1,d0
	movem.l	(sp)+,d1/a0-a2
	rts

L0002dc:
	move.l	a0,-(sp)
L0002de:
	move.b	(a0)+,d0
	cmpi.b	#$20,d0			;' '
	beq.s	L0002de
	cmpi.b	#$09,d0
	beq.s	L0002de
	move.l	a0,d0
	movea.l	(sp)+,a0
	sub.l	a0,d0
	subq.l	#1,d0
	rts

L0002f6:
	movem.l	a0-a1,-(sp)
L0002fa:
	move.b	(a1)+,(a0)+
	bne.s	L0002fa
	movem.l	(sp)+,a0-a1
	rts

L000304:
	movem.l	a0-a1,-(sp)
L000308:
	move.b	(a0)+,d0
	beq.s	L00031a
	cmp.b	(a1)+,d0
	beq.s	L000308
	bcs.s	L000316
	moveq.l	#$01,d0
	bra.s	L000320

L000316:
	moveq.l	#$ff,d0
	bra.s	L000320

L00031a:
	tst.b	(a1)
	bne.s	L000316
	clr.l	d0
L000320:
	tst.l	d0
	movem.l	(sp)+,a0-a1
	rts

L000328:
	move.l	a0,-(sp)
	moveq.l	#$ff,d0
L00032c:
	addi.l	#$00000001,d0
	tst.b	(a0)+
	bne.s	L00032c
	movea.l	(sp)+,a0
	rts

L00033a:
	movem.l	d0-d1,-(sp)
	clr.b	d1
	move.l	a0,-(sp)
L000342:
	move.b	(a0)+,d0
	beq.s	L000376
	tst.b	d1
	beq.s	L00034e
	clr.b	d1
	bra.s	L000342

L00034e:
	cmp.b	#$80,d0
	bcs.s	L000366
	cmp.b	#$a0,d0
	bcs.s	L000360
	cmp.b	#$e0,d0
	bcs.s	L000366
L000360:
	move.b	#$01,d1
	bra.s	L000342

L000366:
	cmp.b	#$5c,d0			;'\'
	beq.s	L000372
	cmp.b	#$3a,d0			;':'
	bne.s	L000342
L000372:
	move.l	a0,(sp)
	bra.s	L000342

L000376:
	movea.l	(sp)+,a0
	movem.l	(sp)+,d0-d1
	rts

L00037e:
	link.w	a6,#-$003c
	movem.l	d0-d6/a1-a2,-(sp)
	move.w	#$ffff,d2
	movea.l	a0,a1
	bsr.s	L000328
	move.w	d0,d1
	tst.w	d1
	beq.w	L0004d6
	clr.b	d3
L000398:
	move.b	(a1)+,d4
	beq.s	L0003ce
	tst.b	d3
	beq.s	L0003b6
	cmp.b	#$01,d3
	beq.s	L0003b0
	cmp.b	#$2e,d4			;'.'
	beq.s	L0003b6
	clr.b	d3
	bra.s	L0003b6

L0003b0:
	move.b	#$02,d3
	bra.s	L000398

L0003b6:
	cmp.b	#$80,d4
	bcs.s	L000398
	cmp.b	#$a0,d4
	bcs.s	L0003c8
	cmp.b	#$e0,d4
	bcs.s	L000398
L0003c8:
	move.b	#$01,d3
	bra.s	L000398

L0003ce:
	subq.l	#1,a1
	tst.b	d3
	bne.s	L0003f0
	cmpi.b	#$5c,(-$0001,a1)	;'\'
	bne.s	L0003f0
	cmp.w	#$0001,d1
	beq.w	L0004d6
	cmpi.b	#$3a,(-$0002,a1)	;':'
	beq.w	L0004d6
	clr.b	-(a1)
L0003f0:
	cmpi.b	#$3a,(-$0001,a1)	;':'
	beq.w	L0004d6
	cmpi.b	#$2e,(-$0001,a1)	;'.'
	bne.s	L00042c
	tst.b	d3
	bne.s	L00042c
	cmp.w	#$0001,d1
	beq.s	L00041c
	cmpi.b	#$3a,(-$0002,a1)	;':'
	beq.s	L00041c
	cmpi.b	#$5c,(-$0002,a1)	;'\'
	bne.s	L00042c
L00041c:
	move.b	#$2a,(-$0001,a1)	;'*'
	move.b	#$2e,(a1)+		;'.'
	move.b	#$2a,(a1)+		;'*'
	clr.b	(a1)
L00042c:
	movea.l	a0,a2
L00042e:
	move.b	(a2)+,d0
	beq.s	L000440
	cmp.b	#$2a,d0			;'*'
	beq.s	L00045c
	cmp.b	#$3f,d0			;'?'
	beq.s	L00045c
	bra.s	L00042e

L000440:
	move.w	#$0010,-(sp)
	move.l	a0,-(sp)
	pea.l	(-$003c,a6)
	DOS	_FILES
	lea.l	($000a,sp),sp
	tst.l	d0
	bmi.s	L00045c
	btst.b	#$04,(-$0027,a6)
	bne.s	L0004d2
L00045c:
	clr.b	d3
	movea.l	a0,a2
	clr.b	d5
	clr.b	d6
L000464:
	move.b	(a2)+,d0
	beq.s	L0004ca
	tst.b	d3
	beq.s	L000470
	clr.b	d3
	bra.s	L000464

L000470:
	cmp.b	#$80,d0
	bcs.s	L00048c
	cmp.b	#$a0,d0
	bcs.s	L000482
	cmp.b	#$e0,d0
	bcs.s	L00048c
L000482:
	move.b	#$01,d3
	move.b	#$20,d5			;' '
	bra.s	L000464

L00048c:
	cmp.b	#$2e,d0			;'.'
	bne.s	L0004ac
	tst.b	d5
	beq.s	L0004a8
	cmp.b	#$3a,d5			;':'
	beq.s	L0004a8
	cmp.b	#$5c,d5			;'\'
	beq.s	L0004a8
	cmp.b	#$2e,d5			;'.'
	bne.s	L0004ac
L0004a8:
	tst.b	(a2)
	beq.s	L0004d2
L0004ac:
	cmpi.b	#$5c,(a2)		;'\'
	bne.s	L0004b8
	tst.b	($0001,a2)
	beq.s	L0004d6
L0004b8:
	move.b	d0,d5
	cmp.b	#$2e,d0			;'.'
	beq.s	L0004c6
	cmp.b	#$5c,d0			;'\'
	bne.s	L000464
L0004c6:
	move.b	d0,d6
	bra.s	L000464

L0004ca:
	cmp.b	#$2e,d6			;'.'
	beq.s	L0004ee
	bra.s	L0004dc

L0004d2:
	move.b	#$5c,(a1)+		;'\'
L0004d6:
	move.b	#$2a,(a1)+		;'*'
	clr.w	d2
L0004dc:
	move.b	#$2e,(a1)+		;'.'
	move.b	#$2a,(a1)+		;'*'
	tst.w	d2
	beq.s	L0004ec
	clr.b	(-$0001,a1)
L0004ec:
	clr.b	(a1)
L0004ee:
	movem.l	(sp)+,d0-d6/a1-a2
	unlk	a6
	rts

L0004f6:
	movem.l	d1,-(sp)
	and.l	#$000000ff,d0
	move.l	d0,d1
	DOS	_CURDRV
	move.w	d0,-(sp)
	move.w	d1,-(sp)
	DOS	_CHGDRV
	addq.l	#2,sp
	cmp.w	d1,d0
	bhi.s	L000514
	moveq.l	#$ff,d0
	bra.s	L000518

L000514:
	DOS	_CHGDRV
	clr.l	d0
L000518:
	addq.l	#2,sp
	movem.l	(sp)+,d1
	rts

L000520:
	link.w	a6,#-$0118
	movem.l	d0-d2/a0-a3,-(sp)
	lea.l	(-$0118,a6),a1
	move.l	a0,-(sp)
	clr.w	d1
	move.b	($0001,a0),d0
	cmp.b	#$3a,d0			;':'
	bne.s	L00054c
	move.b	(a0)+,d0
	bsr.w	L000624
	move.b	d0,(a1)+
	sub.b	#$60,d0			;'`'
	move.b	(a0)+,(a1)+
	move.w	d0,d1
	bra.s	L00055c

L00054c:
	DOS	_CURDRV
	move.b	d0,d1
	addq.b	#1,d1
	add.b	#$41,d0			;'A'
	move.b	d0,(a1)+
	move.b	#$3a,(a1)+		;':'
L00055c:
	movea.l	a0,a2
	clr.b	d2
L000560:
	move.b	(a2)+,d0
	beq.s	L000592
	tst.b	d2
	beq.s	L00056c
	clr.b	d2
	bra.s	L000560

L00056c:
	cmp.b	#$80,d0
	bcs.s	L000584
	cmp.b	#$a0,d0
	bcs.s	L00057e
	cmp.b	#$e0,d0
	bcs.s	L000584
L00057e:
	move.b	#$01,d2
	bra.s	L000560

L000584:
	cmp.b	#$5c,d0			;'\'
	beq.s	L00058c
	bra.s	L000560

L00058c:
	cmpi.b	#$5c,(a0)		;'\'
	beq.s	L0005ae
L000592:
	move.b	#$5c,(a1)+		;'\'
	move.l	a1,-(sp)
	move.w	d1,-(sp)
	DOS	_CURDIR
	addq.l	#6,sp
	movea.l	a1,a2
L0005a0:
	tst.b	(a1)+
	bne.s	L0005a0
	subq.l	#1,a1
	cmpa.l	a1,a2
	beq.s	L0005ae
	move.b	#$5c,(a1)+		;'\'
L0005ae:
	move.b	(a0)+,(a1)+
	bne.s	L0005ae
	clr.b	d2
	movea.l	(sp)+,a0
	lea.l	(-$0118,a6),a1
	lea.l	(sp),a3
	clr.l	-(sp)
L0005be:
	move.b	(a1)+,d0
	tst.b	d2
	beq.s	L0005c8
	clr.b	d2
	bra.s	L000616

L0005c8:
	cmp.b	#$80,d0
	bcs.s	L0005e0
	cmp.b	#$a0,d0
	bcs.s	L0005da
	cmp.b	#$e0,d0
	bcs.s	L0005e0
L0005da:
	move.b	#$01,d2
	bra.s	L000616

L0005e0:
	cmp.b	#$5c,d0			;'\'
	bne.s	L000616
	cmpi.b	#$2e,(a1)		;'.'
	bne.s	L000614
	cmpi.b	#$5c,($0001,a1)		;'\'
	beq.s	L000610
	cmpi.b	#$2e,($0001,a1)		;'.'
	bne.s	L000614
	cmpi.b	#$5c,($0002,a1)		;'\'
	bne.s	L000614
	move.l	(sp)+,d1
	tst.l	d1
	beq.s	L000616
	movea.l	d1,a0
	addq.l	#2,a1
	bra.s	L0005be

L000610:
	addq.l	#1,a1
	bra.s	L0005be

L000614:
	move.l	a0,-(sp)
L000616:
	move.b	d0,(a0)+
	bne.s	L0005be
	lea.l	(a3),sp
	movem.l	(sp)+,d0-d2/a0-a3
	unlk	a6
	rts

L000624:
	cmpi.b	#$41,d0			;'A'
	bcs.s	L000634
	cmpi.b	#$5a,d0			;'Z'
	bhi.s	L000634
	add.b	#$20,d0			;' '
L000634:
	rts


	.data

L000636:
	.dc.b	'*.*',$00
L00063a:
	.dc.b	'使用法：move［移動元ディレクトリ］［移動先ディレクトリ］',$0d,$0a,$00
L000675:
	.dc.b	'move: 移動先のディレクトリが見つかりません',$0d,$0a,$00
L0006a2:
	.dc.b	'move: 移動元のファイルが見つかりません',$0d,$0a,$00
L0006cb:
	.dc.b	'move: 移動元と移動先のドライブ名が違います',$0d,$0a,$00
L0006f8:
	.dc.b	'move: 移動元と移動先のパス名が同じです',$0d,$0a,$00
L000721:
	.dc.b	'move: ファイルを移動できません',$0d,$0a,$00
L000742:
	.dc.b	'move: ドライブ名が無効です'
L00075c:
	.dc.b	$0d,$0a,$00,$00

	.bss

L000760:
	.ds.b	280
L000878:
	.ds.b	280
L000990:
	.ds.b	280
L000aa8:
	.ds.b	280
L000bc0:
	.ds.b	280
L000cd8:
	.ds.b	280
L000df0:
	.ds.b	280
L000f08:
	.ds.b	21
L000f1d:
	.ds.b	9
L000f26:
	.ds.b	1054
L001344:
	.ds.b	2
L001346:

	.end	L000000
