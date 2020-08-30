;=============================================
;  Filename more.x
;
;
;  Base address 000000
;  Exec address 000000
;  Text size    000512 byte(s)
;  Data size    0000b6 byte(s)
;  Bss  size    000f54 byte(s)
;  97 Labels
;
;  Commandline dis  -b2 -h -m68000 --sp -q1 -B -M -o120 -gmore.lab --overwrite more.x more.s
;          DIS version 3.16
;=============================================

	.include	inc/doscall.mac
	.include	inc/iocscall.mac
	.include	inc/fefunc.mac

	.cpu	68000

	.text

L000000:
	lea.l	(L00151a),sp
	bsr.w	L0004f4
	clr.b	(L000802)
	movea.l	(L000000-$0000e0),a0
	addq.l	#1,a0
	lea.l	(L0005d2),a1
	lea.l	(L0006ea),a2
	bsr.w	L000232
	tst.b	(L0006ea)
	bne.w	L000172
	tst.l	d0
	beq.s	L00006e
	cmp.l	#$00000001,d0
	bne.w	L000172
	lea.l	(L0005d2),a1
	lea.l	(L000802),a0
	bsr.w	L0002de
	bsr.w	L0002fe
	clr.w	-(sp)
	pea.l	(L000802)
	DOS	_OPEN
	addq.l	#6,sp
	tst.l	d0
	bmi.w	L00018e
	move.w	d0,(L0005ca)
	bra.s	L000072

L00006e:
	bsr.w	L0004d8
L000072:
	lea.l	(L000d1a),a2
	clr.l	d4
	clr.l	d5
	clr.b	d6
	clr.b	d7
L000080:
	bsr.w	L0001bc
	clr.b	d3
L000086:
	clr.b	d2
L000088:
	bsr.w	L000472
	tst.l	d0
	bmi.w	L000196
	beq.w	L00013c
	tst.b	d6
	bne.s	L0000ca
	cmp.b	#$80,d1
	bcs.s	L0000e6
	cmp.b	#$a0,d1
	bcs.s	L0000ac
	cmp.b	#$e0,d1
	bcs.s	L0000e6
L0000ac:
	move.b	d1,d7
	move.b	#$01,d6
	cmp.b	#$80,d1
	beq.s	L000088
	cmp.b	#$f0,d1
	bcc.s	L000088
	cmp.b	(L0005c8),d2
	bcc.s	L000120
	addq.b	#1,d2
	bra.s	L000088

L0000ca:
	clr.b	d6
	move.b	d7,d0
	bsr.w	L0004a2
	tst.l	d0
	bmi.w	L00019e
	move.b	d1,d0
	bsr.w	L0004a2
	tst.l	d0
	bmi.w	L00019e
	bra.s	L000112

L0000e6:
	cmp.b	#$1a,d1
	beq.s	L00013c
	move.b	d1,d0
	bsr.w	L0004a2
	tst.l	d0
	bmi.w	L00019e
	cmp.b	#$0a,d1
	beq.s	L00011e
	cmp.b	#$0d,d1
	beq.s	L000088
	cmp.b	#$09,d1
	bne.s	L000112
	addq.b	#8,d2
	and.b	#$f8,d2
	bra.s	L000114

L000112:
	addq.b	#1,d2
L000114:
	cmp.b	(L0005c8),d2
	bls.w	L000088
L00011e:
	clr.b	d2
L000120:
	bsr.w	L0004b0
	tst.l	d0
	bmi.s	L00019e
	addq.b	#1,d3
	cmp.b	(L0005c9),d3
	bne.w	L000086
	bsr.w	L000206
	bra.w	L000080

L00013c:
	bsr.w	L0004b0
	tst.l	d0
	bmi.s	L00019e
	cmp.b	(L0005c9),d3
	bne.s	L000150
	bsr.w	L000206
L000150:
	tst.b	(L000802)
	beq.s	L000162
	move.w	(L0005ca),-(sp)
	DOS	_CLOSE
	addq.l	#2,sp
L000162:
	pea.l	(L0005c2)
	DOS	_PRINT
	addq.l	#4,sp
	clr.l	d0
L00016e:
	move.w	d0,-(sp)
	DOS	_EXIT2

