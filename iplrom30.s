;=============================================
;  Filename iplrom30.dat
;  Time Stamp Tue Jan 15 10:36:15 2019
;
;  Base address fe0000
;  Exec address ff0038
;  Text size    020000 byte(s)
;  Data size    000000 byte(s)
;  Bss  size    000000 byte(s)
;  3198 Labels
;  Code Generate date Wed Jan 16 03:26:45 2019
;  Commandline dis  -b2 -h -m68030 -m68882 -zfe0000,ff0038 -q -p --exclude-fefunc-mac -Tiplrom30.tab -giplrom30.lab --overwrite iplrom30.dat
;          DIS version 3.16
;=============================================

	.include	inc/doscall.mac
	.include	inc/iocscall.mac

	.cpu	68030

	.text

Lfe0000:
	addq.l	#2,d3
	bra.s	Lfe0000-$000014
Lfe0004:
	jsr	(Lfe003a)
	bra.s	Lfe0000
Lfe000c:
	cmp.l	d4,d3
	bhi.s	Lfe002c
	movea.l	d3,a0
	movea.l	d5,a1
	move.w	d6,d0
Lfe0016:
	cmpm.l	(a0)+,(a1)+
	dbne.w	d0,Lfe0016
	tst.w	d0
	bmi.s	Lfe0024
Lfe0020:
	addq.l	#4,d3
	bra.s	Lfe000c
Lfe0024:
	jsr	(Lfe003a)
	bra.s	Lfe0020
Lfe002c:
	tst.w	($001e,a6)
	beq.s	Lfe0038
	jsr	($00fd8ece)
Lfe0038:
	rts

Lfe003a:
	cmpi.w	#$0008,($001e,a6)
	bcs.s	Lfe004c
	jsr	($00fd8ece)
	clr.w	($001e,a6)
Lfe004c:
	addq.w	#1,($001e,a6)
	move.l	d3,d1
	jsr	($00fd8f4a)
	jsr	($00fd8ee0)
	jsr	($00fd8ee0)
	rts

Lfe0066:
	lea.l	(Lfe0078),a0
	jsr	($00fd9014)
	jmp	($00fd3a9a)

Lfe0078:
	.dc.b	'size(a6) over',$0d,$0a,$00
Lfe0088:
	lea.l	($05a4,a6),a0
	moveq.l	#$09,d2
Lfe008e:
	cmpi.w	#$0001,(a0)
	bne.s	Lfe00cc
	movea.l	($0002,a0),a1
	move.l	($000a,a0),d0
	cmpi.w	#$0001,($0006,a0)
	beq.s	Lfe00c0
	cmpi.w	#$0002,($0006,a0)
	beq.s	Lfe00c6
	cmp.b	(a1),d0
	beq.s	Lfe00b8
Lfe00b0:
	tst.w	($0008,a0)
	beq.s	Lfe00da
	bra.s	Lfe00cc
Lfe00b8:
	tst.w	($0008,a0)
	beq.s	Lfe00cc
	bra.s	Lfe00da
Lfe00c0:
	cmp.w	(a1),d0
	beq.s	Lfe00b8
	bra.s	Lfe00b0
Lfe00c6:
	cmp.l	(a1),d0
	beq.s	Lfe00b8
	bra.s	Lfe00b0
Lfe00cc:
	lea.l	($000e,a0),a0
	dbra.w	d2,Lfe008e
	andi.b	#$7e,ccr
	rts

Lfe00da:
	move.l	($0002,a0),d0
	ori.b	#$01,ccr
	rts

Lfe00e4:
	clr.w	($00002a74).l
	move.w	#$0001,($01d2,a6)
	move.b	(a5)+,d0
	jsr	(Lfe08ec)
	cmp.b	#$43,d0
	beq.w	Lfe042e
	cmp.b	#$45,d0
	beq.w	Lfe043e
	cmp.b	#$44,d0
	beq.w	Lfe0442
	cmpi.b	#$53,d0
	bne.s	Lfe011c
	clr.w	($01d2,a6)
	bra.s	Lfe0144
Lfe011c:
	cmpi.b	#$57,d0
	beq.s	Lfe0144
	cmpi.b	#$4c,d0
	bne.s	Lfe0130
	move.w	#$0002,($01d2,a6)
	bra.s	Lfe0144
Lfe0130:
	subq.l	#1,a5
	move.l	a5,($1a5e,a6)
	jsr	(Lfe07c6)
	beq.w	Lfe02ec
	movea.l	($1a5e,a6),a5
Lfe0144:
	moveq.l	#$ff,d1
	clr.l	d0
	move.b	(a5),d0
	tst.b	d0
	beq.s	Lfe0176
	cmp.b	#$20,d0
	beq.s	Lfe0176
	sub.b	#$30,d0
	cmp.b	#$0a,d0
	bcc.w	Lfe054c
	addq.l	#1,a5
	tst.b	(a5)
	beq.s	Lfe0174
	cmpi.b	#$20,(a5)
	beq.s	Lfe0174
	cmpi.b	#$2c,(a5)
	bne.w	Lfe054c
Lfe0174:
	move.w	d0,d1
Lfe0176:
	move.w	d1,-(a7)
	move.w	d1,($00002a74).l
	tst.w	d1
	bmi.s	Lfe01c0
	clr.l	d0
	move.w	d1,d0
	jsr	(Lfe019c)
	move.l	d0,($00002a76).l
	tst.l	d0
	beq.s	Lfe01c0
	move.l	d0,($0002,a6)
	bra.s	Lfe01c8
Lfe019c:
	lea.l	($05a4,a6),a4
	cmp.l	#$0000000a,d0
	bcc.s	Lfe01bc
	lsl.l	#1,d0
	move.l	d0,d1
	lsl.l	#3,d0
	sub.l	d1,d0
	adda.l	d0,a4
	tst.w	(a4)
	bmi.s	Lfe01bc
	move.l	($0002,a4),d0
	rts

Lfe01bc:
	clr.l	d0
	rts

Lfe01c0:
	move.l	#$ffffffff,($0002,a6)
Lfe01c8:
	jsr	($00fd40c4)
	cmpi.w	#$0003,($00002a7c).l
	bcc.w	Lfe0000-$00023c
	jsr	(Lfe0526)
	clr.l	d0
	move.w	(a7),d0
	bpl.s	Lfe01f0
	jsr	(Lfe0504)
	bcs.w	Lfe0544
Lfe01f0:
	lsl.l	#1,d0
	move.l	d0,d1
	lsl.l	#3,d0
	sub.l	d1,d0
	lea.l	($05a4,a6),a0
	adda.l	d0,a0
	move.l	a0,($00002a70).l
	movea.l	#$00002a62,a0
	subq.w	#1,($0000.w,a6)
	beq.w	Lfe0000-$00023c
	clr.w	($0008,a0)
	move.w	($01d2,a6),d0
	move.w	d0,($0006,a0)
	cmpi.l	#$ffffffff,($0006,a6)
	beq.w	Lfe0000-$00023c
	tst.w	d0
	beq.s	Lfe0238
	btst.b	#$00,($0009,a6)
	bne.w	Lfe0000-$00023c
Lfe0238:
	movea.l	($0006,a6),a1
	move.l	a1,($0002,a0)
	subq.w	#1,($0000.w,a6)
	beq.w	Lfe02c8
	move.w	($00002a7a).l,d0
	and.w	#$0004,d0
	beq.s	Lfe0270
	clr.l	($000a,a6)
	tst.l	($00002a76).l
	beq.s	Lfe0270
	move.l	a1,-(a7)
	movea.l	($00002a70).l,a1
	move.w	($0008,a1),($000c,a6)
	movea.l	(a7)+,a1
Lfe0270:
	move.l	($000a,a6),d0
	andi.l	#$fffffffe,($000a,a6)
	bne.w	Lfe0000-$00023c
	move.w	d0,($0008,a0)
	subq.w	#1,($0000.w,a6)
	beq.s	Lfe02c8
	move.l	#$0000ffff,d0
	tst.w	($0006,a0)
	bne.s	Lfe029c
	move.l	#$000000ff,d0
Lfe029c:
	cmpi.w	#$0002,($0006,a0)
	beq.s	Lfe02ac
	cmp.l	($000e,a6),d0
	bcs.w	Lfe0000-$00023c
Lfe02ac:
	move.l	($000e,a6),($000a,a0)
Lfe02b2:
	addq.l	#2,a7
	move.w	#$0001,(a0)
	moveq.l	#$06,d0
	movea.l	($00002a70).l,a1
Lfe02c0:
	move.w	(a0)+,(a1)+
	dbra.w	d0,Lfe02c0
	rts

Lfe02c8:
	tst.w	($0006,a0)
	beq.s	Lfe02dc
	cmpi.w	#$0001,($0006,a0)
	beq.s	Lfe02e4
	move.l	(a1),($000a,a0)
	bra.s	Lfe02b2
Lfe02dc:
	move.b	(a1),d0
	move.l	d0,($000a,a0)
	bra.s	Lfe02b2
Lfe02e4:
	move.w	(a1),d0
	move.l	d0,($000a,a0)
	bra.s	Lfe02b2
Lfe02ec:
	clr.w	(Lfe042c)
	move.w	#$0000,($001e,a6)
	lea.l	($05a4,a6),a4
Lfe02fc:
	tst.w	(a4)
	bmi.w	Lfe0404
	addq.w	#1,(Lfe042c)
	move.w	#$0030,d0
	add.w	($001e,a6),d0
	cmp.w	#$003a,d0
	bcs.s	Lfe0318
	addq.w	#7,d0
Lfe0318:
	jsr	($00fd9004)
	jsr	($00fd8ee0)
	tst.w	(a4)
	beq.s	Lfe032e
	move.b	#$65,d0
	bra.s	Lfe0332
Lfe032e:
	move.b	#$64,d0
Lfe0332:
	jsr	($00fd9004)
	jsr	($00fd8ee0)
	move.l	($0002,a4),d1
	jsr	($00fd8f4a)
	move.b	#$28,d0
	jsr	($00fd9004)
	move.b	#$73,d0
	move.w	($0006,a4),d1
	beq.s	Lfe0368
	move.b	#$77,d0
	subq.w	#1,d1
	beq.s	Lfe0368
	move.b	#$6c,d0
Lfe0368:
	jsr	($00fd9004)
	jsr	($00fd8ee0)
	move.w	($0008,a4),d0
	add.w	#$0030,d0
	jsr	($00fd9004)
	jsr	($00fd8ee0)
	move.l	($000a,a4),d1
	jsr	($00fd8f4a)
	move.b	#$29,d0
	jsr	($00fd9004)
	jsr	($00fd8eda)
	move.b	#$3b,d0
	jsr	($00fd9004)
	move.l	($0002,a4),d1
	jsr	($00fd8f4a)
	move.l	($0002,a4),d0
	jsr	(Lfe0956)
	tst.l	d0
	bmi.s	Lfe03d6
	movea.l	d0,a0
	move.b	#$2e,d0
	jsr	($00fd9004)
	jsr	($00fd9014)
Lfe03d6:
	move.b	#$28,d0
	jsr	($00fd9004)
	movea.l	($0002,a4),a0
	move.w	($0006,a4),($0326,a6)
	addq.w	#1,($0326,a6)
	jsr	($00fd9602)
	move.b	#$29,d0
	jsr	($00fd9004)
	jsr	($00fd8ece)
Lfe0404:
	lea.l	($000e,a4),a4
	addq.w	#1,($001e,a6)
	cmpi.w	#$000a,($001e,a6)
	bne.w	Lfe02fc
	tst.w	(Lfe042c)
	bne.s	Lfe042a
	lea.l	(Lfe0598),a0
	jsr	($00fd9014)
Lfe042a:
	rts

Lfe042c:
	.dc.w	$0000
Lfe042e:
	moveq.l	#$ff,d1
	jsr	(Lfe0444)
	rts

Lfe0438:
	moveq.l	#$ff,d1
	bra.w	Lfe04e4
Lfe043e:
	moveq.l	#$01,d1
	bra.s	Lfe0444
Lfe0442:
	moveq.l	#$00,d1
Lfe0444:
	clr.w	($0000.w,a6)
Lfe0448:
	jsr	(Lfe07c6)
	tst.b	d0
	beq.s	Lfe04a4
	cmp.b	#$3a,d0
	beq.s	Lfe04a4
	cmp.b	#$2a,d0
	beq.w	Lfe04e2
	cmp.b	#$2c,d0
	bne.s	Lfe0478
	addq.l	#1,a5
	tst.w	($0000.w,a6)
	beq.w	Lfe04fc
	move.w	#$0001,($07fe,a6)
	bra.s	Lfe0448
Lfe0478:
	clr.w	($07fe,a6)
	move.w	d1,-(a7)
	jsr	($00fdeaa4)
	bcs.w	Lfe054c
	move.w	(a7)+,d1
	move.w	($0000.w,a6),d0
	lsl.w	#2,d0
	move.l	d6,($02,a6,d0.w)
	addq.w	#1,($0000.w,a6)
	cmpi.w	#$0008,($0000.w,a6)
	bcs.s	Lfe0448
	bra.w	Lfe04a4
Lfe04a4:
	tst.w	($07fe,a6)
	bne.s	Lfe04fc
	tst.w	($0000.w,a6)
	beq.w	Lfe053c
	lea.l	($05a4,a6),a4
	lea.l	($0002,a6),a3
Lfe04ba:
	move.l	(a3)+,d0
	cmp.l	#$0000000a,d0
	bcc.w	Lfe054c
	mulu.w	#$000e,d0
	tst.w	(a4,d0.w)
	bmi.s	Lfe04d4
	move.w	d1,(a4,d0.w)
Lfe04d4:
	subq.w	#1,($0000.w,a6)
	bne.s	Lfe04ba
	rts

Lfe04dc:
	move.w	#$ffff,d1
	bra.s	Lfe04e4
Lfe04e2:
	addq.l	#1,a5
Lfe04e4:
	move.w	#$0009,d0
	lea.l	($05a4,a6),a4
Lfe04ec:
	tst.w	(a4)
	bmi.s	Lfe04f2
	move.w	d1,(a4)
Lfe04f2:
	lea.l	($000e,a4),a4
	dbra.w	d0,Lfe04ec
	rts

Lfe04fc:
	clr.w	($07fe,a6)
	bra.w	Lfe0000-$00023c
Lfe0504:
	clr.l	d0
	lea.l	($05a4,a6),a4
Lfe050a:
	tst.w	(a4)
	bmi.s	Lfe0520
	lea.l	($000e,a4),a4
	addq.l	#1,d0
	cmp.w	#$000a,d0
	bne.s	Lfe050a
	ori.b	#$01,ccr
	rts

Lfe0520:
	andi.b	#$7e,ccr
	rts

Lfe0526:
	moveq.l	#$04,d1
	lea.l	($0002,a6),a0
Lfe052c:
	move.l	(a0),d2
	move.l	d0,(a0)+
	move.l	d2,d0
	dbra.w	d1,Lfe052c
	addq.w	#1,($0000.w,a6)
	rts

Lfe053c:
	lea.l	(Lfe05b2),a0
	bra.s	Lfe0552
Lfe0544:
	lea.l	(Lfe057c),a0
	bra.s	Lfe0552
Lfe054c:
	lea.l	(Lfe055e),a0
Lfe0552:
	jsr	($00fd9014)
	jmp	($00fd3a9a)

Lfe055e:
	.dc.b	'Bad checkpoint number (0-9)',$0d,$0a,$00
Lfe057c:
	.dc.b	'memory check pointer over',$0d,$0a,$00
Lfe0598:
	.dc.b	'no memory check pointer',$0d,$0a,$00
Lfe05b2:
	.dc.b	'Checkpoint list or ',$27,'*',$27,' expected',$0d,$0a,$00
Lfe05d4:
	move.w	#$0001,($01d4,a6)
	move.w	#$0001,($01d2,a6)
	move.b	(a5)+,d0
	jsr	(Lfe08ec)
	cmpi.b	#$4e,d0
	bne.s	Lfe05fa
	clr.w	($01d4,a6)
	move.b	(a5)+,d0
	jsr	(Lfe08ec)
Lfe05fa:
	cmpi.b	#$53,d0
	bne.s	Lfe0606
	clr.w	($01d2,a6)
	bra.s	Lfe062a
Lfe0606:
	cmpi.b	#$57,d0
	beq.s	Lfe062a
	cmpi.b	#$4c,d0
	bne.s	Lfe061a
	move.w	#$0002,($01d2,a6)
	bra.s	Lfe062a
Lfe061a:
	cmpi.b	#$50,d0
	bne.s	Lfe0628
	move.w	#$0003,($01d2,a6)
	bra.s	Lfe062a
Lfe0628:
	move.b	-(a5),d0
Lfe062a:
	jsr	(Lfe07c6)
	tst.b	d0
	beq.s	Lfe066e
	cmp.b	#$3a,d0
	beq.s	Lfe066e
	jsr	($00fdeaa4)
	bcs.s	Lfe0668
	move.l	d6,($002e,a6)
	jsr	(Lfe07c6)
	tst.b	d0
	beq.s	Lfe066e
	cmp.b	#$3a,d0
	beq.s	Lfe066e
	jsr	($00fdfec2)
	tst.w	d7
	beq.s	Lfe066e
	jsr	(Lfe0790)
	rts

Lfe0668:
	jmp	($00fd4056)

Lfe066e:
	move.l	a5,-(a7)
	tst.w	($01d2,a6)
	beq.s	Lfe068a
	cmpi.w	#$0003,($01d2,a6)
	beq.s	Lfe068a
	move.l	($002e,a6),d0
	bclr.l	#$00,d0
	move.l	d0,($002e,a6)
Lfe068a:
	move.l	($002e,a6),d1
	jsr	($00fd8f4a)
	jsr	($00fd8eda)
	tst.w	($01d4,a6)
	beq.s	Lfe06d8
	movea.l	($002e,a6),a2
	cmpi.w	#$0003,($01d2,a6)
	beq.s	Lfe06b6
	cmpi.w	#$0001,($01d2,a6)
	bhi.s	Lfe06ca
	beq.s	Lfe06c0
Lfe06b6:
	move.b	(a2),d1
	jsr	($00fd8f64)
	bra.s	Lfe06d2
Lfe06c0:
	move.w	(a2),d1
	jsr	($00fd8f50)
	bra.s	Lfe06d2
Lfe06ca:
	move.l	(a2),d1
	jsr	($00fd8f4a)
Lfe06d2:
	jsr	($00fd8ee0)
Lfe06d8:
	jsr	($00fd8d96)
	jsr	(Lfe07d8)
	cmpi.b	#$3b,d0
	beq.s	Lfe0714
	tst.b	d0
	beq.s	Lfe0754
	cmp.b	#$5e,d0
	beq.s	Lfe0772
	cmpi.b	#$2d,d0
	bne.s	Lfe0706
	jsr	(Lfe07c6)
	tst.b	d0
	beq.s	Lfe0772
	bra.s	Lfe071e
Lfe0706:
	cmpi.b	#$2e,d0
	bne.s	Lfe071e
	jsr	(Lfe07c6)
	bne.s	Lfe071e
Lfe0714:
	jsr	($00fd8ece)
	movea.l	(a7)+,a5
	rts

Lfe071e:
	lea.l	($045c,a6),a5
	jsr	($00fdeaa4)
	bcc.s	Lfe0734
	jsr	($00fd43c8)
	bra.w	Lfe068a
Lfe0734:
	movea.l	($002e,a6),a2
	cmpi.w	#$0003,($01d2,a6)
	beq.s	Lfe074a
	cmpi.w	#$0001,($01d2,a6)
	bhi.s	Lfe0752
	beq.s	Lfe074e
Lfe074a:
	move.b	d6,(a2)+
	bra.s	Lfe0754
Lfe074e:
	move.w	d6,(a2)+
	bra.s	Lfe0754
Lfe0752:
	move.l	d6,(a2)+
Lfe0754:
	clr.l	d0
	move.w	($01d2,a6),d0
	cmpi.w	#$0003,d0
	bne.s	Lfe0764
	moveq.l	#$02,d0
	bra.s	Lfe076a
Lfe0764:
	add.w	d0,d0
	bne.s	Lfe076a
	moveq.l	#$01,d0
Lfe076a:
	add.l	d0,($002e,a6)
	bra.w	Lfe068a
Lfe0772:
	clr.l	d0
	move.w	($01d2,a6),d0
	cmpi.w	#$0003,d0
	bne.s	Lfe0782
	moveq.l	#$02,d0
	bra.s	Lfe0788
Lfe0782:
	add.w	d0,d0
	bne.s	Lfe0788
	moveq.l	#$01,d0
Lfe0788:
	sub.l	d0,($002e,a6)
	bra.w	Lfe068a
Lfe0790:
	lea.l	($045c,a6),a1
	movea.l	($002e,a6),a0
	tst.w	($01d2,a6)
	beq.s	Lfe07b2
	cmpi.w	#$0003,($01d2,a6)
	beq.s	Lfe07bc
	lsr.w	#1,d7
	subq.w	#1,d7
Lfe07aa:
	move.w	(a1)+,(a0)+
	dbra.w	d7,Lfe07aa
	rts

Lfe07b2:
	subq.w	#1,d7
Lfe07b4:
	move.b	(a1)+,(a0)+
	dbra.w	d7,Lfe07b4
	rts

Lfe07bc:
	subq.w	#1,d7
Lfe07be:
	move.b	(a1)+,(a0)+
	addq.l	#1,a0
	dbra.w	d7,Lfe07be
Lfe07c6:
	move.b	(a5)+,d0
	cmpi.b	#$20,d0
	beq.s	Lfe07c6
	cmpi.b	#$09,d0
	beq.s	Lfe07c6
	move.b	-(a5),d0
	rts

Lfe07d8:
	move.b	(a5)+,d0
	cmpi.b	#$20,d0
	beq.s	Lfe07d8
	cmpi.b	#$09,d0
	beq.s	Lfe07d8
	rts

Lfe07e8:
	jsr	(Lfe08ec)
	cmpi.b	#$30,d0
	bcs.s	Lfe0814
	cmpi.b	#$3a,d0
	bcs.s	Lfe0810
	cmpi.b	#$41,d0
	bcs.s	Lfe0814
	cmpi.b	#$47,d0
	bcs.s	Lfe0810
	cmpi.b	#$61,d0
	bcs.s	Lfe0814
	cmpi.b	#$67,d0
Lfe0810:
	eori.b	#$01,ccr
Lfe0814:
	rts

Lfe0816:
	cmpi.b	#$39,d0
	bhi.s	Lfe0822
	cmpi.b	#$30,d0
	rts

Lfe0822:
	ori.b	#$01,ccr
	rts

Lfe0828:
	cmpi.b	#$20,d0
	bcs.s	Lfe0836
	cmpi.b	#$7f,d0
	eori.b	#$01,ccr
Lfe0836:
	rts

Lfe0838:
	cmpi.b	#$30,d0
	bcs.s	Lfe086c
	cmpi.b	#$3a,d0
	bcs.s	Lfe0868
	cmpi.b	#$3f,d0
	bls.s	Lfe086c
	cmpi.b	#$40,d0
	beq.s	Lfe086c
	cmpi.b	#$5a,d0
	bcs.s	Lfe0868
	cmp.b	#$5f,d0
	beq.s	Lfe0868
	bcs.s	Lfe086c
	cmp.b	#$60,d0
	beq.s	Lfe086c
	cmp.b	#$7a,d0
Lfe0868:
	eori.b	#$01,ccr
Lfe086c:
	rts

Lfe086e:
	move.b	(a0),d0
	beq.s	Lfe08ce
	cmp.b	#$2e,d0
	beq.s	Lfe08ae
Lfe0878:
	move.b	(a0),d0
	cmp.b	#$30,d0
	bcs.s	Lfe08ce
	cmp.b	#$3a,d0
	bcs.s	Lfe08ae
	cmp.b	#$3f,d0
	bcs.s	Lfe08ce
	cmp.b	#$80,d0
	bcc.s	Lfe08b4
	cmp.b	#$5b,d0
	bcs.s	Lfe08ae
	beq.s	Lfe08ce
	cmp.b	#$5d,d0
	beq.s	Lfe08ce
	cmp.b	#$7b,d0
	bcs.s	Lfe08ae
	beq.s	Lfe08ce
	cmp.b	#$7d,d0
	bls.s	Lfe08ce
Lfe08ae:
	addq.l	#1,a0
	move.b	d0,(a1)+
	bra.s	Lfe0878
Lfe08b4:
	cmp.b	#$e0,d0
	bcc.s	Lfe08c0
	cmp.b	#$a0,d0
	bcc.s	Lfe08ae
Lfe08c0:
	addq.l	#1,a0
	move.b	d0,(a1)+
	move.b	(a0),d0
	cmp.b	#$20,d0
	bcc.s	Lfe08ae
	subq.l	#1,a1
Lfe08ce:
	clr.b	(a1)
	rts

Lfe08d2:
	move.l	a5,-(a7)
Lfe08d4:
	move.b	(a0),d0
	beq.s	Lfe08e8
	move.b	(a5)+,d0
	jsr	(Lfe08ec)
	cmp.b	(a0)+,d0
	beq.s	Lfe08d4
	movea.l	(a7)+,a5
	rts

Lfe08e8:
	addq.l	#4,a7
	rts

Lfe08ec:
	cmpi.b	#$61,d0
	bcs.s	Lfe08fc
	cmpi.b	#$7a,d0
	bhi.s	Lfe08fc
	andi.b	#$df,d0
Lfe08fc:
	rts

Lfe08fe:
	jsr	(Lfe07c6)
	tst.b	d0
	beq.s	Lfe090e
	cmpi.b	#$3a,d0
	bne.s	Lfe0910
Lfe090e:
	rts

Lfe0910:
	jmp	($00fd4036)

Lfe0916:
	rts

Lfe0918:
	rts

Lfe091a:
	movem.l	a0-a3,-(a7)
	movea.l	a0,a2
	move.l	($030c,a6),d0
	beq.s	Lfe0952
	movea.l	d0,a3
Lfe0928:
	move.l	(a3)+,d0
	beq.s	Lfe0952
	movea.l	d0,a1
	addq.l	#6,a1
	movea.l	a2,a0
Lfe0932:
	move.b	(a0)+,d0
	beq.s	Lfe093c
	cmp.b	(a1)+,d0
	beq.s	Lfe0932
	bra.s	Lfe0928
Lfe093c:
	tst.b	(a1)
	bne.s	Lfe0928
	move.l	(-$0004,a3),d0
	movea.l	d0,a0
	move.l	($0002,a0),d0
	moveq.l	#$00,d1
Lfe094c:
	movem.l	(a7)+,a0-a3
	rts

Lfe0952:
	moveq.l	#$ff,d1
	bra.s	Lfe094c
Lfe0956:
	movem.l	d1/a0-a1,-(a7)
	move.l	($030c,a6),d1
	beq.s	Lfe0978
	movea.l	d1,a1
Lfe0962:
	move.l	(a1)+,d1
	beq.s	Lfe0978
	movea.l	d1,a0
	cmp.l	($0002,a0),d0
	bne.s	Lfe0962
	move.l	a0,d0
	addq.l	#6,d0
Lfe0972:
	movem.l	(a7)+,d1/a0-a1
	rts

Lfe0978:
	moveq.l	#$ff,d0
	bra.s	Lfe0972
Lfe097c:
	moveq.l	#$00,d0
	tst.b	($0cbc)
	sne.b	d0
	and.b	#$14,d0
	rts

Lfe098a:
	moveq.l	#$00,d0
	tst.b	($0cbd)
	sne.b	d0
	ext.w	d0
	ext.l	d0
	rts

Lfe0998:
	moveq.l	#$00,d0
	tst.b	($0cbe)
	sne.b	d0
	ext.w	d0
	ext.l	d0
	rts

Lfe09a6:
	lea.l	(Lfe3d2c),a0
	bsr.w	Lfe16d0
	adda.l	#$00000008,a1
	move.l	#$000000f4,d0
	bsr.s	Lfe09f2
	rts

Lfe09c0:
	lea.l	(Lfe3d2c),a0
	bsr.w	Lfe16d0
	adda.l	#$00000008,a1
	move.l	#$00000074.l,d0
	bsr.s	Lfe09f2
	lea.l	(Lfe3db4),a0
	bsr.w	Lfe16d0
	adda.l	#$00000090,a1
	move.l	#$0000006c.l,d0
	bsr.s	Lfe09f2
	rts

Lfe09f2:
	move.l	(a0)+,-(a7)
	beq.s	Lfe09fe
	move.l	(a7)+,(a1)+
	subq.l	#4,d0
	bpl.s	Lfe09f2
	rts

Lfe09fe:
	addq.l	#4,a7
	addq.l	#4,a1
	subq.l	#4,d0
	bpl.s	Lfe09f2
	rts

Lfe0a08:
	move.l	a0,($00001694).l
	tst.w	($00001690).l
	beq.w	Lfe17e4
	movec.l	sfc,a0
	move.l	a0,($000016a0).l
	movec.l	dfc,a0
	move.l	a0,($000016a4).l
	movec.l	vbr,a0
	move.l	a0,($000016b0).l
	movec.l	caar,a0
	move.l	a0,($000016ac).l
	movea.l	($00001694).l,a0
	rts

Lfe0a48:
	.dc.b	$46,$fc,$27,$00,$23,$cf,$00,$00
	.dc.b	$2a,$30,$23,$c8,$00,$00,$16,$94
	.dc.b	$4e,$7a,$80,$02,$23,$c8,$00,$00
	.dc.b	$2a,$3c,$20,$7c,$00,$00,$08,$08
	.dc.b	$4e,$7b,$80,$02,$4e,$7a,$88,$03
	.dc.b	$23,$c8,$00,$00,$2a,$34,$4e,$7a
	.dc.b	$88,$04,$23,$c8,$00,$00,$2a,$38
	.dc.b	$20,$79,$00,$00,$16,$94,$4f,$f9
	.dc.b	$00,$00,$2e,$0e,$46,$fc,$20,$00
	.dc.b	$61,$00,$0c,$98,$62,$75,$73,$20
	.dc.b	$65,$72,$72,$6f,$72,$00,$46,$fc
	.dc.b	$27,$00,$23,$cf,$00,$00,$2a,$30
	.dc.b	$23,$c8,$00,$00,$16,$94,$4e,$7a
	.dc.b	$80,$02,$23,$c8,$00,$00,$2a,$3c
	.dc.b	$20,$7c,$00,$00,$08,$08,$4e,$7b
	.dc.b	$80,$02,$4e,$7a,$88,$03,$23,$c8
	.dc.b	$00,$00,$2a,$34,$4e,$7a,$88,$04
	.dc.b	$23,$c8,$00,$00,$2a,$38,$20,$79
	.dc.b	$00,$00,$16,$94,$4f,$f9,$00,$00
	.dc.b	$2e,$0e,$46,$fc,$20,$00,$61,$00
	.dc.b	$0c,$42,$61,$64,$64,$72,$65,$73
	.dc.b	$73,$20,$65,$72,$72,$6f,$72,$00
	.dc.b	$46,$fc,$27,$00,$23,$cf,$00,$00
	.dc.b	$2a,$30,$23,$c8,$00,$00,$16,$94
	.dc.b	$4e,$7a,$80,$02,$23,$c8,$00,$00
	.dc.b	$2a,$3c,$20,$7c,$00,$00,$08,$08
	.dc.b	$4e,$7b,$80,$02,$4e,$7a,$88,$03
	.dc.b	$23,$c8,$00,$00,$2a,$34,$4e,$7a
	.dc.b	$88,$04,$23,$c8,$00,$00,$2a,$38
	.dc.b	$20,$79,$00,$00,$16,$94,$4f,$f9
	.dc.b	$00,$00,$2e,$0e,$46,$fc,$20,$00
	.dc.b	$61,$00,$0b,$e8,$75,$6e,$64,$65
	.dc.b	$66,$69,$6e,$65,$64,$20,$69,$6e
	.dc.b	$73,$74,$72,$75,$63,$74,$69,$6f
	.dc.b	$6e,$00,$46,$fc,$27,$00,$23,$cf
	.dc.b	$00,$00,$2a,$30,$23,$c8,$00,$00
	.dc.b	$16,$94,$4e,$7a,$80,$02,$23,$c8
	.dc.b	$00,$00,$2a,$3c,$20,$7c,$00,$00
	.dc.b	$08,$08,$4e,$7b,$80,$02,$4e,$7a
	.dc.b	$88,$03,$23,$c8,$00,$00,$2a,$34
	.dc.b	$4e,$7a,$88,$04,$23,$c8,$00,$00
	.dc.b	$2a,$38,$20,$79,$00,$00,$16,$94
	.dc.b	$4f,$f9,$00,$00,$2e,$0e,$46,$fc
	.dc.b	$20,$00,$61,$00,$0b,$86,$7a,$65
	.dc.b	$72,$6f,$20,$64,$69,$76,$69,$64
	.dc.b	$65,$00,$46,$fc,$27,$00,$23,$cf
	.dc.b	$00,$00,$2a,$30,$23,$c8,$00,$00
	.dc.b	$16,$94,$4e,$7a,$80,$02,$23,$c8
	.dc.b	$00,$00,$2a,$3c,$20,$7c,$00,$00
	.dc.b	$08,$08,$4e,$7b,$80,$02,$4e,$7a
	.dc.b	$88,$03,$23,$c8,$00,$00,$2a,$34
	.dc.b	$4e,$7a,$88,$04,$23,$c8,$00,$00
	.dc.b	$2a,$38,$20,$79,$00,$00,$16,$94
	.dc.b	$4f,$f9,$00,$00,$2e,$0e,$46,$fc
	.dc.b	$20,$00,$61,$00,$0b,$2e,$43,$48
	.dc.b	$4b,$2c,$20,$43,$48,$4b,$32,$20
	.dc.b	$69,$6e,$73,$74,$72,$75,$63,$74
	.dc.b	$69,$6f,$6e,$73,$00,$00,$46,$fc
	.dc.b	$27,$00,$23,$cf,$00,$00,$2a,$30
	.dc.b	$23,$c8,$00,$00,$16,$94,$4e,$7a
	.dc.b	$80,$02,$23,$c8,$00,$00,$2a,$3c
	.dc.b	$20,$7c,$00,$00,$08,$08,$4e,$7b
	.dc.b	$80,$02,$4e,$7a,$88,$03,$23,$c8
	.dc.b	$00,$00,$2a,$34,$4e,$7a,$88,$04
	.dc.b	$23,$c8,$00,$00,$2a,$38,$20,$79
	.dc.b	$00,$00,$16,$94,$4f,$f9,$00,$00
	.dc.b	$2e,$0e,$46,$fc,$20,$00,$61,$00
	.dc.b	$0a,$ca,$63,$70,$54,$52,$41,$50
	.dc.b	$63,$63,$2c,$20,$54,$52,$41,$50
	.dc.b	$63,$63,$2c,$20,$54,$52,$41,$50
	.dc.b	$56,$20,$69,$6e,$73,$74,$72,$75
	.dc.b	$63,$74,$69,$6f,$6e,$73,$00,$00
	.dc.b	$46,$fc,$27,$00,$23,$cf,$00,$00
	.dc.b	$2a,$30,$23,$c8,$00,$00,$16,$94
	.dc.b	$4e,$7a,$80,$02,$23,$c8,$00,$00
	.dc.b	$2a,$3c,$20,$7c,$00,$00,$08,$08
	.dc.b	$4e,$7b,$80,$02,$4e,$7a,$88,$03
	.dc.b	$23,$c8,$00,$00,$2a,$34,$4e,$7a
	.dc.b	$88,$04,$23,$c8,$00,$00,$2a,$38
	.dc.b	$20,$79,$00,$00,$16,$94,$4f,$f9
	.dc.b	$00,$00,$2e,$0e,$46,$fc,$20,$00
	.dc.b	$61,$00,$0a,$58,$70,$72,$69,$76
	.dc.b	$69,$6c,$65,$67,$65,$20,$76,$69
	.dc.b	$6f,$6c,$61,$74,$69,$6f,$6e,$00
	.dc.b	$46,$fc,$27,$00,$23,$cf,$00,$00
	.dc.b	$2a,$30,$23,$c8,$00,$00,$16,$94
	.dc.b	$4e,$7a,$80,$02,$23,$c8,$00,$00
	.dc.b	$2a,$3c,$20,$7c,$00,$00,$08,$08
	.dc.b	$4e,$7b,$80,$02,$4e,$7a,$88,$03
	.dc.b	$23,$c8,$00,$00,$2a,$34,$4e,$7a
	.dc.b	$88,$04,$23,$c8,$00,$00,$2a,$38
	.dc.b	$20,$79,$00,$00,$16,$94,$4f,$f9
	.dc.b	$00,$00,$2e,$0e,$46,$fc,$20,$00
	.dc.b	$61,$00,$09,$f8,$74,$72,$61,$63
	.dc.b	$65,$00,$46,$fc,$27,$00,$23,$cf
	.dc.b	$00,$00,$2a,$30,$23,$c8,$00,$00
	.dc.b	$16,$94,$4e,$7a,$80,$02,$23,$c8
	.dc.b	$00,$00,$2a,$3c,$20,$7c,$00,$00
	.dc.b	$08,$08,$4e,$7b,$80,$02,$4e,$7a
	.dc.b	$88,$03,$23,$c8,$00,$00,$2a,$34
	.dc.b	$4e,$7a,$88,$04,$23,$c8,$00,$00
	.dc.b	$2a,$38,$20,$79,$00,$00,$16,$94
	.dc.b	$4f,$f9,$00,$00,$2e,$0e,$46,$fc
	.dc.b	$20,$00,$61,$00,$09,$a6,$6c,$69
	.dc.b	$6e,$65,$20,$31,$30,$31,$30,$20
	.dc.b	$65,$6d,$75,$6c,$61,$74,$6f,$72
	.dc.b	$00,$00,$46,$fc,$27,$00,$23,$cf
	.dc.b	$00,$00,$2a,$30,$23,$c8,$00,$00
	.dc.b	$16,$94,$4e,$7a,$80,$02,$23,$c8
	.dc.b	$00,$00,$2a,$3c,$20,$7c,$00,$00
	.dc.b	$08,$08,$4e,$7b,$80,$02,$4e,$7a
	.dc.b	$88,$03,$23,$c8,$00,$00,$2a,$34
	.dc.b	$4e,$7a,$88,$04,$23,$c8,$00,$00
	.dc.b	$2a,$38,$20,$79,$00,$00,$16,$94
	.dc.b	$4f,$f9,$00,$00,$2e,$0e,$46,$fc
	.dc.b	$20,$00,$61,$00,$09,$46,$6c,$69
	.dc.b	$6e,$65,$20,$31,$31,$31,$31,$20
	.dc.b	$65,$6d,$75,$6c,$61,$74,$6f,$72
	.dc.b	$00,$00,$46,$fc,$27,$00,$23,$cf
	.dc.b	$00,$00,$2a,$30,$23,$c8,$00,$00
	.dc.b	$16,$94,$4e,$7a,$80,$02,$23,$c8
	.dc.b	$00,$00,$2a,$3c,$20,$7c,$00,$00
	.dc.b	$08,$08,$4e,$7b,$80,$02,$4e,$7a
	.dc.b	$88,$03,$23,$c8,$00,$00,$2a,$34
	.dc.b	$4e,$7a,$88,$04,$23,$c8,$00,$00
	.dc.b	$2a,$38,$20,$79,$00,$00,$16,$94
	.dc.b	$4f,$f9,$00,$00,$2e,$0e,$46,$fc
	.dc.b	$20,$00,$61,$00,$08,$e6,$75,$6e
	.dc.b	$61,$73,$73,$69,$67,$6e,$65,$64
	.dc.b	$2c,$20,$72,$65,$73,$65,$72,$76
	.dc.b	$65,$64,$00,$00,$46,$fc,$27,$00
	.dc.b	$23,$cf,$00,$00,$2a,$30,$23,$c8
	.dc.b	$00,$00,$16,$94,$4e,$7a,$80,$02
	.dc.b	$23,$c8,$00,$00,$2a,$3c,$20,$7c
	.dc.b	$00,$00,$08,$08,$4e,$7b,$80,$02
	.dc.b	$4e,$7a,$88,$03,$23,$c8,$00,$00
	.dc.b	$2a,$34,$4e,$7a,$88,$04,$23,$c8
	.dc.b	$00,$00,$2a,$38,$20,$79,$00,$00
	.dc.b	$16,$94,$4f,$f9,$00,$00,$2e,$0e
	.dc.b	$46,$fc,$20,$00,$61,$00,$08,$84
	.dc.b	$63,$6f,$70,$72,$6f,$63,$65,$73
	.dc.b	$73,$6f,$72,$20,$70,$72,$6f,$74
	.dc.b	$6f,$63,$6f,$6c,$20,$76,$69,$6f
	.dc.b	$6c,$61,$74,$69,$6f,$6e,$00,$00
	.dc.b	$46,$fc,$27,$00,$23,$cf,$00,$00
	.dc.b	$2a,$30,$23,$c8,$00,$00,$16,$94
	.dc.b	$4e,$7a,$80,$02,$23,$c8,$00,$00
	.dc.b	$2a,$3c,$20,$7c,$00,$00,$08,$08
	.dc.b	$4e,$7b,$80,$02,$4e,$7a,$88,$03
	.dc.b	$23,$c8,$00,$00,$2a,$34,$4e,$7a
	.dc.b	$88,$04,$23,$c8,$00,$00,$2a,$38
	.dc.b	$20,$79,$00,$00,$16,$94,$4f,$f9
	.dc.b	$00,$00,$2e,$0e,$46,$fc,$20,$00
	.dc.b	$61,$00,$08,$18,$66,$6f,$72,$6d
	.dc.b	$61,$74,$20,$65,$72,$72,$6f,$72
	.dc.b	$00,$00,$46,$fc,$27,$00,$23,$cf
	.dc.b	$00,$00,$2a,$30,$23,$c8,$00,$00
	.dc.b	$16,$94,$4e,$7a,$80,$02,$23,$c8
	.dc.b	$00,$00,$2a,$3c,$20,$7c,$00,$00
	.dc.b	$08,$08,$4e,$7b,$80,$02,$4e,$7a
	.dc.b	$88,$03,$23,$c8,$00,$00,$2a,$34
	.dc.b	$4e,$7a,$88,$04,$23,$c8,$00,$00
	.dc.b	$2a,$38,$20,$79,$00,$00,$16,$94
	.dc.b	$4f,$f9,$00,$00,$2e,$0e,$46,$fc
	.dc.b	$20,$00,$61,$00,$07,$be,$75,$6e
	.dc.b	$69,$6e,$69,$74,$69,$61,$6c,$69
	.dc.b	$7a,$65,$64,$20,$69,$6e,$74,$65
	.dc.b	$72,$72,$75,$70,$74,$20,$76,$65
	.dc.b	$63,$74,$6f,$72,$00,$00,$46,$fc
	.dc.b	$27,$00,$23,$cf,$00,$00,$2a,$30
	.dc.b	$23,$c8,$00,$00,$16,$94,$4e,$7a
	.dc.b	$80,$02,$23,$c8,$00,$00,$2a,$3c
	.dc.b	$20,$7c,$00,$00,$08,$08,$4e,$7b
	.dc.b	$80,$02,$4e,$7a,$88,$03,$23,$c8
	.dc.b	$00,$00,$2a,$34,$4e,$7a,$88,$04
	.dc.b	$23,$c8,$00,$00,$2a,$38,$20,$79
	.dc.b	$00,$00,$16,$94,$4f,$f9,$00,$00
	.dc.b	$2e,$0e,$46,$fc,$20,$00,$61,$00
	.dc.b	$07,$52,$73,$70,$75,$72,$69,$6f
	.dc.b	$75,$73,$20,$69,$6e,$74,$65,$72
	.dc.b	$72,$75,$70,$74,$00,$00,$46,$fc
	.dc.b	$27,$00,$23,$cf,$00,$00,$2a,$30
	.dc.b	$23,$c8,$00,$00,$16,$94,$4e,$7a
	.dc.b	$80,$02,$23,$c8,$00,$00,$2a,$3c
	.dc.b	$20,$7c,$00,$00,$08,$08,$4e,$7b
	.dc.b	$80,$02,$4e,$7a,$88,$03,$23,$c8
	.dc.b	$00,$00,$2a,$34,$4e,$7a,$88,$04
	.dc.b	$23,$c8,$00,$00,$2a,$38,$20,$79
	.dc.b	$00,$00,$16,$94,$4f,$f9,$00,$00
	.dc.b	$2e,$0e,$46,$fc,$20,$00,$61,$00
	.dc.b	$06,$f2,$6c,$65,$76,$65,$6c,$20
	.dc.b	$31,$20,$61,$75,$74,$6f,$76,$65
	.dc.b	$63,$74,$6f,$72,$00,$00,$46,$fc
	.dc.b	$27,$00,$23,$cf,$00,$00,$2a,$30
	.dc.b	$23,$c8,$00,$00,$16,$94,$4e,$7a
	.dc.b	$80,$02,$23,$c8,$00,$00,$2a,$3c
	.dc.b	$20,$7c,$00,$00,$08,$08,$4e,$7b
	.dc.b	$80,$02,$4e,$7a,$88,$03,$23,$c8
	.dc.b	$00,$00,$2a,$34,$4e,$7a,$88,$04
	.dc.b	$23,$c8,$00,$00,$2a,$38,$20,$79
	.dc.b	$00,$00,$16,$94,$4f,$f9,$00,$00
	.dc.b	$2e,$0e,$46,$fc,$20,$00,$61,$00
	.dc.b	$06,$92,$6c,$65,$76,$65,$6c,$20
	.dc.b	$32,$20,$61,$75,$74,$6f,$76,$65
	.dc.b	$63,$74,$6f,$72,$00,$00,$46,$fc
	.dc.b	$27,$00,$23,$cf,$00,$00,$2a,$30
	.dc.b	$23,$c8,$00,$00,$16,$94,$4e,$7a
	.dc.b	$80,$02,$23,$c8,$00,$00,$2a,$3c
	.dc.b	$20,$7c,$00,$00,$08,$08,$4e,$7b
	.dc.b	$80,$02,$4e,$7a,$88,$03,$23,$c8
	.dc.b	$00,$00,$2a,$34,$4e,$7a,$88,$04
	.dc.b	$23,$c8,$00,$00,$2a,$38,$20,$79
	.dc.b	$00,$00,$16,$94,$4f,$f9,$00,$00
	.dc.b	$2e,$0e,$46,$fc,$20,$00,$61,$00
	.dc.b	$06,$32,$6c,$65,$76,$65,$6c,$20
	.dc.b	$33,$20,$61,$75,$74,$6f,$76,$65
	.dc.b	$63,$74,$6f,$72,$00,$00,$46,$fc
	.dc.b	$27,$00,$23,$cf,$00,$00,$2a,$30
	.dc.b	$23,$c8,$00,$00,$16,$94,$4e,$7a
	.dc.b	$80,$02,$23,$c8,$00,$00,$2a,$3c
	.dc.b	$20,$7c,$00,$00,$08,$08,$4e,$7b
	.dc.b	$80,$02,$4e,$7a,$88,$03,$23,$c8
	.dc.b	$00,$00,$2a,$34,$4e,$7a,$88,$04
	.dc.b	$23,$c8,$00,$00,$2a,$38,$20,$79
	.dc.b	$00,$00,$16,$94,$4f,$f9,$00,$00
	.dc.b	$2e,$0e,$46,$fc,$20,$00,$61,$00
	.dc.b	$05,$d2,$6c,$65,$76,$65,$6c,$20
	.dc.b	$34,$20,$61,$75,$74,$6f,$76,$65
	.dc.b	$63,$74,$6f,$72,$00,$00,$46,$fc
	.dc.b	$27,$00,$23,$cf,$00,$00,$2a,$30
	.dc.b	$23,$c8,$00,$00,$16,$94,$4e,$7a
	.dc.b	$80,$02,$23,$c8,$00,$00,$2a,$3c
	.dc.b	$20,$7c,$00,$00,$08,$08,$4e,$7b
	.dc.b	$80,$02,$4e,$7a,$88,$03,$23,$c8
	.dc.b	$00,$00,$2a,$34,$4e,$7a,$88,$04
	.dc.b	$23,$c8,$00,$00,$2a,$38,$20,$79
	.dc.b	$00,$00,$16,$94,$4f,$f9,$00,$00
	.dc.b	$2e,$0e,$46,$fc,$20,$00,$61,$00
	.dc.b	$05,$72,$6c,$65,$76,$65,$6c,$20
	.dc.b	$35,$20,$61,$75,$74,$6f,$76,$65
	.dc.b	$63,$74,$6f,$72,$00,$00,$46,$fc
	.dc.b	$27,$00,$23,$cf,$00,$00,$2a,$30
	.dc.b	$23,$c8,$00,$00,$16,$94,$4e,$7a
	.dc.b	$80,$02,$23,$c8,$00,$00,$2a,$3c
	.dc.b	$20,$7c,$00,$00,$08,$08,$4e,$7b
	.dc.b	$80,$02,$4e,$7a,$88,$03,$23,$c8
	.dc.b	$00,$00,$2a,$34,$4e,$7a,$88,$04
	.dc.b	$23,$c8,$00,$00,$2a,$38,$20,$79
	.dc.b	$00,$00,$16,$94,$4f,$f9,$00,$00
	.dc.b	$2e,$0e,$46,$fc,$20,$00,$61,$00
	.dc.b	$05,$12,$6c,$65,$76,$65,$6c,$20
	.dc.b	$36,$20,$61,$75,$74,$6f,$76,$65
	.dc.b	$63,$74,$6f,$72,$00,$00,$46,$fc
	.dc.b	$27,$00,$23,$cf,$00,$00,$2a,$30
	.dc.b	$23,$c8,$00,$00,$16,$94,$4e,$7a
	.dc.b	$80,$02,$23,$c8,$00,$00,$2a,$3c
	.dc.b	$20,$7c,$00,$00,$08,$08,$4e,$7b
	.dc.b	$80,$02,$4e,$7a,$88,$03,$23,$c8
	.dc.b	$00,$00,$2a,$34,$4e,$7a,$88,$04
	.dc.b	$23,$c8,$00,$00,$2a,$38,$20,$79
	.dc.b	$00,$00,$16,$94,$4f,$f9,$00,$00
	.dc.b	$2e,$0e,$46,$fc,$20,$00,$61,$00
	.dc.b	$04,$b2,$0d,$0a,$52,$4f,$4d,$20
	.dc.b	$4d,$4f,$4e,$49,$54,$4f,$52,$2c
	.dc.b	$20,$6c,$65,$76,$65,$6c,$20,$37
	.dc.b	$20,$69,$6e,$74,$65,$72,$72,$75
	.dc.b	$70,$74,$00,$00,$46,$fc,$27,$00
	.dc.b	$23,$cf,$00,$00,$2a,$30,$23,$c8
	.dc.b	$00,$00,$16,$94,$4e,$7a,$80,$02
	.dc.b	$23,$c8,$00,$00,$2a,$3c,$20,$7c
	.dc.b	$00,$00,$08,$08,$4e,$7b,$80,$02
	.dc.b	$4e,$7a,$88,$03,$23,$c8,$00,$00
	.dc.b	$2a,$34,$4e,$7a,$88,$04,$23,$c8
	.dc.b	$00,$00,$2a,$38,$20,$79,$00,$00
	.dc.b	$16,$94,$4f,$f9,$00,$00,$2e,$0e
	.dc.b	$46,$fc,$20,$00,$61,$00,$04,$44
	.dc.b	$74,$72,$61,$70,$20,$69,$6e,$73
	.dc.b	$74,$72,$75,$63,$74,$69,$6f,$6e
	.dc.b	$00,$00,$46,$fc,$27,$00,$23,$cf
	.dc.b	$00,$00,$2a,$30,$23,$c8,$00,$00
	.dc.b	$16,$94,$4e,$7a,$80,$02,$23,$c8
	.dc.b	$00,$00,$2a,$3c,$20,$7c,$00,$00
	.dc.b	$08,$08,$4e,$7b,$80,$02,$4e,$7a
	.dc.b	$88,$03,$23,$c8,$00,$00,$2a,$34
	.dc.b	$4e,$7a,$88,$04,$23,$c8,$00,$00
	.dc.b	$2a,$38,$20,$79,$00,$00,$16,$94
	.dc.b	$4f,$f9,$00,$00,$2e,$0e,$46,$fc
	.dc.b	$20,$00,$61,$00,$03,$e6,$46,$50
	.dc.b	$43,$50,$20,$62,$72,$61,$6e,$63
	.dc.b	$68,$20,$6f,$72,$20,$73,$65,$74
	.dc.b	$20,$6f,$6e,$20,$75,$6e,$6f,$72
	.dc.b	$64,$65,$72,$65,$64,$20,$63,$6f
	.dc.b	$6e,$64,$69,$74,$69,$6f,$6e,$00
	.dc.b	$46,$fc,$27,$00,$23,$cf,$00,$00
	.dc.b	$2a,$30,$23,$c8,$00,$00,$16,$94
	.dc.b	$4e,$7a,$80,$02,$23,$c8,$00,$00
	.dc.b	$2a,$3c,$20,$7c,$00,$00,$08,$08
	.dc.b	$4e,$7b,$80,$02,$4e,$7a,$88,$03
	.dc.b	$23,$c8,$00,$00,$2a,$34,$4e,$7a
	.dc.b	$88,$04,$23,$c8,$00,$00,$2a,$38
	.dc.b	$20,$79,$00,$00,$16,$94,$4f,$f9
	.dc.b	$00,$00,$2e,$0e,$46,$fc,$20,$00
	.dc.b	$61,$00,$03,$70,$46,$50,$43,$50
	.dc.b	$20,$69,$6e,$65,$78,$61,$63,$74
	.dc.b	$20,$72,$65,$73,$75,$6c,$74,$00
	.dc.b	$46,$fc,$27,$00,$23,$cf,$00,$00
	.dc.b	$2a,$30,$23,$c8,$00,$00,$16,$94
	.dc.b	$4e,$7a,$80,$02,$23,$c8,$00,$00
	.dc.b	$2a,$3c,$20,$7c,$00,$00,$08,$08
	.dc.b	$4e,$7b,$80,$02,$4e,$7a,$88,$03
	.dc.b	$23,$c8,$00,$00,$2a,$34,$4e,$7a
	.dc.b	$88,$04,$23,$c8,$00,$00,$2a,$38
	.dc.b	$20,$79,$00,$00,$16,$94,$4f,$f9
	.dc.b	$00,$00,$2e,$0e,$46,$fc,$20,$00
	.dc.b	$61,$00,$03,$10,$46,$50,$43,$50
	.dc.b	$20,$64,$69,$76,$69,$64,$65,$20
	.dc.b	$62,$79,$20,$7a,$65,$72,$6f,$00
	.dc.b	$46,$fc,$27,$00,$23,$cf,$00,$00
	.dc.b	$2a,$30,$23,$c8,$00,$00,$16,$94
	.dc.b	$4e,$7a,$80,$02,$23,$c8,$00,$00
	.dc.b	$2a,$3c,$20,$7c,$00,$00,$08,$08
	.dc.b	$4e,$7b,$80,$02,$4e,$7a,$88,$03
	.dc.b	$23,$c8,$00,$00,$2a,$34,$4e,$7a
	.dc.b	$88,$04,$23,$c8,$00,$00,$2a,$38
	.dc.b	$20,$79,$00,$00,$16,$94,$4f,$f9
	.dc.b	$00,$00,$2e,$0e,$46,$fc,$20,$00
	.dc.b	$61,$00,$02,$b0,$46,$50,$43,$50
	.dc.b	$20,$75,$6e,$64,$65,$72,$66,$6c
	.dc.b	$6f,$77,$00,$00,$46,$fc,$27,$00
	.dc.b	$23,$cf,$00,$00,$2a,$30,$23,$c8
	.dc.b	$00,$00,$16,$94,$4e,$7a,$80,$02
	.dc.b	$23,$c8,$00,$00,$2a,$3c,$20,$7c
	.dc.b	$00,$00,$08,$08,$4e,$7b,$80,$02
	.dc.b	$4e,$7a,$88,$03,$23,$c8,$00,$00
	.dc.b	$2a,$34,$4e,$7a,$88,$04,$23,$c8
	.dc.b	$00,$00,$2a,$38,$20,$79,$00,$00
	.dc.b	$16,$94,$4f,$f9,$00,$00,$2e,$0e
	.dc.b	$46,$fc,$20,$00,$61,$00,$02,$54
	.dc.b	$46,$50,$43,$50,$20,$6f,$70,$65
	.dc.b	$72,$61,$6e,$64,$20,$65,$72,$72
	.dc.b	$6f,$72,$00,$00,$46,$fc,$27,$00
	.dc.b	$23,$cf,$00,$00,$2a,$30,$23,$c8
	.dc.b	$00,$00,$16,$94,$4e,$7a,$80,$02
	.dc.b	$23,$c8,$00,$00,$2a,$3c,$20,$7c
	.dc.b	$00,$00,$08,$08,$4e,$7b,$80,$02
	.dc.b	$4e,$7a,$88,$03,$23,$c8,$00,$00
	.dc.b	$2a,$34,$4e,$7a,$88,$04,$23,$c8
	.dc.b	$00,$00,$2a,$38,$20,$79,$00,$00
	.dc.b	$16,$94,$4f,$f9,$00,$00,$2e,$0e
	.dc.b	$46,$fc,$20,$00,$61,$00,$01,$f4
	.dc.b	$46,$50,$43,$50,$20,$6f,$76,$65
	.dc.b	$72,$66,$6c,$6f,$77,$00,$46,$fc
	.dc.b	$27,$00,$23,$cf,$00,$00,$2a,$30
	.dc.b	$23,$c8,$00,$00,$16,$94,$4e,$7a
	.dc.b	$80,$02,$23,$c8,$00,$00,$2a,$3c
	.dc.b	$20,$7c,$00,$00,$08,$08,$4e,$7b
	.dc.b	$80,$02,$4e,$7a,$88,$03,$23,$c8
	.dc.b	$00,$00,$2a,$34,$4e,$7a,$88,$04
	.dc.b	$23,$c8,$00,$00,$2a,$38,$20,$79
	.dc.b	$00,$00,$16,$94,$4f,$f9,$00,$00
	.dc.b	$2e,$0e,$46,$fc,$20,$00,$61,$00
	.dc.b	$01,$9a,$46,$50,$43,$50,$20,$73
	.dc.b	$69,$67,$6e,$61,$6c,$69,$6e,$67
	.dc.b	$20,$4e,$41,$4e,$00,$00,$46,$fc
	.dc.b	$27,$00,$23,$cf,$00,$00,$2a,$30
	.dc.b	$23,$c8,$00,$00,$16,$94,$4e,$7a
	.dc.b	$80,$02,$23,$c8,$00,$00,$2a,$3c
	.dc.b	$20,$7c,$00,$00,$08,$08,$4e,$7b
	.dc.b	$80,$02,$4e,$7a,$88,$03,$23,$c8
	.dc.b	$00,$00,$2a,$34,$4e,$7a,$88,$04
	.dc.b	$23,$c8,$00,$00,$2a,$38,$20,$79
	.dc.b	$00,$00,$16,$94,$4f,$f9,$00,$00
	.dc.b	$2e,$0e,$46,$fc,$20,$00,$61,$00
	.dc.b	$01,$3a,$50,$4d,$4d,$55,$20,$63
	.dc.b	$6f,$6e,$66,$69,$67,$75,$72,$61
	.dc.b	$74,$69,$6f,$6e,$00,$00,$46,$fc
	.dc.b	$27,$00,$23,$cf,$00,$00,$2a,$30
	.dc.b	$23,$c8,$00,$00,$16,$94,$4e,$7a
	.dc.b	$80,$02,$23,$c8,$00,$00,$2a,$3c
	.dc.b	$20,$7c,$00,$00,$08,$08,$4e,$7b
	.dc.b	$80,$02,$4e,$7a,$88,$03,$23,$c8
	.dc.b	$00,$00,$2a,$34,$4e,$7a,$88,$04
	.dc.b	$23,$c8,$00,$00,$2a,$38,$20,$79
	.dc.b	$00,$00,$16,$94,$4f,$f9,$00,$00
	.dc.b	$2e,$0e,$46,$fc,$20,$00,$61,$00
	.dc.b	$00,$da,$50,$4d,$4d,$55,$20,$69
	.dc.b	$6c,$6c,$65,$67,$61,$6c,$20,$6f
	.dc.b	$70,$65,$72,$61,$74,$69,$6f,$6e
	.dc.b	$00,$00,$46,$fc,$27,$00,$23,$cf
	.dc.b	$00,$00,$2a,$30,$23,$c8,$00,$00
	.dc.b	$16,$94,$4e,$7a,$80,$02,$23,$c8
	.dc.b	$00,$00,$2a,$3c,$20,$7c,$00,$00
	.dc.b	$08,$08,$4e,$7b,$80,$02,$4e,$7a
	.dc.b	$88,$03,$23,$c8,$00,$00,$2a,$34
	.dc.b	$4e,$7a,$88,$04,$23,$c8,$00,$00
	.dc.b	$2a,$38,$20,$79,$00,$00,$16,$94
	.dc.b	$4f,$f9,$00,$00,$2e,$0e,$46,$fc
	.dc.b	$20,$00,$61,$76,$50,$4d,$4d,$55
	.dc.b	$20,$61,$63,$63,$65,$73,$73,$20
	.dc.b	$6c,$65,$76,$65,$6c,$20,$76,$69
	.dc.b	$6f,$6c,$61,$74,$69,$6f,$6e,$00
Lfe16d0:
	movec.l	vbr,a1
	cmpa.l	($06b0,a6),a1
	bne.s	Lfe16dc
	rts

Lfe16dc:
	move.l	a1,($06b0,a6)
	movem.l	d0-d7/a0/a2-a6,-(a7)
	lea.l	(Lfe16fa),a0
	jsr	($00fd9014)
	movea.l	($06b0,a6),a1
	movem.l	(a7)+,d0-d7/a0/a2-a6
	rts

Lfe16fa:
	.dc.b	$0d,$0a
	.dc.b	'Vector Base Register content is changed !!',$0d,$0a,$00,$00
Lfe172a:
	.dc.b	$61,$00,$f2,$dc,$48,$e7,$ff,$fe
	.dc.b	$4d,$f9,$00,$00,$10,$00,$4e,$b9
	.dc.b	$00,$fd,$e3,$a6,$4e,$b9,$00,$fd
	.dc.b	$3f,$62,$20,$79,$00,$00,$2a,$30
	.dc.b	$20,$68,$00,$02,$b1,$fc,$00,$fd
	.dc.b	$38,$00,$65,$48,$b1,$fc,$00,$fe
	.dc.b	$3e,$34,$64,$40,$4c,$df,$7f,$ff
	.dc.b	$4d,$f9,$00,$00,$10,$00,$4e,$b9
	.dc.b	$00,$fd,$8e,$ce,$4e,$b9,$00,$fd
	.dc.b	$8e,$ce,$20,$57,$4e,$b9,$00,$fd
	.dc.b	$90,$14,$41,$f9,$00,$fe,$3e,$24
	.dc.b	$4e,$b9,$00,$fd,$90,$14,$60,$00
	.dc.b	$04,$4a
Lfe178c:
	.dc.b	$2e,$79,$00,$00,$2a,$44,$23,$f9
	.dc.b	$00,$00,$2a,$48,$00,$00,$00,$34
	.dc.b	$60,$2e,$4c,$df,$7f,$ff,$48,$f9
	.dc.b	$7f,$ff,$00,$00,$10,$56,$4a,$79
	.dc.b	$00,$00,$16,$92,$67,$32,$23,$cf
	.dc.b	$00,$00,$2a,$44,$23,$f9,$00,$00
	.dc.b	$00,$34,$00,$00,$2a,$48,$23,$fc
	.dc.b	$00,$fe,$17,$8c,$00,$00,$00,$34
	.dc.b	$00,$00,$f3,$27,$f2,$39,$bc,$00
	.dc.b	$00,$00,$16,$b4,$f2,$39,$f0,$ff
	.dc.b	$00,$00,$28,$b0,$00,$00,$f3,$79
Lfe17e4:
	move.l	($00002a48).l,($00000034).l
	lea.l	($00001000).l,a6
	move.l	usp,a5
	move.l	a5,($009a,a6)
	move.l	($1a3c,a6),($06a8,a6)
	move.l	($1a30,a6),($00a2,a6)
	move.l	($1a30,a6),($0092,a6)
	move.l	($1a34,a6),($0698,a6)
	move.l	($1a38,a6),($069c,a6)
	movea.l	($0092,a6),a0
	move.w	(a0),($00a0,a6)
	move.l	($0002,a0),($0096,a6)
	lea.l	(Lfe3bca),a0
	jsr	($00fd9014)
	movea.l	($00002e0a).l,a0
	jsr	($00fd9014)
	jsr	($00fd8ece)
	movea.l	($0092,a6),a4
	move.w	($0006,a4),d0
	lsr.w	#8,d0
	lsr.w	#4,d0
	tst.w	d0
	beq.s	Lfe1888
	cmpi.w	#$0002,d0
	bcs.w	Lfe18e2
	beq.w	Lfe18f0
	cmpi.w	#$0009,d0
	beq.w	Lfe194a
	cmpi.w	#$000a,d0
	beq.w	Lfe19b0
	cmpi.w	#$000b,d0
	beq.w	Lfe1b4c
	lea.l	(Lfe3bac),a0
	jsr	($00fd9014)
	bra.w	Lfe1b2e
Lfe1888:
	addi.l	#$00000008,($0092,a6)
	lea.l	(Lfe3be0),a0
	jsr	($00fd9014)
	move.l	($0002,a4),d1
	jsr	($00fd8f4a)
	lea.l	(Lfe3be5),a0
	jsr	($00fd9014)
	move.w	(a4),d1
	jsr	($00fd8f50)
	jsr	($00fd8ece)
	move.l	a4,-(a7)
	movea.l	($0096,a6),a5
	move.w	($06fa,a6),($06f6,a6)
	jsr	($00fda5b2)
	movea.l	(a7)+,a4
	jsr	($00fd8ece)
	bsr.w	Lfe09a6
	bra.w	Lfe1b32
Lfe18e2:
	lea.l	(Lfe3c22),a0
	jsr	($00fd9014)
	bra.s	Lfe1888
Lfe18f0:
	addi.l	#$0000000c,($0092,a6)
	lea.l	(Lfe3be0),a0
	jsr	($00fd9014)
	move.l	($0008,a4),d1
	jsr	($00fd8f4a)
	lea.l	(Lfe3be5),a0
	jsr	($00fd9014)
	move.w	(a4),d1
	jsr	($00fd8f50)
	jsr	($00fd8ece)
	movea.l	($0008,a4),a5
	move.l	a4,-(a7)
	move.w	($06fa,a6),($06f6,a6)
	jsr	($00fda5b2)
	movea.l	(a7)+,a4
	jsr	($00fd8ece)
	bsr.w	Lfe09a6
	bra.w	Lfe1b32
Lfe194a:
	addi.l	#$00000014,($0092,a6)
	lea.l	(Lfe3c55),a0
	jsr	($00fd9014)
	lea.l	(Lfe3be0),a0
	jsr	($00fd9014)
	move.l	($0008,a4),d1
	jsr	($00fd8f4a)
	lea.l	(Lfe3be5),a0
	jsr	($00fd9014)
	move.w	(a4),d1
	jsr	($00fd8f50)
	jsr	($00fd8ece)
	movea.l	($0008,a4),a5
	move.l	a4,-(a7)
	move.w	($06fa,a6),($06f6,a6)
	jsr	($00fda5b2)
	movea.l	(a7)+,a4
	jsr	($00fd8ece)
	bsr.w	Lfe09a6
	bra.w	Lfe1b32
Lfe19b0:
	addi.l	#$00000020,($0092,a6)
	lea.l	(Lfe3cb5),a0
	jsr	($00fd9014)
Lfe19c4:
	lea.l	(Lfe3beb),a0
	jsr	($00fd9014)
	move.l	($0010,a4),d1
	jsr	($00fd8f4a)
	jsr	($00fd8ece)
	lea.l	(Lfe3be0),a0
	jsr	($00fd9014)
	lea.l	($00000008).l,a0
	movea.l	($0002,a4),a5
	move.w	($000a,a4),d2
	move.w	($000c,a4),d0
	btst.l	#$0f,d2
	bne.s	Lfe1a0e
	move.w	($000e,a4),d0
	btst.l	#$0e,d2
	beq.s	Lfe1a2e
Lfe1a0e:
	cmp.w	(a5),d0
	beq.s	Lfe1a2e
	cmp.w	-(a5),d0
	beq.s	Lfe1a2e
	cmp.w	-(a5),d0
	beq.s	Lfe1a2e
	cmp.w	-(a5),d0
	beq.s	Lfe1a2e
	cmp.w	-(a5),d0
	beq.s	Lfe1a2e
	cmp.w	-(a5),d0
	beq.s	Lfe1a2e
	cmp.w	-(a5),d0
	beq.s	Lfe1a2e
	movea.l	($0002,a4),a5
Lfe1a2e:
	move.l	a5,($0096,a6)
	move.l	a4,-(a7)
	move.w	($06fa,a6),($06f6,a6)
	jsr	($00fda5b2)
	movea.l	(a7)+,a4
	jsr	($00fd8ece)
	bra.s	Lfe1a56
Lfe1a4a:
	lea.l	(Lfe3c89),a0
	jsr	($00fd9014)
Lfe1a56:
	lea.l	(Lfe3c01),a0
	jsr	($00fd9014)
	move.b	#$49,d0
	btst.b	#$00,($000a,a4)
	beq.s	Lfe1a72
	move.b	#$4e,d0
Lfe1a72:
	jsr	($00fd9004)
	lea.l	(Lfe3c17),a0
	jsr	($00fd9014)
	move.b	#$52,d0
	btst.b	#$06,($000b,a4)
	bne.s	Lfe1a94
	move.b	#$57,d0
Lfe1a94:
	jsr	($00fd9004)
	lea.l	(Lfe3c1d),a0
	jsr	($00fd9014)
	move.b	($000b,a4),d0
	andi.b	#$07,d0
	addi.b	#$30,d0
	jsr	($00fd9004)
	btst.b	#$07,($000b,a4)
	beq.s	Lfe1acc
	lea.l	(Lfe3cfc),a0
	jsr	($00fd9014)
Lfe1acc:
	lea.l	(Lfe3d07),a0
	jsr	($00fd9014)
	move.w	($000a,a4),d0
	andi.w	#$0030,d0
	lsr.w	#4,d0
	cmpi.w	#$0001,d0
	bcc.s	Lfe1af0
	lea.l	(Lfe3d15),a0
	bra.s	Lfe1b0e
Lfe1af0:
	bne.s	Lfe1afa
	lea.l	(Lfe3d1a),a0
	bra.s	Lfe1b0e
Lfe1afa:
	cmpi.w	#$0002,d0
	bne.s	Lfe1b08
	lea.l	(Lfe3d1f),a0
	bra.s	Lfe1b0e
Lfe1b08:
	lea.l	(Lfe3d24),a0
Lfe1b0e:
	jsr	($00fd9014)
	lea.l	(Lfe3be5),a0
	jsr	($00fd9014)
	move.w	(a4),d1
	jsr	($00fd8f50)
	jsr	($00fd8ece)
Lfe1b2e:
	bsr.w	Lfe09a6
Lfe1b32:
	move.l	($0096,a6),($0032,a6)
	jsr	($00fd98bc)
	movea.l	($06e8,a6),a0
	movec.l	a0,msp
	jmp	($00fd3a9a)

Lfe1b4c:
	addi.l	#$0000005c,($0092,a6)
	lea.l	(Lfe3cd9),a0
	jsr	($00fd9014)
	bra.w	Lfe19c4
Lfe1b64:
	movem.l	d0-d7/a0-a6,($00001056).l
	lea.l	($00001000).l,a6
	move.l	usp,a5
	move.l	a5,($009a,a6)
	lea.l	(Lfe3bca),a0
	jsr	($00fd9014)
	movea.l	(a7)+,a0
	jsr	($00fd9014)
	lea.l	(Lfe3be0),a0
	jsr	($00fd9014)
	move.w	(a7),($00a0,a6)
	move.l	($0002,a7),d1
	move.l	d1,($0096,a6)
	jsr	($00fd8f4a)
	lea.l	(Lfe3be5),a0
	jsr	($00fd9014)
	move.w	(a7),d1
	jsr	($00fd8f50)
	jsr	($00fd8ece)
	move.l	a7,d0
	addq.l	#6,d0
	move.l	d0,($0092,a6)
	bsr.w	Lfe09a6
	bra.w	Lfe1b32
Lfe1bd4:
	bsr.w	Lfe09a6
	move.l	($0096,a6),($0032,a6)
	movea.l	($06e8,a6),a0
	movec.l	a0,msp
	jmp	($00fd3a9a)

Lfe1bec:
	movem.l	a0-a3,-(a7)
	lea.l	($1840,a6),a1
	lea.l	($1850,a6),a2
	lea.l	($1860,a6),a3
	clr.l	(a3)
	move.w	(a1),d0
	move.w	(a2),d1
	andi.w	#$7fff,d0
	beq.w	Lfe1d14
	andi.w	#$7fff,d1
	beq.w	Lfe1d14
	add.w	d1,d0
	subi.w	#$3ffe,d0
	bls.w	Lfe1d14
	cmpi.w	#$7ffe,d0
	bls.s	Lfe1c4c
	move.w	(a1),d3
	move.w	(a2),d5
	eor.w	d3,d5
	andi.w	#$8000,d5
	ori.w	#$7ffe,d5
	move.w	d5,(a3)
	move.l	#$ffffffff,($0004,a3)
	move.l	#$ffffffff,($0008,a3)
	movem.l	(a7)+,a0-a3
	ori.b	#$01,ccr
	rts

Lfe1c4c:
	move.w	(a1),d7
	move.w	(a2),d5
	eor.w	d5,d7
	andi.w	#$8000,d7
	or.w	d0,d7
	move.w	d7,(a3)
	lea.l	($1880,a6),a0
	clr.l	(a0)
	clr.l	(a0)+
	clr.l	(a0)+
	clr.l	(a0)+
	clr.l	d0
	clr.l	d1
	move.l	($0004,a2),d2
	move.l	($0008,a2),d3
	move.l	($0008,a1),d6
	bsr.s	Lfe1c80
	move.l	($0004,a1),d6
	bsr.s	Lfe1c80
	bra.s	Lfe1cc8
Lfe1c80:
	clr.w	d7
Lfe1c82:
	btst.l	d7,d6
	beq.s	Lfe1cb6
	lea.l	($1880,a6),a0
	adda.l	#$00000010,a0
	add.l	d3,-(a0)
	subq.l	#4,a0
	movem.l	(a0),d4
	addx.l	d2,d4
	movem.l	d4,(a0)
	subq.l	#4,a0
	movem.l	(a0),d4
	addx.l	d1,d4
	movem.l	d4,(a0)
	subq.l	#4,a0
	movem.l	(a0),d4
	addx.l	d0,d4
	movem.l	d4,(a0)
Lfe1cb6:
	add.l	d3,d3
	addx.l	d2,d2
	addx.l	d1,d1
	addx.l	d0,d0
	addq.w	#1,d7
	cmpi.w	#$0020,d7
	bcs.s	Lfe1c82
	rts

Lfe1cc8:
	lea.l	($1880,a6),a0
	clr.l	d3
	movem.l	(a0),d0-d2
	addi.l	#$80000000,d2
	addx.l	d3,d1
	addx.l	d3,d0
	movem.l	d0-d2,(a0)
	btst.b	#$07,($1880,a6)
	bne.s	Lfe1d02
	add.l	d2,d2
	addx.l	d1,d1
	addx.l	d0,d0
	movem.l	d0-d2,(a0)
	move.w	(a3),d0
	andi.w	#$7fff,d0
	subq.w	#1,d0
	bls.s	Lfe1d14
	andi.w	#$8000,(a3)
	or.w	d0,(a3)
Lfe1d02:
	lea.l	($1880,a6),a0
	move.l	(a0)+,($0004,a3)
	move.l	(a0),($0008,a3)
	movem.l	(a7)+,a0-a3
	rts

Lfe1d14:
	clr.l	(a3)+
	clr.l	(a3)+
	clr.l	(a3)+
	movem.l	(a7)+,a0-a3
	rts

Lfe1d20:
	movem.l	a0-a3,-(a7)
	lea.l	($1840,a6),a1
	lea.l	($1850,a6),a2
	lea.l	($1860,a6),a3
	clr.l	(a3)
	move.w	(a1),d0
	move.w	(a2),d1
	andi.w	#$7fff,d0
	beq.w	Lfe1e2c
	andi.w	#$7fff,d1
	beq.w	Lfe1e54
	move.w	(a1),d7
	move.w	(a2),d6
	eor.w	d6,d7
	andi.w	#$8000,d7
	move.w	d7,(a3)
	move.l	($0004,a1),d5
	move.l	($0008,a1),d6
	move.l	($0004,a2),d3
	move.l	($0008,a2),d4
	cmp.l	d3,d5
	bne.s	Lfe1d6c
	cmp.l	d4,d6
	beq.w	Lfe1e7a
Lfe1d6c:
	sub.w	d1,d0
	cmpi.w	#$3fff,d0
	bge.w	Lfe1e5a
	cmpi.w	#$c001,d0
	blt.w	Lfe1e42
	addi.w	#$3fff,d0
	or.w	d0,d7
	move.w	d7,(a3)
	move.l	d6,d7
	move.l	d5,d6
	clr.l	d5
	movea.l	d4,a0
	move.l	d3,d4
	clr.l	d3
	clr.l	d0
	not.l	d0
	move.l	d0,d1
	moveq.l	#$3f,d2
Lfe1d9a:
	sub.l	a0,d7
	subx.l	d4,d6
	subx.l	d3,d5
Lfe1da0:
	bmi.s	Lfe1dce
	beq.s	Lfe1db4
	add.l	d1,d1
	addx.l	d0,d0
	add.l	d7,d7
	addx.l	d6,d6
	addx.l	d5,d5
	dbra.w	d2,Lfe1d9a
	bra.s	Lfe1de6
Lfe1db4:
	add.l	d1,d1
	addx.l	d0,d0
	subq.w	#1,d2
	bmi.s	Lfe1de6
	not.l	d1
	not.l	d0
Lfe1dc0:
	add.l	d1,d1
	addx.l	d0,d0
	dbra.w	d2,Lfe1dc0
	clr.l	d3
	clr.l	d4
	bra.s	Lfe1e04
Lfe1dce:
	add.l	d1,d1
	addx.l	d0,d0
	bset.l	#$00,d1
	add.l	d7,d7
	addx.l	d6,d6
	addx.l	d5,d5
	add.l	a0,d7
	addx.l	d4,d6
	addx.l	d3,d5
	dbra.w	d2,Lfe1da0
Lfe1de6:
	tst.l	d5
	bpl.s	Lfe1df0
	add.l	a0,d7
	addx.l	d4,d6
	addx.l	d3,d5
Lfe1df0:
	move.l	d7,d4
	move.l	d6,d3
	not.l	d1
	not.l	d0
	btst.l	#$1f,d3
	beq.s	Lfe1e04
	addq.l	#1,d1
	bcc.s	Lfe1e04
	addq.l	#1,d0
Lfe1e04:
	btst.l	#$1f,d0
	bne.s	Lfe1e1e
	add.l	d1,d1
	addx.l	d0,d0
	move.w	(a3),d7
	andi.w	#$7fff,d7
	subq.w	#1,d7
	ble.s	Lfe1e44
	andi.w	#$8000,(a3)
	or.w	d7,(a3)
Lfe1e1e:
	move.l	d0,($0004,a3)
	move.l	d1,($0008,a3)
	movem.l	(a7)+,a0-a3
	rts

Lfe1e2c:
	andi.w	#$7fff,d1
	bne.s	Lfe1e42
	clr.w	(a3)
	clr.l	($0004,a3)
	clr.l	($0008,a3)
	movem.l	(a7)+,a0-a3
	rts

Lfe1e42:
	move.l	d7,d5
Lfe1e44:
	clr.w	(a3)
	clr.l	($0004,a3)
	clr.l	($0008,a3)
	movem.l	(a7)+,a0-a3
	rts

Lfe1e54:
	move.w	(a1),d7
	move.w	(a2),d6
	eor.w	d6,d7
Lfe1e5a:
	ori.w	#$7fff,d7
	move.w	d7,(a3)
	move.l	#$ffffffff,($0004,a3)
	move.l	#$ffffffff,($0008,a3)
	ori.b	#$01,ccr
	movem.l	(a7)+,a0-a3
	rts

Lfe1e7a:
	sub.w	d1,d0
	cmpi.w	#$3fff,d0
	bgt.s	Lfe1e5a
	cmpi.w	#$c001,d0
	blt.s	Lfe1e42
	addi.w	#$3fff,d0
	or.w	d0,d7
	move.w	d7,(a3)
	move.l	#$80000000,($0004,a3)
	clr.l	($0008,a3)
	movem.l	(a7)+,a0-a3
	rts

Lfe1ea2:
	lea.l	($1880,a6),a0
	moveq.l	#$05,d0
	clr.l	d1
Lfe1eaa:
	move.l	d1,(a0)+
	dbra.w	d0,Lfe1eaa
	lea.l	($1880,a6),a1
	clr.l	d3
	clr.l	d5
	clr.w	d7
	jsr	(Lfe07c6)
	move.b	(a5),d0
	cmpi.b	#$2b,d0
	beq.s	Lfe1ed2
	cmpi.b	#$2d,d0
	bne.s	Lfe1ed4
	bset.l	#$1f,d3
Lfe1ed2:
	addq.l	#1,a5
Lfe1ed4:
	cmpi.b	#$30,(a5)
	bne.s	Lfe1ede
	addq.l	#1,a5
	bra.s	Lfe1ed4
Lfe1ede:
	move.b	(a5),d0
	cmpi.b	#$2e,d0
	beq.s	Lfe1f16
	jsr	(Lfe0816)
	bcs.w	Lfe1f82
	bsr.w	Lfe2028
	cmpi.w	#$0019,d7
	bhi.w	Lfe1f82
	move.w	d3,d5
	clr.w	d3
	move.b	(a5),d0
	cmpi.b	#$2e,d0
	beq.s	Lfe1f24
	cmpi.b	#$45,d0
	beq.s	Lfe1f40
	cmpi.b	#$65,d0
	beq.s	Lfe1f40
	bra.s	Lfe1f88
Lfe1f16:
	addq.l	#1,a5
Lfe1f18:
	cmpi.b	#$30,(a5)
	bne.s	Lfe1f26
	subq.w	#1,d5
	addq.l	#1,a5
	bra.s	Lfe1f18
Lfe1f24:
	addq.l	#1,a5
Lfe1f26:
	bsr.w	Lfe202c
	cmpi.w	#$0019,d7
	bhi.s	Lfe1f82
	clr.w	d3
	cmpi.b	#$45,d0
	beq.s	Lfe1f40
	cmpi.b	#$65,d0
	beq.s	Lfe1f40
	bra.s	Lfe1f88
Lfe1f40:
	clr.w	d7
	addq.l	#1,a5
	move.b	(a5),d0
	cmpi.b	#$2b,d0
	beq.s	Lfe1f56
	cmpi.b	#$2d,d0
	bne.s	Lfe1f5a
	bset.l	#$1e,d3
Lfe1f56:
	addq.l	#1,a5
	move.b	(a5),d0
Lfe1f5a:
	jsr	(Lfe0816)
	bcs.s	Lfe1f82
	movem.l	d3/d5,-(a7)
	bsr.w	Lfe261a
	move.w	d6,d1
	movem.l	(a7)+,d3/d5
	cmpi.w	#$0004,d7
	bhi.s	Lfe1f82
	btst.l	#$1e,d3
	beq.s	Lfe1f7e
	neg.w	d1
Lfe1f7e:
	add.w	d1,d3
	bra.s	Lfe1f88
Lfe1f82:
	ori.b	#$01,ccr
	rts

Lfe1f88:
	add.w	d5,d3
	subq.w	#1,d3
	lea.l	($1800,a6),a0
	clr.l	(a0)+
	clr.l	(a0)+
	clr.l	(a0)
	lea.l	($1880,a6),a1
	lea.l	($1800,a6),a2
	tst.l	d3
	bpl.s	Lfe1fa6
	bset.b	#$07,(a2)
Lfe1fa6:
	tst.w	d3
	bpl.s	Lfe1fb0
	bset.b	#$06,(a2)
	neg.w	d3
Lfe1fb0:
	cmpi.w	#$1388,d3
	bhi.s	Lfe1f82
	ext.l	d3
	divu.w	#$03e8,d3
	lsl.w	#8,d3
	lsl.w	#4,d3
	or.w	d3,($0002,a2)
	clr.w	d3
	swap.w	d3
	divu.w	#$0064,d3
	lsl.w	#8,d3
	or.w	d3,(a2)
	clr.w	d3
	swap.w	d3
	divu.w	#$000a,d3
	lsl.w	#4,d3
	or.w	d3,(a2)
	swap.w	d3
	or.w	d3,(a2)
	move.b	(a1)+,d0
	andi.w	#$000f,d0
	or.w	d0,($0002,a2)
	addq.l	#4,a2
	bsr.s	Lfe1ffe
	move.w	d1,(a2)+
	bsr.s	Lfe1ffe
	move.w	d1,(a2)+
	bsr.s	Lfe1ffe
	move.w	d1,(a2)+
	bsr.s	Lfe1ffe
	move.w	d1,(a2)+
	rts

Lfe1ffe:
	clr.w	d1
	move.b	(a1)+,d0
	andi.w	#$000f,d0
	or.w	d0,d1
	move.b	(a1)+,d0
	andi.w	#$000f,d0
	lsl.w	#4,d1
	or.w	d0,d1
	move.b	(a1)+,d0
	andi.w	#$000f,d0
	lsl.w	#4,d1
	or.w	d0,d1
	move.b	(a1)+,d0
	andi.w	#$000f,d0
	lsl.w	#4,d1
	or.w	d0,d1
	rts

Lfe2028:
	lea.l	($1880,a6),a1
Lfe202c:
	move.b	(a5)+,d0
	jsr	(Lfe0816)
	bcs.s	Lfe2046
Lfe2036:
	move.b	d0,(a1)+
	addq.w	#1,d3
	addq.w	#1,d7
	move.b	(a5)+,d0
	jsr	(Lfe0816)
	bcc.s	Lfe2036
Lfe2046:
	move.b	-(a5),d0
	rts

Lfe204a:
	bsr.w	Lfe2560
	bcc.s	Lfe2052
	rts

Lfe2052:
	move.l	#$0000403e,d2
	btst.l	#$1f,d5
	bne.s	Lfe2084
	tst.l	d5
	bne.s	Lfe2076
	tst.l	d6
	bne.s	Lfe2076
	move.l	a0,-(a7)
	lea.l	($1860,a6),a0
	clr.l	(a0)+
	clr.l	(a0)+
	clr.l	(a0)
	movea.l	(a7)+,a0
	rts

Lfe2076:
	btst.l	#$1f,d5
	bne.s	Lfe2084
	lsl.l	#1,d6
	roxl.l	#1,d5
	subq.l	#1,d2
	bra.s	Lfe2076
Lfe2084:
	movem.l	a0-a3,-(a7)
	lea.l	($1860,a6),a0
	clr.l	(a0)
	move.w	d2,d0
	andi.w	#$7fff,d0
	move.w	d0,(a0)
	move.l	d5,($0004,a0)
	move.l	d6,($0008,a0)
	move.l	d3,d7
	bpl.s	Lfe20a6
	bset.b	#$07,(a0)
Lfe20a6:
	tst.w	d7
	bmi.w	Lfe2302
	cmpi.w	#$1344,d7
	bcc.w	Lfe2530
	cmpi.w	#$1000,d7
	bcs.s	Lfe20ee
	subi.w	#$1000,d7
	move.w	d7,-(a7)
	lea.l	($1850,a6),a2
	lea.l	($1840,a6),a1
	lea.l	($1860,a6),a3
	move.l	(a3)+,(a1)+
	move.l	(a3)+,(a1)+
	move.l	(a3),(a1)
	move.l	#$75250000,(a2)+
	move.l	#$c4605202,(a2)+
	move.l	#$8a20979b,(a2)
	bsr.w	Lfe1bec
	bcs.w	Lfe252e
	move.w	(a7)+,d7
Lfe20ee:
	cmpi.w	#$0800,d7
	bcs.s	Lfe2128
	subi.w	#$0800,d7
	move.w	d7,-(a7)
	lea.l	($1840,a6),a1
	lea.l	($1860,a6),a3
	move.l	(a3)+,(a1)+
	move.l	(a3)+,(a1)+
	move.l	(a3),(a1)
	lea.l	($1850,a6),a2
	move.l	#$5a920000,(a2)+
	move.l	#$9e8b3b5d,(a2)+
	move.l	#$c53d5de5,(a2)
	bsr.w	Lfe1bec
	bcs.w	Lfe252e
	move.w	(a7)+,d7
Lfe2128:
	cmpi.w	#$0400,d7
	bcs.s	Lfe2162
	subi.w	#$0400,d7
	move.w	d7,-(a7)
	lea.l	($1840,a6),a1
	lea.l	($1860,a6),a3
	move.l	(a3)+,(a1)+
	move.l	(a3)+,(a1)+
	move.l	(a3),(a1)
	lea.l	($1850,a6),a2
	move.l	#$4d480000,(a2)+
	move.l	#$c9767586,(a2)+
	move.l	#$81750c17,(a2)
	bsr.w	Lfe1bec
	bcs.w	Lfe252e
	move.w	(a7)+,d7
Lfe2162:
	cmpi.w	#$0200,d7
	bcs.s	Lfe219c
	subi.w	#$0200,d7
	move.w	d7,-(a7)
	lea.l	($1840,a6),a1
	lea.l	($1860,a6),a3
	move.l	(a3)+,(a1)+
	move.l	(a3)+,(a1)+
	move.l	(a3),(a1)
	lea.l	($1850,a6),a2
	move.l	#$46a30000,(a2)+
	move.l	#$e319a0ae,(a2)+
	move.l	#$a60e91c7,(a2)
	bsr.w	Lfe1bec
	bcs.w	Lfe252e
	move.w	(a7)+,d7
Lfe219c:
	cmpi.w	#$0100,d7
	bcs.s	Lfe21d6
	subi.w	#$0100,d7
	lea.l	($1840,a6),a1
	lea.l	($1860,a6),a3
	move.l	(a3)+,(a1)+
	move.l	(a3)+,(a1)+
	move.l	(a3),(a1)
	move.w	d7,-(a7)
	lea.l	($1850,a6),a2
	move.l	#$43510000,(a2)+
	move.l	#$aa7eebfb,(a2)+
	move.l	#$9df9de8e,(a2)
	bsr.w	Lfe1bec
	bcs.w	Lfe252e
	move.w	(a7)+,d7
Lfe21d6:
	cmpi.w	#$0080,d7
	bcs.s	Lfe2210
	subi.w	#$0080,d7
	move.w	d7,-(a7)
	lea.l	($1840,a6),a1
	lea.l	($1860,a6),a3
	move.l	(a3)+,(a1)+
	move.l	(a3)+,(a1)+
	move.l	(a3),(a1)
	lea.l	($1850,a6),a2
	move.l	#$41a80000,(a2)+
	move.l	#$93ba47c9,(a2)+
	move.l	#$80e98ce0,(a2)
	bsr.w	Lfe1bec
	bcs.w	Lfe252e
	move.w	(a7)+,d7
Lfe2210:
	cmpi.w	#$0040,d7
	bcs.s	Lfe224a
	subi.w	#$0040,d7
	move.w	d7,-(a7)
	lea.l	($1840,a6),a1
	lea.l	($1860,a6),a3
	move.l	(a3)+,(a1)+
	move.l	(a3)+,(a1)+
	move.l	(a3),(a1)
	lea.l	($1850,a6),a2
	move.l	#$40d30000,(a2)+
	move.l	#$c2781f49,(a2)+
	move.l	#$ffcfa6d5,(a2)
	bsr.w	Lfe1bec
	bcs.w	Lfe252e
	move.w	(a7)+,d7
Lfe224a:
	cmpi.w	#$0020,d7
	bcs.s	Lfe2284
	subi.w	#$0020,d7
	move.w	d7,-(a7)
	lea.l	($1840,a6),a1
	lea.l	($1860,a6),a3
	move.l	(a3)+,(a1)+
	move.l	(a3)+,(a1)+
	move.l	(a3),(a1)
	lea.l	($1850,a6),a2
	move.l	#$40690000,(a2)+
	move.l	#$9dc5ada8,(a2)+
	move.l	#$2b70b59e,(a2)
	bsr.w	Lfe1bec
	bcs.w	Lfe252e
	move.w	(a7)+,d7
Lfe2284:
	cmpi.w	#$0010,d7
	bcs.s	Lfe22be
	subi.w	#$0010,d7
	move.w	d7,-(a7)
	lea.l	($1840,a6),a1
	lea.l	($1860,a6),a3
	move.l	(a3)+,(a1)+
	move.l	(a3)+,(a1)+
	move.l	(a3),(a1)
	lea.l	($1850,a6),a2
	move.l	#$40340000,(a2)+
	move.l	#$8e1bc9bf,(a2)+
	move.l	#$04000000,(a2)
	bsr.w	Lfe1bec
	bcs.w	Lfe252e
	move.w	(a7)+,d7
Lfe22be:
	cmpi.w	#$0010,d7
	bcc.w	Lfe2530
	tst.w	d7
	beq.s	Lfe22fc
	lea.l	($1840,a6),a1
	lea.l	($1860,a6),a3
	move.l	(a3)+,(a1)+
	move.l	(a3)+,(a1)+
	move.l	(a3),(a1)
	lea.l	(Lfe2ea2),a3
	mulu.w	#$000c,d7
	neg.w	d7
	lea.l	($1850,a6),a2
	move.l	(a3,d7.w),(a2)+
	move.l	($04,a3,d7.w),(a2)+
	move.l	($08,a3,d7.w),(a2)
	bsr.w	Lfe1bec
	bcs.w	Lfe2530
Lfe22fc:
	movem.l	(a7)+,a0-a3
	rts

Lfe2302:
	neg.w	d7
	cmpi.w	#$1344,d7
	bcc.w	Lfe2550
	cmpi.w	#$1000,d7
	bcs.s	Lfe2342
	subi.w	#$1000,d7
	move.w	d7,-(a7)
	lea.l	($1840,a6),a1
	lea.l	($1860,a6),a3
	move.l	(a3)+,(a1)+
	move.l	(a3)+,(a1)+
	move.l	(a3),(a1)
	lea.l	($1850,a6),a0
	move.l	#$0ad80000,(a0)+
	move.l	#$a6dd04c8,(a0)+
	move.l	#$d2ce9fde,(a0)
	bsr.w	Lfe1bec
	move.w	(a7)+,d7
Lfe2342:
	cmpi.w	#$0800,d7
	bcs.s	Lfe2378
	subi.w	#$0800,d7
	move.w	d7,-(a7)
	lea.l	($1840,a6),a1
	lea.l	($1860,a6),a3
	move.l	(a3)+,(a1)+
	move.l	(a3)+,(a1)+
	move.l	(a3),(a1)
	lea.l	($1850,a6),a0
	move.l	#$256b0000,(a0)+
	move.l	#$ceae534f,(a0)+
	move.l	#$34362de4,(a0)
	bsr.w	Lfe1bec
	move.w	(a7)+,d7
Lfe2378:
	cmpi.w	#$0400,d7
	bcs.s	Lfe23ae
	subi.w	#$0400,d7
	move.w	d7,-(a7)
	lea.l	($1840,a6),a1
	lea.l	($1860,a6),a3
	move.l	(a3)+,(a1)+
	move.l	(a3)+,(a1)+
	move.l	(a3),(a1)
	lea.l	($1850,a6),a0
	move.l	#$32b50000,(a0)+
	move.l	#$a2a682a5,(a0)+
	move.l	#$da57c0be,(a0)
	bsr.w	Lfe1bec
	move.w	(a7)+,d7
Lfe23ae:
	cmpi.w	#$0200,d7
	bcs.s	Lfe23e4
	subi.w	#$0200,d7
	move.w	d7,-(a7)
	lea.l	($1840,a6),a1
	lea.l	($1860,a6),a3
	move.l	(a3)+,(a1)+
	move.l	(a3)+,(a1)+
	move.l	(a3),(a1)
	lea.l	($1850,a6),a0
	move.l	#$395a0000,(a0)+
	move.l	#$9049ee32,(a0)+
	move.l	#$db23d21c,(a0)
	bsr.w	Lfe1bec
	move.w	(a7)+,d7
Lfe23e4:
	cmpi.w	#$0100,d7
	bcs.s	Lfe241a
	subi.w	#$0100,d7
	move.w	d7,-(a7)
	lea.l	($1840,a6),a1
	lea.l	($1860,a6),a3
	move.l	(a3)+,(a1)+
	move.l	(a3)+,(a1)+
	move.l	(a3),(a1)
	lea.l	($1850,a6),a0
	move.l	#$3cac0000,(a0)+
	move.l	#$c0314325,(a0)+
	move.l	#$637a193a,(a0)
	bsr.w	Lfe1bec
	move.w	(a7)+,d7
Lfe241a:
	cmpi.w	#$0080,d7
	bcs.s	Lfe2450
	subi.w	#$0080,d7
	move.w	d7,-(a7)
	lea.l	($1840,a6),a1
	lea.l	($1860,a6),a3
	move.l	(a3)+,(a1)+
	move.l	(a3)+,(a1)+
	move.l	(a3),(a1)
	lea.l	($1850,a6),a0
	move.l	#$3e550000,(a0)+
	move.l	#$ddd0467c,(a0)+
	move.l	#$64bce4a0,(a0)
	bsr.w	Lfe1bec
	move.w	(a7)+,d7
Lfe2450:
	cmpi.w	#$0040,d7
	bcs.s	Lfe2486
	subi.w	#$0040,d7
	move.w	d7,-(a7)
	lea.l	($1840,a6),a1
	lea.l	($1860,a6),a3
	move.l	(a3)+,(a1)+
	move.l	(a3)+,(a1)+
	move.l	(a3),(a1)
	lea.l	($1850,a6),a0
	move.l	#$3f2a0000,(a0)+
	move.l	#$a87fea27,(a0)+
	move.l	#$a539e9a5,(a0)
	bsr.w	Lfe1bec
	move.w	(a7)+,d7
Lfe2486:
	cmpi.w	#$0020,d7
	bcs.s	Lfe24bc
	subi.w	#$0020,d7
	move.w	d7,-(a7)
	lea.l	($1840,a6),a1
	lea.l	($1860,a6),a3
	move.l	(a3)+,(a1)+
	move.l	(a3)+,(a1)+
	move.l	(a3),(a1)
	lea.l	($1850,a6),a0
	move.l	#$3f940000,(a0)+
	move.l	#$cfb11ead,(a0)+
	move.l	#$453994ba,(a0)
	bsr.w	Lfe1bec
	move.w	(a7)+,d7
Lfe24bc:
	cmpi.w	#$0010,d7
	bcs.s	Lfe24f2
	subi.w	#$0010,d7
	move.w	d7,-(a7)
	lea.l	($1840,a6),a1
	lea.l	($1860,a6),a3
	move.l	(a3)+,(a1)+
	move.l	(a3)+,(a1)+
	move.l	(a3),(a1)
	lea.l	($1850,a6),a0
	move.l	#$3fc90000,(a0)+
	move.l	#$e69594be,(a0)+
	move.l	#$c44de15b,(a0)
	bsr.w	Lfe1bec
	move.w	(a7)+,d7
Lfe24f2:
	cmpi.w	#$0010,d7
	bcc.s	Lfe2550
	tst.w	d7
	beq.s	Lfe2528
	lea.l	($1840,a6),a1
	lea.l	($1860,a6),a3
	move.l	(a3)+,(a1)+
	move.l	(a3)+,(a1)+
	move.l	(a3),(a1)
	lea.l	(Lfe2ea2),a3
	mulu.w	#$000c,d7
	lea.l	($1850,a6),a2
	move.l	(a3,d7.w),(a2)+
	move.l	($04,a3,d7.w),(a2)+
	move.l	($08,a3,d7.w),(a2)
	bsr.w	Lfe1bec
Lfe2528:
	movem.l	(a7)+,a0-a3
	rts

Lfe252e:
	move.w	(a7)+,d7
Lfe2530:
	lea.l	($1860,a6),a3
	move.l	#$7ffe0000,(a3)+
	move.l	#$ffffffff,(a3)+
	move.l	#$ffffffff,(a3)+
	ori.b	#$01,ccr
	movem.l	(a7)+,a0-a3
	rts

Lfe2550:
	lea.l	($1860,a6),a0
	clr.l	(a0)+
	clr.l	(a0)+
	clr.l	(a0)
	movem.l	(a7)+,a0-a3
	rts

Lfe2560:
	jsr	(Lfe07c6)
	clr.l	d3
	clr.l	d5
	clr.l	d6
	clr.w	d7
	move.b	(a5),d0
	cmpi.b	#$2b,d0
	beq.s	Lfe2580
	cmpi.b	#$2d,d0
	bne.s	Lfe2584
	bset.l	#$1f,d3
Lfe2580:
	addq.l	#1,a5
	move.b	(a5),d0
Lfe2584:
	cmpi.b	#$2e,d0
	beq.s	Lfe25b6
	jsr	(Lfe0816)
	bcs.w	Lfe2614
	bsr.w	Lfe261a
	cmpi.w	#$0013,d7
	bhi.s	Lfe2614
	clr.w	d3
	cmpi.b	#$2e,d0
	beq.s	Lfe25b6
	cmpi.b	#$45,d0
	beq.s	Lfe25d2
	cmpi.b	#$65,d0
	beq.s	Lfe25d2
	move.w	d0,d0
	rts

Lfe25b6:
	addq.l	#1,a5
	bsr.s	Lfe2628
	cmpi.w	#$0013,d7
	bhi.s	Lfe2614
	neg.w	d3
	cmpi.b	#$45,d0
	beq.s	Lfe25d2
	cmpi.b	#$65,d0
	beq.s	Lfe25d2
	move.w	d0,d0
	rts

Lfe25d2:
	clr.w	d7
	addq.l	#1,a5
	move.b	(a5),d0
	cmpi.b	#$2b,d0
	beq.s	Lfe25e8
	cmpi.b	#$2d,d0
	bne.s	Lfe25ec
	bset.l	#$1e,d3
Lfe25e8:
	addq.l	#1,a5
	move.b	(a5),d0
Lfe25ec:
	jsr	(Lfe0816)
	bcs.s	Lfe2614
	movem.l	d3/d5-d6,-(a7)
	bsr.s	Lfe261a
	move.w	d6,d1
	movem.l	(a7)+,d3/d5-d6
	cmpi.w	#$0004,d7
	bhi.s	Lfe2614
	btst.l	#$1e,d3
	beq.s	Lfe260e
	neg.w	d1
Lfe260e:
	add.w	d1,d3
	tst.w	d0
	rts

Lfe2614:
	ori.b	#$01,ccr
	rts

Lfe261a:
	clr.l	d5
	clr.l	d6
Lfe261e:
	move.b	(a5)+,d0
	cmpi.b	#$30,d0
	beq.s	Lfe261e
	bra.s	Lfe262a
Lfe2628:
	move.b	(a5)+,d0
Lfe262a:
	jsr	(Lfe0816)
	bcs.s	Lfe2662
Lfe2632:
	add.l	d6,d6
	addx.l	d5,d5
	move.l	d5,d1
	move.l	d6,d2
	add.l	d6,d6
	addx.l	d5,d5
	add.l	d6,d6
	addx.l	d5,d5
	add.l	d2,d6
	addx.l	d1,d5
	subi.b	#$30,d0
	ext.w	d0
	ext.l	d0
	add.l	d0,d6
	clr.l	d0
	addx.l	d0,d5
	addq.w	#1,d3
	addq.w	#1,d7
	move.b	(a5)+,d0
	jsr	(Lfe0816)
	bcc.s	Lfe2632
Lfe2662:
	move.b	-(a5),d0
	rts

Lfe2666:
	movem.l	d0-d2/a0-a1,-(a7)
	bsr.w	Lfe2786
	movem.l	(a7)+,d0-d2/a0-a1
	move.b	($0001,a0),d7
	cmpi.b	#$3f,d7
	bne.s	Lfe268c
	move.b	d7,(a1)
	clr.b	($0001,a1)
	lea.l	($0001,a1),a3
	ori.b	#$01,ccr
	rts

Lfe268c:
	cmpi.b	#$30,d7
	bne.s	Lfe26a4
	move.b	#$20,(a1)
	move.b	d7,($0001,a1)
	clr.b	($0002,a1)
	lea.l	($0002,a1),a3
	rts

Lfe26a4:
	moveq.l	#$11,d4
	lea.l	($0002,a0),a2
	movea.l	a1,a3
	move.b	(a0),(a3)+
	clr.w	d2
	move.b	($0015,a0),d2
	move.w	($0016,a0),d7
	bmi.s	Lfe26e0
	cmp.w	d4,d2
	bhi.s	Lfe270c
	move.w	d7,d0
	addq.w	#1,d0
	cmp.w	d4,d0
	bhi.s	Lfe270c
Lfe26c6:
	subq.w	#1,d2
	move.b	(a2)+,(a3)+
	dbra.w	d7,Lfe26c6
	subq.w	#1,d2
	bmi.s	Lfe26dc
	move.b	#$2e,(a3)+
Lfe26d6:
	move.b	(a2)+,(a3)+
	dbra.w	d2,Lfe26d6
Lfe26dc:
	clr.b	(a3)
	rts

Lfe26e0:
	move.w	d7,d0
	neg.w	d0
	move.w	d0,d1
	subq.w	#1,d0
	add.w	d2,d0
	cmp.w	d4,d0
	bhi.s	Lfe270c
	move.b	#$2e,(a3)+
	subq.w	#2,d1
	bmi.s	Lfe26fe
Lfe26f6:
	move.b	#$30,(a3)+
	dbra.w	d1,Lfe26f6
Lfe26fe:
	subq.w	#1,d2
	bmi.s	Lfe270a
Lfe2702:
	move.b	(a2)+,(a3)+
	dbra.w	d2,Lfe2702
	clr.b	(a3)+
Lfe270a:
	rts

Lfe270c:
	lea.l	($0002,a0),a2
	lea.l	($0001,a1),a3
	subq.w	#1,d4
	bmi.s	Lfe2728
	move.b	(a2)+,(a3)+
	subq.w	#1,d4
	bmi.s	Lfe2728
	move.b	#$2e,(a3)+
Lfe2722:
	move.b	(a2)+,(a3)+
	dbra.w	d4,Lfe2722
Lfe2728:
	bsr.w	Lfe2f7a
	clr.b	(a3)
	rts

Lfe2730:
	cmpi.w	#$0011,d4
	bcs.s	Lfe273a
	moveq.l	#$11,d4
	rts

Lfe273a:
	cmp.b	($0015,a0),d4
	bcc.s	Lfe2784
	lea.l	($02,a0,d4.w),a2
	move.b	d4,($0015,a0)
	cmpi.b	#$35,(a2)
	bcs.s	Lfe276c
	lea.l	($0002,a0),a3
Lfe2752:
	addq.b	#1,-(a2)
	cmpi.b	#$39,(a2)
	bls.s	Lfe276c
	move.b	#$30,(a2)
	cmpa.l	a3,a2
	bhi.s	Lfe2752
	move.b	#$31,($0002,a0)
	addq.w	#1,($0016,a0)
Lfe276c:
	move.w	d4,d0
	subq.w	#1,d0
	ble.s	Lfe2784
	lea.l	($02,a0,d4.w),a3
Lfe2776:
	cmpi.b	#$30,-(a3)
	dbne.w	d0,Lfe2776
	addq.w	#1,d0
	move.b	d0,($0015,a0)
Lfe2784:
	rts

Lfe2786:
	move.b	#$20,d0
	move.b	d0,(a0)
	move.b	d0,($0001,a0)
	move.w	($1860,a6),d0
	bpl.s	Lfe279a
	move.b	#$2d,(a0)
Lfe279a:
	andi.w	#$7fff,d0
	move.w	d0,($1860,a6)
	bne.s	Lfe27c4
	move.b	#$30,($0001,a0)
Lfe27aa:
	move.b	#$01,($0015,a0)
	lea.l	($0002,a0),a2
	moveq.l	#$11,d1
Lfe27b6:
	move.b	#$30,(a2)+
	dbra.w	d1,Lfe27b6
	clr.w	($0016,a0)
	rts

Lfe27c4:
	cmpi.w	#$7fff,d0
	bne.s	Lfe27d8
	move.b	#$3f,($0001,a0)
	bsr.s	Lfe27aa
	ori.b	#$01,ccr
	rts

Lfe27d8:
	movem.l	a0-a3,-(a7)
	lea.l	($1860,a6),a3
	move.l	(a3),d5
	andi.l	#$7fff0000,d5
	clr.w	-(a7)
	cmpi.l	#$3fff0000,d5
	bcs.w	Lfe2af6
	lea.l	($1860,a6),a3
	cmpi.l	#$75250000,(a3)
	bcs.s	Lfe2840
	bne.s	Lfe2818
	cmpi.l	#$c4605202,($0004,a3)
	bcs.s	Lfe2840
	bne.s	Lfe2818
	cmpi.l	#$8a20979b,($0008,a3)
	bcs.s	Lfe2840
Lfe2818:
	addi.w	#$1000,(a7)
	lea.l	($1840,a6),a1
	lea.l	($1850,a6),a2
	move.l	#$75250000,(a2)+
	move.l	#$c4605202,(a2)+
	move.l	#$8a20979b,(a2)
	move.l	(a3)+,(a1)+
	move.l	(a3)+,(a1)+
	move.l	(a3),(a1)
	bsr.w	Lfe1d20
Lfe2840:
	lea.l	($1860,a6),a3
	cmpi.l	#$5a920000,(a3)
	bcs.s	Lfe288c
	bne.s	Lfe2864
	cmpi.l	#$9e8b3b5d,($0004,a3)
	bcs.s	Lfe288c
	bne.s	Lfe2864
	cmpi.l	#$c53d5de5,($0008,a3)
	bcs.s	Lfe288c
Lfe2864:
	addi.w	#$0800,(a7)
	lea.l	($1840,a6),a1
	lea.l	($1850,a6),a2
	move.l	#$5a920000,(a2)+
	move.l	#$9e8b3b5d,(a2)+
	move.l	#$c53d5de5,(a2)
	move.l	(a3)+,(a1)+
	move.l	(a3)+,(a1)+
	move.l	(a3),(a1)
	bsr.w	Lfe1d20
Lfe288c:
	lea.l	($1860,a6),a3
	cmpi.l	#$4d480000,(a3)
	bcs.s	Lfe28d8
	bne.s	Lfe28b0
	cmpi.l	#$c9767586,($0004,a3)
	bcs.s	Lfe28d8
	bne.s	Lfe28b0
	cmpi.l	#$81750c17,($0008,a3)
	bcs.s	Lfe28d8
Lfe28b0:
	addi.w	#$0400,(a7)
	lea.l	($1840,a6),a1
	lea.l	($1850,a6),a2
	move.l	#$4d480000,(a2)+
	move.l	#$c9767586,(a2)+
	move.l	#$81750c17,(a2)
	move.l	(a3)+,(a1)+
	move.l	(a3)+,(a1)+
	move.l	(a3),(a1)
	bsr.w	Lfe1d20
Lfe28d8:
	lea.l	($1860,a6),a3
	cmpi.l	#$46a30000,(a3)
	bcs.s	Lfe2924
	bne.s	Lfe28fc
	cmpi.l	#$e319a0ae,($0004,a3)
	bcs.s	Lfe2924
	bne.s	Lfe28fc
	cmpi.l	#$a60e91c7,($0008,a3)
	bcs.s	Lfe2924
Lfe28fc:
	addi.w	#$0200,(a7)
	lea.l	($1840,a6),a1
	lea.l	($1850,a6),a2
	move.l	#$46a30000,(a2)+
	move.l	#$e319a0ae,(a2)+
	move.l	#$a60e91c7,(a2)
	move.l	(a3)+,(a1)+
	move.l	(a3)+,(a1)+
	move.l	(a3),(a1)
	bsr.w	Lfe1d20
Lfe2924:
	lea.l	($1860,a6),a3
	cmpi.l	#$43510000,(a3)
	bcs.s	Lfe2970
	bne.s	Lfe2948
	cmpi.l	#$aa7eebfb,($0004,a3)
	bcs.s	Lfe2970
	bne.s	Lfe2948
	cmpi.l	#$9df9de8e,($0008,a3)
	bcs.s	Lfe2970
Lfe2948:
	addi.w	#$0100,(a7)
	lea.l	($1840,a6),a1
	lea.l	($1850,a6),a2
	move.l	#$43510000,(a2)+
	move.l	#$aa7eebfb,(a2)+
	move.l	#$9df9de8e,(a2)
	move.l	(a3)+,(a1)+
	move.l	(a3)+,(a1)+
	move.l	(a3),(a1)
	bsr.w	Lfe1d20
Lfe2970:
	lea.l	($1860,a6),a3
	cmpi.l	#$41a80000,(a3)
	bcs.s	Lfe29bc
	bne.s	Lfe2994
	cmpi.l	#$93ba47c9,($0004,a3)
	bcs.s	Lfe29bc
	bne.s	Lfe2994
	cmpi.l	#$80e98ce0,($0008,a3)
	bcs.s	Lfe29bc
Lfe2994:
	addi.w	#$0080,(a7)
	lea.l	($1840,a6),a1
	lea.l	($1850,a6),a2
	move.l	#$41a80000,(a2)+
	move.l	#$93ba47c9,(a2)+
	move.l	#$80e98ce0,(a2)
	move.l	(a3)+,(a1)+
	move.l	(a3)+,(a1)+
	move.l	(a3),(a1)
	bsr.w	Lfe1d20
Lfe29bc:
	lea.l	($1860,a6),a3
	cmpi.l	#$40d30000,(a3)
	bcs.s	Lfe2a08
	bne.s	Lfe29e0
	cmpi.l	#$c2781f49,($0004,a3)
	bcs.s	Lfe2a08
	bne.s	Lfe29e0
	cmpi.l	#$ffcfa6d5,($0008,a3)
	bcs.s	Lfe2a08
Lfe29e0:
	addi.w	#$0040,(a7)
	lea.l	($1840,a6),a1
	lea.l	($1850,a6),a2
	move.l	#$40d30000,(a2)+
	move.l	#$c2781f49,(a2)+
	move.l	#$ffcfa6d5,(a2)
	move.l	(a3)+,(a1)+
	move.l	(a3)+,(a1)+
	move.l	(a3),(a1)
	bsr.w	Lfe1d20
Lfe2a08:
	lea.l	($1860,a6),a3
	cmpi.l	#$40690000,(a3)
	bcs.s	Lfe2a54
	bne.s	Lfe2a2c
	cmpi.l	#$9dc5ada8,($0004,a3)
	bcs.s	Lfe2a54
	bne.s	Lfe2a2c
	cmpi.l	#$2b70b59e,($0008,a3)
	bcs.s	Lfe2a54
Lfe2a2c:
	addi.w	#$0020,(a7)
	lea.l	($1840,a6),a1
	lea.l	($1850,a6),a2
	move.l	#$40690000,(a2)+
	move.l	#$9dc5ada8,(a2)+
	move.l	#$2b70b59e,(a2)
	move.l	(a3)+,(a1)+
	move.l	(a3)+,(a1)+
	move.l	(a3),(a1)
	bsr.w	Lfe1d20
Lfe2a54:
	lea.l	($1860,a6),a3
	cmpi.l	#$40340000,(a3)
	bcs.s	Lfe2aa0
	bne.s	Lfe2a78
	cmpi.l	#$8e1bc9bf,($0004,a3)
	bcs.s	Lfe2aa0
	bne.s	Lfe2a78
	cmpi.l	#$04000000,($0008,a3)
	bcs.s	Lfe2aa0
Lfe2a78:
	addi.w	#$0010,(a7)
	lea.l	($1840,a6),a1
	lea.l	($1850,a6),a2
	move.l	#$40340000,(a2)+
	move.l	#$8e1bc9bf,(a2)+
	move.l	#$04000000,(a2)
	move.l	(a3)+,(a1)+
	move.l	(a3)+,(a1)+
	move.l	(a3),(a1)
	bsr.w	Lfe1d20
Lfe2aa0:
	moveq.l	#$10,d2
	lea.l	(Lfe2dee),a0
Lfe2aa8:
	move.l	(a0)+,d3
	move.l	(a0)+,d4
	move.l	(a0)+,d5
	subq.w	#1,d2
	lea.l	($1860,a6),a3
	cmp.l	(a3)+,d3
	bhi.s	Lfe2aa8
	bne.s	Lfe2ac4
	cmp.l	(a3)+,d4
	bhi.s	Lfe2aa8
	bne.s	Lfe2ac4
	cmp.l	(a3),d5
	bhi.s	Lfe2aa8
Lfe2ac4:
	tst.w	d2
	beq.s	Lfe2ae6
	add.w	d2,(a7)
	lea.l	($1840,a6),a1
	lea.l	($1850,a6),a2
	lea.l	($1860,a6),a3
	move.l	d3,(a2)+
	move.l	d4,(a2)+
	move.l	d5,(a2)
	move.l	(a3)+,(a1)+
	move.l	(a3)+,(a1)+
	move.l	(a3),(a1)
	bsr.w	Lfe1d20
Lfe2ae6:
	move.w	(a7)+,d0
	movem.l	(a7)+,a0-a3
	move.w	d0,($0016,a0)
	bsr.w	Lfe2fb6
	rts

Lfe2af6:
	lea.l	($1860,a6),a3
	cmpi.l	#$0ad80000,(a3)
	bhi.s	Lfe2b42
	bne.s	Lfe2b1a
	cmpi.l	#$a6dd04c8,($0004,a3)
	bhi.s	Lfe2b42
	bne.s	Lfe2b1a
	cmpi.l	#$d2ce9fde,($0008,a3)
	bhi.s	Lfe2b42
Lfe2b1a:
	subi.w	#$1000,(a7)
	lea.l	($1840,a6),a1
	lea.l	($1850,a6),a2
	move.l	#$0ad80000,(a2)+
	move.l	#$a6dd04c8,(a2)+
	move.l	#$d2ce9fde,(a2)
	move.l	(a3)+,(a1)+
	move.l	(a3)+,(a1)+
	move.l	(a3),(a1)
	bsr.w	Lfe1d20
Lfe2b42:
	lea.l	($1860,a6),a3
	cmpi.l	#$256b0000,(a3)
	bhi.s	Lfe2b8e
	bne.s	Lfe2b66
	cmpi.l	#$ceae534f,($0004,a3)
	bhi.s	Lfe2b8e
	bne.s	Lfe2b66
	cmpi.l	#$34362de4,($0008,a3)
	bhi.s	Lfe2b8e
Lfe2b66:
	subi.w	#$0800,(a7)
	lea.l	($1840,a6),a1
	lea.l	($1850,a6),a2
	move.l	#$256b0000,(a2)+
	move.l	#$ceae534f,(a2)+
	move.l	#$34362de4,(a2)
	move.l	(a3)+,(a1)+
	move.l	(a3)+,(a1)+
	move.l	(a3),(a1)
	bsr.w	Lfe1d20
Lfe2b8e:
	lea.l	($1860,a6),a3
	cmpi.l	#$32b50000,(a3)
	bhi.s	Lfe2bda
	bne.s	Lfe2bb2
	cmpi.l	#$a2a682a5,($0004,a3)
	bhi.s	Lfe2bda
	bne.s	Lfe2bb2
	cmpi.l	#$da57c0be,($0008,a3)
	bhi.s	Lfe2bda
Lfe2bb2:
	subi.w	#$0400,(a7)
	lea.l	($1840,a6),a1
	lea.l	($1850,a6),a2
	move.l	#$32b50000,(a2)+
	move.l	#$a2a682a5,(a2)+
	move.l	#$da57c0be,(a2)
	move.l	(a3)+,(a1)+
	move.l	(a3)+,(a1)+
	move.l	(a3),(a1)
	bsr.w	Lfe1d20
Lfe2bda:
	lea.l	($1860,a6),a3
	cmpi.l	#$395a0000,(a3)
	bhi.s	Lfe2c26
	bne.s	Lfe2bfe
	cmpi.l	#$9049ee32,($0004,a3)
	bhi.s	Lfe2c26
	bne.s	Lfe2bfe
	cmpi.l	#$db23d21c,($0008,a3)
	bhi.s	Lfe2c26
Lfe2bfe:
	subi.w	#$0200,(a7)
	lea.l	($1840,a6),a1
	lea.l	($1850,a6),a2
	move.l	#$395a0000,(a2)+
	move.l	#$9049ee32,(a2)+
	move.l	#$db23d21c,(a2)
	move.l	(a3)+,(a1)+
	move.l	(a3)+,(a1)+
	move.l	(a3),(a1)
	bsr.w	Lfe1d20
Lfe2c26:
	lea.l	($1860,a6),a3
	cmpi.l	#$3cac0000,(a3)
	bhi.s	Lfe2c72
	bne.s	Lfe2c4a
	cmpi.l	#$c0314325,($0004,a3)
	bhi.s	Lfe2c72
	bne.s	Lfe2c4a
	cmpi.l	#$637a193a,($0008,a3)
	bhi.s	Lfe2c72
Lfe2c4a:
	subi.w	#$0100,(a7)
	lea.l	($1840,a6),a1
	lea.l	($1850,a6),a2
	move.l	#$3cac0000,(a2)+
	move.l	#$c0314325,(a2)+
	move.l	#$637a193a,(a2)
	move.l	(a3)+,(a1)+
	move.l	(a3)+,(a1)+
	move.l	(a3),(a1)
	bsr.w	Lfe1d20
Lfe2c72:
	lea.l	($1860,a6),a3
	cmpi.l	#$3e550000,(a3)
	bhi.s	Lfe2cbe
	bne.s	Lfe2c96
	cmpi.l	#$ddd0467c,($0004,a3)
	bhi.s	Lfe2cbe
	bne.s	Lfe2c96
	cmpi.l	#$64bce4a0,($0008,a3)
	bhi.s	Lfe2cbe
Lfe2c96:
	subi.w	#$0080,(a7)
	lea.l	($1840,a6),a1
	lea.l	($1850,a6),a2
	move.l	#$3e550000,(a2)+
	move.l	#$ddd0467c,(a2)+
	move.l	#$64bce4a0,(a2)
	move.l	(a3)+,(a1)+
	move.l	(a3)+,(a1)+
	move.l	(a3),(a1)
	bsr.w	Lfe1d20
Lfe2cbe:
	lea.l	($1860,a6),a3
	cmpi.l	#$3f2a0000,(a3)
	bhi.s	Lfe2d0a
	bne.s	Lfe2ce2
	cmpi.l	#$a87fea27,($0004,a3)
	bhi.s	Lfe2d0a
	bne.s	Lfe2ce2
	cmpi.l	#$a539e9a5,($0008,a3)
	bhi.s	Lfe2d0a
Lfe2ce2:
	subi.w	#$0040,(a7)
	lea.l	($1840,a6),a1
	lea.l	($1850,a6),a2
	move.l	#$3f2a0000,(a2)+
	move.l	#$a87fea27,(a2)+
	move.l	#$a539e9a5,(a2)
	move.l	(a3)+,(a1)+
	move.l	(a3)+,(a1)+
	move.l	(a3),(a1)
	bsr.w	Lfe1d20
Lfe2d0a:
	lea.l	($1860,a6),a3
	cmpi.l	#$3f940000,(a3)
	bhi.s	Lfe2d56
	bne.s	Lfe2d2e
	cmpi.l	#$cfb11ead,($0004,a3)
	bhi.s	Lfe2d56
	bne.s	Lfe2d2e
	cmpi.l	#$453994ba,($0008,a3)
	bhi.s	Lfe2d56
Lfe2d2e:
	subi.w	#$0020,(a7)
	lea.l	($1840,a6),a1
	lea.l	($1850,a6),a2
	move.l	#$3f940000,(a2)+
	move.l	#$cfb11ead,(a2)+
	move.l	#$453994ba,(a2)
	move.l	(a3)+,(a1)+
	move.l	(a3)+,(a1)+
	move.l	(a3),(a1)
	bsr.w	Lfe1d20
Lfe2d56:
	lea.l	($1860,a6),a3
	cmpi.l	#$3fc90000,(a3)
	bhi.s	Lfe2da2
	bne.s	Lfe2d7a
	cmpi.l	#$e69594be,($0004,a3)
	bhi.s	Lfe2da2
	bne.s	Lfe2d7a
	cmpi.l	#$c44de15b,($0008,a3)
	bhi.s	Lfe2da2
Lfe2d7a:
	subi.w	#$0010,(a7)
	lea.l	($1840,a6),a1
	lea.l	($1850,a6),a2
	move.l	#$3fc90000,(a2)+
	move.l	#$e69594be,(a2)+
	move.l	#$c44de15b,(a2)
	move.l	(a3)+,(a1)+
	move.l	(a3)+,(a1)+
	move.l	(a3),(a1)
	bsr.w	Lfe1d20
Lfe2da2:
	moveq.l	#$ff,d2
	lea.l	(Lfe2ea2),a0
Lfe2daa:
	move.l	(a0)+,d3
	move.l	(a0)+,d4
	move.l	(a0)+,d5
	addq.w	#1,d2
	lea.l	($1860,a6),a3
	cmp.l	(a3)+,d3
	bcs.s	Lfe2dc6
	bne.s	Lfe2daa
	cmp.l	(a3)+,d4
	bcs.s	Lfe2dc6
	bne.s	Lfe2daa
	cmp.l	(a3),d5
	bhi.s	Lfe2daa
Lfe2dc6:
	tst.w	d2
	beq.w	Lfe2ae6
	sub.w	d2,(a7)
	lea.l	($1850,a6),a2
	move.l	d3,(a2)+
	move.l	d4,(a2)+
	move.l	d5,(a2)
	lea.l	($1840,a6),a1
	lea.l	($1860,a6),a3
	move.l	(a3)+,(a1)+
	move.l	(a3)+,(a1)+
	move.l	(a3),(a1)
	bsr.w	Lfe1d20
	bra.w	Lfe2ae6
Lfe2dee:
	.dc.b	$40,$30,$00,$00,$e3,$5f,$a9,$31
	.dc.b	$a0,$00,$00,$05,$40,$2d,$00,$00
	.dc.b	$b5,$e6,$20,$f4,$80,$00,$00,$0a
	.dc.b	$40,$2a,$00,$00,$91,$84,$e7,$29
	.dc.b	$ff,$ff,$ff,$f9,$40,$26,$00,$00
	.dc.b	$e8,$d4,$a5,$10,$00,$00,$00,$08
	.dc.b	$40,$23,$00,$00,$ba,$43,$b7,$40
	.dc.b	$00,$00,$00,$14,$40,$20,$00,$00
	.dc.b	$95,$02,$f8,$ff,$ff,$ff,$ff,$f9
	.dc.b	$40,$1c,$00,$00,$ee,$6b,$28,$00
	.dc.b	$00,$00,$00,$01,$40,$19,$00,$00
	.dc.b	$be,$bc,$20,$00,$00,$00,$00,$08
	.dc.b	$40,$16,$00,$00,$98,$96,$7f,$ff
	.dc.b	$ff,$ff,$ff,$fd,$40,$12,$00,$00
	.dc.b	$f4,$24,$00,$00,$00,$00,$00,$03
	.dc.b	$40,$0f,$00,$00,$c3,$50,$00,$00
	.dc.b	$00,$00,$00,$0d,$40,$0c,$00,$00
	.dc.b	$9c,$3f,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$40,$08,$00,$00,$fa,$00,$00,$00
	.dc.b	$00,$00,$00,$01,$40,$05,$00,$00
	.dc.b	$c8,$00,$00,$00,$00,$00,$00,$07
	.dc.b	$40,$02,$00,$00,$a0,$00,$00,$00
	.dc.b	$00,$00,$00,$00
Lfe2ea2:
	.dc.b	$3f,$ff,$00,$00,$80,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$3f,$fb,$00,$00
	.dc.b	$cc,$cc,$cc,$cc,$cc,$cc,$cc,$cd
	.dc.b	$3f,$f8,$00,$00,$a3,$d7,$0a,$3d
	.dc.b	$70,$a3,$d7,$04,$3f,$f5,$00,$00
	.dc.b	$83,$12,$6e,$97,$8d,$4f,$df,$3b
	.dc.b	$3f,$f1,$00,$00,$d1,$b7,$17,$58
	.dc.b	$e2,$19,$65,$2c,$3f,$ee,$00,$00
	.dc.b	$a7,$c5,$ac,$47,$1b,$47,$84,$17
	.dc.b	$3f,$eb,$00,$00,$86,$37,$bd,$05
	.dc.b	$af,$6c,$69,$b4,$3f,$e7,$00,$00
	.dc.b	$d6,$bf,$94,$d5,$e5,$7a,$42,$c0
	.dc.b	$3f,$e4,$00,$00,$ab,$cc,$77,$11
	.dc.b	$84,$61,$ce,$f6,$3f,$e1,$00,$00
	.dc.b	$89,$70,$5f,$41,$36,$b4,$a5,$96
	.dc.b	$3f,$dd,$00,$00,$db,$e6,$fe,$ce
	.dc.b	$bd,$ed,$d5,$c8,$3f,$da,$00,$00
	.dc.b	$af,$eb,$ff,$0b,$cb,$24,$aa,$ec
	.dc.b	$3f,$d7,$00,$00,$8c,$bc,$cc,$09
	.dc.b	$6f,$50,$88,$c7,$3f,$d3,$00,$00
	.dc.b	$e1,$2e,$13,$42,$4b,$b4,$0e,$1d
	.dc.b	$3f,$d0,$00,$00,$b4,$24,$dc,$35
	.dc.b	$09,$5c,$d8,$05,$3f,$cd,$00,$00
	.dc.b	$90,$1d,$7c,$f7,$3a,$b0,$ac,$d6
	.dc.b	$3f,$c9,$00,$00,$e6,$95,$94,$be
	.dc.b	$c4,$4d,$e1,$5e,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
Lfe2f7a:
	move.b	#$45,(a3)+
	move.w	($0016,a0),d2
	move.b	#$2b,d0
	tst.w	d2
	bpl.s	Lfe2f90
	move.b	#$2d,d0
	neg.w	d2
Lfe2f90:
	move.b	d0,(a3)+
	moveq.l	#$0a,d0
	moveq.l	#$03,d1
	swap.w	d2
Lfe2f98:
	clr.w	d2
	swap.w	d2
	divu.w	d0,d2
	swap.w	d2
	move.w	d2,-(a7)
	dbra.w	d1,Lfe2f98
	moveq.l	#$03,d1
Lfe2fa8:
	move.w	(a7)+,d2
	addi.b	#$30,d2
	move.b	d2,(a3)+
	dbra.w	d1,Lfe2fa8
	rts

Lfe2fb6:
	move.l	a1,-(a7)
	lea.l	($1860,a6),a1
	move.w	(a1),d0
	clr.l	d4
	move.l	($0004,a1),d5
	move.l	($0008,a1),d6
	add.l	d6,d6
	addx.l	d5,d5
	addx.l	d4,d4
	andi.w	#$7fff,d0
	subi.w	#$3fff,d0
	clr.w	d1
	tst.w	d0
	beq.s	Lfe2fe8
	subq.w	#1,d0
Lfe2fde:
	add.l	d6,d6
	addx.l	d5,d5
	addx.l	d4,d4
	dbra.w	d0,Lfe2fde
Lfe2fe8:
	clr.l	d2
	addi.l	#$00000054,d6
	addx.l	d2,d5
	addx.l	d2,d4
	cmpi.l	#$0000000a,d4
	bcs.s	Lfe303c
	addq.w	#1,($0016,a0)
	moveq.l	#$30,d0
	move.b	#$31,($0002,a0)
	moveq.l	#$11,d1
	lea.l	($0003,a0),a2
Lfe300e:
	move.b	d0,(a2)+
	dbra.w	d1,Lfe300e
	move.b	#$01,($0015,a0)
	movea.l	(a7)+,a1
	rts

Lfe301e:
	add.l	d6,d6
	addx.l	d5,d5
	addx.l	d4,d4
	movea.l	d6,a1
	move.l	d5,d7
	move.l	d4,d3
	add.l	d6,d6
	addx.l	d5,d5
	addx.l	d4,d4
	add.l	d6,d6
	addx.l	d5,d5
	addx.l	d4,d4
	add.l	a1,d6
	addx.l	d7,d5
	addx.l	d3,d4
Lfe303c:
	move.l	d4,d2
	addi.b	#$30,d2
	move.b	d2,($02,a0,d1.w)
	clr.l	d4
	addq.w	#1,d1
	cmpi.w	#$0012,d1
	bls.s	Lfe301e
	moveq.l	#$10,d1
Lfe3052:
	cmpi.b	#$30,($03,a0,d1.w)
	dbne.w	d1,Lfe3052
	addq.w	#2,d1
	move.b	d1,($0015,a0)
	movea.l	(a7)+,a1
	rts

Lfe3066:
	move.l	a3,-(a7)
	lea.l	($1860,a6),a3
	cmpi.l	#$80000000,d6
	bne.s	Lfe308a
	lea.l	($1860,a6),a0
	move.l	#$c01e0000,(a3)+
	move.l	#$80000000,(a3)+
	clr.l	(a3)
	movea.l	(a7)+,a3
	rts

Lfe308a:
	move.l	d6,d7
	bne.s	Lfe3098
Lfe308e:
	clr.l	(a3)+
	clr.l	(a3)+
	clr.l	(a3)
	movea.l	(a7)+,a3
	rts

Lfe3098:
	bpl.s	Lfe309e
	neg.l	d6
	beq.s	Lfe308e
Lfe309e:
	andi.l	#$80000000,d7
	move.l	d7,(a3)
	move.l	d6,d4
	move.w	#$401e,d2
Lfe30ac:
	btst.l	#$1f,d4
	bne.s	Lfe30ba
	add.l	d4,d4
	dbra.w	d2,Lfe30ac
	bra.s	Lfe308e
Lfe30ba:
	move.l	d4,($0004,a3)
	clr.l	($0008,a3)
	or.w	d2,(a3)
	clr.w	($0002,a3)
	movea.l	(a7)+,a3
	rts

Lfe30cc:
	move.l	a3,-(a7)
	lea.l	($1860,a6),a3
	cmpi.w	#$401d,(a3)
	bgt.s	Lfe3148
	bne.s	Lfe30ee
	cmpi.l	#$fffffffe,($0004,a3)
	bhi.s	Lfe3148
	bne.s	Lfe3106
	tst.l	($0008,a3)
	bne.s	Lfe3148
	bra.s	Lfe3106
Lfe30ee:
	cmpi.w	#$c01e,(a3)
	bhi.s	Lfe3156
	bne.s	Lfe3106
	cmpi.l	#$80000000,($0004,a3)
	bne.s	Lfe3156
	tst.l	($0008,a3)
	bne.s	Lfe3156
Lfe3106:
	move.w	(a3),d1
	move.l	($0004,a3),d5
	move.l	($0008,a3),d6
	andi.w	#$7fff,d1
	beq.s	Lfe315e
	addq.l	#1,d5
	bcc.s	Lfe311e
	roxr.l	#1,d5
	addq.w	#1,d1
Lfe311e:
	subi.w	#$401e,d1
	bmi.s	Lfe3132
	subq.w	#1,d1
	bmi.s	Lfe313c
Lfe3128:
	add.l	d6,d6
	addx.l	d5,d5
	dbra.w	d1,Lfe3128
	bra.s	Lfe313c
Lfe3132:
	neg.w	d1
	cmpi.w	#$0020,d1
	bcc.s	Lfe315e
	lsr.l	d1,d5
Lfe313c:
	tst.w	(a3)
	bpl.s	Lfe3142
	neg.l	d5
Lfe3142:
	move.l	d5,d6
	movea.l	(a7)+,a3
	rts

Lfe3148:
	move.l	#$7fffffff,d6
Lfe314e:
	ori.b	#$01,ccr
	movea.l	(a7)+,a3
	rts

Lfe3156:
	move.l	#$80000000.l,d6
	bra.s	Lfe314e
Lfe315e:
	clr.l	d6
	movea.l	(a7)+,a3
	rts

Lfe3164:
	move.l	a3,-(a7)
	lea.l	($1860,a6),a3
	move.l	d6,d4
	move.l	d6,d5
	clr.l	d6
	andi.l	#$80000000,d5
	move.l	d5,(a3)
	move.l	d4,d0
	swap.w	d0
	andi.w	#$7f80,d0
	beq.s	Lfe31b2
	lsr.w	#7,d0
	cmpi.w	#$00ff,d0
	beq.s	Lfe31bc
	subi.w	#$007f,d0
	addi.l	#$00003fff,d0
	swap.w	d0
	clr.w	d0
	or.l	d0,(a3)
	andi.l	#$007fffff,d4
	bset.l	#$17,d4
	lsl.l	#8,d4
	move.l	d4,($0004,a3)
	clr.l	($0008,a3)
	movea.l	(a7)+,a3
	rts

Lfe31b2:
	clr.l	(a3)+
	clr.l	(a3)+
	clr.l	(a3)
	movea.l	(a7)+,a3
	rts

Lfe31bc:
	move.l	#$7fff0000,(a3)+
	clr.l	(a3)+
	clr.l	(a3)
	movea.l	(a7)+,a3
	rts

Lfe31ca:
	move.l	a3,-(a7)
	lea.l	($1860,a6),a3
	move.l	(a3),d4
	move.l	($0004,a3),d5
	move.w	(a3),d0
	andi.l	#$80000000,d4
	andi.w	#$7fff,d0
	beq.s	Lfe321c
	subi.w	#$3fff,d0
	lsr.l	#7,d5
	addq.l	#1,d5
	btst.l	#$19,d5
	beq.s	Lfe31f6
	lsr.l	#1,d5
	addq.w	#1,d0
Lfe31f6:
	lsr.l	#1,d5
	bclr.l	#$17,d5
	cmpi.w	#$007f,d0
	bgt.s	Lfe3222
	cmpi.w	#$ff82,d0
	blt.s	Lfe321c
	addi.w	#$007f,d0
	lsl.w	#7,d0
	swap.w	d0
	clr.w	d0
	or.l	d0,d4
	or.l	d5,d4
	move.l	d4,d6
	movea.l	(a7)+,a3
	rts

Lfe321c:
	clr.l	d6
	movea.l	(a7)+,a3
	rts

Lfe3222:
	move.l	#$7f000000,d6
	ori.b	#$01,ccr
	movea.l	(a7)+,a3
	rts

Lfe3230:
	move.l	a3,-(a7)
	lea.l	($1860,a6),a3
	move.l	d5,d0
	andi.l	#$80000000,d0
	move.l	d0,(a3)
	move.l	d5,d0
	swap.w	d0
	andi.w	#$7ff0,d0
	beq.s	Lfe3282
	lsr.w	#4,d0
	cmpi.w	#$07ff,d0
	beq.s	Lfe328c
	subi.w	#$03ff,d0
	addi.l	#$00003fff,d0
	swap.w	d0
	clr.w	d0
	or.l	d0,(a3)
	andi.l	#$000fffff,d5
	bset.l	#$14,d5
	moveq.l	#$0a,d0
Lfe326e:
	add.l	d6,d6
	addx.l	d5,d5
	dbra.w	d0,Lfe326e
	move.l	d5,($0004,a3)
	move.l	d6,($0008,a3)
	movea.l	(a7)+,a3
	rts

Lfe3282:
	clr.l	(a3)+
	clr.l	(a3)+
	clr.l	(a3)
	movea.l	(a7)+,a3
	rts

Lfe328c:
	move.l	#$7fff0000,(a3)+
	clr.l	(a3)+
	clr.l	(a3)
	movea.l	(a7)+,a3
	rts

Lfe329a:
	move.l	a3,-(a7)
	lea.l	($1860,a6),a3
	move.l	(a3),d4
	move.l	($0004,a3),d5
	move.l	($0008,a3),d6
	move.w	(a3),d0
	andi.l	#$80000000,d4
	andi.w	#$7fff,d0
	beq.s	Lfe32fe
	subi.w	#$3fff,d0
	moveq.l	#$09,d1
Lfe32be:
	lsr.l	#1,d5
	roxr.l	#1,d6
	dbra.w	d1,Lfe32be
	clr.l	d1
	addq.l	#1,d6
	addx.l	d1,d5
	btst.l	#$16,d5
	beq.s	Lfe32d8
	lsr.l	#1,d5
	roxr.l	#1,d6
	addq.w	#1,d0
Lfe32d8:
	lsr.l	#1,d5
	roxr.l	#1,d6
	bclr.l	#$14,d5
	cmpi.w	#$03ff,d0
	bgt.s	Lfe3306
	cmpi.w	#$fc02,d0
	blt.s	Lfe32fe
	addi.w	#$03ff,d0
	lsl.w	#4,d0
	swap.w	d0
	clr.w	d0
	or.l	d0,d5
	or.l	d4,d5
	movea.l	(a7)+,a3
	rts

Lfe32fe:
	clr.l	d5
	clr.l	d6
	movea.l	(a7)+,a3
	rts

Lfe3306:
	move.l	#$7ff00000,d5
	clr.l	d6
	ori.b	#$01,ccr
	movea.l	(a7)+,a3
	rts

Lfe3316:
	movem.l	d1-d2,-(a7)
	move.w	($00a0,a6),d0
	moveq.l	#$00,d2
	move.w	d0,ccr
	shi.b	d1
	and.w	#$0001,d1
	or.w	d1,d2
	move.w	d0,ccr
	sls.b	d1
	and.w	#$0002,d1
	or.w	d1,d2
	move.w	d0,ccr
	scc.b	d1
	and.w	#$0004,d1
	or.w	d1,d2
	move.w	d0,ccr
	scs.b	d1
	and.w	#$0008,d1
	or.w	d1,d2
	move.w	d0,ccr
	sne.b	d1
	and.w	#$0010,d1
	or.w	d1,d2
	move.w	d0,ccr
	seq.b	d1
	and.w	#$0020,d1
	or.w	d1,d2
	move.w	d0,ccr
	svc.b	d1
	ext.w	d1
	and.w	#$0040,d1
	or.w	d1,d2
	move.w	d0,ccr
	svs.b	d1
	ext.w	d1
	and.w	#$0080,d1
	or.w	d1,d2
	move.w	d0,ccr
	spl.b	d1
	ext.w	d1
	and.w	#$0100,d1
	or.w	d1,d2
	move.w	d0,ccr
	smi.b	d1
	ext.w	d1
	and.w	#$0200,d1
	or.w	d1,d2
	move.w	d0,ccr
	sge.b	d1
	ext.w	d1
	and.w	#$0400,d1
	or.w	d1,d2
	move.w	d0,ccr
	slt.b	d1
	ext.w	d1
	and.w	#$0800,d1
	or.w	d1,d2
	move.w	d0,ccr
	sgt.b	d1
	ext.w	d1
	and.w	#$1000,d1
	or.w	d1,d2
	move.w	d0,ccr
	sle.b	d1
	ext.w	d1
	and.w	#$2000,d1
	or.w	d1,d2
	move.w	d0,ccr
	scc.b	d1
	ext.w	d1
	and.w	#$4000,d1
	or.w	d1,d2
	move.w	d0,ccr
	scs.b	d1
	ext.w	d1
	and.w	#$8000,d1
	or.w	d1,d2
	move.l	d2,d0
	movem.l	(a7)+,d1-d2
	rts

Lfe33dc:
	movem.l	d0-d3,-(a7)
	bsr.w	Lfe3316
	lea.l	(Lfe343e,pc),a1
	move.l	d0,d2
	moveq.l	#$00,d3
Lfe33ec:
	move.b	(a1),d0
	jsr	($00fd9004)
	move.b	($0001,a1),d0
	jsr	($00fd9004)
	moveq.l	#$3a,d0
	jsr	($00fd9004)
	moveq.l	#$30,d0
	btst.l	d3,d2
	beq.s	Lfe340e
	moveq.l	#$31,d0
Lfe340e:
	jsr	($00fd9004)
	moveq.l	#$20,d0
	jsr	($00fd9004)
	tst.w	($030a,a6)
	beq.s	Lfe342e
	cmp.w	#$0007,d3
	bne.s	Lfe342e
	jsr	($00fd8ece)
Lfe342e:
	addq.l	#2,a1
	addq.w	#1,d3
	cmp.w	#$0010,d3
	bcs.s	Lfe33ec
	movem.l	(a7)+,d0-d3
	rts

Lfe343e:
	.dc.b	'HILSCCCSNEEQVCVSPLMIGELTGTLEHSLOMicro Processor Unit:',$00
Lfe3474:
	.dc.b	'16bit MC68000',$00
Lfe3482:
	.dc.b	'32bit MC68030 with INTERNAL PMMU',$00
Lfe34a3:
	.dc.b	'32bit MC68EC030',$00
Lfe34b3:
	.dc.b	$0d,$0a
	.dc.b	'Floating Point Co Processor:',$00
Lfe34d2:
	.dc.b	'Softwere emulation.',$0d,$0a,$00
Lfe34e8:
	.dc.b	'MC68881/882',$0d,$0a,$00,$00
Lfe34f7:
	.dc.b	$fd,$8f,$ec,$fe,$92,$fe,$92,$ff
	.dc.b	$fe,$00,$fd,$8f,$f4,$ff,$00,$ff
	.dc.b	$00,$ff,$f6,$00,$fd,$8f,$fc,$fd
	.dc.b	$ea,$fd,$ea,$ff,$ee,$00,$fd,$90
	.dc.b	$04,$fe,$7e,$fe,$7e,$ff,$e6,$00
	.dc.b	$fd,$90,$0c,$fe,$8c,$fe,$8c,$ff
	.dc.b	$de,$00,$fd,$90,$14,$fe,$d2,$fe
	.dc.b	$d2,$ff,$d6,$00,$00,$ff,$ff,$00
	.dc.b	$00,$ff,$ff,$01,$88,$01,$89,$01
	.dc.b	$8e,$01,$93,$01,$98,$01,$9d,$01
	.dc.b	$a3,$01,$a7,$01,$ac,$01,$b1,$01
	.dc.b	$b6,$01,$b7,$01,$bc,$01,$c1,$01
	.dc.b	$c6,$01,$cc,$01,$d0,$01,$d4,$01
	.dc.b	$da,$01,$de,$01,$e3,$01,$e7,$01
	.dc.b	$e8,$01,$ec,$01,$f2,$01,$f6,$01
	.dc.b	$fb,$02,$00,$02,$05,$02,$09,$02
	.dc.b	$0d,$02,$12,$02,$16,$02,$1a,$02
	.dc.b	$1e,$02,$23,$02,$27,$02,$2c,$02
	.dc.b	$32,$02,$36,$02,$3a,$02,$3e,$02
	.dc.b	$43,$02,$48,$02,$4e,$02,$53,$02
	.dc.b	$58,$02,$5d,$02,$60,$02,$65,$02
	.dc.b	$6a,$02,$6e,$02,$81,$02,$85,$02
	.dc.b	$8a,$02,$8f,$02,$93,$02,$97,$02
	.dc.b	$9c,$02,$a1,$02,$a6,$02,$aa,$02
	.dc.b	$af,$02,$b4,$02,$b8,$02,$bc,$02
	.dc.b	$c0,$02,$c4,$02,$c8,$02,$cd,$02
	.dc.b	$d2,$02,$d6,$02,$da,$02,$ed,$02
	.dc.b	$f5,$02,$fb,$02,$ff,$03,$04,$03
	.dc.b	$09,$03,$0d,$03,$12,$03,$18,$03
	.dc.b	$1d,$03,$22,$03,$26,$03,$2c,$03
	.dc.b	$32,$03,$38,$03,$3d,$03,$42,$03
	.dc.b	$48,$03,$4f,$03,$55,$03,$5c,$03
	.dc.b	$62,$03,$68,$03,$6e,$03,$74,$03
	.dc.b	$7c,$03,$83,$03,$89,$03,$90,$03
	.dc.b	$96,$03,$9c,$03,$a0,$03,$a3,$03
	.dc.b	$a9,$03,$ac,$03,$b2,$03,$bb,$03
	.dc.b	$c3,$03,$c4,$03,$c8,$03,$cc,$03
	.dc.b	$d1,$03,$d8,$03,$dc,$03,$e1,$03
	.dc.b	$e9,$03,$ea,$03,$eb,$03,$ec,$03
	.dc.b	$f2,$03,$f7,$03,$fd,$04,$04,$04
	.dc.b	$0a,$04,$0b,$04,$13,$04,$14,$04
	.dc.b	$1c,$04,$22,$04,$28,$04,$29,$04
	.dc.b	$2f,$04,$36,$04,$3b,$04,$40,$04
	.dc.b	$46,$04,$4e,$04,$56,$04,$57,$04
	.dc.b	$5d,$04,$64,$04,$6a,$04,$6b,$04
	.dc.b	$70,$04,$76,$04,$7b,$04,$7c,$04
	.dc.b	$82,$04,$87,$04,$8f,$04,$97,$04
	.dc.b	$9c,$04,$a1,$04,$a6,$04,$ab,$04
	.dc.b	$b3,$04,$b8,$04,$bf,$04,$c7,$04
	.dc.b	$cc,$04,$cd,$04,$ce,$04,$cf,$04
	.dc.b	$d0,$04,$d1,$04,$d2,$04,$d3,$04
	.dc.b	$db,$04,$e3,$04,$eb,$04,$f3,$04
	.dc.b	$fb,$05,$03,$05,$0b,$05,$13,$05
	.dc.b	$18,$05,$19,$05,$1e,$05,$1f,$05
	.dc.b	$20,$05,$21,$05,$22,$05,$23,$05
	.dc.b	$2b,$05,$31,$05,$38,$05,$3c,$05
	.dc.b	$3f,$05,$45,$05,$4a,$05,$4d,$05
	.dc.b	$53,$05,$5c,$00,$62,$74,$73,$74
	.dc.b	$00,$62,$63,$68,$67,$00,$62,$63
	.dc.b	$6c,$72,$00,$62,$73,$65,$74,$00
	.dc.b	$6d,$6f,$76,$65,$70,$00,$6f,$72
	.dc.b	$69,$00,$61,$6e,$64,$69,$00,$73
	.dc.b	$75,$62,$69,$00,$61,$64,$64,$69
	.dc.b	$00,$00,$65,$6f,$72,$69,$00,$63
	.dc.b	$6d,$70,$69,$00,$6d,$6f,$76,$65
	.dc.b	$00,$6d,$6f,$76,$65,$61,$00,$63
	.dc.b	$68,$6b,$00,$6c,$65,$61,$00,$72
	.dc.b	$65,$73,$65,$74,$00,$6e,$6f,$70
	.dc.b	$00,$73,$74,$6f,$70,$00,$72,$74
	.dc.b	$65,$00,$00,$72,$74,$73,$00,$74
	.dc.b	$72,$61,$70,$76,$00,$72,$74,$72
	.dc.b	$00,$74,$72,$61,$70,$00,$6c,$69
	.dc.b	$6e,$6b,$00,$75,$6e,$6c,$6b,$00
	.dc.b	$6a,$73,$72,$00,$6a,$6d,$70,$00
	.dc.b	$6e,$65,$67,$78,$00,$63,$6c,$72
	.dc.b	$00,$6e,$65,$67,$00,$6e,$6f,$74
	.dc.b	$00,$6e,$62,$63,$64,$00,$70,$65
	.dc.b	$61,$00,$73,$77,$61,$70,$00,$6d
	.dc.b	$6f,$76,$65,$6d,$00,$65,$78,$74
	.dc.b	$00,$74,$73,$74,$00,$74,$61,$73
	.dc.b	$00,$61,$64,$64,$71,$00,$73,$75
	.dc.b	$62,$71,$00,$6d,$6f,$76,$65,$71
	.dc.b	$00,$73,$62,$63,$64,$00,$64,$69
	.dc.b	$76,$75,$00,$64,$69,$76,$73,$00
	.dc.b	$6f,$72,$00,$73,$75,$62,$78,$00
	.dc.b	$73,$75,$62,$61,$00,$73,$75,$62
	.dc.b	$00,$6c,$69,$6e,$65,$20,$31,$30
	.dc.b	$31,$30,$20,$65,$6d,$75,$6c,$61
	.dc.b	$74,$6f,$72,$00,$63,$6d,$70,$00
	.dc.b	$63,$6d,$70,$61,$00,$63,$6d,$70
	.dc.b	$6d,$00,$65,$6f,$72,$00,$65,$78
	.dc.b	$67,$00,$61,$62,$63,$64,$00,$6d
	.dc.b	$75,$6c,$75,$00,$6d,$75,$6c,$73
	.dc.b	$00,$61,$6e,$64,$00,$61,$64,$64
	.dc.b	$78,$00,$61,$64,$64,$61,$00,$61
	.dc.b	$64,$64,$00,$61,$73,$6c,$00,$61
	.dc.b	$73,$72,$00,$6c,$73,$6c,$00,$6c
	.dc.b	$73,$72,$00,$72,$6f,$78,$6c,$00
	.dc.b	$72,$6f,$78,$72,$00,$72,$6f,$6c
	.dc.b	$00,$72,$6f,$72,$00,$6c,$69,$6e
	.dc.b	$65,$20,$31,$31,$31,$31,$20,$65
	.dc.b	$6d,$75,$6c,$61,$74,$6f,$72,$00
	.dc.b	$69,$6c,$6c,$65,$67,$61,$6c,$00
	.dc.b	$63,$61,$6c,$6c,$6d,$00,$72,$74
	.dc.b	$6d,$00,$63,$6d,$70,$32,$00,$63
	.dc.b	$68,$6b,$32,$00,$63,$61,$73,$00
	.dc.b	$63,$61,$73,$32,$00,$6d,$6f,$76
	.dc.b	$65,$73,$00,$62,$6b,$70,$74,$00
	.dc.b	$65,$78,$74,$62,$00,$72,$74,$64
	.dc.b	$00,$6d,$6f,$76,$65,$63,$00,$64
	.dc.b	$69,$76,$75,$6c,$00,$64,$69,$76
	.dc.b	$73,$6c,$00,$70,$61,$63,$6b,$00
	.dc.b	$75,$6e,$70,$6b,$00,$62,$66,$74
	.dc.b	$73,$74,$00,$62,$66,$65,$78,$74
	.dc.b	$75,$00,$62,$66,$63,$68,$67,$00
	.dc.b	$62,$66,$65,$78,$74,$73,$00,$62
	.dc.b	$66,$63,$6c,$72,$00,$62,$66,$66
	.dc.b	$66,$6f,$00,$62,$66,$73,$65,$74
	.dc.b	$00,$62,$66,$69,$6e,$73,$00,$70
	.dc.b	$66,$6c,$75,$73,$68,$72,$00,$70
	.dc.b	$76,$61,$6c,$69,$64,$00,$70,$6c
	.dc.b	$6f,$61,$64,$00,$70,$66,$6c,$75
	.dc.b	$73,$68,$00,$70,$6d,$6f,$76,$65
	.dc.b	$00,$70,$74,$65,$73,$74,$00,$70
	.dc.b	$64,$62,$00,$70,$73,$00,$70,$74
	.dc.b	$72,$61,$70,$00,$70,$62,$00,$70
	.dc.b	$73,$61,$76,$65,$00,$70,$72,$65
	.dc.b	$73,$74,$6f,$72,$65,$00,$70,$6d
	.dc.b	$6f,$76,$65,$66,$64,$00,$00,$47
	.dc.b	$45,$4e,$00,$53,$63,$63,$00,$44
	.dc.b	$42,$63,$63,$00,$54,$52,$41,$50
	.dc.b	$63,$63,$00,$42,$63,$63,$00,$53
	.dc.b	$41,$56,$45,$00,$52,$45,$53,$54
	.dc.b	$4f,$52,$45,$00,$00,$00,$00,$66
	.dc.b	$6d,$6f,$76,$65,$00,$66,$69,$6e
	.dc.b	$74,$00,$66,$73,$69,$6e,$68,$00
	.dc.b	$66,$69,$6e,$74,$72,$7a,$00,$66
	.dc.b	$73,$71,$72,$74,$00,$00,$66,$6c
	.dc.b	$6f,$67,$6e,$70,$31,$00,$00,$66
	.dc.b	$65,$74,$6f,$78,$6d,$31,$00,$66
	.dc.b	$74,$61,$6e,$68,$00,$66,$61,$74
	.dc.b	$61,$6e,$00,$00,$66,$61,$73,$69
	.dc.b	$6e,$00,$66,$61,$74,$61,$6e,$68
	.dc.b	$00,$66,$73,$69,$6e,$00,$66,$74
	.dc.b	$61,$6e,$00,$66,$65,$74,$6f,$78
	.dc.b	$00,$66,$74,$77,$6f,$74,$6f,$78
	.dc.b	$00,$66,$74,$65,$6e,$74,$6f,$78
	.dc.b	$00,$00,$66,$6c,$6f,$67,$6e,$00
	.dc.b	$66,$6c,$6f,$67,$31,$30,$00,$66
	.dc.b	$6c,$6f,$67,$32,$00,$00,$66,$61
	.dc.b	$62,$73,$00,$66,$63,$6f,$73,$68
	.dc.b	$00,$66,$6e,$65,$67,$00,$00,$66
	.dc.b	$61,$63,$6f,$73,$00,$66,$63,$6f
	.dc.b	$73,$00,$66,$67,$65,$74,$65,$78
	.dc.b	$70,$00,$66,$67,$65,$74,$6d,$61
	.dc.b	$6e,$00,$66,$64,$69,$76,$00,$66
	.dc.b	$6d,$6f,$64,$00,$66,$61,$64,$64
	.dc.b	$00,$66,$6d,$75,$6c,$00,$66,$73
	.dc.b	$67,$6c,$64,$69,$76,$00,$66,$72
	.dc.b	$65,$6d,$00,$66,$73,$63,$61,$6c
	.dc.b	$65,$00,$66,$73,$67,$6c,$6d,$75
	.dc.b	$6c,$00,$66,$73,$75,$62,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$66,$73
	.dc.b	$69,$6e,$63,$6f,$73,$00,$66,$73
	.dc.b	$69,$6e,$63,$6f,$73,$00,$66,$73
	.dc.b	$69,$6e,$63,$6f,$73,$00,$66,$73
	.dc.b	$69,$6e,$63,$6f,$73,$00,$66,$73
	.dc.b	$69,$6e,$63,$6f,$73,$00,$66,$73
	.dc.b	$69,$6e,$63,$6f,$73,$00,$66,$73
	.dc.b	$69,$6e,$63,$6f,$73,$00,$66,$73
	.dc.b	$69,$6e,$63,$6f,$73,$00,$66,$63
	.dc.b	$6d,$70,$00,$00,$66,$74,$73,$74
	.dc.b	$00,$00,$00,$00,$00,$00,$66,$6d
	.dc.b	$6f,$76,$65,$63,$72,$00,$66,$6d
	.dc.b	$6f,$76,$65,$00,$66,$6d,$6f,$76
	.dc.b	$65,$6d,$00,$66,$64,$62,$00,$66
	.dc.b	$73,$00,$66,$74,$72,$61,$70,$00
	.dc.b	$66,$6e,$6f,$70,$00,$66,$62,$00
	.dc.b	$66,$73,$61,$76,$65,$00,$66,$72
	.dc.b	$65,$73,$74,$6f,$72,$65,$00,$66
	.dc.b	$62,$72,$61,$00,$54,$68,$69,$73
	.dc.b	$20,$70,$72,$6f,$67,$72,$61,$6d
	.dc.b	$20,$69,$73,$20,$74,$68,$65,$20
	.dc.b	$70,$72,$6f,$70,$65,$72,$74,$79
	.dc.b	$20,$6f,$66,$20,$4b,$55,$4d,$41
	.dc.b	$20,$4c,$41,$42,$2e,$00,$01,$01
	.dc.b	$01,$01,$02,$02,$02,$02,$02,$00
	.dc.b	$02,$02,$02,$02,$02,$03,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$02
	.dc.b	$02,$03,$03,$02,$02,$02,$02,$02
	.dc.b	$03,$02,$02,$02,$02,$01,$02,$02
	.dc.b	$03,$02,$02,$02,$02,$01,$02,$02
	.dc.b	$00,$02,$02,$02,$02,$02,$02,$02
	.dc.b	$02,$02,$01,$02,$02,$02,$02,$02
	.dc.b	$02,$02,$02,$02,$02,$00,$00,$02
	.dc.b	$02,$02,$02,$02,$02,$03,$00,$03
	.dc.b	$02,$03,$03,$03,$04,$04,$01,$01
	.dc.b	$01,$01,$01,$01,$01,$01,$03,$03
	.dc.b	$03,$03,$03,$03,$03,$03,$03,$03
	.dc.b	$03,$03,$00,$00,$03,$01,$03,$03
	.dc.b	$03,$03,$03,$00,$00,$00,$03,$03
	.dc.b	$03,$03,$03,$00,$03,$00,$03,$03
	.dc.b	$03,$00,$03,$03,$03,$03,$03,$03
	.dc.b	$03,$00,$03,$03,$03,$00,$03,$03
	.dc.b	$03,$00,$03,$03,$03,$03,$03,$03
	.dc.b	$03,$03,$03,$03,$03,$03,$03,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$03,$03
	.dc.b	$03,$03,$03,$03,$03,$03,$03,$00
	.dc.b	$03,$00,$00,$00,$00,$00,$03,$03
	.dc.b	$03,$03,$03,$03,$03,$03,$03,$03
	.dc.b	$03,$0d,$0a,$41,$62,$6f,$72,$74
	.dc.b	$65,$64,$20,$62,$79,$20,$6e,$6f
	.dc.b	$6e,$2d,$6d,$61,$73,$6b,$61,$62
	.dc.b	$6c,$65,$20,$69,$6e,$74,$65,$72
	.dc.b	$72,$75,$70,$74,$00
Lfe3bac:
	.dc.b	'Illegal stack format number',$0d,$0a,$00
Lfe3bca:
	.dc.b	'Exceptional abort by ',$00
Lfe3be0:
	.dc.b	' at ',$00
Lfe3be5:
	.dc.b	', SR=',$00
Lfe3beb:
	.dc.b	' By memory access of ',$00
Lfe3c01:
	.dc.b	'system status =  I/N=',$00
Lfe3c17:
	.dc.b	' R/W=',$00
Lfe3c1d:
	.dc.b	' FC=',$00
Lfe3c22:
	.dc.b	'Stack format #1, Throwaway four word stack frame',$0d,$0a,$00
Lfe3c55:
	.dc.b	'Coprocessor mid-instruction exception stack frame',$0d,$0a,$00
Lfe3c89:
	.dc.b	'double exception in system status display',$0d,$0a,$00
Lfe3cb5:
	.dc.b	'Short bus cycle fault stack frame',$0d,$0a,$00
Lfe3cd9:
	.dc.b	'Long bus cycle fault stack frame',$0d,$0a,$00
Lfe3cfc:
	.dc.b	' ,RM cycle',$00
Lfe3d07:
	.dc.b	' Access size=',$00
Lfe3d15:
	.dc.b	'long',$00
Lfe3d1a:
	.dc.b	'byte',$00
Lfe3d1f:
	.dc.b	'word',$00
Lfe3d24:
	.dc.b	'3 byte',$00,$00
Lfe3d2c:
	.dc.b	$00,$fe,$0a,$48,$00,$fe,$0a,$9e
	.dc.b	$00,$fe,$0a,$f8,$00,$fe,$0b,$5a
	.dc.b	$00,$fe,$0b,$b2,$00,$fe,$0c,$16
	.dc.b	$00,$00,$00,$00,$00,$fe,$0c,$e8
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$fe,$0d,$fa,$00,$fe,$0e,$5c
	.dc.b	$00,$fe,$0e,$c8,$00,$fe,$0f,$22
	.dc.b	$00,$fe,$0d,$fa,$00,$fe,$0d,$fa
	.dc.b	$00,$fe,$0d,$fa,$00,$fe,$0d,$fa
	.dc.b	$00,$fe,$0d,$fa,$00,$fe,$0d,$fa
	.dc.b	$00,$fe,$0d,$fa,$00,$fe,$0d,$fa
	.dc.b	$00,$fe,$0f,$8e,$00,$fe,$0f,$ee
	.dc.b	$00,$fe,$10,$4e,$00,$fe,$10,$ae
	.dc.b	$00,$fe,$11,$0e,$00,$fe,$11,$6e
	.dc.b	$00,$fe,$11,$ce,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
Lfe3db4:
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$fe,$12,$fa,$00,$fe,$13,$70
	.dc.b	$00,$fe,$13,$d0,$00,$fe,$14,$30
	.dc.b	$00,$fe,$14,$8c,$00,$fe,$14,$ec
	.dc.b	$00,$fe,$15,$46,$00,$fe,$0d,$fa
	.dc.b	$00,$fe,$15,$a6,$00,$fe,$16,$06
	.dc.b	$00,$fe,$16,$6a,$00,$fe,$0d,$fa
	.dc.b	$00,$fe,$0d,$fa,$00,$fe,$0d,$fa
	.dc.b	$00,$fe,$0d,$fa,$00,$fe,$0d,$fa
Lfe3e24:
	.dc.b	' in debugger',$0d,$0a,$00,$00
Lfe3e34:
	.dcb.b	49612,$ff
Lff0000:
	.dc.l	$00002000
Lff0008:
	.dc.b	$00,$fd,$38,$00
Lff000c:
	.dc.b	$00,$fc,$02,$00,$00,$fc,$e0,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$ff,$93,$5a
	.dc.b	$00,$ff,$93,$40,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00
Call_ROMVER:
	move.l	#$13921127,d0
	rts

Start:
	move.w	#$2700,sr
	lea.l	($2000),a7
	reset
	moveq.l	#$00,d5
	cmp.l	(Lff1af6,pc),d0
	bne.s	Lff0052
	cmp.l	(Lff1afa,pc),d1
	bne.s	Lff0052
	moveq.l	#$ff,d5
Lff0052:
	move.l	($0030),d6
	lsl.l	#8,d6
	lsr.l	#8,d6
	bsr.w	Lff0d3e
	move.l	d0,d7
	tst.b	d7
	beq.s	Lff0074
	moveq.l	#$00,d0
	movec.l	d0,vbr
	cmpi.b	#$01,d7
	beq.s	Lff0074
	movec.l	d0,cacr
Lff0074:
	suba.l	a0,a0
	lea.l	(DefaultExceptionHandler,pc),a1
	bsr.w	Lff072e
	lea.l	(Lff0746,pc),a1
	move.l	a1,($007c)
	lea.l	(Call_Unused,pc),a1
	bsr.w	Lff072e
	lea.l	(Lff0000,pc),a0
	move.l	a0,d2
	lea.l	(VecTable,pc),a0
	lea.l	($0400),a1
	move.w	#$00df,d0
Lff00a0:
	moveq.l	#$00,d1
	move.w	(a0)+,d1
	add.l	d2,d1
	move.l	d1,(a1)+
	dbra.w	d0,Lff00a0
	lea.l	(Lff07be,pc),a0
	move.l	a0,($07fc)
	lea.l	(Lff03f2,pc),a0
	move.l	a0,($07f8)
	lea.l	(Lff07cc,pc),a0
	move.l	a0,($07f4)
	move.l	(Lff934e),d0
	move.l	d0,($07d4)
	lea.l	($00ed0000),a0
	lea.l	(Lff09e8,pc),a1
	moveq.l	#$07,d0
Lff00da:
	cmpm.b	(a0)+,(a1)+
	dbne.w	d0,Lff00da
	beq.s	Lff0112
	move.b	#$31,($00e8e00d)
	lea.l	($00ed0000),a0
	movea.l	a0,a1
	moveq.l	#$3f,d0
Lff00f4:
	clr.l	(a1)+
	dbra.w	d0,Lff00f4
	lea.l	(Lff09e8,pc),a1
	moveq.l	#$5a,d0
Lff0100:
	move.b	(a1)+,(a0)+
	dbra.w	d0,Lff0100
	clr.w	($00ed0100)
	clr.b	($00e8e00d)
Lff0112:
	move.b	($0cc3),d5
	bsr.w	Lff1450
	lea.l	($0cbc),a0
	move.b	d7,(a0)+
	tst.w	d7
	smi.b	(a0)+
	tst.l	d7
	smi.b	(a0)+
	lea.l	(DefaultExceptionHandler,pc),a1
	cmp.l	a1,d6
	seq.b	(a0)
	tst.l	d5
	bpl.s	Lff013c
	move.b	#$fe,(a0)
	move.b	d5,($0cc3)
Lff013c:
	cmpi.b	#$01,($0cbc)
	bls.s	Lff0152
	clr.b	($00e8e009)
	move.w	#$2101,d0
	movec.l	d0,cacr
Lff0152:
	bsr.w	Lff0c4e
	move.l	d0,d2
	lea.l	($0cb6),a0
	moveq.l	#$ff,d1
	move.b	($00e8e00b),d1
	move.b	d1,d0
	lsl.w	#4,d1
	move.b	d0,d1
	or.b	#$f0,d1
	not.w	d1
	move.w	d1,(a0)+
	bne.s	Lff017c
	move.l	#$034203d3,(a0)
	bra.s	Lff018e
Lff017c:
	move.l	#$056e066d,(a0)
	tst.b	($0cbc)
	beq.s	Lff018e
	move.l	#$104d104d,(a0)
Lff018e:
	tst.w	d2
	beq.s	Lff019c
	swap.w	d2
	tst.w	d2
	beq.s	Lff019c
	swap.w	d2
	move.l	d2,(a0)
Lff019c:
	bsr.w	Lff163a
	move.w	#$2000,sr
	bsr.w	Lff05be
	move.b	($00ed0028),($00e8e001)
	clr.b	($00e86001)
	move.b	#$04,($00e8a01f)
	tst.b	($00e9a001)
	tst.b	($00e9a001)
	move.b	#$08,($00e8a01b)
	btst.b	#$07,($0807)
	beq.s	Lff0252
	lea.l	($00e82200),a1
	lea.l	(Lff0a16,pc),a0
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
	bsr.w	Lff07e8
	lea.l	(Lff0b8a,pc),a1
	bsr.w	Lff0728
	lea.l	($0800),a1
Lff021e:
	btst.b	#$07,($0005,a1)
	bne.w	Start
	btst.b	#$06,($0002,a1)
	beq.s	Lff021e
	move.b	#$31,($00e8e00d)
	lea.l	($00ed0000),a0
	move.w	#$0fff,d0
Lff0242:
	clr.l	(a0)+
	dbra.w	d0,Lff0242
	clr.b	($00e8e00d)
	bra.w	Start
Lff0252:
	moveq.l	#$13,d1
	lea.l	($0800),a1
	btst.b	#$05,($0005,a1)
	bne.s	Lff026a
	moveq.l	#$10,d1
	btst.b	#$07,($0005,a1)
	beq.s	Lff0282
Lff026a:
	move.b	#$31,($00e8e00d)
	move.b	d1,($00ed001d)
	clr.b	($00e8e00d)
	IOCS	_CRTMOD
Lff0282:
	bsr.w	Lff0e76
	clr.b	($09de)
	move.b	($080e),d0
	move.b	($00ed0058),d1
	eor.b	d1,d0
	btst.l	#$03,d0
	beq.s	Lff02a8
	move.b	#$01,($09de)
	movea.l	(Lff0008,pc),a0
	jsr	(a0)
Lff02a8:
	moveq.l	#$02,d1
	moveq.l	#$ac,d0
	trap	#15
	bsr.w	Lff1758
	lea.l	(Lff0b88,pc),a1
	bsr.w	Lff0728
	btst.b	#$01,($080e)
	beq.s	Lff02de
	lea.l	(Lff051e,pc),a1
	move.w	#$9000,d1
	jsr	(a1)
	move.w	#$9100,d1
	jsr	(a1)
	move.w	#$9200,d1
	jsr	(a1)
	move.w	#$9300,d1
	jsr	(a1)
Lff02de:
	cmpi.b	#$02,($09df)
	bne.s	Lff0300
	movea.l	($00ed001e),a0
	move.l	a0,d0
	beq.s	Lff0300
	cmpi.b	#$60,(a0)
	bne.s	Lff0300
	bsr.w	Lff080a
	jsr	(a0)
	bra.w	Lff1a16
Lff0300:
	move.w	($00ed0092),d0
	bne.s	Lff030c
	move.w	#$0a04,d0
Lff030c:
	lea.l	($0800),a1
	btst.b	#$01,($000b,a1)
	bne.s	Lff033c
	btst.b	#$00,($000b,a1)
	bne.s	Lff0328
	tst.b	($000a,a1)
	bpl.s	Lff0360
	lsr.w	#8,d0
Lff0328:
	cmpi.b	#$01,($0cbc)
	bls.s	Lff033c
	move.b	d0,($00e8e009)
	moveq.l	#$00,d0
	movec.l	d0,cacr
Lff033c:
	movea.l	(Lff000c,pc),a0
	move.l	($0002,a0),d0
	add.l	($0006,a0),d0
	lea.l	($001c,a0),a0
	lea.l	($6800),a1
Lff0350:
	move.b	(a0)+,(a1)+
	subq.l	#1,d0
	bne.s	Lff0350
	move.b	#$90,($09e0)
	jmp	($6800)

Lff0360:
	cmpi.b	#$01,($0cbc)
	bls.s	Lff0386
	btst.b	#$06,($000a,a1)
	bne.s	Lff037a
	btst.b	#$05,($000a,a1)
	beq.s	Lff0386
	lsr.w	#8,d0
Lff037a:
	move.b	d0,($00e8e009)
	moveq.l	#$00,d0
	movec.l	d0,cacr
Lff0386:
	move.w	($00ed0018),d1
	beq.s	Lff03ac
	btst.b	#$02,($000e,a1)
	bne.s	Lff03ac
	move.w	d1,d0
	and.w	#$f000,d0
	rol.w	#4,d0
	subq.w	#8,d0
	beq.s	Lff03d8
	subq.w	#2,d0
	bcs.s	Lff03ce
	beq.s	Lff03de
	subq.w	#1,d0
	beq.s	Lff03e2
Lff03ac:
	bsr.w	Lff0524
	bsr.w	Lff04a8
	bsr.w	Lff045e
	bsr.w	Lff048e
	bra.s	Lff03f2
Lff03be:
	move.w	d1,-(a7)
	moveq.l	#$05,d2
	bsr.s	Lff03e8
	move.w	(a7)+,d1
	lea.l	(Lff0b88,pc),a1
	bsr.w	Lff0728
Lff03ce:
	bsr.w	Lff04fa
	bsr.w	Lff0544
	bra.s	Lff03ac
Lff03d8:
	bsr.w	Lff04be
	bra.s	Lff03ac
Lff03de:
	bsr.s	Lff045e
	bra.s	Lff03ac
Lff03e2:
	bsr.w	Lff048e
	bra.s	Lff03ac
Lff03e8:
	move.w	#$9070,d1
	IOCS	_B_DRVCHK
	rts

Lff03f2:
	bsr.w	Lff07e8
	lea.l	($2000),a7
	tst.b	($09de)
	bne.s	Lff0446
	lea.l	(Lff0a90,pc),a1
	bsr.w	Lff0728
	bset.b	#$00,($00e8002a)
	lea.l	(Lff0820,pc),a1
	move.w	(Lff09e4,pc),d1
	move.w	(Lff09e6,pc),d2
	IOCS	_TEXTPUT
	bclr.b	#$00,($00e8002a)
	moveq.l	#$04,d2
	bsr.s	Lff03e8
Lff042c:
	move.w	#$9070,d1
Lff0430:
	IOCS	_B_DRVSNS
	btst.l	#$1d,d0
	bne.s	Lff03be
	add.w	#$0100,d1
	cmp.w	#$9470,d1
	bne.s	Lff0430
	bra.s	Lff042c
Lff0446:
	lea.l	(Lff0a43,pc),a1
	bsr.w	Lff0728
	move.w	#$007c,-(a7)
	pea.l	(Start,pc)
	move.w	sr,-(a7)
	move.l	($007c),-(a7)
	rts

Lff045e:
	movea.l	($00ed000c),a0
	movea.l	a7,a6
	lea.l	(Lff0486,pc),a1
	movea.l	($0008),a2
	move.l	a1,($0008)
	movea.l	(a0),a3
	move.l	a2,($0008)
	move.b	#$01,($09e0)
	bsr.w	Lff080a
	jsr	(a3)
	rts

Lff0486:
	movea.l	a6,a7
	move.l	a2,($0008)
	rts

Lff048e:
	movea.l	($00ed0010),a0
	cmpi.b	#$60,(a0)
	bne.s	Lff04a6
	move.b	#$02,($09e0)
	bsr.w	Lff080a
	jsr	(a0)
Lff04a6:
	rts

Lff04a8:
	move.w	#$8000,d1
Lff04ac:
	bsr.s	Lff04be
	tst.b	d0
	bne.s	Lff04bc
	add.w	#$0100,d1
	cmp.w	#$9000,d1
	bne.s	Lff04ac
Lff04bc:
	rts

Lff04be:
	moveq.l	#$00,d2
	move.l	#$00000400,d3
	lea.l	($2000),a1
	IOCS	_B_RECALI
	tst.b	d0
	bne.s	Lff04f0
	moveq.l	#$46,d0
	move.l	a1,-(a7)
	trap	#15
	movea.l	(a7)+,a1
	tst.b	d0
	bne.s	Lff04f0
	cmpi.b	#$60,(a1)
	bne.s	Lff04f0
	lsr.w	#8,d1
	move.b	d1,($09e0)
	bsr.w	Lff080a
	jmp	(a1)

Lff04f0:
	move.l	d0,-(a7)
	IOCS	_B_EJECT
	move.l	(a7)+,d0
	rts

Lff04fa:
	movem.l	d0-d2,-(a7)
	move.w	#$015d,d2
Lff0502:
	move.l	#$000000c8,d0
	bsr.w	Lff0d12
	IOCS	_B_DRVSNS
	btst.l	#$1d,d0
	dbne.w	d2,Lff0502
	movem.l	(a7)+,d0-d2
	rts

Lff051e:
	IOCS	_B_EJECT
	rts

Lff0524:
	move.w	#$9070,d1
	bsr.s	Lff04fa
	lea.l	(Lff0544,pc),a1
	bsr.s	Lff0544
	move.w	#$9170,d1
	bsr.s	Lff0544
	move.w	#$9270,d1
	bsr.s	Lff0544
	move.w	#$9370,d1
	bsr.s	Lff0544
	rts

Lff0544:
	moveq.l	#$01,d2
	move.l	#$00000400,d3
	lea.l	($2000),a1
	movem.l	d1-d4/a1,-(a7)
	move.w	#$013f,d4
Lff0558:
	IOCS	_B_DRVSNS
	btst.l	#$1d,d0
	dbne.w	d4,Lff0558
	beq.s	Lff05b4
	IOCS	_B_RECALI
	btst.l	#$1e,d0
	bne.s	Lff05b4
	IOCS	_B_READID
	btst.l	#$1e,d0
	bne.s	Lff05b4
	move.w	d1,d0
	lsr.w	#8,d0
	and.w	#$0003,d0
	lsl.w	#3,d0
	lea.l	($0c90),a0
	adda.w	d0,a0
	moveq.l	#$00,d0
	move.b	($0006,a0),d0
	ror.l	#8,d0
	or.l	d0,d2
	moveq.l	#$46,d0
	move.l	a1,-(a7)
	trap	#15
	movea.l	(a7)+,a1
	btst.l	#$1e,d0
	bne.s	Lff05b4
	cmpi.b	#$60,(a1)
	bne.s	Lff05b4
	lsr.w	#8,d1
	move.b	d1,($09e0)
	bsr.w	Lff080a
	jmp	(a1)

Lff05b4:
	IOCS	_B_EJECT
	movem.l	(a7)+,d1-d4/a1
	rts

Lff05be:
	move.l	#$ffffffff,($09d2)
	move.b	#$00,($00e8e001)
	lea.l	($00e88000),a0
	move.b	#$00,($0005,a0)
	move.w	(a0),d0
	btst.l	#$02,d0
	beq.w	Lff06e8
	btst.l	#$01,d0
	beq.w	Lff06ee
	btst.l	#$00,d0
	beq.s	Lff0612
Lff05f2:
	move.b	#$04,($00e8a01f)
	move.l	#$0000cb20,d0
	bsr.w	Lff0d12
	move.b	($00ed002a),d1
	IOCS	_TVCTRL
	bra.w	Lff1a16
Lff0612:
	tst.b	($00ed0026)
	bne.s	Lff05f2
	lea.l	($00e8a000),a0
	move.b	#$01,($001b,a0)
	tst.b	($00e9a001)
	tst.b	($00e9a001)
	move.b	#$05,($0001,a0)
	tst.b	($00e9a001)
	tst.b	($00e9a001)
	move.b	#$0c,($001b,a0)
	move.l	($00ed0014),($09d2)
	clr.l	($09d6)
	move.l	($00ed001e),d1
	beq.s	Lff06d2
	cmp.l	#$00000040,d1
	bcc.s	Lff06d2
	cmp.b	#$20,d1
	bcs.s	Lff067a
	and.b	#$1f,d1
	move.w	d1,-(a7)
	moveq.l	#$25,d1
	IOCS	_TVCTRL
	move.w	(a7)+,d1
Lff067a:
	IOCS	_TVCTRL
	lea.l	($00e88000),a0
Lff0684:
	move.w	(a0),d0
	btst.l	#$02,d0
	beq.s	Lff06e8
	btst.l	#$01,d0
	beq.s	Lff06ee
	btst.l	#$00,d0
	beq.s	Lff0684
	cmpi.l	#$ffffffff,($09d2)
	beq.s	Lff06ce
	move.b	#$04,($00e8a01f)
	tst.b	($00e9a001)
	tst.b	($00e9a001)
	move.b	#$08,($00e8a01b)
Lff06be:
	move.w	(a0),d0
	btst.l	#$02,d0
	beq.s	Lff06e8
	btst.l	#$01,d0
	beq.s	Lff06ee
	bra.s	Lff06be
Lff06ce:
	bra.w	Lff1a16
Lff06d2:
	move.b	#$02,($09df)
	move.l	($00ed001e),d0
	cmp.l	#$ffffffff,d0
	bne.s	Lff0720
	rts

Lff06e8:
	clr.b	($09df)
	bra.s	Lff06f4
Lff06ee:
	move.b	#$01,($09df)
Lff06f4:
	lea.l	($00e8a000),a0
	move.b	#$01,($001b,a0)
	move.b	($00ed0026),d0
	beq.s	Lff070a
	moveq.l	#$07,d0
Lff070a:
	move.b	d0,($0001,a0)
	tst.b	($00e9a001)
	tst.b	($00e9a001)
	move.b	#$08,($001b,a0)
Lff0720:
	moveq.l	#$3d,d1
	IOCS	_TVCTRL
	rts

Lff0728:
	IOCS	_B_PRINT
	rts

Lff072e:
	move.w	#$00ff,d0
	moveq.l	#$00,d1
	tst.b	d7
	nop
	moveq.l	#$01,d1
	ror.l	#8,d1
Lff073c:
	move.l	a1,(a0)+
	adda.l	d1,a1
	dbra.w	d0,Lff073c
	rts

Lff0746:
	move.b	#$0c,($00e8e007)
	movem.l	d0-d7/a0-a6,-(a7)
	move.w	#$301f,d7
	lea.l	($003c,a7),a6
	trap	#14
	movem.l	(a7)+,d0-d7/a0-a6
	rte

Lff0762:
	moveq.l	#$00,d7
	move.w	($0006,a7),d7
	and.w	#$0fff,d7
	lsr.w	#2,d7
	bra.s	Lff07b2
DefaultExceptionHandler:
	bsr.w	Lff0774
Lff0774:
	move.l	(a7)+,d7
	tst.b	($0cbc)
	bne.s	Lff0762
	clr.w	d7
	swap.w	d7
	lsr.w	#8,d7
	cmp.w	#$0003,d7
	bhi.s	Lff07b2
	addq.l	#6,a7
	swap.w	d7
	move.w	(a7)+,d7
	movea.l	($0002,a7),a6
	cmp.w	(a6),d7
	beq.s	Lff07aa
	cmp.w	-(a6),d7
	beq.s	Lff07aa
	cmp.w	-(a6),d7
	beq.s	Lff07aa
	cmp.w	-(a6),d7
	beq.s	Lff07aa
	cmp.w	-(a6),d7
	beq.s	Lff07aa
	cmp.w	-(a6),d7
	bne.s	Lff07ae
Lff07aa:
	move.l	a6,($0002,a7)
Lff07ae:
	clr.w	d7
	swap.w	d7
Lff07b2:
	movea.l	a7,a6
	trap	#14
Lff07b6:
	move.w	#$00ff,d0
	trap	#15
	bra.s	Lff07b6
Lff07be:
	bsr.s	Lff07e8
	lea.l	(Lff0b53),a1
	bsr.w	Lff0728
Lff07ca:
	bra.s	Lff07ca
Lff07cc:
	clr.w	($0ade)
	clr.b	($0bc4)
	clr.b	($0bc5)
	bset.b	#$04,($00e88013)
	bclr.b	#$07,($0bbf)
	rts

Lff07e8:
	movem.l	d0/a0,-(a7)
	move.b	($093c),d0
	cmp.b	#$13,d0
	bne.s	Lff0804
	lea.l	($00e80014),a0
	move.w	#$0040,(a0)+
	move.w	#$0010,(a0)
Lff0804:
	movem.l	(a7)+,d0/a0
	rts

Lff080a:
	movem.l	d0/a0,-(a7)
	moveq.l	#$00,d0
	lea.l	($00e80014),a0
	move.w	d0,(a0)+
	move.w	d0,(a0)
	movem.l	(a7)+,d0/a0
	rts

Lff0820:
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

Lff08aa:
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
Lff09e4:
	.dc.w	$01f8
Lff09e6:
	.dc.w	$00e0
Lff09e8:
	.dc.b	'Ｘ68000W',$00
Lff09f1:
	.dc.b	$40,$00,$00,$00,$fc,$00,$00,$00
	.dc.b	$ed,$01,$00,$ff,$ff,$ff,$ff,$00
	.dc.b	$00,$4e,$07,$00,$10,$00,$00,$00
	.dc.b	$00,$ff,$ff,$00,$00,$07,$00,$0e
	.dc.b	$00,$0d,$00,$00,$00
Lff0a16:
	.dc.b	$00,$00,$f8,$3e,$ff,$c0,$ff,$fe
	.dc.b	$de,$6c,$40,$22,$03,$02,$00,$08
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$ff,$f4,$00,$04,$00
	.dc.b	$01,$01,$00,$00,$00,$20,$00,$03
	.dc.b	$f9,$01,$00,$00,$00
Lff0a43:
	.dc.b	$1b,'[16;30Hディスクから起動できません。  ',$1b,'[17;30Hター'
	.dc.b	'ミナルモニタを起動します。',$00
Lff0a90:
	.dc.b	$1b,'[43;1m',$1b,'[15;26H                                   '
	.dc.b	'   ',$1b,'[16;26H      ディスクから起動できません。    ',$1b
	.dc.b	'[17;26H 正しいディスクをセットしてください。 ',$1b,'[18;26H'
	.dc.b	'                                      ',$1b,'[m',$00
Lff0b53:
	.dc.b	$1b,'[20;26Hエラーが発生しました。リセットしてください。',$00
Lff0b88:
	.dc.b	$1a,$00
Lff0b8a:
	.dc.b	$1a,$1b,'[43;1m',$1b,'[15;26H                               '
	.dc.b	'       ',$1b,'[16;26H      Ｓ-ＲＡＭを初期化します。       '
	.dc.b	$1b,'[17;26H      よろしいですか？(Y/N)           ',$1b,'[18'
	.dc.b	';26H                                      ',$1b,'[m',$00
Lff0c4e:
	link.w	a6,#-$002e
	move.w	#$002e,d0
	subq.w	#1,d0
	lea.l	(Lff0ce4,pc),a0
	lea.l	(-$002e,a6),a1
Lff0c60:
	move.b	(a0)+,(a1)+
	dbra.w	d0,Lff0c60
	movem.l	d1-d2/a0-a1,-(a7)
	move.w	sr,-(a7)
	ori.w	#$0700,sr
	lea.l	($00e88000),a0
	movep.w	($0013,a0),d0
	move.w	d0,-(a7)
	moveq.l	#$20,d0
	movep.w	d0,($0013,a0)
	movep.w	($0007,a0),d0
	move.w	d0,-(a7)
	moveq.l	#$20,d0
	movep.w	d0,($0007,a0)
	move.b	($001d,a0),-(a7)
	clr.b	($001d,a0)
	move.b	($0017,a0),-(a7)
	move.b	#$40,($0017,a0)
	move.l	($0114),-(a7)
	pea.l	(Lff0d08,pc)
	move.l	(a7)+,($0114)
	bsr.s	Lff0ce4
	move.w	d1,d2
	swap.w	d2
	lea.l	(-$002e,a6),a1
	jsr	(a1)
	move.w	d1,d2
	move.b	#$c8,($0023,a0)
	move.l	(a7)+,($0114)
	move.b	(a7)+,($0017,a0)
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

Lff0ce4:
	move.b	#$fa,($0023,a0)
	moveq.l	#$ff,d1
	move.w	#$2500,sr
	move.b	#$30,($001d,a0)
Lff0cf6:
	dbra.w	d1,Lff0cf6
Lff0cfa:
	ori.w	#$0700,sr
	clr.b	($001d,a0)
	neg.w	d1
	subq.w	#1,d1
	rts

Lff0d08:
	lea.l	(Lff0cfa,pc),a1
	move.l	a1,($0002,a7)
	rte

Lff0d12:
	movem.l	d0-d2/a0,-(a7)
	lea.l	($00e88023),a0
	moveq.l	#$00,d1
	move.b	(a0),d1
	move.b	(a0),d1
Lff0d22:
	moveq.l	#$00,d2
	move.b	(a0),d2
	cmp.b	(a0),d2
	bcs.s	Lff0d22
	sub.w	d2,d1
	bcc.s	Lff0d32
	add.w	#$00c8,d1
Lff0d32:
	exg.l	d1,d2
	sub.l	d2,d0
	bhi.s	Lff0d22
	movem.l	(a7)+,d0-d2/a0
	rts

Lff0d3e:
	.dc.b	$4e,$56,$ff,$f8,$2d,$78,$00,$10
	.dc.b	$ff,$fc,$2d,$78,$00,$2c,$ff,$f8
	.dc.b	$41,$fa,$00,$e2,$21,$c8,$00,$10
	.dc.b	$41,$fa,$00,$d8,$21,$c8,$00,$2c
	.dc.b	$70,$00,$41,$fa,$00,$04,$51,$fc
	.dc.b	$4a,$80,$66,$00,$00,$a8,$72,$02
	.dc.b	$70,$00,$43,$fa,$00,$c8,$41,$fa
	.dc.b	$00,$06,$06,$d1,$00,$00,$4a,$80
	.dc.b	$67,$6e,$72,$03,$70,$00,$41,$fa
	.dc.b	$00,$06,$4e,$7a,$98,$06,$4a,$80
	.dc.b	$66,$02,$60,$5c,$9e,$fc,$00,$80
	.dc.b	$20,$4f,$20,$fc,$7f,$ff,$00,$02
	.dc.b	$20,$0f,$e8,$88,$54,$80,$e9,$88
	.dc.b	$20,$80,$41,$fa,$00,$ac,$22,$40
	.dc.b	$70,$07,$22,$d8,$51,$c8,$ff,$fc
	.dc.b	$f0,$00,$24,$00,$f0,$17,$4c,$00
	.dc.b	$43,$fa,$00,$8e,$f0,$11,$40,$00
	.dc.b	$43,$f9,$00,$f0,$00,$00,$41,$f9
	.dc.b	$00,$20,$00,$00,$30,$3c,$07,$ff
	.dc.b	$b1,$89,$56,$c8,$ff,$fc,$66,$0c
	.dc.b	$43,$fa,$00,$72,$f0,$11,$40,$00
	.dc.b	$08,$c1,$00,$1f,$de,$fc,$00,$80
	.dc.b	$70,$00,$41,$fa,$00,$06,$f2,$80
	.dc.b	$00,$00,$4a,$80,$66,$04,$08,$c1
	.dc.b	$00,$0f
Lff0e00:
	move.l	d1,d0
	move.l	(-$0004,a6),($0010)
	move.l	(-$0008,a6),($002c)
	unlk	a6
	rts

Lff0e12:
	moveq.l	#$00,d1
	lea.l	(Lff0e20,pc),a0
	move.l	a0,($0010)
	movea.l	a7,a0
	illegal
Lff0e20:
	move.l	a7,d0
	movea.l	a0,a7
	suba.l	d0,a0
	cmpa.w	#$0006,a0
	beq.s	Lff0e00
	moveq.l	#$10,d1
	bra.s	Lff0e00
Lff0e30:
	nop
	moveq.l	#$ff,d0
	move.l	a0,($0002,a7)
	rte

Lff0e3a:
	.dc.b	$00,$00,$00,$00,$00,$ff,$0e,$4a
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$f0,$00,$06,$cf,$80,$d8,$34,$40
	.dc.b	$00,$d8,$34,$40,$00,$00,$00,$01
	.dc.b	$00,$f0,$00,$01,$00,$40,$00,$01
	.dc.b	$00,$60,$00,$01,$00,$80,$00,$01
	.dc.b	$00,$a0,$00,$01,$00,$c0,$00,$01
	.dc.b	$00,$e0,$00,$01
Lff0e76:
	movem.l	d0-d3/a0-a2,-(a7)
	bsr.w	Lff10d8
	bsr.s	Lff0ea0
	moveq.l	#$00,d1
	moveq.l	#$ac,d0
	trap	#15
	move.l	d0,d3
	bsr.w	Lff100c
	bsr.s	Lff0eea
	bsr.w	Lff0f7e
	bsr.w	Lff0f8c
	bsr.w	Lff0f9c
	movem.l	(a7)+,d0-d3/a0-a2
	rts

Lff0ea0:
	move.w	#$0007,d1
	IOCS	_B_COLOR
	lea.l	(Lff1190,pc),a1
	IOCS	_B_PRINT
	move.w	#$0003,d1
	IOCS	_B_COLOR
	move.b	#$02,d1
	IOCS	_TCOLOR
	lea.l	(Lff138c,pc),a1
	move.w	#$0000,d2
	move.w	#$0004,d1
	IOCS	_TEXTPUT
	move.b	#$01,d1
	IOCS	_TCOLOR
	lea.l	(Lff12a8,pc),a1
	move.w	#$0000,d2
	move.w	#$0114,d1
	IOCS	_TEXTPUT
	rts

Lff0eea:
	lea.l	(Lff11f5,pc),a1
	IOCS	_B_PRINT
	move.w	d3,d1
	andi.w	#$00ff,d1
	add.w	#$0030,d1
	IOCS	_B_PUTC
	lea.l	(Lff1219,pc),a1
	IOCS	_B_PRINT
	bsr.s	Lff0f0c
	rts

Lff0f0c:
	link.w	a6,#-$0004
	move.b	#$00,($0000.w,a6)
	move.l	d3,d1
	move.w	#$0000,d1
	swap.w	d1
	cmp.w	#$000a,d1
	blt.s	Lff0f5e
	divu.w	#$000a,d1
	swap.w	d1
	add.w	#$0030,d1
	move.b	d1,(-$0001,a6)
	move.b	#$2e,(-$0002,a6)
	move.w	#$0000,d1
	swap.w	d1
	cmp.w	#$000a,d1
	blt.s	Lff0f5e
	divu.w	#$000a,d1
	swap.w	d1
	add.w	#$0030,d1
	move.b	d1,(-$0003,a6)
	move.w	#$0000,d1
	swap.w	d1
	cmp.w	#$000a,d1
	bge.s	Lff0f78
Lff0f5e:
	add.w	#$0030,d1
	move.b	d1,(-$0004,a6)
	movea.l	a7,a1
	IOCS	_B_PRINT
	lea.l	(Lff121f,pc),a1
Lff0f70:
	IOCS	_B_PRINT
	unlk	a6
	rts

Lff0f78:
	lea.l	(Lff121d,pc),a1
	bra.s	Lff0f70
Lff0f7e:
	tst.w	d3
	bpl.s	Lff0f8a
	lea.l	(Lff1226,pc),a1
	IOCS	_B_PRINT
Lff0f8a:
	rts

Lff0f8c:
	btst.l	#$0e,d3
	beq.s	Lff0f9a
	lea.l	(Lff1254,pc),a1
	IOCS	_B_PRINT
Lff0f9a:
	rts

Lff0f9c:
	lea.l	(Lff1280,pc),a1
	IOCS	_B_PRINT
	move.l	($0008),-(a7)
	lea.l	(Lff1002,pc),a1
	move.l	a1,($0008)
	suba.l	a0,a0
	lea.l	($00c00000),a1
	movea.l	a7,a2
Lff0fba:
	move.l	(a0),d0
	adda.l	#$00100000,a0
	cmpa.l	a0,a1
	bne.s	Lff0fba
Lff0fc6:
	move.l	(a7)+,($0008)
	move.l	a0,d1
	swap.w	d1
	lsr.w	#4,d1
	cmp.w	#$0009,d1
	bpl.s	Lff0fe0
	add.w	#$0030,d1
	IOCS	_B_PUTC
	bra.s	Lff0ff8
Lff0fe0:
	move.w	d1,d2
	move.w	#$0031,d1
	IOCS	_B_PUTC
	move.w	d2,d1
	sub.w	#$000a,d1
	add.w	#$0030,d1
	IOCS	_B_PUTC
Lff0ff8:
	lea.l	(Lff129f,pc),a1
	IOCS	_B_PRINT
	rts

Lff1002:
	movea.l	a2,a7
	lea.l	(Lff0fc6,pc),a1
	move.l	a1,-(a7)
	rts

Lff100c:
	link.w	a6,#-$0010
	move.w	#$0007,d1
	IOCS	_B_COLOR
	lea.l	(Lff11e3,pc),a1
	IOCS	_B_PRINT
	move.l	#$0000008f,d0
	trap	#15
	move.b	#$00,(-$0001,a6)
	move.b	#$0a,(-$0002,a6)
	move.b	#$0d,(-$0003,a6)
	move.b	d0,(-$0004,a6)
	andi.b	#$0f,(-$0004,a6)
	addi.b	#$30,(-$0004,a6)
	lsr.b	#4,d0
	add.b	#$30,d0
	move.b	d0,(-$0005,a6)
	move.b	#$2e,(-$0006,a6)
	lsr.w	#8,d0
	move.b	d0,(-$0007,a6)
	andi.b	#$0f,(-$0007,a6)
	addi.b	#$30,(-$0007,a6)
	lsr.b	#4,d0
	add.b	#$30,d0
	move.b	d0,(-$0008,a6)
	move.b	#$2e,(-$0009,a6)
	swap.w	d0
	move.b	d0,(-$000a,a6)
	andi.b	#$0f,(-$000a,a6)
	addi.b	#$30,(-$000a,a6)
	lsr.b	#4,d0
	add.b	#$30,d0
	move.b	d0,(-$000b,a6)
	move.b	#$27,(-$000c,a6)
	move.b	#$20,(-$000d,a6)
	lsr.w	#8,d0
	move.b	d0,(-$000e,a6)
	andi.b	#$0f,(-$000e,a6)
	addi.b	#$30,(-$000e,a6)
	move.b	#$2e,(-$000f,a6)
	lsr.b	#4,d0
	add.b	#$30,d0
	move.b	d0,(-$0010,a6)
	movea.l	a7,a1
	IOCS	_B_PRINT
	move.w	#$0003,d1
	IOCS	_B_COLOR
	unlk	a6
	rts

Lff10d8:
	tst.b	($00ed0091)
	beq.s	Lff1136
	move.b	#$01,d1
	move.b	#$02,d2
	bsr.s	Lff1138
	move.b	#$08,d1
	move.b	#$00,d2
	bsr.s	Lff1138
	lea.l	(Lff1174,pc),a0
	moveq.l	#$00,d0
	bsr.s	Lff113e
	lea.l	(Lff1178,pc),a0
	moveq.l	#$00,d0
	bsr.s	Lff1158
	lea.l	(Lff117e,pc),a0
	moveq.l	#$08,d0
	bsr.s	Lff1158
	lea.l	(Lff1184,pc),a0
	moveq.l	#$10,d0
	bsr.s	Lff1158
	lea.l	(Lff118a,pc),a0
	moveq.l	#$18,d0
	bsr.s	Lff1158
	move.b	#$08,d1
	move.b	#$68,d2
	bsr.s	Lff1138
	moveq.l	#$32,d0
	bsr.w	Lff0d12
	move.b	#$08,d1
	move.b	#$00,d2
	bsr.s	Lff1138
Lff1136:
	rts

Lff1138:
	IOCS	_OPMSET
	rts

Lff113e:
	movem.l	d1-d3,-(a7)
	moveq.l	#$20,d1
	add.w	d0,d1
	moveq.l	#$03,d3
Lff1148:
	move.b	(a0)+,d2
	bsr.s	Lff1138
	addq.w	#8,d1
	dbra.w	d3,Lff1148
	movem.l	(a7)+,d1-d3
	rts

Lff1158:
	movem.l	d1-d3,-(a7)
	moveq.l	#$40,d1
	add.w	d0,d1
	moveq.l	#$05,d3
Lff1162:
	move.b	(a0)+,d2
	bsr.s	Lff1138
	add.w	#$0020,d1
	dbra.w	d3,Lff1162
	movem.l	(a7)+,d1-d3
	rts

Lff1174:
	.dc.b	$cb,$4c,$18,$00
Lff1178:
	.dc.b	$00,$1d,$06,$8b,$c4,$04
Lff117e:
	.dc.b	$03,$1c,$43,$82,$47,$32
Lff1184:
	.dc.b	$01,$28,$9f,$86,$c0,$22
Lff118a:
	.dc.b	$01,$02,$5f,$95,$06,$24
Lff1190:
	.dc.b	'                     '
	.dc.b	'         ',$0d,$0a,$00
Lff11e3:
	.dc.b	'BIOS ROM version ',$00
Lff11f5:
	.dc.b	'Micro Processor Unit  (MPU) : MC680',$00
Lff1219:
	.dc.b	'0 (',$00
Lff121d:
	.dc.b	$3f,$3f
Lff121f:
	.dc.b	'MHz)',$0d,$0a,$00
Lff1226:
	.dc.b	'Floating Point Unit   (FPU) : MC68881/68882',$0d,$0a,$00
Lff1254:
	.dc.b	'Memory Managiment Unit(MMU) : On-Chip MMU',$0d,$0a,$00
Lff1280:
	.dc.b	'Memory Size                 : ',$00
Lff129f:
	.dc.b	'Mbytes',$0d,$0a,$00
Lff12a8:
	.dc.b	$00,$70,$00,$10,$03,$ff,$f9,$ff
	.dc.b	$e0,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$01,$80,$0c,$c0,$c0,$ff
	.dc.b	$83,$fe,$0f,$f8,$3f,$e0,$ff,$80
	.dc.b	$01,$80,$0c,$c1,$83,$ff,$cf,$ff
	.dc.b	$3f,$fc,$ff,$f3,$ff,$c0,$00,$c0
	.dc.b	$06,$63,$07,$01,$dc,$07,$70,$1d
	.dc.b	$c0,$77,$01,$c0,$00,$c0,$06,$66
	.dc.b	$06,$01,$d8,$03,$60,$0d,$80,$36
	.dc.b	$00,$c0,$00,$60,$03,$3c,$06,$00
	.dc.b	$1c,$06,$60,$0d,$80,$36,$00,$c0
	.dc.b	$00,$60,$03,$38,$0f,$ff,$1f,$fe
	.dc.b	$c0,$1b,$00,$6c,$01,$80,$00,$30
	.dc.b	$01,$90,$0f,$ff,$9f,$fc,$c0,$1b
	.dc.b	$00,$6c,$01,$80,$01,$30,$01,$80
	.dc.b	$0c,$03,$b8,$1e,$c0,$1b,$00,$6c
	.dc.b	$01,$80,$03,$98,$00,$c0,$18,$01
	.dc.b	$b0,$0e,$c0,$1b,$00,$68,$01,$80
	.dc.b	$07,$98,$00,$c0,$18,$03,$60,$0d
	.dc.b	$80,$36,$00,$d8,$03,$00,$0c,$cc
	.dc.b	$00,$60,$18,$03,$60,$0d,$80,$36
	.dc.b	$00,$d8,$03,$00,$18,$cc,$00,$60
	.dc.b	$1c,$07,$70,$1d,$c0,$77,$01,$dc
	.dc.b	$07,$00,$30,$66,$00,$30,$1f,$fe
	.dc.b	$7f,$f9,$ff,$e7,$ff,$9f,$fe,$00
	.dc.b	$60,$66,$00,$30,$0f,$f8,$3f,$e0
	.dc.b	$ff,$c3,$fe,$0f,$f8,$00,$ff,$f3
	.dc.b	$ff,$f8,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00
Lff138c:
	.dc.b	$00,$60,$00,$10,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$1f,$fe,$1f,$01,$f0,$0f,$f0,$0f
	.dc.b	$ff,$c3,$ff,$f0,$7f,$ff,$df,$01
	.dc.b	$f0,$0f,$f0,$0f,$ff,$f3,$ff,$fc
	.dc.b	$f8,$1f,$df,$01,$f0,$1f,$f8,$0f
	.dc.b	$80,$fb,$e0,$3e,$fe,$01,$9f,$01
	.dc.b	$f0,$3d,$fc,$0f,$80,$7b,$e0,$1e
	.dc.b	$7f,$c0,$1f,$01,$f0,$38,$fc,$0f
	.dc.b	$80,$7b,$e0,$1e,$3f,$f8,$1f,$ff
	.dc.b	$f0,$78,$fe,$0f,$80,$fb,$e0,$3e
	.dc.b	$07,$ff,$1f,$ff,$f0,$f0,$7f,$0f
	.dc.b	$bf,$e3,$ff,$fc,$00,$ff,$9f,$01
	.dc.b	$f0,$ff,$ff,$0f,$bf,$83,$ff,$f0
	.dc.b	$60,$1f,$df,$01,$f1,$ff,$ff,$8f
	.dc.b	$9f,$c3,$e0,$00,$fe,$07,$df,$01
	.dc.b	$f3,$c0,$1f,$cf,$8f,$e3,$e0,$00
	.dc.b	$ff,$ff,$9f,$01,$f3,$c0,$1f,$cf
	.dc.b	$87,$f3,$e0,$00,$1f,$fe,$1f,$01
	.dc.b	$f7,$80,$0f,$ef,$83,$fb,$e0,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00
Lff1450:
	lea.l	(Lff2564,pc),a0
	move.l	a0,($00bc)
	lea.l	(Lff07be,pc),a0
	move.l	a0,($00b8)
	lea.l	(Lff1b48,pc),a0
	move.l	a0,($00b4)
	lea.l	(Lff8010,pc),a0
	move.l	a0,($00b0)
	lea.l	(Lff1b20,pc),a0
	move.l	a0,($00ac)
	lea.l	(Lff19d0,pc),a0
	move.l	a0,($00a8)
	lea.l	($0800),a0
	move.w	#$01ff,d0
Lff1488:
	clr.l	(a0)+
	dbra.w	d0,Lff1488
	lea.l	($081c),a0
	move.l	a0,($0814)
	move.l	a0,($0818)
	lea.l	($093c),a0
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
	lea.l	($095c),a0
	move.l	#$00c00000,(a0)+
	move.l	#$00000800,(a0)+
	move.w	#$000f,(a0)+
	move.w	#$000f,(a0)+
	lea.l	($0970),a0
	move.w	#$005f,(a0)+
	move.w	#$001f,(a0)+
	move.l	#Lff15be,($097e)
	move.b	#$03,($0994)
	move.b	#$03,($0995)
	move.b	#$ff,($0993)
	lea.l	($09aa),a0
	move.l	#$00f40000,(a0)+
	move.l	#$00f3d000,(a0)+
	lea.l	($08a6),a0
	move.l	a0,($089e)
	move.l	a0,($08a2)
	move.l	#$00000930,($092c)
	move.l	#Lffaa08,($0938)
	move.l	#Lff49c8,($0934)
	lea.l	(Lff15c0,pc),a0
	move.l	#$00000014.l,d1
	lea.l	($0bb0),a1
Lff154e:
	move.b	(a0)+,(a1)+
	dbra.w	d1,Lff154e
	lea.l	($09b2),a0
	moveq.l	#$01,d0
	move.w	d0,(a0)+
	move.w	d0,(a0)+
	lea.l	(Lff1ed8,pc),a1
	move.l	a1,(a0)+
	moveq.l	#$32,d0
	move.w	d0,(a0)+
	move.w	d0,(a0)+
	lea.l	(Lff1d8c,pc),a1
	move.l	a1,(a0)+
	move.w	#$00c8,(a0)+
	move.w	#$00c8,(a0)+
	lea.l	(Lff1f5e,pc),a1
	move.l	a1,(a0)+
	move.w	#$1770,(a0)+
	move.w	#$1770,(a0)+
	lea.l	(Lff1f78,pc),a1
	move.l	a1,(a0)+
	moveq.l	#$ff,d0
	move.l	d0,(a0)+
	clr.l	(a0)+
	move.w	d0,($0a0e)
	lea.l	(Lff15d6,pc),a0
	move.l	#$00000063.l,d1
	lea.l	($0a16),a1
Lff15a4:
	move.b	(a0)+,(a1)+
	dbra.w	d1,Lff15a4
	move.b	#$01,($09dd)
	IOCS	_MS_INIT
	move.b	($00ed005a),($0cb4)
	rts

Lff15be:
	rts

Lff15c0:
	.dc.b	$01,$86,$00,$02,$01,$86,$00,$02
	.dc.b	$00,$61,$00,$00,$00,$00,$00,$00
	.dc.b	$14,$ff,$00,$00,$00,$00
Lff15d6:
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
Lff163a:
	lea.l	($00e8a000),a0
	clr.b	($001d,a0)
	tst.b	($00e9a001)
	tst.b	($00e9a001)
	move.b	#$01,($001b,a0)
	move.b	($00ed0026),d0
	beq.s	Lff167e
	cmp.b	#$07,d0
	beq.s	Lff167e
	move.b	#$07,d0
	move.b	#$31,($00e8e00d)
	move.b	d0,($00ed0026)
	move.b	#$00,($00e8e00d)
Lff167e:
	move.b	d0,($0001,a0)
	tst.b	($00e9a001)
	tst.b	($00e9a001)
	move.b	#$0c,($001b,a0)
	tst.b	($00e9a001)
	tst.b	($00e9a001)
	move.b	#$0c,($001f,a0)
	move.b	#$92,($00e9a007)
	move.b	#$0b,($00e9a005)
	lea.l	($00e84080),a1
	lea.l	(Lff1706,pc),a0
	bsr.s	Lff16f8
	lea.l	($00e840c0),a1
	lea.l	(Lff1716,pc),a0
	bsr.s	Lff16f8
	move.l	#$00e92003,($0014,a1)
	lea.l	(Lff1978,pc),a0
	move.l	a0,($01a0)
	lea.l	(Lff1978,pc),a0
	move.l	a0,($01a4)
	lea.l	(DMA3Interrupt,pc),a0
	move.l	a0,($01a8)
	lea.l	(DMA3Interrupt,pc),a0
	move.l	a0,($01ac)
	bra.s	Lff1728
Lff16f8:
	move.b	(a0)+,d0
	bmi.s	Lff1704
	ext.w	d0
	move.b	(a0)+,(a1,d0.w)
	bra.s	Lff16f8
Lff1704:
	rts

Lff1706:
	.dc.b	$04,$08,$29,$05,$2d,$03,$31,$05
	.dc.b	$39,$05,$25,$68,$27,$69,$ff,$ff
Lff1716:
	subi.l	#$06042905,d0
	move.l	d1,-(a6)
	move.w	d5,-(a0)
	move.w	d5,-(a4)
	move.l	($276b,a2),(-$0001,a2)
Lff1728:
	moveq.l	#$00,d1
	move.b	($00ed001d),d1
	IOCS	_CRTMOD
	lea.l	($00e00000),a0
	move.l	#$00020000,d1
	moveq.l	#$00,d0
Lff1742:
	move.l	d0,(a0)+
	subq.l	#1,d1
	bne.s	Lff1742
	bsr.w	Lff18ce
	bsr.w	Lff1816
	moveq.l	#$ff,d1
	IOCS	_INIT_PRN
	rts

Lff1758:
	move.w	sr,-(a7)
	ori.w	#$0700,sr
	lea.l	($0180),a1
	lea.l	(Lff17f8,pc),a0
	moveq.l	#$03,d1
	bsr.s	Lff17e2
	move.b	#$60,($00e9c003)
	lea.l	($00e84000),a1
	lea.l	(Lff1800,pc),a0
	bsr.w	Lff16f8
	move.l	#$00e94003,($0014,a1)
	move.l	(Lff933c,pc),($0054,a1)
	lea.l	($0c8f),a0
	clr.b	(a0)+
	moveq.l	#$07,d0
Lff1796:
	clr.l	(a0)+
	dbra.w	d0,Lff1796
	move.w	(a7)+,sr
	move.b	#$06,($00e9c001)
	move.w	#$9070,d1
	suba.l	a1,a1
	moveq.l	#$00,d2
	IOCS	_B_DSKINI
	move.w	#$9070,d1
Lff17b6:
	moveq.l	#$03,d2
	IOCS	_B_DRVCHK
	moveq.l	#$05,d2
	IOCS	_B_DRVCHK
	moveq.l	#$07,d2
	IOCS	_B_DRVCHK
	add.w	#$0100,d1
	cmp.w	#$9470,d1
	bne.s	Lff17b6
	andi.w	#$f8ff,sr
	moveq.l	#$f5,d0
	moveq.l	#$00,d1
	trap	#15
	clr.w	($09e0)
	rts

Lff17e2:
	move.l	a0,d2
Lff17e4:
	move.w	(a0)+,d0
	beq.s	Lff17f4
	ext.l	d0
	add.l	d2,d0
	move.l	d0,(a1)+
Lff17ee:
	dbra.w	d1,Lff17e4
	rts

Lff17f4:
	addq.l	#4,a1
	bra.s	Lff17ee
Lff17f8:
	.dc.b	$03,$66,$04,$32,$04,$7e,$00,$00
Lff1800:
	.dc.b	$04,$80,$06,$04,$29,$05,$2d,$00
	.dc.b	$31,$05,$44,$80,$46,$04,$69,$05
	.dc.b	$6d,$02,$71,$05,$ff,$ff
Lff1816:
	lea.l	($0140),a1
	lea.l	(Lff1872,pc),a0
	move.l	a0,d2
	move.w	#$0007,d1
Lff1824:
	move.w	(a0)+,d0
	ext.l	d0
	add.l	d2,d0
	move.l	d0,(a1)+
	move.l	d0,(a1)+
	dbra.w	d1,Lff1824
	moveq.l	#$00,d2
	moveq.l	#$00,d3
	lea.l	(Lff1882,pc),a0
	lea.l	($00e98004),a1
	moveq.l	#$13,d1
Lff1842:
	move.b	(a0)+,d2
	move.b	(a0)+,d3
	move.w	d2,(a1)
	move.w	d3,(a1)
	dbra.w	d1,Lff1842
	lea.l	(Lff18aa,pc),a0
	lea.l	($00e98000),a1
	moveq.l	#$11,d1
Lff185a:
	move.b	(a0)+,d2
	move.b	(a0)+,d3
	move.w	d2,(a1)
	move.w	d3,(a1)
	dbra.w	d1,Lff185a
	move.w	($00ed001a),d1
	IOCS	_SET232C
	rts

Lff1872:
	.dc.b	$07,$f8,$07,$f8,$07,$40,$07,$f8
	.dc.b	$07,$dc,$07,$dc,$04,$06,$07,$dc
Lff1882:
	.dc.b	$09,$c0,$09,$80,$04,$45,$01,$00
	.dc.b	$02,$50,$03,$c0,$05,$e2,$09,$01
	.dc.b	$0b,$56,$0c,$0e,$0d,$00,$0e,$02
	.dc.b	$03,$c1,$05,$ea,$00,$80,$0e,$03
	.dc.b	$0f,$00,$00,$10,$00,$10,$01,$10
Lff18aa:
	.dc.b	$09,$40,$04,$4c,$01,$00,$03,$c0
	.dc.b	$05,$60,$0b,$56,$0c,$1f,$0d,$00
	.dc.b	$0e,$02,$03,$c1,$05,$e8,$00,$80
	.dc.b	$0e,$03,$0f,$00,$00,$10,$00,$10
	.dc.b	$01,$10,$09,$09
Lff18ce:
	lea.l	($0100),a1
	lea.l	(Lff1920,pc),a0
	moveq.l	#$0f,d1
	bsr.w	Lff17e2
	lea.l	($00e88000),a0
	lea.l	(Lff1900,pc),a1
	moveq.l	#$0f,d0
Lff18e8:
	move.b	(a1)+,d1
	ext.w	d1
	move.b	(a1)+,(a0,d1.w)
	dbra.w	d0,Lff18e8
	move.b	($00ed001c),d1
	IOCS	_S_CMDOUT
	rts

Lff1900:
	.dc.b	$05,$00,$03,$06,$1d,$70,$23,$c8
	.dc.b	$07,$18,$09,$26,$13,$18,$15,$26
	.dc.b	$17,$40,$19,$08,$1b,$01,$21,$0d
	.dc.b	$29,$88,$2b,$01,$2f,$ff,$2d,$01
Lff1920:
	.dc.b	$07,$66,$00,$72,$00,$72,$00,$00
	.dc.b	$00,$00,$04,$26,$07,$66,$07,$66
	.dc.b	$07,$66,$07,$66,$07,$66,$07,$68
	.dc.b	$07,$70,$00,$00,$00,$00,$00,$00
DMA3Interrupt:
	move.l	a0,-(a7)
	lea.l	($00e840c0),a0
	move.b	($0001,a0),($0c33)
	tst.b	($0c32)
	bmi.s	Lff196c
	move.b	#$01,($00e9a007)
	move.b	#$03,($00e9a007)
	move.b	#$01,($00e92001)
Lff196c:
	tst.b	(a0)
	st.b	(a0)
	clr.b	($0c32)
	movea.l	(a7)+,a0
	rte

Lff1978:
	move.l	a0,-(a7)
	lea.l	($00e84080),a0
	move.b	($0001,a0),($0c35)
	tst.b	(a0)
	st.b	(a0)
	clr.b	($0c34)
	movea.l	(a7)+,a0
	rte

Lff1992:
	movem.l	d0-d1,-(a7)
	move.w	#$00fa,d1
Lff199a:
	move.l	#$000000c8,d0
	bsr.w	Lff0d12
	move.b	($00e88001),d0
	btst.l	#$02,d0
	beq.s	Lff19ca
	btst.l	#$01,d0
	beq.s	Lff19ca
	dbra.w	d1,Lff199a
	move.b	#$00,($00e8a01f)
	move.l	#$58363801,d0
	trap	#10
Lff19ca:
	movem.l	(a7)+,d0-d1
	rte

Lff19d0:
	cmp.l	#$58363801,d0
	beq.s	Lff1a0c
	cmp.l	#$58363802,d0
	beq.s	Lff1a0c
	cmp.l	#$58363803,d0
	beq.s	Lff19f0
	bsr.w	Lff1afe
	bra.w	Lff1aec
Lff19f0:
	cmpi.b	#$02,($09df)
	bne.s	Lff1a0c
	move.l	($00ed001e),d0
	beq.s	Lff1a0c
	cmp.l	#$00000040,d0
	bcc.s	Lff1a0c
	moveq.l	#$0d,d1
	bra.s	Lff1a12
Lff1a0c:
	move.b	($00ed002a),d1
Lff1a12:
	IOCS	_TVCTRL
Lff1a16:
	bsr.w	Lff1b4a
	tst.b	($00ed0029)
	beq.s	Lff1a46
	moveq.l	#$03,d1
Lff1a24:
	moveq.l	#$20,d0
	bset.l	d1,d0
	move.b	d0,($00e94005)
	and.w	#$0020,d0
	move.b	d0,($00e94005)
	dbra.w	d1,Lff1a24
	move.l	#$0000bb80,d0
	bsr.w	Lff0d12
Lff1a46:
	bsr.w	Lff1afe
	moveq.l	#$3c,d1
Lff1a4c:
	move.l	#$000000c8,d0
	bsr.w	Lff0d12
	move.b	($00e88001),d0
	btst.l	#$02,d0
	beq.w	Lff1aec
	btst.l	#$01,d0
	beq.w	Lff1aec
	dbra.w	d1,Lff1a4c
	ori.w	#$0700,sr
	moveq.l	#$00,d1
	bsr.w	Call_LEDCTRL
	lea.l	($00e8a000),a0
	move.b	($00ed0026),d0
	bsr.w	Lff2dfa
	move.b	#$31,($00e8e00d)
	addq.l	#1,($00ed0044)
	clr.b	($00e8e00d)
	move.b	#$0c,($001f,a0)
	tst.b	($00e9a001)
	tst.b	($00e9a001)
	move.b	($001b,a0),d0
	bclr.l	#$02,d0
	nop
	nop
	tst.b	($00ed0026)
	bne.s	Lff1ac8
	bset.l	#$02,d0
Lff1ac8:
	move.b	d0,($001b,a0)
	nop
	nop
	lea.l	($00e8e00f),a0
	move.b	#$00,(a0)
	move.b	#$0f,(a0)
	move.b	#$0f,(a0)
	move.l	#$0000c350,d0
	bsr.w	Lff0d12
Lff1aec:
	movem.l	(Lff1af6,pc),d0-d1
	bra.w	Start
Lff1af6:
	.dc.b	$48,$6f,$74,$53
Lff1afa:
	.dc.b	$74,$61,$72,$74
Lff1afe:
	move.b	#$31,($00e8e00d)
	move.b	($0810),($00ed001c)
	move.l	($09d6),d0
	add.l	d0,($00ed0040)
	clr.b	($00e8e00d)
	rts

Lff1b20:
	movem.l	d0-d7/a0-a6,-(a7)
	btst.l	#$00,d0
	bne.s	Lff1b42
	move.w	($0a0e),d0
	cmp.w	#$0040,d0
	bcs.s	Lff1b40
	cmp.w	#$0050,d0
	bcs.s	Lff1b42
	cmp.w	#$00f5,d0
	beq.s	Lff1b42
Lff1b40:
	bsr.s	Lff1b4a
Lff1b42:
	movem.l	(a7)+,d0-d7/a0-a6
	rte

Lff1b48:
	rte

Lff1b4a:
	move.w	#$8000,d1
Lff1b4e:
	bsr.w	Call_B_EJECT
	add.w	#$0100,d1
	cmp.w	#$9000,d1
	bcs.s	Lff1b4e
	rts

Lff1b5e:
	bsr.s	Lff1b62
	rte

Lff1b62:
	movem.l	d0-d3/a0-a3,-(a7)
	lea.l	($00e94001),a0
	lea.l	($0002,a0),a1
	lea.l	($00e9a001),a3
Lff1b76:
	tst.b	(a3)
	move.b	(a0),d0
	bpl.s	Lff1b76
	btst.l	#$06,d0
	bne.s	Lff1b8c
	btst.l	#$04,d0
	bne.s	Lff1b8c
	bsr.s	Lff1bce
	bne.s	Lff1b96
Lff1b8c:
	bsr.s	Lff1bee
	bne.s	Lff1bc8
	cmp.b	#$80,d0
	beq.s	Lff1bc8
Lff1b96:
	moveq.l	#$00,d1
	move.b	d0,d1
	and.b	#$03,d1
	move.w	d1,d2
	lsl.w	#3,d1
	lea.l	($0c90),a2
	adda.w	d1,a2
	tst.b	d0
	bpl.s	Lff1bbc
	btst.b	d2,($0c8f)
	beq.s	Lff1bba
	moveq.l	#$07,d2
Lff1bb4:
	bsr.s	Lff1c08
	bne.s	Lff1bb4
	bra.s	Lff1b76
Lff1bba:
	moveq.l	#$07,d2
Lff1bbc:
	move.b	d0,(a2)+
	bsr.s	Lff1c08
	bne.s	Lff1bbc
	bset.b	d2,($0c8f)
	bra.s	Lff1b76
Lff1bc8:
	movem.l	(a7)+,d0-d3/a0-a3
	rts

Lff1bce:
	moveq.l	#$ff,d3
Lff1bd0:
	tst.b	(a3)
	move.b	(a0),d0
	and.b	#$d0,d0
	cmp.b	#$80,d0
	dbeq.w	d3,Lff1bd0
	bne.s	Lff1bea
	move.b	#$08,(a1)
	moveq.l	#$00,d0
	rts

Lff1bea:
	moveq.l	#$ff,d3
	rts

Lff1bee:
	moveq.l	#$ff,d3
Lff1bf0:
	tst.b	(a3)
	move.b	(a0),d0
	and.b	#$d0,d0
	cmp.b	#$d0,d0
	dbeq.w	d3,Lff1bf0
	bne.s	Lff1bea
	move.b	(a1),d0
	moveq.l	#$00,d3
	rts

Lff1c08:
	moveq.l	#$ff,d3
Lff1c0a:
	tst.b	(a3)
	move.b	(a0),d0
	dbmi.w	d3,Lff1c0a
	bpl.s	Lff1c26
	btst.l	#$06,d0
	beq.s	Lff1c26
	btst.l	#$04,d0
	beq.s	Lff1c26
	move.b	(a1),d0
	moveq.l	#$ff,d3
	rts

Lff1c26:
	moveq.l	#$00,d3
	rts

Lff1c2a:
	movem.l	d0/a4,-(a7)
	bsr.s	Lff1c36
	movem.l	(a7)+,d0/a4
	rte

Lff1c36:
	movem.l	d1-d2/a1-a2,-(a7)
	lea.l	($09e6),a4
	lea.l	($09e2),a1
	lea.l	($00e94005),a2
	moveq.l	#$00,d1
Lff1c4a:
	move.b	(a1)+,d0
	and.b	#$c0,d0
	move.w	d0,d2
	bset.l	d1,d0
	move.b	d0,(a2)
	move.b	(a2),d0
	move.b	d2,(a2)
	cmp.b	(a4),d0
	beq.s	Lff1c66
	move.b	d0,(a4)
	move.b	#-$01,($0001,a4)
Lff1c66:
	addq.l	#2,a4
	addq.w	#1,d1
	cmp.w	#$0004,d1
	bcs.s	Lff1c4a
	movem.l	(a7)+,d1-d2/a1-a2
	rts

Lff1c76:
	rte

Lff1c78:
	ori.w	#$0700,sr
	movem.l	d0-d1/a0,-(a7)
	moveq.l	#$00,d1
	move.w	($00e98006),d0
	and.b	($0cb5),d0
	btst.b	#$00,($0926)
	beq.s	Lff1cba
	cmp.b	#$0f,d0
	beq.w	Lff1d26
	cmp.b	#$0e,d0
	beq.w	Lff1d2e
	and.b	#$7f,d0
	cmp.b	#$20,d0
	bcs.s	Lff1cba
	btst.b	#$00,($0928)
	beq.s	Lff1cba
	or.b	#$80,d0
Lff1cba:
	btst.b	#$01,($0926)
	beq.s	Lff1cce
	cmp.b	#$13,d0
	beq.s	Lff1d36
	cmp.b	#$11,d0
	beq.s	Lff1d3e
Lff1cce:
	movea.l	($089e),a0
	cmpi.w	#$003f,($089c)
	bcc.s	Lff1cf0
	addq.l	#2,a0
	cmpa.l	#$00000926,a0
	bne.s	Lff1ce8
	lea.l	($08a6),a0
Lff1ce8:
	addq.w	#1,($089c)
	move.l	a0,($089e)
Lff1cf0:
	move.b	d1,(a0)+
	move.b	d0,(a0)
	btst.b	#$01,($0926)
	beq.s	Lff1d18
	btst.b	#$00,($0929)
	bne.s	Lff1d18
	cmpi.w	#$0030,($089c)
	bcs.s	Lff1d18
	bset.b	#$00,($0929)
	moveq.l	#$13,d1
	bsr.w	Lff7be4
Lff1d18:
	movem.l	(a7)+,d0-d1/a0
	move.w	#$0038,($00e98004)
	rte

Lff1d26:
	bset.b	#$00,($0928)
	bra.s	Lff1d18
Lff1d2e:
	bclr.b	#$00,($0928)
	bra.s	Lff1d18
Lff1d36:
	bset.b	#$01,($0929)
	bra.s	Lff1d18
Lff1d3e:
	bclr.b	#$01,($0929)
	bra.s	Lff1d18
Lff1d46:
	move.l	a0,-(a7)
	lea.l	($09b4),a0
	subq.w	#1,(a0)
	bne.s	Lff1d58
	move.w	(-$0002,a0),(a0)+
	movea.l	(a0),a0
	jsr	(a0)
Lff1d58:
	lea.l	($09bc),a0
	subq.w	#1,(a0)
	bne.s	Lff1d68
	move.w	(-$0002,a0),(a0)+
	movea.l	(a0),a0
	jsr	(a0)
Lff1d68:
	lea.l	($09c4),a0
	subq.w	#1,(a0)
	bne.s	Lff1d78
	move.w	(-$0002,a0),(a0)+
	movea.l	(a0),a0
	jsr	(a0)
Lff1d78:
	lea.l	($09cc),a0
	subq.w	#1,(a0)
	bne.s	Lff1d88
	move.w	(-$0002,a0),(a0)+
	movea.l	(a0),a0
	jsr	(a0)
Lff1d88:
	movea.l	(a7)+,a0
	rte

Lff1d8c:
	tst.b	($0992)
	beq.s	Lff1dae
	tst.w	($0d0c)
	beq.s	Lff1d9e
	tst.b	($0991)
	bne.s	Lff1dae
Lff1d9e:
	btst.b	#$01,($00e8002a)
	bne.s	Lff1dae
	bsr.s	Lff1db0
	not.b	($0991)
Lff1dae:
	rts

Lff1db0:
	movem.l	d0-d2/a0-a2,-(a7)
	moveq.l	#$00,d0
	move.w	($0976),d0
	swap.w	d0
	lsr.l	#5,d0
	movea.l	d0,a2
	move.w	($0974),d0
	cmp.w	($0970),d0
	bcs.s	Lff1dce
	move.w	($0970),d0
Lff1dce:
	adda.w	d0,a2
	adda.l	($0948),a2
	adda.l	#$00e00000,a2
	move.w	($00e8002a),-(a7)
	bclr.b	#$00,($00e8002a)
	move.w	($0d10),d1
	bne.s	Lff1df0
	moveq.l	#$ff,d1
Lff1df0:
	bsr.s	Lff1e08
	lsr.w	#8,d1
	adda.l	#$00020000,a2
	bsr.s	Lff1e08
	move.w	(a7)+,($00e8002a)
	movem.l	(a7)+,d0-d2/a0-a2
	rts

Lff1e08:
	move.w	($0d0e),d2
	jmp	(Lff1e10,pc,d2.w)

Lff1e10:
	eor.b	d1,(a2)
	nop
	eor.b	d1,($0080,a2)
	eor.b	d1,($0100,a2)
	eor.b	d1,($0180,a2)
	eor.b	d1,($0200,a2)
	eor.b	d1,($0280,a2)
	eor.b	d1,($0300,a2)
	eor.b	d1,($0380,a2)
	eor.b	d1,($0400,a2)
	eor.b	d1,($0480,a2)
	eor.b	d1,($0500,a2)
	eor.b	d1,($0580,a2)
	eor.b	d1,($0600,a2)
	eor.b	d1,($0680,a2)
	eor.b	d1,($0700,a2)
	eor.b	d1,($0780,a2)
	rts

Lff1e52:
	tst.b	($0933)
	bpl.s	Lff1e96
	btst.b	#$07,($0bbf)
	beq.s	Lff1e62
	rts

Lff1e62:
	movem.l	d0-d1/a0,-(a7)
	lea.l	($0933),a0
	clr.b	(a0)
	move.w	#$0003,($092a)
	move.l	#$00000930,($092c)
	lea.l	($00e98002),a0
	tst.w	(a0)
	tst.w	(a0)
	tst.w	(a0)
	tst.w	(a0)
	move.w	#$0040,d1
Lff1e8c:
	bsr.w	Lff694c
Lff1e90:
	movem.l	(a7)+,d0-d1/a0
	rts

Lff1e96:
	movem.l	d0-d1/a0,-(a7)
	lea.l	($0933),a0
	btst.b	#$05,(a0)
	bne.s	Lff1eae
	btst.b	#$00,($00e98001)
	beq.s	Lff1eb8
Lff1eae:
	move.b	#$80,(a0)
	move.w	#$0041,d1
	bra.s	Lff1e8c
Lff1eb8:
	move.b	(a0),d0
	addq.b	#1,d0
	cmp.b	#$04,d0
	bcc.s	Lff1ec6
	move.b	d0,(a0)
	bra.s	Lff1e90
Lff1ec6:
	move.b	#$80,(a0)
	lea.l	(Lff1ed8,pc),a0
	move.l	a0,($09b6)
	move.w	#$0041,d1
	bra.s	Lff1e8c
Lff1ed8:
	tst.b	($0933)
	bpl.s	Lff1f1e
	btst.b	#$07,($0bbf)
	beq.s	Lff1ee8
	rts

Lff1ee8:
	movem.l	d0-d1/a0,-(a7)
	lea.l	($0933),a0
	clr.b	(a0)
	move.w	#$0003,($092a)
	move.l	#$00000930,($092c)
	lea.l	($00e98002),a0
	tst.w	(a0)
	tst.w	(a0)
	tst.w	(a0)
	tst.w	(a0)
	subq.l	#2,a0
	move.w	#$0005,(a0)
	move.w	#$0062,(a0)
Lff1f18:
	movem.l	(a7)+,d0-d1/a0
	rts

Lff1f1e:
	movem.l	d0-d1/a0,-(a7)
	lea.l	($0933),a0
	btst.b	#$06,(a0)
	bne.s	Lff1f3a
	move.b	(a0),d0
	addq.b	#1,d0
	cmp.b	#$04,d0
	bcc.s	Lff1f40
	move.b	d0,(a0)
	bra.s	Lff1f18
Lff1f3a:
	move.b	#$80,(a0)
	bra.s	Lff1f18
Lff1f40:
	move.b	#$80,(a0)
	move.w	#$0005,($00e98000)
	move.w	#$0060,($00e98000)
	lea.l	(Lff1e52,pc),a0
	move.l	a0,($09b6)
	bra.s	Lff1f18
Lff1f5e:
	btst.b	#$06,($09e1)
	beq.s	Lff1f76
	tst.b	($09e1)
	bmi.s	Lff1f76
	clr.b	($00e94007)
	clr.b	($09e1)
Lff1f76:
	rts

Lff1f78:
	move.l	d0,-(a7)
	addq.l	#1,($09d6)
	move.l	($09d2),d0
	cmp.l	($09d6),d0
	bcs.s	Lff1f8c
	move.l	(a7)+,d0
	rts

Lff1f8c:
	move.b	($00e88001),d0
	btst.l	#$02,d0
	beq.s	Lff1fa6
	btst.l	#$01,d0
	beq.s	Lff1fa6
	move.l	#$58363803,d0
	trap	#10
Lff1fa6:
	move.l	#$ffffffff,($09d2)
	move.l	(a7)+,d0
	rts

Lff1fb2:
	ori.w	#$0700,sr
	bset.b	#$05,($0933)
	movem.l	d0-d1/a0-a1,-(a7)
	move.w	($00e98002),d0
	movea.l	($092c),a0
	move.b	d0,(a0)+
	move.l	a0,($092c)
	subq.w	#1,($092a)
	bne.s	Lff2040
	lea.l	($0930),a1
	move.l	a1,($092c)
	move.w	#$0003,($092a)
	btst.b	#$07,($0bbf)
	bne.s	Lff2040
	bset.b	#$07,($0bbf)
	bset.b	#$06,($0933)
	move.w	#$0005,($00e98000)
	move.w	#$0060,($00e98000)
	lea.l	($0cb1),a0
	move.b	(a1)+,(a0)+
	move.b	(a1)+,(a0)+
	move.b	(a1)+,(a0)+
	lea.l	($0cb1),a1
	move.w	#$0038,($00e98000)
	move.w	($0010,a7),d0
	or.w	#$2000,d0
	move.w	d0,sr
	movea.l	($0934),a0
	jsr	(a0)
	movea.l	($0938),a0
	jsr	(a0)
	bclr.b	#$07,($0bbf)
	movem.l	(a7)+,d0-d1/a0-a1
	rte

Lff2040:
	movem.l	(a7)+,d0-d1/a0-a1
	move.w	#$0038,($00e98000)
	rte

Lff204e:
	move.w	d0,-(a7)
	move.w	($00e98006),d0
	move.w	#$0030,($00e98004)
	move.w	#$0038,($00e98004)
	move.w	(a7)+,d0
	rte

Lff206a:
	move.w	d0,-(a7)
	move.w	($00e98002),d0
	move.w	#$0030,($00e98000)
	move.w	#$0038,($00e98000)
	move.w	(a7)+,d0
	rte

Lff2086:
	rte

Lff2088:
	tst.b	($00e8802f)
	rte

Lff2090:
	movem.l	d0-d2,-(a7)
	moveq.l	#$00,d0
	move.b	($00e8802f),d0
	cmp.b	#$ff,d0
	beq.s	Lff20cc
	bclr.b	#$04,($00e88013)
	move.w	($000c,a7),d2
	or.w	#$2000,d2
	move.w	d2,sr
	move.w	($0810),d1
	move.w	d0,-(a7)
	bsr.w	Lff4a4a
	move.w	(a7)+,d0
	bsr.s	Lff20fa
	bset.b	#$04,($00e88013)
	bra.s	Lff20e2
Lff20cc:
	bsr.s	Lff20e8
	move.b	($00ed003a),d1
	bsr.w	Call_KEYDLY
	move.b	($00ed003b),d1
	bsr.w	Call_KEYREP
Lff20e2:
	movem.l	(a7)+,d0-d2
	rte

Lff20e8:
	movem.l	d0-d1,-(a7)
	move.b	($0810),d1
	bsr.w	Call_LEDCTRL
	movem.l	(a7)+,d0-d1
	rts

Lff20fa:
	movem.l	d1-d2/a0,-(a7)
	bsr.w	Lff2232
	bsr.w	Lff2258
	bsr.w	Lff22e6
	tst.w	d1
	beq.s	Lff2152
	cmp.w	#$7300,d1
	beq.s	Lff2122
	cmp.w	#$7200,d1
	bne.s	Lff2134
	btst.b	#$03,($0811)
	bra.s	Lff2128
Lff2122:
	btst.b	#$02,($0811)
Lff2128:
	beq.s	Lff2134
	bsr.w	Lff220a
	move.w	#$6d00,d1
	bra.s	Lff214e
Lff2134:
	cmp.w	#$6100,d1
	beq.s	Lff21b2
	cmp.w	#$6200,d1
	beq.s	Lff2158
	cmp.b	#$03,d1
	beq.w	Lff21e6
	cmp.w	#$3700,d1
	beq.s	Lff217c
Lff214e:
	bsr.w	Lff220a
Lff2152:
	movem.l	(a7)+,d1-d2/a0
	rts

Lff2158:
	btst.b	#$02,($0bc5)
	bne.s	Lff214e
	bset.b	#$02,($0bc5)
	movem.l	d0-d7/a0-a6,-(a7)
	move.b	($0811),d0
	trap	#12
	movem.l	(a7)+,d0-d7/a0-a6
	bclr.b	#$02,($0bc5)
	bra.s	Lff214e
Lff217c:
	btst.b	#$02,($0811)
	beq.s	Lff214e
	btst.b	#$01,($0811)
	beq.s	Lff214e
	btst.b	#$00,($0bc5)
	bne.s	Lff2152
	bset.b	#$00,($0bc5)
	movem.l	d0-d7/a0-a6,-(a7)
	move.l	#$58363800,d0
	trap	#10
	movem.l	(a7)+,d0-d7/a0-a6
	bclr.b	#$00,($0bc5)
	bra.s	Lff2152
Lff21b2:
	btst.b	#$01,($0bc5)
	bne.s	Lff21d4
	bset.b	#$01,($0bc5)
	movem.l	d0-d7/a0-a6,-(a7)
	move.b	($0811),d0
	trap	#11
	movem.l	(a7)+,d0-d7/a0-a6
	bclr.b	#$01,($0bc5)
Lff21d4:
	move.b	#$13,d1
	btst.b	#$00,($0811)
	bne.w	Lff214e
	move.b	#$03,d1
Lff21e6:
	btst.b	#$03,($0bc5)
	bne.w	Lff214e
	bset.b	#$03,($0bc5)
	movem.l	d0-d7/a0-a6,-(a7)
	trap	#13
	movem.l	(a7)+,d0-d7/a0-a6
	bclr.b	#$03,($0bc5)
	bra.w	Lff214e
Lff220a:
	cmpi.w	#$0040,($0812)
	bcc.s	Lff2230
	movea.l	($0814),a0
	addq.l	#2,a0
	cmpa.l	#$0000089c,a0
	bcs.s	Lff2226
	movea.l	#$0000081c,a0
Lff2226:
	move.w	d1,(a0)
	move.l	a0,($0814)
	addq.w	#1,($0812)
Lff2230:
	rts

Lff2232:
	lea.l	($0800),a0
	clr.w	d1
	move.b	d0,d1
	move.b	d0,d2
	and.w	#$0007,d2
	lsr.w	#3,d1
	btst.l	#$04,d1
	beq.s	Lff2252
	bclr.l	#$04,d1
	bclr.b	d2,(a0,d1.w)
	rts

Lff2252:
	bset.b	d2,(a0,d1.w)
	rts

Lff2258:
	move.b	d0,d1
	and.b	#$7f,d1
	cmp.b	#$74,d1
	bcc.s	Lff22ae
	cmp.b	#$70,d1
	bcc.s	Lff229c
	btst.l	#$07,d0
	bne.s	Lff22ae
	cmp.b	#$5a,d1
	bcs.s	Lff22ae
	beq.s	Lff22b0
	cmp.b	#$5b,d1
	beq.s	Lff22c6
	cmp.b	#$5e,d1
	bcs.s	Lff22da
	cmp.b	#$61,d1
	bcc.s	Lff22ae
	sub.b	#$5a,d1
Lff228e:
	bchg.b	d1,($0810)
	move.w	d0,-(a7)
	bsr.w	Lff20e8
	move.w	(a7)+,d0
	rts

Lff229c:
	sub.b	#$70,d1
	tst.b	d0
	bpl.s	Lff22aa
	bclr.b	d1,($0811)
	rts

Lff22aa:
	bset.b	d1,($0811)
Lff22ae:
	rts

Lff22b0:
	btst.b	#$04,($0811)
	bne.s	Lff22da
	bclr.b	#$05,($0811)
	bclr.b	#$01,($0810)
	bra.s	Lff22da
Lff22c6:
	btst.b	#$05,($0811)
	bne.s	Lff22da
	bclr.b	#$04,($0811)
	bclr.b	#$00,($0810)
Lff22da:
	sub.b	#$56,d1
	bchg.b	d1,($0811)
	subq.b	#4,d1
	bra.s	Lff228e
Lff22e6:
	move.w	d0,d1
	move.b	($0811),d2
	btst.l	#$00,d2
	bne.s	Lff2300
	tst.b	($00ed0027)
	bne.s	Lff2312
	btst.l	#$03,d2
	beq.s	Lff2312
Lff2300:
	cmp.b	#$4e,d0
	beq.s	Lff2312
	cmp.b	#$3b,d0
	bcs.s	Lff2312
	cmp.b	#$52,d0
	bcs.s	Lff2334
Lff2312:
	asl.w	#8,d1
	cmp.b	#$35,d0
	bcs.s	Lff2338
	cmp.b	#$80,d0
	bcs.s	Lff232a
	cmp.b	#$f0,d0
	bcc.s	Lff2328
	clr.w	d1
Lff2328:
	rts

Lff232a:
	lea.l	(Lff23fa,pc),a0
	move.b	(a0,d0.w),d1
	rts

Lff2334:
	clr.b	d1
	rts

Lff2338:
	btst.l	#$01,d2
	bne.w	Lff23d6
	btst.l	#$06,d2
	bne.s	Lff232a
	btst.l	#$02,d2
	bne.s	Lff2358
	btst.l	#$04,d2
	bne.s	Lff238e
	btst.l	#$05,d2
	bne.s	Lff237e
Lff2358:
	bsr.s	Lff237e
	btst.l	#$07,d2
	bne.s	Lff237c
	cmp.b	#$41,d1
	bcs.s	Lff237c
	cmp.b	#$5b,d1
	bcs.s	Lff2378
	cmp.b	#$61,d1
	bcs.s	Lff237c
	cmp.b	#$7b,d1
	bcc.s	Lff237c
Lff2378:
	eori.b	#$20,d1
Lff237c:
	rts

Lff237e:
	btst.l	#$00,d2
	beq.s	Lff232a
	lea.l	(Lff247a,pc),a0
	move.b	(a0,d0.w),d1
	rts

Lff238e:
	tst.b	($00ed002b)
	bne.s	Lff23ae
	lea.l	(Lff24af,pc),a0
	move.b	(a0,d0.w),d1
	btst.l	#$00,d2
	beq.s	Lff23cc
	lea.l	(Lff24e4,pc),a0
	move.w	#$000f,d2
	bra.s	Lff23c4
Lff23ae:
	lea.l	(Lff24f4,pc),a0
	move.b	(a0,d0.w),d1
	btst.l	#$00,d2
	beq.s	Lff23cc
	lea.l	(Lff2529,pc),a0
	move.w	#$0010,d2
Lff23c4:
	cmp.b	(a0)+,d1
	beq.s	Lff23ce
	dbra.w	d2,Lff23c4
Lff23cc:
	rts

Lff23ce:
	add.b	#$a0,d2
	move.b	d2,d1
	rts

Lff23d6:
	lea.l	(Lff247a,pc),a0
	move.b	(a0,d0.w),d1
	cmp.b	#$20,d1
	bcs.s	Lff23f8
	cmp.b	#$40,d1
	bcs.w	Lff2334
	cmp.b	#$80,d1
	bcc.w	Lff2334
	and.b	#$1f,d1
Lff23f8:
	rts

Lff23fa:
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
Lff247a:
	.dc.b	$00,$1b,$21,$22,$23,$24,$25,$26
	.dc.b	$27,$28,$29,$00,$3d,$7e,$7c,$08
	.dc.b	$09,$71,$77,$65,$72,$74,$79,$75
	.dc.b	$69,$6f,$70,$60,$7b,$0d,$61,$73
	.dc.b	$64,$66,$67,$68,$6a,$6b,$6c,$2b
	.dc.b	$2a,$7d,$7a,$78,$63,$76,$62,$6e
	.dc.b	$6d,$3c,$3e,$3f,$5f
Lff24af:
	.dc.b	$00,$1b,$c7,$cc,$b1,$b3,$b4,$b5
	.dc.b	$d4,$d5,$d6,$dc,$ce,$cd,$b0,$08
	.dc.b	$09,$c0,$c3,$b2,$bd,$b6,$dd,$c5
	.dc.b	$c6,$d7,$be,$de,$df,$0d,$c1,$c4
	.dc.b	$bc,$ca,$b7,$b8,$cf,$c9,$d8,$da
	.dc.b	$b9,$d1,$c2,$bb,$bf,$cb,$ba,$d0
	.dc.b	$d3,$c8,$d9,$d2,$db
Lff24e4:
	.dc.b	'ﾂﾖﾕﾔｵｴｳｲｱﾜﾒﾈﾑﾟﾙﾛ'
Lff24f4:
	.dc.b	$00,$1b,$b1,$b2,$b3,$b4,$b5,$c5
	.dc.b	$c6,$c7,$c8,$c9,$d7,$d8,$d9,$08
	.dc.b	$09,$b6,$b7,$b8,$b9,$ba,$ca,$cb
	.dc.b	$cc,$cd,$ce,$da,$db,$0d,$bb,$bc
	.dc.b	$bd,$be,$bf,$cf,$d0,$d1,$d2,$d3
	.dc.b	$de,$df,$c0,$c1,$c2,$c3,$c4,$d4
	.dc.b	$d5,$d6,$dc,$a6,$dd
Lff2529:
	.dc.b	$de,$c2,$d6,$d5,$d4,$b5,$b4,$b3
	.dc.b	$b2,$b1,$c9,$dd,$dc,$df,$db,$a6
	.dc.b	$bb,$2f,$08,$c0,$bc,$00,$00,$00
	.dc.b	$ff,$31,$c0,$0a,$0e,$4e,$7a,$88
	.dc.b	$01,$d1,$c0,$d1,$c0,$d1,$c0,$d1
	.dc.b	$c0,$20,$68,$04,$00,$4e,$90,$31
	.dc.b	$fc,$ff,$ff,$0a,$0e,$20,$5f,$4e
	.dc.b	$73,$60,$d6
Lff2564:
	move.l	a0,-(a7)
	and.w	#$00ff,d0
	ext.l	d0
	move.w	d0,($0a0e)
	movea.l	d0,a0
	adda.w	a0,a0
	adda.w	a0,a0
	movea.l	($0400,a0),a0
	jsr	(a0)
	move.w	#$ffff,($0a0e)
	movea.l	(a7)+,a0
	rte

Lff2586:
	addq.l	#4,a7
	move.w	#$01ff,d7
	move.w	#$ffff,($0a0e)
	bra.w	Lff07b2
Call_Unused:
	addq.l	#8,a7
	move.w	#$0100,d7
	move.b	d0,d7
	move.w	#$ffff,($0a0e)
	bra.w	Lff07b2
VecTable:
	.dc.w	Call_KEYINP-$ff0000
	.dc.w	Call_KEYSNS-$ff0000
	.dc.w	Call_SFTSNS-$ff0000
	.dc.w	Call_KEY_INIT-$ff0000
	.dc.w	Call_BITSNS-$ff0000
	.dc.w	Call_SKEYSET-$ff0000
	.dc.w	Call_LEDCTRL-$ff0000
	.dc.w	Call_LEDSET-$ff0000
	.dc.w	Call_KEYDLY-$ff0000
	.dc.w	Call_KEYREP-$ff0000
	.dc.w	Call_TV_Control_OPT2-$ff0000
	.dc.w	Call_TV_Control_OPT2-$ff0000
	.dc.w	Call_TVCTRL-$ff0000
	.dc.w	Call_LEDMOD-$ff0000
	.dc.w	Call_TGUSEMD-$ff0000
	.dc.w	Call_DEFCHR-$ff0000
	.dc.w	Call_CRTMOD-$ff0000
	.dc.w	Call_CONTRAST-$ff0000
	.dc.w	Call_HSVTORGB-$ff0000
	.dc.w	Call_TPALET-$ff0000
	.dc.w	Call_TPALET2-$ff0000
	.dc.w	Call_TCOLOR-$ff0000
	.dc.w	Call_FNTADR-$ff0000
	.dc.w	Call_VRAMGET-$ff0000
	.dc.w	Call_VRAMPUT-$ff0000
	.dc.w	Call_FNTGET-$ff0000
	.dc.w	Call_TEXTGET-$ff0000
	.dc.w	Call_TEXTPUT-$ff0000
	.dc.w	Call_CLIPPUT-$ff0000
	.dc.w	Call_SCROLL-$ff0000
	.dc.w	Call_B_CURON-$ff0000
	.dc.w	Call_B_CUROFF-$ff0000
	.dc.w	Call_B_PUTC-$ff0000
	.dc.w	Call_B_PRINT-$ff0000
	.dc.w	Call_B_COLOR-$ff0000
	.dc.w	Call_B_LOCATE-$ff0000
	.dc.w	Call_B_DOWN_S-$ff0000
	.dc.w	Call_B_UP_S-$ff0000
	.dc.w	Call_B_UP-$ff0000
	.dc.w	Call_B_DOWN-$ff0000
	.dc.w	Call_B_RIGHT-$ff0000
	.dc.w	Call_B_LEFT-$ff0000
	.dc.w	Call_B_CLR_ST-$ff0000
	.dc.w	Call_B_ERA_ST-$ff0000
	.dc.w	Call_B_INS-$ff0000
	.dc.w	Call_B_DEL-$ff0000
	.dc.w	Call_B_CONSOL-$ff0000
	.dc.w	Call_B_PUTMES-$ff0000
	.dc.w	Call_SET232C-$ff0000
	.dc.w	Call_LOF232C-$ff0000
	.dc.w	Call_INP232C-$ff0000
	.dc.w	Call_ISNS232C-$ff0000
	.dc.w	Call_OSNS232C-$ff0000
	.dc.w	Call_OUT232C-$ff0000
	.dc.w	Call_Unknown_36-$ff0000
	.dc.w	Call_Unknown_37-$ff0000
	.dc.w	Call_SETFNTADR-$ff0000
	.dc.w	Call_Unknown_39-$ff0000
	.dc.w	Call_Unknown_3a-$ff0000
	.dc.w	Call_JOYGET-$ff0000
	.dc.w	Call_INIT_PRN-$ff0000
	.dc.w	Call_SNSPRN-$ff0000
	.dc.w	Call_OUTLPT-$ff0000
	.dc.w	Call_OUTPRN-$ff0000
	.dc.w	Call_B_SEEK-$ff0000
	.dc.w	Call_B_VERIFY-$ff0000
	.dc.w	Call_B_READDI-$ff0000
	.dc.w	Call_B_DSKINI-$ff0000
	.dc.w	Call_B_DRVSNS-$ff0000
	.dc.w	Call_B_WRITE-$ff0000
	.dc.w	Call_B_READ-$ff0000
	.dc.w	Call_B_RECALI-$ff0000
	.dc.w	Call_B_ASSIGN-$ff0000
	.dc.w	Call_B_WRITED-$ff0000
	.dc.w	Call_B_READID-$ff0000
	.dc.w	Call_B_BADFMT-$ff0000
	.dc.w	Call_B_READDL-$ff0000
	.dc.w	Call_B_FORMAT-$ff0000
	.dc.w	Call_B_DRVCHK-$ff0000
	.dc.w	Call_B_EJECT-$ff0000
	.dc.w	Call_DATEBCD-$ff0000
	.dc.w	Call_DATESET-$ff0000
	.dc.w	Call_TIMEBCD-$ff0000
	.dc.w	Call_TIMESET-$ff0000
	.dc.w	Call_DATEGET-$ff0000
	.dc.w	Call_DATEBIN-$ff0000
	.dc.w	Call_TIMEGET-$ff0000
	.dc.w	Call_TIMEBIN-$ff0000
	.dc.w	Call_DATECNV-$ff0000
	.dc.w	Call_TIMECNV-$ff0000
	.dc.w	Call_DATEASC-$ff0000
	.dc.w	Call_TIMEASC-$ff0000
	.dc.w	Call_DAYASC-$ff0000
	.dc.w	Call_ALARMMOD-$ff0000
	.dc.w	Call_ALARMSET-$ff0000
	.dc.w	Call_ALARMGET-$ff0000
	.dc.w	Call_ADPCMOUT-$ff0000
	.dc.w	Call_ADPCMINP-$ff0000
	.dc.w	Call_ADPCMAOT-$ff0000
	.dc.w	Call_ADPCMAIN-$ff0000
	.dc.w	Call_ADPCMLOT-$ff0000
	.dc.w	Call_ADPCMLIN-$ff0000
	.dc.w	Call_ADPCMSNS-$ff0000
	.dc.w	Call_ADPCMMOD-$ff0000
	.dc.w	Call_OPMSET-$ff0000
	.dc.w	Call_OPMSNS-$ff0000
	.dc.w	Call_OPMINTST-$ff0000
	.dc.w	Call_TIMERDST-$ff0000
	.dc.w	Call_VDISPST-$ff0000
	.dc.w	Call_CRTCRAS-$ff0000
	.dc.w	Call_HSYNCST-$ff0000
	.dc.w	Call_PRNINTST-$ff0000
	.dc.w	Call_MS_INIT-$ff0000
	.dc.w	Call_MS_CURON-$ff0000
	.dc.w	Call_MS_CUROF-$ff0000
	.dc.w	Call_MS_STAT-$ff0000
	.dc.w	Call_MS_GETDT-$ff0000
	.dc.w	Call_MS_CURGT-$ff0000
	.dc.w	Call_MS_CURST-$ff0000
	.dc.w	Call_MS_LIMIT-$ff0000
	.dc.w	Call_MS_OFFTM-$ff0000
	.dc.w	Call_MS_ONTM-$ff0000
	.dc.w	Call_MS_PATST-$ff0000
	.dc.w	Call_MS_SEL-$ff0000
	.dc.w	Call_MS_SEL2-$ff0000
	.dc.w	Call_SKEY_MOD-$ff0000
	.dc.w	Call_DENSNS-$ff0000
	.dc.w	Call_ONTIME-$ff0000
	.dc.w	Call_B_INTVCS-$ff0000
	.dc.w	Call_B_SUPER-$ff0000
	.dc.w	Call_B_BPEEK-$ff0000
	.dc.w	Call_B_WPEEK-$ff0000
	.dc.w	Call_B_LPEEK-$ff0000
	.dc.w	Call_B_MEMSTR-$ff0000
	.dc.w	Call_B_BPOKE-$ff0000
	.dc.w	Call_B_WPOKE-$ff0000
	.dc.w	Call_B_LPOKE-$ff0000
	.dc.w	Call_B_MEMSET-$ff0000
	.dc.w	Call_DMAMOVE-$ff0000
	.dc.w	Call_DMAMOV_A-$ff0000
	.dc.w	Call_DMAMOV_L-$ff0000
	.dc.w	Call_DMAMODE-$ff0000
	.dc.w	Call_BOOTINF-$ff0000
	.dc.w	Call_ROMVER-$ff0000
	.dc.w	Call_G_CLR_ON-$ff0000
	.dc.w	Call_Unknown_91-$ff0000
	.dc.w	Call_Unknown_92-$ff0000
	.dc.w	Call_Unknown_93-$ff0000
	.dc.w	Call_GPALET-$ff0000
	.dc.w	Call_Unknown_95-$ff0000
	.dc.w	Call_Unknown_96-$ff0000
	.dc.w	Call_Unknown_97-$ff0000
	.dc.w	Call_Unknown_98-$ff0000
	.dc.w	Call_Unknown_99-$ff0000
	.dc.w	Call_Unknown_9a-$ff0000
	.dc.w	Call_Unknown_9b-$ff0000
	.dc.w	Call_Unknown_9c-$ff0000
	.dc.w	Call_Unused-$ff0000
	.dc.w	Call_Unused-$ff0000
	.dc.w	Call_Unused-$ff0000
	.dc.w	Call_SFTJIS-$ff0000
	.dc.w	Call_JISSFT-$ff0000
	.dc.w	Call_AKCONV-$ff0000
	.dc.w	Call_RMACNV-$ff0000
	.dc.w	Call_DAKJOB-$ff0000
	.dc.w	Call_HANJOB-$ff0000
	.dc.w	Call_Unused-$ff0000
	.dc.w	Call_Unused-$ff0000
	.dc.w	Call_Unused-$ff0000
	.dc.w	Call_Unused-$ff0000
	.dc.w	Call_Unused-$ff0000
	.dc.w	Call_Unused-$ff0000
	.dc.w	Call_SYS_STAT-$ff0000
	.dc.w	Call_B_CONMOD-$ff0000
	.dc.w	Call_OS_CURON-$ff0000
	.dc.w	Call_OS_CUROF-$ff0000
	.dc.w	Call_DRAWMODE-$ff0000
	.dc.w	Call_APAGE-$ff0000
	.dc.w	Call_VPAGE-$ff0000
	.dc.w	Call_HOME-$ff0000
	.dc.w	Call_WINDOW-$ff0000
	.dc.w	Call_WIPE-$ff0000
	.dc.w	Call_PSET-$ff0000
	.dc.w	Call_POINT-$ff0000
	.dc.w	Call_LINE-$ff0000
	.dc.w	Call_BOX-$ff0000
	.dc.w	Call_FILL-$ff0000
	.dc.w	Call_CIRCLE-$ff0000
	.dc.w	Call_PAINT-$ff0000
	.dc.w	Call_SYMBOL-$ff0000
	.dc.w	Call_GETGRM-$ff0000
	.dc.w	Call_PUTGRM-$ff0000
	.dc.w	Call_SP_INIT-$ff0000
	.dc.w	Call_SP_ON-$ff0000
	.dc.w	Call_SP_OFF-$ff0000
	.dc.w	Call_SP_CGCLR-$ff0000
	.dc.w	Call_SP_DEFCG-$ff0000
	.dc.w	Call_SP_GTPCG-$ff0000
	.dc.w	Call_SP_REGST-$ff0000
	.dc.w	Call_SP_REGGT-$ff0000
	.dc.w	Call_BGSCRLST-$ff0000
	.dc.w	Call_BGSCRLGT-$ff0000
	.dc.w	Call_BGCTRLST-$ff0000
	.dc.w	Call_BGCTRLGT-$ff0000
	.dc.w	Call_BGTEXTCL-$ff0000
	.dc.w	Call_BGTEXTST-$ff0000
	.dc.w	Call_BGTEXTGT-$ff0000
	.dc.w	Call_SPALET-$ff0000
	.dc.w	Call_Unused-$ff0000
	.dc.w	Call_Unused-$ff0000
	.dc.w	Call_Unused-$ff0000
	.dc.w	Call_TXXLINE-$ff0000
	.dc.w	Call_TXYLINE-$ff0000
	.dc.w	Call_TXLINE-$ff0000
	.dc.w	Call_TXBOX-$ff0000
	.dc.w	Call_TXFILL-$ff0000
	.dc.w	Call_TXREV-$ff0000
	.dc.w	Call_Unused-$ff0000
	.dc.w	Call_Unused-$ff0000
	.dc.w	Call_Unused-$ff0000
	.dc.w	Call_Unused-$ff0000
	.dc.w	Call_Unused-$ff0000
	.dc.w	Call_Unused-$ff0000
	.dc.w	Call_Unknown_df-$ff0000
Call_DATEBCD:
	movem.l	d1-d5/a0,-(a7)
	move.l	d1,d2
	move.l	d1,d3
	swap.w	d1
	lsr.w	#8,d2
	and.l	#$00000fff,d1
	and.l	#$000000ff,d2
	and.l	#$000000ff,d3
	cmp.l	#$000007bc,d1
	bcs.w	Lff2898
	cmp.l	#$0000081f,d1
	bhi.w	Lff2898
	sub.l	#$000007bc,d1
	tst.l	d2
	beq.w	Lff2898
	cmp.l	#$0000000c,d2
	bhi.w	Lff2898
	tst.l	d3
	beq.w	Lff2898
	cmp.l	#$0000001f,d3
	bhi.w	Lff2898
	cmp.l	#$00000002,d2
	bne.s	$00ff27e6
	cmp.l	#$0000001d,d3
	bhi.w	Lff2898
	bcs.s	$00ff2808
	btst.l	#$00,d1
	bne.w	Lff2898
	btst.l	#$01,d1
	bne.w	Lff2898
	bra.s	$00ff2808
	cmp.l	#$0000001f,d3
	bne.s	$00ff2808
	cmp.l	#$00000008,d2
	bcs.s	$00ff2800
	btst.l	#$00,d2
	bne.w	Lff2898
	bra.s	$00ff2808
	btst.l	#$00,d2
	beq.w	Lff2898
	move.l	d1,d4
	lsr.l	#2,d4
	divu.w	#$0007,d4
	swap.w	d4
	move.l	d1,d5
	lea.l	(Lff28a0,pc),a0
	and.l	#$00000003,d5
	bne.s	Lff2824
	lea.l	($008a,pc),a0
Lff2824:
	move.b	(-$01,a0,d2.w),d0
	lea.l	($008e,pc),a0
	add.b	(a0,d4.w),d0
	lea.l	($008d,pc),a0
	add.b	(a0,d5.w),d0
	add.b	d3,d0
	subq.b	#1,d0
	and.l	#$000000ff,d0
	divu.w	#$0007,d0
	swap.w	d0
	and.l	#$00000007,d0
	move.l	d0,d4
	divu.w	#$000a,d1
	move.l	d1,d0
	ror.l	#8,d0
	ror.l	#4,d0
	add.l	d0,d1
	and.l	#Lff0000,d1
	divu.w	#$000a,d2
	move.l	d2,d0
	lsl.l	#8,d0
	lsl.l	#4,d0
	lsr.l	#8,d2
	add.w	d0,d2
	divu.w	#$000a,d3
	swap.w	d3
	move.l	d3,d0
	lsr.l	#8,d0
	lsr.l	#4,d0
	add.w	d0,d3
	and.l	#$000000ff,d3
	ror.l	#8,d4
	ror.l	#4,d5
	move.l	d1,d0
	add.l	d2,d0
	add.l	d3,d0
	add.l	d4,d0
	add.l	d5,d0
	movem.l	(a7)+,d1-d5/a0
	rts

Lff2898:
	moveq.l	#$ff,d0
	movem.l	(a7)+,d1-d5/a0
	rts

Lff28a0:
	.dc.b	$00,$03,$03,$06,$01,$04,$06,$02
	.dc.b	$05,$00,$03,$05,$00,$03,$04,$00
	.dc.b	$02,$05,$00,$03,$06,$01,$04,$06
	.dc.b	$02,$00,$05,$03,$01,$06,$04,$00
	.dc.b	$02,$03,$04,$00
Call_DATESET:
	movem.l	d1-d2/a1,-(a7)
	move.w	sr,-(a7)
	ori.w	#$0700,sr
	lea.l	($00e8a000),a0
	move.l	d1,d0
	rol.l	#4,d0
	and.b	#$03,d0
	move.b	($001b,a0),d2
	bset.l	#$00,d2
	bclr.l	#$03,d2
	move.b	d2,($001b,a0)
	tst.b	($00e9a001)
	tst.b	($00e9a001)
	move.b	d0,($0017,a0)
	tst.b	($00e9a001)
	tst.b	($00e9a001)
	bclr.l	#$00,d2
	move.b	d2,($001b,a0)
	move.l	d1,d0
	rol.l	#8,d0
	and.w	#$0007,d0
	lea.l	($000c,a0),a1
	move.w	d0,(a1)+
	moveq.l	#$05,d2
	move.b	d1,d0
	and.w	#$000f,d0
	move.w	d0,(a1)+
	ror.l	#4,d1
	dbra.w	d2,$00ff2920
	move.b	($001b,a0),d2
	bset.l	#$03,d2
	tst.b	($00e9a001)
	tst.b	($00e9a001)
	move.b	d2,($001b,a0)
	clr.l	d0
	move.w	(a7)+,sr
	movem.l	(a7)+,d1-d2/a1
	rts

Call_TIMEBCD:
	movem.l	d1-d2,-(a7)
	swap.w	d1
	clr.l	d2
	move.b	d1,d2
	cmp.b	#$18,d2
	bcc.s	Lff29a6
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
	cmp.b	#$3c,d2
	bcc.s	Lff29a6
	divu.w	#$000a,d2
	or.b	d2,d0
	swap.w	d2
	rol.l	#4,d0
	or.b	d2,d0
	rol.l	#4,d0
	rol.l	#8,d1
	clr.l	d2
	move.b	d1,d2
	cmp.b	#$3c,d2
	bcc.s	Lff29a6
	divu.w	#$000a,d2
	or.b	d2,d0
	swap.w	d2
	rol.l	#4,d0
	or.b	d2,d0
	bra.s	Lff29a8
Lff29a6:
	moveq.l	#$ff,d0
Lff29a8:
	movem.l	(a7)+,d1-d2
	rts

Call_TIMESET:
	movem.l	d1-d2/a1,-(a7)
	lea.l	($00e8a000),a0
	move.b	#$06,($001f,a0)
	move.l	d1,d0
	rol.l	#8,d0
	and.b	#$01,d0
	move.b	($001b,a0),d2
	bset.l	#$00,d2
	tst.b	($00e9a001)
	tst.b	($00e9a001)
	move.b	d2,($001b,a0)
	tst.b	($00e9a001)
	tst.b	($00e9a001)
	move.b	d0,($0015,a0)
	tst.b	($00e9a001)
	tst.b	($00e9a001)
	bclr.l	#$00,d2
	move.b	d2,($001b,a0)
	lea.l	($0000.w,a0),a1
	moveq.l	#$05,d2
Lff2a08:
	move.b	d1,d0
	and.w	#$000f,d0
	move.w	d0,(a1)+
	ror.l	#4,d1
	dbra.w	d2,Lff2a08
	move.b	#$04,($001f,a0)
	clr.l	d0
	movem.l	(a7)+,d1-d2/a1
	rts

Call_DATEGET:
	movem.l	d1-d2/a1,-(a7)
	lea.l	($00e8a000),a0
	bclr.b	#$00,($001b,a0)
	bsr.s	Lff2a44
	cmp.b	#$02,d0
	bcc.s	Lff2a3e
	bsr.s	Lff2a44
Lff2a3e:
	movem.l	(a7)+,d1-d2/a1
	rts

Lff2a44:
	move.b	($000d,a0),d0
	and.w	#$0007,d0
	lea.l	($001a,a0),a1
Lff2a50:
	moveq.l	#$05,d2
Lff2a52:
	move.w	-(a1),d1
	and.w	#$000f,d1
	asl.l	#4,d0
	or.b	d1,d0
	dbra.w	d2,Lff2a52
	rts

Call_DATEBIN:
	movem.l	d1-d3,-(a7)
	rol.l	#8,d1
	move.b	d1,d0
	and.w	#$000f,d0
	rol.w	#4,d0
	move.w	d0,d2
	bsr.s	Lff2a80
	add.l	#$07bc0000,d0
	movem.l	(a7)+,d1-d3
	rts

Lff2a80:
	moveq.l	#$02,d3
Lff2a82:
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
	dbra.w	d3,Lff2a82
	move.l	d2,d0
	rts

Call_TIMEGET:
	movem.l	d1-d2/a1,-(a7)
	lea.l	($00e8a000),a0
	bsr.s	Lff2abc
	tst.b	d0
	bne.s	Lff2ab6
	bsr.s	Lff2abc
Lff2ab6:
	movem.l	(a7)+,d1-d2/a1
	rts

Lff2abc:
	move.b	($001b,a0),d2
	bset.l	#$00,d2
	tst.b	($00e9a001)
	tst.b	($00e9a001)
	move.b	d2,($001b,a0)
	tst.b	($00e9a001)
	tst.b	($00e9a001)
	move.b	($0015,a0),d0
	tst.b	($00e9a001)
	tst.b	($00e9a001)
	bclr.l	#$00,d2
	move.b	d2,($001b,a0)
	and.w	#$0001,d0
	lea.l	($000c,a0),a1
	bra.w	Lff2a50
Call_TIMEBIN:
	movem.l	d1-d3,-(a7)
	rol.l	#8,d1
	clr.l	d2
	bsr.w	Lff2a80
	movem.l	(a7)+,d1-d3
	rts

Call_DATECNV:
	movem.l	d1-d2,-(a7)
	bsr.s	Lff2b72
	cmp.l	#$00000820,d1
	bcc.s	Lff2b6e
	cmp.w	#$07bc,d1
	bcc.s	Lff2b44
	cmp.w	#$0064,d1
	bcc.s	Lff2b6e
	cmp.w	#$0050,d1
	bcc.s	Lff2b3e
	add.l	#$000007d0,d1
	bra.s	Lff2b44
Lff2b3e:
	add.l	#$0000076c,d1
Lff2b44:
	move.l	d1,d2
	swap.w	d2
	bsr.s	Lff2b72
	cmp.l	#$0000000d,d1
	bcc.s	Lff2b6e
	move.b	d1,d2
	beq.s	Lff2b6e
	asl.w	#8,d2
	bsr.s	Lff2b72
	cmp.l	#$00000020,d1
	bcc.s	Lff2b6e
	move.b	d1,d2
	beq.s	Lff2b6e
	move.l	d2,d0
Lff2b68:
	movem.l	(a7)+,d1-d2
	rts

Lff2b6e:
	moveq.l	#$ff,d0
	bra.s	Lff2b68
Lff2b72:
	clr.l	d1
	clr.l	d0
	move.b	(a1)+,d0
	beq.s	Lff2b9a
	cmp.b	#$20,d0
	beq.s	Lff2b72
Lff2b80:
	cmp.b	#$30,d0
	bcs.s	Lff2b9c
	cmp.b	#$3a,d0
	bcc.s	Lff2b9c
	sub.b	#$30,d0
	mulu.w	#$000a,d1
	add.w	d0,d1
	move.b	(a1)+,d0
	bne.s	Lff2b80
Lff2b9a:
	subq.l	#1,a0
Lff2b9c:
	rts

Call_TIMECNV:
	movem.l	d1-d2,-(a7)
	bsr.s	Lff2b72
	cmp.l	#$00000018,d1
	bcc.s	Lff2b6e
	move.l	d1,d2
	swap.w	d2
	bsr.s	Lff2b72
	cmp.l	#$0000003c,d1
	bcc.s	Lff2b6e
	move.b	d1,d2
	asl.w	#8,d2
	bsr.s	Lff2b72
	cmp.l	#$0000003c,d1
	bcc.s	Lff2b6e
	move.b	d1,d2
	move.l	d2,d0
	bra.s	Lff2b68
Call_DATEASC:
	movem.l	d1-d3,-(a7)
	move.l	d1,d2
	swap.w	d2
	and.l	#$00000fff,d2
	cmp.w	#$0820,d2
	bcc.s	Lff2c48
	cmp.w	#$07bc,d2
	bcs.s	Lff2c48
	clr.l	d3
	move.w	d1,d3
	lsr.w	#8,d3
	tst.b	d3
	beq.s	Lff2c48
	cmp.b	#$0d,d3
	bcc.s	Lff2c48
	tst.b	d1
	beq.s	Lff2c48
	cmp.b	#$20,d1
	bcc.s	Lff2c48
	btst.l	#$1d,d1
	beq.s	Lff2c0e
	divu.w	#$0064,d2
	bra.s	Lff2c26
Lff2c0e:
	divu.w	#$03e8,d2
	add.b	#$30,d2
	move.b	d2,(a1)+
	clr.w	d2
	swap.w	d2
	divu.w	#$0064,d2
	add.b	#$30,d2
	move.b	d2,(a1)+
Lff2c26:
	clr.w	d2
	swap.w	d2
	bsr.s	Lff2c50
	bsr.s	Lff2c64
	move.b	d0,(a1)+
	move.l	d3,d2
	bsr.s	Lff2c50
	bsr.s	Lff2c64
	move.b	d0,(a1)+
	move.w	d1,d2
	and.l	#$000000ff,d2
	bsr.s	Lff2c50
	clr.b	(a1)
	clr.l	d0
	bra.s	Lff2c4a
Lff2c48:
	moveq.l	#$ff,d0
Lff2c4a:
	movem.l	(a7)+,d1-d3
	rts

Lff2c50:
	divu.w	#$000a,d2
	add.b	#$30,d2
	move.b	d2,(a1)+
	swap.w	d2
	add.b	#$30,d2
	move.b	d2,(a1)+
	rts

Lff2c64:
	btst.l	#$1c,d1
	beq.s	Lff2c70
	move.b	#$2d,d0
	rts

Lff2c70:
	move.b	#$2f,d0
	rts

Call_TIMEASC:
	movem.l	d1-d3,-(a7)
	move.l	d1,d2
	clr.w	d2
	swap.w	d2
	cmp.w	#$0018,d2
	bcc.s	Lff2c48
	clr.l	d3
	move.w	d1,d3
	lsr.w	#8,d3
	cmp.b	#$3c,d3
	bcc.s	Lff2c48
	cmp.b	#$3c,d1
	bcc.s	Lff2c48
	movea.l	a1,a0
	bsr.s	Lff2c50
	cmpi.b	#$30,(a0)
	bne.s	Lff2ca6
	move.b	#$20,(a0)
Lff2ca6:
	move.b	#$3a,(a1)+
	move.l	d3,d2
	bsr.s	Lff2c50
	move.b	#$3a,(a1)+
	move.w	d1,d2
	and.l	#$000000ff,d2
	bsr.s	Lff2c50
	clr.b	(a1)
	clr.l	d0
	bra.s	Lff2c4a
Call_DAYASC:
	move.b	d1,d0
	and.w	#$0007,d0
	add.w	d0,d0
	lea.l	(Lff2cdc,pc),a0
	move.b	(a0,d0.w),(a1)+
	move.b	($01,a0,d0.w),(a1)+
	clr.b	(a1)
	clr.l	d0
	rts

Lff2cdc:
	.dc.b	'日月火水木金土？'
Call_ALARMMOD:
	clr.l	d0
Lff2cee:
	cmp.b	#$02,d1
	bcc.s	$00ff2d1c
	lea.l	($00e8a000),a0
	tst.b	d1
	bne.s	$00ff2d02
	move.b	#$07,d0
	bsr.w	Lff2dfa
	move.b	#$31,($00e8e00d)
	move.b	d0,($00ed0026)
	move.b	#$00,($00e8e00d)
	move.b	($00ed0026),d0
	and.l	#$00000001,d0
	eori.b	#$01,d0
	rts

Call_ALARMSET:
	move.b	#$31,($00e8e00d)
	move.l	a1,($00ed001e)
	move.l	d1,($00ed0022)
	subq.l	#1,d2
	move.l	d2,($00ed0014)
	addq.l	#1,d2
	clr.b	($00ed0026)
	move.b	#$00,($00e8e00d)
	lea.l	($00e8a000),a0
	move.b	#$09,($001b,a0)
	tst.b	($00e9a001)
	tst.b	($00e9a001)
	move.b	#$05,($001f,a0)
	moveq.l	#$03,d0
	bsr.w	Lff0d12
	moveq.l	#$0f,d2
	move.b	d1,d0
	and.b	d2,d0
	cmp.b	d2,d0
	beq.s	Lff2d8c
	move.b	d0,($0005,a0)
Lff2d8c:
	ror.l	#4,d1
	move.b	d1,d0
	and.b	d2,d0
	cmp.b	d2,d0
	beq.s	Lff2d9a
	move.b	d0,($0007,a0)
Lff2d9a:
	ror.l	#4,d1
	move.b	d1,d0
	and.b	d2,d0
	cmp.b	d2,d0
	beq.s	Lff2da8
	move.b	d0,($0009,a0)
Lff2da8:
	ror.l	#4,d1
	move.b	d1,d0
	and.b	d2,d0
	cmp.b	d2,d0
	beq.s	Lff2db6
	move.b	d0,($000b,a0)
Lff2db6:
	ror.l	#4,d1
	move.b	d1,d0
	and.b	d2,d0
	cmp.b	d2,d0
	beq.s	Lff2dc4
	move.b	d0,($000f,a0)
Lff2dc4:
	ror.l	#4,d1
	move.b	d1,d0
	and.b	d2,d0
	cmp.b	d2,d0
	beq.s	Lff2dd2
	move.b	d0,($0011,a0)
Lff2dd2:
	ror.l	#4,d1
	move.b	d1,d0
	and.b	d2,d0
	cmp.b	d2,d0
	beq.s	Lff2de0
	move.b	d0,($000d,a0)
Lff2de0:
	move.b	#$00,($0001,a0)
	tst.b	($00e9a001)
	tst.b	($00e9a001)
	move.b	#$08,($001b,a0)
	clr.l	d0
Lff2dfa:
	movem.l	d1,-(a7)
	move.b	($001b,a0),d1
	bset.l	#$00,d1
	tst.b	($00e9a001)
	tst.b	($00e9a001)
	move.b	d1,($001b,a0)
	tst.b	($00e9a001)
	tst.b	($00e9a001)
	tst.b	d0
	beq.s	Lff2e2a
	move.b	#$07,d0
Lff2e2a:
	move.b	d0,($0001,a0)
	tst.b	($00e9a001)
	tst.b	($00e9a001)
	bclr.l	#$00,d1
	move.b	d1,($001b,a0)
	movem.l	(a7)+,d1
	rts

Call_ALARMGET:
	move.l	($00ed001e),d0
	move.l	($00ed0022),d1
	move.l	($00ed0014),d2
	addq.l	#1,d2
	rts

Lff2e5e:
	bclr.l	#$1f,d0
	rts

Lff2e64:
	movem.l	d2-d3,-(a7)
Lff2e68:
	bsr.s	Lff2e70
	movem.l	(a7)+,d2-d3
	rts

Lff2e70:
	move.w	d1,d2
	and.w	#$07ff,d2
	sub.w	#$03ff,d2
	bcs.s	Lff2eb4
	cmp.w	#$0034,d2
	bcc.s	Lff2eb8
	move.l	#$80000000.l,d3
	cmp.w	#$0020,d2
	bcc.s	Lff2e9e
	and.l	#$000007ff,d1
	lsr.l	d2,d3
	subq.l	#1,d3
	not.l	d3
	and.l	d3,d0
	rts

Lff2e9e:
	move.w	d1,-(a7)
	andi.w	#$07ff,(a7)
	sub.w	#$0020,d2
	lsr.l	d2,d3
	subq.l	#1,d3
	not.l	d3
	and.l	d3,d1
	or.w	(a7)+,d1
	rts

Lff2eb4:
	clr.l	d0
	clr.l	d1
Lff2eb8:
	rts

Lff2eba:
	movem.l	d2-d3,-(a7)
	tst.l	d0
	bpl.s	Lff2e68
	move.w	d1,d2
	and.w	#$07ff,d2
	cmp.w	#$0433,d2
	bcc.s	Lff2edc
	bsr.s	Lff2e70
	moveq.l	#$00,d2
	move.l	#$000003ff,d3
	bsr.w	Lff31f4
Lff2edc:
	movem.l	(a7)+,d2-d3
	rts

Lff2ee2:
	movem.l	d2-d3,-(a7)
	tst.l	d0
	bmi.w	Lff2e68
	move.w	d1,d2
	and.w	#$07ff,d2
	cmp.w	#$0433,d2
	bcc.s	Lff2f08
	bsr.w	Lff2e70
	moveq.l	#$00,d2
	move.l	#$000003ff,d3
	bsr.w	Lff3146
Lff2f08:
	movem.l	(a7)+,d2-d3
	rts

Lff2f0e:
	movem.l	d2-d3,-(a7)
	move.w	d1,d2
	and.w	#$07ff,d2
	cmp.w	#$03ff,d2
	bcs.s	Lff2f4c
	cmp.w	#$0433,d2
	bcc.s	Lff2f52
	move.l	d0,d3
	and.w	#$f800,d1
Lff2f2a:
	lsl.l	#1,d1
	roxl.l	#1,d0
	subq.w	#1,d2
	cmp.w	#$03ff,d2
	bcc.s	Lff2f2a
	tst.l	d0
	bmi.s	Lff2f42
	bne.s	Lff2f2a
	tst.l	d1
	bne.s	Lff2f2a
	bra.s	Lff2f52
Lff2f42:
	tst.l	d3
	bmi.s	Lff2f4a
	bclr.l	#$1f,d0
Lff2f4a:
	or.w	d2,d1
Lff2f4c:
	movem.l	(a7)+,d2-d3
	rts

Lff2f52:
	clr.l	d0
	clr.l	d1
	movem.l	(a7)+,d2-d3
	rts

Lff2f5c:
	tst.l	d0
	beq.s	Lff2f84
	move.l	d0,-(a7)
	andi.l	#$80000000,(a7)
	move.l	#$0000041e,d1
	tst.l	d0
	bpl.s	Lff2f74
	neg.l	d0
Lff2f74:
	bmi.s	Lff2f7c
	subq.w	#1,d1
	lsl.l	#1,d0
	bra.s	Lff2f74
Lff2f7c:
	bclr.l	#$1f,d0
	or.l	(a7)+,d0
	rts

Lff2f84:
	clr.l	d1
	rts

Lff2f88:
	move.l	d1,-(a7)
	and.w	#$07ff,d1
	sub.w	#$03ff,d1
	bcs.s	Lff2fb8
	cmp.w	#$001f,d1
	bcc.s	Lff2fc2
	movem.l	d0/d2,-(a7)
	move.l	d0,d2
	bset.l	#$1f,d2
	clr.l	d0
Lff2fa6:
	lsl.l	#1,d2
	roxl.l	#1,d0
	dbra.w	d1,Lff2fa6
	tst.l	(a7)+
	bpl.s	Lff2fb4
	neg.l	d0
Lff2fb4:
	move.l	(a7)+,d2
	bra.s	Lff2fba
Lff2fb8:
	clr.l	d0
Lff2fba:
	move.l	(a7)+,d1
	andi.b	#$fe,ccr
	rts

Lff2fc2:
	bne.s	Lff2fd0
	tst.l	d0
	bpl.s	Lff2fd0
	cmp.l	#$80000000,d0
	beq.s	Lff2fba
Lff2fd0:
	move.l	(a7)+,d1
	ori.b	#$01,ccr
	rts

Lff2fd8:
	movem.l	d1-d2/d7,-(a7)
	move.l	d0,d7
	beq.s	Lff301c
	bpl.s	Lff2fe4
	neg.l	d0
Lff2fe4:
	eor.l	d1,d7
	tst.l	d1
	beq.s	Lff301c
	bpl.s	Lff2fee
	neg.l	d1
Lff2fee:
	bsr.s	Lff3032
	tst.l	d0
	bne.s	Lff3012
	move.l	d1,d0
	tst.l	d7
	bpl.s	Lff300e
	cmp.l	#$80000000,d0
	bhi.s	Lff3012
	neg.l	d0
	andi.b	#$fe,ccr
Lff3008:
	movem.l	(a7)+,d1-d2/d7
	rts

Lff300e:
	tst.l	d0
	bpl.s	Lff3008
Lff3012:
	movem.l	(a7)+,d1-d2/d7
	ori.b	#$01,ccr
	rts

Lff301c:
	clr.l	d0
	movem.l	(a7)+,d1-d2/d7
	rts

Lff3024:
	movem.l	d1-d2/d7,-(a7)
	bsr.s	Lff3032
	tst.l	d0
	bne.s	Lff3012
	move.l	d1,d0
	bra.s	Lff3008
Lff3032:
	move.w	d1,d2
	mulu.w	d0,d2
	move.l	d2,-(a7)
	clr.l	-(a7)
	move.l	d0,d2
	swap.w	d2
	mulu.w	d1,d2
	add.l	d2,($0002,a7)
	bcc.s	Lff3048
	addq.w	#1,(a7)
Lff3048:
	move.l	d1,d2
	swap.w	d2
	mulu.w	d0,d2
	add.l	d2,($0002,a7)
	bcc.s	Lff3056
	addq.w	#1,(a7)
Lff3056:
	swap.w	d0
	swap.w	d1
	mulu.w	d1,d0
	add.l	(a7)+,d0
	move.l	(a7)+,d1
	rts

Lff3062:
	movem.l	d1-d3/d7,-(a7)
	move.l	d0,d7
	beq.s	Lff3084
	bpl.s	Lff306e
	neg.l	d0
Lff306e:
	eor.l	d1,d7
	tst.l	d1
	beq.s	Lff308a
	bpl.s	Lff3078
	neg.l	d1
Lff3078:
	bsr.s	Lff30ac
	tst.l	d7
	bpl.s	Lff3084
	neg.l	d0
	andi.b	#$fe,ccr
Lff3084:
	movem.l	(a7)+,d1-d3/d7
	rts

Lff308a:
	movem.l	(a7)+,d1-d3/d7
	ori.b	#$01,ccr
	rts

Lff3094:
	movem.l	d1-d3/d7,-(a7)
	tst.l	d0
	beq.s	Lff30a6
	tst.l	d1
	beq.s	Lff308a
	bsr.s	Lff30ac
	andi.b	#$fe,ccr
Lff30a6:
	movem.l	(a7)+,d1-d3/d7
	rts

Lff30ac:
	clr.l	d2
	moveq.l	#$1f,d3
Lff30b0:
	lsl.l	#1,d0
	roxl.l	#1,d2
	cmp.l	d1,d2
	bcs.s	Lff30be
	bset.l	#$00,d0
	sub.l	d1,d2
Lff30be:
	dbra.w	d3,Lff30b0
	rts

Lff30c4:
	tst.l	d1
	bne.s	Lff30d0
	move.l	d0,-(a7)
	andi.l	#$7fffffff,(a7)+
Lff30d0:
	rts

Lff30d2:
	move.l	d0,-(a7)
	eor.l	d2,(a7)+
	bmi.s	Lff30e6
	tst.l	d0
	bpl.s	Lff30f2
	bsr.s	Lff30f2
	beq.s	Lff3130
	eori.b	#$01,ccr
	rts

Lff30e6:
	move.l	d0,-(a7)
	lsl.w	(a7)
	addq.l	#4,a7
	andi.b	#$fb,ccr
	rts

Lff30f2:
	movem.l	d4-d5,-(a7)
	move.w	d1,d4
	and.w	#$07ff,d4
	move.w	d3,d5
	and.w	#$07ff,d5
	cmp.w	d5,d4
	bne.s	Lff312c
	move.l	d0,d4
	and.l	#$7fffffff,d4
	move.l	d2,d5
	and.l	#$7fffffff,d5
	cmp.l	d5,d4
	bne.s	Lff312c
	move.l	d1,d4
	and.l	#$fffff800,d4
	move.l	d3,d5
	and.l	#$fffff800,d5
	cmp.l	d5,d4
Lff312c:
	movem.l	(a7)+,d4-d5
Lff3130:
	rts

Lff3132:
	move.l	d0,-(a7)
	andi.l	#$7fffffff,(a7)+
	bne.s	Lff3140
	tst.l	d1
	beq.s	Lff3144
Lff3140:
	bchg.l	#$1f,d0
Lff3144:
	rts

Lff3146:
	movem.l	d2-d7,-(a7)
	bsr.s	Lff3154
	move.w	d6,ccr
	movem.l	(a7)+,d2-d7
	rts

Lff3154:
	move.l	d0,-(a7)
	eor.l	d2,(a7)+
	bmi.s	Lff3162
	tst.l	d0
	bpl.s	Lff3170
	bsr.s	Lff3170
	bra.s	Lff3132
Lff3162:
	tst.l	d0
	bpl.w	Lff3220
	exg.l	d0,d2
	exg.l	d1,d3
	bra.w	Lff3220
Lff3170:
	clr.l	d6
	and.l	#$7fffffff,d0
	bne.s	Lff318a
	tst.l	d1
	bne.s	Lff318a
	move.l	d2,d0
	move.l	d3,d1
	and.l	#$7fffffff,d0
	rts

Lff318a:
	and.l	#$7fffffff,d2
	bne.s	Lff3196
	tst.l	d3
	beq.s	Lff31f2
Lff3196:
	move.w	d1,d4
	and.w	#$07ff,d4
	move.w	d3,d5
	and.w	#$07ff,d5
	cmp.w	d5,d4
	bcc.s	Lff31ac
	exg.l	d0,d2
	exg.l	d1,d3
	exg.l	d4,d5
Lff31ac:
	move.w	d4,d7
	sub.w	d5,d4
	cmp.w	#$0035,d4
	bcc.s	Lff31f2
	bset.l	#$1f,d2
	and.w	#$f800,d3
	bra.s	Lff31c4
Lff31c0:
	lsr.l	#1,d2
	roxr.l	#1,d3
Lff31c4:
	dbra.w	d4,Lff31c0
	bset.l	#$1f,d0
	and.w	#$f800,d1
	or.w	#$0400,d1
	add.l	d3,d1
	addx.l	d2,d0
	bcc.s	Lff31e0
	roxr.l	#1,d0
	roxr.l	#1,d1
	addq.w	#1,d7
Lff31e0:
	cmp.w	#$0800,d7
	bcc.w	Lff32cc
	and.w	#$f800,d1
	or.w	d7,d1
	bclr.l	#$1f,d0
Lff31f2:
	rts

Lff31f4:
	movem.l	d2-d7,-(a7)
	bsr.s	Lff3202
	move.w	d6,ccr
	movem.l	(a7)+,d2-d7
	rts

Lff3202:
	move.l	d0,-(a7)
	eor.l	d2,(a7)+
	bmi.s	Lff3212
	tst.l	d0
	bpl.s	Lff3220
	exg.l	d0,d2
	exg.l	d1,d3
	bra.s	Lff3220
Lff3212:
	tst.l	d0
	bpl.w	Lff3170
	bsr.w	Lff3170
	bra.w	Lff3132
Lff3220:
	clr.l	d6
	and.l	#$7fffffff,d0
	bne.s	Lff323a
	tst.l	d1
	bne.s	Lff323a
	move.l	d2,d0
	move.l	d3,d1
	bclr.l	#$1f,d0
	bra.w	Lff3132
Lff323a:
	and.l	#$7fffffff,d2
	bne.s	Lff3246
	tst.l	d3
	beq.s	Lff3250
Lff3246:
	bsr.w	Lff30d2
	bne.s	Lff3252
	clr.l	d0
	clr.l	d1
Lff3250:
	rts

Lff3252:
	bcc.s	Lff325e
	exg.l	d0,d2
	exg.l	d1,d3
	bsr.s	Lff325e
	bra.w	Lff3132
Lff325e:
	move.w	d1,d4
	and.w	#$07ff,d4
	move.w	d3,d5
	and.w	#$07ff,d5
	move.w	d4,d7
	sub.w	d5,d4
	cmp.w	#$0035,d4
	bcc.s	Lff32c2
	bset.l	#$1f,d2
	and.w	#$f800,d3
	bra.s	Lff3282
Lff327e:
	lsr.l	#1,d2
	roxr.l	#1,d3
Lff3282:
	dbra.w	d4,Lff327e
	bset.l	#$1f,d0
	and.w	#$f800,d1
	sub.l	d3,d1
	subx.l	d2,d0
	bra.s	Lff329a
Lff3294:
	subq.w	#1,d7
	lsl.l	#1,d1
	roxl.l	#1,d0
Lff329a:
	bpl.s	Lff3294
	clr.l	d2
	add.l	#$00000400,d1
	addx.l	d2,d0
	bcc.s	Lff32ae
	roxr.l	#1,d0
	roxr.l	#1,d1
	addq.w	#1,d7
Lff32ae:
	tst.w	d7
	bmi.s	Lff32c4
	cmp.w	#$0800,d7
	bcc.s	Lff32cc
	and.w	#$f800,d1
	or.w	d7,d1
	bclr.l	#$1f,d0
Lff32c2:
	rts

Lff32c4:
	clr.l	d0
	clr.l	d1
	moveq.l	#$01,d6
	rts

Lff32cc:
	move.l	#$7fffffff,d0
	moveq.l	#$ff,d1
	moveq.l	#$03,d6
	rts

Lff32d8:
	movem.l	d2-d7,-(a7)
	bsr.s	Lff32e6
	move.w	d6,ccr
	movem.l	(a7)+,d2-d7
	rts

Lff32e6:
	move.l	d0,-(a7)
	eor.l	d2,(a7)+
	bpl.s	Lff32f2
	bsr.s	Lff32f2
	bra.w	Lff3132
Lff32f2:
	and.l	#$7fffffff,d0
	bne.s	Lff32fe
	tst.l	d1
	beq.s	Lff330e
Lff32fe:
	and.l	#$7fffffff,d2
	bne.s	Lff3312
	tst.l	d3
	bne.s	Lff3312
	clr.l	d0
	clr.l	d1
Lff330e:
	clr.l	d6
	rts

Lff3312:
	bsr.w	Lff33b8
	add.w	d6,d7
	bsr.s	Lff332c
	tst.l	d4
	bmi.s	Lff3326
	lsl.l	#1,d5
	roxl.l	#1,d4
	bra.w	Lff3446
Lff3326:
	addq.w	#1,d7
	bra.w	Lff3446
Lff332c:
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
	bsr.s	Lff3380
	move.w	(-$0014,a6),d0
	bsr.s	Lff3380
	move.w	(-$0016,a6),d0
	bsr.s	Lff3380
	move.w	(-$0018,a6),d0
	bsr.s	Lff3380
	move.l	(-$0010,a6),d4
	move.l	(-$000c,a6),d5
	unlk	a6
	movem.l	(a7)+,a0-a2
	rts

Lff3380:
	move.w	(-$001a,a6),d3
	move.w	(-$001e,a6),d2
	lea.l	($0002,a0),a1
	bsr.s	Lff339a
	move.w	(-$001c,a6),d3
	move.w	(-$0020,a6),d2
	lea.l	(a0),a1
	subq.l	#2,a0
Lff339a:
	mulu.w	d0,d3
	mulu.w	d0,d2
	move.l	($0004,a1),d5
	move.l	(a1),d4
	add.l	d3,d5
	addx.l	d2,d4
	bcc.s	Lff33b0
	movea.l	a1,a2
Lff33ac:
	addq.w	#1,-(a2)
	bcs.s	Lff33ac
Lff33b0:
	move.l	d5,($0004,a1)
	move.l	d4,(a1)
	rts

Lff33b8:
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

Lff33de:
	movem.l	d2-d7,-(a7)
	bsr.s	Lff33ec
	move.w	d6,ccr
	movem.l	(a7)+,d2-d7
	rts

Lff33ec:
	move.l	d0,-(a7)
	eor.l	d2,(a7)+
	bpl.s	Lff33f8
	bsr.s	Lff33f8
	bra.w	Lff3132
Lff33f8:
	and.l	#$7fffffff,d2
	bne.s	Lff3404
	tst.l	d3
	beq.s	Lff347a
Lff3404:
	and.l	#$7fffffff,d0
	bne.s	Lff3414
	tst.l	d1
	bne.s	Lff3414
	clr.l	d6
	rts

Lff3414:
	bsr.s	Lff33b8
	sub.w	d6,d7
	lsr.l	#1,d0
	roxr.l	#1,d1
	lsr.l	#1,d2
	roxr.l	#1,d3
	clr.l	d4
	bsr.s	Lff347e
	bcc.s	Lff342c
	subq.w	#1,d7
	clr.l	d5
	bra.s	Lff3430
Lff342c:
	moveq.l	#$01,d5
	bsr.s	Lff3486
Lff3430:
	lsl.l	#1,d5
	roxl.l	#1,d4
	lsl.l	#1,d1
	roxl.l	#1,d0
	bsr.s	Lff347e
	bcs.s	Lff3442
	bsr.s	Lff3486
	bset.l	#$00,d5
Lff3442:
	tst.l	d4
	bpl.s	Lff3430
Lff3446:
	clr.l	d6
	add.l	#$00000400,d5
	bcc.s	Lff345a
	addq.l	#1,d4
	bcc.s	Lff345a
	roxr.l	#1,d4
	roxr.l	#1,d5
	addq.w	#1,d7
Lff345a:
	add.w	#$03ff,d7
	bmi.w	Lff32c4
	cmp.w	#$0800,d7
	bcc.w	Lff32cc
	move.l	d4,d0
	move.l	d5,d1
	and.w	#$f800,d1
	or.w	d7,d1
	bclr.l	#$1f,d0
	rts

Lff347a:
	moveq.l	#$05,d6
	rts

Lff347e:
	cmp.l	d2,d0
	bne.s	Lff3484
	cmp.l	d3,d1
Lff3484:
	rts

Lff3486:
	sub.l	d3,d1
	subx.l	d2,d0
	rts

Lff348c:
	cmp.b	#$30,d0
	bcs.s	Lff349a
	cmp.b	#$3a,d0
	eori.b	#$01,ccr
Lff349a:
	rts

Lff349c:
	moveq.l	#$0e,d2
	move.l	a0,-(a7)
	bsr.w	Lff38bc
	movea.l	(a7),a0
	bsr.s	Lff34b0
	movea.l	(a7)+,a0
	bsr.w	Lff3992
	rts

Lff34b0:
	move.b	(a0)+,d0
	beq.s	Lff34c4
	cmp.b	#$2e,d0
	bne.s	Lff34b0
	move.b	(a0),d0
	bsr.s	Lff348c
	bcc.s	Lff34c4
	subq.l	#1,a0
	bsr.s	Lff34c6
Lff34c4:
	rts

Lff34c6:
	move.b	($0001,a0),(a0)+
	bne.s	Lff34c6
	rts

Lff34ce:
	movem.l	d0-d2/d7/a1-a2,-(a7)
	link.w	a6,#-$000a
	movea.l	a7,a1
	lea.l	(Lff352e,pc),a2
	clr.w	d7
	tst.l	d0
	bpl.s	Lff34e6
	neg.l	d0
	not.w	d7
Lff34e6:
	move.l	(a2),d2
	beq.s	Lff34fc
	clr.b	d1
Lff34ec:
	addq.b	#1,d1
	sub.l	d2,d0
	bcc.s	Lff34ec
	add.l	d2,d0
	subq.b	#1,d1
	move.b	d1,(a1)+
	addq.l	#4,a2
	bra.s	Lff34e6
Lff34fc:
	clr.b	d1
	movea.l	a7,a1
Lff3500:
	tst.b	(a1)
	bne.s	Lff350e
	addq.l	#1,a1
	addq.b	#1,d1
	cmp.b	#$09,d1
	bcs.s	Lff3500
Lff350e:
	tst.w	d7
	beq.s	Lff3516
	move.b	#$2d,(a0)+
Lff3516:
	move.b	(a1)+,d0
	add.b	#$30,d0
	move.b	d0,(a0)+
	addq.b	#1,d1
	cmp.b	#$0a,d1
	bcs.s	Lff3516
	unlk	a6
	movem.l	(a7)+,d0-d2/d7/a1-a2
	rts

Lff352e:
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
Lff35a2:
	unlk	a6
	movem.l	(a7)+,d1-d7
	move.w	#$0001,ccr
	rts

Lff35ae:
	unlk	a6
	movem.l	(a7)+,d1-d7
	move.w	#$0009,ccr
	rts

Lff35ba:
	tst.w	d7
	bmi.s	Lff35cc
	tst.l	d1
	bmi.s	Lff35a2
Lff35c2:
	move.l	d1,d0
	unlk	a6
	movem.l	(a7)+,d1-d7
	rts

Lff35cc:
	tst.l	d1
	bpl.s	Lff35da
	cmp.l	#$80000000,d1
	beq.s	Lff35c2
	bra.s	Lff35a2
Lff35da:
	neg.l	d1
	bra.s	Lff35c2
Lff35de:
	movem.l	d2-d7/a1-a2,-(a7)
	link.w	a6,#-$001e
	bsr.w	Lff3818
	beq.w	Lff36c4
	bsr.w	Lff37f2
	move.w	#$ffff,(-$0006,a6)
	clr.l	(-$0004,a6)
	move.b	(a0),d0
	clr.l	d6
	cmp.b	#$2e,d0
	bne.s	Lff3612
	bset.l	#$1f,d6
	clr.w	(-$0006,a6)
	addq.l	#1,a0
	move.b	(a0),d0
Lff3612:
	bsr.w	Lff3806
	bcs.w	Lff36c4
	addq.l	#1,a0
	bsr.w	Lff36ec
	lea.l	(-$001e,a6),a1
	move.b	#$30,(a1)+
	movea.l	a1,a2
	move.b	d0,(a1)+
	moveq.l	#$01,d5
Lff362e:
	move.b	(a0),d0
	cmp.b	#$2e,d0
	bne.s	Lff3648
	tst.w	d6
	bne.w	Lff36c4
	bset.l	#$1f,d6
	clr.w	(-$0006,a6)
	addq.l	#1,a0
	bra.s	Lff362e
Lff3648:
	bsr.w	Lff3806
	bcs.s	Lff3662
	move.b	d0,(a1)+
	addq.l	#1,a0
	bsr.w	Lff36ec
	addq.w	#1,d5
	cmp.w	#$000f,d5
	bne.s	Lff362e
	bsr.w	Lff37c0
Lff3662:
	bsr.w	Lff3756
	bsr.w	Lff36f4
	tst.w	d7
	bpl.s	Lff3672
	bsr.w	Lff3132
Lff3672:
	move.l	d0,(-$000e,a6)
	move.l	d1,(-$000a,a6)
	tst.w	(-$0006,a6)
	beq.s	Lff36a4
	bsr.w	Lff2f88
	bcs.s	Lff36a0
	move.l	d0,d4
	bsr.w	Lff2f5c
	move.l	(-$000e,a6),d2
	move.l	(-$000a,a6),d3
	bsr.w	Lff30d2
	bne.s	Lff36a0
	move.l	d4,(-$0004,a6)
	bra.s	Lff36a4
Lff36a0:
	clr.w	(-$0006,a6)
Lff36a4:
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

Lff36c4:
	unlk	a6
	movem.l	(a7)+,d2-d7/a1-a2
	clr.l	d0
	clr.l	d1
	move.w	#$0009,ccr
	rts

Lff36d4:
	unlk	a6
	movem.l	(a7)+,d2-d7/a1-a2
	move.w	#$0001,ccr
	rts

Lff36e0:
	unlk	a6
	movem.l	(a7)+,d2-d7/a1-a2
	move.w	#$0003,ccr
	rts

Lff36ec:
	tst.l	d6
	bpl.s	Lff36f2
	subq.w	#1,d6
Lff36f2:
	rts

Lff36f4:
	clr.l	d0
	clr.l	d1
Lff36f8:
	move.l	#$20000000,d2
	move.l	#$00000402,d3
	bsr.w	Lff32d8
	move.l	d0,d2
	move.l	d1,d3
	clr.l	d0
	move.b	(a2)+,d0
	sub.b	#$30,d0
	bsr.w	Lff2f5c
	bsr.w	Lff3146
	subq.w	#1,d5
	bne.s	Lff36f8
	add.w	d6,d4
	beq.s	Lff3754
	bmi.s	Lff373e
Lff3726:
	move.l	#$20000000,d2
	move.l	#$00000402,d3
	bsr.w	Lff32d8
	bcs.s	Lff36e0
	subq.w	#1,d4
	bne.s	Lff3726
	rts

Lff373e:
	move.l	#$20000000,d2
	move.l	#$00000402,d3
	bsr.w	Lff33de
	bcs.s	Lff36d4
	addq.w	#1,d4
	bne.s	Lff373e
Lff3754:
	rts

Lff3756:
	clr.l	d4
	cmp.b	#$45,d0
	beq.s	Lff3766
	cmp.b	#$65,d0
	beq.s	Lff3766
	rts

Lff3766:
	clr.w	(-$0006,a6)
	addq.l	#1,a0
	move.b	(a0),d0
	cmp.b	#$2b,d0
	beq.s	Lff377e
	cmp.b	#$2d,d0
	bne.s	Lff3782
	bset.l	#$1f,d4
Lff377e:
	addq.l	#1,a0
	move.b	(a0),d0
Lff3782:
	bsr.w	Lff3806
	bcs.w	Lff36c4
	sub.b	#$30,d0
	move.b	d0,d4
	clr.w	d0
Lff3792:
	addq.l	#1,a0
	move.b	(a0),d0
	bsr.s	Lff3806
	bcs.s	Lff37b8
	sub.b	#$30,d0
	move.w	d4,-(a7)
	lsl.w	#2,d4
	add.w	(a7)+,d4
	lsl.w	#1,d4
	add.w	d0,d4
	cmp.w	#$03e8,d4
	bcs.s	Lff3792
	tst.l	d4
	bpl.w	Lff36e0
	bra.w	Lff36d4
Lff37b8:
	tst.l	d4
	bpl.s	Lff37be
	neg.w	d4
Lff37be:
	rts

Lff37c0:
	addq.w	#1,d6
	subq.w	#1,d5
	cmpi.b	#$35,-(a1)
	bcs.s	Lff37d8
Lff37ca:
	addq.b	#1,-(a1)
	cmpi.b	#$3a,(a1)
	bcs.s	Lff37d8
	move.b	#$30,(a1)
	bra.s	Lff37ca
Lff37d8:
	cmpa.l	a2,a1
	bcc.s	Lff37e0
	movea.l	a1,a2
	addq.w	#1,d6
Lff37e0:
	move.b	(a0),d0
	bsr.s	Lff3806
	bcs.s	Lff37f0
	addq.l	#1,a0
	tst.w	d6
	bmi.s	Lff37e0
	addq.w	#1,d6
	bra.s	Lff37e0
Lff37f0:
	rts

Lff37f2:
	clr.w	d7
	cmp.b	#$2b,d0
	beq.s	Lff3802
	cmp.b	#$2d,d0
	bne.s	Lff3804
	not.w	d7
Lff3802:
	addq.l	#1,a0
Lff3804:
	rts

Lff3806:
	cmp.b	#$30,d0
	bcs.s	Lff3814
	cmp.b	#$3a,d0
	eori.b	#$01,ccr
Lff3814:
	rts

Lff3816:
	addq.l	#1,a0
Lff3818:
	move.b	(a0),d0
	cmp.b	#$09,d0
	beq.s	Lff3816
	cmp.b	#$20,d0
	beq.s	Lff3816
	tst.b	d0
	rts

Lff382a:
	movem.l	d1-d2,-(a7)
	bsr.w	Lff39a4
	tst.l	d1
	beq.s	Lff383e
	bsr.w	Lff397a
	move.b	#$2d,(a0)+
Lff383e:
	addq.l	#1,a0
	bsr.w	Lff397a
	move.b	#$2e,(a0)
	bsr.w	Lff3992
	move.b	#$45,(a0)+
	subq.l	#1,d0
	bsr.w	Lff3946
	clr.b	(a0)
	movem.l	(a7)+,d1-d2
	rts

Lff385e:
	movem.l	d1-d2,-(a7)
	bsr.w	Lff39ca
	tst.l	d1
	beq.s	Lff3872
	bsr.w	Lff397a
	move.b	#$2d,(a0)+
Lff3872:
	tst.l	d0
	bmi.s	Lff3886
	beq.s	Lff3886
	lea.l	(a0,d0.l),a0
	bsr.w	Lff397a
	move.b	#$2e,(a0)
	bra.s	Lff38b2
Lff3886:
	neg.l	d0
	and.w	#$00ff,d2
	cmp.w	d2,d0
	bls.s	Lff3892
	move.w	d2,d0
Lff3892:
	bsr.w	Lff397a
	move.b	#$30,(a0)+
	bsr.w	Lff397a
	move.b	#$2e,(a0)+
	tst.w	d0
	beq.s	Lff38b2
Lff38a6:
	bsr.w	Lff397a
	move.b	#$30,(a0)
	subq.w	#1,d0
	bne.s	Lff38a6
Lff38b2:
	bsr.w	Lff3992
	movem.l	(a7)+,d1-d2
	rts

Lff38bc:
	movem.l	d1-d2,-(a7)
	bsr.w	Lff39a4
	tst.l	d1
	beq.s	Lff38d0
	bsr.w	Lff397a
	move.b	#$2d,(a0)+
Lff38d0:
	tst.l	d0
	beq.s	Lff392e
	bmi.s	Lff38f6
	and.w	#$00ff,d2
	cmp.w	d2,d0
	beq.s	Lff393e
	bcc.s	Lff3916
	lea.l	(a0,d0.l),a0
	bsr.w	Lff397a
	move.b	#$2e,(a0)
	bsr.w	Lff3992
	bsr.w	Lff3998
	bra.s	Lff393e
Lff38f6:
	move.l	a0,-(a7)
	bsr.w	Lff3992
	bsr.w	Lff3998
	suba.l	(a7),a0
	addq.l	#1,a0
	move.l	d0,d1
	neg.l	d1
	add.l	a0,d1
	movea.l	(a7)+,a0
	and.w	#$00ff,d2
	cmp.w	d2,d1
	bcs.w	Lff3886
Lff3916:
	addq.l	#1,a0
	bsr.s	Lff397a
	move.b	#$2e,(a0)
	bsr.s	Lff3992
	bsr.s	Lff3998
	move.b	#$45,(a0)+
	subq.l	#1,d0
	bsr.s	Lff3946
	clr.b	(a0)
	bra.s	Lff393e
Lff392e:
	bsr.s	Lff397a
	move.b	#$30,(a0)+
	bsr.s	Lff397a
	move.b	#$2e,(a0)+
	bsr.s	Lff3992
	bsr.s	Lff3998
Lff393e:
	bsr.s	Lff3992
	movem.l	(a7)+,d1-d2
	rts

Lff3946:
	move.b	#$2b,d1
	tst.l	d0
	bpl.s	Lff3954
	move.b	#$2d,d1
	neg.l	d0
Lff3954:
	move.b	d1,(a0)+
	move.w	#$0064,d1
	bsr.s	Lff396a
	move.w	#$000a,d1
	bsr.s	Lff396a
	add.b	#$30,d0
	move.b	d0,(a0)+
	rts

Lff396a:
	move.b	#$2f,d2
Lff396e:
	addq.b	#1,d2
	sub.w	d1,d0
	bcc.s	Lff396e
	add.w	d1,d0
	move.b	d2,(a0)+
	rts

Lff397a:
	movem.l	d0-d1/a0,-(a7)
	move.b	(a0)+,d0
Lff3980:
	move.b	(a0),d1
	move.b	d0,(a0)+
	beq.s	Lff398a
	move.b	d1,d0
	bra.s	Lff3980
Lff398a:
	movem.l	(a7)+,d0-d1/a0
	rts

Lff3990:
	addq.l	#1,a0
Lff3992:
	tst.b	(a0)
	bne.s	Lff3990
	rts

Lff3998:
	cmpi.b	#$30,-(a0)
	beq.s	Lff3998
	addq.l	#1,a0
	clr.b	(a0)
	rts

Lff39a4:
	movem.l	d2-d7/a0-a2,-(a7)
	link.w	a6,#-$0016
	bsr.s	Lff39f2
	move.w	(-$0012,a6),d0
	bsr.s	Lff3a22
	move.w	(-$0012,a6),d0
	bsr.w	Lff3a42
	unlk	a6
	move.w	d7,d0
	ext.l	d0
	move.l	d6,d1
	movem.l	(a7)+,d2-d7/a0-a2
	rts

Lff39ca:
	movem.l	d2-d7/a0-a2,-(a7)
	link.w	a6,#-$0016
	bsr.s	Lff39f2
	move.w	(-$0012,a6),d0
	add.w	d7,d0
	bsr.s	Lff3a22
	move.w	(-$0012,a6),d0
	add.w	d7,d0
	bsr.s	Lff3a42
	unlk	a6
	move.w	d7,d0
	ext.l	d0
	move.l	d6,d1
	movem.l	(a7)+,d2-d7/a0-a2
	rts

Lff39f2:
	move.l	a0,(-$0016,a6)
	clr.w	(-$0012,a6)
	move.b	d2,(-$0011,a6)
	bsr.s	Lff3a68
	lea.l	(-$0010,a6),a1
	move.b	#$30,(a1)+
	move.l	a1,-(a7)
	bsr.w	Lff3af6
	lea.l	(-$0001,a6),a0
	bsr.w	Lff3b1c
	movea.l	(a7)+,a1
	cmpa.l	a1,a0
	bcc.s	Lff3a20
	movea.l	a0,a1
	addq.w	#1,d7
Lff3a20:
	rts

Lff3a22:
	tst.w	d0
	beq.s	Lff3a40
	bmi.s	Lff3a40
	cmp.w	#$000e,d0
	bcc.s	Lff3a40
	movea.l	a1,a0
	lea.l	(a0,d0.w),a0
	bsr.w	Lff3b1c
	cmpa.l	a1,a0
	bcc.s	Lff3a40
	movea.l	a0,a1
	addq.w	#1,d7
Lff3a40:
	rts

Lff3a42:
	movea.l	(-$0016,a6),a0
	tst.w	d0
	beq.s	Lff3a64
	bmi.s	Lff3a64
	clr.w	d1
Lff3a4e:
	cmp.w	d0,d1
	beq.s	Lff3a64
	cmp.w	#$000e,d1
	bcc.s	Lff3a5e
	move.b	(a1)+,(a0)+
Lff3a5a:
	addq.w	#1,d1
	bra.s	Lff3a4e
Lff3a5e:
	move.b	#$30,(a0)+
	bra.s	Lff3a5a
Lff3a64:
	clr.b	(a0)
	rts

Lff3a68:
	clr.l	d6
	move.l	d0,d2
	and.l	#$7fffffff,d0
	bne.s	Lff3a7c
	tst.l	d1
	bne.s	Lff3a7c
	moveq.l	#$01,d7
	rts

Lff3a7c:
	lsl.l	#1,d2
	roxl.l	#1,d6
	moveq.l	#$0f,d7
Lff3a82:
	move.l	#$635fa931,d2
	move.l	#$a0000430.l,d3
	bsr.w	Lff30d2
	bcc.s	Lff3ab8
	moveq.l	#$00,d2
	move.l	#$000003ff,d3
	bsr.w	Lff30d2
	bcc.s	Lff3ace
	move.l	#$635fa931,d2
	move.l	#$a0000430.l,d3
	bsr.w	Lff32d8
	sub.w	#$000f,d7
	bra.s	Lff3a82
Lff3ab8:
	move.l	#$635fa931,d2
	move.l	#$a0000430.l,d3
	bsr.w	Lff33de
	add.w	#$000f,d7
	bra.s	Lff3a82
Lff3ace:
	move.l	#$35e620f4,d2
	move.l	#$8000042d.l,d3
	bsr.w	Lff30d2
	bcc.s	Lff3af4
	move.l	#$20000000,d2
	move.l	#$00000402,d3
	bsr.w	Lff32d8
	subq.w	#1,d7
	bra.s	Lff3ace
Lff3af4:
	rts

Lff3af6:
	move.w	#$000e,d4
	lea.l	(Lff3b3a,pc),a2
Lff3afe:
	move.b	#$30,(a1)
	lea.l	(a2),a0
Lff3b04:
	bsr.w	Lff3bb2
	bcs.s	Lff3b12
	addq.b	#1,(a1)
	bsr.w	Lff3bc6
	bra.s	Lff3b04
Lff3b12:
	addq.l	#1,a1
	addq.l	#8,a2
	dbra.w	d4,Lff3afe
	rts

Lff3b1c:
	cmpi.b	#$35,(a0)
	bcs.s	Lff3b30
Lff3b22:
	addq.b	#1,-(a0)
	cmpi.b	#$39,(a0)
	bls.s	Lff3b30
	move.b	#$30,(a0)
	bra.s	Lff3b22
Lff3b30:
	rts

Lff3b32:
	.dc.b	$63,$5f,$a9,$31,$a0,$00,$04,$30
Lff3b3a:
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
Lff3bb2:
	move.l	(a0),d2
	move.l	($0004,a0),d3
	bra.w	Lff30d2
Lff3bbc:
	move.l	(a0),d2
	move.l	($0004,a0),d3
	bra.w	Lff3146
Lff3bc6:
	move.l	(a0),d2
	move.l	($0004,a0),d3
	bra.w	Lff31f4
Lff3bd0:
	move.l	(a0),d2
	move.l	($0004,a0),d3
	bra.w	Lff32d8
Lff3bda:
	move.l	(a0),d2
	move.l	($0004,a0),d3
	bra.w	Lff33de
Call_KEYINP:
	move.w	($0bca),d0
	bne.s	Lff3c22
	bsr.w	Lff67d6
	cmpi.b	#$02,($09dd)
	beq.s	Lff3c20
	tst.b	($0bc6)
	beq.s	Lff3c36
	movem.l	d1-d2,-(a7)
	bsr.w	Lff3c9c
	bne.s	Lff3c1c
	cmp.b	#$f0,d1
	beq.s	Lff3c12
	bsr.w	Lff3cd4
	bra.s	Lff3c16
Lff3c12:
	bsr.w	Lff4414
Lff3c16:
	movem.l	(a7)+,d1-d2
	bra.s	Call_KEYINP
Lff3c1c:
	movem.l	(a7)+,d1-d2
Lff3c20:
	rts

Lff3c22:
	subq.w	#1,d0
	move.w	d0,($0bca)
	movea.l	($0bcc),a0
	clr.l	d0
	move.w	(a0)+,d0
	move.l	a0,($0bcc)
Lff3c34:
	rts

Lff3c36:
	cmp.w	#$6d00,d0
	bne.s	Lff3c34
	bsr.w	Lff4384
	bra.s	Call_KEYINP
Call_KEYSNS:
	move.w	($0bca),d0
	bne.s	Lff3c7c
Call_DENSNS:
	bsr.w	Lff67ea
	cmpi.b	#$02,($09dd)
	beq.s	Lff3c20
	tst.b	($0bc6)
	beq.s	Lff3c8a
	movem.l	d1-d2,-(a7)
	bsr.s	Lff3c9c
	bne.s	Lff3c76
	bsr.w	Lff67d6
	cmp.b	#$f0,d1
	beq.s	Lff3c70
	bsr.s	Lff3cd4
	bra.s	Lff3c74
Lff3c70:
	bsr.w	Lff4414
Lff3c74:
	clr.l	d0
Lff3c76:
	movem.l	(a7)+,d1-d2
	rts

Lff3c7c:
	movea.l	($0bcc),a0
	move.l	#$00010000,d0
	move.w	(a0),d0
	rts

Lff3c8a:
	cmp.w	#$6d00,d0
	bne.s	Lff3c9a
	bsr.w	Lff67d6
	bsr.w	Lff4384
	clr.l	d0
Lff3c9a:
	rts

Lff3c9c:
	lea.l	(Lff456e,pc),a0
	move.w	d0,d1
	lsr.w	#8,d1
	moveq.l	#$21,d2
Lff3ca6:
	cmp.b	($0001,a0),d1
	beq.s	Lff3cb6
	addq.l	#2,a0
	dbra.w	d2,Lff3ca6
Lff3cb2:
	moveq.l	#$ff,d2
	rts

Lff3cb6:
	move.b	(a0),d1
	tst.b	($0bc7)
	bne.s	Lff3cca
	cmp.b	#$41,d1
	bcs.s	Lff3cca
	cmp.b	#$47,d1
	bcs.s	Lff3cb2
Lff3cca:
	sub.w	#$0021,d2
	neg.w	d2
	cmp.b	d1,d1
	rts

Lff3cd4:
	cmp.b	#$f4,d1
	bne.s	Lff3cf0
	clr.l	($0c08)
	clr.l	($0c0c)
	clr.b	($0bc8)
	clr.b	($0c1a)
	bra.w	Lff42b8
Lff3cee:
	rts

Lff3cf0:
	tst.b	($0c1a)
	bne.s	Lff3cee
	cmp.b	#$f1,d1
	bne.s	Lff3d0a
	bsr.w	Lff403c
	move.b	#$01,($0bc7)
	bra.w	Lff42c4
Lff3d0a:
	cmp.b	#$f2,d1
	bne.s	Lff3d1c
	bsr.w	Lff403c
	clr.b	($0bc7)
	bra.w	Lff42c4
Lff3d1c:
	cmp.b	#$f3,d1
	bne.s	Lff3d38
	move.l	($0c00),($0c10)
	move.l	($0c04),($0c14)
	bclr.b	#$04,($0bc8)
	bra.w	Lff42c4
Lff3d38:
	cmp.b	#$f5,d1
	bne.s	Lff3dae
	bsr.w	Lff403c
	bsr.w	Lff40ba
	bsr.w	Lff42b8
	tst.b	($0c1a)
	bne.s	Lff3dac
	movem.l	a1-a2,-(a7)
	clr.w	d2
	lea.l	($0bd0),a1
	move.l	a1,($0bcc)
	lea.l	($0c1b),a0
	cmpi.b	#$2e,($000f,a0)
	beq.s	Lff3d78
	cmpi.b	#$20,($0010,a0)
	bne.s	Lff3d7c
	clr.b	($0010,a0)
	bra.s	Lff3d7c
Lff3d78:
	clr.b	($000f,a0)
Lff3d7c:
	move.b	(a0)+,d0
	beq.s	Lff3da4
	cmp.b	#$20,d0
	beq.s	Lff3d7c
	lea.l	(Lff458c,pc),a2
	moveq.l	#$12,d1
Lff3d8c:
	cmp.b	(a2)+,d0
	beq.s	Lff3d98
	addq.l	#1,a2
	dbra.w	d1,Lff3d8c
	bra.s	Lff3d7c
Lff3d98:
	asl.w	#8,d0
	move.b	(a2),d0
	ror.w	#8,d0
	move.w	d0,(a1)+
	addq.w	#1,d2
	bra.s	Lff3d7c
Lff3da4:
	move.w	d2,($0bca)
	movem.l	(a7)+,a1-a2
Lff3dac:
	rts

Lff3dae:
	cmp.b	#$f6,d1
	bne.s	Lff3dc6
	clr.l	($0c10)
	clr.l	($0c14)
	bclr.b	#$04,($0bc8)
	bra.w	Lff42c4
Lff3dc6:
	cmp.b	#$f7,d1
	bne.s	Lff3e06
	bsr.w	Lff403c
	bsr.w	Lff40ba
	movem.l	d2-d3,-(a7)
	move.l	($0c00),d0
	move.l	($0c04),d1
	move.l	($0c08),d2
	move.l	($0c0c),d3
	bsr.w	Lff3146
	bcs.s	Lff3dfe
	move.l	d0,($0c00)
	move.l	d1,($0c04)
Lff3df6:
	movem.l	(a7)+,d2-d3
	bra.w	Lff42b8
Lff3dfe:
	move.b	#$01,($0c1a)
	bra.s	Lff3df6
Lff3e06:
	cmp.b	#$f8,d1
	bne.s	Lff3e46
	bsr.w	Lff403c
	bsr.w	Lff40ba
	movem.l	d2-d3,-(a7)
	move.l	($0c00),d0
	move.l	($0c04),d1
	move.l	($0c08),d2
	move.l	($0c0c),d3
	bsr.w	Lff31f4
	bcs.s	Lff3e3e
	move.l	d0,($0c00)
	move.l	d1,($0c04)
Lff3e36:
	movem.l	(a7)+,d2-d3
	bra.w	Lff42b8
Lff3e3e:
	move.b	#$01,($0c1a)
	bra.s	Lff3e36
Lff3e46:
	cmp.b	#$f9,d1
	bne.s	Lff3e58
	clr.l	($0c00)
	clr.l	($0c04)
	bra.w	Lff42cc
Lff3e58:
	cmp.b	#$fa,d1
	bne.s	Lff3eb4
	tst.w	($0c18)
	beq.s	Lff3eb2
	tst.b	($0bc9)
	beq.s	Lff3e84
	movem.l	d0/a0-a1,-(a7)
	lea.l	($0c2a),a0
	cmpi.b	#$2e,(a0)
	beq.s	Lff3e7e
	subq.l	#1,a0
	moveq.l	#$0e,d0
	bra.s	Lff3e8e
Lff3e7e:
	clr.b	($0bc9)
	bra.s	Lff3eaa
Lff3e84:
	movem.l	d0/a0-a1,-(a7)
	lea.l	($0c28),a0
	moveq.l	#$0d,d0
Lff3e8e:
	move.b	(a0),($0001,a0)
	subq.l	#1,a0
	dbra.w	d0,Lff3e8e
	lea.l	($0c29),a0
	cmpi.b	#$20,(a0)
	bne.s	Lff3ea6
	move.b	#$30,(a0)
Lff3ea6:
	bsr.w	Lff42cc
Lff3eaa:
	subq.w	#1,($0c18)
	movem.l	(a7)+,d0/a0-a1
Lff3eb2:
	rts

Lff3eb4:
	cmp.b	#$fb,d1
	bne.s	Lff3edc
	bsr.w	Lff403c
	move.l	($0c10),d0
	move.l	($0c14),d1
	bsr.w	Lff3132
	move.l	d0,($0c10)
	move.l	d1,($0c14)
	bclr.b	#$04,($0bc8)
	bra.w	Lff42c4
Lff3edc:
	cmp.b	#$3d,d1
	bne.s	Lff3eee
	bsr.w	Lff403c
	bsr.w	Lff40ba
	bra.w	Lff42b8
Lff3eee:
	cmp.b	#$2b,d1
	bne.s	Lff3f06
	bsr.w	Lff403c
	bsr.w	Lff40ba
	move.b	#$11,($0bc8)
	bra.w	Lff42b8
Lff3f06:
	cmp.b	#$2d,d1
	bne.s	Lff3f1e
	bsr.w	Lff403c
	bsr.w	Lff40ba
	move.b	#$12,($0bc8)
	bra.w	Lff42b8
Lff3f1e:
	cmp.b	#$2a,d1
	bne.s	Lff3f36
	bsr.w	Lff403c
	bsr.w	Lff40ba
	move.b	#$13,($0bc8)
	bra.w	Lff42b8
Lff3f36:
	cmp.b	#$2f,d1
	bne.s	Lff3f4e
	bsr.w	Lff403c
	bsr.w	Lff40ba
	move.b	#$14,($0bc8)
	bra.w	Lff42b8
Lff3f4e:
	cmpi.w	#$0001,($0c18)
	bne.s	Lff3f62
	cmpi.b	#$30,($0c29)
	bne.s	Lff3f62
	clr.w	($0c18)
Lff3f62:
	tst.w	($0c18)
	bne.s	Lff3f6e
	move.b	#$00,($0bc9)
Lff3f6e:
	tst.b	($0bc7)
	beq.s	Lff3f86
	cmp.b	#$2e,d1
	beq.s	Lff3ff4
	cmpi.w	#$0008,($0c18)
	bcc.s	Lff3ff4
	moveq.l	#$0d,d0
	bra.s	Lff3fa2
Lff3f86:
	cmp.b	#$40,d1
	bcc.s	Lff3ff4
	tst.b	($0bc9)
	beq.s	Lff3fc2
	cmp.b	#$2e,d1
	beq.s	Lff3ff4
	moveq.l	#$0e,d0
	cmpi.w	#$000f,($0c18)
	bcc.s	Lff3ff4
Lff3fa2:
	tst.w	($0c18)
	bne.s	Lff3faa
	bsr.s	Lff3ff6
Lff3faa:
	addq.w	#1,($0c18)
	lea.l	($0c1b),a0
Lff3fb2:
	move.b	($0001,a0),(a0)
	addq.l	#1,a0
	dbra.w	d0,Lff3fb2
	move.b	d1,(a0)
	bra.w	Lff42cc
Lff3fc2:
	cmpi.w	#$000e,($0c18)
	bcc.s	Lff3ff4
	moveq.l	#$0d,d0
	cmp.b	#$2e,d1
	bne.s	Lff3fa2
	addq.w	#1,($0c18)
	move.b	#$01,($0bc9)
	cmpi.w	#$0001,($0c18)
	bne.s	Lff3ff4
	addq.w	#1,($0c18)
	bsr.s	Lff3ff6
	move.b	#$30,($0c29)
	bra.w	Lff42cc
Lff3ff4:
	rts

Lff3ff6:
	lea.l	($0c1b),a0
	move.l	d0,-(a7)
	moveq.l	#$0e,d0
Lff3ffe:
	move.b	#$20,(a0)+
	dbra.w	d0,Lff3ffe
	move.b	#$2e,(a0)+
	move.b	#$20,(a0)+
	move.b	#$20,(a0)+
	tst.b	($0bc7)
	bne.s	Lff402a
	move.b	#$44,(a0)+
	move.b	#$45,(a0)+
	move.b	#$43,(a0)+
	clr.b	(a0)+
	move.l	(a7)+,d0
	rts

Lff402a:
	move.b	#$48,(a0)+
	move.b	#$45,(a0)+
	move.b	#$58,(a0)+
	clr.b	(a0)+
	move.l	(a7)+,d0
	rts

Lff403c:
	tst.w	($0c18)
	beq.s	Lff4066
	bclr.b	#$04,($0bc8)
	movem.l	d0-d1/a0,-(a7)
	lea.l	($0c1b),a0
	tst.b	($0bc7)
	bne.s	Lff4068
	bsr.w	Lff35de
Lff405a:
	move.l	d0,($0c10)
	move.l	d1,($0c14)
	movem.l	(a7)+,d0-d1/a0
Lff4066:
	rts

Lff4068:
	clr.l	d1
	clr.l	d0
Lff406c:
	move.b	(a0)+,d0
	beq.s	Lff40b2
	cmp.b	#$20,d0
	beq.s	Lff406c
Lff4076:
	cmp.b	#$30,d0
	bcs.s	Lff40b2
	cmp.b	#$3a,d0
	bcs.s	Lff40a6
	cmp.b	#$41,d0
	bcs.s	Lff40b2
	cmp.b	#$47,d0
	bcs.s	Lff40a0
	cmp.b	#$61,d0
	bcs.s	Lff40b2
	cmp.b	#$67,d0
	bcc.s	Lff40b2
	sub.b	#$57,d0
	bra.s	Lff40aa
Lff40a0:
	sub.b	#$37,d0
	bra.s	Lff40aa
Lff40a6:
	sub.b	#$30,d0
Lff40aa:
	asl.l	#4,d1
	add.l	d0,d1
	move.b	(a0)+,d0
	bra.s	Lff4076
Lff40b2:
	move.l	d1,d0
	bsr.w	Lff2f5c
	bra.s	Lff405a
Lff40ba:
	movem.l	d0-d4,-(a7)
	move.b	($0bc8),d4
	move.l	($0c08),d0
	move.l	($0c0c),d1
	move.l	($0c10),d2
	move.l	($0c14),d3
	bsr.s	Lff40f0
	bcs.s	Lff40e8
	move.l	d0,($0c08)
	move.l	d1,($0c0c)
Lff40de:
	clr.b	($0bc8)
	movem.l	(a7)+,d0-d4
	rts

Lff40e8:
	move.b	#$01,($0c1a)
	bra.s	Lff40de
Lff40f0:
	subq.b	#1,d4
	beq.w	Lff3146
	subq.b	#1,d4
	beq.w	Lff31f4
	subq.b	#1,d4
	beq.w	Lff32d8
	subq.b	#1,d4
	beq.w	Lff33de
	move.l	d2,d0
	move.l	d3,d1
	or.l	d3,d3
	rts

Lff4110:
	movem.l	d0-d2/a0-a1,-(a7)
	lea.l	(-$0014,a7),a7
	bsr.w	Lff3ff6
	move.l	($0c10),d0
	move.l	($0c14),d1
	tst.b	($0c1a)
	bne.w	Lff41ba
	tst.b	($0bc7)
	bne.w	Lff4250
	moveq.l	#$0e,d2
	movea.l	a7,a0
	bsr.w	Lff39a4
	cmp.l	#$0000000f,d0
	bcs.w	Lff41d4
	cmp.l	#$fffffff4,d0
	bcc.w	Lff41d4
	movea.l	a7,a0
	lea.l	($0c1b),a1
	move.l	d0,-(a7)
	bsr.w	Lff42a8
	bsr.w	Lff429a
	move.b	d0,(a1)+
	move.b	#$2e,(a1)+
	moveq.l	#$0c,d2
Lff4168:
	bsr.w	Lff429a
	move.b	d0,(a1)+
	dbra.w	d2,Lff4168
	move.l	(a7)+,d2
	move.b	#$45,(a1)+
	move.b	#$2b,d0
	subq.l	#1,d2
	bpl.s	Lff4186
	neg.l	d2
	move.b	#$2d,d0
Lff4186:
	move.b	d0,(a1)+
	divu.w	#$0064,d2
	add.b	#$30,d2
	move.b	d2,(a1)+
	clr.w	d2
	swap.w	d2
	divu.w	#$000a,d2
	add.b	#$30,d2
	move.b	d2,(a1)+
	swap.w	d2
	add.b	#$30,d2
	move.b	d2,(a1)+
	clr.b	(a1)+
Lff41aa:
	lea.l	($0014,a7),a7
	movem.l	(a7)+,d0-d2/a0-a1
	rts

Lff41b4:
	move.b	#$01,($0c1a)
Lff41ba:
	lea.l	($0c26),a1
	move.b	#$2d,(a1)+
	move.b	#$20,(a1)+
	move.b	#$45,(a1)+
	move.b	#$20,(a1)+
	move.b	#$2d,(a1)
	bra.s	Lff41aa
Lff41d4:
	movea.l	a7,a0
	lea.l	(-$0016,a7),a7
	movea.l	a7,a1
	bsr.w	Lff42a8
	move.l	d0,d1
	moveq.l	#$0f,d2
	subq.l	#1,d1
	bmi.s	Lff41f6
Lff41e8:
	bsr.w	Lff429a
	move.b	d0,(a1)+
	subq.l	#1,d2
	dbra.w	d1,Lff41e8
	bra.s	Lff420c
Lff41f6:
	move.b	#$30,(a1)+
	subq.l	#1,d2
	move.b	#$2e,(a1)+
Lff4200:
	subq.l	#1,d2
	addq.l	#1,d1
	beq.s	Lff4212
	move.b	#$30,(a1)+
	bra.s	Lff4200
Lff420c:
	move.b	#$2e,(a1)+
	subq.l	#1,d2
Lff4212:
	move.b	(a0)+,(a1)+
	beq.s	Lff421c
	dbra.w	d2,Lff4212
	clr.b	(a1)+
Lff421c:
	subq.l	#1,a1
Lff421e:
	move.b	-(a1),d0
	cmp.b	#$30,d0
	beq.s	Lff421e
	addq.l	#1,a1
	clr.b	(a1)
	suba.l	a7,a1
	moveq.l	#$10,d0
	sub.l	a1,d0
	bpl.s	Lff4234
	clr.l	d0
Lff4234:
	lea.l	($0c1b),a1
	adda.l	d0,a1
	movea.l	a7,a0
	moveq.l	#$0f,d1
Lff423e:
	move.b	(a0)+,d0
	beq.s	Lff4248
	move.b	d0,(a1)+
	dbra.w	d1,Lff423e
Lff4248:
	lea.l	($0016,a7),a7
	bra.w	Lff41aa
Lff4250:
	bsr.w	Lff2f88
	bcs.w	Lff41b4
	lea.l	($0c22),a1
	move.l	d0,d1
	moveq.l	#$07,d2
	clr.l	d0
Lff4262:
	rol.l	#4,d1
	move.b	d1,d0
	and.b	#$0f,d0
	add.b	#$30,d0
	cmp.b	#$3a,d0
	bcs.s	Lff4276
	addq.b	#7,d0
Lff4276:
	btst.l	#$08,d0
	bne.s	Lff4294
	cmp.b	#$30,d0
	bne.s	Lff4294
	tst.w	d2
	beq.s	Lff4294
	move.b	#$20,d0
Lff428a:
	move.b	d0,(a1)+
	dbra.w	d2,Lff4262
	bra.w	Lff41aa
Lff4294:
	bset.l	#$08,d0
	bra.s	Lff428a
Lff429a:
	move.b	(a0),d0
	beq.s	Lff42a2
	addq.l	#1,a0
	rts

Lff42a2:
	move.b	#$30,d0
	rts

Lff42a8:
	tst.b	d1
	beq.s	Lff42b2
	move.b	#$2d,(a1)+
	rts

Lff42b2:
	move.b	#$20,(a1)+
	rts

Lff42b8:
	move.l	($0c08),($0c10)
	move.l	($0c0c),($0c14)
Lff42c4:
	bsr.w	Lff4110
	clr.w	($0c18)
Lff42cc:
	movem.l	d0-d4/a0-a1,-(a7)
	move.b	#$01,($09dd)
	bsr.w	Call_MS_STAT
	move.w	d0,-(a7)
	bsr.w	Call_MS_CUROF
	lea.l	(-$000c,a7),a7
	movea.l	a7,a1
	move.b	#$f0,(a1)
	moveq.l	#$20,d1
	move.l	($0c00),d0
	or.l	($0c04),d0
	beq.s	Lff42f8
	moveq.l	#$4d,d1
Lff42f8:
	move.b	d1,($0001,a1)
	move.b	#$f2,($0002,a1)
	move.b	($0bc8),d0
	and.b	#$07,d0
	moveq.l	#$2b,d1
	subq.b	#1,d0
	beq.s	Lff4324
	moveq.l	#$2d,d1
	subq.b	#1,d0
	beq.s	Lff4324
	moveq.l	#$2a,d1
	subq.b	#1,d0
	beq.s	Lff4324
	moveq.l	#$2f,d1
	subq.b	#1,d0
	beq.s	Lff4324
	moveq.l	#$20,d1
Lff4324:
	move.b	d1,($0003,a1)
	move.w	($0bfc),d1
	move.w	($0bfe),d2
	moveq.l	#$01,d3
	bsr.w	Lff44ac
	move.w	($0bfc),d1
	move.w	($0bfe),d2
	add.w	#$0010,d1
	moveq.l	#$0f,d3
	lea.l	($0c1b),a1
	bsr.w	Lff44ac
	lea.l	($0c2b),a0
	movea.l	a7,a1
	moveq.l	#$04,d4
Lff4354:
	move.b	#$f2,(a1)+
	move.b	(a0)+,(a1)+
	dbra.w	d4,Lff4354
	move.w	($0bfc),d1
	move.w	($0bfe),d2
	add.w	#$0090,d1
	moveq.l	#$04,d3
	movea.l	a7,a1
	bsr.w	Lff44ac
	lea.l	($000c,a7),a7
	move.w	(a7)+,d0
	beq.s	Lff437e
	bsr.w	Call_MS_CURON
Lff437e:
	movem.l	(a7)+,d0-d4/a0-a1
	rts

Lff4384:
	movem.l	d1-d7/a0-a6,-(a7)
	move.b	#$01,($0bc6)
	move.b	#$01,($09dd)
	bsr.w	Lff448e
	btst.b	#$00,($0bbf)
	beq.s	Lff43b2
	bsr.w	Lff500e
	move.w	($0bb0),d0
	move.w	($0bb2),d1
	addq.w	#2,d1
	add.w	#$00b8,d0
Lff43b2:
	move.w	d0,($0bfc)
	move.w	d1,($0bfe)
	bsr.w	Call_MS_STAT
	move.w	d0,-(a7)
	bsr.w	Call_MS_CUROF
	move.w	#$ffff,-(a7)
	move.w	#$0010,-(a7)
	move.w	#$00b8,-(a7)
	move.w	($0bfe),-(a7)
	move.w	($0bfc),-(a7)
	move.w	#$0002,-(a7)
	bsr.w	Lff67c4
	lea.l	($000c,a7),a7
	clr.w	-(a7)
	move.w	#$0010,-(a7)
	move.w	#$00b8,-(a7)
	move.w	($0bfe),-(a7)
	move.w	($0bfc),-(a7)
	move.w	#$0003,-(a7)
	bsr.w	Lff67c4
	lea.l	($000c,a7),a7
	move.w	(a7)+,d0
	beq.s	Lff440a
	bsr.w	Call_MS_CURON
Lff440a:
	bsr.w	Lff42b8
	movem.l	(a7)+,d1-d7/a0-a6
	rts

Lff4414:
	clr.b	($0bc6)
	btst.b	#$00,($0bbf)
	beq.s	Lff4424
	bsr.w	Lff500e
Lff4424:
	movem.l	d1-d7/a0-a6,-(a7)
	move.b	#$01,($09dd)
	bsr.w	Call_MS_STAT
	move.w	d0,-(a7)
	bsr.w	Call_MS_CUROF
	clr.w	d0
	btst.b	#$00,($0bbf)
	beq.s	Lff4444
	moveq.l	#$ff,d0
Lff4444:
	move.w	d0,-(a7)
	move.w	#$0010,-(a7)
	move.w	#$00b8,-(a7)
	move.w	($0bfe),-(a7)
	move.w	($0bfc),-(a7)
	move.w	#$0002,-(a7)
	bsr.w	Lff67c4
	lea.l	($000c,a7),a7
	clr.w	-(a7)
	move.w	#$0010,-(a7)
	move.w	#$00b8,-(a7)
	move.w	($0bfe),-(a7)
	move.w	($0bfc),-(a7)
	move.w	#$0003,-(a7)
	bsr.w	Lff67c4
	lea.l	($000c,a7),a7
	move.w	(a7)+,d0
	beq.s	Lff4488
	bsr.w	Call_MS_CURON
Lff4488:
	movem.l	(a7)+,d1-d7/a0-a6
	rts

Lff448e:
	move.w	($0974),d0
	move.w	($0970),d1
	sub.w	#$0016,d1
	cmp.w	d1,d0
	bcs.s	Lff44a0
	move.w	d1,d0
Lff44a0:
	asl.w	#3,d0
	move.w	($0976),d1
	addq.w	#1,d1
	asl.w	#4,d1
	rts

Lff44ac:
	clr.w	d0
	move.b	(a1)+,d0
	bne.s	Lff44b6
	subq.l	#1,a1
	moveq.l	#$20,d0
Lff44b6:
	cmp.b	#$80,d0
	bcs.s	Lff44e0
	beq.s	Lff44d4
	cmp.b	#$a0,d0
	bcs.s	Lff44d0
	cmp.b	#$e0,d0
	bcs.s	Lff44e0
	cmp.b	#$f0,d0
	bcc.s	Lff44d4
Lff44d0:
	subq.w	#1,d3
	bmi.s	Lff44e8
Lff44d4:
	asl.w	#8,d0
	move.b	(a1)+,d0
	bne.s	Lff44e0
	subq.l	#1,a1
	move.w	#$8140,d0
Lff44e0:
	bsr.s	Lff44ee
	dbra.w	d3,Lff44ac
	rts

Lff44e8:
	moveq.l	#$20,d0
	bsr.s	Lff44ee
	rts

Lff44ee:
	movem.l	d1-d3/a1-a2,-(a7)
	tst.b	($00ed002c)
	beq.s	Lff4532
	lea.l	(-$004c,a7),a7
	movea.l	a7,a1
	movem.l	d1-d2,-(a7)
	move.l	#$00080000,d1
	move.w	d0,d1
	bsr.w	Call_FNTGET
	movem.l	(a7)+,d1-d2
	movea.l	a7,a1
	move.l	($0944),-(a7)
	move.l	#$00e60000,($0944)
	bsr.w	Call_TEXTPUT
	move.l	(a7)+,($0944)
	move.w	(a7),d0
	lea.l	($004c,a7),a7
	bra.s	Lff4566
Lff4532:
	move.w	d0,d3
	lea.l	(Lff45b2,pc),a1
	cmp.b	#$20,d3
	bne.s	Lff4540
	moveq.l	#$20,d3
Lff4540:
	move.w	(a1)+,d0
	beq.s	Lff4566
	cmp.w	d3,d0
	beq.s	Lff454e
	lea.l	($0014,a1),a1
	bra.s	Lff4540
Lff454e:
	move.l	($0944),-(a7)
	move.l	#$00e60000,($0944)
	move.w	(a1),d3
	bsr.w	Call_TEXTPUT
	move.l	(a7)+,($0944)
	move.w	d3,d0
Lff4566:
	movem.l	(a7)+,d1-d3/a1-a2
	add.w	d0,d1
	rts

Lff456e:
	.dc.b	$f0,$6d,$f1,$38,$f2,$39,$f3,$54
	.dc.b	$f4,$3f,$f5,$4e,$f6,$3a,$f7,$53
	.dc.b	$f8,$52,$f9,$36,$fa,$37,$fb,$50
	.dc.b	$3d,$4a,$2f,$40,$2a,$41
Lff458c:
	.dc.b	$30,$4f,$31,$4b,$32,$4c,$33,$4d
	.dc.b	$34,$47,$35,$48,$36,$49,$37,$43
	.dc.b	$38,$44,$39,$45,$41,$1e,$42,$2e
	.dc.b	$43,$2c,$44,$20,$45,$13,$46,$21
	.dc.b	$2e,$51,$2b,$46,$2d,$42
Lff45b2:
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
	.dc.b	$3c,$00,$00,$00
Call_SKEY_MOD:
	cmp.b	#$02,d1
	beq.s	Lff4938
	move.b	d1,($0bc1)
	tst.b	d1
	beq.s	Lff494a
	cmp.b	#$01,d1
	beq.s	Lff4978
	cmp.b	#-$01,d1
	bne.s	Lff4938
	bsr.s	Lff494a
	bsr.w	Lff680e
	move.b	#$00,($0bc2)
	bsr.w	Call_MS_CUROF
Lff4938:
	clr.l	d0
	move.b	($0bc2),d0
	subq.b	#1,d0
	cmp.b	#$02,d0
	bcs.s	Lff4948
	clr.l	d0
Lff4948:
	rts

Lff494a:
	move.b	#$01,($0bc4)
	bsr.s	Lff4958
	clr.b	($0bc4)
	bra.s	Lff4938
Lff4958:
	cmpi.b	#$02,($0bc2)
	bne.s	Lff4948
	move.b	#$01,($09dd)
	move.b	#$01,($0bc2)
	bsr.w	Lff517c
	bsr.w	Lff4e4c
	bra.w	Call_MS_CURON
Lff4978:
	cmpi.b	#$02,($0bc2)
	beq.s	Lff49c4
	move.b	#$01,($0bc4)
	move.b	#$01,($09dd)
	move.b	#$02,($0bc2)
	movem.l	d1-d2,-(a7)
	move.w	#$036a,d1
	cmp.w	d1,d2
	bcs.s	Lff49a0
	move.w	d1,d2
Lff49a0:
	move.w	d2,($0bb2)
	move.w	#$028e,d1
	swap.w	d2
	cmp.w	d1,d2
	bcs.s	Lff49b0
	move.w	d1,d2
Lff49b0:
	move.w	d2,($0bb0)
	movem.l	(a7)+,d1-d2
	bsr.w	Lff4e9e
	bsr.w	Call_MS_CURON
	clr.b	($0bc4)
Lff49c4:
	bra.w	Lff4938
Lff49c8:
	cmpi.b	#$02,($09dd)
	beq.s	Lff4a18
	tst.b	($0bc4)
	bne.s	Lff4a18
	tst.w	($0ade)
	bne.s	Lff4a18
	move.b	#$01,($0bc4)
	move.b	#$01,($09dd)
	move.b	(a1),d0
	move.w	($00e8002a),-(a7)
	bclr.b	#$00,($00e8002a)
	bsr.s	Lff4a1a
	clr.b	($0bc4)
	move.w	(a7)+,($00e8002a)
	tst.b	($0bc3)
	beq.s	Lff4a18
	btst.b	#$00,(a1)
	bne.s	Lff4a14
	clr.b	($0bc3)
Lff4a14:
	andi.b	#$fe,(a1)
Lff4a18:
	rts

Lff4a1a:
	move.b	($0bbe),d1
	move.b	d0,($0bbe)
	btst.l	#$01,d0
	bne.w	Lff4db6
Lff4a2a:
	btst.b	#$00,($0bbf)
	beq.s	Lff4a48
	btst.l	#$00,d0
	bne.w	Lff4d00
	btst.l	#$00,d1
	beq.s	Lff4a48
	move.w	($0bb8),d0
	bsr.w	Lff4bde
Lff4a48:
	rts

Lff4a4a:
	tst.b	($0bc4)
	bne.s	Lff4a9e
	tst.w	($0ade)
	bne.s	Lff4a9e
	cmpi.b	#$02,($0bc2)
	bne.s	Lff4a9e
	move.b	#$01,($0bc4)
	bsr.w	Call_MS_STAT
	move.w	d0,-(a7)
	bsr.w	Call_MS_CUROF
	move.b	#$01,($09dd)
	move.b	#$01,($0bc2)
	move.w	($00e8002a),-(a7)
	bclr.b	#$00,($00e8002a)
	bsr.w	Lff4e48
	move.w	(a7)+,($00e8002a)
	clr.b	($0bc4)
	move.w	(a7)+,d0
	beq.s	Lff4a9e
	bsr.w	Call_MS_CURON
Lff4a9e:
	rts

Lff4aa0:
	tst.b	($0bc4)
	bne.s	Lff4a9e
	tst.b	($0bc3)
	beq.s	Lff4abe
	move.b	#$01,($0bc4)
	bsr.s	Lff4acc
	bsr.s	Lff4af8
	bsr.s	Lff4acc
	clr.b	($0bc4)
	rts

Lff4abe:
	move.b	#$01,($0bc4)
	bsr.s	Lff4af8
	clr.b	($0bc4)
	rts

Lff4acc:
	movem.l	d0/a0,-(a7)
	move.w	($0bb8),d0
	tst.b	d0
	beq.s	Lff4af2
	cmp.w	#$0070,d0
	bcc.s	Lff4af2
	cmp.w	#$0061,d0
	bcc.s	Lff4aea
	cmp.w	#$005a,d0
	bcc.s	Lff4af2
Lff4aea:
	movea.l	($0bba),a0
	bsr.w	Lff4cc0
Lff4af2:
	movem.l	(a7)+,d0/a0
	rts

Lff4af8:
	movem.l	d0-d2/a0,-(a7)
	move.w	d1,d2
	move.w	($00e8002a),-(a7)
	bclr.b	#$00,($00e8002a)
	move.w	d0,-(a7)
	bsr.w	Call_MS_STAT
	move.w	d0,-(a7)
	bsr.w	Call_MS_CUROF
	move.w	($0002,a7),d0
	bsr.s	Lff4b34
	move.w	(a7)+,d0
	beq.s	Lff4b26
	bsr.w	Call_MS_CURON
Lff4b26:
	addq.l	#2,a7
	move.w	(a7)+,($00e8002a)
	movem.l	(a7)+,d0-d2/a0
	rts

Lff4b34:
	btst.b	#$00,($0bbf)
	beq.s	Lff4bba
	cmp.b	#$f0,d0
	bcc.s	Lff4b72
	tst.b	d0
	bmi.s	Lff4bba
	cmp.w	#$005a,d0
	bcs.s	Lff4bba
	beq.s	Lff4bbc
	cmp.w	#$005b,d0
	beq.s	Lff4bca
	cmp.w	#$0061,d0
	bcs.s	Lff4ba2
	cmp.w	#$0070,d0
	bcs.s	Lff4bba
	move.w	d0,-(a7)
	move.b	d0,d1
	and.w	#$0007,d1
	move.w	d2,d0
	btst.l	d1,d0
	beq.s	Lff4b82
	clr.w	(a7)
	bra.s	Lff4b82
Lff4b72:
	move.w	d0,-(a7)
	move.b	d0,d1
	and.w	#$0007,d1
	move.w	d2,d0
	btst.l	d1,d0
	bne.s	Lff4b82
	clr.w	(a7)
Lff4b82:
	move.w	(a7)+,d0
	beq.s	Lff4bba
	and.w	#$007f,d0
	cmp.w	#$0070,d0
	bne.s	Lff4ba2
	lea.l	(Lff5776,pc),a0
	bsr.w	Lff4cc0
	lea.l	(Lff5780,pc),a0
	bsr.w	Lff4cc0
	bra.s	Lff4bb6
Lff4ba2:
	lea.l	(Lff572e,pc),a0
Lff4ba6:
	move.w	(a0)+,d1
	bmi.s	Lff4bba
	cmp.b	d0,d1
	beq.s	Lff4bb2
	addq.l	#8,a0
	bra.s	Lff4ba6
Lff4bb2:
	bsr.w	Lff4cc0
Lff4bb6:
	bsr.w	Lff4ff4
Lff4bba:
	rts

Lff4bbc:
	btst.l	#$09,d2
	beq.s	Lff4ba2
	move.l	a0,-(a7)
	lea.l	(Lff573a,pc),a0
	bra.s	Lff4bd6
Lff4bca:
	btst.l	#$08,d2
	beq.s	Lff4ba2
	move.l	a0,-(a7)
	lea.l	(Lff5730,pc),a0
Lff4bd6:
	bsr.w	Lff4cc0
	movea.l	(a7)+,a0
	bra.s	Lff4ba2
Lff4bde:
	clr.b	($0bc3)
	move.w	#$ffff,($0bb8)
	tst.w	d0
	bmi.w	Lff4cbe
	cmp.w	#$0700,d0
	beq.w	Lff4e02
	cmp.w	#$0740,d0
	beq.w	Lff4cbe
	and.w	#$007f,d0
	beq.w	Lff4cbe
	cmp.w	#$0070,d0
	bcc.w	Lff4cbe
	movea.l	($0bba),a0
	or.w	#$0080,d0
	cmp.b	#$da,d0
	bcs.w	Lff4cb6
	cmp.b	#$e1,d0
	bcc.w	Lff4cb6
	bra.w	Lff4cb8
Lff4c2a:
	move.b	#$01,($0bc3)
	tst.w	d0
	bmi.w	Lff4cbe
	cmp.w	#$0700,d0
	beq.w	Lff4df4
	cmp.w	#$0740,d0
	beq.w	Lff4958
	and.w	#$007f,d0
	beq.s	Lff4cbe
	cmp.w	#$005a,d0
	bcs.s	Lff4cb6
	beq.w	Lff4cdc
	cmp.w	#$005b,d0
	beq.w	Lff4cec
	cmp.w	#$0061,d0
	bcs.s	Lff4c9a
	cmp.w	#$0070,d0
	bcs.s	Lff4cb6
	move.w	d0,-(a7)
	move.b	d0,d1
	and.w	#$0007,d1
	move.w	($0810),d0
	btst.l	d1,d0
	beq.s	Lff4c7e
	ori.w	#$0080,(a7)
Lff4c7e:
	move.w	(a7)+,d0
	move.w	d0,d1
	and.w	#$007f,d1
	cmp.w	#$0070,d1
	bne.s	Lff4c9a
	lea.l	(Lff5776,pc),a0
	bsr.s	Lff4cc0
	lea.l	(Lff5780,pc),a0
	bsr.s	Lff4cc0
	bra.s	Lff4c9c
Lff4c9a:
	bsr.s	Lff4cc0
Lff4c9c:
	bsr.s	Lff4cb8
	bsr.w	Call_MS_STAT
	move.w	d0,-(a7)
	bsr.w	Call_MS_CUROF
	bsr.w	Lff4ff4
	move.w	(a7)+,d0
	beq.s	Lff4cb4
	bsr.w	Call_MS_CURON
Lff4cb4:
	rts

Lff4cb6:
	bsr.s	Lff4cc0
Lff4cb8:
	move.w	d0,d1
	bsr.w	Call_SKEYSET
Lff4cbe:
	rts

Lff4cc0:
	move.w	d0,-(a7)
	bsr.w	Call_MS_STAT
	move.w	d0,-(a7)
	bsr.w	Call_MS_CUROF
	bsr.w	Lff4fc0
	move.w	(a7)+,d0
	beq.s	Lff4cd8
	bsr.w	Call_MS_CURON
Lff4cd8:
	move.w	(a7)+,d0
	rts

Lff4cdc:
	btst.b	#$01,($0810)
	beq.s	Lff4c9a
	move.l	a0,-(a7)
	lea.l	(Lff573a,pc),a0
	bra.s	Lff4cfa
Lff4cec:
	btst.b	#$00,($0810)
	beq.s	Lff4c9a
	move.l	a0,-(a7)
	lea.l	(Lff5730,pc),a0
Lff4cfa:
	bsr.s	Lff4cc0
	movea.l	(a7)+,a0
	bra.s	Lff4c9a
Lff4d00:
	btst.l	#$00,d1
	bne.s	Lff4d46
	movem.l	d1-d4,-(a7)
	move.w	($0ace),d1
	move.w	($0ad0),d2
	sub.w	($0bb0),d1
	sub.w	($0bb2),d2
	cmp.w	#$0096,d2
	bcc.s	Lff4d3e
	cmp.w	#$0172,d1
	bcc.s	Lff4d3e
	bsr.w	Lff51fe
	move.l	a0,($0bba)
	move.w	d0,($0bb8)
	bmi.s	Lff4d3e
	bsr.w	Lff4c2a
	move.b	#$14,($0bc0)
Lff4d3e:
	movem.l	(a7)+,d1-d4
	bra.w	Lff4a48
Lff4d46:
	cmpi.w	#$0700,($0bb8)
	beq.w	Lff4a48
	movem.l	d1-d4,-(a7)
	move.w	($0ace),d1
	move.w	($0ad0),d2
	sub.w	($0bb0),d1
	sub.w	($0bb2),d2
	cmp.w	#$0096,d2
	bcc.s	Lff4d3e
	cmp.w	#$0172,d1
	bcc.s	Lff4d3e
	bsr.w	Lff51fe
	bmi.s	Lff4d3e
	subq.b	#1,($0bc0)
	bne.s	Lff4d3e
	move.b	#$02,($0bc0)
	cmp.w	($0bb8),d0
	bne.s	Lff4d3e
	tst.w	d0
	beq.s	Lff4db0
	movea.l	($0bba),a0
	cmp.b	#$5a,d0
	bcs.s	Lff4da8
	cmp.b	#$61,d0
	bcs.s	Lff4db0
	cmp.b	#$70,d0
	bcs.s	Lff4da8
	cmp.b	#$74,d0
	bcs.s	Lff4d3e
Lff4da8:
	bsr.w	Lff4cc0
	movea.l	($0bba),a0
Lff4db0:
	bsr.w	Lff4c2a
	bra.s	Lff4d3e
Lff4db6:
	tst.b	($0bc1)
	bpl.w	Lff4a2a
	btst.l	#$01,d1
	bne.w	Lff4a48
	move.b	($0bc2),d0
	addq.b	#1,d0
	and.w	#$0003,d0
	move.b	d0,($0bc2)
	asl.w	#2,d0
	lea.l	(Lff4de4,pc),a0
	movea.l	(a0,d0.w),a0
	jsr	(a0)
	bra.w	Lff4a48
Lff4de4:
	.dc.b	$00,$ff,$aa,$8a,$00,$ff,$aa,$5c
	.dc.b	$00,$ff,$4e,$44,$00,$ff,$4e,$48
Lff4df4:
	move.w	($0ace),($0bb4)
	move.w	($0ad0),($0bb6)
	rts

Lff4e02:
	bsr.w	Lff517c
	clr.w	d1
	move.w	($0ace),d0
	sub.w	($0bb4),d0
	add.w	($0bb0),d0
	bmi.s	Lff4e1e
	move.w	#$028e,d1
	cmp.w	d1,d0
	bcs.s	Lff4e20
Lff4e1e:
	move.w	d1,d0
Lff4e20:
	move.w	d0,($0bb0)
	clr.w	d1
	move.w	($0ad0),d0
	sub.w	($0bb6),d0
	add.w	($0bb2),d0
	bmi.s	Lff4e3c
	move.w	#$036a,d1
	cmp.w	d1,d0
	bcs.s	Lff4e3e
Lff4e3c:
	move.w	d1,d0
Lff4e3e:
	move.w	d0,($0bb2)
	bra.s	Lff4e9e
Lff4e44:
	bsr.s	Lff4e78
	bra.s	Lff4e9e
Lff4e48:
	bsr.w	Lff517c
Lff4e4c:
	movem.l	d0-d3,-(a7)
	move.w	($0810),d2
	moveq.l	#$03,d3
Lff4e56:
	btst.l	d3,d2
	beq.s	Lff4e64
	move.w	#$00f0,d1
	add.w	d3,d1
	bsr.w	Call_SKEYSET
Lff4e64:
	dbra.w	d3,Lff4e56
	movem.l	(a7)+,d0-d3
Lff4e6c:
	tst.b	($0bc6)
	beq.s	Lff4e76
	bsr.w	Lff4414
Lff4e76:
	rts

Lff4e78:
	move.w	($0ace),d0
	move.w	#$028e,d1
	cmp.w	d1,d0
	bcs.s	Lff4e86
	move.w	d1,d0
Lff4e86:
	move.w	d0,($0bb0)
	move.w	($0ad0),d0
	move.w	#$036a,d1
	cmp.w	d1,d0
	bcs.s	Lff4e98
	move.w	d1,d0
Lff4e98:
	move.w	d0,($0bb2)
	rts

Lff4e9e:
	tst.b	($0bc6)
	beq.s	Lff4ea8
	bsr.w	Lff4424
Lff4ea8:
	bset.b	#$00,($0bbf)
	bsr.w	Call_MS_STAT
	move.w	d0,-(a7)
	bsr.w	Call_MS_CUROF
	move.w	#$ffff,-(a7)
	move.w	#$0096,-(a7)
	move.w	#$0172,-(a7)
	move.w	($0bb2),-(a7)
	move.w	($0bb0),-(a7)
	move.w	#$0002,-(a7)
	bsr.w	Lff67c4
	lea.l	($000c,a7),a7
	clr.w	-(a7)
	move.w	#$0096,-(a7)
	move.w	#$0172,-(a7)
	move.w	($0bb2),-(a7)
	move.w	($0bb0),-(a7)
	move.w	#$0003,-(a7)
	bsr.w	Lff67c4
	lea.l	($000c,a7),a7
	move.w	#$ffff,-(a7)
	move.w	#$0096,-(a7)
	move.w	#$0172,-(a7)
	move.w	($0bb2),-(a7)
	move.w	($0bb0),-(a7)
	move.w	#$0003,-(a7)
	bsr.w	Lff67a2
	lea.l	($000c,a7),a7
	movem.l	d1-d2/a1,-(a7)
	lea.l	(Lff5314,pc),a0
	lea.l	(-$000c,a7),a7
	move.w	#$ffff,($000a,a7)
	move.w	#$0003,(a7)
Lff4f2c:
	move.w	(a0)+,d0
	bmi.s	Lff4f8e
	bsr.w	Lff5048
	move.w	(a0)+,d0
	add.w	($0bb0),d0
	move.w	d0,($0002,a7)
	move.w	(a0)+,d0
	add.w	($0bb2),d0
	move.w	d0,($0004,a7)
	move.w	(a0)+,($0006,a7)
	move.w	(a0)+,($0008,a7)
	bsr.w	Lff67a2
	move.w	(-$000a,a0),d0
	cmp.b	#$5a,d0
	bcs.s	Lff4f2c
	cmp.b	#$61,d0
	bcs.s	Lff4f76
	cmp.b	#$70,d0
	bcs.s	Lff4f2c
	cmp.b	#$74,d0
	bcc.s	Lff4f2c
	sub.b	#$70,d0
	bra.s	Lff4f7a
Lff4f76:
	sub.b	#$52,d0
Lff4f7a:
	move.w	d0,d1
	move.w	($0810),d0
	btst.l	d1,d0
	beq.s	Lff4f2c
	movea.l	a0,a1
	subq.l	#8,a0
	bsr.s	Lff4fc0
	movea.l	a1,a0
	bra.s	Lff4f2c
Lff4f8e:
	adda.w	#$000c,a7
	tst.b	($0bc6)
	beq.s	Lff4fb2
	move.w	($0bb0),d0
	move.w	($0bb2),d1
	addq.w	#2,d1
	add.w	#$00b8,d0
	move.w	d0,($0bfc)
	move.w	d1,($0bfe)
	bsr.w	Lff42b8
Lff4fb2:
	movem.l	(a7)+,d1-d2/a1
Lff4fb6:
	move.w	(a7)+,d0
	beq.s	Lff4fbe
	bsr.w	Call_MS_CURON
Lff4fbe:
	rts

Lff4fc0:
	move.w	($0006,a0),d0
	subq.w	#2,d0
	move.w	d0,-(a7)
	move.w	($0004,a0),d0
	subq.w	#2,d0
	move.w	d0,-(a7)
	move.w	($0002,a0),d0
	add.w	($0bb2),d0
	addq.w	#1,d0
	move.w	d0,-(a7)
	move.w	(a0),d0
	add.w	($0bb0),d0
	addq.w	#1,d0
	move.w	d0,-(a7)
	move.w	#$0003,-(a7)
	bsr.w	Lff67b4
	adda.w	#$000a,a7
	rts

Lff4ff4:
	movem.l	d0-d2/a0-a1,-(a7)
	lea.l	(Lff5314,pc),a0
Lff4ffc:
	move.w	(a0)+,d0
	bmi.s	Lff5008
	bsr.w	Lff50b8
	addq.l	#8,a0
	bra.s	Lff4ffc
Lff5008:
	movem.l	(a7)+,d0-d2/a0-a1
	rts

Lff500e:
	tst.b	($0bc4)
	bne.s	Lff500e
	move.b	#$01,($0bc4)
	movem.l	d0-d2/a0-a1,-(a7)
	bsr.w	Call_MS_STAT
	move.w	d0,-(a7)
	bsr.w	Call_MS_CUROF
	lea.l	(Lff5314,pc),a0
Lff502c:
	move.w	(a0)+,d0
	bmi.s	Lff5036
	bsr.s	Lff5050
	addq.l	#8,a0
	bra.s	Lff502c
Lff5036:
	clr.b	($0bc4)
	move.w	(a7)+,d0
	beq.s	Lff5042
	bsr.w	Call_MS_CURON
Lff5042:
	movem.l	(a7)+,d0-d2/a0-a1
	rts

Lff5048:
	cmp.w	#$1000,d0
	bcs.s	Lff50b8
	bsr.s	Lff506e
Lff5050:
	cmp.w	#$1000,d0
	bcs.s	Lff50b6
	movem.l	d0-d2/a0-a1,-(a7)
	and.w	#$ff00,d0
	lea.l	(Lff5e4a,pc),a1
	tst.b	($0bc6)
	bne.s	Lff507a
	lea.l	(Lff5cca,pc),a1
	bra.s	Lff507a
Lff506e:
	movem.l	d0-d2/a0-a1,-(a7)
	and.w	#$ff00,d0
	lea.l	(Lff57b2,pc),a1
Lff507a:
	move.w	(a1)+,d1
	bmi.s	Lff50b2
	move.w	(a1)+,d2
	cmp.w	d0,d1
	bne.s	Lff50ac
	move.l	($0944),-(a7)
	move.l	#$00e60000,($0944)
	move.w	(a0),d1
	add.w	($0bb0),d1
	addq.w	#1,d1
	move.w	($0002,a0),d2
	add.w	($0bb2),d2
	addq.w	#1,d2
	bsr.w	Call_TEXTPUT
	move.l	(a7)+,($0944)
	bra.s	Lff50b2
Lff50ac:
	lea.l	(a1,d2.w),a1
	bra.s	Lff507a
Lff50b2:
	movem.l	(a7)+,d0-d2/a0-a1
Lff50b6:
	rts

Lff50b8:
	and.w	#$007f,d0
	movem.l	d2/a0,-(a7)
	bsr.w	Lff522a
	movem.l	(a7)+,d2/a0
	and.l	#$000000ff,d1
	beq.w	Lff517a
	cmp.b	#$b0,d1
	beq.s	Lff50e4
	btst.b	#$05,($0810)
	beq.s	Lff50e4
	or.w	#$8000,d1
Lff50e4:
	or.l	#$00060000,d1
	lea.l	($0c36),a1
	movem.l	a0,-(a7)
	bsr.w	Call_FNTGET
	movem.l	(a7)+,a0
	move.w	(a0),d1
	add.w	($0bb0),d1
	move.w	($0004,a0),d0
	subq.w	#6,d0
	lsr.w	#1,d0
	add.w	d0,d1
	move.w	($0002,a0),d2
	add.w	($0bb2),d2
	move.w	($0006,a0),d0
	sub.w	#$000c,d0
	lsr.w	#1,d0
	add.w	d0,d2
	lea.l	($0c36),a1
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
Lff5158:
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
	dbra.w	d4,Lff5158
	movem.l	(a7)+,d3-d7/a2
Lff517a:
	rts

Lff517c:
	clr.b	($0bc3)
	move.w	#$ffff,($0bb8)
	bclr.b	#$00,($0bbf)
	tst.b	($0bc6)
	beq.s	Lff519e
	bsr.w	Lff448e
	move.w	d0,($0bfc)
	move.w	d1,($0bfe)
Lff519e:
	bsr.w	Call_MS_STAT
	move.w	d0,-(a7)
	bsr.w	Call_MS_CUROF
	clr.w	-(a7)
	move.w	#$0096,-(a7)
	move.w	#$0172,-(a7)
	move.w	($0bb2),-(a7)
	move.w	($0bb0),-(a7)
	move.w	#$0002,-(a7)
	bsr.w	Lff67c4
	lea.l	($000c,a7),a7
	clr.w	-(a7)
	move.w	#$0096,-(a7)
	move.w	#$0172,-(a7)
	move.w	($0bb2),-(a7)
	move.w	($0bb0),-(a7)
	move.w	#$0003,-(a7)
	bsr.w	Lff67c4
	lea.l	($000c,a7),a7
	bra.w	Lff4fb6
Lff51e8:
	moveq.l	#$ff,d0
	sub.w	($0bb0),d1
	sub.w	($0bb2),d2
	cmp.w	#$0096,d2
	bcc.s	Lff5226
	cmp.w	#$0172,d1
	bcc.s	Lff5226
Lff51fe:
	lea.l	(Lff5314,pc),a0
Lff5202:
	move.w	(a0)+,d0
	bmi.s	Lff5226
	move.w	(a0)+,d3
	move.w	(a0)+,d4
	cmp.w	d3,d1
	bcs.s	Lff5220
	cmp.w	d4,d2
	bcs.s	Lff5220
	add.w	(a0),d3
	add.w	($0002,a0),d4
	cmp.w	d3,d1
	bcc.s	Lff5220
	cmp.w	d4,d2
	bcs.s	Lff5224
Lff5220:
	addq.l	#4,a0
	bra.s	Lff5202
Lff5224:
	subq.l	#4,a0
Lff5226:
	tst.w	d0
	rts

Lff522a:
	and.w	#$00ff,d0
	clr.w	d1
	cmp.b	#$35,d0
	bcs.s	Lff523e
	cmp.b	#$80,d0
	bcs.s	Lff5290
	rts

Lff523e:
	move.b	($0811),d2
	btst.l	#$01,d2
	bne.w	Lff52f2
	btst.l	#$06,d2
	bne.s	Lff5290
	btst.l	#$02,d2
	bne.s	Lff526a
	btst.l	#$03,d2
	bne.w	Lff5310
	btst.l	#$04,d2
	bne.s	Lff52aa
	btst.l	#$05,d2
	bne.s	Lff529a
Lff526a:
	bsr.s	Lff529a
	btst.l	#$07,d2
	bne.s	Lff528e
	cmp.b	#$41,d1
	bcs.s	Lff528e
	cmp.b	#$5b,d1
	bcs.s	Lff528a
	cmp.b	#$61,d1
	bcs.s	Lff528e
	cmp.b	#$7b,d1
	bcc.s	Lff528e
Lff528a:
	eori.b	#$20,d1
Lff528e:
	rts

Lff5290:
	lea.l	(Lff5fca,pc),a0
	move.b	(a0,d0.w),d1
	rts

Lff529a:
	btst.l	#$00,d2
	beq.s	Lff5290
Lff52a0:
	lea.l	(Lff604a,pc),a0
	move.b	(a0,d0.w),d1
	rts

Lff52aa:
	tst.b	($00ed002b)
	bne.s	Lff52ca
	lea.l	(Lff607f,pc),a0
	move.b	(a0,d0.w),d1
	btst.l	#$00,d2
	beq.s	Lff52e8
	lea.l	(Lff60b4,pc),a0
	move.w	#$000f,d2
	bra.s	Lff52e0
Lff52ca:
	lea.l	(Lff60c4,pc),a0
	move.b	(a0,d0.w),d1
	btst.l	#$00,d2
	beq.s	Lff52e8
	lea.l	(Lff60f9,pc),a0
	move.w	#$0010,d2
Lff52e0:
	cmp.b	(a0)+,d1
	beq.s	Lff52ea
	dbra.w	d2,Lff52e0
Lff52e8:
	rts

Lff52ea:
	add.b	#$a0,d2
	move.b	d2,d1
	rts

Lff52f2:
	bsr.s	Lff52a0
	tst.b	d1
	beq.s	Lff5308
	cmp.b	#$41,d1
	bcs.s	Lff530a
	cmp.b	#$7f,d1
	bcc.s	Lff530a
	and.w	#$00df,d1
Lff5308:
	rts

Lff530a:
	move.w	#$0020,d1
	rts

Lff5310:
	clr.b	d1
	rts

Lff5314:
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
Lff572e:
	.dc.b	$1c,$5a
Lff5730:
	.dc.b	$00,$fa,$00,$24,$00,$0e,$00,$0e
	.dc.b	$1d,$5b
Lff573a:
	.dc.b	$01,$09,$00,$24,$00,$0e,$00,$0e
	.dc.b	$1e,$5c,$01,$18,$00,$24,$00,$0e
	.dc.b	$00,$0e,$1f,$5d,$01,$2e,$00,$24
	.dc.b	$00,$0e,$00,$0e,$26,$5e,$01,$09
	.dc.b	$00,$3d,$00,$0e,$00,$0e,$35,$5f
	.dc.b	$00,$26,$00,$79,$00,$0e,$00,$0e
	.dc.b	$3b,$60,$00,$c8,$00,$79,$00,$0e
	.dc.b	$00,$0e,$32,$70
Lff5776:
	.dc.b	$00,$0a,$00,$6a,$00,$21,$00,$0e
	.dc.b	$32,$70
Lff5780:
	.dc.b	$00,$d1,$00,$6a,$00,$21,$00,$0e
	.dc.b	$2e,$71,$00,$0a,$00,$5b,$00,$19
	.dc.b	$00,$0e,$3c,$72,$00,$fa,$00,$79
	.dc.b	$00,$15,$00,$0e,$3d,$73,$01,$11
	.dc.b	$00,$79,$00,$15,$00,$0e,$00,$00
	.dc.b	$00,$00,$00,$00,$01,$71,$00,$95
	.dc.b	$ff,$ff
Lff57b2:
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
Lff5cca:
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
Lff5e4a:
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
Lff5fca:
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
Lff604a:
	.dc.b	$00,$00,$21,$22,$23,$24,$25,$26
	.dc.b	$27,$28,$29,$20,$3d,$7e,$7c,$00
	.dc.b	$00,$71,$77,$65,$72,$74,$79,$75
	.dc.b	$69,$6f,$70,$60,$7b,$00,$61,$73
	.dc.b	$64,$66,$67,$68,$6a,$6b,$6c,$2b
	.dc.b	$2a,$7d,$7a,$78,$63,$76,$62,$6e
	.dc.b	$6d,$3c,$3e,$3f,$5f
Lff607f:
	.dc.b	$00,$00,$c7,$cc,$b1,$b3,$b4,$b5
	.dc.b	$d4,$d5,$d6,$dc,$ce,$cd,$b0,$00
	.dc.b	$00,$c0,$c3,$b2,$bd,$b6,$dd,$c5
	.dc.b	$c6,$d7,$be,$de,$df,$00,$c1,$c4
	.dc.b	$bc,$ca,$b7,$b8,$cf,$c9,$d8,$da
	.dc.b	$b9,$d1,$c2,$bb,$bf,$cb,$ba,$d0
	.dc.b	$d3,$c8,$d9,$d2,$db
Lff60b4:
	.dc.b	'ﾂﾖﾕﾔｵｴｳｲｱﾜﾒﾈﾑﾟﾙﾛ'
Lff60c4:
	.dc.b	$00,$00,$b1,$b2,$b3,$b4,$b5,$c5
	.dc.b	$c6,$c7,$c8,$c9,$d7,$d8,$d9,$00
	.dc.b	$00,$b6,$b7,$b8,$b9,$ba,$ca,$cb
	.dc.b	$cc,$cd,$ce,$da,$db,$00,$bb,$bc
	.dc.b	$bd,$be,$bf,$cf,$d0,$d1,$d2,$d3
	.dc.b	$de,$df,$c0,$c1,$c2,$c3,$c4,$d4
	.dc.b	$d5,$d6,$dc,$a6,$dd
Lff60f9:
	.dc.b	'ﾞﾂﾖﾕﾔｵｴｳｲｱﾉﾝﾜﾟﾛｦｻ'
Call_TXXLINE:
	movem.l	d1-d7/a1-a3,-(a7)
	lea.l	($00e8002a),a2
	lea.l	($0004,a2),a3
	moveq.l	#$00,d0
	move.w	(a1)+,d0
	move.w	(a1)+,d1
	move.w	(a1)+,d3
	move.w	(a1)+,d2
	move.w	(a1)+,d6
	add.w	d1,d2
	sub.w	($0d1c),d2
	lea.l	($00e00000),a1
	tst.w	d0
	bmi.s	Lff6156
	btst.b	#$00,(a2)
	bne.s	Lff6162
	and.w	#$0003,d0
	add.w	d0,d0
	swap.w	d0
	adda.l	d0,a1
	move.w	#$0200,d0
Lff6148:
	move.w	(a2),d7
	move.w	d0,(a2)
	bsr.s	Lff6192
	move.w	d7,(a2)
	movem.l	(a7)+,d1-d7/a1-a3
	rts

Lff6156:
	and.w	#$000f,d0
	lsl.w	#4,d0
	or.w	#$0300,d0
	bra.s	Lff6148
Lff6162:
	move.w	(a2),d0
	or.w	#$0300,d0
	bra.s	Lff6148
Lff616a:
	.dc.w	$0000,$8000,$c000,$e000
	.dc.w	$f000,$f800,$fc00,$fe00
	.dc.w	$ff00,$ff80,$ffc0,$ffe0
	.dc.w	$fff0,$fff8,$fffc,$fffe
Lff618a:
	rts

Lff618c:
	movea.w	#$ffff,a0
	bra.s	Lff6194
Lff6192:
	suba.l	a0,a0
Lff6194:
	movem.l	($0954),d4-d5
	cmp.w	d4,d3
	blt.s	Lff618a
	cmp.w	d5,d3
	bge.s	Lff618a
	swap.w	d4
	swap.w	d5
	cmp.w	d1,d2
	bge.s	Lff61ac
	exg.l	d1,d2
Lff61ac:
	cmp.w	d4,d1
	bge.s	Lff61b2
	move.w	d4,d1
Lff61b2:
	cmp.w	d5,d2
	blt.s	Lff61ba
	move.w	d5,d2
	subq.w	#1,d2
Lff61ba:
	move.b	d6,d0
	lsl.w	#8,d6
	move.b	d0,d6
	move.w	d6,d0
	swap.w	d6
	move.w	d0,d6
	move.w	($0940),d0
	mulu.w	d3,d0
	adda.l	d0,a1
	moveq.l	#$00,d3
	moveq.l	#$00,d4
	addq.w	#1,d2
	move.w	d1,d3
	move.w	d2,d4
	and.w	#$000f,d3
	and.w	#$000f,d4
	add.w	d3,d3
	add.w	d4,d4
	move.w	(Lff616a,pc,d3.w),d3
	move.w	(Lff616a,pc,d4.w),d4
	swap.w	d3
	swap.w	d4
	lsr.w	#5,d1
	bcc.s	Lff61fa
	move.w	#$ffff,d3
	swap.w	d3
Lff61fa:
	swap.w	d3
	lsr.w	#5,d2
	bcc.s	Lff6206
	move.w	#$ffff,d4
	swap.w	d4
Lff6206:
	swap.w	d4
	not.l	d4
	move.w	d2,d5
	sub.w	d1,d5
	beq.w	Lff62a0
	add.w	d1,d1
	add.w	d1,d1
	add.w	d2,d2
	add.w	d2,d2
	cmp.w	($0940),d2
	bne.s	Lff6224
	subq.w	#4,d2
	moveq.l	#$ff,d4
Lff6224:
	move.l	a0,d0
	bne.s	Lff6264
Lff6228:
	move.l	a1,-(a7)
	lea.l	(a1,d2.w),a0
	move.w	sr,d0
	ori.w	#$0700,sr
	move.w	d4,(a3)
	move.w	d6,(a0)+
	swap.w	d4
	move.w	d4,(a3)
	move.w	d6,(a0)
	swap.w	d4
	adda.w	d1,a1
	move.w	d3,(a3)
	move.w	d6,(a1)+
	swap.w	d3
	move.w	d3,(a3)
	move.w	d6,(a1)+
	swap.w	d3
	clr.w	(a3)
	move.w	d0,sr
	move.w	d5,d0
	subq.w	#1,d0
	beq.s	Lff625c
	bsr.w	Lff62f2
Lff625c:
	movea.l	(a7)+,a1
	lea.l	(Lff6228,pc),a0
	rts

Lff6264:
	move.l	a1,-(a7)
	lea.l	(a1,d2.w),a0
	move.w	sr,d0
	ori.w	#$0700,sr
	move.w	d4,(a3)
	not.w	(a0)+
	swap.w	d4
	move.w	d4,(a3)
	not.w	(a0)+
	swap.w	d4
	adda.w	d1,a1
	move.w	d3,(a3)
	not.w	(a1)+
	swap.w	d3
	move.w	d3,(a3)
	not.w	(a1)+
	swap.w	d3
	clr.w	(a3)
	move.w	d0,sr
	move.w	d5,d0
	subq.w	#1,d0
	beq.s	Lff6298
	bsr.w	Lff632a
Lff6298:
	movea.l	(a7)+,a1
	lea.l	(Lff6264,pc),a0
	rts

Lff62a0:
	add.w	d1,d1
	add.w	d1,d1
	or.l	d4,d3
	move.l	a0,d0
	bne.s	Lff62ce
Lff62aa:
	move.l	a1,-(a7)
	adda.w	d1,a1
	move.w	sr,d0
	ori.w	#$0700,sr
	move.w	d3,(a3)
	move.w	d6,(a1)
	swap.w	d3
	move.w	d3,(a3)
	move.w	d6,($0002,a1)
	swap.w	d3
	clr.w	(a3)
	move.w	d0,sr
	movea.l	(a7)+,a1
	lea.l	(Lff62aa,pc),a0
	rts

Lff62ce:
	move.l	a1,-(a7)
	adda.w	d1,a1
	move.w	sr,d0
	ori.w	#$0700,sr
	move.w	d3,(a3)
	not.w	(a1)
	swap.w	d3
	move.w	d3,(a3)
	not.w	($0002,a1)
	swap.w	d3
	clr.w	(a3)
	move.w	d0,sr
	movea.l	(a7)+,a1
	lea.l	(Lff62ce,pc),a0
	rts

Lff62f2:
	lea.l	(Lff62f8,pc),a0
	add.w	d0,d0
Lff62f8:
	sub.w	#$0020,d0
	ble.s	Lff6300
	bra.s	Lff6308
Lff6300:
	neg.w	d0
	movea.l	(a7)+,a0
	jmp	(Lff6308,pc,d0.w)

Lff6308:
	move.l	d6,(a1)+
	move.l	d6,(a1)+
	move.l	d6,(a1)+
	move.l	d6,(a1)+
	move.l	d6,(a1)+
	move.l	d6,(a1)+
	move.l	d6,(a1)+
	move.l	d6,(a1)+
	move.l	d6,(a1)+
	move.l	d6,(a1)+
	move.l	d6,(a1)+
	move.l	d6,(a1)+
	move.l	d6,(a1)+
	move.l	d6,(a1)+
	move.l	d6,(a1)+
	move.l	d6,(a1)+
	jmp	(a0)

Lff632a:
	lea.l	(Lff6330,pc),a0
	add.w	d0,d0
Lff6330:
	sub.w	#$0020,d0
	ble.s	Lff6338
	bra.s	Lff6340
Lff6338:
	neg.w	d0
	movea.l	(a7)+,a0
	jmp	(Lff6340,pc,d0.w)

Lff6340:
	not.l	(a1)+
	not.l	(a1)+
	not.l	(a1)+
	not.l	(a1)+
	not.l	(a1)+
	not.l	(a1)+
	not.l	(a1)+
	not.l	(a1)+
	not.l	(a1)+
	not.l	(a1)+
	not.l	(a1)+
	not.l	(a1)+
	not.l	(a1)+
	not.l	(a1)+
	not.l	(a1)+
	not.l	(a1)+
	jmp	(a0)

Call_TXYLINE:
	movem.l	d1-d7/a1-a3,-(a7)
	lea.l	($00e8002a),a2
	lea.l	($0004,a2),a3
	moveq.l	#$00,d0
	move.w	(a1)+,d0
	move.w	(a1)+,d1
	move.w	(a1)+,d2
	move.w	(a1)+,d3
	move.w	(a1)+,d6
	add.w	d2,d3
	sub.w	($0d1c),d3
	lea.l	($00e00000),a1
	tst.w	d0
	bmi.s	Lff63ae
	btst.b	#$00,(a2)
	bne.s	Lff63ba
	and.w	#$0003,d0
	add.w	d0,d0
	swap.w	d0
	adda.l	d0,a1
	move.w	#$0200,d0
Lff63a0:
	move.w	(a2),d7
	move.w	d0,(a2)
	bsr.s	Lff63c4
	move.w	d7,(a2)
	movem.l	(a7)+,d1-d7/a1-a3
	rts

Lff63ae:
	and.w	#$000f,d0
	lsl.w	#4,d0
	or.w	#$0300,d0
	bra.s	Lff63a0
Lff63ba:
	move.w	(a2),d0
	or.w	#$0300,d0
	bra.s	Lff63a0
Lff63c2:
	rts

Lff63c4:
	cmp.w	($0954),d1
	blt.s	Lff63c2
	cmp.w	($0958),d1
	bge.s	Lff63c2
	movem.l	($0954),d4-d5
	cmp.w	d2,d3
	bge.s	Lff63dc
	exg.l	d2,d3
Lff63dc:
	cmp.w	d4,d2
	bge.s	Lff63e2
	move.w	d4,d2
Lff63e2:
	cmp.w	d5,d3
	blt.s	Lff63ea
	move.w	d5,d3
	subq.w	#1,d3
Lff63ea:
	move.w	($0940),d4
	sub.w	d2,d3
	addq.w	#1,d3
	mulu.w	d4,d2
	adda.l	d2,a1
	move.w	d1,d0
	lsr.w	#4,d0
	add.w	d0,d0
	adda.w	d0,a1
	and.w	#$000f,d1
	move.w	#$7fff,d0
	ror.w	d1,d0
	move.w	sr,-(a7)
	ori.w	#$0700,sr
	move.w	d0,(a3)
	moveq.l	#$00,d0
	tst.b	d6
	beq.s	Lff641e
	moveq.l	#$ff,d0
	cmp.b	#$ff,d6
	bne.s	Lff6492
Lff641e:
	lsl.w	#4,d4
	move.w	d3,d1
	lsr.w	#4,d1
	beq.s	Lff6434
	subq.w	#1,d1
	lea.l	(Lff642e,pc),a0
Lff642c:
	bra.s	Lff6446
Lff642e:
	adda.w	d4,a1
	dbra.w	d1,Lff642c
Lff6434:
	and.w	#$000f,d3
	add.w	d3,d3
	add.w	d3,d3
	neg.w	d3
	lea.l	(Lff6488,pc),a0
	jmp	(Lff6486,pc,d3.w)

Lff6446:
	move.w	d0,($0780,a1)
	move.w	d0,($0700,a1)
	move.w	d0,($0680,a1)
	move.w	d0,($0600,a1)
	move.w	d0,($0580,a1)
	move.w	d0,($0500,a1)
	move.w	d0,($0480,a1)
	move.w	d0,($0400,a1)
	move.w	d0,($0380,a1)
	move.w	d0,($0300,a1)
	move.w	d0,($0280,a1)
	move.w	d0,($0200,a1)
	move.w	d0,($0180,a1)
	move.w	d0,($0100,a1)
	move.w	d0,($0080,a1)
	move.w	d0,(a1)
	nop
Lff6486:
	jmp	(a0)

Lff6488:
	clr.w	(a3)
	move.w	(a7)+,sr
	rts

Lff648e:
	clr.w	(a1)
Lff6490:
	adda.w	d4,a1
Lff6492:
	subq.w	#1,d3
	bmi.s	Lff6488
	rol.b	#1,d6
	bcc.s	Lff648e
	move.w	d0,(a1)
	bra.s	Lff6490
Call_TXLINE:
	movem.l	d1-d7/a1-a4,-(a7)
	lea.l	($00e8002a),a2
	lea.l	($0004,a2),a3
	moveq.l	#$00,d4
	move.w	(a1)+,d4
	move.w	(a1)+,d0
	move.w	(a1)+,d1
	move.w	(a1)+,d2
	beq.s	Lff64c0
	bpl.s	Lff64be
	addq.w	#1,d2
	bra.s	Lff64c0
Lff64be:
	subq.w	#1,d2
Lff64c0:
	move.w	(a1)+,d3
	beq.s	Lff64cc
	bpl.s	Lff64ca
	addq.w	#1,d3
	bra.s	Lff64cc
Lff64ca:
	subq.w	#1,d3
Lff64cc:
	add.w	d0,d2
	add.w	d1,d3
	move.w	(a1)+,d6
	lea.l	($00e00000),a1
	tst.w	d4
	bmi.s	Lff64fe
	btst.b	#$00,(a2)
	bne.s	Lff650a
	and.w	#$0003,d4
	add.w	d4,d4
	swap.w	d4
	adda.l	d4,a1
	move.w	#$0200,d4
Lff64f0:
	move.w	(a2),d7
	move.w	d4,(a2)
	bsr.s	Lff6522
	move.w	d7,(a2)
	movem.l	(a7)+,d1-d7/a1-a4
	rts

Lff64fe:
	and.w	#$000f,d4
	lsl.w	#4,d4
	or.w	#$0300,d4
	bra.s	Lff64f0
Lff650a:
	move.w	(a2),d4
	or.w	#$0300,d4
	bra.s	Lff64f0
Lff6512:
	exg.l	d1,d4
	bra.w	Lff6192
Lff6518:
	exg.l	d1,d2
	exg.l	d2,d5
	bra.w	Lff63c4
Lff6520:
	rts

Lff6522:
	jsr	(Lffe692)
	bcs.s	Lff6520
	exg.l	d0,d4
	exg.l	d1,d5
	cmp.w	d3,d5
	beq.s	Lff6512
	cmp.w	d2,d4
	beq.s	Lff6518
	bgt.s	Lff653c
	exg.l	d2,d4
	exg.l	d3,d5
Lff653c:
	move.w	($0940),d1
	move.w	d3,d0
	mulu.w	d1,d0
	adda.l	d0,a1
	move.w	d2,d0
	lsr.w	#4,d0
	add.w	d0,d0
	adda.w	d0,a1
	sub.w	d2,d4
	sub.w	d3,d5
	bcc.s	Lff6558
	neg.w	d5
	neg.w	d1
Lff6558:
	movea.w	d1,a0
	move.w	d2,d0
	and.w	#$000f,d0
	sub.w	#$000f,d0
	neg.w	d0
	moveq.l	#$ff,d1
	bchg.l	d0,d1
	move.w	d5,d3
	lea.l	(Lff6582,pc),a4
	cmp.w	d4,d3
	bcs.s	Lff657a
	lea.l	(Lff65b4,pc),a4
	exg.l	d3,d4
Lff657a:
	move.w	d4,d2
	lsr.w	#1,d2
	move.w	d4,d0
	jmp	(a4)

Lff6582:
	move.w	sr,-(a7)
	ori.w	#$0700,sr
Lff6588:
	move.w	d1,(a3)
	rol.b	#1,d6
	bcc.s	Lff65a8
	move.w	#$ffff,(a1)
Lff6592:
	ror.w	#1,d1
	bmi.s	Lff6598
	addq.l	#2,a1
Lff6598:
	subq.w	#1,d0
	bmi.s	Lff65ae
	add.w	d3,d2
	cmp.w	d4,d2
	bcs.s	Lff6588
	sub.w	d4,d2
	adda.l	a0,a1
	bra.s	Lff6588
Lff65a8:
	move.w	#$0000,(a1)
	bra.s	Lff6592
Lff65ae:
	clr.w	(a3)
	move.w	(a7)+,sr
	rts

Lff65b4:
	move.w	sr,-(a7)
	ori.w	#$0700,sr
Lff65ba:
	move.w	d1,(a3)
	rol.b	#1,d6
	bcc.s	Lff65da
	move.w	#$ffff,(a1)
Lff65c4:
	adda.l	a0,a1
	subq.w	#1,d0
	bmi.s	Lff65ae
	add.w	d3,d2
	cmp.w	d4,d2
	bcs.s	Lff65ba
	sub.w	d4,d2
	ror.w	#1,d1
	bmi.s	Lff65ba
	addq.l	#2,a1
	bra.s	Lff65ba
Lff65da:
	move.w	#$0000,(a1)
	bra.s	Lff65c4
Call_TXBOX:
	movem.l	d1-d7/a1-a4,-(a7)
	lea.l	($00e8002a),a2
	lea.l	($0004,a2),a3
	moveq.l	#$00,d4
	move.w	(a1)+,d4
	move.w	(a1)+,d0
	move.w	(a1)+,d1
	move.w	(a1)+,d2
	move.w	(a1)+,d3
	move.w	(a1)+,d6
	add.w	d0,d2
	add.w	d1,d3
	lea.l	($00e00000),a1
	tst.w	d4
	bmi.s	Lff662c
	btst.b	#$00,(a2)
	bne.s	Lff6638
	and.w	#$0003,d4
	add.w	d4,d4
	swap.w	d4
	adda.l	d4,a1
	move.w	#$0200,d4
Lff661e:
	move.w	(a2),d7
	move.w	d4,(a2)
	bsr.s	Lff6642
	move.w	d7,(a2)
	movem.l	(a7)+,d1-d7/a1-a4
	rts

Lff662c:
	and.w	#$000f,d4
	lsl.w	#4,d4
	or.w	#$0300,d4
	bra.s	Lff661e
Lff6638:
	move.w	(a2),d4
	or.w	#$0300,d4
	bra.s	Lff661e
Lff6640:
	rts

Lff6642:
	cmp.w	d0,d2
	beq.s	Lff6640
	bgt.s	Lff664a
	exg.l	d0,d2
Lff664a:
	cmp.w	d1,d3
	beq.s	Lff6640
	bgt.s	Lff6652
	exg.l	d1,d3
Lff6652:
	subq.w	#1,d2
	subq.w	#1,d3
	movea.l	a1,a4
	movem.w	d0-d3,-(a7)
	exg.l	d1,d3
	exg.l	d0,d1
	bsr.w	Lff6192
	movea.l	a4,a1
	movem.w	(a7),d0-d3
	exg.l	d0,d1
	bsr.w	Lff6192
	movea.l	a4,a1
	movem.w	(a7),d0-d3
	exg.l	d0,d1
	exg.l	d0,d2
	bsr.w	Lff63c4
	movea.l	a4,a1
	movem.w	(a7)+,d0-d3
	exg.l	d1,d2
	bsr.w	Lff63c4
	rts

Call_TXFILL:
	movem.l	d1-d7/a1-a4/a6,-(a7)
	lea.l	($00e8002a),a2
	lea.l	($0004,a2),a3
	moveq.l	#$00,d4
	move.w	(a1)+,d4
	move.w	(a1)+,d0
	move.w	(a1)+,d1
	move.w	(a1)+,d2
	move.w	(a1)+,d3
	move.w	(a1)+,d6
	add.w	d0,d2
	add.w	d1,d3
	lea.l	($00e00000),a1
	tst.w	d4
	bmi.s	Lff66f0
	btst.b	#$00,(a2)
	bne.s	Lff66fc
	and.w	#$0003,d4
	add.w	d4,d4
	swap.w	d4
	adda.l	d4,a1
	move.w	#$0200,d4
Lff66ca:
	move.w	(a2),-(a7)
	move.w	d4,(a2)
	move.w	d6,d4
	and.w	#$ff00,d4
	move.w	d4,d5
	lsr.w	#8,d5
	or.w	d4,d5
	move.w	d5,d4
	swap.w	d5
	move.w	d4,d5
	movea.l	d5,a6
	lea.l	(Lff6192,pc),a0
	bsr.s	Lff6706
	move.w	(a7)+,(a2)
	movem.l	(a7)+,d1-d7/a1-a4/a6
	rts

Lff66f0:
	and.w	#$000f,d4
	lsl.w	#4,d4
	or.w	#$0300,d4
	bra.s	Lff66ca
Lff66fc:
	move.w	(a2),d4
	or.w	#$0300,d4
	bra.s	Lff66ca
Lff6704:
	rts

Lff6706:
	cmp.w	d0,d2
	beq.s	Lff6704
	bgt.s	Lff670e
	exg.l	d0,d2
Lff670e:
	cmp.w	d1,d3
	beq.s	Lff6704
	bgt.s	Lff6716
	exg.l	d1,d3
Lff6716:
	subq.w	#1,d2
	subq.w	#1,d3
	movem.l	($0954),d4-d5
	cmp.w	d4,d3
	blt.s	Lff6704
	cmp.w	d5,d1
	bge.s	Lff6704
	cmp.w	d4,d1
	bge.s	Lff672e
	move.w	d4,d1
Lff672e:
	cmp.w	d5,d3
	blt.s	Lff6736
	move.w	d5,d3
	subq.w	#1,d3
Lff6736:
	move.w	d3,d7
	sub.w	d1,d7
	exg.l	d0,d1
	exg.l	d0,d3
	movea.w	($0940),a4
Lff6742:
	jsr	(a0)
	exg.l	d6,a6
	adda.l	a4,a1
	dbra.w	d7,Lff6742
	rts

Call_TXREV:
	movem.l	d1-d7/a1-a4/a6,-(a7)
	lea.l	($00e8002a),a2
	lea.l	($0004,a2),a3
	moveq.l	#$00,d4
	move.w	(a1)+,d4
	move.w	(a1)+,d0
	move.w	(a1)+,d1
	move.w	(a1)+,d2
	move.w	(a1)+,d3
	add.w	d0,d2
	add.w	d1,d3
	lea.l	($00e00000),a1
	btst.b	#$00,(a2)
	bne.s	Lff679a
	and.w	#$0003,d4
	add.w	d4,d4
	swap.w	d4
	adda.l	d4,a1
	move.w	#$0200,d4
Lff6786:
	move.w	(a2),-(a7)
	move.w	d4,(a2)
	lea.l	(Lff618c,pc),a0
	bsr.w	Lff6706
	move.w	(a7)+,(a2)
	movem.l	(a7)+,d1-d7/a1-a4/a6
	rts

Lff679a:
	move.w	(a2),d4
	or.w	#$0300,d4
	bra.s	Lff6786
Lff67a2:
	movem.l	d0/a0-a1,-(a7)
	lea.l	($0010,a7),a1
	bsr.w	Call_TXBOX
	movem.l	(a7)+,d0/a0-a1
	rts

Lff67b4:
	movem.l	d0/a0-a1,-(a7)
	lea.l	($0010,a7),a1
	bsr.s	Call_TXREV
	movem.l	(a7)+,d0/a0-a1
	rts

Lff67c4:
	movem.l	d0/a0-a1,-(a7)
	lea.l	($0010,a7),a1
	bsr.w	Call_TXFILL
	movem.l	(a7)+,d0/a0-a1
	rts

Lff67d6:
	bsr.s	Lff67ea
	swap.w	d0
	beq.s	Lff67d6
	clr.w	d0
	move.l	a0,($0818)
	subq.w	#1,($0812)
	swap.w	d0
	rts

Lff67ea:
	clr.l	d0
	tst.w	($0812)
	beq.s	Lff680c
	movea.l	($0818),a0
	addq.l	#2,a0
	cmpa.l	#$0000089c,a0
	bcs.s	Lff6806
	movea.l	#$0000081c,a0
Lff6806:
	moveq.l	#$01,d0
	swap.w	d0
	move.w	(a0),d0
Lff680c:
	rts

Lff680e:
	movem.l	d0-d1/a0,-(a7)
	move.w	($0812),d1
	beq.s	Lff6840
	movea.l	($0818),a0
Lff681c:
	addq.l	#2,a0
	cmpa.l	#$0000089c,a0
	bcs.s	Lff682c
	movea.l	#$0000081c,a0
Lff682c:
	move.w	(a0),d0
	and.w	#$7fff,d0
	cmp.w	#$6d00,d0
	bne.s	Lff683c
	move.w	#$0000,(a0)
Lff683c:
	subq.w	#1,d1
	bne.s	Lff681c
Lff6840:
	movem.l	(a7)+,d0-d1/a0
	rts

Call_SFTSNS:
	clr.l	d0
	move.w	($0810),d0
	rts

Call_KEY_INIT:
	move.l	d1,-(a7)
	ori.w	#$0700,sr
	lea.l	($0800),a0
	move.w	#$000f,d0
Lff685c:
	clr.b	(a0)+
	dbra.w	d0,Lff685c
	lea.l	($081c),a0
	move.l	a0,($0814)
	move.l	a0,($0818)
	clr.w	($0812)
	move.b	#$08,($00e8e007)
	move.l	(a7),d1
	move.b	d1,($0810)
	clr.w	d0
	move.b	d1,d0
	asl.w	#2,d0
	move.b	d0,($080b)
	lsr.w	#8,d0
	and.w	#$0001,d0
	move.b	d0,($080c)
	move.b	d1,d0
	asl.b	#4,d0
	move.b	d0,($0811)
	bsr.w	Lff20e8
	move.b	#$41,d1
	bsr.w	Lff694c
	move.b	#$49,d1
	bsr.w	Lff694c
	move.b	#$59,d1
	bsr.w	Lff694c
	move.b	#$51,d1
	bsr.w	Lff694c
	move.b	($00ed0027),d1
	and.b	#$01,d1
	or.b	#$5c,d1
	bsr.s	Lff694c
	move.b	($00ed003a),d1
	and.w	#$000f,d1
	or.w	#$0060,d1
	bsr.s	Lff694c
	move.b	($00ed003b),d1
	and.w	#$000f,d1
	or.w	#$0070,d1
	bsr.s	Lff694c
	andi.w	#$f8ff,sr
	move.l	(a7)+,d1
	rts

Call_BITSNS:
	clr.l	d0
	lea.l	($0800),a0
	move.b	(a0,d1.w),d0
	rts

Call_SKEYSET:
	move.l	d1,d0
	bra.w	Lff20fa
Call_LEDCTRL:
	move.l	d1,-(a7)
	eori.b	#$ff,d1
	or.b	#$80,d1
	bsr.s	Lff694c
	move.l	(a7)+,d1
	rts

Call_LEDSET:
	bra.w	Lff20e8
Call_KEYDLY:
	move.l	d1,-(a7)
	and.b	#$0f,d1
	or.b	#$60,d1
	bsr.s	Lff694c
	move.l	(a7)+,d1
	rts

Call_KEYREP:
	move.l	d1,-(a7)
	and.b	#$0f,d1
	or.b	#$70,d1
	bsr.s	Lff694c
	move.l	(a7)+,d1
	rts

Call_TV_Control_OPT2:
	move.l	d1,-(a7)
	move.b	d0,d1
	add.b	#$52,d1
	bsr.s	Lff694c
	move.l	(a7)+,d1
	rts

Lff694c:
	move.b	($00e8802d),d0
	btst.l	#$07,d0
	beq.s	Lff694c
	move.b	d1,($00e8802f)
	rts

Call_TVCTRL:
	btst.l	#$05,d1
	beq.s	Lff696e
	move.w	d1,-(a7)
	moveq.l	#$07,d1
	bsr.s	Lff696e
	move.w	(a7)+,d1
Lff696e:
	and.w	#$001f,d1
	movem.l	d1-d6/a0-a2,-(a7)
	lea.l	($00e8e003),a0
	tst.w	d1
	beq.s	Lff69bc
	cmpi.w	#$0007,d1
	beq.s	Lff69c2
	cmpi.w	#$000d,d1
	beq.s	Lff69d0
	cmpi.w	#$001b,d1
	ble.s	Lff69ba
	move.w	d1,d6
	move.w	#$0005,d1
	bsr.s	Lff69dc
	cmpi.w	#$001c,d6
	beq.s	Lff69bc
	move.w	#$0008,d1
	cmpi.w	#$001d,d6
	beq.s	Lff69ba
	move.w	#$000f,d1
	bsr.s	Lff69dc
	move.w	#$000a,d1
	cmpi.w	#$001e,d6
	beq.s	Lff69bc
Lff69ba:
	bsr.s	Lff69dc
Lff69bc:
	movem.l	(a7)+,d1-d6/a0-a2
	rts

Lff69c2:
	btst.b	#$03,($00e8e003)
	beq.s	Lff69bc
Lff69cc:
	moveq.l	#$0e,d1
	bra.s	Lff69ba
Lff69d0:
	btst.b	#$03,($00e8e003)
	bne.s	Lff69bc
	bra.s	Lff69cc
Lff69dc:
	lea.l	(Lff0d12,pc),a2
	lea.l	($00e88023),a1
	move.w	sr,-(a7)
	ori.w	#$0700,sr
	lsl.w	#3,d1
	move.w	d1,d2
	eori.w	#$0ff8,d2
	swap.w	d2
	move.w	d1,d2
	move.b	(a1),d0
	move.b	(a1),d0
Lff69fc:
	cmp.b	(a1),d0
	beq.s	Lff69fc
	bsr.s	Lff6a0a
	swap.w	d2
	bsr.s	Lff6a0a
	move.w	(a7)+,sr
	rts

Lff6a0a:
	moveq.l	#$0c,d3
	moveq.l	#$30,d4
Lff6a0e:
	moveq.l	#$05,d0
	move.b	#$08,(a0)
	jsr	(a2)
	clr.b	(a0)
	subq.w	#1,d4
	moveq.l	#$0f,d0
	lsr.w	#1,d2
	bcc.s	Lff6a28
	subq.w	#1,d4
	add.l	#$00000014,d0
Lff6a28:
	jsr	(a2)
	dbra.w	d3,Lff6a0e
	mulu.w	#$0014,d4
	move.l	d4,d0
	jsr	(a2)
	rts

Call_LEDMOD:
	moveq.l	#$ff,d0
	cmp.w	#$0007,d1
	bcc.s	Lff6aa8
	movem.l	d1/d3/a0,-(a7)
	lea.l	($0810),a0
	move.w	(a0),d0
	ror.w	#8,d0
	move.w	d1,d3
	add.w	#$000c,d3
	tst.b	d2
	beq.s	Lff6a7e
	bset.l	d3,d0
	bset.l	d1,d0
	cmp.b	#$02,d1
	bcc.s	Lff6a74
	eori.b	#$01,d3
	eori.b	#$01,d1
	bclr.l	d3,d0
	bclr.l	d1,d0
	eori.b	#$01,d3
	eori.b	#$01,d1
Lff6a74:
	btst.b	d1,(a0)
	bne.s	Lff6a8a
	add.w	#$005a,d1
	bra.s	Lff6a8a
Lff6a7e:
	bclr.l	d3,d0
	bclr.l	d1,d0
	btst.b	d1,(a0)
	beq.s	Lff6a8a
	add.w	#$005a,d1
Lff6a8a:
	move.w	(a0),-(a7)
	rol.w	#8,d0
	move.w	d0,(a0)
	move.w	d1,d0
	move.w	(a7)+,d1
	cmp.w	#$005a,d0
	bcs.s	Lff6a9e
	bsr.w	Lff4aa0
Lff6a9e:
	bsr.w	Lff20e8
	movem.l	(a7)+,d1/d3/a0
	clr.l	d0
Lff6aa8:
	rts

Call_TGUSEMD:
	lea.l	($09dc),a0
	tst.b	d1
	beq.s	Lff6ac8
	cmp.b	#$01,d1
	bne.s	Lff6ad6
	addq.l	#1,a0
	cmp.b	#$02,d2
	bne.s	Lff6ac8
	bsr.w	Lff4e6c
	bsr.w	Lff494a
Lff6ac8:
	clr.l	d0
	move.b	(a0),d0
	cmp.b	#-$01,d2
	beq.s	Lff6ad4
	move.b	d2,(a0)
Lff6ad4:
	rts

Lff6ad6:
	moveq.l	#$ff,d0
	rts

Call_DEFCHR:
	moveq.l	#$ff,d0
	movem.l	d1-d2/a1,-(a7)
	move.l	d1,d2
	swap.w	d2
	bne.s	Lff6aea
	move.w	#$0008,d2
Lff6aea:
	cmp.w	#$0006,d2
	beq.s	Lff6b12
	movea.l	($0458),a0
	jsr	(a0)
	movea.l	d0,a0
	moveq.l	#$ff,d0
	cmpa.l	#$00f00000,a0
	bcc.s	Lff6b12
	addq.w	#1,d2
	addq.w	#1,d1
	mulu.w	d1,d2
	subq.w	#1,d2
Lff6b0a:
	move.b	(a1)+,(a0)+
	dbra.w	d2,Lff6b0a
	clr.l	d0
Lff6b12:
	movem.l	(a7)+,d1-d2/a1
	rts

Lff6b18:
	movem.l	d1-d3/a1-a2,-(a7)
	cmp.b	#$1c,d1
	bcc.w	Lff6c46
	cmp.b	#$18,d1
	bcc.s	Lff6b3c
	subq.b	#4,d1
	bsr.s	Lff6ba0
	bsr.w	Lffb408
	move.b	#$02,($093d)
	moveq.l	#$01,d0
	bra.s	Lff6b4c
Lff6b3c:
	subq.b	#8,d1
	bsr.s	Lff6ba0
	bsr.w	Lffb41e
	move.b	#$01,($093d)
	moveq.l	#$03,d0
Lff6b4c:
	move.b	d0,($00e80028)
	move.w	d0,($00e82400)
	move.l	#$00000400,($0960)
	move.w	#$01ff,($096c)
	move.w	#$01a7,d0
	cmp.b	#$11,d1
	beq.s	Lff6b7c
	move.w	#$01df,d0
	cmp.b	#$13,d1
	bne.w	Lff6c46
Lff6b7c:
	move.w	d0,($096e)
	bra.w	Lff6c46
Lff6b84:
	moveq.l	#$00,d0
	move.b	($093c),d0
	rts

Call_CRTMOD:
	lea.l	($00e80028),a0
	cmp.w	#$ffff,d1
	beq.s	Lff6b84
	cmp.b	#$14,d1
	bcc.w	Lff6b18
Lff6ba0:
	movem.l	d1-d3/a1-a2,-(a7)
	cmp.w	#$0100,d1
	bcc.w	Lff6c4c
	cmp.w	#$0014,d1
	bcc.w	Lff6c46
	move.b	d1,($093c)
	move.w	#$0000,($00e82600)
	bsr.w	Call_B_CUROFF
	move.w	#$0133,($00e8002a)
	lea.l	($00e00000),a0
	lea.l	($00e20000),a1
	bsr.w	Lffb43a
	move.w	#$0033,($00e8002a)
	bsr.w	Lff6c7e
	move.w	#$0000,($00e80480)
	bsr.w	Lff6d70
	bsr.w	Call_B_CURON
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
	move.w	#$0020,($00e82600)
	move.w	#$06e4,($00e82500)
Lff6c46:
	movem.l	(a7)+,d1-d3/a1-a2
	rts

Lff6c4c:
	and.w	#$00ff,d1
	cmp.w	#$0014,d1
	bcc.s	Lff6c46
	move.b	d1,($093c)
	move.w	($00e82600),-(a7)
	move.w	#$0000,($00e82600)
	bsr.s	Lff6c7e
	move.w	(a7),d0
	and.w	#$001f,d0
	beq.s	Lff6c76
	bsr.w	Lffb38a
Lff6c76:
	move.w	(a7)+,($00e82600)
	bra.s	Lff6c46
Lff6c7e:
	lsl.w	#5,d1
	lea.l	(Lff6dca,pc),a0
	lea.l	(a0,d1.w),a0
	lea.l	($0014,a0),a2
	clr.w	($0964)
	move.w	(a0)+,d0
	move.w	(a0)+,d3
	move.w	d0,d2
	and.w	#$001f,d0
	lea.l	($00e80000),a1
	move.w	($0028,a1),d1
	and.w	#$001f,d1
	rol.b	#4,d1
	cmp.b	#$71,d1
	bne.s	Lff6cb4
	move.w	#$0060,d1
Lff6cb4:
	rol.b	#4,d0
	cmp.b	#$71,d0
	bne.s	Lff6cc0
	move.w	#$0060,d0
Lff6cc0:
	cmp.w	d1,d0
	bcc.s	Lff6cd0
	move.w	d2,($0028,a1)
	bsr.w	Lff6d98
	move.w	d3,(a1)
	bra.s	Lff6cda
Lff6cd0:
	move.w	d3,(a1)
	bsr.w	Lff6d98
	move.w	d2,($0028,a1)
Lff6cda:
	move.w	d2,d3
	ror.w	#8,d3
	andi.w	#$0007,d3
	move.w	d3,($00e82400)
	lea.l	($00eb080a),a1
	clr.w	d0
	move.b	($0001,a2),d0
	move.w	d0,($0002,a1)
	bsr.w	Lff6dc0
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
	clr.w	($0968)
	clr.w	($096a)
	move.w	(a2)+,d0
	move.l	d0,d1
	asl.l	#1,d0
	move.l	d0,($0960)
	move.w	(a2)+,d0
	move.w	d0,($096c)
	subq.w	#1,($096c)
	lsr.w	#3,d0
	subq.w	#1,d0
	move.w	d0,($0970)
	move.w	(a2)+,d0
	move.w	d0,($096e)
	subq.w	#1,($096e)
	lsr.w	#4,d0
	subq.w	#1,d0
	move.w	d0,($0972)
	clr.l	($0948)
	clr.w	($0974)
	clr.w	($0976)
	move.w	(a2)+,d0
	move.b	d0,($093d)
	move.l	#$00e00000,($0944)
	move.w	($096c),d2
	swap.w	d2
	move.w	($096e),d2
	clr.l	d1
	bra.w	Call_MS_LIMIT
Lff6d70:
	move.w	($00e80028),d0
	and.w	#$0003,d0
	add.w	d0,d0
	lea.l	(Lff6d90,pc),a0
	adda.w	(Lff6d90,pc,d0.w),a0
	jsr	(a0)
	bset.b	#$03,($00e80028)
	rts

Lff6d90:
	.dc.w	$4664,$4678,$468e,$468e
Lff6d98:
	move.l	a1,-(a7)
	move.w	#$0007,d1
	addq.l	#2,a1
Lff6da0:
	move.w	(a0)+,(a1)+
	dbra.w	d1,Lff6da0
	move.w	#$000a,d1
Lff6daa:
	clr.w	(a1)+
	dbra.w	d1,Lff6daa
	addq.l	#2,a1
	move.w	#$0033,(a1)+
	clr.w	(a1)+
	clr.w	(a1)+
	clr.w	(a1)+
	movea.l	(a7)+,a1
	rts

Lff6dc0:
	move.w	#$0826,d0
Lff6dc4:
	dbra.w	d0,Lff6dc4
	rts

Lff6dca:
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
	.dc.b	$03,$17,$00,$63,$00,$0b,$00,$0d
	.dc.b	$00,$5d,$02,$0c,$00,$01,$00,$21
	.dc.b	$02,$01,$00,$1b,$ff,$ff,$ff,$ff
	.dc.b	$04,$00,$02,$80,$01,$e0,$00,$01
Call_CONTRAST:
	move.b	($00e8e001),d0
	and.l	#$0000000f,d0
	cmp.b	#-$01,d1
	beq.s	$00ff7068
	cmp.b	#-$02,d1
	beq.s	Lff706a
	move.b	d1,($00e8e001)
	rts

Lff706a:
	move.b	($00ed0028),($00e8e001)
	rts

Call_HSVTORGB:
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
	bne.s	Lff70aa
	move.w	d1,d0
	rol.w	#5,d0
	or.b	d1,d0
	rol.w	#5,d0
	or.b	d1,d0
	bra.w	Lff714e
Lff70aa:
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
	bcc.s	Lff70fc
	move.w	d5,d0
	rol.w	#5,d0
	or.b	d1,d0
	rol.w	#5,d0
	or.b	d7,d0
	bra.s	Lff714e
Lff70fc:
	subq.w	#1,d4
	bcc.s	Lff710c
	move.w	d1,d0
	rol.w	#5,d0
	or.b	d6,d0
	rol.w	#5,d0
	or.b	d7,d0
	bra.s	Lff714e
Lff710c:
	subq.w	#1,d4
	bcc.s	Lff711c
	move.w	d1,d0
	rol.w	#5,d0
	or.b	d7,d0
	rol.w	#5,d0
	or.b	d5,d0
	bra.s	Lff714e
Lff711c:
	subq.w	#1,d4
	bcc.s	Lff712c
	move.w	d6,d0
	rol.w	#5,d0
	or.b	d7,d0
	rol.w	#5,d0
	or.b	d1,d0
	bra.s	Lff714e
Lff712c:
	subq.w	#1,d4
	bcc.s	Lff713c
	move.w	d7,d0
	rol.w	#5,d0
	or.b	d5,d0
	rol.w	#5,d0
	or.b	d1,d0
	bra.s	Lff714e
Lff713c:
	subq.w	#1,d4
	bcc.s	Lff714c
	move.w	d7,d0
	rol.w	#5,d0
	or.b	d1,d0
	rol.w	#5,d0
	or.b	d6,d0
	bra.s	Lff714e
Lff714c:
	moveq.l	#$ff,d0
Lff714e:
	rol.w	#1,d0
	movem.l	(a7)+,d1-d7
	rts

Call_TPALET:
	cmp.l	#$ffffffff,d2
	beq.s	Lff71d8
	cmp.l	#$fffffffe,d2
	bne.s	Lff718c
	clr.l	d0
	move.b	d1,d0
	cmp.b	#$04,d1
	bcs.s	Lff717a
	moveq.l	#$04,d0
	cmp.b	#$08,d1
	bcs.s	Lff717a
	moveq.l	#$05,d0
Lff717a:
	lea.l	($00ed002e),a0
	adda.l	d0,a0
	adda.l	d0,a0
	move.w	(a0),d2
	bsr.s	Lff718c
	moveq.l	#$fe,d2
	rts

Lff718c:
	moveq.l	#$08,d0
	cmp.b	d0,d1
	bcc.s	Lff719a
	cmp.b	#$04,d1
	bcs.s	Call_TPALET2
	moveq.l	#$04,d0
Lff719a:
	movem.l	d1/d3,-(a7)
	move.w	d0,d3
	move.w	d0,d1
	subq.w	#1,d3
Lff71a4:
	bsr.s	Lff71ba
	addq.w	#1,d1
	dbra.w	d3,Lff71a4
	movem.l	(a7)+,d1/d3
	rts

Call_TPALET2:
	cmp.l	#$ffffffff,d2
	beq.s	Lff71d8
Lff71ba:
	clr.l	d0
	move.b	d1,d0
	cmp.b	#$0f,d0
	bhi.s	Lff71d4
	add.w	d0,d0
	lea.l	($00e82200),a0
	adda.l	d0,a0
	move.w	d2,(a0)
	clr.l	d0
	rts

Lff71d4:
	moveq.l	#$ff,d0
	rts

Lff71d8:
	clr.l	d0
	move.b	d1,d0
	cmp.b	#$0f,d0
	bhi.s	Lff71d4
	add.w	d0,d0
	lea.l	($00e82200),a0
	bsr.s	Lff71f2
	move.w	(a0,d0.w),d0
	rts

Lff71f2:
	btst.b	#$04,($00e88001)
	bne.s	Lff71f2
	rts

Call_TCOLOR:
	and.w	#$000f,d1
	move.w	d1,($0942)
	move.l	#$000000e0,d0
	btst.l	#$00,d1
	bne.s	Lff722c
	addq.w	#2,d0
	btst.l	#$01,d1
	bne.s	Lff722c
	addq.w	#2,d0
	btst.l	#$02,d1
	bne.s	Lff722c
	addq.w	#2,d0
	btst.l	#$03,d1
	bne.s	Lff722c
	subq.w	#6,d0
Lff722c:
	swap.w	d0
	move.l	d0,($0944)
	rts

Call_FNTADR:
	cmp.b	#$08,d2
	bne.s	Lff723c
	moveq.l	#$00,d2
Lff723c:
	cmp.w	#$2121,d1
	bcs.w	Lff73bc
	cmpi.w	#$f000,d1
	bcc.w	Lff7424
	cmpi.w	#$8140,d1
	bcc.s	Lff7276
	cmp.w	#$7e7f,d1
	bcc.w	Lff73ac
	moveq.l	#$00,d0
	move.b	d1,d0
	lsr.w	#8,d1
	sub.w	#$0021,d1
	cmp.w	#$007f,d0
	bcc.s	Lff7270
	sub.w	#$0021,d0
	bcc.s	Lff72b4
Lff7270:
	moveq.l	#$07,d0
	moveq.l	#$01,d1
	bra.s	Lff72b4
Lff7276:
	moveq.l	#$00,d0
	move.b	d1,d0
	lsr.w	#8,d1
	cmp.w	#$009f,d1
	bls.s	Lff728c
	cmp.w	#$00e0,d1
	bcs.s	Lff7270
	add.w	#$ffc0,d1
Lff728c:
	sub.w	#$0081,d1
	sub.w	#$0040,d0
	bcs.s	Lff7270
	cmp.w	#$003f,d0
	beq.s	Lff7270
	bcs.s	Lff72a6
	cmp.w	#$00bd,d0
	bcc.s	Lff7270
	subq.w	#1,d0
Lff72a6:
	add.w	d1,d1
	cmp.w	#$005e,d0
	bcs.s	Lff72b4
	addq.w	#1,d1
	sub.w	#$005e,d0
Lff72b4:
	cmp.w	#$000f,d1
	bcs.s	Lff730a
	cmp.w	#$0055,d1
	bcc.s	Lff731c
	subq.w	#7,d1
Lff72c2:
	mulu.w	#$005e,d1
	add.l	d0,d1
	move.l	#$00f00000,d0
	tst.b	d2
	bne.s	Lff72e0
Lff72d2:
	lsl.l	#5,d1
	add.l	d1,d0
	move.l	#$00100001,d1
	moveq.l	#$0f,d2
	rts

Lff72e0:
	move.l	#$00f40000,d0
Lff72e6:
	mulu.w	#$0048,d1
	add.l	d1,d0
	cmp.b	#$06,d2
	beq.s	Lff72fc
	move.l	#$00180002,d1
	moveq.l	#$17,d2
	rts

Lff72fc:
	bsr.w	Lff74b0
	move.l	#$000c0001,d1
	moveq.l	#$0b,d2
	rts

Lff730a:
	lea.l	(Lff7356,pc),a0
	tst.b	(a0,d1.w)
	beq.s	Lff72c2
	bpl.s	Lff733e
	moveq.l	#$00,d0
	moveq.l	#$00,d1
	bra.s	Lff72b4
Lff731c:
	sub.w	#$0055,d1
	beq.s	Lff732a
	cmp.w	#$0001,d1
	bhi.w	Lff7270
Lff732a:
	mulu.w	#$005e,d1
	add.l	d0,d1
	move.l	($099e),d0
	tst.b	d2
	beq.s	Lff72d2
	move.l	($09aa),d0
	bra.s	Lff72e6
Lff733e:
	sub.w	#$000b,d1
	mulu.w	#$005e,d1
	add.l	d0,d1
	move.l	($099a),d0
	tst.b	d2
	beq.s	Lff72d2
	move.l	($09a6),d0
	bra.s	Lff72e6
Lff7356:
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$ff,$ff,$ff,$01,$01,$ff,$ff,$00
Lff7366:
	and.l	#$000000ff,d1
	cmp.w	#$005c,d1
	bcc.s	Lff7374
Lff7372:
	rts

Lff7374:
	lea.l	($00ed0059),a0
	beq.s	Lff7394
	cmp.w	#$007e,d1
	beq.s	Lff73a0
	cmp.w	#$007c,d1
	bne.s	Lff7372
	btst.b	#$02,(a0)
	beq.s	Lff7372
	move.w	#$0082,d1
	bra.s	Lff7372
Lff7394:
	btst.b	#$00,(a0)
	beq.s	Lff7372
	move.w	#$0080,d1
	bra.s	Lff7372
Lff73a0:
	btst.b	#$01,(a0)
	beq.s	Lff7372
	move.w	#$0081,d1
	bra.s	Lff7372
Lff73ac:
	cmp.w	#$80a6,d1
	bcs.s	Lff73bc
	cmp.w	#$80de,d1
	bcc.s	Lff73bc
	eori.b	#$20,d1
Lff73bc:
	bsr.s	Lff7366
	cmp.b	#$06,d2
	bcs.s	Lff73e4
	beq.s	Lff73f6
	move.l	#$00f3d000,d0
Lff73cc:
	lsl.l	#4,d1
	add.l	d1,d0
	add.l	d1,d0
	add.l	d1,d0
Lff73d4:
	cmp.b	#$06,d2
	beq.s	Lff740c
	move.l	#$000c0001,d1
	moveq.l	#$17,d2
	rts

Lff73e4:
	move.l	#$00f3a800,d0
Lff73ea:
	lsl.l	#4,d1
	add.l	d1,d0
Lff73ee:
	moveq.l	#$08,d1
	swap.w	d1
	moveq.l	#$0f,d2
	rts

Lff73f6:
	move.l	#$00fbf400,d0
	lsl.l	#2,d1
	add.l	d1,d0
	add.l	d1,d0
	add.l	d1,d0
Lff7404:
	moveq.l	#$06,d1
	swap.w	d1
	moveq.l	#$0b,d2
	rts

Lff740c:
	bsr.w	Lff74fe
	bra.s	Lff7404
Lff7412:
	and.w	#$01ff,d1
	move.l	($09a2),d0
	tst.b	d2
	beq.s	Lff73ea
	move.l	($09ae),d0
	bra.s	Lff73cc
Lff7424:
	and.l	#$0000ffff,d1
	cmp.w	#$f400,d1
	bcc.s	Lff7412
	movem.l	d3/a1,-(a7)
	lea.l	($0c46),a0
	movea.l	a0,a1
	moveq.l	#$00,d3
	move.w	#$0011,d0
Lff7440:
	move.l	d3,(a0)+
	dbra.w	d0,Lff7440
	btst.l	#$09,d1
	beq.s	Lff7456
	addq.l	#8,a1
	tst.b	d2
	beq.s	Lff7456
	adda.w	#$0010,a1
Lff7456:
	btst.l	#$08,d1
	beq.s	Lff746c
	cmp.b	#$a6,d1
	bcs.s	Lff746c
	cmp.b	#$de,d1
	bcc.s	Lff746c
	eori.w	#$0020,d1
Lff746c:
	bsr.w	Lff7366
	pea.l	($0c46)
	tst.b	d2
	bne.s	Lff7488
	pea.l	(Lff73ee,pc)
	movea.l	#$00f3a000,a0
	lsl.l	#3,d1
	adda.l	d1,a0
	bra.s	Lff74a2
Lff7488:
	pea.l	(Lff73d4,pc)
	movea.l	#$00f3b800,a0
	lsl.l	#3,d1
	adda.l	d1,a0
	adda.l	d1,a0
	adda.l	d1,a0
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
Lff74a2:
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	movea.l	(a7)+,a0
	move.l	(a7)+,d0
	movem.l	(a7)+,d3/a1
	jmp	(a0)

Lff74b0:
	movem.l	d3-d4/a1,-(a7)
	movea.l	d0,a0
	lea.l	($0c46),a1
	move.l	a1,d0
	move.w	#$000b,d1
Lff74c0:
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	swap.w	d2
	move.b	(a0)+,d2
	lsl.w	#8,d2
	move.b	(a0)+,d2
	moveq.l	#$00,d3
	move.b	(a0)+,d3
	swap.w	d3
	move.b	(a0)+,d3
	lsl.w	#8,d3
	move.b	(a0)+,d3
	or.l	d3,d2
	moveq.l	#$ff,d3
	lsl.l	#7,d2
	move.w	#$000b,d4
Lff74e2:
	rol.w	#1,d3
	asl.l	#2,d2
	bcs.s	Lff74ec
	bmi.s	Lff74ec
	subq.w	#1,d3
Lff74ec:
	dbra.w	d4,Lff74e2
	lsl.w	#4,d3
	move.w	d3,(a1)+
	dbra.w	d1,Lff74c0
	movem.l	(a7)+,d3-d4/a1
	rts

Lff74fe:
	movem.l	d3-d4/a1,-(a7)
	movea.l	d0,a0
	lea.l	($0c46),a1
	move.l	a1,d0
	move.w	#$000b,d1
Lff750e:
	move.b	(a0)+,d2
	lsl.w	#8,d2
	move.b	(a0)+,d2
	move.b	(a0)+,d3
	lsl.w	#8,d3
	move.b	(a0)+,d3
	or.w	d3,d2
	moveq.l	#$ff,d3
	lsr.w	#1,d2
	moveq.l	#$05,d4
Lff7522:
	rol.b	#1,d3
	asl.w	#2,d2
	bcs.s	Lff752c
	bmi.s	Lff752c
	subq.b	#1,d3
Lff752c:
	dbra.w	d4,Lff7522
	lsl.b	#2,d3
	move.b	d3,(a1)+
	dbra.w	d1,Lff750e
	movem.l	(a7)+,d3-d4/a1
	rts

Call_VRAMGET:
	move.w	d1,d0
Lff7540:
	move.b	(a2)+,(a1)+
	dbra.w	d0,Lff7540
	adda.l	d3,a2
	dbra.w	d2,Call_VRAMGET
	rts

Call_VRAMPUT:
	move.w	d1,d0
Lff7550:
	move.b	(a1)+,(a2)+
	dbra.w	d0,Lff7550
	adda.l	d3,a2
	dbra.w	d2,Call_VRAMPUT
	rts

Lff755e:
	movec.l	vbr,a0
	movea.l	($0458,a0),a0
	bra.s	Lff756e
Lff7568:
	bra.s	Lff755e
Call_FNTGET:
	movea.l	($0458),a0
Lff756e:
	movem.l	d1-d2/a1,-(a7)
	move.l	d1,d2
	swap.w	d2
	jsr	(a0)
	movea.l	d0,a0
	swap.w	d1
	move.w	d1,(a1)+
	addq.w	#1,d2
	move.w	d2,(a1)+
	swap.w	d1
	addq.w	#1,d1
	mulu.w	d1,d2
	lsr.w	#2,d2
	subq.w	#1,d2
Lff758c:
	move.l	(a0)+,(a1)+
	dbra.w	d2,Lff758c
	movem.l	(a7)+,d1-d2/a1
	rts

Call_TEXTGET:
	movem.l	d1-d7/a1-a2,-(a7)
	move.w	d1,d0
	move.w	d2,d1
	move.w	(a1)+,d2
	move.w	(a1)+,d3
	move.l	($093e),d7
	subq.w	#1,d2
	subq.w	#1,d3
	move.w	d0,d4
	lsr.w	#3,d0
	mulu.w	d7,d1
	and.l	#$0000ffff,d0
	add.l	d0,d1
	movea.l	($0944),a2
	adda.l	d1,a2
	and.w	#$0007,d4
	bne.s	Lff75fe
	move.w	d2,d5
	and.w	#$0007,d5
	move.w	#$ff80,d6
	ror.w	d5,d6
	lsr.w	#3,d2
	beq.s	Lff75f0
	sub.w	d2,d7
	subq.w	#1,d2
Lff75da:
	move.w	d2,d4
Lff75dc:
	move.b	(a2)+,(a1)+
	dbra.w	d4,Lff75dc
	move.b	(a2),d0
	and.b	d6,d0
	move.b	d0,(a1)+
	adda.l	d7,a2
	dbra.w	d3,Lff75da
	bra.s	Lff7654
Lff75f0:
	move.b	(a2),d0
	and.b	d6,d0
	move.b	d0,(a1)+
	adda.l	d7,a2
	dbra.w	d3,Lff75f0
	bra.s	Lff7654
Lff75fe:
	move.w	#$0008,d1
	sub.w	d4,d1
	move.w	d1,d5
	addq.w	#8,d1
	move.w	d2,d4
	and.w	#$0007,d4
	move.w	#$ff80,d6
	ror.w	d4,d6
	lsr.w	#3,d2
	beq.s	Lff7640
	sub.w	d2,d7
	subq.w	#1,d7
	subq.w	#1,d2
Lff761e:
	move.b	(a2)+,d0
	rol.w	#8,d0
	move.w	d2,d4
Lff7624:
	move.b	(a2)+,d0
	ror.w	d5,d0
	move.b	d0,(a1)+
	rol.w	d1,d0
	dbra.w	d4,Lff7624
	move.b	(a2),d0
	ror.w	d5,d0
	and.b	d6,d0
	move.b	d0,(a1)+
	adda.l	d7,a2
	dbra.w	d3,Lff761e
	bra.s	Lff7654
Lff7640:
	move.b	(a2),d0
	rol.w	#8,d0
	move.b	($0001,a2),d0
	ror.w	d5,d0
	and.b	d6,d0
	move.b	d0,(a1)+
	adda.l	d7,a2
	dbra.w	d3,Lff7640
Lff7654:
	movem.l	(a7)+,d1-d7/a1-a2
	rts

Call_TEXTPUT:
	movem.l	d1-d7/a1-a3,-(a7)
	move.w	d1,d0
	move.w	d2,d1
	move.w	(a1)+,d2
	move.w	(a1)+,d3
	move.l	($093e),d7
	subq.w	#1,d2
	subq.w	#1,d3
	move.w	d0,d4
	lsr.w	#3,d0
	mulu.w	d7,d1
	and.l	#$0000ffff,d0
	add.l	d0,d1
	movea.l	($0944),a2
	adda.l	d1,a2
	and.w	#$0007,d4
	bne.s	Lff76c4
	move.w	d2,d5
	and.w	#$0007,d5
	move.w	#$007f,d6
	ror.w	d5,d6
	lsr.w	#3,d2
	beq.s	Lff76b4
	sub.w	d2,d7
	subq.w	#1,d2
Lff769c:
	move.w	d2,d4
Lff769e:
	move.b	(a1)+,(a2)+
	dbra.w	d4,Lff769e
	move.b	(a2),d0
	and.b	d6,d0
	or.b	(a1)+,d0
	move.b	d0,(a2)
	adda.l	d7,a2
	dbra.w	d3,Lff769c
	bra.s	Lff772c
Lff76b4:
	move.b	(a2),d0
	and.b	d6,d0
	or.b	(a1)+,d0
	move.b	d0,(a2)
	adda.l	d7,a2
	dbra.w	d3,Lff76b4
	bra.s	Lff772c
Lff76c4:
	move.w	#$0008,d1
	sub.w	d4,d1
	move.w	d1,d5
	addq.w	#8,d1
	move.w	d2,d4
	and.w	#$0007,d4
	move.w	#$007f,d6
	ror.w	d4,d6
	lsr.w	#3,d2
	beq.s	Lff7712
	sub.w	d2,d7
	subq.w	#1,d7
	subq.w	#1,d2
Lff76e4:
	movea.l	a2,a3
	move.b	(a2)+,d0
	rol.w	#8,d0
	move.w	d2,d4
Lff76ec:
	move.b	(a2)+,d0
	ror.w	d5,d0
	move.b	(a1)+,d0
	rol.w	d1,d0
	move.b	d0,(a3)+
	dbra.w	d4,Lff76ec
	move.b	(a2),d0
	ror.w	d5,d0
	and.b	d6,d0
	or.b	(a1)+,d0
	rol.w	d1,d0
	move.b	d0,(a3)+
	ror.w	#8,d0
	move.b	d0,(a3)+
	adda.l	d7,a2
	dbra.w	d3,Lff76e4
	bra.s	Lff772c
Lff7712:
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
	dbra.w	d3,Lff7712
Lff772c:
	movem.l	(a7)+,d1-d7/a1-a3
	rts

Call_CLIPPUT:
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
	bge.w	Lff798e
	move.w	d0,d4
	add.w	(a2),d4
	cmp.w	(-$0010,a6),d4
	ble.w	Lff798e
	cmp.w	(-$000a,a6),d1
	bge.w	Lff798e
	move.w	d1,d4
	add.w	($0002,a2),d4
	cmp.w	(-$000e,a6),d4
	ble.w	Lff798e
	cmp.w	(-$000e,a6),d1
	bge.s	Lff77ac
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
Lff77ac:
	move.w	d1,d4
	add.w	d2,d4
	cmp.w	(-$000a,a6),d4
	ble.s	Lff77bc
	move.w	(-$000a,a6),d2
	sub.w	d1,d2
Lff77bc:
	mulu.w	($0940),d1
	movea.l	d1,a0
	move.w	d0,d1
	asr.w	#3,d1
	lea.l	(a0,d1.w),a0
	adda.l	($0944),a0
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
Lff7824:
	move.w	(a2),d2
	movea.l	a0,a3
	move.w	(-$0012,a6),d0
	moveq.l	#$08,d3
	move.w	d0,d1
	asr.w	#3,d0
	and.w	#$0007,d1
	beq.s	Lff7884
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
Lff784e:
	bset.l	d4,d1
	subq.w	#1,d2
	beq.s	Lff7858
	dbra.w	d4,Lff784e
Lff7858:
	not.w	d1
	cmp.w	(-$0008,a6),d0
	blt.s	Lff7880
	bne.s	Lff786a
	and.b	(-$0004,a6),d6
	or.b	(-$0002,a6),d1
Lff786a:
	cmp.w	(-$0006,a6),d0
	bne.s	Lff7878
	and.b	(-$0003,a6),d6
	or.b	(-$0001,a6),d1
Lff7878:
	move.b	(a3),d5
	and.b	d1,d5
	or.b	d5,d6
	move.b	d6,(a3)
Lff7880:
	addq.l	#1,a3
	addq.w	#1,d0
Lff7884:
	move.w	d2,d1
	lsr.w	#3,d1
	beq.w	Lff7928
	move.w	d1,d4
	lsl.w	#3,d4
	sub.w	d4,d2
	subq.w	#1,d1
	tst.w	d3
	beq.s	Lff78e6
	move.w	#$0008,d4
	sub.w	d3,d4
	move.w	d3,d5
	swap.w	d3
	swap.w	d2
Lff78a4:
	move.b	(a1),d6
	clr.b	d2
	lsr.b	d4,d6
	or.b	d3,d6
	cmp.w	(-$0008,a6),d0
	blt.s	Lff78d4
	bne.s	Lff78bc
	and.b	(-$0004,a6),d6
	or.b	(-$0002,a6),d2
Lff78bc:
	cmp.w	(-$0006,a6),d0
	bgt.s	Lff78d4
	bne.s	Lff78cc
	and.b	(-$0003,a6),d6
	or.b	(-$0001,a6),d2
Lff78cc:
	move.b	(a3),d7
	and.b	d2,d7
	or.b	d7,d6
	move.b	d6,(a3)
Lff78d4:
	addq.l	#1,a3
	move.b	(a1)+,d3
	lsl.b	d5,d3
	addq.w	#1,d0
	dbra.w	d1,Lff78a4
	swap.w	d2
	swap.w	d3
	bra.s	Lff7928
Lff78e6:
	swap.w	d2
Lff78e8:
	move.b	(a1)+,d6
	clr.b	d2
	cmp.w	(-$0008,a6),d0
	blt.s	Lff7914
	bne.s	Lff78fc
	and.b	(-$0004,a6),d6
	or.b	(-$0002,a6),d2
Lff78fc:
	cmp.w	(-$0006,a6),d0
	bgt.s	Lff7914
	bne.s	Lff790c
	and.b	(-$0003,a6),d6
	or.b	(-$0001,a6),d2
Lff790c:
	move.b	(a3),d4
	and.b	d2,d4
	or.b	d4,d6
	move.b	d6,(a3)
Lff7914:
	addq.l	#1,a3
	addq.w	#1,d0
	dbra.w	d1,Lff78e8
	swap.w	d2
	tst.w	d2
	beq.s	Lff797e
	move.b	(a1)+,d3
	swap.w	d3
	moveq.l	#$08,d3
Lff7928:
	tst.w	d2
	beq.s	Lff797e
	move.w	#$0008,d1
	sub.w	d3,d1
	cmp.w	d2,d1
	bge.s	Lff7940
	move.b	(a1)+,d4
	lsr.b	d1,d4
	swap.w	d3
	or.b	d4,d3
	swap.w	d3
Lff7940:
	clr.w	d1
	subq.w	#1,d2
Lff7944:
	lsr.w	#1,d1
	bset.l	#$07,d1
	dbra.w	d2,Lff7944
	move.w	d1,d4
	not.w	d4
	swap.w	d3
	and.b	d1,d3
	cmp.w	(-$0008,a6),d0
	blt.s	Lff797e
	bne.s	Lff7966
	and.b	(-$0004,a6),d3
	or.b	(-$0002,a6),d4
Lff7966:
	cmp.w	(-$0006,a6),d0
	bgt.s	Lff797e
	bne.s	Lff7976
	and.b	(-$0003,a6),d3
	or.b	(-$0001,a6),d4
Lff7976:
	move.b	(a3),d5
	and.b	d4,d5
	or.b	d5,d3
	move.b	d3,(a3)
Lff797e:
	move.w	($0940),d1
	lea.l	(a0,d1.w),a0
	subq.w	#1,(-$0014,a6)
	bne.w	Lff7824
Lff798e:
	movem.l	(a7)+,d0-d7/a0-a3
	unlk	a6
	rts

Call_SCROLL:
	cmp.w	#$0008,d1
	bcc.s	Lff79b6
	move.w	d1,d0
	and.l	#$00000003,d0
	asl.w	#2,d0
	lea.l	($00e80018),a0
	adda.l	d0,a0
	cmp.w	#$0004,d1
	bcc.s	Lff79c6
	bra.s	Lff79be
Lff79b6:
	lea.l	($00e80014),a0
	bne.s	Lff79c6
Lff79be:
	bsr.s	Lff79c6
	move.w	d3,(a0)
	move.w	d2,-(a0)
	rts

Lff79c6:
	move.w	(a0)+,d0
	swap.w	d0
	move.w	(a0),d0
	rts

Call_B_CURON:
	tst.b	($0993)
	bne.s	Lff7a08
	tst.b	($0992)
	bne.s	Lff7a08
	move.w	#$0005,($09bc)
	st.b	($0992)
	clr.b	($0991)
	rts

Call_B_CUROFF:
	tst.b	($0993)
	bne.s	Lff7a08
	move.w	#$0005,($09bc)
	clr.b	($0992)
	tst.b	($0991)
	beq.s	Lff7a08
	bsr.w	Lff1db0
	clr.b	($0991)
Lff7a08:
	rts

Lff7a0a:
	clr.l	d0
	move.w	($0926),d0
	rts

Call_SET232C:
	cmp.w	#$ffff,d1
	beq.s	Lff7a0a
	move.w	d1,-(a7)
	clr.w	d0
	move.b	d1,d0
	cmp.b	#$09,d0
	bcs.s	Lff7a28
	move.w	#$0004,d0
Lff7a28:
	add.w	d0,d0
	lea.l	(Lff7ae2,pc),a0
	move.w	(a0,d0.w),d0
	move.w	sr,-(a7)
	ori.w	#$0700,sr
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
	bcc.s	Lff7a64
	or.w	#$000c,d0
Lff7a64:
	or.w	#$0040,d0
	move.w	#$0004,(a0)
	move.w	d0,(a0)
	clr.w	d0
	move.b	d0,($0928)
	move.b	d0,($0929)
	lsr.w	#2,d1
	and.w	#$0003,d1
	move.w	d1,-(a7)
	move.w	#$ff1f,d0
	rol.w	d1,d0
	move.b	d0,($0cb5)
	move.w	(a7)+,d1
	beq.s	Lff7a98
	cmp.w	#$0003,d1
	beq.s	Lff7a98
	eori.w	#$0003,d1
Lff7a98:
	asl.w	#5,d1
	move.w	d1,d0
	or.b	#$8a,d0
	move.w	#$0005,(a0)
	move.w	d0,(a0)
	asl.w	#1,d1
	move.w	#$0003,(a0)
	move.w	d1,(a0)
	clr.w	($089c)
	move.l	#$000008a6,d0
	move.l	d0,($089e)
	move.l	d0,($08a2)
	or.b	#$01,d1
	move.w	#$0003,(a0)
	move.w	d1,(a0)
	move.w	#$000e,(a0)
	move.w	#$0003,(a0)
	move.w	(a7)+,sr
	move.w	(a7)+,d1
	clr.l	d0
	move.w	($0926),d0
	move.w	d1,($0926)
	rts

Lff7ae2:
	.dc.b	$08,$21,$04,$10,$02,$07,$01,$02
	.dc.b	$00,$80,$00,$3f,$00,$1f,$00,$0e
	.dc.b	$00,$07
Call_LOF232C:
	move.w	($089c),d0
	rts

Call_INP232C:
	bsr.s	Call_ISNS232C
	swap.w	d0
	beq.s	Call_INP232C
	clr.w	d0
	move.l	a0,($08a2)
	subq.w	#1,($089c)
	swap.w	d0
	btst.b	#$01,($0926)
	beq.s	Lff7b38
	btst.b	#$00,($0929)
	beq.s	Lff7b38
	cmpi.w	#$0010,($089c)
	bcc.s	Lff7b38
	movem.l	d0-d1,-(a7)
	bclr.b	#$00,($0929)
	moveq.l	#$11,d1
	bsr.w	Lff7be4
	movem.l	(a7)+,d0-d1
Lff7b38:
	rts

Call_ISNS232C:
	clr.l	d0
	tst.w	($089c)
	beq.s	Lff7b5c
	movea.l	($08a2),a0
	addq.l	#2,a0
	cmpa.l	#$00000926,a0
	bcs.s	Lff7b56
	movea.l	#$000008a6,a0
Lff7b56:
	moveq.l	#$01,d0
	swap.w	d0
	move.w	(a0),d0
Lff7b5c:
	rts

Call_OSNS232C:
	clr.l	d0
	btst.b	#$01,($0926)
	beq.s	Lff7b70
	btst.b	#$01,($0929)
	bne.s	Lff7b80
Lff7b70:
	lea.l	($00e98004),a0
	move.w	#$0000,(a0)
	move.w	(a0),d0
	and.w	#$0004,d0
Lff7b80:
	rts

Call_OUT232C:
	btst.b	#$01,($0926)
	beq.s	Lff7b92
	btst.b	#$01,($0929)
	bne.s	Call_OUT232C
Lff7b92:
	btst.b	#$00,($0926)
	beq.s	Lff7be4
	cmp.b	#$0f,d1
	beq.s	Lff7bcc
	cmp.b	#$0e,d1
	beq.s	Lff7bcc
	btst.l	#$07,d1
	beq.s	Lff7bce
	move.w	d1,-(a7)
	and.b	#$7f,d1
	btst.b	#$01,($0928)
	bne.s	Lff7bc8
	bset.b	#$01,($0928)
	move.l	d1,-(a7)
	moveq.l	#$0f,d1
	bsr.s	Lff7be4
	move.l	(a7)+,d1
Lff7bc8:
	bsr.s	Lff7be4
	move.w	(a7)+,d1
Lff7bcc:
	rts

Lff7bce:
	btst.b	#$01,($0928)
	beq.s	Lff7be4
	move.l	d1,-(a7)
	bclr.b	#$01,($0928)
	moveq.l	#$0e,d1
	bsr.s	Lff7be4
	move.l	(a7)+,d1
Lff7be4:
	bsr.s	Lff7b70
	beq.s	Lff7be4
	move.w	d1,($00e98006)
	rts

Call_Unknown_36:
	tst.l	d1
	beq.s	Lff7c02
	move.l	d1,($0938)
	move.w	d2,($09b2)
	move.w	d2,($09b4)
	rts

Lff7c02:
	move.l	#Lffaa08,($0938)
	move.w	#$0001,($09b2)
	move.w	#$0001,($09b4)
	rts

Call_Unknown_37:
	lea.l	($097e),a0
	move.l	(a0),d0
	tst.l	d1
	beq.s	Lff7c26
	move.l	d1,(a0)
	rts

Lff7c26:
	pea.l	(Lff15be,pc)
	move.l	(a7)+,(a0)
	rts

Call_SETFNTADR:
	moveq.l	#$ff,d0
	cmp.l	#$00000006,d2
	bcc.s	Lff7c46
	move.l	d2,d0
	asl.l	#2,d0
	lea.l	($099a),a0
	adda.l	d0,a0
	move.l	(a0),d0
	move.l	d1,(a0)
Lff7c46:
	rts

Call_Unknown_39:
	lea.l	($0978),a0
	move.l	(a0),d0
	move.l	d1,(a0)+
	move.l	d0,d1
	move.w	(a0),d0
	move.w	d2,(a0)+
	move.w	d0,d2
	clr.l	d0
	rts

Call_Unknown_3a:
	move.l	a1,d0
	bne.s	Lff7c66
	lea.l	(Lff15d6),a1
Lff7c66:
	move.l	#$00000061.l,d0
	lea.l	($0a16),a0
Lff7c70:
	move.b	(a1)+,(a0)+
	dbra.w	d0,Lff7c70
	rts

Call_JOYGET:
	clr.l	d0
	cmp.w	#$0002,d1
	bcc.s	Lff7c8e
	move.w	d1,d0
	add.w	d0,d0
	lea.l	($00e9a001),a0
	move.b	(a0,d0.w),d0
Lff7c8e:
	rts

Call_INIT_PRN:
	move.b	#$01,($00e8c003)
	clr.l	($0a10)
	clr.w	($0a14)
	move.w	d1,($0a78)
Call_SNSPRN:
	move.b	($00e9c001),d0
	and.l	#$00000020,d0
	rts

Call_OUTLPT:
	move.l	($00ed003c),d0
	cmp.l	#$00010000,d0
	bcc.s	Lff7d1a
Lff7cc0:
	btst.b	#$05,($00e9c001)
	bne.s	Lff7cf2
	tst.b	($0a10)
	bne.s	Lff7cf0
	subq.l	#1,d0
	bne.s	Lff7cc0
Lff7cd4:
	movem.l	d1-d7/a0-a6,-(a7)
	move.w	#$7009,d7
	trap	#14
	move.w	d7,d0
	movem.l	(a7)+,d1-d7/a0-a6
	cmp.b	#$02,d0
	bne.s	Call_OUTLPT
	move.b	#$01,($0a10)
Lff7cf0:
	rts

Lff7cf2:
	move.b	d1,($00e8c001)
	clr.b	($0a10)
	lea.l	($00e9a001),a0
	tst.b	(a0)
	tst.b	(a0)
	clr.b	($00e8c003)
	tst.b	(a0)
	tst.b	(a0)
	move.b	#$01,($00e8c003)
	rts

Lff7d1a:
	tst.b	($0a10)
	bne.s	Lff7cf0
	exg.l	d0,a0
	move.l	#$000003e8,d0
	bsr.s	Lff7d3a
	tst.l	d0
	beq.s	Lff7cf2
	exg.l	d0,a0
	sub.l	#$0000147b,d0
	bcs.s	Lff7cd4
	bra.s	Lff7d1a
Lff7d3a:
	movem.l	d1-d2/a0,-(a7)
	lea.l	($00e88023),a0
	moveq.l	#$00,d1
	move.b	(a0),d1
	move.b	(a0),d1
Lff7d4a:
	btst.b	#$05,($00e9c001)
	bne.s	Lff7d72
	moveq.l	#$00,d2
	move.b	(a0),d2
	cmp.b	(a0),d2
	bcs.s	Lff7d4a
	sub.w	d2,d1
	bcc.s	Lff7d64
	add.w	#$00c8,d1
Lff7d64:
	exg.l	d1,d2
	sub.l	d2,d0
	bhi.s	Lff7d4a
	moveq.l	#$ff,d0
Lff7d6c:
	movem.l	(a7)+,d1-d2/a0
	rts

Lff7d72:
	moveq.l	#$00,d0
	bra.s	Lff7d6c
Call_OUTPRN:
	move.b	($0a12),d0
	bne.s	Lff7dee
	cmp.b	#$09,d1
	beq.w	Lff7eb6
	cmp.b	#$0a,d1
	beq.w	Lff7e7e
	cmp.b	#$0d,d1
	beq.w	Lff7ea6
	cmp.b	#$0c,d1
	beq.w	Lff7e94
	cmp.b	#$1a,d1
	beq.w	Lff7ec2
	cmp.b	#$20,d1
	bcs.s	Lff7de0
	cmp.b	#$80,d1
	bcs.w	Lff7f0a
	cmp.b	#$a0,d1
	bcs.s	Lff7dc0
	cmp.b	#$e0,d1
	bcs.w	Lff7f0a
Lff7dc0:
	move.b	d1,($0a12)
	rts

Lff7dc6:
	move.b	($0a79),d0
	cmp.b	($0a15),d0
	bcc.s	Lff7dd8
	move.w	d1,-(a7)
	bsr.w	Lff7ec2
	move.w	(a7)+,d1
Lff7dd8:
	bsr.w	Lff7ed8
Lff7ddc:
	addq.w	#1,($0a14)
Lff7de0:
	movem.l	d0-d1,-(a7)
	IOCS	_OUTLPT
	movem.l	(a7)+,d0-d1
	rts

Lff7dee:
	clr.b	($0a12)
	asl.w	#8,d0
	or.w	d0,d1
	cmp.w	#$8000,d0
	beq.w	Lff7f14
	cmp.w	#$f000,d0
	bcc.w	Lff7f14
	cmpi.b	#-$01,($0a79)
	beq.s	Lff7e24
	move.w	($0a14),d0
	addq.w	#1,d0
	cmp.b	($0a79),d0
	bcs.s	Lff7e24
	beq.s	Lff7e24
	move.w	d1,-(a7)
	bsr.w	Lff7ec2
	move.w	(a7)+,d1
Lff7e24:
	bsr.w	Call_SFTJIS
	cmp.w	#$7600,d1
	bcc.s	Lff7e64
	cmp.w	#$5000,d1
	bcc.s	Lff7e58
	cmp.w	#$2e00,d1
	bcc.s	Lff7e4c
	cmp.w	#$2c00,d1
	bcs.s	Lff7e4c
	btst.b	#$01,($0a77)
	bne.w	Lff7f6a
	bra.s	Lff7e6e
Lff7e4c:
	btst.b	#$03,($0a77)
	bne.w	Lff7f6a
	bra.s	Lff7e6e
Lff7e58:
	btst.b	#$02,($0a77)
	bne.w	Lff7f6a
	bra.s	Lff7e6e
Lff7e64:
	btst.b	#$00,($0a77)
	bne.w	Lff7f6a
Lff7e6e:
	bsr.s	Lff7eec
	move.w	d1,-(a7)
	lsr.w	#8,d1
	bsr.w	Lff7ddc
	move.w	(a7)+,d1
	bra.w	Lff7ddc
Lff7e7e:
	bsr.s	Lff7ed8
	bsr.w	Lff8132
	addq.b	#1,($0a13)
	move.b	($0a78),d0
	cmp.b	($0a13),d0
	bcs.s	Lff7e98
	rts

Lff7e94:
	clr.w	($0a14)
Lff7e98:
	clr.b	($0a13)
	move.w	#$000c,d1
	bsr.w	Lff7de0
	rts

Lff7ea6:
	move.w	#$000d,d1
	bsr.s	Lff7ed8
	bsr.w	Lff7de0
	clr.w	($0a14)
	rts

Lff7eb6:
	bsr.s	Lff7ed8
Lff7eb8:
	move.b	($0a79),d0
	cmp.b	($0a15),d0
	bcc.s	Lff7ec6
Lff7ec2:
	bsr.s	Lff7ea6
	bra.s	Lff7e7e
Lff7ec6:
	moveq.l	#$20,d1
	bsr.w	Lff7ddc
	move.w	($0a14),d0
	and.w	#$0007,d0
	bne.s	Lff7eb8
	rts

Lff7ed8:
	tst.b	($0a11)
	beq.s	Lff7f08
	clr.b	($0a11)
	movem.l	d0-d1/a0,-(a7)
	lea.l	($0a30),a0
	bra.s	Lff7f00
Lff7eec:
	tst.b	($0a11)
	bne.s	Lff7f08
	move.b	#$01,($0a11)
	movem.l	d0-d1/a0,-(a7)
	lea.l	($0a28),a0
Lff7f00:
	bsr.w	Lff811c
	movem.l	(a7)+,d0-d1/a0
Lff7f08:
	rts

Lff7f0a:
	btst.b	#$04,($0a77)
	beq.w	Lff7dc6
Lff7f14:
	move.b	($0a79),d0
	cmp.b	($0a15),d0
	bcc.s	Lff7f24
	move.w	d1,-(a7)
	bsr.s	Lff7ec2
	move.w	(a7)+,d1
Lff7f24:
	movem.l	d1-d3/a1-a2,-(a7)
	moveq.l	#$0c,d2
	movea.l	($0458),a1
	jsr	(a1)
	movea.l	d0,a1
	lea.l	(-$0060,a7),a7
	movea.l	a7,a2
Lff7f38:
	move.b	(a1)+,(a2)+
	move.b	(a1)+,(a2)+
	clr.w	(a2)+
	dbra.w	d2,Lff7f38
	lea.l	($0a64),a0
	bsr.w	Lff811c
	move.b	($0a75),d0
	bsr.s	Lff7fb2
	moveq.l	#$0b,d2
	movea.l	a7,a2
	bsr.s	Lff7fcc
	move.b	($0a75),d0
	bsr.s	Lff7fb2
	addq.w	#1,($0a14)
	lea.l	($0060,a7),a7
	movem.l	(a7)+,d1-d3/a1-a2
	rts

Lff7f6a:
	movem.l	d1-d3/a1-a2,-(a7)
	moveq.l	#$0c,d2
	movea.l	($0458),a1
	jsr	(a1)
	movea.l	d0,a1
	lea.l	(-$0060,a7),a7
	movea.l	a7,a2
Lff7f7e:
	move.b	(a1)+,(a2)+
	move.b	(a1)+,(a2)+
	move.b	(a1)+,(a2)+
	clr.b	(a2)+
	dbra.w	d2,Lff7f7e
	lea.l	($0a6c),a0
	bsr.w	Lff811c
	move.b	($0a76),d0
	bsr.s	Lff7fb2
	moveq.l	#$17,d2
	movea.l	a7,a2
	bsr.s	Lff7fcc
	move.b	($0a76),d0
	bsr.s	Lff7fb2
	addq.w	#2,($0a14)
	lea.l	($0060,a7),a7
	movem.l	(a7)+,d1-d3/a1-a2
	rts

Lff7fb2:
	and.w	#$00ff,d0
	beq.s	Lff7fca
	move.w	d0,d1
	add.w	d0,d0
	add.w	d1,d0
	subq.w	#1,d0
	clr.l	d1
Lff7fc2:
	bsr.w	Lff7de0
	dbra.w	d0,Lff7fc2
Lff7fca:
	rts

Lff7fcc:
	tst.b	($0a74)
	bne.s	Lff7fee
Lff7fd2:
	movea.l	a2,a1
	moveq.l	#$17,d0
	clr.l	d1
Lff7fd8:
	move.l	(a1),d3
	asl.l	#1,d3
	roxl.l	#1,d1
	move.l	d3,(a1)+
	dbra.w	d0,Lff7fd8
	bsr.w	Lff8272
	dbra.w	d2,Lff7fd2
	rts

Lff7fee:
	movea.l	a2,a1
	moveq.l	#$17,d0
	clr.l	d1
Lff7ff4:
	move.l	(a1),d3
	asl.l	#1,d3
	roxr.l	#1,d1
	move.l	d3,(a1)+
	dbra.w	d0,Lff7ff4
	ror.w	#8,d1
	swap.w	d1
	ror.w	#8,d1
	bsr.w	Lff8272
	dbra.w	d2,Lff7fee
	rts

Lff8010:
	movem.l	d0-d7/a0-a2,-(a7)
	and.w	#$000f,d0
	move.l	d0,d7
	bsr.w	Lff7ea6
	bsr.s	Lff802a
	clr.b	($0a13)
	movem.l	(a7)+,d0-d7/a0-a2
	rte

Lff802a:
	btst.l	#$03,d7
	bne.w	Lff7e7e
	btst.l	#$02,d7
	bne.w	Lff7e94
	move.w	($0a1a),d2
	tst.b	d7
	bne.s	Lff8046
	move.w	($0a20),d2
Lff8046:
	move.w	($0a26),d3
	movea.l	($0a16),a1
	lea.l	($0a3c),a0
	bsr.w	Lff811c
Lff8056:
	move.w	d3,d4
	lea.l	($0a54),a0
	tst.b	d7
	bne.s	Lff8064
	lea.l	($0a5c),a0
Lff8064:
	bsr.w	Lff811c
	movea.l	a1,a0
Lff806a:
	moveq.l	#$07,d5
Lff806c:
	movea.l	a0,a2
	bsr.w	Lff813e
	bsr.w	Lff813e
	bsr.w	Lff813e
	bsr.w	Lff8272
	tst.b	d7
	beq.s	Lff8094
	movea.l	a0,a2
	bsr.w	Lff8204
	bsr.w	Lff8204
	bsr.w	Lff8204
	bsr.w	Lff8272
Lff8094:
	dbra.w	d5,Lff806c
	addq.l	#1,a0
	dbra.w	d4,Lff806a
	bsr.w	Lff812c
	adda.l	#$00000600,a1
	tst.b	d7
	bne.s	Lff80b2
	adda.l	#$00000600,a1
Lff80b2:
	dbra.w	d2,Lff8056
	tst.b	d7
	beq.s	Lff80ce
	move.l	($0a1c),d2
	beq.s	Lff8118
	lea.l	($0a48),a0
	bsr.s	Lff811c
	move.w	d3,d4
	lea.l	($0a54),a0
	bra.s	Lff80e0
Lff80ce:
	move.l	($0a22),d2
	beq.s	Lff8118
	lea.l	($0a4e),a0
	bsr.s	Lff811c
	move.w	d3,d4
	lea.l	($0a5c),a0
Lff80e0:
	bsr.s	Lff811c
	movea.l	a1,a0
Lff80e4:
	moveq.l	#$07,d5
Lff80e6:
	movea.l	a0,a2
	bsr.s	Lff813e
	bsr.s	Lff813e
	bsr.s	Lff813e
	and.l	d2,d1
	bsr.w	Lff8272
	tst.b	d7
	beq.s	Lff810c
	movea.l	a0,a2
	bsr.w	Lff8204
	bsr.w	Lff8204
	bsr.w	Lff8204
	and.l	d2,d1
	bsr.w	Lff8272
Lff810c:
	dbra.w	d5,Lff80e6
	addq.l	#1,a0
	dbra.w	d4,Lff80e4
	bsr.s	Lff812c
Lff8118:
	lea.l	($0a42),a0
Lff811c:
	move.b	(a0)+,d0
	beq.s	Lff812a
Lff8120:
	move.b	(a0)+,d1
	bsr.w	Lff7de0
	subq.b	#1,d0
	bne.s	Lff8120
Lff812a:
	rts

Lff812c:
	moveq.l	#$0d,d1
	bsr.w	Lff7de0
Lff8132:
	move.l	a0,-(a7)
	lea.l	($0a38),a0
	bsr.s	Lff811c
	movea.l	(a7)+,a0
	rts

Lff813e:
	tst.b	($0a74)
	bne.s	Lff81a0
	tst.b	d7
	beq.s	Lff8188
	asl.l	#8,d1
	moveq.l	#$03,d6
	btst.l	#$01,d7
	beq.s	Lff8174
	moveq.l	#$02,d0
	swap.w	d0
Lff8156:
	asl.b	#2,d1
	btst.b	d5,(a2)
	beq.s	Lff815e
	addq.b	#2,d1
Lff815e:
	adda.l	d0,a2
	btst.b	d5,(a2)
	beq.s	Lff8166
	addq.b	#1,d1
Lff8166:
	suba.l	d0,a2
	adda.l	#$00000080,a2
	dbra.w	d6,Lff8156
	rts

Lff8174:
	asl.b	#2,d1
	btst.b	d5,(a2)
	beq.s	Lff817c
	addq.b	#3,d1
Lff817c:
	adda.l	#$00000080,a2
	dbra.w	d6,Lff8174
	rts

Lff8188:
	asl.l	#8,d1
	moveq.l	#$07,d6
Lff818c:
	asl.b	#1,d1
	btst.b	d5,(a2)
	beq.s	Lff8194
	addq.b	#1,d1
Lff8194:
	adda.l	#$00000080,a2
	dbra.w	d6,Lff818c
	rts

Lff81a0:
	tst.b	d7
	beq.s	Lff81ea
	asl.l	#8,d1
	moveq.l	#$03,d6
	btst.l	#$01,d7
	beq.s	Lff81d4
	moveq.l	#$02,d0
	swap.w	d0
Lff81b2:
	lsr.b	#2,d1
	btst.b	d5,(a2)
	beq.s	Lff81bc
	add.b	#$40,d1
Lff81bc:
	adda.l	d0,a2
	btst.b	d5,(a2)
	beq.s	Lff81c6
	add.b	#$80,d1
Lff81c6:
	suba.l	d0,a2
	adda.l	#$00000080,a2
	dbra.w	d6,Lff81b2
	rts

Lff81d4:
	lsr.b	#2,d1
	btst.b	d5,(a2)
	beq.s	Lff81de
	add.b	#$c0,d1
Lff81de:
	adda.l	#$00000080,a2
	dbra.w	d6,Lff81d4
	rts

Lff81ea:
	asl.l	#8,d1
	moveq.l	#$07,d6
Lff81ee:
	lsr.b	#1,d1
	btst.b	d5,(a2)
	beq.s	Lff81f8
	add.b	#$80,d1
Lff81f8:
	adda.l	#$00000080,a2
	dbra.w	d6,Lff81ee
	rts

Lff8204:
	tst.b	($0a74)
	bne.s	Lff823e
	tst.b	d7
	beq.w	Lff8188
	asl.l	#8,d1
	moveq.l	#$03,d6
	btst.l	#$01,d7
	beq.w	Lff8174
	moveq.l	#$02,d0
	swap.w	d0
Lff8220:
	asl.b	#2,d1
	adda.l	d0,a2
	btst.b	d5,(a2)
	suba.l	d0,a2
	beq.s	Lff8232
	addq.b	#2,d1
	btst.b	d5,(a2)
	beq.s	Lff8232
	addq.b	#1,d1
Lff8232:
	adda.l	#$00000080,a2
	dbra.w	d6,Lff8220
	rts

Lff823e:
	tst.b	d7
	beq.s	Lff81ea
	asl.l	#8,d1
	moveq.l	#$03,d6
	btst.l	#$01,d7
	beq.s	Lff81d4
	moveq.l	#$02,d0
	swap.w	d0
Lff8250:
	lsr.b	#2,d1
	adda.l	d0,a2
	btst.b	d5,(a2)
	suba.l	d0,a2
	beq.s	Lff8266
	add.b	#$40,d1
	btst.b	d5,(a2)
	beq.s	Lff8266
	add.b	#$80,d1
Lff8266:
	adda.l	#$00000080,a2
	dbra.w	d6,Lff8250
	rts

Lff8272:
	swap.w	d1
	bsr.w	Lff7de0
	rol.l	#8,d1
	bsr.w	Lff7de0
	rol.l	#8,d1
	bra.w	Lff7de0
Lff8284:
	move.l	d0,-(a7)
	cmpi.b	#$01,($0cbc)
	bls.s	Lff82a2
	movec.l	cacr,d0
	or.w	#$0808,d0
	movec.l	d0,cacr
	and.w	#$f7f7,d0
	movec.l	d0,cacr
Lff82a2:
	move.l	(a7)+,d0
	rts

Call_ADPCMOUT:
	lea.l	(Lff831a,pc),a0
	bra.s	Lff82b0
Call_ADPCMINP:
	lea.l	(Lff8300,pc),a0
Lff82b0:
	tst.b	($0c32)
	bne.s	Lff82b0
	bsr.w	Lff83b2
Lff82ba:
	cmp.l	#$0000ff00,d2
	bcs.s	Lff82de
	movem.l	d2/a0,-(a7)
	move.l	#$0000ff00,d2
	moveq.l	#$80,d0
	jsr	(a0)
	adda.l	d2,a1
	move.l	d2,d0
	movem.l	(a7)+,d2/a0
	sub.l	d0,d2
	bne.s	Lff82ba
	rts

Lff82de:
	moveq.l	#$00,d0
	jsr	(a0)
	rts

Lff82e4:
	movem.l	d1-d2/a1,-(a7)
	movea.l	($0978),a1
	move.w	#$0403,d1
	move.w	($097c),d2
	beq.s	Lff82fa
	moveq.l	#$00,d0
	bsr.s	Lff831a
Lff82fa:
	movem.l	(a7)+,d1-d2/a1
	rts

Lff8300:
	tst.b	($0c32)
	bne.s	Lff8300
	addq.b	#4,d0
	move.b	d0,($0c32)
	moveq.l	#$b2,d0
	bsr.s	Lff8334
	move.b	#$04,($00e92001)
	rts

Lff831a:
	tst.b	($0c32)
	bne.s	Lff831a
	addq.b	#2,d0
	move.b	d0,($0c32)
	moveq.l	#$32,d0
	bsr.s	Lff8334
	move.b	#$02,($00e92001)
	rts

Lff8334:
	lea.l	($00e840c0),a0
	move.b	d0,($0005,a0)
	st.b	(a0)
	move.l	a1,($000c,a0)
	move.w	d2,($000a,a0)
Lff8348:
	move.w	d1,-(a7)
	move.b	($09da),d0
	or.b	#$80,d0
	cmp.w	#$0200,d1
	bcs.s	Lff8360
	sub.w	#$0200,d1
	and.b	#$7f,d0
Lff8360:
	move.b	d0,($09da)
	bsr.w	Lff84e2
	move.b	#$1b,($00e90001)
	bsr.w	Lff84e2
	move.b	d0,($00e90003)
	move.w	d1,d0
	and.b	#$03,d0
	beq.s	Lff8388
	cmp.b	#$03,d0
	bne.s	Lff838c
Lff8388:
	eori.b	#$03,d0
Lff838c:
	lsr.w	#8,d1
	asl.w	#2,d1
	or.b	d0,d1
	move.b	($00e9a005),d0
	and.b	#$f0,d0
	or.b	d1,d0
	move.w	(a7)+,d1
	bsr.w	Lff8284
	move.b	#$88,($0007,a0)
	move.b	d0,($00e9a005)
	rts

Lff83b2:
	tst.w	d1
	bmi.s	Lff83ca
	move.w	d1,-(a7)
	lsr.w	#8,d1
	and.w	#$0007,d1
	moveq.l	#$00,d0
	move.b	(Lff83d0,pc,d1.w),d0
	bsr.w	Lff0d12
	move.w	(a7)+,d1
Lff83ca:
	and.w	#$7fff,d1
	rts

Lff83d0:
	.dc.b	$0a,$08,$05,$04,$03,$00,$00,$00
Call_ADPCMAIN:
	tst.b	($0c32)
	bne.s	Call_ADPCMAIN
	bsr.s	Lff83b2
	move.b	#$14,($0c32)
	moveq.l	#$ba,d0
	bsr.s	Lff8410
	move.b	#$04,($00e92001)
	rts

Call_ADPCMAOT:
	tst.b	($0c32)
	bne.s	Call_ADPCMAOT
	bsr.s	Lff83b2
	move.b	#$12,($0c32)
	moveq.l	#$3a,d0
	bsr.s	Lff8410
	move.b	#$02,($00e92001)
	rts

Lff8410:
	lea.l	($00e840c0),a0
	move.b	d0,($0005,a0)
	st.b	(a0)
	move.l	a1,($001c,a0)
	move.w	d2,($001a,a0)
	bra.w	Lff8348
Call_ADPCMLIN:
	tst.b	($0c32)
	bne.s	Call_ADPCMLIN
	bsr.s	Lff83b2
	move.b	#$24,($0c32)
	moveq.l	#$be,d0
	bsr.s	Lff8410
	move.b	#$04,($00e92001)
	rts

Call_ADPCMLOT:
	tst.b	($0c32)
	bne.s	Call_ADPCMLOT
	bsr.w	Lff83b2
	move.b	#$22,($0c32)
	moveq.l	#$3e,d0
	bsr.s	Lff8410
	move.b	#$02,($00e92001)
	rts

Call_ADPCMSNS:
	moveq.l	#$00,d0
	move.b	($0c32),d0
	and.b	#$7f,d0
	rts

Call_ADPCMMOD:
	tst.b	d1
	beq.s	Lff847e
	cmp.b	#$02,d1
	bcs.s	Lff84aa
	beq.s	Lff84ae
	moveq.l	#$ff,d0
	rts

Lff847e:
	clr.w	($0c32)
	move.b	#$01,($00e9a007)
	move.b	#$03,($00e9a007)
	move.b	#$01,($00e92001)
	moveq.l	#$10,d0
Lff849c:
	ori.w	#$0700,sr
Lff84a0:
	move.b	d0,($00e840c7)
	moveq.l	#$00,d0
	rts

Lff84aa:
	moveq.l	#$20,d0
	bra.s	Lff849c
Lff84ae:
	moveq.l	#$08,d0
	bra.s	Lff84a0
Call_OPMSET:
	move.b	d2,d0
	cmp.b	#$1b,d1
	bne.s	Lff84cc
	move.b	($09da),d0
	and.b	#$c0,d0
	and.b	#$3f,d2
	or.b	d2,d0
	move.b	d0,($09da)
Lff84cc:
	swap.w	d0
	bsr.s	Lff84e2
	move.b	d1,($00e90001)
	bsr.s	Lff84e2
	swap.w	d0
	move.b	d0,($00e90003)
	rts

Lff84e2:
	tst.b	($00e90003)
	bmi.s	Lff84e2
	rts

Call_OPMSNS:
	moveq.l	#$00,d0
	move.b	($00e90003),d0
	rts

Call_ONTIME:
	ori.w	#$0700,sr
	move.l	($09d6),d1
	cmp.l	#$05a00000,d1
	bcs.s	Lff8508
	clr.l	d1
Lff8508:
	divu.w	#$05a0,d1
	move.w	d1,-(a7)
	swap.w	d1
	mulu.w	#$1770,d1
	clr.l	d0
	move.w	($09ca),d0
	sub.w	($09cc),d0
	add.l	d1,d0
	clr.l	d1
	move.w	(a7)+,d1
	rts

Lff8526:
	moveq.l	#$43,d0
	bsr.w	Lff85b6
	bra.s	Lff8536
Lff852e:
	bra.s	Lff8526
Call_OPMINTST:
	moveq.l	#$43,d0
	bsr.w	Lff85d4
Lff8536:
	beq.s	Lff854c
	lea.l	($00e88009),a0
	ori.b	#$08,(a0)
	ori.b	#$08,($000c,a0)
	moveq.l	#$00,d0
	rts

Lff854c:
	move.l	a0,-(a7)
	lea.l	($00e88009),a0
	andi.b	#$f7,(a0)
	andi.b	#$f7,($000c,a0)
	bra.w	Lff85f2
Lff8562:
	moveq.l	#$44,d0
	bsr.s	Lff85b6
	bra.s	Lff856e
Lff8568:
	bra.s	Lff8562
Call_TIMERDST:
	moveq.l	#$44,d0
	bsr.s	Lff85d4
Lff856e:
	beq.s	Lff859a
	lea.l	($00e88000),a0
	move.w	d1,d0
	ror.w	#8,d0
	and.w	#$0007,d0
	or.w	#$0070,d0
	move.b	d0,($001d,a0)
	move.b	d1,($0025,a0)
	ori.b	#$10,($0009,a0)
	ori.b	#$10,($0015,a0)
	moveq.l	#$00,d0
	rts

Lff859a:
	move.l	a0,-(a7)
	lea.l	($00e88000),a0
	move.b	#$70,($001d,a0)
	andi.b	#$ef,($0009,a0)
	andi.b	#$ef,($0015,a0)
	bra.s	Lff85f2
Lff85b6:
	ori.w	#$0700,sr
	movec.l	vbr,a0
	lsl.w	#2,d0
	adda.w	d0,a0
	move.l	a1,d0
	beq.s	Lff85ec
	move.l	(a0),d0
	cmpi.l	#DefaultExceptionHandler,d0
	bne.s	Lff85ee
	moveq.l	#$ff,d0
	bra.s	Lff85ea
Lff85d4:
	ori.w	#$0700,sr
	lsl.w	#2,d0
	movea.w	d0,a0
	move.l	a1,d0
	beq.s	Lff85ec
	move.l	(a0),d0
	cmpi.l	#L000000,d0
	bcs.s	Lff85ee
Lff85ea:
	move.l	a1,(a0)
Lff85ec:
	rts

Lff85ee:
	tst.l	(a7)+
	rts

Lff85f2:
	movea.l	(a7)+,a0
	move.l	a0,d0
	lsr.w	#2,d0
	pea.l	(DefaultExceptionHandler,pc)
	move.l	(a7)+,(a0)
	move.b	d0,(a0)
	moveq.l	#$00,d0
	rts

Lff8604:
	moveq.l	#$4d,d0
	bsr.s	Lff85b6
	bra.s	Lff8610
Lff860a:
	bra.s	Lff8604
Call_VDISPST:
	moveq.l	#$4d,d0
	bsr.s	Lff85d4
Lff8610:
	beq.s	Lff8642
	lea.l	($00e88000),a0
	move.b	($0003,a0),d0
	and.w	#$00ef,d0
	btst.l	#$08,d1
	beq.s	Lff862a
	or.w	#$0010,d0
Lff862a:
	move.b	d0,($0003,a0)
	move.b	d1,($001f,a0)
	ori.b	#$20,($0007,a0)
	ori.b	#$20,($0013,a0)
	moveq.l	#$00,d0
	rts

Lff8642:
	move.l	a0,-(a7)
	lea.l	($00e88007),a0
	andi.b	#$df,(a0)
	andi.b	#$df,($000c,a0)
	bra.s	Lff85f2
Lff8656:
	moveq.l	#$4e,d0
	bsr.w	Lff85b6
	bra.s	Lff8666
Lff865e:
	bra.s	Lff8656
Call_CRTCRAS:
	moveq.l	#$4e,d0
	bsr.w	Lff85d4
Lff8666:
	beq.s	Lff8682
	move.w	d1,($00e80012)
	lea.l	($00e88007),a0
	ori.b	#$40,(a0)
	ori.b	#$40,($000c,a0)
	moveq.l	#$00,d0
	rts

Lff8682:
	move.l	a0,-(a7)
	lea.l	($00e88007),a0
	andi.b	#$bf,(a0)
	andi.b	#$bf,($000c,a0)
	bra.w	Lff85f2
Lff8698:
	moveq.l	#$4f,d0
	bsr.w	Lff85b6
	bra.s	Lff86a8
Lff86a0:
	bra.s	Lff8698
Call_HSYNCST:
	moveq.l	#$4f,d0
	bsr.w	Lff85d4
Lff86a8:
	beq.s	Lff86be
	lea.l	($00e88007),a0
	ori.b	#$80,(a0)
	ori.b	#$80,($000c,a0)
	moveq.l	#$00,d0
	rts

Lff86be:
	move.l	a0,-(a7)
	lea.l	($00e88007),a0
	andi.b	#$7f,(a0)
	andi.b	#$7f,($000c,a0)
	bra.w	Lff85f2
Lff86d4:
	moveq.l	#$63,d0
	bsr.w	Lff85b6
	bra.s	Lff86e4
Lff86dc:
	bra.s	Lff86d4
Call_PRNINTST:
	moveq.l	#$63,d0
	bsr.w	Lff85d4
Lff86e4:
	beq.s	Lff86f2
	bset.b	#$00,($00e9c001)
	moveq.l	#$00,d0
	rts

Lff86f2:
	bclr.b	#$00,($00e9c001)
	move.l	a0,-(a7)
	bra.w	Lff85f2
Call_B_SEEK:
	btst.l	#$0c,d1
	beq.w	Lff90b8
	bsr.w	$00ff8ed6
	bsr.s	Lff8712
	bra.w	Lff8f54
Lff8712:
	bsr.s	Lff8728
	btst.l	#$1b,d0
	bne.s	Lff8744
	swap.w	d0
	swap.w	d2
	cmp.b	d0,d2
	beq.s	Lff8740
	swap.w	d2
	bsr.w	Lff8a62
Lff8728:
	move.l	d1,-(a7)
	move.b	#$0f,d1
	bsr.w	$00ff8e20
	swap.w	d2
	move.b	d2,($0002,a0)
	swap.w	d2
	moveq.l	#$02,d0
	bra.w	Lff8a76
Lff8740:
	swap.w	d2
	swap.w	d0
Lff8744:
	rts

Call_B_VERIFY:
	btst.l	#$0c,d1
	beq.w	Lff91e8
	bsr.w	$00ff8ed6
	movem.l	d1/d4-d7/a2,-(a7)
	bsr.w	$00ff8dc0
	tst.l	d0
	bne.s	Lff87ac
	bsr.w	$00ff8e04
	btst.l	#$1b,d0
	bne.s	Lff87ac
	and.b	#$c0,d1
	or.b	#$11,d1
Lff8770:
	bsr.w	$00ff8e20
	rol.l	#8,d2
	addq.l	#2,a0
	move.l	d2,(a0)+
	ror.l	#8,d2
	move.b	d2,(a0)+
	move.b	d7,(a0)+
	move.b	d6,(a0)
	bsr.w	Lff8e42
	bsr.w	$00ff8e9c
	bsr.w	$00ff8e66
	bsr.w	$00ff8a80
	btst.l	#$0a,d0
	bne.s	Lff87ac
	btst.l	#$1e,d0
	beq.s	Lff87b0
	btst.l	#$1b,d0
	bne.s	Lff87ac
	bsr.w	$00ff8a26
	dbra.w	d4,Lff8770
Lff87ac:
	bra.w	$00ff8f50
Lff87b0:
	lea.l	(Lff87b8,pc),a2
	bra.w	$00ff8d68
Lff87b8:
	.dc.b	$ff,$f4,$ff,$b8,$ff,$b8
Call_B_READDI:
	.dc.b	$08,$01,$00,$0c,$67,$00,$9d,$d2
	.dc.b	$61,$00,$07,$0e,$48,$e7,$4f,$20
	.dc.b	$61,$00,$05,$f0,$4a,$80,$66,$60
	.dc.b	$61,$00,$06,$2c,$08,$00,$00,$1b
	.dc.b	$66,$56,$c2,$3c,$00,$40,$82,$3c
	.dc.b	$00,$02,$61,$00,$06,$36,$e1,$9a
	.dc.b	$54,$88,$20,$c2,$e0,$9a,$10,$c2
	.dc.b	$10,$c7,$10,$86,$61,$00,$06,$4a
	.dc.b	$61,$00,$06,$9c,$61,$00,$06,$62
	.dc.b	$61,$00,$02,$78,$08,$00,$00,$12
	.dc.b	$66,$2a,$08,$00,$00,$16,$66,$24
	.dc.b	$08,$00,$00,$0f,$66,$1e,$08,$00
	.dc.b	$00,$0e,$66,$18,$08,$00,$00,$1e
	.dc.b	$67,$12,$08,$00,$00,$1b,$66,$08
	.dc.b	$61,$00,$01,$f6,$51,$cc,$ff,$b4
	.dc.b	$60,$00,$07,$18,$45,$fa,$00,$06
	.dc.b	$60,$00,$05,$28,$ff,$f4,$ff,$a6
	.dc.b	$ff,$a6
Call_B_DSKINI:
	btst.l	#$0c,d1
	beq.w	Lff9250
	lea.l	($09c2),a0
	move.w	d2,d0
	bne.s	$00ff885c
	move.w	#$00c8,d0
	move.w	d0,(a0)+
	move.w	d0,(a0)+
	move.l	a4,-(a7)
	bsr.w	Lff1c36
	movea.l	(a7)+,a4
	move.b	($00e94001),d0
	btst.l	#$04,d0
	beq.s	$00ff8878
	bsr.w	Lff1b62
	movea.l	a1,a0
	move.l	a0,d0
	bne.s	$00ff8882
	lea.l	($0814,pc),a0
	moveq.l	#$02,d0
	bsr.w	Lff8ea2
	bra.w	Lff8f54
Call_B_DRVSNS:
	btst.l	#$0c,d1
	beq.w	Lff90d6
Lff8894:
	bsr.w	$00ff8ed6
	bsr.s	Lff889e
	bra.w	Lff8f54
Lff889e:
	move.l	d1,-(a7)
	move.b	#$04,d1
	bsr.w	$00ff8e20
	move.l	(a7)+,d1
	moveq.l	#$01,d0
	bsr.w	Lff8ea2
Lff88b0:
	move.b	($00e94001),d0
	and.b	#$d0,d0
	cmp.b	#$d0,d0
	bne.s	Lff88b0
	moveq.l	#$00,d0
	move.b	($00e94003),d0
	ror.l	#8,d0
	rts

Call_B_WRITE:
	btst.l	#$0c,d1
	beq.w	Lff9182
	bsr.w	$00ff8ed6
	movem.l	d1/d4-d7/a2,-(a7)
	bsr.w	$00ff8dc0
	tst.l	d0
	bne.s	Lff893a
	bsr.w	$00ff8e04
	btst.l	#$1b,d0
	bne.s	Lff893a
	and.b	#$c0,d1
	or.b	#$05,d1
	bra.s	Lff88fe
Lff88f8:
	moveq.l	#$0c,d0
	bsr.w	Lff0d12
Lff88fe:
	bsr.w	$00ff8e20
	rol.l	#8,d2
	addq.l	#2,a0
	move.l	d2,(a0)+
	ror.l	#8,d2
	move.b	d2,(a0)+
	move.b	d7,(a0)+
	move.b	d6,(a0)
	bsr.w	Lff8e42
	bsr.w	$00ff8e9c
	bsr.w	$00ff8e66
	bsr.w	$00ff8a80
	btst.l	#$1e,d0
	beq.s	Lff893e
	btst.l	#$1b,d0
	bne.s	Lff893a
	btst.l	#$11,d0
	bne.s	Lff893a
	bsr.w	$00ff8a26
	dbra.w	d4,Lff88fe
Lff893a:
	bra.w	$00ff8f50
Lff893e:
	lea.l	(Lff8946,pc),a2
	bra.w	$00ff8d68
Lff8946:
	.dc.b	$ff,$f4,$ff,$b8,$ff,$b2
Call_B_READ:
	btst.l	#$0c,d1
	beq.w	Lff917c
	bsr.w	$00ff8ed6
	movem.l	d1/d4-d7/a2,-(a7)
	bsr.w	$00ff8dc0
	tst.l	d0
	bne.s	Lff89b0
	bsr.w	$00ff8e04
	btst.l	#$1b,d0
	bne.s	Lff89b0
	and.b	#$c0,d1
	or.b	#$06,d1
Lff8976:
	bsr.w	$00ff8e20
	rol.l	#8,d2
	addq.l	#2,a0
	move.l	d2,(a0)+
	ror.l	#8,d2
	move.b	d2,(a0)+
	move.b	d7,(a0)+
	move.b	d6,(a0)
	bsr.w	$00ff8e46
	bsr.w	$00ff8e9c
	bsr.w	$00ff8e66
	bsr.w	$00ff8a80
	btst.l	#$0e,d0
	bne.s	Lff89aa
	btst.l	#$1e,d0
	beq.s	Lff89b4
	btst.l	#$1b,d0
	bne.s	Lff89b0
Lff89aa:
	bsr.s	$00ff8a26
	dbra.w	d4,Lff8976
Lff89b0:
	bra.w	$00ff8f50
Lff89b4:
	lea.l	(Lff89bc,pc),a2
	bra.w	$00ff8d68
Lff89bc:
	.dc.b	$ff,$f4,$ff,$ba,$ff,$ba
Call_B_RECALI:
	btst.l	#$0c,d1
	beq.w	Lff90be
	cmp.b	#$ff,d1
	bne.s	Lff8a1c
	move.b	($09da),d0
	or.b	#$40,d0
	move.b	d0,($09da)
	bsr.w	Lff84e2
	move.b	#$1b,($00e90001)
	bsr.w	Lff84e2
	move.b	d0,($00e90003)
	bsr.s	Lff8a1c
	move.l	d0,-(a7)
	move.b	($09da),d0
	and.b	#$bf,d0
	move.b	d0,($09da)
	bsr.w	Lff84e2
	move.b	#$1b,($00e90001)
	bsr.w	Lff84e2
	move.b	d0,($00e90003)
	move.l	(a7)+,d0
	rts

Lff8a1c:
	bsr.w	$00ff8ed6
	bsr.s	Lff8a62
	bra.w	Lff8f54
	move.l	d0,-(a7)
	and.l	#$0035ff00,d0
	beq.s	Lff8a5e
	cmp.b	#$05,d4
	bcc.s	Lff8a5e
	move.l	($09ee),-(a7)
	move.l	($09f2),-(a7)
	move.w	($09f6),-(a7)
	bsr.s	Lff8a62
	move.l	#$0000012c,d0
	bsr.w	Lff0d12
	bsr.w	Lff8712
	move.w	(a7)+,($09f6)
	move.l	(a7)+,($09f2)
	move.l	(a7)+,($09ee)
Lff8a5e:
	move.l	(a7)+,d0
	rts

Lff8a62:
	move.l	d1,-(a7)
	move.b	#$07,d1
	bsr.w	$00ff8e20
	moveq.l	#$01,d0
	bsr.s	Lff8a74
	move.l	(a7)+,d1
	rts

Lff8a74:
	move.l	d1,-(a7)
Lff8a76:
	bsr.w	Lff8ea2
	bsr.w	Lff8e8e
	move.l	(a7)+,d1
	move.w	d1,d0
	clr.b	d0
	lsl.w	#6,d0
	rol.w	#5,d0
	lea.l	($0c90),a0
	adda.w	d0,a0
	move.l	(a0),d0
	rts

Call_B_ASSIGN:
	btst.l	#$0c,d1
	beq.w	Lff90c4
	bra.w	Call_Unused
Call_B_WRITED:
	btst.l	#$0c,d1
	beq.w	Call_Unused
	bsr.w	$00ff8ed6
	movem.l	d1/d4-d7/a2,-(a7)
	bsr.w	$00ff8dc0
	tst.l	d0
	bne.w	Lff893a
	bsr.w	$00ff8e04
	btst.l	#$1b,d0
	bne.w	Lff893a
	and.b	#$c0,d1
	or.b	#$09,d1
	bra.w	Lff88fe
Call_B_READID:
	btst.l	#$0c,d1
	beq.w	Call_Unused
	bsr.w	$00ff8ed6
	movem.l	d1/d4,-(a7)
	bsr.w	$00ff8e04
	btst.l	#$1b,d0
	bne.s	Lff8b22
	and.b	#$c0,d1
	or.b	#$0a,d1
Lff8af2:
	bsr.w	$00ff8e20
	moveq.l	#$01,d0
	bsr.w	Lff8ea2
	bsr.w	Lff8e8e
	bsr.w	$00ff8a80
	tst.l	d2
	bpl.s	Lff8b12
	move.l	($0002,a0),d2
	lsl.l	#8,d2
	move.b	($0006,a0),d2
Lff8b12:
	btst.l	#$1e,d0
	beq.s	Lff8b22
	btst.l	#$1b,d0
	bne.s	Lff8b22
	dbra.w	d4,Lff8af2
Lff8b22:
	movem.l	(a7)+,d1/d4
	bra.w	Lff8f54
Call_B_BADFMT:
	btst.l	#$0c,d1
	beq.w	Lff90ca
	bra.w	Call_Unused
Call_B_READDL:
	btst.l	#$0c,d1
	beq.w	Call_Unused
	bsr.w	$00ff8ed6
	movem.l	d1/d4-d7/a2,-(a7)
	bsr.w	$00ff8dc0
	tst.l	d0
	bne.w	Lff89b0
	bsr.w	$00ff8e04
	btst.l	#$1b,d0
	bne.w	Lff89b0
	and.b	#$c0,d1
	or.b	#$0c,d1
	bra.w	Lff8976
Lff8b68:
	move.l	($0d00),d0
	beq.s	Lff8b76
	movea.l	d0,a0
	moveq.l	#$01,d0
	jsr	(a0)
	bra.s	Lff8ba0
Lff8b76:
	moveq.l	#$ff,d0
	bra.w	Lff8c18
Call_B_FORMAT:
	btst.l	#$0c,d1
	beq.w	Lff90d0
	bsr.w	$00ff8ed6
	movem.l	d1/d4-d6,-(a7)
	move.w	d1,d0
	lsr.w	#8,d0
	lsr.w	#5,d0
	add.w	d0,d0
	lea.l	(Lff8f68,pc),a0
	move.w	(a0,d0.w),d0
	beq.s	Lff8b68
	adda.w	d0,a0
Lff8ba0:
	moveq.l	#$ff,d0
	move.l	d2,d4
	swap.w	d4
	lsr.w	#8,d4
	cmp.w	(a0)+,d4
	bhi.s	Lff8c18
	lsl.w	#2,d4
	adda.w	d4,a0
	btst.l	#$06,d1
	beq.s	Lff8bb8
	addq.l	#2,a0
Lff8bb8:
	moveq.l	#$00,d6
	move.w	(a0),d6
	beq.s	Lff8c18
	moveq.l	#$00,d5
	move.w	d6,d5
	lsr.w	#8,d5
	asl.l	#2,d5
	asl.l	#8,d6
	move.l	d2,d4
	and.l	#$ff0000ff,d4
	or.l	d4,d6
	bsr.w	$00ff8e04
	btst.l	#$1b,d0
	bne.s	Lff8c18
	and.b	#$c0,d1
	or.b	#$0d,d1
	bsr.w	$00ff8e20
	move.l	d6,($0002,a0)
Lff8bec:
	bsr.w	Lff8e42
	moveq.l	#$05,d0
	bsr.w	Lff8e9e
	bsr.w	$00ff8e66
	bsr.w	$00ff8a80
	btst.l	#$1e,d0
	beq.s	Lff8c18
	btst.l	#$1b,d0
	bne.s	Lff8c18
	btst.l	#$11,d0
	bne.s	Lff8c18
	bsr.w	$00ff8a26
	dbra.w	d4,Lff8bec
Lff8c18:
	movem.l	(a7)+,d1/d4-d6
	bra.w	Lff8f54
Call_B_DRVCHK:
	btst.l	#$0c,d1
	beq.w	Call_Unused
Lff8c28:
	movem.l	d1/a1/a4,-(a7)
	lsr.w	#8,d1
	and.w	#$0003,d1
	cmp.w	#$0008,d2
	beq.s	Lff8c5e
	lea.l	($09e2),a1
	adda.w	d1,a1
	cmp.w	#$0008,d2
	bcc.s	Lff8c56
	move.w	d2,d0
	add.w	d0,d0
	beq.s	Lff8c70
	lea.l	(Lff8cca,pc),a4
	move.w	(a4,d0.w),d0
	jsr	(a4,d0.w)
Lff8c56:
	bsr.s	Lff8c9c
Lff8c58:
	movem.l	(a7)+,d1/a1/a4
	rts

Lff8c5e:
	lea.l	($09e7),a4
	adda.w	d1,a4
	adda.w	d1,a4
	moveq.l	#$00,d0
	move.b	(a4),d0
	move.b	#$01,(a4)
	bra.s	Lff8c58
Lff8c70:
	bsr.s	Lff8c9c
	btst.l	#$01,d0
	beq.s	Lff8c96
	move.l	d0,-(a7)
	asl.w	#8,d1
	or.w	#$9000,d1
	bsr.w	Lff8894
	rol.l	#5,d0
	and.l	#$0000000c,d0
	eori.b	#$04,d0
	move.l	(a7)+,d1
	or.l	d1,d0
	bra.s	Lff8c58
Lff8c96:
	or.b	#$0c,d0
	bra.s	Lff8c58
Lff8c9c:
	move.w	d1,-(a7)
	and.w	#$0003,d1
	move.b	(a1),d0
	and.b	#$c0,d0
	move.w	d0,-(a7)
	bset.l	d1,d0
	move.b	d0,($00e94005)
	moveq.l	#$00,d0
	move.b	($00e94005),d0
	lsr.w	#6,d0
	or.b	(a1),d0
	move.w	(a7)+,d1
	move.b	d1,($00e94005)
	move.w	(a7)+,d1
	rts

Lff8cca:
	.dc.b	$00,$7c,$00,$54,$00,$30,$00,$2c
	.dc.b	$00,$14,$00,$10,$00,$22,$00,$1e
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
Call_B_EJECT:
	btst.l	#$0c,d1
	beq.w	Lff9114
	move.l	d2,-(a7)
	moveq.l	#$07,d2
	bsr.w	Lff8c28
	moveq.l	#$03,d2
	bsr.w	Lff8c28
	moveq.l	#$01,d2
	bsr.w	Lff8c28
	move.l	(a7)+,d2
	rts

	btst.l	#$1f,d0
	bne.s	Lff8da4
	adda.l	d5,a1
	sub.l	d5,d3
	bls.s	Lff8da4
	move.l	d4,d0
	swap.w	d0
	move.w	d0,d4
	move.w	d7,d0
	lsr.w	#8,d0
	addq.b	#1,d2
	cmp.b	d2,d0
	bcc.s	Lff8d9e
	move.b	#$01,d2
	bchg.l	#$08,d2
	beq.s	Lff8da8
	add.l	#$00010000,d2
	bsr.w	Lff8712
	btst.l	#$1b,d0
	bne.s	Lff8da4
Lff8d9e:
	adda.w	($0002,a2),a2
	jmp	(a2)

Lff8da4:
	adda.w	(a2),a2
	jmp	(a2)

Lff8da8:
	adda.w	($0004,a2),a2
	jmp	(a2)

Lff8dae:
	move.l	($0d00),d0
	beq.s	Lff8dbc
	movea.l	d0,a0
	moveq.l	#$00,d0
	jsr	(a0)
	bra.s	Lff8dd4
Lff8dbc:
	moveq.l	#$ff,d0
	rts

	move.w	d1,d0
	lsr.w	#8,d0
	lsr.w	#5,d0
	add.w	d0,d0
	lea.l	(Lff8fd4,pc),a0
	move.w	(a0,d0.w),d0
	beq.s	Lff8dae
	adda.w	d0,a0
Lff8dd4:
	move.l	d2,d4
	swap.w	d4
	lsr.w	#8,d4
	cmp.w	(a0)+,d4
	bhi.s	Lff8dbc
	lsl.w	#3,d4
	adda.w	d4,a0
	moveq.l	#$00,d5
	move.w	(a0)+,d5
	move.w	(a0)+,d6
	btst.l	#$06,d1
	beq.s	Lff8df0
	addq.l	#2,a0
Lff8df0:
	move.w	(a0),d7
	beq.s	Lff8dbc
	move.w	d7,d0
	lsr.w	#8,d0
	tst.b	d2
	beq.s	Lff8dbc
	cmp.b	d2,d0
	bcs.s	Lff8dbc
	moveq.l	#$00,d0
	rts

	moveq.l	#$00,d0
	moveq.l	#$00,d4
	btst.l	#$05,d1
	beq.s	Lff8e14
	move.l	#$00090009,d4
Lff8e14:
	btst.l	#$04,d1
	beq.s	Lff8e1e
	bsr.w	Lff8712
Lff8e1e:
	rts

	move.l	d1,-(a7)
	lea.l	($09ee),a0
	move.b	d1,(a0)
	lsr.w	#2,d1
	lsr.b	#6,d1
	btst.l	#$08,d2
	beq.s	Lff8e36
	bset.l	#$02,d1
Lff8e36:
	move.b	d1,($0001,a0)
	move.l	(a7)+,d1
	rts

Lff8e3e:
	.dc.b	$00,$e8,$40,$00
Lff8e42:
	moveq.l	#$32,d0
	bra.s	Lff8e48
	moveq.l	#$b2,d0
Lff8e48:
	movea.l	(Lff8e3e,pc),a0
	st.b	(a0)
	move.b	d0,($0005,a0)
	move.l	a1,($000c,a0)
	move.w	d5,($000a,a0)
	bsr.w	Lff8284
	move.b	#$80,($0007,a0)
	rts

	movea.l	(Lff8e3e,pc),a0
	btst.b	#$04,(a0)+
	beq.s	Lff8e74
	move.b	(a0),d0
	bra.s	Lff8e80
Lff8e74:
	move.b	($00e94001),d0
	and.b	#$1f,d0
	bne.s	Lff8e74
Lff8e80:
	tst.b	-(a0)
	bmi.s	Lff8e8a
	move.b	#$10,($0007,a0)
Lff8e8a:
	st.b	(a0)
	rts

Lff8e8e:
	move.b	($00e94001),d0
	and.b	#$1f,d0
	bne.s	Lff8e8e
	rts

	moveq.l	#$08,d0
Lff8e9e:
	lea.l	($09ee),a0
Lff8ea2:
	movem.l	d1/a1-a2,-(a7)
	lea.l	($00e94001),a1
	lea.l	($0002,a1),a2
	move.w	sr,-(a7)
	ori.w	#$0700,sr
Lff8eb6:
	move.b	(a1),d1
	btst.l	#$04,d1
	bne.s	Lff8eb6
Lff8ebe:
	move.b	(a1),d1
	bpl.s	Lff8ebe
	btst.l	#$06,d1
	bne.s	Lff8ebe
	move.b	(a0)+,(a2)
	dbra.w	d0,Lff8ebe
	move.w	(a7)+,sr
	movem.l	(a7)+,d1/a1-a2
	rts

	tst.b	($09e1)
	bmi.s	Lff8ee6
	movem.l	d0-d1/a0,-(a7)
	bsr.s	Lff8ef0
	movem.l	(a7)+,d0-d1/a0
Lff8ee6:
	rts

Lff8ee8:
	.dc.b	$01,$01,$00,$00,$00,$01,$00,$00
Lff8ef0:
	move.l	($0d04),d0
	exg.l	d0,a0
	beq.s	Lff8efa
	jsr	(a0)
Lff8efa:
	move.w	d1,d0
	lsr.w	#8,d0
	beq.s	Lff8f54
	and.b	#$03,d0
	or.b	#$80,d0
	swap.w	d0
	move.w	d1,d0
	lsr.w	#8,d0
	lsr.w	#5,d0
	move.b	(Lff8ee8,pc,d0.w),d0
	beq.s	Lff8f1a
	bset.l	#$14,d0
Lff8f1a:
	swap.w	d0
	bset.b	#$07,($09e1)
	move.b	d0,($00e94007)
	btst.b	#$06,($09e1)
	bne.s	Lff8f48
	move.w	($09c2),($09c4)
Lff8f36:
	bsr.w	Lff889e
	btst.l	#$1d,d0
	bne.s	Lff8f48
	cmpi.w	#$0064,($09c4)
	bcc.s	Lff8f36
Lff8f48:
	bclr.b	#$06,($09e1)
	rts

	movem.l	(a7)+,d1/d4-d7/a2
Lff8f54:
	tst.b	($09e1)
	beq.s	Lff8f66
	move.w	($09c2),($09c4)
	move.b	#$40,($09e1)
Lff8f66:
	rts

Lff8f68:
	.dc.w	$002e,$005a,$0000,$0048
	.dc.w	$0010,$0000,$0000,$0000
	.dc.w	$0006,$1a1b,$0000,$0f2a
	.dc.w	$1a36,$083a,$0f54,$048a
	.dc.w	$0874,$02ff,$04ff,$01ff
	.dc.w	$02ff,$0000,$01ff,$0005
	.dc.w	$1019,$0000,$0830,$1032
	.dc.w	$0487,$0850,$02ff,$04f0
	.dc.w	$01ff,$02ff,$0000,$01ff
	.dc.w	$0003,$201b,$0000,$122a
	.dc.w	$2036,$0a3a,$126c,$0000
	.dc.w	$0a74,$0003,$101b,$0000
	.dc.w	$092a,$1036,$053a,$0954
	.dc.w	$0000,$0574
Lff8fd4:
	.dc.w	$004a,$009e,$0000,$007c
	.dc.w	$0010,$0000,$0000,$0000
	.dc.w	$0006,$0080,$0080,$1a07
	.dc.w	$0000,$0100,$00ff,$0f0e
	.dc.w	$1a0e,$0200,$00ff,$081b
	.dc.w	$0f1b,$0400,$00ff,$0447
	.dc.w	$0835,$0800,$00ff,$02c8
	.dc.w	$0499,$1000,$00ff,$01c8
	.dc.w	$02c8,$2000,$00ff,$0000
	.dc.w	$01c8,$0005,$0080,$0080
	.dc.w	$1010,$0000,$0100,$00ff
	.dc.w	$0818,$1020,$0200,$00ff
	.dc.w	$0446,$082a,$0400,$00ff
	.dc.w	$02c8,$0480,$0800,$00ff
	.dc.w	$01c8,$02c8,$1000,$00ff
	.dc.w	$0000,$01c8,$0003,$0080
	.dc.w	$0080,$2007,$0000,$0100
	.dc.w	$00ff,$120e,$200e,$0200
	.dc.w	$00ff,$0a1b,$121b,$0400
	.dc.w	$00ff,$0000,$0a35,$0003
	.dc.w	$0080,$0080,$1007,$0000
	.dc.w	$0100,$00ff,$090e,$100e
	.dc.w	$0200,$00ff,$051b,$091b
	.dc.w	$0400,$00ff,$0000,$0535
	.dc.w	$03d0,$1000,$48e7,$f842
	.dc.w	$323c,$8000,$740f,$43f8
	.dc.w	$0000,$6100,$01a8,$d27c
	.dc.w	$0100,$51ca,$fff2,$4cdf
	.dc.w	$421f,$4e75
Lff90b8:
	lea.l	(Lffd9f8,pc),a0
	bra.s	Lff90da
Lff90be:
	lea.l	(Lffd40e,pc),a0
	bra.s	Lff90da
Lff90c4:
	lea.l	(Lffdade,pc),a0
	bra.s	Lff90da
Lff90ca:
	lea.l	(Lffdaa6,pc),a0
	bra.s	Lff90da
Lff90d0:
	lea.l	(Lffda6e,pc),a0
	bra.s	Lff90da
Lff90d6:
	lea.l	(Lffd3f0,pc),a0
Lff90da:
	movem.l	d1/d4/a5,-(a7)
	movea.l	a0,a5
	moveq.l	#$00,d4
	move.w	d1,d4
	lsr.w	#8,d4
	lsr.w	#1,d4
	bcc.s	Lff90ee
	bset.l	#$10,d4
Lff90ee:
	andi.w	#$0007,d4
	btst.b	d4,($00ed0071)
	beq.s	Lff910a
	jsr	(a5)
	btst.l	#$01,d0
	bne.s	Lff910c
	moveq.l	#$00,d0
Lff9104:
	movem.l	(a7)+,d1/d4/a5
	rts

Lff910a:
	moveq.l	#$ff,d0
Lff910c:
	ori.l	#$ffffff00,d0
	bra.s	Lff9104
Lff9114:
	movem.l	d1-d7/a1/a4,-(a7)
	moveq.l	#$00,d4
	move.w	d1,d4
	move.l	d4,d1
	lsr.w	#8,d4
	lsr.w	#1,d4
	bcc.s	Lff9128
	bset.l	#$10,d4
Lff9128:
	andi.w	#$0007,d4
	btst.b	d4,($00ed0071)
	beq.s	Lff9176
	lea.l	($09fe),a4
	move.w	d1,d0
	ror.w	#8,d0
	and.w	#$000f,d0
	move.b	(a4,d0.w),d0
	tst.b	d0
	bmi.s	Lff9176
	beq.s	Lff9176
	move.l	#$00015660,d2
	cmp.b	#$14,d0
	beq.s	Lff9170
	move.l	#$0002acc0,d2
	cmp.b	#$28,d0
	beq.s	Lff9170
	move.l	#$0000af50,d2
	cmp.b	#$0a,d0
	beq.s	Lff9170
	bra.s	Lff9176
Lff9170:
	bsr.w	Lffd9f8
	moveq.l	#$00,d0
Lff9176:
	movem.l	(a7)+,d1-d7/a1/a4
	rts

Lff917c:
	lea.l	(Lffd742,pc),a0
	bra.s	Lff9186
Lff9182:
	lea.l	(Lffd79c,pc),a0
Lff9186:
	movem.l	d1-d6/a1-a2/a5,-(a7)
	movea.l	a0,a5
	moveq.l	#$00,d4
	move.w	d1,d4
	lsr.w	#8,d4
	lsr.w	#1,d4
	bcc.s	Lff919a
	bset.l	#$10,d4
Lff919a:
	andi.w	#$0007,d4
	btst.b	d4,($00ed0071)
	beq.s	Lff91de
	move.l	d3,d6
Lff91a8:
	move.l	d6,d3
	add.l	#$000000ff,d3
	lsr.l	#8,d3
	cmp.l	#$00000100,d3
	bls.s	Lff91c0
	move.l	#$00000100,d3
Lff91c0:
	moveq.l	#$00,d5
	jsr	(a5)
	btst.l	#$01,d0
	bne.s	Lff91e0
	add.l	d3,d2
	move.l	d3,d1
	lsl.l	#8,d1
	adda.l	d1,a1
	sub.l	d1,d6
	bhi.s	Lff91a8
	moveq.l	#$00,d0
Lff91d8:
	movem.l	(a7)+,d1-d6/a1-a2/a5
	rts

Lff91de:
	moveq.l	#$ff,d0
Lff91e0:
	ori.l	#$ffffff00,d0
	bra.s	Lff91d8
Lff91e8:
	link.w	a4,#-$0100
	movem.l	d1-d6/a1-a2,-(a7)
	moveq.l	#$00,d4
	move.w	d1,d4
	lsr.w	#8,d4
	lsr.w	#1,d4
	bcc.s	Lff91fe
	bset.l	#$10,d4
Lff91fe:
	andi.w	#$0007,d4
	btst.b	d4,($00ed0071)
	beq.s	Lff924c
	movea.l	a1,a2
	move.l	d3,d6
Lff920e:
	move.l	d6,d3
	cmp.l	#$00000100,d3
	bcs.s	Lff921e
	move.l	#$00000100,d3
Lff921e:
	lea.l	(-$0100,a4),a1
	bsr.w	Lff917c
	move.l	d3,d5
	subq.l	#1,d5
Lff922a:
	cmpm.b	(a1)+,(a2)+
	bne.s	Lff9242
	dbra.w	d5,Lff922a
	addq.l	#1,d2
	sub.l	d3,d6
	bhi.s	Lff920e
	moveq.l	#$00,d0
Lff923a:
	movem.l	(a7)+,d1-d6/a1-a2
	unlk	a4
	rts

Lff9242:
	moveq.l	#$fe,d0
	ori.l	#$ffffff00,d0
	bra.s	Lff923a
Lff924c:
	moveq.l	#$ff,d0
	bra.s	Lff923a
Lff9250:
	link.w	a4,#-$0100
	movem.l	d1-d4/a1/a5,-(a7)
	moveq.l	#$00,d4
	move.w	d1,d4
	lsr.w	#8,d4
	lsr.w	#1,d4
	bcc.s	Lff9266
	bset.l	#$10,d4
Lff9266:
	andi.w	#$0007,d4
	btst.b	d4,($00ed0071)
	beq.s	Lff92b2
	move.l	a1,d0
	beq.s	Lff92bc
Lff9276:
	moveq.l	#$0a,d3
	bsr.w	Lffda2c
	btst.l	#$01,d0
	bne.s	Lff92b4
	lea.l	($09fe),a5
	move.w	d1,d0
	ror.w	#8,d0
	and.w	#$000f,d0
	adda.w	d0,a5
	moveq.l	#$28,d0
	cmpi.b	#$07,($0003,a1)
	beq.s	Lff92a6
	moveq.l	#$14,d0
	cmpi.b	#$02,($0004,a1)
	beq.s	Lff92a6
	moveq.l	#$0a,d0
Lff92a6:
	move.b	d0,(a5)
	moveq.l	#$00,d0
Lff92aa:
	movem.l	(a7)+,d1-d4/a1/a5
	unlk	a4
	rts

Lff92b2:
	moveq.l	#$ff,d0
Lff92b4:
	ori.l	#$ffffff00,d0
	bra.s	Lff92aa
Lff92bc:
	moveq.l	#$0a,d3
	lea.l	(Lff9330,pc),a1
	bsr.w	Lffda2c
	btst.l	#$01,d0
	bne.s	Lff92b4
	lea.l	(-$0100,a4),a1
	moveq.l	#$04,d2
	moveq.l	#$01,d3
	moveq.l	#$00,d5
	bsr.w	Lffd742
	btst.l	#$01,d0
	bne.s	Lff92b4
	lea.l	(-$0100,a4),a2
	cmpi.l	#$5836384b,(a2)+
	bne.s	Lff92b4
	lea.l	(Lff9312,pc),a1
	move.l	(a2),d0
	cmp.l	#$00009fd9,d0
	bcs.w	Lff9276
	lea.l	($000a,a1),a1
	cmp.l	#$00013d1d,d0
	bcs.w	Lff9276
	lea.l	($000a,a1),a1
	bra.w	Lff9276
Lff9312:
	.dc.b	$01,$01,$00,$03,$01,$35,$80,$00
	.dc.b	$00,$00,$01,$01,$00,$03,$02,$66
	.dc.b	$80,$00,$00,$00,$01,$01,$00,$07
	.dc.b	$02,$66,$80,$00,$00,$00
Lff9330:
	.dc.b	$01,$01,$00,$07,$02,$98,$80,$00
	.dc.b	$00,$00,$00,$0a
Lff933c:
	.dc.b	$00,$e9,$60,$20,$61,$00,$fd,$56
	.dc.b	$4e,$75
Lff9346:
	.dc.b	'SCSI',$00
Lff934b:
	.dc.b	$ff,$94,$be
Lff934e:
	.dc.b	$00,$ff,$cc,$b8,$48,$75,$6d,$61
	.dc.b	$6e,$36,$38,$6b,$61,$00,$01,$2c
	.dc.b	$4a,$80,$6a,$02,$70,$00,$28,$00
	.dc.b	$61,$00,$fd,$30,$09,$39,$00,$ed
	.dc.b	$00,$71,$66,$6e,$7c,$13,$61,$00
	.dc.b	$03,$0c,$52,$80,$66,$64,$70,$f5
	.dc.b	$72,$24,$4e,$4f,$4a,$80,$67,$5c
	.dc.b	$b0,$bc,$ff,$ff,$ff,$ff,$67,$4a
	.dc.b	$b0,$bc,$00,$00,$00,$08,$67,$42
	.dc.b	$b0,$bc,$00,$00,$00,$02,$66,$42
	.dc.b	$70,$f5,$72,$2c,$76,$03,$43,$f8
	.dc.b	$20,$00,$4e,$4f,$4a,$80,$66,$32
	.dc.b	$43,$f8,$20,$00,$10,$11,$02,$00
	.dc.b	$00,$70,$0c,$00,$00,$70,$66,$22
	.dc.b	$10,$29,$00,$02,$67,$b0,$b0,$3c
	.dc.b	$00,$01,$67,$aa,$b0,$3c,$00,$06
	.dc.b	$67,$a4,$b0,$3c,$00,$02,$67,$9e
	.dc.b	$60,$08,$51,$ce,$00,$04,$60,$02
	.dc.b	$60,$94
Lff93e0:
	rts

Lff93e2:
	bsr.w	Lff967a
	addq.l	#1,d0
	bne.s	Lff93e0
	lea.l	($2000),a1
	moveq.l	#$f5,d0
	moveq.l	#$20,d1
	moveq.l	#$01,d3
	trap	#15
	tst.l	d0
	bne.s	Lff93e0
	btst.b	#$06,($00ed0070)
	bne.s	Lff9422
	tst.b	(a1)
	beq.s	Lff9422
	cmpi.b	#$04,(a1)
	beq.s	Lff9422
	cmpi.b	#$05,(a1)
	beq.s	Lff9422
	cmpi.b	#$07,(a1)
	beq.s	Lff9422
	cmpi.b	#$84,(a1)
	beq.s	Lff9422
	bra.s	Lff93e0
Lff9422:
	moveq.l	#$f5,d0
	moveq.l	#$2b,d1
	trap	#15
	tst.l	d0
	bne.s	Lff93e0
	moveq.l	#$f5,d0
	moveq.l	#$25,d1
	trap	#15
	tst.l	d0
	bne.s	Lff93e0
	move.l	($0004,a1),d5
	lsr.l	#8,d5
	lsr.l	#1,d5
	moveq.l	#$00,d2
	moveq.l	#$04,d3
	bsr.w	Lff969c
	moveq.l	#$f5,d0
	moveq.l	#$21,d1
	trap	#15
	tst.l	d0
	bne.s	Lff93e0
	cmpi.l	#$58363853,($0000.w,a1)
	bne.s	Lff93e0
	cmpi.l	#$43534931,($0004,a1)
	bne.w	Lff93e0
	moveq.l	#$04,d2
	moveq.l	#$04,d3
	bsr.w	Lff969c
	moveq.l	#$f5,d0
	moveq.l	#$21,d1
	trap	#15
	tst.l	d0
	bne.w	Lff93e0
	cmpi.b	#$60,(a1)
	bne.w	Lff93e0
	jsr	(a1)
	bra.w	Lff93e0
Lff9488:
	IOCS	_BOOTINF
	andi.l	#Lffffff,d0
	cmp.l	#$00000100,d0
	bcs.s	Lff94b2
	movea.l	d0,a0
	movea.l	(a0),a0
	cmpi.l	#$53435349,(-$0014,a0)
	bne.s	Lff94b2
	andi.l	#$0000001f,d0
	lsr.l	#2,d0
	rts

Lff94b2:
	moveq.l	#$ff,d0
	rts

Lff94b6:
	bset.b	d2,($0cc3)
	addq.w	#1,d2
	bra.s	Lff94d2
Lff94be:
	movem.l	d0-d1/d3-d7/a0-a6,-(a7)
	bsr.s	Lff9488
	tst.l	d0
	bmi.s	Lff94d0
	move.b	d0,d7
	cmpi.w	#$0008,d0
	bcs.s	Lff94d2
Lff94d0:
	moveq.l	#$ff,d7
Lff94d2:
	cmp.w	#$0008,d2
	beq.w	Lff9634
	bsr.w	Lff967a
	addq.l	#1,d0
	bne.w	Lff9634
Lff94e4:
	moveq.l	#$00,d4
	move.w	d2,d4
	btst.b	d4,($00ed0071)
	bne.s	Lff94b6
	btst.b	d4,($0cc3)
	bne.s	Lff94b6
	move.b	($00ed0070),d0
	andi.b	#$07,d0
	cmp.b	d4,d0
	beq.s	Lff94b6
	moveq.l	#$f5,d0
	moveq.l	#$24,d1
	trap	#15
	cmp.l	#$00000002,d0
	beq.s	Lff951e
	cmp.l	#$00000008,d0
	beq.s	Lff94e4
	tst.l	d0
	bne.s	Lff94b6
Lff951e:
	moveq.l	#$f5,d0
	moveq.l	#$2c,d1
	moveq.l	#$03,d3
	trap	#15
	tst.l	d0
	bne.s	Lff94b6
	moveq.l	#$f5,d0
	moveq.l	#$20,d1
	moveq.l	#$24,d3
	trap	#15
	tst.l	d0
	bne.w	Lff94b6
	btst.b	#$06,($00ed0070)
	bne.s	Lff9562
	tst.b	(a1)
	beq.s	Lff9562
	cmpi.b	#$04,(a1)
	beq.s	Lff9562
	cmpi.b	#$05,(a1)
	beq.s	Lff9562
	cmpi.b	#$07,(a1)
	beq.s	Lff9562
	cmpi.b	#$84,(a1)
	beq.s	Lff9562
	bra.w	Lff94b6
Lff9562:
	moveq.l	#$f5,d0
	moveq.l	#$25,d1
	trap	#15
	tst.l	d0
	bne.w	Lff94b6
	move.l	d2,d6
	move.l	($0004,a1),d5
	lsr.l	#8,d5
	lsr.l	#1,d5
	moveq.l	#$08,d2
	moveq.l	#$04,d3
	bsr.w	Lff969c
	moveq.l	#$f5,d0
	moveq.l	#$21,d1
	trap	#15
	move.l	d6,d2
	tst.l	d0
	bne.w	Lff94b6
	cmpi.l	#$5836384b,(a1)
	bne.w	Lff94b6
	swap.w	d2
	cmp.b	d7,d4
	bhi.s	Lff95a4
	bsr.w	Lff9638
	add.w	d3,d2
Lff95a4:
	swap.w	d2
	move.l	d2,d6
	moveq.l	#$00,d2
	moveq.l	#$04,d3
	bsr.w	Lff969c
	moveq.l	#$f5,d0
	moveq.l	#$21,d1
	trap	#15
	move.l	d6,d2
	tst.l	d0
	bne.w	Lff94b6
	cmpi.l	#$58363853,($0000.w,a1)
	bne.w	Lff94b6
	cmpi.l	#$43534931,($0004,a1)
	bne.w	Lff94b6
	moveq.l	#$0c,d2
	moveq.l	#$34,d3
	bsr.w	Lff969c
	moveq.l	#$f5,d0
	moveq.l	#$21,d1
	trap	#15
	move.l	d6,d2
	tst.l	d0
	bne.w	Lff94b6
Lff95ec:
	cmpi.l	#$01534348,($000e,a1)
	bne.w	Lff94b6
	cmpi.l	#$4449534b,($0012,a1)
	bne.w	Lff94b6
	move.l	a1,d0
	add.l	d0,($0006,a1)
	add.l	d0,($000a,a1)
	move.l	(a1),d0
	cmp.l	#$ffffffff,d0
	beq.s	Lff9620
	add.l	a1,d0
	move.l	d0,(a1)
	movea.l	d0,a1
	bra.s	Lff95ec
Lff9620:
	swap.w	d2
	move.b	d2,($0016,a1)
	swap.w	d2
	bclr.b	d2,($0cc3)
	addq.w	#1,d2
Lff962e:
	movem.l	(a7)+,d0-d1/d3-d7/a0-a6
	rts

Lff9634:
	moveq.l	#$ff,d2
	bra.s	Lff962e
Lff9638:
	movem.l	d1-d2/a1,-(a7)
	seq.b	d1
	moveq.l	#$0e,d2
	moveq.l	#$00,d3
Lff9642:
	lea.l	($0010,a1),a1
	tst.b	(a1)
	beq.s	Lff9670
	cmpi.l	#$48756d61,(a1)
	bne.s	Lff9670
	cmpi.l	#$6e36386b,($0004,a1)
	bne.s	Lff9670
	move.b	($0008,a1),d0
	btst.l	#$00,d0
	bne.s	Lff9670
	addq.w	#1,d3
	tst.b	d1
	beq.s	Lff9670
	tst.b	d0
	beq.s	Lff9674
Lff9670:
	dbra.w	d2,Lff9642
Lff9674:
	movem.l	(a7)+,d1-d2/a1
	rts

Lff967a:
	moveq.l	#$ff,d0
	tst.b	($0cc2)
	bne.s	Lff969a
	move.l	d4,-(a7)
	st.b	($0cc2)
	move.b	($00ed0070),d4
	andi.b	#$07,d4
	moveq.l	#$f5,d0
	moveq.l	#$24,d1
	trap	#15
	move.l	(a7)+,d4
Lff969a:
	rts

Lff969c:
	cmpi.w	#$0003,d5
	bcc.s	Lff96a8
	lsr.l	d5,d2
	lsr.l	d5,d3
	rts

Lff96a8:
	lsr.l	#2,d2
	lsr.l	#2,d3
	rts

Call_B_PUTC:
	move.l	d1,-(a7)
	bsr.w	Lff9872
	move.l	(a7)+,d1
	move.l	($0974),d0
	rts

Call_B_PRINT:
	movem.l	d1/a2,-(a7)
	lea.l	(Lff9872,pc),a2
	bra.s	Lff96c8
Lff96c6:
	jsr	(a2)
Lff96c8:
	moveq.l	#$00,d1
	move.b	(a1)+,d1
	bne.s	Lff96c6
	move.l	($0974),d0
	movem.l	(a7)+,d1/a2
	rts

Call_B_COLOR:
	moveq.l	#$00,d0
	lea.l	($0994),a0
	move.b	(a0),d0
	cmp.w	#$ffff,d1
	beq.s	Lff96ee
	cmp.w	#$0010,d1
	bcc.s	Lff96f0
	move.b	d1,(a0)
Lff96ee:
	rts

Lff96f0:
	moveq.l	#$ff,d0
	rts

Call_B_LOCATE:
	move.l	($0974),d0
	cmp.w	#$ffff,d1
	beq.s	Lff9720
	cmp.w	($0970),d1
	bhi.s	Lff96f0
	cmp.w	($0972),d2
	bhi.s	Lff96f0
	bsr.w	Call_B_CUROFF
	move.l	d0,-(a7)
	move.w	d1,($0974)
	move.w	d2,($0976)
	bsr.w	Call_B_CURON
	move.l	(a7)+,d0
	rts

Lff9720:
	move.l	d0,d1
	rts

Call_B_DOWN_S:
	bsr.w	Call_B_CUROFF
	bsr.w	Lffa458
	bra.w	Call_B_CURON
Call_B_UP_S:
	bsr.w	Call_B_CUROFF
	bsr.w	Lffa472
	bra.w	Call_B_CURON
Call_B_UP:
	move.l	d1,-(a7)
	bsr.w	Call_B_CUROFF
	bsr.w	Lffa488
	bra.s	Lff976a
Call_B_DOWN:
	move.l	d1,-(a7)
	bsr.w	Call_B_CUROFF
	bsr.w	Lffa4a4
	bra.s	Lff976a
Call_B_RIGHT:
	move.l	d1,-(a7)
	bsr.w	Call_B_CUROFF
	bsr.w	Lffa4c0
	bra.s	Lff976a
Call_B_LEFT:
	move.l	d1,-(a7)
	bsr.w	Call_B_CUROFF
	bsr.w	Lffa4d8
Lff976a:
	bsr.w	Call_B_CURON
	move.l	(a7)+,d1
	rts

Call_B_CLR_ST:
	movem.l	d1-d4/a1/a4,-(a7)
	bsr.w	Call_B_CUROFF
	bsr.w	Lffa4ee
	bra.s	Lff978c
Call_B_ERA_ST:
	movem.l	d1-d4/a1/a4,-(a7)
	bsr.w	Call_B_CUROFF
	bsr.w	Lffa52c
Lff978c:
	bsr.w	Call_B_CURON
	movem.l	(a7)+,d1-d4/a1/a4
	rts

Call_B_INS:
	movem.l	d1-d7/a1-a4,-(a7)
	bsr.w	Call_B_CUROFF
	bsr.w	Lffa5e0
	bra.s	Lff97b0
Call_B_DEL:
	movem.l	d1-d7/a1-a4,-(a7)
	bsr.w	Call_B_CUROFF
	bsr.w	Lffa68a
Lff97b0:
	bsr.w	Call_B_CURON
	movem.l	(a7)+,d1-d7/a1-a4
	rts

Call_B_CONSOL:
	bsr.w	Call_B_CUROFF
	move.l	($0948),d0
	cmp.l	#$ffffffff,d1
	beq.s	Lff97ee
	and.l	#$03ff03ff,d1
	move.l	d1,d0
	clr.w	d0
	swap.w	d0
	lsr.w	#3,d0
	and.l	#$0000fffc,d1
	lsl.l	#7,d1
	add.l	d0,d1
	move.l	($0948),d0
	move.l	d1,($0948)
	clr.l	($0974)
Lff97ee:
	move.l	d0,d1
	and.w	#$fe00,d1
	lsr.l	#7,d1
	and.l	#$0000007f,d0
	lsl.w	#3,d0
	swap.w	d0
	or.l	d0,d1
	move.l	($0970),d0
	cmp.l	#$ffffffff,d2
	beq.s	Lff981c
	and.l	#$007f003f,d2
	move.l	d2,($0970)
	clr.l	($0974)
Lff981c:
	move.l	d0,d2
	moveq.l	#$00,d0
	bra.w	Call_B_CURON
Call_B_PUTMES:
	moveq.l	#$00,d0
	move.b	(a1)+,d0
	bne.s	Lff982e
	subq.l	#1,a1
	moveq.l	#$20,d0
Lff982e:
	cmp.b	#$fe,d0
	bne.s	Lff9836
	moveq.l	#$20,d0
Lff9836:
	cmp.b	#$80,d0
	bcs.s	Lff9860
	beq.s	Lff9854
	cmp.b	#$a0,d0
	bcs.s	Lff9850
	cmp.b	#$e0,d0
	bcs.s	Lff9860
	cmp.b	#$f0,d0
	bcc.s	Lff9854
Lff9850:
	subq.w	#1,d4
	bmi.s	Lff986a
Lff9854:
	asl.w	#8,d0
	move.b	(a1)+,d0
	bne.s	Lff9860
	subq.l	#1,a1
	move.w	#$8140,d0
Lff9860:
	bsr.w	Lff9984
	dbra.w	d4,Call_B_PUTMES
	rts

Lff986a:
	moveq.l	#$20,d0
	bsr.w	Lff9984
	rts

Lff9872:
	lea.l	($0990),a0
	move.b	(a0),d0
	bne.s	Lff98a8
	cmpi.w	#$001b,d1
	beq.s	Lff989c
	cmpi.w	#$0100,d1
	bcc.s	Lff98b2
	cmpi.b	#$80,d1
	bcs.s	Lff98b4
	cmpi.b	#$a0,d1
	bcs.s	Lff9898
	cmpi.b	#$e0,d1
	bcs.s	Lff98b4
Lff9898:
	move.b	d1,(a0)
	rts

Lff989c:
	move.b	d1,(a0)
	lea.l	($0986),a0
	move.l	a0,($0982)
	rts

Lff98a8:
	cmpi.b	#$1b,d0
	bne.s	Lff9902
	bra.w	Lffa1ba
Lff98b2:
	bra.s	Lff990a
Lff98b4:
	movem.l	d2-d7/a0-a4,-(a7)
	bsr.w	Call_B_CUROFF
	move.w	($0974),d6
	move.w	($0976),d7
	cmpi.w	#$0008,d1
	beq.s	Lff98d0
	cmp.w	($0970),d6
	bhi.s	Lff98fc
Lff98d0:
	cmpi.w	#$0020,d1
	bcs.w	Lff9d70
	moveq.l	#$08,d2
	movea.l	($0458),a1
	jsr	(a1)
	movea.l	d0,a1
	sf.b	d4
Lff98e4:
	bsr.w	Lff99e8
	cmp.w	($0970),d6
	ble.s	Lff98f0
	bsr.s	Lff996a
Lff98f0:
	addq.w	#1,($0974)
	movem.l	(a7)+,d2-d7/a0-a4
	bra.w	Call_B_CURON
Lff98fc:
	pea.l	(Lff98d0,pc)
	bra.s	Lff996a
Lff9902:
	clr.b	(a0)
	lsl.w	#8,d0
	move.b	d1,d0
	move.w	d0,d1
Lff990a:
	movem.l	d2-d7/a0-a4,-(a7)
	bsr.w	Call_B_CUROFF
	move.w	($0974),d6
	move.w	($0976),d7
	cmp.w	($0970),d6
	seq.b	d5
	bhi.s	Lff9966
Lff9922:
	moveq.l	#$08,d2
	movea.l	($0458),a1
	jsr	(a1)
	movea.l	d0,a1
	tst.w	d1
	sne.b	d4
	beq.s	Lff98e4
	tst.b	d5
	beq.s	Lff994a
	movem.l	d4/a1,-(a7)
	lea.l	(Lff99d8,pc),a1
	moveq.l	#$00,d4
	bsr.w	Lff99e8
	bsr.s	Lff996a
	movem.l	(a7)+,d4/a1
Lff994a:
	bsr.w	Lff99e8
	move.w	($0970),d0
	sub.w	d6,d0
	subq.w	#1,d0
	bcc.s	Lff995a
	bsr.s	Lff996a
Lff995a:
	addq.w	#2,($0974)
	movem.l	(a7)+,d2-d7/a0-a4
	bra.w	Call_B_CURON
Lff9966:
	pea.l	(Lff9922,pc)
Lff996a:
	moveq.l	#$00,d6
	move.w	d6,($0974)
	addq.w	#1,d7
	cmp.w	($0972),d7
	ble.s	Lff997e
	bsr.w	Lff9f7a
	subq.w	#1,d7
Lff997e:
	move.w	d7,($0976)
	rts

Lff9984:
	movem.l	d1-d7/a0-a4,-(a7)
	move.w	sr,-(a7)
	move.l	($0948),-(a7)
	move.b	($0994),-(a7)
	move.b	d1,($0994)
	cmp.w	#$0080,d2
	bcc.s	Lff99c4
	cmp.w	#$0040,d3
	bcc.s	Lff99c4
	move.w	d2,d6
	move.w	d3,d7
	move.w	d0,d1
	moveq.l	#$08,d2
	movea.l	($0458),a1
	jsr	(a1)
	movea.l	d0,a1
	move.w	d1,-(a7)
	tst.w	d1
	sne.b	d4
	ori.w	#$0700,sr
	clr.l	($0948)
	bsr.s	Lff99e8
	move.w	(a7)+,d0
Lff99c4:
	move.b	(a7)+,($0994)
	move.l	(a7)+,($0948)
	move.w	(a7)+,sr
	movem.l	(a7)+,d1-d7/a0-a4
	addq.w	#1,d0
	add.w	d0,d2
	rts

Lff99d8:
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
Lff99e8:
	link.w	a6,#-$0020
	lea.l	($00e8002a),a3
	moveq.l	#$00,d0
	move.w	d7,d0
	swap.w	d0
	lsr.l	#5,d0
	movea.l	d0,a2
	adda.w	d6,a2
	adda.l	($0948),a2
	adda.l	($0944),a2
	tst.b	d4
	beq.s	Lff9a12
	move.l	a2,d0
	lsr.w	#1,d0
	bcs.s	Lff9a12
	moveq.l	#$01,d4
Lff9a12:
	moveq.l	#$02,d5
	swap.w	d5
	moveq.l	#$00,d0
	move.b	($0994),d0
	and.w	#$000f,d0
	add.w	d0,d0
	move.w	(a3),-(a7)
	jsr	(Lff9a2e,pc,d0.w)
	move.w	(a7)+,(a3)
	unlk	a6
	rts

Lff9a2e:
	bra.s	Lff9a4e
Lff9a30:
	bra.s	Lff9ab0
Lff9a32:
	bra.s	Lff9aa4
Lff9a34:
	bra.s	Lff9a9e
Lff9a36:
	bra.s	Lff9a4e
Lff9a38:
	bra.s	Lff9a56
Lff9a3a:
	bra.s	Lff9a5e
Lff9a3c:
	bra.s	Lff9a66
Lff9a3e:
	bra.s	Lff9a4e
Lff9a40:
	bra.s	Lff9a6e
Lff9a42:
	bra.s	Lff9a76
Lff9a44:
	bra.s	Lff9a7e
Lff9a46:
	bra.s	Lff9a4e
Lff9a48:
	bra.s	Lff9a86
Lff9a4a:
	bra.s	Lff9a8e
Lff9a4c:
	bra.s	Lff9a96
Lff9a4e:
	move.w	#$0133,(a3)
	bra.w	Lff9bc6
Lff9a56:
	pea.l	(Lff9ab0,pc)
	bra.w	Lff9d1e
Lff9a5e:
	pea.l	(Lff9aa4,pc)
	bra.w	Lff9d1e
Lff9a66:
	pea.l	(Lff9a9e,pc)
	bra.w	Lff9d1e
Lff9a6e:
	pea.l	(Lff9ab0,pc)
	bra.w	Lff9cd6
Lff9a76:
	pea.l	(Lff9aa4,pc)
	bra.w	Lff9cd6
Lff9a7e:
	pea.l	(Lff9a9e,pc)
	bra.w	Lff9cd6
Lff9a86:
	pea.l	(Lff9ab0,pc)
	bra.w	Lff9d1a
Lff9a8e:
	pea.l	(Lff9aa4,pc)
	bra.w	Lff9d1a
Lff9a96:
	pea.l	(Lff9a9e,pc)
	bra.w	Lff9d1a
Lff9a9e:
	move.w	#$0133,(a3)
	bra.s	Lff9abc
Lff9aa4:
	move.w	#$0033,(a3)
	bsr.w	Lff9bc6
	adda.l	d5,a2
	bra.s	Lff9abc
Lff9ab0:
	move.w	#$0033,(a3)
	bsr.s	Lff9abc
	adda.l	d5,a2
	bra.w	Lff9bc6
Lff9abc:
	tst.b	d4
	beq.s	Lff9ac6
	bpl.s	Lff9b06
	bra.w	Lff9b46
Lff9ac6:
	move.b	(a1)+,(a2)
	move.b	(a1)+,($0080,a2)
	move.b	(a1)+,($0100,a2)
	move.b	(a1)+,($0180,a2)
	move.b	(a1)+,($0200,a2)
	move.b	(a1)+,($0280,a2)
	move.b	(a1)+,($0300,a2)
	move.b	(a1)+,($0380,a2)
	move.b	(a1)+,($0400,a2)
	move.b	(a1)+,($0480,a2)
	move.b	(a1)+,($0500,a2)
	move.b	(a1)+,($0580,a2)
	move.b	(a1)+,($0600,a2)
	move.b	(a1)+,($0680,a2)
	move.b	(a1)+,($0700,a2)
	move.b	(a1)+,($0780,a2)
	rts

Lff9b06:
	move.w	(a1)+,(a2)
	move.w	(a1)+,($0080,a2)
	move.w	(a1)+,($0100,a2)
	move.w	(a1)+,($0180,a2)
	move.w	(a1)+,($0200,a2)
	move.w	(a1)+,($0280,a2)
	move.w	(a1)+,($0300,a2)
	move.w	(a1)+,($0380,a2)
	move.w	(a1)+,($0400,a2)
	move.w	(a1)+,($0480,a2)
	move.w	(a1)+,($0500,a2)
	move.w	(a1)+,($0580,a2)
	move.w	(a1)+,($0600,a2)
	move.w	(a1)+,($0680,a2)
	move.w	(a1)+,($0700,a2)
	move.w	(a1)+,($0780,a2)
	rts

Lff9b46:
	move.b	(a1)+,(a2)
	move.b	(a1)+,($0001,a2)
	move.b	(a1)+,($0080,a2)
	move.b	(a1)+,($0081,a2)
	move.b	(a1)+,($0100,a2)
	move.b	(a1)+,($0101,a2)
	move.b	(a1)+,($0180,a2)
	move.b	(a1)+,($0181,a2)
	move.b	(a1)+,($0200,a2)
	move.b	(a1)+,($0201,a2)
	move.b	(a1)+,($0280,a2)
	move.b	(a1)+,($0281,a2)
	move.b	(a1)+,($0300,a2)
	move.b	(a1)+,($0301,a2)
	move.b	(a1)+,($0380,a2)
	move.b	(a1)+,($0381,a2)
	move.b	(a1)+,($0400,a2)
	move.b	(a1)+,($0401,a2)
	move.b	(a1)+,($0480,a2)
	move.b	(a1)+,($0481,a2)
	move.b	(a1)+,($0500,a2)
	move.b	(a1)+,($0501,a2)
	move.b	(a1)+,($0580,a2)
	move.b	(a1)+,($0581,a2)
	move.b	(a1)+,($0600,a2)
	move.b	(a1)+,($0601,a2)
	move.b	(a1)+,($0680,a2)
	move.b	(a1)+,($0681,a2)
	move.b	(a1)+,($0700,a2)
	move.b	(a1)+,($0701,a2)
	move.b	(a1)+,($0780,a2)
	move.b	(a1)+,($0781,a2)
	rts

Lff9bc6:
	tst.b	d4
	beq.s	Lff9bd0
	bpl.s	Lff9c12
	bra.w	Lff9c54
Lff9bd0:
	moveq.l	#$00,d0
	move.b	d0,(a2)
	move.b	d0,($0080,a2)
	move.b	d0,($0100,a2)
	move.b	d0,($0180,a2)
	move.b	d0,($0200,a2)
	move.b	d0,($0280,a2)
	move.b	d0,($0300,a2)
	move.b	d0,($0380,a2)
	move.b	d0,($0400,a2)
	move.b	d0,($0480,a2)
	move.b	d0,($0500,a2)
	move.b	d0,($0580,a2)
	move.b	d0,($0600,a2)
	move.b	d0,($0680,a2)
	move.b	d0,($0700,a2)
	move.b	d0,($0780,a2)
	rts

Lff9c12:
	moveq.l	#$00,d0
	move.w	d0,(a2)
	move.w	d0,($0080,a2)
	move.w	d0,($0100,a2)
	move.w	d0,($0180,a2)
	move.w	d0,($0200,a2)
	move.w	d0,($0280,a2)
	move.w	d0,($0300,a2)
	move.w	d0,($0380,a2)
	move.w	d0,($0400,a2)
	move.w	d0,($0480,a2)
	move.w	d0,($0500,a2)
	move.w	d0,($0580,a2)
	move.w	d0,($0600,a2)
	move.w	d0,($0680,a2)
	move.w	d0,($0700,a2)
	move.w	d0,($0780,a2)
	rts

Lff9c54:
	moveq.l	#$00,d0
	move.b	d0,(a2)
	move.b	d0,($0080,a2)
	move.b	d0,($0100,a2)
	move.b	d0,($0180,a2)
	move.b	d0,($0200,a2)
	move.b	d0,($0280,a2)
	move.b	d0,($0300,a2)
	move.b	d0,($0380,a2)
	move.b	d0,($0400,a2)
	move.b	d0,($0480,a2)
	move.b	d0,($0500,a2)
	move.b	d0,($0580,a2)
	move.b	d0,($0600,a2)
	move.b	d0,($0680,a2)
	move.b	d0,($0700,a2)
	move.b	d0,($0780,a2)
	move.b	d0,($0001,a2)
	move.b	d0,($0081,a2)
	move.b	d0,($0101,a2)
	move.b	d0,($0181,a2)
	move.b	d0,($0201,a2)
	move.b	d0,($0281,a2)
	move.b	d0,($0301,a2)
	move.b	d0,($0381,a2)
	move.b	d0,($0401,a2)
	move.b	d0,($0481,a2)
	move.b	d0,($0501,a2)
	move.b	d0,($0581,a2)
	move.b	d0,($0601,a2)
	move.b	d0,($0681,a2)
	move.b	d0,($0701,a2)
	move.b	d0,($0781,a2)
	rts

Lff9cd6:
	bsr.s	Lff9d00
Lff9cd8:
	movea.l	a1,a0
	movem.l	(a0),d0-d3
	not.l	d0
	not.l	d1
	not.l	d2
	not.l	d3
	movem.l	d0-d3,(a0)
	movem.l	($0010,a0),d0-d3
	not.l	d0
	not.l	d1
	not.l	d2
	not.l	d3
	movem.l	d0-d3,($0010,a0)
	rts

Lff9d00:
	lea.l	(-$0020,a6),a0
	move.l	a0,d0
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	movea.l	d0,a1
	rts

Lff9d1a:
	bsr.s	Lff9d1e
	bra.s	Lff9cd8
Lff9d1e:
	move.l	d5,-(a7)
	bsr.s	Lff9d00
	move.l	#$7fff7fff,d5
	tst.b	d4
	bne.s	Lff9d32
	move.l	#$7f7f7f7f,d5
Lff9d32:
	movea.l	a1,a0
	movem.l	(a0),d0-d3
	lsr.l	#1,d0
	lsr.l	#1,d1
	lsr.l	#1,d2
	lsr.l	#1,d3
	and.l	d5,d0
	and.l	d5,d1
	and.l	d5,d2
	and.l	d5,d3
	or.l	d0,(a0)+
	or.l	d1,(a0)+
	or.l	d2,(a0)+
	or.l	d3,(a0)+
	movem.l	(a0),d0-d3
	lsr.l	#1,d0
	lsr.l	#1,d1
	lsr.l	#1,d2
	lsr.l	#1,d3
	and.l	d5,d0
	and.l	d5,d1
	and.l	d5,d2
	and.l	d5,d3
	or.l	d0,(a0)+
	or.l	d1,(a0)+
	or.l	d2,(a0)+
	or.l	d3,(a0)+
	move.l	(a7)+,d5
	rts

Lff9d70:
	cmpi.b	#$07,d1
	beq.s	Lff9db8
	bcs.s	Lff9da8
	lea.l	($0974),a0
	lea.l	($0976),a1
	cmpi.b	#$09,d1
	bcs.s	Lff9dde
	beq.s	Lff9df2
	cmpi.b	#$0b,d1
	bcs.w	Lff9e28
	beq.s	Lff9e04
	cmpi.b	#$0d,d1
	bcs.s	Lff9e0c
	beq.w	Lff9e22
	cmpi.b	#$1a,d1
	beq.s	Lff9e18
	cmpi.b	#$1e,d1
	beq.s	Lff9e20
Lff9da8:
	movem.l	(a7)+,d2-d7/a0-a4
	bra.w	Call_B_CURON
Lff9db0:
	movea.l	($0d12),a0
	jsr	(a0)
	bra.s	Lff9da8
Lff9db8:
	move.l	($0978),d0
	addq.l	#1,d0
	beq.s	Lff9db0
	moveq.l	#$00,d2
	move.w	($097c),d2
	beq.s	Lff9da8
	move.l	d1,-(a7)
	movea.l	($0978),a1
	move.w	#$0403,d1
	moveq.l	#$00,d0
	movea.l	($0580),a0
	jsr	(a0)
	move.l	(a7)+,d1
	bra.s	Lff9da8
Lff9dde:
	tst.w	(a0)
	beq.s	Lff9de6
	subq.w	#1,(a0)
	bra.s	Lff9da8
Lff9de6:
	tst.w	(a1)
	beq.s	Lff9da8
	move.w	($0970),(a0)
	subq.w	#1,(a1)
	bra.s	Lff9da8
Lff9df2:
	move.w	(a0),d0
	addq.w	#8,d0
	and.w	#$fff8,d0
	cmp.w	($0970),d0
	bhi.s	Lff9e26
	move.w	d0,(a0)
	bra.s	Lff9da8
Lff9e04:
	tst.w	(a1)
	beq.s	Lff9da8
	subq.w	#1,(a1)
	bra.s	Lff9da8
Lff9e0c:
	cmp.w	($0970),d6
	ble.s	Lff9e14
	bsr.s	Lff9e26
Lff9e14:
	addq.w	#1,(a0)
	bra.s	Lff9da8
Lff9e18:
	bsr.s	Lff9e60
	clr.l	($0974)
	bra.s	Lff9da8
Lff9e20:
	clr.w	(a1)
Lff9e22:
	clr.w	(a0)
	bra.s	Lff9da8
Lff9e26:
	clr.w	(a0)
Lff9e28:
	addq.w	#1,d7
	cmp.w	($0972),d7
	ble.s	Lff9e36
	bsr.w	Lff9f7a
	subq.w	#1,d7
Lff9e36:
	move.w	d7,(a1)
	movem.l	(a7)+,d2-d7/a0-a4
	bra.w	Call_B_CURON
Lff9e40:
	movem.l	d1-d7/a1-a3,-(a7)
	lsl.l	#7,d1
	lsl.l	#4,d1
	add.l	($0944),d1
	add.l	($0948),d1
	movea.l	d1,a1
	moveq.l	#$00,d4
	move.w	d0,d4
	bra.s	Lff9e74
Lff9e58:
	movem.l	d1-d7/a1-a3,-(a7)
	movea.l	a0,a1
	bra.s	Lff9e78
Lff9e60:
	movem.l	d1-d7/a1-a3,-(a7)
	movea.l	($0944),a1
	adda.l	($0948),a1
	moveq.l	#$00,d4
	move.w	($0972),d4
	addq.w	#1,d4
Lff9e74:
	lsl.l	#4,d4
	subq.w	#1,d4
Lff9e78:
	move.w	($0970),d3
	addq.w	#1,d3
	lea.l	($00e8002a),a3
	bset.b	#$00,(a3)
	moveq.l	#$00,d6
	moveq.l	#$ff,d7
	move.b	($0994),d1
	btst.l	#$03,d1
	beq.s	Lff9ec6
	and.b	#$03,d1
	beq.s	Lff9ec6
	cmp.b	#$03,d1
	beq.s	Lff9ec4
	movea.l	a1,a2
	adda.l	#$00020000,a2
	bclr.b	#$00,(a3)
	cmp.b	#$02,d1
	beq.s	Lff9eb6
	exg.l	d6,d7
Lff9eb6:
	move.w	d4,-(a7)
	bsr.s	Lff9ed2
	move.w	(a7)+,d4
	movea.l	a2,a1
	move.l	d7,d6
	bsr.s	Lff9ed2
	bra.s	Lff9ecc
Lff9ec4:
	moveq.l	#$ff,d6
Lff9ec6:
	bsr.s	Lff9ed2
	bclr.b	#$00,(a3)
Lff9ecc:
	movem.l	(a7)+,d1-d7/a1-a3
	rts

Lff9ed2:
	move.w	#$0080,d2
	sub.w	d3,d2
Lff9ed8:
	move.w	d3,d1
	move.l	a1,d0
	lsr.w	#1,d0
	bcc.s	Lff9ee4
	move.b	d6,(a1)+
	subq.w	#1,d1
Lff9ee4:
	move.w	d1,d5
	lsr.w	#2,d1
	add.w	d1,d1
	moveq.l	#$20,d0
	lea.l	(Lff9ef0,pc),a0
Lff9ef0:
	sub.w	d0,d1
	bcc.s	Lff9f14
	and.w	#$0003,d5
	add.w	d5,d5
	neg.w	d5
	lea.l	(Lff9f0c,pc,d5.w),a0
	neg.w	d1
	jmp	(Lff9f14,pc,d1.w)

Lff9f06:
	move.b	d6,(a1)+
	move.b	d6,(a1)+
	move.b	d6,(a1)+
Lff9f0c:
	adda.w	d2,a1
	dbra.w	d4,Lff9ed8
	rts

Lff9f14:
	move.l	d6,(a1)+
	move.l	d6,(a1)+
	move.l	d6,(a1)+
	move.l	d6,(a1)+
	move.l	d6,(a1)+
	move.l	d6,(a1)+
	move.l	d6,(a1)+
	move.l	d6,(a1)+
	move.l	d6,(a1)+
	move.l	d6,(a1)+
	move.l	d6,(a1)+
	move.l	d6,(a1)+
	move.l	d6,(a1)+
	move.l	d6,(a1)+
	move.l	d6,(a1)+
	move.l	d6,(a1)+
	jmp	(a0)

Lff9f36:
	movem.l	d0-d2,-(a7)
	move.w	($0d08),d0
	bne.w	Lffa0c0
	move.l	($0948),d0
	lsr.l	#7,d0
	lsr.l	#2,d0
	move.w	($0972),d1
	addq.w	#1,d1
	lsl.w	#2,d1
	subq.w	#1,d1
	add.w	d1,d0
	move.l	d0,d1
	subq.w	#4,d1
	lsl.w	#8,d1
	move.b	d0,d1
	move.w	($0972),d0
	lsl.w	#2,d0
	move.w	#$feff,d2
	bsr.w	Lffa07a
	moveq.l	#$00,d1
	moveq.l	#$01,d0
	bsr.w	Lff9e40
	movem.l	(a7)+,d0-d2
	rts

Lff9f7a:
	movem.l	d0-d2,-(a7)
	move.w	($0d08),d0
	bne.w	Lffa0f2
	move.w	($0d0a),d0
	bne.s	Lff9fbc
	move.l	($0948),d0
	lsr.l	#7,d0
	lsr.l	#2,d0
	move.l	d0,d1
	addq.w	#4,d1
	lsl.w	#8,d1
	move.b	d0,d1
	move.w	($0972),d0
	lsl.w	#2,d0
	move.w	#$0101,d2
	bsr.w	Lffa07a
	moveq.l	#$00,d1
	move.w	($0972),d1
	moveq.l	#$01,d0
	bsr.w	Lff9e40
	movem.l	(a7)+,d0-d2
	rts

Lff9fbc:
	movem.l	d3/a0-a1,-(a7)
	and.w	#$0003,d0
	subq.w	#1,d0
	mulu.w	#$0006,d0
	lea.l	(Lffa038,pc),a1
	adda.w	d0,a1
	movea.l	($0944),a0
	adda.l	($0948),a0
	moveq.l	#$00,d0
	move.w	($0972),d0
	addq.w	#1,d0
	lsl.l	#4,d0
	sub.w	(a1),d0
	subq.w	#1,d0
	lsl.l	#7,d0
	adda.l	d0,a0
	move.w	($0002,a1),d3
	move.l	($0948),d0
	lsr.l	#7,d0
	lsr.l	#2,d0
	move.l	d0,d1
	add.w	($0004,a1),d1
	lsl.w	#8,d1
	move.b	d0,d1
	move.w	($0972),d0
	addq.w	#1,d0
	lsl.w	#2,d0
	sub.w	($0004,a1),d0
	move.w	#$0101,d2
Lffa010:
	btst.b	#$04,($00e88001)
	bne.s	Lffa010
	movem.l	d0-d2/d4/a0,-(a7)
	bsr.s	Lffa07a
	move.w	(a1),d4
	bsr.w	Lff9e58
	movem.l	(a7)+,d0-d2/d4/a0
	dbra.w	d3,Lffa010
	movem.l	(a7)+,d3/a0-a1
	movem.l	(a7)+,d0-d2
	rts

Lffa038:
	.dc.b	$00,$03,$00,$03,$00,$01,$00,$07
	.dc.b	$00,$01,$00,$02,$00,$0f,$00,$00
	.dc.b	$00,$04
Call_Unknown_df:
	movem.l	d1-d2/d7/a0,-(a7)
	lea.l	($00e8002a),a0
	move.w	(a0),d7
	move.w	d3,d0
	and.w	#$000f,d0
	or.w	#$0100,d0
	move.w	d0,(a0)
	move.w	#$0101,d0
	tst.w	d3
	bpl.s	$00ffa06e
	move.w	#$feff,d0
	exg.l	d0,d2
	bsr.s	Lffa07a
	move.w	d7,(a0)
	movem.l	(a7)+,d1-d2/d7/a0
	rts

Lffa07a:
	movem.l	d3/a0-a1,-(a7)
	lea.l	($00e88001),a0
	lea.l	($00e8002c),a1
	clr.b	($0004,a0)
	move.w	sr,d3
	bra.s	Lffa0aa
Lffa092:
	tst.b	(a0)
	bmi.s	Lffa092
	ori.w	#$0700,sr
Lffa09a:
	tst.b	(a0)
	bpl.s	Lffa09a
	move.w	d1,(a1)
	move.w	#$0008,($0454,a1)
	move.w	d3,sr
	add.w	d2,d1
Lffa0aa:
	dbra.w	d0,Lffa092
Lffa0ae:
	tst.b	(a0)
	bmi.s	Lffa0ae
Lffa0b2:
	tst.b	(a0)
	bpl.s	Lffa0b2
	clr.w	($0454,a1)
	movem.l	(a7)+,d3/a0-a1
	rts

Lffa0c0:
	movem.l	d3-d5/a0-a4,-(a7)
	moveq.l	#$00,d0
	move.w	($0972),d0
	move.l	d0,d4
	lsl.w	#5,d4
	subq.w	#1,d4
	addq.w	#1,d0
	lsl.l	#4,d0
	subq.l	#1,d0
	lsl.l	#7,d0
	movea.l	d0,a2
	adda.l	($0948),a2
	adda.l	($0944),a2
	lea.l	(-$0800,a2),a1
	bsr.s	Lffa124
	moveq.l	#$00,d1
	moveq.l	#$01,d0
	bsr.w	Lff9e40
	bra.s	Lffa11a
Lffa0f2:
	movem.l	d3-d5/a0-a4,-(a7)
	move.w	($0972),d4
	lsl.w	#5,d4
	subq.w	#1,d4
	suba.l	a2,a2
	adda.l	($0948),a2
	adda.l	($0944),a2
	lea.l	($0800,a2),a1
	bsr.s	Lffa136
	moveq.l	#$00,d1
	move.w	($0972),d1
	moveq.l	#$01,d0
	bsr.w	Lff9e40
Lffa11a:
	movem.l	(a7)+,d3-d5/a0-a4
	movem.l	(a7)+,d0-d2
	rts

Lffa124:
	moveq.l	#$00,d3
	move.w	($0970),d3
	addq.w	#1,d3
	move.w	#$0080,d2
	add.w	d3,d2
	neg.w	d2
	bra.s	Lffa144
Lffa136:
	moveq.l	#$00,d3
	move.w	($0970),d3
	addq.w	#1,d3
	move.w	#$0080,d2
	sub.w	d3,d2
Lffa144:
	movea.l	a1,a3
	movea.l	a2,a4
	moveq.l	#$02,d0
	swap.w	d0
	adda.l	d0,a3
	adda.l	d0,a4
	move.l	a1,d0
	lsr.w	#1,d0
	bcc.s	Lffa15c
	subq.w	#1,d3
	bset.l	#$1f,d3
Lffa15c:
	move.w	d3,d5
	and.w	#$0003,d5
	add.w	d5,d5
	neg.w	d5
	lsr.w	#2,d3
	add.w	d3,d3
Lffa16a:
	move.l	d3,d1
	bpl.s	Lffa170
	move.b	(a1)+,(a2)+
Lffa170:
	moveq.l	#$20,d0
	lea.l	(Lffa176,pc),a0
Lffa176:
	sub.w	d0,d1
	bcc.s	Lffa198
	lea.l	(Lffa18a,pc,d5.w),a0
	neg.w	d1
	jmp	(Lffa198,pc,d1.w)

Lffa184:
	move.b	(a1)+,(a2)+
	move.b	(a1)+,(a2)+
	move.b	(a1)+,(a2)+
Lffa18a:
	adda.w	d2,a1
	adda.w	d2,a2
	exg.l	a1,a3
	exg.l	a2,a4
	dbra.w	d4,Lffa16a
	rts

Lffa198:
	move.l	(a1)+,(a2)+
	move.l	(a1)+,(a2)+
	move.l	(a1)+,(a2)+
	move.l	(a1)+,(a2)+
	move.l	(a1)+,(a2)+
	move.l	(a1)+,(a2)+
	move.l	(a1)+,(a2)+
	move.l	(a1)+,(a2)+
	move.l	(a1)+,(a2)+
	move.l	(a1)+,(a2)+
	move.l	(a1)+,(a2)+
	move.l	(a1)+,(a2)+
	move.l	(a1)+,(a2)+
	move.l	(a1)+,(a2)+
	move.l	(a1)+,(a2)+
	move.l	(a1)+,(a2)+
	jmp	(a0)

Lffa1ba:
	movem.l	d2-d7/a0-a4,-(a7)
	movea.l	($0982),a1
	move.b	d1,(a1)+
	lea.l	($098f),a0
	cmpa.l	a0,a1
	beq.s	Lffa1d0
	move.l	a1,($0982)
Lffa1d0:
	move.b	($0986),d0
	cmpi.b	#$5b,d0
	beq.s	Lffa1fe
	cmpi.b	#$3d,d0
	beq.s	Lffa248
	bsr.w	Call_B_CUROFF
	cmpi.b	#$2a,d0
	beq.s	Lffa23e
	cmpi.b	#$44,d0
	beq.s	Lffa224
	cmpi.b	#$45,d0
	beq.s	Lffa22a
	cmpi.b	#$4d,d0
	beq.s	Lffa238
	bra.s	Lffa216
Lffa1fe:
	move.b	d1,d0
	or.b	#$20,d0
	sub.b	#$60,d0
	cmp.b	#$1b,d0
	bcc.s	Lffa21e
	bsr.w	Call_B_CUROFF
	bsr.w	Lffa2b4
Lffa216:
	clr.b	($0990)
	bsr.w	Call_B_CURON
Lffa21e:
	movem.l	(a7)+,d2-d7/a0-a4
	rts

Lffa224:
	bsr.w	Lffa458
	bra.s	Lffa216
Lffa22a:
	move.w	($0974),d6
	move.w	($0976),d7
	bsr.w	Lff996a
	bra.s	Lffa216
Lffa238:
	bsr.w	Lffa472
	bra.s	Lffa216
Lffa23e:
	bsr.w	Lff9e60
	clr.l	($0974)
	bra.s	Lffa216
Lffa248:
	lea.l	($0989),a0
	cmpa.l	a0,a1
	bne.s	Lffa21e
	bsr.w	Call_B_CUROFF
	moveq.l	#$1f,d0
	moveq.l	#$00,d1
	moveq.l	#$00,d2
	move.b	($0987),d2
	move.b	($0988),d1
	sub.w	d0,d1
	sub.w	d0,d2
	bsr.w	Lffa438
	bra.s	Lffa216
Lffa26c:
	swap.w	d0
	moveq.l	#$00,d1
	cmpi.w	#$356c,d0
	beq.s	Lffa27e
	moveq.l	#$ff,d1
	cmpi.w	#$3568,d0
	bne.s	Lffa29e
Lffa27e:
	move.b	d1,($0993)
	rts

Lffa284:
	swap.w	d0
	lea.l	($0d0a),a0
	moveq.l	#$00,d1
	cmpi.w	#$346c,d0
	beq.s	Lffa29a
	moveq.l	#$02,d1
	cmpi.w	#$3468,d0
	bne.s	Lffa29e
Lffa29a:
	move.w	d1,(a0)
	rts

Lffa29e:
	move.l	($097e),-(a7)
	beq.s	Lffa2aa
	lea.l	($0986),a0
	rts

Lffa2aa:
	tst.l	(a7)+
	rts

Lffa2ae:
	move.l	($0d16),-(a7)
	rts

Lffa2b4:
	lea.l	($0986),a0
	tst.l	($0d16)
	bne.s	Lffa2ae
	move.l	(a0),d0
	swap.w	d0
	cmpi.w	#$5b3f,d0
	beq.s	Lffa284
	cmpi.w	#$5b3e,d0
	beq.s	Lffa26c
	addq.l	#1,a0
	bsr.w	Lffa3e0
	cmp.b	#$41,d0
	beq.w	Lffa488
	cmp.b	#$42,d0
	beq.w	Lffa4a4
	cmp.b	#$43,d0
	beq.w	Lffa4c0
	cmp.b	#$44,d0
	beq.w	Lffa4d8
	cmp.b	#$73,d0
	beq.w	Lffa408
	cmp.b	#$75,d0
	beq.w	Lffa41a
	cmp.b	#$6e,d0
	beq.s	Lffa29e
	cmp.b	#$4a,d0
	beq.w	Lffa4ee
	cmp.b	#$4b,d0
	beq.w	Lffa52c
	cmp.b	#$4d,d0
	beq.w	Lffa68a
	cmp.b	#$4c,d0
	beq.w	Lffa5e0
	cmp.b	#$50,d0
	beq.w	Lffa764
	cmp.b	#$40,d0
	beq.w	Lffa794
	cmp.b	#$58,d0
	beq.w	Lffa722
	cmp.b	#$6d,d0
	beq.s	Lffa38a
	cmp.b	#$3b,d0
	bne.w	Lffa29e
	move.w	d1,d2
	bsr.w	Lffa3e0
	cmp.b	#$48,d0
	beq.w	Lffa42c
	cmp.b	#$66,d0
	beq.w	Lffa42c
	cmp.b	#$6d,d0
	beq.s	Lffa386
	cmp.b	#$3b,d0
	bne.w	Lffa29e
	move.w	d1,d3
	bsr.s	Lffa3e0
	cmp.b	#$6d,d0
	bne.w	Lffa29e
	move.w	d2,d0
	bsr.s	Lffa38c
	exg.l	d2,d3
Lffa386:
	move.w	d2,d0
	bsr.s	Lffa38c
Lffa38a:
	move.w	d1,d0
Lffa38c:
	tst.b	d0
	beq.s	Lffa3c8
	cmp.b	#$01,d0
	beq.s	Lffa3d0
	cmp.b	#$07,d0
	beq.s	Lffa3d8
	cmp.b	#$1e,d0
	bcs.s	Lffa3c6
	cmp.b	#$26,d0
	bcc.s	Lffa3b2
	sub.b	#$1e,d0
	move.b	d0,($0994)
	rts

Lffa3b2:
	cmp.b	#$28,d0
	bcs.s	Lffa3c6
	cmp.b	#$30,d0
	bcc.s	Lffa3c6
	sub.b	#$20,d0
	move.b	d0,($0994)
Lffa3c6:
	rts

Lffa3c8:
	move.b	#$03,($0994)
	rts

Lffa3d0:
	eori.b	#$04,($0994)
	rts

Lffa3d8:
	eori.b	#$08,($0994)
	rts

Lffa3e0:
	move.w	#$8000,d1
	moveq.l	#$00,d0
Lffa3e6:
	move.b	(a0)+,d0
	cmp.b	#$20,d0
	beq.s	Lffa3e6
	cmp.b	#$30,d0
	bcs.s	Lffa406
	cmp.b	#$3a,d0
	bcc.s	Lffa406
	sub.b	#$30,d0
	mulu.w	#$000a,d1
	add.w	d0,d1
	bra.s	Lffa3e6
Lffa406:
	rts

Lffa408:
	tst.w	d1
	bpl.s	Lffa418
	move.l	($0974),($0996)
	move.b	($0994),($0995)
Lffa418:
	rts

Lffa41a:
	tst.w	d1
	bpl.s	Lffa42a
	move.l	($0996),($0974)
	move.b	($0995),($0994)
Lffa42a:
	rts

Lffa42c:
	tst.w	d1
	bgt.s	Lffa432
	moveq.l	#$01,d1
Lffa432:
	tst.w	d2
	bgt.s	Lffa438
	moveq.l	#$01,d2
Lffa438:
	subq.w	#1,d1
	subq.w	#1,d2
	cmp.w	($0970),d1
	bhi.s	Lffa454
	cmp.w	($0972),d2
	bhi.s	Lffa454
	move.w	d1,($0974)
	move.w	d2,($0976)
	moveq.l	#$00,d0
	rts

Lffa454:
	moveq.l	#$ff,d0
	rts

Lffa458:
	addq.w	#1,($0976)
	move.w	($0972),d0
	cmp.w	($0976),d0
	bcc.s	Lffa46e
	subq.w	#1,($0976)
	bsr.w	Lff9f7a
Lffa46e:
	moveq.l	#$00,d0
	rts

Lffa472:
	tst.w	($0976)
	beq.s	Lffa480
	subq.w	#1,($0976)
	moveq.l	#$00,d0
	rts

Lffa480:
	bsr.w	Lff9f36
	moveq.l	#$00,d0
	rts

Lffa488:
	and.w	#$00ff,d1
	bne.s	Lffa490
	moveq.l	#$01,d1
Lffa490:
	move.w	($0976),d0
	sub.w	d1,d0
	bmi.s	Lffa4a0
	move.w	d0,($0976)
	moveq.l	#$00,d0
	rts

Lffa4a0:
	moveq.l	#$ff,d0
	rts

Lffa4a4:
	lea.l	($0976),a0
	and.w	#$00ff,d1
	bne.s	Lffa4b0
	moveq.l	#$01,d1
Lffa4b0:
	add.w	d1,(a0)
	move.w	($0972),d0
	cmp.w	(a0),d0
	bcc.s	Lffa4bc
Lffa4ba:
	move.w	d0,(a0)
Lffa4bc:
	moveq.l	#$00,d0
	rts

Lffa4c0:
	lea.l	($0974),a0
	and.w	#$00ff,d1
	bne.s	Lffa4cc
	moveq.l	#$01,d1
Lffa4cc:
	add.w	d1,(a0)
	move.w	($0970),d0
	cmp.w	(a0),d0
	bcc.s	Lffa4bc
	bra.s	Lffa4ba
Lffa4d8:
	and.w	#$00ff,d1
	bne.s	Lffa4e0
	moveq.l	#$01,d1
Lffa4e0:
	sub.w	d1,($0974)
	bpl.s	Lffa4ea
	clr.w	($0974)
Lffa4ea:
	moveq.l	#$00,d0
	rts

Lffa4ee:
	tst.b	d1
	beq.s	Lffa506
	subq.b	#2,d1
	bcs.s	Lffa51e
	bhi.s	Lffa502
	bsr.w	Lff9e60
	clr.l	($0974)
	rts

Lffa502:
	moveq.l	#$ff,d0
	rts

Lffa506:
	moveq.l	#$00,d1
	move.w	($0972),d0
	move.w	($0976),d1
	sub.w	d1,d0
	beq.s	Lffa54a
	bcs.s	Lffa502
	addq.w	#1,d1
	bsr.w	Lff9e40
	bra.s	Lffa54a
Lffa51e:
	moveq.l	#$00,d1
	move.w	($0976),d0
	beq.s	Lffa55a
	bsr.w	Lff9e40
	bra.s	Lffa55a
Lffa52c:
	tst.b	d1
	beq.s	Lffa54a
	subq.b	#2,d1
	bcs.s	Lffa55a
	bhi.s	Lffa546
	moveq.l	#$00,d1
	move.w	($0976),d1
	moveq.l	#$01,d0
	bsr.w	Lff9e40
	moveq.l	#$00,d0
	rts

Lffa546:
	moveq.l	#$ff,d0
	rts

Lffa54a:
	moveq.l	#$00,d2
	move.w	($0974),d2
	move.w	($0970),d0
	sub.w	d2,d0
	bcs.s	Lffa546
	bra.s	Lffa560
Lffa55a:
	moveq.l	#$00,d2
	move.w	($0974),d0
Lffa560:
	lea.l	($00e8002a),a4
	moveq.l	#$00,d1
	move.w	($0976),d1
	swap.w	d1
	lsr.l	#5,d1
	add.l	($0948),d1
	add.l	($0944),d1
	movea.l	d1,a0
	adda.w	d2,a0
	moveq.l	#$7f,d3
	sub.w	d0,d3
	moveq.l	#$0f,d4
	bset.b	#$00,(a4)
	moveq.l	#$00,d2
	move.b	($0994),d1
	btst.l	#$03,d1
	beq.s	Lffa5ca
	and.b	#$03,d1
	beq.s	Lffa5ca
	moveq.l	#$ff,d2
	cmp.b	#$03,d1
	beq.s	Lffa5ca
	movea.l	a0,a1
	adda.l	#$00020000,a1
	bclr.b	#$00,(a4)
	cmp.b	#$02,d1
	beq.s	Lffa5b4
	exg.l	a0,a1
Lffa5b4:
	move.w	d0,d1
Lffa5b6:
	clr.b	(a0)+
	move.b	d2,(a1)+
	dbra.w	d1,Lffa5b6
	adda.l	d3,a0
	adda.l	d3,a1
	dbra.w	d4,Lffa5b4
	moveq.l	#$00,d0
	rts

Lffa5ca:
	move.w	d0,d1
Lffa5cc:
	move.b	d2,(a0)+
	dbra.w	d1,Lffa5cc
	adda.l	d3,a0
	dbra.w	d4,Lffa5ca
	bclr.b	#$00,(a4)
	moveq.l	#$00,d0
	rts

Lffa5e0:
	tst.b	d1
	bne.s	Lffa5e6
	moveq.l	#$01,d1
Lffa5e6:
	and.w	#$00ff,d1
	moveq.l	#$00,d2
	moveq.l	#$00,d3
	move.w	($0972),d3
	move.w	($0976),d2
	move.w	d3,d0
	addq.w	#1,d0
	sub.w	d2,d0
	cmp.w	d0,d1
	bcc.s	Lffa644
	move.w	($0d08),d4
	bne.s	Lffa654
	movem.l	d1-d2,-(a7)
	move.w	d1,d4
	move.l	($0948),d0
	lsr.l	#7,d0
	lsr.l	#2,d0
	move.w	d3,d1
	addq.w	#1,d1
	lsl.w	#2,d1
	subq.w	#1,d1
	add.w	d1,d0
	move.l	d0,d1
	sub.w	d4,d1
	sub.w	d4,d1
	sub.w	d4,d1
	sub.w	d4,d1
	lsl.w	#8,d1
	move.b	d0,d1
	move.w	d3,d0
	addq.w	#1,d0
	sub.w	d2,d0
	sub.w	d4,d0
	lsl.w	#2,d0
	move.w	#$feff,d2
	bsr.w	Lffa07a
Lffa63e:
	movem.l	(a7)+,d1-d2
	move.w	d1,d0
Lffa644:
	moveq.l	#$00,d1
	move.w	d2,d1
	bsr.w	Lff9e40
	moveq.l	#$00,d0
	move.w	d0,($0974)
	rts

Lffa654:
	movem.l	d1-d2,-(a7)
	move.w	d0,d4
	sub.w	d1,d4
	lsl.w	#5,d4
	subq.w	#1,d4
	addq.w	#1,d3
	lsl.l	#4,d3
	subq.l	#1,d3
	lsl.l	#7,d3
	movea.l	d3,a2
	moveq.l	#$00,d0
	move.w	d1,d0
	swap.w	d0
	lsr.l	#5,d0
	neg.l	d0
	movea.l	d0,a1
	adda.l	a2,a1
	move.l	($0944),d0
	add.l	($0948),d0
	adda.l	d0,a1
	adda.l	d0,a2
	bsr.w	Lffa124
	bra.s	Lffa63e
Lffa68a:
	tst.b	d1
	bne.s	Lffa690
	moveq.l	#$01,d1
Lffa690:
	and.w	#$00ff,d1
	moveq.l	#$00,d2
	moveq.l	#$00,d3
	move.w	($0972),d3
	move.w	($0976),d2
	move.w	d3,d0
	addq.w	#1,d0
	sub.w	d2,d0
	cmp.w	d0,d1
	bcc.s	Lffa644
	move.w	($0d08),d4
	bne.s	Lffa6f2
	movem.l	d0-d2,-(a7)
	move.w	d1,d4
	move.l	($0948),d0
	lsr.l	#7,d0
	lsr.l	#2,d0
	move.w	d2,d1
	lsl.w	#2,d1
	add.w	d1,d0
	move.l	d0,d1
	add.w	d4,d1
	add.w	d4,d1
	add.w	d4,d1
	add.w	d4,d1
	lsl.w	#8,d1
	move.b	d0,d1
	move.w	d3,d0
	addq.w	#1,d0
	sub.w	d2,d0
	sub.w	d4,d0
	lsl.w	#2,d0
	move.w	#$0101,d2
	bsr.w	Lffa07a
Lffa6e4:
	movem.l	(a7)+,d0-d2
	sub.w	d1,d0
	add.w	d0,d2
	move.w	d1,d0
	bra.w	Lffa644
Lffa6f2:
	movem.l	d0-d2,-(a7)
	move.w	d0,d4
	sub.w	d1,d4
	lsl.w	#5,d4
	subq.w	#1,d4
	swap.w	d2
	lsr.l	#5,d2
	movea.l	d2,a2
	moveq.l	#$00,d0
	move.w	d1,d0
	swap.w	d0
	lsr.l	#5,d0
	movea.l	d0,a1
	adda.l	a2,a1
	move.l	($0944),d0
	add.l	($0948),d0
	adda.l	d0,a1
	adda.l	d0,a2
	bsr.w	Lffa136
	bra.s	Lffa6e4
Lffa722:
	moveq.l	#$00,d6
	tst.w	d1
	bpl.s	Lffa72a
	moveq.l	#$01,d1
Lffa72a:
	move.w	($0970),d3
	move.w	($0974),d2
	sub.w	d2,d3
	bcs.s	Lffa760
	cmp.w	d1,d3
	bcs.s	Lffa744
	move.w	d1,d0
	subq.w	#1,d0
	move.w	($0974),d2
	bra.s	Lffa74e
Lffa744:
	move.w	($0970),d0
	move.w	($0974),d2
	sub.w	d2,d0
Lffa74e:
	move.b	($0994),d7
	move.b	d6,($0994)
	bsr.w	Lffa560
	move.b	d7,($0994)
	rts

Lffa760:
	moveq.l	#$ff,d0
	rts

Lffa764:
	move.b	($0994),d6
	tst.w	d1
	bgt.s	Lffa76e
	moveq.l	#$01,d1
Lffa76e:
	move.w	d1,d4
	move.w	($0970),d3
	move.w	($0974),d1
	sub.w	d1,d3
	bcs.s	Lffa760
	sub.w	d4,d3
	bcs.s	Lffa744
	add.w	d4,d1
	move.w	($0974),d2
	bsr.s	Lffa7ca
	move.w	($0970),d2
	move.w	d4,d0
	subq.w	#1,d0
	sub.w	d0,d2
	bra.s	Lffa74e
Lffa794:
	moveq.l	#$00,d6
	tst.w	d1
	bpl.s	Lffa79c
	moveq.l	#$01,d1
Lffa79c:
	move.w	d1,d4
	move.w	($0970),d3
	move.w	($0974),d1
	sub.w	d1,d3
	bcs.s	Lffa760
	sub.w	d4,d3
	bcs.s	Lffa744
	move.w	($0970),d2
	add.w	d3,d1
	addq.w	#1,d1
	addq.w	#1,d2
	bsr.s	Lffa7c4
	move.w	($0974),d2
	move.w	d4,d0
	subq.w	#1,d0
	bra.s	Lffa74e
Lffa7c4:
	lea.l	(Lffa814,pc),a4
	bra.s	Lffa7ce
Lffa7ca:
	lea.l	(Lffa7fc,pc),a4
Lffa7ce:
	moveq.l	#$00,d0
	move.w	($0976),d0
	swap.w	d0
	lsr.l	#5,d0
	movea.l	d0,a0
	adda.l	($0948),a0
	adda.l	($0944),a0
	movea.l	a0,a1
	adda.w	d1,a0
	adda.w	d2,a1
	moveq.l	#$02,d0
	swap.w	d0
	movea.l	a0,a2
	movea.l	a1,a3
	adda.l	d0,a2
	adda.l	d0,a3
	moveq.l	#$7f,d2
	sub.w	d3,d2
	moveq.l	#$0f,d1
	jmp	(a4)

Lffa7fc:
	move.w	d3,d0
Lffa7fe:
	move.b	(a0)+,(a1)+
	move.b	(a2)+,(a3)+
	dbra.w	d0,Lffa7fe
	adda.w	d2,a0
	adda.w	d2,a1
	adda.w	d2,a2
	adda.w	d2,a3
	dbra.w	d1,Lffa7fc
	rts

Lffa814:
	move.w	#$0780,d0
	adda.w	d0,a0
	adda.w	d0,a1
	adda.w	d0,a2
	adda.w	d0,a3
Lffa820:
	move.w	d3,d0
Lffa822:
	move.b	-(a0),-(a1)
	move.b	-(a2),-(a3)
	dbra.w	d0,Lffa822
	suba.w	d2,a0
	suba.w	d2,a1
	suba.w	d2,a2
	suba.w	d2,a3
	dbra.w	d1,Lffa820
	rts

Lffa838:
	movec.l	vbr,d0
	bra.s	Lffa842
Lffa83e:
	bra.s	Lffa838
Call_B_INTVCS:
	moveq.l	#$00,d0
Lffa842:
	cmp.w	#$0200,d1
	bcc.s	Lffa858
	add.w	d1,d0
	add.w	d1,d0
	add.w	d1,d0
	add.w	d1,d0
	movea.l	d0,a0
	move.l	(a0),d0
	move.l	a1,(a0)
	rts

Lffa858:
	moveq.l	#$ff,d0
	rts

Call_B_SUPER:
	move.l	a1,d0
	beq.s	Lffa87a
	lea.l	($000e,a7),a0
	moveq.l	#$00,d0
	tst.b	($0cbc)
	beq.s	Lffa870
	addq.l	#2,a0
	move.w	-(a0),-(a1)
Lffa870:
	move.l	-(a0),-(a1)
	move.w	-(a0),-(a1)
	andi.w	#$dfff,(a1)
	bra.s	Lffa8a0
Lffa87a:
	moveq.l	#$ff,d0
	btst.b	#$05,($0008,a7)
	bne.s	Lffa8a6
	lea.l	($000e,a7),a0
	move.l	usp,a1
	move.l	a0,d0
	tst.b	($0cbc)
	beq.s	Lffa898
	addq.l	#2,a0
	move.l	a0,d0
	move.w	-(a0),-(a1)
Lffa898:
	move.l	-(a0),-(a1)
	move.w	-(a0),-(a1)
	ori.w	#$2000,(a1)
Lffa8a0:
	move.l	-(a0),-(a1)
	move.l	-(a0),-(a1)
	movea.l	a1,a7
Lffa8a6:
	rts

Call_B_BPEEK:
	move.b	(a1)+,d0
	rts

Call_B_WPEEK:
	move.w	(a1)+,d0
	rts

Call_B_LPEEK:
	move.l	(a1)+,d0
	rts

Call_B_MEMSTR:
	swap.w	d1
Lffa8b6:
	swap.w	d1
Lffa8b8:
	move.b	(a1)+,(a2)+
	dbra.w	d1,Lffa8b8
	swap.w	d1
	dbra.w	d1,Lffa8b6
	rts

Call_B_BPOKE:
	move.b	d1,(a1)+
	rts

Call_B_WPOKE:
	move.w	d1,(a1)+
	rts

Call_B_LPOKE:
	move.l	d1,(a1)+
	rts

Call_B_MEMSET:
	swap.w	d1
Lffa8d4:
	swap.w	d1
Lffa8d6:
	move.b	(a2)+,(a1)+
	dbra.w	d1,Lffa8d6
	swap.w	d1
	dbra.w	d1,Lffa8d4
	rts

Call_DMAMOVE:
	cmp.l	#$0000ff00,d2
	bcs.s	Lffa920
	move.l	d2,-(a7)
	move.l	#$0000ff00,d2
	bsr.s	Lffa920
	btst.l	#$00,d1
	beq.s	Lffa8fe
	adda.l	d2,a2
Lffa8fe:
	btst.l	#$01,d1
	beq.s	Lffa906
	suba.l	d2,a2
Lffa906:
	btst.l	#$02,d1
	beq.s	Lffa90e
	adda.l	d2,a1
Lffa90e:
	btst.l	#$03,d1
	beq.s	Lffa916
	suba.l	d2,a1
Lffa916:
	move.l	d2,d0
	move.l	(a7)+,d2
	sub.l	d0,d2
	bne.s	Call_DMAMOVE
	rts

Lffa920:
	tst.b	($0c34)
	bne.s	Lffa920
	move.b	#$8a,($0c34)
	lea.l	($00e84080),a0
	move.b	d1,d0
	and.b	#$80,d0
	or.b	#$01,d0
	move.b	d0,($0005,a0)
	move.l	a1,($000c,a0)
	move.b	d1,d0
	and.b	#$7f,d0
	move.b	d0,($0006,a0)
	move.l	a2,($0014,a0)
	st.b	(a0)
	move.w	d2,($000a,a0)
	bsr.w	Lff8284
	move.b	#$88,($0007,a0)
	rts

Call_DMAMOV_A:
	tst.b	($0c34)
	bne.s	Call_DMAMOV_A
	move.b	#$8b,($0c34)
	lea.l	($00e84080),a0
	move.b	d1,d0
	and.b	#$80,d0
	or.b	#$09,d0
	move.b	d0,($0005,a0)
Lffa984:
	move.l	a1,($001c,a0)
	move.b	d1,d0
	and.b	#$7f,d0
	move.b	d0,($0006,a0)
	move.l	a2,($0014,a0)
	st.b	(a0)
	move.w	d2,($001a,a0)
	bsr.w	Lff8284
	move.b	#$88,($0007,a0)
	rts

Call_DMAMOV_L:
	tst.b	($0c34)
	bne.s	Call_DMAMOV_L
	move.b	#$8c,($0c34)
	lea.l	($00e84080),a0
	move.b	d1,d0
	and.b	#$80,d0
	or.b	#$0d,d0
	move.b	d0,($0005,a0)
	bra.s	Lffa984
Call_DMAMODE:
	clr.l	d0
	move.b	($0c34),d0
	rts

Call_BOOTINF:
	clr.l	d0
	move.b	($09df),d0
	ror.l	#8,d0
	move.b	($09e0),d0
	cmp.b	#$01,d0
	beq.s	Lffa9ec
	cmp.b	#$02,d0
	beq.s	Lffa9fa
	rts

Lffa9ec:
	clr.w	d0
	move.l	d0,-(a7)
	move.l	($00ed000c),d0
	or.l	(a7)+,d0
	rts

Lffa9fa:
	clr.w	d0
	move.l	d0,-(a7)
	move.l	($00ed0010),d0
	or.l	(a7)+,d0
	rts

Lffaa08:
	tst.b	($0ade)
	bne.s	Lffaa30
	tst.b	($0bc4)
	bne.s	Lffaa30
	st.b	($0ade)
	movem.l	d0-d7/a0-a6,-(a7)
	lea.l	($0a7a),a5
	bsr.w	Lffaf44
	bsr.w	Lffae58
	movem.l	(a7)+,d0-d7/a0-a6
	sf.b	($0ade)
Lffaa30:
	rts

Call_MS_INIT:
	move.l	a5,-(a7)
	movem.l	d1-d7/a0-a4,-(a7)
	lea.l	($0a7a),a5
	movem.l	d1-d2/a1,($006a,a5)
	bsr.s	Call_MS_CUROF
	st.b	($0064,a5)
	bsr.w	Lffaff0
	bsr.w	Lffafe2
	sf.b	($0064,a5)
	movem.l	(a7)+,d1-d7/a0-a4
	movea.l	(a7)+,a5
	rts

Call_MS_CURON:
	move.l	a5,-(a7)
	movem.l	d1-d7/a0-a4,-(a7)
	lea.l	($0a7a),a5
	movem.l	d1-d2/a1,($006a,a5)
	st.b	($0064,a5)
	tst.b	($0028,a5)
	bne.s	Lffaa7e
	bsr.w	Lffaf6a
	st.b	($0028,a5)
Lffaa7e:
	sf.b	($0064,a5)
	movem.l	(a7)+,d1-d7/a0-a4
	movea.l	(a7)+,a5
	rts

Call_MS_CUROF:
	move.l	a5,-(a7)
	movem.l	d1-d7/a0-a4,-(a7)
	lea.l	($0a7a),a5
	movem.l	d1-d2/a1,($006a,a5)
	st.b	($0064,a5)
	tst.b	($0028,a5)
	beq.s	Lffaaac
	sf.b	($0028,a5)
	bsr.w	Lffafb4
Lffaaac:
	sf.b	($0064,a5)
	movem.l	(a7)+,d1-d7/a0-a4
	movea.l	(a7)+,a5
	rts

Call_MS_STAT:
	move.l	a5,-(a7)
	movem.l	d1-d7/a0-a4,-(a7)
	lea.l	($0a7a),a5
	movem.l	d1-d2/a1,($006a,a5)
	moveq.l	#$00,d0
	move.b	($0028,a5),d0
	ext.w	d0
	movem.l	(a7)+,d1-d7/a0-a4
	movea.l	(a7)+,a5
	rts

Call_MS_GETDT:
	move.l	a5,-(a7)
	movem.l	d1-d7/a0-a4,-(a7)
	lea.l	($0a7a),a5
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

Call_MS_CURGT:
	move.l	a5,-(a7)
	movem.l	d1-d7/a0-a4,-(a7)
	lea.l	($0a7a),a5
	movem.l	d1-d2/a1,($006a,a5)
	move.l	($0054,a5),d0
	movem.l	(a7)+,d1-d7/a0-a4
	movea.l	(a7)+,a5
	rts

Call_MS_CURST:
	move.l	a5,-(a7)
	movem.l	d1-d7/a0-a4,-(a7)
	lea.l	($0a7a),a5
	movem.l	d1-d2/a1,($006a,a5)
	st.b	($0064,a5)
	move.l	($0020,a5),d3
	move.l	($0024,a5),d2
	move.l	d1,d0
	sub.w	d3,d2
	sub.w	d3,d0
	cmp.w	d0,d2
	bcs.s	Lffab84
	swap.w	d2
	swap.w	d3
	swap.w	d0
	sub.w	d3,d2
	sub.w	d3,d0
	cmp.w	d0,d2
	bcs.s	Lffab84
	move.b	($0028,a5),-(a7)
	bsr.w	Call_MS_CUROF
	move.l	d1,($0054,a5)
	tst.b	(a7)+
	beq.s	Lffab76
	bsr.w	Call_MS_CURON
Lffab76:
	moveq.l	#$00,d0
Lffab78:
	sf.b	($0064,a5)
	movem.l	(a7)+,d1-d7/a0-a4
	movea.l	(a7)+,a5
	rts

Lffab84:
	moveq.l	#$ff,d0
	bra.s	Lffab78
Call_MS_LIMIT:
	move.l	a5,-(a7)
	movem.l	d1-d7/a0-a4,-(a7)
	lea.l	($0a7a),a5
	movem.l	d1-d2/a1,($006a,a5)
	st.b	($0064,a5)
	move.l	($006a,a5),d1
	move.l	($006e,a5),d2
	cmp.w	#$03f0,d1
	bcc.s	Lffac22
	swap.w	d1
	cmp.w	#$0400,d1
	bcc.s	Lffac22
	swap.w	d1
	cmp.w	#$03f0,d2
	bcc.s	Lffac22
	cmp.w	d1,d2
	ble.s	Lffac22
	swap.w	d1
	swap.w	d2
	cmp.w	#$0400,d2
	bcc.s	Lffac22
	cmp.w	d1,d2
	ble.s	Lffac22
	swap.w	d1
	swap.w	d2
	move.b	($0028,a5),-(a7)
	bsr.w	Call_MS_CUROF
	move.l	d1,($0020,a5)
	move.l	d2,($0024,a5)
	move.l	($0054,a5),d3
	cmp.w	d3,d1
	ble.s	Lffabea
	move.w	d1,d3
Lffabea:
	swap.w	d1
	swap.w	d3
	cmp.w	d3,d1
	ble.s	Lffabf4
	move.w	d1,d3
Lffabf4:
	swap.w	d3
	cmp.w	d3,d2
	bgt.s	Lffabfc
	move.w	d2,d3
Lffabfc:
	swap.w	d2
	swap.w	d3
	cmp.w	d3,d2
	bgt.s	Lffac06
	move.w	d2,d3
Lffac06:
	swap.w	d3
	move.l	d3,($0054,a5)
	tst.b	(a7)+
	beq.s	Lffac14
	bsr.w	Call_MS_CURON
Lffac14:
	moveq.l	#$00,d0
Lffac16:
	sf.b	($0064,a5)
	movem.l	(a7)+,d1-d7/a0-a4
	movea.l	(a7)+,a5
	rts

Lffac22:
	moveq.l	#$ff,d0
	bra.s	Lffac16
Call_MS_OFFTM:
	move.l	a5,-(a7)
	movem.l	d1-d7/a0-a4,-(a7)
	lea.l	($0a7a),a5
	movem.l	d1-d2/a1,($006a,a5)
	clr.w	d7
	bra.s	Lffac4e
Call_MS_ONTM:
	move.l	a5,-(a7)
	movem.l	d1-d7/a0-a4,-(a7)
	lea.l	($0a7a),a5
	movem.l	d1-d2/a1,($006a,a5)
	move.w	#$ffff,d7
Lffac4e:
	move.l	($0054,a5),($0058,a5)
	lea.l	($004c,a5),a0
	tst.w	($006c,a5)
	beq.s	Lffac62
	lea.l	($0002,a0),a0
Lffac62:
	move.w	#$0001,d1
	move.w	#$0064,d2
	mulu.w	($0cb8),d2
	divu.w	#$0342,d2
	cmpi.b	#$01,($0cbc)
	bls.s	Lffac86
	movec.l	cacr,d0
	move.l	d0,-(a7)
	moveq.l	#$01,d0
	movec.l	d0,cacr
Lffac86:
	move.w	($0054,a5),d0
	sub.w	($0058,a5),d0
	cmp.w	($000a,a5),d0
	bgt.s	Lfface6
	neg.w	d0
	cmp.w	($000a,a5),d0
	bgt.s	Lfface6
	move.w	($0056,a5),d0
	sub.w	($005a,a5),d0
	cmp.w	($000a,a5),d0
	bgt.s	Lfface6
	neg.w	d0
	cmp.w	($000a,a5),d0
	bgt.s	Lfface6
	tst.w	d7
	bne.s	Lffacbc
	tst.w	(a0)
	beq.s	Lfface8
	bra.s	Lffacc0
Lffacbc:
	tst.w	(a0)
	bne.s	Lfface8
Lffacc0:
	subq.w	#1,d2
	bne.s	Lffacde
	cmp.w	#$ffff,d1
	beq.s	Lffacd2
	addq.w	#1,d1
	cmp.w	($0070,a5),d1
	beq.s	Lfface0
Lffacd2:
	move.w	#$0064,d2
	mulu.w	($0cb8),d2
	divu.w	#$0342,d2
Lffacde:
	bra.s	Lffac86
Lfface0:
	move.w	#$ffff,d1
	bra.s	Lfface8
Lfface6:
	clr.w	d1
Lfface8:
	cmpi.b	#$01,($0cbc)
	bls.s	Lffacf6
	move.l	(a7)+,d0
	movec.l	d0,cacr
Lffacf6:
	moveq.l	#$00,d0
	move.w	d1,d0
	movem.l	(a7)+,d1-d7/a0-a4
	movea.l	(a7)+,a5
	rts

Call_MS_PATST:
	move.l	a5,-(a7)
	movem.l	d1-d7/a0-a4,-(a7)
	lea.l	($0a7a),a5
	movem.l	d1-d2/a1,($006a,a5)
	st.b	($0064,a5)
	move.w	($006c,a5),d1
	cmp.w	#$000f,d1
	bhi.s	Lffad46
	tst.b	($0028,a5)
	beq.s	Lffad2e
	bsr.w	Lffafb4
	move.w	($006c,a5),d1
Lffad2e:
	lsl.w	#2,d1
	lea.l	($00f6,a5),a0
	lea.l	(a0,d1.w),a0
	move.l	($0072,a5),(a0)
	tst.b	($0028,a5)
	beq.s	Lffad46
	bsr.w	Lffaf6a
Lffad46:
	sf.b	($0064,a5)
	movem.l	(a7)+,d1-d7/a0-a4
	movea.l	(a7)+,a5
	rts

Call_MS_SEL:
	move.l	a5,-(a7)
	movem.l	d1-d7/a0-a4,-(a7)
	lea.l	($0a7a),a5
	movem.l	d1-d2/a1,($006a,a5)
	st.b	($0064,a5)
	tst.b	($0028,a5)
	beq.s	Lffad70
	bsr.w	Lffafb4
Lffad70:
	move.w	($006c,a5),d0
	and.w	#$000f,d0
	lsl.w	#2,d0
	lea.l	($00f6,a5),a0
	lea.l	(a0,d0.w),a0
	movea.l	(a0),a0
	move.w	(a0)+,d0
	cmp.w	#$0010,d0
	bcs.s	Lffad8e
	clr.w	d0
Lffad8e:
	move.w	d0,($005c,a5)
	move.w	(a0)+,d0
	cmp.w	#$0010,d0
	bcs.s	Lffad9c
	clr.w	d0
Lffad9c:
	move.w	d0,($005e,a5)
	move.l	a0,($002a,a5)
	clr.w	($0046,a5)
	clr.w	($0048,a5)
	sf.b	($004a,a5)
	tst.b	($0028,a5)
	beq.s	Lffadba
	bsr.w	Lffaf6a
Lffadba:
	sf.b	($0064,a5)
	movem.l	(a7)+,d1-d7/a0-a4
	movea.l	(a7)+,a5
	rts

Call_MS_SEL2:
	move.l	a5,-(a7)
	movem.l	d1-d7/a0-a4,-(a7)
	lea.l	($0a7a),a5
	movem.l	d1-d2/a1,($006a,a5)
	st.b	($0064,a5)
	tst.b	($0028,a5)
	beq.s	Lffade4
	bsr.w	Lffafb4
Lffade4:
	movea.l	($0072,a5),a0
	lea.l	($002a,a5),a1
	moveq.l	#$05,d7
Lffadee:
	move.w	(a0)+,d0
	cmp.w	#$ffff,d0
	beq.s	Lffae32
	and.w	#$000f,d0
	lsl.w	#2,d0
	lea.l	($00f6,a5),a2
	lea.l	(a2,d0.w),a2
	movea.l	(a2),a2
	cmp.w	#$0005,d7
	bne.s	Lffae2a
	move.w	(a2),d0
	cmp.w	#$0010,d0
	bcs.s	Lffae16
	clr.w	d0
Lffae16:
	move.w	d0,($005c,a5)
	move.w	($0002,a2),d0
	cmp.w	#$0010,d0
	bcs.s	Lffae26
	clr.w	d0
Lffae26:
	move.w	d0,($005e,a5)
Lffae2a:
	addq.l	#4,a2
	move.l	a2,(a1)+
	dbra.w	d7,Lffadee
Lffae32:
	moveq.l	#$00,d0
	move.l	d0,(a1)+
	move.w	d0,($0048,a5)
	move.w	d0,($0046,a5)
	st.b	($004a,a5)
	tst.b	($0028,a5)
	beq.s	Lffae4c
	bsr.w	Lffaf6a
Lffae4c:
	sf.b	($0064,a5)
	movem.l	(a7)+,d1-d7/a0-a4
	movea.l	(a7)+,a5
	rts

Lffae58:
	move.l	($0050,a5),d2
	tst.b	($004a,a5)
	bne.s	Lffae6a
Lffae62:
	tst.l	d2
	bne.s	Lffae96
	bra.w	Lffaf18
Lffae6a:
	addq.w	#1,($0048,a5)
	move.w	($0048,a5),d0
	cmp.w	($000c,a5),d0
	bne.s	Lffae62
	clr.w	($0048,a5)
	addq.w	#1,($0046,a5)
	move.w	($0046,a5),d0
	lea.l	($002a,a5),a0
	lsl.w	#2,d0
	lea.l	(a0,d0.w),a0
	tst.w	(a0)
	bne.s	Lffae96
	clr.w	($0046,a5)
Lffae96:
	swap.w	d2
	move.w	d2,d0
	bsr.w	Lffaf20
	move.w	($0054,a5),d1
	add.w	d1,d0
	cmp.w	($0020,a5),d0
	bgt.s	Lffaeae
	move.w	($0020,a5),d0
Lffaeae:
	cmp.w	($0024,a5),d0
	blt.s	Lffaeb8
	move.w	($0024,a5),d0
Lffaeb8:
	move.w	d0,d7
	swap.w	d7
	swap.w	d2
	move.w	d2,d0
	bsr.s	Lffaf20
	move.w	($0056,a5),d1
	add.w	d1,d0
	cmp.w	($0022,a5),d0
	bgt.s	Lffaed2
	move.w	($0022,a5),d0
Lffaed2:
	cmp.w	($0026,a5),d0
	blt.s	Lffaedc
	move.w	($0026,a5),d0
Lffaedc:
	move.w	d0,d7
	tst.b	($0028,a5)
	beq.s	Lffaf1a
	sf.b	($0028,a5)
	tst.w	($0008,a5)
	beq.s	Lffaf0a
Lffaeee:
	btst.b	#$04,($00e88001)
	bne.s	Lffaeee
	cmpi.w	#$0070,($0056,a5)
	bge.s	Lffaf0a
	move.l	#$00000b00,d0
Lffaf06:
	subq.l	#1,d0
	bne.s	Lffaf06
Lffaf0a:
	bsr.w	Lffafb4
	move.l	d7,($0054,a5)
	bsr.s	Lffaf6a
	st.b	($0028,a5)
Lffaf18:
	rts

Lffaf1a:
	move.l	d7,($0054,a5)
	rts

Lffaf20:
	clr.w	-(a7)
	tst.w	d0
	bgt.s	Lffaf2a
	addq.w	#1,(a7)
	neg.w	d0
Lffaf2a:
	move.w	d0,d1
	lsr.w	#3,d1
	bne.s	Lffaf34
	move.w	#$0001,d1
Lffaf34:
	mulu.w	d1,d0
	move.w	d0,d1
	lsr.w	#2,d1
	add.w	d1,d0
	tst.w	(a7)+
	beq.s	Lffaf42
	neg.w	d0
Lffaf42:
	rts

Lffaf44:
	moveq.l	#$ff,d1
	move.b	(a1)+,d0
	lsr.b	#1,d0
	bcs.s	Lffaf4e
	clr.w	d1
Lffaf4e:
	swap.w	d1
	lsr.b	#1,d0
	bcs.s	Lffaf56
	clr.w	d1
Lffaf56:
	move.l	d1,($004c,a5)
	move.b	(a1)+,d0
	ext.w	d0
	swap.w	d0
	move.b	(a1),d0
	ext.w	d0
	move.l	d0,($0050,a5)
	rts

Lffaf6a:
	move.w	($00e8002a),-(a7)
	bclr.b	#$00,($00e8002a)
	movea.l	($0004,a5),a0
	lea.l	($0076,a5),a1
	bsr.w	Lffb152
	movea.l	($0000.w,a5),a0
	lea.l	($00b6,a5),a1
	bsr.w	Lffb152
	lea.l	($002a,a5),a0
	move.w	($0046,a5),d0
	lsl.w	#2,d0
	lea.l	(a0,d0.w),a0
	movea.l	(a0),a2
	movea.l	($0004,a5),a0
	movea.l	($0000.w,a5),a1
	bsr.w	Lffb06e
	move.w	(a7)+,($00e8002a)
	rts

Lffafb4:
	move.w	($00e8002a),-(a7)
	bclr.b	#$00,($00e8002a)
	lea.l	($0076,a5),a0
	movea.l	($0004,a5),a1
	bsr.w	Lffb1a4
	lea.l	($00b6,a5),a0
	movea.l	($0000.w,a5),a1
	bsr.w	Lffb1a4
	move.w	(a7)+,($00e8002a)
	rts

Lffafe2:
	lea.l	(Lffaa08,pc),a0
	move.l	a0,d1
	moveq.l	#$01,d2
	bsr.w	Call_Unknown_36
	rts

Lffaff0:
	lea.l	($0000.w,a5),a1
	lea.l	(Lffb306,pc),a0
	move.l	#$0000001f.l,d1
Lffaffe:
	move.b	(a0)+,(a1)+
	dbra.w	d1,Lffaffe
	lea.l	($00f6,a5),a0
	moveq.l	#$03,d1
	lea.l	(Lffb1f6,pc),a1
	move.l	a1,d2
Lffb010:
	move.l	a1,(a0)+
	lea.l	($0044,a1),a1
	dbra.w	d1,Lffb010
	moveq.l	#$0b,d1
Lffb01c:
	move.l	d2,(a0)+
	dbra.w	d1,Lffb01c
	movea.l	($00f6,a5),a0
	move.w	(a0)+,($005c,a5)
	move.w	(a0)+,($005e,a5)
	move.l	a0,($002a,a5)
	move.w	#$0002,($0020,a5)
	move.w	#$0002,($0022,a5)
	move.w	($096c),d0
	subq.w	#2,d0
	move.w	d0,($0024,a5)
	move.w	($096e),d0
	move.w	d0,($0026,a5)
	move.w	($0020,a5),($0054,a5)
	move.w	($0022,a5),($0056,a5)
	sf.b	($0064,a5)
	sf.b	($0028,a5)
	sf.b	($004a,a5)
	clr.w	($0046,a5)
	rts

Lffb06e:
	moveq.l	#$00,d0
	move.w	($0056,a5),d0
	sub.w	($005e,a5),d0
	bpl.s	Lffb090
	add.w	#$000f,d0
	bmi.s	Lffb0f4
	move.w	d0,d2
	add.w	d0,d0
	adda.w	#$001e,a2
	suba.w	d0,a2
	move.w	#$0080,d4
	bra.s	Lffb0aa
Lffb090:
	moveq.l	#$0f,d2
	cmp.w	#$03f0,d0
	bls.s	Lffb0a0
	move.w	#$03ff,d2
	sub.w	d0,d2
	bmi.s	Lffb0f4
Lffb0a0:
	move.w	#$0080,d4
	mulu.w	d4,d0
	adda.l	d0,a0
	adda.l	d0,a1
Lffb0aa:
	move.w	($0054,a5),d0
	sub.w	($005c,a5),d0
	bpl.s	Lffb0bc
	neg.w	d0
	move.w	d0,d3
	moveq.l	#$00,d1
	bra.s	Lffb11a
Lffb0bc:
	move.w	d0,d1
	lsr.w	#4,d1
	add.w	d1,d1
	adda.w	d1,a0
	adda.w	d1,a1
	and.w	#$000f,d0
	beq.s	Lffb13a
	moveq.l	#$10,d3
	sub.w	d0,d3
	cmp.w	#$007e,d1
	bcc.s	Lffb0f6
Lffb0d6:
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
	dbra.w	d2,Lffb0d6
Lffb0f4:
	rts

Lffb0f6:
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
	dbra.w	d2,Lffb0f6
	rts

Lffb11a:
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
	dbra.w	d2,Lffb11a
	rts

Lffb13a:
	move.w	($0020,a2),d1
	move.w	(a2)+,d0
	and.w	d0,(a1)
	or.w	d1,(a1)
	not.w	d0
	or.w	d0,(a0)
	adda.w	d4,a0
	adda.w	d4,a1
	dbra.w	d2,Lffb13a
	rts

Lffb152:
	moveq.l	#$00,d0
	move.w	($0056,a5),d0
	sub.w	($005e,a5),d0
	bpl.s	Lffb160
	moveq.l	#$00,d0
Lffb160:
	moveq.l	#$0f,d2
	cmp.w	#$03f0,d0
	bls.s	Lffb170
	move.w	#$03ff,d2
	sub.w	d0,d2
	bmi.s	Lffb1a2
Lffb170:
	move.w	#$0080,d1
	mulu.w	d1,d0
	adda.l	d0,a0
	move.w	($0054,a5),d0
	sub.w	($005c,a5),d0
	bpl.s	Lffb184
	moveq.l	#$00,d0
Lffb184:
	lsr.w	#4,d0
	add.w	d0,d0
	adda.w	d0,a0
	cmp.w	#$007e,d0
	bcc.s	Lffb19a
Lffb190:
	move.l	(a0),(a1)+
	adda.w	d1,a0
	dbra.w	d2,Lffb190
	rts

Lffb19a:
	move.w	(a0),(a1)+
	adda.w	d1,a0
	dbra.w	d2,Lffb19a
Lffb1a2:
	rts

Lffb1a4:
	moveq.l	#$00,d0
	move.w	($0056,a5),d0
	sub.w	($005e,a5),d0
	bpl.s	Lffb1b2
	moveq.l	#$00,d0
Lffb1b2:
	moveq.l	#$0f,d2
	cmp.w	#$03f0,d0
	bls.s	Lffb1c2
	move.w	#$03ff,d2
	sub.w	d0,d2
	bmi.s	Lffb1f4
Lffb1c2:
	move.w	#$0080,d1
	mulu.w	d1,d0
	adda.l	d0,a1
	move.w	($0054,a5),d0
	sub.w	($005c,a5),d0
	bpl.s	Lffb1d6
	moveq.l	#$00,d0
Lffb1d6:
	lsr.w	#4,d0
	add.w	d0,d0
	adda.w	d0,a1
	cmp.w	#$007e,d0
	bcc.s	Lffb1ec
Lffb1e2:
	move.l	(a0)+,(a1)
	adda.w	d1,a1
	dbra.w	d2,Lffb1e2
	rts

Lffb1ec:
	move.w	(a0)+,(a1)
	adda.w	d1,a1
	dbra.w	d2,Lffb1ec
Lffb1f4:
	rts

Lffb1f6:
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
Lffb306:
	.dc.b	$00,$e6,$00,$00,$00,$e4,$00,$00
	.dc.b	$00,$00,$00,$05,$00,$04,$00,$00
	.dc.b	$00,$f6,$00,$00,$00,$00,$00,$80
	.dc.b	$03,$f0,$04,$00,$03,$f0,$00,$80
Call_G_CLR_ON:
	movem.l	d1-d2/a1,-(a7)
	move.w	#$0020,($00e82600)
	bset.b	#$03,($00e80028)
	lea.l	($00c00000),a0
	move.l	a0,($095c)
	lea.l	($00c80000),a1
	bsr.w	Lffb43a
	bclr.b	#$03,($00e80028)
	bsr.s	Lffb38a
	and.w	#$0003,d0
	bne.s	$00ffb364
	bsr.w	Lffb3f4
	bra.s	$00ffb374
	cmp.w	#$0001,d0
	bne.s	$00ffb370
	bsr.w	Lffb408
	bra.s	$00ffb374
	bsr.w	Lffb41e
	bclr.b	#$03,($00e80028)
	move.w	#$003f,($00e82600)
	movem.l	(a7)+,d1-d2/a1
	rts

Lffb38a:
	move.b	($00e80028),d1
	or.b	#$07,d1
	move.b	($093c),d0
	move.b	d0,d2
	and.b	#$0f,d2
	cmp.b	#$04,d2
	bcs.s	Lffb3a8
	and.b	#$fb,d1
Lffb3a8:
	moveq.l	#$ff,d2
	and.w	#$000c,d0
	cmp.b	#$0c,d0
	beq.s	Lffb3c8
	bclr.l	#$01,d1
	move.w	#$00ff,d2
	cmp.b	#$08,d0
	beq.s	Lffb3c8
	bclr.l	#$00,d1
	moveq.l	#$0f,d2
Lffb3c8:
	move.b	d1,d0
	move.w	d2,($0964)
	and.w	#$0007,d0
	move.b	d1,($00e80028)
	move.w	d0,($00e82400)
	move.b	d1,d0
	move.l	#$00000400,d1
	btst.l	#$02,d0
	beq.s	Lffb3ee
	add.l	d1,d1
Lffb3ee:
	move.l	d1,($0960)
	rts

Lffb3f4:
	lea.l	(Lffb442,pc),a0
	lea.l	($00e82000),a1
	moveq.l	#$0f,d0
Lffb400:
	move.w	(a0)+,(a1)+
	dbra.w	d0,Lffb400
	rts

Lffb408:
	lea.l	(Lffb462,pc),a0
	lea.l	($00e82000),a1
	move.w	#$00ff,d0
Lffb416:
	move.w	(a0)+,(a1)+
	dbra.w	d0,Lffb416
	rts

Lffb41e:
	lea.l	($00e82000),a0
	move.w	#$007f,d0
	move.w	#$0001,d1
Lffb42c:
	move.w	d1,(a0)+
	move.w	d1,(a0)+
	addi.w	#$0202,d1
	dbra.w	d0,Lffb42c
	rts

Lffb43a:
	clr.l	(a0)+
	cmpa.l	a1,a0
	bne.s	Lffb43a
	rts

Lffb442:
	.dc.b	$00,$00,$52,$94,$00,$20,$00,$3e
	.dc.b	$04,$00,$07,$c0,$04,$20,$07,$fe
	.dc.b	$80,$00,$f8,$00,$80,$20,$f8,$3e
	.dc.b	$84,$00,$ff,$c0,$ad,$6a,$ff,$fe
Lffb462:
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
Call_Unknown_91:
	clr.l	d0
	move.b	($00e80028),d0
	movem.l	d0-d1,-(a7)
	cmp.b	#$ff,d1
	beq.s	$00ffb69c
	and.b	#$07,d1
	and.b	#$f8,d0
	or.b	d1,d0
	move.b	d0,($00e80028)
	move.w	d1,($00e82400)
	move.l	#$00000400,d0
	and.w	#$0004,d1
	beq.s	$00ffb698
	add.l	d0,d0
	move.l	d0,($0960)
	movem.l	(a7)+,d0-d1
	rts

Call_Unknown_92:
	clr.l	d0
	move.w	($00e82500),d0
	cmp.w	#$ffff,d1
	beq.s	Lffb6b6
	move.w	d1,($00e82500)
Lffb6b6:
	rts

Call_Unknown_93:
	clr.l	d0
	move.w	($00e82600),d0
	cmp.w	#$ffff,d1
	beq.s	Lffb6cc
	move.w	d1,($00e82600)
Lffb6cc:
	rts

Call_GPALET:
	lea.l	($00e82000),a0
	move.w	($0964),d0
	beq.s	Lffb700
	cmp.w	#$ffff,d0
	beq.s	Lffb704
	clr.l	d0
	move.w	d1,d0
	cmp.w	($0964),d0
	bhi.s	Lffb700
	add.w	d0,d0
	adda.l	d0,a0
	cmp.l	#$ffffffff,d2
	beq.s	Lffb6fc
	move.w	d2,(a0)
	clr.l	d0
	rts

Lffb6fc:
	move.w	(a0),d0
	rts

Lffb700:
	moveq.l	#$ff,d0
	rts

Lffb704:
	clr.l	d0
	move.l	d3,-(a7)
	clr.l	d3
	move.b	d1,d0
	ror.l	#1,d0
	asl.w	#1,d0
	rol.l	#1,d0
	cmp.l	#$ffffffff,d2
	beq.s	Lffb720
	move.b	d2,(a0,d0.w)
	bra.s	Lffb726
Lffb720:
	move.b	(a0,d0.w),d3
	rol.w	#8,d3
Lffb726:
	move.w	d1,d0
	lsr.w	#8,d0
	ror.l	#1,d0
	asl.w	#1,d0
	rol.l	#1,d0
	ror.w	#8,d2
	cmp.l	#$ffffffff,d2
	beq.s	Lffb740
	move.b	d2,($02,a0,d0.w)
	bra.s	Lffb746
Lffb740:
	move.b	(a0,d0.w),d3
	ror.w	#8,d3
Lffb746:
	rol.w	#8,d2
	move.l	d3,d0
	move.l	(a7)+,d3
	rts

Call_Unknown_95:
	and.w	($0964),d1
	move.w	d1,($0966)
	rts

Call_Unknown_96:
	move.w	d1,d0
	and.w	#$0003,d0
	asl.w	#3,d0
	add.w	#$00c0,d0
	swap.w	d0
	clr.w	d0
	move.l	d0,($095c)
	rts

Call_Unknown_97:
	movem.l	d1-d5/a1,-(a7)
	bsr.w	Lffb9ec
	move.w	($0964),d4
	move.w	d4,(a1)+
	bsr.s	Lffb784
	movem.l	(a7)+,d1-d5/a1
	rts

Lffb784:
	cmp.w	#$ffff,d4
	beq.s	Lffb7fa
	cmp.w	#$00ff,d4
	beq.s	Lffb7e8
	btst.l	#$00,d1
	beq.s	Lffb7b8
Lffb796:
	move.w	d1,d4
Lffb798:
	move.w	(a0)+,d0
	and.w	#$000f,d0
	asl.w	#4,d0
	move.w	(a0)+,d5
	and.w	#$000f,d5
	or.b	d5,d0
	move.b	d0,(a1)+
	subq.w	#1,d4
	dbra.w	d4,Lffb798
	adda.l	d3,a0
	dbra.w	d2,Lffb796
	rts

Lffb7b8:
	move.w	d1,d4
Lffb7ba:
	move.w	(a0)+,d0
	and.w	#$000f,d0
	asl.w	#4,d0
	subq.w	#1,d4
	bcs.s	Lffb7de
Lffb7c6:
	move.w	(a0)+,d5
	and.w	#$000f,d5
	or.b	d5,d0
	move.b	d0,(a1)+
	dbra.w	d4,Lffb7ba
	move.w	d1,d4
	adda.l	d3,a0
	dbra.w	d2,Lffb7ba
	rts

Lffb7de:
	move.w	d1,d4
	adda.l	d3,a0
	dbra.w	d2,Lffb7c6
	rts

Lffb7e8:
	move.w	d1,d4
Lffb7ea:
	move.w	(a0)+,d0
	move.b	d0,(a1)+
	dbra.w	d4,Lffb7ea
	adda.l	d3,a0
	dbra.w	d2,Lffb7e8
	rts

Lffb7fa:
	move.w	d1,d4
Lffb7fc:
	move.w	(a0)+,(a1)+
	dbra.w	d4,Lffb7fc
	adda.l	d3,a0
	dbra.w	d2,Lffb7fa
	rts

Call_Unknown_98:
	movem.l	d1-d6/a1,-(a7)
	move.w	d3,d6
	bsr.w	Lffb9ec
	move.w	(a1)+,d4
	moveq.l	#$ff,d0
	cmp.w	($0964),d4
	bne.s	Lffb822
	bsr.s	Lffb828
	clr.l	d0
Lffb822:
	movem.l	(a7)+,d1-d6/a1
	rts

Lffb828:
	cmp.w	#$ffff,d4
	beq.w	Lffb8c0
	cmp.w	#$00ff,d4
	beq.s	Lffb8a6
	btst.l	#$00,d1
	beq.s	Lffb86a
Lffb83c:
	move.w	d1,d4
Lffb83e:
	move.b	(a1)+,d5
	move.b	d5,d0
	lsr.b	#4,d0
	and.w	#$000f,d0
	cmp.w	d6,d0
	beq.s	Lffb84e
	move.w	d0,(a0)
Lffb84e:
	addq.l	#2,a0
	and.w	#$000f,d5
	cmp.w	d6,d5
	beq.s	Lffb85a
	move.w	d5,(a0)
Lffb85a:
	addq.l	#2,a0
	subq.w	#1,d4
	dbra.w	d4,Lffb83e
	adda.l	d3,a0
	dbra.w	d2,Lffb83c
	rts

Lffb86a:
	move.w	d1,d4
Lffb86c:
	move.b	(a1)+,d5
	move.b	d5,d0
	lsr.b	#4,d0
	and.w	#$000f,d0
	cmp.w	d6,d0
	beq.s	Lffb87c
	move.w	d0,(a0)
Lffb87c:
	addq.l	#2,a0
	subq.w	#1,d4
	bcs.s	Lffb89c
Lffb882:
	and.w	#$000f,d5
	cmp.w	d6,d5
	beq.s	Lffb88c
	move.w	d5,(a0)
Lffb88c:
	addq.l	#2,a0
	dbra.w	d4,Lffb86c
	move.w	d1,d4
	adda.l	d3,a0
	dbra.w	d2,Lffb86c
	rts

Lffb89c:
	move.w	d1,d4
	adda.l	d3,a0
	dbra.w	d2,Lffb882
	rts

Lffb8a6:
	move.w	d1,d4
Lffb8a8:
	clr.w	d0
	move.b	(a1)+,d0
	cmp.w	d6,d0
	beq.s	Lffb8b2
	move.w	d0,(a0)
Lffb8b2:
	addq.l	#2,a0
	dbra.w	d4,Lffb8a8
	adda.l	d3,a0
	dbra.w	d2,Lffb8a6
	rts

Lffb8c0:
	move.w	d1,d4
Lffb8c2:
	move.w	(a1)+,d0
	cmp.w	d6,d0
	beq.s	Lffb8ca
	move.w	d0,(a0)
Lffb8ca:
	addq.l	#2,a0
	dbra.w	d4,Lffb8c2
	adda.l	d3,a0
	dbra.w	d2,Lffb8c0
	rts

Call_Unknown_99:
	movem.l	d1-d5/a1,-(a7)
	bsr.w	Lffb9ec
	move.w	(a1)+,d4
	moveq.l	#$ff,d0
	cmp.w	($0964),d4
	bne.s	Lffb8ee
	bsr.s	Lffb8f4
	clr.l	d0
Lffb8ee:
	movem.l	(a7)+,d1-d5/a1
	rts

Lffb8f4:
	cmp.w	#$ffff,d4
	beq.s	Lffb96c
	cmp.w	#$00ff,d4
	beq.s	Lffb958
	btst.l	#$00,d1
	beq.s	Lffb928
Lffb906:
	move.w	d1,d4
Lffb908:
	move.b	(a1)+,d5
	move.b	d5,d0
	lsr.b	#4,d0
	and.w	#$000f,d0
	move.w	d0,(a0)+
	and.w	#$000f,d5
	move.w	d5,(a0)+
	subq.w	#1,d4
	dbra.w	d4,Lffb908
	adda.l	d3,a0
	dbra.w	d2,Lffb906
	rts

Lffb928:
	move.w	d1,d4
Lffb92a:
	move.b	(a1)+,d5
	move.b	d5,d0
	lsr.b	#4,d0
	and.w	#$000f,d0
	move.w	d0,(a0)+
	subq.w	#1,d4
	bcs.s	Lffb94e
Lffb93a:
	and.w	#$000f,d5
	move.w	d5,(a0)+
	dbra.w	d4,Lffb92a
	move.w	d1,d4
	adda.l	d3,a0
	dbra.w	d2,Lffb92a
	rts

Lffb94e:
	move.w	d1,d4
	adda.l	d3,a0
	dbra.w	d2,Lffb93a
	rts

Lffb958:
	move.w	d1,d4
Lffb95a:
	clr.w	d0
	move.b	(a1)+,d0
	move.w	d0,(a0)+
	dbra.w	d4,Lffb95a
	adda.l	d3,a0
	dbra.w	d2,Lffb958
	rts

Lffb96c:
	move.w	d1,d4
Lffb96e:
	move.w	(a1)+,(a0)+
	dbra.w	d4,Lffb96e
	adda.l	d3,a0
	dbra.w	d2,Lffb96c
	rts

Call_Unknown_9a:
	movem.l	d1-d5/a1,-(a7)
	bsr.s	Lffb9ec
	move.w	($0966),d0
Lffb986:
	move.w	d1,d4
	swap.w	d2
Lffb98a:
	move.b	(a1)+,d5
	move.w	#$0007,d2
Lffb990:
	rol.b	#1,d5
	bcc.s	Lffb996
	move.w	d0,(a0)
Lffb996:
	addq.l	#2,a0
	dbra.w	d4,Lffb9aa
	adda.l	d3,a0
	swap.w	d2
	dbra.w	d2,Lffb986
Lffb9a4:
	movem.l	(a7)+,d1-d5/a1
	rts

Lffb9aa:
	dbra.w	d2,Lffb990
	bra.s	Lffb98a
Call_Unknown_9b:
	movem.l	d1-d5/a1,-(a7)
	move.w	d3,d0
	bsr.s	Lffb9ec
	swap.w	d0
	move.w	($0966),d0
Lffb9be:
	move.w	d1,d4
	swap.w	d2
Lffb9c2:
	move.b	(a1)+,d5
	move.w	#$0007,d2
Lffb9c8:
	rol.b	#1,d5
	bcc.s	Lffb9d0
	move.w	d0,(a0)
	bra.s	Lffb9d6
Lffb9d0:
	swap.w	d0
	move.w	d0,(a0)
	swap.w	d0
Lffb9d6:
	addq.l	#2,a0
	dbra.w	d4,Lffb9e6
	adda.l	d3,a0
	swap.w	d2
	dbra.w	d2,Lffb9be
	bra.s	Lffb9a4
Lffb9e6:
	dbra.w	d2,Lffb9c8
	bra.s	Lffb9c2
Lffb9ec:
	move.l	($0960),d3
	and.l	#$0000ffff,d1
	asl.l	#1,d1
	mulu.w	d3,d2
	add.l	d1,d2
	movea.l	($095c),a0
	adda.l	d2,a0
	move.w	(a1)+,d1
	sub.w	d1,d3
	sub.w	d1,d3
	subq.w	#1,d1
	move.w	(a1)+,d2
	subq.w	#1,d2
	rts

Call_Unknown_9c:
	movem.l	d1-d7/a1-a2,-(a7)
	subq.w	#1,d3
	cmp.w	#$03ff,d3
	bcc.s	Lffba96
	subq.w	#1,d4
	cmp.w	#$03ff,d4
	bcc.s	Lffba96
	move.w	d3,d6
	move.w	d4,d7
	move.l	($0960),d3
	and.l	#$0000ffff,d1
	asl.l	#1,d1
	mulu.w	d3,d2
	add.l	d1,d2
	movea.l	($095c),a2
	adda.l	d2,a2
	move.w	(a1)+,d1
	subq.w	#1,d1
	move.w	(a1)+,d2
	subq.w	#1,d2
	move.w	($0966),d0
Lffba4a:
	move.w	d1,d4
	movea.l	a2,a0
	swap.w	d2
Lffba50:
	move.b	(a1)+,d5
	move.w	#$0007,d2
Lffba56:
	rol.b	#1,d5
	bcc.s	Lffba72
	movem.l	d1/d7/a0/a2,-(a7)
Lffba5e:
	move.w	d6,d1
	movea.l	a0,a2
Lffba62:
	move.w	d0,(a2)+
	dbra.w	d1,Lffba62
	adda.l	d3,a0
	dbra.w	d7,Lffba5e
	movem.l	(a7)+,d1/d7/a0/a2
Lffba72:
	move.w	d6,-(a7)
Lffba74:
	addq.l	#2,a0
	dbra.w	d6,Lffba74
	move.w	(a7)+,d6
	dbra.w	d4,Lffba90
	move.w	d7,d2
Lffba82:
	adda.l	d3,a2
	dbra.w	d2,Lffba82
	swap.w	d2
	dbra.w	d2,Lffba4a
	bra.s	Lffba96
Lffba90:
	dbra.w	d2,Lffba56
	bra.s	Lffba50
Lffba96:
	movem.l	(a7)+,d1-d7/a1-a2
	rts

Call_APAGE:
	tst.w	($0964)
	beq.w	Lffbc1e
	cmp.b	#-$01,d1
	beq.s	Lffbad4
	cmp.b	#$04,d1
	bcc.w	Lffbc22
	move.b	($093d),d0
	cmp.b	d0,d1
	bcc.w	Lffbc26
	move.w	d1,d0
	and.w	#$0003,d0
	asl.w	#3,d0
	add.w	#$00c0,d0
	swap.w	d0
	clr.w	d0
	move.l	d0,($095c)
	clr.l	d0
	rts

Lffbad4:
	move.l	($095c),d0
	swap.w	d0
	sub.w	#$00c0,d0
	lsr.w	#3,d0
	and.l	#$00000003,d0
	rts

Call_VPAGE:
	tst.w	($0964)
	beq.w	Lffbc1e
	cmp.b	#$10,d1
	bcc.w	Lffbc22
	move.l	d2,-(a7)
	move.b	($093d),d2
	clr.l	d0
	bset.l	d2,d0
	move.l	(a7)+,d2
	cmp.b	d0,d1
	bcc.w	Lffbc26
	move.l	d1,-(a7)
	move.b	($093d),d0
	cmp.b	#$01,d0
	beq.s	Lffbb56
	cmp.b	#$02,d0
	beq.s	Lffbb3c
Lffbb1c:
	tst.b	d1
	beq.s	Lffbb24
	or.b	#$10,d1
Lffbb24:
	move.w	($00e82600),d0
	and.w	#$ffe0,d0
	or.w	d1,d0
	move.w	d0,($00e82600)
	move.l	(a7)+,d1
	clr.l	d0
	rts

Lffbb3c:
	btst.l	#$01,d1
	beq.s	Lffbb4a
	bclr.l	#$01,d1
	or.w	#$000c,d1
Lffbb4a:
	btst.l	#$00,d1
	beq.s	Lffbb1c
	or.w	#$0003,d1
	bra.s	Lffbb1c
Lffbb56:
	tst.b	d1
	beq.s	Lffbb1c
	moveq.l	#$0f,d1
	bra.s	Lffbb1c
Call_HOME:
	tst.w	($0964)
	beq.w	Lffbc1e
	cmp.b	#$10,d1
	bcc.w	Lffbc22
	move.w	#$0400,d0
	cmp.w	d0,d2
	bcc.w	Lffbc22
	cmp.w	d0,d3
	bcc.w	Lffbc22
	move.l	($0960),d0
	lsr.l	#1,d0
	cmp.w	d0,d2
	bcc.w	Lffbc26
	cmp.w	d0,d3
	bcc.w	Lffbc26
	move.l	d2,-(a7)
	move.b	($093d),d2
	clr.l	d0
	bset.l	d2,d0
	move.l	(a7)+,d2
	cmp.b	d0,d1
	bcc.w	Lffbc26
	move.l	d1,-(a7)
	move.b	($093d),d0
	cmp.b	#$01,d0
	beq.s	Lffbc16
	cmp.b	#$02,d0
	beq.s	Lffbbfc
Lffbbb4:
	tst.b	d1
	bne.s	Lffbbba
	moveq.l	#$0f,d1
Lffbbba:
	lea.l	($00e80018),a0
	btst.l	#$00,d1
	beq.s	Lffbbcc
	move.w	d2,(a0)
	move.w	d3,($0002,a0)
Lffbbcc:
	addq.l	#4,a0
	btst.l	#$01,d1
	beq.s	Lffbbda
	move.w	d2,(a0)
	move.w	d3,($0002,a0)
Lffbbda:
	addq.l	#4,a0
	btst.l	#$02,d1
	beq.s	Lffbbe8
	move.w	d2,(a0)
	move.w	d3,($0002,a0)
Lffbbe8:
	addq.l	#4,a0
	btst.l	#$03,d1
	beq.s	Lffbbf6
	move.w	d2,(a0)
	move.w	d3,($0002,a0)
Lffbbf6:
	move.l	(a7)+,d1
	clr.l	d0
	rts

Lffbbfc:
	btst.l	#$01,d1
	beq.s	Lffbc0a
	bclr.l	#$01,d1
	or.w	#$000c,d1
Lffbc0a:
	btst.l	#$00,d1
	beq.s	Lffbbb4
	or.w	#$0003,d1
	bra.s	Lffbbb4
Lffbc16:
	tst.b	d1
	beq.s	Lffbbb4
	moveq.l	#$0f,d1
	bra.s	Lffbbb4
Lffbc1e:
	moveq.l	#$ff,d0
	rts

Lffbc22:
	moveq.l	#$fe,d0
	rts

Lffbc26:
	moveq.l	#$fd,d0
	rts

Call_WINDOW:
	tst.w	($0964)
	beq.s	Lffbc1e
	move.w	#$0400,d0
	cmp.w	d0,d1
	bcc.s	Lffbc22
	cmp.w	d0,d2
	bcc.s	Lffbc22
	cmp.w	d0,d3
	bcc.s	Lffbc22
	cmp.w	d0,d4
	bcc.s	Lffbc22
	move.l	($0960),d0
	lsr.l	#1,d0
	cmp.w	d0,d1
	bcc.s	Lffbc26
	cmp.w	d0,d2
	bcc.s	Lffbc26
	cmp.w	d0,d3
	bcc.s	Lffbc26
	cmp.w	d0,d4
	bcc.s	Lffbc26
	lea.l	($0968),a0
	move.w	d1,(a0)+
	move.w	d2,(a0)+
	move.w	d3,(a0)+
	move.w	d4,(a0)+
	clr.l	d0
	rts

Call_SFTJIS:
	clr.l	d0
	move.b	d1,d0
	lsr.w	#8,d1
	subi.b	#$81,d1
	cmpi.b	#$6f,d1
	bcc.s	Lffbcbe
	cmpi.b	#$1f,d1
	bcs.s	Lffbc8a
	cmpi.b	#$3f,d1
	bcs.s	Lffbcbe
	subi.b	#$40,d1
Lffbc8a:
	add.b	d1,d1
	add.b	#$21,d1
	subi.b	#$40,d0
	cmpi.b	#$bd,d0
	bcc.s	Lffbcbe
	cmpi.b	#$3f,d0
	beq.s	Lffbcbe
	bcc.s	Lffbca4
	addq.b	#1,d0
Lffbca4:
	cmpi.b	#$5f,d0
	bcc.s	Lffbcb0
	addi.b	#$20,d0
	bra.s	Lffbcb6
Lffbcb0:
	addq.b	#1,d1
	subi.b	#$3e,d0
Lffbcb6:
	asl.w	#8,d1
	or.w	d1,d0
	move.l	d0,d1
	rts

Lffbcbe:
	move.l	#$ffff2228.l,d0
	move.l	d0,d1
	rts

Call_JISSFT:
	clr.l	d0
	move.w	d1,d0
	lsr.w	#8,d0
	cmp.b	#$21,d1
	bcs.s	Lffbd1e
	cmp.b	#$7f,d1
	bcc.s	Lffbd1e
	cmp.b	#$21,d0
	bcs.s	Lffbd1e
	cmp.b	#$7f,d0
	bcc.s	Lffbd1e
	cmp.b	#$29,d0
	bcs.s	Lffbcf2
	cmp.b	#$30,d0
	bcs.s	Lffbd1e
Lffbcf2:
	add.b	#$1f,d1
	addq.b	#1,d0
	lsr.b	#1,d0
	bcc.s	Lffbd00
	add.b	#$5e,d1
Lffbd00:
	cmp.b	#$7f,d1
	bcs.s	Lffbd08
	addq.b	#1,d1
Lffbd08:
	add.b	#$70,d0
	cmp.b	#$a0,d0
	bcs.s	Lffbd16
	add.b	#$40,d0
Lffbd16:
	asl.w	#8,d0
	move.b	d1,d0
	move.l	d0,d1
	rts

Lffbd1e:
	move.l	#$ffff81a6.l,d0
	move.l	d0,d1
	rts

Call_AKCONV:
	move.l	d1,-(a7)
	clr.l	d0
	cmp.b	#$20,d1
	bcs.s	Lffbd7a
	cmp.b	#$30,d1
	bcs.s	Lffbd7e
	cmp.b	#$3a,d1
	bcs.s	Lffbdac
	cmp.b	#$41,d1
	bcs.s	Lffbd84
	cmp.b	#$5b,d1
	bcs.s	Lffbdac
	cmp.b	#$61,d1
	bcs.s	Lffbd8a
	cmp.b	#$7b,d1
	bcs.s	Lffbdac
	cmp.b	#$7f,d1
	bcs.s	Lffbd90
	cmp.b	#$a0,d1
	bcs.s	Lffbd70
	beq.s	Lffbd7a
	cmp.b	#$a6,d1
	bcs.s	Lffbd96
	cmp.b	#$e0,d1
	bcs.s	Lffbdc0
Lffbd70:
	move.l	#$ffff81a6.l,d0
	bra.w	Lffbe02
Lffbd7a:
	move.w	#$0020,d1
Lffbd7e:
	sub.b	#$20,d1
	bra.s	Lffbd9a
Lffbd84:
	sub.b	#$2a,d1
	bra.s	Lffbd9a
Lffbd8a:
	sub.b	#$44,d1
	bra.s	Lffbd9a
Lffbd90:
	sub.b	#$5e,d1
	bra.s	Lffbd9a
Lffbd96:
	sub.b	#$80,d1
Lffbd9a:
	and.w	#$00ff,d1
	lea.l	(Lffc8b8,pc),a0
	move.b	(a0,d1.w),d0
Lffbda6:
	or.w	#$8100,d0
	bra.s	Lffbe02
Lffbdac:
	move.w	#$8200,d0
	add.b	#$1f,d1
	cmp.b	#$7f,d1
	bcs.s	Lffbdbc
	addq.b	#1,d1
Lffbdbc:
	move.b	d1,d0
	bra.s	Lffbe02
Lffbdc0:
	moveq.l	#$5b,d0
	cmp.b	#$b0,d1
	beq.s	Lffbda6
	moveq.l	#$4a,d0
	cmp.b	#$de,d1
	beq.s	Lffbda6
	addq.b	#1,d0
	cmp.b	#$df,d1
	beq.s	Lffbda6
	lea.l	(Lffc8de,pc),a0
	sub.b	#$a6,d1
	and.w	#$00ff,d1
	move.w	#$8200,d0
	move.b	(a0,d1.w),d0
	swap.w	d1
	tst.w	d1
	beq.s	Lffbe02
	sub.b	#$5f,d0
	cmp.b	#$7f,d0
	bcs.s	Lffbdfe
	addq.b	#1,d0
Lffbdfe:
	add.w	#$0100,d0
Lffbe02:
	move.l	(a7)+,d1
	rts

Call_RMACNV:
	movem.l	d1-d7/a1-a4,-(a7)
	movea.l	a1,a3
	movea.l	a2,a4
	cmp.b	#$27,d1
	beq.s	Lffbe52
	cmp.b	#$2c,d1
	beq.s	Lffbe7a
	cmp.b	#$2e,d1
	beq.s	Lffbe7a
	cmp.b	#$2f,d1
	beq.s	Lffbe7a
	cmp.b	#$2d,d1
	beq.s	Lffbe7a
	cmp.b	#$5b,d1
	beq.s	Lffbe7a
	cmp.b	#$5d,d1
	beq.s	Lffbe7a
	cmp.b	#$40,d1
	bcs.s	Lffbe56
	cmp.b	#$5a,d1
	bls.s	Lffbe7a
	cmp.b	#$60,d1
	bcs.s	Lffbe56
	cmp.b	#$7a,d1
	bls.s	Lffbe7a
	bra.s	Lffbe56
Lffbe52:
	tst.b	(a1)
	bne.s	Lffbe7a
Lffbe56:
	moveq.l	#$01,d0
	move.b	(a1),d2
	and.b	#$df,d2
	cmp.b	#$4e,d2
	bne.s	Lffbe70
	tst.b	($0001,a1)
	bne.s	Lffbe70
	move.b	#$dd,(a2)+
	addq.l	#1,d0
Lffbe70:
	clr.b	(a1)
	move.b	d1,(a2)+
	clr.b	(a2)
	bra.w	Lffc688
Lffbe7a:
	tst.b	(a1)+
	bne.s	Lffbe7a
	move.b	d1,(-$0001,a1)
	clr.b	(a1)
	movea.l	a3,a1
	move.b	(a1)+,d2
	move.b	d2,d3
	cmp.b	#$61,d2
	bcs.s	Lffbe9a
	cmp.b	#$7a,d2
	bhi.s	Lffbe9a
	and.b	#$df,d2
Lffbe9a:
	move.b	#$b1,d1
	cmp.b	#$61,d3
	beq.w	Lffbf50
	cmp.b	#$41,d3
	beq.w	Lffbf54
	addq.b	#1,d1
	cmp.b	#$69,d3
	beq.w	Lffbf50
	cmp.b	#$49,d3
	beq.w	Lffbf54
	addq.b	#1,d1
	cmp.b	#$75,d3
	beq.w	Lffbf50
	cmp.b	#$55,d3
	beq.w	Lffbf54
	addq.b	#1,d1
	cmp.b	#$65,d3
	beq.s	Lffbf50
	cmp.b	#$45,d3
	beq.s	Lffbf54
	addq.b	#1,d1
	cmp.b	#$6f,d3
	beq.s	Lffbf50
	cmp.b	#$4f,d3
	beq.s	Lffbf54
	move.b	#$dd,d1
	cmp.b	#$58,d2
	beq.s	Lffbf54
	cmp.b	#$6e,d3
	beq.s	Lffbf54
	move.b	#$af,d1
	cmp.b	#$7a,d3
	beq.s	Lffbf54
	move.b	#$a1,d1
	cmp.b	#$2e,d2
	beq.s	Lffbf54
	addq.b	#1,d1
	cmp.b	#$5b,d2
	beq.s	Lffbf54
	addq.b	#1,d1
	cmp.b	#$5d,d2
	beq.s	Lffbf54
	addq.b	#1,d1
	cmp.b	#$2c,d2
	beq.s	Lffbf54
	addq.b	#1,d1
	cmp.b	#$2f,d2
	beq.s	Lffbf54
	move.b	#$b0,d1
	cmp.b	#$2d,d2
	beq.s	Lffbf54
	move.b	#$de,d1
	cmp.b	#$40,d2
	beq.s	Lffbf54
	addq.b	#1,d1
	cmp.b	#$60,d2
	beq.s	Lffbf54
	bra.s	Lffbf5c
Lffbf50:
	sub.b	#$0a,d1
Lffbf54:
	move.b	d1,(a2)+
	moveq.l	#$01,d0
	bra.w	Lffc67e
Lffbf5c:
	move.b	#$dc,d1
	cmp.b	#$57,d2
	beq.w	Lffbff0
	move.b	#$b1,d1
	cmp.b	#$56,d2
	beq.s	Lffbff0
	addq.b	#5,d1
	cmp.b	#$4b,d2
	beq.s	Lffbff0
	cmp.b	#$47,d2
	beq.s	Lffbff0
	cmp.b	#$43,d2
	beq.s	Lffbff0
	cmp.b	#$51,d2
	beq.s	Lffbff0
	addq.b	#5,d1
	cmp.b	#$53,d2
	beq.s	Lffbff0
	cmp.b	#$4a,d2
	beq.s	Lffbff0
	cmp.b	#$5a,d2
	beq.s	Lffbff0
	addq.b	#5,d1
	cmp.b	#$54,d2
	beq.s	Lffbff0
	cmp.b	#$44,d2
	beq.s	Lffbff0
	addq.b	#5,d1
	cmp.b	#$4e,d2
	beq.s	Lffbff0
	addq.b	#5,d1
	cmp.b	#$48,d2
	beq.s	Lffbff0
	cmp.b	#$42,d2
	beq.s	Lffbff0
	cmp.b	#$50,d2
	beq.s	Lffbff0
	cmp.b	#$46,d2
	beq.s	Lffbff0
	addq.b	#5,d1
	cmp.b	#$4d,d2
	beq.s	Lffbff0
	addq.b	#5,d1
	cmp.b	#$59,d2
	beq.s	Lffbff0
	addq.b	#3,d1
	cmp.b	#$52,d2
	beq.s	Lffbff0
	cmp.b	#$4c,d2
	bne.w	Lffc676
Lffbff0:
	move.b	(a1),d4
	beq.w	Lffc686
	move.b	d4,d3
	cmp.b	#$41,d4
	bcs.s	Lffc010
	cmp.b	#$5a,d4
	bls.s	Lffc07c
	cmp.b	#$61,d4
	bcs.s	Lffc010
	cmp.b	#$7a,d4
	bls.s	Lffc078
Lffc010:
	cmp.b	#$4e,d2
	bne.w	Lffc676
	move.b	#$dd,(a2)+
	addq.l	#1,a1
	moveq.l	#$01,d0
	cmp.b	#$27,d4
	beq.w	Lffc67e
	addq.l	#1,d0
	move.b	#$a1,d1
	cmp.b	#$2e,d4
	beq.s	Lffc072
	addq.b	#1,d1
	cmp.b	#$5b,d4
	beq.s	Lffc072
	addq.b	#1,d1
	cmp.b	#$5d,d4
	beq.s	Lffc072
	addq.b	#1,d1
	cmp.b	#$2c,d4
	beq.s	Lffc072
	addq.b	#1,d1
	cmp.b	#$2f,d4
	beq.s	Lffc072
	move.b	#$b0,d1
	cmp.b	#$2d,d4
	beq.s	Lffc072
	move.b	#$de,d1
	cmp.b	#$40,d4
	beq.s	Lffc072
	addq.b	#1,d1
	cmp.b	#$60,d4
	bne.w	Lffc676
Lffc072:
	move.b	d1,(a2)+
	bra.w	Lffc67e
Lffc078:
	and.b	#$df,d4
Lffc07c:
	cmp.b	d2,d4
	bne.s	Lffc098
	move.b	#$af,d1
	cmp.b	#$4e,d4
	bne.s	Lffc090
	move.b	#$dd,d1
	addq.l	#1,a1
Lffc090:
	move.b	d1,(a2)+
	moveq.l	#$01,d0
	bra.w	Lffc67e
Lffc098:
	cmp.b	#$41,d4
	bne.w	Lffc138
	addq.l	#1,a1
	cmp.b	#$46,d2
	beq.s	Lffc0c6
	cmp.b	#$51,d2
	beq.s	Lffc0c6
	cmp.b	#$56,d2
	bne.s	Lffc0d4
	addq.b	#2,d1
	move.b	d1,(a2)+
	move.b	#$de,(a2)+
	move.b	#$a7,(a2)+
	moveq.l	#$03,d0
	bra.w	Lffc67e
Lffc0c6:
	addq.b	#2,d1
	move.b	d1,(a2)+
	move.b	#$a7,(a2)+
	moveq.l	#$02,d0
	bra.w	Lffc67e
Lffc0d4:
	cmp.b	#$50,d2
	bne.s	Lffc0e6
	move.b	d1,(a2)+
	move.b	#$df,(a2)+
	moveq.l	#$02,d0
	bra.w	Lffc67e
Lffc0e6:
	cmp.b	#$47,d2
	beq.s	Lffc0fe
	cmp.b	#$5a,d2
	beq.s	Lffc0fe
	cmp.b	#$44,d2
	beq.s	Lffc0fe
	cmp.b	#$42,d2
	bne.s	Lffc10a
Lffc0fe:
	move.b	d1,(a2)+
	move.b	#$de,(a2)+
	moveq.l	#$02,d0
	bra.w	Lffc67e
Lffc10a:
	cmp.b	#$4a,d2
	bne.s	Lffc122
	addq.b	#1,d1
	move.b	d1,(a2)+
	move.b	#$de,(a2)+
	move.b	#$ac,(a2)+
	moveq.l	#$03,d0
	bra.w	Lffc67e
Lffc122:
	cmp.b	#$59,d2
	bne.w	Lffbf54
	cmp.b	d3,d4
	beq.w	Lffbf54
	sub.b	#$28,d1
	bra.w	Lffbf54
Lffc138:
	cmp.b	#$55,d4
	bne.w	Lffc1d0
	addq.l	#1,a1
	cmp.b	#$50,d2
	bne.s	Lffc156
	addq.b	#2,d1
	move.b	d1,(a2)+
	move.b	#$df,(a2)+
	moveq.l	#$02,d0
	bra.w	Lffc67e
Lffc156:
	cmp.b	#$56,d2
	beq.s	Lffc174
	cmp.b	#$47,d2
	beq.s	Lffc174
	cmp.b	#$5a,d2
	beq.s	Lffc174
	cmp.b	#$44,d2
	beq.s	Lffc174
	cmp.b	#$42,d2
	bne.s	Lffc182
Lffc174:
	addq.b	#2,d1
	move.b	d1,(a2)+
	move.b	#$de,(a2)+
	moveq.l	#$02,d0
	bra.w	Lffc67e
Lffc182:
	cmp.b	#$4a,d2
	bne.s	Lffc19a
	addq.b	#1,d1
	move.b	d1,(a2)+
	move.b	#$de,(a2)+
	move.b	#$ad,(a2)+
	moveq.l	#$03,d0
	bra.w	Lffc67e
Lffc19a:
	cmp.b	#$57,d2
	beq.s	Lffc1c6
	cmp.b	#$54,d2
	bne.s	Lffc1b2
	cmp.b	d3,d4
	beq.s	Lffc1ca
	move.b	#$af,d1
	bra.w	Lffbf54
Lffc1b2:
	cmp.b	#$59,d2
	bne.s	Lffc1ca
	cmp.b	d3,d4
	beq.w	Lffc324
	move.b	#$ad,d1
	bra.w	Lffbf54
Lffc1c6:
	sub.b	#$2b,d1
Lffc1ca:
	addq.b	#2,d1
	bra.w	Lffbf54
Lffc1d0:
	cmp.b	#$4f,d4
	bne.w	Lffc282
	addq.l	#1,a1
	cmp.b	#$46,d2
	beq.s	Lffc1fe
	cmp.b	#$51,d2
	beq.s	Lffc1fe
	cmp.b	#$56,d2
	bne.s	Lffc20c
	addq.b	#2,d1
	move.b	d1,(a2)+
	move.b	#$de,(a2)+
	move.b	#$ab,(a2)+
	moveq.l	#$03,d0
	bra.w	Lffc67e
Lffc1fe:
	addq.b	#2,d1
	move.b	d1,(a2)+
	move.b	#$ab,(a2)+
	moveq.l	#$02,d0
	bra.w	Lffc67e
Lffc20c:
	cmp.b	#$50,d2
	bne.s	Lffc220
	addq.b	#4,d1
	move.b	d1,(a2)+
	move.b	#$df,(a2)+
	moveq.l	#$02,d0
	bra.w	Lffc67e
Lffc220:
	cmp.b	#$47,d2
	beq.s	Lffc238
	cmp.b	#$5a,d2
	beq.s	Lffc238
	cmp.b	#$44,d2
	beq.s	Lffc238
	cmp.b	#$42,d2
	bne.s	Lffc246
Lffc238:
	addq.b	#4,d1
	move.b	d1,(a2)+
	move.b	#$de,(a2)+
	moveq.l	#$02,d0
	bra.w	Lffc67e
Lffc246:
	cmp.b	#$4a,d2
	bne.s	Lffc25e
	addq.b	#1,d1
	move.b	d1,(a2)+
	move.b	#$de,(a2)+
	move.b	#$ae,(a2)+
	moveq.l	#$03,d0
	bra.w	Lffc67e
Lffc25e:
	cmp.b	#$57,d2
	beq.s	Lffc278
	cmp.b	#$59,d2
	bne.s	Lffc27c
	cmp.b	d3,d4
	beq.w	Lffc1ca
	move.b	#$ae,d1
	bra.w	Lffbf54
Lffc278:
	sub.b	#$3a,d1
Lffc27c:
	addq.b	#4,d1
	bra.w	Lffbf54
Lffc282:
	cmp.b	#$49,d4
	bne.w	Lffc32a
	addq.l	#1,a1
	cmp.b	#$57,d2
	beq.s	Lffc2b6
	cmp.b	#$46,d2
	beq.s	Lffc2ba
	cmp.b	#$51,d2
	beq.s	Lffc2ba
	cmp.b	#$56,d2
	bne.s	Lffc2c8
	addq.b	#2,d1
	move.b	d1,(a2)+
	move.b	#$de,(a2)+
	move.b	#$a8,(a2)+
	moveq.l	#$03,d0
	bra.w	Lffc67e
Lffc2b6:
	sub.b	#$2b,d1
Lffc2ba:
	addq.b	#2,d1
	move.b	d1,(a2)+
	move.b	#$a8,(a2)+
	moveq.l	#$02,d0
	bra.w	Lffc67e
Lffc2c8:
	cmp.b	#$50,d2
	bne.s	Lffc2dc
	addq.b	#1,d1
	move.b	d1,(a2)+
	move.b	#$df,(a2)+
	moveq.l	#$02,d0
	bra.w	Lffc67e
Lffc2dc:
	cmp.b	#$47,d2
	beq.s	Lffc2fa
	cmp.b	#$5a,d2
	beq.s	Lffc2fa
	cmp.b	#$44,d2
	beq.s	Lffc2fa
	cmp.b	#$42,d2
	beq.s	Lffc2fa
	cmp.b	#$4a,d2
	bne.s	Lffc308
Lffc2fa:
	addq.b	#1,d1
	move.b	d1,(a2)+
	move.b	#$de,(a2)+
	moveq.l	#$02,d0
	bra.w	Lffc67e
Lffc308:
	cmp.b	#$59,d2
	bne.s	Lffc31c
	move.b	#$b2,d1
	cmp.b	d3,d4
	beq.w	Lffbf54
	bra.w	Lffbf50
Lffc31c:
	cmp.b	#$43,d2
	bne.s	Lffc324
	addq.b	#5,d1
Lffc324:
	addq.b	#1,d1
	bra.w	Lffbf54
Lffc32a:
	cmp.b	#$45,d4
	bne.w	Lffc3e4
	addq.l	#1,a1
	cmp.b	#$57,d2
	beq.s	Lffc35e
	cmp.b	#$46,d2
	beq.s	Lffc364
	cmp.b	#$51,d2
	beq.s	Lffc364
	cmp.b	#$56,d2
	bne.s	Lffc372
	addq.b	#2,d1
	move.b	d1,(a2)+
	move.b	#$de,(a2)+
	move.b	#$aa,(a2)+
	moveq.l	#$03,d0
	bra.w	Lffc67e
Lffc35e:
	sub.b	#$31,d1
Lffc362:
	addq.b	#6,d1
Lffc364:
	addq.b	#2,d1
	move.b	d1,(a2)+
	move.b	#$aa,(a2)+
	moveq.l	#$02,d0
	bra.w	Lffc67e
Lffc372:
	cmp.b	#$50,d2
	bne.s	Lffc386
	addq.b	#3,d1
	move.b	d1,(a2)+
	move.b	#$df,(a2)+
	moveq.l	#$02,d0
	bra.w	Lffc67e
Lffc386:
	cmp.b	#$47,d2
	beq.s	Lffc39e
	cmp.b	#$5a,d2
	beq.s	Lffc39e
	cmp.b	#$44,d2
	beq.s	Lffc39e
	cmp.b	#$42,d2
	bne.s	Lffc3ac
Lffc39e:
	addq.b	#3,d1
	move.b	d1,(a2)+
	move.b	#$de,(a2)+
	moveq.l	#$02,d0
	bra.w	Lffc67e
Lffc3ac:
	cmp.b	#$4a,d2
	bne.s	Lffc3c4
	addq.b	#1,d1
	move.b	d1,(a2)+
	move.b	#$de,(a2)+
	move.b	#$aa,(a2)+
	moveq.l	#$03,d0
	bra.w	Lffc67e
Lffc3c4:
	cmp.b	#$59,d2
	bne.s	Lffc3d6
	move.b	#$aa,d1
	cmp.b	d3,d4
	bne.w	Lffbf54
	bra.s	Lffc362
Lffc3d6:
	cmp.b	#$43,d2
	bne.s	Lffc3de
	addq.b	#5,d1
Lffc3de:
	addq.b	#3,d1
	bra.w	Lffbf54
Lffc3e4:
	cmp.b	#$48,d4
	bne.w	Lffc492
	cmp.b	#$4e,d2
	beq.w	Lffc488
	cmp.b	#$53,d2
	beq.s	Lffc412
	cmp.b	#$44,d2
	beq.s	Lffc410
	cmp.b	#$54,d2
	beq.s	Lffc410
	cmp.b	#$43,d2
	bne.w	Lffc676
	addq.b	#8,d1
Lffc410:
	addq.b	#2,d1
Lffc412:
	addq.b	#1,d1
	move.b	($0001,a1),d5
	beq.w	Lffc686
	cmp.b	#$61,d5
	bcs.s	Lffc42c
	cmp.b	#$7a,d5
	bhi.s	Lffc42c
	and.b	#$df,d5
Lffc42c:
	move.b	#$a8,d6
	cmp.b	#$49,d5
	beq.s	Lffc472
	addq.b	#2,d6
	cmp.b	#$45,d5
	beq.s	Lffc458
	addq.b	#2,d6
	cmp.b	#$41,d5
	beq.s	Lffc458
	addq.b	#1,d6
	cmp.b	#$55,d5
	beq.s	Lffc458
	addq.b	#1,d6
	cmp.b	#$4f,d5
	bne.w	Lffc676
Lffc458:
	addq.l	#2,a1
	move.b	d1,(a2)+
	moveq.l	#$01,d0
	cmp.b	#$44,d2
	bne.s	Lffc46a
Lffc464:
	addq.l	#1,d0
	move.b	#$de,(a2)+
Lffc46a:
	addq.l	#1,d0
	move.b	d6,(a2)+
	bra.w	Lffc67e
Lffc472:
	addq.l	#2,a1
	move.b	d1,(a2)+
	moveq.l	#$01,d0
	cmp.b	#$44,d2
	beq.s	Lffc464
	cmp.b	#$54,d2
	beq.s	Lffc46a
	bra.w	Lffc67e
Lffc488:
	move.b	#$dd,(a2)+
	moveq.l	#$01,d0
	bra.w	Lffc67e
Lffc492:
	cmp.b	#$59,d4
	bne.w	Lffc564
	move.b	#$df,d6
	cmp.b	#$50,d2
	beq.s	Lffc50a
	subq.b	#1,d6
	cmp.b	#$47,d2
	beq.s	Lffc50a
	cmp.b	#$5a,d2
	beq.s	Lffc50a
	cmp.b	#$4a,d2
	beq.s	Lffc50a
	cmp.b	#$44,d2
	beq.s	Lffc50a
	cmp.b	#$42,d2
	beq.s	Lffc50a
	clr.b	d6
	cmp.b	#$4b,d2
	beq.s	Lffc50a
	cmp.b	#$53,d2
	beq.s	Lffc50a
	cmp.b	#$54,d2
	beq.s	Lffc50a
	cmp.b	#$4e,d2
	beq.s	Lffc50a
	cmp.b	#$48,d2
	beq.s	Lffc50a
	cmp.b	#$4d,d2
	beq.s	Lffc50a
	cmp.b	#$52,d2
	beq.s	Lffc50a
	cmp.b	#$4c,d2
	beq.s	Lffc50a
	cmp.b	#$46,d2
	beq.s	Lffc508
	cmp.b	#$43,d2
	bne.w	Lffc676
	add.b	#$09,d1
Lffc508:
	addq.b	#1,d1
Lffc50a:
	addq.b	#1,d1
	move.b	($0001,a1),d5
	beq.w	Lffc686
	cmp.b	#$61,d5
	bcs.s	Lffc524
	cmp.b	#$7a,d5
	bhi.s	Lffc524
	and.b	#$df,d5
Lffc524:
	move.b	#$a8,d7
	cmp.b	#$49,d5
	beq.s	Lffc550
	addq.b	#2,d7
	cmp.b	#$45,d5
	beq.s	Lffc550
	addq.b	#2,d7
	cmp.b	#$41,d5
	beq.s	Lffc550
	addq.b	#1,d7
	cmp.b	#$55,d5
	beq.s	Lffc550
	addq.b	#1,d7
	cmp.b	#$4f,d5
	bne.w	Lffc676
Lffc550:
	move.b	d1,(a2)+
	moveq.l	#$02,d0
	tst.b	d6
	beq.s	Lffc55c
	move.b	d6,(a2)+
	addq.l	#1,d0
Lffc55c:
	move.b	d7,(a2)+
	addq.l	#2,a1
	bra.w	Lffc67e
Lffc564:
	cmp.b	#$57,d4
	bne.w	Lffc604
	move.b	#$df,d6
	cmp.b	#$50,d2
	beq.s	Lffc5ac
	subq.b	#1,d6
	cmp.b	#$47,d2
	beq.s	Lffc5ac
	cmp.b	#$5a,d2
	beq.s	Lffc5ac
	cmp.b	#$44,d2
	beq.s	Lffc5ac
	cmp.b	#$42,d2
	beq.s	Lffc5ac
	clr.b	d6
	cmp.b	#$4b,d2
	beq.s	Lffc5ac
	cmp.b	#$53,d2
	beq.s	Lffc5ac
	cmp.b	#$54,d2
	beq.s	Lffc5ac
	cmp.b	#$48,d2
	bne.w	Lffc676
Lffc5ac:
	addq.b	#2,d1
	move.b	($0001,a1),d5
	beq.w	Lffc686
	cmp.b	#$61,d5
	bcs.s	Lffc5c6
	cmp.b	#$7a,d5
	bhi.s	Lffc5c6
	and.b	#$df,d5
Lffc5c6:
	move.b	#$a7,d7
	cmp.b	#$41,d5
	beq.s	Lffc5f2
	addq.b	#1,d7
	cmp.b	#$49,d5
	beq.s	Lffc5f2
	addq.b	#1,d7
	cmp.b	#$55,d5
	beq.s	Lffc5f2
	addq.b	#1,d7
	cmp.b	#$45,d5
	beq.s	Lffc5f2
	addq.b	#1,d7
	cmp.b	#$4f,d5
	bne.w	Lffc676
Lffc5f2:
	move.b	d1,(a2)+
	moveq.l	#$02,d0
	tst.b	d6
	beq.s	Lffc5fe
	move.b	d6,(a2)+
	addq.l	#1,d0
Lffc5fe:
	move.b	d7,(a2)+
	addq.l	#2,a1
	bra.s	Lffc67e
Lffc604:
	cmp.b	#$53,d4
	bne.s	Lffc66e
	cmp.b	#$54,d2
	bne.s	Lffc66e
	move.b	($0001,a1),d3
	beq.s	Lffc686
	move.b	d3,d5
	cmp.b	#$61,d5
	bcs.s	Lffc628
	cmp.b	#$7a,d5
	bhi.s	Lffc628
	and.b	#$df,d5
Lffc628:
	cmp.b	#$55,d5
	beq.s	Lffc65c
	move.b	#$a7,d6
	cmp.b	#$41,d5
	beq.s	Lffc650
	addq.b	#1,d6
	cmp.b	#$49,d5
	beq.s	Lffc650
	addq.b	#2,d6
	cmp.b	#$45,d5
	beq.s	Lffc650
	addq.b	#1,d6
	cmp.b	#$4f,d5
	bne.s	Lffc676
Lffc650:
	addq.b	#2,d1
	move.b	d1,(a2)+
	move.b	d6,(a2)+
	addq.l	#2,a1
	moveq.l	#$02,d0
	bra.s	Lffc67e
Lffc65c:
	addq.b	#2,d1
	cmp.b	d3,d5
	beq.s	Lffc666
	sub.b	#$13,d1
Lffc666:
	move.b	d1,(a2)+
	addq.l	#2,a1
	moveq.l	#$01,d0
	bra.s	Lffc67e
Lffc66e:
	cmp.b	#$4e,d2
	beq.w	Lffc488
Lffc676:
	clr.b	(a3)
	clr.b	(a4)
	moveq.l	#$ff,d0
	bra.s	Lffc688
Lffc67e:
	clr.b	(a2)
Lffc680:
	move.b	(a1)+,(a3)+
	bne.s	Lffc680
	bra.s	Lffc688
Lffc686:
	clr.l	d0
Lffc688:
	movem.l	(a7)+,d1-d7/a1-a4
	rts

Call_HANJOB:
	move.b	(-$0002,a1),d0
	rol.w	#8,d0
	move.b	(-$0001,a1),d0
	cmp.w	#$829f,d0
	bcs.s	Lffc6c2
	cmp.w	#$82fd,d0
	bcs.s	Lffc6b6
	cmp.w	#$839f,d0
	bcc.s	Lffc6c2
	cmp.b	#$7f,d0
	bcs.s	Lffc6b2
	subq.b	#1,d0
Lffc6b2:
	add.b	#$5f,d0
Lffc6b6:
	bsr.s	Lffc726
	bne.s	Lffc6c2
	addq.b	#2,(-$0001,a1)
	clr.l	d0
	rts

Lffc6c2:
	move.b	#$81,(a1)+
	move.b	#$4b,(a1)+
	clr.b	(a1)
	moveq.l	#$02,d0
	rts

Call_DAKJOB:
	move.b	(-$0002,a1),d0
	rol.w	#8,d0
	move.b	(-$0001,a1),d0
	cmp.w	#$829f,d0
	bcs.s	Lffc70e
	cmp.w	#$82fd,d0
	bcs.s	Lffc6fe
	cmp.w	#$839f,d0
	bcc.s	Lffc70e
	cmp.b	#$7f,d0
	bcs.s	Lffc6f4
	subq.b	#1,d0
Lffc6f4:
	add.b	#$5f,d0
	cmp.b	#$a4,d0
	beq.s	Lffc71c
Lffc6fe:
	bsr.s	Lffc740
	beq.s	Lffc706
	bsr.s	Lffc726
	bne.s	Lffc70e
Lffc706:
	addq.b	#1,(-$0001,a1)
	clr.l	d0
	rts

Lffc70e:
	move.b	#$81,(a1)+
	move.b	#$4a,(a1)+
	clr.b	(a1)
	moveq.l	#$02,d0
	rts

Lffc71c:
	move.b	#$94,(-$0001,a1)
	clr.l	d0
	rts

Lffc726:
	movem.l	d1,-(a7)
	lea.l	(Lffc902,pc),a0
	moveq.l	#$04,d1
Lffc730:
	cmp.b	(a0)+,d0
	beq.s	Lffc73a
	dbra.w	d1,Lffc730
	tst.w	d1
Lffc73a:
	movem.l	(a7)+,d1
	rts

Lffc740:
	movem.l	d1,-(a7)
	lea.l	(Lffc8ee,pc),a0
	moveq.l	#$0e,d1
Lffc74a:
	cmp.b	(a0)+,d0
	beq.s	Lffc754
	dbra.w	d1,Lffc74a
	tst.w	d1
Lffc754:
	movem.l	(a7)+,d1
	rts

Call_SYS_STAT:
	movem.l	d1-d2,-(a7)
	moveq.l	#$ff,d0
	cmp.w	#$0004,d1
	bhi.s	Lffc77c
	add.w	d1,d1
	beq.s	Lffc772
	cmpi.b	#$01,($0cbc)
	bls.s	Lffc77c
Lffc772:
	moveq.l	#$00,d0
	move.w	(Lffc782,pc,d1.w),d1
	jsr	(Lffc782,pc,d1.w)
Lffc77c:
	movem.l	(a7)+,d1-d2
	rts

Lffc782:
	.dc.b	$00,$58,$00,$0a,$00,$1c,$00,$26
	.dc.b	$00,$3c
Lffc78c:
	movec.l	cacr,d1
	ror.l	#1,d1
	lsr.w	#7,d1
	rol.l	#1,d1
	and.w	#$0003,d1
	move.w	d1,d0
	rts

Lffc79e:
	move.b	($00ed0090),d2
	bsr.s	Lffc7be
	rts

Lffc7a8:
	movec.l	cacr,d0
	or.w	#$0808,d0
	movec.l	d0,cacr
	and.w	#$f7f7,d0
	movec.l	d0,cacr
	rts

Lffc7be:
	bsr.s	Lffc78c
	and.w	#$0003,d2
	moveq.l	#$00,d1
	add.w	d2,d2
	move.w	(Lffc7d2,pc,d2.w),d1
	movec.l	d1,cacr
	rts

Lffc7d2:
	.dc.w	$0000,$0001,$2100,$2101
Lffc7da:
	move.w	($0cb8),d0
	add.l	d0,d0
	move.l	d0,d1
	add.l	d0,d0
	add.l	d1,d0
	cmpi.w	#$0001,($0cbc)
	bhi.s	Lffc7f0
	add.l	d0,d0
Lffc7f0:
	add.l	#$00000032,d0
	divu.w	#$0064,d0
	swap.w	d0
	clr.w	d0
	tst.b	($0cbd)
	beq.s	Lffc808
	bset.l	#$0f,d0
Lffc808:
	tst.b	($0cbe)
	beq.s	Lffc812
	bset.l	#$0e,d0
Lffc812:
	move.b	($0cbc),d0
	rts

Call_B_CONMOD:
	jsr	(Call_B_CUROFF)
	lea.l	($0d0c),a0
	cmp.w	#$0001,d1
	bmi.s	Lffc85e
	beq.s	Lffc862
	cmp.w	#$0002,d1
	beq.s	Lffc868
	cmp.w	#$0010,d1
	beq.s	Lffc850
	cmp.w	#$0012,d1
	ble.s	Lffc844
Lffc83c:
	jsr	(Call_B_CURON)
	rts

Lffc844:
	seq.b	d1
	ext.w	d1
	lea.l	($0d08),a0
	move.w	d1,(a0)
	bra.s	Lffc83c
Lffc850:
	move.w	d2,d0
	and.w	#$0003,d0
	lea.l	($0d0a),a0
	move.w	d0,(a0)
	bra.s	Lffc83c
Lffc85e:
	clr.w	(a0)
	bra.s	Lffc83c
Lffc862:
	move.w	#$ffff,(a0)
	bra.s	Lffc83c
Lffc868:
	addq.l	#2,a0
	move.w	d2,($0002,a0)
	move.l	d2,d0
	swap.w	d0
	and.w	#$000f,d0
	add.w	d0,d0
	add.w	d0,d0
	move.w	d0,(a0)
	bra.s	Lffc83c
Call_OS_CURON:
	move.w	($09ba),($09bc)
	move.w	sr,-(a7)
	ori.w	#$0700,sr
	tst.b	($0993)
	bne.s	Lffc896
	tst.b	($0991)
	bne.s	Lffc8a0
Lffc896:
	jsr	(Lff1db0)
	st.b	($0991)
Lffc8a0:
	st.b	($0992)
	sf.b	($0993)
	move.w	(a7)+,sr
	rts

Call_OS_CUROF:
	jsr	(Call_B_CUROFF)
	st.b	($0993)
	rts

Lffc8b8:
	.dc.b	'@Ih柏燈fij本C|D^FGメЗ洋熟OQMobp`BuvAE'
Lffc8de:
	.dc.b	$f0,$9f,$a1,$a3,$a5,$a7,$e1,$e3
	.dc.b	$e5,$c1,$7e,$a0,$a2,$a4,$a6,$a8
Lffc8ee:
	.dc.b	'ｩｫｭｯｱｳｵｷｹｻｽｿﾂﾄﾆﾈﾉﾊﾋﾌ'
Lffc902:
	.dc.b	'ﾍﾐﾓﾖﾙﾜﾝﾞﾟ珞蓙鉅鳰',$f1
Call_SP_INIT:
	bsr.w	Lffcc9e
	movem.l	d1-d2/a1,-(a7)
	lea.l	($00eb0000),a0
	move.w	#$007f,d0
	moveq.l	#$00,d1
Lffc92a:
	move.l	d1,(a0)+
	move.l	d1,(a0)+
	dbra.w	d0,Lffc92a
	lea.l	($00eb0800),a0
	move.l	d1,(a0)+
	move.l	d1,(a0)+
	move.w	d1,(a0)
	lea.l	($00eb8000),a0
	move.l	#$00ec0000,d2
Lffc94a:
	move.l	d1,(a0)+
	cmpa.l	d2,a0
	blt.s	Lffc94a
	lea.l	($00e82220),a0
	moveq.l	#$0e,d2
	bsr.w	Lffcc88
Lffc95c:
	lea.l	(Lffc974,pc),a1
	moveq.l	#$0f,d1
Lffc962:
	move.w	(a1)+,(a0)+
	dbra.w	d1,Lffc962
	dbra.w	d2,Lffc95c
	moveq.l	#$00,d0
	movem.l	(a7)+,d1-d2/a1
	rts

Lffc974:
	.dc.b	$00,$00,$52,$94,$00,$20,$00,$3e
	.dc.b	$04,$00,$07,$c0,$04,$20,$07,$fe
	.dc.b	$80,$00,$f8,$00,$80,$20,$f8,$3e
	.dc.b	$84,$00,$ff,$c0,$ad,$6a,$ff,$fe
Call_SP_ON:
	bsr.w	Lffcc9e
	ori.w	#$0040,($00e82600)
	ori.w	#$0200,($00eb0808)
	rts

Call_SP_OFF:
	andi.w	#$ffbf,($00e82600)
	andi.w	#$fdff,($00eb0808)
	rts

Call_SP_CGCLR:
	bsr.w	Lffcc9e
	move.l	d1,-(a7)
	andi.l	#$000000ff,d1
	lea.l	($00eb8000),a0
	lsl.w	#7,d1
	adda.w	d1,a0
	moveq.l	#$3f,d0
	moveq.l	#$00,d1
Lffc9d6:
	move.w	d1,(a0)+
	dbra.w	d0,Lffc9d6
	moveq.l	#$00,d0
	move.l	(a7)+,d1
	rts

Call_SP_DEFCG:
	bsr.w	Lffcc9e
	movem.l	d1/a1,-(a7)
	andi.l	#$000000ff,d1
	tst.l	d2
	bne.s	Lffca08
	lea.l	($00eb8000),a0
	lsl.w	#5,d1
	adda.w	d1,a0
	moveq.l	#$0f,d0
Lffca00:
	move.w	(a1)+,(a0)+
	dbra.w	d0,Lffca00
	bra.s	Lffca1a
Lffca08:
	lea.l	($00eb8000),a0
	lsl.w	#7,d1
	adda.w	d1,a0
	moveq.l	#$3f,d0
Lffca14:
	move.w	(a1)+,(a0)+
	dbra.w	d0,Lffca14
Lffca1a:
	movem.l	(a7)+,d1/a1
	moveq.l	#$00,d0
	rts

Call_SP_GTPCG:
	bsr.w	Lffcc9e
	movem.l	d1/a1,-(a7)
	andi.l	#$000000ff,d1
	tst.l	d2
	bne.s	Lffca48
	lea.l	($00eb8000),a0
	lsl.w	#5,d1
	adda.w	d1,a0
	moveq.l	#$0f,d0
Lffca40:
	move.w	(a0)+,(a1)+
	dbra.w	d0,Lffca40
	bra.s	Lffca5a
Lffca48:
	lea.l	($00eb8000),a0
	lsl.w	#7,d1
	adda.w	d1,a0
	moveq.l	#$3f,d0
Lffca54:
	move.w	(a0)+,(a1)+
	dbra.w	d0,Lffca54
Lffca5a:
	moveq.l	#$00,d0
	movem.l	(a7)+,d1/a1
	rts

Call_SP_REGST:
	bsr.w	Lffcc9e
	movem.l	d1/d5,-(a7)
	andi.w	#$007f,d1
	lea.l	($00eb0000),a0
	lsl.w	#3,d1
	adda.w	d1,a0
	tst.l	d1
	bmi.s	Lffca80
	bsr.w	Lffcc88
Lffca80:
	tst.l	d2
	bmi.s	Lffca86
	move.w	d2,(a0)
Lffca86:
	addq.w	#2,a0
	tst.l	d3
	bmi.s	Lffca8e
	move.w	d3,(a0)
Lffca8e:
	addq.w	#2,a0
	tst.l	d4
	bmi.s	Lffca96
	move.w	d4,(a0)
Lffca96:
	addq.w	#2,a0
	tst.l	d5
	bmi.s	Lffcaa2
	andi.w	#$0003,d5
	move.w	d5,(a0)
Lffcaa2:
	moveq.l	#$00,d0
	movem.l	(a7)+,d1/d5
	rts

Call_SP_REGGT:
	bsr.w	Lffcc9e
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

Call_BGSCRLST:
	bsr.w	Lffcc9e
	btst.l	#$00,d1
	bne.s	Lffcae4
	lea.l	($00eb0800),a0
	bra.s	Lffcaea
Lffcae4:
	lea.l	($00eb0804),a0
Lffcaea:
	tst.l	d1
	bmi.s	Lffcaf2
	bsr.w	Lffcc88
Lffcaf2:
	tst.l	d2
	bmi.s	Lffcaf8
	move.w	d2,(a0)
Lffcaf8:
	addq.w	#2,a0
	tst.l	d3
	bmi.s	Lffcb00
	move.w	d3,(a0)
Lffcb00:
	moveq.l	#$00,d0
	rts

Call_BGSCRLGT:
	bsr.w	Lffcc9e
	btst.l	#$00,d1
	bne.s	Lffcb16
	lea.l	($00eb0800),a0
	bra.s	Lffcb1c
Lffcb16:
	lea.l	($00eb0804),a0
Lffcb1c:
	moveq.l	#$00,d2
	move.w	(a0)+,d2
	moveq.l	#$00,d3
	move.w	(a0),d3
	moveq.l	#$00,d0
	rts

Call_BGCTRLST:
	bsr.w	Lffcc9e
	movem.l	d2-d3,-(a7)
	tst.l	d2
	bpl.s	Lffcb3a
	moveq.l	#$fe,d0
	moveq.l	#$00,d2
	bra.s	Lffcb42
Lffcb3a:
	moveq.l	#$f8,d0
	andi.w	#$0001,d2
	add.l	d2,d2
Lffcb42:
	tst.l	d3
	bpl.s	Lffcb4c
	ori.w	#$0001,d0
	bra.s	Lffcb52
Lffcb4c:
	beq.s	Lffcb52
	ori.w	#$0001,d2
Lffcb52:
	btst.l	#$00,d1
	beq.s	Lffcb5c
	rol.w	#3,d0
	lsl.w	#3,d2
Lffcb5c:
	move.w	($00eb0808),d3
	and.w	d0,d3
	or.w	d2,d3
	move.w	d3,($00eb0808)
	moveq.l	#$00,d0
	movem.l	(a7)+,d2-d3
	rts

Call_BGCTRLGT:
	bsr.w	Lffcc9e
	btst.l	#$00,d1
	beq.s	Lffcb8e
	move.w	($00eb0808),d0
	andi.l	#$00000038,d0
	lsr.l	#3,d0
	rts

Lffcb8e:
	move.w	($00eb0808),d0
	andi.l	#$00000007,d0
	rts

Call_BGTEXTCL:
	bsr.w	Lffcc9e
	btst.l	#$00,d1
	bne.s	Lffcbb4
	lea.l	($00ebc000),a0
	move.l	#$00ebe000,d0
	bra.s	Lffcbc0
Lffcbb4:
	lea.l	($00ebe000),a0
	move.l	#$00ec0000,d0
Lffcbc0:
	move.w	d2,(a0)+
	cmpa.l	d0,a0
	bmi.s	Lffcbc0
	moveq.l	#$00,d0
	rts

Call_BGTEXTST:
	bsr.w	Lffcc9e
	movem.l	d2-d3,-(a7)
	btst.l	#$00,d1
	bne.s	Lffcbe0
	lea.l	($00ebc000),a0
	bra.s	Lffcbe6
Lffcbe0:
	lea.l	($00ebe000),a0
Lffcbe6:
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

Call_BGTEXTGT:
	bsr.w	Lffcc9e
	movem.l	d2-d3,-(a7)
	btst.l	#$00,d1
	bne.s	Lffcc16
	lea.l	($00ebc000),a0
	bra.s	Lffcc1c
Lffcc16:
	lea.l	($00ebe000),a0
Lffcc1c:
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

Call_SPALET:
	movem.l	d1-d2,-(a7)
	andi.w	#$000f,d2
	bne.s	Lffcc52
	andi.w	#$00ff,d1
	cmpi.w	#$0010,d1
	bcc.s	Lffcc5a
	moveq.l	#$fe,d0
	movem.l	(a7)+,d1-d2
	rts

Lffcc52:
	andi.w	#$000f,d1
	andi.w	#$000f,d2
Lffcc5a:
	lea.l	($00e82200),a0
	add.w	d1,d1
	lsl.w	#5,d2
	add.w	d2,d1
	adda.w	d1,a0
	tst.l	d1
	bmi.s	Lffcc6e
	bsr.s	Lffcc88
Lffcc6e:
	tst.l	d3
	bpl.s	Lffcc7c
	moveq.l	#$00,d0
	move.w	(a0),d0
	movem.l	(a7)+,d1-d2
	rts

Lffcc7c:
	moveq.l	#$00,d0
	move.w	(a0),d0
	move.w	d3,(a0)
	movem.l	(a7)+,d1-d2
	rts

Lffcc88:
	btst.b	#$04,($00e88001)
	beq.s	Lffcc88
Lffcc92:
	btst.b	#$04,($00e88001)
	bne.s	Lffcc92
	rts

Lffcc9e:
	move.w	($00e80028),d0
	andi.w	#$00ff,d0
	cmpi.w	#$0016,d0
	bne.s	Lffccb4
	moveq.l	#$ff,d0
	addq.l	#4,a7
	rts

Lffccb4:
	moveq.l	#$00,d0
	rts

Lffccb8:
	movem.l	d1/d3/a1-a2/a6,-(a7)
	moveq.l	#$10,d0
	cmp.l	d0,d1
	bcs.s	Lffccd6
	add.l	d0,d0
	cmp.l	d0,d1
	bcs.s	Lffcd02
	add.l	d0,d0
	cmp.l	d0,d1
	bcs.s	Lffccdc
	moveq.l	#$50,d0
	cmp.l	d0,d1
	bcs.s	Lffcce6
	bra.s	Lffcd02
Lffccd6:
	lea.l	(Lffcd0e,pc),a2
	bra.s	Lffccee
Lffccdc:
	moveq.l	#$20,d0
	sub.l	d0,d1
	lea.l	(Lffcd4e,pc),a2
	bra.s	Lffccee
Lffcce6:
	moveq.l	#$40,d0
	sub.l	d0,d1
	lea.l	(Lffcdce,pc),a2
Lffccee:
	lsl.l	#2,d1
	movea.l	(Lff933c,pc),a6
	move.l	(a2,d1.w),d1
	adda.l	d1,a2
	jsr	(a2)
	movem.l	(a7)+,d1/d3/a1-a2/a6
	rts

Lffcd02:
	moveq.l	#$ff,d0
	movem.l	(a7)+,d1/d3/a1-a2/a6
	rts

Lffcd0a:
	moveq.l	#$ff,d0
	rts

Lffcd0e:
	.dc.b	$00,$00,$01,$00,$00,$00,$01,$ee
	.dc.b	$00,$00,$01,$c8,$00,$00,$02,$bc
	.dc.b	$00,$00,$08,$b2,$00,$00,$08,$6a
	.dc.b	$00,$00,$03,$9c,$00,$00,$03,$da
	.dc.b	$00,$00,$04,$18,$00,$00,$04,$84
	.dc.b	$00,$00,$04,$98,$00,$00,$03,$58
	.dc.b	$00,$00,$03,$18,$00,$00,$04,$54
	.dc.b	$ff,$ff,$ff,$fc,$ff,$ff,$ff,$fc
Lffcd4e:
	.dc.b	$00,$00,$08,$c4,$00,$00,$09,$f4
	.dc.b	$00,$00,$0a,$4e,$00,$00,$0b,$de
	.dc.b	$00,$00,$06,$a2,$00,$00,$07,$4e
	.dc.b	$00,$00,$0a,$ac,$00,$00,$0b,$12
	.dc.b	$00,$00,$0b,$b2,$00,$00,$09,$3c
	.dc.b	$00,$00,$09,$7c,$00,$00,$06,$c0
	.dc.b	$00,$00,$09,$00,$00,$00,$0c,$aa
	.dc.b	$00,$00,$06,$de,$00,$00,$0c,$44
	.dc.b	$00,$00,$0c,$76,$00,$00,$09,$bc
	.dc.b	$00,$00,$0c,$12,$ff,$ff,$ff,$bc
	.dc.b	$ff,$ff,$ff,$bc,$ff,$ff,$ff,$bc
	.dc.b	$00,$00,$0c,$de,$00,$00,$0d,$20
	.dc.b	$00,$00,$0d,$58,$00,$00,$0d,$90
	.dc.b	$ff,$ff,$ff,$bc,$ff,$ff,$ff,$bc
	.dc.b	$ff,$ff,$ff,$bc,$ff,$ff,$ff,$bc
	.dc.b	$ff,$ff,$ff,$bc,$ff,$ff,$ff,$bc
Lffcdce:
	DOS	_CHANGE_PR
	DOS	_CREATE
	DOS	_CHANGE_PR
	DOS	_CREATE
	DOS	_CHANGE_PR
	DOS	_CREATE
	DOS	_CHANGE_PR
	DOS	_CREATE
	DOS	_CHANGE_PR
	DOS	_CREATE
	DOS	_CHANGE_PR
	DOS	_CREATE
	DOS	_CHANGE_PR
	DOS	_CREATE
	DOS	_CHANGE_PR
	DOS	_CREATE
	DOS	_CHANGE_PR
	DOS	_CREATE
	DOS	_CHANGE_PR
	DOS	_CREATE
	DOS	_CHANGE_PR
	DOS	_CREATE
	DOS	_CHANGE_PR
	DOS	_CREATE
	DOS	_CHANGE_PR
	DOS	_CREATE
	DOS	_CHANGE_PR
	DOS	_CREATE
	DOS	_CHANGE_PR
	DOS	_CREATE
	DOS	_CHANGE_PR
	DOS	_CREATE
Lffce0e:
	movem.l	d1/a1/a6,-(a7)
	movea.l	(Lff933c,pc),a6
	move.b	#$90,($0003,a6)
	sf.b	($0cc2)
	move.b	($00ed006f),d0
	cmpi.b	#$56,d0
	beq.s	Lffce54
	move.b	#$31,($00e8e00d)
	move.b	#$07,($00ed0070)
	move.b	#$00,($00ed0071)
	move.b	#$56,($00ed006f)
	move.b	#$00,($00e8e00d)
Lffce54:
	move.b	($00ed0070),d0
	andi.b	#$07,d0
	move.b	d0,($0001,a6)
	moveq.l	#$00,d0
	move.b	d0,($0005,a6)
	move.b	d0,($0011,a6)
	move.b	d0,($0019,a6)
	move.b	d0,($001b,a6)
	move.b	d0,($001d,a6)
	move.b	d0,($0017,a6)
	move.b	#$00,($000b,a6)
	move.w	#$0200,($0cc0)
	moveq.l	#$6c,d1
	lea.l	(Lffcec0,pc),a1
	IOCS	_B_INTVCS
	move.b	#$10,($0003,a6)
	moveq.l	#$02,d0
	bsr.w	Lffd54c
	move.b	#$10,($0005,a6)
	moveq.l	#$05,d0
	bsr.w	Lffd54c
	move.b	#$00,($0005,a6)
	move.l	#$00009c40,d0
	bsr.w	Lffd54c
	movem.l	(a7)+,d1/a1/a6
	rts

Lffcec0:
	movem.l	d0-d1/a6,-(a7)
	movea.l	(Lff933c,pc),a6
	move.b	($0009,a6),d0
	move.b	d0,($0009,a6)
	movem.l	(a7)+,d0-d1/a6
	rte

Lffced6:
	movem.l	d4/d7/a0/a6,-(a7)
	movea.l	(Lff933c,pc),a6
	lea.l	($0009,a6),a0
	move.b	#$00,($0011,a6)
Lffcee8:
	move.b	($000d,a6),d0
	andi.b	#$f8,d0
	bne.s	Lffcee8
	move.b	(a0),(a0)
	move.b	#$60,($0005,a6)
	bra.s	Lffcf18
Lffcefc:
	movem.l	d4/d7/a0/a6,-(a7)
	movea.l	(Lff933c,pc),a6
	lea.l	($0009,a6),a0
	move.b	#$00,($0011,a6)
Lffcf0e:
	move.b	($000d,a6),d0
	andi.b	#$f8,d0
	bne.s	Lffcf0e
Lffcf18:
	andi.w	#$0007,d4
	moveq.l	#$01,d0
	lsl.b	d4,d0
	btst.b	d4,($00ed0071)
	bne.s	Lffcf34
	or.b	($0001,a6),d0
	bset.b	#$04,($0003,a6)
	bra.s	Lffcf3a
Lffcf34:
	bclr.b	#$04,($0003,a6)
Lffcf3a:
	swap.w	d0
	move.w	#$09c4,d0
	lsl.l	#8,d0
	move.b	#$03,d0
	movep.l	d0,($0017,a6)
	move.b	(a0),(a0)
	move.b	#$20,($0005,a6)
	moveq.l	#$01,d0
	bsr.w	Lffd54c
Lffcf58:
	move.b	(a0),d0
	bne.s	Lffcf6a
	btst.b	#$05,($000d,a6)
	bne.s	Lffcf58
	tst.b	($000d,a6)
	bpl.s	Lffcf18
Lffcf6a:
	move.b	(a0),d0
	beq.s	Lffcf6a
	cmp.b	#$04,d0
	beq.s	Lffcf90
	move.b	(a0),(a0)
	cmp.b	#$10,d0
	beq.s	Lffcf88
Lffcf7c:
	swap.w	d0
	move.b	($000b,a6),d0
Lffcf82:
	movem.l	(a7)+,d4/d7/a0/a6
	rts

Lffcf88:
	moveq.l	#$00,d0
	bra.s	Lffcf82
Lffcf8c:
	moveq.l	#$ff,d0
	bra.s	Lffcf82
Lffcf90:
	move.l	#$00000258,d0
	movep.l	d0,($0017,a6)
	move.b	#$04,(a0)
	moveq.l	#$02,d0
	bsr.w	Lffd54c
Lffcfa4:
	move.b	(a0),d0
	beq.s	Lffcfa4
	move.b	(a0),(a0)
	cmp.b	#$04,d0
	beq.s	Lffcfb8
	cmp.b	#$10,d0
	beq.s	Lffcf88
	bra.s	Lffcf7c
Lffcfb8:
	btst.b	#$05,($000d,a6)
	bne.s	Lffcfb8
	move.b	(a0),(a0)
	tst.b	($000d,a6)
	bmi.s	Lffcf88
	bra.s	Lffcf7c
Lffcfca:
	movem.l	d3/a6,-(a7)
	movea.l	(Lff933c,pc),a6
	move.b	(a1),d0
	andi.b	#$e0,d0
	beq.s	Lffcfe8
	cmp.b	#$20,d0
	beq.s	Lffcfec
	cmp.b	#$a0,d0
	beq.s	Lffcff0
	bra.s	Lffcff2
Lffcfe8:
	moveq.l	#$06,d3
	bra.s	Lffcff2
Lffcfec:
	moveq.l	#$0a,d3
	bra.s	Lffcff2
Lffcff0:
	moveq.l	#$0c,d3
Lffcff2:
	btst.b	#$05,($0009,a6)
	bne.s	Lffd01e
	move.b	($000b,a6),d0
	bpl.s	Lffcff2
	andi.b	#$07,d0
	cmpi.b	#$02,d0
	bne.s	Lffd018
	bsr.w	Lffd37e
	swap.w	d0
	bne.s	Lffd018
Lffd012:
	movem.l	(a7)+,d3/a6
	rts

Lffd018:
	move.b	($000b,a6),d0
	bra.s	Lffd012
Lffd01e:
	bsr.w	Lffce0e
	moveq.l	#$ff,d0
	bra.s	Lffd012
Lffd026:
	movem.l	a6,-(a7)
	movea.l	(Lff933c,pc),a6
Lffd02e:
	move.b	($0009,a6),d0
	btst.l	#$05,d0
	bne.s	Lffd05e
	btst.l	#$03,d0
	bne.s	Lffd058
	move.b	($000b,a6),d0
	bpl.s	Lffd02e
	andi.b	#$07,d0
	bne.s	Lffd058
	bsr.w	Lffd1aa
	swap.w	d0
	bne.s	Lffd058
Lffd052:
	movem.l	(a7)+,a6
	rts

Lffd058:
	move.b	($000b,a6),d0
	bra.s	Lffd052
Lffd05e:
	bsr.w	Lffce0e
	moveq.l	#$ff,d0
	bra.s	Lffd052
Lffd066:
	movem.l	a6,-(a7)
	movea.l	(Lff933c,pc),a6
Lffd06e:
	move.b	($0009,a6),d0
	btst.l	#$05,d0
	bne.s	Lffd0a2
	btst.l	#$03,d0
	bne.s	Lffd09c
	move.b	($000b,a6),d0
	bpl.s	Lffd06e
	andi.b	#$07,d0
	cmpi.b	#$01,d0
	bne.s	Lffd09c
	bsr.w	Lffd260
	swap.w	d0
	bne.s	Lffd09c
Lffd096:
	movem.l	(a7)+,a6
	rts

Lffd09c:
	move.b	($000b,a6),d0
	bra.s	Lffd096
Lffd0a2:
	bsr.w	Lffce0e
	moveq.l	#$ff,d0
	bra.s	Lffd096
Lffd0aa:
	movem.l	d3/a6,-(a7)
	movea.l	(Lff933c,pc),a6
Lffd0b2:
	btst.b	#$05,($0009,a6)
	bne.s	Lffd0e0
	move.b	($000b,a6),d0
	bpl.s	Lffd0b2
	andi.b	#$07,d0
	cmpi.b	#$03,d0
	bne.s	Lffd0da
	moveq.l	#$01,d3
	bsr.w	Lffd3b4
	swap.w	d0
	bne.s	Lffd0da
Lffd0d4:
	movem.l	(a7)+,d3/a6
	rts

Lffd0da:
	move.b	($000b,a6),d0
	bra.s	Lffd0d4
Lffd0e0:
	bsr.w	Lffce0e
	moveq.l	#$ff,d0
	bra.s	Lffd0d4
Lffd0e8:
	movem.l	d3/a6,-(a7)
	movea.l	(Lff933c,pc),a6
	moveq.l	#$01,d3
Lffd0f2:
	btst.b	#$05,($0009,a6)
	bne.s	Lffd11e
	move.b	($000b,a6),d0
	bpl.s	Lffd0f2
	andi.b	#$07,d0
	cmpi.b	#$07,d0
	bne.s	Lffd118
	bsr.w	Lffd3b4
	swap.w	d0
	bne.s	Lffd118
Lffd112:
	movem.l	(a7)+,d3/a6
	rts

Lffd118:
	move.b	($000b,a6),d0
	bra.s	Lffd112
Lffd11e:
	bsr.w	Lffce0e
	moveq.l	#$ff,d0
	bra.s	Lffd112
Lffd126:
	movem.l	d3/a6,-(a7)
	movea.l	(Lff933c,pc),a6
	moveq.l	#$01,d3
Lffd130:
	btst.b	#$05,($0009,a6)
	bne.s	Lffd15a
	move.b	($000b,a6),d0
	bpl.s	Lffd130
	andi.b	#$07,d0
	cmpi.b	#$06,d0
	bne.s	Lffd154
	bsr.s	Lffd1aa
	swap.w	d0
	bne.s	Lffd154
Lffd14e:
	movem.l	(a7)+,d3/a6
	rts

Lffd154:
	move.b	($000b,a6),d0
	bra.s	Lffd14e
Lffd15a:
	bsr.w	Lffce0e
	moveq.l	#$ff,d0
	bra.s	Lffd14e
Lffd162:
	movem.l	d3/a6,-(a7)
	movea.l	(Lff933c,pc),a6
	move.b	($0002,a1),d0
	beq.s	Lffd17c
	subq.b	#2,d0
	bcs.s	Lffd180
	beq.s	Lffd184
	subq.b	#1,d0
	beq.s	Lffd184
	bra.s	Lffd130
Lffd17c:
	moveq.l	#$05,d3
	bra.s	Lffd186
Lffd180:
	moveq.l	#$03,d3
	bra.s	Lffd186
Lffd184:
	moveq.l	#$02,d3
Lffd186:
	move.b	#$01,(a1)
	move.b	d3,($0001,a1)
	addq.l	#2,d3
	bra.s	Lffd130
Lffd192:
	movem.l	a6,-(a7)
	movea.l	(Lff933c,pc),a6
	moveq.l	#$00,d0
	move.b	($000b,a6),d0
	movem.l	(a7)+,a6
	rts

Lffd1a6:
	moveq.l	#$0a,d0
	rts

Lffd1aa:
	movem.l	d1-d4/a1-a4,-(a7)
	lea.l	($0009,a6),a2
	lea.l	($000d,a6),a3
	lea.l	($0015,a6),a4
	tst.l	d3
	bne.s	Lffd1c2
	move.w	#$0100,d3
Lffd1c2:
	move.l	#Lffffff,d0
	and.l	d3,d0
	movep.l	d0,($0017,a6)
	move.b	($000b,a6),d0
	andi.b	#$07,d0
	move.b	d0,($0011,a6)
Lffd1da:
	tst.b	($000b,a6)
	bpl.s	Lffd1da
	move.b	(a2),(a2)
	move.b	#$80,($0005,a6)
Lffd1e8:
	move.b	(a3),d0
	andi.b	#$f0,d0
	cmp.b	#$70,d0
	beq.s	Lffd202
	cmp.b	#$b0,d0
	bne.s	Lffd1e8
	move.l	d3,d0
	lsr.l	#3,d0
	beq.s	Lffd234
	move.l	d0,d2
Lffd202:
	tst.b	(a2)
	bne.s	Lffd24c
	btst.b	#$00,(a3)
	beq.s	Lffd202
	move.l	(a1)+,d0
	move.b	d0,d1
	rol.l	#8,d0
	move.b	d0,(a4)
	rol.l	#8,d0
	move.b	d0,(a4)
	rol.l	#8,d0
	move.b	d0,(a4)
	move.b	d1,(a4)
	move.l	(a1)+,d0
	move.b	d0,d1
	rol.l	#8,d0
	move.b	d0,(a4)
	rol.l	#8,d0
	move.b	d0,(a4)
	rol.l	#8,d0
	move.b	d0,(a4)
	move.b	d1,(a4)
	subq.l	#1,d2
	bne.s	Lffd202
Lffd234:
	and.w	#$0007,d3
	beq.s	Lffd24c
	subq.w	#1,d3
Lffd23c:
	tst.b	(a2)
	bne.s	Lffd24c
	btst.b	#$01,(a3)
	bne.s	Lffd23c
	move.b	(a1)+,(a4)
	dbra.w	d3,Lffd23c
Lffd24c:
	move.b	(a2),d0
	beq.s	Lffd24c
	move.b	d0,(a2)
	cmp.b	#$10,d0
	bne.s	Lffd25a
	moveq.l	#$00,d0
Lffd25a:
	movem.l	(a7)+,d1-d4/a1-a4
	rts

Lffd260:
	movem.l	d1-d3/a1-a4,-(a7)
	lea.l	($0009,a6),a2
	lea.l	($000d,a6),a3
	lea.l	($0015,a6),a4
	tst.l	d3
	bne.s	Lffd278
	move.w	#$0100,d3
Lffd278:
	move.b	($000b,a6),d0
	andi.b	#$07,d0
	move.b	d0,($0011,a6)
	move.l	#Lffffff,d0
	and.l	d3,d0
	movep.l	d0,($0017,a6)
	move.b	(a2),(a2)
	move.b	#$80,($0005,a6)
Lffd298:
	move.b	(a3),d0
	andi.b	#$f0,d0
	cmp.b	#$70,d0
	beq.s	Lffd2ba
	cmp.b	#$b0,d0
	bne.s	Lffd298
	tst.b	($00ed0070)
	bmi.s	Lffd314
Lffd2b2:
	move.l	d3,d0
	lsr.l	#3,d0
	beq.s	Lffd2e8
	move.l	d0,d2
Lffd2ba:
	tst.b	(a2)
	bne.s	Lffd300
	btst.b	#$01,(a3)
	beq.s	Lffd2ba
	move.b	(a4),d0
	lsl.l	#8,d0
	move.b	(a4),d0
	lsl.l	#8,d0
	move.b	(a4),d0
	lsl.l	#8,d0
	move.b	(a4),d0
	move.l	d0,(a1)+
	move.b	(a4),d0
	lsl.l	#8,d0
	move.b	(a4),d0
	lsl.l	#8,d0
	move.b	(a4),d0
	lsl.l	#8,d0
	move.b	(a4),d0
	move.l	d0,(a1)+
	subq.l	#1,d2
	bne.s	Lffd2ba
Lffd2e8:
	and.w	#$0007,d3
	beq.s	Lffd300
	subq.w	#1,d3
Lffd2f0:
	tst.b	(a2)
	bne.s	Lffd300
	btst.b	#$00,(a3)
	bne.s	Lffd2f0
	move.b	(a4),(a1)+
	dbra.w	d3,Lffd2f0
Lffd300:
	move.b	(a2),d0
	beq.s	Lffd300
	move.b	d0,(a2)
	cmp.b	#$10,d0
	bne.s	Lffd30e
	moveq.l	#$00,d0
Lffd30e:
	movem.l	(a7)+,d1-d3/a1-a4
	rts

Lffd314:
	moveq.l	#$00,d2
	move.w	($0cc0),d2
	cmp.l	d2,d3
	bcs.s	Lffd2b2
	divu.w	d2,d3
	lsr.l	#4,d2
	subq.l	#1,d2
Lffd324:
	tst.b	(a2)
	bne.s	Lffd300
	btst.b	#$01,(a3)
	beq.s	Lffd324
	move.w	d2,d1
Lffd330:
	move.b	(a4),d0
	lsl.l	#8,d0
	move.b	(a4),d0
	lsl.l	#8,d0
	move.b	(a4),d0
	lsl.l	#8,d0
	move.b	(a4),d0
	move.l	d0,(a1)+
	move.b	(a4),d0
	lsl.l	#8,d0
	move.b	(a4),d0
	lsl.l	#8,d0
	move.b	(a4),d0
	lsl.l	#8,d0
	move.b	(a4),d0
	move.l	d0,(a1)+
	move.b	(a4),d0
	lsl.l	#8,d0
	move.b	(a4),d0
	lsl.l	#8,d0
	move.b	(a4),d0
	lsl.l	#8,d0
	move.b	(a4),d0
	move.l	d0,(a1)+
	move.b	(a4),d0
	lsl.l	#8,d0
	move.b	(a4),d0
	lsl.l	#8,d0
	move.b	(a4),d0
	lsl.l	#8,d0
	move.b	(a4),d0
	move.l	d0,(a1)+
	dbra.w	d1,Lffd330
	subq.w	#1,d3
	bne.s	Lffd324
	swap.w	d3
	bra.w	Lffd2b2
Lffd37e:
	movem.l	d1-d3/a1-a3,-(a7)
	lea.l	($000b,a6),a2
	lea.l	($0005,a6),a3
	moveq.l	#$ec,d1
	moveq.l	#$cc,d2
Lffd38e:
	move.b	(a2),d0
	andi.b	#$07,d0
	move.b	d0,($0011,a6)
Lffd398:
	tst.b	(a2)
	bpl.s	Lffd398
	move.b	(a1)+,($0017,a6)
	move.b	d1,(a3)
Lffd3a2:
	tst.b	(a2)
	bmi.s	Lffd3a2
	move.b	d2,(a3)
	subq.l	#1,d3
	bne.s	Lffd38e
	moveq.l	#$00,d0
	movem.l	(a7)+,d1-d3/a1-a3
	rts

Lffd3b4:
	movem.l	d1-d3/a1-a3,-(a7)
	lea.l	($000b,a6),a2
	lea.l	($0005,a6),a3
	moveq.l	#$ec,d1
	moveq.l	#$cc,d2
Lffd3c4:
	move.b	(a2),d0
	andi.b	#$07,d0
	move.b	d0,($0011,a6)
Lffd3ce:
	tst.b	(a2)
	bpl.s	Lffd3ce
	move.b	d1,(a3)
Lffd3d4:
	tst.b	(a2)
	bmi.s	Lffd3d4
	move.b	($0017,a6),(a1)+
	move.b	d2,(a3)
	subq.l	#1,d3
	bne.s	Lffd3c4
	moveq.l	#$00,d0
	movem.l	(a7)+,d1-d3/a1-a3
	rts

Lffd3ea:
	.dc.b	$00,$00,$00,$00,$00,$00
Lffd3f0:
	link.w	a5,#-$0010
	movem.l	d1/d3/d6/a1-a3,-(a7)
	lea.l	(Lffd3ea,pc),a2
	bsr.w	Lffd50e
	movem.l	(a7)+,d1/d3/d6/a1-a3
	unlk	a5
	rts

Lffd408:
	.dc.b	$01,$00,$00,$00,$00,$00
Lffd40e:
	link.w	a5,#-$0010
	movem.l	d1/d3/d6/a1-a3,-(a7)
	lea.l	(Lffd408,pc),a2
	bsr.w	Lffd50e
	movem.l	(a7)+,d1/d3/d6/a1-a3
	unlk	a5
	rts

Lffd426:
	.dc.b	$08,$00,$00,$00,$00,$00,$4e,$55
	.dc.b	$ff,$f0,$48,$e7,$52,$70,$26,$49
	.dc.b	$43,$ed,$ff,$f0,$45,$fa,$ff,$ea
	.dc.b	$72,$05,$12,$da,$51,$c9,$ff,$fc
	.dc.b	$43,$ed,$ff,$f0,$2c,$02,$cc,$bc
	.dc.b	$00,$ff,$ff,$ff,$8d,$91,$13,$43
	.dc.b	$00,$04,$61,$00,$00,$84,$4a,$80
	.dc.b	$66,$7a,$e1,$8b,$eb,$ab,$22,$4b
	.dc.b	$61,$00,$01,$58,$0c,$80,$ff,$ff
	.dc.b	$ff,$ff,$67,$68,$0c,$80,$ff,$ff
	.dc.b	$ff,$fe,$67,$0c,$61,$00,$00,$a8
Lffd47e:
	movem.l	(a7)+,d1/d3/d6/a1-a3
	unlk	a5
	rts

Lffd486:
	bsr.w	Lffd524
	tst.l	d0
	bne.s	Lffd47e
	moveq.l	#$fe,d0
	bra.s	Lffd47e
Lffd492:
	.dc.b	$25,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$4e,$55,$ff,$f0,$48,$e7
	.dc.b	$52,$70,$26,$49,$43,$ed,$ff,$f0
	.dc.b	$45,$fa,$ff,$e6,$72,$09,$12,$da
	.dc.b	$51,$c9,$ff,$fc,$43,$ed,$ff,$f0
	.dc.b	$61,$22,$4a,$80,$66,$1a,$22,$4b
	.dc.b	$76,$08,$61,$00,$fb,$a0,$0c,$80
	.dc.b	$ff,$ff,$ff,$ff,$67,$0a,$61,$52
Lffd4d2:
	movem.l	(a7)+,d1/d3/d6/a1-a3
	unlk	a5
	rts

Lffd4da:
	moveq.l	#$ff,d0
	bra.s	Lffd4d2
Lffd4de:
	movem.l	d1/d4,-(a7)
	move.w	#$0001,d1
Lffd4e6:
	bsr.w	Lffcefc
	tst.l	d0
	dbeq.w	d1,Lffd4e6
	bne.s	Lffd50a
	swap.w	d4
	lsl.b	#5,d4
	or.b	d4,($0001,a1)
	bsr.w	Lffcfca
	tst.l	d0
	bne.s	Lffd50a
	moveq.l	#$00,d0
Lffd504:
	movem.l	(a7)+,d1/d4
	rts

Lffd50a:
	moveq.l	#$ff,d0
	bra.s	Lffd504
Lffd50e:
	lea.l	(-$0010,a5),a1
	moveq.l	#$05,d1
Lffd514:
	move.b	(a2)+,(a1)+
	dbra.w	d1,Lffd514
	lea.l	(-$0010,a5),a1
	bsr.s	Lffd4de
	tst.l	d0
	bne.s	Lffd548
Lffd524:
	lea.l	(-$0001,a5),a1
	bsr.w	Lffd0aa
	tst.l	d0
	bne.s	Lffd548
	lea.l	(-$0002,a5),a1
	bsr.w	Lffd0e8
	tst.l	d0
	bne.s	Lffd548
	move.b	(-$0002,a5),d0
	swap.w	d0
	move.b	(-$0001,a5),d0
	rts

Lffd548:
	moveq.l	#$ff,d0
	rts

Lffd54c:
	movem.l	d0-d2/a0,-(a7)
	lea.l	($00e88023),a0
	moveq.l	#$00,d1
	move.b	(a0),d1
	move.b	(a0),d1
Lffd55c:
	moveq.l	#$00,d2
	move.b	(a0),d2
	cmp.b	(a0),d2
	bcs.s	Lffd55c
	sub.w	d2,d1
	bcc.s	Lffd56c
	add.w	#$00c8,d1
Lffd56c:
	exg.l	d1,d2
	sub.l	d2,d0
	bhi.s	Lffd55c
	movem.l	(a7)+,d0-d2/a0
	rts

Lffd578:
	movem.l	a6,-(a7)
	movea.l	(Lff933c,pc),a6
Lffd580:
	move.b	($0009,a6),d0
	btst.l	#$05,d0
	bne.s	Lffd5b8
	btst.l	#$03,d0
	bne.s	Lffd5b2
	move.b	($000b,a6),d0
	bpl.s	Lffd580
	andi.b	#$07,d0
	bne.s	Lffd5b2
	bsr.w	Lffdb20
	swap.w	d0
	bne.s	Lffd5aa
Lffd5a4:
	movem.l	(a7)+,a6
	rts

Lffd5aa:
	tst.w	d0
	beq.s	Lffd5b2
	swap.w	d0
	bra.s	Lffd5a4
Lffd5b2:
	move.b	($000b,a6),d0
	bra.s	Lffd5a4
Lffd5b8:
	bsr.w	Lffce0e
	moveq.l	#$ff,d0
	bra.s	Lffd5a4
Lffd5c0:
	movem.l	a6,-(a7)
	movea.l	(Lff933c,pc),a6
Lffd5c8:
	move.b	($0009,a6),d0
	btst.l	#$05,d0
	bne.s	Lffd604
	btst.l	#$03,d0
	bne.s	Lffd5fe
	move.b	($000b,a6),d0
	bpl.s	Lffd5c8
	andi.b	#$07,d0
	cmpi.b	#$01,d0
	bne.s	Lffd5fe
	bsr.w	Lffdb76
	swap.w	d0
	bne.s	Lffd5f6
Lffd5f0:
	movem.l	(a7)+,a6
	rts

Lffd5f6:
	tst.w	d0
	beq.s	Lffd5fe
	swap.w	d0
	bra.s	Lffd5f0
Lffd5fe:
	move.b	($000b,a6),d0
	bra.s	Lffd5f0
Lffd604:
	bsr.w	Lffce0e
	moveq.l	#$ff,d0
	bra.s	Lffd5f0
Lffd60c:
	.dc.b	$12,$00,$00,$00,$00,$00,$4e,$55
	.dc.b	$ff,$f0,$48,$e7,$52,$70,$26,$49
	.dc.b	$43,$ed,$ff,$f0,$45,$fa,$ff,$ea
	.dc.b	$72,$05,$12,$da,$51,$c9,$ff,$fc
	.dc.b	$43,$ed,$ff,$f0,$13,$43,$00,$04
	.dc.b	$61,$00,$fe,$a8,$4a,$80,$66,$00
	.dc.b	$02,$a4,$22,$4b,$61,$00,$fa,$24
	.dc.b	$60,$00,$02,$92,$03,$00,$00,$00
	.dc.b	$00,$00,$4e,$55,$ff,$f0,$48,$e7
	.dc.b	$52,$70,$26,$49,$43,$ed,$ff,$f0
	.dc.b	$45,$fa,$ff,$ea,$72,$05,$12,$da
	.dc.b	$51,$c9,$ff,$fc,$43,$ed,$ff,$f0
	.dc.b	$13,$43,$00,$04,$61,$00,$fe,$6c
	.dc.b	$4a,$80,$66,$00,$02,$68,$22,$4b
	.dc.b	$61,$00,$f9,$e8,$60,$00,$02,$56
	.dc.b	$1a,$00,$00,$00,$00,$00,$4e,$55
	.dc.b	$ff,$f0,$48,$e7,$52,$70,$26,$49
	.dc.b	$43,$ed,$ff,$f0,$45,$fa,$ff,$ea
	.dc.b	$72,$05,$12,$da,$51,$c9,$ff,$fc
	.dc.b	$43,$ed,$ff,$f0,$13,$43,$00,$04
	.dc.b	$13,$42,$00,$02,$61,$00,$fe,$2c
	.dc.b	$4a,$80,$66,$00,$02,$28,$22,$4b
	.dc.b	$61,$00,$f9,$a8,$60,$00,$02,$16
	.dc.b	$15,$00,$00,$00,$00,$00,$4e,$55
	.dc.b	$ff,$f0,$48,$e7,$52,$70,$26,$49
	.dc.b	$43,$ed,$ff,$f0,$45,$fa,$ff,$ea
	.dc.b	$72,$05,$12,$da,$51,$c9,$ff,$fc
	.dc.b	$43,$ed,$ff,$f0,$13,$43,$00,$04
	.dc.b	$13,$42,$00,$01,$61,$00,$fd,$ec
	.dc.b	$4a,$80,$66,$00,$01,$e8,$22,$4b
	.dc.b	$61,$00,$f9,$28,$60,$00,$01,$d6
	.dc.b	$07,$00,$00,$00,$00,$00,$4e,$55
	.dc.b	$ff,$f0,$48,$e7,$52,$70,$26,$49
	.dc.b	$43,$ed,$ff,$f0,$45,$fa,$ff,$ea
	.dc.b	$72,$05,$12,$da,$51,$c9,$ff,$fc
	.dc.b	$43,$ed,$ff,$f0,$61,$00,$fd,$b4
	.dc.b	$4a,$80,$66,$00,$01,$b0,$22,$4b
	.dc.b	$61,$00,$f8,$f0,$60,$00,$01,$9e
Lffd73c:
	.dc.b	$08,$00,$00,$00,$00,$00
Lffd742:
	link.w	a5,#-$0010
	movem.l	d1/d3/d6/a1-a3,-(a7)
	movea.l	a1,a3
	lea.l	(-$0010,a5),a1
	lea.l	(Lffd73c,pc),a2
	moveq.l	#$05,d1
Lffd756:
	move.b	(a2)+,(a1)+
	dbra.w	d1,Lffd756
	lea.l	(-$0010,a5),a1
	move.l	d2,d6
	and.l	#Lffffff,d6
	or.l	d6,(a1)
	move.b	d3,($0004,a1)
	bsr.w	Lffd4de
	tst.l	d0
	bne.w	Lffd8e0
	lsl.l	#8,d3
	lsl.l	d5,d3
	movea.l	a3,a1
	lea.l	(Lffd5c0,pc),a0
	btst.b	#$04,($00ed0070)
	beq.s	Lffd790
	lea.l	(Lffd066,pc),a0
Lffd790:
	jsr	(a0)
	bra.w	Lffd8b6
Lffd796:
	.dc.b	$0a,$00,$00,$00,$00,$00
Lffd79c:
	link.w	a5,#-$0010
	movem.l	d1/d3/d6/a1-a3,-(a7)
	movea.l	a1,a3
	lea.l	(-$0010,a5),a1
	lea.l	(Lffd796,pc),a2
	moveq.l	#$05,d1
Lffd7b0:
	move.b	(a2)+,(a1)+
	dbra.w	d1,Lffd7b0
	lea.l	(-$0010,a5),a1
	move.l	d2,d6
	and.l	#Lffffff,d6
	or.l	d6,(a1)
	move.b	d3,($0004,a1)
	bsr.w	Lffd4de
	tst.l	d0
	bne.w	Lffd8e0
	lsl.l	#8,d3
	lsl.l	d5,d3
	movea.l	a3,a1
	lea.l	(Lffd578,pc),a0
	btst.b	#$04,($00ed0070)
	beq.s	Lffd7ea
	lea.l	(Lffd026,pc),a0
Lffd7ea:
	jsr	(a0)
	bra.w	Lffd8b6
Lffd7f0:
	.dc.b	$28,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$4e,$55,$ff,$f0,$48,$e7
	.dc.b	$52,$70,$4a,$43,$67,$00,$00,$da
	.dc.b	$26,$49,$43,$ed,$ff,$f0,$45,$fa
	.dc.b	$ff,$e0,$72,$09,$12,$da,$51,$c9
	.dc.b	$ff,$fc,$43,$ed,$ff,$f0,$2c,$03
	.dc.b	$23,$42,$00,$02,$13,$43,$00,$08
	.dc.b	$e0,$8b,$13,$43,$00,$07,$61,$00
	.dc.b	$fc,$ae,$4a,$80,$66,$00,$00,$aa
	.dc.b	$26,$06,$e1,$8b,$eb,$ab,$22,$4b
	.dc.b	$41,$fa,$fd,$7e,$08,$39,$00,$04
	.dc.b	$00,$ed,$00,$70,$67,$04,$41,$fa
	.dc.b	$f8,$16,$4e,$90,$60,$60,$2a,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$4e,$55,$ff,$f0,$48,$e7,$52,$70
	.dc.b	$4a,$43,$67,$74,$26,$49,$43,$ed
	.dc.b	$ff,$f0,$45,$fa,$ff,$e2,$72,$09
	.dc.b	$12,$da,$51,$c9,$ff,$fc,$43,$ed
	.dc.b	$ff,$f0,$2c,$03,$23,$42,$00,$02
	.dc.b	$13,$43,$00,$08,$e0,$8b,$13,$43
	.dc.b	$00,$07,$61,$00,$fc,$4a,$4a,$80
	.dc.b	$66,$46,$26,$06,$e1,$8b,$eb,$ab
	.dc.b	$22,$4b,$41,$fa,$fc,$d4,$08,$39
	.dc.b	$00,$04,$00,$ed,$00,$70,$67,$04
	.dc.b	$41,$fa,$f7,$74,$4e,$90
Lffd8b6:
	cmpi.l	#$ffffffff,d0
	beq.s	Lffd8e0
	cmpi.l	#$fffffffe,d0
	beq.s	Lffd8e4
	bra.s	Lffd8cc
Lffd8c8:
	tst.l	d0
	bne.s	Lffd8e0
Lffd8cc:
	bsr.w	Lffd524
Lffd8d0:
	movem.l	(a7)+,d1/d3/d6/a1-a3
	unlk	a5
	rts

Lffd8d8:
	cmpi.l	#$ffffffff,d0
	bne.s	Lffd8cc
Lffd8e0:
	moveq.l	#$ff,d0
	bra.s	Lffd8d0
Lffd8e4:
	bsr.w	Lffd524
	tst.l	d0
	bne.s	Lffd8ee
	moveq.l	#$fe,d0
Lffd8ee:
	movem.l	(a7)+,d1/d3/d6/a1-a3
	unlk	a5
	rts

Lffd8f6:
	.dc.b	$2f,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$4e,$55,$ff,$f0,$48,$e7
	.dc.b	$52,$70,$4a,$43,$67,$d4,$26,$49
	.dc.b	$43,$ed,$ff,$f0,$45,$fa,$ff,$e2
	.dc.b	$72,$09,$12,$da,$51,$c9,$ff,$fc
	.dc.b	$43,$ed,$ff,$f0,$60,$00,$ff,$5e
	.dc.b	$04,$00,$00,$00,$00,$00,$4e,$55
	.dc.b	$ff,$f0,$48,$e7,$52,$70,$43,$ed
	.dc.b	$ff,$f0,$45,$fa,$ff,$ec,$72,$05
	.dc.b	$12,$da,$51,$c9,$ff,$fc,$43,$ed
	.dc.b	$ff,$f0,$13,$43,$00,$04,$e0,$8b
	.dc.b	$13,$43,$00,$03,$61,$00,$fb,$8a
	.dc.b	$60,$00,$ff,$70,$1e,$00,$00,$00
	.dc.b	$00,$00,$4e,$55,$ff,$f0,$48,$e7
	.dc.b	$52,$70,$43,$ed,$ff,$f0,$45,$fa
	.dc.b	$ff,$ec,$72,$05,$12,$da,$51,$c9
	.dc.b	$ff,$fc,$43,$ed,$ff,$f0,$02,$03
	.dc.b	$00,$01,$13,$43,$00,$04,$61,$00
	.dc.b	$fb,$58,$60,$00,$ff,$3e,$1b,$00
	.dc.b	$00,$00,$00,$00,$4e,$55,$ff,$f0
	.dc.b	$48,$e7,$52,$70,$43,$ed,$ff,$f0
	.dc.b	$45,$fa,$ff,$ec,$72,$05,$12,$da
	.dc.b	$51,$c9,$ff,$fc,$43,$ed,$ff,$f0
	.dc.b	$02,$03,$00,$03,$13,$43,$00,$04
	.dc.b	$61,$00,$fb,$26,$60,$00,$ff,$0c
	.dc.b	$c1,$00,$00,$00,$00,$00,$4e,$55
	.dc.b	$ff,$f0,$48,$e7,$52,$70,$43,$ed
	.dc.b	$ff,$f0,$45,$fa,$ff,$ec,$72,$05
	.dc.b	$12,$da,$51,$c9,$ff,$fc,$43,$ed
	.dc.b	$ff,$f0,$02,$03,$00,$01,$13,$43
	.dc.b	$00,$04,$76,$06,$61,$00,$fa,$f2
	.dc.b	$60,$00,$fe,$d8
Lffd9f2:
	.dc.b	$0b,$00,$00,$00,$00,$00
Lffd9f8:
	link.w	a5,#-$0010
	movem.l	d1/d3/d6/a1-a3,-(a7)
	lea.l	(-$0010,a5),a1
	lea.l	(Lffd9f2,pc),a2
	moveq.l	#$05,d1
Lffda0a:
	move.b	(a2)+,(a1)+
	dbra.w	d1,Lffda0a
	lea.l	(-$0010,a5),a1
	move.l	d2,d6
	and.l	#Lffffff,d6
	or.l	d6,(a1)
	bsr.w	Lffd4de
	bra.w	Lffd8c8
Lffda26:
	.dc.b	$c2,$00,$00,$00,$00,$00
Lffda2c:
	link.w	a5,#-$0010
	movem.l	d1/d3/d6/a1-a3,-(a7)
	movea.l	a1,a3
	lea.l	(-$0010,a5),a1
	lea.l	(Lffda26,pc),a2
	moveq.l	#$05,d1
Lffda40:
	move.b	(a2)+,(a1)+
	dbra.w	d1,Lffda40
	lea.l	(-$0010,a5),a1
	move.l	d3,d1
	move.b	d1,($0005,a1)
	moveq.l	#$06,d3
	bsr.w	Lffd4de
	tst.l	d0
	bne.w	Lffd8e0
	move.l	d1,d3
	movea.l	a3,a1
	bsr.w	Lffd026
	bra.w	Lffd8d8
Lffda68:
	.dc.b	$06,$00,$00,$00,$00,$00
Lffda6e:
	link.w	a5,#-$0010
	movem.l	d1/d3/d6/a1-a3,-(a7)
	lea.l	(-$0010,a5),a1
	lea.l	(Lffda68,pc),a2
	moveq.l	#$05,d1
Lffda80:
	move.b	(a2)+,(a1)+
	dbra.w	d1,Lffda80
	lea.l	(-$0010,a5),a1
	move.l	d2,d6
	and.l	#Lffffff,d6
	or.l	d6,(a1)
	move.b	d3,($0004,a1)
	bsr.w	Lffd4de
	bra.w	Lffd8c8
Lffdaa0:
	.dc.b	$07,$00,$00,$00,$00,$00
Lffdaa6:
	link.w	a5,#-$0010
	movem.l	d1/d3/d6/a1-a3,-(a7)
	lea.l	(-$0010,a5),a1
	lea.l	(Lffdaa0,pc),a2
	moveq.l	#$05,d1
Lffdab8:
	move.b	(a2)+,(a1)+
	dbra.w	d1,Lffdab8
	lea.l	(-$0010,a5),a1
	move.l	d2,d6
	and.l	#Lffffff,d6
	or.l	d6,(a1)
	move.b	d3,($0004,a1)
	bsr.w	Lffd4de
	bra.w	Lffd8c8
Lffdad8:
	.dc.b	$0e,$00,$00,$00,$00,$00
Lffdade:
	link.w	a5,#-$0010
	movem.l	d1/d3/d6/a1-a3,-(a7)
	movea.l	a1,a3
	lea.l	(-$0010,a5),a1
	lea.l	(Lffdad8,pc),a2
	moveq.l	#$05,d1
Lffdaf2:
	move.b	(a2)+,(a1)+
	dbra.w	d1,Lffdaf2
	lea.l	(-$0010,a5),a1
	move.l	d2,d6
	and.l	#Lffffff,d6
	or.l	d6,(a1)
	move.b	d3,($0004,a1)
	bsr.w	Lffd4de
	tst.l	d0
	bne.w	Lffd8e0
	moveq.l	#$04,d3
	movea.l	a3,a1
	bsr.w	Lffd026
	bra.w	Lffd8d8
Lffdb20:
	movem.l	d3/a1,-(a7)
	tst.l	d3
	bne.s	Lffdb2c
	move.w	#$0100,d3
Lffdb2c:
	move.l	#Lffffff,d0
	and.l	d3,d0
	movep.l	d0,($0017,a6)
	move.b	($000b,a6),d0
	andi.b	#$07,d0
	move.b	d0,($0011,a6)
Lffdb44:
	tst.b	($000b,a6)
	bpl.s	Lffdb44
	move.b	($0009,a6),($0009,a6)
	move.b	#$80,($0005,a6)
	bsr.s	Lffdbd0
	tst.l	d0
	bne.s	Lffdb70
Lffdb5c:
	move.b	($0009,a6),d0
	beq.s	Lffdb5c
	move.b	($0009,a6),($0009,a6)
	cmp.b	#$10,d0
	bne.s	Lffdb70
	moveq.l	#$00,d0
Lffdb70:
	movem.l	(a7)+,d3/a1
	rts

Lffdb76:
	movem.l	d3/a1,-(a7)
	move.b	($000b,a6),d0
	andi.b	#$07,d0
	move.b	d0,($0011,a6)
	tst.l	d3
	bne.s	Lffdb8e
	move.w	#$0100,d3
Lffdb8e:
	move.l	#Lffffff,d0
	and.l	d3,d0
	movep.l	d0,($0017,a6)
	move.b	($0009,a6),($0009,a6)
	move.b	#$80,($0005,a6)
	bsr.s	Lffdbc6
	tst.l	d0
	bne.s	Lffdbc0
Lffdbac:
	move.b	($0009,a6),d0
	beq.s	Lffdbac
	move.b	($0009,a6),($0009,a6)
	cmp.b	#$10,d0
	bne.s	Lffdbc0
	moveq.l	#$00,d0
Lffdbc0:
	movem.l	(a7)+,d3/a1
	rts

Lffdbc6:
	movem.l	d1-d2/a0/a3,-(a7)
	move.w	#$80b1,d1
	bra.s	Lffdbd8
Lffdbd0:
	movem.l	d1-d2/a0/a3,-(a7)
	move.w	#$8031,d1
Lffdbd8:
	bsr.w	Lff8284
	lea.l	($00e84040),a0
	st.b	(a0)
	clr.w	($001a,a0)
	move.b	#$04,($0006,a0)
	lea.l	($0015,a6),a3
	move.l	a3,($0014,a0)
	moveq.l	#$00,d2
	move.w	#$0100,d2
	tst.b	($00ed0070)
	bpl.s	Lffdc0c
	moveq.l	#$00,d2
	move.w	($00000cc0).l,d2
Lffdc0c:
	btst.b	#$05,($00ed0070)
	beq.s	Lffdc1a
	eori.w	#$8003,d1
Lffdc1a:
	move.w	d1,($0004,a0)
	lea.l	($0009,a6),a3
	tst.b	d1
	bmi.s	Lffdc9c
Lffdc26:
	cmp.l	d2,d3
	bls.s	Lffdc6e
Lffdc2a:
	move.l	a1,($000c,a0)
	move.w	d2,($000a,a0)
Lffdc32:
	tst.b	(a3)
	bne.s	Lffdc7c
	btst.b	#$00,($000d,a6)
	beq.s	Lffdc32
Lffdc3e:
	tst.b	(a3)
	bne.s	Lffdc7c
	tst.b	($000b,a6)
	bpl.s	Lffdc3e
	st.b	(a0)
	move.b	#$80,($0007,a0)
	tst.b	(a3)
Lffdc52:
	tst.b	(a3)
	bne.s	Lffdc7c
	tst.b	(a0)
	bpl.s	Lffdc52
	move.b	($0001,a0),d0
	bne.s	Lffdc72
	adda.l	d2,a1
	sub.l	d2,d3
	bne.s	Lffdc26
	moveq.l	#$00,d0
Lffdc68:
	movem.l	(a7)+,d1-d2/a0/a3
	rts

Lffdc6e:
	move.l	d3,d2
	bra.s	Lffdc2a
Lffdc72:
	btst.l	#$01,d0
	bne.s	Lffdc32
	moveq.l	#$ff,d0
	bra.s	Lffdc68
Lffdc7c:
	move.b	($0009,a6),d0
	cmpi.b	#$10,d0
	bne.s	Lffdc90
	moveq.l	#$00,d0
	tst.w	($000a,a0)
	beq.s	Lffdc90
	moveq.l	#$fe,d0
Lffdc90:
	move.b	#$10,($0007,a0)
	bra.s	Lffdc68
Lffdc98:
	move.l	d3,d2
	bra.s	Lffdca0
Lffdc9c:
	cmp.l	d2,d3
	bls.s	Lffdc98
Lffdca0:
	move.l	a1,($000c,a0)
	move.w	d2,($000a,a0)
Lffdca8:
	tst.b	(a3)
	bne.s	Lffdc7c
	btst.b	#$00,($000d,a6)
	bne.s	Lffdca8
	st.b	(a0)
	move.b	#$80,($0007,a0)
	tst.b	(a3)
Lffdcbe:
	tst.b	(a3)
	bne.s	Lffdc7c
	tst.b	(a0)
	bpl.s	Lffdcbe
	move.b	($0001,a0),d0
	bne.s	Lffdcda
	adda.l	d2,a1
	sub.l	d2,d3
	bne.s	Lffdc9c
	moveq.l	#$00,d0
Lffdcd4:
	movem.l	(a7)+,d1-d2/a0/a3
	rts

Lffdcda:
	btst.l	#$01,d0
	bne.s	Lffdca8
	moveq.l	#$ff,d0
	bra.s	Lffdcd4
Call_DRAWMODE:
	lea.l	($0d1a),a0
	move.w	(a0),d0
	cmp.w	#$ffff,d0
	beq.s	Lffdcf2
	move.w	d1,(a0)
Lffdcf2:
	rts

Call_BOX:
	move.w	($0964),d0
	beq.s	Lffdd6e
	cmp.w	($0008,a1),d0
	bcs.s	Lffdd72
	movem.l	d1-d7/a1-a4,-(a7)
	move.w	(a1)+,d0
	move.w	(a1)+,d1
	move.w	(a1)+,d2
	move.w	(a1)+,d3
	move.w	(a1)+,d7
	move.w	(a1),d6
	bsr.w	Lffe7b0
	movem.l	(a7)+,d1-d7/a1-a4
	moveq.l	#$00,d0
	rts

Call_LINE:
	move.w	($0964),d0
	beq.s	Lffdd6e
	cmp.w	($0008,a1),d0
	bcs.s	Lffdd72
	movem.l	d1-d7/a1-a4,-(a7)
	move.w	(a1)+,d0
	move.w	(a1)+,d1
	move.w	(a1)+,d2
	move.w	(a1)+,d3
	move.w	(a1)+,d7
	move.w	(a1),d6
	bsr.w	Lffe816
	movem.l	(a7)+,d1-d7/a1-a4
	moveq.l	#$00,d0
	rts

Call_CIRCLE:
	move.w	($0964),d0
	beq.s	Lffdd6e
	cmp.w	($0006,a1),d0
	bcs.s	Lffdd72
	movem.l	d1-d7/a1-a5,-(a7)
	move.w	(a1)+,d4
	move.w	(a1)+,d5
	move.w	(a1)+,d1
	move.w	(a1)+,d7
	move.w	(a1)+,d2
	move.w	(a1)+,d3
	move.w	(a1),d6
	bsr.w	Lffe3b8
	movem.l	(a7)+,d1-d7/a1-a5
	moveq.l	#$00,d0
	rts

Lffdd6e:
	moveq.l	#$ff,d0
	rts

Lffdd72:
	moveq.l	#$fe,d0
	rts

Call_FILL:
	move.w	($0964),d0
	beq.s	Lffdd6e
	cmp.w	($0008,a1),d0
	bcs.s	Lffdd72
	movem.l	d1-d7/a1-a4,-(a7)
	move.w	(a1)+,d0
	move.w	(a1)+,d1
	move.w	(a1)+,d2
	move.w	(a1)+,d3
	move.w	(a1),d7
	bsr.w	Lffeaae
	movem.l	(a7)+,d1-d7/a1-a4
	moveq.l	#$00,d0
	rts

Call_PAINT:
	move.w	($0964),d0
	beq.s	Lffdd6e
	cmp.w	($0004,a1),d0
	bcs.s	Lffdd72
	movem.l	d1-d7/a1-a5,-(a7)
	move.w	(a1)+,d4
	move.w	(a1)+,d5
	move.w	(a1)+,d7
	move.l	(a1)+,d0
	move.l	(a1),d1
	bsr.w	Lffe1d8
	movem.l	(a7)+,d1-d7/a1-a5
	moveq.l	#$00,d0
	rts

Call_POINT:
	tst.w	($0964)
	beq.s	Lffdd6e
	movem.l	d1-d7/a1-a6,-(a7)
	move.l	a1,-(a7)
	move.w	(a1)+,d4
	move.w	(a1)+,d5
	bsr.w	Lffde9c
	bcs.s	Lffdde8
	move.w	(a0),d0
Lffddda:
	movea.l	(a7)+,a1
	move.w	d0,($0004,a1)
	movem.l	(a7)+,d1-d7/a1-a6
	moveq.l	#$00,d0
	rts

Lffdde8:
	clr.w	d0
	bra.s	Lffddda
Call_PSET:
	move.w	($0964),d0
	beq.s	Lffde3e
	cmp.w	($0004,a1),d0
	bcs.s	Lffde42
	movem.l	d1-d7/a1-a6,-(a7)
	move.w	(a1)+,d4
	move.w	(a1)+,d5
	move.w	(a1),d7
	bsr.w	Lffde9c
	bcs.s	Lffde0a
	move.w	d7,(a0)
Lffde0a:
	movem.l	(a7)+,d1-d7/a1-a6
	moveq.l	#$00,d0
	rts

Call_SYMBOL:
	move.w	($0964),d0
	beq.s	Lffde3e
	cmp.w	($000a,a1),d0
	bcs.s	Lffde42
	movem.l	d1-d7/a1-a5,-(a7)
	move.w	(a1)+,d4
	move.w	(a1)+,d5
	movea.l	(a1)+,a0
	move.b	(a1)+,d2
	move.b	(a1)+,d3
	move.w	(a1)+,d7
	move.b	(a1)+,d1
	move.b	(a1),d6
	bsr.w	Lffdede
	movem.l	(a7)+,d1-d7/a1-a5
	moveq.l	#$00,d0
	rts

Lffde3e:
	bra.w	Lffdd6e
Lffde42:
	bra.w	Lffdd72
Call_WIPE:
	tst.w	($0964)
	beq.s	Lffde3e
	movem.l	d1-d7/a1-a4,-(a7)
	bsr.w	Lffeb04
	movem.l	(a7)+,d1-d7/a1-a4
	moveq.l	#$00,d0
	rts

Call_GETGRM:
	tst.w	($0964)
	beq.s	Lffde3e
	movem.l	d1-d7/a1-a4,-(a7)
	move.w	(a1)+,d0
	move.w	(a1)+,d1
	move.w	(a1)+,d2
	move.w	(a1)+,d3
	movea.l	(a1)+,a2
	movea.l	(a1),a3
	bsr.w	Lffe016
	movem.l	(a7)+,d1-d7/a1-a4
	rts

Call_PUTGRM:
	tst.w	($0964)
	beq.s	Lffde3e
	movem.l	d1-d7/a1-a4,-(a7)
	move.w	(a1)+,d0
	move.w	(a1)+,d1
	move.w	(a1)+,d2
	move.w	(a1)+,d3
	movea.l	(a1)+,a2
	movea.l	(a1),a3
	bsr.w	Lffe01a
	movem.l	(a7)+,d1-d7/a1-a4
	rts

Lffde9c:
	cmp.w	($0968),d4
	blt.s	Lffded4
	cmp.w	($096c),d4
	bgt.s	Lffded4
	cmp.w	($096a),d5
	blt.s	Lffded4
	cmp.w	($096e),d5
	bgt.s	Lffded4
	moveq.l	#$00,d0
	move.w	d5,d0
	swap.w	d0
	lsr.l	#6,d0
	btst.b	#$02,($0962)
	bne.s	Lffdec6
	add.l	d0,d0
Lffdec6:
	movea.l	($095c),a0
	adda.l	d0,a0
	adda.w	d4,a0
	adda.w	d4,a0
	tst.w	d0
	rts

Lffded4:
	ori.b	#$01,ccr
	rts

Lffdeda:
	.dc.b	$06,$08,$0c,$00
Lffdede:
	link.w	a6,#-$0066
	move.l	($0968),(-$0066,a6)
	move.l	($096c),(-$0062,a6)
	cmp.b	#$03,d1
	bcs.s	Lffdef6
	moveq.l	#$02,d1
Lffdef6:
	and.w	#$00ff,d1
	move.b	(Lffdeda,pc,d1.w),d1
	move.w	d1,(-$0012,a6)
	lea.l	(-$0008,a6),a4
	lea.l	(-$0010,a6),a5
	move.w	d4,(a4)
	move.w	d5,(a5)
	and.w	#$00ff,d2
	bne.s	Lffdf16
	moveq.l	#$01,d2
Lffdf16:
	and.w	#$00ff,d3
	bne.s	Lffdf1e
	moveq.l	#$01,d3
Lffdf1e:
	move.w	d2,d0
	move.w	d3,d1
	subq.w	#1,d0
	subq.w	#1,d1
	bsr.w	Lffdfe6
	move.w	d2,(-$0002,a6)
	move.w	d3,(-$000a,a6)
	move.w	d0,(-$0004,a6)
	move.w	d1,(-$000c,a6)
	lea.l	(-$005e,a6),a1
Lffdf3e:
	move.w	(-$0012,a6),d1
	swap.w	d1
	clr.w	d1
	move.b	(a0)+,d1
	beq.w	Lffdfe2
	cmp.b	#$80,d1
	bcs.s	Lffdf66
	cmp.b	#$a0,d1
	bcs.s	Lffdf5e
	cmp.b	#$e0,d1
	bcs.s	Lffdf66
Lffdf5e:
	lsl.w	#8,d1
	move.b	(a0),d1
	beq.s	Lffdf66
	addq.l	#1,a0
Lffdf66:
	move.l	a0,-(a7)
	bsr.w	Call_FNTGET
	movea.l	(a7)+,a0
	move.w	(a1),d6
	subq.w	#1,d6
	lsr.w	#3,d6
	addq.w	#1,d6
	move.w	(a4),($0002,a4)
	move.w	(a1),d4
Lffdf7c:
	move.w	(a5),($0002,a5)
	move.w	($0002,a1),d5
	lea.l	($0004,a1),a2
Lffdf88:
	lea.l	(a2,d6.w),a3
	move.l	a3,-(a7)
Lffdf8e:
	move.b	-(a3),d0
	roxl.b	#1,d0
	move.b	d0,(a3)
	cmpa.l	a2,a3
	bne.s	Lffdf8e
	roxr.b	#1,d0
	bpl.s	Lffdfbc
	move.w	(-$0006,a6),d0
	move.w	(-$000e,a6),d1
	move.w	d0,d2
	move.w	d1,d3
	add.w	($0004,a4),d2
	add.w	($0004,a5),d3
	movem.l	d4-d6/a0-a1,-(a7)
	bsr.w	Lffeaae
	movem.l	(a7)+,d4-d6/a0-a1
Lffdfbc:
	move.w	(-$000a,a6),d0
	add.w	d0,($0002,a5)
	movea.l	(a7)+,a2
	subq.w	#1,d5
	bne.s	Lffdf88
	move.w	(-$0002,a6),d0
	add.w	d0,($0002,a4)
	subq.w	#1,d4
	bne.s	Lffdf7c
	move.w	(-$0002,a6),d0
	muls.w	(a1),d0
	add.w	d0,(a4)
	bra.w	Lffdf3e
Lffdfe2:
	unlk	a6
	rts

Lffdfe6:
	subq.b	#1,d6
	bcs.s	Lffdff6
	beq.s	Lffdff8
	subq.b	#1,d6
	beq.s	Lffe000
	exg.l	a4,a5
	neg.w	d1
	neg.w	d3
Lffdff6:
	rts

Lffdff8:
	exg.l	a4,a5
	neg.w	d0
	neg.w	d2
	rts

Lffe000:
	neg.w	d0
	neg.w	d2
	neg.w	d1
	neg.w	d3
	rts

Lffe00a:
	moveq.l	#$ff,d0
	rts

Lffe00e:
	moveq.l	#$fe,d0
	rts

Lffe012:
	moveq.l	#$fd,d0
	rts

Lffe016:
	moveq.l	#$00,d7
	bra.s	Lffe01c
Lffe01a:
	moveq.l	#$ff,d7
Lffe01c:
	tst.w	($0964)
	beq.s	Lffe00a
	cmp.w	d0,d2
	bge.s	Lffe028
	exg.l	d0,d2
Lffe028:
	cmp.w	d1,d3
	bge.s	Lffe02e
	exg.l	d1,d3
Lffe02e:
	cmp.w	($0968),d0
	blt.s	Lffe00e
	cmp.w	($096c),d2
	bgt.s	Lffe00e
	cmp.w	($096a),d1
	blt.s	Lffe00e
	cmp.w	($096e),d3
	bgt.s	Lffe00e
	sub.w	d0,d2
	sub.w	d1,d3
	move.w	d0,d4
	move.w	d1,d5
	bsr.s	Lffe082
	move.w	d2,d0
	addq.w	#1,d0
	move.w	d3,d1
	addq.w	#1,d1
	mulu.w	d1,d0
	jsr	(a1)
	subq.l	#1,d0
	add.l	a2,d0
	cmp.l	a3,d0
	bhi.s	Lffe012
	moveq.l	#$00,d0
	move.w	d5,d0
	swap.w	d0
	lsr.l	#6,d0
	btst.b	#$02,($0962)
	bne.s	Lffe076
	add.l	d0,d0
Lffe076:
	movea.l	($095c),a0
	adda.l	d0,a0
	adda.w	d4,a0
	adda.w	d4,a0
	jmp	(a4)

Lffe082:
	moveq.l	#$04,d1
	move.w	($0964),d0
	bmi.s	Lffe092
	moveq.l	#$02,d1
	tst.b	d0
	bmi.s	Lffe092
	moveq.l	#$00,d1
Lffe092:
	lea.l	(Lffe0aa,pc),a1
	adda.w	(Lffe0aa,pc,d1.w),a1
	tst.w	d7
	bne.s	Lffe0a0
	addq.w	#6,d1
Lffe0a0:
	lea.l	(Lffe0b0,pc),a4
	adda.w	(Lffe0b0,pc,d1.w),a4
	rts

Lffe0aa:
	.dc.w	$0012,$001a,$0018
Lffe0b0:
	.dc.w	$009e,$00f6,$010e,$0016
	.dc.w	$0070,$0088,$5280,$e288
	.dc.w	$4e75
Lffe0c2:
	lsl.l	#1,d0
	rts

Lffe0c6:
	btst.l	#$00,d2
	beq.s	Lffe0ee
	lsr.w	#1,d2
Lffe0ce:
	movea.l	a0,a1
	move.w	d2,d1
Lffe0d2:
	move.l	(a1)+,d0
	move.l	d0,d4
	swap.w	d4
	lsl.b	#4,d4
	or.b	d4,d0
	move.b	d0,(a2)+
	dbra.w	d1,Lffe0d2
	adda.l	($0960),a0
	dbra.w	d3,Lffe0ce
	moveq.l	#$00,d0
	rts

Lffe0ee:
	movea.l	a0,a1
	move.w	d2,d1
Lffe0f2:
	move.w	(a1)+,d0
	lsl.b	#4,d0
	subq.w	#1,d1
	bcs.s	Lffe10e
Lffe0fa:
	or.w	(a1)+,d0
	move.b	d0,(a2)+
	dbra.w	d1,Lffe0f2
	adda.l	($0960),a0
	dbra.w	d3,Lffe0ee
	moveq.l	#$00,d0
	rts

Lffe10e:
	adda.l	($0960),a0
	movea.l	a0,a1
	move.w	d2,d1
	dbra.w	d3,Lffe0fa
	move.b	d0,(a2)+
	moveq.l	#$00,d0
	rts

Lffe120:
	movea.l	a0,a1
	move.w	d2,d1
Lffe124:
	move.w	(a1)+,d0
	move.b	d0,(a2)+
	dbra.w	d1,Lffe124
	adda.l	($0960),a0
	dbra.w	d3,Lffe120
	moveq.l	#$00,d0
	rts

Lffe138:
	movea.l	a0,a1
	move.w	d2,d1
Lffe13c:
	move.w	(a1)+,(a2)+
	dbra.w	d1,Lffe13c
	adda.l	($0960),a0
	dbra.w	d3,Lffe138
	moveq.l	#$00,d0
	rts

Lffe14e:
	btst.l	#$00,d2
	beq.s	Lffe174
	lsr.w	#1,d2
Lffe156:
	movea.l	a0,a1
	move.w	d2,d1
Lffe15a:
	move.b	(a2)+,d0
	move.b	d0,d4
	lsr.b	#4,d0
	move.w	d0,(a1)+
	move.w	d4,(a1)+
	dbra.w	d1,Lffe15a
	adda.l	($0960),a0
	dbra.w	d3,Lffe156
	moveq.l	#$00,d0
	rts

Lffe174:
	movea.l	a0,a1
	move.w	d2,d1
Lffe178:
	move.b	(a2)+,d0
	move.b	d0,d4
	ror.b	#4,d0
	move.w	d0,(a1)+
	subq.w	#1,d1
	bcs.s	Lffe196
Lffe184:
	move.w	d4,(a1)+
	dbra.w	d1,Lffe178
	adda.l	($0960),a0
	dbra.w	d3,Lffe174
	moveq.l	#$00,d0
	rts

Lffe196:
	adda.l	($0960),a0
	movea.l	a0,a1
	move.w	d2,d1
	dbra.w	d3,Lffe184
	moveq.l	#$00,d0
	rts

Lffe1a6:
	movea.l	a0,a1
	move.w	d2,d1
Lffe1aa:
	move.b	(a2)+,d0
	move.w	d0,(a1)+
	dbra.w	d1,Lffe1aa
	adda.l	($0960),a0
	dbra.w	d3,Lffe1a6
	moveq.l	#$00,d0
	rts

Lffe1be:
	movea.l	a0,a1
	move.w	d2,d1
Lffe1c2:
	move.w	(a2)+,(a1)+
	dbra.w	d1,Lffe1c2
	adda.l	($0960),a0
	dbra.w	d3,Lffe1be
	moveq.l	#$00,d0
	rts

Lffe1d4:
	unlk	a6
	rts

Lffe1d8:
	link.w	a6,#-$0040
	move.l	($0968),(-$0040,a6)
	move.l	($096c),(-$003c,a6)
	move.l	($0960),(-$0038,a6)
	cmp.l	d0,d1
	bcs.s	Lffe1d4
	move.l	d0,(-$002c,a6)
	sub.l	#$0000001f,d1
	move.l	d1,(-$0028,a6)
	move.l	d0,(-$0034,a6)
	move.l	d0,(-$0030,a6)
	move.w	d4,d1
	movea.w	d5,a4
	bsr.w	Lffde9c
	bcs.s	Lffe1d4
	cmp.w	(a0),d7
	beq.s	Lffe1d4
	move.w	d7,d0
	swap.w	d7
	move.w	d0,d7
	move.w	(a0),d6
	move.w	(-$0040,a6),d4
	move.w	(-$003c,a6),d5
	bsr.s	Lffe27a
	move.l	(-$0024,a6),(-$0018,a6)
	move.l	(-$0020,a6),(-$0014,a6)
	move.l	(-$001c,a6),(-$0010,a6)
	bsr.w	Lffe328
Lffe23e:
	movea.l	(-$0030,a6),a1
	cmpa.l	(-$0034,a6),a1
	beq.s	Lffe1d4
	lea.l	($0020,a1),a1
	cmpa.l	(-$0028,a6),a1
	bls.s	Lffe256
	movea.l	(-$002c,a6),a1
Lffe256:
	move.l	a1,(-$0030,a6)
	movea.w	(a1)+,a2
	movea.w	(a1)+,a4
	move.l	(a1)+,(-$0018,a6)
	move.l	(a1)+,(-$0014,a6)
	move.l	(a1)+,(-$0010,a6)
	move.l	(a1)+,(-$000c,a6)
	move.l	(a1)+,(-$0008,a6)
	move.l	(a1)+,(-$0004,a6)
	bsr.s	Lffe2d8
	bra.s	Lffe23e
Lffe27a:
	move.w	d7,(a0)
	move.l	a0,-(a7)
	move.w	d1,-(a7)
	sub.w	d4,d1
	subq.w	#1,d1
	bcc.s	Lffe28e
Lffe286:
	move.w	d7,(a0)
	move.w	d4,d1
	bra.s	Lffe29c
Lffe28c:
	move.w	d7,(a0)
Lffe28e:
	cmp.w	-(a0),d6
	dbne.w	d1,Lffe28c
	beq.s	Lffe286
	addq.l	#2,a0
	addq.w	#1,d1
	add.w	d4,d1
Lffe29c:
	move.w	d1,(-$0024,a6)
	move.l	a0,(-$0022,a6)
	move.w	d5,d1
	sub.w	(a7)+,d1
	subq.w	#1,d1
	bcs.s	Lffe2b2
	movea.l	(a7)+,a0
	addq.l	#2,a0
	bra.s	Lffe2bc
Lffe2b2:
	movea.l	(a7)+,a0
Lffe2b4:
	move.w	d7,(a0)
	move.w	d5,d1
	bra.s	Lffe2cc
Lffe2ba:
	move.w	d7,(a0)+
Lffe2bc:
	cmp.w	(a0),d6
	dbne.w	d1,Lffe2ba
	beq.s	Lffe2b4
	subq.l	#2,a0
	addq.w	#1,d1
	sub.w	d5,d1
	neg.w	d1
Lffe2cc:
	move.w	d1,(-$001e,a6)
	move.l	a0,(-$001c,a6)
	rts

Lffe2d6:
	rts

Lffe2d8:
	cmpa.w	(-$003e,a6),a4
	beq.s	Lffe2e6
	lea.l	(-$0001,a4),a5
	moveq.l	#$00,d0
	bsr.s	Lffe2f2
Lffe2e6:
	cmpa.w	(-$003a,a6),a4
	beq.s	Lffe2d6
	lea.l	($0001,a4),a5
	moveq.l	#$ff,d0
Lffe2f2:
	movea.w	d0,a3
	move.w	a2,d1
	eor.w	d0,d1
	beq.s	Lffe344
	move.w	(-$000c,a6),d1
	cmp.w	d4,d1
	beq.s	Lffe310
	subq.w	#1,d1
	move.w	d1,d3
	move.w	(-$0018,a6),d1
	movea.l	(-$0016,a6),a0
	bsr.s	Lffe350
Lffe310:
	move.w	(-$0006,a6),d1
	cmp.w	d5,d1
	beq.s	Lffe2d6
	movea.l	(-$0004,a6),a0
	move.w	(-$0012,a6),d3
	addq.l	#2,a0
	addq.w	#1,d1
	bra.s	Lffe360
Lffe326:
	rts

Lffe328:
	cmpa.w	(-$003e,a6),a4
	beq.s	Lffe336
	lea.l	(-$0001,a4),a5
	moveq.l	#$00,d0
	bsr.s	Lffe342
Lffe336:
	cmpa.w	(-$003a,a6),a4
	beq.s	Lffe326
	lea.l	($0001,a4),a5
	moveq.l	#$ff,d0
Lffe342:
	movea.w	d0,a3
Lffe344:
	move.w	(-$0012,a6),d3
	movea.l	(-$0016,a6),a0
	move.w	(-$0018,a6),d1
Lffe350:
	move.w	(-$0036,a6),d0
	move.w	a3,d2
	bne.s	Lffe35a
	neg.w	d0
Lffe35a:
	adda.w	d0,a0
	bra.s	Lffe360
Lffe35e:
	addq.w	#1,d1
Lffe360:
	cmp.w	d3,d1
	bhi.s	Lffe3b6
	cmp.w	(a0)+,d6
	bne.s	Lffe35e
	subq.l	#2,a0
	bsr.s	Lffe372
	addq.l	#2,a0
	addq.w	#1,d1
	bra.s	Lffe360
Lffe372:
	bsr.w	Lffe27a
	movea.l	(-$0034,a6),a1
	lea.l	($0020,a1),a1
	cmpa.l	(-$0028,a6),a1
	bls.s	Lffe388
	movea.l	(-$002c,a6),a1
Lffe388:
	cmpa.l	(-$0030,a6),a1
	beq.s	Lffe3b6
	move.l	a1,(-$0034,a6)
	move.w	a3,(a1)+
	move.w	a5,(a1)+
	move.l	(-$0024,a6),(a1)+
	move.l	(-$0020,a6),(a1)+
	move.l	(-$001c,a6),(a1)+
	move.l	(-$0018,a6),(a1)+
	move.l	(-$0014,a6),(a1)+
	move.l	(-$0010,a6),(a1)+
	move.w	(-$001e,a6),d1
	movea.l	(-$001c,a6),a0
Lffe3b6:
	rts

Lffe3b8:
	link.w	a6,#-$004e
	move.l	($0968),(-$004e,a6)
	move.l	($096c),(-$004a,a6)
	move.w	d4,(-$0004,a6)
	move.w	d5,(-$0002,a6)
	move.w	d6,(-$0046,a6)
	clr.w	(-$0012,a6)
	clr.w	(-$0010,a6)
	clr.w	(-$0014,a6)
	moveq.l	#$ff,d0
	tst.w	d2
	bpl.s	Lffe3ec
	neg.w	d2
	move.w	d0,(-$0012,a6)
Lffe3ec:
	tst.w	d3
	bpl.s	Lffe3f6
	neg.w	d3
	move.w	d0,(-$0010,a6)
Lffe3f6:
	cmp.w	d2,d3
	bcc.s	Lffe3fe
	move.w	d0,(-$0014,a6)
Lffe3fe:
	tst.w	d1
	bpl.s	Lffe406
	move.w	#$7fff,d1
Lffe406:
	move.w	d1,(-$0008,a6)
	move.w	d1,(-$000a,a6)
	clr.w	(-$0006,a6)
	bsr.s	Lffe41c
	bsr.w	Lffe510
	unlk	a6
Lffe41a:
	rts

Lffe41c:
	lea.l	(-$0024,a6),a0
	moveq.l	#$07,d1
	move.b	#$96,d0
Lffe426:
	clr.w	(a0)+
	lsl.b	#1,d0
	bcc.s	Lffe432
	move.b	#$01,(-$0001,a0)
Lffe432:
	dbra.w	d1,Lffe426
	move.w	d3,d0
	bsr.s	Lffe46e
	move.w	d1,(-$000c,a6)
	move.b	#$20,(a0)
	move.w	d2,d0
	bsr.s	Lffe46e
	move.w	d1,(-$000e,a6)
	bset.b	#$06,(a0)
	btst.b	#$05,(a0)
	beq.s	Lffe45a
	tst.w	(-$0014,a6)
	beq.s	Lffe41a
Lffe45a:
	addq.w	#1,d6
	and.w	#$0007,d6
	bsr.s	Lffe4a6
	btst.b	#$05,(a0)
	bne.s	Lffe41a
	bset.b	#$07,(a0)
	bra.s	Lffe45a
Lffe46e:
	move.w	#$002d,d6
	moveq.l	#$00,d1
	cmpi.w	#$0168,d0
	bls.s	Lffe47e
	move.w	#$0168,d0
Lffe47e:
	sub.w	d6,d0
	bls.s	Lffe486
	addq.w	#1,d1
	bra.s	Lffe47e
Lffe486:
	add.w	d6,d0
	move.w	d1,-(a7)
	lsr.w	#1,d1
	bcc.s	Lffe492
	sub.w	d6,d0
	neg.w	d0
Lffe492:
	moveq.l	#$ff,d1
	cmp.w	d6,d0
	beq.s	Lffe4a4
	moveq.l	#$00,d1
	move.b	(Lffe4b2,pc,d0.w),d1
	mulu.w	(-$0008,a6),d1
	lsr.l	#8,d1
Lffe4a4:
	move.w	(a7)+,d6
Lffe4a6:
	moveq.l	#$00,d0
	move.b	(Lffe4e0,pc,d6.w),d0
	lea.l	(-$24,a6,d0.w),a0
	rts

Lffe4b2:
	.dc.b	$00,$04,$09,$0d,$12,$16,$1b,$1f
	.dc.b	$24,$28,$2c,$31,$35,$3a,$3e,$42
	.dc.b	$47,$4b,$4f,$53,$58,$5c,$60,$64
	.dc.b	$68,$6c,$70,$74,$78,$7c,$80,$84
	.dc.b	$88,$8b,$8f,$93,$96,$9a,$9e,$a1
	.dc.b	$a5,$a8,$ab,$af,$b2,$b5
Lffe4e0:
	.dc.b	$0e,$0a,$02,$06,$04,$00,$08,$0c
Lffe4e8:
	bsr.s	Lffe536
	addq.w	#1,(-$0006,a6)
	move.w	(-$0006,a6),d0
	add.w	d0,d0
	move.w	(-$000a,a6),d1
	sub.w	d0,d1
	addq.w	#1,d1
	bpl.s	Lffe50c
	subq.w	#1,(-$0008,a6)
	move.w	(-$0008,a6),d0
	add.w	d0,d0
	add.w	d0,d1
	addq.w	#1,d1
Lffe50c:
	move.w	d1,(-$000a,a6)
Lffe510:
	move.w	(-$0008,a6),d0
	sub.w	(-$0006,a6),d0
	beq.s	Lffe51e
	subq.w	#1,d0
	bne.s	Lffe4e8
Lffe51e:
	move.w	(-$0006,a6),d0
	cmp.w	(-$000e,a6),d0
	bcc.s	Lffe52c
	move.w	d0,(-$000e,a6)
Lffe52c:
	cmp.w	(-$000c,a6),d0
	bcc.s	Lffe536
	move.w	d0,(-$000c,a6)
Lffe536:
	bsr.w	Lffe610
	lea.l	(-$0044,a6),a4
	moveq.l	#$07,d6
Lffe540:
	movem.l	d6/a4,-(a7)
	move.b	($0020,a4),d2
	beq.w	Lffe5d6
	bmi.s	Lffe59a
	move.w	(-$0006,a6),d1
	lsl.b	#2,d2
	bcc.s	Lffe584
	move.w	(-$000e,a6),d0
	cmp.w	d1,d0
	beq.w	Lffe5e2
	btst.b	#$00,($0021,a4)
	bne.s	Lffe56c
	bcs.s	Lffe57a
	bra.s	Lffe56e
Lffe56c:
	bcc.s	Lffe57a
Lffe56e:
	tst.b	d2
	bpl.s	Lffe5d6
	tst.w	(-$0014,a6)
	beq.s	Lffe5d6
	bra.s	Lffe584
Lffe57a:
	tst.b	d2
	bpl.s	Lffe59a
	tst.w	(-$0014,a6)
	bne.s	Lffe59a
Lffe584:
	move.w	(-$000c,a6),d0
	cmp.w	d1,d0
	beq.s	Lffe5e8
	btst.b	#$00,($0021,a4)
	beq.s	Lffe598
	bcs.s	Lffe59a
	bra.s	Lffe5d6
Lffe598:
	bcs.s	Lffe5d6
Lffe59a:
	move.w	(a4),d4
	move.w	($0010,a4),d5
	cmp.w	(-$004e,a6),d4
	blt.s	Lffe5d6
	cmp.w	(-$004a,a6),d4
	bgt.s	Lffe5d6
	cmp.w	(-$004c,a6),d5
	blt.s	Lffe5d6
	cmp.w	(-$0048,a6),d5
	bgt.s	Lffe5d6
	moveq.l	#$00,d0
	move.w	d5,d0
	swap.w	d0
	lsr.l	#6,d0
	btst.b	#$02,($0962)
	bne.s	Lffe5ca
	add.l	d0,d0
Lffe5ca:
	movea.l	($095c),a0
	adda.l	d0,a0
	adda.w	d4,a0
	adda.w	d4,a0
	move.w	d7,(a0)
Lffe5d6:
	movem.l	(a7)+,d6/a4
	addq.l	#2,a4
	dbra.w	d6,Lffe540
	rts

Lffe5e2:
	tst.w	(-$0012,a6)
	bra.s	Lffe5ec
Lffe5e8:
	tst.w	(-$0010,a6)
Lffe5ec:
	beq.s	Lffe59a
	move.w	(a4),d0
	move.w	($0010,a4),d1
	move.w	(-$0004,a6),d2
	move.w	(-$0002,a6),d3
	moveq.l	#$ff,d6
	lea.l	($0d1a),a0
	move.w	(a0),-(a7)
	clr.w	(a0)
	bsr.w	Lffe816
	move.w	(a7)+,($0d1a)
	bra.s	Lffe5d6
Lffe610:
	lea.l	(-$0044,a6),a4
	lea.l	(-$0034,a6),a5
	move.w	(-$0008,a6),d0
	bsr.s	Lffe622
	move.w	(-$0006,a6),d0
Lffe622:
	bsr.s	Lffe658
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
	bsr.s	Lffe650
	move.w	(-$0002,a6),d0
	sub.w	d4,d0
Lffe650:
	move.w	d0,($0008,a5)
	move.w	d0,(a5)+
	rts

Lffe658:
	move.w	d0,d4
	move.w	d0,d5
	move.w	(-$0046,a6),d0
	cmp.w	#$0100,d0
	beq.s	Lffe690
	bcc.s	Lffe66e
	mulu.w	d0,d4
	lsr.l	#8,d4
	rts

Lffe66e:
	moveq.l	#$00,d1
	move.w	d0,d1
	moveq.l	#$00,d0
	move.w	d5,d0
	lsl.l	#8,d0
	moveq.l	#$00,d2
	moveq.l	#$1f,d3
Lffe67c:
	add.l	d0,d0
	roxl.l	#1,d2
	cmp.l	d1,d2
	bcs.s	Lffe68a
	bset.l	#$00,d0
	sub.l	d1,d2
Lffe68a:
	dbra.w	d3,Lffe67c
	move.w	d0,d5
Lffe690:
	rts

Lffe692:
	link.w	a6,#-$0008
	move.l	($0954),(-$0008,a6)
	move.l	($0958),(-$0004,a6)
	subi.l	#$00010001,(-$0004,a6)
	bra.s	Lffe6bc
Lffe6ac:
	link.w	a6,#-$0008
	move.l	($0968),(-$0008,a6)
	move.l	($096c),(-$0004,a6)
Lffe6bc:
	movem.l	d4-d7/a0-a3,-(a7)
	moveq.l	#$00,d6
	exg.l	d0,d2
	exg.l	d1,d3
	bsr.w	Lffe78c
	exg.l	d0,d2
	exg.l	d1,d3
	move.w	d4,d5
Lffe6d0:
	bsr.w	Lffe78c
	move.w	d4,d7
	or.w	d5,d7
	bne.s	Lffe6ea
	tst.w	d6
	beq.s	Lffe6e2
	exg.l	d0,d2
	exg.l	d1,d3
Lffe6e2:
	movem.l	(a7)+,d4-d7/a0-a3
	unlk	a6
	rts

Lffe6ea:
	move.w	d4,d7
	and.w	d5,d7
	bne.s	Lffe700
	tst.w	d4
	bne.s	Lffe6fc
	exg.l	d0,d2
	exg.l	d1,d3
	exg.l	d4,d5
	not.w	d6
Lffe6fc:
	bsr.s	Lffe706
	bra.s	Lffe6d0
Lffe700:
	ori.b	#$01,ccr
	bra.s	Lffe6e2
Lffe706:
	move.w	d4,ccr
	bcs.s	Lffe726
	bvs.s	Lffe72c
	beq.s	Lffe714
	move.w	(-$0002,a6),d7
	bra.s	Lffe718
Lffe714:
	move.w	(-$0006,a6),d7
Lffe718:
	movea.w	d1,a0
	movea.w	d0,a1
	movea.w	d3,a2
	movea.w	d2,a3
	bsr.s	Lffe738
	exg.l	d0,d1
	rts

Lffe726:
	move.w	(-$0008,a6),d7
	bra.s	Lffe730
Lffe72c:
	move.w	(-$0004,a6),d7
Lffe730:
	movea.w	d0,a0
	movea.w	d1,a1
	movea.w	d2,a2
	movea.w	d3,a3
Lffe738:
	adda.w	#$8000,a0
	adda.w	#$8000,a1
	adda.w	#$8000,a2
	adda.w	#$8000,a3
	add.w	#$8000,d7
	cmpa.w	a0,a2
	bcc.s	Lffe754
	exg.l	a0,a2
	exg.l	a1,a3
Lffe754:
	cmp.w	a0,d7
	beq.s	Lffe77e
	cmp.w	a2,d7
	beq.s	Lffe77a
Lffe75c:
	move.w	a1,d1
	add.w	a3,d1
	roxr.w	#1,d1
	move.w	a0,d0
	add.w	a2,d0
	roxr.w	#1,d0
	cmp.w	d7,d0
	beq.s	Lffe782
	bcs.s	Lffe774
	movea.w	d0,a2
	movea.w	d1,a3
	bra.s	Lffe75c
Lffe774:
	movea.w	d0,a0
	movea.w	d1,a1
	bra.s	Lffe75c
Lffe77a:
	exg.l	a0,a2
	exg.l	a1,a3
Lffe77e:
	move.w	a0,d0
	move.w	a1,d1
Lffe782:
	sub.w	#$8000,d0
	sub.w	#$8000,d1
	rts

Lffe78c:
	clr.w	d4
	cmp.w	(-$0008,a6),d0
	bge.s	Lffe796
	addq.w	#1,d4
Lffe796:
	cmp.w	(-$0004,a6),d0
	ble.s	Lffe79e
	addq.w	#2,d4
Lffe79e:
	cmp.w	(-$0006,a6),d1
	bge.s	Lffe7a6
	addq.w	#4,d4
Lffe7a6:
	cmp.w	(-$0002,a6),d1
	ble.s	Lffe7ae
	addq.w	#8,d4
Lffe7ae:
	rts

Lffe7b0:
	cmp.w	d1,d3
	beq.s	Lffe800
	cmp.w	d0,d2
	beq.s	Lffe80a
	movem.w	d0-d3,-(a7)
	move.w	($0000.w,a7),d4
	move.w	($0002,a7),d5
	move.w	($0004,a7),d1
	bsr.w	Lffe8ba
	move.w	($0004,a7),d4
	move.w	($0002,a7),d5
	move.w	($0006,a7),d1
	bsr.w	Lffe994
	move.w	($0004,a7),d4
	move.w	($0006,a7),d5
	move.w	($0000.w,a7),d1
	bsr.w	Lffe8ba
	move.w	($0000.w,a7),d4
	move.w	($0006,a7),d5
	move.w	($0002,a7),d1
	bsr.w	Lffe994
	addq.l	#8,a7
	rts

Lffe800:
	move.w	d0,d4
	move.w	d1,d5
	move.w	d2,d1
	bra.w	Lffe8c4
Lffe80a:
	move.w	d0,d4
	move.w	d1,d5
	move.w	d3,d1
	bra.w	Lffe99e
Lffe814:
	rts

Lffe816:
	bsr.w	Lffe6ac
	bcs.s	Lffe814
	cmp.w	d1,d3
	beq.s	Lffe800
	cmp.w	d0,d2
	beq.s	Lffe80a
	move.l	d0,d4
	move.l	d1,d5
	moveq.l	#$00,d1
	moveq.l	#$02,d0
	sub.w	d4,d2
	bcc.s	Lffe836
	st.b	d1
	neg.w	d2
	moveq.l	#$fe,d0
Lffe836:
	movea.l	d0,a1
	move.w	($0962),d0
	sub.w	d5,d3
	bcc.s	Lffe848
	bset.l	#$10,d1
	neg.w	d3
	neg.w	d0
Lffe848:
	movea.w	d0,a2
	cmp.w	d3,d2
	bcc.s	Lffe854
	swap.w	d1
	exg.l	d2,d3
	exg.l	a1,a2
Lffe854:
	move.w	d1,d0
	move.w	d2,d1
	lsr.w	#1,d1
	bcs.s	Lffe862
	tst.b	d0
	beq.s	Lffe862
	subq.w	#1,d1
Lffe862:
	moveq.l	#$00,d0
	move.w	d5,d0
	swap.w	d0
	lsr.l	#6,d0
	btst.b	#$02,($0962)
	bne.s	Lffe874
	add.l	d0,d0
Lffe874:
	movea.l	($095c),a0
	adda.l	d0,a0
	adda.w	d4,a0
	adda.w	d4,a0
	move.w	($0d1a),d0
	bne.s	Lffe8a0
	move.w	d2,d0
Lffe886:
	rol.w	#1,d6
	bcc.s	Lffe88c
	move.w	d7,(a0)
Lffe88c:
	subq.w	#1,d0
	bmi.s	Lffe89e
	adda.w	a1,a0
	add.w	d3,d1
	cmp.w	d2,d1
	bcs.s	Lffe886
	sub.w	d2,d1
	adda.w	a2,a0
	bra.s	Lffe886
Lffe89e:
	rts

Lffe8a0:
	move.w	d2,d0
Lffe8a2:
	rol.w	#1,d6
	bcc.s	Lffe8a8
	not.w	(a0)
Lffe8a8:
	subq.w	#1,d0
	bmi.s	Lffe89e
	adda.w	a1,a0
	add.w	d3,d1
	cmp.w	d2,d1
	bcs.s	Lffe8a2
	sub.w	d2,d1
	adda.w	a2,a0
	bra.s	Lffe8a2
Lffe8ba:
	cmp.w	d4,d1
	bgt.s	Lffe8c2
	addq.w	#1,d1
	bra.s	Lffe8c4
Lffe8c2:
	subq.w	#1,d1
Lffe8c4:
	bsr.w	Lffea36
	bcs.s	Lffe906
	cmp.w	#$ffff,d6
	beq.w	Lffe956
	moveq.l	#$00,d0
	move.w	d5,d0
	swap.w	d0
	lsr.l	#6,d0
	btst.b	#$02,($0962)
	bne.s	Lffe8e4
	add.l	d0,d0
Lffe8e4:
	movea.l	($095c),a0
	adda.l	d0,a0
	adda.w	d4,a0
	adda.w	d4,a0
	sub.w	d4,d1
	bcc.s	Lffe928
	move.w	($0d1a),d0
	bne.s	Lffe910
	addq.l	#2,a0
	neg.w	d1
Lffe8fc:
	rol.w	#1,d6
	bcc.s	Lffe908
	move.w	d7,-(a0)
	dbra.w	d1,Lffe8fc
Lffe906:
	rts

Lffe908:
	subq.l	#2,a0
	dbra.w	d1,Lffe8fc
	rts

Lffe910:
	addq.l	#2,a0
	neg.w	d1
Lffe914:
	rol.w	#1,d6
	bcc.s	Lffe920
	not.w	-(a0)
	dbra.w	d1,Lffe914
	rts

Lffe920:
	subq.l	#2,a0
	dbra.w	d1,Lffe914
	rts

Lffe928:
	move.w	($0d1a),d0
	bne.s	Lffe942
	rol.w	#1,d6
	bcc.s	Lffe93a
	move.w	d7,(a0)+
	dbra.w	d1,Lffe928
	rts

Lffe93a:
	addq.l	#2,a0
	dbra.w	d1,Lffe928
	rts

Lffe942:
	rol.w	#1,d6
	bcc.s	Lffe94e
	not.w	(a0)+
	dbra.w	d1,Lffe942
	rts

Lffe94e:
	addq.l	#2,a0
	dbra.w	d1,Lffe942
	rts

Lffe956:
	cmp.w	d4,d1
	bcc.s	Lffe95c
	exg.l	d1,d4
Lffe95c:
	sub.w	d4,d1
	moveq.l	#$00,d0
	move.w	d5,d0
	swap.w	d0
	lsr.l	#6,d0
	btst.b	#$02,($0962)
	bne.s	Lffe970
	add.l	d0,d0
Lffe970:
	movea.l	($095c),a1
	adda.l	d0,a1
	adda.w	d4,a1
	adda.w	d4,a1
	addq.w	#1,d1
	swap.w	d1
	clr.w	d1
	swap.w	d1
	move.w	d7,d0
	swap.w	d7
	move.w	d0,d7
	move.w	($0d1a),d0
	beq.w	Lffeb56
	bra.w	Lffebba
Lffe994:
	cmp.w	d5,d1
	bgt.s	Lffe99c
	addq.w	#1,d1
	bra.s	Lffe99e
Lffe99c:
	subq.w	#1,d1
Lffe99e:
	bsr.w	Lffea74
	bcs.s	Lffe9e6
	cmp.w	#$ffff,d6
	beq.s	Lffe9f6
	moveq.l	#$00,d0
	move.w	d5,d0
	swap.w	d0
	lsr.l	#6,d0
	btst.b	#$02,($0962)
	bne.s	Lffe9bc
	add.l	d0,d0
Lffe9bc:
	movea.l	($095c),a0
	adda.l	d0,a0
	adda.w	d4,a0
	adda.w	d4,a0
	moveq.l	#$00,d0
	move.w	($0962),d0
	sub.w	d5,d1
	bcc.s	Lffe9d4
	neg.w	d0
	neg.w	d1
Lffe9d4:
	move.w	($0d1a),d2
	bne.s	Lffe9e8
Lffe9da:
	rol.w	#1,d6
	bcc.s	Lffe9e0
	move.w	d7,(a0)
Lffe9e0:
	adda.w	d0,a0
	dbra.w	d1,Lffe9da
Lffe9e6:
	rts

Lffe9e8:
	rol.w	#1,d6
	bcc.s	Lffe9ee
	not.w	(a0)
Lffe9ee:
	adda.w	d0,a0
	dbra.w	d1,Lffe9e8
	rts

Lffe9f6:
	cmp.w	d5,d1
	bcc.s	Lffe9fc
	exg.l	d1,d5
Lffe9fc:
	sub.w	d5,d1
	moveq.l	#$00,d0
	move.w	d5,d0
	swap.w	d0
	lsr.l	#6,d0
	btst.b	#$02,($0962)
	bne.s	Lffea10
	add.l	d0,d0
Lffea10:
	movea.l	($095c),a1
	adda.l	d0,a1
	adda.w	d4,a1
	adda.w	d4,a1
	addq.w	#1,d1
	swap.w	d1
	clr.w	d1
	swap.w	d1
	btst.b	#$03,($0962)
	sne.b	d0
	move.w	($0d1a),d2
	beq.w	Lffec32
	bra.w	Lffec1e
Lffea36:
	move.l	($0968),d2
	move.l	($096c),d3
	cmp.w	d2,d5
	blt.s	Lffea6e
	cmp.w	d3,d5
	bgt.s	Lffea6e
	swap.w	d2
	swap.w	d3
	cmp.w	d4,d1
	bge.s	Lffea56
	exg.l	d4,d1
	bsr.s	Lffea56
	exg.l	d4,d1
	rts

Lffea56:
	cmp.w	d2,d1
	blt.s	Lffea6e
	cmp.w	d3,d4
	bgt.s	Lffea6e
	cmp.w	d2,d4
	bge.s	Lffea64
	move.w	d2,d4
Lffea64:
	cmp.w	d3,d1
	ble.s	Lffea6a
	move.w	d3,d1
Lffea6a:
	tst.w	d0
	rts

Lffea6e:
	ori.b	#$01,ccr
	rts

Lffea74:
	cmp.w	($0968),d4
	blt.s	Lffea6e
	cmp.w	($096c),d4
	bgt.s	Lffea6e
	move.w	($096a),d2
	move.w	($096e),d3
	cmp.w	d5,d1
	bge.s	Lffea94
	exg.l	d5,d1
	bsr.s	Lffea94
	exg.l	d5,d1
	rts

Lffea94:
	cmp.w	d2,d1
	blt.s	Lffea6e
	cmp.w	d3,d5
	bgt.s	Lffea6e
	cmp.w	d2,d5
	bge.s	Lffeaa2
	move.w	d2,d5
Lffeaa2:
	cmp.w	d3,d1
	ble.s	Lffeaa8
	move.w	d3,d1
Lffeaa8:
	tst.w	d0
	rts

Lffeaac:
	rts

Lffeaae:
	cmp.w	d0,d2
	bge.s	Lffeab4
	exg.l	d0,d2
Lffeab4:
	cmp.w	d1,d3
	bge.s	Lffeaba
	exg.l	d1,d3
Lffeaba:
	move.l	($0968),d4
	move.l	($096c),d5
	cmp.w	d4,d3
	blt.s	Lffeaac
	cmp.w	d5,d1
	bgt.s	Lffeaac
	swap.w	d4
	swap.w	d5
	cmp.w	d4,d2
	blt.s	Lffeaac
	cmp.w	d5,d0
	bgt.s	Lffeaac
	cmp.w	d4,d0
	bge.s	Lffeadc
	move.w	d4,d0
Lffeadc:
	cmp.w	d5,d2
	ble.s	Lffeae2
	move.w	d5,d2
Lffeae2:
	swap.w	d4
	swap.w	d5
	cmp.w	d4,d1
	bge.s	Lffeaec
	move.w	d4,d1
Lffeaec:
	cmp.w	d5,d3
	ble.s	Lffeaf2
	move.w	d5,d3
Lffeaf2:
	move.w	d7,d6
	swap.w	d7
	move.w	d6,d7
	move.w	($0d1a),d4
	beq.s	Lffeb14
	lea.l	(Lffebba,pc),a3
	bra.s	Lffeb18
Lffeb04:
	movem.l	($0968),d0/d2
	move.w	d0,d1
	move.w	d2,d3
	swap.w	d0
	swap.w	d2
	moveq.l	#$00,d7
Lffeb14:
	lea.l	(Lffeb56,pc),a3
Lffeb18:
	sub.w	d0,d2
	addq.w	#1,d2
	sub.w	d1,d3
	move.w	d0,d4
	moveq.l	#$00,d0
	move.w	d1,d0
	swap.w	d0
	lsr.l	#6,d0
	btst.b	#$02,($0962)
	bne.s	Lffeb32
	add.l	d0,d0
Lffeb32:
	movea.l	($095c),a2
	adda.l	d0,a2
	adda.w	d4,a2
	adda.w	d4,a2
	moveq.l	#$00,d4
	move.w	($0962),d4
	swap.w	d2
	clr.w	d2
	swap.w	d2
Lffeb48:
	movea.l	a2,a1
	move.l	d2,d1
	jsr	(a3)
	adda.l	d4,a2
	dbra.w	d3,Lffeb48
	rts

Lffeb56:
	ror.l	#6,d1
	subq.w	#1,d1
	bmi.s	Lffeb66
	lea.l	(Lffeb62,pc),a0
Lffeb60:
	bra.s	Lffeb78
Lffeb62:
	dbra.w	d1,Lffeb60
Lffeb66:
	clr.w	d1
	rol.l	#5,d1
	bpl.s	Lffeb6e
	move.w	d7,(a1)+
Lffeb6e:
	add.w	d1,d1
	neg.w	d1
	movea.l	(a7)+,a0
	jmp	(Lffebb8,pc,d1.w)

Lffeb78:
	move.l	d7,(a1)+
	move.l	d7,(a1)+
	move.l	d7,(a1)+
	move.l	d7,(a1)+
	move.l	d7,(a1)+
	move.l	d7,(a1)+
	move.l	d7,(a1)+
	move.l	d7,(a1)+
	move.l	d7,(a1)+
	move.l	d7,(a1)+
	move.l	d7,(a1)+
	move.l	d7,(a1)+
	move.l	d7,(a1)+
	move.l	d7,(a1)+
	move.l	d7,(a1)+
	move.l	d7,(a1)+
	move.l	d7,(a1)+
	move.l	d7,(a1)+
	move.l	d7,(a1)+
	move.l	d7,(a1)+
	move.l	d7,(a1)+
	move.l	d7,(a1)+
	move.l	d7,(a1)+
	move.l	d7,(a1)+
	move.l	d7,(a1)+
	move.l	d7,(a1)+
	move.l	d7,(a1)+
	move.l	d7,(a1)+
	move.l	d7,(a1)+
	move.l	d7,(a1)+
	move.l	d7,(a1)+
	move.l	d7,(a1)+
Lffebb8:
	jmp	(a0)

Lffebba:
	ror.l	#6,d1
	subq.w	#1,d1
	bmi.s	Lffebca
	lea.l	(Lffebc6,pc),a0
Lffebc4:
	bra.s	Lffebdc
Lffebc6:
	dbra.w	d1,Lffebc4
Lffebca:
	clr.w	d1
	rol.l	#5,d1
	bpl.s	Lffebd2
	not.w	(a1)+
Lffebd2:
	add.w	d1,d1
	neg.w	d1
	movea.l	(a7)+,a0
	jmp	(Lffec1c,pc,d1.w)

Lffebdc:
	not.l	(a1)+
	not.l	(a1)+
	not.l	(a1)+
	not.l	(a1)+
	not.l	(a1)+
	not.l	(a1)+
	not.l	(a1)+
	not.l	(a1)+
	not.l	(a1)+
	not.l	(a1)+
	not.l	(a1)+
	not.l	(a1)+
	not.l	(a1)+
	not.l	(a1)+
	not.l	(a1)+
	not.l	(a1)+
	not.l	(a1)+
	not.l	(a1)+
	not.l	(a1)+
	not.l	(a1)+
	not.l	(a1)+
	not.l	(a1)+
	not.l	(a1)+
	not.l	(a1)+
	not.l	(a1)+
	not.l	(a1)+
	not.l	(a1)+
	not.l	(a1)+
	not.l	(a1)+
	not.l	(a1)+
	not.l	(a1)+
	not.l	(a1)+
Lffec1c:
	jmp	(a0)

Lffec1e:
	lea.l	($4000),a3
	lea.l	(Lffecea,pc),a2
	tst.b	d0
	beq.s	Lffec44
	adda.l	a3,a3
	lea.l	(Lffed2c,pc),a2
	bra.s	Lffec44
Lffec32:
	lea.l	($4000),a3
	lea.l	(Lffec66,pc),a2
	tst.b	d0
	beq.s	Lffec44
	adda.l	a3,a3
	lea.l	(Lffeca8,pc),a2
Lffec44:
	ror.l	#4,d1
	subq.w	#1,d1
	bmi.s	Lffec56
	lea.l	(Lffec50,pc),a0
Lffec4e:
	jmp	(a2)

Lffec50:
	adda.l	a3,a1
	dbra.w	d1,Lffec4e
Lffec56:
	clr.w	d1
	rol.l	#4,d1
	add.w	d1,d1
	add.w	d1,d1
	neg.w	d1
	movea.l	(a7)+,a0
	jmp	($40,a2,d1.w)

Lffec66:
	move.w	d7,($3c00,a1)
	move.w	d7,($3800,a1)
	move.w	d7,($3400,a1)
	move.w	d7,($3000,a1)
	move.w	d7,($2c00,a1)
	move.w	d7,($2800,a1)
	move.w	d7,($2400,a1)
	move.w	d7,($2000,a1)
	move.w	d7,($1c00,a1)
	move.w	d7,($1800,a1)
	move.w	d7,($1400,a1)
	move.w	d7,($1000,a1)
	move.w	d7,($0c00,a1)
	move.w	d7,($0800,a1)
	move.w	d7,($0400,a1)
	move.w	d7,(a1)
	nop
	jmp	(a0)

Lffeca8:
	move.w	d7,($7800,a1)
	move.w	d7,($7000,a1)
	move.w	d7,($6800,a1)
	move.w	d7,($6000,a1)
	move.w	d7,($5800,a1)
	move.w	d7,($5000,a1)
	move.w	d7,($4800,a1)
	move.w	d7,($4000,a1)
	move.w	d7,($3800,a1)
	move.w	d7,($3000,a1)
	move.w	d7,($2800,a1)
	move.w	d7,($2000,a1)
	move.w	d7,($1800,a1)
	move.w	d7,($1000,a1)
	move.w	d7,($0800,a1)
	move.w	d7,(a1)
	nop
	jmp	(a0)

Lffecea:
	not.w	($3c00,a1)
	not.w	($3800,a1)
	not.w	($3400,a1)
	not.w	($3000,a1)
	not.w	($2c00,a1)
	not.w	($2800,a1)
	not.w	($2400,a1)
	not.w	($2000,a1)
	not.w	($1c00,a1)
	not.w	($1800,a1)
	not.w	($1400,a1)
	not.w	($1000,a1)
	not.w	($0c00,a1)
	not.w	($0800,a1)
	not.w	($0400,a1)
	not.w	(a1)
	nop
	jmp	(a0)

Lffed2c:
	not.w	($7800,a1)
	not.w	($7000,a1)
	not.w	($6800,a1)
	not.w	($6000,a1)
	not.w	($5800,a1)
	not.w	($5000,a1)
	not.w	($4800,a1)
	not.w	($4000,a1)
	not.w	($3800,a1)
	not.w	($3000,a1)
	not.w	($2800,a1)
	not.w	($2000,a1)
	not.w	($1800,a1)
	not.w	($1000,a1)
	not.w	($0800,a1)
	not.w	(a1)
	nop
	jmp	(a0)

Lffed6e:
	.dcb.b	4753,$ff
Lffffff:
	.dc.b	$ff
L000000:

	.end	Start
