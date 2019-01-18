;=============================================
;  Filename iplromxv.dat
;  Time Stamp Sat Apr 15 21:04:00 2000
;
;  Base address fe0000
;  Exec address ff0010
;  Text size    020000 byte(s)
;  Data size    000000 byte(s)
;  Bss  size    000000 byte(s)
;  4751 Labels
;
;  Commandline dis  -b2 -h -i -m68030 -m68882 -zfe0000,ff0010 -q -p -B -M --exclude-fefunc-mac -Tiplromxv.tab -giplromxv.lab --overwrite iplromxv.dat iplromxv.s
;          DIS version 3.16
;=============================================

	.include	inc/doscall.mac
	.include	inc/iocscall.mac

	.cpu	68030

	.text

Lfe0000:
	move.l	a0,-(a7)
	lea.l	($00001000).l,a0
	move.w	#$01a4,d0
Lfe000c:
	clr.w	(a0)+
	dbra.w	d0,Lfe000c
	movea.l	(a7)+,a0
	lea.l	($00001000).l,a6
	move.l	d0,($013e,a6)
	andi.w	#$f8ff,sr
	move.w	(Lfe0058),d0
	andi.l	#$0000000f,d0
	asl.l	#2,d0
	movea.l	d0,a0
	move.l	#Lfe2d3e,($0080,a0)
	move.w	sr,($0042,a6)
	move.l	a7,($0136,a6)
	move.l	#Lfe2d3e,($0046,a6)
	move.l	#Lfe3c64,($0142,a6)
	bra.s	Lfe006e

Lfe0054:
	bra.w	Lfe0146

Lfe0058:
	.dc.w	$4e48
Lfe005a:
	tst.w	($00001754).l
	bne.w	Lfe2e1e
	move.b	#$0c,($00e8e007)
	rte

Lfe006e:
	lea.l	($00001000).l,a6
	bsr.w	Lfe3bc2
	bsr.w	Lfe40fe
	move.l	#Lfe005a,($0000007c).l
	move.l	#$ffffffff,($0120,a6)
	clr.l	($0126,a6)
	move.l	($013e,a6),($0092,a6)
	move.l	#$00001548,($009a,a6)
	move.l	#$00000000,($009e,a6)
	move.w	#$0001,($004a,a6)
	move.w	#$ffff,($01e0,a6)
	clr.w	($00001754).l
	clr.w	($00001756).l
	bsr.w	Lfe043e
	move.w	#$ffff,($00001754).l
	lea.l	(Lfe00d6,pc),a0
	bsr.w	Lfe4bc8
	rts

Lfe00d6:
	.dc.b	$0d,$0d,$0a
	.dc.b	'ROM debugger Ver 1.0',$0d,$0a
	.dc.b	'Copyright Hudson soft 1987',$0d,$0a,$00
Lfe010c:
	.dc.b	'program terminated normally',$0d,$0a,$00
Lfe012a:
	lea.l	($00001748).l,a7
	lea.l	($00001000).l,a6
	bsr.w	Lfe2c88
	bsr.s	Lfe016c
	movea.l	#Lfe010c,a0
	bsr.w	Lfe4bc8
Lfe0146:
	clr.w	($00001756).l
	clr.w	($00001754).l
	movea.l	#$00001748,a7
	movea.l	#$00001000,a6
	andi.w	#$f8ff,sr
	bsr.w	Lfe4ada
	bsr.w	Lfe01f2
	bra.s	Lfe0146

Lfe016c:
	rts

Lfe016e:
	.dc.b	$00,$41,$00,$fe,$16,$b2,$00,$44
	.dc.b	$00,$fe,$47,$5a,$00,$46,$00,$fe
	.dc.b	$04,$40,$00,$47,$00,$fe,$28,$9c
	.dc.b	$00,$48,$00,$fe,$36,$8a,$00,$4c
	.dc.b	$00,$fe,$06,$0e,$00,$42,$00,$fe
	.dc.b	$3f,$1e,$00,$4d,$00,$fe,$04,$cc
	.dc.b	$00,$52,$00,$fe,$2e,$fc,$00,$57
	.dc.b	$00,$fe,$2f,$24,$00,$45,$00,$fe
	.dc.b	$48,$ee,$00,$54,$00,$fe,$29,$96
	.dc.b	$00,$55,$00,$fe,$29,$9c,$00,$58
	.dc.b	$00,$fe,$2f,$54,$00,$3f,$00,$fe
	.dc.b	$03,$da,$00,$5a,$00,$fe,$03,$46
	.dc.b	$00,$56,$00,$fe,$04,$3e,$00,$59
	.dc.b	$00,$fe,$05,$be,$00,$5c,$00,$fe
	.dc.b	$06,$06,$00,$53,$00,$fe,$34,$18
	.dc.b	$00,$4f,$00,$fe,$03,$3e,$ff,$00
	.dc.b	$ff,$ff,$ff,$ff
Lfe01f2:
	lea.l	($0206,a6),a5
Lfe01f6:
	bsr.w	Lfe4cc2
	tst.b	d0
	beq.s	Lfe022c
	cmpi.b	#$3a,d0			;':'
	bne.s	Lfe0208
	addq.l	#1,a5
	bra.s	Lfe01f6

Lfe0208:
	move.l	a5,($003e,a6)
	addq.l	#1,a5
	bsr.s	Lfe027c
	bcs.s	Lfe022e
	bsr.w	Lfe029c
	move.l	a5,($003e,a6)
	bsr.w	Lfe4cc2
	tst.b	d0
	beq.s	Lfe022c
	cmpi.b	#$3a,d0			;':'
	bne.s	Lfe022e
	addq.l	#1,a5
	bra.s	Lfe01f6

Lfe022c:
	rts

Lfe022e:
	movea.l	#Lfe0256,a0
	bsr.w	Lfe4bc8
	movea.l	($003e,a6),a0
	bsr.w	Lfe4bc8
	bsr.w	Lfe4bb8
	bra.w	Lfe0146

Lfe0248:
	lea.l	(Lfe026a),a0
	bsr.w	Lfe4bc8
	bra.w	Lfe0146

Lfe0256:
	.dc.b	'Command error at ',$0d,$0a,$00
Lfe026a:
	.dc.b	'Bad parameter.',$0d,$0a,$00,$00
Lfe027c:
	bsr.w	Lfe4de2
	movea.l	#Lfe016e,a0
Lfe0286:
	tst.b	(a0)+
	beq.s	Lfe0290
	ori.b	#$01,ccr
	rts

Lfe0290:
	cmp.b	(a0)+,d0
	beq.s	Lfe0298
	addq.l	#4,a0
	bra.s	Lfe0286

Lfe0298:
	movea.l	(a0),a4
	rts

Lfe029c:
	jmp	(a4)

Lfe029e:
	bsr.w	Lfe4cc2
	clr.w	($0000.w,a6)
	pea.l	($0002,a6)
Lfe02aa:
	move.b	(a5),d0
	cmp.b	#$2c,d0			;','
	beq.s	Lfe02d4
	cmpi.w	#$0001,($0000.w,a6)
	bne.s	Lfe02da
	bsr.w	Lfe4de2
	cmp.b	#$4c,d0			;'L'
	bne.s	Lfe02da
	addq.l	#1,a5
	bsr.w	Lfe4238
	bcs.s	Lfe0306
	add.l	($0002,a6),d6
	subq.l	#1,d6
	bra.s	Lfe02e0

Lfe02d4:
	movea.l	(a7),a0
	move.l	(a0),d6
	bra.s	Lfe02e0

Lfe02da:
	bsr.w	Lfe4238
	bcs.s	Lfe0306
Lfe02e0:
	addq.w	#1,($0000.w,a6)
	movea.l	(a7),a0
	move.l	d6,(a0)+
	move.l	a0,(a7)
	cmpi.w	#$0008,($0000.w,a6)
	bcc.s	Lfe0306
	cmpi.b	#$2c,d0			;','
	beq.s	Lfe02fe
	cmp.b	#$20,d0			;' '
	bne.s	Lfe0306
Lfe02fe:
	addq.l	#1,a5
	bsr.w	Lfe4cc2
	bra.s	Lfe02aa

Lfe0306:
	bsr.w	Lfe4cc2
	tst.b	d0
	beq.s	Lfe0316
	cmp.b	#$3a,d0			;':'
	bne.w	Lfe0248
Lfe0316:
	addq.l	#4,a7
	rts

Lfe031a:
	lea.l	($000017d8).l,a0
	movea.l	a0,a1
	clr.b	(a0)+
	bsr.w	Lfe4cc2
	tst.b	d0
	beq.s	Lfe0338
Lfe032c:
	addq.b	#1,(a1)
	move.b	(a5)+,d0
	move.b	d0,(a0)+
	bne.s	Lfe032c
	subq.l	#1,a5
	subq.b	#1,(a1)
Lfe0338:
	clr.b	(a0)
	rts

Lfe033c:
	rts

Lfe033e:
	eori.w	#$ffff,($01e2,a6)
	rts

Lfe0346:
	move.b	(a5),d0
	beq.s	Lfe035e
	cmp.b	#$3a,d0			;':'
	beq.s	Lfe035e
	cmp.b	#$30,d0			;'0'
	bcs.s	Lfe035c
	cmp.b	#$39,d0			;'9'
	bls.s	Lfe03a4
Lfe035c:
	rts

Lfe035e:
	lea.l	($01b8,a6),a1
	moveq.l	#$30,d2			;'0'
Lfe0364:
	moveq.l	#$5a,d0			;'Z'
	bsr.w	Lfe4b72
	move.b	d2,d0
	bsr.w	Lfe4b72
	moveq.l	#$3a,d0			;':'
	bsr.w	Lfe4b72
	move.l	(a1)+,d1
	bsr.w	Lfe4c22
	move.l	d1,d0
	bsr.w	Lfe3f1a
	tst.l	d0
	bmi.s	Lfe0396
	movea.l	d0,a0
	bsr.w	Lfe4bc0
	moveq.l	#$2e,d0			;'.'
	bsr.w	Lfe4b72
	bsr.w	Lfe4bc8
Lfe0396:
	bsr.w	Lfe4bb8
	addq.b	#1,d2
	cmp.b	#$39,d2			;'9'
	bls.s	Lfe0364
	rts

Lfe03a4:
	addq.l	#1,a5
	cmpi.b	#$3d,(a5)		;'='
	bne.w	Lfe022e
	addq.l	#1,a5
	bsr.w	Lfe4cc2
	tst.w	d0
	beq.w	Lfe022e
	clr.l	d2
	move.b	(-$0002,a5),d2
	sub.w	#$0030,d2
	lsl.l	#2,d2
	lea.l	($01b8,a6),a1
	lea.l	(a1,d2.w),a1
	bsr.w	Lfe4238
	bcs.w	Lfe0248
	move.l	d6,(a1)
	rts

Lfe03da:
	move.w	#$0002,($016e,a6)
	bsr.w	Lfe4cc2
	cmpi.b	#$3f,d0			;'?'
	bne.s	Lfe03f2
	move.w	#$0001,($016e,a6)
	bra.s	Lfe0400

Lfe03f2:
	bsr.w	Lfe4de2
	cmpi.b	#$50,d0			;'P'
	bne.s	Lfe0402
	clr.w	($016e,a6)
Lfe0400:
	addq.l	#1,a5
Lfe0402:
	tst.b	(a5)
	beq.w	Lfe0248
	bsr.w	Lfe4238
	cmpi.w	#$0001,($016e,a6)
	bhi.s	Lfe0428
	beq.s	Lfe0420
	move.w	d6,d0
	bsr.w	Lfe4b72
	bra.w	Lfe4bb8

Lfe0420:
	bsr.w	Lfe4bdc
	bra.w	Lfe4bb8

Lfe0428:
	move.l	d6,d1
	bsr.w	Lfe4c22
	bra.w	Lfe4bb8

Lfe0432:
	lea.l	(Lfe043a,pc),a0
	bra.w	Lfe4bc8

Lfe043a:
	.dc.b	'?',$0d,$0a,$00
Lfe043e:
	rts

Lfe0440:
	move.w	#$0001,($016e,a6)
	bsr.w	Lfe4cc2
	bsr.w	Lfe4de2
	cmpi.b	#$4c,d0			;'L'
	bne.s	Lfe045c
	move.w	#$0002,($016e,a6)
	bra.s	Lfe046c

Lfe045c:
	cmpi.b	#$57,d0			;'W'
	beq.s	Lfe046c
	cmpi.b	#$53,d0			;'S'
	bne.s	Lfe046e
	clr.w	($016e,a6)
Lfe046c:
	addq.l	#1,a5
Lfe046e:
	move.l	($0096,a6),($0002,a6)
	bsr.w	Lfe029e
	cmpi.w	#$0003,($0000.w,a6)
	bne.w	Lfe022e
	move.l	($0006,a6),d7
	cmp.l	($0002,a6),d7
	bls.w	Lfe022e
	move.l	($0002,a6),d6
	tst.w	($016e,a6)
	beq.s	Lfe04a4
	btst.l	#$00,d6
	bne.w	Lfe022e
	bclr.l	#$00,d7
Lfe04a4:
	move.l	($000a,a6),d5
	movea.l	d6,a0
	cmpi.w	#$0001,($016e,a6)
	bhi.s	Lfe04c4
	beq.s	Lfe04bc
Lfe04b4:
	move.b	d5,(a0)+
	cmpa.l	d7,a0
	bls.s	Lfe04b4
	rts

Lfe04bc:
	move.w	d5,(a0)+
	cmpa.l	d7,a0
	bls.s	Lfe04bc
	rts

Lfe04c4:
	move.l	d5,(a0)+
	cmpa.l	d7,a0
	bls.s	Lfe04c4
	rts

Lfe04cc:
	move.w	#$0001,($016e,a6)
	bsr.w	Lfe4cc2
	bsr.w	Lfe4de2
	cmpi.b	#$4c,d0			;'L'
	bne.s	Lfe04e8
	move.w	#$0002,($016e,a6)
	bra.s	Lfe04f8

Lfe04e8:
	cmpi.b	#$57,d0			;'W'
	beq.s	Lfe04f8
	cmpi.b	#$53,d0			;'S'
	bne.s	Lfe04fa
	clr.w	($016e,a6)
Lfe04f8:
	addq.l	#1,a5
Lfe04fa:
	move.l	($0096,a6),($0002,a6)
	bsr.w	Lfe029e
	cmpi.w	#$0003,($0000.w,a6)
	bne.w	Lfe0248
	move.l	($0006,a6),d7
	cmp.l	($0002,a6),d7
	bls.w	Lfe0248
	move.l	($0002,a6),d6
	move.l	($000a,a6),d5
	tst.w	($016e,a6)
	beq.s	Lfe0540
	btst.l	#$00,d7
	beq.w	Lfe0248
	btst.l	#$00,d6
	bne.w	Lfe0248
	btst.l	#$00,d5
	bne.w	Lfe0248
Lfe0540:
	move.l	d7,d0
	sub.l	d6,d0
	cmp.l	d6,d5
	bcc.s	Lfe057e
	movea.l	d6,a0
	movea.l	d5,a1
	cmpi.w	#$0001,($016e,a6)
	bcc.s	Lfe0566
	swap.w	d0
Lfe0556:
	swap.w	d0
Lfe0558:
	move.b	(a0)+,(a1)+
	dbra.w	d0,Lfe0558
	swap.w	d0
	dbra.w	d0,Lfe0556
	rts

Lfe0566:
	addq.l	#1,d0
	lsr.l	#1,d0
	subq.l	#1,d0
	swap.w	d0
Lfe056e:
	swap.w	d0
Lfe0570:
	move.w	(a0)+,(a1)+
	dbra.w	d0,Lfe0570
	swap.w	d0
	dbra.w	d0,Lfe056e
	rts

Lfe057e:
	movea.l	d7,a0
	movea.l	d5,a1
	adda.l	d0,a1
	cmpi.w	#$0001,($016e,a6)
	bcc.s	Lfe05a2
	addq.l	#1,a0
	addq.l	#1,a1
	swap.w	d0
Lfe0592:
	swap.w	d0
Lfe0594:
	move.b	-(a0),-(a1)
	dbra.w	d0,Lfe0594
	swap.w	d0
	dbra.w	d0,Lfe0592
	rts

Lfe05a2:
	addq.l	#1,a0
	addq.l	#1,a1
	addq.l	#1,d0
	lsr.l	#1,d0
	subq.l	#1,d0
	swap.w	d0
Lfe05ae:
	swap.w	d0
Lfe05b0:
	move.w	-(a0),-(a1)
	dbra.w	d0,Lfe05b0
	swap.w	d0
	dbra.w	d0,Lfe05ae
	rts

Lfe05be:
	cmpi.b	#$2f,(a5)		;'/'
	bne.w	Lfe022e
	move.b	($0001,a5),d0
	bsr.w	Lfe4de2
	cmp.b	#$4e,d0			;'N'
	bne.w	Lfe022e
	addq.l	#2,a5
	bsr.w	Lfe4bb8
	movea.l	#Lfe05fe,a0
	bsr.w	Lfe4bc8
	bsr.w	Lfe4bd2
	bsr.w	Lfe4de2
	cmpi.b	#$4e,d0			;'N'
	bne.w	Lfe4bb8
	bsr.w	Lfe4bb8
	bra.w	Lfe0146

Lfe05fe:
	.dc.b	'Y/N ? ',$00,$00
Lfe0606:
	lea.l	($0206,a6),a5
	rts

Lfe060c:
	rts

Lfe060e:
	cmpi.b	#$2d,(a5)		;'-'
	bne.s	Lfe063a
	addq.l	#1,a5
	move.l	($0032,a6),($0002,a6)
	bsr.w	Lfe029e
	bsr.w	Lfe4cc2
	tst.w	($0000.w,a6)
	beq.s	Lfe065a
	move.l	($0002,a6),d7
	neg.l	d7
	add.l	($0032,a6),d7
	move.l	d7,($0002,a6)
	bra.s	Lfe0662

Lfe063a:
	move.l	($0032,a6),($0002,a6)
	bsr.w	Lfe029e
	bsr.w	Lfe4cc2
	tst.w	($0000.w,a6)
	bne.s	Lfe0662
	tst.b	d0
	beq.s	Lfe065a
	cmpi.b	#$3a,d0			;':'
	bne.w	Lfe022e
Lfe065a:
	move.l	($0032,a6),($0002,a6)
	bra.s	Lfe0678

Lfe0662:
	cmpi.w	#$0001,($0000.w,a6)
	beq.s	Lfe0678
	move.l	($0006,a6),d7
	cmp.l	($0002,a6),d7
	bcs.w	Lfe022e
	bra.s	Lfe06b2

Lfe0678:
	move.w	#$0008,($001e,a6)
	move.l	($0002,a6),d0
	btst.l	#$00,d0
	bne.w	Lfe022e
	move.l	a5,($003e,a6)
	move.l	($0002,a6),($0032,a6)
	move.l	($0032,a6),($003a,a6)
	movea.l	($0032,a6),a5
Lfe069e:
	bsr.w	Lfe0724
	move.l	a5,($0032,a6)
	subq.w	#1,($001e,a6)
	bne.s	Lfe069e
	movea.l	($003e,a6),a5
	rts

Lfe06b2:
	move.l	($0002,a6),d0
	btst.l	#$00,d0
	bne.w	Lfe022e
	cmp.l	($0006,a6),d0
	bhi.w	Lfe022e
	move.l	a5,($003e,a6)
	movea.l	d0,a5
	move.l	($0032,a6),($003a,a6)
	move.l	d0,($0032,a6)
	move.l	($0006,a6),($001e,a6)
Lfe06dc:
	bsr.s	Lfe0724
	move.l	a5,($0032,a6)
	cmpa.l	($001e,a6),a5
	bls.s	Lfe06dc
	movea.l	($003e,a6),a5
	rts

Lfe06ee:
	move.l	d1,d0
	bsr.w	Lfe3f1a
	tst.l	d0
	bmi.s	Lfe0704
	movea.l	d0,a0
	move.b	#$2e,(a3)+		;'.'
Lfe06fe:
	move.b	(a0)+,(a3)+
	bne.s	Lfe06fe
	subq.l	#1,a3
Lfe0704:
	rts

Lfe0706:
	move.l	d1,d0
	bsr.w	Lfe3f1a
	tst.l	d0
	bmi.s	Lfe0722
	movea.l	d0,a0
	bsr.w	Lfe4bc8
	move.b	#$3a,d0			;':'
	bsr.w	Lfe4b72
	bsr.w	Lfe4bb8
Lfe0722:
	rts

Lfe0724:
	move.l	a5,d1
	bsr.s	Lfe0706
	bsr.w	Lfe4bc4
	bsr.w	Lfe4bc4
	bsr.w	Lfe4c22
	bsr.w	Lfe4bc0
	bsr.s	Lfe0740
	bsr.w	Lfe4bb8
	rts

Lfe0740:
	move.l	a5,-(a7)
	move.l	a7,($013a,a6)
	clr.w	($01fe,a6)
	lea.l	($029e,a6),a3
	move.w	(a5)+,d7
	move.w	d7,d4
	andi.w	#$f000,d4
	lsr.w	#6,d4
	lsr.w	#4,d4
	movea.l	#Lfe0772,a4
	movea.l	(a4,d4.w),a1
	jsr	(a1)
	lea.l	($029e,a6),a0
	bsr.w	Lfe4bc8
Lfe076e:
	addq.l	#4,a7
	rts

Lfe0772:
	.dc.b	$00,$fe,$0c,$8c,$00,$fe,$0d,$be
	.dc.b	$00,$fe,$0d,$f4,$00,$fe,$0e,$2c
	.dc.b	$00,$fe,$0e,$30,$00,$fe,$11,$1e
	.dc.b	$00,$fe,$11,$aa,$00,$fe,$12,$12
	.dc.b	$00,$fe,$12,$42,$00,$fe,$12,$f8
	.dc.b	$00,$fe,$13,$9e,$00,$fe,$13,$b8
	.dc.b	$00,$fe,$14,$36,$00,$fe,$14,$b6
	.dc.b	$00,$fe,$14,$bc,$00,$fe,$15,$3e
Lfe07b2:
	movea.l	#Lfe07d2,a0
	bsr.w	Lfe4bc8
	movea.l	($013a,a6),a7
	movea.l	(a7),a5
	move.w	(a5)+,d1
	move.b	#$24,d0			;'$'
	bsr.w	Lfe4b72
	bsr.w	Lfe4c28
	bra.s	Lfe076e

Lfe07d2:
	.dc.b	' undefined instruction ',$00
Lfe07ea:
	move.w	d7,d2
	andi.w	#$0038,d2
	lsr.w	#3,d2
	move.w	d7,d3
	andi.w	#$0007,d3
	cmpi.w	#$0007,d2
	bne.s	Lfe0806
	cmpi.w	#$0004,d3
	bhi.s	Lfe07b2
	add.w	d3,d2
Lfe0806:
	rts

Lfe0808:
	move.w	d7,d3
	andi.w	#$01c0,d3
	lsr.w	#6,d3
	move.w	d7,d2
	andi.w	#$0e00,d2
	lsr.w	#6,d2
	lsr.w	#3,d2
	rts

Lfe081c:
	bsr.s	Lfe0808
	cmpi.w	#$0007,d3
	bne.s	Lfe0826
	add.w	d2,d3
Lfe0826:
	rts

Lfe0828:
	bsr.s	Lfe07ea
	cmpi.w	#$0002,d2
	bcs.s	Lfe07b2
	beq.s	Lfe0842
	cmpi.w	#$0005,d2
	bcs.w	Lfe07b2
	cmpi.w	#$000b,d2
	bcc.w	Lfe07b2
Lfe0842:
	rts

Lfe0844:
	bsr.s	Lfe07ea
	cmpi.w	#$0001,d2
	beq.w	Lfe07b2
	cmpi.w	#$000b,d2
	bhi.w	Lfe07b2
	rts

Lfe0858:
	bsr.s	Lfe07ea
	cmpi.w	#$000b,d2
	bhi.w	Lfe07b2
	cmpi.w	#$0002,d2
	bcs.w	Lfe07b2
	rts

Lfe086c:
	bsr.w	Lfe07ea
	cmpi.w	#$0009,d2
	bcc.w	Lfe07b2
	rts

Lfe087a:
	bsr.s	Lfe086c
	cmpi.w	#$0001,d2
	beq.w	Lfe07b2
	rts

Lfe0886:
	bsr.s	Lfe086c
	bra.s	Lfe0858

Lfe088a:
	movem.w	d5-d6,-(a7)
	movea.l	#Lfe1544,a0
Lfe0894:
	tst.b	(a0)+
	bmi.s	Lfe08ce
	bne.s	Lfe0894
	dbra.w	d6,Lfe0894
Lfe089e:
	move.b	(a0)+,(a3)+
	bne.s	Lfe089e
	tst.w	d5
	beq.s	Lfe08ca
	move.b	#$2e,(-$0001,a3)	;'.'
	subq.w	#2,d5
	beq.s	Lfe08b8
	bcs.s	Lfe08be
	move.b	#$6c,(a3)+		;'l'
	bra.s	Lfe08c2

Lfe08b8:
	move.b	#$77,(a3)+		;'w'
	bra.s	Lfe08c2

Lfe08be:
	move.b	#$62,(a3)+		;'b'
Lfe08c2:
	clr.b	(a3)
Lfe08c4:
	movem.w	(a7)+,d5-d6
	rts

Lfe08ca:
	subq.l	#1,a3
	bra.s	Lfe08c4

Lfe08ce:
	movea.l	#Lfe08da,a0
	bsr.w	Lfe4bc8
	bra.s	Lfe08c2

Lfe08da:
	.dc.b	'fatal error',$0d,$0a,$00
Lfe08e8:
	move.b	#$09,(a3)+
	bsr.s	Lfe08fc
	clr.b	(a3)
	rts

Lfe08f2:
	move.b	#$2c,(a3)+		;','
	bsr.s	Lfe08fc
	clr.b	(a3)
	rts

Lfe08fc:
	asl.w	#2,d2
	movea.l	#Lfe090a,a0
	movea.l	(a0,d2.w),a1
	jmp	(a1)

Lfe090a:
	.dc.b	$00,$fe,$09,$3e,$00,$fe,$09,$4a
	.dc.b	$00,$fe,$09,$50,$00,$fe,$09,$64
	.dc.b	$00,$fe,$09,$6c,$00,$fe,$09,$80
	.dc.b	$00,$fe,$09,$ac,$00,$fe,$0a,$26
	.dc.b	$00,$fe,$0a,$4c,$00,$fe,$0a,$66
	.dc.b	$00,$fe,$0a,$8c,$00,$fe,$0a,$ec
	.dc.b	$00,$fe,$0b,$26,$16,$fc,$00,$44
Lfe0942:
	addi.b	#$30,d3			;'0'
	move.b	d3,(a3)+
	rts

Lfe094a:
	move.b	#$41,(a3)+		;'A'
	bra.s	Lfe0942

Lfe0950:
	bsr.w	Lfe0b5c
	bsr.w	Lfe0bb2
Lfe0958:
	move.b	#$28,(a3)+		;'('
	bsr.s	Lfe094a
	move.b	#$29,(a3)+		;')'
	rts

Lfe0964:
	bsr.s	Lfe0950
	move.b	#$2b,(a3)+		;'+'
	rts

Lfe096c:
	bsr.w	Lfe0b5c
	bsr.w	Lfe0b7c
	sub.l	d1,d0
	bsr.w	Lfe0bb2
	move.b	#$2d,(a3)+		;'-'
	bra.s	Lfe0958

Lfe0980:
	bsr.w	Lfe0b5c
	move.w	(a5),d1
	ext.l	d1
	add.l	d1,d0
	bsr.w	Lfe0bb2
	move.b	#$24,(a3)+		;'$'
	move.w	(a5),d1
	bsr.w	Lfe4c62
	move.w	(a5)+,d1
	ext.l	d1
	bsr.w	Lfe06ee
	move.b	#$28,(a3)+		;'('
	bsr.s	Lfe094a
	move.b	#$29,(a3)+		;')'
	rts

Lfe09ac:
	bsr.w	Lfe0b5c
	bsr.w	Lfe0b8c
	add.l	d1,d0
	bsr.w	Lfe0bb2
	move.w	d3,-(a7)
	move.w	(a5)+,d1
	move.w	d1,d0
	andi.w	#$0700,d0
	beq.s	Lfe09cc
	move.w	(a7)+,d3
	bra.w	Lfe07b2

Lfe09cc:
	move.w	d1,d3
	bclr.l	#$0f,d3
	lsr.w	#6,d3
	lsr.w	#6,d3
	clr.w	d2
	btst.l	#$0f,d1
	beq.s	Lfe09e0
	addq.w	#1,d2
Lfe09e0:
	movem.w	d2-d3,-(a7)
	move.b	#$24,(a3)+		;'$'
	move.l	d1,-(a7)
	bsr.w	Lfe4c76
	move.l	(a7)+,d1
	ext.w	d1
	ext.l	d1
	bsr.w	Lfe06ee
	move.w	($0004,a7),d3
	move.b	#$28,(a3)+		;'('
	bsr.w	Lfe094a
	move.b	#$2c,(a3)+		;','
	movem.w	(a7)+,d2-d3
	bsr.w	Lfe08fc
	btst.l	#$0b,d1
	beq.s	Lfe0a1e
	move.b	#$2e,(a3)+		;'.'
	move.b	#$6c,(a3)+		;'l'
Lfe0a1e:
	move.b	#$29,(a3)+		;')'
	addq.l	#2,a7
	rts

Lfe0a26:
	clr.w	d0
	move.w	(a5),d0
	bsr.w	Lfe0bb2
	move.w	(a5)+,d1
	move.b	#$24,(a3)+		;'$'
	bsr.w	Lfe4c62
	move.b	#$2e,(a3)+		;'.'
	move.b	#$77,(a3)+		;'w'
	clr.l	d1
	move.l	(-$0002,a5),d1
	bsr.w	Lfe06ee
	rts

Lfe0a4c:
	move.l	(a5),d0
	bsr.w	Lfe0bb2
	move.l	(a5)+,d1
	move.b	#$24,(a3)+		;'$'
	move.l	d1,-(a7)
	bsr.w	Lfe4c5c
	move.l	(a7)+,d1
	bsr.w	Lfe06ee
	rts

Lfe0a66:
	move.l	a5,d0
	move.w	(a5),d1
	ext.l	d1
	add.l	d1,d0
	bsr.w	Lfe0bb2
	move.w	(a5)+,d1
	move.b	#$24,(a3)+		;'$'
	bsr.w	Lfe4c62
	movea.l	#Lfe0b57,a1
	bsr.w	Lfe0b44
	move.b	#$29,(a3)+		;')'
	rts

Lfe0a8c:
	move.l	a5,d0
	bsr.w	Lfe0b8c
	add.l	d1,d0
	bsr.w	Lfe0bb2
	move.w	(a5)+,d1
	move.w	d1,d0
	andi.w	#$0700,d0
	bne.w	Lfe07b2
	move.w	d1,d3
	bclr.l	#$0f,d3
	lsr.w	#6,d3
	lsr.w	#6,d3
	clr.w	d2
	btst.l	#$0f,d1
	beq.s	Lfe0ab8
	addq.w	#1,d2
Lfe0ab8:
	movem.w	d2-d3,-(a7)
	move.b	#$24,(a3)+		;'$'
	bsr.w	Lfe4c76
	movea.l	#Lfe0b57,a1
	bsr.s	Lfe0b44
	movem.w	(a7)+,d2-d3
	move.b	#$2c,(a3)+		;','
	bsr.w	Lfe08fc
	btst.l	#$0b,d1
	beq.s	Lfe0ae6
	move.b	#$2e,(a3)+		;'.'
	move.b	#$6c,(a3)+		;'l'
Lfe0ae6:
	move.b	#$29,(a3)+		;')'
	rts

Lfe0aec:
	move.b	#$23,(a3)+		;'#'
	cmpi.w	#$0001,d4
	bne.s	Lfe0b02
	move.w	(a5)+,d1
	move.b	#$24,(a3)+		;'$'
	bsr.w	Lfe4c76
	rts

Lfe0b02:
	cmpi.w	#$0002,d4
	bhi.s	Lfe0b14
	move.w	(a5)+,d1
	move.b	#$24,(a3)+		;'$'
	bsr.w	Lfe4c62
	rts

Lfe0b14:
	move.l	(a5),d1
	move.b	#$24,(a3)+		;'$'
	bsr.w	Lfe4c5c
	move.l	(a5)+,d1
	bsr.w	Lfe06ee
	rts

Lfe0b26:
	cmpi.w	#$0002,d4
	beq.s	Lfe0b36
	bcc.s	Lfe0b3e
	movea.l	#Lfe0b4c,a1
	bra.s	Lfe0b44

Lfe0b36:
	movea.l	#Lfe0b50,a1
	bra.s	Lfe0b44

Lfe0b3e:
	movea.l	#Lfe0b53,a1
Lfe0b44:
	move.b	(a1)+,(a3)+
	bne.s	Lfe0b44
	subq.l	#1,a3
	rts

Lfe0b4c:
	.dc.b	'CCR',$00
Lfe0b50:
	.dc.b	$53,$52,$00
Lfe0b53:
	.dc.b	'USP',$00
Lfe0b57:
	.dc.b	'(PC',$00,$00
Lfe0b5c:
	move.w	d3,d0
	lsl.w	#2,d0
	lea.l	($0076,a6),a0
	move.l	(a0,d0.w),d0
	cmp.w	#$0007,d3
	bne.s	Lfe0b7a
	btst.b	#$05,($00a0,a6)
	bne.s	Lfe0b7a
	move.l	($009a,a6),d0
Lfe0b7a:
	rts

Lfe0b7c:
	move.b	(Lfe0b88,pc,d5.w),d1
	and.l	#$000000ff,d1
	rts

Lfe0b88:
	.dc.b	$02,$01,$02,$04
Lfe0b8c:
	move.w	(a5),d1
	rol.w	#4,d1
	and.w	#$000f,d1
	lsl.w	#2,d1
	lea.l	($0056,a6),a0
	move.l	(a0,d1.w),d1
	btst.b	#$03,(a5)
	bne.s	Lfe0ba6
	ext.l	d1
Lfe0ba6:
	move.l	d1,-(a7)
	move.w	(a5),d1
	ext.w	d1
	ext.l	d1
	add.l	(a7)+,d1
	rts

Lfe0bb2:
	tst.w	($01fe,a6)
	bne.s	Lfe0bc0
	move.w	d5,($01fe,a6)
	move.l	d0,($0200,a6)
Lfe0bc0:
	rts

Lfe0bc2:
	move.b	#$44,d0			;'D'
Lfe0bc6:
	move.b	#$30,d1			;'0'
Lfe0bca:
	ror.w	#1,d6
	bcs.s	Lfe0bf0
Lfe0bce:
	addq.w	#1,d1
	cmpi.b	#$38,d1			;'8'
	bcs.s	Lfe0bca
	cmpi.b	#$41,d0			;'A'
	beq.s	Lfe0be2
	move.b	#$41,d0			;'A'
	bra.s	Lfe0bc6

Lfe0be2:
	moveq.l	#$03,d0
Lfe0be4:
	cmpi.b	#$2f,-(a3)		;'/'
	dbne.w	d0,Lfe0be4
	addq.l	#1,a3
	rts

Lfe0bf0:
	move.b	d0,(a3)+
	move.b	d1,(a3)+
	btst.l	#$00,d6
	bne.s	Lfe0c00
	move.b	#$2f,(a3)+		;'/'
	bra.s	Lfe0bce

Lfe0c00:
	cmpi.b	#$37,d1			;'7'
	bcc.s	Lfe0bce
	move.b	#$2d,(a3)+		;'-'
	addq.w	#1,d1
Lfe0c0c:
	ror.w	#1,d6
	btst.l	#$00,d6
	beq.s	Lfe0c28
	addq.w	#1,d1
	cmpi.b	#$38,d1			;'8'
	bcs.s	Lfe0c0c
	move.b	d0,(a3)+
	move.b	#$37,(a3)+		;'7'
	move.b	#$2f,(a3)+		;'/'
	bra.s	Lfe0bce

Lfe0c28:
	move.b	d0,(a3)+
	move.b	d1,(a3)+
	move.b	#$2f,(a3)+		;'/'
	bra.s	Lfe0bce

Lfe0c32:
	moveq.l	#$0f,d1
Lfe0c34:
	roxl.w	#1,d6
	roxr.w	#1,d0
	dbra.w	d1,Lfe0c34
	move.w	d0,d6
	bra.s	Lfe0bc2

Lfe0c40:
	move.w	d7,d1
	lsr.w	#8,d1
	andi.w	#$000f,d1
	cmpi.w	#$0001,d1
	bhi.s	Lfe0c5c
	bne.s	Lfe0c56
	move.b	#$66,(a3)+		;'f'
	rts

Lfe0c56:
	move.b	#$74,(a3)+		;'t'
	rts

Lfe0c5c:
	subq.w	#2,d1
	add.w	d1,d1
	lea.l	(Lfe0c70),a0
	move.b	(a0,d1.w),(a3)+
	move.b	($01,a0,d1.w),(a3)+
	rts

Lfe0c70:
	.dc.b	$68,$69,$6c,$73,$63,$63,$63,$73
	.dc.b	$6e,$65,$65,$71,$76,$63,$76,$73
	.dc.b	$70,$6c,$6d,$69,$67,$65,$6c,$74
	.dc.b	$67,$74,$6c,$65,$08,$07,$00,$08
	.dc.b	$67,$00,$00,$84,$61,$00,$fb,$54
	.dc.b	$0c,$02,$00,$01,$67,$34,$7a,$01
	.dc.b	$4a,$42,$66,$02,$7a,$03,$61,$00
	.dc.b	$fb,$60,$08,$83,$00,$02,$3c,$03
	.dc.b	$61,$00,$fb,$d8,$36,$02,$42,$42
	.dc.b	$61,$00,$fc,$2e,$4a,$46,$66,$06
	.dc.b	$61,$00,$fb,$82,$60,$04,$61,$00
	.dc.b	$fb,$b2,$7a,$01,$61,$00,$fc,$24
	.dc.b	$4e,$75
Lfe0cd2:
	moveq.l	#$04,d6
	moveq.l	#$05,d2
	moveq.l	#$02,d5
	btst.l	#$06,d7
	beq.s	Lfe0ce0
	moveq.l	#$03,d5
Lfe0ce0:
	bsr.w	Lfe088a
	btst.l	#$07,d7
	bne.s	Lfe0cfc
	bsr.w	Lfe08e8
	bsr.w	Lfe0808
	move.w	d2,d3
	clr.w	d2
	bsr.w	Lfe08f2
	rts

Lfe0cfc:
	movem.w	d2-d3,-(a7)
	bsr.w	Lfe0808
	move.w	d2,d3
	clr.w	d2
	bsr.w	Lfe08e8
	movem.w	(a7)+,d2-d3
	bsr.w	Lfe08f2
	rts

Lfe0d16:
	bsr.w	Lfe0808
	cmpi.w	#$0007,d2
	beq.w	Lfe07b2
	cmpi.w	#$0004,d2
	bne.s	Lfe0d68
	move.w	d3,d6
	moveq.l	#$01,d5
	bsr.w	Lfe07ea
	tst.w	d2
	bne.s	Lfe0d36
	moveq.l	#$03,d5
Lfe0d36:
	bsr.w	Lfe088a
	moveq.l	#$0b,d2
	moveq.l	#$02,d4
	bsr.w	Lfe08e8
	bsr.w	Lfe07ea
	cmpi.w	#$000b,d2
	bcc.w	Lfe07b2
	tst.w	d6
	beq.s	Lfe0d5a
	cmpi.w	#$0009,d2
	bcc.w	Lfe07b2
Lfe0d5a:
	cmpi.w	#$0001,d2
	beq.w	Lfe07b2
	bsr.w	Lfe08f2
	rts

Lfe0d68:
	addq.w	#1,d3
	move.w	d3,d5
	move.w	d2,d6
	addq.w	#5,d6
	bsr.w	Lfe088a
	move.w	d2,d6
	moveq.l	#$0b,d2
	move.w	d5,d4
	bsr.w	Lfe08e8
	bsr.w	Lfe07ea
	cmpi.w	#$0005,d6
	beq.s	Lfe0d96
	cmpi.w	#$0002,d6
	bcs.s	Lfe0d96
	cmpi.w	#$000b,d2
	bcc.w	Lfe07b2
Lfe0d96:
	cmpi.w	#$000b,d2
	bne.s	Lfe0da8
	cmpi.w	#$0003,d4
	bcc.w	Lfe07b2
	moveq.l	#$0c,d2
	bra.s	Lfe0db8

Lfe0da8:
	cmpi.w	#$0001,d2
	beq.w	Lfe07b2
	cmpi.w	#$0009,d2
	bcc.w	Lfe07b2
Lfe0db8:
	bsr.w	Lfe08f2
	rts

Lfe0dbe:
	moveq.l	#$0c,d6
	moveq.l	#$01,d5
	bsr.w	Lfe088a
	bsr.w	Lfe07ea
	cmpi.w	#$0001,d2
	beq.w	Lfe07b2
	move.w	d5,d4
	bsr.w	Lfe08e8
Lfe0dd8:
	bsr.w	Lfe081c
	cmpi.w	#$0001,d3
	beq.w	Lfe07b2
	cmpi.w	#$0009,d3
	bcc.w	Lfe07b2
	exg.l	d2,d3
	bsr.w	Lfe08f2
	rts

Lfe0df4:
	moveq.l	#$03,d5
Lfe0df6:
	move.w	d5,d4
	bsr.w	Lfe0808
	cmpi.w	#$0001,d3
	beq.s	Lfe0e12
	moveq.l	#$0c,d6
	bsr.w	Lfe088a
	bsr.w	Lfe07ea
	bsr.w	Lfe08e8
	bra.s	Lfe0dd8

Lfe0e12:
	moveq.l	#$0d,d6
	bsr.w	Lfe088a
	bsr.w	Lfe07ea
	bsr.w	Lfe08e8
	bsr.w	Lfe0808
	exg.l	d2,d3
	bsr.w	Lfe08f2
	rts

Lfe0e2c:
	moveq.l	#$02,d5
	bra.s	Lfe0df6

Lfe0e30:
	cmpi.w	#$4afc,d7
	bne.s	Lfe0e42
	moveq.l	#$48,d6			;'H'
	clr.w	d5
	bsr.w	Lfe088a
	clr.b	(a3)+
	rts

Lfe0e42:
	btst.l	#$08,d7
	beq.s	Lfe0e96
	btst.l	#$07,d7
	beq.w	Lfe07b2
	moveq.l	#$0e,d6
	btst.l	#$06,d7
	beq.s	Lfe0e78
	addq.w	#1,d6
	clr.w	d5
	bsr.w	Lfe088a
	bsr.w	Lfe0828
	moveq.l	#$01,d5
	bsr.w	Lfe08e8
	bsr.w	Lfe0808
	exg.l	d2,d3
	moveq.l	#$01,d2
	bsr.w	Lfe08f2
	rts

Lfe0e78:
	moveq.l	#$02,d5
	bsr.w	Lfe088a
	move.w	d5,d4
	bsr.w	Lfe0844
	bsr.w	Lfe08e8
	bsr.w	Lfe0808
	exg.l	d2,d3
	clr.w	d2
	bsr.w	Lfe08f2
	rts

Lfe0e96:
	bsr.w	Lfe0808
	cmpi.w	#$0007,d2
	bne.w	Lfe0f7a
	cmpi.w	#$0001,d3
	bcs.w	Lfe07b2
	bne.w	Lfe0f5e
	bsr.w	Lfe07ea
	cmpi.w	#$0006,d2
	bhi.w	Lfe07b2
	bne.s	Lfe0ede
	cmpi.w	#$0004,d3
	beq.w	Lfe07b2
	moveq.l	#$10,d6
	add.w	d3,d6
	clr.w	d5
	bsr.w	Lfe088a
	cmpi.w	#$0002,d3
	bne.s	Lfe0edc
	moveq.l	#$0b,d2
	moveq.l	#$02,d4
	bsr.w	Lfe08e8
Lfe0edc:
	rts

Lfe0ede:
	clr.w	d5
	cmpi.w	#$0002,d2
	bcc.s	Lfe0f08
	moveq.l	#$18,d6
	bsr.w	Lfe088a
	move.b	#$09,(a3)+
	move.b	#$23,(a3)+		;'#'
	move.w	d7,d1
	andi.w	#$000f,d1
	move.b	#$24,(a3)+		;'$'
	bsr.w	Lfe4c76
	move.b	#$00,(a3)+
	rts

Lfe0f08:
	cmpi.w	#$0003,d2
	bcc.s	Lfe0f24
	moveq.l	#$01,d2
	moveq.l	#$19,d6
	bsr.w	Lfe088a
	moveq.l	#$02,d4
	bsr.w	Lfe08e8
	moveq.l	#$0b,d2
	bsr.w	Lfe08f2
	rts

Lfe0f24:
	bhi.s	Lfe0f34
	moveq.l	#$1a,d6
	moveq.l	#$01,d2
	bsr.w	Lfe088a
	bsr.w	Lfe08e8
	rts

Lfe0f34:
	moveq.l	#$0c,d6
	moveq.l	#$03,d4
	bsr.w	Lfe088a
	cmpi.w	#$0004,d2
	bne.s	Lfe0f50
	moveq.l	#$01,d2
	bsr.w	Lfe08e8
	moveq.l	#$0c,d2
	bsr.w	Lfe08f2
	rts

Lfe0f50:
	moveq.l	#$0c,d2
	bsr.w	Lfe08e8
	moveq.l	#$01,d2
	bsr.w	Lfe08f2
	rts

Lfe0f5e:
	moveq.l	#$1b,d6
	clr.w	d5
	btst.l	#$06,d7
	beq.s	Lfe0f6a
	moveq.l	#$1c,d6
Lfe0f6a:
	bsr.w	Lfe088a
	bsr.w	Lfe0828
	moveq.l	#$03,d5
	bsr.w	Lfe08e8
	rts

Lfe0f7a:
	clr.w	d5
	cmpi.w	#$0001,d2
	bhi.s	Lfe0fd2
	beq.s	Lfe0fb6
	cmpi.w	#$0003,d3
	bne.s	Lfe0fa2
	moveq.l	#$0c,d6
	bsr.w	Lfe088a
	moveq.l	#$0c,d2
	moveq.l	#$02,d4
	bsr.w	Lfe08e8
	bsr.w	Lfe087a
	bsr.w	Lfe08f2
	rts

Lfe0fa2:
	addq.w	#1,d3
	move.w	d3,d5
	moveq.l	#$1d,d6
	bsr.w	Lfe088a
	bsr.w	Lfe087a
	bsr.w	Lfe08e8
	rts

Lfe0fb6:
	cmpi.w	#$0003,d3
	bcc.w	Lfe07b2
	moveq.l	#$1e,d6
	addq.w	#1,d3
	move.w	d3,d5
	bsr.w	Lfe088a
	bsr.w	Lfe087a
	bsr.w	Lfe08e8
	rts

Lfe0fd2:
	cmpi.w	#$0003,d2
	bhi.s	Lfe1042
	beq.s	Lfe100e
	cmpi.w	#$0003,d3
	bne.s	Lfe0ffa
	moveq.l	#$0c,d6
	bsr.w	Lfe088a
	moveq.l	#$02,d4
	bsr.w	Lfe0844
	bsr.w	Lfe08e8
	moveq.l	#$0c,d2
	moveq.l	#$01,d4
	bsr.w	Lfe08f2
	rts

Lfe0ffa:
	moveq.l	#$1f,d6
	addq.w	#1,d3
	move.w	d3,d5
	bsr.w	Lfe088a
	bsr.w	Lfe087a
	bsr.w	Lfe08e8
	rts

Lfe100e:
	cmpi.w	#$0003,d3
	bne.s	Lfe102e
	moveq.l	#$0c,d6
	bsr.w	Lfe088a
	moveq.l	#$02,d4
	bsr.w	Lfe0844
	bsr.w	Lfe08e8
	moveq.l	#$0c,d2
	moveq.l	#$02,d4
	bsr.w	Lfe08f2
	rts

Lfe102e:
	moveq.l	#$20,d6			;' '
	move.w	d3,d5
	addq.w	#1,d5
	bsr.w	Lfe088a
	bsr.w	Lfe087a
	bsr.w	Lfe08e8
	rts

Lfe1042:
	cmpi.w	#$0005,d2
	bhi.w	Lfe10ee
	beq.w	Lfe10d0
	cmpi.w	#$0001,d3
	bhi.s	Lfe108c
	beq.s	Lfe1066
	moveq.l	#$21,d6			;'!'
	bsr.w	Lfe088a
	bsr.w	Lfe087a
	bsr.w	Lfe08e8
	rts

Lfe1066:
	bsr.w	Lfe07ea
	tst.w	d2
	beq.s	Lfe1080
	moveq.l	#$22,d6			;'"'
	bsr.w	Lfe088a
	bsr.w	Lfe0828
	moveq.l	#$01,d5
	bsr.w	Lfe08e8
	rts

Lfe1080:
	moveq.l	#$23,d6			;'#'
	bsr.w	Lfe088a
	bsr.w	Lfe08e8
	rts

Lfe108c:
	move.w	d3,d5
	bsr.w	Lfe07ea
	tst.w	d2
	bne.s	Lfe10a2
	moveq.l	#$25,d6			;'%'
	bsr.w	Lfe088a
	bsr.w	Lfe08e8
	rts

Lfe10a2:
	moveq.l	#$24,d6			;'$'
	bsr.w	Lfe088a
	move.w	(a5)+,d6
	move.b	#$09,(a3)+
	cmpi.w	#$0004,d2
	beq.s	Lfe10c6
	bsr.w	Lfe0bc2
	bsr.w	Lfe086c
	bsr.w	Lfe0828
	bsr.w	Lfe08f2
	rts

Lfe10c6:
	bsr.w	Lfe0c32
	bsr.w	Lfe08f2
	rts

Lfe10d0:
	cmpi.w	#$0003,d3
	bne.s	Lfe10e6
	moveq.l	#$27,d6			;'''
Lfe10d8:
	bsr.w	Lfe088a
	bsr.w	Lfe087a
	bsr.w	Lfe08e8
	rts

Lfe10e6:
	move.w	d3,d5
	addq.w	#1,d5
	moveq.l	#$26,d6			;'&'
	bra.s	Lfe10d8

Lfe10ee:
	cmpi.w	#$0002,d3
	bcs.w	Lfe07b2
	move.w	d3,d5
	moveq.l	#$24,d6			;'$'
	bsr.w	Lfe088a
	move.w	(a5)+,d6
	bsr.w	Lfe07ea
	cmpi.w	#$0003,d2
	beq.s	Lfe110e
	bsr.w	Lfe0828
Lfe110e:
	bsr.w	Lfe08e8
	move.b	#$2c,(a3)+		;','
	bsr.w	Lfe0bc2
	clr.b	(a3)+
	rts

Lfe111e:
	move.w	d7,d1
	andi.w	#$00c0,d1
	cmpi.w	#$00c0,d1
	beq.s	Lfe116e
	bsr.w	Lfe0808
	bclr.l	#$02,d3
	moveq.l	#$29,d6			;')'
	btst.l	#$08,d7
	bne.s	Lfe113c
	moveq.l	#$28,d6			;'('
Lfe113c:
	move.w	d3,d5
	addq.w	#1,d5
	bsr.w	Lfe088a
	move.b	#$09,(a3)+
	move.b	#$23,(a3)+		;'#'
	move.w	d2,d1
	bne.s	Lfe1152
	moveq.l	#$08,d1
Lfe1152:
	bsr.w	Lfe4c7c
	bsr.w	Lfe086c
	cmpi.w	#$0001,d2
	bne.s	Lfe1168
	cmpi.w	#$0001,d5
	beq.w	Lfe07b2
Lfe1168:
	bsr.w	Lfe08f2
	rts

Lfe116e:
	bsr.w	Lfe07ea
	cmpi.w	#$0001,d2
	beq.s	Lfe118e
	move.b	#$73,(a3)+		;'s'
	bsr.w	Lfe0c40
	bsr.w	Lfe087a
	move.w	#$0001,d5
	bsr.w	Lfe08e8
	rts

Lfe118e:
	move.b	#$64,(a3)+		;'d'
	move.b	#$62,(a3)+		;'b'
	bsr.w	Lfe0c40
	clr.w	d2
	bsr.w	Lfe08e8
	move.b	#$2c,(a3)+		;','
	move.w	(a5)+,d1
	moveq.l	#$02,d0
	bra.s	Lfe11f8

Lfe11aa:
	move.b	#$62,(a3)+		;'b'
	move.w	d7,d1
	andi.w	#$0f00,d1
	bne.s	Lfe11c0
	move.b	#$72,(a3)+		;'r'
	move.b	#$61,(a3)+		;'a'
	bra.s	Lfe11d4

Lfe11c0:
	cmpi.w	#$0100,d1
	bne.s	Lfe11d0
	move.b	#$73,(a3)+		;'s'
	move.b	#$72,(a3)+		;'r'
	bra.s	Lfe11d4

Lfe11d0:
	bsr.w	Lfe0c40
Lfe11d4:
	move.b	#$2e,(a3)+		;'.'
	tst.b	d7
	bne.s	Lfe11ea
	move.b	#$77,(a3)+		;'w'
	move.b	#$09,(a3)+
	move.w	(a5)+,d1
	moveq.l	#$02,d0
	bra.s	Lfe11f8

Lfe11ea:
	move.b	#$73,(a3)+		;'s'
	move.b	#$09,(a3)+
	move.w	d7,d1
	ext.w	d1
	clr.l	d0
Lfe11f8:
	ext.l	d1
	add.l	a5,d1
	sub.l	d0,d1
	move.b	#$24,(a3)+		;'$'
	move.l	d1,-(a7)
	bsr.w	Lfe4c5c
	move.l	(a7)+,d1
	bsr.w	Lfe06ee
	clr.b	(a3)+
	rts

Lfe1212:
	btst.l	#$08,d7
	bne.w	Lfe07b2
	moveq.l	#$2a,d6			;'*'
	clr.w	d5
	bsr.w	Lfe088a
	move.b	#$09,(a3)+
	move.b	#$23,(a3)+		;'#'
	move.w	d7,d1
	move.b	#$24,(a3)+		;'$'
	bsr.w	Lfe4c76
	bsr.w	Lfe0808
	move.w	d2,d3
	clr.w	d2
	bsr.w	Lfe08f2
	rts

Lfe1242:
	clr.w	d5
	move.w	d7,d1
	andi.w	#$01f0,d1
	cmpi.w	#$0100,d1
	bne.s	Lfe128a
	moveq.l	#$2b,d6			;'+'
Lfe1252:
	bsr.w	Lfe088a
	btst.l	#$03,d7
	bne.s	Lfe1272
	bsr.w	Lfe07ea
	bsr.w	Lfe08e8
	bsr.w	Lfe0808
	move.w	d2,d3
	clr.w	d2
	bsr.w	Lfe08f2
	rts

Lfe1272:
	bsr.w	Lfe07ea
	moveq.l	#$04,d2
	bsr.w	Lfe08e8
	bsr.w	Lfe0808
	move.w	d2,d3
	moveq.l	#$04,d2
	bsr.w	Lfe08f2
	rts

Lfe128a:
	moveq.l	#$2c,d6			;','
Lfe128c:
	bsr.w	Lfe0808
	cmpi.w	#$0003,d3
	bne.s	Lfe12b2
Lfe1296:
	bsr.w	Lfe088a
	moveq.l	#$02,d4
	move.w	d2,-(a7)
	bsr.w	Lfe0844
	move.w	d4,d5
	bsr.w	Lfe08e8
	move.w	(a7)+,d3
	clr.w	d2
	bsr.w	Lfe08f2
	rts

Lfe12b2:
	addq.w	#1,d6
	cmpi.w	#$0007,d3
	beq.s	Lfe1296
	moveq.l	#$2e,d6			;'.'
Lfe12bc:
	move.w	d3,d5
	addq.w	#1,d5
	andi.w	#$0003,d5
	bsr.w	Lfe088a
	btst.l	#$08,d7
	beq.s	Lfe12e0
	move.w	d2,d3
	clr.w	d2
	bsr.w	Lfe08e8
	bsr.w	Lfe0886
	bsr.w	Lfe08f2
	rts

Lfe12e0:
	bsr.w	Lfe0844
	move.w	d5,d4
	bsr.w	Lfe08e8
	bsr.w	Lfe0808
	move.w	d2,d3
	clr.w	d2
	bsr.w	Lfe08f2
	rts

Lfe12f8:
	moveq.l	#$2f,d6			;'/'
Lfe12fa:
	move.w	d7,d1
	andi.w	#$00c0,d1
	cmpi.w	#$00c0,d1
	beq.s	Lfe1324
	btst.l	#$08,d7
	beq.s	Lfe134c
	move.w	d7,d1
	andi.w	#$0030,d1
	bne.s	Lfe134c
	bsr.w	Lfe0808
	andi.w	#$0003,d3
	move.w	d3,d5
	addq.w	#1,d5
	bra.w	Lfe1252

Lfe1324:
	addq.w	#1,d6
	moveq.l	#$02,d5
	btst.l	#$08,d7
	beq.s	Lfe1330
	moveq.l	#$03,d5
Lfe1330:
	bsr.w	Lfe088a
	move.w	d5,d4
	bsr.w	Lfe07ea
	bsr.w	Lfe08e8
	bsr.w	Lfe0808
	move.w	d2,d3
	moveq.l	#$01,d2
	bsr.w	Lfe08f2
	rts

Lfe134c:
	addq.w	#2,d6
	bsr.w	Lfe0808
	bclr.l	#$02,d3
	move.w	d3,d5
	addq.w	#1,d5
	bsr.w	Lfe088a
	btst.l	#$08,d7
	beq.s	Lfe1376
	move.w	d2,d3
	clr.w	d2
	bsr.w	Lfe08e8
	bsr.w	Lfe0886
	bsr.w	Lfe08f2
	rts

Lfe1376:
	tst.w	d3
	bne.s	Lfe1386
	bsr.w	Lfe07ea
	cmpi.w	#$0001,d2
	beq.w	Lfe07b2
Lfe1386:
	bsr.w	Lfe07ea
	move.w	d5,d4
	bsr.w	Lfe08e8
	bsr.w	Lfe0808
	move.w	d2,d3
	clr.w	d2
	bsr.w	Lfe08f2
	rts

Lfe139e:
	moveq.l	#$32,d6			;'2'
Lfe13a0:
	move.w	d7,d1
	move.b	#$24,(a3)+		;'$'
	bsr.w	Lfe4c62
	move.b	#$09,(a3)+
	clr.w	d5
	bsr.w	Lfe088a
	clr.b	(a3)+
	rts

Lfe13b8:
	btst.l	#$08,d7
	bne.s	Lfe13e4
	bsr.w	Lfe0808
	cmpi.w	#$0003,d3
	beq.s	Lfe13da
	move.w	d3,d5
	addq.w	#1,d5
	moveq.l	#$33,d6			;'3'
	move.w	d5,d4
	bsr.w	Lfe088a
	bra.s	Lfe1376

Lfe13d6:
	moveq.l	#$03,d5
	bra.s	Lfe13dc

Lfe13da:
	moveq.l	#$02,d5
Lfe13dc:
	move.w	d5,d4
	moveq.l	#$34,d6			;'4'
	bra.w	Lfe1330

Lfe13e4:
	bsr.w	Lfe0808
	bclr.l	#$02,d3
	cmpi.w	#$0003,d3
	beq.s	Lfe13d6
	move.w	d3,d5
	addq.w	#1,d5
	bsr.w	Lfe07ea
	cmpi.w	#$0001,d2
	bne.s	Lfe141a
	moveq.l	#$35,d6			;'5'
	bsr.w	Lfe088a
	moveq.l	#$03,d2
	bsr.w	Lfe08e8
	bsr.w	Lfe0808
	move.w	d2,d3
	moveq.l	#$03,d2
	bsr.w	Lfe08f2
	rts

Lfe141a:
	bsr.w	Lfe0808
	move.w	d2,d3
	clr.w	d2
	moveq.l	#$36,d6			;'6'
	bsr.w	Lfe088a
	bsr.w	Lfe08e8
Lfe142c:
	bsr.w	Lfe087a
	bsr.w	Lfe08f2
	rts

Lfe1436:
	move.w	d7,d1
	clr.w	d5
	andi.w	#$01f8,d1
	moveq.l	#$37,d6			;'7'
	cmpi.w	#$0188,d1
	beq.s	Lfe1478
	cmpi.w	#$0140,d1
	beq.s	Lfe148a
	cmpi.w	#$0148,d1
	beq.s	Lfe149c
	moveq.l	#$38,d6			;'8'
	bclr.l	#$03,d1
	cmpi.w	#$0100,d1
	beq.w	Lfe1252
	bsr.w	Lfe0808
	bclr.l	#$02,d3
	moveq.l	#$39,d6			;'9'
	cmpi.w	#$0003,d3
	beq.w	Lfe128c
	moveq.l	#$3b,d6			;';'
	bra.w	Lfe12bc

Lfe1478:
	bsr.w	Lfe088a
	bsr.w	Lfe0808
	move.w	d2,d3
	clr.w	d2
	bsr.w	Lfe08e8
	bra.s	Lfe14ac

Lfe148a:
	bsr.w	Lfe088a
	bsr.w	Lfe0808
	move.w	d2,d3
	clr.w	d2
	bsr.w	Lfe08e8
	bra.s	Lfe142c

Lfe149c:
	bsr.w	Lfe088a
	bsr.w	Lfe0808
	move.w	d2,d3
	moveq.l	#$01,d2
	bsr.w	Lfe08e8
Lfe14ac:
	bsr.w	Lfe07ea
	bsr.w	Lfe08f2
	rts

Lfe14b6:
	moveq.l	#$3c,d6			;'<'
	bra.w	Lfe12fa

Lfe14bc:
	move.w	d7,d1
	moveq.l	#$3f,d6			;'?'
	andi.w	#$00c0,d1
	cmpi.w	#$00c0,d1
	beq.s	Lfe151e
	move.w	d7,d2
	andi.w	#$0018,d2
	lsr.w	#2,d2
	add.w	d2,d6
	btst.l	#$08,d7
	bne.s	Lfe14dc
	addq.w	#1,d6
Lfe14dc:
	bsr.w	Lfe0808
	bclr.l	#$02,d3
	move.w	d3,d5
	addq.w	#1,d5
	bsr.w	Lfe088a
	btst.l	#$05,d7
	bne.s	Lfe1508
	tst.w	d2
	bne.s	Lfe14f8
	moveq.l	#$08,d2
Lfe14f8:
	addi.b	#$30,d2			;'0'
	move.b	#$09,(a3)+
	move.b	#$23,(a3)+		;'#'
	move.b	d2,(a3)+
	bra.s	Lfe1510

Lfe1508:
	move.w	d2,d3
	clr.w	d2
	bsr.w	Lfe08e8
Lfe1510:
	move.w	d7,d3
	andi.w	#$0007,d3
	clr.w	d2
	bsr.w	Lfe08f2
	rts

Lfe151e:
	moveq.l	#$02,d5
	bsr.w	Lfe0808
	add.w	d2,d2
	add.w	d2,d6
	btst.l	#$08,d7
	bne.s	Lfe1530
	addq.w	#1,d6
Lfe1530:
	bsr.w	Lfe088a
	bsr.w	Lfe0886
	bsr.w	Lfe08e8
	rts

Lfe153e:
	moveq.l	#$47,d6			;'G'
	bra.w	Lfe13a0

Lfe1544:
	.dc.b	$00,$62,$74,$73,$74,$00,$62,$63
	.dc.b	$68,$67,$00,$62,$63,$6c,$72,$00
	.dc.b	$62,$73,$65,$74,$00,$6d,$6f,$76
	.dc.b	$65,$70,$00,$6f,$72,$69,$00,$61
	.dc.b	$6e,$64,$69,$00,$73,$75,$62,$69
	.dc.b	$00,$61,$64,$64,$69,$00,$00,$65
	.dc.b	$6f,$72,$69,$00,$63,$6d,$70,$69
	.dc.b	$00,$6d,$6f,$76,$65,$00,$6d,$6f
	.dc.b	$76,$65,$61,$00,$63,$68,$6b,$00
	.dc.b	$6c,$65,$61,$00,$72,$65,$73,$65
	.dc.b	$74,$00,$6e,$6f,$70,$00,$73,$74
	.dc.b	$6f,$70,$00,$72,$74,$65,$00,$00
	.dc.b	$72,$74,$73,$00,$74,$72,$61,$70
	.dc.b	$76,$00,$72,$74,$72,$00,$74,$72
	.dc.b	$61,$70,$00,$6c,$69,$6e,$6b,$00
	.dc.b	$75,$6e,$6c,$6b,$00,$6a,$73,$72
	.dc.b	$00,$6a,$6d,$70,$00,$6e,$65,$67
	.dc.b	$78,$00,$63,$6c,$72,$00,$6e,$65
	.dc.b	$67,$00,$6e,$6f,$74,$00,$6e,$62
	.dc.b	$63,$64,$00,$70,$65,$61,$00,$73
	.dc.b	$77,$61,$70,$00,$6d,$6f,$76,$65
	.dc.b	$6d,$00,$65,$78,$74,$00,$74,$73
	.dc.b	$74,$00,$74,$61,$73,$00,$61,$64
	.dc.b	$64,$71,$00,$73,$75,$62,$71,$00
	.dc.b	$6d,$6f,$76,$65,$71,$00,$73,$62
	.dc.b	$63,$64,$00,$64,$69,$76,$75,$00
	.dc.b	$64,$69,$76,$73,$00,$6f,$72,$00
	.dc.b	$73,$75,$62,$78,$00,$73,$75,$62
	.dc.b	$61,$00,$73,$75,$62,$00,$6c,$69
	.dc.b	$6e,$65,$20,$31,$30,$31,$30,$20
	.dc.b	$65,$6d,$75,$6c,$61,$74,$6f,$72
	.dc.b	$00,$63,$6d,$70,$00,$63,$6d,$70
	.dc.b	$61,$00,$63,$6d,$70,$6d,$00,$65
	.dc.b	$6f,$72,$00,$65,$78,$67,$00,$61
	.dc.b	$62,$63,$64,$00,$6d,$75,$6c,$75
	.dc.b	$00,$6d,$75,$6c,$73,$00,$61,$6e
	.dc.b	$64,$00,$61,$64,$64,$78,$00,$61
	.dc.b	$64,$64,$61,$00,$61,$64,$64,$00
	.dc.b	$61,$73,$6c,$00,$61,$73,$72,$00
	.dc.b	$6c,$73,$6c,$00,$6c,$73,$72,$00
	.dc.b	$72,$6f,$78,$6c,$00,$72,$6f,$78
	.dc.b	$72,$00,$72,$6f,$6c,$00,$72,$6f
	.dc.b	$72,$00,$6c,$69,$6e,$65,$20,$31
	.dc.b	$31,$31,$31,$20,$65,$6d,$75,$6c
	.dc.b	$61,$74,$6f,$72,$00,$69,$6c,$6c
	.dc.b	$65,$67,$61,$6c,$00,$ff,$42,$6e
	.dc.b	$00,$1e,$10,$15,$61,$00,$37,$28
	.dc.b	$b0,$3c,$00,$4e,$66,$06,$52,$8d
	.dc.b	$53,$6e,$00,$1e,$61,$00,$2b,$6e
	.dc.b	$64,$14,$61,$00,$35,$f2,$4a,$00
	.dc.b	$67,$08,$0c,$00,$00,$3a,$66,$00
	.dc.b	$eb,$52,$2c,$2e,$00,$36,$2d,$4d
	.dc.b	$00,$3e,$08,$86,$00,$00,$2d,$46
	.dc.b	$00,$36
Lfe16ee:
	movea.l	($0036,a6),a5
	tst.w	($001e,a6)
	beq.s	Lfe1700
	move.l	a5,d1
	bsr.w	Lfe4c22
	bra.s	Lfe171a

Lfe1700:
	bsr.w	Lfe0724
	clr.w	d1
	lea.l	($029e,a6),a0
Lfe170a:
	addq.b	#1,d1
	tst.b	(a0)+
	bne.s	Lfe170a
	subq.b	#1,d1
	move.b	d1,($029d,a6)
	bsr.w	Lfe4bc0
Lfe171a:
	bsr.w	Lfe4bc0
	movea.l	a5,a4
	bsr.w	Lfe4aca
	move.b	(a0),d0
	bne.s	Lfe1734
	tst.w	($001e,a6)
	bne.s	Lfe1740
	move.l	a4,($0036,a6)
	bra.s	Lfe16ee

Lfe1734:
	cmpi.b	#$2e,d0			;'.'
	beq.s	Lfe1740
	cmpi.b	#$3b,d0			;';'
	bne.s	Lfe1746
Lfe1740:
	movea.l	($003e,a6),a5
	rts

Lfe1746:
	movea.l	a0,a5
	bsr.s	Lfe174c
	bra.s	Lfe16ee

Lfe174c:
	move.l	a7,($0136,a6)
	clr.l	($012a,a6)
	clr.l	($012e,a6)
	clr.l	($0132,a6)
	lea.l	($012c,a6),a4
	bsr.w	Lfe184a
	movea.l	#Lfe179c,a0
	asl.w	#2,d7
	movea.l	(a0,d7.w),a1
	jsr	(a1)
	move.l	a4,d0
	lea.l	($012a,a6),a0
	sub.l	a0,d0
	lsr.w	#1,d0
	beq.s	Lfe179a
	cmpi.w	#$0006,d0
	bhi.w	Lfe182c
	subq.w	#1,d0
	lea.l	($012a,a6),a0
	movea.l	($0036,a6),a1
Lfe1790:
	move.w	(a0)+,(a1)+
	dbra.w	d0,Lfe1790
	move.l	a1,($0036,a6)
Lfe179a:
	rts

Lfe179c:
	.dc.b	$00,$fe,$1e,$0c,$00,$fe,$1e,$c8
	.dc.b	$00,$fe,$1f,$da,$00,$fe,$1f,$fa
	.dc.b	$00,$fe,$20,$0a,$00,$fe,$20,$38
	.dc.b	$00,$fe,$20,$6e,$00,$fe,$20,$76
	.dc.b	$00,$fe,$20,$d0,$00,$fe,$21,$0e
	.dc.b	$00,$fe,$21,$52,$00,$fe,$21,$62
	.dc.b	$00,$fe,$21,$6e,$00,$fe,$21,$82
	.dc.b	$00,$fe,$21,$a8,$00,$fe,$21,$be
	.dc.b	$00,$fe,$22,$0c,$00,$fe,$22,$18
	.dc.b	$00,$fe,$22,$1e,$00,$fe,$22,$30
	.dc.b	$00,$fe,$22,$58,$00,$fe,$22,$76
	.dc.b	$00,$fe,$22,$82,$00,$fe,$22,$ae
	.dc.b	$00,$fe,$22,$b6,$00,$fe,$22,$e2
	.dc.b	$00,$fe,$22,$f6,$00,$fe,$23,$4a
	.dc.b	$00,$fe,$23,$52,$00,$fe,$23,$78
	.dc.b	$00,$fe,$23,$7a,$00,$fe,$23,$e8
	.dc.b	$00,$fe,$24,$14,$00,$fe,$24,$20
	.dc.b	$00,$fe,$24,$6a,$00,$fe,$24,$76
Lfe182c:
	lea.l	($029e,a6),a0
	movea.l	a0,a1
	move.b	#$3f,(a1)+		;'?'
	move.b	#$3f,(a1)+		;'?'
	clr.b	(a1)+
	bsr.w	Lfe4bc8
	bsr.w	Lfe4bb8
	movea.l	($0136,a6),a7
	rts

Lfe184a:
	movea.l	#Lfe251c,a1
	movea.l	#Lfe2899,a2
Lfe1856:
	movea.l	a5,a0
	moveq.l	#$10,d1
Lfe185a:
	tst.b	(a1)
	beq.s	Lfe1878
	move.b	(a0)+,d0
	bsr.w	Lfe4de2
	cmp.b	(a1)+,d0
	dbne.w	d1,Lfe185a
Lfe186a:
	tst.b	(a1)+
	dbeq.w	d1,Lfe186a
	addq.l	#3,a1
	cmpa.l	a1,a2
	bls.s	Lfe182c
	bra.s	Lfe1856

Lfe1878:
	clr.w	d5
	cmpi.b	#$2e,(a0)+		;'.'
	beq.s	Lfe1888
	cmpi.b	#$20,-(a0)		;' '
	bhi.s	Lfe186a
	bra.s	Lfe18b6

Lfe1888:
	addq.w	#1,d5
	move.b	(a0),d0
	bsr.w	Lfe4de2
	cmpi.b	#$42,d0			;'B'
	beq.s	Lfe18ac
	cmpi.b	#$53,d0			;'S'
	beq.s	Lfe18ac
	addq.w	#1,d5
	cmpi.b	#$57,d0			;'W'
	beq.s	Lfe18ac
	addq.w	#1,d5
	cmpi.b	#$4c,d0			;'L'
	bne.s	Lfe182c
Lfe18ac:
	addq.l	#1,a0
	cmpi.b	#$20,(a0)		;' '
	bhi.w	Lfe182c
Lfe18b6:
	clr.w	d7
	addq.l	#1,a1
	move.b	(a1)+,d7
	move.b	(a1)+,d6
	asl.w	#8,d6
	move.b	(a1)+,d6
	move.w	d6,($012a,a6)
	movea.l	a0,a5
	bsr.w	Lfe4cc2
	rts

Lfe18ce:
	movea.l	#Lfe1908,a0
	movem.w	d2-d3,-(a7)
	moveq.l	#$02,d1
	moveq.l	#$01,d3
Lfe18dc:
	movea.l	a5,a1
Lfe18de:
	tst.b	(a0)
	beq.s	Lfe1900
	move.b	(a1)+,d0
	bsr.w	Lfe4de2
	cmp.b	(a0)+,d0
	beq.s	Lfe18de
Lfe18ec:
	tst.b	(a0)+
	bne.s	Lfe18ec
	addq.w	#1,d3
	dbra.w	d1,Lfe18dc
	ori.b	#$01,ccr
	movem.w	(a7)+,d2-d3
	rts

Lfe1900:
	addq.l	#4,a7
	movea.l	a1,a5
	moveq.l	#$0d,d2
	rts

Lfe1908:
	.dc.b	'CCR',$00
Lfe190c:
	.dc.b	$53,$52,$00,$55,$53,$50,$00,$00
Lfe1914:
	bsr.w	Lfe1bfe
Lfe1918:
	bsr.w	Lfe4cc2
	bsr.s	Lfe18ce
	bcs.s	Lfe1922
	rts

Lfe1922:
	move.b	(a5),d0
	bsr.w	Lfe4de2
	cmpi.b	#$41,d0			;'A'
	beq.w	Lfe1aba
	cmpi.b	#$53,d0			;'S'
	beq.w	Lfe1aba
	cmpi.b	#$44,d0			;'D'
	beq.w	Lfe1ab2
	cmpi.b	#$28,d0			;'('
	beq.w	Lfe1a20
	cmpi.b	#$2d,d0			;'-'
	bne.s	Lfe1958
	cmpi.b	#$28,($0001,a5)		;'('
	beq.w	Lfe1abe
Lfe1958:
	cmpi.b	#$23,d0			;'#'
	beq.w	Lfe1ad6
	movem.l	d2-d7,-(a7)
	bsr.w	Lfe4226
	bcs.w	Lfe182c
	movem.l	(a7)+,d2-d7
	bsr.w	Lfe4cc2
	cmpi.b	#$28,d0			;'('
	bne.w	Lfe1a86
	addq.l	#1,a5
	move.b	(a5),d0
	bsr.w	Lfe4de2
	cmpi.b	#$41,d0			;'A'
	beq.s	Lfe19ac
	cmpi.b	#$53,d0			;'S'
	beq.s	Lfe19ac
	cmpi.b	#$50,d0			;'P'
	bne.w	Lfe182c
	move.b	($0001,a5),d0
	bsr.w	Lfe4de2
	cmpi.b	#$43,d0			;'C'
	beq.w	Lfe1a3e
	bra.w	Lfe182c

Lfe19ac:
	bsr.w	Lfe1b0e
	bsr.w	Lfe4cc2
	cmpi.b	#$29,d0			;')'
	beq.s	Lfe1a1a
	cmpi.b	#$2c,d0			;','
	bne.w	Lfe182c
Lfe19c2:
	addq.l	#1,a5
	bsr.w	Lfe4cc2
	move.w	d3,-(a7)
	clr.w	d4
	bsr.w	Lfe4de2
	cmpi.b	#$41,d0			;'A'
	beq.s	Lfe1a10
	cmpi.b	#$53,d0			;'S'
	beq.s	Lfe1a10
	bsr.w	Lfe1ae8
Lfe19e0:
	cmpi.b	#$2e,(a5)		;'.'
	bne.s	Lfe1a00
	addq.l	#1,a5
	move.b	(a5)+,d0
	bsr.w	Lfe4de2
	cmpi.b	#$57,d0			;'W'
	beq.s	Lfe1a00
	cmpi.b	#$4c,d0			;'L'
	bne.w	Lfe182c
	bset.l	#$08,d4
Lfe1a00:
	or.w	d3,d4
	move.w	(a7)+,d3
	cmpi.b	#$29,(a5)+		;')'
	bne.w	Lfe182c
	moveq.l	#$06,d2
	rts

Lfe1a10:
	bsr.w	Lfe1b0e
	bset.l	#$03,d4
	bra.s	Lfe19e0

Lfe1a1a:
	addq.l	#1,a5
	moveq.l	#$05,d2
	rts

Lfe1a20:
	addq.l	#1,a5
	bsr.w	Lfe1b0e
	cmpi.b	#$29,(a5)+		;')'
	bne.w	Lfe182c
	cmpi.b	#$2b,(a5)		;'+'
	bne.s	Lfe1a3a
	addq.l	#1,a5
	moveq.l	#$03,d2
	rts

Lfe1a3a:
	moveq.l	#$02,d2
	rts

Lfe1a3e:
	addq.l	#2,a5
	bsr.w	Lfe4cc2
	cmpi.b	#$2c,d0			;','
	beq.s	Lfe1a6e
	cmpi.b	#$29,(a5)+		;')'
	bne.w	Lfe182c
Lfe1a52:
	cmpi.l	#$00008000,d1
	blt.s	Lfe1a5e
	bsr.w	Lfe1c0c
Lfe1a5e:
	cmpi.l	#$ffff8000,d1
	bge.s	Lfe1a6a
	bsr.w	Lfe1c0c
Lfe1a6a:
	moveq.l	#$09,d2
	rts

Lfe1a6e:
	bsr.w	Lfe19c2
	moveq.l	#$0a,d2
	rts

Lfe1a76:
	move.l	a4,d0
	lea.l	($012a,a6),a0
	sub.l	a0,d0
	sub.l	d0,d1
	sub.l	($0036,a6),d1
	bra.s	Lfe1a52

Lfe1a86:
	moveq.l	#$08,d2
	cmpi.b	#$2e,(a5)		;'.'
	bne.s	Lfe1aac
	addq.l	#1,a5
	move.b	(a5)+,d0
	bsr.w	Lfe4de2
	cmpi.b	#$4c,d0			;'L'
	beq.s	Lfe1aac
	cmpi.b	#$52,d0			;'R'
	beq.s	Lfe1a76
	cmpi.b	#$57,d0			;'W'
	bne.w	Lfe182c
	moveq.l	#$07,d2
Lfe1aac:
	rts

Lfe1aae:
	bsr.w	Lfe1bfe
Lfe1ab2:
	bsr.s	Lfe1ae8
	rts

Lfe1ab6:
	bsr.w	Lfe1bfe
Lfe1aba:
	bsr.s	Lfe1b0e
	rts

Lfe1abe:
	addq.l	#1,a5
	cmpi.b	#$28,(a5)+		;'('
	bne.w	Lfe182c
	bsr.s	Lfe1b0e
	cmpi.b	#$29,(a5)+		;')'
	bne.w	Lfe182c
	moveq.l	#$04,d2
	rts

Lfe1ad6:
	addq.l	#1,a5
	movem.l	d2-d7,-(a7)
	bsr.w	Lfe4226
	movem.l	(a7)+,d2-d7
	moveq.l	#$0b,d2
	rts

Lfe1ae8:
	move.b	(a5)+,d0
	bsr.w	Lfe4de2
	cmpi.b	#$44,d0			;'D'
	bne.w	Lfe182c
Lfe1af6:
	clr.w	d3
	clr.w	d2
	move.b	(a5)+,d3
	subi.b	#$30,d3			;'0'
	bcs.w	Lfe182c
	cmpi.b	#$07,d3
	bhi.w	Lfe182c
	rts

Lfe1b0e:
	move.b	(a5),d0
	bsr.w	Lfe4de2
	cmpi.b	#$53,d0			;'S'
	bne.s	Lfe1b30
	addq.l	#1,a5
	move.b	(a5)+,d0
	bsr.w	Lfe4de2
	cmpi.b	#$50,d0			;'P'
	bne.w	Lfe182c
	moveq.l	#$07,d3
	moveq.l	#$01,d2
	rts

Lfe1b30:
	move.b	(a5)+,d0
	bsr.w	Lfe4de2
	cmpi.b	#$41,d0			;'A'
	bne.w	Lfe182c
	bsr.s	Lfe1af6
	moveq.l	#$01,d2
	rts

Lfe1b44:
	bsr.w	Lfe1bfe
Lfe1b48:
	bsr.w	Lfe1918
	cmpi.w	#$0002,d2
	bcs.w	Lfe182c
	beq.s	Lfe1b66
	cmpi.w	#$0005,d2
	bcs.w	Lfe182c
	cmpi.w	#$000b,d2
	bcc.w	Lfe182c
Lfe1b66:
	rts

Lfe1b68:
	bsr.w	Lfe1bfe
Lfe1b6c:
	bsr.w	Lfe1918
	cmpi.w	#$0001,d2
	beq.w	Lfe182c
	cmpi.w	#$000b,d2
	bhi.w	Lfe182c
	rts

Lfe1b82:
	bsr.s	Lfe1bfe
Lfe1b84:
	bsr.w	Lfe1918
Lfe1b88:
	cmpi.w	#$000b,d2
	bhi.w	Lfe182c
	cmpi.w	#$0002,d2
	bcs.w	Lfe182c
	rts

Lfe1b9a:
	bsr.s	Lfe1bfe
Lfe1b9c:
	bsr.w	Lfe1918
Lfe1ba0:
	cmpi.w	#$0009,d2
	bcc.w	Lfe182c
	rts

Lfe1baa:
	bsr.s	Lfe1bfe
Lfe1bac:
	bsr.s	Lfe1b9c
	cmpi.w	#$0001,d2
	beq.w	Lfe182c
	rts

Lfe1bb8:
	bsr.s	Lfe1bfe
Lfe1bba:
	bsr.s	Lfe1b9c
	bra.s	Lfe1b88

Lfe1bbe:
	bsr.s	Lfe1bfe
Lfe1bc0:
	bsr.s	Lfe1b48
	bra.s	Lfe1ba0

Lfe1bc4:
	bsr.s	Lfe1bfe
Lfe1bc6:
	bsr.w	Lfe1918
	cmpi.w	#$000b,d2
	bne.w	Lfe182c
	rts

Lfe1bd4:
	tst.w	d5
	beq.s	Lfe1be0
	cmpi.w	#$0003,d5
	bne.w	Lfe182c
Lfe1be0:
	rts

Lfe1be2:
	tst.w	d5
	beq.s	Lfe1bee
	cmpi.w	#$0002,d5
	bne.w	Lfe182c
Lfe1bee:
	rts

Lfe1bf0:
	tst.w	d5
	beq.s	Lfe1bfc
	cmpi.w	#$0001,d5
	bne.w	Lfe182c
Lfe1bfc:
	rts

Lfe1bfe:
	bsr.w	Lfe4cc2
	cmpi.b	#$2c,(a5)+		;','
	bne.w	Lfe182c
	rts

Lfe1c0c:
	movem.l	d0-d2/a0-a2,-(a7)
	lea.l	(Lfe1c20),a0
	bsr.w	Lfe4bc8
	movem.l	(a7)+,d0-d2/a0-a2
	rts

Lfe1c20:
	.dc.b	'offset overs',$0d,$0a,$00,$00
Lfe1c30:
	move.w	d6,($012a,a6)
Lfe1c34:
	cmpi.w	#$0001,d2
	bne.s	Lfe1c42
	cmpi.w	#$0001,d5
	beq.w	Lfe182c
Lfe1c42:
	cmpi.w	#$0005,d2
	bcc.s	Lfe1c4c
	bsr.s	Lfe1cb8
	rts

Lfe1c4c:
	bne.s	Lfe1c54
	bsr.s	Lfe1cb8
	move.w	d1,(a4)+
	rts

Lfe1c54:
	cmpi.w	#$0007,d2
	bcc.s	Lfe1c62
	bsr.s	Lfe1cb8
	bsr.w	Lfe1d88
	rts

Lfe1c62:
	cmpi.w	#$000d,d2
	bhi.w	Lfe182c
	cmpi.w	#$000c,d2
	bcc.s	Lfe1c9a
	subq.w	#7,d2
	move.w	d2,d3
	moveq.l	#$07,d2
	bsr.s	Lfe1cb8
	cmpi.w	#$0001,d3
	bhi.s	Lfe1c88
	beq.s	Lfe1c84
Lfe1c80:
	move.w	d1,(a4)+
	rts

Lfe1c84:
	move.l	d1,(a4)+
	rts

Lfe1c88:
	cmpi.w	#$0003,d3
	beq.w	Lfe1d88
	bcs.s	Lfe1c80
	cmpi.w	#$0002,d5
	bhi.s	Lfe1c84
	bra.s	Lfe1c80

Lfe1c9a:
	bne.s	Lfe1c9e
	rts

Lfe1c9e:
	cmpi.w	#$0002,d3
	bhi.s	Lfe1cb6
	tst.w	d3
	beq.s	Lfe1cb6
	movem.w	d2-d3,-(a7)
	moveq.l	#$07,d2
	moveq.l	#$04,d3
	bsr.s	Lfe1cb8
	movem.w	(a7)+,d2-d3
Lfe1cb6:
	rts

Lfe1cb8:
	movem.w	d2-d3,-(a7)
	andi.w	#$0007,d2
	andi.w	#$0007,d3
	asl.w	#3,d2
	or.w	d2,d3
	andi.w	#$ffc0,($012a,a6)
	or.w	d3,($012a,a6)
	movem.w	(a7)+,d2-d3
	rts

Lfe1cd8:
	asl.w	#6,d0
	move.w	d1,-(a7)
	move.w	($012a,a6),d1
	andi.w	#$fe3f,d1
	andi.w	#$01c0,d0
	or.w	d0,d1
	move.w	d1,($012a,a6)
	move.w	(a7)+,d1
	rts

Lfe1cf2:
	tst.w	d5
	beq.s	Lfe1d18
	cmpi.w	#$0002,d5
	beq.s	Lfe1d18
	bhi.s	Lfe1d14
	moveq.l	#$10,d0
Lfe1d00:
	move.w	d1,-(a7)
	move.b	($012a,a6),d1
	andi.w	#$00cf,d1
	or.w	d0,d1
	move.b	d1,($012a,a6)
	move.w	(a7)+,d1
	rts

Lfe1d14:
	moveq.l	#$20,d0			;' '
	bra.s	Lfe1d00

Lfe1d18:
	moveq.l	#$30,d0			;'0'
	bra.s	Lfe1d00

Lfe1d1c:
	movem.w	d0-d3,-(a7)
	move.w	($012a,a6),-(a7)
	bsr.w	Lfe1c34
	move.w	($012a,a6),d0
	move.w	d0,d1
	ror.w	#7,d1
	asl.w	#3,d0
	andi.w	#$01c0,d0
	andi.w	#$0e00,d1
	or.w	d0,d1
	move.w	(a7)+,d0
	andi.w	#$f03f,d0
	or.w	d0,d1
	move.w	d1,($012a,a6)
	movem.w	(a7)+,d0-d3
	rts

Lfe1d4e:
	movem.w	d2-d3,-(a7)
	add.w	d3,d3
	andi.w	#$000f,d3
	move.b	($012a,a6),d2
	andi.w	#$00f1,d2
	or.w	d3,d2
	move.b	d2,($012a,a6)
	movem.w	(a7)+,d2-d3
	rts

Lfe1d6c:
	bsr.s	Lfe1d4e
Lfe1d6e:
	move.w	d5,d0
	bne.s	Lfe1d74
	moveq.l	#$02,d0
Lfe1d74:
	subq.w	#1,d0
	asl.w	#6,d0
	andi.w	#$00c0,d0
	andi.w	#$ff3f,($012a,a6)
	or.w	d0,($012a,a6)
	rts

Lfe1d88:
	movem.w	d1-d2,-(a7)
	move.b	d4,d2
	asl.w	#4,d2
	asl.w	#8,d2
	btst.l	#$08,d4
	beq.s	Lfe1d9c
	bset.l	#$0b,d2
Lfe1d9c:
	cmpi.l	#$00000080,d1
	blt.s	Lfe1da8
	bsr.w	Lfe1c0c
Lfe1da8:
	cmpi.l	#$ffffff80,d1
	bge.s	Lfe1db4
	bsr.w	Lfe1c0c
Lfe1db4:
	andi.w	#$00ff,d1
	or.w	d1,d2
	move.w	d2,(a4)+
	movem.w	(a7)+,d1-d2
	rts

Lfe1dc2:
	bsr.w	Lfe1bfe
Lfe1dc6:
	bsr.w	Lfe1b48
Lfe1dca:
	bsr.w	Lfe1c34
	rts

Lfe1dd0:
	bsr.w	Lfe1bfe
Lfe1dd4:
	bsr.w	Lfe1b6c
	bra.s	Lfe1dca

Lfe1dda:
	bsr.w	Lfe1bfe
	bsr.w	Lfe1b84
	bra.s	Lfe1dca

Lfe1de4:
	bsr.w	Lfe1bfe
	bsr.w	Lfe1b9c
	bra.s	Lfe1dca

Lfe1dee:
	bsr.w	Lfe1bfe
Lfe1df2:
	bsr.w	Lfe1bac
	bra.s	Lfe1dca

Lfe1df8:
	bsr.w	Lfe1bfe
	bsr.w	Lfe1bba
	bra.s	Lfe1dca

Lfe1e02:
	bsr.w	Lfe1bfe
	bsr.w	Lfe1bc0
	bra.s	Lfe1dca

Lfe1e0c:
	bsr.w	Lfe18ce
	bcs.s	Lfe1e40
	cmpi.w	#$0002,d3
	bcs.w	Lfe182c
	beq.s	Lfe1e32
	bsr.w	Lfe1bd4
	bsr.w	Lfe1ab6
	ori.w	#$4e68,d2
	move.w	d2,($012a,a6)
	or.w	d3,($012a,a6)
	rts

Lfe1e32:
	bsr.w	Lfe1be2
	bsr.s	Lfe1dee
	ori.w	#$40c0,($012a,a6)
	rts

Lfe1e40:
	bsr.w	Lfe1918
	cmpi.w	#$0001,d2
	bne.s	Lfe1e6a
	move.w	d3,($012a,a6)
	bsr.w	Lfe1bfe
	bsr.w	Lfe18ce
	bcs.s	Lfe1e68
	cmpi.w	#$0003,d3
	bne.w	Lfe182c
	ori.w	#$4e60,($012a,a6)
	rts

Lfe1e68:
	subq.l	#1,a5
Lfe1e6a:
	bsr.w	Lfe1c34
	movem.w	d2-d3,-(a7)
	bsr.w	Lfe1914
	cmpi.w	#$000d,d2
	bne.s	Lfe1eac
	ori.w	#$44c0,($012a,a6)
	cmpi.w	#$0001,d3
	beq.s	Lfe1e96
	cmpi.w	#$0002,d3
	bne.w	Lfe182c
	bset.b	#$01,($012a,a6)
Lfe1e96:
	movem.w	(a7)+,d2-d3
	cmpi.w	#$0001,d2
	beq.w	Lfe182c
	cmpi.w	#$000b,d2
	bhi.w	Lfe182c
	rts

Lfe1eac:
	bsr.w	Lfe1cf2
	cmpi.w	#$0008,d2
	bhi.w	Lfe182c
	cmpi.w	#$0001,d2
	beq.w	Lfe182c
	bsr.w	Lfe1d1c
	addq.l	#4,a7
	rts

Lfe1ec8:
	cmpi.w	#$0001,d5
	beq.w	Lfe182c
	cmpi.w	#$0002,d5
	bls.s	Lfe1edc
	bset.b	#$06,($012b,a6)
Lfe1edc:
	move.b	(a5),d0
	bsr.w	Lfe4de2
	cmpi.b	#$41,d0			;'A'
	beq.s	Lfe1eee
	cmpi.b	#$44,d0			;'D'
	bne.s	Lfe1f20
Lfe1eee:
	bsr.s	Lfe1f54
	move.w	d0,(a4)+
	bsr.w	Lfe1de4
	cmpi.w	#$0002,d2
	bcs.w	Lfe182c
	cmpi.w	#$0003,d2
	beq.w	Lfe182c
	cmpi.w	#$0004,d2
	bne.s	Lfe1f1e
	moveq.l	#$0f,d2
	move.w	($012c,a6),d0
Lfe1f12:
	lsr.w	#1,d0
	roxl.w	#1,d1
	dbra.w	d2,Lfe1f12
	move.w	d1,($012c,a6)
Lfe1f1e:
	rts

Lfe1f20:
	bset.b	#$02,($012a,a6)
	addq.l	#2,a4
	bsr.w	Lfe1918
	cmpi.w	#$0002,d2
	bcs.w	Lfe182c
	cmpi.w	#$0004,d2
	beq.w	Lfe182c
	cmpi.w	#$000b,d2
	bcc.w	Lfe182c
	bsr.w	Lfe1c34
	bsr.w	Lfe1bfe
	bsr.s	Lfe1f54
	move.w	d0,($012c,a6)
	rts

Lfe1f54:
	move.b	(a5),d0
	bsr.w	Lfe4de2
	cmpi.b	#$44,d0			;'D'
	beq.s	Lfe1f68
	cmpi.b	#$41,d0			;'A'
	bne.w	Lfe182c
Lfe1f68:
	movem.l	d1-d5,-(a7)
	clr.w	d5
	moveq.l	#$14,d4
Lfe1f70:
	move.b	(a5),d0
	bsr.w	Lfe4de2
	cmpi.b	#$44,d0			;'D'
	bne.s	Lfe1f82
	bsr.w	Lfe1ae8
	bra.s	Lfe1f86

Lfe1f82:
	bsr.w	Lfe1b0e
Lfe1f86:
	asl.w	#3,d2
	add.w	d2,d3
	bset.l	d3,d5
	cmpi.b	#$2d,(a5)		;'-'
	beq.s	Lfe1fa4
	cmpi.b	#$2f,(a5)+		;'/'
	dbne.w	d4,Lfe1f70
	subq.l	#1,a5
Lfe1f9c:
	move.w	d5,d0
	movem.l	(a7)+,d1-d5
	rts

Lfe1fa4:
	addq.l	#1,a5
	movem.w	d3/d5,-(a7)
	btst.l	#$03,d2
	bne.s	Lfe1fb6
	bsr.w	Lfe1ae8
	bra.s	Lfe1fba

Lfe1fb6:
	bsr.w	Lfe1b0e
Lfe1fba:
	asl.w	#3,d2
	add.w	d3,d2
	movem.w	(a7)+,d3/d5
	cmp.w	d3,d2
	bls.w	Lfe182c
Lfe1fc8:
	bset.l	d3,d5
	addq.w	#1,d3
	cmp.w	d3,d2
	bcc.s	Lfe1fc8
	cmpi.b	#$2f,(a5)+		;'/'
	beq.s	Lfe1f70
	subq.l	#1,a5
	bra.s	Lfe1f9c

Lfe1fda:
	bsr.w	Lfe1bc6
	tst.w	d1
	beq.w	Lfe182c
	cmpi.w	#$0008,d1
	bhi.w	Lfe182c
	bne.s	Lfe1ff0
	clr.w	d1
Lfe1ff0:
	move.w	d1,d3
	bsr.w	Lfe1d6c
	bra.w	Lfe1de4

Lfe1ffa:
	bsr.w	Lfe1bc6
	bsr.w	Lfe1d6e
	bsr.w	Lfe1c34
	bra.w	Lfe1dee

Lfe200a:
	bsr.w	Lfe1918
	tst.w	d2
	beq.s	Lfe2020
	cmpi.w	#$0004,d2
	bne.w	Lfe182c
	bset.b	#$03,($012b,a6)
Lfe2020:
	move.w	d2,-(a7)
	or.w	d3,($012a,a6)
	bsr.w	Lfe1d6e
	bsr.w	Lfe1914
	cmp.w	(a7)+,d2
	bne.w	Lfe182c
	bra.w	Lfe1d4e

Lfe2038:
	bsr.w	Lfe1b6c
Lfe203c:
	bsr.w	Lfe1d6e
	tst.w	d2
	beq.s	Lfe2050
Lfe2044:
	bsr.w	Lfe1c34
	bsr.w	Lfe1aae
	bra.w	Lfe1d4e

Lfe2050:
	movem.l	d3/a5,-(a7)
	bsr.w	Lfe1914
	movem.l	(a7)+,d3/a5
	tst.w	d2
	beq.s	Lfe2044
	bsr.w	Lfe1d4e
	bset.b	#$00,($012a,a6)
	bra.w	Lfe1df8

Lfe206e:
	bsr.w	Lfe1bf0
	moveq.l	#$01,d5
	bra.s	Lfe200a

Lfe2076:
	bsr.w	Lfe1918
	cmpi.w	#$0001,d2
	bcs.s	Lfe20a8
	beq.w	Lfe182c
	cmpi.w	#$000b,d2
	beq.s	Lfe20c0
	cmpi.w	#$0009,d2
	bcc.w	Lfe182c
	bsr.w	Lfe1be2
	bsr.w	Lfe1c34
Lfe209a:
	bsr.w	Lfe4cc2
	cmpi.b	#$2c,(a5)		;','
	beq.w	Lfe182c
	rts

Lfe20a8:
	bset.b	#$05,($012b,a6)
Lfe20ae:
	bsr.w	Lfe1d6e
	bsr.w	Lfe1d4e
	bsr.w	Lfe1aae
	or.w	d3,($012a,a6)
	rts

Lfe20c0:
	move.w	d1,d3
	bne.s	Lfe20c6
	moveq.l	#$08,d3
Lfe20c6:
	cmpi.w	#$0008,d3
	bhi.w	Lfe182c
	bra.s	Lfe20ae

Lfe20d0:
	bsr.w	Lfe1918
	tst.w	d2
	beq.s	Lfe2102
	cmpi.w	#$000b,d2
	bne.w	Lfe182c
	bset.b	#$03,($012a,a6)
	cmpi.l	#$0000ffff,d1
	bls.s	Lfe20f2
	bsr.w	Lfe1c0c
Lfe20f2:
	move.w	d1,(a4)+
Lfe20f4:
	bsr.w	Lfe1dee
	tst.w	d2
	beq.w	Lfe1bd4
	bra.w	Lfe1bf0

Lfe2102:
	bsr.w	Lfe1d4e
	bset.b	#$00,($012a,a6)
	bra.s	Lfe20f4

Lfe210e:
	bsr.w	Lfe1bc6
	bsr.w	Lfe1d6e
	bsr.w	Lfe1c34
	bsr.w	Lfe1914
	cmpi.w	#$000d,d2
	bne.s	Lfe213e
	bsr.w	Lfe1c34
	cmpi.w	#$0002,d3
	bhi.w	Lfe182c
	beq.w	Lfe1be2
	bclr.b	#$06,($012b,a6)
	bra.w	Lfe1bf0

Lfe213e:
	cmpi.w	#$0009,d2
	bcc.w	Lfe182c
	cmpi.w	#$0001,d2
	beq.w	Lfe182c
	bra.w	Lfe1c34

Lfe2152:
	bsr.w	Lfe1dd4
	bsr.w	Lfe1aae
	bsr.w	Lfe1d4e
	bra.w	Lfe1be2

Lfe2162:
	bsr.w	Lfe1df2
	bsr.w	Lfe1d6e
	bra.w	Lfe209a

Lfe216e:
	bsr.w	Lfe1918
	bsr.w	Lfe1c34
	bsr.w	Lfe1d6e
	bsr.w	Lfe1aae
	bra.w	Lfe1d4e

Lfe2182:
	bsr.w	Lfe1918
	cmpi.w	#$0003,d2
	bne.w	Lfe182c
	moveq.l	#$01,d2
	bsr.w	Lfe1cb8
	bsr.w	Lfe1914
	cmpi.w	#$0003,d2
	bne.w	Lfe182c
	bsr.w	Lfe1d4e
	bra.w	Lfe1d6e

Lfe21a8:
	bsr.w	Lfe1ab2
	bsr.w	Lfe1d4e
	bsr.w	Lfe1dee
	bset.b	#$00,($012a,a6)
	bra.w	Lfe1d6e

Lfe21be:
	bsr.w	Lfe1918
	cmpi.w	#$0001,d2
	bhi.w	Lfe182c
	movem.w	d2-d3,-(a7)
	bsr.w	Lfe1914
	cmpi.w	#$0001,d2
	bhi.w	Lfe182c
	movem.w	(a7)+,d0-d1
	cmp.w	d2,d0
	beq.s	Lfe21f4
	bhi.s	Lfe21e6
	exg.l	d1,d3
Lfe21e6:
	ori.w	#$0088,d1
	move.b	d1,($012b,a6)
	bsr.w	Lfe1d4e
	rts

Lfe21f4:
	bsr.w	Lfe1d4e
	ori.w	#$0040,d1
	tst.w	d2
	beq.s	Lfe2204
	bset.l	#$03,d1
Lfe2204:
	move.b	d1,($012b,a6)
	bra.w	Lfe1bd4

Lfe220c:
	bsr.w	Lfe1aba
	or.b	d3,($012b,a6)
Lfe2214:
	bra.w	Lfe209a

Lfe2218:
	bsr.w	Lfe1dc6
	bra.s	Lfe2214

Lfe221e:
	bsr.w	Lfe1dc6
	bsr.w	Lfe1ab6
	add.w	d3,d3
	or.b	d3,($012a,a6)
	bra.w	Lfe1bd4

Lfe2230:
	bsr.w	Lfe1aba
	or.b	d3,($012b,a6)
	bsr.w	Lfe1bc4
	cmpi.l	#$00008000,d1
	blt.s	Lfe2248
	bsr.w	Lfe1c0c
Lfe2248:
	cmpi.l	#$ffff8000,d1
	bge.s	Lfe2254
	bsr.w	Lfe1c0c
Lfe2254:
	move.w	d1,(a4)+
	rts

Lfe2258:
	cmpi.w	#$0001,d5
	beq.w	Lfe182c
	bsr.w	Lfe1918
	bsr.w	Lfe1c34
	bsr.w	Lfe1ab6
	bsr.w	Lfe1d1c
	bsr.w	Lfe1cf2
	rts

Lfe2276:
	bsr.w	Lfe1bf0
	bsr.w	Lfe1df2
Lfe227e:
	bra.w	Lfe209a

Lfe2282:
	bsr.w	Lfe1bc6
	cmpi.l	#$0000007f,d1
	ble.s	Lfe2292
	bsr.w	Lfe1c0c
Lfe2292:
	cmpi.l	#$ffffff80,d1
	bge.s	Lfe229e
	bsr.w	Lfe1c0c
Lfe229e:
	move.b	d1,($012b,a6)
	bsr.w	Lfe1aae
	bsr.w	Lfe1d4e
	bra.w	Lfe1bd4

Lfe22ae:
	bsr.w	Lfe1bc6
	move.w	d1,(a4)+
	bra.s	Lfe227e

Lfe22b6:
	bsr.w	Lfe1ab2
	or.b	d3,($012b,a6)
	btst.b	#$06,($012b,a6)
	beq.s	Lfe22cc
	bsr.w	Lfe1be2
	bra.s	Lfe227e

Lfe22cc:
	cmpi.w	#$0001,d5
	beq.w	Lfe182c
	move.w	d5,d0
	bne.s	Lfe22da
	moveq.l	#$02,d0
Lfe22da:
	asl.w	#6,d0
	or.b	d0,($012b,a6)
	bra.s	Lfe227e

Lfe22e2:
	bsr.w	Lfe1bc6
	cmpi.w	#$000f,d1
	bhi.w	Lfe182c
	or.b	d1,($012b,a6)
	bra.w	Lfe209a

Lfe22f6:
	bsr.w	Lfe1918
	tst.w	d2
	beq.s	Lfe232e
	cmpi.w	#$0005,d2
	bne.w	Lfe182c
	bsr.w	Lfe1c34
	bsr.w	Lfe1aae
	bsr.w	Lfe1d4e
Lfe2312:
	bclr.b	#$05,($012b,a6)
	cmpi.w	#$0001,d5
	beq.w	Lfe182c
	cmpi.w	#$0003,d5
	bne.s	Lfe232c
	bset.b	#$06,($012b,a6)
Lfe232c:
	rts

Lfe232e:
	bsr.w	Lfe1d4e
	bset.b	#$07,($012b,a6)
	bsr.w	Lfe1914
	cmpi.w	#$0005,d2
	bne.w	Lfe182c
	bsr.w	Lfe1c34
	bra.s	Lfe2312

Lfe234a:
	bsr.w	Lfe1918
	bra.w	Lfe203c

Lfe2352:
	cmpi.w	#$0001,d5
	beq.w	Lfe182c
	bsr.w	Lfe1918
	bsr.w	Lfe1c34
	bsr.w	Lfe1ab6
	bsr.w	Lfe1d4e
	cmpi.w	#$0003,d5
	bne.s	Lfe2376
	bset.b	#$00,($012a,a6)
Lfe2376:
	rts

Lfe2378:
	rts

Lfe237a:
	bsr.w	Lfe1918
	cmpi.w	#$0009,d2
	beq.s	Lfe238a
	subq.l	#2,d1
	sub.l	($0036,a6),d1
Lfe238a:
	cmpi.w	#$0009,d2
	bhi.w	Lfe182c
	cmpi.w	#$0007,d2
	bcs.w	Lfe182c
	cmpi.w	#$0003,d5
	bcc.w	Lfe182c
	cmpi.w	#$0001,d5
	bne.s	Lfe23cc
	cmpi.l	#$00000080,d1
	blt.s	Lfe23b4
	bsr.w	Lfe1c0c
Lfe23b4:
	cmpi.l	#$ffffff80,d1
	bge.s	Lfe23c0
	bsr.w	Lfe1c0c
Lfe23c0:
	tst.w	d1
	beq.w	Lfe182c
	move.b	d1,($012b,a6)
	rts

Lfe23cc:
	cmpi.l	#$00008000,d1
	blt.s	Lfe23d8
	bsr.w	Lfe1c0c
Lfe23d8:
	cmpi.l	#$ffff8000,d1
	bge.s	Lfe23e4
	bsr.w	Lfe1c0c
Lfe23e4:
	move.w	d1,(a4)+
	rts

Lfe23e8:
	bsr.w	Lfe1ab2
	or.b	d3,($012b,a6)
	bsr.w	Lfe1914
	cmpi.w	#$0009,d2
	beq.s	Lfe2402
	subi.w	#$0002,d1
	sub.l	($0036,a6),d1
Lfe2402:
	cmpi.w	#$0009,d2
	bhi.w	Lfe182c
	cmpi.w	#$0007,d2
	bcs.w	Lfe182c
	bra.s	Lfe23cc

Lfe2414:
	bsr.w	Lfe1bf0
	bsr.w	Lfe1df2
	bra.w	Lfe209a

Lfe2420:
	bsr.w	Lfe1918
	tst.w	d2
	beq.s	Lfe245a
	cmpi.w	#$000b,d2
	bne.w	Lfe182c
	bset.b	#$03,($012a,a6)
	move.w	d1,(a4)+
	bsr.w	Lfe1914
	cmpi.w	#$000b,d2
	bcc.w	Lfe182c
Lfe2444:
	cmpi.w	#$0001,d2
	beq.w	Lfe182c
	bsr.w	Lfe1c34
	tst.w	d2
	beq.w	Lfe1bd4
	bra.w	Lfe1bf0

Lfe245a:
	bsr.w	Lfe1d4e
	bset.b	#$00,($012a,a6)
	bsr.w	Lfe1914
	bra.s	Lfe2444

Lfe246a:
	bsr.w	Lfe1bd4
	bsr.w	Lfe1dc6
	bra.w	Lfe209a

Lfe2476:
	movea.l	($0036,a6),a4
	bsr.w	Lfe4cc2
	tst.b	d0
	beq.w	Lfe182c
Lfe2484:
	move.w	d5,-(a7)
	bsr.s	Lfe24b8
	move.w	(a7)+,d5
	bcs.w	Lfe182c
	bsr.w	Lfe4cc2
	tst.b	d0
	beq.s	Lfe24a6
	cmp.b	#$2c,d0			;','
	bne.w	Lfe182c
	addq.l	#1,a5
	bsr.w	Lfe4cc2
	bra.s	Lfe2484

Lfe24a6:
	move.l	a4,d0
	addq.l	#1,d0
	bclr.l	#$00,d0
	move.l	d0,($0036,a6)
	lea.l	($012a,a6),a4
	rts

Lfe24b8:
	cmp.b	#$27,d0			;'''
	beq.s	Lfe24fa
	cmp.b	#$22,d0			;'"'
	beq.s	Lfe24fa
	bsr.w	Lfe4226
	bcs.s	Lfe2516
	tst.w	d5
	beq.s	Lfe24ea
	cmp.w	#$0001,d5
	beq.s	Lfe24de
	cmp.w	#$0002,d5
	beq.s	Lfe24ea
	move.l	d6,(a4)+
	bra.s	Lfe24f4

Lfe24de:
	cmp.l	#$00000100,d6
	bcc.s	Lfe2516
	move.b	d6,(a4)+
	bra.s	Lfe24f4

Lfe24ea:
	cmp.l	#$00010000,d6
	bcc.s	Lfe2516
	move.w	d6,(a4)+
Lfe24f4:
	andi.b	#$fe,ccr
	rts

Lfe24fa:
	cmp.w	#$0001,d5
	bne.s	Lfe2516
	addq.l	#1,a5
	move.w	d0,d1
Lfe2504:
	move.b	(a5)+,d0
	move.b	d0,(a4)+
	beq.s	Lfe250e
	cmp.b	d0,d1
	bne.s	Lfe2504
Lfe250e:
	clr.b	-(a4)
	andi.b	#$fe,ccr
	rts

Lfe2516:
	ori.b	#$01,ccr
	rts

Lfe251c:
	.dc.b	'ABCD',$00
Lfe2521:
	.dc.b	$06,$c1,$00,$41,$44,$44,$00,$1b
	.dc.b	$d0,$00,$41,$44,$44,$41,$00,$1c
	.dc.b	$d0,$c0,$41,$44,$44,$49,$00,$03
	.dc.b	$06,$00,$41,$44,$44,$51,$00,$02
	.dc.b	$50,$00,$41,$44,$44,$58,$00,$04
	.dc.b	$d1,$00,$41,$4e,$44,$00,$05,$c0
	.dc.b	$00,$41,$4e,$44,$49,$00,$09,$02
	.dc.b	$00,$41,$53,$4c,$00,$07,$e1,$c0
	.dc.b	$41,$53,$52,$00,$07,$e0,$c0,$42
	.dc.b	$43,$43,$00,$1e,$64,$00,$42,$43
	.dc.b	$53,$00,$1e,$65,$00,$42,$45,$51
	.dc.b	$00,$1e,$67,$00,$42,$47,$45,$00
	.dc.b	$1e,$6c,$00,$42,$47,$54,$00,$1e
	.dc.b	$6e,$00,$42,$48,$49,$00,$1e,$62
	.dc.b	$00,$42,$4c,$45,$00,$1e,$6f,$00
	.dc.b	$42,$4c,$53,$00,$1e,$63,$00,$42
	.dc.b	$4c,$54,$00,$1e,$6d,$00,$42,$4d
	.dc.b	$49,$00,$1e,$6b,$00,$42,$4e,$45
	.dc.b	$00,$1e,$66,$00,$42,$50,$4c,$00
	.dc.b	$1e,$6a,$00,$42,$56,$43,$00,$1e
	.dc.b	$68,$00,$42,$56,$53,$00,$1e,$69
	.dc.b	$00,$42,$43,$48,$47,$00,$08,$00
	.dc.b	$40,$42,$43,$4c,$52,$00,$08,$00
	.dc.b	$80,$42,$52,$41,$00,$1e,$60,$00
	.dc.b	$42,$53,$45,$54,$00,$08,$00,$c0
	.dc.b	$42,$53,$52,$00,$1e,$61,$00,$42
	.dc.b	$54,$53,$54,$00,$21,$00,$00,$43
	.dc.b	$48,$4b,$00,$0a,$41,$80,$43,$4c
	.dc.b	$52,$00,$0b,$42,$00,$43,$4d,$50
	.dc.b	$00,$0c,$b0,$00,$43,$4d,$50,$41
	.dc.b	$00,$1c,$b0,$c0,$43,$4d,$50,$49
	.dc.b	$00,$03,$0c,$00,$43,$4d,$50,$4d
	.dc.b	$00,$0d,$b1,$08,$44,$42,$43,$43
	.dc.b	$00,$1f,$54,$c8,$44,$42,$43,$53
	.dc.b	$00,$1f,$55,$c8,$44,$42,$45,$51
	.dc.b	$00,$1f,$57,$c8,$44,$42,$46,$00
	.dc.b	$1f,$51,$c8,$44,$42,$52,$41,$00
	.dc.b	$1f,$51,$c8,$44,$42,$47,$45,$00
	.dc.b	$1f,$5c,$c8,$44,$42,$47,$54,$00
	.dc.b	$1f,$5e,$c8,$44,$42,$48,$49,$00
	.dc.b	$1f,$52,$c8,$44,$42,$4c,$45,$00
	.dc.b	$1f,$5f,$c8,$44,$42,$4c,$53,$00
	.dc.b	$1f,$53,$c8,$44,$42,$4c,$54,$00
	.dc.b	$1f,$5d,$c8,$44,$42,$4d,$49,$00
	.dc.b	$1f,$5b,$c8,$44,$42,$4e,$45,$00
	.dc.b	$1f,$56,$c8,$44,$42,$50,$4c,$00
	.dc.b	$1f,$5a,$c8,$44,$42,$54,$00,$1f
	.dc.b	$50,$c8,$44,$42,$56,$43,$00,$1f
	.dc.b	$58,$c8,$44,$42,$56,$53,$00,$1f
	.dc.b	$59,$c8,$44,$49,$56,$53,$00,$0a
	.dc.b	$81,$c0,$44,$49,$56,$55,$00,$0a
	.dc.b	$80,$c0,$44,$43,$00,$23,$00,$00
	.dc.b	$45,$4f,$52,$00,$0e,$b0,$00,$45
	.dc.b	$4f,$52,$49,$00,$09,$0a,$00,$45
	.dc.b	$58,$47,$00,$0f,$c1,$00,$45,$58
	.dc.b	$54,$00,$18,$48,$00,$49,$4c,$4c
	.dc.b	$45,$47,$41,$4c,$00,$1d,$4a,$fc
	.dc.b	$4a,$4d,$50,$00,$11,$4e,$c0,$4a
	.dc.b	$53,$52,$00,$11,$4e,$80,$4c,$45
	.dc.b	$41,$00,$12,$41,$c0,$4c,$49,$4e
	.dc.b	$4b,$00,$13,$4e,$50,$4c,$53,$4c
	.dc.b	$00,$07,$e3,$c8,$4c,$53,$52,$00
	.dc.b	$07,$e2,$c8,$4d,$4f,$56,$45,$00
	.dc.b	$00,$00,$00,$4d,$4f,$56,$45,$41
	.dc.b	$00,$14,$00,$40,$4d,$4f,$56,$45
	.dc.b	$4d,$00,$01,$48,$80,$4d,$4f,$56
	.dc.b	$45,$50,$00,$1a,$01,$08,$4d,$4f
	.dc.b	$56,$45,$51,$00,$16,$70,$00,$4d
	.dc.b	$55,$4c,$53,$00,$0a,$c1,$c0,$4d
	.dc.b	$55,$4c,$55,$00,$0a,$c0,$c0,$4e
	.dc.b	$42,$43,$44,$00,$15,$48,$00,$4e
	.dc.b	$45,$47,$00,$0b,$44,$00,$4e,$45
	.dc.b	$47,$58,$00,$0b,$40,$00,$4e,$4f
	.dc.b	$50,$00,$1d,$4e,$71,$4e,$4f,$54
	.dc.b	$00,$0b,$46,$00,$4f,$52,$00,$05
	.dc.b	$80,$00,$4f,$52,$49,$00,$09,$00
	.dc.b	$00,$50,$45,$41,$00,$22,$48,$40
	.dc.b	$52,$45,$53,$45,$54,$00,$1d,$4e
	.dc.b	$70,$52,$4f,$4c,$00,$07,$e7,$d8
	.dc.b	$52,$4f,$52,$00,$07,$e6,$d8,$52
	.dc.b	$4f,$58,$4c,$00,$07,$e5,$d0,$52
	.dc.b	$4f,$58,$52,$00,$07,$e4,$d0,$52
	.dc.b	$54,$45,$00,$1d,$4e,$73,$52,$54
	.dc.b	$52,$00,$1d,$4e,$77,$52,$54,$53
	.dc.b	$00,$1d,$4e,$75,$53,$42,$43,$44
	.dc.b	$00,$06,$81,$00,$53,$43,$43,$00
	.dc.b	$20,$54,$c0,$53,$43,$53,$00,$20
	.dc.b	$55,$c0,$53,$45,$51,$00,$20,$57
	.dc.b	$c0,$53,$46,$00,$20,$51,$c0,$53
	.dc.b	$47,$45,$00,$20,$5c,$c0,$53,$47
	.dc.b	$54,$00,$20,$5e,$c0,$53,$48,$49
	.dc.b	$00,$20,$52,$c0,$53,$4c,$45,$00
	.dc.b	$20,$5f,$c0,$53,$4c,$53,$00,$20
	.dc.b	$53,$c0,$53,$4c,$54,$00,$20,$5d
	.dc.b	$c0,$53,$4d,$49,$00,$20,$5b,$c0
	.dc.b	$53,$4e,$45,$00,$20,$56,$c0,$53
	.dc.b	$50,$4c,$00,$20,$5a,$c0,$53,$54
	.dc.b	$00,$20,$50,$c0,$53,$56,$43,$00
	.dc.b	$20,$58,$c0,$53,$56,$53,$00,$20
	.dc.b	$59,$c0,$53,$54,$4f,$50,$00,$17
	.dc.b	$4e,$72,$53,$55,$42,$00,$1b,$90
	.dc.b	$00,$53,$55,$42,$41,$00,$1c,$90
	.dc.b	$c0,$53,$55,$42,$49,$00,$03,$04
	.dc.b	$00,$53,$55,$42,$51,$00,$02,$51
	.dc.b	$00,$53,$55,$42,$58,$00,$04,$91
	.dc.b	$00,$53,$57,$41,$50,$00,$18,$48
	.dc.b	$40,$54,$41,$53,$00,$15,$4a,$c0
	.dc.b	$54,$52,$41,$50,$00,$19,$4e,$40
	.dc.b	$54,$52,$41,$50,$56,$00,$1d,$4e
	.dc.b	$76,$54,$53,$54,$00,$0b,$4a,$00
	.dc.b	$55,$4e,$4c,$4b,$00,$10,$4e,$58
Lfe2899:
	.dc.b	$00,$4e,$75
Lfe289c:
	cmpi.b	#$3d,(a5)		;'='
	bne.s	Lfe28d4
	addq.l	#1,a5
	bsr.w	Lfe029e
	tst.b	(a5)
	bne.w	Lfe022e
	tst.w	($0000.w,a6)
	beq.w	Lfe022e
	move.l	($0002,a6),d0
	bmi.s	Lfe28c6
	move.l	d0,($0096,a6)
	bclr.b	#$00,($0099,a6)
Lfe28c6:
	cmpi.w	#$0002,($0000.w,a6)
	bne.s	Lfe290c
	move.l	($0006,a6),d0
	bra.s	Lfe28fe

Lfe28d4:
	bsr.w	Lfe029e
	bsr.w	Lfe4cc2
	tst.b	d0
	beq.s	Lfe28e8
	cmp.b	#$3a,d0			;':'
	bne.w	Lfe022e
Lfe28e8:
	tst.w	($0000.w,a6)
	beq.s	Lfe290c
	cmpi.w	#$0001,($0000.w,a6)
	bne.s	Lfe28c6
	move.l	($0002,a6),d0
	bmi.w	Lfe022e
Lfe28fe:
	btst.l	#$00,d0
	bne.w	Lfe022e
	move.l	d0,($0120,a6)
	bra.s	Lfe2912

Lfe290c:
	moveq.l	#$ff,d0
	move.l	d0,($0120,a6)
Lfe2912:
	move.l	a7,($0136,a6)
	move.w	sr,($0042,a6)
	move.l	a5,($003e,a6)
	movea.l	($0136,a6),a7
	bsr.w	Lfe2a98
	tst.b	($0052,a6)
	bne.s	Lfe2954
	tst.b	($00a6,a6)
	beq.s	Lfe2954
	moveq.l	#$09,d1
	move.l	($0096,a6),d0
	lea.l	($00a8,a6),a0
Lfe293c:
	tst.w	($000a,a0)
	ble.s	Lfe2946
	cmp.l	(a0),d0
	beq.s	Lfe2950
Lfe2946:
	lea.l	($000c,a0),a0
	dbra.w	d1,Lfe293c
	bra.s	Lfe2954

Lfe2950:
	subq.w	#1,($0006,a0)
Lfe2954:
	move.b	($00a6,a6),($004e,a6)
	bsr.w	Lfe2c14
	move.l	a7,($0136,a6)
	movea.l	($0092,a6),a7
	move.l	($00000024).l,($0142,a6)
	movea.l	($009a,a6),a5
	move.l	a5,usp
	movem.l	($0056,a6),d0-d7/a0-a5
	move.l	($0096,a6),-(a7)
	move.w	($00a0,a6),-(a7)
	bclr.b	#$07,(a7)
	movem.l	($008e,a6),a6
	move.w	#$ffff,($00001754).l
	rte

Lfe2996:
	clr.w	($0170,a6)
	bra.s	Lfe29a2

Lfe299c:
	move.w	#$0001,($0170,a6)
Lfe29a2:
	cmpi.b	#$3d,(a5)		;'='
	bne.s	Lfe29d2
	addq.l	#1,a5
	move.l	($0096,a6),($0002,a6)
	bsr.w	Lfe029e
	tst.w	($0000.w,a6)
	beq.s	Lfe29dc
	move.l	($0002,a6),($0096,a6)
	cmpi.w	#$0001,($0000.w,a6)
	beq.s	Lfe29dc
	move.l	($0006,a6),d0
	move.l	d0,($004a,a6)
	bra.s	Lfe2a08

Lfe29d2:
	bsr.w	Lfe029e
	move.w	($0000.w,a6),d0
	bne.s	Lfe29f6
Lfe29dc:
	bsr.w	Lfe4cc2
	tst.b	d0
	beq.s	Lfe29ec
	cmpi.b	#$3a,d0			;':'
	bne.w	Lfe022e
Lfe29ec:
	move.l	#$00000001,($004a,a6)
	bra.s	Lfe2a08

Lfe29f6:
	move.l	($0002,a6),d1
	cmp.w	#$0001,d0
	beq.s	Lfe2a04
	move.l	($0006,a6),d1
Lfe2a04:
	move.l	d1,($004a,a6)
Lfe2a08:
	move.l	a7,($0136,a6)
	move.w	sr,($0042,a6)
	move.l	($00000024).l,($0142,a6)
	move.w	(Lfe0058),d0
	andi.l	#$0000000f,d0
	asl.l	#2,d0
	movea.l	d0,a1
	move.l	($0080,a1),($0046,a6)
Lfe2a2e:
	move.w	#$fffe,($00001754).l
	bsr.w	Lfe2ae0
	tst.b	($0052,a6)
	bne.s	Lfe2a46
	move.w	($0016,a6),ccr
	bcc.s	Lfe2a58
Lfe2a46:
	subq.l	#1,($004a,a6)
	beq.s	Lfe2a6c
	tst.w	($0170,a6)
	bne.s	Lfe2a2e
	bsr.w	Lfe2fe8
	bra.s	Lfe2a2e

Lfe2a58:
	lea.l	(Lfe2ec8,pc),a0
	bsr.w	Lfe4bc8
	move.l	($0096,a6),d1
	bsr.w	Lfe4c22
	bsr.w	Lfe4bb8
Lfe2a6c:
	move.l	($0142,a6),($00000024).l
	move.w	(Lfe0058),d0
	andi.l	#$0000000f,d0
	asl.l	#2,d0
	movea.l	d0,a1
	move.l	($0046,a6),($0080,a1)
	move.l	($0096,a6),($0032,a6)
	bsr.w	Lfe2fe8
	bra.w	Lfe0146

Lfe2a98:
	move.l	($00000024).l,($0142,a6)
	move.w	(Lfe0058),d0
	andi.l	#$0000000f,d0
	asl.l	#2,d0
	movea.l	d0,a1
	move.l	($0080,a1),($0046,a6)
	move.w	#$ffff,($00001754).l
	bsr.s	Lfe2ae0
Lfe2ac0:
	move.l	($0142,a6),($00000024).l
	move.w	(Lfe0058),d0
	andi.l	#$0000000f,d0
	asl.l	#2,d0
	movea.l	d0,a1
	move.l	($0046,a6),($0080,a1)
	rts

Lfe2ae0:
	bsr.w	Lfe2bf6
	move.w	(Lfe0058),d0
	movea.l	($0096,a6),a0
	cmp.w	(a0),d0
	bne.s	Lfe2af8
	bsr.s	Lfe2ac0
	bra.w	Lfe2d76

Lfe2af8:
	and.w	#$fff0,d0
	cmp.w	(a0),d0
	bne.s	Lfe2b0c
	bsr.s	Lfe2b0c
	movea.l	($0092,a6),a0
	bclr.b	#$07,(a0)
	rts

Lfe2b0c:
	move.l	a7,($0136,a6)
	move.w	sr,($0042,a6)
	move.l	#Lfe2b48,($00000024).l
	movea.l	($009a,a6),a5
	move.l	a5,usp
	movem.l	($0056,a6),d0-d7/a0-a5
	movea.l	($0092,a6),a7
	move.l	($0096,a6),($0146,a6)
	move.l	($0096,a6),-(a7)
	move.w	($00a0,a6),-(a7)
	bset.b	#$07,(a7)
	movem.l	($008e,a6),a6
	rte

Lfe2b48:
	tst.w	($00001756).l
	bne.w	Lfe2e3a
	clr.w	($00001754).l
	move.l	a6,-(a7)
	movea.l	#$00001000,a6
	movem.l	d0-d7/a0-a5,($0056,a6)
	move.l	(a7)+,($008e,a6)
	move.w	(a7)+,($00a0,a6)
	move.l	(a7)+,($0096,a6)
	move.l	a7,($0092,a6)
	move.l	usp,a5
	move.l	a5,($009a,a6)
	move.w	($0042,a6),sr
	movea.l	($0136,a6),a7
	move.l	($0096,a6),d0
	bsr.w	Lfe2ce2
	seq.b	($0052,a6)
	move.w	sr,($0016,a6)
	beq.s	Lfe2bd6
	tst.w	($0004,a0)
	beq.s	Lfe2bd6
	movea.l	a0,a4
	addq.l	#2,a4
	move.l	d0,d1
	lea.l	(Lfe2bd8,pc),a0
	bsr.w	Lfe4bc8
	bsr.w	Lfe4c22
	bsr.w	Lfe4bc0
	move.b	#$28,d0			;'('
	bsr.w	Lfe4b72
	move.w	(a4)+,d1
	bsr.w	Lfe4c28
	move.b	#$3b,d0			;';'
	bsr.w	Lfe4b72
	move.w	(a4)+,d1
	bsr.w	Lfe4c28
	move.b	#$29,d0			;')'
	bsr.w	Lfe4b72
Lfe2bd6:
	rts

Lfe2bd8:
	.dc.b	$0d,$0a
	.dc.b	'encounter break pointer at ',$00
Lfe2bf6:
	movem.l	d0/a0-a1,-(a7)
	moveq.l	#$06,d0
	lea.l	($014e,a6),a0
	movea.l	a0,a1
	addq.l	#4,a1
Lfe2c04:
	move.l	(a1)+,(a0)+
	dbra.w	d0,Lfe2c04
	move.l	($0096,a6),(a0)
	movem.l	(a7)+,d0/a0-a1
	rts

Lfe2c14:
	move.w	(Lfe0058),d0
	andi.l	#$0000000f,d0
	asl.l	#2,d0
	movea.l	d0,a1
	move.l	($0080,a1),($0046,a6)
	move.l	#Lfe2d3e,($0080,a1)
	move.l	($0120,a6),d0
	bmi.s	Lfe2c50
	cmp.l	#$00fc0000,d0
	bcc.s	Lfe2c50
	movea.l	d0,a0
	move.w	(a0),($0124,a6)
	clr.l	($0126,a6)
	move.w	(Lfe0058),(a0)
Lfe2c50:
	tst.b	($00a6,a6)
	bne.s	Lfe2c58
	rts

Lfe2c58:
	moveq.l	#$09,d1
	lea.l	($00a8,a6),a0
Lfe2c5e:
	tst.w	($000a,a0)
	ble.s	Lfe2c7e
	movea.l	(a0),a1
	cmpa.l	#$00fc0000,a1
	bcc.s	Lfe2c7e
	move.w	(a1),($0004,a0)
	tst.w	($0008,a0)
	beq.s	Lfe2c7e
	move.w	(Lfe0058),(a1)
Lfe2c7e:
	lea.l	($000c,a0),a0
	dbra.w	d1,Lfe2c5e
	rts

Lfe2c88:
	move.w	(Lfe0058),d0
	andi.l	#$0000000f,d0
	asl.l	#2,d0
	movea.l	d0,a1
	move.l	($0046,a6),($0080,a1)
	tst.b	($00a6,a6)
	beq.s	Lfe2cc6
	moveq.l	#$09,d1
	lea.l	($00a8,a6),a1
Lfe2caa:
	tst.w	($000a,a1)
	ble.s	Lfe2cbe
	movea.l	(a1),a0
	cmpa.l	#$00fc0000,a0
	bcc.s	Lfe2cbe
	move.w	($0004,a1),(a0)
Lfe2cbe:
	lea.l	($000c,a1),a1
	dbra.w	d1,Lfe2caa
Lfe2cc6:
	move.l	($0120,a6),d0
	bmi.s	Lfe2ce0
	cmp.l	#$00fc0000,d0
	bcc.s	Lfe2ce0
	movea.l	d0,a0
	move.w	($0124,a6),(a0)
	moveq.l	#$ff,d0
	move.l	d0,($0120,a6)
Lfe2ce0:
	rts

Lfe2ce2:
	tst.b	($00a6,a6)
	beq.s	Lfe2d16
	moveq.l	#$09,d1
	lea.l	($00a8,a6),a0
Lfe2cee:
	tst.w	($000a,a0)
	ble.s	Lfe2cf8
	cmp.l	(a0),d0
	beq.s	Lfe2d02
Lfe2cf8:
	lea.l	($000c,a0),a0
	dbra.w	d1,Lfe2cee
	bra.s	Lfe2d16

Lfe2d02:
	addq.w	#1,($0006,a0)
	move.w	($0006,a0),d1
	cmp.w	($0008,a0),d1
	addq.l	#4,a0
	andi.b	#$7b,ccr
	rts

Lfe2d16:
	lea.l	($0120,a6),a0
	cmp.l	(a0)+,d0
	eori.b	#$04,ccr
	rts

Lfe2d22:
	tst.b	($00a6,a6)
	bne.s	Lfe2d2a
	rts

Lfe2d2a:
	lea.l	($00a8,a6),a0
	moveq.l	#$09,d1
Lfe2d30:
	clr.w	($0006,a0)
	lea.l	($000c,a0),a0
	dbra.w	d1,Lfe2d30
	rts

Lfe2d3e:
	clr.w	($00001754).l
	subq.l	#2,($0002,a7)
	move.l	a6,-(a7)
	movea.l	#$00001000,a6
	move.l	(a7)+,($008e,a6)
	movem.l	d0-d7/a0-a5,($0056,a6)
	move.w	(a7)+,($00a0,a6)
	move.l	(a7)+,d1
	move.l	d1,($0096,a6)
	move.l	a7,($0092,a6)
	move.l	usp,a5
	move.l	a5,($009a,a6)
	move.l	d1,d0
	bsr.w	Lfe2ce2
	bne.s	Lfe2db0
Lfe2d76:
	move.w	($0042,a6),sr
	movea.l	($0136,a6),a7
	lea.l	(Lfe2ee6,pc),a0
	bsr.w	Lfe4bc8
	bsr.w	Lfe2c88
	move.l	($0096,a6),d1
	move.l	d1,($0032,a6)
	bsr.w	Lfe4c22
	bsr.w	Lfe4bb8
	addq.l	#2,($0096,a6)
	move.l	($0096,a6),($0032,a6)
	bsr.w	Lfe2fe8
	movea.l	($003e,a6),a5
	bra.w	Lfe0146

Lfe2db0:
	bcc.w	Lfe2e9a
	bsr.w	Lfe2bf6
	movea.l	d0,a1
	move.w	(a0),(a1)
	move.l	($00000024).l,($0142,a6)
	move.l	#Lfe2dea,($00000024).l
	move.l	($0096,a6),-(a7)
	move.w	($00a0,a6),-(a7)
	movem.l	($0056,a6),d0-d7/a0-a6
	bset.b	#$07,(a7)
	move.w	#$ffff,($00001754).l
	rte

Lfe2dea:
	clr.w	($00001754).l
	movem.l	a0/a6,-(a7)
	movea.l	#$00001000,a6
	move.l	($0142,a6),($00000024).l
	movea.l	($0096,a6),a0
	move.w	(Lfe0058),(a0)
	movem.l	(a7)+,a0/a6
	bclr.b	#$07,(a7)
	move.w	#$ffff,($00001754).l
	rte

Lfe2e1e:
	move.b	#$0c,($00e8e007)
	cmpi.w	#$fffe,($00001754).l
	bne.s	Lfe2e3a
	move.w	#$ffff,($00001756).l
	rte

Lfe2e3a:
	clr.w	($00001756).l
	clr.w	($00001754).l
	move.l	a6,-(a7)
	movea.l	#$00001000,a6
	move.l	(a7)+,($008e,a6)
	movem.l	d0-d7/a0-a5,($0056,a6)
	move.w	(a7)+,($00a0,a6)
	move.l	(a7)+,($0096,a6)
	move.l	a7,($0092,a6)
	move.l	usp,a5
	move.l	a5,($009a,a6)
	move.l	($0142,a6),($00000024).l
	andi.w	#$f8ff,sr
	lea.l	(Lfe2ed5,pc),a0
	bsr.w	Lfe4bc8
	bsr.w	Lfe2c88
	move.l	($0096,a6),d1
	move.l	d1,($0032,a6)
	bsr.w	Lfe4c22
	bsr.w	Lfe4bb8
	bsr.w	Lfe2fe8
	bra.w	Lfe0146

Lfe2e9a:
	move.w	($0042,a6),sr
	movea.l	($0136,a6),a7
	lea.l	(Lfe2ec8,pc),a0
	bsr.w	Lfe4bc8
	bsr.w	Lfe2c88
	move.l	($0096,a6),d1
	move.l	d1,($0032,a6)
	bsr.w	Lfe4c22
	bsr.w	Lfe4bb8
	bsr.w	Lfe2fe8
	movea.l	($003e,a6),a5
	rts

Lfe2ec8:
	.dc.b	$0d,$0a
	.dc.b	$09,'break at ',$00
Lfe2ed5:
	.dc.b	$0d,$0a
	.dc.b	$09,'NMI break at ',$00
Lfe2ee6:
	.dc.b	$0d,$0a
	.dc.b	$09,'encounter trap at ',$00
Lfe2efc:
	bsr.w	Lfe029e
	cmpi.w	#$0004,($0000.w,a6)
	bne.w	Lfe0248
	movea.l	($0002,a6),a1
	move.l	($0006,a6),d1
	move.l	($000a,a6),d2
	move.l	($000e,a6),d3
	IOCS	_B_READ
	tst.l	d0
	bne.s	Lfe2f4c
	rts

Lfe2f24:
	bsr.w	Lfe029e
	cmpi.w	#$0004,($0000.w,a6)
	bne.w	Lfe0248
	movea.l	($0002,a6),a1
	move.l	($0006,a6),d1
	move.l	($000a,a6),d2
	move.l	($000e,a6),d3
	IOCS	_B_WRITE
	tst.l	d0
	bne.s	Lfe2f4c
	rts

Lfe2f4c:
	move.l	d0,d1
	bsr.w	Lfe4c22
	rts

Lfe2f54:
	bsr.w	Lfe4cc2
	bsr.w	Lfe4de2
	movea.l	#Lfe2f94,a0
Lfe2f62:
	tst.b	(a0)+
	bmi.s	Lfe2f72
	cmp.b	(a0)+,d0
	beq.s	Lfe2f6e
	addq.l	#4,a0
	bra.s	Lfe2f62

Lfe2f6e:
	movea.l	(a0),a1
	jmp	(a1)

Lfe2f72:
	clr.w	d1
	lea.l	(Lfe2fba,pc),a0
Lfe2f78:
	tst.b	(a0)
	bmi.w	Lfe0248
	bsr.w	Lfe4dcc
	beq.s	Lfe2f8c
	addq.w	#1,d1
Lfe2f86:
	tst.b	(a0)+
	bne.s	Lfe2f86
	bra.s	Lfe2f78

Lfe2f8c:
	lsl.w	#2,d1
	movea.l	(Lfe2fd0,pc,d1.w),a1
	jmp	(a1)

Lfe2f94:
	.dc.b	$00,$00,$00,$fe,$2f,$e8,$00,$3a
	.dc.b	$00,$fe,$2f,$e8,$00,$44,$00,$fe
	.dc.b	$31,$b6,$00,$41,$00,$fe,$31,$b2
	.dc.b	$00,$49,$00,$fe,$33,$00,$00,$4d
	.dc.b	$00,$fe,$31,$74,$ff,$ff
Lfe2fba:
	.dc.b	$53,$50,$00,$53,$53,$50,$00,$55
	.dc.b	$53,$50,$00,$50,$43,$00,$43,$43
	.dc.b	$52,$00,$53,$52,$00,$ff
Lfe2fd0:
	.dc.l	$00fe3276,$00fe3270
	.dc.l	$00fe326a,$00fe325e
	.dc.l	$00fe32be,$00fe3264
Lfe2fe8:
	moveq.l	#$10,d3
	lea.l	(Lfe3110,pc),a0
	bsr.w	Lfe4bc8
	bsr.w	Lfe314e
	lea.l	(Lfe3114,pc),a0
	bsr.w	Lfe4bc8
	bsr.w	Lfe314e
	lea.l	(Lfe311a,pc),a0
	bsr.w	Lfe4bc8
	move.l	($0092,a6),d1
	bsr.w	Lfe4c22
	tst.w	($01e2,a6)
	beq.s	Lfe301e
	bsr.w	Lfe4bb8
	bra.s	Lfe3022

Lfe301e:
	bsr.w	Lfe4bc4
Lfe3022:
	lea.l	(Lfe3120,pc),a0
	bsr.w	Lfe4bc8
	bsr.w	Lfe3162
	bsr.w	Lfe4bb8
	moveq.l	#$00,d3
	lea.l	(Lfe310a,pc),a0
	bsr.w	Lfe3124
	bsr.w	Lfe314a
	bsr.w	Lfe4bb8
	lea.l	(Lfe310c+$000001,pc),a0
	bsr.w	Lfe3124
	btst.b	#$05,($00a0,a6)
	bne.s	Lfe3056
	moveq.l	#$11,d3
Lfe3056:
	bsr.w	Lfe314a
	bsr.w	Lfe4bb8
	bsr.s	Lfe3062
	rts

Lfe3062:
	move.l	a5,-(a7)
	movea.l	($0096,a6),a5
	move.l	a5,d0
	bsr.w	Lfe3f1a
	tst.l	d0
	bmi.s	Lfe3084
	movea.l	d0,a0
	bsr.w	Lfe4bc8
	move.b	#$3a,d0			;':'
	bsr.w	Lfe4b72
	bsr.w	Lfe4bb8
Lfe3084:
	bsr.w	Lfe0740
	bsr.s	Lfe3092
	bsr.w	Lfe4bb8
	movea.l	(a7)+,a5
	rts

Lfe3092:
	tst.w	($01fc,a6)
	bne.s	Lfe30c8
	tst.w	($01fe,a6)
	beq.s	Lfe30c8
	bsr.w	Lfe4bc0
	bsr.w	Lfe4bc0
	moveq.l	#$3b,d0			;';'
	bsr.w	Lfe4b72
	movea.l	($0200,a6),a0
	move.l	a0,d1
	bsr.w	Lfe4c22
	move.w	#$0028,d0		;'('
	bsr.w	Lfe4b72
	bsr.s	Lfe30ca
	move.w	#$0029,d0		;')'
	bsr.w	Lfe4b72
Lfe30c8:
	rts

Lfe30ca:
	move.l	a0,d0
	cmp.l	#L000000,d0
	bcc.s	Lfe30fc
	cmpi.w	#$0001,($01fe,a6)
	beq.s	Lfe30f6
	btst.l	#$00,d0
	bne.s	Lfe30fc
	cmpi.w	#$0002,($01fe,a6)
	beq.s	Lfe30f0
	move.l	(a0),d1
	bra.w	Lfe4c22

Lfe30f0:
	move.w	(a0),d1
	bra.w	Lfe4c28

Lfe30f6:
	move.b	(a0),d1
	bra.w	Lfe4c3c

Lfe30fc:
	moveq.l	#$3f,d0			;'?'
	bsr.w	Lfe4b72
	moveq.l	#$3f,d0			;'?'
	bsr.w	Lfe4b72
	rts

Lfe310a:
	neg.b	-(a0)
Lfe310c:
	ori.w	#$2000,d1
Lfe3110:
	addq.w	#8,d3
	move.w	d0,-(a6)
Lfe3114:
	movea.l	(a5),a0
	subq.w	#1,(a0)
	move.w	d0,-(a6)
Lfe311a:
	movea.l	(a3),a0
	subq.w	#1,(a0)
	move.w	d0,-(a6)
Lfe3120:
	subq.w	#1,(a2)
	move.w	d0,-(a6)
Lfe3124:
	bsr.w	Lfe4bc8
	bsr.s	Lfe314a
	bsr.s	Lfe314a
	bsr.s	Lfe314a
	bsr.s	Lfe314a
	tst.w	($01e2,a6)
	beq.s	Lfe313e
	bsr.w	Lfe4bb8
	bsr.w	Lfe4bc4
Lfe313e:
	bsr.w	Lfe4bc4
	bsr.s	Lfe314a
	bsr.s	Lfe314a
	bsr.s	Lfe314a
	rts

Lfe314a:
	bsr.w	Lfe4bc4
Lfe314e:
	move.b	d3,d0
	lsl.w	#2,d0
	lea.l	($0056,a6),a0
	move.l	(a0,d0.w),d1
	bsr.w	Lfe4c22
	addq.b	#1,d3
	rts

Lfe3162:
	move.l	($009e,a6),d1
	bsr.w	Lfe4c28
	bsr.w	Lfe4bc4
	bsr.w	Lfe3286
	rts

Lfe3174:
	addq.l	#1,a5
	lea.l	(Lfe3192,pc),a0
	bsr.w	Lfe4bc8
	lea.l	(Lfe31a7,pc),a0
	eori.w	#$ffff,($01fc,a6)
	beq.s	Lfe318e
	lea.l	(Lfe31ac,pc),a0
Lfe318e:
	bra.w	Lfe4bc8

Lfe3192:
	.dc.b	'Memory display mode ',$00
Lfe31a7:
	.dc.b	'ON',$0d,$0a,$00
Lfe31ac:
	.dc.b	'OFF',$0d,$0a,$00
Lfe31b2:
	moveq.l	#$08,d2
	bra.s	Lfe31b8

Lfe31b6:
	clr.l	d2
Lfe31b8:
	addq.l	#1,a5
	move.b	(a5),d0
	cmpi.b	#$30,d0			;'0'
	bcs.w	Lfe022e
	cmpi.b	#$38,d0			;'8'
	bcc.w	Lfe022e
	andi.w	#$0007,d0
	move.w	d0,d3
	add.w	d2,d3
	addq.l	#1,a5
	cmp.w	#$000f,d3
	beq.w	Lfe3276
Lfe31de:
	bsr.s	Lfe322a
	bcc.s	Lfe3210
	bsr.w	Lfe3394
	bsr.w	Lfe4bc0
	bsr.w	Lfe4aca
	tst.b	(a0)
	beq.s	Lfe3228
	movem.l	d3/a5,-(a7)
	movea.l	a0,a5
	bsr.w	Lfe4238
	move.l	(a7)+,d3
	bcc.s	Lfe320e
	bsr.w	Lfe4cc2
	movea.l	(a7)+,a5
	tst.b	d0
	beq.s	Lfe3228
	bra.w	Lfe0432

Lfe320e:
	movea.l	(a7)+,a5
Lfe3210:
	move.w	d3,d0
	lsl.w	#2,d0
	lea.l	($0056,a6),a0
	cmpi.b	#$12,d3
	bne.s	Lfe3224
	swap.w	d6
	clr.w	d6
	swap.w	d6
Lfe3224:
	move.l	d6,(a0,d0.w)
Lfe3228:
	rts

Lfe322a:
	bsr.w	Lfe4cc2
	tst.b	d0
	beq.s	Lfe3258
	cmp.b	#$3a,d0			;':'
	beq.s	Lfe3258
	cmp.b	#$2c,d0			;','
	bne.s	Lfe324a
	addq.l	#1,a5
	bsr.w	Lfe4cc2
	tst.b	d0
	beq.w	Lfe0248
Lfe324a:
	move.l	d3,-(a7)
	bsr.w	Lfe4238
	move.l	(a7)+,d3
	bcs.w	Lfe0248
	rts

Lfe3258:
	ori.b	#$01,ccr
	rts

Lfe325e:
	moveq.l	#$10,d3
	bra.w	Lfe31de

Lfe3264:
	moveq.l	#$12,d3
	bra.w	Lfe31de

Lfe326a:
	moveq.l	#$11,d3
	bra.w	Lfe31de

Lfe3270:
	moveq.l	#$0f,d3
	bra.w	Lfe31de

Lfe3276:
	moveq.l	#$0f,d3
	btst.b	#$05,($00a0,a6)
	bne.s	Lfe3282
	moveq.l	#$11,d3
Lfe3282:
	bra.w	Lfe31de

Lfe3286:
	moveq.l	#$05,d1
	movea.l	#Lfe32f8,a1
	move.w	($00a0,a6),d2
	lsl.b	#3,d2
	bra.s	Lfe329e

Lfe3296:
	bsr.w	Lfe4bc4
	bsr.w	Lfe4bc4
Lfe329e:
	move.b	(a1)+,d0
	bsr.w	Lfe4b72
	move.b	#$3a,d0			;':'
	bsr.w	Lfe4b72
	lsl.b	#1,d2
	move.b	#$18,d0
	roxl.b	#1,d0
	bsr.w	Lfe4b72
	subq.b	#1,d1
	bne.s	Lfe3296
	rts

Lfe32be:
	addq.l	#1,a5
	bsr.w	Lfe4bc4
	bsr.w	Lfe4bc4
	bsr.s	Lfe3286
	bsr.w	Lfe4bb8
	movea.l	#Lfe32f8,a0
	bsr.w	Lfe4bc8
	bsr.w	Lfe4aca
	move.b	(a0),d0
	bne.s	Lfe32e2
	rts

Lfe32e2:
	moveq.l	#$04,d3
	clr.w	d2
Lfe32e6:
	move.b	(a0)+,d0
	beq.s	Lfe32f2
	lsr.b	#1,d0
	roxl.b	#1,d2
	dbra.w	d3,Lfe32e6
Lfe32f2:
	move.b	d2,($00a1,a6)
	rts

Lfe32f8:
	addq.w	#4,a6
	addq.w	#5,(a6)
Lfe32fc:
	chk.l	(Lfe32fc+$000002,pc),d1
	addq.l	#1,a5
	bsr.w	Lfe322a
	bcc.s	Lfe334c
	lea.l	(Lfe3366,pc),a0
	bsr.w	Lfe4bc8
	move.b	($00a0,a6),d0
	andi.b	#$07,d0
	ori.b	#$30,d0
	bsr.w	Lfe4b72
	lea.l	(Lfe337f,pc),a0
	bsr.w	Lfe4bc8
	bsr.w	Lfe4aca
	move.b	(a0),d0
	bne.s	Lfe3332
	rts

Lfe3332:
	move.l	a5,-(a7)
	movea.l	a0,a5
	bsr.w	Lfe4238
	bcc.s	Lfe334a
	bsr.w	Lfe4cc2
	movea.l	(a7)+,a5
	tst.b	d0
	bne.w	Lfe0432
	rts

Lfe334a:
	movea.l	(a7)+,a5
Lfe334c:
	cmpi.l	#$00000008,d6
	bcc.w	Lfe0248
	move.b	($00a0,a6),d0
	andi.b	#$f8,d0
	or.b	d0,d6
	move.b	d6,($00a0,a6)
	rts

Lfe3366:
	.dc.b	'interrupt mask level is ',$00
Lfe337f:
	.dc.b	'   ,new level is ? ',$00,$00
Lfe3394:
	cmpi.b	#$13,d3
	bcc.s	Lfe3404
	cmp.b	#$0f,d3
	beq.s	Lfe33de
	bhi.s	Lfe33e4
	move.b	#$44,d0			;'D'
	cmpi.b	#$08,d3
	bcs.s	Lfe33b0
	move.b	#$41,d0			;'A'
Lfe33b0:
	bsr.w	Lfe4b72
	move.b	d3,d0
	bclr.l	#$03,d0
	ori.b	#$30,d0
	bsr.w	Lfe4b72
Lfe33c2:
	move.b	#$3a,d0			;':'
	bsr.w	Lfe4b72
	clr.w	d0
	move.b	d3,d0
	lsl.w	#2,d0
	lea.l	($0056,a6),a0
	move.l	(a0,d0.w),d1
	bsr.w	Lfe4c22
	rts

Lfe33de:
	lea.l	(Lfe3414,pc),a0
	bra.s	Lfe33fe

Lfe33e4:
	move.b	d3,d0
	lea.l	(Lfe340a,pc),a0
	andi.w	#$0003,d0
	beq.s	Lfe33fe
	lea.l	(Lfe340c+$000001,pc),a0
	cmpi.b	#$02,d0
	bne.s	Lfe33fe
	lea.l	(Lfe3410+$000001,pc),a0
Lfe33fe:
	bsr.w	Lfe4bc8
	bra.s	Lfe33c2

Lfe3404:
	bsr.w	Lfe3286
	rts

Lfe340a:
	addq.w	#8,d3
Lfe340c:
	ori.w	#$5350,(a5)
Lfe3410:
	ori.w	#$5200,(a3)
Lfe3414:
	subq.w	#1,(a3)
	addq.b	#8,d0
	move.w	#$0001,($016e,a6)
	move.b	(a5),d0
	bsr.w	Lfe4de2
	cmpi.b	#$53,d0			;'S'
	bne.s	Lfe3430
	clr.w	($016e,a6)
	bra.s	Lfe3442

Lfe3430:
	cmpi.b	#$57,d0			;'W'
	beq.s	Lfe3442
	cmpi.b	#$4c,d0			;'L'
	bne.s	Lfe3444
	move.w	#$0002,($016e,a6)
Lfe3442:
	addq.l	#1,a5
Lfe3444:
	move.l	($0096,a6),($0002,a6)
	bsr.s	Lfe3480
	bsr.w	Lfe34fe
	move.w	d3,d6
	subq.w	#1,d6
	move.l	($0002,a6),d3
	move.l	($0006,a6),d4
	sub.l	d7,d4
	lea.l	($029e,a6),a0
	move.l	a0,d5
	cmp.l	d3,d4
	bcs.w	Lfe0248
	clr.w	($001e,a6)
	move.w	($016e,a6),d0
	beq.w	Lfe35ee
	subq.w	#1,d0
	beq.w	Lfe360a
	bra.w	Lfe3626

Lfe3480:
	bsr.w	Lfe4cc2
	cmp.b	#$2c,d0			;','
	bne.s	Lfe3490
	move.l	($0002,a6),d6
	bra.s	Lfe3498

Lfe3490:
	bsr.w	Lfe4238
	bcs.w	Lfe0248
Lfe3498:
	move.l	d6,($0002,a6)
	move.b	(a5)+,d0
	cmp.b	#$2c,d0			;','
	beq.s	Lfe34ac
	cmp.b	#$20,d0			;' '
	bne.w	Lfe0248
Lfe34ac:
	bsr.w	Lfe4cc2
	bsr.w	Lfe4de2
	cmp.b	#$4c,d0			;'L'
	bne.s	Lfe34cc
	addq.l	#1,a5
	bsr.w	Lfe4238
	bcs.w	Lfe0248
	subq.l	#1,d6
	add.l	($0002,a6),d6
	bra.s	Lfe34d4

Lfe34cc:
	bsr.w	Lfe4238
	bcs.w	Lfe0248
Lfe34d4:
	move.l	d6,($0006,a6)
	cmpi.b	#$20,(a5)		;' '
	beq.s	Lfe34e6
	cmpi.b	#$2c,(a5)		;','
	bne.w	Lfe0248
Lfe34e6:
	bsr.w	Lfe4cc2
	move.l	($0002,a6),d0
	cmp.l	($0006,a6),d0
	bcc.w	Lfe0248
	move.w	#$0002,($0000.w,a6)
	rts

Lfe34fe:
	bsr.w	Lfe4cc2
	cmp.b	#$2c,d0			;','
	bne.s	Lfe350e
	addq.l	#1,a5
	bsr.w	Lfe4cc2
Lfe350e:
	lea.l	($029e,a6),a1
	clr.l	d7
	clr.l	d3
	tst.b	d0
	beq.w	Lfe0248
	cmp.b	#$27,d0			;'''
	beq.w	Lfe35a6
	cmp.b	#$22,d0			;'"'
	beq.s	Lfe35a6
	move.w	($016e,a6),d0
	beq.s	Lfe3538
	subq.w	#2,d0
	bhi.s	Lfe3538
	beq.s	Lfe3588
	bra.s	Lfe3560

Lfe3538:
	bsr.w	Lfe4238
	bcs.w	Lfe0248
	cmp.l	#$00000100,d6
	bcc.w	Lfe3672
	move.b	d6,(a1)+
	addq.w	#1,d7
	addq.w	#1,d3
	cmp.w	#$0080,d7
	bhi.s	Lfe35d2
	bsr.w	Lfe4cc2
	tst.b	d0
	bne.s	Lfe3538
	rts

Lfe3560:
	bsr.w	Lfe4238
	bcs.w	Lfe0248
	cmp.l	#$00010000,d6
	bcc.w	Lfe3672
	move.w	d6,(a1)+
	addq.w	#2,d7
	addq.w	#1,d3
	cmp.w	#$0080,d7
	bhi.s	Lfe35d2
	bsr.w	Lfe4cc2
	tst.b	d0
	bne.s	Lfe3560
	rts

Lfe3588:
	bsr.w	Lfe4238
	bcs.w	Lfe0248
	move.l	d6,(a1)+
	addq.w	#4,d7
	addq.w	#1,d3
	cmp.w	#$0080,d7
	bhi.s	Lfe35d2
	bsr.w	Lfe4cc2
	tst.b	d0
	bne.s	Lfe3588
	rts

Lfe35a6:
	cmpi.w	#$0003,($016e,a6)
	beq.s	Lfe35b2
	clr.w	($016e,a6)
Lfe35b2:
	addq.l	#1,a5
	move.b	d0,d2
Lfe35b6:
	move.b	(a5),d0
	beq.s	Lfe35ce
	addq.l	#1,a5
	cmp.b	d0,d2
	beq.s	Lfe35ce
	move.b	d0,(a1)+
	addq.w	#1,d7
	addq.w	#1,d3
	cmp.w	#$0080,d7
	bhi.s	Lfe35d2
	bra.s	Lfe35b6

Lfe35ce:
	clr.b	(a1)
	rts

Lfe35d2:
	lea.l	(Lfe35de,pc),a0
	bsr.w	Lfe4bc8
	bra.w	Lfe0146

Lfe35de:
	.dc.b	'data too long',$0d,$0a,$00
Lfe35ee:
	cmp.l	d4,d3
	bhi.s	Lfe3642
	movea.l	d3,a0
	movea.l	d5,a1
	move.w	d6,d0
Lfe35f8:
	cmpm.b	(a0)+,(a1)+
	dbne.w	d0,Lfe35f8
	tst.w	d0
	bmi.s	Lfe3606
Lfe3602:
	addq.l	#1,d3
	bra.s	Lfe35ee

Lfe3606:
	bsr.s	Lfe364e
	bra.s	Lfe3602

Lfe360a:
	cmp.l	d4,d3
	bhi.s	Lfe3642
	movea.l	d3,a0
	movea.l	d5,a1
	move.w	d6,d0
Lfe3614:
	cmpm.w	(a0)+,(a1)+
	dbne.w	d0,Lfe3614
	tst.w	d0
	bmi.s	Lfe3622
Lfe361e:
	addq.l	#2,d3
	bra.s	Lfe360a

Lfe3622:
	bsr.s	Lfe364e
	bra.s	Lfe361e

Lfe3626:
	cmp.l	d4,d3
	bhi.s	Lfe3642
	movea.l	d3,a0
	movea.l	d5,a1
	move.w	d6,d0
Lfe3630:
	cmpm.l	(a0)+,(a1)+
	dbne.w	d0,Lfe3630
	tst.w	d0
	bmi.s	Lfe363e
Lfe363a:
	addq.l	#4,d3
	bra.s	Lfe3626

Lfe363e:
	bsr.s	Lfe364e
	bra.s	Lfe363a

Lfe3642:
	tst.w	($001e,a6)
	beq.s	Lfe364c
	bsr.w	Lfe4bb8
Lfe364c:
	rts

Lfe364e:
	cmpi.w	#$0008,($001e,a6)
	bcs.s	Lfe365e
	bsr.w	Lfe4bb8
	clr.w	($001e,a6)
Lfe365e:
	addq.w	#1,($001e,a6)
	move.l	d3,d1
	bsr.w	Lfe4c22
	bsr.w	Lfe4bc4
	bsr.w	Lfe4bc4
	rts

Lfe3672:
	lea.l	(Lfe367e,pc),a0
	bsr.w	Lfe4bc8
	bra.w	Lfe0146

Lfe367e:
	.dc.b	'size over',$0d,$0a,$00
Lfe368a:
	move.b	(a5),d0
	bsr.w	Lfe4de2
	cmpi.b	#$49,d0			;'I'
	beq.s	Lfe36ac
	cmpi.b	#$43,d0			;'C'
	bne.s	Lfe3700
	addq.l	#1,a5
	moveq.l	#$07,d7
	lea.l	($014e,a6),a0
Lfe36a4:
	clr.l	(a0)+
	dbra.w	d7,Lfe36a4
	rts

Lfe36ac:
	addq.l	#1,a5
	lea.l	(Lfe36e4,pc),a0
	bsr.w	Lfe4bc8
	lea.l	($014e,a6),a2
	moveq.l	#$07,d7
Lfe36bc:
	move.l	(a2),d1
	bsr.w	Lfe4c22
	move.l	(a2)+,d0
	bsr.w	Lfe3f1a
	tst.l	d0
	bmi.s	Lfe36d6
	movea.l	d0,a0
	bsr.w	Lfe4bc0
	bsr.w	Lfe4bc8
Lfe36d6:
	bsr.w	Lfe4bb8
	dbra.w	d7,Lfe36bc
	bsr.w	Lfe4bb8
	rts

Lfe36e4:
	.dc.b	'Trace history from older.',$0d,$0a,$00
Lfe3700:
	lea.l	(Lfe370a,pc),a0
	bsr.w	Lfe4bc8
	rts

Lfe370a:
	.dc.b	'A                :assemble                R address,drive,s'
	.dc.b	'ector,length',$0d,$0a
	.dc.b	'B                :display breakpoint                       '
	.dc.b	'     :read device',$0d,$0a
	.dc.b	'B[bp][address]   :set breakpoint          S[size]<range> da'
	.dc.b	'ta   :search memory',$0d,$0a
	.dc.b	'BC[<bp>]         :clear breakpoint        T[=address][count'
	.dc.b	']    :trace',$0d,$0a
	.dc.b	'BE[<bp>]         :enable breakpoint       U[=address][count'
	.dc.b	']    :untrace',$0d,$0a
	.dc.b	'BD[<bp>]         :disable breakpoint      W address,drive,s'
	.dc.b	'ector,length',$0d,$0a
	.dc.b	'BR               :reset break count                        '
	.dc.b	'     :write device',$0d,$0a
	.dc.b	'D[size][<range>]        :dump memory      X        :display'
	.dc.b	' register',$0d,$0a
	.dc.b	'E[size][address]        :edit memory      X[reg]   :registe'
	.dc.b	'r change',$0d,$0a
	.dc.b	'F[size] <range> data    :fill memory      Y/N      :yes no '
	.dc.b	'ask',$0d,$0a
	.dc.b	'G[=address][adress]     :go               Z[num=exp]  :syst'
	.dc.b	'em variable',$0d,$0a
	.dc.b	'H                       :display this     ?[exp]   :print e'
	.dc.b	'xpression(hex)',$0d,$0a
	.dc.b	'HI                      :trace history    ??[exp]  :print e'
	.dc.b	'xpression(dec)',$0d,$0a
	.dc.b	'L[<range>]              :list             \        :loop co'
	.dc.b	'mmand line',$0d,$0a
	.dc.b	'M <rang> address        :move memory',$0d,$0a
	.dc.b	$0d,$0a
	.dc.b	'operators  + - * / & (and) | (or) ! (not) % (residue) ^ (ex'
	.dc.b	'or)',$0d,$0a
	.dc.b	'number     ??(hex.) \??(dec.) _??(bin.)',$0d,$0a
	.dc.b	'size       s(byte) w(word) l(long)',$0d,$0a,$00,$00
Lfe3bc2:
	lea.l	(Lfe3e5a),a0
	movea.l	#$00000008,a1
	moveq.l	#$08,d0
Lfe3bd0:
	move.l	(a0)+,(a1)+
	dbra.w	d0,Lfe3bd0
	rts

Lfe3bd8:
	.dc.b	$61,$00,$00,$ac,$62,$75,$73,$20
	.dc.b	$65,$72,$72,$6f,$72,$00,$61,$00
	.dc.b	$00,$9e,$61,$64,$64,$72,$65,$73
	.dc.b	$73,$20,$65,$72,$72,$6f,$72,$00
	.dc.b	$61,$00,$01,$fc,$75,$6e,$64,$65
	.dc.b	$66,$69,$6e,$65,$64,$20,$69,$6e
	.dc.b	$73,$74,$72,$75,$63,$74,$69,$6f
	.dc.b	$6e,$00,$61,$00,$01,$e2,$7a,$65
	.dc.b	$72,$6f,$20,$64,$69,$76,$69,$64
	.dc.b	$65,$00,$61,$00,$01,$d2,$63,$68
	.dc.b	$6b,$20,$69,$6e,$73,$74,$72,$75
	.dc.b	$63,$74,$69,$6f,$6e,$00,$61,$00
	.dc.b	$01,$be,$74,$72,$61,$70,$76,$20
	.dc.b	$69,$6e,$73,$74,$72,$75,$63,$74
	.dc.b	$69,$6f,$6e,$00,$61,$00,$01,$a8
	.dc.b	$70,$72,$69,$76,$69,$6c,$65,$67
	.dc.b	$65,$20,$76,$69,$6f,$6c,$61,$74
	.dc.b	$69,$6f,$6e,$00
Lfe3c64:
	.dc.b	$61,$00,$01,$90,$74,$72,$61,$63
	.dc.b	$65,$00,$61,$00,$01,$86,$6c,$69
	.dc.b	$6e,$65,$20,$31,$30,$31,$30,$20
	.dc.b	$65,$6d,$75,$6c,$61,$74,$6f,$72
	.dc.b	$00,$00,$48,$e7,$ff,$fe,$0c,$af
	.dc.b	$00,$fe,$00,$00,$00,$4a,$65,$2e
	.dc.b	$0c,$af,$00,$fe,$4e,$06,$00,$4a
	.dc.b	$62,$24,$4c,$df,$7f,$ff,$61,$00
	.dc.b	$0f,$14,$61,$00,$0f,$10,$20,$57
	.dc.b	$61,$00,$0f,$1a,$41,$fa,$01,$cc
	.dc.b	$61,$00,$0f,$12,$60,$00,$01,$2e
Lfe3cbc:
	move.l	d0,($0000174c).l
Lfe3cc2:
	movem.l	(a7)+,d0-d7/a0-a6
	move.l	a6,-(a7)
	movea.l	#$00001000,a6
	movem.l	d0-d7/a0-a5,($0056,a6)
	move.l	(a7)+,($008e,a6)
	move.l	usp,a5
	move.l	a5,($009a,a6)
	move.l	a7,d0
	addi.l	#$00000012,d0
	move.l	d0,($0092,a6)
	movea.l	a7,a4
	move.w	($000c,a4),($00a0,a6)
	lea.l	(Lfe3e8d,pc),a0
	bsr.w	Lfe4bc8
	movea.l	(a4)+,a0
	bsr.w	Lfe4bc8
	bsr.w	Lfe4bb8
	lea.l	(Lfe3eaa,pc),a0
	bsr.w	Lfe4bc8
	move.l	($0002,a4),d1
	bsr.w	Lfe4c22
	bsr.w	Lfe4bb8
	lea.l	(Lfe3ea5,pc),a0
	bsr.w	Lfe4bc8
	movea.l	#$00000008,a0
	move.l	#Lfe3d72,d1
	moveq.l	#$08,d0
Lfe3d2e:
	move.l	d1,(a0)+
	dbra.w	d0,Lfe3d2e
	movea.l	($000a,a4),a5
	move.w	($0006,a4),d0
	cmp.w	(a5),d0
	beq.s	Lfe3d64
	cmp.w	-(a5),d0
	beq.s	Lfe3d64
	cmp.w	-(a5),d0
	beq.s	Lfe3d64
	cmp.w	-(a5),d0
	beq.s	Lfe3d64
	cmp.w	-(a5),d0
	beq.s	Lfe3d64
	cmp.w	-(a5),d0
	beq.s	Lfe3d64
	cmp.w	-(a5),d0
	beq.s	Lfe3d64
	cmp.w	-(a5),d0
	beq.s	Lfe3d64
	cmp.w	-(a5),d0
	beq.s	Lfe3d64
	lea.l	($0006,a4),a5
Lfe3d64:
	move.l	a5,($0096,a6)
	move.l	a4,-(a7)
	bsr.w	Lfe0724
	movea.l	(a7)+,a4
	bra.s	Lfe3d7a

Lfe3d72:
	lea.l	(Lfe3ee3,pc),a0
	bsr.w	Lfe4bc8
Lfe3d7a:
	lea.l	(Lfe3ec0,pc),a0
	bsr.w	Lfe4bc8
	move.b	#$49,d0			;'I'
	btst.b	#$03,($0001,a4)
	beq.s	Lfe3d92
	move.b	#$4e,d0			;'N'
Lfe3d92:
	bsr.w	Lfe4b72
	movea.l	#Lfe3ed8,a0
	bsr.w	Lfe4bc8
	move.b	#$52,d0			;'R'
	btst.b	#$04,($0001,a4)
	bne.s	Lfe3db0
	move.b	#$57,d0			;'W'
Lfe3db0:
	bsr.w	Lfe4b72
	movea.l	#Lfe3ede,a0
	bsr.w	Lfe4bc8
	move.b	($0001,a4),d0
	andi.b	#$07,d0
	addi.b	#$30,d0			;'0'
	bsr.w	Lfe4b72
	bsr.w	Lfe4bb8
	move.w	($01fc,a6),-(a7)
	move.w	#$ffff,($01fc,a6)
	bsr.w	Lfe2fe8
	move.w	(a7)+,($01fc,a6)
	bsr.w	Lfe2c88
Lfe3de8:
	bsr.w	Lfe3bc2
	move.l	($0096,a6),($0032,a6)
	bra.w	Lfe0146

Lfe3df6:
	move.l	a6,-(a7)
	movea.l	#$00001000,a6
	movem.l	d0-d7/a0-a5,($0056,a6)
	move.l	(a7)+,($008e,a6)
	move.l	usp,a5
	move.l	a5,($009a,a6)
	movea.l	#Lfe3e8d,a0
	bsr.w	Lfe4bc8
	movea.l	(a7)+,a0
	bsr.w	Lfe4bc8
	movea.l	#Lfe3ea5,a0
	bsr.w	Lfe4bc8
	move.w	(a7),($00a0,a6)
	move.l	($0002,a7),d1
	move.l	d1,($0096,a6)
	bsr.w	Lfe4c22
	bsr.w	Lfe4bb8
	move.l	a7,d0
	addq.l	#6,d0
	move.l	d0,($0092,a6)
	bsr.w	Lfe2fe8
	bsr.w	Lfe2c88
	bsr.w	Lfe3bc2
	move.l	($0096,a6),($0032,a6)
	bra.w	Lfe0146

Lfe3e5a:
	.dc.b	$00,$fe,$3b,$d8,$00,$fe,$3b,$e6
	.dc.b	$00,$fe,$3b,$f8,$00,$fe,$3c,$12
	.dc.b	$00,$fe,$3c,$22,$00,$fe,$3c,$36
	.dc.b	$00,$fe,$3c,$4c,$00,$fe,$3c,$64
	.dc.b	$00,$fe,$3c,$6e
Lfe3e7e:
	.dc.b	' in debugger',$0d,$0a,$00
Lfe3e8d:
	.dc.b	$0d,$0a
	.dc.b	'Exceptional Abort By ',$00
Lfe3ea5:
	.dc.b	' at ',$00
Lfe3eaa:
	.dc.b	' By Memory Access of ',$00
Lfe3ec0:
	.dc.b	$0d,$0a
	.dc.b	'system status =  I/N=',$00
Lfe3ed8:
	.dc.b	' R/W=',$00
Lfe3ede:
	.dc.b	' FC=',$00
Lfe3ee3:
	.dc.b	$0d,$0a
	.dc.b	'double exception in system status display',$0d,$0a,$00,$00
Lfe3f12:
	rts

Lfe3f14:
	rts

Lfe3f16:
	moveq.l	#$ff,d0
	rts

Lfe3f1a:
	moveq.l	#$ff,d0
	rts

Lfe3f1e:
	move.b	(a5),d0
	beq.s	Lfe3f6e
	cmp.b	#$3a,d0			;':'
	beq.s	Lfe3f6e
	addq.l	#1,a5
	cmp.b	#$2d,d0			;'-'
	beq.w	Lfe40f4
	bsr.w	Lfe4de2
	cmp.b	#$43,d0			;'C'
	beq.w	Lfe40f4
	cmp.b	#$45,d0			;'E'
	beq.w	Lfe4102
	cmp.b	#$44,d0			;'D'
	beq.w	Lfe4106
	cmp.b	#$52,d0			;'R'
	beq.s	Lfe3f5a
	subq.l	#1,a5
	bra.w	Lfe4024

Lfe3f5a:
	moveq.l	#$0a,d0
	lea.l	($00a8,a6),a4
Lfe3f60:
	clr.w	($0006,a4)
	lea.l	($000c,a4),a4
	dbra.w	d0,Lfe3f60
	rts

Lfe3f6e:
	tst.b	($00a6,a6)
	bne.s	Lfe3f7e
	lea.l	(Lfe4010,pc),a0
	bsr.w	Lfe4bc8
	rts

Lfe3f7e:
	move.w	#$000a,($001e,a6)
	lea.l	($00a8,a6),a4
Lfe3f88:
	tst.w	($000a,a4)
	bmi.s	Lfe4002
	move.w	#$003a,d0		;':'
	sub.w	($001e,a6),d0
	bsr.w	Lfe4b72
	bsr.w	Lfe4bc4
	move.b	#$64,d0			;'d'
	tst.w	($000a,a4)
	beq.s	Lfe3fac
	move.b	#$65,d0			;'e'
Lfe3fac:
	bsr.w	Lfe4b72
	bsr.w	Lfe4bc4
	move.l	(a4),d1
	bsr.w	Lfe4c22
	move.b	#$28,d0			;'('
	bsr.w	Lfe4b72
	move.w	($0006,a4),d1
	bsr.w	Lfe4c28
	move.b	#$3b,d0			;';'
	bsr.w	Lfe4b72
	move.w	($0008,a4),d1
	bsr.w	Lfe4c28
	move.b	#$29,d0			;')'
	bsr.w	Lfe4b72
	move.l	(a4),d0
	bsr.w	Lfe3f1a
	tst.l	d0
	bmi.s	Lfe3ffe
	movea.l	d0,a0
	bsr.w	Lfe4bc0
	move.b	#$2e,d0			;'.'
	bsr.w	Lfe4b72
	bsr.w	Lfe4bc8
Lfe3ffe:
	bsr.w	Lfe4bb8
Lfe4002:
	lea.l	($000c,a4),a4
	subq.w	#1,($001e,a6)
	bne.w	Lfe3f88
	rts

Lfe4010:
	.dc.b	'no break pointer',$0d,$0a,$00,$00
Lfe4024:
	moveq.l	#$ff,d1
	clr.w	d0
	move.b	(a5),d0
	cmp.w	#$0020,d0		;' '
	beq.s	Lfe4046
	sub.w	#$0030,d0
	cmp.w	#$000a,d0
	bcc.s	Lfe4046
	addq.l	#1,a5
	cmpi.b	#$20,(a5)		;' '
	bne.w	Lfe41be
	move.w	d0,d1
Lfe4046:
	move.w	d1,-(a7)
	move.l	($0096,a6),($0002,a6)
	bsr.w	Lfe029e
	move.w	($0000.w,a6),d0
	beq.w	Lfe0248
	cmp.w	#$0002,d0
	bhi.w	Lfe0248
	beq.s	Lfe406c
	move.l	#$00000001,($0006,a6)
Lfe406c:
	bsr.s	Lfe40a2
	bcs.s	Lfe4076
	move.w	(a7),d1
	bpl.s	Lfe4076
	bsr.s	Lfe40d0
Lfe4076:
	btst.b	#$00,($0005,a6)
	bne.w	Lfe0248
	lea.l	($00a8,a6),a4
	mulu.w	#$000c,d1
	move.l	($0002,a6),(a4,d1.w)
	move.w	($0008,a6),($08,a4,d1.w)
	move.w	#$0001,($0a,a4,d1.w)
	addq.l	#2,a7
	bsr.w	Lfe419a
	rts

Lfe40a2:
	lea.l	($00a8,a6),a4
	move.l	($0002,a6),d0
	moveq.l	#$09,d1
Lfe40ac:
	tst.w	($000a,a4)
	bmi.s	Lfe40b6
	cmp.l	(a4),d0
	beq.s	Lfe40c4
Lfe40b6:
	lea.l	($000c,a4),a4
	dbra.w	d1,Lfe40ac
	andi.b	#$fe,ccr
	rts

Lfe40c4:
	sub.w	#$0009,d1
	neg.w	d1
	ori.b	#$01,ccr
	rts

Lfe40d0:
	cmpi.b	#$0a,($00a6,a6)
	bcc.w	Lfe41b8
	clr.w	d1
	lea.l	($00a8,a6),a4
Lfe40e0:
	tst.w	($000a,a4)
	bmi.s	Lfe40f2
	lea.l	($000c,a4),a4
	addq.w	#1,d1
	cmp.w	#$000a,d1
	bcs.s	Lfe40e0
Lfe40f2:
	rts

Lfe40f4:
	moveq.l	#$ff,d1
	bsr.s	Lfe4108
	bsr.w	Lfe419a
	rts

Lfe40fe:
	moveq.l	#$ff,d1
	bra.s	Lfe4150

Lfe4102:
	moveq.l	#$01,d1
	bra.s	Lfe4108

Lfe4106:
	moveq.l	#$00,d1
Lfe4108:
	clr.w	($0000.w,a6)
Lfe410c:
	bsr.w	Lfe4cc2
	tst.b	d0
	beq.s	Lfe416c
	cmp.b	#$3a,d0			;':'
	beq.s	Lfe416c
	cmp.b	#$2a,d0			;'*'
	beq.s	Lfe414e
	cmp.b	#$2c,d0			;','
	bne.s	Lfe412a
	addq.l	#1,a5
	bra.s	Lfe410c

Lfe412a:
	move.w	d1,-(a7)
	bsr.w	Lfe4238
	bcs.w	Lfe41c4
	move.w	(a7)+,d1
	move.w	($0000.w,a6),d0
	lsl.w	#2,d0
	move.l	d6,($02,a6,d0.w)
	addq.w	#1,($0000.w,a6)
	cmpi.w	#$0008,($0000.w,a6)
	bcs.s	Lfe410c
	bra.s	Lfe416c

Lfe414e:
	addq.l	#1,a5
Lfe4150:
	move.w	#$0009,d0
	lea.l	($00a8,a6),a4
Lfe4158:
	tst.w	($000a,a4)
	bmi.s	Lfe4162
	move.w	d1,($000a,a4)
Lfe4162:
	lea.l	($000c,a4),a4
	dbra.w	d0,Lfe4158
	rts

Lfe416c:
	tst.w	($0000.w,a6)
	beq.s	Lfe41c4
	lea.l	($00a8,a6),a4
	lea.l	($0002,a6),a3
Lfe417a:
	move.l	(a3)+,d0
	cmp.l	#$0000000a,d0
	bcc.s	Lfe41be
	mulu.w	#$000c,d0
	tst.w	($0a,a4,d0.w)
	bmi.s	Lfe4192
	move.w	d1,($0a,a4,d0.w)
Lfe4192:
	subq.w	#1,($0000.w,a6)
	bne.s	Lfe417a
	rts

Lfe419a:
	lea.l	($00a8,a6),a4
	moveq.l	#$09,d0
	clr.b	($00a6,a6)
Lfe41a4:
	tst.w	($000a,a4)
	bmi.s	Lfe41ae
	addq.b	#1,($00a6,a6)
Lfe41ae:
	lea.l	($000c,a4),a4
	dbra.w	d0,Lfe41a4
	rts

Lfe41b8:
	lea.l	(Lfe4210,pc),a0
	bra.s	Lfe41c8

Lfe41be:
	lea.l	(Lfe41d0,pc),a0
	bra.s	Lfe41c8

Lfe41c4:
	lea.l	(Lfe41ee,pc),a0
Lfe41c8:
	bsr.w	Lfe4bc8
	bra.w	Lfe0146

Lfe41d0:
	.dc.b	'Bad breakpoint number (0-9)',$0d,$0a,$00
Lfe41ee:
	.dc.b	'Breakpoint list or ',$27,'*',$27,' expected',$0d,$0a,$00
Lfe4210:
	.dc.b	'break pointer over',$0d,$0a,$00,$00
Lfe4226:
	move.w	#$0001,($0172,a6)
	bsr.s	Lfe423c
	movem.l	d6,-(a7)
	movem.l	(a7)+,d1
	rts

Lfe4238:
	clr.w	($0172,a6)
Lfe423c:
	bsr.s	Lfe4294
	bcs.s	Lfe4292
	cmpi.b	#$5e,d0			;'^'
	beq.s	Lfe4252
	cmpi.b	#$7c,d0			;'|'
	beq.s	Lfe4252
	cmpi.b	#$26,d0			;'&'
	bne.s	Lfe4290
Lfe4252:
	move.w	d0,-(a7)
Lfe4254:
	move.l	d6,-(a7)
	addq.l	#1,a5
	bsr.s	Lfe4294
	bcs.w	Lfe46f2
	move.l	(a7)+,d5
	move.w	(a7)+,d0
	cmpi.b	#$5e,d0			;'^'
	bne.s	Lfe426c
	eor.l	d5,d6
	bra.s	Lfe4278

Lfe426c:
	cmpi.b	#$26,d0			;'&'
	bne.s	Lfe4276
	and.l	d5,d6
	bra.s	Lfe4278

Lfe4276:
	or.l	d5,d6
Lfe4278:
	move.b	(a5),d0
	cmpi.b	#$5e,d0			;'^'
	beq.s	Lfe428c
	cmpi.b	#$26,d0			;'&'
	beq.s	Lfe428c
	cmpi.b	#$7c,d0			;'|'
	bne.s	Lfe4290
Lfe428c:
	move.w	d0,-(a7)
	bra.s	Lfe4254

Lfe4290:
	tst.w	d0
Lfe4292:
	rts

Lfe4294:
	bsr.s	Lfe42ce
	bcs.s	Lfe42a8
Lfe4298:
	move.b	(a5)+,d0
	cmpi.b	#$2b,d0			;'+'
	beq.s	Lfe42aa
	cmpi.b	#$2d,d0			;'-'
	beq.s	Lfe42ba
	move.b	-(a5),d0
Lfe42a8:
	rts

Lfe42aa:
	bsr.w	Lfe4cc2
	move.l	d6,-(a7)
	bsr.s	Lfe42ce
	bcs.w	Lfe46f2
	add.l	(a7)+,d6
	bra.s	Lfe4298

Lfe42ba:
	bsr.w	Lfe4cc2
	move.l	d6,-(a7)
	bsr.s	Lfe42ce
	bcs.w	Lfe46f2
	move.l	(a7)+,d5
	sub.l	d6,d5
	move.l	d5,d6
	bra.s	Lfe4298

Lfe42ce:
	bsr.s	Lfe4332
	bcs.s	Lfe42e8
Lfe42d2:
	move.b	(a5)+,d0
	cmpi.b	#$2a,d0			;'*'
	beq.s	Lfe42ea
	cmpi.b	#$2f,d0			;'/'
	beq.s	Lfe4302
	cmpi.b	#$25,d0			;'%'
	beq.s	Lfe431a
	move.b	-(a5),d0
Lfe42e8:
	rts

Lfe42ea:
	bsr.w	Lfe4cc2
	move.l	d6,-(a7)
	bsr.s	Lfe4332
	bcs.w	Lfe46f2
	move.l	(a7)+,d3
	move.l	d6,d1
	bsr.w	Lfe45fc
	move.l	d3,d6
	bra.s	Lfe42d2

Lfe4302:
	bsr.w	Lfe4cc2
	move.l	d6,-(a7)
	bsr.s	Lfe4332
	bcs.w	Lfe46f2
	move.l	(a7)+,d3
	move.l	d6,d1
	bsr.w	Lfe464a
	move.l	d3,d6
	bra.s	Lfe42d2

Lfe431a:
	bsr.w	Lfe4cc2
	move.l	d6,-(a7)
	bsr.s	Lfe4332
	bcs.w	Lfe46f2
	move.l	(a7)+,d3
	move.l	d6,d1
	bsr.w	Lfe464a
	move.l	d5,d6
	bra.s	Lfe42d2

Lfe4332:
	bsr.w	Lfe4cc2
	beq.s	Lfe436c
	cmpi.b	#$3a,d0			;':'
	beq.s	Lfe436c
	cmpi.b	#$2d,d0			;'-'
	beq.s	Lfe435a
	cmpi.b	#$21,d0			;'!'
	bne.s	Lfe4372
	addq.l	#1,a5
	bsr.w	Lfe4cc2
	bsr.s	Lfe4332
	bcs.w	Lfe46f2
	not.l	d6
	rts

Lfe435a:
	addq.l	#1,a5
	bsr.w	Lfe4cc2
	bsr.s	Lfe4332
	bcs.w	Lfe46f2
	neg.l	d6
	tst.w	d0
	rts

Lfe436c:
	ori.b	#$01,ccr
	rts

Lfe4372:
	cmpi.b	#$28,d0			;'('
	beq.w	Lfe452e
	cmpi.b	#$22,d0			;'"'
	beq.w	Lfe456e
	cmpi.b	#$27,d0			;'''
	beq.w	Lfe456e
	tst.b	d0
	beq.s	Lfe43e2
	cmpi.b	#$5f,d0			;'_'
	beq.w	Lfe45ce
	cmpi.b	#$24,d0			;'$'
	beq.s	Lfe43b6
	tst.w	($0172,a6)
	beq.s	Lfe43c8
	bsr.w	Lfe4d10
	bcc.w	Lfe4590
	cmpi.b	#$2e,d0			;'.'
	beq.s	Lfe43e8
	cmpi.b	#$24,d0			;'$'
	bne.s	Lfe43e2
Lfe43b6:
	addq.l	#1,a5
	move.b	(a5),d0
	bsr.w	Lfe4ce4
	bcs.w	Lfe46f2
	bsr.w	Lfe459e
	rts

Lfe43c8:
	cmpi.b	#$2e,d0			;'.'
	beq.s	Lfe43e8
	cmpi.b	#$5c,d0			;'\'
	beq.w	Lfe458e
	bsr.w	Lfe4ce4
	bcs.s	Lfe43e2
	bsr.w	Lfe459e
	rts

Lfe43e2:
	ori.b	#$01,ccr
	rts

Lfe43e8:
	movem.l	a0-a1,-(a7)
	movea.l	a5,a0
	addq.l	#1,a0
	lea.l	($00001758).l,a1
	move.l	a1,-(a7)
	bsr.w	Lfe4d68
	movea.l	a0,a1
	movea.l	(a7)+,a0
	bsr.s	Lfe4418
	bcs.s	Lfe440e
	bsr.w	Lfe3f16
	tst.l	d0
	bmi.w	Lfe46e6
Lfe440e:
	movea.l	a1,a5
	move.l	d0,d6
	movem.l	(a7)+,a0-a1
	rts

Lfe4418:
	tst.b	($0002,a0)
	beq.s	Lfe442c
	tst.b	($0003,a0)
	beq.w	Lfe44c6
Lfe4426:
	andi.b	#$fe,ccr
	rts

Lfe442c:
	move.b	(a0),d0
	bsr.w	Lfe4de2
	cmp.b	#$41,d0			;'A'
	beq.s	Lfe4488
	cmp.b	#$44,d0			;'D'
	beq.s	Lfe44a0
	cmp.b	#$50,d0			;'P'
	beq.s	Lfe4454
	cmp.b	#$53,d0			;'S'
	beq.s	Lfe4468
	cmp.b	#$5a,d0			;'Z'
	beq.w	Lfe450c
	bra.s	Lfe4426

Lfe4454:
	move.b	($0001,a0),d0
	bsr.w	Lfe4de2
	cmp.b	#$43,d0			;'C'
	bne.s	Lfe4426
	move.l	($0096,a6),d0
	bra.s	Lfe44c0

Lfe4468:
	move.b	($0001,a0),d0
	bsr.w	Lfe4de2
	cmp.b	#$50,d0			;'P'
	bne.s	Lfe4426
Lfe4476:
	move.l	($0092,a6),d0
	btst.b	#$05,($00a0,a6)
	bne.s	Lfe44c0
	move.l	($009a,a6),d0
	bra.s	Lfe44c0

Lfe4488:
	clr.l	d0
	move.b	($0001,a0),d0
	sub.b	#$30,d0			;'0'
	bcs.s	Lfe4426
	cmp.b	#$07,d0
	beq.s	Lfe4476
	bhi.s	Lfe4426
	addq.l	#8,d0
	bra.s	Lfe44b6

Lfe44a0:
	clr.l	d0
	move.b	($0001,a0),d0
	sub.b	#$30,d0			;'0'
	bcs.w	Lfe4426
	cmp.b	#$08,d0
	bcc.w	Lfe4426
Lfe44b6:
	lsl.l	#2,d0
	lea.l	($0056,a6),a0
	move.l	(a0,d0.w),d0
Lfe44c0:
	ori.b	#$01,ccr
	rts

Lfe44c6:
	move.b	(a0),d0
	bsr.w	Lfe4de2
	cmp.b	#$55,d0			;'U'
	beq.s	Lfe44da
	cmp.b	#$53,d0			;'S'
	bne.w	Lfe4426
Lfe44da:
	move.w	d0,d1
	move.b	($0001,a0),d0
	bsr.w	Lfe4de2
	cmp.b	#$53,d0			;'S'
	bne.w	Lfe4426
	move.b	($0002,a0),d0
	bsr.w	Lfe4de2
	cmp.b	#$50,d0			;'P'
	bne.w	Lfe4426
	move.l	($009a,a6),d0
	cmp.b	#$55,d1			;'U'
	beq.s	Lfe44c0
	move.l	($0092,a6),d0
	bra.s	Lfe44c0

Lfe450c:
	clr.l	d0
	move.b	($0001,a0),d0
	sub.b	#$30,d0			;'0'
	bcs.w	Lfe4426
	cmp.b	#$0a,d0
	bcc.w	Lfe4426
	lsl.l	#2,d0
	lea.l	($01b8,a6),a0
	move.l	(a0,d0.w),d0
	bra.s	Lfe44c0

Lfe452e:
	tst.w	($0172,a6)
	beq.s	Lfe4556
	move.l	a5,-(a7)
	addq.l	#1,a5
	bsr.w	Lfe423c
	bcs.s	Lfe454e
	move.l	(a5)+,d0
	cmpi.b	#$29,d0			;')'
	bne.w	Lfe46f2
	addq.l	#4,a7
	bra.w	Lfe4cc2

Lfe454e:
	movea.l	(a7)+,a5
	ori.b	#$01,ccr
	rts

Lfe4556:
	addq.l	#1,a5
	bsr.w	Lfe423c
	bcs.s	Lfe456c
	move.b	(a5)+,d0
	cmpi.b	#$29,d0			;')'
	beq.w	Lfe4cc2
	bra.w	Lfe46f2

Lfe456c:
	rts

Lfe456e:
	andi.w	#$00ff,d0
	move.w	d0,-(a7)
	addq.l	#1,a5
	clr.l	d6
Lfe4578:
	move.b	(a5)+,d0
	beq.w	Lfe46f2
	cmp.w	(a7),d0
	beq.s	Lfe4588
	lsl.l	#8,d6
	move.b	d0,d6
	bra.s	Lfe4578

Lfe4588:
	addq.l	#2,a7
	bra.w	Lfe4cc2

Lfe458e:
	addq.l	#1,a5
Lfe4590:
	bsr.w	Lfe4730
	bcs.w	Lfe46f2
	move.l	d1,d6
	bra.w	Lfe4cc2

Lfe459e:
	clr.l	d6
Lfe45a0:
	move.b	(a5)+,d0
	bsr.w	Lfe4ce4
	bcs.s	Lfe45ca
	cmpi.b	#$41,d0			;'A'
	bcs.s	Lfe45c0
	cmpi.b	#$61,d0			;'a'
	bcs.s	Lfe45ba
	sub.b	#$57,d0			;'W'
	bra.s	Lfe45c4

Lfe45ba:
	subi.b	#$37,d0			;'7'
	bra.s	Lfe45c4

Lfe45c0:
	subi.b	#$30,d0			;'0'
Lfe45c4:
	lsl.l	#4,d6
	or.b	d0,d6
	bra.s	Lfe45a0

Lfe45ca:
	move.b	-(a5),d0
	rts

Lfe45ce:
	clr.l	d6
	addq.l	#1,a5
	move.b	(a5),d0
	cmpi.b	#$30,d0			;'0'
	bcs.w	Lfe46f2
	cmpi.b	#$31,d0			;'1'
	bls.s	Lfe45e6
	bra.w	Lfe46f2

Lfe45e6:
	move.b	(a5)+,d0
	cmpi.b	#$30,d0			;'0'
	bcs.s	Lfe45ca
	subi.b	#$31,d0			;'1'
	bhi.s	Lfe45ca
	eori.b	#$10,ccr
	roxl.l	#1,d6
	bra.s	Lfe45e6

Lfe45fc:
	move.l	#$00007fff,d0
	cmp.l	d0,d3
	bgt.s	Lfe4618
	cmp.l	d0,d1
	bgt.s	Lfe4618
	not.l	d0
	cmp.l	d0,d3
	blt.s	Lfe4618
	cmp.l	d0,d1
	blt.s	Lfe4618
	muls.w	d1,d3
	rts

Lfe4618:
	move.l	d1,d4
	bpl.s	Lfe461e
	neg.l	d1
Lfe461e:
	eor.l	d3,d4
	tst.l	d3
	bpl.s	Lfe4626
	neg.l	d3
Lfe4626:
	move.l	d3,d5
	move.l	d3,d6
	mulu.w	d1,d3
	swap.w	d5
	mulu.w	d1,d5
	swap.w	d1
	mulu.w	d1,d6
	swap.w	d1
	swap.w	d5
	swap.w	d6
	clr.w	d5
	clr.w	d6
	add.l	d5,d3
	add.l	d6,d3
	tst.l	d4
	bpl.s	Lfe4648
	neg.l	d3
Lfe4648:
	rts

Lfe464a:
	move.l	d1,d6
	bpl.s	Lfe4650
	neg.l	d6
Lfe4650:
	move.l	d3,d7
	bpl.s	Lfe4656
	neg.l	d7
Lfe4656:
	bsr.s	Lfe4664
	eor.l	d1,d3
	tst.l	d3
	bpl.s	Lfe4660
	neg.l	d7
Lfe4660:
	move.l	d7,d3
	rts

Lfe4664:
	cmp.l	d6,d7
	bhi.s	Lfe4676
	bne.s	Lfe4670
	clr.l	d5
	moveq.l	#$01,d7
	rts

Lfe4670:
	move.l	d7,d5
	clr.l	d7
	rts

Lfe4676:
	tst.l	d6
	bne.s	Lfe4684
	move.l	#$7fffffff,d7
	move.l	d7,d5
	rts

Lfe4684:
	swap.w	d6
	tst.w	d6
	bne.s	Lfe46a6
	swap.w	d6
	swap.w	d7
	cmp.w	d6,d7
	bcc.s	Lfe46a2
	swap.w	d7
	divu.w	d6,d7
	swap.w	d7
	move.w	d7,d5
	ext.l	d5
	clr.w	d7
	swap.w	d7
	rts

Lfe46a2:
	swap.w	d7
	bra.s	Lfe46a8

Lfe46a6:
	swap.w	d6
Lfe46a8:
	move.l	d4,-(a7)
	move.l	d6,d4
Lfe46ac:
	asl.l	#1,d4
	bcs.s	Lfe46b6
	cmp.l	d7,d4
	bcs.s	Lfe46ac
	beq.s	Lfe46b8
Lfe46b6:
	roxr.l	#1,d4
Lfe46b8:
	clr.l	d0
	not.l	d0
	sub.l	d4,d7
Lfe46be:
	bmi.s	Lfe46cc
	lsl.l	#1,d0
	cmp.l	d4,d6
	beq.s	Lfe46d8
	lsr.l	#1,d4
	sub.l	d4,d7
	bra.s	Lfe46be

Lfe46cc:
	rol.l	#1,d0
	cmp.l	d4,d6
	beq.s	Lfe46d8
	lsr.l	#1,d4
	add.l	d4,d7
	bra.s	Lfe46be

Lfe46d8:
	move.l	d7,d5
	bpl.s	Lfe46de
	add.l	d4,d5
Lfe46de:
	not.l	d0
	move.l	d0,d7
	move.l	(a7)+,d4
	rts

Lfe46e6:
	lea.l	(Lfe4708,pc),a0
	bsr.w	Lfe4bc8
	bra.w	Lfe0146

Lfe46f2:
	lea.l	(Lfe471b,pc),a0
	bsr.w	Lfe4bc8
	movea.l	a5,a0
	bsr.w	Lfe4bc8
	bsr.w	Lfe4bb8
	bra.w	Lfe0146

Lfe4708:
	.dc.b	'Expression error',$0d,$0a,$00
Lfe471b:
	.dc.b	'Expression error at ',$00
Lfe4730:
	clr.l	d1
	move.b	(a5),d0
	bsr.w	Lfe4d10
	bcs.s	Lfe4758
	move.b	(a5)+,d0
Lfe473c:
	asl.l	#1,d1
	move.l	d1,d4
	asl.l	#2,d1
	add.l	d4,d1
	subi.b	#$30,d0			;'0'
	ext.w	d0
	ext.l	d0
	add.l	d0,d1
	move.b	(a5)+,d0
	bsr.w	Lfe4d10
	bcc.s	Lfe473c
	move.b	-(a5),d0
Lfe4758:
	rts

Lfe475a:
	move.w	#$0001,($016e,a6)
	move.b	(a5)+,d0
	bsr.w	Lfe4de2
	cmpi.b	#$53,d0			;'S'
	bne.s	Lfe4772
	clr.w	($016e,a6)
	bra.s	Lfe4788

Lfe4772:
	cmpi.b	#$57,d0			;'W'
	beq.s	Lfe4788
	cmpi.b	#$4c,d0			;'L'
	bne.s	Lfe4786
	move.w	#$0002,($016e,a6)
	bra.s	Lfe4788

Lfe4786:
	move.b	-(a5),d0
Lfe4788:
	move.l	($002a,a6),($0002,a6)
	bsr.w	Lfe029e
	tst.w	($0000.w,a6)
	bne.s	Lfe47ac
Lfe4798:
	bsr.w	Lfe4df4
	move.l	($002a,a6),d0
	addi.l	#$0000007f,d0
	move.l	d0,($0006,a6)
	bra.s	Lfe47b8

Lfe47ac:
	move.l	($0002,a6),($002a,a6)
	subq.w	#1,($0000.w,a6)
	beq.s	Lfe4798
Lfe47b8:
	move.l	($002a,a6),d0
	cmp.l	($0006,a6),d0
	bhi.w	Lfe0248
	move.l	d0,($002a,a6)
	move.l	d0,($0002,a6)
	movea.l	($0002,a6),a2
Lfe47d0:
	cmpa.l	($0006,a6),a2
	bhi.w	Lfe486c
	move.l	a2,($002a,a6)
	move.l	a2,d1
	bsr.w	Lfe4c22
	bsr.w	Lfe4bc4
	moveq.l	#$10,d5
	tst.w	($01e2,a6)
	beq.s	Lfe47f0
	moveq.l	#$08,d5
Lfe47f0:
	clr.w	d3
	move.w	($016e,a6),d4
	cmp.w	#$0002,d4
	bne.s	Lfe47fe
	moveq.l	#$03,d4
Lfe47fe:
	move.w	d5,($000a,a6)
Lfe4802:
	move.w	($000a,a6),d0
	and.w	d4,d0
	bne.s	Lfe480e
	bsr.w	Lfe4bc4
Lfe480e:
	move.b	(a2)+,d1
	bsr.w	Lfe4c3c
	cmpa.l	($0006,a6),a2
	bhi.s	Lfe4820
	subq.w	#1,($000a,a6)
	bne.s	Lfe4802
Lfe4820:
	bsr.s	Lfe487c
	move.w	d5,($000a,a6)
	movea.l	($0002,a6),a0
	move.l	a2,($0002,a6)
	movea.l	a0,a2
Lfe4830:
	move.b	(a2),d0
	bsr.s	Lfe489e
	move.b	(a2)+,d0
	bsr.w	Lfe48ca
	bcc.s	Lfe4844
	move.b	(a2)+,d0
	bsr.s	Lfe48b4
	subq.w	#1,($000a,a6)
Lfe4844:
	cmpa.l	($0006,a6),a2
	bhi.s	Lfe485c
	subq.w	#1,($000a,a6)
	bgt.s	Lfe4830
	movea.l	a0,a2
	adda.l	d5,a2
Lfe4854:
	bsr.w	Lfe4bb8
	bra.w	Lfe47d0

Lfe485c:
	movea.l	a0,a2
	adda.l	d5,a2
	cmpa.l	($0006,a6),a2
	bls.s	Lfe4854
	movea.l	($0006,a6),a2
	addq.l	#1,a2
Lfe486c:
	move.l	a2,($002a,a6)
	tst.w	($000a,a6)
	bmi.s	Lfe487a
	bsr.w	Lfe4bb8
Lfe487a:
	rts

Lfe487c:
	tst.w	($01e2,a6)
	bne.s	Lfe4890
	bsr.w	Lfe4bc4
	cmpi.w	#$003c,($0022,a6)	;'<'
	bcs.s	Lfe487c
	rts

Lfe4890:
	bsr.w	Lfe4bc4
	cmpi.w	#$0023,($0022,a6)	;'#'
	bcs.s	Lfe4890
	rts

Lfe489e:
	cmp.b	#$f6,d0
	bcc.s	Lfe48aa
	cmp.b	#$20,d0			;' '
	bcc.s	Lfe48ae
Lfe48aa:
	move.b	#$2e,d0			;'.'
Lfe48ae:
	bsr.w	Lfe4b72
	rts

Lfe48b4:
	cmp.b	#$20,d0			;' '
	bcs.s	Lfe48c0
	cmp.b	#$fc,d0
	bls.s	Lfe48c4
Lfe48c0:
	move.b	#$2e,d0			;'.'
Lfe48c4:
	bsr.w	Lfe4b72
	rts

Lfe48ca:
	cmp.b	#$80,d0
	bcs.s	Lfe48e8
	cmp.b	#$f6,d0
	bcc.s	Lfe48e8
	cmp.b	#$e0,d0
	bcc.s	Lfe48e2
	cmp.b	#$a0,d0
	bcc.s	Lfe48e8
Lfe48e2:
	ori.b	#$01,ccr
	rts

Lfe48e8:
	andi.b	#$fe,ccr
	rts

Lfe48ee:
	move.w	#$0001,($0170,a6)
	move.w	#$0001,($016e,a6)
	move.b	(a5)+,d0
	bsr.w	Lfe4de2
	cmpi.b	#$4e,d0			;'N'
	bne.s	Lfe4910
	clr.w	($0170,a6)
	move.b	(a5)+,d0
	bsr.w	Lfe4de2
Lfe4910:
	cmpi.b	#$53,d0			;'S'
	bne.s	Lfe491c
	clr.w	($016e,a6)
	bra.s	Lfe4940

Lfe491c:
	cmpi.b	#$57,d0			;'W'
	beq.s	Lfe4940
	cmpi.b	#$4c,d0			;'L'
	bne.s	Lfe4930
	move.w	#$0002,($016e,a6)
	bra.s	Lfe4940

Lfe4930:
	cmpi.b	#$50,d0			;'P'
	bne.s	Lfe493e
	move.w	#$0003,($016e,a6)
	bra.s	Lfe4940

Lfe493e:
	move.b	-(a5),d0
Lfe4940:
	bsr.w	Lfe4cc2
	tst.b	d0
	beq.s	Lfe4976
	cmp.b	#$3a,d0			;':'
	beq.s	Lfe4976
	bsr.w	Lfe4238
	bcs.w	Lfe0248
	move.l	d6,($002e,a6)
	bsr.w	Lfe4cc2
	tst.b	d0
	beq.s	Lfe4976
	cmp.b	#$3a,d0			;':'
	beq.s	Lfe4976
	bsr.w	Lfe34fe
	tst.w	d7
	beq.s	Lfe4976
	bsr.w	Lfe4a7e
	rts

Lfe4976:
	move.l	a5,-(a7)
	tst.w	($016e,a6)
	beq.s	Lfe4992
	cmpi.w	#$0003,($016e,a6)
	beq.s	Lfe4992
	move.l	($002e,a6),d0
	bclr.l	#$00,d0
	move.l	d0,($002e,a6)
Lfe4992:
	move.l	($002e,a6),d1
	bsr.w	Lfe4c22
	bsr.w	Lfe4bc0
	tst.w	($0170,a6)
	beq.s	Lfe49d4
	movea.l	($002e,a6),a2
	cmpi.w	#$0003,($016e,a6)
	beq.s	Lfe49ba
	cmpi.w	#$0001,($016e,a6)
	bhi.s	Lfe49ca
	beq.s	Lfe49c2
Lfe49ba:
	move.b	(a2),d1
	bsr.w	Lfe4c3c
	bra.s	Lfe49d0

Lfe49c2:
	move.w	(a2),d1
	bsr.w	Lfe4c28
	bra.s	Lfe49d0

Lfe49ca:
	move.l	(a2),d1
	bsr.w	Lfe4c22
Lfe49d0:
	bsr.w	Lfe4bc4
Lfe49d4:
	bsr.w	Lfe4abc
	bsr.w	Lfe4cd4
	cmpi.b	#$3b,d0			;';'
	beq.s	Lfe4a08
	tst.b	d0
	beq.s	Lfe4a42
	cmp.b	#$5e,d0			;'^'
	beq.s	Lfe4a60
	cmpi.b	#$2d,d0			;'-'
	bne.s	Lfe49fc
	bsr.w	Lfe4cc2
	tst.b	d0
	beq.s	Lfe4a60
	bra.s	Lfe4a10

Lfe49fc:
	cmpi.b	#$2e,d0			;'.'
	bne.s	Lfe4a10
	bsr.w	Lfe4cc2
	bne.s	Lfe4a10
Lfe4a08:
	bsr.w	Lfe4bb8
	movea.l	(a7)+,a5
	rts

Lfe4a10:
	lea.l	($029e,a6),a5
	bsr.w	Lfe4238
	bcc.s	Lfe4a22
	bsr.w	Lfe0432
	bra.w	Lfe4992

Lfe4a22:
	movea.l	($002e,a6),a2
	cmpi.w	#$0003,($016e,a6)
	beq.s	Lfe4a38
	cmpi.w	#$0001,($016e,a6)
	bhi.s	Lfe4a40
	beq.s	Lfe4a3c
Lfe4a38:
	move.b	d6,(a2)+
	bra.s	Lfe4a42

Lfe4a3c:
	move.w	d6,(a2)+
	bra.s	Lfe4a42

Lfe4a40:
	move.l	d6,(a2)+
Lfe4a42:
	clr.l	d0
	move.w	($016e,a6),d0
	cmpi.w	#$0003,d0
	bne.s	Lfe4a52
	moveq.l	#$02,d0
	bra.s	Lfe4a58

Lfe4a52:
	add.w	d0,d0
	bne.s	Lfe4a58
	moveq.l	#$01,d0
Lfe4a58:
	add.l	d0,($002e,a6)
	bra.w	Lfe4992

Lfe4a60:
	clr.l	d0
	move.w	($016e,a6),d0
	cmpi.w	#$0003,d0
	bne.s	Lfe4a70
	moveq.l	#$02,d0
	bra.s	Lfe4a76

Lfe4a70:
	add.w	d0,d0
	bne.s	Lfe4a76
	moveq.l	#$01,d0
Lfe4a76:
	sub.l	d0,($002e,a6)
	bra.w	Lfe4992

Lfe4a7e:
	lea.l	($029e,a6),a1
	movea.l	($002e,a6),a0
	tst.w	($016e,a6)
	beq.s	Lfe4aa0
	cmpi.w	#$0003,($016e,a6)
	beq.s	Lfe4aaa
	lsr.w	#1,d7
	subq.w	#1,d7
Lfe4a98:
	move.w	(a1)+,(a0)+
	dbra.w	d7,Lfe4a98
	rts

Lfe4aa0:
	subq.w	#1,d7
Lfe4aa2:
	move.b	(a1)+,(a0)+
	dbra.w	d7,Lfe4aa2
	rts

Lfe4aaa:
	subq.w	#1,d7
Lfe4aac:
	move.b	(a1)+,(a0)+
	addq.l	#1,a0
	dbra.w	d7,Lfe4aac
Lfe4ab4:
	bsr.w	Lfe4bb8
	bra.w	Lfe0146

Lfe4abc:
	move.b	#$3a,d0			;':'
	bsr.w	Lfe4b72
	bsr.s	Lfe4aca
	movea.l	a0,a5
	rts

Lfe4aca:
	lea.l	($029e,a6),a0
	move.l	a0,d5
	bsr.s	Lfe4af4
	cmpi.b	#$03,d0
	beq.s	Lfe4ab4
	rts

Lfe4ada:
	move.b	#$2b,d0			;'+'
	bsr.w	Lfe4b72
	lea.l	($0206,a6),a0
	move.l	a0,d5
	bsr.s	Lfe4af4
	cmpi.b	#$03,d0
	beq.s	Lfe4ab4
	movea.l	a0,a5
	rts

Lfe4af4:
	movea.l	d5,a0
Lfe4af6:
	bsr.s	Lfe4b6e
	cmpi.b	#$03,d0
	beq.s	Lfe4b6c
	cmpi.b	#$08,d0
	beq.s	Lfe4b10
	cmpi.b	#$18,d0
	beq.s	Lfe4b10
	cmpi.b	#$7f,d0
	bne.s	Lfe4b20
Lfe4b10:
	cmpa.l	d5,a0
	bls.s	Lfe4b30
	moveq.l	#$08,d0
	bsr.s	Lfe4b86
	subq.l	#1,a0
	cmpa.l	d5,a0
	bls.s	Lfe4b30
	bra.s	Lfe4af6

Lfe4b20:
	cmpi.b	#$15,d0
	bne.s	Lfe4b32
Lfe4b26:
	move.b	#$23,d0			;'#'
	bsr.s	Lfe4b86
	bsr.w	Lfe4bb8
Lfe4b30:
	bra.s	Lfe4af4

Lfe4b32:
	cmpi.b	#$12,d0
	beq.s	Lfe4b50
	cmpi.b	#$0d,d0
	beq.s	Lfe4b64
	move.l	d5,d4
	add.l	#$00000063,d4
	cmp.l	a0,d4
	bls.s	Lfe4b26
	move.b	d0,(a0)+
	bsr.s	Lfe4b86
	bra.s	Lfe4af6

Lfe4b50:
	movea.l	d5,a1
	bsr.s	Lfe4bb8
	move.b	#$20,d0			;' '
	bsr.s	Lfe4b86
	exg.l	a1,a0
	clr.b	(a1)
	bsr.s	Lfe4bc8
	exg.l	a0,a1
	bra.s	Lfe4af6

Lfe4b64:
	bsr.s	Lfe4bb8
	clr.b	(a0)
	movea.l	a0,a1
	movea.l	d5,a0
Lfe4b6c:
	rts

Lfe4b6e:
	bra.w	Lfe4c9e

Lfe4b72:
	bsr.s	Lfe4b86
	cmpi.b	#$03,d0
	beq.w	Lfe4ab4
	cmpi.b	#$1b,d0
	beq.w	Lfe4ab4
	rts

Lfe4b86:
	cmpi.b	#$0d,d0
	bne.s	Lfe4b96
	bsr.w	Lfe4ca8
	clr.w	($0022,a6)
	bra.s	Lfe4ba4

Lfe4b96:
	cmpi.b	#$0a,d0
	beq.s	Lfe4ba0
	addq.w	#1,($0022,a6)
Lfe4ba0:
	bsr.w	Lfe4ca8
Lfe4ba4:
	clr.l	d0
	bsr.w	Lfe4c96
	beq.s	Lfe4bb6
	bsr.s	Lfe4b6e
	cmpi.b	#$13,d0
	bne.s	Lfe4bb6
	bsr.s	Lfe4b6e
Lfe4bb6:
	rts

Lfe4bb8:
	moveq.l	#$0d,d0
	bsr.s	Lfe4b72
	moveq.l	#$0a,d0
	bra.s	Lfe4b72

Lfe4bc0:
	moveq.l	#$09,d0
	bra.s	Lfe4b72

Lfe4bc4:
	moveq.l	#$20,d0			;' '
	bra.s	Lfe4b72

Lfe4bc8:
	move.b	(a0)+,d0
	beq.s	Lfe4bd0
	bsr.s	Lfe4b72
	bra.s	Lfe4bc8

Lfe4bd0:
	rts

Lfe4bd2:
	bsr.s	Lfe4b6e
	move.w	d0,-(a7)
	bsr.s	Lfe4b72
	move.w	(a7)+,d0
	rts

Lfe4bdc:
	move.l	d6,d3
	bsr.s	Lfe4be4
	bsr.s	Lfe4bc8
	rts

Lfe4be4:
	lea.l	($0302,a6),a0
	clr.b	-(a0)
	moveq.l	#$09,d2
	moveq.l	#$0a,d6
	move.l	d3,d7
	bpl.s	Lfe4c02
	neg.l	d7
	bpl.s	Lfe4c02
	subq.l	#1,d7
	bsr.w	Lfe4664
	addi.b	#$31,d5			;'1'
	bra.s	Lfe4c0a

Lfe4c02:
	bsr.w	Lfe4664
	addi.b	#$30,d5			;'0'
Lfe4c0a:
	move.b	d5,-(a0)
	tst.l	d7
	dbeq.w	d2,Lfe4c02
	moveq.l	#$0a,d0
	sub.b	d2,d0
	tst.l	d3
	bpl.s	Lfe4c20
	move.b	#$2d,-(a0)		;'-'
	addq.w	#1,d0
Lfe4c20:
	rts

Lfe4c22:
	swap.w	d1
	bsr.s	Lfe4c28
	swap.w	d1
Lfe4c28:
	move.w	#$0004,-(a7)
Lfe4c2c:
	rol.w	#4,d1
	bsr.s	Lfe4c42
	subq.w	#1,(a7)
	bne.s	Lfe4c2c
	adda.l	#$00000002,a7
	rts

Lfe4c3c:
	rol.b	#4,d1
	bsr.s	Lfe4c42
	rol.b	#4,d1
Lfe4c42:
	move.b	d1,d0
	andi.b	#$0f,d0
	cmpi.b	#$0a,d0
	blt.s	Lfe4c52
	addi.b	#$07,d0
Lfe4c52:
	addi.b	#$30,d0			;'0'
	bsr.w	Lfe4b72
	rts

Lfe4c5c:
	swap.w	d1
	bsr.s	Lfe4c62
	swap.w	d1
Lfe4c62:
	move.w	#$0004,-(a7)
Lfe4c66:
	rol.w	#4,d1
	bsr.s	Lfe4c7c
	subq.w	#1,(a7)
	bne.s	Lfe4c66
	adda.l	#$00000002,a7
	rts

Lfe4c76:
	rol.b	#4,d1
	bsr.s	Lfe4c7c
	rol.b	#4,d1
Lfe4c7c:
	move.b	d1,d0
	andi.b	#$0f,d0
	cmpi.b	#$0a,d0
	blt.s	Lfe4c8c
	addi.b	#$07,d0
Lfe4c8c:
	addi.b	#$30,d0			;'0'
	move.b	d0,(a3)+
	rts

Lfe4c94:
	rts

Lfe4c96:
	IOCS	_ISNS232C
	tst.w	d0
	rts

Lfe4c9e:
	bsr.s	Lfe4c96
	beq.s	Lfe4c9e
	IOCS	_INP232C
	rts

Lfe4ca8:
	move.w	d1,-(a7)
	move.w	d0,d1
	cmpi.b	#$fe,d0
	bcc.s	Lfe4cbe
Lfe4cb2:
	IOCS	_OSNS232C
	tst.w	d0
	beq.s	Lfe4cb2
	IOCS	_OUT232C
Lfe4cbe:
	move.w	(a7)+,d1
	rts

Lfe4cc2:
	move.b	(a5)+,d0
	cmpi.b	#$20,d0			;' '
	beq.s	Lfe4cc2
	cmpi.b	#$09,d0
	beq.s	Lfe4cc2
	move.b	-(a5),d0
	rts

Lfe4cd4:
	move.b	(a5)+,d0
	cmpi.b	#$20,d0			;' '
	beq.s	Lfe4cd4
	cmpi.b	#$09,d0
	beq.s	Lfe4cd4
	rts

Lfe4ce4:
	bsr.w	Lfe4de2
	cmpi.b	#$30,d0			;'0'
	bcs.s	Lfe4d0e
	cmpi.b	#$3a,d0			;':'
	bcs.s	Lfe4d0a
	cmpi.b	#$41,d0			;'A'
	bcs.s	Lfe4d0e
	cmpi.b	#$47,d0			;'G'
	bcs.s	Lfe4d0a
	cmpi.b	#$61,d0			;'a'
	bcs.s	Lfe4d0e
	cmpi.b	#$67,d0			;'g'
Lfe4d0a:
	eori.b	#$01,ccr
Lfe4d0e:
	rts

Lfe4d10:
	cmpi.b	#$39,d0			;'9'
	bhi.s	Lfe4d1c
	cmpi.b	#$30,d0			;'0'
	rts

Lfe4d1c:
	ori.b	#$01,ccr
	rts

Lfe4d22:
	cmpi.b	#$20,d0			;' '
	bcs.s	Lfe4d30
	cmpi.b	#$7f,d0
	eori.b	#$01,ccr
Lfe4d30:
	rts

Lfe4d32:
	cmpi.b	#$30,d0			;'0'
	bcs.s	Lfe4d66
	cmpi.b	#$3a,d0			;':'
	bcs.s	Lfe4d62
	cmpi.b	#$3f,d0			;'?'
	bls.s	Lfe4d66
	cmpi.b	#$40,d0			;'@'
	beq.s	Lfe4d66
	cmpi.b	#$5a,d0			;'Z'
	bcs.s	Lfe4d62
	cmp.b	#$5f,d0			;'_'
	beq.s	Lfe4d62
	bcs.s	Lfe4d66
	cmp.b	#$60,d0			;'`'
	beq.s	Lfe4d66
	cmp.b	#$7a,d0			;'z'
Lfe4d62:
	eori.b	#$01,ccr
Lfe4d66:
	rts

Lfe4d68:
	move.b	(a0),d0
	beq.s	Lfe4dc8
	cmp.b	#$2e,d0			;'.'
	beq.s	Lfe4da8
Lfe4d72:
	move.b	(a0),d0
	cmp.b	#$30,d0			;'0'
	bcs.s	Lfe4dc8
	cmp.b	#$3a,d0			;':'
	bcs.s	Lfe4da8
	cmp.b	#$3f,d0			;'?'
	bcs.s	Lfe4dc8
	cmp.b	#$80,d0
	bcc.s	Lfe4dae
	cmp.b	#$5b,d0			;'['
	bcs.s	Lfe4da8
	beq.s	Lfe4dc8
	cmp.b	#$5d,d0			;']'
	beq.s	Lfe4dc8
	cmp.b	#$7b,d0			;'{'
	bcs.s	Lfe4da8
	beq.s	Lfe4dc8
	cmp.b	#$7d,d0			;'}'
	bls.s	Lfe4dc8
Lfe4da8:
	addq.l	#1,a0
	move.b	d0,(a1)+
	bra.s	Lfe4d72

Lfe4dae:
	cmp.b	#$e0,d0
	bcc.s	Lfe4dba
	cmp.b	#$a0,d0
	bcc.s	Lfe4da8
Lfe4dba:
	addq.l	#1,a0
	move.b	d0,(a1)+
	move.b	(a0),d0
	cmp.b	#$20,d0			;' '
	bcc.s	Lfe4da8
	subq.l	#1,a1
Lfe4dc8:
	clr.b	(a1)
	rts

Lfe4dcc:
	move.l	a5,-(a7)
Lfe4dce:
	move.b	(a0),d0
	beq.s	Lfe4dde
	move.b	(a5)+,d0
	bsr.s	Lfe4de2
	cmp.b	(a0)+,d0
	beq.s	Lfe4dce
	movea.l	(a7)+,a5
	rts

Lfe4dde:
	addq.l	#4,a7
	rts

Lfe4de2:
	cmpi.b	#$61,d0			;'a'
	bcs.s	Lfe4df2
	cmpi.b	#$7a,d0			;'z'
	bhi.s	Lfe4df2
	andi.b	#$df,d0
Lfe4df2:
	rts

Lfe4df4:
	bsr.w	Lfe4cc2
	tst.b	d0
	beq.s	Lfe4e04
	cmpi.b	#$3a,d0			;':'
	bne.w	Lfe022e
Lfe4e04:
	rts

Lfe4e06:
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$41,$f9,$00,$fe,$50,$00
	.dc.b	$43,$f9,$00,$00,$68,$00,$20,$3c
	.dc.b	$00,$01,$0d,$7a,$d0,$bc,$00,$00
	.dc.b	$03,$ff,$90,$bc,$00,$00,$68,$00
	.dc.b	$12,$d8,$51,$c8,$ff,$fc,$4e,$f9
	.dc.b	$00,$00,$68,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$fe
	.dc.b	$4f,$c0,$60,$00,$08,$fe,$70,$af
	.dc.b	$4e,$4f,$20,$3c,$00,$00,$72,$94
	.dc.b	$23,$c0,$00,$00,$00,$2c,$20,$3c
	.dc.b	$00,$00,$d1,$84,$23,$c0,$00,$00
	.dc.b	$00,$b8,$20,$3c,$00,$00,$74,$5a
	.dc.b	$23,$c0,$00,$00,$07,$fc,$20,$7c
	.dc.b	$00,$01,$0d,$7a,$22,$7c,$00,$00
	.dc.b	$18,$00,$32,$3c,$00,$ff,$22,$d8
	.dc.b	$51,$c9,$ff,$fc,$20,$7c,$00,$00
	.dc.b	$1c,$04,$32,$3c,$00,$fe,$42,$98
	.dc.b	$51,$c9,$ff,$fc,$20,$79,$00,$ed
	.dc.b	$00,$08,$59,$88,$2c,$4f,$43,$f9
	.dc.b	$00,$00,$68,$88,$24,$79,$00,$00
	.dc.b	$00,$08,$23,$c9,$00,$00,$00,$08
	.dc.b	$20,$10,$20,$bc,$58,$36,$38,$6b
	.dc.b	$0c,$90,$58,$36,$38,$6b,$66,$0a
	.dc.b	$20,$80,$23,$ca,$00,$00,$00,$08
	.dc.b	$60,$18,$2e,$4e,$23,$ca,$00,$00
	.dc.b	$00,$08,$b1,$fc,$00,$10,$00,$00
	.dc.b	$65,$08,$91,$fc,$00,$10,$00,$00
	.dc.b	$60,$ba,$58,$88,$23,$c8,$00,$00
	.dc.b	$1c,$00,$23,$fc,$00,$01,$0d,$7a
	.dc.b	$00,$00,$d4,$e8,$61,$00,$4d,$fc
	.dc.b	$23,$c9,$00,$00,$d4,$ec,$4a,$39
	.dc.b	$00,$00,$d8,$dc,$67,$00,$09,$6c
	.dc.b	$33,$fc,$00,$05,$00,$00,$d7,$38
	.dc.b	$13,$fc,$00,$02,$00,$00,$d8,$e0
	.dc.b	$61,$00,$33,$36,$61,$00,$40,$8a
	.dc.b	$48,$79,$00,$00,$72,$30,$3f,$3c
	.dc.b	$ff,$f1,$ff,$25,$5c,$8f,$48,$79
	.dc.b	$00,$00,$72,$52,$3f,$3c,$00,$2b
	.dc.b	$ff,$25,$5c,$8f,$23,$c0,$00,$00
	.dc.b	$d4,$f0,$48,$79,$00,$00,$72,$78
	.dc.b	$3f,$3c,$00,$2a,$ff,$25,$5c,$8f
	.dc.b	$23,$c0,$00,$00,$d4,$f4,$42,$67
	.dc.b	$48,$79,$00,$00,$70,$12,$ff,$3d
	.dc.b	$5c,$8f,$4a,$80,$6b,$00,$00,$e8
	.dc.b	$20,$79,$00,$00,$d4,$e8,$34,$00
	.dc.b	$2f,$3c,$00,$01,$00,$44,$2f,$08
	.dc.b	$3f,$02,$ff,$3f,$4f,$ef,$00,$0a
	.dc.b	$22,$40,$3f,$02,$ff,$3e,$54,$8f
	.dc.b	$13,$fc,$00,$03,$00,$00,$70,$09
	.dc.b	$4a,$50,$66,$00,$00,$b0,$30,$18
	.dc.b	$13,$c0,$00,$00,$70,$09,$3f,$00
	.dc.b	$3f,$3c,$00,$02,$ff,$23,$58,$8f
	.dc.b	$3e,$18,$34,$18,$32,$3c,$00,$04
	.dc.b	$70,$13,$4e,$4f,$34,$18,$32,$3c
	.dc.b	$00,$08,$70,$13,$4e,$4f,$70,$1f
	.dc.b	$4e,$4f,$42,$41,$12,$07,$70,$15
	.dc.b	$4e,$4f,$2a,$48,$d1,$fc,$00,$00
	.dc.b	$00,$34,$2f,$08,$41,$f9,$00,$00
	.dc.b	$d5,$02,$61,$00,$05,$78,$41,$f9
	.dc.b	$00,$00,$70,$80,$61,$00,$05,$6a
	.dc.b	$20,$3c,$00,$00,$70,$81,$91,$c0
	.dc.b	$20,$08,$13,$c0,$00,$00,$70,$7f
	.dc.b	$20,$57,$32,$18,$34,$18,$22,$48
	.dc.b	$70,$1b,$4e,$4f,$58,$88,$70,$ff
	.dc.b	$32,$3c,$3f,$ff,$20,$c0,$51,$c9
	.dc.b	$ff,$fc,$20,$5f,$32,$07,$e0,$49
	.dc.b	$4a,$01,$67,$0e,$70,$15,$4e,$4f
	.dc.b	$32,$18,$34,$18,$22,$48,$70,$1b
	.dc.b	$4e,$4f,$32,$3c,$00,$03,$70,$15
	.dc.b	$4e,$4f,$70,$1e,$4e,$4f,$4a,$39
	.dc.b	$00,$00,$70,$09,$67,$04,$70,$ae
	.dc.b	$4e,$4f,$60,$1c,$d3,$c8,$42,$11
	.dc.b	$42,$21,$2f,$08,$60,$06,$48,$79
	.dc.b	$00,$00,$6f,$c0,$ff,$09,$58,$8f
	.dc.b	$61,$00,$51,$92,$70,$ae,$4e,$4f
	.dc.b	$42,$67,$48,$79,$00,$00,$70,$1c
	.dc.b	$ff,$3d,$5c,$8f,$4a,$80,$6b,$28
	.dc.b	$34,$00,$2f,$3c,$00,$00,$02,$c8
	.dc.b	$48,$79,$00,$00,$f7,$08,$3f,$02
	.dc.b	$ff,$3f,$4f,$ef,$00,$0a,$3f,$02
	.dc.b	$ff,$3e,$54,$8f,$4a,$39,$00,$00
	.dc.b	$70,$09,$67,$04,$61,$00,$51,$56
	.dc.b	$22,$79,$00,$00,$d4,$e8,$22,$09
	.dc.b	$42,$82,$70,$38,$4e,$4f,$32,$3c
	.dc.b	$17,$7f,$61,$00,$03,$fa,$22,$09
	.dc.b	$74,$01,$70,$38,$4e,$4f,$32,$3c
	.dc.b	$17,$7f,$61,$00,$03,$ea,$22,$09
	.dc.b	$74,$02,$70,$38,$4e,$4f,$32,$3c
	.dc.b	$1f,$ff,$61,$00,$03,$da,$22,$09
	.dc.b	$74,$03,$70,$38,$4e,$4f,$32,$3c
	.dc.b	$34,$df,$61,$00,$03,$ca,$22,$09
	.dc.b	$74,$04,$70,$38,$4e,$4f,$32,$3c
	.dc.b	$34,$df,$61,$00,$03,$ba,$22,$09
	.dc.b	$74,$05,$70,$38,$4e,$4f,$32,$3c
	.dc.b	$5f,$ff,$61,$00,$03,$aa,$23,$c9
	.dc.b	$00,$00,$d4,$e8,$4f,$ef,$ff,$38
	.dc.b	$42,$67,$48,$79,$00,$00,$70,$24
	.dc.b	$ff,$3d,$5c,$8f,$4a,$80,$6b,$00
	.dc.b	$00,$84,$34,$00,$24,$79,$00,$00
	.dc.b	$d4,$e8,$2f,$3c,$00,$01,$00,$00
	.dc.b	$2f,$0a,$3f,$02,$ff,$3f,$4f,$ef
	.dc.b	$00,$0a,$4a,$80,$6b,$60,$26,$00
	.dc.b	$45,$ea,$00,$22,$55,$83,$6b,$56
	.dc.b	$72,$08,$48,$41,$32,$1a,$b2,$7c
	.dc.b	$ff,$ff,$67,$20,$b2,$7c,$80,$00
	.dc.b	$64,$02,$e0,$59,$22,$4a,$70,$10
	.dc.b	$b2,$7c,$f0,$00,$64,$02,$70,$20
	.dc.b	$d5,$c0,$96,$80,$6b,$30,$70,$0f
	.dc.b	$4e,$4f,$60,$d0,$55,$83,$6b,$26
	.dc.b	$72,$0c,$48,$41,$32,$1a,$b2,$7c
	.dc.b	$80,$00,$64,$02,$e0,$59,$22,$4a
	.dc.b	$70,$30,$b2,$7c,$f0,$00,$64,$02
	.dc.b	$70,$48,$d5,$c0,$96,$80,$6b,$06
	.dc.b	$70,$0f,$4e,$4f,$60,$d6,$3f,$02
	.dc.b	$ff,$3e,$54,$8f,$2c,$4f,$42,$67
	.dc.b	$48,$79,$00,$00,$70,$2e,$ff,$3d
	.dc.b	$5c,$8f,$74,$0f,$76,$14,$2e,$00
	.dc.b	$4a,$80,$6b,$44,$41,$f9,$00,$00
	.dc.b	$70,$39,$61,$00,$03,$1a,$66,$16
	.dc.b	$61,$00,$03,$b2,$b0,$bc,$00,$00
	.dc.b	$00,$05,$65,$0a,$b0,$bc,$00,$00
	.dc.b	$00,$5e,$64,$02,$24,$00,$41,$f9
	.dc.b	$00,$00,$70,$3f,$61,$00,$02,$f8
	.dc.b	$66,$16,$61,$00,$03,$90,$b0,$bc
	.dc.b	$00,$00,$00,$02,$65,$0a,$b0,$bc
	.dc.b	$00,$00,$00,$fa,$64,$02,$26,$00
	.dc.b	$54,$42,$33,$c2,$00,$00,$d7,$38
	.dc.b	$13,$c3,$00,$00,$d8,$e0,$61,$00
	.dc.b	$30,$48,$61,$00,$3d,$9c,$4a,$87
	.dc.b	$6b,$00,$02,$4e,$41,$f9,$00,$00
	.dc.b	$70,$59,$61,$00,$02,$ba,$66,$24
	.dc.b	$61,$00,$02,$e2,$10,$1d,$80,$3c
	.dc.b	$00,$20,$b0,$3c,$00,$6f,$66,$14
	.dc.b	$10,$1d,$80,$3c,$00,$20,$b0,$3c
	.dc.b	$00,$6e,$66,$08,$13,$fc,$00,$01
	.dc.b	$00,$00,$d4,$fe,$41,$f9,$00,$00
	.dc.b	$70,$5f,$61,$00,$02,$8a,$66,$24
	.dc.b	$61,$00,$02,$b2,$10,$1d,$80,$3c
	.dc.b	$00,$20,$b0,$3c,$00,$6f,$66,$14
	.dc.b	$10,$1d,$80,$3c,$00,$20,$b0,$3c
	.dc.b	$00,$6e,$66,$08,$13,$fc,$00,$01
	.dc.b	$00,$00,$d7,$26,$41,$f9,$00,$00
	.dc.b	$70,$47,$61,$00,$02,$5a,$66,$50
	.dc.b	$61,$00,$02,$82,$42,$67,$2f,$0d
	.dc.b	$ff,$3d,$5c,$8f,$4a,$80,$6b,$40
	.dc.b	$34,$00,$20,$79,$00,$00,$d4,$e8
	.dc.b	$2f,$3c,$00,$00,$ff,$ff,$2f,$08
	.dc.b	$3f,$02,$ff,$3f,$4f,$ef,$00,$0a
	.dc.b	$4a,$80,$6b,$1e,$48,$e7,$e0,$00
	.dc.b	$34,$00,$22,$08,$70,$39,$4e,$4f
	.dc.b	$4c,$df,$00,$07,$52,$80,$08,$80
	.dc.b	$00,$00,$d1,$c0,$23,$c8,$00,$00
	.dc.b	$d4,$e8,$3f,$02,$ff,$3e,$54,$8f
	.dc.b	$61,$00,$02,$c6,$24,$79,$00,$00
	.dc.b	$d4,$ec,$41,$f9,$00,$00,$70,$4c
	.dc.b	$61,$00,$01,$f8,$66,$00,$01,$3e
	.dc.b	$61,$00,$02,$1a,$4f,$ef,$ff,$a6
	.dc.b	$20,$4f,$61,$00,$02,$44,$22,$79
	.dc.b	$00,$00,$d4,$e8,$d1,$fc,$03,$00
	.dc.b	$00,$00,$2f,$3c,$00,$0f,$00,$00
	.dc.b	$2f,$09,$2f,$08,$3f,$3c,$00,$03
	.dc.b	$ff,$4b,$4f,$ef,$00,$0e,$4a,$80
	.dc.b	$6b,$00,$00,$f2,$24,$89,$20,$0d
	.dc.b	$4f,$ef,$ff,$e6,$2a,$4f,$1b,$7c
	.dc.b	$00,$16,$00,$00,$1b,$7c,$00,$00
	.dc.b	$00,$02,$2b,$40,$00,$12,$10,$39
	.dc.b	$00,$00,$d8,$dc,$52,$00,$1b,$40
	.dc.b	$00,$16,$22,$09,$22,$41,$28,$69
	.dc.b	$00,$06,$4e,$94,$28,$69,$00,$0a
	.dc.b	$4e,$94,$4a,$2d,$00,$03,$66,$00
	.dc.b	$00,$ae,$20,$2d,$00,$0e,$d0,$bc
	.dc.b	$00,$01,$00,$00,$b0,$b9,$00,$00
	.dc.b	$1c,$00,$64,$00,$05,$06,$90,$bc
	.dc.b	$00,$01,$00,$22,$b0,$89,$65,$00
	.dc.b	$04,$fa,$23,$ed,$00,$0e,$00,$00
	.dc.b	$d4,$e8,$2f,$0a,$08,$29,$00,$07
	.dc.b	$00,$04,$66,$08,$20,$4d,$61,$00
	.dc.b	$3c,$80,$60,$5a,$30,$29,$00,$04
	.dc.b	$08,$00,$00,$00,$67,$0e,$45,$f9
	.dc.b	$00,$00,$d7,$58,$25,$49,$00,$04
	.dc.b	$61,$00,$01,$06,$08,$00,$00,$01
	.dc.b	$67,$1c,$45,$f9,$00,$00,$d7,$98
	.dc.b	$25,$49,$00,$04,$61,$00,$00,$f2
	.dc.b	$45,$f9,$00,$00,$d7,$d8,$25,$49
	.dc.b	$00,$04,$61,$00,$00,$e4,$45,$f9
	.dc.b	$00,$00,$d8,$18,$61,$00,$00,$ec
	.dc.b	$66,$04,$25,$49,$00,$04,$45,$f9
	.dc.b	$00,$00,$d8,$58,$61,$00,$00,$dc
	.dc.b	$66,$04,$25,$49,$00,$04,$24,$5f
	.dc.b	$22,$11,$6b,$04,$22,$41,$60,$8a
	.dc.b	$24,$49,$4f,$ef,$00,$1a,$4f,$ef
	.dc.b	$00,$5a,$60,$00,$fe,$d6,$4f,$ef
	.dc.b	$00,$1a,$20,$4f,$2f,$08,$ff,$09
	.dc.b	$58,$8f,$4f,$ef,$00,$5a,$48,$79
	.dc.b	$00,$00,$70,$66,$ff,$09,$58,$8f
	.dc.b	$60,$00,$fe,$b8,$23,$ca,$00,$00
	.dc.b	$d4,$ec,$41,$f9,$00,$00,$70,$53
	.dc.b	$61,$00,$00,$a4,$66,$24,$41,$f9
	.dc.b	$00,$00,$d5,$02,$61,$00,$01,$16
	.dc.b	$41,$f9,$00,$00,$70,$80,$61,$00
	.dc.b	$01,$08,$20,$3c,$00,$00,$70,$80
	.dc.b	$91,$c0,$20,$08,$13,$c0,$00,$00
	.dc.b	$70,$7f,$3f,$07,$ff,$3e,$54,$8f
	.dc.b	$4f,$ef,$00,$c8,$20,$39,$00,$00
	.dc.b	$d4,$e8,$d0,$bc,$00,$00,$1f,$ff
	.dc.b	$c0,$bc,$ff,$ff,$e0,$00,$23,$c0
	.dc.b	$00,$01,$0c,$80,$e0,$88,$ea,$88
	.dc.b	$53,$40,$13,$c0,$00,$e8,$60,$01
	.dc.b	$41,$f9,$00,$00,$70,$0a,$61,$00
	.dc.b	$48,$8c,$23,$c0,$00,$00,$d7,$28
	.dc.b	$3f,$3c,$00,$03,$3f,$3c,$00,$02
	.dc.b	$ff,$23,$58,$8f,$4e,$75
Lfe5664:
	clr.l	d0
Lfe5666:
	move.b	d0,(a1)+
	dbra.w	d1,Lfe5666
	rts

Lfe566e:
	moveq.l	#$07,d1
	lea.l	($000e,a1),a0
	lea.l	($0020,a2),a3
Lfe5678:
	move.b	(a0)+,(a3)+
	dbra.w	d1,Lfe5678
	rts

Lfe5680:
	moveq.l	#$07,d1
	lea.l	($000e,a1),a0
	lea.l	($0020,a2),a3
Lfe568a:
	cmpm.b	(a0)+,(a3)+
	bne.s	Lfe5692
	dbra.w	d1,Lfe568a
Lfe5692:
	rts

Lfe5694:
	bsr.w	Lfe5756
Lfe5698:
	bsr.w	Lfe5764
	bne.s	Lfe56c0
	movea.l	a0,a1
	movea.l	a6,a5
Lfe56a2:
	move.b	(a1)+,d1
	beq.s	Lfe56b2
	move.b	(a5)+,d0
	or.b	#$20,d0
	cmp.b	d0,d1
	beq.s	Lfe56a2
	bra.s	Lfe5698

Lfe56b2:
	move.b	(a5)+,d0
	cmp.b	#$20,d0			;' '
	beq.s	Lfe56b2
	cmp.b	#$3d,d0			;'='
	bne.s	Lfe5698
Lfe56c0:
	rts

Lfe56c2:
	cmpi.b	#$20,(a5)		;' '
	bne.s	Lfe56cc
	addq.l	#1,a5
	bra.s	Lfe56c2

Lfe56cc:
	movea.l	a5,a0
	move.l	a1,-(a7)
	movea.l	a0,a1
Lfe56d2:
	move.b	(a0)+,d0
	beq.s	Lfe56ee
Lfe56d6:
	move.b	d0,(a1)+
	cmp.b	#$20,d0			;' '
	bne.s	Lfe56d2
	clr.b	(-$0001,a1)
Lfe56e2:
	move.b	(a0)+,d0
	beq.s	Lfe56ee
	cmp.b	#$20,d0			;' '
	beq.s	Lfe56e2
	bra.s	Lfe56d6

Lfe56ee:
	clr.b	(a1)+
	clr.b	(a1)
	movea.l	(a7)+,a1
	rts

Lfe56f6:
	movem.l	a0/a5,-(a7)
Lfe56fa:
	move.b	(a5)+,d0
	cmp.b	#$20,d0			;' '
	bcs.s	Lfe5706
	move.b	d0,(a0)+
	bra.s	Lfe56fa

Lfe5706:
	clr.b	(a0)
	movem.l	(a7)+,a0/a5
	rts

Lfe570e:
	clr.l	d1
	bra.s	Lfe5714

Lfe5712:
	moveq.l	#$20,d1			;' '
Lfe5714:
	move.b	(a5)+,d0
	beq.s	Lfe572c
	cmp.b	#$20,d0			;' '
	beq.s	Lfe5714
Lfe571e:
	move.b	d0,(a0)+
	move.b	(a5)+,d0
	beq.s	Lfe572c
	cmp.b	d1,d0
	bne.s	Lfe571e
	clr.b	(a0)
	rts

Lfe572c:
	clr.b	(a0)
	subq.l	#1,a5
	rts

Lfe5732:
	clr.l	d0
	clr.l	d1
Lfe5736:
	move.b	(a5)+,d0
	cmp.b	#$20,d0			;' '
	beq.s	Lfe5736
Lfe573e:
	sub.b	#$30,d0			;'0'
	cmp.b	#$0a,d0
	bcc.s	Lfe5752
	mulu.w	#$000a,d1
	add.l	d0,d1
	move.b	(a5)+,d0
	bra.s	Lfe573e

Lfe5752:
	move.l	d1,d0
	rts

Lfe5756:
	clr.w	-(a7)
	clr.l	-(a7)
	move.w	d7,-(a7)
	DOS	_SEEK
	lea.l	($0008,a7),a7
	rts

Lfe5764:
	movea.l	a6,a5
Lfe5766:
	bsr.s	Lfe579a
	bne.s	Lfe5786
	cmp.b	#$1a,d0
	beq.s	Lfe5786
	cmp.b	#$09,d0
	bne.s	Lfe5778
	moveq.l	#$20,d0			;' '
Lfe5778:
	move.b	d0,(a5)+
	cmp.b	#$0a,d0
	bne.s	Lfe5766
	clr.b	-(a5)
	clr.b	-(a5)
	rts

Lfe5786:
	cmpa.l	a6,a5
	beq.s	Lfe5792
	moveq.l	#$1a,d0
	clr.b	(a5)+
	clr.b	(a5)
	rts

Lfe5792:
	clr.b	(a5)+
	clr.b	(a5)
	moveq.l	#$ff,d0
	rts

Lfe579a:
	clr.w	-(a7)
	move.l	a7,d0
	move.l	#$00000001,-(a7)
	move.l	d0,-(a7)
	move.w	d7,-(a7)
	DOS	_READ
	lea.l	($0006,a7),a7
	cmp.l	(a7)+,d0
	bne.s	Lfe57b6
	move.b	(a7),d0
	cmp.b	d0,d0
Lfe57b6:
	lea.l	($0002,a7),a7
	rts

Lfe57bc:
	.dc.b	$00,$00,$00,$00,$1b,$2a,$1b,$5b
	.dc.b	$31,$6d,$48,$75,$6d,$61,$6e,$36
	.dc.b	$38,$6b,$20,$66,$6f,$72,$20,$58
	.dc.b	$36,$38,$30,$30,$30,$1b,$5b,$6d
	.dc.b	$20,$76,$65,$72,$73,$69,$6f,$6e
	.dc.b	$20,$31,$2e,$30,$30,$0d,$0a,$43
	.dc.b	$6f,$70,$79,$72,$69,$67,$68,$74
	.dc.b	$20,$31,$39,$38,$37,$20,$53,$48
	.dc.b	$41,$52,$50,$2f,$48,$75,$64,$73
	.dc.b	$6f,$6e,$0d,$0a,$00,$03,$43,$4c
	.dc.b	$4f,$43,$4b,$20,$20,$20,$54,$49
	.dc.b	$54,$4c,$45,$2e,$53,$59,$53,$00
	.dc.b	$4b,$45,$59,$2e,$53,$59,$53,$00
	.dc.b	$55,$53,$4b,$43,$47,$2e,$53,$59
	.dc.b	$53,$00,$43,$4f,$4e,$46,$49,$47
	.dc.b	$2e,$53,$59,$53,$00,$66,$69,$6c
	.dc.b	$65,$73,$00,$62,$75,$66,$66,$65
	.dc.b	$72,$73,$00,$62,$65,$6c,$6c,$00
	.dc.b	$64,$65,$76,$69,$63,$65,$00,$73
	.dc.b	$68,$65,$6c,$6c,$00,$62,$72,$65
	.dc.b	$61,$6b,$00,$76,$65,$72,$69,$66
	.dc.b	$79,$00,$82,$aa,$93,$6f,$98,$5e
	.dc.b	$82,$c5,$82,$ab,$82,$dc,$82,$b9
	.dc.b	$82,$f1,$82,$c5,$82,$b5,$82,$bd
	.dc.b	$0d,$0a,$00,$02,$2f,$70,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$2e,$7c,$00,$00
	.dc.b	$68,$00,$61,$00,$f6,$fc,$41,$f9
	.dc.b	$00,$01,$0c,$78,$61,$00,$2a,$34
	.dc.b	$2f,$3c,$00,$00,$00,$f0,$ff,$48
	.dc.b	$58,$8f,$41,$f9,$00,$00,$70,$7f
	.dc.b	$22,$40,$23,$c0,$00,$00,$6f,$bc
	.dc.b	$30,$3c,$00,$ef,$12,$d8,$51,$c8
	.dc.b	$ff,$fc,$48,$79,$00,$00,$72,$1c
	.dc.b	$3f,$3c,$ff,$f1,$ff,$25,$5c,$8f
Lfe5944:
	move.l	#$ffffffff,-(a7)
	move.l	($00006fbc).l,-(a7)
	pea.l	($0000d502)
	move.w	#$0001,-(a7)
	DOS	_EXEC
	lea.l	($000e,a7),a7
	tst.l	d0
	bmi.s	Lfe5988
	move.l	#$ffffffff,($0060,a0)
	move.l	#$ffffffff,-(a7)
	move.l	($00006fbc).l,-(a7)
	move.l	d0,-(a7)
	move.w	#$0004,-(a7)
	DOS	_EXEC
	lea.l	($000e,a7),a7
	tst.l	d0
	bpl.s	Lfe59ac
Lfe5988:
	move.w	#$0003,-(a7)
	move.w	#$0002,-(a7)
	DOS	_CONCTRL
	addq.l	#4,a7
	bsr.s	Lfe5a10
	pea.l	($0000d502)
	DOS	_PRINT
	addq.l	#4,a7
	pea.l	($0000d55c)
	DOS	_PRINT
	addq.l	#4,a7
	bra.s	Lfe59b8

Lfe59ac:
	bsr.s	Lfe5a10
	pea.l	($0000d577)
	DOS	_PRINT
	addq.l	#4,a7
Lfe59b8:
	pea.l	($0000d586)
	bra.s	Lfe59c6

Lfe59c0:
	pea.l	($0000d5a4)
Lfe59c6:
	DOS	_PRINT
	addq.l	#4,a7
	clr.b	($0000d501)
	clr.b	($0000d502)
	pea.l	($0000d500)
	DOS	_GETSS
	addq.l	#4,a7
	bsr.s	Lfe5a10
	tst.b	($0000d501)
	beq.s	Lfe59c0
	move.l	#$ffffffff,-(a7)
	move.l	($00006fbc).l,-(a7)
	pea.l	($0000d502)
	move.w	#$0002,-(a7)
	DOS	_EXEC
	lea.l	($000e,a7),a7
	tst.l	d0
	bmi.w	Lfe5988
	bra.w	Lfe5944

Lfe5a10:
	pea.l	($0000d5f1)
	DOS	_PRINT
	addq.l	#4,a7
	rts

Lfe5a1c:
	lea.l	($00006800).l,a7
	bsr.s	Lfe5a10
	pea.l	($0000d5a6)
	DOS	_PRINT
	addq.l	#4,a7
	bra.s	Lfe59b8

Lfe5a30:
	lea.l	($00006800).l,a7
	IOCS	_OS_CURON
	lea.l	($0000d5b5),a1
	IOCS	_B_PRINT
	clr.l	d0
	trap	#15
Lfe5a48:
	move.l	#$58363800,d0		;'X68'<<8
	trap	#10
	bra.s	Lfe5a48

Lfe5a52:
	tst.b	($0000d4fd)
	bne.s	Lfe5a76
	or.b	#$80,d0
	move.b	d0,($0000d4fd)
	tst.w	($0000d4e2)
	bne.s	Lfe5a76
	bsr.w	Lfe5b26
	clr.b	($0000d4fd)
Lfe5a76:
	rte

Lfe5a78:
	move.l	d0,($0000d4f8)
	bset.b	#$01,($0000d4fc)
	tst.w	($0000d4e2)
	bne.s	Lfe5a92
	bsr.w	Lfe5b62
Lfe5a92:
	rte

Lfe5a94:
	movem.l	d1-d7/a0-a6,-(a7)
	lea.l	($003a,a7),a6
	movea.l	(a6)+,a0
	btst.b	#$05,($0038,a7)
	bne.s	Lfe5aa8
	move.l	usp,a6
Lfe5aa8:
	move.w	(a0)+,d0
	move.l	a0,($003a,a7)
	cmpi.w	#$ff00,d0
	bcs.w	Lfe5bc0
	andi.l	#$000000ff,d0
	movea.l	d0,a0
	adda.w	a0,a0
	adda.w	a0,a0
	adda.l	#$00001800,a0
	movea.l	(a0),a0
	tst.w	($0000d4e2)
	bne.s	Lfe5ad8
	move.l	a7,($0000d4e4)
Lfe5ad8:
	addq.w	#1,($0000d4e2)
	jsr	(a0)
	subq.w	#1,($0000d4e2)
Lfe5ae6:
	tst.b	($0000d4fd)
	beq.s	Lfe5afe
	movem.l	d0,-(a7)
	bsr.s	Lfe5b26
	movem.l	(a7)+,d0
	clr.b	($0000d4fd)
Lfe5afe:
	tst.w	($0000d4fc)
	beq.s	Lfe5b14
	tst.w	($0000d4e2)
	bne.s	Lfe5b14
	move.l	d0,-(a7)
	bsr.s	Lfe5b52
	move.l	(a7)+,d0
Lfe5b14:
	movem.l	(a7)+,d1-d7/a0-a6
	btst.b	#$07,(a7)
	bne.s	Lfe5b20
	rte

Lfe5b20:
	ori.w	#$8000,sr
	rte

Lfe5b26:
	clr.l	d0
	move.b	($0000d4fd),d0
	move.l	d0,-(a7)
	btst.b	#$00,($0003,a7)
	bne.s	Lfe5b3e
	bsr.w	Lfe8d3c
	bra.s	Lfe5b46

Lfe5b3e:
	bsr.w	Lfe627e
	bsr.w	Lfe628e
Lfe5b46:
	move.l	(a7)+,d0
	move.w	sr,-(a7)
	movea.l	($0000d4f0),a0
	jmp	(a0)

Lfe5b52:
	btst.b	#$01,($0000d4fc)
	beq.s	Lfe5ba2
	move.l	($0000d4f8),d0
Lfe5b62:
	movem.l	d0-d2,-(a7)
	moveq.l	#$ff,d1
	IOCS	_CONTRAST
	move.l	d0,d2
	and.b	#$0f,d2
	asl.l	#1,d2
	clr.l	d1
	IOCS	_CONTRAST
Lfe5b7a:
	swap.w	d2
Lfe5b7c:
	dbra.w	d2,Lfe5b7c
	swap.w	d2
	dbra.w	d2,Lfe5b7a
	movem.l	(a7)+,d0-d2
	bclr.b	#$01,($0000d4fc)
	bsr.s	Lfe5ba4
	move.l	($0000d4f8),d0
	movea.l	($0000d4f4),a0
	jmp	(a0)

Lfe5ba2:
	rts

Lfe5ba4:
	move.w	($0000d738),d2
Lfe5baa:
	move.w	d2,-(a7)
	DOS	_CLOSE
	addq.l	#2,a7
	subq.w	#1,d2
	bpl.s	Lfe5baa
	bsr.w	Lfe8d3c
	rts

Lfe5bba:
	addq.l	#4,a7
	or.w	#$ff00,d0
Lfe5bc0:
	move.l	d0,d7
	lea.l	($0038,a7),a6
	trap	#14
	move.w	#$00ff,d0
	trap	#15
Lfe5bce:
	tst.b	($0000d725)
	beq.s	Lfe5be2
	movem.l	d1,-(a7)
	bsr.s	Lfe5c26
	movem.l	(a7)+,d1
	bmi.s	Lfe5c16
Lfe5be2:
	bsr.w	Lfe627e
	lea.l	($0000d5ef),a1
	bsr.w	Lfe5c8c
	movea.l	($0000d4e4),a7
	tst.b	($0000d725)
	beq.s	Lfe5c02
	bsr.s	Lfe5c26
	bmi.s	Lfe5c16
Lfe5c02:
	move.l	($00001bc4).l,d0
	move.l	d0,($003a,a7)
	clr.w	($0000d4e2)
	bra.w	Lfe5ae6

Lfe5c16:
	movea.l	($0000d4e4),a7
	clr.w	($0000d4e2)
	bra.w	Lfe5ae6

Lfe5c26:
	move.b	($0000d725),d0
	clr.b	($0000d725)
	cmp.b	#-$03,d0
	beq.s	Lfe5c56
	cmp.b	#-$02,d0
	beq.s	Lfe5c4c
	moveq.l	#$01,d0
	bsr.w	Lfe6b78
	bmi.s	Lfe5c58
	move.l	a0,($0000d704)
Lfe5c4c:
	movea.l	($0000d704),a0
	bsr.w	Lfe661a
Lfe5c56:
	clr.l	d0
Lfe5c58:
	rts

Lfe5c5a:
	tst.b	($0000d725)
	beq.s	Lfe5c6e
	movem.l	d1,-(a7)
	bsr.s	Lfe5c26
	movem.l	(a7)+,d1
	bmi.s	Lfe5c16
Lfe5c6e:
	movea.l	($0000d4de),a7
	IOCS	_ABORTRST
	clr.w	($0000d4e2)
	move.l	($00001bc8).l,-(a7)
	move.w	($0000d4dc),-(a7)
	rte

Lfe5c8c:
	clr.w	d1
Lfe5c8e:
	move.b	(a1)+,d1
	beq.s	Lfe5c98
	bsr.w	Lfe626c
	bra.s	Lfe5c8e

Lfe5c98:
	rts

Lfe5c9a:
	subq.w	#1,(a4)
	subq.w	#2,(a6)
	subq.w	#3,d5
	tst.w	(a0)
	not.b	d0
Lfe5ca4:
	bsr.w	Lfe5da8
	move.l	d0,d1
	cmp.w	#$0003,d0
	beq.w	Lfe5bce
	cmp.w	#$0010,d0
	beq.s	Lfe5cc6
	cmp.w	#$000e,d0
	beq.s	Lfe5cce
	bsr.w	Lfe626c
	move.l	d1,d0
	rts

Lfe5cc6:
	not.b	($0000d5f7)
	bra.s	Lfe5ca4

Lfe5cce:
	clr.b	($0000d5f7)
	bra.s	Lfe5ca4

Lfe5cd6:
	move.w	(a6),d1
Lfe5cd8:
	bsr.w	Lfe626c
Lfe5cdc:
	bsr.w	Lfe632c
	cmp.w	#$0013,d1
	beq.s	Lfe5cfe
Lfe5ce6:
	clr.l	d0
	cmp.w	#$0003,d1
	beq.w	Lfe5bce
	cmp.w	#$0010,d1
	beq.s	Lfe5d0a
	cmp.w	#$000e,d1
	beq.s	Lfe5d18
	rts

Lfe5cfe:
	bsr.w	Lfe6320
	bsr.w	Lfe5da8
	move.l	d0,d1
	bra.s	Lfe5ce6

Lfe5d0a:
	bsr.w	Lfe6320
	not.b	($0000d5f7)
	clr.l	d0
	rts

Lfe5d18:
	bsr.w	Lfe6320
	clr.b	($0000d5f7)
	clr.l	d0
	rts

Lfe5d26:
	bsr.w	Lfe6260
	tst.l	d0
	bne.s	Lfe5d3c
	bsr.w	Lfe632c
	cmp.w	#$0003,d1
	beq.w	Lfe5bce
	bra.s	Lfe5d26

Lfe5d3c:
	bsr.w	Lfe6336
	rts

Lfe5d42:
	move.w	(a6),-(a7)
Lfe5d44:
	bsr.w	Lfe6266
	tst.l	d0
	bne.s	Lfe5d5a
	bsr.w	Lfe632c
	cmp.w	#$0003,d1
	beq.w	Lfe5bce
	bra.s	Lfe5d44

Lfe5d5a:
	move.w	(a7)+,d1
	bsr.w	Lfe633a
	rts

Lfe5d62:
	move.w	(a6),-(a7)
Lfe5d64:
	bsr.w	Lfe625a
	tst.l	d0
	bne.s	Lfe5d7a
	bsr.w	Lfe632c
	cmp.w	#$0003,d1
	beq.w	Lfe5bce
	bra.s	Lfe5d64

Lfe5d7a:
	move.w	(a7)+,d1
	bsr.w	Lfe633e
	rts

Lfe5d82:
	move.w	(a6),d1
	cmp.b	#$ff,d1
	beq.s	Lfe5d98
	cmp.b	#$fe,d1
	beq.s	Lfe5da0
	bsr.w	Lfe626c
	clr.l	d0
	rts

Lfe5d98:
	bsr.w	Lfe6320
	move.l	d1,d0
	rts

Lfe5da0:
	bsr.w	Lfe632c
	move.l	d1,d0
	rts

Lfe5da8:
	tst.b	($0000d4fc)
	bne.w	Lfe5bce
	bsr.w	Lfe6320
	tst.l	d1
	beq.s	Lfe5da8
	move.l	d1,d0
	rts

Lfe5dbe:
	bsr.s	Lfe5da8
	cmp.w	#$0003,d0
	beq.w	Lfe5bce
	cmp.w	#$0010,d0
	beq.s	Lfe5dd6
	cmp.w	#$000e,d0
	beq.s	Lfe5dde
	rts

Lfe5dd6:
	not.b	($0000d5f7)
	bra.s	Lfe5dbe

Lfe5dde:
	clr.b	($0000d5f7)
	bra.s	Lfe5dbe

Lfe5de6:
	movea.l	(a6),a1
Lfe5de8:
	clr.w	d1
	move.b	(a1)+,d1
	beq.s	Lfe5df4
	bsr.w	Lfe5cd8
	bra.s	Lfe5de8

Lfe5df4:
	rts

Lfe5df6:
	move.w	#$0100,($0000d5f8)
	bra.s	Lfe5e06

Lfe5e00:
	clr.w	($0000d5f8)
Lfe5e06:
	movea.l	(a6),a1
	clr.w	d3
Lfe5e0a:
	move.w	d3,($0000d5f4)
	bsr.w	Lfe61e8
	lea.l	(-$0100,a7),a7
	move.b	(a1)+,d2
	movea.l	a1,a2
	addq.l	#1,a1
	movea.l	a1,a5
	movea.l	a7,a6
Lfe5e22:
	move.w	#$00ff,d0
Lfe5e26:
	move.b	(a5)+,(a6)+
	dbra.w	d0,Lfe5e26
Lfe5e2c:
	movea.l	a7,a6
	clr.w	d4
	bra.s	Lfe5e3c

Lfe5e32:
	moveq.l	#$07,d1
	bsr.w	Lfe6474
	bsr.w	Lfe63f6
Lfe5e3c:
	bsr.w	Lfe643c
	clr.l	d1
	move.b	d0,d1
	cmp.w	#$000a,d1
	beq.s	Lfe5e3c
	cmp.w	#$000d,d1
	beq.s	Lfe5e92
	cmp.w	#$0008,d1
	beq.s	Lfe5eba
	cmp.w	#$001b,d1
	beq.s	Lfe5ed0
Lfe5e5c:
	cmp.b	d2,d4
	bcc.s	Lfe5e32
	move.w	d1,d0
	bsr.w	Lfe5ff8
	add.l	d4,d0
	cmp.b	d2,d0
	bcc.s	Lfe5e32
	clr.w	d0
	tst.b	($0000d5f6)
	bne.s	Lfe5e80
	move.b	(a1),d0
	beq.s	Lfe5e80
	bsr.w	Lfe5ff8
	addq.l	#1,a1
Lfe5e80:
	addq.b	#1,d4
	move.b	d1,(a6)+
	tst.w	d0
	beq.s	Lfe5e8c
	move.b	#$20,(a1)		;' '
Lfe5e8c:
	bsr.w	Lfe5f3e
	bra.s	Lfe5e3c

Lfe5e92:
	clr.w	($0000d5f8)
	moveq.l	#$0d,d1
	bsr.w	Lfe6474
	clr.b	(a6)
	move.b	d4,(a2)+
	clr.w	d0
	move.b	d4,d0
	movea.l	a2,a1
	movea.l	a7,a0
Lfe5eaa:
	move.b	(a0)+,(a1)+
	dbra.w	d0,Lfe5eaa
	clr.l	d0
	move.b	d4,d0
	lea.l	($0100,a7),a7
	rts

Lfe5eba:
	bsr.w	Lfe61e8
	bsr.w	Lfe5f5c
	cmpa.l	a1,a2
	bcs.w	Lfe5e3c
	lea.l	($0001,a2),a1
	bra.w	Lfe5e3c

Lfe5ed0:
	bsr.w	Lfe6428
	move.l	d0,d1
	cmp.w	#$0020,d1		;' '
	bcs.s	Lfe5e5c
	and.w	#$00df,d1
	lea.l	($0000749a).l,a5
	lea.l	($0000771a).l,a4
	move.w	#$0008,d0
Lfe5ef0:
	cmp.b	(a5)+,d1
	beq.s	Lfe5f12
	addq.l	#4,a4
	dbra.w	d0,Lfe5ef0
	cmp.b	#$40,d1			;'@'
	bcs.w	Lfe5e3c
	cmp.b	#$60,d1			;'`'
	bcc.w	Lfe5e3c
	and.w	#$001f,d1
	bra.w	Lfe5e5c

Lfe5f12:
	movea.l	(a4),a4
	jsr	(a4)
	bra.w	Lfe5e3c

Lfe5f1a:
	.dc.b	$00,$00,$78,$94,$00,$00,$78,$be
	.dc.b	$00,$00,$78,$d2,$00,$00,$78,$ee
	.dc.b	$00,$00,$79,$08,$00,$00,$79,$1e
	.dc.b	$00,$00,$79,$2e,$00,$00,$79,$d8
	.dc.b	$00,$00,$79,$58
Lfe5f3e:
	cmp.b	#$20,d1			;' '
	bcs.s	Lfe5f48
	bra.w	Lfe6474

Lfe5f48:
	move.w	d1,-(a7)
	move.b	#$5e,d1			;'^'
	bsr.w	Lfe6474
	move.w	(a7)+,d1
	add.w	#$0040,d1
	bra.w	Lfe6474

Lfe5f5c:
	clr.l	d0
	tst.b	d4
	beq.s	Lfe5f86
	bsr.s	Lfe5f88
Lfe5f64:
	move.l	d0,-(a7)
	moveq.l	#$08,d1
	bsr.w	Lfe6474
	moveq.l	#$20,d1			;' '
	bsr.w	Lfe6474
	moveq.l	#$08,d1
	bsr.w	Lfe6474
	move.l	(a7)+,d0
	subq.w	#1,d0
	bne.s	Lfe5f64
	swap.w	d0
	suba.l	d0,a1
	suba.l	d0,a6
	sub.b	d0,d4
Lfe5f86:
	rts

Lfe5f88:
	movem.l	d1/a6,-(a7)
	clr.l	d0
	move.b	d4,d0
	suba.l	d0,a6
Lfe5f92:
	move.b	(a6)+,d1
	cmp.b	#$80,d1
	bcs.s	Lfe5faa
	cmp.b	#$a0,d1
	bcs.s	Lfe5fa6
	cmp.b	#$e0,d1
	bcs.s	Lfe5faa
Lfe5fa6:
	addq.l	#1,a6
	subq.w	#1,d0
Lfe5faa:
	subq.w	#1,d0
	bne.s	Lfe5f92
	move.b	d1,d0
	bsr.s	Lfe5fb8
	movem.l	(a7)+,d1/a6
	rts

Lfe5fb8:
	cmp.b	#$20,d0			;' '
	bcs.s	Lfe5ff0
	cmp.b	#$80,d0
	bcs.s	Lfe5fe0
	beq.s	Lfe5fd8
	cmp.b	#$a0,d0
	bcs.s	Lfe5fe8
	cmp.b	#$e0,d0
	bcs.s	Lfe5fe0
	cmp.b	#$f0,d0
	bcs.s	Lfe5fe8
Lfe5fd8:
	move.l	#$00020001,d0
	rts

Lfe5fe0:
	move.l	#$00010001,d0
	rts

Lfe5fe8:
	move.l	#$00020002,d0
	rts

Lfe5ff0:
	move.l	#$00010002,d0
	rts

Lfe5ff8:
	cmp.b	#$80,d0
	bcs.s	Lfe600e
	cmp.b	#$a0,d0
	bcs.s	Lfe600a
	cmp.b	#$e0,d0
	bcs.s	Lfe600e
Lfe600a:
	moveq.l	#$01,d0
	rts

Lfe600e:
	clr.l	d0
	rts

Lfe6012:
	bsr.w	Lfe643c
	clr.w	d1
	move.b	d0,d1
	bsr.s	Lfe5ff8
	beq.s	Lfe602a
	asl.w	#8,d1
	move.w	d1,-(a7)
	bsr.w	Lfe643c
	move.w	(a7)+,d1
	move.b	d0,d1
Lfe602a:
	rts

Lfe602c:
	clr.w	d5
	movea.l	a1,a5
	move.b	(a5)+,d0
	beq.s	Lfe6072
	addq.w	#1,d5
	cmp.b	#$80,d0
	bcs.s	Lfe604e
	cmp.b	#$a0,d0
	bcs.s	Lfe6048
	cmp.b	#$e0,d0
	bcs.s	Lfe604e
Lfe6048:
	move.b	(a5)+,d0
	beq.s	Lfe6072
	addq.w	#1,d5
Lfe604e:
	cmp.w	#$0100,d1
	bcc.s	Lfe6076
Lfe6054:
	move.b	(a5)+,d0
	beq.s	Lfe6072
	move.w	d0,d6
	bsr.s	Lfe5ff8
	beq.s	Lfe6066
	move.b	(a5)+,d0
	beq.s	Lfe6072
	addq.w	#2,d5
	bra.s	Lfe6054

Lfe6066:
	cmp.b	d1,d6
	beq.s	Lfe606e
	addq.w	#1,d5
	bra.s	Lfe6054

Lfe606e:
	move.w	d5,d0
	rts

Lfe6072:
	clr.w	d0
	rts

Lfe6076:
	move.b	(a5)+,d0
	beq.s	Lfe6072
	move.w	d0,d6
	bsr.w	Lfe5ff8
	beq.s	Lfe6090
	asl.w	#8,d6
	move.b	(a5)+,d6
	beq.s	Lfe6072
	cmp.w	d6,d1
	beq.s	Lfe606e
	addq.w	#2,d5
	bra.s	Lfe6076

Lfe6090:
	addq.w	#1,d5
	bra.s	Lfe6076

Lfe6094:
	bsr.w	Lfe61e8
	move.b	(a1),d0
	beq.s	Lfe60bc
	bsr.w	Lfe5fb8
	swap.w	d0
	subq.w	#1,d0
	move.w	d0,d5
	add.b	d4,d0
	cmp.b	d2,d0
	bcc.s	Lfe60bc
Lfe60ac:
	clr.w	d1
	move.b	(a1)+,d1
	move.b	d1,(a6)+
	addq.b	#1,d4
	bsr.w	Lfe5f3e
	dbra.w	d5,Lfe60ac
Lfe60bc:
	rts

Lfe60be:
	bsr.w	Lfe61e8
	bsr.w	Lfe6012
	bsr.w	Lfe602c
	beq.s	Lfe60bc
	move.w	d0,d5
	subq.w	#1,d5
	bra.s	Lfe60ac

Lfe60d2:
	bsr.w	Lfe61e8
Lfe60d6:
	cmp.b	d2,d4
	bcc.s	Lfe60bc
	clr.w	d1
	move.b	(a1)+,d1
	beq.s	Lfe60ea
	move.b	d1,(a6)+
	addq.b	#1,d4
	bsr.w	Lfe5f3e
	bra.s	Lfe60d6

Lfe60ea:
	subq.l	#1,a1
	rts

Lfe60ee:
	bsr.w	Lfe61e8
	move.b	(a1)+,d0
	beq.s	Lfe60ea
	bsr.w	Lfe5fb8
	swap.w	d0
	cmp.b	#$02,d0
	bne.s	Lfe6106
	move.b	(a1)+,d0
	beq.s	Lfe60ea
Lfe6106:
	rts

Lfe6108:
	bsr.w	Lfe61e8
	bsr.w	Lfe6012
	bsr.w	Lfe602c
	beq.s	Lfe60bc
	clr.l	d5
	move.w	d0,d5
	adda.l	d5,a1
	rts

Lfe611e:
	bsr.w	Lfe61e8
	bsr.s	Lfe6150
	addq.l	#4,a7
	lea.l	($0001,a2),a1
	bra.w	Lfe5e2c

Lfe612e:
	bsr.w	Lfe61e8
	tst.w	($0000d5f8)
	bne.s	Lfe6192
	clr.b	(a6)
	move.b	#$40,d1			;'@'
	bsr.s	Lfe61a4
	lea.l	($0001,a2),a1
	addq.l	#4,a7
	movea.l	a7,a5
	movea.l	a1,a6
	bra.w	Lfe5e22

Lfe6150:
	bsr.w	Lfe5f5c
	bne.s	Lfe6150
	rts

Lfe6158:
	bsr.w	Lfe61e8
	clr.b	(a6)
	bsr.w	Lfe6012
	move.l	d1,-(a7)
	bsr.s	Lfe6150
	lea.l	($0001,a2),a1
	lea.l	($0008,a7),a5
	movea.l	a1,a6
	move.w	#$00ff,d0
Lfe6174:
	move.b	(a5)+,(a6)+
	dbra.w	d0,Lfe6174
	lea.l	($0008,a7),a6
	clr.w	d4
	move.l	(a7)+,d1
	bsr.w	Lfe602c
	beq.w	Lfe60bc
	move.w	d0,d5
	subq.w	#1,d5
	bra.w	Lfe60ac

Lfe6192:
	clr.b	(a6)
	bsr.s	Lfe6150
	lea.l	($0001,a2),a1
	addq.l	#4,a7
	movea.l	a7,a5
	movea.l	a1,a6
	bra.w	Lfe5e22

Lfe61a4:
	bsr.w	Lfe6474
	moveq.l	#$08,d1
	bsr.w	Lfe6474
	tst.b	d4
	beq.s	Lfe61ce
Lfe61b2:
	bsr.w	Lfe5f88
Lfe61b6:
	move.l	d0,-(a7)
	moveq.l	#$08,d1
	bsr.w	Lfe6474
	move.l	(a7)+,d0
	subq.w	#1,d0
	bne.s	Lfe61b6
	swap.w	d0
	suba.l	d0,a1
	suba.l	d0,a6
	sub.b	d0,d4
	bne.s	Lfe61b2
Lfe61ce:
	moveq.l	#$0a,d1
	bsr.w	Lfe6474
	clr.w	d4
	rts

Lfe61d8:
	not.b	($0000d5f6)
	clr.w	d0
	move.b	($0000d5f6),d0
	bra.s	Lfe61f0

Lfe61e8:
	clr.w	d0
	move.b	d0,($0000d5f6)
Lfe61f0:
	move.w	d0,-(a7)
	move.w	#$0004,-(a7)
	DOS	_KEYCTRL
	addq.l	#4,a7
	rts

Lfe61fc:
	bsr.w	Lfe632c
	clr.l	d0
	tst.l	d1
	beq.s	Lfe6220
	cmp.w	#$0003,d1
	beq.w	Lfe5bce
	cmp.w	#$0010,d1
	beq.w	Lfe5d0a
	cmp.w	#$000e,d1
	beq.w	Lfe5d18
	subq.l	#1,d0
Lfe6220:
	rts

Lfe6222:
	move.w	(a6)+,d1
	bsr.s	Lfe627e
	cmp.w	#$0001,d1
	beq.w	Lfe5ca4
	cmp.w	#$0006,d1
	beq.w	Lfe5d82
	cmp.w	#$0007,d1
	beq.w	Lfe5da8
	cmp.w	#$0008,d1
	beq.w	Lfe5dbe
	cmp.w	#$000a,d1
	beq.w	Lfe5e00
	clr.l	d0
	rts

Lfe6252:
	moveq.l	#$0a,d0
	moveq.l	#$01,d1
	bra.w	Lfe62d8

Lfe625a:
	moveq.l	#$0a,d0
	moveq.l	#$04,d1
	bra.s	Lfe62d8

Lfe6260:
	moveq.l	#$05,d0
	moveq.l	#$03,d1
	bra.s	Lfe629e

Lfe6266:
	moveq.l	#$0a,d0
	moveq.l	#$03,d1
	bra.s	Lfe62d8

Lfe626c:
	bsr.w	Lfe6342
	tst.b	($0000d5f7)
	beq.s	Lfe627c
	bsr.w	Lfe633e
Lfe627c:
	rts

Lfe627e:
	moveq.l	#$07,d0
Lfe6280:
	movem.l	d1/a1/a4-a5,-(a7)
	clr.l	d1
	bsr.s	Lfe629e
	movem.l	(a7)+,d1/a1/a4-a5
	rts

Lfe628e:
	moveq.l	#$07,d0
	movem.l	d1/a1/a4-a5,-(a7)
	moveq.l	#$03,d1
	bsr.s	Lfe629e
	movem.l	(a7)+,d1/a1/a4-a5
	rts

Lfe629e:
	lea.l	(-$001a,a7),a7
	movea.l	a7,a5
	move.w	d0,-(a7)
	move.w	d1,d0
	bsr.w	Lfe8510
	moveq.l	#$20,d1			;' '
	move.w	(a7)+,d0
	btst.b	#$07,($0001,a0)
	beq.s	Lfe62ce
	move.b	#$1a,($0000.w,a5)
	move.b	d0,($0002,a5)
	movea.l	($0004,a0),a1
	bsr.w	Lfe86c2
	move.b	($000d,a5),d1
Lfe62ce:
	clr.l	d0
	move.b	d1,d0
	lea.l	($001a,a7),a7
	rts

Lfe62d8:
	lea.l	(-$001a,a7),a7
	movea.l	a7,a5
	move.w	d0,-(a7)
	move.w	d1,d0
	bsr.w	Lfe8510
	moveq.l	#$ff,d1
	move.w	(a7)+,d0
	btst.b	#$07,($0001,a0)
	beq.s	Lfe6316
	move.b	#$1a,($0000.w,a5)
	move.b	d0,($0002,a5)
	movea.l	($0004,a0),a1
	movea.l	($0006,a1),a4
	jsr	(a4)
	movea.l	($000a,a1),a4
	jsr	(a4)
	clr.l	d1
	move.b	($0003,a5),d0
	bne.s	Lfe6316
	moveq.l	#$ff,d1
Lfe6316:
	clr.l	d0
	move.b	d1,d0
	lea.l	($001a,a7),a7
	rts

Lfe6320:
	bsr.s	Lfe632c
	tst.l	d1
	beq.s	Lfe632a
	bsr.s	Lfe635e
	move.l	d0,d1
Lfe632a:
	rts

Lfe632c:
	moveq.l	#$05,d0
	bsr.w	Lfe6280
	move.l	d0,d1
	rts

Lfe6336:
	moveq.l	#$03,d0
	bra.s	Lfe6360

Lfe633a:
	moveq.l	#$03,d0
	bra.s	Lfe6344

Lfe633e:
	moveq.l	#$04,d0
	bra.s	Lfe6344

Lfe6342:
	moveq.l	#$01,d0
Lfe6344:
	movem.l	d1-d7/a0-a6,-(a7)
	move.w	d1,-(a7)
	lea.l	($0001,a7),a2
	moveq.l	#$01,d2
	move.w	d0,d1
	bsr.w	Lfe7916
	addq.l	#2,a7
	movem.l	(a7)+,d1-d7/a0-a6
	rts

Lfe635e:
	clr.l	d0
Lfe6360:
	movem.l	d1-d7/a0-a6,-(a7)
	clr.w	-(a7)
	lea.l	($0001,a7),a2
	moveq.l	#$01,d2
	move.w	d0,d1
	bsr.w	Lfe77f4
	move.w	(a7)+,d1
	tst.l	d0
	bmi.s	Lfe637c
	clr.l	d0
	move.w	d1,d0
Lfe637c:
	movem.l	(a7)+,d1-d7/a0-a6
	rts

Lfe6382:
	move.w	($0000d5fe),d0
	bne.s	Lfe63cc
	lea.l	($0000d600),a1
	clr.w	d0
	move.b	($0001,a1),d0
	addq.w	#2,d0
	clr.b	(a1,d0.w)
	clr.w	($0000d5f8)
	move.w	d3,-(a7)
	bsr.w	Lfe5e0a
	move.w	(a7)+,d3
	moveq.l	#$0a,d1
	bsr.w	Lfe6474
	lea.l	($0000d601),a1
	clr.l	d0
	move.b	(a1)+,d0
	move.l	a1,($0000d5fa)
	adda.l	d0,a1
	move.b	#$0d,(a1)+
	move.b	#$0a,(a1)
	addq.w	#2,d0
Lfe63cc:
	subq.l	#1,d0
	move.w	d0,($0000d5fe)
	asl.w	#8,d0
	movea.l	($0000d5fa),a1
	move.b	(a1)+,d0
	move.l	a1,($0000d5fa)
	cmp.b	#$1a,d0
	bne.s	Lfe63f4
	and.w	#$00ff,d0
	clr.w	($0000d5fe)
Lfe63f4:
	rts

Lfe63f6:
	moveq.l	#$07,d0
Lfe63f8:
	movem.l	d1/a1/a4-a5,-(a7)
	move.w	($0000d5f4),d1
	bsr.w	Lfe629e
	movem.l	(a7)+,d1/a1/a4-a5
	rts

Lfe640c:
	bsr.s	Lfe6420
	tst.l	d1
	beq.s	Lfe641e
	move.w	($0000d5f4),d0
	bsr.w	Lfe6360
	move.l	d0,d1
Lfe641e:
	rts

Lfe6420:
	moveq.l	#$05,d0
	bsr.s	Lfe63f8
	move.l	d0,d1
	rts

Lfe6428:
	tst.b	($0000d4fc)
	bne.w	Lfe5bce
	bsr.s	Lfe640c
	tst.l	d1
	beq.s	Lfe6428
	move.l	d1,d0
	rts

Lfe643c:
	bsr.s	Lfe6428
	tst.b	($0000d4fc)
	bne.w	Lfe5bce
	or.w	($0000d5f8),d0
	cmp.w	#$0003,d0
	beq.w	Lfe5bce
	cmp.w	#$0010,d0
	beq.s	Lfe6464
	cmp.w	#$000e,d0
	beq.s	Lfe646c
	rts

Lfe6464:
	not.b	($0000d5f7)
	bra.s	Lfe643c

Lfe646c:
	clr.b	($0000d5f7)
	bra.s	Lfe643c

Lfe6474:
	move.w	#$0002,d0
	bsr.w	Lfe6344
	tst.b	($0000d5f7)
	beq.s	Lfe6488
	bsr.w	Lfe633e
Lfe6488:
	rts

Lfe648a:
	bsr.w	Lfe6344
	tst.b	($0000d5f7)
	beq.s	Lfe649a
	bsr.w	Lfe633e
Lfe649a:
	bra.w	Lfe5cdc

Lfe649e:
	movea.l	($00008a22),a0
	move.l	(a6),d0
	cmp.l	#L000000,d0
	bcs.s	Lfe64b0
	moveq.l	#$ff,d0
Lfe64b0:
	and.l	#Lffffff,d0
	add.l	#$00000010,d0
	move.l	#$00010c78,d3
	clr.l	d7
Lfe64c4:
	movea.l	d3,a1
	move.l	($0008,a1),d1
	move.l	($000c,a1),d2
	beq.s	Lfe6514
	add.l	#$0000000f,d1
	and.l	#$fffffff0,d1
	move.l	d2,d3
	sub.l	d1,d2
	cmp.l	d0,d2
	bcs.s	Lfe650c
	movea.l	d1,a2
	movea.l	d3,a3
	add.l	d0,d1
	move.l	a1,($0000.w,a2)
	move.l	a0,($0004,a2)
	move.l	d1,($0008,a2)
	move.l	a3,($000c,a2)
	move.l	a2,($000c,a1)
	move.l	a2,($0000.w,a3)
	move.l	a2,d0
	add.l	#$00000010,d0
	rts

Lfe650c:
	cmp.l	d2,d7
	bcc.s	Lfe64c4
	move.l	d2,d7
	bra.s	Lfe64c4

Lfe6514:
	move.l	($00001c00).l,d2
	add.l	#$0000000f,d1
	and.l	#$fffffff0,d1
	move.l	d2,d3
	sub.l	d1,d2
	cmp.l	d0,d2
	bcs.s	Lfe6550
	movea.l	d1,a2
	add.l	d0,d1
	move.l	a1,($0000.w,a2)
	move.l	a0,($0004,a2)
	move.l	d1,($0008,a2)
	clr.l	($000c,a2)
	move.l	a2,($000c,a1)
	move.l	a2,d0
	add.l	#$00000010,d0
	rts

Lfe6550:
	cmp.l	d2,d7
	bcc.s	Lfe6556
	move.l	d2,d7
Lfe6556:
	move.l	d7,d0
	sub.l	#$00000010,d0
	bmi.s	Lfe6568
	add.l	#$81000000,d0
	rts

Lfe6568:
	add.l	#$00000010,d0
	add.l	#$82000000,d0
	rts

Lfe6576:
	move.l	(a6),d0
	beq.s	Lfe65b0
	sub.l	#$00000010,d0
	move.l	#$00010c78,d1
Lfe6586:
	movea.l	d1,a0
	cmp.l	d0,d1
	beq.s	Lfe6596
	move.l	($000c,a0),d1
	bne.s	Lfe6586
	moveq.l	#$f7,d0
	rts

Lfe6596:
	movea.l	($0000.w,a0),a1
	move.l	($000c,a0),d0
	move.l	d0,($000c,a1)
	tst.l	d0
	beq.s	Lfe65ac
	movea.l	d0,a2
	move.l	a1,($0000.w,a2)
Lfe65ac:
	clr.l	d0
	rts

Lfe65b0:
	move.l	($00008a22),d0
	bsr.w	Lfe6da8
	clr.l	d0
	rts

Lfe65be:
	move.l	(a6)+,d1
	move.l	(a6),d0
	cmp.l	#L000000,d0
	bcs.s	Lfe65cc
	moveq.l	#$ff,d0
Lfe65cc:
	and.l	#Lffffff,d0
	add.l	#$00000010,d0
	sub.l	#$00000010,d1
	move.l	#$00010c78,d2
Lfe65e4:
	movea.l	d2,a0
	cmp.l	d1,d2
	beq.s	Lfe65f4
	move.l	($000c,a0),d2
	bne.s	Lfe65e4
	moveq.l	#$f7,d0
	rts

Lfe65f4:
	move.l	($000c,a0),d2
	bne.s	Lfe6600
	move.l	($00001c00).l,d2
Lfe6600:
	sub.l	a0,d2
	cmp.l	d0,d2
	bcs.w	Lfe6550
	add.l	a0,d0
	move.l	d0,($0008,a0)
	clr.l	d0
	rts

Lfe6612:
	movea.l	(a6),a0
	suba.l	#$00000010,a0
Lfe661a:
	clr.l	d3
	clr.l	d6
	suba.l	a3,a3
	suba.l	a2,a2
Lfe6622:
	add.l	a0,d3
	add.l	#$00000100,d3
	move.l	d3,($0030,a0)
	move.l	d3,($0034,a0)
	add.l	d6,d3
	move.l	d3,($0038,a0)
	cmpa.l	#$00000000,a3
	bne.s	Lfe664a
	movea.l	($00008a22),a5
	movea.l	($0010,a5),a3
Lfe664a:
	move.l	a3,($0010,a0)
	move.l	a2,($0020,a0)
	lea.l	($0000d72c),a5
	lea.l	($0024,a0),a6
	move.l	(a5)+,(a6)+
	move.l	(a5)+,(a6)+
	move.l	(a5)+,(a6)+
	movea.l	($0000d4e4),a5
	move.l	($003a,a5),($00001bc0).l
	lea.l	($003e,a5),a6
	move.l	a6,($0040,a0)
	move.l	usp,a6
	move.l	a6,($003c,a0)
	move.w	($0038,a5),($0044,a0)
	clr.l	($0060,a0)
	bsr.w	Lfe8346
	move.l	a0,($00008a22)
	clr.l	d0
	rts

Lfe6696:
	move.w	(a6)+,d1
	movea.l	(a6)+,a1
	cmp.w	#$0004,d1
	beq.w	Lfe694c
	movea.l	(a6)+,a2
	movea.l	(a6),a3
	tst.w	d1
	beq.w	Lfe6802
	cmp.w	#$0001,d1
	beq.w	Lfe6802
	cmp.w	#$0002,d1
	beq.s	Lfe66c4
	cmp.w	#$0003,d1
	beq.s	Lfe6718
	moveq.l	#$f2,d0
	rts

Lfe66c4:
	link.w	a6,#-$01ae
	cmpa.l	#$00000000,a3
	bne.s	Lfe66da
	movea.l	($00008a22),a3
	movea.l	($0010,a3),a3
Lfe66da:
	cmpa.l	#$ffffffff,a3
	bne.s	Lfe66e8
	lea.l	($0000d710),a3
Lfe66e8:
	move.l	a3,(-$0004,a6)
	movea.l	a2,a5
	move.l	a1,-(a7)
	lea.l	(-$0176,a6),a0
	bsr.w	Lfe7080
	bsr.w	Lfe6dea
	beq.s	Lfe6710
	bsr.w	Lfe6f28
	beq.s	Lfe6710
	movea.l	a0,a1
	movea.l	(a7),a0
	bsr.w	Lfe7080
	clr.l	d0
	bra.s	Lfe6712

Lfe6710:
	moveq.l	#$fe,d0
Lfe6712:
	movea.l	(a7)+,a1
	unlk	a6
	rts

Lfe6718:
	bsr.w	Lfe6b42
	cmp.b	#$78,d0			;'x'
	beq.s	Lfe678e
	cmp.b	#$72,d0			;'r'
	beq.s	Lfe6768
	cmp.b	#$7a,d0			;'z'
	beq.s	Lfe673e
	move.l	a1,d0
	rol.l	#8,d0
	tst.b	d0
	beq.s	Lfe6764
	subq.b	#1,d0
	beq.s	Lfe6768
	subq.b	#1,d0
	bne.s	Lfe678e
Lfe673e:
	bsr.w	Lfe6c4c
	tst.l	d0
	bmi.s	Lfe6762
	cmpa.l	a2,a4
	bne.s	Lfe675c
	move.l	a2,d0
	add.l	d3,d0
	add.l	d6,d0
	cmpa.l	d0,a3
	bcs.s	Lfe675c
	bsr.w	Lfe6ca0
	bra.w	Lfe67f4

Lfe675c:
	bsr.w	Lfe6c98
	moveq.l	#$f8,d0
Lfe6762:
	rts

Lfe6764:
	moveq.l	#$f3,d0
	rts

Lfe6768:
	bsr.w	Lfe6cbe
	bmi.s	Lfe6762
	bsr.w	Lfe6cce
	bmi.w	Lfe6c98
	move.l	d0,d3
	add.l	a2,d0
	cmpa.l	d0,a3
	bcs.s	Lfe675c
	move.l	d3,-(a7)
	move.l	a2,-(a7)
	move.w	d2,-(a7)
	DOS	_READ
	lea.l	($000a,a7),a7
	bra.w	Lfe6c98

Lfe678e:
	bsr.w	Lfe6cbe
	bmi.s	Lfe6762
	lea.l	(-$0040,a7),a7
	movea.l	a7,a5
	move.l	#$00000040,-(a7)
	move.l	a5,-(a7)
	move.w	d2,-(a7)
	DOS	_READ
	addq.l	#6,a7
	cmp.l	(a7)+,d0
	bne.w	Lfe6b22
	cmpi.w	#$4855,(a5)		;'HU'
	bne.w	Lfe6b20
	move.l	($000c,a5),d3
	add.l	($0010,a5),d3
	move.l	($0014,a5),d6
	move.l	a2,d0
	add.l	d3,d0
	add.l	d6,d0
	cmpa.l	d0,a3
	bcs.w	Lfe6b1c
	move.l	d3,-(a7)
	move.l	a2,-(a7)
	move.w	d2,-(a7)
	DOS	_READ
	addq.l	#6,a7
	cmp.l	(a7)+,d0
	bne.w	Lfe6b22
	movea.l	a2,a4
	bsr.w	Lfe6a86
	bmi.w	Lfe6b22
	bsr.w	Lfe6cee
	move.l	d3,d0
	add.l	d6,d0
	lea.l	($0040,a7),a7
Lfe67f4:
	move.l	d0,-(a7)
	lea.l	(-$0100,a2),a0
	bsr.w	Lfe6a66
	move.l	(a7)+,d0
	rts

Lfe6802:
	move.b	#-$01,($0000d725)
	bsr.s	Lfe6814
	clr.b	($0000d725)
	rts

Lfe6814:
	move.l	a1,($0000d70c)
	bsr.w	Lfe6b42
	cmp.b	#$78,d0			;'x'
	beq.w	Lfe69e6
	cmp.b	#$72,d0			;'r'
	beq.w	Lfe69a4
	cmp.b	#$7a,d0			;'z'
	beq.s	Lfe684a
	move.l	a1,d0
	rol.l	#8,d0
	tst.b	d0
	beq.w	Lfe6764
	subq.b	#1,d0
	beq.w	Lfe69a4
	subq.b	#1,d0
	bne.w	Lfe69e6
Lfe684a:
	bsr.w	Lfe6c4c
	tst.l	d0
	bmi.w	Lfe6762
	movea.l	a4,a0
	suba.l	#$00000100,a0
	bsr.w	Lfe6cf6
	tst.l	d0
	bne.w	Lfe6c98
	move.b	#-$02,($0000d725)
	move.l	a0,($0000d704)
	bsr.w	Lfe6ca0
	tst.l	d0
	bmi.w	Lfe698e
Lfe687e:
	bsr.w	Lfe6a66
	move.b	#-$03,($0000d725)
	bsr.w	Lfe6622
	clr.b	($0000d725)
	movem.l	d1/a0-a5,-(a7)
	movea.l	($0000d70c),a1
	lea.l	(-$005a,a7),a7
	movea.l	a7,a2
	bsr.w	Lfe930a
	lea.l	($0080,a0),a1
	move.b	($0001,a2),d0
	add.b	#$41,d0			;'A'
	move.b	d0,(a1)+
	move.b	#$3a,(a1)+		;':'
	lea.l	($0002,a2),a3
Lfe68be:
	move.b	(a3)+,(a1)+
	bne.s	Lfe68be
	lea.l	($00c4,a0),a1
	move.w	#$0007,d1
	lea.l	($0043,a2),a3
Lfe68ce:
	move.b	(a3)+,d0
	cmp.b	#$20,d0			;' '
	beq.s	Lfe68f4
	move.b	d0,(a1)+
	dbra.w	d1,Lfe68ce
	move.w	#$0009,d1
	lea.l	($004e,a2),a3
Lfe68e4:
	move.b	(a3)+,d0
	beq.s	Lfe68f4
	cmp.b	#$20,d0			;' '
	beq.s	Lfe68f4
	move.b	d0,(a1)+
	dbra.w	d1,Lfe68e4
Lfe68f4:
	move.b	#$2e,(a1)+		;'.'
	move.w	#$0002,d1
	lea.l	($004b,a2),a3
Lfe6900:
	move.b	(a3)+,d0
	cmp.b	#$20,d0			;' '
	beq.s	Lfe690e
	move.b	d0,(a1)+
	dbra.w	d1,Lfe6900
Lfe690e:
	clr.b	(a1)
	lea.l	($0080,a0),a1
	bsr.w	Lfe778c
	lea.l	($005a,a7),a7
	movem.l	(a7)+,d1/a0-a5
Lfe6920:
	move.l	a0,($001c,a5)
	move.l	a1,($0020,a5)
	move.l	a2,($0024,a5)
	move.l	a3,($0028,a5)
	move.l	a4,($002c,a5)
	move.l	a4,d0
	tst.w	d1
	bne.w	Lfe6762
	bsr.w	Lfea6c2
	andi.w	#$dfff,($0038,a5)
	move.l	a4,($003a,a5)
	rts

Lfe694c:
	movea.l	a1,a4
	movea.l	($00008a22),a0
	movea.l	($0038,a0),a1
	movea.l	($0020,a0),a2
	movea.l	($0010,a0),a3
	movea.l	($0000d4e4),a5
	move.l	($003a,a5),($00001bc0).l
	lea.l	($003e,a5),a6
	move.l	a6,($0040,a0)
	move.l	usp,a6
	move.l	a6,($003c,a0)
	move.w	($0038,a5),($0044,a0)
	bsr.w	Lfe8346
	clr.l	d1
	bra.s	Lfe6920

Lfe698a:
	bsr.w	Lfe6c98
Lfe698e:
	move.l	d0,-(a7)
	lea.l	($0010,a0),a0
	move.l	a0,-(a7)
	DOS	_MFREE
	addq.l	#4,a7
	move.l	(a7)+,d0
	clr.b	($0000d725)
	rts

Lfe69a4:
	bsr.w	Lfe6cbe
	bmi.w	Lfe6762
	bsr.w	Lfe6cce
	bmi.w	Lfe6c98
	move.l	d0,d3
	bsr.w	Lfe6b78
	bmi.w	Lfe6c98
	move.b	#-$02,($0000d725)
	move.l	a0,($0000d704)
	move.l	d3,-(a7)
	move.l	a4,-(a7)
	move.w	d2,-(a7)
	DOS	_READ
	lea.l	($000a,a7),a7
	tst.l	d0
	bmi.s	Lfe698a
	bsr.w	Lfe6cee
	clr.l	d6
	bra.w	Lfe687e

Lfe69e6:
	bsr.w	Lfe6cbe
	bmi.w	Lfe6762
	lea.l	(-$0040,a7),a7
	movea.l	a7,a5
	move.l	#$00000040,-(a7)
	move.l	a5,-(a7)
	move.w	d2,-(a7)
	DOS	_READ
	addq.l	#6,a7
	cmp.l	(a7)+,d0
	bne.w	Lfe6b22
	cmpi.w	#$4855,(a5)		;'HU'
	bne.w	Lfe6b20
	move.l	($000c,a5),d3
	add.l	($0010,a5),d3
	move.l	($0014,a5),d6
	move.l	d3,d0
	add.l	d6,d0
	bsr.w	Lfe6b78
	bmi.w	Lfe6b22
	move.b	#-$02,($0000d725)
	move.l	a0,($0000d704)
	move.l	d3,-(a7)
	move.l	a4,-(a7)
	move.w	d2,-(a7)
	DOS	_READ
	addq.l	#6,a7
	cmp.l	(a7)+,d0
	bne.w	Lfe6b32
	bsr.s	Lfe6a86
	bmi.w	Lfe6b32
	movea.l	($0008,a5),a4
	suba.l	($0004,a5),a4
	adda.l	a0,a4
	lea.l	($0100,a4),a4
	lea.l	($0040,a7),a7
	bsr.w	Lfe6cee
	bra.w	Lfe687e

Lfe6a66:
	lea.l	($0100,a0),a1
	adda.l	d3,a1
	tst.l	d6
	beq.s	Lfe6a84
	move.l	d6,d0
	subq.l	#1,d0
	swap.w	d0
Lfe6a76:
	swap.w	d0
Lfe6a78:
	clr.b	(a1)+
	dbra.w	d0,Lfe6a78
	swap.w	d0
	dbra.w	d0,Lfe6a76
Lfe6a84:
	rts

Lfe6a86:
	movem.l	d1/a0,-(a7)
	lea.l	(-$0104,a7),a7
	movea.l	a7,a0
	clr.w	(a0)
	move.l	a4,d7
	sub.l	($0004,a5),d7
	beq.s	Lfe6ac0
	move.l	($0018,a5),d5
Lfe6a9e:
	tst.w	d5
	beq.s	Lfe6ac0
	bsr.s	Lfe6ade
	bmi.s	Lfe6ac2
	cmp.w	#$0001,d0
	bne.s	Lfe6ab0
	bsr.s	Lfe6ace
	bmi.s	Lfe6ac2
Lfe6ab0:
	bclr.l	#$00,d0
	adda.l	d0,a4
	bne.s	Lfe6abc
	add.l	d7,(a4)
	bra.s	Lfe6a9e

Lfe6abc:
	add.w	d7,(a4)
	bra.s	Lfe6a9e

Lfe6ac0:
	clr.l	d0
Lfe6ac2:
	lea.l	($0104,a7),a7
	movem.l	(a7)+,d1/a0
	tst.l	d0
	rts

Lfe6ace:
	bsr.s	Lfe6ade
	bmi.s	Lfe6adc
	move.l	d0,d1
	bsr.s	Lfe6ade
	bmi.s	Lfe6adc
	swap.w	d1
	or.l	d1,d0
Lfe6adc:
	rts

Lfe6ade:
	clr.l	d0
	tst.l	d5
	beq.s	Lfe6b12
	move.w	(a0)+,d0
	bne.s	Lfe6b08
	move.l	#$00000100,-(a7)
	move.l	a0,-(a7)
	move.w	d2,-(a7)
	DOS	_READ
	lea.l	($000a,a7),a7
	tst.l	d0
	beq.s	Lfe6b16
	bmi.s	Lfe6b18
	clr.w	(a0,d0.w)
	clr.w	(-$0002,a0)
	clr.w	d0
Lfe6b08:
	move.w	(a0,d0.w),d0
	addq.b	#2,-(a0)
	subq.l	#1,a0
	subq.w	#2,d5
Lfe6b12:
	tst.l	d0
	rts

Lfe6b16:
	moveq.l	#$f5,d0
Lfe6b18:
	subq.l	#2,a0
	rts

Lfe6b1c:
	moveq.l	#$f8,d0
	bra.s	Lfe6b22

Lfe6b20:
	moveq.l	#$f5,d0
Lfe6b22:
	lea.l	($0040,a7),a7
	tst.l	d0
	bmi.w	Lfe6c98
	moveq.l	#$f5,d0
	bra.w	Lfe6c98

Lfe6b32:
	lea.l	($0040,a7),a7
	tst.l	d0
	bmi.w	Lfe698a
	moveq.l	#$f5,d0
	bra.w	Lfe698a

Lfe6b42:
	movem.l	d1/a1,-(a7)
	clr.w	d1
Lfe6b48:
	addq.w	#1,d1
	move.b	(a1)+,d0
	bne.s	Lfe6b48
	subq.l	#1,a1
Lfe6b50:
	subq.w	#1,d1
	beq.s	Lfe6b70
	move.b	-(a1),d0
	cmp.b	#$20,d0			;' '
	beq.s	Lfe6b50
	subq.l	#1,d1
	beq.s	Lfe6b70
	cmpi.b	#$2e,-(a1)		;'.'
	bne.s	Lfe6b70
	or.b	#$20,d0
	movem.l	(a7)+,d1/a1
	rts

Lfe6b70:
	movem.l	(a7)+,d1/a1
	clr.l	d0
	rts

Lfe6b78:
	movem.l	d1-d2,-(a7)
	move.l	d0,d1
	move.l	#$ffffffff,-(a7)
	DOS	_MALLOC
	addq.l	#4,a7
	tst.l	d0
	bpl.s	Lfe6b9e
	move.l	d0,d2
	and.l	#Lffffff,d2
	cmp.l	d1,d2
	bcs.s	Lfe6baa
	move.l	d2,-(a7)
	DOS	_MALLOC
	addq.l	#4,a7
Lfe6b9e:
	movea.l	d0,a0
	lea.l	(-$0010,a0),a0
	movea.l	a0,a4
	lea.l	($0100,a4),a4
Lfe6baa:
	movem.l	(a7)+,d1-d2
	tst.l	d0
	rts

Lfe6bb2:
	movea.l	($00008a22),a0
	bsr.w	Lfe6d7e
	movea.l	($0040,a0),a7
	movea.l	($003c,a0),a5
	move.l	a5,usp
	move.l	($0014,a0),-(a7)
	move.w	($0044,a0),-(a7)
	lea.l	($0024,a0),a0
	move.l	d0,-(a7)
	bsr.w	Lfe7316
	movea.l	($00008a22),a0
	bsr.w	Lfe837c
	bsr.w	Lfea6c2
	move.l	(a7)+,d0
	clr.w	($0000d4e2)
	rte

Lfe6bf0:
	movea.l	($00008a22),a0
	move.l	($0004,a0),($00008a22)
	ori.l	#$ff000000,($0004,a0)
	add.l	a0,d1
	add.l	#$00000100,d1
	cmp.l	($0008,a0),d1
	bcc.s	Lfe6c18
	move.l	d1,($0008,a0)
Lfe6c18:
	movea.l	($0040,a0),a7
	movea.l	($003c,a0),a5
	move.l	a5,usp
	move.l	($0014,a0),-(a7)
	move.w	($0044,a0),-(a7)
	lea.l	($0024,a0),a0
	move.l	d0,-(a7)
	bsr.w	Lfe7316
	movea.l	($00008a22),a0
	bsr.w	Lfe83ae
	bsr.w	Lfea6c2
	move.l	(a7)+,d0
	clr.w	($0000d4e2)
	rte

Lfe6c4c:
	bsr.s	Lfe6cbe
	bmi.s	Lfe6c9e
	link.w	a5,#-$001e
	movea.l	a7,a6
	move.l	#$0000001c,-(a7)
	move.l	a6,-(a7)
	move.w	d2,-(a7)
	DOS	_READ
	adda.l	#$0000000a,a7
	move.w	(a6),d4
	move.l	($0002,a6),d3
	add.l	($0006,a6),d3
	move.l	($000a,a6),d6
	movea.l	($0016,a6),a4
	move.w	($001a,a6),d5
	unlk	a5
	tst.l	d0
	bmi.s	Lfe6c98
	cmpi.w	#$001c,d0
	bne.s	Lfe6c96
	cmpi.w	#$601a,d4
	bne.s	Lfe6c96
	clr.l	d0
	tst.w	d5
	bne.s	Lfe6c9e
Lfe6c96:
	moveq.l	#$f5,d0
Lfe6c98:
	move.l	d0,-(a7)
	bsr.s	Lfe6cee
	move.l	(a7)+,d0
Lfe6c9e:
	rts

Lfe6ca0:
	move.l	d3,-(a7)
	move.l	a4,-(a7)
	move.w	d2,-(a7)
	DOS	_READ
	adda.l	#$0000000a,a7
	tst.l	d0
	bmi.s	Lfe6c98
	cmp.l	d0,d3
	bne.s	Lfe6c96
	bsr.s	Lfe6cee
	move.l	d3,d0
	add.l	d6,d0
	rts

Lfe6cbe:
	move.w	#$0000,-(a7)
	move.l	a1,-(a7)
	DOS	_OPEN
	addq.l	#6,a7
	move.l	d0,d2
	tst.l	d0
	rts

Lfe6cce:
	move.w	#$0002,-(a7)
	clr.l	-(a7)
	move.w	d2,-(a7)
	DOS	_SEEK
	lea.l	($0008,a7),a7
	move.l	d0,-(a7)
	clr.w	-(a7)
	clr.l	-(a7)
	move.w	d2,-(a7)
	DOS	_SEEK
	lea.l	($0008,a7),a7
	move.l	(a7)+,d0
	rts

Lfe6cee:
	move.w	d2,-(a7)
	DOS	_CLOSE
	addq.l	#2,a7
	rts

Lfe6cf6:
	movem.l	d1-d7/a0-a5,-(a7)
	move.l	a4,d0
	move.l	d3,d1
	add.l	d6,d1
	bsr.s	Lfe6d30
	tst.l	d0
	bne.s	Lfe6d2a
	move.l	a1,($0000.w,a0)
	movea.l	($00008a22),a5
	move.l	a5,($0004,a0)
	move.l	d5,($0008,a0)
	move.l	d3,($000c,a0)
	move.l	a0,($000c,a1)
	tst.l	d3
	beq.s	Lfe6d2a
	movea.l	d3,a5
	move.l	a0,($0000.w,a5)
Lfe6d2a:
	movem.l	(a7)+,d1-d7/a0-a5
	rts

Lfe6d30:
	add.l	#$00000100,d1
	sub.l	#$00000100,d0
	add.l	d0,d1
	move.l	#$00010c78,d3
Lfe6d44:
	movea.l	d3,a1
	move.l	($0008,a1),d4
	move.l	($000c,a1),d5
	beq.s	Lfe6d66
	move.l	d5,d3
	cmp.l	a1,d1
	bcs.s	Lfe6d44
	cmp.l	d4,d0
	bcs.s	Lfe6d7a
	cmp.l	d0,d5
	bcs.s	Lfe6d44
	cmp.l	d1,d5
	bcs.s	Lfe6d7a
	clr.l	d0
	rts

Lfe6d66:
	move.l	($00001c00).l,d5
	cmp.l	d4,d0
	bcs.s	Lfe6d7a
	cmp.l	d1,d5
	bcs.s	Lfe6d7a
	clr.l	d0
	clr.l	d3
	rts

Lfe6d7a:
	moveq.l	#$f8,d0
	rts

Lfe6d7e:
	movem.l	d0-d1/a0-a2,-(a7)
	movea.l	($0000.w,a0),a1
	move.l	($000c,a0),d0
	move.l	d0,($000c,a1)
	beq.s	Lfe6d96
	movea.l	d0,a2
	move.l	a1,($0000.w,a2)
Lfe6d96:
	move.l	($0004,a0),($00008a22)
	move.l	a0,d0
	bsr.s	Lfe6da8
	movem.l	(a7)+,d0-d1/a0-a2
	rts

Lfe6da8:
	move.l	#$00010c78,d1
Lfe6dae:
	movea.l	d1,a0
	move.l	($000c,a0),d1
	beq.s	Lfe6dce
	cmp.l	($0004,a0),d0
	bne.s	Lfe6dae
	movea.l	($0000.w,a0),a1
	move.l	d1,($000c,a1)
	movea.l	d1,a2
	move.l	a1,($0000.w,a2)
	bsr.s	Lfe6ddc
	bra.s	Lfe6da8

Lfe6dce:
	cmp.l	($0004,a0),d0
	bne.s	Lfe6de8
	movea.l	($0000.w,a0),a1
	move.l	d1,($000c,a1)
Lfe6ddc:
	movem.l	d0-d1,-(a7)
	move.l	a0,d0
	bsr.s	Lfe6da8
	movem.l	(a7)+,d0-d1
Lfe6de8:
	rts

Lfe6dea:
	lea.l	(-$0176,a6),a0
	bsr.w	Lfe70e8
	adda.l	d0,a0
	movea.l	a5,a1
	clr.w	d1
Lfe6df8:
	move.b	(a0),d0
	beq.s	Lfe6e34
	cmp.b	#$3f,d0			;'?'
	beq.w	Lfe6f24
	cmp.b	#$2a,d0			;'*'
	beq.w	Lfe6f24
	cmp.b	#$2f,d0			;'/'
	beq.s	Lfe6e34
	cmp.b	#$2d,d0			;'-'
	beq.s	Lfe6e34
	cmp.b	#$22,d0			;'"'
	beq.s	Lfe6e34
	cmp.b	#$27,d0			;'''
	beq.s	Lfe6e34
	bsr.w	Lfe70e8
	tst.l	d0
	bne.s	Lfe6e32
	move.b	(a0)+,(a1)+
	addq.w	#1,d1
	bra.s	Lfe6df8

Lfe6e32:
	adda.l	d0,a0
Lfe6e34:
	tst.w	d1
	beq.w	Lfe6f24
	clr.b	(a1)
	movea.l	a5,a2
	move.l	a2,-(a7)
	clr.b	d2
	clr.b	d3
Lfe6e44:
	cmp.b	d1,d2
	beq.s	Lfe6e7c
	move.b	(a2)+,d0
	tst.b	d3
	beq.s	Lfe6e52
	clr.b	d3
	bra.s	Lfe6e78

Lfe6e52:
	cmp.b	#$80,d0
	bcs.s	Lfe6e6a
	cmp.b	#$a0,d0
	bcs.s	Lfe6e64
	cmp.b	#$e0,d0
	bcs.s	Lfe6e6a
Lfe6e64:
	move.b	#$01,d3
	bra.s	Lfe6e78

Lfe6e6a:
	cmpi.b	#$3a,d0			;':'
	beq.s	Lfe6e76
	cmpi.b	#$5c,d0			;'\'
	bne.s	Lfe6e78
Lfe6e76:
	move.l	a2,(a7)
Lfe6e78:
	addq.b	#1,d2
	bra.s	Lfe6e44

Lfe6e7c:
	movea.l	(a7)+,a2
	cmpa.l	a1,a2
	beq.w	Lfe6f24
	move.l	a1,d0
	sub.l	a2,d0
	cmpi.w	#$0016,d0
	bhi.w	Lfe6f24
	lea.l	(-$0076,a6),a3
	movea.l	a2,a4
	subq.w	#1,d0
Lfe6e98:
	move.b	(a4)+,(a3)+
	dbra.w	d0,Lfe6e98
	clr.b	(a3)
	lea.l	(-$005e,a6),a3
	movea.l	a5,a4
	move.l	a2,d0
	sub.l	a4,d0
	clr.b	(-$0005,a6)
	cmp.l	#$00000040,d0
	bhi.s	Lfe6f24
	tst.l	d0
	beq.s	Lfe6eea
	move.b	#$01,(-$0005,a6)
	cmp.l	#$00000002,d0
	bcs.s	Lfe6eea
	cmpi.b	#$3a,($0001,a4)		;':'
	bne.s	Lfe6eea
	move.l	d0,d1
	move.b	(a4),d0
	or.b	#$20,d0
	sub.b	#$61,d0			;'a'
	bsr.w	Lfe719a
	tst.l	d0
	bmi.s	Lfe6f24
	move.l	d1,d0
	bra.s	Lfe6eea

Lfe6ee8:
	move.b	(a4)+,(a3)+
Lfe6eea:
	dbra.w	d0,Lfe6ee8
	clr.b	(a3)
	lea.l	(-$0076,a6),a1
	move.b	#-$01,(-$0006,a6)
Lfe6efa:
	move.b	(a1)+,d0
	cmpi.b	#$2e,d0			;'.'
	beq.s	Lfe6f0a
	tst.b	d0
	bne.s	Lfe6efa
	addq.b	#1,(-$0006,a6)
Lfe6f0a:
	clr.b	d1
	lea.l	($0001,a5),a1
Lfe6f10:
	move.b	(a0)+,(a1)+
	beq.s	Lfe6f1c
	addq.b	#1,d1
	tst.b	d1
	beq.s	Lfe6f24
	bra.s	Lfe6f10

Lfe6f1c:
	move.b	d1,(a5)
	move.w	#$ffff,d0
	rts

Lfe6f24:
	clr.w	d0
	rts

Lfe6f28:
	tst.b	(-$0005,a6)
	beq.s	Lfe6f42
	lea.l	(-$0076,a6),a1
	lea.l	(-$005e,a6),a0
	bsr.w	Lfe708e
	lea.l	($0000d71a),a3
	bra.s	Lfe6f76

Lfe6f42:
	movea.l	(-$0004,a6),a1
	lea.l	($0000d714),a0
	bsr.w	Lfe7160
	bne.s	Lfe6f58
	lea.l	($0000d71a),a3
Lfe6f58:
	movea.l	a0,a3
	lea.l	(-$0076,a6),a1
	lea.l	(-$005e,a6),a0
	bsr.w	Lfe7080
	bra.s	Lfe6f76

Lfe6f68:
	tst.b	(a3)
	bne.s	Lfe6f74
	tst.b	(-$005e,a6)
	bne.s	Lfe6fdc
	bra.s	Lfe6f76

Lfe6f74:
	bsr.s	Lfe6fe0
Lfe6f76:
	tst.b	(-$0006,a6)
	bne.s	Lfe6f94
	clr.b	d2
	lea.l	(-$005e,a6),a0
	bsr.w	Lfe706e
	movea.l	a0,a2
	adda.l	d0,a2
	lea.l	($0000d722),a1
	bsr.w	Lfe708e
Lfe6f94:
	lea.l	(-$005e,a6),a0
	lea.l	(-$01ae,a6),a1
	bsr.w	Lfe7148
	tst.l	d0
	bmi.s	Lfe6f68
	tst.b	(-$0006,a6)
	bne.s	Lfe6fce
Lfe6faa:
	lea.l	(-$0190,a6),a0
	bsr.w	Lfe703a
	lea.l	(-$01ae,a6),a1
	bsr.w	Lfe7158
	tst.l	d0
	bpl.s	Lfe6faa
	tst.b	d2
	beq.s	Lfe6f68
	movea.l	a4,a1
	movea.l	a2,a0
	move.b	#$2e,(a0)+		;'.'
	bsr.w	Lfe7080
Lfe6fce:
	lea.l	(-$005e,a6),a0
	movea.l	a5,a1
	move.b	#-$01,d0
	tst.b	d0
	rts

Lfe6fdc:
	clr.b	d0
	rts

Lfe6fe0:
	lea.l	(-$005e,a6),a0
	clr.b	d3
Lfe6fe6:
	move.b	(a3)+,d0
	beq.s	Lfe701c
	cmp.b	#$3b,d0			;';'
	beq.s	Lfe701e
	move.b	d0,(a0)+
	tst.b	d3
	beq.s	Lfe7004
	cmp.b	#$02,d3
	beq.s	Lfe7002
	move.b	#$02,d3
	bra.s	Lfe6fe6

Lfe7002:
	clr.b	d3
Lfe7004:
	cmp.b	#$80,d0
	bcs.s	Lfe6fe6
	cmp.b	#$a0,d0
	bcs.s	Lfe7016
	cmp.b	#$e0,d0
	bcs.s	Lfe6fe6
Lfe7016:
	move.b	#$01,d3
	bra.s	Lfe6fe6

Lfe701c:
	subq.l	#1,a3
Lfe701e:
	move.b	(-$0001,a0),d0
	cmp.b	#$02,d3
	beq.s	Lfe702e
	cmp.b	#$5c,d0			;'\'
	beq.s	Lfe7032
Lfe702e:
	move.b	#$5c,(a0)+		;'\'
Lfe7032:
	lea.l	(-$0076,a6),a1
	bsr.s	Lfe7080
	rts

Lfe703a:
	bsr.w	Lfe7102
	move.b	(a0)+,d0
	beq.s	Lfe706c
	cmp.b	#$2e,d0			;'.'
	bne.s	Lfe703a
	move.b	#$04,d1
	lea.l	($0000d71b),a1
Lfe7052:
	bsr.s	Lfe70a2
	tst.l	d0
	beq.s	Lfe7064
Lfe7058:
	tst.b	(a1)+
	bne.s	Lfe7058
	subq.b	#1,d1
	beq.s	Lfe7064
	tst.b	(a1)
	bne.s	Lfe7052
Lfe7064:
	cmp.b	d2,d1
	bcs.s	Lfe706c
	movea.l	a1,a4
	move.b	d1,d2
Lfe706c:
	rts

Lfe706e:
	move.l	a0,-(a7)
	moveq.l	#$ff,d0
Lfe7072:
	addi.l	#$00000001,d0
	tst.b	(a0)+
	bne.s	Lfe7072
	movea.l	(a7)+,a0
	rts

Lfe7080:
	movem.l	a0-a1,-(a7)
Lfe7084:
	move.b	(a1)+,(a0)+
	bne.s	Lfe7084
	movem.l	(a7)+,a0-a1
	rts

Lfe708e:
	movem.l	a0-a1,-(a7)
Lfe7092:
	tst.b	(a0)+
	bne.s	Lfe7092
	subq.l	#1,a0
Lfe7098:
	move.b	(a1)+,(a0)+
	bne.s	Lfe7098
	movem.l	(a7)+,a0-a1
	rts

Lfe70a2:
	movem.l	a0-a1,-(a7)
Lfe70a6:
	move.b	(a0)+,d0
	beq.s	Lfe70b8
	cmp.b	(a1)+,d0
	beq.s	Lfe70a6
	bcs.s	Lfe70b4
	moveq.l	#$01,d0
	bra.s	Lfe70be

Lfe70b4:
	moveq.l	#$ff,d0
	bra.s	Lfe70be

Lfe70b8:
	tst.b	(a1)
	bne.s	Lfe70b4
	clr.l	d0
Lfe70be:
	tst.l	d0
	movem.l	(a7)+,a0-a1
	rts

Lfe70c6:
	movem.l	a0-a1,-(a7)
	bra.s	Lfe70d0

Lfe70cc:
	cmpm.b	(a0)+,(a1)+
	bne.s	Lfe70d8
Lfe70d0:
	dbra.w	d0,Lfe70cc
	clr.l	d0
	bra.s	Lfe70e0

Lfe70d8:
	bcs.s	Lfe70de
	moveq.l	#$01,d0
	bra.s	Lfe70e0

Lfe70de:
	moveq.l	#$ff,d0
Lfe70e0:
	tst.l	d0
	movem.l	(a7)+,a0-a1
	rts

Lfe70e8:
	move.l	a0,-(a7)
Lfe70ea:
	move.b	(a0)+,d0
	cmpi.b	#$20,d0			;' '
	beq.s	Lfe70ea
	cmpi.b	#$09,d0
	beq.s	Lfe70ea
	move.l	a0,d0
	movea.l	(a7)+,a0
	sub.l	a0,d0
	subq.l	#1,d0
	rts

Lfe7102:
	movem.l	d0-d1/a0,-(a7)
	clr.b	d1
Lfe7108:
	move.b	(a0),d0
	beq.s	Lfe7142
	tst.b	d1
	beq.s	Lfe7114
	clr.b	d1
	bra.s	Lfe712a

Lfe7114:
	cmp.b	#$80,d0
	bcs.s	Lfe712e
	cmp.b	#$a0,d0
	bcs.s	Lfe7126
	cmp.b	#$e0,d0
	bcs.s	Lfe712e
Lfe7126:
	move.b	#$01,d1
Lfe712a:
	addq.l	#1,a0
	bra.s	Lfe7108

Lfe712e:
	cmpi.b	#$41,d0			;'A'
	bcs.s	Lfe713e
	cmpi.b	#$5a,d0			;'Z'
	bhi.s	Lfe713e
	add.b	#$20,d0			;' '
Lfe713e:
	move.b	d0,(a0)+
	bra.s	Lfe7108

Lfe7142:
	movem.l	(a7)+,d0-d1/a0
	rts

Lfe7148:
	move.w	#$0020,-(a7)		;' '
	move.l	a0,-(a7)
	move.l	a1,-(a7)
	DOS	_FILES
	lea.l	($000a,a7),a7
	rts

Lfe7158:
	move.l	a1,-(a7)
	DOS	_NFILES
	addq.l	#4,a7
	rts

Lfe7160:
	movem.l	a1,-(a7)
	addq.l	#4,a1
	bsr.w	Lfe706e
Lfe716a:
	tst.b	(a1)
	beq.s	Lfe7184
	movem.l	d0,-(a7)
	bsr.w	Lfe70c6
	beq.s	Lfe7188
	movem.l	(a7)+,d0
	addq.l	#1,a1
Lfe717e:
	tst.b	(a1)+
	bne.s	Lfe717e
	bra.s	Lfe716a

Lfe7184:
	clr.b	d0
	bra.s	Lfe7194

Lfe7188:
	movem.l	(a7)+,d0
	adda.l	d0,a1
	movea.l	a1,a0
	move.b	#-$01,d0
Lfe7194:
	movem.l	(a7)+,a1
	rts

Lfe719a:
	movem.l	d1,-(a7)
	and.l	#$000000ff,d0
	move.l	d0,d1
	DOS	_CURDRV
	move.w	d0,-(a7)
	move.w	d1,-(a7)
	DOS	_CHGDRV
	addq.l	#2,a7
	cmp.w	d1,d0
	bhi.s	Lfe71b8
	moveq.l	#$ff,d0
	bra.s	Lfe71bc

Lfe71b8:
	DOS	_CHGDRV
	clr.l	d0
Lfe71bc:
	addq.l	#2,a7
	movem.l	(a7)+,d1
	rts

Lfe71c4:
	clr.l	d0
	bra.s	Lfe71cc

Lfe71c8:
	clr.l	d0
	move.w	(a6),d0
Lfe71cc:
	move.l	d0,($0000d708)
	bra.w	Lfe6bb2

Lfe71d6:
	move.l	(a6)+,d1
	moveq.l	#$01,d0
	swap.w	d0
	move.w	(a6),d0
	move.l	d0,($0000d708)
	bra.w	Lfe6bf0

Lfe71e8:
	move.l	($0000d708),d0
	rts

Lfe71f0:
	movea.l	(a6),a1
	suba.l	#$00000010,a1
	move.l	($00008a22),d0
	move.l	a1,($00008a22)
	movea.l	a1,a0
	bsr.w	Lfe837c
	add.l	#$00000010,d0
	rts

Lfe7212:
	movea.l	($00008a22),a0
	adda.l	#$00000010,a0
	move.l	a0,d0
	rts

Lfe7222:
	.dc.b	$00,$01,$0c,$78,$32,$16,$4f,$ef
	.dc.b	$ff,$fe,$24,$4f,$74,$01,$61,$00
	.dc.b	$05,$c2,$4a,$80,$6b,$06,$67,$0a
	.dc.b	$42,$80,$10,$17,$4f,$ef,$00,$02
	.dc.b	$4e,$75
Lfe7244:
	moveq.l	#$ff,d0
	lea.l	($0002,a7),a7
	rts

Lfe724c:
	movea.l	(a6)+,a2
	move.w	(a6),d1
	move.w	d1,d0
	bsr.w	Lfe8510
	tst.l	d0
	bmi.s	Lfe7274
	move.b	($0001,a0),d0
	btst.l	#$07,d0
	beq.s	Lfe7276
	and.w	#$0021,d0
	cmp.w	#$0001,d0
	bne.s	Lfe7276
	subq.l	#4,a6
	bsr.w	Lfe5e00
Lfe7274:
	rts

Lfe7276:
	clr.l	d7
	clr.l	d2
	move.b	(a2)+,d2
	move.l	a2,-(a7)
	addq.l	#1,a2
Lfe7280:
	movem.l	d2/a2,-(a7)
	moveq.l	#$01,d2
	move.b	($0001,a0),d0
	btst.l	#$07,d0
	bne.s	Lfe7296
	bsr.w	Lfe8c68
	bra.s	Lfe729a

Lfe7296:
	bsr.w	Lfe9054
Lfe729a:
	movem.l	(a7)+,d2/a2
	tst.l	d0
	beq.s	Lfe72cc
	addq.l	#1,d7
	move.b	(a2)+,d0
	cmp.b	#$1a,d0
	beq.s	Lfe72bc
	cmp.b	#$0a,d0
	beq.s	Lfe72d4
	cmp.b	#$0d,d0
	beq.s	Lfe72c6
	subq.l	#1,d2
	bne.s	Lfe7280
Lfe72bc:
	clr.b	(a2)
	move.l	d7,d0
	movea.l	(a7)+,a2
	move.b	d0,(a2)
	rts

Lfe72c6:
	subq.l	#1,a2
	subq.l	#1,d7
	bra.s	Lfe7280

Lfe72cc:
	tst.l	d7
	bne.s	Lfe72bc
	moveq.l	#$ff,d7
	bra.s	Lfe72bc

Lfe72d4:
	subq.l	#1,a2
	subq.l	#1,d7
	bra.s	Lfe72bc

Lfe72da:
	move.w	(a6)+,d0
	move.w	(a6),d1
	lea.l	(-$0002,a7),a7
	movea.l	a7,a2
	move.b	d0,(a2)
	moveq.l	#$01,d2
	bsr.w	Lfe7916
	lea.l	($0002,a7),a7
	rts

Lfe72f2:
	movea.l	(a6)+,a2
	move.w	(a6),d1
	clr.l	d2
	movea.l	a2,a0
Lfe72fa:
	addq.l	#1,d2
	tst.b	(a0)+
	bne.s	Lfe72fa
	clr.l	d0
	subq.l	#1,d2
	beq.s	Lfe730a
	bsr.w	Lfe7916
Lfe730a:
	rts

Lfe730c:
	movea.l	($00008a22),a0
	lea.l	($0024,a0),a0
Lfe7316:
	movem.l	d0-d7/a0-a6,-(a7)
	lea.l	($0000d72c),a1
	moveq.l	#$0b,d2
	moveq.l	#$5f,d0			;'_'
Lfe7324:
	moveq.l	#$07,d1
Lfe7326:
	btst.b	d1,(a1,d2.w)
	beq.s	Lfe733e
	btst.b	d1,(a0,d2.w)
	bne.s	Lfe733e
	movem.l	d0-d2/a0-a1,-(a7)
	bsr.w	Lfe7628
	movem.l	(a7)+,d0-d2/a0-a1
Lfe733e:
	subq.w	#1,d0
	dbra.w	d1,Lfe7326
	dbra.w	d2,Lfe7324
	movem.l	(a7)+,d0-d7/a0-a6
	rts

Lfe734e:
	bsr.w	Lfe7e8a
	bmi.s	Lfe7372
	movea.l	d0,a0
	bsr.w	Lfe7e8a
	bmi.s	Lfe7372
	movea.l	d0,a1
	movem.l	a0-a1,-(a7)
	bsr.w	Lfe8d3c
	movem.l	(a7)+,a0-a1
	clr.l	d0
	move.b	(a0),d0
	move.b	(a1),(a0)
	move.b	d0,(a1)
Lfe7372:
	rts

Lfe7374:
	bsr.w	Lfe7e8a
	bmi.s	Lfe7388
	movea.l	(a6),a1
	movea.l	d0,a0
	moveq.l	#$5d,d0			;']'
Lfe7380:
	move.b	(a0)+,(a1)+
	dbra.w	d0,Lfe7380
	clr.l	d0
Lfe7388:
	rts

Lfe738a:
	move.w	(a6),d1
	clr.l	d0
	move.b	($0000d8dc),d0
	cmp.b	d1,d0
	bcs.s	Lfe739e
	move.b	d1,($0000d8dd)
Lfe739e:
	addq.w	#1,d0
	rts

Lfe73a2:
	movea.l	(a6)+,a1
	movea.l	(a6),a6
	suba.l	#$00000058,a7
	movea.l	a7,a2
	bsr.w	Lfe80fe
	tst.l	d0
	bmi.w	Lfe74b6
	tst.b	(a2)
	bne.w	Lfe74b4
	move.b	($0001,a2),d0
	and.w	#$001f,d0
	move.w	d0,(a6)
	addq.w	#1,(a6)+
	bsr.w	Lfe9090
	tst.l	d0
	bmi.w	Lfe74b6
	movea.l	d0,a0
	bsr.w	Lfe8910
	tst.l	d0
	bmi.w	Lfe74b6
	move.w	#$0004,d3
	move.w	($001a,a1),d1
	beq.s	Lfe740c
	ror.w	#8,d1
	bsr.w	Lfe992a
Lfe73f0:
	move.w	#$ffff,d2
	bsr.w	Lfe9b18
	tst.l	d0
	bmi.w	Lfe74b6
	move.w	d1,(a6)+
	move.w	d2,(a6)+
	addq.w	#4,d3
	move.w	d0,d1
	cmp.w	#$ffff,d1
	bne.s	Lfe73f0
Lfe740c:
	clr.l	d0
	move.w	d3,d0
	clr.w	(a6)
	bra.w	Lfe74b6

Lfe7416:
	clr.l	d0
	move.b	($0000d8dd),d0
	rts

Lfe7420:
	movea.l	(a6)+,a1
	movea.l	(a6),a2
	bsr.w	Lfe9332
	move.l	d0,-(a7)
	bmi.s	Lfe745c
	movea.l	(a6),a1
	clr.l	d0
	move.b	(a1)+,d0
	move.l	d0,(a7)
	move.b	(a1),d0
	add.b	#$41,d0			;'A'
	move.b	d0,(-$0001,a1)
	move.b	#$3a,(a1)+		;':'
	bsr.w	Lfe778c
	bra.s	Lfe745c

Lfe7448:
	movea.l	(a6)+,a1
	movea.l	(a6),a2
	bsr.w	Lfe930a
	move.l	d0,-(a7)
	bmi.s	Lfe745c
	movea.l	(a6),a1
	addq.l	#2,a1
	bsr.w	Lfe778c
Lfe745c:
	move.l	(a7)+,d0
	rts

Lfe7460:
	movea.l	(a6)+,a1
	suba.l	#$00000058,a7
	movea.l	a7,a2
	bsr.w	Lfe80fe
	tst.l	d0
	bmi.s	Lfe74b6
	tst.b	(a2)
	bne.s	Lfe74b4
	moveq.l	#$03,d2
	bsr.w	Lfe8448
	move.l	d0,-(a7)
	bmi.s	Lfe74aa
	movea.l	a0,a3
	move.w	(a6),d2
	bne.s	Lfe7488
	moveq.l	#$20,d2			;' '
Lfe7488:
	moveq.l	#$03,d0
	bsr.s	Lfe74e2
	bsr.w	Lfe9eda
	tst.l	d0
	bmi.s	Lfe74be
	movea.l	d0,a0
	move.l	a0,($0004,a3)
	move.w	($0004,a0),d0
	and.b	#$3f,d0
	or.b	#$c0,d0
	move.b	d0,($0001,a3)
Lfe74aa:
	move.l	(a7)+,d0
	adda.l	#$00000058,a7
	rts

Lfe74b4:
	moveq.l	#$f3,d0
Lfe74b6:
	adda.l	#$00000058,a7
	rts

Lfe74be:
	bsr.s	Lfe7502
	bmi.s	Lfe74ce
	bsr.s	Lfe753a
	bsr.w	Lfe8708
	tst.l	d0
	bmi.s	Lfe74ce
	bra.s	Lfe74aa

Lfe74ce:
	move.l	(a7)+,d1
	move.l	d0,-(a7)
	move.l	d1,d0
	bsr.w	Lfe84cc
	move.l	(a7)+,d0
	adda.l	#$00000058,a7
	rts

Lfe74e2:
	move.b	d0,($0002,a3)
	move.b	d2,($0003,a3)
	lea.l	($0043,a2),a0
	move.l	a0,d0
	lea.l	($0020,a3),a1
	move.w	#$0007,d1
Lfe74f8:
	move.b	(a0)+,(a1)+
	dbra.w	d1,Lfe74f8
	movea.l	d0,a0
	rts

Lfe7502:
	lea.l	($004e,a2),a0
	lea.l	($002c,a3),a1
	move.w	#$0009,d1
Lfe750e:
	move.b	(a0)+,(a1)+
	dbra.w	d1,Lfe750e
	lea.l	($004b,a2),a0
	lea.l	($0028,a3),a1
	move.w	#$0002,d1
Lfe7520:
	move.b	(a0)+,(a1)+
	dbra.w	d1,Lfe7520
	move.b	($0001,a2),d0
	and.b	#$1f,d0
	move.b	d0,($0001,a3)
	bsr.w	Lfe9090
	tst.l	d0
	rts

Lfe753a:
	move.l	d0,($0004,a3)
	move.l	d0,-(a7)
	move.b	($0003,a3),d0
	move.b	d0,($002b,a3)
	clr.l	($0010,a3)
	clr.l	($0014,a3)
	clr.l	($003c,a3)
	DOS	_GETTIME
	move.w	d0,($0036,a3)
	DOS	_GETDATE
	move.w	d0,($0038,a3)
	move.l	(a7)+,d0
	rts

Lfe7564:
	movea.l	(a6)+,a1
	move.w	(a6),d2
	cmp.b	#$03,d2
	bcc.w	Lfe7622
	suba.l	#$00000058,a7
	movea.l	a7,a2
	bsr.w	Lfe930a
	tst.l	d0
	bmi.w	Lfe74b6
	tst.b	(a2)
	bne.w	Lfe74b4
	bsr.w	Lfe8448
	move.l	d0,-(a7)
	bmi.w	Lfe74aa
	movea.l	a0,a3
	move.b	d2,($0002,a3)
	clr.b	($0003,a3)
	lea.l	($0043,a2),a0
	move.l	a0,d0
	lea.l	($0020,a3),a1
	move.w	#$0007,d1
Lfe75aa:
	move.b	(a0)+,(a1)+
	dbra.w	d1,Lfe75aa
	movea.l	d0,a0
	bsr.w	Lfe9eda
	tst.l	d0
	bmi.s	Lfe75de
	movea.l	d0,a0
	move.l	a0,($0004,a3)
	move.w	($0004,a0),d0
	and.b	#$3f,d0
	or.b	#$c0,d0
	move.b	d0,($0001,a3)
	btst.l	#$03,d0
	beq.w	Lfe74aa
	moveq.l	#$f3,d0
	bra.w	Lfe74ce

Lfe75de:
	move.b	($0001,a2),d0
	and.b	#$1f,d0
	move.b	d0,($0001,a3)
	bsr.w	Lfe9090
	tst.l	d0
	bmi.w	Lfe74ce
	move.l	d0,($0004,a3)
	clr.l	($0010,a3)
	clr.l	($0014,a3)
	bsr.w	Lfe882a
	tst.l	d0
	bmi.w	Lfe74ce
	tst.b	($0002,a3)
	beq.w	Lfe74aa
	DOS	_GETTIME
	move.w	d0,($0036,a3)
	DOS	_GETDATE
	move.w	d0,($0038,a3)
	bra.w	Lfe74aa

Lfe7622:
	moveq.l	#$f4,d0
	rts

Lfe7626:
	move.w	(a6),d0
Lfe7628:
	bsr.w	Lfe84cc
	tst.l	d0
	bmi.s	Lfe7654
	clr.l	d0
	tst.b	(a0)
	bne.s	Lfe7654
	btst.b	#$07,($0001,a0)
	bne.s	Lfe7654
	movem.l	a0,-(a7)
	movea.l	($0004,a0),a0
	bsr.w	Lfe90ba
	movem.l	(a7)+,a0
	bmi.s	Lfe7626
	bsr.w	Lfe8a5c
Lfe7654:
	rts

Lfe7656:
	move.w	(a6)+,d0
	bsr.w	Lfe8510
	tst.l	d0
	bmi.s	Lfe7690
	move.l	(a6)+,d1
	move.w	(a6),d3
	move.l	($003c,a0),d2
	clr.l	d0
	tst.w	d3
	beq.s	Lfe767c
	move.l	($0014,a0),d0
	subq.w	#1,d3
	beq.s	Lfe767c
	subq.w	#1,d3
	bne.s	Lfe768e
	move.l	d2,d0
Lfe767c:
	add.l	d1,d0
	bmi.s	Lfe768a
	cmp.l	d0,d2
	bcs.s	Lfe768a
	move.l	d0,($0014,a0)
	rts

Lfe768a:
	moveq.l	#$e7,d0
	rts

Lfe768e:
	moveq.l	#$f2,d0
Lfe7690:
	rts

Lfe7692:
	move.w	(a6),d0
	bsr.w	Lfe8510
	move.l	d0,d2
	bmi.s	Lfe76b0
	movea.l	a0,a2
	bsr.w	Lfe856a
	tst.l	d0
	bmi.s	Lfe76b0
	move.b	d2,($0001,a0)
	addq.b	#1,(a2)
	bsr.w	Lfe85e0
Lfe76b0:
	rts

Lfe76b2:
	move.w	(a6)+,d1
	cmp.w	($0000d738),d1
	bhi.s	Lfe76e4
	move.w	(a6),d0
	cmp.w	#$0004,d0
	bhi.s	Lfe76e4
	lea.l	($0000d742),a0
	add.w	d0,d0
	move.w	(a0,d0.w),d2
	move.w	d1,(a0,d0.w)
	lea.l	($0000d74c),a0
	move.w	d1,(a0,d0.w)
	clr.l	d0
	move.w	d2,d0
	rts

Lfe76e4:
	moveq.l	#$fc,d0
	rts

Lfe76e8:
	move.w	(a6)+,d0
	bsr.w	Lfe8510
	tst.l	d0
	bmi.s	Lfe7728
	movem.l	d0/a0,-(a7)
	move.w	(a6),d0
	bsr.w	Lfe8510
	tst.l	d0
	bpl.s	Lfe7704
	movea.l	a1,a5
	bra.s	Lfe7718

Lfe7704:
	move.l	a1,-(a7)
	move.w	(a6),d0
	move.w	(a1),-(a7)
	bsr.w	Lfe8602
	bsr.w	Lfe7628
	move.w	(a7)+,d0
	movea.l	(a7)+,a5
	move.w	d0,(a5)
Lfe7718:
	move.w	(a6),d0
	bsr.w	Lfe85e0
	movem.l	(a7)+,d0/a0
	move.b	d0,($0001,a5)
	addq.b	#1,(a0)
Lfe7728:
	rts

Lfe772a:
	move.w	(a6)+,d0
	bsr.w	Lfe8510
	tst.l	d0
	bmi.s	Lfe7760
	move.l	(a6),d2
	beq.s	Lfe7756
	tst.b	($0002,a0)
	beq.s	Lfe7752
	move.w	d2,($0036,a0)
	swap.w	d2
	move.w	d2,($0038,a0)
	bset.b	#$06,($0001,a0)
	clr.l	d0
	rts

Lfe7752:
	moveq.l	#$f4,d0
	rts

Lfe7756:
	move.w	($0038,a0),d0
	swap.w	d0
	move.w	($0036,a0),d0
Lfe7760:
	rts

Lfe7762:
	bsr.w	Lfe7e8a
	bmi.s	Lfe778a
	movea.l	d0,a0
	lea.l	($001f,a0),a0
	movea.l	(a6),a1
	tst.b	(a0)
	beq.s	Lfe7782
	move.w	#$003f,d1		;'?'
Lfe7778:
	move.b	(a0)+,(a1)+
	beq.s	Lfe7780
	dbra.w	d1,Lfe7778
Lfe7780:
	subq.l	#2,a1
Lfe7782:
	clr.b	(a1)
	movea.l	(a6),a1
	bsr.s	Lfe778c
	clr.l	d0
Lfe778a:
	rts

Lfe778c:
	move.b	(a1)+,d0
	beq.s	Lfe77ac
	cmp.b	#$2f,d0			;'/'
	beq.s	Lfe77ae
	cmp.b	#$80,d0
	bcs.s	Lfe778c
	cmp.b	#$a0,d0
	bcs.s	Lfe77a8
	cmp.b	#$e0,d0
	bcs.s	Lfe778c
Lfe77a8:
	move.b	(a1)+,d0
	bne.s	Lfe778c
Lfe77ac:
	rts

Lfe77ae:
	move.b	#$5c,(-$0001,a1)	;'\'
	bra.s	Lfe778c

Lfe77b6:
	clr.l	d0
	move.w	(a6)+,d1
	movea.l	(a6)+,a2
	move.l	(a6),d2
	beq.s	Lfe7812
	move.w	d1,d0
	bsr.w	Lfe8510
	tst.l	d0
	bmi.s	Lfe7812
	move.b	($0001,a0),d0
	btst.l	#$07,d0
	bne.s	Lfe7818
Lfe77d4:
	movem.l	a0,-(a7)
	movea.l	($0004,a0),a0
	bsr.w	Lfe90ba
	movem.l	(a7)+,a0
	moveq.l	#$fa,d0
	tst.b	(a0)
	beq.w	Lfe78e2
	bsr.w	Lfe8c68
	bra.w	Lfe78e2

Lfe77f4:
	move.w	d1,d0
	bsr.w	Lfe8510
	tst.l	d0
	bmi.s	Lfe7812
	move.b	($0001,a0),d0
	btst.l	#$07,d0
	beq.s	Lfe77d4
	btst.l	#$02,d0
	bne.s	Lfe7814
Lfe780e:
	bsr.w	Lfe9054
Lfe7812:
	rts

Lfe7814:
	clr.l	d0
	rts

Lfe7818:
	btst.l	#$02,d0
	bne.s	Lfe7814
	and.w	#$0021,d0
	cmp.w	#$0001,d0
	beq.s	Lfe785a
	and.w	#$0020,d0
	bne.s	Lfe780e
	clr.l	d7
Lfe7830:
	movem.l	d2/a2,-(a7)
	moveq.l	#$01,d2
	bsr.w	Lfe9054
	movem.l	(a7)+,d2/a2
	tst.l	d0
	beq.s	Lfe7856
	addq.l	#1,d7
	move.b	(a2)+,d0
	cmp.b	#$1a,d0
	beq.s	Lfe7856
	cmp.b	#$0a,d0
	beq.s	Lfe7856
	subq.l	#1,d2
	bne.s	Lfe7830
Lfe7856:
	move.l	d7,d0
	rts

Lfe785a:
	move.w	d1,d3
	clr.l	d1
Lfe785e:
	movem.l	d1-d3/a2,-(a7)
	bsr.w	Lfe6382
	movem.l	(a7)+,d1-d3/a2
	move.b	d0,(a2)+
	addq.l	#1,d1
	and.w	#$ff00,d0
	beq.s	Lfe7878
	subq.l	#1,d2
	bne.s	Lfe785e
Lfe7878:
	move.l	d1,d0
	rts

Lfe787c:
	clr.l	d0
	move.w	(a6)+,d1
	move.w	d1,d7
	movea.l	(a6)+,a2
	move.l	(a6),d2
	move.w	d1,d0
	cmp.w	#$0001,d0
	bsr.w	Lfe8510
	tst.l	d0
	bmi.s	Lfe78fa
	tst.b	($0002,a0)
	beq.w	Lfe7752
	move.b	($0001,a0),d0
	btst.l	#$07,d0
	bne.w	Lfe7940
Lfe78a8:
	movem.l	a0,-(a7)
	movea.l	($0004,a0),a0
	bsr.w	Lfe90ba
	movem.l	(a7)+,a0
	moveq.l	#$fa,d0
	tst.b	(a0)
	beq.s	Lfe78e2
	tst.l	d2
	beq.s	Lfe78fc
	bsr.w	Lfe8b52
	tst.l	d0
	bmi.s	Lfe78e2
	move.l	d0,-(a7)
	move.l	($0010,a0),d0
	cmp.l	($003c,a0),d0
	bcs.s	Lfe78e0
	move.l	d0,($003c,a0)
	bset.b	#$06,($0001,a0)
Lfe78e0:
	move.l	(a7)+,d0
Lfe78e2:
	tst.b	($0000d4fe)
	beq.s	Lfe78fa
	move.l	d0,-(a7)
	bsr.w	Lfe632c
	move.l	(a7)+,d0
	cmp.w	#$0003,d1
	beq.w	Lfe5bce
Lfe78fa:
	rts

Lfe78fc:
	bsr.w	Lfe8aec
	move.l	($0014,a0),d0
	move.l	d0,($003c,a0)
	bset.b	#$06,($0001,a0)
	clr.l	d0
	bra.s	Lfe78e2

Lfe7912:
	move.l	d2,d0
	rts

Lfe7916:
	move.w	d1,d0
	bsr.w	Lfe8510
	tst.l	d0
	bmi.s	Lfe78fa
	tst.b	($0002,a0)
	beq.w	Lfe7752
	move.b	($0001,a0),d0
	btst.l	#$07,d0
	beq.w	Lfe78a8
	btst.l	#$02,d0
	bne.s	Lfe7912
Lfe793a:
	bsr.w	Lfe9050
	rts

Lfe7940:
	btst.l	#$02,d0
	bne.s	Lfe7912
	tst.l	d2
	beq.s	Lfe7968
	and.w	#$0020,d0
	bne.s	Lfe793a
	tst.l	d2
	beq.s	Lfe7968
	move.l	d2,-(a7)
Lfe7956:
	clr.w	d1
	move.b	(a2)+,d1
	move.w	d7,d0
	bsr.w	Lfe648a
	subq.l	#1,d2
	bne.s	Lfe7956
	move.l	(a7)+,d0
	rts

Lfe7968:
	clr.l	d0
	rts

Lfe796c:
	movea.l	(a6)+,a5
	movea.l	(a6)+,a1
	move.w	(a6),d2
	move.b	d2,($0000.w,a5)
	suba.l	#$00000058,a7
	movea.l	a7,a2
	ror.w	#8,d2
	cmp.b	#$01,d2
	beq.s	Lfe798c
	bsr.w	Lfe930a
	bra.s	Lfe7990

Lfe798c:
	bsr.w	Lfe9300
Lfe7990:
	tst.l	d0
	bmi.s	Lfe79dc
	move.b	($0001,a2),($0001,a5)
	lea.l	($0043,a2),a3
	lea.l	($000a,a5),a4
	moveq.l	#$0a,d0
Lfe79a4:
	move.b	(a3)+,(a4)+
	dbra.w	d0,Lfe79a4
	move.b	($0001,a5),d0
	bsr.w	Lfe9090
	tst.l	d0
	bmi.s	Lfe79dc
	movea.l	d0,a0
	bsr.w	Lfe8906
	tst.l	d0
	bmi.s	Lfe79dc
	clr.w	($0002,a5)
	move.w	d1,($0006,a5)
	move.w	d0,($0008,a5)
	swap.w	d0
	move.w	d0,($0004,a5)
	bsr.s	Lfe79ea
	clr.l	d0
	tst.b	(a2)
	beq.s	Lfe79dc
	bra.s	Lfe79e2

Lfe79dc:
	move.w	#$ffff,($0008,a5)
Lfe79e2:
	adda.l	#$00000058,a7
	rts

Lfe79ea:
	move.b	($000b,a1),($0015,a5)
	move.w	($0016,a1),d0
	rol.w	#8,d0
	move.w	d0,($0016,a5)
	move.w	($0018,a1),d0
	rol.w	#8,d0
	move.w	d0,($0018,a5)
	move.l	($001c,a1),d0
	rol.w	#8,d0
	swap.w	d0
	rol.w	#8,d0
	move.l	d0,($001a,a5)
	lea.l	($001e,a5),a4
	movea.l	a1,a3
	move.w	#$0007,d1
	move.b	(a3)+,d0
	cmp.b	#$05,d0
	bne.s	Lfe7a28
	move.b	#$e5,d0
Lfe7a28:
	cmp.b	#$20,d0			;' '
	beq.s	Lfe7a4e
	move.b	d0,(a4)+
	move.b	(a3)+,d0
	dbra.w	d1,Lfe7a28
	lea.l	($000c,a1),a3
	move.w	#$0009,d1
Lfe7a3e:
	move.b	(a3)+,d0
	beq.s	Lfe7a4e
	cmp.b	#$20,d0			;' '
	beq.s	Lfe7a4e
	move.b	d0,(a4)+
	dbra.w	d1,Lfe7a3e
Lfe7a4e:
	lea.l	($0008,a1),a3
	cmpi.b	#$20,(a3)		;' '
	beq.s	Lfe7a6e
	move.b	#$2e,(a4)+		;'.'
	move.w	#$0002,d1
Lfe7a60:
	move.b	(a3)+,d0
	cmp.b	#$20,d0			;' '
	beq.s	Lfe7a6e
	move.b	d0,(a4)+
	dbra.w	d1,Lfe7a60
Lfe7a6e:
	clr.b	(a4)
	rts

Lfe7a72:
	movea.l	(a6)+,a5
	moveq.l	#$ee,d0
	cmpi.w	#$ffff,($0008,a5)
	beq.s	Lfe7aae
	move.b	($0001,a5),d0
	bsr.w	Lfe9090
	tst.l	d0
	bmi.s	Lfe7aae
	movea.l	d0,a0
	bsr.w	Lfe88bc
	tst.l	d0
	bmi.s	Lfe7aae
	clr.w	($0002,a5)
	move.w	d1,($0006,a5)
	move.w	d0,($0008,a5)
	swap.w	d0
	move.w	d0,($0004,a5)
	bsr.w	Lfe79ea
	clr.l	d0
	rts

Lfe7aae:
	move.w	#$ffff,($0008,a5)
	rts

Lfe7ab6:
	movea.l	(a6)+,a1
	suba.l	#$00000058,a7
	movea.l	a7,a2
	bsr.w	Lfe80fe
	tst.l	d0
	bmi.w	Lfe74b6
	tst.b	(a2)
	bne.w	Lfe74b4
	bsr.s	Lfe7ae6
	bmi.w	Lfe74b6
	bsr.w	Lfe97ec
	bmi.w	Lfe74b6
Lfe7ade:
	bsr.w	Lfe8ef2
	bra.w	Lfe74b6

Lfe7ae6:
	move.b	($0001,a2),d0
	and.b	#$1f,d0
	bsr.w	Lfe9090
	tst.l	d0
	bmi.s	Lfe7b02
	movea.l	d0,a0
	bsr.w	Lfe8644
	bsr.w	Lfe8910
	tst.l	d0
Lfe7b02:
	rts

Lfe7b04:
	movea.l	(a6)+,a1
	suba.l	#$000000b0,a7
	movea.l	a7,a2
	bsr.w	Lfe80fe
	tst.l	d0
	bmi.w	Lfe7bfa
	tst.b	(a2)
	bne.w	Lfe7bf8
	movea.l	(a6),a1
	lea.l	($0058,a7),a2
	bsr.w	Lfe80fe
	tst.l	d0
	bmi.w	Lfe7bfa
	tst.b	(a2)
	bne.w	Lfe7bf8
	move.b	($0001,a2),d0
	cmp.b	($0001,a7),d0
	bne.w	Lfe7bde
	bsr.s	Lfe7ae6
	bpl.w	Lfe7be2
	cmp.l	#$fffffffe,d0
	bne.w	Lfe7bfa
	movea.l	a2,a1
	movea.l	a7,a2
	pea.l	($0002,a2)
	pea.l	($0002,a1)
	bsr.w	Lfe8624
	lea.l	($0008,a7),a7
	beq.s	Lfe7ba4
	bsr.w	Lfe7ae6
	bmi.w	Lfe7bfa
	move.b	($000b,a1),d0
	and.b	#$1b,d0
	bne.s	Lfe7bf4
	moveq.l	#$1f,d0
Lfe7b7a:
	move.b	(a1)+,(a2)+
	dbra.w	d0,Lfe7b7a
	move.b	#$e5,(-$0020,a1)
	bsr.w	Lfe8fb6
	lea.l	($0058,a7),a2
	bsr.w	Lfe8a04
	tst.l	d0
	bmi.s	Lfe7bfa
	movea.l	a7,a4
	movea.l	a1,a3
	moveq.l	#$1f,d2
Lfe7b9c:
	move.b	(a4)+,(a3)+
	dbra.w	d2,Lfe7b9c
	bra.s	Lfe7bb4

Lfe7ba4:
	bsr.w	Lfe7ae6
	bmi.s	Lfe7bfa
Lfe7baa:
	move.b	($000b,a1),d0
	and.b	#$05,d0
	bne.s	Lfe7bf4
Lfe7bb4:
	movea.l	a1,a3
	lea.l	($0058,a7),a2
	lea.l	($0043,a2),a4
	move.w	#$000a,d0
Lfe7bc2:
	move.b	(a4)+,(a3)+
	dbra.w	d0,Lfe7bc2
	addq.l	#1,a3
	moveq.l	#$09,d0
Lfe7bcc:
	move.b	(a4)+,(a3)+
	dbra.w	d0,Lfe7bcc
	bsr.w	Lfe8fb6
	clr.l	d0
	bsr.w	Lfe8ef2
	bra.s	Lfe7bfa

Lfe7bde:
	moveq.l	#$f1,d0
	bra.s	Lfe7bfa

Lfe7be2:
	movea.l	a1,a3
	movea.l	a7,a2
	bsr.w	Lfe7ae6
	bmi.s	Lfe7bfa
	cmpa.l	a1,a3
	beq.s	Lfe7baa
	moveq.l	#$ea,d0
	bra.s	Lfe7bfa

Lfe7bf4:
	moveq.l	#$ed,d0
	bra.s	Lfe7bfa

Lfe7bf8:
	moveq.l	#$f3,d0
Lfe7bfa:
	adda.l	#$000000b0,a7
	rts

Lfe7c02:
	movea.l	(a6)+,a1
	suba.l	#$00000058,a7
	movea.l	a7,a2
	bsr.w	Lfe80fe
	tst.l	d0
	bmi.w	Lfe74b6
	tst.b	(a2)
	bne.w	Lfe74b4
	move.b	($0001,a2),d0
	and.b	#$1f,d0
	bsr.w	Lfe9090
	tst.l	d0
	bmi.w	Lfe74b6
	movea.l	d0,a0
	cmpi.w	#$ffff,(a6)
	beq.s	Lfe7c3a
	bsr.w	Lfe8644
Lfe7c3a:
	bsr.w	Lfe8910
	tst.l	d0
	bmi.w	Lfe74b6
	clr.l	d0
	lea.l	($000b,a1),a3
	move.b	(a3),d0
	move.w	(a6),d2
	cmp.w	#$ffff,d2
	beq.w	Lfe74b6
	move.b	d2,(a3)
	bsr.w	Lfe8fb6
	clr.l	d0
	bsr.w	Lfe8ef2
	bra.w	Lfe74b6

Lfe7c66:
	move.w	(a6)+,d0
	cmp.w	#$0008,d0
	bcc.s	Lfe7c80
	add.w	d0,d0
	add.w	d0,d0
	lea.l	($00009484),a0
	movea.l	(a0,d0.w),a0
	jsr	(a0)
	rts

Lfe7c80:
	moveq.l	#$f2,d0
	rts

Lfe7c84:
	.dc.b	$00,$00,$94,$a4,$00,$00,$94,$ce
	.dc.b	$00,$00,$94,$f0,$00,$00,$94,$f4
	.dc.b	$00,$00,$95,$1e,$00,$00,$95,$22
	.dc.b	$00,$00,$95,$78,$00,$00,$95,$7c
	.dc.b	$30,$16,$61,$00,$08,$68,$4a,$80
	.dc.b	$6b,$1e,$22,$68,$00,$04,$42,$80
	.dc.b	$10,$28,$00,$01,$08,$00,$00,$07
	.dc.b	$66,$04,$22,$69,$00,$12,$32,$29
	.dc.b	$00,$04,$c2,$7c,$ff,$00,$80,$41
Lfe7ccc:
	rts

Lfe7cce:
	move.w	(a6)+,d0
	bsr.w	Lfe8510
	tst.l	d0
	bmi.s	Lfe7ccc
	clr.l	d0
	move.b	($0001,a0),d0
	and.b	#$df,d0
	move.w	(a6),d1
	and.w	#$0020,d1
	or.b	d1,d0
	move.b	d0,($0001,a0)
	rts

Lfe7cf0:
	moveq.l	#$03,d7
	bra.s	Lfe7cf6

Lfe7cf4:
	moveq.l	#$0c,d7
Lfe7cf6:
	move.w	(a6)+,d0
	bsr.w	Lfe8510
	tst.l	d0
	bmi.s	Lfe7ccc
	movea.l	($0004,a0),a1
	clr.l	d0
	move.b	($0001,a0),d0
	btst.l	#$07,d0
	beq.s	Lfe7d2e
	btst.b	#$06,($0004,a1)
	beq.s	Lfe7d74
	clr.l	d1
	clr.l	d2
	bra.s	Lfe7d44

Lfe7d1e:
	moveq.l	#$03,d7
	bra.s	Lfe7d24

Lfe7d22:
	moveq.l	#$0c,d7
Lfe7d24:
	move.w	(a6)+,d0
	bsr.w	Lfe7e8c
	bmi.s	Lfe7ccc
	movea.l	d0,a1
Lfe7d2e:
	movea.l	a1,a2
	movea.l	($0012,a2),a1
	btst.b	#$06,($0004,a1)
	beq.s	Lfe7d74
	move.b	($0001,a2),d1
	move.b	($0016,a2),d2
Lfe7d44:
	suba.l	#$0000001a,a7
	movea.l	a7,a5
	move.b	#$1a,($0000.w,a5)
	move.b	d1,($0001,a5)
	move.b	d7,($0002,a5)
	move.b	d2,($000d,a5)
	move.l	(a6)+,($000e,a5)
	move.l	(a6)+,($0012,a5)
	bsr.w	Lfe86c2
	adda.l	#$0000001a,a7
	clr.l	d0
	rts

Lfe7d74:
	moveq.l	#$ef,d0
	rts

Lfe7d78:
	moveq.l	#$06,d7
	bra.s	Lfe7d7e

Lfe7d7c:
	moveq.l	#$0a,d7
Lfe7d7e:
	move.w	(a6),d0
	bsr.w	Lfe8510
	tst.l	d0
	bmi.w	Lfe7ccc
	movea.l	($0004,a0),a1
	clr.l	d0
	clr.w	d1
	clr.w	d2
	move.b	($0001,a0),d0
	btst.l	#$07,d0
	bne.s	Lfe7daa
	move.b	($0001,a1),d1
	move.b	($0016,a1),d2
	movea.l	($0012,a1),a1
Lfe7daa:
	suba.l	#$0000001a,a7
	movea.l	a7,a5
	move.b	#$1a,($0000.w,a5)
	move.b	d1,($0001,a5)
	move.b	d7,($0002,a5)
	move.b	d2,($000d,a5)
	move.l	(a6)+,($000e,a5)
	move.l	(a6)+,($0012,a5)
	movea.l	($0006,a1),a4
	jsr	(a4)
	movea.l	($000a,a1),a4
	jsr	(a4)
	clr.l	d0
	tst.b	($0003,a5)
	bne.s	Lfe7de2
	subq.b	#1,d0
Lfe7de2:
	adda.l	#$0000001a,a7
	rts

Lfe7dea:
	bsr.w	Lfe8d3c
	clr.l	d0
	rts

Lfe7df2:
	move.b	(a6)+,d7
	cmp.b	#$06,d7
	bcs.s	Lfe7dfc
	clr.b	d7
Lfe7dfc:
	clr.w	d0
	move.b	(a6),d0
	bsr.w	Lfe7e8c
	bmi.s	Lfe7e1c
	movea.l	d0,a0
	cmp.b	#$01,d7
	beq.s	Lfe7e1e
	cmp.b	#$03,d7
	bne.s	Lfe7e18
	bsr.w	Lfe8eaa
Lfe7e18:
	bsr.w	Lfe8692
Lfe7e1c:
	rts

Lfe7e1e:
	bsr.s	Lfe7e30
	bsr.w	Lfe8eaa
	clr.w	($001c,a0)
	move.w	#$2f00,($001e,a0)
	bra.s	Lfe7e18

Lfe7e30:
	movem.l	d7/a0,-(a7)
	movea.l	a0,a5
	move.w	($0000d738),d6
Lfe7e3c:
	move.w	d6,d0
	bsr.w	Lfe8510
	tst.l	d0
	bmi.s	Lfe7e52
	cmpa.l	($0004,a0),a5
	bne.s	Lfe7e52
	move.w	d6,d0
	bsr.w	Lfe7628
Lfe7e52:
	subq.w	#1,d6
	bpl.s	Lfe7e3c
	movem.l	(a7)+,d7/a0
	rts

Lfe7e5c:
	bsr.s	Lfe7e8a
	bmi.s	Lfe7e88
	movea.l	d0,a0
	bsr.w	Lfe9cbc
	bmi.s	Lfe7e88
	movea.l	(a6),a5
	move.w	d0,d3
	move.w	($000e,a0),d2
	subq.w	#3,d2
	move.w	($0004,a0),d1
	addq.w	#1,d1
	move.w	($0002,a0),d0
	move.w	d3,(a5)+
	move.w	d2,(a5)+
	move.w	d1,(a5)+
	move.w	d0,(a5)
	mulu.w	d1,d0
	mulu.w	d3,d0
Lfe7e88:
	rts

Lfe7e8a:
	move.w	(a6)+,d0
Lfe7e8c:
	bne.s	Lfe7e96
	move.b	($0000d8dd),d0
	addq.w	#1,d0
Lfe7e96:
	subq.w	#1,d0
	bsr.w	Lfe9090
	tst.l	d0
	rts

Lfe7ea0:
	movea.l	(a6)+,a1
	lea.l	(-$0058,a7),a7
	movea.l	a7,a2
	bsr.w	Lfe80fe
	tst.l	d0
	bmi.w	Lfe74b6
	tst.b	(a2)
	bne.w	Lfe74b4
	lea.l	(-$0040,a7),a7
	movea.l	a7,a3
	move.b	($0001,a2),d0
	and.w	#$001f,d0
	or.w	#$0100,d0
	move.w	d0,(a3)
	moveq.l	#$04,d0
	moveq.l	#$10,d2
	bsr.w	Lfe74e2
	bsr.w	Lfe7502
	bmi.s	Lfe7ee8
	bsr.w	Lfe753a
	movea.l	d0,a0
	bsr.w	Lfe878e
	bsr.w	Lfe8ef2
Lfe7ee8:
	lea.l	($0040,a7),a7
	bra.w	Lfe74b6

Lfe7ef0:
	movea.l	(a6),a1
	lea.l	(-$0058,a7),a7
	movea.l	a7,a2
	bsr.w	Lfe80fe
	tst.l	d0
	bmi.w	Lfe74b6
	lea.l	($0002,a2),a3
	moveq.l	#$3f,d7			;'?'
	tst.b	(a2)
	bmi.s	Lfe7f10
	bne.w	Lfe74b4
Lfe7f10:
	subq.l	#1,d7
	tst.b	(a3)+
	bne.s	Lfe7f10
	addq.l	#1,d7
	subq.l	#1,a3
	lea.l	($0043,a2),a4
	moveq.l	#$07,d1
	cmpi.b	#$20,(a4)		;' '
	beq.s	Lfe7f9a
	cmpi.b	#$3f,(a4)		;'?'
	beq.s	Lfe7f9a
Lfe7f2c:
	move.b	(a4)+,d0
	cmp.b	#$20,d0			;' '
	beq.s	Lfe7f64
	subq.l	#1,d7
	beq.w	Lfe7fd0
	move.b	d0,(a3)+
	dbra.w	d1,Lfe7f2c
	lea.l	($004e,a2),a4
	moveq.l	#$09,d1
	cmpi.b	#$21,(a4)		;'!'
	bcs.s	Lfe7f64
	cmpi.b	#$3f,(a4)		;'?'
	beq.s	Lfe7f64
Lfe7f52:
	move.b	(a4)+,d0
	cmp.b	#$21,d0			;'!'
	bcs.s	Lfe7f64
	subq.l	#1,d7
	beq.s	Lfe7fd0
	move.b	d0,(a3)+
	dbra.w	d1,Lfe7f52
Lfe7f64:
	lea.l	($004b,a2),a4
	moveq.l	#$02,d1
	cmpi.b	#$20,(a4)		;' '
	beq.s	Lfe7f90
	cmpi.b	#$3f,(a4)		;'?'
	beq.s	Lfe7f90
	subq.l	#1,d7
	beq.s	Lfe7fd0
	move.b	#$2e,(a3)+		;'.'
Lfe7f7e:
	move.b	(a4)+,d0
	cmp.b	#$20,d0			;' '
	beq.s	Lfe7f90
	subq.l	#1,d7
	beq.s	Lfe7fd0
	move.b	d0,(a3)+
	dbra.w	d1,Lfe7f7e
Lfe7f90:
	subq.l	#1,d7
	beq.s	Lfe7fd0
	move.b	#$2f,(a3)+		;'/'
	clr.b	(a3)
Lfe7f9a:
	move.b	($0001,a2),d0
	bsr.w	Lfe9090
	tst.l	d0
	bmi.w	Lfe74b6
	movea.l	d0,a0
	bsr.w	Lfe99ac
	tst.l	d0
	bmi.w	Lfe74b6
	bsr.w	Lfe9938
	movea.l	a7,a2
	move.w	d1,($001c,a0)
	lea.l	($0002,a2),a3
	lea.l	($001e,a0),a4
Lfe7fc6:
	move.b	(a3)+,(a4)+
	bne.s	Lfe7fc6
	clr.l	d0
	bra.w	Lfe74b6

Lfe7fd0:
	moveq.l	#$f3,d0
	bra.w	Lfe74b6

Lfe7fd6:
	movea.l	(a6),a1
	lea.l	(-$0080,a7),a7
	movea.l	a7,a2
	moveq.l	#$7b,d0			;'{'
Lfe7fe0:
	move.b	(a1)+,(a2)+
	beq.s	Lfe7fe8
	dbra.w	d0,Lfe7fe0
Lfe7fe8:
	subq.l	#1,a2
	move.b	#$2f,(a2)+		;'/'
	move.b	#$2a,(a2)+		;'*'
	move.b	#$2e,(a2)+		;'.'
	move.b	#$2a,(a2)+		;'*'
	clr.b	(a2)
	movea.l	a7,a1
	lea.l	(-$0058,a7),a7
	movea.l	a7,a2
	bsr.w	Lfe80fe
	tst.l	d0
	bmi.s	Lfe807e
	move.b	($0001,a2),d0
	and.b	#$1f,d0
	bsr.w	Lfe9090
	tst.l	d0
	bmi.s	Lfe807e
	movea.l	d0,a0
	bsr.w	Lfe8644
	lea.l	($001e,a0),a0
	lea.l	($0002,a2),a1
Lfe802a:
	move.b	(a1)+,d0
	beq.s	Lfe807c
	cmp.b	(a0)+,d0
	bne.s	Lfe802a
	lea.l	($0058,a7),a7
	movea.l	a7,a1
	lea.l	(-$0036,a7),a7
	movea.l	a7,a2
	move.l	a6,-(a7)
	move.w	#$00ff,-(a7)
	move.l	a1,-(a7)
	move.l	a2,-(a7)
	movea.l	a7,a6
	bsr.w	Lfe796c
	movea.l	(a7)+,a2
	addq.l	#6,a7
Lfe8052:
	tst.l	d0
	bmi.s	Lfe8084
	move.w	($001e,a2),d0
	cmp.w	#$2e00,d0
	beq.s	Lfe8066
	cmp.w	#$2e2e,d0		;'..'
	bne.s	Lfe8072
Lfe8066:
	move.l	a2,-(a7)
	movea.l	a7,a6
	bsr.w	Lfe7a72
	movea.l	(a7)+,a2
	bra.s	Lfe8052

Lfe8072:
	movea.l	(a7)+,a6
	lea.l	($00b6,a7),a7
	moveq.l	#$eb,d0
	rts

Lfe807c:
	moveq.l	#$f0,d0
Lfe807e:
	lea.l	($00d8,a7),a7
	rts

Lfe8084:
	movea.l	(a7)+,a6
	lea.l	($00b6,a7),a7
	movea.l	(a6),a1
	lea.l	(-$0058,a7),a7
	movea.l	a7,a2
	bsr.s	Lfe80fe
	tst.l	d0
	bmi.w	Lfe74b6
	tst.b	(a2)
	bne.w	Lfe74b4
	move.b	($0001,a2),d0
	and.b	#$1f,d0
	bsr.w	Lfe9090
	tst.l	d0
	bmi.w	Lfe74b6
	movea.l	d0,a0
	bsr.w	Lfe8910
	tst.l	d0
	bmi.w	Lfe74b6
	move.b	($000b,a1),d0
	and.b	#$10,d0
	beq.s	Lfe80d4
	bsr.w	Lfe97f6
	bmi.w	Lfe74b6
	bra.w	Lfe7ade

Lfe80d4:
	moveq.l	#$fd,d0
	bra.w	Lfe74b6

Lfe80da:
	movea.l	(a6)+,a2
	bsr.w	Lfe7e8a
	movea.l	d0,a0
	move.w	(a6)+,d1
	move.w	(a6),d2
	bra.w	Lfe9004

Lfe80ea:
	movea.l	(a6)+,a2
	bsr.w	Lfe7e8a
	movea.l	d0,a0
	bsr.w	Lfe8644
	move.w	(a6)+,d1
	move.w	(a6),d2
	bra.w	Lfe8ff6

Lfe80fe:
	movem.l	a0,-(a7)
	bsr.w	Lfe930a
	move.l	d0,-(a7)
	bmi.s	Lfe811c
	lea.l	($0043,a2),a0
	bsr.w	Lfe9eda
	tst.l	d0
	bmi.s	Lfe811c
	move.l	#$fffffff3,(a7)
Lfe811c:
	move.l	(a7)+,d0
	movem.l	(a7)+,a0
	rts

Lfe8124:
	move.w	(a6),($0000d726)
	rts

Lfe812c:
	clr.l	d0
	move.w	($0000d726),d0
	rts

Lfe8136:
	move.w	(a6),d0
	cmp.b	#$ff,d0
	beq.s	Lfe814a
	cmp.b	#$02,d0
	bcc.s	Lfe8154
	move.b	d0,($0000d4fe)
Lfe814a:
	clr.l	d0
	move.b	($0000d4fe),d0
	rts

Lfe8154:
	moveq.l	#$f2,d0
	rts

Lfe8158:
	move.l	#$07c10707,d1
	clr.l	d2
	moveq.l	#$04,d0
	bsr.s	Lfe81ca
	move.l	d1,d0
	swap.w	d1
	and.w	#$0fff,d1
	sub.w	#$07bc,d1
	swap.w	d1
	asl.b	#3,d1
	asl.w	#4,d1
	lsr.l	#7,d1
	rol.l	#4,d0
	and.l	#$00000007,d0
	swap.w	d0
	or.l	d1,d0
	rts

Lfe8186:
	clr.l	d1
	move.w	(a6),d1
	asl.l	#7,d1
	lsr.w	#4,d1
	lsr.b	#3,d1
	swap.w	d1
	add.w	#$07bc,d1
	swap.w	d1
	clr.l	d2
	moveq.l	#$08,d0
	bra.s	Lfe81ca

Lfe819e:
	bsr.s	Lfe81a8
	asl.b	#2,d0
	asl.w	#2,d0
	lsr.l	#5,d0
	rts

Lfe81a8:
	move.l	#$000c0500,d1
	moveq.l	#$01,d2
	moveq.l	#$04,d0
	bsr.s	Lfe81ca
	move.l	d1,d0
	rts

Lfe81b8:
	clr.l	d1
	move.w	(a6),d1
	asl.l	#5,d1
	lsr.w	#2,d1
	lsr.b	#2,d1
	bra.s	Lfe81c6

Lfe81c4:
	move.l	(a6),d1
Lfe81c6:
	moveq.l	#$01,d2
	moveq.l	#$08,d0
Lfe81ca:
	move.l	d1,-(a7)
	movea.l	a7,a2
	lea.l	(-$001a,a7),a7
	movea.l	a7,a5
	move.b	#$1a,($0000.w,a5)
	move.b	d0,($0002,a5)
	move.l	a2,($000e,a5)
	move.l	#$00000004,($0012,a5)
	move.w	d2,($0018,a5)
	move.l	($0000d728),d0
	bmi.s	Lfe820e
	movea.l	d0,a1
	movea.l	($0006,a1),a4
	jsr	(a4)
	movea.l	($000a,a1),a4
	jsr	(a4)
	clr.l	d0
	move.b	($0003,a5),d0
	beq.s	Lfe820e
	moveq.l	#$ff,d0
Lfe820e:
	lea.l	($001a,a7),a7
	move.l	(a7)+,d1
	rts

Lfe8216:
	move.l	(a6),d0
	beq.s	Lfe823c
	sub.l	#$00000042,d0
	movea.l	d0,a1
	movea.l	a7,a0
	move.w	#$000e,d1
Lfe8228:
	move.l	(a0)+,(a1)+
	dbra.w	d1,Lfe8228
	move.w	(a0)+,d1
	and.w	#$dfff,d1
	move.w	d1,(a1)+
	move.l	(a0)+,(a1)+
	movea.l	d0,a7
	rts

Lfe823c:
	btst.b	#$05,($003c,a7)
	bne.s	Lfe826a
	move.l	usp,a1
	suba.l	#$00000042,a1
	move.l	a1,d0
	movea.l	a7,a0
	move.w	#$000e,d1
Lfe8254:
	move.l	(a0)+,(a1)+
	dbra.w	d1,Lfe8254
	move.w	(a0)+,d1
	or.w	#$2000,d1
	move.w	d1,(a1)+
	move.l	(a0)+,(a1)+
	movea.l	d0,a7
	move.l	a0,d0
	rts

Lfe826a:
	moveq.l	#$e6,d0
	rts

Lfe826e:
	move.w	#$3638,d0		;'68'
	swap.w	d0
	move.w	#$0100,d0
	rts

Lfe827a:
	move.w	(a6)+,d0
	move.l	(a6),d1
	bsr.w	Lfe832a
	move.l	(a1),d0
	move.l	d1,(a1)
	movea.l	($00008a22),a2
	cmpa.l	#$00001bc0,a1
	beq.s	Lfe82ce
	cmpa.l	#$00001bc4,a1
	beq.s	Lfe82d4
	cmpa.l	#$00001bc8,a1
	beq.s	Lfe82dc
	cmpa.l	#$000000a8,a1
	beq.s	Lfe8304
	cmpa.l	#$000000ac,a1
	beq.s	Lfe830a
	cmpa.l	#$000000b0,a1
	beq.s	Lfe8310
	cmpa.l	#$000000b4,a1
	beq.s	Lfe8316
	cmpa.l	#$000000b8,a1
	beq.s	Lfe831c
	rts

Lfe82ce:
	move.l	d1,($0014,a2)
	rts

Lfe82d4:
	move.l	d1,($0018,a2)
	move.l	d1,($0004,a1)
Lfe82dc:
	move.l	d1,($001c,a2)
	movea.l	($0000d4e4),a1
	move.w	($0038,a1),($0000d4dc)
	move.w	($0038,a1),($0046,a2)
	lea.l	($003e,a1),a0
	move.l	a0,($0000d4de)
	move.l	a0,($0048,a2)
	rts

Lfe8304:
	move.l	d1,($004c,a2)
	rts

Lfe830a:
	move.l	d1,($0050,a2)
	rts

Lfe8310:
	move.l	d1,($0054,a2)
	rts

Lfe8316:
	move.l	d1,($0058,a2)
	rts

Lfe831c:
	move.l	d1,($005c,a2)
	rts

Lfe8322:
	move.w	(a6),d0
	bsr.s	Lfe832a
	move.l	(a1),d0
	rts

Lfe832a:
	suba.l	a1,a1
	cmp.w	#$0200,d0
	bcs.s	Lfe833e
	movea.l	#$00001800,a1
	and.l	#$000000ff,d0
Lfe833e:
	add.l	d0,d0
	add.l	d0,d0
	adda.l	d0,a1
	rts

Lfe8346:
	movem.l	d1/a1-a2,-(a7)
	lea.l	($00001bc0).l,a1
	lea.l	($0014,a0),a2
	moveq.l	#$02,d1
	bsr.w	Lfe8406
	lea.l	($000000a8).l,a1
	lea.l	($0046,a0),a2
	move.w	($0000d4dc),(a2)+
	move.l	($0000d4de),(a2)+
	moveq.l	#$04,d1
	bsr.w	Lfe8406
	movem.l	(a7)+,d1/a1-a2
	rts

Lfe837c:
	movem.l	d1/a1-a2,-(a7)
	lea.l	($00001bc0).l,a2
	lea.l	($0014,a0),a1
	moveq.l	#$02,d1
	bsr.s	Lfe8406
	lea.l	($000000a8).l,a2
	lea.l	($0046,a0),a1
	move.w	(a1)+,($0000d4dc)
	move.l	(a1)+,($0000d4de)
	moveq.l	#$04,d1
	bsr.s	Lfe8406
	movem.l	(a7)+,d1/a1-a2
	rts

Lfe83ae:
	movem.l	d0-d1/a0-a2,-(a7)
	lea.l	($00001bc0).l,a2
	lea.l	($0014,a0),a1
	moveq.l	#$02,d1
	bsr.s	Lfe8406
	lea.l	($0046,a0),a1
	move.w	(a1)+,($0000d4dc)
	move.l	(a1)+,($0000d4de)
	lea.l	($000000a8).l,a2
	clr.l	d1
Lfe83d8:
	move.l	(a2)+,d0
	cmp.l	(a1)+,d0
	beq.s	Lfe83e0
	bsr.s	Lfe83ee
Lfe83e0:
	addq.w	#4,d1
	cmp.w	#$0014,d1
	bcs.s	Lfe83d8
	movem.l	(a7)+,d0-d1/a0-a2
	rts

Lfe83ee:
	movem.l	d2/a0,-(a7)
Lfe83f2:
	move.l	d0,($4c,a0,d1.w)
	move.l	($0004,a0),d2
	beq.s	Lfe8400
	movea.l	d2,a0
	bra.s	Lfe83f2

Lfe8400:
	movem.l	(a7)+,d2/a0
	rts

Lfe8406:
	move.l	(a1)+,(a2)+
	dbra.w	d1,Lfe8406
	rts

Lfe840e:
	move.w	($0000d738),d1
	subq.w	#6,d1
	bcs.s	Lfe8446
	movea.l	($0000d4e8),a0
	move.l	a0,($0000d73a)
	move.w	d1,d0
Lfe8426:
	move.w	#$ffff,(a0)+
	dbra.w	d1,Lfe8426
	move.l	a0,($0000d73e)
Lfe8434:
	moveq.l	#$0f,d1
Lfe8436:
	clr.l	(a0)+
	dbra.w	d1,Lfe8436
	dbra.w	d0,Lfe8434
	move.l	a0,($0000d4e8)
Lfe8446:
	rts

Lfe8448:
	movem.l	d1/a1,-(a7)
	cmp.w	#$0100,d2
	bcc.s	Lfe8478
	bsr.w	Lfe856a
	movea.l	a0,a1
	move.l	d0,d1
	bmi.s	Lfe8472
	bsr.w	Lfe85a6
	tst.l	d0
	bmi.s	Lfe8472
Lfe8464:
	move.w	d0,(a1)
	asl.w	#8,d0
	or.w	d0,(a1)
	addq.b	#1,(a0)
	move.l	d1,d0
	bsr.w	Lfe85e0
Lfe8472:
	movem.l	(a7)+,d1/a1
	rts

Lfe8478:
	movea.l	($0000d73a),a0
	clr.l	d0
	move.w	($0000d738),d0
	move.w	d0,-(a7)
	subq.w	#6,d0
	add.w	d0,d0
	adda.l	d0,a0
	move.w	(a7)+,d0
	cmpi.w	#$ffff,(a0)
	beq.s	Lfe84a2
	subq.w	#1,d0
	cmpi.w	#$ffff,-(a0)
	beq.s	Lfe84a2
Lfe849e:
	moveq.l	#$fc,d0
	bra.s	Lfe8472

Lfe84a2:
	movea.l	a0,a1
	move.l	d0,d1
	move.w	($0000d738),d0
	move.w	d0,-(a7)
	subq.w	#6,d0
	asl.l	#6,d0
	movea.l	($0000d73e),a0
	adda.l	d0,a0
	move.w	(a7)+,d0
	tst.b	(a0)
	beq.s	Lfe8464
	lea.l	(-$0040,a0),a0
	subq.w	#1,d0
	tst.b	(a0)
	beq.s	Lfe8464
	bra.s	Lfe849e

Lfe84cc:
	cmp.w	#$0005,d0
	bcs.s	Lfe84ee
	bsr.w	Lfe8602
	bsr.s	Lfe8510
	tst.l	d0
	bmi.s	Lfe850e
	move.w	#$ffff,(a1)
Lfe84e0:
	subq.b	#1,(a0)
	bne.s	Lfe84ec
	cmp.w	#$0005,d0
	bcc.s	Lfe84ec
	addq.b	#1,(a0)
Lfe84ec:
	rts

Lfe84ee:
	move.l	d1,-(a7)
	move.l	d0,d1
	bsr.s	Lfe8510
	tst.l	d0
	bmi.s	Lfe850c
	move.l	a0,-(a7)
	add.w	d1,d1
	lea.l	($0000d742),a0
	move.w	(a0,d1.w),(a1)
	movea.l	(a7)+,a0
	move.l	(a7)+,d1
	bra.s	Lfe84e0

Lfe850c:
	move.l	(a7)+,d1
Lfe850e:
	rts

Lfe8510:
	cmp.w	($0000d738),d0
	bhi.s	Lfe8562
	movea.l	#$0000d74c,a1
	cmp.w	#$0006,d0
	bcs.s	Lfe852c
	subq.w	#6,d0
	movea.l	($0000d73a),a1
Lfe852c:
	add.w	d0,d0
	lea.l	(a1,d0.w),a1
	move.w	(a1),d0
	and.l	#$000000ff,d0
	cmp.b	#-$01,d0
	beq.s	Lfe8566
	move.l	d0,-(a7)
	movea.l	#$0000d758,a0
	cmp.w	#$0006,d0
	bcs.s	Lfe8556
	subq.w	#6,d0
	movea.l	($0000d73e),a0
Lfe8556:
	asl.w	#6,d0
	adda.l	d0,a0
	move.l	(a7)+,d0
	tst.b	(a0)
	beq.s	Lfe8566
	rts

Lfe8562:
	moveq.l	#$fc,d0
	rts

Lfe8566:
	moveq.l	#$fa,d0
	rts

Lfe856a:
	movea.l	#$0000d756,a0
	moveq.l	#$05,d0
	cmpi.w	#$ffff,(a0)
	beq.s	Lfe85a4
	movea.l	($0000d73a),a0
	move.w	($0000d738),d0
	subq.w	#2,d0
	subq.w	#6,d0
	bcs.s	Lfe8562
	move.w	d0,-(a7)
Lfe858c:
	cmpi.w	#$ffff,(a0)+
	beq.s	Lfe859a
	dbra.w	d0,Lfe858c
	addq.l	#2,a7
	bra.s	Lfe8562

Lfe859a:
	sub.w	d0,(a7)
	clr.l	d0
	move.w	(a7)+,d0
	addq.w	#6,d0
	subq.l	#2,a0
Lfe85a4:
	rts

Lfe85a6:
	movea.l	#$0000d898,a0
	moveq.l	#$05,d0
	tst.b	(a0)
	beq.s	Lfe85de
	move.w	($0000d738),d0
	subq.w	#2,d0
	subq.w	#6,d0
	bcs.s	Lfe8562
	movea.l	($0000d73e),a0
	move.w	d0,-(a7)
Lfe85c6:
	tst.b	(a0)
	beq.s	Lfe85d6
	lea.l	($0040,a0),a0
	dbra.w	d0,Lfe85c6
	addq.l	#2,a7
	bra.s	Lfe8562

Lfe85d6:
	sub.w	d0,(a7)
	clr.l	d0
	move.w	(a7)+,d0
	addq.w	#6,d0
Lfe85de:
	rts

Lfe85e0:
	movem.l	d0-d1/a0,-(a7)
	cmp.w	#$0060,d0		;'`'
	bcc.s	Lfe85fc
	move.w	d0,d1
	and.w	#$0007,d0
	lsr.w	#3,d1
	lea.l	($0000d72c),a0
	bset.b	d0,(a0,d1.w)
Lfe85fc:
	movem.l	(a7)+,d0-d1/a0
	rts

Lfe8602:
	movem.l	d0-d1/a0,-(a7)
	cmp.w	#$0060,d0		;'`'
	bcc.s	Lfe861e
	move.w	d0,d1
	and.w	#$0007,d0
	lsr.w	#3,d1
	lea.l	($0000d72c),a0
	bclr.b	d0,(a0,d1.w)
Lfe861e:
	movem.l	(a7)+,d0-d1/a0
	rts

Lfe8624:
	movem.l	d0/a4-a5,-(a7)
	movea.l	($0010,a7),a4
	movea.l	($0014,a7),a5
Lfe8630:
	move.b	(a5)+,d0
	beq.s	Lfe863c
	cmp.b	(a4)+,d0
	beq.s	Lfe8630
	moveq.l	#$ff,d0
	bra.s	Lfe863e

Lfe863c:
	tst.b	(a4)
Lfe863e:
	movem.l	(a7)+,d0/a4-a5
	rts

Lfe8644:
	movem.l	d0-d7/a0-a6,-(a7)
Lfe8648:
	clr.l	d7
	bsr.s	Lfe8692
	move.w	#$700e,d7
	btst.l	#$03,d0
	beq.s	Lfe8670
	movea.l	($0000d4e4),a6
	lea.l	($0038,a6),a6
	move.l	a0,-(a7)
	trap	#14
	movea.l	(a7)+,a0
	bsr.w	Lfe90ba
	cmp.b	#$02,d7
	bne.s	Lfe8648
Lfe8670:
	movem.l	(a7)+,d0-d7/a0-a6
	rts

Lfe8676:
	movem.l	d0-d1/d7/a1/a4-a5,-(a7)
	moveq.l	#$06,d7
	bsr.s	Lfe8692
	movem.l	(a7)+,d0-d1/d7/a1/a4-a5
	rts

Lfe8684:
	movem.l	d0-d1/d7/a1/a4-a5,-(a7)
	moveq.l	#$07,d7
	bsr.s	Lfe8692
	movem.l	(a7)+,d0-d1/d7/a1/a4-a5
	rts

Lfe8692:
	lea.l	(-$001a,a7),a7
	movea.l	a7,a5
	move.b	#$1a,($0000.w,a5)
	move.b	#$05,($0002,a5)
	move.b	($0001,a0),d0
	move.b	d0,($0001,a5)
	move.b	d7,($000d,a5)
	movea.l	($0012,a0),a1
	bsr.s	Lfe86c2
	clr.l	d0
	move.b	($000d,a5),d0
	lea.l	($001a,a7),a7
	rts

Lfe86c2:
	movea.l	($0006,a1),a4
	jsr	(a4)
	movea.l	($000a,a1),a4
	jsr	(a4)
	bsr.s	Lfe86d4
	bne.s	Lfe86c2
	rts

Lfe86d4:
	movem.l	d1-d7/a0-a6,-(a7)
	clr.b	($0000d8e1)
	move.b	($0004,a5),d7
	asl.w	#8,d7
	move.b	($0003,a5),d7
	beq.s	Lfe8702
	movea.l	($0000d4e4),a6
	lea.l	($0038,a6),a6
	trap	#14
	move.b	#-$01,($0000d8e1)
	cmp.b	#$02,d7
Lfe8702:
	movem.l	(a7)+,d1-d7/a0-a6
	rts

Lfe8708:
	movem.l	d1/a0-a1/a4,-(a7)
	movea.l	d0,a0
	bsr.w	Lfe8644
	bsr.w	Lfe8910
	cmp.l	#$fffffffe,d0
	beq.s	Lfe8728
	tst.l	d0
	bmi.s	Lfe8766
	bsr.w	Lfe97ec
	bmi.s	Lfe8766
Lfe8728:
	clr.w	d0
	btst.b	#$03,($0003,a3)
	bne.s	Lfe8738
	bsr.w	Lfe9c22
	bmi.s	Lfe8764
Lfe8738:
	move.w	d0,($003a,a3)
	clr.w	($000c,a3)
	clr.w	($000e,a3)
	clr.l	($0018,a3)
	clr.l	($001c,a3)
	bsr.w	Lfe8a04
	tst.l	d0
	bmi.s	Lfe876c
	move.w	d1,($0008,a3)
	move.w	d0,($000a,a3)
	bsr.w	Lfe8a7c
	clr.l	d0
	bra.s	Lfe8766

Lfe8764:
	moveq.l	#$e9,d0
Lfe8766:
	movem.l	(a7)+,d1/a0-a1/a4
	rts

Lfe876c:
	move.l	d0,-(a7)
	move.w	($003a,a3),d0
	beq.s	Lfe877c
	bsr.w	Lfe9d2c
	bsr.w	Lfe8ef2
Lfe877c:
	move.l	(a7)+,d0
	bra.s	Lfe8766

Lfe8780:
	move.l	d0,-(a7)
	move.w	($003a,a3),d0
	bsr.w	Lfe9d2c
	move.l	(a7)+,d0
	rts

Lfe878e:
	bsr.w	Lfe8644
	bsr.w	Lfe8910
	cmp.l	#$fffffffe,d0
	beq.s	Lfe87a6
	tst.l	d0
	bmi.s	Lfe87a4
	moveq.l	#$ec,d0
Lfe87a4:
	rts

Lfe87a6:
	bsr.w	Lfe9c22
	bmi.s	Lfe8826
	move.w	d0,($003a,a3)
	clr.w	($000c,a3)
	clr.w	($000e,a3)
	clr.l	($0018,a3)
	clr.l	($001c,a3)
	bsr.w	Lfe8a04
	tst.l	d0
	bmi.s	Lfe8780
	move.w	d1,($0008,a3)
	move.w	d0,($000a,a3)
	bsr.w	Lfe8a7c
	move.w	($003a,a3),d1
	bsr.w	Lfe992a
	bsr.w	Lfe8fb6
	lea.l	($0020,a3),a4
	moveq.l	#$0a,d1
	moveq.l	#$20,d0			;' '
Lfe87e8:
	move.b	d0,(a4)+
	dbra.w	d1,Lfe87e8
	addq.l	#1,a4
	moveq.l	#$09,d1
Lfe87f2:
	clr.b	(a4)+
	dbra.w	d1,Lfe87f2
	move.b	#$2e,($0020,a3)		;'.'
	bsr.w	Lfe8ab2
	move.w	#$2e2e,($0020,a3)	;'..'
	move.w	($0008,a3),d1
	bsr.w	Lfe9938
	move.w	d1,($003a,a3)
	bsr.w	Lfe8ab2
	move.w	#$00ef,d0
Lfe881c:
	clr.l	(a1)+
	dbra.w	d0,Lfe881c
	clr.l	d0
	rts

Lfe8826:
	moveq.l	#$e9,d0
	rts

Lfe882a:
	movem.l	d1/a0-a1/a4,-(a7)
	movea.l	d0,a0
	tst.b	($0002,a3)
	beq.s	Lfe883a
	bsr.w	Lfe8644
Lfe883a:
	bsr.w	Lfe8910
	tst.l	d0
	bmi.s	Lfe8880
	move.w	d1,($0008,a3)
	move.w	d0,($000a,a3)
	lea.l	($0020,a3),a4
	bsr.s	Lfe8886
	move.b	($002b,a3),d0
	and.w	#$0018,d0
	bne.s	Lfe887e
	tst.b	($0002,a3)
	beq.s	Lfe886a
	move.b	($002b,a3),d0
	and.w	#$0005,d0
	bne.s	Lfe887e
Lfe886a:
	clr.w	($000c,a3)
	clr.w	($000e,a3)
	clr.l	($0018,a3)
	clr.l	($001c,a3)
	clr.l	d0
	bra.s	Lfe8880

Lfe887e:
	moveq.l	#$fb,d0
Lfe8880:
	movem.l	(a7)+,d1/a0-a1/a4
	rts

Lfe8886:
	movem.l	d0-d1,-(a7)
	moveq.l	#$14,d1
	move.b	(a1)+,d0
	cmp.b	#$05,d0
	bne.s	Lfe8898
	move.b	#$e5,d0
Lfe8898:
	move.b	d0,(a4)+
Lfe889a:
	move.b	(a1)+,(a4)+
	dbra.w	d1,Lfe889a
	moveq.l	#$02,d1
Lfe88a2:
	move.w	(a1)+,d0
	rol.w	#8,d0
	move.w	d0,(a4)+
	dbra.w	d1,Lfe88a2
	move.l	(a1),d1
	rol.w	#8,d1
	swap.w	d1
	rol.w	#8,d1
	move.l	d1,(a4)
	movem.l	(a7)+,d0-d1
	rts

Lfe88bc:
	movem.l	d2-d7/a2-a4,-(a7)
	lea.l	($000a,a5),a2
	move.b	(a5),d7
	swap.w	d7
	move.w	($0006,a5),d1
	move.w	($0004,a5),d2
	move.w	($0002,a0),d3
	move.w	d2,d4
	move.w	($0008,a5),d0
	sub.w	d0,d2
	asl.l	#5,d0
	divu.w	d3,d0
	clr.w	d0
	swap.w	d0
	move.l	d0,d6
	bsr.w	Lfe8da6
	tst.l	d0
	bmi.w	Lfe8990
	moveq.l	#$10,d0
	bsr.w	Lfe8fd2
	adda.l	d6,a1
	lsr.w	#5,d3
	subq.w	#1,d3
	lsr.w	#5,d6
	move.w	d3,d0
	sub.w	d6,d0
	move.w	d0,d6
	bra.s	Lfe897a

Lfe8906:
	movem.l	d2-d7/a2-a4,-(a7)
	move.b	(a5),d7
	swap.w	d7
	bra.s	Lfe8916

Lfe8910:
	movem.l	d2-d7/a2-a4,-(a7)
	moveq.l	#$ff,d7
Lfe8916:
	bsr.w	Lfe994a
	tst.l	d0
	bmi.s	Lfe8990
	lea.l	($0043,a2),a2
	move.w	($0002,a0),d3
	move.w	d2,d4
	lsr.w	#5,d3
	subq.w	#1,d3
Lfe892c:
	bsr.w	Lfe8da6
	tst.l	d0
	bmi.s	Lfe8990
	moveq.l	#$10,d0
	bsr.w	Lfe8fd2
	move.w	d3,d6
Lfe893c:
	movea.l	a1,a3
	movea.l	a2,a4
	move.b	(a3)+,d0
	beq.s	Lfe898e
	cmp.b	#$e5,d0
	beq.s	Lfe897a
	swap.w	d7
	move.b	($000b,a1),d5
	bne.s	Lfe8954
	moveq.l	#$20,d5			;' '
Lfe8954:
	and.b	d7,d5
	swap.w	d7
	tst.b	d5
	beq.s	Lfe897a
	moveq.l	#$07,d5
	cmp.b	#$05,d0
	bne.s	Lfe8968
	move.b	#$e5,d0
Lfe8968:
	bsr.s	Lfe8996
	bne.s	Lfe897a
	moveq.l	#$02,d5
	bsr.s	Lfe8996
	bne.s	Lfe897a
	clr.l	d0
	move.w	d4,d0
	sub.w	d2,d0
	bra.s	Lfe8990

Lfe897a:
	subq.w	#1,d2
	beq.s	Lfe898e
	adda.l	#$00000020,a1
	dbra.w	d6,Lfe893c
	bsr.w	Lfe9960
	bne.s	Lfe892c
Lfe898e:
	moveq.l	#$fe,d0
Lfe8990:
	movem.l	(a7)+,d2-d7/a2-a4
	rts

Lfe8996:
	move.b	(a4)+,d7
	cmp.b	#$80,d7
	bcs.s	Lfe89bc
	cmp.b	#$a0,d7
	bcs.s	Lfe89aa
	cmp.b	#$e0,d7
	bcs.s	Lfe89bc
Lfe89aa:
	cmp.b	d0,d7
	bne.s	Lfe89ee
	move.b	(a3)+,d0
	subq.w	#1,d5
	bmi.s	Lfe89ec
	move.b	(a4)+,d7
	cmp.b	d0,d7
	bne.s	Lfe89ee
	bra.s	Lfe89e6

Lfe89bc:
	cmp.b	#$3f,d7			;'?'
	beq.s	Lfe89e6
	cmp.b	#$61,d0			;'a'
	bcs.s	Lfe89d2
	cmp.b	#$7b,d0			;'{'
	bcc.s	Lfe89d2
	sub.b	#$20,d0			;' '
Lfe89d2:
	cmp.b	#$61,d7			;'a'
	bcs.s	Lfe89e2
	cmp.b	#$7b,d7			;'{'
	bcc.s	Lfe89e2
	sub.b	#$20,d7			;' '
Lfe89e2:
	cmp.b	d0,d7
	bne.s	Lfe89ee
Lfe89e6:
	move.b	(a3)+,d0
	dbra.w	d5,Lfe8996
Lfe89ec:
	clr.b	d7
Lfe89ee:
	rts

Lfe89f0:
	move.b	(a4)+,d7
	cmp.b	#$3f,d7			;'?'
	beq.s	Lfe89fe
	cmp.b	d0,d7
	bne.w	Lfe897a
Lfe89fe:
	move.b	(a3)+,d0
	dbra.w	d5,Lfe89f0
Lfe8a04:
	movem.l	d2-d7/a2-a4,-(a7)
	bsr.w	Lfe994a
	tst.l	d0
	bmi.s	Lfe8a50
	lea.l	($0043,a2),a2
	move.w	($0002,a0),d3
	move.w	d2,d4
	lsr.w	#5,d3
	subq.w	#1,d3
Lfe8a1e:
	bsr.w	Lfe8da6
	tst.l	d0
	bmi.s	Lfe8a50
	moveq.l	#$10,d0
	bsr.w	Lfe8fd2
	move.w	d3,d6
Lfe8a2e:
	clr.l	d0
	move.b	(a1),d0
	beq.s	Lfe8a56
	cmp.b	#$e5,d0
	beq.s	Lfe8a56
	subq.w	#1,d2
	beq.s	Lfe8a4e
	adda.l	#$00000020,a1
	dbra.w	d6,Lfe8a2e
	bsr.w	Lfe9970
	bne.s	Lfe8a1e
Lfe8a4e:
	moveq.l	#$e8,d0
Lfe8a50:
	movem.l	(a7)+,d2-d7/a2-a4
	rts

Lfe8a56:
	move.w	d4,d0
	sub.w	d2,d0
	bra.s	Lfe8a50

Lfe8a5c:
	movem.l	d1-d7/a0-a4,-(a7)
	clr.l	d0
	movea.l	a0,a3
	btst.b	#$06,($0001,a0)
	beq.s	Lfe8a6e
	bsr.s	Lfe8a7c
Lfe8a6e:
	movea.l	($0004,a3),a0
	bsr.w	Lfe8ef2
	movem.l	(a7)+,d1-d7/a0-a4
	rts

Lfe8a7c:
	movea.l	($0004,a3),a0
	move.w	($0008,a3),d1
	bsr.w	Lfe8da6
	tst.l	d0
	bmi.s	Lfe8ab0
	moveq.l	#$10,d0
	bsr.w	Lfe8fd2
	move.l	a1,-(a7)
	clr.l	d2
	move.w	($000a,a3),d2
	and.w	#$001f,d2
	asl.w	#5,d2
	adda.l	d2,a1
	lea.l	($0020,a3),a4
	bsr.s	Lfe8ab6
	movea.l	(a7)+,a1
	bsr.w	Lfe8fc0
	clr.l	d0
Lfe8ab0:
	rts

Lfe8ab2:
	lea.l	($0020,a3),a4
Lfe8ab6:
	movem.l	d0-d1,-(a7)
	moveq.l	#$14,d1
	move.b	(a4)+,d0
	cmp.b	#$e5,d0
	bne.s	Lfe8ac8
	move.b	#$05,d0
Lfe8ac8:
	move.b	d0,(a1)+
Lfe8aca:
	move.b	(a4)+,(a1)+
	dbra.w	d1,Lfe8aca
	moveq.l	#$02,d1
Lfe8ad2:
	move.w	(a4)+,d0
	rol.w	#8,d0
	move.w	d0,(a1)+
	dbra.w	d1,Lfe8ad2
	move.l	(a4),d1
	rol.w	#8,d1
	swap.w	d1
	rol.w	#8,d1
	move.l	d1,(a1)+
	movem.l	(a7)+,d0-d1
	rts

Lfe8aec:
	movem.l	d1-d7/a0-a6,-(a7)
	movea.l	a0,a3
	movea.l	($0004,a3),a0
	move.l	($0014,a3),d3
	move.w	($003a,a3),d1
	clr.l	d0
	move.w	($0002,a0),d0
	divu.w	d0,d3
	move.w	d3,d0
	clr.w	d3
	swap.w	d3
	move.w	d0,d7
	move.w	d1,d0
Lfe8b10:
	bsr.w	Lfe9dcc
	bmi.w	Lfe8c50
	tst.w	d0
	beq.w	Lfe9c1a
	cmp.w	#$ffff,d0
	beq.w	Lfe8c50
	tst.w	d7
	beq.s	Lfe8b30
	move.w	d0,d1
	subq.w	#1,d7
	bra.s	Lfe8b10

Lfe8b30:
	move.w	d0,-(a7)
	moveq.l	#$ff,d0
	bsr.w	Lfe9d46
	move.w	(a7)+,d0
Lfe8b3a:
	bsr.w	Lfe9d2c
	tst.l	d0
	bmi.w	Lfe8c50
	beq.w	Lfe9c1a
	cmp.w	#$ffff,d0
	bne.s	Lfe8b3a
	bra.w	Lfe8c50

Lfe8b52:
	movem.l	d1-d7/a0-a6,-(a7)
	movea.l	a0,a3
	movea.l	($0004,a3),a0
	move.l	($0014,a3),d3
	clr.l	d7
	bsr.w	Lfe9836
	bmi.w	Lfe8c56
	clr.l	d4
	move.w	($0002,a0),d4
	tst.w	d3
	beq.s	Lfe8bb2
	bsr.w	Lfe8fbc
	move.l	d4,d5
	sub.w	d3,d5
	moveq.l	#$08,d0
	bsr.w	Lfe8fd2
	clr.l	d0
	cmp.l	d5,d2
	bcc.s	Lfe8b92
	moveq.l	#$02,d0
	bsr.w	Lfe8fd2
	move.w	d2,d5
	moveq.l	#$ff,d0
Lfe8b92:
	adda.l	d3,a1
	sub.l	d5,d2
	add.l	d5,d7
	subq.w	#1,d5
Lfe8b9a:
	move.b	(a2)+,(a1)+
	dbra.w	d5,Lfe8b9a
	tst.w	d0
	bne.s	Lfe8bac
	bsr.w	Lfe9be2
	clr.l	($001c,a3)
Lfe8bac:
	tst.l	d2
	beq.w	Lfe8c3a
Lfe8bb2:
	cmp.l	d4,d2
	bcs.s	Lfe8c04
	divu.w	d4,d2
	move.l	d2,d0
	swap.w	d0
	tst.w	d0
	bne.s	Lfe8bca
	swap.w	d2
	move.w	d4,d2
	swap.w	d2
	subq.w	#1,d2
	beq.s	Lfe8c02
Lfe8bca:
	tst.w	d1
	beq.s	Lfe8c3a
	move.l	d2,-(a7)
	bsr.w	Lfe9b58
	move.l	d0,-(a7)
	tst.w	d2
	beq.w	Lfe8c62
	bsr.w	Lfe8f30
	bsr.w	Lfe8ff6
	clr.l	($001c,a3)
	move.l	(a7)+,d1
	move.l	(a7)+,d5
	tst.l	d0
	bmi.s	Lfe8c50
	move.w	d2,d0
	mulu.w	d4,d0
	add.l	d0,d7
	adda.l	d0,a2
	sub.w	d2,d5
	move.l	d1,d0
	bmi.s	Lfe8c3a
	move.w	d5,d2
	bne.s	Lfe8bca
Lfe8c02:
	swap.w	d2
Lfe8c04:
	tst.w	d2
	beq.s	Lfe8c3a
	tst.w	d1
	beq.s	Lfe8c3a
	bsr.w	Lfe8fbc
	moveq.l	#$08,d0
	bsr.w	Lfe8fd2
	add.l	d2,d7
	clr.l	d0
	cmp.w	d4,d2
	beq.s	Lfe8c26
	moveq.l	#$02,d0
	bsr.w	Lfe8fd2
	moveq.l	#$ff,d0
Lfe8c26:
	subq.w	#1,d2
Lfe8c28:
	move.b	(a2)+,(a1)+
	dbra.w	d2,Lfe8c28
	tst.w	d0
	bne.s	Lfe8c3a
	bsr.w	Lfe9be2
	clr.l	($001c,a3)
Lfe8c3a:
	move.l	d7,d0
	add.l	d0,($0014,a3)
	move.l	($0014,a3),($0010,a3)
	move.w	d1,($000e,a3)
	bset.b	#$06,($0001,a3)
Lfe8c50:
	movem.l	(a7)+,d1-d7/a0-a6
	rts

Lfe8c56:
	cmp.l	#$ffffffe9,d0
	bne.s	Lfe8c50
	clr.l	d0
	bra.s	Lfe8c50

Lfe8c62:
	move.l	(a7)+,d1
	move.l	(a7)+,d5
	bra.s	Lfe8c3a

Lfe8c68:
	movem.l	d1-d7/a0-a6,-(a7)
	movea.l	a0,a3
	movea.l	($0004,a3),a0
	move.l	($0014,a3),d3
	clr.l	d7
	move.l	($003c,a3),d0
	sub.l	d3,d0
	beq.w	Lfe8d2a
	cmp.l	d0,d2
	bcs.s	Lfe8c88
	move.l	d0,d2
Lfe8c88:
	bsr.w	Lfe98d8
	bmi.w	Lfe8d36
	clr.l	d4
	move.w	($0002,a0),d4
	tst.w	d3
	beq.s	Lfe8cd6
	bsr.w	Lfe8d7a
	move.l	d4,d5
	sub.w	d3,d5
	moveq.l	#$04,d0
	bsr.w	Lfe8fd2
	clr.l	d0
	cmp.l	d5,d2
	bcc.s	Lfe8cb8
	moveq.l	#$01,d0
	bsr.w	Lfe8fd2
	move.w	d2,d5
	moveq.l	#$ff,d0
Lfe8cb8:
	adda.l	d3,a1
	sub.l	d5,d2
	add.l	d5,d7
	subq.w	#1,d5
Lfe8cc0:
	move.b	(a1)+,(a2)+
	dbra.w	d5,Lfe8cc0
	tst.w	d0
	bne.s	Lfe8cd2
	bsr.w	Lfe9bb2
	clr.l	($001c,a3)
Lfe8cd2:
	tst.l	d2
	beq.s	Lfe8d26
Lfe8cd6:
	cmp.l	d4,d2
	bcs.s	Lfe8d0c
	divu.w	d4,d2
Lfe8cdc:
	tst.w	d1
	beq.s	Lfe8d26
	move.l	d2,-(a7)
	bsr.w	Lfe9b18
	move.w	d0,-(a7)
	bsr.w	Lfe8f72
	bsr.w	Lfe9004
	clr.l	($001c,a3)
	move.w	(a7)+,d1
	move.l	(a7)+,d5
	tst.l	d0
	bmi.s	Lfe8d36
	move.w	d2,d0
	mulu.w	d4,d0
	add.l	d0,d7
	adda.l	d0,a2
	sub.w	d2,d5
	move.w	d5,d2
	bne.s	Lfe8cdc
	swap.w	d2
Lfe8d0c:
	tst.w	d2
	beq.s	Lfe8d26
	tst.w	d1
	beq.s	Lfe8d26
	bsr.s	Lfe8d7a
	moveq.l	#$04,d0
	bsr.w	Lfe8fd2
	add.l	d2,d7
	subq.w	#1,d2
Lfe8d20:
	move.b	(a1)+,(a2)+
	dbra.w	d2,Lfe8d20
Lfe8d26:
	move.w	d1,($000e,a3)
Lfe8d2a:
	move.l	d7,d0
	add.l	d0,($0014,a3)
	move.l	($0014,a3),($0010,a3)
Lfe8d36:
	movem.l	(a7)+,d1-d7/a0-a6
	rts

Lfe8d3c:
	movem.l	a2,-(a7)
	move.l	($0000d8e2),d0
Lfe8d46:
	movea.l	d0,a2
	bsr.w	Lfe8e7e
	move.b	#-$01,($0004,a2)
	clr.b	($0006,a2)
	move.l	(a2),d0
	bne.s	Lfe8d46
	movem.l	(a7)+,a2
	movem.l	d0-d7/a0-a6,-(a7)
	move.l	($0000d8d8),d0
Lfe8d68:
	movea.l	d0,a0
	bsr.w	Lfe8684
	move.l	($0018,a0),d0
	bpl.s	Lfe8d68
	movem.l	(a7)+,d0-d7/a0-a6
	rts

Lfe8d7a:
	move.l	($001c,a3),d0
	beq.s	Lfe8d9e
	movea.l	d0,a1
	move.b	($0000.w,a0),d0
	lea.l	(-$0010,a1),a1
	cmp.b	($0004,a1),d0
	bne.s	Lfe8d9e
	cmp.w	($0008,a1),d1
	bne.s	Lfe8d9e
	lea.l	($0010,a1),a1
	clr.l	d0
	rts

Lfe8d9e:
	bsr.s	Lfe8da6
	move.l	a1,($001c,a3)
	rts

Lfe8da6:
	movem.l	d2/a2,-(a7)
	clr.l	d0
	move.b	($0000.w,a0),d0
	movea.l	($0000d8e2),a2
	movea.l	a2,a1
Lfe8db8:
	cmp.b	($0004,a2),d0
	bne.s	Lfe8dc6
	cmp.w	($0008,a2),d1
	beq.w	Lfe8e44
Lfe8dc6:
	move.l	(a2),d2
	beq.s	Lfe8dee
	movea.l	d2,a2
	cmpi.b	#-$01,($0004,a2)
	beq.s	Lfe8de2
	move.b	($0006,a2),d2
	cmp.b	($0006,a1),d2
	bcc.s	Lfe8db8
	movea.l	a2,a1
	bra.s	Lfe8db8

Lfe8de2:
	cmpi.b	#-$01,($0004,a1)
	beq.s	Lfe8db8
	movea.l	a2,a1
	bra.s	Lfe8db8

Lfe8dee:
	movea.l	a1,a2
	bsr.w	Lfe8e7e
	moveq.l	#$01,d2
	move.l	a2,-(a7)
	lea.l	($0010,a2),a2
	bsr.w	Lfe9004
	tst.b	($0000d8e1)
	beq.s	Lfe8e2c
	move.w	#$03ff,d2
Lfe8e0c:
	move.b	#$ff,(a2)+
	dbra.w	d2,Lfe8e0c
	movea.l	(a7)+,a2
	move.b	#-$01,($0004,a2)
	move.l	#$ffffffff,($000c,a2)
	move.w	#$ffff,($0008,a2)
	bra.s	Lfe8e3c

Lfe8e2c:
	movea.l	(a7)+,a2
	move.b	($0000.w,a0),($0004,a2)
	move.l	a0,($000c,a2)
	move.w	d1,($0008,a2)
Lfe8e3c:
	clr.b	($0006,a2)
	clr.b	($0005,a2)
Lfe8e44:
	move.l	d0,-(a7)
	movea.l	($0000d8e2),a1
	cmpa.l	a1,a2
	bne.s	Lfe8e5a
	tst.l	(a2)
	beq.s	Lfe8e5a
	move.l	(a2),($0000d8e2)
Lfe8e5a:
	move.l	(a1),d2
	beq.s	Lfe8e6a
	cmp.l	a2,d2
	bne.s	Lfe8e66
	move.l	(a2),(a1)
	bra.s	Lfe8e5a

Lfe8e66:
	movea.l	d2,a1
	bra.s	Lfe8e5a

Lfe8e6a:
	cmpa.l	a1,a2
	beq.s	Lfe8e72
	move.l	a2,(a1)
	clr.l	(a2)
Lfe8e72:
	lea.l	($0010,a2),a1
	move.l	(a7)+,d0
	movem.l	(a7)+,d2/a2
	rts

Lfe8e7e:
	movem.l	d1/a0-a1,-(a7)
	cmpi.b	#-$01,($0004,a2)
	beq.s	Lfe8ea4
	tst.b	($0005,a2)
	beq.s	Lfe8ea4
	movea.l	($000c,a2),a0
	move.w	($0008,a2),d1
	lea.l	($0010,a2),a1
	bsr.w	Lfe8fe6
	clr.b	($0005,a2)
Lfe8ea4:
	movem.l	(a7)+,d1/a0-a1
	rts

Lfe8eaa:
	movem.l	d0-d1/d7/a1-a2/a4-a5,-(a7)
	move.l	($0000d8e2),d0
Lfe8eb4:
	movea.l	d0,a2
	cmpi.b	#-$01,($0004,a2)
	beq.s	Lfe8eda
	tst.b	($0005,a2)
	beq.s	Lfe8eda
	cmpa.l	($000c,a2),a0
	bne.s	Lfe8ee4
	move.w	($0008,a2),d1
	lea.l	($0010,a2),a1
	bsr.w	Lfe8fe6
	clr.b	($0005,a2)
Lfe8eda:
	move.b	#-$01,($0004,a2)
	clr.b	($0006,a2)
Lfe8ee4:
	move.l	(a2),d0
	bne.s	Lfe8eb4
	bsr.w	Lfe8684
	movem.l	(a7)+,d0-d1/d7/a1-a2/a4-a5
	rts

Lfe8ef2:
	movem.l	d0-d1/a1-a2,-(a7)
	move.l	($0000d8e2),d0
Lfe8efc:
	movea.l	d0,a2
	cmpi.b	#-$01,($0004,a2)
	beq.s	Lfe8f22
	tst.b	($0005,a2)
	beq.s	Lfe8f22
	cmpa.l	($000c,a2),a0
	bne.s	Lfe8f22
	move.w	($0008,a2),d1
	lea.l	($0010,a2),a1
	bsr.w	Lfe8fe6
	clr.b	($0005,a2)
Lfe8f22:
	move.l	(a2),d0
	bne.s	Lfe8efc
	bsr.w	Lfe8684
	movem.l	(a7)+,d0-d1/a1-a2
	rts

Lfe8f30:
	movem.l	d0-d3/a1-a2,-(a7)
	move.w	d1,d3
	add.w	d1,d2
	move.l	($0000d8e2),d0
Lfe8f3e:
	movea.l	d0,a2
	cmpi.b	#-$01,($0004,a2)
	beq.s	Lfe8f68
	cmpa.l	($000c,a2),a0
	bne.s	Lfe8f68
	move.w	($0008,a2),d1
	cmp.w	d3,d1
	bcs.s	Lfe8f68
	cmp.w	d2,d1
	bcc.s	Lfe8f68
	clr.b	($0005,a2)
	move.b	#-$01,($0004,a2)
	clr.b	($0006,a2)
Lfe8f68:
	move.l	(a2),d0
	bne.s	Lfe8f3e
	movem.l	(a7)+,d0-d3/a1-a2
	rts

Lfe8f72:
	movem.l	d0-d3/a1-a2,-(a7)
	move.w	d1,d3
	add.w	d1,d2
	move.l	($0000d8e2),d0
Lfe8f80:
	movea.l	d0,a2
	cmpi.b	#-$01,($0004,a2)
	beq.s	Lfe8fac
	cmpa.l	($000c,a2),a0
	bne.s	Lfe8fac
	move.w	($0008,a2),d1
	cmp.w	d3,d1
	bcs.s	Lfe8fac
	cmp.w	d2,d1
	bcc.s	Lfe8fac
	tst.b	($0005,a2)
	beq.s	Lfe8fac
	lea.l	($0010,a2),a1
	bsr.s	Lfe8fe6
	clr.b	($0005,a2)
Lfe8fac:
	move.l	(a2),d0
	bne.s	Lfe8f80
	movem.l	(a7)+,d0-d3/a1-a2
	rts

Lfe8fb6:
	bsr.w	Lfe8da6
	bra.s	Lfe8fc0

Lfe8fbc:
	bsr.w	Lfe8d7a
Lfe8fc0:
	tst.b	(-$000b,a1)
	bne.s	Lfe8fd0
	move.b	#$ff,(-$000b,a1)
	bsr.w	Lfe8676
Lfe8fd0:
	rts

Lfe8fd2:
	movem.l	a1,-(a7)
	suba.l	#$00000010,a1
	or.b	d0,($0006,a1)
	movem.l	(a7)+,a1
	rts

Lfe8fe6:
	movem.l	d2/a2,-(a7)
	movea.l	a1,a2
	moveq.l	#$01,d2
	bsr.s	Lfe8ff6
	movem.l	(a7)+,d2/a2
	rts

Lfe8ff6:
	moveq.l	#$08,d0
	tst.w	($0000d726)
	beq.s	Lfe9006
	moveq.l	#$09,d0
	bra.s	Lfe9006

Lfe9004:
	moveq.l	#$04,d0
Lfe9006:
	movem.l	d2/a1/a4-a5,-(a7)
	suba.l	#$0000001a,a7
	movea.l	a7,a5
	move.b	#$1a,($0000.w,a5)
	move.b	($0001,a0),($0001,a5)
	move.b	d0,($0002,a5)
	move.b	($0016,a0),($000d,a5)
	move.l	a2,($000e,a5)
	and.l	#$0000ffff,d2
	move.l	d2,($0012,a5)
	move.w	d1,($0018,a5)
	movea.l	($0012,a0),a1
	bsr.w	Lfe86c2
	clr.l	d0
	adda.l	#$0000001a,a7
	movem.l	(a7)+,d2/a1/a4-a5
	rts

Lfe9050:
	moveq.l	#$08,d0
	bra.s	Lfe9056

Lfe9054:
	moveq.l	#$04,d0
Lfe9056:
	movem.l	a1/a4-a5,-(a7)
	suba.l	#$0000001a,a7
	movea.l	a7,a5
	move.b	#$1a,($0000.w,a5)
	move.b	d0,($0002,a5)
	movem.l	d2,-(a7)
	move.l	a2,($000e,a5)
	move.l	d2,($0012,a5)
	movea.l	($0004,a0),a1
	bsr.w	Lfe86c2
	movem.l	(a7)+,d0
	adda.l	#$0000001a,a7
	movem.l	(a7)+,a1/a4-a5
	rts

Lfe9090:
	movem.l	d1/a0,-(a7)
	move.l	($0000d8d8),d1
Lfe909a:
	movea.l	d1,a0
	cmp.b	($0000.w,a0),d0
	beq.s	Lfe90b0
	move.l	($0018,a0),d1
	bpl.s	Lfe909a
	movea.l	#$fffffff1,a0
	bra.s	Lfe90b2

Lfe90b0:
	bsr.s	Lfe90ba
Lfe90b2:
	move.l	a0,d0
	movem.l	(a7)+,d1/a0
	rts

Lfe90ba:
	bsr.s	Lfe90c6
	tst.b	d0
	bpl.s	Lfe90c4
	bsr.s	Lfe9104
	moveq.l	#$ff,d0
Lfe90c4:
	rts

Lfe90c6:
	movem.l	a1/a4-a5,-(a7)
	lea.l	(-$001a,a7),a7
	movea.l	a7,a5
	move.b	#$1a,($0000.w,a5)
	move.b	#$01,($0002,a5)
	move.b	($0001,a0),d0
	move.b	d0,($0001,a5)
	move.b	($0016,a0),d0
	move.b	d0,($000d,a5)
	movea.l	($0012,a0),a1
	bsr.w	Lfe86c2
	clr.l	d0
	move.b	($000e,a5),d0
	lea.l	($001a,a7),a7
	movem.l	(a7)+,a1/a4-a5
	rts

Lfe9104:
	movem.l	d1-d7/a1-a6,-(a7)
	move.l	($0000d8e2),d0
Lfe910e:
	movea.l	d0,a2
	cmpi.b	#-$01,($0004,a2)
	beq.s	Lfe911e
	cmpa.l	($000c,a2),a0
	bne.s	Lfe912c
Lfe911e:
	clr.b	($0005,a2)
	move.b	#-$01,($0004,a2)
	clr.b	($0006,a2)
Lfe912c:
	move.l	(a2),d0
	bne.s	Lfe910e
	bsr.w	Lfe8684
	bsr.s	Lfe913c
	movem.l	(a7)+,d1-d7/a1-a6
	rts

Lfe913c:
	cmpi.w	#$2f00,($001e,a0)
	beq.s	Lfe9164
	lea.l	($001f,a0),a5
	bsr.w	Lfe99b0
	tst.l	d0
	bmi.s	Lfe915a
	bsr.w	Lfe9938
	move.w	d1,($001c,a0)
	bra.s	Lfe9164

Lfe915a:
	clr.w	($001c,a0)
	move.w	#$2f00,($001e,a0)
Lfe9164:
	rts

Lfe9166:
	movem.l	d0-d7/a0-a6,-(a7)
	lea.l	($0000d8e6),a0
	lea.l	($0000dcf6),a1
	move.l	a0,($0000d8e2)
	move.l	a1,(a0)
	move.b	#-$01,($0004,a0)
	clr.b	($0006,a0)
	movea.l	a1,a0
	move.b	#-$01,($0004,a0)
	clr.b	($0006,a0)
	clr.l	d1
	move.b	($0000d8e0),d1
	movea.l	($0000d4e8),a1
	subq.w	#1,d1
	beq.s	Lfe91c0
Lfe91a6:
	subq.w	#1,d1
	beq.s	Lfe91c0
	move.l	a1,(a0)
	movea.l	a1,a0
	adda.l	#$00000410,a1
	move.b	#-$01,($0004,a0)
	clr.b	($0006,a0)
	bra.s	Lfe91a6

Lfe91c0:
	clr.l	(a0)
	move.l	a1,($0000d4e8)
	movem.l	(a7)+,d0-d7/a0-a6
	rts

Lfe91ce:
	movem.l	d0-d7/a0-a6,-(a7)
	move.l	($0000d8d8),d1
	bne.s	Lfe91ea
	movea.l	($0000d4e8),a2
	move.l	a2,($0000d8d8)
	clr.l	d6
	bra.s	Lfe9202

Lfe91ea:
	movea.l	d1,a3
	move.l	($0018,a3),d1
	bpl.s	Lfe91ea
	movea.l	($0000d4e8),a2
	move.l	a2,($0018,a3)
	move.b	($0000.w,a3),d6
	addq.b	#1,d6
Lfe9202:
	clr.w	d7
	move.b	($000d,a0),d7
	move.l	#$00010000,d5
	swap.w	d7
	clr.w	d7
	movea.l	($0012,a0),a3
Lfe9216:
	move.b	d6,($0000.w,a2)
	move.b	d7,($0001,a2)
	move.l	a1,($0012,a2)
	move.l	a3,-(a7)
	movea.l	(a3),a3
	bsr.s	Lfe925e
	movea.l	a2,a3
	lea.l	($005e,a3),a2
	move.l	a2,($0018,a3)
	sub.l	d5,d7
	cmp.l	d5,d7
	bcs.s	Lfe9242
	movea.l	(a7)+,a3
	addq.l	#4,a3
	addq.w	#1,d7
	addq.w	#1,d6
	bra.s	Lfe9216

Lfe9242:
	move.l	#$ffffffff,($0018,a3)
	movea.l	(a7)+,a3
	move.b	d6,($0000d8dc)
	move.l	a2,($0000d4e8)
	movem.l	(a7)+,d0-d7/a0-a6
	rts

Lfe925e:
	move.w	($0000.w,a3),d0
	move.w	d0,($0002,a2)
	move.b	($0002,a3),d0
	subq.b	#1,d0
	move.b	d0,($0004,a2)
	moveq.l	#$ff,d1
Lfe9272:
	addq.b	#1,d1
	lsr.b	#1,d0
	bcs.s	Lfe9272
	move.b	d1,($0005,a2)
	move.w	($0004,a3),d0
	move.w	d0,($0006,a2)
	move.b	($0003,a3),d0
	move.b	d0,($0008,a2)
	move.b	($000b,a3),d0
	move.b	d0,($0009,a2)
	move.w	($0006,a3),d2
	move.w	d2,($000a,a2)
	clr.w	d0
	clr.w	d1
	move.b	($0009,a2),d0
	move.b	($0008,a2),d1
	mulu.w	d1,d0
	add.w	($0006,a2),d0
	move.w	d0,($0010,a2)
	mulu.w	#$0020,d2
	divu.w	($0002,a2),d2
	cmp.l	d5,d2
	bcs.s	Lfe92c0
	addq.w	#1,d2
Lfe92c0:
	add.w	d2,d0
	move.w	d0,($000c,a2)
	clr.l	d1
	move.w	($0008,a3),d1
	sub.w	d0,d1
	clr.w	d0
	move.b	($0002,a3),d0
	divu.w	d0,d1
	cmp.l	d5,d1
	bcs.s	Lfe92dc
	addq.w	#1,d1
Lfe92dc:
	addq.w	#3,d1
	move.w	d1,($000e,a2)
	move.b	($000a,a3),d0
	move.b	d0,($0016,a2)
	move.b	#-$01,($0017,a2)
	clr.w	($001c,a2)
	lea.l	($001e,a2),a3
	move.b	#$2f,(a3)+		;'/'
	clr.b	(a3)+
	rts

Lfe9300:
	move.b	#$3f,($0000d8df)	;'?'
	bra.s	Lfe9312

Lfe930a:
	move.b	#$20,($0000d8df)	;' '
Lfe9312:
	movem.l	d1-d2/a0-a1/a3-a4/a6,-(a7)
	lea.l	(-$005a,a7),a7
	movea.l	a7,a4
	bsr.w	Lfe93b8
	bmi.s	Lfe9328
	movea.l	a7,a1
	bsr.w	Lfe9450
Lfe9328:
	lea.l	($005a,a7),a7
	movem.l	(a7)+,d1-d2/a0-a1/a3-a4/a6
	rts

Lfe9332:
	movem.l	d1-d2/a0-a1/a3-a4/a6,-(a7)
	move.b	#$20,($0000d8df)	;' '
	lea.l	(-$005a,a7),a7
	movea.l	a7,a4
	bsr.s	Lfe93b8
	bmi.s	Lfe9328
	movea.l	a7,a1
	clr.b	($0000d8de)
	bsr.w	Lfe9450
	tst.l	d0
	bmi.s	Lfe9328
	lea.l	($004b,a2),a3
	move.b	(a3)+,d1
	rol.l	#8,d1
	move.b	(a3)+,d1
	rol.l	#8,d1
	move.b	(a3)+,d1
	rol.l	#8,d1
	lea.l	($0043,a2),a3
	moveq.l	#$07,d2
Lfe936e:
	cmpi.b	#$20,(a3)		;' '
	beq.s	Lfe9390
	addq.l	#1,a3
	dbra.w	d2,Lfe936e
	lea.l	($004e,a2),a4
	moveq.l	#$09,d2
Lfe9380:
	move.b	(a4)+,d0
	beq.s	Lfe9390
	cmp.b	#$20,d0			;' '
	beq.s	Lfe9390
	move.b	d0,(a3)+
	dbra.w	d2,Lfe9380
Lfe9390:
	clr.b	(a3)
	lea.l	($0056,a2),a3
	tst.b	($0000d8de)
	beq.s	Lfe93b2
	move.b	#$2e,(a3)+		;'.'
	moveq.l	#$02,d2
Lfe93a4:
	rol.l	#8,d1
	cmp.b	#$20,d1			;' '
	beq.s	Lfe93b2
	move.b	d1,(a3)+
	dbra.w	d2,Lfe93a4
Lfe93b2:
	clr.b	(a3)
	bra.w	Lfe9328

Lfe93b8:
	move.b	(a1)+,d0
	beq.s	Lfe9434
	cmp.b	#$20,d0			;' '
	beq.s	Lfe93b8
	moveq.l	#$59,d1			;'Y'
	bra.s	Lfe93ca

Lfe93c6:
	move.b	(a1)+,d0
	beq.s	Lfe9434
Lfe93ca:
	cmp.b	#$5c,d0			;'\'
	beq.s	Lfe9438
	cmp.b	#$20,d0			;' '
	bcs.s	Lfe9430
	beq.s	Lfe943e
	cmp.b	#$22,d0			;'"'
	beq.s	Lfe9430
	cmp.b	#$27,d0			;'''
	beq.s	Lfe9430
	cmp.b	#$2b,d0			;'+'
	bcs.s	Lfe942a
	cmp.b	#$2e,d0			;'.'
	bcs.s	Lfe9430
	cmp.b	#$3b,d0			;';'
	bcs.s	Lfe942a
	cmp.b	#$3f,d0			;'?'
	bcs.s	Lfe9430
	cmp.b	#$5b,d0			;'['
	beq.s	Lfe9430
	cmp.b	#$5d,d0			;']'
	beq.s	Lfe9430
	cmp.b	#$7c,d0			;'|'
	beq.s	Lfe9430
	cmp.b	#$80,d0
	bcs.s	Lfe942a
	cmp.b	#$a0,d0
	bcs.s	Lfe9420
	cmp.b	#$e0,d0
	bcs.s	Lfe942a
Lfe9420:
	move.b	d0,(a4)+
	subq.w	#1,d1
	bmi.s	Lfe9430
	move.b	(a1)+,d0
	beq.s	Lfe9434
Lfe942a:
	move.b	d0,(a4)+
	dbra.w	d1,Lfe93c6
Lfe9430:
	moveq.l	#$ff,d0
	rts

Lfe9434:
	clr.b	(a4)
	rts

Lfe9438:
	move.b	#$2f,d0			;'/'
	bra.s	Lfe942a

Lfe943e:
	move.b	(a1)+,d0
	beq.s	Lfe9434
	cmp.b	#$20,d0			;' '
	beq.s	Lfe943e
	cmp.b	#$2e,d0			;'.'
	bne.s	Lfe9430
	bra.s	Lfe942a

Lfe9450:
	clr.b	(a2)
Lfe9452:
	move.b	(a1)+,d0
	beq.w	Lfe9742
	cmp.b	#$20,d0			;' '
	beq.s	Lfe9452
	cmpi.b	#$3a,(a1)		;':'
	bne.s	Lfe948e
	or.b	#$20,d0
	sub.b	#$61,d0			;'a'
	cmp.b	#$1a,d0
	bcc.w	Lfe97b6
	move.b	($0000d8dc),d1
	cmp.b	d0,d1
	bcs.w	Lfe97b2
	move.b	d0,($0001,a2)
	addq.l	#1,a1
	move.b	(a1)+,d0
	beq.w	Lfe974c
	bra.s	Lfe9498

Lfe948e:
	move.b	($0000d8dd),d1
	move.b	d1,($0001,a2)
Lfe9498:
	clr.l	d2
	move.l	a1,d1
Lfe949c:
	cmp.b	#$80,d0
	bcs.s	Lfe94ba
	cmp.b	#$a0,d0
	bcs.s	Lfe94ae
	cmp.b	#$e0,d0
	bcs.s	Lfe94ba
Lfe94ae:
	move.b	(a1)+,d0
	beq.w	Lfe97b6
	move.b	(a1)+,d0
	bne.s	Lfe949c
	bra.s	Lfe94c6

Lfe94ba:
	cmp.b	#$2f,d0			;'/'
	bne.s	Lfe94c2
	move.l	a1,d2
Lfe94c2:
	move.b	(a1)+,d0
	bne.s	Lfe949c
Lfe94c6:
	movea.l	d1,a1
	subq.l	#1,a1
	tst.l	d2
	bne.s	Lfe951e
	cmpi.b	#$2e,(a1)		;'.'
	bne.s	Lfe9512
	move.b	($0001,a1),d0
	beq.s	Lfe9502
	cmp.b	#$2e,d0			;'.'
	bne.s	Lfe9512
	tst.b	($0002,a1)
	bne.w	Lfe97b6
	lea.l	($0002,a2),a3
	bsr.w	Lfe97c6
	bmi.w	Lfe97b2
	bsr.w	Lfe9798
	move.b	#$2f,(a3)+		;'/'
	clr.b	(a3)
	bra.w	Lfe9750

Lfe9502:
	lea.l	($0002,a2),a3
	bsr.w	Lfe97c6
	bmi.w	Lfe97b2
	bra.w	Lfe9750

Lfe9512:
	bsr.w	Lfe97c6
	bmi.w	Lfe97b2
	bra.w	Lfe95f2

Lfe951e:
	sub.l	a1,d2
	bcs.w	Lfe97ba
	lea.l	($0002,a2),a3
	move.b	(a1),d0
	cmp.b	#$2f,d0			;'/'
	beq.s	Lfe9574
	cmp.b	#$2e,d0			;'.'
	bne.s	Lfe9568
	addq.l	#1,a1
	subq.w	#1,d2
	cmpi.b	#$2e,(a1)		;'.'
	bne.s	Lfe9552
	subq.w	#1,d2
	addq.l	#1,a1
	bsr.w	Lfe97c6
	bmi.w	Lfe97b2
	bsr.w	Lfe9798
	bra.s	Lfe9580

Lfe9552:
	cmpi.b	#$2f,(a1)+		;'/'
	bne.w	Lfe97b6
	subq.w	#1,d2
	bsr.w	Lfe97c6
	bmi.w	Lfe97b2
	subq.l	#1,a3
	bra.s	Lfe9580

Lfe9568:
	bsr.w	Lfe97c6
	bmi.w	Lfe97b2
	subq.l	#1,a3
	bra.s	Lfe9580

Lfe9574:
	tst.w	d2
	beq.s	Lfe95d6
	move.b	(a1)+,d0
Lfe957a:
	move.b	d0,(a3)+
	subq.w	#1,d2
	beq.s	Lfe95d6
Lfe9580:
	tst.w	d2
	beq.s	Lfe95d6
	cmpi.b	#$2e,(a1)		;'.'
	bne.s	Lfe95b0
	addq.l	#1,a1
	subq.w	#1,d2
	move.b	(a1)+,d0
	subq.w	#1,d2
	cmp.b	#$2f,d0			;'/'
	beq.s	Lfe9580
	cmp.b	#$2e,d0			;'.'
	bne.w	Lfe97b6
	cmpi.b	#$2f,(a1)		;'/'
	bne.w	Lfe97b6
	addq.l	#1,a3
	bsr.w	Lfe9798
	bra.s	Lfe9574

Lfe95b0:
	move.b	(a1)+,d0
	cmp.b	#$2f,d0			;'/'
	beq.s	Lfe957a
	move.b	d0,(a3)+
	subq.w	#1,d2
	beq.s	Lfe95d6
	cmp.b	#$80,d0
	bcs.s	Lfe95b0
	cmp.b	#$a0,d0
	bcs.s	Lfe95d0
	cmp.b	#$e0,d0
	bcs.s	Lfe95b0
Lfe95d0:
	move.b	(a1)+,(a3)+
	subq.w	#1,d2
	bne.s	Lfe95b0
Lfe95d6:
	clr.b	(a3)+
	movem.l	a1,-(a7)
	lea.l	($0002,a2),a1
	move.l	a3,d0
	sub.l	a1,d0
	movem.l	(a7)+,a1
	cmp.l	#$00000042,d0
	bcc.w	Lfe97ba
Lfe95f2:
	tst.b	(a1)
	beq.w	Lfe9750
	cmpi.b	#$2e,(a1)		;'.'
	bne.s	Lfe9624
	addq.l	#1,a1
	move.b	(a1),d0
	beq.w	Lfe9750
	cmp.b	#$2e,d0			;'.'
	bne.w	Lfe96e0
	addq.l	#1,a1
	tst.b	(a1)
	bne.w	Lfe97b6
	bsr.w	Lfe9798
	move.b	#$2f,(a3)+		;'/'
	clr.b	(a3)+
	bra.w	Lfe9750

Lfe9624:
	move.w	#$0007,d1
	lea.l	($0043,a2),a3
Lfe962c:
	move.b	(a1)+,d0
	beq.s	Lfe9682
	cmp.b	#$2a,d0			;'*'
	beq.s	Lfe968e
	cmp.b	#$2e,d0			;'.'
	beq.s	Lfe96a2
	cmp.b	#$3a,d0			;':'
	beq.w	Lfe97b6
	cmp.b	#$3f,d0			;'?'
	bne.s	Lfe964c
	addq.b	#1,(a2)
Lfe964c:
	move.b	d0,(a3)+
	dbra.w	d1,Lfe962c
	move.w	#$0009,d1
	lea.l	($004e,a2),a3
Lfe965a:
	move.b	(a1)+,d0
	beq.s	Lfe96b4
	cmp.b	#$2a,d0			;'*'
	beq.s	Lfe96be
	cmp.b	#$2e,d0			;'.'
	beq.s	Lfe96c8
	cmp.b	#$3a,d0			;':'
	beq.w	Lfe97b6
	cmp.b	#$3f,d0			;'?'
	bne.s	Lfe967a
	addq.b	#1,(a2)
Lfe967a:
	move.b	d0,(a3)+
	dbra.w	d1,Lfe965a
	bra.s	Lfe96d0

Lfe9682:
	move.b	#$20,(a3)+		;' '
	dbra.w	d1,Lfe9682
	bra.w	Lfe9756

Lfe968e:
	addq.b	#1,(a2)
	move.b	#$3f,(a3)+		;'?'
	dbra.w	d1,Lfe968e
	move.w	#$0009,d1
	lea.l	($004e,a2),a3
	bra.s	Lfe96be

Lfe96a2:
	move.b	#$20,(a3)+		;' '
	dbra.w	d1,Lfe96a2
	move.w	#$0009,d1
	lea.l	($004e,a2),a3
	bra.s	Lfe96c8

Lfe96b4:
	clr.b	(a3)+
	dbra.w	d1,Lfe96b4
	bra.w	Lfe9758

Lfe96be:
	move.b	#$3f,(a3)+		;'?'
	dbra.w	d1,Lfe96be
	bra.s	Lfe96d0

Lfe96c8:
	clr.b	(a3)+
	dbra.w	d1,Lfe96c8
	bra.s	Lfe96e8

Lfe96d0:
	move.b	(a1)+,d0
	beq.w	Lfe9758
	cmp.b	#$2e,d0			;'.'
	bne.w	Lfe97be
	bra.s	Lfe96e8

Lfe96e0:
	bsr.w	Lfe9770
	bsr.w	Lfe9788
Lfe96e8:
	move.b	#$01,($0000d8de)
	move.w	#$0002,d1
	lea.l	($004b,a2),a3
Lfe96f8:
	move.b	(a1)+,d0
	beq.s	Lfe972a
	cmp.b	#$2a,d0			;'*'
	beq.s	Lfe9736
	cmp.b	#$3a,d0			;':'
	beq.w	Lfe97b6
	cmp.b	#$2e,d0			;'.'
	beq.w	Lfe97b6
	cmp.b	#$3f,d0			;'?'
	bne.s	Lfe971a
	addq.b	#1,(a2)
Lfe971a:
	move.b	d0,(a3)+
	dbra.w	d1,Lfe96f8
Lfe9720:
	tst.b	(a1)
	bne.w	Lfe97c2
	clr.l	d0
	rts

Lfe972a:
	move.b	#$20,(a3)+		;' '
	dbra.w	d1,Lfe972a
	clr.l	d0
	rts

Lfe9736:
	addq.b	#1,(a2)
	move.b	#$3f,(a3)+		;'?'
	dbra.w	d1,Lfe9736
	bra.s	Lfe9720

Lfe9742:
	move.b	($0000d8dd),d1
	move.b	d1,($0001,a2)
Lfe974c:
	bsr.s	Lfe97c6
	bmi.s	Lfe97b2
Lfe9750:
	bsr.s	Lfe9770
	move.b	#-$01,(a2)
Lfe9756:
	bsr.s	Lfe9788
Lfe9758:
	lea.l	($004b,a2),a3
	move.w	#$0002,d1
	move.b	($0000d8df),d0
Lfe9766:
	move.b	d0,(a3)+
	dbra.w	d1,Lfe9766
	clr.l	d0
	rts

Lfe9770:
	lea.l	($0043,a2),a3
	move.b	($0000d8df),d0
	move.w	#$0007,d1
Lfe977e:
	addq.b	#1,(a2)
	move.b	d0,(a3)+
	dbra.w	d1,Lfe977e
	rts

Lfe9788:
	lea.l	($004e,a2),a3
	move.w	#$0009,d1
Lfe9790:
	clr.b	(a3)+
	dbra.w	d1,Lfe9790
	rts

Lfe9798:
	lea.l	($0002,a2),a0
	subq.l	#2,a3
	cmpa.l	a0,a3
	beq.s	Lfe97ac
Lfe97a2:
	cmpi.b	#$2f,-(a3)		;'/'
	bne.s	Lfe97a2
	clr.l	d0
	rts

Lfe97ac:
	addq.l	#4,a7
	moveq.l	#$f3,d0
	rts

Lfe97b2:
	moveq.l	#$f1,d0
	rts

Lfe97b6:
	moveq.l	#$f3,d0
	rts

Lfe97ba:
	moveq.l	#$f3,d0
	rts

Lfe97be:
	moveq.l	#$f3,d0
	rts

Lfe97c2:
	moveq.l	#$f3,d0
	rts

Lfe97c6:
	move.b	($0001,a2),d0
	bsr.w	Lfe9090
	tst.l	d0
	bmi.s	Lfe97ea
	movea.l	d0,a0
	lea.l	($0002,a2),a3
	lea.l	($001e,a0),a0
	move.w	#$0040,d0		;'@'
Lfe97e0:
	move.b	(a0)+,(a3)+
	beq.s	Lfe97e8
	dbra.w	d0,Lfe97e0
Lfe97e8:
	clr.l	d0
Lfe97ea:
	rts

Lfe97ec:
	move.b	($000b,a1),d0
	and.b	#$18,d0
	bne.s	Lfe9832
Lfe97f6:
	move.b	($000b,a1),d0
	and.b	#$05,d0
	bne.s	Lfe9832
	movem.l	d1-d7/a0-a6,-(a7)
	move.b	#$e5,(a1)
	move.w	($001a,a1),d7
	rol.w	#8,d7
	bsr.w	Lfe8fb6
	clr.l	d0
	move.w	d7,d0
	beq.s	Lfe982c
Lfe9818:
	bsr.w	Lfe9d2c
	tst.l	d0
	bmi.s	Lfe982c
	beq.w	Lfe9c1a
	cmp.w	#$ffff,d0
	bne.s	Lfe9818
	clr.l	d0
Lfe982c:
	movem.l	(a7)+,d1-d7/a0-a6
	rts

Lfe9832:
	moveq.l	#$ed,d0
	rts

Lfe9836:
	move.l	($0014,a3),d0
	move.l	($0010,a3),d1
	eor.l	d1,d0
	and.l	#$fffffc00,d0
	beq.s	Lfe98a0
Lfe9848:
	clr.l	($001c,a3)
	move.w	($003a,a3),d1
	beq.w	Lfe9946
	clr.l	d0
	move.w	($0002,a0),d0
	divu.w	d0,d3
	move.w	d3,d0
	clr.w	d3
	swap.w	d3
	movem.l	d7,-(a7)
	move.w	d0,d7
	beq.s	Lfe9894
	move.w	d1,d0
Lfe986c:
	bsr.w	Lfe9dcc
	bmi.s	Lfe9894
	cmp.w	#$ffff,d0
	bne.s	Lfe9886
	bsr.w	Lfe9c22
	bmi.s	Lfe9894
	move.w	d0,-(a7)
	bsr.w	Lfe9d46
	move.w	(a7)+,d0
Lfe9886:
	tst.w	d0
	beq.w	Lfe9c1a
	move.w	d0,d1
	subq.w	#1,d7
	bne.s	Lfe986c
	clr.l	d0
Lfe9894:
	movem.l	(a7)+,d7
	bsr.w	Lfe992a
	tst.l	d0
	rts

Lfe98a0:
	move.w	($000e,a3),d1
	beq.s	Lfe9848
	cmp.w	#$ffff,d1
	beq.s	Lfe9848
	clr.l	d0
	move.w	($0002,a0),d0
	divu.w	d0,d3
	move.w	d3,d0
	clr.w	d3
	swap.w	d3
	clr.l	d0
	rts

Lfe98be:
	move.w	($000e,a3),d1
	beq.s	Lfe98ea
	cmp.w	#$ffff,d1
	beq.s	Lfe98ea
	move.w	($0002,a0),d0
	divu.w	d0,d3
	clr.w	d3
	swap.w	d3
	clr.l	d0
	rts

Lfe98d8:
	move.l	($0014,a3),d0
	move.l	($0010,a3),d1
	eor.l	d1,d0
	and.l	#$fffffc00,d0
	beq.s	Lfe98be
Lfe98ea:
	clr.l	($001c,a3)
	move.w	($003a,a3),d1
	beq.s	Lfe9946
	clr.l	d0
	move.w	($0002,a0),d0
	divu.w	d0,d3
	move.w	d3,d0
	clr.w	d3
	swap.w	d3
	movem.l	d7,-(a7)
	move.w	d0,d7
	beq.s	Lfe991e
	move.w	d1,d0
Lfe990c:
	bsr.w	Lfe9dcc
	bmi.s	Lfe9920
	tst.w	d0
	beq.w	Lfe9c1a
	subq.w	#1,d7
	bne.s	Lfe990c
	move.w	d0,d1
Lfe991e:
	clr.l	d0
Lfe9920:
	movem.l	(a7)+,d7
	bsr.s	Lfe992a
	tst.l	d0
	rts

Lfe992a:
	cmp.w	#$ffff,d1
	beq.s	Lfe9936
	subq.w	#2,d1
	add.w	($000c,a0),d1
Lfe9936:
	rts

Lfe9938:
	sub.w	($000c,a0),d1
	bcs.s	Lfe9942
	addq.w	#2,d1
	rts

Lfe9942:
	clr.w	d1
	rts

Lfe9946:
	moveq.l	#$e7,d0
	rts

Lfe994a:
	move.w	($0002,a2),d0
	cmp.w	#$2f00,d0
	bne.s	Lfe9980
	move.w	($0010,a0),d1
	move.w	($000a,a0),d2
	clr.l	d0
	rts

Lfe9960:
	move.w	($000c,a0),d0
	cmp.w	d0,d1
	bcc.w	Lfe9ac8
	addq.w	#1,d1
	cmp.w	d0,d1
	rts

Lfe9970:
	move.w	($000c,a0),d0
	cmp.w	d0,d1
	bcc.w	Lfe9ac8
	addq.w	#1,d1
	cmp.w	d0,d1
	rts

Lfe9980:
	movem.l	d3-d7/a0-a6,-(a7)
	pea.l	($001e,a0)
	pea.l	($0002,a2)
	bsr.w	Lfe8624
	lea.l	($0008,a7),a7
	beq.s	Lfe999a
	bsr.s	Lfe99ac
	bra.s	Lfe99a6

Lfe999a:
	move.w	($001c,a0),d1
	bsr.s	Lfe992a
	move.w	#$7fff,d2
	clr.l	d0
Lfe99a6:
	movem.l	(a7)+,d3-d7/a0-a6
	rts

Lfe99ac:
	lea.l	($0003,a2),a5
Lfe99b0:
	lea.l	(-$000c,a7),a7
	move.w	($0010,a0),d1
	move.w	($000a,a0),d2
Lfe99bc:
	clr.l	d0
	moveq.l	#$07,d3
	movea.l	a7,a2
Lfe99c2:
	move.b	(a5)+,d0
	beq.w	Lfe9aa2
	cmp.b	#$2f,d0			;'/'
	beq.s	Lfe99ee
	cmp.b	#$2e,d0			;'.'
	beq.s	Lfe99f0
	move.b	d0,(a2)+
	dbra.w	d3,Lfe99c2
Lfe99da:
	move.b	(a5)+,d0
	beq.w	Lfe9aa2
	cmp.b	#$2f,d0			;'/'
	beq.s	Lfe99fa
	cmp.b	#$2e,d0			;'.'
	bne.s	Lfe99da
	bra.s	Lfe99fc

Lfe99ee:
	subq.l	#1,a5
Lfe99f0:
	move.b	#$20,(a2)+		;' '
	dbra.w	d3,Lfe99f0
	bra.s	Lfe99fc

Lfe99fa:
	subq.l	#1,a5
Lfe99fc:
	moveq.l	#$02,d3
Lfe99fe:
	move.b	(a5)+,d0
	beq.w	Lfe9aa2
	cmp.b	#$2f,d0			;'/'
	beq.s	Lfe9a1e
	move.b	d0,(a2)+
	dbra.w	d3,Lfe99fe
Lfe9a10:
	move.b	(a5)+,d0
	beq.w	Lfe9aa2
	cmp.b	#$2f,d0			;'/'
	beq.s	Lfe9a26
	bra.s	Lfe9a10

Lfe9a1e:
	move.b	#$20,(a2)+		;' '
	dbra.w	d3,Lfe9a1e
Lfe9a26:
	movea.l	a7,a2
	move.w	($0002,a0),d3
	move.w	d2,d4
	lsr.w	#5,d3
	subq.w	#1,d3
Lfe9a32:
	bsr.w	Lfe8da6
	tst.l	d0
	bmi.s	Lfe9aa2
	moveq.l	#$10,d0
	bsr.w	Lfe8fd2
	move.w	d3,d6
Lfe9a42:
	movea.l	a1,a3
	movea.l	a2,a4
	move.b	(a3)+,d0
	beq.s	Lfe9a9e
	cmp.b	#$e5,d0
	beq.s	Lfe9a8a
	tst.b	($000b,a1)
	beq.s	Lfe9a5e
	moveq.l	#$10,d5
	and.b	($000b,a1),d5
	beq.s	Lfe9a8a
Lfe9a5e:
	moveq.l	#$07,d5
	cmp.b	#$05,d0
	bne.s	Lfe9a6a
	move.b	#$e5,d0
Lfe9a6a:
	bsr.w	Lfe8996
	bne.s	Lfe9a8a
	moveq.l	#$02,d5
	bsr.w	Lfe8996
	bne.s	Lfe9a8a
	move.w	($001a,a1),d1
	rol.w	#8,d1
	bsr.w	Lfe992a
	move.w	#$7fff,d2
	bra.w	Lfe99bc

Lfe9a8a:
	subq.w	#1,d2
	beq.s	Lfe9a9e
	adda.l	#$00000020,a1
	dbra.w	d6,Lfe9a42
	bsr.w	Lfe9960
	bne.s	Lfe9a32
Lfe9a9e:
	moveq.l	#$ff,d1
	moveq.l	#$fd,d0
Lfe9aa2:
	lea.l	($000c,a7),a7
	rts

Lfe9aa8:
	bsr.w	Lfe9938
	move.w	d1,d0
	bsr.w	Lfe9dcc
	tst.w	d0
	beq.w	Lfe9c1a
	cmp.w	#$ffff,d0
	beq.s	Lfe9ac6
	move.w	d0,d1
	bsr.w	Lfe992a
	tst.w	d1
Lfe9ac6:
	rts

Lfe9ac8:
	bsr.w	Lfe9938
	move.w	d1,d0
	bsr.w	Lfe9dcc
	tst.w	d0
	beq.w	Lfe9c1a
	cmp.w	#$ffff,d0
	beq.s	Lfe9ae8
	move.w	d0,d1
	bsr.w	Lfe992a
	tst.w	d1
	rts

Lfe9ae8:
	bsr.w	Lfe9c22
	bmi.s	Lfe9b14
	move.w	d0,-(a7)
	bsr.w	Lfe9d46
	move.w	(a7)+,d1
	bsr.w	Lfe992a
	movem.l	a1,-(a7)
	bsr.w	Lfe8fb6
	move.w	#$00ff,d0
Lfe9b06:
	clr.l	(a1)+
	dbra.w	d0,Lfe9b06
	movem.l	(a7)+,a1
	tst.w	d1
	rts

Lfe9b14:
	cmp.l	d0,d0
	rts

Lfe9b18:
	movem.l	d1/d3-d4,-(a7)
	move.w	d2,d3
	subq.w	#1,d3
	bsr.w	Lfe9938
Lfe9b24:
	move.w	d1,d0
	bsr.w	Lfe9dcc
	bmi.s	Lfe9b50
	tst.w	d0
	beq.w	Lfe9c1a
	cmp.w	#$ffff,d0
	beq.s	Lfe9b50
	sub.w	d0,d1
	addq.w	#1,d1
	bne.s	Lfe9b46
	move.l	d0,d1
	dbra.w	d3,Lfe9b24
	clr.w	d3
Lfe9b46:
	move.l	d0,d1
	bsr.w	Lfe992a
	clr.l	d0
	move.w	d1,d0
Lfe9b50:
	sub.w	d3,d2
	movem.l	(a7)+,d1/d3-d4
	rts

Lfe9b58:
	movem.l	d1/d3-d4,-(a7)
	move.w	d2,d3
	subq.w	#1,d3
	bsr.w	Lfe9938
Lfe9b64:
	move.w	d1,d0
	bsr.w	Lfe9dcc
	bmi.s	Lfe9ba8
	cmp.w	#$ffff,d0
	bne.s	Lfe9b82
	move.w	d1,d0
	bsr.w	Lfe9c24
	bmi.s	Lfe9ba2
	move.w	d0,-(a7)
	bsr.w	Lfe9d46
	move.w	(a7)+,d0
Lfe9b82:
	tst.w	d0
	beq.w	Lfe9c1a
	sub.w	d0,d1
	addq.w	#1,d1
	bne.s	Lfe9b96
	move.l	d0,d1
	dbra.w	d3,Lfe9b64
	clr.w	d3
Lfe9b96:
	move.l	d0,d1
	bsr.w	Lfe992a
	clr.l	d0
	move.w	d1,d0
	bra.s	Lfe9baa

Lfe9ba2:
	move.w	d1,d0
	addq.w	#1,d3
	bra.s	Lfe9b96

Lfe9ba8:
	addq.w	#1,d3
Lfe9baa:
	sub.w	d3,d2
	movem.l	(a7)+,d1/d3-d4
	rts

Lfe9bb2:
	movem.l	d0,-(a7)
	bsr.w	Lfe9938
	move.w	d1,d0
	bsr.w	Lfe9dcc
	bmi.s	Lfe9bda
	cmp.w	#$ffff,d0
	beq.s	Lfe9bda
	tst.w	d0
	beq.s	Lfe9c1a
	move.w	d0,d1
	bsr.w	Lfe992a
	moveq.l	#$ff,d0
	movem.l	(a7)+,d0
	rts

Lfe9bda:
	clr.l	d1
	movem.l	(a7)+,d0
	rts

Lfe9be2:
	movem.l	d0,-(a7)
	bsr.w	Lfe9938
	move.w	d1,d0
	bsr.w	Lfe9dcc
	bmi.s	Lfe9bda
	tst.w	d0
	beq.s	Lfe9c1a
	cmp.w	#$ffff,d0
	beq.s	Lfe9c0a
	move.w	d0,d1
Lfe9bfe:
	bsr.w	Lfe992a
	moveq.l	#$ff,d0
	movem.l	(a7)+,d0
	rts

Lfe9c0a:
	bsr.w	Lfe9c22
	bmi.s	Lfe9bda
	move.w	d0,-(a7)
	bsr.w	Lfe9d46
	move.w	(a7)+,d1
	bra.s	Lfe9bfe

Lfe9c1a:
	move.w	#$1005,d7
	trap	#14
	bra.s	Lfe9c1a

Lfe9c22:
	moveq.l	#$02,d0
Lfe9c24:
	movem.l	d1-d3,-(a7)
	move.w	($000e,a0),d1
	cmp.w	#$0ff8,d1
	bcc.s	Lfe9c62
	sub.w	d0,d1
	subq.w	#1,d1
	move.w	d0,d2
Lfe9c38:
	move.w	d2,d0
	bsr.w	Lfe9dcc
	bmi.s	Lfe9c4a
	beq.s	Lfe9c52
	addq.w	#1,d2
	subq.w	#1,d1
	bne.s	Lfe9c38
	moveq.l	#$e9,d0
Lfe9c4a:
	movem.l	(a7)+,d1-d3
	tst.l	d0
	rts

Lfe9c52:
	move.w	#$ffff,d0
	move.w	d2,d1
	bsr.w	Lfe9d46
	clr.l	d0
	move.w	d2,d0
	bra.s	Lfe9c4a

Lfe9c62:
	movem.l	d4-d6/a1-a2,-(a7)
	clr.l	d6
	move.w	d0,d6
	move.w	d0,d4
	and.w	#$01ff,d4
	move.w	#$01ff,d5
	sub.w	d4,d5
	sub.w	d0,d1
	move.w	d1,d4
	subq.w	#1,d4
	and.l	#$0000ffff,d0
	add.l	d0,d0
	bsr.w	Lfe9e76
	bmi.s	Lfe9caa
Lfe9c8a:
	tst.w	(a2)+
	beq.s	Lfe9cb0
	addq.w	#1,d6
	subq.w	#1,d4
	beq.s	Lfe9ca8
	dbra.w	d5,Lfe9c8a
	move.w	#$01ff,d5
	clr.l	d2
	addq.w	#1,d1
	bsr.w	Lfe9e86
	bmi.s	Lfe9caa
	bra.s	Lfe9c8a

Lfe9ca8:
	moveq.l	#$e9,d0
Lfe9caa:
	movem.l	(a7)+,d4-d6/a1-a2
	bra.s	Lfe9c4a

Lfe9cb0:
	move.w	#$ffff,-(a2)
	bsr.w	Lfe8fc0
	move.l	d6,d0
	bra.s	Lfe9caa

Lfe9cbc:
	moveq.l	#$02,d0
	movem.l	d1-d3,-(a7)
	clr.l	d3
	move.w	($000e,a0),d1
	cmp.w	#$0ff8,d1
	bcc.s	Lfe9cee
	sub.w	d0,d1
	subq.w	#2,d1
	move.w	d0,d2
Lfe9cd4:
	move.w	d2,d0
	bsr.w	Lfe9dcc
	bmi.w	Lfe9c4a
	bne.s	Lfe9ce2
	addq.l	#1,d3
Lfe9ce2:
	addq.w	#1,d2
	dbra.w	d1,Lfe9cd4
	move.l	d3,d0
	bra.w	Lfe9c4a

Lfe9cee:
	movem.l	d4-d5/a1-a2,-(a7)
	sub.w	d0,d1
	move.w	d1,d4
	subq.w	#1,d4
	add.l	d0,d0
	bsr.w	Lfe9e76
	bmi.s	Lfe9d24
	move.w	#$01fd,d5
Lfe9d04:
	tst.w	(a2)+
	bne.s	Lfe9d0a
	addq.l	#1,d3
Lfe9d0a:
	subq.w	#1,d4
	beq.s	Lfe9d22
	dbra.w	d5,Lfe9d04
	move.w	#$01ff,d5
	clr.l	d2
	addq.w	#1,d1
	bsr.w	Lfe9e86
	bmi.s	Lfe9d24
	bra.s	Lfe9d04

Lfe9d22:
	move.l	d3,d0
Lfe9d24:
	movem.l	(a7)+,d4-d5/a1-a2
	bra.w	Lfe9c4a

Lfe9d2c:
	movem.l	d1,-(a7)
	move.w	d0,d1
	bsr.w	Lfe9dcc
	bmi.s	Lfe9d40
	move.l	d0,-(a7)
	clr.w	d0
	bsr.s	Lfe9d46
	move.l	(a7)+,d0
Lfe9d40:
	movem.l	(a7)+,d1
	rts

Lfe9d46:
	movem.l	d1-d3/a1-a2,-(a7)
	cmpi.w	#$0ff8,($000e,a0)
	bcc.s	Lfe9db6
	move.w	d0,d2
	move.w	d1,d0
	move.w	d1,d3
	bsr.w	Lfe9e1a
	bmi.s	Lfe9dae
	btst.l	#$00,d3
	beq.s	Lfe9d84
	clr.l	d0
	move.b	(a2),d0
	ror.w	#4,d2
	move.b	d2,(a2)
	ror.w	#8,d2
	and.w	#$00f0,d2
	asl.w	#8,d0
	move.b	(a1),d0
	move.b	d0,d1
	and.w	#$000f,d1
	or.b	d2,d1
	move.b	d1,(a1)
	lsr.w	#4,d0
	bra.s	Lfe9da4

Lfe9d84:
	clr.l	d0
	move.b	(a2),d0
	ror.w	#8,d2
	and.b	#$0f,d2
	move.w	d0,d1
	and.b	#$f0,d1
	or.b	d2,d1
	move.b	d1,(a2)
	asl.w	#8,d0
	ror.w	#8,d2
	move.b	(a1),d0
	move.b	d2,(a1)
	and.w	#$0fff,d0
Lfe9da4:
	cmp.w	#$0fff,d0
	bne.s	Lfe9dae
	move.w	#$ffff,d0
Lfe9dae:
	movem.l	(a7)+,d1-d3/a1-a2
	tst.l	d0
	rts

Lfe9db6:
	move.w	d0,d2
	move.w	d1,d0
	bsr.w	Lfe9e9c
	bmi.s	Lfe9dae
	bsr.w	Lfe8fc0
	clr.l	d0
	move.w	(a2),d0
	move.w	d2,(a2)
	bra.s	Lfe9dae

Lfe9dcc:
	movem.l	d1/a1-a2,-(a7)
	cmpi.w	#$0ff8,($000e,a0)
	bcc.s	Lfe9e0e
	move.w	d0,d1
	bsr.s	Lfe9e46
	bmi.s	Lfe9e06
	btst.l	#$00,d1
	beq.s	Lfe9df0
	clr.l	d0
	move.b	(a2),d0
	asl.w	#8,d0
	move.b	(a1),d0
	lsr.w	#4,d0
	bra.s	Lfe9dfc

Lfe9df0:
	clr.l	d0
	move.b	(a2),d0
	asl.w	#8,d0
	move.b	(a1),d0
	and.w	#$0fff,d0
Lfe9dfc:
	cmp.w	#$0fff,d0
	bne.s	Lfe9e06
	move.w	#$ffff,d0
Lfe9e06:
	movem.l	(a7)+,d1/a1-a2
	tst.l	d0
	rts

Lfe9e0e:
	bsr.w	Lfe9e9c
	bmi.s	Lfe9e06
	clr.l	d0
	move.w	(a2),d0
	bra.s	Lfe9e06

Lfe9e1a:
	movem.l	d1-d2/a3,-(a7)
	bsr.s	Lfe9e6a
	bmi.s	Lfe9e40
	bsr.w	Lfe8fc0
	movea.l	a2,a3
	addq.l	#1,a2
	cmp.w	#$03ff,d2
	bne.s	Lfe9e3c
	clr.l	d2
	addq.w	#1,d1
	bsr.s	Lfe9e86
	bmi.s	Lfe9e40
	bsr.w	Lfe8fc0
Lfe9e3c:
	movea.l	a3,a1
	clr.l	d0
Lfe9e40:
	movem.l	(a7)+,d1-d2/a3
	rts

Lfe9e46:
	movem.l	d1-d2/a3,-(a7)
	bsr.s	Lfe9e6a
	bmi.s	Lfe9e64
	movea.l	a2,a3
	addq.l	#1,a2
	cmp.w	#$03ff,d2
	bne.s	Lfe9e60
	clr.l	d2
	addq.w	#1,d1
	bsr.s	Lfe9e86
	bmi.s	Lfe9e64
Lfe9e60:
	movea.l	a3,a1
	clr.l	d0
Lfe9e64:
	movem.l	(a7)+,d1-d2/a3
	rts

Lfe9e6a:
	clr.l	d1
	move.w	d0,d1
	move.l	d1,d0
	add.l	d1,d1
	add.l	d1,d0
	lsr.l	#1,d0
Lfe9e76:
	divu.w	#$0400,d0
	move.w	($0006,a0),d1
	add.w	d0,d1
	swap.w	d0
	clr.l	d2
	move.w	d0,d2
Lfe9e86:
	bsr.w	Lfe8da6
	tst.l	d0
	bmi.s	Lfe9e9a
	moveq.l	#$20,d0			;' '
	bsr.w	Lfe8fd2
	movea.l	a1,a2
	adda.l	d2,a2
	clr.l	d0
Lfe9e9a:
	rts

Lfe9e9c:
	movem.l	d1-d2,-(a7)
	and.l	#$0000ffff,d0
	add.l	d0,d0
	bsr.s	Lfe9e76
	movem.l	(a7)+,d1-d2
	rts

Lfe9eb0:
	suba.l	#$0000001a,a7
	movea.l	a7,a5
	move.b	#$17,($0000.w,a5)
	move.b	#$00,($0002,a5)
	move.l	#$0000b7b0,d1
Lfe9eca:
	bsr.w	Lfe9f7e
	bpl.s	Lfe9eca
	bsr.s	Lfe9f40
	adda.l	#$0000001a,a7
	rts

Lfe9eda:
	movem.l	d1-d3/a1-a3,-(a7)
	movea.l	#$0000b7b0,a1
	moveq.l	#$ff,d0
Lfe9ee6:
	btst.b	#$07,($0004,a1)
	beq.s	Lfe9f30
	lea.l	($000e,a1),a2
	movea.l	a0,a3
	move.w	#$0007,d1
Lfe9ef8:
	move.b	(a3)+,d2
	move.b	(a2)+,d3
	cmp.b	d3,d2
	bne.s	Lfe9f08
Lfe9f00:
	dbra.w	d1,Lfe9ef8
	move.l	a1,d0
	bra.s	Lfe9f30

Lfe9f08:
	sub.b	d2,d3
	cmp.b	#$20,d3			;' '
	beq.s	Lfe9f24
	cmp.b	#$e0,d3
	bne.s	Lfe9f30
	cmp.b	#$61,d2			;'a'
	bcs.s	Lfe9f30
	cmp.b	#$7b,d2			;'{'
	bcs.s	Lfe9f00
	bra.s	Lfe9f30

Lfe9f24:
	cmp.b	#$41,d2			;'A'
	bcs.s	Lfe9f30
	cmp.b	#$5b,d2			;'['
	bcs.s	Lfe9f00
Lfe9f30:
	movea.l	(a1),a1
	cmpa.l	#$ffffffff,a1
	bne.s	Lfe9ee6
	movem.l	(a7)+,d1-d3/a1-a3
	rts

Lfe9f40:
	move.l	#$0000cd14,d1
	move.l	d1,(a1)
	clr.l	d0
	tst.b	($00ed002d)
	beq.s	Lfe9f64
	bsr.s	Lfe9f7e
	move.l	#$0000ccaa,d1
	move.l	d1,(a1)
	move.b	($0000d8dc),d0
	addq.b	#1,d0
Lfe9f64:
	move.b	d0,($0000d8dd)
	bsr.s	Lfe9f7e
	move.l	#$0000c64e,d1
	move.l	d1,(a1)
	bsr.s	Lfe9f7e
	move.l	#$0000c8a2,d1
	move.l	d1,(a1)
Lfe9f7e:
	movea.l	d1,a1
	move.b	($0000d8dc),d0
	addq.b	#1,d0
	move.b	d0,($0016,a5)
	movea.l	($0006,a1),a4
	jsr	(a4)
	movea.l	($000a,a1),a4
	jsr	(a4)
	btst.b	#$07,($0004,a1)
	bne.s	Lfe9fac
	tst.b	($000d,a5)
	beq.s	Lfe9fac
	movea.l	a5,a0
	bsr.w	Lfe91ce
Lfe9fac:
	move.l	(a1),d1
	rts

Lfe9fb0:
	.dc.b	$00,$00,$b8,$48,$80,$24,$00,$00
	.dc.b	$b7,$fe,$00,$00,$b8,$06,$4e,$55
	.dc.b	$4c,$20,$20,$20,$20,$20,$00,$00
	.dc.b	$00,$00,$00,$00,$b8,$3c,$00,$00
	.dc.b	$b8,$44,$00,$00,$b8,$44,$00,$00
	.dc.b	$b8,$44,$00,$00,$b8,$44,$00,$00
	.dc.b	$b8,$44,$00,$00,$b8,$44,$00,$00
	.dc.b	$b8,$44,$00,$00,$b8,$44,$00,$00
	.dc.b	$b8,$44,$00,$00,$b8,$44,$00,$00
	.dc.b	$b8,$44,$00,$00,$b8,$44,$23,$cd
	.dc.b	$00,$00,$b7,$c6,$4e,$75
Lfea006:
	movem.l	d0/a4-a5,-(a7)
	movea.l	($0000b7c6),a5
	lea.l	($0000b7ca),a4
Lfea016:
	clr.l	d0
	move.b	($0002,a5),d0
	add.w	d0,d0
	add.w	d0,d0
	adda.l	d0,a4
	movea.l	(a4),a4
	jsr	(a4)
	move.b	d0,($0003,a5)
	lsr.w	#8,d0
	move.b	d0,($0004,a5)
	movem.l	(a7)+,d0/a4-a5
	rts

Lfea036:
	move.w	#$5003,d0
	rts

Lfea03c:
	move.l	#$0000cfa0,($000e,a5)
Lfea044:
	clr.w	d0
	rts

Lfea048:
	.dc.b	$00,$00,$c3,$44,$80,$03,$00,$00
	.dc.b	$b8,$96,$00,$00,$b8,$9e,$43,$4f
	.dc.b	$4e,$20,$20,$20,$20,$20,$00,$00
	.dc.b	$00,$00,$00,$00,$b8,$b2,$00,$00
	.dc.b	$b8,$36,$00,$00,$b8,$36,$00,$00
	.dc.b	$b8,$36,$00,$00,$be,$d4,$00,$00
	.dc.b	$be,$f4,$00,$00,$bf,$00,$00,$00
	.dc.b	$bf,$04,$00,$00,$b8,$e4,$00,$00
	.dc.b	$b8,$e4,$00,$00,$b9,$04,$00,$00
	.dc.b	$b8,$44,$00,$00,$b8,$36,$23,$cd
	.dc.b	$00,$00,$b8,$5e,$4e,$75
Lfea09e:
	movem.l	d0/a4-a5,-(a7)
	movea.l	($0000b85e),a5
	lea.l	($0000b862),a4
	bra.w	Lfea016

Lfea0b2:
	movem.l	d1-d2,-(a7)
	moveq.l	#$10,d1
	IOCS	_CRTMOD
	clr.l	d1
	move.l	#$005f001e,d2
	IOCS	_B_CONSOL
	move.l	#$0000b90e,d1
	moveq.l	#$37,d0			;'7'
	trap	#15
	IOCS	_B_SFTSNS
	move.w	d0,($0000fae6)
	movem.l	(a7)+,d1-d2
	bra.w	Lfea03c

Lfea0e4:
	movem.l	d1/d3/a1,-(a7)
	move.l	($0012,a5),d3
	beq.s	Lfea0fc
	movea.l	($000e,a5),a1
	clr.l	d1
Lfea0f4:
	move.b	(a1)+,d1
	bsr.s	Lfea108
	subq.l	#1,d3
	bne.s	Lfea0f4
Lfea0fc:
	movem.l	(a7)+,d1/d3/a1
	bra.w	Lfea044

Lfea104:
	bra.w	Lfea044

Lfea108:
	IOCS	_B_PUTC
	rts

Lfea10e:
	move.b	(a0)+,d0
	cmp.b	#$5b,d0			;'['
	bne.s	Lfea15e
	move.b	(a0)+,d0
	cmp.b	#$36,d0			;'6'
	bne.s	Lfea160
	cmpi.b	#$6e,(a0)		;'n'
	bne.s	Lfea15e
	lea.l	($0000fac4),a0
	move.l	a0,($0000fac0)
	move.b	#$1b,(a0)+
	move.b	#$5b,(a0)+		;'['
	movem.l	d1-d2,-(a7)
	moveq.l	#$ff,d1
	IOCS	_B_LOCATE
	move.l	d1,d2
	addq.w	#1,d1
	bsr.s	Lfea186
	move.b	#$3b,(a0)+		;';'
	move.l	d2,d1
	swap.w	d1
	addq.w	#1,d1
	bsr.s	Lfea186
	movem.l	(a7)+,d1-d2
	move.b	#$52,(a0)+		;'R'
	clr.b	(a0)
Lfea15e:
	rts

Lfea160:
	cmp.b	#$3e,d0			;'>'
	bne.s	Lfea15e
	cmpi.b	#$31,(a0)+		;'1'
	bne.s	Lfea15e
	move.b	(a0),d0
	cmp.b	#$68,d0			;'h'
	beq.s	Lfea180
	cmp.b	#$6c,d0			;'l'
	bne.s	Lfea15e
	clr.l	d1
	bra.w	Lfea278

Lfea180:
	moveq.l	#$03,d1
	bra.w	Lfea278

Lfea186:
	and.l	#$000000ff,d1
	divu.w	#$0064,d1
	tst.w	d1
	beq.s	Lfea19c
	add.b	#$30,d1			;'0'
	move.b	d1,(a0)+
	clr.w	d1
Lfea19c:
	swap.w	d1
	divu.w	#$000a,d1
	tst.w	d1
	beq.s	Lfea1ac
	add.b	#$30,d1			;'0'
	move.b	d1,(a0)+
Lfea1ac:
	swap.w	d1
	add.b	#$30,d1			;'0'
	move.b	d1,(a0)+
	rts

Lfea1b6:
	move.w	(a6)+,d1
	move.l	(a6),d2
	cmp.w	#$0013,d1
	bcc.s	Lfea1d2
	asl.w	#2,d1
	lea.l	($0000b9d6),a0
	movea.l	(a0,d1.w),a0
	move.l	d2,d1
	swap.w	d1
	jmp	(a0)

Lfea1d2:
	moveq.l	#$ff,d0
	rts

Lfea1d6:
	.dc.b	$00,$00,$ba,$22,$00,$00,$ba,$28
	.dc.b	$00,$00,$ba,$30,$00,$00,$ba,$36
	.dc.b	$00,$00,$ba,$3c,$00,$00,$ba,$42
	.dc.b	$00,$00,$ba,$48,$00,$00,$ba,$4e
	.dc.b	$00,$00,$ba,$54,$00,$00,$ba,$5a
	.dc.b	$00,$00,$ba,$60,$00,$00,$ba,$66
	.dc.b	$00,$00,$ba,$6c,$00,$00,$ba,$72
	.dc.b	$00,$00,$ba,$78,$00,$00,$ba,$e8
	.dc.b	$00,$00,$bb,$30,$00,$00,$bb,$9e
	.dc.b	$00,$00,$bb,$a4,$70,$20,$4e,$4f
	.dc.b	$4e,$75
Lfea228:
	movea.l	d2,a1
	IOCS	_B_PRINT
	rts

Lfea230:
	IOCS	_B_COLOR
	rts

Lfea236:
	IOCS	_B_LOCATE
	rts

Lfea23c:
	IOCS	_B_DOWN_S
	rts

Lfea242:
	IOCS	_B_UP_S
	rts

Lfea248:
	IOCS	_B_UP
	rts

Lfea24e:
	IOCS	_B_DOWN
	rts

Lfea254:
	IOCS	_B_RIGHT
	rts

Lfea25a:
	IOCS	_B_LEFT
	rts

Lfea260:
	IOCS	_B_CLR_ST
	rts

Lfea266:
	IOCS	_B_ERA_ST
	rts

Lfea26c:
	IOCS	_B_INS
	rts

Lfea272:
	IOCS	_B_DEL
	rts

Lfea278:
	bsr.w	Lfea6c2
	clr.l	d0
	move.b	($0000f706),d0
	cmp.b	#$02,d1
	bcs.s	Lfea2dc
	beq.s	Lfea2d6
	cmp.b	#$03,d1
	bne.s	Lfea2d4
	cmp.b	d0,d1
	beq.s	Lfea2d4
	bsr.s	Lfea2b4
	movem.l	d1-d2,-(a7)
	moveq.l	#$ff,d1
	moveq.l	#$ff,d2
	IOCS	_B_CONSOL
	clr.l	d1
	move.w	#$001f,d2
	IOCS	_B_CONSOL
	movem.l	(a7)+,d1-d2
	rts

Lfea2b4:
	movem.l	d0-d5/a1,-(a7)
	move.b	d1,($0000f706)
	lea.l	($0000bae6),a1
	moveq.l	#$03,d1
	clr.l	d2
	moveq.l	#$1f,d3
	moveq.l	#$7f,d4
	IOCS	_B_PUTMES
	movem.l	(a7)+,d0-d5/a1
Lfea2d4:
	rts

Lfea2d6:
	bsr.w	Lfea3e4
	bra.s	Lfea2b4

Lfea2dc:
	bsr.w	Lfea3e4
	bsr.s	Lfea2b4
	bra.w	Lfea3ae

Lfea2e6:
	move.l	d0,d0
	move.w	d1,d0
	add.w	d2,d0
	cmp.w	#$0021,d0		;'!'
	bcc.w	Lfea1d2
	cmpi.b	#$03,($0000f706)
	beq.s	Lfea306
	cmp.w	#$0020,d0		;' '
	beq.w	Lfea1d2
Lfea306:
	asl.w	#4,d1
	and.l	#$0000ffff,d1
	subq.w	#1,d2
	movem.l	d1-d2,-(a7)
	moveq.l	#$2e,d0			;'.'
	moveq.l	#$ff,d1
	moveq.l	#$ff,d2
	trap	#15
	swap.w	d2
	move.w	d2,d0
	movem.l	(a7)+,d1-d2
	swap.w	d2
	move.w	d0,d2
	swap.w	d2
	IOCS	_B_CONSOL
	rts

Lfea330:
	clr.l	d0
	move.b	($0000f707),d0
	cmp.w	#$0006,d1
	bcc.s	Lfea390
	move.l	d0,-(a7)
	bsr.w	Lfea6c2
	move.b	d1,($0000f707)
	add.w	d1,d1
	lea.l	($0000bb92),a0
	move.w	(a0,d1.w),d1
	move.w	d1,-(a7)
	and.w	#$00ff,d1
	IOCS	_CRTMOD
	move.w	(a7)+,d0
	bpl.s	Lfea36a
	move.w	#$0090,d0
	trap	#15
Lfea36a:
	moveq.l	#$2e,d0			;'.'
	moveq.l	#$ff,d1
	moveq.l	#$ff,d2
	trap	#15
	cmpi.b	#$03,($0000f706)
	beq.s	Lfea37e
	subq.l	#1,d2
Lfea37e:
	IOCS	_B_CONSOL
	cmpi.b	#$02,($0000f706)
	bcc.s	Lfea38e
	bsr.s	Lfea3ae
Lfea38e:
	move.l	(a7)+,d0
Lfea390:
	rts

Lfea392:
	.dc.b	$00,$10,$ff,$10,$00,$04,$ff,$04
	.dc.b	$ff,$08,$ff,$0c,$70,$ae,$4e,$4f
	.dc.b	$4e,$75
Lfea3a4:
	IOCS	_OS_CUROF
	rts

Lfea3aa:
	bsr.w	Lfea6c2
Lfea3ae:
	movem.l	d0/a6,-(a7)
	cmpi.b	#$03,($0000f706)
	beq.s	Lfea3de
	lea.l	($0000f708),a6
	clr.w	d0
	move.b	($0000f706),d0
	beq.s	Lfea3dc
	cmp.b	#$01,d0
	bne.s	Lfea3de
	adda.l	#$00000140,a6
	move.b	#$2a,d0			;'*'
Lfea3dc:
	bsr.s	Lfea432
Lfea3de:
	movem.l	(a7)+,d0/a6
	rts

Lfea3e4:
	movem.l	d0,-(a7)
	cmp.b	#$03,d0
	bcs.s	Lfea42c
	movem.l	d1-d3,-(a7)
	cmpi.b	#$03,($0000f706)
	bne.s	Lfea416
	moveq.l	#$ff,d1
	IOCS	_B_LOCATE
	move.l	d0,d3
	cmp.w	#$001f,d3
	bne.s	Lfea410
	IOCS	_B_DOWN_S
	subq.w	#1,d3
Lfea410:
	move.l	d3,d1
	IOCS	_B_LOCATE
Lfea416:
	moveq.l	#$ff,d1
	moveq.l	#$ff,d2
	IOCS	_B_CONSOL
	clr.l	d1
	move.w	#$001e,d2
	IOCS	_B_CONSOL
	movem.l	(a7)+,d1-d3
Lfea42c:
	movem.l	(a7)+,d0
	rts

Lfea432:
	movem.l	d0-d7/a0-a5,-(a7)
	clr.w	-(a7)
	movea.l	a7,a1
	move.b	d0,(a1)
	moveq.l	#$03,d1
	clr.l	d2
	moveq.l	#$1f,d3
	moveq.l	#$00,d4
	IOCS	_B_PUTMES
	addq.l	#2,a7
	move.w	#$0004,d7
	moveq.l	#$02,d5
	bsr.s	Lfea46c
	move.w	#$0004,d7
	moveq.l	#$32,d5			;'2'
	cmpi.b	#$16,($00e80029)
	beq.s	Lfea464
	moveq.l	#$21,d5			;'!'
Lfea464:
	bsr.s	Lfea46c
	movem.l	(a7)+,d0-d7/a0-a5
	rts

Lfea46c:
	movea.l	a6,a1
	moveq.l	#$0b,d1
	clr.l	d2
	move.w	d5,d2
	moveq.l	#$1f,d3
	moveq.l	#$07,d4
	cmpi.b	#$16,($00e80029)
	beq.s	Lfea484
	moveq.l	#$04,d4
Lfea484:
	IOCS	_B_PUTMES
	addq.w	#1,d2
	move.w	d2,d5
	lea.l	($0020,a6),a6
	dbra.w	d7,Lfea46c
	rts

Lfea496:
	move.w	(a6)+,d0
	cmp.w	#$000c,d0
	bcc.s	Lfea4ac
	asl.w	#2,d0
	lea.l	($0000bcb0),a0
	movea.l	(a0,d0.w),a0
	jmp	(a0)

Lfea4ac:
	moveq.l	#$ff,d0
	rts

Lfea4b0:
	.dc.b	$00,$00,$bc,$e0,$00,$00,$bc,$ee
	.dc.b	$00,$00,$bc,$f2,$00,$00,$bd,$36
	.dc.b	$00,$00,$bd,$3c,$00,$00,$bd,$4c
	.dc.b	$00,$00,$bd,$50,$00,$00,$bd,$66
	.dc.b	$00,$00,$bd,$ae,$00,$00,$bd,$c6
	.dc.b	$00,$00,$bd,$ca,$00,$00,$bd,$e4
	.dc.b	$70,$17,$61,$00,$01,$06,$61,$00
	.dc.b	$01,$6e,$70,$10,$4e,$75
Lfea4ee:
	moveq.l	#$03,d1
	bra.s	Lfea4f4

Lfea4f2:
	moveq.l	#$0b,d1
Lfea4f4:
	moveq.l	#$10,d4
	moveq.l	#$50,d7			;'P'
	cmpi.b	#$16,($00e80029)
	beq.s	Lfea504
	moveq.l	#$30,d7			;'0'
Lfea504:
	clr.l	d2
	clr.l	d3
	move.w	(a6)+,d2
	sub.w	d2,d4
	bcs.s	Lfea52e
	add.w	d7,d2
	move.w	#$001f,d3
	movea.l	(a6),a1
	moveq.l	#$ff,d0
Lfea518:
	addq.l	#1,d0
	tst.b	(a1)+
	bne.s	Lfea518
	cmp.w	d0,d4
	bcs.s	Lfea524
	move.w	d0,d4
Lfea524:
	subq.w	#1,d4
	bmi.s	Lfea52e
	movea.l	(a6),a1
	IOCS	_B_PUTMES
Lfea52e:
	clr.l	d0
	move.w	d2,d0
	sub.w	d7,d0
	rts

Lfea536:
	moveq.l	#$18,d0
	bra.w	Lfea5ea

Lfea53c:
	moveq.l	#$50,d0			;'P'
	cmpi.b	#$16,($00e80029)
	beq.s	Lfea54a
	moveq.l	#$30,d0			;'0'
Lfea54a:
	rts

Lfea54c:
	moveq.l	#$03,d1
	bra.s	Lfea552

Lfea550:
	moveq.l	#$0b,d1
Lfea552:
	moveq.l	#$00,d7
	move.w	#$0050,d4		;'P'
	cmpi.b	#$16,($00e80029)
	beq.s	Lfea504
	moveq.l	#$30,d4			;'0'
	bra.s	Lfea504

Lfea566:
	clr.l	d5
	move.w	(a6),d5
	moveq.l	#$4f,d4			;'O'
	cmpi.b	#$16,($00e80029)
	beq.s	Lfea578
	moveq.l	#$2f,d4			;'/'
Lfea578:
	sub.l	d5,d4
	bcs.s	Lfea5ac
	move.w	#$000f,d2
	moveq.l	#$7f,d3
	sub.l	d4,d3
	lea.l	($00e0f800),a2
	adda.l	d5,a2
	movem.l	d0-d3,-(a7)
	bsr.s	Lfea59e
	movem.l	(a7)+,d0-d3
	lea.l	($00e2f800),a2
	adda.l	d5,a2
Lfea59e:
	move.w	d4,d1
Lfea5a0:
	clr.b	(a2)+
	dbra.w	d1,Lfea5a0
	adda.l	d3,a2
	dbra.w	d2,Lfea59e
Lfea5ac:
	rts

Lfea5ae:
	moveq.l	#$17,d0
	bsr.s	Lfea61a
	bsr.w	Lfea684
	moveq.l	#$50,d0			;'P'
	cmpi.b	#$16,($00e80029)
	beq.s	Lfea5c4
	moveq.l	#$30,d0			;'0'
Lfea5c4:
	rts

Lfea5c6:
	moveq.l	#$01,d1
	bra.s	Lfea5cc

Lfea5ca:
	moveq.l	#$09,d1
Lfea5cc:
	moveq.l	#$00,d7
	move.w	#$0050,d4		;'P'
	cmpi.b	#$16,($00e80029)
	beq.w	Lfea504
	moveq.l	#$30,d4			;'0'
	bra.w	Lfea504

Lfea5e4:
	moveq.l	#$18,d0
	bsr.s	Lfea61a
	rts

Lfea5ea:
	move.w	#$005f,d1		;'_'
	move.w	#$000f,d2
	moveq.l	#$20,d3			;' '
	lea.l	($0000e106),a1
	lea.l	($00e0f800),a2
	movem.l	d0-d3,-(a7)
	trap	#15
	movem.l	(a7)+,d0-d3
	lea.l	($0000e706),a1
	lea.l	($00e2f800),a2
	trap	#15
	rts

Lfea61a:
	moveq.l	#$4f,d1			;'O'
	cmpi.b	#$16,($00e80029)
	beq.s	Lfea628
	moveq.l	#$2f,d1			;'/'
Lfea628:
	move.w	#$000f,d2
	moveq.l	#$7f,d3
	sub.l	d1,d3
	lea.l	($0000ed06),a1
	lea.l	($00e0f800),a2
	movem.l	d0-d3,-(a7)
	trap	#15
	movem.l	(a7)+,d0-d3
	lea.l	($0000f206),a1
	lea.l	($00e2f800),a2
	trap	#15
	rts

Lfea656:
	move.w	#$000f,d2
	moveq.l	#$20,d3			;' '
	lea.l	($00e0f800),a2
	movem.l	d0-d3,-(a7)
	bsr.s	Lfea672
	movem.l	(a7)+,d0-d3
	lea.l	($00e2f800),a2
Lfea672:
	move.w	#$0017,d1
Lfea676:
	clr.l	(a2)+
	dbra.w	d1,Lfea676
	adda.l	d3,a2
	dbra.w	d2,Lfea672
	rts

Lfea684:
	moveq.l	#$13,d1
	moveq.l	#$30,d3			;'0'
	cmpi.b	#$16,($00e80029)
	beq.s	Lfea696
	moveq.l	#$0b,d1
	moveq.l	#$50,d3			;'P'
Lfea696:
	move.w	#$000f,d2
	lea.l	($00e0f800),a2
	movem.l	d0-d3,-(a7)
	bsr.s	Lfea6b0
	movem.l	(a7)+,d0-d3
	lea.l	($00e2f800),a2
Lfea6b0:
	move.w	d1,-(a7)
Lfea6b2:
	clr.l	(a2)+
	dbra.w	d1,Lfea6b2
	move.w	(a7)+,d1
	adda.l	d3,a2
	dbra.w	d2,Lfea6b0
	rts

Lfea6c2:
	move.l	#$00000000,-(a7)
	move.l	#$00000001,-(a7)
	DOS	_KNJCTRL
	addq.l	#8,a7
	rts

Lfea6d4:
	movem.l	d3/a1,-(a7)
	move.l	($0012,a5),d3
	beq.s	Lfea6ec
	movea.l	($000e,a5),a1
Lfea6e2:
	bsr.w	Lfea77a
	move.b	d0,(a1)+
	subq.l	#1,d3
	bne.s	Lfea6e2
Lfea6ec:
	movem.l	(a7)+,d3/a1
	bra.w	Lfea044

Lfea6f4:
	bsr.w	Lfea79a
	move.b	d0,($000d,a5)
	bra.w	Lfea044

Lfea700:
	bra.w	Lfea044

Lfea704:
	bsr.w	Lfea79a
	tst.b	d0
	beq.w	Lfea044
	bsr.s	Lfea77a
	bra.s	Lfea704

Lfea712:
	move.b	(a6)+,d2
	clr.l	d1
	move.b	(a6)+,d1
	movea.l	(a6),a1
	bsr.s	Lfea744
	beq.s	Lfea73c
	tst.b	d2
	beq.s	Lfea732
Lfea722:
	move.b	(a1)+,(a0)+
	dbra.w	d3,Lfea722
	bsr.s	Lfea6c2
	bsr.w	Lfea3aa
	clr.l	d0
	rts

Lfea732:
	move.b	(a0)+,(a1)+
	dbra.w	d3,Lfea732
	clr.l	d0
	rts

Lfea73c:
	moveq.l	#$ff,d0
	rts

Lfea740:
	moveq.l	#$ff,d0
	rts

Lfea744:
	lea.l	($0000f708),a0
	move.w	#$02c7,d3
	subq.w	#1,d1
	bmi.s	Lfea776
	moveq.l	#$20,d3			;' '
	cmp.w	#$0014,d1
	bcs.s	Lfea770
	sub.w	#$0014,d1
	lea.l	($0000f988),a0
	moveq.l	#$06,d3
	cmp.w	#$000c,d1
	bcs.s	Lfea770
	clr.w	d3
	rts

Lfea770:
	mulu.w	d3,d1
	adda.l	d1,a0
	subq.w	#1,d3
Lfea776:
	tst.w	d3
	rts

Lfea77a:
	bsr.s	Lfea79a
	tst.b	d0
	beq.s	Lfea77a
	movem.l	a0,-(a7)
	movea.l	($0000fac0),a0
	clr.l	d0
	move.b	(a0)+,d0
	move.l	a0,($0000fac0)
	movem.l	(a7)+,a0
	rts

Lfea79a:
	movem.l	a0,-(a7)
Lfea79e:
	clr.l	d0
	movea.l	($0000fac0),a0
	move.b	(a0),d0
	bne.s	Lfea7b6
	IOCS	_B_KEYSNS
	tst.l	d0
	beq.s	Lfea7b6
	bsr.s	Lfea7bc
	bra.s	Lfea79e

Lfea7b6:
	movem.l	(a7)+,a0
	rts

Lfea7bc:
	lea.l	($0000fac4),a0
	move.l	a0,($0000fac0)
	clr.b	(a0)
	move.w	($0000fae6),d0
	btst.l	#$06,d0
	bne.w	Lfea8e0
	btst.l	#$0e,d0
	bne.w	Lfea860
	btst.l	#$0d,d0
	bne.s	Lfea816
	bsr.w	Lfea984
	tst.b	d0
	bne.s	Lfea810
	tst.b	($0000faf8)
	beq.w	Lfeaa0a
	movem.l	d0/a1,-(a7)
	lea.l	($0000faf0),a1
Lfea802:
	move.b	(a1)+,(a0)+
	bne.s	Lfea802
	subq.l	#1,a0
	movem.l	(a7)+,d0/a1
	bra.w	Lfeaa0a

Lfea810:
	move.b	d0,(a0)+
	clr.b	(a0)
	rts

Lfea816:
	bsr.w	Lfea984
	tst.b	d0
	bne.s	Lfea844
	tst.b	($0000faf8)
	beq.w	Lfeaa0a
	movem.l	d0/a1,-(a7)
	lea.l	($0000faf0),a1
Lfea832:
	move.b	(a1)+,d0
	beq.s	Lfea83a
	bsr.s	Lfea844
	bra.s	Lfea832

Lfea83a:
	clr.b	(a0)
	movem.l	(a7)+,d0/a1
	bra.w	Lfeaa0a

Lfea844:
	cmp.b	#$a6,d0
	bcs.s	Lfea810
	cmp.b	#$b0,d0
	beq.s	Lfea810
	cmp.b	#$de,d0
	bcc.s	Lfea810
	move.b	#$80,(a0)+
	move.b	d0,(a0)+
	clr.b	(a0)
	rts

Lfea860:
	bsr.w	Lfea984
	tst.b	d0
	bne.s	Lfea8a8
	tst.b	($0000faf8)
	beq.w	Lfeaa0a
	movem.l	d0/a1,-(a7)
	lea.l	($0000faf0),a1
Lfea87c:
	move.b	(a1)+,d0
Lfea87e:
	tst.b	d0
	beq.s	Lfea89e
	bsr.s	Lfea8a8
	move.b	(a1)+,d0
	cmp.b	#$de,d0
	beq.s	Lfea898
	cmp.b	#$df,d0
	bne.s	Lfea87e
	bsr.w	Lfee1d0
	bra.s	Lfea87c

Lfea898:
	bsr.w	Lfee20e
	bra.s	Lfea87c

Lfea89e:
	clr.b	(a0)
	movem.l	(a7)+,d0/a1
	bra.w	Lfeaa0a

Lfea8a8:
	cmp.b	#$20,d0			;' '
	bcs.w	Lfea810
	cmp.b	#$7f,d0
	beq.w	Lfea810
	move.l	d1,-(a7)
	clr.l	d1
	move.b	d0,d1
	btst.b	#$05,($0000fae6)
	bne.s	Lfea8ce
	add.l	#$00010000,d1
Lfea8ce:
	bsr.w	Lfeab3e
	move.w	d0,d1
	ror.w	#8,d0
	move.b	d0,(a0)+
	move.b	d1,(a0)+
	clr.b	(a0)
	move.l	(a7)+,d1
	rts

Lfea8e0:
	IOCS	_B_KEYINP
	tst.b	d0
	bne.s	Lfea8f0
	bsr.w	Lfeaa0a
	bra.w	Lfea972

Lfea8f0:
	cmp.b	#$20,d0			;' '
	bcs.s	Lfea96e
	cmp.b	#$7f,d0
	beq.s	Lfea96e
	cmp.b	#$30,d0			;'0'
	bcs.s	Lfea972
	cmp.b	#$3a,d0			;':'
	bcs.s	Lfea916
	cmp.b	#$41,d0			;'A'
	bcs.s	Lfea972
	cmp.b	#$47,d0			;'G'
	bcc.s	Lfea972
	subq.w	#7,d0
Lfea916:
	sub.w	#$0030,d0
	move.w	d1,-(a7)
	move.w	($0000fae4),d1
	asl.w	#4,d1
	or.b	d0,d1
	move.w	d1,($0000fae4)
	addq.b	#1,($0000faf9)
	cmpi.b	#$04,($0000faf9)
	bne.s	Lfea980
	cmp.w	#$0100,d1
	bcs.s	Lfea96a
	cmp.w	#$f600,d1
	bcc.s	Lfea95c
	cmp.w	#$f000,d1
	bcc.s	Lfea964
	cmp.w	#$8100,d1
	bcc.s	Lfea95c
	cmp.w	#$8000,d1
	bcc.s	Lfea964
	bra.s	Lfea960

Lfea95c:
	bsr.w	Lfeab38
Lfea960:
	bsr.w	Lfeab32
Lfea964:
	move.w	d1,d0
	ror.w	#8,d0
	move.b	d0,(a0)+
Lfea96a:
	move.b	d1,d0
	move.w	(a7)+,d1
Lfea96e:
	move.b	d0,(a0)+
	clr.b	(a0)
Lfea972:
	clr.b	($0000faf9)
	clr.w	($0000fae4)
	rts

Lfea980:
	move.w	(a7)+,d1
	rts

Lfea984:
	clr.b	($0000faf8)
	btst.l	#$05,d0
	beq.s	Lfeaa02
	IOCS	_B_KEYINP
	cmp.w	#$7000,d0
	bcc.s	Lfea9a6
	tst.b	d0
	bne.s	Lfea9aa
	move.w	d0,-(a7)
	clr.w	d0
	bsr.s	Lfea9d8
	move.w	(a7)+,d0
Lfea9a6:
	tst.b	d0
	rts

Lfea9aa:
	cmp.w	#$4000,d0
	bcs.s	Lfea9d8
	cmp.w	#$5200,d0
	bcc.s	Lfea9d8
	movem.l	a2,-(a7)
	move.w	d0,-(a7)
	bsr.s	Lfea9d8
	lea.l	($0000faf0),a2
	move.b	($0000faf8),d0
	adda.l	d0,a2
	move.w	(a7)+,d0
	move.b	d0,-(a2)
	movem.l	(a7)+,a2
	clr.l	d0
	rts

Lfea9d8:
	movem.l	d1/a1-a2,-(a7)
	lea.l	($0000fae8),a1
	lea.l	($0000faf0),a2
	move.b	d0,d1
	IOCS	_RMACNV
	tst.l	d0
	beq.s	Lfea9fa
	bmi.s	Lfea9fa
	move.b	d0,($0000faf8)
Lfea9fa:
	movem.l	(a7)+,d1/a1-a2
	clr.l	d0
	rts

Lfeaa02:
	IOCS	_B_KEYINP
	tst.b	d0
	rts

Lfeaa0a:
	lsr.w	#8,d0
	cmp.b	#$70,d0			;'p'
	bcc.s	Lfeaa1e
	cmp.b	#$5a,d0			;'Z'
	bcs.s	Lfeaa2c
	cmp.b	#$61,d0			;'a'
	bcc.s	Lfeaa2c
Lfeaa1e:
	move.w	d0,-(a7)
	IOCS	_B_SFTSNS
	move.w	d0,($0000fae6)
	move.w	(a7)+,d0
Lfeaa2c:
	movem.l	a1,-(a7)
	movea.l	a0,a1
	bsr.s	Lfeaa54
	bmi.s	Lfeaa4c
	cmpi.b	#$fe,(a0)
	bne.s	Lfeaa42
	addq.l	#8,a0
	subq.w	#8,d0
	bmi.s	Lfeaa4c
Lfeaa42:
	move.b	(a0)+,(a1)+
	beq.s	Lfeaa4a
	dbra.w	d0,Lfeaa42
Lfeaa4a:
	subq.l	#1,a1
Lfeaa4c:
	movea.l	a1,a0
	movem.l	(a7)+,a1
	rts

Lfeaa54:
	movem.l	d1/d3,-(a7)
	lea.l	($0000faaa),a0
	moveq.l	#$15,d1
Lfeaa60:
	cmp.b	(a0)+,d0
	beq.s	Lfeaa70
	dbra.w	d1,Lfeaa60
Lfeaa68:
	movem.l	(a7)+,d1/d3
	moveq.l	#$ff,d0
	rts

Lfeaa70:
	moveq.l	#$16,d0
	sub.w	d1,d0
	move.w	d0,d1
	cmp.w	#$000b,d1
	bcs.s	Lfeaa8c
	add.w	#$000a,d1
Lfeaa80:
	bsr.w	Lfea744
	move.l	d3,d0
	movem.l	(a7)+,d1/d3
	rts

Lfeaa8c:
	IOCS	_B_SFTSNS
	btst.l	#$01,d0
	bne.s	Lfeaaa2
	btst.l	#$00,d0
	beq.s	Lfeaa80
	add.w	#$000a,d1
	bra.s	Lfeaa80

Lfeaaa2:
	cmp.w	#$0005,d1
	bcs.s	Lfeaad2
	cmp.w	#$0007,d1
	bne.s	Lfeaa68
	movem.l	d2/d4-d7/a0-a6,-(a7)
	clr.l	d1
	move.b	($0000f706),d1
	addq.b	#1,d1
	and.b	#$03,d1
	cmp.b	#$03,d1
	bne.s	Lfeaac8
	clr.l	d1
Lfeaac8:
	bsr.w	Lfea278
	movem.l	(a7)+,d2/d4-d7/a0-a6
	bra.s	Lfeaa68

Lfeaad2:
	or.w	#$0100,d1
	move.w	d1,-(a7)
	DOS	_DRVCTRL
	addq.l	#2,a7
	bra.s	Lfeaa68

Lfeaade:
	move.w	(a6)+,d0
	move.w	(a6),d1
	cmp.w	#$0005,d0
	bcc.w	Lfea1d2
	asl.w	#2,d0
	lea.l	($0000c2f8),a0
	movea.l	(a0,d0.w),a0
	jmp	(a0)

Lfeaaf8:
	.dc.b	$00,$00,$bf,$7a,$00,$00,$bf,$9a
	.dc.b	$00,$00,$c3,$0c,$00,$00,$c3,$18
	.dc.b	$00,$00,$c3,$1e,$70,$02,$4e,$4f
	.dc.b	$22,$00,$e8,$48,$10,$01,$4e,$75
Lfeab18:
	IOCS	_BITSNS
	rts

Lfeab1e:
	move.w	d1,d0
	movem.l	d1-d2,-(a7)
	move.l	d0,d2
	moveq.l	#$04,d1
	IOCS	_LEDMOD
	movem.l	(a7)+,d1-d2
	rts

Lfeab32:
	IOCS	_JISSFT
	rts

Lfeab38:
	IOCS	_SFTJIS
	rts

Lfeab3e:
	IOCS	_AKCONV
	rts

Lfeab44:
	.dc.b	$00,$00,$c4,$30,$80,$00,$00,$00
	.dc.b	$c3,$92,$00,$00,$c3,$9a,$41,$55
	.dc.b	$58,$20,$20,$20,$20,$20,$00,$00
	.dc.b	$00,$00,$00,$00,$c3,$ae,$00,$00
	.dc.b	$b8,$36,$00,$00,$b8,$36,$00,$00
	.dc.b	$b8,$36,$00,$00,$c3,$c0,$00,$00
	.dc.b	$c3,$e0,$00,$00,$c3,$ec,$00,$00
	.dc.b	$c3,$f0,$00,$00,$c4,$00,$00,$00
	.dc.b	$c4,$00,$00,$00,$c4,$22,$00,$00
	.dc.b	$b8,$44,$00,$00,$b8,$36,$23,$cd
	.dc.b	$00,$00,$c3,$5a,$4e,$75
Lfeab9a:
	movem.l	d0/a4-a5,-(a7)
	movea.l	($0000c35a),a5
	lea.l	($0000c35e),a4
	bra.w	Lfea016

Lfeabae:
	move.w	d1,-(a7)
	move.w	($00ed001a),d1
	IOCS	_SET232C
	move.w	(a7)+,d1
	bra.w	Lfea03c

Lfeabc0:
	movem.l	d3/a1,-(a7)
	move.l	($0012,a5),d3
	beq.s	Lfeabd8
	movea.l	($000e,a5),a1
Lfeabce:
	IOCS	_INP232C
	move.b	d0,(a1)+
	subq.l	#1,d3
	bne.s	Lfeabce
Lfeabd8:
	movem.l	(a7)+,d3/a1
	bra.w	Lfea044

Lfeabe0:
	IOCS	_ISNS232C
	move.b	d0,($000d,a5)
	bra.w	Lfea044

Lfeabec:
	bra.w	Lfea044

Lfeabf0:
	IOCS	_ISNS232C
	tst.l	d0
	beq.w	Lfea044
	IOCS	_INP232C
	bra.s	Lfeabf0

Lfeac00:
	movem.l	d1/d3/a1,-(a7)
	move.l	($0012,a5),d3
	beq.s	Lfeac1a
	movea.l	($000e,a5),a1
	clr.l	d1
Lfeac10:
	move.b	(a1)+,d1
	IOCS	_OUT232C
	subq.l	#1,d3
	bne.s	Lfeac10
Lfeac1a:
	movem.l	(a7)+,d1/d3/a1
	bra.w	Lfea044

Lfeac22:
	IOCS	_OSNS232C
	tst.b	d0
	bne.w	Lfea044
	moveq.l	#$01,d0
	rts

Lfeac30:
	.dc.b	$00,$00,$c4,$9a,$80,$00,$00,$00
	.dc.b	$c4,$7e,$00,$00,$c4,$86,$50,$52
	.dc.b	$4e,$20,$20,$20,$20,$20,$00,$00
	.dc.b	$00,$00,$00,$00,$c5,$04,$00,$00
	.dc.b	$b8,$36,$00,$00,$b8,$36,$00,$00
	.dc.b	$b8,$36,$00,$00,$b8,$36,$00,$00
	.dc.b	$b8,$36,$00,$00,$b8,$36,$00,$00
	.dc.b	$b8,$36,$00,$00,$c5,$0e,$00,$00
	.dc.b	$c5,$0e,$00,$00,$c5,$4c,$00,$00
	.dc.b	$b8,$44,$00,$00,$b8,$36,$23,$cd
	.dc.b	$00,$00,$c4,$46,$4e,$75
Lfeac86:
	movem.l	d0/a4-a5,-(a7)
	movea.l	($0000c446),a5
	lea.l	($0000c44a),a4
	bra.w	Lfea016

Lfeac9a:
	.dc.b	$00,$00,$c5,$5a,$80,$00,$00,$00
	.dc.b	$c4,$e8,$00,$00,$c4,$f0,$4c,$50
	.dc.b	$54,$20,$20,$20,$20,$20,$00,$00
	.dc.b	$00,$00,$00,$00,$c5,$04,$00,$00
	.dc.b	$b8,$36,$00,$00,$b8,$36,$00,$00
	.dc.b	$b8,$36,$00,$00,$b8,$36,$00,$00
	.dc.b	$b8,$36,$00,$00,$b8,$36,$00,$00
	.dc.b	$b8,$36,$00,$00,$c5,$30,$00,$00
	.dc.b	$c5,$30,$00,$00,$c5,$4c,$00,$00
	.dc.b	$b8,$44,$00,$00,$b8,$36,$23,$cd
	.dc.b	$00,$00,$c4,$b0,$4e,$75
Lfeacf0:
	movem.l	d0/a4-a5,-(a7)
	movea.l	($0000c4b0),a5
	lea.l	($0000c4b4),a4
	bra.w	Lfea016

Lfead04:
	moveq.l	#$ff,d1
	IOCS	_INIT_PRN
	bra.w	Lfea03c

Lfead0e:
	movem.l	d1/d3/a1,-(a7)
	move.l	($0012,a5),d3
	beq.s	Lfead28
	movea.l	($000e,a5),a1
Lfead1c:
	clr.w	d1
	move.b	(a1)+,d1
	IOCS	_OUTPRN
	subq.l	#1,d3
	bne.s	Lfead1c
Lfead28:
	movem.l	(a7)+,d1/d3/a1
	bra.w	Lfea044

Lfead30:
	movem.l	d1/d3/a1,-(a7)
	move.l	($0012,a5),d3
	beq.s	Lfead28
	movea.l	($000e,a5),a1
Lfead3e:
	clr.w	d1
	move.b	(a1)+,d1
	IOCS	_OUTLPT
	subq.l	#1,d3
	bne.s	Lfead3e
	bra.s	Lfead28

Lfead4c:
	IOCS	_SNSPRN
	tst.b	d0
	bne.w	Lfea044
	moveq.l	#$01,d0
	rts

Lfead5a:
	.dc.b	$ff,$ff,$ff,$ff,$80,$08,$00,$00
	.dc.b	$c5,$a8,$00,$00,$c5,$b0,$43,$4c
	.dc.b	$4f,$43,$4b,$20,$20,$20,$00,$00
	.dc.b	$00,$00,$00,$00,$c5,$c4,$00,$00
	.dc.b	$b8,$44,$00,$00,$b8,$44,$00,$00
	.dc.b	$b8,$44,$00,$00,$c5,$c8,$00,$00
	.dc.b	$b8,$44,$00,$00,$b8,$44,$00,$00
	.dc.b	$b8,$44,$00,$00,$c6,$04,$00,$00
	.dc.b	$c6,$04,$00,$00,$b8,$44,$00,$00
	.dc.b	$b8,$44,$00,$00,$b8,$44,$23,$cd
	.dc.b	$00,$00,$c5,$70,$4e,$75
Lfeadb0:
	movem.l	d0/a4-a5,-(a7)
	movea.l	($0000c570),a5
	lea.l	($0000c574),a4
	bra.w	Lfea016

Lfeadc4:
	bra.w	Lfea03c

Lfeadc8:
	movem.l	d1,-(a7)
	move.w	($0018,a5),d0
	beq.s	Lfeadde
	IOCS	_TIMEGET
	move.l	d0,d1
	IOCS	_TIMEBIN
	bra.s	Lfeade8

Lfeadde:
	IOCS	_DATEGET
	move.l	d0,d1
	IOCS	_DATEBIN
Lfeade8:
	movea.l	($000e,a5),a4
	rol.l	#8,d0
	move.b	d0,(a4)+
	rol.l	#8,d0
	move.b	d0,(a4)+
	rol.l	#8,d0
	move.b	d0,(a4)+
	rol.l	#8,d0
	move.b	d0,(a4)
	movem.l	(a7)+,d1
	bra.w	Lfea044

Lfeae04:
	movem.l	d1,-(a7)
	movea.l	($000e,a5),a4
	move.b	(a4)+,d1
	rol.l	#8,d1
	move.b	(a4)+,d1
	rol.l	#8,d1
	move.b	(a4)+,d1
	rol.l	#8,d1
	move.b	(a4)+,d1
	move.w	($0018,a5),d0
	beq.s	Lfeae30
	IOCS	_TIMEBCD
	move.l	d0,d1
	bmi.s	Lfeae3e
	IOCS	_TIMESET
	clr.l	d0
	bra.s	Lfeae3e

Lfeae30:
	IOCS	_DATEBCD
	move.l	d0,d1
	bmi.s	Lfeae3e
	IOCS	_DATESET
	clr.l	d0
Lfeae3e:
	movem.l	(a7)+,d1
	tst.l	d0
	beq.w	Lfea044
	move.w	#$050c,d0
	rts

Lfeae4e:
	.dc.b	$ff,$ff,$ff,$ff,$00,$00,$00,$00
	.dc.b	$c6,$9c,$00,$00,$c6,$a4,$04,$44
	.dc.b	$49,$53,$4b,$32,$48,$44,$00,$00
	.dc.b	$00,$00,$00,$00,$c6,$b8,$00,$00
	.dc.b	$c7,$0c,$00,$00,$c7,$44,$00,$00
	.dc.b	$b8,$36,$00,$00,$c7,$48,$00,$00
	.dc.b	$c8,$78,$00,$00,$b8,$44,$00,$00
	.dc.b	$b8,$44,$00,$00,$c7,$4c,$00,$00
	.dc.b	$c7,$50,$00,$00,$b8,$44,$00,$00
	.dc.b	$b8,$44,$00,$00,$b8,$36,$23,$cd
	.dc.b	$00,$00,$c6,$64,$4e,$75
Lfeaea4:
	movem.l	d0/a4-a5,-(a7)
	movea.l	($0000c664),a5
	lea.l	($0000c668),a4
	bra.w	Lfea016

Lfeaeb8:
	movem.l	d0-d4,-(a7)
	moveq.l	#$00,d3
	move.w	#$90ff,d1
Lfeaec2:
	IOCS	_B_RECALI
	and.l	#$10000000,d0
	bne.s	Lfeaeda
	addq.w	#1,d3
	add.w	#$0100,d1
	cmp.w	#$94ff,d1
	bne.s	Lfeaec2
Lfeaeda:
	move.b	d3,($000d,a5)
	move.l	#$0000c6ee,($0012,a5)
	movem.l	(a7)+,d0-d4
	bra.w	Lfea03c

Lfeaeee:
	.dc.b	$00,$00,$c6,$fe,$00,$00,$c6,$fe
	.dc.b	$00,$00,$c6,$fe,$00,$00,$c6,$fe
	.dc.b	$04,$00,$01,$02,$00,$01,$00,$c0
	.dc.b	$04,$d0,$fe,$02,$ff,$00,$48,$e7
	.dc.b	$60,$00,$12,$2d,$00,$01,$82,$3c
	.dc.b	$00,$90,$e1,$41,$74,$08,$70,$4e
	.dc.b	$4e,$4f,$12,$2d,$00,$01,$b2,$39
	.dc.b	$00,$00,$c7,$0a,$66,$04,$10,$3c
	.dc.b	$00,$01,$1b,$40,$00,$0e,$13,$fc
	.dc.b	$00,$ff,$00,$00,$c7,$0a,$4c,$df
	.dc.b	$00,$06,$60,$00,$f1,$02,$60,$00
	.dc.b	$f0,$fe,$70,$46,$60,$52,$70,$45
	.dc.b	$60,$4e,$48,$e7,$7f,$fe,$28,$2d
	.dc.b	$00,$12,$22,$6d,$00,$0e,$32,$2d
	.dc.b	$00,$18,$4a,$84,$67,$2e,$76,$08
	.dc.b	$30,$01,$c0,$7c,$00,$07,$96,$40
	.dc.b	$b8,$43,$64,$02,$36,$04,$70,$45
	.dc.b	$61,$20,$4a,$40,$66,$16,$70,$41
	.dc.b	$61,$18,$4a,$40,$66,$0e,$98,$83
	.dc.b	$d2,$83,$20,$03,$e1,$80,$e5,$80
	.dc.b	$d3,$c0,$60,$ce,$4c,$df,$7f,$fe
	.dc.b	$4e,$75
Lfeaf98:
	movem.l	d1-d7/a0-a6,-(a7)
	bra.s	Lfeafae

Lfeaf9e:
	movem.l	d1-d7/a0-a6,-(a7)
	move.l	($0012,a5),d3
	movea.l	($000e,a5),a1
	move.w	($0018,a5),d1
Lfeafae:
	move.w	d1,d2
	add.w	d3,d2
	cmp.w	($0000c706),d2
	bhi.w	Lfeb040
	move.l	d0,-(a7)
	move.w	d1,d0
	move.w	d0,d2
	and.w	#$0007,d2
	addq.b	#1,d2
	lsr.w	#4,d0
	bcc.s	Lfeafd0
	or.w	#$0100,d2
Lfeafd0:
	swap.w	d2
	move.w	#$0300,d2
	move.b	d0,d2
	swap.w	d2
	asl.l	#8,d3
	asl.l	#2,d3
	move.b	($0001,a5),d1
	and.w	#$0003,d1
	or.w	#$0090,d1
	asl.w	#8,d1
	move.b	#$70,d1			;'p'
	move.l	(a7)+,d0
	trap	#15
	movem.l	(a7)+,d1-d7/a0-a6
	cmp.l	#$ffffffff,d0
	beq.s	Lfeb028
	btst.l	#$1b,d0
	bne.s	Lfeb02e
	btst.l	#$11,d0
	bne.s	Lfeb04a
	btst.l	#$15,d0
	bne.s	Lfeb034
	btst.l	#$0d,d0
	bne.s	Lfeb034
	btst.l	#$0a,d0
	bne.s	Lfeb03a
	btst.l	#$1e,d0
	bne.s	Lfeb028
	clr.l	d0
	rts

Lfeb028:
	move.w	#$7007,d0
	rts

Lfeb02e:
	move.w	#$7002,d0
	rts

Lfeb034:
	move.w	#$7004,d0
	rts

Lfeb03a:
	move.w	#$700b,d0
	rts

Lfeb040:
	movem.l	(a7)+,d1-d7/a0-a6
	move.w	#$5008,d0
	rts

Lfeb04a:
	move.w	#$700d,d0
	move.w	d0,-(a7)
	move.b	($0001,a5),d1
	move.w	#$0020,d0		;' '
	and.w	#$0003,d1
	bset.l	d1,d0
	move.b	d0,($00e94005)
	and.w	#$00e0,d0
	move.b	d0,($00e94005)
	move.b	d1,($0000c70a)
	move.w	(a7)+,d0
	rts

Lfeb078:
	movem.l	d1-d2/a1,-(a7)
	move.b	($0001,a5),d1
	and.l	#$00000003,d1
	asl.w	#8,d1
	or.w	#$9000,d1
	clr.w	d2
	move.b	($000d,a5),d2
	IOCS	_B_DRVCHK
	move.b	d0,($000d,a5)
	movem.l	(a7)+,d1-d2/a1
	bra.w	Lfea044

Lfeb0a2:
	.dc.b	$ff,$ff,$ff,$ff,$00,$00,$00,$00
	.dc.b	$c8,$f0,$00,$00,$c8,$f8,$10,$48
	.dc.b	$41,$52,$44,$44,$53,$4b,$00,$00
	.dc.b	$00,$00,$00,$00,$c9,$0c,$00,$00
	.dc.b	$ca,$60,$00,$00,$ca,$6a,$00,$00
	.dc.b	$b8,$36,$00,$00,$ca,$ae,$00,$00
	.dc.b	$ca,$8c,$00,$00,$b8,$44,$00,$00
	.dc.b	$b8,$44,$00,$00,$ca,$b2,$00,$00
	.dc.b	$ca,$b6,$00,$00,$b8,$44,$00,$00
	.dc.b	$b8,$44,$00,$00,$b8,$36,$23,$cd
	.dc.b	$00,$00,$c8,$b8,$4e,$75
Lfeb0f8:
	movem.l	d0/a4-a5,-(a7)
	movea.l	($0000c8b8),a5
	lea.l	($0000c8bc),a4
	bra.w	Lfea016

Lfeb10c:
	bsr.w	Lfeb3a8
	move.b	d0,($000d,a5)
	move.l	#$0000c920,($0012,a5)
	bra.w	Lfea03c

Lfeb120:
	.dc.b	$00,$00,$c9,$60,$00,$00,$c9,$70
	.dc.b	$00,$00,$c9,$80,$00,$00,$c9,$90
	.dc.b	$00,$00,$c9,$a0,$00,$00,$c9,$b0
	.dc.b	$00,$00,$c9,$c0,$00,$00,$c9,$d0
	.dc.b	$00,$00,$c9,$e0,$00,$00,$c9,$f0
	.dc.b	$00,$00,$ca,$00,$00,$00,$ca,$10
	.dc.b	$00,$00,$ca,$20,$00,$00,$ca,$30
	.dc.b	$00,$00,$ca,$40,$00,$00,$ca,$50
	.dc.b	$04,$00,$01,$02,$00,$01,$02,$00
	.dc.b	$27,$72,$f8,$14,$80,$00,$00,$00
	.dc.b	$04,$00,$01,$02,$00,$01,$02,$00
	.dc.b	$27,$72,$f8,$14,$81,$00,$00,$00
	.dc.b	$04,$00,$01,$02,$00,$01,$02,$00
	.dc.b	$27,$72,$f8,$14,$82,$00,$00,$00
	.dc.b	$04,$00,$01,$02,$00,$01,$02,$00
	.dc.b	$27,$72,$f8,$14,$83,$00,$00,$00
	.dc.b	$04,$00,$01,$02,$00,$01,$02,$00
	.dc.b	$27,$72,$f8,$14,$84,$00,$00,$00
	.dc.b	$04,$00,$01,$02,$00,$01,$02,$00
	.dc.b	$27,$72,$f8,$14,$85,$00,$00,$00
	.dc.b	$04,$00,$01,$02,$00,$01,$02,$00
	.dc.b	$27,$72,$f8,$14,$86,$00,$00,$00
	.dc.b	$04,$00,$01,$02,$00,$01,$02,$00
	.dc.b	$27,$72,$f8,$14,$87,$00,$00,$00
	.dc.b	$04,$00,$01,$02,$00,$01,$02,$00
	.dc.b	$27,$72,$f8,$14,$88,$00,$00,$00
	.dc.b	$04,$00,$01,$02,$00,$01,$02,$00
	.dc.b	$27,$72,$f8,$14,$89,$00,$00,$00
	.dc.b	$04,$00,$01,$02,$00,$01,$02,$00
	.dc.b	$27,$72,$f8,$14,$8a,$00,$00,$00
	.dc.b	$04,$00,$01,$02,$00,$01,$02,$00
	.dc.b	$27,$72,$f8,$14,$8b,$00,$00,$00
	.dc.b	$04,$00,$01,$02,$00,$01,$02,$00
	.dc.b	$27,$72,$f8,$14,$8c,$00,$00,$00
	.dc.b	$04,$00,$01,$02,$00,$01,$02,$00
	.dc.b	$27,$72,$f8,$14,$8d,$00,$00,$00
	.dc.b	$04,$00,$01,$02,$00,$01,$02,$00
	.dc.b	$27,$72,$f8,$14,$8e,$00,$00,$00
	.dc.b	$04,$00,$01,$02,$00,$01,$02,$00
	.dc.b	$27,$72,$f8,$14,$8f,$00,$00,$00
	.dc.b	$1b,$7c,$00,$01,$00,$0e,$60,$00
	.dc.b	$ed,$dc,$60,$00,$ed,$d8
Lfeb26e:
	lea.l	($0000c960),a4
	move.b	($0001,a5),d1
	and.w	#$000f,d1
	asl.w	#4,d1
	lea.l	(a4,d1.w),a4
	move.w	($000c,a4),d1
	and.w	#$ff00,d1
	rts

Lfeb28c:
	movem.l	d1-d7/a0-a3,-(a7)
	bsr.s	Lfeb26e
	move.b	($000d,a5),d0
	cmp.b	#$01,d0
	bne.s	Lfeb2a0
	IOCS	_B_EJECT
Lfeb2a0:
	move.b	#$42,($000d,a5)		;'B'
	movem.l	(a7)+,d1-d7/a0-a3
	bra.w	Lfea044

Lfeb2ae:
	moveq.l	#$46,d0			;'F'
	bra.s	Lfeb328

Lfeb2b2:
	moveq.l	#$45,d0			;'E'
	bra.s	Lfeb328

Lfeb2b6:
	movem.l	d1-d7/a0-a6,-(a7)
	bsr.s	Lfeb26e
	clr.l	d2
	move.w	($0018,a5),d2
	add.w	($0014,a5),d2
	subq.w	#1,d2
	cmp.w	($0008,a4),d2
	bcc.w	Lfeb394
	move.w	($0018,a5),d2
	asl.l	#2,d2
	add.l	($000c,a4),d2
	and.l	#Lffffff,d2
	movea.l	($000e,a5),a1
	move.l	($0012,a5),d4
	asl.l	#2,d4
Lfeb2ea:
	clr.l	d0
	tst.l	d4
	beq.s	Lfeb31c
	moveq.l	#$21,d3			;'!'
	move.w	d2,d0
	divu.w	d3,d0
	swap.w	d0
	sub.w	d0,d3
	cmp.w	d3,d4
	bcc.s	Lfeb300
	move.w	d4,d3
Lfeb300:
	moveq.l	#$45,d0			;'E'
	bsr.s	Lfeb322
	tst.b	d0
	bne.s	Lfeb31c
	moveq.l	#$41,d0			;'A'
	bsr.s	Lfeb322
	tst.b	d0
	bne.s	Lfeb31c
	sub.l	d3,d4
	add.l	d3,d2
	move.l	d3,d0
	asl.l	#8,d0
	adda.l	d0,a1
	bra.s	Lfeb2ea

Lfeb31c:
	movem.l	(a7)+,d1-d7/a0-a6
	rts

Lfeb322:
	movem.l	d1-d7/a0-a6,-(a7)
	bra.s	Lfeb35c

Lfeb328:
	movem.l	d1-d7/a0-a6,-(a7)
	bsr.w	Lfeb26e
	clr.l	d2
	move.w	($0018,a5),d2
	add.w	($0014,a5),d2
	subq.w	#1,d2
	cmp.w	($0008,a4),d2
	bcc.s	Lfeb394
	move.w	($0018,a5),d2
	asl.l	#2,d2
	add.l	($000c,a4),d2
	and.l	#Lffffff,d2
	movea.l	($000e,a5),a1
	move.l	($0012,a5),d3
	asl.l	#2,d3
Lfeb35c:
	asl.l	#8,d3
	trap	#15
	tst.b	d0
	beq.s	Lfeb3a0
	cmp.b	#$03,d0
	beq.s	Lfeb394
	cmp.b	#$08,d0
	beq.s	Lfeb38e
	cmp.b	#$09,d0
	beq.s	Lfeb394
	cmp.b	#$14,d0
	beq.s	Lfeb388
	cmp.b	#-$02,d0
	beq.s	Lfeb39a
	move.w	#$700c,d0
	bra.s	Lfeb3a2

Lfeb388:
	move.w	#$7002,d0
	bra.s	Lfeb3a2

Lfeb38e:
	move.w	#$7006,d0
	bra.s	Lfeb3a2

Lfeb394:
	move.w	#$5008,d0
	bra.s	Lfeb3a2

Lfeb39a:
	move.w	#$700b,d0
	bra.s	Lfeb3a2

Lfeb3a0:
	clr.l	d0
Lfeb3a2:
	movem.l	(a7)+,d1-d7/a0-a6
	rts

Lfeb3a8:
	movem.l	d1-d7/a0-a6,-(a7)
	clr.l	d4
	lea.l	($0000c960),a2
	lea.l	(-$0100,a7),a7
	movea.l	a7,a1
	clr.l	d1
	move.w	#$8000,d1
	moveq.l	#$04,d2
	move.l	#$00000100,d3
Lfeb3c8:
	movem.l	d1-d4/a1-a2,-(a7)
	IOCS	_B_RECALI
	movem.l	(a7)+,d1-d4/a1-a2
	tst.b	d0
	bne.w	Lfeb468
	clr.l	(a1)
	movem.l	d1-d4/a1-a2,-(a7)
	IOCS	_B_READ
	movem.l	(a7)+,d1-d4/a1-a2
	tst.b	d0
	bne.s	Lfeb468
	cmpi.l	#$5836384b,(a1)		;'X68K'
	bne.s	Lfeb468
	moveq.l	#$0e,d5
	movea.l	a1,a0
Lfeb3f8:
	lea.l	($0010,a0),a0
	cmpi.l	#$48756d61,(a0)		;'Huma'
	bne.s	Lfeb40e
	cmpi.l	#$6e36386b,($0004,a0)	;'n68k'
	beq.s	Lfeb414
Lfeb40e:
	dbra.w	d5,Lfeb3f8
	bra.s	Lfeb468

Lfeb414:
	move.l	($0008,a0),d5
	cmp.l	#L000000,d5
	bcc.s	Lfeb40e
	swap.w	d1
	or.l	d1,d5
	swap.w	d1
	move.l	d5,($000c,a2)
	move.l	($000c,a0),d0
	lsr.l	#2,d0
	cmp.l	#$0000fff7,d0
	bcc.s	Lfeb468
	move.w	d0,($0008,a2)
	move.l	d0,d5
	add.l	d5,d5
	cmp.w	#$0ff7,d0
	bcs.s	Lfeb448
	move.l	d5,d0
Lfeb448:
	add.l	d5,d0
	add.l	#$000007ff,d0
	lsr.l	#8,d0
	lsr.l	#3,d0
	cmp.l	#$00000100,d0
	bcc.s	Lfeb468
	move.b	d0,($000b,a2)
	lea.l	($0010,a2),a2
	addq.l	#1,d4
	bra.s	Lfeb474

Lfeb468:
	movem.l	a1/a4,-(a7)
	IOCS	_B_EJECT
	movem.l	(a7)+,a1/a4
Lfeb474:
	add.w	#$0100,d1
	cmp.w	#$9000,d1
	bne.w	Lfeb3c8
	bra.s	Lfeb486

Lfeb482:
	IOCS	_B_EJECT
Lfeb486:
	move.w	#$8100,d1
	IOCS	_B_RECALI
	IOCS	_B_EJECT
	move.w	#$8000,d1
	IOCS	_B_RECALI
	IOCS	_B_EJECT
	move.l	d4,d0
	lea.l	($0100,a7),a7
	movem.l	(a7)+,d1-d7/a0-a6
	rts

Lfeb4aa:
	.dc.b	$ff,$ff,$ff,$ff,$00,$00,$00,$00
	.dc.b	$cc,$f8,$00,$00,$cd,$00,$01,$53
	.dc.b	$5f,$52,$41,$4d,$20,$20,$00,$00
	.dc.b	$00,$00,$00,$00,$ce,$f4,$00,$00
	.dc.b	$cd,$82,$00,$00,$cd,$98,$00,$00
	.dc.b	$b8,$36,$00,$00,$cd,$e8,$00,$00
	.dc.b	$ce,$3a,$00,$00,$b8,$44,$00,$00
	.dc.b	$b8,$44,$00,$00,$ce,$12,$00,$00
	.dc.b	$cd,$fa,$00,$00,$b8,$44,$00,$00
	.dc.b	$b8,$44,$00,$00,$b8,$36,$23,$cd
	.dc.b	$00,$00,$cc,$c0,$4e,$75
Lfeb500:
	movem.l	d0/a4-a5,-(a7)
	movea.l	($0000ccc0),a5
	lea.l	($0000ccc4),a4
	bra.w	Lfea016

Lfeb514:
	.dc.b	$ff,$ff,$ff,$ff,$00,$00,$00,$00
	.dc.b	$cd,$62,$00,$00,$cd,$6a,$01,$52
	.dc.b	$4f,$4d,$20,$20,$20,$20,$00,$00
	.dc.b	$00,$00,$00,$00,$ce,$da,$00,$00
	.dc.b	$cd,$7e,$00,$00,$cd,$98,$00,$00
	.dc.b	$b8,$36,$00,$00,$cd,$9c,$00,$00
	.dc.b	$ce,$34,$00,$00,$b8,$44,$00,$00
	.dc.b	$b8,$44,$00,$00,$b8,$36,$00,$00
	.dc.b	$b8,$36,$00,$00,$b8,$44,$00,$00
	.dc.b	$b8,$44,$00,$00,$b8,$36,$23,$cd
	.dc.b	$00,$00,$cd,$2a,$4e,$75
Lfeb56a:
	movem.l	d0/a4-a5,-(a7)
	movea.l	($0000cd2a),a5
	lea.l	($0000cd2e),a4
	bra.w	Lfea016

Lfeb57e:
	clr.w	d0
	bra.s	Lfeb590

Lfeb582:
	clr.w	d0
	cmpi.b	#$f9,($00ed0400)
	beq.s	Lfeb590
	moveq.l	#$ff,d0
Lfeb590:
	move.b	d0,($000e,a5)
	clr.w	d0
	rts

Lfeb598:
	bra.w	Lfea044

Lfeb59c:
	movem.l	d1/a0-a2,-(a7)
	clr.l	d0
	move.w	($0018,a5),d0
	add.w	($0014,a5),d0
	cmp.w	($00ed0054),d0
	bhi.s	Lfeb5de
	move.l	($0012,a5),d0
	asl.l	#8,d0
	asl.l	#2,d0
	movea.l	($000e,a5),a1
	clr.l	d1
	move.w	($0018,a5),d1
	movea.l	($00ed0048),a2
	asl.l	#8,d1
	asl.l	#2,d1
	adda.l	d1,a2
Lfeb5d0:
	move.b	(a2)+,(a1)+
	subq.l	#1,d0
	bne.s	Lfeb5d0
	clr.l	d0
	movem.l	(a7)+,d1/a0-a2
	rts

Lfeb5de:
	move.w	#$5008,d0
	movem.l	(a7)+,d1/a0-a2
	rts

Lfeb5e8:
	movem.l	d1/a0-a2,-(a7)
	lea.l	($0000cea0),a0
	bsr.s	Lfeb654
	movem.l	(a7)+,d1/a0-a2
	rts

Lfeb5fa:
	bsr.s	Lfeb612
	tst.w	d0
	bne.s	Lfeb610
	movem.l	d1/a0-a2,-(a7)
	lea.l	($0000ceb4),a0
	bsr.s	Lfeb65e
	movem.l	(a7)+,d1/a0-a2
Lfeb610:
	rts

Lfeb612:
	movem.l	d1/a0-a2,-(a7)
	move.b	#$31,($00e8e00d)	;'1'
	lea.l	($0000ceaa),a0
	bsr.s	Lfeb65e
	move.b	#$00,($00e8e00d)
	movem.l	(a7)+,d1/a0-a2
	rts

Lfeb634:
	move.b	#$4a,d0			;'J'
	bra.s	Lfeb64c

Lfeb63a:
	move.b	#$42,d0			;'B'
	cmpi.b	#$f9,($00ed0400)
	beq.s	Lfeb64c
	bset.l	#$02,d0
Lfeb64c:
	move.b	d0,($000d,a5)
	bra.w	Lfea044

Lfeb654:
	cmpi.b	#$f9,($00ed0400)
	bne.s	Lfeb694
Lfeb65e:
	clr.l	d0
	move.w	($0018,a5),d0
	add.w	($0014,a5),d0
	cmp.w	($0000cece),d0
	bhi.s	Lfeb69a
	move.l	($0012,a5),d0
	asl.l	#8,d0
	asl.l	#2,d0
	subq.l	#1,d0
	movea.l	($000e,a5),a1
	clr.l	d1
	move.w	($0018,a5),d1
	lea.l	($00ed0000),a2
	asl.l	#8,d1
	asl.l	#2,d1
	adda.l	d1,a2
	jsr	(a0)
	rts

Lfeb694:
	move.w	#$5007,d0
	rts

Lfeb69a:
	move.w	#$5008,d0
	rts

Lfeb6a0:
	move.b	(a2)+,(a1)+
	dbra.w	d0,Lfeb6a0
	clr.l	d0
	rts

Lfeb6aa:
	move.b	(a1)+,(a2)+
	dbra.w	d0,Lfeb6aa
	clr.l	d0
	rts

Lfeb6b4:
	cmpm.b	(a1)+,(a2)+
	bne.s	Lfeb6c0
	dbra.w	d0,Lfeb6b4
	clr.l	d0
	rts

Lfeb6c0:
	move.w	#$700b,d0
	rts

Lfeb6c6:
	.dc.b	$04,$00,$01,$01,$00,$01,$00,$20
	.dc.b	$00,$10,$f9,$01,$00,$00,$ce,$c6
	.dc.b	$00,$ed,$00,$4c,$1b,$7c,$00,$01
	.dc.b	$00,$0d,$2b,$7c,$00,$00,$ce,$d6
	.dc.b	$00,$12,$2b,$7c,$00,$00,$ce,$f4
	.dc.b	$00,$0e,$60,$00,$e9,$52,$48,$e7
	.dc.b	$7f,$fe,$1b,$7c,$00,$01,$00,$0d
	.dc.b	$2b,$7c,$00,$00,$ce,$d2,$00,$12
	.dc.b	$2b,$7c,$00,$00,$ce,$f4,$00,$0e
	.dc.b	$0c,$39,$00,$f9,$00,$ed,$04,$00
	.dc.b	$66,$0a,$70,$02,$4e,$4f,$08,$00
	.dc.b	$00,$00,$67,$02,$61,$08,$4c,$df
	.dc.b	$7f,$fe,$60,$00,$e9,$1a,$41,$f9
	.dc.b	$00,$ed,$04,$00,$13,$fc,$00,$31
	.dc.b	$00,$e8,$e0,$0d,$30,$3c,$01,$ff
	.dc.b	$42,$98,$51,$c8,$ff,$fc,$23,$fc
	.dc.b	$f9,$ff,$ff,$00,$00,$ed,$04,$00
	.dc.b	$43,$f9,$00,$ed,$08,$00,$ff,$2c
	.dc.b	$e0,$58,$33,$c0,$00,$00,$cf,$96
	.dc.b	$ff,$2a,$e0,$58,$33,$c0,$00,$00
	.dc.b	$cf,$98,$41,$f9,$00,$00,$cf,$80
	.dc.b	$70,$07,$22,$d8,$51,$c8,$ff,$fc
	.dc.b	$13,$fc,$00,$00,$00,$e8,$e0,$0d
	.dc.b	$4e,$75
Lfeb780:
	.dc.b	$53,$52,$41,$4d,$5f,$44,$49,$53
	.dc.b	$4b,$20,$20,$08,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$a0,$60
	.dc.b	$e7,$0a,$00,$00,$00,$00,$00,$00
	.dc.b	$20,$5e,$20,$1e,$66,$0a,$22,$79
	.dc.b	$00,$00,$8a,$22,$20,$29,$00,$10
	.dc.b	$b0,$bc,$ff,$ff,$ff,$ff,$67,$12
	.dc.b	$22,$40,$24,$56,$61,$36,$4a,$00
	.dc.b	$67,$08,$14,$d8,$66,$fc,$42,$80
	.dc.b	$4e,$75
Lfeb7ca:
	moveq.l	#$ff,d0
	rts

Lfeb7ce:
	movea.l	(a6)+,a0
	move.l	(a6)+,d0
	bne.s	Lfeb7de
	movea.l	($00008a22),a1
	move.l	($0010,a1),d0
Lfeb7de:
	cmp.l	#$ffffffff,d0
	beq.s	Lfeb7ca
	movea.l	d0,a1
	movea.l	(a6),a2
	bsr.s	Lfeb84e
	tst.b	d0
	beq.s	Lfeb7ca
	clr.l	d0
	rts

Lfeb7f4:
	link.w	a6,#-$0100
	movem.l	a1,-(a7)
	movea.l	a0,a1
	lea.l	(-$0100,a6),a0
	bsr.w	Lfeb97e
	move.b	#$3d,(-$0001,a0)	;'='
	clr.b	(a0)
	movem.l	(a7),a1
	addq.l	#4,a1
	lea.l	(-$0100,a6),a0
	bsr.w	Lfeb92a
Lfeb81c:
	tst.b	(a1)
	beq.s	Lfeb836
	movem.l	d0,-(a7)
	bsr.w	Lfeb93c
	beq.s	Lfeb83a
	movem.l	(a7)+,d0
	addq.l	#1,a1
Lfeb830:
	tst.b	(a1)+
	bne.s	Lfeb830
	bra.s	Lfeb81c

Lfeb836:
	clr.b	d0
	bra.s	Lfeb846

Lfeb83a:
	movem.l	(a7)+,d0
	adda.l	d0,a1
	movea.l	a1,a0
	move.b	#-$01,d0
Lfeb846:
	movem.l	(a7)+,a1
	unlk	a6
	rts

Lfeb84e:
	link.w	a6,#-$0200
	movem.l	d1-d2/a0-a5,-(a7)
	movea.l	a2,a5
	movea.l	a0,a2
	movea.l	a1,a3
	movea.l	a2,a1
	lea.l	(-$0100,a6),a0
	bsr.w	Lfeb97e
	move.b	#$3d,(-$0001,a0)	;'='
	clr.b	(a0)
	move.l	a5,(-$0004,a7)
	bne.s	Lfeb878
	movea.l	a0,a5
	bra.s	Lfeb87e

Lfeb878:
	movea.l	a5,a1
	bsr.w	Lfeb97e
Lfeb87e:
	movea.l	a2,a1
	lea.l	(-$0100,a6),a2
	lea.l	(-$0200,a6),a0
	bsr.w	Lfeb97e
	movea.l	a3,a1
	lea.l	(-$0200,a6),a0
	bsr.w	Lfeb92a
	move.l	d0,d1
	bsr.w	Lfeb7f4
	tst.b	d0
	beq.s	Lfeb8ce
	suba.l	d1,a0
	bsr.w	Lfeb92a
	movea.l	a0,a4
	move.l	d0,d1
	movea.l	a2,a0
	bsr.s	Lfeb92a
	sub.l	d0,d1
	bcc.s	Lfeb8bc
	neg.l	d1
	movea.l	a3,a0
	bsr.s	Lfeb908
	cmp.l	d1,d0
	bcs.s	Lfeb8fe
Lfeb8bc:
	movea.l	a4,a0
	move.w	#$0001,d2
	bsr.w	Lfeb95e
	movea.l	a0,a1
	movea.l	a4,a0
	bsr.w	Lfeb972
Lfeb8ce:
	tst.b	(a5)
	beq.s	Lfeb8fa
	movea.l	a2,a0
	bsr.s	Lfeb92a
	move.l	d0,d1
	movea.l	a3,a0
	bsr.s	Lfeb908
	cmp.l	d1,d0
	bcs.s	Lfeb8fe
	movea.l	a3,a0
	addq.l	#4,a0
Lfeb8e4:
	move.w	#$0001,d2
	bsr.s	Lfeb95e
	bne.s	Lfeb8e4
	movea.l	a2,a1
	bsr.w	Lfeb97e
	bsr.s	Lfeb92a
	adda.l	d0,a0
	addq.l	#1,a0
	clr.b	(a0)
Lfeb8fa:
	moveq.l	#$ff,d0
	bra.s	Lfeb900

Lfeb8fe:
	clr.l	d0
Lfeb900:
	movem.l	(a7)+,d1-d2/a0-a5
	unlk	a6
	rts

Lfeb908:
	movem.l	d2/a1,-(a7)
	movea.l	a0,a1
	move.l	(a0)+,d0
	adda.l	d0,a1
Lfeb912:
	move.w	#$0001,d2
	bsr.s	Lfeb95e
	bne.s	Lfeb912
	addq.l	#1,a0
	suba.l	a0,a1
	bcc.s	Lfeb922
	suba.l	a1,a1
Lfeb922:
	move.l	a1,d0
	movem.l	(a7)+,d2/a1
	rts

Lfeb92a:
	move.l	a0,-(a7)
	moveq.l	#$ff,d0
Lfeb92e:
	addi.l	#$00000001,d0
	tst.b	(a0)+
	bne.s	Lfeb92e
	movea.l	(a7)+,a0
	rts

Lfeb93c:
	movem.l	a0-a1,-(a7)
	bra.s	Lfeb946

Lfeb942:
	cmpm.b	(a0)+,(a1)+
	bne.s	Lfeb94e
Lfeb946:
	dbra.w	d0,Lfeb942
	clr.l	d0
	bra.s	Lfeb956

Lfeb94e:
	bcs.s	Lfeb954
	moveq.l	#$01,d0
	bra.s	Lfeb956

Lfeb954:
	moveq.l	#$ff,d0
Lfeb956:
	tst.l	d0
	movem.l	(a7)+,a0-a1
	rts

Lfeb95e:
	tst.w	d2
	beq.s	Lfeb96e
	tst.b	(a0)
	beq.s	Lfeb970
Lfeb966:
	tst.b	(a0)+
	bne.s	Lfeb966
	subq.w	#1,d2
	bra.s	Lfeb95e

Lfeb96e:
	tst.b	(a0)
Lfeb970:
	rts

Lfeb972:
	move.b	(a1)+,(a0)+
	beq.s	Lfeb97c
Lfeb976:
	move.b	(a1)+,(a0)+
	bne.s	Lfeb976
	bra.s	Lfeb972

Lfeb97c:
	rts

Lfeb97e:
	move.b	(a1)+,(a0)+
	bne.s	Lfeb97e
	rts

Lfeb984:
	movem.l	d0-d6/a0-a6,-(a7)
	bsr.w	Lfebb92
	ori.w	#$0700,sr
	bsr.w	Lfeba42
	moveq.l	#$16,d2
	moveq.l	#$10,d3
	moveq.l	#$33,d4			;'3'
	lea.l	($0000fb3a),a1
	bsr.w	Lfebb50
	ror.w	#8,d7
	cmp.b	#$80,d7
	bcc.s	Lfeb9b2
	cmp.b	#$10,d7
	bcc.s	Lfeb9b6
Lfeb9b2:
	move.b	#$10,d7
Lfeb9b6:
	btst.l	#$04,d7
	bne.s	Lfeb9c6
	lea.l	($0000fb02),a1
	bsr.w	Lfebb3e
Lfeb9c6:
	btst.l	#$05,d7
	bne.s	Lfeb9d6
	lea.l	($0000fb06),a1
	bsr.w	Lfebb3e
Lfeb9d6:
	btst.l	#$06,d7
	bne.s	Lfeb9e6
	lea.l	($0000fb0a),a1
	bsr.w	Lfebb3e
Lfeb9e6:
	andi.w	#$f8ff,sr
Lfeb9ea:
	bsr.w	Lfebca2
	and.w	#$00df,d0
	cmp.b	#$41,d0			;'A'
	beq.s	Lfeba1c
	cmp.b	#$52,d0			;'R'
	beq.s	Lfeba10
	cmp.b	#$49,d0			;'I'
	bne.s	Lfeb9ea
	btst.l	#$06,d7
	beq.s	Lfeb9ea
	move.b	#$02,d7
	bra.s	Lfeba2c

Lfeba10:
	btst.l	#$05,d7
	beq.s	Lfeb9ea
	move.b	#$01,d7
	bra.s	Lfeba2c

Lfeba1c:
	btst.l	#$04,d7
	beq.s	Lfeb9ea
	clr.b	d7
	move.w	#$0001,($0000ff60)
Lfeba2c:
	bsr.w	Lfebc1c
	tst.b	d7
	beq.s	Lfeba3a
Lfeba34:
	movem.l	(a7)+,d0-d6/a0-a6
	rte

Lfeba3a:
	move.w	#$00ff,d0
	trap	#15
	bra.s	Lfeba34

Lfeba42:
	lea.l	($0000fc3a),a1
	cmp.w	#$001f,d7
	beq.s	Lfeba92
	cmp.w	#$301f,d7
	beq.s	Lfeba92
	cmp.w	#$0002,d7
	bcs.s	Lfebab8
	cmp.w	#$0009,d7
	bcs.s	Lfeba80
	cmp.w	#$1000,d7
	bcs.s	Lfebab8
	cmp.w	#$8000,d7
	bcc.s	Lfebab8
	clr.l	d0
	move.b	d7,d0
	subq.l	#1,d0
	cmp.b	#$0e,d0
	bcc.s	Lfebab8
	lea.l	($0000fc57),a1
	bra.s	Lfebaa8

Lfeba80:
	clr.l	d0
	move.b	d7,d0
	subq.w	#2,d0
	lea.l	($0000fb6f),a1
	mulu.w	#$001d,d0
	adda.l	d0,a1
Lfeba92:
	moveq.l	#$16,d2
	moveq.l	#$0f,d3
	moveq.l	#$1b,d4
	bsr.w	Lfebb50
	lea.l	($0000fb2b),a1
	moveq.l	#$04,d4
	moveq.l	#$32,d2			;'2'
	bra.s	Lfebaec

Lfebaa8:
	mulu.w	#$0035,d0
	adda.l	d0,a1
	moveq.l	#$16,d2
	moveq.l	#$0f,d3
	moveq.l	#$33,d4			;'3'
	bra.w	Lfebb50

Lfebab8:
	moveq.l	#$16,d2
	moveq.l	#$0f,d3
	moveq.l	#$08,d4
	lea.l	($0000fb12),a1
	bsr.w	Lfebb50
	move.w	d7,d2
	lea.l	($00010c6e),a1
	bsr.w	Lfebb6c
	moveq.l	#$1f,d2
	moveq.l	#$0f,d3
	moveq.l	#$03,d4
	lea.l	($00010c6e),a1
	bsr.s	Lfebb50
	lea.l	($0000fb1c),a1
	moveq.l	#$13,d4
	moveq.l	#$23,d2			;'#'
Lfebaec:
	moveq.l	#$0f,d3
	bsr.s	Lfebb50
	move.w	(a6),d2
	lea.l	($00010c6e),a1
	bsr.s	Lfebb6c
	moveq.l	#$37,d2			;'7'
	moveq.l	#$0f,d3
	moveq.l	#$03,d4
	lea.l	($00010c6e),a1
	bsr.s	Lfebb50
	moveq.l	#$3b,d2			;';'
	moveq.l	#$0f,d3
	moveq.l	#$04,d4
	lea.l	($0000fb31),a1
	bsr.s	Lfebb50
	move.l	($0002,a6),d2
	lea.l	($00010c6e),a1
	bsr.s	Lfebb66
	moveq.l	#$40,d2			;'@'
	moveq.l	#$0f,d3
	moveq.l	#$07,d4
	lea.l	($00010c6e),a1
	bsr.s	Lfebb50
	moveq.l	#$48,d2			;'H'
	moveq.l	#$0f,d3
	moveq.l	#$01,d4
	lea.l	($0000fb37),a1
	bra.s	Lfebb50

Lfebb3e:
	move.w	(a1)+,d2
	move.w	(a1),d3
	lea.l	($00010c6e),a1
	move.l	#$81400000,(a1)
	moveq.l	#$01,d4
Lfebb50:
	cmpi.b	#$16,($00e80029)
	beq.s	Lfebb5e
	sub.w	#$0010,d2
Lfebb5e:
	moveq.l	#$0d,d1
	IOCS	_B_PUTMES
	rts

Lfebb66:
	swap.w	d2
	bsr.s	Lfebb6c
	swap.w	d2
Lfebb6c:
	rol.w	#4,d2
	bsr.s	Lfebb7a
	rol.w	#4,d2
	bsr.s	Lfebb7a
	rol.w	#4,d2
	bsr.s	Lfebb7a
	rol.w	#4,d2
Lfebb7a:
	move.w	d2,d1
	and.w	#$000f,d1
	cmp.w	#$000a,d1
	bcs.s	Lfebb88
	addq.w	#7,d1
Lfebb88:
	add.w	#$0030,d1
	move.b	d1,(a1)+
	clr.b	(a1)
	rts

Lfebb92:
	addq.w	#1,($0000ff60)
	cmpi.w	#$0001,($0000ff60)
	bne.s	Lfebc1a
	bsr.w	Lfebc96
	lea.l	($0000ff3e),a1
	move.b	($00e8e001),d0
	move.w	d0,(a1)+
	lea.l	($00e82200),a0
	moveq.l	#$0f,d0
Lfebbbc:
	move.w	(a0)+,(a1)+
	dbra.w	d0,Lfebbbc
	move.b	($00ed0028),($00e8e001)
	lea.l	($00e82200),a0
	move.w	($00ed002e),d0
	move.w	d0,(a0)+
	move.w	($00ed0034),d0
	move.w	d0,(a0)+
	move.w	($00ed002e),d0
	move.w	d0,(a0)+
	move.w	($00ed0034),d0
	move.w	d0,(a0)+
	moveq.l	#$02,d1
Lfebbf4:
	addq.l	#2,a0
	move.w	($00ed0034),d0
	move.w	d0,(a0)+
	addq.l	#4,a0
	dbra.w	d1,Lfebbf4
	lea.l	($0000fb0e),a1
	bsr.w	Lfebcbe
	lea.l	($0000ff62),a1
	move.l	d0,(a1)+
	moveq.l	#$17,d0
	bsr.s	Lfebc4e
Lfebc1a:
	rts

Lfebc1c:
	subq.w	#1,($0000ff60)
	bne.s	Lfebc1a
	bsr.s	Lfebc96
	lea.l	($0000ff3e),a1
	move.w	(a1)+,d0
	move.b	d0,($00e8e001)
	lea.l	($00e82200),a0
	moveq.l	#$0f,d0
Lfebc3c:
	move.w	(a1)+,(a0)+
	dbra.w	d0,Lfebc3c
	lea.l	($0000ff62),a1
	bsr.w	Lfebcd2
	moveq.l	#$18,d0
Lfebc4e:
	move.w	(a1)+,d1
	move.w	(a1)+,d2
	move.l	(a1)+,d3
	movem.l	d0-d3,-(a7)
	lea.l	($0000ff6e),a1
	movea.l	#$00e07816,a2
	bsr.s	Lfebc76
	movem.l	(a7)+,d0-d3
	lea.l	($000105ee),a1
	movea.l	#$00e27816,a2
Lfebc76:
	cmpi.b	#$16,($00e80029)
	beq.s	Lfebc86
	suba.l	#$00000010,a2
Lfebc86:
	move.w	d0,-(a7)
	IOCS	_B_CUROFF
	move.w	(a7)+,d0
	trap	#15
	IOCS	_B_CURON
	rts

Lfebc96:
	btst.b	#$04,($00e88001)
	bne.s	Lfebc96
	rts

Lfebca2:
	IOCS	_ABORTRST
Lfebca6:
	IOCS	_B_KEYSNS
	tst.l	d0
	beq.s	Lfebcb4
	clr.l	d0
	trap	#15
	bra.s	Lfebca6

Lfebcb4:
	clr.l	d0
	trap	#15
	tst.b	d0
	beq.s	Lfebcb4
	rts

Lfebcbe:
	move.w	(a1)+,d1
	move.w	(a1)+,d2
	cmpi.b	#$16,($00e80029)
	beq.s	Lfebcd6
	sub.w	#$0010,d1
	bra.s	Lfebcd6

Lfebcd2:
	move.w	(a1)+,d1
	move.w	(a1)+,d2
Lfebcd6:
	IOCS	_B_LOCATE
	rts

Lfebcdc:
	.dc.b	$20,$00,$00,$00,$68,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$5a,$00,$43,$4f
	.dc.b	$4d,$4d,$41,$4e,$44,$2e,$58,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$82,$aa,$81,$40,$8b,$4e,$93,$ae
	.dc.b	$82,$c5,$82,$ab,$82,$dc,$82,$b9
	.dc.b	$82,$f1,$82,$c5,$82,$b5,$82,$bd
	.dc.b	$81,$42,$00,$8f,$49,$97,$b9,$82
	.dc.b	$b5,$82,$dc,$82,$b5,$82,$bd,$81
	.dc.b	$42,$00,$83,$52,$83,$7d,$83,$93
	.dc.b	$83,$68,$82,$f0,$81,$41,$93,$fc
	.dc.b	$97,$cd,$82,$b5,$82,$c4,$82,$ad
	.dc.b	$82,$be,$82,$b3,$82,$a2,$0d,$0a
	.dc.b	$23,$00,$92,$e2,$8e,$7e,$82,$b5
	.dc.b	$82,$dc,$82,$b5,$82,$bd,$81,$42
	.dc.b	$00,$0d,$0a,$1b,$5b,$6d,$83,$56
	.dc.b	$83,$58,$83,$65,$83,$80,$82,$f0
	.dc.b	$8b,$4e,$93,$ae,$82,$c5,$82,$ab
	.dc.b	$82,$dc,$82,$b9,$82,$f1,$82,$c5
	.dc.b	$82,$b5,$82,$bd,$81,$42,$83,$8a
	.dc.b	$83,$5a,$83,$62,$83,$67,$82,$b5
	.dc.b	$82,$c4,$82,$ad,$82,$be,$82,$b3
	.dc.b	$82,$a2,$00,$5e,$43,$0d,$0a,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$d6,$02,$00,$00,$ff,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$0b
	.dc.b	$70,$61,$74,$68,$3d,$00,$00,$72
	.dc.b	$00,$7a,$00,$78,$00,$00,$2e,$2a
	.dc.b	$00,$00,$00,$00,$00,$00,$c5,$5a
	.dc.b	$1f,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$11,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$01,$01,$02,$02,$03,$03,$04,$04
	.dc.b	$00,$00,$01,$01,$02,$02,$03,$03
	.dc.b	$04,$04,$ff,$ff,$01,$c1,$00,$00
	.dc.b	$00,$00,$b8,$48,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$43,$4f,$4e,$20
	.dc.b	$20,$20,$20,$20,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$01,$c2,$01,$00
	.dc.b	$00,$00,$b8,$48,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$43,$4f,$4e,$20
	.dc.b	$20,$20,$20,$20,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$01,$c2,$02,$00
	.dc.b	$00,$00,$b8,$48,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$43,$4f,$4e,$20
	.dc.b	$20,$20,$20,$20,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$01,$c0,$02,$00
	.dc.b	$00,$00,$c3,$44,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$41,$55,$58,$20
	.dc.b	$20,$20,$20,$20,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$01,$c0,$01,$00
	.dc.b	$00,$00,$c4,$30,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$50,$52,$4e,$20
	.dc.b	$20,$20,$20,$20,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$20,$02,$00,$00,$00
	.dc.b	$d8,$e6,$00,$00,$dc,$f6,$ff,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$ff,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$fe,$20,$43,$31
	.dc.b	$20,$20,$20,$20,$1b,$53,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$fe,$20,$43,$55
	.dc.b	$20,$20,$20,$20,$1b,$54,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$fe,$20,$43,$41
	.dc.b	$20,$20,$20,$20,$1b,$55,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$fe,$20,$53,$31
	.dc.b	$20,$20,$20,$20,$1b,$56,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$fe,$20,$53,$55
	.dc.b	$20,$20,$20,$20,$1b,$57,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$fe,$56,$4f,$49
	.dc.b	$44,$20,$20,$20,$1b,$45,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$fe,$4e,$57,$4c
	.dc.b	$20,$20,$20,$20,$1b,$4a,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$fe,$49,$4e,$53
	.dc.b	$20,$20,$20,$20,$1b,$50,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$fe,$4e,$26,$43
	.dc.b	$55,$20,$20,$20,$1b,$46,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$fe,$45,$4f,$46
	.dc.b	$20,$20,$20,$20,$1b,$5a,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$44,$49,$52,$20
	.dc.b	$41,$3a,$2a,$2e,$2a,$0d,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$44,$49,$52,$20
	.dc.b	$42,$3a,$2a,$2e,$2a,$0d,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$43,$4f,$50,$59
	.dc.b	$20,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$44,$45,$4c,$20
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$52,$45,$4e,$20
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$44,$49,$52,$20
	.dc.b	$41,$3a,$2a,$2e,$2a,$2f,$57,$0d
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$44,$49,$52,$20
	.dc.b	$42,$3a,$2a,$2e,$2a,$2f,$57,$0d
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$54,$59,$50,$45
	.dc.b	$20,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$44,$41,$54,$45
	.dc.b	$0d,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$54,$49,$4d,$45
	.dc.b	$0d,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$1b,$45,$2b,$0d
	.dc.b	$00,$00,$1b,$45,$2d,$0d,$00,$00
	.dc.b	$1b,$50,$00,$00,$00,$00,$1b,$56
	.dc.b	$00,$00,$00,$00,$1b,$4a,$00,$00
	.dc.b	$00,$00,$08,$00,$00,$00,$00,$00
	.dc.b	$1b,$53,$00,$00,$00,$00,$1b,$55
	.dc.b	$00,$00,$00,$00,$43,$4c,$53,$0d
	.dc.b	$00,$00,$48,$49,$53,$0d,$00,$00
	.dc.b	$1b,$45,$00,$00,$00,$00,$1b,$55
	.dc.b	$0d,$00,$00,$00
Lfee1d0:
	move.b	(-$0002,a0),d0
	rol.w	#8,d0
	move.b	(-$0001,a0),d0
	cmp.w	#$829f,d0
	bcs.s	Lfee202
	cmp.w	#$82fd,d0
	bcs.s	Lfee1f8
	cmp.w	#$839f,d0
	bcc.s	Lfee202
	cmp.b	#$7f,d0
	bcs.s	Lfee1f4
	subq.b	#1,d0
Lfee1f4:
	add.b	#$5f,d0			;'_'
Lfee1f8:
	bsr.s	Lfee25e
	bne.s	Lfee202
	addq.b	#2,(-$0001,a0)
	rts

Lfee202:
	move.b	#$81,(a0)+
	move.b	#$4b,(a0)+		;'K'
	clr.b	(a0)
	rts

Lfee20e:
	move.b	(-$0002,a0),d0
	rol.w	#8,d0
	move.b	(-$0001,a0),d0
	cmp.w	#$829f,d0
	bcs.s	Lfee24a
	cmp.w	#$82fd,d0
	bcs.s	Lfee23c
	cmp.w	#$839f,d0
	bcc.s	Lfee24a
	cmp.b	#$7f,d0
	bcs.s	Lfee232
	subq.b	#1,d0
Lfee232:
	add.b	#$5f,d0			;'_'
	cmp.b	#$a4,d0
	beq.s	Lfee256
Lfee23c:
	bsr.s	Lfee27a
	beq.s	Lfee244
	bsr.s	Lfee25e
	bne.s	Lfee24a
Lfee244:
	addq.b	#1,(-$0001,a0)
	rts

Lfee24a:
	move.b	#$81,(a0)+
	move.b	#$4a,(a0)+		;'J'
	clr.b	(a0)
	rts

Lfee256:
	move.b	#$94,(-$0001,a0)
	rts

Lfee25e:
	movem.l	d1/a1,-(a7)
	lea.l	($0000faa5),a1
	moveq.l	#$04,d1
Lfee26a:
	cmp.b	(a1)+,d0
	beq.s	Lfee274
	dbra.w	d1,Lfee26a
	tst.w	d1
Lfee274:
	movem.l	(a7)+,d1/a1
	rts

Lfee27a:
	movem.l	d1/a1,-(a7)
	lea.l	($0000fa96),a1
	moveq.l	#$0e,d1
Lfee286:
	cmp.b	(a1)+,d0
	beq.s	Lfee290
	dbra.w	d1,Lfee286
	tst.w	d1
Lfee290:
	movem.l	(a7)+,d1/a1
	rts

Lfee296:
	.dc.b	'ｩｫｭｯｱｳｵｷｹｻｽｿﾂﾄﾆﾍﾐﾓﾖﾙcdefghijkl89^7<;=>?T6:',$00,$00
Lfee2c2:
	.dc.b	'愷',$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00
Lfee2fb:
	.dc.b	$16,$00,$0f,$00,$16,$00,$10,$00
	.dc.b	$23,$00,$10,$00,$30,$00,$10,$00
	.dc.b	$3b,$00,$10,$00,$42,$00,$10,$20
	.dc.b	$83,$47,$83,$89,$81,$5b,$28,$24
	.dc.b	$00,$29,$82,$aa,$94,$ad,$90,$b6
	.dc.b	$82,$b5,$82,$dc,$82,$b5,$82,$bd
	.dc.b	$28,$53,$52,$3d,$24,$00,$3a,$50
	.dc.b	$43,$3d,$24,$00,$29,$20,$00,$81
	.dc.b	$40,$81,$40,$81,$40,$20,$92,$86
	.dc.b	$8e,$7e,$81,$83,$82,$60,$81,$84
	.dc.b	$20,$8d,$c4,$8e,$c0,$8d,$73,$81
	.dc.b	$83,$82,$71,$81,$84,$20,$96,$b3
	.dc.b	$8e,$8b,$81,$83,$82,$68,$81,$84
	.dc.b	$20,$81,$48,$81,$40,$81,$40,$81
	.dc.b	$40,$81,$40,$00,$20,$20,$83,$6f
	.dc.b	$83,$58,$83,$47,$83,$89,$81,$5b
	.dc.b	$82,$aa,$94,$ad,$90,$b6,$82,$b5
	.dc.b	$82,$dc,$82,$b5,$82,$bd,$20,$20
	.dc.b	$00,$83,$41,$83,$68,$83,$8c,$83
	.dc.b	$58,$83,$47,$83,$89,$81,$5b,$82
	.dc.b	$aa,$94,$ad,$90,$b6,$82,$b5,$82
	.dc.b	$dc,$82,$b5,$82,$bd,$00,$20,$82
	.dc.b	$a8,$82,$a9,$82,$b5,$82,$c8,$96
	.dc.b	$bd,$97,$df,$82,$f0,$8e,$c0,$8d
	.dc.b	$73,$82,$b5,$82,$dc,$82,$b5,$82
	.dc.b	$bd,$20,$00,$81,$40,$81,$40,$20
	.dc.b	$82,$4f,$82,$c5,$8f,$9c,$8e,$5a
	.dc.b	$82,$b5,$82,$dc,$82,$b5,$82,$bd
	.dc.b	$20,$20,$20,$20,$20,$20,$20,$00
	.dc.b	$81,$40,$82,$62,$82,$67,$82,$6a
	.dc.b	$96,$bd,$97,$df,$82,$f0,$8e,$c0
	.dc.b	$8d,$73,$82,$b5,$82,$dc,$82,$b5
	.dc.b	$82,$bd,$81,$40,$00,$82,$73,$82
	.dc.b	$71,$82,$60,$82,$6f,$82,$75,$96
	.dc.b	$bd,$97,$df,$82,$f0,$8e,$c0,$8d
	.dc.b	$73,$82,$b5,$82,$dc,$82,$b5,$82
	.dc.b	$bd,$00,$20,$20,$20,$93,$c1,$8c
	.dc.b	$a0,$96,$bd,$97,$df,$82,$f0,$8e
	.dc.b	$67,$97,$70,$82,$b5,$82,$dc,$82
	.dc.b	$b5,$82,$bd,$20,$20,$20,$00,$20
	.dc.b	$49,$6e,$74,$65,$72,$72,$75,$70
	.dc.b	$74,$bd,$b2,$af,$c1,$82,$aa,$89
	.dc.b	$9f,$82,$b3,$82,$ea,$82,$dc,$82
	.dc.b	$b5,$82,$bd,$00,$81,$40,$81,$40
	.dc.b	$81,$40,$81,$40,$81,$40,$96,$b3
	.dc.b	$8c,$f8,$82,$c8,$83,$86,$83,$6a
	.dc.b	$83,$62,$83,$67,$94,$d4,$8d,$86
	.dc.b	$82,$f0,$8e,$77,$92,$e8,$82,$b5
	.dc.b	$82,$dc,$82,$b5,$82,$bd,$81,$40
	.dc.b	$81,$40,$81,$40,$81,$40,$81,$40
	.dc.b	$00,$81,$40,$81,$40,$81,$40,$83
	.dc.b	$66,$83,$42,$83,$58,$83,$4e,$82
	.dc.b	$aa,$93,$fc,$82,$c1,$82,$c4,$82
	.dc.b	$a2,$82,$dc,$82,$b9,$82,$f1,$81
	.dc.b	$41,$93,$fc,$82,$ea,$82,$c4,$82
	.dc.b	$ad,$82,$be,$82,$b3,$82,$a2,$81
	.dc.b	$40,$81,$40,$81,$40,$00,$81,$40
	.dc.b	$20,$83,$66,$83,$6f,$83,$43,$83
	.dc.b	$58,$83,$68,$83,$89,$83,$43,$83
	.dc.b	$6f,$82,$c9,$96,$b3,$8c,$f8,$82
	.dc.b	$c8,$83,$52,$83,$7d,$83,$93,$83
	.dc.b	$68,$82,$f0,$8e,$77,$92,$e8,$82
	.dc.b	$b5,$82,$dc,$82,$b5,$82,$bd,$20
	.dc.b	$81,$40,$00,$20,$20,$20,$20,$20
	.dc.b	$20,$20,$20,$20,$20,$20,$20,$20
	.dc.b	$20,$20,$20,$20,$20,$20,$20,$82
	.dc.b	$62,$82,$71,$82,$62,$83,$47,$83
	.dc.b	$89,$81,$5b,$81,$40,$81,$40,$81
	.dc.b	$40,$81,$40,$81,$40,$81,$40,$81
	.dc.b	$40,$81,$40,$81,$40,$81,$40,$00
	.dc.b	$20,$83,$66,$83,$42,$83,$58,$83
	.dc.b	$4e,$82,$cc,$8a,$c7,$97,$9d,$97
	.dc.b	$cc,$88,$e6,$82,$aa,$94,$6a,$89
	.dc.b	$f3,$82,$b3,$82,$ea,$82,$c4,$82
	.dc.b	$a2,$82,$dc,$82,$b7,$81,$41,$8e
	.dc.b	$67,$97,$70,$95,$73,$94,$5c,$82
	.dc.b	$c5,$82,$b7,$20,$00,$20,$20,$20
	.dc.b	$20,$20,$20,$20,$20,$20,$20,$20
	.dc.b	$20,$20,$20,$20,$20,$20,$20,$20
	.dc.b	$20,$83,$56,$81,$5b,$83,$4e,$83
	.dc.b	$47,$83,$89,$81,$5b,$81,$40,$81
	.dc.b	$40,$81,$40,$81,$40,$81,$40,$81
	.dc.b	$40,$81,$40,$81,$40,$81,$40,$81
	.dc.b	$40,$00,$20,$20,$20,$20,$20,$20
	.dc.b	$20,$20,$20,$20,$20,$20,$96,$b3
	.dc.b	$8c,$f8,$82,$c8,$83,$81,$83,$66
	.dc.b	$83,$42,$83,$41,$82,$f0,$8e,$67
	.dc.b	$97,$70,$82,$b5,$82,$dc,$82,$b5
	.dc.b	$82,$bd,$20,$20,$81,$40,$81,$40
	.dc.b	$81,$40,$81,$40,$81,$40,$00,$81
	.dc.b	$40,$81,$40,$81,$40,$81,$40,$81
	.dc.b	$40,$81,$40,$81,$40,$20,$83,$5a
	.dc.b	$83,$4e,$83,$5e,$82,$aa,$8c,$a9
	.dc.b	$82,$c2,$82,$a9,$82,$e8,$82,$dc
	.dc.b	$82,$b9,$82,$f1,$20,$81,$40,$81
	.dc.b	$40,$81,$40,$81,$40,$81,$40,$81
	.dc.b	$40,$81,$40,$00,$81,$40,$81,$40
	.dc.b	$81,$40,$81,$40,$81,$40,$81,$40
	.dc.b	$83,$76,$83,$8a,$83,$93,$83,$5e
	.dc.b	$82,$aa,$82,$c2,$82,$c8,$82,$aa
	.dc.b	$82,$c1,$82,$c4,$82,$a2,$82,$dc
	.dc.b	$82,$b9,$82,$f1,$81,$40,$81,$40
	.dc.b	$81,$40,$81,$40,$81,$40,$81,$40
	.dc.b	$00,$81,$40,$81,$40,$81,$40,$81
	.dc.b	$40,$81,$40,$81,$40,$81,$40,$81
	.dc.b	$40,$81,$40,$20,$8f,$91,$82,$ab
	.dc.b	$8d,$9e,$82,$dd,$83,$47,$83,$89
	.dc.b	$81,$5b,$20,$81,$40,$81,$40,$81
	.dc.b	$40,$81,$40,$81,$40,$81,$40,$81
	.dc.b	$40,$81,$40,$81,$40,$00,$81,$40
	.dc.b	$81,$40,$81,$40,$81,$40,$81,$40
	.dc.b	$81,$40,$81,$40,$81,$40,$81,$40
	.dc.b	$20,$93,$c7,$82,$dd,$8d,$9e,$82
	.dc.b	$dd,$83,$47,$83,$89,$81,$5b,$20
	.dc.b	$81,$40,$81,$40,$81,$40,$81,$40
	.dc.b	$81,$40,$81,$40,$81,$40,$81,$40
	.dc.b	$81,$40,$00,$81,$40,$81,$40,$81
	.dc.b	$40,$81,$40,$81,$40,$81,$40,$81
	.dc.b	$40,$83,$47,$83,$89,$81,$5b,$82
	.dc.b	$aa,$94,$ad,$90,$b6,$82,$b5,$82
	.dc.b	$dc,$82,$b5,$82,$bd,$81,$40,$81
	.dc.b	$40,$81,$40,$81,$40,$81,$40,$81
	.dc.b	$40,$81,$40,$81,$40,$81,$40,$00
	.dc.b	$20,$83,$76,$83,$8d,$83,$65,$83
	.dc.b	$4e,$83,$67,$82,$f0,$82,$cd,$82
	.dc.b	$b8,$82,$b5,$82,$c4,$81,$41,$93
	.dc.b	$af,$82,$b6,$83,$66,$83,$42,$83
	.dc.b	$58,$83,$4e,$82,$f0,$93,$fc,$82
	.dc.b	$ea,$82,$c4,$82,$ad,$82,$be,$82
	.dc.b	$b3,$82,$a2,$20,$00,$20,$20,$20
	.dc.b	$20,$20,$20,$20,$20,$20,$20,$20
	.dc.b	$20,$20,$20,$20,$20,$20,$8f,$91
	.dc.b	$82,$ab,$8d,$9e,$82,$dd,$95,$73
	.dc.b	$89,$c2,$94,$5c,$82,$c5,$82,$b7
	.dc.b	$20,$20,$20,$20,$20,$20,$20,$20
	.dc.b	$20,$20,$20,$20,$20,$20,$20,$20
	.dc.b	$20,$00,$00,$00,$0e,$00,$00,$f8
	.dc.b	$3e,$ff,$c0,$ff,$fe,$de,$6c,$de
	.dc.b	$6c,$de,$6c,$de,$6c,$40,$22,$40
	.dc.b	$22,$40,$22,$40,$22,$40,$22,$40
	.dc.b	$22,$40,$22,$40,$22,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$33,$00,$1f,$00
	.dc.b	$00,$00,$4c,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$01,$00
	.dc.b	$00,$00,$00,$00,$00,$ff,$ff,$ff
	.dc.b	$ff,$00,$01,$0d,$78,$00,$01,$0d
	.dc.b	$78,$00,$01,$0d,$78,$00,$01,$0d
	.dc.b	$18,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$27,$00,$00
	.dc.b	$01,$0d,$78,$00,$00,$00,$01,$0d
	.dc.b	$7a,$00,$01,$0d,$7a,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$60,$fe,$00
	.dc.b	$00,$89,$c4,$00,$00,$74,$a4,$00
	.dc.b	$00,$74,$d6,$00,$00,$75,$26,$00
	.dc.b	$00,$75,$42,$00,$00,$75,$62,$00
	.dc.b	$00,$75,$82,$00,$00,$75,$a8,$00
	.dc.b	$00,$75,$be,$00,$00,$75,$e6,$00
	.dc.b	$00,$76,$00,$00,$00,$79,$fc,$00
	.dc.b	$00,$7a,$22,$00,$00,$95,$ea,$00
	.dc.b	$00,$8b,$8a,$00,$00,$95,$f2,$00
	.dc.b	$00,$7a,$52,$00,$00,$7a,$5a,$00
	.dc.b	$00,$7a,$60,$00,$00,$7a,$66,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$8b,$a2,$00
	.dc.b	$00,$bc,$96,$00,$00,$8c,$16,$00
	.dc.b	$00,$75,$f6,$00,$00,$8a,$26,$00
	.dc.b	$00,$8a,$4c,$00,$00,$8a,$da,$00
	.dc.b	$00,$8a,$f2,$00,$00,$8b,$0c,$00
	.dc.b	$00,$9a,$16,$00,$00,$bf,$12,$00
	.dc.b	$00,$bf,$40,$00,$00,$b9,$b6,$00
	.dc.b	$00,$c2,$de,$00,$00,$9a,$7a,$00
	.dc.b	$00,$7e,$12,$00,$00,$99,$a8,$00
	.dc.b	$00,$99,$c4,$00,$00,$8c,$48,$00
	.dc.b	$00,$99,$58,$00,$00,$99,$86,$00
	.dc.b	$00,$99,$9e,$00,$00,$99,$b8,$00
	.dc.b	$00,$99,$24,$00,$00,$8e,$b2,$00
	.dc.b	$00,$9a,$6e,$00,$00,$89,$d6,$00
	.dc.b	$00,$8b,$74,$00,$00,$99,$36,$00
	.dc.b	$00,$8b,$4e,$00,$00,$9b,$22,$00
	.dc.b	$00,$96,$5c,$00,$00,$8c,$20,$00
	.dc.b	$00,$73,$ba,$00,$00,$96,$a0,$00
	.dc.b	$00,$97,$d6,$00,$00,$96,$f0,$00
	.dc.b	$00,$8c,$60,$00,$00,$8d,$64,$00
	.dc.b	$00,$8e,$26,$00,$00,$8f,$b6,$00
	.dc.b	$00,$90,$7c,$00,$00,$92,$b6,$00
	.dc.b	$00,$8e,$56,$00,$00,$94,$02,$00
	.dc.b	$00,$94,$66,$00,$00,$8e,$92,$00
	.dc.b	$00,$8e,$e8,$00,$00,$8f,$62,$00
	.dc.b	$00,$7c,$9e,$00,$00,$7d,$76,$00
	.dc.b	$00,$7d,$be,$00,$00,$7e,$96,$00
	.dc.b	$00,$89,$c8,$00,$00,$89,$e8,$00
	.dc.b	$00,$91,$6c,$00,$00,$92,$72,$00
	.dc.b	$00,$89,$f0,$00,$00,$8a,$12,$00
	.dc.b	$00,$cf,$ce,$00,$00,$cf,$a0,$00
	.dc.b	$00,$99,$2c,$00,$00,$73,$ba,$00
	.dc.b	$00,$93,$04,$00,$00,$8f,$2a,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$01,$0d,$78,$00,$01,$0d,$78,$00
	.dc.b	$01,$0d,$78,$00,$00,$98,$da,$00
	.dc.b	$00,$98,$ea,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$73,$ba,$00,$00,$73,$ba,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$00,$00,$20
	.dc.b	$00,$00,$ff,$00,$10,$20,$3c,$11
	.dc.b	$91,$01,$11,$4e,$75
Lff0010:
	move.w	#$2700,sr
	lea.l	($00002000).l,a7
	reset
	suba.l	a0,a0
	move.l	#Lff05e4,d0
	bsr.w	Lff05b4
	move.l	#Lff05c8,($0000007c).l
	move.l	#Lff1e52,d0
Lff0038:
	bsr.w	Lff05b4
	lea.l	(Lff1e66),a0
	move.l	#$000000df,d0
	lea.l	($00000400).l,a1
Lff004e:
	move.l	(a0)+,(a1)+
	dbra.w	d0,Lff004e
	move.l	#Lff0632,($000007fc).l
	move.l	#Lff0258,($000007f8).l
	move.l	#Lff063e,($000007f4).l
	lea.l	($00ed0000),a0
	lea.l	(Lff0842),a1
	moveq.l	#$07,d0
Lff0080:
	cmpm.b	(a0)+,(a1)+
	bne.s	Lff008a
	dbra.w	d0,Lff0080
	bra.s	Lff008e

Lff008a:
	bsr.w	Lff0436
Lff008e:
	bsr.w	Lff0b64
	bsr.w	Lff0db8
	clr.w	($00000cb6).l
	btst.b	#$00,($00e8e00b)
	bne.s	Lff00ae
	move.w	#$0001,($00000cb6).l
Lff00ae:
	bsr.w	Lff0aa6
	move.l	d0,($00000cb8).l
	move.w	#$2000,sr
	bsr.w	Lff0462
	move.b	($00ed0028),($00e8e001)
	move.b	#$00,($00e86001)
	move.b	#$04,($00e8a01f)
	move.l	(a7),(a7)
	nop
	move.b	#$08,($00e8a01b)
	btst.b	#$07,($00000807).l
	beq.s	Lff0166
	lea.l	($00e82200),a1
	lea.l	(Lff0870,pc),a0
	move.w	(a0)+,(a1)+
	move.w	(a0)+,(a1)+
	move.w	(a0)+,(a1)+
	move.w	(a0)+,(a1)+
	move.w	(a0),(a1)+
	move.w	(a0),(a1)+
	move.w	(a0),(a1)+
	move.w	(a0)+,(a1)+
	move.w	(a0),(a1)+
	move.w	(a0),(a1)+
	move.w	(a0),(a1)+
	move.w	(a0),(a1)+
	move.w	(a0),(a1)+
	move.w	(a0),(a1)+
	move.w	(a0),(a1)+
	move.w	(a0)+,(a1)+
	move.b	#$0f,($00e8e001)
	lea.l	(Lff09e2,pc),a1
	bsr.w	Lff756c
	lea.l	($00000800).l,a1
Lff0130:
	btst.b	#$07,($0005,a1)
	bne.w	Lff0010
	btst.b	#$06,($0002,a1)
	beq.s	Lff0130
	move.b	#$31,($00e8e00d)	;'1'
	lea.l	($00ed0000),a0
	move.w	#$0fff,d0
Lff0154:
	clr.l	(a0)+
	dbra.w	d0,Lff0154
	move.b	#$00,($00e8e00d)
	bra.w	Lff0010

Lff0166:
	lea.l	(Lff09e0),a1
	bsr.w	Lff756c
	clr.b	($000009de).l
	move.b	($0000080e).l,d0
	move.b	($00ed0058),d1
	eor.b	d1,d0
	btst.l	#$03,d0
	beq.s	Lff0198
	move.b	#$01,($000009de).l
	jsr	(Lfe0000)
Lff0198:
	bsr.w	Lff0ee0
	btst.b	#$01,($0000080e).l
	beq.s	Lff01c6
	move.w	#$9000,d1
	bsr.w	Lff0398
	move.w	#$9100,d1
	bsr.w	Lff0398
	move.w	#$9200,d1
	bsr.w	Lff0398
	move.w	#$9300,d1
	bsr.w	Lff0398
Lff01c6:
	cmpi.b	#$02,($000009df).l
	bne.s	Lff01e6
	movea.l	($00ed001e),a0
	move.l	a0,d0
	beq.s	Lff01e6
	cmpi.b	#$60,(a0)		;'`'
	bne.s	Lff01e6
	jsr	(a0)
	bra.w	Lff124c

Lff01e6:
	move.w	($00ed0018),d1
	beq.s	Lff0216
	btst.b	#$02,($0000080e).l
	bne.s	Lff0216
	move.w	d1,d0
	and.w	#$f000,d0
	cmp.w	#$8000,d0
	beq.s	Lff0234
	cmp.w	#$9000,d0
	beq.s	Lff024e
	cmp.w	#$a000,d0
	beq.s	Lff0228
	cmp.w	#$b000,d0
	beq.s	Lff022e
Lff0216:
	bsr.w	Lff039e
	bsr.w	Lff0328
	bsr.w	Lff02d8
	bsr.w	Lff0310
	bra.s	Lff0258

Lff0228:
	bsr.w	Lff02d8
	bra.s	Lff0216

Lff022e:
	bsr.w	Lff0310
	bra.s	Lff0216

Lff0234:
	bsr.w	Lff033e
	bra.s	Lff0216

Lff023a:
	move.w	d1,-(a7)
	moveq.l	#$05,d2
	bsr.w	Lff02ce
	move.w	(a7)+,d1
	lea.l	(Lff09e0),a1
	bsr.w	Lff756c
Lff024e:
	bsr.w	Lff037a
	bsr.w	Lff03b6
	bra.s	Lff0216

Lff0258:
	lea.l	($00002000).l,a7
	tst.b	($000009de).l
	bne.s	Lff02b4
	lea.l	(Lff08e8),a1
	bsr.w	Lff756c
	bset.b	#$00,($00e8002a)
	lea.l	(Lff067a),a1
	move.w	(Lff083e),d1
	move.w	(Lff0840),d2
	IOCS	_TEXTPUT
	bclr.b	#$00,($00e8002a)
	moveq.l	#$04,d2
	bsr.s	Lff02ce
Lff029a:
	move.w	#$9070,d1
Lff029e:
	IOCS	_B_DRVSNS
	btst.l	#$1d,d0
	bne.s	Lff023a
	add.w	#$0100,d1
	cmp.w	#$9470,d1
	bne.s	Lff029e
	bra.s	Lff029a

Lff02b4:
	lea.l	(Lff089d),a1
	bsr.w	Lff756c
	move.l	#Lff0010,-(a7)
	move.w	sr,-(a7)
	move.l	($0000007c).l,-(a7)
	rts

Lff02ce:
	move.w	#$9070,d1
	IOCS	_B_DRVCHK
	rts

Lff02d8:
	movea.l	($00ed000c),a0
	movea.l	a7,a6
	lea.l	(Lff0306),a1
	movea.l	($00000008).l,a2
	move.l	a1,($00000008).l
	movea.l	(a0),a3
	move.l	a2,($00000008).l
	move.b	#$01,($000009e0).l
	jsr	(a3)
	rts

Lff0306:
	movea.l	a6,a7
	move.l	a2,($00000008).l
	rts

Lff0310:
	movea.l	($00ed0010),a0
	cmpi.b	#$60,(a0)		;'`'
	bne.s	Lff0326
	move.b	#$02,($000009e0).l
	jsr	(a0)
Lff0326:
	rts

Lff0328:
	move.w	#$8000,d1
Lff032c:
	bsr.s	Lff033e
	tst.b	d0
	bne.s	Lff033c
	add.w	#$0100,d1
	cmp.w	#$9000,d1
	bne.s	Lff032c
Lff033c:
	rts

Lff033e:
	clr.l	d2
	move.l	#$00000400,d3
	lea.l	($00002000).l,a1
	IOCS	_B_RECALI
	tst.b	d0
	bne.s	Lff0370
	moveq.l	#$46,d0			;'F'
	move.l	a1,-(a7)
	trap	#15
	movea.l	(a7)+,a1
	tst.b	d0
	bne.s	Lff0370
	cmpi.b	#$60,(a1)		;'`'
	bne.s	Lff0370
	lsr.w	#8,d1
	move.b	d1,($000009e0).l
	jmp	(a1)

Lff0370:
	move.l	d0,-(a7)
	IOCS	_B_EJECT
	move.l	(a7)+,d0
	rts

Lff037a:
	movem.l	d0-d2,-(a7)
	move.l	#$00003a98,d2
Lff0384:
	IOCS	_B_DRVSNS
	btst.l	#$1d,d0
	bne.s	Lff0392
	dbra.w	d2,Lff0384
Lff0392:
	movem.l	(a7)+,d0-d2
	rts

Lff0398:
	IOCS	_B_EJECT
	rts

Lff039e:
	move.w	#$9070,d1
	bsr.s	Lff037a
	bsr.s	Lff03b6
	move.w	#$9170,d1
	bsr.s	Lff03b6
	move.w	#$9270,d1
	bsr.s	Lff03b6
	move.w	#$9370,d1
Lff03b6:
	moveq.l	#$01,d2
	move.l	#$00000400,d3
	lea.l	($00002000).l,a1
	movem.l	d1-d4/a1,-(a7)
	move.w	#$00bf,d4
Lff03cc:
	IOCS	_B_DRVSNS
	btst.l	#$1d,d0
	bne.s	Lff03dc
	dbra.w	d4,Lff03cc
	bra.s	Lff042c

Lff03dc:
	IOCS	_B_RECALI
	btst.l	#$1e,d0
	bne.s	Lff042c
	IOCS	_B_READID
	btst.l	#$1e,d0
	bne.s	Lff042c
	move.w	d1,d0
	lsr.w	#8,d0
	and.l	#$00000003,d0
	asl.w	#3,d0
	lea.l	($00000c90).l,a0
	adda.l	d0,a0
	clr.l	d0
	move.b	($0006,a0),d0
	ror.l	#8,d0
	or.l	d0,d2
	moveq.l	#$46,d0			;'F'
	move.l	a1,-(a7)
	trap	#15
	movea.l	(a7)+,a1
	btst.l	#$1e,d0
	bne.s	Lff042c
	cmpi.b	#$60,(a1)		;'`'
	bne.s	Lff042c
	lsr.w	#8,d1
	move.b	d1,($000009e0).l
	jmp	(a1)

Lff042c:
	IOCS	_B_EJECT
	movem.l	(a7)+,d1-d4/a1
	rts

Lff0436:
	move.b	#$31,($00e8e00d)	;'1'
	lea.l	($00ed0000),a0
	lea.l	(Lff0842),a1
	moveq.l	#$5a,d0			;'Z'
Lff044c:
	move.b	(a1)+,(a0)+
	dbra.w	d0,Lff044c
	clr.w	($00ed0100)
	move.b	#$00,($00e8e00d)
	rts

Lff0462:
	move.l	#$ffffffff,($000009d2).l
	move.b	#$00,($00e8e001)
	lea.l	($00e88000),a0
	move.b	#$00,($0005,a0)
	move.w	(a0),d0
	btst.l	#$02,d0
	beq.w	Lff0578
	btst.l	#$01,d0
	beq.w	Lff0580
	btst.l	#$00,d0
	beq.s	Lff04b2
Lff0498:
	move.b	#$04,($00e8a01f)
	bsr.w	Lff0662
	move.b	($00ed002a),d1
	IOCS	_TVCTRL
	bra.w	Lff124c

Lff04b2:
	tst.b	($00ed0026)
	bne.s	Lff0498
	lea.l	($00e8a000),a0
	move.b	#$01,($001b,a0)
	move.l	(a7),(a7)
	nop
	move.b	#$05,($0001,a0)
	move.l	(a7),(a7)
	nop
	move.b	#$0c,($001b,a0)
	move.l	($00ed0014),($000009d2).l
	clr.l	($000009d6).l
	move.l	($00ed001e),d1
	beq.s	Lff0560
	cmp.l	#$00000040,d1
	bcc.s	Lff0560
	cmp.b	#$20,d1			;' '
	bcs.s	Lff050e
	and.b	#$1f,d1
	move.w	d1,-(a7)
	moveq.l	#$25,d1			;'%'
	IOCS	_TVCTRL
	move.w	(a7)+,d1
Lff050e:
	IOCS	_TVCTRL
	lea.l	($00e88000),a0
Lff0518:
	move.w	(a0),d0
	btst.l	#$02,d0
	beq.s	Lff0578
	btst.l	#$01,d0
	beq.s	Lff0580
	btst.l	#$00,d0
	beq.s	Lff0518
	cmpi.l	#$ffffffff,($000009d2).l
	beq.s	Lff055c
	move.b	#$04,($00e8a01f)
	move.l	(a7),(a7)
	nop
	move.b	#$08,($00e8a01b)
Lff054c:
	move.w	(a0),d0
	btst.l	#$02,d0
	beq.s	Lff0578
	btst.l	#$01,d0
	beq.s	Lff0580
	bra.s	Lff054c

Lff055c:
	bra.w	Lff124c

Lff0560:
	move.b	#$02,($000009df).l
	move.l	($00ed001e),d0
	cmp.l	#$ffffffff,d0
	bne.s	Lff05ac
	rts

Lff0578:
	clr.b	($000009df).l
	bra.s	Lff0588

Lff0580:
	move.b	#$01,($000009df).l
Lff0588:
	lea.l	($00e8a000),a0
	move.b	#$01,($001b,a0)
	move.b	($00ed0026),d0
	beq.s	Lff059e
	moveq.l	#$07,d0
Lff059e:
	move.b	d0,($0001,a0)
	move.l	(a7),(a7)
	nop
	move.b	#$08,($001b,a0)
Lff05ac:
	moveq.l	#$3d,d1			;'='
	IOCS	_TVCTRL
	rts

Lff05b4:
	move.l	#L000000,d1
	move.w	#$00ff,d2
Lff05be:
	move.l	d0,(a0)+
	add.l	d1,d0
	dbra.w	d2,Lff05be
	rts

Lff05c8:
	move.b	#$0c,($00e8e007)
	movem.l	d0-d7/a0-a6,-(a7)
	move.w	#$301f,d7
	lea.l	($003c,a7),a6
	trap	#14
	movem.l	(a7)+,d0-d7/a0-a6
	rte

Lff05e4:
	bsr.s	Lff05e8
	nop
Lff05e8:
	move.l	(a7)+,d7
	clr.w	d7
	swap.w	d7
	lsr.w	#8,d7
	cmp.w	#$0002,d7
	beq.s	Lff05fc
	cmp.w	#$0003,d7
	bne.s	Lff0626
Lff05fc:
	addq.l	#6,a7
	swap.w	d7
	move.w	(a7)+,d7
	movea.l	($0002,a7),a6
	cmp.w	(a6),d7
	beq.s	Lff061e
	cmp.w	-(a6),d7
	beq.s	Lff061e
	cmp.w	-(a6),d7
	beq.s	Lff061e
	cmp.w	-(a6),d7
	beq.s	Lff061e
	cmp.w	-(a6),d7
	beq.s	Lff061e
	cmp.w	-(a6),d7
	bne.s	Lff0622
Lff061e:
	move.l	a6,($0002,a7)
Lff0622:
	clr.w	d7
	swap.w	d7
Lff0626:
	movea.l	a7,a6
	trap	#14
Lff062a:
	move.w	#$00ff,d0
	trap	#15
	bra.s	Lff062a

Lff0632:
	lea.l	(Lff09ab),a1
	bsr.w	Lff756c
Lff063c:
	bra.s	Lff063c

Lff063e:
	clr.w	($00000ade).l
	clr.b	($00000bc4).l
	clr.b	($00000bc5).l
	bset.b	#$04,($00e88013)
	bclr.b	#$07,($00000bbf).l
	rts

Lff0662:
	move.l	d1,-(a7)
	move.w	#$0a28,d1
Lff0668:
	move.w	($00000cb8).l,d0
Lff066e:
	dbra.w	d0,Lff066e
	dbra.w	d1,Lff0668
	move.l	(a7)+,d1
	rts

Lff067a:
	ori.b	#$40,(-$0001)
	DOS	_CHANGE_PR
	DOS	_CHANGE_PR
	DOS	_CHANGE_PR
	DOS	_CHANGE_PR
	DOS	_CHANGE_PR
	DOS	_CHANGE_PR
	DOS	_CHANGE_PR
	DOS	_CHANGE_PR
	DOS	_CHANGE_PR
	DOS	_CHANGE_PR
	DOS	_CHANGE_PR
	DOS	_CHANGE_PR
	DOS	_CHANGE_PR
	DOS	_CHANGE_PR
	DOS	_CHANGE_PR
	DOS	_CHANGE_PR
	DOS	_CHANGE_PR
	DOS	_CHANGE_PR
	DOS	_CHANGE_PR
	DOS	_CHANGE_PR
	DOS	_CHANGE_PR
	DOS	_CHANGE_PR
	DOS	_CHANGE_PR
	DOS	_CHANGE_PR
	DOS	_CHANGE_PR
	DOS	_CHANGE_PR
	DOS	_CHANGE_PR
	DOS	_CHANGE_PR
	DOS	_CHANGE_PR
	DOS	_CHANGE_PR
	DOS	_CHANGE_PR
	DOS	_CHANGE_PR
	DOS	_CHANGE_PR
	DOS	_CHANGE_PR
	DOS	_CHANGE_PR
	DOS	_CHANGE_PR
	DOS	_CHANGE_PR
	DOS	_CHANGE_PR
	DOS	_CHANGE_PR
	DOS	_CHANGE_PR
	DOS	_CHANGE_PR
	DOS	_CHANGE_PR
	DOS	_CHANGE_PR
	DOS	_CHANGE_PR
	DOS	_CHANGE_PR
	DOS	_CHANGE_PR
	DOS	_CHANGE_PR
	DOS	_CHANGE_PR
	DOS	_CHANGE_PR
	DOS	_CHANGE_PR
	DOS	_CHANGE_PR
	DOS	_CHANGE_PR
	DOS	_CHANGE_PR
	DOS	_CHANGE_PR
	DOS	_CHANGE_PR
	DOS	_CHANGE_PR
	DOS	_CHANGE_PR
	DOS	_CHANGE_PR
	DOS	_CHANGE_PR
	DOS	_CHANGE_PR
	DOS	_CHANGE_PR
	DOS	_CHANGE_PR
	ori.b	#$07,d0
	DOS	_CHANGE_PR
	DOS	_EXIT

Lff0704:
	.dc.b	$00,$00,$07,$ff,$ff,$ff,$00,$00
	.dc.b	$03,$e7,$ff,$ff,$ff,$00,$00,$03
	.dc.b	$e7,$ff,$ff,$ff,$00,$00,$03,$e7
	.dc.b	$ff,$ff,$ff,$00,$00,$03,$e7,$ff
	.dc.b	$ff,$ff,$00,$00,$03,$e7,$ff,$ff
	.dc.b	$ff,$00,$00,$03,$e0,$03,$ff,$ff
	.dc.b	$00,$00,$03,$e7,$fc,$ff,$ff,$00
	.dc.b	$00,$03,$e7,$ff,$7f,$ff,$00,$00
	.dc.b	$00,$07,$ff,$7f,$ff,$00,$07,$80
	.dc.b	$00,$3f,$bf,$ff,$00,$0f,$c3,$c7
	.dc.b	$df,$bf,$ff,$3f,$8f,$c3,$e7,$df
	.dc.b	$df,$ff,$3f,$8f,$c1,$f7,$ef,$df
	.dc.b	$ff,$00,$0f,$c0,$fb,$ef,$ef,$ff
	.dc.b	$00,$07,$80,$7c,$ef,$ef,$ff,$00
	.dc.b	$00,$00,$3f,$1f,$f7,$ff,$00,$08
	.dc.b	$00,$1f,$ff,$f7,$ff,$00,$00,$00
	.dc.b	$0f,$ff,$fb,$ff,$00,$00,$00,$0f
	.dc.b	$ff,$fb,$ff,$00,$00,$00,$07,$ff
	.dc.b	$fb,$ff,$00,$00,$00,$03,$ff,$fd
	.dc.b	$ff,$00,$00,$00,$05,$ff,$fd,$ff
	.dc.b	$00,$00,$00,$06,$ff,$fe,$ff,$00
	.dc.b	$00,$00,$07,$7f,$ff,$ff,$00,$00
	.dc.b	$07,$07,$8f,$ff,$ff,$00,$00,$07
	.dc.b	$07,$f1,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$fe,$7f,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff
Lff083e:
	.dc.w	$01f8
Lff0840:
	.dc.w	$00e0
Lff0842:
	.dc.b	'Ｘ68000W',$00
Lff084b:
	.dc.b	$20,$00,$00,$00,$fc,$00,$00,$00
	.dc.b	$ed,$01,$00,$ff,$ff,$ff,$ff,$00
	.dc.b	$00,$4e,$07,$00,$10,$00,$00,$00
	.dc.b	$00,$ff,$ff,$00,$00,$07,$00,$0e
	.dc.b	$00,$0d,$00,$00,$00
Lff0870:
	.dc.b	$00,$00,$f8,$3e,$ff,$c0,$ff,$fe
	.dc.b	$de,$6c,$40,$22,$03,$02,$00,$08
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$ff,$dc,$00,$04,$00
	.dc.b	$01,$01,$00,$00,$00,$20,$00,$09
	.dc.b	$f9,$01,$00,$00,$00
Lff089d:
	.dc.b	$1b,'[16;30Hディスクから起動できません。',$1b,'[17;29Hターミ'
	.dc.b	'ナルモニタを起動します。',$00
Lff08e8:
	.dc.b	$1b,'[43;1m',$1b,'[15;26H                                   '
	.dc.b	'   ',$1b,'[16;26H      ディスクから起動できません。    ',$1b
	.dc.b	'[17;26H 正しいディスクをセットしてください。 ',$1b,'[18;26H'
	.dc.b	'                                      ',$1b,'[m',$00
Lff09ab:
	.dc.b	$1b,'[20;25Hエラーが発生しました。リセットしてください。',$00
Lff09e0:
	.dc.b	$1a,$00
Lff09e2:
	.dc.b	$1a,$1b,'[43;1m',$1b,'[15;26H                               '
	.dc.b	'       ',$1b,'[16;26H      Ｓ-ＲＡＭを初期化します。       '
	.dc.b	$1b,'[17;26H      よろしいですか？(Y/N)           ',$1b,'[18'
	.dc.b	';26H                                      ',$1b,'[m',$00
Lff0aa6:
	link.w	a6,#-$002e
	move.w	#$002e,d0		;'.'
	subq.w	#1,d0
	lea.l	(Lff0b36,pc),a0
	lea.l	(-$002e,a6),a1
Lff0ab8:
	move.b	(a0)+,(a1)+
	dbra.w	d0,Lff0ab8
	movem.l	d1-d2/a0-a1,-(a7)
	move.w	sr,-(a7)
	ori.w	#$0700,sr
	lea.l	($00e88000),a0
	movep.w	($0013,a0),d0
	move.w	d0,-(a7)
	moveq.l	#$20,d0			;' '
	movep.w	d0,($0013,a0)
	movep.w	($0007,a0),d0
	move.w	d0,-(a7)
	moveq.l	#$20,d0			;' '
	movep.w	d0,($0007,a0)
	move.b	($001d,a0),d0
	move.b	d0,-(a7)
	clr.b	($001d,a0)
	move.l	($00000114).l,-(a7)
	pea.l	(Lff0b5a,pc)
	move.l	(a7)+,($00000114).l
	bsr.s	Lff0b36
	move.w	d1,d2
	swap.w	d2
	lea.l	(-$002e,a6),a1
	jsr	(a1)
	move.w	d1,d2
	move.b	#$c8,($0023,a0)
	move.l	(a7)+,($00000114).l
	move.b	(a7)+,($001d,a0)
	move.w	(a7)+,d0
	movep.w	d0,($0007,a0)
	move.w	(a7)+,d0
	movep.w	d0,($0013,a0)
	move.l	d2,d0
	move.w	(a7)+,sr
	movem.l	(a7)+,d1-d2/a0-a1
	unlk	a6
	rts

Lff0b36:
	move.b	#$fa,($0023,a0)
	moveq.l	#$ff,d1
	move.w	#$2500,sr
	move.b	#$30,($001d,a0)		;'0'
Lff0b48:
	dbra.w	d1,Lff0b48
Lff0b4c:
	ori.w	#$0700,sr
	clr.b	($001d,a0)
	neg.w	d1
	subq.w	#1,d1
	rts

Lff0b5a:
	lea.l	(Lff0b4c,pc),a1
	move.l	a1,($0002,a7)
	rte

Lff0b64:
	lea.l	(Lff1e10),a0
	move.l	a0,($000000bc).l
	lea.l	(Lff0632),a0
	move.l	a0,($000000b8).l
	lea.l	(Lff1378),a0
	move.l	a0,($000000b4).l
	lea.l	(Lff8868),a0
	move.l	a0,($000000b0).l
	lea.l	(Lff1354),a0
	move.l	a0,($000000ac).l
	lea.l	(Lff1204),a0
	move.l	a0,($000000a8).l
	lea.l	($00000800).l,a0
	move.w	#$01ff,d0
Lff0bb6:
	clr.l	(a0)+
	dbra.w	d0,Lff0bb6
	lea.l	($0000081c).l,a0
	move.l	a0,($00000814).l
	move.l	a0,($00000818).l
	lea.l	($0000093c).l,a0
	move.b	($00ed001d),d0
	move.b	d0,(a0)+
	move.b	#$01,(a0)+
	move.l	#$00000080,(a0)+
	move.w	#$0001,(a0)+
	move.l	#$00e00000,(a0)+
	clr.l	(a0)+
	move.l	#$00e60000,(a0)+
	clr.l	(a0)+
	clr.l	(a0)+
	move.w	#$0400,(a0)+
	move.w	#$0400,(a0)+
	lea.l	($0000095c).l,a0
	move.l	#$00c00000,(a0)+
	move.l	#$00000800,(a0)+
	move.w	#$000f,(a0)+
	move.w	#$000f,(a0)+
	lea.l	($00000970).l,a0
	move.w	#$005f,(a0)+		;'_'
	move.w	#$001f,(a0)+
	move.l	#Lff0d3c,($0000097e).l
	move.b	#$03,($00000994).l
	move.b	#$03,($00000995).l
	move.b	#$ff,($00000993).l
	lea.l	($000009aa).l,a0
	move.l	#$00f40000,(a0)+
	move.l	#$00f00000,(a0)+
	move.l	#$00f3d000,(a0)+
	move.l	#$00f3a800,(a0)+
	move.l	#$00f40000,(a0)+
	move.l	#$00f00000,(a0)+
	lea.l	($000008a6).l,a0
	move.l	a0,($0000089e).l
	move.l	a0,($000008a2).l
	move.l	#$00000930,($0000092c).l
	move.l	#Lffa2de,($00000938).l
	move.l	#Lff4546,($00000934).l
	lea.l	(Lff0d3e),a0
	move.l	#$00000015.l,d1
	lea.l	($00000bb0).l,a1
Lff0cba:
	move.b	(a0)+,(a1)+
	dbra.w	d1,Lff0cba
	lea.l	($000009b2).l,a0
	move.w	#$0001,(a0)+
	move.w	#$0001,(a0)+
	move.l	#Lff171e,(a0)+
	move.w	#$0032,(a0)+		;'2'
	move.w	#$0032,(a0)+		;'2'
	move.l	#Lff15d8,(a0)+
	move.w	#$00c8,(a0)+
	move.w	#$00c8,(a0)+
	move.l	#Lff17b2,(a0)+
	move.w	#$1770,(a0)+
	move.w	#$1770,(a0)+
	move.l	#Lff17d4,(a0)+
	move.l	#$ffffffff,(a0)+
	clr.l	(a0)+
	move.w	#$ffff,($00000a0e).l
	lea.l	(Lff0d54),a0
	move.l	#$00000063.l,d1
	lea.l	($00000a16).l,a1
Lff0d20:
	move.b	(a0)+,(a1)+
	dbra.w	d1,Lff0d20
	move.b	#$01,($000009dd).l
	IOCS	_MS_INIT
	move.b	($00ed005a),($00000cb4).l
Lff0d3c:
	rts

Lff0d3e:
	.dc.b	$01,$86,$00,$02,$01,$86,$00,$02
	.dc.b	$00,$61,$00,$00,$00,$00,$00,$00
	.dc.b	$14,$ff,$00,$00,$00,$00
Lff0d54:
	.dc.b	$00,$e0,$00,$00,$00,$29,$00,$ff
	.dc.b	$ff,$00,$00,$14,$00,$ff,$00,$00
	.dc.b	$00,$5f,$06,$1b,$4b,$1c,$53,$06
	.dc.b	$06,$00,$02,$1b,$48,$00,$00,$00
	.dc.b	$00,$00,$02,$0d,$0a,$00,$04,$1b
	.dc.b	$25,$39,$0f,$00,$04,$1b,$25,$39
	.dc.b	$00,$00,$04,$1b,$25,$39,$0a,$00
	.dc.b	$04,$1b,$25,$39,$05,$00,$04,$1b
	.dc.b	$4a,$06,$00,$00,$00,$00,$04,$1b
	.dc.b	$4a,$03,$00,$00,$00,$00,$04,$1b
	.dc.b	$4a,$00,$12,$00,$00,$00,$04,$1b
	.dc.b	$4a,$00,$24,$00,$00,$00,$00,$03
	.dc.b	$06,$01,$ff,$ff
Lff0db8:
	lea.l	($00e8a000),a0
	clr.b	($001d,a0)
	move.l	(a7),(a7)
	nop
	move.b	#$01,($001b,a0)
	move.b	($00ed0026),d0
	beq.s	Lff0df4
	cmp.b	#$07,d0
	beq.s	Lff0df4
	move.b	#$07,d0
	move.b	#$31,($00e8e00d)	;'1'
	move.b	d0,($00ed0026)
	move.b	#$00,($00e8e00d)
Lff0df4:
	move.b	d0,($0001,a0)
	move.l	(a7),(a7)
	nop
	move.b	#$0c,($001b,a0)
	move.l	(a7),(a7)
	nop
	move.b	#$0c,($001f,a0)
	move.b	#$92,($00e9a007)
	move.b	#$0b,($00e9a005)
	lea.l	($00e84080),a4
	move.b	#$08,($0004,a4)
	move.b	#$05,($0029,a4)
	move.b	#$03,($002d,a4)
	move.b	#$05,($0031,a4)
	move.b	#$05,($0039,a4)
	move.b	#$68,($0025,a4)		;'h'
	move.b	#$69,($0027,a4)		;'i'
	move.l	#Lff11a6,($000001a0).l
	move.l	#Lff1194,($000001a4).l
	lea.l	($00e840c0),a4
	move.b	#$80,($0004,a4)
	move.b	#$04,($0006,a4)
	move.b	#$05,($0029,a4)
	move.b	#$01,($002d,a4)
	move.b	#$05,($0031,a4)
	move.b	#$05,($0039,a4)
	move.l	#$00e92003,($0014,a4)
	move.b	#$6a,($0025,a4)		;'j'
	move.b	#$6b,($0027,a4)		;'k'
	move.l	#Lff1156,($000001a8).l
	move.l	#Lff113c,($000001ac).l
	clr.l	d1
	move.b	($00ed001d),d1
	IOCS	_CRTMOD
	lea.l	($00e40000),a0
	move.l	#$00010000,d1
Lff0eca:
	clr.l	(a0)+
	subq.l	#1,d1
	bne.s	Lff0eca
	bsr.w	Lff10a2
	bsr.w	Lff0fd4
	moveq.l	#$ff,d1
	IOCS	_INIT_PRN
	rts

Lff0ee0:
	lea.l	(Lff0fb0),a0
	lea.l	($00000180).l,a1
	moveq.l	#$03,d0
Lff0eee:
	move.l	(a0)+,(a1)+
	dbra.w	d0,Lff0eee
	move.b	#$60,($00e9c003)	;'`'
	lea.l	($00e84000),a0
	lea.l	(Lff0fc0),a1
	moveq.l	#$09,d0
Lff0f0a:
	move.b	(a1)+,d1
	ext.w	d1
	move.b	(a1)+,(a0,d1.w)
	dbra.w	d0,Lff0f0a
	move.l	#$00e94003,($0014,a0)
	move.l	#$00e96001,($0054,a0)
	lea.l	($00000c8f).l,a0
	clr.b	(a0)+
	moveq.l	#$07,d0
Lff0f30:
	clr.l	(a0)+
	dbra.w	d0,Lff0f30
	move.b	#$06,($00e9c001)
	move.w	#$9070,d1
	suba.l	a1,a1
	clr.w	d2
	IOCS	_B_DSKINI
	move.w	#$9070,d1
Lff0f4e:
	moveq.l	#$03,d2
	IOCS	_B_DRVCHK
	moveq.l	#$05,d2
	IOCS	_B_DRVCHK
	moveq.l	#$07,d2
	IOCS	_B_DRVCHK
	add.w	#$0100,d1
	cmp.w	#$9470,d1
	bne.s	Lff0f4e
	andi.w	#$f8ff,sr
Lff0f6e:
	tst.l	($000009d6).l
	bne.s	Lff0f80
	cmpi.w	#$170c,($000009cc).l
	bcc.s	Lff0f6e
Lff0f80:
	move.w	#$8000,d1
Lff0f84:
	suba.l	a1,a1
	IOCS	_B_DSKINI
	cmpi.w	#$0bb8,($000009cc).l
	bcs.s	Lff0f9a
	cmp.b	#$04,d0
	beq.s	Lff0f84
Lff0f9a:
	tst.b	d0
	bne.s	Lff0fa8
	add.w	#$0100,d1
	cmp.w	#$9000,d1
	bne.s	Lff0f84
Lff0fa8:
	clr.w	($000009e0).l
	rts

Lff0fb0:
	.dc.b	$00,$ff,$13,$8e,$00,$ff,$14,$5c
	.dc.b	$00,$ff,$14,$ac,$63,$ff,$05,$e4
Lff0fc0:
	.dc.b	$04,$80,$06,$04,$29,$05,$2d,$00
	.dc.b	$31,$05,$44,$80,$46,$04,$69,$05
	.dc.b	$6d,$02,$71,$05
Lff0fd4:
	lea.l	($00000140).l,a1
	lea.l	(Lff1036),a0
	move.w	#$0007,d1
Lff0fe4:
	move.l	(a0)+,d0
	move.l	d0,(a1)+
	move.l	d0,(a1)+
	dbra.w	d1,Lff0fe4
	lea.l	(Lff1056),a0
	lea.l	($00e98004),a1
	move.w	#$0013,d1
	clr.w	d2
	clr.w	d3
Lff1002:
	move.b	(a0)+,d2
	move.b	(a0)+,d3
	move.w	d2,(a1)
	move.w	d3,(a1)
	dbra.w	d1,Lff1002
	lea.l	(Lff107e),a0
	lea.l	($00e98000),a1
	move.w	#$0011,d1
Lff101e:
	move.b	(a0)+,d2
	move.b	(a0)+,d3
	move.w	d2,(a1)
	move.w	d3,(a1)
	dbra.w	d1,Lff101e
	move.w	($00ed001a),d1
	IOCS	_SET232C
	rts

Lff1036:
	.dc.b	$00,$ff,$18,$f4,$00,$ff,$18,$f4
	.dc.b	$00,$ff,$18,$1c,$00,$ff,$18,$f4
	.dc.b	$00,$ff,$18,$d8,$00,$ff,$18,$d8
	.dc.b	$00,$ff,$14,$ae,$00,$ff,$18,$d8
Lff1056:
	.dc.b	$09,$c0,$09,$80,$04,$45,$01,$00
	.dc.b	$02,$50,$03,$c0,$05,$e2,$09,$01
	.dc.b	$0b,$56,$0c,$0e,$0d,$00,$0e,$02
	.dc.b	$03,$c1,$05,$ea,$00,$80,$0e,$03
	.dc.b	$0f,$00,$00,$10,$00,$10,$01,$10
Lff107e:
	.dc.b	$09,$40,$04,$4c,$01,$00,$03,$c0
	.dc.b	$05,$60,$0b,$56,$0c,$1f,$0d,$00
	.dc.b	$0e,$02,$03,$c1,$05,$e8,$00,$80
	.dc.b	$0e,$03,$0f,$00,$00,$10,$00,$10
	.dc.b	$01,$10,$09,$09
Lff10a2:
	lea.l	(Lff10fc),a0
	lea.l	($00000100).l,a1
	moveq.l	#$0f,d0
Lff10b0:
	move.l	(a0)+,(a1)+
	dbra.w	d0,Lff10b0
	lea.l	($00e88000),a0
	lea.l	(Lff10dc),a1
	moveq.l	#$0f,d0
Lff10c4:
	move.b	(a1)+,d1
	ext.w	d1
	move.b	(a1)+,(a0,d1.w)
	dbra.w	d0,Lff10c4
	move.b	($00ed001c),d1
	IOCS	_S_CMDOUT
	rts

Lff10dc:
	.dc.b	$05,$00,$03,$06,$1d,$70,$23,$c8
	.dc.b	$07,$18,$09,$26,$13,$18,$15,$26
	.dc.b	$17,$40,$19,$08,$1b,$01,$21,$0d
	.dc.b	$29,$88,$2b,$01,$2f,$ff,$2d,$01
Lff10fc:
	.dc.b	$00,$ff,$19,$10,$00,$ff,$11,$c0
	.dc.b	$00,$ff,$11,$c0,$43,$ff,$05,$e4
	.dc.b	$44,$ff,$05,$e4,$00,$ff,$15,$a2
	.dc.b	$00,$ff,$19,$10,$00,$ff,$19,$10
	.dc.b	$00,$ff,$19,$10,$00,$ff,$19,$10
	.dc.b	$00,$ff,$19,$10,$00,$ff,$19,$12
	.dc.b	$00,$ff,$19,$1e,$4d,$ff,$05,$e4
	.dc.b	$4e,$ff,$05,$e4,$4f,$ff,$05,$e4
Lff113c:
	move.w	d0,-(a7)
	move.b	($00000c32).l,d0
	clr.b	($00000c32).l
	move.b	($00e840c1),($00000c33).l
	bra.s	Lff1164

Lff1156:
	move.w	d0,-(a7)
	move.b	($00000c32).l,d0
	clr.w	($00000c32).l
Lff1164:
	btst.l	#$07,d0
	bne.s	Lff1182
	move.b	#$01,($00e9a007)
	move.b	#$03,($00e9a007)
	move.b	#$01,($00e92001)
Lff1182:
	move.b	($00e840c0),d0
	move.b	#$ff,($00e840c0)
	move.w	(a7)+,d0
	rte

Lff1194:
	clr.b	($00000c34).l
	move.b	($00e84081),($00000c35).l
	bra.s	Lff11ac

Lff11a6:
	clr.w	($00000c34).l
Lff11ac:
	move.w	d0,-(a7)
	move.b	($00e84080),d0
	move.b	#$ff,($00e84080)
	move.w	(a7)+,d0
	rte

Lff11c0:
	movem.l	d0-d1,-(a7)
	move.l	#$00040000,d1
	tst.w	($00000cb6).l
	beq.s	Lff11d8
	move.l	#$00060000,d1
Lff11d8:
	move.b	($00e88001),d0
	btst.l	#$02,d0
	beq.s	Lff11fe
	btst.l	#$01,d0
	beq.s	Lff11fe
	subq.l	#1,d1
	bne.s	Lff11d8
	move.b	#$00,($00e8a01f)
	move.l	#$58363801,d0
	trap	#10
Lff11fe:
	movem.l	(a7)+,d0-d1
	rte

Lff1204:
	cmp.l	#$58363801,d0
	beq.s	Lff1242
	cmp.l	#$58363802,d0
	beq.s	Lff1242
	cmp.l	#$58363803,d0
	beq.s	Lff1224
	bsr.w	Lff132c
	bra.w	Lff0010

Lff1224:
	cmpi.b	#$02,($000009df).l
	bne.s	Lff1242
	move.l	($00ed001e),d0
	beq.s	Lff1242
	cmp.l	#$00000040,d0
	bcc.s	Lff1242
	moveq.l	#$0d,d1
	bra.s	Lff1248

Lff1242:
	move.b	($00ed002a),d1
Lff1248:
	IOCS	_TVCTRL
Lff124c:
	bsr.w	Lff137a
	tst.b	($00ed0029)
	beq.s	Lff1272
	moveq.l	#$03,d1
Lff125a:
	moveq.l	#$20,d0			;' '
	bset.l	d1,d0
	move.b	d0,($00e94005)
	and.w	#$0020,d0
	move.b	d0,($00e94005)
	dbra.w	d1,Lff125a
Lff1272:
	bsr.w	Lff132c
	move.l	#$00010000,d1
	tst.w	($00000cb6).l
	beq.s	Lff128a
	move.l	#$00018000,d1
Lff128a:
	move.b	($00e88001),d0
	btst.l	#$02,d0
	beq.w	Lff1328
	btst.l	#$01,d0
	beq.w	Lff1328
	subq.l	#1,d1
	bne.s	Lff128a
	ori.w	#$0700,sr
	clr.l	d1
	bsr.w	Lff64c0
	lea.l	($00e8a000),a0
	move.b	($00ed0026),d0
	bsr.w	Lff2822
	move.b	#$31,($00e8e00d)	;'1'
	addq.l	#1,($00ed0044)
	move.b	#$00,($00e8e00d)
	move.b	#$0c,($001f,a0)
	move.l	(a7),(a7)
	nop
	move.b	($001b,a0),d0
	bclr.l	#$02,d0
	nop
	nop
	tst.b	($00ed0026)
	bne.s	Lff12f6
	bset.l	#$02,d0
Lff12f6:
	move.b	d0,($001b,a0)
	nop
	nop
	lea.l	($00e8e00f),a0
	move.b	#$00,(a0)
	move.b	#$0f,(a0)
	move.b	#$0f,(a0)
	move.l	#$00100000,d1
	tst.w	($00000cb6).l
	beq.s	Lff1324
	move.l	#$00180000,d1
Lff1324:
	subq.l	#1,d1
	bne.s	Lff1324
Lff1328:
	bra.w	Lff0010

Lff132c:
	move.b	#$31,($00e8e00d)	;'1'
	move.b	($00000810).l,($00ed001c)
	move.l	($000009d6).l,d0
	add.l	d0,($00ed0040)
	move.b	#$00,($00e8e00d)
	rts

Lff1354:
	movem.l	d0-d7/a0-a6,-(a7)
	btst.l	#$00,d0
	bne.s	Lff1372
	move.w	($00000a0e).l,d0
	cmp.w	#$0040,d0		;'@'
	bcs.s	Lff1370
	cmp.w	#$0050,d0		;'P'
	bcs.s	Lff1372
Lff1370:
	bsr.s	Lff137a
Lff1372:
	movem.l	(a7)+,d0-d7/a0-a6
	rte

Lff1378:
	rte

Lff137a:
	move.w	#$8000,d1
Lff137e:
	bsr.w	Lff9280
	add.w	#$0100,d1
	cmp.w	#$9000,d1
	bcs.s	Lff137e
	rts

Lff138e:
	bsr.s	Lff1392
	rte

Lff1392:
	movem.l	d0-d3/a0-a2,-(a7)
	lea.l	($00e94001),a0
	lea.l	($00e94003),a1
Lff13a2:
	move.b	(a0),d0
	btst.l	#$07,d0
	beq.s	Lff13a2
	btst.l	#$06,d0
	bne.s	Lff13bc
	btst.l	#$04,d0
	bne.s	Lff13bc
	moveq.l	#$08,d1
	bsr.s	Lff1406
	bne.s	Lff13c6
Lff13bc:
	bsr.s	Lff1420
	bne.s	Lff1400
	cmp.b	#$80,d0
	beq.s	Lff1400
Lff13c6:
	clr.l	d1
	move.b	d0,d1
	and.b	#$03,d1
	move.w	d1,d2
	asl.w	#3,d1
	lea.l	($00000c90).l,a2
	adda.l	d1,a2
	btst.l	#$07,d0
	beq.s	Lff13f2
	btst.b	d2,($00000c8f).l
	beq.s	Lff13f0
	moveq.l	#$07,d2
Lff13ea:
	bsr.s	Lff143a
	bne.s	Lff13ea
	bra.s	Lff13a2

Lff13f0:
	moveq.l	#$07,d2
Lff13f2:
	move.b	d0,(a2)+
	bsr.s	Lff143a
	bne.s	Lff13f2
	bset.b	d2,($00000c8f).l
	bra.s	Lff13a2

Lff1400:
	movem.l	(a7)+,d0-d3/a0-a2
	rts

Lff1406:
	moveq.l	#$ff,d3
Lff1408:
	move.b	(a0),d0
	and.b	#$d0,d0
	cmp.b	#$80,d0
	beq.s	Lff141a
	dbra.w	d3,Lff1408
	rts

Lff141a:
	move.b	d1,(a1)
	clr.l	d0
	rts

Lff1420:
	moveq.l	#$ff,d3
Lff1422:
	move.b	(a0),d0
	and.b	#$d0,d0
	cmp.b	#$d0,d0
	beq.s	Lff1434
	dbra.w	d3,Lff1422
	rts

Lff1434:
	move.b	(a1),d0
	clr.l	d3
	rts

Lff143a:
	moveq.l	#$ff,d3
Lff143c:
	move.b	(a0),d0
	btst.l	#$07,d0
	bne.s	Lff144a
	dbra.w	d3,Lff143c
Lff1448:
	rts

Lff144a:
	btst.l	#$06,d0
	beq.s	Lff1448
	btst.l	#$04,d0
	beq.s	Lff1448
	move.b	(a1),d0
	moveq.l	#$ff,d3
	rts

Lff145c:
	movem.l	d0/a4,-(a7)
	bsr.s	Lff1468
	movem.l	(a7)+,d0/a4
	rte

Lff1468:
	movem.l	d1-d2/a1-a2,-(a7)
	lea.l	($000009e6).l,a4
	lea.l	($000009e2).l,a1
	lea.l	($00e94005),a2
	clr.l	d1
Lff1480:
	move.b	(a1)+,d0
	and.b	#$c0,d0
	move.w	d0,d2
	bset.l	d1,d0
	move.b	d0,(a2)
	move.b	(a2),d0
	move.b	d2,(a2)
	cmp.b	(a4),d0
	beq.s	Lff149c
	move.b	d0,(a4)
	move.b	#-$01,($0001,a4)
Lff149c:
	addq.l	#2,a4
	addq.w	#1,d1
	cmp.w	#$0004,d1
	bcs.s	Lff1480
	movem.l	(a7)+,d1-d2/a1-a2
	rts

Lff14ac:
	rte

Lff14ae:
	ori.w	#$0700,sr
	movem.l	d0-d1/a0,-(a7)
	clr.l	d1
	move.w	($00e98006),d0
	and.b	($00000cb5).l,d0
	btst.b	#$00,($00000926).l
	beq.s	Lff14f6
	cmp.b	#$0f,d0
	beq.w	Lff157a
	cmp.b	#$0e,d0
	beq.w	Lff1584
	and.b	#$7f,d0
	cmp.b	#$20,d0			;' '
	bcs.s	Lff14f6
	btst.b	#$00,($00000928).l
	beq.s	Lff14f6
	or.b	#$80,d0
Lff14f6:
	btst.b	#$01,($00000926).l
	beq.s	Lff1510
	cmp.b	#$13,d0
	beq.w	Lff158e
	cmp.b	#$11,d0
	beq.w	Lff1598
Lff1510:
	movea.l	($0000089e).l,a0
	cmpi.w	#$003f,($0000089c).l	;'?'
	bcc.s	Lff153c
	addq.l	#2,a0
	cmpa.l	#$00000926,a0
	bne.s	Lff1530
	lea.l	($000008a6).l,a0
Lff1530:
	addq.w	#1,($0000089c).l
	move.l	a0,($0000089e).l
Lff153c:
	move.b	d1,(a0)+
	move.b	d0,(a0)
	btst.b	#$01,($00000926).l
	beq.s	Lff156c
	btst.b	#$00,($00000929).l
	bne.s	Lff156c
	cmpi.w	#$0030,($0000089c).l	;'0'
	bcs.s	Lff156c
	bset.b	#$00,($00000929).l
	moveq.l	#$13,d1
	bsr.w	Lff842a
Lff156c:
	movem.l	(a7)+,d0-d1/a0
	move.w	#$0038,($00e98004)	;'8'
	rte

Lff157a:
	bset.b	#$00,($00000928).l
	bra.s	Lff156c

Lff1584:
	bclr.b	#$00,($00000928).l
	bra.s	Lff156c

Lff158e:
	bset.b	#$01,($00000929).l
	bra.s	Lff156c

Lff1598:
	bclr.b	#$01,($00000929).l
	bra.s	Lff156c

Lff15a2:
	move.l	a0,-(a7)
	lea.l	($000009b4).l,a0
	bsr.s	Lff15c8
	lea.l	($000009bc).l,a0
	bsr.s	Lff15c8
	lea.l	($000009c4).l,a0
	bsr.s	Lff15c8
	lea.l	($000009cc).l,a0
	bsr.s	Lff15c8
	movea.l	(a7)+,a0
	rte

Lff15c8:
	subq.w	#1,(a0)
	bne.s	Lff15d6
	move.w	(-$0002,a0),(a0)
	movea.l	($0002,a0),a0
	jsr	(a0)
Lff15d6:
	rts

Lff15d8:
	tst.b	($00000992).l
	beq.s	Lff1648
	not.b	($00000991).l
Lff15e6:
	movem.l	d0/a1-a2,-(a7)
	clr.l	d0
	move.w	($00000976).l,d0
	asl.l	#7,d0
	asl.l	#4,d0
	movea.l	d0,a2
	clr.l	d0
	move.w	($00000974).l,d0
	cmp.w	($00000970).l,d0
	bcs.s	Lff160e
	move.w	($00000970).l,d0
Lff160e:
	adda.l	d0,a2
	adda.l	($00000948).l,a2
	adda.l	#$00e00000,a2
	movea.l	a2,a1
	adda.l	#$00020000,a1
	move.w	($00e8002a),-(a7)
	move.l	#$00000080,d0
	bclr.b	#$00,($00e8002a)
	bsr.s	Lff164a
	movea.l	a1,a2
	bsr.s	Lff164a
	move.w	(a7)+,($00e8002a)
	movem.l	(a7)+,d0/a1-a2
Lff1648:
	rts

Lff164a:
	not.b	(a2)
	adda.l	d0,a2
	not.b	(a2)
	adda.l	d0,a2
	not.b	(a2)
	adda.l	d0,a2
	not.b	(a2)
	adda.l	d0,a2
	not.b	(a2)
	adda.l	d0,a2
	not.b	(a2)
	adda.l	d0,a2
	not.b	(a2)
	adda.l	d0,a2
	not.b	(a2)
	adda.l	d0,a2
	not.b	(a2)
	adda.l	d0,a2
	not.b	(a2)
	adda.l	d0,a2
	not.b	(a2)
	adda.l	d0,a2
	not.b	(a2)
	adda.l	d0,a2
	not.b	(a2)
	adda.l	d0,a2
	not.b	(a2)
	adda.l	d0,a2
	not.b	(a2)
	adda.l	d0,a2
	not.b	(a2)
	rts

Lff168a:
	tst.b	($00000933).l
	bpl.s	Lff16d8
	btst.b	#$07,($00000bbf).l
	beq.s	Lff169e
	rts

Lff169e:
	movem.l	d0-d1/a0,-(a7)
	lea.l	($00000933).l,a0
	clr.b	(a0)
	move.w	#$0003,($0000092a).l
	move.l	#$00000930,($0000092c).l
	lea.l	($00e98002),a0
	tst.w	(a0)
	tst.w	(a0)
	tst.w	(a0)
	tst.w	(a0)
	move.w	#$0040,d1		;'@'
Lff16ce:
	bsr.w	Lff6502
Lff16d2:
	movem.l	(a7)+,d0-d1/a0
	rts

Lff16d8:
	movem.l	d0-d1/a0,-(a7)
	lea.l	($00000933).l,a0
	btst.b	#$05,(a0)
	bne.s	Lff16f2
	btst.b	#$00,($00e98001)
	beq.s	Lff16fc
Lff16f2:
	move.b	#$80,(a0)
	move.w	#$0041,d1		;'A'
	bra.s	Lff16ce

Lff16fc:
	move.b	(a0),d0
	addq.b	#1,d0
	cmp.b	#$04,d0
	bcc.s	Lff170a
	move.b	d0,(a0)
	bra.s	Lff16d2

Lff170a:
	move.b	#$80,(a0)
	lea.l	(Lff171e,pc),a0
	move.l	a0,($000009b6).l
	move.w	#$0041,d1		;'A'
	bra.s	Lff16ce

Lff171e:
	tst.b	($00000933).l
	bpl.s	Lff176e
	btst.b	#$07,($00000bbf).l
	beq.s	Lff1732
	rts

Lff1732:
	movem.l	d0-d1/a0,-(a7)
	lea.l	($00000933).l,a0
	clr.b	(a0)
	move.w	#$0003,($0000092a).l
	move.l	#$00000930,($0000092c).l
	lea.l	($00e98002),a0
	tst.w	(a0)
	tst.w	(a0)
	tst.w	(a0)
	tst.w	(a0)
	subq.l	#2,a0
	move.w	#$0005,(a0)
	move.w	#$0062,(a0)		;'b'
Lff1768:
	movem.l	(a7)+,d0-d1/a0
	rts

Lff176e:
	movem.l	d0-d1/a0,-(a7)
	lea.l	($00000933).l,a0
	btst.b	#$06,(a0)
	bne.s	Lff178c
	move.b	(a0),d0
	addq.b	#1,d0
	cmp.b	#$04,d0
	bcc.s	Lff1792
	move.b	d0,(a0)
	bra.s	Lff1768

Lff178c:
	move.b	#$80,(a0)
	bra.s	Lff1768

Lff1792:
	move.b	#$80,(a0)
	move.w	#$0005,($00e98000)
	move.w	#$0060,($00e98000)	;'`'
	lea.l	(Lff168a,pc),a0
	move.l	a0,($000009b6).l
	bra.s	Lff1768

Lff17b2:
	btst.b	#$06,($000009e1).l
	beq.s	Lff17d2
	btst.b	#$07,($000009e1).l
	bne.s	Lff17d2
	clr.b	($00e94007)
	clr.b	($000009e1).l
Lff17d2:
	rts

Lff17d4:
	movem.l	d0,-(a7)
	addq.l	#1,($000009d6).l
	move.l	($000009d2).l,d0
	cmp.l	($000009d6).l,d0
	bcs.s	Lff17f2
	movem.l	(a7)+,d0
	rts

Lff17f2:
	move.b	($00e88001),d0
	btst.l	#$02,d0
	beq.s	Lff180c
	btst.l	#$01,d0
	beq.s	Lff180c
	move.l	#$58363803,d0
	trap	#10
Lff180c:
	move.l	#$ffffffff,($000009d2).l
	movem.l	(a7)+,d0
	rts

Lff181c:
	ori.w	#$0700,sr
	bset.b	#$05,($00000933).l
	movem.l	d0-d1/a0-a1,-(a7)
	move.w	($00e98002),d0
	movea.l	($0000092c).l,a0
	move.b	d0,(a0)+
	move.l	a0,($0000092c).l
	subq.w	#1,($0000092a).l
	bne.w	Lff18ca
	lea.l	($00000930).l,a1
	move.l	a1,($0000092c).l
	move.w	#$0003,($0000092a).l
	btst.b	#$07,($00000bbf).l
	bne.s	Lff18ca
	bset.b	#$07,($00000bbf).l
	bset.b	#$06,($00000933).l
	move.w	#$0005,($00e98000)
	move.w	#$0060,($00e98000)	;'`'
	lea.l	($00000cb1).l,a0
	move.b	(a1)+,(a0)+
	move.b	(a1)+,(a0)+
	move.b	(a1)+,(a0)+
	lea.l	($00000cb1).l,a1
	move.w	#$0038,($00e98000)	;'8'
	move.w	($0010,a7),d0
	or.w	#$2000,d0
	move.w	d0,sr
	movea.l	($00000934).l,a0
	jsr	(a0)
	movea.l	($00000938).l,a0
	jsr	(a0)
	bclr.b	#$07,($00000bbf).l
	movem.l	(a7)+,d0-d1/a0-a1
	rte

Lff18ca:
	movem.l	(a7)+,d0-d1/a0-a1
	move.w	#$0038,($00e98000)	;'8'
	rte

Lff18d8:
	move.w	d0,-(a7)
	move.w	($00e98006),d0
	move.w	#$0030,($00e98004)	;'0'
	move.w	#$0038,($00e98004)	;'8'
	move.w	(a7)+,d0
	rte

Lff18f4:
	move.w	d0,-(a7)
	move.w	($00e98002),d0
	move.w	#$0030,($00e98000)	;'0'
	move.w	#$0038,($00e98000)	;'8'
	move.w	(a7)+,d0
	rte

Lff1910:
	rte

Lff1912:
	move.w	d0,-(a7)
	move.b	($00e8802f),d0
	move.w	(a7)+,d0
	rte

Lff191e:
	movem.l	d0-d2,-(a7)
	clr.l	d0
	move.b	($00e8802f),d0
	cmp.b	#$ff,d0
	beq.s	Lff195c
	bclr.b	#$04,($00e88013)
	move.w	($000c,a7),d2
	or.w	#$2000,d2
	move.w	d2,sr
	move.w	($00000810).l,d1
	move.w	d0,-(a7)
	bsr.w	Lff45e0
	move.w	(a7)+,d0
	bsr.s	Lff1978
	bset.b	#$04,($00e88013)
	bra.s	Lff195e

Lff195c:
	bsr.s	Lff1964
Lff195e:
	movem.l	(a7)+,d0-d2
	rte

Lff1964:
	movem.l	d0-d1,-(a7)
	move.b	($00000810).l,d1
	bsr.w	Lff64c0
	movem.l	(a7)+,d0-d1
	rts

Lff1978:
	movem.l	d1-d2/a0,-(a7)
	bsr.w	Lff1ae0
	bsr.w	Lff1b08
	bsr.w	Lff1bac
	tst.w	d1
	beq.s	Lff19d6
	cmp.w	#$7300,d1
	beq.s	Lff19a2
	cmp.w	#$7200,d1
	bne.s	Lff19b6
	btst.b	#$03,($00000811).l
	bra.s	Lff19aa

Lff19a2:
	btst.b	#$02,($00000811).l
Lff19aa:
	beq.s	Lff19b6
	bsr.w	Lff1ab0
	move.w	#$6d00,d1
	bra.s	Lff19d2

Lff19b6:
	cmp.w	#$6100,d1
	beq.w	Lff1a48
	cmp.w	#$6200,d1
	beq.s	Lff19dc
	cmp.b	#$03,d1
	beq.w	Lff1a86
	cmp.w	#$3700,d1
	beq.s	Lff1a08
Lff19d2:
	bsr.w	Lff1ab0
Lff19d6:
	movem.l	(a7)+,d1-d2/a0
	rts

Lff19dc:
	btst.b	#$02,($00000bc5).l
	bne.s	Lff19d2
	bset.b	#$02,($00000bc5).l
	movem.l	d0-d7/a0-a6,-(a7)
	move.b	($00000811).l,d0
	trap	#12
	movem.l	(a7)+,d0-d7/a0-a6
	bclr.b	#$02,($00000bc5).l
	bra.s	Lff19d2

Lff1a08:
	btst.b	#$02,($00000811).l
	beq.s	Lff19d2
	btst.b	#$01,($00000811).l
	beq.s	Lff19d2
	btst.b	#$00,($00000bc5).l
	bne.s	Lff19d6
	bset.b	#$00,($00000bc5).l
	movem.l	d0-d7/a0-a6,-(a7)
	move.l	#$58363800,d0		;'X68'<<8
	trap	#10
	movem.l	(a7)+,d0-d7/a0-a6
	bclr.b	#$00,($00000bc5).l
	bra.s	Lff19d6

Lff1a48:
	btst.b	#$01,($00000bc5).l
	bne.s	Lff1a72
	bset.b	#$01,($00000bc5).l
	movem.l	d0-d7/a0-a6,-(a7)
	move.b	($00000811).l,d0
	trap	#11
	movem.l	(a7)+,d0-d7/a0-a6
	bclr.b	#$01,($00000bc5).l
Lff1a72:
	move.b	#$13,d1
	btst.b	#$00,($00000811).l
	bne.w	Lff19d2
	move.b	#$03,d1
Lff1a86:
	btst.b	#$03,($00000bc5).l
	bne.w	Lff19d2
	bset.b	#$03,($00000bc5).l
	movem.l	d0-d7/a0-a6,-(a7)
	trap	#13
	movem.l	(a7)+,d0-d7/a0-a6
	bclr.b	#$03,($00000bc5).l
	bra.w	Lff19d2

Lff1ab0:
	cmpi.w	#$0040,($00000812).l	;'@'
	bcc.s	Lff1ade
	movea.l	($00000814).l,a0
	addq.l	#2,a0
	cmpa.l	#$0000089c,a0
	bcs.s	Lff1ad0
	movea.l	#$0000081c,a0
Lff1ad0:
	move.w	d1,(a0)
	move.l	a0,($00000814).l
	addq.w	#1,($00000812).l
Lff1ade:
	rts

Lff1ae0:
	lea.l	($00000800).l,a0
	clr.w	d1
	move.b	d0,d1
	move.b	d0,d2
	and.w	#$0007,d2
	lsr.w	#3,d1
	btst.l	#$04,d1
	beq.s	Lff1b02
	bclr.l	#$04,d1
	bclr.b	d2,(a0,d1.w)
	rts

Lff1b02:
	bset.b	d2,(a0,d1.w)
	rts

Lff1b08:
	move.b	d0,d1
	and.b	#$7f,d1
	cmp.b	#$74,d1			;'t'
	bcc.s	Lff1b66
	cmp.b	#$70,d1			;'p'
	bcc.s	Lff1b4e
	btst.l	#$07,d0
	bne.s	Lff1b66
	cmp.b	#$5a,d1			;'Z'
	bcs.s	Lff1b66
	beq.s	Lff1b68
	cmp.b	#$5b,d1			;'['
	beq.s	Lff1b84
	cmp.b	#$5e,d1			;'^'
	bcs.s	Lff1b9e
	cmp.b	#$61,d1			;'a'
	bcc.s	Lff1b66
	sub.b	#$5a,d1			;'Z'
Lff1b3e:
	bchg.b	d1,($00000810).l
	move.w	d0,-(a7)
	bsr.w	Lff1964
	move.w	(a7)+,d0
	rts

Lff1b4e:
	sub.b	#$70,d1			;'p'
	btst.l	#$07,d0
	beq.s	Lff1b60
	bclr.b	d1,($00000811).l
	rts

Lff1b60:
	bset.b	d1,($00000811).l
Lff1b66:
	rts

Lff1b68:
	btst.b	#$04,($00000811).l
	bne.s	Lff1b9e
	bclr.b	#$05,($00000811).l
	bclr.b	#$01,($00000810).l
	bra.s	Lff1b9e

Lff1b84:
	btst.b	#$05,($00000811).l
	bne.s	Lff1b9e
	bclr.b	#$04,($00000811).l
	bclr.b	#$00,($00000810).l
Lff1b9e:
	sub.b	#$56,d1			;'V'
	bchg.b	d1,($00000811).l
	subq.b	#4,d1
	bra.s	Lff1b3e

Lff1bac:
	move.w	d0,d1
	move.b	($00000811).l,d2
	btst.l	#$00,d2
	bne.s	Lff1bc8
	tst.b	($00ed0027)
	bne.s	Lff1bda
	btst.l	#$03,d2
	beq.s	Lff1bda
Lff1bc8:
	cmp.b	#$4e,d0			;'N'
	beq.s	Lff1bda
	cmp.b	#$3b,d0			;';'
	bcs.s	Lff1bda
	cmp.b	#$52,d0			;'R'
	bcs.s	Lff1bfe
Lff1bda:
	asl.w	#8,d1
	cmp.b	#$35,d0			;'5'
	bcs.s	Lff1c02
	cmp.b	#$80,d0
	bcs.s	Lff1bf2
	cmp.b	#$f0,d0
	bcc.s	Lff1bf0
	clr.w	d1
Lff1bf0:
	rts

Lff1bf2:
	lea.l	(Lff1cd0),a0
	move.b	(a0,d0.w),d1
	rts

Lff1bfe:
	clr.b	d1
	rts

Lff1c02:
	btst.l	#$01,d2
	bne.w	Lff1caa
	btst.l	#$06,d2
	bne.s	Lff1bf2
	btst.l	#$02,d2
	bne.s	Lff1c22
	btst.l	#$04,d2
	bne.s	Lff1c5a
	btst.l	#$05,d2
	bne.s	Lff1c48
Lff1c22:
	bsr.s	Lff1c48
	btst.l	#$07,d2
	bne.s	Lff1c46
	cmp.b	#$41,d1			;'A'
	bcs.s	Lff1c46
	cmp.b	#$5b,d1			;'['
	bcs.s	Lff1c42
	cmp.b	#$61,d1			;'a'
	bcs.s	Lff1c46
	cmp.b	#$7b,d1			;'{'
	bcc.s	Lff1c46
Lff1c42:
	eori.b	#$20,d1
Lff1c46:
	rts

Lff1c48:
	btst.l	#$00,d2
	beq.s	Lff1bf2
	lea.l	(Lff1d50),a0
	move.b	(a0,d0.w),d1
	rts

Lff1c5a:
	tst.b	($00ed002b)
	bne.s	Lff1c7e
	lea.l	(Lff1d85),a0
	move.b	(a0,d0.w),d1
	btst.l	#$00,d2
	beq.s	Lff1ca0
	lea.l	(Lff1dba),a0
	move.w	#$000f,d2
	bra.s	Lff1c98

Lff1c7e:
	lea.l	(Lff1dca),a0
	move.b	(a0,d0.w),d1
	btst.l	#$00,d2
	beq.s	Lff1ca0
	lea.l	(Lff1dff),a0
	move.w	#$0010,d2
Lff1c98:
	cmp.b	(a0)+,d1
	beq.s	Lff1ca2
	dbra.w	d2,Lff1c98
Lff1ca0:
	rts

Lff1ca2:
	add.b	#$a0,d2
	move.b	d2,d1
	rts

Lff1caa:
	lea.l	(Lff1d50),a0
	move.b	(a0,d0.w),d1
	cmp.b	#$20,d1			;' '
	bcs.s	Lff1cce
	cmp.b	#$40,d1			;'@'
	bcs.w	Lff1bfe
	cmp.b	#$80,d1
	bcc.w	Lff1bfe
	and.b	#$1f,d1
Lff1cce:
	rts

Lff1cd0:
	.dc.b	$00,$1b,$31,$32,$33,$34,$35,$36
	.dc.b	$37,$38,$39,$30,$2d,$5e,$5c,$08
	.dc.b	$09,$51,$57,$45,$52,$54,$59,$55
	.dc.b	$49,$4f,$50,$40,$5b,$0d,$41,$53
	.dc.b	$44,$46,$47,$48,$4a,$4b,$4c,$3b
	.dc.b	$3a,$5d,$5a,$58,$43,$56,$42,$4e
	.dc.b	$4d,$2c,$2e,$2f,$00,$20,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$2f,$2a,$2d,$37,$38,$39,$2b,$34
	.dc.b	$35,$36,$3d,$31,$32,$33,$0d,$30
	.dc.b	$2c,$2e,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
Lff1d50:
	.dc.b	$00,$1b,$21,$22,$23,$24,$25,$26
	.dc.b	$27,$28,$29,$00,$3d,$7e,$7c,$08
	.dc.b	$09,$71,$77,$65,$72,$74,$79,$75
	.dc.b	$69,$6f,$70,$60,$7b,$0d,$61,$73
	.dc.b	$64,$66,$67,$68,$6a,$6b,$6c,$2b
	.dc.b	$2a,$7d,$7a,$78,$63,$76,$62,$6e
	.dc.b	$6d,$3c,$3e,$3f,$5f
Lff1d85:
	.dc.b	$00,$1b,$c7,$cc,$b1,$b3,$b4,$b5
	.dc.b	$d4,$d5,$d6,$dc,$ce,$cd,$b0,$08
	.dc.b	$09,$c0,$c3,$b2,$bd,$b6,$dd,$c5
	.dc.b	$c6,$d7,$be,$de,$df,$0d,$c1,$c4
	.dc.b	$bc,$ca,$b7,$b8,$cf,$c9,$d8,$da
	.dc.b	$b9,$d1,$c2,$bb,$bf,$cb,$ba,$d0
	.dc.b	$d3,$c8,$d9,$d2,$db
Lff1dba:
	.dc.b	'ﾂﾖﾕﾔｵｴｳｲｱﾜﾒﾈﾑﾟﾙﾛ'
Lff1dca:
	.dc.b	$00,$1b,$b1,$b2,$b3,$b4,$b5,$c5
	.dc.b	$c6,$c7,$c8,$c9,$d7,$d8,$d9,$08
	.dc.b	$09,$b6,$b7,$b8,$b9,$ba,$ca,$cb
	.dc.b	$cc,$cd,$ce,$da,$db,$0d,$bb,$bc
	.dc.b	$bd,$be,$bf,$cf,$d0,$d1,$d2,$d3
	.dc.b	$de,$df,$c0,$c1,$c2,$c3,$c4,$d4
	.dc.b	$d5,$d6,$dc,$a6,$dd
Lff1dff:
	.dc.b	'ﾞﾂﾖﾕﾔｵｴｳｲｱﾉﾝﾜﾟﾛｦｻ'
Lff1e10:
	movem.l	a0,-(a7)
	and.l	#$000000ff,d0
	suba.l	a0,a0
	movea.w	d0,a0
	adda.l	a0,a0
	adda.l	a0,a0
	adda.l	#$00000400,a0
	movea.l	(a0),a0
	move.w	d0,($00000a0e).l
	jsr	(a0)
	move.w	#$ffff,($00000a0e).l
	movem.l	(a7)+,a0
	rte

Lff1e40:
	addq.l	#4,a7
	move.w	#$01ff,d7
	move.w	#$ffff,($00000a0e).l
	bra.w	Lff0626

Lff1e52:
	addq.l	#8,a7
	move.w	#$0100,d7
	move.b	d0,d7
	move.w	#$ffff,($00000a0e).l
	bra.w	Lff0626

Lff1e66:
	.dc.b	$00,$ff,$35,$f0,$00,$ff,$36,$5a
	.dc.b	$00,$ff,$63,$e4,$00,$ff,$63,$ee
	.dc.b	$00,$ff,$64,$ac,$00,$ff,$64,$ba
	.dc.b	$00,$ff,$64,$c0,$00,$ff,$64,$d0
	.dc.b	$00,$ff,$64,$d4,$00,$ff,$64,$e4
	.dc.b	$00,$ff,$64,$f4,$00,$ff,$64,$f4
	.dc.b	$00,$ff,$65,$16,$00,$ff,$65,$f4
	.dc.b	$00,$ff,$66,$68,$00,$ff,$66,$9a
	.dc.b	$00,$ff,$66,$d6,$00,$ff,$6b,$88
	.dc.b	$00,$ff,$6b,$b4,$00,$ff,$6c,$94
	.dc.b	$00,$ff,$6c,$f0,$00,$ff,$6d,$3c
	.dc.b	$00,$ff,$6d,$76,$00,$ff,$70,$74
	.dc.b	$00,$ff,$70,$84,$00,$ff,$70,$94
	.dc.b	$00,$ff,$70,$c6,$00,$ff,$71,$8c
	.dc.b	$00,$ff,$72,$68,$00,$ff,$74,$d2
	.dc.b	$00,$ff,$75,$0a,$00,$ff,$75,$32
	.dc.b	$00,$ff,$75,$5c,$00,$ff,$75,$6c
	.dc.b	$00,$ff,$75,$88,$00,$ff,$75,$a6
	.dc.b	$00,$ff,$75,$dc,$00,$ff,$75,$ea
	.dc.b	$00,$ff,$75,$f8,$00,$ff,$76,$06
	.dc.b	$00,$ff,$76,$14,$00,$ff,$76,$22
	.dc.b	$00,$ff,$76,$30,$00,$ff,$76,$3e
	.dc.b	$00,$ff,$76,$4c,$00,$ff,$76,$5a
	.dc.b	$00,$ff,$76,$70,$00,$ff,$76,$dc
	.dc.b	$00,$ff,$82,$1e,$00,$ff,$83,$14
	.dc.b	$00,$ff,$83,$1c,$00,$ff,$83,$68
	.dc.b	$00,$ff,$83,$90,$00,$ff,$83,$b8
	.dc.b	$00,$ff,$84,$38,$00,$ff,$84,$6c
	.dc.b	$00,$ff,$84,$84,$00,$ff,$84,$a0
	.dc.b	$00,$ff,$84,$b6,$00,$ff,$84,$d4
	.dc.b	$00,$ff,$84,$ec,$00,$ff,$85,$06
	.dc.b	$00,$ff,$85,$14,$00,$ff,$85,$7e
	.dc.b	$00,$ff,$8b,$00,$00,$ff,$8b,$48
	.dc.b	$00,$ff,$8c,$00,$00,$ff,$8c,$cc
	.dc.b	$00,$ff,$8d,$18,$00,$ff,$8d,$58
	.dc.b	$00,$ff,$8e,$20,$00,$ff,$8e,$d8
	.dc.b	$00,$ff,$8f,$c4,$00,$ff,$8f,$d0
	.dc.b	$00,$ff,$90,$02,$00,$ff,$90,$5c
	.dc.b	$00,$ff,$90,$68,$00,$ff,$90,$9a
	.dc.b	$00,$ff,$91,$40,$00,$ff,$92,$80
	.dc.b	$00,$ff,$21,$e6,$00,$ff,$23,$4a
	.dc.b	$00,$ff,$23,$ba,$00,$ff,$24,$18
	.dc.b	$00,$ff,$24,$72,$00,$ff,$24,$b0
	.dc.b	$00,$ff,$24,$f2,$00,$ff,$25,$36
	.dc.b	$00,$ff,$25,$46,$00,$ff,$25,$ce
	.dc.b	$00,$ff,$25,$fe,$00,$ff,$26,$a6
	.dc.b	$00,$ff,$26,$f2,$00,$ff,$27,$1e
	.dc.b	$00,$ff,$27,$60,$00,$ff,$28,$54
	.dc.b	$00,$ff,$9d,$64,$00,$ff,$9d,$6c
	.dc.b	$00,$ff,$9e,$f4,$00,$ff,$9e,$ce
	.dc.b	$00,$ff,$9f,$5a,$00,$ff,$9f,$32
	.dc.b	$00,$ff,$9f,$82,$00,$ff,$9f,$90
	.dc.b	$00,$ff,$9f,$ee,$00,$ff,$a0,$2c
	.dc.b	$00,$ff,$a0,$6c,$00,$ff,$a0,$d0
	.dc.b	$00,$ff,$a1,$4e,$00,$ff,$a1,$cc
	.dc.b	$00,$ff,$a2,$36,$00,$ff,$a2,$9a
	.dc.b	$00,$ff,$a3,$12,$00,$ff,$a3,$3e
	.dc.b	$00,$ff,$a3,$6e,$00,$ff,$a3,$9e
	.dc.b	$00,$ff,$a3,$c0,$00,$ff,$a3,$fc
	.dc.b	$00,$ff,$a4,$1a,$00,$ff,$a4,$76
	.dc.b	$00,$ff,$a5,$16,$00,$ff,$a5,$2c
	.dc.b	$00,$ff,$a5,$dc,$00,$ff,$a6,$2a
	.dc.b	$00,$ff,$a6,$a0,$00,$ff,$44,$6e
	.dc.b	$00,$ff,$36,$62,$00,$ff,$a0,$36
	.dc.b	$00,$ff,$ac,$06,$00,$ff,$ac,$14
	.dc.b	$00,$ff,$ac,$4e,$00,$ff,$ac,$52
	.dc.b	$00,$ff,$ac,$56,$00,$ff,$ac,$5a
	.dc.b	$00,$ff,$ac,$6c,$00,$ff,$ac,$70
	.dc.b	$00,$ff,$ac,$74,$00,$ff,$ac,$78
	.dc.b	$00,$ff,$ac,$8a,$00,$ff,$ad,$16
	.dc.b	$00,$ff,$ad,$66,$00,$ff,$ad,$88
	.dc.b	$00,$ff,$ad,$92,$00,$ff,$00,$08
	.dc.b	$00,$ff,$ad,$cc,$00,$ff,$b1,$14
	.dc.b	$00,$ff,$b1,$56,$00,$ff,$b1,$6c
	.dc.b	$00,$ff,$b1,$82,$00,$ff,$b2,$06
	.dc.b	$00,$ff,$b2,$14,$00,$ff,$b2,$2c
	.dc.b	$00,$ff,$b2,$ca,$00,$ff,$b3,$9a
	.dc.b	$00,$ff,$b4,$40,$00,$ff,$b4,$76
	.dc.b	$00,$ff,$b4,$dc,$00,$ff,$1e,$52
	.dc.b	$00,$ff,$1e,$52,$00,$ff,$1e,$52
	.dc.b	$00,$ff,$b7,$5a,$00,$ff,$b7,$b8
	.dc.b	$00,$ff,$b8,$18,$00,$ff,$b8,$fa
	.dc.b	$00,$ff,$c1,$c6,$00,$ff,$c1,$84
	.dc.b	$00,$ff,$1e,$52,$00,$ff,$1e,$52
	.dc.b	$00,$ff,$1e,$52,$00,$ff,$1e,$52
	.dc.b	$00,$ff,$1e,$52,$00,$ff,$1e,$52
	.dc.b	$00,$ff,$1e,$52,$00,$ff,$1e,$52
	.dc.b	$00,$ff,$c2,$54,$00,$ff,$c2,$92
	.dc.b	$00,$ff,$1e,$52,$00,$ff,$b5,$70
	.dc.b	$00,$ff,$b5,$c4,$00,$ff,$b6,$40
	.dc.b	$00,$ff,$b7,$14,$00,$ff,$c8,$00
	.dc.b	$00,$ff,$c7,$a6,$00,$ff,$c7,$80
	.dc.b	$00,$ff,$c6,$d2,$00,$ff,$c6,$a8
	.dc.b	$00,$ff,$c7,$28,$00,$ff,$c6,$fc
	.dc.b	$00,$ff,$c7,$54,$00,$ff,$c7,$ce
	.dc.b	$00,$ff,$c8,$1a,$00,$ff,$c8,$3e
	.dc.b	$00,$ff,$c2,$fe,$00,$ff,$c3,$7c
	.dc.b	$00,$ff,$c3,$92,$00,$ff,$c3,$a4
	.dc.b	$00,$ff,$c3,$ca,$00,$ff,$c4,$0a
	.dc.b	$00,$ff,$c4,$4a,$00,$ff,$c4,$92
	.dc.b	$00,$ff,$c4,$ba,$00,$ff,$c4,$ec
	.dc.b	$00,$ff,$c5,$10,$00,$ff,$c5,$5c
	.dc.b	$00,$ff,$c5,$84,$00,$ff,$c5,$b2
	.dc.b	$00,$ff,$c5,$e8,$00,$ff,$c6,$1e
	.dc.b	$00,$ff,$1e,$52,$00,$ff,$1e,$52
	.dc.b	$00,$ff,$1e,$52,$00,$ff,$5d,$a4
	.dc.b	$00,$ff,$5d,$ba,$00,$ff,$1e,$52
	.dc.b	$00,$ff,$5d,$d0,$00,$ff,$5d,$f4
	.dc.b	$00,$ff,$5e,$24,$00,$ff,$1e,$52
	.dc.b	$00,$ff,$1e,$52,$00,$ff,$1e,$52
	.dc.b	$00,$ff,$1e,$52,$00,$ff,$1e,$52
	.dc.b	$00,$ff,$1e,$52,$00,$ff,$7b,$68
	.dc.b	$48,$e7,$7c,$80,$24,$01,$26,$01
	.dc.b	$48,$41,$e0,$4a,$c2,$bc,$00,$00
	.dc.b	$0f,$ff,$c4,$bc,$00,$00,$00,$ff
	.dc.b	$c6,$bc,$00,$00,$00,$ff,$b2,$bc
	.dc.b	$00,$00,$07,$bc,$65,$00,$01,$12
	.dc.b	$b2,$bc,$00,$00,$08,$1f,$62,$00
	.dc.b	$01,$08,$92,$bc,$00,$00,$07,$bc
	.dc.b	$4a,$82,$67,$00,$00,$fc,$b4,$bc
	.dc.b	$00,$00,$00,$0c,$62,$00,$00,$f2
	.dc.b	$4a,$83,$67,$00,$00,$ec,$b6,$bc
	.dc.b	$00,$00,$00,$1f,$62,$00,$00,$e2
	.dc.b	$b4,$bc,$00,$00,$00,$02,$66,$1e
	.dc.b	$b6,$bc,$00,$00,$00,$1d,$62,$00
	.dc.b	$00,$d0,$65,$34,$08,$01,$00,$00
	.dc.b	$66,$00,$00,$c6,$08,$01,$00,$01
	.dc.b	$66,$00,$00,$be,$60,$22,$b6,$bc
	.dc.b	$00,$00,$00,$1f,$66,$1a,$b4,$bc
	.dc.b	$00,$00,$00,$08,$65,$0a,$08,$02
	.dc.b	$00,$00,$66,$00,$00,$a4,$60,$08
	.dc.b	$08,$02,$00,$00,$67,$00,$00,$9a
	.dc.b	$28,$01,$e4,$8c,$88,$fc,$00,$07
	.dc.b	$48,$44,$2a,$01,$41,$f9,$00,$ff
	.dc.b	$23,$26,$ca,$bc,$00,$00,$00,$03
	.dc.b	$66,$06,$41,$f9,$00,$ff,$23,$32
	.dc.b	$10,$30,$20,$ff,$41,$f9,$00,$ff
	.dc.b	$23,$3e,$d0,$30,$40,$00,$41,$f9
	.dc.b	$00,$ff,$23,$45,$d0,$30,$50,$00
	.dc.b	$d0,$03,$53,$00,$c0,$bc,$00,$00
	.dc.b	$00,$ff,$80,$fc,$00,$07,$48,$40
	.dc.b	$c0,$bc,$00,$00,$00,$07,$28,$00
	.dc.b	$82,$fc,$00,$0a,$20,$01,$e0,$98
	.dc.b	$e8,$98,$d2,$80,$c2,$bc,$00,$ff
	.dc.b	$00,$00,$84,$fc,$00,$0a,$20,$02
	.dc.b	$e1,$88,$e9,$88,$e0,$8a,$d4,$40
	.dc.b	$86,$fc,$00,$0a,$48,$43,$20,$03
	.dc.b	$e0,$88,$e8,$88,$d6,$40,$c6,$bc
	.dc.b	$00,$00,$00,$ff,$e0,$9c,$e8,$9d
	.dc.b	$20,$01,$d0,$82,$d0,$83,$d0,$84
	.dc.b	$d0,$85,$4c,$df,$01,$3e,$4e,$75
Lff231e:
	moveq.l	#$ff,d0
	movem.l	(a7)+,d1-d5/a0
	rts

Lff2326:
	.dc.b	$00,$03,$03,$06,$01,$04,$06,$02
	.dc.b	$05,$00,$03,$05,$00,$03,$04,$00
	.dc.b	$02,$05,$00,$03,$06,$01,$04,$06
	.dc.b	$02,$00,$05,$03,$01,$06,$04,$00
	.dc.b	$02,$03,$04,$00,$48,$e7,$60,$40
	.dc.b	$40,$e7,$00,$7c,$07,$00,$41,$f9
	.dc.b	$00,$e8,$a0,$00,$20,$01,$e9,$98
	.dc.b	$c0,$3c,$00,$03,$14,$28,$00,$1b
	.dc.b	$08,$c2,$00,$00,$08,$82,$00,$03
	.dc.b	$11,$42,$00,$1b,$2e,$97,$4e,$71
	.dc.b	$11,$40,$00,$17,$2e,$97,$08,$82
	.dc.b	$00,$00,$11,$42,$00,$1b,$20,$01
	.dc.b	$e1,$98,$c0,$7c,$00,$07,$43,$e8
	.dc.b	$00,$0c,$32,$c0,$74,$05,$10,$01
	.dc.b	$c0,$7c,$00,$0f,$32,$c0,$e8,$99
	.dc.b	$51,$ca,$ff,$f4,$14,$28,$00,$1b
	.dc.b	$08,$c2,$00,$03,$2e,$97,$11,$42
	.dc.b	$00,$1b,$42,$80,$46,$df,$4c,$df
	.dc.b	$02,$06,$4e,$75
Lff23ba:
	movem.l	d1-d2,-(a7)
	swap.w	d1
	clr.l	d2
	move.b	d1,d2
	cmp.b	#$18,d2
	bcc.s	Lff2410
	move.w	#$0010,d0
	divu.w	#$000a,d2
	or.b	d2,d0
	swap.w	d2
	rol.l	#4,d0
	or.b	d2,d0
	rol.l	#4,d0
	rol.l	#8,d1
	clr.l	d2
	move.b	d1,d2
	cmp.b	#$3c,d2			;'<'
	bcc.s	Lff2410
	divu.w	#$000a,d2
	or.b	d2,d0
	swap.w	d2
	rol.l	#4,d0
	or.b	d2,d0
	rol.l	#4,d0
	rol.l	#8,d1
	clr.l	d2
	move.b	d1,d2
	cmp.b	#$3c,d2			;'<'
	bcc.s	Lff2410
	divu.w	#$000a,d2
	or.b	d2,d0
	swap.w	d2
	rol.l	#4,d0
	or.b	d2,d0
	bra.s	Lff2412

Lff2410:
	moveq.l	#$ff,d0
Lff2412:
	movem.l	(a7)+,d1-d2
	rts

Lff2418:
	movem.l	d1-d2/a1,-(a7)
	lea.l	($00e8a000),a0
	move.b	#$06,($001f,a0)
	move.l	d1,d0
	rol.l	#8,d0
	and.b	#$01,d0
	move.b	($001b,a0),d2
	bset.l	#$00,d2
	move.l	(a7),(a7)
	move.b	d2,($001b,a0)
	move.l	(a7),(a7)
	nop
	move.b	d0,($0015,a0)
	move.l	(a7),(a7)
	bclr.l	#$00,d2
	move.b	d2,($001b,a0)
	lea.l	($0000.w,a0),a1
	moveq.l	#$05,d2
Lff2456:
	move.b	d1,d0
	and.w	#$000f,d0
	move.w	d0,(a1)+
	ror.l	#4,d1
	dbra.w	d2,Lff2456
	move.b	#$04,($001f,a0)
	clr.l	d0
	movem.l	(a7)+,d1-d2/a1
	rts

Lff2472:
	movem.l	d1-d2/a1,-(a7)
	lea.l	($00e8a000),a0
	bclr.b	#$00,($001b,a0)
	bsr.s	Lff2492
	cmp.b	#$02,d0
	bcc.s	Lff248c
	bsr.s	Lff2492
Lff248c:
	movem.l	(a7)+,d1-d2/a1
	rts

Lff2492:
	move.b	($000d,a0),d0
	and.w	#$0007,d0
	lea.l	($001a,a0),a1
Lff249e:
	moveq.l	#$05,d2
Lff24a0:
	move.w	-(a1),d1
	and.w	#$000f,d1
	asl.l	#4,d0
	or.b	d1,d0
	dbra.w	d2,Lff24a0
	rts

Lff24b0:
	movem.l	d1-d3,-(a7)
	rol.l	#8,d1
	move.b	d1,d0
	and.w	#$000f,d0
	rol.w	#4,d0
	move.w	d0,d2
	bsr.s	Lff24ce
	add.l	#$07bc0000,d0
	movem.l	(a7)+,d1-d3
	rts

Lff24ce:
	moveq.l	#$02,d3
Lff24d0:
	rol.l	#4,d1
	move.b	d1,d0
	and.w	#$000f,d0
	mulu.w	#$000a,d0
	rol.l	#8,d2
	move.b	d0,d2
	rol.l	#4,d1
	move.b	d1,d0
	and.w	#$000f,d0
	add.b	d0,d2
	dbra.w	d3,Lff24d0
	move.l	d2,d0
	rts

Lff24f2:
	movem.l	d1-d2/a1,-(a7)
	lea.l	($00e8a000),a0
	bsr.s	Lff250a
	tst.b	d0
	bne.s	Lff2504
	bsr.s	Lff250a
Lff2504:
	movem.l	(a7)+,d1-d2/a1
	rts

Lff250a:
	move.b	($001b,a0),d2
	bset.l	#$00,d2
	move.l	(a7),(a7)
	move.b	d2,($001b,a0)
	move.l	(a7),(a7)
	nop
	move.b	($0015,a0),d0
	move.l	(a7),(a7)
	bclr.l	#$00,d2
	move.b	d2,($001b,a0)
	and.w	#$0001,d0
	lea.l	($000c,a0),a1
	bra.w	Lff249e

Lff2536:
	movem.l	d1-d3,-(a7)
	rol.l	#8,d1
	clr.l	d2
	bsr.s	Lff24ce
	movem.l	(a7)+,d1-d3
	rts

Lff2546:
	movem.l	d1-d2,-(a7)
	bsr.s	Lff25a2
	cmp.l	#$00000820,d1
	bcc.s	Lff259e
	cmp.w	#$07bc,d1
	bcc.s	Lff2574
	cmp.w	#$0064,d1		;'d'
	bcc.s	Lff259e
	cmp.w	#$0050,d1		;'P'
	bcc.s	Lff256e
	add.l	#$000007d0,d1
	bra.s	Lff2574

Lff256e:
	add.l	#$0000076c,d1
Lff2574:
	move.l	d1,d2
	swap.w	d2
	bsr.s	Lff25a2
	cmp.l	#$0000000d,d1
	bcc.s	Lff259e
	move.b	d1,d2
	beq.s	Lff259e
	asl.w	#8,d2
	bsr.s	Lff25a2
	cmp.l	#$00000020,d1
	bcc.s	Lff259e
	move.b	d1,d2
	beq.s	Lff259e
	move.l	d2,d0
Lff2598:
	movem.l	(a7)+,d1-d2
	rts

Lff259e:
	moveq.l	#$ff,d0
	bra.s	Lff2598

Lff25a2:
	clr.l	d1
	clr.l	d0
	move.b	(a1)+,d0
	beq.s	Lff25ca
	cmp.b	#$20,d0			;' '
	beq.s	Lff25a2
Lff25b0:
	cmp.b	#$30,d0			;'0'
	bcs.s	Lff25cc
	cmp.b	#$3a,d0			;':'
	bcc.s	Lff25cc
	sub.b	#$30,d0			;'0'
	mulu.w	#$000a,d1
	add.w	d0,d1
	move.b	(a1)+,d0
	bne.s	Lff25b0
Lff25ca:
	subq.l	#1,a0
Lff25cc:
	rts

Lff25ce:
	movem.l	d1-d2,-(a7)
	bsr.s	Lff25a2
	cmp.l	#$00000018,d1
	bcc.s	Lff259e
	move.l	d1,d2
	swap.w	d2
	bsr.s	Lff25a2
	cmp.l	#$0000003c,d1
	bcc.s	Lff259e
	move.b	d1,d2
	asl.w	#8,d2
	bsr.s	Lff25a2
	cmp.l	#$0000003c,d1
	bcc.s	Lff259e
	move.b	d1,d2
	move.l	d2,d0
	bra.s	Lff2598

Lff25fe:
	movem.l	d1-d3,-(a7)
	move.l	d1,d2
	swap.w	d2
	and.l	#$00000fff,d2
	cmp.w	#$0820,d2
	bcc.s	Lff2678
	cmp.w	#$07bc,d2
	bcs.s	Lff2678
	clr.l	d3
	move.w	d1,d3
	lsr.w	#8,d3
	tst.b	d3
	beq.s	Lff2678
	cmp.b	#$0d,d3
	bcc.s	Lff2678
	tst.b	d1
	beq.s	Lff2678
	cmp.b	#$20,d1			;' '
	bcc.s	Lff2678
	btst.l	#$1d,d1
	beq.s	Lff263e
	divu.w	#$0064,d2
	bra.s	Lff2656

Lff263e:
	divu.w	#$03e8,d2
	add.b	#$30,d2			;'0'
	move.b	d2,(a1)+
	clr.w	d2
	swap.w	d2
	divu.w	#$0064,d2
	add.b	#$30,d2			;'0'
	move.b	d2,(a1)+
Lff2656:
	clr.w	d2
	swap.w	d2
	bsr.s	Lff2680
	bsr.s	Lff2694
	move.b	d0,(a1)+
	move.l	d3,d2
	bsr.s	Lff2680
	bsr.s	Lff2694
	move.b	d0,(a1)+
	move.w	d1,d2
	and.l	#$000000ff,d2
	bsr.s	Lff2680
	clr.b	(a1)
	clr.l	d0
	bra.s	Lff267a

Lff2678:
	moveq.l	#$ff,d0
Lff267a:
	movem.l	(a7)+,d1-d3
	rts

Lff2680:
	divu.w	#$000a,d2
	add.b	#$30,d2			;'0'
	move.b	d2,(a1)+
	swap.w	d2
	add.b	#$30,d2			;'0'
	move.b	d2,(a1)+
	rts

Lff2694:
	btst.l	#$1c,d1
	beq.s	Lff26a0
	move.b	#$2d,d0			;'-'
	rts

Lff26a0:
	move.b	#$2f,d0			;'/'
	rts

Lff26a6:
	movem.l	d1-d3,-(a7)
	move.l	d1,d2
	clr.w	d2
	swap.w	d2
	cmp.w	#$0018,d2
	bcc.s	Lff2678
	clr.l	d3
	move.w	d1,d3
	lsr.w	#8,d3
	cmp.b	#$3c,d3			;'<'
	bcc.s	Lff2678
	cmp.b	#$3c,d1			;'<'
	bcc.s	Lff2678
	movea.l	a1,a0
	bsr.s	Lff2680
	cmpi.b	#$30,(a0)		;'0'
	bne.s	Lff26d6
	move.b	#$20,(a0)		;' '
Lff26d6:
	move.b	#$3a,(a1)+		;':'
	move.l	d3,d2
	bsr.s	Lff2680
	move.b	#$3a,(a1)+		;':'
	move.w	d1,d2
	and.l	#$000000ff,d2
	bsr.s	Lff2680
	clr.b	(a1)
	clr.l	d0
	bra.s	Lff267a

Lff26f2:
	move.b	d1,d0
	and.w	#$0007,d0
	add.w	d0,d0
	lea.l	(Lff270e),a0
	move.b	(a0,d0.w),(a1)+
	move.b	($01,a0,d0.w),(a1)+
	clr.b	(a1)
	clr.l	d0
	rts

Lff270e:
	.dc.b	'日月火水木金土？Bｲ<',$00
Lff2723:
	.dc.b	$02,$64,$28,$41,$f9,$00,$e8,$a0
	.dc.b	$00,$4a,$01,$66,$04,$10,$3c,$00
	.dc.b	$07,$61,$00,$00,$ec,$13,$fc,$00
	.dc.b	$31,$00,$e8,$e0,$0d,$13,$c0,$00
	.dc.b	$ed,$00,$26,$13,$fc,$00,$00,$00
	.dc.b	$e8,$e0,$0d,$10,$39,$00,$ed,$00
	.dc.b	$26,$c0,$bc,$00,$00,$00,$01,$0a
	.dc.b	$00,$00,$01,$4e,$75
Lff2760:
	move.b	#$31,($00e8e00d)	;'1'
	move.l	a1,($00ed001e)
	move.l	d1,($00ed0022)
	subq.l	#1,d2
	move.l	d2,($00ed0014)
	addq.l	#1,d2
	clr.b	($00ed0026)
	move.b	#$00,($00e8e00d)
	lea.l	($00e8a000),a0
	move.b	#$09,($001b,a0)
	move.l	(a7),(a7)
	nop
	move.b	#$05,($001f,a0)
	move.w	($00000cb8).l,d0
	lsr.w	#3,d0
Lff27aa:
	dbra.w	d0,Lff27aa
	moveq.l	#$0f,d2
	move.b	d1,d0
	and.b	d2,d0
	cmp.b	d2,d0
	beq.s	Lff27bc
	move.b	d0,($0005,a0)
Lff27bc:
	ror.l	#4,d1
	move.b	d1,d0
	and.b	d2,d0
	cmp.b	d2,d0
	beq.s	Lff27ca
	move.b	d0,($0007,a0)
Lff27ca:
	ror.l	#4,d1
	move.b	d1,d0
	and.b	d2,d0
	cmp.b	d2,d0
	beq.s	Lff27d8
	move.b	d0,($0009,a0)
Lff27d8:
	ror.l	#4,d1
	move.b	d1,d0
	and.b	d2,d0
	cmp.b	d2,d0
	beq.s	Lff27e6
	move.b	d0,($000b,a0)
Lff27e6:
	ror.l	#4,d1
	move.b	d1,d0
	and.b	d2,d0
	cmp.b	d2,d0
	beq.s	Lff27f4
	move.b	d0,($000f,a0)
Lff27f4:
	ror.l	#4,d1
	move.b	d1,d0
	and.b	d2,d0
	cmp.b	d2,d0
	beq.s	Lff2802
	move.b	d0,($0011,a0)
Lff2802:
	ror.l	#4,d1
	move.b	d1,d0
	and.b	d2,d0
	cmp.b	d2,d0
	beq.s	Lff2810
	move.b	d0,($000d,a0)
Lff2810:
	move.b	#$00,($0001,a0)
	move.l	(a7),(a7)
	nop
	move.b	#$08,($001b,a0)
	clr.l	d0
Lff2822:
	movem.l	d1,-(a7)
	move.b	($001b,a0),d1
	bset.l	#$00,d1
	move.l	(a7),(a7)
	move.b	d1,($001b,a0)
	move.l	(a7),(a7)
	nop
	tst.b	d0
	beq.s	Lff2840
	move.b	#$07,d0
Lff2840:
	move.b	d0,($0001,a0)
	move.l	(a7),(a7)
	bclr.l	#$00,d1
	move.b	d1,($001b,a0)
	movem.l	(a7)+,d1
	rts

Lff2854:
	move.l	($00ed001e),d0
	move.l	($00ed0022),d1
	move.l	($00ed0014),d2
	addq.l	#1,d2
	rts

Lff286a:
	bclr.l	#$1f,d0
	rts

Lff2870:
	movem.l	d2-d3,-(a7)
Lff2874:
	bsr.s	Lff287c
	movem.l	(a7)+,d2-d3
	rts

Lff287c:
	move.w	d1,d2
	and.w	#$07ff,d2
	sub.w	#$03ff,d2
	bcs.s	Lff28c0
	cmp.w	#$0034,d2		;'4'
	bcc.s	Lff28c4
	move.l	#$80000000.l,d3
	cmp.w	#$0020,d2		;' '
	bcc.s	Lff28aa
	and.l	#$000007ff,d1
	lsr.l	d2,d3
	subq.l	#1,d3
	not.l	d3
	and.l	d3,d0
	rts

Lff28aa:
	move.w	d1,-(a7)
	andi.w	#$07ff,(a7)
	sub.w	#$0020,d2
	lsr.l	d2,d3
	subq.l	#1,d3
	not.l	d3
	and.l	d3,d1
	or.w	(a7)+,d1
	rts

Lff28c0:
	clr.l	d0
	clr.l	d1
Lff28c4:
	rts

Lff28c6:
	movem.l	d2-d3,-(a7)
	tst.l	d0
	bpl.s	Lff2874
	move.w	d1,d2
	and.w	#$07ff,d2
	cmp.w	#$0433,d2
	bcc.s	Lff28e8
	bsr.s	Lff287c
	moveq.l	#$00,d2
	move.l	#$000003ff,d3
	bsr.w	Lff2c00
Lff28e8:
	movem.l	(a7)+,d2-d3
	rts

Lff28ee:
	movem.l	d2-d3,-(a7)
	tst.l	d0
	bmi.w	Lff2874
	move.w	d1,d2
	and.w	#$07ff,d2
	cmp.w	#$0433,d2
	bcc.s	Lff2914
	bsr.w	Lff287c
	moveq.l	#$00,d2
	move.l	#$000003ff,d3
	bsr.w	Lff2b52
Lff2914:
	movem.l	(a7)+,d2-d3
	rts

Lff291a:
	movem.l	d2-d3,-(a7)
	move.w	d1,d2
	and.w	#$07ff,d2
	cmp.w	#$03ff,d2
	bcs.s	Lff2958
	cmp.w	#$0433,d2
	bcc.s	Lff295e
	move.l	d0,d3
	and.w	#$f800,d1
Lff2936:
	lsl.l	#1,d1
	roxl.l	#1,d0
	subq.w	#1,d2
	cmp.w	#$03ff,d2
	bcc.s	Lff2936
	tst.l	d0
	bmi.s	Lff294e
	bne.s	Lff2936
	tst.l	d1
	bne.s	Lff2936
	bra.s	Lff295e

Lff294e:
	tst.l	d3
	bmi.s	Lff2956
	bclr.l	#$1f,d0
Lff2956:
	or.w	d2,d1
Lff2958:
	movem.l	(a7)+,d2-d3
	rts

Lff295e:
	clr.l	d0
	clr.l	d1
	movem.l	(a7)+,d2-d3
	rts

Lff2968:
	tst.l	d0
	beq.s	Lff2990
	move.l	d0,-(a7)
	andi.l	#$80000000,(a7)
	move.l	#$0000041e,d1
	tst.l	d0
	bpl.s	Lff2980
	neg.l	d0
Lff2980:
	bmi.s	Lff2988
	subq.w	#1,d1
	lsl.l	#1,d0
	bra.s	Lff2980

Lff2988:
	bclr.l	#$1f,d0
	or.l	(a7)+,d0
	rts

Lff2990:
	clr.l	d1
	rts

Lff2994:
	move.l	d1,-(a7)
	and.w	#$07ff,d1
	sub.w	#$03ff,d1
	bcs.s	Lff29c4
	cmp.w	#$001f,d1
	bcc.s	Lff29ce
	movem.l	d0/d2,-(a7)
	move.l	d0,d2
	bset.l	#$1f,d2
	clr.l	d0
Lff29b2:
	lsl.l	#1,d2
	roxl.l	#1,d0
	dbra.w	d1,Lff29b2
	tst.l	(a7)+
	bpl.s	Lff29c0
	neg.l	d0
Lff29c0:
	move.l	(a7)+,d2
	bra.s	Lff29c6

Lff29c4:
	clr.l	d0
Lff29c6:
	move.l	(a7)+,d1
	andi.b	#$fe,ccr
	rts

Lff29ce:
	bne.s	Lff29dc
	tst.l	d0
	bpl.s	Lff29dc
	cmp.l	#$80000000,d0
	beq.s	Lff29c6
Lff29dc:
	move.l	(a7)+,d1
	ori.b	#$01,ccr
	rts

Lff29e4:
	movem.l	d1-d2/d7,-(a7)
	move.l	d0,d7
	beq.s	Lff2a28
	bpl.s	Lff29f0
	neg.l	d0
Lff29f0:
	eor.l	d1,d7
	tst.l	d1
	beq.s	Lff2a28
	bpl.s	Lff29fa
	neg.l	d1
Lff29fa:
	bsr.s	Lff2a3e
	tst.l	d0
	bne.s	Lff2a1e
	move.l	d1,d0
	tst.l	d7
	bpl.s	Lff2a1a
	cmp.l	#$80000000,d0
	bhi.s	Lff2a1e
	neg.l	d0
	andi.b	#$fe,ccr
Lff2a14:
	movem.l	(a7)+,d1-d2/d7
	rts

Lff2a1a:
	tst.l	d0
	bpl.s	Lff2a14
Lff2a1e:
	movem.l	(a7)+,d1-d2/d7
	ori.b	#$01,ccr
	rts

Lff2a28:
	clr.l	d0
	movem.l	(a7)+,d1-d2/d7
	rts

Lff2a30:
	movem.l	d1-d2/d7,-(a7)
	bsr.s	Lff2a3e
	tst.l	d0
	bne.s	Lff2a1e
	move.l	d1,d0
	bra.s	Lff2a14

Lff2a3e:
	move.w	d1,d2
	mulu.w	d0,d2
	move.l	d2,-(a7)
	clr.l	-(a7)
	move.l	d0,d2
	swap.w	d2
	mulu.w	d1,d2
	add.l	d2,($0002,a7)
	bcc.s	Lff2a54
	addq.w	#1,(a7)
Lff2a54:
	move.l	d1,d2
	swap.w	d2
	mulu.w	d0,d2
	add.l	d2,($0002,a7)
	bcc.s	Lff2a62
	addq.w	#1,(a7)
Lff2a62:
	swap.w	d0
	swap.w	d1
	mulu.w	d1,d0
	add.l	(a7)+,d0
	move.l	(a7)+,d1
	rts

Lff2a6e:
	movem.l	d1-d3/d7,-(a7)
	move.l	d0,d7
	beq.s	Lff2a90
	bpl.s	Lff2a7a
	neg.l	d0
Lff2a7a:
	eor.l	d1,d7
	tst.l	d1
	beq.s	Lff2a96
	bpl.s	Lff2a84
	neg.l	d1
Lff2a84:
	bsr.s	Lff2ab8
	tst.l	d7
	bpl.s	Lff2a90
	neg.l	d0
	andi.b	#$fe,ccr
Lff2a90:
	movem.l	(a7)+,d1-d3/d7
	rts

Lff2a96:
	movem.l	(a7)+,d1-d3/d7
	ori.b	#$01,ccr
	rts

Lff2aa0:
	movem.l	d1-d3/d7,-(a7)
	tst.l	d0
	beq.s	Lff2ab2
	tst.l	d1
	beq.s	Lff2a96
	bsr.s	Lff2ab8
	andi.b	#$fe,ccr
Lff2ab2:
	movem.l	(a7)+,d1-d3/d7
	rts

Lff2ab8:
	clr.l	d2
	moveq.l	#$1f,d3
Lff2abc:
	lsl.l	#1,d0
	roxl.l	#1,d2
	cmp.l	d1,d2
	bcs.s	Lff2aca
	bset.l	#$00,d0
	sub.l	d1,d2
Lff2aca:
	dbra.w	d3,Lff2abc
	rts

Lff2ad0:
	tst.l	d1
	bne.s	Lff2adc
	move.l	d0,-(a7)
	andi.l	#$7fffffff,(a7)+
Lff2adc:
	rts

Lff2ade:
	move.l	d0,-(a7)
	eor.l	d2,(a7)+
	bmi.s	Lff2af2
	tst.l	d0
	bpl.s	Lff2afe
	bsr.s	Lff2afe
	beq.s	Lff2b3c
	eori.b	#$01,ccr
	rts

Lff2af2:
	move.l	d0,-(a7)
	lsl.w	(a7)
	addq.l	#4,a7
	andi.b	#$fb,ccr
	rts

Lff2afe:
	movem.l	d4-d5,-(a7)
	move.w	d1,d4
	and.w	#$07ff,d4
	move.w	d3,d5
	and.w	#$07ff,d5
	cmp.w	d5,d4
	bne.s	Lff2b38
	move.l	d0,d4
	and.l	#$7fffffff,d4
	move.l	d2,d5
	and.l	#$7fffffff,d5
	cmp.l	d5,d4
	bne.s	Lff2b38
	move.l	d1,d4
	and.l	#$fffff800,d4
	move.l	d3,d5
	and.l	#$fffff800,d5
	cmp.l	d5,d4
Lff2b38:
	movem.l	(a7)+,d4-d5
Lff2b3c:
	rts

Lff2b3e:
	move.l	d0,-(a7)
	andi.l	#$7fffffff,(a7)+
	bne.s	Lff2b4c
	tst.l	d1
	beq.s	Lff2b50
Lff2b4c:
	bchg.l	#$1f,d0
Lff2b50:
	rts

Lff2b52:
	movem.l	d2-d7,-(a7)
	bsr.s	Lff2b60
	move.w	d6,ccr
	movem.l	(a7)+,d2-d7
	rts

Lff2b60:
	move.l	d0,-(a7)
	eor.l	d2,(a7)+
	bmi.s	Lff2b6e
	tst.l	d0
	bpl.s	Lff2b7c
	bsr.s	Lff2b7c
	bra.s	Lff2b3e

Lff2b6e:
	tst.l	d0
	bpl.w	Lff2c2c
	exg.l	d0,d2
	exg.l	d1,d3
	bra.w	Lff2c2c

Lff2b7c:
	clr.l	d6
	and.l	#$7fffffff,d0
	bne.s	Lff2b96
	tst.l	d1
	bne.s	Lff2b96
	move.l	d2,d0
	move.l	d3,d1
	and.l	#$7fffffff,d0
	rts

Lff2b96:
	and.l	#$7fffffff,d2
	bne.s	Lff2ba2
	tst.l	d3
	beq.s	Lff2bfe
Lff2ba2:
	move.w	d1,d4
	and.w	#$07ff,d4
	move.w	d3,d5
	and.w	#$07ff,d5
	cmp.w	d5,d4
	bcc.s	Lff2bb8
	exg.l	d0,d2
	exg.l	d1,d3
	exg.l	d4,d5
Lff2bb8:
	move.w	d4,d7
	sub.w	d5,d4
	cmp.w	#$0035,d4		;'5'
	bcc.s	Lff2bfe
	bset.l	#$1f,d2
	and.w	#$f800,d3
	bra.s	Lff2bd0

Lff2bcc:
	lsr.l	#1,d2
	roxr.l	#1,d3
Lff2bd0:
	dbra.w	d4,Lff2bcc
	bset.l	#$1f,d0
	and.w	#$f800,d1
	or.w	#$0400,d1
	add.l	d3,d1
	addx.l	d2,d0
	bcc.s	Lff2bec
	roxr.l	#1,d0
	roxr.l	#1,d1
	addq.w	#1,d7
Lff2bec:
	cmp.w	#$0800,d7
	bcc.w	Lff2cd8
	and.w	#$f800,d1
	or.w	d7,d1
	bclr.l	#$1f,d0
Lff2bfe:
	rts

Lff2c00:
	movem.l	d2-d7,-(a7)
	bsr.s	Lff2c0e
	move.w	d6,ccr
	movem.l	(a7)+,d2-d7
	rts

Lff2c0e:
	move.l	d0,-(a7)
	eor.l	d2,(a7)+
	bmi.s	Lff2c1e
	tst.l	d0
	bpl.s	Lff2c2c
	exg.l	d0,d2
	exg.l	d1,d3
	bra.s	Lff2c2c

Lff2c1e:
	tst.l	d0
	bpl.w	Lff2b7c
	bsr.w	Lff2b7c
	bra.w	Lff2b3e

Lff2c2c:
	clr.l	d6
	and.l	#$7fffffff,d0
	bne.s	Lff2c46
	tst.l	d1
	bne.s	Lff2c46
	move.l	d2,d0
	move.l	d3,d1
	bclr.l	#$1f,d0
	bra.w	Lff2b3e

Lff2c46:
	and.l	#$7fffffff,d2
	bne.s	Lff2c52
	tst.l	d3
	beq.s	Lff2c5c
Lff2c52:
	bsr.w	Lff2ade
	bne.s	Lff2c5e
	clr.l	d0
	clr.l	d1
Lff2c5c:
	rts

Lff2c5e:
	bcc.s	Lff2c6a
	exg.l	d0,d2
	exg.l	d1,d3
	bsr.s	Lff2c6a
	bra.w	Lff2b3e

Lff2c6a:
	move.w	d1,d4
	and.w	#$07ff,d4
	move.w	d3,d5
	and.w	#$07ff,d5
	move.w	d4,d7
	sub.w	d5,d4
	cmp.w	#$0035,d4		;'5'
	bcc.s	Lff2cce
	bset.l	#$1f,d2
	and.w	#$f800,d3
	bra.s	Lff2c8e

Lff2c8a:
	lsr.l	#1,d2
	roxr.l	#1,d3
Lff2c8e:
	dbra.w	d4,Lff2c8a
	bset.l	#$1f,d0
	and.w	#$f800,d1
	sub.l	d3,d1
	subx.l	d2,d0
	bra.s	Lff2ca6

Lff2ca0:
	subq.w	#1,d7
	lsl.l	#1,d1
	roxl.l	#1,d0
Lff2ca6:
	bpl.s	Lff2ca0
	clr.l	d2
	add.l	#$00000400,d1
	addx.l	d2,d0
	bcc.s	Lff2cba
	roxr.l	#1,d0
	roxr.l	#1,d1
	addq.w	#1,d7
Lff2cba:
	tst.w	d7
	bmi.s	Lff2cd0
	cmp.w	#$0800,d7
	bcc.s	Lff2cd8
	and.w	#$f800,d1
	or.w	d7,d1
	bclr.l	#$1f,d0
Lff2cce:
	rts

Lff2cd0:
	clr.l	d0
	clr.l	d1
	moveq.l	#$01,d6
	rts

Lff2cd8:
	move.l	#$7fffffff,d0
	moveq.l	#$ff,d1
	moveq.l	#$03,d6
	rts

Lff2ce4:
	movem.l	d2-d7,-(a7)
	bsr.s	Lff2cf2
	move.w	d6,ccr
	movem.l	(a7)+,d2-d7
	rts

Lff2cf2:
	move.l	d0,-(a7)
	eor.l	d2,(a7)+
	bpl.s	Lff2cfe
	bsr.s	Lff2cfe
	bra.w	Lff2b3e

Lff2cfe:
	and.l	#$7fffffff,d0
	bne.s	Lff2d0a
	tst.l	d1
	beq.s	Lff2d1a
Lff2d0a:
	and.l	#$7fffffff,d2
	bne.s	Lff2d1e
	tst.l	d3
	bne.s	Lff2d1e
	clr.l	d0
	clr.l	d1
Lff2d1a:
	clr.l	d6
	rts

Lff2d1e:
	bsr.w	Lff2dc4
	add.w	d6,d7
	bsr.s	Lff2d38
	tst.l	d4
	bmi.s	Lff2d32
	lsl.l	#1,d5
	roxl.l	#1,d4
	bra.w	Lff2e52

Lff2d32:
	addq.w	#1,d7
	bra.w	Lff2e52

Lff2d38:
	movem.l	a0-a2,-(a7)
	link.w	a6,#-$0020
	move.l	d0,(-$0020,a6)
	move.l	d1,(-$001c,a6)
	move.l	d2,(-$0018,a6)
	move.l	d3,(-$0014,a6)
	clr.l	(-$0010,a6)
	clr.l	(-$000c,a6)
	clr.l	(-$0008,a6)
	clr.l	(-$0004,a6)
	lea.l	(-$000a,a6),a0
	move.w	(-$0012,a6),d0
	bsr.s	Lff2d8c
	move.w	(-$0014,a6),d0
	bsr.s	Lff2d8c
	move.w	(-$0016,a6),d0
	bsr.s	Lff2d8c
	move.w	(-$0018,a6),d0
	bsr.s	Lff2d8c
	move.l	(-$0010,a6),d4
	move.l	(-$000c,a6),d5
	unlk	a6
	movem.l	(a7)+,a0-a2
	rts

Lff2d8c:
	move.w	(-$001a,a6),d3
	move.w	(-$001e,a6),d2
	lea.l	($0002,a0),a1
	bsr.s	Lff2da6
	move.w	(-$001c,a6),d3
	move.w	(-$0020,a6),d2
	lea.l	(a0),a1
	subq.l	#2,a0
Lff2da6:
	mulu.w	d0,d3
	mulu.w	d0,d2
	move.l	($0004,a1),d5
	move.l	(a1),d4
	add.l	d3,d5
	addx.l	d2,d4
	bcc.s	Lff2dbc
	movea.l	a1,a2
Lff2db8:
	addq.w	#1,-(a2)
	bcs.s	Lff2db8
Lff2dbc:
	move.l	d5,($0004,a1)
	move.l	d4,(a1)
	rts

Lff2dc4:
	move.w	d1,d7
	move.w	d3,d6
	and.w	#$07ff,d7
	and.w	#$07ff,d6
	sub.w	#$03ff,d7
	sub.w	#$03ff,d6
	bset.l	#$1f,d0
	bset.l	#$1f,d2
	and.w	#$f800,d1
	and.w	#$f800,d3
	rts

Lff2dea:
	movem.l	d2-d7,-(a7)
	bsr.s	Lff2df8
	move.w	d6,ccr
	movem.l	(a7)+,d2-d7
	rts

Lff2df8:
	move.l	d0,-(a7)
	eor.l	d2,(a7)+
	bpl.s	Lff2e04
	bsr.s	Lff2e04
	bra.w	Lff2b3e

Lff2e04:
	and.l	#$7fffffff,d2
	bne.s	Lff2e10
	tst.l	d3
	beq.s	Lff2e86
Lff2e10:
	and.l	#$7fffffff,d0
	bne.s	Lff2e20
	tst.l	d1
	bne.s	Lff2e20
	clr.l	d6
	rts

Lff2e20:
	bsr.s	Lff2dc4
	sub.w	d6,d7
	lsr.l	#1,d0
	roxr.l	#1,d1
	lsr.l	#1,d2
	roxr.l	#1,d3
	clr.l	d4
	bsr.s	Lff2e8a
	bcc.s	Lff2e38
	subq.w	#1,d7
	clr.l	d5
	bra.s	Lff2e3c

Lff2e38:
	moveq.l	#$01,d5
	bsr.s	Lff2e92
Lff2e3c:
	lsl.l	#1,d5
	roxl.l	#1,d4
	lsl.l	#1,d1
	roxl.l	#1,d0
	bsr.s	Lff2e8a
	bcs.s	Lff2e4e
	bsr.s	Lff2e92
	bset.l	#$00,d5
Lff2e4e:
	tst.l	d4
	bpl.s	Lff2e3c
Lff2e52:
	clr.l	d6
	add.l	#$00000400,d5
	bcc.s	Lff2e66
	addq.l	#1,d4
	bcc.s	Lff2e66
	roxr.l	#1,d4
	roxr.l	#1,d5
	addq.w	#1,d7
Lff2e66:
	add.w	#$03ff,d7
	bmi.w	Lff2cd0
	cmp.w	#$0800,d7
	bcc.w	Lff2cd8
	move.l	d4,d0
	move.l	d5,d1
	and.w	#$f800,d1
	or.w	d7,d1
	bclr.l	#$1f,d0
	rts

Lff2e86:
	moveq.l	#$05,d6
	rts

Lff2e8a:
	cmp.l	d2,d0
	bne.s	Lff2e90
	cmp.l	d3,d1
Lff2e90:
	rts

Lff2e92:
	sub.l	d3,d1
	subx.l	d2,d0
	rts

Lff2e98:
	cmp.b	#$30,d0			;'0'
	bcs.s	Lff2ea6
	cmp.b	#$3a,d0			;':'
	eori.b	#$01,ccr
Lff2ea6:
	rts

Lff2ea8:
	moveq.l	#$0e,d2
	move.l	a0,-(a7)
	bsr.w	Lff32c8
	movea.l	(a7),a0
	bsr.s	Lff2ebc
	movea.l	(a7)+,a0
	bsr.w	Lff339e
	rts

Lff2ebc:
	move.b	(a0)+,d0
	beq.s	Lff2ed0
	cmp.b	#$2e,d0			;'.'
	bne.s	Lff2ebc
	move.b	(a0),d0
	bsr.s	Lff2e98
	bcc.s	Lff2ed0
	subq.l	#1,a0
	bsr.s	Lff2ed2
Lff2ed0:
	rts

Lff2ed2:
	move.b	($0001,a0),(a0)+
	bne.s	Lff2ed2
	rts

Lff2eda:
	movem.l	d0-d2/d7/a1-a2,-(a7)
	link.w	a6,#-$000a
	movea.l	a7,a1
	lea.l	(Lff2f3a,pc),a2
	clr.w	d7
	tst.l	d0
	bpl.s	Lff2ef2
	neg.l	d0
	not.w	d7
Lff2ef2:
	move.l	(a2),d2
	beq.s	Lff2f08
	clr.b	d1
Lff2ef8:
	addq.b	#1,d1
	sub.l	d2,d0
	bcc.s	Lff2ef8
	add.l	d2,d0
	subq.b	#1,d1
	move.b	d1,(a1)+
	addq.l	#4,a2
	bra.s	Lff2ef2

Lff2f08:
	clr.b	d1
	movea.l	a7,a1
Lff2f0c:
	tst.b	(a1)
	bne.s	Lff2f1a
	addq.l	#1,a1
	addq.b	#1,d1
	cmp.b	#$09,d1
	bcs.s	Lff2f0c
Lff2f1a:
	tst.w	d7
	beq.s	Lff2f22
	move.b	#$2d,(a0)+		;'-'
Lff2f22:
	move.b	(a1)+,d0
	add.b	#$30,d0			;'0'
	move.b	d0,(a0)+
	addq.b	#1,d1
	cmp.b	#$0a,d1
	bcs.s	Lff2f22
	unlk	a6
	movem.l	(a7)+,d0-d2/d7/a1-a2
	rts

Lff2f3a:
	.dc.b	$3b,$9a,$ca,$00,$05,$f5,$e1,$00
	.dc.b	$00,$98,$96,$80,$00,$0f,$42,$40
	.dc.b	$00,$01,$86,$a0,$00,$00,$27,$10
	.dc.b	$00,$00,$03,$e8,$00,$00,$00,$64
	.dc.b	$00,$00,$00,$0a,$00,$00,$00,$01
	.dc.b	$00,$00,$00,$00,$48,$e7,$7f,$00
	.dc.b	$4e,$56,$00,$00,$42,$80,$61,$00
	.dc.b	$02,$b2,$67,$44,$61,$00,$02,$86
	.dc.b	$10,$10,$61,$00,$02,$94,$65,$38
	.dc.b	$90,$3c,$00,$30,$42,$81,$12,$00
	.dc.b	$52,$88,$10,$10,$61,$00,$02,$82
	.dc.b	$65,$32,$90,$3c,$00,$30,$2f,$01
	.dc.b	$e3,$89,$65,$10,$e3,$89,$65,$0c
	.dc.b	$d2,$9f,$65,$08,$e3,$89,$65,$04
	.dc.b	$d2,$80,$64,$dc
Lff2fae:
	unlk	a6
	movem.l	(a7)+,d1-d7
	move.w	#$0001,ccr
	rts

Lff2fba:
	unlk	a6
	movem.l	(a7)+,d1-d7
	move.w	#$0009,ccr
	rts

Lff2fc6:
	tst.w	d7
	bmi.s	Lff2fd8
	tst.l	d1
	bmi.s	Lff2fae
Lff2fce:
	move.l	d1,d0
	unlk	a6
	movem.l	(a7)+,d1-d7
	rts

Lff2fd8:
	tst.l	d1
	bpl.s	Lff2fe6
	cmp.l	#$80000000,d1
	beq.s	Lff2fce
	bra.s	Lff2fae

Lff2fe6:
	neg.l	d1
	bra.s	Lff2fce

Lff2fea:
	movem.l	d2-d7/a1-a2,-(a7)
	link.w	a6,#-$001e
	bsr.w	Lff3224
	beq.w	Lff30d0
	bsr.w	Lff31fe
	move.w	#$ffff,(-$0006,a6)
	clr.l	(-$0004,a6)
	move.b	(a0),d0
	clr.l	d6
	cmp.b	#$2e,d0			;'.'
	bne.s	Lff301e
	bset.l	#$1f,d6
	clr.w	(-$0006,a6)
	addq.l	#1,a0
	move.b	(a0),d0
Lff301e:
	bsr.w	Lff3212
	bcs.w	Lff30d0
	addq.l	#1,a0
	bsr.w	Lff30f8
	lea.l	(-$001e,a6),a1
	move.b	#$30,(a1)+		;'0'
	movea.l	a1,a2
	move.b	d0,(a1)+
	moveq.l	#$01,d5
Lff303a:
	move.b	(a0),d0
	cmp.b	#$2e,d0			;'.'
	bne.s	Lff3054
	tst.w	d6
	bne.w	Lff30d0
	bset.l	#$1f,d6
	clr.w	(-$0006,a6)
	addq.l	#1,a0
	bra.s	Lff303a

Lff3054:
	bsr.w	Lff3212
	bcs.s	Lff306e
	move.b	d0,(a1)+
	addq.l	#1,a0
	bsr.w	Lff30f8
	addq.w	#1,d5
	cmp.w	#$000f,d5
	bne.s	Lff303a
	bsr.w	Lff31cc
Lff306e:
	bsr.w	Lff3162
	bsr.w	Lff3100
	tst.w	d7
	bpl.s	Lff307e
	bsr.w	Lff2b3e
Lff307e:
	move.l	d0,(-$000e,a6)
	move.l	d1,(-$000a,a6)
	tst.w	(-$0006,a6)
	beq.s	Lff30b0
	bsr.w	Lff2994
	bcs.s	Lff30ac
	move.l	d0,d4
	bsr.w	Lff2968
	move.l	(-$000e,a6),d2
	move.l	(-$000a,a6),d3
	bsr.w	Lff2ade
	bne.s	Lff30ac
	move.l	d4,(-$0004,a6)
	bra.s	Lff30b0

Lff30ac:
	clr.w	(-$0006,a6)
Lff30b0:
	move.l	(-$000e,a6),d0
	move.l	(-$000a,a6),d1
	clr.l	d2
	move.w	(-$0006,a6),d2
	move.l	(-$0004,a6),d3
	unlk	a6
	addq.l	#8,a7
	movem.l	(a7)+,d4-d7/a1-a2
	move.w	#$0000,ccr
	rts

Lff30d0:
	unlk	a6
	movem.l	(a7)+,d2-d7/a1-a2
	clr.l	d0
	clr.l	d1
	move.w	#$0009,ccr
	rts

Lff30e0:
	unlk	a6
	movem.l	(a7)+,d2-d7/a1-a2
	move.w	#$0001,ccr
	rts

Lff30ec:
	unlk	a6
	movem.l	(a7)+,d2-d7/a1-a2
	move.w	#$0003,ccr
	rts

Lff30f8:
	tst.l	d6
	bpl.s	Lff30fe
	subq.w	#1,d6
Lff30fe:
	rts

Lff3100:
	clr.l	d0
	clr.l	d1
Lff3104:
	move.l	#$20000000,d2
	move.l	#$00000402,d3
	bsr.w	Lff2ce4
	move.l	d0,d2
	move.l	d1,d3
	clr.l	d0
	move.b	(a2)+,d0
	sub.b	#$30,d0			;'0'
	bsr.w	Lff2968
	bsr.w	Lff2b52
	subq.w	#1,d5
	bne.s	Lff3104
	add.w	d6,d4
	beq.s	Lff3160
	bmi.s	Lff314a
Lff3132:
	move.l	#$20000000,d2
	move.l	#$00000402,d3
	bsr.w	Lff2ce4
	bcs.s	Lff30ec
	subq.w	#1,d4
	bne.s	Lff3132
	rts

Lff314a:
	move.l	#$20000000,d2
	move.l	#$00000402,d3
	bsr.w	Lff2dea
	bcs.s	Lff30e0
	addq.w	#1,d4
	bne.s	Lff314a
Lff3160:
	rts

Lff3162:
	clr.l	d4
	cmp.b	#$45,d0			;'E'
	beq.s	Lff3172
	cmp.b	#$65,d0			;'e'
	beq.s	Lff3172
	rts

Lff3172:
	clr.w	(-$0006,a6)
	addq.l	#1,a0
	move.b	(a0),d0
	cmp.b	#$2b,d0			;'+'
	beq.s	Lff318a
	cmp.b	#$2d,d0			;'-'
	bne.s	Lff318e
	bset.l	#$1f,d4
Lff318a:
	addq.l	#1,a0
	move.b	(a0),d0
Lff318e:
	bsr.w	Lff3212
	bcs.w	Lff30d0
	sub.b	#$30,d0			;'0'
	move.b	d0,d4
	clr.w	d0
Lff319e:
	addq.l	#1,a0
	move.b	(a0),d0
	bsr.s	Lff3212
	bcs.s	Lff31c4
	sub.b	#$30,d0			;'0'
	move.w	d4,-(a7)
	lsl.w	#2,d4
	add.w	(a7)+,d4
	lsl.w	#1,d4
	add.w	d0,d4
	cmp.w	#$03e8,d4
	bcs.s	Lff319e
	tst.l	d4
	bpl.w	Lff30ec
	bra.w	Lff30e0

Lff31c4:
	tst.l	d4
	bpl.s	Lff31ca
	neg.w	d4
Lff31ca:
	rts

Lff31cc:
	addq.w	#1,d6
	subq.w	#1,d5
	cmpi.b	#$35,-(a1)		;'5'
	bcs.s	Lff31e4
Lff31d6:
	addq.b	#1,-(a1)
	cmpi.b	#$3a,(a1)		;':'
	bcs.s	Lff31e4
	move.b	#$30,(a1)		;'0'
	bra.s	Lff31d6

Lff31e4:
	cmpa.l	a2,a1
	bcc.s	Lff31ec
	movea.l	a1,a2
	addq.w	#1,d6
Lff31ec:
	move.b	(a0),d0
	bsr.s	Lff3212
	bcs.s	Lff31fc
	addq.l	#1,a0
	tst.w	d6
	bmi.s	Lff31ec
	addq.w	#1,d6
	bra.s	Lff31ec

Lff31fc:
	rts

Lff31fe:
	clr.w	d7
	cmp.b	#$2b,d0			;'+'
	beq.s	Lff320e
	cmp.b	#$2d,d0			;'-'
	bne.s	Lff3210
	not.w	d7
Lff320e:
	addq.l	#1,a0
Lff3210:
	rts

Lff3212:
	cmp.b	#$30,d0			;'0'
	bcs.s	Lff3220
	cmp.b	#$3a,d0			;':'
	eori.b	#$01,ccr
Lff3220:
	rts

Lff3222:
	addq.l	#1,a0
Lff3224:
	move.b	(a0),d0
	cmp.b	#$09,d0
	beq.s	Lff3222
	cmp.b	#$20,d0			;' '
	beq.s	Lff3222
	tst.b	d0
	rts

Lff3236:
	movem.l	d1-d2,-(a7)
	bsr.w	Lff33b0
	tst.l	d1
	beq.s	Lff324a
	bsr.w	Lff3386
	move.b	#$2d,(a0)+		;'-'
Lff324a:
	addq.l	#1,a0
	bsr.w	Lff3386
	move.b	#$2e,(a0)		;'.'
	bsr.w	Lff339e
	move.b	#$45,(a0)+		;'E'
	subq.l	#1,d0
	bsr.w	Lff3352
	clr.b	(a0)
	movem.l	(a7)+,d1-d2
	rts

Lff326a:
	movem.l	d1-d2,-(a7)
	bsr.w	Lff33d6
	tst.l	d1
	beq.s	Lff327e
	bsr.w	Lff3386
	move.b	#$2d,(a0)+		;'-'
Lff327e:
	tst.l	d0
	bmi.s	Lff3292
	beq.s	Lff3292
	lea.l	(a0,d0.l),a0
	bsr.w	Lff3386
	move.b	#$2e,(a0)		;'.'
	bra.s	Lff32be

Lff3292:
	neg.l	d0
	and.w	#$00ff,d2
	cmp.w	d2,d0
	bls.s	Lff329e
	move.w	d2,d0
Lff329e:
	bsr.w	Lff3386
	move.b	#$30,(a0)+		;'0'
	bsr.w	Lff3386
	move.b	#$2e,(a0)+		;'.'
	tst.w	d0
	beq.s	Lff32be
Lff32b2:
	bsr.w	Lff3386
	move.b	#$30,(a0)		;'0'
	subq.w	#1,d0
	bne.s	Lff32b2
Lff32be:
	bsr.w	Lff339e
	movem.l	(a7)+,d1-d2
	rts

Lff32c8:
	movem.l	d1-d2,-(a7)
	bsr.w	Lff33b0
	tst.l	d1
	beq.s	Lff32dc
	bsr.w	Lff3386
	move.b	#$2d,(a0)+		;'-'
Lff32dc:
	tst.l	d0
	beq.s	Lff333a
	bmi.s	Lff3302
	and.w	#$00ff,d2
	cmp.w	d2,d0
	beq.s	Lff334a
	bcc.s	Lff3322
	lea.l	(a0,d0.l),a0
	bsr.w	Lff3386
	move.b	#$2e,(a0)		;'.'
	bsr.w	Lff339e
	bsr.w	Lff33a4
	bra.s	Lff334a

Lff3302:
	move.l	a0,-(a7)
	bsr.w	Lff339e
	bsr.w	Lff33a4
	suba.l	(a7),a0
	addq.l	#1,a0
	move.l	d0,d1
	neg.l	d1
	add.l	a0,d1
	movea.l	(a7)+,a0
	and.w	#$00ff,d2
	cmp.w	d2,d1
	bcs.w	Lff3292
Lff3322:
	addq.l	#1,a0
	bsr.s	Lff3386
	move.b	#$2e,(a0)		;'.'
	bsr.s	Lff339e
	bsr.s	Lff33a4
	move.b	#$45,(a0)+		;'E'
	subq.l	#1,d0
	bsr.s	Lff3352
	clr.b	(a0)
	bra.s	Lff334a

Lff333a:
	bsr.s	Lff3386
	move.b	#$30,(a0)+		;'0'
	bsr.s	Lff3386
	move.b	#$2e,(a0)+		;'.'
	bsr.s	Lff339e
	bsr.s	Lff33a4
Lff334a:
	bsr.s	Lff339e
	movem.l	(a7)+,d1-d2
	rts

Lff3352:
	move.b	#$2b,d1			;'+'
	tst.l	d0
	bpl.s	Lff3360
	move.b	#$2d,d1			;'-'
	neg.l	d0
Lff3360:
	move.b	d1,(a0)+
	move.w	#$0064,d1		;'d'
	bsr.s	Lff3376
	move.w	#$000a,d1
	bsr.s	Lff3376
	add.b	#$30,d0			;'0'
	move.b	d0,(a0)+
	rts

Lff3376:
	move.b	#$2f,d2			;'/'
Lff337a:
	addq.b	#1,d2
	sub.w	d1,d0
	bcc.s	Lff337a
	add.w	d1,d0
	move.b	d2,(a0)+
	rts

Lff3386:
	movem.l	d0-d1/a0,-(a7)
	move.b	(a0)+,d0
Lff338c:
	move.b	(a0),d1
	move.b	d0,(a0)+
	beq.s	Lff3396
	move.b	d1,d0
	bra.s	Lff338c

Lff3396:
	movem.l	(a7)+,d0-d1/a0
	rts

Lff339c:
	addq.l	#1,a0
Lff339e:
	tst.b	(a0)
	bne.s	Lff339c
	rts

Lff33a4:
	cmpi.b	#$30,-(a0)		;'0'
	beq.s	Lff33a4
	addq.l	#1,a0
	clr.b	(a0)
	rts

Lff33b0:
	movem.l	d2-d7/a0-a2,-(a7)
	link.w	a6,#-$0016
	bsr.s	Lff33fe
	move.w	(-$0012,a6),d0
	bsr.s	Lff342e
	move.w	(-$0012,a6),d0
	bsr.w	Lff344e
	unlk	a6
	move.w	d7,d0
	ext.l	d0
	move.l	d6,d1
	movem.l	(a7)+,d2-d7/a0-a2
	rts

Lff33d6:
	movem.l	d2-d7/a0-a2,-(a7)
	link.w	a6,#-$0016
	bsr.s	Lff33fe
	move.w	(-$0012,a6),d0
	add.w	d7,d0
	bsr.s	Lff342e
	move.w	(-$0012,a6),d0
	add.w	d7,d0
	bsr.s	Lff344e
	unlk	a6
	move.w	d7,d0
	ext.l	d0
	move.l	d6,d1
	movem.l	(a7)+,d2-d7/a0-a2
	rts

Lff33fe:
	move.l	a0,(-$0016,a6)
	clr.w	(-$0012,a6)
	move.b	d2,(-$0011,a6)
	bsr.s	Lff3474
	lea.l	(-$0010,a6),a1
	move.b	#$30,(a1)+		;'0'
	move.l	a1,-(a7)
	bsr.w	Lff3502
	lea.l	(-$0001,a6),a0
	bsr.w	Lff3528
	movea.l	(a7)+,a1
	cmpa.l	a1,a0
	bcc.s	Lff342c
	movea.l	a0,a1
	addq.w	#1,d7
Lff342c:
	rts

Lff342e:
	tst.w	d0
	beq.s	Lff344c
	bmi.s	Lff344c
	cmp.w	#$000e,d0
	bcc.s	Lff344c
	movea.l	a1,a0
	lea.l	(a0,d0.w),a0
	bsr.w	Lff3528
	cmpa.l	a1,a0
	bcc.s	Lff344c
	movea.l	a0,a1
	addq.w	#1,d7
Lff344c:
	rts

Lff344e:
	movea.l	(-$0016,a6),a0
	tst.w	d0
	beq.s	Lff3470
	bmi.s	Lff3470
	clr.w	d1
Lff345a:
	cmp.w	d0,d1
	beq.s	Lff3470
	cmp.w	#$000e,d1
	bcc.s	Lff346a
	move.b	(a1)+,(a0)+
Lff3466:
	addq.w	#1,d1
	bra.s	Lff345a

Lff346a:
	move.b	#$30,(a0)+		;'0'
	bra.s	Lff3466

Lff3470:
	clr.b	(a0)
	rts

Lff3474:
	clr.l	d6
	move.l	d0,d2
	and.l	#$7fffffff,d0
	bne.s	Lff3488
	tst.l	d1
	bne.s	Lff3488
	moveq.l	#$01,d7
	rts

Lff3488:
	lsl.l	#1,d2
	roxl.l	#1,d6
	moveq.l	#$0f,d7
Lff348e:
	move.l	#$635fa931,d2
	move.l	#$a0000430.l,d3
	bsr.w	Lff2ade
	bcc.s	Lff34c4
	moveq.l	#$00,d2
	move.l	#$000003ff,d3
	bsr.w	Lff2ade
	bcc.s	Lff34da
	move.l	#$635fa931,d2
	move.l	#$a0000430.l,d3
	bsr.w	Lff2ce4
	sub.w	#$000f,d7
	bra.s	Lff348e

Lff34c4:
	move.l	#$635fa931,d2
	move.l	#$a0000430.l,d3
	bsr.w	Lff2dea
	add.w	#$000f,d7
	bra.s	Lff348e

Lff34da:
	move.l	#$35e620f4,d2
	move.l	#$8000042d.l,d3
	bsr.w	Lff2ade
	bcc.s	Lff3500
	move.l	#$20000000,d2
	move.l	#$00000402,d3
	bsr.w	Lff2ce4
	subq.w	#1,d7
	bra.s	Lff34da

Lff3500:
	rts

Lff3502:
	move.w	#$000e,d4
	lea.l	(Lff3546,pc),a2
Lff350a:
	move.b	#$30,(a1)		;'0'
	lea.l	(a2),a0
Lff3510:
	bsr.w	Lff35be
	bcs.s	Lff351e
	addq.b	#1,(a1)
	bsr.w	Lff35d2
	bra.s	Lff3510

Lff351e:
	addq.l	#1,a1
	addq.l	#8,a2
	dbra.w	d4,Lff350a
	rts

Lff3528:
	cmpi.b	#$35,(a0)		;'5'
	bcs.s	Lff353c
Lff352e:
	addq.b	#1,-(a0)
	cmpi.b	#$39,(a0)		;'9'
	bls.s	Lff353c
	move.b	#$30,(a0)		;'0'
	bra.s	Lff352e

Lff353c:
	rts

Lff353e:
	.dc.b	$63,$5f,$a9,$31,$a0,$00,$04,$30
Lff3546:
	.dc.b	$35,$e6,$20,$f4,$80,$00,$04,$2d
	.dc.b	$11,$84,$e7,$2a,$00,$00,$04,$2a
	.dc.b	$68,$d4,$a5,$10,$00,$00,$04,$26
	.dc.b	$3a,$43,$b7,$40,$00,$00,$04,$23
	.dc.b	$15,$02,$f9,$00,$00,$00,$04,$20
	.dc.b	$6e,$6b,$28,$00,$00,$00,$04,$1c
	.dc.b	$3e,$bc,$20,$00,$00,$00,$04,$19
	.dc.b	$18,$96,$80,$00,$00,$00,$04,$16
	.dc.b	$74,$24,$00,$00,$00,$00,$04,$12
	.dc.b	$43,$50,$00,$00,$00,$00,$04,$0f
	.dc.b	$1c,$40,$00,$00,$00,$00,$04,$0c
	.dc.b	$7a,$00,$00,$00,$00,$00,$04,$08
	.dc.b	$48,$00,$00,$00,$00,$00,$04,$05
	.dc.b	$20,$00,$00,$00,$00,$00,$04,$02
	.dc.b	$00,$00,$00,$00,$00,$00,$03,$ff
Lff35be:
	move.l	(a0),d2
	move.l	($0004,a0),d3
	bra.w	Lff2ade

Lff35c8:
	move.l	(a0),d2
	move.l	($0004,a0),d3
	bra.w	Lff2b52

Lff35d2:
	move.l	(a0),d2
	move.l	($0004,a0),d3
	bra.w	Lff2c00

Lff35dc:
	move.l	(a0),d2
	move.l	($0004,a0),d3
	bra.w	Lff2ce4

Lff35e6:
	move.l	(a0),d2
	move.l	($0004,a0),d3
	bra.w	Lff2dea

Lff35f0:
	move.w	($00000bca).l,d0
	bne.s	Lff3634
	bsr.w	Lff6368
	cmpi.b	#$02,($000009dd).l
	beq.s	Lff3632
	tst.b	($00000bc6).l
	beq.s	Lff364e
	movem.l	d1-d2,-(a7)
	bsr.w	Lff36bc
	bne.s	Lff362e
	cmp.b	#$f0,d1
	beq.s	Lff3624
	bsr.w	Lff36f8
	bra.s	Lff3628

Lff3624:
	bsr.w	Lff3f44
Lff3628:
	movem.l	(a7)+,d1-d2
	bra.s	Lff35f0

Lff362e:
	movem.l	(a7)+,d1-d2
Lff3632:
	rts

Lff3634:
	subq.w	#1,d0
	move.w	d0,($00000bca).l
	movea.l	($00000bcc).l,a0
	clr.l	d0
	move.w	(a0)+,d0
	move.l	a0,($00000bcc).l
Lff364c:
	rts

Lff364e:
	cmp.w	#$6d00,d0
	bne.s	Lff364c
	bsr.w	Lff3e92
	bra.s	Lff35f0

Lff365a:
	move.w	($00000bca).l,d0
	bne.s	Lff369a
	bsr.w	Lff6380
	cmpi.b	#$02,($000009dd).l
	beq.s	Lff3632
	tst.b	($00000bc6).l
	beq.s	Lff36aa
	movem.l	d1-d2,-(a7)
	bsr.s	Lff36bc
	bne.s	Lff3694
	bsr.w	Lff6368
	cmp.b	#$f0,d1
	beq.s	Lff368e
	bsr.s	Lff36f8
	bra.s	Lff3692

Lff368e:
	bsr.w	Lff3f44
Lff3692:
	clr.l	d0
Lff3694:
	movem.l	(a7)+,d1-d2
	rts

Lff369a:
	movea.l	($00000bcc).l,a0
	move.l	#$00010000,d0
	move.w	(a0),d0
	rts

Lff36aa:
	cmp.w	#$6d00,d0
	bne.s	Lff36ba
	bsr.w	Lff6368
	bsr.w	Lff3e92
	clr.l	d0
Lff36ba:
	rts

Lff36bc:
	lea.l	(Lff40ce),a0
	move.w	d0,d1
	lsr.w	#8,d1
	moveq.l	#$21,d2			;'!'
Lff36c8:
	cmp.b	($0001,a0),d1
	beq.s	Lff36d8
	addq.l	#2,a0
	dbra.w	d2,Lff36c8
Lff36d4:
	moveq.l	#$ff,d2
	rts

Lff36d8:
	move.b	(a0),d1
	tst.b	($00000bc7).l
	bne.s	Lff36ee
	cmp.b	#$41,d1			;'A'
	bcs.s	Lff36ee
	cmp.b	#$47,d1			;'G'
	bcs.s	Lff36d4
Lff36ee:
	sub.w	#$0021,d2
	neg.w	d2
	cmp.b	d1,d1
	rts

Lff36f8:
	cmp.b	#$f4,d1
	bne.s	Lff371c
	clr.l	($00000c08).l
	clr.l	($00000c0c).l
	clr.b	($00000bc8).l
	clr.b	($00000c1a).l
	bra.w	Lff3da4

Lff371a:
	rts

Lff371c:
	tst.b	($00000c1a).l
	bne.s	Lff371a
	cmp.b	#$f1,d1
	bne.s	Lff373a
	bsr.w	Lff3af8
	move.b	#$01,($00000bc7).l
	bra.w	Lff3db8

Lff373a:
	cmp.b	#$f2,d1
	bne.s	Lff374e
	bsr.w	Lff3af8
	clr.b	($00000bc7).l
	bra.w	Lff3db8

Lff374e:
	cmp.b	#$f3,d1
	bne.s	Lff3774
	move.l	($00000c00).l,($00000c10).l
	move.l	($00000c04).l,($00000c14).l
	bclr.b	#$04,($00000bc8).l
	bra.w	Lff3db8

Lff3774:
	cmp.b	#$f5,d1
	bne.s	Lff37f6
	bsr.w	Lff3af8
	bsr.w	Lff3b82
	bsr.w	Lff3da4
	tst.b	($00000c1a).l
	bne.s	Lff37f4
	movem.l	a1-a2,-(a7)
	clr.w	d2
	lea.l	($00000bd0).l,a1
	move.l	a1,($00000bcc).l
	lea.l	($00000c1b).l,a0
	cmpi.b	#$2e,($000f,a0)		;'.'
	beq.s	Lff37bc
	cmpi.b	#$20,($0010,a0)		;' '
	bne.s	Lff37c0
	clr.b	($0010,a0)
	bra.s	Lff37c0

Lff37bc:
	clr.b	($000f,a0)
Lff37c0:
	move.b	(a0)+,d0
	beq.s	Lff37ea
	cmp.b	#$20,d0			;' '
	beq.s	Lff37c0
	lea.l	(Lff40ec),a2
	moveq.l	#$12,d1
Lff37d2:
	cmp.b	(a2)+,d0
	beq.s	Lff37de
	addq.l	#1,a2
	dbra.w	d1,Lff37d2
	bra.s	Lff37c0

Lff37de:
	asl.w	#8,d0
	move.b	(a2),d0
	ror.w	#8,d0
	move.w	d0,(a1)+
	addq.w	#1,d2
	bra.s	Lff37c0

Lff37ea:
	move.w	d2,($00000bca).l
	movem.l	(a7)+,a1-a2
Lff37f4:
	rts

Lff37f6:
	cmp.b	#$f6,d1
	bne.s	Lff3814
	clr.l	($00000c10).l
	clr.l	($00000c14).l
	bclr.b	#$04,($00000bc8).l
	bra.w	Lff3db8

Lff3814:
	cmp.b	#$f7,d1
	bne.s	Lff3862
	bsr.w	Lff3af8
	bsr.w	Lff3b82
	movem.l	d2-d3,-(a7)
	move.l	($00000c00).l,d0
	move.l	($00000c04).l,d1
	move.l	($00000c08).l,d2
	move.l	($00000c0c).l,d3
	bsr.w	Lff2b52
	bcs.s	Lff3858
	move.l	d0,($00000c00).l
	move.l	d1,($00000c04).l
Lff3850:
	movem.l	(a7)+,d2-d3
	bra.w	Lff3da4

Lff3858:
	move.b	#$01,($00000c1a).l
	bra.s	Lff3850

Lff3862:
	cmp.b	#$f8,d1
	bne.s	Lff38b0
	bsr.w	Lff3af8
	bsr.w	Lff3b82
	movem.l	d2-d3,-(a7)
	move.l	($00000c00).l,d0
	move.l	($00000c04).l,d1
	move.l	($00000c08).l,d2
	move.l	($00000c0c).l,d3
	bsr.w	Lff2c00
	bcs.s	Lff38a6
	move.l	d0,($00000c00).l
	move.l	d1,($00000c04).l
Lff389e:
	movem.l	(a7)+,d2-d3
	bra.w	Lff3da4

Lff38a6:
	move.b	#$01,($00000c1a).l
	bra.s	Lff389e

Lff38b0:
	cmp.b	#$f9,d1
	bne.s	Lff38c6
	clr.l	($00000c00).l
	clr.l	($00000c04).l
	bra.w	Lff3dc2

Lff38c6:
	cmp.b	#$fa,d1
	bne.s	Lff3930
	tst.w	($00000c18).l
	beq.s	Lff392e
	tst.b	($00000bc9).l
	beq.s	Lff38fa
	movem.l	d0/a0-a1,-(a7)
	lea.l	($00000c2a).l,a0
	cmpi.b	#$2e,(a0)		;'.'
	beq.s	Lff38f2
	subq.l	#1,a0
	moveq.l	#$0e,d0
	bra.s	Lff3906

Lff38f2:
	clr.b	($00000bc9).l
	bra.s	Lff3924

Lff38fa:
	movem.l	d0/a0-a1,-(a7)
	lea.l	($00000c28).l,a0
	moveq.l	#$0d,d0
Lff3906:
	move.b	(a0),($0001,a0)
	subq.l	#1,a0
	dbra.w	d0,Lff3906
	lea.l	($00000c29).l,a0
	cmpi.b	#$20,(a0)		;' '
	bne.s	Lff3920
	move.b	#$30,(a0)		;'0'
Lff3920:
	bsr.w	Lff3dc2
Lff3924:
	subq.w	#1,($00000c18).l
	movem.l	(a7)+,d0/a0-a1
Lff392e:
	rts

Lff3930:
	cmp.b	#$fb,d1
	bne.s	Lff3962
	bsr.w	Lff3af8
	move.l	($00000c10).l,d0
	move.l	($00000c14).l,d1
	bsr.w	Lff2b3e
	move.l	d0,($00000c10).l
	move.l	d1,($00000c14).l
	bclr.b	#$04,($00000bc8).l
	bra.w	Lff3db8

Lff3962:
	cmp.b	#$3d,d1			;'='
	bne.s	Lff3974
	bsr.w	Lff3af8
	bsr.w	Lff3b82
	bra.w	Lff3da4

Lff3974:
	cmp.b	#$2b,d1			;'+'
	bne.s	Lff398e
	bsr.w	Lff3af8
	bsr.w	Lff3b82
	move.b	#$11,($00000bc8).l
	bra.w	Lff3da4

Lff398e:
	cmp.b	#$2d,d1			;'-'
	bne.s	Lff39a8
	bsr.w	Lff3af8
	bsr.w	Lff3b82
	move.b	#$12,($00000bc8).l
	bra.w	Lff3da4

Lff39a8:
	cmp.b	#$2a,d1			;'*'
	bne.s	Lff39c2
	bsr.w	Lff3af8
	bsr.w	Lff3b82
	move.b	#$13,($00000bc8).l
	bra.w	Lff3da4

Lff39c2:
	cmp.b	#$2f,d1			;'/'
	bne.s	Lff39dc
	bsr.w	Lff3af8
	bsr.w	Lff3b82
	move.b	#$14,($00000bc8).l
	bra.w	Lff3da4

Lff39dc:
	cmpi.w	#$0001,($00000c18).l
	bne.s	Lff39f6
	cmpi.b	#$30,($00000c29).l	;'0'
	bne.s	Lff39f6
	clr.w	($00000c18).l
Lff39f6:
	tst.w	($00000c18).l
	bne.s	Lff3a06
	move.b	#$00,($00000bc9).l
Lff3a06:
	tst.b	($00000bc7).l
	beq.s	Lff3a26
	cmp.b	#$2e,d1			;'.'
	beq.w	Lff3aac
	cmpi.w	#$0008,($00000c18).l
	bcc.w	Lff3aac
	moveq.l	#$0d,d0
	bra.s	Lff3a48

Lff3a26:
	cmp.b	#$40,d1			;'@'
	bcc.w	Lff3aac
	tst.b	($00000bc9).l
	beq.s	Lff3a6e
	cmp.b	#$2e,d1			;'.'
	beq.s	Lff3aac
	moveq.l	#$0e,d0
	cmpi.w	#$000f,($00000c18).l
	bcc.s	Lff3aac
Lff3a48:
	tst.w	($00000c18).l
	bne.s	Lff3a52
	bsr.s	Lff3aae
Lff3a52:
	addq.w	#1,($00000c18).l
	lea.l	($00000c1b).l,a0
Lff3a5e:
	move.b	($0001,a0),(a0)
	addq.l	#1,a0
	dbra.w	d0,Lff3a5e
	move.b	d1,(a0)
	bra.w	Lff3dc2

Lff3a6e:
	cmpi.w	#$000e,($00000c18).l
	bcc.s	Lff3aac
	moveq.l	#$0d,d0
	cmp.b	#$2e,d1			;'.'
	bne.s	Lff3a48
	addq.w	#1,($00000c18).l
	move.b	#$01,($00000bc9).l
	cmpi.w	#$0001,($00000c18).l
	bne.s	Lff3aac
	addq.w	#1,($00000c18).l
	bsr.s	Lff3aae
	move.b	#$30,($00000c29).l	;'0'
	bra.w	Lff3dc2

Lff3aac:
	rts

Lff3aae:
	lea.l	($00000c1b).l,a0
	move.l	d0,-(a7)
	moveq.l	#$0e,d0
Lff3ab8:
	move.b	#$20,(a0)+		;' '
	dbra.w	d0,Lff3ab8
	move.b	#$2e,(a0)+		;'.'
	move.b	#$20,(a0)+		;' '
	move.b	#$20,(a0)+		;' '
	tst.b	($00000bc7).l
	bne.s	Lff3ae6
	move.b	#$44,(a0)+		;'D'
	move.b	#$45,(a0)+		;'E'
	move.b	#$43,(a0)+		;'C'
	clr.b	(a0)+
	move.l	(a7)+,d0
	rts

Lff3ae6:
	move.b	#$48,(a0)+		;'H'
	move.b	#$45,(a0)+		;'E'
	move.b	#$58,(a0)+		;'X'
	clr.b	(a0)+
	move.l	(a7)+,d0
	rts

Lff3af8:
	tst.w	($00000c18).l
	beq.s	Lff3b2e
	bclr.b	#$04,($00000bc8).l
	movem.l	d0-d1/a0,-(a7)
	lea.l	($00000c1b).l,a0
	tst.b	($00000bc7).l
	bne.s	Lff3b30
	bsr.w	Lff2fea
Lff3b1e:
	move.l	d0,($00000c10).l
	move.l	d1,($00000c14).l
	movem.l	(a7)+,d0-d1/a0
Lff3b2e:
	rts

Lff3b30:
	clr.l	d1
	clr.l	d0
Lff3b34:
	move.b	(a0)+,d0
	beq.s	Lff3b7a
	cmp.b	#$20,d0			;' '
	beq.s	Lff3b34
Lff3b3e:
	cmp.b	#$30,d0			;'0'
	bcs.s	Lff3b7a
	cmp.b	#$3a,d0			;':'
	bcs.s	Lff3b6e
	cmp.b	#$41,d0			;'A'
	bcs.s	Lff3b7a
	cmp.b	#$47,d0			;'G'
	bcs.s	Lff3b68
	cmp.b	#$61,d0			;'a'
	bcs.s	Lff3b7a
	cmp.b	#$67,d0			;'g'
	bcc.s	Lff3b7a
	sub.b	#$57,d0			;'W'
	bra.s	Lff3b72

Lff3b68:
	sub.b	#$37,d0			;'7'
	bra.s	Lff3b72

Lff3b6e:
	sub.b	#$30,d0			;'0'
Lff3b72:
	asl.l	#4,d1
	add.l	d0,d1
	move.b	(a0)+,d0
	bra.s	Lff3b3e

Lff3b7a:
	move.l	d1,d0
	bsr.w	Lff2968
	bra.s	Lff3b1e

Lff3b82:
	movem.l	d0-d4,-(a7)
	move.b	($00000bc8).l,d4
	move.l	($00000c08).l,d0
	move.l	($00000c0c).l,d1
	move.l	($00000c10).l,d2
	move.l	($00000c14).l,d3
	bsr.s	Lff3bca
	bcs.s	Lff3bc0
	move.l	d0,($00000c08).l
	move.l	d1,($00000c0c).l
Lff3bb4:
	clr.b	($00000bc8).l
	movem.l	(a7)+,d0-d4
	rts

Lff3bc0:
	move.b	#$01,($00000c1a).l
	bra.s	Lff3bb4

Lff3bca:
	subq.b	#1,d4
	beq.w	Lff2b52
	subq.b	#1,d4
	beq.w	Lff2c00
	subq.b	#1,d4
	beq.w	Lff2ce4
	subq.b	#1,d4
	beq.w	Lff2dea
	move.l	d2,d0
	move.l	d3,d1
	or.l	d3,d3
	rts

Lff3bea:
	movem.l	d0-d2/a0-a1,-(a7)
	lea.l	(-$0014,a7),a7
	bsr.w	Lff3aae
	move.l	($00000c10).l,d0
	move.l	($00000c14).l,d1
	tst.b	($00000c1a).l
	bne.w	Lff3ca0
	tst.b	($00000bc7).l
	bne.w	Lff3d3a
	moveq.l	#$0e,d2
	movea.l	a7,a0
	bsr.w	Lff33b0
	cmp.l	#$0000000f,d0
	bcs.w	Lff3cbc
	cmp.l	#$fffffff4,d0
	bcc.w	Lff3cbc
	movea.l	a7,a0
	lea.l	($00000c1b).l,a1
	move.l	d0,-(a7)
	bsr.w	Lff3d94
	bsr.w	Lff3d86
	move.b	d0,(a1)+
	move.b	#$2e,(a1)+		;'.'
	moveq.l	#$0c,d2
Lff3c4c:
	bsr.w	Lff3d86
	move.b	d0,(a1)+
	dbra.w	d2,Lff3c4c
	move.l	(a7)+,d2
	move.b	#$45,(a1)+		;'E'
	move.b	#$2b,d0			;'+'
	subq.l	#1,d2
	bpl.s	Lff3c6a
	neg.l	d2
	move.b	#$2d,d0			;'-'
Lff3c6a:
	move.b	d0,(a1)+
	divu.w	#$0064,d2
	add.b	#$30,d2			;'0'
	move.b	d2,(a1)+
	clr.w	d2
	swap.w	d2
	divu.w	#$000a,d2
	add.b	#$30,d2			;'0'
	move.b	d2,(a1)+
	swap.w	d2
	add.b	#$30,d2			;'0'
	move.b	d2,(a1)+
	clr.b	(a1)+
Lff3c8e:
	lea.l	($0014,a7),a7
	movem.l	(a7)+,d0-d2/a0-a1
	rts

Lff3c98:
	move.b	#$01,($00000c1a).l
Lff3ca0:
	lea.l	($00000c26).l,a1
	move.b	#$2d,(a1)+		;'-'
	move.b	#$20,(a1)+		;' '
	move.b	#$45,(a1)+		;'E'
	move.b	#$20,(a1)+		;' '
	move.b	#$2d,(a1)		;'-'
	bra.s	Lff3c8e

Lff3cbc:
	movea.l	a7,a0
	lea.l	(-$0016,a7),a7
	movea.l	a7,a1
	bsr.w	Lff3d94
	move.l	d0,d1
	moveq.l	#$0f,d2
	subq.l	#1,d1
	bmi.s	Lff3cde
Lff3cd0:
	bsr.w	Lff3d86
	move.b	d0,(a1)+
	subq.l	#1,d2
	dbra.w	d1,Lff3cd0
	bra.s	Lff3cf4

Lff3cde:
	move.b	#$30,(a1)+		;'0'
	subq.l	#1,d2
	move.b	#$2e,(a1)+		;'.'
Lff3ce8:
	subq.l	#1,d2
	addq.l	#1,d1
	beq.s	Lff3cfa
	move.b	#$30,(a1)+		;'0'
	bra.s	Lff3ce8

Lff3cf4:
	move.b	#$2e,(a1)+		;'.'
	subq.l	#1,d2
Lff3cfa:
	move.b	(a0)+,(a1)+
	beq.s	Lff3d04
	dbra.w	d2,Lff3cfa
	clr.b	(a1)+
Lff3d04:
	subq.l	#1,a1
Lff3d06:
	move.b	-(a1),d0
	cmp.b	#$30,d0			;'0'
	beq.s	Lff3d06
	addq.l	#1,a1
	clr.b	(a1)
	suba.l	a7,a1
	moveq.l	#$10,d0
	sub.l	a1,d0
	bpl.s	Lff3d1c
	clr.l	d0
Lff3d1c:
	lea.l	($00000c1b).l,a1
	adda.l	d0,a1
	movea.l	a7,a0
	moveq.l	#$0f,d1
Lff3d28:
	move.b	(a0)+,d0
	beq.s	Lff3d32
	move.b	d0,(a1)+
	dbra.w	d1,Lff3d28
Lff3d32:
	lea.l	($0016,a7),a7
	bra.w	Lff3c8e

Lff3d3a:
	bsr.w	Lff2994
	bcs.w	Lff3c98
	lea.l	($00000c22).l,a1
	move.l	d0,d1
	moveq.l	#$07,d2
	clr.l	d0
Lff3d4e:
	rol.l	#4,d1
	move.b	d1,d0
	and.b	#$0f,d0
	add.b	#$30,d0			;'0'
	cmp.b	#$3a,d0			;':'
	bcs.s	Lff3d62
	addq.b	#7,d0
Lff3d62:
	btst.l	#$08,d0
	bne.s	Lff3d80
	cmp.b	#$30,d0			;'0'
	bne.s	Lff3d80
	tst.w	d2
	beq.s	Lff3d80
	move.b	#$20,d0			;' '
Lff3d76:
	move.b	d0,(a1)+
	dbra.w	d2,Lff3d4e
	bra.w	Lff3c8e

Lff3d80:
	bset.l	#$08,d0
	bra.s	Lff3d76

Lff3d86:
	move.b	(a0),d0
	beq.s	Lff3d8e
	addq.l	#1,a0
	rts

Lff3d8e:
	move.b	#$30,d0			;'0'
	rts

Lff3d94:
	tst.b	d1
	beq.s	Lff3d9e
	move.b	#$2d,(a1)+		;'-'
	rts

Lff3d9e:
	move.b	#$20,(a1)+		;' '
	rts

Lff3da4:
	move.l	($00000c08).l,($00000c10).l
	move.l	($00000c0c).l,($00000c14).l
Lff3db8:
	bsr.w	Lff3bea
	clr.w	($00000c18).l
Lff3dc2:
	movem.l	d0-d4/a0-a1,-(a7)
	move.b	#$01,($000009dd).l
	bsr.w	Lffa39e
	move.w	d0,-(a7)
	bsr.w	Lffa36e
	lea.l	(-$000c,a7),a7
	movea.l	a7,a1
	move.b	#$f0,(a1)
	moveq.l	#$20,d1			;' '
	move.l	($00000c00).l,d0
	or.l	($00000c04).l,d0
	beq.s	Lff3df4
	moveq.l	#$4d,d1			;'M'
Lff3df4:
	move.b	d1,($0001,a1)
	move.b	#$f2,($0002,a1)
	move.b	($00000bc8).l,d0
	and.b	#$07,d0
	moveq.l	#$2b,d1			;'+'
	subq.b	#1,d0
	beq.s	Lff3e22
	moveq.l	#$2d,d1			;'-'
	subq.b	#1,d0
	beq.s	Lff3e22
	moveq.l	#$2a,d1			;'*'
	subq.b	#1,d0
	beq.s	Lff3e22
	moveq.l	#$2f,d1			;'/'
	subq.b	#1,d0
	beq.s	Lff3e22
	moveq.l	#$20,d1			;' '
Lff3e22:
	move.b	d1,($0003,a1)
	move.w	($00000bfc).l,d1
	move.w	($00000bfe).l,d2
	moveq.l	#$01,d3
	bsr.w	Lff3ffe
	move.w	($00000bfc).l,d1
	move.w	($00000bfe).l,d2
	add.w	#$0010,d1
	moveq.l	#$0f,d3
	lea.l	($00000c1b).l,a1
	bsr.w	Lff3ffe
	lea.l	($00000c2b).l,a0
	movea.l	a7,a1
	moveq.l	#$04,d4
Lff3e5e:
	move.b	#$f2,(a1)+
	move.b	(a0)+,(a1)+
	dbra.w	d4,Lff3e5e
	move.w	($00000bfc).l,d1
	move.w	($00000bfe).l,d2
	add.w	#$0090,d1
	moveq.l	#$04,d3
	movea.l	a7,a1
	bsr.w	Lff3ffe
	lea.l	($000c,a7),a7
	move.w	(a7)+,d0
	beq.s	Lff3e8c
	bsr.w	Lffa33e
Lff3e8c:
	movem.l	(a7)+,d0-d4/a0-a1
	rts

Lff3e92:
	movem.l	d1-d7/a0-a6,-(a7)
	move.b	#$01,($00000bc6).l
	move.b	#$01,($000009dd).l
	bsr.w	Lff3fda
	btst.b	#$00,($00000bbf).l
	beq.s	Lff3eca
	bsr.w	Lff4c50
	move.w	($00000bb0).l,d0
	move.w	($00000bb2).l,d1
	addq.w	#2,d1
	add.w	#$00b8,d0
Lff3eca:
	move.w	d0,($00000bfc).l
	move.w	d1,($00000bfe).l
	bsr.w	Lffa39e
	move.w	d0,-(a7)
	bsr.w	Lffa36e
	move.l	#$00e40000,($0000094c).l
	move.w	#$ffff,-(a7)
	move.w	#$0010,-(a7)
	move.w	#$00b8,-(a7)
	move.w	($00000bfe).l,-(a7)
	move.w	($00000bfc).l,-(a7)
	bsr.w	Lff61ee
	lea.l	($000a,a7),a7
	move.l	#$00e60000,($0000094c).l
	clr.w	-(a7)
	move.w	#$0010,-(a7)
	move.w	#$00b8,-(a7)
	move.w	($00000bfe).l,-(a7)
	move.w	($00000bfc).l,-(a7)
	bsr.w	Lff61ee
	lea.l	($000a,a7),a7
	move.w	(a7)+,d0
	beq.s	Lff3f3a
	bsr.w	Lffa33e
Lff3f3a:
	bsr.w	Lff3da4
	movem.l	(a7)+,d1-d7/a0-a6
	rts

Lff3f44:
	clr.b	($00000bc6).l
	btst.b	#$00,($00000bbf).l
	beq.s	Lff3f58
	bsr.w	Lff4c50
Lff3f58:
	movem.l	d1-d7/a0-a6,-(a7)
	move.b	#$01,($000009dd).l
	bsr.w	Lffa39e
	move.w	d0,-(a7)
	bsr.w	Lffa36e
	clr.w	d0
	btst.b	#$00,($00000bbf).l
	beq.s	Lff3f7c
	moveq.l	#$ff,d0
Lff3f7c:
	move.l	#$00e40000,($0000094c).l
	move.w	d0,-(a7)
	move.w	#$0010,-(a7)
	move.w	#$00b8,-(a7)
	move.w	($00000bfe).l,-(a7)
	move.w	($00000bfc).l,-(a7)
	bsr.w	Lff61ee
	lea.l	($000a,a7),a7
	move.l	#$00e60000,($0000094c).l
	clr.w	-(a7)
	move.w	#$0010,-(a7)
	move.w	#$00b8,-(a7)
	move.w	($00000bfe).l,-(a7)
	move.w	($00000bfc).l,-(a7)
	bsr.w	Lff61ee
	lea.l	($000a,a7),a7
	move.w	(a7)+,d0
	beq.s	Lff3fd4
	bsr.w	Lffa33e
Lff3fd4:
	movem.l	(a7)+,d1-d7/a0-a6
	rts

Lff3fda:
	move.w	($00000974).l,d0
	move.w	($00000970).l,d1
	sub.w	#$0016,d1
	cmp.w	d1,d0
	bcs.s	Lff3ff0
	move.w	d1,d0
Lff3ff0:
	asl.w	#3,d0
	move.w	($00000976).l,d1
	addq.w	#1,d1
	asl.w	#4,d1
	rts

Lff3ffe:
	clr.w	d0
	move.b	(a1)+,d0
	bne.s	Lff4008
	subq.l	#1,a1
	moveq.l	#$20,d0			;' '
Lff4008:
	cmp.b	#$80,d0
	bcs.s	Lff4032
	beq.s	Lff4026
	cmp.b	#$a0,d0
	bcs.s	Lff4022
	cmp.b	#$e0,d0
	bcs.s	Lff4032
	cmp.b	#$f0,d0
	bcc.s	Lff4026
Lff4022:
	subq.w	#1,d3
	bmi.s	Lff403a
Lff4026:
	asl.w	#8,d0
	move.b	(a1)+,d0
	bne.s	Lff4032
	subq.l	#1,a1
	move.w	#$8140,d0
Lff4032:
	bsr.s	Lff4040
	dbra.w	d3,Lff3ffe
	rts

Lff403a:
	moveq.l	#$20,d0			;' '
	bsr.s	Lff4040
	rts

Lff4040:
	movem.l	d1-d3/a1-a2,-(a7)
	tst.b	($00ed002c)
	beq.s	Lff408a
	lea.l	(-$004c,a7),a7
	movea.l	a7,a1
	movem.l	d1-d2,-(a7)
	move.l	#$00080000,d1
	move.w	d0,d1
	bsr.w	Lff7094
	movem.l	(a7)+,d1-d2
	movea.l	a7,a1
	move.l	($00000944).l,-(a7)
	move.l	#$00e60000,($00000944).l
	bsr.w	Lff718c
	move.l	(a7)+,($00000944).l
	move.w	(a7),d0
	lea.l	($004c,a7),a7
	bra.s	Lff40c6

Lff408a:
	move.w	d0,d3
	lea.l	(Lff4112),a1
	cmp.b	#$20,d3			;' '
	bne.s	Lff409a
	moveq.l	#$20,d3			;' '
Lff409a:
	move.w	(a1)+,d0
	beq.s	Lff40c6
	cmp.w	d3,d0
	beq.s	Lff40a8
	lea.l	($0014,a1),a1
	bra.s	Lff409a

Lff40a8:
	move.l	($00000944).l,-(a7)
	move.l	#$00e60000,($00000944).l
	move.w	(a1),d3
	bsr.w	Lff718c
	move.l	(a7)+,($00000944).l
	move.w	d3,d0
Lff40c6:
	movem.l	(a7)+,d1-d3/a1-a2
	add.w	d0,d1
	rts

Lff40ce:
	.dc.b	$f0,$6d,$f1,$38,$f2,$39,$f3,$54
	.dc.b	$f4,$3f,$f5,$4e,$f6,$3a,$f7,$53
	.dc.b	$f8,$52,$f9,$36,$fa,$37,$fb,$50
	.dc.b	$3d,$4a,$2f,$40,$2a,$41
Lff40ec:
	.dc.b	$30,$4f,$31,$4b,$32,$4c,$33,$4d
	.dc.b	$34,$47,$35,$48,$36,$49,$37,$43
	.dc.b	$38,$44,$39,$45,$41,$1e,$42,$2e
	.dc.b	$43,$2c,$44,$20,$45,$13,$46,$21
	.dc.b	$2e,$51,$2b,$46,$2d,$42
Lff4112:
	.dc.b	$00,$20,$00,$08,$00,$10,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$2d
	.dc.b	$00,$08,$00,$10,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$7c,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$30,$00,$08
	.dc.b	$00,$10,$00,$7c,$82,$c6,$c6,$c6
	.dc.b	$82,$00,$82,$c6,$c6,$c6,$82,$7c
	.dc.b	$00,$00,$00,$31,$00,$08,$00,$10
	.dc.b	$00,$00,$04,$0c,$0c,$0c,$0c,$04
	.dc.b	$04,$0c,$0c,$0c,$0c,$04,$00,$00
	.dc.b	$00,$32,$00,$08,$00,$10,$00,$7c
	.dc.b	$02,$06,$06,$06,$02,$7c,$80,$c0
	.dc.b	$c0,$c0,$80,$7c,$00,$00,$00,$33
	.dc.b	$00,$08,$00,$10,$00,$7c,$02,$06
	.dc.b	$06,$06,$02,$7c,$02,$06,$06,$06
	.dc.b	$02,$7c,$00,$00,$00,$34,$00,$08
	.dc.b	$00,$10,$00,$00,$82,$c6,$c6,$c6
	.dc.b	$82,$7c,$02,$06,$06,$06,$06,$02
	.dc.b	$00,$00,$00,$35,$00,$08,$00,$10
	.dc.b	$00,$7c,$80,$c0,$c0,$c0,$80,$7c
	.dc.b	$02,$06,$06,$06,$02,$7c,$00,$00
	.dc.b	$00,$36,$00,$08,$00,$10,$00,$7c
	.dc.b	$80,$c0,$c0,$c0,$80,$7c,$82,$c6
	.dc.b	$c6,$c6,$82,$7c,$00,$00,$00,$37
	.dc.b	$00,$08,$00,$10,$00,$7c,$82,$c6
	.dc.b	$c6,$c6,$82,$00,$02,$06,$06,$06
	.dc.b	$06,$02,$00,$00,$00,$38,$00,$08
	.dc.b	$00,$10,$00,$7c,$82,$c6,$c6,$c6
	.dc.b	$82,$7c,$82,$c6,$c6,$c6,$82,$7c
	.dc.b	$00,$00,$00,$39,$00,$08,$00,$10
	.dc.b	$00,$7c,$82,$c6,$c6,$c6,$82,$7c
	.dc.b	$02,$06,$06,$06,$02,$7c,$00,$00
	.dc.b	$00,$41,$00,$08,$00,$10,$00,$7c
	.dc.b	$82,$c6,$c6,$c6,$82,$7c,$82,$c6
	.dc.b	$c6,$c6,$c6,$82,$00,$00,$00,$42
	.dc.b	$00,$08,$00,$10,$00,$00,$80,$c0
	.dc.b	$c0,$c0,$80,$7c,$82,$c6,$c6,$c6
	.dc.b	$82,$7c,$00,$00,$00,$43,$00,$08
	.dc.b	$00,$10,$00,$7c,$80,$c0,$c0,$c0
	.dc.b	$80,$00,$80,$c0,$c0,$c0,$80,$7c
	.dc.b	$00,$00,$00,$44,$00,$08,$00,$10
	.dc.b	$00,$00,$02,$06,$06,$06,$02,$7c
	.dc.b	$82,$c6,$c6,$c6,$82,$7c,$00,$00
	.dc.b	$00,$45,$00,$08,$00,$10,$00,$7c
	.dc.b	$80,$c0,$c0,$c0,$80,$7c,$80,$c0
	.dc.b	$c0,$c0,$80,$7c,$00,$00,$00,$46
	.dc.b	$00,$08,$00,$10,$00,$7c,$80,$c0
	.dc.b	$c0,$c0,$80,$7c,$80,$c0,$c0,$c0
	.dc.b	$c0,$80,$00,$00,$f0,$4d,$00,$08
	.dc.b	$00,$10,$00,$44,$44,$6c,$54,$54
	.dc.b	$44,$44,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$f2,$2f,$00,$08,$00,$10
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$04,$08,$10,$20,$40,$00,$00
	.dc.b	$f2,$2a,$00,$08,$00,$10,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$10
	.dc.b	$54,$38,$54,$10,$00,$00,$f2,$2d
	.dc.b	$00,$08,$00,$10,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$7c
	.dc.b	$00,$00,$00,$00,$f2,$2b,$00,$08
	.dc.b	$00,$10,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$10,$10,$7c,$10,$10
	.dc.b	$00,$00,$00,$2e,$00,$08,$00,$10
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$30,$30,$00
	.dc.b	$f2,$44,$00,$08,$00,$10,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$78,$44
	.dc.b	$42,$42,$42,$44,$78,$00,$f2,$45
	.dc.b	$00,$08,$00,$10,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$7e,$40,$40,$7c
	.dc.b	$40,$40,$7e,$00,$f2,$43,$00,$08
	.dc.b	$00,$10,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$3c,$42,$40,$40,$40,$42
	.dc.b	$3c,$00,$f2,$48,$00,$08,$00,$10
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$42,$42,$42,$7e,$42,$42,$42,$00
	.dc.b	$f2,$58,$00,$08,$00,$10,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$42,$42
	.dc.b	$24,$18,$24,$42,$42,$00,$f2,$30
	.dc.b	$00,$08,$00,$10,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$3c,$42,$42,$42
	.dc.b	$42,$42,$3c,$00,$f2,$31,$00,$08
	.dc.b	$00,$10,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$08,$08,$08,$08,$08,$08
	.dc.b	$08,$00,$f2,$32,$00,$08,$00,$10
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$3c,$02,$02,$7c,$40,$40,$7c,$00
	.dc.b	$f2,$33,$00,$08,$00,$10,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$3c,$02
	.dc.b	$02,$3e,$02,$02,$3c,$00,$f2,$34
	.dc.b	$00,$08,$00,$10,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$40,$44,$44,$7e
	.dc.b	$04,$04,$04,$00,$f2,$35,$00,$08
	.dc.b	$00,$10,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$7c,$40,$40,$7c,$02,$02
	.dc.b	$7c,$00,$f2,$36,$00,$08,$00,$10
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$3c,$40,$40,$7c,$42,$42,$3c,$00
	.dc.b	$f2,$37,$00,$08,$00,$10,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$3c,$42
	.dc.b	$42,$02,$02,$02,$02,$00,$f2,$38
	.dc.b	$00,$08,$00,$10,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$3c,$42,$42,$3c
	.dc.b	$42,$42,$3c,$00,$f2,$39,$00,$08
	.dc.b	$00,$10,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$3c,$42,$42,$3e,$02,$02
	.dc.b	$3c,$00,$00,$00,$b2,$3c,$00,$02
	.dc.b	$67,$28,$13,$c1,$00,$00,$0b,$c1
	.dc.b	$4a,$01,$67,$32,$b2,$3c,$00,$01
	.dc.b	$67,$64,$b2,$3c,$ff,$ff,$66,$12
	.dc.b	$61,$24,$61,$00,$1f,$1a,$13,$fc
	.dc.b	$00,$00,$00,$00,$0b,$c2,$61,$00
	.dc.b	$5e,$d4
Lff449c:
	clr.l	d0
	move.b	($00000bc2).l,d0
	subq.b	#1,d0
	cmp.b	#$02,d0
	bcs.s	Lff44ae
	clr.l	d0
Lff44ae:
	rts

Lff44b0:
	move.b	#$01,($00000bc4).l
	bsr.s	Lff44c2
	clr.b	($00000bc4).l
	bra.s	Lff449c

Lff44c2:
	cmpi.b	#$02,($00000bc2).l
	bne.s	Lff44ae
	move.b	#$01,($000009dd).l
	move.b	#$01,($00000bc2).l
	bsr.w	Lff4de2
	bsr.w	Lff4a6a
	bra.w	Lffa33e

Lff44e8:
	cmpi.b	#$02,($00000bc2).l
	beq.s	Lff4542
	move.b	#$01,($00000bc4).l
	move.b	#$01,($000009dd).l
	move.b	#$02,($00000bc2).l
	movem.l	d1-d2,-(a7)
	move.w	#$036a,d1
	cmp.w	d1,d2
	bcs.s	Lff4518
	move.w	d1,d2
Lff4518:
	move.w	d2,($00000bb2).l
	move.w	#$028e,d1
	swap.w	d2
	cmp.w	d1,d2
	bcs.s	Lff452a
	move.w	d1,d2
Lff452a:
	move.w	d2,($00000bb0).l
	movem.l	(a7)+,d1-d2
	bsr.w	Lff4ac8
	bsr.w	Lffa33e
	clr.b	($00000bc4).l
Lff4542:
	bra.w	Lff449c

Lff4546:
	cmpi.b	#$02,($000009dd).l
	beq.s	Lff45a6
	tst.b	($00000bc4).l
	bne.s	Lff45a6
	tst.w	($00000ade).l
	bne.s	Lff45a6
	move.b	#$01,($00000bc4).l
	move.b	#$01,($000009dd).l
	move.b	(a1),d0
	move.w	($00e8002a),-(a7)
	bclr.b	#$00,($00e8002a)
	bsr.s	Lff45a8
	clr.b	($00000bc4).l
	move.w	(a7)+,($00e8002a)
	tst.b	($00000bc3).l
	beq.s	Lff45a6
	btst.b	#$00,(a1)
	bne.s	Lff45a2
	clr.b	($00000bc3).l
Lff45a2:
	andi.b	#$fe,(a1)
Lff45a6:
	rts

Lff45a8:
	move.b	($00000bbe).l,d1
	move.b	d0,($00000bbe).l
	btst.l	#$01,d0
	bne.w	Lff49b4
Lff45bc:
	btst.b	#$00,($00000bbf).l
	beq.s	Lff45de
	btst.l	#$00,d0
	bne.w	Lff48da
	btst.l	#$00,d1
	beq.s	Lff45de
	move.w	($00000bb8).l,d0
	bsr.w	Lff47a2
Lff45de:
	rts

Lff45e0:
	tst.b	($00000bc4).l
	bne.s	Lff4642
	tst.w	($00000ade).l
	bne.s	Lff4642
	cmpi.b	#$02,($00000bc2).l
	bne.s	Lff4642
	move.b	#$01,($00000bc4).l
	bsr.w	Lffa39e
	move.w	d0,-(a7)
	bsr.w	Lffa36e
	move.b	#$01,($000009dd).l
	move.b	#$01,($00000bc2).l
	move.w	($00e8002a),-(a7)
	bclr.b	#$00,($00e8002a)
	bsr.w	Lff4a66
	move.w	(a7)+,($00e8002a)
	clr.b	($00000bc4).l
	move.w	(a7)+,d0
	beq.s	Lff4642
	bsr.w	Lffa33e
Lff4642:
	rts

Lff4644:
	tst.b	($00000bc4).l
	bne.s	Lff4642
	tst.b	($00000bc3).l
	beq.s	Lff466a
	move.b	#$01,($00000bc4).l
	bsr.s	Lff467c
	bsr.s	Lff46ac
	bsr.s	Lff467c
	clr.b	($00000bc4).l
	rts

Lff466a:
	move.b	#$01,($00000bc4).l
	bsr.s	Lff46ac
	clr.b	($00000bc4).l
	rts

Lff467c:
	movem.l	d0/a0,-(a7)
	move.w	($00000bb8).l,d0
	tst.b	d0
	beq.s	Lff46a6
	cmp.w	#$0070,d0		;'p'
	bcc.s	Lff46a6
	cmp.w	#$0061,d0		;'a'
	bcc.s	Lff469c
	cmp.w	#$005a,d0		;'Z'
	bcc.s	Lff46a6
Lff469c:
	movea.l	($00000bba).l,a0
	bsr.w	Lff4892
Lff46a6:
	movem.l	(a7)+,d0/a0
	rts

Lff46ac:
	movem.l	d0-d2/a0,-(a7)
	move.w	d1,d2
	move.w	($00e8002a),-(a7)
	bclr.b	#$00,($00e8002a)
	move.w	d0,-(a7)
	bsr.w	Lffa39e
	move.w	d0,-(a7)
	bsr.w	Lffa36e
	move.w	($0002,a7),d0
	bsr.s	Lff46e8
	move.w	(a7)+,d0
	beq.s	Lff46da
	bsr.w	Lffa33e
Lff46da:
	addq.l	#2,a7
	move.w	(a7)+,($00e8002a)
	movem.l	(a7)+,d0-d2/a0
	rts

Lff46e8:
	btst.b	#$00,($00000bbf).l
	beq.w	Lff477a
	cmp.b	#$f0,d0
	bcc.s	Lff472c
	tst.b	d0
	bmi.s	Lff477a
	cmp.w	#$005a,d0		;'Z'
	bcs.s	Lff477a
	beq.s	Lff477c
	cmp.w	#$005b,d0		;'['
	beq.w	Lff478c
	cmp.w	#$0061,d0		;'a'
	bcs.s	Lff4760
	cmp.w	#$0070,d0		;'p'
	bcs.s	Lff477a
	move.w	d0,-(a7)
	move.b	d0,d1
	and.w	#$0007,d1
	move.w	d2,d0
	btst.l	d1,d0
	beq.s	Lff473c
	clr.w	(a7)
	bra.s	Lff473c

Lff472c:
	move.w	d0,-(a7)
	move.b	d0,d1
	and.w	#$0007,d1
	move.w	d2,d0
	btst.l	d1,d0
	bne.s	Lff473c
	clr.w	(a7)
Lff473c:
	move.w	(a7)+,d0
	beq.s	Lff477a
	and.w	#$007f,d0
	cmp.w	#$0070,d0		;'p'
	bne.s	Lff4760
	lea.l	(Lff5410),a0
	bsr.w	Lff4892
	lea.l	(Lff541a),a0
	bsr.w	Lff4892
	bra.s	Lff4776

Lff4760:
	lea.l	(Lff53c8),a0
Lff4766:
	move.w	(a0)+,d1
	bmi.s	Lff477a
	cmp.b	d0,d1
	beq.s	Lff4772
	addq.l	#8,a0
	bra.s	Lff4766

Lff4772:
	bsr.w	Lff4892
Lff4776:
	bsr.w	Lff4c34
Lff477a:
	rts

Lff477c:
	btst.l	#$09,d2
	beq.s	Lff4760
	move.l	a0,-(a7)
	lea.l	(Lff53d4),a0
	bra.s	Lff479a

Lff478c:
	btst.l	#$08,d2
	beq.s	Lff4760
	move.l	a0,-(a7)
	lea.l	(Lff53ca),a0
Lff479a:
	bsr.w	Lff4892
	movea.l	(a7)+,a0
	bra.s	Lff4760

Lff47a2:
	clr.b	($00000bc3).l
	move.w	#$ffff,($00000bb8).l
	tst.w	d0
	bmi.w	Lff4890
	cmp.w	#$0700,d0
	beq.w	Lff4a10
	cmp.w	#$0740,d0
	beq.w	Lff4890
	and.w	#$007f,d0
	beq.w	Lff4890
	cmp.w	#$0070,d0		;'p'
	bcc.w	Lff4890
	movea.l	($00000bba).l,a0
	or.w	#$0080,d0
	cmp.b	#$da,d0
	bcs.w	Lff4888
	cmp.b	#$e1,d0
	bcc.w	Lff4888
	bra.w	Lff488a

Lff47f4:
	move.b	#$01,($00000bc3).l
	tst.w	d0
	bmi.w	Lff4890
	cmp.w	#$0700,d0
	beq.w	Lff49fa
	cmp.w	#$0740,d0
	beq.w	Lff44c2
	and.w	#$007f,d0
	beq.s	Lff4890
	cmp.w	#$005a,d0		;'Z'
	bcs.s	Lff4888
	beq.w	Lff48ae
	cmp.w	#$005b,d0		;'['
	beq.w	Lff48c2
	cmp.w	#$0061,d0		;'a'
	bcs.s	Lff486c
	cmp.w	#$0070,d0		;'p'
	bcs.s	Lff4888
	move.w	d0,-(a7)
	move.b	d0,d1
	and.w	#$0007,d1
	move.w	($00000810).l,d0
	btst.l	d1,d0
	beq.s	Lff484c
	ori.w	#$0080,(a7)
Lff484c:
	move.w	(a7)+,d0
	move.w	d0,d1
	and.w	#$007f,d1
	cmp.w	#$0070,d1		;'p'
	bne.s	Lff486c
	lea.l	(Lff5410),a0
	bsr.s	Lff4892
	lea.l	(Lff541a),a0
	bsr.s	Lff4892
	bra.s	Lff486e

Lff486c:
	bsr.s	Lff4892
Lff486e:
	bsr.s	Lff488a
	bsr.w	Lffa39e
	move.w	d0,-(a7)
	bsr.w	Lffa36e
	bsr.w	Lff4c34
	move.w	(a7)+,d0
	beq.s	Lff4886
	bsr.w	Lffa33e
Lff4886:
	rts

Lff4888:
	bsr.s	Lff4892
Lff488a:
	move.w	d0,d1
	bsr.w	Lff64ba
Lff4890:
	rts

Lff4892:
	move.w	d0,-(a7)
	bsr.w	Lffa39e
	move.w	d0,-(a7)
	bsr.w	Lffa36e
	bsr.w	Lff4c02
	move.w	(a7)+,d0
	beq.s	Lff48aa
	bsr.w	Lffa33e
Lff48aa:
	move.w	(a7)+,d0
	rts

Lff48ae:
	btst.b	#$01,($00000810).l
	beq.s	Lff486c
	move.l	a0,-(a7)
	lea.l	(Lff53d4),a0
	bra.s	Lff48d4

Lff48c2:
	btst.b	#$00,($00000810).l
	beq.s	Lff486c
	move.l	a0,-(a7)
	lea.l	(Lff53ca),a0
Lff48d4:
	bsr.s	Lff4892
	movea.l	(a7)+,a0
	bra.s	Lff486c

Lff48da:
	btst.l	#$00,d1
	bne.s	Lff492e
	movem.l	d1-d4,-(a7)
	move.w	($00000ace).l,d1
	move.w	($00000ad0).l,d2
	sub.w	($00000bb0).l,d1
	sub.w	($00000bb2).l,d2
	cmp.w	#$0096,d2
	bcc.s	Lff4926
	cmp.w	#$0172,d1
	bcc.s	Lff4926
	bsr.w	Lff4e88
	move.l	a0,($00000bba).l
	move.w	d0,($00000bb8).l
	bmi.s	Lff4926
	bsr.w	Lff47f4
	move.b	#$14,($00000bc0).l
Lff4926:
	movem.l	(a7)+,d1-d4
	bra.w	Lff45de

Lff492e:
	cmpi.w	#$0700,($00000bb8).l
	beq.w	Lff45de
	movem.l	d1-d4,-(a7)
	move.w	($00000ace).l,d1
	move.w	($00000ad0).l,d2
	sub.w	($00000bb0).l,d1
	sub.w	($00000bb2).l,d2
	cmp.w	#$0096,d2
	bcc.s	Lff4926
	cmp.w	#$0172,d1
	bcc.s	Lff4926
	bsr.w	Lff4e88
	bmi.s	Lff4926
	subq.b	#1,($00000bc0).l
	bne.s	Lff4926
	move.b	#$02,($00000bc0).l
	cmp.w	($00000bb8).l,d0
	bne.s	Lff4926
	tst.w	d0
	beq.s	Lff49ac
	movea.l	($00000bba).l,a0
	cmp.b	#$5a,d0			;'Z'
	bcs.s	Lff49a2
	cmp.b	#$61,d0			;'a'
	bcs.s	Lff49ac
	cmp.b	#$70,d0			;'p'
	bcs.s	Lff49a2
	cmp.b	#$74,d0			;'t'
	bcs.s	Lff4926
Lff49a2:
	bsr.w	Lff4892
	movea.l	($00000bba).l,a0
Lff49ac:
	bsr.w	Lff47f4
	bra.w	Lff4926

Lff49b4:
	tst.b	($00000bc1).l
	bpl.w	Lff45bc
	btst.l	#$01,d1
	bne.w	Lff45de
	move.b	($00000bc2).l,d0
	addq.b	#1,d0
	and.w	#$0003,d0
	move.b	d0,($00000bc2).l
	asl.w	#2,d0
	lea.l	(Lff49ea),a0
	movea.l	(a0,d0.w),a0
	jsr	(a0)
	bra.w	Lff45de

Lff49ea:
	.dc.b	$00,$ff,$a3,$6e,$00,$ff,$a3,$3e
	.dc.b	$00,$ff,$4a,$62,$00,$ff,$4a,$66
Lff49fa:
	move.w	($00000ace).l,($00000bb4).l
	move.w	($00000ad0).l,($00000bb6).l
	rts

Lff4a10:
	bsr.w	Lff4de2
	clr.w	d1
	move.w	($00000ace).l,d0
	sub.w	($00000bb4).l,d0
	add.w	($00000bb0).l,d0
	bmi.s	Lff4a32
	move.w	#$028e,d1
	cmp.w	d1,d0
	bcs.s	Lff4a34
Lff4a32:
	move.w	d1,d0
Lff4a34:
	move.w	d0,($00000bb0).l
	clr.w	d1
	move.w	($00000ad0).l,d0
	sub.w	($00000bb6).l,d0
	add.w	($00000bb2).l,d0
	bmi.s	Lff4a58
	move.w	#$036a,d1
	cmp.w	d1,d0
	bcs.s	Lff4a5a
Lff4a58:
	move.w	d1,d0
Lff4a5a:
	move.w	d0,($00000bb2).l
	bra.s	Lff4ac8

Lff4a62:
	bsr.s	Lff4a9a
	bra.s	Lff4ac8

Lff4a66:
	bsr.w	Lff4de2
Lff4a6a:
	movem.l	d0-d3,-(a7)
	move.w	($00000810).l,d2
	moveq.l	#$03,d3
Lff4a76:
	btst.l	d3,d2
	beq.s	Lff4a84
	move.w	#$00f0,d1
	add.w	d3,d1
	bsr.w	Lff64ba
Lff4a84:
	dbra.w	d3,Lff4a76
	movem.l	(a7)+,d0-d3
Lff4a8c:
	tst.b	($00000bc6).l
	beq.s	Lff4a98
	bsr.w	Lff3f44
Lff4a98:
	rts

Lff4a9a:
	move.w	($00000ace).l,d0
	move.w	#$028e,d1
	cmp.w	d1,d0
	bcs.s	Lff4aaa
	move.w	d1,d0
Lff4aaa:
	move.w	d0,($00000bb0).l
	move.w	($00000ad0).l,d0
	move.w	#$036a,d1
	cmp.w	d1,d0
	bcs.s	Lff4ac0
	move.w	d1,d0
Lff4ac0:
	move.w	d0,($00000bb2).l
	rts

Lff4ac8:
	tst.b	($00000bc6).l
	beq.s	Lff4ad4
	bsr.w	Lff3f58
Lff4ad4:
	bset.b	#$00,($00000bbf).l
	bsr.w	Lffa39e
	move.w	d0,-(a7)
	bsr.w	Lffa36e
	move.l	#$00e40000,($0000094c).l
	move.w	#$ffff,-(a7)
	move.w	#$0096,-(a7)
	move.w	#$0172,-(a7)
	move.w	($00000bb2).l,-(a7)
	move.w	($00000bb0).l,-(a7)
	bsr.w	Lff61ee
	lea.l	($000a,a7),a7
	move.l	#$00e60000,($0000094c).l
	clr.w	-(a7)
	move.w	#$0096,-(a7)
	move.w	#$0172,-(a7)
	move.w	($00000bb2).l,-(a7)
	move.w	($00000bb0).l,-(a7)
	bsr.w	Lff61ee
	lea.l	($000a,a7),a7
	move.w	#$0096,-(a7)
	move.w	#$0172,-(a7)
	move.w	($00000bb2).l,-(a7)
	move.w	($00000bb0).l,-(a7)
	bsr.w	Lff6028
	lea.l	($0008,a7),a7
	movem.l	d1-d2/a1,-(a7)
	lea.l	(Lff4fae),a0
	lea.l	(-$0008,a7),a7
Lff4b62:
	move.w	(a0)+,d0
	bmi.s	Lff4bc8
	bsr.w	Lff4c92
	move.w	(a0)+,d0
	add.w	($00000bb0).l,d0
	move.w	d0,(a7)
	move.w	(a0)+,d0
	add.w	($00000bb2).l,d0
	move.w	d0,($0002,a7)
	move.w	(a0)+,($0004,a7)
	move.w	(a0)+,($0006,a7)
	bsr.w	Lff6028
	move.w	(-$000a,a0),d0
	cmp.b	#$5a,d0			;'Z'
	bcs.s	Lff4b62
	cmp.b	#$61,d0			;'a'
	bcs.s	Lff4bae
	cmp.b	#$70,d0			;'p'
	bcs.s	Lff4b62
	cmp.b	#$74,d0			;'t'
	bcc.s	Lff4b62
	sub.b	#$70,d0			;'p'
	bra.s	Lff4bb2

Lff4bae:
	sub.b	#$52,d0			;'R'
Lff4bb2:
	move.w	d0,d1
	move.w	($00000810).l,d0
	btst.l	d1,d0
	beq.s	Lff4b62
	movea.l	a0,a1
	subq.l	#8,a0
	bsr.s	Lff4c02
	movea.l	a1,a0
	bra.s	Lff4b62

Lff4bc8:
	addq.l	#8,a7
	tst.b	($00000bc6).l
	beq.s	Lff4bf4
	move.w	($00000bb0).l,d0
	move.w	($00000bb2).l,d1
	addq.w	#2,d1
	add.w	#$00b8,d0
	move.w	d0,($00000bfc).l
	move.w	d1,($00000bfe).l
	bsr.w	Lff3da4
Lff4bf4:
	movem.l	(a7)+,d1-d2/a1
Lff4bf8:
	move.w	(a7)+,d0
	beq.s	Lff4c00
	bsr.w	Lffa33e
Lff4c00:
	rts

Lff4c02:
	move.w	($0006,a0),d0
	subq.w	#2,d0
	move.w	d0,-(a7)
	move.w	($0004,a0),d0
	subq.w	#2,d0
	move.w	d0,-(a7)
	move.w	($0002,a0),d0
	add.w	($00000bb2).l,d0
	addq.w	#1,d0
	move.w	d0,-(a7)
	move.w	(a0),d0
	add.w	($00000bb0).l,d0
	addq.w	#1,d0
	move.w	d0,-(a7)
	bsr.w	Lff6086
	addq.l	#8,a7
	rts

Lff4c34:
	movem.l	d0-d2/a0-a1,-(a7)
	lea.l	(Lff4fae),a0
Lff4c3e:
	move.w	(a0)+,d0
	bmi.s	Lff4c4a
	bsr.w	Lff4d14
	addq.l	#8,a0
	bra.s	Lff4c3e

Lff4c4a:
	movem.l	(a7)+,d0-d2/a0-a1
	rts

Lff4c50:
	tst.b	($00000bc4).l
	bne.s	Lff4c50
	move.b	#$01,($00000bc4).l
	movem.l	d0-d2/a0-a1,-(a7)
	bsr.w	Lffa39e
	move.w	d0,-(a7)
	bsr.w	Lffa36e
	lea.l	(Lff4fae),a0
Lff4c74:
	move.w	(a0)+,d0
	bmi.s	Lff4c7e
	bsr.s	Lff4c9a
	addq.l	#8,a0
	bra.s	Lff4c74

Lff4c7e:
	clr.b	($00000bc4).l
	move.w	(a7)+,d0
	beq.s	Lff4c8c
	bsr.w	Lffa33e
Lff4c8c:
	movem.l	(a7)+,d0-d2/a0-a1
	rts

Lff4c92:
	cmp.w	#$1000,d0
	bcs.s	Lff4d14
	bsr.s	Lff4cbe
Lff4c9a:
	cmp.w	#$1000,d0
	bcs.s	Lff4d12
	movem.l	d0-d2/a0-a1,-(a7)
	and.w	#$ff00,d0
	lea.l	(Lff5ae4),a1
	tst.b	($00000bc6).l
	bne.s	Lff4ccc
	lea.l	(Lff5964),a1
	bra.s	Lff4ccc

Lff4cbe:
	movem.l	d0-d2/a0-a1,-(a7)
	and.w	#$ff00,d0
	lea.l	(Lff544c),a1
Lff4ccc:
	move.w	(a1)+,d1
	bmi.s	Lff4d0e
	move.w	(a1)+,d2
	cmp.w	d0,d1
	bne.s	Lff4d08
	move.l	($00000944).l,-(a7)
	move.l	#$00e60000,($00000944).l
	move.w	(a0),d1
	add.w	($00000bb0).l,d1
	addq.w	#1,d1
	move.w	($0002,a0),d2
	add.w	($00000bb2).l,d2
	addq.w	#1,d2
	bsr.w	Lff718c
	move.l	(a7)+,($00000944).l
	bra.s	Lff4d0e

Lff4d08:
	lea.l	(a1,d2.w),a1
	bra.s	Lff4ccc

Lff4d0e:
	movem.l	(a7)+,d0-d2/a0-a1
Lff4d12:
	rts

Lff4d14:
	and.w	#$007f,d0
	movem.l	d2/a0,-(a7)
	bsr.w	Lff4eb6
	movem.l	(a7)+,d2/a0
	and.l	#$000000ff,d1
	beq.w	Lff4de0
	cmp.b	#$b0,d1
	beq.s	Lff4d42
	btst.b	#$05,($00000810).l
	beq.s	Lff4d42
	or.w	#$8000,d1
Lff4d42:
	or.l	#$00060000,d1
	lea.l	($00000c36).l,a1
	movem.l	a0,-(a7)
	bsr.w	Lff7094
	movem.l	(a7)+,a0
	move.w	(a0),d1
	add.w	($00000bb0).l,d1
	move.w	($0004,a0),d0
	subq.w	#6,d0
	lsr.w	#1,d0
	add.w	d0,d1
	move.w	($0002,a0),d2
	add.w	($00000bb2).l,d2
	move.w	($0006,a0),d0
	sub.w	#$000c,d0
	lsr.w	#1,d0
	add.w	d0,d2
	lea.l	($00000c36).l,a1
	movem.l	d3-d7/a2,-(a7)
	and.l	#$0000ffff,d2
	asl.l	#7,d2
	clr.l	d0
	move.w	d1,d0
	lsr.w	#3,d0
	add.l	d0,d2
	add.l	#$00e60000,d2
	movea.l	d2,a2
	move.w	#$fc00,d2
	and.w	#$0007,d1
	ror.w	d1,d2
	move.w	d2,d3
	not.w	d3
	move.w	(a1)+,d4
	move.w	(a1)+,d4
	subq.w	#1,d4
	move.l	#$00000080,d5
Lff4dbe:
	move.b	(a2)+,d6
	rol.w	#8,d6
	move.b	(a2),d6
	clr.w	d7
	move.b	(a1)+,d7
	rol.w	#8,d7
	ror.w	d1,d7
	and.w	d3,d6
	or.w	d7,d6
	move.b	d6,(a2)
	ror.w	#8,d6
	move.b	d6,-(a2)
	adda.l	d5,a2
	dbra.w	d4,Lff4dbe
	movem.l	(a7)+,d3-d7/a2
Lff4de0:
	rts

Lff4de2:
	clr.b	($00000bc3).l
	move.w	#$ffff,($00000bb8).l
	bclr.b	#$00,($00000bbf).l
	tst.b	($00000bc6).l
	beq.s	Lff4e10
	bsr.w	Lff3fda
	move.w	d0,($00000bfc).l
	move.w	d1,($00000bfe).l
Lff4e10:
	bsr.w	Lffa39e
	move.w	d0,-(a7)
	bsr.w	Lffa36e
	move.l	#$00e40000,($0000094c).l
	clr.w	-(a7)
	move.w	#$0096,-(a7)
	move.w	#$0172,-(a7)
	move.w	($00000bb2).l,-(a7)
	move.w	($00000bb0).l,-(a7)
	bsr.w	Lff61ee
	lea.l	($000a,a7),a7
	move.l	#$00e60000,($0000094c).l
	clr.w	-(a7)
	move.w	#$0096,-(a7)
	move.w	#$0172,-(a7)
	move.w	($00000bb2).l,-(a7)
	move.w	($00000bb0).l,-(a7)
	bsr.w	Lff61ee
	lea.l	($000a,a7),a7
	bra.w	Lff4bf8

Lff4e6e:
	moveq.l	#$ff,d0
	sub.w	($00000bb0).l,d1
	sub.w	($00000bb2).l,d2
	cmp.w	#$0096,d2
	bcc.s	Lff4eb2
	cmp.w	#$0172,d1
	bcc.s	Lff4eb2
Lff4e88:
	lea.l	(Lff4fae),a0
Lff4e8e:
	move.w	(a0)+,d0
	bmi.s	Lff4eb2
	move.w	(a0)+,d3
	move.w	(a0)+,d4
	cmp.w	d3,d1
	bcs.s	Lff4eac
	cmp.w	d4,d2
	bcs.s	Lff4eac
	add.w	(a0),d3
	add.w	($0002,a0),d4
	cmp.w	d3,d1
	bcc.s	Lff4eac
	cmp.w	d4,d2
	bcs.s	Lff4eb0
Lff4eac:
	addq.l	#4,a0
	bra.s	Lff4e8e

Lff4eb0:
	subq.l	#4,a0
Lff4eb2:
	tst.w	d0
	rts

Lff4eb6:
	and.w	#$00ff,d0
	clr.w	d1
	cmp.b	#$35,d0			;'5'
	bcs.s	Lff4eca
	cmp.b	#$80,d0
	bcs.s	Lff4f1e
	rts

Lff4eca:
	move.b	($00000811).l,d2
	btst.l	#$01,d2
	bne.w	Lff4f8c
	btst.l	#$06,d2
	bne.s	Lff4f1e
	btst.l	#$02,d2
	bne.s	Lff4ef8
	btst.l	#$03,d2
	bne.w	Lff4faa
	btst.l	#$04,d2
	bne.s	Lff4f3c
	btst.l	#$05,d2
	bne.s	Lff4f2a
Lff4ef8:
	bsr.s	Lff4f2a
	btst.l	#$07,d2
	bne.s	Lff4f1c
	cmp.b	#$41,d1			;'A'
	bcs.s	Lff4f1c
	cmp.b	#$5b,d1			;'['
	bcs.s	Lff4f18
	cmp.b	#$61,d1			;'a'
	bcs.s	Lff4f1c
	cmp.b	#$7b,d1			;'{'
	bcc.s	Lff4f1c
Lff4f18:
	eori.b	#$20,d1
Lff4f1c:
	rts

Lff4f1e:
	lea.l	(Lff5c64),a0
	move.b	(a0,d0.w),d1
	rts

Lff4f2a:
	btst.l	#$00,d2
	beq.s	Lff4f1e
Lff4f30:
	lea.l	(Lff5ce4),a0
	move.b	(a0,d0.w),d1
	rts

Lff4f3c:
	tst.b	($00ed002b)
	bne.s	Lff4f60
	lea.l	(Lff5d19),a0
	move.b	(a0,d0.w),d1
	btst.l	#$00,d2
	beq.s	Lff4f82
	lea.l	(Lff5d4e),a0
	move.w	#$000f,d2
	bra.s	Lff4f7a

Lff4f60:
	lea.l	(Lff5d5e),a0
	move.b	(a0,d0.w),d1
	btst.l	#$00,d2
	beq.s	Lff4f82
	lea.l	(Lff5d93),a0
	move.w	#$0010,d2
Lff4f7a:
	cmp.b	(a0)+,d1
	beq.s	Lff4f84
	dbra.w	d2,Lff4f7a
Lff4f82:
	rts

Lff4f84:
	add.b	#$a0,d2
	move.b	d2,d1
	rts

Lff4f8c:
	bsr.s	Lff4f30
	tst.b	d1
	beq.s	Lff4fa2
	cmp.b	#$41,d1			;'A'
	bcs.s	Lff4fa4
	cmp.b	#$7f,d1
	bcc.s	Lff4fa4
	and.w	#$00df,d1
Lff4fa2:
	rts

Lff4fa4:
	move.w	#$0020,d1		;' '
	rts

Lff4faa:
	clr.b	d1
	rts

Lff4fae:
	.dc.b	$07,$40,$00,$1e,$00,$03,$00,$0e
	.dc.b	$00,$0e,$3f,$6d,$01,$4c,$00,$15
	.dc.b	$00,$1d,$00,$0e,$07,$00,$00,$00
	.dc.b	$00,$00,$01,$72,$00,$14,$00,$00
	.dc.b	$00,$b7,$00,$01,$00,$ba,$00,$12
	.dc.b	$10,$61,$00,$0a,$00,$24,$00,$0e
	.dc.b	$00,$0e,$11,$62,$00,$1e,$00,$24
	.dc.b	$00,$0e,$00,$0e,$12,$63,$00,$34
	.dc.b	$00,$2a,$00,$11,$00,$08,$13,$64
	.dc.b	$00,$46,$00,$2a,$00,$11,$00,$08
	.dc.b	$14,$65,$00,$58,$00,$2a,$00,$11
	.dc.b	$00,$08,$15,$66,$00,$6a,$00,$2a
	.dc.b	$00,$11,$00,$08,$16,$67,$00,$7c
	.dc.b	$00,$2a,$00,$11,$00,$08,$17,$68
	.dc.b	$00,$98,$00,$2a,$00,$11,$00,$08
	.dc.b	$18,$69,$00,$aa,$00,$2a,$00,$11
	.dc.b	$00,$08,$19,$6a,$00,$bc,$00,$2a
	.dc.b	$00,$11,$00,$08,$1a,$6b,$00,$ce
	.dc.b	$00,$2a,$00,$11,$00,$08,$1b,$6c
	.dc.b	$00,$e0,$00,$2a,$00,$11,$00,$08
	.dc.b	$20,$52,$01,$3d,$00,$24,$00,$0e
	.dc.b	$00,$0e,$21,$53,$01,$4c,$00,$24
	.dc.b	$00,$0e,$00,$0e,$22,$54,$01,$5b
	.dc.b	$00,$24,$00,$0e,$00,$0e,$23,$01
	.dc.b	$00,$0a,$00,$3d,$00,$0e,$00,$0e
	.dc.b	$00,$02,$00,$19,$00,$3d,$00,$0e
	.dc.b	$00,$0e,$00,$03,$00,$28,$00,$3d
	.dc.b	$00,$0e,$00,$0e,$00,$04,$00,$37
	.dc.b	$00,$3d,$00,$0e,$00,$0e,$00,$05
	.dc.b	$00,$46,$00,$3d,$00,$0e,$00,$0e
	.dc.b	$00,$06,$00,$55,$00,$3d,$00,$0e
	.dc.b	$00,$0e,$00,$07,$00,$64,$00,$3d
	.dc.b	$00,$0e,$00,$0e,$00,$08,$00,$73
	.dc.b	$00,$3d,$00,$0e,$00,$0e,$00,$09
	.dc.b	$00,$82,$00,$3d,$00,$0e,$00,$0e
	.dc.b	$00,$0a,$00,$91,$00,$3d,$00,$0e
	.dc.b	$00,$0e,$00,$0b,$00,$a0,$00,$3d
	.dc.b	$00,$0e,$00,$0e,$00,$0c,$00,$af
	.dc.b	$00,$3d,$00,$0e,$00,$0e,$00,$0d
	.dc.b	$00,$be,$00,$3d,$00,$0e,$00,$0e
	.dc.b	$00,$0e,$00,$cd,$00,$3d,$00,$0e
	.dc.b	$00,$0e,$24,$0f,$00,$dc,$00,$3d
	.dc.b	$00,$16,$00,$0e,$25,$36,$00,$fa
	.dc.b	$00,$3d,$00,$0e,$00,$0e,$27,$37
	.dc.b	$01,$18,$00,$3d,$00,$0e,$00,$0e
	.dc.b	$28,$3f,$01,$2e,$00,$3d,$00,$0e
	.dc.b	$00,$0e,$00,$40,$01,$3d,$00,$3d
	.dc.b	$00,$0e,$00,$0e,$00,$41,$01,$4c
	.dc.b	$00,$3d,$00,$0e,$00,$0e,$00,$42
	.dc.b	$01,$5b,$00,$3d,$00,$0e,$00,$0e
	.dc.b	$29,$10,$00,$0a,$00,$4c,$00,$16
	.dc.b	$00,$0e,$00,$11,$00,$21,$00,$4c
	.dc.b	$00,$0e,$00,$0e,$00,$12,$00,$30
	.dc.b	$00,$4c,$00,$0e,$00,$0e,$00,$13
	.dc.b	$00,$3f,$00,$4c,$00,$0e,$00,$0e
	.dc.b	$00,$14,$00,$4e,$00,$4c,$00,$0e
	.dc.b	$00,$0e,$00,$15,$00,$5d,$00,$4c
	.dc.b	$00,$0e,$00,$0e,$00,$16,$00,$6c
	.dc.b	$00,$4c,$00,$0e,$00,$0e,$00,$17
	.dc.b	$00,$7b,$00,$4c,$00,$0e,$00,$0e
	.dc.b	$00,$18,$00,$8a,$00,$4c,$00,$0e
	.dc.b	$00,$0e,$00,$19,$00,$99,$00,$4c
	.dc.b	$00,$0e,$00,$0e,$00,$1a,$00,$a8
	.dc.b	$00,$4c,$00,$0e,$00,$0e,$00,$1b
	.dc.b	$00,$b7,$00,$4c,$00,$0e,$00,$0e
	.dc.b	$00,$1c,$00,$c6,$00,$4c,$00,$0e
	.dc.b	$00,$0e,$2a,$1d,$00,$d8,$00,$4c
	.dc.b	$00,$1a,$00,$1d,$2b,$38,$00,$fa
	.dc.b	$00,$4c,$00,$0e,$00,$0e,$2c,$39
	.dc.b	$01,$09,$00,$4c,$00,$0e,$00,$0e
	.dc.b	$2d,$3a,$01,$18,$00,$4c,$00,$0e
	.dc.b	$00,$0e,$00,$43,$01,$2e,$00,$4c
	.dc.b	$00,$0e,$00,$0e,$00,$44,$01,$3d
	.dc.b	$00,$4c,$00,$0e,$00,$0e,$00,$45
	.dc.b	$01,$4c,$00,$4c,$00,$0e,$00,$0e
	.dc.b	$00,$46,$01,$5b,$00,$4c,$00,$0e
	.dc.b	$00,$0e,$00,$1e,$00,$24,$00,$5b
	.dc.b	$00,$0e,$00,$0e,$00,$1f,$00,$33
	.dc.b	$00,$5b,$00,$0e,$00,$0e,$00,$20
	.dc.b	$00,$42,$00,$5b,$00,$0e,$00,$0e
	.dc.b	$00,$21,$00,$51,$00,$5b,$00,$0e
	.dc.b	$00,$0e,$00,$22,$00,$60,$00,$5b
	.dc.b	$00,$0e,$00,$0e,$00,$23,$00,$6f
	.dc.b	$00,$5b,$00,$0e,$00,$0e,$00,$24
	.dc.b	$00,$7e,$00,$5b,$00,$0e,$00,$0e
	.dc.b	$00,$25,$00,$8d,$00,$5b,$00,$0e
	.dc.b	$00,$0e,$00,$26,$00,$9c,$00,$5b
	.dc.b	$00,$0e,$00,$0e,$00,$27,$00,$ab
	.dc.b	$00,$5b,$00,$0e,$00,$0e,$00,$28
	.dc.b	$00,$ba,$00,$5b,$00,$0e,$00,$0e
	.dc.b	$00,$29,$00,$c9,$00,$5b,$00,$0e
	.dc.b	$00,$0e,$2f,$3b,$00,$fa,$00,$5b
	.dc.b	$00,$0e,$00,$1d,$30,$3c,$01,$09
	.dc.b	$00,$5b,$00,$0e,$00,$0e,$31,$3d
	.dc.b	$01,$18,$00,$5b,$00,$0e,$00,$1d
	.dc.b	$00,$47,$01,$2e,$00,$5b,$00,$0e
	.dc.b	$00,$0e,$00,$48,$01,$3d,$00,$5b
	.dc.b	$00,$0e,$00,$0e,$00,$49,$01,$4c
	.dc.b	$00,$5b,$00,$0e,$00,$0e,$00,$4a
	.dc.b	$01,$5b,$00,$5b,$00,$0e,$00,$0e
	.dc.b	$00,$2a,$00,$2c,$00,$6a,$00,$0e
	.dc.b	$00,$0e,$00,$2b,$00,$3b,$00,$6a
	.dc.b	$00,$0e,$00,$0e,$00,$2c,$00,$4a
	.dc.b	$00,$6a,$00,$0e,$00,$0e,$00,$2d
	.dc.b	$00,$59,$00,$6a,$00,$0e,$00,$0e
	.dc.b	$00,$2e,$00,$68,$00,$6a,$00,$0e
	.dc.b	$00,$0e,$00,$2f,$00,$77,$00,$6a
	.dc.b	$00,$0e,$00,$0e,$00,$30,$00,$86
	.dc.b	$00,$6a,$00,$0e,$00,$0e,$00,$31
	.dc.b	$00,$95,$00,$6a,$00,$0e,$00,$0e
	.dc.b	$00,$32,$00,$a4,$00,$6a,$00,$0e
	.dc.b	$00,$0e,$00,$33,$00,$b3,$00,$6a
	.dc.b	$00,$0e,$00,$0e,$00,$34,$00,$c2
	.dc.b	$00,$6a,$00,$0e,$00,$0e,$33,$3e
	.dc.b	$01,$09,$00,$6a,$00,$0e,$00,$0e
	.dc.b	$00,$4b,$01,$2e,$00,$6a,$00,$0e
	.dc.b	$00,$0e,$00,$4c,$01,$3d,$00,$6a
	.dc.b	$00,$0e,$00,$0e,$00,$4d,$01,$4c
	.dc.b	$00,$6a,$00,$0e,$00,$0e,$34,$4e
	.dc.b	$01,$5b,$00,$6a,$00,$0e,$00,$1d
	.dc.b	$36,$55,$00,$35,$00,$79,$00,$11
	.dc.b	$00,$0e,$37,$56,$00,$47,$00,$79
	.dc.b	$00,$11,$00,$0e,$00,$35,$00,$59
	.dc.b	$00,$79,$00,$33,$00,$0e,$38,$57
	.dc.b	$00,$8d,$00,$79,$00,$16,$00,$0e
	.dc.b	$39,$58,$00,$a4,$00,$79,$00,$11
	.dc.b	$00,$0e,$3a,$59,$00,$b6,$00,$79
	.dc.b	$00,$11,$00,$0e,$00,$4f,$01,$2e
	.dc.b	$00,$79,$00,$0e,$00,$0e,$3e,$50
	.dc.b	$01,$3d,$00,$79,$00,$0e,$00,$0e
	.dc.b	$00,$51,$01,$4c,$00,$79,$00,$0e
	.dc.b	$00,$0e
Lff53c8:
	.dc.b	$1c,$5a
Lff53ca:
	.dc.b	$00,$fa,$00,$24,$00,$0e,$00,$0e
	.dc.b	$1d,$5b
Lff53d4:
	.dc.b	$01,$09,$00,$24,$00,$0e,$00,$0e
	.dc.b	$1e,$5c,$01,$18,$00,$24,$00,$0e
	.dc.b	$00,$0e,$1f,$5d,$01,$2e,$00,$24
	.dc.b	$00,$0e,$00,$0e,$26,$5e,$01,$09
	.dc.b	$00,$3d,$00,$0e,$00,$0e,$35,$5f
	.dc.b	$00,$26,$00,$79,$00,$0e,$00,$0e
	.dc.b	$3b,$60,$00,$c8,$00,$79,$00,$0e
	.dc.b	$00,$0e,$32,$70
Lff5410:
	.dc.b	$00,$0a,$00,$6a,$00,$21,$00,$0e
	.dc.b	$32,$70
Lff541a:
	.dc.b	$00,$d1,$00,$6a,$00,$21,$00,$0e
	.dc.b	$2e,$71,$00,$0a,$00,$5b,$00,$19
	.dc.b	$00,$0e,$3c,$72,$00,$fa,$00,$79
	.dc.b	$00,$15,$00,$0e,$3d,$73,$01,$11
	.dc.b	$00,$79,$00,$15,$00,$0e,$00,$00
	.dc.b	$00,$00,$00,$00,$01,$71,$00,$95
	.dc.b	$ff,$ff
Lff544c:
	.dc.b	$10,$00,$00,$1c,$00,$0c,$00,$0c
	.dc.b	$00,$00,$00,$00,$00,$00,$72,$40
	.dc.b	$4a,$80,$4b,$00,$73,$00,$4a,$80
	.dc.b	$4a,$40,$72,$20,$00,$00,$00,$00
	.dc.b	$11,$00,$00,$1c,$00,$0c,$00,$0c
	.dc.b	$00,$00,$00,$00,$00,$00,$39,$c0
	.dc.b	$45,$40,$41,$40,$41,$c0,$41,$00
	.dc.b	$45,$00,$39,$00,$00,$00,$00,$00
	.dc.b	$12,$00,$00,$10,$00,$0f,$00,$06
	.dc.b	$00,$00,$1e,$20,$10,$20,$1c,$20
	.dc.b	$10,$20,$10,$20,$13,$00,$00,$10
	.dc.b	$00,$0f,$00,$06,$00,$00,$1e,$30
	.dc.b	$10,$48,$1c,$10,$10,$20,$10,$78
	.dc.b	$14,$00,$00,$10,$00,$0f,$00,$06
	.dc.b	$00,$00,$1e,$70,$10,$08,$1c,$30
	.dc.b	$10,$08,$10,$70,$15,$00,$00,$10
	.dc.b	$00,$0f,$00,$06,$00,$00,$1e,$20
	.dc.b	$10,$40,$1c,$a0,$11,$f0,$10,$20
	.dc.b	$16,$00,$00,$10,$00,$0f,$00,$06
	.dc.b	$00,$00,$1e,$70,$10,$40,$1c,$70
	.dc.b	$10,$08,$10,$70,$17,$00,$00,$10
	.dc.b	$00,$0f,$00,$06,$00,$00,$1e,$30
	.dc.b	$10,$40,$1c,$70,$10,$48,$10,$70
	.dc.b	$18,$00,$00,$10,$00,$0f,$00,$06
	.dc.b	$00,$00,$1e,$78,$10,$08,$1c,$10
	.dc.b	$10,$20,$10,$20,$19,$00,$00,$10
	.dc.b	$00,$0f,$00,$06,$00,$00,$1e,$70
	.dc.b	$10,$88,$1c,$70,$10,$88,$10,$70
	.dc.b	$1a,$00,$00,$10,$00,$0f,$00,$06
	.dc.b	$00,$00,$1e,$70,$10,$88,$1c,$78
	.dc.b	$10,$08,$10,$70,$1b,$00,$00,$10
	.dc.b	$00,$0f,$00,$06,$00,$00,$1e,$98
	.dc.b	$10,$a4,$1c,$a4,$10,$a4,$10,$98
	.dc.b	$1c,$00,$00,$1c,$00,$0c,$00,$0c
	.dc.b	$00,$00,$00,$00,$51,$00,$4b,$a0
	.dc.b	$e5,$10,$51,$40,$52,$40,$51,$c0
	.dc.b	$91,$60,$31,$d0,$00,$00,$00,$00
	.dc.b	$1d,$00,$00,$1c,$00,$0c,$00,$0c
	.dc.b	$00,$00,$00,$00,$00,$00,$f1,$f0
	.dc.b	$90,$10,$90,$10,$96,$10,$90,$a0
	.dc.b	$90,$40,$f0,$20,$00,$00,$00,$00
	.dc.b	$1e,$00,$00,$1c,$00,$0c,$00,$0c
	.dc.b	$00,$00,$00,$00,$00,$30,$70,$b0
	.dc.b	$10,$80,$10,$80,$16,$c0,$10,$a0
	.dc.b	$10,$80,$70,$80,$00,$00,$00,$00
	.dc.b	$1f,$00,$00,$1c,$00,$0c,$00,$0c
	.dc.b	$00,$00,$00,$00,$00,$00,$64,$e0
	.dc.b	$8a,$90,$8a,$90,$8e,$e0,$8a,$80
	.dc.b	$9a,$80,$6a,$80,$00,$00,$00,$00
	.dc.b	$23,$00,$00,$1c,$00,$0c,$00,$0c
	.dc.b	$00,$00,$00,$00,$00,$00,$f6,$60
	.dc.b	$89,$90,$88,$80,$e6,$80,$81,$80
	.dc.b	$89,$90,$f6,$60,$00,$00,$00,$00
	.dc.b	$24,$00,$00,$28,$00,$14,$00,$0c
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$0f,$0e,$00,$08,$91,$00,$08
	.dc.b	$90,$00,$0f,$0e,$00,$08,$81,$00
	.dc.b	$08,$91,$00,$0f,$0e,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$26,$00,$00,$1c
	.dc.b	$00,$0c,$00,$0c,$00,$00,$00,$00
	.dc.b	$00,$00,$52,$60,$52,$90,$5a,$80
	.dc.b	$5a,$60,$56,$10,$56,$90,$52,$60
	.dc.b	$00,$00,$00,$00,$29,$00,$00,$28
	.dc.b	$00,$14,$00,$0c,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$7c,$47,$80
	.dc.b	$10,$a4,$40,$11,$14,$40,$11,$17
	.dc.b	$80,$11,$f4,$40,$11,$14,$40,$11
	.dc.b	$17,$80,$00,$00,$00,$00,$00,$00
	.dc.b	$2a,$00,$00,$56,$00,$18,$00,$1b
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$01,$e0,$00,$01,$20
	.dc.b	$00,$01,$20,$00,$01,$20,$00,$01
	.dc.b	$20,$00,$01,$20,$00,$01,$20,$00
	.dc.b	$01,$20,$00,$41,$20,$00,$c1,$20
	.dc.b	$01,$41,$20,$02,$7f,$20,$04,$00
	.dc.b	$20,$04,$00,$20,$02,$7f,$e0,$01
	.dc.b	$40,$00,$00,$c0,$00,$00,$40,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$2e,$00,$00,$28,$00,$17
	.dc.b	$00,$0c,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$3b,$ef,$20,$44,$88
	.dc.b	$a0,$40,$88,$a0,$40,$8f,$20,$40
	.dc.b	$8a,$20,$44,$89,$20,$38,$88,$bc
	.dc.b	$00,$00,$00,$00,$00,$00,$2f,$00
	.dc.b	$00,$3a,$00,$0c,$00,$1b,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$04,$00,$0c,$00,$17,$c0
	.dc.b	$20,$40,$17,$c0,$0c,$00,$04,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$30,$00,$00,$1c
	.dc.b	$00,$0c,$00,$0c,$00,$00,$00,$00
	.dc.b	$04,$00,$0a,$00,$11,$00,$2b,$80
	.dc.b	$0a,$00,$0a,$00,$0a,$00,$0e,$00
	.dc.b	$00,$00,$00,$00,$31,$00,$00,$3a
	.dc.b	$00,$0c,$00,$1b,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$02,$00,$03,$00,$3e,$80,$20,$40
	.dc.b	$3e,$80,$03,$00,$02,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$32,$00,$00,$34,$00,$1f
	.dc.b	$00,$0c,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$1c,$89
	.dc.b	$3e,$f8,$22,$89,$20,$20,$20,$89
	.dc.b	$20,$20,$1c,$f9,$3c,$20,$02,$89
	.dc.b	$20,$20,$22,$89,$20,$20,$1c,$89
	.dc.b	$20,$20,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$33,$00,$00,$1c,$00,$0c
	.dc.b	$00,$0c,$00,$00,$00,$00,$0e,$00
	.dc.b	$0a,$00,$0a,$00,$0a,$00,$3b,$80
	.dc.b	$11,$00,$0a,$00,$04,$00,$00,$00
	.dc.b	$00,$00,$35,$00,$00,$1c,$00,$0c
	.dc.b	$00,$0c,$00,$00,$00,$00,$00,$00
	.dc.b	$65,$40,$ab,$20,$29,$00,$29,$c0
	.dc.b	$28,$20,$2a,$20,$11,$c0,$00,$00
	.dc.b	$00,$00,$36,$00,$00,$1c,$00,$0f
	.dc.b	$00,$0c,$00,$00,$00,$00,$00,$00
	.dc.b	$45,$e4,$45,$0c,$29,$04,$11,$c4
	.dc.b	$29,$04,$45,$04,$45,$04,$00,$00
	.dc.b	$00,$00,$37,$00,$00,$1c,$00,$0f
	.dc.b	$00,$0c,$00,$00,$00,$00,$00,$00
	.dc.b	$45,$ec,$45,$12,$29,$02,$11,$c4
	.dc.b	$29,$08,$45,$10,$45,$1e,$00,$00
	.dc.b	$00,$00,$38,$00,$00,$28,$00,$14
	.dc.b	$00,$0c,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$45,$f3,$80,$45,$04
	.dc.b	$40,$29,$00,$40,$11,$e1,$80,$29
	.dc.b	$00,$40,$45,$04,$40,$45,$03,$80
	.dc.b	$00,$00,$00,$00,$00,$00,$39,$00
	.dc.b	$00,$1c,$00,$0f,$00,$0c,$00,$00
	.dc.b	$00,$00,$00,$00,$45,$e4,$45,$0c
	.dc.b	$29,$0c,$11,$d4,$29,$14,$45,$3e
	.dc.b	$45,$04,$00,$00,$00,$00,$3a,$00
	.dc.b	$00,$1c,$00,$0f,$00,$0c,$00,$00
	.dc.b	$00,$00,$00,$00,$45,$fe,$45,$10
	.dc.b	$29,$10,$11,$dc,$29,$02,$45,$02
	.dc.b	$45,$1c,$00,$00,$00,$00,$3b,$00
	.dc.b	$00,$1c,$00,$0c,$00,$0c,$00,$00
	.dc.b	$04,$00,$0a,$00,$11,$00,$3f,$80
	.dc.b	$44,$40,$04,$00,$1f,$00,$04,$00
	.dc.b	$04,$00,$3f,$80,$00,$00,$3c,$00
	.dc.b	$00,$28,$00,$13,$00,$0c,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$1c
	.dc.b	$f0,$80,$22,$88,$80,$22,$89,$80
	.dc.b	$22,$f0,$80,$22,$80,$80,$22,$84
	.dc.b	$80,$1c,$84,$80,$00,$00,$00,$00
	.dc.b	$00,$00,$3d,$00,$00,$28,$00,$13
	.dc.b	$00,$0c,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$1c,$f1,$80,$22,$8a
	.dc.b	$40,$22,$88,$40,$22,$f0,$80,$22
	.dc.b	$81,$00,$22,$8a,$00,$1c,$8b,$c0
	.dc.b	$00,$00,$00,$00,$00,$00,$3f,$00
	.dc.b	$00,$34,$00,$1b,$00,$0c,$00,$00
	.dc.b	$00,$00,$1f,$ff,$ff,$80,$20,$00
	.dc.b	$00,$40,$2f,$f8,$00,$40,$28,$09
	.dc.b	$54,$40,$28,$08,$00,$40,$2f,$f9
	.dc.b	$54,$40,$20,$00,$00,$40,$25,$55
	.dc.b	$54,$40,$20,$00,$00,$40,$1f,$ff
	.dc.b	$ff,$80,$00,$00,$00,$00,$ff,$ff
Lff5964:
	.dc.b	$22,$00,$00,$1c,$00,$0c,$00,$0c
	.dc.b	$00,$00,$00,$00,$00,$00,$af,$60
	.dc.b	$a9,$50,$a9,$50,$ed,$60,$a9,$40
	.dc.b	$a9,$40,$af,$c0,$00,$00,$00,$00
	.dc.b	$21,$00,$00,$1c,$00,$0c,$00,$0c
	.dc.b	$00,$00,$1e,$c0,$49,$40,$30,$80
	.dc.b	$3f,$c0,$40,$20,$1f,$80,$10,$80
	.dc.b	$1f,$80,$09,$00,$3f,$c0,$00,$00
	.dc.b	$20,$00,$00,$1c,$00,$0c,$00,$0c
	.dc.b	$00,$00,$5d,$e0,$e5,$20,$05,$e0
	.dc.b	$e4,$00,$1d,$e0,$f0,$80,$10,$e0
	.dc.b	$f0,$20,$b5,$20,$fc,$e0,$00,$00
	.dc.b	$2d,$00,$00,$1c,$00,$0c,$00,$0c
	.dc.b	$00,$00,$00,$00,$00,$00,$4b,$80
	.dc.b	$4a,$40,$4a,$20,$4a,$20,$4a,$20
	.dc.b	$4a,$40,$33,$80,$00,$00,$00,$00
	.dc.b	$2b,$00,$00,$1c,$00,$0c,$00,$0c
	.dc.b	$00,$00,$00,$00,$00,$00,$4b,$c0
	.dc.b	$4a,$20,$4a,$20,$4b,$c0,$4a,$00
	.dc.b	$4a,$00,$32,$00,$00,$00,$00,$00
	.dc.b	$2c,$00,$00,$1c,$00,$0c,$00,$0c
	.dc.b	$00,$00,$00,$00,$00,$00,$72,$a0
	.dc.b	$4a,$a0,$4a,$a0,$4a,$a0,$4a,$a0
	.dc.b	$4a,$a0,$71,$40,$00,$00,$00,$00
	.dc.b	$28,$00,$00,$1c,$00,$0c,$00,$0c
	.dc.b	$00,$00,$00,$00,$00,$00,$39,$00
	.dc.b	$45,$00,$41,$00,$41,$00,$41,$00
	.dc.b	$45,$00,$39,$e0,$00,$00,$00,$00
	.dc.b	$3e,$00,$00,$1c,$00,$0c,$00,$0c
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$06,$00
	.dc.b	$06,$00,$02,$00,$04,$00,$00,$00
	.dc.b	$25,$00,$00,$1c,$00,$0c,$00,$0c
	.dc.b	$00,$00,$00,$00,$00,$00,$4a,$20
	.dc.b	$4b,$60,$4a,$a0,$7a,$a0,$4a,$20
	.dc.b	$4a,$20,$4a,$20,$00,$00,$00,$00
	.dc.b	$27,$00,$00,$1c,$00,$0c,$00,$0c
	.dc.b	$00,$00,$00,$00,$00,$00,$e7,$40
	.dc.b	$94,$40,$94,$40,$97,$40,$94,$40
	.dc.b	$94,$40,$e7,$70,$00,$00,$00,$00
	.dc.b	$34,$00,$00,$3a,$00,$0c,$00,$1b
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$e9,$e0,$8d,$40
	.dc.b	$8d,$40,$eb,$40,$8b,$40,$89,$40
	.dc.b	$e9,$40,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$ff,$ff
Lff5ae4:
	.dc.b	$22,$00,$00,$1c,$00,$0c,$00,$0c
	.dc.b	$00,$00,$00,$00,$00,$00,$79,$10
	.dc.b	$45,$10,$45,$b0,$79,$50,$51,$50
	.dc.b	$49,$10,$45,$10,$00,$00,$00,$00
	.dc.b	$21,$00,$00,$1c,$00,$0c,$00,$0c
	.dc.b	$00,$00,$00,$00,$00,$00,$44,$00
	.dc.b	$44,$40,$6c,$40,$55,$f0,$54,$40
	.dc.b	$44,$40,$44,$00,$00,$00,$00,$00
	.dc.b	$20,$00,$00,$1c,$00,$0c,$00,$0c
	.dc.b	$00,$00,$00,$00,$00,$00,$44,$00
	.dc.b	$44,$00,$6c,$00,$55,$e0,$54,$00
	.dc.b	$44,$00,$44,$00,$00,$00,$00,$00
	.dc.b	$2d,$00,$00,$1c,$00,$0c,$00,$0c
	.dc.b	$00,$00,$00,$00,$00,$00,$39,$e0
	.dc.b	$45,$00,$41,$00,$41,$c0,$41,$00
	.dc.b	$45,$00,$39,$e0,$00,$00,$00,$00
	.dc.b	$2b,$00,$00,$1c,$00,$0c,$00,$0c
	.dc.b	$00,$00,$00,$00,$00,$00,$45,$e0
	.dc.b	$45,$00,$45,$00,$7d,$c0,$45,$00
	.dc.b	$45,$00,$45,$e0,$00,$00,$00,$00
	.dc.b	$2c,$00,$00,$1c,$00,$0c,$00,$0c
	.dc.b	$00,$00,$00,$00,$00,$00,$79,$e0
	.dc.b	$45,$00,$45,$00,$45,$c0,$45,$00
	.dc.b	$45,$00,$79,$e0,$00,$00,$00,$00
	.dc.b	$28,$00,$00,$1c,$00,$0c,$00,$0c
	.dc.b	$00,$00,$00,$00,$0f,$00,$1f,$80
	.dc.b	$39,$c0,$30,$00,$30,$00,$30,$00
	.dc.b	$39,$c0,$1f,$80,$0f,$00,$00,$00
	.dc.b	$3e,$00,$00,$1c,$00,$0c,$00,$0c
	.dc.b	$00,$00,$10,$00,$10,$40,$7c,$80
	.dc.b	$11,$00,$12,$00,$04,$00,$08,$00
	.dc.b	$13,$e0,$20,$00,$00,$00,$00,$00
	.dc.b	$25,$00,$00,$1c,$00,$0c,$00,$0c
	.dc.b	$00,$00,$00,$00,$00,$00,$32,$20
	.dc.b	$4a,$20,$43,$60,$42,$a0,$42,$a0
	.dc.b	$42,$20,$32,$20,$00,$00,$00,$00
	.dc.b	$27,$00,$00,$1c,$00,$0c,$00,$0c
	.dc.b	$00,$00,$00,$00,$00,$00,$02,$00
	.dc.b	$03,$00,$3f,$80,$3f,$c0,$3f,$80
	.dc.b	$03,$00,$02,$00,$00,$00,$00,$00
	.dc.b	$34,$00,$00,$3a,$00,$0c,$00,$1b
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$1f,$80,$10,$80,$10,$80,$10,$80
	.dc.b	$10,$80,$10,$80,$1f,$80,$00,$00
	.dc.b	$00,$00,$00,$00,$06,$00,$0f,$00
	.dc.b	$1f,$80,$06,$00,$06,$00,$06,$00
	.dc.b	$06,$00,$06,$00,$06,$00,$06,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$ff,$ff
Lff5c64:
	.dc.b	$00,$00,$31,$32,$33,$34,$35,$36
	.dc.b	$37,$38,$39,$30,$2d,$5e,$5c,$00
	.dc.b	$00,$51,$57,$45,$52,$54,$59,$55
	.dc.b	$49,$4f,$50,$40,$5b,$00,$41,$53
	.dc.b	$44,$46,$47,$48,$4a,$4b,$4c,$3b
	.dc.b	$3a,$5d,$5a,$58,$43,$56,$42,$4e
	.dc.b	$4d,$2c,$2e,$2f,$20,$20,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$2f,$2a,$2d,$37,$38,$39,$2b,$34
	.dc.b	$35,$36,$3d,$31,$32,$33,$00,$30
	.dc.b	$00,$2e,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
Lff5ce4:
	.dc.b	$00,$00,$21,$22,$23,$24,$25,$26
	.dc.b	$27,$28,$29,$20,$3d,$7e,$7c,$00
	.dc.b	$00,$71,$77,$65,$72,$74,$79,$75
	.dc.b	$69,$6f,$70,$60,$7b,$00,$61,$73
	.dc.b	$64,$66,$67,$68,$6a,$6b,$6c,$2b
	.dc.b	$2a,$7d,$7a,$78,$63,$76,$62,$6e
	.dc.b	$6d,$3c,$3e,$3f,$5f
Lff5d19:
	.dc.b	$00,$00,$c7,$cc,$b1,$b3,$b4,$b5
	.dc.b	$d4,$d5,$d6,$dc,$ce,$cd,$b0,$00
	.dc.b	$00,$c0,$c3,$b2,$bd,$b6,$dd,$c5
	.dc.b	$c6,$d7,$be,$de,$df,$00,$c1,$c4
	.dc.b	$bc,$ca,$b7,$b8,$cf,$c9,$d8,$da
	.dc.b	$b9,$d1,$c2,$bb,$bf,$cb,$ba,$d0
	.dc.b	$d3,$c8,$d9,$d2,$db
Lff5d4e:
	.dc.b	'ﾂﾖﾕﾔｵｴｳｲｱﾜﾒﾈﾑﾟﾙﾛ'
Lff5d5e:
	.dc.b	$00,$00,$b1,$b2,$b3,$b4,$b5,$c5
	.dc.b	$c6,$c7,$c8,$c9,$d7,$d8,$d9,$00
	.dc.b	$00,$b6,$b7,$b8,$b9,$ba,$ca,$cb
	.dc.b	$cc,$cd,$ce,$da,$db,$00,$bb,$bc
	.dc.b	$bd,$be,$bf,$cf,$d0,$d1,$d2,$d3
	.dc.b	$de,$df,$c0,$c1,$c2,$c3,$c4,$d4
	.dc.b	$d5,$d6,$dc,$a6,$dd
Lff5d93:
	.dc.b	'ﾞﾂﾖﾕﾔｵｴｳｲｱﾉﾝﾜﾟﾛｦｻH轜@a',$00,$00
Lff5dab:
	.dc.b	$98,$30,$19,$32,$19,$34,$19,$36
	.dc.b	$11,$61,$00,$00,$c6,$60,$2a,$48
	.dc.b	$e7,$7e,$40,$61,$00,$00,$82,$30
	.dc.b	$19,$32,$19,$34,$19,$36,$11,$61
	.dc.b	$00,$01,$b0,$60,$14,$48,$e7,$7e
	.dc.b	$40,$61,$6c,$30,$19,$32,$19,$38
	.dc.b	$19,$3a,$19,$36,$11,$61,$00,$02
	.dc.b	$6c,$23,$fc,$00,$e6,$00,$00,$00
	.dc.b	$00,$09,$4c,$4c,$df,$02,$7e,$4e
	.dc.b	$75
Lff5df4:
	movem.l	a1,-(a7)
	bsr.s	Lff5e42
	move.w	($0008,a1),-(a7)
	move.w	($0006,a1),-(a7)
	move.w	($0004,a1),-(a7)
	move.w	($0002,a1),-(a7)
	move.w	(a1),-(a7)
	bsr.w	Lff61ee
	lea.l	($000a,a7),a7
Lff5e14:
	move.l	#$00e60000,($0000094c).l
	movem.l	(a7)+,a1
	rts

Lff5e24:
	movem.l	a1,-(a7)
	bsr.s	Lff5e42
	move.w	($0006,a1),-(a7)
	move.w	($0004,a1),-(a7)
	move.w	($0002,a1),-(a7)
	move.w	(a1),-(a7)
	bsr.w	Lff6086
	lea.l	($0008,a7),a7
	bra.s	Lff5e14

Lff5e42:
	move.w	(a1)+,d0
	and.l	#$00000003,d0
	add.w	d0,d0
	or.w	#$00e0,d0
	swap.w	d0
	move.l	d0,($0000094c).l
	rts

Lff5e5a:
	link.w	a6,#$0000
	movem.l	d0-d6/a0,-(a7)
	move.w	($0008,a6),d0
	move.w	($000a,a6),d1
	move.w	($000c,a6),d2
	move.w	($000e,a6),d3
	bsr.s	Lff5e7c
	movem.l	(a7)+,d0-d6/a0
	unlk	a6
	rts

Lff5e7c:
	tst.w	d2
	bls.w	Lff5f58
	cmp.w	($00000956).l,d1
	blt.w	Lff5f58
	cmp.w	($0000095a).l,d1
	bge.w	Lff5f58
	cmp.w	($00000958).l,d0
	bge.w	Lff5f58
	move.w	d0,d4
	add.w	d2,d4
	cmp.w	($00000954).l,d4
	ble.w	Lff5f58
	cmp.w	($00000958).l,d4
	ble.s	Lff5ebe
	move.w	($00000958).l,d2
	sub.w	d0,d2
Lff5ebe:
	cmp.w	($00000954).l,d0
	bge.s	Lff5ed4
	move.w	d0,d4
	add.w	d2,d4
	move.w	($00000954).l,d0
	sub.w	d0,d4
	move.w	d4,d2
Lff5ed4:
	add.w	($00000950).l,d0
	add.w	($00000952).l,d1
	mulu.w	($00000940).l,d1
	movea.l	d1,a0
	move.w	d0,d1
	lsr.w	#3,d1
	lea.l	(a0,d1.w),a0
	adda.l	($0000094c).l,a0
	move.w	d0,d1
	and.w	#$0007,d1
	beq.s	Lff5f22
	move.w	#$0007,d4
	sub.w	d1,d4
	clr.w	d1
Lff5f06:
	bset.l	d4,d1
	subq.w	#1,d2
	beq.s	Lff5f10
	dbra.w	d4,Lff5f06
Lff5f10:
	move.w	d1,d4
	not.w	d4
	move.b	(a0),d5
	and.b	d4,d5
	move.b	d3,d6
	and.b	d1,d6
	or.b	d5,d6
	move.b	d6,(a0)
	addq.l	#1,a0
Lff5f22:
	move.w	d2,d1
	lsr.w	#3,d1
	beq.s	Lff5f36
	move.w	d1,d4
	lsl.w	#3,d4
	sub.w	d4,d2
	subq.w	#1,d1
Lff5f30:
	move.b	d3,(a0)+
	dbra.w	d1,Lff5f30
Lff5f36:
	tst.w	d2
	beq.s	Lff5f58
	clr.w	d1
	subq.w	#1,d2
Lff5f3e:
	lsr.w	#1,d1
	bset.l	#$07,d1
	dbra.w	d2,Lff5f3e
	move.w	d1,d4
	not.w	d4
	move.b	(a0),d5
	and.b	d4,d5
	move.w	d3,d6
	and.b	d1,d6
	or.b	d5,d6
	move.b	d6,(a0)
Lff5f58:
	rts

Lff5f5a:
	link.w	a6,#$0000
	movem.l	d0-d5/a0,-(a7)
	move.w	($0008,a6),d0
	move.w	($000a,a6),d1
	move.w	($000c,a6),d2
	move.w	($000e,a6),d3
	bsr.s	Lff5f7c
	movem.l	(a7)+,d0-d5/a0
	unlk	a6
	rts

Lff5f7c:
	tst.w	d2
	bls.w	Lff6026
	cmp.w	($00000954).l,d0
	blt.w	Lff6026
	cmp.w	($00000958).l,d0
	bge.w	Lff6026
	cmp.w	($0000095a).l,d1
	bge.w	Lff6026
	move.w	d1,d4
	add.w	d2,d4
	cmp.w	($00000956).l,d4
	ble.s	Lff6026
	cmp.w	($0000095a).l,d4
	ble.s	Lff5fbc
	move.w	($0000095a).l,d2
	sub.w	d1,d2
Lff5fbc:
	cmp.w	($00000956).l,d1
	bge.s	Lff5fd2
	move.w	d1,d4
	add.w	d2,d4
	move.w	($00000956).l,d1
	sub.w	d1,d4
	move.w	d4,d2
Lff5fd2:
	add.w	($00000950).l,d0
	add.w	($00000952).l,d1
	mulu.w	($00000940).l,d1
	movea.l	d1,a0
	move.w	d0,d1
	lsr.w	#3,d1
	lea.l	(a0,d1.w),a0
	adda.l	($0000094c).l,a0
	move.b	#$80,d4
	and.w	#$0007,d0
	bra.s	Lff6000

Lff5ffe:
	lsr.b	#1,d4
Lff6000:
	dbra.w	d0,Lff5ffe
	move.b	d4,d5
	not.b	d5
	bra.s	Lff6022

Lff600a:
	move.b	(a0),d0
	and.b	d5,d0
	move.b	d3,d1
	and.b	d4,d1
	or.b	d1,d0
	move.b	d0,(a0)
	ror.b	#1,d3
	move.w	($00000940).l,d0
	lea.l	(a0,d0.w),a0
Lff6022:
	dbra.w	d2,Lff600a
Lff6026:
	rts

Lff6028:
	link.w	a6,#$0000
	movem.l	d0-d6/a0,-(a7)
	move.w	($000e,a6),d5
	move.w	($000c,a6),d4
	move.w	($000a,a6),d1
	move.w	($0008,a6),d0
	move.w	#$ffff,d3
	bsr.s	Lff604e
	movem.l	(a7)+,d0-d6/a0
	unlk	a6
	rts

Lff604e:
	movem.l	d0-d5,-(a7)
	move.w	d4,d2
	bsr.w	Lff5e7c
	movem.l	(a7)+,d0-d5
	movem.l	d0-d5,-(a7)
	move.w	d5,d2
	bsr.w	Lff5f7c
	movem.l	(a7)+,d0-d5
	movem.l	d0-d5,-(a7)
	move.w	d4,d2
	add.w	d5,d1
	subq.w	#1,d1
	bsr.w	Lff5e7c
	movem.l	(a7)+,d0-d5
	move.w	d5,d2
	add.w	d4,d0
	subq.w	#1,d0
	bra.w	Lff5f7c

Lff6086:
	link.w	a6,#-$0008
	movem.l	d0-d6/a0-a1,-(a7)
	move.w	($0008,a6),d2
	move.w	($000a,a6),d3
	move.w	($000c,a6),d4
	move.w	($000e,a6),d5
	tst.w	d4
	beq.w	Lff61e6
	tst.w	d5
	beq.w	Lff61e6
	add.w	d2,d4
	add.w	d3,d5
	cmp.w	($00000958).l,d2
	bge.w	Lff61e6
	cmp.w	($00000954).l,d4
	ble.w	Lff61e6
	cmp.w	($0000095a).l,d3
	bge.w	Lff61e6
	cmp.w	($00000956).l,d5
	ble.w	Lff61e6
	cmp.w	($00000954).l,d2
	bge.s	Lff60e4
	move.w	($00000954).l,d2
Lff60e4:
	cmp.w	($00000958).l,d4
	ble.s	Lff60f2
	move.w	($00000958).l,d4
Lff60f2:
	cmp.w	($00000956).l,d3
	bge.s	Lff6100
	move.w	($00000956).l,d3
Lff6100:
	cmp.w	($0000095a).l,d5
	ble.s	Lff610e
	move.w	($0000095a).l,d5
Lff610e:
	sub.w	d2,d4
	move.w	d4,(-$0004,a6)
	sub.w	d3,d5
	move.w	d5,(-$0002,a6)
	add.w	($00000950).l,d2
	move.w	d2,(-$0008,a6)
	add.w	($00000952).l,d3
	move.w	d3,(-$0006,a6)
	move.w	(-$0002,a6),d6
	movea.l	($0000094c).l,a0
	move.w	(-$0006,a6),d0
	mulu.w	($00000940).l,d0
	lea.l	(a0,d0.l),a0
	move.w	(-$0008,a6),d0
	lsr.w	#3,d0
	lea.l	(a0,d0.w),a0
Lff6150:
	movea.l	a0,a1
	move.w	(-$0008,a6),d4
	move.w	(-$0004,a6),d5
	move.w	d4,d1
	and.w	#$0007,d1
	beq.s	Lff6190
	move.w	#$0007,d0
	sub.w	d1,d0
	add.w	d0,d4
	addq.w	#1,d4
	clr.w	d1
Lff616e:
	bset.l	d0,d1
	subq.w	#1,d5
	beq.s	Lff6178
	dbra.w	d0,Lff616e
Lff6178:
	move.w	d1,d0
	not.w	d0
	move.b	(a1),d2
	move.b	d2,d3
	and.b	d0,d2
	not.b	d3
	and.b	d1,d3
	or.b	d3,d2
	move.b	d2,(a1)
	addq.l	#1,a1
	tst.w	d5
	beq.s	Lff61d4
Lff6190:
	move.w	(-$0008,a6),d0
	add.w	(-$0004,a6),d0
	sub.w	d4,d0
	cmp.w	#$0008,d0
	blt.s	Lff61b0
	move.w	d0,d1
	lsr.w	#3,d1
	subq.w	#1,d1
Lff61a6:
	not.b	(a1)+
	dbra.w	d1,Lff61a6
	and.w	#$0007,d0
Lff61b0:
	tst.w	d0
	beq.s	Lff61d4
	clr.w	d1
	subq.w	#1,d0
Lff61b8:
	lsr.w	#1,d1
	bset.l	#$07,d1
	dbra.w	d0,Lff61b8
	move.w	d1,d0
	not.w	d0
	move.b	(a1),d2
	move.b	d2,d3
	and.b	d0,d2
	not.b	d3
	and.b	d1,d3
	or.b	d3,d2
	move.b	d2,(a1)
Lff61d4:
	subq.w	#1,d6
	beq.s	Lff61e6
	move.w	($00000940).l,d0
	lea.l	(a0,d0.w),a0
	bra.w	Lff6150

Lff61e6:
	movem.l	(a7)+,d0-d6/a0-a1
	unlk	a6
	rts

Lff61ee:
	link.w	a6,#-$0008
	movem.l	d0-d7/a0-a1,-(a7)
	tst.w	($000c,a6)
	beq.w	Lff6360
	tst.w	($000e,a6)
	beq.w	Lff6360
	move.w	($0008,a6),d2
	move.w	($000a,a6),d3
	move.w	d2,d4
	add.w	($000c,a6),d4
	move.w	d3,d5
	add.w	($000e,a6),d5
	cmp.w	($00000958).l,d2
	bge.w	Lff6360
	cmp.w	($00000954).l,d4
	ble.w	Lff6360
	cmp.w	($0000095a).l,d3
	bge.w	Lff6360
	cmp.w	($00000956).l,d5
	ble.w	Lff6360
	cmp.w	($00000954).l,d2
	bge.s	Lff6250
	move.w	($00000954).l,d2
Lff6250:
	cmp.w	($00000958).l,d4
	ble.s	Lff625e
	move.w	($00000958).l,d4
Lff625e:
	cmp.w	($00000956).l,d3
	bge.s	Lff626c
	move.w	($00000956).l,d3
Lff626c:
	cmp.w	($0000095a).l,d5
	ble.s	Lff627a
	move.w	($0000095a).l,d5
Lff627a:
	sub.w	d2,d4
	move.w	d4,(-$0004,a6)
	sub.w	d3,d5
	move.w	d5,(-$0002,a6)
	add.w	($00000950).l,d2
	move.w	d2,(-$0008,a6)
	add.w	($00000952).l,d3
	move.w	d3,(-$0006,a6)
	move.w	(-$0002,a6),d6
	movea.l	($0000094c).l,a0
	move.w	(-$0006,a6),d0
	mulu.w	($00000940).l,d0
	lea.l	(a0,d0.l),a0
	move.w	(-$0008,a6),d0
	lsr.w	#3,d0
	lea.l	(a0,d0.w),a0
	move.w	($0010,a6),d7
	move.w	(-$0006,a6),d0
	btst.l	#$00,d0
	beq.s	Lff62cc
	ror.w	#8,d7
Lff62cc:
	movea.l	a0,a1
	move.w	(-$0008,a6),d4
	move.w	(-$0004,a6),d5
	move.w	d4,d1
	and.w	#$0007,d1
	beq.s	Lff630a
	move.w	#$0007,d0
	sub.w	d1,d0
	add.w	d0,d4
	addq.w	#1,d4
	clr.w	d1
Lff62ea:
	bset.l	d0,d1
	subq.w	#1,d5
	beq.s	Lff62f4
	dbra.w	d0,Lff62ea
Lff62f4:
	move.w	d1,d0
	not.w	d0
	move.b	(a1),d2
	and.b	d0,d2
	move.b	d7,d3
	and.b	d1,d3
	or.b	d3,d2
	move.b	d2,(a1)
	addq.l	#1,a1
	tst.w	d5
	beq.s	Lff634c
Lff630a:
	move.w	(-$0008,a6),d0
	add.w	(-$0004,a6),d0
	sub.w	d4,d0
	cmp.w	#$0008,d0
	blt.s	Lff632a
	move.w	d0,d1
	lsr.w	#3,d1
	subq.w	#1,d1
Lff6320:
	move.b	d7,(a1)+
	dbra.w	d1,Lff6320
	and.w	#$0007,d0
Lff632a:
	tst.w	d0
	beq.s	Lff634c
	clr.w	d1
	subq.w	#1,d0
Lff6332:
	lsr.w	#1,d1
	bset.l	#$07,d1
	dbra.w	d0,Lff6332
	move.w	d1,d0
	not.w	d0
	move.b	(a1),d2
	and.b	d0,d2
	move.b	d7,d3
	and.b	d1,d3
	or.b	d3,d2
	move.b	d2,(a1)
Lff634c:
	subq.w	#1,d6
	beq.s	Lff6360
	move.w	($00000940).l,d0
	lea.l	(a0,d0.w),a0
	ror.w	#8,d7
	bra.w	Lff62cc

Lff6360:
	movem.l	(a7)+,d0-d7/a0-a1
	unlk	a6
	rts

Lff6368:
	bsr.s	Lff6380
	swap.w	d0
	beq.s	Lff6368
	clr.w	d0
	move.l	a0,($00000818).l
	subq.w	#1,($00000812).l
	swap.w	d0
	rts

Lff6380:
	clr.l	d0
	tst.w	($00000812).l
	beq.s	Lff63a6
	movea.l	($00000818).l,a0
	addq.l	#2,a0
	cmpa.l	#$0000089c,a0
	bcs.s	Lff63a0
	movea.l	#$0000081c,a0
Lff63a0:
	moveq.l	#$01,d0
	swap.w	d0
	move.w	(a0),d0
Lff63a6:
	rts

Lff63a8:
	movem.l	d0-d1/a0,-(a7)
	move.w	($00000812).l,d1
	beq.s	Lff63de
	movea.l	($00000818).l,a0
Lff63ba:
	addq.l	#2,a0
	cmpa.l	#$0000089c,a0
	bcs.s	Lff63ca
	movea.l	#$0000081c,a0
Lff63ca:
	move.w	(a0),d0
	and.w	#$7fff,d0
	cmp.w	#$6d00,d0
	bne.s	Lff63da
	move.w	#$0000,(a0)
Lff63da:
	subq.w	#1,d1
	bne.s	Lff63ba
Lff63de:
	movem.l	(a7)+,d0-d1/a0
	rts

Lff63e4:
	clr.l	d0
	move.w	($00000810).l,d0
	rts

Lff63ee:
	move.l	d1,-(a7)
	ori.w	#$0700,sr
	lea.l	($00000800).l,a0
	move.w	#$000f,d0
Lff63fe:
	clr.b	(a0)+
	dbra.w	d0,Lff63fe
	lea.l	($0000081c).l,a0
	move.l	a0,($00000814).l
	move.l	a0,($00000818).l
	clr.w	($00000812).l
	move.b	#$08,($00e8e007)
	move.l	(a7),d1
	move.b	d1,($00000810).l
	clr.w	d0
	move.b	d1,d0
	asl.w	#2,d0
	move.b	d0,($0000080b).l
	lsr.w	#8,d0
	and.w	#$0001,d0
	move.b	d0,($0000080c).l
	move.b	d1,d0
	asl.b	#4,d0
	move.b	d0,($00000811).l
	bsr.w	Lff1964
	move.b	#$41,d1			;'A'
	bsr.w	Lff6502
	move.b	#$49,d1			;'I'
	bsr.w	Lff6502
	move.b	#$59,d1			;'Y'
	bsr.w	Lff6502
	move.b	#$51,d1			;'Q'
	bsr.w	Lff6502
	move.b	($00ed0027),d1
	and.b	#$01,d1
	or.b	#$5c,d1
	bsr.w	Lff6502
	move.b	($00ed003a),d1
	and.w	#$000f,d1
	or.w	#$0060,d1
	bsr.s	Lff6502
	move.b	($00ed003b),d1
	and.w	#$000f,d1
	or.w	#$0070,d1
	bsr.s	Lff6502
	andi.w	#$f8ff,sr
	move.l	(a7)+,d1
	rts

Lff64ac:
	clr.l	d0
	lea.l	($00000800).l,a0
	move.b	(a0,d1.w),d0
	rts

Lff64ba:
	move.l	d1,d0
	bra.w	Lff1978

Lff64c0:
	move.l	d1,-(a7)
	eori.b	#$ff,d1
	or.b	#$80,d1
	bsr.s	Lff6502
	move.l	(a7)+,d1
	rts

Lff64d0:
	bra.w	Lff1964

Lff64d4:
	move.l	d1,-(a7)
	and.b	#$0f,d1
	or.b	#$60,d1
	bsr.s	Lff6502
	move.l	(a7)+,d1
	rts

Lff64e4:
	move.l	d1,-(a7)
	and.b	#$0f,d1
	or.b	#$70,d1
	bsr.s	Lff6502
	move.l	(a7)+,d1
	rts

Lff64f4:
	move.l	d1,-(a7)
	move.b	d0,d1
	add.b	#$52,d1			;'R'
	bsr.s	Lff6502
	move.l	(a7)+,d1
	rts

Lff6502:
	move.b	($00e8802d),d0
	btst.l	#$07,d0
	beq.s	Lff6502
	move.b	d1,($00e8802f)
	rts

Lff6516:
	btst.l	#$05,d1
	beq.s	Lff6524
	move.w	d1,-(a7)
	moveq.l	#$07,d1
	bsr.s	Lff6524
	move.w	(a7)+,d1
Lff6524:
	and.w	#$001f,d1
	movem.l	d1-d6/a0,-(a7)
	lea.l	($00e8e003),a0
	tst.w	d1
	beq.s	Lff6572
	cmpi.w	#$0007,d1
	beq.s	Lff6578
	cmpi.w	#$000d,d1
	beq.s	Lff6586
	cmpi.w	#$001b,d1
	ble.s	Lff6570
	move.w	d1,d6
	move.w	#$0005,d1
	bsr.s	Lff6592
	cmpi.w	#$001c,d6
	beq.s	Lff6572
	move.w	#$0008,d1
	cmpi.w	#$001d,d6
	beq.s	Lff6570
	move.w	#$000f,d1
	bsr.s	Lff6592
	move.w	#$000a,d1
	cmpi.w	#$001e,d6
	beq.s	Lff6572
Lff6570:
	bsr.s	Lff6592
Lff6572:
	movem.l	(a7)+,d1-d6/a0
	rts

Lff6578:
	btst.b	#$03,($00e8e003)
	beq.s	Lff6572
Lff6582:
	moveq.l	#$0e,d1
	bra.s	Lff6570

Lff6586:
	btst.b	#$03,($00e8e003)
	bne.s	Lff6572
	bra.s	Lff6582

Lff6592:
	move.w	sr,-(a7)
	ori.w	#$0700,sr
	lsl.w	#3,d1
	move.w	d1,d2
	eori.w	#$0ff8,d2
	swap.w	d2
	move.w	d1,d2
	move.w	($00000cb8).l,d1
	move.w	d1,d0
	addq.w	#2,d0
	lsr.w	#2,d0
	sub.w	d0,d1
	swap.w	d1
	move.w	d0,d1
	bsr.s	Lff65c0
	swap.w	d2
	bsr.s	Lff65c0
	move.w	(a7)+,sr
	rts

Lff65c0:
	moveq.l	#$0c,d3
	moveq.l	#$2f,d4			;'/'
Lff65c4:
	move.l	d1,d0
	move.b	#$08,(a0)
Lff65ca:
	dbra.w	d0,Lff65ca
	subq.w	#1,d4
	clr.b	(a0)
	swap.w	d0
	lsr.w	#1,d2
	bcc.s	Lff65e0
	subq.w	#1,d4
	add.w	($00000cb8).l,d0
Lff65e0:
	dbra.w	d0,Lff65e0
	dbra.w	d3,Lff65c4
	mulu.w	($00000cb8).l,d4
Lff65ee:
	dbra.w	d4,Lff65ee
	rts

Lff65f4:
	moveq.l	#$ff,d0
	cmp.w	#$0007,d1
	bcc.s	Lff6666
	movem.l	d1/d3/a0,-(a7)
	lea.l	($00000810).l,a0
	move.w	(a0),d0
	ror.w	#8,d0
	move.w	d1,d3
	add.w	#$000c,d3
	tst.b	d2
	beq.s	Lff663c
	bset.l	d3,d0
	bset.l	d1,d0
	cmp.b	#$02,d1
	bcc.s	Lff6632
	eori.b	#$01,d3
	eori.b	#$01,d1
	bclr.l	d3,d0
	bclr.l	d1,d0
	eori.b	#$01,d3
	eori.b	#$01,d1
Lff6632:
	btst.b	d1,(a0)
	bne.s	Lff6648
	add.w	#$005a,d1
	bra.s	Lff6648

Lff663c:
	bclr.l	d3,d0
	bclr.l	d1,d0
	btst.b	d1,(a0)
	beq.s	Lff6648
	add.w	#$005a,d1
Lff6648:
	move.w	(a0),-(a7)
	rol.w	#8,d0
	move.w	d0,(a0)
	move.w	d1,d0
	move.w	(a7)+,d1
	cmp.w	#$005a,d0		;'Z'
	bcs.s	Lff665c
	bsr.w	Lff4644
Lff665c:
	bsr.w	Lff1964
	movem.l	(a7)+,d1/d3/a0
	clr.l	d0
Lff6666:
	rts

Lff6668:
	lea.l	($000009dc).l,a0
	tst.b	d1
	beq.s	Lff6688
	cmp.b	#$01,d1
	bne.s	Lff6696
	addq.l	#1,a0
	cmp.b	#$02,d2
	bne.s	Lff6688
	bsr.w	Lff4a8c
	bsr.w	Lff44b0
Lff6688:
	clr.l	d0
	move.b	(a0),d0
	cmp.b	#-$01,d2
	beq.s	Lff6694
	move.b	d2,(a0)
Lff6694:
	rts

Lff6696:
	moveq.l	#$ff,d0
	rts

Lff669a:
	moveq.l	#$ff,d0
	movem.l	d1-d2/a1,-(a7)
	move.l	d1,d2
	swap.w	d2
	bne.s	Lff66aa
	move.w	#$0008,d2
Lff66aa:
	cmp.w	#$0006,d2
	beq.s	Lff66d0
	bsr.w	Lff6d76
	movea.l	d0,a0
	moveq.l	#$ff,d0
	cmpa.l	#$00f00000,a0
	bcc.s	Lff66d0
	addq.w	#1,d2
	addq.w	#1,d1
	mulu.w	d1,d2
	subq.w	#1,d2
Lff66c8:
	move.b	(a1)+,(a0)+
	dbra.w	d2,Lff66c8
	clr.l	d0
Lff66d0:
	movem.l	(a7)+,d1-d2/a1
	rts

Lff66d6:
	cmp.w	#$ffff,d1
	beq.w	Lff67c0
	movem.l	d1-d3/a1-a2,-(a7)
	cmp.w	#$0100,d1
	bcc.w	Lff678c
	cmp.w	#$0013,d1
	bcc.w	Lff6786
	move.b	d1,($0000093c).l
	move.w	#$0000,($00e82600)
	bsr.w	Lff7532
	move.w	#$0133,($00e8002a)
	lea.l	($00e00000),a0
	lea.l	($00e20000),a1
	bsr.w	Lffaeec
	move.w	#$0033,($00e8002a)	;'3'
	bsr.w	Lff67d4
	move.w	#$0000,($00e80480)
	bsr.w	Lff68d4
	bsr.w	Lff750a
	lea.l	($00e82200),a1
	lea.l	($00ed002e),a0
	move.w	(a0)+,(a1)+
	move.w	(a0)+,(a1)+
	move.w	(a0)+,(a1)+
	move.w	(a0)+,(a1)+
	move.w	(a0),(a1)+
	move.w	(a0),(a1)+
	move.w	(a0),(a1)+
	move.w	(a0)+,(a1)+
	move.w	(a0),(a1)+
	move.w	(a0),(a1)+
	move.w	(a0),(a1)+
	move.w	(a0),(a1)+
	move.w	(a0),(a1)+
	move.w	(a0),(a1)+
	move.w	(a0),(a1)+
	move.w	(a0)+,(a1)+
	move.b	($00ed0028),($00e8e001)
	move.w	#$0010,($00eb0808)
	move.w	#$0020,($00e82600)	;' '
	move.w	#$06e4,($00e82500)
Lff6786:
	movem.l	(a7)+,d1-d3/a1-a2
	rts

Lff678c:
	and.w	#$00ff,d1
	cmp.w	#$0013,d1
	bcc.s	Lff6786
	move.b	d1,($0000093c).l
	move.w	($00e82600),-(a7)
	move.w	#$0000,($00e82600)
	bsr.s	Lff67d4
	move.w	(a7),d0
	and.w	#$001f,d0
	beq.s	Lff67b8
	bsr.w	Lffae32
Lff67b8:
	move.w	(a7)+,($00e82600)
	bra.s	Lff6786

Lff67c0:
	clr.l	d0
	move.b	($0000093c).l,d0
	rts

Lff67ca:
	move.w	#$00ff,d0
Lff67ce:
	dbra.w	d0,Lff67ce
	rts

Lff67d4:
	lea.l	(Lff6928),a0
	asl.w	#5,d1
	lea.l	(a0,d1.w),a0
	lea.l	($0014,a0),a2
	clr.w	($00000964).l
	move.w	(a0)+,d0
	move.w	(a0)+,d3
	move.w	d0,d2
	and.w	#$001f,d0
	lea.l	($00e80000),a1
	move.w	($0028,a1),d1
	and.w	#$001f,d1
	rol.b	#4,d1
	rol.b	#4,d0
	cmp.w	d1,d0
	bcc.s	Lff6816
	move.w	d2,($0028,a1)
	bsr.w	Lff6900
	move.w	d3,(a1)
	bra.s	Lff6820

Lff6816:
	move.w	d3,(a1)
	bsr.w	Lff6900
	move.w	d2,($0028,a1)
Lff6820:
	move.w	d2,d3
	ror.w	#8,d3
	andi.w	#$0007,d3
	move.w	d3,($00e82400)
	lea.l	($00eb080a),a1
	clr.w	d0
	move.b	($0001,a2),d0
	move.w	d0,($0002,a1)
	bsr.s	Lff67ca
	clr.w	d0
	move.b	(a2),d0
	move.w	d0,(a1)
	addq.l	#2,a2
	addq.l	#4,a1
	move.b	(a2)+,d0
	move.w	d0,(a1)+
	move.b	(a2)+,d0
	move.w	d0,(a1)
	clr.l	d0
	clr.w	($00000968).l
	clr.w	($0000096a).l
	move.w	(a2)+,d0
	move.l	d0,d1
	asl.l	#1,d0
	move.l	d0,($00000960).l
	move.w	(a2)+,d0
	move.w	d0,($0000096c).l
	subq.w	#1,($0000096c).l
	lsr.w	#3,d0
	subq.w	#1,d0
	move.w	d0,($00000970).l
	move.w	(a2)+,d0
	move.w	d0,($0000096e).l
	subq.w	#1,($0000096e).l
	lsr.w	#4,d0
	subq.w	#1,d0
	move.w	d0,($00000972).l
	clr.l	($00000948).l
	clr.w	($00000974).l
	clr.w	($00000976).l
	move.w	(a2)+,d0
	move.b	d0,($0000093d).l
	move.l	#$00e00000,($00000944).l
	move.w	($0000096c).l,d2
	swap.w	d2
	move.w	($0000096e).l,d2
	clr.l	d1
	bra.w	Lffa476

Lff68d4:
	move.w	($00e80028),d0
	and.w	#$0003,d0
	bne.s	Lff68e6
	bsr.w	Lffaea2
	bra.s	Lff68f6

Lff68e6:
	cmp.w	#$0001,d0
	bne.s	Lff68f2
	bsr.w	Lffaeb8
	bra.s	Lff68f6

Lff68f2:
	bsr.w	Lffaed0
Lff68f6:
	bset.b	#$03,($00e80028)
	rts

Lff6900:
	move.l	a1,-(a7)
	move.w	#$0007,d1
	addq.l	#2,a1
Lff6908:
	move.w	(a0)+,(a1)+
	dbra.w	d1,Lff6908
	move.w	#$000a,d1
Lff6912:
	clr.w	(a1)+
	dbra.w	d1,Lff6912
	addq.l	#2,a1
	move.w	#$0033,(a1)+		;'3'
	clr.w	(a1)+
	clr.w	(a1)+
	clr.w	(a1)+
	movea.l	(a7)+,a1
	rts

Lff6928:
	.dc.b	$03,$15,$00,$5b,$00,$09,$00,$11
	.dc.b	$00,$51,$02,$37,$00,$05,$00,$28
	.dc.b	$02,$28,$00,$1b,$ff,$15,$28,$15
	.dc.b	$04,$00,$02,$00,$02,$00,$00,$01
	.dc.b	$03,$05,$00,$4b,$00,$03,$00,$05
	.dc.b	$00,$45,$01,$03,$00,$02,$00,$10
	.dc.b	$01,$00,$00,$2c,$ff,$09,$10,$05
	.dc.b	$04,$00,$02,$00,$02,$00,$00,$01
	.dc.b	$03,$10,$00,$2d,$00,$04,$00,$06
	.dc.b	$00,$26,$02,$37,$00,$05,$00,$28
	.dc.b	$02,$28,$00,$1b,$ff,$0a,$28,$10
	.dc.b	$04,$00,$01,$00,$01,$00,$00,$01
	.dc.b	$03,$00,$00,$25,$00,$01,$00,$00
	.dc.b	$00,$20,$01,$03,$00,$02,$00,$10
	.dc.b	$01,$00,$00,$24,$25,$04,$10,$00
	.dc.b	$04,$00,$01,$00,$01,$00,$00,$01
	.dc.b	$03,$15,$00,$5b,$00,$09,$00,$11
	.dc.b	$00,$51,$02,$37,$00,$05,$00,$28
	.dc.b	$02,$28,$00,$1b,$ff,$15,$28,$15
	.dc.b	$02,$00,$02,$00,$02,$00,$00,$04
	.dc.b	$03,$05,$00,$4b,$00,$03,$00,$05
	.dc.b	$00,$45,$01,$03,$00,$02,$00,$10
	.dc.b	$01,$00,$00,$2c,$ff,$09,$10,$05
	.dc.b	$02,$00,$02,$00,$02,$00,$00,$04
	.dc.b	$03,$10,$00,$2d,$00,$04,$00,$06
	.dc.b	$00,$26,$02,$37,$00,$05,$00,$28
	.dc.b	$02,$28,$00,$1b,$ff,$0a,$28,$10
	.dc.b	$02,$00,$01,$00,$01,$00,$00,$04
	.dc.b	$03,$00,$00,$25,$00,$01,$00,$00
	.dc.b	$00,$20,$01,$03,$00,$02,$00,$10
	.dc.b	$01,$00,$00,$24,$25,$04,$10,$00
	.dc.b	$02,$00,$01,$00,$01,$00,$00,$04
	.dc.b	$03,$15,$00,$5b,$00,$09,$00,$11
	.dc.b	$00,$51,$02,$37,$00,$05,$00,$28
	.dc.b	$02,$28,$00,$1b,$ff,$15,$28,$15
	.dc.b	$02,$00,$02,$00,$02,$00,$00,$02
	.dc.b	$03,$05,$00,$4b,$00,$03,$00,$05
	.dc.b	$00,$45,$01,$03,$00,$02,$00,$10
	.dc.b	$01,$00,$00,$2c,$ff,$09,$10,$05
	.dc.b	$02,$00,$02,$00,$02,$00,$00,$02
	.dc.b	$03,$10,$00,$2d,$00,$04,$00,$06
	.dc.b	$00,$26,$02,$37,$00,$05,$00,$28
	.dc.b	$02,$28,$00,$1b,$ff,$0a,$28,$10
	.dc.b	$02,$00,$01,$00,$01,$00,$00,$02
	.dc.b	$03,$00,$00,$25,$00,$01,$00,$00
	.dc.b	$00,$20,$01,$03,$00,$02,$00,$10
	.dc.b	$01,$00,$00,$24,$25,$04,$10,$00
	.dc.b	$02,$00,$01,$00,$01,$00,$00,$02
	.dc.b	$03,$15,$00,$5b,$00,$09,$00,$11
	.dc.b	$00,$51,$02,$37,$00,$05,$00,$28
	.dc.b	$02,$28,$00,$1b,$ff,$15,$28,$15
	.dc.b	$02,$00,$02,$00,$02,$00,$00,$01
	.dc.b	$03,$05,$00,$4b,$00,$03,$00,$05
	.dc.b	$00,$45,$01,$03,$00,$02,$00,$10
	.dc.b	$01,$00,$00,$2c,$ff,$09,$10,$05
	.dc.b	$02,$00,$02,$00,$02,$00,$00,$01
	.dc.b	$03,$10,$00,$2d,$00,$04,$00,$06
	.dc.b	$00,$26,$02,$37,$00,$05,$00,$28
	.dc.b	$02,$28,$00,$1b,$ff,$0a,$28,$10
	.dc.b	$02,$00,$01,$00,$01,$00,$00,$01
	.dc.b	$03,$00,$00,$25,$00,$01,$00,$00
	.dc.b	$00,$20,$01,$03,$00,$02,$00,$10
	.dc.b	$01,$00,$00,$24,$25,$04,$10,$00
	.dc.b	$02,$00,$01,$00,$01,$00,$00,$01
	.dc.b	$03,$16,$00,$89,$00,$0e,$00,$1c
	.dc.b	$00,$7c,$02,$37,$00,$05,$00,$28
	.dc.b	$02,$28,$00,$1b,$ff,$ff,$ff,$ff
	.dc.b	$04,$00,$03,$00,$02,$00,$00,$01
	.dc.b	$03,$16,$00,$af,$00,$0f,$00,$1f
	.dc.b	$00,$9f,$01,$d0,$00,$07,$00,$20
	.dc.b	$01,$c8,$00,$1b,$ff,$ff,$ff,$ff
	.dc.b	$04,$00,$04,$00,$01,$a8,$00,$01
	.dc.b	$03,$1a,$00,$af,$00,$0f,$00,$1f
	.dc.b	$00,$9f,$01,$d0,$00,$07,$00,$20
	.dc.b	$01,$c8,$00,$1b,$ff,$ff,$ff,$ff
	.dc.b	$04,$00,$04,$00,$03,$50,$00,$01
	.dc.b	$10,$39,$00,$e8,$e0,$01,$c0,$bc
	.dc.b	$00,$00,$00,$0f,$b2,$3c,$ff,$ff
	.dc.b	$67,$0c,$b2,$3c,$ff,$fe,$67,$08
	.dc.b	$13,$c1,$00,$e8,$e0,$01,$4e,$75
Lff6ba8:
	move.b	($00ed0028),($00e8e001)
	rts

Lff6bb4:
	movem.l	d1-d7,-(a7)
	move.l	d1,d2
	ror.l	#8,d2
	move.l	d1,d3
	swap.w	d3
	move.w	d3,d4
	ror.w	#5,d4
	and.w	#$001f,d1
	and.w	#$001f,d2
	and.w	#$001f,d3
	and.w	#$0007,d4
	clr.l	d0
	tst.b	d2
	bne.s	Lff6be8
	move.w	d1,d0
	rol.w	#5,d0
	or.b	d1,d0
	rol.w	#5,d0
	or.b	d1,d0
	bra.w	Lff6c8c

Lff6be8:
	move.w	d1,d5
	asl.w	#1,d5
	addq.w	#1,d5
	asl.w	#1,d2
	addq.w	#1,d2
	mulu.w	d2,d5
	move.w	d5,d6
	add.w	#$0040,d5
	lsr.w	#7,d5
	subq.w	#1,d2
	lsr.w	#1,d2
	asl.w	#1,d3
	addq.w	#1,d3
	mulu.w	d3,d6
	add.l	#$00001000,d6
	lsr.l	#5,d6
	lsr.l	#8,d6
	subq.w	#1,d3
	lsr.w	#1,d3
	move.w	d1,d7
	sub.w	d5,d7
	swap.w	d7
	move.w	d1,d7
	sub.w	d6,d7
	move.w	d1,d0
	add.w	d6,d0
	sub.w	d5,d0
	move.w	d0,d5
	move.w	d7,d6
	swap.w	d7
	subq.w	#1,d4
	bcc.s	Lff6c3a
	move.w	d5,d0
	rol.w	#5,d0
	or.b	d1,d0
	rol.w	#5,d0
	or.b	d7,d0
	bra.s	Lff6c8c

Lff6c3a:
	subq.w	#1,d4
	bcc.s	Lff6c4a
	move.w	d1,d0
	rol.w	#5,d0
	or.b	d6,d0
	rol.w	#5,d0
	or.b	d7,d0
	bra.s	Lff6c8c

Lff6c4a:
	subq.w	#1,d4
	bcc.s	Lff6c5a
	move.w	d1,d0
	rol.w	#5,d0
	or.b	d7,d0
	rol.w	#5,d0
	or.b	d5,d0
	bra.s	Lff6c8c

Lff6c5a:
	subq.w	#1,d4
	bcc.s	Lff6c6a
	move.w	d6,d0
	rol.w	#5,d0
	or.b	d7,d0
	rol.w	#5,d0
	or.b	d1,d0
	bra.s	Lff6c8c

Lff6c6a:
	subq.w	#1,d4
	bcc.s	Lff6c7a
	move.w	d7,d0
	rol.w	#5,d0
	or.b	d5,d0
	rol.w	#5,d0
	or.b	d1,d0
	bra.s	Lff6c8c

Lff6c7a:
	subq.w	#1,d4
	bcc.s	Lff6c8a
	move.w	d7,d0
	rol.w	#5,d0
	or.b	d1,d0
	rol.w	#5,d0
	or.b	d6,d0
	bra.s	Lff6c8c

Lff6c8a:
	moveq.l	#$ff,d0
Lff6c8c:
	rol.w	#1,d0
	movem.l	(a7)+,d1-d7
	rts

Lff6c94:
	cmp.l	#$ffffffff,d2
	beq.s	Lff6d16
	cmp.l	#$fffffffe,d2
	bne.s	Lff6cca
	clr.l	d0
	move.b	d1,d0
	cmp.b	#$04,d1
	bcs.s	Lff6cb8
	moveq.l	#$04,d0
	cmp.b	#$08,d1
	bcs.s	Lff6cb8
	moveq.l	#$05,d0
Lff6cb8:
	lea.l	($00ed002e),a0
	adda.l	d0,a0
	adda.l	d0,a0
	move.w	(a0),d2
	bsr.s	Lff6cca
	moveq.l	#$fe,d2
	rts

Lff6cca:
	moveq.l	#$08,d0
	cmp.b	d0,d1
	bcc.s	Lff6cd8
	cmp.b	#$04,d1
	bcs.s	Lff6cf0
	moveq.l	#$04,d0
Lff6cd8:
	movem.l	d1/d3,-(a7)
	move.w	d0,d3
	move.w	d0,d1
	subq.w	#1,d3
Lff6ce2:
	bsr.s	Lff6cf8
	addq.w	#1,d1
	dbra.w	d3,Lff6ce2
	movem.l	(a7)+,d1/d3
	rts

Lff6cf0:
	cmp.l	#$ffffffff,d2
	beq.s	Lff6d16
Lff6cf8:
	clr.l	d0
	move.b	d1,d0
	cmp.b	#$0f,d0
	bhi.s	Lff6d12
	add.w	d0,d0
	lea.l	($00e82200),a0
	adda.l	d0,a0
	move.w	d2,(a0)
	clr.l	d0
	rts

Lff6d12:
	moveq.l	#$ff,d0
	rts

Lff6d16:
	clr.l	d0
	move.b	d1,d0
	cmp.b	#$0f,d0
	bhi.s	Lff6d12
	add.w	d0,d0
	lea.l	($00e82200),a0
	bsr.s	Lff6d30
	move.w	(a0,d0.w),d0
	rts

Lff6d30:
	btst.b	#$04,($00e88001)
	bne.s	Lff6d30
	rts

Lff6d3c:
	and.w	#$000f,d1
	move.w	d1,($00000942).l
	move.l	#$000000e0,d0
	btst.l	#$00,d1
	bne.s	Lff6d6c
	addq.w	#2,d0
	btst.l	#$01,d1
	bne.s	Lff6d6c
	addq.w	#2,d0
	btst.l	#$02,d1
	bne.s	Lff6d6c
	addq.w	#2,d0
	btst.l	#$03,d1
	bne.s	Lff6d6c
	subq.w	#6,d0
Lff6d6c:
	swap.w	d0
	move.l	d0,($00000944).l
	rts

Lff6d76:
	cmp.w	#$2121,d1		;'!!'
	bcs.w	Lff6eca
	cmp.w	#$7e7f,d1
	bcs.s	Lff6d9c
	cmpi.w	#$8140,d1
	bcs.w	Lff6eca
	cmpi.w	#$f000,d1
	bcc.w	Lff6f36
	bsr.w	Lffb75a
	clr.l	d1
	move.w	d0,d1
Lff6d9c:
	move.w	d1,d0
	ror.w	#8,d0
	cmp.b	#$21,d0			;'!'
	bcs.s	Lff6db8
	cmp.b	#$7f,d0
	bcc.s	Lff6db8
	cmp.b	#$21,d1			;'!'
	bcs.s	Lff6db8
	cmp.b	#$7f,d1
	bcs.s	Lff6dbc
Lff6db8:
	move.w	#$2228,d1		;'"('
Lff6dbc:
	clr.l	d0
	move.b	d1,d0
	lsr.w	#8,d1
	cmp.b	#$2c,d1			;','
	beq.w	Lff6e56
	cmp.b	#$2d,d1			;'-'
	beq.w	Lff6e56
	cmp.b	#$30,d1			;'0'
	bcs.s	Lff6dda
	subq.w	#7,d1
Lff6dda:
	sub.w	#$0021,d1
	sub.w	#$0021,d0
	mulu.w	#$005e,d1
	add.l	d0,d1
	cmp.b	#$08,d2
	beq.s	Lff6e2c
	mulu.w	#$0048,d1
	move.l	#$00f40000,d0
	cmp.l	#$00080e20,d1
	bcs.s	Lff6e0c
	sub.l	#$00080e20,d1
	move.l	($000009aa).l,d0
Lff6e0c:
	add.l	d1,d0
	cmp.b	#$06,d2
	beq.s	Lff6e1e
	move.l	#$00180002,d1
	moveq.l	#$17,d2
	rts

Lff6e1e:
	bsr.w	Lff6fde
	move.l	#$000c0001,d1
	moveq.l	#$0b,d2
	rts

Lff6e2c:
	mulu.w	#$0020,d1
	move.l	#$00f00000,d0
	cmp.l	#$00039480,d1
	bcs.s	Lff6e4a
	sub.l	#$00039480,d1
	move.l	($0000099e).l,d0
Lff6e4a:
	add.l	d1,d0
	move.l	#$00100001,d1
	moveq.l	#$0f,d2
	rts

Lff6e56:
	sub.w	#$002c,d1
	sub.w	#$0021,d0
	mulu.w	#$005e,d1
	add.l	d0,d1
	cmp.b	#$08,d2
	beq.s	Lff6e76
	mulu.w	#$0048,d1
	move.l	($000009a6).l,d0
	bra.s	Lff6e0c

Lff6e76:
	mulu.w	#$0020,d1
	move.l	($0000099a).l,d0
	bra.s	Lff6e4a

Lff6e82:
	and.w	#$00ff,d1
	cmp.w	#$005c,d1		;'\'
	beq.s	Lff6e9a
	cmp.w	#$007e,d1		;'~'
	beq.s	Lff6eaa
	cmp.w	#$007c,d1		;'|'
	beq.s	Lff6eba
Lff6e98:
	rts

Lff6e9a:
	btst.b	#$00,($00ed0059)
	beq.s	Lff6e98
	move.w	#$0080,d1
	rts

Lff6eaa:
	btst.b	#$01,($00ed0059)
	beq.s	Lff6e98
	move.w	#$0081,d1
	rts

Lff6eba:
	btst.b	#$02,($00ed0059)
	beq.s	Lff6e98
	move.w	#$0082,d1
	rts

Lff6eca:
	cmp.w	#$80a6,d1
	bcs.s	Lff6eda
	cmp.w	#$80de,d1
	bcc.s	Lff6eda
	eori.b	#$20,d1
Lff6eda:
	bsr.s	Lff6e82
	cmp.b	#$08,d2
	beq.s	Lff6f20
	cmp.b	#$06,d2
	beq.s	Lff6f12
	move.l	#$00f3d000,d0
Lff6eee:
	mulu.w	#$0030,d1
	add.l	d1,d0
Lff6ef4:
	cmp.b	#$06,d2
	beq.s	Lff6f04
	move.l	#$000c0001,d1
	moveq.l	#$17,d2
	rts

Lff6f04:
	bsr.w	Lff7030
Lff6f08:
	move.l	#$00060000,d1
	moveq.l	#$0b,d2
	rts

Lff6f12:
	move.l	#Lffd344,d0
	mulu.w	#$000c,d1
	add.l	d1,d0
	bra.s	Lff6f08

Lff6f20:
	move.l	#$00f3a800,d0
Lff6f26:
	mulu.w	#$0010,d1
	add.l	d1,d0
Lff6f2c:
	move.l	#$00080000,d1
	moveq.l	#$0f,d2
	rts

Lff6f36:
	cmp.w	#$f400,d1
	bcc.w	Lff6fc2
	move.l	a1,-(a7)
	lea.l	($00000c46).l,a0
	movea.l	a0,a1
	move.w	#$0047,d0		;'G'
Lff6f4c:
	clr.b	(a0)+
	dbra.w	d0,Lff6f4c
	btst.l	#$09,d1
	beq.s	Lff6f66
	addq.l	#8,a1
	cmp.b	#$08,d2
	beq.s	Lff6f66
	adda.l	#$00000010,a1
Lff6f66:
	btst.l	#$08,d1
	beq.s	Lff6f7c
	cmp.b	#$a6,d1
	bcs.s	Lff6f7c
	cmp.b	#$de,d1
	bcc.s	Lff6f7c
	eori.w	#$0020,d1
Lff6f7c:
	bsr.w	Lff6e82
	cmp.b	#$08,d2
	beq.s	Lff6f98
	movea.l	#$00f3b800,a0
	mulu.w	#$0018,d1
	adda.l	d1,a0
	move.w	#$0017,d1
	bra.s	Lff6fa8

Lff6f98:
	movea.l	#$00f3a000,a0
	mulu.w	#$0008,d1
	adda.l	d1,a0
	move.w	#$0007,d1
Lff6fa8:
	move.b	(a0)+,(a1)+
	dbra.w	d1,Lff6fa8
	movea.l	(a7)+,a1
	move.l	#$00000c46,d0
	cmp.b	#$08,d2
	beq.w	Lff6f2c
	bra.w	Lff6ef4

Lff6fc2:
	and.w	#$01ff,d1
	move.l	($000009ae).l,d0
	cmp.b	#$08,d2
	bne.w	Lff6eee
	move.l	($000009a2).l,d0
	bra.w	Lff6f26

Lff6fde:
	movem.l	d3-d4/a1,-(a7)
	movea.l	d0,a0
	lea.l	($00000c46).l,a1
	move.l	a1,d0
	move.w	#$000b,d1
Lff6ff0:
	clr.l	d2
	move.b	(a0)+,d2
	swap.w	d2
	move.b	(a0)+,d2
	asl.w	#8,d2
	move.b	(a0)+,d2
	clr.l	d3
	move.b	(a0)+,d3
	swap.w	d3
	move.b	(a0)+,d3
	asl.w	#8,d3
	move.b	(a0)+,d3
	or.l	d3,d2
	move.w	#$ffff,d3
	asl.l	#7,d2
	move.w	#$000b,d4
Lff7014:
	rol.w	#1,d3
	asl.l	#2,d2
	bcs.s	Lff701e
	bmi.s	Lff701e
	subq.w	#1,d3
Lff701e:
	dbra.w	d4,Lff7014
	asl.w	#4,d3
	move.w	d3,(a1)+
	dbra.w	d1,Lff6ff0
	movem.l	(a7)+,d3-d4/a1
	rts

Lff7030:
	movem.l	d3-d4/a1,-(a7)
	movea.l	d0,a0
	lea.l	($00000c46).l,a1
	move.l	a1,d0
	move.w	#$000b,d1
Lff7042:
	move.b	(a0)+,d2
	asl.w	#8,d2
	move.b	(a0)+,d2
	move.b	(a0)+,d3
	asl.w	#8,d3
	move.b	(a0)+,d3
	or.w	d3,d2
	move.b	#$ff,d3
	lsr.w	#1,d2
	moveq.l	#$05,d4
Lff7058:
	rol.b	#1,d3
	asl.w	#2,d2
	bcs.s	Lff7062
	bmi.s	Lff7062
	subq.w	#1,d3
Lff7062:
	dbra.w	d4,Lff7058
	asl.b	#2,d3
	move.b	d3,(a1)+
	dbra.w	d1,Lff7042
	movem.l	(a7)+,d3-d4/a1
	rts

Lff7074:
	move.w	d1,d0
Lff7076:
	move.b	(a2)+,(a1)+
	dbra.w	d0,Lff7076
	adda.l	d3,a2
	dbra.w	d2,Lff7074
	rts

Lff7084:
	move.w	d1,d0
Lff7086:
	move.b	(a1)+,(a2)+
	dbra.w	d0,Lff7086
	adda.l	d3,a2
	dbra.w	d2,Lff7084
	rts

Lff7094:
	movem.l	d1-d2/a1,-(a7)
	move.l	d1,d2
	swap.w	d2
	tst.w	d2
	bne.s	Lff70a4
	move.w	#$0008,d2
Lff70a4:
	bsr.w	Lff6d76
	movea.l	d0,a0
	swap.w	d1
	move.w	d1,(a1)+
	addq.w	#1,d2
	move.w	d2,(a1)+
	swap.w	d1
	addq.w	#1,d1
	mulu.w	d1,d2
	subq.w	#1,d2
Lff70ba:
	move.b	(a0)+,(a1)+
	dbra.w	d2,Lff70ba
	movem.l	(a7)+,d1-d2/a1
	rts

Lff70c6:
	movem.l	d1-d7/a1-a2,-(a7)
	move.w	d1,d0
	move.w	d2,d1
	move.w	(a1)+,d2
	move.w	(a1)+,d3
	move.l	($0000093e).l,d7
	subq.w	#1,d2
	subq.w	#1,d3
	move.w	d0,d4
	lsr.w	#3,d0
	mulu.w	d7,d1
	and.l	#$0000ffff,d0
	add.l	d0,d1
	movea.l	($00000944).l,a2
	adda.l	d1,a2
	and.w	#$0007,d4
	bne.s	Lff7130
	move.w	d2,d5
	and.w	#$0007,d5
	move.w	#$ff80,d6
	ror.w	d5,d6
	lsr.w	#3,d2
	beq.s	Lff7122
	sub.w	d2,d7
	subq.w	#1,d2
Lff710c:
	move.w	d2,d4
Lff710e:
	move.b	(a2)+,(a1)+
	dbra.w	d4,Lff710e
	move.b	(a2),d0
	and.b	d6,d0
	move.b	d0,(a1)+
	adda.l	d7,a2
	dbra.w	d3,Lff710c
	bra.s	Lff7186

Lff7122:
	move.b	(a2),d0
	and.b	d6,d0
	move.b	d0,(a1)+
	adda.l	d7,a2
	dbra.w	d3,Lff7122
	bra.s	Lff7186

Lff7130:
	move.w	#$0008,d1
	sub.w	d4,d1
	move.w	d1,d5
	addq.w	#8,d1
	move.w	d2,d4
	and.w	#$0007,d4
	move.w	#$ff80,d6
	ror.w	d4,d6
	lsr.w	#3,d2
	beq.s	Lff7172
	sub.w	d2,d7
	subq.w	#1,d7
	subq.w	#1,d2
Lff7150:
	move.b	(a2)+,d0
	rol.w	#8,d0
	move.w	d2,d4
Lff7156:
	move.b	(a2)+,d0
	ror.w	d5,d0
	move.b	d0,(a1)+
	rol.w	d1,d0
	dbra.w	d4,Lff7156
	move.b	(a2),d0
	ror.w	d5,d0
	and.b	d6,d0
	move.b	d0,(a1)+
	adda.l	d7,a2
	dbra.w	d3,Lff7150
	bra.s	Lff7186

Lff7172:
	move.b	(a2),d0
	rol.w	#8,d0
	move.b	($0001,a2),d0
	ror.w	d5,d0
	and.b	d6,d0
	move.b	d0,(a1)+
	adda.l	d7,a2
	dbra.w	d3,Lff7172
Lff7186:
	movem.l	(a7)+,d1-d7/a1-a2
	rts

Lff718c:
	movem.l	d1-d7/a1-a3,-(a7)
	move.w	d1,d0
	move.w	d2,d1
	move.w	(a1)+,d2
	move.w	(a1)+,d3
	move.l	($0000093e).l,d7
	subq.w	#1,d2
	subq.w	#1,d3
	move.w	d0,d4
	lsr.w	#3,d0
	mulu.w	d7,d1
	and.l	#$0000ffff,d0
	add.l	d0,d1
	movea.l	($00000944).l,a2
	adda.l	d1,a2
	and.w	#$0007,d4
	bne.s	Lff71fa
	move.w	d2,d5
	and.w	#$0007,d5
	move.w	#$007f,d6
	ror.w	d5,d6
	lsr.w	#3,d2
	beq.s	Lff71ea
	sub.w	d2,d7
	subq.w	#1,d2
Lff71d2:
	move.w	d2,d4
Lff71d4:
	move.b	(a1)+,(a2)+
	dbra.w	d4,Lff71d4
	move.b	(a2),d0
	and.b	d6,d0
	or.b	(a1)+,d0
	move.b	d0,(a2)
	adda.l	d7,a2
	dbra.w	d3,Lff71d2
	bra.s	Lff7262

Lff71ea:
	move.b	(a2),d0
	and.b	d6,d0
	or.b	(a1)+,d0
	move.b	d0,(a2)
	adda.l	d7,a2
	dbra.w	d3,Lff71ea
	bra.s	Lff7262

Lff71fa:
	move.w	#$0008,d1
	sub.w	d4,d1
	move.w	d1,d5
	addq.w	#8,d1
	move.w	d2,d4
	and.w	#$0007,d4
	move.w	#$007f,d6
	ror.w	d4,d6
	lsr.w	#3,d2
	beq.s	Lff7248
	sub.w	d2,d7
	subq.w	#1,d7
	subq.w	#1,d2
Lff721a:
	movea.l	a2,a3
	move.b	(a2)+,d0
	rol.w	#8,d0
	move.w	d2,d4
Lff7222:
	move.b	(a2)+,d0
	ror.w	d5,d0
	move.b	(a1)+,d0
	rol.w	d1,d0
	move.b	d0,(a3)+
	dbra.w	d4,Lff7222
	move.b	(a2),d0
	ror.w	d5,d0
	and.b	d6,d0
	or.b	(a1)+,d0
	rol.w	d1,d0
	move.b	d0,(a3)+
	ror.w	#8,d0
	move.b	d0,(a3)+
	adda.l	d7,a2
	dbra.w	d3,Lff721a
	bra.s	Lff7262

Lff7248:
	move.b	(a2)+,d0
	rol.w	#8,d0
	move.b	(a2),d0
	ror.w	d5,d0
	and.b	d6,d0
	or.b	(a1)+,d0
	rol.w	d5,d0
	move.b	d0,(a2)
	ror.w	#8,d0
	move.b	d0,-(a2)
	adda.l	d7,a2
	dbra.w	d3,Lff7248
Lff7262:
	movem.l	(a7)+,d1-d7/a1-a3
	rts

Lff7268:
	link.w	a6,#-$001c
	movem.l	d0-d7/a0-a3,-(a7)
	move.w	d1,(-$001c,a6)
	move.w	d1,d0
	move.w	d2,(-$001a,a6)
	move.w	d2,d1
	move.l	a1,(-$0018,a6)
	move.w	(a2)+,(-$0010,a6)
	move.w	(a2)+,(-$000e,a6)
	move.w	(a2)+,(-$000c,a6)
	move.w	(a2)+,(-$000a,a6)
	movea.l	a1,a2
	addq.l	#4,a1
	move.w	($0002,a2),d2
	cmp.w	(-$000c,a6),d0
	bge.w	Lff74ca
	move.w	d0,d4
	add.w	(a2),d4
	cmp.w	(-$0010,a6),d4
	ble.w	Lff74ca
	cmp.w	(-$000a,a6),d1
	bge.w	Lff74ca
	move.w	d1,d4
	add.w	($0002,a2),d4
	cmp.w	(-$000e,a6),d4
	ble.w	Lff74ca
	cmp.w	(-$000e,a6),d1
	bge.s	Lff72e2
	move.w	(-$000e,a6),d4
	sub.w	d1,d4
	move.w	(-$000e,a6),d1
	sub.w	d4,d2
	move.w	(a2),d5
	subq.w	#1,d5
	lsr.w	#3,d5
	addq.w	#1,d5
	mulu.w	d5,d4
	lea.l	(a1,d4.w),a1
Lff72e2:
	move.w	d1,d4
	add.w	d2,d4
	cmp.w	(-$000a,a6),d4
	ble.s	Lff72f2
	move.w	(-$000a,a6),d2
	sub.w	d1,d2
Lff72f2:
	mulu.w	($00000940).l,d1
	movea.l	d1,a0
	move.w	d0,d1
	asr.w	#3,d1
	lea.l	(a0,d1.w),a0
	adda.l	($00000944).l,a0
	move.w	d2,(-$0014,a6)
	move.w	(-$001c,a6),d0
	move.w	d0,(-$0012,a6)
	move.w	(-$0010,a6),d0
	and.w	#$0007,d0
	move.b	#$ff,d1
	lsr.b	d0,d1
	move.b	d1,(-$0004,a6)
	not.b	d1
	move.b	d1,(-$0002,a6)
	move.w	(-$000c,a6),d0
	and.w	#$0007,d0
	move.w	#$0008,d1
	sub.w	d0,d1
	move.b	#$ff,d0
	lsl.b	d1,d0
	move.b	d0,(-$0003,a6)
	not.b	d0
	move.b	d0,(-$0001,a6)
	move.w	(-$0010,a6),d0
	lsr.w	#3,d0
	move.w	d0,(-$0008,a6)
	move.w	(-$000c,a6),d0
	lsr.w	#3,d0
	move.w	d0,(-$0006,a6)
Lff735e:
	move.w	(a2),d2
	movea.l	a0,a3
	move.w	(-$0012,a6),d0
	moveq.l	#$08,d3
	move.w	d0,d1
	asr.w	#3,d0
	and.w	#$0007,d1
	beq.s	Lff73be
	move.b	(a1)+,d3
	move.b	d3,d6
	lsr.b	d1,d6
	move.w	#$0008,d4
	sub.w	d1,d4
	lsl.b	d4,d3
	swap.w	d3
	move.w	d4,d3
	clr.w	d1
	subq.w	#1,d4
Lff7388:
	bset.l	d4,d1
	subq.w	#1,d2
	beq.s	Lff7392
	dbra.w	d4,Lff7388
Lff7392:
	not.w	d1
	cmp.w	(-$0008,a6),d0
	blt.s	Lff73ba
	bne.s	Lff73a4
	and.b	(-$0004,a6),d6
	or.b	(-$0002,a6),d1
Lff73a4:
	cmp.w	(-$0006,a6),d0
	bne.s	Lff73b2
	and.b	(-$0003,a6),d6
	or.b	(-$0001,a6),d1
Lff73b2:
	move.b	(a3),d5
	and.b	d1,d5
	or.b	d5,d6
	move.b	d6,(a3)
Lff73ba:
	addq.l	#1,a3
	addq.w	#1,d0
Lff73be:
	move.w	d2,d1
	lsr.w	#3,d1
	beq.w	Lff7462
	move.w	d1,d4
	lsl.w	#3,d4
	sub.w	d4,d2
	subq.w	#1,d1
	tst.w	d3
	beq.s	Lff7420
	move.w	#$0008,d4
	sub.w	d3,d4
	move.w	d3,d5
	swap.w	d3
	swap.w	d2
Lff73de:
	move.b	(a1),d6
	clr.b	d2
	lsr.b	d4,d6
	or.b	d3,d6
	cmp.w	(-$0008,a6),d0
	blt.s	Lff740e
	bne.s	Lff73f6
	and.b	(-$0004,a6),d6
	or.b	(-$0002,a6),d2
Lff73f6:
	cmp.w	(-$0006,a6),d0
	bgt.s	Lff740e
	bne.s	Lff7406
	and.b	(-$0003,a6),d6
	or.b	(-$0001,a6),d2
Lff7406:
	move.b	(a3),d7
	and.b	d2,d7
	or.b	d7,d6
	move.b	d6,(a3)
Lff740e:
	addq.l	#1,a3
	move.b	(a1)+,d3
	lsl.b	d5,d3
	addq.w	#1,d0
	dbra.w	d1,Lff73de
	swap.w	d2
	swap.w	d3
	bra.s	Lff7462

Lff7420:
	swap.w	d2
Lff7422:
	move.b	(a1)+,d6
	clr.b	d2
	cmp.w	(-$0008,a6),d0
	blt.s	Lff744e
	bne.s	Lff7436
	and.b	(-$0004,a6),d6
	or.b	(-$0002,a6),d2
Lff7436:
	cmp.w	(-$0006,a6),d0
	bgt.s	Lff744e
	bne.s	Lff7446
	and.b	(-$0003,a6),d6
	or.b	(-$0001,a6),d2
Lff7446:
	move.b	(a3),d4
	and.b	d2,d4
	or.b	d4,d6
	move.b	d6,(a3)
Lff744e:
	addq.l	#1,a3
	addq.w	#1,d0
	dbra.w	d1,Lff7422
	swap.w	d2
	tst.w	d2
	beq.s	Lff74b8
	move.b	(a1)+,d3
	swap.w	d3
	moveq.l	#$08,d3
Lff7462:
	tst.w	d2
	beq.s	Lff74b8
	move.w	#$0008,d1
	sub.w	d3,d1
	cmp.w	d2,d1
	bge.s	Lff747a
	move.b	(a1)+,d4
	lsr.b	d1,d4
	swap.w	d3
	or.b	d4,d3
	swap.w	d3
Lff747a:
	clr.w	d1
	subq.w	#1,d2
Lff747e:
	lsr.w	#1,d1
	bset.l	#$07,d1
	dbra.w	d2,Lff747e
	move.w	d1,d4
	not.w	d4
	swap.w	d3
	and.b	d1,d3
	cmp.w	(-$0008,a6),d0
	blt.s	Lff74b8
	bne.s	Lff74a0
	and.b	(-$0004,a6),d3
	or.b	(-$0002,a6),d4
Lff74a0:
	cmp.w	(-$0006,a6),d0
	bgt.s	Lff74b8
	bne.s	Lff74b0
	and.b	(-$0003,a6),d3
	or.b	(-$0001,a6),d4
Lff74b0:
	move.b	(a3),d5
	and.b	d4,d5
	or.b	d5,d3
	move.b	d3,(a3)
Lff74b8:
	move.w	($00000940).l,d1
	lea.l	(a0,d1.w),a0
	subq.w	#1,(-$0014,a6)
	bne.w	Lff735e
Lff74ca:
	movem.l	(a7)+,d0-d7/a0-a3
	unlk	a6
	rts

Lff74d2:
	cmp.w	#$0008,d1
	bcc.s	Lff74f2
	move.w	d1,d0
	and.l	#$00000003,d0
	asl.w	#2,d0
	lea.l	($00e80018),a0
	adda.l	d0,a0
	cmp.w	#$0004,d1
	bcc.s	Lff7502
	bra.s	Lff74fa

Lff74f2:
	lea.l	($00e80014),a0
	bne.s	Lff7502
Lff74fa:
	bsr.s	Lff7502
	move.w	d3,(a0)
	move.w	d2,-(a0)
	rts

Lff7502:
	move.w	(a0)+,d0
	swap.w	d0
	move.w	(a0),d0
	rts

Lff750a:
	tst.b	($00000993).l
	bne.s	Lff755a
	tst.b	($00000992).l
	bne.s	Lff755a
	move.w	#$0005,($000009bc).l
	move.b	#$ff,($00000992).l
	clr.b	($00000991).l
	rts

Lff7532:
	tst.b	($00000993).l
	bne.s	Lff755a
	move.w	#$0005,($000009bc).l
	clr.b	($00000992).l
	tst.b	($00000991).l
	beq.s	Lff755a
	bsr.w	Lff15e6
	clr.b	($00000991).l
Lff755a:
	rts

Lff755c:
	move.l	d1,-(a7)
	bsr.w	Lff779e
	move.l	(a7)+,d1
	move.l	($00000974).l,d0
	rts

Lff756c:
	movem.l	d1,-(a7)
Lff7570:
	clr.w	d1
	move.b	(a1)+,d1
	beq.s	Lff757c
	bsr.w	Lff779e
	bra.s	Lff7570

Lff757c:
	move.l	($00000974).l,d0
	movem.l	(a7)+,d1
	rts

Lff7588:
	clr.l	d0
	lea.l	($00000994).l,a0
	move.b	(a0),d0
	cmp.w	#$ffff,d1
	beq.s	Lff75a0
	cmp.w	#$0010,d1
	bcc.s	Lff75a2
	move.b	d1,(a0)
Lff75a0:
	rts

Lff75a2:
	moveq.l	#$ff,d0
	rts

Lff75a6:
	move.l	($00000974).l,d0
	cmp.w	#$ffff,d1
	beq.s	Lff75a0
	cmp.w	($00000970).l,d1
	bhi.s	Lff75a2
	cmp.w	($00000972).l,d2
	bhi.s	Lff75a2
	bsr.w	Lff7532
	move.l	d0,-(a7)
	move.w	d1,($00000974).l
	move.w	d2,($00000976).l
	bsr.w	Lff750a
	move.l	(a7)+,d0
	rts

Lff75dc:
	movem.l	d1-d4,-(a7)
	bsr.w	Lff7532
	bsr.w	Lff7f4c
	bra.s	Lff7666

Lff75ea:
	movem.l	d1-d4,-(a7)
	bsr.w	Lff7532
	bsr.w	Lff7f72
	bra.s	Lff7666

Lff75f8:
	movem.l	d1-d4,-(a7)
	bsr.w	Lff7532
	bsr.w	Lff7f8e
	bra.s	Lff7666

Lff7606:
	movem.l	d1-d4,-(a7)
	bsr.w	Lff7532
	bsr.w	Lff7faa
	bra.s	Lff7666

Lff7614:
	movem.l	d1-d4,-(a7)
	bsr.w	Lff7532
	bsr.w	Lff7fd0
	bra.s	Lff7666

Lff7622:
	movem.l	d1-d4,-(a7)
	bsr.w	Lff7532
	bsr.w	Lff7ff6
	bra.s	Lff7666

Lff7630:
	movem.l	d1-d4,-(a7)
	bsr.w	Lff7532
	bsr.w	Lff8010
	bra.s	Lff7666

Lff763e:
	movem.l	d1-d4,-(a7)
	bsr.w	Lff7532
	bsr.w	Lff8050
	bra.s	Lff7666

Lff764c:
	movem.l	d1-d4,-(a7)
	bsr.w	Lff7532
	bsr.w	Lff813a
	bra.s	Lff7666

Lff765a:
	movem.l	d1-d4,-(a7)
	bsr.w	Lff7532
	bsr.w	Lff81ac
Lff7666:
	bsr.w	Lff750a
	movem.l	(a7)+,d1-d4
	rts

Lff7670:
	bsr.w	Lff7532
	move.l	($00000948).l,d0
	cmp.l	#$ffffffff,d1
	beq.s	Lff76a6
	move.l	d1,d0
	clr.w	d0
	swap.w	d0
	lsr.w	#3,d0
	and.l	#$0000fffc,d1
	asl.l	#7,d1
	add.l	d0,d1
	move.l	($00000948).l,d0
	move.l	d1,($00000948).l
	clr.l	($00000974).l
Lff76a6:
	move.l	d0,d1
	and.w	#$fe00,d1
	lsr.l	#7,d1
	and.l	#$0000007f,d0
	asl.w	#3,d0
	swap.w	d0
	or.l	d0,d1
	move.l	($00000970).l,d0
	cmp.l	#$ffffffff,d2
	beq.s	Lff76d4
	move.l	d2,($00000970).l
	clr.l	($00000974).l
Lff76d4:
	move.l	d0,d2
	clr.l	d0
	bra.w	Lff750a

Lff76dc:
	clr.w	d0
	move.b	(a1)+,d0
	bne.s	Lff76e6
	subq.l	#1,a1
	moveq.l	#$20,d0			;' '
Lff76e6:
	cmp.b	#$fe,d0
	bne.s	Lff76ee
	moveq.l	#$20,d0			;' '
Lff76ee:
	cmp.b	#$80,d0
	bcs.s	Lff7718
	beq.s	Lff770c
	cmp.b	#$a0,d0
	bcs.s	Lff7708
	cmp.b	#$e0,d0
	bcs.s	Lff7718
	cmp.b	#$f0,d0
	bcc.s	Lff770c
Lff7708:
	subq.w	#1,d4
	bmi.s	Lff7720
Lff770c:
	asl.w	#8,d0
	move.b	(a1)+,d0
	bne.s	Lff7718
	subq.l	#1,a1
	move.w	#$8140,d0
Lff7718:
	bsr.s	Lff7726
	dbra.w	d4,Lff76dc
	rts

Lff7720:
	moveq.l	#$20,d0			;' '
	bsr.s	Lff7726
	rts

Lff7726:
	movem.l	d1-d5/a1-a3,-(a7)
	move.w	d1,d5
	move.l	d0,d1
	and.l	#$0000ffff,d2
	and.l	#$0000ffff,d3
	asl.l	#7,d3
	asl.l	#4,d3
	add.l	d2,d3
	moveq.l	#$ff,d0
	cmp.l	#$00020000,d3
	bcc.s	Lff7794
	cmp.l	#$00000080,d2
	bcc.s	Lff7794
	add.l	($00000944).l,d3
	movea.l	d3,a2
	moveq.l	#$08,d2
	bsr.w	Lff6d76
	movea.l	d0,a1
	moveq.l	#$7f,d3
	sub.w	d1,d3
	clr.l	d0
	move.b	d5,d0
	and.b	#$0f,d0
	asl.w	#2,d0
	lea.l	(Lff78ce),a3
	movea.l	(a3,d0.w),a3
	move.w	d1,-(a7)
	move.w	($00e8002a),-(a7)
	move.w	#$0033,($00e8002a)	;'3'
	jsr	(a3)
	move.w	(a7)+,($00e8002a)
	move.w	(a7)+,d0
Lff7794:
	movem.l	(a7)+,d1-d5/a1-a3
	addq.l	#1,d0
	add.w	d0,d2
	rts

Lff779e:
	move.b	($00000990).l,d0
	bne.s	Lff77d6
	cmp.w	#$001b,d1
	beq.s	Lff77c4
	cmpi.w	#$0100,d1
	bcc.s	Lff77ea
	cmpi.b	#$80,d1
	bcs.s	Lff77ea
	cmpi.b	#$a0,d1
	bcs.s	Lff77c4
	cmpi.b	#$e0,d1
	bcs.s	Lff77ea
Lff77c4:
	move.b	d1,($00000990).l
	move.l	#$00000986,($00000982).l
	rts

Lff77d6:
	cmp.b	#$1b,d0
	beq.w	Lff7c9e
	clr.b	($00000990).l
	asl.w	#8,d0
	move.b	d1,d0
	move.w	d0,d1
Lff77ea:
	bsr.w	Lff7532
	cmp.w	#$0008,d1
	beq.s	Lff77f6
	bsr.s	Lff784c
Lff77f6:
	bsr.s	Lff77fc
	bra.w	Lff750a

Lff77fc:
	cmpi.w	#$0020,d1		;' '
	bcs.w	Lff7bec
	cmpi.w	#$8140,d1
	bcs.s	Lff7830
	cmpi.w	#$f000,d1
	bcc.s	Lff7830
	move.w	($00000974).l,d0
	cmp.w	($00000970).l,d0
	bne.s	Lff782a
	move.w	d1,-(a7)
	move.w	#$0020,d1		;' '
	bsr.s	Lff7886
	bsr.s	Lff785c
	move.w	(a7)+,d1
Lff782a:
	bsr.s	Lff7886
	bsr.s	Lff7832
	bra.s	Lff7832

Lff7830:
	bsr.s	Lff7886
Lff7832:
	move.w	($00000970).l,d0
	cmp.w	($00000974).l,d0
	bcc.s	Lff7842
	bsr.s	Lff785c
Lff7842:
	addi.w	#$0001,($00000974).l
	rts

Lff784c:
	move.w	($00000970).l,d0
	cmp.w	($00000974).l,d0
	bcs.s	Lff785c
	rts

Lff785c:
	clr.w	($00000974).l
Lff7862:
	addi.w	#$0001,($00000976).l
	move.w	($00000972).l,d0
	cmp.w	($00000976).l,d0
	bcc.s	Lff7884
	subi.w	#$0001,($00000976).l
	bsr.w	Lff7b30
Lff7884:
	rts

Lff7886:
	movem.l	d2-d5/a1-a3,-(a7)
	bsr.w	Lff7a52
	moveq.l	#$08,d2
	bsr.w	Lff6d76
	movea.l	d0,a1
	moveq.l	#$7f,d3
	sub.w	d1,d3
	clr.l	d0
	move.b	($00000994).l,d0
	and.b	#$0f,d0
	asl.w	#2,d0
	lea.l	(Lff78ce),a3
	movea.l	(a3,d0.w),a3
	move.w	($00e8002a),-(a7)
	move.w	#$0033,($00e8002a)	;'3'
	jsr	(a3)
	move.w	(a7)+,($00e8002a)
	movem.l	(a7)+,d2-d5/a1-a3
	rts

Lff78ce:
	.dc.b	$00,$ff,$7a,$02,$00,$ff,$79,$0e
	.dc.b	$00,$ff,$79,$1c,$00,$ff,$79,$2a
	.dc.b	$00,$ff,$7a,$02,$00,$ff,$79,$82
	.dc.b	$00,$ff,$79,$8e,$00,$ff,$79,$9a
	.dc.b	$00,$ff,$7a,$02,$00,$ff,$79,$4a
	.dc.b	$00,$ff,$79,$58,$00,$ff,$79,$66
	.dc.b	$00,$ff,$7a,$02,$00,$ff,$79,$d6
	.dc.b	$00,$ff,$79,$e8,$00,$ff,$7a,$10
	.dc.b	$48,$e7,$20,$20,$61,$16,$4c,$df
	.dc.b	$04,$04,$60,$00,$00,$c6,$48,$e7
	.dc.b	$20,$20,$61,$08,$4c,$df,$04,$04
	.dc.b	$60,$00,$00,$ca,$08,$f9,$00,$00
	.dc.b	$00,$e8,$00,$2a,$38,$01,$14,$d9
	.dc.b	$51,$cc,$ff,$fc,$d5,$c3,$51,$ca
	.dc.b	$ff,$f4
Lff7940:
	bclr.b	#$00,($00e8002a)
	rts

Lff794a:
	movem.l	d2/a2,-(a7)
	bsr.s	Lff7966
	movem.l	(a7)+,d2/a2
	bra.w	Lff79e0

Lff7958:
	movem.l	d2/a2,-(a7)
	bsr.s	Lff7966
	movem.l	(a7)+,d2/a2
	bra.w	Lff79f2

Lff7966:
	bset.b	#$00,($00e8002a)
Lff796e:
	move.w	d1,d4
Lff7970:
	move.b	(a1)+,d0
	not.b	d0
	move.b	d0,(a2)+
	dbra.w	d4,Lff7970
	adda.l	d3,a2
	dbra.w	d2,Lff796e
	bra.s	Lff7940

Lff7982:
	movem.l	d2/a2,-(a7)
	bsr.s	Lff799a
	movem.l	(a7)+,d2/a2
	bra.s	Lff79e0

Lff798e:
	movem.l	d2/a2,-(a7)
	bsr.s	Lff799a
	movem.l	(a7)+,d2/a2
	bra.s	Lff79f2

Lff799a:
	bset.b	#$00,($00e8002a)
	tst.w	d1
	bne.s	Lff79b8
Lff79a6:
	move.b	(a1)+,d0
	move.b	d0,d4
	lsr.b	#1,d4
	or.b	d4,d0
	move.b	d0,(a2)+
	adda.l	d3,a2
	dbra.w	d2,Lff79a6
	bra.s	Lff7940

Lff79b8:
	move.b	(a1)+,d0
	asl.w	#8,d0
	move.b	(a1)+,d0
	move.w	d0,d4
	lsr.w	#1,d4
	or.w	d4,d0
	move.w	d0,d4
	lsr.w	#8,d4
	move.b	d4,(a2)+
	move.b	d0,(a2)+
	adda.l	d3,a2
	dbra.w	d2,Lff79b8
	bra.w	Lff7940

Lff79d6:
	movem.l	d2/a2,-(a7)
	bsr.s	Lff7a10
	movem.l	(a7)+,d2/a2
Lff79e0:
	adda.l	#$00020000,a2
	bra.s	Lff79f2

Lff79e8:
	movem.l	d2/a2,-(a7)
	bsr.s	Lff7a10
	movem.l	(a7)+,d2/a2
Lff79f2:
	move.w	d1,d4
Lff79f4:
	clr.b	(a2)+
	dbra.w	d4,Lff79f4
	adda.l	d3,a2
	dbra.w	d2,Lff79f2
	rts

Lff7a02:
	bset.b	#$00,($00e8002a)
	bsr.s	Lff79f2
	bra.w	Lff7940

Lff7a10:
	bset.b	#$00,($00e8002a)
	tst.w	d1
	bne.s	Lff7a32
Lff7a1c:
	move.b	(a1)+,d0
	move.b	d0,d4
	lsr.b	#1,d4
	or.b	d4,d0
	not.b	d0
	move.b	d0,(a2)+
	adda.l	d3,a2
	dbra.w	d2,Lff7a1c
	bra.w	Lff7940

Lff7a32:
	move.b	(a1)+,d0
	asl.w	#8,d0
	move.b	(a1)+,d0
	move.w	d0,d4
	lsr.w	#1,d4
	or.w	d4,d0
	not.w	d0
	move.w	d0,d4
	lsr.w	#8,d4
	move.b	d4,(a2)+
	move.b	d0,(a2)+
	adda.l	d3,a2
	dbra.w	d2,Lff7a32
	bra.w	Lff7940

Lff7a52:
	clr.l	d5
	clr.l	d4
	move.w	($00000974).l,d4
	move.w	($00000976).l,d5
	asl.l	#7,d5
	asl.l	#4,d5
	add.l	d4,d5
	add.l	($00000948).l,d5
	add.l	($00000944).l,d5
	movea.l	d5,a2
	rts

Lff7a78:
	movea.l	($00000944).l,a0
	adda.l	($00000948).l,a0
	move.w	($00000972).l,d0
	addq.w	#1,d0
	asl.w	#4,d0
	asl.w	#5,d0
	subq.w	#1,d0
Lff7a92:
	bset.b	#$00,($00e8002a)
	movem.l	d1-d2/a1,-(a7)
	clr.l	d2
	move.b	($00000994).l,d1
	btst.l	#$03,d1
	beq.s	Lff7ae2
	and.l	#$00000003,d1
	beq.s	Lff7ae2
	moveq.l	#$ff,d2
	cmp.b	#$03,d1
	beq.s	Lff7ae2
	movea.l	a0,a1
	adda.l	#$00020000,a1
	bclr.b	#$00,($00e8002a)
	cmp.b	#$02,d1
	beq.s	Lff7ad4
	exg.l	a0,a1
Lff7ad4:
	clr.l	(a0)+
	move.l	d2,(a1)+
	dbra.w	d0,Lff7ad4
	movem.l	(a7)+,d1-d2/a1
	rts

Lff7ae2:
	move.l	d2,(a0)+
	dbra.w	d0,Lff7ae2
	movem.l	(a7)+,d1-d2/a1
	bra.w	Lff7940

Lff7af0:
	movem.l	d1-d2,-(a7)
	move.l	($00000948).l,d0
	lsr.l	#7,d0
	lsr.l	#2,d0
	move.w	($00000972).l,d1
	addq.w	#1,d1
	asl.w	#2,d1
	subq.w	#1,d1
	add.w	d1,d0
	move.l	d0,d1
	subq.w	#4,d1
	asl.w	#8,d1
	move.b	d0,d1
	move.w	($00000972).l,d0
	asl.w	#2,d0
	move.w	#$feff,d2
	bsr.s	Lff7b9e
	clr.l	d1
	moveq.l	#$01,d0
	bsr.w	Lff811e
	movem.l	(a7)+,d1-d2
	rts

Lff7b30:
	movem.l	d1-d2,-(a7)
	move.l	($00000948).l,d0
	lsr.l	#7,d0
	lsr.l	#2,d0
	move.l	d0,d1
	addq.w	#4,d1
	asl.w	#8,d1
	move.b	d0,d1
	move.w	($00000972).l,d0
	asl.w	#2,d0
	move.w	#$0101,d2
	bsr.s	Lff7b9e
	clr.l	d1
	move.w	($00000972).l,d1
	moveq.l	#$01,d0
	bsr.w	Lff811e
	movem.l	(a7)+,d1-d2
	rts

Lff7b68:
	movem.l	d1-d2,-(a7)
	move.w	($00e8002a),-(a7)
	move.w	d3,d0
	and.w	#$000f,d0
	or.w	#$0100,d0
	move.w	d0,($00e8002a)
	move.w	#$0101,d0
	tst.w	d3
	bpl.s	Lff7b8e
	move.w	#$feff,d0
Lff7b8e:
	exg.l	d0,d2
	bsr.s	Lff7b9e
	move.w	(a7)+,($00e8002a)
	movem.l	(a7)+,d1-d2
	rts

Lff7b9e:
	subq.w	#1,d0
	bmi.s	Lff7bea
	clr.b	($00e88005)
	bset.b	#$00,($00e8002a)
Lff7bb0:
	ori.w	#$0700,sr
Lff7bb4:
	btst.b	#$07,($00e88001)
	beq.s	Lff7bb4
	move.w	d1,($00e8002c)
	move.w	#$0008,($00e80480)
	andi.w	#$f8ff,sr
	add.w	d2,d1
	dbra.w	d0,Lff7bb0
Lff7bd6:
	btst.b	#$07,($00e88001)
	beq.s	Lff7bd6
	clr.w	($00e80480)
	bra.w	Lff7940

Lff7bea:
	rts

Lff7bec:
	cmp.b	#$07,d1
	beq.w	Lff9da4
	cmpi.b	#$08,d1
	bne.s	Lff7c24
	tst.w	($00000974).l
	beq.s	Lff7c0a
	subq.w	#1,($00000974).l
	rts

Lff7c0a:
	tst.w	($00000976).l
	beq.s	Lff7c22
	move.w	($00000970).l,($00000974).l
	subq.w	#1,($00000976).l
Lff7c22:
	rts

Lff7c24:
	cmpi.b	#$09,d1
	bne.s	Lff7c4a
	move.w	($00000974).l,d0
	addq.w	#8,d0
	and.w	#$fff8,d0
	move.w	($00000970).l,d1
	cmp.w	d0,d1
	bcs.w	Lff785c
	move.w	d0,($00000974).l
	rts

Lff7c4a:
	cmpi.b	#$0a,d1
	beq.w	Lff7862
	cmpi.b	#$0b,d1
	bne.s	Lff7c68
	tst.w	($00000976).l
	beq.s	Lff7c66
	subq.w	#1,($00000976).l
Lff7c66:
	rts

Lff7c68:
	cmpi.b	#$0c,d1
	beq.w	Lff7832
	cmpi.b	#$0d,d1
	bne.s	Lff7c7e
	clr.w	($00000974).l
	rts

Lff7c7e:
	cmp.b	#$1a,d1
	bne.s	Lff7c96
Lff7c84:
	bsr.w	Lff7a78
Lff7c88:
	clr.w	($00000974).l
	clr.w	($00000976).l
	rts

Lff7c96:
	cmp.b	#$1e,d1
	beq.s	Lff7c88
	rts

Lff7c9e:
	movem.l	d1-d7/a0-a6,-(a7)
	movea.l	($00000982).l,a1
	move.b	d1,(a1)+
	cmpa.l	#$0000098f,a1
	beq.s	Lff7cb8
	move.l	a1,($00000982).l
Lff7cb8:
	move.b	($00000986).l,d0
	cmp.b	#$5b,d0			;'['
	beq.s	Lff7ce8
	cmp.b	#$3d,d0			;'='
	beq.s	Lff7d26
	bsr.w	Lff7532
	cmp.b	#$2a,d0			;'*'
	beq.s	Lff7d0e
	cmp.b	#$44,d0			;'D'
	beq.s	Lff7d14
	cmp.b	#$45,d0			;'E'
	beq.s	Lff7d1a
	cmp.b	#$4d,d0			;'M'
	beq.s	Lff7d20
	bra.s	Lff7cfe

Lff7ce8:
	move.b	d1,d0
	or.b	#$20,d0
	sub.b	#$61,d0			;'a'
	cmp.b	#$1a,d0
	bcc.s	Lff7d08
	bsr.w	Lff7532
	bsr.s	Lff7d50
Lff7cfe:
	clr.b	($00000990).l
	bsr.w	Lff750a
Lff7d08:
	movem.l	(a7)+,d1-d7/a0-a6
	rts

Lff7d0e:
	bsr.w	Lff7c84
	bra.s	Lff7cfe

Lff7d14:
	bsr.w	Lff7f4c
	bra.s	Lff7cfe

Lff7d1a:
	bsr.w	Lff785c
	bra.s	Lff7cfe

Lff7d20:
	bsr.w	Lff7f72
	bra.s	Lff7cfe

Lff7d26:
	cmpa.l	#$00000989,a1
	bne.s	Lff7d08
	bsr.w	Lff7532
	clr.w	d1
	clr.w	d2
	move.b	($00000987).l,d2
	move.b	($00000988).l,d1
	sub.w	#$0020,d1
	sub.w	#$0020,d2
	bsr.w	Lff7f28
	bra.s	Lff7cfe

Lff7d50:
	lea.l	($00000986).l,a0
	cmpi.b	#$5b,(a0)+		;'['
	bne.w	Lff7e62
	cmpi.b	#$3e,(a0)		;'>'
	bne.s	Lff7d90
	move.w	($0001,a0),d0
	clr.w	d1
	cmp.w	#$356c,d0		;'5l'
	beq.s	Lff7d78
	not.w	d1
	cmp.w	#$3568,d0		;'5h'
	bne.s	Lff7d80
Lff7d78:
	move.b	d1,($00000993).l
	rts

Lff7d80:
	movea.l	($0000097e).l,a0
	move.l	a0,-(a7)
	lea.l	($00000986).l,a0
	rts

Lff7d90:
	bsr.w	Lff7f00
	cmp.b	#$41,d0			;'A'
	beq.w	Lff7f8e
	cmp.b	#$42,d0			;'B'
	beq.w	Lff7faa
	cmp.b	#$43,d0			;'C'
	beq.w	Lff7fd0
	cmp.b	#$44,d0			;'D'
	beq.w	Lff7ff6
	cmp.b	#$6e,d0			;'n'
	beq.w	Lff7e62
	cmp.b	#$73,d0			;'s'
	beq.w	Lff7eb4
	cmp.b	#$75,d0			;'u'
	beq.w	Lff7eda
	cmp.b	#$4a,d0			;'J'
	beq.w	Lff8010
	cmp.b	#$4b,d0			;'K'
	beq.w	Lff8050
	cmp.b	#$4d,d0			;'M'
	beq.w	Lff81ac
	cmp.b	#$4c,d0			;'L'
	beq.w	Lff813a
	cmp.b	#$6d,d0			;'m'
	beq.s	Lff7e38
	cmp.b	#$3b,d0			;';'
	bne.s	Lff7d80
	move.w	d1,d2
	bsr.w	Lff7f00
	cmp.b	#$48,d0			;'H'
	beq.w	Lff7e9a
	cmp.b	#$66,d0			;'f'
	beq.w	Lff7e9a
	cmp.b	#$6d,d0			;'m'
	beq.s	Lff7e34
	cmp.b	#$3b,d0			;';'
	bne.w	Lff7d80
	move.w	d1,d3
	bsr.w	Lff7f00
	cmp.b	#$6d,d0			;'m'
	bne.w	Lff7d80
	move.w	d2,d0
	bsr.s	Lff7e3a
	move.w	d3,d0
	bsr.s	Lff7e3a
	bra.s	Lff7e38

Lff7e34:
	move.w	d2,d0
	bsr.s	Lff7e3a
Lff7e38:
	move.w	d1,d0
Lff7e3a:
	tst.b	d0
	beq.s	Lff7e64
	cmp.b	#$01,d0
	beq.s	Lff7e6e
	cmp.b	#$07,d0
	beq.s	Lff7e78
	cmp.b	#$1e,d0
	bcs.s	Lff7e62
	cmp.b	#$26,d0			;'&'
	bcs.s	Lff7e82
	cmp.b	#$28,d0			;'('
	bcs.s	Lff7e62
	cmp.b	#$30,d0			;'0'
	bcs.s	Lff7e8e
Lff7e62:
	rts

Lff7e64:
	move.b	#$03,($00000994).l
	rts

Lff7e6e:
	eori.b	#$04,($00000994).l
	rts

Lff7e78:
	eori.b	#$08,($00000994).l
	rts

Lff7e82:
	sub.b	#$1e,d0
	move.b	d0,($00000994).l
	rts

Lff7e8e:
	sub.b	#$20,d0			;' '
	move.b	d0,($00000994).l
	rts

Lff7e9a:
	cmp.w	#$8000,d1
	bne.s	Lff7ea2
	moveq.l	#$01,d1
Lff7ea2:
	cmp.w	#$8000,d2
	bne.s	Lff7eaa
	moveq.l	#$01,d2
Lff7eaa:
	subq.w	#1,d1
	bmi.s	Lff7e62
	subq.w	#1,d2
	bmi.s	Lff7e62
	bra.s	Lff7f28

Lff7eb4:
	cmp.w	#$8000,d1
	bne.s	Lff7e62
	move.w	($00000974).l,($00000996).l
	move.w	($00000976).l,($00000998).l
	move.b	($00000994).l,($00000995).l
	rts

Lff7eda:
	cmp.w	#$8000,d1
	bne.s	Lff7e62
	move.w	($00000996).l,($00000974).l
	move.w	($00000998).l,($00000976).l
	move.b	($00000995).l,($00000994).l
	rts

Lff7f00:
	move.w	#$8000,d1
	clr.w	d0
Lff7f06:
	move.b	(a0)+,d0
	cmp.b	#$20,d0			;' '
	beq.s	Lff7f06
	cmp.b	#$30,d0			;'0'
	bcs.s	Lff7f26
	cmp.b	#$3a,d0			;':'
	bcc.s	Lff7f26
	sub.b	#$30,d0			;'0'
	mulu.w	#$000a,d1
	add.w	d0,d1
	bra.s	Lff7f06

Lff7f26:
	rts

Lff7f28:
	cmp.w	($00000970).l,d1
	bhi.w	Lff75a2
	cmp.w	($00000972).l,d2
	bhi.w	Lff75a2
	move.w	d1,($00000974).l
	move.w	d2,($00000976).l
	clr.l	d0
	rts

Lff7f4c:
	addi.w	#$0001,($00000976).l
	move.w	($00000972).l,d0
	cmp.w	($00000976).l,d0
	bcc.s	Lff7f6e
	subi.w	#$0001,($00000976).l
	bsr.w	Lff7b30
Lff7f6e:
	clr.l	d0
	rts

Lff7f72:
	tst.w	($00000976).l
	beq.s	Lff7f86
	subi.w	#$0001,($00000976).l
	clr.l	d0
	rts

Lff7f86:
	bsr.w	Lff7af0
	clr.l	d0
	rts

Lff7f8e:
	and.w	#$00ff,d1
	bne.s	Lff7f96
	moveq.l	#$01,d1
Lff7f96:
	move.w	($00000976).l,d0
	sub.w	d1,d0
	bmi.s	Lff7fa6
	move.w	d0,($00000976).l
Lff7fa6:
	clr.l	d0
	rts

Lff7faa:
	and.w	#$00ff,d1
	bne.s	Lff7fb2
	moveq.l	#$01,d1
Lff7fb2:
	add.w	d1,($00000976).l
	move.w	($00000972).l,d0
	cmp.w	($00000976).l,d0
	bcc.s	Lff7fcc
	move.w	d0,($00000976).l
Lff7fcc:
	clr.l	d0
	rts

Lff7fd0:
	and.w	#$00ff,d1
	bne.s	Lff7fd8
	moveq.l	#$01,d1
Lff7fd8:
	add.w	d1,($00000974).l
	move.w	($00000970).l,d0
	cmp.w	($00000974).l,d0
	bcc.s	Lff7ff2
	move.w	d0,($00000974).l
Lff7ff2:
	clr.l	d0
	rts

Lff7ff6:
	and.w	#$00ff,d1
	bne.s	Lff7ffe
	moveq.l	#$01,d1
Lff7ffe:
	sub.w	d1,($00000974).l
	bpl.s	Lff800c
	clr.w	($00000974).l
Lff800c:
	clr.l	d0
	rts

Lff8010:
	tst.b	d1
	beq.s	Lff8024
	subq.b	#1,d1
	beq.s	Lff8040
	subq.b	#1,d1
	bne.w	Lff75a2
	bsr.w	Lff7c84
Lff8022:
	rts

Lff8024:
	clr.l	d1
	move.w	($00000972).l,d0
	move.w	($00000976).l,d1
	sub.w	d1,d0
	beq.s	Lff8070
	bcs.s	Lff8022
	addq.w	#1,d1
	bsr.w	Lff811e
	bra.s	Lff8070

Lff8040:
	clr.l	d1
	move.w	($00000976).l,d0
	beq.s	Lff8084
	bsr.w	Lff811e
	bra.s	Lff8084

Lff8050:
	tst.b	d1
	beq.s	Lff8070
	subq.b	#1,d1
	beq.s	Lff8084
	subq.b	#1,d1
	bne.w	Lff75a2
	clr.l	d1
	move.w	($00000976).l,d1
	moveq.l	#$01,d0
	bsr.w	Lff811e
	clr.l	d0
	rts

Lff8070:
	clr.l	d2
	move.w	($00000974).l,d2
	move.w	($00000970).l,d0
	sub.w	d2,d0
	bcs.s	Lff8022
	bra.s	Lff808c

Lff8084:
	clr.l	d2
	move.w	($00000974).l,d0
Lff808c:
	clr.l	d1
	move.w	($00000976).l,d1
	asl.l	#7,d1
	asl.l	#4,d1
	add.l	d2,d1
	add.l	($00000948).l,d1
	add.l	($00000944).l,d1
	movea.l	d1,a0
	moveq.l	#$7f,d3
	sub.w	d0,d3
	moveq.l	#$0f,d4
	bset.b	#$00,($00e8002a)
	clr.w	d2
	move.b	($00000994).l,d1
	btst.l	#$03,d1
	beq.s	Lff810a
	and.l	#$00000003,d1
	beq.s	Lff810a
	moveq.l	#$ff,d2
	cmp.b	#$03,d1
	beq.s	Lff810a
	movem.l	a1,-(a7)
	movea.l	a0,a1
	adda.l	#$00020000,a1
	bclr.b	#$00,($00e8002a)
	cmp.b	#$02,d1
	beq.s	Lff80f0
	exg.l	a0,a1
Lff80f0:
	move.w	d0,d1
Lff80f2:
	clr.b	(a0)+
	move.b	d2,(a1)+
	dbra.w	d1,Lff80f2
	adda.l	d3,a0
	adda.l	d3,a1
	dbra.w	d4,Lff80f0
	movem.l	(a7)+,a1
	clr.l	d0
	rts

Lff810a:
	move.w	d0,d1
Lff810c:
	move.b	d2,(a0)+
	dbra.w	d1,Lff810c
	adda.l	d3,a0
	dbra.w	d4,Lff810a
	clr.l	d0
	bra.w	Lff7940

Lff811e:
	asl.l	#7,d1
	asl.l	#4,d1
	add.l	($00000948).l,d1
	add.l	($00000944).l,d1
	movea.l	d1,a0
	asl.w	#4,d0
	asl.w	#5,d0
	subq.w	#1,d0
	bra.w	Lff7a92

Lff813a:
	tst.b	d1
	bne.s	Lff8140
	moveq.l	#$01,d1
Lff8140:
	and.b	#$ff,d1
	move.w	($00000972).l,d3
	move.w	($00000976).l,d2
	move.w	d3,d0
	addq.w	#1,d0
	sub.w	d2,d0
	cmp.w	d0,d1
	bcc.s	Lff819a
	movem.l	d1-d2,-(a7)
	move.w	d1,d4
	move.l	($00000948).l,d0
	lsr.l	#7,d0
	lsr.l	#2,d0
	move.w	d3,d1
	addq.w	#1,d1
	asl.w	#2,d1
	subq.w	#1,d1
	add.w	d1,d0
	move.l	d0,d1
	sub.w	d4,d1
	sub.w	d4,d1
	sub.w	d4,d1
	sub.w	d4,d1
	asl.w	#8,d1
	move.b	d0,d1
	move.w	d3,d0
	addq.w	#1,d0
	sub.w	d2,d0
	sub.w	d4,d0
	asl.w	#2,d0
	move.w	#$feff,d2
	bsr.w	Lff7b9e
	movem.l	(a7)+,d1-d2
	move.w	d1,d0
Lff819a:
	clr.l	d1
	move.w	d2,d1
	bsr.w	Lff811e
	clr.l	d0
	move.w	d0,($00000974).l
	rts

Lff81ac:
	tst.b	d1
	bne.s	Lff81b2
	moveq.l	#$01,d1
Lff81b2:
	and.b	#$ff,d1
	move.w	($00000972).l,d3
	move.w	($00000976).l,d2
	move.w	d3,d0
	addq.w	#1,d0
	sub.w	d2,d0
	cmp.w	d0,d1
	bcc.s	Lff820c
	movem.l	d0-d2,-(a7)
	move.w	d1,d4
	move.l	($00000948).l,d0
	lsr.l	#7,d0
	lsr.l	#2,d0
	move.w	d2,d1
	asl.w	#2,d1
	add.w	d1,d0
	move.l	d0,d1
	add.w	d4,d1
	add.w	d4,d1
	add.w	d4,d1
	add.w	d4,d1
	asl.w	#8,d1
	move.b	d0,d1
	move.w	d3,d0
	addq.w	#1,d0
	sub.w	d2,d0
	sub.w	d4,d0
	asl.w	#2,d0
	move.w	#$0101,d2
	bsr.w	Lff7b9e
	movem.l	(a7)+,d0-d2
	sub.w	d1,d0
	add.w	d0,d2
	move.w	d1,d0
Lff820c:
	clr.l	d1
	move.w	d2,d1
	bsr.w	Lff811e
	clr.l	d0
	move.w	d0,($00000974).l
	rts

Lff821e:
	cmp.w	#$ffff,d1
	beq.w	Lff82fa
	move.w	d1,-(a7)
	clr.w	d0
	move.b	d1,d0
	cmp.b	#$08,d0
	bcs.s	Lff8236
	move.w	#$0004,d0
Lff8236:
	add.w	d0,d0
	lea.l	(Lff8304),a0
	move.w	(a0,d0.w),d0
	lea.l	($00e98004),a0
	move.w	#$000e,(a0)
	move.w	#$0002,(a0)
	move.w	#$000c,(a0)
	move.w	d0,(a0)
	ror.w	#8,d0
	move.w	#$000d,(a0)
	move.w	d0,(a0)
	lsr.w	#8,d1
	move.w	d1,d0
	lsr.b	#4,d0
	cmp.b	#$04,d0
	bcc.s	Lff826e
	or.w	#$000c,d0
Lff826e:
	or.w	#$0040,d0
	move.w	#$0004,(a0)
	move.w	d0,(a0)
	clr.w	d0
	move.b	d0,($00000928).l
	move.b	d0,($00000929).l
	lsr.w	#2,d1
	and.w	#$0003,d1
	move.w	d1,-(a7)
	move.w	#$ff1f,d0
	rol.w	d1,d0
	move.b	d0,($00000cb5).l
	move.w	(a7)+,d1
	beq.s	Lff82a8
	cmp.w	#$0003,d1
	beq.s	Lff82a8
	eori.w	#$0003,d1
Lff82a8:
	asl.w	#5,d1
	move.w	d1,d0
	or.b	#$8a,d0
	move.w	#$0005,(a0)
	move.w	d0,(a0)
	asl.w	#1,d1
	move.w	#$0003,(a0)
	move.w	d1,(a0)
	clr.w	($0000089c).l
	move.l	#$000008a6,d0
	move.l	d0,($0000089e).l
	move.l	d0,($000008a2).l
	or.b	#$01,d1
	move.w	#$0003,(a0)
	move.w	d1,(a0)
	move.w	#$000e,(a0)
	move.w	#$0003,(a0)
	move.w	(a7)+,d1
	clr.l	d0
	move.w	($00000926).l,d0
	move.w	d1,($00000926).l
	rts

Lff82fa:
	clr.l	d0
	move.w	($00000926).l,d0
	rts

Lff8304:
	.dc.b	$08,$21,$04,$10,$02,$07,$01,$02
	.dc.b	$00,$80,$00,$3f,$00,$1f,$00,$0e
	.dc.b	$30,$39,$00,$00,$08,$9c,$4e,$75
Lff831c:
	bsr.s	Lff8368
	swap.w	d0
	beq.s	Lff831c
	clr.w	d0
	move.l	a0,($000008a2).l
	subq.w	#1,($0000089c).l
	swap.w	d0
	btst.b	#$01,($00000926).l
	beq.s	Lff8366
	btst.b	#$00,($00000929).l
	beq.s	Lff8366
	cmpi.w	#$0010,($0000089c).l
	bcc.s	Lff8366
	movem.l	d0-d1,-(a7)
	bclr.b	#$00,($00000929).l
	moveq.l	#$11,d1
	bsr.w	Lff842a
	movem.l	(a7)+,d0-d1
Lff8366:
	rts

Lff8368:
	clr.l	d0
	tst.w	($0000089c).l
	beq.s	Lff838e
	movea.l	($000008a2).l,a0
	addq.l	#2,a0
	cmpa.l	#$00000926,a0
	bcs.s	Lff8388
	movea.l	#$000008a6,a0
Lff8388:
	moveq.l	#$01,d0
	swap.w	d0
	move.w	(a0),d0
Lff838e:
	rts

Lff8390:
	clr.l	d0
	btst.b	#$01,($00000926).l
	beq.s	Lff83a6
	btst.b	#$01,($00000929).l
	bne.s	Lff83b6
Lff83a6:
	lea.l	($00e98004),a0
	move.w	#$0000,(a0)
	move.w	(a0),d0
	and.w	#$0004,d0
Lff83b6:
	rts

Lff83b8:
	btst.b	#$01,($00000926).l
	beq.s	Lff83ce
	btst.b	#$01,($00000929).l
	beq.s	Lff83ce
	bra.s	Lff83b8

Lff83ce:
	btst.b	#$00,($00000926).l
	beq.s	Lff842a
	cmp.b	#$0f,d1
	beq.s	Lff840e
	cmp.b	#$0e,d1
	beq.s	Lff840e
	btst.l	#$07,d1
	beq.s	Lff8410
	move.w	d1,-(a7)
	and.b	#$7f,d1
	btst.b	#$01,($00000928).l
	bne.s	Lff840a
	bset.b	#$01,($00000928).l
	move.l	d1,-(a7)
	moveq.l	#$0f,d1
	bsr.s	Lff842a
	move.l	(a7)+,d1
Lff840a:
	bsr.s	Lff842a
	move.w	(a7)+,d1
Lff840e:
	rts

Lff8410:
	btst.b	#$01,($00000928).l
	beq.s	Lff842a
	move.l	d1,-(a7)
	bclr.b	#$01,($00000928).l
	moveq.l	#$0e,d1
	bsr.s	Lff842a
	move.l	(a7)+,d1
Lff842a:
	bsr.w	Lff83a6
	beq.s	Lff842a
	move.w	d1,($00e98006)
	rts

Lff8438:
	tst.l	d1
	beq.s	Lff8450
	move.l	d1,($00000938).l
	move.w	d2,($000009b2).l
	move.w	d2,($000009b4).l
	rts

Lff8450:
	move.l	#Lffa2de,($00000938).l
	move.w	#$0001,($000009b2).l
	move.w	#$0001,($000009b4).l
	rts

Lff846c:
	tst.l	d1
	beq.s	Lff8478
	move.l	d1,($0000097e).l
	rts

Lff8478:
	move.l	#Lff0d3c,($0000097e).l
	rts

Lff8484:
	moveq.l	#$ff,d0
	cmp.l	#$00000006,d2
	bcc.s	Lff849e
	move.l	d2,d0
	asl.l	#2,d0
	lea.l	($0000099a).l,a0
	adda.l	d0,a0
	move.l	(a0),d0
	move.l	d1,(a0)
Lff849e:
	rts

Lff84a0:
	lea.l	($00000978).l,a0
	move.l	(a0),d0
	move.l	d1,(a0)+
	move.l	d0,d1
	move.w	(a0),d0
	move.w	d2,(a0)+
	move.w	d0,d2
	clr.l	d0
	rts

Lff84b6:
	move.l	a1,d0
	bne.s	Lff84c0
	lea.l	(Lff0d54),a1
Lff84c0:
	move.l	#$00000061.l,d0
	lea.l	($00000a16).l,a0
Lff84cc:
	move.b	(a1)+,(a0)+
	dbra.w	d0,Lff84cc
	rts

Lff84d4:
	clr.l	d0
	cmp.w	#$0002,d1
	bcc.s	Lff84ea
	move.w	d1,d0
	add.w	d0,d0
	lea.l	($00e9a001),a0
	move.b	(a0,d0.w),d0
Lff84ea:
	rts

Lff84ec:
	move.b	#$01,($00e8c003)
	clr.l	($00000a10).l
	clr.w	($00000a14).l
	move.w	d1,($00000a78).l
	move.b	($00e9c001),d0
	and.l	#$00000020,d0
	rts

Lff8514:
	move.l	($00ed003c),d0
	tst.w	($00000cb6).l
	beq.s	Lff852a
	lsr.l	#1,d0
	add.l	($00ed003c),d0
Lff852a:
	btst.b	#$05,($00e9c001)
	bne.s	Lff8560
	tst.b	($00000a10).l
	bne.s	Lff855e
	subq.l	#1,d0
	bne.s	Lff852a
	movem.l	d1-d7/a0-a6,-(a7)
	move.w	#$7009,d7
	trap	#14
	move.w	d7,d0
	movem.l	(a7)+,d1-d7/a0-a6
	cmp.b	#$02,d0
	bne.s	Lff8514
	move.b	#$01,($00000a10).l
Lff855e:
	rts

Lff8560:
	clr.b	($00000a10).l
	move.b	d1,($00e8c001)
	clr.b	($00e8c003)
	bsr.s	Lff857c
	move.b	#$01,($00e8c003)
Lff857c:
	rts

Lff857e:
	move.b	($00000a12).l,d0
	bne.s	Lff8600
	cmp.b	#$09,d1
	beq.w	Lff86e6
	cmp.b	#$0a,d1
	beq.w	Lff86a2
	cmp.b	#$0d,d1
	beq.w	Lff86d4
	cmp.b	#$0c,d1
	beq.w	Lff86be
	cmp.b	#$1a,d1
	beq.w	Lff86f6
	cmp.b	#$20,d1			;' '
	bcs.s	Lff85f2
	cmp.b	#$80,d1
	bcs.w	Lff874c
	cmp.b	#$a0,d1
	bcs.s	Lff85ca
	cmp.b	#$e0,d1
	bcs.w	Lff874c
Lff85ca:
	move.b	d1,($00000a12).l
	rts

Lff85d2:
	move.b	($00000a79).l,d0
	cmp.b	($00000a15).l,d0
	bcc.s	Lff85e8
	move.w	d1,-(a7)
	bsr.w	Lff86f6
	move.w	(a7)+,d1
Lff85e8:
	bsr.w	Lff870e
Lff85ec:
	addq.w	#1,($00000a14).l
Lff85f2:
	movem.l	d0-d1,-(a7)
	IOCS	_OUTLPT
	movem.l	(a7)+,d0-d1
	rts

Lff8600:
	clr.b	($00000a12).l
	asl.w	#8,d0
	or.w	d0,d1
	cmp.w	#$8000,d0
	beq.w	Lff8758
	cmp.w	#$f000,d0
	bcc.w	Lff8758
	cmpi.b	#-$01,($00000a79).l
	beq.s	Lff863e
	move.w	($00000a14).l,d0
	addq.w	#1,d0
	cmp.b	($00000a79).l,d0
	bcs.s	Lff863e
	beq.s	Lff863e
	move.w	d1,-(a7)
	bsr.w	Lff86f6
	move.w	(a7)+,d1
Lff863e:
	bsr.w	Lffb75a
	cmp.w	#$7600,d1
	bcc.s	Lff8684
	cmp.w	#$5000,d1
	bcc.s	Lff8676
	cmp.w	#$2e00,d1
	bcc.s	Lff8668
	cmp.w	#$2c00,d1
	bcs.s	Lff8668
	btst.b	#$01,($00000a77).l
	bne.w	Lff87ba
	bra.s	Lff8690

Lff8668:
	btst.b	#$03,($00000a77).l
	bne.w	Lff87ba
	bra.s	Lff8690

Lff8676:
	btst.b	#$02,($00000a77).l
	bne.w	Lff87ba
	bra.s	Lff8690

Lff8684:
	btst.b	#$00,($00000a77).l
	bne.w	Lff87ba
Lff8690:
	bsr.w	Lff8728
	move.w	d1,-(a7)
	lsr.w	#8,d1
	bsr.w	Lff85ec
	move.w	(a7)+,d1
	bra.w	Lff85ec

Lff86a2:
	bsr.s	Lff870e
	bsr.w	Lff89a8
	addq.b	#1,($00000a13).l
	move.b	($00000a78).l,d0
	cmp.b	($00000a13).l,d0
	bcs.s	Lff86c4
	rts

Lff86be:
	clr.w	($00000a14).l
Lff86c4:
	clr.b	($00000a13).l
	move.w	#$000c,d1
	bsr.w	Lff85f2
	rts

Lff86d4:
	move.w	#$000d,d1
	bsr.s	Lff870e
	bsr.w	Lff85f2
	clr.w	($00000a14).l
	rts

Lff86e6:
	bsr.s	Lff870e
Lff86e8:
	move.b	($00000a79).l,d0
	cmp.b	($00000a15).l,d0
	bcc.s	Lff86fa
Lff86f6:
	bsr.s	Lff86d4
	bra.s	Lff86a2

Lff86fa:
	moveq.l	#$20,d1			;' '
	bsr.w	Lff85ec
	move.w	($00000a14).l,d0
	and.w	#$0007,d0
	bne.s	Lff86e8
	rts

Lff870e:
	tst.b	($00000a11).l
	beq.s	Lff874a
	clr.b	($00000a11).l
	movem.l	d0-d1/a0,-(a7)
	lea.l	($00000a30).l,a0
	bra.s	Lff8742

Lff8728:
	tst.b	($00000a11).l
	bne.s	Lff874a
	move.b	#$01,($00000a11).l
	movem.l	d0-d1/a0,-(a7)
	lea.l	($00000a28).l,a0
Lff8742:
	bsr.w	Lff8992
	movem.l	(a7)+,d0-d1/a0
Lff874a:
	rts

Lff874c:
	btst.b	#$04,($00000a77).l
	beq.w	Lff85d2
Lff8758:
	move.b	($00000a79).l,d0
	cmp.b	($00000a15).l,d0
	bcc.s	Lff876c
	move.w	d1,-(a7)
	bsr.s	Lff86f6
	move.w	(a7)+,d1
Lff876c:
	movem.l	d1-d3/a1-a2,-(a7)
	moveq.l	#$0c,d2
	bsr.w	Lff6d76
	movea.l	d0,a1
	lea.l	(-$0060,a7),a7
	movea.l	a7,a2
Lff877e:
	move.b	(a1)+,(a2)+
	move.b	(a1)+,(a2)+
	clr.w	(a2)+
	dbra.w	d2,Lff877e
	lea.l	($00000a64).l,a0
	bsr.w	Lff8992
	move.b	($00000a75).l,d0
	bsr.s	Lff8808
	moveq.l	#$0b,d2
	movea.l	a7,a2
	bsr.w	Lff8822
	move.b	($00000a75).l,d0
	bsr.s	Lff8808
	addq.w	#1,($00000a14).l
	lea.l	($0060,a7),a7
	movem.l	(a7)+,d1-d3/a1-a2
	rts

Lff87ba:
	movem.l	d1-d3/a1-a2,-(a7)
	moveq.l	#$0c,d2
	bsr.w	Lff6d76
	movea.l	d0,a1
	lea.l	(-$0060,a7),a7
	movea.l	a7,a2
Lff87cc:
	move.b	(a1)+,(a2)+
	move.b	(a1)+,(a2)+
	move.b	(a1)+,(a2)+
	clr.b	(a2)+
	dbra.w	d2,Lff87cc
	lea.l	($00000a6c).l,a0
	bsr.w	Lff8992
	move.b	($00000a76).l,d0
	bsr.s	Lff8808
	moveq.l	#$17,d2
	movea.l	a7,a2
	bsr.s	Lff8822
	move.b	($00000a76).l,d0
	bsr.s	Lff8808
	addq.w	#2,($00000a14).l
	lea.l	($0060,a7),a7
	movem.l	(a7)+,d1-d3/a1-a2
	rts

Lff8808:
	and.w	#$00ff,d0
	beq.s	Lff8820
	move.w	d0,d1
	add.w	d0,d0
	add.w	d1,d0
	subq.w	#1,d0
	clr.l	d1
Lff8818:
	bsr.w	Lff85f2
	dbra.w	d0,Lff8818
Lff8820:
	rts

Lff8822:
	tst.b	($00000a74).l
	bne.s	Lff8846
Lff882a:
	movea.l	a2,a1
	moveq.l	#$17,d0
	clr.l	d1
Lff8830:
	move.l	(a1),d3
	asl.l	#1,d3
	roxl.l	#1,d1
	move.l	d3,(a1)+
	dbra.w	d0,Lff8830
	bsr.w	Lff8aee
	dbra.w	d2,Lff882a
	rts

Lff8846:
	movea.l	a2,a1
	moveq.l	#$17,d0
	clr.l	d1
Lff884c:
	move.l	(a1),d3
	asl.l	#1,d3
	roxr.l	#1,d1
	move.l	d3,(a1)+
	dbra.w	d0,Lff884c
	ror.w	#8,d1
	swap.w	d1
	ror.w	#8,d1
	bsr.w	Lff8aee
	dbra.w	d2,Lff8846
	rts

Lff8868:
	movem.l	d0-d7/a0-a2,-(a7)
	and.w	#$000f,d0
	move.l	d0,d7
	bsr.w	Lff86d4
	bsr.s	Lff8884
	clr.b	($00000a13).l
	movem.l	(a7)+,d0-d7/a0-a2
	rte

Lff8884:
	btst.l	#$03,d7
	bne.w	Lff86a2
	btst.l	#$02,d7
	bne.w	Lff86be
	move.w	($00000a1a).l,d2
	tst.b	d7
	bne.s	Lff88a4
	move.w	($00000a20).l,d2
Lff88a4:
	move.w	($00000a26).l,d3
	movea.l	($00000a16).l,a1
	lea.l	($00000a3c).l,a0
	bsr.w	Lff8992
Lff88ba:
	move.w	d3,d4
	lea.l	($00000a54).l,a0
	tst.b	d7
	bne.s	Lff88cc
	lea.l	($00000a5c).l,a0
Lff88cc:
	bsr.w	Lff8992
	movea.l	a1,a0
Lff88d2:
	moveq.l	#$07,d5
Lff88d4:
	movea.l	a0,a2
	bsr.w	Lff89b6
	bsr.w	Lff89b6
	bsr.w	Lff89b6
	bsr.w	Lff8aee
	tst.b	d7
	beq.s	Lff88fc
	movea.l	a0,a2
	bsr.w	Lff8a7e
	bsr.w	Lff8a7e
	bsr.w	Lff8a7e
	bsr.w	Lff8aee
Lff88fc:
	dbra.w	d5,Lff88d4
	addq.l	#1,a0
	dbra.w	d4,Lff88d2
	bsr.w	Lff89a2
	adda.l	#$00000600,a1
	tst.b	d7
	bne.s	Lff891a
	adda.l	#$00000600,a1
Lff891a:
	dbra.w	d2,Lff88ba
	tst.b	d7
	beq.s	Lff893c
	move.l	($00000a1c).l,d2
	beq.s	Lff898c
	lea.l	($00000a48).l,a0
	bsr.s	Lff8992
	move.w	d3,d4
	lea.l	($00000a54).l,a0
	bra.s	Lff8954

Lff893c:
	move.l	($00000a22).l,d2
	beq.s	Lff898c
	lea.l	($00000a4e).l,a0
	bsr.s	Lff8992
	move.w	d3,d4
	lea.l	($00000a5c).l,a0
Lff8954:
	bsr.s	Lff8992
	movea.l	a1,a0
Lff8958:
	moveq.l	#$07,d5
Lff895a:
	movea.l	a0,a2
	bsr.s	Lff89b6
	bsr.s	Lff89b6
	bsr.s	Lff89b6
	and.l	d2,d1
	bsr.w	Lff8aee
	tst.b	d7
	beq.s	Lff8980
	movea.l	a0,a2
	bsr.w	Lff8a7e
	bsr.w	Lff8a7e
	bsr.w	Lff8a7e
	and.l	d2,d1
	bsr.w	Lff8aee
Lff8980:
	dbra.w	d5,Lff895a
	addq.l	#1,a0
	dbra.w	d4,Lff8958
	bsr.s	Lff89a2
Lff898c:
	lea.l	($00000a42).l,a0
Lff8992:
	move.b	(a0)+,d0
	beq.s	Lff89a0
Lff8996:
	move.b	(a0)+,d1
	bsr.w	Lff85f2
	subq.b	#1,d0
	bne.s	Lff8996
Lff89a0:
	rts

Lff89a2:
	moveq.l	#$0d,d1
	bsr.w	Lff85f2
Lff89a8:
	move.l	a0,-(a7)
	lea.l	($00000a38).l,a0
	bsr.s	Lff8992
	movea.l	(a7)+,a0
	rts

Lff89b6:
	tst.b	($00000a74).l
	bne.s	Lff8a1a
	tst.b	d7
	beq.s	Lff8a02
	asl.l	#8,d1
	moveq.l	#$03,d6
	btst.l	#$01,d7
	beq.s	Lff89ee
	moveq.l	#$02,d0
	swap.w	d0
Lff89d0:
	asl.b	#2,d1
	btst.b	d5,(a2)
	beq.s	Lff89d8
	addq.b	#2,d1
Lff89d8:
	adda.l	d0,a2
	btst.b	d5,(a2)
	beq.s	Lff89e0
	addq.b	#1,d1
Lff89e0:
	suba.l	d0,a2
	adda.l	#$00000080,a2
	dbra.w	d6,Lff89d0
	rts

Lff89ee:
	asl.b	#2,d1
	btst.b	d5,(a2)
	beq.s	Lff89f6
	addq.b	#3,d1
Lff89f6:
	adda.l	#$00000080,a2
	dbra.w	d6,Lff89ee
	rts

Lff8a02:
	asl.l	#8,d1
	moveq.l	#$07,d6
Lff8a06:
	asl.b	#1,d1
	btst.b	d5,(a2)
	beq.s	Lff8a0e
	addq.b	#1,d1
Lff8a0e:
	adda.l	#$00000080,a2
	dbra.w	d6,Lff8a06
	rts

Lff8a1a:
	tst.b	d7
	beq.s	Lff8a64
	asl.l	#8,d1
	moveq.l	#$03,d6
	btst.l	#$01,d7
	beq.s	Lff8a4e
	moveq.l	#$02,d0
	swap.w	d0
Lff8a2c:
	lsr.b	#2,d1
	btst.b	d5,(a2)
	beq.s	Lff8a36
	add.b	#$40,d1			;'@'
Lff8a36:
	adda.l	d0,a2
	btst.b	d5,(a2)
	beq.s	Lff8a40
	add.b	#$80,d1
Lff8a40:
	suba.l	d0,a2
	adda.l	#$00000080,a2
	dbra.w	d6,Lff8a2c
	rts

Lff8a4e:
	lsr.b	#2,d1
	btst.b	d5,(a2)
	beq.s	Lff8a58
	add.b	#$c0,d1
Lff8a58:
	adda.l	#$00000080,a2
	dbra.w	d6,Lff8a4e
	rts

Lff8a64:
	asl.l	#8,d1
	moveq.l	#$07,d6
Lff8a68:
	lsr.b	#1,d1
	btst.b	d5,(a2)
	beq.s	Lff8a72
	add.b	#$80,d1
Lff8a72:
	adda.l	#$00000080,a2
	dbra.w	d6,Lff8a68
	rts

Lff8a7e:
	tst.b	($00000a74).l
	bne.s	Lff8aba
	tst.b	d7
	beq.w	Lff8a02
	asl.l	#8,d1
	moveq.l	#$03,d6
	btst.l	#$01,d7
	beq.w	Lff89ee
	moveq.l	#$02,d0
	swap.w	d0
Lff8a9c:
	asl.b	#2,d1
	adda.l	d0,a2
	btst.b	d5,(a2)
	suba.l	d0,a2
	beq.s	Lff8aae
	addq.b	#2,d1
	btst.b	d5,(a2)
	beq.s	Lff8aae
	addq.b	#1,d1
Lff8aae:
	adda.l	#$00000080,a2
	dbra.w	d6,Lff8a9c
	rts

Lff8aba:
	tst.b	d7
	beq.s	Lff8a64
	asl.l	#8,d1
	moveq.l	#$03,d6
	btst.l	#$01,d7
	beq.s	Lff8a4e
	moveq.l	#$02,d0
	swap.w	d0
Lff8acc:
	lsr.b	#2,d1
	adda.l	d0,a2
	btst.b	d5,(a2)
	suba.l	d0,a2
	beq.s	Lff8ae2
	add.b	#$40,d1			;'@'
	btst.b	d5,(a2)
	beq.s	Lff8ae2
	add.b	#$80,d1
Lff8ae2:
	adda.l	#$00000080,a2
	dbra.w	d6,Lff8acc
	rts

Lff8aee:
	swap.w	d1
	bsr.w	Lff85f2
	rol.l	#8,d1
	bsr.w	Lff85f2
	rol.l	#8,d1
	bra.w	Lff85f2

Lff8b00:
	btst.l	#$0c,d1
	beq.w	Lff949c
	bsr.w	Lff93e6
	bsr.s	Lff8b12
	bra.w	Lff944c

Lff8b12:
	bsr.s	Lff8b28
	btst.l	#$1b,d0
	bne.s	Lff8b46
	swap.w	d0
	swap.w	d2
	cmp.b	d0,d2
	beq.s	Lff8b42
	swap.w	d2
	bsr.w	Lff8f8e
Lff8b28:
	movem.l	d1,-(a7)
	move.b	#$0f,d1
	bsr.w	Lff9356
	swap.w	d2
	move.b	d2,($0002,a0)
	swap.w	d2
	moveq.l	#$02,d0
	bra.w	Lff8fa2

Lff8b42:
	swap.w	d2
	swap.w	d0
Lff8b46:
	rts

Lff8b48:
	btst.l	#$0c,d1
	beq.w	Lff94c0
	bsr.w	Lff93e6
	movem.l	d1/d4-d7,-(a7)
	bsr.w	Lff92f6
	tst.l	d0
	bne.s	Lff8bba
	bsr.w	Lff9338
	btst.l	#$1b,d0
	bne.s	Lff8bba
	and.b	#$c0,d1
	or.b	#$11,d1
Lff8b72:
	bsr.w	Lff9356
	rol.l	#8,d2
	addq.l	#2,a0
	move.l	d2,(a0)+
	ror.l	#8,d2
	move.b	d2,(a0)+
	move.b	d7,(a0)+
	move.b	d6,(a0)
	bsr.w	Lff92a0
	lea.l	($000009ee).l,a0
	moveq.l	#$08,d0
	bsr.w	Lff93ac
	bsr.w	Lff938a
	bsr.w	Lff92d8
	bsr.w	Lff8fac
	btst.l	#$0a,d0
	bne.s	Lff8bba
	btst.l	#$1e,d0
	beq.s	Lff8bc2
	btst.l	#$1b,d0
	bne.s	Lff8bba
	bsr.w	Lff8f44
	dbra.w	d4,Lff8b72
Lff8bba:
	movem.l	(a7)+,d1/d4-d7
	bra.w	Lff944c

Lff8bc2:
	btst.l	#$1f,d0
	bne.s	Lff8bba
	adda.l	d5,a1
	sub.l	d5,d3
	bls.s	Lff8bba
	move.l	d4,d0
	swap.w	d0
	move.w	d0,d4
	move.w	d7,d0
	lsr.w	#8,d0
	addq.b	#1,d2
	cmp.b	d2,d0
	bcc.s	Lff8b72
	move.b	#$01,d2
	eori.w	#$0100,d2
	btst.l	#$08,d2
	bne.s	Lff8b72
	add.l	#$00010000,d2
	bsr.w	Lff8b12
	btst.l	#$1b,d0
	bne.s	Lff8bba
	bra.w	Lff8b72

Lff8c00:
	btst.l	#$0c,d1
	beq.w	Lff1e52
	bsr.w	Lff93e6
	movem.l	d1/d4-d7,-(a7)
	bsr.w	Lff92f6
	tst.l	d0
	bne.s	Lff8c84
	bsr.w	Lff9338
	btst.l	#$1b,d0
	bne.s	Lff8c84
	and.b	#$40,d1
	or.b	#$02,d1
Lff8c2a:
	bsr.w	Lff9356
	rol.l	#8,d2
	addq.l	#2,a0
	move.l	d2,(a0)+
	ror.l	#8,d2
	move.b	d2,(a0)+
	move.b	d7,(a0)+
	move.b	d6,(a0)
	bsr.w	Lff92b2
	lea.l	($000009ee).l,a0
	moveq.l	#$08,d0
	bsr.w	Lff93ac
	bsr.w	Lff938a
	bsr.w	Lff92d8
	bsr.w	Lff8fac
	btst.l	#$12,d0
	bne.s	Lff8c8c
	btst.l	#$16,d0
	bne.s	Lff8c8c
	btst.l	#$0f,d0
	bne.s	Lff8c8c
	btst.l	#$0e,d0
	bne.s	Lff8c8c
	btst.l	#$1e,d0
	beq.s	Lff8c8c
	btst.l	#$1b,d0
	bne.s	Lff8c84
	bsr.w	Lff8f44
	dbra.w	d4,Lff8c2a
Lff8c84:
	movem.l	(a7)+,d1/d4-d7
	bra.w	Lff944c

Lff8c8c:
	btst.l	#$1f,d0
	bne.s	Lff8c84
	adda.l	d5,a1
	sub.l	d5,d3
	bls.s	Lff8c84
	move.l	d4,d0
	swap.w	d0
	move.w	d0,d4
	move.w	d7,d0
	lsr.w	#8,d0
	addq.b	#1,d2
	cmp.b	d2,d0
	bcc.s	Lff8c2a
	move.b	#$01,d2
	eori.w	#$0100,d2
	btst.l	#$08,d2
	bne.w	Lff8c2a
	add.l	#$00010000,d2
	bsr.w	Lff8b12
	btst.l	#$1b,d0
	bne.s	Lff8c84
	bra.w	Lff8c2a

Lff8ccc:
	btst.l	#$0c,d1
	beq.w	Lff9526
	lea.l	($000009c2).l,a0
	move.w	d2,d0
	bne.s	Lff8ce2
	move.w	#$00c8,d0
Lff8ce2:
	move.w	d0,(a0)+
	move.w	d0,(a0)+
	movem.l	a4,-(a7)
	bsr.w	Lff1468
	movem.l	(a7)+,a4
	move.b	($00e94001),d0
	btst.l	#$04,d0
	beq.s	Lff8d02
	bsr.w	Lff1392
Lff8d02:
	movea.l	a1,a0
	move.l	a0,d0
	bne.s	Lff8d0e
	lea.l	(Lff9498),a0
Lff8d0e:
	moveq.l	#$02,d0
	bsr.w	Lff93ac
	bra.w	Lff944c

Lff8d18:
	btst.l	#$0c,d1
	beq.w	Lff9606
Lff8d20:
	bsr.w	Lff93e6
	bsr.s	Lff8d2a
	bra.w	Lff944c

Lff8d2a:
	move.l	d1,-(a7)
	move.b	#$04,d1
	bsr.w	Lff9356
	move.l	(a7)+,d1
	moveq.l	#$01,d0
	bsr.w	Lff93ac
Lff8d3c:
	move.b	($00e94001),d0
	and.b	#$d0,d0
	cmp.b	#$d0,d0
	bne.s	Lff8d3c
	clr.l	d0
	move.b	($00e94003),d0
	ror.l	#8,d0
	rts

Lff8d58:
	btst.l	#$0c,d1
	beq.w	Lff962a
	bsr.w	Lff93e6
	movem.l	d1/d4-d7,-(a7)
	bsr.w	Lff92f6
	tst.l	d0
	bne.s	Lff8dd8
	bsr.w	Lff9338
	btst.l	#$1b,d0
	bne.s	Lff8dd8
	and.b	#$c0,d1
	or.b	#$05,d1
	bra.s	Lff8d90

Lff8d84:
	move.w	($00000cb8).l,d0
	lsr.w	#1,d0
Lff8d8c:
	dbra.w	d0,Lff8d8c
Lff8d90:
	bsr.w	Lff9356
	rol.l	#8,d2
	addq.l	#2,a0
	move.l	d2,(a0)+
	ror.l	#8,d2
	move.b	d2,(a0)+
	move.b	d7,(a0)+
	move.b	d6,(a0)
	bsr.w	Lff92a0
	lea.l	($000009ee).l,a0
	moveq.l	#$08,d0
	bsr.w	Lff93ac
	bsr.w	Lff938a
	bsr.w	Lff92d8
	bsr.w	Lff8fac
	btst.l	#$1e,d0
	beq.s	Lff8de0
	btst.l	#$1b,d0
	bne.s	Lff8dd8
	btst.l	#$11,d0
	bne.s	Lff8dd8
	bsr.w	Lff8f44
	dbra.w	d4,Lff8d90
Lff8dd8:
	movem.l	(a7)+,d1/d4-d7
	bra.w	Lff944c

Lff8de0:
	btst.l	#$1f,d0
	bne.s	Lff8dd8
	adda.l	d5,a1
	sub.l	d5,d3
	bls.s	Lff8dd8
	move.l	d4,d0
	swap.w	d0
	move.w	d0,d4
	move.w	d7,d0
	lsr.w	#8,d0
	addq.b	#1,d2
	cmp.b	d2,d0
	bcc.s	Lff8d90
	move.b	#$01,d2
	eori.w	#$0100,d2
	btst.l	#$08,d2
	bne.w	Lff8d84
	add.l	#$00010000,d2
	bsr.w	Lff8b12
	btst.l	#$1b,d0
	bne.s	Lff8dd8
	bra.w	Lff8d90

Lff8e20:
	btst.l	#$0c,d1
	beq.w	Lff96ce
	bsr.w	Lff93e6
	movem.l	d1/d4-d7,-(a7)
	bsr.w	Lff92f6
	tst.l	d0
	bne.s	Lff8e92
	bsr.w	Lff9338
	btst.l	#$1b,d0
	bne.s	Lff8e92
	and.b	#$c0,d1
	or.b	#$06,d1
Lff8e4a:
	bsr.w	Lff9356
	rol.l	#8,d2
	addq.l	#2,a0
	move.l	d2,(a0)+
	ror.l	#8,d2
	move.b	d2,(a0)+
	move.b	d7,(a0)+
	move.b	d6,(a0)
	bsr.w	Lff92b2
	lea.l	($000009ee).l,a0
	moveq.l	#$08,d0
	bsr.w	Lff93ac
	bsr.w	Lff938a
	bsr.w	Lff92d8
	bsr.w	Lff8fac
	btst.l	#$0e,d0
	bne.s	Lff8e8a
	btst.l	#$1e,d0
	beq.s	Lff8e9a
	btst.l	#$1b,d0
	bne.s	Lff8e92
Lff8e8a:
	bsr.w	Lff8f44
	dbra.w	d4,Lff8e4a
Lff8e92:
	movem.l	(a7)+,d1/d4-d7
	bra.w	Lff944c

Lff8e9a:
	btst.l	#$1f,d0
	bne.s	Lff8e92
	adda.l	d5,a1
	sub.l	d5,d3
	bls.s	Lff8e92
	move.l	d4,d0
	swap.w	d0
	move.w	d0,d4
	move.w	d7,d0
	lsr.w	#8,d0
	addq.b	#1,d2
	cmp.b	d2,d0
	bcc.s	Lff8e4a
	move.b	#$01,d2
	eori.w	#$0100,d2
	btst.l	#$08,d2
	bne.s	Lff8e4a
	add.l	#$00010000,d2
	bsr.w	Lff8b12
	btst.l	#$1b,d0
	bne.s	Lff8e92
	bra.w	Lff8e4a

Lff8ed8:
	btst.l	#$0c,d1
	beq.w	Lff9772
	cmp.b	#$ff,d1
	bne.s	Lff8f3a
	move.b	($000009da).l,d0
	or.b	#$40,d0
	move.b	d0,($000009da).l
	bsr.w	Lffa022
	move.b	#$1b,($00e90001)
	bsr.w	Lffa022
	move.b	d0,($00e90003)
	bsr.s	Lff8f3a
	move.l	d0,-(a7)
	move.b	($000009da).l,d0
	and.b	#$bf,d0
	move.b	d0,($000009da).l
	bsr.w	Lffa022
	move.b	#$1b,($00e90001)
	bsr.w	Lffa022
	move.b	d0,($00e90003)
	move.l	(a7)+,d0
	rts

Lff8f3a:
	bsr.w	Lff93e6
	bsr.s	Lff8f8e
	bra.w	Lff944c

Lff8f44:
	move.l	d0,-(a7)
	and.l	#$0035ff00,d0
	beq.s	Lff8f8a
	cmp.b	#$05,d4
	bcc.s	Lff8f8a
	move.l	($000009ee).l,-(a7)
	move.l	($000009f2).l,-(a7)
	move.w	($000009f6).l,-(a7)
	bsr.s	Lff8f8e
	move.w	($00000cb8).l,d0
	lsr.w	#3,d0
Lff8f70:
	dbra.w	d0,Lff8f70
	bsr.w	Lff8b12
	move.w	(a7)+,($000009f6).l
	move.l	(a7)+,($000009f2).l
	move.l	(a7)+,($000009ee).l
Lff8f8a:
	move.l	(a7)+,d0
	rts

Lff8f8e:
	move.l	d1,-(a7)
	move.b	#$07,d1
	bsr.w	Lff9356
	moveq.l	#$01,d0
	bsr.s	Lff8fa0
	move.l	(a7)+,d1
	rts

Lff8fa0:
	move.l	d1,-(a7)
Lff8fa2:
	bsr.w	Lff93ac
	bsr.w	Lff937c
	move.l	(a7)+,d1
Lff8fac:
	move.w	d1,d0
	lsr.w	#8,d0
	and.l	#$00000003,d0
	asl.w	#3,d0
	lea.l	($00000c90).l,a0
	adda.l	d0,a0
	move.l	(a0),d0
	rts

Lff8fc4:
	btst.l	#$0c,d1
	beq.w	Lff9784
	bra.w	Lff1e52

Lff8fd0:
	btst.l	#$0c,d1
	beq.w	Lff1e52
	bsr.w	Lff93e6
	movem.l	d1/d4-d7,-(a7)
	bsr.w	Lff92f6
	tst.l	d0
	bne.w	Lff8dd8
	bsr.w	Lff9338
	btst.l	#$1b,d0
	bne.w	Lff8dd8
	and.b	#$c0,d1
	or.b	#$09,d1
	bra.w	Lff8d90

Lff9002:
	btst.l	#$0c,d1
	beq.w	Lff1e52
	bsr.w	Lff93e6
	movem.l	d1/d4,-(a7)
	bsr.w	Lff9338
	btst.l	#$1b,d0
	bne.s	Lff9054
	and.b	#$c0,d1
	or.b	#$0a,d1
Lff9024:
	bsr.w	Lff9356
	moveq.l	#$01,d0
	bsr.w	Lff93ac
	bsr.w	Lff937c
	bsr.w	Lff8fac
	tst.l	d2
	bpl.s	Lff9044
	move.l	($0002,a0),d2
	lsl.l	#8,d2
	move.b	($0006,a0),d2
Lff9044:
	btst.l	#$1e,d0
	beq.s	Lff9054
	btst.l	#$1b,d0
	bne.s	Lff9054
	dbra.w	d4,Lff9024
Lff9054:
	movem.l	(a7)+,d1/d4
	bra.w	Lff944c

Lff905c:
	btst.l	#$0c,d1
	beq.w	Lff97b4
	bra.w	Lff1e52

Lff9068:
	btst.l	#$0c,d1
	beq.w	Lff1e52
	bsr.w	Lff93e6
	movem.l	d1/d4-d7,-(a7)
	bsr.w	Lff92f6
	tst.l	d0
	bne.w	Lff8e92
	bsr.w	Lff9338
	btst.l	#$1b,d0
	bne.w	Lff8e92
	and.b	#$c0,d1
	or.b	#$0c,d1
	bra.w	Lff8e4a

Lff909a:
	btst.l	#$0c,d1
	beq.w	Lff97dc
	bsr.w	Lff93e6
	movem.l	d1/d4-d6,-(a7)
	moveq.l	#$ff,d0
	move.l	d2,d4
	rol.l	#8,d4
	cmp.b	#$04,d4
	bcc.w	Lff9138
	and.w	#$00ff,d4
	asl.w	#2,d4
	lea.l	(Lff9488),a0
	btst.l	#$06,d1
	beq.s	Lff90cc
	addq.l	#2,a0
Lff90cc:
	clr.l	d6
	move.w	(a0,d4.w),d6
	beq.s	Lff9138
	clr.l	d5
	move.w	d6,d5
	lsr.w	#8,d5
	asl.l	#2,d5
	asl.l	#8,d6
	move.l	d2,d4
	and.l	#$ff0000ff,d4
	or.l	d4,d6
	bsr.w	Lff9338
	btst.l	#$1b,d0
	bne.s	Lff9138
	and.b	#$c0,d1
	or.b	#$0d,d1
	bsr.w	Lff9356
	move.l	d6,($0002,a0)
Lff9102:
	bsr.w	Lff92a0
	lea.l	($000009ee).l,a0
	moveq.l	#$05,d0
	bsr.w	Lff93ac
	bsr.w	Lff938a
	bsr.w	Lff92d8
	bsr.w	Lff8fac
	btst.l	#$1e,d0
	beq.s	Lff9138
	btst.l	#$1b,d0
	bne.s	Lff9138
	btst.l	#$11,d0
	bne.s	Lff9138
	bsr.w	Lff8f44
	dbra.w	d4,Lff9102
Lff9138:
	movem.l	(a7)+,d1/d4-d6
	bra.w	Lff944c

Lff9140:
	btst.l	#$0c,d1
	beq.w	Lff1e52
Lff9148:
	movem.l	d1/a1/a4,-(a7)
	ror.w	#8,d1
	and.l	#$00000003,d1
	cmp.w	#$0008,d2
	beq.s	Lff9184
	lea.l	($000009e2).l,a1
	adda.l	d1,a1
	move.w	d2,d0
	cmp.b	#$08,d0
	bcc.s	Lff917c
	asl.w	#2,d0
	lea.l	(Lff91f2),a4
	movea.l	(a4,d0.w),a4
	tst.w	d0
	beq.s	Lff9198
	jsr	(a4)
Lff917c:
	bsr.s	Lff91c4
Lff917e:
	movem.l	(a7)+,d1/a1/a4
	rts

Lff9184:
	lea.l	($000009e7).l,a4
	adda.l	d1,a4
	adda.l	d1,a4
	clr.l	d0
	move.b	(a4),d0
	move.b	#$01,(a4)
	bra.s	Lff917e

Lff9198:
	bsr.s	Lff91c4
	btst.l	#$01,d0
	beq.s	Lff91be
	move.l	d0,-(a7)
	asl.w	#8,d1
	or.w	#$9000,d1
	bsr.w	Lff8d20
	rol.l	#5,d0
	and.l	#$0000000c,d0
	eori.b	#$04,d0
	move.l	(a7)+,d1
	or.l	d1,d0
	bra.s	Lff917e

Lff91be:
	or.b	#$0c,d0
	bra.s	Lff917e

Lff91c4:
	move.w	d1,-(a7)
	and.w	#$0003,d1
	move.b	(a1),d0
	and.b	#$c0,d0
	move.w	d0,-(a7)
	bset.l	d1,d0
	move.b	d0,($00e94005)
	clr.l	d0
	move.b	($00e94005),d0
	lsr.w	#6,d0
	or.b	(a1),d0
	move.w	(a7)+,d1
	move.b	d1,($00e94005)
	move.w	(a7)+,d1
	rts

Lff91f2:
	.dc.b	$00,$ff,$92,$7e,$00,$ff,$92,$56
	.dc.b	$00,$ff,$92,$32,$00,$ff,$92,$2e
	.dc.b	$00,$ff,$92,$16,$00,$ff,$92,$12
	.dc.b	$00,$ff,$92,$24,$00,$ff,$92,$20
	.dc.b	$42,$40,$60,$04,$30,$3c,$00,$80
	.dc.b	$08,$91,$00,$07,$60,$2c,$42,$40
	.dc.b	$60,$04,$30,$3c,$00,$20,$08,$91
	.dc.b	$00,$05,$60,$0c,$42,$40,$60,$04
	.dc.b	$30,$3c,$00,$10,$08,$91,$00,$04
	.dc.b	$80,$11,$12,$80,$08,$91,$00,$06
	.dc.b	$c0,$3c,$00,$30,$67,$04,$30,$3c
	.dc.b	$00,$40,$80,$11,$12,$80,$c0,$3c
	.dc.b	$00,$c0,$60,$0e,$10,$11,$08,$00
	.dc.b	$00,$06,$66,$20,$80,$7c,$00,$20
	.dc.b	$60,$04,$c0,$3c,$00,$c0,$c2,$7c
	.dc.b	$00,$03,$03,$c0,$13,$c0,$00,$e9
	.dc.b	$40,$05,$c0,$7c,$00,$e0,$13,$c0
	.dc.b	$00,$e9,$40,$05,$4e,$75
Lff9280:
	btst.l	#$0c,d1
	beq.w	Lff98b6
	move.l	d2,-(a7)
	moveq.l	#$07,d2
	bsr.w	Lff9148
	moveq.l	#$03,d2
	bsr.w	Lff9148
	moveq.l	#$01,d2
	bsr.w	Lff9148
	move.l	(a7)+,d2
	rts

Lff92a0:
	move.b	#$ff,($00e84000)
	move.b	#$32,($00e84005)	;'2'
	bra.s	Lff92c2

Lff92b2:
	move.b	#$ff,($00e84000)
	move.b	#$b2,($00e84005)
Lff92c2:
	move.l	a1,($00e8400c)
	move.w	d5,($00e8400a)
	move.b	#$80,($00e84007)
	rts

Lff92d8:
	move.b	($00e84000),d0
	btst.l	#$07,d0
	bne.s	Lff92ec
	move.b	#$10,($00e84007)
Lff92ec:
	move.b	#$ff,($00e84000)
	rts

Lff92f6:
	move.l	d2,d4
	rol.l	#8,d4
	cmp.b	#$04,d4
	bcc.s	Lff9334
	and.w	#$00ff,d4
	asl.w	#3,d4
	lea.l	(Lff9468),a0
	clr.l	d5
	move.w	(a0,d4.w),d5
	move.w	($02,a0,d4.w),d6
	btst.l	#$06,d1
	beq.s	Lff931e
	addq.l	#2,a0
Lff931e:
	move.w	($04,a0,d4.w),d7
	beq.s	Lff9334
	move.w	d7,d0
	lsr.w	#8,d0
	tst.b	d2
	beq.s	Lff9334
	cmp.b	d2,d0
	bcs.s	Lff9334
	clr.l	d0
	rts

Lff9334:
	moveq.l	#$ff,d0
	rts

Lff9338:
	clr.l	d0
	clr.l	d4
	btst.l	#$05,d1
	beq.s	Lff934a
	moveq.l	#$09,d4
	swap.w	d4
	move.w	#$0009,d4
Lff934a:
	btst.l	#$04,d1
	beq.s	Lff9354
	bsr.w	Lff8b12
Lff9354:
	rts

Lff9356:
	movem.l	d1,-(a7)
	lea.l	($000009ee).l,a0
	move.b	d1,(a0)
	ror.l	#8,d1
	and.b	#$03,d1
	btst.l	#$08,d2
	beq.s	Lff9372
	bset.l	#$02,d1
Lff9372:
	move.b	d1,($0001,a0)
	movem.l	(a7)+,d1
	rts

Lff937c:
	move.b	($00e94001),d0
	and.b	#$1f,d0
	bne.s	Lff937c
	rts

Lff938a:
	move.b	($00e84000),d0
	btst.l	#$04,d0
	bne.s	Lff93a4
	move.b	($00e94001),d0
	and.b	#$1f,d0
	bne.s	Lff937c
	rts

Lff93a4:
	move.b	($00e84001),d0
	rts

Lff93ac:
	movem.l	d1/a1-a2,-(a7)
	lea.l	($00e94001),a1
	lea.l	($00e94003),a2
	move.w	sr,-(a7)
	ori.w	#$0700,sr
Lff93c2:
	move.b	(a1),d1
	btst.l	#$04,d1
	bne.s	Lff93c2
Lff93ca:
	move.b	(a1),d1
	btst.l	#$07,d1
	beq.s	Lff93ca
	btst.l	#$06,d1
	bne.s	Lff93ca
	move.b	(a0)+,(a2)
	dbra.w	d0,Lff93ca
	move.w	(a7)+,sr
	movem.l	(a7)+,d1/a1-a2
	rts

Lff93e6:
	btst.b	#$07,($000009e1).l
	bne.s	Lff93fa
	movem.l	d0-d1,-(a7)
	bsr.s	Lff93fc
	movem.l	(a7)+,d0-d1
Lff93fa:
	rts

Lff93fc:
	move.w	d1,d0
	lsr.w	#8,d0
	tst.b	d0
	beq.s	Lff944c
	and.b	#$03,d0
	or.b	#$80,d0
	bset.b	#$07,($000009e1).l
	move.b	d0,($00e94007)
	btst.b	#$06,($000009e1).l
	bne.s	Lff9442
	move.w	($000009c2).l,($000009c4).l
Lff942e:
	bsr.w	Lff8d2a
	btst.l	#$1d,d0
	bne.s	Lff9442
	cmpi.w	#$0064,($000009c4).l	;'d'
	bcc.s	Lff942e
Lff9442:
	bclr.b	#$06,($000009e1).l
	rts

Lff944c:
	tst.b	($000009e1).l
	beq.s	Lff9466
	move.w	($000009c2).l,($000009c4).l
	move.b	#$40,($000009e1).l	;'@'
Lff9466:
	rts

Lff9468:
	.dc.b	$00,$80,$00,$80,$1a,$07,$00,$00
	.dc.b	$01,$00,$00,$ff,$0f,$0e,$1a,$0e
	.dc.b	$02,$00,$00,$ff,$08,$1b,$0f,$1b
	.dc.b	$04,$00,$00,$ff,$00,$00,$08,$35
Lff9488:
	.dc.b	$1a,$1b,$00,$00,$0f,$2a,$1a,$36
	.dc.b	$08,$3a,$0f,$54,$00,$00,$08,$74
Lff9498:
	bset.b	d1,(a0)
	move.b	d0,d0
Lff949c:
	movem.l	d5-d7/a4,-(a7)
	bsr.w	Lff9986
	lea.l	(Lff9d16),a4
	bsr.w	Lff99d2
	bmi.s	Lff94ba
	bsr.w	Lff9b94
	bmi.s	Lff94ba
	bsr.w	Lff9a7a
Lff94ba:
	movem.l	(a7)+,d5-d7/a4
	rts

Lff94c0:
	movem.l	d4-d7/a4/a6,-(a7)
	bsr.w	Lff9986
Lff94c8:
	cmp.l	#$00000400,d3
	bcs.s	Lff94f6
	movem.l	d1-d3/a1,-(a7)
	move.l	#$00000400,d3
	bsr.s	Lff94fe
	movem.l	(a7)+,d1-d3/a1
	tst.b	d0
	bne.s	Lff94f8
	addq.l	#4,d2
	move.l	#$00000400,d0
	adda.l	d0,a1
	sub.l	d0,d3
	bne.s	Lff94c8
	clr.l	d0
	bra.s	Lff94f8

Lff94f6:
	bsr.s	Lff94fe
Lff94f8:
	movem.l	(a7)+,d4-d7/a4/a6
	rts

Lff94fe:
	lea.l	(-$0400,a7),a7
	movea.l	a1,a6
	movea.l	a7,a1
	bsr.w	Lff970c
	tst.b	d0
	bne.s	Lff9520
	move.w	d3,d4
	subq.w	#1,d4
	movea.l	a7,a1
	moveq.l	#$fe,d0
Lff9516:
	cmpm.b	(a1)+,(a6)+
	bne.s	Lff9520
	dbra.w	d4,Lff9516
	clr.l	d0
Lff9520:
	lea.l	($0400,a7),a7
	rts

Lff9526:
	movem.l	d2-d7/a1/a4,-(a7)
	move.l	a1,d0
	bne.s	Lff95a6
	bsr.w	Lff99fa
	bmi.w	Lff95cc
	lea.l	(Lff9d22),a4
	bsr.w	Lff9b92
	bmi.w	Lff95cc
	lea.l	(Lff9d46),a4
	bsr.w	Lff9c7e
	bmi.s	Lff95cc
	bsr.w	Lff9a7a
	bmi.s	Lff95cc
	lea.l	(-$0100,a7),a7
	movea.l	a7,a1
	moveq.l	#$04,d2
	move.l	#$00000100,d3
	bsr.w	Lff9736
	move.l	d0,-(a7)
	lea.l	(Lff9d28),a1
	cmpi.l	#$5836384b,($0004,a7)	;'X68K'
	bne.s	Lff959c
	lea.l	(Lff9d28),a1
	move.l	($0008,a7),d0
	cmp.l	#$00009fd9,d0
	bcs.s	Lff959c
	lea.l	($0014,a1),a1
	cmp.l	#$00013d1d,d0
	bcs.s	Lff959c
	lea.l	($0014,a1),a1
Lff959c:
	move.l	(a7)+,d0
	lea.l	($0100,a7),a7
	tst.b	d0
	bne.s	Lff95cc
Lff95a6:
	bsr.s	Lff95d2
	bsr.w	Lff99fa
	bmi.s	Lff95cc
	lea.l	(Lff9d22),a4
	bsr.w	Lff9b92
	bmi.s	Lff95cc
	movea.l	a1,a4
	bsr.w	Lff9c7e
	bmi.s	Lff95cc
	bsr.w	Lff9a7a
	bmi.s	Lff95cc
	bsr.w	Lff9c56
Lff95cc:
	movem.l	(a7)+,d2-d7/a1/a4
	rts

Lff95d2:
	lea.l	($000009fe).l,a4
	move.l	d1,d0
	ror.w	#8,d0
	and.l	#$0000000f,d0
	adda.l	d0,a4
	move.b	#$28,d0			;'('
	cmpi.b	#$07,($0003,a1)
	beq.s	Lff9600
	move.b	#$14,d0
	cmpi.b	#$02,($0004,a1)
	beq.s	Lff9600
	move.b	#$0a,d0
Lff9600:
	move.b	d0,(a4)
	clr.l	d0
	rts

Lff9606:
	movem.l	d5-d7/a4,-(a7)
	bsr.w	Lff9986
	lea.l	(Lff9cf2),a4
	bsr.w	Lff99d2
	bmi.s	Lff9624
	bsr.w	Lff9b94
	bmi.s	Lff9624
	bsr.w	Lff9a7a
Lff9624:
	movem.l	(a7)+,d5-d7/a4
	rts

Lff962a:
	movem.l	d5-d7/a4,-(a7)
	bsr.w	Lff9986
Lff9632:
	cmp.l	#$0000ff00,d3
	bcs.s	Lff9660
	move.l	d3,-(a7)
	move.l	#$0000ff00,d3
	bsr.s	Lff9668
	move.l	(a7)+,d3
	tst.b	d0
	bne.s	Lff9662
	add.l	#$000000ff,d2
	move.l	#$0000ff00,d0
	adda.l	d0,a1
	sub.l	d0,d3
	bne.s	Lff9632
	clr.l	d0
	bra.s	Lff9662

Lff9660:
	bsr.s	Lff9668
Lff9662:
	movem.l	(a7)+,d5-d7/a4
	rts

Lff9668:
	bsr.s	Lff967e
	cmp.b	#$06,d0
	beq.s	Lff9676
	cmp.b	#$21,d0			;'!'
	bne.s	Lff967c
Lff9676:
	bsr.w	Lff9804
	bsr.s	Lff967e
Lff967c:
	rts

Lff967e:
	move.w	#$0064,-(a7)		;'d'
Lff9682:
	bsr.s	Lff9692
	cmp.b	#$04,d0
	bne.s	Lff968e
	subq.w	#1,(a7)
	bne.s	Lff9682
Lff968e:
	addq.l	#2,a7
	rts

Lff9692:
	movem.l	d1-d3/a1,-(a7)
	lea.l	(Lff9d10),a4
	bsr.w	Lff99d2
	bmi.s	Lff96c8
	move.w	sr,-(a7)
	bsr.w	Lff9be2
	bmi.s	Lff96c6
	move.l	d3,-(a7)
	add.l	#$000000ff,d3
	and.l	#$0000ff00,d3
	bsr.w	Lff9ccc
	move.l	(a7)+,d3
	move.w	(a7)+,sr
	bsr.w	Lff9a7a
	bra.s	Lff96c8

Lff96c6:
	move.w	(a7)+,sr
Lff96c8:
	movem.l	(a7)+,d1-d3/a1
	rts

Lff96ce:
	movem.l	d5-d7/a4,-(a7)
	bsr.w	Lff9986
Lff96d6:
	cmp.l	#$0000ff00,d3
	bcs.s	Lff9704
	move.l	d3,-(a7)
	move.l	#$0000ff00,d3
	bsr.s	Lff970c
	move.l	(a7)+,d3
	tst.b	d0
	bne.s	Lff9706
	add.l	#$000000ff,d2
	move.l	#$0000ff00,d0
	adda.l	d0,a1
	sub.l	d0,d3
	bne.s	Lff96d6
	clr.l	d0
	bra.s	Lff9706

Lff9704:
	bsr.s	Lff970c
Lff9706:
	movem.l	(a7)+,d5-d7/a4
	rts

Lff970c:
	bsr.s	Lff9722
	cmp.b	#$06,d0
	beq.s	Lff971a
	cmp.b	#$21,d0			;'!'
	bne.s	Lff9720
Lff971a:
	bsr.w	Lff9804
	bsr.s	Lff9722
Lff9720:
	rts

Lff9722:
	move.w	#$0064,-(a7)		;'d'
Lff9726:
	bsr.s	Lff9736
	cmp.b	#$04,d0
	bne.s	Lff9732
	subq.w	#1,(a7)
	bne.s	Lff9726
Lff9732:
	addq.l	#2,a7
	rts

Lff9736:
	movem.l	d1-d3/a1,-(a7)
	lea.l	(Lff9d0a),a4
	bsr.w	Lff99d2
	bmi.s	Lff976c
	move.w	sr,-(a7)
	bsr.w	Lff9be2
	bmi.s	Lff976a
	move.l	d3,-(a7)
	add.l	#$000000ff,d3
	and.l	#$0000ff00,d3
	bsr.w	Lff9cba
	move.l	(a7)+,d3
	move.w	(a7)+,sr
	bsr.w	Lff9a7a
	bra.s	Lff976c

Lff976a:
	move.w	(a7)+,sr
Lff976c:
	movem.l	(a7)+,d1-d3/a1
	rts

Lff9772:
	movem.l	d2-d7/a1/a4,-(a7)
	bsr.w	Lff9986
	bsr.w	Lff9c56
	movem.l	(a7)+,d2-d7/a1/a4
	rts

Lff9784:
	movem.l	d5-d7/a4,-(a7)
	bsr.w	Lff9986
	lea.l	(Lff9d1c),a4
	bsr.w	Lff99d2
	bmi.s	Lff97ae
	move.b	d3,($0004,a4)
	bsr.w	Lff9b94
	bmi.s	Lff97ae
	movea.l	a1,a4
	bsr.w	Lff9c74
	bmi.s	Lff97ae
	bsr.w	Lff9a7a
Lff97ae:
	movem.l	(a7)+,d5-d7/a4
	rts

Lff97b4:
	movem.l	d5-d7/a4,-(a7)
	bsr.w	Lff9986
	lea.l	(Lff9d04),a4
	bsr.w	Lff99d2
	bmi.s	Lff97d6
	move.b	d3,($0004,a4)
	bsr.w	Lff9b94
	bmi.s	Lff97d6
	bsr.w	Lff9a7a
Lff97d6:
	movem.l	(a7)+,d5-d7/a4
	rts

Lff97dc:
	movem.l	d5-d7/a4,-(a7)
	bsr.w	Lff9986
	lea.l	(Lff9cfe),a4
	bsr.w	Lff99d2
	bmi.s	Lff97fe
	move.b	d3,($0004,a4)
	bsr.w	Lff9b94
	bmi.s	Lff97fe
	bsr.w	Lff9a7a
Lff97fe:
	movem.l	(a7)+,d5-d7/a4
	rts

Lff9804:
	movem.l	d1-d3/a1/a4,-(a7)
	lea.l	($000009fe).l,a0
	move.l	d1,d0
	ror.w	#8,d0
	and.l	#$0000000f,d0
	adda.l	d0,a0
	move.b	(a0),d0
	and.b	#$7f,d0
	lea.l	(Lff9d3c),a1
	cmp.b	#$14,d0
	beq.s	Lff988e
	lea.l	(Lff9d50),a1
	cmp.b	#$28,d0			;'('
	beq.s	Lff988e
	lea.l	(Lff9d28),a1
	cmp.b	#$0a,d0
	beq.s	Lff988e
	lea.l	(-$0100,a7),a7
	movea.l	a7,a1
	moveq.l	#$04,d2
	move.l	#$00000100,d3
	bsr.w	Lff9736
	move.l	d0,-(a7)
	lea.l	(Lff9d28),a1
	cmpi.l	#$5836384b,($0004,a7)	;'X68K'
	bne.s	Lff9884
	move.l	($0008,a7),d0
	cmp.l	#$00009fd9,d0
	bcs.s	Lff9884
	lea.l	($0014,a1),a1
	cmp.l	#$00013d1d,d0
	bcs.s	Lff9884
	lea.l	($0014,a1),a1
Lff9884:
	move.l	(a7)+,d0
	lea.l	($0100,a7),a7
	tst.b	d0
	bne.s	Lff98b0
Lff988e:
	bsr.w	Lff95d2
	bsr.w	Lff99fa
	bmi.s	Lff98b0
	lea.l	(Lff9d22),a4
	bsr.w	Lff9b92
	bmi.s	Lff98b0
	movea.l	a1,a4
	bsr.w	Lff9c7e
	bmi.s	Lff98b0
	bsr.w	Lff9a7a
Lff98b0:
	movem.l	(a7)+,d1-d3/a1/a4
	rts

Lff98b6:
	movem.l	d2/d5-d7/a1/a4,-(a7)
	lea.l	($000009fe).l,a0
	move.l	d1,d0
	ror.w	#8,d0
	and.l	#$0000000f,d0
	adda.l	d0,a0
	move.b	(a0),d0
	btst.l	#$07,d0
	bne.w	Lff9960
	and.b	#$7f,d0
	beq.w	Lff9960
	move.l	#$00015660,d2
	lea.l	(Lff9d46),a1
	cmp.b	#$14,d0
	beq.s	Lff990e
	move.l	#$0002acc0,d2
	lea.l	(Lff9d5a),a1
	cmp.b	#$28,d0			;'('
	beq.s	Lff990e
	move.l	#$0000af50,d2
	lea.l	(Lff9d32),a1
Lff990e:
	bsr.w	Lff99fa
	bmi.s	Lff9960
	lea.l	(Lff9d22),a4
	bsr.w	Lff9b92
	bmi.s	Lff9960
	movea.l	a1,a4
	bsr.w	Lff9c7e
	bmi.s	Lff9960
	bsr.w	Lff9a7a
	bmi.s	Lff9960
	lea.l	(Lff9d16),a4
	bsr.w	Lff99d2
	bmi.s	Lff9960
	move.b	#$00,($0004,a4)
	bsr.w	Lff9b94
	bmi.s	Lff9960
	bsr.w	Lff9a7a
	bmi.s	Lff9960
	lea.l	($000009fe).l,a0
	move.l	d1,d0
	ror.w	#8,d0
	and.l	#$0000000f,d0
	adda.l	d0,a0
	clr.b	(a0)
Lff9960:
	movem.l	(a7)+,d2/d5-d7/a1/a4
	rts

Lff9966:
	move.b	#$00,($00e96005)
	movem.l	d0/a0,-(a7)
	lea.l	($000009fe).l,a0
	clr.l	(a0)+
	clr.l	(a0)+
	clr.l	(a0)+
	clr.l	(a0)+
	movem.l	(a7)+,d0/a0
	rts

Lff9986:
	movem.l	d0/a0,-(a7)
	move.l	#$000000c8,d0
Lff9990:
	btst.b	#$01,($00e96003)
	beq.s	Lff99a0
	dbra.w	d0,Lff9990
	bsr.s	Lff9966
Lff99a0:
	lea.l	($000009fe).l,a0
	move.l	d1,d0
	ror.w	#8,d0
	and.l	#$0000000f,d0
	adda.l	d0,a0
	move.b	(a0),d0
	and.b	#$7f,d0
	bne.s	Lff99c8
	movem.l	a0-a1,-(a7)
	suba.l	a1,a1
	bsr.w	Lff9526
	movem.l	(a7)+,a0-a1
Lff99c8:
	bclr.b	#$07,(a0)
	movem.l	(a7)+,d0/a0
	rts

Lff99d2:
	bsr.w	Lff9b78
	move.l	d2,d0
	swap.w	d0
	and.w	#$001f,d0
	andi.b	#$e0,($0001,a4)
	or.b	d0,($0001,a4)
	move.w	d2,($0002,a4)
	move.l	d3,d0
	add.l	#$000000ff,d0
	lsr.l	#8,d0
	move.b	d0,($0004,a4)
Lff99fa:
	move.w	d1,d0
	lsr.w	#8,d0
	and.w	#$000f,d0
	cmp.b	($00000cb4).l,d0
	bcc.s	Lff9a22
	move.l	#$000007d0,d0
Lff9a10:
	btst.b	#$01,($00e96003)
	beq.s	Lff9a26
	dbra.w	d0,Lff9a10
	bsr.w	Lff9966
Lff9a22:
	moveq.l	#$ff,d0
	rts

Lff9a26:
	move.l	d2,-(a7)
	move.w	d1,d0
	lsr.w	#8,d0
	and.w	#$000f,d0
	lsr.w	#1,d0
	clr.b	d2
	bset.l	d0,d2
	move.w	sr,-(a7)
	move.l	a0,-(a7)
	lea.l	($00e96003),a0
	ori.w	#$0700,sr
	move.b	d2,($00e96007)
	move.l	#$00001388,d0
Lff9a50:
	btst.b	#$01,(a0)
	beq.s	Lff9a64
	move.b	#$00,(a0)
	movea.l	(a7)+,a0
	move.w	(a7)+,sr
	move.l	(a7)+,d2
	clr.l	d0
	rts

Lff9a64:
	subq.l	#1,d0
	bne.s	Lff9a50
	move.b	#$00,(a0)
	movea.l	(a7)+,a0
	move.w	(a7)+,sr
	bsr.w	Lff9966
	move.l	(a7)+,d2
	moveq.l	#$ff,d0
	rts

Lff9a7a:
	move.l	#$004c4b40,d5		;'LK@'
Lff9a80:
	moveq.l	#$0f,d6
	bsr.w	Lff9b5e
	bmi.s	Lff9ace
	move.b	($00e96001),d7
	move.l	#$0001e848,d5
	moveq.l	#$1f,d6
	bsr.w	Lff9b5e
	bmi.s	Lff9ace
	clr.l	d0
	move.b	($00e96001),d0
	bne.s	Lff9ace
	move.b	d7,d0
	and.b	#$03,d0
	bne.s	Lff9ad8
Lff9aae:
	move.b	($00e84040),d0
	btst.l	#$07,d0
	bne.s	Lff9ac2
	move.b	#$10,($00e84047)
Lff9ac2:
	move.b	#$ff,($00e84040)
	clr.l	d0
	rts

Lff9ace:
	bsr.s	Lff9aae
	bsr.w	Lff9966
	moveq.l	#$ff,d0
	rts

Lff9ad8:
	btst.l	#$00,d0
	bne.s	Lff9b10
	bsr.s	Lff9aae
	lea.l	($000009f8).l,a4
	move.b	#$03,(a4)
	bsr.w	Lff99fa
	bmi.s	Lff9b08
	bsr.w	Lff9b94
	bmi.s	Lff9b08
	bsr.s	Lff9b16
	bmi.s	Lff9b08
	movem.l	d0,-(a7)
	bsr.w	Lff9a7a
	bpl.s	Lff9b06
	move.l	d0,(a7)
Lff9b06:
	move.l	(a7)+,d0
Lff9b08:
	or.l	#$ffffff00,d0
	rts

Lff9b10:
	bsr.s	Lff9aae
	moveq.l	#$fd,d0
	rts

Lff9b16:
	movem.l	d3-d4/a1,-(a7)
	subq.l	#4,a7
	movea.l	a7,a1
	moveq.l	#$03,d3
	move.b	#-$04,(a1)
Lff9b24:
	move.l	#$0003d090,d4
Lff9b2a:
	move.b	($00e96003),d0
	and.b	#$1f,d0
	cmp.b	#$07,d0
	beq.s	Lff9b46
	subq.l	#1,d4
	bne.s	Lff9b2a
	bsr.w	Lff9966
	moveq.l	#$ff,d0
	bra.s	Lff9b54

Lff9b46:
	move.b	($00e96001),(a1)+
	dbra.w	d3,Lff9b24
	clr.l	d0
	move.b	(a7),d0
Lff9b54:
	addq.l	#4,a7
	movem.l	(a7)+,d3-d4/a1
	tst.l	d0
	rts

Lff9b5e:
	move.b	($00e96003),d0
	and.b	#$1f,d0
	cmp.b	d6,d0
	beq.s	Lff9b74
	subq.l	#1,d5
	bne.s	Lff9b5e
	moveq.l	#$ff,d0
	rts

Lff9b74:
	clr.l	d0
	rts

Lff9b78:
	move.l	a0,-(a7)
	lea.l	($000009f8).l,a0
	moveq.l	#$05,d0
Lff9b82:
	move.b	(a4)+,(a0)+
	dbra.w	d0,Lff9b82
	lea.l	($000009f8).l,a4
	movea.l	(a7)+,a0
	rts

Lff9b92:
	bsr.s	Lff9b78
Lff9b94:
	movem.l	d1-d2,-(a7)
	move.w	d1,d0
	and.w	#$0100,d0
	lsr.w	#3,d0
	andi.b	#$1f,($0001,a4)
	or.b	d0,($0001,a4)
	moveq.l	#$05,d1
Lff9bac:
	move.l	#$0003d090,d2
Lff9bb2:
	move.b	($00e96003),d0
	and.b	#$1f,d0
	cmp.b	#$0b,d0
	beq.s	Lff9bce
	subq.l	#1,d2
	bne.s	Lff9bb2
	bsr.w	Lff9966
	moveq.l	#$ff,d0
	bra.s	Lff9bda

Lff9bce:
	move.b	(a4)+,($00e96001)
	dbra.w	d1,Lff9bac
	clr.l	d0
Lff9bda:
	movem.l	(a7)+,d1-d2
	tst.l	d0
	rts

Lff9be2:
	movem.l	d1-d2,-(a7)
	move.w	d1,d0
	and.w	#$0100,d0
	lsr.w	#3,d0
	andi.b	#$1f,($0001,a4)
	or.b	d0,($0001,a4)
	moveq.l	#$04,d1
Lff9bfa:
	move.l	#$0003d090,d2
Lff9c00:
	move.b	($00e96003),d0
	and.b	#$1f,d0
	cmp.b	#$0b,d0
	beq.s	Lff9c1c
	subq.l	#1,d2
	bne.s	Lff9c00
	bsr.w	Lff9966
	moveq.l	#$ff,d0
	bra.s	Lff9bda

Lff9c1c:
	move.b	(a4)+,($00e96001)
	dbra.w	d1,Lff9bfa
	move.l	#$0003d090,d2
Lff9c2c:
	move.b	($00e96003),d0
	and.b	#$1f,d0
	cmp.b	#$0b,d0
	beq.s	Lff9c48
	subq.l	#1,d2
	bne.s	Lff9c2c
	bsr.w	Lff9966
	moveq.l	#$ff,d0
	bra.s	Lff9bda

Lff9c48:
	ori.w	#$0700,sr
	move.b	(a4)+,($00e96001)
	clr.l	d0
	bra.s	Lff9bda

Lff9c56:
	bsr.w	Lff99fa
	bmi.s	Lff9c72
	lea.l	(Lff9cf8),a4
	bsr.w	Lff9b92
	bmi.s	Lff9c72
	move.l	#$004c4b40,d5		;'LK@'
	bsr.w	Lff9a80
Lff9c72:
	rts

Lff9c74:
	movem.l	d3-d4/a1,-(a7)
	movea.l	a4,a1
	moveq.l	#$03,d3
	bra.s	Lff9c86

Lff9c7e:
	movem.l	d3-d4/a1,-(a7)
	movea.l	a4,a1
	moveq.l	#$09,d3
Lff9c86:
	move.l	#$0003d090,d4
Lff9c8c:
	move.b	($00e96003),d0
	and.b	#$1f,d0
	cmp.b	#$03,d0
	beq.s	Lff9ca8
	subq.l	#1,d4
	bne.s	Lff9c8c
	bsr.w	Lff9966
	moveq.l	#$ff,d0
	bra.s	Lff9cb4

Lff9ca8:
	move.b	(a1)+,($00e96001)
	dbra.w	d3,Lff9c86
	clr.l	d0
Lff9cb4:
	movem.l	(a7)+,d3-d4/a1
	rts

Lff9cba:
	move.b	#$ff,($00e84040)
	move.b	#$b2,($00e84045)
	bra.s	Lff9cdc

Lff9ccc:
	move.b	#$ff,($00e84040)
	move.b	#$32,($00e84045)	;'2'
Lff9cdc:
	move.l	a1,($00e8404c)
	move.w	d3,($00e8404a)
	move.b	#$80,($00e84047)
	rts

Lff9cf2:
	.dc.b	$00,$00,$00,$00,$00,$00
Lff9cf8:
	.dc.b	$01,$00,$00,$00,$00,$00
Lff9cfe:
	.dc.b	$06,$00,$00,$00,$06,$00
Lff9d04:
	.dc.b	$07,$00,$00,$00,$06,$00
Lff9d0a:
	.dc.b	$08,$00,$00,$00,$00,$00
Lff9d10:
	.dc.b	$0a,$00,$00,$00,$00,$00
Lff9d16:
	.dc.b	$0b,$00,$af,$50,$00,$00
Lff9d1c:
	.dc.b	$0e,$00,$00,$00,$00,$00
Lff9d22:
	.dc.b	$c2,$00,$00,$00,$00,$00
Lff9d28:
	.dc.b	$01,$01,$00,$03,$01,$35,$80,$00
	.dc.b	$00,$00
Lff9d32:
	.dc.b	$01,$01,$00,$03,$01,$54,$80,$00
	.dc.b	$00,$00
Lff9d3c:
	.dc.b	$01,$01,$00,$03,$02,$66,$80,$00
	.dc.b	$00,$00
Lff9d46:
	.dc.b	$01,$01,$00,$03,$02,$98,$80,$00
	.dc.b	$00,$00
Lff9d50:
	.dc.b	$01,$01,$00,$07,$02,$66,$80,$00
	.dc.b	$00,$00
Lff9d5a:
	.dc.b	$01,$01,$00,$07,$02,$98,$80,$00
	.dc.b	$00,$00,$41,$f9,$00,$ff,$9d,$e8
	.dc.b	$60,$06,$41,$f9,$00,$ff,$9d,$c4
	.dc.b	$4a,$39,$00,$00,$0c,$32,$66,$f8
	.dc.b	$61,$00,$01,$10,$b4,$bc,$00,$00
	.dc.b	$ff,$00,$65,$18,$2f,$02,$24,$3c
	.dc.b	$00,$00,$ff,$00,$70,$80,$4e,$90
	.dc.b	$d3,$c2,$20,$02,$24,$1f,$94,$80
	.dc.b	$66,$e2,$4e,$75
Lff9d9e:
	moveq.l	#$00,d0
	jsr	(a0)
	rts

Lff9da4:
	movem.l	d1-d2/a1,-(a7)
	movea.l	($00000978).l,a1
	move.w	#$0403,d1
	move.w	($0000097c).l,d2
	beq.s	Lff9dbe
	moveq.l	#$00,d0
	bsr.s	Lff9de8
Lff9dbe:
	movem.l	(a7)+,d1-d2/a1
	rts

Lff9dc4:
	tst.b	($00000c32).l
	bne.s	Lff9dc4
	addq.b	#4,d0
	move.b	d0,($00000c32).l
	move.b	#$b2,($00e840c5)
	bsr.s	Lff9e0c
	move.b	#$04,($00e92001)
	rts

Lff9de8:
	tst.b	($00000c32).l
	bne.s	Lff9de8
	addq.b	#2,d0
	move.b	d0,($00000c32).l
	move.b	#$32,($00e840c5)	;'2'
	bsr.s	Lff9e0c
	move.b	#$02,($00e92001)
	rts

Lff9e0c:
	move.b	#$ff,($00e840c0)
	move.l	a1,($00e840cc)
	move.w	d2,($00e840ca)
Lff9e20:
	move.w	d1,-(a7)
	move.b	($000009da).l,d0
	or.b	#$80,d0
	cmp.w	#$0200,d1
	bcs.s	Lff9e3a
	sub.w	#$0200,d1
	and.b	#$7f,d0
Lff9e3a:
	move.b	d0,($000009da).l
	bsr.w	Lffa022
	move.b	#$1b,($00e90001)
	bsr.w	Lffa022
	move.b	d0,($00e90003)
	move.w	d1,d0
	and.b	#$03,d0
	beq.s	Lff9e64
	cmp.b	#$03,d0
	bne.s	Lff9e68
Lff9e64:
	eori.b	#$03,d0
Lff9e68:
	lsr.w	#8,d1
	asl.w	#2,d1
	or.b	d0,d1
	move.b	($00e9a005),d0
	and.b	#$f0,d0
	or.b	d1,d0
	move.w	(a7)+,d1
	move.b	#$88,($00e840c7)
	move.b	d0,($00e9a005)
	rts

Lff9e8c:
	tst.w	d1
	bmi.s	Lff9eb8
	move.w	d1,-(a7)
	moveq.l	#$34,d0			;'4'
	tst.w	($00000cb6).l
	beq.s	Lff9e9e
	moveq.l	#$58,d0			;'X'
Lff9e9e:
	move.w	d0,-(a7)
	lsr.w	#7,d1
	and.w	#$000e,d1
	move.w	(Lff9ebe,pc,d1.w),d1
Lff9eaa:
	move.w	(a7),d0
Lff9eac:
	dbra.w	d0,Lff9eac
	dbra.w	d1,Lff9eaa
	addq.l	#2,a7
	move.w	(a7)+,d1
Lff9eb8:
	and.w	#$7fff,d1
	rts

Lff9ebe:
	.dc.b	$00,$07,$00,$05,$00,$03,$00,$02
	.dc.b	$00,$01,$00,$00,$00,$00,$00,$00
	.dc.b	$4a,$39,$00,$00,$0c,$32,$66,$f8
	.dc.b	$61,$b4,$13,$fc,$00,$14,$00,$00
	.dc.b	$0c,$32,$13,$fc,$00,$ba,$00,$e8
	.dc.b	$40,$c5,$61,$30,$13,$fc,$00,$04
	.dc.b	$00,$e9,$20,$01,$4e,$75
Lff9ef4:
	tst.b	($00000c32).l
	bne.s	Lff9ef4
	bsr.s	Lff9e8c
	move.b	#$12,($00000c32).l
	move.b	#$3a,($00e840c5)	;':'
	bsr.s	Lff9f1a
	move.b	#$02,($00e92001)
	rts

Lff9f1a:
	move.b	#$ff,($00e840c0)
	move.l	a1,($00e840dc)
	move.w	d2,($00e840da)
	bra.w	Lff9e20

Lff9f32:
	tst.b	($00000c32).l
	bne.s	Lff9f32
	bsr.w	Lff9e8c
	move.b	#$24,($00000c32).l	;'$'
	move.b	#$be,($00e840c5)
	bsr.s	Lff9f1a
	move.b	#$04,($00e92001)
	rts

Lff9f5a:
	tst.b	($00000c32).l
	bne.s	Lff9f5a
	bsr.w	Lff9e8c
	move.b	#$22,($00000c32).l	;'"'
	move.b	#$3e,($00e840c5)	;'>'
	bsr.s	Lff9f1a
	move.b	#$02,($00e92001)
	rts

Lff9f82:
	clr.l	d0
	move.b	($00000c32).l,d0
	and.b	#$7f,d0
	rts

Lff9f90:
	tst.b	d1
	beq.s	Lff9fa4
	cmp.b	#$01,d1
	beq.s	Lff9fd2
	cmp.b	#$02,d1
	beq.s	Lff9fe2
	moveq.l	#$ff,d0
	rts

Lff9fa4:
	clr.w	($00000c32).l
	move.b	#$01,($00e9a007)
	move.b	#$03,($00e9a007)
	move.b	#$01,($00e92001)
	ori.w	#$0700,sr
	move.b	#$10,($00e840c7)
	clr.l	d0
	rts

Lff9fd2:
	ori.w	#$0700,sr
	move.b	#$20,($00e840c7)	;' '
	clr.l	d0
	rts

Lff9fe2:
	move.b	#$08,($00e840c7)
	clr.l	d0
	rts

Lff9fee:
	move.b	d2,d0
	cmp.b	#$1b,d1
	bne.s	Lffa00c
	move.b	($000009da).l,d0
	and.b	#$c0,d0
	and.b	#$3f,d2
	or.b	d2,d0
	move.b	d0,($000009da).l
Lffa00c:
	swap.w	d0
	bsr.s	Lffa022
	move.b	d1,($00e90001)
	bsr.s	Lffa022
	swap.w	d0
	move.b	d0,($00e90003)
	rts

Lffa022:
	tst.b	($00e90003)
	bmi.s	Lffa022
	rts

Lffa02c:
	clr.l	d0
	move.b	($00e90003),d0
	rts

Lffa036:
	ori.w	#$0700,sr
	move.l	($000009d6).l,d1
	cmp.l	#$05a00000,d1
	bcs.s	Lffa04a
	clr.l	d1
Lffa04a:
	divu.w	#$05a0,d1
	move.w	d1,-(a7)
	swap.w	d1
	mulu.w	#$1770,d1
	clr.l	d0
	move.w	($000009ca).l,d0
	sub.w	($000009cc).l,d0
	add.l	d1,d0
	clr.l	d1
	move.w	(a7)+,d1
	rts

Lffa06c:
	lea.l	($0000010c).l,a0
	move.l	a1,d0
	beq.s	Lffa0a4
	move.l	(a0),d0
	cmp.l	#L000000,d0
	bcs.s	Lffa0ce
	move.l	a1,(a0)
	lea.l	($00e88000),a0
	move.b	($0009,a0),d0
	or.b	#$08,d0
	move.b	d0,($0009,a0)
	move.b	($0015,a0),d0
	or.b	#$08,d0
	move.b	d0,($0015,a0)
	clr.l	d0
	rts

Lffa0a4:
	move.l	a0,-(a7)
	lea.l	($00e88000),a0
	move.b	($0009,a0),d0
	and.b	#$f7,d0
	move.b	d0,($0009,a0)
	move.b	($0015,a0),d0
	and.b	#$f7,d0
	move.b	d0,($0015,a0)
	movea.l	(a7)+,a0
	move.l	#$43ff05e4,(a0)
	clr.l	d0
Lffa0ce:
	rts

Lffa0d0:
	lea.l	($00000110).l,a0
	move.l	a1,d0
	beq.s	Lffa11c
	move.l	(a0),d0
	cmp.l	#L000000,d0
	bcs.s	Lffa14c
	move.l	a1,(a0)
	lea.l	($00e88000),a0
	move.w	d1,d0
	ror.w	#8,d0
	and.w	#$0007,d0
	or.w	#$0070,d0
	move.b	d0,($001d,a0)
	move.b	d1,($0025,a0)
	move.b	($0009,a0),d0
	or.b	#$10,d0
	move.b	d0,($0009,a0)
	move.b	($0015,a0),d0
	or.b	#$10,d0
	move.b	d0,($0015,a0)
	clr.l	d0
	rts

Lffa11c:
	move.l	a0,-(a7)
	lea.l	($00e88000),a0
	move.b	#$70,($001d,a0)		;'p'
	move.b	($0009,a0),d0
	and.b	#$ef,d0
	move.b	d0,($0009,a0)
	move.b	($0015,a0),d0
	and.b	#$ef,d0
	move.b	d0,($0015,a0)
	movea.l	(a7)+,a0
	move.l	#$44ff05e4,(a0)
	clr.l	d0
Lffa14c:
	rts

Lffa14e:
	lea.l	($00000134).l,a0
	move.l	a1,d0
	beq.s	Lffa1a0
	move.l	(a0),d0
	cmp.l	#L000000,d0
	bcs.s	Lffa1ca
	move.l	a1,(a0)
	lea.l	($00e88000),a0
	move.b	($0003,a0),d0
	and.w	#$00ef,d0
	btst.l	#$08,d1
	beq.s	Lffa17c
	or.w	#$0010,d0
Lffa17c:
	move.b	d0,($0003,a0)
	move.b	d1,($001f,a0)
	move.b	($0007,a0),d0
	or.b	#$20,d0
	move.b	d0,($0007,a0)
	move.b	($0013,a0),d0
	or.b	#$20,d0
	move.b	d0,($0013,a0)
	clr.l	d0
	rts

Lffa1a0:
	move.l	a0,-(a7)
	lea.l	($00e88000),a0
	move.b	($0007,a0),d0
	and.b	#$df,d0
	move.b	d0,($0007,a0)
	move.b	($0013,a0),d0
	and.b	#$df,d0
	move.b	d0,($0013,a0)
	movea.l	(a7)+,a0
	move.l	#$4dff05e4,(a0)
	clr.l	d0
Lffa1ca:
	rts

Lffa1cc:
	lea.l	($00000138).l,a0
	move.l	a1,d0
	beq.s	Lffa20a
	move.l	(a0),d0
	cmp.l	#L000000,d0
	bcs.s	Lffa234
	move.l	a1,(a0)
	move.w	d1,($00e80012)
	lea.l	($00e88000),a0
	move.b	($0007,a0),d0
	or.b	#$40,d0
	move.b	d0,($0007,a0)
	move.b	($0013,a0),d0
	or.b	#$40,d0
	move.b	d0,($0013,a0)
	clr.l	d0
	rts

Lffa20a:
	move.l	a0,-(a7)
	lea.l	($00e88000),a0
	move.b	($0007,a0),d0
	and.b	#$bf,d0
	move.b	d0,($0007,a0)
	move.b	($0013,a0),d0
	and.b	#$bf,d0
	move.b	d0,($0013,a0)
	movea.l	(a7)+,a0
	move.l	#$4eff05e4,(a0)
	clr.l	d0
Lffa234:
	rts

Lffa236:
	lea.l	($0000013c).l,a0
	move.l	a1,d0
	beq.s	Lffa26e
	move.l	(a0),d0
	cmp.l	#L000000,d0
	bcs.s	Lffa298
	move.l	a1,(a0)
	lea.l	($00e88000),a0
	move.b	($0007,a0),d0
	or.b	#$80,d0
	move.b	d0,($0007,a0)
	move.b	($0013,a0),d0
	or.b	#$80,d0
	move.b	d0,($0013,a0)
	clr.l	d0
	rts

Lffa26e:
	move.l	a0,-(a7)
	lea.l	($00e88000),a0
	move.b	($0007,a0),d0
	and.b	#$7f,d0
	move.b	d0,($0007,a0)
	move.b	($0013,a0),d0
	and.b	#$7f,d0
	move.b	d0,($0013,a0)
	movea.l	(a7)+,a0
	move.l	#$4fff05e4,(a0)
	clr.l	d0
Lffa298:
	rts

Lffa29a:
	lea.l	($0000018c).l,a0
	move.l	a1,d0
	beq.s	Lffa2c4
	move.l	(a0),d0
	cmp.l	#L000000,d0
	bcs.s	Lffa2dc
	move.l	a1,(a0)
	move.b	($00e9c001),d0
	bset.l	#$00,d0
	move.b	d0,($00e9c001)
	clr.l	d0
	rts

Lffa2c4:
	move.b	($00e9c001),d0
	bclr.l	#$00,d0
	move.b	d0,($00e9c001)
	move.l	#$63ff05e4,(a0)
	clr.l	d0
Lffa2dc:
	rts

Lffa2de:
	tst.b	($00000ade).l
	bne.s	Lffa310
	tst.b	($00000bc4).l
	bne.s	Lffa310
	st.b	($00000ade).l
	movem.l	d0-d7/a0-a6,-(a7)
	lea.l	($00000a7a).l,a5
	bsr.w	Lffa820
	bsr.w	Lffa734
	movem.l	(a7)+,d0-d7/a0-a6
	sf.b	($00000ade).l
Lffa310:
	rts

Lffa312:
	move.l	a5,-(a7)
	movem.l	d1-d7/a0-a4,-(a7)
	lea.l	($00000a7a).l,a5
	movem.l	d1-d2/a1,($006a,a5)
	bsr.s	Lffa36e
	st.b	($0064,a5)
	bsr.w	Lffa8cc
	bsr.w	Lffa8be
	sf.b	($0064,a5)
	movem.l	(a7)+,d1-d7/a0-a4
	movea.l	(a7)+,a5
	rts

Lffa33e:
	move.l	a5,-(a7)
	movem.l	d1-d7/a0-a4,-(a7)
	lea.l	($00000a7a).l,a5
	movem.l	d1-d2/a1,($006a,a5)
	st.b	($0064,a5)
	tst.b	($0028,a5)
	bne.s	Lffa362
	bsr.w	Lffa846
	st.b	($0028,a5)
Lffa362:
	sf.b	($0064,a5)
	movem.l	(a7)+,d1-d7/a0-a4
	movea.l	(a7)+,a5
	rts

Lffa36e:
	move.l	a5,-(a7)
	movem.l	d1-d7/a0-a4,-(a7)
	lea.l	($00000a7a).l,a5
	movem.l	d1-d2/a1,($006a,a5)
	st.b	($0064,a5)
	tst.b	($0028,a5)
	beq.s	Lffa392
	sf.b	($0028,a5)
	bsr.w	Lffa890
Lffa392:
	sf.b	($0064,a5)
	movem.l	(a7)+,d1-d7/a0-a4
	movea.l	(a7)+,a5
	rts

Lffa39e:
	move.l	a5,-(a7)
	movem.l	d1-d7/a0-a4,-(a7)
	lea.l	($00000a7a).l,a5
	movem.l	d1-d2/a1,($006a,a5)
	moveq.l	#$00,d0
	move.b	($0028,a5),d0
	ext.w	d0
	movem.l	(a7)+,d1-d7/a0-a4
	movea.l	(a7)+,a5
	rts

Lffa3c0:
	move.l	a5,-(a7)
	movem.l	d1-d7/a0-a4,-(a7)
	lea.l	($00000a7a).l,a5
	movem.l	d1-d2/a1,($006a,a5)
	move.w	($0050,a5),d0
	lsl.w	#8,d0
	move.w	($0052,a5),d1
	and.w	#$00ff,d1
	or.w	d1,d0
	swap.w	d0
	move.w	($004c,a5),d1
	lsl.w	#8,d1
	move.w	($004e,a5),d0
	and.w	#$00ff,d0
	or.w	d1,d0
	movem.l	(a7)+,d1-d7/a0-a4
	movea.l	(a7)+,a5
	rts

Lffa3fc:
	move.l	a5,-(a7)
	movem.l	d1-d7/a0-a4,-(a7)
	lea.l	($00000a7a).l,a5
	movem.l	d1-d2/a1,($006a,a5)
	move.l	($0054,a5),d0
	movem.l	(a7)+,d1-d7/a0-a4
	movea.l	(a7)+,a5
	rts

Lffa41a:
	move.l	a5,-(a7)
	movem.l	d1-d7/a0-a4,-(a7)
	lea.l	($00000a7a).l,a5
	movem.l	d1-d2/a1,($006a,a5)
	st.b	($0064,a5)
	move.l	($0020,a5),d3
	move.l	($0024,a5),d2
	move.l	d1,d0
	sub.w	d3,d2
	sub.w	d3,d0
	cmp.w	d0,d2
	bcs.s	Lffa472
	swap.w	d2
	swap.w	d3
	swap.w	d0
	sub.w	d3,d2
	sub.w	d3,d0
	cmp.w	d0,d2
	bcs.s	Lffa472
	move.b	($0028,a5),-(a7)
	bsr.w	Lffa36e
	move.l	d1,($0054,a5)
	tst.b	(a7)+
	beq.s	Lffa464
	bsr.w	Lffa33e
Lffa464:
	moveq.l	#$00,d0
Lffa466:
	sf.b	($0064,a5)
	movem.l	(a7)+,d1-d7/a0-a4
	movea.l	(a7)+,a5
	rts

Lffa472:
	moveq.l	#$ff,d0
	bra.s	Lffa466

Lffa476:
	move.l	a5,-(a7)
	movem.l	d1-d7/a0-a4,-(a7)
	lea.l	($00000a7a).l,a5
	movem.l	d1-d2/a1,($006a,a5)
	st.b	($0064,a5)
	move.l	($006a,a5),d1
	move.l	($006e,a5),d2
	cmp.w	#$03f0,d1
	bcc.s	Lffa512
	swap.w	d1
	cmp.w	#$0400,d1
	bcc.s	Lffa512
	swap.w	d1
	cmp.w	#$03f0,d2
	bcc.s	Lffa512
	cmp.w	d1,d2
	ble.s	Lffa512
	swap.w	d1
	swap.w	d2
	cmp.w	#$0400,d2
	bcc.s	Lffa512
	cmp.w	d1,d2
	ble.s	Lffa512
	swap.w	d1
	swap.w	d2
	move.b	($0028,a5),-(a7)
	bsr.w	Lffa36e
	move.l	d1,($0020,a5)
	move.l	d2,($0024,a5)
	move.l	($0054,a5),d3
	cmp.w	d3,d1
	ble.s	Lffa4da
	move.w	d1,d3
Lffa4da:
	swap.w	d1
	swap.w	d3
	cmp.w	d3,d1
	ble.s	Lffa4e4
	move.w	d1,d3
Lffa4e4:
	swap.w	d3
	cmp.w	d3,d2
	bgt.s	Lffa4ec
	move.w	d2,d3
Lffa4ec:
	swap.w	d2
	swap.w	d3
	cmp.w	d3,d2
	bgt.s	Lffa4f6
	move.w	d2,d3
Lffa4f6:
	swap.w	d3
	move.l	d3,($0054,a5)
	tst.b	(a7)+
	beq.s	Lffa504
	bsr.w	Lffa33e
Lffa504:
	moveq.l	#$00,d0
Lffa506:
	sf.b	($0064,a5)
	movem.l	(a7)+,d1-d7/a0-a4
	movea.l	(a7)+,a5
	rts

Lffa512:
	moveq.l	#$ff,d0
	bra.s	Lffa506

Lffa516:
	move.l	a5,-(a7)
	movem.l	d1-d7/a0-a4,-(a7)
	lea.l	($00000a7a).l,a5
	movem.l	d1-d2/a1,($006a,a5)
	clr.w	d7
	bra.s	Lffa542

Lffa52c:
	move.l	a5,-(a7)
	movem.l	d1-d7/a0-a4,-(a7)
	lea.l	($00000a7a).l,a5
	movem.l	d1-d2/a1,($006a,a5)
	move.w	#$ffff,d7
Lffa542:
	move.l	($0054,a5),($0058,a5)
	lea.l	($004c,a5),a0
	tst.w	($006c,a5)
	beq.s	Lffa556
	lea.l	($0002,a0),a0
Lffa556:
	move.w	#$0001,d1
	move.w	#$0064,d2		;'d'
	tst.w	($00000cb6).l
	beq.s	Lffa56a
	move.w	#$0096,d2
Lffa56a:
	move.w	($0054,a5),d0
	sub.w	($0058,a5),d0
	cmp.w	($000a,a5),d0
	bgt.s	Lffa5ce
	neg.w	d0
	cmp.w	($000a,a5),d0
	bgt.s	Lffa5ce
	move.w	($0056,a5),d0
	sub.w	($005a,a5),d0
	cmp.w	($000a,a5),d0
	bgt.s	Lffa5ce
	neg.w	d0
	cmp.w	($000a,a5),d0
	bgt.s	Lffa5ce
	tst.w	d7
	bne.s	Lffa5a0
	tst.w	(a0)
	beq.s	Lffa5d0
	bra.s	Lffa5a4

Lffa5a0:
	tst.w	(a0)
	bne.s	Lffa5d0
Lffa5a4:
	subq.w	#1,d2
	bne.s	Lffa5c6
	cmp.w	#$ffff,d1
	beq.s	Lffa5b6
	addq.w	#1,d1
	cmp.w	($0070,a5),d1
	beq.s	Lffa5c8
Lffa5b6:
	move.w	#$0064,d2		;'d'
	tst.w	($00000cb6).l
	beq.s	Lffa5c6
	move.w	#$0096,d2
Lffa5c6:
	bra.s	Lffa56a

Lffa5c8:
	move.w	#$ffff,d1
	bra.s	Lffa5d0

Lffa5ce:
	clr.w	d1
Lffa5d0:
	moveq.l	#$00,d0
	move.w	d1,d0
	movem.l	(a7)+,d1-d7/a0-a4
	movea.l	(a7)+,a5
	rts

Lffa5dc:
	move.l	a5,-(a7)
	movem.l	d1-d7/a0-a4,-(a7)
	lea.l	($00000a7a).l,a5
	movem.l	d1-d2/a1,($006a,a5)
	st.b	($0064,a5)
	move.w	($006c,a5),d1
	cmp.w	#$000f,d1
	bhi.s	Lffa61e
	tst.b	($0028,a5)
	beq.s	Lffa606
	bsr.w	Lffa890
Lffa606:
	lsl.w	#2,d1
	lea.l	($00f6,a5),a0
	lea.l	(a0,d1.w),a0
	move.l	($0072,a5),(a0)
	tst.b	($0028,a5)
	beq.s	Lffa61e
	bsr.w	Lffa846
Lffa61e:
	sf.b	($0064,a5)
	movem.l	(a7)+,d1-d7/a0-a4
	movea.l	(a7)+,a5
	rts

Lffa62a:
	move.l	a5,-(a7)
	movem.l	d1-d7/a0-a4,-(a7)
	lea.l	($00000a7a).l,a5
	movem.l	d1-d2/a1,($006a,a5)
	st.b	($0064,a5)
	tst.b	($0028,a5)
	beq.s	Lffa64a
	bsr.w	Lffa890
Lffa64a:
	move.w	($006c,a5),d0
	and.w	#$000f,d0
	lsl.w	#2,d0
	lea.l	($00f6,a5),a0
	lea.l	(a0,d0.w),a0
	movea.l	(a0),a0
	move.w	(a0)+,d0
	cmp.w	#$0010,d0
	bcs.s	Lffa668
	clr.w	d0
Lffa668:
	move.w	d0,($005c,a5)
	move.w	(a0)+,d0
	cmp.w	#$0010,d0
	bcs.s	Lffa676
	clr.w	d0
Lffa676:
	move.w	d0,($005e,a5)
	move.l	a0,($002a,a5)
	clr.w	($0046,a5)
	clr.w	($0048,a5)
	sf.b	($004a,a5)
	tst.b	($0028,a5)
	beq.s	Lffa694
	bsr.w	Lffa846
Lffa694:
	sf.b	($0064,a5)
	movem.l	(a7)+,d1-d7/a0-a4
	movea.l	(a7)+,a5
	rts

Lffa6a0:
	move.l	a5,-(a7)
	movem.l	d1-d7/a0-a4,-(a7)
	lea.l	($00000a7a).l,a5
	movem.l	d1-d2/a1,($006a,a5)
	st.b	($0064,a5)
	tst.b	($0028,a5)
	beq.s	Lffa6c0
	bsr.w	Lffa890
Lffa6c0:
	movea.l	($0072,a5),a0
	lea.l	($002a,a5),a1
	moveq.l	#$05,d7
Lffa6ca:
	move.w	(a0)+,d0
	cmp.w	#$ffff,d0
	beq.s	Lffa70e
	and.w	#$000f,d0
	lsl.w	#2,d0
	lea.l	($00f6,a5),a2
	lea.l	(a2,d0.w),a2
	movea.l	(a2),a2
	cmp.w	#$0005,d7
	bne.s	Lffa706
	move.w	(a2),d0
	cmp.w	#$0010,d0
	bcs.s	Lffa6f2
	clr.w	d0
Lffa6f2:
	move.w	d0,($005c,a5)
	move.w	($0002,a2),d0
	cmp.w	#$0010,d0
	bcs.s	Lffa702
	clr.w	d0
Lffa702:
	move.w	d0,($005e,a5)
Lffa706:
	addq.l	#4,a2
	move.l	a2,(a1)+
	dbra.w	d7,Lffa6ca
Lffa70e:
	moveq.l	#$00,d0
	move.l	d0,(a1)+
	move.w	d0,($0048,a5)
	move.w	d0,($0046,a5)
	st.b	($004a,a5)
	tst.b	($0028,a5)
	beq.s	Lffa728
	bsr.w	Lffa846
Lffa728:
	sf.b	($0064,a5)
	movem.l	(a7)+,d1-d7/a0-a4
	movea.l	(a7)+,a5
	rts

Lffa734:
	move.l	($0050,a5),d2
	tst.b	($004a,a5)
	bne.s	Lffa746
Lffa73e:
	tst.l	d2
	bne.s	Lffa772
	bra.w	Lffa7f4

Lffa746:
	addq.w	#1,($0048,a5)
	move.w	($0048,a5),d0
	cmp.w	($000c,a5),d0
	bne.s	Lffa73e
	clr.w	($0048,a5)
	addq.w	#1,($0046,a5)
	move.w	($0046,a5),d0
	lea.l	($002a,a5),a0
	lsl.w	#2,d0
	lea.l	(a0,d0.w),a0
	tst.w	(a0)
	bne.s	Lffa772
	clr.w	($0046,a5)
Lffa772:
	swap.w	d2
	move.w	d2,d0
	bsr.w	Lffa7fc
	move.w	($0054,a5),d1
	add.w	d1,d0
	cmp.w	($0020,a5),d0
	bgt.s	Lffa78a
	move.w	($0020,a5),d0
Lffa78a:
	cmp.w	($0024,a5),d0
	blt.s	Lffa794
	move.w	($0024,a5),d0
Lffa794:
	move.w	d0,d7
	swap.w	d7
	swap.w	d2
	move.w	d2,d0
	bsr.s	Lffa7fc
	move.w	($0056,a5),d1
	add.w	d1,d0
	cmp.w	($0022,a5),d0
	bgt.s	Lffa7ae
	move.w	($0022,a5),d0
Lffa7ae:
	cmp.w	($0026,a5),d0
	blt.s	Lffa7b8
	move.w	($0026,a5),d0
Lffa7b8:
	move.w	d0,d7
	tst.b	($0028,a5)
	beq.s	Lffa7f6
	sf.b	($0028,a5)
	tst.w	($0008,a5)
	beq.s	Lffa7e6
Lffa7ca:
	btst.b	#$04,($00e88001)
	bne.s	Lffa7ca
	cmpi.w	#$0070,($0056,a5)	;'p'
	bge.s	Lffa7e6
	move.l	#$00000b00,d0
Lffa7e2:
	subq.l	#1,d0
	bne.s	Lffa7e2
Lffa7e6:
	bsr.w	Lffa890
	move.l	d7,($0054,a5)
	bsr.s	Lffa846
	st.b	($0028,a5)
Lffa7f4:
	rts

Lffa7f6:
	move.l	d7,($0054,a5)
	rts

Lffa7fc:
	clr.w	-(a7)
	tst.w	d0
	bgt.s	Lffa806
	addq.w	#1,(a7)
	neg.w	d0
Lffa806:
	move.w	d0,d1
	lsr.w	#3,d1
	bne.s	Lffa810
	move.w	#$0001,d1
Lffa810:
	mulu.w	d1,d0
	move.w	d0,d1
	lsr.w	#2,d1
	add.w	d1,d0
	tst.w	(a7)+
	beq.s	Lffa81e
	neg.w	d0
Lffa81e:
	rts

Lffa820:
	moveq.l	#$ff,d1
	move.b	(a1)+,d0
	lsr.b	#1,d0
	bcs.s	Lffa82a
	clr.w	d1
Lffa82a:
	swap.w	d1
	lsr.b	#1,d0
	bcs.s	Lffa832
	clr.w	d1
Lffa832:
	move.l	d1,($004c,a5)
	move.b	(a1)+,d0
	ext.w	d0
	swap.w	d0
	move.b	(a1),d0
	ext.w	d0
	move.l	d0,($0050,a5)
	rts

Lffa846:
	move.w	($00e8002a),-(a7)
	bclr.b	#$00,($00e8002a)
	movea.l	($0004,a5),a0
	lea.l	($0076,a5),a1
	bsr.w	Lffaa32
	movea.l	($0000.w,a5),a0
	lea.l	($00b6,a5),a1
	bsr.w	Lffaa32
	lea.l	($002a,a5),a0
	move.w	($0046,a5),d0
	lsl.w	#2,d0
	lea.l	(a0,d0.w),a0
	movea.l	(a0),a2
	movea.l	($0004,a5),a0
	movea.l	($0000.w,a5),a1
	bsr.w	Lffa94e
	move.w	(a7)+,($00e8002a)
	rts

Lffa890:
	move.w	($00e8002a),-(a7)
	bclr.b	#$00,($00e8002a)
	lea.l	($0076,a5),a0
	movea.l	($0004,a5),a1
	bsr.w	Lffaa84
	lea.l	($00b6,a5),a0
	movea.l	($0000.w,a5),a1
	bsr.w	Lffaa84
	move.w	(a7)+,($00e8002a)
	rts

Lffa8be:
	lea.l	(Lffa2de,pc),a0
	move.l	a0,d1
	moveq.l	#$01,d2
	bsr.w	Lff8438
	rts

Lffa8cc:
	lea.l	($0000.w,a5),a1
	lea.l	(Lffabe6,pc),a0
	move.l	#$0000001f.l,d1
Lffa8da:
	move.b	(a0)+,(a1)+
	dbra.w	d1,Lffa8da
	lea.l	($00f6,a5),a0
	moveq.l	#$03,d1
	lea.l	(Lffaad6,pc),a1
	move.l	a1,d2
Lffa8ec:
	move.l	a1,(a0)+
	lea.l	($0044,a1),a1
	dbra.w	d1,Lffa8ec
	moveq.l	#$0b,d1
Lffa8f8:
	move.l	d2,(a0)+
	dbra.w	d1,Lffa8f8
	movea.l	($00f6,a5),a0
	move.w	(a0)+,($005c,a5)
	move.w	(a0)+,($005e,a5)
	move.l	a0,($002a,a5)
	move.w	#$0002,($0020,a5)
	move.w	#$0002,($0022,a5)
	move.w	($0000096c).l,d0
	subq.w	#2,d0
	move.w	d0,($0024,a5)
	move.w	($0000096e).l,d0
	move.w	d0,($0026,a5)
	move.w	($0020,a5),($0054,a5)
	move.w	($0022,a5),($0056,a5)
	sf.b	($0064,a5)
	sf.b	($0028,a5)
	sf.b	($004a,a5)
	clr.w	($0046,a5)
	rts

Lffa94e:
	moveq.l	#$00,d0
	move.w	($0056,a5),d0
	sub.w	($005e,a5),d0
	bpl.s	Lffa970
	add.w	#$000f,d0
	bmi.s	Lffa9d4
	move.w	d0,d2
	add.w	d0,d0
	adda.w	#$001e,a2
	suba.w	d0,a2
	move.w	#$0080,d4
	bra.s	Lffa98a

Lffa970:
	moveq.l	#$0f,d2
	cmp.w	#$03f0,d0
	bls.s	Lffa980
	move.w	#$03ff,d2
	sub.w	d0,d2
	bmi.s	Lffa9d4
Lffa980:
	move.w	#$0080,d4
	mulu.w	d4,d0
	adda.l	d0,a0
	adda.l	d0,a1
Lffa98a:
	move.w	($0054,a5),d0
	sub.w	($005c,a5),d0
	bpl.s	Lffa99c
	neg.w	d0
	move.w	d0,d3
	moveq.l	#$00,d1
	bra.s	Lffa9fa

Lffa99c:
	move.w	d0,d1
	lsr.w	#4,d1
	add.w	d1,d1
	adda.w	d1,a0
	adda.w	d1,a1
	and.w	#$000f,d0
	beq.s	Lffaa1a
	moveq.l	#$10,d3
	sub.w	d0,d3
	cmp.w	#$007e,d1		;'~'
	bcc.s	Lffa9d6
Lffa9b6:
	moveq.l	#$ff,d0
	moveq.l	#$00,d1
	move.w	($0020,a2),d1
	move.w	(a2)+,d0
	rol.l	d3,d0
	rol.l	d3,d1
	and.l	d0,(a1)
	or.l	d1,(a1)
	not.l	d0
	or.l	d0,(a0)
	adda.w	d4,a0
	adda.w	d4,a1
	dbra.w	d2,Lffa9b6
Lffa9d4:
	rts

Lffa9d6:
	moveq.l	#$ff,d0
	moveq.l	#$00,d1
	move.w	($0020,a2),d1
	move.w	(a2)+,d0
	rol.l	d3,d0
	rol.l	d3,d1
	swap.w	d0
	swap.w	d1
	and.w	d0,(a1)
	or.w	d1,(a1)
	not.w	d0
	or.w	d0,(a0)
	adda.w	d4,a0
	adda.w	d4,a1
	dbra.w	d2,Lffa9d6
	rts

Lffa9fa:
	moveq.l	#$ff,d0
	moveq.l	#$00,d1
	move.w	($0020,a2),d1
	move.w	(a2)+,d0
	rol.l	d3,d0
	rol.l	d3,d1
	and.w	d0,(a1)
	or.w	d1,(a1)
	not.w	d0
	or.w	d0,(a0)
	adda.w	d4,a0
	adda.w	d4,a1
	dbra.w	d2,Lffa9fa
	rts

Lffaa1a:
	move.w	($0020,a2),d1
	move.w	(a2)+,d0
	and.w	d0,(a1)
	or.w	d1,(a1)
	not.w	d0
	or.w	d0,(a0)
	adda.w	d4,a0
	adda.w	d4,a1
	dbra.w	d2,Lffaa1a
	rts

Lffaa32:
	moveq.l	#$00,d0
	move.w	($0056,a5),d0
	sub.w	($005e,a5),d0
	bpl.s	Lffaa40
	moveq.l	#$00,d0
Lffaa40:
	moveq.l	#$0f,d2
	cmp.w	#$03f0,d0
	bls.s	Lffaa50
	move.w	#$03ff,d2
	sub.w	d0,d2
	bmi.s	Lffaa82
Lffaa50:
	move.w	#$0080,d1
	mulu.w	d1,d0
	adda.l	d0,a0
	move.w	($0054,a5),d0
	sub.w	($005c,a5),d0
	bpl.s	Lffaa64
	moveq.l	#$00,d0
Lffaa64:
	lsr.w	#4,d0
	add.w	d0,d0
	adda.w	d0,a0
	cmp.w	#$007e,d0		;'~'
	bcc.s	Lffaa7a
Lffaa70:
	move.l	(a0),(a1)+
	adda.w	d1,a0
	dbra.w	d2,Lffaa70
	rts

Lffaa7a:
	move.w	(a0),(a1)+
	adda.w	d1,a0
	dbra.w	d2,Lffaa7a
Lffaa82:
	rts

Lffaa84:
	moveq.l	#$00,d0
	move.w	($0056,a5),d0
	sub.w	($005e,a5),d0
	bpl.s	Lffaa92
	moveq.l	#$00,d0
Lffaa92:
	moveq.l	#$0f,d2
	cmp.w	#$03f0,d0
	bls.s	Lffaaa2
	move.w	#$03ff,d2
	sub.w	d0,d2
	bmi.s	Lffaad4
Lffaaa2:
	move.w	#$0080,d1
	mulu.w	d1,d0
	adda.l	d0,a1
	move.w	($0054,a5),d0
	sub.w	($005c,a5),d0
	bpl.s	Lffaab6
	moveq.l	#$00,d0
Lffaab6:
	lsr.w	#4,d0
	add.w	d0,d0
	adda.w	d0,a1
	cmp.w	#$007e,d0		;'~'
	bcc.s	Lffaacc
Lffaac2:
	move.l	(a0)+,(a1)
	adda.w	d1,a1
	dbra.w	d2,Lffaac2
	rts

Lffaacc:
	move.w	(a0)+,(a1)
	adda.w	d1,a1
	dbra.w	d2,Lffaacc
Lffaad4:
	rts

Lffaad6:
	.dc.b	$00,$00,$00,$00,$3f,$ff,$1f,$ff
	.dc.b	$0f,$ff,$07,$ff,$03,$ff,$01,$ff
	.dc.b	$00,$ff,$00,$7f,$00,$3f,$00,$1f
	.dc.b	$01,$ff,$10,$ff,$30,$ff,$f8,$7f
	.dc.b	$f8,$7f,$fc,$ff,$00,$00,$40,$00
	.dc.b	$60,$00,$70,$00,$78,$00,$7c,$00
	.dc.b	$7e,$00,$7f,$00,$7f,$80,$7c,$00
	.dc.b	$6c,$00,$46,$00,$06,$00,$03,$00
	.dc.b	$03,$00,$00,$00,$00,$07,$00,$07
	.dc.b	$80,$01,$80,$01,$c0,$03,$c0,$03
	.dc.b	$c0,$03,$e0,$07,$f0,$0f,$f0,$0f
	.dc.b	$f0,$0f,$f0,$0f,$e0,$07,$c0,$03
	.dc.b	$c0,$03,$c0,$03,$80,$01,$80,$01
	.dc.b	$00,$00,$3f,$fc,$10,$08,$10,$08
	.dc.b	$17,$e8,$0b,$d0,$09,$50,$04,$20
	.dc.b	$06,$a0,$09,$50,$08,$10,$12,$88
	.dc.b	$13,$c8,$17,$e8,$3f,$fc,$00,$00
	.dc.b	$00,$07,$00,$07,$80,$01,$80,$01
	.dc.b	$c0,$03,$c0,$03,$c0,$03,$e0,$07
	.dc.b	$f0,$0f,$f0,$0f,$f0,$0f,$f0,$0f
	.dc.b	$e0,$07,$c0,$03,$c0,$03,$c0,$03
	.dc.b	$80,$01,$80,$01,$00,$00,$3f,$fc
	.dc.b	$10,$08,$10,$08,$17,$e8,$0b,$d0
	.dc.b	$0a,$90,$05,$60,$04,$20,$0a,$90
	.dc.b	$09,$50,$10,$08,$13,$c8,$17,$e8
	.dc.b	$3f,$fc,$00,$00,$00,$07,$00,$07
	.dc.b	$80,$01,$80,$01,$c0,$03,$c0,$03
	.dc.b	$c0,$03,$e0,$07,$f0,$0f,$f0,$0f
	.dc.b	$f0,$0f,$f0,$0f,$e0,$07,$c0,$03
	.dc.b	$c0,$03,$c0,$03,$80,$01,$80,$01
	.dc.b	$00,$00,$3f,$fc,$10,$08,$10,$08
	.dc.b	$17,$e8,$0b,$d0,$08,$10,$06,$a0
	.dc.b	$05,$60,$08,$10,$0a,$90,$11,$48
	.dc.b	$13,$c8,$17,$e8,$3f,$fc,$00,$00
Lffabe6:
	.dc.b	$00,$e6,$00,$00,$00,$e4,$00,$00
	.dc.b	$00,$00,$00,$05,$00,$04,$00,$00
	.dc.b	$00,$f6,$00,$00,$00,$00,$00,$80
	.dc.b	$03,$f0,$04,$00,$03,$f0,$00,$80
	.dc.b	$42,$80,$30,$01,$e5,$80,$20,$40
	.dc.b	$20,$10,$20,$89,$4e,$75
Lffac14:
	cmpa.l	#$00000000,a1
	beq.s	Lffac2c
	lea.l	($000e,a7),a0
	clr.l	d0
	move.l	-(a0),-(a1)
	move.w	-(a0),-(a1)
	andi.w	#$dfff,(a1)
	bra.s	Lffac46

Lffac2c:
	moveq.l	#$ff,d0
	btst.b	#$05,($0008,a7)
	bne.s	Lffac4c
	lea.l	($000e,a7),a0
	move.l	usp,a1
	move.l	a0,d0
	move.l	-(a0),-(a1)
	move.w	-(a0),-(a1)
	ori.w	#$2000,(a1)
Lffac46:
	move.l	-(a0),-(a1)
	move.l	-(a0),-(a1)
	movea.l	a1,a7
Lffac4c:
	rts

Lffac4e:
	move.b	(a1)+,d0
	rts

Lffac52:
	move.w	(a1)+,d0
	rts

Lffac56:
	move.l	(a1)+,d0
	rts

Lffac5a:
	swap.w	d1
Lffac5c:
	swap.w	d1
Lffac5e:
	move.b	(a1)+,(a2)+
	dbra.w	d1,Lffac5e
	swap.w	d1
	dbra.w	d1,Lffac5c
	rts

Lffac6c:
	move.b	d1,(a1)+
	rts

Lffac70:
	move.w	d1,(a1)+
	rts

Lffac74:
	move.l	d1,(a1)+
	rts

Lffac78:
	swap.w	d1
Lffac7a:
	swap.w	d1
Lffac7c:
	move.b	(a2)+,(a1)+
	dbra.w	d1,Lffac7c
	swap.w	d1
	dbra.w	d1,Lffac7a
	rts

Lffac8a:
	cmp.l	#$0000ff00,d2
	bcs.s	Lffacc6
	move.l	d2,-(a7)
	move.l	#$0000ff00,d2
	bsr.s	Lffacc6
	btst.l	#$00,d1
	beq.s	Lffaca4
	adda.l	d2,a2
Lffaca4:
	btst.l	#$01,d1
	beq.s	Lffacac
	suba.l	d2,a2
Lffacac:
	btst.l	#$02,d1
	beq.s	Lffacb4
	adda.l	d2,a1
Lffacb4:
	btst.l	#$03,d1
	beq.s	Lffacbc
	suba.l	d2,a1
Lffacbc:
	move.l	d2,d0
	move.l	(a7)+,d2
	sub.l	d0,d2
	bne.s	Lffac8a
	rts

Lffacc6:
	tst.b	($00000c34).l
	bne.s	Lffacc6
	move.b	#$8a,($00000c34).l
	move.b	d1,d0
	and.b	#$80,d0
	or.b	#$01,d0
	move.b	d0,($00e84085)
	move.l	a1,($00e8408c)
	move.b	d1,d0
	and.b	#$7f,d0
	move.b	d0,($00e84086)
	move.l	a2,($00e84094)
	move.b	#$ff,($00e84080)
	move.w	d2,($00e8408a)
	move.b	#$88,($00e84087)
	rts

Lffad16:
	tst.b	($00000c34).l
	bne.s	Lffad16
	move.b	#$8b,($00000c34).l
	move.b	d1,d0
	and.b	#$80,d0
	or.b	#$09,d0
	move.b	d0,($00e84085)
Lffad36:
	move.l	a1,($00e8409c)
	move.b	d1,d0
	and.b	#$7f,d0
	move.b	d0,($00e84086)
	move.l	a2,($00e84094)
	move.b	#$ff,($00e84080)
	move.w	d2,($00e8409a)
	move.b	#$88,($00e84087)
	rts

Lffad66:
	tst.b	($00000c34).l
	bne.s	Lffad66
	move.b	#$8c,($00000c34).l
	move.b	d1,d0
	and.b	#$80,d0
	or.b	#$0d,d0
	move.b	d0,($00e84085)
	bra.s	Lffad36

Lffad88:
	clr.l	d0
	move.b	($00000c34).l,d0
	rts

Lffad92:
	clr.l	d0
	move.b	($000009df).l,d0
	ror.l	#8,d0
	move.b	($000009e0).l,d0
	cmp.b	#$01,d0
	beq.s	Lffadb0
	cmp.b	#$02,d0
	beq.s	Lffadbe
	rts

Lffadb0:
	clr.w	d0
	move.l	d0,-(a7)
	move.l	($00ed000c),d0
	or.l	(a7)+,d0
	rts

Lffadbe:
	clr.w	d0
	move.l	d0,-(a7)
	move.l	($00ed0010),d0
	or.l	(a7)+,d0
	rts

Lffadcc:
	movem.l	d1-d2/a1,-(a7)
	move.w	#$0020,($00e82600)	;' '
	bset.b	#$03,($00e80028)
	lea.l	($00c00000),a0
	move.l	a0,($0000095c).l
	lea.l	($00c80000),a1
	bsr.w	Lffaeec
	bclr.b	#$03,($00e80028)
	bsr.s	Lffae32
	and.w	#$0003,d0
	bne.s	Lffae0c
	bsr.w	Lffaea2
	bra.s	Lffae1c

Lffae0c:
	cmp.w	#$0001,d0
	bne.s	Lffae18
	bsr.w	Lffaeb8
	bra.s	Lffae1c

Lffae18:
	bsr.w	Lffaed0
Lffae1c:
	bclr.b	#$03,($00e80028)
	move.w	#$003f,($00e82600)	;'?'
	movem.l	(a7)+,d1-d2/a1
	rts

Lffae32:
	move.b	($00e80028),d1
	or.b	#$07,d1
	move.b	($0000093c).l,d0
	move.b	d0,d2
	and.b	#$0f,d2
	cmp.b	#$04,d2
	bcs.s	Lffae52
	and.b	#$fb,d1
Lffae52:
	moveq.l	#$ff,d2
	and.w	#$000c,d0
	cmp.b	#$0c,d0
	beq.s	Lffae72
	bclr.l	#$01,d1
	move.w	#$00ff,d2
	cmp.b	#$08,d0
	beq.s	Lffae72
	bclr.l	#$00,d1
	moveq.l	#$0f,d2
Lffae72:
	move.b	d1,d0
	move.w	d2,($00000964).l
	and.w	#$0007,d0
	move.b	d1,($00e80028)
	move.w	d0,($00e82400)
	move.b	d1,d0
	move.l	#$00000400,d1
	btst.l	#$02,d0
	beq.s	Lffae9a
	add.l	d1,d1
Lffae9a:
	move.l	d1,($00000960).l
	rts

Lffaea2:
	lea.l	(Lffaef4),a0
	lea.l	($00e82000),a1
	moveq.l	#$0f,d0
Lffaeb0:
	move.w	(a0)+,(a1)+
	dbra.w	d0,Lffaeb0
	rts

Lffaeb8:
	lea.l	(Lffaf14),a0
	lea.l	($00e82000),a1
	move.w	#$00ff,d0
Lffaec8:
	move.w	(a0)+,(a1)+
	dbra.w	d0,Lffaec8
	rts

Lffaed0:
	lea.l	($00e82000),a0
	move.w	#$007f,d0
	move.w	#$0001,d1
Lffaede:
	move.w	d1,(a0)+
	move.w	d1,(a0)+
	addi.w	#$0202,d1
	dbra.w	d0,Lffaede
	rts

Lffaeec:
	clr.l	(a0)+
	cmpa.l	a1,a0
	bne.s	Lffaeec
	rts

Lffaef4:
	.dc.b	$00,$00,$52,$94,$00,$20,$00,$3e
	.dc.b	$04,$00,$07,$c0,$04,$20,$07,$fe
	.dc.b	$80,$00,$f8,$00,$80,$20,$f8,$3e
	.dc.b	$84,$00,$ff,$c0,$ad,$6a,$ff,$fe
Lffaf14:
	.dc.b	$00,$00,$00,$08,$00,$12,$00,$1a
	.dc.b	$00,$24,$00,$2c,$00,$36,$00,$3e
	.dc.b	$01,$00,$01,$08,$01,$12,$01,$1a
	.dc.b	$01,$24,$01,$2c,$01,$36,$01,$3e
	.dc.b	$02,$40,$02,$48,$02,$52,$02,$5a
	.dc.b	$02,$64,$02,$6c,$02,$76,$02,$7e
	.dc.b	$03,$40,$03,$48,$03,$52,$03,$5a
	.dc.b	$03,$64,$03,$6c,$03,$76,$03,$7e
	.dc.b	$04,$80,$04,$88,$04,$92,$04,$9a
	.dc.b	$04,$a4,$04,$ac,$04,$b6,$04,$be
	.dc.b	$05,$80,$05,$88,$05,$92,$05,$9a
	.dc.b	$05,$a4,$05,$ac,$05,$b6,$05,$be
	.dc.b	$06,$c0,$06,$c8,$06,$d2,$06,$da
	.dc.b	$06,$e4,$06,$ec,$06,$f6,$06,$fe
	.dc.b	$07,$c0,$07,$c8,$07,$d2,$07,$da
	.dc.b	$07,$e4,$07,$ec,$07,$f6,$07,$fe
	.dc.b	$50,$00,$50,$08,$50,$12,$50,$1a
	.dc.b	$50,$24,$50,$2c,$50,$36,$50,$3e
	.dc.b	$51,$00,$51,$08,$51,$12,$51,$1a
	.dc.b	$51,$24,$51,$2c,$51,$36,$51,$3e
	.dc.b	$52,$40,$52,$48,$52,$52,$52,$5a
	.dc.b	$52,$64,$52,$6c,$52,$76,$52,$7e
	.dc.b	$53,$40,$53,$48,$53,$52,$53,$5a
	.dc.b	$53,$64,$53,$6c,$53,$76,$53,$7e
	.dc.b	$54,$80,$54,$88,$54,$92,$54,$9a
	.dc.b	$54,$a4,$54,$ac,$54,$b6,$54,$be
	.dc.b	$55,$80,$55,$88,$55,$92,$55,$9a
	.dc.b	$55,$a4,$55,$ac,$55,$b6,$55,$be
	.dc.b	$56,$c0,$56,$c8,$56,$d2,$56,$da
	.dc.b	$56,$e4,$56,$ec,$56,$f6,$56,$fe
	.dc.b	$57,$c0,$57,$c8,$57,$d2,$57,$da
	.dc.b	$57,$e4,$57,$ec,$57,$f6,$57,$fe
	.dc.b	$a8,$00,$a8,$08,$a8,$12,$a8,$1a
	.dc.b	$a8,$24,$a8,$2c,$a8,$36,$a8,$3e
	.dc.b	$a9,$00,$a9,$08,$a9,$12,$a9,$1a
	.dc.b	$a9,$24,$a9,$2c,$a9,$36,$a9,$3e
	.dc.b	$aa,$40,$aa,$48,$aa,$52,$aa,$5a
	.dc.b	$aa,$64,$aa,$6c,$aa,$76,$aa,$7e
	.dc.b	$ab,$40,$ab,$48,$ab,$52,$ab,$5a
	.dc.b	$ab,$64,$ab,$6c,$ab,$76,$ab,$7e
	.dc.b	$ac,$80,$ac,$88,$ac,$92,$ac,$9a
	.dc.b	$ac,$a4,$ac,$ac,$ac,$b6,$ac,$be
	.dc.b	$ad,$80,$ad,$88,$ad,$92,$ad,$9a
	.dc.b	$ad,$a4,$ad,$ac,$ad,$b6,$ad,$be
	.dc.b	$ae,$c0,$ae,$c8,$ae,$d2,$ae,$da
	.dc.b	$ae,$e4,$ae,$ec,$ae,$f6,$ae,$fe
	.dc.b	$af,$c0,$af,$c8,$af,$d2,$af,$da
	.dc.b	$af,$e4,$af,$ec,$af,$f6,$af,$fe
	.dc.b	$f8,$00,$f8,$08,$f8,$12,$f8,$1a
	.dc.b	$f8,$24,$f8,$2c,$f8,$36,$f8,$3e
	.dc.b	$f9,$00,$f9,$08,$f9,$12,$f9,$1a
	.dc.b	$f9,$24,$f9,$2c,$f9,$36,$f9,$3e
	.dc.b	$fa,$40,$fa,$48,$fa,$52,$fa,$5a
	.dc.b	$fa,$64,$fa,$6c,$fa,$76,$fa,$7e
	.dc.b	$fb,$40,$fb,$48,$fb,$52,$fb,$5a
	.dc.b	$fb,$64,$fb,$6c,$fb,$76,$fb,$7e
	.dc.b	$fc,$80,$fc,$88,$fc,$92,$fc,$9a
	.dc.b	$fc,$a4,$fc,$ac,$fc,$b6,$fc,$be
	.dc.b	$fd,$80,$fd,$88,$fd,$92,$fd,$9a
	.dc.b	$fd,$a4,$fd,$ac,$fd,$b6,$fd,$be
	.dc.b	$fe,$c0,$fe,$c8,$fe,$d2,$fe,$da
	.dc.b	$fe,$e4,$fe,$ec,$fe,$f6,$fe,$fe
	.dc.b	$ff,$c0,$ff,$c8,$ff,$d2,$ff,$da
	.dc.b	$ff,$e4,$ff,$ec,$ff,$f6,$ff,$fe
	.dc.b	$42,$80,$10,$39,$00,$e8,$00,$28
	.dc.b	$48,$e7,$c0,$00,$b2,$3c,$00,$ff
	.dc.b	$67,$2a,$c2,$3c,$00,$07,$c0,$3c
	.dc.b	$00,$f8,$80,$01,$13,$c0,$00,$e8
	.dc.b	$00,$28,$33,$c1,$00,$e8,$24,$00
	.dc.b	$20,$3c,$00,$00,$04,$00,$c2,$7c
	.dc.b	$00,$04,$67,$02,$d0,$80,$23,$c0
	.dc.b	$00,$00,$09,$60,$4c,$df,$00,$03
	.dc.b	$4e,$75
Lffb156:
	clr.l	d0
	move.w	($00e82500),d0
	cmp.w	#$ffff,d1
	beq.s	Lffb16a
	move.w	d1,($00e82500)
Lffb16a:
	rts

Lffb16c:
	clr.l	d0
	move.w	($00e82600),d0
	cmp.w	#$ffff,d1
	beq.s	Lffb180
	move.w	d1,($00e82600)
Lffb180:
	rts

Lffb182:
	lea.l	($00e82000),a0
	move.w	($00000964).l,d0
	beq.s	Lffb1b8
	cmp.w	#$ffff,d0
	beq.s	Lffb1bc
	clr.l	d0
	move.w	d1,d0
	cmp.w	($00000964).l,d0
	bhi.s	Lffb1b8
	add.w	d0,d0
	adda.l	d0,a0
	cmp.l	#$ffffffff,d2
	beq.s	Lffb1b4
	move.w	d2,(a0)
	clr.l	d0
	rts

Lffb1b4:
	move.w	(a0),d0
	rts

Lffb1b8:
	moveq.l	#$ff,d0
	rts

Lffb1bc:
	clr.l	d0
	move.l	d3,-(a7)
	clr.l	d3
	move.b	d1,d0
	ror.l	#1,d0
	asl.w	#1,d0
	rol.l	#1,d0
	cmp.l	#$ffffffff,d2
	beq.s	Lffb1d8
	move.b	d2,(a0,d0.w)
	bra.s	Lffb1de

Lffb1d8:
	move.b	(a0,d0.w),d3
	rol.w	#8,d3
Lffb1de:
	move.w	d1,d0
	lsr.w	#8,d0
	ror.l	#1,d0
	asl.w	#1,d0
	rol.l	#1,d0
	ror.w	#8,d2
	cmp.l	#$ffffffff,d2
	beq.s	Lffb1f8
	move.b	d2,($02,a0,d0.w)
	bra.s	Lffb1fe

Lffb1f8:
	move.b	(a0,d0.w),d3
	ror.w	#8,d3
Lffb1fe:
	rol.w	#8,d2
	move.l	d3,d0
	move.l	(a7)+,d3
	rts

Lffb206:
	and.w	($00000964).l,d1
	move.w	d1,($00000966).l
	rts

Lffb214:
	move.w	d1,d0
	and.w	#$0003,d0
	asl.w	#3,d0
	add.w	#$00c0,d0
	swap.w	d0
	clr.w	d0
	move.l	d0,($0000095c).l
	rts

Lffb22c:
	movem.l	d1-d5/a1,-(a7)
	bsr.w	Lffb4b4
	move.w	($00000964).l,d4
	move.w	d4,(a1)+
	bsr.s	Lffb244
	movem.l	(a7)+,d1-d5/a1
	rts

Lffb244:
	cmp.w	#$ffff,d4
	beq.s	Lffb2ba
	cmp.w	#$00ff,d4
	beq.s	Lffb2a8
	btst.l	#$00,d1
	beq.s	Lffb278
Lffb256:
	move.w	d1,d4
Lffb258:
	move.w	(a0)+,d0
	and.w	#$000f,d0
	asl.w	#4,d0
	move.w	(a0)+,d5
	and.w	#$000f,d5
	or.b	d5,d0
	move.b	d0,(a1)+
	subq.w	#1,d4
	dbra.w	d4,Lffb258
	adda.l	d3,a0
	dbra.w	d2,Lffb256
	rts

Lffb278:
	move.w	d1,d4
Lffb27a:
	move.w	(a0)+,d0
	and.w	#$000f,d0
	asl.w	#4,d0
	subq.w	#1,d4
	bcs.s	Lffb29e
Lffb286:
	move.w	(a0)+,d5
	and.w	#$000f,d5
	or.b	d5,d0
	move.b	d0,(a1)+
	dbra.w	d4,Lffb27a
	move.w	d1,d4
	adda.l	d3,a0
	dbra.w	d2,Lffb27a
	rts

Lffb29e:
	move.w	d1,d4
	adda.l	d3,a0
	dbra.w	d2,Lffb286
	rts

Lffb2a8:
	move.w	d1,d4
Lffb2aa:
	move.w	(a0)+,d0
	move.b	d0,(a1)+
	dbra.w	d4,Lffb2aa
	adda.l	d3,a0
	dbra.w	d2,Lffb2a8
	rts

Lffb2ba:
	move.w	d1,d4
Lffb2bc:
	move.w	(a0)+,(a1)+
	dbra.w	d4,Lffb2bc
	adda.l	d3,a0
	dbra.w	d2,Lffb2ba
	rts

Lffb2ca:
	movem.l	d1-d6/a1,-(a7)
	move.w	d3,d6
	bsr.w	Lffb4b4
	move.w	(a1)+,d4
	moveq.l	#$ff,d0
	cmp.w	($00000964).l,d4
	bne.s	Lffb2e4
	bsr.s	Lffb2ea
	clr.l	d0
Lffb2e4:
	movem.l	(a7)+,d1-d6/a1
	rts

Lffb2ea:
	cmp.w	#$ffff,d4
	beq.w	Lffb382
	cmp.w	#$00ff,d4
	beq.s	Lffb368
	btst.l	#$00,d1
	beq.s	Lffb32c
Lffb2fe:
	move.w	d1,d4
Lffb300:
	move.b	(a1)+,d5
	move.b	d5,d0
	lsr.b	#4,d0
	and.w	#$000f,d0
	cmp.w	d6,d0
	beq.s	Lffb310
	move.w	d0,(a0)
Lffb310:
	addq.l	#2,a0
	and.w	#$000f,d5
	cmp.w	d6,d5
	beq.s	Lffb31c
	move.w	d5,(a0)
Lffb31c:
	addq.l	#2,a0
	subq.w	#1,d4
	dbra.w	d4,Lffb300
	adda.l	d3,a0
	dbra.w	d2,Lffb2fe
	rts

Lffb32c:
	move.w	d1,d4
Lffb32e:
	move.b	(a1)+,d5
	move.b	d5,d0
	lsr.b	#4,d0
	and.w	#$000f,d0
	cmp.w	d6,d0
	beq.s	Lffb33e
	move.w	d0,(a0)
Lffb33e:
	addq.l	#2,a0
	subq.w	#1,d4
	bcs.s	Lffb35e
Lffb344:
	and.w	#$000f,d5
	cmp.w	d6,d5
	beq.s	Lffb34e
	move.w	d5,(a0)
Lffb34e:
	addq.l	#2,a0
	dbra.w	d4,Lffb32e
	move.w	d1,d4
	adda.l	d3,a0
	dbra.w	d2,Lffb32e
	rts

Lffb35e:
	move.w	d1,d4
	adda.l	d3,a0
	dbra.w	d2,Lffb344
	rts

Lffb368:
	move.w	d1,d4
Lffb36a:
	clr.w	d0
	move.b	(a1)+,d0
	cmp.w	d6,d0
	beq.s	Lffb374
	move.w	d0,(a0)
Lffb374:
	addq.l	#2,a0
	dbra.w	d4,Lffb36a
	adda.l	d3,a0
	dbra.w	d2,Lffb368
	rts

Lffb382:
	move.w	d1,d4
Lffb384:
	move.w	(a1)+,d0
	cmp.w	d6,d0
	beq.s	Lffb38c
	move.w	d0,(a0)
Lffb38c:
	addq.l	#2,a0
	dbra.w	d4,Lffb384
	adda.l	d3,a0
	dbra.w	d2,Lffb382
	rts

Lffb39a:
	movem.l	d1-d5/a1,-(a7)
	bsr.w	Lffb4b4
	move.w	(a1)+,d4
	moveq.l	#$ff,d0
	cmp.w	($00000964).l,d4
	bne.s	Lffb3b2
	bsr.s	Lffb3b8
	clr.l	d0
Lffb3b2:
	movem.l	(a7)+,d1-d5/a1
	rts

Lffb3b8:
	cmp.w	#$ffff,d4
	beq.s	Lffb430
	cmp.w	#$00ff,d4
	beq.s	Lffb41c
	btst.l	#$00,d1
	beq.s	Lffb3ec
Lffb3ca:
	move.w	d1,d4
Lffb3cc:
	move.b	(a1)+,d5
	move.b	d5,d0
	lsr.b	#4,d0
	and.w	#$000f,d0
	move.w	d0,(a0)+
	and.w	#$000f,d5
	move.w	d5,(a0)+
	subq.w	#1,d4
	dbra.w	d4,Lffb3cc
	adda.l	d3,a0
	dbra.w	d2,Lffb3ca
	rts

Lffb3ec:
	move.w	d1,d4
Lffb3ee:
	move.b	(a1)+,d5
	move.b	d5,d0
	lsr.b	#4,d0
	and.w	#$000f,d0
	move.w	d0,(a0)+
	subq.w	#1,d4
	bcs.s	Lffb412
Lffb3fe:
	and.w	#$000f,d5
	move.w	d5,(a0)+
	dbra.w	d4,Lffb3ee
	move.w	d1,d4
	adda.l	d3,a0
	dbra.w	d2,Lffb3ee
	rts

Lffb412:
	move.w	d1,d4
	adda.l	d3,a0
	dbra.w	d2,Lffb3fe
	rts

Lffb41c:
	move.w	d1,d4
Lffb41e:
	clr.w	d0
	move.b	(a1)+,d0
	move.w	d0,(a0)+
	dbra.w	d4,Lffb41e
	adda.l	d3,a0
	dbra.w	d2,Lffb41c
	rts

Lffb430:
	move.w	d1,d4
Lffb432:
	move.w	(a1)+,(a0)+
	dbra.w	d4,Lffb432
	adda.l	d3,a0
	dbra.w	d2,Lffb430
	rts

Lffb440:
	movem.l	d1-d5/a1,-(a7)
	bsr.s	Lffb4b4
	move.w	($00000966).l,d0
Lffb44c:
	move.w	d1,d4
	swap.w	d2
Lffb450:
	move.b	(a1)+,d5
	move.w	#$0007,d2
Lffb456:
	rol.b	#1,d5
	bcc.s	Lffb45c
	move.w	d0,(a0)
Lffb45c:
	addq.l	#2,a0
	dbra.w	d4,Lffb470
	adda.l	d3,a0
	swap.w	d2
	dbra.w	d2,Lffb44c
Lffb46a:
	movem.l	(a7)+,d1-d5/a1
	rts

Lffb470:
	dbra.w	d2,Lffb456
	bra.s	Lffb450

Lffb476:
	movem.l	d1-d5/a1,-(a7)
	move.w	d3,d0
	bsr.s	Lffb4b4
	swap.w	d0
	move.w	($00000966).l,d0
Lffb486:
	move.w	d1,d4
	swap.w	d2
Lffb48a:
	move.b	(a1)+,d5
	move.w	#$0007,d2
Lffb490:
	rol.b	#1,d5
	bcc.s	Lffb498
	move.w	d0,(a0)
	bra.s	Lffb49e

Lffb498:
	swap.w	d0
	move.w	d0,(a0)
	swap.w	d0
Lffb49e:
	addq.l	#2,a0
	dbra.w	d4,Lffb4ae
	adda.l	d3,a0
	swap.w	d2
	dbra.w	d2,Lffb486
	bra.s	Lffb46a

Lffb4ae:
	dbra.w	d2,Lffb490
	bra.s	Lffb48a

Lffb4b4:
	move.l	($00000960).l,d3
	and.l	#$0000ffff,d1
	asl.l	#1,d1
	mulu.w	d3,d2
	add.l	d1,d2
	movea.l	($0000095c).l,a0
	adda.l	d2,a0
	move.w	(a1)+,d1
	sub.w	d1,d3
	sub.w	d1,d3
	subq.w	#1,d1
	move.w	(a1)+,d2
	subq.w	#1,d2
	rts

Lffb4dc:
	movem.l	d1-d7/a1-a2,-(a7)
	subq.w	#1,d3
	cmp.w	#$03ff,d3
	bcc.w	Lffb56a
	subq.w	#1,d4
	cmp.w	#$03ff,d4
	bcc.s	Lffb56a
	move.w	d3,d6
	move.w	d4,d7
	move.l	($00000960).l,d3
	and.l	#$0000ffff,d1
	asl.l	#1,d1
	mulu.w	d3,d2
	add.l	d1,d2
	movea.l	($0000095c).l,a2
	adda.l	d2,a2
	move.w	(a1)+,d1
	subq.w	#1,d1
	move.w	(a1)+,d2
	subq.w	#1,d2
	move.w	($00000966).l,d0
Lffb51e:
	move.w	d1,d4
	movea.l	a2,a0
	swap.w	d2
Lffb524:
	move.b	(a1)+,d5
	move.w	#$0007,d2
Lffb52a:
	rol.b	#1,d5
	bcc.s	Lffb546
	movem.l	d1/d7/a0/a2,-(a7)
Lffb532:
	move.w	d6,d1
	movea.l	a0,a2
Lffb536:
	move.w	d0,(a2)+
	dbra.w	d1,Lffb536
	adda.l	d3,a0
	dbra.w	d7,Lffb532
	movem.l	(a7)+,d1/d7/a0/a2
Lffb546:
	move.w	d6,-(a7)
Lffb548:
	addq.l	#2,a0
	dbra.w	d6,Lffb548
	move.w	(a7)+,d6
	dbra.w	d4,Lffb564
	move.w	d7,d2
Lffb556:
	adda.l	d3,a2
	dbra.w	d2,Lffb556
	swap.w	d2
	dbra.w	d2,Lffb51e
	bra.s	Lffb56a

Lffb564:
	dbra.w	d2,Lffb52a
	bra.s	Lffb524

Lffb56a:
	movem.l	(a7)+,d1-d7/a1-a2
	rts

Lffb570:
	tst.w	($00000964).l
	beq.w	Lffb708
	cmp.b	#-$01,d1
	beq.s	Lffb5ae
	cmp.b	#$04,d1
	bcc.w	Lffb70c
	move.b	($0000093d).l,d0
	cmp.b	d0,d1
	bcc.w	Lffb710
	move.w	d1,d0
	and.w	#$0003,d0
	asl.w	#3,d0
	add.w	#$00c0,d0
	swap.w	d0
	clr.w	d0
	move.l	d0,($0000095c).l
	clr.l	d0
	rts

Lffb5ae:
	move.l	($0000095c).l,d0
	swap.w	d0
	sub.w	#$00c0,d0
	lsr.w	#3,d0
	and.l	#$00000003,d0
	rts

Lffb5c4:
	tst.w	($00000964).l
	beq.w	Lffb708
	cmp.b	#$10,d1
	bcc.w	Lffb70c
	move.l	d2,-(a7)
	move.b	($0000093d).l,d2
	clr.l	d0
	bset.l	d2,d0
	move.l	(a7)+,d2
	cmp.b	d0,d1
	bcc.w	Lffb710
	move.l	d1,-(a7)
	move.b	($0000093d).l,d0
	cmp.b	#$01,d0
	beq.s	Lffb638
	cmp.b	#$02,d0
	beq.s	Lffb61e
Lffb5fe:
	tst.b	d1
	beq.s	Lffb606
	or.b	#$10,d1
Lffb606:
	move.w	($00e82600),d0
	and.w	#$ffe0,d0
	or.w	d1,d0
	move.w	d0,($00e82600)
	move.l	(a7)+,d1
	clr.l	d0
	rts

Lffb61e:
	btst.l	#$01,d1
	beq.s	Lffb62c
	bclr.l	#$01,d1
	or.w	#$000c,d1
Lffb62c:
	btst.l	#$00,d1
	beq.s	Lffb5fe
	or.w	#$0003,d1
	bra.s	Lffb5fe

Lffb638:
	tst.b	d1
	beq.s	Lffb5fe
	moveq.l	#$0f,d1
	bra.s	Lffb5fe

Lffb640:
	tst.w	($00000964).l
	beq.w	Lffb708
	cmp.b	#$10,d1
	bcc.w	Lffb70c
	move.w	#$0400,d0
	cmp.w	d0,d2
	bcc.w	Lffb70c
	cmp.w	d0,d3
	bcc.w	Lffb70c
	move.l	($00000960).l,d0
	lsr.l	#1,d0
	cmp.w	d0,d2
	bcc.w	Lffb710
	cmp.w	d0,d3
	bcc.w	Lffb710
	move.l	d2,-(a7)
	move.b	($0000093d).l,d2
	clr.l	d0
	bset.l	d2,d0
	move.l	(a7)+,d2
	cmp.b	d0,d1
	bcc.w	Lffb710
	move.l	d1,-(a7)
	move.b	($0000093d).l,d0
	cmp.b	#$01,d0
	beq.s	Lffb700
	cmp.b	#$02,d0
	beq.s	Lffb6e6
Lffb69e:
	tst.b	d1
	bne.s	Lffb6a4
	moveq.l	#$0f,d1
Lffb6a4:
	lea.l	($00e80018),a0
	btst.l	#$00,d1
	beq.s	Lffb6b6
	move.w	d2,(a0)
	move.w	d3,($0002,a0)
Lffb6b6:
	addq.l	#4,a0
	btst.l	#$01,d1
	beq.s	Lffb6c4
	move.w	d2,(a0)
	move.w	d3,($0002,a0)
Lffb6c4:
	addq.l	#4,a0
	btst.l	#$02,d1
	beq.s	Lffb6d2
	move.w	d2,(a0)
	move.w	d3,($0002,a0)
Lffb6d2:
	addq.l	#4,a0
	btst.l	#$03,d1
	beq.s	Lffb6e0
	move.w	d2,(a0)
	move.w	d3,($0002,a0)
Lffb6e0:
	move.l	(a7)+,d1
	clr.l	d0
	rts

Lffb6e6:
	btst.l	#$01,d1
	beq.s	Lffb6f4
	bclr.l	#$01,d1
	or.w	#$000c,d1
Lffb6f4:
	btst.l	#$00,d1
	beq.s	Lffb69e
	or.w	#$0003,d1
	bra.s	Lffb69e

Lffb700:
	tst.b	d1
	beq.s	Lffb69e
	moveq.l	#$0f,d1
	bra.s	Lffb69e

Lffb708:
	moveq.l	#$ff,d0
	rts

Lffb70c:
	moveq.l	#$fe,d0
	rts

Lffb710:
	moveq.l	#$fd,d0
	rts

Lffb714:
	tst.w	($00000964).l
	beq.s	Lffb708
	move.w	#$0400,d0
	cmp.w	d0,d1
	bcc.s	Lffb70c
	cmp.w	d0,d2
	bcc.s	Lffb70c
	cmp.w	d0,d3
	bcc.s	Lffb70c
	cmp.w	d0,d4
	bcc.s	Lffb70c
	move.l	($00000960).l,d0
	lsr.l	#1,d0
	cmp.w	d0,d1
	bcc.s	Lffb710
	cmp.w	d0,d2
	bcc.s	Lffb710
	cmp.w	d0,d3
	bcc.s	Lffb710
	cmp.w	d0,d4
	bcc.s	Lffb710
	lea.l	($00000968).l,a0
	move.w	d1,(a0)+
	move.w	d2,(a0)+
	move.w	d3,(a0)+
	move.w	d4,(a0)+
	clr.l	d0
	rts

Lffb75a:
	clr.l	d0
	move.b	d1,d0
	lsr.w	#8,d1
	subi.b	#$81,d1
	cmpi.b	#$6f,d1			;'o'
	bcc.s	Lffb7ae
	cmpi.b	#$1f,d1
	bcs.s	Lffb77a
	cmpi.b	#$3f,d1			;'?'
	bcs.s	Lffb7ae
	subi.b	#$40,d1			;'@'
Lffb77a:
	add.b	d1,d1
	add.b	#$21,d1			;'!'
	subi.b	#$40,d0			;'@'
	cmpi.b	#$bd,d0
	bcc.s	Lffb7ae
	cmpi.b	#$3f,d0			;'?'
	beq.s	Lffb7ae
	bcc.s	Lffb794
	addq.b	#1,d0
Lffb794:
	cmpi.b	#$5f,d0			;'_'
	bcc.s	Lffb7a0
	addi.b	#$20,d0			;' '
	bra.s	Lffb7a6

Lffb7a0:
	addq.b	#1,d1
	subi.b	#$3e,d0			;'>'
Lffb7a6:
	asl.w	#8,d1
	or.w	d1,d0
	move.l	d0,d1
	rts

Lffb7ae:
	move.l	#$ffff2228.l,d0
	move.l	d0,d1
	rts

Lffb7b8:
	clr.l	d0
	move.w	d1,d0
	lsr.w	#8,d0
	cmp.b	#$21,d1			;'!'
	bcs.s	Lffb80e
	cmp.b	#$7f,d1
	bcc.s	Lffb80e
	cmp.b	#$21,d0			;'!'
	bcs.s	Lffb80e
	cmp.b	#$7f,d0
	bcc.s	Lffb80e
	cmp.b	#$29,d0			;')'
	bcs.s	Lffb7e2
	cmp.b	#$30,d0			;'0'
	bcs.s	Lffb80e
Lffb7e2:
	add.b	#$1f,d1
	addq.b	#1,d0
	lsr.b	#1,d0
	bcc.s	Lffb7f0
	add.b	#$5e,d1			;'^'
Lffb7f0:
	cmp.b	#$7f,d1
	bcs.s	Lffb7f8
	addq.b	#1,d1
Lffb7f8:
	add.b	#$70,d0			;'p'
	cmp.b	#$a0,d0
	bcs.s	Lffb806
	add.b	#$40,d0			;'@'
Lffb806:
	asl.w	#8,d0
	move.b	d1,d0
	move.l	d0,d1
	rts

Lffb80e:
	move.l	#$ffff81a6.l,d0
	move.l	d0,d1
	rts

Lffb818:
	move.l	d1,-(a7)
	clr.l	d0
	cmp.b	#$20,d1			;' '
	bcs.s	Lffb86a
	cmp.b	#$30,d1			;'0'
	bcs.s	Lffb86e
	cmp.b	#$3a,d1			;':'
	bcs.s	Lffb89e
	cmp.b	#$41,d1			;'A'
	bcs.s	Lffb874
	cmp.b	#$5b,d1			;'['
	bcs.s	Lffb89e
	cmp.b	#$61,d1			;'a'
	bcs.s	Lffb87a
	cmp.b	#$7b,d1			;'{'
	bcs.s	Lffb89e
	cmp.b	#$7f,d1
	bcs.s	Lffb880
	cmp.b	#$a0,d1
	bcs.s	Lffb860
	beq.s	Lffb86a
	cmp.b	#$a6,d1
	bcs.s	Lffb886
	cmp.b	#$e0,d1
	bcs.s	Lffb8b2
Lffb860:
	move.l	#$ffff81a6.l,d0
	bra.w	Lffb8f6

Lffb86a:
	move.w	#$0020,d1		;' '
Lffb86e:
	sub.b	#$20,d1			;' '
	bra.s	Lffb88a

Lffb874:
	sub.b	#$2a,d1			;'*'
	bra.s	Lffb88a

Lffb87a:
	sub.b	#$44,d1			;'D'
	bra.s	Lffb88a

Lffb880:
	sub.b	#$5e,d1			;'^'
	bra.s	Lffb88a

Lffb886:
	sub.b	#$80,d1
Lffb88a:
	and.w	#$00ff,d1
	lea.l	(Lffc2a0),a0
	move.b	(a0,d1.w),d0
Lffb898:
	or.w	#$8100,d0
	bra.s	Lffb8f6

Lffb89e:
	move.w	#$8200,d0
	add.b	#$1f,d1
	cmp.b	#$7f,d1
	bcs.s	Lffb8ae
	addq.b	#1,d1
Lffb8ae:
	move.b	d1,d0
	bra.s	Lffb8f6

Lffb8b2:
	moveq.l	#$5b,d0			;'['
	cmp.b	#$b0,d1
	beq.s	Lffb898
	moveq.l	#$4a,d0			;'J'
	cmp.b	#$de,d1
	beq.s	Lffb898
	addq.b	#1,d0
	cmp.b	#$df,d1
	beq.s	Lffb898
	lea.l	(Lffc2c6),a0
	sub.b	#$a6,d1
	and.w	#$00ff,d1
	move.w	#$8200,d0
	move.b	(a0,d1.w),d0
	swap.w	d1
	tst.w	d1
	beq.s	Lffb8f6
	sub.b	#$5f,d0			;'_'
	cmp.b	#$7f,d0
	bcs.s	Lffb8f2
	addq.b	#1,d0
Lffb8f2:
	add.w	#$0100,d0
Lffb8f6:
	move.l	(a7)+,d1
	rts

Lffb8fa:
	movem.l	d1-d7/a1-a4,-(a7)
	movea.l	a1,a3
	movea.l	a2,a4
	cmp.b	#$27,d1			;'''
	beq.s	Lffb946
	cmp.b	#$2c,d1			;','
	beq.s	Lffb96e
	cmp.b	#$2e,d1			;'.'
	beq.s	Lffb96e
	cmp.b	#$2f,d1			;'/'
	beq.s	Lffb96e
	cmp.b	#$2d,d1			;'-'
	beq.s	Lffb96e
	cmp.b	#$5b,d1			;'['
	beq.s	Lffb96e
	cmp.b	#$5d,d1			;']'
	beq.s	Lffb96e
	cmp.b	#$40,d1			;'@'
	bcs.s	Lffb94a
	cmp.b	#$5a,d1			;'Z'
	bls.s	Lffb96e
	cmp.b	#$60,d1			;'`'
	bcs.s	Lffb94a
	cmp.b	#$7a,d1			;'z'
	bls.s	Lffb96e
	bra.s	Lffb94a

Lffb946:
	tst.b	(a1)
	bne.s	Lffb96e
Lffb94a:
	moveq.l	#$01,d0
	move.b	(a1),d2
	and.b	#$df,d2
	cmp.b	#$4e,d2			;'N'
	bne.s	Lffb964
	tst.b	($0001,a1)
	bne.s	Lffb964
	move.b	#$dd,(a2)+
	addq.l	#1,d0
Lffb964:
	clr.b	(a1)
	move.b	d1,(a2)+
	clr.b	(a2)
	bra.w	Lffc17e

Lffb96e:
	tst.b	(a1)+
	bne.s	Lffb96e
	move.b	d1,(-$0001,a1)
	clr.b	(a1)
	movea.l	a3,a1
	move.b	(a1)+,d2
	move.b	d2,d3
	cmp.b	#$61,d2			;'a'
	bcs.s	Lffb98e
	cmp.b	#$7a,d2			;'z'
	bhi.s	Lffb98e
	and.b	#$df,d2
Lffb98e:
	move.b	#$b1,d1
	cmp.b	#$61,d3			;'a'
	beq.w	Lffba44
	cmp.b	#$41,d3			;'A'
	beq.w	Lffba48
	addq.b	#1,d1
	cmp.b	#$69,d3			;'i'
	beq.w	Lffba44
	cmp.b	#$49,d3			;'I'
	beq.w	Lffba48
	addq.b	#1,d1
	cmp.b	#$75,d3			;'u'
	beq.w	Lffba44
	cmp.b	#$55,d3			;'U'
	beq.w	Lffba48
	addq.b	#1,d1
	cmp.b	#$65,d3			;'e'
	beq.s	Lffba44
	cmp.b	#$45,d3			;'E'
	beq.s	Lffba48
	addq.b	#1,d1
	cmp.b	#$6f,d3			;'o'
	beq.s	Lffba44
	cmp.b	#$4f,d3			;'O'
	beq.s	Lffba48
	move.b	#$dd,d1
	cmp.b	#$58,d2			;'X'
	beq.s	Lffba48
	cmp.b	#$6e,d3			;'n'
	beq.s	Lffba48
	move.b	#$af,d1
	cmp.b	#$7a,d3			;'z'
	beq.s	Lffba48
	move.b	#$a1,d1
	cmp.b	#$2e,d2			;'.'
	beq.s	Lffba48
	addq.b	#1,d1
	cmp.b	#$5b,d2			;'['
	beq.s	Lffba48
	addq.b	#1,d1
	cmp.b	#$5d,d2			;']'
	beq.s	Lffba48
	addq.b	#1,d1
	cmp.b	#$2c,d2			;','
	beq.s	Lffba48
	addq.b	#1,d1
	cmp.b	#$2f,d2			;'/'
	beq.s	Lffba48
	move.b	#$b0,d1
	cmp.b	#$2d,d2			;'-'
	beq.s	Lffba48
	move.b	#$de,d1
	cmp.b	#$40,d2			;'@'
	beq.s	Lffba48
	addq.b	#1,d1
	cmp.b	#$60,d2			;'`'
	beq.s	Lffba48
	bra.s	Lffba50

Lffba44:
	sub.b	#$0a,d1
Lffba48:
	move.b	d1,(a2)+
	moveq.l	#$01,d0
	bra.w	Lffc174

Lffba50:
	move.b	#$dc,d1
	cmp.b	#$57,d2			;'W'
	beq.w	Lffbae6
	move.b	#$b1,d1
	cmp.b	#$56,d2			;'V'
	beq.w	Lffbae6
	addq.b	#5,d1
	cmp.b	#$4b,d2			;'K'
	beq.s	Lffbae6
	cmp.b	#$47,d2			;'G'
	beq.s	Lffbae6
	cmp.b	#$43,d2			;'C'
	beq.s	Lffbae6
	cmp.b	#$51,d2			;'Q'
	beq.s	Lffbae6
	addq.b	#5,d1
	cmp.b	#$53,d2			;'S'
	beq.s	Lffbae6
	cmp.b	#$4a,d2			;'J'
	beq.s	Lffbae6
	cmp.b	#$5a,d2			;'Z'
	beq.s	Lffbae6
	addq.b	#5,d1
	cmp.b	#$54,d2			;'T'
	beq.s	Lffbae6
	cmp.b	#$44,d2			;'D'
	beq.s	Lffbae6
	addq.b	#5,d1
	cmp.b	#$4e,d2			;'N'
	beq.s	Lffbae6
	addq.b	#5,d1
	cmp.b	#$48,d2			;'H'
	beq.s	Lffbae6
	cmp.b	#$42,d2			;'B'
	beq.s	Lffbae6
	cmp.b	#$50,d2			;'P'
	beq.s	Lffbae6
	cmp.b	#$46,d2			;'F'
	beq.s	Lffbae6
	addq.b	#5,d1
	cmp.b	#$4d,d2			;'M'
	beq.s	Lffbae6
	addq.b	#5,d1
	cmp.b	#$59,d2			;'Y'
	beq.s	Lffbae6
	addq.b	#3,d1
	cmp.b	#$52,d2			;'R'
	beq.s	Lffbae6
	cmp.b	#$4c,d2			;'L'
	bne.w	Lffc16c
Lffbae6:
	move.b	(a1),d4
	beq.w	Lffc17c
	move.b	d4,d3
	cmp.b	#$41,d4			;'A'
	bcs.s	Lffbb06
	cmp.b	#$5a,d4			;'Z'
	bls.s	Lffbb72
	cmp.b	#$61,d4			;'a'
	bcs.s	Lffbb06
	cmp.b	#$7a,d4			;'z'
	bls.s	Lffbb6e
Lffbb06:
	cmp.b	#$4e,d2			;'N'
	bne.w	Lffc16c
	move.b	#$dd,(a2)+
	addq.l	#1,a1
	moveq.l	#$01,d0
	cmp.b	#$27,d4			;'''
	beq.w	Lffc174
	addq.l	#1,d0
	move.b	#$a1,d1
	cmp.b	#$2e,d4			;'.'
	beq.s	Lffbb68
	addq.b	#1,d1
	cmp.b	#$5b,d4			;'['
	beq.s	Lffbb68
	addq.b	#1,d1
	cmp.b	#$5d,d4			;']'
	beq.s	Lffbb68
	addq.b	#1,d1
	cmp.b	#$2c,d4			;','
	beq.s	Lffbb68
	addq.b	#1,d1
	cmp.b	#$2f,d4			;'/'
	beq.s	Lffbb68
	move.b	#$b0,d1
	cmp.b	#$2d,d4			;'-'
	beq.s	Lffbb68
	move.b	#$de,d1
	cmp.b	#$40,d4			;'@'
	beq.s	Lffbb68
	addq.b	#1,d1
	cmp.b	#$60,d4			;'`'
	bne.w	Lffc16c
Lffbb68:
	move.b	d1,(a2)+
	bra.w	Lffc174

Lffbb6e:
	and.b	#$df,d4
Lffbb72:
	cmp.b	d2,d4
	bne.s	Lffbb8e
	move.b	#$af,d1
	cmp.b	#$4e,d4			;'N'
	bne.s	Lffbb86
	move.b	#$dd,d1
	addq.l	#1,a1
Lffbb86:
	move.b	d1,(a2)+
	moveq.l	#$01,d0
	bra.w	Lffc174

Lffbb8e:
	cmp.b	#$41,d4			;'A'
	bne.w	Lffbc2e
	addq.l	#1,a1
	cmp.b	#$46,d2			;'F'
	beq.s	Lffbbbc
	cmp.b	#$51,d2			;'Q'
	beq.s	Lffbbbc
	cmp.b	#$56,d2			;'V'
	bne.s	Lffbbca
	addq.b	#2,d1
	move.b	d1,(a2)+
	move.b	#$de,(a2)+
	move.b	#$a7,(a2)+
	moveq.l	#$03,d0
	bra.w	Lffc174

Lffbbbc:
	addq.b	#2,d1
	move.b	d1,(a2)+
	move.b	#$a7,(a2)+
	moveq.l	#$02,d0
	bra.w	Lffc174

Lffbbca:
	cmp.b	#$50,d2			;'P'
	bne.s	Lffbbdc
	move.b	d1,(a2)+
	move.b	#$df,(a2)+
	moveq.l	#$02,d0
	bra.w	Lffc174

Lffbbdc:
	cmp.b	#$47,d2			;'G'
	beq.s	Lffbbf4
	cmp.b	#$5a,d2			;'Z'
	beq.s	Lffbbf4
	cmp.b	#$44,d2			;'D'
	beq.s	Lffbbf4
	cmp.b	#$42,d2			;'B'
	bne.s	Lffbc00
Lffbbf4:
	move.b	d1,(a2)+
	move.b	#$de,(a2)+
	moveq.l	#$02,d0
	bra.w	Lffc174

Lffbc00:
	cmp.b	#$4a,d2			;'J'
	bne.s	Lffbc18
	addq.b	#1,d1
	move.b	d1,(a2)+
	move.b	#$de,(a2)+
	move.b	#$ac,(a2)+
	moveq.l	#$03,d0
	bra.w	Lffc174

Lffbc18:
	cmp.b	#$59,d2			;'Y'
	bne.w	Lffba48
	cmp.b	d3,d4
	beq.w	Lffba48
	sub.b	#$28,d1			;'('
	bra.w	Lffba48

Lffbc2e:
	cmp.b	#$55,d4			;'U'
	bne.w	Lffbcc6
	addq.l	#1,a1
	cmp.b	#$50,d2			;'P'
	bne.s	Lffbc4c
	addq.b	#2,d1
	move.b	d1,(a2)+
	move.b	#$df,(a2)+
	moveq.l	#$02,d0
	bra.w	Lffc174

Lffbc4c:
	cmp.b	#$56,d2			;'V'
	beq.s	Lffbc6a
	cmp.b	#$47,d2			;'G'
	beq.s	Lffbc6a
	cmp.b	#$5a,d2			;'Z'
	beq.s	Lffbc6a
	cmp.b	#$44,d2			;'D'
	beq.s	Lffbc6a
	cmp.b	#$42,d2			;'B'
	bne.s	Lffbc78
Lffbc6a:
	addq.b	#2,d1
	move.b	d1,(a2)+
	move.b	#$de,(a2)+
	moveq.l	#$02,d0
	bra.w	Lffc174

Lffbc78:
	cmp.b	#$4a,d2			;'J'
	bne.s	Lffbc90
	addq.b	#1,d1
	move.b	d1,(a2)+
	move.b	#$de,(a2)+
	move.b	#$ad,(a2)+
	moveq.l	#$03,d0
	bra.w	Lffc174

Lffbc90:
	cmp.b	#$57,d2			;'W'
	beq.s	Lffbcbc
	cmp.b	#$54,d2			;'T'
	bne.s	Lffbca8
	cmp.b	d3,d4
	beq.s	Lffbcc0
	move.b	#$af,d1
	bra.w	Lffba48

Lffbca8:
	cmp.b	#$59,d2			;'Y'
	bne.s	Lffbcc0
	cmp.b	d3,d4
	beq.w	Lffbe1a
	move.b	#$ad,d1
	bra.w	Lffba48

Lffbcbc:
	sub.b	#$2b,d1			;'+'
Lffbcc0:
	addq.b	#2,d1
	bra.w	Lffba48

Lffbcc6:
	cmp.b	#$4f,d4			;'O'
	bne.w	Lffbd78
	addq.l	#1,a1
	cmp.b	#$46,d2			;'F'
	beq.s	Lffbcf4
	cmp.b	#$51,d2			;'Q'
	beq.s	Lffbcf4
	cmp.b	#$56,d2			;'V'
	bne.s	Lffbd02
	addq.b	#2,d1
	move.b	d1,(a2)+
	move.b	#$de,(a2)+
	move.b	#$ab,(a2)+
	moveq.l	#$03,d0
	bra.w	Lffc174

Lffbcf4:
	addq.b	#2,d1
	move.b	d1,(a2)+
	move.b	#$ab,(a2)+
	moveq.l	#$02,d0
	bra.w	Lffc174

Lffbd02:
	cmp.b	#$50,d2			;'P'
	bne.s	Lffbd16
	addq.b	#4,d1
	move.b	d1,(a2)+
	move.b	#$df,(a2)+
	moveq.l	#$02,d0
	bra.w	Lffc174

Lffbd16:
	cmp.b	#$47,d2			;'G'
	beq.s	Lffbd2e
	cmp.b	#$5a,d2			;'Z'
	beq.s	Lffbd2e
	cmp.b	#$44,d2			;'D'
	beq.s	Lffbd2e
	cmp.b	#$42,d2			;'B'
	bne.s	Lffbd3c
Lffbd2e:
	addq.b	#4,d1
	move.b	d1,(a2)+
	move.b	#$de,(a2)+
	moveq.l	#$02,d0
	bra.w	Lffc174

Lffbd3c:
	cmp.b	#$4a,d2			;'J'
	bne.s	Lffbd54
	addq.b	#1,d1
	move.b	d1,(a2)+
	move.b	#$de,(a2)+
	move.b	#$ae,(a2)+
	moveq.l	#$03,d0
	bra.w	Lffc174

Lffbd54:
	cmp.b	#$57,d2			;'W'
	beq.s	Lffbd6e
	cmp.b	#$59,d2			;'Y'
	bne.s	Lffbd72
	cmp.b	d3,d4
	beq.w	Lffbcc0
	move.b	#$ae,d1
	bra.w	Lffba48

Lffbd6e:
	sub.b	#$3a,d1			;':'
Lffbd72:
	addq.b	#4,d1
	bra.w	Lffba48

Lffbd78:
	cmp.b	#$49,d4			;'I'
	bne.w	Lffbe20
	addq.l	#1,a1
	cmp.b	#$57,d2			;'W'
	beq.s	Lffbdac
	cmp.b	#$46,d2			;'F'
	beq.s	Lffbdb0
	cmp.b	#$51,d2			;'Q'
	beq.s	Lffbdb0
	cmp.b	#$56,d2			;'V'
	bne.s	Lffbdbe
	addq.b	#2,d1
	move.b	d1,(a2)+
	move.b	#$de,(a2)+
	move.b	#$a8,(a2)+
	moveq.l	#$03,d0
	bra.w	Lffc174

Lffbdac:
	sub.b	#$2b,d1			;'+'
Lffbdb0:
	addq.b	#2,d1
	move.b	d1,(a2)+
	move.b	#$a8,(a2)+
	moveq.l	#$02,d0
	bra.w	Lffc174

Lffbdbe:
	cmp.b	#$50,d2			;'P'
	bne.s	Lffbdd2
	addq.b	#1,d1
	move.b	d1,(a2)+
	move.b	#$df,(a2)+
	moveq.l	#$02,d0
	bra.w	Lffc174

Lffbdd2:
	cmp.b	#$47,d2			;'G'
	beq.s	Lffbdf0
	cmp.b	#$5a,d2			;'Z'
	beq.s	Lffbdf0
	cmp.b	#$44,d2			;'D'
	beq.s	Lffbdf0
	cmp.b	#$42,d2			;'B'
	beq.s	Lffbdf0
	cmp.b	#$4a,d2			;'J'
	bne.s	Lffbdfe
Lffbdf0:
	addq.b	#1,d1
	move.b	d1,(a2)+
	move.b	#$de,(a2)+
	moveq.l	#$02,d0
	bra.w	Lffc174

Lffbdfe:
	cmp.b	#$59,d2			;'Y'
	bne.s	Lffbe12
	move.b	#$b2,d1
	cmp.b	d3,d4
	beq.w	Lffba48
	bra.w	Lffba44

Lffbe12:
	cmp.b	#$43,d2			;'C'
	bne.s	Lffbe1a
	addq.b	#5,d1
Lffbe1a:
	addq.b	#1,d1
	bra.w	Lffba48

Lffbe20:
	cmp.b	#$45,d4			;'E'
	bne.w	Lffbeda
	addq.l	#1,a1
	cmp.b	#$57,d2			;'W'
	beq.s	Lffbe54
	cmp.b	#$46,d2			;'F'
	beq.s	Lffbe5a
	cmp.b	#$51,d2			;'Q'
	beq.s	Lffbe5a
	cmp.b	#$56,d2			;'V'
	bne.s	Lffbe68
	addq.b	#2,d1
	move.b	d1,(a2)+
	move.b	#$de,(a2)+
	move.b	#$aa,(a2)+
	moveq.l	#$03,d0
	bra.w	Lffc174

Lffbe54:
	sub.b	#$31,d1			;'1'
Lffbe58:
	addq.b	#6,d1
Lffbe5a:
	addq.b	#2,d1
	move.b	d1,(a2)+
	move.b	#$aa,(a2)+
	moveq.l	#$02,d0
	bra.w	Lffc174

Lffbe68:
	cmp.b	#$50,d2			;'P'
	bne.s	Lffbe7c
	addq.b	#3,d1
	move.b	d1,(a2)+
	move.b	#$df,(a2)+
	moveq.l	#$02,d0
	bra.w	Lffc174

Lffbe7c:
	cmp.b	#$47,d2			;'G'
	beq.s	Lffbe94
	cmp.b	#$5a,d2			;'Z'
	beq.s	Lffbe94
	cmp.b	#$44,d2			;'D'
	beq.s	Lffbe94
	cmp.b	#$42,d2			;'B'
	bne.s	Lffbea2
Lffbe94:
	addq.b	#3,d1
	move.b	d1,(a2)+
	move.b	#$de,(a2)+
	moveq.l	#$02,d0
	bra.w	Lffc174

Lffbea2:
	cmp.b	#$4a,d2			;'J'
	bne.s	Lffbeba
	addq.b	#1,d1
	move.b	d1,(a2)+
	move.b	#$de,(a2)+
	move.b	#$aa,(a2)+
	moveq.l	#$03,d0
	bra.w	Lffc174

Lffbeba:
	cmp.b	#$59,d2			;'Y'
	bne.s	Lffbecc
	move.b	#$aa,d1
	cmp.b	d3,d4
	bne.w	Lffba48
	bra.s	Lffbe58

Lffbecc:
	cmp.b	#$43,d2			;'C'
	bne.s	Lffbed4
	addq.b	#5,d1
Lffbed4:
	addq.b	#3,d1
	bra.w	Lffba48

Lffbeda:
	cmp.b	#$48,d4			;'H'
	bne.w	Lffbf88
	cmp.b	#$4e,d2			;'N'
	beq.w	Lffbf7e
	cmp.b	#$53,d2			;'S'
	beq.s	Lffbf08
	cmp.b	#$44,d2			;'D'
	beq.s	Lffbf06
	cmp.b	#$54,d2			;'T'
	beq.s	Lffbf06
	cmp.b	#$43,d2			;'C'
	bne.w	Lffc16c
	addq.b	#8,d1
Lffbf06:
	addq.b	#2,d1
Lffbf08:
	addq.b	#1,d1
	move.b	($0001,a1),d5
	beq.w	Lffc17c
	cmp.b	#$61,d5			;'a'
	bcs.s	Lffbf22
	cmp.b	#$7a,d5			;'z'
	bhi.s	Lffbf22
	and.b	#$df,d5
Lffbf22:
	move.b	#$a8,d6
	cmp.b	#$49,d5			;'I'
	beq.s	Lffbf68
	addq.b	#2,d6
	cmp.b	#$45,d5			;'E'
	beq.s	Lffbf4e
	addq.b	#2,d6
	cmp.b	#$41,d5			;'A'
	beq.s	Lffbf4e
	addq.b	#1,d6
	cmp.b	#$55,d5			;'U'
	beq.s	Lffbf4e
	addq.b	#1,d6
	cmp.b	#$4f,d5			;'O'
	bne.w	Lffc16c
Lffbf4e:
	addq.l	#2,a1
	move.b	d1,(a2)+
	moveq.l	#$01,d0
	cmp.b	#$44,d2			;'D'
	bne.s	Lffbf60
Lffbf5a:
	addq.l	#1,d0
	move.b	#$de,(a2)+
Lffbf60:
	addq.l	#1,d0
	move.b	d6,(a2)+
	bra.w	Lffc174

Lffbf68:
	addq.l	#2,a1
	move.b	d1,(a2)+
	moveq.l	#$01,d0
	cmp.b	#$44,d2			;'D'
	beq.s	Lffbf5a
	cmp.b	#$54,d2			;'T'
	beq.s	Lffbf60
	bra.w	Lffc174

Lffbf7e:
	move.b	#$dd,(a2)+
	moveq.l	#$01,d0
	bra.w	Lffc174

Lffbf88:
	cmp.b	#$59,d4			;'Y'
	bne.w	Lffc05a
	move.b	#$df,d6
	cmp.b	#$50,d2			;'P'
	beq.s	Lffc000
	subq.b	#1,d6
	cmp.b	#$47,d2			;'G'
	beq.s	Lffc000
	cmp.b	#$5a,d2			;'Z'
	beq.s	Lffc000
	cmp.b	#$4a,d2			;'J'
	beq.s	Lffc000
	cmp.b	#$44,d2			;'D'
	beq.s	Lffc000
	cmp.b	#$42,d2			;'B'
	beq.s	Lffc000
	clr.b	d6
	cmp.b	#$4b,d2			;'K'
	beq.s	Lffc000
	cmp.b	#$53,d2			;'S'
	beq.s	Lffc000
	cmp.b	#$54,d2			;'T'
	beq.s	Lffc000
	cmp.b	#$4e,d2			;'N'
	beq.s	Lffc000
	cmp.b	#$48,d2			;'H'
	beq.s	Lffc000
	cmp.b	#$4d,d2			;'M'
	beq.s	Lffc000
	cmp.b	#$52,d2			;'R'
	beq.s	Lffc000
	cmp.b	#$4c,d2			;'L'
	beq.s	Lffc000
	cmp.b	#$46,d2			;'F'
	beq.s	Lffbffe
	cmp.b	#$43,d2			;'C'
	bne.w	Lffc16c
	add.b	#$09,d1
Lffbffe:
	addq.b	#1,d1
Lffc000:
	addq.b	#1,d1
	move.b	($0001,a1),d5
	beq.w	Lffc17c
	cmp.b	#$61,d5			;'a'
	bcs.s	Lffc01a
	cmp.b	#$7a,d5			;'z'
	bhi.s	Lffc01a
	and.b	#$df,d5
Lffc01a:
	move.b	#$a8,d7
	cmp.b	#$49,d5			;'I'
	beq.s	Lffc046
	addq.b	#2,d7
	cmp.b	#$45,d5			;'E'
	beq.s	Lffc046
	addq.b	#2,d7
	cmp.b	#$41,d5			;'A'
	beq.s	Lffc046
	addq.b	#1,d7
	cmp.b	#$55,d5			;'U'
	beq.s	Lffc046
	addq.b	#1,d7
	cmp.b	#$4f,d5			;'O'
	bne.w	Lffc16c
Lffc046:
	move.b	d1,(a2)+
	moveq.l	#$02,d0
	tst.b	d6
	beq.s	Lffc052
	move.b	d6,(a2)+
	addq.l	#1,d0
Lffc052:
	move.b	d7,(a2)+
	addq.l	#2,a1
	bra.w	Lffc174

Lffc05a:
	cmp.b	#$57,d4			;'W'
	bne.w	Lffc0fa
	move.b	#$df,d6
	cmp.b	#$50,d2			;'P'
	beq.s	Lffc0a2
	subq.b	#1,d6
	cmp.b	#$47,d2			;'G'
	beq.s	Lffc0a2
	cmp.b	#$5a,d2			;'Z'
	beq.s	Lffc0a2
	cmp.b	#$44,d2			;'D'
	beq.s	Lffc0a2
	cmp.b	#$42,d2			;'B'
	beq.s	Lffc0a2
	clr.b	d6
	cmp.b	#$4b,d2			;'K'
	beq.s	Lffc0a2
	cmp.b	#$53,d2			;'S'
	beq.s	Lffc0a2
	cmp.b	#$54,d2			;'T'
	beq.s	Lffc0a2
	cmp.b	#$48,d2			;'H'
	bne.w	Lffc16c
Lffc0a2:
	addq.b	#2,d1
	move.b	($0001,a1),d5
	beq.w	Lffc17c
	cmp.b	#$61,d5			;'a'
	bcs.s	Lffc0bc
	cmp.b	#$7a,d5			;'z'
	bhi.s	Lffc0bc
	and.b	#$df,d5
Lffc0bc:
	move.b	#$a7,d7
	cmp.b	#$41,d5			;'A'
	beq.s	Lffc0e8
	addq.b	#1,d7
	cmp.b	#$49,d5			;'I'
	beq.s	Lffc0e8
	addq.b	#1,d7
	cmp.b	#$55,d5			;'U'
	beq.s	Lffc0e8
	addq.b	#1,d7
	cmp.b	#$45,d5			;'E'
	beq.s	Lffc0e8
	addq.b	#1,d7
	cmp.b	#$4f,d5			;'O'
	bne.w	Lffc16c
Lffc0e8:
	move.b	d1,(a2)+
	moveq.l	#$02,d0
	tst.b	d6
	beq.s	Lffc0f4
	move.b	d6,(a2)+
	addq.l	#1,d0
Lffc0f4:
	move.b	d7,(a2)+
	addq.l	#2,a1
	bra.s	Lffc174

Lffc0fa:
	cmp.b	#$53,d4			;'S'
	bne.s	Lffc164
	cmp.b	#$54,d2			;'T'
	bne.s	Lffc164
	move.b	($0001,a1),d3
	beq.s	Lffc17c
	move.b	d3,d5
	cmp.b	#$61,d5			;'a'
	bcs.s	Lffc11e
	cmp.b	#$7a,d5			;'z'
	bhi.s	Lffc11e
	and.b	#$df,d5
Lffc11e:
	cmp.b	#$55,d5			;'U'
	beq.s	Lffc152
	move.b	#$a7,d6
	cmp.b	#$41,d5			;'A'
	beq.s	Lffc146
	addq.b	#1,d6
	cmp.b	#$49,d5			;'I'
	beq.s	Lffc146
	addq.b	#2,d6
	cmp.b	#$45,d5			;'E'
	beq.s	Lffc146
	addq.b	#1,d6
	cmp.b	#$4f,d5			;'O'
	bne.s	Lffc16c
Lffc146:
	addq.b	#2,d1
	move.b	d1,(a2)+
	move.b	d6,(a2)+
	addq.l	#2,a1
	moveq.l	#$02,d0
	bra.s	Lffc174

Lffc152:
	addq.b	#2,d1
	cmp.b	d3,d5
	beq.s	Lffc15c
	sub.b	#$13,d1
Lffc15c:
	move.b	d1,(a2)+
	addq.l	#2,a1
	moveq.l	#$01,d0
	bra.s	Lffc174

Lffc164:
	cmp.b	#$4e,d2			;'N'
	beq.w	Lffbf7e
Lffc16c:
	clr.b	(a3)
	clr.b	(a4)
	moveq.l	#$ff,d0
	bra.s	Lffc17e

Lffc174:
	clr.b	(a2)
Lffc176:
	move.b	(a1)+,(a3)+
	bne.s	Lffc176
	bra.s	Lffc17e

Lffc17c:
	clr.l	d0
Lffc17e:
	movem.l	(a7)+,d1-d7/a1-a4
	rts

Lffc184:
	move.b	(-$0002,a1),d0
	rol.w	#8,d0
	move.b	(-$0001,a1),d0
	cmp.w	#$829f,d0
	bcs.s	Lffc1b8
	cmp.w	#$82fd,d0
	bcs.s	Lffc1ac
	cmp.w	#$839f,d0
	bcc.s	Lffc1b8
	cmp.b	#$7f,d0
	bcs.s	Lffc1a8
	subq.b	#1,d0
Lffc1a8:
	add.b	#$5f,d0			;'_'
Lffc1ac:
	bsr.s	Lffc21c
	bne.s	Lffc1b8
	addq.b	#2,(-$0001,a1)
	clr.l	d0
	rts

Lffc1b8:
	move.b	#$81,(a1)+
	move.b	#$4b,(a1)+		;'K'
	clr.b	(a1)
	moveq.l	#$02,d0
	rts

Lffc1c6:
	move.b	(-$0002,a1),d0
	rol.w	#8,d0
	move.b	(-$0001,a1),d0
	cmp.w	#$829f,d0
	bcs.s	Lffc204
	cmp.w	#$82fd,d0
	bcs.s	Lffc1f4
	cmp.w	#$839f,d0
	bcc.s	Lffc204
	cmp.b	#$7f,d0
	bcs.s	Lffc1ea
	subq.b	#1,d0
Lffc1ea:
	add.b	#$5f,d0			;'_'
	cmp.b	#$a4,d0
	beq.s	Lffc212
Lffc1f4:
	bsr.s	Lffc238
	beq.s	Lffc1fc
	bsr.s	Lffc21c
	bne.s	Lffc204
Lffc1fc:
	addq.b	#1,(-$0001,a1)
	clr.l	d0
	rts

Lffc204:
	move.b	#$81,(a1)+
	move.b	#$4a,(a1)+		;'J'
	clr.b	(a1)
	moveq.l	#$02,d0
	rts

Lffc212:
	move.b	#$94,(-$0001,a1)
	clr.l	d0
	rts

Lffc21c:
	movem.l	d1,-(a7)
	lea.l	(Lffc2ea),a0
	moveq.l	#$04,d1
Lffc228:
	cmp.b	(a0)+,d0
	beq.s	Lffc232
	dbra.w	d1,Lffc228
	tst.w	d1
Lffc232:
	movem.l	(a7)+,d1
	rts

Lffc238:
	movem.l	d1,-(a7)
	lea.l	(Lffc2d6),a0
	moveq.l	#$0e,d1
Lffc244:
	cmp.b	(a0)+,d0
	beq.s	Lffc24e
	dbra.w	d1,Lffc244
	tst.w	d1
Lffc24e:
	movem.l	(a7)+,d1
	rts

Lffc254:
	move.w	#$0032,($000009bc).l	;'2'
	move.w	sr,-(a7)
	ori.w	#$0700,sr
	tst.b	($00000993).l
	bne.s	Lffc272
	tst.b	($00000991).l
	bne.s	Lffc280
Lffc272:
	jsr	(Lff15e6)
	move.b	#$ff,($00000991).l
Lffc280:
	move.b	#$ff,($00000992).l
	clr.b	($00000993).l
	move.w	(a7)+,sr
	rts

Lffc292:
	bsr.w	Lff7532
	move.b	#$ff,($00000993).l
	rts

Lffc2a0:
	.dc.b	'@Ih柏燈fij本C|D^FGメЗ洋熟OQMobp`BuvAE'
Lffc2c6:
	.dc.b	$f0,$9f,$a1,$a3,$a5,$a7,$e1,$e3
	.dc.b	$e5,$c1,$7e,$a0,$a2,$a4,$a6,$a8
Lffc2d6:
	.dc.b	'ｩｫｭｯｱｳｵｷｹｻｽｿﾂﾄﾆﾈﾉﾊﾋﾌ'
Lffc2ea:
	.dc.b	'ﾍﾐﾓﾖﾙﾜﾝﾞﾟ珞蓙鉅鳰�瀨a',$00
Lffc300:
	bclr.l	d1,d6
	movem.l	d1-d2/a1,-(a7)
	lea.l	($00eb0000),a0
	move.w	#$007f,d0
	moveq.l	#$00,d1
Lffc312:
	move.l	d1,(a0)+
	move.l	d1,(a0)+
	dbra.w	d0,Lffc312
	lea.l	($00eb0800),a0
	move.l	d1,(a0)+
	move.l	d1,(a0)+
	move.w	d1,(a0)
	lea.l	($00eb8000),a0
	move.l	#$00ec0000,d2
Lffc332:
	move.l	d1,(a0)+
	cmpa.l	d2,a0
	blt.s	Lffc332
	lea.l	($00e82220),a0
	moveq.l	#$0e,d2
	bsr.w	Lffc670
Lffc344:
	lea.l	(Lffc35c,pc),a1
	moveq.l	#$0f,d1
Lffc34a:
	move.w	(a1)+,(a0)+
	dbra.w	d1,Lffc34a
	dbra.w	d2,Lffc344
	moveq.l	#$00,d0
	movem.l	(a7)+,d1-d2/a1
	rts

Lffc35c:
	.dc.b	$00,$00,$52,$94,$00,$20,$00,$3e
	.dc.b	$04,$00,$07,$c0,$04,$20,$07,$fe
	.dc.b	$80,$00,$f8,$00,$80,$20,$f8,$3e
	.dc.b	$84,$00,$ff,$c0,$ad,$6a,$ff,$fe
	.dc.b	$61,$00,$03,$08,$00,$79,$00,$40
	.dc.b	$00,$e8,$26,$00,$00,$79,$02,$00
	.dc.b	$00,$eb,$08,$08,$4e,$75
Lffc392:
	andi.w	#$ffbf,($00e82600)
	andi.w	#$fdff,($00eb0808)
	rts

Lffc3a4:
	bsr.w	Lffc686
	move.l	d1,-(a7)
	andi.l	#$000000ff,d1
	lea.l	($00eb8000),a0
	lsl.w	#7,d1
	adda.w	d1,a0
	moveq.l	#$3f,d0			;'?'
	moveq.l	#$00,d1
Lffc3be:
	move.w	d1,(a0)+
	dbra.w	d0,Lffc3be
	moveq.l	#$00,d0
	move.l	(a7)+,d1
	rts

Lffc3ca:
	bsr.w	Lffc686
	movem.l	d1/a1,-(a7)
	andi.l	#$000000ff,d1
	tst.l	d2
	bne.s	Lffc3f0
	lea.l	($00eb8000),a0
	lsl.w	#5,d1
	adda.w	d1,a0
	moveq.l	#$0f,d0
Lffc3e8:
	move.w	(a1)+,(a0)+
	dbra.w	d0,Lffc3e8
	bra.s	Lffc402

Lffc3f0:
	lea.l	($00eb8000),a0
	lsl.w	#7,d1
	adda.w	d1,a0
	moveq.l	#$3f,d0			;'?'
Lffc3fc:
	move.w	(a1)+,(a0)+
	dbra.w	d0,Lffc3fc
Lffc402:
	movem.l	(a7)+,d1/a1
	moveq.l	#$00,d0
	rts

Lffc40a:
	bsr.w	Lffc686
	movem.l	d1/a1,-(a7)
	andi.l	#$000000ff,d1
	tst.l	d2
	bne.s	Lffc430
	lea.l	($00eb8000),a0
	lsl.w	#5,d1
	adda.w	d1,a0
	moveq.l	#$0f,d0
Lffc428:
	move.w	(a0)+,(a1)+
	dbra.w	d0,Lffc428
	bra.s	Lffc442

Lffc430:
	lea.l	($00eb8000),a0
	lsl.w	#7,d1
	adda.w	d1,a0
	moveq.l	#$3f,d0			;'?'
Lffc43c:
	move.w	(a0)+,(a1)+
	dbra.w	d0,Lffc43c
Lffc442:
	moveq.l	#$00,d0
	movem.l	(a7)+,d1/a1
	rts

Lffc44a:
	bsr.w	Lffc686
	movem.l	d1/d5,-(a7)
	andi.w	#$007f,d1
	lea.l	($00eb0000),a0
	lsl.w	#3,d1
	adda.w	d1,a0
	tst.l	d1
	bmi.s	Lffc468
	bsr.w	Lffc670
Lffc468:
	tst.l	d2
	bmi.s	Lffc46e
	move.w	d2,(a0)
Lffc46e:
	addq.w	#2,a0
	tst.l	d3
	bmi.s	Lffc476
	move.w	d3,(a0)
Lffc476:
	addq.w	#2,a0
	tst.l	d4
	bmi.s	Lffc47e
	move.w	d4,(a0)
Lffc47e:
	addq.w	#2,a0
	tst.l	d5
	bmi.s	Lffc48a
	andi.w	#$0003,d5
	move.w	d5,(a0)
Lffc48a:
	moveq.l	#$00,d0
	movem.l	(a7)+,d1/d5
	rts

Lffc492:
	bsr.w	Lffc686
	move.l	d1,-(a7)
	andi.w	#$007f,d1
	lea.l	($00eb0000),a0
	lsl.w	#3,d1
	adda.w	d1,a0
	moveq.l	#$00,d2
	move.w	(a0)+,d2
	moveq.l	#$00,d3
	move.w	(a0)+,d3
	moveq.l	#$00,d4
	move.w	(a0)+,d4
	moveq.l	#$00,d5
	move.w	(a0),d5
	move.l	(a7)+,d1
	rts

Lffc4ba:
	bsr.w	Lffc686
	btst.l	#$00,d1
	bne.s	Lffc4cc
	lea.l	($00eb0800),a0
	bra.s	Lffc4d2

Lffc4cc:
	lea.l	($00eb0804),a0
Lffc4d2:
	tst.l	d1
	bmi.s	Lffc4da
	bsr.w	Lffc670
Lffc4da:
	tst.l	d2
	bmi.s	Lffc4e0
	move.w	d2,(a0)
Lffc4e0:
	addq.w	#2,a0
	tst.l	d3
	bmi.s	Lffc4e8
	move.w	d3,(a0)
Lffc4e8:
	moveq.l	#$00,d0
	rts

Lffc4ec:
	bsr.w	Lffc686
	btst.l	#$00,d1
	bne.s	Lffc4fe
	lea.l	($00eb0800),a0
	bra.s	Lffc504

Lffc4fe:
	lea.l	($00eb0804),a0
Lffc504:
	moveq.l	#$00,d2
	move.w	(a0)+,d2
	moveq.l	#$00,d3
	move.w	(a0),d3
	moveq.l	#$00,d0
	rts

Lffc510:
	bsr.w	Lffc686
	movem.l	d2-d3,-(a7)
	tst.l	d2
	bpl.s	Lffc522
	moveq.l	#$fe,d0
	moveq.l	#$00,d2
	bra.s	Lffc52a

Lffc522:
	moveq.l	#$f8,d0
	andi.w	#$0001,d2
	add.l	d2,d2
Lffc52a:
	tst.l	d3
	bpl.s	Lffc534
	ori.w	#$0001,d0
	bra.s	Lffc53a

Lffc534:
	beq.s	Lffc53a
	ori.w	#$0001,d2
Lffc53a:
	btst.l	#$00,d1
	beq.s	Lffc544
	rol.w	#3,d0
	lsl.w	#3,d2
Lffc544:
	move.w	($00eb0808),d3
	and.w	d0,d3
	or.w	d2,d3
	move.w	d3,($00eb0808)
	moveq.l	#$00,d0
	movem.l	(a7)+,d2-d3
	rts

Lffc55c:
	bsr.w	Lffc686
	btst.l	#$00,d1
	beq.s	Lffc576
	move.w	($00eb0808),d0
	andi.l	#$00000038,d0
	lsr.l	#3,d0
	rts

Lffc576:
	move.w	($00eb0808),d0
	andi.l	#$00000007,d0
	rts

Lffc584:
	bsr.w	Lffc686
	btst.l	#$00,d1
	bne.s	Lffc59c
	lea.l	($00ebc000),a0
	move.l	#$00ebe000,d0
	bra.s	Lffc5a8

Lffc59c:
	lea.l	($00ebe000),a0
	move.l	#$00ec0000,d0
Lffc5a8:
	move.w	d2,(a0)+
	cmpa.l	d0,a0
	bmi.s	Lffc5a8
	moveq.l	#$00,d0
	rts

Lffc5b2:
	bsr.w	Lffc686
	movem.l	d2-d3,-(a7)
	btst.l	#$00,d1
	bne.s	Lffc5c8
	lea.l	($00ebc000),a0
	bra.s	Lffc5ce

Lffc5c8:
	lea.l	($00ebe000),a0
Lffc5ce:
	andi.w	#$003f,d2
	andi.w	#$003f,d3
	add.w	d2,d2
	lsl.w	#7,d3
	add.w	d3,d2
	adda.w	d2,a0
	move.w	d4,(a0)
	moveq.l	#$00,d0
	movem.l	(a7)+,d2-d3
	rts

Lffc5e8:
	bsr.w	Lffc686
	movem.l	d2-d3,-(a7)
	btst.l	#$00,d1
	bne.s	Lffc5fe
	lea.l	($00ebc000),a0
	bra.s	Lffc604

Lffc5fe:
	lea.l	($00ebe000),a0
Lffc604:
	andi.w	#$003f,d2
	andi.w	#$003f,d3
	add.w	d2,d2
	lsl.w	#7,d3
	add.w	d3,d2
	adda.w	d2,a0
	moveq.l	#$00,d0
	move.w	(a0),d0
	movem.l	(a7)+,d2-d3
	rts

Lffc61e:
	movem.l	d1-d2,-(a7)
	andi.w	#$000f,d2
	bne.s	Lffc63a
	andi.w	#$00ff,d1
	cmpi.w	#$0010,d1
	bcc.s	Lffc642
	moveq.l	#$fe,d0
	movem.l	(a7)+,d1-d2
	rts

Lffc63a:
	andi.w	#$000f,d1
	andi.w	#$000f,d2
Lffc642:
	lea.l	($00e82200),a0
	add.w	d1,d1
	lsl.w	#5,d2
	add.w	d2,d1
	adda.w	d1,a0
	tst.l	d1
	bmi.s	Lffc656
	bsr.s	Lffc670
Lffc656:
	tst.l	d3
	bpl.s	Lffc664
	moveq.l	#$00,d0
	move.w	(a0),d0
	movem.l	(a7)+,d1-d2
	rts

Lffc664:
	moveq.l	#$00,d0
	move.w	(a0),d0
	move.w	d3,(a0)
	movem.l	(a7)+,d1-d2
	rts

Lffc670:
	btst.b	#$04,($00e88001)
	beq.s	Lffc670
Lffc67a:
	btst.b	#$04,($00e88001)
	bne.s	Lffc67a
	rts

Lffc686:
	move.w	($00e80028),d0
	andi.w	#$00ff,d0
	cmpi.w	#$0016,d0
	bne.s	Lffc69c
	moveq.l	#$ff,d0
	addq.l	#4,a7
	rts

Lffc69c:
	moveq.l	#$00,d0
	rts

Lffc6a0:
	moveq.l	#$ff,d0
	rts

Lffc6a4:
	moveq.l	#$fe,d0
	rts

Lffc6a8:
	move.w	($00000964).l,d0
	beq.s	Lffc6a0
	cmp.w	($0008,a1),d0
	bcs.s	Lffc6a4
	movem.l	d1-d7/a0-a6,-(a7)
	move.w	(a1)+,d0
	move.w	(a1)+,d1
	move.w	(a1)+,d2
	move.w	(a1)+,d3
	move.w	(a1)+,d7
	move.w	(a1),d6
	bsr.w	Lffcf5e
	movem.l	(a7)+,d1-d7/a0-a6
	clr.l	d0
	rts

Lffc6d2:
	move.w	($00000964).l,d0
	beq.s	Lffc6a0
	cmp.w	($0008,a1),d0
	bcs.s	Lffc6a4
	movem.l	d1-d7/a0-a6,-(a7)
	move.w	(a1)+,d0
	move.w	(a1)+,d1
	move.w	(a1)+,d2
	move.w	(a1)+,d3
	move.w	(a1)+,d7
	move.w	(a1),d6
	bsr.w	Lffd0be
	movem.l	(a7)+,d1-d7/a0-a6
	clr.l	d0
	rts

Lffc6fc:
	move.w	($00000964).l,d0
	beq.s	Lffc6a0
	cmp.w	($0006,a1),d0
	bcs.s	Lffc6a4
	movem.l	d1-d7/a0-a6,-(a7)
	move.w	(a1)+,d4
	move.w	(a1)+,d5
	move.w	(a1)+,d1
	move.w	(a1)+,d7
	move.w	(a1)+,d2
	move.w	(a1)+,d3
	move.w	(a1),d6
	bsr.w	Lffcba2
	movem.l	(a7)+,d1-d7/a0-a6
	clr.l	d0
	rts

Lffc728:
	move.w	($00000964).l,d0
	beq.w	Lffc6a0
	cmp.w	($0008,a1),d0
	bcs.w	Lffc6a4
	movem.l	d1-d7/a0-a6,-(a7)
	move.w	(a1)+,d0
	move.w	(a1)+,d1
	move.w	(a1)+,d2
	move.w	(a1)+,d3
	move.w	(a1),d7
	bsr.w	Lffd142
	movem.l	(a7)+,d1-d7/a0-a6
	clr.l	d0
	rts

Lffc754:
	move.w	($00000964).l,d0
	beq.w	Lffc6a0
	cmp.w	($0004,a1),d0
	bcs.w	Lffc6a4
	movem.l	d1-d7/a0-a6,-(a7)
	move.w	(a1)+,d4
	move.w	(a1)+,d5
	move.w	(a1)+,d7
	move.l	(a1)+,d0
	move.l	(a1),d1
	bsr.w	Lffc9c0
	movem.l	(a7)+,d1-d7/a0-a6
	clr.l	d0
	rts

Lffc780:
	tst.w	($00000964).l
	beq.w	Lffc6a0
	movem.l	d1-d7/a0-a6,-(a7)
	move.l	a1,-(a7)
	move.w	(a1)+,d4
	move.w	(a1)+,d5
	bsr.w	Lffc86a
	movea.l	(a7)+,a1
	move.w	d0,($0004,a1)
	movem.l	(a7)+,d1-d7/a0-a6
	clr.l	d0
	rts

Lffc7a6:
	move.w	($00000964).l,d0
	beq.w	Lffc6a0
	cmp.w	($0004,a1),d0
	bcs.w	Lffc6a4
	movem.l	d1-d7/a0-a6,-(a7)
	move.w	(a1)+,d4
	move.w	(a1)+,d5
	move.w	(a1),d7
	bsr.w	Lffc862
	movem.l	(a7)+,d1-d7/a0-a6
	clr.l	d0
	rts

Lffc7ce:
	move.w	($00000964).l,d0
	beq.w	Lffc6a0
	cmp.w	($000a,a1),d0
	bcs.w	Lffc6a4
	movem.l	d1-d7/a0-a6,-(a7)
	move.w	(a1)+,d4
	move.w	(a1)+,d5
	movea.l	(a1)+,a0
	move.b	(a1)+,d2
	move.b	(a1)+,d3
	move.w	(a1)+,d7
	move.b	(a1)+,d1
	move.b	(a1),d6
	bsr.w	Lffce3e
	movem.l	(a7)+,d1-d7/a0-a6
	clr.l	d0
	rts

Lffc800:
	tst.w	($00000964).l
	beq.w	Lffc6a0
	movem.l	d1-d7/a0-a6,-(a7)
	bsr.w	Lffd1ae
	movem.l	(a7)+,d1-d7/a0-a6
	clr.l	d0
	rts

Lffc81a:
	tst.w	($00000964).l
	beq.w	Lffc6a0
	movem.l	d1-d7/a0-a6,-(a7)
	move.w	(a1)+,d0
	move.w	(a1)+,d1
	move.w	(a1)+,d2
	move.w	(a1)+,d3
	movea.l	(a1)+,a2
	movea.l	(a1),a3
	bsr.w	Lffd224
	movem.l	(a7)+,d1-d7/a0-a6
	rts

Lffc83e:
	tst.w	($00000964).l
	beq.w	Lffc6a0
	movem.l	d1-d7/a0-a6,-(a7)
	move.w	(a1)+,d0
	move.w	(a1)+,d1
	move.w	(a1)+,d2
	move.w	(a1)+,d3
	movea.l	(a1)+,a2
	movea.l	(a1),a3
	bsr.w	Lffd228
	movem.l	(a7)+,d1-d7/a0-a6
	rts

Lffc862:
	bsr.s	Lffc876
	bcs.s	Lffc868
	move.w	d7,(a0)
Lffc868:
	rts

Lffc86a:
	bsr.s	Lffc876
	bcs.s	Lffc872
	move.w	(a0),d0
	rts

Lffc872:
	clr.w	d0
	rts

Lffc876:
	cmp.w	($00000968).l,d4
	blt.s	Lffc8b0
	cmp.w	($0000096c).l,d4
	bgt.s	Lffc8b0
	cmp.w	($0000096a).l,d5
	blt.s	Lffc8b0
	cmp.w	($0000096e).l,d5
	bgt.s	Lffc8b0
Lffc896:
	movea.l	($0000095c).l,a0
	move.l	($00000960).l,d0
	mulu.w	d5,d0
	adda.l	d0,a0
	lea.l	(a0,d4.w),a0
	lea.l	(a0,d4.w),a0
	rts

Lffc8b0:
	ori.b	#$01,ccr
	rts

Lffc8b6:
	movem.l	d4-d7/a0-a3,-(a7)
	clr.w	d6
	movem.w	d0-d1,-(a7)
	move.w	d2,d0
	move.w	d3,d1
	bsr.w	Lffc990
	move.w	d4,d5
	movem.w	(a7)+,d0-d1
Lffc8ce:
	bsr.w	Lffc990
	move.w	d4,-(a7)
	or.w	d5,(a7)+
	beq.s	Lffc8ee
	move.w	d4,-(a7)
	and.w	d5,(a7)+
	bne.s	Lffc8fc
	tst.w	d4
	bne.s	Lffc8ea
	exg.l	d0,d2
	exg.l	d1,d3
	exg.l	d4,d5
	not.w	d6
Lffc8ea:
	bsr.s	Lffc902
	bra.s	Lffc8ce

Lffc8ee:
	tst.w	d6
	beq.s	Lffc8f6
	exg.l	d0,d2
	exg.l	d1,d3
Lffc8f6:
	movem.l	(a7)+,d4-d7/a0-a3
	rts

Lffc8fc:
	ori.b	#$01,ccr
	bra.s	Lffc8f6

Lffc902:
	move.w	d4,ccr
	bcs.s	Lffc926
	bvs.s	Lffc92e
	beq.s	Lffc912
	move.w	($0000096e).l,d7
	bra.s	Lffc918

Lffc912:
	move.w	($0000096a).l,d7
Lffc918:
	movea.w	d1,a0
	movea.w	d0,a1
	movea.w	d3,a2
	movea.w	d2,a3
	bsr.s	Lffc93c
	exg.l	d0,d1
	rts

Lffc926:
	move.w	($00000968).l,d7
	bra.s	Lffc934

Lffc92e:
	move.w	($0000096c).l,d7
Lffc934:
	movea.w	d0,a0
	movea.w	d1,a1
	movea.w	d2,a2
	movea.w	d3,a3
Lffc93c:
	adda.w	#$8000,a0
	adda.w	#$8000,a1
	adda.w	#$8000,a2
	adda.w	#$8000,a3
	add.w	#$8000,d7
	cmpa.w	a0,a2
	bcc.s	Lffc958
	exg.l	a0,a2
	exg.l	a1,a3
Lffc958:
	cmp.w	a0,d7
	beq.s	Lffc982
	cmp.w	a2,d7
	beq.s	Lffc97e
Lffc960:
	move.w	a1,d1
	add.w	a3,d1
	roxr.w	#1,d1
	move.w	a0,d0
	add.w	a2,d0
	roxr.w	#1,d0
	cmp.w	d7,d0
	beq.s	Lffc986
	bcs.s	Lffc978
	movea.w	d0,a2
	movea.w	d1,a3
	bra.s	Lffc960

Lffc978:
	movea.w	d0,a0
	movea.w	d1,a1
	bra.s	Lffc960

Lffc97e:
	exg.l	a0,a2
	exg.l	a1,a3
Lffc982:
	move.w	a0,d0
	move.w	a1,d1
Lffc986:
	sub.w	#$8000,d0
	sub.w	#$8000,d1
	rts

Lffc990:
	clr.w	d4
	cmp.w	($00000968).l,d0
	bge.s	Lffc99c
	addq.w	#1,d4
Lffc99c:
	cmp.w	($0000096c).l,d0
	ble.s	Lffc9a6
	addq.w	#2,d4
Lffc9a6:
	cmp.w	($0000096a).l,d1
	bge.s	Lffc9b0
	addq.w	#4,d4
Lffc9b0:
	cmp.w	($0000096e).l,d1
	ble.s	Lffc9ba
	addq.w	#8,d4
Lffc9ba:
	rts

Lffc9bc:
	unlk	a6
	rts

Lffc9c0:
	link.w	a6,#-$0034
	cmp.l	d0,d1
	bcs.s	Lffc9bc
	move.l	d0,(-$002c,a6)
	sub.l	#$0000001f,d1
	move.l	d1,(-$0028,a6)
	move.l	d0,(-$0034,a6)
	move.l	d0,(-$0030,a6)
	move.w	d4,d1
	movea.w	d5,a4
	bsr.w	Lffc876
	bcs.s	Lffc9bc
	cmp.w	(a0),d7
	beq.s	Lffc9bc
	move.w	d7,d0
	swap.w	d7
	move.w	d0,d7
	move.w	(a0),d6
	move.w	($00000968).l,d4
	move.w	($0000096c).l,d5
	bsr.s	Lffca58
	move.w	(-$0024,a6),(-$0018,a6)
	move.l	(-$0022,a6),(-$0016,a6)
	move.w	(-$001e,a6),(-$0012,a6)
	move.l	(-$001c,a6),(-$0010,a6)
	bsr.w	Lffcb04
Lffca1e:
	movea.l	(-$0030,a6),a1
	cmpa.l	(-$0034,a6),a1
	beq.s	Lffc9bc
	bsr.w	Lffcb92
	move.l	a1,(-$0030,a6)
	movea.w	(a1)+,a2
	movea.w	(a1)+,a4
	move.w	(a1)+,(-$0018,a6)
	move.l	(a1)+,(-$0016,a6)
	move.w	(a1)+,(-$0012,a6)
	move.l	(a1)+,(-$0010,a6)
	move.w	(a1)+,(-$000c,a6)
	move.l	(a1)+,(-$000a,a6)
	move.w	(a1)+,(-$0006,a6)
	move.l	(a1)+,(-$0004,a6)
	bsr.s	Lffcab6
	bra.s	Lffca1e

Lffca58:
	move.l	a0,-(a7)
	move.w	d1,-(a7)
Lffca5c:
	cmp.w	d4,d1
	beq.s	Lffca6a
	subq.w	#1,d1
	cmp.w	-(a0),d6
	beq.s	Lffca5c
	addq.l	#2,a0
	addq.w	#1,d1
Lffca6a:
	move.w	d1,(-$0024,a6)
	move.l	a0,(-$0022,a6)
	move.w	(a7)+,d1
	movea.l	(a7)+,a0
Lffca76:
	cmp.w	d5,d1
	beq.s	Lffca86
	addq.l	#2,a0
	addq.w	#1,d1
	cmp.w	(a0),d6
	beq.s	Lffca76
	subq.l	#2,a0
	subq.w	#1,d1
Lffca86:
	move.w	d1,(-$001e,a6)
	move.l	a0,(-$001c,a6)
	move.l	a0,d0
	sub.l	(-$0022,a6),d0
	lsr.l	#1,d0
	beq.s	Lffcab2
	btst.l	#$00,d0
	bne.s	Lffcaa6
	move.w	d7,(a0)
	lsr.w	#1,d0
	subq.w	#1,d0
	bra.s	Lffcaaa

Lffcaa6:
	addq.l	#2,a0
	lsr.w	#1,d0
Lffcaaa:
	move.l	d7,-(a0)
	dbra.w	d0,Lffcaaa
	rts

Lffcab2:
	move.w	d7,(a0)
Lffcab4:
	rts

Lffcab6:
	cmpa.w	($0000096a).l,a4
	beq.s	Lffcac6
	lea.l	(-$0001,a4),a5
	clr.w	d0
	bsr.s	Lffcad4
Lffcac6:
	cmpa.w	($0000096e).l,a4
	beq.s	Lffcab4
	lea.l	($0001,a4),a5
	moveq.l	#$ff,d0
Lffcad4:
	movea.w	d0,a3
	move.w	a2,d1
	eor.w	d0,d1
	beq.s	Lffcb24
	move.w	(-$000c,a6),d1
	cmp.w	d4,d1
	beq.s	Lffcaf2
	subq.w	#1,d1
	move.w	d1,d3
	move.w	(-$0018,a6),d1
	movea.l	(-$0016,a6),a0
	bsr.s	Lffcb30
Lffcaf2:
	move.w	(-$0006,a6),d1
	cmp.w	d5,d1
	beq.s	Lffcab4
	movea.l	(-$0004,a6),a0
	move.w	(-$0012,a6),d3
	bra.s	Lffcb40

Lffcb04:
	cmpa.w	($0000096a).l,a4
	beq.s	Lffcb14
	lea.l	(-$0001,a4),a5
	clr.w	d0
	bsr.s	Lffcb22
Lffcb14:
	cmpa.w	($0000096e).l,a4
	beq.s	Lffcab4
	lea.l	($0001,a4),a5
	moveq.l	#$ff,d0
Lffcb22:
	movea.w	d0,a3
Lffcb24:
	move.w	(-$0012,a6),d3
	movea.l	(-$0016,a6),a0
	move.w	(-$0018,a6),d1
Lffcb30:
	move.l	($00000960).l,d0
	move.w	a3,d2
	bne.s	Lffcb3c
	neg.l	d0
Lffcb3c:
	adda.l	d0,a0
	bra.s	Lffcb44

Lffcb40:
	addq.l	#2,a0
	addq.w	#1,d1
Lffcb44:
	cmp.w	d3,d1
	bhi.s	Lffcb90
	cmp.w	(a0),d6
	bne.s	Lffcb40
	bsr.s	Lffcb50
	bra.s	Lffcb40

Lffcb50:
	bsr.w	Lffca58
	movea.l	(-$0034,a6),a1
	bsr.s	Lffcb92
	cmpa.l	(-$0030,a6),a1
	beq.s	Lffcb90
	move.l	a1,(-$0034,a6)
	move.w	a3,(a1)+
	move.w	a5,(a1)+
	move.w	(-$0024,a6),(a1)+
	move.l	(-$0022,a6),(a1)+
	move.w	(-$001e,a6),(a1)+
	move.l	(-$001c,a6),(a1)+
	move.w	(-$0018,a6),(a1)+
	move.l	(-$0016,a6),(a1)+
	move.w	(-$0012,a6),(a1)+
	move.l	(-$0010,a6),(a1)+
	move.w	(-$001e,a6),d1
	movea.l	(-$001c,a6),a0
Lffcb90:
	rts

Lffcb92:
	lea.l	($0020,a1),a1
	cmpa.l	(-$0028,a6),a1
	bls.s	Lffcba0
	movea.l	(-$002c,a6),a1
Lffcba0:
	rts

Lffcba2:
	link.w	a6,#-$0046
	move.w	d4,(-$0004,a6)
	move.w	d5,(-$0002,a6)
	move.w	d6,(-$0046,a6)
	clr.w	d0
	tst.w	d2
	bpl.s	Lffcbbc
	neg.w	d2
	moveq.l	#$ff,d0
Lffcbbc:
	move.w	d0,(-$0012,a6)
	clr.w	d0
	tst.w	d3
	bpl.s	Lffcbca
	neg.w	d3
	moveq.l	#$ff,d0
Lffcbca:
	move.w	d0,(-$0010,a6)
	clr.w	d0
	cmp.w	d2,d3
	bcc.s	Lffcbd6
	moveq.l	#$ff,d0
Lffcbd6:
	move.w	d0,(-$0014,a6)
	tst.w	d1
	bpl.s	Lffcbe2
	move.w	#$7fff,d1
Lffcbe2:
	move.w	d1,(-$0008,a6)
	move.w	d1,(-$000a,a6)
	clr.w	(-$0006,a6)
	bsr.s	Lffcbf8
	bsr.w	Lffccf0
	unlk	a6
Lffcbf6:
	rts

Lffcbf8:
	lea.l	(-$0024,a6),a0
	moveq.l	#$07,d1
	move.b	#$96,d0
Lffcc02:
	clr.w	(a0)+
	lsl.b	#1,d0
	bcc.s	Lffcc0e
	move.b	#$01,(-$0001,a0)
Lffcc0e:
	dbra.w	d1,Lffcc02
	move.w	d3,d0
	bsr.s	Lffcc4a
	move.w	d1,(-$000c,a6)
	move.b	#$20,(a0)		;' '
	move.w	d2,d0
	bsr.s	Lffcc4a
	move.w	d1,(-$000e,a6)
	bset.b	#$06,(a0)
	btst.b	#$05,(a0)
	beq.s	Lffcc36
	tst.w	(-$0014,a6)
	beq.s	Lffcbf6
Lffcc36:
	addq.w	#1,d6
	and.w	#$0007,d6
	bsr.s	Lffcc86
	btst.b	#$05,(a0)
	bne.s	Lffcbf6
	bset.b	#$07,(a0)
	bra.s	Lffcc36

Lffcc4a:
	clr.w	d1
	cmp.w	#$0168,d0
	bls.s	Lffcc56
	move.w	#$0168,d0
Lffcc56:
	sub.w	#$002d,d0
	bls.s	Lffcc60
	addq.w	#1,d1
	bra.s	Lffcc56

Lffcc60:
	add.w	#$002d,d0
	move.w	d1,-(a7)
	lsr.w	#1,d1
	bcc.s	Lffcc70
	sub.w	#$002d,d0
	neg.w	d0
Lffcc70:
	moveq.l	#$ff,d1
	cmp.w	#$002d,d0		;'-'
	beq.s	Lffcc84
	clr.w	d1
	move.b	(Lffcc92,pc,d0.w),d1
	mulu.w	(-$0008,a6),d1
	lsr.l	#8,d1
Lffcc84:
	move.w	(a7)+,d6
Lffcc86:
	clr.w	d0
	move.b	(Lffccc0,pc,d6.w),d0
	lea.l	(-$24,a6,d0.w),a0
	rts

Lffcc92:
	.dc.b	$00,$04,$09,$0d,$12,$16,$1b,$1f
	.dc.b	$24,$28,$2c,$31,$35,$3a,$3e,$42
	.dc.b	$47,$4b,$4f,$53,$58,$5c,$60,$64
	.dc.b	$68,$6c,$70,$74,$78,$7c,$80,$84
	.dc.b	$88,$8b,$8f,$93,$96,$9a,$9e,$a1
	.dc.b	$a5,$a8,$ab,$af,$b2,$b5
Lffccc0:
	.dc.b	$0e,$0a,$02,$06,$04,$00,$08,$0c
Lffccc8:
	bsr.s	Lffcd16
	addq.w	#1,(-$0006,a6)
	move.w	(-$0006,a6),d0
	lsl.w	#1,d0
	move.w	(-$000a,a6),d1
	sub.w	d0,d1
	addq.w	#1,d1
	bpl.s	Lffccec
	subq.w	#1,(-$0008,a6)
	move.w	(-$0008,a6),d0
	lsl.w	#1,d0
	add.w	d0,d1
	addq.w	#1,d1
Lffccec:
	move.w	d1,(-$000a,a6)
Lffccf0:
	move.w	(-$0008,a6),d0
	sub.w	(-$0006,a6),d0
	beq.s	Lffccfe
	subq.w	#1,d0
	bne.s	Lffccc8
Lffccfe:
	move.w	(-$0006,a6),d0
	cmp.w	(-$000e,a6),d0
	bcc.s	Lffcd0c
	move.w	d0,(-$000e,a6)
Lffcd0c:
	cmp.w	(-$000c,a6),d0
	bcc.s	Lffcd16
	move.w	d0,(-$000c,a6)
Lffcd16:
	bsr.w	Lffcdb4
	lea.l	(-$0044,a6),a4
	moveq.l	#$07,d6
Lffcd20:
	movem.l	d6/a4,-(a7)
	move.b	($0020,a4),d2
	beq.s	Lffcd7e
	lsl.b	#1,d2
	bcs.s	Lffcd78
	move.w	(-$0006,a6),d1
	lsl.b	#1,d2
	bcc.s	Lffcd62
	move.w	(-$000e,a6),d0
	cmp.w	d1,d0
	beq.s	Lffcd8a
	btst.b	#$00,($0021,a4)
	bne.s	Lffcd4a
	bcs.s	Lffcd58
	bra.s	Lffcd4c

Lffcd4a:
	bcc.s	Lffcd58
Lffcd4c:
	lsl.b	#1,d2
	bcc.s	Lffcd7e
	tst.w	(-$0014,a6)
	beq.s	Lffcd7e
	bra.s	Lffcd62

Lffcd58:
	lsl.b	#1,d2
	bcc.s	Lffcd78
	tst.w	(-$0014,a6)
	bne.s	Lffcd78
Lffcd62:
	move.w	(-$000c,a6),d0
	cmp.w	d1,d0
	beq.s	Lffcd90
	btst.b	#$00,($0021,a4)
	beq.s	Lffcd76
	bcs.s	Lffcd78
	bra.s	Lffcd7e

Lffcd76:
	bcs.s	Lffcd7e
Lffcd78:
	bsr.s	Lffcdac
	bsr.w	Lffc862
Lffcd7e:
	movem.l	(a7)+,d6/a4
	addq.l	#2,a4
	dbra.w	d6,Lffcd20
	rts

Lffcd8a:
	tst.w	(-$0012,a6)
	bra.s	Lffcd94

Lffcd90:
	tst.w	(-$0010,a6)
Lffcd94:
	beq.s	Lffcd78
	move.w	(a4),d0
	move.w	($0010,a4),d1
	move.w	(-$0004,a6),d2
	move.w	(-$0002,a6),d3
	moveq.l	#$ff,d6
	bsr.w	Lffd0be
	bra.s	Lffcd7e

Lffcdac:
	move.w	(a4),d4
	move.w	($0010,a4),d5
	rts

Lffcdb4:
	lea.l	(-$0044,a6),a4
	lea.l	(-$0034,a6),a5
	move.w	(-$0008,a6),d0
	bsr.s	Lffcdc6
	move.w	(-$0006,a6),d0
Lffcdc6:
	bsr.s	Lffcdfc
	move.w	(-$0004,a6),d0
	add.w	d5,d0
	move.w	d0,($000c,a4)
	move.w	d0,($000e,a4)
	move.w	(-$0004,a6),d0
	sub.w	d5,d0
	move.w	d0,($0004,a4)
	move.w	d0,($0006,a4)
	subq.l	#4,a4
	move.w	(-$0002,a6),d0
	add.w	d4,d0
	bsr.s	Lffcdf4
	move.w	(-$0002,a6),d0
	sub.w	d4,d0
Lffcdf4:
	move.w	d0,($0008,a5)
	move.w	d0,(a5)+
	rts

Lffcdfc:
	move.w	d0,d4
	move.w	d0,d5
	move.w	(-$0046,a6),d0
	cmp.w	#$0100,d0
	beq.s	Lffce20
	bcc.s	Lffce12
	mulu.w	d0,d4
	lsr.l	#8,d4
	rts

Lffce12:
	clr.l	d1
	move.w	d0,d1
	clr.l	d0
	move.w	d5,d0
	lsl.l	#8,d0
	bsr.s	Lffce22
	move.w	d0,d5
Lffce20:
	rts

Lffce22:
	clr.l	d2
	moveq.l	#$1f,d3
Lffce26:
	lsl.l	#1,d0
	roxl.l	#1,d2
	cmp.l	d1,d2
	bcs.s	Lffce34
	bset.l	#$00,d0
	sub.l	d1,d2
Lffce34:
	dbra.w	d3,Lffce26
	rts

Lffce3a:
	.dc.b	$06,$08,$0c,$00
Lffce3e:
	link.w	a6,#-$005e
	cmp.b	#$03,d1
	bcs.s	Lffce4a
	moveq.l	#$02,d1
Lffce4a:
	and.w	#$00ff,d1
	move.b	(Lffce3a,pc,d1.w),d1
	move.w	d1,(-$0012,a6)
	lea.l	(-$0008,a6),a4
	lea.l	(-$0010,a6),a5
	move.w	d4,(a4)
	move.w	d5,(a5)
	and.w	#$00ff,d2
	bne.s	Lffce6a
	moveq.l	#$01,d2
Lffce6a:
	and.w	#$00ff,d3
	bne.s	Lffce72
	moveq.l	#$01,d3
Lffce72:
	move.w	d2,d0
	move.w	d3,d1
	subq.w	#1,d0
	subq.w	#1,d1
	bsr.w	Lffcf3a
	move.w	d2,(-$0002,a6)
	move.w	d3,(-$000a,a6)
	move.w	d0,(-$0004,a6)
	move.w	d1,(-$000c,a6)
	lea.l	(-$005e,a6),a1
Lffce92:
	move.w	(-$0012,a6),d1
	swap.w	d1
	clr.w	d1
	move.b	(a0)+,d1
	beq.w	Lffcf36
	cmp.b	#$80,d1
	bcs.s	Lffceba
	cmp.b	#$a0,d1
	bcs.s	Lffceb2
	cmp.b	#$e0,d1
	bcs.s	Lffceba
Lffceb2:
	lsl.w	#8,d1
	move.b	(a0),d1
	beq.s	Lffceba
	addq.l	#1,a0
Lffceba:
	move.l	a0,-(a7)
	bsr.w	Lff7094
	movea.l	(a7)+,a0
	move.w	(a1),d6
	subq.w	#1,d6
	lsr.w	#3,d6
	addq.w	#1,d6
	move.w	(a4),($0002,a4)
	move.w	(a1),d4
Lffced0:
	move.w	(a5),($0002,a5)
	move.w	($0002,a1),d5
	lea.l	($0004,a1),a2
Lffcedc:
	lea.l	(a2,d6.w),a3
	move.l	a3,-(a7)
Lffcee2:
	move.b	-(a3),d0
	roxl.b	#1,d0
	move.b	d0,(a3)
	cmpa.l	a2,a3
	bne.s	Lffcee2
	roxr.b	#1,d0
	bpl.s	Lffcf10
	move.w	(-$0006,a6),d0
	move.w	(-$000e,a6),d1
	move.w	d0,d2
	move.w	d1,d3
	add.w	($0004,a4),d2
	add.w	($0004,a5),d3
	movem.l	d4-d6/a0-a1,-(a7)
	bsr.w	Lffd142
	movem.l	(a7)+,d4-d6/a0-a1
Lffcf10:
	move.w	(-$000a,a6),d0
	add.w	d0,($0002,a5)
	movea.l	(a7)+,a2
	subq.w	#1,d5
	bne.s	Lffcedc
	move.w	(-$0002,a6),d0
	add.w	d0,($0002,a4)
	subq.w	#1,d4
	bne.s	Lffced0
	move.w	(-$0002,a6),d0
	muls.w	(a1),d0
	add.w	d0,(a4)
	bra.w	Lffce92

Lffcf36:
	unlk	a6
	rts

Lffcf3a:
	subq.b	#1,d6
	bcs.s	Lffcf4a
	beq.s	Lffcf4c
	subq.b	#1,d6
	beq.s	Lffcf54
	exg.l	a4,a5
	neg.w	d1
	neg.w	d3
Lffcf4a:
	rts

Lffcf4c:
	exg.l	a4,a5
	neg.w	d0
	neg.w	d2
	rts

Lffcf54:
	neg.w	d0
	neg.w	d2
	neg.w	d1
	neg.w	d3
	rts

Lffcf5e:
	cmp.w	d1,d3
	beq.s	Lffcfa6
	cmp.w	d0,d2
	beq.s	Lffcfae
	movem.w	d0-d3,-(a7)
	move.w	($0000.w,a7),d4
	move.w	($0002,a7),d5
	move.w	($0004,a7),d1
	bsr.s	Lffcfb6
	move.w	($0004,a7),d4
	move.w	($0002,a7),d5
	move.w	($0006,a7),d1
	bsr.s	Lffcff8
	move.w	($0004,a7),d4
	move.w	($0006,a7),d5
	move.w	($0000.w,a7),d1
	bsr.s	Lffcfb6
	move.w	($0000.w,a7),d4
	move.w	($0006,a7),d5
	move.w	($0002,a7),d1
	bsr.s	Lffcff8
	addq.l	#8,a7
	rts

Lffcfa6:
	move.w	d0,d4
	move.w	d1,d5
	move.w	d2,d1
	bra.s	Lffcfc0

Lffcfae:
	move.w	d0,d4
	move.w	d1,d5
	move.w	d3,d1
	bra.s	Lffd002

Lffcfb6:
	cmp.w	d4,d1
	bcc.s	Lffcfbe
	addq.w	#1,d1
	bra.s	Lffcfc0

Lffcfbe:
	subq.w	#1,d1
Lffcfc0:
	bsr.s	Lffd034
	bcs.s	Lffcff6
	bsr.w	Lffc896
	sub.w	d4,d1
	bcc.s	Lffcfe4
	addq.l	#2,a0
	neg.w	d1
Lffcfd0:
	rol.w	#1,d6
	bcc.s	Lffcfdc
	move.w	d7,-(a0)
	subq.w	#1,d1
	bpl.s	Lffcfd0
	rts

Lffcfdc:
	subq.l	#2,a0
	subq.w	#1,d1
	bpl.s	Lffcfd0
	rts

Lffcfe4:
	rol.w	#1,d6
	bcc.s	Lffcff0
	move.w	d7,(a0)+
	subq.w	#1,d1
	bpl.s	Lffcfe4
	rts

Lffcff0:
	addq.l	#2,a0
	subq.w	#1,d1
	bpl.s	Lffcfe4
Lffcff6:
	rts

Lffcff8:
	cmp.w	d5,d1
	bcc.s	Lffd000
	addq.w	#1,d1
	bra.s	Lffd002

Lffd000:
	subq.w	#1,d1
Lffd002:
	bsr.s	Lffd07c
	bcs.s	Lffd032
	bsr.w	Lffc896
	sub.w	d5,d1
	bcc.s	Lffd022
	neg.w	d1
Lffd010:
	rol.w	#1,d6
	bcc.s	Lffd016
	move.w	d7,(a0)
Lffd016:
	suba.l	($00000960).l,a0
	subq.w	#1,d1
	bpl.s	Lffd010
	rts

Lffd022:
	rol.w	#1,d6
	bcc.s	Lffd028
	move.w	d7,(a0)
Lffd028:
	adda.l	($00000960).l,a0
	subq.w	#1,d1
	bpl.s	Lffd022
Lffd032:
	rts

Lffd034:
	cmp.w	($0000096a).l,d5
	blt.s	Lffd076
	cmp.w	($0000096e).l,d5
	bgt.s	Lffd076
	move.w	($00000968).l,d2
	move.w	($0000096c).l,d3
	cmp.w	d4,d1
	bge.s	Lffd05c
	exg.l	d4,d1
	bsr.s	Lffd05c
	exg.l	d4,d1
	rts

Lffd05c:
	cmp.w	d2,d1
	blt.s	Lffd076
	cmp.w	d3,d4
	bgt.s	Lffd076
	cmp.w	d2,d4
	bge.s	Lffd06a
	move.w	d2,d4
Lffd06a:
	cmp.w	d3,d1
	ble.s	Lffd070
	move.w	d3,d1
Lffd070:
	andi.b	#$fe,ccr
	rts

Lffd076:
	ori.b	#$01,ccr
	rts

Lffd07c:
	cmp.w	($00000968).l,d4
	blt.s	Lffd076
	cmp.w	($0000096c).l,d4
	bgt.s	Lffd076
	move.w	($0000096a).l,d2
	move.w	($0000096e).l,d3
	cmp.w	d5,d1
	bge.s	Lffd0a4
	exg.l	d5,d1
	bsr.s	Lffd0a4
	exg.l	d5,d1
	rts

Lffd0a4:
	cmp.w	d2,d1
	blt.s	Lffd076
	cmp.w	d3,d5
	bgt.s	Lffd076
	cmp.w	d2,d5
	bge.s	Lffd0b2
	move.w	d2,d5
Lffd0b2:
	cmp.w	d3,d1
	ble.s	Lffd0b8
	move.w	d3,d1
Lffd0b8:
	andi.b	#$fe,ccr
	rts

Lffd0be:
	bsr.w	Lffc8b6
	bcs.s	Lffd128
	cmp.w	d1,d3
	beq.w	Lffcfa6
	cmp.w	d0,d2
	beq.w	Lffcfae
	move.l	d0,d4
	move.l	d1,d5
	lea.l	(Lffd12a,pc),a1
	sub.w	d0,d2
	bcc.s	Lffd0e2
	neg.w	d2
	lea.l	(Lffd136,pc),a1
Lffd0e2:
	lea.l	(Lffd12e,pc),a2
	sub.w	d1,d3
	bcc.s	Lffd0f0
	neg.w	d3
	lea.l	(Lffd13a,pc),a2
Lffd0f0:
	cmp.w	d3,d2
	bcc.s	Lffd0f8
	exg.l	d2,d3
	exg.l	a1,a2
Lffd0f8:
	move.w	d2,-(a7)
	move.w	d2,d1
	lsr.w	#1,d1
	bcs.s	Lffd10a
	cmpa.l	#Lffd136,a1
	bcs.s	Lffd10a
	subq.w	#1,d1
Lffd10a:
	bsr.w	Lffc896
Lffd10e:
	rol.w	#1,d6
	bcc.s	Lffd114
	move.w	d7,(a0)
Lffd114:
	subq.w	#1,(a7)
	bmi.s	Lffd126
	jsr	(a1)
	add.w	d3,d1
	cmp.w	d2,d1
	bcs.s	Lffd10e
	sub.w	d2,d1
	jsr	(a2)
	bra.s	Lffd10e

Lffd126:
	addq.l	#2,a7
Lffd128:
	rts

Lffd12a:
	addq.l	#2,a0
	rts

Lffd12e:
	adda.l	($00000960).l,a0
	rts

Lffd136:
	subq.l	#2,a0
	rts

Lffd13a:
	suba.l	($00000960).l,a0
Lffd140:
	rts

Lffd142:
	cmp.w	d0,d2
	bge.s	Lffd148
	exg.l	d0,d2
Lffd148:
	cmp.w	d1,d3
	bge.s	Lffd14e
	exg.l	d1,d3
Lffd14e:
	cmp.w	($00000968).l,d2
	blt.s	Lffd140
	cmp.w	($0000096c).l,d0
	bgt.s	Lffd140
	cmp.w	($0000096a).l,d3
	blt.s	Lffd140
	cmp.w	($0000096e).l,d1
	bgt.s	Lffd140
	cmp.w	($00000968).l,d0
	bge.s	Lffd17c
	move.w	($00000968).l,d0
Lffd17c:
	cmp.w	($0000096c).l,d2
	ble.s	Lffd18a
	move.w	($0000096c).l,d2
Lffd18a:
	cmp.w	($0000096a).l,d1
	bge.s	Lffd198
	move.w	($0000096a).l,d1
Lffd198:
	cmp.w	($0000096e).l,d3
	ble.s	Lffd1a6
	move.w	($0000096e).l,d3
Lffd1a6:
	move.w	d7,d6
	swap.w	d7
	move.w	d6,d7
	bra.s	Lffd1c8

Lffd1ae:
	move.w	($00000968).l,d0
	move.w	($0000096a).l,d1
	move.w	($0000096c).l,d2
	move.w	($0000096e).l,d3
	clr.l	d7
Lffd1c8:
	move.w	d0,d4
	move.w	d1,d5
	sub.w	d1,d3
	bsr.w	Lffc896
	sub.w	d4,d2
	beq.s	Lffd1f4
	lsr.w	#1,d2
	bcs.s	Lffd202
	subq.w	#1,d2
Lffd1dc:
	movea.l	a0,a1
	move.w	d2,d0
	move.w	d7,(a1)+
Lffd1e2:
	move.l	d7,(a1)+
	dbra.w	d0,Lffd1e2
	adda.l	($00000960).l,a0
	dbra.w	d3,Lffd1dc
	rts

Lffd1f4:
	move.w	d7,(a0)
	adda.l	($00000960).l,a0
	dbra.w	d3,Lffd1f4
	rts

Lffd202:
	movea.l	a0,a1
	move.w	d2,d0
Lffd206:
	move.l	d7,(a1)+
	dbra.w	d0,Lffd206
	adda.l	($00000960).l,a0
	dbra.w	d3,Lffd202
	rts

Lffd218:
	moveq.l	#$ff,d0
	rts

Lffd21c:
	moveq.l	#$fe,d0
	rts

Lffd220:
	moveq.l	#$fd,d0
	rts

Lffd224:
	clr.w	d7
	bra.s	Lffd22a

Lffd228:
	moveq.l	#$ff,d7
Lffd22a:
	tst.w	($00000964).l
	beq.s	Lffd218
	cmp.w	d0,d2
	bge.s	Lffd238
	exg.l	d0,d2
Lffd238:
	cmp.w	d1,d3
	bge.s	Lffd23e
	exg.l	d1,d3
Lffd23e:
	cmp.w	($00000968).l,d0
	blt.s	Lffd21c
	cmp.w	($0000096c).l,d2
	bgt.s	Lffd21c
	cmp.w	($0000096a).l,d1
	blt.s	Lffd21c
	cmp.w	($0000096e).l,d3
	bgt.s	Lffd21c
	sub.w	d0,d2
	sub.w	d1,d3
	move.w	d0,d4
	move.w	d1,d5
	bsr.s	Lffd2ba
	move.w	d2,d0
	addq.w	#1,d0
	move.w	d3,d1
	addq.w	#1,d1
	mulu.w	d1,d0
	jsr	(a4)
	subq.l	#1,d0
	add.l	a2,d0
	cmp.l	a3,d0
	bhi.s	Lffd220
	bsr.w	Lffc896
	clr.b	d6
	tst.w	d7
	bne.s	Lffd2a0
Lffd286:
	movea.l	a0,a1
	move.w	d2,d1
Lffd28a:
	move.w	(a1)+,d0
	jsr	(a5)
	dbra.w	d1,Lffd28a
	adda.l	($00000960).l,a0
	dbra.w	d3,Lffd286
	clr.l	d0
	rts

Lffd2a0:
	movea.l	a0,a1
	move.w	d2,d1
Lffd2a4:
	jsr	(a6)
	move.w	d0,(a1)+
	dbra.w	d1,Lffd2a4
	adda.l	($00000960).l,a0
	dbra.w	d3,Lffd2a0
	clr.l	d0
	rts

Lffd2ba:
	moveq.l	#$08,d1
	move.w	($00000964).l,d0
	bmi.s	Lffd2cc
	moveq.l	#$04,d1
	tst.b	d0
	bmi.s	Lffd2cc
	clr.w	d1
Lffd2cc:
	movea.l	(Lffd2da,pc,d1.w),a4
	movea.l	(Lffd2e6,pc,d1.w),a5
	movea.l	(Lffd2f2,pc,d1.w),a6
	rts

Lffd2da:
	.dc.l	$00ffd2fe,$00ffd306
	.dc.l	$00ffd304
Lffd2e6:
	.dc.l	$00ffd308,$00ffd31e
	.dc.l	$00ffd322
Lffd2f2:
	.dc.b	$00,$ff,$d3,$26,$00,$ff,$d3,$3a
	.dc.b	$00,$ff,$d3,$40,$52,$80,$e2,$88
	.dc.b	$4e,$75
Lffd304:
	lsl.l	#1,d0
	rts

Lffd308:
	not.b	d6
	beq.s	Lffd312
	lsl.b	#4,d0
	move.b	d0,(a2)
	rts

Lffd312:
	and.b	#$0f,d0
	andi.b	#$f0,(a2)
	or.b	d0,(a2)+
	rts

Lffd31e:
	move.b	d0,(a2)+
	rts

Lffd322:
	move.w	d0,(a2)+
	rts

Lffd326:
	clr.w	d0
	not.b	d6
	beq.s	Lffd332
	move.b	(a2),d0
	lsr.b	#4,d0
	rts

Lffd332:
	move.b	(a2)+,d0
	and.b	#$0f,d0
	rts

Lffd33a:
	clr.w	d0
	move.b	(a2)+,d0
	rts

Lffd340:
	move.w	(a2)+,d0
	rts

Lffd344:
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$60,$80,$40
	.dc.b	$20,$c0,$14,$14,$1c,$14,$14,$00
	.dc.b	$00,$60,$80,$40,$20,$c0,$14,$14
	.dc.b	$08,$14,$14,$00,$00,$e0,$80,$e0
	.dc.b	$80,$e0,$14,$14,$08,$14,$14,$00
	.dc.b	$00,$e0,$80,$e0,$80,$e0,$1c,$08
	.dc.b	$08,$08,$08,$00,$00,$e0,$80,$e0
	.dc.b	$80,$e0,$1c,$14,$1c,$1c,$04,$00
	.dc.b	$00,$40,$a0,$e0,$a0,$a0,$14,$14
	.dc.b	$18,$14,$14,$00,$00,$c0,$a0,$c0
	.dc.b	$a0,$c0,$10,$10,$10,$10,$1c,$00
	.dc.b	$00,$c0,$a0,$c0,$a0,$c0,$0c,$10
	.dc.b	$08,$04,$18,$00,$00,$a0,$a0,$e0
	.dc.b	$a0,$a0,$1c,$08,$08,$08,$08,$00
	.dc.b	$00,$80,$80,$80,$80,$e0,$1c,$10
	.dc.b	$1c,$10,$10,$00,$00,$a0,$a0,$a0
	.dc.b	$40,$40,$1c,$08,$08,$08,$08,$00
	.dc.b	$00,$e0,$80,$e0,$80,$80,$1c,$10
	.dc.b	$1c,$10,$10,$00,$00,$60,$80,$80
	.dc.b	$80,$60,$18,$14,$18,$14,$14,$00
	.dc.b	$00,$60,$80,$40,$20,$c0,$1c,$14
	.dc.b	$14,$1c,$00,$00,$00,$60,$80,$40
	.dc.b	$20,$c0,$1c,$08,$08,$08,$1c,$00
	.dc.b	$00,$c0,$a0,$a0,$a0,$c0,$1c,$10
	.dc.b	$1c,$10,$1c,$00,$00,$c0,$a0,$a0
	.dc.b	$a0,$c0,$18,$08,$08,$08,$1c,$00
	.dc.b	$00,$c0,$a0,$a0,$a0,$c0,$18,$04
	.dc.b	$08,$10,$1c,$00,$00,$c0,$a0,$a0
	.dc.b	$a0,$c0,$18,$04,$18,$04,$18,$00
	.dc.b	$00,$c0,$a0,$a0,$a0,$c0,$08,$18
	.dc.b	$28,$3c,$08,$00,$00,$a0,$e0,$e0
	.dc.b	$e0,$a0,$14,$14,$18,$18,$14,$00
	.dc.b	$00,$60,$80,$40,$20,$c0,$14,$1c
	.dc.b	$1c,$1c,$14,$00,$00,$e0,$80,$e0
	.dc.b	$80,$e0,$18,$14,$18,$14,$18,$00
	.dc.b	$00,$60,$80,$80,$80,$60,$14,$1c
	.dc.b	$1c,$1c,$14,$00,$00,$e0,$80,$e0
	.dc.b	$80,$e0,$14,$1c,$1c,$14,$14,$00
	.dc.b	$00,$60,$80,$40,$20,$c0,$18,$14
	.dc.b	$18,$14,$18,$00,$00,$e0,$80,$e0
	.dc.b	$80,$e0,$0c,$10,$10,$10,$0c,$00
	.dc.b	$00,$00,$00,$20,$10,$f8,$10,$20
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$20
	.dc.b	$40,$f8,$40,$20,$00,$00,$00,$00
	.dc.b	$00,$00,$20,$70,$a8,$20,$20,$20
	.dc.b	$20,$20,$00,$00,$00,$00,$20,$20
	.dc.b	$20,$20,$20,$a8,$70,$20,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$30,$30
	.dc.b	$30,$30,$20,$20,$00,$20,$20,$00
	.dc.b	$00,$00,$d8,$48,$90,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$10,$50
	.dc.b	$78,$d0,$50,$78,$d0,$50,$40,$00
	.dc.b	$00,$00,$20,$70,$a8,$a0,$70,$28
	.dc.b	$a8,$70,$20,$00,$00,$00,$40,$a0
	.dc.b	$48,$10,$20,$40,$90,$28,$10,$00
	.dc.b	$00,$00,$60,$90,$90,$60,$40,$a8
	.dc.b	$90,$90,$68,$00,$00,$00,$30,$10
	.dc.b	$20,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$08,$08,$10,$10,$10,$10
	.dc.b	$10,$08,$08,$00,$00,$00,$40,$40
	.dc.b	$20,$20,$20,$20,$20,$40,$40,$00
	.dc.b	$00,$00,$00,$20,$a8,$70,$a8,$20
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$20
	.dc.b	$20,$f8,$20,$20,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$60,$20,$40,$00,$00,$00,$00
	.dc.b	$00,$f8,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$60,$60,$00,$00,$00,$08,$08
	.dc.b	$10,$10,$20,$40,$40,$80,$80,$00
	.dc.b	$00,$00,$70,$88,$88,$98,$a8,$c8
	.dc.b	$88,$88,$70,$00,$00,$00,$20,$60
	.dc.b	$20,$20,$20,$20,$20,$20,$70,$00
	.dc.b	$00,$00,$70,$88,$08,$08,$10,$20
	.dc.b	$40,$80,$f8,$00,$00,$00,$70,$88
	.dc.b	$08,$08,$30,$08,$08,$88,$70,$00
	.dc.b	$00,$00,$10,$30,$30,$50,$50,$90
	.dc.b	$f8,$10,$10,$00,$00,$00,$f8,$80
	.dc.b	$80,$f0,$08,$08,$08,$88,$70,$00
	.dc.b	$00,$00,$70,$88,$80,$80,$f0,$88
	.dc.b	$88,$88,$70,$00,$00,$00,$f8,$88
	.dc.b	$08,$10,$20,$20,$20,$20,$20,$00
	.dc.b	$00,$00,$70,$88,$88,$88,$70,$88
	.dc.b	$88,$88,$70,$00,$00,$00,$70,$88
	.dc.b	$88,$88,$78,$08,$88,$88,$70,$00
	.dc.b	$00,$00,$00,$30,$30,$00,$00,$30
	.dc.b	$30,$00,$00,$00,$00,$00,$00,$30
	.dc.b	$30,$00,$00,$30,$10,$20,$00,$00
	.dc.b	$00,$00,$08,$10,$20,$40,$20,$10
	.dc.b	$08,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$f8,$00,$f8,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$40,$20,$10,$08,$10,$20
	.dc.b	$40,$00,$00,$00,$00,$00,$70,$88
	.dc.b	$88,$10,$20,$20,$00,$20,$20,$00
	.dc.b	$00,$00,$70,$88,$a8,$a8,$a8,$a8
	.dc.b	$90,$88,$70,$00,$00,$00,$20,$50
	.dc.b	$88,$88,$88,$f8,$88,$88,$88,$00
	.dc.b	$00,$00,$f0,$88,$88,$88,$f0,$88
	.dc.b	$88,$88,$f0,$00,$00,$00,$30,$48
	.dc.b	$80,$80,$80,$80,$80,$48,$30,$00
	.dc.b	$00,$00,$e0,$90,$88,$88,$88,$88
	.dc.b	$88,$90,$e0,$00,$00,$00,$f8,$80
	.dc.b	$80,$80,$f0,$80,$80,$80,$f8,$00
	.dc.b	$00,$00,$f8,$80,$80,$80,$f0,$80
	.dc.b	$80,$80,$80,$00,$00,$00,$30,$48
	.dc.b	$80,$80,$b8,$88,$88,$58,$28,$00
	.dc.b	$00,$00,$88,$88,$88,$88,$f8,$88
	.dc.b	$88,$88,$88,$00,$00,$00,$70,$20
	.dc.b	$20,$20,$20,$20,$20,$20,$70,$00
	.dc.b	$00,$00,$38,$10,$10,$10,$10,$10
	.dc.b	$90,$90,$60,$00,$00,$00,$88,$90
	.dc.b	$90,$a0,$c0,$e0,$90,$88,$88,$00
	.dc.b	$00,$00,$80,$80,$80,$80,$80,$80
	.dc.b	$80,$80,$f8,$00,$00,$00,$88,$88
	.dc.b	$d8,$d8,$f8,$a8,$a8,$88,$88,$00
	.dc.b	$00,$00,$88,$c8,$c8,$a8,$a8,$a8
	.dc.b	$98,$98,$88,$00,$00,$00,$70,$88
	.dc.b	$88,$88,$88,$88,$88,$88,$70,$00
	.dc.b	$00,$00,$f0,$88,$88,$88,$f0,$80
	.dc.b	$80,$80,$80,$00,$00,$00,$70,$88
	.dc.b	$88,$88,$88,$88,$a8,$70,$08,$00
	.dc.b	$00,$00,$f0,$88,$88,$88,$f0,$90
	.dc.b	$88,$88,$88,$00,$00,$00,$70,$88
	.dc.b	$80,$80,$70,$08,$08,$88,$70,$00
	.dc.b	$00,$00,$f8,$20,$20,$20,$20,$20
	.dc.b	$20,$20,$20,$00,$00,$00,$88,$88
	.dc.b	$88,$88,$88,$88,$88,$88,$70,$00
	.dc.b	$00,$00,$88,$88,$88,$88,$88,$88
	.dc.b	$50,$50,$20,$00,$00,$00,$a8,$a8
	.dc.b	$a8,$a8,$a8,$a8,$a8,$50,$50,$00
	.dc.b	$00,$00,$88,$88,$50,$50,$20,$50
	.dc.b	$50,$88,$88,$00,$00,$00,$88,$88
	.dc.b	$50,$50,$20,$20,$20,$20,$20,$00
	.dc.b	$00,$00,$f8,$08,$10,$10,$20,$40
	.dc.b	$40,$80,$f8,$00,$00,$00,$38,$20
	.dc.b	$20,$20,$20,$20,$20,$20,$38,$00
	.dc.b	$00,$00,$88,$50,$20,$f8,$20,$f8
	.dc.b	$20,$20,$20,$00,$00,$00,$70,$10
	.dc.b	$10,$10,$10,$10,$10,$10,$70,$00
	.dc.b	$00,$00,$20,$50,$88,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$f8,$00
	.dc.b	$00,$00,$40,$20,$10,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$70,$88,$78,$88,$98,$68,$00
	.dc.b	$00,$00,$80,$80,$80,$b0,$c8,$88
	.dc.b	$88,$c8,$b0,$00,$00,$00,$00,$00
	.dc.b	$00,$70,$88,$80,$80,$88,$70,$00
	.dc.b	$00,$00,$08,$08,$08,$68,$98,$88
	.dc.b	$88,$98,$68,$00,$00,$00,$00,$00
	.dc.b	$00,$70,$88,$f8,$80,$88,$70,$00
	.dc.b	$00,$00,$10,$28,$20,$20,$f8,$20
	.dc.b	$20,$20,$20,$00,$00,$00,$00,$00
	.dc.b	$00,$78,$88,$88,$88,$78,$88,$70
	.dc.b	$00,$00,$80,$80,$80,$b0,$c8,$88
	.dc.b	$88,$88,$88,$00,$00,$00,$00,$20
	.dc.b	$00,$60,$20,$20,$20,$20,$70,$00
	.dc.b	$00,$00,$00,$08,$00,$18,$08,$08
	.dc.b	$08,$08,$88,$70,$00,$00,$80,$80
	.dc.b	$80,$88,$90,$a0,$e0,$90,$88,$00
	.dc.b	$00,$00,$60,$20,$20,$20,$20,$20
	.dc.b	$20,$20,$20,$00,$00,$00,$00,$00
	.dc.b	$00,$f0,$a8,$a8,$a8,$a8,$a8,$00
	.dc.b	$00,$00,$00,$00,$00,$b0,$c8,$88
	.dc.b	$88,$88,$88,$00,$00,$00,$00,$00
	.dc.b	$00,$70,$88,$88,$88,$88,$70,$00
	.dc.b	$00,$00,$00,$00,$00,$b0,$c8,$88
	.dc.b	$c8,$b0,$80,$80,$00,$00,$00,$00
	.dc.b	$00,$68,$98,$88,$98,$68,$08,$08
	.dc.b	$00,$00,$00,$00,$00,$b0,$c8,$80
	.dc.b	$80,$80,$80,$00,$00,$00,$00,$00
	.dc.b	$00,$70,$88,$60,$10,$88,$70,$00
	.dc.b	$00,$00,$00,$20,$20,$f8,$20,$20
	.dc.b	$20,$28,$30,$00,$00,$00,$00,$00
	.dc.b	$00,$88,$88,$88,$88,$98,$68,$00
	.dc.b	$00,$00,$00,$00,$00,$88,$88,$50
	.dc.b	$50,$20,$20,$00,$00,$00,$00,$00
	.dc.b	$00,$88,$a8,$a8,$a8,$a8,$50,$00
	.dc.b	$00,$00,$00,$00,$00,$88,$50,$20
	.dc.b	$20,$50,$88,$00,$00,$00,$00,$00
	.dc.b	$00,$88,$88,$88,$78,$08,$88,$70
	.dc.b	$00,$00,$00,$00,$00,$f8,$10,$20
	.dc.b	$40,$80,$f8,$00,$00,$00,$08,$10
	.dc.b	$10,$10,$20,$10,$10,$10,$08,$00
	.dc.b	$00,$00,$20,$20,$20,$20,$20,$20
	.dc.b	$20,$20,$20,$00,$00,$00,$40,$20
	.dc.b	$20,$20,$10,$20,$20,$20,$40,$00
	.dc.b	$00,$00,$f8,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$80,$80,$40,$40,$20,$20,$10
	.dc.b	$10,$08,$08,$00,$00,$60,$98,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$20,$20,$20,$20,$00,$00,$20
	.dc.b	$20,$20,$20,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$20,$38,$c0,$40,$6c,$b0
	.dc.b	$50,$40,$38,$00,$00,$00,$00,$00
	.dc.b	$20,$70,$28,$78,$b4,$a4,$48,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$90,$88
	.dc.b	$88,$a0,$40,$00,$00,$00,$00,$00
	.dc.b	$30,$10,$68,$08,$08,$10,$20,$00
	.dc.b	$00,$00,$00,$00,$30,$00,$b0,$50
	.dc.b	$20,$50,$98,$00,$00,$00,$00,$00
	.dc.b	$28,$b4,$60,$38,$64,$a4,$68,$00
	.dc.b	$00,$00,$00,$00,$10,$50,$58,$e4
	.dc.b	$28,$20,$20,$00,$00,$00,$00,$00
	.dc.b	$10,$b8,$d4,$94,$b8,$10,$20,$00
	.dc.b	$00,$00,$00,$00,$10,$10,$1c,$10
	.dc.b	$70,$9c,$60,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$38,$c4,$04,$08,$30,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$20,$20
	.dc.b	$70,$28,$38,$6c,$b4,$a4,$48,$00
	.dc.b	$00,$00,$00,$88,$88,$84,$84,$50
	.dc.b	$60,$20,$00,$00,$00,$00,$30,$00
	.dc.b	$10,$68,$08,$08,$08,$10,$20,$00
	.dc.b	$00,$00,$20,$10,$38,$d0,$20,$20
	.dc.b	$50,$50,$8c,$00,$00,$00,$20,$28
	.dc.b	$f4,$20,$38,$64,$a4,$a4,$68,$00
	.dc.b	$00,$00,$20,$28,$f4,$54,$54,$50
	.dc.b	$50,$90,$30,$00,$00,$00,$50,$e0
	.dc.b	$28,$f0,$10,$70,$88,$80,$70,$00
	.dc.b	$00,$00,$08,$10,$20,$40,$40,$20
	.dc.b	$10,$08,$08,$00,$00,$00,$08,$8c
	.dc.b	$b8,$88,$88,$88,$88,$d0,$50,$00
	.dc.b	$00,$00,$00,$78,$10,$00,$40,$80
	.dc.b	$80,$7c,$00,$00,$00,$00,$40,$38
	.dc.b	$e0,$10,$10,$78,$80,$80,$78,$00
	.dc.b	$00,$00,$80,$40,$40,$40,$40,$40
	.dc.b	$40,$44,$38,$00,$00,$10,$10,$fc
	.dc.b	$10,$30,$50,$30,$10,$10,$20,$00
	.dc.b	$00,$00,$08,$48,$4c,$f8,$48,$58
	.dc.b	$40,$40,$3c,$00,$00,$00,$90,$50
	.dc.b	$20,$f8,$20,$40,$40,$40,$30,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$e0,$a0,$e0,$00
	.dc.b	$00,$7c,$40,$40,$40,$40,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$08,$08,$08,$08,$f8,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$80,$40,$60,$00,$00,$00,$00,$00
	.dc.b	$00,$30,$30,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$f8,$08,$08,$f8,$08,$08
	.dc.b	$10,$10,$20,$00,$00,$00,$00,$00
	.dc.b	$f8,$08,$28,$30,$20,$20,$40,$00
	.dc.b	$00,$00,$00,$00,$10,$10,$20,$60
	.dc.b	$a0,$20,$20,$00,$00,$00,$00,$00
	.dc.b	$20,$f8,$88,$88,$08,$10,$20,$00
	.dc.b	$00,$00,$00,$00,$00,$f8,$20,$20
	.dc.b	$20,$20,$f8,$00,$00,$00,$00,$00
	.dc.b	$10,$f8,$30,$50,$50,$90,$10,$00
	.dc.b	$00,$00,$00,$00,$40,$5c,$e4,$48
	.dc.b	$20,$20,$20,$00,$00,$00,$00,$00
	.dc.b	$00,$70,$10,$10,$10,$10,$fc,$00
	.dc.b	$00,$00,$00,$00,$78,$08,$08,$78
	.dc.b	$08,$08,$78,$00,$00,$00,$00,$00
	.dc.b	$a8,$a8,$a8,$08,$08,$10,$60,$00
	.dc.b	$00,$00,$00,$00,$00,$f8,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$f8,$08
	.dc.b	$08,$28,$30,$20,$20,$20,$40,$00
	.dc.b	$00,$00,$10,$18,$30,$60,$a0,$20
	.dc.b	$20,$20,$20,$00,$00,$00,$20,$20
	.dc.b	$f8,$88,$88,$08,$08,$10,$20,$00
	.dc.b	$00,$00,$00,$f8,$20,$20,$20,$20
	.dc.b	$20,$20,$f8,$00,$00,$00,$10,$10
	.dc.b	$fc,$30,$30,$50,$50,$90,$10,$00
	.dc.b	$00,$00,$20,$20,$fc,$24,$24,$24
	.dc.b	$44,$54,$88,$00,$00,$00,$20,$38
	.dc.b	$e0,$20,$3c,$e0,$10,$10,$10,$00
	.dc.b	$00,$00,$78,$48,$48,$88,$08,$10
	.dc.b	$10,$20,$40,$00,$00,$00,$40,$40
	.dc.b	$7c,$90,$10,$10,$10,$20,$40,$00
	.dc.b	$00,$00,$00,$f8,$08,$08,$08,$08
	.dc.b	$08,$08,$f8,$00,$00,$00,$08,$48
	.dc.b	$fc,$48,$48,$08,$10,$10,$20,$00
	.dc.b	$00,$00,$40,$20,$00,$84,$44,$08
	.dc.b	$08,$10,$60,$00,$00,$00,$f8,$08
	.dc.b	$08,$08,$10,$10,$28,$44,$84,$00
	.dc.b	$00,$00,$20,$20,$3c,$e4,$28,$20
	.dc.b	$20,$20,$1c,$00,$00,$00,$84,$84
	.dc.b	$44,$44,$08,$08,$10,$20,$40,$00
	.dc.b	$00,$00,$78,$48,$48,$a8,$18,$10
	.dc.b	$10,$20,$40,$00,$00,$00,$18,$70
	.dc.b	$10,$fc,$10,$10,$20,$20,$40,$00
	.dc.b	$00,$00,$24,$a4,$94,$44,$04,$08
	.dc.b	$08,$10,$20,$00,$00,$00,$78,$00
	.dc.b	$00,$fc,$10,$10,$10,$20,$40,$00
	.dc.b	$00,$00,$40,$40,$40,$60,$50,$48
	.dc.b	$40,$40,$40,$00,$00,$00,$10,$10
	.dc.b	$10,$fc,$10,$10,$10,$20,$40,$00
	.dc.b	$00,$00,$00,$78,$00,$00,$00,$00
	.dc.b	$00,$00,$fc,$00,$00,$00,$f8,$08
	.dc.b	$08,$c8,$30,$10,$28,$48,$80,$00
	.dc.b	$00,$00,$40,$20,$f8,$10,$20,$70
	.dc.b	$a8,$20,$20,$00,$00,$00,$18,$08
	.dc.b	$08,$10,$10,$20,$20,$40,$80,$00
	.dc.b	$00,$00,$10,$50,$48,$48,$48,$44
	.dc.b	$44,$84,$84,$00,$00,$00,$80,$80
	.dc.b	$88,$b0,$c0,$80,$80,$80,$78,$00
	.dc.b	$00,$00,$f8,$08,$08,$08,$08,$10
	.dc.b	$10,$20,$40,$00,$00,$00,$00,$20
	.dc.b	$20,$50,$90,$88,$08,$04,$00,$00
	.dc.b	$00,$00,$20,$20,$f8,$20,$a8,$a8
	.dc.b	$a4,$20,$20,$00,$00,$00,$f8,$08
	.dc.b	$08,$08,$10,$90,$60,$20,$10,$00
	.dc.b	$00,$00,$60,$18,$00,$40,$30,$08
	.dc.b	$00,$60,$18,$00,$00,$00,$10,$10
	.dc.b	$10,$20,$20,$48,$44,$9c,$e4,$00
	.dc.b	$00,$00,$10,$10,$10,$50,$30,$10
	.dc.b	$28,$48,$80,$00,$00,$00,$78,$20
	.dc.b	$20,$fc,$20,$20,$20,$20,$1c,$00
	.dc.b	$00,$40,$40,$3c,$e4,$28,$20,$20
	.dc.b	$10,$10,$10,$00,$00,$00,$00,$78
	.dc.b	$08,$08,$08,$08,$10,$10,$fc,$00
	.dc.b	$00,$00,$f8,$08,$08,$08,$f8,$08
	.dc.b	$08,$08,$f8,$00,$00,$00,$78,$00
	.dc.b	$fc,$04,$04,$08,$08,$10,$20,$00
	.dc.b	$00,$00,$48,$48,$48,$48,$48,$08
	.dc.b	$08,$10,$20,$00,$00,$00,$10,$50
	.dc.b	$50,$50,$50,$50,$54,$98,$10,$00
	.dc.b	$00,$00,$80,$80,$80,$80,$88,$90
	.dc.b	$90,$a0,$c0,$00,$00,$00,$f8,$88
	.dc.b	$88,$88,$88,$88,$88,$f8,$88,$00
	.dc.b	$00,$00,$f8,$88,$88,$08,$08,$08
	.dc.b	$10,$10,$20,$00,$00,$00,$00,$c0
	.dc.b	$24,$04,$08,$08,$10,$a0,$40,$00
	.dc.b	$00,$20,$90,$40,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$70,$50,$70
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$20,$30,$e0,$40,$5c,$40
	.dc.b	$80,$a0,$9c,$00,$00,$00,$20,$38
	.dc.b	$e0,$20,$38,$44,$04,$08,$30,$00
	.dc.b	$00,$00,$00,$38,$c4,$04,$04,$04
	.dc.b	$08,$30,$00,$00,$00,$00,$00,$fc
	.dc.b	$08,$10,$20,$20,$20,$10,$08,$00
	.dc.b	$00,$00,$40,$40,$44,$58,$60,$40
	.dc.b	$80,$80,$78,$00,$00,$00,$20,$38
	.dc.b	$e0,$4c,$50,$90,$38,$54,$20,$00
	.dc.b	$00,$00,$80,$80,$bc,$88,$80,$80
	.dc.b	$a0,$dc,$40,$00,$00,$00,$00,$48
	.dc.b	$48,$78,$54,$a4,$ac,$d4,$08,$00
	.dc.b	$00,$00,$40,$40,$e8,$54,$64,$44
	.dc.b	$cc,$54,$48,$00,$00,$00,$00,$38
	.dc.b	$54,$94,$94,$a4,$a4,$c8,$10,$00
	.dc.b	$00,$00,$08,$88,$bc,$88,$88,$88
	.dc.b	$98,$ec,$50,$00,$00,$00,$20,$e8
	.dc.b	$4c,$48,$88,$88,$88,$90,$60,$00
	.dc.b	$00,$00,$20,$10,$10,$20,$28,$94
	.dc.b	$94,$b4,$20,$00,$00,$00,$00,$20
	.dc.b	$60,$50,$90,$08,$08,$04,$00,$00
	.dc.b	$00,$00,$8c,$b8,$88,$bc,$88,$88
	.dc.b	$98,$ec,$50,$00,$00,$00,$10,$fc
	.dc.b	$10,$18,$70,$10,$78,$94,$60,$00
	.dc.b	$00,$00,$10,$70,$10,$20,$28,$78
	.dc.b	$ac,$c8,$10,$00,$00,$00,$20,$20
	.dc.b	$f8,$28,$64,$a0,$64,$44,$38,$00
	.dc.b	$00,$00,$00,$48,$48,$78,$54,$a4
	.dc.b	$a4,$c4,$08,$00,$00,$00,$20,$20
	.dc.b	$70,$20,$e0,$34,$44,$44,$38,$00
	.dc.b	$00,$00,$50,$58,$74,$c4,$28,$20
	.dc.b	$20,$10,$10,$00,$00,$00,$20,$90
	.dc.b	$b8,$d4,$94,$94,$b8,$10,$20,$00
	.dc.b	$00,$00,$10,$10,$1c,$10,$10,$10
	.dc.b	$70,$9c,$60,$00,$00,$00,$60,$10
	.dc.b	$80,$80,$b8,$c4,$84,$08,$30,$00
	.dc.b	$00,$00,$48,$48,$48,$48,$68,$48
	.dc.b	$10,$10,$20,$00,$00,$00,$78,$10
	.dc.b	$20,$38,$44,$84,$34,$48,$30,$00
	.dc.b	$00,$00,$40,$40,$e8,$58,$68,$48
	.dc.b	$c8,$4c,$48,$00,$00,$00,$78,$10
	.dc.b	$20,$38,$44,$84,$04,$08,$30,$00
	.dc.b	$00,$00,$40,$40,$e8,$54,$64,$44
	.dc.b	$c4,$44,$48,$00,$00,$00,$10,$10
	.dc.b	$10,$20,$20,$60,$50,$94,$88,$00
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$ff,$ff,$ff
Lffffff:
	.dc.b	$ff
L000000:

	.end	Lff0010