L000172:
	lea.l	(L000519),a0
	bsr.w	L0002ec
	move.l	d0,-(sp)
	move.l	a0,-(sp)
	move.w	#$0002,-(sp)
	DOS	_WRITE
	lea.l	($000a,sp),sp
	moveq.l	#$01,d0
	bra.s	L00016e

L00018e:
	lea.l	(L000569),a0
	bra.s	L0001a4

L000196:
	lea.l	(L00058e),a0
	bra.s	L0001a4

L00019e:
	lea.l	(L0005a8),a0
L0001a4:
	bsr.w	L0002ec
	move.l	d0,-(sp)
	move.l	a0,-(sp)
	move.w	#$0002,-(sp)
	DOS	_WRITE
	lea.l	($000a,sp),sp
	move.w	#$0002,d0
	bra.s	L00016e

L0001bc:
	movem.l	d0-d1,-(sp)
	move.w	#$ffff,-(sp)
	move.w	#$000e,-(sp)
	DOS	_CONCTRL
	addq.l	#4,sp
	move.b	#$1e,d1
	cmp.b	#$03,d0
	bne.s	L0001da
	move.b	#$1f,d1
L0001da:
	move.b	d1,(L0005c9)
	move.w	#$ffff,-(sp)
	move.w	#$0010,-(sp)
	DOS	_CONCTRL
	addq.l	#4,sp
	move.b	#$3f,d1			;'?'
	cmp.b	#$01,d0
	bhi.s	L0001fa
	move.b	#$5f,d1			;'_'
L0001fa:
	move.b	d1,(L0005c8)
	movem.l	(sp)+,d0-d1
	rts

L000206:
	tst.b	d2
	beq.s	L000214
	pea.l	(L0005c5)
	DOS	_PRINT
	addq.l	#4,sp
L000214:
	pea.l	(L000512)
	DOS	_PRINT
	addq.l	#4,sp
	move.w	#$0008,-(sp)
	DOS	_KFLUSH
	addq.l	#2,sp
	pea.l	(L0005c2)
	DOS	_PRINT
	addq.l	#4,sp
	rts

L000232:
	movem.l	d1/a0-a2,-(sp)
	clr.l	d1
L000238:
	bsr.w	L0002c4
	adda.l	d0,a0
	tst.b	(a0)
	beq.s	L0002b4
	move.b	(a0)+,d0
	cmp.b	#$2d,d0			;'-'
	beq.s	L000250
	cmp.b	#$2f,d0			;'/'
	bne.s	L000266
L000250:
	move.b	(a0)+,d0
	beq.s	L0002b4
	cmp.b	#$09,d0
	beq.s	L000262
	cmp.b	#$20,d0			;' '
	beq.s	L000262
	move.b	d0,(a2)+
L000262:
	clr.b	(a2)+
	bra.s	L000238

L000266:
	addq.l	#1,d1
L000268:
	move.b	d0,(a1)+
	cmp.b	#$22,d0			;'"'
	bne.s	L00027e
L000270:
	move.b	(a0)+,d0
	beq.s	L0002b4
	move.b	d0,(a1)+
	cmp.b	#$22,d0			;'"'
	bne.s	L000270
	bra.s	L000290

L00027e:
	cmp.b	#$27,d0			;'''
	bne.s	L000290
L000284:
	move.b	(a0)+,d0
	beq.s	L0002b4
	move.b	d0,(a1)+
	cmp.b	#$27,d0			;'''
	bne.s	L000284
L000290:
	move.b	(a0),d0
	beq.s	L0002b4
	cmp.b	#$2f,d0			;'/'
	beq.s	L0002b0
	cmp.b	#$2d,d0			;'-'
	beq.s	L0002b0
	addq.l	#1,a0
	cmp.b	#$09,d0
	beq.s	L0002b0
	cmp.b	#$20,d0			;' '
	beq.s	L0002b0
	bra.s	L000268

L0002b0:
	clr.b	(a1)+
	bra.s	L000238

L0002b4:
	clr.b	(a1)+
	clr.b	(a1)
	clr.b	(a2)+
	clr.b	(a2)
	move.l	d1,d0
	movem.l	(sp)+,d1/a0-a2
	rts

