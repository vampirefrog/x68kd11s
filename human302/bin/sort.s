;=============================================
;  Filename human302/bin/sort.x
;
;
;  Base address 000000
;  Exec address 000000
;  Text size    000760 byte(s)
;  Data size    000000 byte(s)
;  Bss  size    0004a2 byte(s)
;  101 Labels
;
;  Commandline dis  -h -k -m68000 -q1 -B -M -w16 -o120 -ghuman302/bin/sort.lab --overwrite human302/bin/sort.x human302/bin/sort.s
;          DIS version 3.16
;=============================================

	.include	inc/doscall.mac
	.include	inc/iocscall.mac
	.include	inc/fefunc.mac

	.cpu	68000

	.text

L000000:
	lea.l	(L000c02),a7
	move.l	($0008,a0),d0
	sub.l	a7,d0
	move.l	d0,(L000770)
	move.w	#$0001,(L000776)
	clr.w	(L000760)
	clr.w	(L000762)
	clr.w	(L000766)
	clr.w	(L000768)
	clr.b	(L000778)
	move.w	#$0008,(L00076a)
	clr.w	(L00076c)
	clr.w	(L00076e)
	addq.l	#1,a2
L00004e:
	bsr	L00062e
	move.b	(a2),d0
	beq	L00023a
	cmp.b	#$2f,d0			;'/'
	beq	L000066
	cmp.b	#$2d,d0			;'-'
	bne	L000204
L000066:
	lea.l	($0001,a2),a2
	move.b	(a2),d0
	beq	L0005e8
	cmp.b	#$20,d0			;' '
	beq	L0005e8
	cmp.b	#$09,d0
	beq	L0005e8
L000080:
	move.b	(a2),d0
	beq	L00023a
	cmp.b	#$2f,d0			;'/'
	beq	L00004e
	cmp.b	#$2d,d0			;'-'
	beq	L00004e
	cmp.b	#$20,d0			;' '
	beq	L00004e
	cmp.b	#$09,d0
	beq	L00004e
	cmp.b	#$72,d0			;'r'
	beq	L0001c0
	cmp.b	#$52,d0			;'R'
	beq	L0001c0
	cmp.b	#$69,d0			;'i'
	beq	L0001e2
	cmp.b	#$49,d0			;'I'
	beq	L0001e2
	cmp.b	#$74,d0			;'t'
	beq	L000156
	cmp.b	#$54,d0			;'T'
	beq	L000156
	cmp.b	#$2b,d0			;'+'
	beq	L0000e2
	cmp.b	#$4b,d0			;'K'
	beq	L0000e2
	cmp.b	#$6b,d0			;'k'
	bne	L0005e8
L0000e2:
	tst.w	(L000762)
	bne	L0005e8
	lea.l	($0001,a2),a2
	movea.l	a2,a0
	clr.w	d1
L0000f4:
	move.b	(a0)+,d0
	cmp.b	#$30,d0			;'0'
	bcs	L000106
	cmp.b	#$39,d0			;'9'
	bhi	L000106
	addq.w	#1,d1
	bra	L0000f4

L000106:
	tst.w	d1
	ble	L0005e8
	cmp.w	#$0005,d1
	bgt	L0005e8
	subq.w	#1,d1
	lea.l	(L000756),a0
	clr.w	d3
L00011e:
	clr.w	d0
	move.b	(a2)+,d0
	sub.b	#$30,d0			;'0'
	move.w	d1,d2
	lsl.w	#1,d2
	mulu.w	(a0,d2.w),d0
	add.w	d0,d3
	dbra	d1,L00011e
	tst.w	d3
	ble	L0005e8
	cmp.w	#$0200,d3
	bgt	L0005e8
	subq.w	#1,d3
	move.w	d3,(L000768)
	move.w	#$ffff,(L000762)
	bra	L000080

L000156:
	tst.w	(L000764)
	bne	L0005e8
	lea.l	($0001,a2),a2
	movea.l	a2,a0
	clr.w	d1
L000168:
	move.b	(a0)+,d0
	cmp.b	#$30,d0			;'0'
	bcs	L00017a
	cmp.b	#$39,d0			;'9'
	bhi	L00017a
	addq.w	#1,d1
	bra	L000168

L00017a:
	tst.w	d1
	ble	L0005e8
	cmp.w	#$0002,d1
	bgt	L0005e8
	subq.w	#1,d1
	lea.l	(L000756),a0
	clr.w	d3