L0002c4:
	move.l	a0,-(sp)
L0002c6:
	move.b	(a0)+,d0
	cmpi.b	#$20,d0			;' '
	beq.s	L0002c6
	cmpi.b	#$09,d0
	beq.s	L0002c6
	move.l	a0,d0
	movea.l	(sp)+,a0
	sub.l	a0,d0
	subq.l	#1,d0
	rts

L0002de:
	movem.l	a0-a1,-(sp)
L0002e2:
	move.b	(a1)+,(a0)+
	bne.s	L0002e2
	movem.l	(sp)+,a0-a1
	rts

L0002ec:
	move.l	a0,-(sp)
	moveq.l	#$ff,d0
L0002f0:
	addi.l	#$00000001,d0
	tst.b	(a0)+
	bne.s	L0002f0
	movea.l	(sp)+,a0
	rts

L0002fe:
	link.w	a6,#-$003c
	movem.l	d0-d6/a1-a2,-(sp)
	move.w	#$ffff,d2
	movea.l	a0,a1
	bsr.s	L0002ec
	move.w	d0,d1
	tst.w	d1
	beq.w	L000452
	clr.b	d3
L000318:
	move.b	(a1)+,d4
	beq.s	L00034e
	tst.b	d3
	beq.s	L000336
	cmp.b	#$01,d3
	beq.s	L000330
	cmp.b	#$2e,d4			;'.'
	beq.s	L000336
	clr.b	d3
	bra.s	L000336

L000330:
	move.b	#$02,d3
	bra.s	L000318

L000336:
	cmp.b	#$80,d4
	bcs.s	L000318
	cmp.b	#$a0,d4
	bcs.s	L000348
	cmp.b	#$e0,d4
	bcs.s	L000318
L000348:
	move.b	#$01,d3
	bra.s	L000318

L00034e:
	subq.l	#1,a1
	tst.b	d3
	bne.s	L000370
	cmpi.b	#$5c,(-$0001,a1)	;'\'
	bne.s	L000370
	cmp.w	#$0001,d1
	beq.w	L000452
	cmpi.b	#$3a,(-$0002,a1)	;':'
	beq.w	L000452
	clr.b	-(a1)
L000370:
	cmpi.b	#$3a,(-$0001,a1)	;':'
	beq.w	L000452
	cmpi.b	#$2e,(-$0001,a1)	;'.'
	bne.s	L0003a8
	tst.b	d3
	bne.s	L0003a8
	cmp.w	#$0001,d1
	beq.s	L00039c
	cmpi.b	#$3a,(-$0002,a1)	;':'
	beq.s	L00039c
	cmpi.b	#$5c,(-$0002,a1)	;'\'
	bne.s	L0003a8
L00039c:
	move.b	#$2a,(-$0001,a1)	;'*'
	move.b	#$2e,(a1)+		;'.'
	clr.b	(a1)
L0003a8:
	movea.l	a0,a2
L0003aa:
	move.b	(a2)+,d0
	beq.s	L0003bc
	cmp.b	#$2a,d0			;'*'
	beq.s	L0003d8
	cmp.b	#$3f,d0			;'?'
	beq.s	L0003d8
	bra.s	L0003aa

L0003bc:
	move.w	#$0010,-(sp)
	move.l	a0,-(sp)
	pea.l	(-$003c,a6)
	DOS	_FILES
	lea.l	($000a,sp),sp
	tst.l	d0
	bmi.s	L0003d8
	btst.b	#$04,(-$0027,a6)
	bne.s	L00044e
L0003d8:
	clr.b	d3
	movea.l	a0,a2
	clr.b	d5
	clr.b	d6
L0003e0:
	move.b	(a2)+,d0
	beq.s	L000446
	tst.b	d3
	beq.s	L0003ec
	clr.b	d3
	bra.s	L0003e0

L0003ec:
	cmp.b	#$80,d0
	bcs.s	L000408
	cmp.b	#$a0,d0
	bcs.s	L0003fe
	cmp.b	#$e0,d0
	bcs.s	L000408
L0003fe:
	move.b	#$01,d3
	move.b	#$20,d5			;' '
	bra.s	L0003e0

L000408:
	cmp.b	#$2e,d0			;'.'
	bne.s	L000428
	tst.b	d5
	beq.s	L000424
	cmp.b	#$3a,d5			;':'
	beq.s	L000424
	cmp.b	#$5c,d5			;'\'
	beq.s	L000424
	cmp.b	#$2e,d5			;'.'
	bne.s	L000428
L000424:
	tst.b	(a2)
	beq.s	L00044e
L000428:
	cmpi.b	#$5c,(a2)		;'\'
	bne.s	L000434
	tst.b	($0001,a2)
	beq.s	L000452
L000434:
	move.b	d0,d5
	cmp.b	#$2e,d0			;'.'
	beq.s	L000442
	cmp.b	#$5c,d0			;'\'
	bne.s	L0003e0
L000442:
	move.b	d0,d6
	bra.s	L0003e0

L000446:
	cmp.b	#$2e,d6			;'.'
	beq.s	L00046a
	bra.s	L000458

L00044e:
	move.b	#$5c,(a1)+		;'\'
L000452:
	move.b	#$2a,(a1)+		;'*'
	clr.w	d2
L000458:
	move.b	#$2e,(a1)+		;'.'
	move.b	#$2a,(a1)+		;'*'
	tst.w	d2
	beq.s	L000468
	clr.b	(-$0001,a1)
L000468:
	clr.b	(a1)
L00046a:
	movem.l	(sp)+,d0-d6/a1-a2
	unlk	a6
	rts

L000472:
	tst.l	d4
	bne.s	L00049a
	move.l	#$00000400,-(sp)
	pea.l	(L00091a)
	move.w	(L0005ca),-(sp)
	DOS	_READ
	lea.l	($000a,sp),sp
	lea.l	(L00091a),a1
	tst.l	d0
	bls.s	L0004a0
	move.l	d0,d4
L00049a:
	move.b	(a1)+,d1
	subq.l	#1,d4
	moveq.l	#$01,d0
L0004a0:
	rts

L0004a2:
	move.b	d0,(a2)+
	addq.l	#1,d5
	moveq.l	#$01,d0
	cmp.l	#$00000400,d5
	bne.s	L0004d6
L0004b0:
	tst.l	d5
	beq.s	L0004d6
	move.l	d5,-(sp)
	pea.l	(L000d1a)
	move.w	(L0005cc),-(sp)
	DOS	_WRITE
	lea.l	($000a,sp),sp
	tst.l	d0
	bmi.s	L0004d6
	clr.l	d5
	lea.l	(L000d1a),a2
	moveq.l	#$01,d0
L0004d6:
	rts

L0004d8:
	clr.w	-(sp)
	DOS	_DUP
	tst.l	d0
	bmi.w	L000196
	move.w	d0,(L0005ca)
	DOS	_CLOSE
	move.w	#$0002,(sp)
	DOS	_DUP
	addq.l	#2,sp
	rts

L0004f4:
	move.w	#$0001,-(sp)
	DOS	_DUP
	tst.l	d0
	bmi.w	L000196
	move.w	d0,(L0005cc)
	DOS	_CLOSE
	move.w	#$0002,(sp)
	DOS	_DUP
	addq.l	#2,sp
	rts


	.data

L000512:
	.dc.b	'-more-',$00
L000519:
	.dc.b	'使用法：more［ファイル名］',$0d,$0a
	.dc.b	$09,'ファイル名を指定しない場合、標準入力から入力する',$0d,$0a,$00
L000569:
	.dc.b	'more: ファイルがオ－プンできません',$0d,$0a,$00
L00058e:
	.dc.b	'more: 読み込みできません',$0d,$0a
L0005a8:
	.dc.b	'more: 書き込みできません',$0d,$0a
L0005c2:
	.dc.b	$0d,$0a,$00
L0005c5:
	.dc.b	$20,$0d,$00

	.bss

L0005c8:
	.ds.b	1
L0005c9:
	.ds.b	1
L0005ca:
	.ds.w	1
L0005cc:
	.ds.b	6
L0005d2:
	.ds.b	280
L0006ea:
	.ds.b	280
L000802:
	.ds.b	280
L00091a:
	.ds.b	1024
L000d1a:
	.ds.b	2048
L00151a:
	.ds.b	2
L00151c:

	.end	L000000