L000192:
	clr.w	d0
	move.b	(a2)+,d0
	sub.b	#$30,d0			;'0'
	move.w	d1,d2
	lsl.w	#1,d2
	mulu.w	(a0,d2.w),d0
	add.w	d0,d3
	dbra	d1,L000192
	tst.w	d3
	ble	L0005e8
	move.w	d3,(L00076a)
	move.w	#$ffff,(L000764)
	bra	L000080

L0001c0:
	tst.w	(L000760)
	bne	L0005e8
	move.w	#$ffff,(L00076c)
	move.w	#$ffff,(L000760)
	lea.l	($0001,a2),a2
	bra	L000080

L0001e2:
	tst.w	(L000766)
	bne	L0005e8
	move.w	#$ffff,(L00076e)
	move.w	#$ffff,(L000766)
	lea.l	($0001,a2),a2
	bra	L000080

L000204:
	lea.l	(L000778),a0
	tst.b	(a0)
	bne	L0005e8
L000210:
	move.b	(a2),d0
	beq	L000234
	cmp.b	#$20,d0			;' '
	beq	L000234
	cmp.b	#$09,d0
	beq	L000234
	cmp.b	#$2f,d0			;'/'
	beq	L000234
	cmp.b	#$2d,d0			;'-'
	beq	L000234
	lea.l	($0001,a2),a2
	move.b	d0,(a0)+
	bra	L000210

L000234:
	clr.b	(a0)
	bra	L00004e

L00023a:
	lea.l	(L000778),a0
	tst.b	(a0)
	beq	L00025a
	clr.w	-(a7)
	move.l	a0,-(a7)
	DOS	_OPEN
	addq.l	#6,a7
	tst.l	d0
	bmi	L0005f0
	move.w	d0,(L000774)
	bra	L000280

L00025a:
	clr.w	-(a7)
	DOS	_DUP
	addq.l	#2,a7
	tst.l	d0
	bmi	L0005f0
	move.w	d0,(L000774)
	clr.w	-(a7)
	DOS	_CLOSE
	addq.l	#2,a7
	move.w	#$0002,-(a7)
	DOS	_DUP
	addq.l	#2,a7
	tst.l	d0
	bmi	L0005f0
L000280:
	lea.l	(L000c02),a0
L000286:
	move.l	(L000770),d0
	sub.l	a0,d0
	move.l	d0,-(a7)
	move.l	a0,-(a7)
	move.w	(L000774),-(a7)
	DOS	_READ
	lea.l	($000a,a7),a7
	tst.l	d0
	ble	L0002b0
	lea.l	(a0,d0.l),a0
	cmpi.b	#$1a,(-$0001,a0)
	beq	L0002b0
	bra	L000286

L0002b0:
	move.l	a0,d0
	lea.l	(L000c02),a0
	sub.l	a0,d0
	move.l	d0,(L0007fa)
	addq.l	#1,d0
	and.b	#$fe,d0
	cmp.l	(L000770),d0
	bge	L0005f8
	lea.l	(a0,d0.l),a0
	move.l	a0,(L0007fe)
	move.w	(L000774),-(a7)
	DOS	_CLOSE
	addq.l	#2,a7
	lea.l	(L000c02),a0
	move.l	(L000770),d5
	add.l	a0,d5
	sub.l	(L0007fe),d5
	moveq.l	#$0a,d1
	clr.l	d2
	moveq.l	#$1f,d3
L0002fe:
	lsl.l	#1,d5
	roxl.l	#1,d2
	cmp.l	d1,d2
	bcs	L00030c
	bset.l	#$00,d5
	sub.l	d1,d2
L00030c:
	dbra	d3,L0002fe
	subq.l	#1,d5
	move.l	(L0007fa),d4
	lea.l	(L000c02),a0
	movea.l	(L0007fe),a1
L000324:
	tst.l	d4
	ble	L0003ae
	subq.l	#1,d5
	beq	L0005f8
	move.l	a0,(a1)+
	clr.w	d1
L000334:
	addq.w	#1,d1
	move.b	(a0)+,d0
	cmp.b	#$1a,d0
	beq	L000350
	cmp.b	#$0d,d0
	beq	L00035c
	subq.l	#1,d4
	beq	L000364
	cmp.w	#$0200,d1
	bne	L000334
	bra	L000364

L000350:
	clr.l	d4
	subq.w	#1,d1
	bne	L000364
	lea.l	(-$0004,a1),a1
	bra	L0003ae

L00035c:
	addq.w	#1,d1
	lea.l	($0001,a0),a0
	subq.l	#2,d4
L000364:
	move.w	d1,(a1)+
	movea.l	(-$0006,a1),a2
	subq.w	#1,d1
	clr.w	d2
L00036e:
	cmp.w	(L000768),d2
	beq	L0003a8
	move.b	(a2),d0
	cmp.b	#$09,d0
	bne	L00039c
	move.w	d2,d0
	ext.l	d0
	divu.w	(L00076a),d0
	swap.w	d0
	move.w	#$0008,d3
	sub.w	d0,d3
	add.w	d3,d2
	cmp.w	(L000768),d2
	bgt	L0003a8
	bra	L00039e

L00039c:
	addq.w	#1,d2
L00039e:
	lea.l	($0001,a2),a2
	dbra	d1,L00036e
	suba.l	a2,a2
L0003a8:
	move.l	a2,(a1)+
	bra	L000324

L0003ae:
	clr.l	(a1)
	tst.w	(L000760)
	bne	L0004d2
	movea.l	(L0007fe),a0
L0003c0:
	tst.l	(a0)
	beq	L0005e6
	movea.l	a0,a5
	lea.l	($000a,a0),a1
	tst.l	($0006,a5)
	beq	L0004b4
L0003d4:
	tst.l	(a1)
	beq	L000492
	move.l	($0006,a1),d0
	beq	L000490
	movea.l	d0,a3
	movea.l	($0006,a5),a2
	move.w	($0004,a1),d1
	move.w	($0004,a5),d2
	tst.w	(L00076e)
	bne	L00040e
L0003f8:
	cmpm.b	(a2)+,(a3)+
	bhi	L000488
	bcs	L000486
	subq.w	#1,d1
	beq.w	L000486
	subq.w	#1,d2
	beq	L000488
	bra	L0003f8

L00040e:
	clr.w	d4
	clr.w	d5
L000412:
	move.b	(a3)+,d6
	tst.w	d4
	bne	L000442
	cmp.b	#$80,d6
	bcs	L00042a
	cmp.b	#$a0,d6
	bcs	L00043c
	cmp.b	#$e0,d6
	bcc	L00043c
L00042a:
	cmp.b	#$41,d6			;'A'
	bcs	L000442
	cmp.b	#$5a,d6			;'Z'
	bhi	L000442
	add.b	#$20,d6			;' '
	bra	L000442

L00043c:
	move.w	#$ffff,d4
	bra	L000444

L000442:
	clr.w	d4
L000444:
	move.b	(a2)+,d7
	tst.w	d5
	bne	L000474
	cmp.b	#$80,d7
	bcs	L00045c
	cmp.b	#$a0,d7
	bcs	L00046e
	cmp.b	#$e0,d7
	bcc	L00046e
L00045c:
	cmp.b	#$41,d7			;'A'
	bcs	L000474
	cmp.b	#$5a,d7			;'Z'
	bhi	L000474
	add.b	#$20,d7			;' '
	bra	L000474

L00046e:
	move.w	#$ffff,d5
	bra	L000476

L000474:
	clr.w	d5
L000476:
	cmp.b	d7,d6
	bhi	L000488
	bcs	L000486
	subq.w	#1,d1
	beq	L000486
	subq.w	#1,d2
	beq	L000488
	bra	L000412

L000486:
	movea.l	a1,a5
L000488:
	lea.l	($000a,a1),a1
	bra	L0003d4

L000490:
	movea.l	a1,a5
L000492:
	move.l	(a0),d5
	move.l	($0004,a0),d6
	move.w	($0008,a0),d7
	move.l	(a5),(a0)
	move.l	($0004,a5),($0004,a0)
	move.w	($0008,a5),($0008,a0)
	move.l	d5,(a5)
	move.l	d6,($0004,a5)
	move.w	d7,($0008,a5)
L0004b4:
	move.w	($0004,a0),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	(a0),-(a7)
	move.w	(L000776),-(a7)
	DOS	_WRITE
	lea.l	($000a,a7),a7
	lea.l	($000a,a0),a0
	bra	L0003c0

L0004d2:
	movea.l	(L0007fe),a0
L0004d8:
	tst.l	(a0)
	beq	L0005e6
	movea.l	a0,a5
	lea.l	($000a,a0),a1
L0004e4:
	tst.l	(a1)
	beq	L0005a6
	move.l	($0006,a1),d0
	beq	L00059e
	movea.l	d0,a3
	move.l	($0006,a5),d0
	beq	L00059c
	movea.l	d0,a2
	move.w	($0004,a1),d1
	move.w	($0004,a5),d2
	tst.w	(L00076e)
	bne	L000524
L00050e:
	cmpm.b	(a2)+,(a3)+
	bhi	L00059c
	bcs	L00059e
	subq.w	#1,d1
	beq	L00059e
	subq.w	#1,d2
	beq	L00059c
	bra	L00050e

L000524:
	clr.w	d4
	clr.w	d5
L000528:
	move.b	(a3)+,d6
	tst.w	d4
	bne	L000558
	cmp.b	#$80,d6
	bcs	L000540
	cmp.b	#$a0,d6
	bcs	L000552
	cmp.b	#$e0,d6
	bcc	L000552
L000540:
	cmp.b	#$41,d6			;'A'
	bcs	L000558
	cmp.b	#$5a,d6			;'Z'
	bhi	L000558
	add.b	#$20,d6			;' '
	bra	L000558

L000552:
	move.w	#$ffff,d4
	bra	L00055a

L000558:
	clr.w	d4
L00055a:
	move.b	(a2)+,d7
	tst.w	d5
	bne	L00058a
	cmp.b	#$80,d7
	bcs	L000572
	cmp.b	#$a0,d7
	bcs	L000584
	cmp.b	#$e0,d7
	bcc	L000584
L000572:
	cmp.b	#$41,d7			;'A'
	bcs	L00058a
	cmp.b	#$5a,d7			;'Z'
	bhi	L00058a
	add.b	#$20,d7			;' '
	bra	L00058a

L000584:
	move.w	#$ffff,d5
	bra	L00058c

L00058a:
	clr.w	d5
L00058c:
	cmp.b	d7,d6
	bhi	L00059c
	bcs	L00059e
	subq.w	#1,d1
	beq	L00059e
	subq.w	#1,d2
	beq	L00059c
	bra	L000528

L00059c:
	movea.l	a1,a5
L00059e:
	lea.l	($000a,a1),a1
	bra	L0004e4

L0005a6:
	move.l	(a0),d5
	move.l	($0004,a0),d6
	move.w	($0008,a0),d7
	move.l	(a5),(a0)
	move.l	($0004,a5),($0004,a0)
	move.w	($0008,a5),($0008,a0)
	move.l	d5,(a5)
	move.l	d6,($0004,a5)
	move.w	d7,($0008,a5)
	move.w	($0004,a0),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	(a0),-(a7)
	move.w	(L000776),-(a7)
	DOS	_WRITE
	lea.l	($000a,a7),a7
	lea.l	($000a,a0),a0
	bra	L0004d8

L0005e6:
	bra	L000620

L0005e8:
	pea.l	(L000706)
	bra	L0005fe

L0005f0:
	pea.l	(L00071d)
	bra	L0005fe

L0005f8:
	pea.l	(L00073c)
L0005fe:
	pea.l	(L000644)
	DOS	_PRINT
	addq.l	#4,a7
	DOS	_PRINT
	addq.l	#4,a7
	pea.l	(L000650)
	DOS	_PRINT
	addq.l	#4,a7
	move.w	#$0001,(L0007f8)
	bra	L000626

L000620:
	clr.w	(L0007f8)
L000626:
	move.w	(L0007f8),-(a7)
	DOS	_EXIT2

L00062e:
	move.b	(a2),d0
	cmp.b	#$20,d0			;' '
	beq	L00063c
	cmp.b	#$09,d0
	bne	L000642
L00063c:
	lea.l	($0001,a2),a2
	bra	L00062e

L000642:
	rts

L000644:
	.dc.b	'Sort v1.0',$0d,$0a,$00
L000650:
	.dc.b	'使用法: sort [スイッチ] [ファイル名]',$0d,$0a
	.dc.b	'        /r        降順',$0d,$0a
	.dc.b	'        /i        大文字小文字の区別なし',$0d,$0a
	.dc.b	'        /kn       キーの位置 n=1～512',$0d,$0a
	.dc.b	'        /tn       タブサイズ n=1～99',$0d,$0a,$00
L000706:
	.dc.b	'パラメータが無効です',$0d,$0a,$00
L00071d:
	.dc.b	'ファイルがオープンできません',$0d,$0a,$00
L00073c:
	.dc.b	'ファイルが大きすぎます',$0d,$0a,$00,$00
L000756:
	.dc.b	$00,$01,$00,$0a,$00,$64,$03,$e8,$27,$10

	.bss

L000760:
	.ds.w	1
L000762:
	.ds.w	1
L000764:
	.ds.w	1
L000766:
	.ds.w	1
L000768:
	.ds.w	1
L00076a:
	.ds.w	1
L00076c:
	.ds.w	1
L00076e:
	.ds.w	1
L000770:
	.ds.l	1
L000774:
	.ds.w	1
L000776:
	.ds.w	1
L000778:
	.ds.b	128
L0007f8:
	.ds.w	1
L0007fa:
	.ds.l	1
L0007fe:
	.ds.b	1028
L000c02:

	.end	L000000
