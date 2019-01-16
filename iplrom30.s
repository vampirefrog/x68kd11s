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
;  Code Generate date Wed Jan 16 03:17:05 2019
;  Commandline dis  -b2 -h -m68030 -m68882 -zfe0000,ff0038 -x -a1 -q -p --exclude-fefunc-mac -Tiplrom30.tab -giplrom30.lab --overwrite iplrom30.dat
;          DIS version 3.16
;=============================================

	.include	inc/doscall.mac
	.include	inc/iocscall.mac

	.cpu	68030

	.text

Lfe0000:									;fe0000
	addq.l	#2,d3					;$5483			;fe0000
	bra.s	Lfe0000-$000014				;$60e8			;fe0002
Lfe0004:									;fe0004
	jsr	(Lfe003a)				;$4eb9,$00fe,$003a	;fe0004
	bra.s	Lfe0000					;$60f4			;fe000a
Lfe000c:									;fe000c
	cmp.l	d4,d3					;$b684			;fe000c
	bhi.s	Lfe002c					;$621c			;fe000e
	movea.l	d3,a0					;$2043			;fe0010
	movea.l	d5,a1					;$2245			;fe0012
	move.w	d6,d0					;$3006			;fe0014
Lfe0016:									;fe0016
	cmpm.l	(a0)+,(a1)+				;$b388			;fe0016
	dbne.w	d0,Lfe0016				;$56c8,$fffc		;fe0018
	tst.w	d0					;$4a40			;fe001c
	bmi.s	Lfe0024					;$6b04			;fe001e
Lfe0020:									;fe0020
	addq.l	#4,d3					;$5883			;fe0020
	bra.s	Lfe000c					;$60e8			;fe0022
Lfe0024:									;fe0024
	jsr	(Lfe003a)				;$4eb9,$00fe,$003a	;fe0024
	bra.s	Lfe0020					;$60f4			;fe002a
Lfe002c:									;fe002c
	tst.w	($001e,a6)				;$4a6e,$001e		;fe002c
	beq.s	Lfe0038					;$6706			;fe0030
	jsr	($00fd8ece)				;$4eb9,$00fd,$8ece	;fe0032
Lfe0038:									;fe0038
	rts						;$4e75			;fe0038

Lfe003a:									;fe003a
	cmpi.w	#$0008,($001e,a6)			;$0c6e,$0008,$001e	;fe003a
	bcs.s	Lfe004c					;$650a			;fe0040
	jsr	($00fd8ece)				;$4eb9,$00fd,$8ece	;fe0042
	clr.w	($001e,a6)				;$426e,$001e		;fe0048
Lfe004c:									;fe004c
	addq.w	#1,($001e,a6)				;$526e,$001e		;fe004c
	move.l	d3,d1					;$2203			;fe0050
	jsr	($00fd8f4a)				;$4eb9,$00fd,$8f4a	;fe0052
	jsr	($00fd8ee0)				;$4eb9,$00fd,$8ee0	;fe0058
	jsr	($00fd8ee0)				;$4eb9,$00fd,$8ee0	;fe005e
	rts						;$4e75			;fe0064

Lfe0066:									;fe0066
	lea.l	(Lfe0078),a0				;$41f9,$00fe,$0078	;fe0066
	jsr	($00fd9014)				;$4eb9,$00fd,$9014	;fe006c
	jmp	($00fd3a9a)				;$4ef9,$00fd,$3a9a	;fe0072

Lfe0078:									;fe0078
	.dc.b	'size(a6) over',$0d,$0a,$00					;fe0078
Lfe0088:									;fe0088
	lea.l	($05a4,a6),a0				;$41ee,$05a4		;fe0088
	moveq.l	#$09,d2					;$7409			;fe008c
Lfe008e:									;fe008e
	cmpi.w	#$0001,(a0)				;$0c50,$0001		;fe008e
	bne.s	Lfe00cc					;$6638			;fe0092
	movea.l	($0002,a0),a1				;$2268,$0002		;fe0094
	move.l	($000a,a0),d0				;$2028,$000a		;fe0098
	cmpi.w	#$0001,($0006,a0)			;$0c68,$0001,$0006	;fe009c
	beq.s	Lfe00c0					;$671c			;fe00a2
	cmpi.w	#$0002,($0006,a0)			;$0c68,$0002,$0006	;fe00a4
	beq.s	Lfe00c6					;$671a			;fe00aa
	cmp.b	(a1),d0					;$b011			;fe00ac
	beq.s	Lfe00b8					;$6708			;fe00ae
Lfe00b0:									;fe00b0
	tst.w	($0008,a0)				;$4a68,$0008		;fe00b0
	beq.s	Lfe00da					;$6724			;fe00b4
	bra.s	Lfe00cc					;$6014			;fe00b6
Lfe00b8:									;fe00b8
	tst.w	($0008,a0)				;$4a68,$0008		;fe00b8
	beq.s	Lfe00cc					;$670e			;fe00bc
	bra.s	Lfe00da					;$601a			;fe00be
Lfe00c0:									;fe00c0
	cmp.w	(a1),d0					;$b051			;fe00c0
	beq.s	Lfe00b8					;$67f4			;fe00c2
	bra.s	Lfe00b0					;$60ea			;fe00c4
Lfe00c6:									;fe00c6
	cmp.l	(a1),d0					;$b091			;fe00c6
	beq.s	Lfe00b8					;$67ee			;fe00c8
	bra.s	Lfe00b0					;$60e4			;fe00ca
Lfe00cc:									;fe00cc
	lea.l	($000e,a0),a0				;$41e8,$000e		;fe00cc
	dbra.w	d2,Lfe008e				;$51ca,$ffbc		;fe00d0
	andi.b	#$7e,ccr				;$023c,$007e		;fe00d4
	rts						;$4e75			;fe00d8

Lfe00da:									;fe00da
	move.l	($0002,a0),d0				;$2028,$0002		;fe00da
	ori.b	#$01,ccr				;$003c,$0001		;fe00de
	rts						;$4e75			;fe00e2

Lfe00e4:									;fe00e4
	clr.w	($00002a74).l				;$4279,$0000,$2a74	;fe00e4
	move.w	#$0001,($01d2,a6)			;$3d7c,$0001,$01d2	;fe00ea
	move.b	(a5)+,d0				;$101d			;fe00f0
	jsr	(Lfe08ec)				;$4eb9,$00fe,$08ec	;fe00f2
	cmp.b	#$43,d0					;$b03c,$0043		;fe00f8
	beq.w	Lfe042e					;$6700,$0330		;fe00fc
	cmp.b	#$45,d0					;$b03c,$0045		;fe0100
	beq.w	Lfe043e					;$6700,$0338		;fe0104
	cmp.b	#$44,d0					;$b03c,$0044		;fe0108
	beq.w	Lfe0442					;$6700,$0334		;fe010c
	cmpi.b	#$53,d0					;$0c00,$0053		;fe0110
	bne.s	Lfe011c					;$6606			;fe0114
	clr.w	($01d2,a6)				;$426e,$01d2		;fe0116
	bra.s	Lfe0144					;$6028			;fe011a
Lfe011c:									;fe011c
	cmpi.b	#$57,d0					;$0c00,$0057		;fe011c
	beq.s	Lfe0144					;$6722			;fe0120
	cmpi.b	#$4c,d0					;$0c00,$004c		;fe0122
	bne.s	Lfe0130					;$6608			;fe0126
	move.w	#$0002,($01d2,a6)			;$3d7c,$0002,$01d2	;fe0128
	bra.s	Lfe0144					;$6014			;fe012e
Lfe0130:									;fe0130
	subq.l	#1,a5					;$538d			;fe0130
	move.l	a5,($1a5e,a6)				;$2d4d,$1a5e		;fe0132
	jsr	(Lfe07c6)				;$4eb9,$00fe,$07c6	;fe0136
	beq.w	Lfe02ec					;$6700,$01ae		;fe013c
	movea.l	($1a5e,a6),a5				;$2a6e,$1a5e		;fe0140
Lfe0144:									;fe0144
	moveq.l	#$ff,d1					;$72ff			;fe0144
	clr.l	d0					;$4280			;fe0146
	move.b	(a5),d0					;$1015			;fe0148
	tst.b	d0					;$4a00			;fe014a
	beq.s	Lfe0176					;$6728			;fe014c
	cmp.b	#$20,d0					;$b03c,$0020		;fe014e
	beq.s	Lfe0176					;$6722			;fe0152
	sub.b	#$30,d0					;$903c,$0030		;fe0154
	cmp.b	#$0a,d0					;$b03c,$000a		;fe0158
	bcc.w	Lfe054c					;$6400,$03ee		;fe015c
	addq.l	#1,a5					;$528d			;fe0160
	tst.b	(a5)					;$4a15			;fe0162
	beq.s	Lfe0174					;$670e			;fe0164
	cmpi.b	#$20,(a5)				;$0c15,$0020		;fe0166
	beq.s	Lfe0174					;$6708			;fe016a
	cmpi.b	#$2c,(a5)				;$0c15,$002c		;fe016c
	bne.w	Lfe054c					;$6600,$03da		;fe0170
Lfe0174:									;fe0174
	move.w	d0,d1					;$3200			;fe0174
Lfe0176:									;fe0176
	move.w	d1,-(a7)				;$3f01			;fe0176
	move.w	d1,($00002a74).l			;$33c1,$0000,$2a74	;fe0178
	tst.w	d1					;$4a41			;fe017e
	bmi.s	Lfe01c0					;$6b3e			;fe0180
	clr.l	d0					;$4280			;fe0182
	move.w	d1,d0					;$3001			;fe0184
	jsr	(Lfe019c)				;$4eb9,$00fe,$019c	;fe0186
	move.l	d0,($00002a76).l			;$23c0,$0000,$2a76	;fe018c
	tst.l	d0					;$4a80			;fe0192
	beq.s	Lfe01c0					;$672a			;fe0194
	move.l	d0,($0002,a6)				;$2d40,$0002		;fe0196
	bra.s	Lfe01c8					;$602c			;fe019a
Lfe019c:									;fe019c
	lea.l	($05a4,a6),a4				;$49ee,$05a4		;fe019c
	cmp.l	#$0000000a,d0				;$b0bc,$0000,$000a	;fe01a0
	bcc.s	Lfe01bc					;$6414			;fe01a6
	lsl.l	#1,d0					;$e388			;fe01a8
	move.l	d0,d1					;$2200			;fe01aa
	lsl.l	#3,d0					;$e788			;fe01ac
	sub.l	d1,d0					;$9081			;fe01ae
	adda.l	d0,a4					;$d9c0			;fe01b0
	tst.w	(a4)					;$4a54			;fe01b2
	bmi.s	Lfe01bc					;$6b06			;fe01b4
	move.l	($0002,a4),d0				;$202c,$0002		;fe01b6
	rts						;$4e75			;fe01ba

Lfe01bc:									;fe01bc
	clr.l	d0					;$4280			;fe01bc
	rts						;$4e75			;fe01be

Lfe01c0:									;fe01c0
	move.l	#$ffffffff,($0002,a6)			;$2d7c,$ffff,$ffff,$0002	;fe01c0
Lfe01c8:									;fe01c8
	jsr	($00fd40c4)				;$4eb9,$00fd,$40c4	;fe01c8
	cmpi.w	#$0003,($00002a7c).l			;$0c79,$0003,$0000,$2a7c	;fe01ce
	bcc.w	Lfe0000-$00023c				;$6400,$fbec		;fe01d6
	jsr	(Lfe0526)				;$4eb9,$00fe,$0526	;fe01da
	clr.l	d0					;$4280			;fe01e0
	move.w	(a7),d0					;$3017			;fe01e2
	bpl.s	Lfe01f0					;$6a0a			;fe01e4
	jsr	(Lfe0504)				;$4eb9,$00fe,$0504	;fe01e6
	bcs.w	Lfe0544					;$6500,$0356		;fe01ec
Lfe01f0:									;fe01f0
	lsl.l	#1,d0					;$e388			;fe01f0
	move.l	d0,d1					;$2200			;fe01f2
	lsl.l	#3,d0					;$e788			;fe01f4
	sub.l	d1,d0					;$9081			;fe01f6
	lea.l	($05a4,a6),a0				;$41ee,$05a4		;fe01f8
	adda.l	d0,a0					;$d1c0			;fe01fc
	move.l	a0,($00002a70).l			;$23c8,$0000,$2a70	;fe01fe
	movea.l	#$00002a62,a0				;$207c,$0000,$2a62	;fe0204
	subq.w	#1,($0000.w,a6)				;$536e,$0000		;fe020a
	beq.w	Lfe0000-$00023c				;$6700,$fbb4		;fe020e
	clr.w	($0008,a0)				;$4268,$0008		;fe0212
	move.w	($01d2,a6),d0				;$302e,$01d2		;fe0216
	move.w	d0,($0006,a0)				;$3140,$0006		;fe021a
	cmpi.l	#$ffffffff,($0006,a6)			;$0cae,$ffff,$ffff,$0006	;fe021e
	beq.w	Lfe0000-$00023c				;$6700,$fb9c		;fe0226
	tst.w	d0					;$4a40			;fe022a
	beq.s	Lfe0238					;$670a			;fe022c
	btst.b	#$00,($0009,a6)				;$082e,$0000,$0009	;fe022e
	bne.w	Lfe0000-$00023c				;$6600,$fb8e		;fe0234
Lfe0238:									;fe0238
	movea.l	($0006,a6),a1				;$226e,$0006		;fe0238
	move.l	a1,($0002,a0)				;$2149,$0002		;fe023c
	subq.w	#1,($0000.w,a6)				;$536e,$0000		;fe0240
	beq.w	Lfe02c8					;$6700,$0082		;fe0244
	move.w	($00002a7a).l,d0			;$3039,$0000,$2a7a	;fe0248
	and.w	#$0004,d0				;$c07c,$0004		;fe024e
	beq.s	Lfe0270					;$671c			;fe0252
	clr.l	($000a,a6)				;$42ae,$000a		;fe0254
	tst.l	($00002a76).l				;$4ab9,$0000,$2a76	;fe0258
	beq.s	Lfe0270					;$6710			;fe025e
	move.l	a1,-(a7)				;$2f09			;fe0260
	movea.l	($00002a70).l,a1			;$2279,$0000,$2a70	;fe0262
	move.w	($0008,a1),($000c,a6)			;$3d69,$0008,$000c	;fe0268
	movea.l	(a7)+,a1				;$225f			;fe026e
Lfe0270:									;fe0270
	move.l	($000a,a6),d0				;$202e,$000a		;fe0270
	andi.l	#$fffffffe,($000a,a6)			;$02ae,$ffff,$fffe,$000a	;fe0274
	bne.w	Lfe0000-$00023c				;$6600,$fb46		;fe027c
	move.w	d0,($0008,a0)				;$3140,$0008		;fe0280
	subq.w	#1,($0000.w,a6)				;$536e,$0000		;fe0284
	beq.s	Lfe02c8					;$673e			;fe0288
	move.l	#$0000ffff,d0				;$203c,$0000,$ffff	;fe028a
	tst.w	($0006,a0)				;$4a68,$0006		;fe0290
	bne.s	Lfe029c					;$6606			;fe0294
	move.l	#$000000ff,d0				;$203c,$0000,$00ff	;fe0296
Lfe029c:									;fe029c
	cmpi.w	#$0002,($0006,a0)			;$0c68,$0002,$0006	;fe029c
	beq.s	Lfe02ac					;$6708			;fe02a2
	cmp.l	($000e,a6),d0				;$b0ae,$000e		;fe02a4
	bcs.w	Lfe0000-$00023c				;$6500,$fb1a		;fe02a8
Lfe02ac:									;fe02ac
	move.l	($000e,a6),($000a,a0)			;$216e,$000e,$000a	;fe02ac
Lfe02b2:									;fe02b2
	addq.l	#2,a7					;$548f			;fe02b2
	move.w	#$0001,(a0)				;$30bc,$0001		;fe02b4
	moveq.l	#$06,d0					;$7006			;fe02b8
	movea.l	($00002a70).l,a1			;$2279,$0000,$2a70	;fe02ba
Lfe02c0:									;fe02c0
	move.w	(a0)+,(a1)+				;$32d8			;fe02c0
	dbra.w	d0,Lfe02c0				;$51c8,$fffc		;fe02c2
	rts						;$4e75			;fe02c6

Lfe02c8:									;fe02c8
	tst.w	($0006,a0)				;$4a68,$0006		;fe02c8
	beq.s	Lfe02dc					;$670e			;fe02cc
	cmpi.w	#$0001,($0006,a0)			;$0c68,$0001,$0006	;fe02ce
	beq.s	Lfe02e4					;$670e			;fe02d4
	move.l	(a1),($000a,a0)				;$2151,$000a		;fe02d6
	bra.s	Lfe02b2					;$60d6			;fe02da
Lfe02dc:									;fe02dc
	move.b	(a1),d0					;$1011			;fe02dc
	move.l	d0,($000a,a0)				;$2140,$000a		;fe02de
	bra.s	Lfe02b2					;$60ce			;fe02e2
Lfe02e4:									;fe02e4
	move.w	(a1),d0					;$3011			;fe02e4
	move.l	d0,($000a,a0)				;$2140,$000a		;fe02e6
	bra.s	Lfe02b2					;$60c6			;fe02ea
Lfe02ec:									;fe02ec
	clr.w	(Lfe042c)				;$4279,$00fe,$042c	;fe02ec
	move.w	#$0000,($001e,a6)			;$3d7c,$0000,$001e	;fe02f2
	lea.l	($05a4,a6),a4				;$49ee,$05a4		;fe02f8
Lfe02fc:									;fe02fc
	tst.w	(a4)					;$4a54			;fe02fc
	bmi.w	Lfe0404					;$6b00,$0104		;fe02fe
	addq.w	#1,(Lfe042c)				;$5279,$00fe,$042c	;fe0302
	move.w	#$0030,d0				;$303c,$0030		;fe0308
	add.w	($001e,a6),d0				;$d06e,$001e		;fe030c
	cmp.w	#$003a,d0				;$b07c,$003a		;fe0310
	bcs.s	Lfe0318					;$6502			;fe0314
	addq.w	#7,d0					;$5e40			;fe0316
Lfe0318:									;fe0318
	jsr	($00fd9004)				;$4eb9,$00fd,$9004	;fe0318
	jsr	($00fd8ee0)				;$4eb9,$00fd,$8ee0	;fe031e
	tst.w	(a4)					;$4a54			;fe0324
	beq.s	Lfe032e					;$6706			;fe0326
	move.b	#$65,d0					;$103c,$0065		;fe0328
	bra.s	Lfe0332					;$6004			;fe032c
Lfe032e:									;fe032e
	move.b	#$64,d0					;$103c,$0064		;fe032e
Lfe0332:									;fe0332
	jsr	($00fd9004)				;$4eb9,$00fd,$9004	;fe0332
	jsr	($00fd8ee0)				;$4eb9,$00fd,$8ee0	;fe0338
	move.l	($0002,a4),d1				;$222c,$0002		;fe033e
	jsr	($00fd8f4a)				;$4eb9,$00fd,$8f4a	;fe0342
	move.b	#$28,d0					;$103c,$0028		;fe0348
	jsr	($00fd9004)				;$4eb9,$00fd,$9004	;fe034c
	move.b	#$73,d0					;$103c,$0073		;fe0352
	move.w	($0006,a4),d1				;$322c,$0006		;fe0356
	beq.s	Lfe0368					;$670c			;fe035a
	move.b	#$77,d0					;$103c,$0077		;fe035c
	subq.w	#1,d1					;$5341			;fe0360
	beq.s	Lfe0368					;$6704			;fe0362
	move.b	#$6c,d0					;$103c,$006c		;fe0364
Lfe0368:									;fe0368
	jsr	($00fd9004)				;$4eb9,$00fd,$9004	;fe0368
	jsr	($00fd8ee0)				;$4eb9,$00fd,$8ee0	;fe036e
	move.w	($0008,a4),d0				;$302c,$0008		;fe0374
	add.w	#$0030,d0				;$d07c,$0030		;fe0378
	jsr	($00fd9004)				;$4eb9,$00fd,$9004	;fe037c
	jsr	($00fd8ee0)				;$4eb9,$00fd,$8ee0	;fe0382
	move.l	($000a,a4),d1				;$222c,$000a		;fe0388
	jsr	($00fd8f4a)				;$4eb9,$00fd,$8f4a	;fe038c
	move.b	#$29,d0					;$103c,$0029		;fe0392
	jsr	($00fd9004)				;$4eb9,$00fd,$9004	;fe0396
	jsr	($00fd8eda)				;$4eb9,$00fd,$8eda	;fe039c
	move.b	#$3b,d0					;$103c,$003b		;fe03a2
	jsr	($00fd9004)				;$4eb9,$00fd,$9004	;fe03a6
	move.l	($0002,a4),d1				;$222c,$0002		;fe03ac
	jsr	($00fd8f4a)				;$4eb9,$00fd,$8f4a	;fe03b0
	move.l	($0002,a4),d0				;$202c,$0002		;fe03b6
	jsr	(Lfe0956)				;$4eb9,$00fe,$0956	;fe03ba
	tst.l	d0					;$4a80			;fe03c0
	bmi.s	Lfe03d6					;$6b12			;fe03c2
	movea.l	d0,a0					;$2040			;fe03c4
	move.b	#$2e,d0					;$103c,$002e		;fe03c6
	jsr	($00fd9004)				;$4eb9,$00fd,$9004	;fe03ca
	jsr	($00fd9014)				;$4eb9,$00fd,$9014	;fe03d0
Lfe03d6:									;fe03d6
	move.b	#$28,d0					;$103c,$0028		;fe03d6
	jsr	($00fd9004)				;$4eb9,$00fd,$9004	;fe03da
	movea.l	($0002,a4),a0				;$206c,$0002		;fe03e0
	move.w	($0006,a4),($0326,a6)			;$3d6c,$0006,$0326	;fe03e4
	addq.w	#1,($0326,a6)				;$526e,$0326		;fe03ea
	jsr	($00fd9602)				;$4eb9,$00fd,$9602	;fe03ee
	move.b	#$29,d0					;$103c,$0029		;fe03f4
	jsr	($00fd9004)				;$4eb9,$00fd,$9004	;fe03f8
	jsr	($00fd8ece)				;$4eb9,$00fd,$8ece	;fe03fe
Lfe0404:									;fe0404
	lea.l	($000e,a4),a4				;$49ec,$000e		;fe0404
	addq.w	#1,($001e,a6)				;$526e,$001e		;fe0408
	cmpi.w	#$000a,($001e,a6)			;$0c6e,$000a,$001e	;fe040c
	bne.w	Lfe02fc					;$6600,$fee8		;fe0412
	tst.w	(Lfe042c)				;$4a79,$00fe,$042c	;fe0416
	bne.s	Lfe042a					;$660c			;fe041c
	lea.l	(Lfe0598),a0				;$41f9,$00fe,$0598	;fe041e
	jsr	($00fd9014)				;$4eb9,$00fd,$9014	;fe0424
Lfe042a:									;fe042a
	rts						;$4e75			;fe042a

Lfe042c:									;fe042c
	.dc.w	$0000								;fe042c
Lfe042e:									;fe042e
	moveq.l	#$ff,d1					;$72ff			;fe042e
	jsr	(Lfe0444)				;$4eb9,$00fe,$0444	;fe0430
	rts						;$4e75			;fe0436

Lfe0438:									;fe0438
	moveq.l	#$ff,d1					;$72ff			;fe0438
	bra.w	Lfe04e4					;$6000,$00a8		;fe043a
Lfe043e:									;fe043e
	moveq.l	#$01,d1					;$7201			;fe043e
	bra.s	Lfe0444					;$6002			;fe0440
Lfe0442:									;fe0442
	moveq.l	#$00,d1					;$7200			;fe0442
Lfe0444:									;fe0444
	clr.w	($0000.w,a6)				;$426e,$0000		;fe0444
Lfe0448:									;fe0448
	jsr	(Lfe07c6)				;$4eb9,$00fe,$07c6	;fe0448
	tst.b	d0					;$4a00			;fe044e
	beq.s	Lfe04a4					;$6752			;fe0450
	cmp.b	#$3a,d0					;$b03c,$003a		;fe0452
	beq.s	Lfe04a4					;$674c			;fe0456
	cmp.b	#$2a,d0					;$b03c,$002a		;fe0458
	beq.w	Lfe04e2					;$6700,$0084		;fe045c
	cmp.b	#$2c,d0					;$b03c,$002c		;fe0460
	bne.s	Lfe0478					;$6612			;fe0464
	addq.l	#1,a5					;$528d			;fe0466
	tst.w	($0000.w,a6)				;$4a6e,$0000		;fe0468
	beq.w	Lfe04fc					;$6700,$008e		;fe046c
	move.w	#$0001,($07fe,a6)			;$3d7c,$0001,$07fe	;fe0470
	bra.s	Lfe0448					;$60d0			;fe0476
Lfe0478:									;fe0478
	clr.w	($07fe,a6)				;$426e,$07fe		;fe0478
	move.w	d1,-(a7)				;$3f01			;fe047c
	jsr	($00fdeaa4)				;$4eb9,$00fd,$eaa4	;fe047e
	bcs.w	Lfe054c					;$6500,$00c6		;fe0484
	move.w	(a7)+,d1				;$321f			;fe0488
	move.w	($0000.w,a6),d0				;$302e,$0000		;fe048a
	lsl.w	#2,d0					;$e548			;fe048e
	move.l	d6,($02,a6,d0.w)			;$2d86,$0002		;fe0490
	addq.w	#1,($0000.w,a6)				;$526e,$0000		;fe0494
	cmpi.w	#$0008,($0000.w,a6)			;$0c6e,$0008,$0000	;fe0498
	bcs.s	Lfe0448					;$65a8			;fe049e
	bra.w	Lfe04a4					;$6000,$0002		;fe04a0
Lfe04a4:									;fe04a4
	tst.w	($07fe,a6)				;$4a6e,$07fe		;fe04a4
	bne.s	Lfe04fc					;$6652			;fe04a8
	tst.w	($0000.w,a6)				;$4a6e,$0000		;fe04aa
	beq.w	Lfe053c					;$6700,$008c		;fe04ae
	lea.l	($05a4,a6),a4				;$49ee,$05a4		;fe04b2
	lea.l	($0002,a6),a3				;$47ee,$0002		;fe04b6
Lfe04ba:									;fe04ba
	move.l	(a3)+,d0				;$201b			;fe04ba
	cmp.l	#$0000000a,d0				;$b0bc,$0000,$000a	;fe04bc
	bcc.w	Lfe054c					;$6400,$0088		;fe04c2
	mulu.w	#$000e,d0				;$c0fc,$000e		;fe04c6
	tst.w	(a4,d0.w)				;$4a74,$0000		;fe04ca
	bmi.s	Lfe04d4					;$6b04			;fe04ce
	move.w	d1,(a4,d0.w)				;$3981,$0000		;fe04d0
Lfe04d4:									;fe04d4
	subq.w	#1,($0000.w,a6)				;$536e,$0000		;fe04d4
	bne.s	Lfe04ba					;$66e0			;fe04d8
	rts						;$4e75			;fe04da

Lfe04dc:									;fe04dc
	move.w	#$ffff,d1				;$323c,$ffff		;fe04dc
	bra.s	Lfe04e4					;$6002			;fe04e0
Lfe04e2:									;fe04e2
	addq.l	#1,a5					;$528d			;fe04e2
Lfe04e4:									;fe04e4
	move.w	#$0009,d0				;$303c,$0009		;fe04e4
	lea.l	($05a4,a6),a4				;$49ee,$05a4		;fe04e8
Lfe04ec:									;fe04ec
	tst.w	(a4)					;$4a54			;fe04ec
	bmi.s	Lfe04f2					;$6b02			;fe04ee
	move.w	d1,(a4)					;$3881			;fe04f0
Lfe04f2:									;fe04f2
	lea.l	($000e,a4),a4				;$49ec,$000e		;fe04f2
	dbra.w	d0,Lfe04ec				;$51c8,$fff4		;fe04f6
	rts						;$4e75			;fe04fa

Lfe04fc:									;fe04fc
	clr.w	($07fe,a6)				;$426e,$07fe		;fe04fc
	bra.w	Lfe0000-$00023c				;$6000,$f8c2		;fe0500
Lfe0504:									;fe0504
	clr.l	d0					;$4280			;fe0504
	lea.l	($05a4,a6),a4				;$49ee,$05a4		;fe0506
Lfe050a:									;fe050a
	tst.w	(a4)					;$4a54			;fe050a
	bmi.s	Lfe0520					;$6b12			;fe050c
	lea.l	($000e,a4),a4				;$49ec,$000e		;fe050e
	addq.l	#1,d0					;$5280			;fe0512
	cmp.w	#$000a,d0				;$b07c,$000a		;fe0514
	bne.s	Lfe050a					;$66f0			;fe0518
	ori.b	#$01,ccr				;$003c,$0001		;fe051a
	rts						;$4e75			;fe051e

Lfe0520:									;fe0520
	andi.b	#$7e,ccr				;$023c,$007e		;fe0520
	rts						;$4e75			;fe0524

Lfe0526:									;fe0526
	moveq.l	#$04,d1					;$7204			;fe0526
	lea.l	($0002,a6),a0				;$41ee,$0002		;fe0528
Lfe052c:									;fe052c
	move.l	(a0),d2					;$2410			;fe052c
	move.l	d0,(a0)+				;$20c0			;fe052e
	move.l	d2,d0					;$2002			;fe0530
	dbra.w	d1,Lfe052c				;$51c9,$fff8		;fe0532
	addq.w	#1,($0000.w,a6)				;$526e,$0000		;fe0536
	rts						;$4e75			;fe053a

Lfe053c:									;fe053c
	lea.l	(Lfe05b2),a0				;$41f9,$00fe,$05b2	;fe053c
	bra.s	Lfe0552					;$600e			;fe0542
Lfe0544:									;fe0544
	lea.l	(Lfe057c),a0				;$41f9,$00fe,$057c	;fe0544
	bra.s	Lfe0552					;$6006			;fe054a
Lfe054c:									;fe054c
	lea.l	(Lfe055e),a0				;$41f9,$00fe,$055e	;fe054c
Lfe0552:									;fe0552
	jsr	($00fd9014)				;$4eb9,$00fd,$9014	;fe0552
	jmp	($00fd3a9a)				;$4ef9,$00fd,$3a9a	;fe0558

Lfe055e:									;fe055e
	.dc.b	'Bad checkpoint number (0-9)',$0d,$0a,$00			;fe055e
Lfe057c:									;fe057c
	.dc.b	'memory check pointer over',$0d,$0a,$00				;fe057c
Lfe0598:									;fe0598
	.dc.b	'no memory check pointer',$0d,$0a,$00				;fe0598
Lfe05b2:									;fe05b2
	.dc.b	'Checkpoint list or ',$27,'*',$27,' expected',$0d,$0a,$00	;fe05b2
Lfe05d4:									;fe05d4
	move.w	#$0001,($01d4,a6)			;$3d7c,$0001,$01d4	;fe05d4
	move.w	#$0001,($01d2,a6)			;$3d7c,$0001,$01d2	;fe05da
	move.b	(a5)+,d0				;$101d			;fe05e0
	jsr	(Lfe08ec)				;$4eb9,$00fe,$08ec	;fe05e2
	cmpi.b	#$4e,d0					;$0c00,$004e		;fe05e8
	bne.s	Lfe05fa					;$660c			;fe05ec
	clr.w	($01d4,a6)				;$426e,$01d4		;fe05ee
	move.b	(a5)+,d0				;$101d			;fe05f2
	jsr	(Lfe08ec)				;$4eb9,$00fe,$08ec	;fe05f4
Lfe05fa:									;fe05fa
	cmpi.b	#$53,d0					;$0c00,$0053		;fe05fa
	bne.s	Lfe0606					;$6606			;fe05fe
	clr.w	($01d2,a6)				;$426e,$01d2		;fe0600
	bra.s	Lfe062a					;$6024			;fe0604
Lfe0606:									;fe0606
	cmpi.b	#$57,d0					;$0c00,$0057		;fe0606
	beq.s	Lfe062a					;$671e			;fe060a
	cmpi.b	#$4c,d0					;$0c00,$004c		;fe060c
	bne.s	Lfe061a					;$6608			;fe0610
	move.w	#$0002,($01d2,a6)			;$3d7c,$0002,$01d2	;fe0612
	bra.s	Lfe062a					;$6010			;fe0618
Lfe061a:									;fe061a
	cmpi.b	#$50,d0					;$0c00,$0050		;fe061a
	bne.s	Lfe0628					;$6608			;fe061e
	move.w	#$0003,($01d2,a6)			;$3d7c,$0003,$01d2	;fe0620
	bra.s	Lfe062a					;$6002			;fe0626
Lfe0628:									;fe0628
	move.b	-(a5),d0				;$1025			;fe0628
Lfe062a:									;fe062a
	jsr	(Lfe07c6)				;$4eb9,$00fe,$07c6	;fe062a
	tst.b	d0					;$4a00			;fe0630
	beq.s	Lfe066e					;$673a			;fe0632
	cmp.b	#$3a,d0					;$b03c,$003a		;fe0634
	beq.s	Lfe066e					;$6734			;fe0638
	jsr	($00fdeaa4)				;$4eb9,$00fd,$eaa4	;fe063a
	bcs.s	Lfe0668					;$6526			;fe0640
	move.l	d6,($002e,a6)				;$2d46,$002e		;fe0642
	jsr	(Lfe07c6)				;$4eb9,$00fe,$07c6	;fe0646
	tst.b	d0					;$4a00			;fe064c
	beq.s	Lfe066e					;$671e			;fe064e
	cmp.b	#$3a,d0					;$b03c,$003a		;fe0650
	beq.s	Lfe066e					;$6718			;fe0654
	jsr	($00fdfec2)				;$4eb9,$00fd,$fec2	;fe0656
	tst.w	d7					;$4a47			;fe065c
	beq.s	Lfe066e					;$670e			;fe065e
	jsr	(Lfe0790)				;$4eb9,$00fe,$0790	;fe0660
	rts						;$4e75			;fe0666

Lfe0668:									;fe0668
	jmp	($00fd4056)				;$4ef9,$00fd,$4056	;fe0668

Lfe066e:									;fe066e
	move.l	a5,-(a7)				;$2f0d			;fe066e
	tst.w	($01d2,a6)				;$4a6e,$01d2		;fe0670
	beq.s	Lfe068a					;$6714			;fe0674
	cmpi.w	#$0003,($01d2,a6)			;$0c6e,$0003,$01d2	;fe0676
	beq.s	Lfe068a					;$670c			;fe067c
	move.l	($002e,a6),d0				;$202e,$002e		;fe067e
	bclr.l	#$00,d0					;$0880,$0000		;fe0682
	move.l	d0,($002e,a6)				;$2d40,$002e		;fe0686
Lfe068a:									;fe068a
	move.l	($002e,a6),d1				;$222e,$002e		;fe068a
	jsr	($00fd8f4a)				;$4eb9,$00fd,$8f4a	;fe068e
	jsr	($00fd8eda)				;$4eb9,$00fd,$8eda	;fe0694
	tst.w	($01d4,a6)				;$4a6e,$01d4		;fe069a
	beq.s	Lfe06d8					;$6738			;fe069e
	movea.l	($002e,a6),a2				;$246e,$002e		;fe06a0
	cmpi.w	#$0003,($01d2,a6)			;$0c6e,$0003,$01d2	;fe06a4
	beq.s	Lfe06b6					;$670a			;fe06aa
	cmpi.w	#$0001,($01d2,a6)			;$0c6e,$0001,$01d2	;fe06ac
	bhi.s	Lfe06ca					;$6216			;fe06b2
	beq.s	Lfe06c0					;$670a			;fe06b4
Lfe06b6:									;fe06b6
	move.b	(a2),d1					;$1212			;fe06b6
	jsr	($00fd8f64)				;$4eb9,$00fd,$8f64	;fe06b8
	bra.s	Lfe06d2					;$6012			;fe06be
Lfe06c0:									;fe06c0
	move.w	(a2),d1					;$3212			;fe06c0
	jsr	($00fd8f50)				;$4eb9,$00fd,$8f50	;fe06c2
	bra.s	Lfe06d2					;$6008			;fe06c8
Lfe06ca:									;fe06ca
	move.l	(a2),d1					;$2212			;fe06ca
	jsr	($00fd8f4a)				;$4eb9,$00fd,$8f4a	;fe06cc
Lfe06d2:									;fe06d2
	jsr	($00fd8ee0)				;$4eb9,$00fd,$8ee0	;fe06d2
Lfe06d8:									;fe06d8
	jsr	($00fd8d96)				;$4eb9,$00fd,$8d96	;fe06d8
	jsr	(Lfe07d8)				;$4eb9,$00fe,$07d8	;fe06de
	cmpi.b	#$3b,d0					;$0c00,$003b		;fe06e4
	beq.s	Lfe0714					;$672a			;fe06e8
	tst.b	d0					;$4a00			;fe06ea
	beq.s	Lfe0754					;$6766			;fe06ec
	cmp.b	#$5e,d0					;$b03c,$005e		;fe06ee
	beq.s	Lfe0772					;$677e			;fe06f2
	cmpi.b	#$2d,d0					;$0c00,$002d		;fe06f4
	bne.s	Lfe0706					;$660c			;fe06f8
	jsr	(Lfe07c6)				;$4eb9,$00fe,$07c6	;fe06fa
	tst.b	d0					;$4a00			;fe0700
	beq.s	Lfe0772					;$676e			;fe0702
	bra.s	Lfe071e					;$6018			;fe0704
Lfe0706:									;fe0706
	cmpi.b	#$2e,d0					;$0c00,$002e		;fe0706
	bne.s	Lfe071e					;$6612			;fe070a
	jsr	(Lfe07c6)				;$4eb9,$00fe,$07c6	;fe070c
	bne.s	Lfe071e					;$660a			;fe0712
Lfe0714:									;fe0714
	jsr	($00fd8ece)				;$4eb9,$00fd,$8ece	;fe0714
	movea.l	(a7)+,a5				;$2a5f			;fe071a
	rts						;$4e75			;fe071c

Lfe071e:									;fe071e
	lea.l	($045c,a6),a5				;$4bee,$045c		;fe071e
	jsr	($00fdeaa4)				;$4eb9,$00fd,$eaa4	;fe0722
	bcc.s	Lfe0734					;$640a			;fe0728
	jsr	($00fd43c8)				;$4eb9,$00fd,$43c8	;fe072a
	bra.w	Lfe068a					;$6000,$ff58		;fe0730
Lfe0734:									;fe0734
	movea.l	($002e,a6),a2				;$246e,$002e		;fe0734
	cmpi.w	#$0003,($01d2,a6)			;$0c6e,$0003,$01d2	;fe0738
	beq.s	Lfe074a					;$670a			;fe073e
	cmpi.w	#$0001,($01d2,a6)			;$0c6e,$0001,$01d2	;fe0740
	bhi.s	Lfe0752					;$620a			;fe0746
	beq.s	Lfe074e					;$6704			;fe0748
Lfe074a:									;fe074a
	move.b	d6,(a2)+				;$14c6			;fe074a
	bra.s	Lfe0754					;$6006			;fe074c
Lfe074e:									;fe074e
	move.w	d6,(a2)+				;$34c6			;fe074e
	bra.s	Lfe0754					;$6002			;fe0750
Lfe0752:									;fe0752
	move.l	d6,(a2)+				;$24c6			;fe0752
Lfe0754:									;fe0754
	clr.l	d0					;$4280			;fe0754
	move.w	($01d2,a6),d0				;$302e,$01d2		;fe0756
	cmpi.w	#$0003,d0				;$0c40,$0003		;fe075a
	bne.s	Lfe0764					;$6604			;fe075e
	moveq.l	#$02,d0					;$7002			;fe0760
	bra.s	Lfe076a					;$6006			;fe0762
Lfe0764:									;fe0764
	add.w	d0,d0					;$d040			;fe0764
	bne.s	Lfe076a					;$6602			;fe0766
	moveq.l	#$01,d0					;$7001			;fe0768
Lfe076a:									;fe076a
	add.l	d0,($002e,a6)				;$d1ae,$002e		;fe076a
	bra.w	Lfe068a					;$6000,$ff1a		;fe076e
Lfe0772:									;fe0772
	clr.l	d0					;$4280			;fe0772
	move.w	($01d2,a6),d0				;$302e,$01d2		;fe0774
	cmpi.w	#$0003,d0				;$0c40,$0003		;fe0778
	bne.s	Lfe0782					;$6604			;fe077c
	moveq.l	#$02,d0					;$7002			;fe077e
	bra.s	Lfe0788					;$6006			;fe0780
Lfe0782:									;fe0782
	add.w	d0,d0					;$d040			;fe0782
	bne.s	Lfe0788					;$6602			;fe0784
	moveq.l	#$01,d0					;$7001			;fe0786
Lfe0788:									;fe0788
	sub.l	d0,($002e,a6)				;$91ae,$002e		;fe0788
	bra.w	Lfe068a					;$6000,$fefc		;fe078c
Lfe0790:									;fe0790
	lea.l	($045c,a6),a1				;$43ee,$045c		;fe0790
	movea.l	($002e,a6),a0				;$206e,$002e		;fe0794
	tst.w	($01d2,a6)				;$4a6e,$01d2		;fe0798
	beq.s	Lfe07b2					;$6714			;fe079c
	cmpi.w	#$0003,($01d2,a6)			;$0c6e,$0003,$01d2	;fe079e
	beq.s	Lfe07bc					;$6716			;fe07a4
	lsr.w	#1,d7					;$e24f			;fe07a6
	subq.w	#1,d7					;$5347			;fe07a8
Lfe07aa:									;fe07aa
	move.w	(a1)+,(a0)+				;$30d9			;fe07aa
	dbra.w	d7,Lfe07aa				;$51cf,$fffc		;fe07ac
	rts						;$4e75			;fe07b0

Lfe07b2:									;fe07b2
	subq.w	#1,d7					;$5347			;fe07b2
Lfe07b4:									;fe07b4
	move.b	(a1)+,(a0)+				;$10d9			;fe07b4
	dbra.w	d7,Lfe07b4				;$51cf,$fffc		;fe07b6
	rts						;$4e75			;fe07ba

Lfe07bc:									;fe07bc
	subq.w	#1,d7					;$5347			;fe07bc
Lfe07be:									;fe07be
	move.b	(a1)+,(a0)+				;$10d9			;fe07be
	addq.l	#1,a0					;$5288			;fe07c0
	dbra.w	d7,Lfe07be				;$51cf,$fffa		;fe07c2
Lfe07c6:									;fe07c6
	move.b	(a5)+,d0				;$101d			;fe07c6
	cmpi.b	#$20,d0					;$0c00,$0020		;fe07c8
	beq.s	Lfe07c6					;$67f8			;fe07cc
	cmpi.b	#$09,d0					;$0c00,$0009		;fe07ce
	beq.s	Lfe07c6					;$67f2			;fe07d2
	move.b	-(a5),d0				;$1025			;fe07d4
	rts						;$4e75			;fe07d6

Lfe07d8:									;fe07d8
	move.b	(a5)+,d0				;$101d			;fe07d8
	cmpi.b	#$20,d0					;$0c00,$0020		;fe07da
	beq.s	Lfe07d8					;$67f8			;fe07de
	cmpi.b	#$09,d0					;$0c00,$0009		;fe07e0
	beq.s	Lfe07d8					;$67f2			;fe07e4
	rts						;$4e75			;fe07e6

Lfe07e8:									;fe07e8
	jsr	(Lfe08ec)				;$4eb9,$00fe,$08ec	;fe07e8
	cmpi.b	#$30,d0					;$0c00,$0030		;fe07ee
	bcs.s	Lfe0814					;$6520			;fe07f2
	cmpi.b	#$3a,d0					;$0c00,$003a		;fe07f4
	bcs.s	Lfe0810					;$6516			;fe07f8
	cmpi.b	#$41,d0					;$0c00,$0041		;fe07fa
	bcs.s	Lfe0814					;$6514			;fe07fe
	cmpi.b	#$47,d0					;$0c00,$0047		;fe0800
	bcs.s	Lfe0810					;$650a			;fe0804
	cmpi.b	#$61,d0					;$0c00,$0061		;fe0806
	bcs.s	Lfe0814					;$6508			;fe080a
	cmpi.b	#$67,d0					;$0c00,$0067		;fe080c
Lfe0810:									;fe0810
	eori.b	#$01,ccr				;$0a3c,$0001		;fe0810
Lfe0814:									;fe0814
	rts						;$4e75			;fe0814

Lfe0816:									;fe0816
	cmpi.b	#$39,d0					;$0c00,$0039		;fe0816
	bhi.s	Lfe0822					;$6206			;fe081a
	cmpi.b	#$30,d0					;$0c00,$0030		;fe081c
	rts						;$4e75			;fe0820

Lfe0822:									;fe0822
	ori.b	#$01,ccr				;$003c,$0001		;fe0822
	rts						;$4e75			;fe0826

Lfe0828:									;fe0828
	cmpi.b	#$20,d0					;$0c00,$0020		;fe0828
	bcs.s	Lfe0836					;$6508			;fe082c
	cmpi.b	#$7f,d0					;$0c00,$007f		;fe082e
	eori.b	#$01,ccr				;$0a3c,$0001		;fe0832
Lfe0836:									;fe0836
	rts						;$4e75			;fe0836

Lfe0838:									;fe0838
	cmpi.b	#$30,d0					;$0c00,$0030		;fe0838
	bcs.s	Lfe086c					;$652e			;fe083c
	cmpi.b	#$3a,d0					;$0c00,$003a		;fe083e
	bcs.s	Lfe0868					;$6524			;fe0842
	cmpi.b	#$3f,d0					;$0c00,$003f		;fe0844
	bls.s	Lfe086c					;$6322			;fe0848
	cmpi.b	#$40,d0					;$0c00,$0040		;fe084a
	beq.s	Lfe086c					;$671c			;fe084e
	cmpi.b	#$5a,d0					;$0c00,$005a		;fe0850
	bcs.s	Lfe0868					;$6512			;fe0854
	cmp.b	#$5f,d0					;$b03c,$005f		;fe0856
	beq.s	Lfe0868					;$670c			;fe085a
	bcs.s	Lfe086c					;$650e			;fe085c
	cmp.b	#$60,d0					;$b03c,$0060		;fe085e
	beq.s	Lfe086c					;$6708			;fe0862
	cmp.b	#$7a,d0					;$b03c,$007a		;fe0864
Lfe0868:									;fe0868
	eori.b	#$01,ccr				;$0a3c,$0001		;fe0868
Lfe086c:									;fe086c
	rts						;$4e75			;fe086c

Lfe086e:									;fe086e
	move.b	(a0),d0					;$1010			;fe086e
	beq.s	Lfe08ce					;$675c			;fe0870
	cmp.b	#$2e,d0					;$b03c,$002e		;fe0872
	beq.s	Lfe08ae					;$6736			;fe0876
Lfe0878:									;fe0878
	move.b	(a0),d0					;$1010			;fe0878
	cmp.b	#$30,d0					;$b03c,$0030		;fe087a
	bcs.s	Lfe08ce					;$654e			;fe087e
	cmp.b	#$3a,d0					;$b03c,$003a		;fe0880
	bcs.s	Lfe08ae					;$6528			;fe0884
	cmp.b	#$3f,d0					;$b03c,$003f		;fe0886
	bcs.s	Lfe08ce					;$6542			;fe088a
	cmp.b	#$80,d0					;$b03c,$0080		;fe088c
	bcc.s	Lfe08b4					;$6422			;fe0890
	cmp.b	#$5b,d0					;$b03c,$005b		;fe0892
	bcs.s	Lfe08ae					;$6516			;fe0896
	beq.s	Lfe08ce					;$6734			;fe0898
	cmp.b	#$5d,d0					;$b03c,$005d		;fe089a
	beq.s	Lfe08ce					;$672e			;fe089e
	cmp.b	#$7b,d0					;$b03c,$007b		;fe08a0
	bcs.s	Lfe08ae					;$6508			;fe08a4
	beq.s	Lfe08ce					;$6726			;fe08a6
	cmp.b	#$7d,d0					;$b03c,$007d		;fe08a8
	bls.s	Lfe08ce					;$6320			;fe08ac
Lfe08ae:									;fe08ae
	addq.l	#1,a0					;$5288			;fe08ae
	move.b	d0,(a1)+				;$12c0			;fe08b0
	bra.s	Lfe0878					;$60c4			;fe08b2
Lfe08b4:									;fe08b4
	cmp.b	#$e0,d0					;$b03c,$00e0		;fe08b4
	bcc.s	Lfe08c0					;$6406			;fe08b8
	cmp.b	#$a0,d0					;$b03c,$00a0		;fe08ba
	bcc.s	Lfe08ae					;$64ee			;fe08be
Lfe08c0:									;fe08c0
	addq.l	#1,a0					;$5288			;fe08c0
	move.b	d0,(a1)+				;$12c0			;fe08c2
	move.b	(a0),d0					;$1010			;fe08c4
	cmp.b	#$20,d0					;$b03c,$0020		;fe08c6
	bcc.s	Lfe08ae					;$64e2			;fe08ca
	subq.l	#1,a1					;$5389			;fe08cc
Lfe08ce:									;fe08ce
	clr.b	(a1)					;$4211			;fe08ce
	rts						;$4e75			;fe08d0

Lfe08d2:									;fe08d2
	move.l	a5,-(a7)				;$2f0d			;fe08d2
Lfe08d4:									;fe08d4
	move.b	(a0),d0					;$1010			;fe08d4
	beq.s	Lfe08e8					;$6710			;fe08d6
	move.b	(a5)+,d0				;$101d			;fe08d8
	jsr	(Lfe08ec)				;$4eb9,$00fe,$08ec	;fe08da
	cmp.b	(a0)+,d0				;$b018			;fe08e0
	beq.s	Lfe08d4					;$67f0			;fe08e2
	movea.l	(a7)+,a5				;$2a5f			;fe08e4
	rts						;$4e75			;fe08e6

Lfe08e8:									;fe08e8
	addq.l	#4,a7					;$588f			;fe08e8
	rts						;$4e75			;fe08ea

Lfe08ec:									;fe08ec
	cmpi.b	#$61,d0					;$0c00,$0061		;fe08ec
	bcs.s	Lfe08fc					;$650a			;fe08f0
	cmpi.b	#$7a,d0					;$0c00,$007a		;fe08f2
	bhi.s	Lfe08fc					;$6204			;fe08f6
	andi.b	#$df,d0					;$0200,$00df		;fe08f8
Lfe08fc:									;fe08fc
	rts						;$4e75			;fe08fc

Lfe08fe:									;fe08fe
	jsr	(Lfe07c6)				;$4eb9,$00fe,$07c6	;fe08fe
	tst.b	d0					;$4a00			;fe0904
	beq.s	Lfe090e					;$6706			;fe0906
	cmpi.b	#$3a,d0					;$0c00,$003a		;fe0908
	bne.s	Lfe0910					;$6602			;fe090c
Lfe090e:									;fe090e
	rts						;$4e75			;fe090e

Lfe0910:									;fe0910
	jmp	($00fd4036)				;$4ef9,$00fd,$4036	;fe0910

Lfe0916:									;fe0916
	rts						;$4e75			;fe0916

Lfe0918:									;fe0918
	rts						;$4e75			;fe0918

Lfe091a:									;fe091a
	movem.l	a0-a3,-(a7)				;$48e7,$00f0		;fe091a
	movea.l	a0,a2					;$2448			;fe091e
	move.l	($030c,a6),d0				;$202e,$030c		;fe0920
	beq.s	Lfe0952					;$672c			;fe0924
	movea.l	d0,a3					;$2640			;fe0926
Lfe0928:									;fe0928
	move.l	(a3)+,d0				;$201b			;fe0928
	beq.s	Lfe0952					;$6726			;fe092a
	movea.l	d0,a1					;$2240			;fe092c
	addq.l	#6,a1					;$5c89			;fe092e
	movea.l	a2,a0					;$204a			;fe0930
Lfe0932:									;fe0932
	move.b	(a0)+,d0				;$1018			;fe0932
	beq.s	Lfe093c					;$6706			;fe0934
	cmp.b	(a1)+,d0				;$b019			;fe0936
	beq.s	Lfe0932					;$67f8			;fe0938
	bra.s	Lfe0928					;$60ec			;fe093a
Lfe093c:									;fe093c
	tst.b	(a1)					;$4a11			;fe093c
	bne.s	Lfe0928					;$66e8			;fe093e
	move.l	(-$0004,a3),d0				;$202b,$fffc		;fe0940
	movea.l	d0,a0					;$2040			;fe0944
	move.l	($0002,a0),d0				;$2028,$0002		;fe0946
	moveq.l	#$00,d1					;$7200			;fe094a
Lfe094c:									;fe094c
	movem.l	(a7)+,a0-a3				;$4cdf,$0f00		;fe094c
	rts						;$4e75			;fe0950

Lfe0952:									;fe0952
	moveq.l	#$ff,d1					;$72ff			;fe0952
	bra.s	Lfe094c					;$60f6			;fe0954
Lfe0956:									;fe0956
	movem.l	d1/a0-a1,-(a7)				;$48e7,$40c0		;fe0956
	move.l	($030c,a6),d1				;$222e,$030c		;fe095a
	beq.s	Lfe0978					;$6718			;fe095e
	movea.l	d1,a1					;$2241			;fe0960
Lfe0962:									;fe0962
	move.l	(a1)+,d1				;$2219			;fe0962
	beq.s	Lfe0978					;$6712			;fe0964
	movea.l	d1,a0					;$2041			;fe0966
	cmp.l	($0002,a0),d0				;$b0a8,$0002		;fe0968
	bne.s	Lfe0962					;$66f4			;fe096c
	move.l	a0,d0					;$2008			;fe096e
	addq.l	#6,d0					;$5c80			;fe0970
Lfe0972:									;fe0972
	movem.l	(a7)+,d1/a0-a1				;$4cdf,$0302		;fe0972
	rts						;$4e75			;fe0976

Lfe0978:									;fe0978
	moveq.l	#$ff,d0					;$70ff			;fe0978
	bra.s	Lfe0972					;$60f6			;fe097a
Lfe097c:									;fe097c
	moveq.l	#$00,d0					;$7000			;fe097c
	tst.b	($0cbc)					;$4a38,$0cbc		;fe097e
	sne.b	d0					;$56c0			;fe0982
	and.b	#$14,d0					;$c03c,$0014		;fe0984
	rts						;$4e75			;fe0988

Lfe098a:									;fe098a
	moveq.l	#$00,d0					;$7000			;fe098a
	tst.b	($0cbd)					;$4a38,$0cbd		;fe098c
	sne.b	d0					;$56c0			;fe0990
	ext.w	d0					;$4880			;fe0992
	ext.l	d0					;$48c0			;fe0994
	rts						;$4e75			;fe0996

Lfe0998:									;fe0998
	moveq.l	#$00,d0					;$7000			;fe0998
	tst.b	($0cbe)					;$4a38,$0cbe		;fe099a
	sne.b	d0					;$56c0			;fe099e
	ext.w	d0					;$4880			;fe09a0
	ext.l	d0					;$48c0			;fe09a2
	rts						;$4e75			;fe09a4

Lfe09a6:									;fe09a6
	lea.l	(Lfe3d2c),a0				;$41f9,$00fe,$3d2c	;fe09a6
	bsr.w	Lfe16d0					;$6100,$0d22		;fe09ac
	adda.l	#$00000008,a1				;$d3fc,$0000,$0008	;fe09b0
	move.l	#$000000f4,d0				;$203c,$0000,$00f4	;fe09b6
	bsr.s	Lfe09f2					;$6134			;fe09bc
	rts						;$4e75			;fe09be

Lfe09c0:									;fe09c0
	lea.l	(Lfe3d2c),a0				;$41f9,$00fe,$3d2c	;fe09c0
	bsr.w	Lfe16d0					;$6100,$0d08		;fe09c6
	adda.l	#$00000008,a1				;$d3fc,$0000,$0008	;fe09ca
	move.l	#$00000074.l,d0				;$203c,$0000,$0074	;fe09d0
	bsr.s	Lfe09f2					;$611a			;fe09d6
	lea.l	(Lfe3db4),a0				;$41f9,$00fe,$3db4	;fe09d8
	bsr.w	Lfe16d0					;$6100,$0cf0		;fe09de
	adda.l	#$00000090,a1				;$d3fc,$0000,$0090	;fe09e2
	move.l	#$0000006c.l,d0				;$203c,$0000,$006c	;fe09e8
	bsr.s	Lfe09f2					;$6102			;fe09ee
	rts						;$4e75			;fe09f0

Lfe09f2:									;fe09f2
	move.l	(a0)+,-(a7)				;$2f18			;fe09f2
	beq.s	Lfe09fe					;$6708			;fe09f4
	move.l	(a7)+,(a1)+				;$22df			;fe09f6
	subq.l	#4,d0					;$5980			;fe09f8
	bpl.s	Lfe09f2					;$6af6			;fe09fa
	rts						;$4e75			;fe09fc

Lfe09fe:									;fe09fe
	addq.l	#4,a7					;$588f			;fe09fe
	addq.l	#4,a1					;$5889			;fe0a00
	subq.l	#4,d0					;$5980			;fe0a02
	bpl.s	Lfe09f2					;$6aec			;fe0a04
	rts						;$4e75			;fe0a06

Lfe0a08:									;fe0a08
	move.l	a0,($00001694).l			;$23c8,$0000,$1694	;fe0a08
	tst.w	($00001690).l				;$4a79,$0000,$1690	;fe0a0e
	beq.w	Lfe17e4					;$6700,$0dce		;fe0a14
	movec.l	sfc,a0					;$4e7a,$8000		;fe0a18
	move.l	a0,($000016a0).l			;$23c8,$0000,$16a0	;fe0a1c
	movec.l	dfc,a0					;$4e7a,$8001		;fe0a22
	move.l	a0,($000016a4).l			;$23c8,$0000,$16a4	;fe0a26
	movec.l	vbr,a0					;$4e7a,$8801		;fe0a2c
	move.l	a0,($000016b0).l			;$23c8,$0000,$16b0	;fe0a30
	movec.l	caar,a0					;$4e7a,$8802		;fe0a36
	move.l	a0,($000016ac).l			;$23c8,$0000,$16ac	;fe0a3a
	movea.l	($00001694).l,a0			;$2079,$0000,$1694	;fe0a40
	rts						;$4e75			;fe0a46

Lfe0a48:									;fe0a48
	.dc.b	$46,$fc,$27,$00,$23,$cf,$00,$00					;fe0a48
	.dc.b	$2a,$30,$23,$c8,$00,$00,$16,$94					;fe0a50
	.dc.b	$4e,$7a,$80,$02,$23,$c8,$00,$00					;fe0a58
	.dc.b	$2a,$3c,$20,$7c,$00,$00,$08,$08					;fe0a60
	.dc.b	$4e,$7b,$80,$02,$4e,$7a,$88,$03					;fe0a68
	.dc.b	$23,$c8,$00,$00,$2a,$34,$4e,$7a					;fe0a70
	.dc.b	$88,$04,$23,$c8,$00,$00,$2a,$38					;fe0a78
	.dc.b	$20,$79,$00,$00,$16,$94,$4f,$f9					;fe0a80
	.dc.b	$00,$00,$2e,$0e,$46,$fc,$20,$00					;fe0a88
	.dc.b	$61,$00,$0c,$98,$62,$75,$73,$20					;fe0a90
	.dc.b	$65,$72,$72,$6f,$72,$00,$46,$fc					;fe0a98
	.dc.b	$27,$00,$23,$cf,$00,$00,$2a,$30					;fe0aa0
	.dc.b	$23,$c8,$00,$00,$16,$94,$4e,$7a					;fe0aa8
	.dc.b	$80,$02,$23,$c8,$00,$00,$2a,$3c					;fe0ab0
	.dc.b	$20,$7c,$00,$00,$08,$08,$4e,$7b					;fe0ab8
	.dc.b	$80,$02,$4e,$7a,$88,$03,$23,$c8					;fe0ac0
	.dc.b	$00,$00,$2a,$34,$4e,$7a,$88,$04					;fe0ac8
	.dc.b	$23,$c8,$00,$00,$2a,$38,$20,$79					;fe0ad0
	.dc.b	$00,$00,$16,$94,$4f,$f9,$00,$00					;fe0ad8
	.dc.b	$2e,$0e,$46,$fc,$20,$00,$61,$00					;fe0ae0
	.dc.b	$0c,$42,$61,$64,$64,$72,$65,$73					;fe0ae8
	.dc.b	$73,$20,$65,$72,$72,$6f,$72,$00					;fe0af0
	.dc.b	$46,$fc,$27,$00,$23,$cf,$00,$00					;fe0af8
	.dc.b	$2a,$30,$23,$c8,$00,$00,$16,$94					;fe0b00
	.dc.b	$4e,$7a,$80,$02,$23,$c8,$00,$00					;fe0b08
	.dc.b	$2a,$3c,$20,$7c,$00,$00,$08,$08					;fe0b10
	.dc.b	$4e,$7b,$80,$02,$4e,$7a,$88,$03					;fe0b18
	.dc.b	$23,$c8,$00,$00,$2a,$34,$4e,$7a					;fe0b20
	.dc.b	$88,$04,$23,$c8,$00,$00,$2a,$38					;fe0b28
	.dc.b	$20,$79,$00,$00,$16,$94,$4f,$f9					;fe0b30
	.dc.b	$00,$00,$2e,$0e,$46,$fc,$20,$00					;fe0b38
	.dc.b	$61,$00,$0b,$e8,$75,$6e,$64,$65					;fe0b40
	.dc.b	$66,$69,$6e,$65,$64,$20,$69,$6e					;fe0b48
	.dc.b	$73,$74,$72,$75,$63,$74,$69,$6f					;fe0b50
	.dc.b	$6e,$00,$46,$fc,$27,$00,$23,$cf					;fe0b58
	.dc.b	$00,$00,$2a,$30,$23,$c8,$00,$00					;fe0b60
	.dc.b	$16,$94,$4e,$7a,$80,$02,$23,$c8					;fe0b68
	.dc.b	$00,$00,$2a,$3c,$20,$7c,$00,$00					;fe0b70
	.dc.b	$08,$08,$4e,$7b,$80,$02,$4e,$7a					;fe0b78
	.dc.b	$88,$03,$23,$c8,$00,$00,$2a,$34					;fe0b80
	.dc.b	$4e,$7a,$88,$04,$23,$c8,$00,$00					;fe0b88
	.dc.b	$2a,$38,$20,$79,$00,$00,$16,$94					;fe0b90
	.dc.b	$4f,$f9,$00,$00,$2e,$0e,$46,$fc					;fe0b98
	.dc.b	$20,$00,$61,$00,$0b,$86,$7a,$65					;fe0ba0
	.dc.b	$72,$6f,$20,$64,$69,$76,$69,$64					;fe0ba8
	.dc.b	$65,$00,$46,$fc,$27,$00,$23,$cf					;fe0bb0
	.dc.b	$00,$00,$2a,$30,$23,$c8,$00,$00					;fe0bb8
	.dc.b	$16,$94,$4e,$7a,$80,$02,$23,$c8					;fe0bc0
	.dc.b	$00,$00,$2a,$3c,$20,$7c,$00,$00					;fe0bc8
	.dc.b	$08,$08,$4e,$7b,$80,$02,$4e,$7a					;fe0bd0
	.dc.b	$88,$03,$23,$c8,$00,$00,$2a,$34					;fe0bd8
	.dc.b	$4e,$7a,$88,$04,$23,$c8,$00,$00					;fe0be0
	.dc.b	$2a,$38,$20,$79,$00,$00,$16,$94					;fe0be8
	.dc.b	$4f,$f9,$00,$00,$2e,$0e,$46,$fc					;fe0bf0
	.dc.b	$20,$00,$61,$00,$0b,$2e,$43,$48					;fe0bf8
	.dc.b	$4b,$2c,$20,$43,$48,$4b,$32,$20					;fe0c00
	.dc.b	$69,$6e,$73,$74,$72,$75,$63,$74					;fe0c08
	.dc.b	$69,$6f,$6e,$73,$00,$00,$46,$fc					;fe0c10
	.dc.b	$27,$00,$23,$cf,$00,$00,$2a,$30					;fe0c18
	.dc.b	$23,$c8,$00,$00,$16,$94,$4e,$7a					;fe0c20
	.dc.b	$80,$02,$23,$c8,$00,$00,$2a,$3c					;fe0c28
	.dc.b	$20,$7c,$00,$00,$08,$08,$4e,$7b					;fe0c30
	.dc.b	$80,$02,$4e,$7a,$88,$03,$23,$c8					;fe0c38
	.dc.b	$00,$00,$2a,$34,$4e,$7a,$88,$04					;fe0c40
	.dc.b	$23,$c8,$00,$00,$2a,$38,$20,$79					;fe0c48
	.dc.b	$00,$00,$16,$94,$4f,$f9,$00,$00					;fe0c50
	.dc.b	$2e,$0e,$46,$fc,$20,$00,$61,$00					;fe0c58
	.dc.b	$0a,$ca,$63,$70,$54,$52,$41,$50					;fe0c60
	.dc.b	$63,$63,$2c,$20,$54,$52,$41,$50					;fe0c68
	.dc.b	$63,$63,$2c,$20,$54,$52,$41,$50					;fe0c70
	.dc.b	$56,$20,$69,$6e,$73,$74,$72,$75					;fe0c78
	.dc.b	$63,$74,$69,$6f,$6e,$73,$00,$00					;fe0c80
	.dc.b	$46,$fc,$27,$00,$23,$cf,$00,$00					;fe0c88
	.dc.b	$2a,$30,$23,$c8,$00,$00,$16,$94					;fe0c90
	.dc.b	$4e,$7a,$80,$02,$23,$c8,$00,$00					;fe0c98
	.dc.b	$2a,$3c,$20,$7c,$00,$00,$08,$08					;fe0ca0
	.dc.b	$4e,$7b,$80,$02,$4e,$7a,$88,$03					;fe0ca8
	.dc.b	$23,$c8,$00,$00,$2a,$34,$4e,$7a					;fe0cb0
	.dc.b	$88,$04,$23,$c8,$00,$00,$2a,$38					;fe0cb8
	.dc.b	$20,$79,$00,$00,$16,$94,$4f,$f9					;fe0cc0
	.dc.b	$00,$00,$2e,$0e,$46,$fc,$20,$00					;fe0cc8
	.dc.b	$61,$00,$0a,$58,$70,$72,$69,$76					;fe0cd0
	.dc.b	$69,$6c,$65,$67,$65,$20,$76,$69					;fe0cd8
	.dc.b	$6f,$6c,$61,$74,$69,$6f,$6e,$00					;fe0ce0
	.dc.b	$46,$fc,$27,$00,$23,$cf,$00,$00					;fe0ce8
	.dc.b	$2a,$30,$23,$c8,$00,$00,$16,$94					;fe0cf0
	.dc.b	$4e,$7a,$80,$02,$23,$c8,$00,$00					;fe0cf8
	.dc.b	$2a,$3c,$20,$7c,$00,$00,$08,$08					;fe0d00
	.dc.b	$4e,$7b,$80,$02,$4e,$7a,$88,$03					;fe0d08
	.dc.b	$23,$c8,$00,$00,$2a,$34,$4e,$7a					;fe0d10
	.dc.b	$88,$04,$23,$c8,$00,$00,$2a,$38					;fe0d18
	.dc.b	$20,$79,$00,$00,$16,$94,$4f,$f9					;fe0d20
	.dc.b	$00,$00,$2e,$0e,$46,$fc,$20,$00					;fe0d28
	.dc.b	$61,$00,$09,$f8,$74,$72,$61,$63					;fe0d30
	.dc.b	$65,$00,$46,$fc,$27,$00,$23,$cf					;fe0d38
	.dc.b	$00,$00,$2a,$30,$23,$c8,$00,$00					;fe0d40
	.dc.b	$16,$94,$4e,$7a,$80,$02,$23,$c8					;fe0d48
	.dc.b	$00,$00,$2a,$3c,$20,$7c,$00,$00					;fe0d50
	.dc.b	$08,$08,$4e,$7b,$80,$02,$4e,$7a					;fe0d58
	.dc.b	$88,$03,$23,$c8,$00,$00,$2a,$34					;fe0d60
	.dc.b	$4e,$7a,$88,$04,$23,$c8,$00,$00					;fe0d68
	.dc.b	$2a,$38,$20,$79,$00,$00,$16,$94					;fe0d70
	.dc.b	$4f,$f9,$00,$00,$2e,$0e,$46,$fc					;fe0d78
	.dc.b	$20,$00,$61,$00,$09,$a6,$6c,$69					;fe0d80
	.dc.b	$6e,$65,$20,$31,$30,$31,$30,$20					;fe0d88
	.dc.b	$65,$6d,$75,$6c,$61,$74,$6f,$72					;fe0d90
	.dc.b	$00,$00,$46,$fc,$27,$00,$23,$cf					;fe0d98
	.dc.b	$00,$00,$2a,$30,$23,$c8,$00,$00					;fe0da0
	.dc.b	$16,$94,$4e,$7a,$80,$02,$23,$c8					;fe0da8
	.dc.b	$00,$00,$2a,$3c,$20,$7c,$00,$00					;fe0db0
	.dc.b	$08,$08,$4e,$7b,$80,$02,$4e,$7a					;fe0db8
	.dc.b	$88,$03,$23,$c8,$00,$00,$2a,$34					;fe0dc0
	.dc.b	$4e,$7a,$88,$04,$23,$c8,$00,$00					;fe0dc8
	.dc.b	$2a,$38,$20,$79,$00,$00,$16,$94					;fe0dd0
	.dc.b	$4f,$f9,$00,$00,$2e,$0e,$46,$fc					;fe0dd8
	.dc.b	$20,$00,$61,$00,$09,$46,$6c,$69					;fe0de0
	.dc.b	$6e,$65,$20,$31,$31,$31,$31,$20					;fe0de8
	.dc.b	$65,$6d,$75,$6c,$61,$74,$6f,$72					;fe0df0
	.dc.b	$00,$00,$46,$fc,$27,$00,$23,$cf					;fe0df8
	.dc.b	$00,$00,$2a,$30,$23,$c8,$00,$00					;fe0e00
	.dc.b	$16,$94,$4e,$7a,$80,$02,$23,$c8					;fe0e08
	.dc.b	$00,$00,$2a,$3c,$20,$7c,$00,$00					;fe0e10
	.dc.b	$08,$08,$4e,$7b,$80,$02,$4e,$7a					;fe0e18
	.dc.b	$88,$03,$23,$c8,$00,$00,$2a,$34					;fe0e20
	.dc.b	$4e,$7a,$88,$04,$23,$c8,$00,$00					;fe0e28
	.dc.b	$2a,$38,$20,$79,$00,$00,$16,$94					;fe0e30
	.dc.b	$4f,$f9,$00,$00,$2e,$0e,$46,$fc					;fe0e38
	.dc.b	$20,$00,$61,$00,$08,$e6,$75,$6e					;fe0e40
	.dc.b	$61,$73,$73,$69,$67,$6e,$65,$64					;fe0e48
	.dc.b	$2c,$20,$72,$65,$73,$65,$72,$76					;fe0e50
	.dc.b	$65,$64,$00,$00,$46,$fc,$27,$00					;fe0e58
	.dc.b	$23,$cf,$00,$00,$2a,$30,$23,$c8					;fe0e60
	.dc.b	$00,$00,$16,$94,$4e,$7a,$80,$02					;fe0e68
	.dc.b	$23,$c8,$00,$00,$2a,$3c,$20,$7c					;fe0e70
	.dc.b	$00,$00,$08,$08,$4e,$7b,$80,$02					;fe0e78
	.dc.b	$4e,$7a,$88,$03,$23,$c8,$00,$00					;fe0e80
	.dc.b	$2a,$34,$4e,$7a,$88,$04,$23,$c8					;fe0e88
	.dc.b	$00,$00,$2a,$38,$20,$79,$00,$00					;fe0e90
	.dc.b	$16,$94,$4f,$f9,$00,$00,$2e,$0e					;fe0e98
	.dc.b	$46,$fc,$20,$00,$61,$00,$08,$84					;fe0ea0
	.dc.b	$63,$6f,$70,$72,$6f,$63,$65,$73					;fe0ea8
	.dc.b	$73,$6f,$72,$20,$70,$72,$6f,$74					;fe0eb0
	.dc.b	$6f,$63,$6f,$6c,$20,$76,$69,$6f					;fe0eb8
	.dc.b	$6c,$61,$74,$69,$6f,$6e,$00,$00					;fe0ec0
	.dc.b	$46,$fc,$27,$00,$23,$cf,$00,$00					;fe0ec8
	.dc.b	$2a,$30,$23,$c8,$00,$00,$16,$94					;fe0ed0
	.dc.b	$4e,$7a,$80,$02,$23,$c8,$00,$00					;fe0ed8
	.dc.b	$2a,$3c,$20,$7c,$00,$00,$08,$08					;fe0ee0
	.dc.b	$4e,$7b,$80,$02,$4e,$7a,$88,$03					;fe0ee8
	.dc.b	$23,$c8,$00,$00,$2a,$34,$4e,$7a					;fe0ef0
	.dc.b	$88,$04,$23,$c8,$00,$00,$2a,$38					;fe0ef8
	.dc.b	$20,$79,$00,$00,$16,$94,$4f,$f9					;fe0f00
	.dc.b	$00,$00,$2e,$0e,$46,$fc,$20,$00					;fe0f08
	.dc.b	$61,$00,$08,$18,$66,$6f,$72,$6d					;fe0f10
	.dc.b	$61,$74,$20,$65,$72,$72,$6f,$72					;fe0f18
	.dc.b	$00,$00,$46,$fc,$27,$00,$23,$cf					;fe0f20
	.dc.b	$00,$00,$2a,$30,$23,$c8,$00,$00					;fe0f28
	.dc.b	$16,$94,$4e,$7a,$80,$02,$23,$c8					;fe0f30
	.dc.b	$00,$00,$2a,$3c,$20,$7c,$00,$00					;fe0f38
	.dc.b	$08,$08,$4e,$7b,$80,$02,$4e,$7a					;fe0f40
	.dc.b	$88,$03,$23,$c8,$00,$00,$2a,$34					;fe0f48
	.dc.b	$4e,$7a,$88,$04,$23,$c8,$00,$00					;fe0f50
	.dc.b	$2a,$38,$20,$79,$00,$00,$16,$94					;fe0f58
	.dc.b	$4f,$f9,$00,$00,$2e,$0e,$46,$fc					;fe0f60
	.dc.b	$20,$00,$61,$00,$07,$be,$75,$6e					;fe0f68
	.dc.b	$69,$6e,$69,$74,$69,$61,$6c,$69					;fe0f70
	.dc.b	$7a,$65,$64,$20,$69,$6e,$74,$65					;fe0f78
	.dc.b	$72,$72,$75,$70,$74,$20,$76,$65					;fe0f80
	.dc.b	$63,$74,$6f,$72,$00,$00,$46,$fc					;fe0f88
	.dc.b	$27,$00,$23,$cf,$00,$00,$2a,$30					;fe0f90
	.dc.b	$23,$c8,$00,$00,$16,$94,$4e,$7a					;fe0f98
	.dc.b	$80,$02,$23,$c8,$00,$00,$2a,$3c					;fe0fa0
	.dc.b	$20,$7c,$00,$00,$08,$08,$4e,$7b					;fe0fa8
	.dc.b	$80,$02,$4e,$7a,$88,$03,$23,$c8					;fe0fb0
	.dc.b	$00,$00,$2a,$34,$4e,$7a,$88,$04					;fe0fb8
	.dc.b	$23,$c8,$00,$00,$2a,$38,$20,$79					;fe0fc0
	.dc.b	$00,$00,$16,$94,$4f,$f9,$00,$00					;fe0fc8
	.dc.b	$2e,$0e,$46,$fc,$20,$00,$61,$00					;fe0fd0
	.dc.b	$07,$52,$73,$70,$75,$72,$69,$6f					;fe0fd8
	.dc.b	$75,$73,$20,$69,$6e,$74,$65,$72					;fe0fe0
	.dc.b	$72,$75,$70,$74,$00,$00,$46,$fc					;fe0fe8
	.dc.b	$27,$00,$23,$cf,$00,$00,$2a,$30					;fe0ff0
	.dc.b	$23,$c8,$00,$00,$16,$94,$4e,$7a					;fe0ff8
	.dc.b	$80,$02,$23,$c8,$00,$00,$2a,$3c					;fe1000
	.dc.b	$20,$7c,$00,$00,$08,$08,$4e,$7b					;fe1008
	.dc.b	$80,$02,$4e,$7a,$88,$03,$23,$c8					;fe1010
	.dc.b	$00,$00,$2a,$34,$4e,$7a,$88,$04					;fe1018
	.dc.b	$23,$c8,$00,$00,$2a,$38,$20,$79					;fe1020
	.dc.b	$00,$00,$16,$94,$4f,$f9,$00,$00					;fe1028
	.dc.b	$2e,$0e,$46,$fc,$20,$00,$61,$00					;fe1030
	.dc.b	$06,$f2,$6c,$65,$76,$65,$6c,$20					;fe1038
	.dc.b	$31,$20,$61,$75,$74,$6f,$76,$65					;fe1040
	.dc.b	$63,$74,$6f,$72,$00,$00,$46,$fc					;fe1048
	.dc.b	$27,$00,$23,$cf,$00,$00,$2a,$30					;fe1050
	.dc.b	$23,$c8,$00,$00,$16,$94,$4e,$7a					;fe1058
	.dc.b	$80,$02,$23,$c8,$00,$00,$2a,$3c					;fe1060
	.dc.b	$20,$7c,$00,$00,$08,$08,$4e,$7b					;fe1068
	.dc.b	$80,$02,$4e,$7a,$88,$03,$23,$c8					;fe1070
	.dc.b	$00,$00,$2a,$34,$4e,$7a,$88,$04					;fe1078
	.dc.b	$23,$c8,$00,$00,$2a,$38,$20,$79					;fe1080
	.dc.b	$00,$00,$16,$94,$4f,$f9,$00,$00					;fe1088
	.dc.b	$2e,$0e,$46,$fc,$20,$00,$61,$00					;fe1090
	.dc.b	$06,$92,$6c,$65,$76,$65,$6c,$20					;fe1098
	.dc.b	$32,$20,$61,$75,$74,$6f,$76,$65					;fe10a0
	.dc.b	$63,$74,$6f,$72,$00,$00,$46,$fc					;fe10a8
	.dc.b	$27,$00,$23,$cf,$00,$00,$2a,$30					;fe10b0
	.dc.b	$23,$c8,$00,$00,$16,$94,$4e,$7a					;fe10b8
	.dc.b	$80,$02,$23,$c8,$00,$00,$2a,$3c					;fe10c0
	.dc.b	$20,$7c,$00,$00,$08,$08,$4e,$7b					;fe10c8
	.dc.b	$80,$02,$4e,$7a,$88,$03,$23,$c8					;fe10d0
	.dc.b	$00,$00,$2a,$34,$4e,$7a,$88,$04					;fe10d8
	.dc.b	$23,$c8,$00,$00,$2a,$38,$20,$79					;fe10e0
	.dc.b	$00,$00,$16,$94,$4f,$f9,$00,$00					;fe10e8
	.dc.b	$2e,$0e,$46,$fc,$20,$00,$61,$00					;fe10f0
	.dc.b	$06,$32,$6c,$65,$76,$65,$6c,$20					;fe10f8
	.dc.b	$33,$20,$61,$75,$74,$6f,$76,$65					;fe1100
	.dc.b	$63,$74,$6f,$72,$00,$00,$46,$fc					;fe1108
	.dc.b	$27,$00,$23,$cf,$00,$00,$2a,$30					;fe1110
	.dc.b	$23,$c8,$00,$00,$16,$94,$4e,$7a					;fe1118
	.dc.b	$80,$02,$23,$c8,$00,$00,$2a,$3c					;fe1120
	.dc.b	$20,$7c,$00,$00,$08,$08,$4e,$7b					;fe1128
	.dc.b	$80,$02,$4e,$7a,$88,$03,$23,$c8					;fe1130
	.dc.b	$00,$00,$2a,$34,$4e,$7a,$88,$04					;fe1138
	.dc.b	$23,$c8,$00,$00,$2a,$38,$20,$79					;fe1140
	.dc.b	$00,$00,$16,$94,$4f,$f9,$00,$00					;fe1148
	.dc.b	$2e,$0e,$46,$fc,$20,$00,$61,$00					;fe1150
	.dc.b	$05,$d2,$6c,$65,$76,$65,$6c,$20					;fe1158
	.dc.b	$34,$20,$61,$75,$74,$6f,$76,$65					;fe1160
	.dc.b	$63,$74,$6f,$72,$00,$00,$46,$fc					;fe1168
	.dc.b	$27,$00,$23,$cf,$00,$00,$2a,$30					;fe1170
	.dc.b	$23,$c8,$00,$00,$16,$94,$4e,$7a					;fe1178
	.dc.b	$80,$02,$23,$c8,$00,$00,$2a,$3c					;fe1180
	.dc.b	$20,$7c,$00,$00,$08,$08,$4e,$7b					;fe1188
	.dc.b	$80,$02,$4e,$7a,$88,$03,$23,$c8					;fe1190
	.dc.b	$00,$00,$2a,$34,$4e,$7a,$88,$04					;fe1198
	.dc.b	$23,$c8,$00,$00,$2a,$38,$20,$79					;fe11a0
	.dc.b	$00,$00,$16,$94,$4f,$f9,$00,$00					;fe11a8
	.dc.b	$2e,$0e,$46,$fc,$20,$00,$61,$00					;fe11b0
	.dc.b	$05,$72,$6c,$65,$76,$65,$6c,$20					;fe11b8
	.dc.b	$35,$20,$61,$75,$74,$6f,$76,$65					;fe11c0
	.dc.b	$63,$74,$6f,$72,$00,$00,$46,$fc					;fe11c8
	.dc.b	$27,$00,$23,$cf,$00,$00,$2a,$30					;fe11d0
	.dc.b	$23,$c8,$00,$00,$16,$94,$4e,$7a					;fe11d8
	.dc.b	$80,$02,$23,$c8,$00,$00,$2a,$3c					;fe11e0
	.dc.b	$20,$7c,$00,$00,$08,$08,$4e,$7b					;fe11e8
	.dc.b	$80,$02,$4e,$7a,$88,$03,$23,$c8					;fe11f0
	.dc.b	$00,$00,$2a,$34,$4e,$7a,$88,$04					;fe11f8
	.dc.b	$23,$c8,$00,$00,$2a,$38,$20,$79					;fe1200
	.dc.b	$00,$00,$16,$94,$4f,$f9,$00,$00					;fe1208
	.dc.b	$2e,$0e,$46,$fc,$20,$00,$61,$00					;fe1210
	.dc.b	$05,$12,$6c,$65,$76,$65,$6c,$20					;fe1218
	.dc.b	$36,$20,$61,$75,$74,$6f,$76,$65					;fe1220
	.dc.b	$63,$74,$6f,$72,$00,$00,$46,$fc					;fe1228
	.dc.b	$27,$00,$23,$cf,$00,$00,$2a,$30					;fe1230
	.dc.b	$23,$c8,$00,$00,$16,$94,$4e,$7a					;fe1238
	.dc.b	$80,$02,$23,$c8,$00,$00,$2a,$3c					;fe1240
	.dc.b	$20,$7c,$00,$00,$08,$08,$4e,$7b					;fe1248
	.dc.b	$80,$02,$4e,$7a,$88,$03,$23,$c8					;fe1250
	.dc.b	$00,$00,$2a,$34,$4e,$7a,$88,$04					;fe1258
	.dc.b	$23,$c8,$00,$00,$2a,$38,$20,$79					;fe1260
	.dc.b	$00,$00,$16,$94,$4f,$f9,$00,$00					;fe1268
	.dc.b	$2e,$0e,$46,$fc,$20,$00,$61,$00					;fe1270
	.dc.b	$04,$b2,$0d,$0a,$52,$4f,$4d,$20					;fe1278
	.dc.b	$4d,$4f,$4e,$49,$54,$4f,$52,$2c					;fe1280
	.dc.b	$20,$6c,$65,$76,$65,$6c,$20,$37					;fe1288
	.dc.b	$20,$69,$6e,$74,$65,$72,$72,$75					;fe1290
	.dc.b	$70,$74,$00,$00,$46,$fc,$27,$00					;fe1298
	.dc.b	$23,$cf,$00,$00,$2a,$30,$23,$c8					;fe12a0
	.dc.b	$00,$00,$16,$94,$4e,$7a,$80,$02					;fe12a8
	.dc.b	$23,$c8,$00,$00,$2a,$3c,$20,$7c					;fe12b0
	.dc.b	$00,$00,$08,$08,$4e,$7b,$80,$02					;fe12b8
	.dc.b	$4e,$7a,$88,$03,$23,$c8,$00,$00					;fe12c0
	.dc.b	$2a,$34,$4e,$7a,$88,$04,$23,$c8					;fe12c8
	.dc.b	$00,$00,$2a,$38,$20,$79,$00,$00					;fe12d0
	.dc.b	$16,$94,$4f,$f9,$00,$00,$2e,$0e					;fe12d8
	.dc.b	$46,$fc,$20,$00,$61,$00,$04,$44					;fe12e0
	.dc.b	$74,$72,$61,$70,$20,$69,$6e,$73					;fe12e8
	.dc.b	$74,$72,$75,$63,$74,$69,$6f,$6e					;fe12f0
	.dc.b	$00,$00,$46,$fc,$27,$00,$23,$cf					;fe12f8
	.dc.b	$00,$00,$2a,$30,$23,$c8,$00,$00					;fe1300
	.dc.b	$16,$94,$4e,$7a,$80,$02,$23,$c8					;fe1308
	.dc.b	$00,$00,$2a,$3c,$20,$7c,$00,$00					;fe1310
	.dc.b	$08,$08,$4e,$7b,$80,$02,$4e,$7a					;fe1318
	.dc.b	$88,$03,$23,$c8,$00,$00,$2a,$34					;fe1320
	.dc.b	$4e,$7a,$88,$04,$23,$c8,$00,$00					;fe1328
	.dc.b	$2a,$38,$20,$79,$00,$00,$16,$94					;fe1330
	.dc.b	$4f,$f9,$00,$00,$2e,$0e,$46,$fc					;fe1338
	.dc.b	$20,$00,$61,$00,$03,$e6,$46,$50					;fe1340
	.dc.b	$43,$50,$20,$62,$72,$61,$6e,$63					;fe1348
	.dc.b	$68,$20,$6f,$72,$20,$73,$65,$74					;fe1350
	.dc.b	$20,$6f,$6e,$20,$75,$6e,$6f,$72					;fe1358
	.dc.b	$64,$65,$72,$65,$64,$20,$63,$6f					;fe1360
	.dc.b	$6e,$64,$69,$74,$69,$6f,$6e,$00					;fe1368
	.dc.b	$46,$fc,$27,$00,$23,$cf,$00,$00					;fe1370
	.dc.b	$2a,$30,$23,$c8,$00,$00,$16,$94					;fe1378
	.dc.b	$4e,$7a,$80,$02,$23,$c8,$00,$00					;fe1380
	.dc.b	$2a,$3c,$20,$7c,$00,$00,$08,$08					;fe1388
	.dc.b	$4e,$7b,$80,$02,$4e,$7a,$88,$03					;fe1390
	.dc.b	$23,$c8,$00,$00,$2a,$34,$4e,$7a					;fe1398
	.dc.b	$88,$04,$23,$c8,$00,$00,$2a,$38					;fe13a0
	.dc.b	$20,$79,$00,$00,$16,$94,$4f,$f9					;fe13a8
	.dc.b	$00,$00,$2e,$0e,$46,$fc,$20,$00					;fe13b0
	.dc.b	$61,$00,$03,$70,$46,$50,$43,$50					;fe13b8
	.dc.b	$20,$69,$6e,$65,$78,$61,$63,$74					;fe13c0
	.dc.b	$20,$72,$65,$73,$75,$6c,$74,$00					;fe13c8
	.dc.b	$46,$fc,$27,$00,$23,$cf,$00,$00					;fe13d0
	.dc.b	$2a,$30,$23,$c8,$00,$00,$16,$94					;fe13d8
	.dc.b	$4e,$7a,$80,$02,$23,$c8,$00,$00					;fe13e0
	.dc.b	$2a,$3c,$20,$7c,$00,$00,$08,$08					;fe13e8
	.dc.b	$4e,$7b,$80,$02,$4e,$7a,$88,$03					;fe13f0
	.dc.b	$23,$c8,$00,$00,$2a,$34,$4e,$7a					;fe13f8
	.dc.b	$88,$04,$23,$c8,$00,$00,$2a,$38					;fe1400
	.dc.b	$20,$79,$00,$00,$16,$94,$4f,$f9					;fe1408
	.dc.b	$00,$00,$2e,$0e,$46,$fc,$20,$00					;fe1410
	.dc.b	$61,$00,$03,$10,$46,$50,$43,$50					;fe1418
	.dc.b	$20,$64,$69,$76,$69,$64,$65,$20					;fe1420
	.dc.b	$62,$79,$20,$7a,$65,$72,$6f,$00					;fe1428
	.dc.b	$46,$fc,$27,$00,$23,$cf,$00,$00					;fe1430
	.dc.b	$2a,$30,$23,$c8,$00,$00,$16,$94					;fe1438
	.dc.b	$4e,$7a,$80,$02,$23,$c8,$00,$00					;fe1440
	.dc.b	$2a,$3c,$20,$7c,$00,$00,$08,$08					;fe1448
	.dc.b	$4e,$7b,$80,$02,$4e,$7a,$88,$03					;fe1450
	.dc.b	$23,$c8,$00,$00,$2a,$34,$4e,$7a					;fe1458
	.dc.b	$88,$04,$23,$c8,$00,$00,$2a,$38					;fe1460
	.dc.b	$20,$79,$00,$00,$16,$94,$4f,$f9					;fe1468
	.dc.b	$00,$00,$2e,$0e,$46,$fc,$20,$00					;fe1470
	.dc.b	$61,$00,$02,$b0,$46,$50,$43,$50					;fe1478
	.dc.b	$20,$75,$6e,$64,$65,$72,$66,$6c					;fe1480
	.dc.b	$6f,$77,$00,$00,$46,$fc,$27,$00					;fe1488
	.dc.b	$23,$cf,$00,$00,$2a,$30,$23,$c8					;fe1490
	.dc.b	$00,$00,$16,$94,$4e,$7a,$80,$02					;fe1498
	.dc.b	$23,$c8,$00,$00,$2a,$3c,$20,$7c					;fe14a0
	.dc.b	$00,$00,$08,$08,$4e,$7b,$80,$02					;fe14a8
	.dc.b	$4e,$7a,$88,$03,$23,$c8,$00,$00					;fe14b0
	.dc.b	$2a,$34,$4e,$7a,$88,$04,$23,$c8					;fe14b8
	.dc.b	$00,$00,$2a,$38,$20,$79,$00,$00					;fe14c0
	.dc.b	$16,$94,$4f,$f9,$00,$00,$2e,$0e					;fe14c8
	.dc.b	$46,$fc,$20,$00,$61,$00,$02,$54					;fe14d0
	.dc.b	$46,$50,$43,$50,$20,$6f,$70,$65					;fe14d8
	.dc.b	$72,$61,$6e,$64,$20,$65,$72,$72					;fe14e0
	.dc.b	$6f,$72,$00,$00,$46,$fc,$27,$00					;fe14e8
	.dc.b	$23,$cf,$00,$00,$2a,$30,$23,$c8					;fe14f0
	.dc.b	$00,$00,$16,$94,$4e,$7a,$80,$02					;fe14f8
	.dc.b	$23,$c8,$00,$00,$2a,$3c,$20,$7c					;fe1500
	.dc.b	$00,$00,$08,$08,$4e,$7b,$80,$02					;fe1508
	.dc.b	$4e,$7a,$88,$03,$23,$c8,$00,$00					;fe1510
	.dc.b	$2a,$34,$4e,$7a,$88,$04,$23,$c8					;fe1518
	.dc.b	$00,$00,$2a,$38,$20,$79,$00,$00					;fe1520
	.dc.b	$16,$94,$4f,$f9,$00,$00,$2e,$0e					;fe1528
	.dc.b	$46,$fc,$20,$00,$61,$00,$01,$f4					;fe1530
	.dc.b	$46,$50,$43,$50,$20,$6f,$76,$65					;fe1538
	.dc.b	$72,$66,$6c,$6f,$77,$00,$46,$fc					;fe1540
	.dc.b	$27,$00,$23,$cf,$00,$00,$2a,$30					;fe1548
	.dc.b	$23,$c8,$00,$00,$16,$94,$4e,$7a					;fe1550
	.dc.b	$80,$02,$23,$c8,$00,$00,$2a,$3c					;fe1558
	.dc.b	$20,$7c,$00,$00,$08,$08,$4e,$7b					;fe1560
	.dc.b	$80,$02,$4e,$7a,$88,$03,$23,$c8					;fe1568
	.dc.b	$00,$00,$2a,$34,$4e,$7a,$88,$04					;fe1570
	.dc.b	$23,$c8,$00,$00,$2a,$38,$20,$79					;fe1578
	.dc.b	$00,$00,$16,$94,$4f,$f9,$00,$00					;fe1580
	.dc.b	$2e,$0e,$46,$fc,$20,$00,$61,$00					;fe1588
	.dc.b	$01,$9a,$46,$50,$43,$50,$20,$73					;fe1590
	.dc.b	$69,$67,$6e,$61,$6c,$69,$6e,$67					;fe1598
	.dc.b	$20,$4e,$41,$4e,$00,$00,$46,$fc					;fe15a0
	.dc.b	$27,$00,$23,$cf,$00,$00,$2a,$30					;fe15a8
	.dc.b	$23,$c8,$00,$00,$16,$94,$4e,$7a					;fe15b0
	.dc.b	$80,$02,$23,$c8,$00,$00,$2a,$3c					;fe15b8
	.dc.b	$20,$7c,$00,$00,$08,$08,$4e,$7b					;fe15c0
	.dc.b	$80,$02,$4e,$7a,$88,$03,$23,$c8					;fe15c8
	.dc.b	$00,$00,$2a,$34,$4e,$7a,$88,$04					;fe15d0
	.dc.b	$23,$c8,$00,$00,$2a,$38,$20,$79					;fe15d8
	.dc.b	$00,$00,$16,$94,$4f,$f9,$00,$00					;fe15e0
	.dc.b	$2e,$0e,$46,$fc,$20,$00,$61,$00					;fe15e8
	.dc.b	$01,$3a,$50,$4d,$4d,$55,$20,$63					;fe15f0
	.dc.b	$6f,$6e,$66,$69,$67,$75,$72,$61					;fe15f8
	.dc.b	$74,$69,$6f,$6e,$00,$00,$46,$fc					;fe1600
	.dc.b	$27,$00,$23,$cf,$00,$00,$2a,$30					;fe1608
	.dc.b	$23,$c8,$00,$00,$16,$94,$4e,$7a					;fe1610
	.dc.b	$80,$02,$23,$c8,$00,$00,$2a,$3c					;fe1618
	.dc.b	$20,$7c,$00,$00,$08,$08,$4e,$7b					;fe1620
	.dc.b	$80,$02,$4e,$7a,$88,$03,$23,$c8					;fe1628
	.dc.b	$00,$00,$2a,$34,$4e,$7a,$88,$04					;fe1630
	.dc.b	$23,$c8,$00,$00,$2a,$38,$20,$79					;fe1638
	.dc.b	$00,$00,$16,$94,$4f,$f9,$00,$00					;fe1640
	.dc.b	$2e,$0e,$46,$fc,$20,$00,$61,$00					;fe1648
	.dc.b	$00,$da,$50,$4d,$4d,$55,$20,$69					;fe1650
	.dc.b	$6c,$6c,$65,$67,$61,$6c,$20,$6f					;fe1658
	.dc.b	$70,$65,$72,$61,$74,$69,$6f,$6e					;fe1660
	.dc.b	$00,$00,$46,$fc,$27,$00,$23,$cf					;fe1668
	.dc.b	$00,$00,$2a,$30,$23,$c8,$00,$00					;fe1670
	.dc.b	$16,$94,$4e,$7a,$80,$02,$23,$c8					;fe1678
	.dc.b	$00,$00,$2a,$3c,$20,$7c,$00,$00					;fe1680
	.dc.b	$08,$08,$4e,$7b,$80,$02,$4e,$7a					;fe1688
	.dc.b	$88,$03,$23,$c8,$00,$00,$2a,$34					;fe1690
	.dc.b	$4e,$7a,$88,$04,$23,$c8,$00,$00					;fe1698
	.dc.b	$2a,$38,$20,$79,$00,$00,$16,$94					;fe16a0
	.dc.b	$4f,$f9,$00,$00,$2e,$0e,$46,$fc					;fe16a8
	.dc.b	$20,$00,$61,$76,$50,$4d,$4d,$55					;fe16b0
	.dc.b	$20,$61,$63,$63,$65,$73,$73,$20					;fe16b8
	.dc.b	$6c,$65,$76,$65,$6c,$20,$76,$69					;fe16c0
	.dc.b	$6f,$6c,$61,$74,$69,$6f,$6e,$00					;fe16c8
Lfe16d0:									;fe16d0
	movec.l	vbr,a1					;$4e7a,$9801		;fe16d0
	cmpa.l	($06b0,a6),a1				;$b3ee,$06b0		;fe16d4
	bne.s	Lfe16dc					;$6602			;fe16d8
	rts						;$4e75			;fe16da

Lfe16dc:									;fe16dc
	move.l	a1,($06b0,a6)				;$2d49,$06b0		;fe16dc
	movem.l	d0-d7/a0/a2-a6,-(a7)			;$48e7,$ffbe		;fe16e0
	lea.l	(Lfe16fa),a0				;$41f9,$00fe,$16fa	;fe16e4
	jsr	($00fd9014)				;$4eb9,$00fd,$9014	;fe16ea
	movea.l	($06b0,a6),a1				;$226e,$06b0		;fe16f0
	movem.l	(a7)+,d0-d7/a0/a2-a6			;$4cdf,$7dff		;fe16f4
	rts						;$4e75			;fe16f8

Lfe16fa:									;fe16fa
	.dc.b	$0d,$0a								;fe16fa
	.dc.b	'Vector Base Register content is changed !!',$0d,$0a,$00,$00	;fe16fc
Lfe172a:									;fe172a
	.dc.b	$61,$00,$f2,$dc,$48,$e7,$ff,$fe					;fe172a
	.dc.b	$4d,$f9,$00,$00,$10,$00,$4e,$b9					;fe1732
	.dc.b	$00,$fd,$e3,$a6,$4e,$b9,$00,$fd					;fe173a
	.dc.b	$3f,$62,$20,$79,$00,$00,$2a,$30					;fe1742
	.dc.b	$20,$68,$00,$02,$b1,$fc,$00,$fd					;fe174a
	.dc.b	$38,$00,$65,$48,$b1,$fc,$00,$fe					;fe1752
	.dc.b	$3e,$34,$64,$40,$4c,$df,$7f,$ff					;fe175a
	.dc.b	$4d,$f9,$00,$00,$10,$00,$4e,$b9					;fe1762
	.dc.b	$00,$fd,$8e,$ce,$4e,$b9,$00,$fd					;fe176a
	.dc.b	$8e,$ce,$20,$57,$4e,$b9,$00,$fd					;fe1772
	.dc.b	$90,$14,$41,$f9,$00,$fe,$3e,$24					;fe177a
	.dc.b	$4e,$b9,$00,$fd,$90,$14,$60,$00					;fe1782
	.dc.b	$04,$4a								;fe178a
Lfe178c:									;fe178c
	.dc.b	$2e,$79,$00,$00,$2a,$44,$23,$f9					;fe178c
	.dc.b	$00,$00,$2a,$48,$00,$00,$00,$34					;fe1794
	.dc.b	$60,$2e,$4c,$df,$7f,$ff,$48,$f9					;fe179c
	.dc.b	$7f,$ff,$00,$00,$10,$56,$4a,$79					;fe17a4
	.dc.b	$00,$00,$16,$92,$67,$32,$23,$cf					;fe17ac
	.dc.b	$00,$00,$2a,$44,$23,$f9,$00,$00					;fe17b4
	.dc.b	$00,$34,$00,$00,$2a,$48,$23,$fc					;fe17bc
	.dc.b	$00,$fe,$17,$8c,$00,$00,$00,$34					;fe17c4
	.dc.b	$00,$00,$f3,$27,$f2,$39,$bc,$00					;fe17cc
	.dc.b	$00,$00,$16,$b4,$f2,$39,$f0,$ff					;fe17d4
	.dc.b	$00,$00,$28,$b0,$00,$00,$f3,$79					;fe17dc
Lfe17e4:									;fe17e4
	move.l	($00002a48).l,($00000034).l		;$23f9,$0000,$2a48,$0000,$0034	;fe17e4
	lea.l	($00001000).l,a6			;$4df9,$0000,$1000	;fe17ee
	move.l	usp,a5					;$4e6d			;fe17f4
	move.l	a5,($009a,a6)				;$2d4d,$009a		;fe17f6
	move.l	($1a3c,a6),($06a8,a6)			;$2d6e,$1a3c,$06a8	;fe17fa
	move.l	($1a30,a6),($00a2,a6)			;$2d6e,$1a30,$00a2	;fe1800
	move.l	($1a30,a6),($0092,a6)			;$2d6e,$1a30,$0092	;fe1806
	move.l	($1a34,a6),($0698,a6)			;$2d6e,$1a34,$0698	;fe180c
	move.l	($1a38,a6),($069c,a6)			;$2d6e,$1a38,$069c	;fe1812
	movea.l	($0092,a6),a0				;$206e,$0092		;fe1818
	move.w	(a0),($00a0,a6)				;$3d50,$00a0		;fe181c
	move.l	($0002,a0),($0096,a6)			;$2d68,$0002,$0096	;fe1820
	lea.l	(Lfe3bca),a0				;$41f9,$00fe,$3bca	;fe1826
	jsr	($00fd9014)				;$4eb9,$00fd,$9014	;fe182c
	movea.l	($00002e0a).l,a0			;$2079,$0000,$2e0a	;fe1832
	jsr	($00fd9014)				;$4eb9,$00fd,$9014	;fe1838
	jsr	($00fd8ece)				;$4eb9,$00fd,$8ece	;fe183e
	movea.l	($0092,a6),a4				;$286e,$0092		;fe1844
	move.w	($0006,a4),d0				;$302c,$0006		;fe1848
	lsr.w	#8,d0					;$e048			;fe184c
	lsr.w	#4,d0					;$e848			;fe184e
	tst.w	d0					;$4a40			;fe1850
	beq.s	Lfe1888					;$6734			;fe1852
	cmpi.w	#$0002,d0				;$0c40,$0002		;fe1854
	bcs.w	Lfe18e2					;$6500,$0088		;fe1858
	beq.w	Lfe18f0					;$6700,$0092		;fe185c
	cmpi.w	#$0009,d0				;$0c40,$0009		;fe1860
	beq.w	Lfe194a					;$6700,$00e4		;fe1864
	cmpi.w	#$000a,d0				;$0c40,$000a		;fe1868
	beq.w	Lfe19b0					;$6700,$0142		;fe186c
	cmpi.w	#$000b,d0				;$0c40,$000b		;fe1870
	beq.w	Lfe1b4c					;$6700,$02d6		;fe1874
	lea.l	(Lfe3bac),a0				;$41f9,$00fe,$3bac	;fe1878
	jsr	($00fd9014)				;$4eb9,$00fd,$9014	;fe187e
	bra.w	Lfe1b2e					;$6000,$02a8		;fe1884
Lfe1888:									;fe1888
	addi.l	#$00000008,($0092,a6)			;$06ae,$0000,$0008,$0092	;fe1888
	lea.l	(Lfe3be0),a0				;$41f9,$00fe,$3be0	;fe1890
	jsr	($00fd9014)				;$4eb9,$00fd,$9014	;fe1896
	move.l	($0002,a4),d1				;$222c,$0002		;fe189c
	jsr	($00fd8f4a)				;$4eb9,$00fd,$8f4a	;fe18a0
	lea.l	(Lfe3be5),a0				;$41f9,$00fe,$3be5	;fe18a6
	jsr	($00fd9014)				;$4eb9,$00fd,$9014	;fe18ac
	move.w	(a4),d1					;$3214			;fe18b2
	jsr	($00fd8f50)				;$4eb9,$00fd,$8f50	;fe18b4
	jsr	($00fd8ece)				;$4eb9,$00fd,$8ece	;fe18ba
	move.l	a4,-(a7)				;$2f0c			;fe18c0
	movea.l	($0096,a6),a5				;$2a6e,$0096		;fe18c2
	move.w	($06fa,a6),($06f6,a6)			;$3d6e,$06fa,$06f6	;fe18c6
	jsr	($00fda5b2)				;$4eb9,$00fd,$a5b2	;fe18cc
	movea.l	(a7)+,a4				;$285f			;fe18d2
	jsr	($00fd8ece)				;$4eb9,$00fd,$8ece	;fe18d4
	bsr.w	Lfe09a6					;$6100,$f0ca		;fe18da
	bra.w	Lfe1b32					;$6000,$0252		;fe18de
Lfe18e2:									;fe18e2
	lea.l	(Lfe3c22),a0				;$41f9,$00fe,$3c22	;fe18e2
	jsr	($00fd9014)				;$4eb9,$00fd,$9014	;fe18e8
	bra.s	Lfe1888					;$6098			;fe18ee
Lfe18f0:									;fe18f0
	addi.l	#$0000000c,($0092,a6)			;$06ae,$0000,$000c,$0092	;fe18f0
	lea.l	(Lfe3be0),a0				;$41f9,$00fe,$3be0	;fe18f8
	jsr	($00fd9014)				;$4eb9,$00fd,$9014	;fe18fe
	move.l	($0008,a4),d1				;$222c,$0008		;fe1904
	jsr	($00fd8f4a)				;$4eb9,$00fd,$8f4a	;fe1908
	lea.l	(Lfe3be5),a0				;$41f9,$00fe,$3be5	;fe190e
	jsr	($00fd9014)				;$4eb9,$00fd,$9014	;fe1914
	move.w	(a4),d1					;$3214			;fe191a
	jsr	($00fd8f50)				;$4eb9,$00fd,$8f50	;fe191c
	jsr	($00fd8ece)				;$4eb9,$00fd,$8ece	;fe1922
	movea.l	($0008,a4),a5				;$2a6c,$0008		;fe1928
	move.l	a4,-(a7)				;$2f0c			;fe192c
	move.w	($06fa,a6),($06f6,a6)			;$3d6e,$06fa,$06f6	;fe192e
	jsr	($00fda5b2)				;$4eb9,$00fd,$a5b2	;fe1934
	movea.l	(a7)+,a4				;$285f			;fe193a
	jsr	($00fd8ece)				;$4eb9,$00fd,$8ece	;fe193c
	bsr.w	Lfe09a6					;$6100,$f062		;fe1942
	bra.w	Lfe1b32					;$6000,$01ea		;fe1946
Lfe194a:									;fe194a
	addi.l	#$00000014,($0092,a6)			;$06ae,$0000,$0014,$0092	;fe194a
	lea.l	(Lfe3c55),a0				;$41f9,$00fe,$3c55	;fe1952
	jsr	($00fd9014)				;$4eb9,$00fd,$9014	;fe1958
	lea.l	(Lfe3be0),a0				;$41f9,$00fe,$3be0	;fe195e
	jsr	($00fd9014)				;$4eb9,$00fd,$9014	;fe1964
	move.l	($0008,a4),d1				;$222c,$0008		;fe196a
	jsr	($00fd8f4a)				;$4eb9,$00fd,$8f4a	;fe196e
	lea.l	(Lfe3be5),a0				;$41f9,$00fe,$3be5	;fe1974
	jsr	($00fd9014)				;$4eb9,$00fd,$9014	;fe197a
	move.w	(a4),d1					;$3214			;fe1980
	jsr	($00fd8f50)				;$4eb9,$00fd,$8f50	;fe1982
	jsr	($00fd8ece)				;$4eb9,$00fd,$8ece	;fe1988
	movea.l	($0008,a4),a5				;$2a6c,$0008		;fe198e
	move.l	a4,-(a7)				;$2f0c			;fe1992
	move.w	($06fa,a6),($06f6,a6)			;$3d6e,$06fa,$06f6	;fe1994
	jsr	($00fda5b2)				;$4eb9,$00fd,$a5b2	;fe199a
	movea.l	(a7)+,a4				;$285f			;fe19a0
	jsr	($00fd8ece)				;$4eb9,$00fd,$8ece	;fe19a2
	bsr.w	Lfe09a6					;$6100,$effc		;fe19a8
	bra.w	Lfe1b32					;$6000,$0184		;fe19ac
Lfe19b0:									;fe19b0
	addi.l	#$00000020,($0092,a6)			;$06ae,$0000,$0020,$0092	;fe19b0
	lea.l	(Lfe3cb5),a0				;$41f9,$00fe,$3cb5	;fe19b8
	jsr	($00fd9014)				;$4eb9,$00fd,$9014	;fe19be
Lfe19c4:									;fe19c4
	lea.l	(Lfe3beb),a0				;$41f9,$00fe,$3beb	;fe19c4
	jsr	($00fd9014)				;$4eb9,$00fd,$9014	;fe19ca
	move.l	($0010,a4),d1				;$222c,$0010		;fe19d0
	jsr	($00fd8f4a)				;$4eb9,$00fd,$8f4a	;fe19d4
	jsr	($00fd8ece)				;$4eb9,$00fd,$8ece	;fe19da
	lea.l	(Lfe3be0),a0				;$41f9,$00fe,$3be0	;fe19e0
	jsr	($00fd9014)				;$4eb9,$00fd,$9014	;fe19e6
	lea.l	($00000008).l,a0			;$41f9,$0000,$0008	;fe19ec
	movea.l	($0002,a4),a5				;$2a6c,$0002		;fe19f2
	move.w	($000a,a4),d2				;$342c,$000a		;fe19f6
	move.w	($000c,a4),d0				;$302c,$000c		;fe19fa
	btst.l	#$0f,d2					;$0802,$000f		;fe19fe
	bne.s	Lfe1a0e					;$660a			;fe1a02
	move.w	($000e,a4),d0				;$302c,$000e		;fe1a04
	btst.l	#$0e,d2					;$0802,$000e		;fe1a08
	beq.s	Lfe1a2e					;$6720			;fe1a0c
Lfe1a0e:									;fe1a0e
	cmp.w	(a5),d0					;$b055			;fe1a0e
	beq.s	Lfe1a2e					;$671c			;fe1a10
	cmp.w	-(a5),d0				;$b065			;fe1a12
	beq.s	Lfe1a2e					;$6718			;fe1a14
	cmp.w	-(a5),d0				;$b065			;fe1a16
	beq.s	Lfe1a2e					;$6714			;fe1a18
	cmp.w	-(a5),d0				;$b065			;fe1a1a
	beq.s	Lfe1a2e					;$6710			;fe1a1c
	cmp.w	-(a5),d0				;$b065			;fe1a1e
	beq.s	Lfe1a2e					;$670c			;fe1a20
	cmp.w	-(a5),d0				;$b065			;fe1a22
	beq.s	Lfe1a2e					;$6708			;fe1a24
	cmp.w	-(a5),d0				;$b065			;fe1a26
	beq.s	Lfe1a2e					;$6704			;fe1a28
	movea.l	($0002,a4),a5				;$2a6c,$0002		;fe1a2a
Lfe1a2e:									;fe1a2e
	move.l	a5,($0096,a6)				;$2d4d,$0096		;fe1a2e
	move.l	a4,-(a7)				;$2f0c			;fe1a32
	move.w	($06fa,a6),($06f6,a6)			;$3d6e,$06fa,$06f6	;fe1a34
	jsr	($00fda5b2)				;$4eb9,$00fd,$a5b2	;fe1a3a
	movea.l	(a7)+,a4				;$285f			;fe1a40
	jsr	($00fd8ece)				;$4eb9,$00fd,$8ece	;fe1a42
	bra.s	Lfe1a56					;$600c			;fe1a48
Lfe1a4a:									;fe1a4a
	lea.l	(Lfe3c89),a0				;$41f9,$00fe,$3c89	;fe1a4a
	jsr	($00fd9014)				;$4eb9,$00fd,$9014	;fe1a50
Lfe1a56:									;fe1a56
	lea.l	(Lfe3c01),a0				;$41f9,$00fe,$3c01	;fe1a56
	jsr	($00fd9014)				;$4eb9,$00fd,$9014	;fe1a5c
	move.b	#$49,d0					;$103c,$0049		;fe1a62
	btst.b	#$00,($000a,a4)				;$082c,$0000,$000a	;fe1a66
	beq.s	Lfe1a72					;$6704			;fe1a6c
	move.b	#$4e,d0					;$103c,$004e		;fe1a6e
Lfe1a72:									;fe1a72
	jsr	($00fd9004)				;$4eb9,$00fd,$9004	;fe1a72
	lea.l	(Lfe3c17),a0				;$41f9,$00fe,$3c17	;fe1a78
	jsr	($00fd9014)				;$4eb9,$00fd,$9014	;fe1a7e
	move.b	#$52,d0					;$103c,$0052		;fe1a84
	btst.b	#$06,($000b,a4)				;$082c,$0006,$000b	;fe1a88
	bne.s	Lfe1a94					;$6604			;fe1a8e
	move.b	#$57,d0					;$103c,$0057		;fe1a90
Lfe1a94:									;fe1a94
	jsr	($00fd9004)				;$4eb9,$00fd,$9004	;fe1a94
	lea.l	(Lfe3c1d),a0				;$41f9,$00fe,$3c1d	;fe1a9a
	jsr	($00fd9014)				;$4eb9,$00fd,$9014	;fe1aa0
	move.b	($000b,a4),d0				;$102c,$000b		;fe1aa6
	andi.b	#$07,d0					;$0200,$0007		;fe1aaa
	addi.b	#$30,d0					;$0600,$0030		;fe1aae
	jsr	($00fd9004)				;$4eb9,$00fd,$9004	;fe1ab2
	btst.b	#$07,($000b,a4)				;$082c,$0007,$000b	;fe1ab8
	beq.s	Lfe1acc					;$670c			;fe1abe
	lea.l	(Lfe3cfc),a0				;$41f9,$00fe,$3cfc	;fe1ac0
	jsr	($00fd9014)				;$4eb9,$00fd,$9014	;fe1ac6
Lfe1acc:									;fe1acc
	lea.l	(Lfe3d07),a0				;$41f9,$00fe,$3d07	;fe1acc
	jsr	($00fd9014)				;$4eb9,$00fd,$9014	;fe1ad2
	move.w	($000a,a4),d0				;$302c,$000a		;fe1ad8
	andi.w	#$0030,d0				;$0240,$0030		;fe1adc
	lsr.w	#4,d0					;$e848			;fe1ae0
	cmpi.w	#$0001,d0				;$0c40,$0001		;fe1ae2
	bcc.s	Lfe1af0					;$6408			;fe1ae6
	lea.l	(Lfe3d15),a0				;$41f9,$00fe,$3d15	;fe1ae8
	bra.s	Lfe1b0e					;$601e			;fe1aee
Lfe1af0:									;fe1af0
	bne.s	Lfe1afa					;$6608			;fe1af0
	lea.l	(Lfe3d1a),a0				;$41f9,$00fe,$3d1a	;fe1af2
	bra.s	Lfe1b0e					;$6014			;fe1af8
Lfe1afa:									;fe1afa
	cmpi.w	#$0002,d0				;$0c40,$0002		;fe1afa
	bne.s	Lfe1b08					;$6608			;fe1afe
	lea.l	(Lfe3d1f),a0				;$41f9,$00fe,$3d1f	;fe1b00
	bra.s	Lfe1b0e					;$6006			;fe1b06
Lfe1b08:									;fe1b08
	lea.l	(Lfe3d24),a0				;$41f9,$00fe,$3d24	;fe1b08
Lfe1b0e:									;fe1b0e
	jsr	($00fd9014)				;$4eb9,$00fd,$9014	;fe1b0e
	lea.l	(Lfe3be5),a0				;$41f9,$00fe,$3be5	;fe1b14
	jsr	($00fd9014)				;$4eb9,$00fd,$9014	;fe1b1a
	move.w	(a4),d1					;$3214			;fe1b20
	jsr	($00fd8f50)				;$4eb9,$00fd,$8f50	;fe1b22
	jsr	($00fd8ece)				;$4eb9,$00fd,$8ece	;fe1b28
Lfe1b2e:									;fe1b2e
	bsr.w	Lfe09a6					;$6100,$ee76		;fe1b2e
Lfe1b32:									;fe1b32
	move.l	($0096,a6),($0032,a6)			;$2d6e,$0096,$0032	;fe1b32
	jsr	($00fd98bc)				;$4eb9,$00fd,$98bc	;fe1b38
	movea.l	($06e8,a6),a0				;$206e,$06e8		;fe1b3e
	movec.l	a0,msp					;$4e7b,$8803		;fe1b42
	jmp	($00fd3a9a)				;$4ef9,$00fd,$3a9a	;fe1b46

Lfe1b4c:									;fe1b4c
	addi.l	#$0000005c,($0092,a6)			;$06ae,$0000,$005c,$0092	;fe1b4c
	lea.l	(Lfe3cd9),a0				;$41f9,$00fe,$3cd9	;fe1b54
	jsr	($00fd9014)				;$4eb9,$00fd,$9014	;fe1b5a
	bra.w	Lfe19c4					;$6000,$fe62		;fe1b60
Lfe1b64:									;fe1b64
	movem.l	d0-d7/a0-a6,($00001056).l		;$48f9,$7fff,$0000,$1056	;fe1b64
	lea.l	($00001000).l,a6			;$4df9,$0000,$1000	;fe1b6c
	move.l	usp,a5					;$4e6d			;fe1b72
	move.l	a5,($009a,a6)				;$2d4d,$009a		;fe1b74
	lea.l	(Lfe3bca),a0				;$41f9,$00fe,$3bca	;fe1b78
	jsr	($00fd9014)				;$4eb9,$00fd,$9014	;fe1b7e
	movea.l	(a7)+,a0				;$205f			;fe1b84
	jsr	($00fd9014)				;$4eb9,$00fd,$9014	;fe1b86
	lea.l	(Lfe3be0),a0				;$41f9,$00fe,$3be0	;fe1b8c
	jsr	($00fd9014)				;$4eb9,$00fd,$9014	;fe1b92
	move.w	(a7),($00a0,a6)				;$3d57,$00a0		;fe1b98
	move.l	($0002,a7),d1				;$222f,$0002		;fe1b9c
	move.l	d1,($0096,a6)				;$2d41,$0096		;fe1ba0
	jsr	($00fd8f4a)				;$4eb9,$00fd,$8f4a	;fe1ba4
	lea.l	(Lfe3be5),a0				;$41f9,$00fe,$3be5	;fe1baa
	jsr	($00fd9014)				;$4eb9,$00fd,$9014	;fe1bb0
	move.w	(a7),d1					;$3217			;fe1bb6
	jsr	($00fd8f50)				;$4eb9,$00fd,$8f50	;fe1bb8
	jsr	($00fd8ece)				;$4eb9,$00fd,$8ece	;fe1bbe
	move.l	a7,d0					;$200f			;fe1bc4
	addq.l	#6,d0					;$5c80			;fe1bc6
	move.l	d0,($0092,a6)				;$2d40,$0092		;fe1bc8
	bsr.w	Lfe09a6					;$6100,$edd8		;fe1bcc
	bra.w	Lfe1b32					;$6000,$ff60		;fe1bd0
Lfe1bd4:									;fe1bd4
	bsr.w	Lfe09a6					;$6100,$edd0		;fe1bd4
	move.l	($0096,a6),($0032,a6)			;$2d6e,$0096,$0032	;fe1bd8
	movea.l	($06e8,a6),a0				;$206e,$06e8		;fe1bde
	movec.l	a0,msp					;$4e7b,$8803		;fe1be2
	jmp	($00fd3a9a)				;$4ef9,$00fd,$3a9a	;fe1be6

Lfe1bec:									;fe1bec
	movem.l	a0-a3,-(a7)				;$48e7,$00f0		;fe1bec
	lea.l	($1840,a6),a1				;$43ee,$1840		;fe1bf0
	lea.l	($1850,a6),a2				;$45ee,$1850		;fe1bf4
	lea.l	($1860,a6),a3				;$47ee,$1860		;fe1bf8
	clr.l	(a3)					;$4293			;fe1bfc
	move.w	(a1),d0					;$3011			;fe1bfe
	move.w	(a2),d1					;$3212			;fe1c00
	andi.w	#$7fff,d0				;$0240,$7fff		;fe1c02
	beq.w	Lfe1d14					;$6700,$010c		;fe1c06
	andi.w	#$7fff,d1				;$0241,$7fff		;fe1c0a
	beq.w	Lfe1d14					;$6700,$0104		;fe1c0e
	add.w	d1,d0					;$d041			;fe1c12
	subi.w	#$3ffe,d0				;$0440,$3ffe		;fe1c14
	bls.w	Lfe1d14					;$6300,$00fa		;fe1c18
	cmpi.w	#$7ffe,d0				;$0c40,$7ffe		;fe1c1c
	bls.s	Lfe1c4c					;$632a			;fe1c20
	move.w	(a1),d3					;$3611			;fe1c22
	move.w	(a2),d5					;$3a12			;fe1c24
	eor.w	d3,d5					;$b745			;fe1c26
	andi.w	#$8000,d5				;$0245,$8000		;fe1c28
	ori.w	#$7ffe,d5				;$0045,$7ffe		;fe1c2c
	move.w	d5,(a3)					;$3685			;fe1c30
	move.l	#$ffffffff,($0004,a3)			;$277c,$ffff,$ffff,$0004	;fe1c32
	move.l	#$ffffffff,($0008,a3)			;$277c,$ffff,$ffff,$0008	;fe1c3a
	movem.l	(a7)+,a0-a3				;$4cdf,$0f00		;fe1c42
	ori.b	#$01,ccr				;$003c,$0001		;fe1c46
	rts						;$4e75			;fe1c4a

Lfe1c4c:									;fe1c4c
	move.w	(a1),d7					;$3e11			;fe1c4c
	move.w	(a2),d5					;$3a12			;fe1c4e
	eor.w	d5,d7					;$bb47			;fe1c50
	andi.w	#$8000,d7				;$0247,$8000		;fe1c52
	or.w	d0,d7					;$8e40			;fe1c56
	move.w	d7,(a3)					;$3687			;fe1c58
	lea.l	($1880,a6),a0				;$41ee,$1880		;fe1c5a
	clr.l	(a0)					;$4290			;fe1c5e
	clr.l	(a0)+					;$4298			;fe1c60
	clr.l	(a0)+					;$4298			;fe1c62
	clr.l	(a0)+					;$4298			;fe1c64
	clr.l	d0					;$4280			;fe1c66
	clr.l	d1					;$4281			;fe1c68
	move.l	($0004,a2),d2				;$242a,$0004		;fe1c6a
	move.l	($0008,a2),d3				;$262a,$0008		;fe1c6e
	move.l	($0008,a1),d6				;$2c29,$0008		;fe1c72
	bsr.s	Lfe1c80					;$6108			;fe1c76
	move.l	($0004,a1),d6				;$2c29,$0004		;fe1c78
	bsr.s	Lfe1c80					;$6102			;fe1c7c
	bra.s	Lfe1cc8					;$6048			;fe1c7e
Lfe1c80:									;fe1c80
	clr.w	d7					;$4247			;fe1c80
Lfe1c82:									;fe1c82
	btst.l	d7,d6					;$0f06			;fe1c82
	beq.s	Lfe1cb6					;$6730			;fe1c84
	lea.l	($1880,a6),a0				;$41ee,$1880		;fe1c86
	adda.l	#$00000010,a0				;$d1fc,$0000,$0010	;fe1c8a
	add.l	d3,-(a0)				;$d7a0			;fe1c90
	subq.l	#4,a0					;$5988			;fe1c92
	movem.l	(a0),d4					;$4cd0,$0010		;fe1c94
	addx.l	d2,d4					;$d982			;fe1c98
	movem.l	d4,(a0)					;$48d0,$0010		;fe1c9a
	subq.l	#4,a0					;$5988			;fe1c9e
	movem.l	(a0),d4					;$4cd0,$0010		;fe1ca0
	addx.l	d1,d4					;$d981			;fe1ca4
	movem.l	d4,(a0)					;$48d0,$0010		;fe1ca6
	subq.l	#4,a0					;$5988			;fe1caa
	movem.l	(a0),d4					;$4cd0,$0010		;fe1cac
	addx.l	d0,d4					;$d980			;fe1cb0
	movem.l	d4,(a0)					;$48d0,$0010		;fe1cb2
Lfe1cb6:									;fe1cb6
	add.l	d3,d3					;$d683			;fe1cb6
	addx.l	d2,d2					;$d582			;fe1cb8
	addx.l	d1,d1					;$d381			;fe1cba
	addx.l	d0,d0					;$d180			;fe1cbc
	addq.w	#1,d7					;$5247			;fe1cbe
	cmpi.w	#$0020,d7				;$0c47,$0020		;fe1cc0
	bcs.s	Lfe1c82					;$65bc			;fe1cc4
	rts						;$4e75			;fe1cc6

Lfe1cc8:									;fe1cc8
	lea.l	($1880,a6),a0				;$41ee,$1880		;fe1cc8
	clr.l	d3					;$4283			;fe1ccc
	movem.l	(a0),d0-d2				;$4cd0,$0007		;fe1cce
	addi.l	#$80000000,d2				;$0682,$8000,$0000	;fe1cd2
	addx.l	d3,d1					;$d383			;fe1cd8
	addx.l	d3,d0					;$d183			;fe1cda
	movem.l	d0-d2,(a0)				;$48d0,$0007		;fe1cdc
	btst.b	#$07,($1880,a6)				;$082e,$0007,$1880	;fe1ce0
	bne.s	Lfe1d02					;$661a			;fe1ce6
	add.l	d2,d2					;$d482			;fe1ce8
	addx.l	d1,d1					;$d381			;fe1cea
	addx.l	d0,d0					;$d180			;fe1cec
	movem.l	d0-d2,(a0)				;$48d0,$0007		;fe1cee
	move.w	(a3),d0					;$3013			;fe1cf2
	andi.w	#$7fff,d0				;$0240,$7fff		;fe1cf4
	subq.w	#1,d0					;$5340			;fe1cf8
	bls.s	Lfe1d14					;$6318			;fe1cfa
	andi.w	#$8000,(a3)				;$0253,$8000		;fe1cfc
	or.w	d0,(a3)					;$8153			;fe1d00
Lfe1d02:									;fe1d02
	lea.l	($1880,a6),a0				;$41ee,$1880		;fe1d02
	move.l	(a0)+,($0004,a3)			;$2758,$0004		;fe1d06
	move.l	(a0),($0008,a3)				;$2750,$0008		;fe1d0a
	movem.l	(a7)+,a0-a3				;$4cdf,$0f00		;fe1d0e
	rts						;$4e75			;fe1d12

Lfe1d14:									;fe1d14
	clr.l	(a3)+					;$429b			;fe1d14
	clr.l	(a3)+					;$429b			;fe1d16
	clr.l	(a3)+					;$429b			;fe1d18
	movem.l	(a7)+,a0-a3				;$4cdf,$0f00		;fe1d1a
	rts						;$4e75			;fe1d1e

Lfe1d20:									;fe1d20
	movem.l	a0-a3,-(a7)				;$48e7,$00f0		;fe1d20
	lea.l	($1840,a6),a1				;$43ee,$1840		;fe1d24
	lea.l	($1850,a6),a2				;$45ee,$1850		;fe1d28
	lea.l	($1860,a6),a3				;$47ee,$1860		;fe1d2c
	clr.l	(a3)					;$4293			;fe1d30
	move.w	(a1),d0					;$3011			;fe1d32
	move.w	(a2),d1					;$3212			;fe1d34
	andi.w	#$7fff,d0				;$0240,$7fff		;fe1d36
	beq.w	Lfe1e2c					;$6700,$00f0		;fe1d3a
	andi.w	#$7fff,d1				;$0241,$7fff		;fe1d3e
	beq.w	Lfe1e54					;$6700,$0110		;fe1d42
	move.w	(a1),d7					;$3e11			;fe1d46
	move.w	(a2),d6					;$3c12			;fe1d48
	eor.w	d6,d7					;$bd47			;fe1d4a
	andi.w	#$8000,d7				;$0247,$8000		;fe1d4c
	move.w	d7,(a3)					;$3687			;fe1d50
	move.l	($0004,a1),d5				;$2a29,$0004		;fe1d52
	move.l	($0008,a1),d6				;$2c29,$0008		;fe1d56
	move.l	($0004,a2),d3				;$262a,$0004		;fe1d5a
	move.l	($0008,a2),d4				;$282a,$0008		;fe1d5e
	cmp.l	d3,d5					;$ba83			;fe1d62
	bne.s	Lfe1d6c					;$6606			;fe1d64
	cmp.l	d4,d6					;$bc84			;fe1d66
	beq.w	Lfe1e7a					;$6700,$0110		;fe1d68
Lfe1d6c:									;fe1d6c
	sub.w	d1,d0					;$9041			;fe1d6c
	cmpi.w	#$3fff,d0				;$0c40,$3fff		;fe1d6e
	bge.w	Lfe1e5a					;$6c00,$00e6		;fe1d72
	cmpi.w	#$c001,d0				;$0c40,$c001		;fe1d76
	blt.w	Lfe1e42					;$6d00,$00c6		;fe1d7a
	addi.w	#$3fff,d0				;$0640,$3fff		;fe1d7e
	or.w	d0,d7					;$8e40			;fe1d82
	move.w	d7,(a3)					;$3687			;fe1d84
	move.l	d6,d7					;$2e06			;fe1d86
	move.l	d5,d6					;$2c05			;fe1d88
	clr.l	d5					;$4285			;fe1d8a
	movea.l	d4,a0					;$2044			;fe1d8c
	move.l	d3,d4					;$2803			;fe1d8e
	clr.l	d3					;$4283			;fe1d90
	clr.l	d0					;$4280			;fe1d92
	not.l	d0					;$4680			;fe1d94
	move.l	d0,d1					;$2200			;fe1d96
	moveq.l	#$3f,d2					;$743f			;fe1d98
Lfe1d9a:									;fe1d9a
	sub.l	a0,d7					;$9e88			;fe1d9a
	subx.l	d4,d6					;$9d84			;fe1d9c
	subx.l	d3,d5					;$9b83			;fe1d9e
Lfe1da0:									;fe1da0
	bmi.s	Lfe1dce					;$6b2c			;fe1da0
	beq.s	Lfe1db4					;$6710			;fe1da2
	add.l	d1,d1					;$d281			;fe1da4
	addx.l	d0,d0					;$d180			;fe1da6
	add.l	d7,d7					;$de87			;fe1da8
	addx.l	d6,d6					;$dd86			;fe1daa
	addx.l	d5,d5					;$db85			;fe1dac
	dbra.w	d2,Lfe1d9a				;$51ca,$ffea		;fe1dae
	bra.s	Lfe1de6					;$6032			;fe1db2
Lfe1db4:									;fe1db4
	add.l	d1,d1					;$d281			;fe1db4
	addx.l	d0,d0					;$d180			;fe1db6
	subq.w	#1,d2					;$5342			;fe1db8
	bmi.s	Lfe1de6					;$6b2a			;fe1dba
	not.l	d1					;$4681			;fe1dbc
	not.l	d0					;$4680			;fe1dbe
Lfe1dc0:									;fe1dc0
	add.l	d1,d1					;$d281			;fe1dc0
	addx.l	d0,d0					;$d180			;fe1dc2
	dbra.w	d2,Lfe1dc0				;$51ca,$fffa		;fe1dc4
	clr.l	d3					;$4283			;fe1dc8
	clr.l	d4					;$4284			;fe1dca
	bra.s	Lfe1e04					;$6036			;fe1dcc
Lfe1dce:									;fe1dce
	add.l	d1,d1					;$d281			;fe1dce
	addx.l	d0,d0					;$d180			;fe1dd0
	bset.l	#$00,d1					;$08c1,$0000		;fe1dd2
	add.l	d7,d7					;$de87			;fe1dd6
	addx.l	d6,d6					;$dd86			;fe1dd8
	addx.l	d5,d5					;$db85			;fe1dda
	add.l	a0,d7					;$de88			;fe1ddc
	addx.l	d4,d6					;$dd84			;fe1dde
	addx.l	d3,d5					;$db83			;fe1de0
	dbra.w	d2,Lfe1da0				;$51ca,$ffbc		;fe1de2
Lfe1de6:									;fe1de6
	tst.l	d5					;$4a85			;fe1de6
	bpl.s	Lfe1df0					;$6a06			;fe1de8
	add.l	a0,d7					;$de88			;fe1dea
	addx.l	d4,d6					;$dd84			;fe1dec
	addx.l	d3,d5					;$db83			;fe1dee
Lfe1df0:									;fe1df0
	move.l	d7,d4					;$2807			;fe1df0
	move.l	d6,d3					;$2606			;fe1df2
	not.l	d1					;$4681			;fe1df4
	not.l	d0					;$4680			;fe1df6
	btst.l	#$1f,d3					;$0803,$001f		;fe1df8
	beq.s	Lfe1e04					;$6706			;fe1dfc
	addq.l	#1,d1					;$5281			;fe1dfe
	bcc.s	Lfe1e04					;$6402			;fe1e00
	addq.l	#1,d0					;$5280			;fe1e02
Lfe1e04:									;fe1e04
	btst.l	#$1f,d0					;$0800,$001f		;fe1e04
	bne.s	Lfe1e1e					;$6614			;fe1e08
	add.l	d1,d1					;$d281			;fe1e0a
	addx.l	d0,d0					;$d180			;fe1e0c
	move.w	(a3),d7					;$3e13			;fe1e0e
	andi.w	#$7fff,d7				;$0247,$7fff		;fe1e10
	subq.w	#1,d7					;$5347			;fe1e14
	ble.s	Lfe1e44					;$6f2c			;fe1e16
	andi.w	#$8000,(a3)				;$0253,$8000		;fe1e18
	or.w	d7,(a3)					;$8f53			;fe1e1c
Lfe1e1e:									;fe1e1e
	move.l	d0,($0004,a3)				;$2740,$0004		;fe1e1e
	move.l	d1,($0008,a3)				;$2741,$0008		;fe1e22
	movem.l	(a7)+,a0-a3				;$4cdf,$0f00		;fe1e26
	rts						;$4e75			;fe1e2a

Lfe1e2c:									;fe1e2c
	andi.w	#$7fff,d1				;$0241,$7fff		;fe1e2c
	bne.s	Lfe1e42					;$6610			;fe1e30
	clr.w	(a3)					;$4253			;fe1e32
	clr.l	($0004,a3)				;$42ab,$0004		;fe1e34
	clr.l	($0008,a3)				;$42ab,$0008		;fe1e38
	movem.l	(a7)+,a0-a3				;$4cdf,$0f00		;fe1e3c
	rts						;$4e75			;fe1e40

Lfe1e42:									;fe1e42
	move.l	d7,d5					;$2a07			;fe1e42
Lfe1e44:									;fe1e44
	clr.w	(a3)					;$4253			;fe1e44
	clr.l	($0004,a3)				;$42ab,$0004		;fe1e46
	clr.l	($0008,a3)				;$42ab,$0008		;fe1e4a
	movem.l	(a7)+,a0-a3				;$4cdf,$0f00		;fe1e4e
	rts						;$4e75			;fe1e52

Lfe1e54:									;fe1e54
	move.w	(a1),d7					;$3e11			;fe1e54
	move.w	(a2),d6					;$3c12			;fe1e56
	eor.w	d6,d7					;$bd47			;fe1e58
Lfe1e5a:									;fe1e5a
	ori.w	#$7fff,d7				;$0047,$7fff		;fe1e5a
	move.w	d7,(a3)					;$3687			;fe1e5e
	move.l	#$ffffffff,($0004,a3)			;$277c,$ffff,$ffff,$0004	;fe1e60
	move.l	#$ffffffff,($0008,a3)			;$277c,$ffff,$ffff,$0008	;fe1e68
	ori.b	#$01,ccr				;$003c,$0001		;fe1e70
	movem.l	(a7)+,a0-a3				;$4cdf,$0f00		;fe1e74
	rts						;$4e75			;fe1e78

Lfe1e7a:									;fe1e7a
	sub.w	d1,d0					;$9041			;fe1e7a
	cmpi.w	#$3fff,d0				;$0c40,$3fff		;fe1e7c
	bgt.s	Lfe1e5a					;$6ed8			;fe1e80
	cmpi.w	#$c001,d0				;$0c40,$c001		;fe1e82
	blt.s	Lfe1e42					;$6dba			;fe1e86
	addi.w	#$3fff,d0				;$0640,$3fff		;fe1e88
	or.w	d0,d7					;$8e40			;fe1e8c
	move.w	d7,(a3)					;$3687			;fe1e8e
	move.l	#$80000000,($0004,a3)			;$277c,$8000,$0000,$0004	;fe1e90
	clr.l	($0008,a3)				;$42ab,$0008		;fe1e98
	movem.l	(a7)+,a0-a3				;$4cdf,$0f00		;fe1e9c
	rts						;$4e75			;fe1ea0

Lfe1ea2:									;fe1ea2
	lea.l	($1880,a6),a0				;$41ee,$1880		;fe1ea2
	moveq.l	#$05,d0					;$7005			;fe1ea6
	clr.l	d1					;$4281			;fe1ea8
Lfe1eaa:									;fe1eaa
	move.l	d1,(a0)+				;$20c1			;fe1eaa
	dbra.w	d0,Lfe1eaa				;$51c8,$fffc		;fe1eac
	lea.l	($1880,a6),a1				;$43ee,$1880		;fe1eb0
	clr.l	d3					;$4283			;fe1eb4
	clr.l	d5					;$4285			;fe1eb6
	clr.w	d7					;$4247			;fe1eb8
	jsr	(Lfe07c6)				;$4eb9,$00fe,$07c6	;fe1eba
	move.b	(a5),d0					;$1015			;fe1ec0
	cmpi.b	#$2b,d0					;$0c00,$002b		;fe1ec2
	beq.s	Lfe1ed2					;$670a			;fe1ec6
	cmpi.b	#$2d,d0					;$0c00,$002d		;fe1ec8
	bne.s	Lfe1ed4					;$6606			;fe1ecc
	bset.l	#$1f,d3					;$08c3,$001f		;fe1ece
Lfe1ed2:									;fe1ed2
	addq.l	#1,a5					;$528d			;fe1ed2
Lfe1ed4:									;fe1ed4
	cmpi.b	#$30,(a5)				;$0c15,$0030		;fe1ed4
	bne.s	Lfe1ede					;$6604			;fe1ed8
	addq.l	#1,a5					;$528d			;fe1eda
	bra.s	Lfe1ed4					;$60f6			;fe1edc
Lfe1ede:									;fe1ede
	move.b	(a5),d0					;$1015			;fe1ede
	cmpi.b	#$2e,d0					;$0c00,$002e		;fe1ee0
	beq.s	Lfe1f16					;$6730			;fe1ee4
	jsr	(Lfe0816)				;$4eb9,$00fe,$0816	;fe1ee6
	bcs.w	Lfe1f82					;$6500,$0094		;fe1eec
	bsr.w	Lfe2028					;$6100,$0136		;fe1ef0
	cmpi.w	#$0019,d7				;$0c47,$0019		;fe1ef4
	bhi.w	Lfe1f82					;$6200,$0088		;fe1ef8
	move.w	d3,d5					;$3a03			;fe1efc
	clr.w	d3					;$4243			;fe1efe
	move.b	(a5),d0					;$1015			;fe1f00
	cmpi.b	#$2e,d0					;$0c00,$002e		;fe1f02
	beq.s	Lfe1f24					;$671c			;fe1f06
	cmpi.b	#$45,d0					;$0c00,$0045		;fe1f08
	beq.s	Lfe1f40					;$6732			;fe1f0c
	cmpi.b	#$65,d0					;$0c00,$0065		;fe1f0e
	beq.s	Lfe1f40					;$672c			;fe1f12
	bra.s	Lfe1f88					;$6072			;fe1f14
Lfe1f16:									;fe1f16
	addq.l	#1,a5					;$528d			;fe1f16
Lfe1f18:									;fe1f18
	cmpi.b	#$30,(a5)				;$0c15,$0030		;fe1f18
	bne.s	Lfe1f26					;$6608			;fe1f1c
	subq.w	#1,d5					;$5345			;fe1f1e
	addq.l	#1,a5					;$528d			;fe1f20
	bra.s	Lfe1f18					;$60f4			;fe1f22
Lfe1f24:									;fe1f24
	addq.l	#1,a5					;$528d			;fe1f24
Lfe1f26:									;fe1f26
	bsr.w	Lfe202c					;$6100,$0104		;fe1f26
	cmpi.w	#$0019,d7				;$0c47,$0019		;fe1f2a
	bhi.s	Lfe1f82					;$6252			;fe1f2e
	clr.w	d3					;$4243			;fe1f30
	cmpi.b	#$45,d0					;$0c00,$0045		;fe1f32
	beq.s	Lfe1f40					;$6708			;fe1f36
	cmpi.b	#$65,d0					;$0c00,$0065		;fe1f38
	beq.s	Lfe1f40					;$6702			;fe1f3c
	bra.s	Lfe1f88					;$6048			;fe1f3e
Lfe1f40:									;fe1f40
	clr.w	d7					;$4247			;fe1f40
	addq.l	#1,a5					;$528d			;fe1f42
	move.b	(a5),d0					;$1015			;fe1f44
	cmpi.b	#$2b,d0					;$0c00,$002b		;fe1f46
	beq.s	Lfe1f56					;$670a			;fe1f4a
	cmpi.b	#$2d,d0					;$0c00,$002d		;fe1f4c
	bne.s	Lfe1f5a					;$6608			;fe1f50
	bset.l	#$1e,d3					;$08c3,$001e		;fe1f52
Lfe1f56:									;fe1f56
	addq.l	#1,a5					;$528d			;fe1f56
	move.b	(a5),d0					;$1015			;fe1f58
Lfe1f5a:									;fe1f5a
	jsr	(Lfe0816)				;$4eb9,$00fe,$0816	;fe1f5a
	bcs.s	Lfe1f82					;$6520			;fe1f60
	movem.l	d3/d5,-(a7)				;$48e7,$1400		;fe1f62
	bsr.w	Lfe261a					;$6100,$06b2		;fe1f66
	move.w	d6,d1					;$3206			;fe1f6a
	movem.l	(a7)+,d3/d5				;$4cdf,$0028		;fe1f6c
	cmpi.w	#$0004,d7				;$0c47,$0004		;fe1f70
	bhi.s	Lfe1f82					;$620c			;fe1f74
	btst.l	#$1e,d3					;$0803,$001e		;fe1f76
	beq.s	Lfe1f7e					;$6702			;fe1f7a
	neg.w	d1					;$4441			;fe1f7c
Lfe1f7e:									;fe1f7e
	add.w	d1,d3					;$d641			;fe1f7e
	bra.s	Lfe1f88					;$6006			;fe1f80
Lfe1f82:									;fe1f82
	ori.b	#$01,ccr				;$003c,$0001		;fe1f82
	rts						;$4e75			;fe1f86

Lfe1f88:									;fe1f88
	add.w	d5,d3					;$d645			;fe1f88
	subq.w	#1,d3					;$5343			;fe1f8a
	lea.l	($1800,a6),a0				;$41ee,$1800		;fe1f8c
	clr.l	(a0)+					;$4298			;fe1f90
	clr.l	(a0)+					;$4298			;fe1f92
	clr.l	(a0)					;$4290			;fe1f94
	lea.l	($1880,a6),a1				;$43ee,$1880		;fe1f96
	lea.l	($1800,a6),a2				;$45ee,$1800		;fe1f9a
	tst.l	d3					;$4a83			;fe1f9e
	bpl.s	Lfe1fa6					;$6a04			;fe1fa0
	bset.b	#$07,(a2)				;$08d2,$0007		;fe1fa2
Lfe1fa6:									;fe1fa6
	tst.w	d3					;$4a43			;fe1fa6
	bpl.s	Lfe1fb0					;$6a06			;fe1fa8
	bset.b	#$06,(a2)				;$08d2,$0006		;fe1faa
	neg.w	d3					;$4443			;fe1fae
Lfe1fb0:									;fe1fb0
	cmpi.w	#$1388,d3				;$0c43,$1388		;fe1fb0
	bhi.s	Lfe1f82					;$62cc			;fe1fb4
	ext.l	d3					;$48c3			;fe1fb6
	divu.w	#$03e8,d3				;$86fc,$03e8		;fe1fb8
	lsl.w	#8,d3					;$e14b			;fe1fbc
	lsl.w	#4,d3					;$e94b			;fe1fbe
	or.w	d3,($0002,a2)				;$876a,$0002		;fe1fc0
	clr.w	d3					;$4243			;fe1fc4
	swap.w	d3					;$4843			;fe1fc6
	divu.w	#$0064,d3				;$86fc,$0064		;fe1fc8
	lsl.w	#8,d3					;$e14b			;fe1fcc
	or.w	d3,(a2)					;$8752			;fe1fce
	clr.w	d3					;$4243			;fe1fd0
	swap.w	d3					;$4843			;fe1fd2
	divu.w	#$000a,d3				;$86fc,$000a		;fe1fd4
	lsl.w	#4,d3					;$e94b			;fe1fd8
	or.w	d3,(a2)					;$8752			;fe1fda
	swap.w	d3					;$4843			;fe1fdc
	or.w	d3,(a2)					;$8752			;fe1fde
	move.b	(a1)+,d0				;$1019			;fe1fe0
	andi.w	#$000f,d0				;$0240,$000f		;fe1fe2
	or.w	d0,($0002,a2)				;$816a,$0002		;fe1fe6
	addq.l	#4,a2					;$588a			;fe1fea
	bsr.s	Lfe1ffe					;$6110			;fe1fec
	move.w	d1,(a2)+				;$34c1			;fe1fee
	bsr.s	Lfe1ffe					;$610c			;fe1ff0
	move.w	d1,(a2)+				;$34c1			;fe1ff2
	bsr.s	Lfe1ffe					;$6108			;fe1ff4
	move.w	d1,(a2)+				;$34c1			;fe1ff6
	bsr.s	Lfe1ffe					;$6104			;fe1ff8
	move.w	d1,(a2)+				;$34c1			;fe1ffa
	rts						;$4e75			;fe1ffc

Lfe1ffe:									;fe1ffe
	clr.w	d1					;$4241			;fe1ffe
	move.b	(a1)+,d0				;$1019			;fe2000
	andi.w	#$000f,d0				;$0240,$000f		;fe2002
	or.w	d0,d1					;$8240			;fe2006
	move.b	(a1)+,d0				;$1019			;fe2008
	andi.w	#$000f,d0				;$0240,$000f		;fe200a
	lsl.w	#4,d1					;$e949			;fe200e
	or.w	d0,d1					;$8240			;fe2010
	move.b	(a1)+,d0				;$1019			;fe2012
	andi.w	#$000f,d0				;$0240,$000f		;fe2014
	lsl.w	#4,d1					;$e949			;fe2018
	or.w	d0,d1					;$8240			;fe201a
	move.b	(a1)+,d0				;$1019			;fe201c
	andi.w	#$000f,d0				;$0240,$000f		;fe201e
	lsl.w	#4,d1					;$e949			;fe2022
	or.w	d0,d1					;$8240			;fe2024
	rts						;$4e75			;fe2026

Lfe2028:									;fe2028
	lea.l	($1880,a6),a1				;$43ee,$1880		;fe2028
Lfe202c:									;fe202c
	move.b	(a5)+,d0				;$101d			;fe202c
	jsr	(Lfe0816)				;$4eb9,$00fe,$0816	;fe202e
	bcs.s	Lfe2046					;$6510			;fe2034
Lfe2036:									;fe2036
	move.b	d0,(a1)+				;$12c0			;fe2036
	addq.w	#1,d3					;$5243			;fe2038
	addq.w	#1,d7					;$5247			;fe203a
	move.b	(a5)+,d0				;$101d			;fe203c
	jsr	(Lfe0816)				;$4eb9,$00fe,$0816	;fe203e
	bcc.s	Lfe2036					;$64f0			;fe2044
Lfe2046:									;fe2046
	move.b	-(a5),d0				;$1025			;fe2046
	rts						;$4e75			;fe2048

Lfe204a:									;fe204a
	bsr.w	Lfe2560					;$6100,$0514		;fe204a
	bcc.s	Lfe2052					;$6402			;fe204e
	rts						;$4e75			;fe2050

Lfe2052:									;fe2052
	move.l	#$0000403e,d2				;$243c,$0000,$403e	;fe2052
	btst.l	#$1f,d5					;$0805,$001f		;fe2058
	bne.s	Lfe2084					;$6626			;fe205c
	tst.l	d5					;$4a85			;fe205e
	bne.s	Lfe2076					;$6614			;fe2060
	tst.l	d6					;$4a86			;fe2062
	bne.s	Lfe2076					;$6610			;fe2064
	move.l	a0,-(a7)				;$2f08			;fe2066
	lea.l	($1860,a6),a0				;$41ee,$1860		;fe2068
	clr.l	(a0)+					;$4298			;fe206c
	clr.l	(a0)+					;$4298			;fe206e
	clr.l	(a0)					;$4290			;fe2070
	movea.l	(a7)+,a0				;$205f			;fe2072
	rts						;$4e75			;fe2074

Lfe2076:									;fe2076
	btst.l	#$1f,d5					;$0805,$001f		;fe2076
	bne.s	Lfe2084					;$6608			;fe207a
	lsl.l	#1,d6					;$e38e			;fe207c
	roxl.l	#1,d5					;$e395			;fe207e
	subq.l	#1,d2					;$5382			;fe2080
	bra.s	Lfe2076					;$60f2			;fe2082
Lfe2084:									;fe2084
	movem.l	a0-a3,-(a7)				;$48e7,$00f0		;fe2084
	lea.l	($1860,a6),a0				;$41ee,$1860		;fe2088
	clr.l	(a0)					;$4290			;fe208c
	move.w	d2,d0					;$3002			;fe208e
	andi.w	#$7fff,d0				;$0240,$7fff		;fe2090
	move.w	d0,(a0)					;$3080			;fe2094
	move.l	d5,($0004,a0)				;$2145,$0004		;fe2096
	move.l	d6,($0008,a0)				;$2146,$0008		;fe209a
	move.l	d3,d7					;$2e03			;fe209e
	bpl.s	Lfe20a6					;$6a04			;fe20a0
	bset.b	#$07,(a0)				;$08d0,$0007		;fe20a2
Lfe20a6:									;fe20a6
	tst.w	d7					;$4a47			;fe20a6
	bmi.w	Lfe2302					;$6b00,$0258		;fe20a8
	cmpi.w	#$1344,d7				;$0c47,$1344		;fe20ac
	bcc.w	Lfe2530					;$6400,$047e		;fe20b0
	cmpi.w	#$1000,d7				;$0c47,$1000		;fe20b4
	bcs.s	Lfe20ee					;$6534			;fe20b8
	subi.w	#$1000,d7				;$0447,$1000		;fe20ba
	move.w	d7,-(a7)				;$3f07			;fe20be
	lea.l	($1850,a6),a2				;$45ee,$1850		;fe20c0
	lea.l	($1840,a6),a1				;$43ee,$1840		;fe20c4
	lea.l	($1860,a6),a3				;$47ee,$1860		;fe20c8
	move.l	(a3)+,(a1)+				;$22db			;fe20cc
	move.l	(a3)+,(a1)+				;$22db			;fe20ce
	move.l	(a3),(a1)				;$2293			;fe20d0
	move.l	#$75250000,(a2)+			;$24fc,$7525,$0000	;fe20d2
	move.l	#$c4605202,(a2)+			;$24fc,$c460,$5202	;fe20d8
	move.l	#$8a20979b,(a2)				;$24bc,$8a20,$979b	;fe20de
	bsr.w	Lfe1bec					;$6100,$fb06		;fe20e4
	bcs.w	Lfe252e					;$6500,$0444		;fe20e8
	move.w	(a7)+,d7				;$3e1f			;fe20ec
Lfe20ee:									;fe20ee
	cmpi.w	#$0800,d7				;$0c47,$0800		;fe20ee
	bcs.s	Lfe2128					;$6534			;fe20f2
	subi.w	#$0800,d7				;$0447,$0800		;fe20f4
	move.w	d7,-(a7)				;$3f07			;fe20f8
	lea.l	($1840,a6),a1				;$43ee,$1840		;fe20fa
	lea.l	($1860,a6),a3				;$47ee,$1860		;fe20fe
	move.l	(a3)+,(a1)+				;$22db			;fe2102
	move.l	(a3)+,(a1)+				;$22db			;fe2104
	move.l	(a3),(a1)				;$2293			;fe2106
	lea.l	($1850,a6),a2				;$45ee,$1850		;fe2108
	move.l	#$5a920000,(a2)+			;$24fc,$5a92,$0000	;fe210c
	move.l	#$9e8b3b5d,(a2)+			;$24fc,$9e8b,$3b5d	;fe2112
	move.l	#$c53d5de5,(a2)				;$24bc,$c53d,$5de5	;fe2118
	bsr.w	Lfe1bec					;$6100,$facc		;fe211e
	bcs.w	Lfe252e					;$6500,$040a		;fe2122
	move.w	(a7)+,d7				;$3e1f			;fe2126
Lfe2128:									;fe2128
	cmpi.w	#$0400,d7				;$0c47,$0400		;fe2128
	bcs.s	Lfe2162					;$6534			;fe212c
	subi.w	#$0400,d7				;$0447,$0400		;fe212e
	move.w	d7,-(a7)				;$3f07			;fe2132
	lea.l	($1840,a6),a1				;$43ee,$1840		;fe2134
	lea.l	($1860,a6),a3				;$47ee,$1860		;fe2138
	move.l	(a3)+,(a1)+				;$22db			;fe213c
	move.l	(a3)+,(a1)+				;$22db			;fe213e
	move.l	(a3),(a1)				;$2293			;fe2140
	lea.l	($1850,a6),a2				;$45ee,$1850		;fe2142
	move.l	#$4d480000,(a2)+			;$24fc,$4d48,$0000	;fe2146
	move.l	#$c9767586,(a2)+			;$24fc,$c976,$7586	;fe214c
	move.l	#$81750c17,(a2)				;$24bc,$8175,$0c17	;fe2152
	bsr.w	Lfe1bec					;$6100,$fa92		;fe2158
	bcs.w	Lfe252e					;$6500,$03d0		;fe215c
	move.w	(a7)+,d7				;$3e1f			;fe2160
Lfe2162:									;fe2162
	cmpi.w	#$0200,d7				;$0c47,$0200		;fe2162
	bcs.s	Lfe219c					;$6534			;fe2166
	subi.w	#$0200,d7				;$0447,$0200		;fe2168
	move.w	d7,-(a7)				;$3f07			;fe216c
	lea.l	($1840,a6),a1				;$43ee,$1840		;fe216e
	lea.l	($1860,a6),a3				;$47ee,$1860		;fe2172
	move.l	(a3)+,(a1)+				;$22db			;fe2176
	move.l	(a3)+,(a1)+				;$22db			;fe2178
	move.l	(a3),(a1)				;$2293			;fe217a
	lea.l	($1850,a6),a2				;$45ee,$1850		;fe217c
	move.l	#$46a30000,(a2)+			;$24fc,$46a3,$0000	;fe2180
	move.l	#$e319a0ae,(a2)+			;$24fc,$e319,$a0ae	;fe2186
	move.l	#$a60e91c7,(a2)				;$24bc,$a60e,$91c7	;fe218c
	bsr.w	Lfe1bec					;$6100,$fa58		;fe2192
	bcs.w	Lfe252e					;$6500,$0396		;fe2196
	move.w	(a7)+,d7				;$3e1f			;fe219a
Lfe219c:									;fe219c
	cmpi.w	#$0100,d7				;$0c47,$0100		;fe219c
	bcs.s	Lfe21d6					;$6534			;fe21a0
	subi.w	#$0100,d7				;$0447,$0100		;fe21a2
	lea.l	($1840,a6),a1				;$43ee,$1840		;fe21a6
	lea.l	($1860,a6),a3				;$47ee,$1860		;fe21aa
	move.l	(a3)+,(a1)+				;$22db			;fe21ae
	move.l	(a3)+,(a1)+				;$22db			;fe21b0
	move.l	(a3),(a1)				;$2293			;fe21b2
	move.w	d7,-(a7)				;$3f07			;fe21b4
	lea.l	($1850,a6),a2				;$45ee,$1850		;fe21b6
	move.l	#$43510000,(a2)+			;$24fc,$4351,$0000	;fe21ba
	move.l	#$aa7eebfb,(a2)+			;$24fc,$aa7e,$ebfb	;fe21c0
	move.l	#$9df9de8e,(a2)				;$24bc,$9df9,$de8e	;fe21c6
	bsr.w	Lfe1bec					;$6100,$fa1e		;fe21cc
	bcs.w	Lfe252e					;$6500,$035c		;fe21d0
	move.w	(a7)+,d7				;$3e1f			;fe21d4
Lfe21d6:									;fe21d6
	cmpi.w	#$0080,d7				;$0c47,$0080		;fe21d6
	bcs.s	Lfe2210					;$6534			;fe21da
	subi.w	#$0080,d7				;$0447,$0080		;fe21dc
	move.w	d7,-(a7)				;$3f07			;fe21e0
	lea.l	($1840,a6),a1				;$43ee,$1840		;fe21e2
	lea.l	($1860,a6),a3				;$47ee,$1860		;fe21e6
	move.l	(a3)+,(a1)+				;$22db			;fe21ea
	move.l	(a3)+,(a1)+				;$22db			;fe21ec
	move.l	(a3),(a1)				;$2293			;fe21ee
	lea.l	($1850,a6),a2				;$45ee,$1850		;fe21f0
	move.l	#$41a80000,(a2)+			;$24fc,$41a8,$0000	;fe21f4
	move.l	#$93ba47c9,(a2)+			;$24fc,$93ba,$47c9	;fe21fa
	move.l	#$80e98ce0,(a2)				;$24bc,$80e9,$8ce0	;fe2200
	bsr.w	Lfe1bec					;$6100,$f9e4		;fe2206
	bcs.w	Lfe252e					;$6500,$0322		;fe220a
	move.w	(a7)+,d7				;$3e1f			;fe220e
Lfe2210:									;fe2210
	cmpi.w	#$0040,d7				;$0c47,$0040		;fe2210
	bcs.s	Lfe224a					;$6534			;fe2214
	subi.w	#$0040,d7				;$0447,$0040		;fe2216
	move.w	d7,-(a7)				;$3f07			;fe221a
	lea.l	($1840,a6),a1				;$43ee,$1840		;fe221c
	lea.l	($1860,a6),a3				;$47ee,$1860		;fe2220
	move.l	(a3)+,(a1)+				;$22db			;fe2224
	move.l	(a3)+,(a1)+				;$22db			;fe2226
	move.l	(a3),(a1)				;$2293			;fe2228
	lea.l	($1850,a6),a2				;$45ee,$1850		;fe222a
	move.l	#$40d30000,(a2)+			;$24fc,$40d3,$0000	;fe222e
	move.l	#$c2781f49,(a2)+			;$24fc,$c278,$1f49	;fe2234
	move.l	#$ffcfa6d5,(a2)				;$24bc,$ffcf,$a6d5	;fe223a
	bsr.w	Lfe1bec					;$6100,$f9aa		;fe2240
	bcs.w	Lfe252e					;$6500,$02e8		;fe2244
	move.w	(a7)+,d7				;$3e1f			;fe2248
Lfe224a:									;fe224a
	cmpi.w	#$0020,d7				;$0c47,$0020		;fe224a
	bcs.s	Lfe2284					;$6534			;fe224e
	subi.w	#$0020,d7				;$0447,$0020		;fe2250
	move.w	d7,-(a7)				;$3f07			;fe2254
	lea.l	($1840,a6),a1				;$43ee,$1840		;fe2256
	lea.l	($1860,a6),a3				;$47ee,$1860		;fe225a
	move.l	(a3)+,(a1)+				;$22db			;fe225e
	move.l	(a3)+,(a1)+				;$22db			;fe2260
	move.l	(a3),(a1)				;$2293			;fe2262
	lea.l	($1850,a6),a2				;$45ee,$1850		;fe2264
	move.l	#$40690000,(a2)+			;$24fc,$4069,$0000	;fe2268
	move.l	#$9dc5ada8,(a2)+			;$24fc,$9dc5,$ada8	;fe226e
	move.l	#$2b70b59e,(a2)				;$24bc,$2b70,$b59e	;fe2274
	bsr.w	Lfe1bec					;$6100,$f970		;fe227a
	bcs.w	Lfe252e					;$6500,$02ae		;fe227e
	move.w	(a7)+,d7				;$3e1f			;fe2282
Lfe2284:									;fe2284
	cmpi.w	#$0010,d7				;$0c47,$0010		;fe2284
	bcs.s	Lfe22be					;$6534			;fe2288
	subi.w	#$0010,d7				;$0447,$0010		;fe228a
	move.w	d7,-(a7)				;$3f07			;fe228e
	lea.l	($1840,a6),a1				;$43ee,$1840		;fe2290
	lea.l	($1860,a6),a3				;$47ee,$1860		;fe2294
	move.l	(a3)+,(a1)+				;$22db			;fe2298
	move.l	(a3)+,(a1)+				;$22db			;fe229a
	move.l	(a3),(a1)				;$2293			;fe229c
	lea.l	($1850,a6),a2				;$45ee,$1850		;fe229e
	move.l	#$40340000,(a2)+			;$24fc,$4034,$0000	;fe22a2
	move.l	#$8e1bc9bf,(a2)+			;$24fc,$8e1b,$c9bf	;fe22a8
	move.l	#$04000000,(a2)				;$24bc,$0400,$0000	;fe22ae
	bsr.w	Lfe1bec					;$6100,$f936		;fe22b4
	bcs.w	Lfe252e					;$6500,$0274		;fe22b8
	move.w	(a7)+,d7				;$3e1f			;fe22bc
Lfe22be:									;fe22be
	cmpi.w	#$0010,d7				;$0c47,$0010		;fe22be
	bcc.w	Lfe2530					;$6400,$026c		;fe22c2
	tst.w	d7					;$4a47			;fe22c6
	beq.s	Lfe22fc					;$6732			;fe22c8
	lea.l	($1840,a6),a1				;$43ee,$1840		;fe22ca
	lea.l	($1860,a6),a3				;$47ee,$1860		;fe22ce
	move.l	(a3)+,(a1)+				;$22db			;fe22d2
	move.l	(a3)+,(a1)+				;$22db			;fe22d4
	move.l	(a3),(a1)				;$2293			;fe22d6
	lea.l	(Lfe2ea2),a3				;$47f9,$00fe,$2ea2	;fe22d8
	mulu.w	#$000c,d7				;$cefc,$000c		;fe22de
	neg.w	d7					;$4447			;fe22e2
	lea.l	($1850,a6),a2				;$45ee,$1850		;fe22e4
	move.l	(a3,d7.w),(a2)+				;$24f3,$7000		;fe22e8
	move.l	($04,a3,d7.w),(a2)+			;$24f3,$7004		;fe22ec
	move.l	($08,a3,d7.w),(a2)			;$24b3,$7008		;fe22f0
	bsr.w	Lfe1bec					;$6100,$f8f6		;fe22f4
	bcs.w	Lfe2530					;$6500,$0236		;fe22f8
Lfe22fc:									;fe22fc
	movem.l	(a7)+,a0-a3				;$4cdf,$0f00		;fe22fc
	rts						;$4e75			;fe2300

Lfe2302:									;fe2302
	neg.w	d7					;$4447			;fe2302
	cmpi.w	#$1344,d7				;$0c47,$1344		;fe2304
	bcc.w	Lfe2550					;$6400,$0246		;fe2308
	cmpi.w	#$1000,d7				;$0c47,$1000		;fe230c
	bcs.s	Lfe2342					;$6530			;fe2310
	subi.w	#$1000,d7				;$0447,$1000		;fe2312
	move.w	d7,-(a7)				;$3f07			;fe2316
	lea.l	($1840,a6),a1				;$43ee,$1840		;fe2318
	lea.l	($1860,a6),a3				;$47ee,$1860		;fe231c
	move.l	(a3)+,(a1)+				;$22db			;fe2320
	move.l	(a3)+,(a1)+				;$22db			;fe2322
	move.l	(a3),(a1)				;$2293			;fe2324
	lea.l	($1850,a6),a0				;$41ee,$1850		;fe2326
	move.l	#$0ad80000,(a0)+			;$20fc,$0ad8,$0000	;fe232a
	move.l	#$a6dd04c8,(a0)+			;$20fc,$a6dd,$04c8	;fe2330
	move.l	#$d2ce9fde,(a0)				;$20bc,$d2ce,$9fde	;fe2336
	bsr.w	Lfe1bec					;$6100,$f8ae		;fe233c
	move.w	(a7)+,d7				;$3e1f			;fe2340
Lfe2342:									;fe2342
	cmpi.w	#$0800,d7				;$0c47,$0800		;fe2342
	bcs.s	Lfe2378					;$6530			;fe2346
	subi.w	#$0800,d7				;$0447,$0800		;fe2348
	move.w	d7,-(a7)				;$3f07			;fe234c
	lea.l	($1840,a6),a1				;$43ee,$1840		;fe234e
	lea.l	($1860,a6),a3				;$47ee,$1860		;fe2352
	move.l	(a3)+,(a1)+				;$22db			;fe2356
	move.l	(a3)+,(a1)+				;$22db			;fe2358
	move.l	(a3),(a1)				;$2293			;fe235a
	lea.l	($1850,a6),a0				;$41ee,$1850		;fe235c
	move.l	#$256b0000,(a0)+			;$20fc,$256b,$0000	;fe2360
	move.l	#$ceae534f,(a0)+			;$20fc,$ceae,$534f	;fe2366
	move.l	#$34362de4,(a0)				;$20bc,$3436,$2de4	;fe236c
	bsr.w	Lfe1bec					;$6100,$f878		;fe2372
	move.w	(a7)+,d7				;$3e1f			;fe2376
Lfe2378:									;fe2378
	cmpi.w	#$0400,d7				;$0c47,$0400		;fe2378
	bcs.s	Lfe23ae					;$6530			;fe237c
	subi.w	#$0400,d7				;$0447,$0400		;fe237e
	move.w	d7,-(a7)				;$3f07			;fe2382
	lea.l	($1840,a6),a1				;$43ee,$1840		;fe2384
	lea.l	($1860,a6),a3				;$47ee,$1860		;fe2388
	move.l	(a3)+,(a1)+				;$22db			;fe238c
	move.l	(a3)+,(a1)+				;$22db			;fe238e
	move.l	(a3),(a1)				;$2293			;fe2390
	lea.l	($1850,a6),a0				;$41ee,$1850		;fe2392
	move.l	#$32b50000,(a0)+			;$20fc,$32b5,$0000	;fe2396
	move.l	#$a2a682a5,(a0)+			;$20fc,$a2a6,$82a5	;fe239c
	move.l	#$da57c0be,(a0)				;$20bc,$da57,$c0be	;fe23a2
	bsr.w	Lfe1bec					;$6100,$f842		;fe23a8
	move.w	(a7)+,d7				;$3e1f			;fe23ac
Lfe23ae:									;fe23ae
	cmpi.w	#$0200,d7				;$0c47,$0200		;fe23ae
	bcs.s	Lfe23e4					;$6530			;fe23b2
	subi.w	#$0200,d7				;$0447,$0200		;fe23b4
	move.w	d7,-(a7)				;$3f07			;fe23b8
	lea.l	($1840,a6),a1				;$43ee,$1840		;fe23ba
	lea.l	($1860,a6),a3				;$47ee,$1860		;fe23be
	move.l	(a3)+,(a1)+				;$22db			;fe23c2
	move.l	(a3)+,(a1)+				;$22db			;fe23c4
	move.l	(a3),(a1)				;$2293			;fe23c6
	lea.l	($1850,a6),a0				;$41ee,$1850		;fe23c8
	move.l	#$395a0000,(a0)+			;$20fc,$395a,$0000	;fe23cc
	move.l	#$9049ee32,(a0)+			;$20fc,$9049,$ee32	;fe23d2
	move.l	#$db23d21c,(a0)				;$20bc,$db23,$d21c	;fe23d8
	bsr.w	Lfe1bec					;$6100,$f80c		;fe23de
	move.w	(a7)+,d7				;$3e1f			;fe23e2
Lfe23e4:									;fe23e4
	cmpi.w	#$0100,d7				;$0c47,$0100		;fe23e4
	bcs.s	Lfe241a					;$6530			;fe23e8
	subi.w	#$0100,d7				;$0447,$0100		;fe23ea
	move.w	d7,-(a7)				;$3f07			;fe23ee
	lea.l	($1840,a6),a1				;$43ee,$1840		;fe23f0
	lea.l	($1860,a6),a3				;$47ee,$1860		;fe23f4
	move.l	(a3)+,(a1)+				;$22db			;fe23f8
	move.l	(a3)+,(a1)+				;$22db			;fe23fa
	move.l	(a3),(a1)				;$2293			;fe23fc
	lea.l	($1850,a6),a0				;$41ee,$1850		;fe23fe
	move.l	#$3cac0000,(a0)+			;$20fc,$3cac,$0000	;fe2402
	move.l	#$c0314325,(a0)+			;$20fc,$c031,$4325	;fe2408
	move.l	#$637a193a,(a0)				;$20bc,$637a,$193a	;fe240e
	bsr.w	Lfe1bec					;$6100,$f7d6		;fe2414
	move.w	(a7)+,d7				;$3e1f			;fe2418
Lfe241a:									;fe241a
	cmpi.w	#$0080,d7				;$0c47,$0080		;fe241a
	bcs.s	Lfe2450					;$6530			;fe241e
	subi.w	#$0080,d7				;$0447,$0080		;fe2420
	move.w	d7,-(a7)				;$3f07			;fe2424
	lea.l	($1840,a6),a1				;$43ee,$1840		;fe2426
	lea.l	($1860,a6),a3				;$47ee,$1860		;fe242a
	move.l	(a3)+,(a1)+				;$22db			;fe242e
	move.l	(a3)+,(a1)+				;$22db			;fe2430
	move.l	(a3),(a1)				;$2293			;fe2432
	lea.l	($1850,a6),a0				;$41ee,$1850		;fe2434
	move.l	#$3e550000,(a0)+			;$20fc,$3e55,$0000	;fe2438
	move.l	#$ddd0467c,(a0)+			;$20fc,$ddd0,$467c	;fe243e
	move.l	#$64bce4a0,(a0)				;$20bc,$64bc,$e4a0	;fe2444
	bsr.w	Lfe1bec					;$6100,$f7a0		;fe244a
	move.w	(a7)+,d7				;$3e1f			;fe244e
Lfe2450:									;fe2450
	cmpi.w	#$0040,d7				;$0c47,$0040		;fe2450
	bcs.s	Lfe2486					;$6530			;fe2454
	subi.w	#$0040,d7				;$0447,$0040		;fe2456
	move.w	d7,-(a7)				;$3f07			;fe245a
	lea.l	($1840,a6),a1				;$43ee,$1840		;fe245c
	lea.l	($1860,a6),a3				;$47ee,$1860		;fe2460
	move.l	(a3)+,(a1)+				;$22db			;fe2464
	move.l	(a3)+,(a1)+				;$22db			;fe2466
	move.l	(a3),(a1)				;$2293			;fe2468
	lea.l	($1850,a6),a0				;$41ee,$1850		;fe246a
	move.l	#$3f2a0000,(a0)+			;$20fc,$3f2a,$0000	;fe246e
	move.l	#$a87fea27,(a0)+			;$20fc,$a87f,$ea27	;fe2474
	move.l	#$a539e9a5,(a0)				;$20bc,$a539,$e9a5	;fe247a
	bsr.w	Lfe1bec					;$6100,$f76a		;fe2480
	move.w	(a7)+,d7				;$3e1f			;fe2484
Lfe2486:									;fe2486
	cmpi.w	#$0020,d7				;$0c47,$0020		;fe2486
	bcs.s	Lfe24bc					;$6530			;fe248a
	subi.w	#$0020,d7				;$0447,$0020		;fe248c
	move.w	d7,-(a7)				;$3f07			;fe2490
	lea.l	($1840,a6),a1				;$43ee,$1840		;fe2492
	lea.l	($1860,a6),a3				;$47ee,$1860		;fe2496
	move.l	(a3)+,(a1)+				;$22db			;fe249a
	move.l	(a3)+,(a1)+				;$22db			;fe249c
	move.l	(a3),(a1)				;$2293			;fe249e
	lea.l	($1850,a6),a0				;$41ee,$1850		;fe24a0
	move.l	#$3f940000,(a0)+			;$20fc,$3f94,$0000	;fe24a4
	move.l	#$cfb11ead,(a0)+			;$20fc,$cfb1,$1ead	;fe24aa
	move.l	#$453994ba,(a0)				;$20bc,$4539,$94ba	;fe24b0
	bsr.w	Lfe1bec					;$6100,$f734		;fe24b6
	move.w	(a7)+,d7				;$3e1f			;fe24ba
Lfe24bc:									;fe24bc
	cmpi.w	#$0010,d7				;$0c47,$0010		;fe24bc
	bcs.s	Lfe24f2					;$6530			;fe24c0
	subi.w	#$0010,d7				;$0447,$0010		;fe24c2
	move.w	d7,-(a7)				;$3f07			;fe24c6
	lea.l	($1840,a6),a1				;$43ee,$1840		;fe24c8
	lea.l	($1860,a6),a3				;$47ee,$1860		;fe24cc
	move.l	(a3)+,(a1)+				;$22db			;fe24d0
	move.l	(a3)+,(a1)+				;$22db			;fe24d2
	move.l	(a3),(a1)				;$2293			;fe24d4
	lea.l	($1850,a6),a0				;$41ee,$1850		;fe24d6
	move.l	#$3fc90000,(a0)+			;$20fc,$3fc9,$0000	;fe24da
	move.l	#$e69594be,(a0)+			;$20fc,$e695,$94be	;fe24e0
	move.l	#$c44de15b,(a0)				;$20bc,$c44d,$e15b	;fe24e6
	bsr.w	Lfe1bec					;$6100,$f6fe		;fe24ec
	move.w	(a7)+,d7				;$3e1f			;fe24f0
Lfe24f2:									;fe24f2
	cmpi.w	#$0010,d7				;$0c47,$0010		;fe24f2
	bcc.s	Lfe2550					;$6458			;fe24f6
	tst.w	d7					;$4a47			;fe24f8
	beq.s	Lfe2528					;$672c			;fe24fa
	lea.l	($1840,a6),a1				;$43ee,$1840		;fe24fc
	lea.l	($1860,a6),a3				;$47ee,$1860		;fe2500
	move.l	(a3)+,(a1)+				;$22db			;fe2504
	move.l	(a3)+,(a1)+				;$22db			;fe2506
	move.l	(a3),(a1)				;$2293			;fe2508
	lea.l	(Lfe2ea2),a3				;$47f9,$00fe,$2ea2	;fe250a
	mulu.w	#$000c,d7				;$cefc,$000c		;fe2510
	lea.l	($1850,a6),a2				;$45ee,$1850		;fe2514
	move.l	(a3,d7.w),(a2)+				;$24f3,$7000		;fe2518
	move.l	($04,a3,d7.w),(a2)+			;$24f3,$7004		;fe251c
	move.l	($08,a3,d7.w),(a2)			;$24b3,$7008		;fe2520
	bsr.w	Lfe1bec					;$6100,$f6c6		;fe2524
Lfe2528:									;fe2528
	movem.l	(a7)+,a0-a3				;$4cdf,$0f00		;fe2528
	rts						;$4e75			;fe252c

Lfe252e:									;fe252e
	move.w	(a7)+,d7				;$3e1f			;fe252e
Lfe2530:									;fe2530
	lea.l	($1860,a6),a3				;$47ee,$1860		;fe2530
	move.l	#$7ffe0000,(a3)+			;$26fc,$7ffe,$0000	;fe2534
	move.l	#$ffffffff,(a3)+			;$26fc,$ffff,$ffff	;fe253a
	move.l	#$ffffffff,(a3)+			;$26fc,$ffff,$ffff	;fe2540
	ori.b	#$01,ccr				;$003c,$0001		;fe2546
	movem.l	(a7)+,a0-a3				;$4cdf,$0f00		;fe254a
	rts						;$4e75			;fe254e

Lfe2550:									;fe2550
	lea.l	($1860,a6),a0				;$41ee,$1860		;fe2550
	clr.l	(a0)+					;$4298			;fe2554
	clr.l	(a0)+					;$4298			;fe2556
	clr.l	(a0)					;$4290			;fe2558
	movem.l	(a7)+,a0-a3				;$4cdf,$0f00		;fe255a
	rts						;$4e75			;fe255e

Lfe2560:									;fe2560
	jsr	(Lfe07c6)				;$4eb9,$00fe,$07c6	;fe2560
	clr.l	d3					;$4283			;fe2566
	clr.l	d5					;$4285			;fe2568
	clr.l	d6					;$4286			;fe256a
	clr.w	d7					;$4247			;fe256c
	move.b	(a5),d0					;$1015			;fe256e
	cmpi.b	#$2b,d0					;$0c00,$002b		;fe2570
	beq.s	Lfe2580					;$670a			;fe2574
	cmpi.b	#$2d,d0					;$0c00,$002d		;fe2576
	bne.s	Lfe2584					;$6608			;fe257a
	bset.l	#$1f,d3					;$08c3,$001f		;fe257c
Lfe2580:									;fe2580
	addq.l	#1,a5					;$528d			;fe2580
	move.b	(a5),d0					;$1015			;fe2582
Lfe2584:									;fe2584
	cmpi.b	#$2e,d0					;$0c00,$002e		;fe2584
	beq.s	Lfe25b6					;$672c			;fe2588
	jsr	(Lfe0816)				;$4eb9,$00fe,$0816	;fe258a
	bcs.w	Lfe2614					;$6500,$0082		;fe2590
	bsr.w	Lfe261a					;$6100,$0084		;fe2594
	cmpi.w	#$0013,d7				;$0c47,$0013		;fe2598
	bhi.s	Lfe2614					;$6276			;fe259c
	clr.w	d3					;$4243			;fe259e
	cmpi.b	#$2e,d0					;$0c00,$002e		;fe25a0
	beq.s	Lfe25b6					;$6710			;fe25a4
	cmpi.b	#$45,d0					;$0c00,$0045		;fe25a6
	beq.s	Lfe25d2					;$6726			;fe25aa
	cmpi.b	#$65,d0					;$0c00,$0065		;fe25ac
	beq.s	Lfe25d2					;$6720			;fe25b0
	move.w	d0,d0					;$3000			;fe25b2
	rts						;$4e75			;fe25b4

Lfe25b6:									;fe25b6
	addq.l	#1,a5					;$528d			;fe25b6
	bsr.s	Lfe2628					;$616e			;fe25b8
	cmpi.w	#$0013,d7				;$0c47,$0013		;fe25ba
	bhi.s	Lfe2614					;$6254			;fe25be
	neg.w	d3					;$4443			;fe25c0
	cmpi.b	#$45,d0					;$0c00,$0045		;fe25c2
	beq.s	Lfe25d2					;$670a			;fe25c6
	cmpi.b	#$65,d0					;$0c00,$0065		;fe25c8
	beq.s	Lfe25d2					;$6704			;fe25cc
	move.w	d0,d0					;$3000			;fe25ce
	rts						;$4e75			;fe25d0

Lfe25d2:									;fe25d2
	clr.w	d7					;$4247			;fe25d2
	addq.l	#1,a5					;$528d			;fe25d4
	move.b	(a5),d0					;$1015			;fe25d6
	cmpi.b	#$2b,d0					;$0c00,$002b		;fe25d8
	beq.s	Lfe25e8					;$670a			;fe25dc
	cmpi.b	#$2d,d0					;$0c00,$002d		;fe25de
	bne.s	Lfe25ec					;$6608			;fe25e2
	bset.l	#$1e,d3					;$08c3,$001e		;fe25e4
Lfe25e8:									;fe25e8
	addq.l	#1,a5					;$528d			;fe25e8
	move.b	(a5),d0					;$1015			;fe25ea
Lfe25ec:									;fe25ec
	jsr	(Lfe0816)				;$4eb9,$00fe,$0816	;fe25ec
	bcs.s	Lfe2614					;$6520			;fe25f2
	movem.l	d3/d5-d6,-(a7)				;$48e7,$1600		;fe25f4
	bsr.s	Lfe261a					;$6120			;fe25f8
	move.w	d6,d1					;$3206			;fe25fa
	movem.l	(a7)+,d3/d5-d6				;$4cdf,$0068		;fe25fc
	cmpi.w	#$0004,d7				;$0c47,$0004		;fe2600
	bhi.s	Lfe2614					;$620e			;fe2604
	btst.l	#$1e,d3					;$0803,$001e		;fe2606
	beq.s	Lfe260e					;$6702			;fe260a
	neg.w	d1					;$4441			;fe260c
Lfe260e:									;fe260e
	add.w	d1,d3					;$d641			;fe260e
	tst.w	d0					;$4a40			;fe2610
	rts						;$4e75			;fe2612

Lfe2614:									;fe2614
	ori.b	#$01,ccr				;$003c,$0001		;fe2614
	rts						;$4e75			;fe2618

Lfe261a:									;fe261a
	clr.l	d5					;$4285			;fe261a
	clr.l	d6					;$4286			;fe261c
Lfe261e:									;fe261e
	move.b	(a5)+,d0				;$101d			;fe261e
	cmpi.b	#$30,d0					;$0c00,$0030		;fe2620
	beq.s	Lfe261e					;$67f8			;fe2624
	bra.s	Lfe262a					;$6002			;fe2626
Lfe2628:									;fe2628
	move.b	(a5)+,d0				;$101d			;fe2628
Lfe262a:									;fe262a
	jsr	(Lfe0816)				;$4eb9,$00fe,$0816	;fe262a
	bcs.s	Lfe2662					;$6530			;fe2630
Lfe2632:									;fe2632
	add.l	d6,d6					;$dc86			;fe2632
	addx.l	d5,d5					;$db85			;fe2634
	move.l	d5,d1					;$2205			;fe2636
	move.l	d6,d2					;$2406			;fe2638
	add.l	d6,d6					;$dc86			;fe263a
	addx.l	d5,d5					;$db85			;fe263c
	add.l	d6,d6					;$dc86			;fe263e
	addx.l	d5,d5					;$db85			;fe2640
	add.l	d2,d6					;$dc82			;fe2642
	addx.l	d1,d5					;$db81			;fe2644
	subi.b	#$30,d0					;$0400,$0030		;fe2646
	ext.w	d0					;$4880			;fe264a
	ext.l	d0					;$48c0			;fe264c
	add.l	d0,d6					;$dc80			;fe264e
	clr.l	d0					;$4280			;fe2650
	addx.l	d0,d5					;$db80			;fe2652
	addq.w	#1,d3					;$5243			;fe2654
	addq.w	#1,d7					;$5247			;fe2656
	move.b	(a5)+,d0				;$101d			;fe2658
	jsr	(Lfe0816)				;$4eb9,$00fe,$0816	;fe265a
	bcc.s	Lfe2632					;$64d0			;fe2660
Lfe2662:									;fe2662
	move.b	-(a5),d0				;$1025			;fe2662
	rts						;$4e75			;fe2664

Lfe2666:									;fe2666
	movem.l	d0-d2/a0-a1,-(a7)			;$48e7,$e0c0		;fe2666
	bsr.w	Lfe2786					;$6100,$011a		;fe266a
	movem.l	(a7)+,d0-d2/a0-a1			;$4cdf,$0307		;fe266e
	move.b	($0001,a0),d7				;$1e28,$0001		;fe2672
	cmpi.b	#$3f,d7					;$0c07,$003f		;fe2676
	bne.s	Lfe268c					;$6610			;fe267a
	move.b	d7,(a1)					;$1287			;fe267c
	clr.b	($0001,a1)				;$4229,$0001		;fe267e
	lea.l	($0001,a1),a3				;$47e9,$0001		;fe2682
	ori.b	#$01,ccr				;$003c,$0001		;fe2686
	rts						;$4e75			;fe268a

Lfe268c:									;fe268c
	cmpi.b	#$30,d7					;$0c07,$0030		;fe268c
	bne.s	Lfe26a4					;$6612			;fe2690
	move.b	#$20,(a1)				;$12bc,$0020		;fe2692
	move.b	d7,($0001,a1)				;$1347,$0001		;fe2696
	clr.b	($0002,a1)				;$4229,$0002		;fe269a
	lea.l	($0002,a1),a3				;$47e9,$0002		;fe269e
	rts						;$4e75			;fe26a2

Lfe26a4:									;fe26a4
	moveq.l	#$11,d4					;$7811			;fe26a4
	lea.l	($0002,a0),a2				;$45e8,$0002		;fe26a6
	movea.l	a1,a3					;$2649			;fe26aa
	move.b	(a0),(a3)+				;$16d0			;fe26ac
	clr.w	d2					;$4242			;fe26ae
	move.b	($0015,a0),d2				;$1428,$0015		;fe26b0
	move.w	($0016,a0),d7				;$3e28,$0016		;fe26b4
	bmi.s	Lfe26e0					;$6b26			;fe26b8
	cmp.w	d4,d2					;$b444			;fe26ba
	bhi.s	Lfe270c					;$624e			;fe26bc
	move.w	d7,d0					;$3007			;fe26be
	addq.w	#1,d0					;$5240			;fe26c0
	cmp.w	d4,d0					;$b044			;fe26c2
	bhi.s	Lfe270c					;$6246			;fe26c4
Lfe26c6:									;fe26c6
	subq.w	#1,d2					;$5342			;fe26c6
	move.b	(a2)+,(a3)+				;$16da			;fe26c8
	dbra.w	d7,Lfe26c6				;$51cf,$fffa		;fe26ca
	subq.w	#1,d2					;$5342			;fe26ce
	bmi.s	Lfe26dc					;$6b0a			;fe26d0
	move.b	#$2e,(a3)+				;$16fc,$002e		;fe26d2
Lfe26d6:									;fe26d6
	move.b	(a2)+,(a3)+				;$16da			;fe26d6
	dbra.w	d2,Lfe26d6				;$51ca,$fffc		;fe26d8
Lfe26dc:									;fe26dc
	clr.b	(a3)					;$4213			;fe26dc
	rts						;$4e75			;fe26de

Lfe26e0:									;fe26e0
	move.w	d7,d0					;$3007			;fe26e0
	neg.w	d0					;$4440			;fe26e2
	move.w	d0,d1					;$3200			;fe26e4
	subq.w	#1,d0					;$5340			;fe26e6
	add.w	d2,d0					;$d042			;fe26e8
	cmp.w	d4,d0					;$b044			;fe26ea
	bhi.s	Lfe270c					;$621e			;fe26ec
	move.b	#$2e,(a3)+				;$16fc,$002e		;fe26ee
	subq.w	#2,d1					;$5541			;fe26f2
	bmi.s	Lfe26fe					;$6b08			;fe26f4
Lfe26f6:									;fe26f6
	move.b	#$30,(a3)+				;$16fc,$0030		;fe26f6
	dbra.w	d1,Lfe26f6				;$51c9,$fffa		;fe26fa
Lfe26fe:									;fe26fe
	subq.w	#1,d2					;$5342			;fe26fe
	bmi.s	Lfe270a					;$6b08			;fe2700
Lfe2702:									;fe2702
	move.b	(a2)+,(a3)+				;$16da			;fe2702
	dbra.w	d2,Lfe2702				;$51ca,$fffc		;fe2704
	clr.b	(a3)+					;$421b			;fe2708
Lfe270a:									;fe270a
	rts						;$4e75			;fe270a

Lfe270c:									;fe270c
	lea.l	($0002,a0),a2				;$45e8,$0002		;fe270c
	lea.l	($0001,a1),a3				;$47e9,$0001		;fe2710
	subq.w	#1,d4					;$5344			;fe2714
	bmi.s	Lfe2728					;$6b10			;fe2716
	move.b	(a2)+,(a3)+				;$16da			;fe2718
	subq.w	#1,d4					;$5344			;fe271a
	bmi.s	Lfe2728					;$6b0a			;fe271c
	move.b	#$2e,(a3)+				;$16fc,$002e		;fe271e
Lfe2722:									;fe2722
	move.b	(a2)+,(a3)+				;$16da			;fe2722
	dbra.w	d4,Lfe2722				;$51cc,$fffc		;fe2724
Lfe2728:									;fe2728
	bsr.w	Lfe2f7a					;$6100,$0850		;fe2728
	clr.b	(a3)					;$4213			;fe272c
	rts						;$4e75			;fe272e

Lfe2730:									;fe2730
	cmpi.w	#$0011,d4				;$0c44,$0011		;fe2730
	bcs.s	Lfe273a					;$6504			;fe2734
	moveq.l	#$11,d4					;$7811			;fe2736
	rts						;$4e75			;fe2738

Lfe273a:									;fe273a
	cmp.b	($0015,a0),d4				;$b828,$0015		;fe273a
	bcc.s	Lfe2784					;$6444			;fe273e
	lea.l	($02,a0,d4.w),a2			;$45f0,$4002		;fe2740
	move.b	d4,($0015,a0)				;$1144,$0015		;fe2744
	cmpi.b	#$35,(a2)				;$0c12,$0035		;fe2748
	bcs.s	Lfe276c					;$651e			;fe274c
	lea.l	($0002,a0),a3				;$47e8,$0002		;fe274e
Lfe2752:									;fe2752
	addq.b	#1,-(a2)				;$5222			;fe2752
	cmpi.b	#$39,(a2)				;$0c12,$0039		;fe2754
	bls.s	Lfe276c					;$6312			;fe2758
	move.b	#$30,(a2)				;$14bc,$0030		;fe275a
	cmpa.l	a3,a2					;$b5cb			;fe275e
	bhi.s	Lfe2752					;$62f0			;fe2760
	move.b	#$31,($0002,a0)				;$117c,$0031,$0002	;fe2762
	addq.w	#1,($0016,a0)				;$5268,$0016		;fe2768
Lfe276c:									;fe276c
	move.w	d4,d0					;$3004			;fe276c
	subq.w	#1,d0					;$5340			;fe276e
	ble.s	Lfe2784					;$6f12			;fe2770
	lea.l	($02,a0,d4.w),a3			;$47f0,$4002		;fe2772
Lfe2776:									;fe2776
	cmpi.b	#$30,-(a3)				;$0c23,$0030		;fe2776
	dbne.w	d0,Lfe2776				;$56c8,$fffa		;fe277a
	addq.w	#1,d0					;$5240			;fe277e
	move.b	d0,($0015,a0)				;$1140,$0015		;fe2780
Lfe2784:									;fe2784
	rts						;$4e75			;fe2784

Lfe2786:									;fe2786
	move.b	#$20,d0					;$103c,$0020		;fe2786
	move.b	d0,(a0)					;$1080			;fe278a
	move.b	d0,($0001,a0)				;$1140,$0001		;fe278c
	move.w	($1860,a6),d0				;$302e,$1860		;fe2790
	bpl.s	Lfe279a					;$6a04			;fe2794
	move.b	#$2d,(a0)				;$10bc,$002d		;fe2796
Lfe279a:									;fe279a
	andi.w	#$7fff,d0				;$0240,$7fff		;fe279a
	move.w	d0,($1860,a6)				;$3d40,$1860		;fe279e
	bne.s	Lfe27c4					;$6620			;fe27a2
	move.b	#$30,($0001,a0)				;$117c,$0030,$0001	;fe27a4
Lfe27aa:									;fe27aa
	move.b	#$01,($0015,a0)				;$117c,$0001,$0015	;fe27aa
	lea.l	($0002,a0),a2				;$45e8,$0002		;fe27b0
	moveq.l	#$11,d1					;$7211			;fe27b4
Lfe27b6:									;fe27b6
	move.b	#$30,(a2)+				;$14fc,$0030		;fe27b6
	dbra.w	d1,Lfe27b6				;$51c9,$fffa		;fe27ba
	clr.w	($0016,a0)				;$4268,$0016		;fe27be
	rts						;$4e75			;fe27c2

Lfe27c4:									;fe27c4
	cmpi.w	#$7fff,d0				;$0c40,$7fff		;fe27c4
	bne.s	Lfe27d8					;$660e			;fe27c8
	move.b	#$3f,($0001,a0)				;$117c,$003f,$0001	;fe27ca
	bsr.s	Lfe27aa					;$61d8			;fe27d0
	ori.b	#$01,ccr				;$003c,$0001		;fe27d2
	rts						;$4e75			;fe27d6

Lfe27d8:									;fe27d8
	movem.l	a0-a3,-(a7)				;$48e7,$00f0		;fe27d8
	lea.l	($1860,a6),a3				;$47ee,$1860		;fe27dc
	move.l	(a3),d5					;$2a13			;fe27e0
	andi.l	#$7fff0000,d5				;$0285,$7fff,$0000	;fe27e2
	clr.w	-(a7)					;$4267			;fe27e8
	cmpi.l	#$3fff0000,d5				;$0c85,$3fff,$0000	;fe27ea
	bcs.w	Lfe2af6					;$6500,$0304		;fe27f0
	lea.l	($1860,a6),a3				;$47ee,$1860		;fe27f4
	cmpi.l	#$75250000,(a3)				;$0c93,$7525,$0000	;fe27f8
	bcs.s	Lfe2840					;$6540			;fe27fe
	bne.s	Lfe2818					;$6616			;fe2800
	cmpi.l	#$c4605202,($0004,a3)			;$0cab,$c460,$5202,$0004	;fe2802
	bcs.s	Lfe2840					;$6534			;fe280a
	bne.s	Lfe2818					;$660a			;fe280c
	cmpi.l	#$8a20979b,($0008,a3)			;$0cab,$8a20,$979b,$0008	;fe280e
	bcs.s	Lfe2840					;$6528			;fe2816
Lfe2818:									;fe2818
	addi.w	#$1000,(a7)				;$0657,$1000		;fe2818
	lea.l	($1840,a6),a1				;$43ee,$1840		;fe281c
	lea.l	($1850,a6),a2				;$45ee,$1850		;fe2820
	move.l	#$75250000,(a2)+			;$24fc,$7525,$0000	;fe2824
	move.l	#$c4605202,(a2)+			;$24fc,$c460,$5202	;fe282a
	move.l	#$8a20979b,(a2)				;$24bc,$8a20,$979b	;fe2830
	move.l	(a3)+,(a1)+				;$22db			;fe2836
	move.l	(a3)+,(a1)+				;$22db			;fe2838
	move.l	(a3),(a1)				;$2293			;fe283a
	bsr.w	Lfe1d20					;$6100,$f4e2		;fe283c
Lfe2840:									;fe2840
	lea.l	($1860,a6),a3				;$47ee,$1860		;fe2840
	cmpi.l	#$5a920000,(a3)				;$0c93,$5a92,$0000	;fe2844
	bcs.s	Lfe288c					;$6540			;fe284a
	bne.s	Lfe2864					;$6616			;fe284c
	cmpi.l	#$9e8b3b5d,($0004,a3)			;$0cab,$9e8b,$3b5d,$0004	;fe284e
	bcs.s	Lfe288c					;$6534			;fe2856
	bne.s	Lfe2864					;$660a			;fe2858
	cmpi.l	#$c53d5de5,($0008,a3)			;$0cab,$c53d,$5de5,$0008	;fe285a
	bcs.s	Lfe288c					;$6528			;fe2862
Lfe2864:									;fe2864
	addi.w	#$0800,(a7)				;$0657,$0800		;fe2864
	lea.l	($1840,a6),a1				;$43ee,$1840		;fe2868
	lea.l	($1850,a6),a2				;$45ee,$1850		;fe286c
	move.l	#$5a920000,(a2)+			;$24fc,$5a92,$0000	;fe2870
	move.l	#$9e8b3b5d,(a2)+			;$24fc,$9e8b,$3b5d	;fe2876
	move.l	#$c53d5de5,(a2)				;$24bc,$c53d,$5de5	;fe287c
	move.l	(a3)+,(a1)+				;$22db			;fe2882
	move.l	(a3)+,(a1)+				;$22db			;fe2884
	move.l	(a3),(a1)				;$2293			;fe2886
	bsr.w	Lfe1d20					;$6100,$f496		;fe2888
Lfe288c:									;fe288c
	lea.l	($1860,a6),a3				;$47ee,$1860		;fe288c
	cmpi.l	#$4d480000,(a3)				;$0c93,$4d48,$0000	;fe2890
	bcs.s	Lfe28d8					;$6540			;fe2896
	bne.s	Lfe28b0					;$6616			;fe2898
	cmpi.l	#$c9767586,($0004,a3)			;$0cab,$c976,$7586,$0004	;fe289a
	bcs.s	Lfe28d8					;$6534			;fe28a2
	bne.s	Lfe28b0					;$660a			;fe28a4
	cmpi.l	#$81750c17,($0008,a3)			;$0cab,$8175,$0c17,$0008	;fe28a6
	bcs.s	Lfe28d8					;$6528			;fe28ae
Lfe28b0:									;fe28b0
	addi.w	#$0400,(a7)				;$0657,$0400		;fe28b0
	lea.l	($1840,a6),a1				;$43ee,$1840		;fe28b4
	lea.l	($1850,a6),a2				;$45ee,$1850		;fe28b8
	move.l	#$4d480000,(a2)+			;$24fc,$4d48,$0000	;fe28bc
	move.l	#$c9767586,(a2)+			;$24fc,$c976,$7586	;fe28c2
	move.l	#$81750c17,(a2)				;$24bc,$8175,$0c17	;fe28c8
	move.l	(a3)+,(a1)+				;$22db			;fe28ce
	move.l	(a3)+,(a1)+				;$22db			;fe28d0
	move.l	(a3),(a1)				;$2293			;fe28d2
	bsr.w	Lfe1d20					;$6100,$f44a		;fe28d4
Lfe28d8:									;fe28d8
	lea.l	($1860,a6),a3				;$47ee,$1860		;fe28d8
	cmpi.l	#$46a30000,(a3)				;$0c93,$46a3,$0000	;fe28dc
	bcs.s	Lfe2924					;$6540			;fe28e2
	bne.s	Lfe28fc					;$6616			;fe28e4
	cmpi.l	#$e319a0ae,($0004,a3)			;$0cab,$e319,$a0ae,$0004	;fe28e6
	bcs.s	Lfe2924					;$6534			;fe28ee
	bne.s	Lfe28fc					;$660a			;fe28f0
	cmpi.l	#$a60e91c7,($0008,a3)			;$0cab,$a60e,$91c7,$0008	;fe28f2
	bcs.s	Lfe2924					;$6528			;fe28fa
Lfe28fc:									;fe28fc
	addi.w	#$0200,(a7)				;$0657,$0200		;fe28fc
	lea.l	($1840,a6),a1				;$43ee,$1840		;fe2900
	lea.l	($1850,a6),a2				;$45ee,$1850		;fe2904
	move.l	#$46a30000,(a2)+			;$24fc,$46a3,$0000	;fe2908
	move.l	#$e319a0ae,(a2)+			;$24fc,$e319,$a0ae	;fe290e
	move.l	#$a60e91c7,(a2)				;$24bc,$a60e,$91c7	;fe2914
	move.l	(a3)+,(a1)+				;$22db			;fe291a
	move.l	(a3)+,(a1)+				;$22db			;fe291c
	move.l	(a3),(a1)				;$2293			;fe291e
	bsr.w	Lfe1d20					;$6100,$f3fe		;fe2920
Lfe2924:									;fe2924
	lea.l	($1860,a6),a3				;$47ee,$1860		;fe2924
	cmpi.l	#$43510000,(a3)				;$0c93,$4351,$0000	;fe2928
	bcs.s	Lfe2970					;$6540			;fe292e
	bne.s	Lfe2948					;$6616			;fe2930
	cmpi.l	#$aa7eebfb,($0004,a3)			;$0cab,$aa7e,$ebfb,$0004	;fe2932
	bcs.s	Lfe2970					;$6534			;fe293a
	bne.s	Lfe2948					;$660a			;fe293c
	cmpi.l	#$9df9de8e,($0008,a3)			;$0cab,$9df9,$de8e,$0008	;fe293e
	bcs.s	Lfe2970					;$6528			;fe2946
Lfe2948:									;fe2948
	addi.w	#$0100,(a7)				;$0657,$0100		;fe2948
	lea.l	($1840,a6),a1				;$43ee,$1840		;fe294c
	lea.l	($1850,a6),a2				;$45ee,$1850		;fe2950
	move.l	#$43510000,(a2)+			;$24fc,$4351,$0000	;fe2954
	move.l	#$aa7eebfb,(a2)+			;$24fc,$aa7e,$ebfb	;fe295a
	move.l	#$9df9de8e,(a2)				;$24bc,$9df9,$de8e	;fe2960
	move.l	(a3)+,(a1)+				;$22db			;fe2966
	move.l	(a3)+,(a1)+				;$22db			;fe2968
	move.l	(a3),(a1)				;$2293			;fe296a
	bsr.w	Lfe1d20					;$6100,$f3b2		;fe296c
Lfe2970:									;fe2970
	lea.l	($1860,a6),a3				;$47ee,$1860		;fe2970
	cmpi.l	#$41a80000,(a3)				;$0c93,$41a8,$0000	;fe2974
	bcs.s	Lfe29bc					;$6540			;fe297a
	bne.s	Lfe2994					;$6616			;fe297c
	cmpi.l	#$93ba47c9,($0004,a3)			;$0cab,$93ba,$47c9,$0004	;fe297e
	bcs.s	Lfe29bc					;$6534			;fe2986
	bne.s	Lfe2994					;$660a			;fe2988
	cmpi.l	#$80e98ce0,($0008,a3)			;$0cab,$80e9,$8ce0,$0008	;fe298a
	bcs.s	Lfe29bc					;$6528			;fe2992
Lfe2994:									;fe2994
	addi.w	#$0080,(a7)				;$0657,$0080		;fe2994
	lea.l	($1840,a6),a1				;$43ee,$1840		;fe2998
	lea.l	($1850,a6),a2				;$45ee,$1850		;fe299c
	move.l	#$41a80000,(a2)+			;$24fc,$41a8,$0000	;fe29a0
	move.l	#$93ba47c9,(a2)+			;$24fc,$93ba,$47c9	;fe29a6
	move.l	#$80e98ce0,(a2)				;$24bc,$80e9,$8ce0	;fe29ac
	move.l	(a3)+,(a1)+				;$22db			;fe29b2
	move.l	(a3)+,(a1)+				;$22db			;fe29b4
	move.l	(a3),(a1)				;$2293			;fe29b6
	bsr.w	Lfe1d20					;$6100,$f366		;fe29b8
Lfe29bc:									;fe29bc
	lea.l	($1860,a6),a3				;$47ee,$1860		;fe29bc
	cmpi.l	#$40d30000,(a3)				;$0c93,$40d3,$0000	;fe29c0
	bcs.s	Lfe2a08					;$6540			;fe29c6
	bne.s	Lfe29e0					;$6616			;fe29c8
	cmpi.l	#$c2781f49,($0004,a3)			;$0cab,$c278,$1f49,$0004	;fe29ca
	bcs.s	Lfe2a08					;$6534			;fe29d2
	bne.s	Lfe29e0					;$660a			;fe29d4
	cmpi.l	#$ffcfa6d5,($0008,a3)			;$0cab,$ffcf,$a6d5,$0008	;fe29d6
	bcs.s	Lfe2a08					;$6528			;fe29de
Lfe29e0:									;fe29e0
	addi.w	#$0040,(a7)				;$0657,$0040		;fe29e0
	lea.l	($1840,a6),a1				;$43ee,$1840		;fe29e4
	lea.l	($1850,a6),a2				;$45ee,$1850		;fe29e8
	move.l	#$40d30000,(a2)+			;$24fc,$40d3,$0000	;fe29ec
	move.l	#$c2781f49,(a2)+			;$24fc,$c278,$1f49	;fe29f2
	move.l	#$ffcfa6d5,(a2)				;$24bc,$ffcf,$a6d5	;fe29f8
	move.l	(a3)+,(a1)+				;$22db			;fe29fe
	move.l	(a3)+,(a1)+				;$22db			;fe2a00
	move.l	(a3),(a1)				;$2293			;fe2a02
	bsr.w	Lfe1d20					;$6100,$f31a		;fe2a04
Lfe2a08:									;fe2a08
	lea.l	($1860,a6),a3				;$47ee,$1860		;fe2a08
	cmpi.l	#$40690000,(a3)				;$0c93,$4069,$0000	;fe2a0c
	bcs.s	Lfe2a54					;$6540			;fe2a12
	bne.s	Lfe2a2c					;$6616			;fe2a14
	cmpi.l	#$9dc5ada8,($0004,a3)			;$0cab,$9dc5,$ada8,$0004	;fe2a16
	bcs.s	Lfe2a54					;$6534			;fe2a1e
	bne.s	Lfe2a2c					;$660a			;fe2a20
	cmpi.l	#$2b70b59e,($0008,a3)			;$0cab,$2b70,$b59e,$0008	;fe2a22
	bcs.s	Lfe2a54					;$6528			;fe2a2a
Lfe2a2c:									;fe2a2c
	addi.w	#$0020,(a7)				;$0657,$0020		;fe2a2c
	lea.l	($1840,a6),a1				;$43ee,$1840		;fe2a30
	lea.l	($1850,a6),a2				;$45ee,$1850		;fe2a34
	move.l	#$40690000,(a2)+			;$24fc,$4069,$0000	;fe2a38
	move.l	#$9dc5ada8,(a2)+			;$24fc,$9dc5,$ada8	;fe2a3e
	move.l	#$2b70b59e,(a2)				;$24bc,$2b70,$b59e	;fe2a44
	move.l	(a3)+,(a1)+				;$22db			;fe2a4a
	move.l	(a3)+,(a1)+				;$22db			;fe2a4c
	move.l	(a3),(a1)				;$2293			;fe2a4e
	bsr.w	Lfe1d20					;$6100,$f2ce		;fe2a50
Lfe2a54:									;fe2a54
	lea.l	($1860,a6),a3				;$47ee,$1860		;fe2a54
	cmpi.l	#$40340000,(a3)				;$0c93,$4034,$0000	;fe2a58
	bcs.s	Lfe2aa0					;$6540			;fe2a5e
	bne.s	Lfe2a78					;$6616			;fe2a60
	cmpi.l	#$8e1bc9bf,($0004,a3)			;$0cab,$8e1b,$c9bf,$0004	;fe2a62
	bcs.s	Lfe2aa0					;$6534			;fe2a6a
	bne.s	Lfe2a78					;$660a			;fe2a6c
	cmpi.l	#$04000000,($0008,a3)			;$0cab,$0400,$0000,$0008	;fe2a6e
	bcs.s	Lfe2aa0					;$6528			;fe2a76
Lfe2a78:									;fe2a78
	addi.w	#$0010,(a7)				;$0657,$0010		;fe2a78
	lea.l	($1840,a6),a1				;$43ee,$1840		;fe2a7c
	lea.l	($1850,a6),a2				;$45ee,$1850		;fe2a80
	move.l	#$40340000,(a2)+			;$24fc,$4034,$0000	;fe2a84
	move.l	#$8e1bc9bf,(a2)+			;$24fc,$8e1b,$c9bf	;fe2a8a
	move.l	#$04000000,(a2)				;$24bc,$0400,$0000	;fe2a90
	move.l	(a3)+,(a1)+				;$22db			;fe2a96
	move.l	(a3)+,(a1)+				;$22db			;fe2a98
	move.l	(a3),(a1)				;$2293			;fe2a9a
	bsr.w	Lfe1d20					;$6100,$f282		;fe2a9c
Lfe2aa0:									;fe2aa0
	moveq.l	#$10,d2					;$7410			;fe2aa0
	lea.l	(Lfe2dee),a0				;$41f9,$00fe,$2dee	;fe2aa2
Lfe2aa8:									;fe2aa8
	move.l	(a0)+,d3				;$2618			;fe2aa8
	move.l	(a0)+,d4				;$2818			;fe2aaa
	move.l	(a0)+,d5				;$2a18			;fe2aac
	subq.w	#1,d2					;$5342			;fe2aae
	lea.l	($1860,a6),a3				;$47ee,$1860		;fe2ab0
	cmp.l	(a3)+,d3				;$b69b			;fe2ab4
	bhi.s	Lfe2aa8					;$62f0			;fe2ab6
	bne.s	Lfe2ac4					;$660a			;fe2ab8
	cmp.l	(a3)+,d4				;$b89b			;fe2aba
	bhi.s	Lfe2aa8					;$62ea			;fe2abc
	bne.s	Lfe2ac4					;$6604			;fe2abe
	cmp.l	(a3),d5					;$ba93			;fe2ac0
	bhi.s	Lfe2aa8					;$62e4			;fe2ac2
Lfe2ac4:									;fe2ac4
	tst.w	d2					;$4a42			;fe2ac4
	beq.s	Lfe2ae6					;$671e			;fe2ac6
	add.w	d2,(a7)					;$d557			;fe2ac8
	lea.l	($1840,a6),a1				;$43ee,$1840		;fe2aca
	lea.l	($1850,a6),a2				;$45ee,$1850		;fe2ace
	lea.l	($1860,a6),a3				;$47ee,$1860		;fe2ad2
	move.l	d3,(a2)+				;$24c3			;fe2ad6
	move.l	d4,(a2)+				;$24c4			;fe2ad8
	move.l	d5,(a2)					;$2485			;fe2ada
	move.l	(a3)+,(a1)+				;$22db			;fe2adc
	move.l	(a3)+,(a1)+				;$22db			;fe2ade
	move.l	(a3),(a1)				;$2293			;fe2ae0
	bsr.w	Lfe1d20					;$6100,$f23c		;fe2ae2
Lfe2ae6:									;fe2ae6
	move.w	(a7)+,d0				;$301f			;fe2ae6
	movem.l	(a7)+,a0-a3				;$4cdf,$0f00		;fe2ae8
	move.w	d0,($0016,a0)				;$3140,$0016		;fe2aec
	bsr.w	Lfe2fb6					;$6100,$04c4		;fe2af0
	rts						;$4e75			;fe2af4

Lfe2af6:									;fe2af6
	lea.l	($1860,a6),a3				;$47ee,$1860		;fe2af6
	cmpi.l	#$0ad80000,(a3)				;$0c93,$0ad8,$0000	;fe2afa
	bhi.s	Lfe2b42					;$6240			;fe2b00
	bne.s	Lfe2b1a					;$6616			;fe2b02
	cmpi.l	#$a6dd04c8,($0004,a3)			;$0cab,$a6dd,$04c8,$0004	;fe2b04
	bhi.s	Lfe2b42					;$6234			;fe2b0c
	bne.s	Lfe2b1a					;$660a			;fe2b0e
	cmpi.l	#$d2ce9fde,($0008,a3)			;$0cab,$d2ce,$9fde,$0008	;fe2b10
	bhi.s	Lfe2b42					;$6228			;fe2b18
Lfe2b1a:									;fe2b1a
	subi.w	#$1000,(a7)				;$0457,$1000		;fe2b1a
	lea.l	($1840,a6),a1				;$43ee,$1840		;fe2b1e
	lea.l	($1850,a6),a2				;$45ee,$1850		;fe2b22
	move.l	#$0ad80000,(a2)+			;$24fc,$0ad8,$0000	;fe2b26
	move.l	#$a6dd04c8,(a2)+			;$24fc,$a6dd,$04c8	;fe2b2c
	move.l	#$d2ce9fde,(a2)				;$24bc,$d2ce,$9fde	;fe2b32
	move.l	(a3)+,(a1)+				;$22db			;fe2b38
	move.l	(a3)+,(a1)+				;$22db			;fe2b3a
	move.l	(a3),(a1)				;$2293			;fe2b3c
	bsr.w	Lfe1d20					;$6100,$f1e0		;fe2b3e
Lfe2b42:									;fe2b42
	lea.l	($1860,a6),a3				;$47ee,$1860		;fe2b42
	cmpi.l	#$256b0000,(a3)				;$0c93,$256b,$0000	;fe2b46
	bhi.s	Lfe2b8e					;$6240			;fe2b4c
	bne.s	Lfe2b66					;$6616			;fe2b4e
	cmpi.l	#$ceae534f,($0004,a3)			;$0cab,$ceae,$534f,$0004	;fe2b50
	bhi.s	Lfe2b8e					;$6234			;fe2b58
	bne.s	Lfe2b66					;$660a			;fe2b5a
	cmpi.l	#$34362de4,($0008,a3)			;$0cab,$3436,$2de4,$0008	;fe2b5c
	bhi.s	Lfe2b8e					;$6228			;fe2b64
Lfe2b66:									;fe2b66
	subi.w	#$0800,(a7)				;$0457,$0800		;fe2b66
	lea.l	($1840,a6),a1				;$43ee,$1840		;fe2b6a
	lea.l	($1850,a6),a2				;$45ee,$1850		;fe2b6e
	move.l	#$256b0000,(a2)+			;$24fc,$256b,$0000	;fe2b72
	move.l	#$ceae534f,(a2)+			;$24fc,$ceae,$534f	;fe2b78
	move.l	#$34362de4,(a2)				;$24bc,$3436,$2de4	;fe2b7e
	move.l	(a3)+,(a1)+				;$22db			;fe2b84
	move.l	(a3)+,(a1)+				;$22db			;fe2b86
	move.l	(a3),(a1)				;$2293			;fe2b88
	bsr.w	Lfe1d20					;$6100,$f194		;fe2b8a
Lfe2b8e:									;fe2b8e
	lea.l	($1860,a6),a3				;$47ee,$1860		;fe2b8e
	cmpi.l	#$32b50000,(a3)				;$0c93,$32b5,$0000	;fe2b92
	bhi.s	Lfe2bda					;$6240			;fe2b98
	bne.s	Lfe2bb2					;$6616			;fe2b9a
	cmpi.l	#$a2a682a5,($0004,a3)			;$0cab,$a2a6,$82a5,$0004	;fe2b9c
	bhi.s	Lfe2bda					;$6234			;fe2ba4
	bne.s	Lfe2bb2					;$660a			;fe2ba6
	cmpi.l	#$da57c0be,($0008,a3)			;$0cab,$da57,$c0be,$0008	;fe2ba8
	bhi.s	Lfe2bda					;$6228			;fe2bb0
Lfe2bb2:									;fe2bb2
	subi.w	#$0400,(a7)				;$0457,$0400		;fe2bb2
	lea.l	($1840,a6),a1				;$43ee,$1840		;fe2bb6
	lea.l	($1850,a6),a2				;$45ee,$1850		;fe2bba
	move.l	#$32b50000,(a2)+			;$24fc,$32b5,$0000	;fe2bbe
	move.l	#$a2a682a5,(a2)+			;$24fc,$a2a6,$82a5	;fe2bc4
	move.l	#$da57c0be,(a2)				;$24bc,$da57,$c0be	;fe2bca
	move.l	(a3)+,(a1)+				;$22db			;fe2bd0
	move.l	(a3)+,(a1)+				;$22db			;fe2bd2
	move.l	(a3),(a1)				;$2293			;fe2bd4
	bsr.w	Lfe1d20					;$6100,$f148		;fe2bd6
Lfe2bda:									;fe2bda
	lea.l	($1860,a6),a3				;$47ee,$1860		;fe2bda
	cmpi.l	#$395a0000,(a3)				;$0c93,$395a,$0000	;fe2bde
	bhi.s	Lfe2c26					;$6240			;fe2be4
	bne.s	Lfe2bfe					;$6616			;fe2be6
	cmpi.l	#$9049ee32,($0004,a3)			;$0cab,$9049,$ee32,$0004	;fe2be8
	bhi.s	Lfe2c26					;$6234			;fe2bf0
	bne.s	Lfe2bfe					;$660a			;fe2bf2
	cmpi.l	#$db23d21c,($0008,a3)			;$0cab,$db23,$d21c,$0008	;fe2bf4
	bhi.s	Lfe2c26					;$6228			;fe2bfc
Lfe2bfe:									;fe2bfe
	subi.w	#$0200,(a7)				;$0457,$0200		;fe2bfe
	lea.l	($1840,a6),a1				;$43ee,$1840		;fe2c02
	lea.l	($1850,a6),a2				;$45ee,$1850		;fe2c06
	move.l	#$395a0000,(a2)+			;$24fc,$395a,$0000	;fe2c0a
	move.l	#$9049ee32,(a2)+			;$24fc,$9049,$ee32	;fe2c10
	move.l	#$db23d21c,(a2)				;$24bc,$db23,$d21c	;fe2c16
	move.l	(a3)+,(a1)+				;$22db			;fe2c1c
	move.l	(a3)+,(a1)+				;$22db			;fe2c1e
	move.l	(a3),(a1)				;$2293			;fe2c20
	bsr.w	Lfe1d20					;$6100,$f0fc		;fe2c22
Lfe2c26:									;fe2c26
	lea.l	($1860,a6),a3				;$47ee,$1860		;fe2c26
	cmpi.l	#$3cac0000,(a3)				;$0c93,$3cac,$0000	;fe2c2a
	bhi.s	Lfe2c72					;$6240			;fe2c30
	bne.s	Lfe2c4a					;$6616			;fe2c32
	cmpi.l	#$c0314325,($0004,a3)			;$0cab,$c031,$4325,$0004	;fe2c34
	bhi.s	Lfe2c72					;$6234			;fe2c3c
	bne.s	Lfe2c4a					;$660a			;fe2c3e
	cmpi.l	#$637a193a,($0008,a3)			;$0cab,$637a,$193a,$0008	;fe2c40
	bhi.s	Lfe2c72					;$6228			;fe2c48
Lfe2c4a:									;fe2c4a
	subi.w	#$0100,(a7)				;$0457,$0100		;fe2c4a
	lea.l	($1840,a6),a1				;$43ee,$1840		;fe2c4e
	lea.l	($1850,a6),a2				;$45ee,$1850		;fe2c52
	move.l	#$3cac0000,(a2)+			;$24fc,$3cac,$0000	;fe2c56
	move.l	#$c0314325,(a2)+			;$24fc,$c031,$4325	;fe2c5c
	move.l	#$637a193a,(a2)				;$24bc,$637a,$193a	;fe2c62
	move.l	(a3)+,(a1)+				;$22db			;fe2c68
	move.l	(a3)+,(a1)+				;$22db			;fe2c6a
	move.l	(a3),(a1)				;$2293			;fe2c6c
	bsr.w	Lfe1d20					;$6100,$f0b0		;fe2c6e
Lfe2c72:									;fe2c72
	lea.l	($1860,a6),a3				;$47ee,$1860		;fe2c72
	cmpi.l	#$3e550000,(a3)				;$0c93,$3e55,$0000	;fe2c76
	bhi.s	Lfe2cbe					;$6240			;fe2c7c
	bne.s	Lfe2c96					;$6616			;fe2c7e
	cmpi.l	#$ddd0467c,($0004,a3)			;$0cab,$ddd0,$467c,$0004	;fe2c80
	bhi.s	Lfe2cbe					;$6234			;fe2c88
	bne.s	Lfe2c96					;$660a			;fe2c8a
	cmpi.l	#$64bce4a0,($0008,a3)			;$0cab,$64bc,$e4a0,$0008	;fe2c8c
	bhi.s	Lfe2cbe					;$6228			;fe2c94
Lfe2c96:									;fe2c96
	subi.w	#$0080,(a7)				;$0457,$0080		;fe2c96
	lea.l	($1840,a6),a1				;$43ee,$1840		;fe2c9a
	lea.l	($1850,a6),a2				;$45ee,$1850		;fe2c9e
	move.l	#$3e550000,(a2)+			;$24fc,$3e55,$0000	;fe2ca2
	move.l	#$ddd0467c,(a2)+			;$24fc,$ddd0,$467c	;fe2ca8
	move.l	#$64bce4a0,(a2)				;$24bc,$64bc,$e4a0	;fe2cae
	move.l	(a3)+,(a1)+				;$22db			;fe2cb4
	move.l	(a3)+,(a1)+				;$22db			;fe2cb6
	move.l	(a3),(a1)				;$2293			;fe2cb8
	bsr.w	Lfe1d20					;$6100,$f064		;fe2cba
Lfe2cbe:									;fe2cbe
	lea.l	($1860,a6),a3				;$47ee,$1860		;fe2cbe
	cmpi.l	#$3f2a0000,(a3)				;$0c93,$3f2a,$0000	;fe2cc2
	bhi.s	Lfe2d0a					;$6240			;fe2cc8
	bne.s	Lfe2ce2					;$6616			;fe2cca
	cmpi.l	#$a87fea27,($0004,a3)			;$0cab,$a87f,$ea27,$0004	;fe2ccc
	bhi.s	Lfe2d0a					;$6234			;fe2cd4
	bne.s	Lfe2ce2					;$660a			;fe2cd6
	cmpi.l	#$a539e9a5,($0008,a3)			;$0cab,$a539,$e9a5,$0008	;fe2cd8
	bhi.s	Lfe2d0a					;$6228			;fe2ce0
Lfe2ce2:									;fe2ce2
	subi.w	#$0040,(a7)				;$0457,$0040		;fe2ce2
	lea.l	($1840,a6),a1				;$43ee,$1840		;fe2ce6
	lea.l	($1850,a6),a2				;$45ee,$1850		;fe2cea
	move.l	#$3f2a0000,(a2)+			;$24fc,$3f2a,$0000	;fe2cee
	move.l	#$a87fea27,(a2)+			;$24fc,$a87f,$ea27	;fe2cf4
	move.l	#$a539e9a5,(a2)				;$24bc,$a539,$e9a5	;fe2cfa
	move.l	(a3)+,(a1)+				;$22db			;fe2d00
	move.l	(a3)+,(a1)+				;$22db			;fe2d02
	move.l	(a3),(a1)				;$2293			;fe2d04
	bsr.w	Lfe1d20					;$6100,$f018		;fe2d06
Lfe2d0a:									;fe2d0a
	lea.l	($1860,a6),a3				;$47ee,$1860		;fe2d0a
	cmpi.l	#$3f940000,(a3)				;$0c93,$3f94,$0000	;fe2d0e
	bhi.s	Lfe2d56					;$6240			;fe2d14
	bne.s	Lfe2d2e					;$6616			;fe2d16
	cmpi.l	#$cfb11ead,($0004,a3)			;$0cab,$cfb1,$1ead,$0004	;fe2d18
	bhi.s	Lfe2d56					;$6234			;fe2d20
	bne.s	Lfe2d2e					;$660a			;fe2d22
	cmpi.l	#$453994ba,($0008,a3)			;$0cab,$4539,$94ba,$0008	;fe2d24
	bhi.s	Lfe2d56					;$6228			;fe2d2c
Lfe2d2e:									;fe2d2e
	subi.w	#$0020,(a7)				;$0457,$0020		;fe2d2e
	lea.l	($1840,a6),a1				;$43ee,$1840		;fe2d32
	lea.l	($1850,a6),a2				;$45ee,$1850		;fe2d36
	move.l	#$3f940000,(a2)+			;$24fc,$3f94,$0000	;fe2d3a
	move.l	#$cfb11ead,(a2)+			;$24fc,$cfb1,$1ead	;fe2d40
	move.l	#$453994ba,(a2)				;$24bc,$4539,$94ba	;fe2d46
	move.l	(a3)+,(a1)+				;$22db			;fe2d4c
	move.l	(a3)+,(a1)+				;$22db			;fe2d4e
	move.l	(a3),(a1)				;$2293			;fe2d50
	bsr.w	Lfe1d20					;$6100,$efcc		;fe2d52
Lfe2d56:									;fe2d56
	lea.l	($1860,a6),a3				;$47ee,$1860		;fe2d56
	cmpi.l	#$3fc90000,(a3)				;$0c93,$3fc9,$0000	;fe2d5a
	bhi.s	Lfe2da2					;$6240			;fe2d60
	bne.s	Lfe2d7a					;$6616			;fe2d62
	cmpi.l	#$e69594be,($0004,a3)			;$0cab,$e695,$94be,$0004	;fe2d64
	bhi.s	Lfe2da2					;$6234			;fe2d6c
	bne.s	Lfe2d7a					;$660a			;fe2d6e
	cmpi.l	#$c44de15b,($0008,a3)			;$0cab,$c44d,$e15b,$0008	;fe2d70
	bhi.s	Lfe2da2					;$6228			;fe2d78
Lfe2d7a:									;fe2d7a
	subi.w	#$0010,(a7)				;$0457,$0010		;fe2d7a
	lea.l	($1840,a6),a1				;$43ee,$1840		;fe2d7e
	lea.l	($1850,a6),a2				;$45ee,$1850		;fe2d82
	move.l	#$3fc90000,(a2)+			;$24fc,$3fc9,$0000	;fe2d86
	move.l	#$e69594be,(a2)+			;$24fc,$e695,$94be	;fe2d8c
	move.l	#$c44de15b,(a2)				;$24bc,$c44d,$e15b	;fe2d92
	move.l	(a3)+,(a1)+				;$22db			;fe2d98
	move.l	(a3)+,(a1)+				;$22db			;fe2d9a
	move.l	(a3),(a1)				;$2293			;fe2d9c
	bsr.w	Lfe1d20					;$6100,$ef80		;fe2d9e
Lfe2da2:									;fe2da2
	moveq.l	#$ff,d2					;$74ff			;fe2da2
	lea.l	(Lfe2ea2),a0				;$41f9,$00fe,$2ea2	;fe2da4
Lfe2daa:									;fe2daa
	move.l	(a0)+,d3				;$2618			;fe2daa
	move.l	(a0)+,d4				;$2818			;fe2dac
	move.l	(a0)+,d5				;$2a18			;fe2dae
	addq.w	#1,d2					;$5242			;fe2db0
	lea.l	($1860,a6),a3				;$47ee,$1860		;fe2db2
	cmp.l	(a3)+,d3				;$b69b			;fe2db6
	bcs.s	Lfe2dc6					;$650c			;fe2db8
	bne.s	Lfe2daa					;$66ee			;fe2dba
	cmp.l	(a3)+,d4				;$b89b			;fe2dbc
	bcs.s	Lfe2dc6					;$6506			;fe2dbe
	bne.s	Lfe2daa					;$66e8			;fe2dc0
	cmp.l	(a3),d5					;$ba93			;fe2dc2
	bhi.s	Lfe2daa					;$62e4			;fe2dc4
Lfe2dc6:									;fe2dc6
	tst.w	d2					;$4a42			;fe2dc6
	beq.w	Lfe2ae6					;$6700,$fd1c		;fe2dc8
	sub.w	d2,(a7)					;$9557			;fe2dcc
	lea.l	($1850,a6),a2				;$45ee,$1850		;fe2dce
	move.l	d3,(a2)+				;$24c3			;fe2dd2
	move.l	d4,(a2)+				;$24c4			;fe2dd4
	move.l	d5,(a2)					;$2485			;fe2dd6
	lea.l	($1840,a6),a1				;$43ee,$1840		;fe2dd8
	lea.l	($1860,a6),a3				;$47ee,$1860		;fe2ddc
	move.l	(a3)+,(a1)+				;$22db			;fe2de0
	move.l	(a3)+,(a1)+				;$22db			;fe2de2
	move.l	(a3),(a1)				;$2293			;fe2de4
	bsr.w	Lfe1d20					;$6100,$ef38		;fe2de6
	bra.w	Lfe2ae6					;$6000,$fcfa		;fe2dea
Lfe2dee:									;fe2dee
	.dc.b	$40,$30,$00,$00,$e3,$5f,$a9,$31					;fe2dee
	.dc.b	$a0,$00,$00,$05,$40,$2d,$00,$00					;fe2df6
	.dc.b	$b5,$e6,$20,$f4,$80,$00,$00,$0a					;fe2dfe
	.dc.b	$40,$2a,$00,$00,$91,$84,$e7,$29					;fe2e06
	.dc.b	$ff,$ff,$ff,$f9,$40,$26,$00,$00					;fe2e0e
	.dc.b	$e8,$d4,$a5,$10,$00,$00,$00,$08					;fe2e16
	.dc.b	$40,$23,$00,$00,$ba,$43,$b7,$40					;fe2e1e
	.dc.b	$00,$00,$00,$14,$40,$20,$00,$00					;fe2e26
	.dc.b	$95,$02,$f8,$ff,$ff,$ff,$ff,$f9					;fe2e2e
	.dc.b	$40,$1c,$00,$00,$ee,$6b,$28,$00					;fe2e36
	.dc.b	$00,$00,$00,$01,$40,$19,$00,$00					;fe2e3e
	.dc.b	$be,$bc,$20,$00,$00,$00,$00,$08					;fe2e46
	.dc.b	$40,$16,$00,$00,$98,$96,$7f,$ff					;fe2e4e
	.dc.b	$ff,$ff,$ff,$fd,$40,$12,$00,$00					;fe2e56
	.dc.b	$f4,$24,$00,$00,$00,$00,$00,$03					;fe2e5e
	.dc.b	$40,$0f,$00,$00,$c3,$50,$00,$00					;fe2e66
	.dc.b	$00,$00,$00,$0d,$40,$0c,$00,$00					;fe2e6e
	.dc.b	$9c,$3f,$ff,$ff,$ff,$ff,$ff,$ff					;fe2e76
	.dc.b	$40,$08,$00,$00,$fa,$00,$00,$00					;fe2e7e
	.dc.b	$00,$00,$00,$01,$40,$05,$00,$00					;fe2e86
	.dc.b	$c8,$00,$00,$00,$00,$00,$00,$07					;fe2e8e
	.dc.b	$40,$02,$00,$00,$a0,$00,$00,$00					;fe2e96
	.dc.b	$00,$00,$00,$00							;fe2e9e
Lfe2ea2:									;fe2ea2
	.dc.b	$3f,$ff,$00,$00,$80,$00,$00,$00					;fe2ea2
	.dc.b	$00,$00,$00,$00,$3f,$fb,$00,$00					;fe2eaa
	.dc.b	$cc,$cc,$cc,$cc,$cc,$cc,$cc,$cd					;fe2eb2
	.dc.b	$3f,$f8,$00,$00,$a3,$d7,$0a,$3d					;fe2eba
	.dc.b	$70,$a3,$d7,$04,$3f,$f5,$00,$00					;fe2ec2
	.dc.b	$83,$12,$6e,$97,$8d,$4f,$df,$3b					;fe2eca
	.dc.b	$3f,$f1,$00,$00,$d1,$b7,$17,$58					;fe2ed2
	.dc.b	$e2,$19,$65,$2c,$3f,$ee,$00,$00					;fe2eda
	.dc.b	$a7,$c5,$ac,$47,$1b,$47,$84,$17					;fe2ee2
	.dc.b	$3f,$eb,$00,$00,$86,$37,$bd,$05					;fe2eea
	.dc.b	$af,$6c,$69,$b4,$3f,$e7,$00,$00					;fe2ef2
	.dc.b	$d6,$bf,$94,$d5,$e5,$7a,$42,$c0					;fe2efa
	.dc.b	$3f,$e4,$00,$00,$ab,$cc,$77,$11					;fe2f02
	.dc.b	$84,$61,$ce,$f6,$3f,$e1,$00,$00					;fe2f0a
	.dc.b	$89,$70,$5f,$41,$36,$b4,$a5,$96					;fe2f12
	.dc.b	$3f,$dd,$00,$00,$db,$e6,$fe,$ce					;fe2f1a
	.dc.b	$bd,$ed,$d5,$c8,$3f,$da,$00,$00					;fe2f22
	.dc.b	$af,$eb,$ff,$0b,$cb,$24,$aa,$ec					;fe2f2a
	.dc.b	$3f,$d7,$00,$00,$8c,$bc,$cc,$09					;fe2f32
	.dc.b	$6f,$50,$88,$c7,$3f,$d3,$00,$00					;fe2f3a
	.dc.b	$e1,$2e,$13,$42,$4b,$b4,$0e,$1d					;fe2f42
	.dc.b	$3f,$d0,$00,$00,$b4,$24,$dc,$35					;fe2f4a
	.dc.b	$09,$5c,$d8,$05,$3f,$cd,$00,$00					;fe2f52
	.dc.b	$90,$1d,$7c,$f7,$3a,$b0,$ac,$d6					;fe2f5a
	.dc.b	$3f,$c9,$00,$00,$e6,$95,$94,$be					;fe2f62
	.dc.b	$c4,$4d,$e1,$5e,$00,$00,$00,$00					;fe2f6a
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00					;fe2f72
Lfe2f7a:									;fe2f7a
	move.b	#$45,(a3)+				;$16fc,$0045		;fe2f7a
	move.w	($0016,a0),d2				;$3428,$0016		;fe2f7e
	move.b	#$2b,d0					;$103c,$002b		;fe2f82
	tst.w	d2					;$4a42			;fe2f86
	bpl.s	Lfe2f90					;$6a06			;fe2f88
	move.b	#$2d,d0					;$103c,$002d		;fe2f8a
	neg.w	d2					;$4442			;fe2f8e
Lfe2f90:									;fe2f90
	move.b	d0,(a3)+				;$16c0			;fe2f90
	moveq.l	#$0a,d0					;$700a			;fe2f92
	moveq.l	#$03,d1					;$7203			;fe2f94
	swap.w	d2					;$4842			;fe2f96
Lfe2f98:									;fe2f98
	clr.w	d2					;$4242			;fe2f98
	swap.w	d2					;$4842			;fe2f9a
	divu.w	d0,d2					;$84c0			;fe2f9c
	swap.w	d2					;$4842			;fe2f9e
	move.w	d2,-(a7)				;$3f02			;fe2fa0
	dbra.w	d1,Lfe2f98				;$51c9,$fff4		;fe2fa2
	moveq.l	#$03,d1					;$7203			;fe2fa6
Lfe2fa8:									;fe2fa8
	move.w	(a7)+,d2				;$341f			;fe2fa8
	addi.b	#$30,d2					;$0602,$0030		;fe2faa
	move.b	d2,(a3)+				;$16c2			;fe2fae
	dbra.w	d1,Lfe2fa8				;$51c9,$fff6		;fe2fb0
	rts						;$4e75			;fe2fb4

Lfe2fb6:									;fe2fb6
	move.l	a1,-(a7)				;$2f09			;fe2fb6
	lea.l	($1860,a6),a1				;$43ee,$1860		;fe2fb8
	move.w	(a1),d0					;$3011			;fe2fbc
	clr.l	d4					;$4284			;fe2fbe
	move.l	($0004,a1),d5				;$2a29,$0004		;fe2fc0
	move.l	($0008,a1),d6				;$2c29,$0008		;fe2fc4
	add.l	d6,d6					;$dc86			;fe2fc8
	addx.l	d5,d5					;$db85			;fe2fca
	addx.l	d4,d4					;$d984			;fe2fcc
	andi.w	#$7fff,d0				;$0240,$7fff		;fe2fce
	subi.w	#$3fff,d0				;$0440,$3fff		;fe2fd2
	clr.w	d1					;$4241			;fe2fd6
	tst.w	d0					;$4a40			;fe2fd8
	beq.s	Lfe2fe8					;$670c			;fe2fda
	subq.w	#1,d0					;$5340			;fe2fdc
Lfe2fde:									;fe2fde
	add.l	d6,d6					;$dc86			;fe2fde
	addx.l	d5,d5					;$db85			;fe2fe0
	addx.l	d4,d4					;$d984			;fe2fe2
	dbra.w	d0,Lfe2fde				;$51c8,$fff8		;fe2fe4
Lfe2fe8:									;fe2fe8
	clr.l	d2					;$4282			;fe2fe8
	addi.l	#$00000054,d6				;$0686,$0000,$0054	;fe2fea
	addx.l	d2,d5					;$db82			;fe2ff0
	addx.l	d2,d4					;$d982			;fe2ff2
	cmpi.l	#$0000000a,d4				;$0c84,$0000,$000a	;fe2ff4
	bcs.s	Lfe303c					;$6540			;fe2ffa
	addq.w	#1,($0016,a0)				;$5268,$0016		;fe2ffc
	moveq.l	#$30,d0					;$7030			;fe3000
	move.b	#$31,($0002,a0)				;$117c,$0031,$0002	;fe3002
	moveq.l	#$11,d1					;$7211			;fe3008
	lea.l	($0003,a0),a2				;$45e8,$0003		;fe300a
Lfe300e:									;fe300e
	move.b	d0,(a2)+				;$14c0			;fe300e
	dbra.w	d1,Lfe300e				;$51c9,$fffc		;fe3010
	move.b	#$01,($0015,a0)				;$117c,$0001,$0015	;fe3014
	movea.l	(a7)+,a1				;$225f			;fe301a
	rts						;$4e75			;fe301c

Lfe301e:									;fe301e
	add.l	d6,d6					;$dc86			;fe301e
	addx.l	d5,d5					;$db85			;fe3020
	addx.l	d4,d4					;$d984			;fe3022
	movea.l	d6,a1					;$2246			;fe3024
	move.l	d5,d7					;$2e05			;fe3026
	move.l	d4,d3					;$2604			;fe3028
	add.l	d6,d6					;$dc86			;fe302a
	addx.l	d5,d5					;$db85			;fe302c
	addx.l	d4,d4					;$d984			;fe302e
	add.l	d6,d6					;$dc86			;fe3030
	addx.l	d5,d5					;$db85			;fe3032
	addx.l	d4,d4					;$d984			;fe3034
	add.l	a1,d6					;$dc89			;fe3036
	addx.l	d7,d5					;$db87			;fe3038
	addx.l	d3,d4					;$d983			;fe303a
Lfe303c:									;fe303c
	move.l	d4,d2					;$2404			;fe303c
	addi.b	#$30,d2					;$0602,$0030		;fe303e
	move.b	d2,($02,a0,d1.w)			;$1182,$1002		;fe3042
	clr.l	d4					;$4284			;fe3046
	addq.w	#1,d1					;$5241			;fe3048
	cmpi.w	#$0012,d1				;$0c41,$0012		;fe304a
	bls.s	Lfe301e					;$63ce			;fe304e
	moveq.l	#$10,d1					;$7210			;fe3050
Lfe3052:									;fe3052
	cmpi.b	#$30,($03,a0,d1.w)			;$0c30,$0030,$1003	;fe3052
	dbne.w	d1,Lfe3052				;$56c9,$fff8		;fe3058
	addq.w	#2,d1					;$5441			;fe305c
	move.b	d1,($0015,a0)				;$1141,$0015		;fe305e
	movea.l	(a7)+,a1				;$225f			;fe3062
	rts						;$4e75			;fe3064

Lfe3066:									;fe3066
	move.l	a3,-(a7)				;$2f0b			;fe3066
	lea.l	($1860,a6),a3				;$47ee,$1860		;fe3068
	cmpi.l	#$80000000,d6				;$0c86,$8000,$0000	;fe306c
	bne.s	Lfe308a					;$6616			;fe3072
	lea.l	($1860,a6),a0				;$41ee,$1860		;fe3074
	move.l	#$c01e0000,(a3)+			;$26fc,$c01e,$0000	;fe3078
	move.l	#$80000000,(a3)+			;$26fc,$8000,$0000	;fe307e
	clr.l	(a3)					;$4293			;fe3084
	movea.l	(a7)+,a3				;$265f			;fe3086
	rts						;$4e75			;fe3088

Lfe308a:									;fe308a
	move.l	d6,d7					;$2e06			;fe308a
	bne.s	Lfe3098					;$660a			;fe308c
Lfe308e:									;fe308e
	clr.l	(a3)+					;$429b			;fe308e
	clr.l	(a3)+					;$429b			;fe3090
	clr.l	(a3)					;$4293			;fe3092
	movea.l	(a7)+,a3				;$265f			;fe3094
	rts						;$4e75			;fe3096

Lfe3098:									;fe3098
	bpl.s	Lfe309e					;$6a04			;fe3098
	neg.l	d6					;$4486			;fe309a
	beq.s	Lfe308e					;$67f0			;fe309c
Lfe309e:									;fe309e
	andi.l	#$80000000,d7				;$0287,$8000,$0000	;fe309e
	move.l	d7,(a3)					;$2687			;fe30a4
	move.l	d6,d4					;$2806			;fe30a6
	move.w	#$401e,d2				;$343c,$401e		;fe30a8
Lfe30ac:									;fe30ac
	btst.l	#$1f,d4					;$0804,$001f		;fe30ac
	bne.s	Lfe30ba					;$6608			;fe30b0
	add.l	d4,d4					;$d884			;fe30b2
	dbra.w	d2,Lfe30ac				;$51ca,$fff6		;fe30b4
	bra.s	Lfe308e					;$60d4			;fe30b8
Lfe30ba:									;fe30ba
	move.l	d4,($0004,a3)				;$2744,$0004		;fe30ba
	clr.l	($0008,a3)				;$42ab,$0008		;fe30be
	or.w	d2,(a3)					;$8553			;fe30c2
	clr.w	($0002,a3)				;$426b,$0002		;fe30c4
	movea.l	(a7)+,a3				;$265f			;fe30c8
	rts						;$4e75			;fe30ca

Lfe30cc:									;fe30cc
	move.l	a3,-(a7)				;$2f0b			;fe30cc
	lea.l	($1860,a6),a3				;$47ee,$1860		;fe30ce
	cmpi.w	#$401d,(a3)				;$0c53,$401d		;fe30d2
	bgt.s	Lfe3148					;$6e70			;fe30d6
	bne.s	Lfe30ee					;$6614			;fe30d8
	cmpi.l	#$fffffffe,($0004,a3)			;$0cab,$ffff,$fffe,$0004	;fe30da
	bhi.s	Lfe3148					;$6264			;fe30e2
	bne.s	Lfe3106					;$6620			;fe30e4
	tst.l	($0008,a3)				;$4aab,$0008		;fe30e6
	bne.s	Lfe3148					;$665c			;fe30ea
	bra.s	Lfe3106					;$6018			;fe30ec
Lfe30ee:									;fe30ee
	cmpi.w	#$c01e,(a3)				;$0c53,$c01e		;fe30ee
	bhi.s	Lfe3156					;$6262			;fe30f2
	bne.s	Lfe3106					;$6610			;fe30f4
	cmpi.l	#$80000000,($0004,a3)			;$0cab,$8000,$0000,$0004	;fe30f6
	bne.s	Lfe3156					;$6656			;fe30fe
	tst.l	($0008,a3)				;$4aab,$0008		;fe3100
	bne.s	Lfe3156					;$6650			;fe3104
Lfe3106:									;fe3106
	move.w	(a3),d1					;$3213			;fe3106
	move.l	($0004,a3),d5				;$2a2b,$0004		;fe3108
	move.l	($0008,a3),d6				;$2c2b,$0008		;fe310c
	andi.w	#$7fff,d1				;$0241,$7fff		;fe3110
	beq.s	Lfe315e					;$6748			;fe3114
	addq.l	#1,d5					;$5285			;fe3116
	bcc.s	Lfe311e					;$6404			;fe3118
	roxr.l	#1,d5					;$e295			;fe311a
	addq.w	#1,d1					;$5241			;fe311c
Lfe311e:									;fe311e
	subi.w	#$401e,d1				;$0441,$401e		;fe311e
	bmi.s	Lfe3132					;$6b0e			;fe3122
	subq.w	#1,d1					;$5341			;fe3124
	bmi.s	Lfe313c					;$6b14			;fe3126
Lfe3128:									;fe3128
	add.l	d6,d6					;$dc86			;fe3128
	addx.l	d5,d5					;$db85			;fe312a
	dbra.w	d1,Lfe3128				;$51c9,$fffa		;fe312c
	bra.s	Lfe313c					;$600a			;fe3130
Lfe3132:									;fe3132
	neg.w	d1					;$4441			;fe3132
	cmpi.w	#$0020,d1				;$0c41,$0020		;fe3134
	bcc.s	Lfe315e					;$6424			;fe3138
	lsr.l	d1,d5					;$e2ad			;fe313a
Lfe313c:									;fe313c
	tst.w	(a3)					;$4a53			;fe313c
	bpl.s	Lfe3142					;$6a02			;fe313e
	neg.l	d5					;$4485			;fe3140
Lfe3142:									;fe3142
	move.l	d5,d6					;$2c05			;fe3142
	movea.l	(a7)+,a3				;$265f			;fe3144
	rts						;$4e75			;fe3146

Lfe3148:									;fe3148
	move.l	#$7fffffff,d6				;$2c3c,$7fff,$ffff	;fe3148
Lfe314e:									;fe314e
	ori.b	#$01,ccr				;$003c,$0001		;fe314e
	movea.l	(a7)+,a3				;$265f			;fe3152
	rts						;$4e75			;fe3154

Lfe3156:									;fe3156
	move.l	#$80000000.l,d6				;$2c3c,$8000,$0000	;fe3156
	bra.s	Lfe314e					;$60f0			;fe315c
Lfe315e:									;fe315e
	clr.l	d6					;$4286			;fe315e
	movea.l	(a7)+,a3				;$265f			;fe3160
	rts						;$4e75			;fe3162

Lfe3164:									;fe3164
	move.l	a3,-(a7)				;$2f0b			;fe3164
	lea.l	($1860,a6),a3				;$47ee,$1860		;fe3166
	move.l	d6,d4					;$2806			;fe316a
	move.l	d6,d5					;$2a06			;fe316c
	clr.l	d6					;$4286			;fe316e
	andi.l	#$80000000,d5				;$0285,$8000,$0000	;fe3170
	move.l	d5,(a3)					;$2685			;fe3176
	move.l	d4,d0					;$2004			;fe3178
	swap.w	d0					;$4840			;fe317a
	andi.w	#$7f80,d0				;$0240,$7f80		;fe317c
	beq.s	Lfe31b2					;$6730			;fe3180
	lsr.w	#7,d0					;$ee48			;fe3182
	cmpi.w	#$00ff,d0				;$0c40,$00ff		;fe3184
	beq.s	Lfe31bc					;$6732			;fe3188
	subi.w	#$007f,d0				;$0440,$007f		;fe318a
	addi.l	#$00003fff,d0				;$0680,$0000,$3fff	;fe318e
	swap.w	d0					;$4840			;fe3194
	clr.w	d0					;$4240			;fe3196
	or.l	d0,(a3)					;$8193			;fe3198
	andi.l	#$007fffff,d4				;$0284,$007f,$ffff	;fe319a
	bset.l	#$17,d4					;$08c4,$0017		;fe31a0
	lsl.l	#8,d4					;$e18c			;fe31a4
	move.l	d4,($0004,a3)				;$2744,$0004		;fe31a6
	clr.l	($0008,a3)				;$42ab,$0008		;fe31aa
	movea.l	(a7)+,a3				;$265f			;fe31ae
	rts						;$4e75			;fe31b0

Lfe31b2:									;fe31b2
	clr.l	(a3)+					;$429b			;fe31b2
	clr.l	(a3)+					;$429b			;fe31b4
	clr.l	(a3)					;$4293			;fe31b6
	movea.l	(a7)+,a3				;$265f			;fe31b8
	rts						;$4e75			;fe31ba

Lfe31bc:									;fe31bc
	move.l	#$7fff0000,(a3)+			;$26fc,$7fff,$0000	;fe31bc
	clr.l	(a3)+					;$429b			;fe31c2
	clr.l	(a3)					;$4293			;fe31c4
	movea.l	(a7)+,a3				;$265f			;fe31c6
	rts						;$4e75			;fe31c8

Lfe31ca:									;fe31ca
	move.l	a3,-(a7)				;$2f0b			;fe31ca
	lea.l	($1860,a6),a3				;$47ee,$1860		;fe31cc
	move.l	(a3),d4					;$2813			;fe31d0
	move.l	($0004,a3),d5				;$2a2b,$0004		;fe31d2
	move.w	(a3),d0					;$3013			;fe31d6
	andi.l	#$80000000,d4				;$0284,$8000,$0000	;fe31d8
	andi.w	#$7fff,d0				;$0240,$7fff		;fe31de
	beq.s	Lfe321c					;$6738			;fe31e2
	subi.w	#$3fff,d0				;$0440,$3fff		;fe31e4
	lsr.l	#7,d5					;$ee8d			;fe31e8
	addq.l	#1,d5					;$5285			;fe31ea
	btst.l	#$19,d5					;$0805,$0019		;fe31ec
	beq.s	Lfe31f6					;$6704			;fe31f0
	lsr.l	#1,d5					;$e28d			;fe31f2
	addq.w	#1,d0					;$5240			;fe31f4
Lfe31f6:									;fe31f6
	lsr.l	#1,d5					;$e28d			;fe31f6
	bclr.l	#$17,d5					;$0885,$0017		;fe31f8
	cmpi.w	#$007f,d0				;$0c40,$007f		;fe31fc
	bgt.s	Lfe3222					;$6e20			;fe3200
	cmpi.w	#$ff82,d0				;$0c40,$ff82		;fe3202
	blt.s	Lfe321c					;$6d14			;fe3206
	addi.w	#$007f,d0				;$0640,$007f		;fe3208
	lsl.w	#7,d0					;$ef48			;fe320c
	swap.w	d0					;$4840			;fe320e
	clr.w	d0					;$4240			;fe3210
	or.l	d0,d4					;$8880			;fe3212
	or.l	d5,d4					;$8885			;fe3214
	move.l	d4,d6					;$2c04			;fe3216
	movea.l	(a7)+,a3				;$265f			;fe3218
	rts						;$4e75			;fe321a

Lfe321c:									;fe321c
	clr.l	d6					;$4286			;fe321c
	movea.l	(a7)+,a3				;$265f			;fe321e
	rts						;$4e75			;fe3220

Lfe3222:									;fe3222
	move.l	#$7f000000,d6				;$2c3c,$7f00,$0000	;fe3222
	ori.b	#$01,ccr				;$003c,$0001		;fe3228
	movea.l	(a7)+,a3				;$265f			;fe322c
	rts						;$4e75			;fe322e

Lfe3230:									;fe3230
	move.l	a3,-(a7)				;$2f0b			;fe3230
	lea.l	($1860,a6),a3				;$47ee,$1860		;fe3232
	move.l	d5,d0					;$2005			;fe3236
	andi.l	#$80000000,d0				;$0280,$8000,$0000	;fe3238
	move.l	d0,(a3)					;$2680			;fe323e
	move.l	d5,d0					;$2005			;fe3240
	swap.w	d0					;$4840			;fe3242
	andi.w	#$7ff0,d0				;$0240,$7ff0		;fe3244
	beq.s	Lfe3282					;$6738			;fe3248
	lsr.w	#4,d0					;$e848			;fe324a
	cmpi.w	#$07ff,d0				;$0c40,$07ff		;fe324c
	beq.s	Lfe328c					;$673a			;fe3250
	subi.w	#$03ff,d0				;$0440,$03ff		;fe3252
	addi.l	#$00003fff,d0				;$0680,$0000,$3fff	;fe3256
	swap.w	d0					;$4840			;fe325c
	clr.w	d0					;$4240			;fe325e
	or.l	d0,(a3)					;$8193			;fe3260
	andi.l	#$000fffff,d5				;$0285,$000f,$ffff	;fe3262
	bset.l	#$14,d5					;$08c5,$0014		;fe3268
	moveq.l	#$0a,d0					;$700a			;fe326c
Lfe326e:									;fe326e
	add.l	d6,d6					;$dc86			;fe326e
	addx.l	d5,d5					;$db85			;fe3270
	dbra.w	d0,Lfe326e				;$51c8,$fffa		;fe3272
	move.l	d5,($0004,a3)				;$2745,$0004		;fe3276
	move.l	d6,($0008,a3)				;$2746,$0008		;fe327a
	movea.l	(a7)+,a3				;$265f			;fe327e
	rts						;$4e75			;fe3280

Lfe3282:									;fe3282
	clr.l	(a3)+					;$429b			;fe3282
	clr.l	(a3)+					;$429b			;fe3284
	clr.l	(a3)					;$4293			;fe3286
	movea.l	(a7)+,a3				;$265f			;fe3288
	rts						;$4e75			;fe328a

Lfe328c:									;fe328c
	move.l	#$7fff0000,(a3)+			;$26fc,$7fff,$0000	;fe328c
	clr.l	(a3)+					;$429b			;fe3292
	clr.l	(a3)					;$4293			;fe3294
	movea.l	(a7)+,a3				;$265f			;fe3296
	rts						;$4e75			;fe3298

Lfe329a:									;fe329a
	move.l	a3,-(a7)				;$2f0b			;fe329a
	lea.l	($1860,a6),a3				;$47ee,$1860		;fe329c
	move.l	(a3),d4					;$2813			;fe32a0
	move.l	($0004,a3),d5				;$2a2b,$0004		;fe32a2
	move.l	($0008,a3),d6				;$2c2b,$0008		;fe32a6
	move.w	(a3),d0					;$3013			;fe32aa
	andi.l	#$80000000,d4				;$0284,$8000,$0000	;fe32ac
	andi.w	#$7fff,d0				;$0240,$7fff		;fe32b2
	beq.s	Lfe32fe					;$6746			;fe32b6
	subi.w	#$3fff,d0				;$0440,$3fff		;fe32b8
	moveq.l	#$09,d1					;$7209			;fe32bc
Lfe32be:									;fe32be
	lsr.l	#1,d5					;$e28d			;fe32be
	roxr.l	#1,d6					;$e296			;fe32c0
	dbra.w	d1,Lfe32be				;$51c9,$fffa		;fe32c2
	clr.l	d1					;$4281			;fe32c6
	addq.l	#1,d6					;$5286			;fe32c8
	addx.l	d1,d5					;$db81			;fe32ca
	btst.l	#$16,d5					;$0805,$0016		;fe32cc
	beq.s	Lfe32d8					;$6706			;fe32d0
	lsr.l	#1,d5					;$e28d			;fe32d2
	roxr.l	#1,d6					;$e296			;fe32d4
	addq.w	#1,d0					;$5240			;fe32d6
Lfe32d8:									;fe32d8
	lsr.l	#1,d5					;$e28d			;fe32d8
	roxr.l	#1,d6					;$e296			;fe32da
	bclr.l	#$14,d5					;$0885,$0014		;fe32dc
	cmpi.w	#$03ff,d0				;$0c40,$03ff		;fe32e0
	bgt.s	Lfe3306					;$6e20			;fe32e4
	cmpi.w	#$fc02,d0				;$0c40,$fc02		;fe32e6
	blt.s	Lfe32fe					;$6d12			;fe32ea
	addi.w	#$03ff,d0				;$0640,$03ff		;fe32ec
	lsl.w	#4,d0					;$e948			;fe32f0
	swap.w	d0					;$4840			;fe32f2
	clr.w	d0					;$4240			;fe32f4
	or.l	d0,d5					;$8a80			;fe32f6
	or.l	d4,d5					;$8a84			;fe32f8
	movea.l	(a7)+,a3				;$265f			;fe32fa
	rts						;$4e75			;fe32fc

Lfe32fe:									;fe32fe
	clr.l	d5					;$4285			;fe32fe
	clr.l	d6					;$4286			;fe3300
	movea.l	(a7)+,a3				;$265f			;fe3302
	rts						;$4e75			;fe3304

Lfe3306:									;fe3306
	move.l	#$7ff00000,d5				;$2a3c,$7ff0,$0000	;fe3306
	clr.l	d6					;$4286			;fe330c
	ori.b	#$01,ccr				;$003c,$0001		;fe330e
	movea.l	(a7)+,a3				;$265f			;fe3312
	rts						;$4e75			;fe3314

Lfe3316:									;fe3316
	movem.l	d1-d2,-(a7)				;$48e7,$6000		;fe3316
	move.w	($00a0,a6),d0				;$302e,$00a0		;fe331a
	moveq.l	#$00,d2					;$7400			;fe331e
	move.w	d0,ccr					;$44c0			;fe3320
	shi.b	d1					;$52c1			;fe3322
	and.w	#$0001,d1				;$c27c,$0001		;fe3324
	or.w	d1,d2					;$8441			;fe3328
	move.w	d0,ccr					;$44c0			;fe332a
	sls.b	d1					;$53c1			;fe332c
	and.w	#$0002,d1				;$c27c,$0002		;fe332e
	or.w	d1,d2					;$8441			;fe3332
	move.w	d0,ccr					;$44c0			;fe3334
	scc.b	d1					;$54c1			;fe3336
	and.w	#$0004,d1				;$c27c,$0004		;fe3338
	or.w	d1,d2					;$8441			;fe333c
	move.w	d0,ccr					;$44c0			;fe333e
	scs.b	d1					;$55c1			;fe3340
	and.w	#$0008,d1				;$c27c,$0008		;fe3342
	or.w	d1,d2					;$8441			;fe3346
	move.w	d0,ccr					;$44c0			;fe3348
	sne.b	d1					;$56c1			;fe334a
	and.w	#$0010,d1				;$c27c,$0010		;fe334c
	or.w	d1,d2					;$8441			;fe3350
	move.w	d0,ccr					;$44c0			;fe3352
	seq.b	d1					;$57c1			;fe3354
	and.w	#$0020,d1				;$c27c,$0020		;fe3356
	or.w	d1,d2					;$8441			;fe335a
	move.w	d0,ccr					;$44c0			;fe335c
	svc.b	d1					;$58c1			;fe335e
	ext.w	d1					;$4881			;fe3360
	and.w	#$0040,d1				;$c27c,$0040		;fe3362
	or.w	d1,d2					;$8441			;fe3366
	move.w	d0,ccr					;$44c0			;fe3368
	svs.b	d1					;$59c1			;fe336a
	ext.w	d1					;$4881			;fe336c
	and.w	#$0080,d1				;$c27c,$0080		;fe336e
	or.w	d1,d2					;$8441			;fe3372
	move.w	d0,ccr					;$44c0			;fe3374
	spl.b	d1					;$5ac1			;fe3376
	ext.w	d1					;$4881			;fe3378
	and.w	#$0100,d1				;$c27c,$0100		;fe337a
	or.w	d1,d2					;$8441			;fe337e
	move.w	d0,ccr					;$44c0			;fe3380
	smi.b	d1					;$5bc1			;fe3382
	ext.w	d1					;$4881			;fe3384
	and.w	#$0200,d1				;$c27c,$0200		;fe3386
	or.w	d1,d2					;$8441			;fe338a
	move.w	d0,ccr					;$44c0			;fe338c
	sge.b	d1					;$5cc1			;fe338e
	ext.w	d1					;$4881			;fe3390
	and.w	#$0400,d1				;$c27c,$0400		;fe3392
	or.w	d1,d2					;$8441			;fe3396
	move.w	d0,ccr					;$44c0			;fe3398
	slt.b	d1					;$5dc1			;fe339a
	ext.w	d1					;$4881			;fe339c
	and.w	#$0800,d1				;$c27c,$0800		;fe339e
	or.w	d1,d2					;$8441			;fe33a2
	move.w	d0,ccr					;$44c0			;fe33a4
	sgt.b	d1					;$5ec1			;fe33a6
	ext.w	d1					;$4881			;fe33a8
	and.w	#$1000,d1				;$c27c,$1000		;fe33aa
	or.w	d1,d2					;$8441			;fe33ae
	move.w	d0,ccr					;$44c0			;fe33b0
	sle.b	d1					;$5fc1			;fe33b2
	ext.w	d1					;$4881			;fe33b4
	and.w	#$2000,d1				;$c27c,$2000		;fe33b6
	or.w	d1,d2					;$8441			;fe33ba
	move.w	d0,ccr					;$44c0			;fe33bc
	scc.b	d1					;$54c1			;fe33be
	ext.w	d1					;$4881			;fe33c0
	and.w	#$4000,d1				;$c27c,$4000		;fe33c2
	or.w	d1,d2					;$8441			;fe33c6
	move.w	d0,ccr					;$44c0			;fe33c8
	scs.b	d1					;$55c1			;fe33ca
	ext.w	d1					;$4881			;fe33cc
	and.w	#$8000,d1				;$c27c,$8000		;fe33ce
	or.w	d1,d2					;$8441			;fe33d2
	move.l	d2,d0					;$2002			;fe33d4
	movem.l	(a7)+,d1-d2				;$4cdf,$0006		;fe33d6
	rts						;$4e75			;fe33da

Lfe33dc:									;fe33dc
	movem.l	d0-d3,-(a7)				;$48e7,$f000		;fe33dc
	bsr.w	Lfe3316					;$6100,$ff34		;fe33e0
	lea.l	(Lfe343e,pc),a1				;$43fa,$0058		;fe33e4
	move.l	d0,d2					;$2400			;fe33e8
	moveq.l	#$00,d3					;$7600			;fe33ea
Lfe33ec:									;fe33ec
	move.b	(a1),d0					;$1011			;fe33ec
	jsr	($00fd9004)				;$4eb9,$00fd,$9004	;fe33ee
	move.b	($0001,a1),d0				;$1029,$0001		;fe33f4
	jsr	($00fd9004)				;$4eb9,$00fd,$9004	;fe33f8
	moveq.l	#$3a,d0					;$703a			;fe33fe
	jsr	($00fd9004)				;$4eb9,$00fd,$9004	;fe3400
	moveq.l	#$30,d0					;$7030			;fe3406
	btst.l	d3,d2					;$0702			;fe3408
	beq.s	Lfe340e					;$6702			;fe340a
	moveq.l	#$31,d0					;$7031			;fe340c
Lfe340e:									;fe340e
	jsr	($00fd9004)				;$4eb9,$00fd,$9004	;fe340e
	moveq.l	#$20,d0					;$7020			;fe3414
	jsr	($00fd9004)				;$4eb9,$00fd,$9004	;fe3416
	tst.w	($030a,a6)				;$4a6e,$030a		;fe341c
	beq.s	Lfe342e					;$670c			;fe3420
	cmp.w	#$0007,d3				;$b67c,$0007		;fe3422
	bne.s	Lfe342e					;$6606			;fe3426
	jsr	($00fd8ece)				;$4eb9,$00fd,$8ece	;fe3428
Lfe342e:									;fe342e
	addq.l	#2,a1					;$5489			;fe342e
	addq.w	#1,d3					;$5243			;fe3430
	cmp.w	#$0010,d3				;$b67c,$0010		;fe3432
	bcs.s	Lfe33ec					;$65b4			;fe3436
	movem.l	(a7)+,d0-d3				;$4cdf,$000f		;fe3438
	rts						;$4e75			;fe343c

Lfe343e:									;fe343e
	.dc.b	'HILSCCCSNEEQVCVSPLMIGELTGTLEHSLOMicro Processor Unit:',$00	;fe343e
Lfe3474:									;fe3474
	.dc.b	'16bit MC68000',$00						;fe3474
Lfe3482:									;fe3482
	.dc.b	'32bit MC68030 with INTERNAL PMMU',$00				;fe3482
Lfe34a3:									;fe34a3
	.dc.b	'32bit MC68EC030',$00						;fe34a3
Lfe34b3:									;fe34b3
	.dc.b	$0d,$0a								;fe34b3
	.dc.b	'Floating Point Co Processor:',$00				;fe34b5
Lfe34d2:									;fe34d2
	.dc.b	'Softwere emulation.',$0d,$0a,$00				;fe34d2
Lfe34e8:									;fe34e8
	.dc.b	'MC68881/882',$0d,$0a,$00,$00					;fe34e8
Lfe34f7:									;fe34f7
	.dc.b	$fd,$8f,$ec,$fe,$92,$fe,$92,$ff					;fe34f7
	.dc.b	$fe,$00,$fd,$8f,$f4,$ff,$00,$ff					;fe34ff
	.dc.b	$00,$ff,$f6,$00,$fd,$8f,$fc,$fd					;fe3507
	.dc.b	$ea,$fd,$ea,$ff,$ee,$00,$fd,$90					;fe350f
	.dc.b	$04,$fe,$7e,$fe,$7e,$ff,$e6,$00					;fe3517
	.dc.b	$fd,$90,$0c,$fe,$8c,$fe,$8c,$ff					;fe351f
	.dc.b	$de,$00,$fd,$90,$14,$fe,$d2,$fe					;fe3527
	.dc.b	$d2,$ff,$d6,$00,$00,$ff,$ff,$00					;fe352f
	.dc.b	$00,$ff,$ff,$01,$88,$01,$89,$01					;fe3537
	.dc.b	$8e,$01,$93,$01,$98,$01,$9d,$01					;fe353f
	.dc.b	$a3,$01,$a7,$01,$ac,$01,$b1,$01					;fe3547
	.dc.b	$b6,$01,$b7,$01,$bc,$01,$c1,$01					;fe354f
	.dc.b	$c6,$01,$cc,$01,$d0,$01,$d4,$01					;fe3557
	.dc.b	$da,$01,$de,$01,$e3,$01,$e7,$01					;fe355f
	.dc.b	$e8,$01,$ec,$01,$f2,$01,$f6,$01					;fe3567
	.dc.b	$fb,$02,$00,$02,$05,$02,$09,$02					;fe356f
	.dc.b	$0d,$02,$12,$02,$16,$02,$1a,$02					;fe3577
	.dc.b	$1e,$02,$23,$02,$27,$02,$2c,$02					;fe357f
	.dc.b	$32,$02,$36,$02,$3a,$02,$3e,$02					;fe3587
	.dc.b	$43,$02,$48,$02,$4e,$02,$53,$02					;fe358f
	.dc.b	$58,$02,$5d,$02,$60,$02,$65,$02					;fe3597
	.dc.b	$6a,$02,$6e,$02,$81,$02,$85,$02					;fe359f
	.dc.b	$8a,$02,$8f,$02,$93,$02,$97,$02					;fe35a7
	.dc.b	$9c,$02,$a1,$02,$a6,$02,$aa,$02					;fe35af
	.dc.b	$af,$02,$b4,$02,$b8,$02,$bc,$02					;fe35b7
	.dc.b	$c0,$02,$c4,$02,$c8,$02,$cd,$02					;fe35bf
	.dc.b	$d2,$02,$d6,$02,$da,$02,$ed,$02					;fe35c7
	.dc.b	$f5,$02,$fb,$02,$ff,$03,$04,$03					;fe35cf
	.dc.b	$09,$03,$0d,$03,$12,$03,$18,$03					;fe35d7
	.dc.b	$1d,$03,$22,$03,$26,$03,$2c,$03					;fe35df
	.dc.b	$32,$03,$38,$03,$3d,$03,$42,$03					;fe35e7
	.dc.b	$48,$03,$4f,$03,$55,$03,$5c,$03					;fe35ef
	.dc.b	$62,$03,$68,$03,$6e,$03,$74,$03					;fe35f7
	.dc.b	$7c,$03,$83,$03,$89,$03,$90,$03					;fe35ff
	.dc.b	$96,$03,$9c,$03,$a0,$03,$a3,$03					;fe3607
	.dc.b	$a9,$03,$ac,$03,$b2,$03,$bb,$03					;fe360f
	.dc.b	$c3,$03,$c4,$03,$c8,$03,$cc,$03					;fe3617
	.dc.b	$d1,$03,$d8,$03,$dc,$03,$e1,$03					;fe361f
	.dc.b	$e9,$03,$ea,$03,$eb,$03,$ec,$03					;fe3627
	.dc.b	$f2,$03,$f7,$03,$fd,$04,$04,$04					;fe362f
	.dc.b	$0a,$04,$0b,$04,$13,$04,$14,$04					;fe3637
	.dc.b	$1c,$04,$22,$04,$28,$04,$29,$04					;fe363f
	.dc.b	$2f,$04,$36,$04,$3b,$04,$40,$04					;fe3647
	.dc.b	$46,$04,$4e,$04,$56,$04,$57,$04					;fe364f
	.dc.b	$5d,$04,$64,$04,$6a,$04,$6b,$04					;fe3657
	.dc.b	$70,$04,$76,$04,$7b,$04,$7c,$04					;fe365f
	.dc.b	$82,$04,$87,$04,$8f,$04,$97,$04					;fe3667
	.dc.b	$9c,$04,$a1,$04,$a6,$04,$ab,$04					;fe366f
	.dc.b	$b3,$04,$b8,$04,$bf,$04,$c7,$04					;fe3677
	.dc.b	$cc,$04,$cd,$04,$ce,$04,$cf,$04					;fe367f
	.dc.b	$d0,$04,$d1,$04,$d2,$04,$d3,$04					;fe3687
	.dc.b	$db,$04,$e3,$04,$eb,$04,$f3,$04					;fe368f
	.dc.b	$fb,$05,$03,$05,$0b,$05,$13,$05					;fe3697
	.dc.b	$18,$05,$19,$05,$1e,$05,$1f,$05					;fe369f
	.dc.b	$20,$05,$21,$05,$22,$05,$23,$05					;fe36a7
	.dc.b	$2b,$05,$31,$05,$38,$05,$3c,$05					;fe36af
	.dc.b	$3f,$05,$45,$05,$4a,$05,$4d,$05					;fe36b7
	.dc.b	$53,$05,$5c,$00,$62,$74,$73,$74					;fe36bf
	.dc.b	$00,$62,$63,$68,$67,$00,$62,$63					;fe36c7
	.dc.b	$6c,$72,$00,$62,$73,$65,$74,$00					;fe36cf
	.dc.b	$6d,$6f,$76,$65,$70,$00,$6f,$72					;fe36d7
	.dc.b	$69,$00,$61,$6e,$64,$69,$00,$73					;fe36df
	.dc.b	$75,$62,$69,$00,$61,$64,$64,$69					;fe36e7
	.dc.b	$00,$00,$65,$6f,$72,$69,$00,$63					;fe36ef
	.dc.b	$6d,$70,$69,$00,$6d,$6f,$76,$65					;fe36f7
	.dc.b	$00,$6d,$6f,$76,$65,$61,$00,$63					;fe36ff
	.dc.b	$68,$6b,$00,$6c,$65,$61,$00,$72					;fe3707
	.dc.b	$65,$73,$65,$74,$00,$6e,$6f,$70					;fe370f
	.dc.b	$00,$73,$74,$6f,$70,$00,$72,$74					;fe3717
	.dc.b	$65,$00,$00,$72,$74,$73,$00,$74					;fe371f
	.dc.b	$72,$61,$70,$76,$00,$72,$74,$72					;fe3727
	.dc.b	$00,$74,$72,$61,$70,$00,$6c,$69					;fe372f
	.dc.b	$6e,$6b,$00,$75,$6e,$6c,$6b,$00					;fe3737
	.dc.b	$6a,$73,$72,$00,$6a,$6d,$70,$00					;fe373f
	.dc.b	$6e,$65,$67,$78,$00,$63,$6c,$72					;fe3747
	.dc.b	$00,$6e,$65,$67,$00,$6e,$6f,$74					;fe374f
	.dc.b	$00,$6e,$62,$63,$64,$00,$70,$65					;fe3757
	.dc.b	$61,$00,$73,$77,$61,$70,$00,$6d					;fe375f
	.dc.b	$6f,$76,$65,$6d,$00,$65,$78,$74					;fe3767
	.dc.b	$00,$74,$73,$74,$00,$74,$61,$73					;fe376f
	.dc.b	$00,$61,$64,$64,$71,$00,$73,$75					;fe3777
	.dc.b	$62,$71,$00,$6d,$6f,$76,$65,$71					;fe377f
	.dc.b	$00,$73,$62,$63,$64,$00,$64,$69					;fe3787
	.dc.b	$76,$75,$00,$64,$69,$76,$73,$00					;fe378f
	.dc.b	$6f,$72,$00,$73,$75,$62,$78,$00					;fe3797
	.dc.b	$73,$75,$62,$61,$00,$73,$75,$62					;fe379f
	.dc.b	$00,$6c,$69,$6e,$65,$20,$31,$30					;fe37a7
	.dc.b	$31,$30,$20,$65,$6d,$75,$6c,$61					;fe37af
	.dc.b	$74,$6f,$72,$00,$63,$6d,$70,$00					;fe37b7
	.dc.b	$63,$6d,$70,$61,$00,$63,$6d,$70					;fe37bf
	.dc.b	$6d,$00,$65,$6f,$72,$00,$65,$78					;fe37c7
	.dc.b	$67,$00,$61,$62,$63,$64,$00,$6d					;fe37cf
	.dc.b	$75,$6c,$75,$00,$6d,$75,$6c,$73					;fe37d7
	.dc.b	$00,$61,$6e,$64,$00,$61,$64,$64					;fe37df
	.dc.b	$78,$00,$61,$64,$64,$61,$00,$61					;fe37e7
	.dc.b	$64,$64,$00,$61,$73,$6c,$00,$61					;fe37ef
	.dc.b	$73,$72,$00,$6c,$73,$6c,$00,$6c					;fe37f7
	.dc.b	$73,$72,$00,$72,$6f,$78,$6c,$00					;fe37ff
	.dc.b	$72,$6f,$78,$72,$00,$72,$6f,$6c					;fe3807
	.dc.b	$00,$72,$6f,$72,$00,$6c,$69,$6e					;fe380f
	.dc.b	$65,$20,$31,$31,$31,$31,$20,$65					;fe3817
	.dc.b	$6d,$75,$6c,$61,$74,$6f,$72,$00					;fe381f
	.dc.b	$69,$6c,$6c,$65,$67,$61,$6c,$00					;fe3827
	.dc.b	$63,$61,$6c,$6c,$6d,$00,$72,$74					;fe382f
	.dc.b	$6d,$00,$63,$6d,$70,$32,$00,$63					;fe3837
	.dc.b	$68,$6b,$32,$00,$63,$61,$73,$00					;fe383f
	.dc.b	$63,$61,$73,$32,$00,$6d,$6f,$76					;fe3847
	.dc.b	$65,$73,$00,$62,$6b,$70,$74,$00					;fe384f
	.dc.b	$65,$78,$74,$62,$00,$72,$74,$64					;fe3857
	.dc.b	$00,$6d,$6f,$76,$65,$63,$00,$64					;fe385f
	.dc.b	$69,$76,$75,$6c,$00,$64,$69,$76					;fe3867
	.dc.b	$73,$6c,$00,$70,$61,$63,$6b,$00					;fe386f
	.dc.b	$75,$6e,$70,$6b,$00,$62,$66,$74					;fe3877
	.dc.b	$73,$74,$00,$62,$66,$65,$78,$74					;fe387f
	.dc.b	$75,$00,$62,$66,$63,$68,$67,$00					;fe3887
	.dc.b	$62,$66,$65,$78,$74,$73,$00,$62					;fe388f
	.dc.b	$66,$63,$6c,$72,$00,$62,$66,$66					;fe3897
	.dc.b	$66,$6f,$00,$62,$66,$73,$65,$74					;fe389f
	.dc.b	$00,$62,$66,$69,$6e,$73,$00,$70					;fe38a7
	.dc.b	$66,$6c,$75,$73,$68,$72,$00,$70					;fe38af
	.dc.b	$76,$61,$6c,$69,$64,$00,$70,$6c					;fe38b7
	.dc.b	$6f,$61,$64,$00,$70,$66,$6c,$75					;fe38bf
	.dc.b	$73,$68,$00,$70,$6d,$6f,$76,$65					;fe38c7
	.dc.b	$00,$70,$74,$65,$73,$74,$00,$70					;fe38cf
	.dc.b	$64,$62,$00,$70,$73,$00,$70,$74					;fe38d7
	.dc.b	$72,$61,$70,$00,$70,$62,$00,$70					;fe38df
	.dc.b	$73,$61,$76,$65,$00,$70,$72,$65					;fe38e7
	.dc.b	$73,$74,$6f,$72,$65,$00,$70,$6d					;fe38ef
	.dc.b	$6f,$76,$65,$66,$64,$00,$00,$47					;fe38f7
	.dc.b	$45,$4e,$00,$53,$63,$63,$00,$44					;fe38ff
	.dc.b	$42,$63,$63,$00,$54,$52,$41,$50					;fe3907
	.dc.b	$63,$63,$00,$42,$63,$63,$00,$53					;fe390f
	.dc.b	$41,$56,$45,$00,$52,$45,$53,$54					;fe3917
	.dc.b	$4f,$52,$45,$00,$00,$00,$00,$66					;fe391f
	.dc.b	$6d,$6f,$76,$65,$00,$66,$69,$6e					;fe3927
	.dc.b	$74,$00,$66,$73,$69,$6e,$68,$00					;fe392f
	.dc.b	$66,$69,$6e,$74,$72,$7a,$00,$66					;fe3937
	.dc.b	$73,$71,$72,$74,$00,$00,$66,$6c					;fe393f
	.dc.b	$6f,$67,$6e,$70,$31,$00,$00,$66					;fe3947
	.dc.b	$65,$74,$6f,$78,$6d,$31,$00,$66					;fe394f
	.dc.b	$74,$61,$6e,$68,$00,$66,$61,$74					;fe3957
	.dc.b	$61,$6e,$00,$00,$66,$61,$73,$69					;fe395f
	.dc.b	$6e,$00,$66,$61,$74,$61,$6e,$68					;fe3967
	.dc.b	$00,$66,$73,$69,$6e,$00,$66,$74					;fe396f
	.dc.b	$61,$6e,$00,$66,$65,$74,$6f,$78					;fe3977
	.dc.b	$00,$66,$74,$77,$6f,$74,$6f,$78					;fe397f
	.dc.b	$00,$66,$74,$65,$6e,$74,$6f,$78					;fe3987
	.dc.b	$00,$00,$66,$6c,$6f,$67,$6e,$00					;fe398f
	.dc.b	$66,$6c,$6f,$67,$31,$30,$00,$66					;fe3997
	.dc.b	$6c,$6f,$67,$32,$00,$00,$66,$61					;fe399f
	.dc.b	$62,$73,$00,$66,$63,$6f,$73,$68					;fe39a7
	.dc.b	$00,$66,$6e,$65,$67,$00,$00,$66					;fe39af
	.dc.b	$61,$63,$6f,$73,$00,$66,$63,$6f					;fe39b7
	.dc.b	$73,$00,$66,$67,$65,$74,$65,$78					;fe39bf
	.dc.b	$70,$00,$66,$67,$65,$74,$6d,$61					;fe39c7
	.dc.b	$6e,$00,$66,$64,$69,$76,$00,$66					;fe39cf
	.dc.b	$6d,$6f,$64,$00,$66,$61,$64,$64					;fe39d7
	.dc.b	$00,$66,$6d,$75,$6c,$00,$66,$73					;fe39df
	.dc.b	$67,$6c,$64,$69,$76,$00,$66,$72					;fe39e7
	.dc.b	$65,$6d,$00,$66,$73,$63,$61,$6c					;fe39ef
	.dc.b	$65,$00,$66,$73,$67,$6c,$6d,$75					;fe39f7
	.dc.b	$6c,$00,$66,$73,$75,$62,$00,$00					;fe39ff
	.dc.b	$00,$00,$00,$00,$00,$00,$66,$73					;fe3a07
	.dc.b	$69,$6e,$63,$6f,$73,$00,$66,$73					;fe3a0f
	.dc.b	$69,$6e,$63,$6f,$73,$00,$66,$73					;fe3a17
	.dc.b	$69,$6e,$63,$6f,$73,$00,$66,$73					;fe3a1f
	.dc.b	$69,$6e,$63,$6f,$73,$00,$66,$73					;fe3a27
	.dc.b	$69,$6e,$63,$6f,$73,$00,$66,$73					;fe3a2f
	.dc.b	$69,$6e,$63,$6f,$73,$00,$66,$73					;fe3a37
	.dc.b	$69,$6e,$63,$6f,$73,$00,$66,$73					;fe3a3f
	.dc.b	$69,$6e,$63,$6f,$73,$00,$66,$63					;fe3a47
	.dc.b	$6d,$70,$00,$00,$66,$74,$73,$74					;fe3a4f
	.dc.b	$00,$00,$00,$00,$00,$00,$66,$6d					;fe3a57
	.dc.b	$6f,$76,$65,$63,$72,$00,$66,$6d					;fe3a5f
	.dc.b	$6f,$76,$65,$00,$66,$6d,$6f,$76					;fe3a67
	.dc.b	$65,$6d,$00,$66,$64,$62,$00,$66					;fe3a6f
	.dc.b	$73,$00,$66,$74,$72,$61,$70,$00					;fe3a77
	.dc.b	$66,$6e,$6f,$70,$00,$66,$62,$00					;fe3a7f
	.dc.b	$66,$73,$61,$76,$65,$00,$66,$72					;fe3a87
	.dc.b	$65,$73,$74,$6f,$72,$65,$00,$66					;fe3a8f
	.dc.b	$62,$72,$61,$00,$54,$68,$69,$73					;fe3a97
	.dc.b	$20,$70,$72,$6f,$67,$72,$61,$6d					;fe3a9f
	.dc.b	$20,$69,$73,$20,$74,$68,$65,$20					;fe3aa7
	.dc.b	$70,$72,$6f,$70,$65,$72,$74,$79					;fe3aaf
	.dc.b	$20,$6f,$66,$20,$4b,$55,$4d,$41					;fe3ab7
	.dc.b	$20,$4c,$41,$42,$2e,$00,$01,$01					;fe3abf
	.dc.b	$01,$01,$02,$02,$02,$02,$02,$00					;fe3ac7
	.dc.b	$02,$02,$02,$02,$02,$03,$00,$00					;fe3acf
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$02					;fe3ad7
	.dc.b	$02,$03,$03,$02,$02,$02,$02,$02					;fe3adf
	.dc.b	$03,$02,$02,$02,$02,$01,$02,$02					;fe3ae7
	.dc.b	$03,$02,$02,$02,$02,$01,$02,$02					;fe3aef
	.dc.b	$00,$02,$02,$02,$02,$02,$02,$02					;fe3af7
	.dc.b	$02,$02,$01,$02,$02,$02,$02,$02					;fe3aff
	.dc.b	$02,$02,$02,$02,$02,$00,$00,$02					;fe3b07
	.dc.b	$02,$02,$02,$02,$02,$03,$00,$03					;fe3b0f
	.dc.b	$02,$03,$03,$03,$04,$04,$01,$01					;fe3b17
	.dc.b	$01,$01,$01,$01,$01,$01,$03,$03					;fe3b1f
	.dc.b	$03,$03,$03,$03,$03,$03,$03,$03					;fe3b27
	.dc.b	$03,$03,$00,$00,$03,$01,$03,$03					;fe3b2f
	.dc.b	$03,$03,$03,$00,$00,$00,$03,$03					;fe3b37
	.dc.b	$03,$03,$03,$00,$03,$00,$03,$03					;fe3b3f
	.dc.b	$03,$00,$03,$03,$03,$03,$03,$03					;fe3b47
	.dc.b	$03,$00,$03,$03,$03,$00,$03,$03					;fe3b4f
	.dc.b	$03,$00,$03,$03,$03,$03,$03,$03					;fe3b57
	.dc.b	$03,$03,$03,$03,$03,$03,$03,$00					;fe3b5f
	.dc.b	$00,$00,$00,$00,$00,$00,$03,$03					;fe3b67
	.dc.b	$03,$03,$03,$03,$03,$03,$03,$00					;fe3b6f
	.dc.b	$03,$00,$00,$00,$00,$00,$03,$03					;fe3b77
	.dc.b	$03,$03,$03,$03,$03,$03,$03,$03					;fe3b7f
	.dc.b	$03,$0d,$0a,$41,$62,$6f,$72,$74					;fe3b87
	.dc.b	$65,$64,$20,$62,$79,$20,$6e,$6f					;fe3b8f
	.dc.b	$6e,$2d,$6d,$61,$73,$6b,$61,$62					;fe3b97
	.dc.b	$6c,$65,$20,$69,$6e,$74,$65,$72					;fe3b9f
	.dc.b	$72,$75,$70,$74,$00						;fe3ba7
Lfe3bac:									;fe3bac
	.dc.b	'Illegal stack format number',$0d,$0a,$00			;fe3bac
Lfe3bca:									;fe3bca
	.dc.b	'Exceptional abort by ',$00					;fe3bca
Lfe3be0:									;fe3be0
	.dc.b	' at ',$00							;fe3be0
Lfe3be5:									;fe3be5
	.dc.b	', SR=',$00							;fe3be5
Lfe3beb:									;fe3beb
	.dc.b	' By memory access of ',$00					;fe3beb
Lfe3c01:									;fe3c01
	.dc.b	'system status =  I/N=',$00					;fe3c01
Lfe3c17:									;fe3c17
	.dc.b	' R/W=',$00							;fe3c17
Lfe3c1d:									;fe3c1d
	.dc.b	' FC=',$00							;fe3c1d
Lfe3c22:									;fe3c22
	.dc.b	'Stack format #1, Throwaway four word stack frame',$0d,$0a,$00	;fe3c22
Lfe3c55:									;fe3c55
	.dc.b	'Coprocessor mid-instruction exception stack frame',$0d,$0a,$00	;fe3c55
Lfe3c89:									;fe3c89
	.dc.b	'double exception in system status display',$0d,$0a,$00		;fe3c89
Lfe3cb5:									;fe3cb5
	.dc.b	'Short bus cycle fault stack frame',$0d,$0a,$00			;fe3cb5
Lfe3cd9:									;fe3cd9
	.dc.b	'Long bus cycle fault stack frame',$0d,$0a,$00			;fe3cd9
Lfe3cfc:									;fe3cfc
	.dc.b	' ,RM cycle',$00						;fe3cfc
Lfe3d07:									;fe3d07
	.dc.b	' Access size=',$00						;fe3d07
Lfe3d15:									;fe3d15
	.dc.b	'long',$00							;fe3d15
Lfe3d1a:									;fe3d1a
	.dc.b	'byte',$00							;fe3d1a
Lfe3d1f:									;fe3d1f
	.dc.b	'word',$00							;fe3d1f
Lfe3d24:									;fe3d24
	.dc.b	'3 byte',$00,$00						;fe3d24
Lfe3d2c:									;fe3d2c
	.dc.b	$00,$fe,$0a,$48,$00,$fe,$0a,$9e					;fe3d2c
	.dc.b	$00,$fe,$0a,$f8,$00,$fe,$0b,$5a					;fe3d34
	.dc.b	$00,$fe,$0b,$b2,$00,$fe,$0c,$16					;fe3d3c
	.dc.b	$00,$00,$00,$00,$00,$fe,$0c,$e8					;fe3d44
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00					;fe3d4c
	.dc.b	$00,$fe,$0d,$fa,$00,$fe,$0e,$5c					;fe3d54
	.dc.b	$00,$fe,$0e,$c8,$00,$fe,$0f,$22					;fe3d5c
	.dc.b	$00,$fe,$0d,$fa,$00,$fe,$0d,$fa					;fe3d64
	.dc.b	$00,$fe,$0d,$fa,$00,$fe,$0d,$fa					;fe3d6c
	.dc.b	$00,$fe,$0d,$fa,$00,$fe,$0d,$fa					;fe3d74
	.dc.b	$00,$fe,$0d,$fa,$00,$fe,$0d,$fa					;fe3d7c
	.dc.b	$00,$fe,$0f,$8e,$00,$fe,$0f,$ee					;fe3d84
	.dc.b	$00,$fe,$10,$4e,$00,$fe,$10,$ae					;fe3d8c
	.dc.b	$00,$fe,$11,$0e,$00,$fe,$11,$6e					;fe3d94
	.dc.b	$00,$fe,$11,$ce,$00,$00,$00,$00					;fe3d9c
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00					;fe3da4
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00					;fe3dac
Lfe3db4:									;fe3db4
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00					;fe3db4
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00					;fe3dbc
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00					;fe3dc4
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00					;fe3dcc
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00					;fe3dd4
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00					;fe3ddc
	.dc.b	$00,$fe,$12,$fa,$00,$fe,$13,$70					;fe3de4
	.dc.b	$00,$fe,$13,$d0,$00,$fe,$14,$30					;fe3dec
	.dc.b	$00,$fe,$14,$8c,$00,$fe,$14,$ec					;fe3df4
	.dc.b	$00,$fe,$15,$46,$00,$fe,$0d,$fa					;fe3dfc
	.dc.b	$00,$fe,$15,$a6,$00,$fe,$16,$06					;fe3e04
	.dc.b	$00,$fe,$16,$6a,$00,$fe,$0d,$fa					;fe3e0c
	.dc.b	$00,$fe,$0d,$fa,$00,$fe,$0d,$fa					;fe3e14
	.dc.b	$00,$fe,$0d,$fa,$00,$fe,$0d,$fa					;fe3e1c
Lfe3e24:									;fe3e24
	.dc.b	' in debugger',$0d,$0a,$00,$00					;fe3e24
Lfe3e34:									;fe3e34
	.dcb.b	49612,$ff							;fe3e34
Lff0000:									;ff0000
	.dc.l	$00002000							;ff0000
Lff0008:									;ff0008
	.dc.b	$00,$fd,$38,$00							;ff0008
Lff000c:									;ff000c
	.dc.b	$00,$fc,$02,$00,$00,$fc,$e0,$00					;ff000c
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00					;ff0014
	.dc.b	$00,$00,$00,$00,$00,$ff,$93,$5a					;ff001c
	.dc.b	$00,$ff,$93,$40,$00,$00,$00,$00					;ff0024
	.dc.b	$00,$00,$00,$00							;ff002c
Call_ROMVER:									;ff0030
	move.l	#$13921127,d0				;$203c,$1392,$1127	;ff0030
	rts						;$4e75			;ff0036

Start:										;ff0038
	move.w	#$2700,sr				;$46fc,$2700		;ff0038
	lea.l	($2000),a7				;$4ff8,$2000		;ff003c
	reset						;$4e70			;ff0040
	moveq.l	#$00,d5					;$7a00			;ff0042
	cmp.l	(Lff1af6,pc),d0				;$b0ba,$1ab0		;ff0044
	bne.s	Lff0052					;$6608			;ff0048
	cmp.l	(Lff1afa,pc),d1				;$b2ba,$1aae		;ff004a
	bne.s	Lff0052					;$6602			;ff004e
	moveq.l	#$ff,d5					;$7aff			;ff0050
Lff0052:									;ff0052
	move.l	($0030),d6				;$2c38,$0030		;ff0052
	lsl.l	#8,d6					;$e18e			;ff0056
	lsr.l	#8,d6					;$e08e			;ff0058
	bsr.w	Lff0d3e					;$6100,$0ce2		;ff005a
	move.l	d0,d7					;$2e00			;ff005e
	tst.b	d7					;$4a07			;ff0060
	beq.s	Lff0074					;$6710			;ff0062
	moveq.l	#$00,d0					;$7000			;ff0064
	movec.l	d0,vbr					;$4e7b,$0801		;ff0066
	cmpi.b	#$01,d7					;$0c07,$0001		;ff006a
	beq.s	Lff0074					;$6704			;ff006e
	movec.l	d0,cacr					;$4e7b,$0002		;ff0070
Lff0074:									;ff0074
	suba.l	a0,a0					;$91c8			;ff0074
	lea.l	(DefaultExceptionHandler,pc),a1		;$43fa,$06f8		;ff0076
	bsr.w	Lff072e					;$6100,$06b2		;ff007a
	lea.l	(Lff0746,pc),a1				;$43fa,$06c6		;ff007e
	move.l	a1,($007c)				;$21c9,$007c		;ff0082
	lea.l	(Call_Unused,pc),a1			;$43fa,$250e		;ff0086
	bsr.w	Lff072e					;$6100,$06a2		;ff008a
	lea.l	(Lff0000,pc),a0				;$41fa,$ff70		;ff008e
	move.l	a0,d2					;$2408			;ff0092
	lea.l	(VecTable,pc),a0			;$41fa,$2512		;ff0094
	lea.l	($0400),a1				;$43f8,$0400		;ff0098
	move.w	#$00df,d0				;$303c,$00df		;ff009c
Lff00a0:									;ff00a0
	moveq.l	#$00,d1					;$7200			;ff00a0
	move.w	(a0)+,d1				;$3218			;ff00a2
	add.l	d2,d1					;$d282			;ff00a4
	move.l	d1,(a1)+				;$22c1			;ff00a6
	dbra.w	d0,Lff00a0				;$51c8,$fff6		;ff00a8
	lea.l	(Lff07be,pc),a0				;$41fa,$0710		;ff00ac
	move.l	a0,($07fc)				;$21c8,$07fc		;ff00b0
	lea.l	(Lff03f2,pc),a0				;$41fa,$033c		;ff00b4
	move.l	a0,($07f8)				;$21c8,$07f8		;ff00b8
	lea.l	(Lff07cc,pc),a0				;$41fa,$070e		;ff00bc
	move.l	a0,($07f4)				;$21c8,$07f4		;ff00c0
	move.l	(Lff934e),d0				;$2039,$00ff,$934e	;ff00c4
	move.l	d0,($07d4)				;$21c0,$07d4		;ff00ca
	lea.l	($00ed0000),a0				;$41f9,$00ed,$0000	;ff00ce
	lea.l	(Lff09e8,pc),a1				;$43fa,$0912		;ff00d4
	moveq.l	#$07,d0					;$7007			;ff00d8
Lff00da:									;ff00da
	cmpm.b	(a0)+,(a1)+				;$b308			;ff00da
	dbne.w	d0,Lff00da				;$56c8,$fffc		;ff00dc
	beq.s	Lff0112					;$6730			;ff00e0
	move.b	#$31,($00e8e00d)			;$13fc,$0031,$00e8,$e00d	;ff00e2
	lea.l	($00ed0000),a0				;$41f9,$00ed,$0000	;ff00ea
	movea.l	a0,a1					;$2248			;ff00f0
	moveq.l	#$3f,d0					;$703f			;ff00f2
Lff00f4:									;ff00f4
	clr.l	(a1)+					;$4299			;ff00f4
	dbra.w	d0,Lff00f4				;$51c8,$fffc		;ff00f6
	lea.l	(Lff09e8,pc),a1				;$43fa,$08ec		;ff00fa
	moveq.l	#$5a,d0					;$705a			;ff00fe
Lff0100:									;ff0100
	move.b	(a1)+,(a0)+				;$10d9			;ff0100
	dbra.w	d0,Lff0100				;$51c8,$fffc		;ff0102
	clr.w	($00ed0100)				;$4279,$00ed,$0100	;ff0106
	clr.b	($00e8e00d)				;$4239,$00e8,$e00d	;ff010c
Lff0112:									;ff0112
	move.b	($0cc3),d5				;$1a38,$0cc3		;ff0112
	bsr.w	Lff1450					;$6100,$1338		;ff0116
	lea.l	($0cbc),a0				;$41f8,$0cbc		;ff011a
	move.b	d7,(a0)+				;$10c7			;ff011e
	tst.w	d7					;$4a47			;ff0120
	smi.b	(a0)+					;$5bd8			;ff0122
	tst.l	d7					;$4a87			;ff0124
	smi.b	(a0)+					;$5bd8			;ff0126
	lea.l	(DefaultExceptionHandler,pc),a1		;$43fa,$0646		;ff0128
	cmp.l	a1,d6					;$bc89			;ff012c
	seq.b	(a0)					;$57d0			;ff012e
	tst.l	d5					;$4a85			;ff0130
	bpl.s	Lff013c					;$6a08			;ff0132
	move.b	#$fe,(a0)				;$10bc,$00fe		;ff0134
	move.b	d5,($0cc3)				;$11c5,$0cc3		;ff0138
Lff013c:									;ff013c
	cmpi.b	#$01,($0cbc)				;$0c38,$0001,$0cbc	;ff013c
	bls.s	Lff0152					;$630e			;ff0142
	clr.b	($00e8e009)				;$4239,$00e8,$e009	;ff0144
	move.w	#$2101,d0				;$303c,$2101		;ff014a
	movec.l	d0,cacr					;$4e7b,$0002		;ff014e
Lff0152:									;ff0152
	bsr.w	Lff0c4e					;$6100,$0afa		;ff0152
	move.l	d0,d2					;$2400			;ff0156
	lea.l	($0cb6),a0				;$41f8,$0cb6		;ff0158
	moveq.l	#$ff,d1					;$72ff			;ff015c
	move.b	($00e8e00b),d1				;$1239,$00e8,$e00b	;ff015e
	move.b	d1,d0					;$1001			;ff0164
	lsl.w	#4,d1					;$e949			;ff0166
	move.b	d0,d1					;$1200			;ff0168
	or.b	#$f0,d1					;$823c,$00f0		;ff016a
	not.w	d1					;$4641			;ff016e
	move.w	d1,(a0)+				;$30c1			;ff0170
	bne.s	Lff017c					;$6608			;ff0172
	move.l	#$034203d3,(a0)				;$20bc,$0342,$03d3	;ff0174
	bra.s	Lff018e					;$6012			;ff017a
Lff017c:									;ff017c
	move.l	#$056e066d,(a0)				;$20bc,$056e,$066d	;ff017c
	tst.b	($0cbc)					;$4a38,$0cbc		;ff0182
	beq.s	Lff018e					;$6706			;ff0186
	move.l	#$104d104d,(a0)				;$20bc,$104d,$104d	;ff0188
Lff018e:									;ff018e
	tst.w	d2					;$4a42			;ff018e
	beq.s	Lff019c					;$670a			;ff0190
	swap.w	d2					;$4842			;ff0192
	tst.w	d2					;$4a42			;ff0194
	beq.s	Lff019c					;$6704			;ff0196
	swap.w	d2					;$4842			;ff0198
	move.l	d2,(a0)					;$2082			;ff019a
Lff019c:									;ff019c
	bsr.w	Lff163a					;$6100,$149c		;ff019c
	move.w	#$2000,sr				;$46fc,$2000		;ff01a0
	bsr.w	Lff05be					;$6100,$0418		;ff01a4
	move.b	($00ed0028),($00e8e001)			;$13f9,$00ed,$0028,$00e8,$e001	;ff01a8
	clr.b	($00e86001)				;$4239,$00e8,$6001	;ff01b2
	move.b	#$04,($00e8a01f)			;$13fc,$0004,$00e8,$a01f	;ff01b8
	tst.b	($00e9a001)				;$4a39,$00e9,$a001	;ff01c0
	tst.b	($00e9a001)				;$4a39,$00e9,$a001	;ff01c6
	move.b	#$08,($00e8a01b)			;$13fc,$0008,$00e8,$a01b	;ff01cc
	btst.b	#$07,($0807)				;$0838,$0007,$0807	;ff01d4
	beq.s	Lff0252					;$6776			;ff01da
	lea.l	($00e82200),a1				;$43f9,$00e8,$2200	;ff01dc
	lea.l	(Lff0a16,pc),a0				;$41fa,$0832		;ff01e2
	move.w	(a0)+,(a1)+				;$32d8			;ff01e6
	move.w	(a0)+,(a1)+				;$32d8			;ff01e8
	move.w	(a0)+,(a1)+				;$32d8			;ff01ea
	move.w	(a0)+,(a1)+				;$32d8			;ff01ec
	move.w	(a0),(a1)+				;$32d0			;ff01ee
	move.w	(a0),(a1)+				;$32d0			;ff01f0
	move.w	(a0),(a1)+				;$32d0			;ff01f2
	move.w	(a0)+,(a1)+				;$32d8			;ff01f4
	move.w	(a0),(a1)+				;$32d0			;ff01f6
	move.w	(a0),(a1)+				;$32d0			;ff01f8
	move.w	(a0),(a1)+				;$32d0			;ff01fa
	move.w	(a0),(a1)+				;$32d0			;ff01fc
	move.w	(a0),(a1)+				;$32d0			;ff01fe
	move.w	(a0),(a1)+				;$32d0			;ff0200
	move.w	(a0),(a1)+				;$32d0			;ff0202
	move.w	(a0)+,(a1)+				;$32d8			;ff0204
	move.b	#$0f,($00e8e001)			;$13fc,$000f,$00e8,$e001	;ff0206
	bsr.w	Lff07e8					;$6100,$05d8		;ff020e
	lea.l	(Lff0b8a,pc),a1				;$43fa,$0976		;ff0212
	bsr.w	Lff0728					;$6100,$0510		;ff0216
	lea.l	($0800),a1				;$43f8,$0800		;ff021a
Lff021e:									;ff021e
	btst.b	#$07,($0005,a1)				;$0829,$0007,$0005	;ff021e
	bne.w	Start					;$6600,$fe12		;ff0224
	btst.b	#$06,($0002,a1)				;$0829,$0006,$0002	;ff0228
	beq.s	Lff021e					;$67ee			;ff022e
	move.b	#$31,($00e8e00d)			;$13fc,$0031,$00e8,$e00d	;ff0230
	lea.l	($00ed0000),a0				;$41f9,$00ed,$0000	;ff0238
	move.w	#$0fff,d0				;$303c,$0fff		;ff023e
Lff0242:									;ff0242
	clr.l	(a0)+					;$4298			;ff0242
	dbra.w	d0,Lff0242				;$51c8,$fffc		;ff0244
	clr.b	($00e8e00d)				;$4239,$00e8,$e00d	;ff0248
	bra.w	Start					;$6000,$fde8		;ff024e
Lff0252:									;ff0252
	moveq.l	#$13,d1					;$7213			;ff0252
	lea.l	($0800),a1				;$43f8,$0800		;ff0254
	btst.b	#$05,($0005,a1)				;$0829,$0005,$0005	;ff0258
	bne.s	Lff026a					;$660a			;ff025e
	moveq.l	#$10,d1					;$7210			;ff0260
	btst.b	#$07,($0005,a1)				;$0829,$0007,$0005	;ff0262
	beq.s	Lff0282					;$6718			;ff0268
Lff026a:									;ff026a
	move.b	#$31,($00e8e00d)			;$13fc,$0031,$00e8,$e00d	;ff026a
	move.b	d1,($00ed001d)				;$13c1,$00ed,$001d	;ff0272
	clr.b	($00e8e00d)				;$4239,$00e8,$e00d	;ff0278
	IOCS	_CRTMOD					;$7010,$4e4f		;ff027e
Lff0282:									;ff0282
	bsr.w	Lff0e76					;$6100,$0bf2		;ff0282
	clr.b	($09de)					;$4238,$09de		;ff0286
	move.b	($080e),d0				;$1038,$080e		;ff028a
	move.b	($00ed0058),d1				;$1239,$00ed,$0058	;ff028e
	eor.b	d1,d0					;$b300			;ff0294
	btst.l	#$03,d0					;$0800,$0003		;ff0296
	beq.s	Lff02a8					;$670c			;ff029a
	move.b	#$01,($09de)				;$11fc,$0001,$09de	;ff029c
	movea.l	(Lff0008,pc),a0				;$207a,$fd64		;ff02a2
	jsr	(a0)					;$4e90			;ff02a6
Lff02a8:									;ff02a8
	moveq.l	#$02,d1					;$7202			;ff02a8
	moveq.l	#$ac,d0					;$70ac			;ff02aa
	trap	#15					;$4e4f			;ff02ac
	bsr.w	Lff1758					;$6100,$14a8		;ff02ae
	lea.l	(Lff0b88,pc),a1				;$43fa,$08d4		;ff02b2
	bsr.w	Lff0728					;$6100,$0470		;ff02b6
	btst.b	#$01,($080e)				;$0838,$0001,$080e	;ff02ba
	beq.s	Lff02de					;$671c			;ff02c0
	lea.l	(Lff051e,pc),a1				;$43fa,$025a		;ff02c2
	move.w	#$9000,d1				;$323c,$9000		;ff02c6
	jsr	(a1)					;$4e91			;ff02ca
	move.w	#$9100,d1				;$323c,$9100		;ff02cc
	jsr	(a1)					;$4e91			;ff02d0
	move.w	#$9200,d1				;$323c,$9200		;ff02d2
	jsr	(a1)					;$4e91			;ff02d6
	move.w	#$9300,d1				;$323c,$9300		;ff02d8
	jsr	(a1)					;$4e91			;ff02dc
Lff02de:									;ff02de
	cmpi.b	#$02,($09df)				;$0c38,$0002,$09df	;ff02de
	bne.s	Lff0300					;$661a			;ff02e4
	movea.l	($00ed001e),a0				;$2079,$00ed,$001e	;ff02e6
	move.l	a0,d0					;$2008			;ff02ec
	beq.s	Lff0300					;$6710			;ff02ee
	cmpi.b	#$60,(a0)				;$0c10,$0060		;ff02f0
	bne.s	Lff0300					;$660a			;ff02f4
	bsr.w	Lff080a					;$6100,$0512		;ff02f6
	jsr	(a0)					;$4e90			;ff02fa
	bra.w	Lff1a16					;$6000,$1718		;ff02fc
Lff0300:									;ff0300
	move.w	($00ed0092),d0				;$3039,$00ed,$0092	;ff0300
	bne.s	Lff030c					;$6604			;ff0306
	move.w	#$0a04,d0				;$303c,$0a04		;ff0308
Lff030c:									;ff030c
	lea.l	($0800),a1				;$43f8,$0800		;ff030c
	btst.b	#$01,($000b,a1)				;$0829,$0001,$000b	;ff0310
	bne.s	Lff033c					;$6624			;ff0316
	btst.b	#$00,($000b,a1)				;$0829,$0000,$000b	;ff0318
	bne.s	Lff0328					;$6608			;ff031e
	tst.b	($000a,a1)				;$4a29,$000a		;ff0320
	bpl.s	Lff0360					;$6a3a			;ff0324
	lsr.w	#8,d0					;$e048			;ff0326
Lff0328:									;ff0328
	cmpi.b	#$01,($0cbc)				;$0c38,$0001,$0cbc	;ff0328
	bls.s	Lff033c					;$630c			;ff032e
	move.b	d0,($00e8e009)				;$13c0,$00e8,$e009	;ff0330
	moveq.l	#$00,d0					;$7000			;ff0336
	movec.l	d0,cacr					;$4e7b,$0002		;ff0338
Lff033c:									;ff033c
	movea.l	(Lff000c,pc),a0				;$207a,$fcce		;ff033c
	move.l	($0002,a0),d0				;$2028,$0002		;ff0340
	add.l	($0006,a0),d0				;$d0a8,$0006		;ff0344
	lea.l	($001c,a0),a0				;$41e8,$001c		;ff0348
	lea.l	($6800),a1				;$43f8,$6800		;ff034c
Lff0350:									;ff0350
	move.b	(a0)+,(a1)+				;$12d8			;ff0350
	subq.l	#1,d0					;$5380			;ff0352
	bne.s	Lff0350					;$66fa			;ff0354
	move.b	#$90,($09e0)				;$11fc,$0090,$09e0	;ff0356
	jmp	($6800)					;$4ef8,$6800		;ff035c

Lff0360:									;ff0360
	cmpi.b	#$01,($0cbc)				;$0c38,$0001,$0cbc	;ff0360
	bls.s	Lff0386					;$631e			;ff0366
	btst.b	#$06,($000a,a1)				;$0829,$0006,$000a	;ff0368
	bne.s	Lff037a					;$660a			;ff036e
	btst.b	#$05,($000a,a1)				;$0829,$0005,$000a	;ff0370
	beq.s	Lff0386					;$670e			;ff0376
	lsr.w	#8,d0					;$e048			;ff0378
Lff037a:									;ff037a
	move.b	d0,($00e8e009)				;$13c0,$00e8,$e009	;ff037a
	moveq.l	#$00,d0					;$7000			;ff0380
	movec.l	d0,cacr					;$4e7b,$0002		;ff0382
Lff0386:									;ff0386
	move.w	($00ed0018),d1				;$3239,$00ed,$0018	;ff0386
	beq.s	Lff03ac					;$671e			;ff038c
	btst.b	#$02,($000e,a1)				;$0829,$0002,$000e	;ff038e
	bne.s	Lff03ac					;$6616			;ff0394
	move.w	d1,d0					;$3001			;ff0396
	and.w	#$f000,d0				;$c07c,$f000		;ff0398
	rol.w	#4,d0					;$e958			;ff039c
	subq.w	#8,d0					;$5140			;ff039e
	beq.s	Lff03d8					;$6736			;ff03a0
	subq.w	#2,d0					;$5540			;ff03a2
	bcs.s	Lff03ce					;$6528			;ff03a4
	beq.s	Lff03de					;$6736			;ff03a6
	subq.w	#1,d0					;$5340			;ff03a8
	beq.s	Lff03e2					;$6736			;ff03aa
Lff03ac:									;ff03ac
	bsr.w	Lff0524					;$6100,$0176		;ff03ac
	bsr.w	Lff04a8					;$6100,$00f6		;ff03b0
	bsr.w	Lff045e					;$6100,$00a8		;ff03b4
	bsr.w	Lff048e					;$6100,$00d4		;ff03b8
	bra.s	Lff03f2					;$6034			;ff03bc
Lff03be:									;ff03be
	move.w	d1,-(a7)				;$3f01			;ff03be
	moveq.l	#$05,d2					;$7405			;ff03c0
	bsr.s	Lff03e8					;$6124			;ff03c2
	move.w	(a7)+,d1				;$321f			;ff03c4
	lea.l	(Lff0b88,pc),a1				;$43fa,$07c0		;ff03c6
	bsr.w	Lff0728					;$6100,$035c		;ff03ca
Lff03ce:									;ff03ce
	bsr.w	Lff04fa					;$6100,$012a		;ff03ce
	bsr.w	Lff0544					;$6100,$0170		;ff03d2
	bra.s	Lff03ac					;$60d4			;ff03d6
Lff03d8:									;ff03d8
	bsr.w	Lff04be					;$6100,$00e4		;ff03d8
	bra.s	Lff03ac					;$60ce			;ff03dc
Lff03de:									;ff03de
	bsr.s	Lff045e					;$617e			;ff03de
	bra.s	Lff03ac					;$60ca			;ff03e0
Lff03e2:									;ff03e2
	bsr.w	Lff048e					;$6100,$00aa		;ff03e2
	bra.s	Lff03ac					;$60c4			;ff03e6
Lff03e8:									;ff03e8
	move.w	#$9070,d1				;$323c,$9070		;ff03e8
	IOCS	_B_DRVCHK				;$704e,$4e4f		;ff03ec
	rts						;$4e75			;ff03f0

Lff03f2:									;ff03f2
	bsr.w	Lff07e8					;$6100,$03f4		;ff03f2
	lea.l	($2000),a7				;$4ff8,$2000		;ff03f6
	tst.b	($09de)					;$4a38,$09de		;ff03fa
	bne.s	Lff0446					;$6646			;ff03fe
	lea.l	(Lff0a90,pc),a1				;$43fa,$068e		;ff0400
	bsr.w	Lff0728					;$6100,$0322		;ff0404
	bset.b	#$00,($00e8002a)			;$08f9,$0000,$00e8,$002a	;ff0408
	lea.l	(Lff0820,pc),a1				;$43fa,$040e		;ff0410
	move.w	(Lff09e4,pc),d1				;$323a,$05ce		;ff0414
	move.w	(Lff09e6,pc),d2				;$343a,$05cc		;ff0418
	IOCS	_TEXTPUT				;$701b,$4e4f		;ff041c
	bclr.b	#$00,($00e8002a)			;$08b9,$0000,$00e8,$002a	;ff0420
	moveq.l	#$04,d2					;$7404			;ff0428
	bsr.s	Lff03e8					;$61bc			;ff042a
Lff042c:									;ff042c
	move.w	#$9070,d1				;$323c,$9070		;ff042c
Lff0430:									;ff0430
	IOCS	_B_DRVSNS				;$7044,$4e4f		;ff0430
	btst.l	#$1d,d0					;$0800,$001d		;ff0434
	bne.s	Lff03be					;$6684			;ff0438
	add.w	#$0100,d1				;$d27c,$0100		;ff043a
	cmp.w	#$9470,d1				;$b27c,$9470		;ff043e
	bne.s	Lff0430					;$66ec			;ff0442
	bra.s	Lff042c					;$60e6			;ff0444
Lff0446:									;ff0446
	lea.l	(Lff0a43,pc),a1				;$43fa,$05fb		;ff0446
	bsr.w	Lff0728					;$6100,$02dc		;ff044a
	move.w	#$007c,-(a7)				;$3f3c,$007c		;ff044e
	pea.l	(Start,pc)				;$487a,$fbe4		;ff0452
	move.w	sr,-(a7)				;$40e7			;ff0456
	move.l	($007c),-(a7)				;$2f38,$007c		;ff0458
	rts						;$4e75			;ff045c

Lff045e:									;ff045e
	movea.l	($00ed000c),a0				;$2079,$00ed,$000c	;ff045e
	movea.l	a7,a6					;$2c4f			;ff0464
	lea.l	(Lff0486,pc),a1				;$43fa,$001e		;ff0466
	movea.l	($0008),a2				;$2478,$0008		;ff046a
	move.l	a1,($0008)				;$21c9,$0008		;ff046e
	movea.l	(a0),a3					;$2650			;ff0472
	move.l	a2,($0008)				;$21ca,$0008		;ff0474
	move.b	#$01,($09e0)				;$11fc,$0001,$09e0	;ff0478
	bsr.w	Lff080a					;$6100,$038a		;ff047e
	jsr	(a3)					;$4e93			;ff0482
	rts						;$4e75			;ff0484

Lff0486:									;ff0486
	movea.l	a6,a7					;$2e4e			;ff0486
	move.l	a2,($0008)				;$21ca,$0008		;ff0488
	rts						;$4e75			;ff048c

Lff048e:									;ff048e
	movea.l	($00ed0010),a0				;$2079,$00ed,$0010	;ff048e
	cmpi.b	#$60,(a0)				;$0c10,$0060		;ff0494
	bne.s	Lff04a6					;$660c			;ff0498
	move.b	#$02,($09e0)				;$11fc,$0002,$09e0	;ff049a
	bsr.w	Lff080a					;$6100,$0368		;ff04a0
	jsr	(a0)					;$4e90			;ff04a4
Lff04a6:									;ff04a6
	rts						;$4e75			;ff04a6

Lff04a8:									;ff04a8
	move.w	#$8000,d1				;$323c,$8000		;ff04a8
Lff04ac:									;ff04ac
	bsr.s	Lff04be					;$6110			;ff04ac
	tst.b	d0					;$4a00			;ff04ae
	bne.s	Lff04bc					;$660a			;ff04b0
	add.w	#$0100,d1				;$d27c,$0100		;ff04b2
	cmp.w	#$9000,d1				;$b27c,$9000		;ff04b6
	bne.s	Lff04ac					;$66f0			;ff04ba
Lff04bc:									;ff04bc
	rts						;$4e75			;ff04bc

Lff04be:									;ff04be
	moveq.l	#$00,d2					;$7400			;ff04be
	move.l	#$00000400,d3				;$263c,$0000,$0400	;ff04c0
	lea.l	($2000),a1				;$43f8,$2000		;ff04c6
	IOCS	_B_RECALI				;$7047,$4e4f		;ff04ca
	tst.b	d0					;$4a00			;ff04ce
	bne.s	Lff04f0					;$661e			;ff04d0
	moveq.l	#$46,d0					;$7046			;ff04d2
	move.l	a1,-(a7)				;$2f09			;ff04d4
	trap	#15					;$4e4f			;ff04d6
	movea.l	(a7)+,a1				;$225f			;ff04d8
	tst.b	d0					;$4a00			;ff04da
	bne.s	Lff04f0					;$6612			;ff04dc
	cmpi.b	#$60,(a1)				;$0c11,$0060		;ff04de
	bne.s	Lff04f0					;$660c			;ff04e2
	lsr.w	#8,d1					;$e049			;ff04e4
	move.b	d1,($09e0)				;$11c1,$09e0		;ff04e6
	bsr.w	Lff080a					;$6100,$031e		;ff04ea
	jmp	(a1)					;$4ed1			;ff04ee

Lff04f0:									;ff04f0
	move.l	d0,-(a7)				;$2f00			;ff04f0
	IOCS	_B_EJECT				;$704f,$4e4f		;ff04f2
	move.l	(a7)+,d0				;$201f			;ff04f6
	rts						;$4e75			;ff04f8

Lff04fa:									;ff04fa
	movem.l	d0-d2,-(a7)				;$48e7,$e000		;ff04fa
	move.w	#$015d,d2				;$343c,$015d		;ff04fe
Lff0502:									;ff0502
	move.l	#$000000c8,d0				;$203c,$0000,$00c8	;ff0502
	bsr.w	Lff0d12					;$6100,$0808		;ff0508
	IOCS	_B_DRVSNS				;$7044,$4e4f		;ff050c
	btst.l	#$1d,d0					;$0800,$001d		;ff0510
	dbne.w	d2,Lff0502				;$56ca,$ffec		;ff0514
	movem.l	(a7)+,d0-d2				;$4cdf,$0007		;ff0518
	rts						;$4e75			;ff051c

Lff051e:									;ff051e
	IOCS	_B_EJECT				;$704f,$4e4f		;ff051e
	rts						;$4e75			;ff0522

Lff0524:									;ff0524
	move.w	#$9070,d1				;$323c,$9070		;ff0524
	bsr.s	Lff04fa					;$61d0			;ff0528
	lea.l	(Lff0544,pc),a1				;$43fa,$0018		;ff052a
	bsr.s	Lff0544					;$6114			;ff052e
	move.w	#$9170,d1				;$323c,$9170		;ff0530
	bsr.s	Lff0544					;$610e			;ff0534
	move.w	#$9270,d1				;$323c,$9270		;ff0536
	bsr.s	Lff0544					;$6108			;ff053a
	move.w	#$9370,d1				;$323c,$9370		;ff053c
	bsr.s	Lff0544					;$6102			;ff0540
	rts						;$4e75			;ff0542

Lff0544:									;ff0544
	moveq.l	#$01,d2					;$7401			;ff0544
	move.l	#$00000400,d3				;$263c,$0000,$0400	;ff0546
	lea.l	($2000),a1				;$43f8,$2000		;ff054c
	movem.l	d1-d4/a1,-(a7)				;$48e7,$7840		;ff0550
	move.w	#$013f,d4				;$383c,$013f		;ff0554
Lff0558:									;ff0558
	IOCS	_B_DRVSNS				;$7044,$4e4f		;ff0558
	btst.l	#$1d,d0					;$0800,$001d		;ff055c
	dbne.w	d4,Lff0558				;$56cc,$fff6		;ff0560
	beq.s	Lff05b4					;$674e			;ff0564
	IOCS	_B_RECALI				;$7047,$4e4f		;ff0566
	btst.l	#$1e,d0					;$0800,$001e		;ff056a
	bne.s	Lff05b4					;$6644			;ff056e
	IOCS	_B_READID				;$704a,$4e4f		;ff0570
	btst.l	#$1e,d0					;$0800,$001e		;ff0574
	bne.s	Lff05b4					;$663a			;ff0578
	move.w	d1,d0					;$3001			;ff057a
	lsr.w	#8,d0					;$e048			;ff057c
	and.w	#$0003,d0				;$c07c,$0003		;ff057e
	lsl.w	#3,d0					;$e748			;ff0582
	lea.l	($0c90),a0				;$41f8,$0c90		;ff0584
	adda.w	d0,a0					;$d0c0			;ff0588
	moveq.l	#$00,d0					;$7000			;ff058a
	move.b	($0006,a0),d0				;$1028,$0006		;ff058c
	ror.l	#8,d0					;$e098			;ff0590
	or.l	d0,d2					;$8480			;ff0592
	moveq.l	#$46,d0					;$7046			;ff0594
	move.l	a1,-(a7)				;$2f09			;ff0596
	trap	#15					;$4e4f			;ff0598
	movea.l	(a7)+,a1				;$225f			;ff059a
	btst.l	#$1e,d0					;$0800,$001e		;ff059c
	bne.s	Lff05b4					;$6612			;ff05a0
	cmpi.b	#$60,(a1)				;$0c11,$0060		;ff05a2
	bne.s	Lff05b4					;$660c			;ff05a6
	lsr.w	#8,d1					;$e049			;ff05a8
	move.b	d1,($09e0)				;$11c1,$09e0		;ff05aa
	bsr.w	Lff080a					;$6100,$025a		;ff05ae
	jmp	(a1)					;$4ed1			;ff05b2

Lff05b4:									;ff05b4
	IOCS	_B_EJECT				;$704f,$4e4f		;ff05b4
	movem.l	(a7)+,d1-d4/a1				;$4cdf,$021e		;ff05b8
	rts						;$4e75			;ff05bc

Lff05be:									;ff05be
	move.l	#$ffffffff,($09d2)			;$21fc,$ffff,$ffff,$09d2	;ff05be
	move.b	#$00,($00e8e001)			;$13fc,$0000,$00e8,$e001	;ff05c6
	lea.l	($00e88000),a0				;$41f9,$00e8,$8000	;ff05ce
	move.b	#$00,($0005,a0)				;$117c,$0000,$0005	;ff05d4
	move.w	(a0),d0					;$3010			;ff05da
	btst.l	#$02,d0					;$0800,$0002		;ff05dc
	beq.w	Lff06e8					;$6700,$0106		;ff05e0
	btst.l	#$01,d0					;$0800,$0001		;ff05e4
	beq.w	Lff06ee					;$6700,$0104		;ff05e8
	btst.l	#$00,d0					;$0800,$0000		;ff05ec
	beq.s	Lff0612					;$6720			;ff05f0
Lff05f2:									;ff05f2
	move.b	#$04,($00e8a01f)			;$13fc,$0004,$00e8,$a01f	;ff05f2
	move.l	#$0000cb20,d0				;$203c,$0000,$cb20	;ff05fa
	bsr.w	Lff0d12					;$6100,$0710		;ff0600
	move.b	($00ed002a),d1				;$1239,$00ed,$002a	;ff0604
	IOCS	_TVCTRL					;$700c,$4e4f		;ff060a
	bra.w	Lff1a16					;$6000,$1406		;ff060e
Lff0612:									;ff0612
	tst.b	($00ed0026)				;$4a39,$00ed,$0026	;ff0612
	bne.s	Lff05f2					;$66d8			;ff0618
	lea.l	($00e8a000),a0				;$41f9,$00e8,$a000	;ff061a
	move.b	#$01,($001b,a0)				;$117c,$0001,$001b	;ff0620
	tst.b	($00e9a001)				;$4a39,$00e9,$a001	;ff0626
	tst.b	($00e9a001)				;$4a39,$00e9,$a001	;ff062c
	move.b	#$05,($0001,a0)				;$117c,$0005,$0001	;ff0632
	tst.b	($00e9a001)				;$4a39,$00e9,$a001	;ff0638
	tst.b	($00e9a001)				;$4a39,$00e9,$a001	;ff063e
	move.b	#$0c,($001b,a0)				;$117c,$000c,$001b	;ff0644
	move.l	($00ed0014),($09d2)			;$21f9,$00ed,$0014,$09d2	;ff064a
	clr.l	($09d6)					;$42b8,$09d6		;ff0652
	move.l	($00ed001e),d1				;$2239,$00ed,$001e	;ff0656
	beq.s	Lff06d2					;$6774			;ff065c
	cmp.l	#$00000040,d1				;$b2bc,$0000,$0040	;ff065e
	bcc.s	Lff06d2					;$646c			;ff0664
	cmp.b	#$20,d1					;$b23c,$0020		;ff0666
	bcs.s	Lff067a					;$650e			;ff066a
	and.b	#$1f,d1					;$c23c,$001f		;ff066c
	move.w	d1,-(a7)				;$3f01			;ff0670
	moveq.l	#$25,d1					;$7225			;ff0672
	IOCS	_TVCTRL					;$700c,$4e4f		;ff0674
	move.w	(a7)+,d1				;$321f			;ff0678
Lff067a:									;ff067a
	IOCS	_TVCTRL					;$700c,$4e4f		;ff067a
	lea.l	($00e88000),a0				;$41f9,$00e8,$8000	;ff067e
Lff0684:									;ff0684
	move.w	(a0),d0					;$3010			;ff0684
	btst.l	#$02,d0					;$0800,$0002		;ff0686
	beq.s	Lff06e8					;$675c			;ff068a
	btst.l	#$01,d0					;$0800,$0001		;ff068c
	beq.s	Lff06ee					;$675c			;ff0690
	btst.l	#$00,d0					;$0800,$0000		;ff0692
	beq.s	Lff0684					;$67ec			;ff0696
	cmpi.l	#$ffffffff,($09d2)			;$0cb8,$ffff,$ffff,$09d2	;ff0698
	beq.s	Lff06ce					;$672c			;ff06a0
	move.b	#$04,($00e8a01f)			;$13fc,$0004,$00e8,$a01f	;ff06a2
	tst.b	($00e9a001)				;$4a39,$00e9,$a001	;ff06aa
	tst.b	($00e9a001)				;$4a39,$00e9,$a001	;ff06b0
	move.b	#$08,($00e8a01b)			;$13fc,$0008,$00e8,$a01b	;ff06b6
Lff06be:									;ff06be
	move.w	(a0),d0					;$3010			;ff06be
	btst.l	#$02,d0					;$0800,$0002		;ff06c0
	beq.s	Lff06e8					;$6722			;ff06c4
	btst.l	#$01,d0					;$0800,$0001		;ff06c6
	beq.s	Lff06ee					;$6722			;ff06ca
	bra.s	Lff06be					;$60f0			;ff06cc
Lff06ce:									;ff06ce
	bra.w	Lff1a16					;$6000,$1346		;ff06ce
Lff06d2:									;ff06d2
	move.b	#$02,($09df)				;$11fc,$0002,$09df	;ff06d2
	move.l	($00ed001e),d0				;$2039,$00ed,$001e	;ff06d8
	cmp.l	#$ffffffff,d0				;$b0bc,$ffff,$ffff	;ff06de
	bne.s	Lff0720					;$663a			;ff06e4
	rts						;$4e75			;ff06e6

Lff06e8:									;ff06e8
	clr.b	($09df)					;$4238,$09df		;ff06e8
	bra.s	Lff06f4					;$6006			;ff06ec
Lff06ee:									;ff06ee
	move.b	#$01,($09df)				;$11fc,$0001,$09df	;ff06ee
Lff06f4:									;ff06f4
	lea.l	($00e8a000),a0				;$41f9,$00e8,$a000	;ff06f4
	move.b	#$01,($001b,a0)				;$117c,$0001,$001b	;ff06fa
	move.b	($00ed0026),d0				;$1039,$00ed,$0026	;ff0700
	beq.s	Lff070a					;$6702			;ff0706
	moveq.l	#$07,d0					;$7007			;ff0708
Lff070a:									;ff070a
	move.b	d0,($0001,a0)				;$1140,$0001		;ff070a
	tst.b	($00e9a001)				;$4a39,$00e9,$a001	;ff070e
	tst.b	($00e9a001)				;$4a39,$00e9,$a001	;ff0714
	move.b	#$08,($001b,a0)				;$117c,$0008,$001b	;ff071a
Lff0720:									;ff0720
	moveq.l	#$3d,d1					;$723d			;ff0720
	IOCS	_TVCTRL					;$700c,$4e4f		;ff0722
	rts						;$4e75			;ff0726

Lff0728:									;ff0728
	IOCS	_B_PRINT				;$7021,$4e4f		;ff0728
	rts						;$4e75			;ff072c

Lff072e:									;ff072e
	move.w	#$00ff,d0				;$303c,$00ff		;ff072e
	moveq.l	#$00,d1					;$7200			;ff0732
	tst.b	d7					;$4a07			;ff0734
	nop						;$4e71			;ff0736
	moveq.l	#$01,d1					;$7201			;ff0738
	ror.l	#8,d1					;$e099			;ff073a
Lff073c:									;ff073c
	move.l	a1,(a0)+				;$20c9			;ff073c
	adda.l	d1,a1					;$d3c1			;ff073e
	dbra.w	d0,Lff073c				;$51c8,$fffa		;ff0740
	rts						;$4e75			;ff0744

Lff0746:									;ff0746
	move.b	#$0c,($00e8e007)			;$13fc,$000c,$00e8,$e007	;ff0746
	movem.l	d0-d7/a0-a6,-(a7)			;$48e7,$fffe		;ff074e
	move.w	#$301f,d7				;$3e3c,$301f		;ff0752
	lea.l	($003c,a7),a6				;$4def,$003c		;ff0756
	trap	#14					;$4e4e			;ff075a
	movem.l	(a7)+,d0-d7/a0-a6			;$4cdf,$7fff		;ff075c
	rte						;$4e73			;ff0760

Lff0762:									;ff0762
	moveq.l	#$00,d7					;$7e00			;ff0762
	move.w	($0006,a7),d7				;$3e2f,$0006		;ff0764
	and.w	#$0fff,d7				;$ce7c,$0fff		;ff0768
	lsr.w	#2,d7					;$e44f			;ff076c
	bra.s	Lff07b2					;$6042			;ff076e
DefaultExceptionHandler:							;ff0770
	bsr.w	Lff0774					;$6100,$0002		;ff0770
Lff0774:									;ff0774
	move.l	(a7)+,d7				;$2e1f			;ff0774
	tst.b	($0cbc)					;$4a38,$0cbc		;ff0776
	bne.s	Lff0762					;$66e6			;ff077a
	clr.w	d7					;$4247			;ff077c
	swap.w	d7					;$4847			;ff077e
	lsr.w	#8,d7					;$e04f			;ff0780
	cmp.w	#$0003,d7				;$be7c,$0003		;ff0782
	bhi.s	Lff07b2					;$622a			;ff0786
	addq.l	#6,a7					;$5c8f			;ff0788
	swap.w	d7					;$4847			;ff078a
	move.w	(a7)+,d7				;$3e1f			;ff078c
	movea.l	($0002,a7),a6				;$2c6f,$0002		;ff078e
	cmp.w	(a6),d7					;$be56			;ff0792
	beq.s	Lff07aa					;$6714			;ff0794
	cmp.w	-(a6),d7				;$be66			;ff0796
	beq.s	Lff07aa					;$6710			;ff0798
	cmp.w	-(a6),d7				;$be66			;ff079a
	beq.s	Lff07aa					;$670c			;ff079c
	cmp.w	-(a6),d7				;$be66			;ff079e
	beq.s	Lff07aa					;$6708			;ff07a0
	cmp.w	-(a6),d7				;$be66			;ff07a2
	beq.s	Lff07aa					;$6704			;ff07a4
	cmp.w	-(a6),d7				;$be66			;ff07a6
	bne.s	Lff07ae					;$6604			;ff07a8
Lff07aa:									;ff07aa
	move.l	a6,($0002,a7)				;$2f4e,$0002		;ff07aa
Lff07ae:									;ff07ae
	clr.w	d7					;$4247			;ff07ae
	swap.w	d7					;$4847			;ff07b0
Lff07b2:									;ff07b2
	movea.l	a7,a6					;$2c4f			;ff07b2
	trap	#14					;$4e4e			;ff07b4
Lff07b6:									;ff07b6
	move.w	#$00ff,d0				;$303c,$00ff		;ff07b6
	trap	#15					;$4e4f			;ff07ba
	bra.s	Lff07b6					;$60f8			;ff07bc
Lff07be:									;ff07be
	bsr.s	Lff07e8					;$6128			;ff07be
	lea.l	(Lff0b53),a1				;$43f9,$00ff,$0b53	;ff07c0
	bsr.w	Lff0728					;$6100,$ff60		;ff07c6
Lff07ca:									;ff07ca
	bra.s	Lff07ca					;$60fe			;ff07ca
Lff07cc:									;ff07cc
	clr.w	($0ade)					;$4278,$0ade		;ff07cc
	clr.b	($0bc4)					;$4238,$0bc4		;ff07d0
	clr.b	($0bc5)					;$4238,$0bc5		;ff07d4
	bset.b	#$04,($00e88013)			;$08f9,$0004,$00e8,$8013	;ff07d8
	bclr.b	#$07,($0bbf)				;$08b8,$0007,$0bbf	;ff07e0
	rts						;$4e75			;ff07e6

Lff07e8:									;ff07e8
	movem.l	d0/a0,-(a7)				;$48e7,$8080		;ff07e8
	move.b	($093c),d0				;$1038,$093c		;ff07ec
	cmp.b	#$13,d0					;$b03c,$0013		;ff07f0
	bne.s	Lff0804					;$660e			;ff07f4
	lea.l	($00e80014),a0				;$41f9,$00e8,$0014	;ff07f6
	move.w	#$0040,(a0)+				;$30fc,$0040		;ff07fc
	move.w	#$0010,(a0)				;$30bc,$0010		;ff0800
Lff0804:									;ff0804
	movem.l	(a7)+,d0/a0				;$4cdf,$0101		;ff0804
	rts						;$4e75			;ff0808

Lff080a:									;ff080a
	movem.l	d0/a0,-(a7)				;$48e7,$8080		;ff080a
	moveq.l	#$00,d0					;$7000			;ff080e
	lea.l	($00e80014),a0				;$41f9,$00e8,$0014	;ff0810
	move.w	d0,(a0)+				;$30c0			;ff0816
	move.w	d0,(a0)					;$3080			;ff0818
	movem.l	(a7)+,d0/a0				;$4cdf,$0101		;ff081a
	rts						;$4e75			;ff081e

Lff0820:									;ff0820
	ori.b	#$40,(-$0001)				;$0038,$0040,$ffff	;ff0820
	DOS	_CHANGE_PR				;$ffff			;ff0826
	DOS	_CHANGE_PR				;$ffff			;ff0828
	DOS	_CHANGE_PR				;$ffff			;ff082a
	DOS	_CHANGE_PR				;$ffff			;ff082c
	DOS	_CHANGE_PR				;$ffff			;ff082e
	DOS	_CHANGE_PR				;$ffff			;ff0830
	DOS	_CHANGE_PR				;$ffff			;ff0832
	DOS	_CHANGE_PR				;$ffff			;ff0834
	DOS	_CHANGE_PR				;$ffff			;ff0836
	DOS	_CHANGE_PR				;$ffff			;ff0838
	DOS	_CHANGE_PR				;$ffff			;ff083a
	DOS	_CHANGE_PR				;$ffff			;ff083c
	DOS	_CHANGE_PR				;$ffff			;ff083e
	DOS	_CHANGE_PR				;$ffff			;ff0840
	DOS	_CHANGE_PR				;$ffff			;ff0842
	DOS	_CHANGE_PR				;$ffff			;ff0844
	DOS	_CHANGE_PR				;$ffff			;ff0846
	DOS	_CHANGE_PR				;$ffff			;ff0848
	DOS	_CHANGE_PR				;$ffff			;ff084a
	DOS	_CHANGE_PR				;$ffff			;ff084c
	DOS	_CHANGE_PR				;$ffff			;ff084e
	DOS	_CHANGE_PR				;$ffff			;ff0850
	DOS	_CHANGE_PR				;$ffff			;ff0852
	DOS	_CHANGE_PR				;$ffff			;ff0854
	DOS	_CHANGE_PR				;$ffff			;ff0856
	DOS	_CHANGE_PR				;$ffff			;ff0858
	DOS	_CHANGE_PR				;$ffff			;ff085a
	DOS	_CHANGE_PR				;$ffff			;ff085c
	DOS	_CHANGE_PR				;$ffff			;ff085e
	DOS	_CHANGE_PR				;$ffff			;ff0860
	DOS	_CHANGE_PR				;$ffff			;ff0862
	DOS	_CHANGE_PR				;$ffff			;ff0864
	DOS	_CHANGE_PR				;$ffff			;ff0866
	DOS	_CHANGE_PR				;$ffff			;ff0868
	DOS	_CHANGE_PR				;$ffff			;ff086a
	DOS	_CHANGE_PR				;$ffff			;ff086c
	DOS	_CHANGE_PR				;$ffff			;ff086e
	DOS	_CHANGE_PR				;$ffff			;ff0870
	DOS	_CHANGE_PR				;$ffff			;ff0872
	DOS	_CHANGE_PR				;$ffff			;ff0874
	DOS	_CHANGE_PR				;$ffff			;ff0876
	DOS	_CHANGE_PR				;$ffff			;ff0878
	DOS	_CHANGE_PR				;$ffff			;ff087a
	DOS	_CHANGE_PR				;$ffff			;ff087c
	DOS	_CHANGE_PR				;$ffff			;ff087e
	DOS	_CHANGE_PR				;$ffff			;ff0880
	DOS	_CHANGE_PR				;$ffff			;ff0882
	DOS	_CHANGE_PR				;$ffff			;ff0884
	DOS	_CHANGE_PR				;$ffff			;ff0886
	DOS	_CHANGE_PR				;$ffff			;ff0888
	DOS	_CHANGE_PR				;$ffff			;ff088a
	DOS	_CHANGE_PR				;$ffff			;ff088c
	DOS	_CHANGE_PR				;$ffff			;ff088e
	DOS	_CHANGE_PR				;$ffff			;ff0890
	DOS	_CHANGE_PR				;$ffff			;ff0892
	DOS	_CHANGE_PR				;$ffff			;ff0894
	DOS	_CHANGE_PR				;$ffff			;ff0896
	DOS	_CHANGE_PR				;$ffff			;ff0898
	DOS	_CHANGE_PR				;$ffff			;ff089a
	DOS	_CHANGE_PR				;$ffff			;ff089c
	DOS	_CHANGE_PR				;$ffff			;ff089e
	DOS	_CHANGE_PR				;$ffff			;ff08a0
	ori.b	#$07,d0					;$0000,$0007		;ff08a2
	DOS	_CHANGE_PR				;$ffff			;ff08a6
	DOS	_EXIT					;$ff00			;ff08a8

Lff08aa:									;ff08aa
	.dc.b	$00,$00,$07,$ff,$ff,$ff,$00,$00					;ff08aa
	.dc.b	$03,$e7,$ff,$ff,$ff,$00,$00,$03					;ff08b2
	.dc.b	$e7,$ff,$ff,$ff,$00,$00,$03,$e7					;ff08ba
	.dc.b	$ff,$ff,$ff,$00,$00,$03,$e7,$ff					;ff08c2
	.dc.b	$ff,$ff,$00,$00,$03,$e7,$ff,$ff					;ff08ca
	.dc.b	$ff,$00,$00,$03,$e0,$03,$ff,$ff					;ff08d2
	.dc.b	$00,$00,$03,$e7,$fc,$ff,$ff,$00					;ff08da
	.dc.b	$00,$03,$e7,$ff,$7f,$ff,$00,$00					;ff08e2
	.dc.b	$00,$07,$ff,$7f,$ff,$00,$07,$80					;ff08ea
	.dc.b	$00,$3f,$bf,$ff,$00,$0f,$c3,$c7					;ff08f2
	.dc.b	$df,$bf,$ff,$3f,$8f,$c3,$e7,$df					;ff08fa
	.dc.b	$df,$ff,$3f,$8f,$c1,$f7,$ef,$df					;ff0902
	.dc.b	$ff,$00,$0f,$c0,$fb,$ef,$ef,$ff					;ff090a
	.dc.b	$00,$07,$80,$7c,$ef,$ef,$ff,$00					;ff0912
	.dc.b	$00,$00,$3f,$1f,$f7,$ff,$00,$08					;ff091a
	.dc.b	$00,$1f,$ff,$f7,$ff,$00,$00,$00					;ff0922
	.dc.b	$0f,$ff,$fb,$ff,$00,$00,$00,$0f					;ff092a
	.dc.b	$ff,$fb,$ff,$00,$00,$00,$07,$ff					;ff0932
	.dc.b	$fb,$ff,$00,$00,$00,$03,$ff,$fd					;ff093a
	.dc.b	$ff,$00,$00,$00,$05,$ff,$fd,$ff					;ff0942
	.dc.b	$00,$00,$00,$06,$ff,$fe,$ff,$00					;ff094a
	.dc.b	$00,$00,$07,$7f,$ff,$ff,$00,$00					;ff0952
	.dc.b	$07,$07,$8f,$ff,$ff,$00,$00,$07					;ff095a
	.dc.b	$07,$f1,$ff,$ff,$ff,$ff,$ff,$ff					;ff0962
	.dc.b	$fe,$7f,$ff,$ff,$ff,$ff,$ff,$ff					;ff096a
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff					;ff0972
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff					;ff097a
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff					;ff0982
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff					;ff098a
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff					;ff0992
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff					;ff099a
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff					;ff09a2
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff					;ff09aa
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff					;ff09b2
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff					;ff09ba
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff					;ff09c2
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff					;ff09ca
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff					;ff09d2
	.dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff					;ff09da
	.dc.b	$ff,$ff								;ff09e2
Lff09e4:									;ff09e4
	.dc.w	$01f8								;ff09e4
Lff09e6:									;ff09e6
	.dc.w	$00e0								;ff09e6
Lff09e8:									;ff09e8
	.dc.b	'Ｘ68000W',$00							;ff09e8
Lff09f1:									;ff09f1
	.dc.b	$40,$00,$00,$00,$fc,$00,$00,$00					;ff09f1
	.dc.b	$ed,$01,$00,$ff,$ff,$ff,$ff,$00					;ff09f9
	.dc.b	$00,$4e,$07,$00,$10,$00,$00,$00					;ff0a01
	.dc.b	$00,$ff,$ff,$00,$00,$07,$00,$0e					;ff0a09
	.dc.b	$00,$0d,$00,$00,$00						;ff0a11
Lff0a16:									;ff0a16
	.dc.b	$00,$00,$f8,$3e,$ff,$c0,$ff,$fe					;ff0a16
	.dc.b	$de,$6c,$40,$22,$03,$02,$00,$08					;ff0a1e
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00					;ff0a26
	.dc.b	$00,$00,$00,$ff,$f4,$00,$04,$00					;ff0a2e
	.dc.b	$01,$01,$00,$00,$00,$20,$00,$03					;ff0a36
	.dc.b	$f9,$01,$00,$00,$00						;ff0a3e
Lff0a43:									;ff0a43
	.dc.b	$1b,'[16;30Hディスクから起動できません。  ',$1b,'[17;30Hター'	;ff0a43
	.dc.b	'ミナルモニタを起動します。',$00				;ff0a75
Lff0a90:									;ff0a90
	.dc.b	$1b,'[43;1m',$1b,'[15;26H                                   '	;ff0a90
	.dc.b	'   ',$1b,'[16;26H      ディスクから起動できません。    ',$1b	;ff0ac2
	.dc.b	'[17;26H 正しいディスクをセットしてください。 ',$1b,'[18;26H'	;ff0af4
	.dc.b	'                                      ',$1b,'[m',$00		;ff0b29
Lff0b53:									;ff0b53
	.dc.b	$1b,'[20;26Hエラーが発生しました。リセットしてください。',$00	;ff0b53
Lff0b88:									;ff0b88
	.dc.b	$1a,$00								;ff0b88
Lff0b8a:									;ff0b8a
	.dc.b	$1a,$1b,'[43;1m',$1b,'[15;26H                               '	;ff0b8a
	.dc.b	'       ',$1b,'[16;26H      Ｓ-ＲＡＭを初期化します。       '	;ff0bb9
	.dc.b	$1b,'[17;26H      よろしいですか？(Y/N)           ',$1b,'[18'	;ff0bee
	.dc.b	';26H                                      ',$1b,'[m',$00	;ff0c20
Lff0c4e:									;ff0c4e
	link.w	a6,#-$002e				;$4e56,$ffd2		;ff0c4e
	move.w	#$002e,d0				;$303c,$002e		;ff0c52
	subq.w	#1,d0					;$5340			;ff0c56
	lea.l	(Lff0ce4,pc),a0				;$41fa,$008a		;ff0c58
	lea.l	(-$002e,a6),a1				;$43ee,$ffd2		;ff0c5c
Lff0c60:									;ff0c60
	move.b	(a0)+,(a1)+				;$12d8			;ff0c60
	dbra.w	d0,Lff0c60				;$51c8,$fffc		;ff0c62
	movem.l	d1-d2/a0-a1,-(a7)			;$48e7,$60c0		;ff0c66
	move.w	sr,-(a7)				;$40e7			;ff0c6a
	ori.w	#$0700,sr				;$007c,$0700		;ff0c6c
	lea.l	($00e88000),a0				;$41f9,$00e8,$8000	;ff0c70
	movep.w	($0013,a0),d0				;$0108,$0013		;ff0c76
	move.w	d0,-(a7)				;$3f00			;ff0c7a
	moveq.l	#$20,d0					;$7020			;ff0c7c
	movep.w	d0,($0013,a0)				;$0188,$0013		;ff0c7e
	movep.w	($0007,a0),d0				;$0108,$0007		;ff0c82
	move.w	d0,-(a7)				;$3f00			;ff0c86
	moveq.l	#$20,d0					;$7020			;ff0c88
	movep.w	d0,($0007,a0)				;$0188,$0007		;ff0c8a
	move.b	($001d,a0),-(a7)			;$1f28,$001d		;ff0c8e
	clr.b	($001d,a0)				;$4228,$001d		;ff0c92
	move.b	($0017,a0),-(a7)			;$1f28,$0017		;ff0c96
	move.b	#$40,($0017,a0)				;$117c,$0040,$0017	;ff0c9a
	move.l	($0114),-(a7)				;$2f38,$0114		;ff0ca0
	pea.l	(Lff0d08,pc)				;$487a,$0062		;ff0ca4
	move.l	(a7)+,($0114)				;$21df,$0114		;ff0ca8
	bsr.s	Lff0ce4					;$6136			;ff0cac
	move.w	d1,d2					;$3401			;ff0cae
	swap.w	d2					;$4842			;ff0cb0
	lea.l	(-$002e,a6),a1				;$43ee,$ffd2		;ff0cb2
	jsr	(a1)					;$4e91			;ff0cb6
	move.w	d1,d2					;$3401			;ff0cb8
	move.b	#$c8,($0023,a0)				;$117c,$00c8,$0023	;ff0cba
	move.l	(a7)+,($0114)				;$21df,$0114		;ff0cc0
	move.b	(a7)+,($0017,a0)			;$115f,$0017		;ff0cc4
	move.b	(a7)+,($001d,a0)			;$115f,$001d		;ff0cc8
	move.w	(a7)+,d0				;$301f			;ff0ccc
	movep.w	d0,($0007,a0)				;$0188,$0007		;ff0cce
	move.w	(a7)+,d0				;$301f			;ff0cd2
	movep.w	d0,($0013,a0)				;$0188,$0013		;ff0cd4
	move.l	d2,d0					;$2002			;ff0cd8
	move.w	(a7)+,sr				;$46df			;ff0cda
	movem.l	(a7)+,d1-d2/a0-a1			;$4cdf,$0306		;ff0cdc
	unlk	a6					;$4e5e			;ff0ce0
	rts						;$4e75			;ff0ce2

Lff0ce4:									;ff0ce4
	move.b	#$fa,($0023,a0)				;$117c,$00fa,$0023	;ff0ce4
	moveq.l	#$ff,d1					;$72ff			;ff0cea
	move.w	#$2500,sr				;$46fc,$2500		;ff0cec
	move.b	#$30,($001d,a0)				;$117c,$0030,$001d	;ff0cf0
Lff0cf6:									;ff0cf6
	dbra.w	d1,Lff0cf6				;$51c9,$fffe		;ff0cf6
Lff0cfa:									;ff0cfa
	ori.w	#$0700,sr				;$007c,$0700		;ff0cfa
	clr.b	($001d,a0)				;$4228,$001d		;ff0cfe
	neg.w	d1					;$4441			;ff0d02
	subq.w	#1,d1					;$5341			;ff0d04
	rts						;$4e75			;ff0d06

Lff0d08:									;ff0d08
	lea.l	(Lff0cfa,pc),a1				;$43fa,$fff0		;ff0d08
	move.l	a1,($0002,a7)				;$2f49,$0002		;ff0d0c
	rte						;$4e73			;ff0d10

Lff0d12:									;ff0d12
	movem.l	d0-d2/a0,-(a7)				;$48e7,$e080		;ff0d12
	lea.l	($00e88023),a0				;$41f9,$00e8,$8023	;ff0d16
	moveq.l	#$00,d1					;$7200			;ff0d1c
	move.b	(a0),d1					;$1210			;ff0d1e
	move.b	(a0),d1					;$1210			;ff0d20
Lff0d22:									;ff0d22
	moveq.l	#$00,d2					;$7400			;ff0d22
	move.b	(a0),d2					;$1410			;ff0d24
	cmp.b	(a0),d2					;$b410			;ff0d26
	bcs.s	Lff0d22					;$65f8			;ff0d28
	sub.w	d2,d1					;$9242			;ff0d2a
	bcc.s	Lff0d32					;$6404			;ff0d2c
	add.w	#$00c8,d1				;$d27c,$00c8		;ff0d2e
Lff0d32:									;ff0d32
	exg.l	d1,d2					;$c342			;ff0d32
	sub.l	d2,d0					;$9082			;ff0d34
	bhi.s	Lff0d22					;$62ea			;ff0d36
	movem.l	(a7)+,d0-d2/a0				;$4cdf,$0107		;ff0d38
	rts						;$4e75			;ff0d3c

Lff0d3e:									;ff0d3e
	.dc.b	$4e,$56,$ff,$f8,$2d,$78,$00,$10					;ff0d3e
	.dc.b	$ff,$fc,$2d,$78,$00,$2c,$ff,$f8					;ff0d46
	.dc.b	$41,$fa,$00,$e2,$21,$c8,$00,$10					;ff0d4e
	.dc.b	$41,$fa,$00,$d8,$21,$c8,$00,$2c					;ff0d56
	.dc.b	$70,$00,$41,$fa,$00,$04,$51,$fc					;ff0d5e
	.dc.b	$4a,$80,$66,$00,$00,$a8,$72,$02					;ff0d66
	.dc.b	$70,$00,$43,$fa,$00,$c8,$41,$fa					;ff0d6e
	.dc.b	$00,$06,$06,$d1,$00,$00,$4a,$80					;ff0d76
	.dc.b	$67,$6e,$72,$03,$70,$00,$41,$fa					;ff0d7e
	.dc.b	$00,$06,$4e,$7a,$98,$06,$4a,$80					;ff0d86
	.dc.b	$66,$02,$60,$5c,$9e,$fc,$00,$80					;ff0d8e
	.dc.b	$20,$4f,$20,$fc,$7f,$ff,$00,$02					;ff0d96
	.dc.b	$20,$0f,$e8,$88,$54,$80,$e9,$88					;ff0d9e
	.dc.b	$20,$80,$41,$fa,$00,$ac,$22,$40					;ff0da6
	.dc.b	$70,$07,$22,$d8,$51,$c8,$ff,$fc					;ff0dae
	.dc.b	$f0,$00,$24,$00,$f0,$17,$4c,$00					;ff0db6
	.dc.b	$43,$fa,$00,$8e,$f0,$11,$40,$00					;ff0dbe
	.dc.b	$43,$f9,$00,$f0,$00,$00,$41,$f9					;ff0dc6
	.dc.b	$00,$20,$00,$00,$30,$3c,$07,$ff					;ff0dce
	.dc.b	$b1,$89,$56,$c8,$ff,$fc,$66,$0c					;ff0dd6
	.dc.b	$43,$fa,$00,$72,$f0,$11,$40,$00					;ff0dde
	.dc.b	$08,$c1,$00,$1f,$de,$fc,$00,$80					;ff0de6
	.dc.b	$70,$00,$41,$fa,$00,$06,$f2,$80					;ff0dee
	.dc.b	$00,$00,$4a,$80,$66,$04,$08,$c1					;ff0df6
	.dc.b	$00,$0f								;ff0dfe
Lff0e00:									;ff0e00
	move.l	d1,d0					;$2001			;ff0e00
	move.l	(-$0004,a6),($0010)			;$21ee,$fffc,$0010	;ff0e02
	move.l	(-$0008,a6),($002c)			;$21ee,$fff8,$002c	;ff0e08
	unlk	a6					;$4e5e			;ff0e0e
	rts						;$4e75			;ff0e10

Lff0e12:									;ff0e12
	moveq.l	#$00,d1					;$7200			;ff0e12
	lea.l	(Lff0e20,pc),a0				;$41fa,$000a		;ff0e14
	move.l	a0,($0010)				;$21c8,$0010		;ff0e18
	movea.l	a7,a0					;$204f			;ff0e1c
	illegal						;$4afc			;ff0e1e
Lff0e20:									;ff0e20
	move.l	a7,d0					;$200f			;ff0e20
	movea.l	a0,a7					;$2e48			;ff0e22
	suba.l	d0,a0					;$91c0			;ff0e24
	cmpa.w	#$0006,a0				;$b0fc,$0006		;ff0e26
	beq.s	Lff0e00					;$67d4			;ff0e2a
	moveq.l	#$10,d1					;$7210			;ff0e2c
	bra.s	Lff0e00					;$60d0			;ff0e2e
Lff0e30:									;ff0e30
	nop						;$4e71			;ff0e30
	moveq.l	#$ff,d0					;$70ff			;ff0e32
	move.l	a0,($0002,a7)				;$2f48,$0002		;ff0e34
	rte						;$4e73			;ff0e38

Lff0e3a:									;ff0e3a
	.dc.b	$00,$00,$00,$00,$00,$ff,$0e,$4a					;ff0e3a
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00					;ff0e42
	.dc.b	$f0,$00,$06,$cf,$80,$d8,$34,$40					;ff0e4a
	.dc.b	$00,$d8,$34,$40,$00,$00,$00,$01					;ff0e52
	.dc.b	$00,$f0,$00,$01,$00,$40,$00,$01					;ff0e5a
	.dc.b	$00,$60,$00,$01,$00,$80,$00,$01					;ff0e62
	.dc.b	$00,$a0,$00,$01,$00,$c0,$00,$01					;ff0e6a
	.dc.b	$00,$e0,$00,$01							;ff0e72
Lff0e76:									;ff0e76
	movem.l	d0-d3/a0-a2,-(a7)			;$48e7,$f0e0		;ff0e76
	bsr.w	Lff10d8					;$6100,$025c		;ff0e7a
	bsr.s	Lff0ea0					;$6120			;ff0e7e
	moveq.l	#$00,d1					;$7200			;ff0e80
	moveq.l	#$ac,d0					;$70ac			;ff0e82
	trap	#15					;$4e4f			;ff0e84
	move.l	d0,d3					;$2600			;ff0e86
	bsr.w	Lff100c					;$6100,$0182		;ff0e88
	bsr.s	Lff0eea					;$615c			;ff0e8c
	bsr.w	Lff0f7e					;$6100,$00ee		;ff0e8e
	bsr.w	Lff0f8c					;$6100,$00f8		;ff0e92
	bsr.w	Lff0f9c					;$6100,$0104		;ff0e96
	movem.l	(a7)+,d0-d3/a0-a2			;$4cdf,$070f		;ff0e9a
	rts						;$4e75			;ff0e9e

Lff0ea0:									;ff0ea0
	move.w	#$0007,d1				;$323c,$0007		;ff0ea0
	IOCS	_B_COLOR				;$7022,$4e4f		;ff0ea4
	lea.l	(Lff1190,pc),a1				;$43fa,$02e6		;ff0ea8
	IOCS	_B_PRINT				;$7021,$4e4f		;ff0eac
	move.w	#$0003,d1				;$323c,$0003		;ff0eb0
	IOCS	_B_COLOR				;$7022,$4e4f		;ff0eb4
	move.b	#$02,d1					;$123c,$0002		;ff0eb8
	IOCS	_TCOLOR					;$7015,$4e4f		;ff0ebc
	lea.l	(Lff138c,pc),a1				;$43fa,$04ca		;ff0ec0
	move.w	#$0000,d2				;$343c,$0000		;ff0ec4
	move.w	#$0004,d1				;$323c,$0004		;ff0ec8
	IOCS	_TEXTPUT				;$701b,$4e4f		;ff0ecc
	move.b	#$01,d1					;$123c,$0001		;ff0ed0
	IOCS	_TCOLOR					;$7015,$4e4f		;ff0ed4
	lea.l	(Lff12a8,pc),a1				;$43fa,$03ce		;ff0ed8
	move.w	#$0000,d2				;$343c,$0000		;ff0edc
	move.w	#$0114,d1				;$323c,$0114		;ff0ee0
	IOCS	_TEXTPUT				;$701b,$4e4f		;ff0ee4
	rts						;$4e75			;ff0ee8

Lff0eea:									;ff0eea
	lea.l	(Lff11f5,pc),a1				;$43fa,$0309		;ff0eea
	IOCS	_B_PRINT				;$7021,$4e4f		;ff0eee
	move.w	d3,d1					;$3203			;ff0ef2
	andi.w	#$00ff,d1				;$0241,$00ff		;ff0ef4
	add.w	#$0030,d1				;$d27c,$0030		;ff0ef8
	IOCS	_B_PUTC					;$7020,$4e4f		;ff0efc
	lea.l	(Lff1219,pc),a1				;$43fa,$0317		;ff0f00
	IOCS	_B_PRINT				;$7021,$4e4f		;ff0f04
	bsr.s	Lff0f0c					;$6102			;ff0f08
	rts						;$4e75			;ff0f0a

Lff0f0c:									;ff0f0c
	link.w	a6,#-$0004				;$4e56,$fffc		;ff0f0c
	move.b	#$00,($0000.w,a6)			;$1d7c,$0000,$0000	;ff0f10
	move.l	d3,d1					;$2203			;ff0f16
	move.w	#$0000,d1				;$323c,$0000		;ff0f18
	swap.w	d1					;$4841			;ff0f1c
	cmp.w	#$000a,d1				;$b27c,$000a		;ff0f1e
	blt.s	Lff0f5e					;$6d3a			;ff0f22
	divu.w	#$000a,d1				;$82fc,$000a		;ff0f24
	swap.w	d1					;$4841			;ff0f28
	add.w	#$0030,d1				;$d27c,$0030		;ff0f2a
	move.b	d1,(-$0001,a6)				;$1d41,$ffff		;ff0f2e
	move.b	#$2e,(-$0002,a6)			;$1d7c,$002e,$fffe	;ff0f32
	move.w	#$0000,d1				;$323c,$0000		;ff0f38
	swap.w	d1					;$4841			;ff0f3c
	cmp.w	#$000a,d1				;$b27c,$000a		;ff0f3e
	blt.s	Lff0f5e					;$6d1a			;ff0f42
	divu.w	#$000a,d1				;$82fc,$000a		;ff0f44
	swap.w	d1					;$4841			;ff0f48
	add.w	#$0030,d1				;$d27c,$0030		;ff0f4a
	move.b	d1,(-$0003,a6)				;$1d41,$fffd		;ff0f4e
	move.w	#$0000,d1				;$323c,$0000		;ff0f52
	swap.w	d1					;$4841			;ff0f56
	cmp.w	#$000a,d1				;$b27c,$000a		;ff0f58
	bge.s	Lff0f78					;$6c1a			;ff0f5c
Lff0f5e:									;ff0f5e
	add.w	#$0030,d1				;$d27c,$0030		;ff0f5e
	move.b	d1,(-$0004,a6)				;$1d41,$fffc		;ff0f62
	movea.l	a7,a1					;$224f			;ff0f66
	IOCS	_B_PRINT				;$7021,$4e4f		;ff0f68
	lea.l	(Lff121f,pc),a1				;$43fa,$02b1		;ff0f6c
Lff0f70:									;ff0f70
	IOCS	_B_PRINT				;$7021,$4e4f		;ff0f70
	unlk	a6					;$4e5e			;ff0f74
	rts						;$4e75			;ff0f76

Lff0f78:									;ff0f78
	lea.l	(Lff121d,pc),a1				;$43fa,$02a3		;ff0f78
	bra.s	Lff0f70					;$60f2			;ff0f7c
Lff0f7e:									;ff0f7e
	tst.w	d3					;$4a43			;ff0f7e
	bpl.s	Lff0f8a					;$6a08			;ff0f80
	lea.l	(Lff1226,pc),a1				;$43fa,$02a2		;ff0f82
	IOCS	_B_PRINT				;$7021,$4e4f		;ff0f86
Lff0f8a:									;ff0f8a
	rts						;$4e75			;ff0f8a

Lff0f8c:									;ff0f8c
	btst.l	#$0e,d3					;$0803,$000e		;ff0f8c
	beq.s	Lff0f9a					;$6708			;ff0f90
	lea.l	(Lff1254,pc),a1				;$43fa,$02c0		;ff0f92
	IOCS	_B_PRINT				;$7021,$4e4f		;ff0f96
Lff0f9a:									;ff0f9a
	rts						;$4e75			;ff0f9a

Lff0f9c:									;ff0f9c
	lea.l	(Lff1280,pc),a1				;$43fa,$02e2		;ff0f9c
	IOCS	_B_PRINT				;$7021,$4e4f		;ff0fa0
	move.l	($0008),-(a7)				;$2f38,$0008		;ff0fa4
	lea.l	(Lff1002,pc),a1				;$43fa,$0058		;ff0fa8
	move.l	a1,($0008)				;$21c9,$0008		;ff0fac
	suba.l	a0,a0					;$91c8			;ff0fb0
	lea.l	($00c00000),a1				;$43f9,$00c0,$0000	;ff0fb2
	movea.l	a7,a2					;$244f			;ff0fb8
Lff0fba:									;ff0fba
	move.l	(a0),d0					;$2010			;ff0fba
	adda.l	#$00100000,a0				;$d1fc,$0010,$0000	;ff0fbc
	cmpa.l	a0,a1					;$b3c8			;ff0fc2
	bne.s	Lff0fba					;$66f4			;ff0fc4
Lff0fc6:									;ff0fc6
	move.l	(a7)+,($0008)				;$21df,$0008		;ff0fc6
	move.l	a0,d1					;$2208			;ff0fca
	swap.w	d1					;$4841			;ff0fcc
	lsr.w	#4,d1					;$e849			;ff0fce
	cmp.w	#$0009,d1				;$b27c,$0009		;ff0fd0
	bpl.s	Lff0fe0					;$6a0a			;ff0fd4
	add.w	#$0030,d1				;$d27c,$0030		;ff0fd6
	IOCS	_B_PUTC					;$7020,$4e4f		;ff0fda
	bra.s	Lff0ff8					;$6018			;ff0fde
Lff0fe0:									;ff0fe0
	move.w	d1,d2					;$3401			;ff0fe0
	move.w	#$0031,d1				;$323c,$0031		;ff0fe2
	IOCS	_B_PUTC					;$7020,$4e4f		;ff0fe6
	move.w	d2,d1					;$3202			;ff0fea
	sub.w	#$000a,d1				;$927c,$000a		;ff0fec
	add.w	#$0030,d1				;$d27c,$0030		;ff0ff0
	IOCS	_B_PUTC					;$7020,$4e4f		;ff0ff4
Lff0ff8:									;ff0ff8
	lea.l	(Lff129f,pc),a1				;$43fa,$02a5		;ff0ff8
	IOCS	_B_PRINT				;$7021,$4e4f		;ff0ffc
	rts						;$4e75			;ff1000

Lff1002:									;ff1002
	movea.l	a2,a7					;$2e4a			;ff1002
	lea.l	(Lff0fc6,pc),a1				;$43fa,$ffc0		;ff1004
	move.l	a1,-(a7)				;$2f09			;ff1008
	rts						;$4e75			;ff100a

Lff100c:									;ff100c
	link.w	a6,#-$0010				;$4e56,$fff0		;ff100c
	move.w	#$0007,d1				;$323c,$0007		;ff1010
	IOCS	_B_COLOR				;$7022,$4e4f		;ff1014
	lea.l	(Lff11e3,pc),a1				;$43fa,$01c9		;ff1018
	IOCS	_B_PRINT				;$7021,$4e4f		;ff101c
	move.l	#$0000008f,d0				;$203c,$0000,$008f	;ff1020
	trap	#15					;$4e4f			;ff1026
	move.b	#$00,(-$0001,a6)			;$1d7c,$0000,$ffff	;ff1028
	move.b	#$0a,(-$0002,a6)			;$1d7c,$000a,$fffe	;ff102e
	move.b	#$0d,(-$0003,a6)			;$1d7c,$000d,$fffd	;ff1034
	move.b	d0,(-$0004,a6)				;$1d40,$fffc		;ff103a
	andi.b	#$0f,(-$0004,a6)			;$022e,$000f,$fffc	;ff103e
	addi.b	#$30,(-$0004,a6)			;$062e,$0030,$fffc	;ff1044
	lsr.b	#4,d0					;$e808			;ff104a
	add.b	#$30,d0					;$d03c,$0030		;ff104c
	move.b	d0,(-$0005,a6)				;$1d40,$fffb		;ff1050
	move.b	#$2e,(-$0006,a6)			;$1d7c,$002e,$fffa	;ff1054
	lsr.w	#8,d0					;$e048			;ff105a
	move.b	d0,(-$0007,a6)				;$1d40,$fff9		;ff105c
	andi.b	#$0f,(-$0007,a6)			;$022e,$000f,$fff9	;ff1060
	addi.b	#$30,(-$0007,a6)			;$062e,$0030,$fff9	;ff1066
	lsr.b	#4,d0					;$e808			;ff106c
	add.b	#$30,d0					;$d03c,$0030		;ff106e
	move.b	d0,(-$0008,a6)				;$1d40,$fff8		;ff1072
	move.b	#$2e,(-$0009,a6)			;$1d7c,$002e,$fff7	;ff1076
	swap.w	d0					;$4840			;ff107c
	move.b	d0,(-$000a,a6)				;$1d40,$fff6		;ff107e
	andi.b	#$0f,(-$000a,a6)			;$022e,$000f,$fff6	;ff1082
	addi.b	#$30,(-$000a,a6)			;$062e,$0030,$fff6	;ff1088
	lsr.b	#4,d0					;$e808			;ff108e
	add.b	#$30,d0					;$d03c,$0030		;ff1090
	move.b	d0,(-$000b,a6)				;$1d40,$fff5		;ff1094
	move.b	#$27,(-$000c,a6)			;$1d7c,$0027,$fff4	;ff1098
	move.b	#$20,(-$000d,a6)			;$1d7c,$0020,$fff3	;ff109e
	lsr.w	#8,d0					;$e048			;ff10a4
	move.b	d0,(-$000e,a6)				;$1d40,$fff2		;ff10a6
	andi.b	#$0f,(-$000e,a6)			;$022e,$000f,$fff2	;ff10aa
	addi.b	#$30,(-$000e,a6)			;$062e,$0030,$fff2	;ff10b0
	move.b	#$2e,(-$000f,a6)			;$1d7c,$002e,$fff1	;ff10b6
	lsr.b	#4,d0					;$e808			;ff10bc
	add.b	#$30,d0					;$d03c,$0030		;ff10be
	move.b	d0,(-$0010,a6)				;$1d40,$fff0		;ff10c2
	movea.l	a7,a1					;$224f			;ff10c6
	IOCS	_B_PRINT				;$7021,$4e4f		;ff10c8
	move.w	#$0003,d1				;$323c,$0003		;ff10cc
	IOCS	_B_COLOR				;$7022,$4e4f		;ff10d0
	unlk	a6					;$4e5e			;ff10d4
	rts						;$4e75			;ff10d6

Lff10d8:									;ff10d8
	tst.b	($00ed0091)				;$4a39,$00ed,$0091	;ff10d8
	beq.s	Lff1136					;$6756			;ff10de
	move.b	#$01,d1					;$123c,$0001		;ff10e0
	move.b	#$02,d2					;$143c,$0002		;ff10e4
	bsr.s	Lff1138					;$614e			;ff10e8
	move.b	#$08,d1					;$123c,$0008		;ff10ea
	move.b	#$00,d2					;$143c,$0000		;ff10ee
	bsr.s	Lff1138					;$6144			;ff10f2
	lea.l	(Lff1174,pc),a0				;$41fa,$007e		;ff10f4
	moveq.l	#$00,d0					;$7000			;ff10f8
	bsr.s	Lff113e					;$6142			;ff10fa
	lea.l	(Lff1178,pc),a0				;$41fa,$007a		;ff10fc
	moveq.l	#$00,d0					;$7000			;ff1100
	bsr.s	Lff1158					;$6154			;ff1102
	lea.l	(Lff117e,pc),a0				;$41fa,$0078		;ff1104
	moveq.l	#$08,d0					;$7008			;ff1108
	bsr.s	Lff1158					;$614c			;ff110a
	lea.l	(Lff1184,pc),a0				;$41fa,$0076		;ff110c
	moveq.l	#$10,d0					;$7010			;ff1110
	bsr.s	Lff1158					;$6144			;ff1112
	lea.l	(Lff118a,pc),a0				;$41fa,$0074		;ff1114
	moveq.l	#$18,d0					;$7018			;ff1118
	bsr.s	Lff1158					;$613c			;ff111a
	move.b	#$08,d1					;$123c,$0008		;ff111c
	move.b	#$68,d2					;$143c,$0068		;ff1120
	bsr.s	Lff1138					;$6112			;ff1124
	moveq.l	#$32,d0					;$7032			;ff1126
	bsr.w	Lff0d12					;$6100,$fbe8		;ff1128
	move.b	#$08,d1					;$123c,$0008		;ff112c
	move.b	#$00,d2					;$143c,$0000		;ff1130
	bsr.s	Lff1138					;$6102			;ff1134
Lff1136:									;ff1136
	rts						;$4e75			;ff1136

Lff1138:									;ff1138
	IOCS	_OPMSET					;$7068,$4e4f		;ff1138
	rts						;$4e75			;ff113c

Lff113e:									;ff113e
	movem.l	d1-d3,-(a7)				;$48e7,$7000		;ff113e
	moveq.l	#$20,d1					;$7220			;ff1142
	add.w	d0,d1					;$d240			;ff1144
	moveq.l	#$03,d3					;$7603			;ff1146
Lff1148:									;ff1148
	move.b	(a0)+,d2				;$1418			;ff1148
	bsr.s	Lff1138					;$61ec			;ff114a
	addq.w	#8,d1					;$5041			;ff114c
	dbra.w	d3,Lff1148				;$51cb,$fff8		;ff114e
	movem.l	(a7)+,d1-d3				;$4cdf,$000e		;ff1152
	rts						;$4e75			;ff1156

Lff1158:									;ff1158
	movem.l	d1-d3,-(a7)				;$48e7,$7000		;ff1158
	moveq.l	#$40,d1					;$7240			;ff115c
	add.w	d0,d1					;$d240			;ff115e
	moveq.l	#$05,d3					;$7605			;ff1160
Lff1162:									;ff1162
	move.b	(a0)+,d2				;$1418			;ff1162
	bsr.s	Lff1138					;$61d2			;ff1164
	add.w	#$0020,d1				;$d27c,$0020		;ff1166
	dbra.w	d3,Lff1162				;$51cb,$fff6		;ff116a
	movem.l	(a7)+,d1-d3				;$4cdf,$000e		;ff116e
	rts						;$4e75			;ff1172

Lff1174:									;ff1174
	.dc.b	$cb,$4c,$18,$00							;ff1174
Lff1178:									;ff1178
	.dc.b	$00,$1d,$06,$8b,$c4,$04						;ff1178
Lff117e:									;ff117e
	.dc.b	$03,$1c,$43,$82,$47,$32						;ff117e
Lff1184:									;ff1184
	.dc.b	$01,$28,$9f,$86,$c0,$22						;ff1184
Lff118a:									;ff118a
	.dc.b	$01,$02,$5f,$95,$06,$24						;ff118a
Lff1190:									;ff1190
	.dc.b	'                     '	;ff1190
	.dc.b	'         ',$0d,$0a,$00				;ff11cb
Lff11e3:									;ff11e3
	.dc.b	'BIOS ROM version ',$00						;ff11e3
Lff11f5:									;ff11f5
	.dc.b	'Micro Processor Unit  (MPU) : MC680',$00			;ff11f5
Lff1219:									;ff1219
	.dc.b	'0 (',$00							;ff1219
Lff121d:									;ff121d
	.dc.b	$3f,$3f								;ff121d
Lff121f:									;ff121f
	.dc.b	'MHz)',$0d,$0a,$00						;ff121f
Lff1226:									;ff1226
	.dc.b	'Floating Point Unit   (FPU) : MC68881/68882',$0d,$0a,$00	;ff1226
Lff1254:									;ff1254
	.dc.b	'Memory Managiment Unit(MMU) : On-Chip MMU',$0d,$0a,$00		;ff1254
Lff1280:									;ff1280
	.dc.b	'Memory Size                 : ',$00				;ff1280
Lff129f:									;ff129f
	.dc.b	'Mbytes',$0d,$0a,$00						;ff129f
Lff12a8:									;ff12a8
	.dc.b	$00,$70,$00,$10,$03,$ff,$f9,$ff					;ff12a8
	.dc.b	$e0,$00,$00,$00,$00,$00,$00,$00					;ff12b0
	.dc.b	$00,$00,$01,$80,$0c,$c0,$c0,$ff					;ff12b8
	.dc.b	$83,$fe,$0f,$f8,$3f,$e0,$ff,$80					;ff12c0
	.dc.b	$01,$80,$0c,$c1,$83,$ff,$cf,$ff					;ff12c8
	.dc.b	$3f,$fc,$ff,$f3,$ff,$c0,$00,$c0					;ff12d0
	.dc.b	$06,$63,$07,$01,$dc,$07,$70,$1d					;ff12d8
	.dc.b	$c0,$77,$01,$c0,$00,$c0,$06,$66					;ff12e0
	.dc.b	$06,$01,$d8,$03,$60,$0d,$80,$36					;ff12e8
	.dc.b	$00,$c0,$00,$60,$03,$3c,$06,$00					;ff12f0
	.dc.b	$1c,$06,$60,$0d,$80,$36,$00,$c0					;ff12f8
	.dc.b	$00,$60,$03,$38,$0f,$ff,$1f,$fe					;ff1300
	.dc.b	$c0,$1b,$00,$6c,$01,$80,$00,$30					;ff1308
	.dc.b	$01,$90,$0f,$ff,$9f,$fc,$c0,$1b					;ff1310
	.dc.b	$00,$6c,$01,$80,$01,$30,$01,$80					;ff1318
	.dc.b	$0c,$03,$b8,$1e,$c0,$1b,$00,$6c					;ff1320
	.dc.b	$01,$80,$03,$98,$00,$c0,$18,$01					;ff1328
	.dc.b	$b0,$0e,$c0,$1b,$00,$68,$01,$80					;ff1330
	.dc.b	$07,$98,$00,$c0,$18,$03,$60,$0d					;ff1338
	.dc.b	$80,$36,$00,$d8,$03,$00,$0c,$cc					;ff1340
	.dc.b	$00,$60,$18,$03,$60,$0d,$80,$36					;ff1348
	.dc.b	$00,$d8,$03,$00,$18,$cc,$00,$60					;ff1350
	.dc.b	$1c,$07,$70,$1d,$c0,$77,$01,$dc					;ff1358
	.dc.b	$07,$00,$30,$66,$00,$30,$1f,$fe					;ff1360
	.dc.b	$7f,$f9,$ff,$e7,$ff,$9f,$fe,$00					;ff1368
	.dc.b	$60,$66,$00,$30,$0f,$f8,$3f,$e0					;ff1370
	.dc.b	$ff,$c3,$fe,$0f,$f8,$00,$ff,$f3					;ff1378
	.dc.b	$ff,$f8,$00,$00,$00,$00,$00,$00					;ff1380
	.dc.b	$00,$00,$00,$00							;ff1388
Lff138c:									;ff138c
	.dc.b	$00,$60,$00,$10,$00,$00,$00,$00					;ff138c
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00					;ff1394
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00					;ff139c
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00					;ff13a4
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00					;ff13ac
	.dc.b	$1f,$fe,$1f,$01,$f0,$0f,$f0,$0f					;ff13b4
	.dc.b	$ff,$c3,$ff,$f0,$7f,$ff,$df,$01					;ff13bc
	.dc.b	$f0,$0f,$f0,$0f,$ff,$f3,$ff,$fc					;ff13c4
	.dc.b	$f8,$1f,$df,$01,$f0,$1f,$f8,$0f					;ff13cc
	.dc.b	$80,$fb,$e0,$3e,$fe,$01,$9f,$01					;ff13d4
	.dc.b	$f0,$3d,$fc,$0f,$80,$7b,$e0,$1e					;ff13dc
	.dc.b	$7f,$c0,$1f,$01,$f0,$38,$fc,$0f					;ff13e4
	.dc.b	$80,$7b,$e0,$1e,$3f,$f8,$1f,$ff					;ff13ec
	.dc.b	$f0,$78,$fe,$0f,$80,$fb,$e0,$3e					;ff13f4
	.dc.b	$07,$ff,$1f,$ff,$f0,$f0,$7f,$0f					;ff13fc
	.dc.b	$bf,$e3,$ff,$fc,$00,$ff,$9f,$01					;ff1404
	.dc.b	$f0,$ff,$ff,$0f,$bf,$83,$ff,$f0					;ff140c
	.dc.b	$60,$1f,$df,$01,$f1,$ff,$ff,$8f					;ff1414
	.dc.b	$9f,$c3,$e0,$00,$fe,$07,$df,$01					;ff141c
	.dc.b	$f3,$c0,$1f,$cf,$8f,$e3,$e0,$00					;ff1424
	.dc.b	$ff,$ff,$9f,$01,$f3,$c0,$1f,$cf					;ff142c
	.dc.b	$87,$f3,$e0,$00,$1f,$fe,$1f,$01					;ff1434
	.dc.b	$f7,$80,$0f,$ef,$83,$fb,$e0,$00					;ff143c
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00					;ff1444
	.dc.b	$00,$00,$00,$00							;ff144c
Lff1450:									;ff1450
	lea.l	(Lff2564,pc),a0				;$41fa,$1112		;ff1450
	move.l	a0,($00bc)				;$21c8,$00bc		;ff1454
	lea.l	(Lff07be,pc),a0				;$41fa,$f364		;ff1458
	move.l	a0,($00b8)				;$21c8,$00b8		;ff145c
	lea.l	(Lff1b48,pc),a0				;$41fa,$06e6		;ff1460
	move.l	a0,($00b4)				;$21c8,$00b4		;ff1464
	lea.l	(Lff8010,pc),a0				;$41fa,$6ba6		;ff1468
	move.l	a0,($00b0)				;$21c8,$00b0		;ff146c
	lea.l	(Lff1b20,pc),a0				;$41fa,$06ae		;ff1470
	move.l	a0,($00ac)				;$21c8,$00ac		;ff1474
	lea.l	(Lff19d0,pc),a0				;$41fa,$0556		;ff1478
	move.l	a0,($00a8)				;$21c8,$00a8		;ff147c
	lea.l	($0800),a0				;$41f8,$0800		;ff1480
	move.w	#$01ff,d0				;$303c,$01ff		;ff1484
Lff1488:									;ff1488
	clr.l	(a0)+					;$4298			;ff1488
	dbra.w	d0,Lff1488				;$51c8,$fffc		;ff148a
	lea.l	($081c),a0				;$41f8,$081c		;ff148e
	move.l	a0,($0814)				;$21c8,$0814		;ff1492
	move.l	a0,($0818)				;$21c8,$0818		;ff1496
	lea.l	($093c),a0				;$41f8,$093c		;ff149a
	move.b	($00ed001d),d0				;$1039,$00ed,$001d	;ff149e
	move.b	d0,(a0)+				;$10c0			;ff14a4
	move.b	#$01,(a0)+				;$10fc,$0001		;ff14a6
	move.l	#$00000080,(a0)+			;$20fc,$0000,$0080	;ff14aa
	move.w	#$0001,(a0)+				;$30fc,$0001		;ff14b0
	move.l	#$00e00000,(a0)+			;$20fc,$00e0,$0000	;ff14b4
	clr.l	(a0)+					;$4298			;ff14ba
	move.l	#$00e60000,(a0)+			;$20fc,$00e6,$0000	;ff14bc
	clr.l	(a0)+					;$4298			;ff14c2
	clr.l	(a0)+					;$4298			;ff14c4
	move.w	#$0400,(a0)+				;$30fc,$0400		;ff14c6
	move.w	#$0400,(a0)+				;$30fc,$0400		;ff14ca
	lea.l	($095c),a0				;$41f8,$095c		;ff14ce
	move.l	#$00c00000,(a0)+			;$20fc,$00c0,$0000	;ff14d2
	move.l	#$00000800,(a0)+			;$20fc,$0000,$0800	;ff14d8
	move.w	#$000f,(a0)+				;$30fc,$000f		;ff14de
	move.w	#$000f,(a0)+				;$30fc,$000f		;ff14e2
	lea.l	($0970),a0				;$41f8,$0970		;ff14e6
	move.w	#$005f,(a0)+				;$30fc,$005f		;ff14ea
	move.w	#$001f,(a0)+				;$30fc,$001f		;ff14ee
	move.l	#Lff15be,($097e)			;$21fc,$00ff,$15be,$097e	;ff14f2
	move.b	#$03,($0994)				;$11fc,$0003,$0994	;ff14fa
	move.b	#$03,($0995)				;$11fc,$0003,$0995	;ff1500
	move.b	#$ff,($0993)				;$11fc,$00ff,$0993	;ff1506
	lea.l	($09aa),a0				;$41f8,$09aa		;ff150c
	move.l	#$00f40000,(a0)+			;$20fc,$00f4,$0000	;ff1510
	move.l	#$00f3d000,(a0)+			;$20fc,$00f3,$d000	;ff1516
	lea.l	($08a6),a0				;$41f8,$08a6		;ff151c
	move.l	a0,($089e)				;$21c8,$089e		;ff1520
	move.l	a0,($08a2)				;$21c8,$08a2		;ff1524
	move.l	#$00000930,($092c)			;$21fc,$0000,$0930,$092c	;ff1528
	move.l	#Lffaa08,($0938)			;$21fc,$00ff,$aa08,$0938	;ff1530
	move.l	#Lff49c8,($0934)			;$21fc,$00ff,$49c8,$0934	;ff1538
	lea.l	(Lff15c0,pc),a0				;$41fa,$007e		;ff1540
	move.l	#$00000014.l,d1				;$223c,$0000,$0014	;ff1544
	lea.l	($0bb0),a1				;$43f8,$0bb0		;ff154a
Lff154e:									;ff154e
	move.b	(a0)+,(a1)+				;$12d8			;ff154e
	dbra.w	d1,Lff154e				;$51c9,$fffc		;ff1550
	lea.l	($09b2),a0				;$41f8,$09b2		;ff1554
	moveq.l	#$01,d0					;$7001			;ff1558
	move.w	d0,(a0)+				;$30c0			;ff155a
	move.w	d0,(a0)+				;$30c0			;ff155c
	lea.l	(Lff1ed8,pc),a1				;$43fa,$0978		;ff155e
	move.l	a1,(a0)+				;$20c9			;ff1562
	moveq.l	#$32,d0					;$7032			;ff1564
	move.w	d0,(a0)+				;$30c0			;ff1566
	move.w	d0,(a0)+				;$30c0			;ff1568
	lea.l	(Lff1d8c,pc),a1				;$43fa,$0820		;ff156a
	move.l	a1,(a0)+				;$20c9			;ff156e
	move.w	#$00c8,(a0)+				;$30fc,$00c8		;ff1570
	move.w	#$00c8,(a0)+				;$30fc,$00c8		;ff1574
	lea.l	(Lff1f5e,pc),a1				;$43fa,$09e4		;ff1578
	move.l	a1,(a0)+				;$20c9			;ff157c
	move.w	#$1770,(a0)+				;$30fc,$1770		;ff157e
	move.w	#$1770,(a0)+				;$30fc,$1770		;ff1582
	lea.l	(Lff1f78,pc),a1				;$43fa,$09f0		;ff1586
	move.l	a1,(a0)+				;$20c9			;ff158a
	moveq.l	#$ff,d0					;$70ff			;ff158c
	move.l	d0,(a0)+				;$20c0			;ff158e
	clr.l	(a0)+					;$4298			;ff1590
	move.w	d0,($0a0e)				;$31c0,$0a0e		;ff1592
	lea.l	(Lff15d6,pc),a0				;$41fa,$003e		;ff1596
	move.l	#$00000063.l,d1				;$223c,$0000,$0063	;ff159a
	lea.l	($0a16),a1				;$43f8,$0a16		;ff15a0
Lff15a4:									;ff15a4
	move.b	(a0)+,(a1)+				;$12d8			;ff15a4
	dbra.w	d1,Lff15a4				;$51c9,$fffc		;ff15a6
	move.b	#$01,($09dd)				;$11fc,$0001,$09dd	;ff15aa
	IOCS	_MS_INIT				;$7070,$4e4f		;ff15b0
	move.b	($00ed005a),($0cb4)			;$11f9,$00ed,$005a,$0cb4	;ff15b4
	rts						;$4e75			;ff15bc

Lff15be:									;ff15be
	rts						;$4e75			;ff15be

Lff15c0:									;ff15c0
	.dc.b	$01,$86,$00,$02,$01,$86,$00,$02					;ff15c0
	.dc.b	$00,$61,$00,$00,$00,$00,$00,$00					;ff15c8
	.dc.b	$14,$ff,$00,$00,$00,$00						;ff15d0
Lff15d6:									;ff15d6
	.dc.b	$00,$e0,$00,$00,$00,$29,$00,$ff					;ff15d6
	.dc.b	$ff,$00,$00,$14,$00,$ff,$00,$00					;ff15de
	.dc.b	$00,$5f,$06,$1b,$4b,$1c,$53,$06					;ff15e6
	.dc.b	$06,$00,$02,$1b,$48,$00,$00,$00					;ff15ee
	.dc.b	$00,$00,$02,$0d,$0a,$00,$04,$1b					;ff15f6
	.dc.b	$25,$39,$0f,$00,$04,$1b,$25,$39					;ff15fe
	.dc.b	$00,$00,$04,$1b,$25,$39,$0a,$00					;ff1606
	.dc.b	$04,$1b,$25,$39,$05,$00,$04,$1b					;ff160e
	.dc.b	$4a,$06,$00,$00,$00,$00,$04,$1b					;ff1616
	.dc.b	$4a,$03,$00,$00,$00,$00,$04,$1b					;ff161e
	.dc.b	$4a,$00,$12,$00,$00,$00,$04,$1b					;ff1626
	.dc.b	$4a,$00,$24,$00,$00,$00,$00,$03					;ff162e
	.dc.b	$06,$01,$ff,$ff							;ff1636
Lff163a:									;ff163a
	lea.l	($00e8a000),a0				;$41f9,$00e8,$a000	;ff163a
	clr.b	($001d,a0)				;$4228,$001d		;ff1640
	tst.b	($00e9a001)				;$4a39,$00e9,$a001	;ff1644
	tst.b	($00e9a001)				;$4a39,$00e9,$a001	;ff164a
	move.b	#$01,($001b,a0)				;$117c,$0001,$001b	;ff1650
	move.b	($00ed0026),d0				;$1039,$00ed,$0026	;ff1656
	beq.s	Lff167e					;$6720			;ff165c
	cmp.b	#$07,d0					;$b03c,$0007		;ff165e
	beq.s	Lff167e					;$671a			;ff1662
	move.b	#$07,d0					;$103c,$0007		;ff1664
	move.b	#$31,($00e8e00d)			;$13fc,$0031,$00e8,$e00d	;ff1668
	move.b	d0,($00ed0026)				;$13c0,$00ed,$0026	;ff1670
	move.b	#$00,($00e8e00d)			;$13fc,$0000,$00e8,$e00d	;ff1676
Lff167e:									;ff167e
	move.b	d0,($0001,a0)				;$1140,$0001		;ff167e
	tst.b	($00e9a001)				;$4a39,$00e9,$a001	;ff1682
	tst.b	($00e9a001)				;$4a39,$00e9,$a001	;ff1688
	move.b	#$0c,($001b,a0)				;$117c,$000c,$001b	;ff168e
	tst.b	($00e9a001)				;$4a39,$00e9,$a001	;ff1694
	tst.b	($00e9a001)				;$4a39,$00e9,$a001	;ff169a
	move.b	#$0c,($001f,a0)				;$117c,$000c,$001f	;ff16a0
	move.b	#$92,($00e9a007)			;$13fc,$0092,$00e9,$a007	;ff16a6
	move.b	#$0b,($00e9a005)			;$13fc,$000b,$00e9,$a005	;ff16ae
	lea.l	($00e84080),a1				;$43f9,$00e8,$4080	;ff16b6
	lea.l	(Lff1706,pc),a0				;$41fa,$0048		;ff16bc
	bsr.s	Lff16f8					;$6136			;ff16c0
	lea.l	($00e840c0),a1				;$43f9,$00e8,$40c0	;ff16c2
	lea.l	(Lff1716,pc),a0				;$41fa,$004c		;ff16c8
	bsr.s	Lff16f8					;$612a			;ff16cc
	move.l	#$00e92003,($0014,a1)			;$237c,$00e9,$2003,$0014	;ff16ce
	lea.l	(Lff1978,pc),a0				;$41fa,$02a0		;ff16d6
	move.l	a0,($01a0)				;$21c8,$01a0		;ff16da
	lea.l	(Lff1978,pc),a0				;$41fa,$0298		;ff16de
	move.l	a0,($01a4)				;$21c8,$01a4		;ff16e2
	lea.l	(DMA3Interrupt,pc),a0			;$41fa,$0258		;ff16e6
	move.l	a0,($01a8)				;$21c8,$01a8		;ff16ea
	lea.l	(DMA3Interrupt,pc),a0			;$41fa,$0250		;ff16ee
	move.l	a0,($01ac)				;$21c8,$01ac		;ff16f2
	bra.s	Lff1728					;$6030			;ff16f6
Lff16f8:									;ff16f8
	move.b	(a0)+,d0				;$1018			;ff16f8
	bmi.s	Lff1704					;$6b08			;ff16fa
	ext.w	d0					;$4880			;ff16fc
	move.b	(a0)+,(a1,d0.w)				;$1398,$0000		;ff16fe
	bra.s	Lff16f8					;$60f4			;ff1702
Lff1704:									;ff1704
	rts						;$4e75			;ff1704

Lff1706:									;ff1706
	.dc.b	$04,$08,$29,$05,$2d,$03,$31,$05					;ff1706
	.dc.b	$39,$05,$25,$68,$27,$69,$ff,$ff					;ff170e
Lff1716:									;ff1716
	subi.l	#$06042905,d0				;$0480,$0604,$2905	;ff1716
	move.l	d1,-(a6)				;$2d01			;ff171c
	move.w	d5,-(a0)				;$3105			;ff171e
	move.w	d5,-(a4)				;$3905			;ff1720
	move.l	($276b,a2),(-$0001,a2)			;$256a,$276b,$ffff	;ff1722
Lff1728:									;ff1728
	moveq.l	#$00,d1					;$7200			;ff1728
	move.b	($00ed001d),d1				;$1239,$00ed,$001d	;ff172a
	IOCS	_CRTMOD					;$7010,$4e4f		;ff1730
	lea.l	($00e00000),a0				;$41f9,$00e0,$0000	;ff1734
	move.l	#$00020000,d1				;$223c,$0002,$0000	;ff173a
	moveq.l	#$00,d0					;$7000			;ff1740
Lff1742:									;ff1742
	move.l	d0,(a0)+				;$20c0			;ff1742
	subq.l	#1,d1					;$5381			;ff1744
	bne.s	Lff1742					;$66fa			;ff1746
	bsr.w	Lff18ce					;$6100,$0184		;ff1748
	bsr.w	Lff1816					;$6100,$00c8		;ff174c
	moveq.l	#$ff,d1					;$72ff			;ff1750
	IOCS	_INIT_PRN				;$703c,$4e4f		;ff1752
	rts						;$4e75			;ff1756

Lff1758:									;ff1758
	move.w	sr,-(a7)				;$40e7			;ff1758
	ori.w	#$0700,sr				;$007c,$0700		;ff175a
	lea.l	($0180),a1				;$43f8,$0180		;ff175e
	lea.l	(Lff17f8,pc),a0				;$41fa,$0094		;ff1762
	moveq.l	#$03,d1					;$7203			;ff1766
	bsr.s	Lff17e2					;$6178			;ff1768
	move.b	#$60,($00e9c003)			;$13fc,$0060,$00e9,$c003	;ff176a
	lea.l	($00e84000),a1				;$43f9,$00e8,$4000	;ff1772
	lea.l	(Lff1800,pc),a0				;$41fa,$0086		;ff1778
	bsr.w	Lff16f8					;$6100,$ff7a		;ff177c
	move.l	#$00e94003,($0014,a1)			;$237c,$00e9,$4003,$0014	;ff1780
	move.l	(Lff933c,pc),($0054,a1)			;$237a,$7bb2,$0054	;ff1788
	lea.l	($0c8f),a0				;$41f8,$0c8f		;ff178e
	clr.b	(a0)+					;$4218			;ff1792
	moveq.l	#$07,d0					;$7007			;ff1794
Lff1796:									;ff1796
	clr.l	(a0)+					;$4298			;ff1796
	dbra.w	d0,Lff1796				;$51c8,$fffc		;ff1798
	move.w	(a7)+,sr				;$46df			;ff179c
	move.b	#$06,($00e9c001)			;$13fc,$0006,$00e9,$c001	;ff179e
	move.w	#$9070,d1				;$323c,$9070		;ff17a6
	suba.l	a1,a1					;$93c9			;ff17aa
	moveq.l	#$00,d2					;$7400			;ff17ac
	IOCS	_B_DSKINI				;$7043,$4e4f		;ff17ae
	move.w	#$9070,d1				;$323c,$9070		;ff17b2
Lff17b6:									;ff17b6
	moveq.l	#$03,d2					;$7403			;ff17b6
	IOCS	_B_DRVCHK				;$704e,$4e4f		;ff17b8
	moveq.l	#$05,d2					;$7405			;ff17bc
	IOCS	_B_DRVCHK				;$704e,$4e4f		;ff17be
	moveq.l	#$07,d2					;$7407			;ff17c2
	IOCS	_B_DRVCHK				;$704e,$4e4f		;ff17c4
	add.w	#$0100,d1				;$d27c,$0100		;ff17c8
	cmp.w	#$9470,d1				;$b27c,$9470		;ff17cc
	bne.s	Lff17b6					;$66e4			;ff17d0
	andi.w	#$f8ff,sr				;$027c,$f8ff		;ff17d2
	moveq.l	#$f5,d0					;$70f5			;ff17d6
	moveq.l	#$00,d1					;$7200			;ff17d8
	trap	#15					;$4e4f			;ff17da
	clr.w	($09e0)					;$4278,$09e0		;ff17dc
	rts						;$4e75			;ff17e0

Lff17e2:									;ff17e2
	move.l	a0,d2					;$2408			;ff17e2
Lff17e4:									;ff17e4
	move.w	(a0)+,d0				;$3018			;ff17e4
	beq.s	Lff17f4					;$670c			;ff17e6
	ext.l	d0					;$48c0			;ff17e8
	add.l	d2,d0					;$d082			;ff17ea
	move.l	d0,(a1)+				;$22c0			;ff17ec
Lff17ee:									;ff17ee
	dbra.w	d1,Lff17e4				;$51c9,$fff4		;ff17ee
	rts						;$4e75			;ff17f2

Lff17f4:									;ff17f4
	addq.l	#4,a1					;$5889			;ff17f4
	bra.s	Lff17ee					;$60f6			;ff17f6
Lff17f8:									;ff17f8
	.dc.b	$03,$66,$04,$32,$04,$7e,$00,$00					;ff17f8
Lff1800:									;ff1800
	.dc.b	$04,$80,$06,$04,$29,$05,$2d,$00					;ff1800
	.dc.b	$31,$05,$44,$80,$46,$04,$69,$05					;ff1808
	.dc.b	$6d,$02,$71,$05,$ff,$ff						;ff1810
Lff1816:									;ff1816
	lea.l	($0140),a1				;$43f8,$0140		;ff1816
	lea.l	(Lff1872,pc),a0				;$41fa,$0056		;ff181a
	move.l	a0,d2					;$2408			;ff181e
	move.w	#$0007,d1				;$323c,$0007		;ff1820
Lff1824:									;ff1824
	move.w	(a0)+,d0				;$3018			;ff1824
	ext.l	d0					;$48c0			;ff1826
	add.l	d2,d0					;$d082			;ff1828
	move.l	d0,(a1)+				;$22c0			;ff182a
	move.l	d0,(a1)+				;$22c0			;ff182c
	dbra.w	d1,Lff1824				;$51c9,$fff4		;ff182e
	moveq.l	#$00,d2					;$7400			;ff1832
	moveq.l	#$00,d3					;$7600			;ff1834
	lea.l	(Lff1882,pc),a0				;$41fa,$004a		;ff1836
	lea.l	($00e98004),a1				;$43f9,$00e9,$8004	;ff183a
	moveq.l	#$13,d1					;$7213			;ff1840
Lff1842:									;ff1842
	move.b	(a0)+,d2				;$1418			;ff1842
	move.b	(a0)+,d3				;$1618			;ff1844
	move.w	d2,(a1)					;$3282			;ff1846
	move.w	d3,(a1)					;$3283			;ff1848
	dbra.w	d1,Lff1842				;$51c9,$fff6		;ff184a
	lea.l	(Lff18aa,pc),a0				;$41fa,$005a		;ff184e
	lea.l	($00e98000),a1				;$43f9,$00e9,$8000	;ff1852
	moveq.l	#$11,d1					;$7211			;ff1858
Lff185a:									;ff185a
	move.b	(a0)+,d2				;$1418			;ff185a
	move.b	(a0)+,d3				;$1618			;ff185c
	move.w	d2,(a1)					;$3282			;ff185e
	move.w	d3,(a1)					;$3283			;ff1860
	dbra.w	d1,Lff185a				;$51c9,$fff6		;ff1862
	move.w	($00ed001a),d1				;$3239,$00ed,$001a	;ff1866
	IOCS	_SET232C				;$7030,$4e4f		;ff186c
	rts						;$4e75			;ff1870

Lff1872:									;ff1872
	.dc.b	$07,$f8,$07,$f8,$07,$40,$07,$f8					;ff1872
	.dc.b	$07,$dc,$07,$dc,$04,$06,$07,$dc					;ff187a
Lff1882:									;ff1882
	.dc.b	$09,$c0,$09,$80,$04,$45,$01,$00					;ff1882
	.dc.b	$02,$50,$03,$c0,$05,$e2,$09,$01					;ff188a
	.dc.b	$0b,$56,$0c,$0e,$0d,$00,$0e,$02					;ff1892
	.dc.b	$03,$c1,$05,$ea,$00,$80,$0e,$03					;ff189a
	.dc.b	$0f,$00,$00,$10,$00,$10,$01,$10					;ff18a2
Lff18aa:									;ff18aa
	.dc.b	$09,$40,$04,$4c,$01,$00,$03,$c0					;ff18aa
	.dc.b	$05,$60,$0b,$56,$0c,$1f,$0d,$00					;ff18b2
	.dc.b	$0e,$02,$03,$c1,$05,$e8,$00,$80					;ff18ba
	.dc.b	$0e,$03,$0f,$00,$00,$10,$00,$10					;ff18c2
	.dc.b	$01,$10,$09,$09							;ff18ca
Lff18ce:									;ff18ce
	lea.l	($0100),a1				;$43f8,$0100		;ff18ce
	lea.l	(Lff1920,pc),a0				;$41fa,$004c		;ff18d2
	moveq.l	#$0f,d1					;$720f			;ff18d6
	bsr.w	Lff17e2					;$6100,$ff08		;ff18d8
	lea.l	($00e88000),a0				;$41f9,$00e8,$8000	;ff18dc
	lea.l	(Lff1900,pc),a1				;$43fa,$001c		;ff18e2
	moveq.l	#$0f,d0					;$700f			;ff18e6
Lff18e8:									;ff18e8
	move.b	(a1)+,d1				;$1219			;ff18e8
	ext.w	d1					;$4881			;ff18ea
	move.b	(a1)+,(a0,d1.w)				;$1199,$1000		;ff18ec
	dbra.w	d0,Lff18e8				;$51c8,$fff6		;ff18f0
	move.b	($00ed001c),d1				;$1239,$00ed,$001c	;ff18f4
	IOCS	_S_CMDOUT				;$7003,$4e4f		;ff18fa
	rts						;$4e75			;ff18fe

Lff1900:									;ff1900
	.dc.b	$05,$00,$03,$06,$1d,$70,$23,$c8					;ff1900
	.dc.b	$07,$18,$09,$26,$13,$18,$15,$26					;ff1908
	.dc.b	$17,$40,$19,$08,$1b,$01,$21,$0d					;ff1910
	.dc.b	$29,$88,$2b,$01,$2f,$ff,$2d,$01					;ff1918
Lff1920:									;ff1920
	.dc.b	$07,$66,$00,$72,$00,$72,$00,$00					;ff1920
	.dc.b	$00,$00,$04,$26,$07,$66,$07,$66					;ff1928
	.dc.b	$07,$66,$07,$66,$07,$66,$07,$68					;ff1930
	.dc.b	$07,$70,$00,$00,$00,$00,$00,$00					;ff1938
DMA3Interrupt:									;ff1940
	move.l	a0,-(a7)				;$2f08			;ff1940
	lea.l	($00e840c0),a0				;$41f9,$00e8,$40c0	;ff1942
	move.b	($0001,a0),($0c33)			;$11e8,$0001,$0c33	;ff1948
	tst.b	($0c32)					;$4a38,$0c32		;ff194e
	bmi.s	Lff196c					;$6b18			;ff1952
	move.b	#$01,($00e9a007)			;$13fc,$0001,$00e9,$a007	;ff1954
	move.b	#$03,($00e9a007)			;$13fc,$0003,$00e9,$a007	;ff195c
	move.b	#$01,($00e92001)			;$13fc,$0001,$00e9,$2001	;ff1964
Lff196c:									;ff196c
	tst.b	(a0)					;$4a10			;ff196c
	st.b	(a0)					;$50d0			;ff196e
	clr.b	($0c32)					;$4238,$0c32		;ff1970
	movea.l	(a7)+,a0				;$205f			;ff1974
	rte						;$4e73			;ff1976

Lff1978:									;ff1978
	move.l	a0,-(a7)				;$2f08			;ff1978
	lea.l	($00e84080),a0				;$41f9,$00e8,$4080	;ff197a
	move.b	($0001,a0),($0c35)			;$11e8,$0001,$0c35	;ff1980
	tst.b	(a0)					;$4a10			;ff1986
	st.b	(a0)					;$50d0			;ff1988
	clr.b	($0c34)					;$4238,$0c34		;ff198a
	movea.l	(a7)+,a0				;$205f			;ff198e
	rte						;$4e73			;ff1990

Lff1992:									;ff1992
	movem.l	d0-d1,-(a7)				;$48e7,$c000		;ff1992
	move.w	#$00fa,d1				;$323c,$00fa		;ff1996
Lff199a:									;ff199a
	move.l	#$000000c8,d0				;$203c,$0000,$00c8	;ff199a
	bsr.w	Lff0d12					;$6100,$f370		;ff19a0
	move.b	($00e88001),d0				;$1039,$00e8,$8001	;ff19a4
	btst.l	#$02,d0					;$0800,$0002		;ff19aa
	beq.s	Lff19ca					;$671a			;ff19ae
	btst.l	#$01,d0					;$0800,$0001		;ff19b0
	beq.s	Lff19ca					;$6714			;ff19b4
	dbra.w	d1,Lff199a				;$51c9,$ffe2		;ff19b6
	move.b	#$00,($00e8a01f)			;$13fc,$0000,$00e8,$a01f	;ff19ba
	move.l	#$58363801,d0				;$203c,$5836,$3801	;ff19c2
	trap	#10					;$4e4a			;ff19c8
Lff19ca:									;ff19ca
	movem.l	(a7)+,d0-d1				;$4cdf,$0003		;ff19ca
	rte						;$4e73			;ff19ce

Lff19d0:									;ff19d0
	cmp.l	#$58363801,d0				;$b0bc,$5836,$3801	;ff19d0
	beq.s	Lff1a0c					;$6734			;ff19d6
	cmp.l	#$58363802,d0				;$b0bc,$5836,$3802	;ff19d8
	beq.s	Lff1a0c					;$672c			;ff19de
	cmp.l	#$58363803,d0				;$b0bc,$5836,$3803	;ff19e0
	beq.s	Lff19f0					;$6708			;ff19e6
	bsr.w	Lff1afe					;$6100,$0114		;ff19e8
	bra.w	Lff1aec					;$6000,$00fe		;ff19ec
Lff19f0:									;ff19f0
	cmpi.b	#$02,($09df)				;$0c38,$0002,$09df	;ff19f0
	bne.s	Lff1a0c					;$6614			;ff19f6
	move.l	($00ed001e),d0				;$2039,$00ed,$001e	;ff19f8
	beq.s	Lff1a0c					;$670c			;ff19fe
	cmp.l	#$00000040,d0				;$b0bc,$0000,$0040	;ff1a00
	bcc.s	Lff1a0c					;$6404			;ff1a06
	moveq.l	#$0d,d1					;$720d			;ff1a08
	bra.s	Lff1a12					;$6006			;ff1a0a
Lff1a0c:									;ff1a0c
	move.b	($00ed002a),d1				;$1239,$00ed,$002a	;ff1a0c
Lff1a12:									;ff1a12
	IOCS	_TVCTRL					;$700c,$4e4f		;ff1a12
Lff1a16:									;ff1a16
	bsr.w	Lff1b4a					;$6100,$0132		;ff1a16
	tst.b	($00ed0029)				;$4a39,$00ed,$0029	;ff1a1a
	beq.s	Lff1a46					;$6724			;ff1a20
	moveq.l	#$03,d1					;$7203			;ff1a22
Lff1a24:									;ff1a24
	moveq.l	#$20,d0					;$7020			;ff1a24
	bset.l	d1,d0					;$03c0			;ff1a26
	move.b	d0,($00e94005)				;$13c0,$00e9,$4005	;ff1a28
	and.w	#$0020,d0				;$c07c,$0020		;ff1a2e
	move.b	d0,($00e94005)				;$13c0,$00e9,$4005	;ff1a32
	dbra.w	d1,Lff1a24				;$51c9,$ffea		;ff1a38
	move.l	#$0000bb80,d0				;$203c,$0000,$bb80	;ff1a3c
	bsr.w	Lff0d12					;$6100,$f2ce		;ff1a42
Lff1a46:									;ff1a46
	bsr.w	Lff1afe					;$6100,$00b6		;ff1a46
	moveq.l	#$3c,d1					;$723c			;ff1a4a
Lff1a4c:									;ff1a4c
	move.l	#$000000c8,d0				;$203c,$0000,$00c8	;ff1a4c
	bsr.w	Lff0d12					;$6100,$f2be		;ff1a52
	move.b	($00e88001),d0				;$1039,$00e8,$8001	;ff1a56
	btst.l	#$02,d0					;$0800,$0002		;ff1a5c
	beq.w	Lff1aec					;$6700,$008a		;ff1a60
	btst.l	#$01,d0					;$0800,$0001		;ff1a64
	beq.w	Lff1aec					;$6700,$0082		;ff1a68
	dbra.w	d1,Lff1a4c				;$51c9,$ffde		;ff1a6c
	ori.w	#$0700,sr				;$007c,$0700		;ff1a70
	moveq.l	#$00,d1					;$7200			;ff1a74
	bsr.w	Call_LEDCTRL				;$6100,$4e92		;ff1a76
	lea.l	($00e8a000),a0				;$41f9,$00e8,$a000	;ff1a7a
	move.b	($00ed0026),d0				;$1039,$00ed,$0026	;ff1a80
	bsr.w	Lff2dfa					;$6100,$1372		;ff1a86
	move.b	#$31,($00e8e00d)			;$13fc,$0031,$00e8,$e00d	;ff1a8a
	addq.l	#1,($00ed0044)				;$52b9,$00ed,$0044	;ff1a92
	clr.b	($00e8e00d)				;$4239,$00e8,$e00d	;ff1a98
	move.b	#$0c,($001f,a0)				;$117c,$000c,$001f	;ff1a9e
	tst.b	($00e9a001)				;$4a39,$00e9,$a001	;ff1aa4
	tst.b	($00e9a001)				;$4a39,$00e9,$a001	;ff1aaa
	move.b	($001b,a0),d0				;$1028,$001b		;ff1ab0
	bclr.l	#$02,d0					;$0880,$0002		;ff1ab4
	nop						;$4e71			;ff1ab8
	nop						;$4e71			;ff1aba
	tst.b	($00ed0026)				;$4a39,$00ed,$0026	;ff1abc
	bne.s	Lff1ac8					;$6604			;ff1ac2
	bset.l	#$02,d0					;$08c0,$0002		;ff1ac4
Lff1ac8:									;ff1ac8
	move.b	d0,($001b,a0)				;$1140,$001b		;ff1ac8
	nop						;$4e71			;ff1acc
	nop						;$4e71			;ff1ace
	lea.l	($00e8e00f),a0				;$41f9,$00e8,$e00f	;ff1ad0
	move.b	#$00,(a0)				;$10bc,$0000		;ff1ad6
	move.b	#$0f,(a0)				;$10bc,$000f		;ff1ada
	move.b	#$0f,(a0)				;$10bc,$000f		;ff1ade
	move.l	#$0000c350,d0				;$203c,$0000,$c350	;ff1ae2
	bsr.w	Lff0d12					;$6100,$f228		;ff1ae8
Lff1aec:									;ff1aec
	movem.l	(Lff1af6,pc),d0-d1			;$4cfa,$0003,$0006	;ff1aec
	bra.w	Start					;$6000,$e544		;ff1af2
Lff1af6:									;ff1af6
	.dc.b	$48,$6f,$74,$53							;ff1af6
Lff1afa:									;ff1afa
	.dc.b	$74,$61,$72,$74							;ff1afa
Lff1afe:									;ff1afe
	move.b	#$31,($00e8e00d)			;$13fc,$0031,$00e8,$e00d	;ff1afe
	move.b	($0810),($00ed001c)			;$13f8,$0810,$00ed,$001c	;ff1b06
	move.l	($09d6),d0				;$2038,$09d6		;ff1b0e
	add.l	d0,($00ed0040)				;$d1b9,$00ed,$0040	;ff1b12
	clr.b	($00e8e00d)				;$4239,$00e8,$e00d	;ff1b18
	rts						;$4e75			;ff1b1e

Lff1b20:									;ff1b20
	movem.l	d0-d7/a0-a6,-(a7)			;$48e7,$fffe		;ff1b20
	btst.l	#$00,d0					;$0800,$0000		;ff1b24
	bne.s	Lff1b42					;$6618			;ff1b28
	move.w	($0a0e),d0				;$3038,$0a0e		;ff1b2a
	cmp.w	#$0040,d0				;$b07c,$0040		;ff1b2e
	bcs.s	Lff1b40					;$650c			;ff1b32
	cmp.w	#$0050,d0				;$b07c,$0050		;ff1b34
	bcs.s	Lff1b42					;$6508			;ff1b38
	cmp.w	#$00f5,d0				;$b07c,$00f5		;ff1b3a
	beq.s	Lff1b42					;$6702			;ff1b3e
Lff1b40:									;ff1b40
	bsr.s	Lff1b4a					;$6108			;ff1b40
Lff1b42:									;ff1b42
	movem.l	(a7)+,d0-d7/a0-a6			;$4cdf,$7fff		;ff1b42
	rte						;$4e73			;ff1b46

Lff1b48:									;ff1b48
	rte						;$4e73			;ff1b48

Lff1b4a:									;ff1b4a
	move.w	#$8000,d1				;$323c,$8000		;ff1b4a
Lff1b4e:									;ff1b4e
	bsr.w	Call_B_EJECT				;$6100,$71f8		;ff1b4e
	add.w	#$0100,d1				;$d27c,$0100		;ff1b52
	cmp.w	#$9000,d1				;$b27c,$9000		;ff1b56
	bcs.s	Lff1b4e					;$65f2			;ff1b5a
	rts						;$4e75			;ff1b5c

Lff1b5e:									;ff1b5e
	bsr.s	Lff1b62					;$6102			;ff1b5e
	rte						;$4e73			;ff1b60

Lff1b62:									;ff1b62
	movem.l	d0-d3/a0-a3,-(a7)			;$48e7,$f0f0		;ff1b62
	lea.l	($00e94001),a0				;$41f9,$00e9,$4001	;ff1b66
	lea.l	($0002,a0),a1				;$43e8,$0002		;ff1b6c
	lea.l	($00e9a001),a3				;$47f9,$00e9,$a001	;ff1b70
Lff1b76:									;ff1b76
	tst.b	(a3)					;$4a13			;ff1b76
	move.b	(a0),d0					;$1010			;ff1b78
	bpl.s	Lff1b76					;$6afa			;ff1b7a
	btst.l	#$06,d0					;$0800,$0006		;ff1b7c
	bne.s	Lff1b8c					;$660a			;ff1b80
	btst.l	#$04,d0					;$0800,$0004		;ff1b82
	bne.s	Lff1b8c					;$6604			;ff1b86
	bsr.s	Lff1bce					;$6144			;ff1b88
	bne.s	Lff1b96					;$660a			;ff1b8a
Lff1b8c:									;ff1b8c
	bsr.s	Lff1bee					;$6160			;ff1b8c
	bne.s	Lff1bc8					;$6638			;ff1b8e
	cmp.b	#$80,d0					;$b03c,$0080		;ff1b90
	beq.s	Lff1bc8					;$6732			;ff1b94
Lff1b96:									;ff1b96
	moveq.l	#$00,d1					;$7200			;ff1b96
	move.b	d0,d1					;$1200			;ff1b98
	and.b	#$03,d1					;$c23c,$0003		;ff1b9a
	move.w	d1,d2					;$3401			;ff1b9e
	lsl.w	#3,d1					;$e749			;ff1ba0
	lea.l	($0c90),a2				;$45f8,$0c90		;ff1ba2
	adda.w	d1,a2					;$d4c1			;ff1ba6
	tst.b	d0					;$4a00			;ff1ba8
	bpl.s	Lff1bbc					;$6a10			;ff1baa
	btst.b	d2,($0c8f)				;$0538,$0c8f		;ff1bac
	beq.s	Lff1bba					;$6708			;ff1bb0
	moveq.l	#$07,d2					;$7407			;ff1bb2
Lff1bb4:									;ff1bb4
	bsr.s	Lff1c08					;$6152			;ff1bb4
	bne.s	Lff1bb4					;$66fc			;ff1bb6
	bra.s	Lff1b76					;$60bc			;ff1bb8
Lff1bba:									;ff1bba
	moveq.l	#$07,d2					;$7407			;ff1bba
Lff1bbc:									;ff1bbc
	move.b	d0,(a2)+				;$14c0			;ff1bbc
	bsr.s	Lff1c08					;$6148			;ff1bbe
	bne.s	Lff1bbc					;$66fa			;ff1bc0
	bset.b	d2,($0c8f)				;$05f8,$0c8f		;ff1bc2
	bra.s	Lff1b76					;$60ae			;ff1bc6
Lff1bc8:									;ff1bc8
	movem.l	(a7)+,d0-d3/a0-a3			;$4cdf,$0f0f		;ff1bc8
	rts						;$4e75			;ff1bcc

Lff1bce:									;ff1bce
	moveq.l	#$ff,d3					;$76ff			;ff1bce
Lff1bd0:									;ff1bd0
	tst.b	(a3)					;$4a13			;ff1bd0
	move.b	(a0),d0					;$1010			;ff1bd2
	and.b	#$d0,d0					;$c03c,$00d0		;ff1bd4
	cmp.b	#$80,d0					;$b03c,$0080		;ff1bd8
	dbeq.w	d3,Lff1bd0				;$57cb,$fff2		;ff1bdc
	bne.s	Lff1bea					;$6608			;ff1be0
	move.b	#$08,(a1)				;$12bc,$0008		;ff1be2
	moveq.l	#$00,d0					;$7000			;ff1be6
	rts						;$4e75			;ff1be8

Lff1bea:									;ff1bea
	moveq.l	#$ff,d3					;$76ff			;ff1bea
	rts						;$4e75			;ff1bec

Lff1bee:									;ff1bee
	moveq.l	#$ff,d3					;$76ff			;ff1bee
Lff1bf0:									;ff1bf0
	tst.b	(a3)					;$4a13			;ff1bf0
	move.b	(a0),d0					;$1010			;ff1bf2
	and.b	#$d0,d0					;$c03c,$00d0		;ff1bf4
	cmp.b	#$d0,d0					;$b03c,$00d0		;ff1bf8
	dbeq.w	d3,Lff1bf0				;$57cb,$fff2		;ff1bfc
	bne.s	Lff1bea					;$66e8			;ff1c00
	move.b	(a1),d0					;$1011			;ff1c02
	moveq.l	#$00,d3					;$7600			;ff1c04
	rts						;$4e75			;ff1c06

Lff1c08:									;ff1c08
	moveq.l	#$ff,d3					;$76ff			;ff1c08
Lff1c0a:									;ff1c0a
	tst.b	(a3)					;$4a13			;ff1c0a
	move.b	(a0),d0					;$1010			;ff1c0c
	dbmi.w	d3,Lff1c0a				;$5bcb,$fffa		;ff1c0e
	bpl.s	Lff1c26					;$6a12			;ff1c12
	btst.l	#$06,d0					;$0800,$0006		;ff1c14
	beq.s	Lff1c26					;$670c			;ff1c18
	btst.l	#$04,d0					;$0800,$0004		;ff1c1a
	beq.s	Lff1c26					;$6706			;ff1c1e
	move.b	(a1),d0					;$1011			;ff1c20
	moveq.l	#$ff,d3					;$76ff			;ff1c22
	rts						;$4e75			;ff1c24

Lff1c26:									;ff1c26
	moveq.l	#$00,d3					;$7600			;ff1c26
	rts						;$4e75			;ff1c28

Lff1c2a:									;ff1c2a
	movem.l	d0/a4,-(a7)				;$48e7,$8008		;ff1c2a
	bsr.s	Lff1c36					;$6106			;ff1c2e
	movem.l	(a7)+,d0/a4				;$4cdf,$1001		;ff1c30
	rte						;$4e73			;ff1c34

Lff1c36:									;ff1c36
	movem.l	d1-d2/a1-a2,-(a7)			;$48e7,$6060		;ff1c36
	lea.l	($09e6),a4				;$49f8,$09e6		;ff1c3a
	lea.l	($09e2),a1				;$43f8,$09e2		;ff1c3e
	lea.l	($00e94005),a2				;$45f9,$00e9,$4005	;ff1c42
	moveq.l	#$00,d1					;$7200			;ff1c48
Lff1c4a:									;ff1c4a
	move.b	(a1)+,d0				;$1019			;ff1c4a
	and.b	#$c0,d0					;$c03c,$00c0		;ff1c4c
	move.w	d0,d2					;$3400			;ff1c50
	bset.l	d1,d0					;$03c0			;ff1c52
	move.b	d0,(a2)					;$1480			;ff1c54
	move.b	(a2),d0					;$1012			;ff1c56
	move.b	d2,(a2)					;$1482			;ff1c58
	cmp.b	(a4),d0					;$b014			;ff1c5a
	beq.s	Lff1c66					;$6708			;ff1c5c
	move.b	d0,(a4)					;$1880			;ff1c5e
	move.b	#-$01,($0001,a4)			;$197c,$ffff,$0001	;ff1c60
Lff1c66:									;ff1c66
	addq.l	#2,a4					;$548c			;ff1c66
	addq.w	#1,d1					;$5241			;ff1c68
	cmp.w	#$0004,d1				;$b27c,$0004		;ff1c6a
	bcs.s	Lff1c4a					;$65da			;ff1c6e
	movem.l	(a7)+,d1-d2/a1-a2			;$4cdf,$0606		;ff1c70
	rts						;$4e75			;ff1c74

Lff1c76:									;ff1c76
	rte						;$4e73			;ff1c76

Lff1c78:									;ff1c78
	ori.w	#$0700,sr				;$007c,$0700		;ff1c78
	movem.l	d0-d1/a0,-(a7)				;$48e7,$c080		;ff1c7c
	moveq.l	#$00,d1					;$7200			;ff1c80
	move.w	($00e98006),d0				;$3039,$00e9,$8006	;ff1c82
	and.b	($0cb5),d0				;$c038,$0cb5		;ff1c88
	btst.b	#$00,($0926)				;$0838,$0000,$0926	;ff1c8c
	beq.s	Lff1cba					;$6726			;ff1c92
	cmp.b	#$0f,d0					;$b03c,$000f		;ff1c94
	beq.w	Lff1d26					;$6700,$008c		;ff1c98
	cmp.b	#$0e,d0					;$b03c,$000e		;ff1c9c
	beq.w	Lff1d2e					;$6700,$008c		;ff1ca0
	and.b	#$7f,d0					;$c03c,$007f		;ff1ca4
	cmp.b	#$20,d0					;$b03c,$0020		;ff1ca8
	bcs.s	Lff1cba					;$650c			;ff1cac
	btst.b	#$00,($0928)				;$0838,$0000,$0928	;ff1cae
	beq.s	Lff1cba					;$6704			;ff1cb4
	or.b	#$80,d0					;$803c,$0080		;ff1cb6
Lff1cba:									;ff1cba
	btst.b	#$01,($0926)				;$0838,$0001,$0926	;ff1cba
	beq.s	Lff1cce					;$670c			;ff1cc0
	cmp.b	#$13,d0					;$b03c,$0013		;ff1cc2
	beq.s	Lff1d36					;$676e			;ff1cc6
	cmp.b	#$11,d0					;$b03c,$0011		;ff1cc8
	beq.s	Lff1d3e					;$6770			;ff1ccc
Lff1cce:									;ff1cce
	movea.l	($089e),a0				;$2078,$089e		;ff1cce
	cmpi.w	#$003f,($089c)				;$0c78,$003f,$089c	;ff1cd2
	bcc.s	Lff1cf0					;$6416			;ff1cd8
	addq.l	#2,a0					;$5488			;ff1cda
	cmpa.l	#$00000926,a0				;$b1fc,$0000,$0926	;ff1cdc
	bne.s	Lff1ce8					;$6604			;ff1ce2
	lea.l	($08a6),a0				;$41f8,$08a6		;ff1ce4
Lff1ce8:									;ff1ce8
	addq.w	#1,($089c)				;$5278,$089c		;ff1ce8
	move.l	a0,($089e)				;$21c8,$089e		;ff1cec
Lff1cf0:									;ff1cf0
	move.b	d1,(a0)+				;$10c1			;ff1cf0
	move.b	d0,(a0)					;$1080			;ff1cf2
	btst.b	#$01,($0926)				;$0838,$0001,$0926	;ff1cf4
	beq.s	Lff1d18					;$671c			;ff1cfa
	btst.b	#$00,($0929)				;$0838,$0000,$0929	;ff1cfc
	bne.s	Lff1d18					;$6614			;ff1d02
	cmpi.w	#$0030,($089c)				;$0c78,$0030,$089c	;ff1d04
	bcs.s	Lff1d18					;$650c			;ff1d0a
	bset.b	#$00,($0929)				;$08f8,$0000,$0929	;ff1d0c
	moveq.l	#$13,d1					;$7213			;ff1d12
	bsr.w	Lff7be4					;$6100,$5ece		;ff1d14
Lff1d18:									;ff1d18
	movem.l	(a7)+,d0-d1/a0				;$4cdf,$0103		;ff1d18
	move.w	#$0038,($00e98004)			;$33fc,$0038,$00e9,$8004	;ff1d1c
	rte						;$4e73			;ff1d24

Lff1d26:									;ff1d26
	bset.b	#$00,($0928)				;$08f8,$0000,$0928	;ff1d26
	bra.s	Lff1d18					;$60ea			;ff1d2c
Lff1d2e:									;ff1d2e
	bclr.b	#$00,($0928)				;$08b8,$0000,$0928	;ff1d2e
	bra.s	Lff1d18					;$60e2			;ff1d34
Lff1d36:									;ff1d36
	bset.b	#$01,($0929)				;$08f8,$0001,$0929	;ff1d36
	bra.s	Lff1d18					;$60da			;ff1d3c
Lff1d3e:									;ff1d3e
	bclr.b	#$01,($0929)				;$08b8,$0001,$0929	;ff1d3e
	bra.s	Lff1d18					;$60d2			;ff1d44
Lff1d46:									;ff1d46
	move.l	a0,-(a7)				;$2f08			;ff1d46
	lea.l	($09b4),a0				;$41f8,$09b4		;ff1d48
	subq.w	#1,(a0)					;$5350			;ff1d4c
	bne.s	Lff1d58					;$6608			;ff1d4e
	move.w	(-$0002,a0),(a0)+			;$30e8,$fffe		;ff1d50
	movea.l	(a0),a0					;$2050			;ff1d54
	jsr	(a0)					;$4e90			;ff1d56
Lff1d58:									;ff1d58
	lea.l	($09bc),a0				;$41f8,$09bc		;ff1d58
	subq.w	#1,(a0)					;$5350			;ff1d5c
	bne.s	Lff1d68					;$6608			;ff1d5e
	move.w	(-$0002,a0),(a0)+			;$30e8,$fffe		;ff1d60
	movea.l	(a0),a0					;$2050			;ff1d64
	jsr	(a0)					;$4e90			;ff1d66
Lff1d68:									;ff1d68
	lea.l	($09c4),a0				;$41f8,$09c4		;ff1d68
	subq.w	#1,(a0)					;$5350			;ff1d6c
	bne.s	Lff1d78					;$6608			;ff1d6e
	move.w	(-$0002,a0),(a0)+			;$30e8,$fffe		;ff1d70
	movea.l	(a0),a0					;$2050			;ff1d74
	jsr	(a0)					;$4e90			;ff1d76
Lff1d78:									;ff1d78
	lea.l	($09cc),a0				;$41f8,$09cc		;ff1d78
	subq.w	#1,(a0)					;$5350			;ff1d7c
	bne.s	Lff1d88					;$6608			;ff1d7e
	move.w	(-$0002,a0),(a0)+			;$30e8,$fffe		;ff1d80
	movea.l	(a0),a0					;$2050			;ff1d84
	jsr	(a0)					;$4e90			;ff1d86
Lff1d88:									;ff1d88
	movea.l	(a7)+,a0				;$205f			;ff1d88
	rte						;$4e73			;ff1d8a

Lff1d8c:									;ff1d8c
	tst.b	($0992)					;$4a38,$0992		;ff1d8c
	beq.s	Lff1dae					;$671c			;ff1d90
	tst.w	($0d0c)					;$4a78,$0d0c		;ff1d92
	beq.s	Lff1d9e					;$6706			;ff1d96
	tst.b	($0991)					;$4a38,$0991		;ff1d98
	bne.s	Lff1dae					;$6610			;ff1d9c
Lff1d9e:									;ff1d9e
	btst.b	#$01,($00e8002a)			;$0839,$0001,$00e8,$002a	;ff1d9e
	bne.s	Lff1dae					;$6606			;ff1da6
	bsr.s	Lff1db0					;$6106			;ff1da8
	not.b	($0991)					;$4638,$0991		;ff1daa
Lff1dae:									;ff1dae
	rts						;$4e75			;ff1dae

Lff1db0:									;ff1db0
	movem.l	d0-d2/a0-a2,-(a7)			;$48e7,$e0e0		;ff1db0
	moveq.l	#$00,d0					;$7000			;ff1db4
	move.w	($0976),d0				;$3038,$0976		;ff1db6
	swap.w	d0					;$4840			;ff1dba
	lsr.l	#5,d0					;$ea88			;ff1dbc
	movea.l	d0,a2					;$2440			;ff1dbe
	move.w	($0974),d0				;$3038,$0974		;ff1dc0
	cmp.w	($0970),d0				;$b078,$0970		;ff1dc4
	bcs.s	Lff1dce					;$6504			;ff1dc8
	move.w	($0970),d0				;$3038,$0970		;ff1dca
Lff1dce:									;ff1dce
	adda.w	d0,a2					;$d4c0			;ff1dce
	adda.l	($0948),a2				;$d5f8,$0948		;ff1dd0
	adda.l	#$00e00000,a2				;$d5fc,$00e0,$0000	;ff1dd4
	move.w	($00e8002a),-(a7)			;$3f39,$00e8,$002a	;ff1dda
	bclr.b	#$00,($00e8002a)			;$08b9,$0000,$00e8,$002a	;ff1de0
	move.w	($0d10),d1				;$3238,$0d10		;ff1de8
	bne.s	Lff1df0					;$6602			;ff1dec
	moveq.l	#$ff,d1					;$72ff			;ff1dee
Lff1df0:									;ff1df0
	bsr.s	Lff1e08					;$6116			;ff1df0
	lsr.w	#8,d1					;$e049			;ff1df2
	adda.l	#$00020000,a2				;$d5fc,$0002,$0000	;ff1df4
	bsr.s	Lff1e08					;$610c			;ff1dfa
	move.w	(a7)+,($00e8002a)			;$33df,$00e8,$002a	;ff1dfc
	movem.l	(a7)+,d0-d2/a0-a2			;$4cdf,$0707		;ff1e02
	rts						;$4e75			;ff1e06

Lff1e08:									;ff1e08
	move.w	($0d0e),d2				;$3438,$0d0e		;ff1e08
	jmp	(Lff1e10,pc,d2.w)			;$4efb,$2002		;ff1e0c

Lff1e10:									;ff1e10
	eor.b	d1,(a2)					;$b312			;ff1e10
	nop						;$4e71			;ff1e12
	eor.b	d1,($0080,a2)				;$b32a,$0080		;ff1e14
	eor.b	d1,($0100,a2)				;$b32a,$0100		;ff1e18
	eor.b	d1,($0180,a2)				;$b32a,$0180		;ff1e1c
	eor.b	d1,($0200,a2)				;$b32a,$0200		;ff1e20
	eor.b	d1,($0280,a2)				;$b32a,$0280		;ff1e24
	eor.b	d1,($0300,a2)				;$b32a,$0300		;ff1e28
	eor.b	d1,($0380,a2)				;$b32a,$0380		;ff1e2c
	eor.b	d1,($0400,a2)				;$b32a,$0400		;ff1e30
	eor.b	d1,($0480,a2)				;$b32a,$0480		;ff1e34
	eor.b	d1,($0500,a2)				;$b32a,$0500		;ff1e38
	eor.b	d1,($0580,a2)				;$b32a,$0580		;ff1e3c
	eor.b	d1,($0600,a2)				;$b32a,$0600		;ff1e40
	eor.b	d1,($0680,a2)				;$b32a,$0680		;ff1e44
	eor.b	d1,($0700,a2)				;$b32a,$0700		;ff1e48
	eor.b	d1,($0780,a2)				;$b32a,$0780		;ff1e4c
	rts						;$4e75			;ff1e50

Lff1e52:									;ff1e52
	tst.b	($0933)					;$4a38,$0933		;ff1e52
	bpl.s	Lff1e96					;$6a3e			;ff1e56
	btst.b	#$07,($0bbf)				;$0838,$0007,$0bbf	;ff1e58
	beq.s	Lff1e62					;$6702			;ff1e5e
	rts						;$4e75			;ff1e60

Lff1e62:									;ff1e62
	movem.l	d0-d1/a0,-(a7)				;$48e7,$c080		;ff1e62
	lea.l	($0933),a0				;$41f8,$0933		;ff1e66
	clr.b	(a0)					;$4210			;ff1e6a
	move.w	#$0003,($092a)				;$31fc,$0003,$092a	;ff1e6c
	move.l	#$00000930,($092c)			;$21fc,$0000,$0930,$092c	;ff1e72
	lea.l	($00e98002),a0				;$41f9,$00e9,$8002	;ff1e7a
	tst.w	(a0)					;$4a50			;ff1e80
	tst.w	(a0)					;$4a50			;ff1e82
	tst.w	(a0)					;$4a50			;ff1e84
	tst.w	(a0)					;$4a50			;ff1e86
	move.w	#$0040,d1				;$323c,$0040		;ff1e88
Lff1e8c:									;ff1e8c
	bsr.w	Lff694c					;$6100,$4abe		;ff1e8c
Lff1e90:									;ff1e90
	movem.l	(a7)+,d0-d1/a0				;$4cdf,$0103		;ff1e90
	rts						;$4e75			;ff1e94

Lff1e96:									;ff1e96
	movem.l	d0-d1/a0,-(a7)				;$48e7,$c080		;ff1e96
	lea.l	($0933),a0				;$41f8,$0933		;ff1e9a
	btst.b	#$05,(a0)				;$0810,$0005		;ff1e9e
	bne.s	Lff1eae					;$660a			;ff1ea2
	btst.b	#$00,($00e98001)			;$0839,$0000,$00e9,$8001	;ff1ea4
	beq.s	Lff1eb8					;$670a			;ff1eac
Lff1eae:									;ff1eae
	move.b	#$80,(a0)				;$10bc,$0080		;ff1eae
	move.w	#$0041,d1				;$323c,$0041		;ff1eb2
	bra.s	Lff1e8c					;$60d4			;ff1eb6
Lff1eb8:									;ff1eb8
	move.b	(a0),d0					;$1010			;ff1eb8
	addq.b	#1,d0					;$5200			;ff1eba
	cmp.b	#$04,d0					;$b03c,$0004		;ff1ebc
	bcc.s	Lff1ec6					;$6404			;ff1ec0
	move.b	d0,(a0)					;$1080			;ff1ec2
	bra.s	Lff1e90					;$60ca			;ff1ec4
Lff1ec6:									;ff1ec6
	move.b	#$80,(a0)				;$10bc,$0080		;ff1ec6
	lea.l	(Lff1ed8,pc),a0				;$41fa,$000c		;ff1eca
	move.l	a0,($09b6)				;$21c8,$09b6		;ff1ece
	move.w	#$0041,d1				;$323c,$0041		;ff1ed2
	bra.s	Lff1e8c					;$60b4			;ff1ed6
Lff1ed8:									;ff1ed8
	tst.b	($0933)					;$4a38,$0933		;ff1ed8
	bpl.s	Lff1f1e					;$6a40			;ff1edc
	btst.b	#$07,($0bbf)				;$0838,$0007,$0bbf	;ff1ede
	beq.s	Lff1ee8					;$6702			;ff1ee4
	rts						;$4e75			;ff1ee6

Lff1ee8:									;ff1ee8
	movem.l	d0-d1/a0,-(a7)				;$48e7,$c080		;ff1ee8
	lea.l	($0933),a0				;$41f8,$0933		;ff1eec
	clr.b	(a0)					;$4210			;ff1ef0
	move.w	#$0003,($092a)				;$31fc,$0003,$092a	;ff1ef2
	move.l	#$00000930,($092c)			;$21fc,$0000,$0930,$092c	;ff1ef8
	lea.l	($00e98002),a0				;$41f9,$00e9,$8002	;ff1f00
	tst.w	(a0)					;$4a50			;ff1f06
	tst.w	(a0)					;$4a50			;ff1f08
	tst.w	(a0)					;$4a50			;ff1f0a
	tst.w	(a0)					;$4a50			;ff1f0c
	subq.l	#2,a0					;$5588			;ff1f0e
	move.w	#$0005,(a0)				;$30bc,$0005		;ff1f10
	move.w	#$0062,(a0)				;$30bc,$0062		;ff1f14
Lff1f18:									;ff1f18
	movem.l	(a7)+,d0-d1/a0				;$4cdf,$0103		;ff1f18
	rts						;$4e75			;ff1f1c

Lff1f1e:									;ff1f1e
	movem.l	d0-d1/a0,-(a7)				;$48e7,$c080		;ff1f1e
	lea.l	($0933),a0				;$41f8,$0933		;ff1f22
	btst.b	#$06,(a0)				;$0810,$0006		;ff1f26
	bne.s	Lff1f3a					;$660e			;ff1f2a
	move.b	(a0),d0					;$1010			;ff1f2c
	addq.b	#1,d0					;$5200			;ff1f2e
	cmp.b	#$04,d0					;$b03c,$0004		;ff1f30
	bcc.s	Lff1f40					;$640a			;ff1f34
	move.b	d0,(a0)					;$1080			;ff1f36
	bra.s	Lff1f18					;$60de			;ff1f38
Lff1f3a:									;ff1f3a
	move.b	#$80,(a0)				;$10bc,$0080		;ff1f3a
	bra.s	Lff1f18					;$60d8			;ff1f3e
Lff1f40:									;ff1f40
	move.b	#$80,(a0)				;$10bc,$0080		;ff1f40
	move.w	#$0005,($00e98000)			;$33fc,$0005,$00e9,$8000	;ff1f44
	move.w	#$0060,($00e98000)			;$33fc,$0060,$00e9,$8000	;ff1f4c
	lea.l	(Lff1e52,pc),a0				;$41fa,$fefc		;ff1f54
	move.l	a0,($09b6)				;$21c8,$09b6		;ff1f58
	bra.s	Lff1f18					;$60ba			;ff1f5c
Lff1f5e:									;ff1f5e
	btst.b	#$06,($09e1)				;$0838,$0006,$09e1	;ff1f5e
	beq.s	Lff1f76					;$6710			;ff1f64
	tst.b	($09e1)					;$4a38,$09e1		;ff1f66
	bmi.s	Lff1f76					;$6b0a			;ff1f6a
	clr.b	($00e94007)				;$4239,$00e9,$4007	;ff1f6c
	clr.b	($09e1)					;$4238,$09e1		;ff1f72
Lff1f76:									;ff1f76
	rts						;$4e75			;ff1f76

Lff1f78:									;ff1f78
	move.l	d0,-(a7)				;$2f00			;ff1f78
	addq.l	#1,($09d6)				;$52b8,$09d6		;ff1f7a
	move.l	($09d2),d0				;$2038,$09d2		;ff1f7e
	cmp.l	($09d6),d0				;$b0b8,$09d6		;ff1f82
	bcs.s	Lff1f8c					;$6504			;ff1f86
	move.l	(a7)+,d0				;$201f			;ff1f88
	rts						;$4e75			;ff1f8a

Lff1f8c:									;ff1f8c
	move.b	($00e88001),d0				;$1039,$00e8,$8001	;ff1f8c
	btst.l	#$02,d0					;$0800,$0002		;ff1f92
	beq.s	Lff1fa6					;$670e			;ff1f96
	btst.l	#$01,d0					;$0800,$0001		;ff1f98
	beq.s	Lff1fa6					;$6708			;ff1f9c
	move.l	#$58363803,d0				;$203c,$5836,$3803	;ff1f9e
	trap	#10					;$4e4a			;ff1fa4
Lff1fa6:									;ff1fa6
	move.l	#$ffffffff,($09d2)			;$21fc,$ffff,$ffff,$09d2	;ff1fa6
	move.l	(a7)+,d0				;$201f			;ff1fae
	rts						;$4e75			;ff1fb0

Lff1fb2:									;ff1fb2
	ori.w	#$0700,sr				;$007c,$0700		;ff1fb2
	bset.b	#$05,($0933)				;$08f8,$0005,$0933	;ff1fb6
	movem.l	d0-d1/a0-a1,-(a7)			;$48e7,$c0c0		;ff1fbc
	move.w	($00e98002),d0				;$3039,$00e9,$8002	;ff1fc0
	movea.l	($092c),a0				;$2078,$092c		;ff1fc6
	move.b	d0,(a0)+				;$10c0			;ff1fca
	move.l	a0,($092c)				;$21c8,$092c		;ff1fcc
	subq.w	#1,($092a)				;$5378,$092a		;ff1fd0
	bne.s	Lff2040					;$666a			;ff1fd4
	lea.l	($0930),a1				;$43f8,$0930		;ff1fd6
	move.l	a1,($092c)				;$21c9,$092c		;ff1fda
	move.w	#$0003,($092a)				;$31fc,$0003,$092a	;ff1fde
	btst.b	#$07,($0bbf)				;$0838,$0007,$0bbf	;ff1fe4
	bne.s	Lff2040					;$6654			;ff1fea
	bset.b	#$07,($0bbf)				;$08f8,$0007,$0bbf	;ff1fec
	bset.b	#$06,($0933)				;$08f8,$0006,$0933	;ff1ff2
	move.w	#$0005,($00e98000)			;$33fc,$0005,$00e9,$8000	;ff1ff8
	move.w	#$0060,($00e98000)			;$33fc,$0060,$00e9,$8000	;ff2000
	lea.l	($0cb1),a0				;$41f8,$0cb1		;ff2008
	move.b	(a1)+,(a0)+				;$10d9			;ff200c
	move.b	(a1)+,(a0)+				;$10d9			;ff200e
	move.b	(a1)+,(a0)+				;$10d9			;ff2010
	lea.l	($0cb1),a1				;$43f8,$0cb1		;ff2012
	move.w	#$0038,($00e98000)			;$33fc,$0038,$00e9,$8000	;ff2016
	move.w	($0010,a7),d0				;$302f,$0010		;ff201e
	or.w	#$2000,d0				;$807c,$2000		;ff2022
	move.w	d0,sr					;$46c0			;ff2026
	movea.l	($0934),a0				;$2078,$0934		;ff2028
	jsr	(a0)					;$4e90			;ff202c
	movea.l	($0938),a0				;$2078,$0938		;ff202e
	jsr	(a0)					;$4e90			;ff2032
	bclr.b	#$07,($0bbf)				;$08b8,$0007,$0bbf	;ff2034
	movem.l	(a7)+,d0-d1/a0-a1			;$4cdf,$0303		;ff203a
	rte						;$4e73			;ff203e

Lff2040:									;ff2040
	movem.l	(a7)+,d0-d1/a0-a1			;$4cdf,$0303		;ff2040
	move.w	#$0038,($00e98000)			;$33fc,$0038,$00e9,$8000	;ff2044
	rte						;$4e73			;ff204c

Lff204e:									;ff204e
	move.w	d0,-(a7)				;$3f00			;ff204e
	move.w	($00e98006),d0				;$3039,$00e9,$8006	;ff2050
	move.w	#$0030,($00e98004)			;$33fc,$0030,$00e9,$8004	;ff2056
	move.w	#$0038,($00e98004)			;$33fc,$0038,$00e9,$8004	;ff205e
	move.w	(a7)+,d0				;$301f			;ff2066
	rte						;$4e73			;ff2068

Lff206a:									;ff206a
	move.w	d0,-(a7)				;$3f00			;ff206a
	move.w	($00e98002),d0				;$3039,$00e9,$8002	;ff206c
	move.w	#$0030,($00e98000)			;$33fc,$0030,$00e9,$8000	;ff2072
	move.w	#$0038,($00e98000)			;$33fc,$0038,$00e9,$8000	;ff207a
	move.w	(a7)+,d0				;$301f			;ff2082
	rte						;$4e73			;ff2084

Lff2086:									;ff2086
	rte						;$4e73			;ff2086

Lff2088:									;ff2088
	tst.b	($00e8802f)				;$4a39,$00e8,$802f	;ff2088
	rte						;$4e73			;ff208e

Lff2090:									;ff2090
	movem.l	d0-d2,-(a7)				;$48e7,$e000		;ff2090
	moveq.l	#$00,d0					;$7000			;ff2094
	move.b	($00e8802f),d0				;$1039,$00e8,$802f	;ff2096
	cmp.b	#$ff,d0					;$b03c,$00ff		;ff209c
	beq.s	Lff20cc					;$672a			;ff20a0
	bclr.b	#$04,($00e88013)			;$08b9,$0004,$00e8,$8013	;ff20a2
	move.w	($000c,a7),d2				;$342f,$000c		;ff20aa
	or.w	#$2000,d2				;$847c,$2000		;ff20ae
	move.w	d2,sr					;$46c2			;ff20b2
	move.w	($0810),d1				;$3238,$0810		;ff20b4
	move.w	d0,-(a7)				;$3f00			;ff20b8
	bsr.w	Lff4a4a					;$6100,$298e		;ff20ba
	move.w	(a7)+,d0				;$301f			;ff20be
	bsr.s	Lff20fa					;$6138			;ff20c0
	bset.b	#$04,($00e88013)			;$08f9,$0004,$00e8,$8013	;ff20c2
	bra.s	Lff20e2					;$6016			;ff20ca
Lff20cc:									;ff20cc
	bsr.s	Lff20e8					;$611a			;ff20cc
	move.b	($00ed003a),d1				;$1239,$00ed,$003a	;ff20ce
	bsr.w	Call_KEYDLY				;$6100,$4848		;ff20d4
	move.b	($00ed003b),d1				;$1239,$00ed,$003b	;ff20d8
	bsr.w	Call_KEYREP				;$6100,$484e		;ff20de
Lff20e2:									;ff20e2
	movem.l	(a7)+,d0-d2				;$4cdf,$0007		;ff20e2
	rte						;$4e73			;ff20e6

Lff20e8:									;ff20e8
	movem.l	d0-d1,-(a7)				;$48e7,$c000		;ff20e8
	move.b	($0810),d1				;$1238,$0810		;ff20ec
	bsr.w	Call_LEDCTRL				;$6100,$4818		;ff20f0
	movem.l	(a7)+,d0-d1				;$4cdf,$0003		;ff20f4
	rts						;$4e75			;ff20f8

Lff20fa:									;ff20fa
	movem.l	d1-d2/a0,-(a7)				;$48e7,$6080		;ff20fa
	bsr.w	Lff2232					;$6100,$0132		;ff20fe
	bsr.w	Lff2258					;$6100,$0154		;ff2102
	bsr.w	Lff22e6					;$6100,$01de		;ff2106
	tst.w	d1					;$4a41			;ff210a
	beq.s	Lff2152					;$6744			;ff210c
	cmp.w	#$7300,d1				;$b27c,$7300		;ff210e
	beq.s	Lff2122					;$670e			;ff2112
	cmp.w	#$7200,d1				;$b27c,$7200		;ff2114
	bne.s	Lff2134					;$661a			;ff2118
	btst.b	#$03,($0811)				;$0838,$0003,$0811	;ff211a
	bra.s	Lff2128					;$6006			;ff2120
Lff2122:									;ff2122
	btst.b	#$02,($0811)				;$0838,$0002,$0811	;ff2122
Lff2128:									;ff2128
	beq.s	Lff2134					;$670a			;ff2128
	bsr.w	Lff220a					;$6100,$00de		;ff212a
	move.w	#$6d00,d1				;$323c,$6d00		;ff212e
	bra.s	Lff214e					;$601a			;ff2132
Lff2134:									;ff2134
	cmp.w	#$6100,d1				;$b27c,$6100		;ff2134
	beq.s	Lff21b2					;$6778			;ff2138
	cmp.w	#$6200,d1				;$b27c,$6200		;ff213a
	beq.s	Lff2158					;$6718			;ff213e
	cmp.b	#$03,d1					;$b23c,$0003		;ff2140
	beq.w	Lff21e6					;$6700,$00a0		;ff2144
	cmp.w	#$3700,d1				;$b27c,$3700		;ff2148
	beq.s	Lff217c					;$672e			;ff214c
Lff214e:									;ff214e
	bsr.w	Lff220a					;$6100,$00ba		;ff214e
Lff2152:									;ff2152
	movem.l	(a7)+,d1-d2/a0				;$4cdf,$0106		;ff2152
	rts						;$4e75			;ff2156

Lff2158:									;ff2158
	btst.b	#$02,($0bc5)				;$0838,$0002,$0bc5	;ff2158
	bne.s	Lff214e					;$66ee			;ff215e
	bset.b	#$02,($0bc5)				;$08f8,$0002,$0bc5	;ff2160
	movem.l	d0-d7/a0-a6,-(a7)			;$48e7,$fffe		;ff2166
	move.b	($0811),d0				;$1038,$0811		;ff216a
	trap	#12					;$4e4c			;ff216e
	movem.l	(a7)+,d0-d7/a0-a6			;$4cdf,$7fff		;ff2170
	bclr.b	#$02,($0bc5)				;$08b8,$0002,$0bc5	;ff2174
	bra.s	Lff214e					;$60d2			;ff217a
Lff217c:									;ff217c
	btst.b	#$02,($0811)				;$0838,$0002,$0811	;ff217c
	beq.s	Lff214e					;$67ca			;ff2182
	btst.b	#$01,($0811)				;$0838,$0001,$0811	;ff2184
	beq.s	Lff214e					;$67c2			;ff218a
	btst.b	#$00,($0bc5)				;$0838,$0000,$0bc5	;ff218c
	bne.s	Lff2152					;$66be			;ff2192
	bset.b	#$00,($0bc5)				;$08f8,$0000,$0bc5	;ff2194
	movem.l	d0-d7/a0-a6,-(a7)			;$48e7,$fffe		;ff219a
	move.l	#$58363800,d0				;$203c,$5836,$3800	;ff219e
	trap	#10					;$4e4a			;ff21a4
	movem.l	(a7)+,d0-d7/a0-a6			;$4cdf,$7fff		;ff21a6
	bclr.b	#$00,($0bc5)				;$08b8,$0000,$0bc5	;ff21aa
	bra.s	Lff2152					;$60a0			;ff21b0
Lff21b2:									;ff21b2
	btst.b	#$01,($0bc5)				;$0838,$0001,$0bc5	;ff21b2
	bne.s	Lff21d4					;$661a			;ff21b8
	bset.b	#$01,($0bc5)				;$08f8,$0001,$0bc5	;ff21ba
	movem.l	d0-d7/a0-a6,-(a7)			;$48e7,$fffe		;ff21c0
	move.b	($0811),d0				;$1038,$0811		;ff21c4
	trap	#11					;$4e4b			;ff21c8
	movem.l	(a7)+,d0-d7/a0-a6			;$4cdf,$7fff		;ff21ca
	bclr.b	#$01,($0bc5)				;$08b8,$0001,$0bc5	;ff21ce
Lff21d4:									;ff21d4
	move.b	#$13,d1					;$123c,$0013		;ff21d4
	btst.b	#$00,($0811)				;$0838,$0000,$0811	;ff21d8
	bne.w	Lff214e					;$6600,$ff6e		;ff21de
	move.b	#$03,d1					;$123c,$0003		;ff21e2
Lff21e6:									;ff21e6
	btst.b	#$03,($0bc5)				;$0838,$0003,$0bc5	;ff21e6
	bne.w	Lff214e					;$6600,$ff60		;ff21ec
	bset.b	#$03,($0bc5)				;$08f8,$0003,$0bc5	;ff21f0
	movem.l	d0-d7/a0-a6,-(a7)			;$48e7,$fffe		;ff21f6
	trap	#13					;$4e4d			;ff21fa
	movem.l	(a7)+,d0-d7/a0-a6			;$4cdf,$7fff		;ff21fc
	bclr.b	#$03,($0bc5)				;$08b8,$0003,$0bc5	;ff2200
	bra.w	Lff214e					;$6000,$ff46		;ff2206
Lff220a:									;ff220a
	cmpi.w	#$0040,($0812)				;$0c78,$0040,$0812	;ff220a
	bcc.s	Lff2230					;$641e			;ff2210
	movea.l	($0814),a0				;$2078,$0814		;ff2212
	addq.l	#2,a0					;$5488			;ff2216
	cmpa.l	#$0000089c,a0				;$b1fc,$0000,$089c	;ff2218
	bcs.s	Lff2226					;$6506			;ff221e
	movea.l	#$0000081c,a0				;$207c,$0000,$081c	;ff2220
Lff2226:									;ff2226
	move.w	d1,(a0)					;$3081			;ff2226
	move.l	a0,($0814)				;$21c8,$0814		;ff2228
	addq.w	#1,($0812)				;$5278,$0812		;ff222c
Lff2230:									;ff2230
	rts						;$4e75			;ff2230

Lff2232:									;ff2232
	lea.l	($0800),a0				;$41f8,$0800		;ff2232
	clr.w	d1					;$4241			;ff2236
	move.b	d0,d1					;$1200			;ff2238
	move.b	d0,d2					;$1400			;ff223a
	and.w	#$0007,d2				;$c47c,$0007		;ff223c
	lsr.w	#3,d1					;$e649			;ff2240
	btst.l	#$04,d1					;$0801,$0004		;ff2242
	beq.s	Lff2252					;$670a			;ff2246
	bclr.l	#$04,d1					;$0881,$0004		;ff2248
	bclr.b	d2,(a0,d1.w)				;$05b0,$1000		;ff224c
	rts						;$4e75			;ff2250

Lff2252:									;ff2252
	bset.b	d2,(a0,d1.w)				;$05f0,$1000		;ff2252
	rts						;$4e75			;ff2256

Lff2258:									;ff2258
	move.b	d0,d1					;$1200			;ff2258
	and.b	#$7f,d1					;$c23c,$007f		;ff225a
	cmp.b	#$74,d1					;$b23c,$0074		;ff225e
	bcc.s	Lff22ae					;$644a			;ff2262
	cmp.b	#$70,d1					;$b23c,$0070		;ff2264
	bcc.s	Lff229c					;$6432			;ff2268
	btst.l	#$07,d0					;$0800,$0007		;ff226a
	bne.s	Lff22ae					;$663e			;ff226e
	cmp.b	#$5a,d1					;$b23c,$005a		;ff2270
	bcs.s	Lff22ae					;$6538			;ff2274
	beq.s	Lff22b0					;$6738			;ff2276
	cmp.b	#$5b,d1					;$b23c,$005b		;ff2278
	beq.s	Lff22c6					;$6748			;ff227c
	cmp.b	#$5e,d1					;$b23c,$005e		;ff227e
	bcs.s	Lff22da					;$6556			;ff2282
	cmp.b	#$61,d1					;$b23c,$0061		;ff2284
	bcc.s	Lff22ae					;$6424			;ff2288
	sub.b	#$5a,d1					;$923c,$005a		;ff228a
Lff228e:									;ff228e
	bchg.b	d1,($0810)				;$0378,$0810		;ff228e
	move.w	d0,-(a7)				;$3f00			;ff2292
	bsr.w	Lff20e8					;$6100,$fe52		;ff2294
	move.w	(a7)+,d0				;$301f			;ff2298
	rts						;$4e75			;ff229a

Lff229c:									;ff229c
	sub.b	#$70,d1					;$923c,$0070		;ff229c
	tst.b	d0					;$4a00			;ff22a0
	bpl.s	Lff22aa					;$6a06			;ff22a2
	bclr.b	d1,($0811)				;$03b8,$0811		;ff22a4
	rts						;$4e75			;ff22a8

Lff22aa:									;ff22aa
	bset.b	d1,($0811)				;$03f8,$0811		;ff22aa
Lff22ae:									;ff22ae
	rts						;$4e75			;ff22ae

Lff22b0:									;ff22b0
	btst.b	#$04,($0811)				;$0838,$0004,$0811	;ff22b0
	bne.s	Lff22da					;$6622			;ff22b6
	bclr.b	#$05,($0811)				;$08b8,$0005,$0811	;ff22b8
	bclr.b	#$01,($0810)				;$08b8,$0001,$0810	;ff22be
	bra.s	Lff22da					;$6014			;ff22c4
Lff22c6:									;ff22c6
	btst.b	#$05,($0811)				;$0838,$0005,$0811	;ff22c6
	bne.s	Lff22da					;$660c			;ff22cc
	bclr.b	#$04,($0811)				;$08b8,$0004,$0811	;ff22ce
	bclr.b	#$00,($0810)				;$08b8,$0000,$0810	;ff22d4
Lff22da:									;ff22da
	sub.b	#$56,d1					;$923c,$0056		;ff22da
	bchg.b	d1,($0811)				;$0378,$0811		;ff22de
	subq.b	#4,d1					;$5901			;ff22e2
	bra.s	Lff228e					;$60a8			;ff22e4
Lff22e6:									;ff22e6
	move.w	d0,d1					;$3200			;ff22e6
	move.b	($0811),d2				;$1438,$0811		;ff22e8
	btst.l	#$00,d2					;$0802,$0000		;ff22ec
	bne.s	Lff2300					;$660e			;ff22f0
	tst.b	($00ed0027)				;$4a39,$00ed,$0027	;ff22f2
	bne.s	Lff2312					;$6618			;ff22f8
	btst.l	#$03,d2					;$0802,$0003		;ff22fa
	beq.s	Lff2312					;$6712			;ff22fe
Lff2300:									;ff2300
	cmp.b	#$4e,d0					;$b03c,$004e		;ff2300
	beq.s	Lff2312					;$670c			;ff2304
	cmp.b	#$3b,d0					;$b03c,$003b		;ff2306
	bcs.s	Lff2312					;$6506			;ff230a
	cmp.b	#$52,d0					;$b03c,$0052		;ff230c
	bcs.s	Lff2334					;$6522			;ff2310
Lff2312:									;ff2312
	asl.w	#8,d1					;$e141			;ff2312
	cmp.b	#$35,d0					;$b03c,$0035		;ff2314
	bcs.s	Lff2338					;$651e			;ff2318
	cmp.b	#$80,d0					;$b03c,$0080		;ff231a
	bcs.s	Lff232a					;$650a			;ff231e
	cmp.b	#$f0,d0					;$b03c,$00f0		;ff2320
	bcc.s	Lff2328					;$6402			;ff2324
	clr.w	d1					;$4241			;ff2326
Lff2328:									;ff2328
	rts						;$4e75			;ff2328

Lff232a:									;ff232a
	lea.l	(Lff23fa,pc),a0				;$41fa,$00ce		;ff232a
	move.b	(a0,d0.w),d1				;$1230,$0000		;ff232e
	rts						;$4e75			;ff2332

Lff2334:									;ff2334
	clr.b	d1					;$4201			;ff2334
	rts						;$4e75			;ff2336

Lff2338:									;ff2338
	btst.l	#$01,d2					;$0802,$0001		;ff2338
	bne.w	Lff23d6					;$6600,$0098		;ff233c
	btst.l	#$06,d2					;$0802,$0006		;ff2340
	bne.s	Lff232a					;$66e4			;ff2344
	btst.l	#$02,d2					;$0802,$0002		;ff2346
	bne.s	Lff2358					;$660c			;ff234a
	btst.l	#$04,d2					;$0802,$0004		;ff234c
	bne.s	Lff238e					;$663c			;ff2350
	btst.l	#$05,d2					;$0802,$0005		;ff2352
	bne.s	Lff237e					;$6626			;ff2356
Lff2358:									;ff2358
	bsr.s	Lff237e					;$6124			;ff2358
	btst.l	#$07,d2					;$0802,$0007		;ff235a
	bne.s	Lff237c					;$661c			;ff235e
	cmp.b	#$41,d1					;$b23c,$0041		;ff2360
	bcs.s	Lff237c					;$6516			;ff2364
	cmp.b	#$5b,d1					;$b23c,$005b		;ff2366
	bcs.s	Lff2378					;$650c			;ff236a
	cmp.b	#$61,d1					;$b23c,$0061		;ff236c
	bcs.s	Lff237c					;$650a			;ff2370
	cmp.b	#$7b,d1					;$b23c,$007b		;ff2372
	bcc.s	Lff237c					;$6404			;ff2376
Lff2378:									;ff2378
	eori.b	#$20,d1					;$0a01,$0020		;ff2378
Lff237c:									;ff237c
	rts						;$4e75			;ff237c

Lff237e:									;ff237e
	btst.l	#$00,d2					;$0802,$0000		;ff237e
	beq.s	Lff232a					;$67a6			;ff2382
	lea.l	(Lff247a,pc),a0				;$41fa,$00f4		;ff2384
	move.b	(a0,d0.w),d1				;$1230,$0000		;ff2388
	rts						;$4e75			;ff238c

Lff238e:									;ff238e
	tst.b	($00ed002b)				;$4a39,$00ed,$002b	;ff238e
	bne.s	Lff23ae					;$6618			;ff2394
	lea.l	(Lff24af,pc),a0				;$41fa,$0117		;ff2396
	move.b	(a0,d0.w),d1				;$1230,$0000		;ff239a
	btst.l	#$00,d2					;$0802,$0000		;ff239e
	beq.s	Lff23cc					;$6728			;ff23a2
	lea.l	(Lff24e4,pc),a0				;$41fa,$013e		;ff23a4
	move.w	#$000f,d2				;$343c,$000f		;ff23a8
	bra.s	Lff23c4					;$6016			;ff23ac
Lff23ae:									;ff23ae
	lea.l	(Lff24f4,pc),a0				;$41fa,$0144		;ff23ae
	move.b	(a0,d0.w),d1				;$1230,$0000		;ff23b2
	btst.l	#$00,d2					;$0802,$0000		;ff23b6
	beq.s	Lff23cc					;$6710			;ff23ba
	lea.l	(Lff2529,pc),a0				;$41fa,$016b		;ff23bc
	move.w	#$0010,d2				;$343c,$0010		;ff23c0
Lff23c4:									;ff23c4
	cmp.b	(a0)+,d1				;$b218			;ff23c4
	beq.s	Lff23ce					;$6706			;ff23c6
	dbra.w	d2,Lff23c4				;$51ca,$fffa		;ff23c8
Lff23cc:									;ff23cc
	rts						;$4e75			;ff23cc

Lff23ce:									;ff23ce
	add.b	#$a0,d2					;$d43c,$00a0		;ff23ce
	move.b	d2,d1					;$1202			;ff23d2
	rts						;$4e75			;ff23d4

Lff23d6:									;ff23d6
	lea.l	(Lff247a,pc),a0				;$41fa,$00a2		;ff23d6
	move.b	(a0,d0.w),d1				;$1230,$0000		;ff23da
	cmp.b	#$20,d1					;$b23c,$0020		;ff23de
	bcs.s	Lff23f8					;$6514			;ff23e2
	cmp.b	#$40,d1					;$b23c,$0040		;ff23e4
	bcs.w	Lff2334					;$6500,$ff4a		;ff23e8
	cmp.b	#$80,d1					;$b23c,$0080		;ff23ec
	bcc.w	Lff2334					;$6400,$ff42		;ff23f0
	and.b	#$1f,d1					;$c23c,$001f		;ff23f4
Lff23f8:									;ff23f8
	rts						;$4e75			;ff23f8

Lff23fa:									;ff23fa
	.dc.b	$00,$1b,$31,$32,$33,$34,$35,$36					;ff23fa
	.dc.b	$37,$38,$39,$30,$2d,$5e,$5c,$08					;ff2402
	.dc.b	$09,$51,$57,$45,$52,$54,$59,$55					;ff240a
	.dc.b	$49,$4f,$50,$40,$5b,$0d,$41,$53					;ff2412
	.dc.b	$44,$46,$47,$48,$4a,$4b,$4c,$3b					;ff241a
	.dc.b	$3a,$5d,$5a,$58,$43,$56,$42,$4e					;ff2422
	.dc.b	$4d,$2c,$2e,$2f,$00,$20,$00,$00					;ff242a
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00					;ff2432
	.dc.b	$2f,$2a,$2d,$37,$38,$39,$2b,$34					;ff243a
	.dc.b	$35,$36,$3d,$31,$32,$33,$0d,$30					;ff2442
	.dc.b	$2c,$2e,$00,$00,$00,$00,$00,$00					;ff244a
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00					;ff2452
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00					;ff245a
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00					;ff2462
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00					;ff246a
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00					;ff2472
Lff247a:									;ff247a
	.dc.b	$00,$1b,$21,$22,$23,$24,$25,$26					;ff247a
	.dc.b	$27,$28,$29,$00,$3d,$7e,$7c,$08					;ff2482
	.dc.b	$09,$71,$77,$65,$72,$74,$79,$75					;ff248a
	.dc.b	$69,$6f,$70,$60,$7b,$0d,$61,$73					;ff2492
	.dc.b	$64,$66,$67,$68,$6a,$6b,$6c,$2b					;ff249a
	.dc.b	$2a,$7d,$7a,$78,$63,$76,$62,$6e					;ff24a2
	.dc.b	$6d,$3c,$3e,$3f,$5f						;ff24aa
Lff24af:									;ff24af
	.dc.b	$00,$1b,$c7,$cc,$b1,$b3,$b4,$b5					;ff24af
	.dc.b	$d4,$d5,$d6,$dc,$ce,$cd,$b0,$08					;ff24b7
	.dc.b	$09,$c0,$c3,$b2,$bd,$b6,$dd,$c5					;ff24bf
	.dc.b	$c6,$d7,$be,$de,$df,$0d,$c1,$c4					;ff24c7
	.dc.b	$bc,$ca,$b7,$b8,$cf,$c9,$d8,$da					;ff24cf
	.dc.b	$b9,$d1,$c2,$bb,$bf,$cb,$ba,$d0					;ff24d7
	.dc.b	$d3,$c8,$d9,$d2,$db						;ff24df
Lff24e4:									;ff24e4
	.dc.b	'ﾂﾖﾕﾔｵｴｳｲｱﾜﾒﾈﾑﾟﾙﾛ'						;ff24e4
Lff24f4:									;ff24f4
	.dc.b	$00,$1b,$b1,$b2,$b3,$b4,$b5,$c5					;ff24f4
	.dc.b	$c6,$c7,$c8,$c9,$d7,$d8,$d9,$08					;ff24fc
	.dc.b	$09,$b6,$b7,$b8,$b9,$ba,$ca,$cb					;ff2504
	.dc.b	$cc,$cd,$ce,$da,$db,$0d,$bb,$bc					;ff250c
	.dc.b	$bd,$be,$bf,$cf,$d0,$d1,$d2,$d3					;ff2514
	.dc.b	$de,$df,$c0,$c1,$c2,$c3,$c4,$d4					;ff251c
	.dc.b	$d5,$d6,$dc,$a6,$dd						;ff2524
Lff2529:									;ff2529
	.dc.b	$de,$c2,$d6,$d5,$d4,$b5,$b4,$b3					;ff2529
	.dc.b	$b2,$b1,$c9,$dd,$dc,$df,$db,$a6					;ff2531
	.dc.b	$bb,$2f,$08,$c0,$bc,$00,$00,$00					;ff2539
	.dc.b	$ff,$31,$c0,$0a,$0e,$4e,$7a,$88					;ff2541
	.dc.b	$01,$d1,$c0,$d1,$c0,$d1,$c0,$d1					;ff2549
	.dc.b	$c0,$20,$68,$04,$00,$4e,$90,$31					;ff2551
	.dc.b	$fc,$ff,$ff,$0a,$0e,$20,$5f,$4e					;ff2559
	.dc.b	$73,$60,$d6							;ff2561
Lff2564:									;ff2564
	move.l	a0,-(a7)				;$2f08			;ff2564
	and.w	#$00ff,d0				;$c07c,$00ff		;ff2566
	ext.l	d0					;$48c0			;ff256a
	move.w	d0,($0a0e)				;$31c0,$0a0e		;ff256c
	movea.l	d0,a0					;$2040			;ff2570
	adda.w	a0,a0					;$d0c8			;ff2572
	adda.w	a0,a0					;$d0c8			;ff2574
	movea.l	($0400,a0),a0				;$2068,$0400		;ff2576
	jsr	(a0)					;$4e90			;ff257a
	move.w	#$ffff,($0a0e)				;$31fc,$ffff,$0a0e	;ff257c
	movea.l	(a7)+,a0				;$205f			;ff2582
	rte						;$4e73			;ff2584

Lff2586:									;ff2586
	addq.l	#4,a7					;$588f			;ff2586
	move.w	#$01ff,d7				;$3e3c,$01ff		;ff2588
	move.w	#$ffff,($0a0e)				;$31fc,$ffff,$0a0e	;ff258c
	bra.w	Lff07b2					;$6000,$e21e		;ff2592
Call_Unused:									;ff2596
	addq.l	#8,a7					;$508f			;ff2596
	move.w	#$0100,d7				;$3e3c,$0100		;ff2598
	move.b	d0,d7					;$1e00			;ff259c
	move.w	#$ffff,($0a0e)				;$31fc,$ffff,$0a0e	;ff259e
	bra.w	Lff07b2					;$6000,$e20c		;ff25a4
VecTable:									;ff25a8
	.dc.w	Call_KEYINP-$ff0000						;ff25a8
	.dc.w	Call_KEYSNS-$ff0000						;ff25aa
	.dc.w	Call_SFTSNS-$ff0000						;ff25ac
	.dc.w	Call_KEY_INIT-$ff0000						;ff25ae
	.dc.w	Call_BITSNS-$ff0000						;ff25b0
	.dc.w	Call_SKEYSET-$ff0000						;ff25b2
	.dc.w	Call_LEDCTRL-$ff0000						;ff25b4
	.dc.w	Call_LEDSET-$ff0000						;ff25b6
	.dc.w	Call_KEYDLY-$ff0000						;ff25b8
	.dc.w	Call_KEYREP-$ff0000						;ff25ba
	.dc.w	Call_TV_Control_OPT2-$ff0000					;ff25bc
	.dc.w	Call_TV_Control_OPT2-$ff0000					;ff25be
	.dc.w	Call_TVCTRL-$ff0000						;ff25c0
	.dc.w	Call_LEDMOD-$ff0000						;ff25c2
	.dc.w	Call_TGUSEMD-$ff0000						;ff25c4
	.dc.w	Call_DEFCHR-$ff0000						;ff25c6
	.dc.w	Call_CRTMOD-$ff0000						;ff25c8
	.dc.w	Call_CONTRAST-$ff0000						;ff25ca
	.dc.w	Call_HSVTORGB-$ff0000						;ff25cc
	.dc.w	Call_TPALET-$ff0000						;ff25ce
	.dc.w	Call_TPALET2-$ff0000						;ff25d0
	.dc.w	Call_TCOLOR-$ff0000						;ff25d2
	.dc.w	Call_FNTADR-$ff0000						;ff25d4
	.dc.w	Call_VRAMGET-$ff0000						;ff25d6
	.dc.w	Call_VRAMPUT-$ff0000						;ff25d8
	.dc.w	Call_FNTGET-$ff0000						;ff25da
	.dc.w	Call_TEXTGET-$ff0000						;ff25dc
	.dc.w	Call_TEXTPUT-$ff0000						;ff25de
	.dc.w	Call_CLIPPUT-$ff0000						;ff25e0
	.dc.w	Call_SCROLL-$ff0000						;ff25e2
	.dc.w	Call_B_CURON-$ff0000						;ff25e4
	.dc.w	Call_B_CUROFF-$ff0000						;ff25e6
	.dc.w	Call_B_PUTC-$ff0000						;ff25e8
	.dc.w	Call_B_PRINT-$ff0000						;ff25ea
	.dc.w	Call_B_COLOR-$ff0000						;ff25ec
	.dc.w	Call_B_LOCATE-$ff0000						;ff25ee
	.dc.w	Call_B_DOWN_S-$ff0000						;ff25f0
	.dc.w	Call_B_UP_S-$ff0000						;ff25f2
	.dc.w	Call_B_UP-$ff0000						;ff25f4
	.dc.w	Call_B_DOWN-$ff0000						;ff25f6
	.dc.w	Call_B_RIGHT-$ff0000						;ff25f8
	.dc.w	Call_B_LEFT-$ff0000						;ff25fa
	.dc.w	Call_B_CLR_ST-$ff0000						;ff25fc
	.dc.w	Call_B_ERA_ST-$ff0000						;ff25fe
	.dc.w	Call_B_INS-$ff0000						;ff2600
	.dc.w	Call_B_DEL-$ff0000						;ff2602
	.dc.w	Call_B_CONSOL-$ff0000						;ff2604
	.dc.w	Call_B_PUTMES-$ff0000						;ff2606
	.dc.w	Call_SET232C-$ff0000						;ff2608
	.dc.w	Call_LOF232C-$ff0000						;ff260a
	.dc.w	Call_INP232C-$ff0000						;ff260c
	.dc.w	Call_ISNS232C-$ff0000						;ff260e
	.dc.w	Call_OSNS232C-$ff0000						;ff2610
	.dc.w	Call_OUT232C-$ff0000						;ff2612
	.dc.w	Call_Unknown_36-$ff0000						;ff2614
	.dc.w	Call_Unknown_37-$ff0000						;ff2616
	.dc.w	Call_SETFNTADR-$ff0000						;ff2618
	.dc.w	Call_Unknown_39-$ff0000						;ff261a
	.dc.w	Call_Unknown_3a-$ff0000						;ff261c
	.dc.w	Call_JOYGET-$ff0000						;ff261e
	.dc.w	Call_INIT_PRN-$ff0000						;ff2620
	.dc.w	Call_SNSPRN-$ff0000						;ff2622
	.dc.w	Call_OUTLPT-$ff0000						;ff2624
	.dc.w	Call_OUTPRN-$ff0000						;ff2626
	.dc.w	Call_B_SEEK-$ff0000						;ff2628
	.dc.w	Call_B_VERIFY-$ff0000						;ff262a
	.dc.w	Call_B_READDI-$ff0000						;ff262c
	.dc.w	Call_B_DSKINI-$ff0000						;ff262e
	.dc.w	Call_B_DRVSNS-$ff0000						;ff2630
	.dc.w	Call_B_WRITE-$ff0000						;ff2632
	.dc.w	Call_B_READ-$ff0000						;ff2634
	.dc.w	Call_B_RECALI-$ff0000						;ff2636
	.dc.w	Call_B_ASSIGN-$ff0000						;ff2638
	.dc.w	Call_B_WRITED-$ff0000						;ff263a
	.dc.w	Call_B_READID-$ff0000						;ff263c
	.dc.w	Call_B_BADFMT-$ff0000						;ff263e
	.dc.w	Call_B_READDL-$ff0000						;ff2640
	.dc.w	Call_B_FORMAT-$ff0000						;ff2642
	.dc.w	Call_B_DRVCHK-$ff0000						;ff2644
	.dc.w	Call_B_EJECT-$ff0000						;ff2646
	.dc.w	Call_DATEBCD-$ff0000						;ff2648
	.dc.w	Call_DATESET-$ff0000						;ff264a
	.dc.w	Call_TIMEBCD-$ff0000						;ff264c
	.dc.w	Call_TIMESET-$ff0000						;ff264e
	.dc.w	Call_DATEGET-$ff0000						;ff2650
	.dc.w	Call_DATEBIN-$ff0000						;ff2652
	.dc.w	Call_TIMEGET-$ff0000						;ff2654
	.dc.w	Call_TIMEBIN-$ff0000						;ff2656
	.dc.w	Call_DATECNV-$ff0000						;ff2658
	.dc.w	Call_TIMECNV-$ff0000						;ff265a
	.dc.w	Call_DATEASC-$ff0000						;ff265c
	.dc.w	Call_TIMEASC-$ff0000						;ff265e
	.dc.w	Call_DAYASC-$ff0000						;ff2660
	.dc.w	Call_ALARMMOD-$ff0000						;ff2662
	.dc.w	Call_ALARMSET-$ff0000						;ff2664
	.dc.w	Call_ALARMGET-$ff0000						;ff2666
	.dc.w	Call_ADPCMOUT-$ff0000						;ff2668
	.dc.w	Call_ADPCMINP-$ff0000						;ff266a
	.dc.w	Call_ADPCMAOT-$ff0000						;ff266c
	.dc.w	Call_ADPCMAIN-$ff0000						;ff266e
	.dc.w	Call_ADPCMLOT-$ff0000						;ff2670
	.dc.w	Call_ADPCMLIN-$ff0000						;ff2672
	.dc.w	Call_ADPCMSNS-$ff0000						;ff2674
	.dc.w	Call_ADPCMMOD-$ff0000						;ff2676
	.dc.w	Call_OPMSET-$ff0000						;ff2678
	.dc.w	Call_OPMSNS-$ff0000						;ff267a
	.dc.w	Call_OPMINTST-$ff0000						;ff267c
	.dc.w	Call_TIMERDST-$ff0000						;ff267e
	.dc.w	Call_VDISPST-$ff0000						;ff2680
	.dc.w	Call_CRTCRAS-$ff0000						;ff2682
	.dc.w	Call_HSYNCST-$ff0000						;ff2684
	.dc.w	Call_PRNINTST-$ff0000						;ff2686
	.dc.w	Call_MS_INIT-$ff0000						;ff2688
	.dc.w	Call_MS_CURON-$ff0000						;ff268a
	.dc.w	Call_MS_CUROF-$ff0000						;ff268c
	.dc.w	Call_MS_STAT-$ff0000						;ff268e
	.dc.w	Call_MS_GETDT-$ff0000						;ff2690
	.dc.w	Call_MS_CURGT-$ff0000						;ff2692
	.dc.w	Call_MS_CURST-$ff0000						;ff2694
	.dc.w	Call_MS_LIMIT-$ff0000						;ff2696
	.dc.w	Call_MS_OFFTM-$ff0000						;ff2698
	.dc.w	Call_MS_ONTM-$ff0000						;ff269a
	.dc.w	Call_MS_PATST-$ff0000						;ff269c
	.dc.w	Call_MS_SEL-$ff0000						;ff269e
	.dc.w	Call_MS_SEL2-$ff0000						;ff26a0
	.dc.w	Call_SKEY_MOD-$ff0000						;ff26a2
	.dc.w	Call_DENSNS-$ff0000						;ff26a4
	.dc.w	Call_ONTIME-$ff0000						;ff26a6
	.dc.w	Call_B_INTVCS-$ff0000						;ff26a8
	.dc.w	Call_B_SUPER-$ff0000						;ff26aa
	.dc.w	Call_B_BPEEK-$ff0000						;ff26ac
	.dc.w	Call_B_WPEEK-$ff0000						;ff26ae
	.dc.w	Call_B_LPEEK-$ff0000						;ff26b0
	.dc.w	Call_B_MEMSTR-$ff0000						;ff26b2
	.dc.w	Call_B_BPOKE-$ff0000						;ff26b4
	.dc.w	Call_B_WPOKE-$ff0000						;ff26b6
	.dc.w	Call_B_LPOKE-$ff0000						;ff26b8
	.dc.w	Call_B_MEMSET-$ff0000						;ff26ba
	.dc.w	Call_DMAMOVE-$ff0000						;ff26bc
	.dc.w	Call_DMAMOV_A-$ff0000						;ff26be
	.dc.w	Call_DMAMOV_L-$ff0000						;ff26c0
	.dc.w	Call_DMAMODE-$ff0000						;ff26c2
	.dc.w	Call_BOOTINF-$ff0000						;ff26c4
	.dc.w	Call_ROMVER-$ff0000						;ff26c6
	.dc.w	Call_G_CLR_ON-$ff0000						;ff26c8
	.dc.w	Call_Unknown_91-$ff0000						;ff26ca
	.dc.w	Call_Unknown_92-$ff0000						;ff26cc
	.dc.w	Call_Unknown_93-$ff0000						;ff26ce
	.dc.w	Call_GPALET-$ff0000						;ff26d0
	.dc.w	Call_Unknown_95-$ff0000						;ff26d2
	.dc.w	Call_Unknown_96-$ff0000						;ff26d4
	.dc.w	Call_Unknown_97-$ff0000						;ff26d6
	.dc.w	Call_Unknown_98-$ff0000						;ff26d8
	.dc.w	Call_Unknown_99-$ff0000						;ff26da
	.dc.w	Call_Unknown_9a-$ff0000						;ff26dc
	.dc.w	Call_Unknown_9b-$ff0000						;ff26de
	.dc.w	Call_Unknown_9c-$ff0000						;ff26e0
	.dc.w	Call_Unused-$ff0000						;ff26e2
	.dc.w	Call_Unused-$ff0000						;ff26e4
	.dc.w	Call_Unused-$ff0000						;ff26e6
	.dc.w	Call_SFTJIS-$ff0000						;ff26e8
	.dc.w	Call_JISSFT-$ff0000						;ff26ea
	.dc.w	Call_AKCONV-$ff0000						;ff26ec
	.dc.w	Call_RMACNV-$ff0000						;ff26ee
	.dc.w	Call_DAKJOB-$ff0000						;ff26f0
	.dc.w	Call_HANJOB-$ff0000						;ff26f2
	.dc.w	Call_Unused-$ff0000						;ff26f4
	.dc.w	Call_Unused-$ff0000						;ff26f6
	.dc.w	Call_Unused-$ff0000						;ff26f8
	.dc.w	Call_Unused-$ff0000						;ff26fa
	.dc.w	Call_Unused-$ff0000						;ff26fc
	.dc.w	Call_Unused-$ff0000						;ff26fe
	.dc.w	Call_SYS_STAT-$ff0000						;ff2700
	.dc.w	Call_B_CONMOD-$ff0000						;ff2702
	.dc.w	Call_OS_CURON-$ff0000						;ff2704
	.dc.w	Call_OS_CUROF-$ff0000						;ff2706
	.dc.w	Call_DRAWMODE-$ff0000						;ff2708
	.dc.w	Call_APAGE-$ff0000						;ff270a
	.dc.w	Call_VPAGE-$ff0000						;ff270c
	.dc.w	Call_HOME-$ff0000						;ff270e
	.dc.w	Call_WINDOW-$ff0000						;ff2710
	.dc.w	Call_WIPE-$ff0000						;ff2712
	.dc.w	Call_PSET-$ff0000						;ff2714
	.dc.w	Call_POINT-$ff0000						;ff2716
	.dc.w	Call_LINE-$ff0000						;ff2718
	.dc.w	Call_BOX-$ff0000						;ff271a
	.dc.w	Call_FILL-$ff0000						;ff271c
	.dc.w	Call_CIRCLE-$ff0000						;ff271e
	.dc.w	Call_PAINT-$ff0000						;ff2720
	.dc.w	Call_SYMBOL-$ff0000						;ff2722
	.dc.w	Call_GETGRM-$ff0000						;ff2724
	.dc.w	Call_PUTGRM-$ff0000						;ff2726
	.dc.w	Call_SP_INIT-$ff0000						;ff2728
	.dc.w	Call_SP_ON-$ff0000						;ff272a
	.dc.w	Call_SP_OFF-$ff0000						;ff272c
	.dc.w	Call_SP_CGCLR-$ff0000						;ff272e
	.dc.w	Call_SP_DEFCG-$ff0000						;ff2730
	.dc.w	Call_SP_GTPCG-$ff0000						;ff2732
	.dc.w	Call_SP_REGST-$ff0000						;ff2734
	.dc.w	Call_SP_REGGT-$ff0000						;ff2736
	.dc.w	Call_BGSCRLST-$ff0000						;ff2738
	.dc.w	Call_BGSCRLGT-$ff0000						;ff273a
	.dc.w	Call_BGCTRLST-$ff0000						;ff273c
	.dc.w	Call_BGCTRLGT-$ff0000						;ff273e
	.dc.w	Call_BGTEXTCL-$ff0000						;ff2740
	.dc.w	Call_BGTEXTST-$ff0000						;ff2742
	.dc.w	Call_BGTEXTGT-$ff0000						;ff2744
	.dc.w	Call_SPALET-$ff0000						;ff2746
	.dc.w	Call_Unused-$ff0000						;ff2748
	.dc.w	Call_Unused-$ff0000						;ff274a
	.dc.w	Call_Unused-$ff0000						;ff274c
	.dc.w	Call_TXXLINE-$ff0000						;ff274e
	.dc.w	Call_TXYLINE-$ff0000						;ff2750
	.dc.w	Call_TXLINE-$ff0000						;ff2752
	.dc.w	Call_TXBOX-$ff0000						;ff2754
	.dc.w	Call_TXFILL-$ff0000						;ff2756
	.dc.w	Call_TXREV-$ff0000						;ff2758
	.dc.w	Call_Unused-$ff0000						;ff275a
	.dc.w	Call_Unused-$ff0000						;ff275c
	.dc.w	Call_Unused-$ff0000						;ff275e
	.dc.w	Call_Unused-$ff0000						;ff2760
	.dc.w	Call_Unused-$ff0000						;ff2762
	.dc.w	Call_Unused-$ff0000						;ff2764
	.dc.w	Call_Unknown_df-$ff0000						;ff2766
Call_DATEBCD:									;ff2768
	movem.l	d1-d5/a0,-(a7)				;$48e7,$7c80		;ff2768
	move.l	d1,d2					;$2401			;ff276c
	move.l	d1,d3					;$2601			;ff276e
	swap.w	d1					;$4841			;ff2770
	lsr.w	#8,d2					;$e04a			;ff2772
	and.l	#$00000fff,d1				;$c2bc,$0000,$0fff	;ff2774
	and.l	#$000000ff,d2				;$c4bc,$0000,$00ff	;ff277a
	and.l	#$000000ff,d3				;$c6bc,$0000,$00ff	;ff2780
	cmp.l	#$000007bc,d1				;$b2bc,$0000,$07bc	;ff2786
	bcs.w	Lff2898					;$6500,$010a		;ff278c
	cmp.l	#$0000081f,d1				;$b2bc,$0000,$081f	;ff2790
	bhi.w	Lff2898					;$6200,$0100		;ff2796
	sub.l	#$000007bc,d1				;$92bc,$0000,$07bc	;ff279a
	tst.l	d2					;$4a82			;ff27a0
	beq.w	Lff2898					;$6700,$00f4		;ff27a2
	cmp.l	#$0000000c,d2				;$b4bc,$0000,$000c	;ff27a6
	bhi.w	Lff2898					;$6200,$00ea		;ff27ac
	tst.l	d3					;$4a83			;ff27b0
	beq.w	Lff2898					;$6700,$00e4		;ff27b2
	cmp.l	#$0000001f,d3				;$b6bc,$0000,$001f	;ff27b6
	bhi.w	Lff2898					;$6200,$00da		;ff27bc
	cmp.l	#$00000002,d2				;$b4bc,$0000,$0002	;ff27c0
	bne.s	$00ff27e6				;$661e			;ff27c6
	cmp.l	#$0000001d,d3				;$b6bc,$0000,$001d	;ff27c8
	bhi.w	Lff2898					;$6200,$00c8		;ff27ce
	bcs.s	$00ff2808				;$6534			;ff27d2
	btst.l	#$00,d1					;$0801,$0000		;ff27d4
	bne.w	Lff2898					;$6600,$00be		;ff27d8
	btst.l	#$01,d1					;$0801,$0001		;ff27dc
	bne.w	Lff2898					;$6600,$00b6		;ff27e0
	bra.s	$00ff2808				;$6022			;ff27e4
	cmp.l	#$0000001f,d3				;$b6bc,$0000,$001f	;ff27e6
	bne.s	$00ff2808				;$661a			;ff27ec
	cmp.l	#$00000008,d2				;$b4bc,$0000,$0008	;ff27ee
	bcs.s	$00ff2800				;$650a			;ff27f4
	btst.l	#$00,d2					;$0802,$0000		;ff27f6
	bne.w	Lff2898					;$6600,$009c		;ff27fa
	bra.s	$00ff2808				;$6008			;ff27fe
	btst.l	#$00,d2					;$0802,$0000		;ff2800
	beq.w	Lff2898					;$6700,$0092		;ff2804
	move.l	d1,d4					;$2801			;ff2808
	lsr.l	#2,d4					;$e48c			;ff280a
	divu.w	#$0007,d4				;$88fc,$0007		;ff280c
	swap.w	d4					;$4844			;ff2810
	move.l	d1,d5					;$2a01			;ff2812
	lea.l	(Lff28a0,pc),a0				;$41fa,$008a		;ff2814
	and.l	#$00000003,d5				;$cabc,$0000,$0003	;ff2818
	bne.s	Lff2824					;$6604			;ff281e
	lea.l	($008a,pc),a0				;$41fa,$008a		;ff2820
Lff2824:									;ff2824
	move.b	(-$01,a0,d2.w),d0			;$1030,$20ff		;ff2824
	lea.l	($008e,pc),a0				;$41fa,$008e		;ff2828
	add.b	(a0,d4.w),d0				;$d030,$4000		;ff282c
	lea.l	($008d,pc),a0				;$41fa,$008d		;ff2830
	add.b	(a0,d5.w),d0				;$d030,$5000		;ff2834
	add.b	d3,d0					;$d003			;ff2838
	subq.b	#1,d0					;$5300			;ff283a
	and.l	#$000000ff,d0				;$c0bc,$0000,$00ff	;ff283c
	divu.w	#$0007,d0				;$80fc,$0007		;ff2842
	swap.w	d0					;$4840			;ff2846
	and.l	#$00000007,d0				;$c0bc,$0000,$0007	;ff2848
	move.l	d0,d4					;$2800			;ff284e
	divu.w	#$000a,d1				;$82fc,$000a		;ff2850
	move.l	d1,d0					;$2001			;ff2854
	ror.l	#8,d0					;$e098			;ff2856
	ror.l	#4,d0					;$e898			;ff2858
	add.l	d0,d1					;$d280			;ff285a
	and.l	#Lff0000,d1				;$c2bc,$00ff,$0000	;ff285c
	divu.w	#$000a,d2				;$84fc,$000a		;ff2862
	move.l	d2,d0					;$2002			;ff2866
	lsl.l	#8,d0					;$e188			;ff2868
	lsl.l	#4,d0					;$e988			;ff286a
	lsr.l	#8,d2					;$e08a			;ff286c
	add.w	d0,d2					;$d440			;ff286e
	divu.w	#$000a,d3				;$86fc,$000a		;ff2870
	swap.w	d3					;$4843			;ff2874
	move.l	d3,d0					;$2003			;ff2876
	lsr.l	#8,d0					;$e088			;ff2878
	lsr.l	#4,d0					;$e888			;ff287a
	add.w	d0,d3					;$d640			;ff287c
	and.l	#$000000ff,d3				;$c6bc,$0000,$00ff	;ff287e
	ror.l	#8,d4					;$e09c			;ff2884
	ror.l	#4,d5					;$e89d			;ff2886
	move.l	d1,d0					;$2001			;ff2888
	add.l	d2,d0					;$d082			;ff288a
	add.l	d3,d0					;$d083			;ff288c
	add.l	d4,d0					;$d084			;ff288e
	add.l	d5,d0					;$d085			;ff2890
	movem.l	(a7)+,d1-d5/a0				;$4cdf,$013e		;ff2892
	rts						;$4e75			;ff2896

Lff2898:									;ff2898
	moveq.l	#$ff,d0					;$70ff			;ff2898
	movem.l	(a7)+,d1-d5/a0				;$4cdf,$013e		;ff289a
	rts						;$4e75			;ff289e

Lff28a0:									;ff28a0
	.dc.b	$00,$03,$03,$06,$01,$04,$06,$02					;ff28a0
	.dc.b	$05,$00,$03,$05,$00,$03,$04,$00					;ff28a8
	.dc.b	$02,$05,$00,$03,$06,$01,$04,$06					;ff28b0
	.dc.b	$02,$00,$05,$03,$01,$06,$04,$00					;ff28b8
	.dc.b	$02,$03,$04,$00							;ff28c0
Call_DATESET:									;ff28c4
	movem.l	d1-d2/a1,-(a7)				;$48e7,$6040		;ff28c4
	move.w	sr,-(a7)				;$40e7			;ff28c8
	ori.w	#$0700,sr				;$007c,$0700		;ff28ca
	lea.l	($00e8a000),a0				;$41f9,$00e8,$a000	;ff28ce
	move.l	d1,d0					;$2001			;ff28d4
	rol.l	#4,d0					;$e998			;ff28d6
	and.b	#$03,d0					;$c03c,$0003		;ff28d8
	move.b	($001b,a0),d2				;$1428,$001b		;ff28dc
	bset.l	#$00,d2					;$08c2,$0000		;ff28e0
	bclr.l	#$03,d2					;$0882,$0003		;ff28e4
	move.b	d2,($001b,a0)				;$1142,$001b		;ff28e8
	tst.b	($00e9a001)				;$4a39,$00e9,$a001	;ff28ec
	tst.b	($00e9a001)				;$4a39,$00e9,$a001	;ff28f2
	move.b	d0,($0017,a0)				;$1140,$0017		;ff28f8
	tst.b	($00e9a001)				;$4a39,$00e9,$a001	;ff28fc
	tst.b	($00e9a001)				;$4a39,$00e9,$a001	;ff2902
	bclr.l	#$00,d2					;$0882,$0000		;ff2908
	move.b	d2,($001b,a0)				;$1142,$001b		;ff290c
	move.l	d1,d0					;$2001			;ff2910
	rol.l	#8,d0					;$e198			;ff2912
	and.w	#$0007,d0				;$c07c,$0007		;ff2914
	lea.l	($000c,a0),a1				;$43e8,$000c		;ff2918
	move.w	d0,(a1)+				;$32c0			;ff291c
	moveq.l	#$05,d2					;$7405			;ff291e
	move.b	d1,d0					;$1001			;ff2920
	and.w	#$000f,d0				;$c07c,$000f		;ff2922
	move.w	d0,(a1)+				;$32c0			;ff2926
	ror.l	#4,d1					;$e899			;ff2928
	dbra.w	d2,$00ff2920				;$51ca,$fff4		;ff292a
	move.b	($001b,a0),d2				;$1428,$001b		;ff292e
	bset.l	#$03,d2					;$08c2,$0003		;ff2932
	tst.b	($00e9a001)				;$4a39,$00e9,$a001	;ff2936
	tst.b	($00e9a001)				;$4a39,$00e9,$a001	;ff293c
	move.b	d2,($001b,a0)				;$1142,$001b		;ff2942
	clr.l	d0					;$4280			;ff2946
	move.w	(a7)+,sr				;$46df			;ff2948
	movem.l	(a7)+,d1-d2/a1				;$4cdf,$0206		;ff294a
	rts						;$4e75			;ff294e

Call_TIMEBCD:									;ff2950
	movem.l	d1-d2,-(a7)				;$48e7,$6000		;ff2950
	swap.w	d1					;$4841			;ff2954
	clr.l	d2					;$4282			;ff2956
	move.b	d1,d2					;$1401			;ff2958
	cmp.b	#$18,d2					;$b43c,$0018		;ff295a
	bcc.s	Lff29a6					;$6446			;ff295e
	move.w	#$0010,d0				;$303c,$0010		;ff2960
	divu.w	#$000a,d2				;$84fc,$000a		;ff2964
	or.b	d2,d0					;$8002			;ff2968
	swap.w	d2					;$4842			;ff296a
	rol.l	#4,d0					;$e998			;ff296c
	or.b	d2,d0					;$8002			;ff296e
	rol.l	#4,d0					;$e998			;ff2970
	rol.l	#8,d1					;$e199			;ff2972
	clr.l	d2					;$4282			;ff2974
	move.b	d1,d2					;$1401			;ff2976
	cmp.b	#$3c,d2					;$b43c,$003c		;ff2978
	bcc.s	Lff29a6					;$6428			;ff297c
	divu.w	#$000a,d2				;$84fc,$000a		;ff297e
	or.b	d2,d0					;$8002			;ff2982
	swap.w	d2					;$4842			;ff2984
	rol.l	#4,d0					;$e998			;ff2986
	or.b	d2,d0					;$8002			;ff2988
	rol.l	#4,d0					;$e998			;ff298a
	rol.l	#8,d1					;$e199			;ff298c
	clr.l	d2					;$4282			;ff298e
	move.b	d1,d2					;$1401			;ff2990
	cmp.b	#$3c,d2					;$b43c,$003c		;ff2992
	bcc.s	Lff29a6					;$640e			;ff2996
	divu.w	#$000a,d2				;$84fc,$000a		;ff2998
	or.b	d2,d0					;$8002			;ff299c
	swap.w	d2					;$4842			;ff299e
	rol.l	#4,d0					;$e998			;ff29a0
	or.b	d2,d0					;$8002			;ff29a2
	bra.s	Lff29a8					;$6002			;ff29a4
Lff29a6:									;ff29a6
	moveq.l	#$ff,d0					;$70ff			;ff29a6
Lff29a8:									;ff29a8
	movem.l	(a7)+,d1-d2				;$4cdf,$0006		;ff29a8
	rts						;$4e75			;ff29ac

Call_TIMESET:									;ff29ae
	movem.l	d1-d2/a1,-(a7)				;$48e7,$6040		;ff29ae
	lea.l	($00e8a000),a0				;$41f9,$00e8,$a000	;ff29b2
	move.b	#$06,($001f,a0)				;$117c,$0006,$001f	;ff29b8
	move.l	d1,d0					;$2001			;ff29be
	rol.l	#8,d0					;$e198			;ff29c0
	and.b	#$01,d0					;$c03c,$0001		;ff29c2
	move.b	($001b,a0),d2				;$1428,$001b		;ff29c6
	bset.l	#$00,d2					;$08c2,$0000		;ff29ca
	tst.b	($00e9a001)				;$4a39,$00e9,$a001	;ff29ce
	tst.b	($00e9a001)				;$4a39,$00e9,$a001	;ff29d4
	move.b	d2,($001b,a0)				;$1142,$001b		;ff29da
	tst.b	($00e9a001)				;$4a39,$00e9,$a001	;ff29de
	tst.b	($00e9a001)				;$4a39,$00e9,$a001	;ff29e4
	move.b	d0,($0015,a0)				;$1140,$0015		;ff29ea
	tst.b	($00e9a001)				;$4a39,$00e9,$a001	;ff29ee
	tst.b	($00e9a001)				;$4a39,$00e9,$a001	;ff29f4
	bclr.l	#$00,d2					;$0882,$0000		;ff29fa
	move.b	d2,($001b,a0)				;$1142,$001b		;ff29fe
	lea.l	($0000.w,a0),a1				;$43e8,$0000		;ff2a02
	moveq.l	#$05,d2					;$7405			;ff2a06
Lff2a08:									;ff2a08
	move.b	d1,d0					;$1001			;ff2a08
	and.w	#$000f,d0				;$c07c,$000f		;ff2a0a
	move.w	d0,(a1)+				;$32c0			;ff2a0e
	ror.l	#4,d1					;$e899			;ff2a10
	dbra.w	d2,Lff2a08				;$51ca,$fff4		;ff2a12
	move.b	#$04,($001f,a0)				;$117c,$0004,$001f	;ff2a16
	clr.l	d0					;$4280			;ff2a1c
	movem.l	(a7)+,d1-d2/a1				;$4cdf,$0206		;ff2a1e
	rts						;$4e75			;ff2a22

Call_DATEGET:									;ff2a24
	movem.l	d1-d2/a1,-(a7)				;$48e7,$6040		;ff2a24
	lea.l	($00e8a000),a0				;$41f9,$00e8,$a000	;ff2a28
	bclr.b	#$00,($001b,a0)				;$08a8,$0000,$001b	;ff2a2e
	bsr.s	Lff2a44					;$610e			;ff2a34
	cmp.b	#$02,d0					;$b03c,$0002		;ff2a36
	bcc.s	Lff2a3e					;$6402			;ff2a3a
	bsr.s	Lff2a44					;$6106			;ff2a3c
Lff2a3e:									;ff2a3e
	movem.l	(a7)+,d1-d2/a1				;$4cdf,$0206		;ff2a3e
	rts						;$4e75			;ff2a42

Lff2a44:									;ff2a44
	move.b	($000d,a0),d0				;$1028,$000d		;ff2a44
	and.w	#$0007,d0				;$c07c,$0007		;ff2a48
	lea.l	($001a,a0),a1				;$43e8,$001a		;ff2a4c
Lff2a50:									;ff2a50
	moveq.l	#$05,d2					;$7405			;ff2a50
Lff2a52:									;ff2a52
	move.w	-(a1),d1				;$3221			;ff2a52
	and.w	#$000f,d1				;$c27c,$000f		;ff2a54
	asl.l	#4,d0					;$e980			;ff2a58
	or.b	d1,d0					;$8001			;ff2a5a
	dbra.w	d2,Lff2a52				;$51ca,$fff4		;ff2a5c
	rts						;$4e75			;ff2a60

Call_DATEBIN:									;ff2a62
	movem.l	d1-d3,-(a7)				;$48e7,$7000		;ff2a62
	rol.l	#8,d1					;$e199			;ff2a66
	move.b	d1,d0					;$1001			;ff2a68
	and.w	#$000f,d0				;$c07c,$000f		;ff2a6a
	rol.w	#4,d0					;$e958			;ff2a6e
	move.w	d0,d2					;$3400			;ff2a70
	bsr.s	Lff2a80					;$610c			;ff2a72
	add.l	#$07bc0000,d0				;$d0bc,$07bc,$0000	;ff2a74
	movem.l	(a7)+,d1-d3				;$4cdf,$000e		;ff2a7a
	rts						;$4e75			;ff2a7e

Lff2a80:									;ff2a80
	moveq.l	#$02,d3					;$7602			;ff2a80
Lff2a82:									;ff2a82
	rol.l	#4,d1					;$e999			;ff2a82
	move.b	d1,d0					;$1001			;ff2a84
	and.w	#$000f,d0				;$c07c,$000f		;ff2a86
	mulu.w	#$000a,d0				;$c0fc,$000a		;ff2a8a
	rol.l	#8,d2					;$e19a			;ff2a8e
	move.b	d0,d2					;$1400			;ff2a90
	rol.l	#4,d1					;$e999			;ff2a92
	move.b	d1,d0					;$1001			;ff2a94
	and.w	#$000f,d0				;$c07c,$000f		;ff2a96
	add.b	d0,d2					;$d400			;ff2a9a
	dbra.w	d3,Lff2a82				;$51cb,$ffe4		;ff2a9c
	move.l	d2,d0					;$2002			;ff2aa0
	rts						;$4e75			;ff2aa2

Call_TIMEGET:									;ff2aa4
	movem.l	d1-d2/a1,-(a7)				;$48e7,$6040		;ff2aa4
	lea.l	($00e8a000),a0				;$41f9,$00e8,$a000	;ff2aa8
	bsr.s	Lff2abc					;$610c			;ff2aae
	tst.b	d0					;$4a00			;ff2ab0
	bne.s	Lff2ab6					;$6602			;ff2ab2
	bsr.s	Lff2abc					;$6106			;ff2ab4
Lff2ab6:									;ff2ab6
	movem.l	(a7)+,d1-d2/a1				;$4cdf,$0206		;ff2ab6
	rts						;$4e75			;ff2aba

Lff2abc:									;ff2abc
	move.b	($001b,a0),d2				;$1428,$001b		;ff2abc
	bset.l	#$00,d2					;$08c2,$0000		;ff2ac0
	tst.b	($00e9a001)				;$4a39,$00e9,$a001	;ff2ac4
	tst.b	($00e9a001)				;$4a39,$00e9,$a001	;ff2aca
	move.b	d2,($001b,a0)				;$1142,$001b		;ff2ad0
	tst.b	($00e9a001)				;$4a39,$00e9,$a001	;ff2ad4
	tst.b	($00e9a001)				;$4a39,$00e9,$a001	;ff2ada
	move.b	($0015,a0),d0				;$1028,$0015		;ff2ae0
	tst.b	($00e9a001)				;$4a39,$00e9,$a001	;ff2ae4
	tst.b	($00e9a001)				;$4a39,$00e9,$a001	;ff2aea
	bclr.l	#$00,d2					;$0882,$0000		;ff2af0
	move.b	d2,($001b,a0)				;$1142,$001b		;ff2af4
	and.w	#$0001,d0				;$c07c,$0001		;ff2af8
	lea.l	($000c,a0),a1				;$43e8,$000c		;ff2afc
	bra.w	Lff2a50					;$6000,$ff4e		;ff2b00
Call_TIMEBIN:									;ff2b04
	movem.l	d1-d3,-(a7)				;$48e7,$7000		;ff2b04
	rol.l	#8,d1					;$e199			;ff2b08
	clr.l	d2					;$4282			;ff2b0a
	bsr.w	Lff2a80					;$6100,$ff72		;ff2b0c
	movem.l	(a7)+,d1-d3				;$4cdf,$000e		;ff2b10
	rts						;$4e75			;ff2b14

Call_DATECNV:									;ff2b16
	movem.l	d1-d2,-(a7)				;$48e7,$6000		;ff2b16
	bsr.s	Lff2b72					;$6156			;ff2b1a
	cmp.l	#$00000820,d1				;$b2bc,$0000,$0820	;ff2b1c
	bcc.s	Lff2b6e					;$644a			;ff2b22
	cmp.w	#$07bc,d1				;$b27c,$07bc		;ff2b24
	bcc.s	Lff2b44					;$641a			;ff2b28
	cmp.w	#$0064,d1				;$b27c,$0064		;ff2b2a
	bcc.s	Lff2b6e					;$643e			;ff2b2e
	cmp.w	#$0050,d1				;$b27c,$0050		;ff2b30
	bcc.s	Lff2b3e					;$6408			;ff2b34
	add.l	#$000007d0,d1				;$d2bc,$0000,$07d0	;ff2b36
	bra.s	Lff2b44					;$6006			;ff2b3c
Lff2b3e:									;ff2b3e
	add.l	#$0000076c,d1				;$d2bc,$0000,$076c	;ff2b3e
Lff2b44:									;ff2b44
	move.l	d1,d2					;$2401			;ff2b44
	swap.w	d2					;$4842			;ff2b46
	bsr.s	Lff2b72					;$6128			;ff2b48
	cmp.l	#$0000000d,d1				;$b2bc,$0000,$000d	;ff2b4a
	bcc.s	Lff2b6e					;$641c			;ff2b50
	move.b	d1,d2					;$1401			;ff2b52
	beq.s	Lff2b6e					;$6718			;ff2b54
	asl.w	#8,d2					;$e142			;ff2b56
	bsr.s	Lff2b72					;$6118			;ff2b58
	cmp.l	#$00000020,d1				;$b2bc,$0000,$0020	;ff2b5a
	bcc.s	Lff2b6e					;$640c			;ff2b60
	move.b	d1,d2					;$1401			;ff2b62
	beq.s	Lff2b6e					;$6708			;ff2b64
	move.l	d2,d0					;$2002			;ff2b66
Lff2b68:									;ff2b68
	movem.l	(a7)+,d1-d2				;$4cdf,$0006		;ff2b68
	rts						;$4e75			;ff2b6c

Lff2b6e:									;ff2b6e
	moveq.l	#$ff,d0					;$70ff			;ff2b6e
	bra.s	Lff2b68					;$60f6			;ff2b70
Lff2b72:									;ff2b72
	clr.l	d1					;$4281			;ff2b72
	clr.l	d0					;$4280			;ff2b74
	move.b	(a1)+,d0				;$1019			;ff2b76
	beq.s	Lff2b9a					;$6720			;ff2b78
	cmp.b	#$20,d0					;$b03c,$0020		;ff2b7a
	beq.s	Lff2b72					;$67f2			;ff2b7e
Lff2b80:									;ff2b80
	cmp.b	#$30,d0					;$b03c,$0030		;ff2b80
	bcs.s	Lff2b9c					;$6516			;ff2b84
	cmp.b	#$3a,d0					;$b03c,$003a		;ff2b86
	bcc.s	Lff2b9c					;$6410			;ff2b8a
	sub.b	#$30,d0					;$903c,$0030		;ff2b8c
	mulu.w	#$000a,d1				;$c2fc,$000a		;ff2b90
	add.w	d0,d1					;$d240			;ff2b94
	move.b	(a1)+,d0				;$1019			;ff2b96
	bne.s	Lff2b80					;$66e6			;ff2b98
Lff2b9a:									;ff2b9a
	subq.l	#1,a0					;$5388			;ff2b9a
Lff2b9c:									;ff2b9c
	rts						;$4e75			;ff2b9c

Call_TIMECNV:									;ff2b9e
	movem.l	d1-d2,-(a7)				;$48e7,$6000		;ff2b9e
	bsr.s	Lff2b72					;$61ce			;ff2ba2
	cmp.l	#$00000018,d1				;$b2bc,$0000,$0018	;ff2ba4
	bcc.s	Lff2b6e					;$64c2			;ff2baa
	move.l	d1,d2					;$2401			;ff2bac
	swap.w	d2					;$4842			;ff2bae
	bsr.s	Lff2b72					;$61c0			;ff2bb0
	cmp.l	#$0000003c,d1				;$b2bc,$0000,$003c	;ff2bb2
	bcc.s	Lff2b6e					;$64b4			;ff2bb8
	move.b	d1,d2					;$1401			;ff2bba
	asl.w	#8,d2					;$e142			;ff2bbc
	bsr.s	Lff2b72					;$61b2			;ff2bbe
	cmp.l	#$0000003c,d1				;$b2bc,$0000,$003c	;ff2bc0
	bcc.s	Lff2b6e					;$64a6			;ff2bc6
	move.b	d1,d2					;$1401			;ff2bc8
	move.l	d2,d0					;$2002			;ff2bca
	bra.s	Lff2b68					;$609a			;ff2bcc
Call_DATEASC:									;ff2bce
	movem.l	d1-d3,-(a7)				;$48e7,$7000		;ff2bce
	move.l	d1,d2					;$2401			;ff2bd2
	swap.w	d2					;$4842			;ff2bd4
	and.l	#$00000fff,d2				;$c4bc,$0000,$0fff	;ff2bd6
	cmp.w	#$0820,d2				;$b47c,$0820		;ff2bdc
	bcc.s	Lff2c48					;$6466			;ff2be0
	cmp.w	#$07bc,d2				;$b47c,$07bc		;ff2be2
	bcs.s	Lff2c48					;$6560			;ff2be6
	clr.l	d3					;$4283			;ff2be8
	move.w	d1,d3					;$3601			;ff2bea
	lsr.w	#8,d3					;$e04b			;ff2bec
	tst.b	d3					;$4a03			;ff2bee
	beq.s	Lff2c48					;$6756			;ff2bf0
	cmp.b	#$0d,d3					;$b63c,$000d		;ff2bf2
	bcc.s	Lff2c48					;$6450			;ff2bf6
	tst.b	d1					;$4a01			;ff2bf8
	beq.s	Lff2c48					;$674c			;ff2bfa
	cmp.b	#$20,d1					;$b23c,$0020		;ff2bfc
	bcc.s	Lff2c48					;$6446			;ff2c00
	btst.l	#$1d,d1					;$0801,$001d		;ff2c02
	beq.s	Lff2c0e					;$6706			;ff2c06
	divu.w	#$0064,d2				;$84fc,$0064		;ff2c08
	bra.s	Lff2c26					;$6018			;ff2c0c
Lff2c0e:									;ff2c0e
	divu.w	#$03e8,d2				;$84fc,$03e8		;ff2c0e
	add.b	#$30,d2					;$d43c,$0030		;ff2c12
	move.b	d2,(a1)+				;$12c2			;ff2c16
	clr.w	d2					;$4242			;ff2c18
	swap.w	d2					;$4842			;ff2c1a
	divu.w	#$0064,d2				;$84fc,$0064		;ff2c1c
	add.b	#$30,d2					;$d43c,$0030		;ff2c20
	move.b	d2,(a1)+				;$12c2			;ff2c24
Lff2c26:									;ff2c26
	clr.w	d2					;$4242			;ff2c26
	swap.w	d2					;$4842			;ff2c28
	bsr.s	Lff2c50					;$6124			;ff2c2a
	bsr.s	Lff2c64					;$6136			;ff2c2c
	move.b	d0,(a1)+				;$12c0			;ff2c2e
	move.l	d3,d2					;$2403			;ff2c30
	bsr.s	Lff2c50					;$611c			;ff2c32
	bsr.s	Lff2c64					;$612e			;ff2c34
	move.b	d0,(a1)+				;$12c0			;ff2c36
	move.w	d1,d2					;$3401			;ff2c38
	and.l	#$000000ff,d2				;$c4bc,$0000,$00ff	;ff2c3a
	bsr.s	Lff2c50					;$610e			;ff2c40
	clr.b	(a1)					;$4211			;ff2c42
	clr.l	d0					;$4280			;ff2c44
	bra.s	Lff2c4a					;$6002			;ff2c46
Lff2c48:									;ff2c48
	moveq.l	#$ff,d0					;$70ff			;ff2c48
Lff2c4a:									;ff2c4a
	movem.l	(a7)+,d1-d3				;$4cdf,$000e		;ff2c4a
	rts						;$4e75			;ff2c4e

Lff2c50:									;ff2c50
	divu.w	#$000a,d2				;$84fc,$000a		;ff2c50
	add.b	#$30,d2					;$d43c,$0030		;ff2c54
	move.b	d2,(a1)+				;$12c2			;ff2c58
	swap.w	d2					;$4842			;ff2c5a
	add.b	#$30,d2					;$d43c,$0030		;ff2c5c
	move.b	d2,(a1)+				;$12c2			;ff2c60
	rts						;$4e75			;ff2c62

Lff2c64:									;ff2c64
	btst.l	#$1c,d1					;$0801,$001c		;ff2c64
	beq.s	Lff2c70					;$6706			;ff2c68
	move.b	#$2d,d0					;$103c,$002d		;ff2c6a
	rts						;$4e75			;ff2c6e

Lff2c70:									;ff2c70
	move.b	#$2f,d0					;$103c,$002f		;ff2c70
	rts						;$4e75			;ff2c74

Call_TIMEASC:									;ff2c76
	movem.l	d1-d3,-(a7)				;$48e7,$7000		;ff2c76
	move.l	d1,d2					;$2401			;ff2c7a
	clr.w	d2					;$4242			;ff2c7c
	swap.w	d2					;$4842			;ff2c7e
	cmp.w	#$0018,d2				;$b47c,$0018		;ff2c80
	bcc.s	Lff2c48					;$64c2			;ff2c84
	clr.l	d3					;$4283			;ff2c86
	move.w	d1,d3					;$3601			;ff2c88
	lsr.w	#8,d3					;$e04b			;ff2c8a
	cmp.b	#$3c,d3					;$b63c,$003c		;ff2c8c
	bcc.s	Lff2c48					;$64b6			;ff2c90
	cmp.b	#$3c,d1					;$b23c,$003c		;ff2c92
	bcc.s	Lff2c48					;$64b0			;ff2c96
	movea.l	a1,a0					;$2049			;ff2c98
	bsr.s	Lff2c50					;$61b4			;ff2c9a
	cmpi.b	#$30,(a0)				;$0c10,$0030		;ff2c9c
	bne.s	Lff2ca6					;$6604			;ff2ca0
	move.b	#$20,(a0)				;$10bc,$0020		;ff2ca2
Lff2ca6:									;ff2ca6
	move.b	#$3a,(a1)+				;$12fc,$003a		;ff2ca6
	move.l	d3,d2					;$2403			;ff2caa
	bsr.s	Lff2c50					;$61a2			;ff2cac
	move.b	#$3a,(a1)+				;$12fc,$003a		;ff2cae
	move.w	d1,d2					;$3401			;ff2cb2
	and.l	#$000000ff,d2				;$c4bc,$0000,$00ff	;ff2cb4
	bsr.s	Lff2c50					;$6194			;ff2cba
	clr.b	(a1)					;$4211			;ff2cbc
	clr.l	d0					;$4280			;ff2cbe
	bra.s	Lff2c4a					;$6088			;ff2cc0
Call_DAYASC:									;ff2cc2
	move.b	d1,d0					;$1001			;ff2cc2
	and.w	#$0007,d0				;$c07c,$0007		;ff2cc4
	add.w	d0,d0					;$d040			;ff2cc8
	lea.l	(Lff2cdc,pc),a0				;$41fa,$0010		;ff2cca
	move.b	(a0,d0.w),(a1)+				;$12f0,$0000		;ff2cce
	move.b	($01,a0,d0.w),(a1)+			;$12f0,$0001		;ff2cd2
	clr.b	(a1)					;$4211			;ff2cd6
	clr.l	d0					;$4280			;ff2cd8
	rts						;$4e75			;ff2cda

Lff2cdc:									;ff2cdc
	.dc.b	'日月火水木金土？'						;ff2cdc
Call_ALARMMOD:									;ff2cec
	clr.l	d0					;$4280			;ff2cec
Lff2cee:									;ff2cee
	cmp.b	#$02,d1					;$b23c,$0002		;ff2cee
	bcc.s	$00ff2d1c				;$6428			;ff2cf2
	lea.l	($00e8a000),a0				;$41f9,$00e8,$a000	;ff2cf4
	tst.b	d1					;$4a01			;ff2cfa
	bne.s	$00ff2d02				;$6604			;ff2cfc
	move.b	#$07,d0					;$103c,$0007		;ff2cfe
	bsr.w	Lff2dfa					;$6100,$00f6		;ff2d02
	move.b	#$31,($00e8e00d)			;$13fc,$0031,$00e8,$e00d	;ff2d06
	move.b	d0,($00ed0026)				;$13c0,$00ed,$0026	;ff2d0e
	move.b	#$00,($00e8e00d)			;$13fc,$0000,$00e8,$e00d	;ff2d14
	move.b	($00ed0026),d0				;$1039,$00ed,$0026	;ff2d1c
	and.l	#$00000001,d0				;$c0bc,$0000,$0001	;ff2d22
	eori.b	#$01,d0					;$0a00,$0001		;ff2d28
	rts						;$4e75			;ff2d2c

Call_ALARMSET:									;ff2d2e
	move.b	#$31,($00e8e00d)			;$13fc,$0031,$00e8,$e00d	;ff2d2e
	move.l	a1,($00ed001e)				;$23c9,$00ed,$001e	;ff2d36
	move.l	d1,($00ed0022)				;$23c1,$00ed,$0022	;ff2d3c
	subq.l	#1,d2					;$5382			;ff2d42
	move.l	d2,($00ed0014)				;$23c2,$00ed,$0014	;ff2d44
	addq.l	#1,d2					;$5282			;ff2d4a
	clr.b	($00ed0026)				;$4239,$00ed,$0026	;ff2d4c
	move.b	#$00,($00e8e00d)			;$13fc,$0000,$00e8,$e00d	;ff2d52
	lea.l	($00e8a000),a0				;$41f9,$00e8,$a000	;ff2d5a
	move.b	#$09,($001b,a0)				;$117c,$0009,$001b	;ff2d60
	tst.b	($00e9a001)				;$4a39,$00e9,$a001	;ff2d66
	tst.b	($00e9a001)				;$4a39,$00e9,$a001	;ff2d6c
	move.b	#$05,($001f,a0)				;$117c,$0005,$001f	;ff2d72
	moveq.l	#$03,d0					;$7003			;ff2d78
	bsr.w	Lff0d12					;$6100,$df96		;ff2d7a
	moveq.l	#$0f,d2					;$740f			;ff2d7e
	move.b	d1,d0					;$1001			;ff2d80
	and.b	d2,d0					;$c002			;ff2d82
	cmp.b	d2,d0					;$b002			;ff2d84
	beq.s	Lff2d8c					;$6704			;ff2d86
	move.b	d0,($0005,a0)				;$1140,$0005		;ff2d88
Lff2d8c:									;ff2d8c
	ror.l	#4,d1					;$e899			;ff2d8c
	move.b	d1,d0					;$1001			;ff2d8e
	and.b	d2,d0					;$c002			;ff2d90
	cmp.b	d2,d0					;$b002			;ff2d92
	beq.s	Lff2d9a					;$6704			;ff2d94
	move.b	d0,($0007,a0)				;$1140,$0007		;ff2d96
Lff2d9a:									;ff2d9a
	ror.l	#4,d1					;$e899			;ff2d9a
	move.b	d1,d0					;$1001			;ff2d9c
	and.b	d2,d0					;$c002			;ff2d9e
	cmp.b	d2,d0					;$b002			;ff2da0
	beq.s	Lff2da8					;$6704			;ff2da2
	move.b	d0,($0009,a0)				;$1140,$0009		;ff2da4
Lff2da8:									;ff2da8
	ror.l	#4,d1					;$e899			;ff2da8
	move.b	d1,d0					;$1001			;ff2daa
	and.b	d2,d0					;$c002			;ff2dac
	cmp.b	d2,d0					;$b002			;ff2dae
	beq.s	Lff2db6					;$6704			;ff2db0
	move.b	d0,($000b,a0)				;$1140,$000b		;ff2db2
Lff2db6:									;ff2db6
	ror.l	#4,d1					;$e899			;ff2db6
	move.b	d1,d0					;$1001			;ff2db8
	and.b	d2,d0					;$c002			;ff2dba
	cmp.b	d2,d0					;$b002			;ff2dbc
	beq.s	Lff2dc4					;$6704			;ff2dbe
	move.b	d0,($000f,a0)				;$1140,$000f		;ff2dc0
Lff2dc4:									;ff2dc4
	ror.l	#4,d1					;$e899			;ff2dc4
	move.b	d1,d0					;$1001			;ff2dc6
	and.b	d2,d0					;$c002			;ff2dc8
	cmp.b	d2,d0					;$b002			;ff2dca
	beq.s	Lff2dd2					;$6704			;ff2dcc
	move.b	d0,($0011,a0)				;$1140,$0011		;ff2dce
Lff2dd2:									;ff2dd2
	ror.l	#4,d1					;$e899			;ff2dd2
	move.b	d1,d0					;$1001			;ff2dd4
	and.b	d2,d0					;$c002			;ff2dd6
	cmp.b	d2,d0					;$b002			;ff2dd8
	beq.s	Lff2de0					;$6704			;ff2dda
	move.b	d0,($000d,a0)				;$1140,$000d		;ff2ddc
Lff2de0:									;ff2de0
	move.b	#$00,($0001,a0)				;$117c,$0000,$0001	;ff2de0
	tst.b	($00e9a001)				;$4a39,$00e9,$a001	;ff2de6
	tst.b	($00e9a001)				;$4a39,$00e9,$a001	;ff2dec
	move.b	#$08,($001b,a0)				;$117c,$0008,$001b	;ff2df2
	clr.l	d0					;$4280			;ff2df8
Lff2dfa:									;ff2dfa
	movem.l	d1,-(a7)				;$48e7,$4000		;ff2dfa
	move.b	($001b,a0),d1				;$1228,$001b		;ff2dfe
	bset.l	#$00,d1					;$08c1,$0000		;ff2e02
	tst.b	($00e9a001)				;$4a39,$00e9,$a001	;ff2e06
	tst.b	($00e9a001)				;$4a39,$00e9,$a001	;ff2e0c
	move.b	d1,($001b,a0)				;$1141,$001b		;ff2e12
	tst.b	($00e9a001)				;$4a39,$00e9,$a001	;ff2e16
	tst.b	($00e9a001)				;$4a39,$00e9,$a001	;ff2e1c
	tst.b	d0					;$4a00			;ff2e22
	beq.s	Lff2e2a					;$6704			;ff2e24
	move.b	#$07,d0					;$103c,$0007		;ff2e26
Lff2e2a:									;ff2e2a
	move.b	d0,($0001,a0)				;$1140,$0001		;ff2e2a
	tst.b	($00e9a001)				;$4a39,$00e9,$a001	;ff2e2e
	tst.b	($00e9a001)				;$4a39,$00e9,$a001	;ff2e34
	bclr.l	#$00,d1					;$0881,$0000		;ff2e3a
	move.b	d1,($001b,a0)				;$1141,$001b		;ff2e3e
	movem.l	(a7)+,d1				;$4cdf,$0002		;ff2e42
	rts						;$4e75			;ff2e46

Call_ALARMGET:									;ff2e48
	move.l	($00ed001e),d0				;$2039,$00ed,$001e	;ff2e48
	move.l	($00ed0022),d1				;$2239,$00ed,$0022	;ff2e4e
	move.l	($00ed0014),d2				;$2439,$00ed,$0014	;ff2e54
	addq.l	#1,d2					;$5282			;ff2e5a
	rts						;$4e75			;ff2e5c

Lff2e5e:									;ff2e5e
	bclr.l	#$1f,d0					;$0880,$001f		;ff2e5e
	rts						;$4e75			;ff2e62

Lff2e64:									;ff2e64
	movem.l	d2-d3,-(a7)				;$48e7,$3000		;ff2e64
Lff2e68:									;ff2e68
	bsr.s	Lff2e70					;$6106			;ff2e68
	movem.l	(a7)+,d2-d3				;$4cdf,$000c		;ff2e6a
	rts						;$4e75			;ff2e6e

Lff2e70:									;ff2e70
	move.w	d1,d2					;$3401			;ff2e70
	and.w	#$07ff,d2				;$c47c,$07ff		;ff2e72
	sub.w	#$03ff,d2				;$947c,$03ff		;ff2e76
	bcs.s	Lff2eb4					;$6538			;ff2e7a
	cmp.w	#$0034,d2				;$b47c,$0034		;ff2e7c
	bcc.s	Lff2eb8					;$6436			;ff2e80
	move.l	#$80000000.l,d3				;$263c,$8000,$0000	;ff2e82
	cmp.w	#$0020,d2				;$b47c,$0020		;ff2e88
	bcc.s	Lff2e9e					;$6410			;ff2e8c
	and.l	#$000007ff,d1				;$c2bc,$0000,$07ff	;ff2e8e
	lsr.l	d2,d3					;$e4ab			;ff2e94
	subq.l	#1,d3					;$5383			;ff2e96
	not.l	d3					;$4683			;ff2e98
	and.l	d3,d0					;$c083			;ff2e9a
	rts						;$4e75			;ff2e9c

Lff2e9e:									;ff2e9e
	move.w	d1,-(a7)				;$3f01			;ff2e9e
	andi.w	#$07ff,(a7)				;$0257,$07ff		;ff2ea0
	sub.w	#$0020,d2				;$947c,$0020		;ff2ea4
	lsr.l	d2,d3					;$e4ab			;ff2ea8
	subq.l	#1,d3					;$5383			;ff2eaa
	not.l	d3					;$4683			;ff2eac
	and.l	d3,d1					;$c283			;ff2eae
	or.w	(a7)+,d1				;$825f			;ff2eb0
	rts						;$4e75			;ff2eb2

Lff2eb4:									;ff2eb4
	clr.l	d0					;$4280			;ff2eb4
	clr.l	d1					;$4281			;ff2eb6
Lff2eb8:									;ff2eb8
	rts						;$4e75			;ff2eb8

Lff2eba:									;ff2eba
	movem.l	d2-d3,-(a7)				;$48e7,$3000		;ff2eba
	tst.l	d0					;$4a80			;ff2ebe
	bpl.s	Lff2e68					;$6aa6			;ff2ec0
	move.w	d1,d2					;$3401			;ff2ec2
	and.w	#$07ff,d2				;$c47c,$07ff		;ff2ec4
	cmp.w	#$0433,d2				;$b47c,$0433		;ff2ec8
	bcc.s	Lff2edc					;$640e			;ff2ecc
	bsr.s	Lff2e70					;$61a0			;ff2ece
	moveq.l	#$00,d2					;$7400			;ff2ed0
	move.l	#$000003ff,d3				;$263c,$0000,$03ff	;ff2ed2
	bsr.w	Lff31f4					;$6100,$031a		;ff2ed8
Lff2edc:									;ff2edc
	movem.l	(a7)+,d2-d3				;$4cdf,$000c		;ff2edc
	rts						;$4e75			;ff2ee0

Lff2ee2:									;ff2ee2
	movem.l	d2-d3,-(a7)				;$48e7,$3000		;ff2ee2
	tst.l	d0					;$4a80			;ff2ee6
	bmi.w	Lff2e68					;$6b00,$ff7e		;ff2ee8
	move.w	d1,d2					;$3401			;ff2eec
	and.w	#$07ff,d2				;$c47c,$07ff		;ff2eee
	cmp.w	#$0433,d2				;$b47c,$0433		;ff2ef2
	bcc.s	Lff2f08					;$6410			;ff2ef6
	bsr.w	Lff2e70					;$6100,$ff76		;ff2ef8
	moveq.l	#$00,d2					;$7400			;ff2efc
	move.l	#$000003ff,d3				;$263c,$0000,$03ff	;ff2efe
	bsr.w	Lff3146					;$6100,$0240		;ff2f04
Lff2f08:									;ff2f08
	movem.l	(a7)+,d2-d3				;$4cdf,$000c		;ff2f08
	rts						;$4e75			;ff2f0c

Lff2f0e:									;ff2f0e
	movem.l	d2-d3,-(a7)				;$48e7,$3000		;ff2f0e
	move.w	d1,d2					;$3401			;ff2f12
	and.w	#$07ff,d2				;$c47c,$07ff		;ff2f14
	cmp.w	#$03ff,d2				;$b47c,$03ff		;ff2f18
	bcs.s	Lff2f4c					;$652e			;ff2f1c
	cmp.w	#$0433,d2				;$b47c,$0433		;ff2f1e
	bcc.s	Lff2f52					;$642e			;ff2f22
	move.l	d0,d3					;$2600			;ff2f24
	and.w	#$f800,d1				;$c27c,$f800		;ff2f26
Lff2f2a:									;ff2f2a
	lsl.l	#1,d1					;$e389			;ff2f2a
	roxl.l	#1,d0					;$e390			;ff2f2c
	subq.w	#1,d2					;$5342			;ff2f2e
	cmp.w	#$03ff,d2				;$b47c,$03ff		;ff2f30
	bcc.s	Lff2f2a					;$64f4			;ff2f34
	tst.l	d0					;$4a80			;ff2f36
	bmi.s	Lff2f42					;$6b08			;ff2f38
	bne.s	Lff2f2a					;$66ee			;ff2f3a
	tst.l	d1					;$4a81			;ff2f3c
	bne.s	Lff2f2a					;$66ea			;ff2f3e
	bra.s	Lff2f52					;$6010			;ff2f40
Lff2f42:									;ff2f42
	tst.l	d3					;$4a83			;ff2f42
	bmi.s	Lff2f4a					;$6b04			;ff2f44
	bclr.l	#$1f,d0					;$0880,$001f		;ff2f46
Lff2f4a:									;ff2f4a
	or.w	d2,d1					;$8242			;ff2f4a
Lff2f4c:									;ff2f4c
	movem.l	(a7)+,d2-d3				;$4cdf,$000c		;ff2f4c
	rts						;$4e75			;ff2f50

Lff2f52:									;ff2f52
	clr.l	d0					;$4280			;ff2f52
	clr.l	d1					;$4281			;ff2f54
	movem.l	(a7)+,d2-d3				;$4cdf,$000c		;ff2f56
	rts						;$4e75			;ff2f5a

Lff2f5c:									;ff2f5c
	tst.l	d0					;$4a80			;ff2f5c
	beq.s	Lff2f84					;$6724			;ff2f5e
	move.l	d0,-(a7)				;$2f00			;ff2f60
	andi.l	#$80000000,(a7)				;$0297,$8000,$0000	;ff2f62
	move.l	#$0000041e,d1				;$223c,$0000,$041e	;ff2f68
	tst.l	d0					;$4a80			;ff2f6e
	bpl.s	Lff2f74					;$6a02			;ff2f70
	neg.l	d0					;$4480			;ff2f72
Lff2f74:									;ff2f74
	bmi.s	Lff2f7c					;$6b06			;ff2f74
	subq.w	#1,d1					;$5341			;ff2f76
	lsl.l	#1,d0					;$e388			;ff2f78
	bra.s	Lff2f74					;$60f8			;ff2f7a
Lff2f7c:									;ff2f7c
	bclr.l	#$1f,d0					;$0880,$001f		;ff2f7c
	or.l	(a7)+,d0				;$809f			;ff2f80
	rts						;$4e75			;ff2f82

Lff2f84:									;ff2f84
	clr.l	d1					;$4281			;ff2f84
	rts						;$4e75			;ff2f86

Lff2f88:									;ff2f88
	move.l	d1,-(a7)				;$2f01			;ff2f88
	and.w	#$07ff,d1				;$c27c,$07ff		;ff2f8a
	sub.w	#$03ff,d1				;$927c,$03ff		;ff2f8e
	bcs.s	Lff2fb8					;$6524			;ff2f92
	cmp.w	#$001f,d1				;$b27c,$001f		;ff2f94
	bcc.s	Lff2fc2					;$6428			;ff2f98
	movem.l	d0/d2,-(a7)				;$48e7,$a000		;ff2f9a
	move.l	d0,d2					;$2400			;ff2f9e
	bset.l	#$1f,d2					;$08c2,$001f		;ff2fa0
	clr.l	d0					;$4280			;ff2fa4
Lff2fa6:									;ff2fa6
	lsl.l	#1,d2					;$e38a			;ff2fa6
	roxl.l	#1,d0					;$e390			;ff2fa8
	dbra.w	d1,Lff2fa6				;$51c9,$fffa		;ff2faa
	tst.l	(a7)+					;$4a9f			;ff2fae
	bpl.s	Lff2fb4					;$6a02			;ff2fb0
	neg.l	d0					;$4480			;ff2fb2
Lff2fb4:									;ff2fb4
	move.l	(a7)+,d2				;$241f			;ff2fb4
	bra.s	Lff2fba					;$6002			;ff2fb6
Lff2fb8:									;ff2fb8
	clr.l	d0					;$4280			;ff2fb8
Lff2fba:									;ff2fba
	move.l	(a7)+,d1				;$221f			;ff2fba
	andi.b	#$fe,ccr				;$023c,$00fe		;ff2fbc
	rts						;$4e75			;ff2fc0

Lff2fc2:									;ff2fc2
	bne.s	Lff2fd0					;$660c			;ff2fc2
	tst.l	d0					;$4a80			;ff2fc4
	bpl.s	Lff2fd0					;$6a08			;ff2fc6
	cmp.l	#$80000000,d0				;$b0bc,$8000,$0000	;ff2fc8
	beq.s	Lff2fba					;$67ea			;ff2fce
Lff2fd0:									;ff2fd0
	move.l	(a7)+,d1				;$221f			;ff2fd0
	ori.b	#$01,ccr				;$003c,$0001		;ff2fd2
	rts						;$4e75			;ff2fd6

Lff2fd8:									;ff2fd8
	movem.l	d1-d2/d7,-(a7)				;$48e7,$6100		;ff2fd8
	move.l	d0,d7					;$2e00			;ff2fdc
	beq.s	Lff301c					;$673c			;ff2fde
	bpl.s	Lff2fe4					;$6a02			;ff2fe0
	neg.l	d0					;$4480			;ff2fe2
Lff2fe4:									;ff2fe4
	eor.l	d1,d7					;$b387			;ff2fe4
	tst.l	d1					;$4a81			;ff2fe6
	beq.s	Lff301c					;$6732			;ff2fe8
	bpl.s	Lff2fee					;$6a02			;ff2fea
	neg.l	d1					;$4481			;ff2fec
Lff2fee:									;ff2fee
	bsr.s	Lff3032					;$6142			;ff2fee
	tst.l	d0					;$4a80			;ff2ff0
	bne.s	Lff3012					;$661e			;ff2ff2
	move.l	d1,d0					;$2001			;ff2ff4
	tst.l	d7					;$4a87			;ff2ff6
	bpl.s	Lff300e					;$6a14			;ff2ff8
	cmp.l	#$80000000,d0				;$b0bc,$8000,$0000	;ff2ffa
	bhi.s	Lff3012					;$6210			;ff3000
	neg.l	d0					;$4480			;ff3002
	andi.b	#$fe,ccr				;$023c,$00fe		;ff3004
Lff3008:									;ff3008
	movem.l	(a7)+,d1-d2/d7				;$4cdf,$0086		;ff3008
	rts						;$4e75			;ff300c

Lff300e:									;ff300e
	tst.l	d0					;$4a80			;ff300e
	bpl.s	Lff3008					;$6af6			;ff3010
Lff3012:									;ff3012
	movem.l	(a7)+,d1-d2/d7				;$4cdf,$0086		;ff3012
	ori.b	#$01,ccr				;$003c,$0001		;ff3016
	rts						;$4e75			;ff301a

Lff301c:									;ff301c
	clr.l	d0					;$4280			;ff301c
	movem.l	(a7)+,d1-d2/d7				;$4cdf,$0086		;ff301e
	rts						;$4e75			;ff3022

Lff3024:									;ff3024
	movem.l	d1-d2/d7,-(a7)				;$48e7,$6100		;ff3024
	bsr.s	Lff3032					;$6108			;ff3028
	tst.l	d0					;$4a80			;ff302a
	bne.s	Lff3012					;$66e4			;ff302c
	move.l	d1,d0					;$2001			;ff302e
	bra.s	Lff3008					;$60d6			;ff3030
Lff3032:									;ff3032
	move.w	d1,d2					;$3401			;ff3032
	mulu.w	d0,d2					;$c4c0			;ff3034
	move.l	d2,-(a7)				;$2f02			;ff3036
	clr.l	-(a7)					;$42a7			;ff3038
	move.l	d0,d2					;$2400			;ff303a
	swap.w	d2					;$4842			;ff303c
	mulu.w	d1,d2					;$c4c1			;ff303e
	add.l	d2,($0002,a7)				;$d5af,$0002		;ff3040
	bcc.s	Lff3048					;$6402			;ff3044
	addq.w	#1,(a7)					;$5257			;ff3046
Lff3048:									;ff3048
	move.l	d1,d2					;$2401			;ff3048
	swap.w	d2					;$4842			;ff304a
	mulu.w	d0,d2					;$c4c0			;ff304c
	add.l	d2,($0002,a7)				;$d5af,$0002		;ff304e
	bcc.s	Lff3056					;$6402			;ff3052
	addq.w	#1,(a7)					;$5257			;ff3054
Lff3056:									;ff3056
	swap.w	d0					;$4840			;ff3056
	swap.w	d1					;$4841			;ff3058
	mulu.w	d1,d0					;$c0c1			;ff305a
	add.l	(a7)+,d0				;$d09f			;ff305c
	move.l	(a7)+,d1				;$221f			;ff305e
	rts						;$4e75			;ff3060

Lff3062:									;ff3062
	movem.l	d1-d3/d7,-(a7)				;$48e7,$7100		;ff3062
	move.l	d0,d7					;$2e00			;ff3066
	beq.s	Lff3084					;$671a			;ff3068
	bpl.s	Lff306e					;$6a02			;ff306a
	neg.l	d0					;$4480			;ff306c
Lff306e:									;ff306e
	eor.l	d1,d7					;$b387			;ff306e
	tst.l	d1					;$4a81			;ff3070
	beq.s	Lff308a					;$6716			;ff3072
	bpl.s	Lff3078					;$6a02			;ff3074
	neg.l	d1					;$4481			;ff3076
Lff3078:									;ff3078
	bsr.s	Lff30ac					;$6132			;ff3078
	tst.l	d7					;$4a87			;ff307a
	bpl.s	Lff3084					;$6a06			;ff307c
	neg.l	d0					;$4480			;ff307e
	andi.b	#$fe,ccr				;$023c,$00fe		;ff3080
Lff3084:									;ff3084
	movem.l	(a7)+,d1-d3/d7				;$4cdf,$008e		;ff3084
	rts						;$4e75			;ff3088

Lff308a:									;ff308a
	movem.l	(a7)+,d1-d3/d7				;$4cdf,$008e		;ff308a
	ori.b	#$01,ccr				;$003c,$0001		;ff308e
	rts						;$4e75			;ff3092

Lff3094:									;ff3094
	movem.l	d1-d3/d7,-(a7)				;$48e7,$7100		;ff3094
	tst.l	d0					;$4a80			;ff3098
	beq.s	Lff30a6					;$670a			;ff309a
	tst.l	d1					;$4a81			;ff309c
	beq.s	Lff308a					;$67ea			;ff309e
	bsr.s	Lff30ac					;$610a			;ff30a0
	andi.b	#$fe,ccr				;$023c,$00fe		;ff30a2
Lff30a6:									;ff30a6
	movem.l	(a7)+,d1-d3/d7				;$4cdf,$008e		;ff30a6
	rts						;$4e75			;ff30aa

Lff30ac:									;ff30ac
	clr.l	d2					;$4282			;ff30ac
	moveq.l	#$1f,d3					;$761f			;ff30ae
Lff30b0:									;ff30b0
	lsl.l	#1,d0					;$e388			;ff30b0
	roxl.l	#1,d2					;$e392			;ff30b2
	cmp.l	d1,d2					;$b481			;ff30b4
	bcs.s	Lff30be					;$6506			;ff30b6
	bset.l	#$00,d0					;$08c0,$0000		;ff30b8
	sub.l	d1,d2					;$9481			;ff30bc
Lff30be:									;ff30be
	dbra.w	d3,Lff30b0				;$51cb,$fff0		;ff30be
	rts						;$4e75			;ff30c2

Lff30c4:									;ff30c4
	tst.l	d1					;$4a81			;ff30c4
	bne.s	Lff30d0					;$6608			;ff30c6
	move.l	d0,-(a7)				;$2f00			;ff30c8
	andi.l	#$7fffffff,(a7)+			;$029f,$7fff,$ffff	;ff30ca
Lff30d0:									;ff30d0
	rts						;$4e75			;ff30d0

Lff30d2:									;ff30d2
	move.l	d0,-(a7)				;$2f00			;ff30d2
	eor.l	d2,(a7)+				;$b59f			;ff30d4
	bmi.s	Lff30e6					;$6b0e			;ff30d6
	tst.l	d0					;$4a80			;ff30d8
	bpl.s	Lff30f2					;$6a16			;ff30da
	bsr.s	Lff30f2					;$6114			;ff30dc
	beq.s	Lff3130					;$6750			;ff30de
	eori.b	#$01,ccr				;$0a3c,$0001		;ff30e0
	rts						;$4e75			;ff30e4

Lff30e6:									;ff30e6
	move.l	d0,-(a7)				;$2f00			;ff30e6
	lsl.w	(a7)					;$e3d7			;ff30e8
	addq.l	#4,a7					;$588f			;ff30ea
	andi.b	#$fb,ccr				;$023c,$00fb		;ff30ec
	rts						;$4e75			;ff30f0

Lff30f2:									;ff30f2
	movem.l	d4-d5,-(a7)				;$48e7,$0c00		;ff30f2
	move.w	d1,d4					;$3801			;ff30f6
	and.w	#$07ff,d4				;$c87c,$07ff		;ff30f8
	move.w	d3,d5					;$3a03			;ff30fc
	and.w	#$07ff,d5				;$ca7c,$07ff		;ff30fe
	cmp.w	d5,d4					;$b845			;ff3102
	bne.s	Lff312c					;$6626			;ff3104
	move.l	d0,d4					;$2800			;ff3106
	and.l	#$7fffffff,d4				;$c8bc,$7fff,$ffff	;ff3108
	move.l	d2,d5					;$2a02			;ff310e
	and.l	#$7fffffff,d5				;$cabc,$7fff,$ffff	;ff3110
	cmp.l	d5,d4					;$b885			;ff3116
	bne.s	Lff312c					;$6612			;ff3118
	move.l	d1,d4					;$2801			;ff311a
	and.l	#$fffff800,d4				;$c8bc,$ffff,$f800	;ff311c
	move.l	d3,d5					;$2a03			;ff3122
	and.l	#$fffff800,d5				;$cabc,$ffff,$f800	;ff3124
	cmp.l	d5,d4					;$b885			;ff312a
Lff312c:									;ff312c
	movem.l	(a7)+,d4-d5				;$4cdf,$0030		;ff312c
Lff3130:									;ff3130
	rts						;$4e75			;ff3130

Lff3132:									;ff3132
	move.l	d0,-(a7)				;$2f00			;ff3132
	andi.l	#$7fffffff,(a7)+			;$029f,$7fff,$ffff	;ff3134
	bne.s	Lff3140					;$6604			;ff313a
	tst.l	d1					;$4a81			;ff313c
	beq.s	Lff3144					;$6704			;ff313e
Lff3140:									;ff3140
	bchg.l	#$1f,d0					;$0840,$001f		;ff3140
Lff3144:									;ff3144
	rts						;$4e75			;ff3144

Lff3146:									;ff3146
	movem.l	d2-d7,-(a7)				;$48e7,$3f00		;ff3146
	bsr.s	Lff3154					;$6108			;ff314a
	move.w	d6,ccr					;$44c6			;ff314c
	movem.l	(a7)+,d2-d7				;$4cdf,$00fc		;ff314e
	rts						;$4e75			;ff3152

Lff3154:									;ff3154
	move.l	d0,-(a7)				;$2f00			;ff3154
	eor.l	d2,(a7)+				;$b59f			;ff3156
	bmi.s	Lff3162					;$6b08			;ff3158
	tst.l	d0					;$4a80			;ff315a
	bpl.s	Lff3170					;$6a12			;ff315c
	bsr.s	Lff3170					;$6110			;ff315e
	bra.s	Lff3132					;$60d0			;ff3160
Lff3162:									;ff3162
	tst.l	d0					;$4a80			;ff3162
	bpl.w	Lff3220					;$6a00,$00ba		;ff3164
	exg.l	d0,d2					;$c142			;ff3168
	exg.l	d1,d3					;$c343			;ff316a
	bra.w	Lff3220					;$6000,$00b2		;ff316c
Lff3170:									;ff3170
	clr.l	d6					;$4286			;ff3170
	and.l	#$7fffffff,d0				;$c0bc,$7fff,$ffff	;ff3172
	bne.s	Lff318a					;$6610			;ff3178
	tst.l	d1					;$4a81			;ff317a
	bne.s	Lff318a					;$660c			;ff317c
	move.l	d2,d0					;$2002			;ff317e
	move.l	d3,d1					;$2203			;ff3180
	and.l	#$7fffffff,d0				;$c0bc,$7fff,$ffff	;ff3182
	rts						;$4e75			;ff3188

Lff318a:									;ff318a
	and.l	#$7fffffff,d2				;$c4bc,$7fff,$ffff	;ff318a
	bne.s	Lff3196					;$6604			;ff3190
	tst.l	d3					;$4a83			;ff3192
	beq.s	Lff31f2					;$675c			;ff3194
Lff3196:									;ff3196
	move.w	d1,d4					;$3801			;ff3196
	and.w	#$07ff,d4				;$c87c,$07ff		;ff3198
	move.w	d3,d5					;$3a03			;ff319c
	and.w	#$07ff,d5				;$ca7c,$07ff		;ff319e
	cmp.w	d5,d4					;$b845			;ff31a2
	bcc.s	Lff31ac					;$6406			;ff31a4
	exg.l	d0,d2					;$c142			;ff31a6
	exg.l	d1,d3					;$c343			;ff31a8
	exg.l	d4,d5					;$c945			;ff31aa
Lff31ac:									;ff31ac
	move.w	d4,d7					;$3e04			;ff31ac
	sub.w	d5,d4					;$9845			;ff31ae
	cmp.w	#$0035,d4				;$b87c,$0035		;ff31b0
	bcc.s	Lff31f2					;$643c			;ff31b4
	bset.l	#$1f,d2					;$08c2,$001f		;ff31b6
	and.w	#$f800,d3				;$c67c,$f800		;ff31ba
	bra.s	Lff31c4					;$6004			;ff31be
Lff31c0:									;ff31c0
	lsr.l	#1,d2					;$e28a			;ff31c0
	roxr.l	#1,d3					;$e293			;ff31c2
Lff31c4:									;ff31c4
	dbra.w	d4,Lff31c0				;$51cc,$fffa		;ff31c4
	bset.l	#$1f,d0					;$08c0,$001f		;ff31c8
	and.w	#$f800,d1				;$c27c,$f800		;ff31cc
	or.w	#$0400,d1				;$827c,$0400		;ff31d0
	add.l	d3,d1					;$d283			;ff31d4
	addx.l	d2,d0					;$d182			;ff31d6
	bcc.s	Lff31e0					;$6406			;ff31d8
	roxr.l	#1,d0					;$e290			;ff31da
	roxr.l	#1,d1					;$e291			;ff31dc
	addq.w	#1,d7					;$5247			;ff31de
Lff31e0:									;ff31e0
	cmp.w	#$0800,d7				;$be7c,$0800		;ff31e0
	bcc.w	Lff32cc					;$6400,$00e6		;ff31e4
	and.w	#$f800,d1				;$c27c,$f800		;ff31e8
	or.w	d7,d1					;$8247			;ff31ec
	bclr.l	#$1f,d0					;$0880,$001f		;ff31ee
Lff31f2:									;ff31f2
	rts						;$4e75			;ff31f2

Lff31f4:									;ff31f4
	movem.l	d2-d7,-(a7)				;$48e7,$3f00		;ff31f4
	bsr.s	Lff3202					;$6108			;ff31f8
	move.w	d6,ccr					;$44c6			;ff31fa
	movem.l	(a7)+,d2-d7				;$4cdf,$00fc		;ff31fc
	rts						;$4e75			;ff3200

Lff3202:									;ff3202
	move.l	d0,-(a7)				;$2f00			;ff3202
	eor.l	d2,(a7)+				;$b59f			;ff3204
	bmi.s	Lff3212					;$6b0a			;ff3206
	tst.l	d0					;$4a80			;ff3208
	bpl.s	Lff3220					;$6a14			;ff320a
	exg.l	d0,d2					;$c142			;ff320c
	exg.l	d1,d3					;$c343			;ff320e
	bra.s	Lff3220					;$600e			;ff3210
Lff3212:									;ff3212
	tst.l	d0					;$4a80			;ff3212
	bpl.w	Lff3170					;$6a00,$ff5a		;ff3214
	bsr.w	Lff3170					;$6100,$ff56		;ff3218
	bra.w	Lff3132					;$6000,$ff14		;ff321c
Lff3220:									;ff3220
	clr.l	d6					;$4286			;ff3220
	and.l	#$7fffffff,d0				;$c0bc,$7fff,$ffff	;ff3222
	bne.s	Lff323a					;$6610			;ff3228
	tst.l	d1					;$4a81			;ff322a
	bne.s	Lff323a					;$660c			;ff322c
	move.l	d2,d0					;$2002			;ff322e
	move.l	d3,d1					;$2203			;ff3230
	bclr.l	#$1f,d0					;$0880,$001f		;ff3232
	bra.w	Lff3132					;$6000,$fefa		;ff3236
Lff323a:									;ff323a
	and.l	#$7fffffff,d2				;$c4bc,$7fff,$ffff	;ff323a
	bne.s	Lff3246					;$6604			;ff3240
	tst.l	d3					;$4a83			;ff3242
	beq.s	Lff3250					;$670a			;ff3244
Lff3246:									;ff3246
	bsr.w	Lff30d2					;$6100,$fe8a		;ff3246
	bne.s	Lff3252					;$6606			;ff324a
	clr.l	d0					;$4280			;ff324c
	clr.l	d1					;$4281			;ff324e
Lff3250:									;ff3250
	rts						;$4e75			;ff3250

Lff3252:									;ff3252
	bcc.s	Lff325e					;$640a			;ff3252
	exg.l	d0,d2					;$c142			;ff3254
	exg.l	d1,d3					;$c343			;ff3256
	bsr.s	Lff325e					;$6104			;ff3258
	bra.w	Lff3132					;$6000,$fed6		;ff325a
Lff325e:									;ff325e
	move.w	d1,d4					;$3801			;ff325e
	and.w	#$07ff,d4				;$c87c,$07ff		;ff3260
	move.w	d3,d5					;$3a03			;ff3264
	and.w	#$07ff,d5				;$ca7c,$07ff		;ff3266
	move.w	d4,d7					;$3e04			;ff326a
	sub.w	d5,d4					;$9845			;ff326c
	cmp.w	#$0035,d4				;$b87c,$0035		;ff326e
	bcc.s	Lff32c2					;$644e			;ff3272
	bset.l	#$1f,d2					;$08c2,$001f		;ff3274
	and.w	#$f800,d3				;$c67c,$f800		;ff3278
	bra.s	Lff3282					;$6004			;ff327c
Lff327e:									;ff327e
	lsr.l	#1,d2					;$e28a			;ff327e
	roxr.l	#1,d3					;$e293			;ff3280
Lff3282:									;ff3282
	dbra.w	d4,Lff327e				;$51cc,$fffa		;ff3282
	bset.l	#$1f,d0					;$08c0,$001f		;ff3286
	and.w	#$f800,d1				;$c27c,$f800		;ff328a
	sub.l	d3,d1					;$9283			;ff328e
	subx.l	d2,d0					;$9182			;ff3290
	bra.s	Lff329a					;$6006			;ff3292
Lff3294:									;ff3294
	subq.w	#1,d7					;$5347			;ff3294
	lsl.l	#1,d1					;$e389			;ff3296
	roxl.l	#1,d0					;$e390			;ff3298
Lff329a:									;ff329a
	bpl.s	Lff3294					;$6af8			;ff329a
	clr.l	d2					;$4282			;ff329c
	add.l	#$00000400,d1				;$d2bc,$0000,$0400	;ff329e
	addx.l	d2,d0					;$d182			;ff32a4
	bcc.s	Lff32ae					;$6406			;ff32a6
	roxr.l	#1,d0					;$e290			;ff32a8
	roxr.l	#1,d1					;$e291			;ff32aa
	addq.w	#1,d7					;$5247			;ff32ac
Lff32ae:									;ff32ae
	tst.w	d7					;$4a47			;ff32ae
	bmi.s	Lff32c4					;$6b12			;ff32b0
	cmp.w	#$0800,d7				;$be7c,$0800		;ff32b2
	bcc.s	Lff32cc					;$6414			;ff32b6
	and.w	#$f800,d1				;$c27c,$f800		;ff32b8
	or.w	d7,d1					;$8247			;ff32bc
	bclr.l	#$1f,d0					;$0880,$001f		;ff32be
Lff32c2:									;ff32c2
	rts						;$4e75			;ff32c2

Lff32c4:									;ff32c4
	clr.l	d0					;$4280			;ff32c4
	clr.l	d1					;$4281			;ff32c6
	moveq.l	#$01,d6					;$7c01			;ff32c8
	rts						;$4e75			;ff32ca

Lff32cc:									;ff32cc
	move.l	#$7fffffff,d0				;$203c,$7fff,$ffff	;ff32cc
	moveq.l	#$ff,d1					;$72ff			;ff32d2
	moveq.l	#$03,d6					;$7c03			;ff32d4
	rts						;$4e75			;ff32d6

Lff32d8:									;ff32d8
	movem.l	d2-d7,-(a7)				;$48e7,$3f00		;ff32d8
	bsr.s	Lff32e6					;$6108			;ff32dc
	move.w	d6,ccr					;$44c6			;ff32de
	movem.l	(a7)+,d2-d7				;$4cdf,$00fc		;ff32e0
	rts						;$4e75			;ff32e4

Lff32e6:									;ff32e6
	move.l	d0,-(a7)				;$2f00			;ff32e6
	eor.l	d2,(a7)+				;$b59f			;ff32e8
	bpl.s	Lff32f2					;$6a06			;ff32ea
	bsr.s	Lff32f2					;$6104			;ff32ec
	bra.w	Lff3132					;$6000,$fe42		;ff32ee
Lff32f2:									;ff32f2
	and.l	#$7fffffff,d0				;$c0bc,$7fff,$ffff	;ff32f2
	bne.s	Lff32fe					;$6604			;ff32f8
	tst.l	d1					;$4a81			;ff32fa
	beq.s	Lff330e					;$6710			;ff32fc
Lff32fe:									;ff32fe
	and.l	#$7fffffff,d2				;$c4bc,$7fff,$ffff	;ff32fe
	bne.s	Lff3312					;$660c			;ff3304
	tst.l	d3					;$4a83			;ff3306
	bne.s	Lff3312					;$6608			;ff3308
	clr.l	d0					;$4280			;ff330a
	clr.l	d1					;$4281			;ff330c
Lff330e:									;ff330e
	clr.l	d6					;$4286			;ff330e
	rts						;$4e75			;ff3310

Lff3312:									;ff3312
	bsr.w	Lff33b8					;$6100,$00a4		;ff3312
	add.w	d6,d7					;$de46			;ff3316
	bsr.s	Lff332c					;$6112			;ff3318
	tst.l	d4					;$4a84			;ff331a
	bmi.s	Lff3326					;$6b08			;ff331c
	lsl.l	#1,d5					;$e38d			;ff331e
	roxl.l	#1,d4					;$e394			;ff3320
	bra.w	Lff3446					;$6000,$0122		;ff3322
Lff3326:									;ff3326
	addq.w	#1,d7					;$5247			;ff3326
	bra.w	Lff3446					;$6000,$011c		;ff3328
Lff332c:									;ff332c
	movem.l	a0-a2,-(a7)				;$48e7,$00e0		;ff332c
	link.w	a6,#-$0020				;$4e56,$ffe0		;ff3330
	move.l	d0,(-$0020,a6)				;$2d40,$ffe0		;ff3334
	move.l	d1,(-$001c,a6)				;$2d41,$ffe4		;ff3338
	move.l	d2,(-$0018,a6)				;$2d42,$ffe8		;ff333c
	move.l	d3,(-$0014,a6)				;$2d43,$ffec		;ff3340
	clr.l	(-$0010,a6)				;$42ae,$fff0		;ff3344
	clr.l	(-$000c,a6)				;$42ae,$fff4		;ff3348
	clr.l	(-$0008,a6)				;$42ae,$fff8		;ff334c
	clr.l	(-$0004,a6)				;$42ae,$fffc		;ff3350
	lea.l	(-$000a,a6),a0				;$41ee,$fff6		;ff3354
	move.w	(-$0012,a6),d0				;$302e,$ffee		;ff3358
	bsr.s	Lff3380					;$6122			;ff335c
	move.w	(-$0014,a6),d0				;$302e,$ffec		;ff335e
	bsr.s	Lff3380					;$611c			;ff3362
	move.w	(-$0016,a6),d0				;$302e,$ffea		;ff3364
	bsr.s	Lff3380					;$6116			;ff3368
	move.w	(-$0018,a6),d0				;$302e,$ffe8		;ff336a
	bsr.s	Lff3380					;$6110			;ff336e
	move.l	(-$0010,a6),d4				;$282e,$fff0		;ff3370
	move.l	(-$000c,a6),d5				;$2a2e,$fff4		;ff3374
	unlk	a6					;$4e5e			;ff3378
	movem.l	(a7)+,a0-a2				;$4cdf,$0700		;ff337a
	rts						;$4e75			;ff337e

Lff3380:									;ff3380
	move.w	(-$001a,a6),d3				;$362e,$ffe6		;ff3380
	move.w	(-$001e,a6),d2				;$342e,$ffe2		;ff3384
	lea.l	($0002,a0),a1				;$43e8,$0002		;ff3388
	bsr.s	Lff339a					;$610c			;ff338c
	move.w	(-$001c,a6),d3				;$362e,$ffe4		;ff338e
	move.w	(-$0020,a6),d2				;$342e,$ffe0		;ff3392
	lea.l	(a0),a1					;$43d0			;ff3396
	subq.l	#2,a0					;$5588			;ff3398
Lff339a:									;ff339a
	mulu.w	d0,d3					;$c6c0			;ff339a
	mulu.w	d0,d2					;$c4c0			;ff339c
	move.l	($0004,a1),d5				;$2a29,$0004		;ff339e
	move.l	(a1),d4					;$2811			;ff33a2
	add.l	d3,d5					;$da83			;ff33a4
	addx.l	d2,d4					;$d982			;ff33a6
	bcc.s	Lff33b0					;$6406			;ff33a8
	movea.l	a1,a2					;$2449			;ff33aa
Lff33ac:									;ff33ac
	addq.w	#1,-(a2)				;$5262			;ff33ac
	bcs.s	Lff33ac					;$65fc			;ff33ae
Lff33b0:									;ff33b0
	move.l	d5,($0004,a1)				;$2345,$0004		;ff33b0
	move.l	d4,(a1)					;$2284			;ff33b4
	rts						;$4e75			;ff33b6

Lff33b8:									;ff33b8
	move.w	d1,d7					;$3e01			;ff33b8
	move.w	d3,d6					;$3c03			;ff33ba
	and.w	#$07ff,d7				;$ce7c,$07ff		;ff33bc
	and.w	#$07ff,d6				;$cc7c,$07ff		;ff33c0
	sub.w	#$03ff,d7				;$9e7c,$03ff		;ff33c4
	sub.w	#$03ff,d6				;$9c7c,$03ff		;ff33c8
	bset.l	#$1f,d0					;$08c0,$001f		;ff33cc
	bset.l	#$1f,d2					;$08c2,$001f		;ff33d0
	and.w	#$f800,d1				;$c27c,$f800		;ff33d4
	and.w	#$f800,d3				;$c67c,$f800		;ff33d8
	rts						;$4e75			;ff33dc

Lff33de:									;ff33de
	movem.l	d2-d7,-(a7)				;$48e7,$3f00		;ff33de
	bsr.s	Lff33ec					;$6108			;ff33e2
	move.w	d6,ccr					;$44c6			;ff33e4
	movem.l	(a7)+,d2-d7				;$4cdf,$00fc		;ff33e6
	rts						;$4e75			;ff33ea

Lff33ec:									;ff33ec
	move.l	d0,-(a7)				;$2f00			;ff33ec
	eor.l	d2,(a7)+				;$b59f			;ff33ee
	bpl.s	Lff33f8					;$6a06			;ff33f0
	bsr.s	Lff33f8					;$6104			;ff33f2
	bra.w	Lff3132					;$6000,$fd3c		;ff33f4
Lff33f8:									;ff33f8
	and.l	#$7fffffff,d2				;$c4bc,$7fff,$ffff	;ff33f8
	bne.s	Lff3404					;$6604			;ff33fe
	tst.l	d3					;$4a83			;ff3400
	beq.s	Lff347a					;$6776			;ff3402
Lff3404:									;ff3404
	and.l	#$7fffffff,d0				;$c0bc,$7fff,$ffff	;ff3404
	bne.s	Lff3414					;$6608			;ff340a
	tst.l	d1					;$4a81			;ff340c
	bne.s	Lff3414					;$6604			;ff340e
	clr.l	d6					;$4286			;ff3410
	rts						;$4e75			;ff3412

Lff3414:									;ff3414
	bsr.s	Lff33b8					;$61a2			;ff3414
	sub.w	d6,d7					;$9e46			;ff3416
	lsr.l	#1,d0					;$e288			;ff3418
	roxr.l	#1,d1					;$e291			;ff341a
	lsr.l	#1,d2					;$e28a			;ff341c
	roxr.l	#1,d3					;$e293			;ff341e
	clr.l	d4					;$4284			;ff3420
	bsr.s	Lff347e					;$615a			;ff3422
	bcc.s	Lff342c					;$6406			;ff3424
	subq.w	#1,d7					;$5347			;ff3426
	clr.l	d5					;$4285			;ff3428
	bra.s	Lff3430					;$6004			;ff342a
Lff342c:									;ff342c
	moveq.l	#$01,d5					;$7a01			;ff342c
	bsr.s	Lff3486					;$6156			;ff342e
Lff3430:									;ff3430
	lsl.l	#1,d5					;$e38d			;ff3430
	roxl.l	#1,d4					;$e394			;ff3432
	lsl.l	#1,d1					;$e389			;ff3434
	roxl.l	#1,d0					;$e390			;ff3436
	bsr.s	Lff347e					;$6144			;ff3438
	bcs.s	Lff3442					;$6506			;ff343a
	bsr.s	Lff3486					;$6148			;ff343c
	bset.l	#$00,d5					;$08c5,$0000		;ff343e
Lff3442:									;ff3442
	tst.l	d4					;$4a84			;ff3442
	bpl.s	Lff3430					;$6aea			;ff3444
Lff3446:									;ff3446
	clr.l	d6					;$4286			;ff3446
	add.l	#$00000400,d5				;$dabc,$0000,$0400	;ff3448
	bcc.s	Lff345a					;$640a			;ff344e
	addq.l	#1,d4					;$5284			;ff3450
	bcc.s	Lff345a					;$6406			;ff3452
	roxr.l	#1,d4					;$e294			;ff3454
	roxr.l	#1,d5					;$e295			;ff3456
	addq.w	#1,d7					;$5247			;ff3458
Lff345a:									;ff345a
	add.w	#$03ff,d7				;$de7c,$03ff		;ff345a
	bmi.w	Lff32c4					;$6b00,$fe64		;ff345e
	cmp.w	#$0800,d7				;$be7c,$0800		;ff3462
	bcc.w	Lff32cc					;$6400,$fe64		;ff3466
	move.l	d4,d0					;$2004			;ff346a
	move.l	d5,d1					;$2205			;ff346c
	and.w	#$f800,d1				;$c27c,$f800		;ff346e
	or.w	d7,d1					;$8247			;ff3472
	bclr.l	#$1f,d0					;$0880,$001f		;ff3474
	rts						;$4e75			;ff3478

Lff347a:									;ff347a
	moveq.l	#$05,d6					;$7c05			;ff347a
	rts						;$4e75			;ff347c

Lff347e:									;ff347e
	cmp.l	d2,d0					;$b082			;ff347e
	bne.s	Lff3484					;$6602			;ff3480
	cmp.l	d3,d1					;$b283			;ff3482
Lff3484:									;ff3484
	rts						;$4e75			;ff3484

Lff3486:									;ff3486
	sub.l	d3,d1					;$9283			;ff3486
	subx.l	d2,d0					;$9182			;ff3488
	rts						;$4e75			;ff348a

Lff348c:									;ff348c
	cmp.b	#$30,d0					;$b03c,$0030		;ff348c
	bcs.s	Lff349a					;$6508			;ff3490
	cmp.b	#$3a,d0					;$b03c,$003a		;ff3492
	eori.b	#$01,ccr				;$0a3c,$0001		;ff3496
Lff349a:									;ff349a
	rts						;$4e75			;ff349a

Lff349c:									;ff349c
	moveq.l	#$0e,d2					;$740e			;ff349c
	move.l	a0,-(a7)				;$2f08			;ff349e
	bsr.w	Lff38bc					;$6100,$041a		;ff34a0
	movea.l	(a7),a0					;$2057			;ff34a4
	bsr.s	Lff34b0					;$6108			;ff34a6
	movea.l	(a7)+,a0				;$205f			;ff34a8
	bsr.w	Lff3992					;$6100,$04e6		;ff34aa
	rts						;$4e75			;ff34ae

Lff34b0:									;ff34b0
	move.b	(a0)+,d0				;$1018			;ff34b0
	beq.s	Lff34c4					;$6710			;ff34b2
	cmp.b	#$2e,d0					;$b03c,$002e		;ff34b4
	bne.s	Lff34b0					;$66f6			;ff34b8
	move.b	(a0),d0					;$1010			;ff34ba
	bsr.s	Lff348c					;$61ce			;ff34bc
	bcc.s	Lff34c4					;$6404			;ff34be
	subq.l	#1,a0					;$5388			;ff34c0
	bsr.s	Lff34c6					;$6102			;ff34c2
Lff34c4:									;ff34c4
	rts						;$4e75			;ff34c4

Lff34c6:									;ff34c6
	move.b	($0001,a0),(a0)+			;$10e8,$0001		;ff34c6
	bne.s	Lff34c6					;$66fa			;ff34ca
	rts						;$4e75			;ff34cc

Lff34ce:									;ff34ce
	movem.l	d0-d2/d7/a1-a2,-(a7)			;$48e7,$e160		;ff34ce
	link.w	a6,#-$000a				;$4e56,$fff6		;ff34d2
	movea.l	a7,a1					;$224f			;ff34d6
	lea.l	(Lff352e,pc),a2				;$45fa,$0054		;ff34d8
	clr.w	d7					;$4247			;ff34dc
	tst.l	d0					;$4a80			;ff34de
	bpl.s	Lff34e6					;$6a04			;ff34e0
	neg.l	d0					;$4480			;ff34e2
	not.w	d7					;$4647			;ff34e4
Lff34e6:									;ff34e6
	move.l	(a2),d2					;$2412			;ff34e6
	beq.s	Lff34fc					;$6712			;ff34e8
	clr.b	d1					;$4201			;ff34ea
Lff34ec:									;ff34ec
	addq.b	#1,d1					;$5201			;ff34ec
	sub.l	d2,d0					;$9082			;ff34ee
	bcc.s	Lff34ec					;$64fa			;ff34f0
	add.l	d2,d0					;$d082			;ff34f2
	subq.b	#1,d1					;$5301			;ff34f4
	move.b	d1,(a1)+				;$12c1			;ff34f6
	addq.l	#4,a2					;$588a			;ff34f8
	bra.s	Lff34e6					;$60ea			;ff34fa
Lff34fc:									;ff34fc
	clr.b	d1					;$4201			;ff34fc
	movea.l	a7,a1					;$224f			;ff34fe
Lff3500:									;ff3500
	tst.b	(a1)					;$4a11			;ff3500
	bne.s	Lff350e					;$660a			;ff3502
	addq.l	#1,a1					;$5289			;ff3504
	addq.b	#1,d1					;$5201			;ff3506
	cmp.b	#$09,d1					;$b23c,$0009		;ff3508
	bcs.s	Lff3500					;$65f2			;ff350c
Lff350e:									;ff350e
	tst.w	d7					;$4a47			;ff350e
	beq.s	Lff3516					;$6704			;ff3510
	move.b	#$2d,(a0)+				;$10fc,$002d		;ff3512
Lff3516:									;ff3516
	move.b	(a1)+,d0				;$1019			;ff3516
	add.b	#$30,d0					;$d03c,$0030		;ff3518
	move.b	d0,(a0)+				;$10c0			;ff351c
	addq.b	#1,d1					;$5201			;ff351e
	cmp.b	#$0a,d1					;$b23c,$000a		;ff3520
	bcs.s	Lff3516					;$65f0			;ff3524
	unlk	a6					;$4e5e			;ff3526
	movem.l	(a7)+,d0-d2/d7/a1-a2			;$4cdf,$0687		;ff3528
	rts						;$4e75			;ff352c

Lff352e:									;ff352e
	.dc.b	$3b,$9a,$ca,$00,$05,$f5,$e1,$00					;ff352e
	.dc.b	$00,$98,$96,$80,$00,$0f,$42,$40					;ff3536
	.dc.b	$00,$01,$86,$a0,$00,$00,$27,$10					;ff353e
	.dc.b	$00,$00,$03,$e8,$00,$00,$00,$64					;ff3546
	.dc.b	$00,$00,$00,$0a,$00,$00,$00,$01					;ff354e
	.dc.b	$00,$00,$00,$00,$48,$e7,$7f,$00					;ff3556
	.dc.b	$4e,$56,$00,$00,$42,$80,$61,$00					;ff355e
	.dc.b	$02,$b2,$67,$44,$61,$00,$02,$86					;ff3566
	.dc.b	$10,$10,$61,$00,$02,$94,$65,$38					;ff356e
	.dc.b	$90,$3c,$00,$30,$42,$81,$12,$00					;ff3576
	.dc.b	$52,$88,$10,$10,$61,$00,$02,$82					;ff357e
	.dc.b	$65,$32,$90,$3c,$00,$30,$2f,$01					;ff3586
	.dc.b	$e3,$89,$65,$10,$e3,$89,$65,$0c					;ff358e
	.dc.b	$d2,$9f,$65,$08,$e3,$89,$65,$04					;ff3596
	.dc.b	$d2,$80,$64,$dc							;ff359e
Lff35a2:									;ff35a2
	unlk	a6					;$4e5e			;ff35a2
	movem.l	(a7)+,d1-d7				;$4cdf,$00fe		;ff35a4
	move.w	#$0001,ccr				;$44fc,$0001		;ff35a8
	rts						;$4e75			;ff35ac

Lff35ae:									;ff35ae
	unlk	a6					;$4e5e			;ff35ae
	movem.l	(a7)+,d1-d7				;$4cdf,$00fe		;ff35b0
	move.w	#$0009,ccr				;$44fc,$0009		;ff35b4
	rts						;$4e75			;ff35b8

Lff35ba:									;ff35ba
	tst.w	d7					;$4a47			;ff35ba
	bmi.s	Lff35cc					;$6b0e			;ff35bc
	tst.l	d1					;$4a81			;ff35be
	bmi.s	Lff35a2					;$6be0			;ff35c0
Lff35c2:									;ff35c2
	move.l	d1,d0					;$2001			;ff35c2
	unlk	a6					;$4e5e			;ff35c4
	movem.l	(a7)+,d1-d7				;$4cdf,$00fe		;ff35c6
	rts						;$4e75			;ff35ca

Lff35cc:									;ff35cc
	tst.l	d1					;$4a81			;ff35cc
	bpl.s	Lff35da					;$6a0a			;ff35ce
	cmp.l	#$80000000,d1				;$b2bc,$8000,$0000	;ff35d0
	beq.s	Lff35c2					;$67ea			;ff35d6
	bra.s	Lff35a2					;$60c8			;ff35d8
Lff35da:									;ff35da
	neg.l	d1					;$4481			;ff35da
	bra.s	Lff35c2					;$60e4			;ff35dc
Lff35de:									;ff35de
	movem.l	d2-d7/a1-a2,-(a7)			;$48e7,$3f60		;ff35de
	link.w	a6,#-$001e				;$4e56,$ffe2		;ff35e2
	bsr.w	Lff3818					;$6100,$0230		;ff35e6
	beq.w	Lff36c4					;$6700,$00d8		;ff35ea
	bsr.w	Lff37f2					;$6100,$0202		;ff35ee
	move.w	#$ffff,(-$0006,a6)			;$3d7c,$ffff,$fffa	;ff35f2
	clr.l	(-$0004,a6)				;$42ae,$fffc		;ff35f8
	move.b	(a0),d0					;$1010			;ff35fc
	clr.l	d6					;$4286			;ff35fe
	cmp.b	#$2e,d0					;$b03c,$002e		;ff3600
	bne.s	Lff3612					;$660c			;ff3604
	bset.l	#$1f,d6					;$08c6,$001f		;ff3606
	clr.w	(-$0006,a6)				;$426e,$fffa		;ff360a
	addq.l	#1,a0					;$5288			;ff360e
	move.b	(a0),d0					;$1010			;ff3610
Lff3612:									;ff3612
	bsr.w	Lff3806					;$6100,$01f2		;ff3612
	bcs.w	Lff36c4					;$6500,$00ac		;ff3616
	addq.l	#1,a0					;$5288			;ff361a
	bsr.w	Lff36ec					;$6100,$00ce		;ff361c
	lea.l	(-$001e,a6),a1				;$43ee,$ffe2		;ff3620
	move.b	#$30,(a1)+				;$12fc,$0030		;ff3624
	movea.l	a1,a2					;$2449			;ff3628
	move.b	d0,(a1)+				;$12c0			;ff362a
	moveq.l	#$01,d5					;$7a01			;ff362c
Lff362e:									;ff362e
	move.b	(a0),d0					;$1010			;ff362e
	cmp.b	#$2e,d0					;$b03c,$002e		;ff3630
	bne.s	Lff3648					;$6612			;ff3634
	tst.w	d6					;$4a46			;ff3636
	bne.w	Lff36c4					;$6600,$008a		;ff3638
	bset.l	#$1f,d6					;$08c6,$001f		;ff363c
	clr.w	(-$0006,a6)				;$426e,$fffa		;ff3640
	addq.l	#1,a0					;$5288			;ff3644
	bra.s	Lff362e					;$60e6			;ff3646
Lff3648:									;ff3648
	bsr.w	Lff3806					;$6100,$01bc		;ff3648
	bcs.s	Lff3662					;$6514			;ff364c
	move.b	d0,(a1)+				;$12c0			;ff364e
	addq.l	#1,a0					;$5288			;ff3650
	bsr.w	Lff36ec					;$6100,$0098		;ff3652
	addq.w	#1,d5					;$5245			;ff3656
	cmp.w	#$000f,d5				;$ba7c,$000f		;ff3658
	bne.s	Lff362e					;$66d0			;ff365c
	bsr.w	Lff37c0					;$6100,$0160		;ff365e
Lff3662:									;ff3662
	bsr.w	Lff3756					;$6100,$00f2		;ff3662
	bsr.w	Lff36f4					;$6100,$008c		;ff3666
	tst.w	d7					;$4a47			;ff366a
	bpl.s	Lff3672					;$6a04			;ff366c
	bsr.w	Lff3132					;$6100,$fac2		;ff366e
Lff3672:									;ff3672
	move.l	d0,(-$000e,a6)				;$2d40,$fff2		;ff3672
	move.l	d1,(-$000a,a6)				;$2d41,$fff6		;ff3676
	tst.w	(-$0006,a6)				;$4a6e,$fffa		;ff367a
	beq.s	Lff36a4					;$6724			;ff367e
	bsr.w	Lff2f88					;$6100,$f906		;ff3680
	bcs.s	Lff36a0					;$651a			;ff3684
	move.l	d0,d4					;$2800			;ff3686
	bsr.w	Lff2f5c					;$6100,$f8d2		;ff3688
	move.l	(-$000e,a6),d2				;$242e,$fff2		;ff368c
	move.l	(-$000a,a6),d3				;$262e,$fff6		;ff3690
	bsr.w	Lff30d2					;$6100,$fa3c		;ff3694
	bne.s	Lff36a0					;$6606			;ff3698
	move.l	d4,(-$0004,a6)				;$2d44,$fffc		;ff369a
	bra.s	Lff36a4					;$6004			;ff369e
Lff36a0:									;ff36a0
	clr.w	(-$0006,a6)				;$426e,$fffa		;ff36a0
Lff36a4:									;ff36a4
	move.l	(-$000e,a6),d0				;$202e,$fff2		;ff36a4
	move.l	(-$000a,a6),d1				;$222e,$fff6		;ff36a8
	clr.l	d2					;$4282			;ff36ac
	move.w	(-$0006,a6),d2				;$342e,$fffa		;ff36ae
	move.l	(-$0004,a6),d3				;$262e,$fffc		;ff36b2
	unlk	a6					;$4e5e			;ff36b6
	addq.l	#8,a7					;$508f			;ff36b8
	movem.l	(a7)+,d4-d7/a1-a2			;$4cdf,$06f0		;ff36ba
	move.w	#$0000,ccr				;$44fc,$0000		;ff36be
	rts						;$4e75			;ff36c2

Lff36c4:									;ff36c4
	unlk	a6					;$4e5e			;ff36c4
	movem.l	(a7)+,d2-d7/a1-a2			;$4cdf,$06fc		;ff36c6
	clr.l	d0					;$4280			;ff36ca
	clr.l	d1					;$4281			;ff36cc
	move.w	#$0009,ccr				;$44fc,$0009		;ff36ce
	rts						;$4e75			;ff36d2

Lff36d4:									;ff36d4
	unlk	a6					;$4e5e			;ff36d4
	movem.l	(a7)+,d2-d7/a1-a2			;$4cdf,$06fc		;ff36d6
	move.w	#$0001,ccr				;$44fc,$0001		;ff36da
	rts						;$4e75			;ff36de

Lff36e0:									;ff36e0
	unlk	a6					;$4e5e			;ff36e0
	movem.l	(a7)+,d2-d7/a1-a2			;$4cdf,$06fc		;ff36e2
	move.w	#$0003,ccr				;$44fc,$0003		;ff36e6
	rts						;$4e75			;ff36ea

Lff36ec:									;ff36ec
	tst.l	d6					;$4a86			;ff36ec
	bpl.s	Lff36f2					;$6a02			;ff36ee
	subq.w	#1,d6					;$5346			;ff36f0
Lff36f2:									;ff36f2
	rts						;$4e75			;ff36f2

Lff36f4:									;ff36f4
	clr.l	d0					;$4280			;ff36f4
	clr.l	d1					;$4281			;ff36f6
Lff36f8:									;ff36f8
	move.l	#$20000000,d2				;$243c,$2000,$0000	;ff36f8
	move.l	#$00000402,d3				;$263c,$0000,$0402	;ff36fe
	bsr.w	Lff32d8					;$6100,$fbd2		;ff3704
	move.l	d0,d2					;$2400			;ff3708
	move.l	d1,d3					;$2601			;ff370a
	clr.l	d0					;$4280			;ff370c
	move.b	(a2)+,d0				;$101a			;ff370e
	sub.b	#$30,d0					;$903c,$0030		;ff3710
	bsr.w	Lff2f5c					;$6100,$f846		;ff3714
	bsr.w	Lff3146					;$6100,$fa2c		;ff3718
	subq.w	#1,d5					;$5345			;ff371c
	bne.s	Lff36f8					;$66d8			;ff371e
	add.w	d6,d4					;$d846			;ff3720
	beq.s	Lff3754					;$6730			;ff3722
	bmi.s	Lff373e					;$6b18			;ff3724
Lff3726:									;ff3726
	move.l	#$20000000,d2				;$243c,$2000,$0000	;ff3726
	move.l	#$00000402,d3				;$263c,$0000,$0402	;ff372c
	bsr.w	Lff32d8					;$6100,$fba4		;ff3732
	bcs.s	Lff36e0					;$65a8			;ff3736
	subq.w	#1,d4					;$5344			;ff3738
	bne.s	Lff3726					;$66ea			;ff373a
	rts						;$4e75			;ff373c

Lff373e:									;ff373e
	move.l	#$20000000,d2				;$243c,$2000,$0000	;ff373e
	move.l	#$00000402,d3				;$263c,$0000,$0402	;ff3744
	bsr.w	Lff33de					;$6100,$fc92		;ff374a
	bcs.s	Lff36d4					;$6584			;ff374e
	addq.w	#1,d4					;$5244			;ff3750
	bne.s	Lff373e					;$66ea			;ff3752
Lff3754:									;ff3754
	rts						;$4e75			;ff3754

Lff3756:									;ff3756
	clr.l	d4					;$4284			;ff3756
	cmp.b	#$45,d0					;$b03c,$0045		;ff3758
	beq.s	Lff3766					;$6708			;ff375c
	cmp.b	#$65,d0					;$b03c,$0065		;ff375e
	beq.s	Lff3766					;$6702			;ff3762
	rts						;$4e75			;ff3764

Lff3766:									;ff3766
	clr.w	(-$0006,a6)				;$426e,$fffa		;ff3766
	addq.l	#1,a0					;$5288			;ff376a
	move.b	(a0),d0					;$1010			;ff376c
	cmp.b	#$2b,d0					;$b03c,$002b		;ff376e
	beq.s	Lff377e					;$670a			;ff3772
	cmp.b	#$2d,d0					;$b03c,$002d		;ff3774
	bne.s	Lff3782					;$6608			;ff3778
	bset.l	#$1f,d4					;$08c4,$001f		;ff377a
Lff377e:									;ff377e
	addq.l	#1,a0					;$5288			;ff377e
	move.b	(a0),d0					;$1010			;ff3780
Lff3782:									;ff3782
	bsr.w	Lff3806					;$6100,$0082		;ff3782
	bcs.w	Lff36c4					;$6500,$ff3c		;ff3786
	sub.b	#$30,d0					;$903c,$0030		;ff378a
	move.b	d0,d4					;$1800			;ff378e
	clr.w	d0					;$4240			;ff3790
Lff3792:									;ff3792
	addq.l	#1,a0					;$5288			;ff3792
	move.b	(a0),d0					;$1010			;ff3794
	bsr.s	Lff3806					;$616e			;ff3796
	bcs.s	Lff37b8					;$651e			;ff3798
	sub.b	#$30,d0					;$903c,$0030		;ff379a
	move.w	d4,-(a7)				;$3f04			;ff379e
	lsl.w	#2,d4					;$e54c			;ff37a0
	add.w	(a7)+,d4				;$d85f			;ff37a2
	lsl.w	#1,d4					;$e34c			;ff37a4
	add.w	d0,d4					;$d840			;ff37a6
	cmp.w	#$03e8,d4				;$b87c,$03e8		;ff37a8
	bcs.s	Lff3792					;$65e4			;ff37ac
	tst.l	d4					;$4a84			;ff37ae
	bpl.w	Lff36e0					;$6a00,$ff2e		;ff37b0
	bra.w	Lff36d4					;$6000,$ff1e		;ff37b4
Lff37b8:									;ff37b8
	tst.l	d4					;$4a84			;ff37b8
	bpl.s	Lff37be					;$6a02			;ff37ba
	neg.w	d4					;$4444			;ff37bc
Lff37be:									;ff37be
	rts						;$4e75			;ff37be

Lff37c0:									;ff37c0
	addq.w	#1,d6					;$5246			;ff37c0
	subq.w	#1,d5					;$5345			;ff37c2
	cmpi.b	#$35,-(a1)				;$0c21,$0035		;ff37c4
	bcs.s	Lff37d8					;$650e			;ff37c8
Lff37ca:									;ff37ca
	addq.b	#1,-(a1)				;$5221			;ff37ca
	cmpi.b	#$3a,(a1)				;$0c11,$003a		;ff37cc
	bcs.s	Lff37d8					;$6506			;ff37d0
	move.b	#$30,(a1)				;$12bc,$0030		;ff37d2
	bra.s	Lff37ca					;$60f2			;ff37d6
Lff37d8:									;ff37d8
	cmpa.l	a2,a1					;$b3ca			;ff37d8
	bcc.s	Lff37e0					;$6404			;ff37da
	movea.l	a1,a2					;$2449			;ff37dc
	addq.w	#1,d6					;$5246			;ff37de
Lff37e0:									;ff37e0
	move.b	(a0),d0					;$1010			;ff37e0
	bsr.s	Lff3806					;$6122			;ff37e2
	bcs.s	Lff37f0					;$650a			;ff37e4
	addq.l	#1,a0					;$5288			;ff37e6
	tst.w	d6					;$4a46			;ff37e8
	bmi.s	Lff37e0					;$6bf4			;ff37ea
	addq.w	#1,d6					;$5246			;ff37ec
	bra.s	Lff37e0					;$60f0			;ff37ee
Lff37f0:									;ff37f0
	rts						;$4e75			;ff37f0

Lff37f2:									;ff37f2
	clr.w	d7					;$4247			;ff37f2
	cmp.b	#$2b,d0					;$b03c,$002b		;ff37f4
	beq.s	Lff3802					;$6708			;ff37f8
	cmp.b	#$2d,d0					;$b03c,$002d		;ff37fa
	bne.s	Lff3804					;$6604			;ff37fe
	not.w	d7					;$4647			;ff3800
Lff3802:									;ff3802
	addq.l	#1,a0					;$5288			;ff3802
Lff3804:									;ff3804
	rts						;$4e75			;ff3804

Lff3806:									;ff3806
	cmp.b	#$30,d0					;$b03c,$0030		;ff3806
	bcs.s	Lff3814					;$6508			;ff380a
	cmp.b	#$3a,d0					;$b03c,$003a		;ff380c
	eori.b	#$01,ccr				;$0a3c,$0001		;ff3810
Lff3814:									;ff3814
	rts						;$4e75			;ff3814

Lff3816:									;ff3816
	addq.l	#1,a0					;$5288			;ff3816
Lff3818:									;ff3818
	move.b	(a0),d0					;$1010			;ff3818
	cmp.b	#$09,d0					;$b03c,$0009		;ff381a
	beq.s	Lff3816					;$67f6			;ff381e
	cmp.b	#$20,d0					;$b03c,$0020		;ff3820
	beq.s	Lff3816					;$67f0			;ff3824
	tst.b	d0					;$4a00			;ff3826
	rts						;$4e75			;ff3828

Lff382a:									;ff382a
	movem.l	d1-d2,-(a7)				;$48e7,$6000		;ff382a
	bsr.w	Lff39a4					;$6100,$0174		;ff382e
	tst.l	d1					;$4a81			;ff3832
	beq.s	Lff383e					;$6708			;ff3834
	bsr.w	Lff397a					;$6100,$0142		;ff3836
	move.b	#$2d,(a0)+				;$10fc,$002d		;ff383a
Lff383e:									;ff383e
	addq.l	#1,a0					;$5288			;ff383e
	bsr.w	Lff397a					;$6100,$0138		;ff3840
	move.b	#$2e,(a0)				;$10bc,$002e		;ff3844
	bsr.w	Lff3992					;$6100,$0148		;ff3848
	move.b	#$45,(a0)+				;$10fc,$0045		;ff384c
	subq.l	#1,d0					;$5380			;ff3850
	bsr.w	Lff3946					;$6100,$00f2		;ff3852
	clr.b	(a0)					;$4210			;ff3856
	movem.l	(a7)+,d1-d2				;$4cdf,$0006		;ff3858
	rts						;$4e75			;ff385c

Lff385e:									;ff385e
	movem.l	d1-d2,-(a7)				;$48e7,$6000		;ff385e
	bsr.w	Lff39ca					;$6100,$0166		;ff3862
	tst.l	d1					;$4a81			;ff3866
	beq.s	Lff3872					;$6708			;ff3868
	bsr.w	Lff397a					;$6100,$010e		;ff386a
	move.b	#$2d,(a0)+				;$10fc,$002d		;ff386e
Lff3872:									;ff3872
	tst.l	d0					;$4a80			;ff3872
	bmi.s	Lff3886					;$6b10			;ff3874
	beq.s	Lff3886					;$670e			;ff3876
	lea.l	(a0,d0.l),a0				;$41f0,$0800		;ff3878
	bsr.w	Lff397a					;$6100,$00fc		;ff387c
	move.b	#$2e,(a0)				;$10bc,$002e		;ff3880
	bra.s	Lff38b2					;$602c			;ff3884
Lff3886:									;ff3886
	neg.l	d0					;$4480			;ff3886
	and.w	#$00ff,d2				;$c47c,$00ff		;ff3888
	cmp.w	d2,d0					;$b042			;ff388c
	bls.s	Lff3892					;$6302			;ff388e
	move.w	d2,d0					;$3002			;ff3890
Lff3892:									;ff3892
	bsr.w	Lff397a					;$6100,$00e6		;ff3892
	move.b	#$30,(a0)+				;$10fc,$0030		;ff3896
	bsr.w	Lff397a					;$6100,$00de		;ff389a
	move.b	#$2e,(a0)+				;$10fc,$002e		;ff389e
	tst.w	d0					;$4a40			;ff38a2
	beq.s	Lff38b2					;$670c			;ff38a4
Lff38a6:									;ff38a6
	bsr.w	Lff397a					;$6100,$00d2		;ff38a6
	move.b	#$30,(a0)				;$10bc,$0030		;ff38aa
	subq.w	#1,d0					;$5340			;ff38ae
	bne.s	Lff38a6					;$66f4			;ff38b0
Lff38b2:									;ff38b2
	bsr.w	Lff3992					;$6100,$00de		;ff38b2
	movem.l	(a7)+,d1-d2				;$4cdf,$0006		;ff38b6
	rts						;$4e75			;ff38ba

Lff38bc:									;ff38bc
	movem.l	d1-d2,-(a7)				;$48e7,$6000		;ff38bc
	bsr.w	Lff39a4					;$6100,$00e2		;ff38c0
	tst.l	d1					;$4a81			;ff38c4
	beq.s	Lff38d0					;$6708			;ff38c6
	bsr.w	Lff397a					;$6100,$00b0		;ff38c8
	move.b	#$2d,(a0)+				;$10fc,$002d		;ff38cc
Lff38d0:									;ff38d0
	tst.l	d0					;$4a80			;ff38d0
	beq.s	Lff392e					;$675a			;ff38d2
	bmi.s	Lff38f6					;$6b20			;ff38d4
	and.w	#$00ff,d2				;$c47c,$00ff		;ff38d6
	cmp.w	d2,d0					;$b042			;ff38da
	beq.s	Lff393e					;$6760			;ff38dc
	bcc.s	Lff3916					;$6436			;ff38de
	lea.l	(a0,d0.l),a0				;$41f0,$0800		;ff38e0
	bsr.w	Lff397a					;$6100,$0094		;ff38e4
	move.b	#$2e,(a0)				;$10bc,$002e		;ff38e8
	bsr.w	Lff3992					;$6100,$00a4		;ff38ec
	bsr.w	Lff3998					;$6100,$00a6		;ff38f0
	bra.s	Lff393e					;$6048			;ff38f4
Lff38f6:									;ff38f6
	move.l	a0,-(a7)				;$2f08			;ff38f6
	bsr.w	Lff3992					;$6100,$0098		;ff38f8
	bsr.w	Lff3998					;$6100,$009a		;ff38fc
	suba.l	(a7),a0					;$91d7			;ff3900
	addq.l	#1,a0					;$5288			;ff3902
	move.l	d0,d1					;$2200			;ff3904
	neg.l	d1					;$4481			;ff3906
	add.l	a0,d1					;$d288			;ff3908
	movea.l	(a7)+,a0				;$205f			;ff390a
	and.w	#$00ff,d2				;$c47c,$00ff		;ff390c
	cmp.w	d2,d1					;$b242			;ff3910
	bcs.w	Lff3886					;$6500,$ff72		;ff3912
Lff3916:									;ff3916
	addq.l	#1,a0					;$5288			;ff3916
	bsr.s	Lff397a					;$6160			;ff3918
	move.b	#$2e,(a0)				;$10bc,$002e		;ff391a
	bsr.s	Lff3992					;$6172			;ff391e
	bsr.s	Lff3998					;$6176			;ff3920
	move.b	#$45,(a0)+				;$10fc,$0045		;ff3922
	subq.l	#1,d0					;$5380			;ff3926
	bsr.s	Lff3946					;$611c			;ff3928
	clr.b	(a0)					;$4210			;ff392a
	bra.s	Lff393e					;$6010			;ff392c
Lff392e:									;ff392e
	bsr.s	Lff397a					;$614a			;ff392e
	move.b	#$30,(a0)+				;$10fc,$0030		;ff3930
	bsr.s	Lff397a					;$6144			;ff3934
	move.b	#$2e,(a0)+				;$10fc,$002e		;ff3936
	bsr.s	Lff3992					;$6156			;ff393a
	bsr.s	Lff3998					;$615a			;ff393c
Lff393e:									;ff393e
	bsr.s	Lff3992					;$6152			;ff393e
	movem.l	(a7)+,d1-d2				;$4cdf,$0006		;ff3940
	rts						;$4e75			;ff3944

Lff3946:									;ff3946
	move.b	#$2b,d1					;$123c,$002b		;ff3946
	tst.l	d0					;$4a80			;ff394a
	bpl.s	Lff3954					;$6a06			;ff394c
	move.b	#$2d,d1					;$123c,$002d		;ff394e
	neg.l	d0					;$4480			;ff3952
Lff3954:									;ff3954
	move.b	d1,(a0)+				;$10c1			;ff3954
	move.w	#$0064,d1				;$323c,$0064		;ff3956
	bsr.s	Lff396a					;$610e			;ff395a
	move.w	#$000a,d1				;$323c,$000a		;ff395c
	bsr.s	Lff396a					;$6108			;ff3960
	add.b	#$30,d0					;$d03c,$0030		;ff3962
	move.b	d0,(a0)+				;$10c0			;ff3966
	rts						;$4e75			;ff3968

Lff396a:									;ff396a
	move.b	#$2f,d2					;$143c,$002f		;ff396a
Lff396e:									;ff396e
	addq.b	#1,d2					;$5202			;ff396e
	sub.w	d1,d0					;$9041			;ff3970
	bcc.s	Lff396e					;$64fa			;ff3972
	add.w	d1,d0					;$d041			;ff3974
	move.b	d2,(a0)+				;$10c2			;ff3976
	rts						;$4e75			;ff3978

Lff397a:									;ff397a
	movem.l	d0-d1/a0,-(a7)				;$48e7,$c080		;ff397a
	move.b	(a0)+,d0				;$1018			;ff397e
Lff3980:									;ff3980
	move.b	(a0),d1					;$1210			;ff3980
	move.b	d0,(a0)+				;$10c0			;ff3982
	beq.s	Lff398a					;$6704			;ff3984
	move.b	d1,d0					;$1001			;ff3986
	bra.s	Lff3980					;$60f6			;ff3988
Lff398a:									;ff398a
	movem.l	(a7)+,d0-d1/a0				;$4cdf,$0103		;ff398a
	rts						;$4e75			;ff398e

Lff3990:									;ff3990
	addq.l	#1,a0					;$5288			;ff3990
Lff3992:									;ff3992
	tst.b	(a0)					;$4a10			;ff3992
	bne.s	Lff3990					;$66fa			;ff3994
	rts						;$4e75			;ff3996

Lff3998:									;ff3998
	cmpi.b	#$30,-(a0)				;$0c20,$0030		;ff3998
	beq.s	Lff3998					;$67fa			;ff399c
	addq.l	#1,a0					;$5288			;ff399e
	clr.b	(a0)					;$4210			;ff39a0
	rts						;$4e75			;ff39a2

Lff39a4:									;ff39a4
	movem.l	d2-d7/a0-a2,-(a7)			;$48e7,$3fe0		;ff39a4
	link.w	a6,#-$0016				;$4e56,$ffea		;ff39a8
	bsr.s	Lff39f2					;$6144			;ff39ac
	move.w	(-$0012,a6),d0				;$302e,$ffee		;ff39ae
	bsr.s	Lff3a22					;$616e			;ff39b2
	move.w	(-$0012,a6),d0				;$302e,$ffee		;ff39b4
	bsr.w	Lff3a42					;$6100,$0088		;ff39b8
	unlk	a6					;$4e5e			;ff39bc
	move.w	d7,d0					;$3007			;ff39be
	ext.l	d0					;$48c0			;ff39c0
	move.l	d6,d1					;$2206			;ff39c2
	movem.l	(a7)+,d2-d7/a0-a2			;$4cdf,$07fc		;ff39c4
	rts						;$4e75			;ff39c8

Lff39ca:									;ff39ca
	movem.l	d2-d7/a0-a2,-(a7)			;$48e7,$3fe0		;ff39ca
	link.w	a6,#-$0016				;$4e56,$ffea		;ff39ce
	bsr.s	Lff39f2					;$611e			;ff39d2
	move.w	(-$0012,a6),d0				;$302e,$ffee		;ff39d4
	add.w	d7,d0					;$d047			;ff39d8
	bsr.s	Lff3a22					;$6146			;ff39da
	move.w	(-$0012,a6),d0				;$302e,$ffee		;ff39dc
	add.w	d7,d0					;$d047			;ff39e0
	bsr.s	Lff3a42					;$615e			;ff39e2
	unlk	a6					;$4e5e			;ff39e4
	move.w	d7,d0					;$3007			;ff39e6
	ext.l	d0					;$48c0			;ff39e8
	move.l	d6,d1					;$2206			;ff39ea
	movem.l	(a7)+,d2-d7/a0-a2			;$4cdf,$07fc		;ff39ec
	rts						;$4e75			;ff39f0

Lff39f2:									;ff39f2
	move.l	a0,(-$0016,a6)				;$2d48,$ffea		;ff39f2
	clr.w	(-$0012,a6)				;$426e,$ffee		;ff39f6
	move.b	d2,(-$0011,a6)				;$1d42,$ffef		;ff39fa
	bsr.s	Lff3a68					;$6168			;ff39fe
	lea.l	(-$0010,a6),a1				;$43ee,$fff0		;ff3a00
	move.b	#$30,(a1)+				;$12fc,$0030		;ff3a04
	move.l	a1,-(a7)				;$2f09			;ff3a08
	bsr.w	Lff3af6					;$6100,$00ea		;ff3a0a
	lea.l	(-$0001,a6),a0				;$41ee,$ffff		;ff3a0e
	bsr.w	Lff3b1c					;$6100,$0108		;ff3a12
	movea.l	(a7)+,a1				;$225f			;ff3a16
	cmpa.l	a1,a0					;$b1c9			;ff3a18
	bcc.s	Lff3a20					;$6404			;ff3a1a
	movea.l	a0,a1					;$2248			;ff3a1c
	addq.w	#1,d7					;$5247			;ff3a1e
Lff3a20:									;ff3a20
	rts						;$4e75			;ff3a20

Lff3a22:									;ff3a22
	tst.w	d0					;$4a40			;ff3a22
	beq.s	Lff3a40					;$671a			;ff3a24
	bmi.s	Lff3a40					;$6b18			;ff3a26
	cmp.w	#$000e,d0				;$b07c,$000e		;ff3a28
	bcc.s	Lff3a40					;$6412			;ff3a2c
	movea.l	a1,a0					;$2049			;ff3a2e
	lea.l	(a0,d0.w),a0				;$41f0,$0000		;ff3a30
	bsr.w	Lff3b1c					;$6100,$00e6		;ff3a34
	cmpa.l	a1,a0					;$b1c9			;ff3a38
	bcc.s	Lff3a40					;$6404			;ff3a3a
	movea.l	a0,a1					;$2248			;ff3a3c
	addq.w	#1,d7					;$5247			;ff3a3e
Lff3a40:									;ff3a40
	rts						;$4e75			;ff3a40

Lff3a42:									;ff3a42
	movea.l	(-$0016,a6),a0				;$206e,$ffea		;ff3a42
	tst.w	d0					;$4a40			;ff3a46
	beq.s	Lff3a64					;$671a			;ff3a48
	bmi.s	Lff3a64					;$6b18			;ff3a4a
	clr.w	d1					;$4241			;ff3a4c
Lff3a4e:									;ff3a4e
	cmp.w	d0,d1					;$b240			;ff3a4e
	beq.s	Lff3a64					;$6712			;ff3a50
	cmp.w	#$000e,d1				;$b27c,$000e		;ff3a52
	bcc.s	Lff3a5e					;$6406			;ff3a56
	move.b	(a1)+,(a0)+				;$10d9			;ff3a58
Lff3a5a:									;ff3a5a
	addq.w	#1,d1					;$5241			;ff3a5a
	bra.s	Lff3a4e					;$60f0			;ff3a5c
Lff3a5e:									;ff3a5e
	move.b	#$30,(a0)+				;$10fc,$0030		;ff3a5e
	bra.s	Lff3a5a					;$60f6			;ff3a62
Lff3a64:									;ff3a64
	clr.b	(a0)					;$4210			;ff3a64
	rts						;$4e75			;ff3a66

Lff3a68:									;ff3a68
	clr.l	d6					;$4286			;ff3a68
	move.l	d0,d2					;$2400			;ff3a6a
	and.l	#$7fffffff,d0				;$c0bc,$7fff,$ffff	;ff3a6c
	bne.s	Lff3a7c					;$6608			;ff3a72
	tst.l	d1					;$4a81			;ff3a74
	bne.s	Lff3a7c					;$6604			;ff3a76
	moveq.l	#$01,d7					;$7e01			;ff3a78
	rts						;$4e75			;ff3a7a

Lff3a7c:									;ff3a7c
	lsl.l	#1,d2					;$e38a			;ff3a7c
	roxl.l	#1,d6					;$e396			;ff3a7e
	moveq.l	#$0f,d7					;$7e0f			;ff3a80
Lff3a82:									;ff3a82
	move.l	#$635fa931,d2				;$243c,$635f,$a931	;ff3a82
	move.l	#$a0000430.l,d3				;$263c,$a000,$0430	;ff3a88
	bsr.w	Lff30d2					;$6100,$f642		;ff3a8e
	bcc.s	Lff3ab8					;$6424			;ff3a92
	moveq.l	#$00,d2					;$7400			;ff3a94
	move.l	#$000003ff,d3				;$263c,$0000,$03ff	;ff3a96
	bsr.w	Lff30d2					;$6100,$f634		;ff3a9c
	bcc.s	Lff3ace					;$642c			;ff3aa0
	move.l	#$635fa931,d2				;$243c,$635f,$a931	;ff3aa2
	move.l	#$a0000430.l,d3				;$263c,$a000,$0430	;ff3aa8
	bsr.w	Lff32d8					;$6100,$f828		;ff3aae
	sub.w	#$000f,d7				;$9e7c,$000f		;ff3ab2
	bra.s	Lff3a82					;$60ca			;ff3ab6
Lff3ab8:									;ff3ab8
	move.l	#$635fa931,d2				;$243c,$635f,$a931	;ff3ab8
	move.l	#$a0000430.l,d3				;$263c,$a000,$0430	;ff3abe
	bsr.w	Lff33de					;$6100,$f918		;ff3ac4
	add.w	#$000f,d7				;$de7c,$000f		;ff3ac8
	bra.s	Lff3a82					;$60b4			;ff3acc
Lff3ace:									;ff3ace
	move.l	#$35e620f4,d2				;$243c,$35e6,$20f4	;ff3ace
	move.l	#$8000042d.l,d3				;$263c,$8000,$042d	;ff3ad4
	bsr.w	Lff30d2					;$6100,$f5f6		;ff3ada
	bcc.s	Lff3af4					;$6414			;ff3ade
	move.l	#$20000000,d2				;$243c,$2000,$0000	;ff3ae0
	move.l	#$00000402,d3				;$263c,$0000,$0402	;ff3ae6
	bsr.w	Lff32d8					;$6100,$f7ea		;ff3aec
	subq.w	#1,d7					;$5347			;ff3af0
	bra.s	Lff3ace					;$60da			;ff3af2
Lff3af4:									;ff3af4
	rts						;$4e75			;ff3af4

Lff3af6:									;ff3af6
	move.w	#$000e,d4				;$383c,$000e		;ff3af6
	lea.l	(Lff3b3a,pc),a2				;$45fa,$003e		;ff3afa
Lff3afe:									;ff3afe
	move.b	#$30,(a1)				;$12bc,$0030		;ff3afe
	lea.l	(a2),a0					;$41d2			;ff3b02
Lff3b04:									;ff3b04
	bsr.w	Lff3bb2					;$6100,$00ac		;ff3b04
	bcs.s	Lff3b12					;$6508			;ff3b08
	addq.b	#1,(a1)					;$5211			;ff3b0a
	bsr.w	Lff3bc6					;$6100,$00b8		;ff3b0c
	bra.s	Lff3b04					;$60f2			;ff3b10
Lff3b12:									;ff3b12
	addq.l	#1,a1					;$5289			;ff3b12
	addq.l	#8,a2					;$508a			;ff3b14
	dbra.w	d4,Lff3afe				;$51cc,$ffe6		;ff3b16
	rts						;$4e75			;ff3b1a

Lff3b1c:									;ff3b1c
	cmpi.b	#$35,(a0)				;$0c10,$0035		;ff3b1c
	bcs.s	Lff3b30					;$650e			;ff3b20
Lff3b22:									;ff3b22
	addq.b	#1,-(a0)				;$5220			;ff3b22
	cmpi.b	#$39,(a0)				;$0c10,$0039		;ff3b24
	bls.s	Lff3b30					;$6306			;ff3b28
	move.b	#$30,(a0)				;$10bc,$0030		;ff3b2a
	bra.s	Lff3b22					;$60f2			;ff3b2e
Lff3b30:									;ff3b30
	rts						;$4e75			;ff3b30

Lff3b32:									;ff3b32
	.dc.b	$63,$5f,$a9,$31,$a0,$00,$04,$30					;ff3b32
Lff3b3a:									;ff3b3a
	.dc.b	$35,$e6,$20,$f4,$80,$00,$04,$2d					;ff3b3a
	.dc.b	$11,$84,$e7,$2a,$00,$00,$04,$2a					;ff3b42
	.dc.b	$68,$d4,$a5,$10,$00,$00,$04,$26					;ff3b4a
	.dc.b	$3a,$43,$b7,$40,$00,$00,$04,$23					;ff3b52
	.dc.b	$15,$02,$f9,$00,$00,$00,$04,$20					;ff3b5a
	.dc.b	$6e,$6b,$28,$00,$00,$00,$04,$1c					;ff3b62
	.dc.b	$3e,$bc,$20,$00,$00,$00,$04,$19					;ff3b6a
	.dc.b	$18,$96,$80,$00,$00,$00,$04,$16					;ff3b72
	.dc.b	$74,$24,$00,$00,$00,$00,$04,$12					;ff3b7a
	.dc.b	$43,$50,$00,$00,$00,$00,$04,$0f					;ff3b82
	.dc.b	$1c,$40,$00,$00,$00,$00,$04,$0c					;ff3b8a
	.dc.b	$7a,$00,$00,$00,$00,$00,$04,$08					;ff3b92
	.dc.b	$48,$00,$00,$00,$00,$00,$04,$05					;ff3b9a
	.dc.b	$20,$00,$00,$00,$00,$00,$04,$02					;ff3ba2
	.dc.b	$00,$00,$00,$00,$00,$00,$03,$ff					;ff3baa
Lff3bb2:									;ff3bb2
	move.l	(a0),d2					;$2410			;ff3bb2
	move.l	($0004,a0),d3				;$2628,$0004		;ff3bb4
	bra.w	Lff30d2					;$6000,$f518		;ff3bb8
Lff3bbc:									;ff3bbc
	move.l	(a0),d2					;$2410			;ff3bbc
	move.l	($0004,a0),d3				;$2628,$0004		;ff3bbe
	bra.w	Lff3146					;$6000,$f582		;ff3bc2
Lff3bc6:									;ff3bc6
	move.l	(a0),d2					;$2410			;ff3bc6
	move.l	($0004,a0),d3				;$2628,$0004		;ff3bc8
	bra.w	Lff31f4					;$6000,$f626		;ff3bcc
Lff3bd0:									;ff3bd0
	move.l	(a0),d2					;$2410			;ff3bd0
	move.l	($0004,a0),d3				;$2628,$0004		;ff3bd2
	bra.w	Lff32d8					;$6000,$f700		;ff3bd6
Lff3bda:									;ff3bda
	move.l	(a0),d2					;$2410			;ff3bda
	move.l	($0004,a0),d3				;$2628,$0004		;ff3bdc
	bra.w	Lff33de					;$6000,$f7fc		;ff3be0
Call_KEYINP:									;ff3be4
	move.w	($0bca),d0				;$3038,$0bca		;ff3be4
	bne.s	Lff3c22					;$6638			;ff3be8
	bsr.w	Lff67d6					;$6100,$2bea		;ff3bea
	cmpi.b	#$02,($09dd)				;$0c38,$0002,$09dd	;ff3bee
	beq.s	Lff3c20					;$672a			;ff3bf4
	tst.b	($0bc6)					;$4a38,$0bc6		;ff3bf6
	beq.s	Lff3c36					;$673a			;ff3bfa
	movem.l	d1-d2,-(a7)				;$48e7,$6000		;ff3bfc
	bsr.w	Lff3c9c					;$6100,$009a		;ff3c00
	bne.s	Lff3c1c					;$6616			;ff3c04
	cmp.b	#$f0,d1					;$b23c,$00f0		;ff3c06
	beq.s	Lff3c12					;$6706			;ff3c0a
	bsr.w	Lff3cd4					;$6100,$00c6		;ff3c0c
	bra.s	Lff3c16					;$6004			;ff3c10
Lff3c12:									;ff3c12
	bsr.w	Lff4414					;$6100,$0800		;ff3c12
Lff3c16:									;ff3c16
	movem.l	(a7)+,d1-d2				;$4cdf,$0006		;ff3c16
	bra.s	Call_KEYINP				;$60c8			;ff3c1a
Lff3c1c:									;ff3c1c
	movem.l	(a7)+,d1-d2				;$4cdf,$0006		;ff3c1c
Lff3c20:									;ff3c20
	rts						;$4e75			;ff3c20

Lff3c22:									;ff3c22
	subq.w	#1,d0					;$5340			;ff3c22
	move.w	d0,($0bca)				;$31c0,$0bca		;ff3c24
	movea.l	($0bcc),a0				;$2078,$0bcc		;ff3c28
	clr.l	d0					;$4280			;ff3c2c
	move.w	(a0)+,d0				;$3018			;ff3c2e
	move.l	a0,($0bcc)				;$21c8,$0bcc		;ff3c30
Lff3c34:									;ff3c34
	rts						;$4e75			;ff3c34

Lff3c36:									;ff3c36
	cmp.w	#$6d00,d0				;$b07c,$6d00		;ff3c36
	bne.s	Lff3c34					;$66f8			;ff3c3a
	bsr.w	Lff4384					;$6100,$0746		;ff3c3c
	bra.s	Call_KEYINP				;$60a2			;ff3c40
Call_KEYSNS:									;ff3c42
	move.w	($0bca),d0				;$3038,$0bca		;ff3c42
	bne.s	Lff3c7c					;$6634			;ff3c46
Call_DENSNS:									;ff3c48
	bsr.w	Lff67ea					;$6100,$2ba0		;ff3c48
	cmpi.b	#$02,($09dd)				;$0c38,$0002,$09dd	;ff3c4c
	beq.s	Lff3c20					;$67cc			;ff3c52
	tst.b	($0bc6)					;$4a38,$0bc6		;ff3c54
	beq.s	Lff3c8a					;$6730			;ff3c58
	movem.l	d1-d2,-(a7)				;$48e7,$6000		;ff3c5a
	bsr.s	Lff3c9c					;$613c			;ff3c5e
	bne.s	Lff3c76					;$6614			;ff3c60
	bsr.w	Lff67d6					;$6100,$2b72		;ff3c62
	cmp.b	#$f0,d1					;$b23c,$00f0		;ff3c66
	beq.s	Lff3c70					;$6704			;ff3c6a
	bsr.s	Lff3cd4					;$6166			;ff3c6c
	bra.s	Lff3c74					;$6004			;ff3c6e
Lff3c70:									;ff3c70
	bsr.w	Lff4414					;$6100,$07a2		;ff3c70
Lff3c74:									;ff3c74
	clr.l	d0					;$4280			;ff3c74
Lff3c76:									;ff3c76
	movem.l	(a7)+,d1-d2				;$4cdf,$0006		;ff3c76
	rts						;$4e75			;ff3c7a

Lff3c7c:									;ff3c7c
	movea.l	($0bcc),a0				;$2078,$0bcc		;ff3c7c
	move.l	#$00010000,d0				;$203c,$0001,$0000	;ff3c80
	move.w	(a0),d0					;$3010			;ff3c86
	rts						;$4e75			;ff3c88

Lff3c8a:									;ff3c8a
	cmp.w	#$6d00,d0				;$b07c,$6d00		;ff3c8a
	bne.s	Lff3c9a					;$660a			;ff3c8e
	bsr.w	Lff67d6					;$6100,$2b44		;ff3c90
	bsr.w	Lff4384					;$6100,$06ee		;ff3c94
	clr.l	d0					;$4280			;ff3c98
Lff3c9a:									;ff3c9a
	rts						;$4e75			;ff3c9a

Lff3c9c:									;ff3c9c
	lea.l	(Lff456e,pc),a0				;$41fa,$08d0		;ff3c9c
	move.w	d0,d1					;$3200			;ff3ca0
	lsr.w	#8,d1					;$e049			;ff3ca2
	moveq.l	#$21,d2					;$7421			;ff3ca4
Lff3ca6:									;ff3ca6
	cmp.b	($0001,a0),d1				;$b228,$0001		;ff3ca6
	beq.s	Lff3cb6					;$670a			;ff3caa
	addq.l	#2,a0					;$5488			;ff3cac
	dbra.w	d2,Lff3ca6				;$51ca,$fff6		;ff3cae
Lff3cb2:									;ff3cb2
	moveq.l	#$ff,d2					;$74ff			;ff3cb2
	rts						;$4e75			;ff3cb4

Lff3cb6:									;ff3cb6
	move.b	(a0),d1					;$1210			;ff3cb6
	tst.b	($0bc7)					;$4a38,$0bc7		;ff3cb8
	bne.s	Lff3cca					;$660c			;ff3cbc
	cmp.b	#$41,d1					;$b23c,$0041		;ff3cbe
	bcs.s	Lff3cca					;$6506			;ff3cc2
	cmp.b	#$47,d1					;$b23c,$0047		;ff3cc4
	bcs.s	Lff3cb2					;$65e8			;ff3cc8
Lff3cca:									;ff3cca
	sub.w	#$0021,d2				;$947c,$0021		;ff3cca
	neg.w	d2					;$4442			;ff3cce
	cmp.b	d1,d1					;$b201			;ff3cd0
	rts						;$4e75			;ff3cd2

Lff3cd4:									;ff3cd4
	cmp.b	#$f4,d1					;$b23c,$00f4		;ff3cd4
	bne.s	Lff3cf0					;$6616			;ff3cd8
	clr.l	($0c08)					;$42b8,$0c08		;ff3cda
	clr.l	($0c0c)					;$42b8,$0c0c		;ff3cde
	clr.b	($0bc8)					;$4238,$0bc8		;ff3ce2
	clr.b	($0c1a)					;$4238,$0c1a		;ff3ce6
	bra.w	Lff42b8					;$6000,$05cc		;ff3cea
Lff3cee:									;ff3cee
	rts						;$4e75			;ff3cee

Lff3cf0:									;ff3cf0
	tst.b	($0c1a)					;$4a38,$0c1a		;ff3cf0
	bne.s	Lff3cee					;$66f8			;ff3cf4
	cmp.b	#$f1,d1					;$b23c,$00f1		;ff3cf6
	bne.s	Lff3d0a					;$660e			;ff3cfa
	bsr.w	Lff403c					;$6100,$033e		;ff3cfc
	move.b	#$01,($0bc7)				;$11fc,$0001,$0bc7	;ff3d00
	bra.w	Lff42c4					;$6000,$05bc		;ff3d06
Lff3d0a:									;ff3d0a
	cmp.b	#$f2,d1					;$b23c,$00f2		;ff3d0a
	bne.s	Lff3d1c					;$660c			;ff3d0e
	bsr.w	Lff403c					;$6100,$032a		;ff3d10
	clr.b	($0bc7)					;$4238,$0bc7		;ff3d14
	bra.w	Lff42c4					;$6000,$05aa		;ff3d18
Lff3d1c:									;ff3d1c
	cmp.b	#$f3,d1					;$b23c,$00f3		;ff3d1c
	bne.s	Lff3d38					;$6616			;ff3d20
	move.l	($0c00),($0c10)				;$21f8,$0c00,$0c10	;ff3d22
	move.l	($0c04),($0c14)				;$21f8,$0c04,$0c14	;ff3d28
	bclr.b	#$04,($0bc8)				;$08b8,$0004,$0bc8	;ff3d2e
	bra.w	Lff42c4					;$6000,$058e		;ff3d34
Lff3d38:									;ff3d38
	cmp.b	#$f5,d1					;$b23c,$00f5		;ff3d38
	bne.s	Lff3dae					;$6670			;ff3d3c
	bsr.w	Lff403c					;$6100,$02fc		;ff3d3e
	bsr.w	Lff40ba					;$6100,$0376		;ff3d42
	bsr.w	Lff42b8					;$6100,$0570		;ff3d46
	tst.b	($0c1a)					;$4a38,$0c1a		;ff3d4a
	bne.s	Lff3dac					;$665c			;ff3d4e
	movem.l	a1-a2,-(a7)				;$48e7,$0060		;ff3d50
	clr.w	d2					;$4242			;ff3d54
	lea.l	($0bd0),a1				;$43f8,$0bd0		;ff3d56
	move.l	a1,($0bcc)				;$21c9,$0bcc		;ff3d5a
	lea.l	($0c1b),a0				;$41f8,$0c1b		;ff3d5e
	cmpi.b	#$2e,($000f,a0)				;$0c28,$002e,$000f	;ff3d62
	beq.s	Lff3d78					;$670e			;ff3d68
	cmpi.b	#$20,($0010,a0)				;$0c28,$0020,$0010	;ff3d6a
	bne.s	Lff3d7c					;$660a			;ff3d70
	clr.b	($0010,a0)				;$4228,$0010		;ff3d72
	bra.s	Lff3d7c					;$6004			;ff3d76
Lff3d78:									;ff3d78
	clr.b	($000f,a0)				;$4228,$000f		;ff3d78
Lff3d7c:									;ff3d7c
	move.b	(a0)+,d0				;$1018			;ff3d7c
	beq.s	Lff3da4					;$6724			;ff3d7e
	cmp.b	#$20,d0					;$b03c,$0020		;ff3d80
	beq.s	Lff3d7c					;$67f6			;ff3d84
	lea.l	(Lff458c,pc),a2				;$45fa,$0804		;ff3d86
	moveq.l	#$12,d1					;$7212			;ff3d8a
Lff3d8c:									;ff3d8c
	cmp.b	(a2)+,d0				;$b01a			;ff3d8c
	beq.s	Lff3d98					;$6708			;ff3d8e
	addq.l	#1,a2					;$528a			;ff3d90
	dbra.w	d1,Lff3d8c				;$51c9,$fff8		;ff3d92
	bra.s	Lff3d7c					;$60e4			;ff3d96
Lff3d98:									;ff3d98
	asl.w	#8,d0					;$e140			;ff3d98
	move.b	(a2),d0					;$1012			;ff3d9a
	ror.w	#8,d0					;$e058			;ff3d9c
	move.w	d0,(a1)+				;$32c0			;ff3d9e
	addq.w	#1,d2					;$5242			;ff3da0
	bra.s	Lff3d7c					;$60d8			;ff3da2
Lff3da4:									;ff3da4
	move.w	d2,($0bca)				;$31c2,$0bca		;ff3da4
	movem.l	(a7)+,a1-a2				;$4cdf,$0600		;ff3da8
Lff3dac:									;ff3dac
	rts						;$4e75			;ff3dac

Lff3dae:									;ff3dae
	cmp.b	#$f6,d1					;$b23c,$00f6		;ff3dae
	bne.s	Lff3dc6					;$6612			;ff3db2
	clr.l	($0c10)					;$42b8,$0c10		;ff3db4
	clr.l	($0c14)					;$42b8,$0c14		;ff3db8
	bclr.b	#$04,($0bc8)				;$08b8,$0004,$0bc8	;ff3dbc
	bra.w	Lff42c4					;$6000,$0500		;ff3dc2
Lff3dc6:									;ff3dc6
	cmp.b	#$f7,d1					;$b23c,$00f7		;ff3dc6
	bne.s	Lff3e06					;$663a			;ff3dca
	bsr.w	Lff403c					;$6100,$026e		;ff3dcc
	bsr.w	Lff40ba					;$6100,$02e8		;ff3dd0
	movem.l	d2-d3,-(a7)				;$48e7,$3000		;ff3dd4
	move.l	($0c00),d0				;$2038,$0c00		;ff3dd8
	move.l	($0c04),d1				;$2238,$0c04		;ff3ddc
	move.l	($0c08),d2				;$2438,$0c08		;ff3de0
	move.l	($0c0c),d3				;$2638,$0c0c		;ff3de4
	bsr.w	Lff3146					;$6100,$f35c		;ff3de8
	bcs.s	Lff3dfe					;$6510			;ff3dec
	move.l	d0,($0c00)				;$21c0,$0c00		;ff3dee
	move.l	d1,($0c04)				;$21c1,$0c04		;ff3df2
Lff3df6:									;ff3df6
	movem.l	(a7)+,d2-d3				;$4cdf,$000c		;ff3df6
	bra.w	Lff42b8					;$6000,$04bc		;ff3dfa
Lff3dfe:									;ff3dfe
	move.b	#$01,($0c1a)				;$11fc,$0001,$0c1a	;ff3dfe
	bra.s	Lff3df6					;$60f0			;ff3e04
Lff3e06:									;ff3e06
	cmp.b	#$f8,d1					;$b23c,$00f8		;ff3e06
	bne.s	Lff3e46					;$663a			;ff3e0a
	bsr.w	Lff403c					;$6100,$022e		;ff3e0c
	bsr.w	Lff40ba					;$6100,$02a8		;ff3e10
	movem.l	d2-d3,-(a7)				;$48e7,$3000		;ff3e14
	move.l	($0c00),d0				;$2038,$0c00		;ff3e18
	move.l	($0c04),d1				;$2238,$0c04		;ff3e1c
	move.l	($0c08),d2				;$2438,$0c08		;ff3e20
	move.l	($0c0c),d3				;$2638,$0c0c		;ff3e24
	bsr.w	Lff31f4					;$6100,$f3ca		;ff3e28
	bcs.s	Lff3e3e					;$6510			;ff3e2c
	move.l	d0,($0c00)				;$21c0,$0c00		;ff3e2e
	move.l	d1,($0c04)				;$21c1,$0c04		;ff3e32
Lff3e36:									;ff3e36
	movem.l	(a7)+,d2-d3				;$4cdf,$000c		;ff3e36
	bra.w	Lff42b8					;$6000,$047c		;ff3e3a
Lff3e3e:									;ff3e3e
	move.b	#$01,($0c1a)				;$11fc,$0001,$0c1a	;ff3e3e
	bra.s	Lff3e36					;$60f0			;ff3e44
Lff3e46:									;ff3e46
	cmp.b	#$f9,d1					;$b23c,$00f9		;ff3e46
	bne.s	Lff3e58					;$660c			;ff3e4a
	clr.l	($0c00)					;$42b8,$0c00		;ff3e4c
	clr.l	($0c04)					;$42b8,$0c04		;ff3e50
	bra.w	Lff42cc					;$6000,$0476		;ff3e54
Lff3e58:									;ff3e58
	cmp.b	#$fa,d1					;$b23c,$00fa		;ff3e58
	bne.s	Lff3eb4					;$6656			;ff3e5c
	tst.w	($0c18)					;$4a78,$0c18		;ff3e5e
	beq.s	Lff3eb2					;$674e			;ff3e62
	tst.b	($0bc9)					;$4a38,$0bc9		;ff3e64
	beq.s	Lff3e84					;$671a			;ff3e68
	movem.l	d0/a0-a1,-(a7)				;$48e7,$80c0		;ff3e6a
	lea.l	($0c2a),a0				;$41f8,$0c2a		;ff3e6e
	cmpi.b	#$2e,(a0)				;$0c10,$002e		;ff3e72
	beq.s	Lff3e7e					;$6706			;ff3e76
	subq.l	#1,a0					;$5388			;ff3e78
	moveq.l	#$0e,d0					;$700e			;ff3e7a
	bra.s	Lff3e8e					;$6010			;ff3e7c
Lff3e7e:									;ff3e7e
	clr.b	($0bc9)					;$4238,$0bc9		;ff3e7e
	bra.s	Lff3eaa					;$6026			;ff3e82
Lff3e84:									;ff3e84
	movem.l	d0/a0-a1,-(a7)				;$48e7,$80c0		;ff3e84
	lea.l	($0c28),a0				;$41f8,$0c28		;ff3e88
	moveq.l	#$0d,d0					;$700d			;ff3e8c
Lff3e8e:									;ff3e8e
	move.b	(a0),($0001,a0)				;$1150,$0001		;ff3e8e
	subq.l	#1,a0					;$5388			;ff3e92
	dbra.w	d0,Lff3e8e				;$51c8,$fff8		;ff3e94
	lea.l	($0c29),a0				;$41f8,$0c29		;ff3e98
	cmpi.b	#$20,(a0)				;$0c10,$0020		;ff3e9c
	bne.s	Lff3ea6					;$6604			;ff3ea0
	move.b	#$30,(a0)				;$10bc,$0030		;ff3ea2
Lff3ea6:									;ff3ea6
	bsr.w	Lff42cc					;$6100,$0424		;ff3ea6
Lff3eaa:									;ff3eaa
	subq.w	#1,($0c18)				;$5378,$0c18		;ff3eaa
	movem.l	(a7)+,d0/a0-a1				;$4cdf,$0301		;ff3eae
Lff3eb2:									;ff3eb2
	rts						;$4e75			;ff3eb2

Lff3eb4:									;ff3eb4
	cmp.b	#$fb,d1					;$b23c,$00fb		;ff3eb4
	bne.s	Lff3edc					;$6622			;ff3eb8
	bsr.w	Lff403c					;$6100,$0180		;ff3eba
	move.l	($0c10),d0				;$2038,$0c10		;ff3ebe
	move.l	($0c14),d1				;$2238,$0c14		;ff3ec2
	bsr.w	Lff3132					;$6100,$f26a		;ff3ec6
	move.l	d0,($0c10)				;$21c0,$0c10		;ff3eca
	move.l	d1,($0c14)				;$21c1,$0c14		;ff3ece
	bclr.b	#$04,($0bc8)				;$08b8,$0004,$0bc8	;ff3ed2
	bra.w	Lff42c4					;$6000,$03ea		;ff3ed8
Lff3edc:									;ff3edc
	cmp.b	#$3d,d1					;$b23c,$003d		;ff3edc
	bne.s	Lff3eee					;$660c			;ff3ee0
	bsr.w	Lff403c					;$6100,$0158		;ff3ee2
	bsr.w	Lff40ba					;$6100,$01d2		;ff3ee6
	bra.w	Lff42b8					;$6000,$03cc		;ff3eea
Lff3eee:									;ff3eee
	cmp.b	#$2b,d1					;$b23c,$002b		;ff3eee
	bne.s	Lff3f06					;$6612			;ff3ef2
	bsr.w	Lff403c					;$6100,$0146		;ff3ef4
	bsr.w	Lff40ba					;$6100,$01c0		;ff3ef8
	move.b	#$11,($0bc8)				;$11fc,$0011,$0bc8	;ff3efc
	bra.w	Lff42b8					;$6000,$03b4		;ff3f02
Lff3f06:									;ff3f06
	cmp.b	#$2d,d1					;$b23c,$002d		;ff3f06
	bne.s	Lff3f1e					;$6612			;ff3f0a
	bsr.w	Lff403c					;$6100,$012e		;ff3f0c
	bsr.w	Lff40ba					;$6100,$01a8		;ff3f10
	move.b	#$12,($0bc8)				;$11fc,$0012,$0bc8	;ff3f14
	bra.w	Lff42b8					;$6000,$039c		;ff3f1a
Lff3f1e:									;ff3f1e
	cmp.b	#$2a,d1					;$b23c,$002a		;ff3f1e
	bne.s	Lff3f36					;$6612			;ff3f22
	bsr.w	Lff403c					;$6100,$0116		;ff3f24
	bsr.w	Lff40ba					;$6100,$0190		;ff3f28
	move.b	#$13,($0bc8)				;$11fc,$0013,$0bc8	;ff3f2c
	bra.w	Lff42b8					;$6000,$0384		;ff3f32
Lff3f36:									;ff3f36
	cmp.b	#$2f,d1					;$b23c,$002f		;ff3f36
	bne.s	Lff3f4e					;$6612			;ff3f3a
	bsr.w	Lff403c					;$6100,$00fe		;ff3f3c
	bsr.w	Lff40ba					;$6100,$0178		;ff3f40
	move.b	#$14,($0bc8)				;$11fc,$0014,$0bc8	;ff3f44
	bra.w	Lff42b8					;$6000,$036c		;ff3f4a
Lff3f4e:									;ff3f4e
	cmpi.w	#$0001,($0c18)				;$0c78,$0001,$0c18	;ff3f4e
	bne.s	Lff3f62					;$660c			;ff3f54
	cmpi.b	#$30,($0c29)				;$0c38,$0030,$0c29	;ff3f56
	bne.s	Lff3f62					;$6604			;ff3f5c
	clr.w	($0c18)					;$4278,$0c18		;ff3f5e
Lff3f62:									;ff3f62
	tst.w	($0c18)					;$4a78,$0c18		;ff3f62
	bne.s	Lff3f6e					;$6606			;ff3f66
	move.b	#$00,($0bc9)				;$11fc,$0000,$0bc9	;ff3f68
Lff3f6e:									;ff3f6e
	tst.b	($0bc7)					;$4a38,$0bc7		;ff3f6e
	beq.s	Lff3f86					;$6712			;ff3f72
	cmp.b	#$2e,d1					;$b23c,$002e		;ff3f74
	beq.s	Lff3ff4					;$677a			;ff3f78
	cmpi.w	#$0008,($0c18)				;$0c78,$0008,$0c18	;ff3f7a
	bcc.s	Lff3ff4					;$6472			;ff3f80
	moveq.l	#$0d,d0					;$700d			;ff3f82
	bra.s	Lff3fa2					;$601c			;ff3f84
Lff3f86:									;ff3f86
	cmp.b	#$40,d1					;$b23c,$0040		;ff3f86
	bcc.s	Lff3ff4					;$6468			;ff3f8a
	tst.b	($0bc9)					;$4a38,$0bc9		;ff3f8c
	beq.s	Lff3fc2					;$6730			;ff3f90
	cmp.b	#$2e,d1					;$b23c,$002e		;ff3f92
	beq.s	Lff3ff4					;$675c			;ff3f96
	moveq.l	#$0e,d0					;$700e			;ff3f98
	cmpi.w	#$000f,($0c18)				;$0c78,$000f,$0c18	;ff3f9a
	bcc.s	Lff3ff4					;$6452			;ff3fa0
Lff3fa2:									;ff3fa2
	tst.w	($0c18)					;$4a78,$0c18		;ff3fa2
	bne.s	Lff3faa					;$6602			;ff3fa6
	bsr.s	Lff3ff6					;$614c			;ff3fa8
Lff3faa:									;ff3faa
	addq.w	#1,($0c18)				;$5278,$0c18		;ff3faa
	lea.l	($0c1b),a0				;$41f8,$0c1b		;ff3fae
Lff3fb2:									;ff3fb2
	move.b	($0001,a0),(a0)				;$10a8,$0001		;ff3fb2
	addq.l	#1,a0					;$5288			;ff3fb6
	dbra.w	d0,Lff3fb2				;$51c8,$fff8		;ff3fb8
	move.b	d1,(a0)					;$1081			;ff3fbc
	bra.w	Lff42cc					;$6000,$030c		;ff3fbe
Lff3fc2:									;ff3fc2
	cmpi.w	#$000e,($0c18)				;$0c78,$000e,$0c18	;ff3fc2
	bcc.s	Lff3ff4					;$642a			;ff3fc8
	moveq.l	#$0d,d0					;$700d			;ff3fca
	cmp.b	#$2e,d1					;$b23c,$002e		;ff3fcc
	bne.s	Lff3fa2					;$66d0			;ff3fd0
	addq.w	#1,($0c18)				;$5278,$0c18		;ff3fd2
	move.b	#$01,($0bc9)				;$11fc,$0001,$0bc9	;ff3fd6
	cmpi.w	#$0001,($0c18)				;$0c78,$0001,$0c18	;ff3fdc
	bne.s	Lff3ff4					;$6610			;ff3fe2
	addq.w	#1,($0c18)				;$5278,$0c18		;ff3fe4
	bsr.s	Lff3ff6					;$610c			;ff3fe8
	move.b	#$30,($0c29)				;$11fc,$0030,$0c29	;ff3fea
	bra.w	Lff42cc					;$6000,$02da		;ff3ff0
Lff3ff4:									;ff3ff4
	rts						;$4e75			;ff3ff4

Lff3ff6:									;ff3ff6
	lea.l	($0c1b),a0				;$41f8,$0c1b		;ff3ff6
	move.l	d0,-(a7)				;$2f00			;ff3ffa
	moveq.l	#$0e,d0					;$700e			;ff3ffc
Lff3ffe:									;ff3ffe
	move.b	#$20,(a0)+				;$10fc,$0020		;ff3ffe
	dbra.w	d0,Lff3ffe				;$51c8,$fffa		;ff4002
	move.b	#$2e,(a0)+				;$10fc,$002e		;ff4006
	move.b	#$20,(a0)+				;$10fc,$0020		;ff400a
	move.b	#$20,(a0)+				;$10fc,$0020		;ff400e
	tst.b	($0bc7)					;$4a38,$0bc7		;ff4012
	bne.s	Lff402a					;$6612			;ff4016
	move.b	#$44,(a0)+				;$10fc,$0044		;ff4018
	move.b	#$45,(a0)+				;$10fc,$0045		;ff401c
	move.b	#$43,(a0)+				;$10fc,$0043		;ff4020
	clr.b	(a0)+					;$4218			;ff4024
	move.l	(a7)+,d0				;$201f			;ff4026
	rts						;$4e75			;ff4028

Lff402a:									;ff402a
	move.b	#$48,(a0)+				;$10fc,$0048		;ff402a
	move.b	#$45,(a0)+				;$10fc,$0045		;ff402e
	move.b	#$58,(a0)+				;$10fc,$0058		;ff4032
	clr.b	(a0)+					;$4218			;ff4036
	move.l	(a7)+,d0				;$201f			;ff4038
	rts						;$4e75			;ff403a

Lff403c:									;ff403c
	tst.w	($0c18)					;$4a78,$0c18		;ff403c
	beq.s	Lff4066					;$6724			;ff4040
	bclr.b	#$04,($0bc8)				;$08b8,$0004,$0bc8	;ff4042
	movem.l	d0-d1/a0,-(a7)				;$48e7,$c080		;ff4048
	lea.l	($0c1b),a0				;$41f8,$0c1b		;ff404c
	tst.b	($0bc7)					;$4a38,$0bc7		;ff4050
	bne.s	Lff4068					;$6612			;ff4054
	bsr.w	Lff35de					;$6100,$f586		;ff4056
Lff405a:									;ff405a
	move.l	d0,($0c10)				;$21c0,$0c10		;ff405a
	move.l	d1,($0c14)				;$21c1,$0c14		;ff405e
	movem.l	(a7)+,d0-d1/a0				;$4cdf,$0103		;ff4062
Lff4066:									;ff4066
	rts						;$4e75			;ff4066

Lff4068:									;ff4068
	clr.l	d1					;$4281			;ff4068
	clr.l	d0					;$4280			;ff406a
Lff406c:									;ff406c
	move.b	(a0)+,d0				;$1018			;ff406c
	beq.s	Lff40b2					;$6742			;ff406e
	cmp.b	#$20,d0					;$b03c,$0020		;ff4070
	beq.s	Lff406c					;$67f6			;ff4074
Lff4076:									;ff4076
	cmp.b	#$30,d0					;$b03c,$0030		;ff4076
	bcs.s	Lff40b2					;$6536			;ff407a
	cmp.b	#$3a,d0					;$b03c,$003a		;ff407c
	bcs.s	Lff40a6					;$6524			;ff4080
	cmp.b	#$41,d0					;$b03c,$0041		;ff4082
	bcs.s	Lff40b2					;$652a			;ff4086
	cmp.b	#$47,d0					;$b03c,$0047		;ff4088
	bcs.s	Lff40a0					;$6512			;ff408c
	cmp.b	#$61,d0					;$b03c,$0061		;ff408e
	bcs.s	Lff40b2					;$651e			;ff4092
	cmp.b	#$67,d0					;$b03c,$0067		;ff4094
	bcc.s	Lff40b2					;$6418			;ff4098
	sub.b	#$57,d0					;$903c,$0057		;ff409a
	bra.s	Lff40aa					;$600a			;ff409e
Lff40a0:									;ff40a0
	sub.b	#$37,d0					;$903c,$0037		;ff40a0
	bra.s	Lff40aa					;$6004			;ff40a4
Lff40a6:									;ff40a6
	sub.b	#$30,d0					;$903c,$0030		;ff40a6
Lff40aa:									;ff40aa
	asl.l	#4,d1					;$e981			;ff40aa
	add.l	d0,d1					;$d280			;ff40ac
	move.b	(a0)+,d0				;$1018			;ff40ae
	bra.s	Lff4076					;$60c4			;ff40b0
Lff40b2:									;ff40b2
	move.l	d1,d0					;$2001			;ff40b2
	bsr.w	Lff2f5c					;$6100,$eea6		;ff40b4
	bra.s	Lff405a					;$60a0			;ff40b8
Lff40ba:									;ff40ba
	movem.l	d0-d4,-(a7)				;$48e7,$f800		;ff40ba
	move.b	($0bc8),d4				;$1838,$0bc8		;ff40be
	move.l	($0c08),d0				;$2038,$0c08		;ff40c2
	move.l	($0c0c),d1				;$2238,$0c0c		;ff40c6
	move.l	($0c10),d2				;$2438,$0c10		;ff40ca
	move.l	($0c14),d3				;$2638,$0c14		;ff40ce
	bsr.s	Lff40f0					;$611c			;ff40d2
	bcs.s	Lff40e8					;$6512			;ff40d4
	move.l	d0,($0c08)				;$21c0,$0c08		;ff40d6
	move.l	d1,($0c0c)				;$21c1,$0c0c		;ff40da
Lff40de:									;ff40de
	clr.b	($0bc8)					;$4238,$0bc8		;ff40de
	movem.l	(a7)+,d0-d4				;$4cdf,$001f		;ff40e2
	rts						;$4e75			;ff40e6

Lff40e8:									;ff40e8
	move.b	#$01,($0c1a)				;$11fc,$0001,$0c1a	;ff40e8
	bra.s	Lff40de					;$60ee			;ff40ee
Lff40f0:									;ff40f0
	subq.b	#1,d4					;$5304			;ff40f0
	beq.w	Lff3146					;$6700,$f052		;ff40f2
	subq.b	#1,d4					;$5304			;ff40f6
	beq.w	Lff31f4					;$6700,$f0fa		;ff40f8
	subq.b	#1,d4					;$5304			;ff40fc
	beq.w	Lff32d8					;$6700,$f1d8		;ff40fe
	subq.b	#1,d4					;$5304			;ff4102
	beq.w	Lff33de					;$6700,$f2d8		;ff4104
	move.l	d2,d0					;$2002			;ff4108
	move.l	d3,d1					;$2203			;ff410a
	or.l	d3,d3					;$8683			;ff410c
	rts						;$4e75			;ff410e

Lff4110:									;ff4110
	movem.l	d0-d2/a0-a1,-(a7)			;$48e7,$e0c0		;ff4110
	lea.l	(-$0014,a7),a7				;$4fef,$ffec		;ff4114
	bsr.w	Lff3ff6					;$6100,$fedc		;ff4118
	move.l	($0c10),d0				;$2038,$0c10		;ff411c
	move.l	($0c14),d1				;$2238,$0c14		;ff4120
	tst.b	($0c1a)					;$4a38,$0c1a		;ff4124
	bne.w	Lff41ba					;$6600,$0090		;ff4128
	tst.b	($0bc7)					;$4a38,$0bc7		;ff412c
	bne.w	Lff4250					;$6600,$011e		;ff4130
	moveq.l	#$0e,d2					;$740e			;ff4134
	movea.l	a7,a0					;$204f			;ff4136
	bsr.w	Lff39a4					;$6100,$f86a		;ff4138
	cmp.l	#$0000000f,d0				;$b0bc,$0000,$000f	;ff413c
	bcs.w	Lff41d4					;$6500,$0090		;ff4142
	cmp.l	#$fffffff4,d0				;$b0bc,$ffff,$fff4	;ff4146
	bcc.w	Lff41d4					;$6400,$0086		;ff414c
	movea.l	a7,a0					;$204f			;ff4150
	lea.l	($0c1b),a1				;$43f8,$0c1b		;ff4152
	move.l	d0,-(a7)				;$2f00			;ff4156
	bsr.w	Lff42a8					;$6100,$014e		;ff4158
	bsr.w	Lff429a					;$6100,$013c		;ff415c
	move.b	d0,(a1)+				;$12c0			;ff4160
	move.b	#$2e,(a1)+				;$12fc,$002e		;ff4162
	moveq.l	#$0c,d2					;$740c			;ff4166
Lff4168:									;ff4168
	bsr.w	Lff429a					;$6100,$0130		;ff4168
	move.b	d0,(a1)+				;$12c0			;ff416c
	dbra.w	d2,Lff4168				;$51ca,$fff8		;ff416e
	move.l	(a7)+,d2				;$241f			;ff4172
	move.b	#$45,(a1)+				;$12fc,$0045		;ff4174
	move.b	#$2b,d0					;$103c,$002b		;ff4178
	subq.l	#1,d2					;$5382			;ff417c
	bpl.s	Lff4186					;$6a06			;ff417e
	neg.l	d2					;$4482			;ff4180
	move.b	#$2d,d0					;$103c,$002d		;ff4182
Lff4186:									;ff4186
	move.b	d0,(a1)+				;$12c0			;ff4186
	divu.w	#$0064,d2				;$84fc,$0064		;ff4188
	add.b	#$30,d2					;$d43c,$0030		;ff418c
	move.b	d2,(a1)+				;$12c2			;ff4190
	clr.w	d2					;$4242			;ff4192
	swap.w	d2					;$4842			;ff4194
	divu.w	#$000a,d2				;$84fc,$000a		;ff4196
	add.b	#$30,d2					;$d43c,$0030		;ff419a
	move.b	d2,(a1)+				;$12c2			;ff419e
	swap.w	d2					;$4842			;ff41a0
	add.b	#$30,d2					;$d43c,$0030		;ff41a2
	move.b	d2,(a1)+				;$12c2			;ff41a6
	clr.b	(a1)+					;$4219			;ff41a8
Lff41aa:									;ff41aa
	lea.l	($0014,a7),a7				;$4fef,$0014		;ff41aa
	movem.l	(a7)+,d0-d2/a0-a1			;$4cdf,$0307		;ff41ae
	rts						;$4e75			;ff41b2

Lff41b4:									;ff41b4
	move.b	#$01,($0c1a)				;$11fc,$0001,$0c1a	;ff41b4
Lff41ba:									;ff41ba
	lea.l	($0c26),a1				;$43f8,$0c26		;ff41ba
	move.b	#$2d,(a1)+				;$12fc,$002d		;ff41be
	move.b	#$20,(a1)+				;$12fc,$0020		;ff41c2
	move.b	#$45,(a1)+				;$12fc,$0045		;ff41c6
	move.b	#$20,(a1)+				;$12fc,$0020		;ff41ca
	move.b	#$2d,(a1)				;$12bc,$002d		;ff41ce
	bra.s	Lff41aa					;$60d6			;ff41d2
Lff41d4:									;ff41d4
	movea.l	a7,a0					;$204f			;ff41d4
	lea.l	(-$0016,a7),a7				;$4fef,$ffea		;ff41d6
	movea.l	a7,a1					;$224f			;ff41da
	bsr.w	Lff42a8					;$6100,$00ca		;ff41dc
	move.l	d0,d1					;$2200			;ff41e0
	moveq.l	#$0f,d2					;$740f			;ff41e2
	subq.l	#1,d1					;$5381			;ff41e4
	bmi.s	Lff41f6					;$6b0e			;ff41e6
Lff41e8:									;ff41e8
	bsr.w	Lff429a					;$6100,$00b0		;ff41e8
	move.b	d0,(a1)+				;$12c0			;ff41ec
	subq.l	#1,d2					;$5382			;ff41ee
	dbra.w	d1,Lff41e8				;$51c9,$fff6		;ff41f0
	bra.s	Lff420c					;$6016			;ff41f4
Lff41f6:									;ff41f6
	move.b	#$30,(a1)+				;$12fc,$0030		;ff41f6
	subq.l	#1,d2					;$5382			;ff41fa
	move.b	#$2e,(a1)+				;$12fc,$002e		;ff41fc
Lff4200:									;ff4200
	subq.l	#1,d2					;$5382			;ff4200
	addq.l	#1,d1					;$5281			;ff4202
	beq.s	Lff4212					;$670c			;ff4204
	move.b	#$30,(a1)+				;$12fc,$0030		;ff4206
	bra.s	Lff4200					;$60f4			;ff420a
Lff420c:									;ff420c
	move.b	#$2e,(a1)+				;$12fc,$002e		;ff420c
	subq.l	#1,d2					;$5382			;ff4210
Lff4212:									;ff4212
	move.b	(a0)+,(a1)+				;$12d8			;ff4212
	beq.s	Lff421c					;$6706			;ff4214
	dbra.w	d2,Lff4212				;$51ca,$fffa		;ff4216
	clr.b	(a1)+					;$4219			;ff421a
Lff421c:									;ff421c
	subq.l	#1,a1					;$5389			;ff421c
Lff421e:									;ff421e
	move.b	-(a1),d0				;$1021			;ff421e
	cmp.b	#$30,d0					;$b03c,$0030		;ff4220
	beq.s	Lff421e					;$67f8			;ff4224
	addq.l	#1,a1					;$5289			;ff4226
	clr.b	(a1)					;$4211			;ff4228
	suba.l	a7,a1					;$93cf			;ff422a
	moveq.l	#$10,d0					;$7010			;ff422c
	sub.l	a1,d0					;$9089			;ff422e
	bpl.s	Lff4234					;$6a02			;ff4230
	clr.l	d0					;$4280			;ff4232
Lff4234:									;ff4234
	lea.l	($0c1b),a1				;$43f8,$0c1b		;ff4234
	adda.l	d0,a1					;$d3c0			;ff4238
	movea.l	a7,a0					;$204f			;ff423a
	moveq.l	#$0f,d1					;$720f			;ff423c
Lff423e:									;ff423e
	move.b	(a0)+,d0				;$1018			;ff423e
	beq.s	Lff4248					;$6706			;ff4240
	move.b	d0,(a1)+				;$12c0			;ff4242
	dbra.w	d1,Lff423e				;$51c9,$fff8		;ff4244
Lff4248:									;ff4248
	lea.l	($0016,a7),a7				;$4fef,$0016		;ff4248
	bra.w	Lff41aa					;$6000,$ff5c		;ff424c
Lff4250:									;ff4250
	bsr.w	Lff2f88					;$6100,$ed36		;ff4250
	bcs.w	Lff41b4					;$6500,$ff5e		;ff4254
	lea.l	($0c22),a1				;$43f8,$0c22		;ff4258
	move.l	d0,d1					;$2200			;ff425c
	moveq.l	#$07,d2					;$7407			;ff425e
	clr.l	d0					;$4280			;ff4260
Lff4262:									;ff4262
	rol.l	#4,d1					;$e999			;ff4262
	move.b	d1,d0					;$1001			;ff4264
	and.b	#$0f,d0					;$c03c,$000f		;ff4266
	add.b	#$30,d0					;$d03c,$0030		;ff426a
	cmp.b	#$3a,d0					;$b03c,$003a		;ff426e
	bcs.s	Lff4276					;$6502			;ff4272
	addq.b	#7,d0					;$5e00			;ff4274
Lff4276:									;ff4276
	btst.l	#$08,d0					;$0800,$0008		;ff4276
	bne.s	Lff4294					;$6618			;ff427a
	cmp.b	#$30,d0					;$b03c,$0030		;ff427c
	bne.s	Lff4294					;$6612			;ff4280
	tst.w	d2					;$4a42			;ff4282
	beq.s	Lff4294					;$670e			;ff4284
	move.b	#$20,d0					;$103c,$0020		;ff4286
Lff428a:									;ff428a
	move.b	d0,(a1)+				;$12c0			;ff428a
	dbra.w	d2,Lff4262				;$51ca,$ffd4		;ff428c
	bra.w	Lff41aa					;$6000,$ff18		;ff4290
Lff4294:									;ff4294
	bset.l	#$08,d0					;$08c0,$0008		;ff4294
	bra.s	Lff428a					;$60f0			;ff4298
Lff429a:									;ff429a
	move.b	(a0),d0					;$1010			;ff429a
	beq.s	Lff42a2					;$6704			;ff429c
	addq.l	#1,a0					;$5288			;ff429e
	rts						;$4e75			;ff42a0

Lff42a2:									;ff42a2
	move.b	#$30,d0					;$103c,$0030		;ff42a2
	rts						;$4e75			;ff42a6

Lff42a8:									;ff42a8
	tst.b	d1					;$4a01			;ff42a8
	beq.s	Lff42b2					;$6706			;ff42aa
	move.b	#$2d,(a1)+				;$12fc,$002d		;ff42ac
	rts						;$4e75			;ff42b0

Lff42b2:									;ff42b2
	move.b	#$20,(a1)+				;$12fc,$0020		;ff42b2
	rts						;$4e75			;ff42b6

Lff42b8:									;ff42b8
	move.l	($0c08),($0c10)				;$21f8,$0c08,$0c10	;ff42b8
	move.l	($0c0c),($0c14)				;$21f8,$0c0c,$0c14	;ff42be
Lff42c4:									;ff42c4
	bsr.w	Lff4110					;$6100,$fe4a		;ff42c4
	clr.w	($0c18)					;$4278,$0c18		;ff42c8
Lff42cc:									;ff42cc
	movem.l	d0-d4/a0-a1,-(a7)			;$48e7,$f8c0		;ff42cc
	move.b	#$01,($09dd)				;$11fc,$0001,$09dd	;ff42d0
	bsr.w	Call_MS_STAT				;$6100,$67e0		;ff42d6
	move.w	d0,-(a7)				;$3f00			;ff42da
	bsr.w	Call_MS_CUROF				;$6100,$67ac		;ff42dc
	lea.l	(-$000c,a7),a7				;$4fef,$fff4		;ff42e0
	movea.l	a7,a1					;$224f			;ff42e4
	move.b	#$f0,(a1)				;$12bc,$00f0		;ff42e6
	moveq.l	#$20,d1					;$7220			;ff42ea
	move.l	($0c00),d0				;$2038,$0c00		;ff42ec
	or.l	($0c04),d0				;$80b8,$0c04		;ff42f0
	beq.s	Lff42f8					;$6702			;ff42f4
	moveq.l	#$4d,d1					;$724d			;ff42f6
Lff42f8:									;ff42f8
	move.b	d1,($0001,a1)				;$1341,$0001		;ff42f8
	move.b	#$f2,($0002,a1)				;$137c,$00f2,$0002	;ff42fc
	move.b	($0bc8),d0				;$1038,$0bc8		;ff4302
	and.b	#$07,d0					;$c03c,$0007		;ff4306
	moveq.l	#$2b,d1					;$722b			;ff430a
	subq.b	#1,d0					;$5300			;ff430c
	beq.s	Lff4324					;$6714			;ff430e
	moveq.l	#$2d,d1					;$722d			;ff4310
	subq.b	#1,d0					;$5300			;ff4312
	beq.s	Lff4324					;$670e			;ff4314
	moveq.l	#$2a,d1					;$722a			;ff4316
	subq.b	#1,d0					;$5300			;ff4318
	beq.s	Lff4324					;$6708			;ff431a
	moveq.l	#$2f,d1					;$722f			;ff431c
	subq.b	#1,d0					;$5300			;ff431e
	beq.s	Lff4324					;$6702			;ff4320
	moveq.l	#$20,d1					;$7220			;ff4322
Lff4324:									;ff4324
	move.b	d1,($0003,a1)				;$1341,$0003		;ff4324
	move.w	($0bfc),d1				;$3238,$0bfc		;ff4328
	move.w	($0bfe),d2				;$3438,$0bfe		;ff432c
	moveq.l	#$01,d3					;$7601			;ff4330
	bsr.w	Lff44ac					;$6100,$0178		;ff4332
	move.w	($0bfc),d1				;$3238,$0bfc		;ff4336
	move.w	($0bfe),d2				;$3438,$0bfe		;ff433a
	add.w	#$0010,d1				;$d27c,$0010		;ff433e
	moveq.l	#$0f,d3					;$760f			;ff4342
	lea.l	($0c1b),a1				;$43f8,$0c1b		;ff4344
	bsr.w	Lff44ac					;$6100,$0162		;ff4348
	lea.l	($0c2b),a0				;$41f8,$0c2b		;ff434c
	movea.l	a7,a1					;$224f			;ff4350
	moveq.l	#$04,d4					;$7804			;ff4352
Lff4354:									;ff4354
	move.b	#$f2,(a1)+				;$12fc,$00f2		;ff4354
	move.b	(a0)+,(a1)+				;$12d8			;ff4358
	dbra.w	d4,Lff4354				;$51cc,$fff8		;ff435a
	move.w	($0bfc),d1				;$3238,$0bfc		;ff435e
	move.w	($0bfe),d2				;$3438,$0bfe		;ff4362
	add.w	#$0090,d1				;$d27c,$0090		;ff4366
	moveq.l	#$04,d3					;$7604			;ff436a
	movea.l	a7,a1					;$224f			;ff436c
	bsr.w	Lff44ac					;$6100,$013c		;ff436e
	lea.l	($000c,a7),a7				;$4fef,$000c		;ff4372
	move.w	(a7)+,d0				;$301f			;ff4376
	beq.s	Lff437e					;$6704			;ff4378
	bsr.w	Call_MS_CURON				;$6100,$66e0		;ff437a
Lff437e:									;ff437e
	movem.l	(a7)+,d0-d4/a0-a1			;$4cdf,$031f		;ff437e
	rts						;$4e75			;ff4382

Lff4384:									;ff4384
	movem.l	d1-d7/a0-a6,-(a7)			;$48e7,$7ffe		;ff4384
	move.b	#$01,($0bc6)				;$11fc,$0001,$0bc6	;ff4388
	move.b	#$01,($09dd)				;$11fc,$0001,$09dd	;ff438e
	bsr.w	Lff448e					;$6100,$00f8		;ff4394
	btst.b	#$00,($0bbf)				;$0838,$0000,$0bbf	;ff4398
	beq.s	Lff43b2					;$6712			;ff439e
	bsr.w	Lff500e					;$6100,$0c6c		;ff43a0
	move.w	($0bb0),d0				;$3038,$0bb0		;ff43a4
	move.w	($0bb2),d1				;$3238,$0bb2		;ff43a8
	addq.w	#2,d1					;$5441			;ff43ac
	add.w	#$00b8,d0				;$d07c,$00b8		;ff43ae
Lff43b2:									;ff43b2
	move.w	d0,($0bfc)				;$31c0,$0bfc		;ff43b2
	move.w	d1,($0bfe)				;$31c1,$0bfe		;ff43b6
	bsr.w	Call_MS_STAT				;$6100,$66fc		;ff43ba
	move.w	d0,-(a7)				;$3f00			;ff43be
	bsr.w	Call_MS_CUROF				;$6100,$66c8		;ff43c0
	move.w	#$ffff,-(a7)				;$3f3c,$ffff		;ff43c4
	move.w	#$0010,-(a7)				;$3f3c,$0010		;ff43c8
	move.w	#$00b8,-(a7)				;$3f3c,$00b8		;ff43cc
	move.w	($0bfe),-(a7)				;$3f38,$0bfe		;ff43d0
	move.w	($0bfc),-(a7)				;$3f38,$0bfc		;ff43d4
	move.w	#$0002,-(a7)				;$3f3c,$0002		;ff43d8
	bsr.w	Lff67c4					;$6100,$23e6		;ff43dc
	lea.l	($000c,a7),a7				;$4fef,$000c		;ff43e0
	clr.w	-(a7)					;$4267			;ff43e4
	move.w	#$0010,-(a7)				;$3f3c,$0010		;ff43e6
	move.w	#$00b8,-(a7)				;$3f3c,$00b8		;ff43ea
	move.w	($0bfe),-(a7)				;$3f38,$0bfe		;ff43ee
	move.w	($0bfc),-(a7)				;$3f38,$0bfc		;ff43f2
	move.w	#$0003,-(a7)				;$3f3c,$0003		;ff43f6
	bsr.w	Lff67c4					;$6100,$23c8		;ff43fa
	lea.l	($000c,a7),a7				;$4fef,$000c		;ff43fe
	move.w	(a7)+,d0				;$301f			;ff4402
	beq.s	Lff440a					;$6704			;ff4404
	bsr.w	Call_MS_CURON				;$6100,$6654		;ff4406
Lff440a:									;ff440a
	bsr.w	Lff42b8					;$6100,$feac		;ff440a
	movem.l	(a7)+,d1-d7/a0-a6			;$4cdf,$7ffe		;ff440e
	rts						;$4e75			;ff4412

Lff4414:									;ff4414
	clr.b	($0bc6)					;$4238,$0bc6		;ff4414
	btst.b	#$00,($0bbf)				;$0838,$0000,$0bbf	;ff4418
	beq.s	Lff4424					;$6704			;ff441e
	bsr.w	Lff500e					;$6100,$0bec		;ff4420
Lff4424:									;ff4424
	movem.l	d1-d7/a0-a6,-(a7)			;$48e7,$7ffe		;ff4424
	move.b	#$01,($09dd)				;$11fc,$0001,$09dd	;ff4428
	bsr.w	Call_MS_STAT				;$6100,$6688		;ff442e
	move.w	d0,-(a7)				;$3f00			;ff4432
	bsr.w	Call_MS_CUROF				;$6100,$6654		;ff4434
	clr.w	d0					;$4240			;ff4438
	btst.b	#$00,($0bbf)				;$0838,$0000,$0bbf	;ff443a
	beq.s	Lff4444					;$6702			;ff4440
	moveq.l	#$ff,d0					;$70ff			;ff4442
Lff4444:									;ff4444
	move.w	d0,-(a7)				;$3f00			;ff4444
	move.w	#$0010,-(a7)				;$3f3c,$0010		;ff4446
	move.w	#$00b8,-(a7)				;$3f3c,$00b8		;ff444a
	move.w	($0bfe),-(a7)				;$3f38,$0bfe		;ff444e
	move.w	($0bfc),-(a7)				;$3f38,$0bfc		;ff4452
	move.w	#$0002,-(a7)				;$3f3c,$0002		;ff4456
	bsr.w	Lff67c4					;$6100,$2368		;ff445a
	lea.l	($000c,a7),a7				;$4fef,$000c		;ff445e
	clr.w	-(a7)					;$4267			;ff4462
	move.w	#$0010,-(a7)				;$3f3c,$0010		;ff4464
	move.w	#$00b8,-(a7)				;$3f3c,$00b8		;ff4468
	move.w	($0bfe),-(a7)				;$3f38,$0bfe		;ff446c
	move.w	($0bfc),-(a7)				;$3f38,$0bfc		;ff4470
	move.w	#$0003,-(a7)				;$3f3c,$0003		;ff4474
	bsr.w	Lff67c4					;$6100,$234a		;ff4478
	lea.l	($000c,a7),a7				;$4fef,$000c		;ff447c
	move.w	(a7)+,d0				;$301f			;ff4480
	beq.s	Lff4488					;$6704			;ff4482
	bsr.w	Call_MS_CURON				;$6100,$65d6		;ff4484
Lff4488:									;ff4488
	movem.l	(a7)+,d1-d7/a0-a6			;$4cdf,$7ffe		;ff4488
	rts						;$4e75			;ff448c

Lff448e:									;ff448e
	move.w	($0974),d0				;$3038,$0974		;ff448e
	move.w	($0970),d1				;$3238,$0970		;ff4492
	sub.w	#$0016,d1				;$927c,$0016		;ff4496
	cmp.w	d1,d0					;$b041			;ff449a
	bcs.s	Lff44a0					;$6502			;ff449c
	move.w	d1,d0					;$3001			;ff449e
Lff44a0:									;ff44a0
	asl.w	#3,d0					;$e740			;ff44a0
	move.w	($0976),d1				;$3238,$0976		;ff44a2
	addq.w	#1,d1					;$5241			;ff44a6
	asl.w	#4,d1					;$e941			;ff44a8
	rts						;$4e75			;ff44aa

Lff44ac:									;ff44ac
	clr.w	d0					;$4240			;ff44ac
	move.b	(a1)+,d0				;$1019			;ff44ae
	bne.s	Lff44b6					;$6604			;ff44b0
	subq.l	#1,a1					;$5389			;ff44b2
	moveq.l	#$20,d0					;$7020			;ff44b4
Lff44b6:									;ff44b6
	cmp.b	#$80,d0					;$b03c,$0080		;ff44b6
	bcs.s	Lff44e0					;$6524			;ff44ba
	beq.s	Lff44d4					;$6716			;ff44bc
	cmp.b	#$a0,d0					;$b03c,$00a0		;ff44be
	bcs.s	Lff44d0					;$650c			;ff44c2
	cmp.b	#$e0,d0					;$b03c,$00e0		;ff44c4
	bcs.s	Lff44e0					;$6516			;ff44c8
	cmp.b	#$f0,d0					;$b03c,$00f0		;ff44ca
	bcc.s	Lff44d4					;$6404			;ff44ce
Lff44d0:									;ff44d0
	subq.w	#1,d3					;$5343			;ff44d0
	bmi.s	Lff44e8					;$6b14			;ff44d2
Lff44d4:									;ff44d4
	asl.w	#8,d0					;$e140			;ff44d4
	move.b	(a1)+,d0				;$1019			;ff44d6
	bne.s	Lff44e0					;$6606			;ff44d8
	subq.l	#1,a1					;$5389			;ff44da
	move.w	#$8140,d0				;$303c,$8140		;ff44dc
Lff44e0:									;ff44e0
	bsr.s	Lff44ee					;$610c			;ff44e0
	dbra.w	d3,Lff44ac				;$51cb,$ffc8		;ff44e2
	rts						;$4e75			;ff44e6

Lff44e8:									;ff44e8
	moveq.l	#$20,d0					;$7020			;ff44e8
	bsr.s	Lff44ee					;$6102			;ff44ea
	rts						;$4e75			;ff44ec

Lff44ee:									;ff44ee
	movem.l	d1-d3/a1-a2,-(a7)			;$48e7,$7060		;ff44ee
	tst.b	($00ed002c)				;$4a39,$00ed,$002c	;ff44f2
	beq.s	Lff4532					;$6738			;ff44f8
	lea.l	(-$004c,a7),a7				;$4fef,$ffb4		;ff44fa
	movea.l	a7,a1					;$224f			;ff44fe
	movem.l	d1-d2,-(a7)				;$48e7,$6000		;ff4500
	move.l	#$00080000,d1				;$223c,$0008,$0000	;ff4504
	move.w	d0,d1					;$3200			;ff450a
	bsr.w	Call_FNTGET				;$6100,$305c		;ff450c
	movem.l	(a7)+,d1-d2				;$4cdf,$0006		;ff4510
	movea.l	a7,a1					;$224f			;ff4514
	move.l	($0944),-(a7)				;$2f38,$0944		;ff4516
	move.l	#$00e60000,($0944)			;$21fc,$00e6,$0000,$0944	;ff451a
	bsr.w	Call_TEXTPUT				;$6100,$3136		;ff4522
	move.l	(a7)+,($0944)				;$21df,$0944		;ff4526
	move.w	(a7),d0					;$3017			;ff452a
	lea.l	($004c,a7),a7				;$4fef,$004c		;ff452c
	bra.s	Lff4566					;$6034			;ff4530
Lff4532:									;ff4532
	move.w	d0,d3					;$3600			;ff4532
	lea.l	(Lff45b2,pc),a1				;$43fa,$007c		;ff4534
	cmp.b	#$20,d3					;$b63c,$0020		;ff4538
	bne.s	Lff4540					;$6602			;ff453c
	moveq.l	#$20,d3					;$7620			;ff453e
Lff4540:									;ff4540
	move.w	(a1)+,d0				;$3019			;ff4540
	beq.s	Lff4566					;$6722			;ff4542
	cmp.w	d3,d0					;$b043			;ff4544
	beq.s	Lff454e					;$6706			;ff4546
	lea.l	($0014,a1),a1				;$43e9,$0014		;ff4548
	bra.s	Lff4540					;$60f2			;ff454c
Lff454e:									;ff454e
	move.l	($0944),-(a7)				;$2f38,$0944		;ff454e
	move.l	#$00e60000,($0944)			;$21fc,$00e6,$0000,$0944	;ff4552
	move.w	(a1),d3					;$3611			;ff455a
	bsr.w	Call_TEXTPUT				;$6100,$30fc		;ff455c
	move.l	(a7)+,($0944)				;$21df,$0944		;ff4560
	move.w	d3,d0					;$3003			;ff4564
Lff4566:									;ff4566
	movem.l	(a7)+,d1-d3/a1-a2			;$4cdf,$060e		;ff4566
	add.w	d0,d1					;$d240			;ff456a
	rts						;$4e75			;ff456c

Lff456e:									;ff456e
	.dc.b	$f0,$6d,$f1,$38,$f2,$39,$f3,$54					;ff456e
	.dc.b	$f4,$3f,$f5,$4e,$f6,$3a,$f7,$53					;ff4576
	.dc.b	$f8,$52,$f9,$36,$fa,$37,$fb,$50					;ff457e
	.dc.b	$3d,$4a,$2f,$40,$2a,$41						;ff4586
Lff458c:									;ff458c
	.dc.b	$30,$4f,$31,$4b,$32,$4c,$33,$4d					;ff458c
	.dc.b	$34,$47,$35,$48,$36,$49,$37,$43					;ff4594
	.dc.b	$38,$44,$39,$45,$41,$1e,$42,$2e					;ff459c
	.dc.b	$43,$2c,$44,$20,$45,$13,$46,$21					;ff45a4
	.dc.b	$2e,$51,$2b,$46,$2d,$42						;ff45ac
Lff45b2:									;ff45b2
	.dc.b	$00,$20,$00,$08,$00,$10,$00,$00					;ff45b2
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00					;ff45ba
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$2d					;ff45c2
	.dc.b	$00,$08,$00,$10,$00,$00,$00,$00					;ff45ca
	.dc.b	$00,$00,$00,$7c,$00,$00,$00,$00					;ff45d2
	.dc.b	$00,$00,$00,$00,$00,$30,$00,$08					;ff45da
	.dc.b	$00,$10,$00,$7c,$82,$c6,$c6,$c6					;ff45e2
	.dc.b	$82,$00,$82,$c6,$c6,$c6,$82,$7c					;ff45ea
	.dc.b	$00,$00,$00,$31,$00,$08,$00,$10					;ff45f2
	.dc.b	$00,$00,$04,$0c,$0c,$0c,$0c,$04					;ff45fa
	.dc.b	$04,$0c,$0c,$0c,$0c,$04,$00,$00					;ff4602
	.dc.b	$00,$32,$00,$08,$00,$10,$00,$7c					;ff460a
	.dc.b	$02,$06,$06,$06,$02,$7c,$80,$c0					;ff4612
	.dc.b	$c0,$c0,$80,$7c,$00,$00,$00,$33					;ff461a
	.dc.b	$00,$08,$00,$10,$00,$7c,$02,$06					;ff4622
	.dc.b	$06,$06,$02,$7c,$02,$06,$06,$06					;ff462a
	.dc.b	$02,$7c,$00,$00,$00,$34,$00,$08					;ff4632
	.dc.b	$00,$10,$00,$00,$82,$c6,$c6,$c6					;ff463a
	.dc.b	$82,$7c,$02,$06,$06,$06,$06,$02					;ff4642
	.dc.b	$00,$00,$00,$35,$00,$08,$00,$10					;ff464a
	.dc.b	$00,$7c,$80,$c0,$c0,$c0,$80,$7c					;ff4652
	.dc.b	$02,$06,$06,$06,$02,$7c,$00,$00					;ff465a
	.dc.b	$00,$36,$00,$08,$00,$10,$00,$7c					;ff4662
	.dc.b	$80,$c0,$c0,$c0,$80,$7c,$82,$c6					;ff466a
	.dc.b	$c6,$c6,$82,$7c,$00,$00,$00,$37					;ff4672
	.dc.b	$00,$08,$00,$10,$00,$7c,$82,$c6					;ff467a
	.dc.b	$c6,$c6,$82,$00,$02,$06,$06,$06					;ff4682
	.dc.b	$06,$02,$00,$00,$00,$38,$00,$08					;ff468a
	.dc.b	$00,$10,$00,$7c,$82,$c6,$c6,$c6					;ff4692
	.dc.b	$82,$7c,$82,$c6,$c6,$c6,$82,$7c					;ff469a
	.dc.b	$00,$00,$00,$39,$00,$08,$00,$10					;ff46a2
	.dc.b	$00,$7c,$82,$c6,$c6,$c6,$82,$7c					;ff46aa
	.dc.b	$02,$06,$06,$06,$02,$7c,$00,$00					;ff46b2
	.dc.b	$00,$41,$00,$08,$00,$10,$00,$7c					;ff46ba
	.dc.b	$82,$c6,$c6,$c6,$82,$7c,$82,$c6					;ff46c2
	.dc.b	$c6,$c6,$c6,$82,$00,$00,$00,$42					;ff46ca
	.dc.b	$00,$08,$00,$10,$00,$00,$80,$c0					;ff46d2
	.dc.b	$c0,$c0,$80,$7c,$82,$c6,$c6,$c6					;ff46da
	.dc.b	$82,$7c,$00,$00,$00,$43,$00,$08					;ff46e2
	.dc.b	$00,$10,$00,$7c,$80,$c0,$c0,$c0					;ff46ea
	.dc.b	$80,$00,$80,$c0,$c0,$c0,$80,$7c					;ff46f2
	.dc.b	$00,$00,$00,$44,$00,$08,$00,$10					;ff46fa
	.dc.b	$00,$00,$02,$06,$06,$06,$02,$7c					;ff4702
	.dc.b	$82,$c6,$c6,$c6,$82,$7c,$00,$00					;ff470a
	.dc.b	$00,$45,$00,$08,$00,$10,$00,$7c					;ff4712
	.dc.b	$80,$c0,$c0,$c0,$80,$7c,$80,$c0					;ff471a
	.dc.b	$c0,$c0,$80,$7c,$00,$00,$00,$46					;ff4722
	.dc.b	$00,$08,$00,$10,$00,$7c,$80,$c0					;ff472a
	.dc.b	$c0,$c0,$80,$7c,$80,$c0,$c0,$c0					;ff4732
	.dc.b	$c0,$80,$00,$00,$f0,$4d,$00,$08					;ff473a
	.dc.b	$00,$10,$00,$44,$44,$6c,$54,$54					;ff4742
	.dc.b	$44,$44,$00,$00,$00,$00,$00,$00					;ff474a
	.dc.b	$00,$00,$f2,$2f,$00,$08,$00,$10					;ff4752
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00					;ff475a
	.dc.b	$00,$04,$08,$10,$20,$40,$00,$00					;ff4762
	.dc.b	$f2,$2a,$00,$08,$00,$10,$00,$00					;ff476a
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$10					;ff4772
	.dc.b	$54,$38,$54,$10,$00,$00,$f2,$2d					;ff477a
	.dc.b	$00,$08,$00,$10,$00,$00,$00,$00					;ff4782
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$7c					;ff478a
	.dc.b	$00,$00,$00,$00,$f2,$2b,$00,$08					;ff4792
	.dc.b	$00,$10,$00,$00,$00,$00,$00,$00					;ff479a
	.dc.b	$00,$00,$00,$10,$10,$7c,$10,$10					;ff47a2
	.dc.b	$00,$00,$00,$2e,$00,$08,$00,$10					;ff47aa
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00					;ff47b2
	.dc.b	$00,$00,$00,$00,$00,$30,$30,$00					;ff47ba
	.dc.b	$f2,$44,$00,$08,$00,$10,$00,$00					;ff47c2
	.dc.b	$00,$00,$00,$00,$00,$00,$78,$44					;ff47ca
	.dc.b	$42,$42,$42,$44,$78,$00,$f2,$45					;ff47d2
	.dc.b	$00,$08,$00,$10,$00,$00,$00,$00					;ff47da
	.dc.b	$00,$00,$00,$00,$7e,$40,$40,$7c					;ff47e2
	.dc.b	$40,$40,$7e,$00,$f2,$43,$00,$08					;ff47ea
	.dc.b	$00,$10,$00,$00,$00,$00,$00,$00					;ff47f2
	.dc.b	$00,$00,$3c,$42,$40,$40,$40,$42					;ff47fa
	.dc.b	$3c,$00,$f2,$48,$00,$08,$00,$10					;ff4802
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00					;ff480a
	.dc.b	$42,$42,$42,$7e,$42,$42,$42,$00					;ff4812
	.dc.b	$f2,$58,$00,$08,$00,$10,$00,$00					;ff481a
	.dc.b	$00,$00,$00,$00,$00,$00,$42,$42					;ff4822
	.dc.b	$24,$18,$24,$42,$42,$00,$f2,$30					;ff482a
	.dc.b	$00,$08,$00,$10,$00,$00,$00,$00					;ff4832
	.dc.b	$00,$00,$00,$00,$3c,$42,$42,$42					;ff483a
	.dc.b	$42,$42,$3c,$00,$f2,$31,$00,$08					;ff4842
	.dc.b	$00,$10,$00,$00,$00,$00,$00,$00					;ff484a
	.dc.b	$00,$00,$08,$08,$08,$08,$08,$08					;ff4852
	.dc.b	$08,$00,$f2,$32,$00,$08,$00,$10					;ff485a
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00					;ff4862
	.dc.b	$3c,$02,$02,$7c,$40,$40,$7c,$00					;ff486a
	.dc.b	$f2,$33,$00,$08,$00,$10,$00,$00					;ff4872
	.dc.b	$00,$00,$00,$00,$00,$00,$3c,$02					;ff487a
	.dc.b	$02,$3e,$02,$02,$3c,$00,$f2,$34					;ff4882
	.dc.b	$00,$08,$00,$10,$00,$00,$00,$00					;ff488a
	.dc.b	$00,$00,$00,$00,$40,$44,$44,$7e					;ff4892
	.dc.b	$04,$04,$04,$00,$f2,$35,$00,$08					;ff489a
	.dc.b	$00,$10,$00,$00,$00,$00,$00,$00					;ff48a2
	.dc.b	$00,$00,$7c,$40,$40,$7c,$02,$02					;ff48aa
	.dc.b	$7c,$00,$f2,$36,$00,$08,$00,$10					;ff48b2
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00					;ff48ba
	.dc.b	$3c,$40,$40,$7c,$42,$42,$3c,$00					;ff48c2
	.dc.b	$f2,$37,$00,$08,$00,$10,$00,$00					;ff48ca
	.dc.b	$00,$00,$00,$00,$00,$00,$3c,$42					;ff48d2
	.dc.b	$42,$02,$02,$02,$02,$00,$f2,$38					;ff48da
	.dc.b	$00,$08,$00,$10,$00,$00,$00,$00					;ff48e2
	.dc.b	$00,$00,$00,$00,$3c,$42,$42,$3c					;ff48ea
	.dc.b	$42,$42,$3c,$00,$f2,$39,$00,$08					;ff48f2
	.dc.b	$00,$10,$00,$00,$00,$00,$00,$00					;ff48fa
	.dc.b	$00,$00,$3c,$42,$42,$3e,$02,$02					;ff4902
	.dc.b	$3c,$00,$00,$00							;ff490a
Call_SKEY_MOD:									;ff490e
	cmp.b	#$02,d1					;$b23c,$0002		;ff490e
	beq.s	Lff4938					;$6724			;ff4912
	move.b	d1,($0bc1)				;$11c1,$0bc1		;ff4914
	tst.b	d1					;$4a01			;ff4918
	beq.s	Lff494a					;$672e			;ff491a
	cmp.b	#$01,d1					;$b23c,$0001		;ff491c
	beq.s	Lff4978					;$6756			;ff4920
	cmp.b	#-$01,d1				;$b23c,$ffff		;ff4922
	bne.s	Lff4938					;$6610			;ff4926
	bsr.s	Lff494a					;$6120			;ff4928
	bsr.w	Lff680e					;$6100,$1ee2		;ff492a
	move.b	#$00,($0bc2)				;$11fc,$0000,$0bc2	;ff492e
	bsr.w	Call_MS_CUROF				;$6100,$6154		;ff4934
Lff4938:									;ff4938
	clr.l	d0					;$4280			;ff4938
	move.b	($0bc2),d0				;$1038,$0bc2		;ff493a
	subq.b	#1,d0					;$5300			;ff493e
	cmp.b	#$02,d0					;$b03c,$0002		;ff4940
	bcs.s	Lff4948					;$6502			;ff4944
	clr.l	d0					;$4280			;ff4946
Lff4948:									;ff4948
	rts						;$4e75			;ff4948

Lff494a:									;ff494a
	move.b	#$01,($0bc4)				;$11fc,$0001,$0bc4	;ff494a
	bsr.s	Lff4958					;$6106			;ff4950
	clr.b	($0bc4)					;$4238,$0bc4		;ff4952
	bra.s	Lff4938					;$60e0			;ff4956
Lff4958:									;ff4958
	cmpi.b	#$02,($0bc2)				;$0c38,$0002,$0bc2	;ff4958
	bne.s	Lff4948					;$66e8			;ff495e
	move.b	#$01,($09dd)				;$11fc,$0001,$09dd	;ff4960
	move.b	#$01,($0bc2)				;$11fc,$0001,$0bc2	;ff4966
	bsr.w	Lff517c					;$6100,$080e		;ff496c
	bsr.w	Lff4e4c					;$6100,$04da		;ff4970
	bra.w	Call_MS_CURON				;$6000,$60e6		;ff4974
Lff4978:									;ff4978
	cmpi.b	#$02,($0bc2)				;$0c38,$0002,$0bc2	;ff4978
	beq.s	Lff49c4					;$6744			;ff497e
	move.b	#$01,($0bc4)				;$11fc,$0001,$0bc4	;ff4980
	move.b	#$01,($09dd)				;$11fc,$0001,$09dd	;ff4986
	move.b	#$02,($0bc2)				;$11fc,$0002,$0bc2	;ff498c
	movem.l	d1-d2,-(a7)				;$48e7,$6000		;ff4992
	move.w	#$036a,d1				;$323c,$036a		;ff4996
	cmp.w	d1,d2					;$b441			;ff499a
	bcs.s	Lff49a0					;$6502			;ff499c
	move.w	d1,d2					;$3401			;ff499e
Lff49a0:									;ff49a0
	move.w	d2,($0bb2)				;$31c2,$0bb2		;ff49a0
	move.w	#$028e,d1				;$323c,$028e		;ff49a4
	swap.w	d2					;$4842			;ff49a8
	cmp.w	d1,d2					;$b441			;ff49aa
	bcs.s	Lff49b0					;$6502			;ff49ac
	move.w	d1,d2					;$3401			;ff49ae
Lff49b0:									;ff49b0
	move.w	d2,($0bb0)				;$31c2,$0bb0		;ff49b0
	movem.l	(a7)+,d1-d2				;$4cdf,$0006		;ff49b4
	bsr.w	Lff4e9e					;$6100,$04e4		;ff49b8
	bsr.w	Call_MS_CURON				;$6100,$609e		;ff49bc
	clr.b	($0bc4)					;$4238,$0bc4		;ff49c0
Lff49c4:									;ff49c4
	bra.w	Lff4938					;$6000,$ff72		;ff49c4
Lff49c8:									;ff49c8
	cmpi.b	#$02,($09dd)				;$0c38,$0002,$09dd	;ff49c8
	beq.s	Lff4a18					;$6748			;ff49ce
	tst.b	($0bc4)					;$4a38,$0bc4		;ff49d0
	bne.s	Lff4a18					;$6642			;ff49d4
	tst.w	($0ade)					;$4a78,$0ade		;ff49d6
	bne.s	Lff4a18					;$663c			;ff49da
	move.b	#$01,($0bc4)				;$11fc,$0001,$0bc4	;ff49dc
	move.b	#$01,($09dd)				;$11fc,$0001,$09dd	;ff49e2
	move.b	(a1),d0					;$1011			;ff49e8
	move.w	($00e8002a),-(a7)			;$3f39,$00e8,$002a	;ff49ea
	bclr.b	#$00,($00e8002a)			;$08b9,$0000,$00e8,$002a	;ff49f0
	bsr.s	Lff4a1a					;$6120			;ff49f8
	clr.b	($0bc4)					;$4238,$0bc4		;ff49fa
	move.w	(a7)+,($00e8002a)			;$33df,$00e8,$002a	;ff49fe
	tst.b	($0bc3)					;$4a38,$0bc3		;ff4a04
	beq.s	Lff4a18					;$670e			;ff4a08
	btst.b	#$00,(a1)				;$0811,$0000		;ff4a0a
	bne.s	Lff4a14					;$6604			;ff4a0e
	clr.b	($0bc3)					;$4238,$0bc3		;ff4a10
Lff4a14:									;ff4a14
	andi.b	#$fe,(a1)				;$0211,$00fe		;ff4a14
Lff4a18:									;ff4a18
	rts						;$4e75			;ff4a18

Lff4a1a:									;ff4a1a
	move.b	($0bbe),d1				;$1238,$0bbe		;ff4a1a
	move.b	d0,($0bbe)				;$11c0,$0bbe		;ff4a1e
	btst.l	#$01,d0					;$0800,$0001		;ff4a22
	bne.w	Lff4db6					;$6600,$038e		;ff4a26
Lff4a2a:									;ff4a2a
	btst.b	#$00,($0bbf)				;$0838,$0000,$0bbf	;ff4a2a
	beq.s	Lff4a48					;$6716			;ff4a30
	btst.l	#$00,d0					;$0800,$0000		;ff4a32
	bne.w	Lff4d00					;$6600,$02c8		;ff4a36
	btst.l	#$00,d1					;$0801,$0000		;ff4a3a
	beq.s	Lff4a48					;$6708			;ff4a3e
	move.w	($0bb8),d0				;$3038,$0bb8		;ff4a40
	bsr.w	Lff4bde					;$6100,$0198		;ff4a44
Lff4a48:									;ff4a48
	rts						;$4e75			;ff4a48

Lff4a4a:									;ff4a4a
	tst.b	($0bc4)					;$4a38,$0bc4		;ff4a4a
	bne.s	Lff4a9e					;$664e			;ff4a4e
	tst.w	($0ade)					;$4a78,$0ade		;ff4a50
	bne.s	Lff4a9e					;$6648			;ff4a54
	cmpi.b	#$02,($0bc2)				;$0c38,$0002,$0bc2	;ff4a56
	bne.s	Lff4a9e					;$6640			;ff4a5c
	move.b	#$01,($0bc4)				;$11fc,$0001,$0bc4	;ff4a5e
	bsr.w	Call_MS_STAT				;$6100,$6052		;ff4a64
	move.w	d0,-(a7)				;$3f00			;ff4a68
	bsr.w	Call_MS_CUROF				;$6100,$601e		;ff4a6a
	move.b	#$01,($09dd)				;$11fc,$0001,$09dd	;ff4a6e
	move.b	#$01,($0bc2)				;$11fc,$0001,$0bc2	;ff4a74
	move.w	($00e8002a),-(a7)			;$3f39,$00e8,$002a	;ff4a7a
	bclr.b	#$00,($00e8002a)			;$08b9,$0000,$00e8,$002a	;ff4a80
	bsr.w	Lff4e48					;$6100,$03be		;ff4a88
	move.w	(a7)+,($00e8002a)			;$33df,$00e8,$002a	;ff4a8c
	clr.b	($0bc4)					;$4238,$0bc4		;ff4a92
	move.w	(a7)+,d0				;$301f			;ff4a96
	beq.s	Lff4a9e					;$6704			;ff4a98
	bsr.w	Call_MS_CURON				;$6100,$5fc0		;ff4a9a
Lff4a9e:									;ff4a9e
	rts						;$4e75			;ff4a9e

Lff4aa0:									;ff4aa0
	tst.b	($0bc4)					;$4a38,$0bc4		;ff4aa0
	bne.s	Lff4a9e					;$66f8			;ff4aa4
	tst.b	($0bc3)					;$4a38,$0bc3		;ff4aa6
	beq.s	Lff4abe					;$6712			;ff4aaa
	move.b	#$01,($0bc4)				;$11fc,$0001,$0bc4	;ff4aac
	bsr.s	Lff4acc					;$6118			;ff4ab2
	bsr.s	Lff4af8					;$6142			;ff4ab4
	bsr.s	Lff4acc					;$6114			;ff4ab6
	clr.b	($0bc4)					;$4238,$0bc4		;ff4ab8
	rts						;$4e75			;ff4abc

Lff4abe:									;ff4abe
	move.b	#$01,($0bc4)				;$11fc,$0001,$0bc4	;ff4abe
	bsr.s	Lff4af8					;$6132			;ff4ac4
	clr.b	($0bc4)					;$4238,$0bc4		;ff4ac6
	rts						;$4e75			;ff4aca

Lff4acc:									;ff4acc
	movem.l	d0/a0,-(a7)				;$48e7,$8080		;ff4acc
	move.w	($0bb8),d0				;$3038,$0bb8		;ff4ad0
	tst.b	d0					;$4a00			;ff4ad4
	beq.s	Lff4af2					;$671a			;ff4ad6
	cmp.w	#$0070,d0				;$b07c,$0070		;ff4ad8
	bcc.s	Lff4af2					;$6414			;ff4adc
	cmp.w	#$0061,d0				;$b07c,$0061		;ff4ade
	bcc.s	Lff4aea					;$6406			;ff4ae2
	cmp.w	#$005a,d0				;$b07c,$005a		;ff4ae4
	bcc.s	Lff4af2					;$6408			;ff4ae8
Lff4aea:									;ff4aea
	movea.l	($0bba),a0				;$2078,$0bba		;ff4aea
	bsr.w	Lff4cc0					;$6100,$01d0		;ff4aee
Lff4af2:									;ff4af2
	movem.l	(a7)+,d0/a0				;$4cdf,$0101		;ff4af2
	rts						;$4e75			;ff4af6

Lff4af8:									;ff4af8
	movem.l	d0-d2/a0,-(a7)				;$48e7,$e080		;ff4af8
	move.w	d1,d2					;$3401			;ff4afc
	move.w	($00e8002a),-(a7)			;$3f39,$00e8,$002a	;ff4afe
	bclr.b	#$00,($00e8002a)			;$08b9,$0000,$00e8,$002a	;ff4b04
	move.w	d0,-(a7)				;$3f00			;ff4b0c
	bsr.w	Call_MS_STAT				;$6100,$5fa8		;ff4b0e
	move.w	d0,-(a7)				;$3f00			;ff4b12
	bsr.w	Call_MS_CUROF				;$6100,$5f74		;ff4b14
	move.w	($0002,a7),d0				;$302f,$0002		;ff4b18
	bsr.s	Lff4b34					;$6116			;ff4b1c
	move.w	(a7)+,d0				;$301f			;ff4b1e
	beq.s	Lff4b26					;$6704			;ff4b20
	bsr.w	Call_MS_CURON				;$6100,$5f38		;ff4b22
Lff4b26:									;ff4b26
	addq.l	#2,a7					;$548f			;ff4b26
	move.w	(a7)+,($00e8002a)			;$33df,$00e8,$002a	;ff4b28
	movem.l	(a7)+,d0-d2/a0				;$4cdf,$0107		;ff4b2e
	rts						;$4e75			;ff4b32

Lff4b34:									;ff4b34
	btst.b	#$00,($0bbf)				;$0838,$0000,$0bbf	;ff4b34
	beq.s	Lff4bba					;$677e			;ff4b3a
	cmp.b	#$f0,d0					;$b03c,$00f0		;ff4b3c
	bcc.s	Lff4b72					;$6430			;ff4b40
	tst.b	d0					;$4a00			;ff4b42
	bmi.s	Lff4bba					;$6b74			;ff4b44
	cmp.w	#$005a,d0				;$b07c,$005a		;ff4b46
	bcs.s	Lff4bba					;$656e			;ff4b4a
	beq.s	Lff4bbc					;$676e			;ff4b4c
	cmp.w	#$005b,d0				;$b07c,$005b		;ff4b4e
	beq.s	Lff4bca					;$6776			;ff4b52
	cmp.w	#$0061,d0				;$b07c,$0061		;ff4b54
	bcs.s	Lff4ba2					;$6548			;ff4b58
	cmp.w	#$0070,d0				;$b07c,$0070		;ff4b5a
	bcs.s	Lff4bba					;$655a			;ff4b5e
	move.w	d0,-(a7)				;$3f00			;ff4b60
	move.b	d0,d1					;$1200			;ff4b62
	and.w	#$0007,d1				;$c27c,$0007		;ff4b64
	move.w	d2,d0					;$3002			;ff4b68
	btst.l	d1,d0					;$0300			;ff4b6a
	beq.s	Lff4b82					;$6714			;ff4b6c
	clr.w	(a7)					;$4257			;ff4b6e
	bra.s	Lff4b82					;$6010			;ff4b70
Lff4b72:									;ff4b72
	move.w	d0,-(a7)				;$3f00			;ff4b72
	move.b	d0,d1					;$1200			;ff4b74
	and.w	#$0007,d1				;$c27c,$0007		;ff4b76
	move.w	d2,d0					;$3002			;ff4b7a
	btst.l	d1,d0					;$0300			;ff4b7c
	bne.s	Lff4b82					;$6602			;ff4b7e
	clr.w	(a7)					;$4257			;ff4b80
Lff4b82:									;ff4b82
	move.w	(a7)+,d0				;$301f			;ff4b82
	beq.s	Lff4bba					;$6734			;ff4b84
	and.w	#$007f,d0				;$c07c,$007f		;ff4b86
	cmp.w	#$0070,d0				;$b07c,$0070		;ff4b8a
	bne.s	Lff4ba2					;$6612			;ff4b8e
	lea.l	(Lff5776,pc),a0				;$41fa,$0be4		;ff4b90
	bsr.w	Lff4cc0					;$6100,$012a		;ff4b94
	lea.l	(Lff5780,pc),a0				;$41fa,$0be6		;ff4b98
	bsr.w	Lff4cc0					;$6100,$0122		;ff4b9c
	bra.s	Lff4bb6					;$6014			;ff4ba0
Lff4ba2:									;ff4ba2
	lea.l	(Lff572e,pc),a0				;$41fa,$0b8a		;ff4ba2
Lff4ba6:									;ff4ba6
	move.w	(a0)+,d1				;$3218			;ff4ba6
	bmi.s	Lff4bba					;$6b10			;ff4ba8
	cmp.b	d0,d1					;$b200			;ff4baa
	beq.s	Lff4bb2					;$6704			;ff4bac
	addq.l	#8,a0					;$5088			;ff4bae
	bra.s	Lff4ba6					;$60f4			;ff4bb0
Lff4bb2:									;ff4bb2
	bsr.w	Lff4cc0					;$6100,$010c		;ff4bb2
Lff4bb6:									;ff4bb6
	bsr.w	Lff4ff4					;$6100,$043c		;ff4bb6
Lff4bba:									;ff4bba
	rts						;$4e75			;ff4bba

Lff4bbc:									;ff4bbc
	btst.l	#$09,d2					;$0802,$0009		;ff4bbc
	beq.s	Lff4ba2					;$67e0			;ff4bc0
	move.l	a0,-(a7)				;$2f08			;ff4bc2
	lea.l	(Lff573a,pc),a0				;$41fa,$0b74		;ff4bc4
	bra.s	Lff4bd6					;$600c			;ff4bc8
Lff4bca:									;ff4bca
	btst.l	#$08,d2					;$0802,$0008		;ff4bca
	beq.s	Lff4ba2					;$67d2			;ff4bce
	move.l	a0,-(a7)				;$2f08			;ff4bd0
	lea.l	(Lff5730,pc),a0				;$41fa,$0b5c		;ff4bd2
Lff4bd6:									;ff4bd6
	bsr.w	Lff4cc0					;$6100,$00e8		;ff4bd6
	movea.l	(a7)+,a0				;$205f			;ff4bda
	bra.s	Lff4ba2					;$60c4			;ff4bdc
Lff4bde:									;ff4bde
	clr.b	($0bc3)					;$4238,$0bc3		;ff4bde
	move.w	#$ffff,($0bb8)				;$31fc,$ffff,$0bb8	;ff4be2
	tst.w	d0					;$4a40			;ff4be8
	bmi.w	Lff4cbe					;$6b00,$00d2		;ff4bea
	cmp.w	#$0700,d0				;$b07c,$0700		;ff4bee
	beq.w	Lff4e02					;$6700,$020e		;ff4bf2
	cmp.w	#$0740,d0				;$b07c,$0740		;ff4bf6
	beq.w	Lff4cbe					;$6700,$00c2		;ff4bfa
	and.w	#$007f,d0				;$c07c,$007f		;ff4bfe
	beq.w	Lff4cbe					;$6700,$00ba		;ff4c02
	cmp.w	#$0070,d0				;$b07c,$0070		;ff4c06
	bcc.w	Lff4cbe					;$6400,$00b2		;ff4c0a
	movea.l	($0bba),a0				;$2078,$0bba		;ff4c0e
	or.w	#$0080,d0				;$807c,$0080		;ff4c12
	cmp.b	#$da,d0					;$b03c,$00da		;ff4c16
	bcs.w	Lff4cb6					;$6500,$009a		;ff4c1a
	cmp.b	#$e1,d0					;$b03c,$00e1		;ff4c1e
	bcc.w	Lff4cb6					;$6400,$0092		;ff4c22
	bra.w	Lff4cb8					;$6000,$0090		;ff4c26
Lff4c2a:									;ff4c2a
	move.b	#$01,($0bc3)				;$11fc,$0001,$0bc3	;ff4c2a
	tst.w	d0					;$4a40			;ff4c30
	bmi.w	Lff4cbe					;$6b00,$008a		;ff4c32
	cmp.w	#$0700,d0				;$b07c,$0700		;ff4c36
	beq.w	Lff4df4					;$6700,$01b8		;ff4c3a
	cmp.w	#$0740,d0				;$b07c,$0740		;ff4c3e
	beq.w	Lff4958					;$6700,$fd14		;ff4c42
	and.w	#$007f,d0				;$c07c,$007f		;ff4c46
	beq.s	Lff4cbe					;$6772			;ff4c4a
	cmp.w	#$005a,d0				;$b07c,$005a		;ff4c4c
	bcs.s	Lff4cb6					;$6564			;ff4c50
	beq.w	Lff4cdc					;$6700,$0088		;ff4c52
	cmp.w	#$005b,d0				;$b07c,$005b		;ff4c56
	beq.w	Lff4cec					;$6700,$0090		;ff4c5a
	cmp.w	#$0061,d0				;$b07c,$0061		;ff4c5e
	bcs.s	Lff4c9a					;$6536			;ff4c62
	cmp.w	#$0070,d0				;$b07c,$0070		;ff4c64
	bcs.s	Lff4cb6					;$654c			;ff4c68
	move.w	d0,-(a7)				;$3f00			;ff4c6a
	move.b	d0,d1					;$1200			;ff4c6c
	and.w	#$0007,d1				;$c27c,$0007		;ff4c6e
	move.w	($0810),d0				;$3038,$0810		;ff4c72
	btst.l	d1,d0					;$0300			;ff4c76
	beq.s	Lff4c7e					;$6704			;ff4c78
	ori.w	#$0080,(a7)				;$0057,$0080		;ff4c7a
Lff4c7e:									;ff4c7e
	move.w	(a7)+,d0				;$301f			;ff4c7e
	move.w	d0,d1					;$3200			;ff4c80
	and.w	#$007f,d1				;$c27c,$007f		;ff4c82
	cmp.w	#$0070,d1				;$b27c,$0070		;ff4c86
	bne.s	Lff4c9a					;$660e			;ff4c8a
	lea.l	(Lff5776,pc),a0				;$41fa,$0ae8		;ff4c8c
	bsr.s	Lff4cc0					;$612e			;ff4c90
	lea.l	(Lff5780,pc),a0				;$41fa,$0aec		;ff4c92
	bsr.s	Lff4cc0					;$6128			;ff4c96
	bra.s	Lff4c9c					;$6002			;ff4c98
Lff4c9a:									;ff4c9a
	bsr.s	Lff4cc0					;$6124			;ff4c9a
Lff4c9c:									;ff4c9c
	bsr.s	Lff4cb8					;$611a			;ff4c9c
	bsr.w	Call_MS_STAT				;$6100,$5e18		;ff4c9e
	move.w	d0,-(a7)				;$3f00			;ff4ca2
	bsr.w	Call_MS_CUROF				;$6100,$5de4		;ff4ca4
	bsr.w	Lff4ff4					;$6100,$034a		;ff4ca8
	move.w	(a7)+,d0				;$301f			;ff4cac
	beq.s	Lff4cb4					;$6704			;ff4cae
	bsr.w	Call_MS_CURON				;$6100,$5daa		;ff4cb0
Lff4cb4:									;ff4cb4
	rts						;$4e75			;ff4cb4

Lff4cb6:									;ff4cb6
	bsr.s	Lff4cc0					;$6108			;ff4cb6
Lff4cb8:									;ff4cb8
	move.w	d0,d1					;$3200			;ff4cb8
	bsr.w	Call_SKEYSET				;$6100,$1c48		;ff4cba
Lff4cbe:									;ff4cbe
	rts						;$4e75			;ff4cbe

Lff4cc0:									;ff4cc0
	move.w	d0,-(a7)				;$3f00			;ff4cc0
	bsr.w	Call_MS_STAT				;$6100,$5df4		;ff4cc2
	move.w	d0,-(a7)				;$3f00			;ff4cc6
	bsr.w	Call_MS_CUROF				;$6100,$5dc0		;ff4cc8
	bsr.w	Lff4fc0					;$6100,$02f2		;ff4ccc
	move.w	(a7)+,d0				;$301f			;ff4cd0
	beq.s	Lff4cd8					;$6704			;ff4cd2
	bsr.w	Call_MS_CURON				;$6100,$5d86		;ff4cd4
Lff4cd8:									;ff4cd8
	move.w	(a7)+,d0				;$301f			;ff4cd8
	rts						;$4e75			;ff4cda

Lff4cdc:									;ff4cdc
	btst.b	#$01,($0810)				;$0838,$0001,$0810	;ff4cdc
	beq.s	Lff4c9a					;$67b6			;ff4ce2
	move.l	a0,-(a7)				;$2f08			;ff4ce4
	lea.l	(Lff573a,pc),a0				;$41fa,$0a52		;ff4ce6
	bra.s	Lff4cfa					;$600e			;ff4cea
Lff4cec:									;ff4cec
	btst.b	#$00,($0810)				;$0838,$0000,$0810	;ff4cec
	beq.s	Lff4c9a					;$67a6			;ff4cf2
	move.l	a0,-(a7)				;$2f08			;ff4cf4
	lea.l	(Lff5730,pc),a0				;$41fa,$0a38		;ff4cf6
Lff4cfa:									;ff4cfa
	bsr.s	Lff4cc0					;$61c4			;ff4cfa
	movea.l	(a7)+,a0				;$205f			;ff4cfc
	bra.s	Lff4c9a					;$609a			;ff4cfe
Lff4d00:									;ff4d00
	btst.l	#$00,d1					;$0801,$0000		;ff4d00
	bne.s	Lff4d46					;$6640			;ff4d04
	movem.l	d1-d4,-(a7)				;$48e7,$7800		;ff4d06
	move.w	($0ace),d1				;$3238,$0ace		;ff4d0a
	move.w	($0ad0),d2				;$3438,$0ad0		;ff4d0e
	sub.w	($0bb0),d1				;$9278,$0bb0		;ff4d12
	sub.w	($0bb2),d2				;$9478,$0bb2		;ff4d16
	cmp.w	#$0096,d2				;$b47c,$0096		;ff4d1a
	bcc.s	Lff4d3e					;$641e			;ff4d1e
	cmp.w	#$0172,d1				;$b27c,$0172		;ff4d20
	bcc.s	Lff4d3e					;$6418			;ff4d24
	bsr.w	Lff51fe					;$6100,$04d6		;ff4d26
	move.l	a0,($0bba)				;$21c8,$0bba		;ff4d2a
	move.w	d0,($0bb8)				;$31c0,$0bb8		;ff4d2e
	bmi.s	Lff4d3e					;$6b0a			;ff4d32
	bsr.w	Lff4c2a					;$6100,$fef4		;ff4d34
	move.b	#$14,($0bc0)				;$11fc,$0014,$0bc0	;ff4d38
Lff4d3e:									;ff4d3e
	movem.l	(a7)+,d1-d4				;$4cdf,$001e		;ff4d3e
	bra.w	Lff4a48					;$6000,$fd04		;ff4d42
Lff4d46:									;ff4d46
	cmpi.w	#$0700,($0bb8)				;$0c78,$0700,$0bb8	;ff4d46
	beq.w	Lff4a48					;$6700,$fcfa		;ff4d4c
	movem.l	d1-d4,-(a7)				;$48e7,$7800		;ff4d50
	move.w	($0ace),d1				;$3238,$0ace		;ff4d54
	move.w	($0ad0),d2				;$3438,$0ad0		;ff4d58
	sub.w	($0bb0),d1				;$9278,$0bb0		;ff4d5c
	sub.w	($0bb2),d2				;$9478,$0bb2		;ff4d60
	cmp.w	#$0096,d2				;$b47c,$0096		;ff4d64
	bcc.s	Lff4d3e					;$64d4			;ff4d68
	cmp.w	#$0172,d1				;$b27c,$0172		;ff4d6a
	bcc.s	Lff4d3e					;$64ce			;ff4d6e
	bsr.w	Lff51fe					;$6100,$048c		;ff4d70
	bmi.s	Lff4d3e					;$6bc8			;ff4d74
	subq.b	#1,($0bc0)				;$5338,$0bc0		;ff4d76
	bne.s	Lff4d3e					;$66c2			;ff4d7a
	move.b	#$02,($0bc0)				;$11fc,$0002,$0bc0	;ff4d7c
	cmp.w	($0bb8),d0				;$b078,$0bb8		;ff4d82
	bne.s	Lff4d3e					;$66b6			;ff4d86
	tst.w	d0					;$4a40			;ff4d88
	beq.s	Lff4db0					;$6724			;ff4d8a
	movea.l	($0bba),a0				;$2078,$0bba		;ff4d8c
	cmp.b	#$5a,d0					;$b03c,$005a		;ff4d90
	bcs.s	Lff4da8					;$6512			;ff4d94
	cmp.b	#$61,d0					;$b03c,$0061		;ff4d96
	bcs.s	Lff4db0					;$6514			;ff4d9a
	cmp.b	#$70,d0					;$b03c,$0070		;ff4d9c
	bcs.s	Lff4da8					;$6506			;ff4da0
	cmp.b	#$74,d0					;$b03c,$0074		;ff4da2
	bcs.s	Lff4d3e					;$6596			;ff4da6
Lff4da8:									;ff4da8
	bsr.w	Lff4cc0					;$6100,$ff16		;ff4da8
	movea.l	($0bba),a0				;$2078,$0bba		;ff4dac
Lff4db0:									;ff4db0
	bsr.w	Lff4c2a					;$6100,$fe78		;ff4db0
	bra.s	Lff4d3e					;$6088			;ff4db4
Lff4db6:									;ff4db6
	tst.b	($0bc1)					;$4a38,$0bc1		;ff4db6
	bpl.w	Lff4a2a					;$6a00,$fc6e		;ff4dba
	btst.l	#$01,d1					;$0801,$0001		;ff4dbe
	bne.w	Lff4a48					;$6600,$fc84		;ff4dc2
	move.b	($0bc2),d0				;$1038,$0bc2		;ff4dc6
	addq.b	#1,d0					;$5200			;ff4dca
	and.w	#$0003,d0				;$c07c,$0003		;ff4dcc
	move.b	d0,($0bc2)				;$11c0,$0bc2		;ff4dd0
	asl.w	#2,d0					;$e540			;ff4dd4
	lea.l	(Lff4de4,pc),a0				;$41fa,$000c		;ff4dd6
	movea.l	(a0,d0.w),a0				;$2070,$0000		;ff4dda
	jsr	(a0)					;$4e90			;ff4dde
	bra.w	Lff4a48					;$6000,$fc66		;ff4de0
Lff4de4:									;ff4de4
	.dc.b	$00,$ff,$aa,$8a,$00,$ff,$aa,$5c					;ff4de4
	.dc.b	$00,$ff,$4e,$44,$00,$ff,$4e,$48					;ff4dec
Lff4df4:									;ff4df4
	move.w	($0ace),($0bb4)				;$31f8,$0ace,$0bb4	;ff4df4
	move.w	($0ad0),($0bb6)				;$31f8,$0ad0,$0bb6	;ff4dfa
	rts						;$4e75			;ff4e00

Lff4e02:									;ff4e02
	bsr.w	Lff517c					;$6100,$0378		;ff4e02
	clr.w	d1					;$4241			;ff4e06
	move.w	($0ace),d0				;$3038,$0ace		;ff4e08
	sub.w	($0bb4),d0				;$9078,$0bb4		;ff4e0c
	add.w	($0bb0),d0				;$d078,$0bb0		;ff4e10
	bmi.s	Lff4e1e					;$6b08			;ff4e14
	move.w	#$028e,d1				;$323c,$028e		;ff4e16
	cmp.w	d1,d0					;$b041			;ff4e1a
	bcs.s	Lff4e20					;$6502			;ff4e1c
Lff4e1e:									;ff4e1e
	move.w	d1,d0					;$3001			;ff4e1e
Lff4e20:									;ff4e20
	move.w	d0,($0bb0)				;$31c0,$0bb0		;ff4e20
	clr.w	d1					;$4241			;ff4e24
	move.w	($0ad0),d0				;$3038,$0ad0		;ff4e26
	sub.w	($0bb6),d0				;$9078,$0bb6		;ff4e2a
	add.w	($0bb2),d0				;$d078,$0bb2		;ff4e2e
	bmi.s	Lff4e3c					;$6b08			;ff4e32
	move.w	#$036a,d1				;$323c,$036a		;ff4e34
	cmp.w	d1,d0					;$b041			;ff4e38
	bcs.s	Lff4e3e					;$6502			;ff4e3a
Lff4e3c:									;ff4e3c
	move.w	d1,d0					;$3001			;ff4e3c
Lff4e3e:									;ff4e3e
	move.w	d0,($0bb2)				;$31c0,$0bb2		;ff4e3e
	bra.s	Lff4e9e					;$605a			;ff4e42
Lff4e44:									;ff4e44
	bsr.s	Lff4e78					;$6132			;ff4e44
	bra.s	Lff4e9e					;$6056			;ff4e46
Lff4e48:									;ff4e48
	bsr.w	Lff517c					;$6100,$0332		;ff4e48
Lff4e4c:									;ff4e4c
	movem.l	d0-d3,-(a7)				;$48e7,$f000		;ff4e4c
	move.w	($0810),d2				;$3438,$0810		;ff4e50
	moveq.l	#$03,d3					;$7603			;ff4e54
Lff4e56:									;ff4e56
	btst.l	d3,d2					;$0702			;ff4e56
	beq.s	Lff4e64					;$670a			;ff4e58
	move.w	#$00f0,d1				;$323c,$00f0		;ff4e5a
	add.w	d3,d1					;$d243			;ff4e5e
	bsr.w	Call_SKEYSET				;$6100,$1aa2		;ff4e60
Lff4e64:									;ff4e64
	dbra.w	d3,Lff4e56				;$51cb,$fff0		;ff4e64
	movem.l	(a7)+,d0-d3				;$4cdf,$000f		;ff4e68
Lff4e6c:									;ff4e6c
	tst.b	($0bc6)					;$4a38,$0bc6		;ff4e6c
	beq.s	Lff4e76					;$6704			;ff4e70
	bsr.w	Lff4414					;$6100,$f5a0		;ff4e72
Lff4e76:									;ff4e76
	rts						;$4e75			;ff4e76

Lff4e78:									;ff4e78
	move.w	($0ace),d0				;$3038,$0ace		;ff4e78
	move.w	#$028e,d1				;$323c,$028e		;ff4e7c
	cmp.w	d1,d0					;$b041			;ff4e80
	bcs.s	Lff4e86					;$6502			;ff4e82
	move.w	d1,d0					;$3001			;ff4e84
Lff4e86:									;ff4e86
	move.w	d0,($0bb0)				;$31c0,$0bb0		;ff4e86
	move.w	($0ad0),d0				;$3038,$0ad0		;ff4e8a
	move.w	#$036a,d1				;$323c,$036a		;ff4e8e
	cmp.w	d1,d0					;$b041			;ff4e92
	bcs.s	Lff4e98					;$6502			;ff4e94
	move.w	d1,d0					;$3001			;ff4e96
Lff4e98:									;ff4e98
	move.w	d0,($0bb2)				;$31c0,$0bb2		;ff4e98
	rts						;$4e75			;ff4e9c

Lff4e9e:									;ff4e9e
	tst.b	($0bc6)					;$4a38,$0bc6		;ff4e9e
	beq.s	Lff4ea8					;$6704			;ff4ea2
	bsr.w	Lff4424					;$6100,$f57e		;ff4ea4
Lff4ea8:									;ff4ea8
	bset.b	#$00,($0bbf)				;$08f8,$0000,$0bbf	;ff4ea8
	bsr.w	Call_MS_STAT				;$6100,$5c08		;ff4eae
	move.w	d0,-(a7)				;$3f00			;ff4eb2
	bsr.w	Call_MS_CUROF				;$6100,$5bd4		;ff4eb4
	move.w	#$ffff,-(a7)				;$3f3c,$ffff		;ff4eb8
	move.w	#$0096,-(a7)				;$3f3c,$0096		;ff4ebc
	move.w	#$0172,-(a7)				;$3f3c,$0172		;ff4ec0
	move.w	($0bb2),-(a7)				;$3f38,$0bb2		;ff4ec4
	move.w	($0bb0),-(a7)				;$3f38,$0bb0		;ff4ec8
	move.w	#$0002,-(a7)				;$3f3c,$0002		;ff4ecc
	bsr.w	Lff67c4					;$6100,$18f2		;ff4ed0
	lea.l	($000c,a7),a7				;$4fef,$000c		;ff4ed4
	clr.w	-(a7)					;$4267			;ff4ed8
	move.w	#$0096,-(a7)				;$3f3c,$0096		;ff4eda
	move.w	#$0172,-(a7)				;$3f3c,$0172		;ff4ede
	move.w	($0bb2),-(a7)				;$3f38,$0bb2		;ff4ee2
	move.w	($0bb0),-(a7)				;$3f38,$0bb0		;ff4ee6
	move.w	#$0003,-(a7)				;$3f3c,$0003		;ff4eea
	bsr.w	Lff67c4					;$6100,$18d4		;ff4eee
	lea.l	($000c,a7),a7				;$4fef,$000c		;ff4ef2
	move.w	#$ffff,-(a7)				;$3f3c,$ffff		;ff4ef6
	move.w	#$0096,-(a7)				;$3f3c,$0096		;ff4efa
	move.w	#$0172,-(a7)				;$3f3c,$0172		;ff4efe
	move.w	($0bb2),-(a7)				;$3f38,$0bb2		;ff4f02
	move.w	($0bb0),-(a7)				;$3f38,$0bb0		;ff4f06
	move.w	#$0003,-(a7)				;$3f3c,$0003		;ff4f0a
	bsr.w	Lff67a2					;$6100,$1892		;ff4f0e
	lea.l	($000c,a7),a7				;$4fef,$000c		;ff4f12
	movem.l	d1-d2/a1,-(a7)				;$48e7,$6040		;ff4f16
	lea.l	(Lff5314,pc),a0				;$41fa,$03f8		;ff4f1a
	lea.l	(-$000c,a7),a7				;$4fef,$fff4		;ff4f1e
	move.w	#$ffff,($000a,a7)			;$3f7c,$ffff,$000a	;ff4f22
	move.w	#$0003,(a7)				;$3ebc,$0003		;ff4f28
Lff4f2c:									;ff4f2c
	move.w	(a0)+,d0				;$3018			;ff4f2c
	bmi.s	Lff4f8e					;$6b5e			;ff4f2e
	bsr.w	Lff5048					;$6100,$0116		;ff4f30
	move.w	(a0)+,d0				;$3018			;ff4f34
	add.w	($0bb0),d0				;$d078,$0bb0		;ff4f36
	move.w	d0,($0002,a7)				;$3f40,$0002		;ff4f3a
	move.w	(a0)+,d0				;$3018			;ff4f3e
	add.w	($0bb2),d0				;$d078,$0bb2		;ff4f40
	move.w	d0,($0004,a7)				;$3f40,$0004		;ff4f44
	move.w	(a0)+,($0006,a7)			;$3f58,$0006		;ff4f48
	move.w	(a0)+,($0008,a7)			;$3f58,$0008		;ff4f4c
	bsr.w	Lff67a2					;$6100,$1850		;ff4f50
	move.w	(-$000a,a0),d0				;$3028,$fff6		;ff4f54
	cmp.b	#$5a,d0					;$b03c,$005a		;ff4f58
	bcs.s	Lff4f2c					;$65ce			;ff4f5c
	cmp.b	#$61,d0					;$b03c,$0061		;ff4f5e
	bcs.s	Lff4f76					;$6512			;ff4f62
	cmp.b	#$70,d0					;$b03c,$0070		;ff4f64
	bcs.s	Lff4f2c					;$65c2			;ff4f68
	cmp.b	#$74,d0					;$b03c,$0074		;ff4f6a
	bcc.s	Lff4f2c					;$64bc			;ff4f6e
	sub.b	#$70,d0					;$903c,$0070		;ff4f70
	bra.s	Lff4f7a					;$6004			;ff4f74
Lff4f76:									;ff4f76
	sub.b	#$52,d0					;$903c,$0052		;ff4f76
Lff4f7a:									;ff4f7a
	move.w	d0,d1					;$3200			;ff4f7a
	move.w	($0810),d0				;$3038,$0810		;ff4f7c
	btst.l	d1,d0					;$0300			;ff4f80
	beq.s	Lff4f2c					;$67a8			;ff4f82
	movea.l	a0,a1					;$2248			;ff4f84
	subq.l	#8,a0					;$5188			;ff4f86
	bsr.s	Lff4fc0					;$6136			;ff4f88
	movea.l	a1,a0					;$2049			;ff4f8a
	bra.s	Lff4f2c					;$609e			;ff4f8c
Lff4f8e:									;ff4f8e
	adda.w	#$000c,a7				;$defc,$000c		;ff4f8e
	tst.b	($0bc6)					;$4a38,$0bc6		;ff4f92
	beq.s	Lff4fb2					;$671a			;ff4f96
	move.w	($0bb0),d0				;$3038,$0bb0		;ff4f98
	move.w	($0bb2),d1				;$3238,$0bb2		;ff4f9c
	addq.w	#2,d1					;$5441			;ff4fa0
	add.w	#$00b8,d0				;$d07c,$00b8		;ff4fa2
	move.w	d0,($0bfc)				;$31c0,$0bfc		;ff4fa6
	move.w	d1,($0bfe)				;$31c1,$0bfe		;ff4faa
	bsr.w	Lff42b8					;$6100,$f308		;ff4fae
Lff4fb2:									;ff4fb2
	movem.l	(a7)+,d1-d2/a1				;$4cdf,$0206		;ff4fb2
Lff4fb6:									;ff4fb6
	move.w	(a7)+,d0				;$301f			;ff4fb6
	beq.s	Lff4fbe					;$6704			;ff4fb8
	bsr.w	Call_MS_CURON				;$6100,$5aa0		;ff4fba
Lff4fbe:									;ff4fbe
	rts						;$4e75			;ff4fbe

Lff4fc0:									;ff4fc0
	move.w	($0006,a0),d0				;$3028,$0006		;ff4fc0
	subq.w	#2,d0					;$5540			;ff4fc4
	move.w	d0,-(a7)				;$3f00			;ff4fc6
	move.w	($0004,a0),d0				;$3028,$0004		;ff4fc8
	subq.w	#2,d0					;$5540			;ff4fcc
	move.w	d0,-(a7)				;$3f00			;ff4fce
	move.w	($0002,a0),d0				;$3028,$0002		;ff4fd0
	add.w	($0bb2),d0				;$d078,$0bb2		;ff4fd4
	addq.w	#1,d0					;$5240			;ff4fd8
	move.w	d0,-(a7)				;$3f00			;ff4fda
	move.w	(a0),d0					;$3010			;ff4fdc
	add.w	($0bb0),d0				;$d078,$0bb0		;ff4fde
	addq.w	#1,d0					;$5240			;ff4fe2
	move.w	d0,-(a7)				;$3f00			;ff4fe4
	move.w	#$0003,-(a7)				;$3f3c,$0003		;ff4fe6
	bsr.w	Lff67b4					;$6100,$17c8		;ff4fea
	adda.w	#$000a,a7				;$defc,$000a		;ff4fee
	rts						;$4e75			;ff4ff2

Lff4ff4:									;ff4ff4
	movem.l	d0-d2/a0-a1,-(a7)			;$48e7,$e0c0		;ff4ff4
	lea.l	(Lff5314,pc),a0				;$41fa,$031a		;ff4ff8
Lff4ffc:									;ff4ffc
	move.w	(a0)+,d0				;$3018			;ff4ffc
	bmi.s	Lff5008					;$6b08			;ff4ffe
	bsr.w	Lff50b8					;$6100,$00b6		;ff5000
	addq.l	#8,a0					;$5088			;ff5004
	bra.s	Lff4ffc					;$60f4			;ff5006
Lff5008:									;ff5008
	movem.l	(a7)+,d0-d2/a0-a1			;$4cdf,$0307		;ff5008
	rts						;$4e75			;ff500c

Lff500e:									;ff500e
	tst.b	($0bc4)					;$4a38,$0bc4		;ff500e
	bne.s	Lff500e					;$66fa			;ff5012
	move.b	#$01,($0bc4)				;$11fc,$0001,$0bc4	;ff5014
	movem.l	d0-d2/a0-a1,-(a7)			;$48e7,$e0c0		;ff501a
	bsr.w	Call_MS_STAT				;$6100,$5a98		;ff501e
	move.w	d0,-(a7)				;$3f00			;ff5022
	bsr.w	Call_MS_CUROF				;$6100,$5a64		;ff5024
	lea.l	(Lff5314,pc),a0				;$41fa,$02ea		;ff5028
Lff502c:									;ff502c
	move.w	(a0)+,d0				;$3018			;ff502c
	bmi.s	Lff5036					;$6b06			;ff502e
	bsr.s	Lff5050					;$611e			;ff5030
	addq.l	#8,a0					;$5088			;ff5032
	bra.s	Lff502c					;$60f6			;ff5034
Lff5036:									;ff5036
	clr.b	($0bc4)					;$4238,$0bc4		;ff5036
	move.w	(a7)+,d0				;$301f			;ff503a
	beq.s	Lff5042					;$6704			;ff503c
	bsr.w	Call_MS_CURON				;$6100,$5a1c		;ff503e
Lff5042:									;ff5042
	movem.l	(a7)+,d0-d2/a0-a1			;$4cdf,$0307		;ff5042
	rts						;$4e75			;ff5046

Lff5048:									;ff5048
	cmp.w	#$1000,d0				;$b07c,$1000		;ff5048
	bcs.s	Lff50b8					;$656a			;ff504c
	bsr.s	Lff506e					;$611e			;ff504e
Lff5050:									;ff5050
	cmp.w	#$1000,d0				;$b07c,$1000		;ff5050
	bcs.s	Lff50b6					;$6560			;ff5054
	movem.l	d0-d2/a0-a1,-(a7)			;$48e7,$e0c0		;ff5056
	and.w	#$ff00,d0				;$c07c,$ff00		;ff505a
	lea.l	(Lff5e4a,pc),a1				;$43fa,$0dea		;ff505e
	tst.b	($0bc6)					;$4a38,$0bc6		;ff5062
	bne.s	Lff507a					;$6612			;ff5066
	lea.l	(Lff5cca,pc),a1				;$43fa,$0c60		;ff5068
	bra.s	Lff507a					;$600c			;ff506c
Lff506e:									;ff506e
	movem.l	d0-d2/a0-a1,-(a7)			;$48e7,$e0c0		;ff506e
	and.w	#$ff00,d0				;$c07c,$ff00		;ff5072
	lea.l	(Lff57b2,pc),a1				;$43fa,$073a		;ff5076
Lff507a:									;ff507a
	move.w	(a1)+,d1				;$3219			;ff507a
	bmi.s	Lff50b2					;$6b34			;ff507c
	move.w	(a1)+,d2				;$3419			;ff507e
	cmp.w	d0,d1					;$b240			;ff5080
	bne.s	Lff50ac					;$6628			;ff5082
	move.l	($0944),-(a7)				;$2f38,$0944		;ff5084
	move.l	#$00e60000,($0944)			;$21fc,$00e6,$0000,$0944	;ff5088
	move.w	(a0),d1					;$3210			;ff5090
	add.w	($0bb0),d1				;$d278,$0bb0		;ff5092
	addq.w	#1,d1					;$5241			;ff5096
	move.w	($0002,a0),d2				;$3428,$0002		;ff5098
	add.w	($0bb2),d2				;$d478,$0bb2		;ff509c
	addq.w	#1,d2					;$5242			;ff50a0
	bsr.w	Call_TEXTPUT				;$6100,$25b6		;ff50a2
	move.l	(a7)+,($0944)				;$21df,$0944		;ff50a6
	bra.s	Lff50b2					;$6006			;ff50aa
Lff50ac:									;ff50ac
	lea.l	(a1,d2.w),a1				;$43f1,$2000		;ff50ac
	bra.s	Lff507a					;$60c8			;ff50b0
Lff50b2:									;ff50b2
	movem.l	(a7)+,d0-d2/a0-a1			;$4cdf,$0307		;ff50b2
Lff50b6:									;ff50b6
	rts						;$4e75			;ff50b6

Lff50b8:									;ff50b8
	and.w	#$007f,d0				;$c07c,$007f		;ff50b8
	movem.l	d2/a0,-(a7)				;$48e7,$2080		;ff50bc
	bsr.w	Lff522a					;$6100,$0168		;ff50c0
	movem.l	(a7)+,d2/a0				;$4cdf,$0104		;ff50c4
	and.l	#$000000ff,d1				;$c2bc,$0000,$00ff	;ff50c8
	beq.w	Lff517a					;$6700,$00aa		;ff50ce
	cmp.b	#$b0,d1					;$b23c,$00b0		;ff50d2
	beq.s	Lff50e4					;$670c			;ff50d6
	btst.b	#$05,($0810)				;$0838,$0005,$0810	;ff50d8
	beq.s	Lff50e4					;$6704			;ff50de
	or.w	#$8000,d1				;$827c,$8000		;ff50e0
Lff50e4:									;ff50e4
	or.l	#$00060000,d1				;$82bc,$0006,$0000	;ff50e4
	lea.l	($0c36),a1				;$43f8,$0c36		;ff50ea
	movem.l	a0,-(a7)				;$48e7,$0080		;ff50ee
	bsr.w	Call_FNTGET				;$6100,$2476		;ff50f2
	movem.l	(a7)+,a0				;$4cdf,$0100		;ff50f6
	move.w	(a0),d1					;$3210			;ff50fa
	add.w	($0bb0),d1				;$d278,$0bb0		;ff50fc
	move.w	($0004,a0),d0				;$3028,$0004		;ff5100
	subq.w	#6,d0					;$5d40			;ff5104
	lsr.w	#1,d0					;$e248			;ff5106
	add.w	d0,d1					;$d240			;ff5108
	move.w	($0002,a0),d2				;$3428,$0002		;ff510a
	add.w	($0bb2),d2				;$d478,$0bb2		;ff510e
	move.w	($0006,a0),d0				;$3028,$0006		;ff5112
	sub.w	#$000c,d0				;$907c,$000c		;ff5116
	lsr.w	#1,d0					;$e248			;ff511a
	add.w	d0,d2					;$d440			;ff511c
	lea.l	($0c36),a1				;$43f8,$0c36		;ff511e
	movem.l	d3-d7/a2,-(a7)				;$48e7,$1f20		;ff5122
	and.l	#$0000ffff,d2				;$c4bc,$0000,$ffff	;ff5126
	asl.l	#7,d2					;$ef82			;ff512c
	clr.l	d0					;$4280			;ff512e
	move.w	d1,d0					;$3001			;ff5130
	lsr.w	#3,d0					;$e648			;ff5132
	add.l	d0,d2					;$d480			;ff5134
	add.l	#$00e60000,d2				;$d4bc,$00e6,$0000	;ff5136
	movea.l	d2,a2					;$2442			;ff513c
	move.w	#$fc00,d2				;$343c,$fc00		;ff513e
	and.w	#$0007,d1				;$c27c,$0007		;ff5142
	ror.w	d1,d2					;$e27a			;ff5146
	move.w	d2,d3					;$3602			;ff5148
	not.w	d3					;$4643			;ff514a
	move.w	(a1)+,d4				;$3819			;ff514c
	move.w	(a1)+,d4				;$3819			;ff514e
	subq.w	#1,d4					;$5344			;ff5150
	move.l	#$00000080,d5				;$2a3c,$0000,$0080	;ff5152
Lff5158:									;ff5158
	move.b	(a2)+,d6				;$1c1a			;ff5158
	rol.w	#8,d6					;$e15e			;ff515a
	move.b	(a2),d6					;$1c12			;ff515c
	clr.w	d7					;$4247			;ff515e
	move.b	(a1)+,d7				;$1e19			;ff5160
	rol.w	#8,d7					;$e15f			;ff5162
	ror.w	d1,d7					;$e27f			;ff5164
	and.w	d3,d6					;$cc43			;ff5166
	or.w	d7,d6					;$8c47			;ff5168
	move.b	d6,(a2)					;$1486			;ff516a
	ror.w	#8,d6					;$e05e			;ff516c
	move.b	d6,-(a2)				;$1506			;ff516e
	adda.l	d5,a2					;$d5c5			;ff5170
	dbra.w	d4,Lff5158				;$51cc,$ffe4		;ff5172
	movem.l	(a7)+,d3-d7/a2				;$4cdf,$04f8		;ff5176
Lff517a:									;ff517a
	rts						;$4e75			;ff517a

Lff517c:									;ff517c
	clr.b	($0bc3)					;$4238,$0bc3		;ff517c
	move.w	#$ffff,($0bb8)				;$31fc,$ffff,$0bb8	;ff5180
	bclr.b	#$00,($0bbf)				;$08b8,$0000,$0bbf	;ff5186
	tst.b	($0bc6)					;$4a38,$0bc6		;ff518c
	beq.s	Lff519e					;$670c			;ff5190
	bsr.w	Lff448e					;$6100,$f2fa		;ff5192
	move.w	d0,($0bfc)				;$31c0,$0bfc		;ff5196
	move.w	d1,($0bfe)				;$31c1,$0bfe		;ff519a
Lff519e:									;ff519e
	bsr.w	Call_MS_STAT				;$6100,$5918		;ff519e
	move.w	d0,-(a7)				;$3f00			;ff51a2
	bsr.w	Call_MS_CUROF				;$6100,$58e4		;ff51a4
	clr.w	-(a7)					;$4267			;ff51a8
	move.w	#$0096,-(a7)				;$3f3c,$0096		;ff51aa
	move.w	#$0172,-(a7)				;$3f3c,$0172		;ff51ae
	move.w	($0bb2),-(a7)				;$3f38,$0bb2		;ff51b2
	move.w	($0bb0),-(a7)				;$3f38,$0bb0		;ff51b6
	move.w	#$0002,-(a7)				;$3f3c,$0002		;ff51ba
	bsr.w	Lff67c4					;$6100,$1604		;ff51be
	lea.l	($000c,a7),a7				;$4fef,$000c		;ff51c2
	clr.w	-(a7)					;$4267			;ff51c6
	move.w	#$0096,-(a7)				;$3f3c,$0096		;ff51c8
	move.w	#$0172,-(a7)				;$3f3c,$0172		;ff51cc
	move.w	($0bb2),-(a7)				;$3f38,$0bb2		;ff51d0
	move.w	($0bb0),-(a7)				;$3f38,$0bb0		;ff51d4
	move.w	#$0003,-(a7)				;$3f3c,$0003		;ff51d8
	bsr.w	Lff67c4					;$6100,$15e6		;ff51dc
	lea.l	($000c,a7),a7				;$4fef,$000c		;ff51e0
	bra.w	Lff4fb6					;$6000,$fdd0		;ff51e4
Lff51e8:									;ff51e8
	moveq.l	#$ff,d0					;$70ff			;ff51e8
	sub.w	($0bb0),d1				;$9278,$0bb0		;ff51ea
	sub.w	($0bb2),d2				;$9478,$0bb2		;ff51ee
	cmp.w	#$0096,d2				;$b47c,$0096		;ff51f2
	bcc.s	Lff5226					;$642e			;ff51f6
	cmp.w	#$0172,d1				;$b27c,$0172		;ff51f8
	bcc.s	Lff5226					;$6428			;ff51fc
Lff51fe:									;ff51fe
	lea.l	(Lff5314,pc),a0				;$41fa,$0114		;ff51fe
Lff5202:									;ff5202
	move.w	(a0)+,d0				;$3018			;ff5202
	bmi.s	Lff5226					;$6b20			;ff5204
	move.w	(a0)+,d3				;$3618			;ff5206
	move.w	(a0)+,d4				;$3818			;ff5208
	cmp.w	d3,d1					;$b243			;ff520a
	bcs.s	Lff5220					;$6512			;ff520c
	cmp.w	d4,d2					;$b444			;ff520e
	bcs.s	Lff5220					;$650e			;ff5210
	add.w	(a0),d3					;$d650			;ff5212
	add.w	($0002,a0),d4				;$d868,$0002		;ff5214
	cmp.w	d3,d1					;$b243			;ff5218
	bcc.s	Lff5220					;$6404			;ff521a
	cmp.w	d4,d2					;$b444			;ff521c
	bcs.s	Lff5224					;$6504			;ff521e
Lff5220:									;ff5220
	addq.l	#4,a0					;$5888			;ff5220
	bra.s	Lff5202					;$60de			;ff5222
Lff5224:									;ff5224
	subq.l	#4,a0					;$5988			;ff5224
Lff5226:									;ff5226
	tst.w	d0					;$4a40			;ff5226
	rts						;$4e75			;ff5228

Lff522a:									;ff522a
	and.w	#$00ff,d0				;$c07c,$00ff		;ff522a
	clr.w	d1					;$4241			;ff522e
	cmp.b	#$35,d0					;$b03c,$0035		;ff5230
	bcs.s	Lff523e					;$6508			;ff5234
	cmp.b	#$80,d0					;$b03c,$0080		;ff5236
	bcs.s	Lff5290					;$6554			;ff523a
	rts						;$4e75			;ff523c

Lff523e:									;ff523e
	move.b	($0811),d2				;$1438,$0811		;ff523e
	btst.l	#$01,d2					;$0802,$0001		;ff5242
	bne.w	Lff52f2					;$6600,$00aa		;ff5246
	btst.l	#$06,d2					;$0802,$0006		;ff524a
	bne.s	Lff5290					;$6640			;ff524e
	btst.l	#$02,d2					;$0802,$0002		;ff5250
	bne.s	Lff526a					;$6614			;ff5254
	btst.l	#$03,d2					;$0802,$0003		;ff5256
	bne.w	Lff5310					;$6600,$00b4		;ff525a
	btst.l	#$04,d2					;$0802,$0004		;ff525e
	bne.s	Lff52aa					;$6646			;ff5262
	btst.l	#$05,d2					;$0802,$0005		;ff5264
	bne.s	Lff529a					;$6630			;ff5268
Lff526a:									;ff526a
	bsr.s	Lff529a					;$612e			;ff526a
	btst.l	#$07,d2					;$0802,$0007		;ff526c
	bne.s	Lff528e					;$661c			;ff5270
	cmp.b	#$41,d1					;$b23c,$0041		;ff5272
	bcs.s	Lff528e					;$6516			;ff5276
	cmp.b	#$5b,d1					;$b23c,$005b		;ff5278
	bcs.s	Lff528a					;$650c			;ff527c
	cmp.b	#$61,d1					;$b23c,$0061		;ff527e
	bcs.s	Lff528e					;$650a			;ff5282
	cmp.b	#$7b,d1					;$b23c,$007b		;ff5284
	bcc.s	Lff528e					;$6404			;ff5288
Lff528a:									;ff528a
	eori.b	#$20,d1					;$0a01,$0020		;ff528a
Lff528e:									;ff528e
	rts						;$4e75			;ff528e

Lff5290:									;ff5290
	lea.l	(Lff5fca,pc),a0				;$41fa,$0d38		;ff5290
	move.b	(a0,d0.w),d1				;$1230,$0000		;ff5294
	rts						;$4e75			;ff5298

Lff529a:									;ff529a
	btst.l	#$00,d2					;$0802,$0000		;ff529a
	beq.s	Lff5290					;$67f0			;ff529e
Lff52a0:									;ff52a0
	lea.l	(Lff604a,pc),a0				;$41fa,$0da8		;ff52a0
	move.b	(a0,d0.w),d1				;$1230,$0000		;ff52a4
	rts						;$4e75			;ff52a8

Lff52aa:									;ff52aa
	tst.b	($00ed002b)				;$4a39,$00ed,$002b	;ff52aa
	bne.s	Lff52ca					;$6618			;ff52b0
	lea.l	(Lff607f,pc),a0				;$41fa,$0dcb		;ff52b2
	move.b	(a0,d0.w),d1				;$1230,$0000		;ff52b6
	btst.l	#$00,d2					;$0802,$0000		;ff52ba
	beq.s	Lff52e8					;$6728			;ff52be
	lea.l	(Lff60b4,pc),a0				;$41fa,$0df2		;ff52c0
	move.w	#$000f,d2				;$343c,$000f		;ff52c4
	bra.s	Lff52e0					;$6016			;ff52c8
Lff52ca:									;ff52ca
	lea.l	(Lff60c4,pc),a0				;$41fa,$0df8		;ff52ca
	move.b	(a0,d0.w),d1				;$1230,$0000		;ff52ce
	btst.l	#$00,d2					;$0802,$0000		;ff52d2
	beq.s	Lff52e8					;$6710			;ff52d6
	lea.l	(Lff60f9,pc),a0				;$41fa,$0e1f		;ff52d8
	move.w	#$0010,d2				;$343c,$0010		;ff52dc
Lff52e0:									;ff52e0
	cmp.b	(a0)+,d1				;$b218			;ff52e0
	beq.s	Lff52ea					;$6706			;ff52e2
	dbra.w	d2,Lff52e0				;$51ca,$fffa		;ff52e4
Lff52e8:									;ff52e8
	rts						;$4e75			;ff52e8

Lff52ea:									;ff52ea
	add.b	#$a0,d2					;$d43c,$00a0		;ff52ea
	move.b	d2,d1					;$1202			;ff52ee
	rts						;$4e75			;ff52f0

Lff52f2:									;ff52f2
	bsr.s	Lff52a0					;$61ac			;ff52f2
	tst.b	d1					;$4a01			;ff52f4
	beq.s	Lff5308					;$6710			;ff52f6
	cmp.b	#$41,d1					;$b23c,$0041		;ff52f8
	bcs.s	Lff530a					;$650c			;ff52fc
	cmp.b	#$7f,d1					;$b23c,$007f		;ff52fe
	bcc.s	Lff530a					;$6406			;ff5302
	and.w	#$00df,d1				;$c27c,$00df		;ff5304
Lff5308:									;ff5308
	rts						;$4e75			;ff5308

Lff530a:									;ff530a
	move.w	#$0020,d1				;$323c,$0020		;ff530a
	rts						;$4e75			;ff530e

Lff5310:									;ff5310
	clr.b	d1					;$4201			;ff5310
	rts						;$4e75			;ff5312

Lff5314:									;ff5314
	.dc.b	$07,$40,$00,$1e,$00,$03,$00,$0e					;ff5314
	.dc.b	$00,$0e,$3f,$6d,$01,$4c,$00,$15					;ff531c
	.dc.b	$00,$1d,$00,$0e,$07,$00,$00,$00					;ff5324
	.dc.b	$00,$00,$01,$72,$00,$14,$00,$00					;ff532c
	.dc.b	$00,$b7,$00,$01,$00,$ba,$00,$12					;ff5334
	.dc.b	$10,$61,$00,$0a,$00,$24,$00,$0e					;ff533c
	.dc.b	$00,$0e,$11,$62,$00,$1e,$00,$24					;ff5344
	.dc.b	$00,$0e,$00,$0e,$12,$63,$00,$34					;ff534c
	.dc.b	$00,$2a,$00,$11,$00,$08,$13,$64					;ff5354
	.dc.b	$00,$46,$00,$2a,$00,$11,$00,$08					;ff535c
	.dc.b	$14,$65,$00,$58,$00,$2a,$00,$11					;ff5364
	.dc.b	$00,$08,$15,$66,$00,$6a,$00,$2a					;ff536c
	.dc.b	$00,$11,$00,$08,$16,$67,$00,$7c					;ff5374
	.dc.b	$00,$2a,$00,$11,$00,$08,$17,$68					;ff537c
	.dc.b	$00,$98,$00,$2a,$00,$11,$00,$08					;ff5384
	.dc.b	$18,$69,$00,$aa,$00,$2a,$00,$11					;ff538c
	.dc.b	$00,$08,$19,$6a,$00,$bc,$00,$2a					;ff5394
	.dc.b	$00,$11,$00,$08,$1a,$6b,$00,$ce					;ff539c
	.dc.b	$00,$2a,$00,$11,$00,$08,$1b,$6c					;ff53a4
	.dc.b	$00,$e0,$00,$2a,$00,$11,$00,$08					;ff53ac
	.dc.b	$20,$52,$01,$3d,$00,$24,$00,$0e					;ff53b4
	.dc.b	$00,$0e,$21,$53,$01,$4c,$00,$24					;ff53bc
	.dc.b	$00,$0e,$00,$0e,$22,$54,$01,$5b					;ff53c4
	.dc.b	$00,$24,$00,$0e,$00,$0e,$23,$01					;ff53cc
	.dc.b	$00,$0a,$00,$3d,$00,$0e,$00,$0e					;ff53d4
	.dc.b	$00,$02,$00,$19,$00,$3d,$00,$0e					;ff53dc
	.dc.b	$00,$0e,$00,$03,$00,$28,$00,$3d					;ff53e4
	.dc.b	$00,$0e,$00,$0e,$00,$04,$00,$37					;ff53ec
	.dc.b	$00,$3d,$00,$0e,$00,$0e,$00,$05					;ff53f4
	.dc.b	$00,$46,$00,$3d,$00,$0e,$00,$0e					;ff53fc
	.dc.b	$00,$06,$00,$55,$00,$3d,$00,$0e					;ff5404
	.dc.b	$00,$0e,$00,$07,$00,$64,$00,$3d					;ff540c
	.dc.b	$00,$0e,$00,$0e,$00,$08,$00,$73					;ff5414
	.dc.b	$00,$3d,$00,$0e,$00,$0e,$00,$09					;ff541c
	.dc.b	$00,$82,$00,$3d,$00,$0e,$00,$0e					;ff5424
	.dc.b	$00,$0a,$00,$91,$00,$3d,$00,$0e					;ff542c
	.dc.b	$00,$0e,$00,$0b,$00,$a0,$00,$3d					;ff5434
	.dc.b	$00,$0e,$00,$0e,$00,$0c,$00,$af					;ff543c
	.dc.b	$00,$3d,$00,$0e,$00,$0e,$00,$0d					;ff5444
	.dc.b	$00,$be,$00,$3d,$00,$0e,$00,$0e					;ff544c
	.dc.b	$00,$0e,$00,$cd,$00,$3d,$00,$0e					;ff5454
	.dc.b	$00,$0e,$24,$0f,$00,$dc,$00,$3d					;ff545c
	.dc.b	$00,$16,$00,$0e,$25,$36,$00,$fa					;ff5464
	.dc.b	$00,$3d,$00,$0e,$00,$0e,$27,$37					;ff546c
	.dc.b	$01,$18,$00,$3d,$00,$0e,$00,$0e					;ff5474
	.dc.b	$28,$3f,$01,$2e,$00,$3d,$00,$0e					;ff547c
	.dc.b	$00,$0e,$00,$40,$01,$3d,$00,$3d					;ff5484
	.dc.b	$00,$0e,$00,$0e,$00,$41,$01,$4c					;ff548c
	.dc.b	$00,$3d,$00,$0e,$00,$0e,$00,$42					;ff5494
	.dc.b	$01,$5b,$00,$3d,$00,$0e,$00,$0e					;ff549c
	.dc.b	$29,$10,$00,$0a,$00,$4c,$00,$16					;ff54a4
	.dc.b	$00,$0e,$00,$11,$00,$21,$00,$4c					;ff54ac
	.dc.b	$00,$0e,$00,$0e,$00,$12,$00,$30					;ff54b4
	.dc.b	$00,$4c,$00,$0e,$00,$0e,$00,$13					;ff54bc
	.dc.b	$00,$3f,$00,$4c,$00,$0e,$00,$0e					;ff54c4
	.dc.b	$00,$14,$00,$4e,$00,$4c,$00,$0e					;ff54cc
	.dc.b	$00,$0e,$00,$15,$00,$5d,$00,$4c					;ff54d4
	.dc.b	$00,$0e,$00,$0e,$00,$16,$00,$6c					;ff54dc
	.dc.b	$00,$4c,$00,$0e,$00,$0e,$00,$17					;ff54e4
	.dc.b	$00,$7b,$00,$4c,$00,$0e,$00,$0e					;ff54ec
	.dc.b	$00,$18,$00,$8a,$00,$4c,$00,$0e					;ff54f4
	.dc.b	$00,$0e,$00,$19,$00,$99,$00,$4c					;ff54fc
	.dc.b	$00,$0e,$00,$0e,$00,$1a,$00,$a8					;ff5504
	.dc.b	$00,$4c,$00,$0e,$00,$0e,$00,$1b					;ff550c
	.dc.b	$00,$b7,$00,$4c,$00,$0e,$00,$0e					;ff5514
	.dc.b	$00,$1c,$00,$c6,$00,$4c,$00,$0e					;ff551c
	.dc.b	$00,$0e,$2a,$1d,$00,$d8,$00,$4c					;ff5524
	.dc.b	$00,$1a,$00,$1d,$2b,$38,$00,$fa					;ff552c
	.dc.b	$00,$4c,$00,$0e,$00,$0e,$2c,$39					;ff5534
	.dc.b	$01,$09,$00,$4c,$00,$0e,$00,$0e					;ff553c
	.dc.b	$2d,$3a,$01,$18,$00,$4c,$00,$0e					;ff5544
	.dc.b	$00,$0e,$00,$43,$01,$2e,$00,$4c					;ff554c
	.dc.b	$00,$0e,$00,$0e,$00,$44,$01,$3d					;ff5554
	.dc.b	$00,$4c,$00,$0e,$00,$0e,$00,$45					;ff555c
	.dc.b	$01,$4c,$00,$4c,$00,$0e,$00,$0e					;ff5564
	.dc.b	$00,$46,$01,$5b,$00,$4c,$00,$0e					;ff556c
	.dc.b	$00,$0e,$00,$1e,$00,$24,$00,$5b					;ff5574
	.dc.b	$00,$0e,$00,$0e,$00,$1f,$00,$33					;ff557c
	.dc.b	$00,$5b,$00,$0e,$00,$0e,$00,$20					;ff5584
	.dc.b	$00,$42,$00,$5b,$00,$0e,$00,$0e					;ff558c
	.dc.b	$00,$21,$00,$51,$00,$5b,$00,$0e					;ff5594
	.dc.b	$00,$0e,$00,$22,$00,$60,$00,$5b					;ff559c
	.dc.b	$00,$0e,$00,$0e,$00,$23,$00,$6f					;ff55a4
	.dc.b	$00,$5b,$00,$0e,$00,$0e,$00,$24					;ff55ac
	.dc.b	$00,$7e,$00,$5b,$00,$0e,$00,$0e					;ff55b4
	.dc.b	$00,$25,$00,$8d,$00,$5b,$00,$0e					;ff55bc
	.dc.b	$00,$0e,$00,$26,$00,$9c,$00,$5b					;ff55c4
	.dc.b	$00,$0e,$00,$0e,$00,$27,$00,$ab					;ff55cc
	.dc.b	$00,$5b,$00,$0e,$00,$0e,$00,$28					;ff55d4
	.dc.b	$00,$ba,$00,$5b,$00,$0e,$00,$0e					;ff55dc
	.dc.b	$00,$29,$00,$c9,$00,$5b,$00,$0e					;ff55e4
	.dc.b	$00,$0e,$2f,$3b,$00,$fa,$00,$5b					;ff55ec
	.dc.b	$00,$0e,$00,$1d,$30,$3c,$01,$09					;ff55f4
	.dc.b	$00,$5b,$00,$0e,$00,$0e,$31,$3d					;ff55fc
	.dc.b	$01,$18,$00,$5b,$00,$0e,$00,$1d					;ff5604
	.dc.b	$00,$47,$01,$2e,$00,$5b,$00,$0e					;ff560c
	.dc.b	$00,$0e,$00,$48,$01,$3d,$00,$5b					;ff5614
	.dc.b	$00,$0e,$00,$0e,$00,$49,$01,$4c					;ff561c
	.dc.b	$00,$5b,$00,$0e,$00,$0e,$00,$4a					;ff5624
	.dc.b	$01,$5b,$00,$5b,$00,$0e,$00,$0e					;ff562c
	.dc.b	$00,$2a,$00,$2c,$00,$6a,$00,$0e					;ff5634
	.dc.b	$00,$0e,$00,$2b,$00,$3b,$00,$6a					;ff563c
	.dc.b	$00,$0e,$00,$0e,$00,$2c,$00,$4a					;ff5644
	.dc.b	$00,$6a,$00,$0e,$00,$0e,$00,$2d					;ff564c
	.dc.b	$00,$59,$00,$6a,$00,$0e,$00,$0e					;ff5654
	.dc.b	$00,$2e,$00,$68,$00,$6a,$00,$0e					;ff565c
	.dc.b	$00,$0e,$00,$2f,$00,$77,$00,$6a					;ff5664
	.dc.b	$00,$0e,$00,$0e,$00,$30,$00,$86					;ff566c
	.dc.b	$00,$6a,$00,$0e,$00,$0e,$00,$31					;ff5674
	.dc.b	$00,$95,$00,$6a,$00,$0e,$00,$0e					;ff567c
	.dc.b	$00,$32,$00,$a4,$00,$6a,$00,$0e					;ff5684
	.dc.b	$00,$0e,$00,$33,$00,$b3,$00,$6a					;ff568c
	.dc.b	$00,$0e,$00,$0e,$00,$34,$00,$c2					;ff5694
	.dc.b	$00,$6a,$00,$0e,$00,$0e,$33,$3e					;ff569c
	.dc.b	$01,$09,$00,$6a,$00,$0e,$00,$0e					;ff56a4
	.dc.b	$00,$4b,$01,$2e,$00,$6a,$00,$0e					;ff56ac
	.dc.b	$00,$0e,$00,$4c,$01,$3d,$00,$6a					;ff56b4
	.dc.b	$00,$0e,$00,$0e,$00,$4d,$01,$4c					;ff56bc
	.dc.b	$00,$6a,$00,$0e,$00,$0e,$34,$4e					;ff56c4
	.dc.b	$01,$5b,$00,$6a,$00,$0e,$00,$1d					;ff56cc
	.dc.b	$36,$55,$00,$35,$00,$79,$00,$11					;ff56d4
	.dc.b	$00,$0e,$37,$56,$00,$47,$00,$79					;ff56dc
	.dc.b	$00,$11,$00,$0e,$00,$35,$00,$59					;ff56e4
	.dc.b	$00,$79,$00,$33,$00,$0e,$38,$57					;ff56ec
	.dc.b	$00,$8d,$00,$79,$00,$16,$00,$0e					;ff56f4
	.dc.b	$39,$58,$00,$a4,$00,$79,$00,$11					;ff56fc
	.dc.b	$00,$0e,$3a,$59,$00,$b6,$00,$79					;ff5704
	.dc.b	$00,$11,$00,$0e,$00,$4f,$01,$2e					;ff570c
	.dc.b	$00,$79,$00,$0e,$00,$0e,$3e,$50					;ff5714
	.dc.b	$01,$3d,$00,$79,$00,$0e,$00,$0e					;ff571c
	.dc.b	$00,$51,$01,$4c,$00,$79,$00,$0e					;ff5724
	.dc.b	$00,$0e								;ff572c
Lff572e:									;ff572e
	.dc.b	$1c,$5a								;ff572e
Lff5730:									;ff5730
	.dc.b	$00,$fa,$00,$24,$00,$0e,$00,$0e					;ff5730
	.dc.b	$1d,$5b								;ff5738
Lff573a:									;ff573a
	.dc.b	$01,$09,$00,$24,$00,$0e,$00,$0e					;ff573a
	.dc.b	$1e,$5c,$01,$18,$00,$24,$00,$0e					;ff5742
	.dc.b	$00,$0e,$1f,$5d,$01,$2e,$00,$24					;ff574a
	.dc.b	$00,$0e,$00,$0e,$26,$5e,$01,$09					;ff5752
	.dc.b	$00,$3d,$00,$0e,$00,$0e,$35,$5f					;ff575a
	.dc.b	$00,$26,$00,$79,$00,$0e,$00,$0e					;ff5762
	.dc.b	$3b,$60,$00,$c8,$00,$79,$00,$0e					;ff576a
	.dc.b	$00,$0e,$32,$70							;ff5772
Lff5776:									;ff5776
	.dc.b	$00,$0a,$00,$6a,$00,$21,$00,$0e					;ff5776
	.dc.b	$32,$70								;ff577e
Lff5780:									;ff5780
	.dc.b	$00,$d1,$00,$6a,$00,$21,$00,$0e					;ff5780
	.dc.b	$2e,$71,$00,$0a,$00,$5b,$00,$19					;ff5788
	.dc.b	$00,$0e,$3c,$72,$00,$fa,$00,$79					;ff5790
	.dc.b	$00,$15,$00,$0e,$3d,$73,$01,$11					;ff5798
	.dc.b	$00,$79,$00,$15,$00,$0e,$00,$00					;ff57a0
	.dc.b	$00,$00,$00,$00,$01,$71,$00,$95					;ff57a8
	.dc.b	$ff,$ff								;ff57b0
Lff57b2:									;ff57b2
	.dc.b	$10,$00,$00,$1c,$00,$0c,$00,$0c					;ff57b2
	.dc.b	$00,$00,$00,$00,$00,$00,$72,$40					;ff57ba
	.dc.b	$4a,$80,$4b,$00,$73,$00,$4a,$80					;ff57c2
	.dc.b	$4a,$40,$72,$20,$00,$00,$00,$00					;ff57ca
	.dc.b	$11,$00,$00,$1c,$00,$0c,$00,$0c					;ff57d2
	.dc.b	$00,$00,$00,$00,$00,$00,$39,$c0					;ff57da
	.dc.b	$45,$40,$41,$40,$41,$c0,$41,$00					;ff57e2
	.dc.b	$45,$00,$39,$00,$00,$00,$00,$00					;ff57ea
	.dc.b	$12,$00,$00,$10,$00,$0f,$00,$06					;ff57f2
	.dc.b	$00,$00,$1e,$20,$10,$20,$1c,$20					;ff57fa
	.dc.b	$10,$20,$10,$20,$13,$00,$00,$10					;ff5802
	.dc.b	$00,$0f,$00,$06,$00,$00,$1e,$30					;ff580a
	.dc.b	$10,$48,$1c,$10,$10,$20,$10,$78					;ff5812
	.dc.b	$14,$00,$00,$10,$00,$0f,$00,$06					;ff581a
	.dc.b	$00,$00,$1e,$70,$10,$08,$1c,$30					;ff5822
	.dc.b	$10,$08,$10,$70,$15,$00,$00,$10					;ff582a
	.dc.b	$00,$0f,$00,$06,$00,$00,$1e,$20					;ff5832
	.dc.b	$10,$40,$1c,$a0,$11,$f0,$10,$20					;ff583a
	.dc.b	$16,$00,$00,$10,$00,$0f,$00,$06					;ff5842
	.dc.b	$00,$00,$1e,$70,$10,$40,$1c,$70					;ff584a
	.dc.b	$10,$08,$10,$70,$17,$00,$00,$10					;ff5852
	.dc.b	$00,$0f,$00,$06,$00,$00,$1e,$30					;ff585a
	.dc.b	$10,$40,$1c,$70,$10,$48,$10,$70					;ff5862
	.dc.b	$18,$00,$00,$10,$00,$0f,$00,$06					;ff586a
	.dc.b	$00,$00,$1e,$78,$10,$08,$1c,$10					;ff5872
	.dc.b	$10,$20,$10,$20,$19,$00,$00,$10					;ff587a
	.dc.b	$00,$0f,$00,$06,$00,$00,$1e,$70					;ff5882
	.dc.b	$10,$88,$1c,$70,$10,$88,$10,$70					;ff588a
	.dc.b	$1a,$00,$00,$10,$00,$0f,$00,$06					;ff5892
	.dc.b	$00,$00,$1e,$70,$10,$88,$1c,$78					;ff589a
	.dc.b	$10,$08,$10,$70,$1b,$00,$00,$10					;ff58a2
	.dc.b	$00,$0f,$00,$06,$00,$00,$1e,$98					;ff58aa
	.dc.b	$10,$a4,$1c,$a4,$10,$a4,$10,$98					;ff58b2
	.dc.b	$1c,$00,$00,$1c,$00,$0c,$00,$0c					;ff58ba
	.dc.b	$00,$00,$00,$00,$51,$00,$4b,$a0					;ff58c2
	.dc.b	$e5,$10,$51,$40,$52,$40,$51,$c0					;ff58ca
	.dc.b	$91,$60,$31,$d0,$00,$00,$00,$00					;ff58d2
	.dc.b	$1d,$00,$00,$1c,$00,$0c,$00,$0c					;ff58da
	.dc.b	$00,$00,$00,$00,$00,$00,$f1,$f0					;ff58e2
	.dc.b	$90,$10,$90,$10,$96,$10,$90,$a0					;ff58ea
	.dc.b	$90,$40,$f0,$20,$00,$00,$00,$00					;ff58f2
	.dc.b	$1e,$00,$00,$1c,$00,$0c,$00,$0c					;ff58fa
	.dc.b	$00,$00,$00,$00,$00,$30,$70,$b0					;ff5902
	.dc.b	$10,$80,$10,$80,$16,$c0,$10,$a0					;ff590a
	.dc.b	$10,$80,$70,$80,$00,$00,$00,$00					;ff5912
	.dc.b	$1f,$00,$00,$1c,$00,$0c,$00,$0c					;ff591a
	.dc.b	$00,$00,$00,$00,$00,$00,$64,$e0					;ff5922
	.dc.b	$8a,$90,$8a,$90,$8e,$e0,$8a,$80					;ff592a
	.dc.b	$9a,$80,$6a,$80,$00,$00,$00,$00					;ff5932
	.dc.b	$23,$00,$00,$1c,$00,$0c,$00,$0c					;ff593a
	.dc.b	$00,$00,$00,$00,$00,$00,$f6,$60					;ff5942
	.dc.b	$89,$90,$88,$80,$e6,$80,$81,$80					;ff594a
	.dc.b	$89,$90,$f6,$60,$00,$00,$00,$00					;ff5952
	.dc.b	$24,$00,$00,$28,$00,$14,$00,$0c					;ff595a
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00					;ff5962
	.dc.b	$00,$0f,$0e,$00,$08,$91,$00,$08					;ff596a
	.dc.b	$90,$00,$0f,$0e,$00,$08,$81,$00					;ff5972
	.dc.b	$08,$91,$00,$0f,$0e,$00,$00,$00					;ff597a
	.dc.b	$00,$00,$00,$00,$26,$00,$00,$1c					;ff5982
	.dc.b	$00,$0c,$00,$0c,$00,$00,$00,$00					;ff598a
	.dc.b	$00,$00,$52,$60,$52,$90,$5a,$80					;ff5992
	.dc.b	$5a,$60,$56,$10,$56,$90,$52,$60					;ff599a
	.dc.b	$00,$00,$00,$00,$29,$00,$00,$28					;ff59a2
	.dc.b	$00,$14,$00,$0c,$00,$00,$00,$00					;ff59aa
	.dc.b	$00,$00,$00,$00,$00,$7c,$47,$80					;ff59b2
	.dc.b	$10,$a4,$40,$11,$14,$40,$11,$17					;ff59ba
	.dc.b	$80,$11,$f4,$40,$11,$14,$40,$11					;ff59c2
	.dc.b	$17,$80,$00,$00,$00,$00,$00,$00					;ff59ca
	.dc.b	$2a,$00,$00,$56,$00,$18,$00,$1b					;ff59d2
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00					;ff59da
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00					;ff59e2
	.dc.b	$00,$00,$00,$01,$e0,$00,$01,$20					;ff59ea
	.dc.b	$00,$01,$20,$00,$01,$20,$00,$01					;ff59f2
	.dc.b	$20,$00,$01,$20,$00,$01,$20,$00					;ff59fa
	.dc.b	$01,$20,$00,$41,$20,$00,$c1,$20					;ff5a02
	.dc.b	$01,$41,$20,$02,$7f,$20,$04,$00					;ff5a0a
	.dc.b	$20,$04,$00,$20,$02,$7f,$e0,$01					;ff5a12
	.dc.b	$40,$00,$00,$c0,$00,$00,$40,$00					;ff5a1a
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00					;ff5a22
	.dc.b	$00,$00,$2e,$00,$00,$28,$00,$17					;ff5a2a
	.dc.b	$00,$0c,$00,$00,$00,$00,$00,$00					;ff5a32
	.dc.b	$00,$00,$00,$3b,$ef,$20,$44,$88					;ff5a3a
	.dc.b	$a0,$40,$88,$a0,$40,$8f,$20,$40					;ff5a42
	.dc.b	$8a,$20,$44,$89,$20,$38,$88,$bc					;ff5a4a
	.dc.b	$00,$00,$00,$00,$00,$00,$2f,$00					;ff5a52
	.dc.b	$00,$3a,$00,$0c,$00,$1b,$00,$00					;ff5a5a
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00					;ff5a62
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00					;ff5a6a
	.dc.b	$00,$00,$04,$00,$0c,$00,$17,$c0					;ff5a72
	.dc.b	$20,$40,$17,$c0,$0c,$00,$04,$00					;ff5a7a
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00					;ff5a82
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00					;ff5a8a
	.dc.b	$00,$00,$00,$00,$30,$00,$00,$1c					;ff5a92
	.dc.b	$00,$0c,$00,$0c,$00,$00,$00,$00					;ff5a9a
	.dc.b	$04,$00,$0a,$00,$11,$00,$2b,$80					;ff5aa2
	.dc.b	$0a,$00,$0a,$00,$0a,$00,$0e,$00					;ff5aaa
	.dc.b	$00,$00,$00,$00,$31,$00,$00,$3a					;ff5ab2
	.dc.b	$00,$0c,$00,$1b,$00,$00,$00,$00					;ff5aba
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00					;ff5ac2
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00					;ff5aca
	.dc.b	$02,$00,$03,$00,$3e,$80,$20,$40					;ff5ad2
	.dc.b	$3e,$80,$03,$00,$02,$00,$00,$00					;ff5ada
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00					;ff5ae2
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00					;ff5aea
	.dc.b	$00,$00,$32,$00,$00,$34,$00,$1f					;ff5af2
	.dc.b	$00,$0c,$00,$00,$00,$00,$00,$00					;ff5afa
	.dc.b	$00,$00,$00,$00,$00,$00,$1c,$89					;ff5b02
	.dc.b	$3e,$f8,$22,$89,$20,$20,$20,$89					;ff5b0a
	.dc.b	$20,$20,$1c,$f9,$3c,$20,$02,$89					;ff5b12
	.dc.b	$20,$20,$22,$89,$20,$20,$1c,$89					;ff5b1a
	.dc.b	$20,$20,$00,$00,$00,$00,$00,$00					;ff5b22
	.dc.b	$00,$00,$33,$00,$00,$1c,$00,$0c					;ff5b2a
	.dc.b	$00,$0c,$00,$00,$00,$00,$0e,$00					;ff5b32
	.dc.b	$0a,$00,$0a,$00,$0a,$00,$3b,$80					;ff5b3a
	.dc.b	$11,$00,$0a,$00,$04,$00,$00,$00					;ff5b42
	.dc.b	$00,$00,$35,$00,$00,$1c,$00,$0c					;ff5b4a
	.dc.b	$00,$0c,$00,$00,$00,$00,$00,$00					;ff5b52
	.dc.b	$65,$40,$ab,$20,$29,$00,$29,$c0					;ff5b5a
	.dc.b	$28,$20,$2a,$20,$11,$c0,$00,$00					;ff5b62
	.dc.b	$00,$00,$36,$00,$00,$1c,$00,$0f					;ff5b6a
	.dc.b	$00,$0c,$00,$00,$00,$00,$00,$00					;ff5b72
	.dc.b	$45,$e4,$45,$0c,$29,$04,$11,$c4					;ff5b7a
	.dc.b	$29,$04,$45,$04,$45,$04,$00,$00					;ff5b82
	.dc.b	$00,$00,$37,$00,$00,$1c,$00,$0f					;ff5b8a
	.dc.b	$00,$0c,$00,$00,$00,$00,$00,$00					;ff5b92
	.dc.b	$45,$ec,$45,$12,$29,$02,$11,$c4					;ff5b9a
	.dc.b	$29,$08,$45,$10,$45,$1e,$00,$00					;ff5ba2
	.dc.b	$00,$00,$38,$00,$00,$28,$00,$14					;ff5baa
	.dc.b	$00,$0c,$00,$00,$00,$00,$00,$00					;ff5bb2
	.dc.b	$00,$00,$00,$45,$f3,$80,$45,$04					;ff5bba
	.dc.b	$40,$29,$00,$40,$11,$e1,$80,$29					;ff5bc2
	.dc.b	$00,$40,$45,$04,$40,$45,$03,$80					;ff5bca
	.dc.b	$00,$00,$00,$00,$00,$00,$39,$00					;ff5bd2
	.dc.b	$00,$1c,$00,$0f,$00,$0c,$00,$00					;ff5bda
	.dc.b	$00,$00,$00,$00,$45,$e4,$45,$0c					;ff5be2
	.dc.b	$29,$0c,$11,$d4,$29,$14,$45,$3e					;ff5bea
	.dc.b	$45,$04,$00,$00,$00,$00,$3a,$00					;ff5bf2
	.dc.b	$00,$1c,$00,$0f,$00,$0c,$00,$00					;ff5bfa
	.dc.b	$00,$00,$00,$00,$45,$fe,$45,$10					;ff5c02
	.dc.b	$29,$10,$11,$dc,$29,$02,$45,$02					;ff5c0a
	.dc.b	$45,$1c,$00,$00,$00,$00,$3b,$00					;ff5c12
	.dc.b	$00,$1c,$00,$0c,$00,$0c,$00,$00					;ff5c1a
	.dc.b	$04,$00,$0a,$00,$11,$00,$3f,$80					;ff5c22
	.dc.b	$44,$40,$04,$00,$1f,$00,$04,$00					;ff5c2a
	.dc.b	$04,$00,$3f,$80,$00,$00,$3c,$00					;ff5c32
	.dc.b	$00,$28,$00,$13,$00,$0c,$00,$00					;ff5c3a
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$1c					;ff5c42
	.dc.b	$f0,$80,$22,$88,$80,$22,$89,$80					;ff5c4a
	.dc.b	$22,$f0,$80,$22,$80,$80,$22,$84					;ff5c52
	.dc.b	$80,$1c,$84,$80,$00,$00,$00,$00					;ff5c5a
	.dc.b	$00,$00,$3d,$00,$00,$28,$00,$13					;ff5c62
	.dc.b	$00,$0c,$00,$00,$00,$00,$00,$00					;ff5c6a
	.dc.b	$00,$00,$00,$1c,$f1,$80,$22,$8a					;ff5c72
	.dc.b	$40,$22,$88,$40,$22,$f0,$80,$22					;ff5c7a
	.dc.b	$81,$00,$22,$8a,$00,$1c,$8b,$c0					;ff5c82
	.dc.b	$00,$00,$00,$00,$00,$00,$3f,$00					;ff5c8a
	.dc.b	$00,$34,$00,$1b,$00,$0c,$00,$00					;ff5c92
	.dc.b	$00,$00,$1f,$ff,$ff,$80,$20,$00					;ff5c9a
	.dc.b	$00,$40,$2f,$f8,$00,$40,$28,$09					;ff5ca2
	.dc.b	$54,$40,$28,$08,$00,$40,$2f,$f9					;ff5caa
	.dc.b	$54,$40,$20,$00,$00,$40,$25,$55					;ff5cb2
	.dc.b	$54,$40,$20,$00,$00,$40,$1f,$ff					;ff5cba
	.dc.b	$ff,$80,$00,$00,$00,$00,$ff,$ff					;ff5cc2
Lff5cca:									;ff5cca
	.dc.b	$22,$00,$00,$1c,$00,$0c,$00,$0c					;ff5cca
	.dc.b	$00,$00,$00,$00,$00,$00,$af,$60					;ff5cd2
	.dc.b	$a9,$50,$a9,$50,$ed,$60,$a9,$40					;ff5cda
	.dc.b	$a9,$40,$af,$c0,$00,$00,$00,$00					;ff5ce2
	.dc.b	$21,$00,$00,$1c,$00,$0c,$00,$0c					;ff5cea
	.dc.b	$00,$00,$1e,$c0,$49,$40,$30,$80					;ff5cf2
	.dc.b	$3f,$c0,$40,$20,$1f,$80,$10,$80					;ff5cfa
	.dc.b	$1f,$80,$09,$00,$3f,$c0,$00,$00					;ff5d02
	.dc.b	$20,$00,$00,$1c,$00,$0c,$00,$0c					;ff5d0a
	.dc.b	$00,$00,$5d,$e0,$e5,$20,$05,$e0					;ff5d12
	.dc.b	$e4,$00,$1d,$e0,$f0,$80,$10,$e0					;ff5d1a
	.dc.b	$f0,$20,$b5,$20,$fc,$e0,$00,$00					;ff5d22
	.dc.b	$2d,$00,$00,$1c,$00,$0c,$00,$0c					;ff5d2a
	.dc.b	$00,$00,$00,$00,$00,$00,$4b,$80					;ff5d32
	.dc.b	$4a,$40,$4a,$20,$4a,$20,$4a,$20					;ff5d3a
	.dc.b	$4a,$40,$33,$80,$00,$00,$00,$00					;ff5d42
	.dc.b	$2b,$00,$00,$1c,$00,$0c,$00,$0c					;ff5d4a
	.dc.b	$00,$00,$00,$00,$00,$00,$4b,$c0					;ff5d52
	.dc.b	$4a,$20,$4a,$20,$4b,$c0,$4a,$00					;ff5d5a
	.dc.b	$4a,$00,$32,$00,$00,$00,$00,$00					;ff5d62
	.dc.b	$2c,$00,$00,$1c,$00,$0c,$00,$0c					;ff5d6a
	.dc.b	$00,$00,$00,$00,$00,$00,$72,$a0					;ff5d72
	.dc.b	$4a,$a0,$4a,$a0,$4a,$a0,$4a,$a0					;ff5d7a
	.dc.b	$4a,$a0,$71,$40,$00,$00,$00,$00					;ff5d82
	.dc.b	$28,$00,$00,$1c,$00,$0c,$00,$0c					;ff5d8a
	.dc.b	$00,$00,$00,$00,$00,$00,$39,$00					;ff5d92
	.dc.b	$45,$00,$41,$00,$41,$00,$41,$00					;ff5d9a
	.dc.b	$45,$00,$39,$e0,$00,$00,$00,$00					;ff5da2
	.dc.b	$3e,$00,$00,$1c,$00,$0c,$00,$0c					;ff5daa
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00					;ff5db2
	.dc.b	$00,$00,$00,$00,$00,$00,$06,$00					;ff5dba
	.dc.b	$06,$00,$02,$00,$04,$00,$00,$00					;ff5dc2
	.dc.b	$25,$00,$00,$1c,$00,$0c,$00,$0c					;ff5dca
	.dc.b	$00,$00,$00,$00,$00,$00,$4a,$20					;ff5dd2
	.dc.b	$4b,$60,$4a,$a0,$7a,$a0,$4a,$20					;ff5dda
	.dc.b	$4a,$20,$4a,$20,$00,$00,$00,$00					;ff5de2
	.dc.b	$27,$00,$00,$1c,$00,$0c,$00,$0c					;ff5dea
	.dc.b	$00,$00,$00,$00,$00,$00,$e7,$40					;ff5df2
	.dc.b	$94,$40,$94,$40,$97,$40,$94,$40					;ff5dfa
	.dc.b	$94,$40,$e7,$70,$00,$00,$00,$00					;ff5e02
	.dc.b	$34,$00,$00,$3a,$00,$0c,$00,$1b					;ff5e0a
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00					;ff5e12
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00					;ff5e1a
	.dc.b	$00,$00,$00,$00,$e9,$e0,$8d,$40					;ff5e22
	.dc.b	$8d,$40,$eb,$40,$8b,$40,$89,$40					;ff5e2a
	.dc.b	$e9,$40,$00,$00,$00,$00,$00,$00					;ff5e32
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00					;ff5e3a
	.dc.b	$00,$00,$00,$00,$00,$00,$ff,$ff					;ff5e42
Lff5e4a:									;ff5e4a
	.dc.b	$22,$00,$00,$1c,$00,$0c,$00,$0c					;ff5e4a
	.dc.b	$00,$00,$00,$00,$00,$00,$79,$10					;ff5e52
	.dc.b	$45,$10,$45,$b0,$79,$50,$51,$50					;ff5e5a
	.dc.b	$49,$10,$45,$10,$00,$00,$00,$00					;ff5e62
	.dc.b	$21,$00,$00,$1c,$00,$0c,$00,$0c					;ff5e6a
	.dc.b	$00,$00,$00,$00,$00,$00,$44,$00					;ff5e72
	.dc.b	$44,$40,$6c,$40,$55,$f0,$54,$40					;ff5e7a
	.dc.b	$44,$40,$44,$00,$00,$00,$00,$00					;ff5e82
	.dc.b	$20,$00,$00,$1c,$00,$0c,$00,$0c					;ff5e8a
	.dc.b	$00,$00,$00,$00,$00,$00,$44,$00					;ff5e92
	.dc.b	$44,$00,$6c,$00,$55,$e0,$54,$00					;ff5e9a
	.dc.b	$44,$00,$44,$00,$00,$00,$00,$00					;ff5ea2
	.dc.b	$2d,$00,$00,$1c,$00,$0c,$00,$0c					;ff5eaa
	.dc.b	$00,$00,$00,$00,$00,$00,$39,$e0					;ff5eb2
	.dc.b	$45,$00,$41,$00,$41,$c0,$41,$00					;ff5eba
	.dc.b	$45,$00,$39,$e0,$00,$00,$00,$00					;ff5ec2
	.dc.b	$2b,$00,$00,$1c,$00,$0c,$00,$0c					;ff5eca
	.dc.b	$00,$00,$00,$00,$00,$00,$45,$e0					;ff5ed2
	.dc.b	$45,$00,$45,$00,$7d,$c0,$45,$00					;ff5eda
	.dc.b	$45,$00,$45,$e0,$00,$00,$00,$00					;ff5ee2
	.dc.b	$2c,$00,$00,$1c,$00,$0c,$00,$0c					;ff5eea
	.dc.b	$00,$00,$00,$00,$00,$00,$79,$e0					;ff5ef2
	.dc.b	$45,$00,$45,$00,$45,$c0,$45,$00					;ff5efa
	.dc.b	$45,$00,$79,$e0,$00,$00,$00,$00					;ff5f02
	.dc.b	$28,$00,$00,$1c,$00,$0c,$00,$0c					;ff5f0a
	.dc.b	$00,$00,$00,$00,$0f,$00,$1f,$80					;ff5f12
	.dc.b	$39,$c0,$30,$00,$30,$00,$30,$00					;ff5f1a
	.dc.b	$39,$c0,$1f,$80,$0f,$00,$00,$00					;ff5f22
	.dc.b	$3e,$00,$00,$1c,$00,$0c,$00,$0c					;ff5f2a
	.dc.b	$00,$00,$10,$00,$10,$40,$7c,$80					;ff5f32
	.dc.b	$11,$00,$12,$00,$04,$00,$08,$00					;ff5f3a
	.dc.b	$13,$e0,$20,$00,$00,$00,$00,$00					;ff5f42
	.dc.b	$25,$00,$00,$1c,$00,$0c,$00,$0c					;ff5f4a
	.dc.b	$00,$00,$00,$00,$00,$00,$32,$20					;ff5f52
	.dc.b	$4a,$20,$43,$60,$42,$a0,$42,$a0					;ff5f5a
	.dc.b	$42,$20,$32,$20,$00,$00,$00,$00					;ff5f62
	.dc.b	$27,$00,$00,$1c,$00,$0c,$00,$0c					;ff5f6a
	.dc.b	$00,$00,$00,$00,$00,$00,$02,$00					;ff5f72
	.dc.b	$03,$00,$3f,$80,$3f,$c0,$3f,$80					;ff5f7a
	.dc.b	$03,$00,$02,$00,$00,$00,$00,$00					;ff5f82
	.dc.b	$34,$00,$00,$3a,$00,$0c,$00,$1b					;ff5f8a
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00					;ff5f92
	.dc.b	$1f,$80,$10,$80,$10,$80,$10,$80					;ff5f9a
	.dc.b	$10,$80,$10,$80,$1f,$80,$00,$00					;ff5fa2
	.dc.b	$00,$00,$00,$00,$06,$00,$0f,$00					;ff5faa
	.dc.b	$1f,$80,$06,$00,$06,$00,$06,$00					;ff5fb2
	.dc.b	$06,$00,$06,$00,$06,$00,$06,$00					;ff5fba
	.dc.b	$00,$00,$00,$00,$00,$00,$ff,$ff					;ff5fc2
Lff5fca:									;ff5fca
	.dc.b	$00,$00,$31,$32,$33,$34,$35,$36					;ff5fca
	.dc.b	$37,$38,$39,$30,$2d,$5e,$5c,$00					;ff5fd2
	.dc.b	$00,$51,$57,$45,$52,$54,$59,$55					;ff5fda
	.dc.b	$49,$4f,$50,$40,$5b,$00,$41,$53					;ff5fe2
	.dc.b	$44,$46,$47,$48,$4a,$4b,$4c,$3b					;ff5fea
	.dc.b	$3a,$5d,$5a,$58,$43,$56,$42,$4e					;ff5ff2
	.dc.b	$4d,$2c,$2e,$2f,$20,$20,$00,$00					;ff5ffa
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00					;ff6002
	.dc.b	$2f,$2a,$2d,$37,$38,$39,$2b,$34					;ff600a
	.dc.b	$35,$36,$3d,$31,$32,$33,$00,$30					;ff6012
	.dc.b	$00,$2e,$00,$00,$00,$00,$00,$00					;ff601a
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00					;ff6022
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00					;ff602a
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00					;ff6032
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00					;ff603a
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00					;ff6042
Lff604a:									;ff604a
	.dc.b	$00,$00,$21,$22,$23,$24,$25,$26					;ff604a
	.dc.b	$27,$28,$29,$20,$3d,$7e,$7c,$00					;ff6052
	.dc.b	$00,$71,$77,$65,$72,$74,$79,$75					;ff605a
	.dc.b	$69,$6f,$70,$60,$7b,$00,$61,$73					;ff6062
	.dc.b	$64,$66,$67,$68,$6a,$6b,$6c,$2b					;ff606a
	.dc.b	$2a,$7d,$7a,$78,$63,$76,$62,$6e					;ff6072
	.dc.b	$6d,$3c,$3e,$3f,$5f						;ff607a
Lff607f:									;ff607f
	.dc.b	$00,$00,$c7,$cc,$b1,$b3,$b4,$b5					;ff607f
	.dc.b	$d4,$d5,$d6,$dc,$ce,$cd,$b0,$00					;ff6087
	.dc.b	$00,$c0,$c3,$b2,$bd,$b6,$dd,$c5					;ff608f
	.dc.b	$c6,$d7,$be,$de,$df,$00,$c1,$c4					;ff6097
	.dc.b	$bc,$ca,$b7,$b8,$cf,$c9,$d8,$da					;ff609f
	.dc.b	$b9,$d1,$c2,$bb,$bf,$cb,$ba,$d0					;ff60a7
	.dc.b	$d3,$c8,$d9,$d2,$db						;ff60af
Lff60b4:									;ff60b4
	.dc.b	'ﾂﾖﾕﾔｵｴｳｲｱﾜﾒﾈﾑﾟﾙﾛ'						;ff60b4
Lff60c4:									;ff60c4
	.dc.b	$00,$00,$b1,$b2,$b3,$b4,$b5,$c5					;ff60c4
	.dc.b	$c6,$c7,$c8,$c9,$d7,$d8,$d9,$00					;ff60cc
	.dc.b	$00,$b6,$b7,$b8,$b9,$ba,$ca,$cb					;ff60d4
	.dc.b	$cc,$cd,$ce,$da,$db,$00,$bb,$bc					;ff60dc
	.dc.b	$bd,$be,$bf,$cf,$d0,$d1,$d2,$d3					;ff60e4
	.dc.b	$de,$df,$c0,$c1,$c2,$c3,$c4,$d4					;ff60ec
	.dc.b	$d5,$d6,$dc,$a6,$dd						;ff60f4
Lff60f9:									;ff60f9
	.dc.b	'ﾞﾂﾖﾕﾔｵｴｳｲｱﾉﾝﾜﾟﾛｦｻ'						;ff60f9
Call_TXXLINE:									;ff610a
	movem.l	d1-d7/a1-a3,-(a7)			;$48e7,$7f70		;ff610a
	lea.l	($00e8002a),a2				;$45f9,$00e8,$002a	;ff610e
	lea.l	($0004,a2),a3				;$47ea,$0004		;ff6114
	moveq.l	#$00,d0					;$7000			;ff6118
	move.w	(a1)+,d0				;$3019			;ff611a
	move.w	(a1)+,d1				;$3219			;ff611c
	move.w	(a1)+,d3				;$3619			;ff611e
	move.w	(a1)+,d2				;$3419			;ff6120
	move.w	(a1)+,d6				;$3c19			;ff6122
	add.w	d1,d2					;$d441			;ff6124
	sub.w	($0d1c),d2				;$9478,$0d1c		;ff6126
	lea.l	($00e00000),a1				;$43f9,$00e0,$0000	;ff612a
	tst.w	d0					;$4a40			;ff6130
	bmi.s	Lff6156					;$6b22			;ff6132
	btst.b	#$00,(a2)				;$0812,$0000		;ff6134
	bne.s	Lff6162					;$6628			;ff6138
	and.w	#$0003,d0				;$c07c,$0003		;ff613a
	add.w	d0,d0					;$d040			;ff613e
	swap.w	d0					;$4840			;ff6140
	adda.l	d0,a1					;$d3c0			;ff6142
	move.w	#$0200,d0				;$303c,$0200		;ff6144
Lff6148:									;ff6148
	move.w	(a2),d7					;$3e12			;ff6148
	move.w	d0,(a2)					;$3480			;ff614a
	bsr.s	Lff6192					;$6144			;ff614c
	move.w	d7,(a2)					;$3487			;ff614e
	movem.l	(a7)+,d1-d7/a1-a3			;$4cdf,$0efe		;ff6150
	rts						;$4e75			;ff6154

Lff6156:									;ff6156
	and.w	#$000f,d0				;$c07c,$000f		;ff6156
	lsl.w	#4,d0					;$e948			;ff615a
	or.w	#$0300,d0				;$807c,$0300		;ff615c
	bra.s	Lff6148					;$60e6			;ff6160
Lff6162:									;ff6162
	move.w	(a2),d0					;$3012			;ff6162
	or.w	#$0300,d0				;$807c,$0300		;ff6164
	bra.s	Lff6148					;$60de			;ff6168
Lff616a:									;ff616a
	.dc.w	$0000,$8000,$c000,$e000						;ff616a
	.dc.w	$f000,$f800,$fc00,$fe00						;ff6172
	.dc.w	$ff00,$ff80,$ffc0,$ffe0						;ff617a
	.dc.w	$fff0,$fff8,$fffc,$fffe						;ff6182
Lff618a:									;ff618a
	rts						;$4e75			;ff618a

Lff618c:									;ff618c
	movea.w	#$ffff,a0				;$307c,$ffff		;ff618c
	bra.s	Lff6194					;$6002			;ff6190
Lff6192:									;ff6192
	suba.l	a0,a0					;$91c8			;ff6192
Lff6194:									;ff6194
	movem.l	($0954),d4-d5				;$4cf8,$0030,$0954	;ff6194
	cmp.w	d4,d3					;$b644			;ff619a
	blt.s	Lff618a					;$6dec			;ff619c
	cmp.w	d5,d3					;$b645			;ff619e
	bge.s	Lff618a					;$6ce8			;ff61a0
	swap.w	d4					;$4844			;ff61a2
	swap.w	d5					;$4845			;ff61a4
	cmp.w	d1,d2					;$b441			;ff61a6
	bge.s	Lff61ac					;$6c02			;ff61a8
	exg.l	d1,d2					;$c342			;ff61aa
Lff61ac:									;ff61ac
	cmp.w	d4,d1					;$b244			;ff61ac
	bge.s	Lff61b2					;$6c02			;ff61ae
	move.w	d4,d1					;$3204			;ff61b0
Lff61b2:									;ff61b2
	cmp.w	d5,d2					;$b445			;ff61b2
	blt.s	Lff61ba					;$6d04			;ff61b4
	move.w	d5,d2					;$3405			;ff61b6
	subq.w	#1,d2					;$5342			;ff61b8
Lff61ba:									;ff61ba
	move.b	d6,d0					;$1006			;ff61ba
	lsl.w	#8,d6					;$e14e			;ff61bc
	move.b	d0,d6					;$1c00			;ff61be
	move.w	d6,d0					;$3006			;ff61c0
	swap.w	d6					;$4846			;ff61c2
	move.w	d0,d6					;$3c00			;ff61c4
	move.w	($0940),d0				;$3038,$0940		;ff61c6
	mulu.w	d3,d0					;$c0c3			;ff61ca
	adda.l	d0,a1					;$d3c0			;ff61cc
	moveq.l	#$00,d3					;$7600			;ff61ce
	moveq.l	#$00,d4					;$7800			;ff61d0
	addq.w	#1,d2					;$5242			;ff61d2
	move.w	d1,d3					;$3601			;ff61d4
	move.w	d2,d4					;$3802			;ff61d6
	and.w	#$000f,d3				;$c67c,$000f		;ff61d8
	and.w	#$000f,d4				;$c87c,$000f		;ff61dc
	add.w	d3,d3					;$d643			;ff61e0
	add.w	d4,d4					;$d844			;ff61e2
	move.w	(Lff616a,pc,d3.w),d3			;$363b,$3084		;ff61e4
	move.w	(Lff616a,pc,d4.w),d4			;$383b,$4080		;ff61e8
	swap.w	d3					;$4843			;ff61ec
	swap.w	d4					;$4844			;ff61ee
	lsr.w	#5,d1					;$ea49			;ff61f0
	bcc.s	Lff61fa					;$6406			;ff61f2
	move.w	#$ffff,d3				;$363c,$ffff		;ff61f4
	swap.w	d3					;$4843			;ff61f8
Lff61fa:									;ff61fa
	swap.w	d3					;$4843			;ff61fa
	lsr.w	#5,d2					;$ea4a			;ff61fc
	bcc.s	Lff6206					;$6406			;ff61fe
	move.w	#$ffff,d4				;$383c,$ffff		;ff6200
	swap.w	d4					;$4844			;ff6204
Lff6206:									;ff6206
	swap.w	d4					;$4844			;ff6206
	not.l	d4					;$4684			;ff6208
	move.w	d2,d5					;$3a02			;ff620a
	sub.w	d1,d5					;$9a41			;ff620c
	beq.w	Lff62a0					;$6700,$0090		;ff620e
	add.w	d1,d1					;$d241			;ff6212
	add.w	d1,d1					;$d241			;ff6214
	add.w	d2,d2					;$d442			;ff6216
	add.w	d2,d2					;$d442			;ff6218
	cmp.w	($0940),d2				;$b478,$0940		;ff621a
	bne.s	Lff6224					;$6604			;ff621e
	subq.w	#4,d2					;$5942			;ff6220
	moveq.l	#$ff,d4					;$78ff			;ff6222
Lff6224:									;ff6224
	move.l	a0,d0					;$2008			;ff6224
	bne.s	Lff6264					;$663c			;ff6226
Lff6228:									;ff6228
	move.l	a1,-(a7)				;$2f09			;ff6228
	lea.l	(a1,d2.w),a0				;$41f1,$2000		;ff622a
	move.w	sr,d0					;$40c0			;ff622e
	ori.w	#$0700,sr				;$007c,$0700		;ff6230
	move.w	d4,(a3)					;$3684			;ff6234
	move.w	d6,(a0)+				;$30c6			;ff6236
	swap.w	d4					;$4844			;ff6238
	move.w	d4,(a3)					;$3684			;ff623a
	move.w	d6,(a0)					;$3086			;ff623c
	swap.w	d4					;$4844			;ff623e
	adda.w	d1,a1					;$d2c1			;ff6240
	move.w	d3,(a3)					;$3683			;ff6242
	move.w	d6,(a1)+				;$32c6			;ff6244
	swap.w	d3					;$4843			;ff6246
	move.w	d3,(a3)					;$3683			;ff6248
	move.w	d6,(a1)+				;$32c6			;ff624a
	swap.w	d3					;$4843			;ff624c
	clr.w	(a3)					;$4253			;ff624e
	move.w	d0,sr					;$46c0			;ff6250
	move.w	d5,d0					;$3005			;ff6252
	subq.w	#1,d0					;$5340			;ff6254
	beq.s	Lff625c					;$6704			;ff6256
	bsr.w	Lff62f2					;$6100,$0098		;ff6258
Lff625c:									;ff625c
	movea.l	(a7)+,a1				;$225f			;ff625c
	lea.l	(Lff6228,pc),a0				;$41fa,$ffc8		;ff625e
	rts						;$4e75			;ff6262

Lff6264:									;ff6264
	move.l	a1,-(a7)				;$2f09			;ff6264
	lea.l	(a1,d2.w),a0				;$41f1,$2000		;ff6266
	move.w	sr,d0					;$40c0			;ff626a
	ori.w	#$0700,sr				;$007c,$0700		;ff626c
	move.w	d4,(a3)					;$3684			;ff6270
	not.w	(a0)+					;$4658			;ff6272
	swap.w	d4					;$4844			;ff6274
	move.w	d4,(a3)					;$3684			;ff6276
	not.w	(a0)+					;$4658			;ff6278
	swap.w	d4					;$4844			;ff627a
	adda.w	d1,a1					;$d2c1			;ff627c
	move.w	d3,(a3)					;$3683			;ff627e
	not.w	(a1)+					;$4659			;ff6280
	swap.w	d3					;$4843			;ff6282
	move.w	d3,(a3)					;$3683			;ff6284
	not.w	(a1)+					;$4659			;ff6286
	swap.w	d3					;$4843			;ff6288
	clr.w	(a3)					;$4253			;ff628a
	move.w	d0,sr					;$46c0			;ff628c
	move.w	d5,d0					;$3005			;ff628e
	subq.w	#1,d0					;$5340			;ff6290
	beq.s	Lff6298					;$6704			;ff6292
	bsr.w	Lff632a					;$6100,$0094		;ff6294
Lff6298:									;ff6298
	movea.l	(a7)+,a1				;$225f			;ff6298
	lea.l	(Lff6264,pc),a0				;$41fa,$ffc8		;ff629a
	rts						;$4e75			;ff629e

Lff62a0:									;ff62a0
	add.w	d1,d1					;$d241			;ff62a0
	add.w	d1,d1					;$d241			;ff62a2
	or.l	d4,d3					;$8684			;ff62a4
	move.l	a0,d0					;$2008			;ff62a6
	bne.s	Lff62ce					;$6624			;ff62a8
Lff62aa:									;ff62aa
	move.l	a1,-(a7)				;$2f09			;ff62aa
	adda.w	d1,a1					;$d2c1			;ff62ac
	move.w	sr,d0					;$40c0			;ff62ae
	ori.w	#$0700,sr				;$007c,$0700		;ff62b0
	move.w	d3,(a3)					;$3683			;ff62b4
	move.w	d6,(a1)					;$3286			;ff62b6
	swap.w	d3					;$4843			;ff62b8
	move.w	d3,(a3)					;$3683			;ff62ba
	move.w	d6,($0002,a1)				;$3346,$0002		;ff62bc
	swap.w	d3					;$4843			;ff62c0
	clr.w	(a3)					;$4253			;ff62c2
	move.w	d0,sr					;$46c0			;ff62c4
	movea.l	(a7)+,a1				;$225f			;ff62c6
	lea.l	(Lff62aa,pc),a0				;$41fa,$ffe0		;ff62c8
	rts						;$4e75			;ff62cc

Lff62ce:									;ff62ce
	move.l	a1,-(a7)				;$2f09			;ff62ce
	adda.w	d1,a1					;$d2c1			;ff62d0
	move.w	sr,d0					;$40c0			;ff62d2
	ori.w	#$0700,sr				;$007c,$0700		;ff62d4
	move.w	d3,(a3)					;$3683			;ff62d8
	not.w	(a1)					;$4651			;ff62da
	swap.w	d3					;$4843			;ff62dc
	move.w	d3,(a3)					;$3683			;ff62de
	not.w	($0002,a1)				;$4669,$0002		;ff62e0
	swap.w	d3					;$4843			;ff62e4
	clr.w	(a3)					;$4253			;ff62e6
	move.w	d0,sr					;$46c0			;ff62e8
	movea.l	(a7)+,a1				;$225f			;ff62ea
	lea.l	(Lff62ce,pc),a0				;$41fa,$ffe0		;ff62ec
	rts						;$4e75			;ff62f0

Lff62f2:									;ff62f2
	lea.l	(Lff62f8,pc),a0				;$41fa,$0004		;ff62f2
	add.w	d0,d0					;$d040			;ff62f6
Lff62f8:									;ff62f8
	sub.w	#$0020,d0				;$907c,$0020		;ff62f8
	ble.s	Lff6300					;$6f02			;ff62fc
	bra.s	Lff6308					;$6008			;ff62fe
Lff6300:									;ff6300
	neg.w	d0					;$4440			;ff6300
	movea.l	(a7)+,a0				;$205f			;ff6302
	jmp	(Lff6308,pc,d0.w)			;$4efb,$0002		;ff6304

Lff6308:									;ff6308
	move.l	d6,(a1)+				;$22c6			;ff6308
	move.l	d6,(a1)+				;$22c6			;ff630a
	move.l	d6,(a1)+				;$22c6			;ff630c
	move.l	d6,(a1)+				;$22c6			;ff630e
	move.l	d6,(a1)+				;$22c6			;ff6310
	move.l	d6,(a1)+				;$22c6			;ff6312
	move.l	d6,(a1)+				;$22c6			;ff6314
	move.l	d6,(a1)+				;$22c6			;ff6316
	move.l	d6,(a1)+				;$22c6			;ff6318
	move.l	d6,(a1)+				;$22c6			;ff631a
	move.l	d6,(a1)+				;$22c6			;ff631c
	move.l	d6,(a1)+				;$22c6			;ff631e
	move.l	d6,(a1)+				;$22c6			;ff6320
	move.l	d6,(a1)+				;$22c6			;ff6322
	move.l	d6,(a1)+				;$22c6			;ff6324
	move.l	d6,(a1)+				;$22c6			;ff6326
	jmp	(a0)					;$4ed0			;ff6328

Lff632a:									;ff632a
	lea.l	(Lff6330,pc),a0				;$41fa,$0004		;ff632a
	add.w	d0,d0					;$d040			;ff632e
Lff6330:									;ff6330
	sub.w	#$0020,d0				;$907c,$0020		;ff6330
	ble.s	Lff6338					;$6f02			;ff6334
	bra.s	Lff6340					;$6008			;ff6336
Lff6338:									;ff6338
	neg.w	d0					;$4440			;ff6338
	movea.l	(a7)+,a0				;$205f			;ff633a
	jmp	(Lff6340,pc,d0.w)			;$4efb,$0002		;ff633c

Lff6340:									;ff6340
	not.l	(a1)+					;$4699			;ff6340
	not.l	(a1)+					;$4699			;ff6342
	not.l	(a1)+					;$4699			;ff6344
	not.l	(a1)+					;$4699			;ff6346
	not.l	(a1)+					;$4699			;ff6348
	not.l	(a1)+					;$4699			;ff634a
	not.l	(a1)+					;$4699			;ff634c
	not.l	(a1)+					;$4699			;ff634e
	not.l	(a1)+					;$4699			;ff6350
	not.l	(a1)+					;$4699			;ff6352
	not.l	(a1)+					;$4699			;ff6354
	not.l	(a1)+					;$4699			;ff6356
	not.l	(a1)+					;$4699			;ff6358
	not.l	(a1)+					;$4699			;ff635a
	not.l	(a1)+					;$4699			;ff635c
	not.l	(a1)+					;$4699			;ff635e
	jmp	(a0)					;$4ed0			;ff6360

Call_TXYLINE:									;ff6362
	movem.l	d1-d7/a1-a3,-(a7)			;$48e7,$7f70		;ff6362
	lea.l	($00e8002a),a2				;$45f9,$00e8,$002a	;ff6366
	lea.l	($0004,a2),a3				;$47ea,$0004		;ff636c
	moveq.l	#$00,d0					;$7000			;ff6370
	move.w	(a1)+,d0				;$3019			;ff6372
	move.w	(a1)+,d1				;$3219			;ff6374
	move.w	(a1)+,d2				;$3419			;ff6376
	move.w	(a1)+,d3				;$3619			;ff6378
	move.w	(a1)+,d6				;$3c19			;ff637a
	add.w	d2,d3					;$d642			;ff637c
	sub.w	($0d1c),d3				;$9678,$0d1c		;ff637e
	lea.l	($00e00000),a1				;$43f9,$00e0,$0000	;ff6382
	tst.w	d0					;$4a40			;ff6388
	bmi.s	Lff63ae					;$6b22			;ff638a
	btst.b	#$00,(a2)				;$0812,$0000		;ff638c
	bne.s	Lff63ba					;$6628			;ff6390
	and.w	#$0003,d0				;$c07c,$0003		;ff6392
	add.w	d0,d0					;$d040			;ff6396
	swap.w	d0					;$4840			;ff6398
	adda.l	d0,a1					;$d3c0			;ff639a
	move.w	#$0200,d0				;$303c,$0200		;ff639c
Lff63a0:									;ff63a0
	move.w	(a2),d7					;$3e12			;ff63a0
	move.w	d0,(a2)					;$3480			;ff63a2
	bsr.s	Lff63c4					;$611e			;ff63a4
	move.w	d7,(a2)					;$3487			;ff63a6
	movem.l	(a7)+,d1-d7/a1-a3			;$4cdf,$0efe		;ff63a8
	rts						;$4e75			;ff63ac

Lff63ae:									;ff63ae
	and.w	#$000f,d0				;$c07c,$000f		;ff63ae
	lsl.w	#4,d0					;$e948			;ff63b2
	or.w	#$0300,d0				;$807c,$0300		;ff63b4
	bra.s	Lff63a0					;$60e6			;ff63b8
Lff63ba:									;ff63ba
	move.w	(a2),d0					;$3012			;ff63ba
	or.w	#$0300,d0				;$807c,$0300		;ff63bc
	bra.s	Lff63a0					;$60de			;ff63c0
Lff63c2:									;ff63c2
	rts						;$4e75			;ff63c2

Lff63c4:									;ff63c4
	cmp.w	($0954),d1				;$b278,$0954		;ff63c4
	blt.s	Lff63c2					;$6df8			;ff63c8
	cmp.w	($0958),d1				;$b278,$0958		;ff63ca
	bge.s	Lff63c2					;$6cf2			;ff63ce
	movem.l	($0954),d4-d5				;$4cf8,$0030,$0954	;ff63d0
	cmp.w	d2,d3					;$b642			;ff63d6
	bge.s	Lff63dc					;$6c02			;ff63d8
	exg.l	d2,d3					;$c543			;ff63da
Lff63dc:									;ff63dc
	cmp.w	d4,d2					;$b444			;ff63dc
	bge.s	Lff63e2					;$6c02			;ff63de
	move.w	d4,d2					;$3404			;ff63e0
Lff63e2:									;ff63e2
	cmp.w	d5,d3					;$b645			;ff63e2
	blt.s	Lff63ea					;$6d04			;ff63e4
	move.w	d5,d3					;$3605			;ff63e6
	subq.w	#1,d3					;$5343			;ff63e8
Lff63ea:									;ff63ea
	move.w	($0940),d4				;$3838,$0940		;ff63ea
	sub.w	d2,d3					;$9642			;ff63ee
	addq.w	#1,d3					;$5243			;ff63f0
	mulu.w	d4,d2					;$c4c4			;ff63f2
	adda.l	d2,a1					;$d3c2			;ff63f4
	move.w	d1,d0					;$3001			;ff63f6
	lsr.w	#4,d0					;$e848			;ff63f8
	add.w	d0,d0					;$d040			;ff63fa
	adda.w	d0,a1					;$d2c0			;ff63fc
	and.w	#$000f,d1				;$c27c,$000f		;ff63fe
	move.w	#$7fff,d0				;$303c,$7fff		;ff6402
	ror.w	d1,d0					;$e278			;ff6406
	move.w	sr,-(a7)				;$40e7			;ff6408
	ori.w	#$0700,sr				;$007c,$0700		;ff640a
	move.w	d0,(a3)					;$3680			;ff640e
	moveq.l	#$00,d0					;$7000			;ff6410
	tst.b	d6					;$4a06			;ff6412
	beq.s	Lff641e					;$6708			;ff6414
	moveq.l	#$ff,d0					;$70ff			;ff6416
	cmp.b	#$ff,d6					;$bc3c,$00ff		;ff6418
	bne.s	Lff6492					;$6674			;ff641c
Lff641e:									;ff641e
	lsl.w	#4,d4					;$e94c			;ff641e
	move.w	d3,d1					;$3203			;ff6420
	lsr.w	#4,d1					;$e849			;ff6422
	beq.s	Lff6434					;$670e			;ff6424
	subq.w	#1,d1					;$5341			;ff6426
	lea.l	(Lff642e,pc),a0				;$41fa,$0004		;ff6428
Lff642c:									;ff642c
	bra.s	Lff6446					;$6018			;ff642c
Lff642e:									;ff642e
	adda.w	d4,a1					;$d2c4			;ff642e
	dbra.w	d1,Lff642c				;$51c9,$fffa		;ff6430
Lff6434:									;ff6434
	and.w	#$000f,d3				;$c67c,$000f		;ff6434
	add.w	d3,d3					;$d643			;ff6438
	add.w	d3,d3					;$d643			;ff643a
	neg.w	d3					;$4443			;ff643c
	lea.l	(Lff6488,pc),a0				;$41fa,$0048		;ff643e
	jmp	(Lff6486,pc,d3.w)			;$4efb,$3042		;ff6442

Lff6446:									;ff6446
	move.w	d0,($0780,a1)				;$3340,$0780		;ff6446
	move.w	d0,($0700,a1)				;$3340,$0700		;ff644a
	move.w	d0,($0680,a1)				;$3340,$0680		;ff644e
	move.w	d0,($0600,a1)				;$3340,$0600		;ff6452
	move.w	d0,($0580,a1)				;$3340,$0580		;ff6456
	move.w	d0,($0500,a1)				;$3340,$0500		;ff645a
	move.w	d0,($0480,a1)				;$3340,$0480		;ff645e
	move.w	d0,($0400,a1)				;$3340,$0400		;ff6462
	move.w	d0,($0380,a1)				;$3340,$0380		;ff6466
	move.w	d0,($0300,a1)				;$3340,$0300		;ff646a
	move.w	d0,($0280,a1)				;$3340,$0280		;ff646e
	move.w	d0,($0200,a1)				;$3340,$0200		;ff6472
	move.w	d0,($0180,a1)				;$3340,$0180		;ff6476
	move.w	d0,($0100,a1)				;$3340,$0100		;ff647a
	move.w	d0,($0080,a1)				;$3340,$0080		;ff647e
	move.w	d0,(a1)					;$3280			;ff6482
	nop						;$4e71			;ff6484
Lff6486:									;ff6486
	jmp	(a0)					;$4ed0			;ff6486

Lff6488:									;ff6488
	clr.w	(a3)					;$4253			;ff6488
	move.w	(a7)+,sr				;$46df			;ff648a
	rts						;$4e75			;ff648c

Lff648e:									;ff648e
	clr.w	(a1)					;$4251			;ff648e
Lff6490:									;ff6490
	adda.w	d4,a1					;$d2c4			;ff6490
Lff6492:									;ff6492
	subq.w	#1,d3					;$5343			;ff6492
	bmi.s	Lff6488					;$6bf2			;ff6494
	rol.b	#1,d6					;$e31e			;ff6496
	bcc.s	Lff648e					;$64f4			;ff6498
	move.w	d0,(a1)					;$3280			;ff649a
	bra.s	Lff6490					;$60f2			;ff649c
Call_TXLINE:									;ff649e
	movem.l	d1-d7/a1-a4,-(a7)			;$48e7,$7f78		;ff649e
	lea.l	($00e8002a),a2				;$45f9,$00e8,$002a	;ff64a2
	lea.l	($0004,a2),a3				;$47ea,$0004		;ff64a8
	moveq.l	#$00,d4					;$7800			;ff64ac
	move.w	(a1)+,d4				;$3819			;ff64ae
	move.w	(a1)+,d0				;$3019			;ff64b0
	move.w	(a1)+,d1				;$3219			;ff64b2
	move.w	(a1)+,d2				;$3419			;ff64b4
	beq.s	Lff64c0					;$6708			;ff64b6
	bpl.s	Lff64be					;$6a04			;ff64b8
	addq.w	#1,d2					;$5242			;ff64ba
	bra.s	Lff64c0					;$6002			;ff64bc
Lff64be:									;ff64be
	subq.w	#1,d2					;$5342			;ff64be
Lff64c0:									;ff64c0
	move.w	(a1)+,d3				;$3619			;ff64c0
	beq.s	Lff64cc					;$6708			;ff64c2
	bpl.s	Lff64ca					;$6a04			;ff64c4
	addq.w	#1,d3					;$5243			;ff64c6
	bra.s	Lff64cc					;$6002			;ff64c8
Lff64ca:									;ff64ca
	subq.w	#1,d3					;$5343			;ff64ca
Lff64cc:									;ff64cc
	add.w	d0,d2					;$d440			;ff64cc
	add.w	d1,d3					;$d641			;ff64ce
	move.w	(a1)+,d6				;$3c19			;ff64d0
	lea.l	($00e00000),a1				;$43f9,$00e0,$0000	;ff64d2
	tst.w	d4					;$4a44			;ff64d8
	bmi.s	Lff64fe					;$6b22			;ff64da
	btst.b	#$00,(a2)				;$0812,$0000		;ff64dc
	bne.s	Lff650a					;$6628			;ff64e0
	and.w	#$0003,d4				;$c87c,$0003		;ff64e2
	add.w	d4,d4					;$d844			;ff64e6
	swap.w	d4					;$4844			;ff64e8
	adda.l	d4,a1					;$d3c4			;ff64ea
	move.w	#$0200,d4				;$383c,$0200		;ff64ec
Lff64f0:									;ff64f0
	move.w	(a2),d7					;$3e12			;ff64f0
	move.w	d4,(a2)					;$3484			;ff64f2
	bsr.s	Lff6522					;$612c			;ff64f4
	move.w	d7,(a2)					;$3487			;ff64f6
	movem.l	(a7)+,d1-d7/a1-a4			;$4cdf,$1efe		;ff64f8
	rts						;$4e75			;ff64fc

Lff64fe:									;ff64fe
	and.w	#$000f,d4				;$c87c,$000f		;ff64fe
	lsl.w	#4,d4					;$e94c			;ff6502
	or.w	#$0300,d4				;$887c,$0300		;ff6504
	bra.s	Lff64f0					;$60e6			;ff6508
Lff650a:									;ff650a
	move.w	(a2),d4					;$3812			;ff650a
	or.w	#$0300,d4				;$887c,$0300		;ff650c
	bra.s	Lff64f0					;$60de			;ff6510
Lff6512:									;ff6512
	exg.l	d1,d4					;$c344			;ff6512
	bra.w	Lff6192					;$6000,$fc7c		;ff6514
Lff6518:									;ff6518
	exg.l	d1,d2					;$c342			;ff6518
	exg.l	d2,d5					;$c545			;ff651a
	bra.w	Lff63c4					;$6000,$fea6		;ff651c
Lff6520:									;ff6520
	rts						;$4e75			;ff6520

Lff6522:									;ff6522
	jsr	(Lffe692)				;$4eb9,$00ff,$e692	;ff6522
	bcs.s	Lff6520					;$65f6			;ff6528
	exg.l	d0,d4					;$c144			;ff652a
	exg.l	d1,d5					;$c345			;ff652c
	cmp.w	d3,d5					;$ba43			;ff652e
	beq.s	Lff6512					;$67e0			;ff6530
	cmp.w	d2,d4					;$b842			;ff6532
	beq.s	Lff6518					;$67e2			;ff6534
	bgt.s	Lff653c					;$6e04			;ff6536
	exg.l	d2,d4					;$c544			;ff6538
	exg.l	d3,d5					;$c745			;ff653a
Lff653c:									;ff653c
	move.w	($0940),d1				;$3238,$0940		;ff653c
	move.w	d3,d0					;$3003			;ff6540
	mulu.w	d1,d0					;$c0c1			;ff6542
	adda.l	d0,a1					;$d3c0			;ff6544
	move.w	d2,d0					;$3002			;ff6546
	lsr.w	#4,d0					;$e848			;ff6548
	add.w	d0,d0					;$d040			;ff654a
	adda.w	d0,a1					;$d2c0			;ff654c
	sub.w	d2,d4					;$9842			;ff654e
	sub.w	d3,d5					;$9a43			;ff6550
	bcc.s	Lff6558					;$6404			;ff6552
	neg.w	d5					;$4445			;ff6554
	neg.w	d1					;$4441			;ff6556
Lff6558:									;ff6558
	movea.w	d1,a0					;$3041			;ff6558
	move.w	d2,d0					;$3002			;ff655a
	and.w	#$000f,d0				;$c07c,$000f		;ff655c
	sub.w	#$000f,d0				;$907c,$000f		;ff6560
	neg.w	d0					;$4440			;ff6564
	moveq.l	#$ff,d1					;$72ff			;ff6566
	bchg.l	d0,d1					;$0141			;ff6568
	move.w	d5,d3					;$3605			;ff656a
	lea.l	(Lff6582,pc),a4				;$49fa,$0014		;ff656c
	cmp.w	d4,d3					;$b644			;ff6570
	bcs.s	Lff657a					;$6506			;ff6572
	lea.l	(Lff65b4,pc),a4				;$49fa,$003e		;ff6574
	exg.l	d3,d4					;$c744			;ff6578
Lff657a:									;ff657a
	move.w	d4,d2					;$3404			;ff657a
	lsr.w	#1,d2					;$e24a			;ff657c
	move.w	d4,d0					;$3004			;ff657e
	jmp	(a4)					;$4ed4			;ff6580

Lff6582:									;ff6582
	move.w	sr,-(a7)				;$40e7			;ff6582
	ori.w	#$0700,sr				;$007c,$0700		;ff6584
Lff6588:									;ff6588
	move.w	d1,(a3)					;$3681			;ff6588
	rol.b	#1,d6					;$e31e			;ff658a
	bcc.s	Lff65a8					;$641a			;ff658c
	move.w	#$ffff,(a1)				;$32bc,$ffff		;ff658e
Lff6592:									;ff6592
	ror.w	#1,d1					;$e259			;ff6592
	bmi.s	Lff6598					;$6b02			;ff6594
	addq.l	#2,a1					;$5489			;ff6596
Lff6598:									;ff6598
	subq.w	#1,d0					;$5340			;ff6598
	bmi.s	Lff65ae					;$6b12			;ff659a
	add.w	d3,d2					;$d443			;ff659c
	cmp.w	d4,d2					;$b444			;ff659e
	bcs.s	Lff6588					;$65e6			;ff65a0
	sub.w	d4,d2					;$9444			;ff65a2
	adda.l	a0,a1					;$d3c8			;ff65a4
	bra.s	Lff6588					;$60e0			;ff65a6
Lff65a8:									;ff65a8
	move.w	#$0000,(a1)				;$32bc,$0000		;ff65a8
	bra.s	Lff6592					;$60e4			;ff65ac
Lff65ae:									;ff65ae
	clr.w	(a3)					;$4253			;ff65ae
	move.w	(a7)+,sr				;$46df			;ff65b0
	rts						;$4e75			;ff65b2

Lff65b4:									;ff65b4
	move.w	sr,-(a7)				;$40e7			;ff65b4
	ori.w	#$0700,sr				;$007c,$0700		;ff65b6
Lff65ba:									;ff65ba
	move.w	d1,(a3)					;$3681			;ff65ba
	rol.b	#1,d6					;$e31e			;ff65bc
	bcc.s	Lff65da					;$641a			;ff65be
	move.w	#$ffff,(a1)				;$32bc,$ffff		;ff65c0
Lff65c4:									;ff65c4
	adda.l	a0,a1					;$d3c8			;ff65c4
	subq.w	#1,d0					;$5340			;ff65c6
	bmi.s	Lff65ae					;$6be4			;ff65c8
	add.w	d3,d2					;$d443			;ff65ca
	cmp.w	d4,d2					;$b444			;ff65cc
	bcs.s	Lff65ba					;$65ea			;ff65ce
	sub.w	d4,d2					;$9444			;ff65d0
	ror.w	#1,d1					;$e259			;ff65d2
	bmi.s	Lff65ba					;$6be4			;ff65d4
	addq.l	#2,a1					;$5489			;ff65d6
	bra.s	Lff65ba					;$60e0			;ff65d8
Lff65da:									;ff65da
	move.w	#$0000,(a1)				;$32bc,$0000		;ff65da
	bra.s	Lff65c4					;$60e4			;ff65de
Call_TXBOX:									;ff65e0
	movem.l	d1-d7/a1-a4,-(a7)			;$48e7,$7f78		;ff65e0
	lea.l	($00e8002a),a2				;$45f9,$00e8,$002a	;ff65e4
	lea.l	($0004,a2),a3				;$47ea,$0004		;ff65ea
	moveq.l	#$00,d4					;$7800			;ff65ee
	move.w	(a1)+,d4				;$3819			;ff65f0
	move.w	(a1)+,d0				;$3019			;ff65f2
	move.w	(a1)+,d1				;$3219			;ff65f4
	move.w	(a1)+,d2				;$3419			;ff65f6
	move.w	(a1)+,d3				;$3619			;ff65f8
	move.w	(a1)+,d6				;$3c19			;ff65fa
	add.w	d0,d2					;$d440			;ff65fc
	add.w	d1,d3					;$d641			;ff65fe
	lea.l	($00e00000),a1				;$43f9,$00e0,$0000	;ff6600
	tst.w	d4					;$4a44			;ff6606
	bmi.s	Lff662c					;$6b22			;ff6608
	btst.b	#$00,(a2)				;$0812,$0000		;ff660a
	bne.s	Lff6638					;$6628			;ff660e
	and.w	#$0003,d4				;$c87c,$0003		;ff6610
	add.w	d4,d4					;$d844			;ff6614
	swap.w	d4					;$4844			;ff6616
	adda.l	d4,a1					;$d3c4			;ff6618
	move.w	#$0200,d4				;$383c,$0200		;ff661a
Lff661e:									;ff661e
	move.w	(a2),d7					;$3e12			;ff661e
	move.w	d4,(a2)					;$3484			;ff6620
	bsr.s	Lff6642					;$611e			;ff6622
	move.w	d7,(a2)					;$3487			;ff6624
	movem.l	(a7)+,d1-d7/a1-a4			;$4cdf,$1efe		;ff6626
	rts						;$4e75			;ff662a

Lff662c:									;ff662c
	and.w	#$000f,d4				;$c87c,$000f		;ff662c
	lsl.w	#4,d4					;$e94c			;ff6630
	or.w	#$0300,d4				;$887c,$0300		;ff6632
	bra.s	Lff661e					;$60e6			;ff6636
Lff6638:									;ff6638
	move.w	(a2),d4					;$3812			;ff6638
	or.w	#$0300,d4				;$887c,$0300		;ff663a
	bra.s	Lff661e					;$60de			;ff663e
Lff6640:									;ff6640
	rts						;$4e75			;ff6640

Lff6642:									;ff6642
	cmp.w	d0,d2					;$b440			;ff6642
	beq.s	Lff6640					;$67fa			;ff6644
	bgt.s	Lff664a					;$6e02			;ff6646
	exg.l	d0,d2					;$c142			;ff6648
Lff664a:									;ff664a
	cmp.w	d1,d3					;$b641			;ff664a
	beq.s	Lff6640					;$67f2			;ff664c
	bgt.s	Lff6652					;$6e02			;ff664e
	exg.l	d1,d3					;$c343			;ff6650
Lff6652:									;ff6652
	subq.w	#1,d2					;$5342			;ff6652
	subq.w	#1,d3					;$5343			;ff6654
	movea.l	a1,a4					;$2849			;ff6656
	movem.w	d0-d3,-(a7)				;$48a7,$f000		;ff6658
	exg.l	d1,d3					;$c343			;ff665c
	exg.l	d0,d1					;$c141			;ff665e
	bsr.w	Lff6192					;$6100,$fb30		;ff6660
	movea.l	a4,a1					;$224c			;ff6664
	movem.w	(a7),d0-d3				;$4c97,$000f		;ff6666
	exg.l	d0,d1					;$c141			;ff666a
	bsr.w	Lff6192					;$6100,$fb24		;ff666c
	movea.l	a4,a1					;$224c			;ff6670
	movem.w	(a7),d0-d3				;$4c97,$000f		;ff6672
	exg.l	d0,d1					;$c141			;ff6676
	exg.l	d0,d2					;$c142			;ff6678
	bsr.w	Lff63c4					;$6100,$fd48		;ff667a
	movea.l	a4,a1					;$224c			;ff667e
	movem.w	(a7)+,d0-d3				;$4c9f,$000f		;ff6680
	exg.l	d1,d2					;$c342			;ff6684
	bsr.w	Lff63c4					;$6100,$fd3c		;ff6686
	rts						;$4e75			;ff668a

Call_TXFILL:									;ff668c
	movem.l	d1-d7/a1-a4/a6,-(a7)			;$48e7,$7f7a		;ff668c
	lea.l	($00e8002a),a2				;$45f9,$00e8,$002a	;ff6690
	lea.l	($0004,a2),a3				;$47ea,$0004		;ff6696
	moveq.l	#$00,d4					;$7800			;ff669a
	move.w	(a1)+,d4				;$3819			;ff669c
	move.w	(a1)+,d0				;$3019			;ff669e
	move.w	(a1)+,d1				;$3219			;ff66a0
	move.w	(a1)+,d2				;$3419			;ff66a2
	move.w	(a1)+,d3				;$3619			;ff66a4
	move.w	(a1)+,d6				;$3c19			;ff66a6
	add.w	d0,d2					;$d440			;ff66a8
	add.w	d1,d3					;$d641			;ff66aa
	lea.l	($00e00000),a1				;$43f9,$00e0,$0000	;ff66ac
	tst.w	d4					;$4a44			;ff66b2
	bmi.s	Lff66f0					;$6b3a			;ff66b4
	btst.b	#$00,(a2)				;$0812,$0000		;ff66b6
	bne.s	Lff66fc					;$6640			;ff66ba
	and.w	#$0003,d4				;$c87c,$0003		;ff66bc
	add.w	d4,d4					;$d844			;ff66c0
	swap.w	d4					;$4844			;ff66c2
	adda.l	d4,a1					;$d3c4			;ff66c4
	move.w	#$0200,d4				;$383c,$0200		;ff66c6
Lff66ca:									;ff66ca
	move.w	(a2),-(a7)				;$3f12			;ff66ca
	move.w	d4,(a2)					;$3484			;ff66cc
	move.w	d6,d4					;$3806			;ff66ce
	and.w	#$ff00,d4				;$c87c,$ff00		;ff66d0
	move.w	d4,d5					;$3a04			;ff66d4
	lsr.w	#8,d5					;$e04d			;ff66d6
	or.w	d4,d5					;$8a44			;ff66d8
	move.w	d5,d4					;$3805			;ff66da
	swap.w	d5					;$4845			;ff66dc
	move.w	d4,d5					;$3a04			;ff66de
	movea.l	d5,a6					;$2c45			;ff66e0
	lea.l	(Lff6192,pc),a0				;$41fa,$faae		;ff66e2
	bsr.s	Lff6706					;$611e			;ff66e6
	move.w	(a7)+,(a2)				;$349f			;ff66e8
	movem.l	(a7)+,d1-d7/a1-a4/a6			;$4cdf,$5efe		;ff66ea
	rts						;$4e75			;ff66ee

Lff66f0:									;ff66f0
	and.w	#$000f,d4				;$c87c,$000f		;ff66f0
	lsl.w	#4,d4					;$e94c			;ff66f4
	or.w	#$0300,d4				;$887c,$0300		;ff66f6
	bra.s	Lff66ca					;$60ce			;ff66fa
Lff66fc:									;ff66fc
	move.w	(a2),d4					;$3812			;ff66fc
	or.w	#$0300,d4				;$887c,$0300		;ff66fe
	bra.s	Lff66ca					;$60c6			;ff6702
Lff6704:									;ff6704
	rts						;$4e75			;ff6704

Lff6706:									;ff6706
	cmp.w	d0,d2					;$b440			;ff6706
	beq.s	Lff6704					;$67fa			;ff6708
	bgt.s	Lff670e					;$6e02			;ff670a
	exg.l	d0,d2					;$c142			;ff670c
Lff670e:									;ff670e
	cmp.w	d1,d3					;$b641			;ff670e
	beq.s	Lff6704					;$67f2			;ff6710
	bgt.s	Lff6716					;$6e02			;ff6712
	exg.l	d1,d3					;$c343			;ff6714
Lff6716:									;ff6716
	subq.w	#1,d2					;$5342			;ff6716
	subq.w	#1,d3					;$5343			;ff6718
	movem.l	($0954),d4-d5				;$4cf8,$0030,$0954	;ff671a
	cmp.w	d4,d3					;$b644			;ff6720
	blt.s	Lff6704					;$6de0			;ff6722
	cmp.w	d5,d1					;$b245			;ff6724
	bge.s	Lff6704					;$6cdc			;ff6726
	cmp.w	d4,d1					;$b244			;ff6728
	bge.s	Lff672e					;$6c02			;ff672a
	move.w	d4,d1					;$3204			;ff672c
Lff672e:									;ff672e
	cmp.w	d5,d3					;$b645			;ff672e
	blt.s	Lff6736					;$6d04			;ff6730
	move.w	d5,d3					;$3605			;ff6732
	subq.w	#1,d3					;$5343			;ff6734
Lff6736:									;ff6736
	move.w	d3,d7					;$3e03			;ff6736
	sub.w	d1,d7					;$9e41			;ff6738
	exg.l	d0,d1					;$c141			;ff673a
	exg.l	d0,d3					;$c143			;ff673c
	movea.w	($0940),a4				;$3878,$0940		;ff673e
Lff6742:									;ff6742
	jsr	(a0)					;$4e90			;ff6742
	exg.l	d6,a6					;$cd8e			;ff6744
	adda.l	a4,a1					;$d3cc			;ff6746
	dbra.w	d7,Lff6742				;$51cf,$fff8		;ff6748
	rts						;$4e75			;ff674c

Call_TXREV:									;ff674e
	movem.l	d1-d7/a1-a4/a6,-(a7)			;$48e7,$7f7a		;ff674e
	lea.l	($00e8002a),a2				;$45f9,$00e8,$002a	;ff6752
	lea.l	($0004,a2),a3				;$47ea,$0004		;ff6758
	moveq.l	#$00,d4					;$7800			;ff675c
	move.w	(a1)+,d4				;$3819			;ff675e
	move.w	(a1)+,d0				;$3019			;ff6760
	move.w	(a1)+,d1				;$3219			;ff6762
	move.w	(a1)+,d2				;$3419			;ff6764
	move.w	(a1)+,d3				;$3619			;ff6766
	add.w	d0,d2					;$d440			;ff6768
	add.w	d1,d3					;$d641			;ff676a
	lea.l	($00e00000),a1				;$43f9,$00e0,$0000	;ff676c
	btst.b	#$00,(a2)				;$0812,$0000		;ff6772
	bne.s	Lff679a					;$6622			;ff6776
	and.w	#$0003,d4				;$c87c,$0003		;ff6778
	add.w	d4,d4					;$d844			;ff677c
	swap.w	d4					;$4844			;ff677e
	adda.l	d4,a1					;$d3c4			;ff6780
	move.w	#$0200,d4				;$383c,$0200		;ff6782
Lff6786:									;ff6786
	move.w	(a2),-(a7)				;$3f12			;ff6786
	move.w	d4,(a2)					;$3484			;ff6788
	lea.l	(Lff618c,pc),a0				;$41fa,$fa00		;ff678a
	bsr.w	Lff6706					;$6100,$ff76		;ff678e
	move.w	(a7)+,(a2)				;$349f			;ff6792
	movem.l	(a7)+,d1-d7/a1-a4/a6			;$4cdf,$5efe		;ff6794
	rts						;$4e75			;ff6798

Lff679a:									;ff679a
	move.w	(a2),d4					;$3812			;ff679a
	or.w	#$0300,d4				;$887c,$0300		;ff679c
	bra.s	Lff6786					;$60e4			;ff67a0
Lff67a2:									;ff67a2
	movem.l	d0/a0-a1,-(a7)				;$48e7,$80c0		;ff67a2
	lea.l	($0010,a7),a1				;$43ef,$0010		;ff67a6
	bsr.w	Call_TXBOX				;$6100,$fe34		;ff67aa
	movem.l	(a7)+,d0/a0-a1				;$4cdf,$0301		;ff67ae
	rts						;$4e75			;ff67b2

Lff67b4:									;ff67b4
	movem.l	d0/a0-a1,-(a7)				;$48e7,$80c0		;ff67b4
	lea.l	($0010,a7),a1				;$43ef,$0010		;ff67b8
	bsr.s	Call_TXREV				;$6190			;ff67bc
	movem.l	(a7)+,d0/a0-a1				;$4cdf,$0301		;ff67be
	rts						;$4e75			;ff67c2

Lff67c4:									;ff67c4
	movem.l	d0/a0-a1,-(a7)				;$48e7,$80c0		;ff67c4
	lea.l	($0010,a7),a1				;$43ef,$0010		;ff67c8
	bsr.w	Call_TXFILL				;$6100,$febe		;ff67cc
	movem.l	(a7)+,d0/a0-a1				;$4cdf,$0301		;ff67d0
	rts						;$4e75			;ff67d4

Lff67d6:									;ff67d6
	bsr.s	Lff67ea					;$6112			;ff67d6
	swap.w	d0					;$4840			;ff67d8
	beq.s	Lff67d6					;$67fa			;ff67da
	clr.w	d0					;$4240			;ff67dc
	move.l	a0,($0818)				;$21c8,$0818		;ff67de
	subq.w	#1,($0812)				;$5378,$0812		;ff67e2
	swap.w	d0					;$4840			;ff67e6
	rts						;$4e75			;ff67e8

Lff67ea:									;ff67ea
	clr.l	d0					;$4280			;ff67ea
	tst.w	($0812)					;$4a78,$0812		;ff67ec
	beq.s	Lff680c					;$671a			;ff67f0
	movea.l	($0818),a0				;$2078,$0818		;ff67f2
	addq.l	#2,a0					;$5488			;ff67f6
	cmpa.l	#$0000089c,a0				;$b1fc,$0000,$089c	;ff67f8
	bcs.s	Lff6806					;$6506			;ff67fe
	movea.l	#$0000081c,a0				;$207c,$0000,$081c	;ff6800
Lff6806:									;ff6806
	moveq.l	#$01,d0					;$7001			;ff6806
	swap.w	d0					;$4840			;ff6808
	move.w	(a0),d0					;$3010			;ff680a
Lff680c:									;ff680c
	rts						;$4e75			;ff680c

Lff680e:									;ff680e
	movem.l	d0-d1/a0,-(a7)				;$48e7,$c080		;ff680e
	move.w	($0812),d1				;$3238,$0812		;ff6812
	beq.s	Lff6840					;$6728			;ff6816
	movea.l	($0818),a0				;$2078,$0818		;ff6818
Lff681c:									;ff681c
	addq.l	#2,a0					;$5488			;ff681c
	cmpa.l	#$0000089c,a0				;$b1fc,$0000,$089c	;ff681e
	bcs.s	Lff682c					;$6506			;ff6824
	movea.l	#$0000081c,a0				;$207c,$0000,$081c	;ff6826
Lff682c:									;ff682c
	move.w	(a0),d0					;$3010			;ff682c
	and.w	#$7fff,d0				;$c07c,$7fff		;ff682e
	cmp.w	#$6d00,d0				;$b07c,$6d00		;ff6832
	bne.s	Lff683c					;$6604			;ff6836
	move.w	#$0000,(a0)				;$30bc,$0000		;ff6838
Lff683c:									;ff683c
	subq.w	#1,d1					;$5341			;ff683c
	bne.s	Lff681c					;$66dc			;ff683e
Lff6840:									;ff6840
	movem.l	(a7)+,d0-d1/a0				;$4cdf,$0103		;ff6840
	rts						;$4e75			;ff6844

Call_SFTSNS:									;ff6846
	clr.l	d0					;$4280			;ff6846
	move.w	($0810),d0				;$3038,$0810		;ff6848
	rts						;$4e75			;ff684c

Call_KEY_INIT:									;ff684e
	move.l	d1,-(a7)				;$2f01			;ff684e
	ori.w	#$0700,sr				;$007c,$0700		;ff6850
	lea.l	($0800),a0				;$41f8,$0800		;ff6854
	move.w	#$000f,d0				;$303c,$000f		;ff6858
Lff685c:									;ff685c
	clr.b	(a0)+					;$4218			;ff685c
	dbra.w	d0,Lff685c				;$51c8,$fffc		;ff685e
	lea.l	($081c),a0				;$41f8,$081c		;ff6862
	move.l	a0,($0814)				;$21c8,$0814		;ff6866
	move.l	a0,($0818)				;$21c8,$0818		;ff686a
	clr.w	($0812)					;$4278,$0812		;ff686e
	move.b	#$08,($00e8e007)			;$13fc,$0008,$00e8,$e007	;ff6872
	move.l	(a7),d1					;$2217			;ff687a
	move.b	d1,($0810)				;$11c1,$0810		;ff687c
	clr.w	d0					;$4240			;ff6880
	move.b	d1,d0					;$1001			;ff6882
	asl.w	#2,d0					;$e540			;ff6884
	move.b	d0,($080b)				;$11c0,$080b		;ff6886
	lsr.w	#8,d0					;$e048			;ff688a
	and.w	#$0001,d0				;$c07c,$0001		;ff688c
	move.b	d0,($080c)				;$11c0,$080c		;ff6890
	move.b	d1,d0					;$1001			;ff6894
	asl.b	#4,d0					;$e900			;ff6896
	move.b	d0,($0811)				;$11c0,$0811		;ff6898
	bsr.w	Lff20e8					;$6100,$b84a		;ff689c
	move.b	#$41,d1					;$123c,$0041		;ff68a0
	bsr.w	Lff694c					;$6100,$00a6		;ff68a4
	move.b	#$49,d1					;$123c,$0049		;ff68a8
	bsr.w	Lff694c					;$6100,$009e		;ff68ac
	move.b	#$59,d1					;$123c,$0059		;ff68b0
	bsr.w	Lff694c					;$6100,$0096		;ff68b4
	move.b	#$51,d1					;$123c,$0051		;ff68b8
	bsr.w	Lff694c					;$6100,$008e		;ff68bc
	move.b	($00ed0027),d1				;$1239,$00ed,$0027	;ff68c0
	and.b	#$01,d1					;$c23c,$0001		;ff68c6
	or.b	#$5c,d1					;$823c,$005c		;ff68ca
	bsr.s	Lff694c					;$617c			;ff68ce
	move.b	($00ed003a),d1				;$1239,$00ed,$003a	;ff68d0
	and.w	#$000f,d1				;$c27c,$000f		;ff68d6
	or.w	#$0060,d1				;$827c,$0060		;ff68da
	bsr.s	Lff694c					;$616c			;ff68de
	move.b	($00ed003b),d1				;$1239,$00ed,$003b	;ff68e0
	and.w	#$000f,d1				;$c27c,$000f		;ff68e6
	or.w	#$0070,d1				;$827c,$0070		;ff68ea
	bsr.s	Lff694c					;$615c			;ff68ee
	andi.w	#$f8ff,sr				;$027c,$f8ff		;ff68f0
	move.l	(a7)+,d1				;$221f			;ff68f4
	rts						;$4e75			;ff68f6

Call_BITSNS:									;ff68f8
	clr.l	d0					;$4280			;ff68f8
	lea.l	($0800),a0				;$41f8,$0800		;ff68fa
	move.b	(a0,d1.w),d0				;$1030,$1000		;ff68fe
	rts						;$4e75			;ff6902

Call_SKEYSET:									;ff6904
	move.l	d1,d0					;$2001			;ff6904
	bra.w	Lff20fa					;$6000,$b7f2		;ff6906
Call_LEDCTRL:									;ff690a
	move.l	d1,-(a7)				;$2f01			;ff690a
	eori.b	#$ff,d1					;$0a01,$00ff		;ff690c
	or.b	#$80,d1					;$823c,$0080		;ff6910
	bsr.s	Lff694c					;$6136			;ff6914
	move.l	(a7)+,d1				;$221f			;ff6916
	rts						;$4e75			;ff6918

Call_LEDSET:									;ff691a
	bra.w	Lff20e8					;$6000,$b7cc		;ff691a
Call_KEYDLY:									;ff691e
	move.l	d1,-(a7)				;$2f01			;ff691e
	and.b	#$0f,d1					;$c23c,$000f		;ff6920
	or.b	#$60,d1					;$823c,$0060		;ff6924
	bsr.s	Lff694c					;$6122			;ff6928
	move.l	(a7)+,d1				;$221f			;ff692a
	rts						;$4e75			;ff692c

Call_KEYREP:									;ff692e
	move.l	d1,-(a7)				;$2f01			;ff692e
	and.b	#$0f,d1					;$c23c,$000f		;ff6930
	or.b	#$70,d1					;$823c,$0070		;ff6934
	bsr.s	Lff694c					;$6112			;ff6938
	move.l	(a7)+,d1				;$221f			;ff693a
	rts						;$4e75			;ff693c

Call_TV_Control_OPT2:								;ff693e
	move.l	d1,-(a7)				;$2f01			;ff693e
	move.b	d0,d1					;$1200			;ff6940
	add.b	#$52,d1					;$d23c,$0052		;ff6942
	bsr.s	Lff694c					;$6104			;ff6946
	move.l	(a7)+,d1				;$221f			;ff6948
	rts						;$4e75			;ff694a

Lff694c:									;ff694c
	move.b	($00e8802d),d0				;$1039,$00e8,$802d	;ff694c
	btst.l	#$07,d0					;$0800,$0007		;ff6952
	beq.s	Lff694c					;$67f4			;ff6956
	move.b	d1,($00e8802f)				;$13c1,$00e8,$802f	;ff6958
	rts						;$4e75			;ff695e

Call_TVCTRL:									;ff6960
	btst.l	#$05,d1					;$0801,$0005		;ff6960
	beq.s	Lff696e					;$6708			;ff6964
	move.w	d1,-(a7)				;$3f01			;ff6966
	moveq.l	#$07,d1					;$7207			;ff6968
	bsr.s	Lff696e					;$6102			;ff696a
	move.w	(a7)+,d1				;$321f			;ff696c
Lff696e:									;ff696e
	and.w	#$001f,d1				;$c27c,$001f		;ff696e
	movem.l	d1-d6/a0-a2,-(a7)			;$48e7,$7ee0		;ff6972
	lea.l	($00e8e003),a0				;$41f9,$00e8,$e003	;ff6976
	tst.w	d1					;$4a41			;ff697c
	beq.s	Lff69bc					;$673c			;ff697e
	cmpi.w	#$0007,d1				;$0c41,$0007		;ff6980
	beq.s	Lff69c2					;$673c			;ff6984
	cmpi.w	#$000d,d1				;$0c41,$000d		;ff6986
	beq.s	Lff69d0					;$6744			;ff698a
	cmpi.w	#$001b,d1				;$0c41,$001b		;ff698c
	ble.s	Lff69ba					;$6f28			;ff6990
	move.w	d1,d6					;$3c01			;ff6992
	move.w	#$0005,d1				;$323c,$0005		;ff6994
	bsr.s	Lff69dc					;$6142			;ff6998
	cmpi.w	#$001c,d6				;$0c46,$001c		;ff699a
	beq.s	Lff69bc					;$671c			;ff699e
	move.w	#$0008,d1				;$323c,$0008		;ff69a0
	cmpi.w	#$001d,d6				;$0c46,$001d		;ff69a4
	beq.s	Lff69ba					;$6710			;ff69a8
	move.w	#$000f,d1				;$323c,$000f		;ff69aa
	bsr.s	Lff69dc					;$612c			;ff69ae
	move.w	#$000a,d1				;$323c,$000a		;ff69b0
	cmpi.w	#$001e,d6				;$0c46,$001e		;ff69b4
	beq.s	Lff69bc					;$6702			;ff69b8
Lff69ba:									;ff69ba
	bsr.s	Lff69dc					;$6120			;ff69ba
Lff69bc:									;ff69bc
	movem.l	(a7)+,d1-d6/a0-a2			;$4cdf,$077e		;ff69bc
	rts						;$4e75			;ff69c0

Lff69c2:									;ff69c2
	btst.b	#$03,($00e8e003)			;$0839,$0003,$00e8,$e003	;ff69c2
	beq.s	Lff69bc					;$67f0			;ff69ca
Lff69cc:									;ff69cc
	moveq.l	#$0e,d1					;$720e			;ff69cc
	bra.s	Lff69ba					;$60ea			;ff69ce
Lff69d0:									;ff69d0
	btst.b	#$03,($00e8e003)			;$0839,$0003,$00e8,$e003	;ff69d0
	bne.s	Lff69bc					;$66e2			;ff69d8
	bra.s	Lff69cc					;$60f0			;ff69da
Lff69dc:									;ff69dc
	lea.l	(Lff0d12,pc),a2				;$45fa,$a334		;ff69dc
	lea.l	($00e88023),a1				;$43f9,$00e8,$8023	;ff69e0
	move.w	sr,-(a7)				;$40e7			;ff69e6
	ori.w	#$0700,sr				;$007c,$0700		;ff69e8
	lsl.w	#3,d1					;$e749			;ff69ec
	move.w	d1,d2					;$3401			;ff69ee
	eori.w	#$0ff8,d2				;$0a42,$0ff8		;ff69f0
	swap.w	d2					;$4842			;ff69f4
	move.w	d1,d2					;$3401			;ff69f6
	move.b	(a1),d0					;$1011			;ff69f8
	move.b	(a1),d0					;$1011			;ff69fa
Lff69fc:									;ff69fc
	cmp.b	(a1),d0					;$b011			;ff69fc
	beq.s	Lff69fc					;$67fc			;ff69fe
	bsr.s	Lff6a0a					;$6108			;ff6a00
	swap.w	d2					;$4842			;ff6a02
	bsr.s	Lff6a0a					;$6104			;ff6a04
	move.w	(a7)+,sr				;$46df			;ff6a06
	rts						;$4e75			;ff6a08

Lff6a0a:									;ff6a0a
	moveq.l	#$0c,d3					;$760c			;ff6a0a
	moveq.l	#$30,d4					;$7830			;ff6a0c
Lff6a0e:									;ff6a0e
	moveq.l	#$05,d0					;$7005			;ff6a0e
	move.b	#$08,(a0)				;$10bc,$0008		;ff6a10
	jsr	(a2)					;$4e92			;ff6a14
	clr.b	(a0)					;$4210			;ff6a16
	subq.w	#1,d4					;$5344			;ff6a18
	moveq.l	#$0f,d0					;$700f			;ff6a1a
	lsr.w	#1,d2					;$e24a			;ff6a1c
	bcc.s	Lff6a28					;$6408			;ff6a1e
	subq.w	#1,d4					;$5344			;ff6a20
	add.l	#$00000014,d0				;$d0bc,$0000,$0014	;ff6a22
Lff6a28:									;ff6a28
	jsr	(a2)					;$4e92			;ff6a28
	dbra.w	d3,Lff6a0e				;$51cb,$ffe2		;ff6a2a
	mulu.w	#$0014,d4				;$c8fc,$0014		;ff6a2e
	move.l	d4,d0					;$2004			;ff6a32
	jsr	(a2)					;$4e92			;ff6a34
	rts						;$4e75			;ff6a36

Call_LEDMOD:									;ff6a38
	moveq.l	#$ff,d0					;$70ff			;ff6a38
	cmp.w	#$0007,d1				;$b27c,$0007		;ff6a3a
	bcc.s	Lff6aa8					;$6468			;ff6a3e
	movem.l	d1/d3/a0,-(a7)				;$48e7,$5080		;ff6a40
	lea.l	($0810),a0				;$41f8,$0810		;ff6a44
	move.w	(a0),d0					;$3010			;ff6a48
	ror.w	#8,d0					;$e058			;ff6a4a
	move.w	d1,d3					;$3601			;ff6a4c
	add.w	#$000c,d3				;$d67c,$000c		;ff6a4e
	tst.b	d2					;$4a02			;ff6a52
	beq.s	Lff6a7e					;$6728			;ff6a54
	bset.l	d3,d0					;$07c0			;ff6a56
	bset.l	d1,d0					;$03c0			;ff6a58
	cmp.b	#$02,d1					;$b23c,$0002		;ff6a5a
	bcc.s	Lff6a74					;$6414			;ff6a5e
	eori.b	#$01,d3					;$0a03,$0001		;ff6a60
	eori.b	#$01,d1					;$0a01,$0001		;ff6a64
	bclr.l	d3,d0					;$0780			;ff6a68
	bclr.l	d1,d0					;$0380			;ff6a6a
	eori.b	#$01,d3					;$0a03,$0001		;ff6a6c
	eori.b	#$01,d1					;$0a01,$0001		;ff6a70
Lff6a74:									;ff6a74
	btst.b	d1,(a0)					;$0310			;ff6a74
	bne.s	Lff6a8a					;$6612			;ff6a76
	add.w	#$005a,d1				;$d27c,$005a		;ff6a78
	bra.s	Lff6a8a					;$600c			;ff6a7c
Lff6a7e:									;ff6a7e
	bclr.l	d3,d0					;$0780			;ff6a7e
	bclr.l	d1,d0					;$0380			;ff6a80
	btst.b	d1,(a0)					;$0310			;ff6a82
	beq.s	Lff6a8a					;$6704			;ff6a84
	add.w	#$005a,d1				;$d27c,$005a		;ff6a86
Lff6a8a:									;ff6a8a
	move.w	(a0),-(a7)				;$3f10			;ff6a8a
	rol.w	#8,d0					;$e158			;ff6a8c
	move.w	d0,(a0)					;$3080			;ff6a8e
	move.w	d1,d0					;$3001			;ff6a90
	move.w	(a7)+,d1				;$321f			;ff6a92
	cmp.w	#$005a,d0				;$b07c,$005a		;ff6a94
	bcs.s	Lff6a9e					;$6504			;ff6a98
	bsr.w	Lff4aa0					;$6100,$e004		;ff6a9a
Lff6a9e:									;ff6a9e
	bsr.w	Lff20e8					;$6100,$b648		;ff6a9e
	movem.l	(a7)+,d1/d3/a0				;$4cdf,$010a		;ff6aa2
	clr.l	d0					;$4280			;ff6aa6
Lff6aa8:									;ff6aa8
	rts						;$4e75			;ff6aa8

Call_TGUSEMD:									;ff6aaa
	lea.l	($09dc),a0				;$41f8,$09dc		;ff6aaa
	tst.b	d1					;$4a01			;ff6aae
	beq.s	Lff6ac8					;$6716			;ff6ab0
	cmp.b	#$01,d1					;$b23c,$0001		;ff6ab2
	bne.s	Lff6ad6					;$661e			;ff6ab6
	addq.l	#1,a0					;$5288			;ff6ab8
	cmp.b	#$02,d2					;$b43c,$0002		;ff6aba
	bne.s	Lff6ac8					;$6608			;ff6abe
	bsr.w	Lff4e6c					;$6100,$e3aa		;ff6ac0
	bsr.w	Lff494a					;$6100,$de84		;ff6ac4
Lff6ac8:									;ff6ac8
	clr.l	d0					;$4280			;ff6ac8
	move.b	(a0),d0					;$1010			;ff6aca
	cmp.b	#-$01,d2				;$b43c,$ffff		;ff6acc
	beq.s	Lff6ad4					;$6702			;ff6ad0
	move.b	d2,(a0)					;$1082			;ff6ad2
Lff6ad4:									;ff6ad4
	rts						;$4e75			;ff6ad4

Lff6ad6:									;ff6ad6
	moveq.l	#$ff,d0					;$70ff			;ff6ad6
	rts						;$4e75			;ff6ad8

Call_DEFCHR:									;ff6ada
	moveq.l	#$ff,d0					;$70ff			;ff6ada
	movem.l	d1-d2/a1,-(a7)				;$48e7,$6040		;ff6adc
	move.l	d1,d2					;$2401			;ff6ae0
	swap.w	d2					;$4842			;ff6ae2
	bne.s	Lff6aea					;$6604			;ff6ae4
	move.w	#$0008,d2				;$343c,$0008		;ff6ae6
Lff6aea:									;ff6aea
	cmp.w	#$0006,d2				;$b47c,$0006		;ff6aea
	beq.s	Lff6b12					;$6722			;ff6aee
	movea.l	($0458),a0				;$2078,$0458		;ff6af0
	jsr	(a0)					;$4e90			;ff6af4
	movea.l	d0,a0					;$2040			;ff6af6
	moveq.l	#$ff,d0					;$70ff			;ff6af8
	cmpa.l	#$00f00000,a0				;$b1fc,$00f0,$0000	;ff6afa
	bcc.s	Lff6b12					;$6410			;ff6b00
	addq.w	#1,d2					;$5242			;ff6b02
	addq.w	#1,d1					;$5241			;ff6b04
	mulu.w	d1,d2					;$c4c1			;ff6b06
	subq.w	#1,d2					;$5342			;ff6b08
Lff6b0a:									;ff6b0a
	move.b	(a1)+,(a0)+				;$10d9			;ff6b0a
	dbra.w	d2,Lff6b0a				;$51ca,$fffc		;ff6b0c
	clr.l	d0					;$4280			;ff6b10
Lff6b12:									;ff6b12
	movem.l	(a7)+,d1-d2/a1				;$4cdf,$0206		;ff6b12
	rts						;$4e75			;ff6b16

Lff6b18:									;ff6b18
	movem.l	d1-d3/a1-a2,-(a7)			;$48e7,$7060		;ff6b18
	cmp.b	#$1c,d1					;$b23c,$001c		;ff6b1c
	bcc.w	Lff6c46					;$6400,$0124		;ff6b20
	cmp.b	#$18,d1					;$b23c,$0018		;ff6b24
	bcc.s	Lff6b3c					;$6412			;ff6b28
	subq.b	#4,d1					;$5901			;ff6b2a
	bsr.s	Lff6ba0					;$6172			;ff6b2c
	bsr.w	Lffb408					;$6100,$48d8		;ff6b2e
	move.b	#$02,($093d)				;$11fc,$0002,$093d	;ff6b32
	moveq.l	#$01,d0					;$7001			;ff6b38
	bra.s	Lff6b4c					;$6010			;ff6b3a
Lff6b3c:									;ff6b3c
	subq.b	#8,d1					;$5101			;ff6b3c
	bsr.s	Lff6ba0					;$6160			;ff6b3e
	bsr.w	Lffb41e					;$6100,$48dc		;ff6b40
	move.b	#$01,($093d)				;$11fc,$0001,$093d	;ff6b44
	moveq.l	#$03,d0					;$7003			;ff6b4a
Lff6b4c:									;ff6b4c
	move.b	d0,($00e80028)				;$13c0,$00e8,$0028	;ff6b4c
	move.w	d0,($00e82400)				;$33c0,$00e8,$2400	;ff6b52
	move.l	#$00000400,($0960)			;$21fc,$0000,$0400,$0960	;ff6b58
	move.w	#$01ff,($096c)				;$31fc,$01ff,$096c	;ff6b60
	move.w	#$01a7,d0				;$303c,$01a7		;ff6b66
	cmp.b	#$11,d1					;$b23c,$0011		;ff6b6a
	beq.s	Lff6b7c					;$670c			;ff6b6e
	move.w	#$01df,d0				;$303c,$01df		;ff6b70
	cmp.b	#$13,d1					;$b23c,$0013		;ff6b74
	bne.w	Lff6c46					;$6600,$00cc		;ff6b78
Lff6b7c:									;ff6b7c
	move.w	d0,($096e)				;$31c0,$096e		;ff6b7c
	bra.w	Lff6c46					;$6000,$00c4		;ff6b80
Lff6b84:									;ff6b84
	moveq.l	#$00,d0					;$7000			;ff6b84
	move.b	($093c),d0				;$1038,$093c		;ff6b86
	rts						;$4e75			;ff6b8a

Call_CRTMOD:									;ff6b8c
	lea.l	($00e80028),a0				;$41f9,$00e8,$0028	;ff6b8c
	cmp.w	#$ffff,d1				;$b27c,$ffff		;ff6b92
	beq.s	Lff6b84					;$67ec			;ff6b96
	cmp.b	#$14,d1					;$b23c,$0014		;ff6b98
	bcc.w	Lff6b18					;$6400,$ff7a		;ff6b9c
Lff6ba0:									;ff6ba0
	movem.l	d1-d3/a1-a2,-(a7)			;$48e7,$7060		;ff6ba0
	cmp.w	#$0100,d1				;$b27c,$0100		;ff6ba4
	bcc.w	Lff6c4c					;$6400,$00a2		;ff6ba8
	cmp.w	#$0014,d1				;$b27c,$0014		;ff6bac
	bcc.w	Lff6c46					;$6400,$0094		;ff6bb0
	move.b	d1,($093c)				;$11c1,$093c		;ff6bb4
	move.w	#$0000,($00e82600)			;$33fc,$0000,$00e8,$2600	;ff6bb8
	bsr.w	Call_B_CUROFF				;$6100,$0e28		;ff6bc0
	move.w	#$0133,($00e8002a)			;$33fc,$0133,$00e8,$002a	;ff6bc4
	lea.l	($00e00000),a0				;$41f9,$00e0,$0000	;ff6bcc
	lea.l	($00e20000),a1				;$43f9,$00e2,$0000	;ff6bd2
	bsr.w	Lffb43a					;$6100,$4860		;ff6bd8
	move.w	#$0033,($00e8002a)			;$33fc,$0033,$00e8,$002a	;ff6bdc
	bsr.w	Lff6c7e					;$6100,$0098		;ff6be4
	move.w	#$0000,($00e80480)			;$33fc,$0000,$00e8,$0480	;ff6be8
	bsr.w	Lff6d70					;$6100,$017e		;ff6bf0
	bsr.w	Call_B_CURON				;$6100,$0dd8		;ff6bf4
	lea.l	($00e82200),a1				;$43f9,$00e8,$2200	;ff6bf8
	lea.l	($00ed002e),a0				;$41f9,$00ed,$002e	;ff6bfe
	move.w	(a0)+,(a1)+				;$32d8			;ff6c04
	move.w	(a0)+,(a1)+				;$32d8			;ff6c06
	move.w	(a0)+,(a1)+				;$32d8			;ff6c08
	move.w	(a0)+,(a1)+				;$32d8			;ff6c0a
	move.w	(a0),(a1)+				;$32d0			;ff6c0c
	move.w	(a0),(a1)+				;$32d0			;ff6c0e
	move.w	(a0),(a1)+				;$32d0			;ff6c10
	move.w	(a0)+,(a1)+				;$32d8			;ff6c12
	move.w	(a0),(a1)+				;$32d0			;ff6c14
	move.w	(a0),(a1)+				;$32d0			;ff6c16
	move.w	(a0),(a1)+				;$32d0			;ff6c18
	move.w	(a0),(a1)+				;$32d0			;ff6c1a
	move.w	(a0),(a1)+				;$32d0			;ff6c1c
	move.w	(a0),(a1)+				;$32d0			;ff6c1e
	move.w	(a0),(a1)+				;$32d0			;ff6c20
	move.w	(a0)+,(a1)+				;$32d8			;ff6c22
	move.b	($00ed0028),($00e8e001)			;$13f9,$00ed,$0028,$00e8,$e001	;ff6c24
	move.w	#$0010,($00eb0808)			;$33fc,$0010,$00eb,$0808	;ff6c2e
	move.w	#$0020,($00e82600)			;$33fc,$0020,$00e8,$2600	;ff6c36
	move.w	#$06e4,($00e82500)			;$33fc,$06e4,$00e8,$2500	;ff6c3e
Lff6c46:									;ff6c46
	movem.l	(a7)+,d1-d3/a1-a2			;$4cdf,$060e		;ff6c46
	rts						;$4e75			;ff6c4a

Lff6c4c:									;ff6c4c
	and.w	#$00ff,d1				;$c27c,$00ff		;ff6c4c
	cmp.w	#$0014,d1				;$b27c,$0014		;ff6c50
	bcc.s	Lff6c46					;$64f0			;ff6c54
	move.b	d1,($093c)				;$11c1,$093c		;ff6c56
	move.w	($00e82600),-(a7)			;$3f39,$00e8,$2600	;ff6c5a
	move.w	#$0000,($00e82600)			;$33fc,$0000,$00e8,$2600	;ff6c60
	bsr.s	Lff6c7e					;$6114			;ff6c68
	move.w	(a7),d0					;$3017			;ff6c6a
	and.w	#$001f,d0				;$c07c,$001f		;ff6c6c
	beq.s	Lff6c76					;$6704			;ff6c70
	bsr.w	Lffb38a					;$6100,$4716		;ff6c72
Lff6c76:									;ff6c76
	move.w	(a7)+,($00e82600)			;$33df,$00e8,$2600	;ff6c76
	bra.s	Lff6c46					;$60c8			;ff6c7c
Lff6c7e:									;ff6c7e
	lsl.w	#5,d1					;$eb49			;ff6c7e
	lea.l	(Lff6dca,pc),a0				;$41fa,$0148		;ff6c80
	lea.l	(a0,d1.w),a0				;$41f0,$1000		;ff6c84
	lea.l	($0014,a0),a2				;$45e8,$0014		;ff6c88
	clr.w	($0964)					;$4278,$0964		;ff6c8c
	move.w	(a0)+,d0				;$3018			;ff6c90
	move.w	(a0)+,d3				;$3618			;ff6c92
	move.w	d0,d2					;$3400			;ff6c94
	and.w	#$001f,d0				;$c07c,$001f		;ff6c96
	lea.l	($00e80000),a1				;$43f9,$00e8,$0000	;ff6c9a
	move.w	($0028,a1),d1				;$3229,$0028		;ff6ca0
	and.w	#$001f,d1				;$c27c,$001f		;ff6ca4
	rol.b	#4,d1					;$e919			;ff6ca8
	cmp.b	#$71,d1					;$b23c,$0071		;ff6caa
	bne.s	Lff6cb4					;$6604			;ff6cae
	move.w	#$0060,d1				;$323c,$0060		;ff6cb0
Lff6cb4:									;ff6cb4
	rol.b	#4,d0					;$e918			;ff6cb4
	cmp.b	#$71,d0					;$b03c,$0071		;ff6cb6
	bne.s	Lff6cc0					;$6604			;ff6cba
	move.w	#$0060,d0				;$303c,$0060		;ff6cbc
Lff6cc0:									;ff6cc0
	cmp.w	d1,d0					;$b041			;ff6cc0
	bcc.s	Lff6cd0					;$640c			;ff6cc2
	move.w	d2,($0028,a1)				;$3342,$0028		;ff6cc4
	bsr.w	Lff6d98					;$6100,$00ce		;ff6cc8
	move.w	d3,(a1)					;$3283			;ff6ccc
	bra.s	Lff6cda					;$600a			;ff6cce
Lff6cd0:									;ff6cd0
	move.w	d3,(a1)					;$3283			;ff6cd0
	bsr.w	Lff6d98					;$6100,$00c4		;ff6cd2
	move.w	d2,($0028,a1)				;$3342,$0028		;ff6cd6
Lff6cda:									;ff6cda
	move.w	d2,d3					;$3602			;ff6cda
	ror.w	#8,d3					;$e05b			;ff6cdc
	andi.w	#$0007,d3				;$0243,$0007		;ff6cde
	move.w	d3,($00e82400)				;$33c3,$00e8,$2400	;ff6ce2
	lea.l	($00eb080a),a1				;$43f9,$00eb,$080a	;ff6ce8
	clr.w	d0					;$4240			;ff6cee
	move.b	($0001,a2),d0				;$102a,$0001		;ff6cf0
	move.w	d0,($0002,a1)				;$3340,$0002		;ff6cf4
	bsr.w	Lff6dc0					;$6100,$00c6		;ff6cf8
	clr.w	d0					;$4240			;ff6cfc
	move.b	(a2),d0					;$1012			;ff6cfe
	move.w	d0,(a1)					;$3280			;ff6d00
	addq.l	#2,a2					;$548a			;ff6d02
	addq.l	#4,a1					;$5889			;ff6d04
	move.b	(a2)+,d0				;$101a			;ff6d06
	move.w	d0,(a1)+				;$32c0			;ff6d08
	move.b	(a2)+,d0				;$101a			;ff6d0a
	move.w	d0,(a1)					;$3280			;ff6d0c
	clr.l	d0					;$4280			;ff6d0e
	clr.w	($0968)					;$4278,$0968		;ff6d10
	clr.w	($096a)					;$4278,$096a		;ff6d14
	move.w	(a2)+,d0				;$301a			;ff6d18
	move.l	d0,d1					;$2200			;ff6d1a
	asl.l	#1,d0					;$e380			;ff6d1c
	move.l	d0,($0960)				;$21c0,$0960		;ff6d1e
	move.w	(a2)+,d0				;$301a			;ff6d22
	move.w	d0,($096c)				;$31c0,$096c		;ff6d24
	subq.w	#1,($096c)				;$5378,$096c		;ff6d28
	lsr.w	#3,d0					;$e648			;ff6d2c
	subq.w	#1,d0					;$5340			;ff6d2e
	move.w	d0,($0970)				;$31c0,$0970		;ff6d30
	move.w	(a2)+,d0				;$301a			;ff6d34
	move.w	d0,($096e)				;$31c0,$096e		;ff6d36
	subq.w	#1,($096e)				;$5378,$096e		;ff6d3a
	lsr.w	#4,d0					;$e848			;ff6d3e
	subq.w	#1,d0					;$5340			;ff6d40
	move.w	d0,($0972)				;$31c0,$0972		;ff6d42
	clr.l	($0948)					;$42b8,$0948		;ff6d46
	clr.w	($0974)					;$4278,$0974		;ff6d4a
	clr.w	($0976)					;$4278,$0976		;ff6d4e
	move.w	(a2)+,d0				;$301a			;ff6d52
	move.b	d0,($093d)				;$11c0,$093d		;ff6d54
	move.l	#$00e00000,($0944)			;$21fc,$00e0,$0000,$0944	;ff6d58
	move.w	($096c),d2				;$3438,$096c		;ff6d60
	swap.w	d2					;$4842			;ff6d64
	move.w	($096e),d2				;$3438,$096e		;ff6d66
	clr.l	d1					;$4281			;ff6d6a
	bra.w	Call_MS_LIMIT				;$6000,$3e1a		;ff6d6c
Lff6d70:									;ff6d70
	move.w	($00e80028),d0				;$3039,$00e8,$0028	;ff6d70
	and.w	#$0003,d0				;$c07c,$0003		;ff6d76
	add.w	d0,d0					;$d040			;ff6d7a
	lea.l	(Lff6d90,pc),a0				;$41fa,$0012		;ff6d7c
	adda.w	(Lff6d90,pc,d0.w),a0			;$d0fb,$000e		;ff6d80
	jsr	(a0)					;$4e90			;ff6d84
	bset.b	#$03,($00e80028)			;$08f9,$0003,$00e8,$0028	;ff6d86
	rts						;$4e75			;ff6d8e

Lff6d90:									;ff6d90
	.dc.w	$4664,$4678,$468e,$468e						;ff6d90
Lff6d98:									;ff6d98
	move.l	a1,-(a7)				;$2f09			;ff6d98
	move.w	#$0007,d1				;$323c,$0007		;ff6d9a
	addq.l	#2,a1					;$5489			;ff6d9e
Lff6da0:									;ff6da0
	move.w	(a0)+,(a1)+				;$32d8			;ff6da0
	dbra.w	d1,Lff6da0				;$51c9,$fffc		;ff6da2
	move.w	#$000a,d1				;$323c,$000a		;ff6da6
Lff6daa:									;ff6daa
	clr.w	(a1)+					;$4259			;ff6daa
	dbra.w	d1,Lff6daa				;$51c9,$fffc		;ff6dac
	addq.l	#2,a1					;$5489			;ff6db0
	move.w	#$0033,(a1)+				;$32fc,$0033		;ff6db2
	clr.w	(a1)+					;$4259			;ff6db6
	clr.w	(a1)+					;$4259			;ff6db8
	clr.w	(a1)+					;$4259			;ff6dba
	movea.l	(a7)+,a1				;$225f			;ff6dbc
	rts						;$4e75			;ff6dbe

Lff6dc0:									;ff6dc0
	move.w	#$0826,d0				;$303c,$0826		;ff6dc0
Lff6dc4:									;ff6dc4
	dbra.w	d0,Lff6dc4				;$51c8,$fffe		;ff6dc4
	rts						;$4e75			;ff6dc8

Lff6dca:									;ff6dca
	.dc.b	$03,$15,$00,$5b,$00,$09,$00,$11					;ff6dca
	.dc.b	$00,$51,$02,$37,$00,$05,$00,$28					;ff6dd2
	.dc.b	$02,$28,$00,$1b,$ff,$15,$28,$15					;ff6dda
	.dc.b	$04,$00,$02,$00,$02,$00,$00,$01					;ff6de2
	.dc.b	$03,$05,$00,$4b,$00,$03,$00,$05					;ff6dea
	.dc.b	$00,$45,$01,$03,$00,$02,$00,$10					;ff6df2
	.dc.b	$01,$00,$00,$2c,$ff,$09,$10,$05					;ff6dfa
	.dc.b	$04,$00,$02,$00,$02,$00,$00,$01					;ff6e02
	.dc.b	$03,$10,$00,$2d,$00,$04,$00,$06					;ff6e0a
	.dc.b	$00,$26,$02,$37,$00,$05,$00,$28					;ff6e12
	.dc.b	$02,$28,$00,$1b,$ff,$0a,$28,$10					;ff6e1a
	.dc.b	$04,$00,$01,$00,$01,$00,$00,$01					;ff6e22
	.dc.b	$03,$00,$00,$25,$00,$01,$00,$00					;ff6e2a
	.dc.b	$00,$20,$01,$03,$00,$02,$00,$10					;ff6e32
	.dc.b	$01,$00,$00,$24,$25,$04,$10,$00					;ff6e3a
	.dc.b	$04,$00,$01,$00,$01,$00,$00,$01					;ff6e42
	.dc.b	$03,$15,$00,$5b,$00,$09,$00,$11					;ff6e4a
	.dc.b	$00,$51,$02,$37,$00,$05,$00,$28					;ff6e52
	.dc.b	$02,$28,$00,$1b,$ff,$15,$28,$15					;ff6e5a
	.dc.b	$02,$00,$02,$00,$02,$00,$00,$04					;ff6e62
	.dc.b	$03,$05,$00,$4b,$00,$03,$00,$05					;ff6e6a
	.dc.b	$00,$45,$01,$03,$00,$02,$00,$10					;ff6e72
	.dc.b	$01,$00,$00,$2c,$ff,$09,$10,$05					;ff6e7a
	.dc.b	$02,$00,$02,$00,$02,$00,$00,$04					;ff6e82
	.dc.b	$03,$10,$00,$2d,$00,$04,$00,$06					;ff6e8a
	.dc.b	$00,$26,$02,$37,$00,$05,$00,$28					;ff6e92
	.dc.b	$02,$28,$00,$1b,$ff,$0a,$28,$10					;ff6e9a
	.dc.b	$02,$00,$01,$00,$01,$00,$00,$04					;ff6ea2
	.dc.b	$03,$00,$00,$25,$00,$01,$00,$00					;ff6eaa
	.dc.b	$00,$20,$01,$03,$00,$02,$00,$10					;ff6eb2
	.dc.b	$01,$00,$00,$24,$25,$04,$10,$00					;ff6eba
	.dc.b	$02,$00,$01,$00,$01,$00,$00,$04					;ff6ec2
	.dc.b	$03,$15,$00,$5b,$00,$09,$00,$11					;ff6eca
	.dc.b	$00,$51,$02,$37,$00,$05,$00,$28					;ff6ed2
	.dc.b	$02,$28,$00,$1b,$ff,$15,$28,$15					;ff6eda
	.dc.b	$02,$00,$02,$00,$02,$00,$00,$02					;ff6ee2
	.dc.b	$03,$05,$00,$4b,$00,$03,$00,$05					;ff6eea
	.dc.b	$00,$45,$01,$03,$00,$02,$00,$10					;ff6ef2
	.dc.b	$01,$00,$00,$2c,$ff,$09,$10,$05					;ff6efa
	.dc.b	$02,$00,$02,$00,$02,$00,$00,$02					;ff6f02
	.dc.b	$03,$10,$00,$2d,$00,$04,$00,$06					;ff6f0a
	.dc.b	$00,$26,$02,$37,$00,$05,$00,$28					;ff6f12
	.dc.b	$02,$28,$00,$1b,$ff,$0a,$28,$10					;ff6f1a
	.dc.b	$02,$00,$01,$00,$01,$00,$00,$02					;ff6f22
	.dc.b	$03,$00,$00,$25,$00,$01,$00,$00					;ff6f2a
	.dc.b	$00,$20,$01,$03,$00,$02,$00,$10					;ff6f32
	.dc.b	$01,$00,$00,$24,$25,$04,$10,$00					;ff6f3a
	.dc.b	$02,$00,$01,$00,$01,$00,$00,$02					;ff6f42
	.dc.b	$03,$15,$00,$5b,$00,$09,$00,$11					;ff6f4a
	.dc.b	$00,$51,$02,$37,$00,$05,$00,$28					;ff6f52
	.dc.b	$02,$28,$00,$1b,$ff,$15,$28,$15					;ff6f5a
	.dc.b	$02,$00,$02,$00,$02,$00,$00,$01					;ff6f62
	.dc.b	$03,$05,$00,$4b,$00,$03,$00,$05					;ff6f6a
	.dc.b	$00,$45,$01,$03,$00,$02,$00,$10					;ff6f72
	.dc.b	$01,$00,$00,$2c,$ff,$09,$10,$05					;ff6f7a
	.dc.b	$02,$00,$02,$00,$02,$00,$00,$01					;ff6f82
	.dc.b	$03,$10,$00,$2d,$00,$04,$00,$06					;ff6f8a
	.dc.b	$00,$26,$02,$37,$00,$05,$00,$28					;ff6f92
	.dc.b	$02,$28,$00,$1b,$ff,$0a,$28,$10					;ff6f9a
	.dc.b	$02,$00,$01,$00,$01,$00,$00,$01					;ff6fa2
	.dc.b	$03,$00,$00,$25,$00,$01,$00,$00					;ff6faa
	.dc.b	$00,$20,$01,$03,$00,$02,$00,$10					;ff6fb2
	.dc.b	$01,$00,$00,$24,$25,$04,$10,$00					;ff6fba
	.dc.b	$02,$00,$01,$00,$01,$00,$00,$01					;ff6fc2
	.dc.b	$03,$16,$00,$89,$00,$0e,$00,$1c					;ff6fca
	.dc.b	$00,$7c,$02,$37,$00,$05,$00,$28					;ff6fd2
	.dc.b	$02,$28,$00,$1b,$ff,$ff,$ff,$ff					;ff6fda
	.dc.b	$04,$00,$03,$00,$02,$00,$00,$01					;ff6fe2
	.dc.b	$03,$16,$00,$af,$00,$0f,$00,$1f					;ff6fea
	.dc.b	$00,$9f,$01,$d0,$00,$07,$00,$20					;ff6ff2
	.dc.b	$01,$c8,$00,$1b,$ff,$ff,$ff,$ff					;ff6ffa
	.dc.b	$04,$00,$04,$00,$01,$a8,$00,$01					;ff7002
	.dc.b	$03,$1a,$00,$af,$00,$0f,$00,$1f					;ff700a
	.dc.b	$00,$9f,$01,$d0,$00,$07,$00,$20					;ff7012
	.dc.b	$01,$c8,$00,$1b,$ff,$ff,$ff,$ff					;ff701a
	.dc.b	$04,$00,$04,$00,$03,$50,$00,$01					;ff7022
	.dc.b	$03,$17,$00,$63,$00,$0b,$00,$0d					;ff702a
	.dc.b	$00,$5d,$02,$0c,$00,$01,$00,$21					;ff7032
	.dc.b	$02,$01,$00,$1b,$ff,$ff,$ff,$ff					;ff703a
	.dc.b	$04,$00,$02,$80,$01,$e0,$00,$01					;ff7042
Call_CONTRAST:									;ff704a
	move.b	($00e8e001),d0				;$1039,$00e8,$e001	;ff704a
	and.l	#$0000000f,d0				;$c0bc,$0000,$000f	;ff7050
	cmp.b	#-$01,d1				;$b23c,$ffff		;ff7056
	beq.s	$00ff7068				;$670c			;ff705a
	cmp.b	#-$02,d1				;$b23c,$fffe		;ff705c
	beq.s	Lff706a					;$6708			;ff7060
	move.b	d1,($00e8e001)				;$13c1,$00e8,$e001	;ff7062
	rts						;$4e75			;ff7068

Lff706a:									;ff706a
	move.b	($00ed0028),($00e8e001)			;$13f9,$00ed,$0028,$00e8,$e001	;ff706a
	rts						;$4e75			;ff7074

Call_HSVTORGB:									;ff7076
	movem.l	d1-d7,-(a7)				;$48e7,$7f00		;ff7076
	move.l	d1,d2					;$2401			;ff707a
	ror.l	#8,d2					;$e09a			;ff707c
	move.l	d1,d3					;$2601			;ff707e
	swap.w	d3					;$4843			;ff7080
	move.w	d3,d4					;$3803			;ff7082
	ror.w	#5,d4					;$ea5c			;ff7084
	and.w	#$001f,d1				;$c27c,$001f		;ff7086
	and.w	#$001f,d2				;$c47c,$001f		;ff708a
	and.w	#$001f,d3				;$c67c,$001f		;ff708e
	and.w	#$0007,d4				;$c87c,$0007		;ff7092
	clr.l	d0					;$4280			;ff7096
	tst.b	d2					;$4a02			;ff7098
	bne.s	Lff70aa					;$660e			;ff709a
	move.w	d1,d0					;$3001			;ff709c
	rol.w	#5,d0					;$eb58			;ff709e
	or.b	d1,d0					;$8001			;ff70a0
	rol.w	#5,d0					;$eb58			;ff70a2
	or.b	d1,d0					;$8001			;ff70a4
	bra.w	Lff714e					;$6000,$00a6		;ff70a6
Lff70aa:									;ff70aa
	move.w	d1,d5					;$3a01			;ff70aa
	asl.w	#1,d5					;$e345			;ff70ac
	addq.w	#1,d5					;$5245			;ff70ae
	asl.w	#1,d2					;$e342			;ff70b0
	addq.w	#1,d2					;$5242			;ff70b2
	mulu.w	d2,d5					;$cac2			;ff70b4
	move.w	d5,d6					;$3c05			;ff70b6
	add.w	#$0040,d5				;$da7c,$0040		;ff70b8
	lsr.w	#7,d5					;$ee4d			;ff70bc
	subq.w	#1,d2					;$5342			;ff70be
	lsr.w	#1,d2					;$e24a			;ff70c0
	asl.w	#1,d3					;$e343			;ff70c2
	addq.w	#1,d3					;$5243			;ff70c4
	mulu.w	d3,d6					;$ccc3			;ff70c6
	add.l	#$00001000,d6				;$dcbc,$0000,$1000	;ff70c8
	lsr.l	#5,d6					;$ea8e			;ff70ce
	lsr.l	#8,d6					;$e08e			;ff70d0
	subq.w	#1,d3					;$5343			;ff70d2
	lsr.w	#1,d3					;$e24b			;ff70d4
	move.w	d1,d7					;$3e01			;ff70d6
	sub.w	d5,d7					;$9e45			;ff70d8
	swap.w	d7					;$4847			;ff70da
	move.w	d1,d7					;$3e01			;ff70dc
	sub.w	d6,d7					;$9e46			;ff70de
	move.w	d1,d0					;$3001			;ff70e0
	add.w	d6,d0					;$d046			;ff70e2
	sub.w	d5,d0					;$9045			;ff70e4
	move.w	d0,d5					;$3a00			;ff70e6
	move.w	d7,d6					;$3c07			;ff70e8
	swap.w	d7					;$4847			;ff70ea
	subq.w	#1,d4					;$5344			;ff70ec
	bcc.s	Lff70fc					;$640c			;ff70ee
	move.w	d5,d0					;$3005			;ff70f0
	rol.w	#5,d0					;$eb58			;ff70f2
	or.b	d1,d0					;$8001			;ff70f4
	rol.w	#5,d0					;$eb58			;ff70f6
	or.b	d7,d0					;$8007			;ff70f8
	bra.s	Lff714e					;$6052			;ff70fa
Lff70fc:									;ff70fc
	subq.w	#1,d4					;$5344			;ff70fc
	bcc.s	Lff710c					;$640c			;ff70fe
	move.w	d1,d0					;$3001			;ff7100
	rol.w	#5,d0					;$eb58			;ff7102
	or.b	d6,d0					;$8006			;ff7104
	rol.w	#5,d0					;$eb58			;ff7106
	or.b	d7,d0					;$8007			;ff7108
	bra.s	Lff714e					;$6042			;ff710a
Lff710c:									;ff710c
	subq.w	#1,d4					;$5344			;ff710c
	bcc.s	Lff711c					;$640c			;ff710e
	move.w	d1,d0					;$3001			;ff7110
	rol.w	#5,d0					;$eb58			;ff7112
	or.b	d7,d0					;$8007			;ff7114
	rol.w	#5,d0					;$eb58			;ff7116
	or.b	d5,d0					;$8005			;ff7118
	bra.s	Lff714e					;$6032			;ff711a
Lff711c:									;ff711c
	subq.w	#1,d4					;$5344			;ff711c
	bcc.s	Lff712c					;$640c			;ff711e
	move.w	d6,d0					;$3006			;ff7120
	rol.w	#5,d0					;$eb58			;ff7122
	or.b	d7,d0					;$8007			;ff7124
	rol.w	#5,d0					;$eb58			;ff7126
	or.b	d1,d0					;$8001			;ff7128
	bra.s	Lff714e					;$6022			;ff712a
Lff712c:									;ff712c
	subq.w	#1,d4					;$5344			;ff712c
	bcc.s	Lff713c					;$640c			;ff712e
	move.w	d7,d0					;$3007			;ff7130
	rol.w	#5,d0					;$eb58			;ff7132
	or.b	d5,d0					;$8005			;ff7134
	rol.w	#5,d0					;$eb58			;ff7136
	or.b	d1,d0					;$8001			;ff7138
	bra.s	Lff714e					;$6012			;ff713a
Lff713c:									;ff713c
	subq.w	#1,d4					;$5344			;ff713c
	bcc.s	Lff714c					;$640c			;ff713e
	move.w	d7,d0					;$3007			;ff7140
	rol.w	#5,d0					;$eb58			;ff7142
	or.b	d1,d0					;$8001			;ff7144
	rol.w	#5,d0					;$eb58			;ff7146
	or.b	d6,d0					;$8006			;ff7148
	bra.s	Lff714e					;$6002			;ff714a
Lff714c:									;ff714c
	moveq.l	#$ff,d0					;$70ff			;ff714c
Lff714e:									;ff714e
	rol.w	#1,d0					;$e358			;ff714e
	movem.l	(a7)+,d1-d7				;$4cdf,$00fe		;ff7150
	rts						;$4e75			;ff7154

Call_TPALET:									;ff7156
	cmp.l	#$ffffffff,d2				;$b4bc,$ffff,$ffff	;ff7156
	beq.s	Lff71d8					;$677a			;ff715c
	cmp.l	#$fffffffe,d2				;$b4bc,$ffff,$fffe	;ff715e
	bne.s	Lff718c					;$6626			;ff7164
	clr.l	d0					;$4280			;ff7166
	move.b	d1,d0					;$1001			;ff7168
	cmp.b	#$04,d1					;$b23c,$0004		;ff716a
	bcs.s	Lff717a					;$650a			;ff716e
	moveq.l	#$04,d0					;$7004			;ff7170
	cmp.b	#$08,d1					;$b23c,$0008		;ff7172
	bcs.s	Lff717a					;$6502			;ff7176
	moveq.l	#$05,d0					;$7005			;ff7178
Lff717a:									;ff717a
	lea.l	($00ed002e),a0				;$41f9,$00ed,$002e	;ff717a
	adda.l	d0,a0					;$d1c0			;ff7180
	adda.l	d0,a0					;$d1c0			;ff7182
	move.w	(a0),d2					;$3410			;ff7184
	bsr.s	Lff718c					;$6104			;ff7186
	moveq.l	#$fe,d2					;$74fe			;ff7188
	rts						;$4e75			;ff718a

Lff718c:									;ff718c
	moveq.l	#$08,d0					;$7008			;ff718c
	cmp.b	d0,d1					;$b200			;ff718e
	bcc.s	Lff719a					;$6408			;ff7190
	cmp.b	#$04,d1					;$b23c,$0004		;ff7192
	bcs.s	Call_TPALET2				;$651a			;ff7196
	moveq.l	#$04,d0					;$7004			;ff7198
Lff719a:									;ff719a
	movem.l	d1/d3,-(a7)				;$48e7,$5000		;ff719a
	move.w	d0,d3					;$3600			;ff719e
	move.w	d0,d1					;$3200			;ff71a0
	subq.w	#1,d3					;$5343			;ff71a2
Lff71a4:									;ff71a4
	bsr.s	Lff71ba					;$6114			;ff71a4
	addq.w	#1,d1					;$5241			;ff71a6
	dbra.w	d3,Lff71a4				;$51cb,$fffa		;ff71a8
	movem.l	(a7)+,d1/d3				;$4cdf,$000a		;ff71ac
	rts						;$4e75			;ff71b0

Call_TPALET2:									;ff71b2
	cmp.l	#$ffffffff,d2				;$b4bc,$ffff,$ffff	;ff71b2
	beq.s	Lff71d8					;$671e			;ff71b8
Lff71ba:									;ff71ba
	clr.l	d0					;$4280			;ff71ba
	move.b	d1,d0					;$1001			;ff71bc
	cmp.b	#$0f,d0					;$b03c,$000f		;ff71be
	bhi.s	Lff71d4					;$6210			;ff71c2
	add.w	d0,d0					;$d040			;ff71c4
	lea.l	($00e82200),a0				;$41f9,$00e8,$2200	;ff71c6
	adda.l	d0,a0					;$d1c0			;ff71cc
	move.w	d2,(a0)					;$3082			;ff71ce
	clr.l	d0					;$4280			;ff71d0
	rts						;$4e75			;ff71d2

Lff71d4:									;ff71d4
	moveq.l	#$ff,d0					;$70ff			;ff71d4
	rts						;$4e75			;ff71d6

Lff71d8:									;ff71d8
	clr.l	d0					;$4280			;ff71d8
	move.b	d1,d0					;$1001			;ff71da
	cmp.b	#$0f,d0					;$b03c,$000f		;ff71dc
	bhi.s	Lff71d4					;$62f2			;ff71e0
	add.w	d0,d0					;$d040			;ff71e2
	lea.l	($00e82200),a0				;$41f9,$00e8,$2200	;ff71e4
	bsr.s	Lff71f2					;$6106			;ff71ea
	move.w	(a0,d0.w),d0				;$3030,$0000		;ff71ec
	rts						;$4e75			;ff71f0

Lff71f2:									;ff71f2
	btst.b	#$04,($00e88001)			;$0839,$0004,$00e8,$8001	;ff71f2
	bne.s	Lff71f2					;$66f6			;ff71fa
	rts						;$4e75			;ff71fc

Call_TCOLOR:									;ff71fe
	and.w	#$000f,d1				;$c27c,$000f		;ff71fe
	move.w	d1,($0942)				;$31c1,$0942		;ff7202
	move.l	#$000000e0,d0				;$203c,$0000,$00e0	;ff7206
	btst.l	#$00,d1					;$0801,$0000		;ff720c
	bne.s	Lff722c					;$661a			;ff7210
	addq.w	#2,d0					;$5440			;ff7212
	btst.l	#$01,d1					;$0801,$0001		;ff7214
	bne.s	Lff722c					;$6612			;ff7218
	addq.w	#2,d0					;$5440			;ff721a
	btst.l	#$02,d1					;$0801,$0002		;ff721c
	bne.s	Lff722c					;$660a			;ff7220
	addq.w	#2,d0					;$5440			;ff7222
	btst.l	#$03,d1					;$0801,$0003		;ff7224
	bne.s	Lff722c					;$6602			;ff7228
	subq.w	#6,d0					;$5d40			;ff722a
Lff722c:									;ff722c
	swap.w	d0					;$4840			;ff722c
	move.l	d0,($0944)				;$21c0,$0944		;ff722e
	rts						;$4e75			;ff7232

Call_FNTADR:									;ff7234
	cmp.b	#$08,d2					;$b43c,$0008		;ff7234
	bne.s	Lff723c					;$6602			;ff7238
	moveq.l	#$00,d2					;$7400			;ff723a
Lff723c:									;ff723c
	cmp.w	#$2121,d1				;$b27c,$2121		;ff723c
	bcs.w	Lff73bc					;$6500,$017a		;ff7240
	cmpi.w	#$f000,d1				;$0c41,$f000		;ff7244
	bcc.w	Lff7424					;$6400,$01da		;ff7248
	cmpi.w	#$8140,d1				;$0c41,$8140		;ff724c
	bcc.s	Lff7276					;$6424			;ff7250
	cmp.w	#$7e7f,d1				;$b27c,$7e7f		;ff7252
	bcc.w	Lff73ac					;$6400,$0154		;ff7256
	moveq.l	#$00,d0					;$7000			;ff725a
	move.b	d1,d0					;$1001			;ff725c
	lsr.w	#8,d1					;$e049			;ff725e
	sub.w	#$0021,d1				;$927c,$0021		;ff7260
	cmp.w	#$007f,d0				;$b07c,$007f		;ff7264
	bcc.s	Lff7270					;$6406			;ff7268
	sub.w	#$0021,d0				;$907c,$0021		;ff726a
	bcc.s	Lff72b4					;$6444			;ff726e
Lff7270:									;ff7270
	moveq.l	#$07,d0					;$7007			;ff7270
	moveq.l	#$01,d1					;$7201			;ff7272
	bra.s	Lff72b4					;$603e			;ff7274
Lff7276:									;ff7276
	moveq.l	#$00,d0					;$7000			;ff7276
	move.b	d1,d0					;$1001			;ff7278
	lsr.w	#8,d1					;$e049			;ff727a
	cmp.w	#$009f,d1				;$b27c,$009f		;ff727c
	bls.s	Lff728c					;$630a			;ff7280
	cmp.w	#$00e0,d1				;$b27c,$00e0		;ff7282
	bcs.s	Lff7270					;$65e8			;ff7286
	add.w	#$ffc0,d1				;$d27c,$ffc0		;ff7288
Lff728c:									;ff728c
	sub.w	#$0081,d1				;$927c,$0081		;ff728c
	sub.w	#$0040,d0				;$907c,$0040		;ff7290
	bcs.s	Lff7270					;$65da			;ff7294
	cmp.w	#$003f,d0				;$b07c,$003f		;ff7296
	beq.s	Lff7270					;$67d4			;ff729a
	bcs.s	Lff72a6					;$6508			;ff729c
	cmp.w	#$00bd,d0				;$b07c,$00bd		;ff729e
	bcc.s	Lff7270					;$64cc			;ff72a2
	subq.w	#1,d0					;$5340			;ff72a4
Lff72a6:									;ff72a6
	add.w	d1,d1					;$d241			;ff72a6
	cmp.w	#$005e,d0				;$b07c,$005e		;ff72a8
	bcs.s	Lff72b4					;$6506			;ff72ac
	addq.w	#1,d1					;$5241			;ff72ae
	sub.w	#$005e,d0				;$907c,$005e		;ff72b0
Lff72b4:									;ff72b4
	cmp.w	#$000f,d1				;$b27c,$000f		;ff72b4
	bcs.s	Lff730a					;$6550			;ff72b8
	cmp.w	#$0055,d1				;$b27c,$0055		;ff72ba
	bcc.s	Lff731c					;$645c			;ff72be
	subq.w	#7,d1					;$5f41			;ff72c0
Lff72c2:									;ff72c2
	mulu.w	#$005e,d1				;$c2fc,$005e		;ff72c2
	add.l	d0,d1					;$d280			;ff72c6
	move.l	#$00f00000,d0				;$203c,$00f0,$0000	;ff72c8
	tst.b	d2					;$4a02			;ff72ce
	bne.s	Lff72e0					;$660e			;ff72d0
Lff72d2:									;ff72d2
	lsl.l	#5,d1					;$eb89			;ff72d2
	add.l	d1,d0					;$d081			;ff72d4
	move.l	#$00100001,d1				;$223c,$0010,$0001	;ff72d6
	moveq.l	#$0f,d2					;$740f			;ff72dc
	rts						;$4e75			;ff72de

Lff72e0:									;ff72e0
	move.l	#$00f40000,d0				;$203c,$00f4,$0000	;ff72e0
Lff72e6:									;ff72e6
	mulu.w	#$0048,d1				;$c2fc,$0048		;ff72e6
	add.l	d1,d0					;$d081			;ff72ea
	cmp.b	#$06,d2					;$b43c,$0006		;ff72ec
	beq.s	Lff72fc					;$670a			;ff72f0
	move.l	#$00180002,d1				;$223c,$0018,$0002	;ff72f2
	moveq.l	#$17,d2					;$7417			;ff72f8
	rts						;$4e75			;ff72fa

Lff72fc:									;ff72fc
	bsr.w	Lff74b0					;$6100,$01b2		;ff72fc
	move.l	#$000c0001,d1				;$223c,$000c,$0001	;ff7300
	moveq.l	#$0b,d2					;$740b			;ff7306
	rts						;$4e75			;ff7308

Lff730a:									;ff730a
	lea.l	(Lff7356,pc),a0				;$41fa,$004a		;ff730a
	tst.b	(a0,d1.w)				;$4a30,$1000		;ff730e
	beq.s	Lff72c2					;$67ae			;ff7312
	bpl.s	Lff733e					;$6a28			;ff7314
	moveq.l	#$00,d0					;$7000			;ff7316
	moveq.l	#$00,d1					;$7200			;ff7318
	bra.s	Lff72b4					;$6098			;ff731a
Lff731c:									;ff731c
	sub.w	#$0055,d1				;$927c,$0055		;ff731c
	beq.s	Lff732a					;$6708			;ff7320
	cmp.w	#$0001,d1				;$b27c,$0001		;ff7322
	bhi.w	Lff7270					;$6200,$ff48		;ff7326
Lff732a:									;ff732a
	mulu.w	#$005e,d1				;$c2fc,$005e		;ff732a
	add.l	d0,d1					;$d280			;ff732e
	move.l	($099e),d0				;$2038,$099e		;ff7330
	tst.b	d2					;$4a02			;ff7334
	beq.s	Lff72d2					;$679a			;ff7336
	move.l	($09aa),d0				;$2038,$09aa		;ff7338
	bra.s	Lff72e6					;$60a8			;ff733c
Lff733e:									;ff733e
	sub.w	#$000b,d1				;$927c,$000b		;ff733e
	mulu.w	#$005e,d1				;$c2fc,$005e		;ff7342
	add.l	d0,d1					;$d280			;ff7346
	move.l	($099a),d0				;$2038,$099a		;ff7348
	tst.b	d2					;$4a02			;ff734c
	beq.s	Lff72d2					;$6782			;ff734e
	move.l	($09a6),d0				;$2038,$09a6		;ff7350
	bra.s	Lff72e6					;$6090			;ff7354
Lff7356:									;ff7356
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00					;ff7356
	.dc.b	$ff,$ff,$ff,$01,$01,$ff,$ff,$00					;ff735e
Lff7366:									;ff7366
	and.l	#$000000ff,d1				;$c2bc,$0000,$00ff	;ff7366
	cmp.w	#$005c,d1				;$b27c,$005c		;ff736c
	bcc.s	Lff7374					;$6402			;ff7370
Lff7372:									;ff7372
	rts						;$4e75			;ff7372

Lff7374:									;ff7374
	lea.l	($00ed0059),a0				;$41f9,$00ed,$0059	;ff7374
	beq.s	Lff7394					;$6718			;ff737a
	cmp.w	#$007e,d1				;$b27c,$007e		;ff737c
	beq.s	Lff73a0					;$671e			;ff7380
	cmp.w	#$007c,d1				;$b27c,$007c		;ff7382
	bne.s	Lff7372					;$66ea			;ff7386
	btst.b	#$02,(a0)				;$0810,$0002		;ff7388
	beq.s	Lff7372					;$67e4			;ff738c
	move.w	#$0082,d1				;$323c,$0082		;ff738e
	bra.s	Lff7372					;$60de			;ff7392
Lff7394:									;ff7394
	btst.b	#$00,(a0)				;$0810,$0000		;ff7394
	beq.s	Lff7372					;$67d8			;ff7398
	move.w	#$0080,d1				;$323c,$0080		;ff739a
	bra.s	Lff7372					;$60d2			;ff739e
Lff73a0:									;ff73a0
	btst.b	#$01,(a0)				;$0810,$0001		;ff73a0
	beq.s	Lff7372					;$67cc			;ff73a4
	move.w	#$0081,d1				;$323c,$0081		;ff73a6
	bra.s	Lff7372					;$60c6			;ff73aa
Lff73ac:									;ff73ac
	cmp.w	#$80a6,d1				;$b27c,$80a6		;ff73ac
	bcs.s	Lff73bc					;$650a			;ff73b0
	cmp.w	#$80de,d1				;$b27c,$80de		;ff73b2
	bcc.s	Lff73bc					;$6404			;ff73b6
	eori.b	#$20,d1					;$0a01,$0020		;ff73b8
Lff73bc:									;ff73bc
	bsr.s	Lff7366					;$61a8			;ff73bc
	cmp.b	#$06,d2					;$b43c,$0006		;ff73be
	bcs.s	Lff73e4					;$6520			;ff73c2
	beq.s	Lff73f6					;$6730			;ff73c4
	move.l	#$00f3d000,d0				;$203c,$00f3,$d000	;ff73c6
Lff73cc:									;ff73cc
	lsl.l	#4,d1					;$e989			;ff73cc
	add.l	d1,d0					;$d081			;ff73ce
	add.l	d1,d0					;$d081			;ff73d0
	add.l	d1,d0					;$d081			;ff73d2
Lff73d4:									;ff73d4
	cmp.b	#$06,d2					;$b43c,$0006		;ff73d4
	beq.s	Lff740c					;$6732			;ff73d8
	move.l	#$000c0001,d1				;$223c,$000c,$0001	;ff73da
	moveq.l	#$17,d2					;$7417			;ff73e0
	rts						;$4e75			;ff73e2

Lff73e4:									;ff73e4
	move.l	#$00f3a800,d0				;$203c,$00f3,$a800	;ff73e4
Lff73ea:									;ff73ea
	lsl.l	#4,d1					;$e989			;ff73ea
	add.l	d1,d0					;$d081			;ff73ec
Lff73ee:									;ff73ee
	moveq.l	#$08,d1					;$7208			;ff73ee
	swap.w	d1					;$4841			;ff73f0
	moveq.l	#$0f,d2					;$740f			;ff73f2
	rts						;$4e75			;ff73f4

Lff73f6:									;ff73f6
	move.l	#$00fbf400,d0				;$203c,$00fb,$f400	;ff73f6
	lsl.l	#2,d1					;$e589			;ff73fc
	add.l	d1,d0					;$d081			;ff73fe
	add.l	d1,d0					;$d081			;ff7400
	add.l	d1,d0					;$d081			;ff7402
Lff7404:									;ff7404
	moveq.l	#$06,d1					;$7206			;ff7404
	swap.w	d1					;$4841			;ff7406
	moveq.l	#$0b,d2					;$740b			;ff7408
	rts						;$4e75			;ff740a

Lff740c:									;ff740c
	bsr.w	Lff74fe					;$6100,$00f0		;ff740c
	bra.s	Lff7404					;$60f2			;ff7410
Lff7412:									;ff7412
	and.w	#$01ff,d1				;$c27c,$01ff		;ff7412
	move.l	($09a2),d0				;$2038,$09a2		;ff7416
	tst.b	d2					;$4a02			;ff741a
	beq.s	Lff73ea					;$67cc			;ff741c
	move.l	($09ae),d0				;$2038,$09ae		;ff741e
	bra.s	Lff73cc					;$60a8			;ff7422
Lff7424:									;ff7424
	and.l	#$0000ffff,d1				;$c2bc,$0000,$ffff	;ff7424
	cmp.w	#$f400,d1				;$b27c,$f400		;ff742a
	bcc.s	Lff7412					;$64e2			;ff742e
	movem.l	d3/a1,-(a7)				;$48e7,$1040		;ff7430
	lea.l	($0c46),a0				;$41f8,$0c46		;ff7434
	movea.l	a0,a1					;$2248			;ff7438
	moveq.l	#$00,d3					;$7600			;ff743a
	move.w	#$0011,d0				;$303c,$0011		;ff743c
Lff7440:									;ff7440
	move.l	d3,(a0)+				;$20c3			;ff7440
	dbra.w	d0,Lff7440				;$51c8,$fffc		;ff7442
	btst.l	#$09,d1					;$0801,$0009		;ff7446
	beq.s	Lff7456					;$670a			;ff744a
	addq.l	#8,a1					;$5089			;ff744c
	tst.b	d2					;$4a02			;ff744e
	beq.s	Lff7456					;$6704			;ff7450
	adda.w	#$0010,a1				;$d2fc,$0010		;ff7452
Lff7456:									;ff7456
	btst.l	#$08,d1					;$0801,$0008		;ff7456
	beq.s	Lff746c					;$6710			;ff745a
	cmp.b	#$a6,d1					;$b23c,$00a6		;ff745c
	bcs.s	Lff746c					;$650a			;ff7460
	cmp.b	#$de,d1					;$b23c,$00de		;ff7462
	bcc.s	Lff746c					;$6404			;ff7466
	eori.w	#$0020,d1				;$0a41,$0020		;ff7468
Lff746c:									;ff746c
	bsr.w	Lff7366					;$6100,$fef8		;ff746c
	pea.l	($0c46)					;$4878,$0c46		;ff7470
	tst.b	d2					;$4a02			;ff7474
	bne.s	Lff7488					;$6610			;ff7476
	pea.l	(Lff73ee,pc)				;$487a,$ff74		;ff7478
	movea.l	#$00f3a000,a0				;$207c,$00f3,$a000	;ff747c
	lsl.l	#3,d1					;$e789			;ff7482
	adda.l	d1,a0					;$d1c1			;ff7484
	bra.s	Lff74a2					;$601a			;ff7486
Lff7488:									;ff7488
	pea.l	(Lff73d4,pc)				;$487a,$ff4a		;ff7488
	movea.l	#$00f3b800,a0				;$207c,$00f3,$b800	;ff748c
	lsl.l	#3,d1					;$e789			;ff7492
	adda.l	d1,a0					;$d1c1			;ff7494
	adda.l	d1,a0					;$d1c1			;ff7496
	adda.l	d1,a0					;$d1c1			;ff7498
	move.l	(a0)+,(a1)+				;$22d8			;ff749a
	move.l	(a0)+,(a1)+				;$22d8			;ff749c
	move.l	(a0)+,(a1)+				;$22d8			;ff749e
	move.l	(a0)+,(a1)+				;$22d8			;ff74a0
Lff74a2:									;ff74a2
	move.l	(a0)+,(a1)+				;$22d8			;ff74a2
	move.l	(a0)+,(a1)+				;$22d8			;ff74a4
	movea.l	(a7)+,a0				;$205f			;ff74a6
	move.l	(a7)+,d0				;$201f			;ff74a8
	movem.l	(a7)+,d3/a1				;$4cdf,$0208		;ff74aa
	jmp	(a0)					;$4ed0			;ff74ae

Lff74b0:									;ff74b0
	movem.l	d3-d4/a1,-(a7)				;$48e7,$1840		;ff74b0
	movea.l	d0,a0					;$2040			;ff74b4
	lea.l	($0c46),a1				;$43f8,$0c46		;ff74b6
	move.l	a1,d0					;$2009			;ff74ba
	move.w	#$000b,d1				;$323c,$000b		;ff74bc
Lff74c0:									;ff74c0
	moveq.l	#$00,d2					;$7400			;ff74c0
	move.b	(a0)+,d2				;$1418			;ff74c2
	swap.w	d2					;$4842			;ff74c4
	move.b	(a0)+,d2				;$1418			;ff74c6
	lsl.w	#8,d2					;$e14a			;ff74c8
	move.b	(a0)+,d2				;$1418			;ff74ca
	moveq.l	#$00,d3					;$7600			;ff74cc
	move.b	(a0)+,d3				;$1618			;ff74ce
	swap.w	d3					;$4843			;ff74d0
	move.b	(a0)+,d3				;$1618			;ff74d2
	lsl.w	#8,d3					;$e14b			;ff74d4
	move.b	(a0)+,d3				;$1618			;ff74d6
	or.l	d3,d2					;$8483			;ff74d8
	moveq.l	#$ff,d3					;$76ff			;ff74da
	lsl.l	#7,d2					;$ef8a			;ff74dc
	move.w	#$000b,d4				;$383c,$000b		;ff74de
Lff74e2:									;ff74e2
	rol.w	#1,d3					;$e35b			;ff74e2
	asl.l	#2,d2					;$e582			;ff74e4
	bcs.s	Lff74ec					;$6504			;ff74e6
	bmi.s	Lff74ec					;$6b02			;ff74e8
	subq.w	#1,d3					;$5343			;ff74ea
Lff74ec:									;ff74ec
	dbra.w	d4,Lff74e2				;$51cc,$fff4		;ff74ec
	lsl.w	#4,d3					;$e94b			;ff74f0
	move.w	d3,(a1)+				;$32c3			;ff74f2
	dbra.w	d1,Lff74c0				;$51c9,$ffca		;ff74f4
	movem.l	(a7)+,d3-d4/a1				;$4cdf,$0218		;ff74f8
	rts						;$4e75			;ff74fc

Lff74fe:									;ff74fe
	movem.l	d3-d4/a1,-(a7)				;$48e7,$1840		;ff74fe
	movea.l	d0,a0					;$2040			;ff7502
	lea.l	($0c46),a1				;$43f8,$0c46		;ff7504
	move.l	a1,d0					;$2009			;ff7508
	move.w	#$000b,d1				;$323c,$000b		;ff750a
Lff750e:									;ff750e
	move.b	(a0)+,d2				;$1418			;ff750e
	lsl.w	#8,d2					;$e14a			;ff7510
	move.b	(a0)+,d2				;$1418			;ff7512
	move.b	(a0)+,d3				;$1618			;ff7514
	lsl.w	#8,d3					;$e14b			;ff7516
	move.b	(a0)+,d3				;$1618			;ff7518
	or.w	d3,d2					;$8443			;ff751a
	moveq.l	#$ff,d3					;$76ff			;ff751c
	lsr.w	#1,d2					;$e24a			;ff751e
	moveq.l	#$05,d4					;$7805			;ff7520
Lff7522:									;ff7522
	rol.b	#1,d3					;$e31b			;ff7522
	asl.w	#2,d2					;$e542			;ff7524
	bcs.s	Lff752c					;$6504			;ff7526
	bmi.s	Lff752c					;$6b02			;ff7528
	subq.b	#1,d3					;$5303			;ff752a
Lff752c:									;ff752c
	dbra.w	d4,Lff7522				;$51cc,$fff4		;ff752c
	lsl.b	#2,d3					;$e50b			;ff7530
	move.b	d3,(a1)+				;$12c3			;ff7532
	dbra.w	d1,Lff750e				;$51c9,$ffd8		;ff7534
	movem.l	(a7)+,d3-d4/a1				;$4cdf,$0218		;ff7538
	rts						;$4e75			;ff753c

Call_VRAMGET:									;ff753e
	move.w	d1,d0					;$3001			;ff753e
Lff7540:									;ff7540
	move.b	(a2)+,(a1)+				;$12da			;ff7540
	dbra.w	d0,Lff7540				;$51c8,$fffc		;ff7542
	adda.l	d3,a2					;$d5c3			;ff7546
	dbra.w	d2,Call_VRAMGET				;$51ca,$fff4		;ff7548
	rts						;$4e75			;ff754c

Call_VRAMPUT:									;ff754e
	move.w	d1,d0					;$3001			;ff754e
Lff7550:									;ff7550
	move.b	(a1)+,(a2)+				;$14d9			;ff7550
	dbra.w	d0,Lff7550				;$51c8,$fffc		;ff7552
	adda.l	d3,a2					;$d5c3			;ff7556
	dbra.w	d2,Call_VRAMPUT				;$51ca,$fff4		;ff7558
	rts						;$4e75			;ff755c

Lff755e:									;ff755e
	movec.l	vbr,a0					;$4e7a,$8801		;ff755e
	movea.l	($0458,a0),a0				;$2068,$0458		;ff7562
	bra.s	Lff756e					;$6006			;ff7566
Lff7568:									;ff7568
	bra.s	Lff755e					;$60f4			;ff7568
Call_FNTGET:									;ff756a
	movea.l	($0458),a0				;$2078,$0458		;ff756a
Lff756e:									;ff756e
	movem.l	d1-d2/a1,-(a7)				;$48e7,$6040		;ff756e
	move.l	d1,d2					;$2401			;ff7572
	swap.w	d2					;$4842			;ff7574
	jsr	(a0)					;$4e90			;ff7576
	movea.l	d0,a0					;$2040			;ff7578
	swap.w	d1					;$4841			;ff757a
	move.w	d1,(a1)+				;$32c1			;ff757c
	addq.w	#1,d2					;$5242			;ff757e
	move.w	d2,(a1)+				;$32c2			;ff7580
	swap.w	d1					;$4841			;ff7582
	addq.w	#1,d1					;$5241			;ff7584
	mulu.w	d1,d2					;$c4c1			;ff7586
	lsr.w	#2,d2					;$e44a			;ff7588
	subq.w	#1,d2					;$5342			;ff758a
Lff758c:									;ff758c
	move.l	(a0)+,(a1)+				;$22d8			;ff758c
	dbra.w	d2,Lff758c				;$51ca,$fffc		;ff758e
	movem.l	(a7)+,d1-d2/a1				;$4cdf,$0206		;ff7592
	rts						;$4e75			;ff7596

Call_TEXTGET:									;ff7598
	movem.l	d1-d7/a1-a2,-(a7)			;$48e7,$7f60		;ff7598
	move.w	d1,d0					;$3001			;ff759c
	move.w	d2,d1					;$3202			;ff759e
	move.w	(a1)+,d2				;$3419			;ff75a0
	move.w	(a1)+,d3				;$3619			;ff75a2
	move.l	($093e),d7				;$2e38,$093e		;ff75a4
	subq.w	#1,d2					;$5342			;ff75a8
	subq.w	#1,d3					;$5343			;ff75aa
	move.w	d0,d4					;$3800			;ff75ac
	lsr.w	#3,d0					;$e648			;ff75ae
	mulu.w	d7,d1					;$c2c7			;ff75b0
	and.l	#$0000ffff,d0				;$c0bc,$0000,$ffff	;ff75b2
	add.l	d0,d1					;$d280			;ff75b8
	movea.l	($0944),a2				;$2478,$0944		;ff75ba
	adda.l	d1,a2					;$d5c1			;ff75be
	and.w	#$0007,d4				;$c87c,$0007		;ff75c0
	bne.s	Lff75fe					;$6638			;ff75c4
	move.w	d2,d5					;$3a02			;ff75c6
	and.w	#$0007,d5				;$ca7c,$0007		;ff75c8
	move.w	#$ff80,d6				;$3c3c,$ff80		;ff75cc
	ror.w	d5,d6					;$ea7e			;ff75d0
	lsr.w	#3,d2					;$e64a			;ff75d2
	beq.s	Lff75f0					;$671a			;ff75d4
	sub.w	d2,d7					;$9e42			;ff75d6
	subq.w	#1,d2					;$5342			;ff75d8
Lff75da:									;ff75da
	move.w	d2,d4					;$3802			;ff75da
Lff75dc:									;ff75dc
	move.b	(a2)+,(a1)+				;$12da			;ff75dc
	dbra.w	d4,Lff75dc				;$51cc,$fffc		;ff75de
	move.b	(a2),d0					;$1012			;ff75e2
	and.b	d6,d0					;$c006			;ff75e4
	move.b	d0,(a1)+				;$12c0			;ff75e6
	adda.l	d7,a2					;$d5c7			;ff75e8
	dbra.w	d3,Lff75da				;$51cb,$ffee		;ff75ea
	bra.s	Lff7654					;$6064			;ff75ee
Lff75f0:									;ff75f0
	move.b	(a2),d0					;$1012			;ff75f0
	and.b	d6,d0					;$c006			;ff75f2
	move.b	d0,(a1)+				;$12c0			;ff75f4
	adda.l	d7,a2					;$d5c7			;ff75f6
	dbra.w	d3,Lff75f0				;$51cb,$fff6		;ff75f8
	bra.s	Lff7654					;$6056			;ff75fc
Lff75fe:									;ff75fe
	move.w	#$0008,d1				;$323c,$0008		;ff75fe
	sub.w	d4,d1					;$9244			;ff7602
	move.w	d1,d5					;$3a01			;ff7604
	addq.w	#8,d1					;$5041			;ff7606
	move.w	d2,d4					;$3802			;ff7608
	and.w	#$0007,d4				;$c87c,$0007		;ff760a
	move.w	#$ff80,d6				;$3c3c,$ff80		;ff760e
	ror.w	d4,d6					;$e87e			;ff7612
	lsr.w	#3,d2					;$e64a			;ff7614
	beq.s	Lff7640					;$6728			;ff7616
	sub.w	d2,d7					;$9e42			;ff7618
	subq.w	#1,d7					;$5347			;ff761a
	subq.w	#1,d2					;$5342			;ff761c
Lff761e:									;ff761e
	move.b	(a2)+,d0				;$101a			;ff761e
	rol.w	#8,d0					;$e158			;ff7620
	move.w	d2,d4					;$3802			;ff7622
Lff7624:									;ff7624
	move.b	(a2)+,d0				;$101a			;ff7624
	ror.w	d5,d0					;$ea78			;ff7626
	move.b	d0,(a1)+				;$12c0			;ff7628
	rol.w	d1,d0					;$e378			;ff762a
	dbra.w	d4,Lff7624				;$51cc,$fff6		;ff762c
	move.b	(a2),d0					;$1012			;ff7630
	ror.w	d5,d0					;$ea78			;ff7632
	and.b	d6,d0					;$c006			;ff7634
	move.b	d0,(a1)+				;$12c0			;ff7636
	adda.l	d7,a2					;$d5c7			;ff7638
	dbra.w	d3,Lff761e				;$51cb,$ffe2		;ff763a
	bra.s	Lff7654					;$6014			;ff763e
Lff7640:									;ff7640
	move.b	(a2),d0					;$1012			;ff7640
	rol.w	#8,d0					;$e158			;ff7642
	move.b	($0001,a2),d0				;$102a,$0001		;ff7644
	ror.w	d5,d0					;$ea78			;ff7648
	and.b	d6,d0					;$c006			;ff764a
	move.b	d0,(a1)+				;$12c0			;ff764c
	adda.l	d7,a2					;$d5c7			;ff764e
	dbra.w	d3,Lff7640				;$51cb,$ffee		;ff7650
Lff7654:									;ff7654
	movem.l	(a7)+,d1-d7/a1-a2			;$4cdf,$06fe		;ff7654
	rts						;$4e75			;ff7658

Call_TEXTPUT:									;ff765a
	movem.l	d1-d7/a1-a3,-(a7)			;$48e7,$7f70		;ff765a
	move.w	d1,d0					;$3001			;ff765e
	move.w	d2,d1					;$3202			;ff7660
	move.w	(a1)+,d2				;$3419			;ff7662
	move.w	(a1)+,d3				;$3619			;ff7664
	move.l	($093e),d7				;$2e38,$093e		;ff7666
	subq.w	#1,d2					;$5342			;ff766a
	subq.w	#1,d3					;$5343			;ff766c
	move.w	d0,d4					;$3800			;ff766e
	lsr.w	#3,d0					;$e648			;ff7670
	mulu.w	d7,d1					;$c2c7			;ff7672
	and.l	#$0000ffff,d0				;$c0bc,$0000,$ffff	;ff7674
	add.l	d0,d1					;$d280			;ff767a
	movea.l	($0944),a2				;$2478,$0944		;ff767c
	adda.l	d1,a2					;$d5c1			;ff7680
	and.w	#$0007,d4				;$c87c,$0007		;ff7682
	bne.s	Lff76c4					;$663c			;ff7686
	move.w	d2,d5					;$3a02			;ff7688
	and.w	#$0007,d5				;$ca7c,$0007		;ff768a
	move.w	#$007f,d6				;$3c3c,$007f		;ff768e
	ror.w	d5,d6					;$ea7e			;ff7692
	lsr.w	#3,d2					;$e64a			;ff7694
	beq.s	Lff76b4					;$671c			;ff7696
	sub.w	d2,d7					;$9e42			;ff7698
	subq.w	#1,d2					;$5342			;ff769a
Lff769c:									;ff769c
	move.w	d2,d4					;$3802			;ff769c
Lff769e:									;ff769e
	move.b	(a1)+,(a2)+				;$14d9			;ff769e
	dbra.w	d4,Lff769e				;$51cc,$fffc		;ff76a0
	move.b	(a2),d0					;$1012			;ff76a4
	and.b	d6,d0					;$c006			;ff76a6
	or.b	(a1)+,d0				;$8019			;ff76a8
	move.b	d0,(a2)					;$1480			;ff76aa
	adda.l	d7,a2					;$d5c7			;ff76ac
	dbra.w	d3,Lff769c				;$51cb,$ffec		;ff76ae
	bra.s	Lff772c					;$6078			;ff76b2
Lff76b4:									;ff76b4
	move.b	(a2),d0					;$1012			;ff76b4
	and.b	d6,d0					;$c006			;ff76b6
	or.b	(a1)+,d0				;$8019			;ff76b8
	move.b	d0,(a2)					;$1480			;ff76ba
	adda.l	d7,a2					;$d5c7			;ff76bc
	dbra.w	d3,Lff76b4				;$51cb,$fff4		;ff76be
	bra.s	Lff772c					;$6068			;ff76c2
Lff76c4:									;ff76c4
	move.w	#$0008,d1				;$323c,$0008		;ff76c4
	sub.w	d4,d1					;$9244			;ff76c8
	move.w	d1,d5					;$3a01			;ff76ca
	addq.w	#8,d1					;$5041			;ff76cc
	move.w	d2,d4					;$3802			;ff76ce
	and.w	#$0007,d4				;$c87c,$0007		;ff76d0
	move.w	#$007f,d6				;$3c3c,$007f		;ff76d4
	ror.w	d4,d6					;$e87e			;ff76d8
	lsr.w	#3,d2					;$e64a			;ff76da
	beq.s	Lff7712					;$6734			;ff76dc
	sub.w	d2,d7					;$9e42			;ff76de
	subq.w	#1,d7					;$5347			;ff76e0
	subq.w	#1,d2					;$5342			;ff76e2
Lff76e4:									;ff76e4
	movea.l	a2,a3					;$264a			;ff76e4
	move.b	(a2)+,d0				;$101a			;ff76e6
	rol.w	#8,d0					;$e158			;ff76e8
	move.w	d2,d4					;$3802			;ff76ea
Lff76ec:									;ff76ec
	move.b	(a2)+,d0				;$101a			;ff76ec
	ror.w	d5,d0					;$ea78			;ff76ee
	move.b	(a1)+,d0				;$1019			;ff76f0
	rol.w	d1,d0					;$e378			;ff76f2
	move.b	d0,(a3)+				;$16c0			;ff76f4
	dbra.w	d4,Lff76ec				;$51cc,$fff4		;ff76f6
	move.b	(a2),d0					;$1012			;ff76fa
	ror.w	d5,d0					;$ea78			;ff76fc
	and.b	d6,d0					;$c006			;ff76fe
	or.b	(a1)+,d0				;$8019			;ff7700
	rol.w	d1,d0					;$e378			;ff7702
	move.b	d0,(a3)+				;$16c0			;ff7704
	ror.w	#8,d0					;$e058			;ff7706
	move.b	d0,(a3)+				;$16c0			;ff7708
	adda.l	d7,a2					;$d5c7			;ff770a
	dbra.w	d3,Lff76e4				;$51cb,$ffd6		;ff770c
	bra.s	Lff772c					;$601a			;ff7710
Lff7712:									;ff7712
	move.b	(a2)+,d0				;$101a			;ff7712
	rol.w	#8,d0					;$e158			;ff7714
	move.b	(a2),d0					;$1012			;ff7716
	ror.w	d5,d0					;$ea78			;ff7718
	and.b	d6,d0					;$c006			;ff771a
	or.b	(a1)+,d0				;$8019			;ff771c
	rol.w	d5,d0					;$eb78			;ff771e
	move.b	d0,(a2)					;$1480			;ff7720
	ror.w	#8,d0					;$e058			;ff7722
	move.b	d0,-(a2)				;$1500			;ff7724
	adda.l	d7,a2					;$d5c7			;ff7726
	dbra.w	d3,Lff7712				;$51cb,$ffe8		;ff7728
Lff772c:									;ff772c
	movem.l	(a7)+,d1-d7/a1-a3			;$4cdf,$0efe		;ff772c
	rts						;$4e75			;ff7730

Call_CLIPPUT:									;ff7732
	link.w	a6,#-$001c				;$4e56,$ffe4		;ff7732
	movem.l	d0-d7/a0-a3,-(a7)			;$48e7,$fff0		;ff7736
	move.w	d1,(-$001c,a6)				;$3d41,$ffe4		;ff773a
	move.w	d1,d0					;$3001			;ff773e
	move.w	d2,(-$001a,a6)				;$3d42,$ffe6		;ff7740
	move.w	d2,d1					;$3202			;ff7744
	move.l	a1,(-$0018,a6)				;$2d49,$ffe8		;ff7746
	move.w	(a2)+,(-$0010,a6)			;$3d5a,$fff0		;ff774a
	move.w	(a2)+,(-$000e,a6)			;$3d5a,$fff2		;ff774e
	move.w	(a2)+,(-$000c,a6)			;$3d5a,$fff4		;ff7752
	move.w	(a2)+,(-$000a,a6)			;$3d5a,$fff6		;ff7756
	movea.l	a1,a2					;$2449			;ff775a
	addq.l	#4,a1					;$5889			;ff775c
	move.w	($0002,a2),d2				;$342a,$0002		;ff775e
	cmp.w	(-$000c,a6),d0				;$b06e,$fff4		;ff7762
	bge.w	Lff798e					;$6c00,$0226		;ff7766
	move.w	d0,d4					;$3800			;ff776a
	add.w	(a2),d4					;$d852			;ff776c
	cmp.w	(-$0010,a6),d4				;$b86e,$fff0		;ff776e
	ble.w	Lff798e					;$6f00,$021a		;ff7772
	cmp.w	(-$000a,a6),d1				;$b26e,$fff6		;ff7776
	bge.w	Lff798e					;$6c00,$0212		;ff777a
	move.w	d1,d4					;$3801			;ff777e
	add.w	($0002,a2),d4				;$d86a,$0002		;ff7780
	cmp.w	(-$000e,a6),d4				;$b86e,$fff2		;ff7784
	ble.w	Lff798e					;$6f00,$0204		;ff7788
	cmp.w	(-$000e,a6),d1				;$b26e,$fff2		;ff778c
	bge.s	Lff77ac					;$6c1a			;ff7790
	move.w	(-$000e,a6),d4				;$382e,$fff2		;ff7792
	sub.w	d1,d4					;$9841			;ff7796
	move.w	(-$000e,a6),d1				;$322e,$fff2		;ff7798
	sub.w	d4,d2					;$9444			;ff779c
	move.w	(a2),d5					;$3a12			;ff779e
	subq.w	#1,d5					;$5345			;ff77a0
	lsr.w	#3,d5					;$e64d			;ff77a2
	addq.w	#1,d5					;$5245			;ff77a4
	mulu.w	d5,d4					;$c8c5			;ff77a6
	lea.l	(a1,d4.w),a1				;$43f1,$4000		;ff77a8
Lff77ac:									;ff77ac
	move.w	d1,d4					;$3801			;ff77ac
	add.w	d2,d4					;$d842			;ff77ae
	cmp.w	(-$000a,a6),d4				;$b86e,$fff6		;ff77b0
	ble.s	Lff77bc					;$6f06			;ff77b4
	move.w	(-$000a,a6),d2				;$342e,$fff6		;ff77b6
	sub.w	d1,d2					;$9441			;ff77ba
Lff77bc:									;ff77bc
	mulu.w	($0940),d1				;$c2f8,$0940		;ff77bc
	movea.l	d1,a0					;$2041			;ff77c0
	move.w	d0,d1					;$3200			;ff77c2
	asr.w	#3,d1					;$e641			;ff77c4
	lea.l	(a0,d1.w),a0				;$41f0,$1000		;ff77c6
	adda.l	($0944),a0				;$d1f8,$0944		;ff77ca
	move.w	d2,(-$0014,a6)				;$3d42,$ffec		;ff77ce
	move.w	(-$001c,a6),d0				;$302e,$ffe4		;ff77d2
	move.w	d0,(-$0012,a6)				;$3d40,$ffee		;ff77d6
	move.w	(-$0010,a6),d0				;$302e,$fff0		;ff77da
	and.w	#$0007,d0				;$c07c,$0007		;ff77de
	move.b	#$ff,d1					;$123c,$00ff		;ff77e2
	lsr.b	d0,d1					;$e029			;ff77e6
	move.b	d1,(-$0004,a6)				;$1d41,$fffc		;ff77e8
	not.b	d1					;$4601			;ff77ec
	move.b	d1,(-$0002,a6)				;$1d41,$fffe		;ff77ee
	move.w	(-$000c,a6),d0				;$302e,$fff4		;ff77f2
	and.w	#$0007,d0				;$c07c,$0007		;ff77f6
	move.w	#$0008,d1				;$323c,$0008		;ff77fa
	sub.w	d0,d1					;$9240			;ff77fe
	move.b	#$ff,d0					;$103c,$00ff		;ff7800
	lsl.b	d1,d0					;$e328			;ff7804
	move.b	d0,(-$0003,a6)				;$1d40,$fffd		;ff7806
	not.b	d0					;$4600			;ff780a
	move.b	d0,(-$0001,a6)				;$1d40,$ffff		;ff780c
	move.w	(-$0010,a6),d0				;$302e,$fff0		;ff7810
	lsr.w	#3,d0					;$e648			;ff7814
	move.w	d0,(-$0008,a6)				;$3d40,$fff8		;ff7816
	move.w	(-$000c,a6),d0				;$302e,$fff4		;ff781a
	lsr.w	#3,d0					;$e648			;ff781e
	move.w	d0,(-$0006,a6)				;$3d40,$fffa		;ff7820
Lff7824:									;ff7824
	move.w	(a2),d2					;$3412			;ff7824
	movea.l	a0,a3					;$2648			;ff7826
	move.w	(-$0012,a6),d0				;$302e,$ffee		;ff7828
	moveq.l	#$08,d3					;$7608			;ff782c
	move.w	d0,d1					;$3200			;ff782e
	asr.w	#3,d0					;$e640			;ff7830
	and.w	#$0007,d1				;$c27c,$0007		;ff7832
	beq.s	Lff7884					;$674c			;ff7836
	move.b	(a1)+,d3				;$1619			;ff7838
	move.b	d3,d6					;$1c03			;ff783a
	lsr.b	d1,d6					;$e22e			;ff783c
	move.w	#$0008,d4				;$383c,$0008		;ff783e
	sub.w	d1,d4					;$9841			;ff7842
	lsl.b	d4,d3					;$e92b			;ff7844
	swap.w	d3					;$4843			;ff7846
	move.w	d4,d3					;$3604			;ff7848
	clr.w	d1					;$4241			;ff784a
	subq.w	#1,d4					;$5344			;ff784c
Lff784e:									;ff784e
	bset.l	d4,d1					;$09c1			;ff784e
	subq.w	#1,d2					;$5342			;ff7850
	beq.s	Lff7858					;$6704			;ff7852
	dbra.w	d4,Lff784e				;$51cc,$fff8		;ff7854
Lff7858:									;ff7858
	not.w	d1					;$4641			;ff7858
	cmp.w	(-$0008,a6),d0				;$b06e,$fff8		;ff785a
	blt.s	Lff7880					;$6d20			;ff785e
	bne.s	Lff786a					;$6608			;ff7860
	and.b	(-$0004,a6),d6				;$cc2e,$fffc		;ff7862
	or.b	(-$0002,a6),d1				;$822e,$fffe		;ff7866
Lff786a:									;ff786a
	cmp.w	(-$0006,a6),d0				;$b06e,$fffa		;ff786a
	bne.s	Lff7878					;$6608			;ff786e
	and.b	(-$0003,a6),d6				;$cc2e,$fffd		;ff7870
	or.b	(-$0001,a6),d1				;$822e,$ffff		;ff7874
Lff7878:									;ff7878
	move.b	(a3),d5					;$1a13			;ff7878
	and.b	d1,d5					;$ca01			;ff787a
	or.b	d5,d6					;$8c05			;ff787c
	move.b	d6,(a3)					;$1686			;ff787e
Lff7880:									;ff7880
	addq.l	#1,a3					;$528b			;ff7880
	addq.w	#1,d0					;$5240			;ff7882
Lff7884:									;ff7884
	move.w	d2,d1					;$3202			;ff7884
	lsr.w	#3,d1					;$e649			;ff7886
	beq.w	Lff7928					;$6700,$009e		;ff7888
	move.w	d1,d4					;$3801			;ff788c
	lsl.w	#3,d4					;$e74c			;ff788e
	sub.w	d4,d2					;$9444			;ff7890
	subq.w	#1,d1					;$5341			;ff7892
	tst.w	d3					;$4a43			;ff7894
	beq.s	Lff78e6					;$674e			;ff7896
	move.w	#$0008,d4				;$383c,$0008		;ff7898
	sub.w	d3,d4					;$9843			;ff789c
	move.w	d3,d5					;$3a03			;ff789e
	swap.w	d3					;$4843			;ff78a0
	swap.w	d2					;$4842			;ff78a2
Lff78a4:									;ff78a4
	move.b	(a1),d6					;$1c11			;ff78a4
	clr.b	d2					;$4202			;ff78a6
	lsr.b	d4,d6					;$e82e			;ff78a8
	or.b	d3,d6					;$8c03			;ff78aa
	cmp.w	(-$0008,a6),d0				;$b06e,$fff8		;ff78ac
	blt.s	Lff78d4					;$6d22			;ff78b0
	bne.s	Lff78bc					;$6608			;ff78b2
	and.b	(-$0004,a6),d6				;$cc2e,$fffc		;ff78b4
	or.b	(-$0002,a6),d2				;$842e,$fffe		;ff78b8
Lff78bc:									;ff78bc
	cmp.w	(-$0006,a6),d0				;$b06e,$fffa		;ff78bc
	bgt.s	Lff78d4					;$6e12			;ff78c0
	bne.s	Lff78cc					;$6608			;ff78c2
	and.b	(-$0003,a6),d6				;$cc2e,$fffd		;ff78c4
	or.b	(-$0001,a6),d2				;$842e,$ffff		;ff78c8
Lff78cc:									;ff78cc
	move.b	(a3),d7					;$1e13			;ff78cc
	and.b	d2,d7					;$ce02			;ff78ce
	or.b	d7,d6					;$8c07			;ff78d0
	move.b	d6,(a3)					;$1686			;ff78d2
Lff78d4:									;ff78d4
	addq.l	#1,a3					;$528b			;ff78d4
	move.b	(a1)+,d3				;$1619			;ff78d6
	lsl.b	d5,d3					;$eb2b			;ff78d8
	addq.w	#1,d0					;$5240			;ff78da
	dbra.w	d1,Lff78a4				;$51c9,$ffc6		;ff78dc
	swap.w	d2					;$4842			;ff78e0
	swap.w	d3					;$4843			;ff78e2
	bra.s	Lff7928					;$6042			;ff78e4
Lff78e6:									;ff78e6
	swap.w	d2					;$4842			;ff78e6
Lff78e8:									;ff78e8
	move.b	(a1)+,d6				;$1c19			;ff78e8
	clr.b	d2					;$4202			;ff78ea
	cmp.w	(-$0008,a6),d0				;$b06e,$fff8		;ff78ec
	blt.s	Lff7914					;$6d22			;ff78f0
	bne.s	Lff78fc					;$6608			;ff78f2
	and.b	(-$0004,a6),d6				;$cc2e,$fffc		;ff78f4
	or.b	(-$0002,a6),d2				;$842e,$fffe		;ff78f8
Lff78fc:									;ff78fc
	cmp.w	(-$0006,a6),d0				;$b06e,$fffa		;ff78fc
	bgt.s	Lff7914					;$6e12			;ff7900
	bne.s	Lff790c					;$6608			;ff7902
	and.b	(-$0003,a6),d6				;$cc2e,$fffd		;ff7904
	or.b	(-$0001,a6),d2				;$842e,$ffff		;ff7908
Lff790c:									;ff790c
	move.b	(a3),d4					;$1813			;ff790c
	and.b	d2,d4					;$c802			;ff790e
	or.b	d4,d6					;$8c04			;ff7910
	move.b	d6,(a3)					;$1686			;ff7912
Lff7914:									;ff7914
	addq.l	#1,a3					;$528b			;ff7914
	addq.w	#1,d0					;$5240			;ff7916
	dbra.w	d1,Lff78e8				;$51c9,$ffce		;ff7918
	swap.w	d2					;$4842			;ff791c
	tst.w	d2					;$4a42			;ff791e
	beq.s	Lff797e					;$675c			;ff7920
	move.b	(a1)+,d3				;$1619			;ff7922
	swap.w	d3					;$4843			;ff7924
	moveq.l	#$08,d3					;$7608			;ff7926
Lff7928:									;ff7928
	tst.w	d2					;$4a42			;ff7928
	beq.s	Lff797e					;$6752			;ff792a
	move.w	#$0008,d1				;$323c,$0008		;ff792c
	sub.w	d3,d1					;$9243			;ff7930
	cmp.w	d2,d1					;$b242			;ff7932
	bge.s	Lff7940					;$6c0a			;ff7934
	move.b	(a1)+,d4				;$1819			;ff7936
	lsr.b	d1,d4					;$e22c			;ff7938
	swap.w	d3					;$4843			;ff793a
	or.b	d4,d3					;$8604			;ff793c
	swap.w	d3					;$4843			;ff793e
Lff7940:									;ff7940
	clr.w	d1					;$4241			;ff7940
	subq.w	#1,d2					;$5342			;ff7942
Lff7944:									;ff7944
	lsr.w	#1,d1					;$e249			;ff7944
	bset.l	#$07,d1					;$08c1,$0007		;ff7946
	dbra.w	d2,Lff7944				;$51ca,$fff8		;ff794a
	move.w	d1,d4					;$3801			;ff794e
	not.w	d4					;$4644			;ff7950
	swap.w	d3					;$4843			;ff7952
	and.b	d1,d3					;$c601			;ff7954
	cmp.w	(-$0008,a6),d0				;$b06e,$fff8		;ff7956
	blt.s	Lff797e					;$6d22			;ff795a
	bne.s	Lff7966					;$6608			;ff795c
	and.b	(-$0004,a6),d3				;$c62e,$fffc		;ff795e
	or.b	(-$0002,a6),d4				;$882e,$fffe		;ff7962
Lff7966:									;ff7966
	cmp.w	(-$0006,a6),d0				;$b06e,$fffa		;ff7966
	bgt.s	Lff797e					;$6e12			;ff796a
	bne.s	Lff7976					;$6608			;ff796c
	and.b	(-$0003,a6),d3				;$c62e,$fffd		;ff796e
	or.b	(-$0001,a6),d4				;$882e,$ffff		;ff7972
Lff7976:									;ff7976
	move.b	(a3),d5					;$1a13			;ff7976
	and.b	d4,d5					;$ca04			;ff7978
	or.b	d5,d3					;$8605			;ff797a
	move.b	d3,(a3)					;$1683			;ff797c
Lff797e:									;ff797e
	move.w	($0940),d1				;$3238,$0940		;ff797e
	lea.l	(a0,d1.w),a0				;$41f0,$1000		;ff7982
	subq.w	#1,(-$0014,a6)				;$536e,$ffec		;ff7986
	bne.w	Lff7824					;$6600,$fe98		;ff798a
Lff798e:									;ff798e
	movem.l	(a7)+,d0-d7/a0-a3			;$4cdf,$0fff		;ff798e
	unlk	a6					;$4e5e			;ff7992
	rts						;$4e75			;ff7994

Call_SCROLL:									;ff7996
	cmp.w	#$0008,d1				;$b27c,$0008		;ff7996
	bcc.s	Lff79b6					;$641a			;ff799a
	move.w	d1,d0					;$3001			;ff799c
	and.l	#$00000003,d0				;$c0bc,$0000,$0003	;ff799e
	asl.w	#2,d0					;$e540			;ff79a4
	lea.l	($00e80018),a0				;$41f9,$00e8,$0018	;ff79a6
	adda.l	d0,a0					;$d1c0			;ff79ac
	cmp.w	#$0004,d1				;$b27c,$0004		;ff79ae
	bcc.s	Lff79c6					;$6412			;ff79b2
	bra.s	Lff79be					;$6008			;ff79b4
Lff79b6:									;ff79b6
	lea.l	($00e80014),a0				;$41f9,$00e8,$0014	;ff79b6
	bne.s	Lff79c6					;$6608			;ff79bc
Lff79be:									;ff79be
	bsr.s	Lff79c6					;$6106			;ff79be
	move.w	d3,(a0)					;$3083			;ff79c0
	move.w	d2,-(a0)				;$3102			;ff79c2
	rts						;$4e75			;ff79c4

Lff79c6:									;ff79c6
	move.w	(a0)+,d0				;$3018			;ff79c6
	swap.w	d0					;$4840			;ff79c8
	move.w	(a0),d0					;$3010			;ff79ca
	rts						;$4e75			;ff79cc

Call_B_CURON:									;ff79ce
	tst.b	($0993)					;$4a38,$0993		;ff79ce
	bne.s	Lff7a08					;$6634			;ff79d2
	tst.b	($0992)					;$4a38,$0992		;ff79d4
	bne.s	Lff7a08					;$662e			;ff79d8
	move.w	#$0005,($09bc)				;$31fc,$0005,$09bc	;ff79da
	st.b	($0992)					;$50f8,$0992		;ff79e0
	clr.b	($0991)					;$4238,$0991		;ff79e4
	rts						;$4e75			;ff79e8

Call_B_CUROFF:									;ff79ea
	tst.b	($0993)					;$4a38,$0993		;ff79ea
	bne.s	Lff7a08					;$6618			;ff79ee
	move.w	#$0005,($09bc)				;$31fc,$0005,$09bc	;ff79f0
	clr.b	($0992)					;$4238,$0992		;ff79f6
	tst.b	($0991)					;$4a38,$0991		;ff79fa
	beq.s	Lff7a08					;$6708			;ff79fe
	bsr.w	Lff1db0					;$6100,$a3ae		;ff7a00
	clr.b	($0991)					;$4238,$0991		;ff7a04
Lff7a08:									;ff7a08
	rts						;$4e75			;ff7a08

Lff7a0a:									;ff7a0a
	clr.l	d0					;$4280			;ff7a0a
	move.w	($0926),d0				;$3038,$0926		;ff7a0c
	rts						;$4e75			;ff7a10

Call_SET232C:									;ff7a12
	cmp.w	#$ffff,d1				;$b27c,$ffff		;ff7a12
	beq.s	Lff7a0a					;$67f2			;ff7a16
	move.w	d1,-(a7)				;$3f01			;ff7a18
	clr.w	d0					;$4240			;ff7a1a
	move.b	d1,d0					;$1001			;ff7a1c
	cmp.b	#$09,d0					;$b03c,$0009		;ff7a1e
	bcs.s	Lff7a28					;$6504			;ff7a22
	move.w	#$0004,d0				;$303c,$0004		;ff7a24
Lff7a28:									;ff7a28
	add.w	d0,d0					;$d040			;ff7a28
	lea.l	(Lff7ae2,pc),a0				;$41fa,$00b6		;ff7a2a
	move.w	(a0,d0.w),d0				;$3030,$0000		;ff7a2e
	move.w	sr,-(a7)				;$40e7			;ff7a32
	ori.w	#$0700,sr				;$007c,$0700		;ff7a34
	lea.l	($00e98004),a0				;$41f9,$00e9,$8004	;ff7a38
	move.w	#$000e,(a0)				;$30bc,$000e		;ff7a3e
	move.w	#$0002,(a0)				;$30bc,$0002		;ff7a42
	move.w	#$000c,(a0)				;$30bc,$000c		;ff7a46
	move.w	d0,(a0)					;$3080			;ff7a4a
	ror.w	#8,d0					;$e058			;ff7a4c
	move.w	#$000d,(a0)				;$30bc,$000d		;ff7a4e
	move.w	d0,(a0)					;$3080			;ff7a52
	lsr.w	#8,d1					;$e049			;ff7a54
	move.w	d1,d0					;$3001			;ff7a56
	lsr.b	#4,d0					;$e808			;ff7a58
	cmp.b	#$04,d0					;$b03c,$0004		;ff7a5a
	bcc.s	Lff7a64					;$6404			;ff7a5e
	or.w	#$000c,d0				;$807c,$000c		;ff7a60
Lff7a64:									;ff7a64
	or.w	#$0040,d0				;$807c,$0040		;ff7a64
	move.w	#$0004,(a0)				;$30bc,$0004		;ff7a68
	move.w	d0,(a0)					;$3080			;ff7a6c
	clr.w	d0					;$4240			;ff7a6e
	move.b	d0,($0928)				;$11c0,$0928		;ff7a70
	move.b	d0,($0929)				;$11c0,$0929		;ff7a74
	lsr.w	#2,d1					;$e449			;ff7a78
	and.w	#$0003,d1				;$c27c,$0003		;ff7a7a
	move.w	d1,-(a7)				;$3f01			;ff7a7e
	move.w	#$ff1f,d0				;$303c,$ff1f		;ff7a80
	rol.w	d1,d0					;$e378			;ff7a84
	move.b	d0,($0cb5)				;$11c0,$0cb5		;ff7a86
	move.w	(a7)+,d1				;$321f			;ff7a8a
	beq.s	Lff7a98					;$670a			;ff7a8c
	cmp.w	#$0003,d1				;$b27c,$0003		;ff7a8e
	beq.s	Lff7a98					;$6704			;ff7a92
	eori.w	#$0003,d1				;$0a41,$0003		;ff7a94
Lff7a98:									;ff7a98
	asl.w	#5,d1					;$eb41			;ff7a98
	move.w	d1,d0					;$3001			;ff7a9a
	or.b	#$8a,d0					;$803c,$008a		;ff7a9c
	move.w	#$0005,(a0)				;$30bc,$0005		;ff7aa0
	move.w	d0,(a0)					;$3080			;ff7aa4
	asl.w	#1,d1					;$e341			;ff7aa6
	move.w	#$0003,(a0)				;$30bc,$0003		;ff7aa8
	move.w	d1,(a0)					;$3081			;ff7aac
	clr.w	($089c)					;$4278,$089c		;ff7aae
	move.l	#$000008a6,d0				;$203c,$0000,$08a6	;ff7ab2
	move.l	d0,($089e)				;$21c0,$089e		;ff7ab8
	move.l	d0,($08a2)				;$21c0,$08a2		;ff7abc
	or.b	#$01,d1					;$823c,$0001		;ff7ac0
	move.w	#$0003,(a0)				;$30bc,$0003		;ff7ac4
	move.w	d1,(a0)					;$3081			;ff7ac8
	move.w	#$000e,(a0)				;$30bc,$000e		;ff7aca
	move.w	#$0003,(a0)				;$30bc,$0003		;ff7ace
	move.w	(a7)+,sr				;$46df			;ff7ad2
	move.w	(a7)+,d1				;$321f			;ff7ad4
	clr.l	d0					;$4280			;ff7ad6
	move.w	($0926),d0				;$3038,$0926		;ff7ad8
	move.w	d1,($0926)				;$31c1,$0926		;ff7adc
	rts						;$4e75			;ff7ae0

Lff7ae2:									;ff7ae2
	.dc.b	$08,$21,$04,$10,$02,$07,$01,$02					;ff7ae2
	.dc.b	$00,$80,$00,$3f,$00,$1f,$00,$0e					;ff7aea
	.dc.b	$00,$07								;ff7af2
Call_LOF232C:									;ff7af4
	move.w	($089c),d0				;$3038,$089c		;ff7af4
	rts						;$4e75			;ff7af8

Call_INP232C:									;ff7afa
	bsr.s	Call_ISNS232C				;$613e			;ff7afa
	swap.w	d0					;$4840			;ff7afc
	beq.s	Call_INP232C				;$67fa			;ff7afe
	clr.w	d0					;$4240			;ff7b00
	move.l	a0,($08a2)				;$21c8,$08a2		;ff7b02
	subq.w	#1,($089c)				;$5378,$089c		;ff7b06
	swap.w	d0					;$4840			;ff7b0a
	btst.b	#$01,($0926)				;$0838,$0001,$0926	;ff7b0c
	beq.s	Lff7b38					;$6724			;ff7b12
	btst.b	#$00,($0929)				;$0838,$0000,$0929	;ff7b14
	beq.s	Lff7b38					;$671c			;ff7b1a
	cmpi.w	#$0010,($089c)				;$0c78,$0010,$089c	;ff7b1c
	bcc.s	Lff7b38					;$6414			;ff7b22
	movem.l	d0-d1,-(a7)				;$48e7,$c000		;ff7b24
	bclr.b	#$00,($0929)				;$08b8,$0000,$0929	;ff7b28
	moveq.l	#$11,d1					;$7211			;ff7b2e
	bsr.w	Lff7be4					;$6100,$00b2		;ff7b30
	movem.l	(a7)+,d0-d1				;$4cdf,$0003		;ff7b34
Lff7b38:									;ff7b38
	rts						;$4e75			;ff7b38

Call_ISNS232C:									;ff7b3a
	clr.l	d0					;$4280			;ff7b3a
	tst.w	($089c)					;$4a78,$089c		;ff7b3c
	beq.s	Lff7b5c					;$671a			;ff7b40
	movea.l	($08a2),a0				;$2078,$08a2		;ff7b42
	addq.l	#2,a0					;$5488			;ff7b46
	cmpa.l	#$00000926,a0				;$b1fc,$0000,$0926	;ff7b48
	bcs.s	Lff7b56					;$6506			;ff7b4e
	movea.l	#$000008a6,a0				;$207c,$0000,$08a6	;ff7b50
Lff7b56:									;ff7b56
	moveq.l	#$01,d0					;$7001			;ff7b56
	swap.w	d0					;$4840			;ff7b58
	move.w	(a0),d0					;$3010			;ff7b5a
Lff7b5c:									;ff7b5c
	rts						;$4e75			;ff7b5c

Call_OSNS232C:									;ff7b5e
	clr.l	d0					;$4280			;ff7b5e
	btst.b	#$01,($0926)				;$0838,$0001,$0926	;ff7b60
	beq.s	Lff7b70					;$6708			;ff7b66
	btst.b	#$01,($0929)				;$0838,$0001,$0929	;ff7b68
	bne.s	Lff7b80					;$6610			;ff7b6e
Lff7b70:									;ff7b70
	lea.l	($00e98004),a0				;$41f9,$00e9,$8004	;ff7b70
	move.w	#$0000,(a0)				;$30bc,$0000		;ff7b76
	move.w	(a0),d0					;$3010			;ff7b7a
	and.w	#$0004,d0				;$c07c,$0004		;ff7b7c
Lff7b80:									;ff7b80
	rts						;$4e75			;ff7b80

Call_OUT232C:									;ff7b82
	btst.b	#$01,($0926)				;$0838,$0001,$0926	;ff7b82
	beq.s	Lff7b92					;$6708			;ff7b88
	btst.b	#$01,($0929)				;$0838,$0001,$0929	;ff7b8a
	bne.s	Call_OUT232C				;$66f0			;ff7b90
Lff7b92:									;ff7b92
	btst.b	#$00,($0926)				;$0838,$0000,$0926	;ff7b92
	beq.s	Lff7be4					;$674a			;ff7b98
	cmp.b	#$0f,d1					;$b23c,$000f		;ff7b9a
	beq.s	Lff7bcc					;$672c			;ff7b9e
	cmp.b	#$0e,d1					;$b23c,$000e		;ff7ba0
	beq.s	Lff7bcc					;$6726			;ff7ba4
	btst.l	#$07,d1					;$0801,$0007		;ff7ba6
	beq.s	Lff7bce					;$6722			;ff7baa
	move.w	d1,-(a7)				;$3f01			;ff7bac
	and.b	#$7f,d1					;$c23c,$007f		;ff7bae
	btst.b	#$01,($0928)				;$0838,$0001,$0928	;ff7bb2
	bne.s	Lff7bc8					;$660e			;ff7bb8
	bset.b	#$01,($0928)				;$08f8,$0001,$0928	;ff7bba
	move.l	d1,-(a7)				;$2f01			;ff7bc0
	moveq.l	#$0f,d1					;$720f			;ff7bc2
	bsr.s	Lff7be4					;$611e			;ff7bc4
	move.l	(a7)+,d1				;$221f			;ff7bc6
Lff7bc8:									;ff7bc8
	bsr.s	Lff7be4					;$611a			;ff7bc8
	move.w	(a7)+,d1				;$321f			;ff7bca
Lff7bcc:									;ff7bcc
	rts						;$4e75			;ff7bcc

Lff7bce:									;ff7bce
	btst.b	#$01,($0928)				;$0838,$0001,$0928	;ff7bce
	beq.s	Lff7be4					;$670e			;ff7bd4
	move.l	d1,-(a7)				;$2f01			;ff7bd6
	bclr.b	#$01,($0928)				;$08b8,$0001,$0928	;ff7bd8
	moveq.l	#$0e,d1					;$720e			;ff7bde
	bsr.s	Lff7be4					;$6102			;ff7be0
	move.l	(a7)+,d1				;$221f			;ff7be2
Lff7be4:									;ff7be4
	bsr.s	Lff7b70					;$618a			;ff7be4
	beq.s	Lff7be4					;$67fc			;ff7be6
	move.w	d1,($00e98006)				;$33c1,$00e9,$8006	;ff7be8
	rts						;$4e75			;ff7bee

Call_Unknown_36:								;ff7bf0
	tst.l	d1					;$4a81			;ff7bf0
	beq.s	Lff7c02					;$670e			;ff7bf2
	move.l	d1,($0938)				;$21c1,$0938		;ff7bf4
	move.w	d2,($09b2)				;$31c2,$09b2		;ff7bf8
	move.w	d2,($09b4)				;$31c2,$09b4		;ff7bfc
	rts						;$4e75			;ff7c00

Lff7c02:									;ff7c02
	move.l	#Lffaa08,($0938)			;$21fc,$00ff,$aa08,$0938	;ff7c02
	move.w	#$0001,($09b2)				;$31fc,$0001,$09b2	;ff7c0a
	move.w	#$0001,($09b4)				;$31fc,$0001,$09b4	;ff7c10
	rts						;$4e75			;ff7c16

Call_Unknown_37:								;ff7c18
	lea.l	($097e),a0				;$41f8,$097e		;ff7c18
	move.l	(a0),d0					;$2010			;ff7c1c
	tst.l	d1					;$4a81			;ff7c1e
	beq.s	Lff7c26					;$6704			;ff7c20
	move.l	d1,(a0)					;$2081			;ff7c22
	rts						;$4e75			;ff7c24

Lff7c26:									;ff7c26
	pea.l	(Lff15be,pc)				;$487a,$9996		;ff7c26
	move.l	(a7)+,(a0)				;$209f			;ff7c2a
	rts						;$4e75			;ff7c2c

Call_SETFNTADR:									;ff7c2e
	moveq.l	#$ff,d0					;$70ff			;ff7c2e
	cmp.l	#$00000006,d2				;$b4bc,$0000,$0006	;ff7c30
	bcc.s	Lff7c46					;$640e			;ff7c36
	move.l	d2,d0					;$2002			;ff7c38
	asl.l	#2,d0					;$e580			;ff7c3a
	lea.l	($099a),a0				;$41f8,$099a		;ff7c3c
	adda.l	d0,a0					;$d1c0			;ff7c40
	move.l	(a0),d0					;$2010			;ff7c42
	move.l	d1,(a0)					;$2081			;ff7c44
Lff7c46:									;ff7c46
	rts						;$4e75			;ff7c46

Call_Unknown_39:								;ff7c48
	lea.l	($0978),a0				;$41f8,$0978		;ff7c48
	move.l	(a0),d0					;$2010			;ff7c4c
	move.l	d1,(a0)+				;$20c1			;ff7c4e
	move.l	d0,d1					;$2200			;ff7c50
	move.w	(a0),d0					;$3010			;ff7c52
	move.w	d2,(a0)+				;$30c2			;ff7c54
	move.w	d0,d2					;$3400			;ff7c56
	clr.l	d0					;$4280			;ff7c58
	rts						;$4e75			;ff7c5a

Call_Unknown_3a:								;ff7c5c
	move.l	a1,d0					;$2009			;ff7c5c
	bne.s	Lff7c66					;$6606			;ff7c5e
	lea.l	(Lff15d6),a1				;$43f9,$00ff,$15d6	;ff7c60
Lff7c66:									;ff7c66
	move.l	#$00000061.l,d0				;$203c,$0000,$0061	;ff7c66
	lea.l	($0a16),a0				;$41f8,$0a16		;ff7c6c
Lff7c70:									;ff7c70
	move.b	(a1)+,(a0)+				;$10d9			;ff7c70
	dbra.w	d0,Lff7c70				;$51c8,$fffc		;ff7c72
	rts						;$4e75			;ff7c76

Call_JOYGET:									;ff7c78
	clr.l	d0					;$4280			;ff7c78
	cmp.w	#$0002,d1				;$b27c,$0002		;ff7c7a
	bcc.s	Lff7c8e					;$640e			;ff7c7e
	move.w	d1,d0					;$3001			;ff7c80
	add.w	d0,d0					;$d040			;ff7c82
	lea.l	($00e9a001),a0				;$41f9,$00e9,$a001	;ff7c84
	move.b	(a0,d0.w),d0				;$1030,$0000		;ff7c8a
Lff7c8e:									;ff7c8e
	rts						;$4e75			;ff7c8e

Call_INIT_PRN:									;ff7c90
	move.b	#$01,($00e8c003)			;$13fc,$0001,$00e8,$c003	;ff7c90
	clr.l	($0a10)					;$42b8,$0a10		;ff7c98
	clr.w	($0a14)					;$4278,$0a14		;ff7c9c
	move.w	d1,($0a78)				;$31c1,$0a78		;ff7ca0
Call_SNSPRN:									;ff7ca4
	move.b	($00e9c001),d0				;$1039,$00e9,$c001	;ff7ca4
	and.l	#$00000020,d0				;$c0bc,$0000,$0020	;ff7caa
	rts						;$4e75			;ff7cb0

Call_OUTLPT:									;ff7cb2
	move.l	($00ed003c),d0				;$2039,$00ed,$003c	;ff7cb2
	cmp.l	#$00010000,d0				;$b0bc,$0001,$0000	;ff7cb8
	bcc.s	Lff7d1a					;$645a			;ff7cbe
Lff7cc0:									;ff7cc0
	btst.b	#$05,($00e9c001)			;$0839,$0005,$00e9,$c001	;ff7cc0
	bne.s	Lff7cf2					;$6628			;ff7cc8
	tst.b	($0a10)					;$4a38,$0a10		;ff7cca
	bne.s	Lff7cf0					;$6620			;ff7cce
	subq.l	#1,d0					;$5380			;ff7cd0
	bne.s	Lff7cc0					;$66ec			;ff7cd2
Lff7cd4:									;ff7cd4
	movem.l	d1-d7/a0-a6,-(a7)			;$48e7,$7ffe		;ff7cd4
	move.w	#$7009,d7				;$3e3c,$7009		;ff7cd8
	trap	#14					;$4e4e			;ff7cdc
	move.w	d7,d0					;$3007			;ff7cde
	movem.l	(a7)+,d1-d7/a0-a6			;$4cdf,$7ffe		;ff7ce0
	cmp.b	#$02,d0					;$b03c,$0002		;ff7ce4
	bne.s	Call_OUTLPT				;$66c8			;ff7ce8
	move.b	#$01,($0a10)				;$11fc,$0001,$0a10	;ff7cea
Lff7cf0:									;ff7cf0
	rts						;$4e75			;ff7cf0

Lff7cf2:									;ff7cf2
	move.b	d1,($00e8c001)				;$13c1,$00e8,$c001	;ff7cf2
	clr.b	($0a10)					;$4238,$0a10		;ff7cf8
	lea.l	($00e9a001),a0				;$41f9,$00e9,$a001	;ff7cfc
	tst.b	(a0)					;$4a10			;ff7d02
	tst.b	(a0)					;$4a10			;ff7d04
	clr.b	($00e8c003)				;$4239,$00e8,$c003	;ff7d06
	tst.b	(a0)					;$4a10			;ff7d0c
	tst.b	(a0)					;$4a10			;ff7d0e
	move.b	#$01,($00e8c003)			;$13fc,$0001,$00e8,$c003	;ff7d10
	rts						;$4e75			;ff7d18

Lff7d1a:									;ff7d1a
	tst.b	($0a10)					;$4a38,$0a10		;ff7d1a
	bne.s	Lff7cf0					;$66d0			;ff7d1e
	exg.l	d0,a0					;$c188			;ff7d20
	move.l	#$000003e8,d0				;$203c,$0000,$03e8	;ff7d22
	bsr.s	Lff7d3a					;$6110			;ff7d28
	tst.l	d0					;$4a80			;ff7d2a
	beq.s	Lff7cf2					;$67c4			;ff7d2c
	exg.l	d0,a0					;$c188			;ff7d2e
	sub.l	#$0000147b,d0				;$90bc,$0000,$147b	;ff7d30
	bcs.s	Lff7cd4					;$659c			;ff7d36
	bra.s	Lff7d1a					;$60e0			;ff7d38
Lff7d3a:									;ff7d3a
	movem.l	d1-d2/a0,-(a7)				;$48e7,$6080		;ff7d3a
	lea.l	($00e88023),a0				;$41f9,$00e8,$8023	;ff7d3e
	moveq.l	#$00,d1					;$7200			;ff7d44
	move.b	(a0),d1					;$1210			;ff7d46
	move.b	(a0),d1					;$1210			;ff7d48
Lff7d4a:									;ff7d4a
	btst.b	#$05,($00e9c001)			;$0839,$0005,$00e9,$c001	;ff7d4a
	bne.s	Lff7d72					;$661e			;ff7d52
	moveq.l	#$00,d2					;$7400			;ff7d54
	move.b	(a0),d2					;$1410			;ff7d56
	cmp.b	(a0),d2					;$b410			;ff7d58
	bcs.s	Lff7d4a					;$65ee			;ff7d5a
	sub.w	d2,d1					;$9242			;ff7d5c
	bcc.s	Lff7d64					;$6404			;ff7d5e
	add.w	#$00c8,d1				;$d27c,$00c8		;ff7d60
Lff7d64:									;ff7d64
	exg.l	d1,d2					;$c342			;ff7d64
	sub.l	d2,d0					;$9082			;ff7d66
	bhi.s	Lff7d4a					;$62e0			;ff7d68
	moveq.l	#$ff,d0					;$70ff			;ff7d6a
Lff7d6c:									;ff7d6c
	movem.l	(a7)+,d1-d2/a0				;$4cdf,$0106		;ff7d6c
	rts						;$4e75			;ff7d70

Lff7d72:									;ff7d72
	moveq.l	#$00,d0					;$7000			;ff7d72
	bra.s	Lff7d6c					;$60f6			;ff7d74
Call_OUTPRN:									;ff7d76
	move.b	($0a12),d0				;$1038,$0a12		;ff7d76
	bne.s	Lff7dee					;$6672			;ff7d7a
	cmp.b	#$09,d1					;$b23c,$0009		;ff7d7c
	beq.w	Lff7eb6					;$6700,$0134		;ff7d80
	cmp.b	#$0a,d1					;$b23c,$000a		;ff7d84
	beq.w	Lff7e7e					;$6700,$00f4		;ff7d88
	cmp.b	#$0d,d1					;$b23c,$000d		;ff7d8c
	beq.w	Lff7ea6					;$6700,$0114		;ff7d90
	cmp.b	#$0c,d1					;$b23c,$000c		;ff7d94
	beq.w	Lff7e94					;$6700,$00fa		;ff7d98
	cmp.b	#$1a,d1					;$b23c,$001a		;ff7d9c
	beq.w	Lff7ec2					;$6700,$0120		;ff7da0
	cmp.b	#$20,d1					;$b23c,$0020		;ff7da4
	bcs.s	Lff7de0					;$6536			;ff7da8
	cmp.b	#$80,d1					;$b23c,$0080		;ff7daa
	bcs.w	Lff7f0a					;$6500,$015a		;ff7dae
	cmp.b	#$a0,d1					;$b23c,$00a0		;ff7db2
	bcs.s	Lff7dc0					;$6508			;ff7db6
	cmp.b	#$e0,d1					;$b23c,$00e0		;ff7db8
	bcs.w	Lff7f0a					;$6500,$014c		;ff7dbc
Lff7dc0:									;ff7dc0
	move.b	d1,($0a12)				;$11c1,$0a12		;ff7dc0
	rts						;$4e75			;ff7dc4

Lff7dc6:									;ff7dc6
	move.b	($0a79),d0				;$1038,$0a79		;ff7dc6
	cmp.b	($0a15),d0				;$b038,$0a15		;ff7dca
	bcc.s	Lff7dd8					;$6408			;ff7dce
	move.w	d1,-(a7)				;$3f01			;ff7dd0
	bsr.w	Lff7ec2					;$6100,$00ee		;ff7dd2
	move.w	(a7)+,d1				;$321f			;ff7dd6
Lff7dd8:									;ff7dd8
	bsr.w	Lff7ed8					;$6100,$00fe		;ff7dd8
Lff7ddc:									;ff7ddc
	addq.w	#1,($0a14)				;$5278,$0a14		;ff7ddc
Lff7de0:									;ff7de0
	movem.l	d0-d1,-(a7)				;$48e7,$c000		;ff7de0
	IOCS	_OUTLPT					;$703e,$4e4f		;ff7de4
	movem.l	(a7)+,d0-d1				;$4cdf,$0003		;ff7de8
	rts						;$4e75			;ff7dec

Lff7dee:									;ff7dee
	clr.b	($0a12)					;$4238,$0a12		;ff7dee
	asl.w	#8,d0					;$e140			;ff7df2
	or.w	d0,d1					;$8240			;ff7df4
	cmp.w	#$8000,d0				;$b07c,$8000		;ff7df6
	beq.w	Lff7f14					;$6700,$0118		;ff7dfa
	cmp.w	#$f000,d0				;$b07c,$f000		;ff7dfe
	bcc.w	Lff7f14					;$6400,$0110		;ff7e02
	cmpi.b	#-$01,($0a79)				;$0c38,$ffff,$0a79	;ff7e06
	beq.s	Lff7e24					;$6716			;ff7e0c
	move.w	($0a14),d0				;$3038,$0a14		;ff7e0e
	addq.w	#1,d0					;$5240			;ff7e12
	cmp.b	($0a79),d0				;$b038,$0a79		;ff7e14
	bcs.s	Lff7e24					;$650a			;ff7e18
	beq.s	Lff7e24					;$6708			;ff7e1a
	move.w	d1,-(a7)				;$3f01			;ff7e1c
	bsr.w	Lff7ec2					;$6100,$00a2		;ff7e1e
	move.w	(a7)+,d1				;$321f			;ff7e22
Lff7e24:									;ff7e24
	bsr.w	Call_SFTJIS				;$6100,$3e44		;ff7e24
	cmp.w	#$7600,d1				;$b27c,$7600		;ff7e28
	bcc.s	Lff7e64					;$6436			;ff7e2c
	cmp.w	#$5000,d1				;$b27c,$5000		;ff7e2e
	bcc.s	Lff7e58					;$6424			;ff7e32
	cmp.w	#$2e00,d1				;$b27c,$2e00		;ff7e34
	bcc.s	Lff7e4c					;$6412			;ff7e38
	cmp.w	#$2c00,d1				;$b27c,$2c00		;ff7e3a
	bcs.s	Lff7e4c					;$650c			;ff7e3e
	btst.b	#$01,($0a77)				;$0838,$0001,$0a77	;ff7e40
	bne.w	Lff7f6a					;$6600,$0122		;ff7e46
	bra.s	Lff7e6e					;$6022			;ff7e4a
Lff7e4c:									;ff7e4c
	btst.b	#$03,($0a77)				;$0838,$0003,$0a77	;ff7e4c
	bne.w	Lff7f6a					;$6600,$0116		;ff7e52
	bra.s	Lff7e6e					;$6016			;ff7e56
Lff7e58:									;ff7e58
	btst.b	#$02,($0a77)				;$0838,$0002,$0a77	;ff7e58
	bne.w	Lff7f6a					;$6600,$010a		;ff7e5e
	bra.s	Lff7e6e					;$600a			;ff7e62
Lff7e64:									;ff7e64
	btst.b	#$00,($0a77)				;$0838,$0000,$0a77	;ff7e64
	bne.w	Lff7f6a					;$6600,$00fe		;ff7e6a
Lff7e6e:									;ff7e6e
	bsr.s	Lff7eec					;$617c			;ff7e6e
	move.w	d1,-(a7)				;$3f01			;ff7e70
	lsr.w	#8,d1					;$e049			;ff7e72
	bsr.w	Lff7ddc					;$6100,$ff66		;ff7e74
	move.w	(a7)+,d1				;$321f			;ff7e78
	bra.w	Lff7ddc					;$6000,$ff60		;ff7e7a
Lff7e7e:									;ff7e7e
	bsr.s	Lff7ed8					;$6158			;ff7e7e
	bsr.w	Lff8132					;$6100,$02b0		;ff7e80
	addq.b	#1,($0a13)				;$5238,$0a13		;ff7e84
	move.b	($0a78),d0				;$1038,$0a78		;ff7e88
	cmp.b	($0a13),d0				;$b038,$0a13		;ff7e8c
	bcs.s	Lff7e98					;$6506			;ff7e90
	rts						;$4e75			;ff7e92

Lff7e94:									;ff7e94
	clr.w	($0a14)					;$4278,$0a14		;ff7e94
Lff7e98:									;ff7e98
	clr.b	($0a13)					;$4238,$0a13		;ff7e98
	move.w	#$000c,d1				;$323c,$000c		;ff7e9c
	bsr.w	Lff7de0					;$6100,$ff3e		;ff7ea0
	rts						;$4e75			;ff7ea4

Lff7ea6:									;ff7ea6
	move.w	#$000d,d1				;$323c,$000d		;ff7ea6
	bsr.s	Lff7ed8					;$612c			;ff7eaa
	bsr.w	Lff7de0					;$6100,$ff32		;ff7eac
	clr.w	($0a14)					;$4278,$0a14		;ff7eb0
	rts						;$4e75			;ff7eb4

Lff7eb6:									;ff7eb6
	bsr.s	Lff7ed8					;$6120			;ff7eb6
Lff7eb8:									;ff7eb8
	move.b	($0a79),d0				;$1038,$0a79		;ff7eb8
	cmp.b	($0a15),d0				;$b038,$0a15		;ff7ebc
	bcc.s	Lff7ec6					;$6404			;ff7ec0
Lff7ec2:									;ff7ec2
	bsr.s	Lff7ea6					;$61e2			;ff7ec2
	bra.s	Lff7e7e					;$60b8			;ff7ec4
Lff7ec6:									;ff7ec6
	moveq.l	#$20,d1					;$7220			;ff7ec6
	bsr.w	Lff7ddc					;$6100,$ff12		;ff7ec8
	move.w	($0a14),d0				;$3038,$0a14		;ff7ecc
	and.w	#$0007,d0				;$c07c,$0007		;ff7ed0
	bne.s	Lff7eb8					;$66e2			;ff7ed4
	rts						;$4e75			;ff7ed6

Lff7ed8:									;ff7ed8
	tst.b	($0a11)					;$4a38,$0a11		;ff7ed8
	beq.s	Lff7f08					;$672a			;ff7edc
	clr.b	($0a11)					;$4238,$0a11		;ff7ede
	movem.l	d0-d1/a0,-(a7)				;$48e7,$c080		;ff7ee2
	lea.l	($0a30),a0				;$41f8,$0a30		;ff7ee6
	bra.s	Lff7f00					;$6014			;ff7eea
Lff7eec:									;ff7eec
	tst.b	($0a11)					;$4a38,$0a11		;ff7eec
	bne.s	Lff7f08					;$6616			;ff7ef0
	move.b	#$01,($0a11)				;$11fc,$0001,$0a11	;ff7ef2
	movem.l	d0-d1/a0,-(a7)				;$48e7,$c080		;ff7ef8
	lea.l	($0a28),a0				;$41f8,$0a28		;ff7efc
Lff7f00:									;ff7f00
	bsr.w	Lff811c					;$6100,$021a		;ff7f00
	movem.l	(a7)+,d0-d1/a0				;$4cdf,$0103		;ff7f04
Lff7f08:									;ff7f08
	rts						;$4e75			;ff7f08

Lff7f0a:									;ff7f0a
	btst.b	#$04,($0a77)				;$0838,$0004,$0a77	;ff7f0a
	beq.w	Lff7dc6					;$6700,$feb4		;ff7f10
Lff7f14:									;ff7f14
	move.b	($0a79),d0				;$1038,$0a79		;ff7f14
	cmp.b	($0a15),d0				;$b038,$0a15		;ff7f18
	bcc.s	Lff7f24					;$6406			;ff7f1c
	move.w	d1,-(a7)				;$3f01			;ff7f1e
	bsr.s	Lff7ec2					;$61a0			;ff7f20
	move.w	(a7)+,d1				;$321f			;ff7f22
Lff7f24:									;ff7f24
	movem.l	d1-d3/a1-a2,-(a7)			;$48e7,$7060		;ff7f24
	moveq.l	#$0c,d2					;$740c			;ff7f28
	movea.l	($0458),a1				;$2278,$0458		;ff7f2a
	jsr	(a1)					;$4e91			;ff7f2e
	movea.l	d0,a1					;$2240			;ff7f30
	lea.l	(-$0060,a7),a7				;$4fef,$ffa0		;ff7f32
	movea.l	a7,a2					;$244f			;ff7f36
Lff7f38:									;ff7f38
	move.b	(a1)+,(a2)+				;$14d9			;ff7f38
	move.b	(a1)+,(a2)+				;$14d9			;ff7f3a
	clr.w	(a2)+					;$425a			;ff7f3c
	dbra.w	d2,Lff7f38				;$51ca,$fff8		;ff7f3e
	lea.l	($0a64),a0				;$41f8,$0a64		;ff7f42
	bsr.w	Lff811c					;$6100,$01d4		;ff7f46
	move.b	($0a75),d0				;$1038,$0a75		;ff7f4a
	bsr.s	Lff7fb2					;$6162			;ff7f4e
	moveq.l	#$0b,d2					;$740b			;ff7f50
	movea.l	a7,a2					;$244f			;ff7f52
	bsr.s	Lff7fcc					;$6176			;ff7f54
	move.b	($0a75),d0				;$1038,$0a75		;ff7f56
	bsr.s	Lff7fb2					;$6156			;ff7f5a
	addq.w	#1,($0a14)				;$5278,$0a14		;ff7f5c
	lea.l	($0060,a7),a7				;$4fef,$0060		;ff7f60
	movem.l	(a7)+,d1-d3/a1-a2			;$4cdf,$060e		;ff7f64
	rts						;$4e75			;ff7f68

Lff7f6a:									;ff7f6a
	movem.l	d1-d3/a1-a2,-(a7)			;$48e7,$7060		;ff7f6a
	moveq.l	#$0c,d2					;$740c			;ff7f6e
	movea.l	($0458),a1				;$2278,$0458		;ff7f70
	jsr	(a1)					;$4e91			;ff7f74
	movea.l	d0,a1					;$2240			;ff7f76
	lea.l	(-$0060,a7),a7				;$4fef,$ffa0		;ff7f78
	movea.l	a7,a2					;$244f			;ff7f7c
Lff7f7e:									;ff7f7e
	move.b	(a1)+,(a2)+				;$14d9			;ff7f7e
	move.b	(a1)+,(a2)+				;$14d9			;ff7f80
	move.b	(a1)+,(a2)+				;$14d9			;ff7f82
	clr.b	(a2)+					;$421a			;ff7f84
	dbra.w	d2,Lff7f7e				;$51ca,$fff6		;ff7f86
	lea.l	($0a6c),a0				;$41f8,$0a6c		;ff7f8a
	bsr.w	Lff811c					;$6100,$018c		;ff7f8e
	move.b	($0a76),d0				;$1038,$0a76		;ff7f92
	bsr.s	Lff7fb2					;$611a			;ff7f96
	moveq.l	#$17,d2					;$7417			;ff7f98
	movea.l	a7,a2					;$244f			;ff7f9a
	bsr.s	Lff7fcc					;$612e			;ff7f9c
	move.b	($0a76),d0				;$1038,$0a76		;ff7f9e
	bsr.s	Lff7fb2					;$610e			;ff7fa2
	addq.w	#2,($0a14)				;$5478,$0a14		;ff7fa4
	lea.l	($0060,a7),a7				;$4fef,$0060		;ff7fa8
	movem.l	(a7)+,d1-d3/a1-a2			;$4cdf,$060e		;ff7fac
	rts						;$4e75			;ff7fb0

Lff7fb2:									;ff7fb2
	and.w	#$00ff,d0				;$c07c,$00ff		;ff7fb2
	beq.s	Lff7fca					;$6712			;ff7fb6
	move.w	d0,d1					;$3200			;ff7fb8
	add.w	d0,d0					;$d040			;ff7fba
	add.w	d1,d0					;$d041			;ff7fbc
	subq.w	#1,d0					;$5340			;ff7fbe
	clr.l	d1					;$4281			;ff7fc0
Lff7fc2:									;ff7fc2
	bsr.w	Lff7de0					;$6100,$fe1c		;ff7fc2
	dbra.w	d0,Lff7fc2				;$51c8,$fffa		;ff7fc6
Lff7fca:									;ff7fca
	rts						;$4e75			;ff7fca

Lff7fcc:									;ff7fcc
	tst.b	($0a74)					;$4a38,$0a74		;ff7fcc
	bne.s	Lff7fee					;$661c			;ff7fd0
Lff7fd2:									;ff7fd2
	movea.l	a2,a1					;$224a			;ff7fd2
	moveq.l	#$17,d0					;$7017			;ff7fd4
	clr.l	d1					;$4281			;ff7fd6
Lff7fd8:									;ff7fd8
	move.l	(a1),d3					;$2611			;ff7fd8
	asl.l	#1,d3					;$e383			;ff7fda
	roxl.l	#1,d1					;$e391			;ff7fdc
	move.l	d3,(a1)+				;$22c3			;ff7fde
	dbra.w	d0,Lff7fd8				;$51c8,$fff6		;ff7fe0
	bsr.w	Lff8272					;$6100,$028c		;ff7fe4
	dbra.w	d2,Lff7fd2				;$51ca,$ffe8		;ff7fe8
	rts						;$4e75			;ff7fec

Lff7fee:									;ff7fee
	movea.l	a2,a1					;$224a			;ff7fee
	moveq.l	#$17,d0					;$7017			;ff7ff0
	clr.l	d1					;$4281			;ff7ff2
Lff7ff4:									;ff7ff4
	move.l	(a1),d3					;$2611			;ff7ff4
	asl.l	#1,d3					;$e383			;ff7ff6
	roxr.l	#1,d1					;$e291			;ff7ff8
	move.l	d3,(a1)+				;$22c3			;ff7ffa
	dbra.w	d0,Lff7ff4				;$51c8,$fff6		;ff7ffc
	ror.w	#8,d1					;$e059			;ff8000
	swap.w	d1					;$4841			;ff8002
	ror.w	#8,d1					;$e059			;ff8004
	bsr.w	Lff8272					;$6100,$026a		;ff8006
	dbra.w	d2,Lff7fee				;$51ca,$ffe2		;ff800a
	rts						;$4e75			;ff800e

Lff8010:									;ff8010
	movem.l	d0-d7/a0-a2,-(a7)			;$48e7,$ffe0		;ff8010
	and.w	#$000f,d0				;$c07c,$000f		;ff8014
	move.l	d0,d7					;$2e00			;ff8018
	bsr.w	Lff7ea6					;$6100,$fe8a		;ff801a
	bsr.s	Lff802a					;$610a			;ff801e
	clr.b	($0a13)					;$4238,$0a13		;ff8020
	movem.l	(a7)+,d0-d7/a0-a2			;$4cdf,$07ff		;ff8024
	rte						;$4e73			;ff8028

Lff802a:									;ff802a
	btst.l	#$03,d7					;$0807,$0003		;ff802a
	bne.w	Lff7e7e					;$6600,$fe4e		;ff802e
	btst.l	#$02,d7					;$0807,$0002		;ff8032
	bne.w	Lff7e94					;$6600,$fe5c		;ff8036
	move.w	($0a1a),d2				;$3438,$0a1a		;ff803a
	tst.b	d7					;$4a07			;ff803e
	bne.s	Lff8046					;$6604			;ff8040
	move.w	($0a20),d2				;$3438,$0a20		;ff8042
Lff8046:									;ff8046
	move.w	($0a26),d3				;$3638,$0a26		;ff8046
	movea.l	($0a16),a1				;$2278,$0a16		;ff804a
	lea.l	($0a3c),a0				;$41f8,$0a3c		;ff804e
	bsr.w	Lff811c					;$6100,$00c8		;ff8052
Lff8056:									;ff8056
	move.w	d3,d4					;$3803			;ff8056
	lea.l	($0a54),a0				;$41f8,$0a54		;ff8058
	tst.b	d7					;$4a07			;ff805c
	bne.s	Lff8064					;$6604			;ff805e
	lea.l	($0a5c),a0				;$41f8,$0a5c		;ff8060
Lff8064:									;ff8064
	bsr.w	Lff811c					;$6100,$00b6		;ff8064
	movea.l	a1,a0					;$2049			;ff8068
Lff806a:									;ff806a
	moveq.l	#$07,d5					;$7a07			;ff806a
Lff806c:									;ff806c
	movea.l	a0,a2					;$2448			;ff806c
	bsr.w	Lff813e					;$6100,$00ce		;ff806e
	bsr.w	Lff813e					;$6100,$00ca		;ff8072
	bsr.w	Lff813e					;$6100,$00c6		;ff8076
	bsr.w	Lff8272					;$6100,$01f6		;ff807a
	tst.b	d7					;$4a07			;ff807e
	beq.s	Lff8094					;$6712			;ff8080
	movea.l	a0,a2					;$2448			;ff8082
	bsr.w	Lff8204					;$6100,$017e		;ff8084
	bsr.w	Lff8204					;$6100,$017a		;ff8088
	bsr.w	Lff8204					;$6100,$0176		;ff808c
	bsr.w	Lff8272					;$6100,$01e0		;ff8090
Lff8094:									;ff8094
	dbra.w	d5,Lff806c				;$51cd,$ffd6		;ff8094
	addq.l	#1,a0					;$5288			;ff8098
	dbra.w	d4,Lff806a				;$51cc,$ffce		;ff809a
	bsr.w	Lff812c					;$6100,$008c		;ff809e
	adda.l	#$00000600,a1				;$d3fc,$0000,$0600	;ff80a2
	tst.b	d7					;$4a07			;ff80a8
	bne.s	Lff80b2					;$6606			;ff80aa
	adda.l	#$00000600,a1				;$d3fc,$0000,$0600	;ff80ac
Lff80b2:									;ff80b2
	dbra.w	d2,Lff8056				;$51ca,$ffa2		;ff80b2
	tst.b	d7					;$4a07			;ff80b6
	beq.s	Lff80ce					;$6714			;ff80b8
	move.l	($0a1c),d2				;$2438,$0a1c		;ff80ba
	beq.s	Lff8118					;$6758			;ff80be
	lea.l	($0a48),a0				;$41f8,$0a48		;ff80c0
	bsr.s	Lff811c					;$6156			;ff80c4
	move.w	d3,d4					;$3803			;ff80c6
	lea.l	($0a54),a0				;$41f8,$0a54		;ff80c8
	bra.s	Lff80e0					;$6012			;ff80cc
Lff80ce:									;ff80ce
	move.l	($0a22),d2				;$2438,$0a22		;ff80ce
	beq.s	Lff8118					;$6744			;ff80d2
	lea.l	($0a4e),a0				;$41f8,$0a4e		;ff80d4
	bsr.s	Lff811c					;$6142			;ff80d8
	move.w	d3,d4					;$3803			;ff80da
	lea.l	($0a5c),a0				;$41f8,$0a5c		;ff80dc
Lff80e0:									;ff80e0
	bsr.s	Lff811c					;$613a			;ff80e0
	movea.l	a1,a0					;$2049			;ff80e2
Lff80e4:									;ff80e4
	moveq.l	#$07,d5					;$7a07			;ff80e4
Lff80e6:									;ff80e6
	movea.l	a0,a2					;$2448			;ff80e6
	bsr.s	Lff813e					;$6154			;ff80e8
	bsr.s	Lff813e					;$6152			;ff80ea
	bsr.s	Lff813e					;$6150			;ff80ec
	and.l	d2,d1					;$c282			;ff80ee
	bsr.w	Lff8272					;$6100,$0180		;ff80f0
	tst.b	d7					;$4a07			;ff80f4
	beq.s	Lff810c					;$6714			;ff80f6
	movea.l	a0,a2					;$2448			;ff80f8
	bsr.w	Lff8204					;$6100,$0108		;ff80fa
	bsr.w	Lff8204					;$6100,$0104		;ff80fe
	bsr.w	Lff8204					;$6100,$0100		;ff8102
	and.l	d2,d1					;$c282			;ff8106
	bsr.w	Lff8272					;$6100,$0168		;ff8108
Lff810c:									;ff810c
	dbra.w	d5,Lff80e6				;$51cd,$ffd8		;ff810c
	addq.l	#1,a0					;$5288			;ff8110
	dbra.w	d4,Lff80e4				;$51cc,$ffd0		;ff8112
	bsr.s	Lff812c					;$6114			;ff8116
Lff8118:									;ff8118
	lea.l	($0a42),a0				;$41f8,$0a42		;ff8118
Lff811c:									;ff811c
	move.b	(a0)+,d0				;$1018			;ff811c
	beq.s	Lff812a					;$670a			;ff811e
Lff8120:									;ff8120
	move.b	(a0)+,d1				;$1218			;ff8120
	bsr.w	Lff7de0					;$6100,$fcbc		;ff8122
	subq.b	#1,d0					;$5300			;ff8126
	bne.s	Lff8120					;$66f6			;ff8128
Lff812a:									;ff812a
	rts						;$4e75			;ff812a

Lff812c:									;ff812c
	moveq.l	#$0d,d1					;$720d			;ff812c
	bsr.w	Lff7de0					;$6100,$fcb0		;ff812e
Lff8132:									;ff8132
	move.l	a0,-(a7)				;$2f08			;ff8132
	lea.l	($0a38),a0				;$41f8,$0a38		;ff8134
	bsr.s	Lff811c					;$61e2			;ff8138
	movea.l	(a7)+,a0				;$205f			;ff813a
	rts						;$4e75			;ff813c

Lff813e:									;ff813e
	tst.b	($0a74)					;$4a38,$0a74		;ff813e
	bne.s	Lff81a0					;$665c			;ff8142
	tst.b	d7					;$4a07			;ff8144
	beq.s	Lff8188					;$6740			;ff8146
	asl.l	#8,d1					;$e181			;ff8148
	moveq.l	#$03,d6					;$7c03			;ff814a
	btst.l	#$01,d7					;$0807,$0001		;ff814c
	beq.s	Lff8174					;$6722			;ff8150
	moveq.l	#$02,d0					;$7002			;ff8152
	swap.w	d0					;$4840			;ff8154
Lff8156:									;ff8156
	asl.b	#2,d1					;$e501			;ff8156
	btst.b	d5,(a2)					;$0b12			;ff8158
	beq.s	Lff815e					;$6702			;ff815a
	addq.b	#2,d1					;$5401			;ff815c
Lff815e:									;ff815e
	adda.l	d0,a2					;$d5c0			;ff815e
	btst.b	d5,(a2)					;$0b12			;ff8160
	beq.s	Lff8166					;$6702			;ff8162
	addq.b	#1,d1					;$5201			;ff8164
Lff8166:									;ff8166
	suba.l	d0,a2					;$95c0			;ff8166
	adda.l	#$00000080,a2				;$d5fc,$0000,$0080	;ff8168
	dbra.w	d6,Lff8156				;$51ce,$ffe6		;ff816e
	rts						;$4e75			;ff8172

Lff8174:									;ff8174
	asl.b	#2,d1					;$e501			;ff8174
	btst.b	d5,(a2)					;$0b12			;ff8176
	beq.s	Lff817c					;$6702			;ff8178
	addq.b	#3,d1					;$5601			;ff817a
Lff817c:									;ff817c
	adda.l	#$00000080,a2				;$d5fc,$0000,$0080	;ff817c
	dbra.w	d6,Lff8174				;$51ce,$fff0		;ff8182
	rts						;$4e75			;ff8186

Lff8188:									;ff8188
	asl.l	#8,d1					;$e181			;ff8188
	moveq.l	#$07,d6					;$7c07			;ff818a
Lff818c:									;ff818c
	asl.b	#1,d1					;$e301			;ff818c
	btst.b	d5,(a2)					;$0b12			;ff818e
	beq.s	Lff8194					;$6702			;ff8190
	addq.b	#1,d1					;$5201			;ff8192
Lff8194:									;ff8194
	adda.l	#$00000080,a2				;$d5fc,$0000,$0080	;ff8194
	dbra.w	d6,Lff818c				;$51ce,$fff0		;ff819a
	rts						;$4e75			;ff819e

Lff81a0:									;ff81a0
	tst.b	d7					;$4a07			;ff81a0
	beq.s	Lff81ea					;$6746			;ff81a2
	asl.l	#8,d1					;$e181			;ff81a4
	moveq.l	#$03,d6					;$7c03			;ff81a6
	btst.l	#$01,d7					;$0807,$0001		;ff81a8
	beq.s	Lff81d4					;$6726			;ff81ac
	moveq.l	#$02,d0					;$7002			;ff81ae
	swap.w	d0					;$4840			;ff81b0
Lff81b2:									;ff81b2
	lsr.b	#2,d1					;$e409			;ff81b2
	btst.b	d5,(a2)					;$0b12			;ff81b4
	beq.s	Lff81bc					;$6704			;ff81b6
	add.b	#$40,d1					;$d23c,$0040		;ff81b8
Lff81bc:									;ff81bc
	adda.l	d0,a2					;$d5c0			;ff81bc
	btst.b	d5,(a2)					;$0b12			;ff81be
	beq.s	Lff81c6					;$6704			;ff81c0
	add.b	#$80,d1					;$d23c,$0080		;ff81c2
Lff81c6:									;ff81c6
	suba.l	d0,a2					;$95c0			;ff81c6
	adda.l	#$00000080,a2				;$d5fc,$0000,$0080	;ff81c8
	dbra.w	d6,Lff81b2				;$51ce,$ffe2		;ff81ce
	rts						;$4e75			;ff81d2

Lff81d4:									;ff81d4
	lsr.b	#2,d1					;$e409			;ff81d4
	btst.b	d5,(a2)					;$0b12			;ff81d6
	beq.s	Lff81de					;$6704			;ff81d8
	add.b	#$c0,d1					;$d23c,$00c0		;ff81da
Lff81de:									;ff81de
	adda.l	#$00000080,a2				;$d5fc,$0000,$0080	;ff81de
	dbra.w	d6,Lff81d4				;$51ce,$ffee		;ff81e4
	rts						;$4e75			;ff81e8

Lff81ea:									;ff81ea
	asl.l	#8,d1					;$e181			;ff81ea
	moveq.l	#$07,d6					;$7c07			;ff81ec
Lff81ee:									;ff81ee
	lsr.b	#1,d1					;$e209			;ff81ee
	btst.b	d5,(a2)					;$0b12			;ff81f0
	beq.s	Lff81f8					;$6704			;ff81f2
	add.b	#$80,d1					;$d23c,$0080		;ff81f4
Lff81f8:									;ff81f8
	adda.l	#$00000080,a2				;$d5fc,$0000,$0080	;ff81f8
	dbra.w	d6,Lff81ee				;$51ce,$ffee		;ff81fe
	rts						;$4e75			;ff8202

Lff8204:									;ff8204
	tst.b	($0a74)					;$4a38,$0a74		;ff8204
	bne.s	Lff823e					;$6634			;ff8208
	tst.b	d7					;$4a07			;ff820a
	beq.w	Lff8188					;$6700,$ff7a		;ff820c
	asl.l	#8,d1					;$e181			;ff8210
	moveq.l	#$03,d6					;$7c03			;ff8212
	btst.l	#$01,d7					;$0807,$0001		;ff8214
	beq.w	Lff8174					;$6700,$ff5a		;ff8218
	moveq.l	#$02,d0					;$7002			;ff821c
	swap.w	d0					;$4840			;ff821e
Lff8220:									;ff8220
	asl.b	#2,d1					;$e501			;ff8220
	adda.l	d0,a2					;$d5c0			;ff8222
	btst.b	d5,(a2)					;$0b12			;ff8224
	suba.l	d0,a2					;$95c0			;ff8226
	beq.s	Lff8232					;$6708			;ff8228
	addq.b	#2,d1					;$5401			;ff822a
	btst.b	d5,(a2)					;$0b12			;ff822c
	beq.s	Lff8232					;$6702			;ff822e
	addq.b	#1,d1					;$5201			;ff8230
Lff8232:									;ff8232
	adda.l	#$00000080,a2				;$d5fc,$0000,$0080	;ff8232
	dbra.w	d6,Lff8220				;$51ce,$ffe6		;ff8238
	rts						;$4e75			;ff823c

Lff823e:									;ff823e
	tst.b	d7					;$4a07			;ff823e
	beq.s	Lff81ea					;$67a8			;ff8240
	asl.l	#8,d1					;$e181			;ff8242
	moveq.l	#$03,d6					;$7c03			;ff8244
	btst.l	#$01,d7					;$0807,$0001		;ff8246
	beq.s	Lff81d4					;$6788			;ff824a
	moveq.l	#$02,d0					;$7002			;ff824c
	swap.w	d0					;$4840			;ff824e
Lff8250:									;ff8250
	lsr.b	#2,d1					;$e409			;ff8250
	adda.l	d0,a2					;$d5c0			;ff8252
	btst.b	d5,(a2)					;$0b12			;ff8254
	suba.l	d0,a2					;$95c0			;ff8256
	beq.s	Lff8266					;$670c			;ff8258
	add.b	#$40,d1					;$d23c,$0040		;ff825a
	btst.b	d5,(a2)					;$0b12			;ff825e
	beq.s	Lff8266					;$6704			;ff8260
	add.b	#$80,d1					;$d23c,$0080		;ff8262
Lff8266:									;ff8266
	adda.l	#$00000080,a2				;$d5fc,$0000,$0080	;ff8266
	dbra.w	d6,Lff8250				;$51ce,$ffe2		;ff826c
	rts						;$4e75			;ff8270

Lff8272:									;ff8272
	swap.w	d1					;$4841			;ff8272
	bsr.w	Lff7de0					;$6100,$fb6a		;ff8274
	rol.l	#8,d1					;$e199			;ff8278
	bsr.w	Lff7de0					;$6100,$fb64		;ff827a
	rol.l	#8,d1					;$e199			;ff827e
	bra.w	Lff7de0					;$6000,$fb5e		;ff8280
Lff8284:									;ff8284
	move.l	d0,-(a7)				;$2f00			;ff8284
	cmpi.b	#$01,($0cbc)				;$0c38,$0001,$0cbc	;ff8286
	bls.s	Lff82a2					;$6314			;ff828c
	movec.l	cacr,d0					;$4e7a,$0002		;ff828e
	or.w	#$0808,d0				;$807c,$0808		;ff8292
	movec.l	d0,cacr					;$4e7b,$0002		;ff8296
	and.w	#$f7f7,d0				;$c07c,$f7f7		;ff829a
	movec.l	d0,cacr					;$4e7b,$0002		;ff829e
Lff82a2:									;ff82a2
	move.l	(a7)+,d0				;$201f			;ff82a2
	rts						;$4e75			;ff82a4

Call_ADPCMOUT:									;ff82a6
	lea.l	(Lff831a,pc),a0				;$41fa,$0072		;ff82a6
	bra.s	Lff82b0					;$6004			;ff82aa
Call_ADPCMINP:									;ff82ac
	lea.l	(Lff8300,pc),a0				;$41fa,$0052		;ff82ac
Lff82b0:									;ff82b0
	tst.b	($0c32)					;$4a38,$0c32		;ff82b0
	bne.s	Lff82b0					;$66fa			;ff82b4
	bsr.w	Lff83b2					;$6100,$00fa		;ff82b6
Lff82ba:									;ff82ba
	cmp.l	#$0000ff00,d2				;$b4bc,$0000,$ff00	;ff82ba
	bcs.s	Lff82de					;$651c			;ff82c0
	movem.l	d2/a0,-(a7)				;$48e7,$2080		;ff82c2
	move.l	#$0000ff00,d2				;$243c,$0000,$ff00	;ff82c6
	moveq.l	#$80,d0					;$7080			;ff82cc
	jsr	(a0)					;$4e90			;ff82ce
	adda.l	d2,a1					;$d3c2			;ff82d0
	move.l	d2,d0					;$2002			;ff82d2
	movem.l	(a7)+,d2/a0				;$4cdf,$0104		;ff82d4
	sub.l	d0,d2					;$9480			;ff82d8
	bne.s	Lff82ba					;$66de			;ff82da
	rts						;$4e75			;ff82dc

Lff82de:									;ff82de
	moveq.l	#$00,d0					;$7000			;ff82de
	jsr	(a0)					;$4e90			;ff82e0
	rts						;$4e75			;ff82e2

Lff82e4:									;ff82e4
	movem.l	d1-d2/a1,-(a7)				;$48e7,$6040		;ff82e4
	movea.l	($0978),a1				;$2278,$0978		;ff82e8
	move.w	#$0403,d1				;$323c,$0403		;ff82ec
	move.w	($097c),d2				;$3438,$097c		;ff82f0
	beq.s	Lff82fa					;$6704			;ff82f4
	moveq.l	#$00,d0					;$7000			;ff82f6
	bsr.s	Lff831a					;$6120			;ff82f8
Lff82fa:									;ff82fa
	movem.l	(a7)+,d1-d2/a1				;$4cdf,$0206		;ff82fa
	rts						;$4e75			;ff82fe

Lff8300:									;ff8300
	tst.b	($0c32)					;$4a38,$0c32		;ff8300
	bne.s	Lff8300					;$66fa			;ff8304
	addq.b	#4,d0					;$5800			;ff8306
	move.b	d0,($0c32)				;$11c0,$0c32		;ff8308
	moveq.l	#$b2,d0					;$70b2			;ff830c
	bsr.s	Lff8334					;$6124			;ff830e
	move.b	#$04,($00e92001)			;$13fc,$0004,$00e9,$2001	;ff8310
	rts						;$4e75			;ff8318

Lff831a:									;ff831a
	tst.b	($0c32)					;$4a38,$0c32		;ff831a
	bne.s	Lff831a					;$66fa			;ff831e
	addq.b	#2,d0					;$5400			;ff8320
	move.b	d0,($0c32)				;$11c0,$0c32		;ff8322
	moveq.l	#$32,d0					;$7032			;ff8326
	bsr.s	Lff8334					;$610a			;ff8328
	move.b	#$02,($00e92001)			;$13fc,$0002,$00e9,$2001	;ff832a
	rts						;$4e75			;ff8332

Lff8334:									;ff8334
	lea.l	($00e840c0),a0				;$41f9,$00e8,$40c0	;ff8334
	move.b	d0,($0005,a0)				;$1140,$0005		;ff833a
	st.b	(a0)					;$50d0			;ff833e
	move.l	a1,($000c,a0)				;$2149,$000c		;ff8340
	move.w	d2,($000a,a0)				;$3142,$000a		;ff8344
Lff8348:									;ff8348
	move.w	d1,-(a7)				;$3f01			;ff8348
	move.b	($09da),d0				;$1038,$09da		;ff834a
	or.b	#$80,d0					;$803c,$0080		;ff834e
	cmp.w	#$0200,d1				;$b27c,$0200		;ff8352
	bcs.s	Lff8360					;$6508			;ff8356
	sub.w	#$0200,d1				;$927c,$0200		;ff8358
	and.b	#$7f,d0					;$c03c,$007f		;ff835c
Lff8360:									;ff8360
	move.b	d0,($09da)				;$11c0,$09da		;ff8360
	bsr.w	Lff84e2					;$6100,$017c		;ff8364
	move.b	#$1b,($00e90001)			;$13fc,$001b,$00e9,$0001	;ff8368
	bsr.w	Lff84e2					;$6100,$0170		;ff8370
	move.b	d0,($00e90003)				;$13c0,$00e9,$0003	;ff8374
	move.w	d1,d0					;$3001			;ff837a
	and.b	#$03,d0					;$c03c,$0003		;ff837c
	beq.s	Lff8388					;$6706			;ff8380
	cmp.b	#$03,d0					;$b03c,$0003		;ff8382
	bne.s	Lff838c					;$6604			;ff8386
Lff8388:									;ff8388
	eori.b	#$03,d0					;$0a00,$0003		;ff8388
Lff838c:									;ff838c
	lsr.w	#8,d1					;$e049			;ff838c
	asl.w	#2,d1					;$e541			;ff838e
	or.b	d0,d1					;$8200			;ff8390
	move.b	($00e9a005),d0				;$1039,$00e9,$a005	;ff8392
	and.b	#$f0,d0					;$c03c,$00f0		;ff8398
	or.b	d1,d0					;$8001			;ff839c
	move.w	(a7)+,d1				;$321f			;ff839e
	bsr.w	Lff8284					;$6100,$fee2		;ff83a0
	move.b	#$88,($0007,a0)				;$117c,$0088,$0007	;ff83a4
	move.b	d0,($00e9a005)				;$13c0,$00e9,$a005	;ff83aa
	rts						;$4e75			;ff83b0

Lff83b2:									;ff83b2
	tst.w	d1					;$4a41			;ff83b2
	bmi.s	Lff83ca					;$6b14			;ff83b4
	move.w	d1,-(a7)				;$3f01			;ff83b6
	lsr.w	#8,d1					;$e049			;ff83b8
	and.w	#$0007,d1				;$c27c,$0007		;ff83ba
	moveq.l	#$00,d0					;$7000			;ff83be
	move.b	(Lff83d0,pc,d1.w),d0			;$103b,$100e		;ff83c0
	bsr.w	Lff0d12					;$6100,$894c		;ff83c4
	move.w	(a7)+,d1				;$321f			;ff83c8
Lff83ca:									;ff83ca
	and.w	#$7fff,d1				;$c27c,$7fff		;ff83ca
	rts						;$4e75			;ff83ce

Lff83d0:									;ff83d0
	.dc.b	$0a,$08,$05,$04,$03,$00,$00,$00					;ff83d0
Call_ADPCMAIN:									;ff83d8
	tst.b	($0c32)					;$4a38,$0c32		;ff83d8
	bne.s	Call_ADPCMAIN				;$66fa			;ff83dc
	bsr.s	Lff83b2					;$61d2			;ff83de
	move.b	#$14,($0c32)				;$11fc,$0014,$0c32	;ff83e0
	moveq.l	#$ba,d0					;$70ba			;ff83e6
	bsr.s	Lff8410					;$6126			;ff83e8
	move.b	#$04,($00e92001)			;$13fc,$0004,$00e9,$2001	;ff83ea
	rts						;$4e75			;ff83f2

Call_ADPCMAOT:									;ff83f4
	tst.b	($0c32)					;$4a38,$0c32		;ff83f4
	bne.s	Call_ADPCMAOT				;$66fa			;ff83f8
	bsr.s	Lff83b2					;$61b6			;ff83fa
	move.b	#$12,($0c32)				;$11fc,$0012,$0c32	;ff83fc
	moveq.l	#$3a,d0					;$703a			;ff8402
	bsr.s	Lff8410					;$610a			;ff8404
	move.b	#$02,($00e92001)			;$13fc,$0002,$00e9,$2001	;ff8406
	rts						;$4e75			;ff840e

Lff8410:									;ff8410
	lea.l	($00e840c0),a0				;$41f9,$00e8,$40c0	;ff8410
	move.b	d0,($0005,a0)				;$1140,$0005		;ff8416
	st.b	(a0)					;$50d0			;ff841a
	move.l	a1,($001c,a0)				;$2149,$001c		;ff841c
	move.w	d2,($001a,a0)				;$3142,$001a		;ff8420
	bra.w	Lff8348					;$6000,$ff22		;ff8424
Call_ADPCMLIN:									;ff8428
	tst.b	($0c32)					;$4a38,$0c32		;ff8428
	bne.s	Call_ADPCMLIN				;$66fa			;ff842c
	bsr.s	Lff83b2					;$6182			;ff842e
	move.b	#$24,($0c32)				;$11fc,$0024,$0c32	;ff8430
	moveq.l	#$be,d0					;$70be			;ff8436
	bsr.s	Lff8410					;$61d6			;ff8438
	move.b	#$04,($00e92001)			;$13fc,$0004,$00e9,$2001	;ff843a
	rts						;$4e75			;ff8442

Call_ADPCMLOT:									;ff8444
	tst.b	($0c32)					;$4a38,$0c32		;ff8444
	bne.s	Call_ADPCMLOT				;$66fa			;ff8448
	bsr.w	Lff83b2					;$6100,$ff66		;ff844a
	move.b	#$22,($0c32)				;$11fc,$0022,$0c32	;ff844e
	moveq.l	#$3e,d0					;$703e			;ff8454
	bsr.s	Lff8410					;$61b8			;ff8456
	move.b	#$02,($00e92001)			;$13fc,$0002,$00e9,$2001	;ff8458
	rts						;$4e75			;ff8460

Call_ADPCMSNS:									;ff8462
	moveq.l	#$00,d0					;$7000			;ff8462
	move.b	($0c32),d0				;$1038,$0c32		;ff8464
	and.b	#$7f,d0					;$c03c,$007f		;ff8468
	rts						;$4e75			;ff846c

Call_ADPCMMOD:									;ff846e
	tst.b	d1					;$4a01			;ff846e
	beq.s	Lff847e					;$670c			;ff8470
	cmp.b	#$02,d1					;$b23c,$0002		;ff8472
	bcs.s	Lff84aa					;$6532			;ff8476
	beq.s	Lff84ae					;$6734			;ff8478
	moveq.l	#$ff,d0					;$70ff			;ff847a
	rts						;$4e75			;ff847c

Lff847e:									;ff847e
	clr.w	($0c32)					;$4278,$0c32		;ff847e
	move.b	#$01,($00e9a007)			;$13fc,$0001,$00e9,$a007	;ff8482
	move.b	#$03,($00e9a007)			;$13fc,$0003,$00e9,$a007	;ff848a
	move.b	#$01,($00e92001)			;$13fc,$0001,$00e9,$2001	;ff8492
	moveq.l	#$10,d0					;$7010			;ff849a
Lff849c:									;ff849c
	ori.w	#$0700,sr				;$007c,$0700		;ff849c
Lff84a0:									;ff84a0
	move.b	d0,($00e840c7)				;$13c0,$00e8,$40c7	;ff84a0
	moveq.l	#$00,d0					;$7000			;ff84a6
	rts						;$4e75			;ff84a8

Lff84aa:									;ff84aa
	moveq.l	#$20,d0					;$7020			;ff84aa
	bra.s	Lff849c					;$60ee			;ff84ac
Lff84ae:									;ff84ae
	moveq.l	#$08,d0					;$7008			;ff84ae
	bra.s	Lff84a0					;$60ee			;ff84b0
Call_OPMSET:									;ff84b2
	move.b	d2,d0					;$1002			;ff84b2
	cmp.b	#$1b,d1					;$b23c,$001b		;ff84b4
	bne.s	Lff84cc					;$6612			;ff84b8
	move.b	($09da),d0				;$1038,$09da		;ff84ba
	and.b	#$c0,d0					;$c03c,$00c0		;ff84be
	and.b	#$3f,d2					;$c43c,$003f		;ff84c2
	or.b	d2,d0					;$8002			;ff84c6
	move.b	d0,($09da)				;$11c0,$09da		;ff84c8
Lff84cc:									;ff84cc
	swap.w	d0					;$4840			;ff84cc
	bsr.s	Lff84e2					;$6112			;ff84ce
	move.b	d1,($00e90001)				;$13c1,$00e9,$0001	;ff84d0
	bsr.s	Lff84e2					;$610a			;ff84d6
	swap.w	d0					;$4840			;ff84d8
	move.b	d0,($00e90003)				;$13c0,$00e9,$0003	;ff84da
	rts						;$4e75			;ff84e0

Lff84e2:									;ff84e2
	tst.b	($00e90003)				;$4a39,$00e9,$0003	;ff84e2
	bmi.s	Lff84e2					;$6bf8			;ff84e8
	rts						;$4e75			;ff84ea

Call_OPMSNS:									;ff84ec
	moveq.l	#$00,d0					;$7000			;ff84ec
	move.b	($00e90003),d0				;$1039,$00e9,$0003	;ff84ee
	rts						;$4e75			;ff84f4

Call_ONTIME:									;ff84f6
	ori.w	#$0700,sr				;$007c,$0700		;ff84f6
	move.l	($09d6),d1				;$2238,$09d6		;ff84fa
	cmp.l	#$05a00000,d1				;$b2bc,$05a0,$0000	;ff84fe
	bcs.s	Lff8508					;$6502			;ff8504
	clr.l	d1					;$4281			;ff8506
Lff8508:									;ff8508
	divu.w	#$05a0,d1				;$82fc,$05a0		;ff8508
	move.w	d1,-(a7)				;$3f01			;ff850c
	swap.w	d1					;$4841			;ff850e
	mulu.w	#$1770,d1				;$c2fc,$1770		;ff8510
	clr.l	d0					;$4280			;ff8514
	move.w	($09ca),d0				;$3038,$09ca		;ff8516
	sub.w	($09cc),d0				;$9078,$09cc		;ff851a
	add.l	d1,d0					;$d081			;ff851e
	clr.l	d1					;$4281			;ff8520
	move.w	(a7)+,d1				;$321f			;ff8522
	rts						;$4e75			;ff8524

Lff8526:									;ff8526
	moveq.l	#$43,d0					;$7043			;ff8526
	bsr.w	Lff85b6					;$6100,$008c		;ff8528
	bra.s	Lff8536					;$6008			;ff852c
Lff852e:									;ff852e
	bra.s	Lff8526					;$60f6			;ff852e
Call_OPMINTST:									;ff8530
	moveq.l	#$43,d0					;$7043			;ff8530
	bsr.w	Lff85d4					;$6100,$00a0		;ff8532
Lff8536:									;ff8536
	beq.s	Lff854c					;$6714			;ff8536
	lea.l	($00e88009),a0				;$41f9,$00e8,$8009	;ff8538
	ori.b	#$08,(a0)				;$0010,$0008		;ff853e
	ori.b	#$08,($000c,a0)				;$0028,$0008,$000c	;ff8542
	moveq.l	#$00,d0					;$7000			;ff8548
	rts						;$4e75			;ff854a

Lff854c:									;ff854c
	move.l	a0,-(a7)				;$2f08			;ff854c
	lea.l	($00e88009),a0				;$41f9,$00e8,$8009	;ff854e
	andi.b	#$f7,(a0)				;$0210,$00f7		;ff8554
	andi.b	#$f7,($000c,a0)				;$0228,$00f7,$000c	;ff8558
	bra.w	Lff85f2					;$6000,$0092		;ff855e
Lff8562:									;ff8562
	moveq.l	#$44,d0					;$7044			;ff8562
	bsr.s	Lff85b6					;$6150			;ff8564
	bra.s	Lff856e					;$6006			;ff8566
Lff8568:									;ff8568
	bra.s	Lff8562					;$60f8			;ff8568
Call_TIMERDST:									;ff856a
	moveq.l	#$44,d0					;$7044			;ff856a
	bsr.s	Lff85d4					;$6166			;ff856c
Lff856e:									;ff856e
	beq.s	Lff859a					;$672a			;ff856e
	lea.l	($00e88000),a0				;$41f9,$00e8,$8000	;ff8570
	move.w	d1,d0					;$3001			;ff8576
	ror.w	#8,d0					;$e058			;ff8578
	and.w	#$0007,d0				;$c07c,$0007		;ff857a
	or.w	#$0070,d0				;$807c,$0070		;ff857e
	move.b	d0,($001d,a0)				;$1140,$001d		;ff8582
	move.b	d1,($0025,a0)				;$1141,$0025		;ff8586
	ori.b	#$10,($0009,a0)				;$0028,$0010,$0009	;ff858a
	ori.b	#$10,($0015,a0)				;$0028,$0010,$0015	;ff8590
	moveq.l	#$00,d0					;$7000			;ff8596
	rts						;$4e75			;ff8598

Lff859a:									;ff859a
	move.l	a0,-(a7)				;$2f08			;ff859a
	lea.l	($00e88000),a0				;$41f9,$00e8,$8000	;ff859c
	move.b	#$70,($001d,a0)				;$117c,$0070,$001d	;ff85a2
	andi.b	#$ef,($0009,a0)				;$0228,$00ef,$0009	;ff85a8
	andi.b	#$ef,($0015,a0)				;$0228,$00ef,$0015	;ff85ae
	bra.s	Lff85f2					;$603c			;ff85b4
Lff85b6:									;ff85b6
	ori.w	#$0700,sr				;$007c,$0700		;ff85b6
	movec.l	vbr,a0					;$4e7a,$8801		;ff85ba
	lsl.w	#2,d0					;$e548			;ff85be
	adda.w	d0,a0					;$d0c0			;ff85c0
	move.l	a1,d0					;$2009			;ff85c2
	beq.s	Lff85ec					;$6726			;ff85c4
	move.l	(a0),d0					;$2010			;ff85c6
	cmpi.l	#DefaultExceptionHandler,d0		;$0c80,$00ff,$0770	;ff85c8
	bne.s	Lff85ee					;$661e			;ff85ce
	moveq.l	#$ff,d0					;$70ff			;ff85d0
	bra.s	Lff85ea					;$6016			;ff85d2
Lff85d4:									;ff85d4
	ori.w	#$0700,sr				;$007c,$0700		;ff85d4
	lsl.w	#2,d0					;$e548			;ff85d8
	movea.w	d0,a0					;$3040			;ff85da
	move.l	a1,d0					;$2009			;ff85dc
	beq.s	Lff85ec					;$670c			;ff85de
	move.l	(a0),d0					;$2010			;ff85e0
	cmpi.l	#L000000,d0				;$0c80,$0100,$0000	;ff85e2
	bcs.s	Lff85ee					;$6504			;ff85e8
Lff85ea:									;ff85ea
	move.l	a1,(a0)					;$2089			;ff85ea
Lff85ec:									;ff85ec
	rts						;$4e75			;ff85ec

Lff85ee:									;ff85ee
	tst.l	(a7)+					;$4a9f			;ff85ee
	rts						;$4e75			;ff85f0

Lff85f2:									;ff85f2
	movea.l	(a7)+,a0				;$205f			;ff85f2
	move.l	a0,d0					;$2008			;ff85f4
	lsr.w	#2,d0					;$e448			;ff85f6
	pea.l	(DefaultExceptionHandler,pc)		;$487a,$8176		;ff85f8
	move.l	(a7)+,(a0)				;$209f			;ff85fc
	move.b	d0,(a0)					;$1080			;ff85fe
	moveq.l	#$00,d0					;$7000			;ff8600
	rts						;$4e75			;ff8602

Lff8604:									;ff8604
	moveq.l	#$4d,d0					;$704d			;ff8604
	bsr.s	Lff85b6					;$61ae			;ff8606
	bra.s	Lff8610					;$6006			;ff8608
Lff860a:									;ff860a
	bra.s	Lff8604					;$60f8			;ff860a
Call_VDISPST:									;ff860c
	moveq.l	#$4d,d0					;$704d			;ff860c
	bsr.s	Lff85d4					;$61c4			;ff860e
Lff8610:									;ff8610
	beq.s	Lff8642					;$6730			;ff8610
	lea.l	($00e88000),a0				;$41f9,$00e8,$8000	;ff8612
	move.b	($0003,a0),d0				;$1028,$0003		;ff8618
	and.w	#$00ef,d0				;$c07c,$00ef		;ff861c
	btst.l	#$08,d1					;$0801,$0008		;ff8620
	beq.s	Lff862a					;$6704			;ff8624
	or.w	#$0010,d0				;$807c,$0010		;ff8626
Lff862a:									;ff862a
	move.b	d0,($0003,a0)				;$1140,$0003		;ff862a
	move.b	d1,($001f,a0)				;$1141,$001f		;ff862e
	ori.b	#$20,($0007,a0)				;$0028,$0020,$0007	;ff8632
	ori.b	#$20,($0013,a0)				;$0028,$0020,$0013	;ff8638
	moveq.l	#$00,d0					;$7000			;ff863e
	rts						;$4e75			;ff8640

Lff8642:									;ff8642
	move.l	a0,-(a7)				;$2f08			;ff8642
	lea.l	($00e88007),a0				;$41f9,$00e8,$8007	;ff8644
	andi.b	#$df,(a0)				;$0210,$00df		;ff864a
	andi.b	#$df,($000c,a0)				;$0228,$00df,$000c	;ff864e
	bra.s	Lff85f2					;$609c			;ff8654
Lff8656:									;ff8656
	moveq.l	#$4e,d0					;$704e			;ff8656
	bsr.w	Lff85b6					;$6100,$ff5c		;ff8658
	bra.s	Lff8666					;$6008			;ff865c
Lff865e:									;ff865e
	bra.s	Lff8656					;$60f6			;ff865e
Call_CRTCRAS:									;ff8660
	moveq.l	#$4e,d0					;$704e			;ff8660
	bsr.w	Lff85d4					;$6100,$ff70		;ff8662
Lff8666:									;ff8666
	beq.s	Lff8682					;$671a			;ff8666
	move.w	d1,($00e80012)				;$33c1,$00e8,$0012	;ff8668
	lea.l	($00e88007),a0				;$41f9,$00e8,$8007	;ff866e
	ori.b	#$40,(a0)				;$0010,$0040		;ff8674
	ori.b	#$40,($000c,a0)				;$0028,$0040,$000c	;ff8678
	moveq.l	#$00,d0					;$7000			;ff867e
	rts						;$4e75			;ff8680

Lff8682:									;ff8682
	move.l	a0,-(a7)				;$2f08			;ff8682
	lea.l	($00e88007),a0				;$41f9,$00e8,$8007	;ff8684
	andi.b	#$bf,(a0)				;$0210,$00bf		;ff868a
	andi.b	#$bf,($000c,a0)				;$0228,$00bf,$000c	;ff868e
	bra.w	Lff85f2					;$6000,$ff5c		;ff8694
Lff8698:									;ff8698
	moveq.l	#$4f,d0					;$704f			;ff8698
	bsr.w	Lff85b6					;$6100,$ff1a		;ff869a
	bra.s	Lff86a8					;$6008			;ff869e
Lff86a0:									;ff86a0
	bra.s	Lff8698					;$60f6			;ff86a0
Call_HSYNCST:									;ff86a2
	moveq.l	#$4f,d0					;$704f			;ff86a2
	bsr.w	Lff85d4					;$6100,$ff2e		;ff86a4
Lff86a8:									;ff86a8
	beq.s	Lff86be					;$6714			;ff86a8
	lea.l	($00e88007),a0				;$41f9,$00e8,$8007	;ff86aa
	ori.b	#$80,(a0)				;$0010,$0080		;ff86b0
	ori.b	#$80,($000c,a0)				;$0028,$0080,$000c	;ff86b4
	moveq.l	#$00,d0					;$7000			;ff86ba
	rts						;$4e75			;ff86bc

Lff86be:									;ff86be
	move.l	a0,-(a7)				;$2f08			;ff86be
	lea.l	($00e88007),a0				;$41f9,$00e8,$8007	;ff86c0
	andi.b	#$7f,(a0)				;$0210,$007f		;ff86c6
	andi.b	#$7f,($000c,a0)				;$0228,$007f,$000c	;ff86ca
	bra.w	Lff85f2					;$6000,$ff20		;ff86d0
Lff86d4:									;ff86d4
	moveq.l	#$63,d0					;$7063			;ff86d4
	bsr.w	Lff85b6					;$6100,$fede		;ff86d6
	bra.s	Lff86e4					;$6008			;ff86da
Lff86dc:									;ff86dc
	bra.s	Lff86d4					;$60f6			;ff86dc
Call_PRNINTST:									;ff86de
	moveq.l	#$63,d0					;$7063			;ff86de
	bsr.w	Lff85d4					;$6100,$fef2		;ff86e0
Lff86e4:									;ff86e4
	beq.s	Lff86f2					;$670c			;ff86e4
	bset.b	#$00,($00e9c001)			;$08f9,$0000,$00e9,$c001	;ff86e6
	moveq.l	#$00,d0					;$7000			;ff86ee
	rts						;$4e75			;ff86f0

Lff86f2:									;ff86f2
	bclr.b	#$00,($00e9c001)			;$08b9,$0000,$00e9,$c001	;ff86f2
	move.l	a0,-(a7)				;$2f08			;ff86fa
	bra.w	Lff85f2					;$6000,$fef4		;ff86fc
Call_B_SEEK:									;ff8700
	btst.l	#$0c,d1					;$0801,$000c		;ff8700
	beq.w	Lff90b8					;$6700,$09b2		;ff8704
	bsr.w	$00ff8ed6				;$6100,$07cc		;ff8708
	bsr.s	Lff8712					;$6104			;ff870c
	bra.w	Lff8f54					;$6000,$0844		;ff870e
Lff8712:									;ff8712
	bsr.s	Lff8728					;$6114			;ff8712
	btst.l	#$1b,d0					;$0800,$001b		;ff8714
	bne.s	Lff8744					;$662a			;ff8718
	swap.w	d0					;$4840			;ff871a
	swap.w	d2					;$4842			;ff871c
	cmp.b	d0,d2					;$b400			;ff871e
	beq.s	Lff8740					;$671e			;ff8720
	swap.w	d2					;$4842			;ff8722
	bsr.w	Lff8a62					;$6100,$033c		;ff8724
Lff8728:									;ff8728
	move.l	d1,-(a7)				;$2f01			;ff8728
	move.b	#$0f,d1					;$123c,$000f		;ff872a
	bsr.w	$00ff8e20				;$6100,$06f0		;ff872e
	swap.w	d2					;$4842			;ff8732
	move.b	d2,($0002,a0)				;$1142,$0002		;ff8734
	swap.w	d2					;$4842			;ff8738
	moveq.l	#$02,d0					;$7002			;ff873a
	bra.w	Lff8a76					;$6000,$0338		;ff873c
Lff8740:									;ff8740
	swap.w	d2					;$4842			;ff8740
	swap.w	d0					;$4840			;ff8742
Lff8744:									;ff8744
	rts						;$4e75			;ff8744

Call_B_VERIFY:									;ff8746
	btst.l	#$0c,d1					;$0801,$000c		;ff8746
	beq.w	Lff91e8					;$6700,$0a9c		;ff874a
	bsr.w	$00ff8ed6				;$6100,$0786		;ff874e
	movem.l	d1/d4-d7/a2,-(a7)			;$48e7,$4f20		;ff8752
	bsr.w	$00ff8dc0				;$6100,$0668		;ff8756
	tst.l	d0					;$4a80			;ff875a
	bne.s	Lff87ac					;$664e			;ff875c
	bsr.w	$00ff8e04				;$6100,$06a4		;ff875e
	btst.l	#$1b,d0					;$0800,$001b		;ff8762
	bne.s	Lff87ac					;$6644			;ff8766
	and.b	#$c0,d1					;$c23c,$00c0		;ff8768
	or.b	#$11,d1					;$823c,$0011		;ff876c
Lff8770:									;ff8770
	bsr.w	$00ff8e20				;$6100,$06ae		;ff8770
	rol.l	#8,d2					;$e19a			;ff8774
	addq.l	#2,a0					;$5488			;ff8776
	move.l	d2,(a0)+				;$20c2			;ff8778
	ror.l	#8,d2					;$e09a			;ff877a
	move.b	d2,(a0)+				;$10c2			;ff877c
	move.b	d7,(a0)+				;$10c7			;ff877e
	move.b	d6,(a0)					;$1086			;ff8780
	bsr.w	Lff8e42					;$6100,$06be		;ff8782
	bsr.w	$00ff8e9c				;$6100,$0714		;ff8786
	bsr.w	$00ff8e66				;$6100,$06da		;ff878a
	bsr.w	$00ff8a80				;$6100,$02f0		;ff878e
	btst.l	#$0a,d0					;$0800,$000a		;ff8792
	bne.s	Lff87ac					;$6614			;ff8796
	btst.l	#$1e,d0					;$0800,$001e		;ff8798
	beq.s	Lff87b0					;$6712			;ff879c
	btst.l	#$1b,d0					;$0800,$001b		;ff879e
	bne.s	Lff87ac					;$6608			;ff87a2
	bsr.w	$00ff8a26				;$6100,$0280		;ff87a4
	dbra.w	d4,Lff8770				;$51cc,$ffc6		;ff87a8
Lff87ac:									;ff87ac
	bra.w	$00ff8f50				;$6000,$07a2		;ff87ac
Lff87b0:									;ff87b0
	lea.l	(Lff87b8,pc),a2				;$45fa,$0006		;ff87b0
	bra.w	$00ff8d68				;$6000,$05b2		;ff87b4
Lff87b8:									;ff87b8
	.dc.b	$ff,$f4,$ff,$b8,$ff,$b8						;ff87b8
Call_B_READDI:									;ff87be
	.dc.b	$08,$01,$00,$0c,$67,$00,$9d,$d2					;ff87be
	.dc.b	$61,$00,$07,$0e,$48,$e7,$4f,$20					;ff87c6
	.dc.b	$61,$00,$05,$f0,$4a,$80,$66,$60					;ff87ce
	.dc.b	$61,$00,$06,$2c,$08,$00,$00,$1b					;ff87d6
	.dc.b	$66,$56,$c2,$3c,$00,$40,$82,$3c					;ff87de
	.dc.b	$00,$02,$61,$00,$06,$36,$e1,$9a					;ff87e6
	.dc.b	$54,$88,$20,$c2,$e0,$9a,$10,$c2					;ff87ee
	.dc.b	$10,$c7,$10,$86,$61,$00,$06,$4a					;ff87f6
	.dc.b	$61,$00,$06,$9c,$61,$00,$06,$62					;ff87fe
	.dc.b	$61,$00,$02,$78,$08,$00,$00,$12					;ff8806
	.dc.b	$66,$2a,$08,$00,$00,$16,$66,$24					;ff880e
	.dc.b	$08,$00,$00,$0f,$66,$1e,$08,$00					;ff8816
	.dc.b	$00,$0e,$66,$18,$08,$00,$00,$1e					;ff881e
	.dc.b	$67,$12,$08,$00,$00,$1b,$66,$08					;ff8826
	.dc.b	$61,$00,$01,$f6,$51,$cc,$ff,$b4					;ff882e
	.dc.b	$60,$00,$07,$18,$45,$fa,$00,$06					;ff8836
	.dc.b	$60,$00,$05,$28,$ff,$f4,$ff,$a6					;ff883e
	.dc.b	$ff,$a6								;ff8846
Call_B_DSKINI:									;ff8848
	btst.l	#$0c,d1					;$0801,$000c		;ff8848
	beq.w	Lff9250					;$6700,$0a02		;ff884c
	lea.l	($09c2),a0				;$41f8,$09c2		;ff8850
	move.w	d2,d0					;$3002			;ff8854
	bne.s	$00ff885c				;$6604			;ff8856
	move.w	#$00c8,d0				;$303c,$00c8		;ff8858
	move.w	d0,(a0)+				;$30c0			;ff885c
	move.w	d0,(a0)+				;$30c0			;ff885e
	move.l	a4,-(a7)				;$2f0c			;ff8860
	bsr.w	Lff1c36					;$6100,$93d2		;ff8862
	movea.l	(a7)+,a4				;$285f			;ff8866
	move.b	($00e94001),d0				;$1039,$00e9,$4001	;ff8868
	btst.l	#$04,d0					;$0800,$0004		;ff886e
	beq.s	$00ff8878				;$6704			;ff8872
	bsr.w	Lff1b62					;$6100,$92ec		;ff8874
	movea.l	a1,a0					;$2049			;ff8878
	move.l	a0,d0					;$2008			;ff887a
	bne.s	$00ff8882				;$6604			;ff887c
	lea.l	($0814,pc),a0				;$41fa,$0814		;ff887e
	moveq.l	#$02,d0					;$7002			;ff8882
	bsr.w	Lff8ea2					;$6100,$061c		;ff8884
	bra.w	Lff8f54					;$6000,$06ca		;ff8888
Call_B_DRVSNS:									;ff888c
	btst.l	#$0c,d1					;$0801,$000c		;ff888c
	beq.w	Lff90d6					;$6700,$0844		;ff8890
Lff8894:									;ff8894
	bsr.w	$00ff8ed6				;$6100,$0640		;ff8894
	bsr.s	Lff889e					;$6104			;ff8898
	bra.w	Lff8f54					;$6000,$06b8		;ff889a
Lff889e:									;ff889e
	move.l	d1,-(a7)				;$2f01			;ff889e
	move.b	#$04,d1					;$123c,$0004		;ff88a0
	bsr.w	$00ff8e20				;$6100,$057a		;ff88a4
	move.l	(a7)+,d1				;$221f			;ff88a8
	moveq.l	#$01,d0					;$7001			;ff88aa
	bsr.w	Lff8ea2					;$6100,$05f4		;ff88ac
Lff88b0:									;ff88b0
	move.b	($00e94001),d0				;$1039,$00e9,$4001	;ff88b0
	and.b	#$d0,d0					;$c03c,$00d0		;ff88b6
	cmp.b	#$d0,d0					;$b03c,$00d0		;ff88ba
	bne.s	Lff88b0					;$66f0			;ff88be
	moveq.l	#$00,d0					;$7000			;ff88c0
	move.b	($00e94003),d0				;$1039,$00e9,$4003	;ff88c2
	ror.l	#8,d0					;$e098			;ff88c8
	rts						;$4e75			;ff88ca

Call_B_WRITE:									;ff88cc
	btst.l	#$0c,d1					;$0801,$000c		;ff88cc
	beq.w	Lff9182					;$6700,$08b0		;ff88d0
	bsr.w	$00ff8ed6				;$6100,$0600		;ff88d4
	movem.l	d1/d4-d7/a2,-(a7)			;$48e7,$4f20		;ff88d8
	bsr.w	$00ff8dc0				;$6100,$04e2		;ff88dc
	tst.l	d0					;$4a80			;ff88e0
	bne.s	Lff893a					;$6656			;ff88e2
	bsr.w	$00ff8e04				;$6100,$051e		;ff88e4
	btst.l	#$1b,d0					;$0800,$001b		;ff88e8
	bne.s	Lff893a					;$664c			;ff88ec
	and.b	#$c0,d1					;$c23c,$00c0		;ff88ee
	or.b	#$05,d1					;$823c,$0005		;ff88f2
	bra.s	Lff88fe					;$6006			;ff88f6
Lff88f8:									;ff88f8
	moveq.l	#$0c,d0					;$700c			;ff88f8
	bsr.w	Lff0d12					;$6100,$8416		;ff88fa
Lff88fe:									;ff88fe
	bsr.w	$00ff8e20				;$6100,$0520		;ff88fe
	rol.l	#8,d2					;$e19a			;ff8902
	addq.l	#2,a0					;$5488			;ff8904
	move.l	d2,(a0)+				;$20c2			;ff8906
	ror.l	#8,d2					;$e09a			;ff8908
	move.b	d2,(a0)+				;$10c2			;ff890a
	move.b	d7,(a0)+				;$10c7			;ff890c
	move.b	d6,(a0)					;$1086			;ff890e
	bsr.w	Lff8e42					;$6100,$0530		;ff8910
	bsr.w	$00ff8e9c				;$6100,$0586		;ff8914
	bsr.w	$00ff8e66				;$6100,$054c		;ff8918
	bsr.w	$00ff8a80				;$6100,$0162		;ff891c
	btst.l	#$1e,d0					;$0800,$001e		;ff8920
	beq.s	Lff893e					;$6718			;ff8924
	btst.l	#$1b,d0					;$0800,$001b		;ff8926
	bne.s	Lff893a					;$660e			;ff892a
	btst.l	#$11,d0					;$0800,$0011		;ff892c
	bne.s	Lff893a					;$6608			;ff8930
	bsr.w	$00ff8a26				;$6100,$00f2		;ff8932
	dbra.w	d4,Lff88fe				;$51cc,$ffc6		;ff8936
Lff893a:									;ff893a
	bra.w	$00ff8f50				;$6000,$0614		;ff893a
Lff893e:									;ff893e
	lea.l	(Lff8946,pc),a2				;$45fa,$0006		;ff893e
	bra.w	$00ff8d68				;$6000,$0424		;ff8942
Lff8946:									;ff8946
	.dc.b	$ff,$f4,$ff,$b8,$ff,$b2						;ff8946
Call_B_READ:									;ff894c
	btst.l	#$0c,d1					;$0801,$000c		;ff894c
	beq.w	Lff917c					;$6700,$082a		;ff8950
	bsr.w	$00ff8ed6				;$6100,$0580		;ff8954
	movem.l	d1/d4-d7/a2,-(a7)			;$48e7,$4f20		;ff8958
	bsr.w	$00ff8dc0				;$6100,$0462		;ff895c
	tst.l	d0					;$4a80			;ff8960
	bne.s	Lff89b0					;$664c			;ff8962
	bsr.w	$00ff8e04				;$6100,$049e		;ff8964
	btst.l	#$1b,d0					;$0800,$001b		;ff8968
	bne.s	Lff89b0					;$6642			;ff896c
	and.b	#$c0,d1					;$c23c,$00c0		;ff896e
	or.b	#$06,d1					;$823c,$0006		;ff8972
Lff8976:									;ff8976
	bsr.w	$00ff8e20				;$6100,$04a8		;ff8976
	rol.l	#8,d2					;$e19a			;ff897a
	addq.l	#2,a0					;$5488			;ff897c
	move.l	d2,(a0)+				;$20c2			;ff897e
	ror.l	#8,d2					;$e09a			;ff8980
	move.b	d2,(a0)+				;$10c2			;ff8982
	move.b	d7,(a0)+				;$10c7			;ff8984
	move.b	d6,(a0)					;$1086			;ff8986
	bsr.w	$00ff8e46				;$6100,$04bc		;ff8988
	bsr.w	$00ff8e9c				;$6100,$050e		;ff898c
	bsr.w	$00ff8e66				;$6100,$04d4		;ff8990
	bsr.w	$00ff8a80				;$6100,$00ea		;ff8994
	btst.l	#$0e,d0					;$0800,$000e		;ff8998
	bne.s	Lff89aa					;$660c			;ff899c
	btst.l	#$1e,d0					;$0800,$001e		;ff899e
	beq.s	Lff89b4					;$6710			;ff89a2
	btst.l	#$1b,d0					;$0800,$001b		;ff89a4
	bne.s	Lff89b0					;$6606			;ff89a8
Lff89aa:									;ff89aa
	bsr.s	$00ff8a26				;$617a			;ff89aa
	dbra.w	d4,Lff8976				;$51cc,$ffc8		;ff89ac
Lff89b0:									;ff89b0
	bra.w	$00ff8f50				;$6000,$059e		;ff89b0
Lff89b4:									;ff89b4
	lea.l	(Lff89bc,pc),a2				;$45fa,$0006		;ff89b4
	bra.w	$00ff8d68				;$6000,$03ae		;ff89b8
Lff89bc:									;ff89bc
	.dc.b	$ff,$f4,$ff,$ba,$ff,$ba						;ff89bc
Call_B_RECALI:									;ff89c2
	btst.l	#$0c,d1					;$0801,$000c		;ff89c2
	beq.w	Lff90be					;$6700,$06f6		;ff89c6
	cmp.b	#$ff,d1					;$b23c,$00ff		;ff89ca
	bne.s	Lff8a1c					;$664c			;ff89ce
	move.b	($09da),d0				;$1038,$09da		;ff89d0
	or.b	#$40,d0					;$803c,$0040		;ff89d4
	move.b	d0,($09da)				;$11c0,$09da		;ff89d8
	bsr.w	Lff84e2					;$6100,$fb04		;ff89dc
	move.b	#$1b,($00e90001)			;$13fc,$001b,$00e9,$0001	;ff89e0
	bsr.w	Lff84e2					;$6100,$faf8		;ff89e8
	move.b	d0,($00e90003)				;$13c0,$00e9,$0003	;ff89ec
	bsr.s	Lff8a1c					;$6128			;ff89f2
	move.l	d0,-(a7)				;$2f00			;ff89f4
	move.b	($09da),d0				;$1038,$09da		;ff89f6
	and.b	#$bf,d0					;$c03c,$00bf		;ff89fa
	move.b	d0,($09da)				;$11c0,$09da		;ff89fe
	bsr.w	Lff84e2					;$6100,$fade		;ff8a02
	move.b	#$1b,($00e90001)			;$13fc,$001b,$00e9,$0001	;ff8a06
	bsr.w	Lff84e2					;$6100,$fad2		;ff8a0e
	move.b	d0,($00e90003)				;$13c0,$00e9,$0003	;ff8a12
	move.l	(a7)+,d0				;$201f			;ff8a18
	rts						;$4e75			;ff8a1a

Lff8a1c:									;ff8a1c
	bsr.w	$00ff8ed6				;$6100,$04b8		;ff8a1c
	bsr.s	Lff8a62					;$6140			;ff8a20
	bra.w	Lff8f54					;$6000,$0530		;ff8a22
	move.l	d0,-(a7)				;$2f00			;ff8a26
	and.l	#$0035ff00,d0				;$c0bc,$0035,$ff00	;ff8a28
	beq.s	Lff8a5e					;$672e			;ff8a2e
	cmp.b	#$05,d4					;$b83c,$0005		;ff8a30
	bcc.s	Lff8a5e					;$6428			;ff8a34
	move.l	($09ee),-(a7)				;$2f38,$09ee		;ff8a36
	move.l	($09f2),-(a7)				;$2f38,$09f2		;ff8a3a
	move.w	($09f6),-(a7)				;$3f38,$09f6		;ff8a3e
	bsr.s	Lff8a62					;$611e			;ff8a42
	move.l	#$0000012c,d0				;$203c,$0000,$012c	;ff8a44
	bsr.w	Lff0d12					;$6100,$82c6		;ff8a4a
	bsr.w	Lff8712					;$6100,$fcc2		;ff8a4e
	move.w	(a7)+,($09f6)				;$31df,$09f6		;ff8a52
	move.l	(a7)+,($09f2)				;$21df,$09f2		;ff8a56
	move.l	(a7)+,($09ee)				;$21df,$09ee		;ff8a5a
Lff8a5e:									;ff8a5e
	move.l	(a7)+,d0				;$201f			;ff8a5e
	rts						;$4e75			;ff8a60

Lff8a62:									;ff8a62
	move.l	d1,-(a7)				;$2f01			;ff8a62
	move.b	#$07,d1					;$123c,$0007		;ff8a64
	bsr.w	$00ff8e20				;$6100,$03b6		;ff8a68
	moveq.l	#$01,d0					;$7001			;ff8a6c
	bsr.s	Lff8a74					;$6104			;ff8a6e
	move.l	(a7)+,d1				;$221f			;ff8a70
	rts						;$4e75			;ff8a72

Lff8a74:									;ff8a74
	move.l	d1,-(a7)				;$2f01			;ff8a74
Lff8a76:									;ff8a76
	bsr.w	Lff8ea2					;$6100,$042a		;ff8a76
	bsr.w	Lff8e8e					;$6100,$0412		;ff8a7a
	move.l	(a7)+,d1				;$221f			;ff8a7e
	move.w	d1,d0					;$3001			;ff8a80
	clr.b	d0					;$4200			;ff8a82
	lsl.w	#6,d0					;$ed48			;ff8a84
	rol.w	#5,d0					;$eb58			;ff8a86
	lea.l	($0c90),a0				;$41f8,$0c90		;ff8a88
	adda.w	d0,a0					;$d0c0			;ff8a8c
	move.l	(a0),d0					;$2010			;ff8a8e
	rts						;$4e75			;ff8a90

Call_B_ASSIGN:									;ff8a92
	btst.l	#$0c,d1					;$0801,$000c		;ff8a92
	beq.w	Lff90c4					;$6700,$062c		;ff8a96
	bra.w	Call_Unused				;$6000,$9afa		;ff8a9a
Call_B_WRITED:									;ff8a9e
	btst.l	#$0c,d1					;$0801,$000c		;ff8a9e
	beq.w	Call_Unused				;$6700,$9af2		;ff8aa2
	bsr.w	$00ff8ed6				;$6100,$042e		;ff8aa6
	movem.l	d1/d4-d7/a2,-(a7)			;$48e7,$4f20		;ff8aaa
	bsr.w	$00ff8dc0				;$6100,$0310		;ff8aae
	tst.l	d0					;$4a80			;ff8ab2
	bne.w	Lff893a					;$6600,$fe84		;ff8ab4
	bsr.w	$00ff8e04				;$6100,$034a		;ff8ab8
	btst.l	#$1b,d0					;$0800,$001b		;ff8abc
	bne.w	Lff893a					;$6600,$fe78		;ff8ac0
	and.b	#$c0,d1					;$c23c,$00c0		;ff8ac4
	or.b	#$09,d1					;$823c,$0009		;ff8ac8
	bra.w	Lff88fe					;$6000,$fe30		;ff8acc
Call_B_READID:									;ff8ad0
	btst.l	#$0c,d1					;$0801,$000c		;ff8ad0
	beq.w	Call_Unused				;$6700,$9ac0		;ff8ad4
	bsr.w	$00ff8ed6				;$6100,$03fc		;ff8ad8
	movem.l	d1/d4,-(a7)				;$48e7,$4800		;ff8adc
	bsr.w	$00ff8e04				;$6100,$0322		;ff8ae0
	btst.l	#$1b,d0					;$0800,$001b		;ff8ae4
	bne.s	Lff8b22					;$6638			;ff8ae8
	and.b	#$c0,d1					;$c23c,$00c0		;ff8aea
	or.b	#$0a,d1					;$823c,$000a		;ff8aee
Lff8af2:									;ff8af2
	bsr.w	$00ff8e20				;$6100,$032c		;ff8af2
	moveq.l	#$01,d0					;$7001			;ff8af6
	bsr.w	Lff8ea2					;$6100,$03a8		;ff8af8
	bsr.w	Lff8e8e					;$6100,$0390		;ff8afc
	bsr.w	$00ff8a80				;$6100,$ff7e		;ff8b00
	tst.l	d2					;$4a82			;ff8b04
	bpl.s	Lff8b12					;$6a0a			;ff8b06
	move.l	($0002,a0),d2				;$2428,$0002		;ff8b08
	lsl.l	#8,d2					;$e18a			;ff8b0c
	move.b	($0006,a0),d2				;$1428,$0006		;ff8b0e
Lff8b12:									;ff8b12
	btst.l	#$1e,d0					;$0800,$001e		;ff8b12
	beq.s	Lff8b22					;$670a			;ff8b16
	btst.l	#$1b,d0					;$0800,$001b		;ff8b18
	bne.s	Lff8b22					;$6604			;ff8b1c
	dbra.w	d4,Lff8af2				;$51cc,$ffd2		;ff8b1e
Lff8b22:									;ff8b22
	movem.l	(a7)+,d1/d4				;$4cdf,$0012		;ff8b22
	bra.w	Lff8f54					;$6000,$042c		;ff8b26
Call_B_BADFMT:									;ff8b2a
	btst.l	#$0c,d1					;$0801,$000c		;ff8b2a
	beq.w	Lff90ca					;$6700,$059a		;ff8b2e
	bra.w	Call_Unused				;$6000,$9a62		;ff8b32
Call_B_READDL:									;ff8b36
	btst.l	#$0c,d1					;$0801,$000c		;ff8b36
	beq.w	Call_Unused				;$6700,$9a5a		;ff8b3a
	bsr.w	$00ff8ed6				;$6100,$0396		;ff8b3e
	movem.l	d1/d4-d7/a2,-(a7)			;$48e7,$4f20		;ff8b42
	bsr.w	$00ff8dc0				;$6100,$0278		;ff8b46
	tst.l	d0					;$4a80			;ff8b4a
	bne.w	Lff89b0					;$6600,$fe62		;ff8b4c
	bsr.w	$00ff8e04				;$6100,$02b2		;ff8b50
	btst.l	#$1b,d0					;$0800,$001b		;ff8b54
	bne.w	Lff89b0					;$6600,$fe56		;ff8b58
	and.b	#$c0,d1					;$c23c,$00c0		;ff8b5c
	or.b	#$0c,d1					;$823c,$000c		;ff8b60
	bra.w	Lff8976					;$6000,$fe10		;ff8b64
Lff8b68:									;ff8b68
	move.l	($0d00),d0				;$2038,$0d00		;ff8b68
	beq.s	Lff8b76					;$6708			;ff8b6c
	movea.l	d0,a0					;$2040			;ff8b6e
	moveq.l	#$01,d0					;$7001			;ff8b70
	jsr	(a0)					;$4e90			;ff8b72
	bra.s	Lff8ba0					;$602a			;ff8b74
Lff8b76:									;ff8b76
	moveq.l	#$ff,d0					;$70ff			;ff8b76
	bra.w	Lff8c18					;$6000,$009e		;ff8b78
Call_B_FORMAT:									;ff8b7c
	btst.l	#$0c,d1					;$0801,$000c		;ff8b7c
	beq.w	Lff90d0					;$6700,$054e		;ff8b80
	bsr.w	$00ff8ed6				;$6100,$0350		;ff8b84
	movem.l	d1/d4-d6,-(a7)				;$48e7,$4e00		;ff8b88
	move.w	d1,d0					;$3001			;ff8b8c
	lsr.w	#8,d0					;$e048			;ff8b8e
	lsr.w	#5,d0					;$ea48			;ff8b90
	add.w	d0,d0					;$d040			;ff8b92
	lea.l	(Lff8f68,pc),a0				;$41fa,$03d2		;ff8b94
	move.w	(a0,d0.w),d0				;$3030,$0000		;ff8b98
	beq.s	Lff8b68					;$67ca			;ff8b9c
	adda.w	d0,a0					;$d0c0			;ff8b9e
Lff8ba0:									;ff8ba0
	moveq.l	#$ff,d0					;$70ff			;ff8ba0
	move.l	d2,d4					;$2802			;ff8ba2
	swap.w	d4					;$4844			;ff8ba4
	lsr.w	#8,d4					;$e04c			;ff8ba6
	cmp.w	(a0)+,d4				;$b858			;ff8ba8
	bhi.s	Lff8c18					;$626c			;ff8baa
	lsl.w	#2,d4					;$e54c			;ff8bac
	adda.w	d4,a0					;$d0c4			;ff8bae
	btst.l	#$06,d1					;$0801,$0006		;ff8bb0
	beq.s	Lff8bb8					;$6702			;ff8bb4
	addq.l	#2,a0					;$5488			;ff8bb6
Lff8bb8:									;ff8bb8
	moveq.l	#$00,d6					;$7c00			;ff8bb8
	move.w	(a0),d6					;$3c10			;ff8bba
	beq.s	Lff8c18					;$675a			;ff8bbc
	moveq.l	#$00,d5					;$7a00			;ff8bbe
	move.w	d6,d5					;$3a06			;ff8bc0
	lsr.w	#8,d5					;$e04d			;ff8bc2
	asl.l	#2,d5					;$e585			;ff8bc4
	asl.l	#8,d6					;$e186			;ff8bc6
	move.l	d2,d4					;$2802			;ff8bc8
	and.l	#$ff0000ff,d4				;$c8bc,$ff00,$00ff	;ff8bca
	or.l	d4,d6					;$8c84			;ff8bd0
	bsr.w	$00ff8e04				;$6100,$0230		;ff8bd2
	btst.l	#$1b,d0					;$0800,$001b		;ff8bd6
	bne.s	Lff8c18					;$663c			;ff8bda
	and.b	#$c0,d1					;$c23c,$00c0		;ff8bdc
	or.b	#$0d,d1					;$823c,$000d		;ff8be0
	bsr.w	$00ff8e20				;$6100,$023a		;ff8be4
	move.l	d6,($0002,a0)				;$2146,$0002		;ff8be8
Lff8bec:									;ff8bec
	bsr.w	Lff8e42					;$6100,$0254		;ff8bec
	moveq.l	#$05,d0					;$7005			;ff8bf0
	bsr.w	Lff8e9e					;$6100,$02aa		;ff8bf2
	bsr.w	$00ff8e66				;$6100,$026e		;ff8bf6
	bsr.w	$00ff8a80				;$6100,$fe84		;ff8bfa
	btst.l	#$1e,d0					;$0800,$001e		;ff8bfe
	beq.s	Lff8c18					;$6714			;ff8c02
	btst.l	#$1b,d0					;$0800,$001b		;ff8c04
	bne.s	Lff8c18					;$660e			;ff8c08
	btst.l	#$11,d0					;$0800,$0011		;ff8c0a
	bne.s	Lff8c18					;$6608			;ff8c0e
	bsr.w	$00ff8a26				;$6100,$fe14		;ff8c10
	dbra.w	d4,Lff8bec				;$51cc,$ffd6		;ff8c14
Lff8c18:									;ff8c18
	movem.l	(a7)+,d1/d4-d6				;$4cdf,$0072		;ff8c18
	bra.w	Lff8f54					;$6000,$0336		;ff8c1c
Call_B_DRVCHK:									;ff8c20
	btst.l	#$0c,d1					;$0801,$000c		;ff8c20
	beq.w	Call_Unused				;$6700,$9970		;ff8c24
Lff8c28:									;ff8c28
	movem.l	d1/a1/a4,-(a7)				;$48e7,$4048		;ff8c28
	lsr.w	#8,d1					;$e049			;ff8c2c
	and.w	#$0003,d1				;$c27c,$0003		;ff8c2e
	cmp.w	#$0008,d2				;$b47c,$0008		;ff8c32
	beq.s	Lff8c5e					;$6726			;ff8c36
	lea.l	($09e2),a1				;$43f8,$09e2		;ff8c38
	adda.w	d1,a1					;$d2c1			;ff8c3c
	cmp.w	#$0008,d2				;$b47c,$0008		;ff8c3e
	bcc.s	Lff8c56					;$6412			;ff8c42
	move.w	d2,d0					;$3002			;ff8c44
	add.w	d0,d0					;$d040			;ff8c46
	beq.s	Lff8c70					;$6726			;ff8c48
	lea.l	(Lff8cca,pc),a4				;$49fa,$007e		;ff8c4a
	move.w	(a4,d0.w),d0				;$3034,$0000		;ff8c4e
	jsr	(a4,d0.w)				;$4eb4,$0000		;ff8c52
Lff8c56:									;ff8c56
	bsr.s	Lff8c9c					;$6144			;ff8c56
Lff8c58:									;ff8c58
	movem.l	(a7)+,d1/a1/a4				;$4cdf,$1202		;ff8c58
	rts						;$4e75			;ff8c5c

Lff8c5e:									;ff8c5e
	lea.l	($09e7),a4				;$49f8,$09e7		;ff8c5e
	adda.w	d1,a4					;$d8c1			;ff8c62
	adda.w	d1,a4					;$d8c1			;ff8c64
	moveq.l	#$00,d0					;$7000			;ff8c66
	move.b	(a4),d0					;$1014			;ff8c68
	move.b	#$01,(a4)				;$18bc,$0001		;ff8c6a
	bra.s	Lff8c58					;$60e8			;ff8c6e
Lff8c70:									;ff8c70
	bsr.s	Lff8c9c					;$612a			;ff8c70
	btst.l	#$01,d0					;$0800,$0001		;ff8c72
	beq.s	Lff8c96					;$671e			;ff8c76
	move.l	d0,-(a7)				;$2f00			;ff8c78
	asl.w	#8,d1					;$e141			;ff8c7a
	or.w	#$9000,d1				;$827c,$9000		;ff8c7c
	bsr.w	Lff8894					;$6100,$fc12		;ff8c80
	rol.l	#5,d0					;$eb98			;ff8c84
	and.l	#$0000000c,d0				;$c0bc,$0000,$000c	;ff8c86
	eori.b	#$04,d0					;$0a00,$0004		;ff8c8c
	move.l	(a7)+,d1				;$221f			;ff8c90
	or.l	d1,d0					;$8081			;ff8c92
	bra.s	Lff8c58					;$60c2			;ff8c94
Lff8c96:									;ff8c96
	or.b	#$0c,d0					;$803c,$000c		;ff8c96
	bra.s	Lff8c58					;$60bc			;ff8c9a
Lff8c9c:									;ff8c9c
	move.w	d1,-(a7)				;$3f01			;ff8c9c
	and.w	#$0003,d1				;$c27c,$0003		;ff8c9e
	move.b	(a1),d0					;$1011			;ff8ca2
	and.b	#$c0,d0					;$c03c,$00c0		;ff8ca4
	move.w	d0,-(a7)				;$3f00			;ff8ca8
	bset.l	d1,d0					;$03c0			;ff8caa
	move.b	d0,($00e94005)				;$13c0,$00e9,$4005	;ff8cac
	moveq.l	#$00,d0					;$7000			;ff8cb2
	move.b	($00e94005),d0				;$1039,$00e9,$4005	;ff8cb4
	lsr.w	#6,d0					;$ec48			;ff8cba
	or.b	(a1),d0					;$8011			;ff8cbc
	move.w	(a7)+,d1				;$321f			;ff8cbe
	move.b	d1,($00e94005)				;$13c1,$00e9,$4005	;ff8cc0
	move.w	(a7)+,d1				;$321f			;ff8cc6
	rts						;$4e75			;ff8cc8

Lff8cca:									;ff8cca
	.dc.b	$00,$7c,$00,$54,$00,$30,$00,$2c					;ff8cca
	.dc.b	$00,$14,$00,$10,$00,$22,$00,$1e					;ff8cd2
	.dc.b	$42,$40,$60,$04,$30,$3c,$00,$80					;ff8cda
	.dc.b	$08,$91,$00,$07,$60,$2c,$42,$40					;ff8ce2
	.dc.b	$60,$04,$30,$3c,$00,$20,$08,$91					;ff8cea
	.dc.b	$00,$05,$60,$0c,$42,$40,$60,$04					;ff8cf2
	.dc.b	$30,$3c,$00,$10,$08,$91,$00,$04					;ff8cfa
	.dc.b	$80,$11,$12,$80,$08,$91,$00,$06					;ff8d02
	.dc.b	$c0,$3c,$00,$30,$67,$04,$30,$3c					;ff8d0a
	.dc.b	$00,$40,$80,$11,$12,$80,$c0,$3c					;ff8d12
	.dc.b	$00,$c0,$60,$0e,$10,$11,$08,$00					;ff8d1a
	.dc.b	$00,$06,$66,$20,$80,$7c,$00,$20					;ff8d22
	.dc.b	$60,$04,$c0,$3c,$00,$c0,$c2,$7c					;ff8d2a
	.dc.b	$00,$03,$03,$c0,$13,$c0,$00,$e9					;ff8d32
	.dc.b	$40,$05,$c0,$7c,$00,$e0,$13,$c0					;ff8d3a
	.dc.b	$00,$e9,$40,$05,$4e,$75						;ff8d42
Call_B_EJECT:									;ff8d48
	btst.l	#$0c,d1					;$0801,$000c		;ff8d48
	beq.w	Lff9114					;$6700,$03c6		;ff8d4c
	move.l	d2,-(a7)				;$2f02			;ff8d50
	moveq.l	#$07,d2					;$7407			;ff8d52
	bsr.w	Lff8c28					;$6100,$fed2		;ff8d54
	moveq.l	#$03,d2					;$7403			;ff8d58
	bsr.w	Lff8c28					;$6100,$fecc		;ff8d5a
	moveq.l	#$01,d2					;$7401			;ff8d5e
	bsr.w	Lff8c28					;$6100,$fec6		;ff8d60
	move.l	(a7)+,d2				;$241f			;ff8d64
	rts						;$4e75			;ff8d66

	btst.l	#$1f,d0					;$0800,$001f		;ff8d68
	bne.s	Lff8da4					;$6636			;ff8d6c
	adda.l	d5,a1					;$d3c5			;ff8d6e
	sub.l	d5,d3					;$9685			;ff8d70
	bls.s	Lff8da4					;$6330			;ff8d72
	move.l	d4,d0					;$2004			;ff8d74
	swap.w	d0					;$4840			;ff8d76
	move.w	d0,d4					;$3800			;ff8d78
	move.w	d7,d0					;$3007			;ff8d7a
	lsr.w	#8,d0					;$e048			;ff8d7c
	addq.b	#1,d2					;$5202			;ff8d7e
	cmp.b	d2,d0					;$b002			;ff8d80
	bcc.s	Lff8d9e					;$641a			;ff8d82
	move.b	#$01,d2					;$143c,$0001		;ff8d84
	bchg.l	#$08,d2					;$0842,$0008		;ff8d88
	beq.s	Lff8da8					;$671a			;ff8d8c
	add.l	#$00010000,d2				;$d4bc,$0001,$0000	;ff8d8e
	bsr.w	Lff8712					;$6100,$f97c		;ff8d94
	btst.l	#$1b,d0					;$0800,$001b		;ff8d98
	bne.s	Lff8da4					;$6606			;ff8d9c
Lff8d9e:									;ff8d9e
	adda.w	($0002,a2),a2				;$d4ea,$0002		;ff8d9e
	jmp	(a2)					;$4ed2			;ff8da2

Lff8da4:									;ff8da4
	adda.w	(a2),a2					;$d4d2			;ff8da4
	jmp	(a2)					;$4ed2			;ff8da6

Lff8da8:									;ff8da8
	adda.w	($0004,a2),a2				;$d4ea,$0004		;ff8da8
	jmp	(a2)					;$4ed2			;ff8dac

Lff8dae:									;ff8dae
	move.l	($0d00),d0				;$2038,$0d00		;ff8dae
	beq.s	Lff8dbc					;$6708			;ff8db2
	movea.l	d0,a0					;$2040			;ff8db4
	moveq.l	#$00,d0					;$7000			;ff8db6
	jsr	(a0)					;$4e90			;ff8db8
	bra.s	Lff8dd4					;$6018			;ff8dba
Lff8dbc:									;ff8dbc
	moveq.l	#$ff,d0					;$70ff			;ff8dbc
	rts						;$4e75			;ff8dbe

	move.w	d1,d0					;$3001			;ff8dc0
	lsr.w	#8,d0					;$e048			;ff8dc2
	lsr.w	#5,d0					;$ea48			;ff8dc4
	add.w	d0,d0					;$d040			;ff8dc6
	lea.l	(Lff8fd4,pc),a0				;$41fa,$020a		;ff8dc8
	move.w	(a0,d0.w),d0				;$3030,$0000		;ff8dcc
	beq.s	Lff8dae					;$67dc			;ff8dd0
	adda.w	d0,a0					;$d0c0			;ff8dd2
Lff8dd4:									;ff8dd4
	move.l	d2,d4					;$2802			;ff8dd4
	swap.w	d4					;$4844			;ff8dd6
	lsr.w	#8,d4					;$e04c			;ff8dd8
	cmp.w	(a0)+,d4				;$b858			;ff8dda
	bhi.s	Lff8dbc					;$62de			;ff8ddc
	lsl.w	#3,d4					;$e74c			;ff8dde
	adda.w	d4,a0					;$d0c4			;ff8de0
	moveq.l	#$00,d5					;$7a00			;ff8de2
	move.w	(a0)+,d5				;$3a18			;ff8de4
	move.w	(a0)+,d6				;$3c18			;ff8de6
	btst.l	#$06,d1					;$0801,$0006		;ff8de8
	beq.s	Lff8df0					;$6702			;ff8dec
	addq.l	#2,a0					;$5488			;ff8dee
Lff8df0:									;ff8df0
	move.w	(a0),d7					;$3e10			;ff8df0
	beq.s	Lff8dbc					;$67c8			;ff8df2
	move.w	d7,d0					;$3007			;ff8df4
	lsr.w	#8,d0					;$e048			;ff8df6
	tst.b	d2					;$4a02			;ff8df8
	beq.s	Lff8dbc					;$67c0			;ff8dfa
	cmp.b	d2,d0					;$b002			;ff8dfc
	bcs.s	Lff8dbc					;$65bc			;ff8dfe
	moveq.l	#$00,d0					;$7000			;ff8e00
	rts						;$4e75			;ff8e02

	moveq.l	#$00,d0					;$7000			;ff8e04
	moveq.l	#$00,d4					;$7800			;ff8e06
	btst.l	#$05,d1					;$0801,$0005		;ff8e08
	beq.s	Lff8e14					;$6706			;ff8e0c
	move.l	#$00090009,d4				;$283c,$0009,$0009	;ff8e0e
Lff8e14:									;ff8e14
	btst.l	#$04,d1					;$0801,$0004		;ff8e14
	beq.s	Lff8e1e					;$6704			;ff8e18
	bsr.w	Lff8712					;$6100,$f8f6		;ff8e1a
Lff8e1e:									;ff8e1e
	rts						;$4e75			;ff8e1e

	move.l	d1,-(a7)				;$2f01			;ff8e20
	lea.l	($09ee),a0				;$41f8,$09ee		;ff8e22
	move.b	d1,(a0)					;$1081			;ff8e26
	lsr.w	#2,d1					;$e449			;ff8e28
	lsr.b	#6,d1					;$ec09			;ff8e2a
	btst.l	#$08,d2					;$0802,$0008		;ff8e2c
	beq.s	Lff8e36					;$6704			;ff8e30
	bset.l	#$02,d1					;$08c1,$0002		;ff8e32
Lff8e36:									;ff8e36
	move.b	d1,($0001,a0)				;$1141,$0001		;ff8e36
	move.l	(a7)+,d1				;$221f			;ff8e3a
	rts						;$4e75			;ff8e3c

Lff8e3e:									;ff8e3e
	.dc.b	$00,$e8,$40,$00							;ff8e3e
Lff8e42:									;ff8e42
	moveq.l	#$32,d0					;$7032			;ff8e42
	bra.s	Lff8e48					;$6002			;ff8e44
	moveq.l	#$b2,d0					;$70b2			;ff8e46
Lff8e48:									;ff8e48
	movea.l	(Lff8e3e,pc),a0				;$207a,$fff4		;ff8e48
	st.b	(a0)					;$50d0			;ff8e4c
	move.b	d0,($0005,a0)				;$1140,$0005		;ff8e4e
	move.l	a1,($000c,a0)				;$2149,$000c		;ff8e52
	move.w	d5,($000a,a0)				;$3145,$000a		;ff8e56
	bsr.w	Lff8284					;$6100,$f428		;ff8e5a
	move.b	#$80,($0007,a0)				;$117c,$0080,$0007	;ff8e5e
	rts						;$4e75			;ff8e64

	movea.l	(Lff8e3e,pc),a0				;$207a,$ffd6		;ff8e66
	btst.b	#$04,(a0)+				;$0818,$0004		;ff8e6a
	beq.s	Lff8e74					;$6704			;ff8e6e
	move.b	(a0),d0					;$1010			;ff8e70
	bra.s	Lff8e80					;$600c			;ff8e72
Lff8e74:									;ff8e74
	move.b	($00e94001),d0				;$1039,$00e9,$4001	;ff8e74
	and.b	#$1f,d0					;$c03c,$001f		;ff8e7a
	bne.s	Lff8e74					;$66f4			;ff8e7e
Lff8e80:									;ff8e80
	tst.b	-(a0)					;$4a20			;ff8e80
	bmi.s	Lff8e8a					;$6b06			;ff8e82
	move.b	#$10,($0007,a0)				;$117c,$0010,$0007	;ff8e84
Lff8e8a:									;ff8e8a
	st.b	(a0)					;$50d0			;ff8e8a
	rts						;$4e75			;ff8e8c

Lff8e8e:									;ff8e8e
	move.b	($00e94001),d0				;$1039,$00e9,$4001	;ff8e8e
	and.b	#$1f,d0					;$c03c,$001f		;ff8e94
	bne.s	Lff8e8e					;$66f4			;ff8e98
	rts						;$4e75			;ff8e9a

	moveq.l	#$08,d0					;$7008			;ff8e9c
Lff8e9e:									;ff8e9e
	lea.l	($09ee),a0				;$41f8,$09ee		;ff8e9e
Lff8ea2:									;ff8ea2
	movem.l	d1/a1-a2,-(a7)				;$48e7,$4060		;ff8ea2
	lea.l	($00e94001),a1				;$43f9,$00e9,$4001	;ff8ea6
	lea.l	($0002,a1),a2				;$45e9,$0002		;ff8eac
	move.w	sr,-(a7)				;$40e7			;ff8eb0
	ori.w	#$0700,sr				;$007c,$0700		;ff8eb2
Lff8eb6:									;ff8eb6
	move.b	(a1),d1					;$1211			;ff8eb6
	btst.l	#$04,d1					;$0801,$0004		;ff8eb8
	bne.s	Lff8eb6					;$66f8			;ff8ebc
Lff8ebe:									;ff8ebe
	move.b	(a1),d1					;$1211			;ff8ebe
	bpl.s	Lff8ebe					;$6afc			;ff8ec0
	btst.l	#$06,d1					;$0801,$0006		;ff8ec2
	bne.s	Lff8ebe					;$66f6			;ff8ec6
	move.b	(a0)+,(a2)				;$1498			;ff8ec8
	dbra.w	d0,Lff8ebe				;$51c8,$fff2		;ff8eca
	move.w	(a7)+,sr				;$46df			;ff8ece
	movem.l	(a7)+,d1/a1-a2				;$4cdf,$0602		;ff8ed0
	rts						;$4e75			;ff8ed4

	tst.b	($09e1)					;$4a38,$09e1		;ff8ed6
	bmi.s	Lff8ee6					;$6b0a			;ff8eda
	movem.l	d0-d1/a0,-(a7)				;$48e7,$c080		;ff8edc
	bsr.s	Lff8ef0					;$610e			;ff8ee0
	movem.l	(a7)+,d0-d1/a0				;$4cdf,$0103		;ff8ee2
Lff8ee6:									;ff8ee6
	rts						;$4e75			;ff8ee6

Lff8ee8:									;ff8ee8
	.dc.b	$01,$01,$00,$00,$00,$01,$00,$00					;ff8ee8
Lff8ef0:									;ff8ef0
	move.l	($0d04),d0				;$2038,$0d04		;ff8ef0
	exg.l	d0,a0					;$c188			;ff8ef4
	beq.s	Lff8efa					;$6702			;ff8ef6
	jsr	(a0)					;$4e90			;ff8ef8
Lff8efa:									;ff8efa
	move.w	d1,d0					;$3001			;ff8efa
	lsr.w	#8,d0					;$e048			;ff8efc
	beq.s	Lff8f54					;$6754			;ff8efe
	and.b	#$03,d0					;$c03c,$0003		;ff8f00
	or.b	#$80,d0					;$803c,$0080		;ff8f04
	swap.w	d0					;$4840			;ff8f08
	move.w	d1,d0					;$3001			;ff8f0a
	lsr.w	#8,d0					;$e048			;ff8f0c
	lsr.w	#5,d0					;$ea48			;ff8f0e
	move.b	(Lff8ee8,pc,d0.w),d0			;$103b,$00d6		;ff8f10
	beq.s	Lff8f1a					;$6704			;ff8f14
	bset.l	#$14,d0					;$08c0,$0014		;ff8f16
Lff8f1a:									;ff8f1a
	swap.w	d0					;$4840			;ff8f1a
	bset.b	#$07,($09e1)				;$08f8,$0007,$09e1	;ff8f1c
	move.b	d0,($00e94007)				;$13c0,$00e9,$4007	;ff8f22
	btst.b	#$06,($09e1)				;$0838,$0006,$09e1	;ff8f28
	bne.s	Lff8f48					;$6618			;ff8f2e
	move.w	($09c2),($09c4)				;$31f8,$09c2,$09c4	;ff8f30
Lff8f36:									;ff8f36
	bsr.w	Lff889e					;$6100,$f966		;ff8f36
	btst.l	#$1d,d0					;$0800,$001d		;ff8f3a
	bne.s	Lff8f48					;$6608			;ff8f3e
	cmpi.w	#$0064,($09c4)				;$0c78,$0064,$09c4	;ff8f40
	bcc.s	Lff8f36					;$64ee			;ff8f46
Lff8f48:									;ff8f48
	bclr.b	#$06,($09e1)				;$08b8,$0006,$09e1	;ff8f48
	rts						;$4e75			;ff8f4e

	movem.l	(a7)+,d1/d4-d7/a2			;$4cdf,$04f2		;ff8f50
Lff8f54:									;ff8f54
	tst.b	($09e1)					;$4a38,$09e1		;ff8f54
	beq.s	Lff8f66					;$670c			;ff8f58
	move.w	($09c2),($09c4)				;$31f8,$09c2,$09c4	;ff8f5a
	move.b	#$40,($09e1)				;$11fc,$0040,$09e1	;ff8f60
Lff8f66:									;ff8f66
	rts						;$4e75			;ff8f66

Lff8f68:									;ff8f68
	.dc.w	$002e,$005a,$0000,$0048						;ff8f68
	.dc.w	$0010,$0000,$0000,$0000						;ff8f70
	.dc.w	$0006,$1a1b,$0000,$0f2a						;ff8f78
	.dc.w	$1a36,$083a,$0f54,$048a						;ff8f80
	.dc.w	$0874,$02ff,$04ff,$01ff						;ff8f88
	.dc.w	$02ff,$0000,$01ff,$0005						;ff8f90
	.dc.w	$1019,$0000,$0830,$1032						;ff8f98
	.dc.w	$0487,$0850,$02ff,$04f0						;ff8fa0
	.dc.w	$01ff,$02ff,$0000,$01ff						;ff8fa8
	.dc.w	$0003,$201b,$0000,$122a						;ff8fb0
	.dc.w	$2036,$0a3a,$126c,$0000						;ff8fb8
	.dc.w	$0a74,$0003,$101b,$0000						;ff8fc0
	.dc.w	$092a,$1036,$053a,$0954						;ff8fc8
	.dc.w	$0000,$0574							;ff8fd0
Lff8fd4:									;ff8fd4
	.dc.w	$004a,$009e,$0000,$007c						;ff8fd4
	.dc.w	$0010,$0000,$0000,$0000						;ff8fdc
	.dc.w	$0006,$0080,$0080,$1a07						;ff8fe4
	.dc.w	$0000,$0100,$00ff,$0f0e						;ff8fec
	.dc.w	$1a0e,$0200,$00ff,$081b						;ff8ff4
	.dc.w	$0f1b,$0400,$00ff,$0447						;ff8ffc
	.dc.w	$0835,$0800,$00ff,$02c8						;ff9004
	.dc.w	$0499,$1000,$00ff,$01c8						;ff900c
	.dc.w	$02c8,$2000,$00ff,$0000						;ff9014
	.dc.w	$01c8,$0005,$0080,$0080						;ff901c
	.dc.w	$1010,$0000,$0100,$00ff						;ff9024
	.dc.w	$0818,$1020,$0200,$00ff						;ff902c
	.dc.w	$0446,$082a,$0400,$00ff						;ff9034
	.dc.w	$02c8,$0480,$0800,$00ff						;ff903c
	.dc.w	$01c8,$02c8,$1000,$00ff						;ff9044
	.dc.w	$0000,$01c8,$0003,$0080						;ff904c
	.dc.w	$0080,$2007,$0000,$0100						;ff9054
	.dc.w	$00ff,$120e,$200e,$0200						;ff905c
	.dc.w	$00ff,$0a1b,$121b,$0400						;ff9064
	.dc.w	$00ff,$0000,$0a35,$0003						;ff906c
	.dc.w	$0080,$0080,$1007,$0000						;ff9074
	.dc.w	$0100,$00ff,$090e,$100e						;ff907c
	.dc.w	$0200,$00ff,$051b,$091b						;ff9084
	.dc.w	$0400,$00ff,$0000,$0535						;ff908c
	.dc.w	$03d0,$1000,$48e7,$f842						;ff9094
	.dc.w	$323c,$8000,$740f,$43f8						;ff909c
	.dc.w	$0000,$6100,$01a8,$d27c						;ff90a4
	.dc.w	$0100,$51ca,$fff2,$4cdf						;ff90ac
	.dc.w	$421f,$4e75							;ff90b4
Lff90b8:									;ff90b8
	lea.l	(Lffd9f8,pc),a0				;$41fa,$493e		;ff90b8
	bra.s	Lff90da					;$601c			;ff90bc
Lff90be:									;ff90be
	lea.l	(Lffd40e,pc),a0				;$41fa,$434e		;ff90be
	bra.s	Lff90da					;$6016			;ff90c2
Lff90c4:									;ff90c4
	lea.l	(Lffdade,pc),a0				;$41fa,$4a18		;ff90c4
	bra.s	Lff90da					;$6010			;ff90c8
Lff90ca:									;ff90ca
	lea.l	(Lffdaa6,pc),a0				;$41fa,$49da		;ff90ca
	bra.s	Lff90da					;$600a			;ff90ce
Lff90d0:									;ff90d0
	lea.l	(Lffda6e,pc),a0				;$41fa,$499c		;ff90d0
	bra.s	Lff90da					;$6004			;ff90d4
Lff90d6:									;ff90d6
	lea.l	(Lffd3f0,pc),a0				;$41fa,$4318		;ff90d6
Lff90da:									;ff90da
	movem.l	d1/d4/a5,-(a7)				;$48e7,$4804		;ff90da
	movea.l	a0,a5					;$2a48			;ff90de
	moveq.l	#$00,d4					;$7800			;ff90e0
	move.w	d1,d4					;$3801			;ff90e2
	lsr.w	#8,d4					;$e04c			;ff90e4
	lsr.w	#1,d4					;$e24c			;ff90e6
	bcc.s	Lff90ee					;$6404			;ff90e8
	bset.l	#$10,d4					;$08c4,$0010		;ff90ea
Lff90ee:									;ff90ee
	andi.w	#$0007,d4				;$0244,$0007		;ff90ee
	btst.b	d4,($00ed0071)				;$0939,$00ed,$0071	;ff90f2
	beq.s	Lff910a					;$6710			;ff90f8
	jsr	(a5)					;$4e95			;ff90fa
	btst.l	#$01,d0					;$0800,$0001		;ff90fc
	bne.s	Lff910c					;$660a			;ff9100
	moveq.l	#$00,d0					;$7000			;ff9102
Lff9104:									;ff9104
	movem.l	(a7)+,d1/d4/a5				;$4cdf,$2012		;ff9104
	rts						;$4e75			;ff9108

Lff910a:									;ff910a
	moveq.l	#$ff,d0					;$70ff			;ff910a
Lff910c:									;ff910c
	ori.l	#$ffffff00,d0				;$0080,$ffff,$ff00	;ff910c
	bra.s	Lff9104					;$60f0			;ff9112
Lff9114:									;ff9114
	movem.l	d1-d7/a1/a4,-(a7)			;$48e7,$7f48		;ff9114
	moveq.l	#$00,d4					;$7800			;ff9118
	move.w	d1,d4					;$3801			;ff911a
	move.l	d4,d1					;$2204			;ff911c
	lsr.w	#8,d4					;$e04c			;ff911e
	lsr.w	#1,d4					;$e24c			;ff9120
	bcc.s	Lff9128					;$6404			;ff9122
	bset.l	#$10,d4					;$08c4,$0010		;ff9124
Lff9128:									;ff9128
	andi.w	#$0007,d4				;$0244,$0007		;ff9128
	btst.b	d4,($00ed0071)				;$0939,$00ed,$0071	;ff912c
	beq.s	Lff9176					;$6742			;ff9132
	lea.l	($09fe),a4				;$49f8,$09fe		;ff9134
	move.w	d1,d0					;$3001			;ff9138
	ror.w	#8,d0					;$e058			;ff913a
	and.w	#$000f,d0				;$c07c,$000f		;ff913c
	move.b	(a4,d0.w),d0				;$1034,$0000		;ff9140
	tst.b	d0					;$4a00			;ff9144
	bmi.s	Lff9176					;$6b2e			;ff9146
	beq.s	Lff9176					;$672c			;ff9148
	move.l	#$00015660,d2				;$243c,$0001,$5660	;ff914a
	cmp.b	#$14,d0					;$b03c,$0014		;ff9150
	beq.s	Lff9170					;$671a			;ff9154
	move.l	#$0002acc0,d2				;$243c,$0002,$acc0	;ff9156
	cmp.b	#$28,d0					;$b03c,$0028		;ff915c
	beq.s	Lff9170					;$670e			;ff9160
	move.l	#$0000af50,d2				;$243c,$0000,$af50	;ff9162
	cmp.b	#$0a,d0					;$b03c,$000a		;ff9168
	beq.s	Lff9170					;$6702			;ff916c
	bra.s	Lff9176					;$6006			;ff916e
Lff9170:									;ff9170
	bsr.w	Lffd9f8					;$6100,$4886		;ff9170
	moveq.l	#$00,d0					;$7000			;ff9174
Lff9176:									;ff9176
	movem.l	(a7)+,d1-d7/a1/a4			;$4cdf,$12fe		;ff9176
	rts						;$4e75			;ff917a

Lff917c:									;ff917c
	lea.l	(Lffd742,pc),a0				;$41fa,$45c4		;ff917c
	bra.s	Lff9186					;$6004			;ff9180
Lff9182:									;ff9182
	lea.l	(Lffd79c,pc),a0				;$41fa,$4618		;ff9182
Lff9186:									;ff9186
	movem.l	d1-d6/a1-a2/a5,-(a7)			;$48e7,$7e64		;ff9186
	movea.l	a0,a5					;$2a48			;ff918a
	moveq.l	#$00,d4					;$7800			;ff918c
	move.w	d1,d4					;$3801			;ff918e
	lsr.w	#8,d4					;$e04c			;ff9190
	lsr.w	#1,d4					;$e24c			;ff9192
	bcc.s	Lff919a					;$6404			;ff9194
	bset.l	#$10,d4					;$08c4,$0010		;ff9196
Lff919a:									;ff919a
	andi.w	#$0007,d4				;$0244,$0007		;ff919a
	btst.b	d4,($00ed0071)				;$0939,$00ed,$0071	;ff919e
	beq.s	Lff91de					;$6738			;ff91a4
	move.l	d3,d6					;$2c03			;ff91a6
Lff91a8:									;ff91a8
	move.l	d6,d3					;$2606			;ff91a8
	add.l	#$000000ff,d3				;$d6bc,$0000,$00ff	;ff91aa
	lsr.l	#8,d3					;$e08b			;ff91b0
	cmp.l	#$00000100,d3				;$b6bc,$0000,$0100	;ff91b2
	bls.s	Lff91c0					;$6306			;ff91b8
	move.l	#$00000100,d3				;$263c,$0000,$0100	;ff91ba
Lff91c0:									;ff91c0
	moveq.l	#$00,d5					;$7a00			;ff91c0
	jsr	(a5)					;$4e95			;ff91c2
	btst.l	#$01,d0					;$0800,$0001		;ff91c4
	bne.s	Lff91e0					;$6616			;ff91c8
	add.l	d3,d2					;$d483			;ff91ca
	move.l	d3,d1					;$2203			;ff91cc
	lsl.l	#8,d1					;$e189			;ff91ce
	adda.l	d1,a1					;$d3c1			;ff91d0
	sub.l	d1,d6					;$9c81			;ff91d2
	bhi.s	Lff91a8					;$62d2			;ff91d4
	moveq.l	#$00,d0					;$7000			;ff91d6
Lff91d8:									;ff91d8
	movem.l	(a7)+,d1-d6/a1-a2/a5			;$4cdf,$267e		;ff91d8
	rts						;$4e75			;ff91dc

Lff91de:									;ff91de
	moveq.l	#$ff,d0					;$70ff			;ff91de
Lff91e0:									;ff91e0
	ori.l	#$ffffff00,d0				;$0080,$ffff,$ff00	;ff91e0
	bra.s	Lff91d8					;$60f0			;ff91e6
Lff91e8:									;ff91e8
	link.w	a4,#-$0100				;$4e54,$ff00		;ff91e8
	movem.l	d1-d6/a1-a2,-(a7)			;$48e7,$7e60		;ff91ec
	moveq.l	#$00,d4					;$7800			;ff91f0
	move.w	d1,d4					;$3801			;ff91f2
	lsr.w	#8,d4					;$e04c			;ff91f4
	lsr.w	#1,d4					;$e24c			;ff91f6
	bcc.s	Lff91fe					;$6404			;ff91f8
	bset.l	#$10,d4					;$08c4,$0010		;ff91fa
Lff91fe:									;ff91fe
	andi.w	#$0007,d4				;$0244,$0007		;ff91fe
	btst.b	d4,($00ed0071)				;$0939,$00ed,$0071	;ff9202
	beq.s	Lff924c					;$6742			;ff9208
	movea.l	a1,a2					;$2449			;ff920a
	move.l	d3,d6					;$2c03			;ff920c
Lff920e:									;ff920e
	move.l	d6,d3					;$2606			;ff920e
	cmp.l	#$00000100,d3				;$b6bc,$0000,$0100	;ff9210
	bcs.s	Lff921e					;$6506			;ff9216
	move.l	#$00000100,d3				;$263c,$0000,$0100	;ff9218
Lff921e:									;ff921e
	lea.l	(-$0100,a4),a1				;$43ec,$ff00		;ff921e
	bsr.w	Lff917c					;$6100,$ff58		;ff9222
	move.l	d3,d5					;$2a03			;ff9226
	subq.l	#1,d5					;$5385			;ff9228
Lff922a:									;ff922a
	cmpm.b	(a1)+,(a2)+				;$b509			;ff922a
	bne.s	Lff9242					;$6614			;ff922c
	dbra.w	d5,Lff922a				;$51cd,$fffa		;ff922e
	addq.l	#1,d2					;$5282			;ff9232
	sub.l	d3,d6					;$9c83			;ff9234
	bhi.s	Lff920e					;$62d6			;ff9236
	moveq.l	#$00,d0					;$7000			;ff9238
Lff923a:									;ff923a
	movem.l	(a7)+,d1-d6/a1-a2			;$4cdf,$067e		;ff923a
	unlk	a4					;$4e5c			;ff923e
	rts						;$4e75			;ff9240

Lff9242:									;ff9242
	moveq.l	#$fe,d0					;$70fe			;ff9242
	ori.l	#$ffffff00,d0				;$0080,$ffff,$ff00	;ff9244
	bra.s	Lff923a					;$60ee			;ff924a
Lff924c:									;ff924c
	moveq.l	#$ff,d0					;$70ff			;ff924c
	bra.s	Lff923a					;$60ea			;ff924e
Lff9250:									;ff9250
	link.w	a4,#-$0100				;$4e54,$ff00		;ff9250
	movem.l	d1-d4/a1/a5,-(a7)			;$48e7,$7844		;ff9254
	moveq.l	#$00,d4					;$7800			;ff9258
	move.w	d1,d4					;$3801			;ff925a
	lsr.w	#8,d4					;$e04c			;ff925c
	lsr.w	#1,d4					;$e24c			;ff925e
	bcc.s	Lff9266					;$6404			;ff9260
	bset.l	#$10,d4					;$08c4,$0010		;ff9262
Lff9266:									;ff9266
	andi.w	#$0007,d4				;$0244,$0007		;ff9266
	btst.b	d4,($00ed0071)				;$0939,$00ed,$0071	;ff926a
	beq.s	Lff92b2					;$6740			;ff9270
	move.l	a1,d0					;$2009			;ff9272
	beq.s	Lff92bc					;$6746			;ff9274
Lff9276:									;ff9276
	moveq.l	#$0a,d3					;$760a			;ff9276
	bsr.w	Lffda2c					;$6100,$47b2		;ff9278
	btst.l	#$01,d0					;$0800,$0001		;ff927c
	bne.s	Lff92b4					;$6632			;ff9280
	lea.l	($09fe),a5				;$4bf8,$09fe		;ff9282
	move.w	d1,d0					;$3001			;ff9286
	ror.w	#8,d0					;$e058			;ff9288
	and.w	#$000f,d0				;$c07c,$000f		;ff928a
	adda.w	d0,a5					;$dac0			;ff928e
	moveq.l	#$28,d0					;$7028			;ff9290
	cmpi.b	#$07,($0003,a1)				;$0c29,$0007,$0003	;ff9292
	beq.s	Lff92a6					;$670c			;ff9298
	moveq.l	#$14,d0					;$7014			;ff929a
	cmpi.b	#$02,($0004,a1)				;$0c29,$0002,$0004	;ff929c
	beq.s	Lff92a6					;$6702			;ff92a2
	moveq.l	#$0a,d0					;$700a			;ff92a4
Lff92a6:									;ff92a6
	move.b	d0,(a5)					;$1a80			;ff92a6
	moveq.l	#$00,d0					;$7000			;ff92a8
Lff92aa:									;ff92aa
	movem.l	(a7)+,d1-d4/a1/a5			;$4cdf,$221e		;ff92aa
	unlk	a4					;$4e5c			;ff92ae
	rts						;$4e75			;ff92b0

Lff92b2:									;ff92b2
	moveq.l	#$ff,d0					;$70ff			;ff92b2
Lff92b4:									;ff92b4
	ori.l	#$ffffff00,d0				;$0080,$ffff,$ff00	;ff92b4
	bra.s	Lff92aa					;$60ee			;ff92ba
Lff92bc:									;ff92bc
	moveq.l	#$0a,d3					;$760a			;ff92bc
	lea.l	(Lff9330,pc),a1				;$43fa,$0070		;ff92be
	bsr.w	Lffda2c					;$6100,$4768		;ff92c2
	btst.l	#$01,d0					;$0800,$0001		;ff92c6
	bne.s	Lff92b4					;$66e8			;ff92ca
	lea.l	(-$0100,a4),a1				;$43ec,$ff00		;ff92cc
	moveq.l	#$04,d2					;$7404			;ff92d0
	moveq.l	#$01,d3					;$7601			;ff92d2
	moveq.l	#$00,d5					;$7a00			;ff92d4
	bsr.w	Lffd742					;$6100,$446a		;ff92d6
	btst.l	#$01,d0					;$0800,$0001		;ff92da
	bne.s	Lff92b4					;$66d4			;ff92de
	lea.l	(-$0100,a4),a2				;$45ec,$ff00		;ff92e0
	cmpi.l	#$5836384b,(a2)+			;$0c9a,$5836,$384b	;ff92e4
	bne.s	Lff92b4					;$66c8			;ff92ea
	lea.l	(Lff9312,pc),a1				;$43fa,$0024		;ff92ec
	move.l	(a2),d0					;$2012			;ff92f0
	cmp.l	#$00009fd9,d0				;$b0bc,$0000,$9fd9	;ff92f2
	bcs.w	Lff9276					;$6500,$ff7c		;ff92f8
	lea.l	($000a,a1),a1				;$43e9,$000a		;ff92fc
	cmp.l	#$00013d1d,d0				;$b0bc,$0001,$3d1d	;ff9300
	bcs.w	Lff9276					;$6500,$ff6e		;ff9306
	lea.l	($000a,a1),a1				;$43e9,$000a		;ff930a
	bra.w	Lff9276					;$6000,$ff66		;ff930e
Lff9312:									;ff9312
	.dc.b	$01,$01,$00,$03,$01,$35,$80,$00					;ff9312
	.dc.b	$00,$00,$01,$01,$00,$03,$02,$66					;ff931a
	.dc.b	$80,$00,$00,$00,$01,$01,$00,$07					;ff9322
	.dc.b	$02,$66,$80,$00,$00,$00						;ff932a
Lff9330:									;ff9330
	.dc.b	$01,$01,$00,$07,$02,$98,$80,$00					;ff9330
	.dc.b	$00,$00,$00,$0a							;ff9338
Lff933c:									;ff933c
	.dc.b	$00,$e9,$60,$20,$61,$00,$fd,$56					;ff933c
	.dc.b	$4e,$75								;ff9344
Lff9346:									;ff9346
	.dc.b	'SCSI',$00							;ff9346
Lff934b:									;ff934b
	.dc.b	$ff,$94,$be							;ff934b
Lff934e:									;ff934e
	.dc.b	$00,$ff,$cc,$b8,$48,$75,$6d,$61					;ff934e
	.dc.b	$6e,$36,$38,$6b,$61,$00,$01,$2c					;ff9356
	.dc.b	$4a,$80,$6a,$02,$70,$00,$28,$00					;ff935e
	.dc.b	$61,$00,$fd,$30,$09,$39,$00,$ed					;ff9366
	.dc.b	$00,$71,$66,$6e,$7c,$13,$61,$00					;ff936e
	.dc.b	$03,$0c,$52,$80,$66,$64,$70,$f5					;ff9376
	.dc.b	$72,$24,$4e,$4f,$4a,$80,$67,$5c					;ff937e
	.dc.b	$b0,$bc,$ff,$ff,$ff,$ff,$67,$4a					;ff9386
	.dc.b	$b0,$bc,$00,$00,$00,$08,$67,$42					;ff938e
	.dc.b	$b0,$bc,$00,$00,$00,$02,$66,$42					;ff9396
	.dc.b	$70,$f5,$72,$2c,$76,$03,$43,$f8					;ff939e
	.dc.b	$20,$00,$4e,$4f,$4a,$80,$66,$32					;ff93a6
	.dc.b	$43,$f8,$20,$00,$10,$11,$02,$00					;ff93ae
	.dc.b	$00,$70,$0c,$00,$00,$70,$66,$22					;ff93b6
	.dc.b	$10,$29,$00,$02,$67,$b0,$b0,$3c					;ff93be
	.dc.b	$00,$01,$67,$aa,$b0,$3c,$00,$06					;ff93c6
	.dc.b	$67,$a4,$b0,$3c,$00,$02,$67,$9e					;ff93ce
	.dc.b	$60,$08,$51,$ce,$00,$04,$60,$02					;ff93d6
	.dc.b	$60,$94								;ff93de
Lff93e0:									;ff93e0
	rts						;$4e75			;ff93e0

Lff93e2:									;ff93e2
	bsr.w	Lff967a					;$6100,$0296		;ff93e2
	addq.l	#1,d0					;$5280			;ff93e6
	bne.s	Lff93e0					;$66f6			;ff93e8
	lea.l	($2000),a1				;$43f8,$2000		;ff93ea
	moveq.l	#$f5,d0					;$70f5			;ff93ee
	moveq.l	#$20,d1					;$7220			;ff93f0
	moveq.l	#$01,d3					;$7601			;ff93f2
	trap	#15					;$4e4f			;ff93f4
	tst.l	d0					;$4a80			;ff93f6
	bne.s	Lff93e0					;$66e6			;ff93f8
	btst.b	#$06,($00ed0070)			;$0839,$0006,$00ed,$0070	;ff93fa
	bne.s	Lff9422					;$661e			;ff9402
	tst.b	(a1)					;$4a11			;ff9404
	beq.s	Lff9422					;$671a			;ff9406
	cmpi.b	#$04,(a1)				;$0c11,$0004		;ff9408
	beq.s	Lff9422					;$6714			;ff940c
	cmpi.b	#$05,(a1)				;$0c11,$0005		;ff940e
	beq.s	Lff9422					;$670e			;ff9412
	cmpi.b	#$07,(a1)				;$0c11,$0007		;ff9414
	beq.s	Lff9422					;$6708			;ff9418
	cmpi.b	#$84,(a1)				;$0c11,$0084		;ff941a
	beq.s	Lff9422					;$6702			;ff941e
	bra.s	Lff93e0					;$60be			;ff9420
Lff9422:									;ff9422
	moveq.l	#$f5,d0					;$70f5			;ff9422
	moveq.l	#$2b,d1					;$722b			;ff9424
	trap	#15					;$4e4f			;ff9426
	tst.l	d0					;$4a80			;ff9428
	bne.s	Lff93e0					;$66b4			;ff942a
	moveq.l	#$f5,d0					;$70f5			;ff942c
	moveq.l	#$25,d1					;$7225			;ff942e
	trap	#15					;$4e4f			;ff9430
	tst.l	d0					;$4a80			;ff9432
	bne.s	Lff93e0					;$66aa			;ff9434
	move.l	($0004,a1),d5				;$2a29,$0004		;ff9436
	lsr.l	#8,d5					;$e08d			;ff943a
	lsr.l	#1,d5					;$e28d			;ff943c
	moveq.l	#$00,d2					;$7400			;ff943e
	moveq.l	#$04,d3					;$7604			;ff9440
	bsr.w	Lff969c					;$6100,$0258		;ff9442
	moveq.l	#$f5,d0					;$70f5			;ff9446
	moveq.l	#$21,d1					;$7221			;ff9448
	trap	#15					;$4e4f			;ff944a
	tst.l	d0					;$4a80			;ff944c
	bne.s	Lff93e0					;$6690			;ff944e
	cmpi.l	#$58363853,($0000.w,a1)			;$0ca9,$5836,$3853,$0000	;ff9450
	bne.s	Lff93e0					;$6686			;ff9458
	cmpi.l	#$43534931,($0004,a1)			;$0ca9,$4353,$4931,$0004	;ff945a
	bne.w	Lff93e0					;$6600,$ff7c		;ff9462
	moveq.l	#$04,d2					;$7404			;ff9466
	moveq.l	#$04,d3					;$7604			;ff9468
	bsr.w	Lff969c					;$6100,$0230		;ff946a
	moveq.l	#$f5,d0					;$70f5			;ff946e
	moveq.l	#$21,d1					;$7221			;ff9470
	trap	#15					;$4e4f			;ff9472
	tst.l	d0					;$4a80			;ff9474
	bne.w	Lff93e0					;$6600,$ff68		;ff9476
	cmpi.b	#$60,(a1)				;$0c11,$0060		;ff947a
	bne.w	Lff93e0					;$6600,$ff60		;ff947e
	jsr	(a1)					;$4e91			;ff9482
	bra.w	Lff93e0					;$6000,$ff5a		;ff9484
Lff9488:									;ff9488
	IOCS	_BOOTINF				;$708e,$4e4f		;ff9488
	andi.l	#Lffffff,d0				;$0280,$00ff,$ffff	;ff948c
	cmp.l	#$00000100,d0				;$b0bc,$0000,$0100	;ff9492
	bcs.s	Lff94b2					;$6518			;ff9498
	movea.l	d0,a0					;$2040			;ff949a
	movea.l	(a0),a0					;$2050			;ff949c
	cmpi.l	#$53435349,(-$0014,a0)			;$0ca8,$5343,$5349,$ffec	;ff949e
	bne.s	Lff94b2					;$660a			;ff94a6
	andi.l	#$0000001f,d0				;$0280,$0000,$001f	;ff94a8
	lsr.l	#2,d0					;$e488			;ff94ae
	rts						;$4e75			;ff94b0

Lff94b2:									;ff94b2
	moveq.l	#$ff,d0					;$70ff			;ff94b2
	rts						;$4e75			;ff94b4

Lff94b6:									;ff94b6
	bset.b	d2,($0cc3)				;$05f8,$0cc3		;ff94b6
	addq.w	#1,d2					;$5242			;ff94ba
	bra.s	Lff94d2					;$6014			;ff94bc
Lff94be:									;ff94be
	movem.l	d0-d1/d3-d7/a0-a6,-(a7)			;$48e7,$dffe		;ff94be
	bsr.s	Lff9488					;$61c4			;ff94c2
	tst.l	d0					;$4a80			;ff94c4
	bmi.s	Lff94d0					;$6b08			;ff94c6
	move.b	d0,d7					;$1e00			;ff94c8
	cmpi.w	#$0008,d0				;$0c40,$0008		;ff94ca
	bcs.s	Lff94d2					;$6502			;ff94ce
Lff94d0:									;ff94d0
	moveq.l	#$ff,d7					;$7eff			;ff94d0
Lff94d2:									;ff94d2
	cmp.w	#$0008,d2				;$b47c,$0008		;ff94d2
	beq.w	Lff9634					;$6700,$015c		;ff94d6
	bsr.w	Lff967a					;$6100,$019e		;ff94da
	addq.l	#1,d0					;$5280			;ff94de
	bne.w	Lff9634					;$6600,$0152		;ff94e0
Lff94e4:									;ff94e4
	moveq.l	#$00,d4					;$7800			;ff94e4
	move.w	d2,d4					;$3802			;ff94e6
	btst.b	d4,($00ed0071)				;$0939,$00ed,$0071	;ff94e8
	bne.s	Lff94b6					;$66c6			;ff94ee
	btst.b	d4,($0cc3)				;$0938,$0cc3		;ff94f0
	bne.s	Lff94b6					;$66c0			;ff94f4
	move.b	($00ed0070),d0				;$1039,$00ed,$0070	;ff94f6
	andi.b	#$07,d0					;$0200,$0007		;ff94fc
	cmp.b	d4,d0					;$b004			;ff9500
	beq.s	Lff94b6					;$67b2			;ff9502
	moveq.l	#$f5,d0					;$70f5			;ff9504
	moveq.l	#$24,d1					;$7224			;ff9506
	trap	#15					;$4e4f			;ff9508
	cmp.l	#$00000002,d0				;$b0bc,$0000,$0002	;ff950a
	beq.s	Lff951e					;$670c			;ff9510
	cmp.l	#$00000008,d0				;$b0bc,$0000,$0008	;ff9512
	beq.s	Lff94e4					;$67ca			;ff9518
	tst.l	d0					;$4a80			;ff951a
	bne.s	Lff94b6					;$6698			;ff951c
Lff951e:									;ff951e
	moveq.l	#$f5,d0					;$70f5			;ff951e
	moveq.l	#$2c,d1					;$722c			;ff9520
	moveq.l	#$03,d3					;$7603			;ff9522
	trap	#15					;$4e4f			;ff9524
	tst.l	d0					;$4a80			;ff9526
	bne.s	Lff94b6					;$668c			;ff9528
	moveq.l	#$f5,d0					;$70f5			;ff952a
	moveq.l	#$20,d1					;$7220			;ff952c
	moveq.l	#$24,d3					;$7624			;ff952e
	trap	#15					;$4e4f			;ff9530
	tst.l	d0					;$4a80			;ff9532
	bne.w	Lff94b6					;$6600,$ff80		;ff9534
	btst.b	#$06,($00ed0070)			;$0839,$0006,$00ed,$0070	;ff9538
	bne.s	Lff9562					;$6620			;ff9540
	tst.b	(a1)					;$4a11			;ff9542
	beq.s	Lff9562					;$671c			;ff9544
	cmpi.b	#$04,(a1)				;$0c11,$0004		;ff9546
	beq.s	Lff9562					;$6716			;ff954a
	cmpi.b	#$05,(a1)				;$0c11,$0005		;ff954c
	beq.s	Lff9562					;$6710			;ff9550
	cmpi.b	#$07,(a1)				;$0c11,$0007		;ff9552
	beq.s	Lff9562					;$670a			;ff9556
	cmpi.b	#$84,(a1)				;$0c11,$0084		;ff9558
	beq.s	Lff9562					;$6704			;ff955c
	bra.w	Lff94b6					;$6000,$ff56		;ff955e
Lff9562:									;ff9562
	moveq.l	#$f5,d0					;$70f5			;ff9562
	moveq.l	#$25,d1					;$7225			;ff9564
	trap	#15					;$4e4f			;ff9566
	tst.l	d0					;$4a80			;ff9568
	bne.w	Lff94b6					;$6600,$ff4a		;ff956a
	move.l	d2,d6					;$2c02			;ff956e
	move.l	($0004,a1),d5				;$2a29,$0004		;ff9570
	lsr.l	#8,d5					;$e08d			;ff9574
	lsr.l	#1,d5					;$e28d			;ff9576
	moveq.l	#$08,d2					;$7408			;ff9578
	moveq.l	#$04,d3					;$7604			;ff957a
	bsr.w	Lff969c					;$6100,$011e		;ff957c
	moveq.l	#$f5,d0					;$70f5			;ff9580
	moveq.l	#$21,d1					;$7221			;ff9582
	trap	#15					;$4e4f			;ff9584
	move.l	d6,d2					;$2406			;ff9586
	tst.l	d0					;$4a80			;ff9588
	bne.w	Lff94b6					;$6600,$ff2a		;ff958a
	cmpi.l	#$5836384b,(a1)				;$0c91,$5836,$384b	;ff958e
	bne.w	Lff94b6					;$6600,$ff20		;ff9594
	swap.w	d2					;$4842			;ff9598
	cmp.b	d7,d4					;$b807			;ff959a
	bhi.s	Lff95a4					;$6206			;ff959c
	bsr.w	Lff9638					;$6100,$0098		;ff959e
	add.w	d3,d2					;$d443			;ff95a2
Lff95a4:									;ff95a4
	swap.w	d2					;$4842			;ff95a4
	move.l	d2,d6					;$2c02			;ff95a6
	moveq.l	#$00,d2					;$7400			;ff95a8
	moveq.l	#$04,d3					;$7604			;ff95aa
	bsr.w	Lff969c					;$6100,$00ee		;ff95ac
	moveq.l	#$f5,d0					;$70f5			;ff95b0
	moveq.l	#$21,d1					;$7221			;ff95b2
	trap	#15					;$4e4f			;ff95b4
	move.l	d6,d2					;$2406			;ff95b6
	tst.l	d0					;$4a80			;ff95b8
	bne.w	Lff94b6					;$6600,$fefa		;ff95ba
	cmpi.l	#$58363853,($0000.w,a1)			;$0ca9,$5836,$3853,$0000	;ff95be
	bne.w	Lff94b6					;$6600,$feee		;ff95c6
	cmpi.l	#$43534931,($0004,a1)			;$0ca9,$4353,$4931,$0004	;ff95ca
	bne.w	Lff94b6					;$6600,$fee2		;ff95d2
	moveq.l	#$0c,d2					;$740c			;ff95d6
	moveq.l	#$34,d3					;$7634			;ff95d8
	bsr.w	Lff969c					;$6100,$00c0		;ff95da
	moveq.l	#$f5,d0					;$70f5			;ff95de
	moveq.l	#$21,d1					;$7221			;ff95e0
	trap	#15					;$4e4f			;ff95e2
	move.l	d6,d2					;$2406			;ff95e4
	tst.l	d0					;$4a80			;ff95e6
	bne.w	Lff94b6					;$6600,$fecc		;ff95e8
Lff95ec:									;ff95ec
	cmpi.l	#$01534348,($000e,a1)			;$0ca9,$0153,$4348,$000e	;ff95ec
	bne.w	Lff94b6					;$6600,$fec0		;ff95f4
	cmpi.l	#$4449534b,($0012,a1)			;$0ca9,$4449,$534b,$0012	;ff95f8
	bne.w	Lff94b6					;$6600,$feb4		;ff9600
	move.l	a1,d0					;$2009			;ff9604
	add.l	d0,($0006,a1)				;$d1a9,$0006		;ff9606
	add.l	d0,($000a,a1)				;$d1a9,$000a		;ff960a
	move.l	(a1),d0					;$2011			;ff960e
	cmp.l	#$ffffffff,d0				;$b0bc,$ffff,$ffff	;ff9610
	beq.s	Lff9620					;$6708			;ff9616
	add.l	a1,d0					;$d089			;ff9618
	move.l	d0,(a1)					;$2280			;ff961a
	movea.l	d0,a1					;$2240			;ff961c
	bra.s	Lff95ec					;$60cc			;ff961e
Lff9620:									;ff9620
	swap.w	d2					;$4842			;ff9620
	move.b	d2,($0016,a1)				;$1342,$0016		;ff9622
	swap.w	d2					;$4842			;ff9626
	bclr.b	d2,($0cc3)				;$05b8,$0cc3		;ff9628
	addq.w	#1,d2					;$5242			;ff962c
Lff962e:									;ff962e
	movem.l	(a7)+,d0-d1/d3-d7/a0-a6			;$4cdf,$7ffb		;ff962e
	rts						;$4e75			;ff9632

Lff9634:									;ff9634
	moveq.l	#$ff,d2					;$74ff			;ff9634
	bra.s	Lff962e					;$60f6			;ff9636
Lff9638:									;ff9638
	movem.l	d1-d2/a1,-(a7)				;$48e7,$6040		;ff9638
	seq.b	d1					;$57c1			;ff963c
	moveq.l	#$0e,d2					;$740e			;ff963e
	moveq.l	#$00,d3					;$7600			;ff9640
Lff9642:									;ff9642
	lea.l	($0010,a1),a1				;$43e9,$0010		;ff9642
	tst.b	(a1)					;$4a11			;ff9646
	beq.s	Lff9670					;$6726			;ff9648
	cmpi.l	#$48756d61,(a1)				;$0c91,$4875,$6d61	;ff964a
	bne.s	Lff9670					;$661e			;ff9650
	cmpi.l	#$6e36386b,($0004,a1)			;$0ca9,$6e36,$386b,$0004	;ff9652
	bne.s	Lff9670					;$6614			;ff965a
	move.b	($0008,a1),d0				;$1029,$0008		;ff965c
	btst.l	#$00,d0					;$0800,$0000		;ff9660
	bne.s	Lff9670					;$660a			;ff9664
	addq.w	#1,d3					;$5243			;ff9666
	tst.b	d1					;$4a01			;ff9668
	beq.s	Lff9670					;$6704			;ff966a
	tst.b	d0					;$4a00			;ff966c
	beq.s	Lff9674					;$6704			;ff966e
Lff9670:									;ff9670
	dbra.w	d2,Lff9642				;$51ca,$ffd0		;ff9670
Lff9674:									;ff9674
	movem.l	(a7)+,d1-d2/a1				;$4cdf,$0206		;ff9674
	rts						;$4e75			;ff9678

Lff967a:									;ff967a
	moveq.l	#$ff,d0					;$70ff			;ff967a
	tst.b	($0cc2)					;$4a38,$0cc2		;ff967c
	bne.s	Lff969a					;$6618			;ff9680
	move.l	d4,-(a7)				;$2f04			;ff9682
	st.b	($0cc2)					;$50f8,$0cc2		;ff9684
	move.b	($00ed0070),d4				;$1839,$00ed,$0070	;ff9688
	andi.b	#$07,d4					;$0204,$0007		;ff968e
	moveq.l	#$f5,d0					;$70f5			;ff9692
	moveq.l	#$24,d1					;$7224			;ff9694
	trap	#15					;$4e4f			;ff9696
	move.l	(a7)+,d4				;$281f			;ff9698
Lff969a:									;ff969a
	rts						;$4e75			;ff969a

Lff969c:									;ff969c
	cmpi.w	#$0003,d5				;$0c45,$0003		;ff969c
	bcc.s	Lff96a8					;$6406			;ff96a0
	lsr.l	d5,d2					;$eaaa			;ff96a2
	lsr.l	d5,d3					;$eaab			;ff96a4
	rts						;$4e75			;ff96a6

Lff96a8:									;ff96a8
	lsr.l	#2,d2					;$e48a			;ff96a8
	lsr.l	#2,d3					;$e48b			;ff96aa
	rts						;$4e75			;ff96ac

Call_B_PUTC:									;ff96ae
	move.l	d1,-(a7)				;$2f01			;ff96ae
	bsr.w	Lff9872					;$6100,$01c0		;ff96b0
	move.l	(a7)+,d1				;$221f			;ff96b4
	move.l	($0974),d0				;$2038,$0974		;ff96b6
	rts						;$4e75			;ff96ba

Call_B_PRINT:									;ff96bc
	movem.l	d1/a2,-(a7)				;$48e7,$4020		;ff96bc
	lea.l	(Lff9872,pc),a2				;$45fa,$01b0		;ff96c0
	bra.s	Lff96c8					;$6002			;ff96c4
Lff96c6:									;ff96c6
	jsr	(a2)					;$4e92			;ff96c6
Lff96c8:									;ff96c8
	moveq.l	#$00,d1					;$7200			;ff96c8
	move.b	(a1)+,d1				;$1219			;ff96ca
	bne.s	Lff96c6					;$66f8			;ff96cc
	move.l	($0974),d0				;$2038,$0974		;ff96ce
	movem.l	(a7)+,d1/a2				;$4cdf,$0402		;ff96d2
	rts						;$4e75			;ff96d6

Call_B_COLOR:									;ff96d8
	moveq.l	#$00,d0					;$7000			;ff96d8
	lea.l	($0994),a0				;$41f8,$0994		;ff96da
	move.b	(a0),d0					;$1010			;ff96de
	cmp.w	#$ffff,d1				;$b27c,$ffff		;ff96e0
	beq.s	Lff96ee					;$6708			;ff96e4
	cmp.w	#$0010,d1				;$b27c,$0010		;ff96e6
	bcc.s	Lff96f0					;$6404			;ff96ea
	move.b	d1,(a0)					;$1081			;ff96ec
Lff96ee:									;ff96ee
	rts						;$4e75			;ff96ee

Lff96f0:									;ff96f0
	moveq.l	#$ff,d0					;$70ff			;ff96f0
	rts						;$4e75			;ff96f2

Call_B_LOCATE:									;ff96f4
	move.l	($0974),d0				;$2038,$0974		;ff96f4
	cmp.w	#$ffff,d1				;$b27c,$ffff		;ff96f8
	beq.s	Lff9720					;$6722			;ff96fc
	cmp.w	($0970),d1				;$b278,$0970		;ff96fe
	bhi.s	Lff96f0					;$62ec			;ff9702
	cmp.w	($0972),d2				;$b478,$0972		;ff9704
	bhi.s	Lff96f0					;$62e6			;ff9708
	bsr.w	Call_B_CUROFF				;$6100,$e2de		;ff970a
	move.l	d0,-(a7)				;$2f00			;ff970e
	move.w	d1,($0974)				;$31c1,$0974		;ff9710
	move.w	d2,($0976)				;$31c2,$0976		;ff9714
	bsr.w	Call_B_CURON				;$6100,$e2b4		;ff9718
	move.l	(a7)+,d0				;$201f			;ff971c
	rts						;$4e75			;ff971e

Lff9720:									;ff9720
	move.l	d0,d1					;$2200			;ff9720
	rts						;$4e75			;ff9722

Call_B_DOWN_S:									;ff9724
	bsr.w	Call_B_CUROFF				;$6100,$e2c4		;ff9724
	bsr.w	Lffa458					;$6100,$0d2e		;ff9728
	bra.w	Call_B_CURON				;$6000,$e2a0		;ff972c
Call_B_UP_S:									;ff9730
	bsr.w	Call_B_CUROFF				;$6100,$e2b8		;ff9730
	bsr.w	Lffa472					;$6100,$0d3c		;ff9734
	bra.w	Call_B_CURON				;$6000,$e294		;ff9738
Call_B_UP:									;ff973c
	move.l	d1,-(a7)				;$2f01			;ff973c
	bsr.w	Call_B_CUROFF				;$6100,$e2aa		;ff973e
	bsr.w	Lffa488					;$6100,$0d44		;ff9742
	bra.s	Lff976a					;$6022			;ff9746
Call_B_DOWN:									;ff9748
	move.l	d1,-(a7)				;$2f01			;ff9748
	bsr.w	Call_B_CUROFF				;$6100,$e29e		;ff974a
	bsr.w	Lffa4a4					;$6100,$0d54		;ff974e
	bra.s	Lff976a					;$6016			;ff9752
Call_B_RIGHT:									;ff9754
	move.l	d1,-(a7)				;$2f01			;ff9754
	bsr.w	Call_B_CUROFF				;$6100,$e292		;ff9756
	bsr.w	Lffa4c0					;$6100,$0d64		;ff975a
	bra.s	Lff976a					;$600a			;ff975e
Call_B_LEFT:									;ff9760
	move.l	d1,-(a7)				;$2f01			;ff9760
	bsr.w	Call_B_CUROFF				;$6100,$e286		;ff9762
	bsr.w	Lffa4d8					;$6100,$0d70		;ff9766
Lff976a:									;ff976a
	bsr.w	Call_B_CURON				;$6100,$e262		;ff976a
	move.l	(a7)+,d1				;$221f			;ff976e
	rts						;$4e75			;ff9770

Call_B_CLR_ST:									;ff9772
	movem.l	d1-d4/a1/a4,-(a7)			;$48e7,$7848		;ff9772
	bsr.w	Call_B_CUROFF				;$6100,$e272		;ff9776
	bsr.w	Lffa4ee					;$6100,$0d72		;ff977a
	bra.s	Lff978c					;$600c			;ff977e
Call_B_ERA_ST:									;ff9780
	movem.l	d1-d4/a1/a4,-(a7)			;$48e7,$7848		;ff9780
	bsr.w	Call_B_CUROFF				;$6100,$e264		;ff9784
	bsr.w	Lffa52c					;$6100,$0da2		;ff9788
Lff978c:									;ff978c
	bsr.w	Call_B_CURON				;$6100,$e240		;ff978c
	movem.l	(a7)+,d1-d4/a1/a4			;$4cdf,$121e		;ff9790
	rts						;$4e75			;ff9794

Call_B_INS:									;ff9796
	movem.l	d1-d7/a1-a4,-(a7)			;$48e7,$7f78		;ff9796
	bsr.w	Call_B_CUROFF				;$6100,$e24e		;ff979a
	bsr.w	Lffa5e0					;$6100,$0e40		;ff979e
	bra.s	Lff97b0					;$600c			;ff97a2
Call_B_DEL:									;ff97a4
	movem.l	d1-d7/a1-a4,-(a7)			;$48e7,$7f78		;ff97a4
	bsr.w	Call_B_CUROFF				;$6100,$e240		;ff97a8
	bsr.w	Lffa68a					;$6100,$0edc		;ff97ac
Lff97b0:									;ff97b0
	bsr.w	Call_B_CURON				;$6100,$e21c		;ff97b0
	movem.l	(a7)+,d1-d7/a1-a4			;$4cdf,$1efe		;ff97b4
	rts						;$4e75			;ff97b8

Call_B_CONSOL:									;ff97ba
	bsr.w	Call_B_CUROFF				;$6100,$e22e		;ff97ba
	move.l	($0948),d0				;$2038,$0948		;ff97be
	cmp.l	#$ffffffff,d1				;$b2bc,$ffff,$ffff	;ff97c2
	beq.s	Lff97ee					;$6724			;ff97c8
	and.l	#$03ff03ff,d1				;$c2bc,$03ff,$03ff	;ff97ca
	move.l	d1,d0					;$2001			;ff97d0
	clr.w	d0					;$4240			;ff97d2
	swap.w	d0					;$4840			;ff97d4
	lsr.w	#3,d0					;$e648			;ff97d6
	and.l	#$0000fffc,d1				;$c2bc,$0000,$fffc	;ff97d8
	lsl.l	#7,d1					;$ef89			;ff97de
	add.l	d0,d1					;$d280			;ff97e0
	move.l	($0948),d0				;$2038,$0948		;ff97e2
	move.l	d1,($0948)				;$21c1,$0948		;ff97e6
	clr.l	($0974)					;$42b8,$0974		;ff97ea
Lff97ee:									;ff97ee
	move.l	d0,d1					;$2200			;ff97ee
	and.w	#$fe00,d1				;$c27c,$fe00		;ff97f0
	lsr.l	#7,d1					;$ee89			;ff97f4
	and.l	#$0000007f,d0				;$c0bc,$0000,$007f	;ff97f6
	lsl.w	#3,d0					;$e748			;ff97fc
	swap.w	d0					;$4840			;ff97fe
	or.l	d0,d1					;$8280			;ff9800
	move.l	($0970),d0				;$2038,$0970		;ff9802
	cmp.l	#$ffffffff,d2				;$b4bc,$ffff,$ffff	;ff9806
	beq.s	Lff981c					;$670e			;ff980c
	and.l	#$007f003f,d2				;$c4bc,$007f,$003f	;ff980e
	move.l	d2,($0970)				;$21c2,$0970		;ff9814
	clr.l	($0974)					;$42b8,$0974		;ff9818
Lff981c:									;ff981c
	move.l	d0,d2					;$2400			;ff981c
	moveq.l	#$00,d0					;$7000			;ff981e
	bra.w	Call_B_CURON				;$6000,$e1ac		;ff9820
Call_B_PUTMES:									;ff9824
	moveq.l	#$00,d0					;$7000			;ff9824
	move.b	(a1)+,d0				;$1019			;ff9826
	bne.s	Lff982e					;$6604			;ff9828
	subq.l	#1,a1					;$5389			;ff982a
	moveq.l	#$20,d0					;$7020			;ff982c
Lff982e:									;ff982e
	cmp.b	#$fe,d0					;$b03c,$00fe		;ff982e
	bne.s	Lff9836					;$6602			;ff9832
	moveq.l	#$20,d0					;$7020			;ff9834
Lff9836:									;ff9836
	cmp.b	#$80,d0					;$b03c,$0080		;ff9836
	bcs.s	Lff9860					;$6524			;ff983a
	beq.s	Lff9854					;$6716			;ff983c
	cmp.b	#$a0,d0					;$b03c,$00a0		;ff983e
	bcs.s	Lff9850					;$650c			;ff9842
	cmp.b	#$e0,d0					;$b03c,$00e0		;ff9844
	bcs.s	Lff9860					;$6516			;ff9848
	cmp.b	#$f0,d0					;$b03c,$00f0		;ff984a
	bcc.s	Lff9854					;$6404			;ff984e
Lff9850:									;ff9850
	subq.w	#1,d4					;$5344			;ff9850
	bmi.s	Lff986a					;$6b16			;ff9852
Lff9854:									;ff9854
	asl.w	#8,d0					;$e140			;ff9854
	move.b	(a1)+,d0				;$1019			;ff9856
	bne.s	Lff9860					;$6606			;ff9858
	subq.l	#1,a1					;$5389			;ff985a
	move.w	#$8140,d0				;$303c,$8140		;ff985c
Lff9860:									;ff9860
	bsr.w	Lff9984					;$6100,$0122		;ff9860
	dbra.w	d4,Call_B_PUTMES			;$51cc,$ffbe		;ff9864
	rts						;$4e75			;ff9868

Lff986a:									;ff986a
	moveq.l	#$20,d0					;$7020			;ff986a
	bsr.w	Lff9984					;$6100,$0116		;ff986c
	rts						;$4e75			;ff9870

Lff9872:									;ff9872
	lea.l	($0990),a0				;$41f8,$0990		;ff9872
	move.b	(a0),d0					;$1010			;ff9876
	bne.s	Lff98a8					;$662e			;ff9878
	cmpi.w	#$001b,d1				;$0c41,$001b		;ff987a
	beq.s	Lff989c					;$671c			;ff987e
	cmpi.w	#$0100,d1				;$0c41,$0100		;ff9880
	bcc.s	Lff98b2					;$642c			;ff9884
	cmpi.b	#$80,d1					;$0c01,$0080		;ff9886
	bcs.s	Lff98b4					;$6528			;ff988a
	cmpi.b	#$a0,d1					;$0c01,$00a0		;ff988c
	bcs.s	Lff9898					;$6506			;ff9890
	cmpi.b	#$e0,d1					;$0c01,$00e0		;ff9892
	bcs.s	Lff98b4					;$651c			;ff9896
Lff9898:									;ff9898
	move.b	d1,(a0)					;$1081			;ff9898
	rts						;$4e75			;ff989a

Lff989c:									;ff989c
	move.b	d1,(a0)					;$1081			;ff989c
	lea.l	($0986),a0				;$41f8,$0986		;ff989e
	move.l	a0,($0982)				;$21c8,$0982		;ff98a2
	rts						;$4e75			;ff98a6

Lff98a8:									;ff98a8
	cmpi.b	#$1b,d0					;$0c00,$001b		;ff98a8
	bne.s	Lff9902					;$6654			;ff98ac
	bra.w	Lffa1ba					;$6000,$090a		;ff98ae
Lff98b2:									;ff98b2
	bra.s	Lff990a					;$6056			;ff98b2
Lff98b4:									;ff98b4
	movem.l	d2-d7/a0-a4,-(a7)			;$48e7,$3ff8		;ff98b4
	bsr.w	Call_B_CUROFF				;$6100,$e130		;ff98b8
	move.w	($0974),d6				;$3c38,$0974		;ff98bc
	move.w	($0976),d7				;$3e38,$0976		;ff98c0
	cmpi.w	#$0008,d1				;$0c41,$0008		;ff98c4
	beq.s	Lff98d0					;$6706			;ff98c8
	cmp.w	($0970),d6				;$bc78,$0970		;ff98ca
	bhi.s	Lff98fc					;$622c			;ff98ce
Lff98d0:									;ff98d0
	cmpi.w	#$0020,d1				;$0c41,$0020		;ff98d0
	bcs.w	Lff9d70					;$6500,$049a		;ff98d4
	moveq.l	#$08,d2					;$7408			;ff98d8
	movea.l	($0458),a1				;$2278,$0458		;ff98da
	jsr	(a1)					;$4e91			;ff98de
	movea.l	d0,a1					;$2240			;ff98e0
	sf.b	d4					;$51c4			;ff98e2
Lff98e4:									;ff98e4
	bsr.w	Lff99e8					;$6100,$0102		;ff98e4
	cmp.w	($0970),d6				;$bc78,$0970		;ff98e8
	ble.s	Lff98f0					;$6f02			;ff98ec
	bsr.s	Lff996a					;$617a			;ff98ee
Lff98f0:									;ff98f0
	addq.w	#1,($0974)				;$5278,$0974		;ff98f0
	movem.l	(a7)+,d2-d7/a0-a4			;$4cdf,$1ffc		;ff98f4
	bra.w	Call_B_CURON				;$6000,$e0d4		;ff98f8
Lff98fc:									;ff98fc
	pea.l	(Lff98d0,pc)				;$487a,$ffd2		;ff98fc
	bra.s	Lff996a					;$6068			;ff9900
Lff9902:									;ff9902
	clr.b	(a0)					;$4210			;ff9902
	lsl.w	#8,d0					;$e148			;ff9904
	move.b	d1,d0					;$1001			;ff9906
	move.w	d0,d1					;$3200			;ff9908
Lff990a:									;ff990a
	movem.l	d2-d7/a0-a4,-(a7)			;$48e7,$3ff8		;ff990a
	bsr.w	Call_B_CUROFF				;$6100,$e0da		;ff990e
	move.w	($0974),d6				;$3c38,$0974		;ff9912
	move.w	($0976),d7				;$3e38,$0976		;ff9916
	cmp.w	($0970),d6				;$bc78,$0970		;ff991a
	seq.b	d5					;$57c5			;ff991e
	bhi.s	Lff9966					;$6244			;ff9920
Lff9922:									;ff9922
	moveq.l	#$08,d2					;$7408			;ff9922
	movea.l	($0458),a1				;$2278,$0458		;ff9924
	jsr	(a1)					;$4e91			;ff9928
	movea.l	d0,a1					;$2240			;ff992a
	tst.w	d1					;$4a41			;ff992c
	sne.b	d4					;$56c4			;ff992e
	beq.s	Lff98e4					;$67b2			;ff9930
	tst.b	d5					;$4a05			;ff9932
	beq.s	Lff994a					;$6714			;ff9934
	movem.l	d4/a1,-(a7)				;$48e7,$0840		;ff9936
	lea.l	(Lff99d8,pc),a1				;$43fa,$009c		;ff993a
	moveq.l	#$00,d4					;$7800			;ff993e
	bsr.w	Lff99e8					;$6100,$00a6		;ff9940
	bsr.s	Lff996a					;$6124			;ff9944
	movem.l	(a7)+,d4/a1				;$4cdf,$0210		;ff9946
Lff994a:									;ff994a
	bsr.w	Lff99e8					;$6100,$009c		;ff994a
	move.w	($0970),d0				;$3038,$0970		;ff994e
	sub.w	d6,d0					;$9046			;ff9952
	subq.w	#1,d0					;$5340			;ff9954
	bcc.s	Lff995a					;$6402			;ff9956
	bsr.s	Lff996a					;$6110			;ff9958
Lff995a:									;ff995a
	addq.w	#2,($0974)				;$5478,$0974		;ff995a
	movem.l	(a7)+,d2-d7/a0-a4			;$4cdf,$1ffc		;ff995e
	bra.w	Call_B_CURON				;$6000,$e06a		;ff9962
Lff9966:									;ff9966
	pea.l	(Lff9922,pc)				;$487a,$ffba		;ff9966
Lff996a:									;ff996a
	moveq.l	#$00,d6					;$7c00			;ff996a
	move.w	d6,($0974)				;$31c6,$0974		;ff996c
	addq.w	#1,d7					;$5247			;ff9970
	cmp.w	($0972),d7				;$be78,$0972		;ff9972
	ble.s	Lff997e					;$6f06			;ff9976
	bsr.w	Lff9f7a					;$6100,$0600		;ff9978
	subq.w	#1,d7					;$5347			;ff997c
Lff997e:									;ff997e
	move.w	d7,($0976)				;$31c7,$0976		;ff997e
	rts						;$4e75			;ff9982

Lff9984:									;ff9984
	movem.l	d1-d7/a0-a4,-(a7)			;$48e7,$7ff8		;ff9984
	move.w	sr,-(a7)				;$40e7			;ff9988
	move.l	($0948),-(a7)				;$2f38,$0948		;ff998a
	move.b	($0994),-(a7)				;$1f38,$0994		;ff998e
	move.b	d1,($0994)				;$11c1,$0994		;ff9992
	cmp.w	#$0080,d2				;$b47c,$0080		;ff9996
	bcc.s	Lff99c4					;$6428			;ff999a
	cmp.w	#$0040,d3				;$b67c,$0040		;ff999c
	bcc.s	Lff99c4					;$6422			;ff99a0
	move.w	d2,d6					;$3c02			;ff99a2
	move.w	d3,d7					;$3e03			;ff99a4
	move.w	d0,d1					;$3200			;ff99a6
	moveq.l	#$08,d2					;$7408			;ff99a8
	movea.l	($0458),a1				;$2278,$0458		;ff99aa
	jsr	(a1)					;$4e91			;ff99ae
	movea.l	d0,a1					;$2240			;ff99b0
	move.w	d1,-(a7)				;$3f01			;ff99b2
	tst.w	d1					;$4a41			;ff99b4
	sne.b	d4					;$56c4			;ff99b6
	ori.w	#$0700,sr				;$007c,$0700		;ff99b8
	clr.l	($0948)					;$42b8,$0948		;ff99bc
	bsr.s	Lff99e8					;$6126			;ff99c0
	move.w	(a7)+,d0				;$301f			;ff99c2
Lff99c4:									;ff99c4
	move.b	(a7)+,($0994)				;$11df,$0994		;ff99c4
	move.l	(a7)+,($0948)				;$21df,$0948		;ff99c8
	move.w	(a7)+,sr				;$46df			;ff99cc
	movem.l	(a7)+,d1-d7/a0-a4			;$4cdf,$1ffe		;ff99ce
	addq.w	#1,d0					;$5240			;ff99d2
	add.w	d0,d2					;$d440			;ff99d4
	rts						;$4e75			;ff99d6

Lff99d8:									;ff99d8
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00					;ff99d8
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00					;ff99e0
Lff99e8:									;ff99e8
	link.w	a6,#-$0020				;$4e56,$ffe0		;ff99e8
	lea.l	($00e8002a),a3				;$47f9,$00e8,$002a	;ff99ec
	moveq.l	#$00,d0					;$7000			;ff99f2
	move.w	d7,d0					;$3007			;ff99f4
	swap.w	d0					;$4840			;ff99f6
	lsr.l	#5,d0					;$ea88			;ff99f8
	movea.l	d0,a2					;$2440			;ff99fa
	adda.w	d6,a2					;$d4c6			;ff99fc
	adda.l	($0948),a2				;$d5f8,$0948		;ff99fe
	adda.l	($0944),a2				;$d5f8,$0944		;ff9a02
	tst.b	d4					;$4a04			;ff9a06
	beq.s	Lff9a12					;$6708			;ff9a08
	move.l	a2,d0					;$200a			;ff9a0a
	lsr.w	#1,d0					;$e248			;ff9a0c
	bcs.s	Lff9a12					;$6502			;ff9a0e
	moveq.l	#$01,d4					;$7801			;ff9a10
Lff9a12:									;ff9a12
	moveq.l	#$02,d5					;$7a02			;ff9a12
	swap.w	d5					;$4845			;ff9a14
	moveq.l	#$00,d0					;$7000			;ff9a16
	move.b	($0994),d0				;$1038,$0994		;ff9a18
	and.w	#$000f,d0				;$c07c,$000f		;ff9a1c
	add.w	d0,d0					;$d040			;ff9a20
	move.w	(a3),-(a7)				;$3f13			;ff9a22
	jsr	(Lff9a2e,pc,d0.w)			;$4ebb,$0008		;ff9a24
	move.w	(a7)+,(a3)				;$369f			;ff9a28
	unlk	a6					;$4e5e			;ff9a2a
	rts						;$4e75			;ff9a2c

Lff9a2e:									;ff9a2e
	bra.s	Lff9a4e					;$601e			;ff9a2e
Lff9a30:									;ff9a30
	bra.s	Lff9ab0					;$607e			;ff9a30
Lff9a32:									;ff9a32
	bra.s	Lff9aa4					;$6070			;ff9a32
Lff9a34:									;ff9a34
	bra.s	Lff9a9e					;$6068			;ff9a34
Lff9a36:									;ff9a36
	bra.s	Lff9a4e					;$6016			;ff9a36
Lff9a38:									;ff9a38
	bra.s	Lff9a56					;$601c			;ff9a38
Lff9a3a:									;ff9a3a
	bra.s	Lff9a5e					;$6022			;ff9a3a
Lff9a3c:									;ff9a3c
	bra.s	Lff9a66					;$6028			;ff9a3c
Lff9a3e:									;ff9a3e
	bra.s	Lff9a4e					;$600e			;ff9a3e
Lff9a40:									;ff9a40
	bra.s	Lff9a6e					;$602c			;ff9a40
Lff9a42:									;ff9a42
	bra.s	Lff9a76					;$6032			;ff9a42
Lff9a44:									;ff9a44
	bra.s	Lff9a7e					;$6038			;ff9a44
Lff9a46:									;ff9a46
	bra.s	Lff9a4e					;$6006			;ff9a46
Lff9a48:									;ff9a48
	bra.s	Lff9a86					;$603c			;ff9a48
Lff9a4a:									;ff9a4a
	bra.s	Lff9a8e					;$6042			;ff9a4a
Lff9a4c:									;ff9a4c
	bra.s	Lff9a96					;$6048			;ff9a4c
Lff9a4e:									;ff9a4e
	move.w	#$0133,(a3)				;$36bc,$0133		;ff9a4e
	bra.w	Lff9bc6					;$6000,$0172		;ff9a52
Lff9a56:									;ff9a56
	pea.l	(Lff9ab0,pc)				;$487a,$0058		;ff9a56
	bra.w	Lff9d1e					;$6000,$02c2		;ff9a5a
Lff9a5e:									;ff9a5e
	pea.l	(Lff9aa4,pc)				;$487a,$0044		;ff9a5e
	bra.w	Lff9d1e					;$6000,$02ba		;ff9a62
Lff9a66:									;ff9a66
	pea.l	(Lff9a9e,pc)				;$487a,$0036		;ff9a66
	bra.w	Lff9d1e					;$6000,$02b2		;ff9a6a
Lff9a6e:									;ff9a6e
	pea.l	(Lff9ab0,pc)				;$487a,$0040		;ff9a6e
	bra.w	Lff9cd6					;$6000,$0262		;ff9a72
Lff9a76:									;ff9a76
	pea.l	(Lff9aa4,pc)				;$487a,$002c		;ff9a76
	bra.w	Lff9cd6					;$6000,$025a		;ff9a7a
Lff9a7e:									;ff9a7e
	pea.l	(Lff9a9e,pc)				;$487a,$001e		;ff9a7e
	bra.w	Lff9cd6					;$6000,$0252		;ff9a82
Lff9a86:									;ff9a86
	pea.l	(Lff9ab0,pc)				;$487a,$0028		;ff9a86
	bra.w	Lff9d1a					;$6000,$028e		;ff9a8a
Lff9a8e:									;ff9a8e
	pea.l	(Lff9aa4,pc)				;$487a,$0014		;ff9a8e
	bra.w	Lff9d1a					;$6000,$0286		;ff9a92
Lff9a96:									;ff9a96
	pea.l	(Lff9a9e,pc)				;$487a,$0006		;ff9a96
	bra.w	Lff9d1a					;$6000,$027e		;ff9a9a
Lff9a9e:									;ff9a9e
	move.w	#$0133,(a3)				;$36bc,$0133		;ff9a9e
	bra.s	Lff9abc					;$6018			;ff9aa2
Lff9aa4:									;ff9aa4
	move.w	#$0033,(a3)				;$36bc,$0033		;ff9aa4
	bsr.w	Lff9bc6					;$6100,$011c		;ff9aa8
	adda.l	d5,a2					;$d5c5			;ff9aac
	bra.s	Lff9abc					;$600c			;ff9aae
Lff9ab0:									;ff9ab0
	move.w	#$0033,(a3)				;$36bc,$0033		;ff9ab0
	bsr.s	Lff9abc					;$6106			;ff9ab4
	adda.l	d5,a2					;$d5c5			;ff9ab6
	bra.w	Lff9bc6					;$6000,$010c		;ff9ab8
Lff9abc:									;ff9abc
	tst.b	d4					;$4a04			;ff9abc
	beq.s	Lff9ac6					;$6706			;ff9abe
	bpl.s	Lff9b06					;$6a44			;ff9ac0
	bra.w	Lff9b46					;$6000,$0082		;ff9ac2
Lff9ac6:									;ff9ac6
	move.b	(a1)+,(a2)				;$1499			;ff9ac6
	move.b	(a1)+,($0080,a2)			;$1559,$0080		;ff9ac8
	move.b	(a1)+,($0100,a2)			;$1559,$0100		;ff9acc
	move.b	(a1)+,($0180,a2)			;$1559,$0180		;ff9ad0
	move.b	(a1)+,($0200,a2)			;$1559,$0200		;ff9ad4
	move.b	(a1)+,($0280,a2)			;$1559,$0280		;ff9ad8
	move.b	(a1)+,($0300,a2)			;$1559,$0300		;ff9adc
	move.b	(a1)+,($0380,a2)			;$1559,$0380		;ff9ae0
	move.b	(a1)+,($0400,a2)			;$1559,$0400		;ff9ae4
	move.b	(a1)+,($0480,a2)			;$1559,$0480		;ff9ae8
	move.b	(a1)+,($0500,a2)			;$1559,$0500		;ff9aec
	move.b	(a1)+,($0580,a2)			;$1559,$0580		;ff9af0
	move.b	(a1)+,($0600,a2)			;$1559,$0600		;ff9af4
	move.b	(a1)+,($0680,a2)			;$1559,$0680		;ff9af8
	move.b	(a1)+,($0700,a2)			;$1559,$0700		;ff9afc
	move.b	(a1)+,($0780,a2)			;$1559,$0780		;ff9b00
	rts						;$4e75			;ff9b04

Lff9b06:									;ff9b06
	move.w	(a1)+,(a2)				;$3499			;ff9b06
	move.w	(a1)+,($0080,a2)			;$3559,$0080		;ff9b08
	move.w	(a1)+,($0100,a2)			;$3559,$0100		;ff9b0c
	move.w	(a1)+,($0180,a2)			;$3559,$0180		;ff9b10
	move.w	(a1)+,($0200,a2)			;$3559,$0200		;ff9b14
	move.w	(a1)+,($0280,a2)			;$3559,$0280		;ff9b18
	move.w	(a1)+,($0300,a2)			;$3559,$0300		;ff9b1c
	move.w	(a1)+,($0380,a2)			;$3559,$0380		;ff9b20
	move.w	(a1)+,($0400,a2)			;$3559,$0400		;ff9b24
	move.w	(a1)+,($0480,a2)			;$3559,$0480		;ff9b28
	move.w	(a1)+,($0500,a2)			;$3559,$0500		;ff9b2c
	move.w	(a1)+,($0580,a2)			;$3559,$0580		;ff9b30
	move.w	(a1)+,($0600,a2)			;$3559,$0600		;ff9b34
	move.w	(a1)+,($0680,a2)			;$3559,$0680		;ff9b38
	move.w	(a1)+,($0700,a2)			;$3559,$0700		;ff9b3c
	move.w	(a1)+,($0780,a2)			;$3559,$0780		;ff9b40
	rts						;$4e75			;ff9b44

Lff9b46:									;ff9b46
	move.b	(a1)+,(a2)				;$1499			;ff9b46
	move.b	(a1)+,($0001,a2)			;$1559,$0001		;ff9b48
	move.b	(a1)+,($0080,a2)			;$1559,$0080		;ff9b4c
	move.b	(a1)+,($0081,a2)			;$1559,$0081		;ff9b50
	move.b	(a1)+,($0100,a2)			;$1559,$0100		;ff9b54
	move.b	(a1)+,($0101,a2)			;$1559,$0101		;ff9b58
	move.b	(a1)+,($0180,a2)			;$1559,$0180		;ff9b5c
	move.b	(a1)+,($0181,a2)			;$1559,$0181		;ff9b60
	move.b	(a1)+,($0200,a2)			;$1559,$0200		;ff9b64
	move.b	(a1)+,($0201,a2)			;$1559,$0201		;ff9b68
	move.b	(a1)+,($0280,a2)			;$1559,$0280		;ff9b6c
	move.b	(a1)+,($0281,a2)			;$1559,$0281		;ff9b70
	move.b	(a1)+,($0300,a2)			;$1559,$0300		;ff9b74
	move.b	(a1)+,($0301,a2)			;$1559,$0301		;ff9b78
	move.b	(a1)+,($0380,a2)			;$1559,$0380		;ff9b7c
	move.b	(a1)+,($0381,a2)			;$1559,$0381		;ff9b80
	move.b	(a1)+,($0400,a2)			;$1559,$0400		;ff9b84
	move.b	(a1)+,($0401,a2)			;$1559,$0401		;ff9b88
	move.b	(a1)+,($0480,a2)			;$1559,$0480		;ff9b8c
	move.b	(a1)+,($0481,a2)			;$1559,$0481		;ff9b90
	move.b	(a1)+,($0500,a2)			;$1559,$0500		;ff9b94
	move.b	(a1)+,($0501,a2)			;$1559,$0501		;ff9b98
	move.b	(a1)+,($0580,a2)			;$1559,$0580		;ff9b9c
	move.b	(a1)+,($0581,a2)			;$1559,$0581		;ff9ba0
	move.b	(a1)+,($0600,a2)			;$1559,$0600		;ff9ba4
	move.b	(a1)+,($0601,a2)			;$1559,$0601		;ff9ba8
	move.b	(a1)+,($0680,a2)			;$1559,$0680		;ff9bac
	move.b	(a1)+,($0681,a2)			;$1559,$0681		;ff9bb0
	move.b	(a1)+,($0700,a2)			;$1559,$0700		;ff9bb4
	move.b	(a1)+,($0701,a2)			;$1559,$0701		;ff9bb8
	move.b	(a1)+,($0780,a2)			;$1559,$0780		;ff9bbc
	move.b	(a1)+,($0781,a2)			;$1559,$0781		;ff9bc0
	rts						;$4e75			;ff9bc4

Lff9bc6:									;ff9bc6
	tst.b	d4					;$4a04			;ff9bc6
	beq.s	Lff9bd0					;$6706			;ff9bc8
	bpl.s	Lff9c12					;$6a46			;ff9bca
	bra.w	Lff9c54					;$6000,$0086		;ff9bcc
Lff9bd0:									;ff9bd0
	moveq.l	#$00,d0					;$7000			;ff9bd0
	move.b	d0,(a2)					;$1480			;ff9bd2
	move.b	d0,($0080,a2)				;$1540,$0080		;ff9bd4
	move.b	d0,($0100,a2)				;$1540,$0100		;ff9bd8
	move.b	d0,($0180,a2)				;$1540,$0180		;ff9bdc
	move.b	d0,($0200,a2)				;$1540,$0200		;ff9be0
	move.b	d0,($0280,a2)				;$1540,$0280		;ff9be4
	move.b	d0,($0300,a2)				;$1540,$0300		;ff9be8
	move.b	d0,($0380,a2)				;$1540,$0380		;ff9bec
	move.b	d0,($0400,a2)				;$1540,$0400		;ff9bf0
	move.b	d0,($0480,a2)				;$1540,$0480		;ff9bf4
	move.b	d0,($0500,a2)				;$1540,$0500		;ff9bf8
	move.b	d0,($0580,a2)				;$1540,$0580		;ff9bfc
	move.b	d0,($0600,a2)				;$1540,$0600		;ff9c00
	move.b	d0,($0680,a2)				;$1540,$0680		;ff9c04
	move.b	d0,($0700,a2)				;$1540,$0700		;ff9c08
	move.b	d0,($0780,a2)				;$1540,$0780		;ff9c0c
	rts						;$4e75			;ff9c10

Lff9c12:									;ff9c12
	moveq.l	#$00,d0					;$7000			;ff9c12
	move.w	d0,(a2)					;$3480			;ff9c14
	move.w	d0,($0080,a2)				;$3540,$0080		;ff9c16
	move.w	d0,($0100,a2)				;$3540,$0100		;ff9c1a
	move.w	d0,($0180,a2)				;$3540,$0180		;ff9c1e
	move.w	d0,($0200,a2)				;$3540,$0200		;ff9c22
	move.w	d0,($0280,a2)				;$3540,$0280		;ff9c26
	move.w	d0,($0300,a2)				;$3540,$0300		;ff9c2a
	move.w	d0,($0380,a2)				;$3540,$0380		;ff9c2e
	move.w	d0,($0400,a2)				;$3540,$0400		;ff9c32
	move.w	d0,($0480,a2)				;$3540,$0480		;ff9c36
	move.w	d0,($0500,a2)				;$3540,$0500		;ff9c3a
	move.w	d0,($0580,a2)				;$3540,$0580		;ff9c3e
	move.w	d0,($0600,a2)				;$3540,$0600		;ff9c42
	move.w	d0,($0680,a2)				;$3540,$0680		;ff9c46
	move.w	d0,($0700,a2)				;$3540,$0700		;ff9c4a
	move.w	d0,($0780,a2)				;$3540,$0780		;ff9c4e
	rts						;$4e75			;ff9c52

Lff9c54:									;ff9c54
	moveq.l	#$00,d0					;$7000			;ff9c54
	move.b	d0,(a2)					;$1480			;ff9c56
	move.b	d0,($0080,a2)				;$1540,$0080		;ff9c58
	move.b	d0,($0100,a2)				;$1540,$0100		;ff9c5c
	move.b	d0,($0180,a2)				;$1540,$0180		;ff9c60
	move.b	d0,($0200,a2)				;$1540,$0200		;ff9c64
	move.b	d0,($0280,a2)				;$1540,$0280		;ff9c68
	move.b	d0,($0300,a2)				;$1540,$0300		;ff9c6c
	move.b	d0,($0380,a2)				;$1540,$0380		;ff9c70
	move.b	d0,($0400,a2)				;$1540,$0400		;ff9c74
	move.b	d0,($0480,a2)				;$1540,$0480		;ff9c78
	move.b	d0,($0500,a2)				;$1540,$0500		;ff9c7c
	move.b	d0,($0580,a2)				;$1540,$0580		;ff9c80
	move.b	d0,($0600,a2)				;$1540,$0600		;ff9c84
	move.b	d0,($0680,a2)				;$1540,$0680		;ff9c88
	move.b	d0,($0700,a2)				;$1540,$0700		;ff9c8c
	move.b	d0,($0780,a2)				;$1540,$0780		;ff9c90
	move.b	d0,($0001,a2)				;$1540,$0001		;ff9c94
	move.b	d0,($0081,a2)				;$1540,$0081		;ff9c98
	move.b	d0,($0101,a2)				;$1540,$0101		;ff9c9c
	move.b	d0,($0181,a2)				;$1540,$0181		;ff9ca0
	move.b	d0,($0201,a2)				;$1540,$0201		;ff9ca4
	move.b	d0,($0281,a2)				;$1540,$0281		;ff9ca8
	move.b	d0,($0301,a2)				;$1540,$0301		;ff9cac
	move.b	d0,($0381,a2)				;$1540,$0381		;ff9cb0
	move.b	d0,($0401,a2)				;$1540,$0401		;ff9cb4
	move.b	d0,($0481,a2)				;$1540,$0481		;ff9cb8
	move.b	d0,($0501,a2)				;$1540,$0501		;ff9cbc
	move.b	d0,($0581,a2)				;$1540,$0581		;ff9cc0
	move.b	d0,($0601,a2)				;$1540,$0601		;ff9cc4
	move.b	d0,($0681,a2)				;$1540,$0681		;ff9cc8
	move.b	d0,($0701,a2)				;$1540,$0701		;ff9ccc
	move.b	d0,($0781,a2)				;$1540,$0781		;ff9cd0
	rts						;$4e75			;ff9cd4

Lff9cd6:									;ff9cd6
	bsr.s	Lff9d00					;$6128			;ff9cd6
Lff9cd8:									;ff9cd8
	movea.l	a1,a0					;$2049			;ff9cd8
	movem.l	(a0),d0-d3				;$4cd0,$000f		;ff9cda
	not.l	d0					;$4680			;ff9cde
	not.l	d1					;$4681			;ff9ce0
	not.l	d2					;$4682			;ff9ce2
	not.l	d3					;$4683			;ff9ce4
	movem.l	d0-d3,(a0)				;$48d0,$000f		;ff9ce6
	movem.l	($0010,a0),d0-d3			;$4ce8,$000f,$0010	;ff9cea
	not.l	d0					;$4680			;ff9cf0
	not.l	d1					;$4681			;ff9cf2
	not.l	d2					;$4682			;ff9cf4
	not.l	d3					;$4683			;ff9cf6
	movem.l	d0-d3,($0010,a0)			;$48e8,$000f,$0010	;ff9cf8
	rts						;$4e75			;ff9cfe

Lff9d00:									;ff9d00
	lea.l	(-$0020,a6),a0				;$41ee,$ffe0		;ff9d00
	move.l	a0,d0					;$2008			;ff9d04
	move.l	(a1)+,(a0)+				;$20d9			;ff9d06
	move.l	(a1)+,(a0)+				;$20d9			;ff9d08
	move.l	(a1)+,(a0)+				;$20d9			;ff9d0a
	move.l	(a1)+,(a0)+				;$20d9			;ff9d0c
	move.l	(a1)+,(a0)+				;$20d9			;ff9d0e
	move.l	(a1)+,(a0)+				;$20d9			;ff9d10
	move.l	(a1)+,(a0)+				;$20d9			;ff9d12
	move.l	(a1)+,(a0)+				;$20d9			;ff9d14
	movea.l	d0,a1					;$2240			;ff9d16
	rts						;$4e75			;ff9d18

Lff9d1a:									;ff9d1a
	bsr.s	Lff9d1e					;$6102			;ff9d1a
	bra.s	Lff9cd8					;$60ba			;ff9d1c
Lff9d1e:									;ff9d1e
	move.l	d5,-(a7)				;$2f05			;ff9d1e
	bsr.s	Lff9d00					;$61de			;ff9d20
	move.l	#$7fff7fff,d5				;$2a3c,$7fff,$7fff	;ff9d22
	tst.b	d4					;$4a04			;ff9d28
	bne.s	Lff9d32					;$6606			;ff9d2a
	move.l	#$7f7f7f7f,d5				;$2a3c,$7f7f,$7f7f	;ff9d2c
Lff9d32:									;ff9d32
	movea.l	a1,a0					;$2049			;ff9d32
	movem.l	(a0),d0-d3				;$4cd0,$000f		;ff9d34
	lsr.l	#1,d0					;$e288			;ff9d38
	lsr.l	#1,d1					;$e289			;ff9d3a
	lsr.l	#1,d2					;$e28a			;ff9d3c
	lsr.l	#1,d3					;$e28b			;ff9d3e
	and.l	d5,d0					;$c085			;ff9d40
	and.l	d5,d1					;$c285			;ff9d42
	and.l	d5,d2					;$c485			;ff9d44
	and.l	d5,d3					;$c685			;ff9d46
	or.l	d0,(a0)+				;$8198			;ff9d48
	or.l	d1,(a0)+				;$8398			;ff9d4a
	or.l	d2,(a0)+				;$8598			;ff9d4c
	or.l	d3,(a0)+				;$8798			;ff9d4e
	movem.l	(a0),d0-d3				;$4cd0,$000f		;ff9d50
	lsr.l	#1,d0					;$e288			;ff9d54
	lsr.l	#1,d1					;$e289			;ff9d56
	lsr.l	#1,d2					;$e28a			;ff9d58
	lsr.l	#1,d3					;$e28b			;ff9d5a
	and.l	d5,d0					;$c085			;ff9d5c
	and.l	d5,d1					;$c285			;ff9d5e
	and.l	d5,d2					;$c485			;ff9d60
	and.l	d5,d3					;$c685			;ff9d62
	or.l	d0,(a0)+				;$8198			;ff9d64
	or.l	d1,(a0)+				;$8398			;ff9d66
	or.l	d2,(a0)+				;$8598			;ff9d68
	or.l	d3,(a0)+				;$8798			;ff9d6a
	move.l	(a7)+,d5				;$2a1f			;ff9d6c
	rts						;$4e75			;ff9d6e

Lff9d70:									;ff9d70
	cmpi.b	#$07,d1					;$0c01,$0007		;ff9d70
	beq.s	Lff9db8					;$6742			;ff9d74
	bcs.s	Lff9da8					;$6530			;ff9d76
	lea.l	($0974),a0				;$41f8,$0974		;ff9d78
	lea.l	($0976),a1				;$43f8,$0976		;ff9d7c
	cmpi.b	#$09,d1					;$0c01,$0009		;ff9d80
	bcs.s	Lff9dde					;$6558			;ff9d84
	beq.s	Lff9df2					;$676a			;ff9d86
	cmpi.b	#$0b,d1					;$0c01,$000b		;ff9d88
	bcs.w	Lff9e28					;$6500,$009a		;ff9d8c
	beq.s	Lff9e04					;$6772			;ff9d90
	cmpi.b	#$0d,d1					;$0c01,$000d		;ff9d92
	bcs.s	Lff9e0c					;$6574			;ff9d96
	beq.w	Lff9e22					;$6700,$0088		;ff9d98
	cmpi.b	#$1a,d1					;$0c01,$001a		;ff9d9c
	beq.s	Lff9e18					;$6776			;ff9da0
	cmpi.b	#$1e,d1					;$0c01,$001e		;ff9da2
	beq.s	Lff9e20					;$6778			;ff9da6
Lff9da8:									;ff9da8
	movem.l	(a7)+,d2-d7/a0-a4			;$4cdf,$1ffc		;ff9da8
	bra.w	Call_B_CURON				;$6000,$dc20		;ff9dac
Lff9db0:									;ff9db0
	movea.l	($0d12),a0				;$2078,$0d12		;ff9db0
	jsr	(a0)					;$4e90			;ff9db4
	bra.s	Lff9da8					;$60f0			;ff9db6
Lff9db8:									;ff9db8
	move.l	($0978),d0				;$2038,$0978		;ff9db8
	addq.l	#1,d0					;$5280			;ff9dbc
	beq.s	Lff9db0					;$67f0			;ff9dbe
	moveq.l	#$00,d2					;$7400			;ff9dc0
	move.w	($097c),d2				;$3438,$097c		;ff9dc2
	beq.s	Lff9da8					;$67e0			;ff9dc6
	move.l	d1,-(a7)				;$2f01			;ff9dc8
	movea.l	($0978),a1				;$2278,$0978		;ff9dca
	move.w	#$0403,d1				;$323c,$0403		;ff9dce
	moveq.l	#$00,d0					;$7000			;ff9dd2
	movea.l	($0580),a0				;$2078,$0580		;ff9dd4
	jsr	(a0)					;$4e90			;ff9dd8
	move.l	(a7)+,d1				;$221f			;ff9dda
	bra.s	Lff9da8					;$60ca			;ff9ddc
Lff9dde:									;ff9dde
	tst.w	(a0)					;$4a50			;ff9dde
	beq.s	Lff9de6					;$6704			;ff9de0
	subq.w	#1,(a0)					;$5350			;ff9de2
	bra.s	Lff9da8					;$60c2			;ff9de4
Lff9de6:									;ff9de6
	tst.w	(a1)					;$4a51			;ff9de6
	beq.s	Lff9da8					;$67be			;ff9de8
	move.w	($0970),(a0)				;$30b8,$0970		;ff9dea
	subq.w	#1,(a1)					;$5351			;ff9dee
	bra.s	Lff9da8					;$60b6			;ff9df0
Lff9df2:									;ff9df2
	move.w	(a0),d0					;$3010			;ff9df2
	addq.w	#8,d0					;$5040			;ff9df4
	and.w	#$fff8,d0				;$c07c,$fff8		;ff9df6
	cmp.w	($0970),d0				;$b078,$0970		;ff9dfa
	bhi.s	Lff9e26					;$6226			;ff9dfe
	move.w	d0,(a0)					;$3080			;ff9e00
	bra.s	Lff9da8					;$60a4			;ff9e02
Lff9e04:									;ff9e04
	tst.w	(a1)					;$4a51			;ff9e04
	beq.s	Lff9da8					;$67a0			;ff9e06
	subq.w	#1,(a1)					;$5351			;ff9e08
	bra.s	Lff9da8					;$609c			;ff9e0a
Lff9e0c:									;ff9e0c
	cmp.w	($0970),d6				;$bc78,$0970		;ff9e0c
	ble.s	Lff9e14					;$6f02			;ff9e10
	bsr.s	Lff9e26					;$6112			;ff9e12
Lff9e14:									;ff9e14
	addq.w	#1,(a0)					;$5250			;ff9e14
	bra.s	Lff9da8					;$6090			;ff9e16
Lff9e18:									;ff9e18
	bsr.s	Lff9e60					;$6146			;ff9e18
	clr.l	($0974)					;$42b8,$0974		;ff9e1a
	bra.s	Lff9da8					;$6088			;ff9e1e
Lff9e20:									;ff9e20
	clr.w	(a1)					;$4251			;ff9e20
Lff9e22:									;ff9e22
	clr.w	(a0)					;$4250			;ff9e22
	bra.s	Lff9da8					;$6082			;ff9e24
Lff9e26:									;ff9e26
	clr.w	(a0)					;$4250			;ff9e26
Lff9e28:									;ff9e28
	addq.w	#1,d7					;$5247			;ff9e28
	cmp.w	($0972),d7				;$be78,$0972		;ff9e2a
	ble.s	Lff9e36					;$6f06			;ff9e2e
	bsr.w	Lff9f7a					;$6100,$0148		;ff9e30
	subq.w	#1,d7					;$5347			;ff9e34
Lff9e36:									;ff9e36
	move.w	d7,(a1)					;$3287			;ff9e36
	movem.l	(a7)+,d2-d7/a0-a4			;$4cdf,$1ffc		;ff9e38
	bra.w	Call_B_CURON				;$6000,$db90		;ff9e3c
Lff9e40:									;ff9e40
	movem.l	d1-d7/a1-a3,-(a7)			;$48e7,$7f70		;ff9e40
	lsl.l	#7,d1					;$ef89			;ff9e44
	lsl.l	#4,d1					;$e989			;ff9e46
	add.l	($0944),d1				;$d2b8,$0944		;ff9e48
	add.l	($0948),d1				;$d2b8,$0948		;ff9e4c
	movea.l	d1,a1					;$2241			;ff9e50
	moveq.l	#$00,d4					;$7800			;ff9e52
	move.w	d0,d4					;$3800			;ff9e54
	bra.s	Lff9e74					;$601c			;ff9e56
Lff9e58:									;ff9e58
	movem.l	d1-d7/a1-a3,-(a7)			;$48e7,$7f70		;ff9e58
	movea.l	a0,a1					;$2248			;ff9e5c
	bra.s	Lff9e78					;$6018			;ff9e5e
Lff9e60:									;ff9e60
	movem.l	d1-d7/a1-a3,-(a7)			;$48e7,$7f70		;ff9e60
	movea.l	($0944),a1				;$2278,$0944		;ff9e64
	adda.l	($0948),a1				;$d3f8,$0948		;ff9e68
	moveq.l	#$00,d4					;$7800			;ff9e6c
	move.w	($0972),d4				;$3838,$0972		;ff9e6e
	addq.w	#1,d4					;$5244			;ff9e72
Lff9e74:									;ff9e74
	lsl.l	#4,d4					;$e98c			;ff9e74
	subq.w	#1,d4					;$5344			;ff9e76
Lff9e78:									;ff9e78
	move.w	($0970),d3				;$3638,$0970		;ff9e78
	addq.w	#1,d3					;$5243			;ff9e7c
	lea.l	($00e8002a),a3				;$47f9,$00e8,$002a	;ff9e7e
	bset.b	#$00,(a3)				;$08d3,$0000		;ff9e84
	moveq.l	#$00,d6					;$7c00			;ff9e88
	moveq.l	#$ff,d7					;$7eff			;ff9e8a
	move.b	($0994),d1				;$1238,$0994		;ff9e8c
	btst.l	#$03,d1					;$0801,$0003		;ff9e90
	beq.s	Lff9ec6					;$6730			;ff9e94
	and.b	#$03,d1					;$c23c,$0003		;ff9e96
	beq.s	Lff9ec6					;$672a			;ff9e9a
	cmp.b	#$03,d1					;$b23c,$0003		;ff9e9c
	beq.s	Lff9ec4					;$6722			;ff9ea0
	movea.l	a1,a2					;$2449			;ff9ea2
	adda.l	#$00020000,a2				;$d5fc,$0002,$0000	;ff9ea4
	bclr.b	#$00,(a3)				;$0893,$0000		;ff9eaa
	cmp.b	#$02,d1					;$b23c,$0002		;ff9eae
	beq.s	Lff9eb6					;$6702			;ff9eb2
	exg.l	d6,d7					;$cd47			;ff9eb4
Lff9eb6:									;ff9eb6
	move.w	d4,-(a7)				;$3f04			;ff9eb6
	bsr.s	Lff9ed2					;$6118			;ff9eb8
	move.w	(a7)+,d4				;$381f			;ff9eba
	movea.l	a2,a1					;$224a			;ff9ebc
	move.l	d7,d6					;$2c07			;ff9ebe
	bsr.s	Lff9ed2					;$6110			;ff9ec0
	bra.s	Lff9ecc					;$6008			;ff9ec2
Lff9ec4:									;ff9ec4
	moveq.l	#$ff,d6					;$7cff			;ff9ec4
Lff9ec6:									;ff9ec6
	bsr.s	Lff9ed2					;$610a			;ff9ec6
	bclr.b	#$00,(a3)				;$0893,$0000		;ff9ec8
Lff9ecc:									;ff9ecc
	movem.l	(a7)+,d1-d7/a1-a3			;$4cdf,$0efe		;ff9ecc
	rts						;$4e75			;ff9ed0

Lff9ed2:									;ff9ed2
	move.w	#$0080,d2				;$343c,$0080		;ff9ed2
	sub.w	d3,d2					;$9443			;ff9ed6
Lff9ed8:									;ff9ed8
	move.w	d3,d1					;$3203			;ff9ed8
	move.l	a1,d0					;$2009			;ff9eda
	lsr.w	#1,d0					;$e248			;ff9edc
	bcc.s	Lff9ee4					;$6404			;ff9ede
	move.b	d6,(a1)+				;$12c6			;ff9ee0
	subq.w	#1,d1					;$5341			;ff9ee2
Lff9ee4:									;ff9ee4
	move.w	d1,d5					;$3a01			;ff9ee4
	lsr.w	#2,d1					;$e449			;ff9ee6
	add.w	d1,d1					;$d241			;ff9ee8
	moveq.l	#$20,d0					;$7020			;ff9eea
	lea.l	(Lff9ef0,pc),a0				;$41fa,$0002		;ff9eec
Lff9ef0:									;ff9ef0
	sub.w	d0,d1					;$9240			;ff9ef0
	bcc.s	Lff9f14					;$6420			;ff9ef2
	and.w	#$0003,d5				;$ca7c,$0003		;ff9ef4
	add.w	d5,d5					;$da45			;ff9ef8
	neg.w	d5					;$4445			;ff9efa
	lea.l	(Lff9f0c,pc,d5.w),a0			;$41fb,$500e		;ff9efc
	neg.w	d1					;$4441			;ff9f00
	jmp	(Lff9f14,pc,d1.w)			;$4efb,$1010		;ff9f02

Lff9f06:									;ff9f06
	move.b	d6,(a1)+				;$12c6			;ff9f06
	move.b	d6,(a1)+				;$12c6			;ff9f08
	move.b	d6,(a1)+				;$12c6			;ff9f0a
Lff9f0c:									;ff9f0c
	adda.w	d2,a1					;$d2c2			;ff9f0c
	dbra.w	d4,Lff9ed8				;$51cc,$ffc8		;ff9f0e
	rts						;$4e75			;ff9f12

Lff9f14:									;ff9f14
	move.l	d6,(a1)+				;$22c6			;ff9f14
	move.l	d6,(a1)+				;$22c6			;ff9f16
	move.l	d6,(a1)+				;$22c6			;ff9f18
	move.l	d6,(a1)+				;$22c6			;ff9f1a
	move.l	d6,(a1)+				;$22c6			;ff9f1c
	move.l	d6,(a1)+				;$22c6			;ff9f1e
	move.l	d6,(a1)+				;$22c6			;ff9f20
	move.l	d6,(a1)+				;$22c6			;ff9f22
	move.l	d6,(a1)+				;$22c6			;ff9f24
	move.l	d6,(a1)+				;$22c6			;ff9f26
	move.l	d6,(a1)+				;$22c6			;ff9f28
	move.l	d6,(a1)+				;$22c6			;ff9f2a
	move.l	d6,(a1)+				;$22c6			;ff9f2c
	move.l	d6,(a1)+				;$22c6			;ff9f2e
	move.l	d6,(a1)+				;$22c6			;ff9f30
	move.l	d6,(a1)+				;$22c6			;ff9f32
	jmp	(a0)					;$4ed0			;ff9f34

Lff9f36:									;ff9f36
	movem.l	d0-d2,-(a7)				;$48e7,$e000		;ff9f36
	move.w	($0d08),d0				;$3038,$0d08		;ff9f3a
	bne.w	Lffa0c0					;$6600,$0180		;ff9f3e
	move.l	($0948),d0				;$2038,$0948		;ff9f42
	lsr.l	#7,d0					;$ee88			;ff9f46
	lsr.l	#2,d0					;$e488			;ff9f48
	move.w	($0972),d1				;$3238,$0972		;ff9f4a
	addq.w	#1,d1					;$5241			;ff9f4e
	lsl.w	#2,d1					;$e549			;ff9f50
	subq.w	#1,d1					;$5341			;ff9f52
	add.w	d1,d0					;$d041			;ff9f54
	move.l	d0,d1					;$2200			;ff9f56
	subq.w	#4,d1					;$5941			;ff9f58
	lsl.w	#8,d1					;$e149			;ff9f5a
	move.b	d0,d1					;$1200			;ff9f5c
	move.w	($0972),d0				;$3038,$0972		;ff9f5e
	lsl.w	#2,d0					;$e548			;ff9f62
	move.w	#$feff,d2				;$343c,$feff		;ff9f64
	bsr.w	Lffa07a					;$6100,$0110		;ff9f68
	moveq.l	#$00,d1					;$7200			;ff9f6c
	moveq.l	#$01,d0					;$7001			;ff9f6e
	bsr.w	Lff9e40					;$6100,$fece		;ff9f70
	movem.l	(a7)+,d0-d2				;$4cdf,$0007		;ff9f74
	rts						;$4e75			;ff9f78

Lff9f7a:									;ff9f7a
	movem.l	d0-d2,-(a7)				;$48e7,$e000		;ff9f7a
	move.w	($0d08),d0				;$3038,$0d08		;ff9f7e
	bne.w	Lffa0f2					;$6600,$016e		;ff9f82
	move.w	($0d0a),d0				;$3038,$0d0a		;ff9f86
	bne.s	Lff9fbc					;$6630			;ff9f8a
	move.l	($0948),d0				;$2038,$0948		;ff9f8c
	lsr.l	#7,d0					;$ee88			;ff9f90
	lsr.l	#2,d0					;$e488			;ff9f92
	move.l	d0,d1					;$2200			;ff9f94
	addq.w	#4,d1					;$5841			;ff9f96
	lsl.w	#8,d1					;$e149			;ff9f98
	move.b	d0,d1					;$1200			;ff9f9a
	move.w	($0972),d0				;$3038,$0972		;ff9f9c
	lsl.w	#2,d0					;$e548			;ff9fa0
	move.w	#$0101,d2				;$343c,$0101		;ff9fa2
	bsr.w	Lffa07a					;$6100,$00d2		;ff9fa6
	moveq.l	#$00,d1					;$7200			;ff9faa
	move.w	($0972),d1				;$3238,$0972		;ff9fac
	moveq.l	#$01,d0					;$7001			;ff9fb0
	bsr.w	Lff9e40					;$6100,$fe8c		;ff9fb2
	movem.l	(a7)+,d0-d2				;$4cdf,$0007		;ff9fb6
	rts						;$4e75			;ff9fba

Lff9fbc:									;ff9fbc
	movem.l	d3/a0-a1,-(a7)				;$48e7,$10c0		;ff9fbc
	and.w	#$0003,d0				;$c07c,$0003		;ff9fc0
	subq.w	#1,d0					;$5340			;ff9fc4
	mulu.w	#$0006,d0				;$c0fc,$0006		;ff9fc6
	lea.l	(Lffa038,pc),a1				;$43fa,$006c		;ff9fca
	adda.w	d0,a1					;$d2c0			;ff9fce
	movea.l	($0944),a0				;$2078,$0944		;ff9fd0
	adda.l	($0948),a0				;$d1f8,$0948		;ff9fd4
	moveq.l	#$00,d0					;$7000			;ff9fd8
	move.w	($0972),d0				;$3038,$0972		;ff9fda
	addq.w	#1,d0					;$5240			;ff9fde
	lsl.l	#4,d0					;$e988			;ff9fe0
	sub.w	(a1),d0					;$9051			;ff9fe2
	subq.w	#1,d0					;$5340			;ff9fe4
	lsl.l	#7,d0					;$ef88			;ff9fe6
	adda.l	d0,a0					;$d1c0			;ff9fe8
	move.w	($0002,a1),d3				;$3629,$0002		;ff9fea
	move.l	($0948),d0				;$2038,$0948		;ff9fee
	lsr.l	#7,d0					;$ee88			;ff9ff2
	lsr.l	#2,d0					;$e488			;ff9ff4
	move.l	d0,d1					;$2200			;ff9ff6
	add.w	($0004,a1),d1				;$d269,$0004		;ff9ff8
	lsl.w	#8,d1					;$e149			;ff9ffc
	move.b	d0,d1					;$1200			;ff9ffe
	move.w	($0972),d0				;$3038,$0972		;ffa000
	addq.w	#1,d0					;$5240			;ffa004
	lsl.w	#2,d0					;$e548			;ffa006
	sub.w	($0004,a1),d0				;$9069,$0004		;ffa008
	move.w	#$0101,d2				;$343c,$0101		;ffa00c
Lffa010:									;ffa010
	btst.b	#$04,($00e88001)			;$0839,$0004,$00e8,$8001	;ffa010
	bne.s	Lffa010					;$66f6			;ffa018
	movem.l	d0-d2/d4/a0,-(a7)			;$48e7,$e880		;ffa01a
	bsr.s	Lffa07a					;$615a			;ffa01e
	move.w	(a1),d4					;$3811			;ffa020
	bsr.w	Lff9e58					;$6100,$fe34		;ffa022
	movem.l	(a7)+,d0-d2/d4/a0			;$4cdf,$0117		;ffa026
	dbra.w	d3,Lffa010				;$51cb,$ffe4		;ffa02a
	movem.l	(a7)+,d3/a0-a1				;$4cdf,$0308		;ffa02e
	movem.l	(a7)+,d0-d2				;$4cdf,$0007		;ffa032
	rts						;$4e75			;ffa036

Lffa038:									;ffa038
	.dc.b	$00,$03,$00,$03,$00,$01,$00,$07					;ffa038
	.dc.b	$00,$01,$00,$02,$00,$0f,$00,$00					;ffa040
	.dc.b	$00,$04								;ffa048
Call_Unknown_df:								;ffa04a
	movem.l	d1-d2/d7/a0,-(a7)			;$48e7,$6180		;ffa04a
	lea.l	($00e8002a),a0				;$41f9,$00e8,$002a	;ffa04e
	move.w	(a0),d7					;$3e10			;ffa054
	move.w	d3,d0					;$3003			;ffa056
	and.w	#$000f,d0				;$c07c,$000f		;ffa058
	or.w	#$0100,d0				;$807c,$0100		;ffa05c
	move.w	d0,(a0)					;$3080			;ffa060
	move.w	#$0101,d0				;$303c,$0101		;ffa062
	tst.w	d3					;$4a43			;ffa066
	bpl.s	$00ffa06e				;$6a04			;ffa068
	move.w	#$feff,d0				;$303c,$feff		;ffa06a
	exg.l	d0,d2					;$c142			;ffa06e
	bsr.s	Lffa07a					;$6108			;ffa070
	move.w	d7,(a0)					;$3087			;ffa072
	movem.l	(a7)+,d1-d2/d7/a0			;$4cdf,$0186		;ffa074
	rts						;$4e75			;ffa078

Lffa07a:									;ffa07a
	movem.l	d3/a0-a1,-(a7)				;$48e7,$10c0		;ffa07a
	lea.l	($00e88001),a0				;$41f9,$00e8,$8001	;ffa07e
	lea.l	($00e8002c),a1				;$43f9,$00e8,$002c	;ffa084
	clr.b	($0004,a0)				;$4228,$0004		;ffa08a
	move.w	sr,d3					;$40c3			;ffa08e
	bra.s	Lffa0aa					;$6018			;ffa090
Lffa092:									;ffa092
	tst.b	(a0)					;$4a10			;ffa092
	bmi.s	Lffa092					;$6bfc			;ffa094
	ori.w	#$0700,sr				;$007c,$0700		;ffa096
Lffa09a:									;ffa09a
	tst.b	(a0)					;$4a10			;ffa09a
	bpl.s	Lffa09a					;$6afc			;ffa09c
	move.w	d1,(a1)					;$3281			;ffa09e
	move.w	#$0008,($0454,a1)			;$337c,$0008,$0454	;ffa0a0
	move.w	d3,sr					;$46c3			;ffa0a6
	add.w	d2,d1					;$d242			;ffa0a8
Lffa0aa:									;ffa0aa
	dbra.w	d0,Lffa092				;$51c8,$ffe6		;ffa0aa
Lffa0ae:									;ffa0ae
	tst.b	(a0)					;$4a10			;ffa0ae
	bmi.s	Lffa0ae					;$6bfc			;ffa0b0
Lffa0b2:									;ffa0b2
	tst.b	(a0)					;$4a10			;ffa0b2
	bpl.s	Lffa0b2					;$6afc			;ffa0b4
	clr.w	($0454,a1)				;$4269,$0454		;ffa0b6
	movem.l	(a7)+,d3/a0-a1				;$4cdf,$0308		;ffa0ba
	rts						;$4e75			;ffa0be

Lffa0c0:									;ffa0c0
	movem.l	d3-d5/a0-a4,-(a7)			;$48e7,$1cf8		;ffa0c0
	moveq.l	#$00,d0					;$7000			;ffa0c4
	move.w	($0972),d0				;$3038,$0972		;ffa0c6
	move.l	d0,d4					;$2800			;ffa0ca
	lsl.w	#5,d4					;$eb4c			;ffa0cc
	subq.w	#1,d4					;$5344			;ffa0ce
	addq.w	#1,d0					;$5240			;ffa0d0
	lsl.l	#4,d0					;$e988			;ffa0d2
	subq.l	#1,d0					;$5380			;ffa0d4
	lsl.l	#7,d0					;$ef88			;ffa0d6
	movea.l	d0,a2					;$2440			;ffa0d8
	adda.l	($0948),a2				;$d5f8,$0948		;ffa0da
	adda.l	($0944),a2				;$d5f8,$0944		;ffa0de
	lea.l	(-$0800,a2),a1				;$43ea,$f800		;ffa0e2
	bsr.s	Lffa124					;$613c			;ffa0e6
	moveq.l	#$00,d1					;$7200			;ffa0e8
	moveq.l	#$01,d0					;$7001			;ffa0ea
	bsr.w	Lff9e40					;$6100,$fd52		;ffa0ec
	bra.s	Lffa11a					;$6028			;ffa0f0
Lffa0f2:									;ffa0f2
	movem.l	d3-d5/a0-a4,-(a7)			;$48e7,$1cf8		;ffa0f2
	move.w	($0972),d4				;$3838,$0972		;ffa0f6
	lsl.w	#5,d4					;$eb4c			;ffa0fa
	subq.w	#1,d4					;$5344			;ffa0fc
	suba.l	a2,a2					;$95ca			;ffa0fe
	adda.l	($0948),a2				;$d5f8,$0948		;ffa100
	adda.l	($0944),a2				;$d5f8,$0944		;ffa104
	lea.l	($0800,a2),a1				;$43ea,$0800		;ffa108
	bsr.s	Lffa136					;$6128			;ffa10c
	moveq.l	#$00,d1					;$7200			;ffa10e
	move.w	($0972),d1				;$3238,$0972		;ffa110
	moveq.l	#$01,d0					;$7001			;ffa114
	bsr.w	Lff9e40					;$6100,$fd28		;ffa116
Lffa11a:									;ffa11a
	movem.l	(a7)+,d3-d5/a0-a4			;$4cdf,$1f38		;ffa11a
	movem.l	(a7)+,d0-d2				;$4cdf,$0007		;ffa11e
	rts						;$4e75			;ffa122

Lffa124:									;ffa124
	moveq.l	#$00,d3					;$7600			;ffa124
	move.w	($0970),d3				;$3638,$0970		;ffa126
	addq.w	#1,d3					;$5243			;ffa12a
	move.w	#$0080,d2				;$343c,$0080		;ffa12c
	add.w	d3,d2					;$d443			;ffa130
	neg.w	d2					;$4442			;ffa132
	bra.s	Lffa144					;$600e			;ffa134
Lffa136:									;ffa136
	moveq.l	#$00,d3					;$7600			;ffa136
	move.w	($0970),d3				;$3638,$0970		;ffa138
	addq.w	#1,d3					;$5243			;ffa13c
	move.w	#$0080,d2				;$343c,$0080		;ffa13e
	sub.w	d3,d2					;$9443			;ffa142
Lffa144:									;ffa144
	movea.l	a1,a3					;$2649			;ffa144
	movea.l	a2,a4					;$284a			;ffa146
	moveq.l	#$02,d0					;$7002			;ffa148
	swap.w	d0					;$4840			;ffa14a
	adda.l	d0,a3					;$d7c0			;ffa14c
	adda.l	d0,a4					;$d9c0			;ffa14e
	move.l	a1,d0					;$2009			;ffa150
	lsr.w	#1,d0					;$e248			;ffa152
	bcc.s	Lffa15c					;$6406			;ffa154
	subq.w	#1,d3					;$5343			;ffa156
	bset.l	#$1f,d3					;$08c3,$001f		;ffa158
Lffa15c:									;ffa15c
	move.w	d3,d5					;$3a03			;ffa15c
	and.w	#$0003,d5				;$ca7c,$0003		;ffa15e
	add.w	d5,d5					;$da45			;ffa162
	neg.w	d5					;$4445			;ffa164
	lsr.w	#2,d3					;$e44b			;ffa166
	add.w	d3,d3					;$d643			;ffa168
Lffa16a:									;ffa16a
	move.l	d3,d1					;$2203			;ffa16a
	bpl.s	Lffa170					;$6a02			;ffa16c
	move.b	(a1)+,(a2)+				;$14d9			;ffa16e
Lffa170:									;ffa170
	moveq.l	#$20,d0					;$7020			;ffa170
	lea.l	(Lffa176,pc),a0				;$41fa,$0002		;ffa172
Lffa176:									;ffa176
	sub.w	d0,d1					;$9240			;ffa176
	bcc.s	Lffa198					;$641e			;ffa178
	lea.l	(Lffa18a,pc,d5.w),a0			;$41fb,$500e		;ffa17a
	neg.w	d1					;$4441			;ffa17e
	jmp	(Lffa198,pc,d1.w)			;$4efb,$1016		;ffa180

Lffa184:									;ffa184
	move.b	(a1)+,(a2)+				;$14d9			;ffa184
	move.b	(a1)+,(a2)+				;$14d9			;ffa186
	move.b	(a1)+,(a2)+				;$14d9			;ffa188
Lffa18a:									;ffa18a
	adda.w	d2,a1					;$d2c2			;ffa18a
	adda.w	d2,a2					;$d4c2			;ffa18c
	exg.l	a1,a3					;$c34b			;ffa18e
	exg.l	a2,a4					;$c54c			;ffa190
	dbra.w	d4,Lffa16a				;$51cc,$ffd6		;ffa192
	rts						;$4e75			;ffa196

Lffa198:									;ffa198
	move.l	(a1)+,(a2)+				;$24d9			;ffa198
	move.l	(a1)+,(a2)+				;$24d9			;ffa19a
	move.l	(a1)+,(a2)+				;$24d9			;ffa19c
	move.l	(a1)+,(a2)+				;$24d9			;ffa19e
	move.l	(a1)+,(a2)+				;$24d9			;ffa1a0
	move.l	(a1)+,(a2)+				;$24d9			;ffa1a2
	move.l	(a1)+,(a2)+				;$24d9			;ffa1a4
	move.l	(a1)+,(a2)+				;$24d9			;ffa1a6
	move.l	(a1)+,(a2)+				;$24d9			;ffa1a8
	move.l	(a1)+,(a2)+				;$24d9			;ffa1aa
	move.l	(a1)+,(a2)+				;$24d9			;ffa1ac
	move.l	(a1)+,(a2)+				;$24d9			;ffa1ae
	move.l	(a1)+,(a2)+				;$24d9			;ffa1b0
	move.l	(a1)+,(a2)+				;$24d9			;ffa1b2
	move.l	(a1)+,(a2)+				;$24d9			;ffa1b4
	move.l	(a1)+,(a2)+				;$24d9			;ffa1b6
	jmp	(a0)					;$4ed0			;ffa1b8

Lffa1ba:									;ffa1ba
	movem.l	d2-d7/a0-a4,-(a7)			;$48e7,$3ff8		;ffa1ba
	movea.l	($0982),a1				;$2278,$0982		;ffa1be
	move.b	d1,(a1)+				;$12c1			;ffa1c2
	lea.l	($098f),a0				;$41f8,$098f		;ffa1c4
	cmpa.l	a0,a1					;$b3c8			;ffa1c8
	beq.s	Lffa1d0					;$6704			;ffa1ca
	move.l	a1,($0982)				;$21c9,$0982		;ffa1cc
Lffa1d0:									;ffa1d0
	move.b	($0986),d0				;$1038,$0986		;ffa1d0
	cmpi.b	#$5b,d0					;$0c00,$005b		;ffa1d4
	beq.s	Lffa1fe					;$6724			;ffa1d8
	cmpi.b	#$3d,d0					;$0c00,$003d		;ffa1da
	beq.s	Lffa248					;$6768			;ffa1de
	bsr.w	Call_B_CUROFF				;$6100,$d808		;ffa1e0
	cmpi.b	#$2a,d0					;$0c00,$002a		;ffa1e4
	beq.s	Lffa23e					;$6754			;ffa1e8
	cmpi.b	#$44,d0					;$0c00,$0044		;ffa1ea
	beq.s	Lffa224					;$6734			;ffa1ee
	cmpi.b	#$45,d0					;$0c00,$0045		;ffa1f0
	beq.s	Lffa22a					;$6734			;ffa1f4
	cmpi.b	#$4d,d0					;$0c00,$004d		;ffa1f6
	beq.s	Lffa238					;$673c			;ffa1fa
	bra.s	Lffa216					;$6018			;ffa1fc
Lffa1fe:									;ffa1fe
	move.b	d1,d0					;$1001			;ffa1fe
	or.b	#$20,d0					;$803c,$0020		;ffa200
	sub.b	#$60,d0					;$903c,$0060		;ffa204
	cmp.b	#$1b,d0					;$b03c,$001b		;ffa208
	bcc.s	Lffa21e					;$6410			;ffa20c
	bsr.w	Call_B_CUROFF				;$6100,$d7da		;ffa20e
	bsr.w	Lffa2b4					;$6100,$00a0		;ffa212
Lffa216:									;ffa216
	clr.b	($0990)					;$4238,$0990		;ffa216
	bsr.w	Call_B_CURON				;$6100,$d7b2		;ffa21a
Lffa21e:									;ffa21e
	movem.l	(a7)+,d2-d7/a0-a4			;$4cdf,$1ffc		;ffa21e
	rts						;$4e75			;ffa222

Lffa224:									;ffa224
	bsr.w	Lffa458					;$6100,$0232		;ffa224
	bra.s	Lffa216					;$60ec			;ffa228
Lffa22a:									;ffa22a
	move.w	($0974),d6				;$3c38,$0974		;ffa22a
	move.w	($0976),d7				;$3e38,$0976		;ffa22e
	bsr.w	Lff996a					;$6100,$f736		;ffa232
	bra.s	Lffa216					;$60de			;ffa236
Lffa238:									;ffa238
	bsr.w	Lffa472					;$6100,$0238		;ffa238
	bra.s	Lffa216					;$60d8			;ffa23c
Lffa23e:									;ffa23e
	bsr.w	Lff9e60					;$6100,$fc20		;ffa23e
	clr.l	($0974)					;$42b8,$0974		;ffa242
	bra.s	Lffa216					;$60ce			;ffa246
Lffa248:									;ffa248
	lea.l	($0989),a0				;$41f8,$0989		;ffa248
	cmpa.l	a0,a1					;$b3c8			;ffa24c
	bne.s	Lffa21e					;$66ce			;ffa24e
	bsr.w	Call_B_CUROFF				;$6100,$d798		;ffa250
	moveq.l	#$1f,d0					;$701f			;ffa254
	moveq.l	#$00,d1					;$7200			;ffa256
	moveq.l	#$00,d2					;$7400			;ffa258
	move.b	($0987),d2				;$1438,$0987		;ffa25a
	move.b	($0988),d1				;$1238,$0988		;ffa25e
	sub.w	d0,d1					;$9240			;ffa262
	sub.w	d0,d2					;$9440			;ffa264
	bsr.w	Lffa438					;$6100,$01d0		;ffa266
	bra.s	Lffa216					;$60aa			;ffa26a
Lffa26c:									;ffa26c
	swap.w	d0					;$4840			;ffa26c
	moveq.l	#$00,d1					;$7200			;ffa26e
	cmpi.w	#$356c,d0				;$0c40,$356c		;ffa270
	beq.s	Lffa27e					;$6708			;ffa274
	moveq.l	#$ff,d1					;$72ff			;ffa276
	cmpi.w	#$3568,d0				;$0c40,$3568		;ffa278
	bne.s	Lffa29e					;$6620			;ffa27c
Lffa27e:									;ffa27e
	move.b	d1,($0993)				;$11c1,$0993		;ffa27e
	rts						;$4e75			;ffa282

Lffa284:									;ffa284
	swap.w	d0					;$4840			;ffa284
	lea.l	($0d0a),a0				;$41f8,$0d0a		;ffa286
	moveq.l	#$00,d1					;$7200			;ffa28a
	cmpi.w	#$346c,d0				;$0c40,$346c		;ffa28c
	beq.s	Lffa29a					;$6708			;ffa290
	moveq.l	#$02,d1					;$7202			;ffa292
	cmpi.w	#$3468,d0				;$0c40,$3468		;ffa294
	bne.s	Lffa29e					;$6604			;ffa298
Lffa29a:									;ffa29a
	move.w	d1,(a0)					;$3081			;ffa29a
	rts						;$4e75			;ffa29c

Lffa29e:									;ffa29e
	move.l	($097e),-(a7)				;$2f38,$097e		;ffa29e
	beq.s	Lffa2aa					;$6706			;ffa2a2
	lea.l	($0986),a0				;$41f8,$0986		;ffa2a4
	rts						;$4e75			;ffa2a8

Lffa2aa:									;ffa2aa
	tst.l	(a7)+					;$4a9f			;ffa2aa
	rts						;$4e75			;ffa2ac

Lffa2ae:									;ffa2ae
	move.l	($0d16),-(a7)				;$2f38,$0d16		;ffa2ae
	rts						;$4e75			;ffa2b2

Lffa2b4:									;ffa2b4
	lea.l	($0986),a0				;$41f8,$0986		;ffa2b4
	tst.l	($0d16)					;$4ab8,$0d16		;ffa2b8
	bne.s	Lffa2ae					;$66f0			;ffa2bc
	move.l	(a0),d0					;$2010			;ffa2be
	swap.w	d0					;$4840			;ffa2c0
	cmpi.w	#$5b3f,d0				;$0c40,$5b3f		;ffa2c2
	beq.s	Lffa284					;$67bc			;ffa2c6
	cmpi.w	#$5b3e,d0				;$0c40,$5b3e		;ffa2c8
	beq.s	Lffa26c					;$679e			;ffa2cc
	addq.l	#1,a0					;$5288			;ffa2ce
	bsr.w	Lffa3e0					;$6100,$010e		;ffa2d0
	cmp.b	#$41,d0					;$b03c,$0041		;ffa2d4
	beq.w	Lffa488					;$6700,$01ae		;ffa2d8
	cmp.b	#$42,d0					;$b03c,$0042		;ffa2dc
	beq.w	Lffa4a4					;$6700,$01c2		;ffa2e0
	cmp.b	#$43,d0					;$b03c,$0043		;ffa2e4
	beq.w	Lffa4c0					;$6700,$01d6		;ffa2e8
	cmp.b	#$44,d0					;$b03c,$0044		;ffa2ec
	beq.w	Lffa4d8					;$6700,$01e6		;ffa2f0
	cmp.b	#$73,d0					;$b03c,$0073		;ffa2f4
	beq.w	Lffa408					;$6700,$010e		;ffa2f8
	cmp.b	#$75,d0					;$b03c,$0075		;ffa2fc
	beq.w	Lffa41a					;$6700,$0118		;ffa300
	cmp.b	#$6e,d0					;$b03c,$006e		;ffa304
	beq.s	Lffa29e					;$6794			;ffa308
	cmp.b	#$4a,d0					;$b03c,$004a		;ffa30a
	beq.w	Lffa4ee					;$6700,$01de		;ffa30e
	cmp.b	#$4b,d0					;$b03c,$004b		;ffa312
	beq.w	Lffa52c					;$6700,$0214		;ffa316
	cmp.b	#$4d,d0					;$b03c,$004d		;ffa31a
	beq.w	Lffa68a					;$6700,$036a		;ffa31e
	cmp.b	#$4c,d0					;$b03c,$004c		;ffa322
	beq.w	Lffa5e0					;$6700,$02b8		;ffa326
	cmp.b	#$50,d0					;$b03c,$0050		;ffa32a
	beq.w	Lffa764					;$6700,$0434		;ffa32e
	cmp.b	#$40,d0					;$b03c,$0040		;ffa332
	beq.w	Lffa794					;$6700,$045c		;ffa336
	cmp.b	#$58,d0					;$b03c,$0058		;ffa33a
	beq.w	Lffa722					;$6700,$03e2		;ffa33e
	cmp.b	#$6d,d0					;$b03c,$006d		;ffa342
	beq.s	Lffa38a					;$6742			;ffa346
	cmp.b	#$3b,d0					;$b03c,$003b		;ffa348
	bne.w	Lffa29e					;$6600,$ff50		;ffa34c
	move.w	d1,d2					;$3401			;ffa350
	bsr.w	Lffa3e0					;$6100,$008c		;ffa352
	cmp.b	#$48,d0					;$b03c,$0048		;ffa356
	beq.w	Lffa42c					;$6700,$00d0		;ffa35a
	cmp.b	#$66,d0					;$b03c,$0066		;ffa35e
	beq.w	Lffa42c					;$6700,$00c8		;ffa362
	cmp.b	#$6d,d0					;$b03c,$006d		;ffa366
	beq.s	Lffa386					;$671a			;ffa36a
	cmp.b	#$3b,d0					;$b03c,$003b		;ffa36c
	bne.w	Lffa29e					;$6600,$ff2c		;ffa370
	move.w	d1,d3					;$3601			;ffa374
	bsr.s	Lffa3e0					;$6168			;ffa376
	cmp.b	#$6d,d0					;$b03c,$006d		;ffa378
	bne.w	Lffa29e					;$6600,$ff20		;ffa37c
	move.w	d2,d0					;$3002			;ffa380
	bsr.s	Lffa38c					;$6108			;ffa382
	exg.l	d2,d3					;$c543			;ffa384
Lffa386:									;ffa386
	move.w	d2,d0					;$3002			;ffa386
	bsr.s	Lffa38c					;$6102			;ffa388
Lffa38a:									;ffa38a
	move.w	d1,d0					;$3001			;ffa38a
Lffa38c:									;ffa38c
	tst.b	d0					;$4a00			;ffa38c
	beq.s	Lffa3c8					;$6738			;ffa38e
	cmp.b	#$01,d0					;$b03c,$0001		;ffa390
	beq.s	Lffa3d0					;$673a			;ffa394
	cmp.b	#$07,d0					;$b03c,$0007		;ffa396
	beq.s	Lffa3d8					;$673c			;ffa39a
	cmp.b	#$1e,d0					;$b03c,$001e		;ffa39c
	bcs.s	Lffa3c6					;$6524			;ffa3a0
	cmp.b	#$26,d0					;$b03c,$0026		;ffa3a2
	bcc.s	Lffa3b2					;$640a			;ffa3a6
	sub.b	#$1e,d0					;$903c,$001e		;ffa3a8
	move.b	d0,($0994)				;$11c0,$0994		;ffa3ac
	rts						;$4e75			;ffa3b0

Lffa3b2:									;ffa3b2
	cmp.b	#$28,d0					;$b03c,$0028		;ffa3b2
	bcs.s	Lffa3c6					;$650e			;ffa3b6
	cmp.b	#$30,d0					;$b03c,$0030		;ffa3b8
	bcc.s	Lffa3c6					;$6408			;ffa3bc
	sub.b	#$20,d0					;$903c,$0020		;ffa3be
	move.b	d0,($0994)				;$11c0,$0994		;ffa3c2
Lffa3c6:									;ffa3c6
	rts						;$4e75			;ffa3c6

Lffa3c8:									;ffa3c8
	move.b	#$03,($0994)				;$11fc,$0003,$0994	;ffa3c8
	rts						;$4e75			;ffa3ce

Lffa3d0:									;ffa3d0
	eori.b	#$04,($0994)				;$0a38,$0004,$0994	;ffa3d0
	rts						;$4e75			;ffa3d6

Lffa3d8:									;ffa3d8
	eori.b	#$08,($0994)				;$0a38,$0008,$0994	;ffa3d8
	rts						;$4e75			;ffa3de

Lffa3e0:									;ffa3e0
	move.w	#$8000,d1				;$323c,$8000		;ffa3e0
	moveq.l	#$00,d0					;$7000			;ffa3e4
Lffa3e6:									;ffa3e6
	move.b	(a0)+,d0				;$1018			;ffa3e6
	cmp.b	#$20,d0					;$b03c,$0020		;ffa3e8
	beq.s	Lffa3e6					;$67f8			;ffa3ec
	cmp.b	#$30,d0					;$b03c,$0030		;ffa3ee
	bcs.s	Lffa406					;$6512			;ffa3f2
	cmp.b	#$3a,d0					;$b03c,$003a		;ffa3f4
	bcc.s	Lffa406					;$640c			;ffa3f8
	sub.b	#$30,d0					;$903c,$0030		;ffa3fa
	mulu.w	#$000a,d1				;$c2fc,$000a		;ffa3fe
	add.w	d0,d1					;$d240			;ffa402
	bra.s	Lffa3e6					;$60e0			;ffa404
Lffa406:									;ffa406
	rts						;$4e75			;ffa406

Lffa408:									;ffa408
	tst.w	d1					;$4a41			;ffa408
	bpl.s	Lffa418					;$6a0c			;ffa40a
	move.l	($0974),($0996)				;$21f8,$0974,$0996	;ffa40c
	move.b	($0994),($0995)				;$11f8,$0994,$0995	;ffa412
Lffa418:									;ffa418
	rts						;$4e75			;ffa418

Lffa41a:									;ffa41a
	tst.w	d1					;$4a41			;ffa41a
	bpl.s	Lffa42a					;$6a0c			;ffa41c
	move.l	($0996),($0974)				;$21f8,$0996,$0974	;ffa41e
	move.b	($0995),($0994)				;$11f8,$0995,$0994	;ffa424
Lffa42a:									;ffa42a
	rts						;$4e75			;ffa42a

Lffa42c:									;ffa42c
	tst.w	d1					;$4a41			;ffa42c
	bgt.s	Lffa432					;$6e02			;ffa42e
	moveq.l	#$01,d1					;$7201			;ffa430
Lffa432:									;ffa432
	tst.w	d2					;$4a42			;ffa432
	bgt.s	Lffa438					;$6e02			;ffa434
	moveq.l	#$01,d2					;$7401			;ffa436
Lffa438:									;ffa438
	subq.w	#1,d1					;$5341			;ffa438
	subq.w	#1,d2					;$5342			;ffa43a
	cmp.w	($0970),d1				;$b278,$0970		;ffa43c
	bhi.s	Lffa454					;$6212			;ffa440
	cmp.w	($0972),d2				;$b478,$0972		;ffa442
	bhi.s	Lffa454					;$620c			;ffa446
	move.w	d1,($0974)				;$31c1,$0974		;ffa448
	move.w	d2,($0976)				;$31c2,$0976		;ffa44c
	moveq.l	#$00,d0					;$7000			;ffa450
	rts						;$4e75			;ffa452

Lffa454:									;ffa454
	moveq.l	#$ff,d0					;$70ff			;ffa454
	rts						;$4e75			;ffa456

Lffa458:									;ffa458
	addq.w	#1,($0976)				;$5278,$0976		;ffa458
	move.w	($0972),d0				;$3038,$0972		;ffa45c
	cmp.w	($0976),d0				;$b078,$0976		;ffa460
	bcc.s	Lffa46e					;$6408			;ffa464
	subq.w	#1,($0976)				;$5378,$0976		;ffa466
	bsr.w	Lff9f7a					;$6100,$fb0e		;ffa46a
Lffa46e:									;ffa46e
	moveq.l	#$00,d0					;$7000			;ffa46e
	rts						;$4e75			;ffa470

Lffa472:									;ffa472
	tst.w	($0976)					;$4a78,$0976		;ffa472
	beq.s	Lffa480					;$6708			;ffa476
	subq.w	#1,($0976)				;$5378,$0976		;ffa478
	moveq.l	#$00,d0					;$7000			;ffa47c
	rts						;$4e75			;ffa47e

Lffa480:									;ffa480
	bsr.w	Lff9f36					;$6100,$fab4		;ffa480
	moveq.l	#$00,d0					;$7000			;ffa484
	rts						;$4e75			;ffa486

Lffa488:									;ffa488
	and.w	#$00ff,d1				;$c27c,$00ff		;ffa488
	bne.s	Lffa490					;$6602			;ffa48c
	moveq.l	#$01,d1					;$7201			;ffa48e
Lffa490:									;ffa490
	move.w	($0976),d0				;$3038,$0976		;ffa490
	sub.w	d1,d0					;$9041			;ffa494
	bmi.s	Lffa4a0					;$6b08			;ffa496
	move.w	d0,($0976)				;$31c0,$0976		;ffa498
	moveq.l	#$00,d0					;$7000			;ffa49c
	rts						;$4e75			;ffa49e

Lffa4a0:									;ffa4a0
	moveq.l	#$ff,d0					;$70ff			;ffa4a0
	rts						;$4e75			;ffa4a2

Lffa4a4:									;ffa4a4
	lea.l	($0976),a0				;$41f8,$0976		;ffa4a4
	and.w	#$00ff,d1				;$c27c,$00ff		;ffa4a8
	bne.s	Lffa4b0					;$6602			;ffa4ac
	moveq.l	#$01,d1					;$7201			;ffa4ae
Lffa4b0:									;ffa4b0
	add.w	d1,(a0)					;$d350			;ffa4b0
	move.w	($0972),d0				;$3038,$0972		;ffa4b2
	cmp.w	(a0),d0					;$b050			;ffa4b6
	bcc.s	Lffa4bc					;$6402			;ffa4b8
Lffa4ba:									;ffa4ba
	move.w	d0,(a0)					;$3080			;ffa4ba
Lffa4bc:									;ffa4bc
	moveq.l	#$00,d0					;$7000			;ffa4bc
	rts						;$4e75			;ffa4be

Lffa4c0:									;ffa4c0
	lea.l	($0974),a0				;$41f8,$0974		;ffa4c0
	and.w	#$00ff,d1				;$c27c,$00ff		;ffa4c4
	bne.s	Lffa4cc					;$6602			;ffa4c8
	moveq.l	#$01,d1					;$7201			;ffa4ca
Lffa4cc:									;ffa4cc
	add.w	d1,(a0)					;$d350			;ffa4cc
	move.w	($0970),d0				;$3038,$0970		;ffa4ce
	cmp.w	(a0),d0					;$b050			;ffa4d2
	bcc.s	Lffa4bc					;$64e6			;ffa4d4
	bra.s	Lffa4ba					;$60e2			;ffa4d6
Lffa4d8:									;ffa4d8
	and.w	#$00ff,d1				;$c27c,$00ff		;ffa4d8
	bne.s	Lffa4e0					;$6602			;ffa4dc
	moveq.l	#$01,d1					;$7201			;ffa4de
Lffa4e0:									;ffa4e0
	sub.w	d1,($0974)				;$9378,$0974		;ffa4e0
	bpl.s	Lffa4ea					;$6a04			;ffa4e4
	clr.w	($0974)					;$4278,$0974		;ffa4e6
Lffa4ea:									;ffa4ea
	moveq.l	#$00,d0					;$7000			;ffa4ea
	rts						;$4e75			;ffa4ec

Lffa4ee:									;ffa4ee
	tst.b	d1					;$4a01			;ffa4ee
	beq.s	Lffa506					;$6714			;ffa4f0
	subq.b	#2,d1					;$5501			;ffa4f2
	bcs.s	Lffa51e					;$6528			;ffa4f4
	bhi.s	Lffa502					;$620a			;ffa4f6
	bsr.w	Lff9e60					;$6100,$f966		;ffa4f8
	clr.l	($0974)					;$42b8,$0974		;ffa4fc
	rts						;$4e75			;ffa500

Lffa502:									;ffa502
	moveq.l	#$ff,d0					;$70ff			;ffa502
	rts						;$4e75			;ffa504

Lffa506:									;ffa506
	moveq.l	#$00,d1					;$7200			;ffa506
	move.w	($0972),d0				;$3038,$0972		;ffa508
	move.w	($0976),d1				;$3238,$0976		;ffa50c
	sub.w	d1,d0					;$9041			;ffa510
	beq.s	Lffa54a					;$6736			;ffa512
	bcs.s	Lffa502					;$65ec			;ffa514
	addq.w	#1,d1					;$5241			;ffa516
	bsr.w	Lff9e40					;$6100,$f926		;ffa518
	bra.s	Lffa54a					;$602c			;ffa51c
Lffa51e:									;ffa51e
	moveq.l	#$00,d1					;$7200			;ffa51e
	move.w	($0976),d0				;$3038,$0976		;ffa520
	beq.s	Lffa55a					;$6734			;ffa524
	bsr.w	Lff9e40					;$6100,$f918		;ffa526
	bra.s	Lffa55a					;$602e			;ffa52a
Lffa52c:									;ffa52c
	tst.b	d1					;$4a01			;ffa52c
	beq.s	Lffa54a					;$671a			;ffa52e
	subq.b	#2,d1					;$5501			;ffa530
	bcs.s	Lffa55a					;$6526			;ffa532
	bhi.s	Lffa546					;$6210			;ffa534
	moveq.l	#$00,d1					;$7200			;ffa536
	move.w	($0976),d1				;$3238,$0976		;ffa538
	moveq.l	#$01,d0					;$7001			;ffa53c
	bsr.w	Lff9e40					;$6100,$f900		;ffa53e
	moveq.l	#$00,d0					;$7000			;ffa542
	rts						;$4e75			;ffa544

Lffa546:									;ffa546
	moveq.l	#$ff,d0					;$70ff			;ffa546
	rts						;$4e75			;ffa548

Lffa54a:									;ffa54a
	moveq.l	#$00,d2					;$7400			;ffa54a
	move.w	($0974),d2				;$3438,$0974		;ffa54c
	move.w	($0970),d0				;$3038,$0970		;ffa550
	sub.w	d2,d0					;$9042			;ffa554
	bcs.s	Lffa546					;$65ee			;ffa556
	bra.s	Lffa560					;$6006			;ffa558
Lffa55a:									;ffa55a
	moveq.l	#$00,d2					;$7400			;ffa55a
	move.w	($0974),d0				;$3038,$0974		;ffa55c
Lffa560:									;ffa560
	lea.l	($00e8002a),a4				;$49f9,$00e8,$002a	;ffa560
	moveq.l	#$00,d1					;$7200			;ffa566
	move.w	($0976),d1				;$3238,$0976		;ffa568
	swap.w	d1					;$4841			;ffa56c
	lsr.l	#5,d1					;$ea89			;ffa56e
	add.l	($0948),d1				;$d2b8,$0948		;ffa570
	add.l	($0944),d1				;$d2b8,$0944		;ffa574
	movea.l	d1,a0					;$2041			;ffa578
	adda.w	d2,a0					;$d0c2			;ffa57a
	moveq.l	#$7f,d3					;$767f			;ffa57c
	sub.w	d0,d3					;$9640			;ffa57e
	moveq.l	#$0f,d4					;$780f			;ffa580
	bset.b	#$00,(a4)				;$08d4,$0000		;ffa582
	moveq.l	#$00,d2					;$7400			;ffa586
	move.b	($0994),d1				;$1238,$0994		;ffa588
	btst.l	#$03,d1					;$0801,$0003		;ffa58c
	beq.s	Lffa5ca					;$6738			;ffa590
	and.b	#$03,d1					;$c23c,$0003		;ffa592
	beq.s	Lffa5ca					;$6732			;ffa596
	moveq.l	#$ff,d2					;$74ff			;ffa598
	cmp.b	#$03,d1					;$b23c,$0003		;ffa59a
	beq.s	Lffa5ca					;$672a			;ffa59e
	movea.l	a0,a1					;$2248			;ffa5a0
	adda.l	#$00020000,a1				;$d3fc,$0002,$0000	;ffa5a2
	bclr.b	#$00,(a4)				;$0894,$0000		;ffa5a8
	cmp.b	#$02,d1					;$b23c,$0002		;ffa5ac
	beq.s	Lffa5b4					;$6702			;ffa5b0
	exg.l	a0,a1					;$c149			;ffa5b2
Lffa5b4:									;ffa5b4
	move.w	d0,d1					;$3200			;ffa5b4
Lffa5b6:									;ffa5b6
	clr.b	(a0)+					;$4218			;ffa5b6
	move.b	d2,(a1)+				;$12c2			;ffa5b8
	dbra.w	d1,Lffa5b6				;$51c9,$fffa		;ffa5ba
	adda.l	d3,a0					;$d1c3			;ffa5be
	adda.l	d3,a1					;$d3c3			;ffa5c0
	dbra.w	d4,Lffa5b4				;$51cc,$fff0		;ffa5c2
	moveq.l	#$00,d0					;$7000			;ffa5c6
	rts						;$4e75			;ffa5c8

Lffa5ca:									;ffa5ca
	move.w	d0,d1					;$3200			;ffa5ca
Lffa5cc:									;ffa5cc
	move.b	d2,(a0)+				;$10c2			;ffa5cc
	dbra.w	d1,Lffa5cc				;$51c9,$fffc		;ffa5ce
	adda.l	d3,a0					;$d1c3			;ffa5d2
	dbra.w	d4,Lffa5ca				;$51cc,$fff4		;ffa5d4
	bclr.b	#$00,(a4)				;$0894,$0000		;ffa5d8
	moveq.l	#$00,d0					;$7000			;ffa5dc
	rts						;$4e75			;ffa5de

Lffa5e0:									;ffa5e0
	tst.b	d1					;$4a01			;ffa5e0
	bne.s	Lffa5e6					;$6602			;ffa5e2
	moveq.l	#$01,d1					;$7201			;ffa5e4
Lffa5e6:									;ffa5e6
	and.w	#$00ff,d1				;$c27c,$00ff		;ffa5e6
	moveq.l	#$00,d2					;$7400			;ffa5ea
	moveq.l	#$00,d3					;$7600			;ffa5ec
	move.w	($0972),d3				;$3638,$0972		;ffa5ee
	move.w	($0976),d2				;$3438,$0976		;ffa5f2
	move.w	d3,d0					;$3003			;ffa5f6
	addq.w	#1,d0					;$5240			;ffa5f8
	sub.w	d2,d0					;$9042			;ffa5fa
	cmp.w	d0,d1					;$b240			;ffa5fc
	bcc.s	Lffa644					;$6444			;ffa5fe
	move.w	($0d08),d4				;$3838,$0d08		;ffa600
	bne.s	Lffa654					;$664e			;ffa604
	movem.l	d1-d2,-(a7)				;$48e7,$6000		;ffa606
	move.w	d1,d4					;$3801			;ffa60a
	move.l	($0948),d0				;$2038,$0948		;ffa60c
	lsr.l	#7,d0					;$ee88			;ffa610
	lsr.l	#2,d0					;$e488			;ffa612
	move.w	d3,d1					;$3203			;ffa614
	addq.w	#1,d1					;$5241			;ffa616
	lsl.w	#2,d1					;$e549			;ffa618
	subq.w	#1,d1					;$5341			;ffa61a
	add.w	d1,d0					;$d041			;ffa61c
	move.l	d0,d1					;$2200			;ffa61e
	sub.w	d4,d1					;$9244			;ffa620
	sub.w	d4,d1					;$9244			;ffa622
	sub.w	d4,d1					;$9244			;ffa624
	sub.w	d4,d1					;$9244			;ffa626
	lsl.w	#8,d1					;$e149			;ffa628
	move.b	d0,d1					;$1200			;ffa62a
	move.w	d3,d0					;$3003			;ffa62c
	addq.w	#1,d0					;$5240			;ffa62e
	sub.w	d2,d0					;$9042			;ffa630
	sub.w	d4,d0					;$9044			;ffa632
	lsl.w	#2,d0					;$e548			;ffa634
	move.w	#$feff,d2				;$343c,$feff		;ffa636
	bsr.w	Lffa07a					;$6100,$fa3e		;ffa63a
Lffa63e:									;ffa63e
	movem.l	(a7)+,d1-d2				;$4cdf,$0006		;ffa63e
	move.w	d1,d0					;$3001			;ffa642
Lffa644:									;ffa644
	moveq.l	#$00,d1					;$7200			;ffa644
	move.w	d2,d1					;$3202			;ffa646
	bsr.w	Lff9e40					;$6100,$f7f6		;ffa648
	moveq.l	#$00,d0					;$7000			;ffa64c
	move.w	d0,($0974)				;$31c0,$0974		;ffa64e
	rts						;$4e75			;ffa652

Lffa654:									;ffa654
	movem.l	d1-d2,-(a7)				;$48e7,$6000		;ffa654
	move.w	d0,d4					;$3800			;ffa658
	sub.w	d1,d4					;$9841			;ffa65a
	lsl.w	#5,d4					;$eb4c			;ffa65c
	subq.w	#1,d4					;$5344			;ffa65e
	addq.w	#1,d3					;$5243			;ffa660
	lsl.l	#4,d3					;$e98b			;ffa662
	subq.l	#1,d3					;$5383			;ffa664
	lsl.l	#7,d3					;$ef8b			;ffa666
	movea.l	d3,a2					;$2443			;ffa668
	moveq.l	#$00,d0					;$7000			;ffa66a
	move.w	d1,d0					;$3001			;ffa66c
	swap.w	d0					;$4840			;ffa66e
	lsr.l	#5,d0					;$ea88			;ffa670
	neg.l	d0					;$4480			;ffa672
	movea.l	d0,a1					;$2240			;ffa674
	adda.l	a2,a1					;$d3ca			;ffa676
	move.l	($0944),d0				;$2038,$0944		;ffa678
	add.l	($0948),d0				;$d0b8,$0948		;ffa67c
	adda.l	d0,a1					;$d3c0			;ffa680
	adda.l	d0,a2					;$d5c0			;ffa682
	bsr.w	Lffa124					;$6100,$fa9e		;ffa684
	bra.s	Lffa63e					;$60b4			;ffa688
Lffa68a:									;ffa68a
	tst.b	d1					;$4a01			;ffa68a
	bne.s	Lffa690					;$6602			;ffa68c
	moveq.l	#$01,d1					;$7201			;ffa68e
Lffa690:									;ffa690
	and.w	#$00ff,d1				;$c27c,$00ff		;ffa690
	moveq.l	#$00,d2					;$7400			;ffa694
	moveq.l	#$00,d3					;$7600			;ffa696
	move.w	($0972),d3				;$3638,$0972		;ffa698
	move.w	($0976),d2				;$3438,$0976		;ffa69c
	move.w	d3,d0					;$3003			;ffa6a0
	addq.w	#1,d0					;$5240			;ffa6a2
	sub.w	d2,d0					;$9042			;ffa6a4
	cmp.w	d0,d1					;$b240			;ffa6a6
	bcc.s	Lffa644					;$649a			;ffa6a8
	move.w	($0d08),d4				;$3838,$0d08		;ffa6aa
	bne.s	Lffa6f2					;$6642			;ffa6ae
	movem.l	d0-d2,-(a7)				;$48e7,$e000		;ffa6b0
	move.w	d1,d4					;$3801			;ffa6b4
	move.l	($0948),d0				;$2038,$0948		;ffa6b6
	lsr.l	#7,d0					;$ee88			;ffa6ba
	lsr.l	#2,d0					;$e488			;ffa6bc
	move.w	d2,d1					;$3202			;ffa6be
	lsl.w	#2,d1					;$e549			;ffa6c0
	add.w	d1,d0					;$d041			;ffa6c2
	move.l	d0,d1					;$2200			;ffa6c4
	add.w	d4,d1					;$d244			;ffa6c6
	add.w	d4,d1					;$d244			;ffa6c8
	add.w	d4,d1					;$d244			;ffa6ca
	add.w	d4,d1					;$d244			;ffa6cc
	lsl.w	#8,d1					;$e149			;ffa6ce
	move.b	d0,d1					;$1200			;ffa6d0
	move.w	d3,d0					;$3003			;ffa6d2
	addq.w	#1,d0					;$5240			;ffa6d4
	sub.w	d2,d0					;$9042			;ffa6d6
	sub.w	d4,d0					;$9044			;ffa6d8
	lsl.w	#2,d0					;$e548			;ffa6da
	move.w	#$0101,d2				;$343c,$0101		;ffa6dc
	bsr.w	Lffa07a					;$6100,$f998		;ffa6e0
Lffa6e4:									;ffa6e4
	movem.l	(a7)+,d0-d2				;$4cdf,$0007		;ffa6e4
	sub.w	d1,d0					;$9041			;ffa6e8
	add.w	d0,d2					;$d440			;ffa6ea
	move.w	d1,d0					;$3001			;ffa6ec
	bra.w	Lffa644					;$6000,$ff54		;ffa6ee
Lffa6f2:									;ffa6f2
	movem.l	d0-d2,-(a7)				;$48e7,$e000		;ffa6f2
	move.w	d0,d4					;$3800			;ffa6f6
	sub.w	d1,d4					;$9841			;ffa6f8
	lsl.w	#5,d4					;$eb4c			;ffa6fa
	subq.w	#1,d4					;$5344			;ffa6fc
	swap.w	d2					;$4842			;ffa6fe
	lsr.l	#5,d2					;$ea8a			;ffa700
	movea.l	d2,a2					;$2442			;ffa702
	moveq.l	#$00,d0					;$7000			;ffa704
	move.w	d1,d0					;$3001			;ffa706
	swap.w	d0					;$4840			;ffa708
	lsr.l	#5,d0					;$ea88			;ffa70a
	movea.l	d0,a1					;$2240			;ffa70c
	adda.l	a2,a1					;$d3ca			;ffa70e
	move.l	($0944),d0				;$2038,$0944		;ffa710
	add.l	($0948),d0				;$d0b8,$0948		;ffa714
	adda.l	d0,a1					;$d3c0			;ffa718
	adda.l	d0,a2					;$d5c0			;ffa71a
	bsr.w	Lffa136					;$6100,$fa18		;ffa71c
	bra.s	Lffa6e4					;$60c2			;ffa720
Lffa722:									;ffa722
	moveq.l	#$00,d6					;$7c00			;ffa722
	tst.w	d1					;$4a41			;ffa724
	bpl.s	Lffa72a					;$6a02			;ffa726
	moveq.l	#$01,d1					;$7201			;ffa728
Lffa72a:									;ffa72a
	move.w	($0970),d3				;$3638,$0970		;ffa72a
	move.w	($0974),d2				;$3438,$0974		;ffa72e
	sub.w	d2,d3					;$9642			;ffa732
	bcs.s	Lffa760					;$652a			;ffa734
	cmp.w	d1,d3					;$b641			;ffa736
	bcs.s	Lffa744					;$650a			;ffa738
	move.w	d1,d0					;$3001			;ffa73a
	subq.w	#1,d0					;$5340			;ffa73c
	move.w	($0974),d2				;$3438,$0974		;ffa73e
	bra.s	Lffa74e					;$600a			;ffa742
Lffa744:									;ffa744
	move.w	($0970),d0				;$3038,$0970		;ffa744
	move.w	($0974),d2				;$3438,$0974		;ffa748
	sub.w	d2,d0					;$9042			;ffa74c
Lffa74e:									;ffa74e
	move.b	($0994),d7				;$1e38,$0994		;ffa74e
	move.b	d6,($0994)				;$11c6,$0994		;ffa752
	bsr.w	Lffa560					;$6100,$fe08		;ffa756
	move.b	d7,($0994)				;$11c7,$0994		;ffa75a
	rts						;$4e75			;ffa75e

Lffa760:									;ffa760
	moveq.l	#$ff,d0					;$70ff			;ffa760
	rts						;$4e75			;ffa762

Lffa764:									;ffa764
	move.b	($0994),d6				;$1c38,$0994		;ffa764
	tst.w	d1					;$4a41			;ffa768
	bgt.s	Lffa76e					;$6e02			;ffa76a
	moveq.l	#$01,d1					;$7201			;ffa76c
Lffa76e:									;ffa76e
	move.w	d1,d4					;$3801			;ffa76e
	move.w	($0970),d3				;$3638,$0970		;ffa770
	move.w	($0974),d1				;$3238,$0974		;ffa774
	sub.w	d1,d3					;$9641			;ffa778
	bcs.s	Lffa760					;$65e4			;ffa77a
	sub.w	d4,d3					;$9644			;ffa77c
	bcs.s	Lffa744					;$65c4			;ffa77e
	add.w	d4,d1					;$d244			;ffa780
	move.w	($0974),d2				;$3438,$0974		;ffa782
	bsr.s	Lffa7ca					;$6142			;ffa786
	move.w	($0970),d2				;$3438,$0970		;ffa788
	move.w	d4,d0					;$3004			;ffa78c
	subq.w	#1,d0					;$5340			;ffa78e
	sub.w	d0,d2					;$9440			;ffa790
	bra.s	Lffa74e					;$60ba			;ffa792
Lffa794:									;ffa794
	moveq.l	#$00,d6					;$7c00			;ffa794
	tst.w	d1					;$4a41			;ffa796
	bpl.s	Lffa79c					;$6a02			;ffa798
	moveq.l	#$01,d1					;$7201			;ffa79a
Lffa79c:									;ffa79c
	move.w	d1,d4					;$3801			;ffa79c
	move.w	($0970),d3				;$3638,$0970		;ffa79e
	move.w	($0974),d1				;$3238,$0974		;ffa7a2
	sub.w	d1,d3					;$9641			;ffa7a6
	bcs.s	Lffa760					;$65b6			;ffa7a8
	sub.w	d4,d3					;$9644			;ffa7aa
	bcs.s	Lffa744					;$6596			;ffa7ac
	move.w	($0970),d2				;$3438,$0970		;ffa7ae
	add.w	d3,d1					;$d243			;ffa7b2
	addq.w	#1,d1					;$5241			;ffa7b4
	addq.w	#1,d2					;$5242			;ffa7b6
	bsr.s	Lffa7c4					;$610a			;ffa7b8
	move.w	($0974),d2				;$3438,$0974		;ffa7ba
	move.w	d4,d0					;$3004			;ffa7be
	subq.w	#1,d0					;$5340			;ffa7c0
	bra.s	Lffa74e					;$608a			;ffa7c2
Lffa7c4:									;ffa7c4
	lea.l	(Lffa814,pc),a4				;$49fa,$004e		;ffa7c4
	bra.s	Lffa7ce					;$6004			;ffa7c8
Lffa7ca:									;ffa7ca
	lea.l	(Lffa7fc,pc),a4				;$49fa,$0030		;ffa7ca
Lffa7ce:									;ffa7ce
	moveq.l	#$00,d0					;$7000			;ffa7ce
	move.w	($0976),d0				;$3038,$0976		;ffa7d0
	swap.w	d0					;$4840			;ffa7d4
	lsr.l	#5,d0					;$ea88			;ffa7d6
	movea.l	d0,a0					;$2040			;ffa7d8
	adda.l	($0948),a0				;$d1f8,$0948		;ffa7da
	adda.l	($0944),a0				;$d1f8,$0944		;ffa7de
	movea.l	a0,a1					;$2248			;ffa7e2
	adda.w	d1,a0					;$d0c1			;ffa7e4
	adda.w	d2,a1					;$d2c2			;ffa7e6
	moveq.l	#$02,d0					;$7002			;ffa7e8
	swap.w	d0					;$4840			;ffa7ea
	movea.l	a0,a2					;$2448			;ffa7ec
	movea.l	a1,a3					;$2649			;ffa7ee
	adda.l	d0,a2					;$d5c0			;ffa7f0
	adda.l	d0,a3					;$d7c0			;ffa7f2
	moveq.l	#$7f,d2					;$747f			;ffa7f4
	sub.w	d3,d2					;$9443			;ffa7f6
	moveq.l	#$0f,d1					;$720f			;ffa7f8
	jmp	(a4)					;$4ed4			;ffa7fa

Lffa7fc:									;ffa7fc
	move.w	d3,d0					;$3003			;ffa7fc
Lffa7fe:									;ffa7fe
	move.b	(a0)+,(a1)+				;$12d8			;ffa7fe
	move.b	(a2)+,(a3)+				;$16da			;ffa800
	dbra.w	d0,Lffa7fe				;$51c8,$fffa		;ffa802
	adda.w	d2,a0					;$d0c2			;ffa806
	adda.w	d2,a1					;$d2c2			;ffa808
	adda.w	d2,a2					;$d4c2			;ffa80a
	adda.w	d2,a3					;$d6c2			;ffa80c
	dbra.w	d1,Lffa7fc				;$51c9,$ffec		;ffa80e
	rts						;$4e75			;ffa812

Lffa814:									;ffa814
	move.w	#$0780,d0				;$303c,$0780		;ffa814
	adda.w	d0,a0					;$d0c0			;ffa818
	adda.w	d0,a1					;$d2c0			;ffa81a
	adda.w	d0,a2					;$d4c0			;ffa81c
	adda.w	d0,a3					;$d6c0			;ffa81e
Lffa820:									;ffa820
	move.w	d3,d0					;$3003			;ffa820
Lffa822:									;ffa822
	move.b	-(a0),-(a1)				;$1320			;ffa822
	move.b	-(a2),-(a3)				;$1722			;ffa824
	dbra.w	d0,Lffa822				;$51c8,$fffa		;ffa826
	suba.w	d2,a0					;$90c2			;ffa82a
	suba.w	d2,a1					;$92c2			;ffa82c
	suba.w	d2,a2					;$94c2			;ffa82e
	suba.w	d2,a3					;$96c2			;ffa830
	dbra.w	d1,Lffa820				;$51c9,$ffec		;ffa832
	rts						;$4e75			;ffa836

Lffa838:									;ffa838
	movec.l	vbr,d0					;$4e7a,$0801		;ffa838
	bra.s	Lffa842					;$6004			;ffa83c
Lffa83e:									;ffa83e
	bra.s	Lffa838					;$60f8			;ffa83e
Call_B_INTVCS:									;ffa840
	moveq.l	#$00,d0					;$7000			;ffa840
Lffa842:									;ffa842
	cmp.w	#$0200,d1				;$b27c,$0200		;ffa842
	bcc.s	Lffa858					;$6410			;ffa846
	add.w	d1,d0					;$d041			;ffa848
	add.w	d1,d0					;$d041			;ffa84a
	add.w	d1,d0					;$d041			;ffa84c
	add.w	d1,d0					;$d041			;ffa84e
	movea.l	d0,a0					;$2040			;ffa850
	move.l	(a0),d0					;$2010			;ffa852
	move.l	a1,(a0)					;$2089			;ffa854
	rts						;$4e75			;ffa856

Lffa858:									;ffa858
	moveq.l	#$ff,d0					;$70ff			;ffa858
	rts						;$4e75			;ffa85a

Call_B_SUPER:									;ffa85c
	move.l	a1,d0					;$2009			;ffa85c
	beq.s	Lffa87a					;$671a			;ffa85e
	lea.l	($000e,a7),a0				;$41ef,$000e		;ffa860
	moveq.l	#$00,d0					;$7000			;ffa864
	tst.b	($0cbc)					;$4a38,$0cbc		;ffa866
	beq.s	Lffa870					;$6704			;ffa86a
	addq.l	#2,a0					;$5488			;ffa86c
	move.w	-(a0),-(a1)				;$3320			;ffa86e
Lffa870:									;ffa870
	move.l	-(a0),-(a1)				;$2320			;ffa870
	move.w	-(a0),-(a1)				;$3320			;ffa872
	andi.w	#$dfff,(a1)				;$0251,$dfff		;ffa874
	bra.s	Lffa8a0					;$6026			;ffa878
Lffa87a:									;ffa87a
	moveq.l	#$ff,d0					;$70ff			;ffa87a
	btst.b	#$05,($0008,a7)				;$082f,$0005,$0008	;ffa87c
	bne.s	Lffa8a6					;$6622			;ffa882
	lea.l	($000e,a7),a0				;$41ef,$000e		;ffa884
	move.l	usp,a1					;$4e69			;ffa888
	move.l	a0,d0					;$2008			;ffa88a
	tst.b	($0cbc)					;$4a38,$0cbc		;ffa88c
	beq.s	Lffa898					;$6706			;ffa890
	addq.l	#2,a0					;$5488			;ffa892
	move.l	a0,d0					;$2008			;ffa894
	move.w	-(a0),-(a1)				;$3320			;ffa896
Lffa898:									;ffa898
	move.l	-(a0),-(a1)				;$2320			;ffa898
	move.w	-(a0),-(a1)				;$3320			;ffa89a
	ori.w	#$2000,(a1)				;$0051,$2000		;ffa89c
Lffa8a0:									;ffa8a0
	move.l	-(a0),-(a1)				;$2320			;ffa8a0
	move.l	-(a0),-(a1)				;$2320			;ffa8a2
	movea.l	a1,a7					;$2e49			;ffa8a4
Lffa8a6:									;ffa8a6
	rts						;$4e75			;ffa8a6

Call_B_BPEEK:									;ffa8a8
	move.b	(a1)+,d0				;$1019			;ffa8a8
	rts						;$4e75			;ffa8aa

Call_B_WPEEK:									;ffa8ac
	move.w	(a1)+,d0				;$3019			;ffa8ac
	rts						;$4e75			;ffa8ae

Call_B_LPEEK:									;ffa8b0
	move.l	(a1)+,d0				;$2019			;ffa8b0
	rts						;$4e75			;ffa8b2

Call_B_MEMSTR:									;ffa8b4
	swap.w	d1					;$4841			;ffa8b4
Lffa8b6:									;ffa8b6
	swap.w	d1					;$4841			;ffa8b6
Lffa8b8:									;ffa8b8
	move.b	(a1)+,(a2)+				;$14d9			;ffa8b8
	dbra.w	d1,Lffa8b8				;$51c9,$fffc		;ffa8ba
	swap.w	d1					;$4841			;ffa8be
	dbra.w	d1,Lffa8b6				;$51c9,$fff4		;ffa8c0
	rts						;$4e75			;ffa8c4

Call_B_BPOKE:									;ffa8c6
	move.b	d1,(a1)+				;$12c1			;ffa8c6
	rts						;$4e75			;ffa8c8

Call_B_WPOKE:									;ffa8ca
	move.w	d1,(a1)+				;$32c1			;ffa8ca
	rts						;$4e75			;ffa8cc

Call_B_LPOKE:									;ffa8ce
	move.l	d1,(a1)+				;$22c1			;ffa8ce
	rts						;$4e75			;ffa8d0

Call_B_MEMSET:									;ffa8d2
	swap.w	d1					;$4841			;ffa8d2
Lffa8d4:									;ffa8d4
	swap.w	d1					;$4841			;ffa8d4
Lffa8d6:									;ffa8d6
	move.b	(a2)+,(a1)+				;$12da			;ffa8d6
	dbra.w	d1,Lffa8d6				;$51c9,$fffc		;ffa8d8
	swap.w	d1					;$4841			;ffa8dc
	dbra.w	d1,Lffa8d4				;$51c9,$fff4		;ffa8de
	rts						;$4e75			;ffa8e2

Call_DMAMOVE:									;ffa8e4
	cmp.l	#$0000ff00,d2				;$b4bc,$0000,$ff00	;ffa8e4
	bcs.s	Lffa920					;$6534			;ffa8ea
	move.l	d2,-(a7)				;$2f02			;ffa8ec
	move.l	#$0000ff00,d2				;$243c,$0000,$ff00	;ffa8ee
	bsr.s	Lffa920					;$612a			;ffa8f4
	btst.l	#$00,d1					;$0801,$0000		;ffa8f6
	beq.s	Lffa8fe					;$6702			;ffa8fa
	adda.l	d2,a2					;$d5c2			;ffa8fc
Lffa8fe:									;ffa8fe
	btst.l	#$01,d1					;$0801,$0001		;ffa8fe
	beq.s	Lffa906					;$6702			;ffa902
	suba.l	d2,a2					;$95c2			;ffa904
Lffa906:									;ffa906
	btst.l	#$02,d1					;$0801,$0002		;ffa906
	beq.s	Lffa90e					;$6702			;ffa90a
	adda.l	d2,a1					;$d3c2			;ffa90c
Lffa90e:									;ffa90e
	btst.l	#$03,d1					;$0801,$0003		;ffa90e
	beq.s	Lffa916					;$6702			;ffa912
	suba.l	d2,a1					;$93c2			;ffa914
Lffa916:									;ffa916
	move.l	d2,d0					;$2002			;ffa916
	move.l	(a7)+,d2				;$241f			;ffa918
	sub.l	d0,d2					;$9480			;ffa91a
	bne.s	Call_DMAMOVE				;$66c6			;ffa91c
	rts						;$4e75			;ffa91e

Lffa920:									;ffa920
	tst.b	($0c34)					;$4a38,$0c34		;ffa920
	bne.s	Lffa920					;$66fa			;ffa924
	move.b	#$8a,($0c34)				;$11fc,$008a,$0c34	;ffa926
	lea.l	($00e84080),a0				;$41f9,$00e8,$4080	;ffa92c
	move.b	d1,d0					;$1001			;ffa932
	and.b	#$80,d0					;$c03c,$0080		;ffa934
	or.b	#$01,d0					;$803c,$0001		;ffa938
	move.b	d0,($0005,a0)				;$1140,$0005		;ffa93c
	move.l	a1,($000c,a0)				;$2149,$000c		;ffa940
	move.b	d1,d0					;$1001			;ffa944
	and.b	#$7f,d0					;$c03c,$007f		;ffa946
	move.b	d0,($0006,a0)				;$1140,$0006		;ffa94a
	move.l	a2,($0014,a0)				;$214a,$0014		;ffa94e
	st.b	(a0)					;$50d0			;ffa952
	move.w	d2,($000a,a0)				;$3142,$000a		;ffa954
	bsr.w	Lff8284					;$6100,$d92a		;ffa958
	move.b	#$88,($0007,a0)				;$117c,$0088,$0007	;ffa95c
	rts						;$4e75			;ffa962

Call_DMAMOV_A:									;ffa964
	tst.b	($0c34)					;$4a38,$0c34		;ffa964
	bne.s	Call_DMAMOV_A				;$66fa			;ffa968
	move.b	#$8b,($0c34)				;$11fc,$008b,$0c34	;ffa96a
	lea.l	($00e84080),a0				;$41f9,$00e8,$4080	;ffa970
	move.b	d1,d0					;$1001			;ffa976
	and.b	#$80,d0					;$c03c,$0080		;ffa978
	or.b	#$09,d0					;$803c,$0009		;ffa97c
	move.b	d0,($0005,a0)				;$1140,$0005		;ffa980
Lffa984:									;ffa984
	move.l	a1,($001c,a0)				;$2149,$001c		;ffa984
	move.b	d1,d0					;$1001			;ffa988
	and.b	#$7f,d0					;$c03c,$007f		;ffa98a
	move.b	d0,($0006,a0)				;$1140,$0006		;ffa98e
	move.l	a2,($0014,a0)				;$214a,$0014		;ffa992
	st.b	(a0)					;$50d0			;ffa996
	move.w	d2,($001a,a0)				;$3142,$001a		;ffa998
	bsr.w	Lff8284					;$6100,$d8e6		;ffa99c
	move.b	#$88,($0007,a0)				;$117c,$0088,$0007	;ffa9a0
	rts						;$4e75			;ffa9a6

Call_DMAMOV_L:									;ffa9a8
	tst.b	($0c34)					;$4a38,$0c34		;ffa9a8
	bne.s	Call_DMAMOV_L				;$66fa			;ffa9ac
	move.b	#$8c,($0c34)				;$11fc,$008c,$0c34	;ffa9ae
	lea.l	($00e84080),a0				;$41f9,$00e8,$4080	;ffa9b4
	move.b	d1,d0					;$1001			;ffa9ba
	and.b	#$80,d0					;$c03c,$0080		;ffa9bc
	or.b	#$0d,d0					;$803c,$000d		;ffa9c0
	move.b	d0,($0005,a0)				;$1140,$0005		;ffa9c4
	bra.s	Lffa984					;$60ba			;ffa9c8
Call_DMAMODE:									;ffa9ca
	clr.l	d0					;$4280			;ffa9ca
	move.b	($0c34),d0				;$1038,$0c34		;ffa9cc
	rts						;$4e75			;ffa9d0

Call_BOOTINF:									;ffa9d2
	clr.l	d0					;$4280			;ffa9d2
	move.b	($09df),d0				;$1038,$09df		;ffa9d4
	ror.l	#8,d0					;$e098			;ffa9d8
	move.b	($09e0),d0				;$1038,$09e0		;ffa9da
	cmp.b	#$01,d0					;$b03c,$0001		;ffa9de
	beq.s	Lffa9ec					;$6708			;ffa9e2
	cmp.b	#$02,d0					;$b03c,$0002		;ffa9e4
	beq.s	Lffa9fa					;$6710			;ffa9e8
	rts						;$4e75			;ffa9ea

Lffa9ec:									;ffa9ec
	clr.w	d0					;$4240			;ffa9ec
	move.l	d0,-(a7)				;$2f00			;ffa9ee
	move.l	($00ed000c),d0				;$2039,$00ed,$000c	;ffa9f0
	or.l	(a7)+,d0				;$809f			;ffa9f6
	rts						;$4e75			;ffa9f8

Lffa9fa:									;ffa9fa
	clr.w	d0					;$4240			;ffa9fa
	move.l	d0,-(a7)				;$2f00			;ffa9fc
	move.l	($00ed0010),d0				;$2039,$00ed,$0010	;ffa9fe
	or.l	(a7)+,d0				;$809f			;ffaa04
	rts						;$4e75			;ffaa06

Lffaa08:									;ffaa08
	tst.b	($0ade)					;$4a38,$0ade		;ffaa08
	bne.s	Lffaa30					;$6622			;ffaa0c
	tst.b	($0bc4)					;$4a38,$0bc4		;ffaa0e
	bne.s	Lffaa30					;$661c			;ffaa12
	st.b	($0ade)					;$50f8,$0ade		;ffaa14
	movem.l	d0-d7/a0-a6,-(a7)			;$48e7,$fffe		;ffaa18
	lea.l	($0a7a),a5				;$4bf8,$0a7a		;ffaa1c
	bsr.w	Lffaf44					;$6100,$0522		;ffaa20
	bsr.w	Lffae58					;$6100,$0432		;ffaa24
	movem.l	(a7)+,d0-d7/a0-a6			;$4cdf,$7fff		;ffaa28
	sf.b	($0ade)					;$51f8,$0ade		;ffaa2c
Lffaa30:									;ffaa30
	rts						;$4e75			;ffaa30

Call_MS_INIT:									;ffaa32
	move.l	a5,-(a7)				;$2f0d			;ffaa32
	movem.l	d1-d7/a0-a4,-(a7)			;$48e7,$7ff8		;ffaa34
	lea.l	($0a7a),a5				;$4bf8,$0a7a		;ffaa38
	movem.l	d1-d2/a1,($006a,a5)			;$48ed,$0206,$006a	;ffaa3c
	bsr.s	Call_MS_CUROF				;$6146			;ffaa42
	st.b	($0064,a5)				;$50ed,$0064		;ffaa44
	bsr.w	Lffaff0					;$6100,$05a6		;ffaa48
	bsr.w	Lffafe2					;$6100,$0594		;ffaa4c
	sf.b	($0064,a5)				;$51ed,$0064		;ffaa50
	movem.l	(a7)+,d1-d7/a0-a4			;$4cdf,$1ffe		;ffaa54
	movea.l	(a7)+,a5				;$2a5f			;ffaa58
	rts						;$4e75			;ffaa5a

Call_MS_CURON:									;ffaa5c
	move.l	a5,-(a7)				;$2f0d			;ffaa5c
	movem.l	d1-d7/a0-a4,-(a7)			;$48e7,$7ff8		;ffaa5e
	lea.l	($0a7a),a5				;$4bf8,$0a7a		;ffaa62
	movem.l	d1-d2/a1,($006a,a5)			;$48ed,$0206,$006a	;ffaa66
	st.b	($0064,a5)				;$50ed,$0064		;ffaa6c
	tst.b	($0028,a5)				;$4a2d,$0028		;ffaa70
	bne.s	Lffaa7e					;$6608			;ffaa74
	bsr.w	Lffaf6a					;$6100,$04f2		;ffaa76
	st.b	($0028,a5)				;$50ed,$0028		;ffaa7a
Lffaa7e:									;ffaa7e
	sf.b	($0064,a5)				;$51ed,$0064		;ffaa7e
	movem.l	(a7)+,d1-d7/a0-a4			;$4cdf,$1ffe		;ffaa82
	movea.l	(a7)+,a5				;$2a5f			;ffaa86
	rts						;$4e75			;ffaa88

Call_MS_CUROF:									;ffaa8a
	move.l	a5,-(a7)				;$2f0d			;ffaa8a
	movem.l	d1-d7/a0-a4,-(a7)			;$48e7,$7ff8		;ffaa8c
	lea.l	($0a7a),a5				;$4bf8,$0a7a		;ffaa90
	movem.l	d1-d2/a1,($006a,a5)			;$48ed,$0206,$006a	;ffaa94
	st.b	($0064,a5)				;$50ed,$0064		;ffaa9a
	tst.b	($0028,a5)				;$4a2d,$0028		;ffaa9e
	beq.s	Lffaaac					;$6708			;ffaaa2
	sf.b	($0028,a5)				;$51ed,$0028		;ffaaa4
	bsr.w	Lffafb4					;$6100,$050a		;ffaaa8
Lffaaac:									;ffaaac
	sf.b	($0064,a5)				;$51ed,$0064		;ffaaac
	movem.l	(a7)+,d1-d7/a0-a4			;$4cdf,$1ffe		;ffaab0
	movea.l	(a7)+,a5				;$2a5f			;ffaab4
	rts						;$4e75			;ffaab6

Call_MS_STAT:									;ffaab8
	move.l	a5,-(a7)				;$2f0d			;ffaab8
	movem.l	d1-d7/a0-a4,-(a7)			;$48e7,$7ff8		;ffaaba
	lea.l	($0a7a),a5				;$4bf8,$0a7a		;ffaabe
	movem.l	d1-d2/a1,($006a,a5)			;$48ed,$0206,$006a	;ffaac2
	moveq.l	#$00,d0					;$7000			;ffaac8
	move.b	($0028,a5),d0				;$102d,$0028		;ffaaca
	ext.w	d0					;$4880			;ffaace
	movem.l	(a7)+,d1-d7/a0-a4			;$4cdf,$1ffe		;ffaad0
	movea.l	(a7)+,a5				;$2a5f			;ffaad4
	rts						;$4e75			;ffaad6

Call_MS_GETDT:									;ffaad8
	move.l	a5,-(a7)				;$2f0d			;ffaad8
	movem.l	d1-d7/a0-a4,-(a7)			;$48e7,$7ff8		;ffaada
	lea.l	($0a7a),a5				;$4bf8,$0a7a		;ffaade
	movem.l	d1-d2/a1,($006a,a5)			;$48ed,$0206,$006a	;ffaae2
	move.w	($0050,a5),d0				;$302d,$0050		;ffaae8
	lsl.w	#8,d0					;$e148			;ffaaec
	move.w	($0052,a5),d1				;$322d,$0052		;ffaaee
	and.w	#$00ff,d1				;$c27c,$00ff		;ffaaf2
	or.w	d1,d0					;$8041			;ffaaf6
	swap.w	d0					;$4840			;ffaaf8
	move.w	($004c,a5),d1				;$322d,$004c		;ffaafa
	lsl.w	#8,d1					;$e149			;ffaafe
	move.w	($004e,a5),d0				;$302d,$004e		;ffab00
	and.w	#$00ff,d0				;$c07c,$00ff		;ffab04
	or.w	d1,d0					;$8041			;ffab08
	movem.l	(a7)+,d1-d7/a0-a4			;$4cdf,$1ffe		;ffab0a
	movea.l	(a7)+,a5				;$2a5f			;ffab0e
	rts						;$4e75			;ffab10

Call_MS_CURGT:									;ffab12
	move.l	a5,-(a7)				;$2f0d			;ffab12
	movem.l	d1-d7/a0-a4,-(a7)			;$48e7,$7ff8		;ffab14
	lea.l	($0a7a),a5				;$4bf8,$0a7a		;ffab18
	movem.l	d1-d2/a1,($006a,a5)			;$48ed,$0206,$006a	;ffab1c
	move.l	($0054,a5),d0				;$202d,$0054		;ffab22
	movem.l	(a7)+,d1-d7/a0-a4			;$4cdf,$1ffe		;ffab26
	movea.l	(a7)+,a5				;$2a5f			;ffab2a
	rts						;$4e75			;ffab2c

Call_MS_CURST:									;ffab2e
	move.l	a5,-(a7)				;$2f0d			;ffab2e
	movem.l	d1-d7/a0-a4,-(a7)			;$48e7,$7ff8		;ffab30
	lea.l	($0a7a),a5				;$4bf8,$0a7a		;ffab34
	movem.l	d1-d2/a1,($006a,a5)			;$48ed,$0206,$006a	;ffab38
	st.b	($0064,a5)				;$50ed,$0064		;ffab3e
	move.l	($0020,a5),d3				;$262d,$0020		;ffab42
	move.l	($0024,a5),d2				;$242d,$0024		;ffab46
	move.l	d1,d0					;$2001			;ffab4a
	sub.w	d3,d2					;$9443			;ffab4c
	sub.w	d3,d0					;$9043			;ffab4e
	cmp.w	d0,d2					;$b440			;ffab50
	bcs.s	Lffab84					;$6530			;ffab52
	swap.w	d2					;$4842			;ffab54
	swap.w	d3					;$4843			;ffab56
	swap.w	d0					;$4840			;ffab58
	sub.w	d3,d2					;$9443			;ffab5a
	sub.w	d3,d0					;$9043			;ffab5c
	cmp.w	d0,d2					;$b440			;ffab5e
	bcs.s	Lffab84					;$6522			;ffab60
	move.b	($0028,a5),-(a7)			;$1f2d,$0028		;ffab62
	bsr.w	Call_MS_CUROF				;$6100,$ff22		;ffab66
	move.l	d1,($0054,a5)				;$2b41,$0054		;ffab6a
	tst.b	(a7)+					;$4a1f			;ffab6e
	beq.s	Lffab76					;$6704			;ffab70
	bsr.w	Call_MS_CURON				;$6100,$fee8		;ffab72
Lffab76:									;ffab76
	moveq.l	#$00,d0					;$7000			;ffab76
Lffab78:									;ffab78
	sf.b	($0064,a5)				;$51ed,$0064		;ffab78
	movem.l	(a7)+,d1-d7/a0-a4			;$4cdf,$1ffe		;ffab7c
	movea.l	(a7)+,a5				;$2a5f			;ffab80
	rts						;$4e75			;ffab82

Lffab84:									;ffab84
	moveq.l	#$ff,d0					;$70ff			;ffab84
	bra.s	Lffab78					;$60f0			;ffab86
Call_MS_LIMIT:									;ffab88
	move.l	a5,-(a7)				;$2f0d			;ffab88
	movem.l	d1-d7/a0-a4,-(a7)			;$48e7,$7ff8		;ffab8a
	lea.l	($0a7a),a5				;$4bf8,$0a7a		;ffab8e
	movem.l	d1-d2/a1,($006a,a5)			;$48ed,$0206,$006a	;ffab92
	st.b	($0064,a5)				;$50ed,$0064		;ffab98
	move.l	($006a,a5),d1				;$222d,$006a		;ffab9c
	move.l	($006e,a5),d2				;$242d,$006e		;ffaba0
	cmp.w	#$03f0,d1				;$b27c,$03f0		;ffaba4
	bcc.s	Lffac22					;$6478			;ffaba8
	swap.w	d1					;$4841			;ffabaa
	cmp.w	#$0400,d1				;$b27c,$0400		;ffabac
	bcc.s	Lffac22					;$6470			;ffabb0
	swap.w	d1					;$4841			;ffabb2
	cmp.w	#$03f0,d2				;$b47c,$03f0		;ffabb4
	bcc.s	Lffac22					;$6468			;ffabb8
	cmp.w	d1,d2					;$b441			;ffabba
	ble.s	Lffac22					;$6f64			;ffabbc
	swap.w	d1					;$4841			;ffabbe
	swap.w	d2					;$4842			;ffabc0
	cmp.w	#$0400,d2				;$b47c,$0400		;ffabc2
	bcc.s	Lffac22					;$645a			;ffabc6
	cmp.w	d1,d2					;$b441			;ffabc8
	ble.s	Lffac22					;$6f56			;ffabca
	swap.w	d1					;$4841			;ffabcc
	swap.w	d2					;$4842			;ffabce
	move.b	($0028,a5),-(a7)			;$1f2d,$0028		;ffabd0
	bsr.w	Call_MS_CUROF				;$6100,$feb4		;ffabd4
	move.l	d1,($0020,a5)				;$2b41,$0020		;ffabd8
	move.l	d2,($0024,a5)				;$2b42,$0024		;ffabdc
	move.l	($0054,a5),d3				;$262d,$0054		;ffabe0
	cmp.w	d3,d1					;$b243			;ffabe4
	ble.s	Lffabea					;$6f02			;ffabe6
	move.w	d1,d3					;$3601			;ffabe8
Lffabea:									;ffabea
	swap.w	d1					;$4841			;ffabea
	swap.w	d3					;$4843			;ffabec
	cmp.w	d3,d1					;$b243			;ffabee
	ble.s	Lffabf4					;$6f02			;ffabf0
	move.w	d1,d3					;$3601			;ffabf2
Lffabf4:									;ffabf4
	swap.w	d3					;$4843			;ffabf4
	cmp.w	d3,d2					;$b443			;ffabf6
	bgt.s	Lffabfc					;$6e02			;ffabf8
	move.w	d2,d3					;$3602			;ffabfa
Lffabfc:									;ffabfc
	swap.w	d2					;$4842			;ffabfc
	swap.w	d3					;$4843			;ffabfe
	cmp.w	d3,d2					;$b443			;ffac00
	bgt.s	Lffac06					;$6e02			;ffac02
	move.w	d2,d3					;$3602			;ffac04
Lffac06:									;ffac06
	swap.w	d3					;$4843			;ffac06
	move.l	d3,($0054,a5)				;$2b43,$0054		;ffac08
	tst.b	(a7)+					;$4a1f			;ffac0c
	beq.s	Lffac14					;$6704			;ffac0e
	bsr.w	Call_MS_CURON				;$6100,$fe4a		;ffac10
Lffac14:									;ffac14
	moveq.l	#$00,d0					;$7000			;ffac14
Lffac16:									;ffac16
	sf.b	($0064,a5)				;$51ed,$0064		;ffac16
	movem.l	(a7)+,d1-d7/a0-a4			;$4cdf,$1ffe		;ffac1a
	movea.l	(a7)+,a5				;$2a5f			;ffac1e
	rts						;$4e75			;ffac20

Lffac22:									;ffac22
	moveq.l	#$ff,d0					;$70ff			;ffac22
	bra.s	Lffac16					;$60f0			;ffac24
Call_MS_OFFTM:									;ffac26
	move.l	a5,-(a7)				;$2f0d			;ffac26
	movem.l	d1-d7/a0-a4,-(a7)			;$48e7,$7ff8		;ffac28
	lea.l	($0a7a),a5				;$4bf8,$0a7a		;ffac2c
	movem.l	d1-d2/a1,($006a,a5)			;$48ed,$0206,$006a	;ffac30
	clr.w	d7					;$4247			;ffac36
	bra.s	Lffac4e					;$6014			;ffac38
Call_MS_ONTM:									;ffac3a
	move.l	a5,-(a7)				;$2f0d			;ffac3a
	movem.l	d1-d7/a0-a4,-(a7)			;$48e7,$7ff8		;ffac3c
	lea.l	($0a7a),a5				;$4bf8,$0a7a		;ffac40
	movem.l	d1-d2/a1,($006a,a5)			;$48ed,$0206,$006a	;ffac44
	move.w	#$ffff,d7				;$3e3c,$ffff		;ffac4a
Lffac4e:									;ffac4e
	move.l	($0054,a5),($0058,a5)			;$2b6d,$0054,$0058	;ffac4e
	lea.l	($004c,a5),a0				;$41ed,$004c		;ffac54
	tst.w	($006c,a5)				;$4a6d,$006c		;ffac58
	beq.s	Lffac62					;$6704			;ffac5c
	lea.l	($0002,a0),a0				;$41e8,$0002		;ffac5e
Lffac62:									;ffac62
	move.w	#$0001,d1				;$323c,$0001		;ffac62
	move.w	#$0064,d2				;$343c,$0064		;ffac66
	mulu.w	($0cb8),d2				;$c4f8,$0cb8		;ffac6a
	divu.w	#$0342,d2				;$84fc,$0342		;ffac6e
	cmpi.b	#$01,($0cbc)				;$0c38,$0001,$0cbc	;ffac72
	bls.s	Lffac86					;$630c			;ffac78
	movec.l	cacr,d0					;$4e7a,$0002		;ffac7a
	move.l	d0,-(a7)				;$2f00			;ffac7e
	moveq.l	#$01,d0					;$7001			;ffac80
	movec.l	d0,cacr					;$4e7b,$0002		;ffac82
Lffac86:									;ffac86
	move.w	($0054,a5),d0				;$302d,$0054		;ffac86
	sub.w	($0058,a5),d0				;$906d,$0058		;ffac8a
	cmp.w	($000a,a5),d0				;$b06d,$000a		;ffac8e
	bgt.s	Lfface6					;$6e52			;ffac92
	neg.w	d0					;$4440			;ffac94
	cmp.w	($000a,a5),d0				;$b06d,$000a		;ffac96
	bgt.s	Lfface6					;$6e4a			;ffac9a
	move.w	($0056,a5),d0				;$302d,$0056		;ffac9c
	sub.w	($005a,a5),d0				;$906d,$005a		;ffaca0
	cmp.w	($000a,a5),d0				;$b06d,$000a		;ffaca4
	bgt.s	Lfface6					;$6e3c			;ffaca8
	neg.w	d0					;$4440			;ffacaa
	cmp.w	($000a,a5),d0				;$b06d,$000a		;ffacac
	bgt.s	Lfface6					;$6e34			;ffacb0
	tst.w	d7					;$4a47			;ffacb2
	bne.s	Lffacbc					;$6606			;ffacb4
	tst.w	(a0)					;$4a50			;ffacb6
	beq.s	Lfface8					;$672e			;ffacb8
	bra.s	Lffacc0					;$6004			;ffacba
Lffacbc:									;ffacbc
	tst.w	(a0)					;$4a50			;ffacbc
	bne.s	Lfface8					;$6628			;ffacbe
Lffacc0:									;ffacc0
	subq.w	#1,d2					;$5342			;ffacc0
	bne.s	Lffacde					;$661a			;ffacc2
	cmp.w	#$ffff,d1				;$b27c,$ffff		;ffacc4
	beq.s	Lffacd2					;$6708			;ffacc8
	addq.w	#1,d1					;$5241			;ffacca
	cmp.w	($0070,a5),d1				;$b26d,$0070		;ffaccc
	beq.s	Lfface0					;$670e			;ffacd0
Lffacd2:									;ffacd2
	move.w	#$0064,d2				;$343c,$0064		;ffacd2
	mulu.w	($0cb8),d2				;$c4f8,$0cb8		;ffacd6
	divu.w	#$0342,d2				;$84fc,$0342		;ffacda
Lffacde:									;ffacde
	bra.s	Lffac86					;$60a6			;ffacde
Lfface0:									;fface0
	move.w	#$ffff,d1				;$323c,$ffff		;fface0
	bra.s	Lfface8					;$6002			;fface4
Lfface6:									;fface6
	clr.w	d1					;$4241			;fface6
Lfface8:									;fface8
	cmpi.b	#$01,($0cbc)				;$0c38,$0001,$0cbc	;fface8
	bls.s	Lffacf6					;$6306			;ffacee
	move.l	(a7)+,d0				;$201f			;ffacf0
	movec.l	d0,cacr					;$4e7b,$0002		;ffacf2
Lffacf6:									;ffacf6
	moveq.l	#$00,d0					;$7000			;ffacf6
	move.w	d1,d0					;$3001			;ffacf8
	movem.l	(a7)+,d1-d7/a0-a4			;$4cdf,$1ffe		;ffacfa
	movea.l	(a7)+,a5				;$2a5f			;ffacfe
	rts						;$4e75			;ffad00

Call_MS_PATST:									;ffad02
	move.l	a5,-(a7)				;$2f0d			;ffad02
	movem.l	d1-d7/a0-a4,-(a7)			;$48e7,$7ff8		;ffad04
	lea.l	($0a7a),a5				;$4bf8,$0a7a		;ffad08
	movem.l	d1-d2/a1,($006a,a5)			;$48ed,$0206,$006a	;ffad0c
	st.b	($0064,a5)				;$50ed,$0064		;ffad12
	move.w	($006c,a5),d1				;$322d,$006c		;ffad16
	cmp.w	#$000f,d1				;$b27c,$000f		;ffad1a
	bhi.s	Lffad46					;$6226			;ffad1e
	tst.b	($0028,a5)				;$4a2d,$0028		;ffad20
	beq.s	Lffad2e					;$6708			;ffad24
	bsr.w	Lffafb4					;$6100,$028c		;ffad26
	move.w	($006c,a5),d1				;$322d,$006c		;ffad2a
Lffad2e:									;ffad2e
	lsl.w	#2,d1					;$e549			;ffad2e
	lea.l	($00f6,a5),a0				;$41ed,$00f6		;ffad30
	lea.l	(a0,d1.w),a0				;$41f0,$1000		;ffad34
	move.l	($0072,a5),(a0)				;$20ad,$0072		;ffad38
	tst.b	($0028,a5)				;$4a2d,$0028		;ffad3c
	beq.s	Lffad46					;$6704			;ffad40
	bsr.w	Lffaf6a					;$6100,$0226		;ffad42
Lffad46:									;ffad46
	sf.b	($0064,a5)				;$51ed,$0064		;ffad46
	movem.l	(a7)+,d1-d7/a0-a4			;$4cdf,$1ffe		;ffad4a
	movea.l	(a7)+,a5				;$2a5f			;ffad4e
	rts						;$4e75			;ffad50

Call_MS_SEL:									;ffad52
	move.l	a5,-(a7)				;$2f0d			;ffad52
	movem.l	d1-d7/a0-a4,-(a7)			;$48e7,$7ff8		;ffad54
	lea.l	($0a7a),a5				;$4bf8,$0a7a		;ffad58
	movem.l	d1-d2/a1,($006a,a5)			;$48ed,$0206,$006a	;ffad5c
	st.b	($0064,a5)				;$50ed,$0064		;ffad62
	tst.b	($0028,a5)				;$4a2d,$0028		;ffad66
	beq.s	Lffad70					;$6704			;ffad6a
	bsr.w	Lffafb4					;$6100,$0246		;ffad6c
Lffad70:									;ffad70
	move.w	($006c,a5),d0				;$302d,$006c		;ffad70
	and.w	#$000f,d0				;$c07c,$000f		;ffad74
	lsl.w	#2,d0					;$e548			;ffad78
	lea.l	($00f6,a5),a0				;$41ed,$00f6		;ffad7a
	lea.l	(a0,d0.w),a0				;$41f0,$0000		;ffad7e
	movea.l	(a0),a0					;$2050			;ffad82
	move.w	(a0)+,d0				;$3018			;ffad84
	cmp.w	#$0010,d0				;$b07c,$0010		;ffad86
	bcs.s	Lffad8e					;$6502			;ffad8a
	clr.w	d0					;$4240			;ffad8c
Lffad8e:									;ffad8e
	move.w	d0,($005c,a5)				;$3b40,$005c		;ffad8e
	move.w	(a0)+,d0				;$3018			;ffad92
	cmp.w	#$0010,d0				;$b07c,$0010		;ffad94
	bcs.s	Lffad9c					;$6502			;ffad98
	clr.w	d0					;$4240			;ffad9a
Lffad9c:									;ffad9c
	move.w	d0,($005e,a5)				;$3b40,$005e		;ffad9c
	move.l	a0,($002a,a5)				;$2b48,$002a		;ffada0
	clr.w	($0046,a5)				;$426d,$0046		;ffada4
	clr.w	($0048,a5)				;$426d,$0048		;ffada8
	sf.b	($004a,a5)				;$51ed,$004a		;ffadac
	tst.b	($0028,a5)				;$4a2d,$0028		;ffadb0
	beq.s	Lffadba					;$6704			;ffadb4
	bsr.w	Lffaf6a					;$6100,$01b2		;ffadb6
Lffadba:									;ffadba
	sf.b	($0064,a5)				;$51ed,$0064		;ffadba
	movem.l	(a7)+,d1-d7/a0-a4			;$4cdf,$1ffe		;ffadbe
	movea.l	(a7)+,a5				;$2a5f			;ffadc2
	rts						;$4e75			;ffadc4

Call_MS_SEL2:									;ffadc6
	move.l	a5,-(a7)				;$2f0d			;ffadc6
	movem.l	d1-d7/a0-a4,-(a7)			;$48e7,$7ff8		;ffadc8
	lea.l	($0a7a),a5				;$4bf8,$0a7a		;ffadcc
	movem.l	d1-d2/a1,($006a,a5)			;$48ed,$0206,$006a	;ffadd0
	st.b	($0064,a5)				;$50ed,$0064		;ffadd6
	tst.b	($0028,a5)				;$4a2d,$0028		;ffadda
	beq.s	Lffade4					;$6704			;ffadde
	bsr.w	Lffafb4					;$6100,$01d2		;ffade0
Lffade4:									;ffade4
	movea.l	($0072,a5),a0				;$206d,$0072		;ffade4
	lea.l	($002a,a5),a1				;$43ed,$002a		;ffade8
	moveq.l	#$05,d7					;$7e05			;ffadec
Lffadee:									;ffadee
	move.w	(a0)+,d0				;$3018			;ffadee
	cmp.w	#$ffff,d0				;$b07c,$ffff		;ffadf0
	beq.s	Lffae32					;$673c			;ffadf4
	and.w	#$000f,d0				;$c07c,$000f		;ffadf6
	lsl.w	#2,d0					;$e548			;ffadfa
	lea.l	($00f6,a5),a2				;$45ed,$00f6		;ffadfc
	lea.l	(a2,d0.w),a2				;$45f2,$0000		;ffae00
	movea.l	(a2),a2					;$2452			;ffae04
	cmp.w	#$0005,d7				;$be7c,$0005		;ffae06
	bne.s	Lffae2a					;$661e			;ffae0a
	move.w	(a2),d0					;$3012			;ffae0c
	cmp.w	#$0010,d0				;$b07c,$0010		;ffae0e
	bcs.s	Lffae16					;$6502			;ffae12
	clr.w	d0					;$4240			;ffae14
Lffae16:									;ffae16
	move.w	d0,($005c,a5)				;$3b40,$005c		;ffae16
	move.w	($0002,a2),d0				;$302a,$0002		;ffae1a
	cmp.w	#$0010,d0				;$b07c,$0010		;ffae1e
	bcs.s	Lffae26					;$6502			;ffae22
	clr.w	d0					;$4240			;ffae24
Lffae26:									;ffae26
	move.w	d0,($005e,a5)				;$3b40,$005e		;ffae26
Lffae2a:									;ffae2a
	addq.l	#4,a2					;$588a			;ffae2a
	move.l	a2,(a1)+				;$22ca			;ffae2c
	dbra.w	d7,Lffadee				;$51cf,$ffbe		;ffae2e
Lffae32:									;ffae32
	moveq.l	#$00,d0					;$7000			;ffae32
	move.l	d0,(a1)+				;$22c0			;ffae34
	move.w	d0,($0048,a5)				;$3b40,$0048		;ffae36
	move.w	d0,($0046,a5)				;$3b40,$0046		;ffae3a
	st.b	($004a,a5)				;$50ed,$004a		;ffae3e
	tst.b	($0028,a5)				;$4a2d,$0028		;ffae42
	beq.s	Lffae4c					;$6704			;ffae46
	bsr.w	Lffaf6a					;$6100,$0120		;ffae48
Lffae4c:									;ffae4c
	sf.b	($0064,a5)				;$51ed,$0064		;ffae4c
	movem.l	(a7)+,d1-d7/a0-a4			;$4cdf,$1ffe		;ffae50
	movea.l	(a7)+,a5				;$2a5f			;ffae54
	rts						;$4e75			;ffae56

Lffae58:									;ffae58
	move.l	($0050,a5),d2				;$242d,$0050		;ffae58
	tst.b	($004a,a5)				;$4a2d,$004a		;ffae5c
	bne.s	Lffae6a					;$6608			;ffae60
Lffae62:									;ffae62
	tst.l	d2					;$4a82			;ffae62
	bne.s	Lffae96					;$6630			;ffae64
	bra.w	Lffaf18					;$6000,$00b0		;ffae66
Lffae6a:									;ffae6a
	addq.w	#1,($0048,a5)				;$526d,$0048		;ffae6a
	move.w	($0048,a5),d0				;$302d,$0048		;ffae6e
	cmp.w	($000c,a5),d0				;$b06d,$000c		;ffae72
	bne.s	Lffae62					;$66ea			;ffae76
	clr.w	($0048,a5)				;$426d,$0048		;ffae78
	addq.w	#1,($0046,a5)				;$526d,$0046		;ffae7c
	move.w	($0046,a5),d0				;$302d,$0046		;ffae80
	lea.l	($002a,a5),a0				;$41ed,$002a		;ffae84
	lsl.w	#2,d0					;$e548			;ffae88
	lea.l	(a0,d0.w),a0				;$41f0,$0000		;ffae8a
	tst.w	(a0)					;$4a50			;ffae8e
	bne.s	Lffae96					;$6604			;ffae90
	clr.w	($0046,a5)				;$426d,$0046		;ffae92
Lffae96:									;ffae96
	swap.w	d2					;$4842			;ffae96
	move.w	d2,d0					;$3002			;ffae98
	bsr.w	Lffaf20					;$6100,$0084		;ffae9a
	move.w	($0054,a5),d1				;$322d,$0054		;ffae9e
	add.w	d1,d0					;$d041			;ffaea2
	cmp.w	($0020,a5),d0				;$b06d,$0020		;ffaea4
	bgt.s	Lffaeae					;$6e04			;ffaea8
	move.w	($0020,a5),d0				;$302d,$0020		;ffaeaa
Lffaeae:									;ffaeae
	cmp.w	($0024,a5),d0				;$b06d,$0024		;ffaeae
	blt.s	Lffaeb8					;$6d04			;ffaeb2
	move.w	($0024,a5),d0				;$302d,$0024		;ffaeb4
Lffaeb8:									;ffaeb8
	move.w	d0,d7					;$3e00			;ffaeb8
	swap.w	d7					;$4847			;ffaeba
	swap.w	d2					;$4842			;ffaebc
	move.w	d2,d0					;$3002			;ffaebe
	bsr.s	Lffaf20					;$615e			;ffaec0
	move.w	($0056,a5),d1				;$322d,$0056		;ffaec2
	add.w	d1,d0					;$d041			;ffaec6
	cmp.w	($0022,a5),d0				;$b06d,$0022		;ffaec8
	bgt.s	Lffaed2					;$6e04			;ffaecc
	move.w	($0022,a5),d0				;$302d,$0022		;ffaece
Lffaed2:									;ffaed2
	cmp.w	($0026,a5),d0				;$b06d,$0026		;ffaed2
	blt.s	Lffaedc					;$6d04			;ffaed6
	move.w	($0026,a5),d0				;$302d,$0026		;ffaed8
Lffaedc:									;ffaedc
	move.w	d0,d7					;$3e00			;ffaedc
	tst.b	($0028,a5)				;$4a2d,$0028		;ffaede
	beq.s	Lffaf1a					;$6736			;ffaee2
	sf.b	($0028,a5)				;$51ed,$0028		;ffaee4
	tst.w	($0008,a5)				;$4a6d,$0008		;ffaee8
	beq.s	Lffaf0a					;$671c			;ffaeec
Lffaeee:									;ffaeee
	btst.b	#$04,($00e88001)			;$0839,$0004,$00e8,$8001	;ffaeee
	bne.s	Lffaeee					;$66f6			;ffaef6
	cmpi.w	#$0070,($0056,a5)			;$0c6d,$0070,$0056	;ffaef8
	bge.s	Lffaf0a					;$6c0a			;ffaefe
	move.l	#$00000b00,d0				;$203c,$0000,$0b00	;ffaf00
Lffaf06:									;ffaf06
	subq.l	#1,d0					;$5380			;ffaf06
	bne.s	Lffaf06					;$66fc			;ffaf08
Lffaf0a:									;ffaf0a
	bsr.w	Lffafb4					;$6100,$00a8		;ffaf0a
	move.l	d7,($0054,a5)				;$2b47,$0054		;ffaf0e
	bsr.s	Lffaf6a					;$6156			;ffaf12
	st.b	($0028,a5)				;$50ed,$0028		;ffaf14
Lffaf18:									;ffaf18
	rts						;$4e75			;ffaf18

Lffaf1a:									;ffaf1a
	move.l	d7,($0054,a5)				;$2b47,$0054		;ffaf1a
	rts						;$4e75			;ffaf1e

Lffaf20:									;ffaf20
	clr.w	-(a7)					;$4267			;ffaf20
	tst.w	d0					;$4a40			;ffaf22
	bgt.s	Lffaf2a					;$6e04			;ffaf24
	addq.w	#1,(a7)					;$5257			;ffaf26
	neg.w	d0					;$4440			;ffaf28
Lffaf2a:									;ffaf2a
	move.w	d0,d1					;$3200			;ffaf2a
	lsr.w	#3,d1					;$e649			;ffaf2c
	bne.s	Lffaf34					;$6604			;ffaf2e
	move.w	#$0001,d1				;$323c,$0001		;ffaf30
Lffaf34:									;ffaf34
	mulu.w	d1,d0					;$c0c1			;ffaf34
	move.w	d0,d1					;$3200			;ffaf36
	lsr.w	#2,d1					;$e449			;ffaf38
	add.w	d1,d0					;$d041			;ffaf3a
	tst.w	(a7)+					;$4a5f			;ffaf3c
	beq.s	Lffaf42					;$6702			;ffaf3e
	neg.w	d0					;$4440			;ffaf40
Lffaf42:									;ffaf42
	rts						;$4e75			;ffaf42

Lffaf44:									;ffaf44
	moveq.l	#$ff,d1					;$72ff			;ffaf44
	move.b	(a1)+,d0				;$1019			;ffaf46
	lsr.b	#1,d0					;$e208			;ffaf48
	bcs.s	Lffaf4e					;$6502			;ffaf4a
	clr.w	d1					;$4241			;ffaf4c
Lffaf4e:									;ffaf4e
	swap.w	d1					;$4841			;ffaf4e
	lsr.b	#1,d0					;$e208			;ffaf50
	bcs.s	Lffaf56					;$6502			;ffaf52
	clr.w	d1					;$4241			;ffaf54
Lffaf56:									;ffaf56
	move.l	d1,($004c,a5)				;$2b41,$004c		;ffaf56
	move.b	(a1)+,d0				;$1019			;ffaf5a
	ext.w	d0					;$4880			;ffaf5c
	swap.w	d0					;$4840			;ffaf5e
	move.b	(a1),d0					;$1011			;ffaf60
	ext.w	d0					;$4880			;ffaf62
	move.l	d0,($0050,a5)				;$2b40,$0050		;ffaf64
	rts						;$4e75			;ffaf68

Lffaf6a:									;ffaf6a
	move.w	($00e8002a),-(a7)			;$3f39,$00e8,$002a	;ffaf6a
	bclr.b	#$00,($00e8002a)			;$08b9,$0000,$00e8,$002a	;ffaf70
	movea.l	($0004,a5),a0				;$206d,$0004		;ffaf78
	lea.l	($0076,a5),a1				;$43ed,$0076		;ffaf7c
	bsr.w	Lffb152					;$6100,$01d0		;ffaf80
	movea.l	($0000.w,a5),a0				;$206d,$0000		;ffaf84
	lea.l	($00b6,a5),a1				;$43ed,$00b6		;ffaf88
	bsr.w	Lffb152					;$6100,$01c4		;ffaf8c
	lea.l	($002a,a5),a0				;$41ed,$002a		;ffaf90
	move.w	($0046,a5),d0				;$302d,$0046		;ffaf94
	lsl.w	#2,d0					;$e548			;ffaf98
	lea.l	(a0,d0.w),a0				;$41f0,$0000		;ffaf9a
	movea.l	(a0),a2					;$2450			;ffaf9e
	movea.l	($0004,a5),a0				;$206d,$0004		;ffafa0
	movea.l	($0000.w,a5),a1				;$226d,$0000		;ffafa4
	bsr.w	Lffb06e					;$6100,$00c4		;ffafa8
	move.w	(a7)+,($00e8002a)			;$33df,$00e8,$002a	;ffafac
	rts						;$4e75			;ffafb2

Lffafb4:									;ffafb4
	move.w	($00e8002a),-(a7)			;$3f39,$00e8,$002a	;ffafb4
	bclr.b	#$00,($00e8002a)			;$08b9,$0000,$00e8,$002a	;ffafba
	lea.l	($0076,a5),a0				;$41ed,$0076		;ffafc2
	movea.l	($0004,a5),a1				;$226d,$0004		;ffafc6
	bsr.w	Lffb1a4					;$6100,$01d8		;ffafca
	lea.l	($00b6,a5),a0				;$41ed,$00b6		;ffafce
	movea.l	($0000.w,a5),a1				;$226d,$0000		;ffafd2
	bsr.w	Lffb1a4					;$6100,$01cc		;ffafd6
	move.w	(a7)+,($00e8002a)			;$33df,$00e8,$002a	;ffafda
	rts						;$4e75			;ffafe0

Lffafe2:									;ffafe2
	lea.l	(Lffaa08,pc),a0				;$41fa,$fa24		;ffafe2
	move.l	a0,d1					;$2208			;ffafe6
	moveq.l	#$01,d2					;$7401			;ffafe8
	bsr.w	Call_Unknown_36				;$6100,$cc04		;ffafea
	rts						;$4e75			;ffafee

Lffaff0:									;ffaff0
	lea.l	($0000.w,a5),a1				;$43ed,$0000		;ffaff0
	lea.l	(Lffb306,pc),a0				;$41fa,$0310		;ffaff4
	move.l	#$0000001f.l,d1				;$223c,$0000,$001f	;ffaff8
Lffaffe:									;ffaffe
	move.b	(a0)+,(a1)+				;$12d8			;ffaffe
	dbra.w	d1,Lffaffe				;$51c9,$fffc		;ffb000
	lea.l	($00f6,a5),a0				;$41ed,$00f6		;ffb004
	moveq.l	#$03,d1					;$7203			;ffb008
	lea.l	(Lffb1f6,pc),a1				;$43fa,$01ea		;ffb00a
	move.l	a1,d2					;$2409			;ffb00e
Lffb010:									;ffb010
	move.l	a1,(a0)+				;$20c9			;ffb010
	lea.l	($0044,a1),a1				;$43e9,$0044		;ffb012
	dbra.w	d1,Lffb010				;$51c9,$fff8		;ffb016
	moveq.l	#$0b,d1					;$720b			;ffb01a
Lffb01c:									;ffb01c
	move.l	d2,(a0)+				;$20c2			;ffb01c
	dbra.w	d1,Lffb01c				;$51c9,$fffc		;ffb01e
	movea.l	($00f6,a5),a0				;$206d,$00f6		;ffb022
	move.w	(a0)+,($005c,a5)			;$3b58,$005c		;ffb026
	move.w	(a0)+,($005e,a5)			;$3b58,$005e		;ffb02a
	move.l	a0,($002a,a5)				;$2b48,$002a		;ffb02e
	move.w	#$0002,($0020,a5)			;$3b7c,$0002,$0020	;ffb032
	move.w	#$0002,($0022,a5)			;$3b7c,$0002,$0022	;ffb038
	move.w	($096c),d0				;$3038,$096c		;ffb03e
	subq.w	#2,d0					;$5540			;ffb042
	move.w	d0,($0024,a5)				;$3b40,$0024		;ffb044
	move.w	($096e),d0				;$3038,$096e		;ffb048
	move.w	d0,($0026,a5)				;$3b40,$0026		;ffb04c
	move.w	($0020,a5),($0054,a5)			;$3b6d,$0020,$0054	;ffb050
	move.w	($0022,a5),($0056,a5)			;$3b6d,$0022,$0056	;ffb056
	sf.b	($0064,a5)				;$51ed,$0064		;ffb05c
	sf.b	($0028,a5)				;$51ed,$0028		;ffb060
	sf.b	($004a,a5)				;$51ed,$004a		;ffb064
	clr.w	($0046,a5)				;$426d,$0046		;ffb068
	rts						;$4e75			;ffb06c

Lffb06e:									;ffb06e
	moveq.l	#$00,d0					;$7000			;ffb06e
	move.w	($0056,a5),d0				;$302d,$0056		;ffb070
	sub.w	($005e,a5),d0				;$906d,$005e		;ffb074
	bpl.s	Lffb090					;$6a16			;ffb078
	add.w	#$000f,d0				;$d07c,$000f		;ffb07a
	bmi.s	Lffb0f4					;$6b74			;ffb07e
	move.w	d0,d2					;$3400			;ffb080
	add.w	d0,d0					;$d040			;ffb082
	adda.w	#$001e,a2				;$d4fc,$001e		;ffb084
	suba.w	d0,a2					;$94c0			;ffb088
	move.w	#$0080,d4				;$383c,$0080		;ffb08a
	bra.s	Lffb0aa					;$601a			;ffb08e
Lffb090:									;ffb090
	moveq.l	#$0f,d2					;$740f			;ffb090
	cmp.w	#$03f0,d0				;$b07c,$03f0		;ffb092
	bls.s	Lffb0a0					;$6308			;ffb096
	move.w	#$03ff,d2				;$343c,$03ff		;ffb098
	sub.w	d0,d2					;$9440			;ffb09c
	bmi.s	Lffb0f4					;$6b54			;ffb09e
Lffb0a0:									;ffb0a0
	move.w	#$0080,d4				;$383c,$0080		;ffb0a0
	mulu.w	d4,d0					;$c0c4			;ffb0a4
	adda.l	d0,a0					;$d1c0			;ffb0a6
	adda.l	d0,a1					;$d3c0			;ffb0a8
Lffb0aa:									;ffb0aa
	move.w	($0054,a5),d0				;$302d,$0054		;ffb0aa
	sub.w	($005c,a5),d0				;$906d,$005c		;ffb0ae
	bpl.s	Lffb0bc					;$6a08			;ffb0b2
	neg.w	d0					;$4440			;ffb0b4
	move.w	d0,d3					;$3600			;ffb0b6
	moveq.l	#$00,d1					;$7200			;ffb0b8
	bra.s	Lffb11a					;$605e			;ffb0ba
Lffb0bc:									;ffb0bc
	move.w	d0,d1					;$3200			;ffb0bc
	lsr.w	#4,d1					;$e849			;ffb0be
	add.w	d1,d1					;$d241			;ffb0c0
	adda.w	d1,a0					;$d0c1			;ffb0c2
	adda.w	d1,a1					;$d2c1			;ffb0c4
	and.w	#$000f,d0				;$c07c,$000f		;ffb0c6
	beq.s	Lffb13a					;$676e			;ffb0ca
	moveq.l	#$10,d3					;$7610			;ffb0cc
	sub.w	d0,d3					;$9640			;ffb0ce
	cmp.w	#$007e,d1				;$b27c,$007e		;ffb0d0
	bcc.s	Lffb0f6					;$6420			;ffb0d4
Lffb0d6:									;ffb0d6
	moveq.l	#$ff,d0					;$70ff			;ffb0d6
	moveq.l	#$00,d1					;$7200			;ffb0d8
	move.w	($0020,a2),d1				;$322a,$0020		;ffb0da
	move.w	(a2)+,d0				;$301a			;ffb0de
	rol.l	d3,d0					;$e7b8			;ffb0e0
	rol.l	d3,d1					;$e7b9			;ffb0e2
	and.l	d0,(a1)					;$c191			;ffb0e4
	or.l	d1,(a1)					;$8391			;ffb0e6
	not.l	d0					;$4680			;ffb0e8
	or.l	d0,(a0)					;$8190			;ffb0ea
	adda.w	d4,a0					;$d0c4			;ffb0ec
	adda.w	d4,a1					;$d2c4			;ffb0ee
	dbra.w	d2,Lffb0d6				;$51ca,$ffe4		;ffb0f0
Lffb0f4:									;ffb0f4
	rts						;$4e75			;ffb0f4

Lffb0f6:									;ffb0f6
	moveq.l	#$ff,d0					;$70ff			;ffb0f6
	moveq.l	#$00,d1					;$7200			;ffb0f8
	move.w	($0020,a2),d1				;$322a,$0020		;ffb0fa
	move.w	(a2)+,d0				;$301a			;ffb0fe
	rol.l	d3,d0					;$e7b8			;ffb100
	rol.l	d3,d1					;$e7b9			;ffb102
	swap.w	d0					;$4840			;ffb104
	swap.w	d1					;$4841			;ffb106
	and.w	d0,(a1)					;$c151			;ffb108
	or.w	d1,(a1)					;$8351			;ffb10a
	not.w	d0					;$4640			;ffb10c
	or.w	d0,(a0)					;$8150			;ffb10e
	adda.w	d4,a0					;$d0c4			;ffb110
	adda.w	d4,a1					;$d2c4			;ffb112
	dbra.w	d2,Lffb0f6				;$51ca,$ffe0		;ffb114
	rts						;$4e75			;ffb118

Lffb11a:									;ffb11a
	moveq.l	#$ff,d0					;$70ff			;ffb11a
	moveq.l	#$00,d1					;$7200			;ffb11c
	move.w	($0020,a2),d1				;$322a,$0020		;ffb11e
	move.w	(a2)+,d0				;$301a			;ffb122
	rol.l	d3,d0					;$e7b8			;ffb124
	rol.l	d3,d1					;$e7b9			;ffb126
	and.w	d0,(a1)					;$c151			;ffb128
	or.w	d1,(a1)					;$8351			;ffb12a
	not.w	d0					;$4640			;ffb12c
	or.w	d0,(a0)					;$8150			;ffb12e
	adda.w	d4,a0					;$d0c4			;ffb130
	adda.w	d4,a1					;$d2c4			;ffb132
	dbra.w	d2,Lffb11a				;$51ca,$ffe4		;ffb134
	rts						;$4e75			;ffb138

Lffb13a:									;ffb13a
	move.w	($0020,a2),d1				;$322a,$0020		;ffb13a
	move.w	(a2)+,d0				;$301a			;ffb13e
	and.w	d0,(a1)					;$c151			;ffb140
	or.w	d1,(a1)					;$8351			;ffb142
	not.w	d0					;$4640			;ffb144
	or.w	d0,(a0)					;$8150			;ffb146
	adda.w	d4,a0					;$d0c4			;ffb148
	adda.w	d4,a1					;$d2c4			;ffb14a
	dbra.w	d2,Lffb13a				;$51ca,$ffec		;ffb14c
	rts						;$4e75			;ffb150

Lffb152:									;ffb152
	moveq.l	#$00,d0					;$7000			;ffb152
	move.w	($0056,a5),d0				;$302d,$0056		;ffb154
	sub.w	($005e,a5),d0				;$906d,$005e		;ffb158
	bpl.s	Lffb160					;$6a02			;ffb15c
	moveq.l	#$00,d0					;$7000			;ffb15e
Lffb160:									;ffb160
	moveq.l	#$0f,d2					;$740f			;ffb160
	cmp.w	#$03f0,d0				;$b07c,$03f0		;ffb162
	bls.s	Lffb170					;$6308			;ffb166
	move.w	#$03ff,d2				;$343c,$03ff		;ffb168
	sub.w	d0,d2					;$9440			;ffb16c
	bmi.s	Lffb1a2					;$6b32			;ffb16e
Lffb170:									;ffb170
	move.w	#$0080,d1				;$323c,$0080		;ffb170
	mulu.w	d1,d0					;$c0c1			;ffb174
	adda.l	d0,a0					;$d1c0			;ffb176
	move.w	($0054,a5),d0				;$302d,$0054		;ffb178
	sub.w	($005c,a5),d0				;$906d,$005c		;ffb17c
	bpl.s	Lffb184					;$6a02			;ffb180
	moveq.l	#$00,d0					;$7000			;ffb182
Lffb184:									;ffb184
	lsr.w	#4,d0					;$e848			;ffb184
	add.w	d0,d0					;$d040			;ffb186
	adda.w	d0,a0					;$d0c0			;ffb188
	cmp.w	#$007e,d0				;$b07c,$007e		;ffb18a
	bcc.s	Lffb19a					;$640a			;ffb18e
Lffb190:									;ffb190
	move.l	(a0),(a1)+				;$22d0			;ffb190
	adda.w	d1,a0					;$d0c1			;ffb192
	dbra.w	d2,Lffb190				;$51ca,$fffa		;ffb194
	rts						;$4e75			;ffb198

Lffb19a:									;ffb19a
	move.w	(a0),(a1)+				;$32d0			;ffb19a
	adda.w	d1,a0					;$d0c1			;ffb19c
	dbra.w	d2,Lffb19a				;$51ca,$fffa		;ffb19e
Lffb1a2:									;ffb1a2
	rts						;$4e75			;ffb1a2

Lffb1a4:									;ffb1a4
	moveq.l	#$00,d0					;$7000			;ffb1a4
	move.w	($0056,a5),d0				;$302d,$0056		;ffb1a6
	sub.w	($005e,a5),d0				;$906d,$005e		;ffb1aa
	bpl.s	Lffb1b2					;$6a02			;ffb1ae
	moveq.l	#$00,d0					;$7000			;ffb1b0
Lffb1b2:									;ffb1b2
	moveq.l	#$0f,d2					;$740f			;ffb1b2
	cmp.w	#$03f0,d0				;$b07c,$03f0		;ffb1b4
	bls.s	Lffb1c2					;$6308			;ffb1b8
	move.w	#$03ff,d2				;$343c,$03ff		;ffb1ba
	sub.w	d0,d2					;$9440			;ffb1be
	bmi.s	Lffb1f4					;$6b32			;ffb1c0
Lffb1c2:									;ffb1c2
	move.w	#$0080,d1				;$323c,$0080		;ffb1c2
	mulu.w	d1,d0					;$c0c1			;ffb1c6
	adda.l	d0,a1					;$d3c0			;ffb1c8
	move.w	($0054,a5),d0				;$302d,$0054		;ffb1ca
	sub.w	($005c,a5),d0				;$906d,$005c		;ffb1ce
	bpl.s	Lffb1d6					;$6a02			;ffb1d2
	moveq.l	#$00,d0					;$7000			;ffb1d4
Lffb1d6:									;ffb1d6
	lsr.w	#4,d0					;$e848			;ffb1d6
	add.w	d0,d0					;$d040			;ffb1d8
	adda.w	d0,a1					;$d2c0			;ffb1da
	cmp.w	#$007e,d0				;$b07c,$007e		;ffb1dc
	bcc.s	Lffb1ec					;$640a			;ffb1e0
Lffb1e2:									;ffb1e2
	move.l	(a0)+,(a1)				;$2298			;ffb1e2
	adda.w	d1,a1					;$d2c1			;ffb1e4
	dbra.w	d2,Lffb1e2				;$51ca,$fffa		;ffb1e6
	rts						;$4e75			;ffb1ea

Lffb1ec:									;ffb1ec
	move.w	(a0)+,(a1)				;$3298			;ffb1ec
	adda.w	d1,a1					;$d2c1			;ffb1ee
	dbra.w	d2,Lffb1ec				;$51ca,$fffa		;ffb1f0
Lffb1f4:									;ffb1f4
	rts						;$4e75			;ffb1f4

Lffb1f6:									;ffb1f6
	.dc.b	$00,$00,$00,$00,$3f,$ff,$1f,$ff					;ffb1f6
	.dc.b	$0f,$ff,$07,$ff,$03,$ff,$01,$ff					;ffb1fe
	.dc.b	$00,$ff,$00,$7f,$00,$3f,$00,$1f					;ffb206
	.dc.b	$01,$ff,$10,$ff,$30,$ff,$f8,$7f					;ffb20e
	.dc.b	$f8,$7f,$fc,$ff,$00,$00,$40,$00					;ffb216
	.dc.b	$60,$00,$70,$00,$78,$00,$7c,$00					;ffb21e
	.dc.b	$7e,$00,$7f,$00,$7f,$80,$7c,$00					;ffb226
	.dc.b	$6c,$00,$46,$00,$06,$00,$03,$00					;ffb22e
	.dc.b	$03,$00,$00,$00,$00,$07,$00,$07					;ffb236
	.dc.b	$80,$01,$80,$01,$c0,$03,$c0,$03					;ffb23e
	.dc.b	$c0,$03,$e0,$07,$f0,$0f,$f0,$0f					;ffb246
	.dc.b	$f0,$0f,$f0,$0f,$e0,$07,$c0,$03					;ffb24e
	.dc.b	$c0,$03,$c0,$03,$80,$01,$80,$01					;ffb256
	.dc.b	$00,$00,$3f,$fc,$10,$08,$10,$08					;ffb25e
	.dc.b	$17,$e8,$0b,$d0,$09,$50,$04,$20					;ffb266
	.dc.b	$06,$a0,$09,$50,$08,$10,$12,$88					;ffb26e
	.dc.b	$13,$c8,$17,$e8,$3f,$fc,$00,$00					;ffb276
	.dc.b	$00,$07,$00,$07,$80,$01,$80,$01					;ffb27e
	.dc.b	$c0,$03,$c0,$03,$c0,$03,$e0,$07					;ffb286
	.dc.b	$f0,$0f,$f0,$0f,$f0,$0f,$f0,$0f					;ffb28e
	.dc.b	$e0,$07,$c0,$03,$c0,$03,$c0,$03					;ffb296
	.dc.b	$80,$01,$80,$01,$00,$00,$3f,$fc					;ffb29e
	.dc.b	$10,$08,$10,$08,$17,$e8,$0b,$d0					;ffb2a6
	.dc.b	$0a,$90,$05,$60,$04,$20,$0a,$90					;ffb2ae
	.dc.b	$09,$50,$10,$08,$13,$c8,$17,$e8					;ffb2b6
	.dc.b	$3f,$fc,$00,$00,$00,$07,$00,$07					;ffb2be
	.dc.b	$80,$01,$80,$01,$c0,$03,$c0,$03					;ffb2c6
	.dc.b	$c0,$03,$e0,$07,$f0,$0f,$f0,$0f					;ffb2ce
	.dc.b	$f0,$0f,$f0,$0f,$e0,$07,$c0,$03					;ffb2d6
	.dc.b	$c0,$03,$c0,$03,$80,$01,$80,$01					;ffb2de
	.dc.b	$00,$00,$3f,$fc,$10,$08,$10,$08					;ffb2e6
	.dc.b	$17,$e8,$0b,$d0,$08,$10,$06,$a0					;ffb2ee
	.dc.b	$05,$60,$08,$10,$0a,$90,$11,$48					;ffb2f6
	.dc.b	$13,$c8,$17,$e8,$3f,$fc,$00,$00					;ffb2fe
Lffb306:									;ffb306
	.dc.b	$00,$e6,$00,$00,$00,$e4,$00,$00					;ffb306
	.dc.b	$00,$00,$00,$05,$00,$04,$00,$00					;ffb30e
	.dc.b	$00,$f6,$00,$00,$00,$00,$00,$80					;ffb316
	.dc.b	$03,$f0,$04,$00,$03,$f0,$00,$80					;ffb31e
Call_G_CLR_ON:									;ffb326
	movem.l	d1-d2/a1,-(a7)				;$48e7,$6040		;ffb326
	move.w	#$0020,($00e82600)			;$33fc,$0020,$00e8,$2600	;ffb32a
	bset.b	#$03,($00e80028)			;$08f9,$0003,$00e8,$0028	;ffb332
	lea.l	($00c00000),a0				;$41f9,$00c0,$0000	;ffb33a
	move.l	a0,($095c)				;$21c8,$095c		;ffb340
	lea.l	($00c80000),a1				;$43f9,$00c8,$0000	;ffb344
	bsr.w	Lffb43a					;$6100,$00ee		;ffb34a
	bclr.b	#$03,($00e80028)			;$08b9,$0003,$00e8,$0028	;ffb34e
	bsr.s	Lffb38a					;$6132			;ffb356
	and.w	#$0003,d0				;$c07c,$0003		;ffb358
	bne.s	$00ffb364				;$6606			;ffb35c
	bsr.w	Lffb3f4					;$6100,$0094		;ffb35e
	bra.s	$00ffb374				;$6010			;ffb362
	cmp.w	#$0001,d0				;$b07c,$0001		;ffb364
	bne.s	$00ffb370				;$6606			;ffb368
	bsr.w	Lffb408					;$6100,$009c		;ffb36a
	bra.s	$00ffb374				;$6004			;ffb36e
	bsr.w	Lffb41e					;$6100,$00ac		;ffb370
	bclr.b	#$03,($00e80028)			;$08b9,$0003,$00e8,$0028	;ffb374
	move.w	#$003f,($00e82600)			;$33fc,$003f,$00e8,$2600	;ffb37c
	movem.l	(a7)+,d1-d2/a1				;$4cdf,$0206		;ffb384
	rts						;$4e75			;ffb388

Lffb38a:									;ffb38a
	move.b	($00e80028),d1				;$1239,$00e8,$0028	;ffb38a
	or.b	#$07,d1					;$823c,$0007		;ffb390
	move.b	($093c),d0				;$1038,$093c		;ffb394
	move.b	d0,d2					;$1400			;ffb398
	and.b	#$0f,d2					;$c43c,$000f		;ffb39a
	cmp.b	#$04,d2					;$b43c,$0004		;ffb39e
	bcs.s	Lffb3a8					;$6504			;ffb3a2
	and.b	#$fb,d1					;$c23c,$00fb		;ffb3a4
Lffb3a8:									;ffb3a8
	moveq.l	#$ff,d2					;$74ff			;ffb3a8
	and.w	#$000c,d0				;$c07c,$000c		;ffb3aa
	cmp.b	#$0c,d0					;$b03c,$000c		;ffb3ae
	beq.s	Lffb3c8					;$6714			;ffb3b2
	bclr.l	#$01,d1					;$0881,$0001		;ffb3b4
	move.w	#$00ff,d2				;$343c,$00ff		;ffb3b8
	cmp.b	#$08,d0					;$b03c,$0008		;ffb3bc
	beq.s	Lffb3c8					;$6706			;ffb3c0
	bclr.l	#$00,d1					;$0881,$0000		;ffb3c2
	moveq.l	#$0f,d2					;$740f			;ffb3c6
Lffb3c8:									;ffb3c8
	move.b	d1,d0					;$1001			;ffb3c8
	move.w	d2,($0964)				;$31c2,$0964		;ffb3ca
	and.w	#$0007,d0				;$c07c,$0007		;ffb3ce
	move.b	d1,($00e80028)				;$13c1,$00e8,$0028	;ffb3d2
	move.w	d0,($00e82400)				;$33c0,$00e8,$2400	;ffb3d8
	move.b	d1,d0					;$1001			;ffb3de
	move.l	#$00000400,d1				;$223c,$0000,$0400	;ffb3e0
	btst.l	#$02,d0					;$0800,$0002		;ffb3e6
	beq.s	Lffb3ee					;$6702			;ffb3ea
	add.l	d1,d1					;$d281			;ffb3ec
Lffb3ee:									;ffb3ee
	move.l	d1,($0960)				;$21c1,$0960		;ffb3ee
	rts						;$4e75			;ffb3f2

Lffb3f4:									;ffb3f4
	lea.l	(Lffb442,pc),a0				;$41fa,$004c		;ffb3f4
	lea.l	($00e82000),a1				;$43f9,$00e8,$2000	;ffb3f8
	moveq.l	#$0f,d0					;$700f			;ffb3fe
Lffb400:									;ffb400
	move.w	(a0)+,(a1)+				;$32d8			;ffb400
	dbra.w	d0,Lffb400				;$51c8,$fffc		;ffb402
	rts						;$4e75			;ffb406

Lffb408:									;ffb408
	lea.l	(Lffb462,pc),a0				;$41fa,$0058		;ffb408
	lea.l	($00e82000),a1				;$43f9,$00e8,$2000	;ffb40c
	move.w	#$00ff,d0				;$303c,$00ff		;ffb412
Lffb416:									;ffb416
	move.w	(a0)+,(a1)+				;$32d8			;ffb416
	dbra.w	d0,Lffb416				;$51c8,$fffc		;ffb418
	rts						;$4e75			;ffb41c

Lffb41e:									;ffb41e
	lea.l	($00e82000),a0				;$41f9,$00e8,$2000	;ffb41e
	move.w	#$007f,d0				;$303c,$007f		;ffb424
	move.w	#$0001,d1				;$323c,$0001		;ffb428
Lffb42c:									;ffb42c
	move.w	d1,(a0)+				;$30c1			;ffb42c
	move.w	d1,(a0)+				;$30c1			;ffb42e
	addi.w	#$0202,d1				;$0641,$0202		;ffb430
	dbra.w	d0,Lffb42c				;$51c8,$fff6		;ffb434
	rts						;$4e75			;ffb438

Lffb43a:									;ffb43a
	clr.l	(a0)+					;$4298			;ffb43a
	cmpa.l	a1,a0					;$b1c9			;ffb43c
	bne.s	Lffb43a					;$66fa			;ffb43e
	rts						;$4e75			;ffb440

Lffb442:									;ffb442
	.dc.b	$00,$00,$52,$94,$00,$20,$00,$3e					;ffb442
	.dc.b	$04,$00,$07,$c0,$04,$20,$07,$fe					;ffb44a
	.dc.b	$80,$00,$f8,$00,$80,$20,$f8,$3e					;ffb452
	.dc.b	$84,$00,$ff,$c0,$ad,$6a,$ff,$fe					;ffb45a
Lffb462:									;ffb462
	.dc.b	$00,$00,$00,$08,$00,$12,$00,$1a					;ffb462
	.dc.b	$00,$24,$00,$2c,$00,$36,$00,$3e					;ffb46a
	.dc.b	$01,$00,$01,$08,$01,$12,$01,$1a					;ffb472
	.dc.b	$01,$24,$01,$2c,$01,$36,$01,$3e					;ffb47a
	.dc.b	$02,$40,$02,$48,$02,$52,$02,$5a					;ffb482
	.dc.b	$02,$64,$02,$6c,$02,$76,$02,$7e					;ffb48a
	.dc.b	$03,$40,$03,$48,$03,$52,$03,$5a					;ffb492
	.dc.b	$03,$64,$03,$6c,$03,$76,$03,$7e					;ffb49a
	.dc.b	$04,$80,$04,$88,$04,$92,$04,$9a					;ffb4a2
	.dc.b	$04,$a4,$04,$ac,$04,$b6,$04,$be					;ffb4aa
	.dc.b	$05,$80,$05,$88,$05,$92,$05,$9a					;ffb4b2
	.dc.b	$05,$a4,$05,$ac,$05,$b6,$05,$be					;ffb4ba
	.dc.b	$06,$c0,$06,$c8,$06,$d2,$06,$da					;ffb4c2
	.dc.b	$06,$e4,$06,$ec,$06,$f6,$06,$fe					;ffb4ca
	.dc.b	$07,$c0,$07,$c8,$07,$d2,$07,$da					;ffb4d2
	.dc.b	$07,$e4,$07,$ec,$07,$f6,$07,$fe					;ffb4da
	.dc.b	$50,$00,$50,$08,$50,$12,$50,$1a					;ffb4e2
	.dc.b	$50,$24,$50,$2c,$50,$36,$50,$3e					;ffb4ea
	.dc.b	$51,$00,$51,$08,$51,$12,$51,$1a					;ffb4f2
	.dc.b	$51,$24,$51,$2c,$51,$36,$51,$3e					;ffb4fa
	.dc.b	$52,$40,$52,$48,$52,$52,$52,$5a					;ffb502
	.dc.b	$52,$64,$52,$6c,$52,$76,$52,$7e					;ffb50a
	.dc.b	$53,$40,$53,$48,$53,$52,$53,$5a					;ffb512
	.dc.b	$53,$64,$53,$6c,$53,$76,$53,$7e					;ffb51a
	.dc.b	$54,$80,$54,$88,$54,$92,$54,$9a					;ffb522
	.dc.b	$54,$a4,$54,$ac,$54,$b6,$54,$be					;ffb52a
	.dc.b	$55,$80,$55,$88,$55,$92,$55,$9a					;ffb532
	.dc.b	$55,$a4,$55,$ac,$55,$b6,$55,$be					;ffb53a
	.dc.b	$56,$c0,$56,$c8,$56,$d2,$56,$da					;ffb542
	.dc.b	$56,$e4,$56,$ec,$56,$f6,$56,$fe					;ffb54a
	.dc.b	$57,$c0,$57,$c8,$57,$d2,$57,$da					;ffb552
	.dc.b	$57,$e4,$57,$ec,$57,$f6,$57,$fe					;ffb55a
	.dc.b	$a8,$00,$a8,$08,$a8,$12,$a8,$1a					;ffb562
	.dc.b	$a8,$24,$a8,$2c,$a8,$36,$a8,$3e					;ffb56a
	.dc.b	$a9,$00,$a9,$08,$a9,$12,$a9,$1a					;ffb572
	.dc.b	$a9,$24,$a9,$2c,$a9,$36,$a9,$3e					;ffb57a
	.dc.b	$aa,$40,$aa,$48,$aa,$52,$aa,$5a					;ffb582
	.dc.b	$aa,$64,$aa,$6c,$aa,$76,$aa,$7e					;ffb58a
	.dc.b	$ab,$40,$ab,$48,$ab,$52,$ab,$5a					;ffb592
	.dc.b	$ab,$64,$ab,$6c,$ab,$76,$ab,$7e					;ffb59a
	.dc.b	$ac,$80,$ac,$88,$ac,$92,$ac,$9a					;ffb5a2
	.dc.b	$ac,$a4,$ac,$ac,$ac,$b6,$ac,$be					;ffb5aa
	.dc.b	$ad,$80,$ad,$88,$ad,$92,$ad,$9a					;ffb5b2
	.dc.b	$ad,$a4,$ad,$ac,$ad,$b6,$ad,$be					;ffb5ba
	.dc.b	$ae,$c0,$ae,$c8,$ae,$d2,$ae,$da					;ffb5c2
	.dc.b	$ae,$e4,$ae,$ec,$ae,$f6,$ae,$fe					;ffb5ca
	.dc.b	$af,$c0,$af,$c8,$af,$d2,$af,$da					;ffb5d2
	.dc.b	$af,$e4,$af,$ec,$af,$f6,$af,$fe					;ffb5da
	.dc.b	$f8,$00,$f8,$08,$f8,$12,$f8,$1a					;ffb5e2
	.dc.b	$f8,$24,$f8,$2c,$f8,$36,$f8,$3e					;ffb5ea
	.dc.b	$f9,$00,$f9,$08,$f9,$12,$f9,$1a					;ffb5f2
	.dc.b	$f9,$24,$f9,$2c,$f9,$36,$f9,$3e					;ffb5fa
	.dc.b	$fa,$40,$fa,$48,$fa,$52,$fa,$5a					;ffb602
	.dc.b	$fa,$64,$fa,$6c,$fa,$76,$fa,$7e					;ffb60a
	.dc.b	$fb,$40,$fb,$48,$fb,$52,$fb,$5a					;ffb612
	.dc.b	$fb,$64,$fb,$6c,$fb,$76,$fb,$7e					;ffb61a
	.dc.b	$fc,$80,$fc,$88,$fc,$92,$fc,$9a					;ffb622
	.dc.b	$fc,$a4,$fc,$ac,$fc,$b6,$fc,$be					;ffb62a
	.dc.b	$fd,$80,$fd,$88,$fd,$92,$fd,$9a					;ffb632
	.dc.b	$fd,$a4,$fd,$ac,$fd,$b6,$fd,$be					;ffb63a
	.dc.b	$fe,$c0,$fe,$c8,$fe,$d2,$fe,$da					;ffb642
	.dc.b	$fe,$e4,$fe,$ec,$fe,$f6,$fe,$fe					;ffb64a
	.dc.b	$ff,$c0,$ff,$c8,$ff,$d2,$ff,$da					;ffb652
	.dc.b	$ff,$e4,$ff,$ec,$ff,$f6,$ff,$fe					;ffb65a
Call_Unknown_91:								;ffb662
	clr.l	d0					;$4280			;ffb662
	move.b	($00e80028),d0				;$1039,$00e8,$0028	;ffb664
	movem.l	d0-d1,-(a7)				;$48e7,$c000		;ffb66a
	cmp.b	#$ff,d1					;$b23c,$00ff		;ffb66e
	beq.s	$00ffb69c				;$6728			;ffb672
	and.b	#$07,d1					;$c23c,$0007		;ffb674
	and.b	#$f8,d0					;$c03c,$00f8		;ffb678
	or.b	d1,d0					;$8001			;ffb67c
	move.b	d0,($00e80028)				;$13c0,$00e8,$0028	;ffb67e
	move.w	d1,($00e82400)				;$33c1,$00e8,$2400	;ffb684
	move.l	#$00000400,d0				;$203c,$0000,$0400	;ffb68a
	and.w	#$0004,d1				;$c27c,$0004		;ffb690
	beq.s	$00ffb698				;$6702			;ffb694
	add.l	d0,d0					;$d080			;ffb696
	move.l	d0,($0960)				;$21c0,$0960		;ffb698
	movem.l	(a7)+,d0-d1				;$4cdf,$0003		;ffb69c
	rts						;$4e75			;ffb6a0

Call_Unknown_92:								;ffb6a2
	clr.l	d0					;$4280			;ffb6a2
	move.w	($00e82500),d0				;$3039,$00e8,$2500	;ffb6a4
	cmp.w	#$ffff,d1				;$b27c,$ffff		;ffb6aa
	beq.s	Lffb6b6					;$6706			;ffb6ae
	move.w	d1,($00e82500)				;$33c1,$00e8,$2500	;ffb6b0
Lffb6b6:									;ffb6b6
	rts						;$4e75			;ffb6b6

Call_Unknown_93:								;ffb6b8
	clr.l	d0					;$4280			;ffb6b8
	move.w	($00e82600),d0				;$3039,$00e8,$2600	;ffb6ba
	cmp.w	#$ffff,d1				;$b27c,$ffff		;ffb6c0
	beq.s	Lffb6cc					;$6706			;ffb6c4
	move.w	d1,($00e82600)				;$33c1,$00e8,$2600	;ffb6c6
Lffb6cc:									;ffb6cc
	rts						;$4e75			;ffb6cc

Call_GPALET:									;ffb6ce
	lea.l	($00e82000),a0				;$41f9,$00e8,$2000	;ffb6ce
	move.w	($0964),d0				;$3038,$0964		;ffb6d4
	beq.s	Lffb700					;$6726			;ffb6d8
	cmp.w	#$ffff,d0				;$b07c,$ffff		;ffb6da
	beq.s	Lffb704					;$6724			;ffb6de
	clr.l	d0					;$4280			;ffb6e0
	move.w	d1,d0					;$3001			;ffb6e2
	cmp.w	($0964),d0				;$b078,$0964		;ffb6e4
	bhi.s	Lffb700					;$6216			;ffb6e8
	add.w	d0,d0					;$d040			;ffb6ea
	adda.l	d0,a0					;$d1c0			;ffb6ec
	cmp.l	#$ffffffff,d2				;$b4bc,$ffff,$ffff	;ffb6ee
	beq.s	Lffb6fc					;$6706			;ffb6f4
	move.w	d2,(a0)					;$3082			;ffb6f6
	clr.l	d0					;$4280			;ffb6f8
	rts						;$4e75			;ffb6fa

Lffb6fc:									;ffb6fc
	move.w	(a0),d0					;$3010			;ffb6fc
	rts						;$4e75			;ffb6fe

Lffb700:									;ffb700
	moveq.l	#$ff,d0					;$70ff			;ffb700
	rts						;$4e75			;ffb702

Lffb704:									;ffb704
	clr.l	d0					;$4280			;ffb704
	move.l	d3,-(a7)				;$2f03			;ffb706
	clr.l	d3					;$4283			;ffb708
	move.b	d1,d0					;$1001			;ffb70a
	ror.l	#1,d0					;$e298			;ffb70c
	asl.w	#1,d0					;$e340			;ffb70e
	rol.l	#1,d0					;$e398			;ffb710
	cmp.l	#$ffffffff,d2				;$b4bc,$ffff,$ffff	;ffb712
	beq.s	Lffb720					;$6706			;ffb718
	move.b	d2,(a0,d0.w)				;$1182,$0000		;ffb71a
	bra.s	Lffb726					;$6006			;ffb71e
Lffb720:									;ffb720
	move.b	(a0,d0.w),d3				;$1630,$0000		;ffb720
	rol.w	#8,d3					;$e15b			;ffb724
Lffb726:									;ffb726
	move.w	d1,d0					;$3001			;ffb726
	lsr.w	#8,d0					;$e048			;ffb728
	ror.l	#1,d0					;$e298			;ffb72a
	asl.w	#1,d0					;$e340			;ffb72c
	rol.l	#1,d0					;$e398			;ffb72e
	ror.w	#8,d2					;$e05a			;ffb730
	cmp.l	#$ffffffff,d2				;$b4bc,$ffff,$ffff	;ffb732
	beq.s	Lffb740					;$6706			;ffb738
	move.b	d2,($02,a0,d0.w)			;$1182,$0002		;ffb73a
	bra.s	Lffb746					;$6006			;ffb73e
Lffb740:									;ffb740
	move.b	(a0,d0.w),d3				;$1630,$0000		;ffb740
	ror.w	#8,d3					;$e05b			;ffb744
Lffb746:									;ffb746
	rol.w	#8,d2					;$e15a			;ffb746
	move.l	d3,d0					;$2003			;ffb748
	move.l	(a7)+,d3				;$261f			;ffb74a
	rts						;$4e75			;ffb74c

Call_Unknown_95:								;ffb74e
	and.w	($0964),d1				;$c278,$0964		;ffb74e
	move.w	d1,($0966)				;$31c1,$0966		;ffb752
	rts						;$4e75			;ffb756

Call_Unknown_96:								;ffb758
	move.w	d1,d0					;$3001			;ffb758
	and.w	#$0003,d0				;$c07c,$0003		;ffb75a
	asl.w	#3,d0					;$e740			;ffb75e
	add.w	#$00c0,d0				;$d07c,$00c0		;ffb760
	swap.w	d0					;$4840			;ffb764
	clr.w	d0					;$4240			;ffb766
	move.l	d0,($095c)				;$21c0,$095c		;ffb768
	rts						;$4e75			;ffb76c

Call_Unknown_97:								;ffb76e
	movem.l	d1-d5/a1,-(a7)				;$48e7,$7c40		;ffb76e
	bsr.w	Lffb9ec					;$6100,$0278		;ffb772
	move.w	($0964),d4				;$3838,$0964		;ffb776
	move.w	d4,(a1)+				;$32c4			;ffb77a
	bsr.s	Lffb784					;$6106			;ffb77c
	movem.l	(a7)+,d1-d5/a1				;$4cdf,$023e		;ffb77e
	rts						;$4e75			;ffb782

Lffb784:									;ffb784
	cmp.w	#$ffff,d4				;$b87c,$ffff		;ffb784
	beq.s	Lffb7fa					;$6770			;ffb788
	cmp.w	#$00ff,d4				;$b87c,$00ff		;ffb78a
	beq.s	Lffb7e8					;$6758			;ffb78e
	btst.l	#$00,d1					;$0801,$0000		;ffb790
	beq.s	Lffb7b8					;$6722			;ffb794
Lffb796:									;ffb796
	move.w	d1,d4					;$3801			;ffb796
Lffb798:									;ffb798
	move.w	(a0)+,d0				;$3018			;ffb798
	and.w	#$000f,d0				;$c07c,$000f		;ffb79a
	asl.w	#4,d0					;$e940			;ffb79e
	move.w	(a0)+,d5				;$3a18			;ffb7a0
	and.w	#$000f,d5				;$ca7c,$000f		;ffb7a2
	or.b	d5,d0					;$8005			;ffb7a6
	move.b	d0,(a1)+				;$12c0			;ffb7a8
	subq.w	#1,d4					;$5344			;ffb7aa
	dbra.w	d4,Lffb798				;$51cc,$ffea		;ffb7ac
	adda.l	d3,a0					;$d1c3			;ffb7b0
	dbra.w	d2,Lffb796				;$51ca,$ffe2		;ffb7b2
	rts						;$4e75			;ffb7b6

Lffb7b8:									;ffb7b8
	move.w	d1,d4					;$3801			;ffb7b8
Lffb7ba:									;ffb7ba
	move.w	(a0)+,d0				;$3018			;ffb7ba
	and.w	#$000f,d0				;$c07c,$000f		;ffb7bc
	asl.w	#4,d0					;$e940			;ffb7c0
	subq.w	#1,d4					;$5344			;ffb7c2
	bcs.s	Lffb7de					;$6518			;ffb7c4
Lffb7c6:									;ffb7c6
	move.w	(a0)+,d5				;$3a18			;ffb7c6
	and.w	#$000f,d5				;$ca7c,$000f		;ffb7c8
	or.b	d5,d0					;$8005			;ffb7cc
	move.b	d0,(a1)+				;$12c0			;ffb7ce
	dbra.w	d4,Lffb7ba				;$51cc,$ffe8		;ffb7d0
	move.w	d1,d4					;$3801			;ffb7d4
	adda.l	d3,a0					;$d1c3			;ffb7d6
	dbra.w	d2,Lffb7ba				;$51ca,$ffe0		;ffb7d8
	rts						;$4e75			;ffb7dc

Lffb7de:									;ffb7de
	move.w	d1,d4					;$3801			;ffb7de
	adda.l	d3,a0					;$d1c3			;ffb7e0
	dbra.w	d2,Lffb7c6				;$51ca,$ffe2		;ffb7e2
	rts						;$4e75			;ffb7e6

Lffb7e8:									;ffb7e8
	move.w	d1,d4					;$3801			;ffb7e8
Lffb7ea:									;ffb7ea
	move.w	(a0)+,d0				;$3018			;ffb7ea
	move.b	d0,(a1)+				;$12c0			;ffb7ec
	dbra.w	d4,Lffb7ea				;$51cc,$fffa		;ffb7ee
	adda.l	d3,a0					;$d1c3			;ffb7f2
	dbra.w	d2,Lffb7e8				;$51ca,$fff2		;ffb7f4
	rts						;$4e75			;ffb7f8

Lffb7fa:									;ffb7fa
	move.w	d1,d4					;$3801			;ffb7fa
Lffb7fc:									;ffb7fc
	move.w	(a0)+,(a1)+				;$32d8			;ffb7fc
	dbra.w	d4,Lffb7fc				;$51cc,$fffc		;ffb7fe
	adda.l	d3,a0					;$d1c3			;ffb802
	dbra.w	d2,Lffb7fa				;$51ca,$fff4		;ffb804
	rts						;$4e75			;ffb808

Call_Unknown_98:								;ffb80a
	movem.l	d1-d6/a1,-(a7)				;$48e7,$7e40		;ffb80a
	move.w	d3,d6					;$3c03			;ffb80e
	bsr.w	Lffb9ec					;$6100,$01da		;ffb810
	move.w	(a1)+,d4				;$3819			;ffb814
	moveq.l	#$ff,d0					;$70ff			;ffb816
	cmp.w	($0964),d4				;$b878,$0964		;ffb818
	bne.s	Lffb822					;$6604			;ffb81c
	bsr.s	Lffb828					;$6108			;ffb81e
	clr.l	d0					;$4280			;ffb820
Lffb822:									;ffb822
	movem.l	(a7)+,d1-d6/a1				;$4cdf,$027e		;ffb822
	rts						;$4e75			;ffb826

Lffb828:									;ffb828
	cmp.w	#$ffff,d4				;$b87c,$ffff		;ffb828
	beq.w	Lffb8c0					;$6700,$0092		;ffb82c
	cmp.w	#$00ff,d4				;$b87c,$00ff		;ffb830
	beq.s	Lffb8a6					;$6770			;ffb834
	btst.l	#$00,d1					;$0801,$0000		;ffb836
	beq.s	Lffb86a					;$672e			;ffb83a
Lffb83c:									;ffb83c
	move.w	d1,d4					;$3801			;ffb83c
Lffb83e:									;ffb83e
	move.b	(a1)+,d5				;$1a19			;ffb83e
	move.b	d5,d0					;$1005			;ffb840
	lsr.b	#4,d0					;$e808			;ffb842
	and.w	#$000f,d0				;$c07c,$000f		;ffb844
	cmp.w	d6,d0					;$b046			;ffb848
	beq.s	Lffb84e					;$6702			;ffb84a
	move.w	d0,(a0)					;$3080			;ffb84c
Lffb84e:									;ffb84e
	addq.l	#2,a0					;$5488			;ffb84e
	and.w	#$000f,d5				;$ca7c,$000f		;ffb850
	cmp.w	d6,d5					;$ba46			;ffb854
	beq.s	Lffb85a					;$6702			;ffb856
	move.w	d5,(a0)					;$3085			;ffb858
Lffb85a:									;ffb85a
	addq.l	#2,a0					;$5488			;ffb85a
	subq.w	#1,d4					;$5344			;ffb85c
	dbra.w	d4,Lffb83e				;$51cc,$ffde		;ffb85e
	adda.l	d3,a0					;$d1c3			;ffb862
	dbra.w	d2,Lffb83c				;$51ca,$ffd6		;ffb864
	rts						;$4e75			;ffb868

Lffb86a:									;ffb86a
	move.w	d1,d4					;$3801			;ffb86a
Lffb86c:									;ffb86c
	move.b	(a1)+,d5				;$1a19			;ffb86c
	move.b	d5,d0					;$1005			;ffb86e
	lsr.b	#4,d0					;$e808			;ffb870
	and.w	#$000f,d0				;$c07c,$000f		;ffb872
	cmp.w	d6,d0					;$b046			;ffb876
	beq.s	Lffb87c					;$6702			;ffb878
	move.w	d0,(a0)					;$3080			;ffb87a
Lffb87c:									;ffb87c
	addq.l	#2,a0					;$5488			;ffb87c
	subq.w	#1,d4					;$5344			;ffb87e
	bcs.s	Lffb89c					;$651a			;ffb880
Lffb882:									;ffb882
	and.w	#$000f,d5				;$ca7c,$000f		;ffb882
	cmp.w	d6,d5					;$ba46			;ffb886
	beq.s	Lffb88c					;$6702			;ffb888
	move.w	d5,(a0)					;$3085			;ffb88a
Lffb88c:									;ffb88c
	addq.l	#2,a0					;$5488			;ffb88c
	dbra.w	d4,Lffb86c				;$51cc,$ffdc		;ffb88e
	move.w	d1,d4					;$3801			;ffb892
	adda.l	d3,a0					;$d1c3			;ffb894
	dbra.w	d2,Lffb86c				;$51ca,$ffd4		;ffb896
	rts						;$4e75			;ffb89a

Lffb89c:									;ffb89c
	move.w	d1,d4					;$3801			;ffb89c
	adda.l	d3,a0					;$d1c3			;ffb89e
	dbra.w	d2,Lffb882				;$51ca,$ffe0		;ffb8a0
	rts						;$4e75			;ffb8a4

Lffb8a6:									;ffb8a6
	move.w	d1,d4					;$3801			;ffb8a6
Lffb8a8:									;ffb8a8
	clr.w	d0					;$4240			;ffb8a8
	move.b	(a1)+,d0				;$1019			;ffb8aa
	cmp.w	d6,d0					;$b046			;ffb8ac
	beq.s	Lffb8b2					;$6702			;ffb8ae
	move.w	d0,(a0)					;$3080			;ffb8b0
Lffb8b2:									;ffb8b2
	addq.l	#2,a0					;$5488			;ffb8b2
	dbra.w	d4,Lffb8a8				;$51cc,$fff2		;ffb8b4
	adda.l	d3,a0					;$d1c3			;ffb8b8
	dbra.w	d2,Lffb8a6				;$51ca,$ffea		;ffb8ba
	rts						;$4e75			;ffb8be

Lffb8c0:									;ffb8c0
	move.w	d1,d4					;$3801			;ffb8c0
Lffb8c2:									;ffb8c2
	move.w	(a1)+,d0				;$3019			;ffb8c2
	cmp.w	d6,d0					;$b046			;ffb8c4
	beq.s	Lffb8ca					;$6702			;ffb8c6
	move.w	d0,(a0)					;$3080			;ffb8c8
Lffb8ca:									;ffb8ca
	addq.l	#2,a0					;$5488			;ffb8ca
	dbra.w	d4,Lffb8c2				;$51cc,$fff4		;ffb8cc
	adda.l	d3,a0					;$d1c3			;ffb8d0
	dbra.w	d2,Lffb8c0				;$51ca,$ffec		;ffb8d2
	rts						;$4e75			;ffb8d6

Call_Unknown_99:								;ffb8d8
	movem.l	d1-d5/a1,-(a7)				;$48e7,$7c40		;ffb8d8
	bsr.w	Lffb9ec					;$6100,$010e		;ffb8dc
	move.w	(a1)+,d4				;$3819			;ffb8e0
	moveq.l	#$ff,d0					;$70ff			;ffb8e2
	cmp.w	($0964),d4				;$b878,$0964		;ffb8e4
	bne.s	Lffb8ee					;$6604			;ffb8e8
	bsr.s	Lffb8f4					;$6108			;ffb8ea
	clr.l	d0					;$4280			;ffb8ec
Lffb8ee:									;ffb8ee
	movem.l	(a7)+,d1-d5/a1				;$4cdf,$023e		;ffb8ee
	rts						;$4e75			;ffb8f2

Lffb8f4:									;ffb8f4
	cmp.w	#$ffff,d4				;$b87c,$ffff		;ffb8f4
	beq.s	Lffb96c					;$6772			;ffb8f8
	cmp.w	#$00ff,d4				;$b87c,$00ff		;ffb8fa
	beq.s	Lffb958					;$6758			;ffb8fe
	btst.l	#$00,d1					;$0801,$0000		;ffb900
	beq.s	Lffb928					;$6722			;ffb904
Lffb906:									;ffb906
	move.w	d1,d4					;$3801			;ffb906
Lffb908:									;ffb908
	move.b	(a1)+,d5				;$1a19			;ffb908
	move.b	d5,d0					;$1005			;ffb90a
	lsr.b	#4,d0					;$e808			;ffb90c
	and.w	#$000f,d0				;$c07c,$000f		;ffb90e
	move.w	d0,(a0)+				;$30c0			;ffb912
	and.w	#$000f,d5				;$ca7c,$000f		;ffb914
	move.w	d5,(a0)+				;$30c5			;ffb918
	subq.w	#1,d4					;$5344			;ffb91a
	dbra.w	d4,Lffb908				;$51cc,$ffea		;ffb91c
	adda.l	d3,a0					;$d1c3			;ffb920
	dbra.w	d2,Lffb906				;$51ca,$ffe2		;ffb922
	rts						;$4e75			;ffb926

Lffb928:									;ffb928
	move.w	d1,d4					;$3801			;ffb928
Lffb92a:									;ffb92a
	move.b	(a1)+,d5				;$1a19			;ffb92a
	move.b	d5,d0					;$1005			;ffb92c
	lsr.b	#4,d0					;$e808			;ffb92e
	and.w	#$000f,d0				;$c07c,$000f		;ffb930
	move.w	d0,(a0)+				;$30c0			;ffb934
	subq.w	#1,d4					;$5344			;ffb936
	bcs.s	Lffb94e					;$6514			;ffb938
Lffb93a:									;ffb93a
	and.w	#$000f,d5				;$ca7c,$000f		;ffb93a
	move.w	d5,(a0)+				;$30c5			;ffb93e
	dbra.w	d4,Lffb92a				;$51cc,$ffe8		;ffb940
	move.w	d1,d4					;$3801			;ffb944
	adda.l	d3,a0					;$d1c3			;ffb946
	dbra.w	d2,Lffb92a				;$51ca,$ffe0		;ffb948
	rts						;$4e75			;ffb94c

Lffb94e:									;ffb94e
	move.w	d1,d4					;$3801			;ffb94e
	adda.l	d3,a0					;$d1c3			;ffb950
	dbra.w	d2,Lffb93a				;$51ca,$ffe6		;ffb952
	rts						;$4e75			;ffb956

Lffb958:									;ffb958
	move.w	d1,d4					;$3801			;ffb958
Lffb95a:									;ffb95a
	clr.w	d0					;$4240			;ffb95a
	move.b	(a1)+,d0				;$1019			;ffb95c
	move.w	d0,(a0)+				;$30c0			;ffb95e
	dbra.w	d4,Lffb95a				;$51cc,$fff8		;ffb960
	adda.l	d3,a0					;$d1c3			;ffb964
	dbra.w	d2,Lffb958				;$51ca,$fff0		;ffb966
	rts						;$4e75			;ffb96a

Lffb96c:									;ffb96c
	move.w	d1,d4					;$3801			;ffb96c
Lffb96e:									;ffb96e
	move.w	(a1)+,(a0)+				;$30d9			;ffb96e
	dbra.w	d4,Lffb96e				;$51cc,$fffc		;ffb970
	adda.l	d3,a0					;$d1c3			;ffb974
	dbra.w	d2,Lffb96c				;$51ca,$fff4		;ffb976
	rts						;$4e75			;ffb97a

Call_Unknown_9a:								;ffb97c
	movem.l	d1-d5/a1,-(a7)				;$48e7,$7c40		;ffb97c
	bsr.s	Lffb9ec					;$616a			;ffb980
	move.w	($0966),d0				;$3038,$0966		;ffb982
Lffb986:									;ffb986
	move.w	d1,d4					;$3801			;ffb986
	swap.w	d2					;$4842			;ffb988
Lffb98a:									;ffb98a
	move.b	(a1)+,d5				;$1a19			;ffb98a
	move.w	#$0007,d2				;$343c,$0007		;ffb98c
Lffb990:									;ffb990
	rol.b	#1,d5					;$e31d			;ffb990
	bcc.s	Lffb996					;$6402			;ffb992
	move.w	d0,(a0)					;$3080			;ffb994
Lffb996:									;ffb996
	addq.l	#2,a0					;$5488			;ffb996
	dbra.w	d4,Lffb9aa				;$51cc,$0010		;ffb998
	adda.l	d3,a0					;$d1c3			;ffb99c
	swap.w	d2					;$4842			;ffb99e
	dbra.w	d2,Lffb986				;$51ca,$ffe4		;ffb9a0
Lffb9a4:									;ffb9a4
	movem.l	(a7)+,d1-d5/a1				;$4cdf,$023e		;ffb9a4
	rts						;$4e75			;ffb9a8

Lffb9aa:									;ffb9aa
	dbra.w	d2,Lffb990				;$51ca,$ffe4		;ffb9aa
	bra.s	Lffb98a					;$60da			;ffb9ae
Call_Unknown_9b:								;ffb9b0
	movem.l	d1-d5/a1,-(a7)				;$48e7,$7c40		;ffb9b0
	move.w	d3,d0					;$3003			;ffb9b4
	bsr.s	Lffb9ec					;$6134			;ffb9b6
	swap.w	d0					;$4840			;ffb9b8
	move.w	($0966),d0				;$3038,$0966		;ffb9ba
Lffb9be:									;ffb9be
	move.w	d1,d4					;$3801			;ffb9be
	swap.w	d2					;$4842			;ffb9c0
Lffb9c2:									;ffb9c2
	move.b	(a1)+,d5				;$1a19			;ffb9c2
	move.w	#$0007,d2				;$343c,$0007		;ffb9c4
Lffb9c8:									;ffb9c8
	rol.b	#1,d5					;$e31d			;ffb9c8
	bcc.s	Lffb9d0					;$6404			;ffb9ca
	move.w	d0,(a0)					;$3080			;ffb9cc
	bra.s	Lffb9d6					;$6006			;ffb9ce
Lffb9d0:									;ffb9d0
	swap.w	d0					;$4840			;ffb9d0
	move.w	d0,(a0)					;$3080			;ffb9d2
	swap.w	d0					;$4840			;ffb9d4
Lffb9d6:									;ffb9d6
	addq.l	#2,a0					;$5488			;ffb9d6
	dbra.w	d4,Lffb9e6				;$51cc,$000c		;ffb9d8
	adda.l	d3,a0					;$d1c3			;ffb9dc
	swap.w	d2					;$4842			;ffb9de
	dbra.w	d2,Lffb9be				;$51ca,$ffdc		;ffb9e0
	bra.s	Lffb9a4					;$60be			;ffb9e4
Lffb9e6:									;ffb9e6
	dbra.w	d2,Lffb9c8				;$51ca,$ffe0		;ffb9e6
	bra.s	Lffb9c2					;$60d6			;ffb9ea
Lffb9ec:									;ffb9ec
	move.l	($0960),d3				;$2638,$0960		;ffb9ec
	and.l	#$0000ffff,d1				;$c2bc,$0000,$ffff	;ffb9f0
	asl.l	#1,d1					;$e381			;ffb9f6
	mulu.w	d3,d2					;$c4c3			;ffb9f8
	add.l	d1,d2					;$d481			;ffb9fa
	movea.l	($095c),a0				;$2078,$095c		;ffb9fc
	adda.l	d2,a0					;$d1c2			;ffba00
	move.w	(a1)+,d1				;$3219			;ffba02
	sub.w	d1,d3					;$9641			;ffba04
	sub.w	d1,d3					;$9641			;ffba06
	subq.w	#1,d1					;$5341			;ffba08
	move.w	(a1)+,d2				;$3419			;ffba0a
	subq.w	#1,d2					;$5342			;ffba0c
	rts						;$4e75			;ffba0e

Call_Unknown_9c:								;ffba10
	movem.l	d1-d7/a1-a2,-(a7)			;$48e7,$7f60		;ffba10
	subq.w	#1,d3					;$5343			;ffba14
	cmp.w	#$03ff,d3				;$b67c,$03ff		;ffba16
	bcc.s	Lffba96					;$647a			;ffba1a
	subq.w	#1,d4					;$5344			;ffba1c
	cmp.w	#$03ff,d4				;$b87c,$03ff		;ffba1e
	bcc.s	Lffba96					;$6472			;ffba22
	move.w	d3,d6					;$3c03			;ffba24
	move.w	d4,d7					;$3e04			;ffba26
	move.l	($0960),d3				;$2638,$0960		;ffba28
	and.l	#$0000ffff,d1				;$c2bc,$0000,$ffff	;ffba2c
	asl.l	#1,d1					;$e381			;ffba32
	mulu.w	d3,d2					;$c4c3			;ffba34
	add.l	d1,d2					;$d481			;ffba36
	movea.l	($095c),a2				;$2478,$095c		;ffba38
	adda.l	d2,a2					;$d5c2			;ffba3c
	move.w	(a1)+,d1				;$3219			;ffba3e
	subq.w	#1,d1					;$5341			;ffba40
	move.w	(a1)+,d2				;$3419			;ffba42
	subq.w	#1,d2					;$5342			;ffba44
	move.w	($0966),d0				;$3038,$0966		;ffba46
Lffba4a:									;ffba4a
	move.w	d1,d4					;$3801			;ffba4a
	movea.l	a2,a0					;$204a			;ffba4c
	swap.w	d2					;$4842			;ffba4e
Lffba50:									;ffba50
	move.b	(a1)+,d5				;$1a19			;ffba50
	move.w	#$0007,d2				;$343c,$0007		;ffba52
Lffba56:									;ffba56
	rol.b	#1,d5					;$e31d			;ffba56
	bcc.s	Lffba72					;$6418			;ffba58
	movem.l	d1/d7/a0/a2,-(a7)			;$48e7,$41a0		;ffba5a
Lffba5e:									;ffba5e
	move.w	d6,d1					;$3206			;ffba5e
	movea.l	a0,a2					;$2448			;ffba60
Lffba62:									;ffba62
	move.w	d0,(a2)+				;$34c0			;ffba62
	dbra.w	d1,Lffba62				;$51c9,$fffc		;ffba64
	adda.l	d3,a0					;$d1c3			;ffba68
	dbra.w	d7,Lffba5e				;$51cf,$fff2		;ffba6a
	movem.l	(a7)+,d1/d7/a0/a2			;$4cdf,$0582		;ffba6e
Lffba72:									;ffba72
	move.w	d6,-(a7)				;$3f06			;ffba72
Lffba74:									;ffba74
	addq.l	#2,a0					;$5488			;ffba74
	dbra.w	d6,Lffba74				;$51ce,$fffc		;ffba76
	move.w	(a7)+,d6				;$3c1f			;ffba7a
	dbra.w	d4,Lffba90				;$51cc,$0012		;ffba7c
	move.w	d7,d2					;$3407			;ffba80
Lffba82:									;ffba82
	adda.l	d3,a2					;$d5c3			;ffba82
	dbra.w	d2,Lffba82				;$51ca,$fffc		;ffba84
	swap.w	d2					;$4842			;ffba88
	dbra.w	d2,Lffba4a				;$51ca,$ffbe		;ffba8a
	bra.s	Lffba96					;$6006			;ffba8e
Lffba90:									;ffba90
	dbra.w	d2,Lffba56				;$51ca,$ffc4		;ffba90
	bra.s	Lffba50					;$60ba			;ffba94
Lffba96:									;ffba96
	movem.l	(a7)+,d1-d7/a1-a2			;$4cdf,$06fe		;ffba96
	rts						;$4e75			;ffba9a

Call_APAGE:									;ffba9c
	tst.w	($0964)					;$4a78,$0964		;ffba9c
	beq.w	Lffbc1e					;$6700,$017c		;ffbaa0
	cmp.b	#-$01,d1				;$b23c,$ffff		;ffbaa4
	beq.s	Lffbad4					;$672a			;ffbaa8
	cmp.b	#$04,d1					;$b23c,$0004		;ffbaaa
	bcc.w	Lffbc22					;$6400,$0172		;ffbaae
	move.b	($093d),d0				;$1038,$093d		;ffbab2
	cmp.b	d0,d1					;$b200			;ffbab6
	bcc.w	Lffbc26					;$6400,$016c		;ffbab8
	move.w	d1,d0					;$3001			;ffbabc
	and.w	#$0003,d0				;$c07c,$0003		;ffbabe
	asl.w	#3,d0					;$e740			;ffbac2
	add.w	#$00c0,d0				;$d07c,$00c0		;ffbac4
	swap.w	d0					;$4840			;ffbac8
	clr.w	d0					;$4240			;ffbaca
	move.l	d0,($095c)				;$21c0,$095c		;ffbacc
	clr.l	d0					;$4280			;ffbad0
	rts						;$4e75			;ffbad2

Lffbad4:									;ffbad4
	move.l	($095c),d0				;$2038,$095c		;ffbad4
	swap.w	d0					;$4840			;ffbad8
	sub.w	#$00c0,d0				;$907c,$00c0		;ffbada
	lsr.w	#3,d0					;$e648			;ffbade
	and.l	#$00000003,d0				;$c0bc,$0000,$0003	;ffbae0
	rts						;$4e75			;ffbae6

Call_VPAGE:									;ffbae8
	tst.w	($0964)					;$4a78,$0964		;ffbae8
	beq.w	Lffbc1e					;$6700,$0130		;ffbaec
	cmp.b	#$10,d1					;$b23c,$0010		;ffbaf0
	bcc.w	Lffbc22					;$6400,$012c		;ffbaf4
	move.l	d2,-(a7)				;$2f02			;ffbaf8
	move.b	($093d),d2				;$1438,$093d		;ffbafa
	clr.l	d0					;$4280			;ffbafe
	bset.l	d2,d0					;$05c0			;ffbb00
	move.l	(a7)+,d2				;$241f			;ffbb02
	cmp.b	d0,d1					;$b200			;ffbb04
	bcc.w	Lffbc26					;$6400,$011e		;ffbb06
	move.l	d1,-(a7)				;$2f01			;ffbb0a
	move.b	($093d),d0				;$1038,$093d		;ffbb0c
	cmp.b	#$01,d0					;$b03c,$0001		;ffbb10
	beq.s	Lffbb56					;$6740			;ffbb14
	cmp.b	#$02,d0					;$b03c,$0002		;ffbb16
	beq.s	Lffbb3c					;$6720			;ffbb1a
Lffbb1c:									;ffbb1c
	tst.b	d1					;$4a01			;ffbb1c
	beq.s	Lffbb24					;$6704			;ffbb1e
	or.b	#$10,d1					;$823c,$0010		;ffbb20
Lffbb24:									;ffbb24
	move.w	($00e82600),d0				;$3039,$00e8,$2600	;ffbb24
	and.w	#$ffe0,d0				;$c07c,$ffe0		;ffbb2a
	or.w	d1,d0					;$8041			;ffbb2e
	move.w	d0,($00e82600)				;$33c0,$00e8,$2600	;ffbb30
	move.l	(a7)+,d1				;$221f			;ffbb36
	clr.l	d0					;$4280			;ffbb38
	rts						;$4e75			;ffbb3a

Lffbb3c:									;ffbb3c
	btst.l	#$01,d1					;$0801,$0001		;ffbb3c
	beq.s	Lffbb4a					;$6708			;ffbb40
	bclr.l	#$01,d1					;$0881,$0001		;ffbb42
	or.w	#$000c,d1				;$827c,$000c		;ffbb46
Lffbb4a:									;ffbb4a
	btst.l	#$00,d1					;$0801,$0000		;ffbb4a
	beq.s	Lffbb1c					;$67cc			;ffbb4e
	or.w	#$0003,d1				;$827c,$0003		;ffbb50
	bra.s	Lffbb1c					;$60c6			;ffbb54
Lffbb56:									;ffbb56
	tst.b	d1					;$4a01			;ffbb56
	beq.s	Lffbb1c					;$67c2			;ffbb58
	moveq.l	#$0f,d1					;$720f			;ffbb5a
	bra.s	Lffbb1c					;$60be			;ffbb5c
Call_HOME:									;ffbb5e
	tst.w	($0964)					;$4a78,$0964		;ffbb5e
	beq.w	Lffbc1e					;$6700,$00ba		;ffbb62
	cmp.b	#$10,d1					;$b23c,$0010		;ffbb66
	bcc.w	Lffbc22					;$6400,$00b6		;ffbb6a
	move.w	#$0400,d0				;$303c,$0400		;ffbb6e
	cmp.w	d0,d2					;$b440			;ffbb72
	bcc.w	Lffbc22					;$6400,$00ac		;ffbb74
	cmp.w	d0,d3					;$b640			;ffbb78
	bcc.w	Lffbc22					;$6400,$00a6		;ffbb7a
	move.l	($0960),d0				;$2038,$0960		;ffbb7e
	lsr.l	#1,d0					;$e288			;ffbb82
	cmp.w	d0,d2					;$b440			;ffbb84
	bcc.w	Lffbc26					;$6400,$009e		;ffbb86
	cmp.w	d0,d3					;$b640			;ffbb8a
	bcc.w	Lffbc26					;$6400,$0098		;ffbb8c
	move.l	d2,-(a7)				;$2f02			;ffbb90
	move.b	($093d),d2				;$1438,$093d		;ffbb92
	clr.l	d0					;$4280			;ffbb96
	bset.l	d2,d0					;$05c0			;ffbb98
	move.l	(a7)+,d2				;$241f			;ffbb9a
	cmp.b	d0,d1					;$b200			;ffbb9c
	bcc.w	Lffbc26					;$6400,$0086		;ffbb9e
	move.l	d1,-(a7)				;$2f01			;ffbba2
	move.b	($093d),d0				;$1038,$093d		;ffbba4
	cmp.b	#$01,d0					;$b03c,$0001		;ffbba8
	beq.s	Lffbc16					;$6768			;ffbbac
	cmp.b	#$02,d0					;$b03c,$0002		;ffbbae
	beq.s	Lffbbfc					;$6748			;ffbbb2
Lffbbb4:									;ffbbb4
	tst.b	d1					;$4a01			;ffbbb4
	bne.s	Lffbbba					;$6602			;ffbbb6
	moveq.l	#$0f,d1					;$720f			;ffbbb8
Lffbbba:									;ffbbba
	lea.l	($00e80018),a0				;$41f9,$00e8,$0018	;ffbbba
	btst.l	#$00,d1					;$0801,$0000		;ffbbc0
	beq.s	Lffbbcc					;$6706			;ffbbc4
	move.w	d2,(a0)					;$3082			;ffbbc6
	move.w	d3,($0002,a0)				;$3143,$0002		;ffbbc8
Lffbbcc:									;ffbbcc
	addq.l	#4,a0					;$5888			;ffbbcc
	btst.l	#$01,d1					;$0801,$0001		;ffbbce
	beq.s	Lffbbda					;$6706			;ffbbd2
	move.w	d2,(a0)					;$3082			;ffbbd4
	move.w	d3,($0002,a0)				;$3143,$0002		;ffbbd6
Lffbbda:									;ffbbda
	addq.l	#4,a0					;$5888			;ffbbda
	btst.l	#$02,d1					;$0801,$0002		;ffbbdc
	beq.s	Lffbbe8					;$6706			;ffbbe0
	move.w	d2,(a0)					;$3082			;ffbbe2
	move.w	d3,($0002,a0)				;$3143,$0002		;ffbbe4
Lffbbe8:									;ffbbe8
	addq.l	#4,a0					;$5888			;ffbbe8
	btst.l	#$03,d1					;$0801,$0003		;ffbbea
	beq.s	Lffbbf6					;$6706			;ffbbee
	move.w	d2,(a0)					;$3082			;ffbbf0
	move.w	d3,($0002,a0)				;$3143,$0002		;ffbbf2
Lffbbf6:									;ffbbf6
	move.l	(a7)+,d1				;$221f			;ffbbf6
	clr.l	d0					;$4280			;ffbbf8
	rts						;$4e75			;ffbbfa

Lffbbfc:									;ffbbfc
	btst.l	#$01,d1					;$0801,$0001		;ffbbfc
	beq.s	Lffbc0a					;$6708			;ffbc00
	bclr.l	#$01,d1					;$0881,$0001		;ffbc02
	or.w	#$000c,d1				;$827c,$000c		;ffbc06
Lffbc0a:									;ffbc0a
	btst.l	#$00,d1					;$0801,$0000		;ffbc0a
	beq.s	Lffbbb4					;$67a4			;ffbc0e
	or.w	#$0003,d1				;$827c,$0003		;ffbc10
	bra.s	Lffbbb4					;$609e			;ffbc14
Lffbc16:									;ffbc16
	tst.b	d1					;$4a01			;ffbc16
	beq.s	Lffbbb4					;$679a			;ffbc18
	moveq.l	#$0f,d1					;$720f			;ffbc1a
	bra.s	Lffbbb4					;$6096			;ffbc1c
Lffbc1e:									;ffbc1e
	moveq.l	#$ff,d0					;$70ff			;ffbc1e
	rts						;$4e75			;ffbc20

Lffbc22:									;ffbc22
	moveq.l	#$fe,d0					;$70fe			;ffbc22
	rts						;$4e75			;ffbc24

Lffbc26:									;ffbc26
	moveq.l	#$fd,d0					;$70fd			;ffbc26
	rts						;$4e75			;ffbc28

Call_WINDOW:									;ffbc2a
	tst.w	($0964)					;$4a78,$0964		;ffbc2a
	beq.s	Lffbc1e					;$67ee			;ffbc2e
	move.w	#$0400,d0				;$303c,$0400		;ffbc30
	cmp.w	d0,d1					;$b240			;ffbc34
	bcc.s	Lffbc22					;$64ea			;ffbc36
	cmp.w	d0,d2					;$b440			;ffbc38
	bcc.s	Lffbc22					;$64e6			;ffbc3a
	cmp.w	d0,d3					;$b640			;ffbc3c
	bcc.s	Lffbc22					;$64e2			;ffbc3e
	cmp.w	d0,d4					;$b840			;ffbc40
	bcc.s	Lffbc22					;$64de			;ffbc42
	move.l	($0960),d0				;$2038,$0960		;ffbc44
	lsr.l	#1,d0					;$e288			;ffbc48
	cmp.w	d0,d1					;$b240			;ffbc4a
	bcc.s	Lffbc26					;$64d8			;ffbc4c
	cmp.w	d0,d2					;$b440			;ffbc4e
	bcc.s	Lffbc26					;$64d4			;ffbc50
	cmp.w	d0,d3					;$b640			;ffbc52
	bcc.s	Lffbc26					;$64d0			;ffbc54
	cmp.w	d0,d4					;$b840			;ffbc56
	bcc.s	Lffbc26					;$64cc			;ffbc58
	lea.l	($0968),a0				;$41f8,$0968		;ffbc5a
	move.w	d1,(a0)+				;$30c1			;ffbc5e
	move.w	d2,(a0)+				;$30c2			;ffbc60
	move.w	d3,(a0)+				;$30c3			;ffbc62
	move.w	d4,(a0)+				;$30c4			;ffbc64
	clr.l	d0					;$4280			;ffbc66
	rts						;$4e75			;ffbc68

Call_SFTJIS:									;ffbc6a
	clr.l	d0					;$4280			;ffbc6a
	move.b	d1,d0					;$1001			;ffbc6c
	lsr.w	#8,d1					;$e049			;ffbc6e
	subi.b	#$81,d1					;$0401,$0081		;ffbc70
	cmpi.b	#$6f,d1					;$0c01,$006f		;ffbc74
	bcc.s	Lffbcbe					;$6444			;ffbc78
	cmpi.b	#$1f,d1					;$0c01,$001f		;ffbc7a
	bcs.s	Lffbc8a					;$650a			;ffbc7e
	cmpi.b	#$3f,d1					;$0c01,$003f		;ffbc80
	bcs.s	Lffbcbe					;$6538			;ffbc84
	subi.b	#$40,d1					;$0401,$0040		;ffbc86
Lffbc8a:									;ffbc8a
	add.b	d1,d1					;$d201			;ffbc8a
	add.b	#$21,d1					;$d23c,$0021		;ffbc8c
	subi.b	#$40,d0					;$0400,$0040		;ffbc90
	cmpi.b	#$bd,d0					;$0c00,$00bd		;ffbc94
	bcc.s	Lffbcbe					;$6424			;ffbc98
	cmpi.b	#$3f,d0					;$0c00,$003f		;ffbc9a
	beq.s	Lffbcbe					;$671e			;ffbc9e
	bcc.s	Lffbca4					;$6402			;ffbca0
	addq.b	#1,d0					;$5200			;ffbca2
Lffbca4:									;ffbca4
	cmpi.b	#$5f,d0					;$0c00,$005f		;ffbca4
	bcc.s	Lffbcb0					;$6406			;ffbca8
	addi.b	#$20,d0					;$0600,$0020		;ffbcaa
	bra.s	Lffbcb6					;$6006			;ffbcae
Lffbcb0:									;ffbcb0
	addq.b	#1,d1					;$5201			;ffbcb0
	subi.b	#$3e,d0					;$0400,$003e		;ffbcb2
Lffbcb6:									;ffbcb6
	asl.w	#8,d1					;$e141			;ffbcb6
	or.w	d1,d0					;$8041			;ffbcb8
	move.l	d0,d1					;$2200			;ffbcba
	rts						;$4e75			;ffbcbc

Lffbcbe:									;ffbcbe
	move.l	#$ffff2228.l,d0				;$203c,$ffff,$2228	;ffbcbe
	move.l	d0,d1					;$2200			;ffbcc4
	rts						;$4e75			;ffbcc6

Call_JISSFT:									;ffbcc8
	clr.l	d0					;$4280			;ffbcc8
	move.w	d1,d0					;$3001			;ffbcca
	lsr.w	#8,d0					;$e048			;ffbccc
	cmp.b	#$21,d1					;$b23c,$0021		;ffbcce
	bcs.s	Lffbd1e					;$654a			;ffbcd2
	cmp.b	#$7f,d1					;$b23c,$007f		;ffbcd4
	bcc.s	Lffbd1e					;$6444			;ffbcd8
	cmp.b	#$21,d0					;$b03c,$0021		;ffbcda
	bcs.s	Lffbd1e					;$653e			;ffbcde
	cmp.b	#$7f,d0					;$b03c,$007f		;ffbce0
	bcc.s	Lffbd1e					;$6438			;ffbce4
	cmp.b	#$29,d0					;$b03c,$0029		;ffbce6
	bcs.s	Lffbcf2					;$6506			;ffbcea
	cmp.b	#$30,d0					;$b03c,$0030		;ffbcec
	bcs.s	Lffbd1e					;$652c			;ffbcf0
Lffbcf2:									;ffbcf2
	add.b	#$1f,d1					;$d23c,$001f		;ffbcf2
	addq.b	#1,d0					;$5200			;ffbcf6
	lsr.b	#1,d0					;$e208			;ffbcf8
	bcc.s	Lffbd00					;$6404			;ffbcfa
	add.b	#$5e,d1					;$d23c,$005e		;ffbcfc
Lffbd00:									;ffbd00
	cmp.b	#$7f,d1					;$b23c,$007f		;ffbd00
	bcs.s	Lffbd08					;$6502			;ffbd04
	addq.b	#1,d1					;$5201			;ffbd06
Lffbd08:									;ffbd08
	add.b	#$70,d0					;$d03c,$0070		;ffbd08
	cmp.b	#$a0,d0					;$b03c,$00a0		;ffbd0c
	bcs.s	Lffbd16					;$6504			;ffbd10
	add.b	#$40,d0					;$d03c,$0040		;ffbd12
Lffbd16:									;ffbd16
	asl.w	#8,d0					;$e140			;ffbd16
	move.b	d1,d0					;$1001			;ffbd18
	move.l	d0,d1					;$2200			;ffbd1a
	rts						;$4e75			;ffbd1c

Lffbd1e:									;ffbd1e
	move.l	#$ffff81a6.l,d0				;$203c,$ffff,$81a6	;ffbd1e
	move.l	d0,d1					;$2200			;ffbd24
	rts						;$4e75			;ffbd26

Call_AKCONV:									;ffbd28
	move.l	d1,-(a7)				;$2f01			;ffbd28
	clr.l	d0					;$4280			;ffbd2a
	cmp.b	#$20,d1					;$b23c,$0020		;ffbd2c
	bcs.s	Lffbd7a					;$6548			;ffbd30
	cmp.b	#$30,d1					;$b23c,$0030		;ffbd32
	bcs.s	Lffbd7e					;$6546			;ffbd36
	cmp.b	#$3a,d1					;$b23c,$003a		;ffbd38
	bcs.s	Lffbdac					;$656e			;ffbd3c
	cmp.b	#$41,d1					;$b23c,$0041		;ffbd3e
	bcs.s	Lffbd84					;$6540			;ffbd42
	cmp.b	#$5b,d1					;$b23c,$005b		;ffbd44
	bcs.s	Lffbdac					;$6562			;ffbd48
	cmp.b	#$61,d1					;$b23c,$0061		;ffbd4a
	bcs.s	Lffbd8a					;$653a			;ffbd4e
	cmp.b	#$7b,d1					;$b23c,$007b		;ffbd50
	bcs.s	Lffbdac					;$6556			;ffbd54
	cmp.b	#$7f,d1					;$b23c,$007f		;ffbd56
	bcs.s	Lffbd90					;$6534			;ffbd5a
	cmp.b	#$a0,d1					;$b23c,$00a0		;ffbd5c
	bcs.s	Lffbd70					;$650e			;ffbd60
	beq.s	Lffbd7a					;$6716			;ffbd62
	cmp.b	#$a6,d1					;$b23c,$00a6		;ffbd64
	bcs.s	Lffbd96					;$652c			;ffbd68
	cmp.b	#$e0,d1					;$b23c,$00e0		;ffbd6a
	bcs.s	Lffbdc0					;$6550			;ffbd6e
Lffbd70:									;ffbd70
	move.l	#$ffff81a6.l,d0				;$203c,$ffff,$81a6	;ffbd70
	bra.w	Lffbe02					;$6000,$008a		;ffbd76
Lffbd7a:									;ffbd7a
	move.w	#$0020,d1				;$323c,$0020		;ffbd7a
Lffbd7e:									;ffbd7e
	sub.b	#$20,d1					;$923c,$0020		;ffbd7e
	bra.s	Lffbd9a					;$6016			;ffbd82
Lffbd84:									;ffbd84
	sub.b	#$2a,d1					;$923c,$002a		;ffbd84
	bra.s	Lffbd9a					;$6010			;ffbd88
Lffbd8a:									;ffbd8a
	sub.b	#$44,d1					;$923c,$0044		;ffbd8a
	bra.s	Lffbd9a					;$600a			;ffbd8e
Lffbd90:									;ffbd90
	sub.b	#$5e,d1					;$923c,$005e		;ffbd90
	bra.s	Lffbd9a					;$6004			;ffbd94
Lffbd96:									;ffbd96
	sub.b	#$80,d1					;$923c,$0080		;ffbd96
Lffbd9a:									;ffbd9a
	and.w	#$00ff,d1				;$c27c,$00ff		;ffbd9a
	lea.l	(Lffc8b8,pc),a0				;$41fa,$0b18		;ffbd9e
	move.b	(a0,d1.w),d0				;$1030,$1000		;ffbda2
Lffbda6:									;ffbda6
	or.w	#$8100,d0				;$807c,$8100		;ffbda6
	bra.s	Lffbe02					;$6056			;ffbdaa
Lffbdac:									;ffbdac
	move.w	#$8200,d0				;$303c,$8200		;ffbdac
	add.b	#$1f,d1					;$d23c,$001f		;ffbdb0
	cmp.b	#$7f,d1					;$b23c,$007f		;ffbdb4
	bcs.s	Lffbdbc					;$6502			;ffbdb8
	addq.b	#1,d1					;$5201			;ffbdba
Lffbdbc:									;ffbdbc
	move.b	d1,d0					;$1001			;ffbdbc
	bra.s	Lffbe02					;$6042			;ffbdbe
Lffbdc0:									;ffbdc0
	moveq.l	#$5b,d0					;$705b			;ffbdc0
	cmp.b	#$b0,d1					;$b23c,$00b0		;ffbdc2
	beq.s	Lffbda6					;$67de			;ffbdc6
	moveq.l	#$4a,d0					;$704a			;ffbdc8
	cmp.b	#$de,d1					;$b23c,$00de		;ffbdca
	beq.s	Lffbda6					;$67d6			;ffbdce
	addq.b	#1,d0					;$5200			;ffbdd0
	cmp.b	#$df,d1					;$b23c,$00df		;ffbdd2
	beq.s	Lffbda6					;$67ce			;ffbdd6
	lea.l	(Lffc8de,pc),a0				;$41fa,$0b04		;ffbdd8
	sub.b	#$a6,d1					;$923c,$00a6		;ffbddc
	and.w	#$00ff,d1				;$c27c,$00ff		;ffbde0
	move.w	#$8200,d0				;$303c,$8200		;ffbde4
	move.b	(a0,d1.w),d0				;$1030,$1000		;ffbde8
	swap.w	d1					;$4841			;ffbdec
	tst.w	d1					;$4a41			;ffbdee
	beq.s	Lffbe02					;$6710			;ffbdf0
	sub.b	#$5f,d0					;$903c,$005f		;ffbdf2
	cmp.b	#$7f,d0					;$b03c,$007f		;ffbdf6
	bcs.s	Lffbdfe					;$6502			;ffbdfa
	addq.b	#1,d0					;$5200			;ffbdfc
Lffbdfe:									;ffbdfe
	add.w	#$0100,d0				;$d07c,$0100		;ffbdfe
Lffbe02:									;ffbe02
	move.l	(a7)+,d1				;$221f			;ffbe02
	rts						;$4e75			;ffbe04

Call_RMACNV:									;ffbe06
	movem.l	d1-d7/a1-a4,-(a7)			;$48e7,$7f78		;ffbe06
	movea.l	a1,a3					;$2649			;ffbe0a
	movea.l	a2,a4					;$284a			;ffbe0c
	cmp.b	#$27,d1					;$b23c,$0027		;ffbe0e
	beq.s	Lffbe52					;$673e			;ffbe12
	cmp.b	#$2c,d1					;$b23c,$002c		;ffbe14
	beq.s	Lffbe7a					;$6760			;ffbe18
	cmp.b	#$2e,d1					;$b23c,$002e		;ffbe1a
	beq.s	Lffbe7a					;$675a			;ffbe1e
	cmp.b	#$2f,d1					;$b23c,$002f		;ffbe20
	beq.s	Lffbe7a					;$6754			;ffbe24
	cmp.b	#$2d,d1					;$b23c,$002d		;ffbe26
	beq.s	Lffbe7a					;$674e			;ffbe2a
	cmp.b	#$5b,d1					;$b23c,$005b		;ffbe2c
	beq.s	Lffbe7a					;$6748			;ffbe30
	cmp.b	#$5d,d1					;$b23c,$005d		;ffbe32
	beq.s	Lffbe7a					;$6742			;ffbe36
	cmp.b	#$40,d1					;$b23c,$0040		;ffbe38
	bcs.s	Lffbe56					;$6518			;ffbe3c
	cmp.b	#$5a,d1					;$b23c,$005a		;ffbe3e
	bls.s	Lffbe7a					;$6336			;ffbe42
	cmp.b	#$60,d1					;$b23c,$0060		;ffbe44
	bcs.s	Lffbe56					;$650c			;ffbe48
	cmp.b	#$7a,d1					;$b23c,$007a		;ffbe4a
	bls.s	Lffbe7a					;$632a			;ffbe4e
	bra.s	Lffbe56					;$6004			;ffbe50
Lffbe52:									;ffbe52
	tst.b	(a1)					;$4a11			;ffbe52
	bne.s	Lffbe7a					;$6624			;ffbe54
Lffbe56:									;ffbe56
	moveq.l	#$01,d0					;$7001			;ffbe56
	move.b	(a1),d2					;$1411			;ffbe58
	and.b	#$df,d2					;$c43c,$00df		;ffbe5a
	cmp.b	#$4e,d2					;$b43c,$004e		;ffbe5e
	bne.s	Lffbe70					;$660c			;ffbe62
	tst.b	($0001,a1)				;$4a29,$0001		;ffbe64
	bne.s	Lffbe70					;$6606			;ffbe68
	move.b	#$dd,(a2)+				;$14fc,$00dd		;ffbe6a
	addq.l	#1,d0					;$5280			;ffbe6e
Lffbe70:									;ffbe70
	clr.b	(a1)					;$4211			;ffbe70
	move.b	d1,(a2)+				;$14c1			;ffbe72
	clr.b	(a2)					;$4212			;ffbe74
	bra.w	Lffc688					;$6000,$0810		;ffbe76
Lffbe7a:									;ffbe7a
	tst.b	(a1)+					;$4a19			;ffbe7a
	bne.s	Lffbe7a					;$66fc			;ffbe7c
	move.b	d1,(-$0001,a1)				;$1341,$ffff		;ffbe7e
	clr.b	(a1)					;$4211			;ffbe82
	movea.l	a3,a1					;$224b			;ffbe84
	move.b	(a1)+,d2				;$1419			;ffbe86
	move.b	d2,d3					;$1602			;ffbe88
	cmp.b	#$61,d2					;$b43c,$0061		;ffbe8a
	bcs.s	Lffbe9a					;$650a			;ffbe8e
	cmp.b	#$7a,d2					;$b43c,$007a		;ffbe90
	bhi.s	Lffbe9a					;$6204			;ffbe94
	and.b	#$df,d2					;$c43c,$00df		;ffbe96
Lffbe9a:									;ffbe9a
	move.b	#$b1,d1					;$123c,$00b1		;ffbe9a
	cmp.b	#$61,d3					;$b63c,$0061		;ffbe9e
	beq.w	Lffbf50					;$6700,$00ac		;ffbea2
	cmp.b	#$41,d3					;$b63c,$0041		;ffbea6
	beq.w	Lffbf54					;$6700,$00a8		;ffbeaa
	addq.b	#1,d1					;$5201			;ffbeae
	cmp.b	#$69,d3					;$b63c,$0069		;ffbeb0
	beq.w	Lffbf50					;$6700,$009a		;ffbeb4
	cmp.b	#$49,d3					;$b63c,$0049		;ffbeb8
	beq.w	Lffbf54					;$6700,$0096		;ffbebc
	addq.b	#1,d1					;$5201			;ffbec0
	cmp.b	#$75,d3					;$b63c,$0075		;ffbec2
	beq.w	Lffbf50					;$6700,$0088		;ffbec6
	cmp.b	#$55,d3					;$b63c,$0055		;ffbeca
	beq.w	Lffbf54					;$6700,$0084		;ffbece
	addq.b	#1,d1					;$5201			;ffbed2
	cmp.b	#$65,d3					;$b63c,$0065		;ffbed4
	beq.s	Lffbf50					;$6776			;ffbed8
	cmp.b	#$45,d3					;$b63c,$0045		;ffbeda
	beq.s	Lffbf54					;$6774			;ffbede
	addq.b	#1,d1					;$5201			;ffbee0
	cmp.b	#$6f,d3					;$b63c,$006f		;ffbee2
	beq.s	Lffbf50					;$6768			;ffbee6
	cmp.b	#$4f,d3					;$b63c,$004f		;ffbee8
	beq.s	Lffbf54					;$6766			;ffbeec
	move.b	#$dd,d1					;$123c,$00dd		;ffbeee
	cmp.b	#$58,d2					;$b43c,$0058		;ffbef2
	beq.s	Lffbf54					;$675c			;ffbef6
	cmp.b	#$6e,d3					;$b63c,$006e		;ffbef8
	beq.s	Lffbf54					;$6756			;ffbefc
	move.b	#$af,d1					;$123c,$00af		;ffbefe
	cmp.b	#$7a,d3					;$b63c,$007a		;ffbf02
	beq.s	Lffbf54					;$674c			;ffbf06
	move.b	#$a1,d1					;$123c,$00a1		;ffbf08
	cmp.b	#$2e,d2					;$b43c,$002e		;ffbf0c
	beq.s	Lffbf54					;$6742			;ffbf10
	addq.b	#1,d1					;$5201			;ffbf12
	cmp.b	#$5b,d2					;$b43c,$005b		;ffbf14
	beq.s	Lffbf54					;$673a			;ffbf18
	addq.b	#1,d1					;$5201			;ffbf1a
	cmp.b	#$5d,d2					;$b43c,$005d		;ffbf1c
	beq.s	Lffbf54					;$6732			;ffbf20
	addq.b	#1,d1					;$5201			;ffbf22
	cmp.b	#$2c,d2					;$b43c,$002c		;ffbf24
	beq.s	Lffbf54					;$672a			;ffbf28
	addq.b	#1,d1					;$5201			;ffbf2a
	cmp.b	#$2f,d2					;$b43c,$002f		;ffbf2c
	beq.s	Lffbf54					;$6722			;ffbf30
	move.b	#$b0,d1					;$123c,$00b0		;ffbf32
	cmp.b	#$2d,d2					;$b43c,$002d		;ffbf36
	beq.s	Lffbf54					;$6718			;ffbf3a
	move.b	#$de,d1					;$123c,$00de		;ffbf3c
	cmp.b	#$40,d2					;$b43c,$0040		;ffbf40
	beq.s	Lffbf54					;$670e			;ffbf44
	addq.b	#1,d1					;$5201			;ffbf46
	cmp.b	#$60,d2					;$b43c,$0060		;ffbf48
	beq.s	Lffbf54					;$6706			;ffbf4c
	bra.s	Lffbf5c					;$600c			;ffbf4e
Lffbf50:									;ffbf50
	sub.b	#$0a,d1					;$923c,$000a		;ffbf50
Lffbf54:									;ffbf54
	move.b	d1,(a2)+				;$14c1			;ffbf54
	moveq.l	#$01,d0					;$7001			;ffbf56
	bra.w	Lffc67e					;$6000,$0724		;ffbf58
Lffbf5c:									;ffbf5c
	move.b	#$dc,d1					;$123c,$00dc		;ffbf5c
	cmp.b	#$57,d2					;$b43c,$0057		;ffbf60
	beq.w	Lffbff0					;$6700,$008a		;ffbf64
	move.b	#$b1,d1					;$123c,$00b1		;ffbf68
	cmp.b	#$56,d2					;$b43c,$0056		;ffbf6c
	beq.s	Lffbff0					;$677e			;ffbf70
	addq.b	#5,d1					;$5a01			;ffbf72
	cmp.b	#$4b,d2					;$b43c,$004b		;ffbf74
	beq.s	Lffbff0					;$6776			;ffbf78
	cmp.b	#$47,d2					;$b43c,$0047		;ffbf7a
	beq.s	Lffbff0					;$6770			;ffbf7e
	cmp.b	#$43,d2					;$b43c,$0043		;ffbf80
	beq.s	Lffbff0					;$676a			;ffbf84
	cmp.b	#$51,d2					;$b43c,$0051		;ffbf86
	beq.s	Lffbff0					;$6764			;ffbf8a
	addq.b	#5,d1					;$5a01			;ffbf8c
	cmp.b	#$53,d2					;$b43c,$0053		;ffbf8e
	beq.s	Lffbff0					;$675c			;ffbf92
	cmp.b	#$4a,d2					;$b43c,$004a		;ffbf94
	beq.s	Lffbff0					;$6756			;ffbf98
	cmp.b	#$5a,d2					;$b43c,$005a		;ffbf9a
	beq.s	Lffbff0					;$6750			;ffbf9e
	addq.b	#5,d1					;$5a01			;ffbfa0
	cmp.b	#$54,d2					;$b43c,$0054		;ffbfa2
	beq.s	Lffbff0					;$6748			;ffbfa6
	cmp.b	#$44,d2					;$b43c,$0044		;ffbfa8
	beq.s	Lffbff0					;$6742			;ffbfac
	addq.b	#5,d1					;$5a01			;ffbfae
	cmp.b	#$4e,d2					;$b43c,$004e		;ffbfb0
	beq.s	Lffbff0					;$673a			;ffbfb4
	addq.b	#5,d1					;$5a01			;ffbfb6
	cmp.b	#$48,d2					;$b43c,$0048		;ffbfb8
	beq.s	Lffbff0					;$6732			;ffbfbc
	cmp.b	#$42,d2					;$b43c,$0042		;ffbfbe
	beq.s	Lffbff0					;$672c			;ffbfc2
	cmp.b	#$50,d2					;$b43c,$0050		;ffbfc4
	beq.s	Lffbff0					;$6726			;ffbfc8
	cmp.b	#$46,d2					;$b43c,$0046		;ffbfca
	beq.s	Lffbff0					;$6720			;ffbfce
	addq.b	#5,d1					;$5a01			;ffbfd0
	cmp.b	#$4d,d2					;$b43c,$004d		;ffbfd2
	beq.s	Lffbff0					;$6718			;ffbfd6
	addq.b	#5,d1					;$5a01			;ffbfd8
	cmp.b	#$59,d2					;$b43c,$0059		;ffbfda
	beq.s	Lffbff0					;$6710			;ffbfde
	addq.b	#3,d1					;$5601			;ffbfe0
	cmp.b	#$52,d2					;$b43c,$0052		;ffbfe2
	beq.s	Lffbff0					;$6708			;ffbfe6
	cmp.b	#$4c,d2					;$b43c,$004c		;ffbfe8
	bne.w	Lffc676					;$6600,$0688		;ffbfec
Lffbff0:									;ffbff0
	move.b	(a1),d4					;$1811			;ffbff0
	beq.w	Lffc686					;$6700,$0692		;ffbff2
	move.b	d4,d3					;$1604			;ffbff6
	cmp.b	#$41,d4					;$b83c,$0041		;ffbff8
	bcs.s	Lffc010					;$6512			;ffbffc
	cmp.b	#$5a,d4					;$b83c,$005a		;ffbffe
	bls.s	Lffc07c					;$6378			;ffc002
	cmp.b	#$61,d4					;$b83c,$0061		;ffc004
	bcs.s	Lffc010					;$6506			;ffc008
	cmp.b	#$7a,d4					;$b83c,$007a		;ffc00a
	bls.s	Lffc078					;$6368			;ffc00e
Lffc010:									;ffc010
	cmp.b	#$4e,d2					;$b43c,$004e		;ffc010
	bne.w	Lffc676					;$6600,$0660		;ffc014
	move.b	#$dd,(a2)+				;$14fc,$00dd		;ffc018
	addq.l	#1,a1					;$5289			;ffc01c
	moveq.l	#$01,d0					;$7001			;ffc01e
	cmp.b	#$27,d4					;$b83c,$0027		;ffc020
	beq.w	Lffc67e					;$6700,$0658		;ffc024
	addq.l	#1,d0					;$5280			;ffc028
	move.b	#$a1,d1					;$123c,$00a1		;ffc02a
	cmp.b	#$2e,d4					;$b83c,$002e		;ffc02e
	beq.s	Lffc072					;$673e			;ffc032
	addq.b	#1,d1					;$5201			;ffc034
	cmp.b	#$5b,d4					;$b83c,$005b		;ffc036
	beq.s	Lffc072					;$6736			;ffc03a
	addq.b	#1,d1					;$5201			;ffc03c
	cmp.b	#$5d,d4					;$b83c,$005d		;ffc03e
	beq.s	Lffc072					;$672e			;ffc042
	addq.b	#1,d1					;$5201			;ffc044
	cmp.b	#$2c,d4					;$b83c,$002c		;ffc046
	beq.s	Lffc072					;$6726			;ffc04a
	addq.b	#1,d1					;$5201			;ffc04c
	cmp.b	#$2f,d4					;$b83c,$002f		;ffc04e
	beq.s	Lffc072					;$671e			;ffc052
	move.b	#$b0,d1					;$123c,$00b0		;ffc054
	cmp.b	#$2d,d4					;$b83c,$002d		;ffc058
	beq.s	Lffc072					;$6714			;ffc05c
	move.b	#$de,d1					;$123c,$00de		;ffc05e
	cmp.b	#$40,d4					;$b83c,$0040		;ffc062
	beq.s	Lffc072					;$670a			;ffc066
	addq.b	#1,d1					;$5201			;ffc068
	cmp.b	#$60,d4					;$b83c,$0060		;ffc06a
	bne.w	Lffc676					;$6600,$0606		;ffc06e
Lffc072:									;ffc072
	move.b	d1,(a2)+				;$14c1			;ffc072
	bra.w	Lffc67e					;$6000,$0608		;ffc074
Lffc078:									;ffc078
	and.b	#$df,d4					;$c83c,$00df		;ffc078
Lffc07c:									;ffc07c
	cmp.b	d2,d4					;$b802			;ffc07c
	bne.s	Lffc098					;$6618			;ffc07e
	move.b	#$af,d1					;$123c,$00af		;ffc080
	cmp.b	#$4e,d4					;$b83c,$004e		;ffc084
	bne.s	Lffc090					;$6606			;ffc088
	move.b	#$dd,d1					;$123c,$00dd		;ffc08a
	addq.l	#1,a1					;$5289			;ffc08e
Lffc090:									;ffc090
	move.b	d1,(a2)+				;$14c1			;ffc090
	moveq.l	#$01,d0					;$7001			;ffc092
	bra.w	Lffc67e					;$6000,$05e8		;ffc094
Lffc098:									;ffc098
	cmp.b	#$41,d4					;$b83c,$0041		;ffc098
	bne.w	Lffc138					;$6600,$009a		;ffc09c
	addq.l	#1,a1					;$5289			;ffc0a0
	cmp.b	#$46,d2					;$b43c,$0046		;ffc0a2
	beq.s	Lffc0c6					;$671e			;ffc0a6
	cmp.b	#$51,d2					;$b43c,$0051		;ffc0a8
	beq.s	Lffc0c6					;$6718			;ffc0ac
	cmp.b	#$56,d2					;$b43c,$0056		;ffc0ae
	bne.s	Lffc0d4					;$6620			;ffc0b2
	addq.b	#2,d1					;$5401			;ffc0b4
	move.b	d1,(a2)+				;$14c1			;ffc0b6
	move.b	#$de,(a2)+				;$14fc,$00de		;ffc0b8
	move.b	#$a7,(a2)+				;$14fc,$00a7		;ffc0bc
	moveq.l	#$03,d0					;$7003			;ffc0c0
	bra.w	Lffc67e					;$6000,$05ba		;ffc0c2
Lffc0c6:									;ffc0c6
	addq.b	#2,d1					;$5401			;ffc0c6
	move.b	d1,(a2)+				;$14c1			;ffc0c8
	move.b	#$a7,(a2)+				;$14fc,$00a7		;ffc0ca
	moveq.l	#$02,d0					;$7002			;ffc0ce
	bra.w	Lffc67e					;$6000,$05ac		;ffc0d0
Lffc0d4:									;ffc0d4
	cmp.b	#$50,d2					;$b43c,$0050		;ffc0d4
	bne.s	Lffc0e6					;$660c			;ffc0d8
	move.b	d1,(a2)+				;$14c1			;ffc0da
	move.b	#$df,(a2)+				;$14fc,$00df		;ffc0dc
	moveq.l	#$02,d0					;$7002			;ffc0e0
	bra.w	Lffc67e					;$6000,$059a		;ffc0e2
Lffc0e6:									;ffc0e6
	cmp.b	#$47,d2					;$b43c,$0047		;ffc0e6
	beq.s	Lffc0fe					;$6712			;ffc0ea
	cmp.b	#$5a,d2					;$b43c,$005a		;ffc0ec
	beq.s	Lffc0fe					;$670c			;ffc0f0
	cmp.b	#$44,d2					;$b43c,$0044		;ffc0f2
	beq.s	Lffc0fe					;$6706			;ffc0f6
	cmp.b	#$42,d2					;$b43c,$0042		;ffc0f8
	bne.s	Lffc10a					;$660c			;ffc0fc
Lffc0fe:									;ffc0fe
	move.b	d1,(a2)+				;$14c1			;ffc0fe
	move.b	#$de,(a2)+				;$14fc,$00de		;ffc100
	moveq.l	#$02,d0					;$7002			;ffc104
	bra.w	Lffc67e					;$6000,$0576		;ffc106
Lffc10a:									;ffc10a
	cmp.b	#$4a,d2					;$b43c,$004a		;ffc10a
	bne.s	Lffc122					;$6612			;ffc10e
	addq.b	#1,d1					;$5201			;ffc110
	move.b	d1,(a2)+				;$14c1			;ffc112
	move.b	#$de,(a2)+				;$14fc,$00de		;ffc114
	move.b	#$ac,(a2)+				;$14fc,$00ac		;ffc118
	moveq.l	#$03,d0					;$7003			;ffc11c
	bra.w	Lffc67e					;$6000,$055e		;ffc11e
Lffc122:									;ffc122
	cmp.b	#$59,d2					;$b43c,$0059		;ffc122
	bne.w	Lffbf54					;$6600,$fe2c		;ffc126
	cmp.b	d3,d4					;$b803			;ffc12a
	beq.w	Lffbf54					;$6700,$fe26		;ffc12c
	sub.b	#$28,d1					;$923c,$0028		;ffc130
	bra.w	Lffbf54					;$6000,$fe1e		;ffc134
Lffc138:									;ffc138
	cmp.b	#$55,d4					;$b83c,$0055		;ffc138
	bne.w	Lffc1d0					;$6600,$0092		;ffc13c
	addq.l	#1,a1					;$5289			;ffc140
	cmp.b	#$50,d2					;$b43c,$0050		;ffc142
	bne.s	Lffc156					;$660e			;ffc146
	addq.b	#2,d1					;$5401			;ffc148
	move.b	d1,(a2)+				;$14c1			;ffc14a
	move.b	#$df,(a2)+				;$14fc,$00df		;ffc14c
	moveq.l	#$02,d0					;$7002			;ffc150
	bra.w	Lffc67e					;$6000,$052a		;ffc152
Lffc156:									;ffc156
	cmp.b	#$56,d2					;$b43c,$0056		;ffc156
	beq.s	Lffc174					;$6718			;ffc15a
	cmp.b	#$47,d2					;$b43c,$0047		;ffc15c
	beq.s	Lffc174					;$6712			;ffc160
	cmp.b	#$5a,d2					;$b43c,$005a		;ffc162
	beq.s	Lffc174					;$670c			;ffc166
	cmp.b	#$44,d2					;$b43c,$0044		;ffc168
	beq.s	Lffc174					;$6706			;ffc16c
	cmp.b	#$42,d2					;$b43c,$0042		;ffc16e
	bne.s	Lffc182					;$660e			;ffc172
Lffc174:									;ffc174
	addq.b	#2,d1					;$5401			;ffc174
	move.b	d1,(a2)+				;$14c1			;ffc176
	move.b	#$de,(a2)+				;$14fc,$00de		;ffc178
	moveq.l	#$02,d0					;$7002			;ffc17c
	bra.w	Lffc67e					;$6000,$04fe		;ffc17e
Lffc182:									;ffc182
	cmp.b	#$4a,d2					;$b43c,$004a		;ffc182
	bne.s	Lffc19a					;$6612			;ffc186
	addq.b	#1,d1					;$5201			;ffc188
	move.b	d1,(a2)+				;$14c1			;ffc18a
	move.b	#$de,(a2)+				;$14fc,$00de		;ffc18c
	move.b	#$ad,(a2)+				;$14fc,$00ad		;ffc190
	moveq.l	#$03,d0					;$7003			;ffc194
	bra.w	Lffc67e					;$6000,$04e6		;ffc196
Lffc19a:									;ffc19a
	cmp.b	#$57,d2					;$b43c,$0057		;ffc19a
	beq.s	Lffc1c6					;$6726			;ffc19e
	cmp.b	#$54,d2					;$b43c,$0054		;ffc1a0
	bne.s	Lffc1b2					;$660c			;ffc1a4
	cmp.b	d3,d4					;$b803			;ffc1a6
	beq.s	Lffc1ca					;$6720			;ffc1a8
	move.b	#$af,d1					;$123c,$00af		;ffc1aa
	bra.w	Lffbf54					;$6000,$fda4		;ffc1ae
Lffc1b2:									;ffc1b2
	cmp.b	#$59,d2					;$b43c,$0059		;ffc1b2
	bne.s	Lffc1ca					;$6612			;ffc1b6
	cmp.b	d3,d4					;$b803			;ffc1b8
	beq.w	Lffc324					;$6700,$0168		;ffc1ba
	move.b	#$ad,d1					;$123c,$00ad		;ffc1be
	bra.w	Lffbf54					;$6000,$fd90		;ffc1c2
Lffc1c6:									;ffc1c6
	sub.b	#$2b,d1					;$923c,$002b		;ffc1c6
Lffc1ca:									;ffc1ca
	addq.b	#2,d1					;$5401			;ffc1ca
	bra.w	Lffbf54					;$6000,$fd86		;ffc1cc
Lffc1d0:									;ffc1d0
	cmp.b	#$4f,d4					;$b83c,$004f		;ffc1d0
	bne.w	Lffc282					;$6600,$00ac		;ffc1d4
	addq.l	#1,a1					;$5289			;ffc1d8
	cmp.b	#$46,d2					;$b43c,$0046		;ffc1da
	beq.s	Lffc1fe					;$671e			;ffc1de
	cmp.b	#$51,d2					;$b43c,$0051		;ffc1e0
	beq.s	Lffc1fe					;$6718			;ffc1e4
	cmp.b	#$56,d2					;$b43c,$0056		;ffc1e6
	bne.s	Lffc20c					;$6620			;ffc1ea
	addq.b	#2,d1					;$5401			;ffc1ec
	move.b	d1,(a2)+				;$14c1			;ffc1ee
	move.b	#$de,(a2)+				;$14fc,$00de		;ffc1f0
	move.b	#$ab,(a2)+				;$14fc,$00ab		;ffc1f4
	moveq.l	#$03,d0					;$7003			;ffc1f8
	bra.w	Lffc67e					;$6000,$0482		;ffc1fa
Lffc1fe:									;ffc1fe
	addq.b	#2,d1					;$5401			;ffc1fe
	move.b	d1,(a2)+				;$14c1			;ffc200
	move.b	#$ab,(a2)+				;$14fc,$00ab		;ffc202
	moveq.l	#$02,d0					;$7002			;ffc206
	bra.w	Lffc67e					;$6000,$0474		;ffc208
Lffc20c:									;ffc20c
	cmp.b	#$50,d2					;$b43c,$0050		;ffc20c
	bne.s	Lffc220					;$660e			;ffc210
	addq.b	#4,d1					;$5801			;ffc212
	move.b	d1,(a2)+				;$14c1			;ffc214
	move.b	#$df,(a2)+				;$14fc,$00df		;ffc216
	moveq.l	#$02,d0					;$7002			;ffc21a
	bra.w	Lffc67e					;$6000,$0460		;ffc21c
Lffc220:									;ffc220
	cmp.b	#$47,d2					;$b43c,$0047		;ffc220
	beq.s	Lffc238					;$6712			;ffc224
	cmp.b	#$5a,d2					;$b43c,$005a		;ffc226
	beq.s	Lffc238					;$670c			;ffc22a
	cmp.b	#$44,d2					;$b43c,$0044		;ffc22c
	beq.s	Lffc238					;$6706			;ffc230
	cmp.b	#$42,d2					;$b43c,$0042		;ffc232
	bne.s	Lffc246					;$660e			;ffc236
Lffc238:									;ffc238
	addq.b	#4,d1					;$5801			;ffc238
	move.b	d1,(a2)+				;$14c1			;ffc23a
	move.b	#$de,(a2)+				;$14fc,$00de		;ffc23c
	moveq.l	#$02,d0					;$7002			;ffc240
	bra.w	Lffc67e					;$6000,$043a		;ffc242
Lffc246:									;ffc246
	cmp.b	#$4a,d2					;$b43c,$004a		;ffc246
	bne.s	Lffc25e					;$6612			;ffc24a
	addq.b	#1,d1					;$5201			;ffc24c
	move.b	d1,(a2)+				;$14c1			;ffc24e
	move.b	#$de,(a2)+				;$14fc,$00de		;ffc250
	move.b	#$ae,(a2)+				;$14fc,$00ae		;ffc254
	moveq.l	#$03,d0					;$7003			;ffc258
	bra.w	Lffc67e					;$6000,$0422		;ffc25a
Lffc25e:									;ffc25e
	cmp.b	#$57,d2					;$b43c,$0057		;ffc25e
	beq.s	Lffc278					;$6714			;ffc262
	cmp.b	#$59,d2					;$b43c,$0059		;ffc264
	bne.s	Lffc27c					;$6612			;ffc268
	cmp.b	d3,d4					;$b803			;ffc26a
	beq.w	Lffc1ca					;$6700,$ff5c		;ffc26c
	move.b	#$ae,d1					;$123c,$00ae		;ffc270
	bra.w	Lffbf54					;$6000,$fcde		;ffc274
Lffc278:									;ffc278
	sub.b	#$3a,d1					;$923c,$003a		;ffc278
Lffc27c:									;ffc27c
	addq.b	#4,d1					;$5801			;ffc27c
	bra.w	Lffbf54					;$6000,$fcd4		;ffc27e
Lffc282:									;ffc282
	cmp.b	#$49,d4					;$b83c,$0049		;ffc282
	bne.w	Lffc32a					;$6600,$00a2		;ffc286
	addq.l	#1,a1					;$5289			;ffc28a
	cmp.b	#$57,d2					;$b43c,$0057		;ffc28c
	beq.s	Lffc2b6					;$6724			;ffc290
	cmp.b	#$46,d2					;$b43c,$0046		;ffc292
	beq.s	Lffc2ba					;$6722			;ffc296
	cmp.b	#$51,d2					;$b43c,$0051		;ffc298
	beq.s	Lffc2ba					;$671c			;ffc29c
	cmp.b	#$56,d2					;$b43c,$0056		;ffc29e
	bne.s	Lffc2c8					;$6624			;ffc2a2
	addq.b	#2,d1					;$5401			;ffc2a4
	move.b	d1,(a2)+				;$14c1			;ffc2a6
	move.b	#$de,(a2)+				;$14fc,$00de		;ffc2a8
	move.b	#$a8,(a2)+				;$14fc,$00a8		;ffc2ac
	moveq.l	#$03,d0					;$7003			;ffc2b0
	bra.w	Lffc67e					;$6000,$03ca		;ffc2b2
Lffc2b6:									;ffc2b6
	sub.b	#$2b,d1					;$923c,$002b		;ffc2b6
Lffc2ba:									;ffc2ba
	addq.b	#2,d1					;$5401			;ffc2ba
	move.b	d1,(a2)+				;$14c1			;ffc2bc
	move.b	#$a8,(a2)+				;$14fc,$00a8		;ffc2be
	moveq.l	#$02,d0					;$7002			;ffc2c2
	bra.w	Lffc67e					;$6000,$03b8		;ffc2c4
Lffc2c8:									;ffc2c8
	cmp.b	#$50,d2					;$b43c,$0050		;ffc2c8
	bne.s	Lffc2dc					;$660e			;ffc2cc
	addq.b	#1,d1					;$5201			;ffc2ce
	move.b	d1,(a2)+				;$14c1			;ffc2d0
	move.b	#$df,(a2)+				;$14fc,$00df		;ffc2d2
	moveq.l	#$02,d0					;$7002			;ffc2d6
	bra.w	Lffc67e					;$6000,$03a4		;ffc2d8
Lffc2dc:									;ffc2dc
	cmp.b	#$47,d2					;$b43c,$0047		;ffc2dc
	beq.s	Lffc2fa					;$6718			;ffc2e0
	cmp.b	#$5a,d2					;$b43c,$005a		;ffc2e2
	beq.s	Lffc2fa					;$6712			;ffc2e6
	cmp.b	#$44,d2					;$b43c,$0044		;ffc2e8
	beq.s	Lffc2fa					;$670c			;ffc2ec
	cmp.b	#$42,d2					;$b43c,$0042		;ffc2ee
	beq.s	Lffc2fa					;$6706			;ffc2f2
	cmp.b	#$4a,d2					;$b43c,$004a		;ffc2f4
	bne.s	Lffc308					;$660e			;ffc2f8
Lffc2fa:									;ffc2fa
	addq.b	#1,d1					;$5201			;ffc2fa
	move.b	d1,(a2)+				;$14c1			;ffc2fc
	move.b	#$de,(a2)+				;$14fc,$00de		;ffc2fe
	moveq.l	#$02,d0					;$7002			;ffc302
	bra.w	Lffc67e					;$6000,$0378		;ffc304
Lffc308:									;ffc308
	cmp.b	#$59,d2					;$b43c,$0059		;ffc308
	bne.s	Lffc31c					;$660e			;ffc30c
	move.b	#$b2,d1					;$123c,$00b2		;ffc30e
	cmp.b	d3,d4					;$b803			;ffc312
	beq.w	Lffbf54					;$6700,$fc3e		;ffc314
	bra.w	Lffbf50					;$6000,$fc36		;ffc318
Lffc31c:									;ffc31c
	cmp.b	#$43,d2					;$b43c,$0043		;ffc31c
	bne.s	Lffc324					;$6602			;ffc320
	addq.b	#5,d1					;$5a01			;ffc322
Lffc324:									;ffc324
	addq.b	#1,d1					;$5201			;ffc324
	bra.w	Lffbf54					;$6000,$fc2c		;ffc326
Lffc32a:									;ffc32a
	cmp.b	#$45,d4					;$b83c,$0045		;ffc32a
	bne.w	Lffc3e4					;$6600,$00b4		;ffc32e
	addq.l	#1,a1					;$5289			;ffc332
	cmp.b	#$57,d2					;$b43c,$0057		;ffc334
	beq.s	Lffc35e					;$6724			;ffc338
	cmp.b	#$46,d2					;$b43c,$0046		;ffc33a
	beq.s	Lffc364					;$6724			;ffc33e
	cmp.b	#$51,d2					;$b43c,$0051		;ffc340
	beq.s	Lffc364					;$671e			;ffc344
	cmp.b	#$56,d2					;$b43c,$0056		;ffc346
	bne.s	Lffc372					;$6626			;ffc34a
	addq.b	#2,d1					;$5401			;ffc34c
	move.b	d1,(a2)+				;$14c1			;ffc34e
	move.b	#$de,(a2)+				;$14fc,$00de		;ffc350
	move.b	#$aa,(a2)+				;$14fc,$00aa		;ffc354
	moveq.l	#$03,d0					;$7003			;ffc358
	bra.w	Lffc67e					;$6000,$0322		;ffc35a
Lffc35e:									;ffc35e
	sub.b	#$31,d1					;$923c,$0031		;ffc35e
Lffc362:									;ffc362
	addq.b	#6,d1					;$5c01			;ffc362
Lffc364:									;ffc364
	addq.b	#2,d1					;$5401			;ffc364
	move.b	d1,(a2)+				;$14c1			;ffc366
	move.b	#$aa,(a2)+				;$14fc,$00aa		;ffc368
	moveq.l	#$02,d0					;$7002			;ffc36c
	bra.w	Lffc67e					;$6000,$030e		;ffc36e
Lffc372:									;ffc372
	cmp.b	#$50,d2					;$b43c,$0050		;ffc372
	bne.s	Lffc386					;$660e			;ffc376
	addq.b	#3,d1					;$5601			;ffc378
	move.b	d1,(a2)+				;$14c1			;ffc37a
	move.b	#$df,(a2)+				;$14fc,$00df		;ffc37c
	moveq.l	#$02,d0					;$7002			;ffc380
	bra.w	Lffc67e					;$6000,$02fa		;ffc382
Lffc386:									;ffc386
	cmp.b	#$47,d2					;$b43c,$0047		;ffc386
	beq.s	Lffc39e					;$6712			;ffc38a
	cmp.b	#$5a,d2					;$b43c,$005a		;ffc38c
	beq.s	Lffc39e					;$670c			;ffc390
	cmp.b	#$44,d2					;$b43c,$0044		;ffc392
	beq.s	Lffc39e					;$6706			;ffc396
	cmp.b	#$42,d2					;$b43c,$0042		;ffc398
	bne.s	Lffc3ac					;$660e			;ffc39c
Lffc39e:									;ffc39e
	addq.b	#3,d1					;$5601			;ffc39e
	move.b	d1,(a2)+				;$14c1			;ffc3a0
	move.b	#$de,(a2)+				;$14fc,$00de		;ffc3a2
	moveq.l	#$02,d0					;$7002			;ffc3a6
	bra.w	Lffc67e					;$6000,$02d4		;ffc3a8
Lffc3ac:									;ffc3ac
	cmp.b	#$4a,d2					;$b43c,$004a		;ffc3ac
	bne.s	Lffc3c4					;$6612			;ffc3b0
	addq.b	#1,d1					;$5201			;ffc3b2
	move.b	d1,(a2)+				;$14c1			;ffc3b4
	move.b	#$de,(a2)+				;$14fc,$00de		;ffc3b6
	move.b	#$aa,(a2)+				;$14fc,$00aa		;ffc3ba
	moveq.l	#$03,d0					;$7003			;ffc3be
	bra.w	Lffc67e					;$6000,$02bc		;ffc3c0
Lffc3c4:									;ffc3c4
	cmp.b	#$59,d2					;$b43c,$0059		;ffc3c4
	bne.s	Lffc3d6					;$660c			;ffc3c8
	move.b	#$aa,d1					;$123c,$00aa		;ffc3ca
	cmp.b	d3,d4					;$b803			;ffc3ce
	bne.w	Lffbf54					;$6600,$fb82		;ffc3d0
	bra.s	Lffc362					;$608c			;ffc3d4
Lffc3d6:									;ffc3d6
	cmp.b	#$43,d2					;$b43c,$0043		;ffc3d6
	bne.s	Lffc3de					;$6602			;ffc3da
	addq.b	#5,d1					;$5a01			;ffc3dc
Lffc3de:									;ffc3de
	addq.b	#3,d1					;$5601			;ffc3de
	bra.w	Lffbf54					;$6000,$fb72		;ffc3e0
Lffc3e4:									;ffc3e4
	cmp.b	#$48,d4					;$b83c,$0048		;ffc3e4
	bne.w	Lffc492					;$6600,$00a8		;ffc3e8
	cmp.b	#$4e,d2					;$b43c,$004e		;ffc3ec
	beq.w	Lffc488					;$6700,$0096		;ffc3f0
	cmp.b	#$53,d2					;$b43c,$0053		;ffc3f4
	beq.s	Lffc412					;$6718			;ffc3f8
	cmp.b	#$44,d2					;$b43c,$0044		;ffc3fa
	beq.s	Lffc410					;$6710			;ffc3fe
	cmp.b	#$54,d2					;$b43c,$0054		;ffc400
	beq.s	Lffc410					;$670a			;ffc404
	cmp.b	#$43,d2					;$b43c,$0043		;ffc406
	bne.w	Lffc676					;$6600,$026a		;ffc40a
	addq.b	#8,d1					;$5001			;ffc40e
Lffc410:									;ffc410
	addq.b	#2,d1					;$5401			;ffc410
Lffc412:									;ffc412
	addq.b	#1,d1					;$5201			;ffc412
	move.b	($0001,a1),d5				;$1a29,$0001		;ffc414
	beq.w	Lffc686					;$6700,$026c		;ffc418
	cmp.b	#$61,d5					;$ba3c,$0061		;ffc41c
	bcs.s	Lffc42c					;$650a			;ffc420
	cmp.b	#$7a,d5					;$ba3c,$007a		;ffc422
	bhi.s	Lffc42c					;$6204			;ffc426
	and.b	#$df,d5					;$ca3c,$00df		;ffc428
Lffc42c:									;ffc42c
	move.b	#$a8,d6					;$1c3c,$00a8		;ffc42c
	cmp.b	#$49,d5					;$ba3c,$0049		;ffc430
	beq.s	Lffc472					;$673c			;ffc434
	addq.b	#2,d6					;$5406			;ffc436
	cmp.b	#$45,d5					;$ba3c,$0045		;ffc438
	beq.s	Lffc458					;$671a			;ffc43c
	addq.b	#2,d6					;$5406			;ffc43e
	cmp.b	#$41,d5					;$ba3c,$0041		;ffc440
	beq.s	Lffc458					;$6712			;ffc444
	addq.b	#1,d6					;$5206			;ffc446
	cmp.b	#$55,d5					;$ba3c,$0055		;ffc448
	beq.s	Lffc458					;$670a			;ffc44c
	addq.b	#1,d6					;$5206			;ffc44e
	cmp.b	#$4f,d5					;$ba3c,$004f		;ffc450
	bne.w	Lffc676					;$6600,$0220		;ffc454
Lffc458:									;ffc458
	addq.l	#2,a1					;$5489			;ffc458
	move.b	d1,(a2)+				;$14c1			;ffc45a
	moveq.l	#$01,d0					;$7001			;ffc45c
	cmp.b	#$44,d2					;$b43c,$0044		;ffc45e
	bne.s	Lffc46a					;$6606			;ffc462
Lffc464:									;ffc464
	addq.l	#1,d0					;$5280			;ffc464
	move.b	#$de,(a2)+				;$14fc,$00de		;ffc466
Lffc46a:									;ffc46a
	addq.l	#1,d0					;$5280			;ffc46a
	move.b	d6,(a2)+				;$14c6			;ffc46c
	bra.w	Lffc67e					;$6000,$020e		;ffc46e
Lffc472:									;ffc472
	addq.l	#2,a1					;$5489			;ffc472
	move.b	d1,(a2)+				;$14c1			;ffc474
	moveq.l	#$01,d0					;$7001			;ffc476
	cmp.b	#$44,d2					;$b43c,$0044		;ffc478
	beq.s	Lffc464					;$67e6			;ffc47c
	cmp.b	#$54,d2					;$b43c,$0054		;ffc47e
	beq.s	Lffc46a					;$67e6			;ffc482
	bra.w	Lffc67e					;$6000,$01f8		;ffc484
Lffc488:									;ffc488
	move.b	#$dd,(a2)+				;$14fc,$00dd		;ffc488
	moveq.l	#$01,d0					;$7001			;ffc48c
	bra.w	Lffc67e					;$6000,$01ee		;ffc48e
Lffc492:									;ffc492
	cmp.b	#$59,d4					;$b83c,$0059		;ffc492
	bne.w	Lffc564					;$6600,$00cc		;ffc496
	move.b	#$df,d6					;$1c3c,$00df		;ffc49a
	cmp.b	#$50,d2					;$b43c,$0050		;ffc49e
	beq.s	Lffc50a					;$6766			;ffc4a2
	subq.b	#1,d6					;$5306			;ffc4a4
	cmp.b	#$47,d2					;$b43c,$0047		;ffc4a6
	beq.s	Lffc50a					;$675e			;ffc4aa
	cmp.b	#$5a,d2					;$b43c,$005a		;ffc4ac
	beq.s	Lffc50a					;$6758			;ffc4b0
	cmp.b	#$4a,d2					;$b43c,$004a		;ffc4b2
	beq.s	Lffc50a					;$6752			;ffc4b6
	cmp.b	#$44,d2					;$b43c,$0044		;ffc4b8
	beq.s	Lffc50a					;$674c			;ffc4bc
	cmp.b	#$42,d2					;$b43c,$0042		;ffc4be
	beq.s	Lffc50a					;$6746			;ffc4c2
	clr.b	d6					;$4206			;ffc4c4
	cmp.b	#$4b,d2					;$b43c,$004b		;ffc4c6
	beq.s	Lffc50a					;$673e			;ffc4ca
	cmp.b	#$53,d2					;$b43c,$0053		;ffc4cc
	beq.s	Lffc50a					;$6738			;ffc4d0
	cmp.b	#$54,d2					;$b43c,$0054		;ffc4d2
	beq.s	Lffc50a					;$6732			;ffc4d6
	cmp.b	#$4e,d2					;$b43c,$004e		;ffc4d8
	beq.s	Lffc50a					;$672c			;ffc4dc
	cmp.b	#$48,d2					;$b43c,$0048		;ffc4de
	beq.s	Lffc50a					;$6726			;ffc4e2
	cmp.b	#$4d,d2					;$b43c,$004d		;ffc4e4
	beq.s	Lffc50a					;$6720			;ffc4e8
	cmp.b	#$52,d2					;$b43c,$0052		;ffc4ea
	beq.s	Lffc50a					;$671a			;ffc4ee
	cmp.b	#$4c,d2					;$b43c,$004c		;ffc4f0
	beq.s	Lffc50a					;$6714			;ffc4f4
	cmp.b	#$46,d2					;$b43c,$0046		;ffc4f6
	beq.s	Lffc508					;$670c			;ffc4fa
	cmp.b	#$43,d2					;$b43c,$0043		;ffc4fc
	bne.w	Lffc676					;$6600,$0174		;ffc500
	add.b	#$09,d1					;$d23c,$0009		;ffc504
Lffc508:									;ffc508
	addq.b	#1,d1					;$5201			;ffc508
Lffc50a:									;ffc50a
	addq.b	#1,d1					;$5201			;ffc50a
	move.b	($0001,a1),d5				;$1a29,$0001		;ffc50c
	beq.w	Lffc686					;$6700,$0174		;ffc510
	cmp.b	#$61,d5					;$ba3c,$0061		;ffc514
	bcs.s	Lffc524					;$650a			;ffc518
	cmp.b	#$7a,d5					;$ba3c,$007a		;ffc51a
	bhi.s	Lffc524					;$6204			;ffc51e
	and.b	#$df,d5					;$ca3c,$00df		;ffc520
Lffc524:									;ffc524
	move.b	#$a8,d7					;$1e3c,$00a8		;ffc524
	cmp.b	#$49,d5					;$ba3c,$0049		;ffc528
	beq.s	Lffc550					;$6722			;ffc52c
	addq.b	#2,d7					;$5407			;ffc52e
	cmp.b	#$45,d5					;$ba3c,$0045		;ffc530
	beq.s	Lffc550					;$671a			;ffc534
	addq.b	#2,d7					;$5407			;ffc536
	cmp.b	#$41,d5					;$ba3c,$0041		;ffc538
	beq.s	Lffc550					;$6712			;ffc53c
	addq.b	#1,d7					;$5207			;ffc53e
	cmp.b	#$55,d5					;$ba3c,$0055		;ffc540
	beq.s	Lffc550					;$670a			;ffc544
	addq.b	#1,d7					;$5207			;ffc546
	cmp.b	#$4f,d5					;$ba3c,$004f		;ffc548
	bne.w	Lffc676					;$6600,$0128		;ffc54c
Lffc550:									;ffc550
	move.b	d1,(a2)+				;$14c1			;ffc550
	moveq.l	#$02,d0					;$7002			;ffc552
	tst.b	d6					;$4a06			;ffc554
	beq.s	Lffc55c					;$6704			;ffc556
	move.b	d6,(a2)+				;$14c6			;ffc558
	addq.l	#1,d0					;$5280			;ffc55a
Lffc55c:									;ffc55c
	move.b	d7,(a2)+				;$14c7			;ffc55c
	addq.l	#2,a1					;$5489			;ffc55e
	bra.w	Lffc67e					;$6000,$011c		;ffc560
Lffc564:									;ffc564
	cmp.b	#$57,d4					;$b83c,$0057		;ffc564
	bne.w	Lffc604					;$6600,$009a		;ffc568
	move.b	#$df,d6					;$1c3c,$00df		;ffc56c
	cmp.b	#$50,d2					;$b43c,$0050		;ffc570
	beq.s	Lffc5ac					;$6736			;ffc574
	subq.b	#1,d6					;$5306			;ffc576
	cmp.b	#$47,d2					;$b43c,$0047		;ffc578
	beq.s	Lffc5ac					;$672e			;ffc57c
	cmp.b	#$5a,d2					;$b43c,$005a		;ffc57e
	beq.s	Lffc5ac					;$6728			;ffc582
	cmp.b	#$44,d2					;$b43c,$0044		;ffc584
	beq.s	Lffc5ac					;$6722			;ffc588
	cmp.b	#$42,d2					;$b43c,$0042		;ffc58a
	beq.s	Lffc5ac					;$671c			;ffc58e
	clr.b	d6					;$4206			;ffc590
	cmp.b	#$4b,d2					;$b43c,$004b		;ffc592
	beq.s	Lffc5ac					;$6714			;ffc596
	cmp.b	#$53,d2					;$b43c,$0053		;ffc598
	beq.s	Lffc5ac					;$670e			;ffc59c
	cmp.b	#$54,d2					;$b43c,$0054		;ffc59e
	beq.s	Lffc5ac					;$6708			;ffc5a2
	cmp.b	#$48,d2					;$b43c,$0048		;ffc5a4
	bne.w	Lffc676					;$6600,$00cc		;ffc5a8
Lffc5ac:									;ffc5ac
	addq.b	#2,d1					;$5401			;ffc5ac
	move.b	($0001,a1),d5				;$1a29,$0001		;ffc5ae
	beq.w	Lffc686					;$6700,$00d2		;ffc5b2
	cmp.b	#$61,d5					;$ba3c,$0061		;ffc5b6
	bcs.s	Lffc5c6					;$650a			;ffc5ba
	cmp.b	#$7a,d5					;$ba3c,$007a		;ffc5bc
	bhi.s	Lffc5c6					;$6204			;ffc5c0
	and.b	#$df,d5					;$ca3c,$00df		;ffc5c2
Lffc5c6:									;ffc5c6
	move.b	#$a7,d7					;$1e3c,$00a7		;ffc5c6
	cmp.b	#$41,d5					;$ba3c,$0041		;ffc5ca
	beq.s	Lffc5f2					;$6722			;ffc5ce
	addq.b	#1,d7					;$5207			;ffc5d0
	cmp.b	#$49,d5					;$ba3c,$0049		;ffc5d2
	beq.s	Lffc5f2					;$671a			;ffc5d6
	addq.b	#1,d7					;$5207			;ffc5d8
	cmp.b	#$55,d5					;$ba3c,$0055		;ffc5da
	beq.s	Lffc5f2					;$6712			;ffc5de
	addq.b	#1,d7					;$5207			;ffc5e0
	cmp.b	#$45,d5					;$ba3c,$0045		;ffc5e2
	beq.s	Lffc5f2					;$670a			;ffc5e6
	addq.b	#1,d7					;$5207			;ffc5e8
	cmp.b	#$4f,d5					;$ba3c,$004f		;ffc5ea
	bne.w	Lffc676					;$6600,$0086		;ffc5ee
Lffc5f2:									;ffc5f2
	move.b	d1,(a2)+				;$14c1			;ffc5f2
	moveq.l	#$02,d0					;$7002			;ffc5f4
	tst.b	d6					;$4a06			;ffc5f6
	beq.s	Lffc5fe					;$6704			;ffc5f8
	move.b	d6,(a2)+				;$14c6			;ffc5fa
	addq.l	#1,d0					;$5280			;ffc5fc
Lffc5fe:									;ffc5fe
	move.b	d7,(a2)+				;$14c7			;ffc5fe
	addq.l	#2,a1					;$5489			;ffc600
	bra.s	Lffc67e					;$607a			;ffc602
Lffc604:									;ffc604
	cmp.b	#$53,d4					;$b83c,$0053		;ffc604
	bne.s	Lffc66e					;$6664			;ffc608
	cmp.b	#$54,d2					;$b43c,$0054		;ffc60a
	bne.s	Lffc66e					;$665e			;ffc60e
	move.b	($0001,a1),d3				;$1629,$0001		;ffc610
	beq.s	Lffc686					;$6770			;ffc614
	move.b	d3,d5					;$1a03			;ffc616
	cmp.b	#$61,d5					;$ba3c,$0061		;ffc618
	bcs.s	Lffc628					;$650a			;ffc61c
	cmp.b	#$7a,d5					;$ba3c,$007a		;ffc61e
	bhi.s	Lffc628					;$6204			;ffc622
	and.b	#$df,d5					;$ca3c,$00df		;ffc624
Lffc628:									;ffc628
	cmp.b	#$55,d5					;$ba3c,$0055		;ffc628
	beq.s	Lffc65c					;$672e			;ffc62c
	move.b	#$a7,d6					;$1c3c,$00a7		;ffc62e
	cmp.b	#$41,d5					;$ba3c,$0041		;ffc632
	beq.s	Lffc650					;$6718			;ffc636
	addq.b	#1,d6					;$5206			;ffc638
	cmp.b	#$49,d5					;$ba3c,$0049		;ffc63a
	beq.s	Lffc650					;$6710			;ffc63e
	addq.b	#2,d6					;$5406			;ffc640
	cmp.b	#$45,d5					;$ba3c,$0045		;ffc642
	beq.s	Lffc650					;$6708			;ffc646
	addq.b	#1,d6					;$5206			;ffc648
	cmp.b	#$4f,d5					;$ba3c,$004f		;ffc64a
	bne.s	Lffc676					;$6626			;ffc64e
Lffc650:									;ffc650
	addq.b	#2,d1					;$5401			;ffc650
	move.b	d1,(a2)+				;$14c1			;ffc652
	move.b	d6,(a2)+				;$14c6			;ffc654
	addq.l	#2,a1					;$5489			;ffc656
	moveq.l	#$02,d0					;$7002			;ffc658
	bra.s	Lffc67e					;$6022			;ffc65a
Lffc65c:									;ffc65c
	addq.b	#2,d1					;$5401			;ffc65c
	cmp.b	d3,d5					;$ba03			;ffc65e
	beq.s	Lffc666					;$6704			;ffc660
	sub.b	#$13,d1					;$923c,$0013		;ffc662
Lffc666:									;ffc666
	move.b	d1,(a2)+				;$14c1			;ffc666
	addq.l	#2,a1					;$5489			;ffc668
	moveq.l	#$01,d0					;$7001			;ffc66a
	bra.s	Lffc67e					;$6010			;ffc66c
Lffc66e:									;ffc66e
	cmp.b	#$4e,d2					;$b43c,$004e		;ffc66e
	beq.w	Lffc488					;$6700,$fe14		;ffc672
Lffc676:									;ffc676
	clr.b	(a3)					;$4213			;ffc676
	clr.b	(a4)					;$4214			;ffc678
	moveq.l	#$ff,d0					;$70ff			;ffc67a
	bra.s	Lffc688					;$600a			;ffc67c
Lffc67e:									;ffc67e
	clr.b	(a2)					;$4212			;ffc67e
Lffc680:									;ffc680
	move.b	(a1)+,(a3)+				;$16d9			;ffc680
	bne.s	Lffc680					;$66fc			;ffc682
	bra.s	Lffc688					;$6002			;ffc684
Lffc686:									;ffc686
	clr.l	d0					;$4280			;ffc686
Lffc688:									;ffc688
	movem.l	(a7)+,d1-d7/a1-a4			;$4cdf,$1efe		;ffc688
	rts						;$4e75			;ffc68c

Call_HANJOB:									;ffc68e
	move.b	(-$0002,a1),d0				;$1029,$fffe		;ffc68e
	rol.w	#8,d0					;$e158			;ffc692
	move.b	(-$0001,a1),d0				;$1029,$ffff		;ffc694
	cmp.w	#$829f,d0				;$b07c,$829f		;ffc698
	bcs.s	Lffc6c2					;$6524			;ffc69c
	cmp.w	#$82fd,d0				;$b07c,$82fd		;ffc69e
	bcs.s	Lffc6b6					;$6512			;ffc6a2
	cmp.w	#$839f,d0				;$b07c,$839f		;ffc6a4
	bcc.s	Lffc6c2					;$6418			;ffc6a8
	cmp.b	#$7f,d0					;$b03c,$007f		;ffc6aa
	bcs.s	Lffc6b2					;$6502			;ffc6ae
	subq.b	#1,d0					;$5300			;ffc6b0
Lffc6b2:									;ffc6b2
	add.b	#$5f,d0					;$d03c,$005f		;ffc6b2
Lffc6b6:									;ffc6b6
	bsr.s	Lffc726					;$616e			;ffc6b6
	bne.s	Lffc6c2					;$6608			;ffc6b8
	addq.b	#2,(-$0001,a1)				;$5429,$ffff		;ffc6ba
	clr.l	d0					;$4280			;ffc6be
	rts						;$4e75			;ffc6c0

Lffc6c2:									;ffc6c2
	move.b	#$81,(a1)+				;$12fc,$0081		;ffc6c2
	move.b	#$4b,(a1)+				;$12fc,$004b		;ffc6c6
	clr.b	(a1)					;$4211			;ffc6ca
	moveq.l	#$02,d0					;$7002			;ffc6cc
	rts						;$4e75			;ffc6ce

Call_DAKJOB:									;ffc6d0
	move.b	(-$0002,a1),d0				;$1029,$fffe		;ffc6d0
	rol.w	#8,d0					;$e158			;ffc6d4
	move.b	(-$0001,a1),d0				;$1029,$ffff		;ffc6d6
	cmp.w	#$829f,d0				;$b07c,$829f		;ffc6da
	bcs.s	Lffc70e					;$652e			;ffc6de
	cmp.w	#$82fd,d0				;$b07c,$82fd		;ffc6e0
	bcs.s	Lffc6fe					;$6518			;ffc6e4
	cmp.w	#$839f,d0				;$b07c,$839f		;ffc6e6
	bcc.s	Lffc70e					;$6422			;ffc6ea
	cmp.b	#$7f,d0					;$b03c,$007f		;ffc6ec
	bcs.s	Lffc6f4					;$6502			;ffc6f0
	subq.b	#1,d0					;$5300			;ffc6f2
Lffc6f4:									;ffc6f4
	add.b	#$5f,d0					;$d03c,$005f		;ffc6f4
	cmp.b	#$a4,d0					;$b03c,$00a4		;ffc6f8
	beq.s	Lffc71c					;$671e			;ffc6fc
Lffc6fe:									;ffc6fe
	bsr.s	Lffc740					;$6140			;ffc6fe
	beq.s	Lffc706					;$6704			;ffc700
	bsr.s	Lffc726					;$6122			;ffc702
	bne.s	Lffc70e					;$6608			;ffc704
Lffc706:									;ffc706
	addq.b	#1,(-$0001,a1)				;$5229,$ffff		;ffc706
	clr.l	d0					;$4280			;ffc70a
	rts						;$4e75			;ffc70c

Lffc70e:									;ffc70e
	move.b	#$81,(a1)+				;$12fc,$0081		;ffc70e
	move.b	#$4a,(a1)+				;$12fc,$004a		;ffc712
	clr.b	(a1)					;$4211			;ffc716
	moveq.l	#$02,d0					;$7002			;ffc718
	rts						;$4e75			;ffc71a

Lffc71c:									;ffc71c
	move.b	#$94,(-$0001,a1)			;$137c,$0094,$ffff	;ffc71c
	clr.l	d0					;$4280			;ffc722
	rts						;$4e75			;ffc724

Lffc726:									;ffc726
	movem.l	d1,-(a7)				;$48e7,$4000		;ffc726
	lea.l	(Lffc902,pc),a0				;$41fa,$01d6		;ffc72a
	moveq.l	#$04,d1					;$7204			;ffc72e
Lffc730:									;ffc730
	cmp.b	(a0)+,d0				;$b018			;ffc730
	beq.s	Lffc73a					;$6706			;ffc732
	dbra.w	d1,Lffc730				;$51c9,$fffa		;ffc734
	tst.w	d1					;$4a41			;ffc738
Lffc73a:									;ffc73a
	movem.l	(a7)+,d1				;$4cdf,$0002		;ffc73a
	rts						;$4e75			;ffc73e

Lffc740:									;ffc740
	movem.l	d1,-(a7)				;$48e7,$4000		;ffc740
	lea.l	(Lffc8ee,pc),a0				;$41fa,$01a8		;ffc744
	moveq.l	#$0e,d1					;$720e			;ffc748
Lffc74a:									;ffc74a
	cmp.b	(a0)+,d0				;$b018			;ffc74a
	beq.s	Lffc754					;$6706			;ffc74c
	dbra.w	d1,Lffc74a				;$51c9,$fffa		;ffc74e
	tst.w	d1					;$4a41			;ffc752
Lffc754:									;ffc754
	movem.l	(a7)+,d1				;$4cdf,$0002		;ffc754
	rts						;$4e75			;ffc758

Call_SYS_STAT:									;ffc75a
	movem.l	d1-d2,-(a7)				;$48e7,$6000		;ffc75a
	moveq.l	#$ff,d0					;$70ff			;ffc75e
	cmp.w	#$0004,d1				;$b27c,$0004		;ffc760
	bhi.s	Lffc77c					;$6216			;ffc764
	add.w	d1,d1					;$d241			;ffc766
	beq.s	Lffc772					;$6708			;ffc768
	cmpi.b	#$01,($0cbc)				;$0c38,$0001,$0cbc	;ffc76a
	bls.s	Lffc77c					;$630a			;ffc770
Lffc772:									;ffc772
	moveq.l	#$00,d0					;$7000			;ffc772
	move.w	(Lffc782,pc,d1.w),d1			;$323b,$100c		;ffc774
	jsr	(Lffc782,pc,d1.w)			;$4ebb,$1008		;ffc778
Lffc77c:									;ffc77c
	movem.l	(a7)+,d1-d2				;$4cdf,$0006		;ffc77c
	rts						;$4e75			;ffc780

Lffc782:									;ffc782
	.dc.b	$00,$58,$00,$0a,$00,$1c,$00,$26					;ffc782
	.dc.b	$00,$3c								;ffc78a
Lffc78c:									;ffc78c
	movec.l	cacr,d1					;$4e7a,$1002		;ffc78c
	ror.l	#1,d1					;$e299			;ffc790
	lsr.w	#7,d1					;$ee49			;ffc792
	rol.l	#1,d1					;$e399			;ffc794
	and.w	#$0003,d1				;$c27c,$0003		;ffc796
	move.w	d1,d0					;$3001			;ffc79a
	rts						;$4e75			;ffc79c

Lffc79e:									;ffc79e
	move.b	($00ed0090),d2				;$1439,$00ed,$0090	;ffc79e
	bsr.s	Lffc7be					;$6118			;ffc7a4
	rts						;$4e75			;ffc7a6

Lffc7a8:									;ffc7a8
	movec.l	cacr,d0					;$4e7a,$0002		;ffc7a8
	or.w	#$0808,d0				;$807c,$0808		;ffc7ac
	movec.l	d0,cacr					;$4e7b,$0002		;ffc7b0
	and.w	#$f7f7,d0				;$c07c,$f7f7		;ffc7b4
	movec.l	d0,cacr					;$4e7b,$0002		;ffc7b8
	rts						;$4e75			;ffc7bc

Lffc7be:									;ffc7be
	bsr.s	Lffc78c					;$61cc			;ffc7be
	and.w	#$0003,d2				;$c47c,$0003		;ffc7c0
	moveq.l	#$00,d1					;$7200			;ffc7c4
	add.w	d2,d2					;$d442			;ffc7c6
	move.w	(Lffc7d2,pc,d2.w),d1			;$323b,$2008		;ffc7c8
	movec.l	d1,cacr					;$4e7b,$1002		;ffc7cc
	rts						;$4e75			;ffc7d0

Lffc7d2:									;ffc7d2
	.dc.w	$0000,$0001,$2100,$2101						;ffc7d2
Lffc7da:									;ffc7da
	move.w	($0cb8),d0				;$3038,$0cb8		;ffc7da
	add.l	d0,d0					;$d080			;ffc7de
	move.l	d0,d1					;$2200			;ffc7e0
	add.l	d0,d0					;$d080			;ffc7e2
	add.l	d1,d0					;$d081			;ffc7e4
	cmpi.w	#$0001,($0cbc)				;$0c78,$0001,$0cbc	;ffc7e6
	bhi.s	Lffc7f0					;$6202			;ffc7ec
	add.l	d0,d0					;$d080			;ffc7ee
Lffc7f0:									;ffc7f0
	add.l	#$00000032,d0				;$d0bc,$0000,$0032	;ffc7f0
	divu.w	#$0064,d0				;$80fc,$0064		;ffc7f6
	swap.w	d0					;$4840			;ffc7fa
	clr.w	d0					;$4240			;ffc7fc
	tst.b	($0cbd)					;$4a38,$0cbd		;ffc7fe
	beq.s	Lffc808					;$6704			;ffc802
	bset.l	#$0f,d0					;$08c0,$000f		;ffc804
Lffc808:									;ffc808
	tst.b	($0cbe)					;$4a38,$0cbe		;ffc808
	beq.s	Lffc812					;$6704			;ffc80c
	bset.l	#$0e,d0					;$08c0,$000e		;ffc80e
Lffc812:									;ffc812
	move.b	($0cbc),d0				;$1038,$0cbc		;ffc812
	rts						;$4e75			;ffc816

Call_B_CONMOD:									;ffc818
	jsr	(Call_B_CUROFF)				;$4eb9,$00ff,$79ea	;ffc818
	lea.l	($0d0c),a0				;$41f8,$0d0c		;ffc81e
	cmp.w	#$0001,d1				;$b27c,$0001		;ffc822
	bmi.s	Lffc85e					;$6b36			;ffc826
	beq.s	Lffc862					;$6738			;ffc828
	cmp.w	#$0002,d1				;$b27c,$0002		;ffc82a
	beq.s	Lffc868					;$6738			;ffc82e
	cmp.w	#$0010,d1				;$b27c,$0010		;ffc830
	beq.s	Lffc850					;$671a			;ffc834
	cmp.w	#$0012,d1				;$b27c,$0012		;ffc836
	ble.s	Lffc844					;$6f08			;ffc83a
Lffc83c:									;ffc83c
	jsr	(Call_B_CURON)				;$4eb9,$00ff,$79ce	;ffc83c
	rts						;$4e75			;ffc842

Lffc844:									;ffc844
	seq.b	d1					;$57c1			;ffc844
	ext.w	d1					;$4881			;ffc846
	lea.l	($0d08),a0				;$41f8,$0d08		;ffc848
	move.w	d1,(a0)					;$3081			;ffc84c
	bra.s	Lffc83c					;$60ec			;ffc84e
Lffc850:									;ffc850
	move.w	d2,d0					;$3002			;ffc850
	and.w	#$0003,d0				;$c07c,$0003		;ffc852
	lea.l	($0d0a),a0				;$41f8,$0d0a		;ffc856
	move.w	d0,(a0)					;$3080			;ffc85a
	bra.s	Lffc83c					;$60de			;ffc85c
Lffc85e:									;ffc85e
	clr.w	(a0)					;$4250			;ffc85e
	bra.s	Lffc83c					;$60da			;ffc860
Lffc862:									;ffc862
	move.w	#$ffff,(a0)				;$30bc,$ffff		;ffc862
	bra.s	Lffc83c					;$60d4			;ffc866
Lffc868:									;ffc868
	addq.l	#2,a0					;$5488			;ffc868
	move.w	d2,($0002,a0)				;$3142,$0002		;ffc86a
	move.l	d2,d0					;$2002			;ffc86e
	swap.w	d0					;$4840			;ffc870
	and.w	#$000f,d0				;$c07c,$000f		;ffc872
	add.w	d0,d0					;$d040			;ffc876
	add.w	d0,d0					;$d040			;ffc878
	move.w	d0,(a0)					;$3080			;ffc87a
	bra.s	Lffc83c					;$60be			;ffc87c
Call_OS_CURON:									;ffc87e
	move.w	($09ba),($09bc)				;$31f8,$09ba,$09bc	;ffc87e
	move.w	sr,-(a7)				;$40e7			;ffc884
	ori.w	#$0700,sr				;$007c,$0700		;ffc886
	tst.b	($0993)					;$4a38,$0993		;ffc88a
	bne.s	Lffc896					;$6606			;ffc88e
	tst.b	($0991)					;$4a38,$0991		;ffc890
	bne.s	Lffc8a0					;$660a			;ffc894
Lffc896:									;ffc896
	jsr	(Lff1db0)				;$4eb9,$00ff,$1db0	;ffc896
	st.b	($0991)					;$50f8,$0991		;ffc89c
Lffc8a0:									;ffc8a0
	st.b	($0992)					;$50f8,$0992		;ffc8a0
	sf.b	($0993)					;$51f8,$0993		;ffc8a4
	move.w	(a7)+,sr				;$46df			;ffc8a8
	rts						;$4e75			;ffc8aa

Call_OS_CUROF:									;ffc8ac
	jsr	(Call_B_CUROFF)				;$4eb9,$00ff,$79ea	;ffc8ac
	st.b	($0993)					;$50f8,$0993		;ffc8b2
	rts						;$4e75			;ffc8b6

Lffc8b8:									;ffc8b8
	.dc.b	'@Ih柏燈fij本C|D^FGメЗ洋熟OQMobp`BuvAE'			;ffc8b8
Lffc8de:									;ffc8de
	.dc.b	$f0,$9f,$a1,$a3,$a5,$a7,$e1,$e3					;ffc8de
	.dc.b	$e5,$c1,$7e,$a0,$a2,$a4,$a6,$a8					;ffc8e6
Lffc8ee:									;ffc8ee
	.dc.b	'ｩｫｭｯｱｳｵｷｹｻｽｿﾂﾄﾆﾈﾉﾊﾋﾌ'						;ffc8ee
Lffc902:									;ffc902
	.dc.b	'ﾍﾐﾓﾖﾙﾜﾝﾞﾟ珞蓙鉅鳰',$f1					;ffc902
Call_SP_INIT:									;ffc916
	bsr.w	Lffcc9e					;$6100,$0386		;ffc916
	movem.l	d1-d2/a1,-(a7)				;$48e7,$6040		;ffc91a
	lea.l	($00eb0000),a0				;$41f9,$00eb,$0000	;ffc91e
	move.w	#$007f,d0				;$303c,$007f		;ffc924
	moveq.l	#$00,d1					;$7200			;ffc928
Lffc92a:									;ffc92a
	move.l	d1,(a0)+				;$20c1			;ffc92a
	move.l	d1,(a0)+				;$20c1			;ffc92c
	dbra.w	d0,Lffc92a				;$51c8,$fffa		;ffc92e
	lea.l	($00eb0800),a0				;$41f9,$00eb,$0800	;ffc932
	move.l	d1,(a0)+				;$20c1			;ffc938
	move.l	d1,(a0)+				;$20c1			;ffc93a
	move.w	d1,(a0)					;$3081			;ffc93c
	lea.l	($00eb8000),a0				;$41f9,$00eb,$8000	;ffc93e
	move.l	#$00ec0000,d2				;$243c,$00ec,$0000	;ffc944
Lffc94a:									;ffc94a
	move.l	d1,(a0)+				;$20c1			;ffc94a
	cmpa.l	d2,a0					;$b1c2			;ffc94c
	blt.s	Lffc94a					;$6dfa			;ffc94e
	lea.l	($00e82220),a0				;$41f9,$00e8,$2220	;ffc950
	moveq.l	#$0e,d2					;$740e			;ffc956
	bsr.w	Lffcc88					;$6100,$032e		;ffc958
Lffc95c:									;ffc95c
	lea.l	(Lffc974,pc),a1				;$43fa,$0016		;ffc95c
	moveq.l	#$0f,d1					;$720f			;ffc960
Lffc962:									;ffc962
	move.w	(a1)+,(a0)+				;$30d9			;ffc962
	dbra.w	d1,Lffc962				;$51c9,$fffc		;ffc964
	dbra.w	d2,Lffc95c				;$51ca,$fff2		;ffc968
	moveq.l	#$00,d0					;$7000			;ffc96c
	movem.l	(a7)+,d1-d2/a1				;$4cdf,$0206		;ffc96e
	rts						;$4e75			;ffc972

Lffc974:									;ffc974
	.dc.b	$00,$00,$52,$94,$00,$20,$00,$3e					;ffc974
	.dc.b	$04,$00,$07,$c0,$04,$20,$07,$fe					;ffc97c
	.dc.b	$80,$00,$f8,$00,$80,$20,$f8,$3e					;ffc984
	.dc.b	$84,$00,$ff,$c0,$ad,$6a,$ff,$fe					;ffc98c
Call_SP_ON:									;ffc994
	bsr.w	Lffcc9e					;$6100,$0308		;ffc994
	ori.w	#$0040,($00e82600)			;$0079,$0040,$00e8,$2600	;ffc998
	ori.w	#$0200,($00eb0808)			;$0079,$0200,$00eb,$0808	;ffc9a0
	rts						;$4e75			;ffc9a8

Call_SP_OFF:									;ffc9aa
	andi.w	#$ffbf,($00e82600)			;$0279,$ffbf,$00e8,$2600	;ffc9aa
	andi.w	#$fdff,($00eb0808)			;$0279,$fdff,$00eb,$0808	;ffc9b2
	rts						;$4e75			;ffc9ba

Call_SP_CGCLR:									;ffc9bc
	bsr.w	Lffcc9e					;$6100,$02e0		;ffc9bc
	move.l	d1,-(a7)				;$2f01			;ffc9c0
	andi.l	#$000000ff,d1				;$0281,$0000,$00ff	;ffc9c2
	lea.l	($00eb8000),a0				;$41f9,$00eb,$8000	;ffc9c8
	lsl.w	#7,d1					;$ef49			;ffc9ce
	adda.w	d1,a0					;$d0c1			;ffc9d0
	moveq.l	#$3f,d0					;$703f			;ffc9d2
	moveq.l	#$00,d1					;$7200			;ffc9d4
Lffc9d6:									;ffc9d6
	move.w	d1,(a0)+				;$30c1			;ffc9d6
	dbra.w	d0,Lffc9d6				;$51c8,$fffc		;ffc9d8
	moveq.l	#$00,d0					;$7000			;ffc9dc
	move.l	(a7)+,d1				;$221f			;ffc9de
	rts						;$4e75			;ffc9e0

Call_SP_DEFCG:									;ffc9e2
	bsr.w	Lffcc9e					;$6100,$02ba		;ffc9e2
	movem.l	d1/a1,-(a7)				;$48e7,$4040		;ffc9e6
	andi.l	#$000000ff,d1				;$0281,$0000,$00ff	;ffc9ea
	tst.l	d2					;$4a82			;ffc9f0
	bne.s	Lffca08					;$6614			;ffc9f2
	lea.l	($00eb8000),a0				;$41f9,$00eb,$8000	;ffc9f4
	lsl.w	#5,d1					;$eb49			;ffc9fa
	adda.w	d1,a0					;$d0c1			;ffc9fc
	moveq.l	#$0f,d0					;$700f			;ffc9fe
Lffca00:									;ffca00
	move.w	(a1)+,(a0)+				;$30d9			;ffca00
	dbra.w	d0,Lffca00				;$51c8,$fffc		;ffca02
	bra.s	Lffca1a					;$6012			;ffca06
Lffca08:									;ffca08
	lea.l	($00eb8000),a0				;$41f9,$00eb,$8000	;ffca08
	lsl.w	#7,d1					;$ef49			;ffca0e
	adda.w	d1,a0					;$d0c1			;ffca10
	moveq.l	#$3f,d0					;$703f			;ffca12
Lffca14:									;ffca14
	move.w	(a1)+,(a0)+				;$30d9			;ffca14
	dbra.w	d0,Lffca14				;$51c8,$fffc		;ffca16
Lffca1a:									;ffca1a
	movem.l	(a7)+,d1/a1				;$4cdf,$0202		;ffca1a
	moveq.l	#$00,d0					;$7000			;ffca1e
	rts						;$4e75			;ffca20

Call_SP_GTPCG:									;ffca22
	bsr.w	Lffcc9e					;$6100,$027a		;ffca22
	movem.l	d1/a1,-(a7)				;$48e7,$4040		;ffca26
	andi.l	#$000000ff,d1				;$0281,$0000,$00ff	;ffca2a
	tst.l	d2					;$4a82			;ffca30
	bne.s	Lffca48					;$6614			;ffca32
	lea.l	($00eb8000),a0				;$41f9,$00eb,$8000	;ffca34
	lsl.w	#5,d1					;$eb49			;ffca3a
	adda.w	d1,a0					;$d0c1			;ffca3c
	moveq.l	#$0f,d0					;$700f			;ffca3e
Lffca40:									;ffca40
	move.w	(a0)+,(a1)+				;$32d8			;ffca40
	dbra.w	d0,Lffca40				;$51c8,$fffc		;ffca42
	bra.s	Lffca5a					;$6012			;ffca46
Lffca48:									;ffca48
	lea.l	($00eb8000),a0				;$41f9,$00eb,$8000	;ffca48
	lsl.w	#7,d1					;$ef49			;ffca4e
	adda.w	d1,a0					;$d0c1			;ffca50
	moveq.l	#$3f,d0					;$703f			;ffca52
Lffca54:									;ffca54
	move.w	(a0)+,(a1)+				;$32d8			;ffca54
	dbra.w	d0,Lffca54				;$51c8,$fffc		;ffca56
Lffca5a:									;ffca5a
	moveq.l	#$00,d0					;$7000			;ffca5a
	movem.l	(a7)+,d1/a1				;$4cdf,$0202		;ffca5c
	rts						;$4e75			;ffca60

Call_SP_REGST:									;ffca62
	bsr.w	Lffcc9e					;$6100,$023a		;ffca62
	movem.l	d1/d5,-(a7)				;$48e7,$4400		;ffca66
	andi.w	#$007f,d1				;$0241,$007f		;ffca6a
	lea.l	($00eb0000),a0				;$41f9,$00eb,$0000	;ffca6e
	lsl.w	#3,d1					;$e749			;ffca74
	adda.w	d1,a0					;$d0c1			;ffca76
	tst.l	d1					;$4a81			;ffca78
	bmi.s	Lffca80					;$6b04			;ffca7a
	bsr.w	Lffcc88					;$6100,$020a		;ffca7c
Lffca80:									;ffca80
	tst.l	d2					;$4a82			;ffca80
	bmi.s	Lffca86					;$6b02			;ffca82
	move.w	d2,(a0)					;$3082			;ffca84
Lffca86:									;ffca86
	addq.w	#2,a0					;$5448			;ffca86
	tst.l	d3					;$4a83			;ffca88
	bmi.s	Lffca8e					;$6b02			;ffca8a
	move.w	d3,(a0)					;$3083			;ffca8c
Lffca8e:									;ffca8e
	addq.w	#2,a0					;$5448			;ffca8e
	tst.l	d4					;$4a84			;ffca90
	bmi.s	Lffca96					;$6b02			;ffca92
	move.w	d4,(a0)					;$3084			;ffca94
Lffca96:									;ffca96
	addq.w	#2,a0					;$5448			;ffca96
	tst.l	d5					;$4a85			;ffca98
	bmi.s	Lffcaa2					;$6b06			;ffca9a
	andi.w	#$0003,d5				;$0245,$0003		;ffca9c
	move.w	d5,(a0)					;$3085			;ffcaa0
Lffcaa2:									;ffcaa2
	moveq.l	#$00,d0					;$7000			;ffcaa2
	movem.l	(a7)+,d1/d5				;$4cdf,$0022		;ffcaa4
	rts						;$4e75			;ffcaa8

Call_SP_REGGT:									;ffcaaa
	bsr.w	Lffcc9e					;$6100,$01f2		;ffcaaa
	move.l	d1,-(a7)				;$2f01			;ffcaae
	andi.w	#$007f,d1				;$0241,$007f		;ffcab0
	lea.l	($00eb0000),a0				;$41f9,$00eb,$0000	;ffcab4
	lsl.w	#3,d1					;$e749			;ffcaba
	adda.w	d1,a0					;$d0c1			;ffcabc
	moveq.l	#$00,d2					;$7400			;ffcabe
	move.w	(a0)+,d2				;$3418			;ffcac0
	moveq.l	#$00,d3					;$7600			;ffcac2
	move.w	(a0)+,d3				;$3618			;ffcac4
	moveq.l	#$00,d4					;$7800			;ffcac6
	move.w	(a0)+,d4				;$3818			;ffcac8
	moveq.l	#$00,d5					;$7a00			;ffcaca
	move.w	(a0),d5					;$3a10			;ffcacc
	move.l	(a7)+,d1				;$221f			;ffcace
	rts						;$4e75			;ffcad0

Call_BGSCRLST:									;ffcad2
	bsr.w	Lffcc9e					;$6100,$01ca		;ffcad2
	btst.l	#$00,d1					;$0801,$0000		;ffcad6
	bne.s	Lffcae4					;$6608			;ffcada
	lea.l	($00eb0800),a0				;$41f9,$00eb,$0800	;ffcadc
	bra.s	Lffcaea					;$6006			;ffcae2
Lffcae4:									;ffcae4
	lea.l	($00eb0804),a0				;$41f9,$00eb,$0804	;ffcae4
Lffcaea:									;ffcaea
	tst.l	d1					;$4a81			;ffcaea
	bmi.s	Lffcaf2					;$6b04			;ffcaec
	bsr.w	Lffcc88					;$6100,$0198		;ffcaee
Lffcaf2:									;ffcaf2
	tst.l	d2					;$4a82			;ffcaf2
	bmi.s	Lffcaf8					;$6b02			;ffcaf4
	move.w	d2,(a0)					;$3082			;ffcaf6
Lffcaf8:									;ffcaf8
	addq.w	#2,a0					;$5448			;ffcaf8
	tst.l	d3					;$4a83			;ffcafa
	bmi.s	Lffcb00					;$6b02			;ffcafc
	move.w	d3,(a0)					;$3083			;ffcafe
Lffcb00:									;ffcb00
	moveq.l	#$00,d0					;$7000			;ffcb00
	rts						;$4e75			;ffcb02

Call_BGSCRLGT:									;ffcb04
	bsr.w	Lffcc9e					;$6100,$0198		;ffcb04
	btst.l	#$00,d1					;$0801,$0000		;ffcb08
	bne.s	Lffcb16					;$6608			;ffcb0c
	lea.l	($00eb0800),a0				;$41f9,$00eb,$0800	;ffcb0e
	bra.s	Lffcb1c					;$6006			;ffcb14
Lffcb16:									;ffcb16
	lea.l	($00eb0804),a0				;$41f9,$00eb,$0804	;ffcb16
Lffcb1c:									;ffcb1c
	moveq.l	#$00,d2					;$7400			;ffcb1c
	move.w	(a0)+,d2				;$3418			;ffcb1e
	moveq.l	#$00,d3					;$7600			;ffcb20
	move.w	(a0),d3					;$3610			;ffcb22
	moveq.l	#$00,d0					;$7000			;ffcb24
	rts						;$4e75			;ffcb26

Call_BGCTRLST:									;ffcb28
	bsr.w	Lffcc9e					;$6100,$0174		;ffcb28
	movem.l	d2-d3,-(a7)				;$48e7,$3000		;ffcb2c
	tst.l	d2					;$4a82			;ffcb30
	bpl.s	Lffcb3a					;$6a06			;ffcb32
	moveq.l	#$fe,d0					;$70fe			;ffcb34
	moveq.l	#$00,d2					;$7400			;ffcb36
	bra.s	Lffcb42					;$6008			;ffcb38
Lffcb3a:									;ffcb3a
	moveq.l	#$f8,d0					;$70f8			;ffcb3a
	andi.w	#$0001,d2				;$0242,$0001		;ffcb3c
	add.l	d2,d2					;$d482			;ffcb40
Lffcb42:									;ffcb42
	tst.l	d3					;$4a83			;ffcb42
	bpl.s	Lffcb4c					;$6a06			;ffcb44
	ori.w	#$0001,d0				;$0040,$0001		;ffcb46
	bra.s	Lffcb52					;$6006			;ffcb4a
Lffcb4c:									;ffcb4c
	beq.s	Lffcb52					;$6704			;ffcb4c
	ori.w	#$0001,d2				;$0042,$0001		;ffcb4e
Lffcb52:									;ffcb52
	btst.l	#$00,d1					;$0801,$0000		;ffcb52
	beq.s	Lffcb5c					;$6704			;ffcb56
	rol.w	#3,d0					;$e758			;ffcb58
	lsl.w	#3,d2					;$e74a			;ffcb5a
Lffcb5c:									;ffcb5c
	move.w	($00eb0808),d3				;$3639,$00eb,$0808	;ffcb5c
	and.w	d0,d3					;$c640			;ffcb62
	or.w	d2,d3					;$8642			;ffcb64
	move.w	d3,($00eb0808)				;$33c3,$00eb,$0808	;ffcb66
	moveq.l	#$00,d0					;$7000			;ffcb6c
	movem.l	(a7)+,d2-d3				;$4cdf,$000c		;ffcb6e
	rts						;$4e75			;ffcb72

Call_BGCTRLGT:									;ffcb74
	bsr.w	Lffcc9e					;$6100,$0128		;ffcb74
	btst.l	#$00,d1					;$0801,$0000		;ffcb78
	beq.s	Lffcb8e					;$6710			;ffcb7c
	move.w	($00eb0808),d0				;$3039,$00eb,$0808	;ffcb7e
	andi.l	#$00000038,d0				;$0280,$0000,$0038	;ffcb84
	lsr.l	#3,d0					;$e688			;ffcb8a
	rts						;$4e75			;ffcb8c

Lffcb8e:									;ffcb8e
	move.w	($00eb0808),d0				;$3039,$00eb,$0808	;ffcb8e
	andi.l	#$00000007,d0				;$0280,$0000,$0007	;ffcb94
	rts						;$4e75			;ffcb9a

Call_BGTEXTCL:									;ffcb9c
	bsr.w	Lffcc9e					;$6100,$0100		;ffcb9c
	btst.l	#$00,d1					;$0801,$0000		;ffcba0
	bne.s	Lffcbb4					;$660e			;ffcba4
	lea.l	($00ebc000),a0				;$41f9,$00eb,$c000	;ffcba6
	move.l	#$00ebe000,d0				;$203c,$00eb,$e000	;ffcbac
	bra.s	Lffcbc0					;$600c			;ffcbb2
Lffcbb4:									;ffcbb4
	lea.l	($00ebe000),a0				;$41f9,$00eb,$e000	;ffcbb4
	move.l	#$00ec0000,d0				;$203c,$00ec,$0000	;ffcbba
Lffcbc0:									;ffcbc0
	move.w	d2,(a0)+				;$30c2			;ffcbc0
	cmpa.l	d0,a0					;$b1c0			;ffcbc2
	bmi.s	Lffcbc0					;$6bfa			;ffcbc4
	moveq.l	#$00,d0					;$7000			;ffcbc6
	rts						;$4e75			;ffcbc8

Call_BGTEXTST:									;ffcbca
	bsr.w	Lffcc9e					;$6100,$00d2		;ffcbca
	movem.l	d2-d3,-(a7)				;$48e7,$3000		;ffcbce
	btst.l	#$00,d1					;$0801,$0000		;ffcbd2
	bne.s	Lffcbe0					;$6608			;ffcbd6
	lea.l	($00ebc000),a0				;$41f9,$00eb,$c000	;ffcbd8
	bra.s	Lffcbe6					;$6006			;ffcbde
Lffcbe0:									;ffcbe0
	lea.l	($00ebe000),a0				;$41f9,$00eb,$e000	;ffcbe0
Lffcbe6:									;ffcbe6
	andi.w	#$003f,d2				;$0242,$003f		;ffcbe6
	andi.w	#$003f,d3				;$0243,$003f		;ffcbea
	add.w	d2,d2					;$d442			;ffcbee
	lsl.w	#7,d3					;$ef4b			;ffcbf0
	add.w	d3,d2					;$d443			;ffcbf2
	adda.w	d2,a0					;$d0c2			;ffcbf4
	move.w	d4,(a0)					;$3084			;ffcbf6
	moveq.l	#$00,d0					;$7000			;ffcbf8
	movem.l	(a7)+,d2-d3				;$4cdf,$000c		;ffcbfa
	rts						;$4e75			;ffcbfe

Call_BGTEXTGT:									;ffcc00
	bsr.w	Lffcc9e					;$6100,$009c		;ffcc00
	movem.l	d2-d3,-(a7)				;$48e7,$3000		;ffcc04
	btst.l	#$00,d1					;$0801,$0000		;ffcc08
	bne.s	Lffcc16					;$6608			;ffcc0c
	lea.l	($00ebc000),a0				;$41f9,$00eb,$c000	;ffcc0e
	bra.s	Lffcc1c					;$6006			;ffcc14
Lffcc16:									;ffcc16
	lea.l	($00ebe000),a0				;$41f9,$00eb,$e000	;ffcc16
Lffcc1c:									;ffcc1c
	andi.w	#$003f,d2				;$0242,$003f		;ffcc1c
	andi.w	#$003f,d3				;$0243,$003f		;ffcc20
	add.w	d2,d2					;$d442			;ffcc24
	lsl.w	#7,d3					;$ef4b			;ffcc26
	add.w	d3,d2					;$d443			;ffcc28
	adda.w	d2,a0					;$d0c2			;ffcc2a
	moveq.l	#$00,d0					;$7000			;ffcc2c
	move.w	(a0),d0					;$3010			;ffcc2e
	movem.l	(a7)+,d2-d3				;$4cdf,$000c		;ffcc30
	rts						;$4e75			;ffcc34

Call_SPALET:									;ffcc36
	movem.l	d1-d2,-(a7)				;$48e7,$6000		;ffcc36
	andi.w	#$000f,d2				;$0242,$000f		;ffcc3a
	bne.s	Lffcc52					;$6612			;ffcc3e
	andi.w	#$00ff,d1				;$0241,$00ff		;ffcc40
	cmpi.w	#$0010,d1				;$0c41,$0010		;ffcc44
	bcc.s	Lffcc5a					;$6410			;ffcc48
	moveq.l	#$fe,d0					;$70fe			;ffcc4a
	movem.l	(a7)+,d1-d2				;$4cdf,$0006		;ffcc4c
	rts						;$4e75			;ffcc50

Lffcc52:									;ffcc52
	andi.w	#$000f,d1				;$0241,$000f		;ffcc52
	andi.w	#$000f,d2				;$0242,$000f		;ffcc56
Lffcc5a:									;ffcc5a
	lea.l	($00e82200),a0				;$41f9,$00e8,$2200	;ffcc5a
	add.w	d1,d1					;$d241			;ffcc60
	lsl.w	#5,d2					;$eb4a			;ffcc62
	add.w	d2,d1					;$d242			;ffcc64
	adda.w	d1,a0					;$d0c1			;ffcc66
	tst.l	d1					;$4a81			;ffcc68
	bmi.s	Lffcc6e					;$6b02			;ffcc6a
	bsr.s	Lffcc88					;$611a			;ffcc6c
Lffcc6e:									;ffcc6e
	tst.l	d3					;$4a83			;ffcc6e
	bpl.s	Lffcc7c					;$6a0a			;ffcc70
	moveq.l	#$00,d0					;$7000			;ffcc72
	move.w	(a0),d0					;$3010			;ffcc74
	movem.l	(a7)+,d1-d2				;$4cdf,$0006		;ffcc76
	rts						;$4e75			;ffcc7a

Lffcc7c:									;ffcc7c
	moveq.l	#$00,d0					;$7000			;ffcc7c
	move.w	(a0),d0					;$3010			;ffcc7e
	move.w	d3,(a0)					;$3083			;ffcc80
	movem.l	(a7)+,d1-d2				;$4cdf,$0006		;ffcc82
	rts						;$4e75			;ffcc86

Lffcc88:									;ffcc88
	btst.b	#$04,($00e88001)			;$0839,$0004,$00e8,$8001	;ffcc88
	beq.s	Lffcc88					;$67f6			;ffcc90
Lffcc92:									;ffcc92
	btst.b	#$04,($00e88001)			;$0839,$0004,$00e8,$8001	;ffcc92
	bne.s	Lffcc92					;$66f6			;ffcc9a
	rts						;$4e75			;ffcc9c

Lffcc9e:									;ffcc9e
	move.w	($00e80028),d0				;$3039,$00e8,$0028	;ffcc9e
	andi.w	#$00ff,d0				;$0240,$00ff		;ffcca4
	cmpi.w	#$0016,d0				;$0c40,$0016		;ffcca8
	bne.s	Lffccb4					;$6606			;ffccac
	moveq.l	#$ff,d0					;$70ff			;ffccae
	addq.l	#4,a7					;$588f			;ffccb0
	rts						;$4e75			;ffccb2

Lffccb4:									;ffccb4
	moveq.l	#$00,d0					;$7000			;ffccb4
	rts						;$4e75			;ffccb6

Lffccb8:									;ffccb8
	movem.l	d1/d3/a1-a2/a6,-(a7)			;$48e7,$5062		;ffccb8
	moveq.l	#$10,d0					;$7010			;ffccbc
	cmp.l	d0,d1					;$b280			;ffccbe
	bcs.s	Lffccd6					;$6514			;ffccc0
	add.l	d0,d0					;$d080			;ffccc2
	cmp.l	d0,d1					;$b280			;ffccc4
	bcs.s	Lffcd02					;$653a			;ffccc6
	add.l	d0,d0					;$d080			;ffccc8
	cmp.l	d0,d1					;$b280			;ffccca
	bcs.s	Lffccdc					;$650e			;ffcccc
	moveq.l	#$50,d0					;$7050			;ffccce
	cmp.l	d0,d1					;$b280			;ffccd0
	bcs.s	Lffcce6					;$6512			;ffccd2
	bra.s	Lffcd02					;$602c			;ffccd4
Lffccd6:									;ffccd6
	lea.l	(Lffcd0e,pc),a2				;$45fa,$0036		;ffccd6
	bra.s	Lffccee					;$6012			;ffccda
Lffccdc:									;ffccdc
	moveq.l	#$20,d0					;$7020			;ffccdc
	sub.l	d0,d1					;$9280			;ffccde
	lea.l	(Lffcd4e,pc),a2				;$45fa,$006c		;ffcce0
	bra.s	Lffccee					;$6008			;ffcce4
Lffcce6:									;ffcce6
	moveq.l	#$40,d0					;$7040			;ffcce6
	sub.l	d0,d1					;$9280			;ffcce8
	lea.l	(Lffcdce,pc),a2				;$45fa,$00e2		;ffccea
Lffccee:									;ffccee
	lsl.l	#2,d1					;$e589			;ffccee
	movea.l	(Lff933c,pc),a6				;$2c7a,$c64a		;ffccf0
	move.l	(a2,d1.w),d1				;$2232,$1000		;ffccf4
	adda.l	d1,a2					;$d5c1			;ffccf8
	jsr	(a2)					;$4e92			;ffccfa
	movem.l	(a7)+,d1/d3/a1-a2/a6			;$4cdf,$460a		;ffccfc
	rts						;$4e75			;ffcd00

Lffcd02:									;ffcd02
	moveq.l	#$ff,d0					;$70ff			;ffcd02
	movem.l	(a7)+,d1/d3/a1-a2/a6			;$4cdf,$460a		;ffcd04
	rts						;$4e75			;ffcd08

Lffcd0a:									;ffcd0a
	moveq.l	#$ff,d0					;$70ff			;ffcd0a
	rts						;$4e75			;ffcd0c

Lffcd0e:									;ffcd0e
	.dc.b	$00,$00,$01,$00,$00,$00,$01,$ee					;ffcd0e
	.dc.b	$00,$00,$01,$c8,$00,$00,$02,$bc					;ffcd16
	.dc.b	$00,$00,$08,$b2,$00,$00,$08,$6a					;ffcd1e
	.dc.b	$00,$00,$03,$9c,$00,$00,$03,$da					;ffcd26
	.dc.b	$00,$00,$04,$18,$00,$00,$04,$84					;ffcd2e
	.dc.b	$00,$00,$04,$98,$00,$00,$03,$58					;ffcd36
	.dc.b	$00,$00,$03,$18,$00,$00,$04,$54					;ffcd3e
	.dc.b	$ff,$ff,$ff,$fc,$ff,$ff,$ff,$fc					;ffcd46
Lffcd4e:									;ffcd4e
	.dc.b	$00,$00,$08,$c4,$00,$00,$09,$f4					;ffcd4e
	.dc.b	$00,$00,$0a,$4e,$00,$00,$0b,$de					;ffcd56
	.dc.b	$00,$00,$06,$a2,$00,$00,$07,$4e					;ffcd5e
	.dc.b	$00,$00,$0a,$ac,$00,$00,$0b,$12					;ffcd66
	.dc.b	$00,$00,$0b,$b2,$00,$00,$09,$3c					;ffcd6e
	.dc.b	$00,$00,$09,$7c,$00,$00,$06,$c0					;ffcd76
	.dc.b	$00,$00,$09,$00,$00,$00,$0c,$aa					;ffcd7e
	.dc.b	$00,$00,$06,$de,$00,$00,$0c,$44					;ffcd86
	.dc.b	$00,$00,$0c,$76,$00,$00,$09,$bc					;ffcd8e
	.dc.b	$00,$00,$0c,$12,$ff,$ff,$ff,$bc					;ffcd96
	.dc.b	$ff,$ff,$ff,$bc,$ff,$ff,$ff,$bc					;ffcd9e
	.dc.b	$00,$00,$0c,$de,$00,$00,$0d,$20					;ffcda6
	.dc.b	$00,$00,$0d,$58,$00,$00,$0d,$90					;ffcdae
	.dc.b	$ff,$ff,$ff,$bc,$ff,$ff,$ff,$bc					;ffcdb6
	.dc.b	$ff,$ff,$ff,$bc,$ff,$ff,$ff,$bc					;ffcdbe
	.dc.b	$ff,$ff,$ff,$bc,$ff,$ff,$ff,$bc					;ffcdc6
Lffcdce:									;ffcdce
	DOS	_CHANGE_PR				;$ffff			;ffcdce
	DOS	_CREATE					;$ff3c			;ffcdd0
	DOS	_CHANGE_PR				;$ffff			;ffcdd2
	DOS	_CREATE					;$ff3c			;ffcdd4
	DOS	_CHANGE_PR				;$ffff			;ffcdd6
	DOS	_CREATE					;$ff3c			;ffcdd8
	DOS	_CHANGE_PR				;$ffff			;ffcdda
	DOS	_CREATE					;$ff3c			;ffcddc
	DOS	_CHANGE_PR				;$ffff			;ffcdde
	DOS	_CREATE					;$ff3c			;ffcde0
	DOS	_CHANGE_PR				;$ffff			;ffcde2
	DOS	_CREATE					;$ff3c			;ffcde4
	DOS	_CHANGE_PR				;$ffff			;ffcde6
	DOS	_CREATE					;$ff3c			;ffcde8
	DOS	_CHANGE_PR				;$ffff			;ffcdea
	DOS	_CREATE					;$ff3c			;ffcdec
	DOS	_CHANGE_PR				;$ffff			;ffcdee
	DOS	_CREATE					;$ff3c			;ffcdf0
	DOS	_CHANGE_PR				;$ffff			;ffcdf2
	DOS	_CREATE					;$ff3c			;ffcdf4
	DOS	_CHANGE_PR				;$ffff			;ffcdf6
	DOS	_CREATE					;$ff3c			;ffcdf8
	DOS	_CHANGE_PR				;$ffff			;ffcdfa
	DOS	_CREATE					;$ff3c			;ffcdfc
	DOS	_CHANGE_PR				;$ffff			;ffcdfe
	DOS	_CREATE					;$ff3c			;ffce00
	DOS	_CHANGE_PR				;$ffff			;ffce02
	DOS	_CREATE					;$ff3c			;ffce04
	DOS	_CHANGE_PR				;$ffff			;ffce06
	DOS	_CREATE					;$ff3c			;ffce08
	DOS	_CHANGE_PR				;$ffff			;ffce0a
	DOS	_CREATE					;$ff3c			;ffce0c
Lffce0e:									;ffce0e
	movem.l	d1/a1/a6,-(a7)				;$48e7,$4042		;ffce0e
	movea.l	(Lff933c,pc),a6				;$2c7a,$c528		;ffce12
	move.b	#$90,($0003,a6)				;$1d7c,$0090,$0003	;ffce16
	sf.b	($0cc2)					;$51f8,$0cc2		;ffce1c
	move.b	($00ed006f),d0				;$1039,$00ed,$006f	;ffce20
	cmpi.b	#$56,d0					;$0c00,$0056		;ffce26
	beq.s	Lffce54					;$6728			;ffce2a
	move.b	#$31,($00e8e00d)			;$13fc,$0031,$00e8,$e00d	;ffce2c
	move.b	#$07,($00ed0070)			;$13fc,$0007,$00ed,$0070	;ffce34
	move.b	#$00,($00ed0071)			;$13fc,$0000,$00ed,$0071	;ffce3c
	move.b	#$56,($00ed006f)			;$13fc,$0056,$00ed,$006f	;ffce44
	move.b	#$00,($00e8e00d)			;$13fc,$0000,$00e8,$e00d	;ffce4c
Lffce54:									;ffce54
	move.b	($00ed0070),d0				;$1039,$00ed,$0070	;ffce54
	andi.b	#$07,d0					;$0200,$0007		;ffce5a
	move.b	d0,($0001,a6)				;$1d40,$0001		;ffce5e
	moveq.l	#$00,d0					;$7000			;ffce62
	move.b	d0,($0005,a6)				;$1d40,$0005		;ffce64
	move.b	d0,($0011,a6)				;$1d40,$0011		;ffce68
	move.b	d0,($0019,a6)				;$1d40,$0019		;ffce6c
	move.b	d0,($001b,a6)				;$1d40,$001b		;ffce70
	move.b	d0,($001d,a6)				;$1d40,$001d		;ffce74
	move.b	d0,($0017,a6)				;$1d40,$0017		;ffce78
	move.b	#$00,($000b,a6)				;$1d7c,$0000,$000b	;ffce7c
	move.w	#$0200,($0cc0)				;$31fc,$0200,$0cc0	;ffce82
	moveq.l	#$6c,d1					;$726c			;ffce88
	lea.l	(Lffcec0,pc),a1				;$43fa,$0034		;ffce8a
	IOCS	_B_INTVCS				;$7080,$4e4f		;ffce8e
	move.b	#$10,($0003,a6)				;$1d7c,$0010,$0003	;ffce92
	moveq.l	#$02,d0					;$7002			;ffce98
	bsr.w	Lffd54c					;$6100,$06b0		;ffce9a
	move.b	#$10,($0005,a6)				;$1d7c,$0010,$0005	;ffce9e
	moveq.l	#$05,d0					;$7005			;ffcea4
	bsr.w	Lffd54c					;$6100,$06a4		;ffcea6
	move.b	#$00,($0005,a6)				;$1d7c,$0000,$0005	;ffceaa
	move.l	#$00009c40,d0				;$203c,$0000,$9c40	;ffceb0
	bsr.w	Lffd54c					;$6100,$0694		;ffceb6
	movem.l	(a7)+,d1/a1/a6				;$4cdf,$4202		;ffceba
	rts						;$4e75			;ffcebe

Lffcec0:									;ffcec0
	movem.l	d0-d1/a6,-(a7)				;$48e7,$c002		;ffcec0
	movea.l	(Lff933c,pc),a6				;$2c7a,$c476		;ffcec4
	move.b	($0009,a6),d0				;$102e,$0009		;ffcec8
	move.b	d0,($0009,a6)				;$1d40,$0009		;ffcecc
	movem.l	(a7)+,d0-d1/a6				;$4cdf,$4003		;ffced0
	rte						;$4e73			;ffced4

Lffced6:									;ffced6
	movem.l	d4/d7/a0/a6,-(a7)			;$48e7,$0982		;ffced6
	movea.l	(Lff933c,pc),a6				;$2c7a,$c460		;ffceda
	lea.l	($0009,a6),a0				;$41ee,$0009		;ffcede
	move.b	#$00,($0011,a6)				;$1d7c,$0000,$0011	;ffcee2
Lffcee8:									;ffcee8
	move.b	($000d,a6),d0				;$102e,$000d		;ffcee8
	andi.b	#$f8,d0					;$0200,$00f8		;ffceec
	bne.s	Lffcee8					;$66f6			;ffcef0
	move.b	(a0),(a0)				;$1090			;ffcef2
	move.b	#$60,($0005,a6)				;$1d7c,$0060,$0005	;ffcef4
	bra.s	Lffcf18					;$601c			;ffcefa
Lffcefc:									;ffcefc
	movem.l	d4/d7/a0/a6,-(a7)			;$48e7,$0982		;ffcefc
	movea.l	(Lff933c,pc),a6				;$2c7a,$c43a		;ffcf00
	lea.l	($0009,a6),a0				;$41ee,$0009		;ffcf04
	move.b	#$00,($0011,a6)				;$1d7c,$0000,$0011	;ffcf08
Lffcf0e:									;ffcf0e
	move.b	($000d,a6),d0				;$102e,$000d		;ffcf0e
	andi.b	#$f8,d0					;$0200,$00f8		;ffcf12
	bne.s	Lffcf0e					;$66f6			;ffcf16
Lffcf18:									;ffcf18
	andi.w	#$0007,d4				;$0244,$0007		;ffcf18
	moveq.l	#$01,d0					;$7001			;ffcf1c
	lsl.b	d4,d0					;$e928			;ffcf1e
	btst.b	d4,($00ed0071)				;$0939,$00ed,$0071	;ffcf20
	bne.s	Lffcf34					;$660c			;ffcf26
	or.b	($0001,a6),d0				;$802e,$0001		;ffcf28
	bset.b	#$04,($0003,a6)				;$08ee,$0004,$0003	;ffcf2c
	bra.s	Lffcf3a					;$6006			;ffcf32
Lffcf34:									;ffcf34
	bclr.b	#$04,($0003,a6)				;$08ae,$0004,$0003	;ffcf34
Lffcf3a:									;ffcf3a
	swap.w	d0					;$4840			;ffcf3a
	move.w	#$09c4,d0				;$303c,$09c4		;ffcf3c
	lsl.l	#8,d0					;$e188			;ffcf40
	move.b	#$03,d0					;$103c,$0003		;ffcf42
	movep.l	d0,($0017,a6)				;$01ce,$0017		;ffcf46
	move.b	(a0),(a0)				;$1090			;ffcf4a
	move.b	#$20,($0005,a6)				;$1d7c,$0020,$0005	;ffcf4c
	moveq.l	#$01,d0					;$7001			;ffcf52
	bsr.w	Lffd54c					;$6100,$05f6		;ffcf54
Lffcf58:									;ffcf58
	move.b	(a0),d0					;$1010			;ffcf58
	bne.s	Lffcf6a					;$660e			;ffcf5a
	btst.b	#$05,($000d,a6)				;$082e,$0005,$000d	;ffcf5c
	bne.s	Lffcf58					;$66f4			;ffcf62
	tst.b	($000d,a6)				;$4a2e,$000d		;ffcf64
	bpl.s	Lffcf18					;$6aae			;ffcf68
Lffcf6a:									;ffcf6a
	move.b	(a0),d0					;$1010			;ffcf6a
	beq.s	Lffcf6a					;$67fc			;ffcf6c
	cmp.b	#$04,d0					;$b03c,$0004		;ffcf6e
	beq.s	Lffcf90					;$671c			;ffcf72
	move.b	(a0),(a0)				;$1090			;ffcf74
	cmp.b	#$10,d0					;$b03c,$0010		;ffcf76
	beq.s	Lffcf88					;$670c			;ffcf7a
Lffcf7c:									;ffcf7c
	swap.w	d0					;$4840			;ffcf7c
	move.b	($000b,a6),d0				;$102e,$000b		;ffcf7e
Lffcf82:									;ffcf82
	movem.l	(a7)+,d4/d7/a0/a6			;$4cdf,$4190		;ffcf82
	rts						;$4e75			;ffcf86

Lffcf88:									;ffcf88
	moveq.l	#$00,d0					;$7000			;ffcf88
	bra.s	Lffcf82					;$60f6			;ffcf8a
Lffcf8c:									;ffcf8c
	moveq.l	#$ff,d0					;$70ff			;ffcf8c
	bra.s	Lffcf82					;$60f2			;ffcf8e
Lffcf90:									;ffcf90
	move.l	#$00000258,d0				;$203c,$0000,$0258	;ffcf90
	movep.l	d0,($0017,a6)				;$01ce,$0017		;ffcf96
	move.b	#$04,(a0)				;$10bc,$0004		;ffcf9a
	moveq.l	#$02,d0					;$7002			;ffcf9e
	bsr.w	Lffd54c					;$6100,$05aa		;ffcfa0
Lffcfa4:									;ffcfa4
	move.b	(a0),d0					;$1010			;ffcfa4
	beq.s	Lffcfa4					;$67fc			;ffcfa6
	move.b	(a0),(a0)				;$1090			;ffcfa8
	cmp.b	#$04,d0					;$b03c,$0004		;ffcfaa
	beq.s	Lffcfb8					;$6708			;ffcfae
	cmp.b	#$10,d0					;$b03c,$0010		;ffcfb0
	beq.s	Lffcf88					;$67d2			;ffcfb4
	bra.s	Lffcf7c					;$60c4			;ffcfb6
Lffcfb8:									;ffcfb8
	btst.b	#$05,($000d,a6)				;$082e,$0005,$000d	;ffcfb8
	bne.s	Lffcfb8					;$66f8			;ffcfbe
	move.b	(a0),(a0)				;$1090			;ffcfc0
	tst.b	($000d,a6)				;$4a2e,$000d		;ffcfc2
	bmi.s	Lffcf88					;$6bc0			;ffcfc6
	bra.s	Lffcf7c					;$60b2			;ffcfc8
Lffcfca:									;ffcfca
	movem.l	d3/a6,-(a7)				;$48e7,$1002		;ffcfca
	movea.l	(Lff933c,pc),a6				;$2c7a,$c36c		;ffcfce
	move.b	(a1),d0					;$1011			;ffcfd2
	andi.b	#$e0,d0					;$0200,$00e0		;ffcfd4
	beq.s	Lffcfe8					;$670e			;ffcfd8
	cmp.b	#$20,d0					;$b03c,$0020		;ffcfda
	beq.s	Lffcfec					;$670c			;ffcfde
	cmp.b	#$a0,d0					;$b03c,$00a0		;ffcfe0
	beq.s	Lffcff0					;$670a			;ffcfe4
	bra.s	Lffcff2					;$600a			;ffcfe6
Lffcfe8:									;ffcfe8
	moveq.l	#$06,d3					;$7606			;ffcfe8
	bra.s	Lffcff2					;$6006			;ffcfea
Lffcfec:									;ffcfec
	moveq.l	#$0a,d3					;$760a			;ffcfec
	bra.s	Lffcff2					;$6002			;ffcfee
Lffcff0:									;ffcff0
	moveq.l	#$0c,d3					;$760c			;ffcff0
Lffcff2:									;ffcff2
	btst.b	#$05,($0009,a6)				;$082e,$0005,$0009	;ffcff2
	bne.s	Lffd01e					;$6624			;ffcff8
	move.b	($000b,a6),d0				;$102e,$000b		;ffcffa
	bpl.s	Lffcff2					;$6af2			;ffcffe
	andi.b	#$07,d0					;$0200,$0007		;ffd000
	cmpi.b	#$02,d0					;$0c00,$0002		;ffd004
	bne.s	Lffd018					;$660e			;ffd008
	bsr.w	Lffd37e					;$6100,$0372		;ffd00a
	swap.w	d0					;$4840			;ffd00e
	bne.s	Lffd018					;$6606			;ffd010
Lffd012:									;ffd012
	movem.l	(a7)+,d3/a6				;$4cdf,$4008		;ffd012
	rts						;$4e75			;ffd016

Lffd018:									;ffd018
	move.b	($000b,a6),d0				;$102e,$000b		;ffd018
	bra.s	Lffd012					;$60f4			;ffd01c
Lffd01e:									;ffd01e
	bsr.w	Lffce0e					;$6100,$fdee		;ffd01e
	moveq.l	#$ff,d0					;$70ff			;ffd022
	bra.s	Lffd012					;$60ec			;ffd024
Lffd026:									;ffd026
	movem.l	a6,-(a7)				;$48e7,$0002		;ffd026
	movea.l	(Lff933c,pc),a6				;$2c7a,$c310		;ffd02a
Lffd02e:									;ffd02e
	move.b	($0009,a6),d0				;$102e,$0009		;ffd02e
	btst.l	#$05,d0					;$0800,$0005		;ffd032
	bne.s	Lffd05e					;$6626			;ffd036
	btst.l	#$03,d0					;$0800,$0003		;ffd038
	bne.s	Lffd058					;$661a			;ffd03c
	move.b	($000b,a6),d0				;$102e,$000b		;ffd03e
	bpl.s	Lffd02e					;$6aea			;ffd042
	andi.b	#$07,d0					;$0200,$0007		;ffd044
	bne.s	Lffd058					;$660e			;ffd048
	bsr.w	Lffd1aa					;$6100,$015e		;ffd04a
	swap.w	d0					;$4840			;ffd04e
	bne.s	Lffd058					;$6606			;ffd050
Lffd052:									;ffd052
	movem.l	(a7)+,a6				;$4cdf,$4000		;ffd052
	rts						;$4e75			;ffd056

Lffd058:									;ffd058
	move.b	($000b,a6),d0				;$102e,$000b		;ffd058
	bra.s	Lffd052					;$60f4			;ffd05c
Lffd05e:									;ffd05e
	bsr.w	Lffce0e					;$6100,$fdae		;ffd05e
	moveq.l	#$ff,d0					;$70ff			;ffd062
	bra.s	Lffd052					;$60ec			;ffd064
Lffd066:									;ffd066
	movem.l	a6,-(a7)				;$48e7,$0002		;ffd066
	movea.l	(Lff933c,pc),a6				;$2c7a,$c2d0		;ffd06a
Lffd06e:									;ffd06e
	move.b	($0009,a6),d0				;$102e,$0009		;ffd06e
	btst.l	#$05,d0					;$0800,$0005		;ffd072
	bne.s	Lffd0a2					;$662a			;ffd076
	btst.l	#$03,d0					;$0800,$0003		;ffd078
	bne.s	Lffd09c					;$661e			;ffd07c
	move.b	($000b,a6),d0				;$102e,$000b		;ffd07e
	bpl.s	Lffd06e					;$6aea			;ffd082
	andi.b	#$07,d0					;$0200,$0007		;ffd084
	cmpi.b	#$01,d0					;$0c00,$0001		;ffd088
	bne.s	Lffd09c					;$660e			;ffd08c
	bsr.w	Lffd260					;$6100,$01d0		;ffd08e
	swap.w	d0					;$4840			;ffd092
	bne.s	Lffd09c					;$6606			;ffd094
Lffd096:									;ffd096
	movem.l	(a7)+,a6				;$4cdf,$4000		;ffd096
	rts						;$4e75			;ffd09a

Lffd09c:									;ffd09c
	move.b	($000b,a6),d0				;$102e,$000b		;ffd09c
	bra.s	Lffd096					;$60f4			;ffd0a0
Lffd0a2:									;ffd0a2
	bsr.w	Lffce0e					;$6100,$fd6a		;ffd0a2
	moveq.l	#$ff,d0					;$70ff			;ffd0a6
	bra.s	Lffd096					;$60ec			;ffd0a8
Lffd0aa:									;ffd0aa
	movem.l	d3/a6,-(a7)				;$48e7,$1002		;ffd0aa
	movea.l	(Lff933c,pc),a6				;$2c7a,$c28c		;ffd0ae
Lffd0b2:									;ffd0b2
	btst.b	#$05,($0009,a6)				;$082e,$0005,$0009	;ffd0b2
	bne.s	Lffd0e0					;$6626			;ffd0b8
	move.b	($000b,a6),d0				;$102e,$000b		;ffd0ba
	bpl.s	Lffd0b2					;$6af2			;ffd0be
	andi.b	#$07,d0					;$0200,$0007		;ffd0c0
	cmpi.b	#$03,d0					;$0c00,$0003		;ffd0c4
	bne.s	Lffd0da					;$6610			;ffd0c8
	moveq.l	#$01,d3					;$7601			;ffd0ca
	bsr.w	Lffd3b4					;$6100,$02e6		;ffd0cc
	swap.w	d0					;$4840			;ffd0d0
	bne.s	Lffd0da					;$6606			;ffd0d2
Lffd0d4:									;ffd0d4
	movem.l	(a7)+,d3/a6				;$4cdf,$4008		;ffd0d4
	rts						;$4e75			;ffd0d8

Lffd0da:									;ffd0da
	move.b	($000b,a6),d0				;$102e,$000b		;ffd0da
	bra.s	Lffd0d4					;$60f4			;ffd0de
Lffd0e0:									;ffd0e0
	bsr.w	Lffce0e					;$6100,$fd2c		;ffd0e0
	moveq.l	#$ff,d0					;$70ff			;ffd0e4
	bra.s	Lffd0d4					;$60ec			;ffd0e6
Lffd0e8:									;ffd0e8
	movem.l	d3/a6,-(a7)				;$48e7,$1002		;ffd0e8
	movea.l	(Lff933c,pc),a6				;$2c7a,$c24e		;ffd0ec
	moveq.l	#$01,d3					;$7601			;ffd0f0
Lffd0f2:									;ffd0f2
	btst.b	#$05,($0009,a6)				;$082e,$0005,$0009	;ffd0f2
	bne.s	Lffd11e					;$6624			;ffd0f8
	move.b	($000b,a6),d0				;$102e,$000b		;ffd0fa
	bpl.s	Lffd0f2					;$6af2			;ffd0fe
	andi.b	#$07,d0					;$0200,$0007		;ffd100
	cmpi.b	#$07,d0					;$0c00,$0007		;ffd104
	bne.s	Lffd118					;$660e			;ffd108
	bsr.w	Lffd3b4					;$6100,$02a8		;ffd10a
	swap.w	d0					;$4840			;ffd10e
	bne.s	Lffd118					;$6606			;ffd110
Lffd112:									;ffd112
	movem.l	(a7)+,d3/a6				;$4cdf,$4008		;ffd112
	rts						;$4e75			;ffd116

Lffd118:									;ffd118
	move.b	($000b,a6),d0				;$102e,$000b		;ffd118
	bra.s	Lffd112					;$60f4			;ffd11c
Lffd11e:									;ffd11e
	bsr.w	Lffce0e					;$6100,$fcee		;ffd11e
	moveq.l	#$ff,d0					;$70ff			;ffd122
	bra.s	Lffd112					;$60ec			;ffd124
Lffd126:									;ffd126
	movem.l	d3/a6,-(a7)				;$48e7,$1002		;ffd126
	movea.l	(Lff933c,pc),a6				;$2c7a,$c210		;ffd12a
	moveq.l	#$01,d3					;$7601			;ffd12e
Lffd130:									;ffd130
	btst.b	#$05,($0009,a6)				;$082e,$0005,$0009	;ffd130
	bne.s	Lffd15a					;$6622			;ffd136
	move.b	($000b,a6),d0				;$102e,$000b		;ffd138
	bpl.s	Lffd130					;$6af2			;ffd13c
	andi.b	#$07,d0					;$0200,$0007		;ffd13e
	cmpi.b	#$06,d0					;$0c00,$0006		;ffd142
	bne.s	Lffd154					;$660c			;ffd146
	bsr.s	Lffd1aa					;$6160			;ffd148
	swap.w	d0					;$4840			;ffd14a
	bne.s	Lffd154					;$6606			;ffd14c
Lffd14e:									;ffd14e
	movem.l	(a7)+,d3/a6				;$4cdf,$4008		;ffd14e
	rts						;$4e75			;ffd152

Lffd154:									;ffd154
	move.b	($000b,a6),d0				;$102e,$000b		;ffd154
	bra.s	Lffd14e					;$60f4			;ffd158
Lffd15a:									;ffd15a
	bsr.w	Lffce0e					;$6100,$fcb2		;ffd15a
	moveq.l	#$ff,d0					;$70ff			;ffd15e
	bra.s	Lffd14e					;$60ec			;ffd160
Lffd162:									;ffd162
	movem.l	d3/a6,-(a7)				;$48e7,$1002		;ffd162
	movea.l	(Lff933c,pc),a6				;$2c7a,$c1d4		;ffd166
	move.b	($0002,a1),d0				;$1029,$0002		;ffd16a
	beq.s	Lffd17c					;$670c			;ffd16e
	subq.b	#2,d0					;$5500			;ffd170
	bcs.s	Lffd180					;$650c			;ffd172
	beq.s	Lffd184					;$670e			;ffd174
	subq.b	#1,d0					;$5300			;ffd176
	beq.s	Lffd184					;$670a			;ffd178
	bra.s	Lffd130					;$60b4			;ffd17a
Lffd17c:									;ffd17c
	moveq.l	#$05,d3					;$7605			;ffd17c
	bra.s	Lffd186					;$6006			;ffd17e
Lffd180:									;ffd180
	moveq.l	#$03,d3					;$7603			;ffd180
	bra.s	Lffd186					;$6002			;ffd182
Lffd184:									;ffd184
	moveq.l	#$02,d3					;$7602			;ffd184
Lffd186:									;ffd186
	move.b	#$01,(a1)				;$12bc,$0001		;ffd186
	move.b	d3,($0001,a1)				;$1343,$0001		;ffd18a
	addq.l	#2,d3					;$5483			;ffd18e
	bra.s	Lffd130					;$609e			;ffd190
Lffd192:									;ffd192
	movem.l	a6,-(a7)				;$48e7,$0002		;ffd192
	movea.l	(Lff933c,pc),a6				;$2c7a,$c1a4		;ffd196
	moveq.l	#$00,d0					;$7000			;ffd19a
	move.b	($000b,a6),d0				;$102e,$000b		;ffd19c
	movem.l	(a7)+,a6				;$4cdf,$4000		;ffd1a0
	rts						;$4e75			;ffd1a4

Lffd1a6:									;ffd1a6
	moveq.l	#$0a,d0					;$700a			;ffd1a6
	rts						;$4e75			;ffd1a8

Lffd1aa:									;ffd1aa
	movem.l	d1-d4/a1-a4,-(a7)			;$48e7,$7878		;ffd1aa
	lea.l	($0009,a6),a2				;$45ee,$0009		;ffd1ae
	lea.l	($000d,a6),a3				;$47ee,$000d		;ffd1b2
	lea.l	($0015,a6),a4				;$49ee,$0015		;ffd1b6
	tst.l	d3					;$4a83			;ffd1ba
	bne.s	Lffd1c2					;$6604			;ffd1bc
	move.w	#$0100,d3				;$363c,$0100		;ffd1be
Lffd1c2:									;ffd1c2
	move.l	#Lffffff,d0				;$203c,$00ff,$ffff	;ffd1c2
	and.l	d3,d0					;$c083			;ffd1c8
	movep.l	d0,($0017,a6)				;$01ce,$0017		;ffd1ca
	move.b	($000b,a6),d0				;$102e,$000b		;ffd1ce
	andi.b	#$07,d0					;$0200,$0007		;ffd1d2
	move.b	d0,($0011,a6)				;$1d40,$0011		;ffd1d6
Lffd1da:									;ffd1da
	tst.b	($000b,a6)				;$4a2e,$000b		;ffd1da
	bpl.s	Lffd1da					;$6afa			;ffd1de
	move.b	(a2),(a2)				;$1492			;ffd1e0
	move.b	#$80,($0005,a6)				;$1d7c,$0080,$0005	;ffd1e2
Lffd1e8:									;ffd1e8
	move.b	(a3),d0					;$1013			;ffd1e8
	andi.b	#$f0,d0					;$0200,$00f0		;ffd1ea
	cmp.b	#$70,d0					;$b03c,$0070		;ffd1ee
	beq.s	Lffd202					;$670e			;ffd1f2
	cmp.b	#$b0,d0					;$b03c,$00b0		;ffd1f4
	bne.s	Lffd1e8					;$66ee			;ffd1f8
	move.l	d3,d0					;$2003			;ffd1fa
	lsr.l	#3,d0					;$e688			;ffd1fc
	beq.s	Lffd234					;$6734			;ffd1fe
	move.l	d0,d2					;$2400			;ffd200
Lffd202:									;ffd202
	tst.b	(a2)					;$4a12			;ffd202
	bne.s	Lffd24c					;$6646			;ffd204
	btst.b	#$00,(a3)				;$0813,$0000		;ffd206
	beq.s	Lffd202					;$67f6			;ffd20a
	move.l	(a1)+,d0				;$2019			;ffd20c
	move.b	d0,d1					;$1200			;ffd20e
	rol.l	#8,d0					;$e198			;ffd210
	move.b	d0,(a4)					;$1880			;ffd212
	rol.l	#8,d0					;$e198			;ffd214
	move.b	d0,(a4)					;$1880			;ffd216
	rol.l	#8,d0					;$e198			;ffd218
	move.b	d0,(a4)					;$1880			;ffd21a
	move.b	d1,(a4)					;$1881			;ffd21c
	move.l	(a1)+,d0				;$2019			;ffd21e
	move.b	d0,d1					;$1200			;ffd220
	rol.l	#8,d0					;$e198			;ffd222
	move.b	d0,(a4)					;$1880			;ffd224
	rol.l	#8,d0					;$e198			;ffd226
	move.b	d0,(a4)					;$1880			;ffd228
	rol.l	#8,d0					;$e198			;ffd22a
	move.b	d0,(a4)					;$1880			;ffd22c
	move.b	d1,(a4)					;$1881			;ffd22e
	subq.l	#1,d2					;$5382			;ffd230
	bne.s	Lffd202					;$66ce			;ffd232
Lffd234:									;ffd234
	and.w	#$0007,d3				;$c67c,$0007		;ffd234
	beq.s	Lffd24c					;$6712			;ffd238
	subq.w	#1,d3					;$5343			;ffd23a
Lffd23c:									;ffd23c
	tst.b	(a2)					;$4a12			;ffd23c
	bne.s	Lffd24c					;$660c			;ffd23e
	btst.b	#$01,(a3)				;$0813,$0001		;ffd240
	bne.s	Lffd23c					;$66f6			;ffd244
	move.b	(a1)+,(a4)				;$1899			;ffd246
	dbra.w	d3,Lffd23c				;$51cb,$fff2		;ffd248
Lffd24c:									;ffd24c
	move.b	(a2),d0					;$1012			;ffd24c
	beq.s	Lffd24c					;$67fc			;ffd24e
	move.b	d0,(a2)					;$1480			;ffd250
	cmp.b	#$10,d0					;$b03c,$0010		;ffd252
	bne.s	Lffd25a					;$6602			;ffd256
	moveq.l	#$00,d0					;$7000			;ffd258
Lffd25a:									;ffd25a
	movem.l	(a7)+,d1-d4/a1-a4			;$4cdf,$1e1e		;ffd25a
	rts						;$4e75			;ffd25e

Lffd260:									;ffd260
	movem.l	d1-d3/a1-a4,-(a7)			;$48e7,$7078		;ffd260
	lea.l	($0009,a6),a2				;$45ee,$0009		;ffd264
	lea.l	($000d,a6),a3				;$47ee,$000d		;ffd268
	lea.l	($0015,a6),a4				;$49ee,$0015		;ffd26c
	tst.l	d3					;$4a83			;ffd270
	bne.s	Lffd278					;$6604			;ffd272
	move.w	#$0100,d3				;$363c,$0100		;ffd274
Lffd278:									;ffd278
	move.b	($000b,a6),d0				;$102e,$000b		;ffd278
	andi.b	#$07,d0					;$0200,$0007		;ffd27c
	move.b	d0,($0011,a6)				;$1d40,$0011		;ffd280
	move.l	#Lffffff,d0				;$203c,$00ff,$ffff	;ffd284
	and.l	d3,d0					;$c083			;ffd28a
	movep.l	d0,($0017,a6)				;$01ce,$0017		;ffd28c
	move.b	(a2),(a2)				;$1492			;ffd290
	move.b	#$80,($0005,a6)				;$1d7c,$0080,$0005	;ffd292
Lffd298:									;ffd298
	move.b	(a3),d0					;$1013			;ffd298
	andi.b	#$f0,d0					;$0200,$00f0		;ffd29a
	cmp.b	#$70,d0					;$b03c,$0070		;ffd29e
	beq.s	Lffd2ba					;$6716			;ffd2a2
	cmp.b	#$b0,d0					;$b03c,$00b0		;ffd2a4
	bne.s	Lffd298					;$66ee			;ffd2a8
	tst.b	($00ed0070)				;$4a39,$00ed,$0070	;ffd2aa
	bmi.s	Lffd314					;$6b62			;ffd2b0
Lffd2b2:									;ffd2b2
	move.l	d3,d0					;$2003			;ffd2b2
	lsr.l	#3,d0					;$e688			;ffd2b4
	beq.s	Lffd2e8					;$6730			;ffd2b6
	move.l	d0,d2					;$2400			;ffd2b8
Lffd2ba:									;ffd2ba
	tst.b	(a2)					;$4a12			;ffd2ba
	bne.s	Lffd300					;$6642			;ffd2bc
	btst.b	#$01,(a3)				;$0813,$0001		;ffd2be
	beq.s	Lffd2ba					;$67f6			;ffd2c2
	move.b	(a4),d0					;$1014			;ffd2c4
	lsl.l	#8,d0					;$e188			;ffd2c6
	move.b	(a4),d0					;$1014			;ffd2c8
	lsl.l	#8,d0					;$e188			;ffd2ca
	move.b	(a4),d0					;$1014			;ffd2cc
	lsl.l	#8,d0					;$e188			;ffd2ce
	move.b	(a4),d0					;$1014			;ffd2d0
	move.l	d0,(a1)+				;$22c0			;ffd2d2
	move.b	(a4),d0					;$1014			;ffd2d4
	lsl.l	#8,d0					;$e188			;ffd2d6
	move.b	(a4),d0					;$1014			;ffd2d8
	lsl.l	#8,d0					;$e188			;ffd2da
	move.b	(a4),d0					;$1014			;ffd2dc
	lsl.l	#8,d0					;$e188			;ffd2de
	move.b	(a4),d0					;$1014			;ffd2e0
	move.l	d0,(a1)+				;$22c0			;ffd2e2
	subq.l	#1,d2					;$5382			;ffd2e4
	bne.s	Lffd2ba					;$66d2			;ffd2e6
Lffd2e8:									;ffd2e8
	and.w	#$0007,d3				;$c67c,$0007		;ffd2e8
	beq.s	Lffd300					;$6712			;ffd2ec
	subq.w	#1,d3					;$5343			;ffd2ee
Lffd2f0:									;ffd2f0
	tst.b	(a2)					;$4a12			;ffd2f0
	bne.s	Lffd300					;$660c			;ffd2f2
	btst.b	#$00,(a3)				;$0813,$0000		;ffd2f4
	bne.s	Lffd2f0					;$66f6			;ffd2f8
	move.b	(a4),(a1)+				;$12d4			;ffd2fa
	dbra.w	d3,Lffd2f0				;$51cb,$fff2		;ffd2fc
Lffd300:									;ffd300
	move.b	(a2),d0					;$1012			;ffd300
	beq.s	Lffd300					;$67fc			;ffd302
	move.b	d0,(a2)					;$1480			;ffd304
	cmp.b	#$10,d0					;$b03c,$0010		;ffd306
	bne.s	Lffd30e					;$6602			;ffd30a
	moveq.l	#$00,d0					;$7000			;ffd30c
Lffd30e:									;ffd30e
	movem.l	(a7)+,d1-d3/a1-a4			;$4cdf,$1e0e		;ffd30e
	rts						;$4e75			;ffd312

Lffd314:									;ffd314
	moveq.l	#$00,d2					;$7400			;ffd314
	move.w	($0cc0),d2				;$3438,$0cc0		;ffd316
	cmp.l	d2,d3					;$b682			;ffd31a
	bcs.s	Lffd2b2					;$6594			;ffd31c
	divu.w	d2,d3					;$86c2			;ffd31e
	lsr.l	#4,d2					;$e88a			;ffd320
	subq.l	#1,d2					;$5382			;ffd322
Lffd324:									;ffd324
	tst.b	(a2)					;$4a12			;ffd324
	bne.s	Lffd300					;$66d8			;ffd326
	btst.b	#$01,(a3)				;$0813,$0001		;ffd328
	beq.s	Lffd324					;$67f6			;ffd32c
	move.w	d2,d1					;$3202			;ffd32e
Lffd330:									;ffd330
	move.b	(a4),d0					;$1014			;ffd330
	lsl.l	#8,d0					;$e188			;ffd332
	move.b	(a4),d0					;$1014			;ffd334
	lsl.l	#8,d0					;$e188			;ffd336
	move.b	(a4),d0					;$1014			;ffd338
	lsl.l	#8,d0					;$e188			;ffd33a
	move.b	(a4),d0					;$1014			;ffd33c
	move.l	d0,(a1)+				;$22c0			;ffd33e
	move.b	(a4),d0					;$1014			;ffd340
	lsl.l	#8,d0					;$e188			;ffd342
	move.b	(a4),d0					;$1014			;ffd344
	lsl.l	#8,d0					;$e188			;ffd346
	move.b	(a4),d0					;$1014			;ffd348
	lsl.l	#8,d0					;$e188			;ffd34a
	move.b	(a4),d0					;$1014			;ffd34c
	move.l	d0,(a1)+				;$22c0			;ffd34e
	move.b	(a4),d0					;$1014			;ffd350
	lsl.l	#8,d0					;$e188			;ffd352
	move.b	(a4),d0					;$1014			;ffd354
	lsl.l	#8,d0					;$e188			;ffd356
	move.b	(a4),d0					;$1014			;ffd358
	lsl.l	#8,d0					;$e188			;ffd35a
	move.b	(a4),d0					;$1014			;ffd35c
	move.l	d0,(a1)+				;$22c0			;ffd35e
	move.b	(a4),d0					;$1014			;ffd360
	lsl.l	#8,d0					;$e188			;ffd362
	move.b	(a4),d0					;$1014			;ffd364
	lsl.l	#8,d0					;$e188			;ffd366
	move.b	(a4),d0					;$1014			;ffd368
	lsl.l	#8,d0					;$e188			;ffd36a
	move.b	(a4),d0					;$1014			;ffd36c
	move.l	d0,(a1)+				;$22c0			;ffd36e
	dbra.w	d1,Lffd330				;$51c9,$ffbe		;ffd370
	subq.w	#1,d3					;$5343			;ffd374
	bne.s	Lffd324					;$66ac			;ffd376
	swap.w	d3					;$4843			;ffd378
	bra.w	Lffd2b2					;$6000,$ff36		;ffd37a
Lffd37e:									;ffd37e
	movem.l	d1-d3/a1-a3,-(a7)			;$48e7,$7070		;ffd37e
	lea.l	($000b,a6),a2				;$45ee,$000b		;ffd382
	lea.l	($0005,a6),a3				;$47ee,$0005		;ffd386
	moveq.l	#$ec,d1					;$72ec			;ffd38a
	moveq.l	#$cc,d2					;$74cc			;ffd38c
Lffd38e:									;ffd38e
	move.b	(a2),d0					;$1012			;ffd38e
	andi.b	#$07,d0					;$0200,$0007		;ffd390
	move.b	d0,($0011,a6)				;$1d40,$0011		;ffd394
Lffd398:									;ffd398
	tst.b	(a2)					;$4a12			;ffd398
	bpl.s	Lffd398					;$6afc			;ffd39a
	move.b	(a1)+,($0017,a6)			;$1d59,$0017		;ffd39c
	move.b	d1,(a3)					;$1681			;ffd3a0
Lffd3a2:									;ffd3a2
	tst.b	(a2)					;$4a12			;ffd3a2
	bmi.s	Lffd3a2					;$6bfc			;ffd3a4
	move.b	d2,(a3)					;$1682			;ffd3a6
	subq.l	#1,d3					;$5383			;ffd3a8
	bne.s	Lffd38e					;$66e2			;ffd3aa
	moveq.l	#$00,d0					;$7000			;ffd3ac
	movem.l	(a7)+,d1-d3/a1-a3			;$4cdf,$0e0e		;ffd3ae
	rts						;$4e75			;ffd3b2

Lffd3b4:									;ffd3b4
	movem.l	d1-d3/a1-a3,-(a7)			;$48e7,$7070		;ffd3b4
	lea.l	($000b,a6),a2				;$45ee,$000b		;ffd3b8
	lea.l	($0005,a6),a3				;$47ee,$0005		;ffd3bc
	moveq.l	#$ec,d1					;$72ec			;ffd3c0
	moveq.l	#$cc,d2					;$74cc			;ffd3c2
Lffd3c4:									;ffd3c4
	move.b	(a2),d0					;$1012			;ffd3c4
	andi.b	#$07,d0					;$0200,$0007		;ffd3c6
	move.b	d0,($0011,a6)				;$1d40,$0011		;ffd3ca
Lffd3ce:									;ffd3ce
	tst.b	(a2)					;$4a12			;ffd3ce
	bpl.s	Lffd3ce					;$6afc			;ffd3d0
	move.b	d1,(a3)					;$1681			;ffd3d2
Lffd3d4:									;ffd3d4
	tst.b	(a2)					;$4a12			;ffd3d4
	bmi.s	Lffd3d4					;$6bfc			;ffd3d6
	move.b	($0017,a6),(a1)+			;$12ee,$0017		;ffd3d8
	move.b	d2,(a3)					;$1682			;ffd3dc
	subq.l	#1,d3					;$5383			;ffd3de
	bne.s	Lffd3c4					;$66e2			;ffd3e0
	moveq.l	#$00,d0					;$7000			;ffd3e2
	movem.l	(a7)+,d1-d3/a1-a3			;$4cdf,$0e0e		;ffd3e4
	rts						;$4e75			;ffd3e8

Lffd3ea:									;ffd3ea
	.dc.b	$00,$00,$00,$00,$00,$00						;ffd3ea
Lffd3f0:									;ffd3f0
	link.w	a5,#-$0010				;$4e55,$fff0		;ffd3f0
	movem.l	d1/d3/d6/a1-a3,-(a7)			;$48e7,$5270		;ffd3f4
	lea.l	(Lffd3ea,pc),a2				;$45fa,$fff0		;ffd3f8
	bsr.w	Lffd50e					;$6100,$0110		;ffd3fc
	movem.l	(a7)+,d1/d3/d6/a1-a3			;$4cdf,$0e4a		;ffd400
	unlk	a5					;$4e5d			;ffd404
	rts						;$4e75			;ffd406

Lffd408:									;ffd408
	.dc.b	$01,$00,$00,$00,$00,$00						;ffd408
Lffd40e:									;ffd40e
	link.w	a5,#-$0010				;$4e55,$fff0		;ffd40e
	movem.l	d1/d3/d6/a1-a3,-(a7)			;$48e7,$5270		;ffd412
	lea.l	(Lffd408,pc),a2				;$45fa,$fff0		;ffd416
	bsr.w	Lffd50e					;$6100,$00f2		;ffd41a
	movem.l	(a7)+,d1/d3/d6/a1-a3			;$4cdf,$0e4a		;ffd41e
	unlk	a5					;$4e5d			;ffd422
	rts						;$4e75			;ffd424

Lffd426:									;ffd426
	.dc.b	$08,$00,$00,$00,$00,$00,$4e,$55					;ffd426
	.dc.b	$ff,$f0,$48,$e7,$52,$70,$26,$49					;ffd42e
	.dc.b	$43,$ed,$ff,$f0,$45,$fa,$ff,$ea					;ffd436
	.dc.b	$72,$05,$12,$da,$51,$c9,$ff,$fc					;ffd43e
	.dc.b	$43,$ed,$ff,$f0,$2c,$02,$cc,$bc					;ffd446
	.dc.b	$00,$ff,$ff,$ff,$8d,$91,$13,$43					;ffd44e
	.dc.b	$00,$04,$61,$00,$00,$84,$4a,$80					;ffd456
	.dc.b	$66,$7a,$e1,$8b,$eb,$ab,$22,$4b					;ffd45e
	.dc.b	$61,$00,$01,$58,$0c,$80,$ff,$ff					;ffd466
	.dc.b	$ff,$ff,$67,$68,$0c,$80,$ff,$ff					;ffd46e
	.dc.b	$ff,$fe,$67,$0c,$61,$00,$00,$a8					;ffd476
Lffd47e:									;ffd47e
	movem.l	(a7)+,d1/d3/d6/a1-a3			;$4cdf,$0e4a		;ffd47e
	unlk	a5					;$4e5d			;ffd482
	rts						;$4e75			;ffd484

Lffd486:									;ffd486
	bsr.w	Lffd524					;$6100,$009c		;ffd486
	tst.l	d0					;$4a80			;ffd48a
	bne.s	Lffd47e					;$66f0			;ffd48c
	moveq.l	#$fe,d0					;$70fe			;ffd48e
	bra.s	Lffd47e					;$60ec			;ffd490
Lffd492:									;ffd492
	.dc.b	$25,$00,$00,$00,$00,$00,$00,$00					;ffd492
	.dc.b	$00,$00,$4e,$55,$ff,$f0,$48,$e7					;ffd49a
	.dc.b	$52,$70,$26,$49,$43,$ed,$ff,$f0					;ffd4a2
	.dc.b	$45,$fa,$ff,$e6,$72,$09,$12,$da					;ffd4aa
	.dc.b	$51,$c9,$ff,$fc,$43,$ed,$ff,$f0					;ffd4b2
	.dc.b	$61,$22,$4a,$80,$66,$1a,$22,$4b					;ffd4ba
	.dc.b	$76,$08,$61,$00,$fb,$a0,$0c,$80					;ffd4c2
	.dc.b	$ff,$ff,$ff,$ff,$67,$0a,$61,$52					;ffd4ca
Lffd4d2:									;ffd4d2
	movem.l	(a7)+,d1/d3/d6/a1-a3			;$4cdf,$0e4a		;ffd4d2
	unlk	a5					;$4e5d			;ffd4d6
	rts						;$4e75			;ffd4d8

Lffd4da:									;ffd4da
	moveq.l	#$ff,d0					;$70ff			;ffd4da
	bra.s	Lffd4d2					;$60f4			;ffd4dc
Lffd4de:									;ffd4de
	movem.l	d1/d4,-(a7)				;$48e7,$4800		;ffd4de
	move.w	#$0001,d1				;$323c,$0001		;ffd4e2
Lffd4e6:									;ffd4e6
	bsr.w	Lffcefc					;$6100,$fa14		;ffd4e6
	tst.l	d0					;$4a80			;ffd4ea
	dbeq.w	d1,Lffd4e6				;$57c9,$fff8		;ffd4ec
	bne.s	Lffd50a					;$6618			;ffd4f0
	swap.w	d4					;$4844			;ffd4f2
	lsl.b	#5,d4					;$eb0c			;ffd4f4
	or.b	d4,($0001,a1)				;$8929,$0001		;ffd4f6
	bsr.w	Lffcfca					;$6100,$face		;ffd4fa
	tst.l	d0					;$4a80			;ffd4fe
	bne.s	Lffd50a					;$6608			;ffd500
	moveq.l	#$00,d0					;$7000			;ffd502
Lffd504:									;ffd504
	movem.l	(a7)+,d1/d4				;$4cdf,$0012		;ffd504
	rts						;$4e75			;ffd508

Lffd50a:									;ffd50a
	moveq.l	#$ff,d0					;$70ff			;ffd50a
	bra.s	Lffd504					;$60f6			;ffd50c
Lffd50e:									;ffd50e
	lea.l	(-$0010,a5),a1				;$43ed,$fff0		;ffd50e
	moveq.l	#$05,d1					;$7205			;ffd512
Lffd514:									;ffd514
	move.b	(a2)+,(a1)+				;$12da			;ffd514
	dbra.w	d1,Lffd514				;$51c9,$fffc		;ffd516
	lea.l	(-$0010,a5),a1				;$43ed,$fff0		;ffd51a
	bsr.s	Lffd4de					;$61be			;ffd51e
	tst.l	d0					;$4a80			;ffd520
	bne.s	Lffd548					;$6624			;ffd522
Lffd524:									;ffd524
	lea.l	(-$0001,a5),a1				;$43ed,$ffff		;ffd524
	bsr.w	Lffd0aa					;$6100,$fb80		;ffd528
	tst.l	d0					;$4a80			;ffd52c
	bne.s	Lffd548					;$6618			;ffd52e
	lea.l	(-$0002,a5),a1				;$43ed,$fffe		;ffd530
	bsr.w	Lffd0e8					;$6100,$fbb2		;ffd534
	tst.l	d0					;$4a80			;ffd538
	bne.s	Lffd548					;$660c			;ffd53a
	move.b	(-$0002,a5),d0				;$102d,$fffe		;ffd53c
	swap.w	d0					;$4840			;ffd540
	move.b	(-$0001,a5),d0				;$102d,$ffff		;ffd542
	rts						;$4e75			;ffd546

Lffd548:									;ffd548
	moveq.l	#$ff,d0					;$70ff			;ffd548
	rts						;$4e75			;ffd54a

Lffd54c:									;ffd54c
	movem.l	d0-d2/a0,-(a7)				;$48e7,$e080		;ffd54c
	lea.l	($00e88023),a0				;$41f9,$00e8,$8023	;ffd550
	moveq.l	#$00,d1					;$7200			;ffd556
	move.b	(a0),d1					;$1210			;ffd558
	move.b	(a0),d1					;$1210			;ffd55a
Lffd55c:									;ffd55c
	moveq.l	#$00,d2					;$7400			;ffd55c
	move.b	(a0),d2					;$1410			;ffd55e
	cmp.b	(a0),d2					;$b410			;ffd560
	bcs.s	Lffd55c					;$65f8			;ffd562
	sub.w	d2,d1					;$9242			;ffd564
	bcc.s	Lffd56c					;$6404			;ffd566
	add.w	#$00c8,d1				;$d27c,$00c8		;ffd568
Lffd56c:									;ffd56c
	exg.l	d1,d2					;$c342			;ffd56c
	sub.l	d2,d0					;$9082			;ffd56e
	bhi.s	Lffd55c					;$62ea			;ffd570
	movem.l	(a7)+,d0-d2/a0				;$4cdf,$0107		;ffd572
	rts						;$4e75			;ffd576

Lffd578:									;ffd578
	movem.l	a6,-(a7)				;$48e7,$0002		;ffd578
	movea.l	(Lff933c,pc),a6				;$2c7a,$bdbe		;ffd57c
Lffd580:									;ffd580
	move.b	($0009,a6),d0				;$102e,$0009		;ffd580
	btst.l	#$05,d0					;$0800,$0005		;ffd584
	bne.s	Lffd5b8					;$662e			;ffd588
	btst.l	#$03,d0					;$0800,$0003		;ffd58a
	bne.s	Lffd5b2					;$6622			;ffd58e
	move.b	($000b,a6),d0				;$102e,$000b		;ffd590
	bpl.s	Lffd580					;$6aea			;ffd594
	andi.b	#$07,d0					;$0200,$0007		;ffd596
	bne.s	Lffd5b2					;$6616			;ffd59a
	bsr.w	Lffdb20					;$6100,$0582		;ffd59c
	swap.w	d0					;$4840			;ffd5a0
	bne.s	Lffd5aa					;$6606			;ffd5a2
Lffd5a4:									;ffd5a4
	movem.l	(a7)+,a6				;$4cdf,$4000		;ffd5a4
	rts						;$4e75			;ffd5a8

Lffd5aa:									;ffd5aa
	tst.w	d0					;$4a40			;ffd5aa
	beq.s	Lffd5b2					;$6704			;ffd5ac
	swap.w	d0					;$4840			;ffd5ae
	bra.s	Lffd5a4					;$60f2			;ffd5b0
Lffd5b2:									;ffd5b2
	move.b	($000b,a6),d0				;$102e,$000b		;ffd5b2
	bra.s	Lffd5a4					;$60ec			;ffd5b6
Lffd5b8:									;ffd5b8
	bsr.w	Lffce0e					;$6100,$f854		;ffd5b8
	moveq.l	#$ff,d0					;$70ff			;ffd5bc
	bra.s	Lffd5a4					;$60e4			;ffd5be
Lffd5c0:									;ffd5c0
	movem.l	a6,-(a7)				;$48e7,$0002		;ffd5c0
	movea.l	(Lff933c,pc),a6				;$2c7a,$bd76		;ffd5c4
Lffd5c8:									;ffd5c8
	move.b	($0009,a6),d0				;$102e,$0009		;ffd5c8
	btst.l	#$05,d0					;$0800,$0005		;ffd5cc
	bne.s	Lffd604					;$6632			;ffd5d0
	btst.l	#$03,d0					;$0800,$0003		;ffd5d2
	bne.s	Lffd5fe					;$6626			;ffd5d6
	move.b	($000b,a6),d0				;$102e,$000b		;ffd5d8
	bpl.s	Lffd5c8					;$6aea			;ffd5dc
	andi.b	#$07,d0					;$0200,$0007		;ffd5de
	cmpi.b	#$01,d0					;$0c00,$0001		;ffd5e2
	bne.s	Lffd5fe					;$6616			;ffd5e6
	bsr.w	Lffdb76					;$6100,$058c		;ffd5e8
	swap.w	d0					;$4840			;ffd5ec
	bne.s	Lffd5f6					;$6606			;ffd5ee
Lffd5f0:									;ffd5f0
	movem.l	(a7)+,a6				;$4cdf,$4000		;ffd5f0
	rts						;$4e75			;ffd5f4

Lffd5f6:									;ffd5f6
	tst.w	d0					;$4a40			;ffd5f6
	beq.s	Lffd5fe					;$6704			;ffd5f8
	swap.w	d0					;$4840			;ffd5fa
	bra.s	Lffd5f0					;$60f2			;ffd5fc
Lffd5fe:									;ffd5fe
	move.b	($000b,a6),d0				;$102e,$000b		;ffd5fe
	bra.s	Lffd5f0					;$60ec			;ffd602
Lffd604:									;ffd604
	bsr.w	Lffce0e					;$6100,$f808		;ffd604
	moveq.l	#$ff,d0					;$70ff			;ffd608
	bra.s	Lffd5f0					;$60e4			;ffd60a
Lffd60c:									;ffd60c
	.dc.b	$12,$00,$00,$00,$00,$00,$4e,$55					;ffd60c
	.dc.b	$ff,$f0,$48,$e7,$52,$70,$26,$49					;ffd614
	.dc.b	$43,$ed,$ff,$f0,$45,$fa,$ff,$ea					;ffd61c
	.dc.b	$72,$05,$12,$da,$51,$c9,$ff,$fc					;ffd624
	.dc.b	$43,$ed,$ff,$f0,$13,$43,$00,$04					;ffd62c
	.dc.b	$61,$00,$fe,$a8,$4a,$80,$66,$00					;ffd634
	.dc.b	$02,$a4,$22,$4b,$61,$00,$fa,$24					;ffd63c
	.dc.b	$60,$00,$02,$92,$03,$00,$00,$00					;ffd644
	.dc.b	$00,$00,$4e,$55,$ff,$f0,$48,$e7					;ffd64c
	.dc.b	$52,$70,$26,$49,$43,$ed,$ff,$f0					;ffd654
	.dc.b	$45,$fa,$ff,$ea,$72,$05,$12,$da					;ffd65c
	.dc.b	$51,$c9,$ff,$fc,$43,$ed,$ff,$f0					;ffd664
	.dc.b	$13,$43,$00,$04,$61,$00,$fe,$6c					;ffd66c
	.dc.b	$4a,$80,$66,$00,$02,$68,$22,$4b					;ffd674
	.dc.b	$61,$00,$f9,$e8,$60,$00,$02,$56					;ffd67c
	.dc.b	$1a,$00,$00,$00,$00,$00,$4e,$55					;ffd684
	.dc.b	$ff,$f0,$48,$e7,$52,$70,$26,$49					;ffd68c
	.dc.b	$43,$ed,$ff,$f0,$45,$fa,$ff,$ea					;ffd694
	.dc.b	$72,$05,$12,$da,$51,$c9,$ff,$fc					;ffd69c
	.dc.b	$43,$ed,$ff,$f0,$13,$43,$00,$04					;ffd6a4
	.dc.b	$13,$42,$00,$02,$61,$00,$fe,$2c					;ffd6ac
	.dc.b	$4a,$80,$66,$00,$02,$28,$22,$4b					;ffd6b4
	.dc.b	$61,$00,$f9,$a8,$60,$00,$02,$16					;ffd6bc
	.dc.b	$15,$00,$00,$00,$00,$00,$4e,$55					;ffd6c4
	.dc.b	$ff,$f0,$48,$e7,$52,$70,$26,$49					;ffd6cc
	.dc.b	$43,$ed,$ff,$f0,$45,$fa,$ff,$ea					;ffd6d4
	.dc.b	$72,$05,$12,$da,$51,$c9,$ff,$fc					;ffd6dc
	.dc.b	$43,$ed,$ff,$f0,$13,$43,$00,$04					;ffd6e4
	.dc.b	$13,$42,$00,$01,$61,$00,$fd,$ec					;ffd6ec
	.dc.b	$4a,$80,$66,$00,$01,$e8,$22,$4b					;ffd6f4
	.dc.b	$61,$00,$f9,$28,$60,$00,$01,$d6					;ffd6fc
	.dc.b	$07,$00,$00,$00,$00,$00,$4e,$55					;ffd704
	.dc.b	$ff,$f0,$48,$e7,$52,$70,$26,$49					;ffd70c
	.dc.b	$43,$ed,$ff,$f0,$45,$fa,$ff,$ea					;ffd714
	.dc.b	$72,$05,$12,$da,$51,$c9,$ff,$fc					;ffd71c
	.dc.b	$43,$ed,$ff,$f0,$61,$00,$fd,$b4					;ffd724
	.dc.b	$4a,$80,$66,$00,$01,$b0,$22,$4b					;ffd72c
	.dc.b	$61,$00,$f8,$f0,$60,$00,$01,$9e					;ffd734
Lffd73c:									;ffd73c
	.dc.b	$08,$00,$00,$00,$00,$00						;ffd73c
Lffd742:									;ffd742
	link.w	a5,#-$0010				;$4e55,$fff0		;ffd742
	movem.l	d1/d3/d6/a1-a3,-(a7)			;$48e7,$5270		;ffd746
	movea.l	a1,a3					;$2649			;ffd74a
	lea.l	(-$0010,a5),a1				;$43ed,$fff0		;ffd74c
	lea.l	(Lffd73c,pc),a2				;$45fa,$ffea		;ffd750
	moveq.l	#$05,d1					;$7205			;ffd754
Lffd756:									;ffd756
	move.b	(a2)+,(a1)+				;$12da			;ffd756
	dbra.w	d1,Lffd756				;$51c9,$fffc		;ffd758
	lea.l	(-$0010,a5),a1				;$43ed,$fff0		;ffd75c
	move.l	d2,d6					;$2c02			;ffd760
	and.l	#Lffffff,d6				;$ccbc,$00ff,$ffff	;ffd762
	or.l	d6,(a1)					;$8d91			;ffd768
	move.b	d3,($0004,a1)				;$1343,$0004		;ffd76a
	bsr.w	Lffd4de					;$6100,$fd6e		;ffd76e
	tst.l	d0					;$4a80			;ffd772
	bne.w	Lffd8e0					;$6600,$016a		;ffd774
	lsl.l	#8,d3					;$e18b			;ffd778
	lsl.l	d5,d3					;$ebab			;ffd77a
	movea.l	a3,a1					;$224b			;ffd77c
	lea.l	(Lffd5c0,pc),a0				;$41fa,$fe40		;ffd77e
	btst.b	#$04,($00ed0070)			;$0839,$0004,$00ed,$0070	;ffd782
	beq.s	Lffd790					;$6704			;ffd78a
	lea.l	(Lffd066,pc),a0				;$41fa,$f8d8		;ffd78c
Lffd790:									;ffd790
	jsr	(a0)					;$4e90			;ffd790
	bra.w	Lffd8b6					;$6000,$0122		;ffd792
Lffd796:									;ffd796
	.dc.b	$0a,$00,$00,$00,$00,$00						;ffd796
Lffd79c:									;ffd79c
	link.w	a5,#-$0010				;$4e55,$fff0		;ffd79c
	movem.l	d1/d3/d6/a1-a3,-(a7)			;$48e7,$5270		;ffd7a0
	movea.l	a1,a3					;$2649			;ffd7a4
	lea.l	(-$0010,a5),a1				;$43ed,$fff0		;ffd7a6
	lea.l	(Lffd796,pc),a2				;$45fa,$ffea		;ffd7aa
	moveq.l	#$05,d1					;$7205			;ffd7ae
Lffd7b0:									;ffd7b0
	move.b	(a2)+,(a1)+				;$12da			;ffd7b0
	dbra.w	d1,Lffd7b0				;$51c9,$fffc		;ffd7b2
	lea.l	(-$0010,a5),a1				;$43ed,$fff0		;ffd7b6
	move.l	d2,d6					;$2c02			;ffd7ba
	and.l	#Lffffff,d6				;$ccbc,$00ff,$ffff	;ffd7bc
	or.l	d6,(a1)					;$8d91			;ffd7c2
	move.b	d3,($0004,a1)				;$1343,$0004		;ffd7c4
	bsr.w	Lffd4de					;$6100,$fd14		;ffd7c8
	tst.l	d0					;$4a80			;ffd7cc
	bne.w	Lffd8e0					;$6600,$0110		;ffd7ce
	lsl.l	#8,d3					;$e18b			;ffd7d2
	lsl.l	d5,d3					;$ebab			;ffd7d4
	movea.l	a3,a1					;$224b			;ffd7d6
	lea.l	(Lffd578,pc),a0				;$41fa,$fd9e		;ffd7d8
	btst.b	#$04,($00ed0070)			;$0839,$0004,$00ed,$0070	;ffd7dc
	beq.s	Lffd7ea					;$6704			;ffd7e4
	lea.l	(Lffd026,pc),a0				;$41fa,$f83e		;ffd7e6
Lffd7ea:									;ffd7ea
	jsr	(a0)					;$4e90			;ffd7ea
	bra.w	Lffd8b6					;$6000,$00c8		;ffd7ec
Lffd7f0:									;ffd7f0
	.dc.b	$28,$00,$00,$00,$00,$00,$00,$00					;ffd7f0
	.dc.b	$00,$00,$4e,$55,$ff,$f0,$48,$e7					;ffd7f8
	.dc.b	$52,$70,$4a,$43,$67,$00,$00,$da					;ffd800
	.dc.b	$26,$49,$43,$ed,$ff,$f0,$45,$fa					;ffd808
	.dc.b	$ff,$e0,$72,$09,$12,$da,$51,$c9					;ffd810
	.dc.b	$ff,$fc,$43,$ed,$ff,$f0,$2c,$03					;ffd818
	.dc.b	$23,$42,$00,$02,$13,$43,$00,$08					;ffd820
	.dc.b	$e0,$8b,$13,$43,$00,$07,$61,$00					;ffd828
	.dc.b	$fc,$ae,$4a,$80,$66,$00,$00,$aa					;ffd830
	.dc.b	$26,$06,$e1,$8b,$eb,$ab,$22,$4b					;ffd838
	.dc.b	$41,$fa,$fd,$7e,$08,$39,$00,$04					;ffd840
	.dc.b	$00,$ed,$00,$70,$67,$04,$41,$fa					;ffd848
	.dc.b	$f8,$16,$4e,$90,$60,$60,$2a,$00					;ffd850
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00					;ffd858
	.dc.b	$4e,$55,$ff,$f0,$48,$e7,$52,$70					;ffd860
	.dc.b	$4a,$43,$67,$74,$26,$49,$43,$ed					;ffd868
	.dc.b	$ff,$f0,$45,$fa,$ff,$e2,$72,$09					;ffd870
	.dc.b	$12,$da,$51,$c9,$ff,$fc,$43,$ed					;ffd878
	.dc.b	$ff,$f0,$2c,$03,$23,$42,$00,$02					;ffd880
	.dc.b	$13,$43,$00,$08,$e0,$8b,$13,$43					;ffd888
	.dc.b	$00,$07,$61,$00,$fc,$4a,$4a,$80					;ffd890
	.dc.b	$66,$46,$26,$06,$e1,$8b,$eb,$ab					;ffd898
	.dc.b	$22,$4b,$41,$fa,$fc,$d4,$08,$39					;ffd8a0
	.dc.b	$00,$04,$00,$ed,$00,$70,$67,$04					;ffd8a8
	.dc.b	$41,$fa,$f7,$74,$4e,$90						;ffd8b0
Lffd8b6:									;ffd8b6
	cmpi.l	#$ffffffff,d0				;$0c80,$ffff,$ffff	;ffd8b6
	beq.s	Lffd8e0					;$6722			;ffd8bc
	cmpi.l	#$fffffffe,d0				;$0c80,$ffff,$fffe	;ffd8be
	beq.s	Lffd8e4					;$671e			;ffd8c4
	bra.s	Lffd8cc					;$6004			;ffd8c6
Lffd8c8:									;ffd8c8
	tst.l	d0					;$4a80			;ffd8c8
	bne.s	Lffd8e0					;$6614			;ffd8ca
Lffd8cc:									;ffd8cc
	bsr.w	Lffd524					;$6100,$fc56		;ffd8cc
Lffd8d0:									;ffd8d0
	movem.l	(a7)+,d1/d3/d6/a1-a3			;$4cdf,$0e4a		;ffd8d0
	unlk	a5					;$4e5d			;ffd8d4
	rts						;$4e75			;ffd8d6

Lffd8d8:									;ffd8d8
	cmpi.l	#$ffffffff,d0				;$0c80,$ffff,$ffff	;ffd8d8
	bne.s	Lffd8cc					;$66ec			;ffd8de
Lffd8e0:									;ffd8e0
	moveq.l	#$ff,d0					;$70ff			;ffd8e0
	bra.s	Lffd8d0					;$60ec			;ffd8e2
Lffd8e4:									;ffd8e4
	bsr.w	Lffd524					;$6100,$fc3e		;ffd8e4
	tst.l	d0					;$4a80			;ffd8e8
	bne.s	Lffd8ee					;$6602			;ffd8ea
	moveq.l	#$fe,d0					;$70fe			;ffd8ec
Lffd8ee:									;ffd8ee
	movem.l	(a7)+,d1/d3/d6/a1-a3			;$4cdf,$0e4a		;ffd8ee
	unlk	a5					;$4e5d			;ffd8f2
	rts						;$4e75			;ffd8f4

Lffd8f6:									;ffd8f6
	.dc.b	$2f,$00,$00,$00,$00,$00,$00,$00					;ffd8f6
	.dc.b	$00,$00,$4e,$55,$ff,$f0,$48,$e7					;ffd8fe
	.dc.b	$52,$70,$4a,$43,$67,$d4,$26,$49					;ffd906
	.dc.b	$43,$ed,$ff,$f0,$45,$fa,$ff,$e2					;ffd90e
	.dc.b	$72,$09,$12,$da,$51,$c9,$ff,$fc					;ffd916
	.dc.b	$43,$ed,$ff,$f0,$60,$00,$ff,$5e					;ffd91e
	.dc.b	$04,$00,$00,$00,$00,$00,$4e,$55					;ffd926
	.dc.b	$ff,$f0,$48,$e7,$52,$70,$43,$ed					;ffd92e
	.dc.b	$ff,$f0,$45,$fa,$ff,$ec,$72,$05					;ffd936
	.dc.b	$12,$da,$51,$c9,$ff,$fc,$43,$ed					;ffd93e
	.dc.b	$ff,$f0,$13,$43,$00,$04,$e0,$8b					;ffd946
	.dc.b	$13,$43,$00,$03,$61,$00,$fb,$8a					;ffd94e
	.dc.b	$60,$00,$ff,$70,$1e,$00,$00,$00					;ffd956
	.dc.b	$00,$00,$4e,$55,$ff,$f0,$48,$e7					;ffd95e
	.dc.b	$52,$70,$43,$ed,$ff,$f0,$45,$fa					;ffd966
	.dc.b	$ff,$ec,$72,$05,$12,$da,$51,$c9					;ffd96e
	.dc.b	$ff,$fc,$43,$ed,$ff,$f0,$02,$03					;ffd976
	.dc.b	$00,$01,$13,$43,$00,$04,$61,$00					;ffd97e
	.dc.b	$fb,$58,$60,$00,$ff,$3e,$1b,$00					;ffd986
	.dc.b	$00,$00,$00,$00,$4e,$55,$ff,$f0					;ffd98e
	.dc.b	$48,$e7,$52,$70,$43,$ed,$ff,$f0					;ffd996
	.dc.b	$45,$fa,$ff,$ec,$72,$05,$12,$da					;ffd99e
	.dc.b	$51,$c9,$ff,$fc,$43,$ed,$ff,$f0					;ffd9a6
	.dc.b	$02,$03,$00,$03,$13,$43,$00,$04					;ffd9ae
	.dc.b	$61,$00,$fb,$26,$60,$00,$ff,$0c					;ffd9b6
	.dc.b	$c1,$00,$00,$00,$00,$00,$4e,$55					;ffd9be
	.dc.b	$ff,$f0,$48,$e7,$52,$70,$43,$ed					;ffd9c6
	.dc.b	$ff,$f0,$45,$fa,$ff,$ec,$72,$05					;ffd9ce
	.dc.b	$12,$da,$51,$c9,$ff,$fc,$43,$ed					;ffd9d6
	.dc.b	$ff,$f0,$02,$03,$00,$01,$13,$43					;ffd9de
	.dc.b	$00,$04,$76,$06,$61,$00,$fa,$f2					;ffd9e6
	.dc.b	$60,$00,$fe,$d8							;ffd9ee
Lffd9f2:									;ffd9f2
	.dc.b	$0b,$00,$00,$00,$00,$00						;ffd9f2
Lffd9f8:									;ffd9f8
	link.w	a5,#-$0010				;$4e55,$fff0		;ffd9f8
	movem.l	d1/d3/d6/a1-a3,-(a7)			;$48e7,$5270		;ffd9fc
	lea.l	(-$0010,a5),a1				;$43ed,$fff0		;ffda00
	lea.l	(Lffd9f2,pc),a2				;$45fa,$ffec		;ffda04
	moveq.l	#$05,d1					;$7205			;ffda08
Lffda0a:									;ffda0a
	move.b	(a2)+,(a1)+				;$12da			;ffda0a
	dbra.w	d1,Lffda0a				;$51c9,$fffc		;ffda0c
	lea.l	(-$0010,a5),a1				;$43ed,$fff0		;ffda10
	move.l	d2,d6					;$2c02			;ffda14
	and.l	#Lffffff,d6				;$ccbc,$00ff,$ffff	;ffda16
	or.l	d6,(a1)					;$8d91			;ffda1c
	bsr.w	Lffd4de					;$6100,$fabe		;ffda1e
	bra.w	Lffd8c8					;$6000,$fea4		;ffda22
Lffda26:									;ffda26
	.dc.b	$c2,$00,$00,$00,$00,$00						;ffda26
Lffda2c:									;ffda2c
	link.w	a5,#-$0010				;$4e55,$fff0		;ffda2c
	movem.l	d1/d3/d6/a1-a3,-(a7)			;$48e7,$5270		;ffda30
	movea.l	a1,a3					;$2649			;ffda34
	lea.l	(-$0010,a5),a1				;$43ed,$fff0		;ffda36
	lea.l	(Lffda26,pc),a2				;$45fa,$ffea		;ffda3a
	moveq.l	#$05,d1					;$7205			;ffda3e
Lffda40:									;ffda40
	move.b	(a2)+,(a1)+				;$12da			;ffda40
	dbra.w	d1,Lffda40				;$51c9,$fffc		;ffda42
	lea.l	(-$0010,a5),a1				;$43ed,$fff0		;ffda46
	move.l	d3,d1					;$2203			;ffda4a
	move.b	d1,($0005,a1)				;$1341,$0005		;ffda4c
	moveq.l	#$06,d3					;$7606			;ffda50
	bsr.w	Lffd4de					;$6100,$fa8a		;ffda52
	tst.l	d0					;$4a80			;ffda56
	bne.w	Lffd8e0					;$6600,$fe86		;ffda58
	move.l	d1,d3					;$2601			;ffda5c
	movea.l	a3,a1					;$224b			;ffda5e
	bsr.w	Lffd026					;$6100,$f5c4		;ffda60
	bra.w	Lffd8d8					;$6000,$fe72		;ffda64
Lffda68:									;ffda68
	.dc.b	$06,$00,$00,$00,$00,$00						;ffda68
Lffda6e:									;ffda6e
	link.w	a5,#-$0010				;$4e55,$fff0		;ffda6e
	movem.l	d1/d3/d6/a1-a3,-(a7)			;$48e7,$5270		;ffda72
	lea.l	(-$0010,a5),a1				;$43ed,$fff0		;ffda76
	lea.l	(Lffda68,pc),a2				;$45fa,$ffec		;ffda7a
	moveq.l	#$05,d1					;$7205			;ffda7e
Lffda80:									;ffda80
	move.b	(a2)+,(a1)+				;$12da			;ffda80
	dbra.w	d1,Lffda80				;$51c9,$fffc		;ffda82
	lea.l	(-$0010,a5),a1				;$43ed,$fff0		;ffda86
	move.l	d2,d6					;$2c02			;ffda8a
	and.l	#Lffffff,d6				;$ccbc,$00ff,$ffff	;ffda8c
	or.l	d6,(a1)					;$8d91			;ffda92
	move.b	d3,($0004,a1)				;$1343,$0004		;ffda94
	bsr.w	Lffd4de					;$6100,$fa44		;ffda98
	bra.w	Lffd8c8					;$6000,$fe2a		;ffda9c
Lffdaa0:									;ffdaa0
	.dc.b	$07,$00,$00,$00,$00,$00						;ffdaa0
Lffdaa6:									;ffdaa6
	link.w	a5,#-$0010				;$4e55,$fff0		;ffdaa6
	movem.l	d1/d3/d6/a1-a3,-(a7)			;$48e7,$5270		;ffdaaa
	lea.l	(-$0010,a5),a1				;$43ed,$fff0		;ffdaae
	lea.l	(Lffdaa0,pc),a2				;$45fa,$ffec		;ffdab2
	moveq.l	#$05,d1					;$7205			;ffdab6
Lffdab8:									;ffdab8
	move.b	(a2)+,(a1)+				;$12da			;ffdab8
	dbra.w	d1,Lffdab8				;$51c9,$fffc		;ffdaba
	lea.l	(-$0010,a5),a1				;$43ed,$fff0		;ffdabe
	move.l	d2,d6					;$2c02			;ffdac2
	and.l	#Lffffff,d6				;$ccbc,$00ff,$ffff	;ffdac4
	or.l	d6,(a1)					;$8d91			;ffdaca
	move.b	d3,($0004,a1)				;$1343,$0004		;ffdacc
	bsr.w	Lffd4de					;$6100,$fa0c		;ffdad0
	bra.w	Lffd8c8					;$6000,$fdf2		;ffdad4
Lffdad8:									;ffdad8
	.dc.b	$0e,$00,$00,$00,$00,$00						;ffdad8
Lffdade:									;ffdade
	link.w	a5,#-$0010				;$4e55,$fff0		;ffdade
	movem.l	d1/d3/d6/a1-a3,-(a7)			;$48e7,$5270		;ffdae2
	movea.l	a1,a3					;$2649			;ffdae6
	lea.l	(-$0010,a5),a1				;$43ed,$fff0		;ffdae8
	lea.l	(Lffdad8,pc),a2				;$45fa,$ffea		;ffdaec
	moveq.l	#$05,d1					;$7205			;ffdaf0
Lffdaf2:									;ffdaf2
	move.b	(a2)+,(a1)+				;$12da			;ffdaf2
	dbra.w	d1,Lffdaf2				;$51c9,$fffc		;ffdaf4
	lea.l	(-$0010,a5),a1				;$43ed,$fff0		;ffdaf8
	move.l	d2,d6					;$2c02			;ffdafc
	and.l	#Lffffff,d6				;$ccbc,$00ff,$ffff	;ffdafe
	or.l	d6,(a1)					;$8d91			;ffdb04
	move.b	d3,($0004,a1)				;$1343,$0004		;ffdb06
	bsr.w	Lffd4de					;$6100,$f9d2		;ffdb0a
	tst.l	d0					;$4a80			;ffdb0e
	bne.w	Lffd8e0					;$6600,$fdce		;ffdb10
	moveq.l	#$04,d3					;$7604			;ffdb14
	movea.l	a3,a1					;$224b			;ffdb16
	bsr.w	Lffd026					;$6100,$f50c		;ffdb18
	bra.w	Lffd8d8					;$6000,$fdba		;ffdb1c
Lffdb20:									;ffdb20
	movem.l	d3/a1,-(a7)				;$48e7,$1040		;ffdb20
	tst.l	d3					;$4a83			;ffdb24
	bne.s	Lffdb2c					;$6604			;ffdb26
	move.w	#$0100,d3				;$363c,$0100		;ffdb28
Lffdb2c:									;ffdb2c
	move.l	#Lffffff,d0				;$203c,$00ff,$ffff	;ffdb2c
	and.l	d3,d0					;$c083			;ffdb32
	movep.l	d0,($0017,a6)				;$01ce,$0017		;ffdb34
	move.b	($000b,a6),d0				;$102e,$000b		;ffdb38
	andi.b	#$07,d0					;$0200,$0007		;ffdb3c
	move.b	d0,($0011,a6)				;$1d40,$0011		;ffdb40
Lffdb44:									;ffdb44
	tst.b	($000b,a6)				;$4a2e,$000b		;ffdb44
	bpl.s	Lffdb44					;$6afa			;ffdb48
	move.b	($0009,a6),($0009,a6)			;$1d6e,$0009,$0009	;ffdb4a
	move.b	#$80,($0005,a6)				;$1d7c,$0080,$0005	;ffdb50
	bsr.s	Lffdbd0					;$6178			;ffdb56
	tst.l	d0					;$4a80			;ffdb58
	bne.s	Lffdb70					;$6614			;ffdb5a
Lffdb5c:									;ffdb5c
	move.b	($0009,a6),d0				;$102e,$0009		;ffdb5c
	beq.s	Lffdb5c					;$67fa			;ffdb60
	move.b	($0009,a6),($0009,a6)			;$1d6e,$0009,$0009	;ffdb62
	cmp.b	#$10,d0					;$b03c,$0010		;ffdb68
	bne.s	Lffdb70					;$6602			;ffdb6c
	moveq.l	#$00,d0					;$7000			;ffdb6e
Lffdb70:									;ffdb70
	movem.l	(a7)+,d3/a1				;$4cdf,$0208		;ffdb70
	rts						;$4e75			;ffdb74

Lffdb76:									;ffdb76
	movem.l	d3/a1,-(a7)				;$48e7,$1040		;ffdb76
	move.b	($000b,a6),d0				;$102e,$000b		;ffdb7a
	andi.b	#$07,d0					;$0200,$0007		;ffdb7e
	move.b	d0,($0011,a6)				;$1d40,$0011		;ffdb82
	tst.l	d3					;$4a83			;ffdb86
	bne.s	Lffdb8e					;$6604			;ffdb88
	move.w	#$0100,d3				;$363c,$0100		;ffdb8a
Lffdb8e:									;ffdb8e
	move.l	#Lffffff,d0				;$203c,$00ff,$ffff	;ffdb8e
	and.l	d3,d0					;$c083			;ffdb94
	movep.l	d0,($0017,a6)				;$01ce,$0017		;ffdb96
	move.b	($0009,a6),($0009,a6)			;$1d6e,$0009,$0009	;ffdb9a
	move.b	#$80,($0005,a6)				;$1d7c,$0080,$0005	;ffdba0
	bsr.s	Lffdbc6					;$611e			;ffdba6
	tst.l	d0					;$4a80			;ffdba8
	bne.s	Lffdbc0					;$6614			;ffdbaa
Lffdbac:									;ffdbac
	move.b	($0009,a6),d0				;$102e,$0009		;ffdbac
	beq.s	Lffdbac					;$67fa			;ffdbb0
	move.b	($0009,a6),($0009,a6)			;$1d6e,$0009,$0009	;ffdbb2
	cmp.b	#$10,d0					;$b03c,$0010		;ffdbb8
	bne.s	Lffdbc0					;$6602			;ffdbbc
	moveq.l	#$00,d0					;$7000			;ffdbbe
Lffdbc0:									;ffdbc0
	movem.l	(a7)+,d3/a1				;$4cdf,$0208		;ffdbc0
	rts						;$4e75			;ffdbc4

Lffdbc6:									;ffdbc6
	movem.l	d1-d2/a0/a3,-(a7)			;$48e7,$6090		;ffdbc6
	move.w	#$80b1,d1				;$323c,$80b1		;ffdbca
	bra.s	Lffdbd8					;$6008			;ffdbce
Lffdbd0:									;ffdbd0
	movem.l	d1-d2/a0/a3,-(a7)			;$48e7,$6090		;ffdbd0
	move.w	#$8031,d1				;$323c,$8031		;ffdbd4
Lffdbd8:									;ffdbd8
	bsr.w	Lff8284					;$6100,$a6aa		;ffdbd8
	lea.l	($00e84040),a0				;$41f9,$00e8,$4040	;ffdbdc
	st.b	(a0)					;$50d0			;ffdbe2
	clr.w	($001a,a0)				;$4268,$001a		;ffdbe4
	move.b	#$04,($0006,a0)				;$117c,$0004,$0006	;ffdbe8
	lea.l	($0015,a6),a3				;$47ee,$0015		;ffdbee
	move.l	a3,($0014,a0)				;$214b,$0014		;ffdbf2
	moveq.l	#$00,d2					;$7400			;ffdbf6
	move.w	#$0100,d2				;$343c,$0100		;ffdbf8
	tst.b	($00ed0070)				;$4a39,$00ed,$0070	;ffdbfc
	bpl.s	Lffdc0c					;$6a08			;ffdc02
	moveq.l	#$00,d2					;$7400			;ffdc04
	move.w	($00000cc0).l,d2			;$3439,$0000,$0cc0	;ffdc06
Lffdc0c:									;ffdc0c
	btst.b	#$05,($00ed0070)			;$0839,$0005,$00ed,$0070	;ffdc0c
	beq.s	Lffdc1a					;$6704			;ffdc14
	eori.w	#$8003,d1				;$0a41,$8003		;ffdc16
Lffdc1a:									;ffdc1a
	move.w	d1,($0004,a0)				;$3141,$0004		;ffdc1a
	lea.l	($0009,a6),a3				;$47ee,$0009		;ffdc1e
	tst.b	d1					;$4a01			;ffdc22
	bmi.s	Lffdc9c					;$6b76			;ffdc24
Lffdc26:									;ffdc26
	cmp.l	d2,d3					;$b682			;ffdc26
	bls.s	Lffdc6e					;$6344			;ffdc28
Lffdc2a:									;ffdc2a
	move.l	a1,($000c,a0)				;$2149,$000c		;ffdc2a
	move.w	d2,($000a,a0)				;$3142,$000a		;ffdc2e
Lffdc32:									;ffdc32
	tst.b	(a3)					;$4a13			;ffdc32
	bne.s	Lffdc7c					;$6646			;ffdc34
	btst.b	#$00,($000d,a6)				;$082e,$0000,$000d	;ffdc36
	beq.s	Lffdc32					;$67f4			;ffdc3c
Lffdc3e:									;ffdc3e
	tst.b	(a3)					;$4a13			;ffdc3e
	bne.s	Lffdc7c					;$663a			;ffdc40
	tst.b	($000b,a6)				;$4a2e,$000b		;ffdc42
	bpl.s	Lffdc3e					;$6af6			;ffdc46
	st.b	(a0)					;$50d0			;ffdc48
	move.b	#$80,($0007,a0)				;$117c,$0080,$0007	;ffdc4a
	tst.b	(a3)					;$4a13			;ffdc50
Lffdc52:									;ffdc52
	tst.b	(a3)					;$4a13			;ffdc52
	bne.s	Lffdc7c					;$6626			;ffdc54
	tst.b	(a0)					;$4a10			;ffdc56
	bpl.s	Lffdc52					;$6af8			;ffdc58
	move.b	($0001,a0),d0				;$1028,$0001		;ffdc5a
	bne.s	Lffdc72					;$6612			;ffdc5e
	adda.l	d2,a1					;$d3c2			;ffdc60
	sub.l	d2,d3					;$9682			;ffdc62
	bne.s	Lffdc26					;$66c0			;ffdc64
	moveq.l	#$00,d0					;$7000			;ffdc66
Lffdc68:									;ffdc68
	movem.l	(a7)+,d1-d2/a0/a3			;$4cdf,$0906		;ffdc68
	rts						;$4e75			;ffdc6c

Lffdc6e:									;ffdc6e
	move.l	d3,d2					;$2403			;ffdc6e
	bra.s	Lffdc2a					;$60b8			;ffdc70
Lffdc72:									;ffdc72
	btst.l	#$01,d0					;$0800,$0001		;ffdc72
	bne.s	Lffdc32					;$66ba			;ffdc76
	moveq.l	#$ff,d0					;$70ff			;ffdc78
	bra.s	Lffdc68					;$60ec			;ffdc7a
Lffdc7c:									;ffdc7c
	move.b	($0009,a6),d0				;$102e,$0009		;ffdc7c
	cmpi.b	#$10,d0					;$0c00,$0010		;ffdc80
	bne.s	Lffdc90					;$660a			;ffdc84
	moveq.l	#$00,d0					;$7000			;ffdc86
	tst.w	($000a,a0)				;$4a68,$000a		;ffdc88
	beq.s	Lffdc90					;$6702			;ffdc8c
	moveq.l	#$fe,d0					;$70fe			;ffdc8e
Lffdc90:									;ffdc90
	move.b	#$10,($0007,a0)				;$117c,$0010,$0007	;ffdc90
	bra.s	Lffdc68					;$60d0			;ffdc96
Lffdc98:									;ffdc98
	move.l	d3,d2					;$2403			;ffdc98
	bra.s	Lffdca0					;$6004			;ffdc9a
Lffdc9c:									;ffdc9c
	cmp.l	d2,d3					;$b682			;ffdc9c
	bls.s	Lffdc98					;$63f8			;ffdc9e
Lffdca0:									;ffdca0
	move.l	a1,($000c,a0)				;$2149,$000c		;ffdca0
	move.w	d2,($000a,a0)				;$3142,$000a		;ffdca4
Lffdca8:									;ffdca8
	tst.b	(a3)					;$4a13			;ffdca8
	bne.s	Lffdc7c					;$66d0			;ffdcaa
	btst.b	#$00,($000d,a6)				;$082e,$0000,$000d	;ffdcac
	bne.s	Lffdca8					;$66f4			;ffdcb2
	st.b	(a0)					;$50d0			;ffdcb4
	move.b	#$80,($0007,a0)				;$117c,$0080,$0007	;ffdcb6
	tst.b	(a3)					;$4a13			;ffdcbc
Lffdcbe:									;ffdcbe
	tst.b	(a3)					;$4a13			;ffdcbe
	bne.s	Lffdc7c					;$66ba			;ffdcc0
	tst.b	(a0)					;$4a10			;ffdcc2
	bpl.s	Lffdcbe					;$6af8			;ffdcc4
	move.b	($0001,a0),d0				;$1028,$0001		;ffdcc6
	bne.s	Lffdcda					;$660e			;ffdcca
	adda.l	d2,a1					;$d3c2			;ffdccc
	sub.l	d2,d3					;$9682			;ffdcce
	bne.s	Lffdc9c					;$66ca			;ffdcd0
	moveq.l	#$00,d0					;$7000			;ffdcd2
Lffdcd4:									;ffdcd4
	movem.l	(a7)+,d1-d2/a0/a3			;$4cdf,$0906		;ffdcd4
	rts						;$4e75			;ffdcd8

Lffdcda:									;ffdcda
	btst.l	#$01,d0					;$0800,$0001		;ffdcda
	bne.s	Lffdca8					;$66c8			;ffdcde
	moveq.l	#$ff,d0					;$70ff			;ffdce0
	bra.s	Lffdcd4					;$60f0			;ffdce2
Call_DRAWMODE:									;ffdce4
	lea.l	($0d1a),a0				;$41f8,$0d1a		;ffdce4
	move.w	(a0),d0					;$3010			;ffdce8
	cmp.w	#$ffff,d0				;$b07c,$ffff		;ffdcea
	beq.s	Lffdcf2					;$6702			;ffdcee
	move.w	d1,(a0)					;$3081			;ffdcf0
Lffdcf2:									;ffdcf2
	rts						;$4e75			;ffdcf2

Call_BOX:									;ffdcf4
	move.w	($0964),d0				;$3038,$0964		;ffdcf4
	beq.s	Lffdd6e					;$6774			;ffdcf8
	cmp.w	($0008,a1),d0				;$b069,$0008		;ffdcfa
	bcs.s	Lffdd72					;$6572			;ffdcfe
	movem.l	d1-d7/a1-a4,-(a7)			;$48e7,$7f78		;ffdd00
	move.w	(a1)+,d0				;$3019			;ffdd04
	move.w	(a1)+,d1				;$3219			;ffdd06
	move.w	(a1)+,d2				;$3419			;ffdd08
	move.w	(a1)+,d3				;$3619			;ffdd0a
	move.w	(a1)+,d7				;$3e19			;ffdd0c
	move.w	(a1),d6					;$3c11			;ffdd0e
	bsr.w	Lffe7b0					;$6100,$0a9e		;ffdd10
	movem.l	(a7)+,d1-d7/a1-a4			;$4cdf,$1efe		;ffdd14
	moveq.l	#$00,d0					;$7000			;ffdd18
	rts						;$4e75			;ffdd1a

Call_LINE:									;ffdd1c
	move.w	($0964),d0				;$3038,$0964		;ffdd1c
	beq.s	Lffdd6e					;$674c			;ffdd20
	cmp.w	($0008,a1),d0				;$b069,$0008		;ffdd22
	bcs.s	Lffdd72					;$654a			;ffdd26
	movem.l	d1-d7/a1-a4,-(a7)			;$48e7,$7f78		;ffdd28
	move.w	(a1)+,d0				;$3019			;ffdd2c
	move.w	(a1)+,d1				;$3219			;ffdd2e
	move.w	(a1)+,d2				;$3419			;ffdd30
	move.w	(a1)+,d3				;$3619			;ffdd32
	move.w	(a1)+,d7				;$3e19			;ffdd34
	move.w	(a1),d6					;$3c11			;ffdd36
	bsr.w	Lffe816					;$6100,$0adc		;ffdd38
	movem.l	(a7)+,d1-d7/a1-a4			;$4cdf,$1efe		;ffdd3c
	moveq.l	#$00,d0					;$7000			;ffdd40
	rts						;$4e75			;ffdd42

Call_CIRCLE:									;ffdd44
	move.w	($0964),d0				;$3038,$0964		;ffdd44
	beq.s	Lffdd6e					;$6724			;ffdd48
	cmp.w	($0006,a1),d0				;$b069,$0006		;ffdd4a
	bcs.s	Lffdd72					;$6522			;ffdd4e
	movem.l	d1-d7/a1-a5,-(a7)			;$48e7,$7f7c		;ffdd50
	move.w	(a1)+,d4				;$3819			;ffdd54
	move.w	(a1)+,d5				;$3a19			;ffdd56
	move.w	(a1)+,d1				;$3219			;ffdd58
	move.w	(a1)+,d7				;$3e19			;ffdd5a
	move.w	(a1)+,d2				;$3419			;ffdd5c
	move.w	(a1)+,d3				;$3619			;ffdd5e
	move.w	(a1),d6					;$3c11			;ffdd60
	bsr.w	Lffe3b8					;$6100,$0654		;ffdd62
	movem.l	(a7)+,d1-d7/a1-a5			;$4cdf,$3efe		;ffdd66
	moveq.l	#$00,d0					;$7000			;ffdd6a
	rts						;$4e75			;ffdd6c

Lffdd6e:									;ffdd6e
	moveq.l	#$ff,d0					;$70ff			;ffdd6e
	rts						;$4e75			;ffdd70

Lffdd72:									;ffdd72
	moveq.l	#$fe,d0					;$70fe			;ffdd72
	rts						;$4e75			;ffdd74

Call_FILL:									;ffdd76
	move.w	($0964),d0				;$3038,$0964		;ffdd76
	beq.s	Lffdd6e					;$67f2			;ffdd7a
	cmp.w	($0008,a1),d0				;$b069,$0008		;ffdd7c
	bcs.s	Lffdd72					;$65f0			;ffdd80
	movem.l	d1-d7/a1-a4,-(a7)			;$48e7,$7f78		;ffdd82
	move.w	(a1)+,d0				;$3019			;ffdd86
	move.w	(a1)+,d1				;$3219			;ffdd88
	move.w	(a1)+,d2				;$3419			;ffdd8a
	move.w	(a1)+,d3				;$3619			;ffdd8c
	move.w	(a1),d7					;$3e11			;ffdd8e
	bsr.w	Lffeaae					;$6100,$0d1c		;ffdd90
	movem.l	(a7)+,d1-d7/a1-a4			;$4cdf,$1efe		;ffdd94
	moveq.l	#$00,d0					;$7000			;ffdd98
	rts						;$4e75			;ffdd9a

Call_PAINT:									;ffdd9c
	move.w	($0964),d0				;$3038,$0964		;ffdd9c
	beq.s	Lffdd6e					;$67cc			;ffdda0
	cmp.w	($0004,a1),d0				;$b069,$0004		;ffdda2
	bcs.s	Lffdd72					;$65ca			;ffdda6
	movem.l	d1-d7/a1-a5,-(a7)			;$48e7,$7f7c		;ffdda8
	move.w	(a1)+,d4				;$3819			;ffddac
	move.w	(a1)+,d5				;$3a19			;ffddae
	move.w	(a1)+,d7				;$3e19			;ffddb0
	move.l	(a1)+,d0				;$2019			;ffddb2
	move.l	(a1),d1					;$2211			;ffddb4
	bsr.w	Lffe1d8					;$6100,$0420		;ffddb6
	movem.l	(a7)+,d1-d7/a1-a5			;$4cdf,$3efe		;ffddba
	moveq.l	#$00,d0					;$7000			;ffddbe
	rts						;$4e75			;ffddc0

Call_POINT:									;ffddc2
	tst.w	($0964)					;$4a78,$0964		;ffddc2
	beq.s	Lffdd6e					;$67a6			;ffddc6
	movem.l	d1-d7/a1-a6,-(a7)			;$48e7,$7f7e		;ffddc8
	move.l	a1,-(a7)				;$2f09			;ffddcc
	move.w	(a1)+,d4				;$3819			;ffddce
	move.w	(a1)+,d5				;$3a19			;ffddd0
	bsr.w	Lffde9c					;$6100,$00c8		;ffddd2
	bcs.s	Lffdde8					;$6510			;ffddd6
	move.w	(a0),d0					;$3010			;ffddd8
Lffddda:									;ffddda
	movea.l	(a7)+,a1				;$225f			;ffddda
	move.w	d0,($0004,a1)				;$3340,$0004		;ffdddc
	movem.l	(a7)+,d1-d7/a1-a6			;$4cdf,$7efe		;ffdde0
	moveq.l	#$00,d0					;$7000			;ffdde4
	rts						;$4e75			;ffdde6

Lffdde8:									;ffdde8
	clr.w	d0					;$4240			;ffdde8
	bra.s	Lffddda					;$60ee			;ffddea
Call_PSET:									;ffddec
	move.w	($0964),d0				;$3038,$0964		;ffddec
	beq.s	Lffde3e					;$674c			;ffddf0
	cmp.w	($0004,a1),d0				;$b069,$0004		;ffddf2
	bcs.s	Lffde42					;$654a			;ffddf6
	movem.l	d1-d7/a1-a6,-(a7)			;$48e7,$7f7e		;ffddf8
	move.w	(a1)+,d4				;$3819			;ffddfc
	move.w	(a1)+,d5				;$3a19			;ffddfe
	move.w	(a1),d7					;$3e11			;ffde00
	bsr.w	Lffde9c					;$6100,$0098		;ffde02
	bcs.s	Lffde0a					;$6502			;ffde06
	move.w	d7,(a0)					;$3087			;ffde08
Lffde0a:									;ffde0a
	movem.l	(a7)+,d1-d7/a1-a6			;$4cdf,$7efe		;ffde0a
	moveq.l	#$00,d0					;$7000			;ffde0e
	rts						;$4e75			;ffde10

Call_SYMBOL:									;ffde12
	move.w	($0964),d0				;$3038,$0964		;ffde12
	beq.s	Lffde3e					;$6726			;ffde16
	cmp.w	($000a,a1),d0				;$b069,$000a		;ffde18
	bcs.s	Lffde42					;$6524			;ffde1c
	movem.l	d1-d7/a1-a5,-(a7)			;$48e7,$7f7c		;ffde1e
	move.w	(a1)+,d4				;$3819			;ffde22
	move.w	(a1)+,d5				;$3a19			;ffde24
	movea.l	(a1)+,a0				;$2059			;ffde26
	move.b	(a1)+,d2				;$1419			;ffde28
	move.b	(a1)+,d3				;$1619			;ffde2a
	move.w	(a1)+,d7				;$3e19			;ffde2c
	move.b	(a1)+,d1				;$1219			;ffde2e
	move.b	(a1),d6					;$1c11			;ffde30
	bsr.w	Lffdede					;$6100,$00aa		;ffde32
	movem.l	(a7)+,d1-d7/a1-a5			;$4cdf,$3efe		;ffde36
	moveq.l	#$00,d0					;$7000			;ffde3a
	rts						;$4e75			;ffde3c

Lffde3e:									;ffde3e
	bra.w	Lffdd6e					;$6000,$ff2e		;ffde3e
Lffde42:									;ffde42
	bra.w	Lffdd72					;$6000,$ff2e		;ffde42
Call_WIPE:									;ffde46
	tst.w	($0964)					;$4a78,$0964		;ffde46
	beq.s	Lffde3e					;$67f2			;ffde4a
	movem.l	d1-d7/a1-a4,-(a7)			;$48e7,$7f78		;ffde4c
	bsr.w	Lffeb04					;$6100,$0cb2		;ffde50
	movem.l	(a7)+,d1-d7/a1-a4			;$4cdf,$1efe		;ffde54
	moveq.l	#$00,d0					;$7000			;ffde58
	rts						;$4e75			;ffde5a

Call_GETGRM:									;ffde5c
	tst.w	($0964)					;$4a78,$0964		;ffde5c
	beq.s	Lffde3e					;$67dc			;ffde60
	movem.l	d1-d7/a1-a4,-(a7)			;$48e7,$7f78		;ffde62
	move.w	(a1)+,d0				;$3019			;ffde66
	move.w	(a1)+,d1				;$3219			;ffde68
	move.w	(a1)+,d2				;$3419			;ffde6a
	move.w	(a1)+,d3				;$3619			;ffde6c
	movea.l	(a1)+,a2				;$2459			;ffde6e
	movea.l	(a1),a3					;$2651			;ffde70
	bsr.w	Lffe016					;$6100,$01a2		;ffde72
	movem.l	(a7)+,d1-d7/a1-a4			;$4cdf,$1efe		;ffde76
	rts						;$4e75			;ffde7a

Call_PUTGRM:									;ffde7c
	tst.w	($0964)					;$4a78,$0964		;ffde7c
	beq.s	Lffde3e					;$67bc			;ffde80
	movem.l	d1-d7/a1-a4,-(a7)			;$48e7,$7f78		;ffde82
	move.w	(a1)+,d0				;$3019			;ffde86
	move.w	(a1)+,d1				;$3219			;ffde88
	move.w	(a1)+,d2				;$3419			;ffde8a
	move.w	(a1)+,d3				;$3619			;ffde8c
	movea.l	(a1)+,a2				;$2459			;ffde8e
	movea.l	(a1),a3					;$2651			;ffde90
	bsr.w	Lffe01a					;$6100,$0186		;ffde92
	movem.l	(a7)+,d1-d7/a1-a4			;$4cdf,$1efe		;ffde96
	rts						;$4e75			;ffde9a

Lffde9c:									;ffde9c
	cmp.w	($0968),d4				;$b878,$0968		;ffde9c
	blt.s	Lffded4					;$6d32			;ffdea0
	cmp.w	($096c),d4				;$b878,$096c		;ffdea2
	bgt.s	Lffded4					;$6e2c			;ffdea6
	cmp.w	($096a),d5				;$ba78,$096a		;ffdea8
	blt.s	Lffded4					;$6d26			;ffdeac
	cmp.w	($096e),d5				;$ba78,$096e		;ffdeae
	bgt.s	Lffded4					;$6e20			;ffdeb2
	moveq.l	#$00,d0					;$7000			;ffdeb4
	move.w	d5,d0					;$3005			;ffdeb6
	swap.w	d0					;$4840			;ffdeb8
	lsr.l	#6,d0					;$ec88			;ffdeba
	btst.b	#$02,($0962)				;$0838,$0002,$0962	;ffdebc
	bne.s	Lffdec6					;$6602			;ffdec2
	add.l	d0,d0					;$d080			;ffdec4
Lffdec6:									;ffdec6
	movea.l	($095c),a0				;$2078,$095c		;ffdec6
	adda.l	d0,a0					;$d1c0			;ffdeca
	adda.w	d4,a0					;$d0c4			;ffdecc
	adda.w	d4,a0					;$d0c4			;ffdece
	tst.w	d0					;$4a40			;ffded0
	rts						;$4e75			;ffded2

Lffded4:									;ffded4
	ori.b	#$01,ccr				;$003c,$0001		;ffded4
	rts						;$4e75			;ffded8

Lffdeda:									;ffdeda
	.dc.b	$06,$08,$0c,$00							;ffdeda
Lffdede:									;ffdede
	link.w	a6,#-$0066				;$4e56,$ff9a		;ffdede
	move.l	($0968),(-$0066,a6)			;$2d78,$0968,$ff9a	;ffdee2
	move.l	($096c),(-$0062,a6)			;$2d78,$096c,$ff9e	;ffdee8
	cmp.b	#$03,d1					;$b23c,$0003		;ffdeee
	bcs.s	Lffdef6					;$6502			;ffdef2
	moveq.l	#$02,d1					;$7202			;ffdef4
Lffdef6:									;ffdef6
	and.w	#$00ff,d1				;$c27c,$00ff		;ffdef6
	move.b	(Lffdeda,pc,d1.w),d1			;$123b,$10de		;ffdefa
	move.w	d1,(-$0012,a6)				;$3d41,$ffee		;ffdefe
	lea.l	(-$0008,a6),a4				;$49ee,$fff8		;ffdf02
	lea.l	(-$0010,a6),a5				;$4bee,$fff0		;ffdf06
	move.w	d4,(a4)					;$3884			;ffdf0a
	move.w	d5,(a5)					;$3a85			;ffdf0c
	and.w	#$00ff,d2				;$c47c,$00ff		;ffdf0e
	bne.s	Lffdf16					;$6602			;ffdf12
	moveq.l	#$01,d2					;$7401			;ffdf14
Lffdf16:									;ffdf16
	and.w	#$00ff,d3				;$c67c,$00ff		;ffdf16
	bne.s	Lffdf1e					;$6602			;ffdf1a
	moveq.l	#$01,d3					;$7601			;ffdf1c
Lffdf1e:									;ffdf1e
	move.w	d2,d0					;$3002			;ffdf1e
	move.w	d3,d1					;$3203			;ffdf20
	subq.w	#1,d0					;$5340			;ffdf22
	subq.w	#1,d1					;$5341			;ffdf24
	bsr.w	Lffdfe6					;$6100,$00be		;ffdf26
	move.w	d2,(-$0002,a6)				;$3d42,$fffe		;ffdf2a
	move.w	d3,(-$000a,a6)				;$3d43,$fff6		;ffdf2e
	move.w	d0,(-$0004,a6)				;$3d40,$fffc		;ffdf32
	move.w	d1,(-$000c,a6)				;$3d41,$fff4		;ffdf36
	lea.l	(-$005e,a6),a1				;$43ee,$ffa2		;ffdf3a
Lffdf3e:									;ffdf3e
	move.w	(-$0012,a6),d1				;$322e,$ffee		;ffdf3e
	swap.w	d1					;$4841			;ffdf42
	clr.w	d1					;$4241			;ffdf44
	move.b	(a0)+,d1				;$1218			;ffdf46
	beq.w	Lffdfe2					;$6700,$0098		;ffdf48
	cmp.b	#$80,d1					;$b23c,$0080		;ffdf4c
	bcs.s	Lffdf66					;$6514			;ffdf50
	cmp.b	#$a0,d1					;$b23c,$00a0		;ffdf52
	bcs.s	Lffdf5e					;$6506			;ffdf56
	cmp.b	#$e0,d1					;$b23c,$00e0		;ffdf58
	bcs.s	Lffdf66					;$6508			;ffdf5c
Lffdf5e:									;ffdf5e
	lsl.w	#8,d1					;$e149			;ffdf5e
	move.b	(a0),d1					;$1210			;ffdf60
	beq.s	Lffdf66					;$6702			;ffdf62
	addq.l	#1,a0					;$5288			;ffdf64
Lffdf66:									;ffdf66
	move.l	a0,-(a7)				;$2f08			;ffdf66
	bsr.w	Call_FNTGET				;$6100,$9600		;ffdf68
	movea.l	(a7)+,a0				;$205f			;ffdf6c
	move.w	(a1),d6					;$3c11			;ffdf6e
	subq.w	#1,d6					;$5346			;ffdf70
	lsr.w	#3,d6					;$e64e			;ffdf72
	addq.w	#1,d6					;$5246			;ffdf74
	move.w	(a4),($0002,a4)				;$3954,$0002		;ffdf76
	move.w	(a1),d4					;$3811			;ffdf7a
Lffdf7c:									;ffdf7c
	move.w	(a5),($0002,a5)				;$3b55,$0002		;ffdf7c
	move.w	($0002,a1),d5				;$3a29,$0002		;ffdf80
	lea.l	($0004,a1),a2				;$45e9,$0004		;ffdf84
Lffdf88:									;ffdf88
	lea.l	(a2,d6.w),a3				;$47f2,$6000		;ffdf88
	move.l	a3,-(a7)				;$2f0b			;ffdf8c
Lffdf8e:									;ffdf8e
	move.b	-(a3),d0				;$1023			;ffdf8e
	roxl.b	#1,d0					;$e310			;ffdf90
	move.b	d0,(a3)					;$1680			;ffdf92
	cmpa.l	a2,a3					;$b7ca			;ffdf94
	bne.s	Lffdf8e					;$66f6			;ffdf96
	roxr.b	#1,d0					;$e210			;ffdf98
	bpl.s	Lffdfbc					;$6a20			;ffdf9a
	move.w	(-$0006,a6),d0				;$302e,$fffa		;ffdf9c
	move.w	(-$000e,a6),d1				;$322e,$fff2		;ffdfa0
	move.w	d0,d2					;$3400			;ffdfa4
	move.w	d1,d3					;$3601			;ffdfa6
	add.w	($0004,a4),d2				;$d46c,$0004		;ffdfa8
	add.w	($0004,a5),d3				;$d66d,$0004		;ffdfac
	movem.l	d4-d6/a0-a1,-(a7)			;$48e7,$0ec0		;ffdfb0
	bsr.w	Lffeaae					;$6100,$0af8		;ffdfb4
	movem.l	(a7)+,d4-d6/a0-a1			;$4cdf,$0370		;ffdfb8
Lffdfbc:									;ffdfbc
	move.w	(-$000a,a6),d0				;$302e,$fff6		;ffdfbc
	add.w	d0,($0002,a5)				;$d16d,$0002		;ffdfc0
	movea.l	(a7)+,a2				;$245f			;ffdfc4
	subq.w	#1,d5					;$5345			;ffdfc6
	bne.s	Lffdf88					;$66be			;ffdfc8
	move.w	(-$0002,a6),d0				;$302e,$fffe		;ffdfca
	add.w	d0,($0002,a4)				;$d16c,$0002		;ffdfce
	subq.w	#1,d4					;$5344			;ffdfd2
	bne.s	Lffdf7c					;$66a6			;ffdfd4
	move.w	(-$0002,a6),d0				;$302e,$fffe		;ffdfd6
	muls.w	(a1),d0					;$c1d1			;ffdfda
	add.w	d0,(a4)					;$d154			;ffdfdc
	bra.w	Lffdf3e					;$6000,$ff5e		;ffdfde
Lffdfe2:									;ffdfe2
	unlk	a6					;$4e5e			;ffdfe2
	rts						;$4e75			;ffdfe4

Lffdfe6:									;ffdfe6
	subq.b	#1,d6					;$5306			;ffdfe6
	bcs.s	Lffdff6					;$650c			;ffdfe8
	beq.s	Lffdff8					;$670c			;ffdfea
	subq.b	#1,d6					;$5306			;ffdfec
	beq.s	Lffe000					;$6710			;ffdfee
	exg.l	a4,a5					;$c94d			;ffdff0
	neg.w	d1					;$4441			;ffdff2
	neg.w	d3					;$4443			;ffdff4
Lffdff6:									;ffdff6
	rts						;$4e75			;ffdff6

Lffdff8:									;ffdff8
	exg.l	a4,a5					;$c94d			;ffdff8
	neg.w	d0					;$4440			;ffdffa
	neg.w	d2					;$4442			;ffdffc
	rts						;$4e75			;ffdffe

Lffe000:									;ffe000
	neg.w	d0					;$4440			;ffe000
	neg.w	d2					;$4442			;ffe002
	neg.w	d1					;$4441			;ffe004
	neg.w	d3					;$4443			;ffe006
	rts						;$4e75			;ffe008

Lffe00a:									;ffe00a
	moveq.l	#$ff,d0					;$70ff			;ffe00a
	rts						;$4e75			;ffe00c

Lffe00e:									;ffe00e
	moveq.l	#$fe,d0					;$70fe			;ffe00e
	rts						;$4e75			;ffe010

Lffe012:									;ffe012
	moveq.l	#$fd,d0					;$70fd			;ffe012
	rts						;$4e75			;ffe014

Lffe016:									;ffe016
	moveq.l	#$00,d7					;$7e00			;ffe016
	bra.s	Lffe01c					;$6002			;ffe018
Lffe01a:									;ffe01a
	moveq.l	#$ff,d7					;$7eff			;ffe01a
Lffe01c:									;ffe01c
	tst.w	($0964)					;$4a78,$0964		;ffe01c
	beq.s	Lffe00a					;$67e8			;ffe020
	cmp.w	d0,d2					;$b440			;ffe022
	bge.s	Lffe028					;$6c02			;ffe024
	exg.l	d0,d2					;$c142			;ffe026
Lffe028:									;ffe028
	cmp.w	d1,d3					;$b641			;ffe028
	bge.s	Lffe02e					;$6c02			;ffe02a
	exg.l	d1,d3					;$c343			;ffe02c
Lffe02e:									;ffe02e
	cmp.w	($0968),d0				;$b078,$0968		;ffe02e
	blt.s	Lffe00e					;$6dda			;ffe032
	cmp.w	($096c),d2				;$b478,$096c		;ffe034
	bgt.s	Lffe00e					;$6ed4			;ffe038
	cmp.w	($096a),d1				;$b278,$096a		;ffe03a
	blt.s	Lffe00e					;$6dce			;ffe03e
	cmp.w	($096e),d3				;$b678,$096e		;ffe040
	bgt.s	Lffe00e					;$6ec8			;ffe044
	sub.w	d0,d2					;$9440			;ffe046
	sub.w	d1,d3					;$9641			;ffe048
	move.w	d0,d4					;$3800			;ffe04a
	move.w	d1,d5					;$3a01			;ffe04c
	bsr.s	Lffe082					;$6132			;ffe04e
	move.w	d2,d0					;$3002			;ffe050
	addq.w	#1,d0					;$5240			;ffe052
	move.w	d3,d1					;$3203			;ffe054
	addq.w	#1,d1					;$5241			;ffe056
	mulu.w	d1,d0					;$c0c1			;ffe058
	jsr	(a1)					;$4e91			;ffe05a
	subq.l	#1,d0					;$5380			;ffe05c
	add.l	a2,d0					;$d08a			;ffe05e
	cmp.l	a3,d0					;$b08b			;ffe060
	bhi.s	Lffe012					;$62ae			;ffe062
	moveq.l	#$00,d0					;$7000			;ffe064
	move.w	d5,d0					;$3005			;ffe066
	swap.w	d0					;$4840			;ffe068
	lsr.l	#6,d0					;$ec88			;ffe06a
	btst.b	#$02,($0962)				;$0838,$0002,$0962	;ffe06c
	bne.s	Lffe076					;$6602			;ffe072
	add.l	d0,d0					;$d080			;ffe074
Lffe076:									;ffe076
	movea.l	($095c),a0				;$2078,$095c		;ffe076
	adda.l	d0,a0					;$d1c0			;ffe07a
	adda.w	d4,a0					;$d0c4			;ffe07c
	adda.w	d4,a0					;$d0c4			;ffe07e
	jmp	(a4)					;$4ed4			;ffe080

Lffe082:									;ffe082
	moveq.l	#$04,d1					;$7204			;ffe082
	move.w	($0964),d0				;$3038,$0964		;ffe084
	bmi.s	Lffe092					;$6b08			;ffe088
	moveq.l	#$02,d1					;$7202			;ffe08a
	tst.b	d0					;$4a00			;ffe08c
	bmi.s	Lffe092					;$6b02			;ffe08e
	moveq.l	#$00,d1					;$7200			;ffe090
Lffe092:									;ffe092
	lea.l	(Lffe0aa,pc),a1				;$43fa,$0016		;ffe092
	adda.w	(Lffe0aa,pc,d1.w),a1			;$d2fb,$1012		;ffe096
	tst.w	d7					;$4a47			;ffe09a
	bne.s	Lffe0a0					;$6602			;ffe09c
	addq.w	#6,d1					;$5c41			;ffe09e
Lffe0a0:									;ffe0a0
	lea.l	(Lffe0b0,pc),a4				;$49fa,$000e		;ffe0a0
	adda.w	(Lffe0b0,pc,d1.w),a4			;$d8fb,$100a		;ffe0a4
	rts						;$4e75			;ffe0a8

Lffe0aa:									;ffe0aa
	.dc.w	$0012,$001a,$0018						;ffe0aa
Lffe0b0:									;ffe0b0
	.dc.w	$009e,$00f6,$010e,$0016						;ffe0b0
	.dc.w	$0070,$0088,$5280,$e288						;ffe0b8
	.dc.w	$4e75								;ffe0c0
Lffe0c2:									;ffe0c2
	lsl.l	#1,d0					;$e388			;ffe0c2
	rts						;$4e75			;ffe0c4

Lffe0c6:									;ffe0c6
	btst.l	#$00,d2					;$0802,$0000		;ffe0c6
	beq.s	Lffe0ee					;$6722			;ffe0ca
	lsr.w	#1,d2					;$e24a			;ffe0cc
Lffe0ce:									;ffe0ce
	movea.l	a0,a1					;$2248			;ffe0ce
	move.w	d2,d1					;$3202			;ffe0d0
Lffe0d2:									;ffe0d2
	move.l	(a1)+,d0				;$2019			;ffe0d2
	move.l	d0,d4					;$2800			;ffe0d4
	swap.w	d4					;$4844			;ffe0d6
	lsl.b	#4,d4					;$e90c			;ffe0d8
	or.b	d4,d0					;$8004			;ffe0da
	move.b	d0,(a2)+				;$14c0			;ffe0dc
	dbra.w	d1,Lffe0d2				;$51c9,$fff2		;ffe0de
	adda.l	($0960),a0				;$d1f8,$0960		;ffe0e2
	dbra.w	d3,Lffe0ce				;$51cb,$ffe6		;ffe0e6
	moveq.l	#$00,d0					;$7000			;ffe0ea
	rts						;$4e75			;ffe0ec

Lffe0ee:									;ffe0ee
	movea.l	a0,a1					;$2248			;ffe0ee
	move.w	d2,d1					;$3202			;ffe0f0
Lffe0f2:									;ffe0f2
	move.w	(a1)+,d0				;$3019			;ffe0f2
	lsl.b	#4,d0					;$e908			;ffe0f4
	subq.w	#1,d1					;$5341			;ffe0f6
	bcs.s	Lffe10e					;$6514			;ffe0f8
Lffe0fa:									;ffe0fa
	or.w	(a1)+,d0				;$8059			;ffe0fa
	move.b	d0,(a2)+				;$14c0			;ffe0fc
	dbra.w	d1,Lffe0f2				;$51c9,$fff2		;ffe0fe
	adda.l	($0960),a0				;$d1f8,$0960		;ffe102
	dbra.w	d3,Lffe0ee				;$51cb,$ffe6		;ffe106
	moveq.l	#$00,d0					;$7000			;ffe10a
	rts						;$4e75			;ffe10c

Lffe10e:									;ffe10e
	adda.l	($0960),a0				;$d1f8,$0960		;ffe10e
	movea.l	a0,a1					;$2248			;ffe112
	move.w	d2,d1					;$3202			;ffe114
	dbra.w	d3,Lffe0fa				;$51cb,$ffe2		;ffe116
	move.b	d0,(a2)+				;$14c0			;ffe11a
	moveq.l	#$00,d0					;$7000			;ffe11c
	rts						;$4e75			;ffe11e

Lffe120:									;ffe120
	movea.l	a0,a1					;$2248			;ffe120
	move.w	d2,d1					;$3202			;ffe122
Lffe124:									;ffe124
	move.w	(a1)+,d0				;$3019			;ffe124
	move.b	d0,(a2)+				;$14c0			;ffe126
	dbra.w	d1,Lffe124				;$51c9,$fffa		;ffe128
	adda.l	($0960),a0				;$d1f8,$0960		;ffe12c
	dbra.w	d3,Lffe120				;$51cb,$ffee		;ffe130
	moveq.l	#$00,d0					;$7000			;ffe134
	rts						;$4e75			;ffe136

Lffe138:									;ffe138
	movea.l	a0,a1					;$2248			;ffe138
	move.w	d2,d1					;$3202			;ffe13a
Lffe13c:									;ffe13c
	move.w	(a1)+,(a2)+				;$34d9			;ffe13c
	dbra.w	d1,Lffe13c				;$51c9,$fffc		;ffe13e
	adda.l	($0960),a0				;$d1f8,$0960		;ffe142
	dbra.w	d3,Lffe138				;$51cb,$fff0		;ffe146
	moveq.l	#$00,d0					;$7000			;ffe14a
	rts						;$4e75			;ffe14c

Lffe14e:									;ffe14e
	btst.l	#$00,d2					;$0802,$0000		;ffe14e
	beq.s	Lffe174					;$6720			;ffe152
	lsr.w	#1,d2					;$e24a			;ffe154
Lffe156:									;ffe156
	movea.l	a0,a1					;$2248			;ffe156
	move.w	d2,d1					;$3202			;ffe158
Lffe15a:									;ffe15a
	move.b	(a2)+,d0				;$101a			;ffe15a
	move.b	d0,d4					;$1800			;ffe15c
	lsr.b	#4,d0					;$e808			;ffe15e
	move.w	d0,(a1)+				;$32c0			;ffe160
	move.w	d4,(a1)+				;$32c4			;ffe162
	dbra.w	d1,Lffe15a				;$51c9,$fff4		;ffe164
	adda.l	($0960),a0				;$d1f8,$0960		;ffe168
	dbra.w	d3,Lffe156				;$51cb,$ffe8		;ffe16c
	moveq.l	#$00,d0					;$7000			;ffe170
	rts						;$4e75			;ffe172

Lffe174:									;ffe174
	movea.l	a0,a1					;$2248			;ffe174
	move.w	d2,d1					;$3202			;ffe176
Lffe178:									;ffe178
	move.b	(a2)+,d0				;$101a			;ffe178
	move.b	d0,d4					;$1800			;ffe17a
	ror.b	#4,d0					;$e818			;ffe17c
	move.w	d0,(a1)+				;$32c0			;ffe17e
	subq.w	#1,d1					;$5341			;ffe180
	bcs.s	Lffe196					;$6512			;ffe182
Lffe184:									;ffe184
	move.w	d4,(a1)+				;$32c4			;ffe184
	dbra.w	d1,Lffe178				;$51c9,$fff0		;ffe186
	adda.l	($0960),a0				;$d1f8,$0960		;ffe18a
	dbra.w	d3,Lffe174				;$51cb,$ffe4		;ffe18e
	moveq.l	#$00,d0					;$7000			;ffe192
	rts						;$4e75			;ffe194

Lffe196:									;ffe196
	adda.l	($0960),a0				;$d1f8,$0960		;ffe196
	movea.l	a0,a1					;$2248			;ffe19a
	move.w	d2,d1					;$3202			;ffe19c
	dbra.w	d3,Lffe184				;$51cb,$ffe4		;ffe19e
	moveq.l	#$00,d0					;$7000			;ffe1a2
	rts						;$4e75			;ffe1a4

Lffe1a6:									;ffe1a6
	movea.l	a0,a1					;$2248			;ffe1a6
	move.w	d2,d1					;$3202			;ffe1a8
Lffe1aa:									;ffe1aa
	move.b	(a2)+,d0				;$101a			;ffe1aa
	move.w	d0,(a1)+				;$32c0			;ffe1ac
	dbra.w	d1,Lffe1aa				;$51c9,$fffa		;ffe1ae
	adda.l	($0960),a0				;$d1f8,$0960		;ffe1b2
	dbra.w	d3,Lffe1a6				;$51cb,$ffee		;ffe1b6
	moveq.l	#$00,d0					;$7000			;ffe1ba
	rts						;$4e75			;ffe1bc

Lffe1be:									;ffe1be
	movea.l	a0,a1					;$2248			;ffe1be
	move.w	d2,d1					;$3202			;ffe1c0
Lffe1c2:									;ffe1c2
	move.w	(a2)+,(a1)+				;$32da			;ffe1c2
	dbra.w	d1,Lffe1c2				;$51c9,$fffc		;ffe1c4
	adda.l	($0960),a0				;$d1f8,$0960		;ffe1c8
	dbra.w	d3,Lffe1be				;$51cb,$fff0		;ffe1cc
	moveq.l	#$00,d0					;$7000			;ffe1d0
	rts						;$4e75			;ffe1d2

Lffe1d4:									;ffe1d4
	unlk	a6					;$4e5e			;ffe1d4
	rts						;$4e75			;ffe1d6

Lffe1d8:									;ffe1d8
	link.w	a6,#-$0040				;$4e56,$ffc0		;ffe1d8
	move.l	($0968),(-$0040,a6)			;$2d78,$0968,$ffc0	;ffe1dc
	move.l	($096c),(-$003c,a6)			;$2d78,$096c,$ffc4	;ffe1e2
	move.l	($0960),(-$0038,a6)			;$2d78,$0960,$ffc8	;ffe1e8
	cmp.l	d0,d1					;$b280			;ffe1ee
	bcs.s	Lffe1d4					;$65e2			;ffe1f0
	move.l	d0,(-$002c,a6)				;$2d40,$ffd4		;ffe1f2
	sub.l	#$0000001f,d1				;$92bc,$0000,$001f	;ffe1f6
	move.l	d1,(-$0028,a6)				;$2d41,$ffd8		;ffe1fc
	move.l	d0,(-$0034,a6)				;$2d40,$ffcc		;ffe200
	move.l	d0,(-$0030,a6)				;$2d40,$ffd0		;ffe204
	move.w	d4,d1					;$3204			;ffe208
	movea.w	d5,a4					;$3845			;ffe20a
	bsr.w	Lffde9c					;$6100,$fc8e		;ffe20c
	bcs.s	Lffe1d4					;$65c2			;ffe210
	cmp.w	(a0),d7					;$be50			;ffe212
	beq.s	Lffe1d4					;$67be			;ffe214
	move.w	d7,d0					;$3007			;ffe216
	swap.w	d7					;$4847			;ffe218
	move.w	d0,d7					;$3e00			;ffe21a
	move.w	(a0),d6					;$3c10			;ffe21c
	move.w	(-$0040,a6),d4				;$382e,$ffc0		;ffe21e
	move.w	(-$003c,a6),d5				;$3a2e,$ffc4		;ffe222
	bsr.s	Lffe27a					;$6152			;ffe226
	move.l	(-$0024,a6),(-$0018,a6)			;$2d6e,$ffdc,$ffe8	;ffe228
	move.l	(-$0020,a6),(-$0014,a6)			;$2d6e,$ffe0,$ffec	;ffe22e
	move.l	(-$001c,a6),(-$0010,a6)			;$2d6e,$ffe4,$fff0	;ffe234
	bsr.w	Lffe328					;$6100,$00ec		;ffe23a
Lffe23e:									;ffe23e
	movea.l	(-$0030,a6),a1				;$226e,$ffd0		;ffe23e
	cmpa.l	(-$0034,a6),a1				;$b3ee,$ffcc		;ffe242
	beq.s	Lffe1d4					;$678c			;ffe246
	lea.l	($0020,a1),a1				;$43e9,$0020		;ffe248
	cmpa.l	(-$0028,a6),a1				;$b3ee,$ffd8		;ffe24c
	bls.s	Lffe256					;$6304			;ffe250
	movea.l	(-$002c,a6),a1				;$226e,$ffd4		;ffe252
Lffe256:									;ffe256
	move.l	a1,(-$0030,a6)				;$2d49,$ffd0		;ffe256
	movea.w	(a1)+,a2				;$3459			;ffe25a
	movea.w	(a1)+,a4				;$3859			;ffe25c
	move.l	(a1)+,(-$0018,a6)			;$2d59,$ffe8		;ffe25e
	move.l	(a1)+,(-$0014,a6)			;$2d59,$ffec		;ffe262
	move.l	(a1)+,(-$0010,a6)			;$2d59,$fff0		;ffe266
	move.l	(a1)+,(-$000c,a6)			;$2d59,$fff4		;ffe26a
	move.l	(a1)+,(-$0008,a6)			;$2d59,$fff8		;ffe26e
	move.l	(a1)+,(-$0004,a6)			;$2d59,$fffc		;ffe272
	bsr.s	Lffe2d8					;$6160			;ffe276
	bra.s	Lffe23e					;$60c4			;ffe278
Lffe27a:									;ffe27a
	move.w	d7,(a0)					;$3087			;ffe27a
	move.l	a0,-(a7)				;$2f08			;ffe27c
	move.w	d1,-(a7)				;$3f01			;ffe27e
	sub.w	d4,d1					;$9244			;ffe280
	subq.w	#1,d1					;$5341			;ffe282
	bcc.s	Lffe28e					;$6408			;ffe284
Lffe286:									;ffe286
	move.w	d7,(a0)					;$3087			;ffe286
	move.w	d4,d1					;$3204			;ffe288
	bra.s	Lffe29c					;$6010			;ffe28a
Lffe28c:									;ffe28c
	move.w	d7,(a0)					;$3087			;ffe28c
Lffe28e:									;ffe28e
	cmp.w	-(a0),d6				;$bc60			;ffe28e
	dbne.w	d1,Lffe28c				;$56c9,$fffa		;ffe290
	beq.s	Lffe286					;$67f0			;ffe294
	addq.l	#2,a0					;$5488			;ffe296
	addq.w	#1,d1					;$5241			;ffe298
	add.w	d4,d1					;$d244			;ffe29a
Lffe29c:									;ffe29c
	move.w	d1,(-$0024,a6)				;$3d41,$ffdc		;ffe29c
	move.l	a0,(-$0022,a6)				;$2d48,$ffde		;ffe2a0
	move.w	d5,d1					;$3205			;ffe2a4
	sub.w	(a7)+,d1				;$925f			;ffe2a6
	subq.w	#1,d1					;$5341			;ffe2a8
	bcs.s	Lffe2b2					;$6506			;ffe2aa
	movea.l	(a7)+,a0				;$205f			;ffe2ac
	addq.l	#2,a0					;$5488			;ffe2ae
	bra.s	Lffe2bc					;$600a			;ffe2b0
Lffe2b2:									;ffe2b2
	movea.l	(a7)+,a0				;$205f			;ffe2b2
Lffe2b4:									;ffe2b4
	move.w	d7,(a0)					;$3087			;ffe2b4
	move.w	d5,d1					;$3205			;ffe2b6
	bra.s	Lffe2cc					;$6012			;ffe2b8
Lffe2ba:									;ffe2ba
	move.w	d7,(a0)+				;$30c7			;ffe2ba
Lffe2bc:									;ffe2bc
	cmp.w	(a0),d6					;$bc50			;ffe2bc
	dbne.w	d1,Lffe2ba				;$56c9,$fffa		;ffe2be
	beq.s	Lffe2b4					;$67f0			;ffe2c2
	subq.l	#2,a0					;$5588			;ffe2c4
	addq.w	#1,d1					;$5241			;ffe2c6
	sub.w	d5,d1					;$9245			;ffe2c8
	neg.w	d1					;$4441			;ffe2ca
Lffe2cc:									;ffe2cc
	move.w	d1,(-$001e,a6)				;$3d41,$ffe2		;ffe2cc
	move.l	a0,(-$001c,a6)				;$2d48,$ffe4		;ffe2d0
	rts						;$4e75			;ffe2d4

Lffe2d6:									;ffe2d6
	rts						;$4e75			;ffe2d6

Lffe2d8:									;ffe2d8
	cmpa.w	(-$003e,a6),a4				;$b8ee,$ffc2		;ffe2d8
	beq.s	Lffe2e6					;$6708			;ffe2dc
	lea.l	(-$0001,a4),a5				;$4bec,$ffff		;ffe2de
	moveq.l	#$00,d0					;$7000			;ffe2e2
	bsr.s	Lffe2f2					;$610c			;ffe2e4
Lffe2e6:									;ffe2e6
	cmpa.w	(-$003a,a6),a4				;$b8ee,$ffc6		;ffe2e6
	beq.s	Lffe2d6					;$67ea			;ffe2ea
	lea.l	($0001,a4),a5				;$4bec,$0001		;ffe2ec
	moveq.l	#$ff,d0					;$70ff			;ffe2f0
Lffe2f2:									;ffe2f2
	movea.w	d0,a3					;$3640			;ffe2f2
	move.w	a2,d1					;$320a			;ffe2f4
	eor.w	d0,d1					;$b141			;ffe2f6
	beq.s	Lffe344					;$674a			;ffe2f8
	move.w	(-$000c,a6),d1				;$322e,$fff4		;ffe2fa
	cmp.w	d4,d1					;$b244			;ffe2fe
	beq.s	Lffe310					;$670e			;ffe300
	subq.w	#1,d1					;$5341			;ffe302
	move.w	d1,d3					;$3601			;ffe304
	move.w	(-$0018,a6),d1				;$322e,$ffe8		;ffe306
	movea.l	(-$0016,a6),a0				;$206e,$ffea		;ffe30a
	bsr.s	Lffe350					;$6140			;ffe30e
Lffe310:									;ffe310
	move.w	(-$0006,a6),d1				;$322e,$fffa		;ffe310
	cmp.w	d5,d1					;$b245			;ffe314
	beq.s	Lffe2d6					;$67be			;ffe316
	movea.l	(-$0004,a6),a0				;$206e,$fffc		;ffe318
	move.w	(-$0012,a6),d3				;$362e,$ffee		;ffe31c
	addq.l	#2,a0					;$5488			;ffe320
	addq.w	#1,d1					;$5241			;ffe322
	bra.s	Lffe360					;$603a			;ffe324
Lffe326:									;ffe326
	rts						;$4e75			;ffe326

Lffe328:									;ffe328
	cmpa.w	(-$003e,a6),a4				;$b8ee,$ffc2		;ffe328
	beq.s	Lffe336					;$6708			;ffe32c
	lea.l	(-$0001,a4),a5				;$4bec,$ffff		;ffe32e
	moveq.l	#$00,d0					;$7000			;ffe332
	bsr.s	Lffe342					;$610c			;ffe334
Lffe336:									;ffe336
	cmpa.w	(-$003a,a6),a4				;$b8ee,$ffc6		;ffe336
	beq.s	Lffe326					;$67ea			;ffe33a
	lea.l	($0001,a4),a5				;$4bec,$0001		;ffe33c
	moveq.l	#$ff,d0					;$70ff			;ffe340
Lffe342:									;ffe342
	movea.w	d0,a3					;$3640			;ffe342
Lffe344:									;ffe344
	move.w	(-$0012,a6),d3				;$362e,$ffee		;ffe344
	movea.l	(-$0016,a6),a0				;$206e,$ffea		;ffe348
	move.w	(-$0018,a6),d1				;$322e,$ffe8		;ffe34c
Lffe350:									;ffe350
	move.w	(-$0036,a6),d0				;$302e,$ffca		;ffe350
	move.w	a3,d2					;$340b			;ffe354
	bne.s	Lffe35a					;$6602			;ffe356
	neg.w	d0					;$4440			;ffe358
Lffe35a:									;ffe35a
	adda.w	d0,a0					;$d0c0			;ffe35a
	bra.s	Lffe360					;$6002			;ffe35c
Lffe35e:									;ffe35e
	addq.w	#1,d1					;$5241			;ffe35e
Lffe360:									;ffe360
	cmp.w	d3,d1					;$b243			;ffe360
	bhi.s	Lffe3b6					;$6252			;ffe362
	cmp.w	(a0)+,d6				;$bc58			;ffe364
	bne.s	Lffe35e					;$66f6			;ffe366
	subq.l	#2,a0					;$5588			;ffe368
	bsr.s	Lffe372					;$6106			;ffe36a
	addq.l	#2,a0					;$5488			;ffe36c
	addq.w	#1,d1					;$5241			;ffe36e
	bra.s	Lffe360					;$60ee			;ffe370
Lffe372:									;ffe372
	bsr.w	Lffe27a					;$6100,$ff06		;ffe372
	movea.l	(-$0034,a6),a1				;$226e,$ffcc		;ffe376
	lea.l	($0020,a1),a1				;$43e9,$0020		;ffe37a
	cmpa.l	(-$0028,a6),a1				;$b3ee,$ffd8		;ffe37e
	bls.s	Lffe388					;$6304			;ffe382
	movea.l	(-$002c,a6),a1				;$226e,$ffd4		;ffe384
Lffe388:									;ffe388
	cmpa.l	(-$0030,a6),a1				;$b3ee,$ffd0		;ffe388
	beq.s	Lffe3b6					;$6728			;ffe38c
	move.l	a1,(-$0034,a6)				;$2d49,$ffcc		;ffe38e
	move.w	a3,(a1)+				;$32cb			;ffe392
	move.w	a5,(a1)+				;$32cd			;ffe394
	move.l	(-$0024,a6),(a1)+			;$22ee,$ffdc		;ffe396
	move.l	(-$0020,a6),(a1)+			;$22ee,$ffe0		;ffe39a
	move.l	(-$001c,a6),(a1)+			;$22ee,$ffe4		;ffe39e
	move.l	(-$0018,a6),(a1)+			;$22ee,$ffe8		;ffe3a2
	move.l	(-$0014,a6),(a1)+			;$22ee,$ffec		;ffe3a6
	move.l	(-$0010,a6),(a1)+			;$22ee,$fff0		;ffe3aa
	move.w	(-$001e,a6),d1				;$322e,$ffe2		;ffe3ae
	movea.l	(-$001c,a6),a0				;$206e,$ffe4		;ffe3b2
Lffe3b6:									;ffe3b6
	rts						;$4e75			;ffe3b6

Lffe3b8:									;ffe3b8
	link.w	a6,#-$004e				;$4e56,$ffb2		;ffe3b8
	move.l	($0968),(-$004e,a6)			;$2d78,$0968,$ffb2	;ffe3bc
	move.l	($096c),(-$004a,a6)			;$2d78,$096c,$ffb6	;ffe3c2
	move.w	d4,(-$0004,a6)				;$3d44,$fffc		;ffe3c8
	move.w	d5,(-$0002,a6)				;$3d45,$fffe		;ffe3cc
	move.w	d6,(-$0046,a6)				;$3d46,$ffba		;ffe3d0
	clr.w	(-$0012,a6)				;$426e,$ffee		;ffe3d4
	clr.w	(-$0010,a6)				;$426e,$fff0		;ffe3d8
	clr.w	(-$0014,a6)				;$426e,$ffec		;ffe3dc
	moveq.l	#$ff,d0					;$70ff			;ffe3e0
	tst.w	d2					;$4a42			;ffe3e2
	bpl.s	Lffe3ec					;$6a06			;ffe3e4
	neg.w	d2					;$4442			;ffe3e6
	move.w	d0,(-$0012,a6)				;$3d40,$ffee		;ffe3e8
Lffe3ec:									;ffe3ec
	tst.w	d3					;$4a43			;ffe3ec
	bpl.s	Lffe3f6					;$6a06			;ffe3ee
	neg.w	d3					;$4443			;ffe3f0
	move.w	d0,(-$0010,a6)				;$3d40,$fff0		;ffe3f2
Lffe3f6:									;ffe3f6
	cmp.w	d2,d3					;$b642			;ffe3f6
	bcc.s	Lffe3fe					;$6404			;ffe3f8
	move.w	d0,(-$0014,a6)				;$3d40,$ffec		;ffe3fa
Lffe3fe:									;ffe3fe
	tst.w	d1					;$4a41			;ffe3fe
	bpl.s	Lffe406					;$6a04			;ffe400
	move.w	#$7fff,d1				;$323c,$7fff		;ffe402
Lffe406:									;ffe406
	move.w	d1,(-$0008,a6)				;$3d41,$fff8		;ffe406
	move.w	d1,(-$000a,a6)				;$3d41,$fff6		;ffe40a
	clr.w	(-$0006,a6)				;$426e,$fffa		;ffe40e
	bsr.s	Lffe41c					;$6108			;ffe412
	bsr.w	Lffe510					;$6100,$00fa		;ffe414
	unlk	a6					;$4e5e			;ffe418
Lffe41a:									;ffe41a
	rts						;$4e75			;ffe41a

Lffe41c:									;ffe41c
	lea.l	(-$0024,a6),a0				;$41ee,$ffdc		;ffe41c
	moveq.l	#$07,d1					;$7207			;ffe420
	move.b	#$96,d0					;$103c,$0096		;ffe422
Lffe426:									;ffe426
	clr.w	(a0)+					;$4258			;ffe426
	lsl.b	#1,d0					;$e308			;ffe428
	bcc.s	Lffe432					;$6406			;ffe42a
	move.b	#$01,(-$0001,a0)			;$117c,$0001,$ffff	;ffe42c
Lffe432:									;ffe432
	dbra.w	d1,Lffe426				;$51c9,$fff2		;ffe432
	move.w	d3,d0					;$3003			;ffe436
	bsr.s	Lffe46e					;$6134			;ffe438
	move.w	d1,(-$000c,a6)				;$3d41,$fff4		;ffe43a
	move.b	#$20,(a0)				;$10bc,$0020		;ffe43e
	move.w	d2,d0					;$3002			;ffe442
	bsr.s	Lffe46e					;$6128			;ffe444
	move.w	d1,(-$000e,a6)				;$3d41,$fff2		;ffe446
	bset.b	#$06,(a0)				;$08d0,$0006		;ffe44a
	btst.b	#$05,(a0)				;$0810,$0005		;ffe44e
	beq.s	Lffe45a					;$6706			;ffe452
	tst.w	(-$0014,a6)				;$4a6e,$ffec		;ffe454
	beq.s	Lffe41a					;$67c0			;ffe458
Lffe45a:									;ffe45a
	addq.w	#1,d6					;$5246			;ffe45a
	and.w	#$0007,d6				;$cc7c,$0007		;ffe45c
	bsr.s	Lffe4a6					;$6144			;ffe460
	btst.b	#$05,(a0)				;$0810,$0005		;ffe462
	bne.s	Lffe41a					;$66b2			;ffe466
	bset.b	#$07,(a0)				;$08d0,$0007		;ffe468
	bra.s	Lffe45a					;$60ec			;ffe46c
Lffe46e:									;ffe46e
	move.w	#$002d,d6				;$3c3c,$002d		;ffe46e
	moveq.l	#$00,d1					;$7200			;ffe472
	cmpi.w	#$0168,d0				;$0c40,$0168		;ffe474
	bls.s	Lffe47e					;$6304			;ffe478
	move.w	#$0168,d0				;$303c,$0168		;ffe47a
Lffe47e:									;ffe47e
	sub.w	d6,d0					;$9046			;ffe47e
	bls.s	Lffe486					;$6304			;ffe480
	addq.w	#1,d1					;$5241			;ffe482
	bra.s	Lffe47e					;$60f8			;ffe484
Lffe486:									;ffe486
	add.w	d6,d0					;$d046			;ffe486
	move.w	d1,-(a7)				;$3f01			;ffe488
	lsr.w	#1,d1					;$e249			;ffe48a
	bcc.s	Lffe492					;$6404			;ffe48c
	sub.w	d6,d0					;$9046			;ffe48e
	neg.w	d0					;$4440			;ffe490
Lffe492:									;ffe492
	moveq.l	#$ff,d1					;$72ff			;ffe492
	cmp.w	d6,d0					;$b046			;ffe494
	beq.s	Lffe4a4					;$670c			;ffe496
	moveq.l	#$00,d1					;$7200			;ffe498
	move.b	(Lffe4b2,pc,d0.w),d1			;$123b,$0016		;ffe49a
	mulu.w	(-$0008,a6),d1				;$c2ee,$fff8		;ffe49e
	lsr.l	#8,d1					;$e089			;ffe4a2
Lffe4a4:									;ffe4a4
	move.w	(a7)+,d6				;$3c1f			;ffe4a4
Lffe4a6:									;ffe4a6
	moveq.l	#$00,d0					;$7000			;ffe4a6
	move.b	(Lffe4e0,pc,d6.w),d0			;$103b,$6036		;ffe4a8
	lea.l	(-$24,a6,d0.w),a0			;$41f6,$00dc		;ffe4ac
	rts						;$4e75			;ffe4b0

Lffe4b2:									;ffe4b2
	.dc.b	$00,$04,$09,$0d,$12,$16,$1b,$1f					;ffe4b2
	.dc.b	$24,$28,$2c,$31,$35,$3a,$3e,$42					;ffe4ba
	.dc.b	$47,$4b,$4f,$53,$58,$5c,$60,$64					;ffe4c2
	.dc.b	$68,$6c,$70,$74,$78,$7c,$80,$84					;ffe4ca
	.dc.b	$88,$8b,$8f,$93,$96,$9a,$9e,$a1					;ffe4d2
	.dc.b	$a5,$a8,$ab,$af,$b2,$b5						;ffe4da
Lffe4e0:									;ffe4e0
	.dc.b	$0e,$0a,$02,$06,$04,$00,$08,$0c					;ffe4e0
Lffe4e8:									;ffe4e8
	bsr.s	Lffe536					;$614c			;ffe4e8
	addq.w	#1,(-$0006,a6)				;$526e,$fffa		;ffe4ea
	move.w	(-$0006,a6),d0				;$302e,$fffa		;ffe4ee
	add.w	d0,d0					;$d040			;ffe4f2
	move.w	(-$000a,a6),d1				;$322e,$fff6		;ffe4f4
	sub.w	d0,d1					;$9240			;ffe4f8
	addq.w	#1,d1					;$5241			;ffe4fa
	bpl.s	Lffe50c					;$6a0e			;ffe4fc
	subq.w	#1,(-$0008,a6)				;$536e,$fff8		;ffe4fe
	move.w	(-$0008,a6),d0				;$302e,$fff8		;ffe502
	add.w	d0,d0					;$d040			;ffe506
	add.w	d0,d1					;$d240			;ffe508
	addq.w	#1,d1					;$5241			;ffe50a
Lffe50c:									;ffe50c
	move.w	d1,(-$000a,a6)				;$3d41,$fff6		;ffe50c
Lffe510:									;ffe510
	move.w	(-$0008,a6),d0				;$302e,$fff8		;ffe510
	sub.w	(-$0006,a6),d0				;$906e,$fffa		;ffe514
	beq.s	Lffe51e					;$6704			;ffe518
	subq.w	#1,d0					;$5340			;ffe51a
	bne.s	Lffe4e8					;$66ca			;ffe51c
Lffe51e:									;ffe51e
	move.w	(-$0006,a6),d0				;$302e,$fffa		;ffe51e
	cmp.w	(-$000e,a6),d0				;$b06e,$fff2		;ffe522
	bcc.s	Lffe52c					;$6404			;ffe526
	move.w	d0,(-$000e,a6)				;$3d40,$fff2		;ffe528
Lffe52c:									;ffe52c
	cmp.w	(-$000c,a6),d0				;$b06e,$fff4		;ffe52c
	bcc.s	Lffe536					;$6404			;ffe530
	move.w	d0,(-$000c,a6)				;$3d40,$fff4		;ffe532
Lffe536:									;ffe536
	bsr.w	Lffe610					;$6100,$00d8		;ffe536
	lea.l	(-$0044,a6),a4				;$49ee,$ffbc		;ffe53a
	moveq.l	#$07,d6					;$7c07			;ffe53e
Lffe540:									;ffe540
	movem.l	d6/a4,-(a7)				;$48e7,$0208		;ffe540
	move.b	($0020,a4),d2				;$142c,$0020		;ffe544
	beq.w	Lffe5d6					;$6700,$008c		;ffe548
	bmi.s	Lffe59a					;$6b4c			;ffe54c
	move.w	(-$0006,a6),d1				;$322e,$fffa		;ffe54e
	lsl.b	#2,d2					;$e50a			;ffe552
	bcc.s	Lffe584					;$642e			;ffe554
	move.w	(-$000e,a6),d0				;$302e,$fff2		;ffe556
	cmp.w	d1,d0					;$b041			;ffe55a
	beq.w	Lffe5e2					;$6700,$0084		;ffe55c
	btst.b	#$00,($0021,a4)				;$082c,$0000,$0021	;ffe560
	bne.s	Lffe56c					;$6604			;ffe566
	bcs.s	Lffe57a					;$6510			;ffe568
	bra.s	Lffe56e					;$6002			;ffe56a
Lffe56c:									;ffe56c
	bcc.s	Lffe57a					;$640c			;ffe56c
Lffe56e:									;ffe56e
	tst.b	d2					;$4a02			;ffe56e
	bpl.s	Lffe5d6					;$6a64			;ffe570
	tst.w	(-$0014,a6)				;$4a6e,$ffec		;ffe572
	beq.s	Lffe5d6					;$675e			;ffe576
	bra.s	Lffe584					;$600a			;ffe578
Lffe57a:									;ffe57a
	tst.b	d2					;$4a02			;ffe57a
	bpl.s	Lffe59a					;$6a1c			;ffe57c
	tst.w	(-$0014,a6)				;$4a6e,$ffec		;ffe57e
	bne.s	Lffe59a					;$6616			;ffe582
Lffe584:									;ffe584
	move.w	(-$000c,a6),d0				;$302e,$fff4		;ffe584
	cmp.w	d1,d0					;$b041			;ffe588
	beq.s	Lffe5e8					;$675c			;ffe58a
	btst.b	#$00,($0021,a4)				;$082c,$0000,$0021	;ffe58c
	beq.s	Lffe598					;$6704			;ffe592
	bcs.s	Lffe59a					;$6504			;ffe594
	bra.s	Lffe5d6					;$603e			;ffe596
Lffe598:									;ffe598
	bcs.s	Lffe5d6					;$653c			;ffe598
Lffe59a:									;ffe59a
	move.w	(a4),d4					;$3814			;ffe59a
	move.w	($0010,a4),d5				;$3a2c,$0010		;ffe59c
	cmp.w	(-$004e,a6),d4				;$b86e,$ffb2		;ffe5a0
	blt.s	Lffe5d6					;$6d30			;ffe5a4
	cmp.w	(-$004a,a6),d4				;$b86e,$ffb6		;ffe5a6
	bgt.s	Lffe5d6					;$6e2a			;ffe5aa
	cmp.w	(-$004c,a6),d5				;$ba6e,$ffb4		;ffe5ac
	blt.s	Lffe5d6					;$6d24			;ffe5b0
	cmp.w	(-$0048,a6),d5				;$ba6e,$ffb8		;ffe5b2
	bgt.s	Lffe5d6					;$6e1e			;ffe5b6
	moveq.l	#$00,d0					;$7000			;ffe5b8
	move.w	d5,d0					;$3005			;ffe5ba
	swap.w	d0					;$4840			;ffe5bc
	lsr.l	#6,d0					;$ec88			;ffe5be
	btst.b	#$02,($0962)				;$0838,$0002,$0962	;ffe5c0
	bne.s	Lffe5ca					;$6602			;ffe5c6
	add.l	d0,d0					;$d080			;ffe5c8
Lffe5ca:									;ffe5ca
	movea.l	($095c),a0				;$2078,$095c		;ffe5ca
	adda.l	d0,a0					;$d1c0			;ffe5ce
	adda.w	d4,a0					;$d0c4			;ffe5d0
	adda.w	d4,a0					;$d0c4			;ffe5d2
	move.w	d7,(a0)					;$3087			;ffe5d4
Lffe5d6:									;ffe5d6
	movem.l	(a7)+,d6/a4				;$4cdf,$1040		;ffe5d6
	addq.l	#2,a4					;$548c			;ffe5da
	dbra.w	d6,Lffe540				;$51ce,$ff62		;ffe5dc
	rts						;$4e75			;ffe5e0

Lffe5e2:									;ffe5e2
	tst.w	(-$0012,a6)				;$4a6e,$ffee		;ffe5e2
	bra.s	Lffe5ec					;$6004			;ffe5e6
Lffe5e8:									;ffe5e8
	tst.w	(-$0010,a6)				;$4a6e,$fff0		;ffe5e8
Lffe5ec:									;ffe5ec
	beq.s	Lffe59a					;$67ac			;ffe5ec
	move.w	(a4),d0					;$3014			;ffe5ee
	move.w	($0010,a4),d1				;$322c,$0010		;ffe5f0
	move.w	(-$0004,a6),d2				;$342e,$fffc		;ffe5f4
	move.w	(-$0002,a6),d3				;$362e,$fffe		;ffe5f8
	moveq.l	#$ff,d6					;$7cff			;ffe5fc
	lea.l	($0d1a),a0				;$41f8,$0d1a		;ffe5fe
	move.w	(a0),-(a7)				;$3f10			;ffe602
	clr.w	(a0)					;$4250			;ffe604
	bsr.w	Lffe816					;$6100,$020e		;ffe606
	move.w	(a7)+,($0d1a)				;$31df,$0d1a		;ffe60a
	bra.s	Lffe5d6					;$60c6			;ffe60e
Lffe610:									;ffe610
	lea.l	(-$0044,a6),a4				;$49ee,$ffbc		;ffe610
	lea.l	(-$0034,a6),a5				;$4bee,$ffcc		;ffe614
	move.w	(-$0008,a6),d0				;$302e,$fff8		;ffe618
	bsr.s	Lffe622					;$6104			;ffe61c
	move.w	(-$0006,a6),d0				;$302e,$fffa		;ffe61e
Lffe622:									;ffe622
	bsr.s	Lffe658					;$6134			;ffe622
	move.w	(-$0004,a6),d0				;$302e,$fffc		;ffe624
	add.w	d5,d0					;$d045			;ffe628
	move.w	d0,($000c,a4)				;$3940,$000c		;ffe62a
	move.w	d0,($000e,a4)				;$3940,$000e		;ffe62e
	move.w	(-$0004,a6),d0				;$302e,$fffc		;ffe632
	sub.w	d5,d0					;$9045			;ffe636
	move.w	d0,($0004,a4)				;$3940,$0004		;ffe638
	move.w	d0,($0006,a4)				;$3940,$0006		;ffe63c
	subq.l	#4,a4					;$598c			;ffe640
	move.w	(-$0002,a6),d0				;$302e,$fffe		;ffe642
	add.w	d4,d0					;$d044			;ffe646
	bsr.s	Lffe650					;$6106			;ffe648
	move.w	(-$0002,a6),d0				;$302e,$fffe		;ffe64a
	sub.w	d4,d0					;$9044			;ffe64e
Lffe650:									;ffe650
	move.w	d0,($0008,a5)				;$3b40,$0008		;ffe650
	move.w	d0,(a5)+				;$3ac0			;ffe654
	rts						;$4e75			;ffe656

Lffe658:									;ffe658
	move.w	d0,d4					;$3800			;ffe658
	move.w	d0,d5					;$3a00			;ffe65a
	move.w	(-$0046,a6),d0				;$302e,$ffba		;ffe65c
	cmp.w	#$0100,d0				;$b07c,$0100		;ffe660
	beq.s	Lffe690					;$672a			;ffe664
	bcc.s	Lffe66e					;$6406			;ffe666
	mulu.w	d0,d4					;$c8c0			;ffe668
	lsr.l	#8,d4					;$e08c			;ffe66a
	rts						;$4e75			;ffe66c

Lffe66e:									;ffe66e
	moveq.l	#$00,d1					;$7200			;ffe66e
	move.w	d0,d1					;$3200			;ffe670
	moveq.l	#$00,d0					;$7000			;ffe672
	move.w	d5,d0					;$3005			;ffe674
	lsl.l	#8,d0					;$e188			;ffe676
	moveq.l	#$00,d2					;$7400			;ffe678
	moveq.l	#$1f,d3					;$761f			;ffe67a
Lffe67c:									;ffe67c
	add.l	d0,d0					;$d080			;ffe67c
	roxl.l	#1,d2					;$e392			;ffe67e
	cmp.l	d1,d2					;$b481			;ffe680
	bcs.s	Lffe68a					;$6506			;ffe682
	bset.l	#$00,d0					;$08c0,$0000		;ffe684
	sub.l	d1,d2					;$9481			;ffe688
Lffe68a:									;ffe68a
	dbra.w	d3,Lffe67c				;$51cb,$fff0		;ffe68a
	move.w	d0,d5					;$3a00			;ffe68e
Lffe690:									;ffe690
	rts						;$4e75			;ffe690

Lffe692:									;ffe692
	link.w	a6,#-$0008				;$4e56,$fff8		;ffe692
	move.l	($0954),(-$0008,a6)			;$2d78,$0954,$fff8	;ffe696
	move.l	($0958),(-$0004,a6)			;$2d78,$0958,$fffc	;ffe69c
	subi.l	#$00010001,(-$0004,a6)			;$04ae,$0001,$0001,$fffc	;ffe6a2
	bra.s	Lffe6bc					;$6010			;ffe6aa
Lffe6ac:									;ffe6ac
	link.w	a6,#-$0008				;$4e56,$fff8		;ffe6ac
	move.l	($0968),(-$0008,a6)			;$2d78,$0968,$fff8	;ffe6b0
	move.l	($096c),(-$0004,a6)			;$2d78,$096c,$fffc	;ffe6b6
Lffe6bc:									;ffe6bc
	movem.l	d4-d7/a0-a3,-(a7)			;$48e7,$0ff0		;ffe6bc
	moveq.l	#$00,d6					;$7c00			;ffe6c0
	exg.l	d0,d2					;$c142			;ffe6c2
	exg.l	d1,d3					;$c343			;ffe6c4
	bsr.w	Lffe78c					;$6100,$00c4		;ffe6c6
	exg.l	d0,d2					;$c142			;ffe6ca
	exg.l	d1,d3					;$c343			;ffe6cc
	move.w	d4,d5					;$3a04			;ffe6ce
Lffe6d0:									;ffe6d0
	bsr.w	Lffe78c					;$6100,$00ba		;ffe6d0
	move.w	d4,d7					;$3e04			;ffe6d4
	or.w	d5,d7					;$8e45			;ffe6d6
	bne.s	Lffe6ea					;$6610			;ffe6d8
	tst.w	d6					;$4a46			;ffe6da
	beq.s	Lffe6e2					;$6704			;ffe6dc
	exg.l	d0,d2					;$c142			;ffe6de
	exg.l	d1,d3					;$c343			;ffe6e0
Lffe6e2:									;ffe6e2
	movem.l	(a7)+,d4-d7/a0-a3			;$4cdf,$0ff0		;ffe6e2
	unlk	a6					;$4e5e			;ffe6e6
	rts						;$4e75			;ffe6e8

Lffe6ea:									;ffe6ea
	move.w	d4,d7					;$3e04			;ffe6ea
	and.w	d5,d7					;$ce45			;ffe6ec
	bne.s	Lffe700					;$6610			;ffe6ee
	tst.w	d4					;$4a44			;ffe6f0
	bne.s	Lffe6fc					;$6608			;ffe6f2
	exg.l	d0,d2					;$c142			;ffe6f4
	exg.l	d1,d3					;$c343			;ffe6f6
	exg.l	d4,d5					;$c945			;ffe6f8
	not.w	d6					;$4646			;ffe6fa
Lffe6fc:									;ffe6fc
	bsr.s	Lffe706					;$6108			;ffe6fc
	bra.s	Lffe6d0					;$60d0			;ffe6fe
Lffe700:									;ffe700
	ori.b	#$01,ccr				;$003c,$0001		;ffe700
	bra.s	Lffe6e2					;$60dc			;ffe704
Lffe706:									;ffe706
	move.w	d4,ccr					;$44c4			;ffe706
	bcs.s	Lffe726					;$651c			;ffe708
	bvs.s	Lffe72c					;$6920			;ffe70a
	beq.s	Lffe714					;$6706			;ffe70c
	move.w	(-$0002,a6),d7				;$3e2e,$fffe		;ffe70e
	bra.s	Lffe718					;$6004			;ffe712
Lffe714:									;ffe714
	move.w	(-$0006,a6),d7				;$3e2e,$fffa		;ffe714
Lffe718:									;ffe718
	movea.w	d1,a0					;$3041			;ffe718
	movea.w	d0,a1					;$3240			;ffe71a
	movea.w	d3,a2					;$3443			;ffe71c
	movea.w	d2,a3					;$3642			;ffe71e
	bsr.s	Lffe738					;$6116			;ffe720
	exg.l	d0,d1					;$c141			;ffe722
	rts						;$4e75			;ffe724

Lffe726:									;ffe726
	move.w	(-$0008,a6),d7				;$3e2e,$fff8		;ffe726
	bra.s	Lffe730					;$6004			;ffe72a
Lffe72c:									;ffe72c
	move.w	(-$0004,a6),d7				;$3e2e,$fffc		;ffe72c
Lffe730:									;ffe730
	movea.w	d0,a0					;$3040			;ffe730
	movea.w	d1,a1					;$3241			;ffe732
	movea.w	d2,a2					;$3442			;ffe734
	movea.w	d3,a3					;$3643			;ffe736
Lffe738:									;ffe738
	adda.w	#$8000,a0				;$d0fc,$8000		;ffe738
	adda.w	#$8000,a1				;$d2fc,$8000		;ffe73c
	adda.w	#$8000,a2				;$d4fc,$8000		;ffe740
	adda.w	#$8000,a3				;$d6fc,$8000		;ffe744
	add.w	#$8000,d7				;$de7c,$8000		;ffe748
	cmpa.w	a0,a2					;$b4c8			;ffe74c
	bcc.s	Lffe754					;$6404			;ffe74e
	exg.l	a0,a2					;$c14a			;ffe750
	exg.l	a1,a3					;$c34b			;ffe752
Lffe754:									;ffe754
	cmp.w	a0,d7					;$be48			;ffe754
	beq.s	Lffe77e					;$6726			;ffe756
	cmp.w	a2,d7					;$be4a			;ffe758
	beq.s	Lffe77a					;$671e			;ffe75a
Lffe75c:									;ffe75c
	move.w	a1,d1					;$3209			;ffe75c
	add.w	a3,d1					;$d24b			;ffe75e
	roxr.w	#1,d1					;$e251			;ffe760
	move.w	a0,d0					;$3008			;ffe762
	add.w	a2,d0					;$d04a			;ffe764
	roxr.w	#1,d0					;$e250			;ffe766
	cmp.w	d7,d0					;$b047			;ffe768
	beq.s	Lffe782					;$6716			;ffe76a
	bcs.s	Lffe774					;$6506			;ffe76c
	movea.w	d0,a2					;$3440			;ffe76e
	movea.w	d1,a3					;$3641			;ffe770
	bra.s	Lffe75c					;$60e8			;ffe772
Lffe774:									;ffe774
	movea.w	d0,a0					;$3040			;ffe774
	movea.w	d1,a1					;$3241			;ffe776
	bra.s	Lffe75c					;$60e2			;ffe778
Lffe77a:									;ffe77a
	exg.l	a0,a2					;$c14a			;ffe77a
	exg.l	a1,a3					;$c34b			;ffe77c
Lffe77e:									;ffe77e
	move.w	a0,d0					;$3008			;ffe77e
	move.w	a1,d1					;$3209			;ffe780
Lffe782:									;ffe782
	sub.w	#$8000,d0				;$907c,$8000		;ffe782
	sub.w	#$8000,d1				;$927c,$8000		;ffe786
	rts						;$4e75			;ffe78a

Lffe78c:									;ffe78c
	clr.w	d4					;$4244			;ffe78c
	cmp.w	(-$0008,a6),d0				;$b06e,$fff8		;ffe78e
	bge.s	Lffe796					;$6c02			;ffe792
	addq.w	#1,d4					;$5244			;ffe794
Lffe796:									;ffe796
	cmp.w	(-$0004,a6),d0				;$b06e,$fffc		;ffe796
	ble.s	Lffe79e					;$6f02			;ffe79a
	addq.w	#2,d4					;$5444			;ffe79c
Lffe79e:									;ffe79e
	cmp.w	(-$0006,a6),d1				;$b26e,$fffa		;ffe79e
	bge.s	Lffe7a6					;$6c02			;ffe7a2
	addq.w	#4,d4					;$5844			;ffe7a4
Lffe7a6:									;ffe7a6
	cmp.w	(-$0002,a6),d1				;$b26e,$fffe		;ffe7a6
	ble.s	Lffe7ae					;$6f02			;ffe7aa
	addq.w	#8,d4					;$5044			;ffe7ac
Lffe7ae:									;ffe7ae
	rts						;$4e75			;ffe7ae

Lffe7b0:									;ffe7b0
	cmp.w	d1,d3					;$b641			;ffe7b0
	beq.s	Lffe800					;$674c			;ffe7b2
	cmp.w	d0,d2					;$b440			;ffe7b4
	beq.s	Lffe80a					;$6752			;ffe7b6
	movem.w	d0-d3,-(a7)				;$48a7,$f000		;ffe7b8
	move.w	($0000.w,a7),d4				;$382f,$0000		;ffe7bc
	move.w	($0002,a7),d5				;$3a2f,$0002		;ffe7c0
	move.w	($0004,a7),d1				;$322f,$0004		;ffe7c4
	bsr.w	Lffe8ba					;$6100,$00f0		;ffe7c8
	move.w	($0004,a7),d4				;$382f,$0004		;ffe7cc
	move.w	($0002,a7),d5				;$3a2f,$0002		;ffe7d0
	move.w	($0006,a7),d1				;$322f,$0006		;ffe7d4
	bsr.w	Lffe994					;$6100,$01ba		;ffe7d8
	move.w	($0004,a7),d4				;$382f,$0004		;ffe7dc
	move.w	($0006,a7),d5				;$3a2f,$0006		;ffe7e0
	move.w	($0000.w,a7),d1				;$322f,$0000		;ffe7e4
	bsr.w	Lffe8ba					;$6100,$00d0		;ffe7e8
	move.w	($0000.w,a7),d4				;$382f,$0000		;ffe7ec
	move.w	($0006,a7),d5				;$3a2f,$0006		;ffe7f0
	move.w	($0002,a7),d1				;$322f,$0002		;ffe7f4
	bsr.w	Lffe994					;$6100,$019a		;ffe7f8
	addq.l	#8,a7					;$508f			;ffe7fc
	rts						;$4e75			;ffe7fe

Lffe800:									;ffe800
	move.w	d0,d4					;$3800			;ffe800
	move.w	d1,d5					;$3a01			;ffe802
	move.w	d2,d1					;$3202			;ffe804
	bra.w	Lffe8c4					;$6000,$00bc		;ffe806
Lffe80a:									;ffe80a
	move.w	d0,d4					;$3800			;ffe80a
	move.w	d1,d5					;$3a01			;ffe80c
	move.w	d3,d1					;$3203			;ffe80e
	bra.w	Lffe99e					;$6000,$018c		;ffe810
Lffe814:									;ffe814
	rts						;$4e75			;ffe814

Lffe816:									;ffe816
	bsr.w	Lffe6ac					;$6100,$fe94		;ffe816
	bcs.s	Lffe814					;$65f8			;ffe81a
	cmp.w	d1,d3					;$b641			;ffe81c
	beq.s	Lffe800					;$67e0			;ffe81e
	cmp.w	d0,d2					;$b440			;ffe820
	beq.s	Lffe80a					;$67e6			;ffe822
	move.l	d0,d4					;$2800			;ffe824
	move.l	d1,d5					;$2a01			;ffe826
	moveq.l	#$00,d1					;$7200			;ffe828
	moveq.l	#$02,d0					;$7002			;ffe82a
	sub.w	d4,d2					;$9444			;ffe82c
	bcc.s	Lffe836					;$6406			;ffe82e
	st.b	d1					;$50c1			;ffe830
	neg.w	d2					;$4442			;ffe832
	moveq.l	#$fe,d0					;$70fe			;ffe834
Lffe836:									;ffe836
	movea.l	d0,a1					;$2240			;ffe836
	move.w	($0962),d0				;$3038,$0962		;ffe838
	sub.w	d5,d3					;$9645			;ffe83c
	bcc.s	Lffe848					;$6408			;ffe83e
	bset.l	#$10,d1					;$08c1,$0010		;ffe840
	neg.w	d3					;$4443			;ffe844
	neg.w	d0					;$4440			;ffe846
Lffe848:									;ffe848
	movea.w	d0,a2					;$3440			;ffe848
	cmp.w	d3,d2					;$b443			;ffe84a
	bcc.s	Lffe854					;$6406			;ffe84c
	swap.w	d1					;$4841			;ffe84e
	exg.l	d2,d3					;$c543			;ffe850
	exg.l	a1,a2					;$c34a			;ffe852
Lffe854:									;ffe854
	move.w	d1,d0					;$3001			;ffe854
	move.w	d2,d1					;$3202			;ffe856
	lsr.w	#1,d1					;$e249			;ffe858
	bcs.s	Lffe862					;$6506			;ffe85a
	tst.b	d0					;$4a00			;ffe85c
	beq.s	Lffe862					;$6702			;ffe85e
	subq.w	#1,d1					;$5341			;ffe860
Lffe862:									;ffe862
	moveq.l	#$00,d0					;$7000			;ffe862
	move.w	d5,d0					;$3005			;ffe864
	swap.w	d0					;$4840			;ffe866
	lsr.l	#6,d0					;$ec88			;ffe868
	btst.b	#$02,($0962)				;$0838,$0002,$0962	;ffe86a
	bne.s	Lffe874					;$6602			;ffe870
	add.l	d0,d0					;$d080			;ffe872
Lffe874:									;ffe874
	movea.l	($095c),a0				;$2078,$095c		;ffe874
	adda.l	d0,a0					;$d1c0			;ffe878
	adda.w	d4,a0					;$d0c4			;ffe87a
	adda.w	d4,a0					;$d0c4			;ffe87c
	move.w	($0d1a),d0				;$3038,$0d1a		;ffe87e
	bne.s	Lffe8a0					;$661c			;ffe882
	move.w	d2,d0					;$3002			;ffe884
Lffe886:									;ffe886
	rol.w	#1,d6					;$e35e			;ffe886
	bcc.s	Lffe88c					;$6402			;ffe888
	move.w	d7,(a0)					;$3087			;ffe88a
Lffe88c:									;ffe88c
	subq.w	#1,d0					;$5340			;ffe88c
	bmi.s	Lffe89e					;$6b0e			;ffe88e
	adda.w	a1,a0					;$d0c9			;ffe890
	add.w	d3,d1					;$d243			;ffe892
	cmp.w	d2,d1					;$b242			;ffe894
	bcs.s	Lffe886					;$65ee			;ffe896
	sub.w	d2,d1					;$9242			;ffe898
	adda.w	a2,a0					;$d0ca			;ffe89a
	bra.s	Lffe886					;$60e8			;ffe89c
Lffe89e:									;ffe89e
	rts						;$4e75			;ffe89e

Lffe8a0:									;ffe8a0
	move.w	d2,d0					;$3002			;ffe8a0
Lffe8a2:									;ffe8a2
	rol.w	#1,d6					;$e35e			;ffe8a2
	bcc.s	Lffe8a8					;$6402			;ffe8a4
	not.w	(a0)					;$4650			;ffe8a6
Lffe8a8:									;ffe8a8
	subq.w	#1,d0					;$5340			;ffe8a8
	bmi.s	Lffe89e					;$6bf2			;ffe8aa
	adda.w	a1,a0					;$d0c9			;ffe8ac
	add.w	d3,d1					;$d243			;ffe8ae
	cmp.w	d2,d1					;$b242			;ffe8b0
	bcs.s	Lffe8a2					;$65ee			;ffe8b2
	sub.w	d2,d1					;$9242			;ffe8b4
	adda.w	a2,a0					;$d0ca			;ffe8b6
	bra.s	Lffe8a2					;$60e8			;ffe8b8
Lffe8ba:									;ffe8ba
	cmp.w	d4,d1					;$b244			;ffe8ba
	bgt.s	Lffe8c2					;$6e04			;ffe8bc
	addq.w	#1,d1					;$5241			;ffe8be
	bra.s	Lffe8c4					;$6002			;ffe8c0
Lffe8c2:									;ffe8c2
	subq.w	#1,d1					;$5341			;ffe8c2
Lffe8c4:									;ffe8c4
	bsr.w	Lffea36					;$6100,$0170		;ffe8c4
	bcs.s	Lffe906					;$653c			;ffe8c8
	cmp.w	#$ffff,d6				;$bc7c,$ffff		;ffe8ca
	beq.w	Lffe956					;$6700,$0086		;ffe8ce
	moveq.l	#$00,d0					;$7000			;ffe8d2
	move.w	d5,d0					;$3005			;ffe8d4
	swap.w	d0					;$4840			;ffe8d6
	lsr.l	#6,d0					;$ec88			;ffe8d8
	btst.b	#$02,($0962)				;$0838,$0002,$0962	;ffe8da
	bne.s	Lffe8e4					;$6602			;ffe8e0
	add.l	d0,d0					;$d080			;ffe8e2
Lffe8e4:									;ffe8e4
	movea.l	($095c),a0				;$2078,$095c		;ffe8e4
	adda.l	d0,a0					;$d1c0			;ffe8e8
	adda.w	d4,a0					;$d0c4			;ffe8ea
	adda.w	d4,a0					;$d0c4			;ffe8ec
	sub.w	d4,d1					;$9244			;ffe8ee
	bcc.s	Lffe928					;$6436			;ffe8f0
	move.w	($0d1a),d0				;$3038,$0d1a		;ffe8f2
	bne.s	Lffe910					;$6618			;ffe8f6
	addq.l	#2,a0					;$5488			;ffe8f8
	neg.w	d1					;$4441			;ffe8fa
Lffe8fc:									;ffe8fc
	rol.w	#1,d6					;$e35e			;ffe8fc
	bcc.s	Lffe908					;$6408			;ffe8fe
	move.w	d7,-(a0)				;$3107			;ffe900
	dbra.w	d1,Lffe8fc				;$51c9,$fff8		;ffe902
Lffe906:									;ffe906
	rts						;$4e75			;ffe906

Lffe908:									;ffe908
	subq.l	#2,a0					;$5588			;ffe908
	dbra.w	d1,Lffe8fc				;$51c9,$fff0		;ffe90a
	rts						;$4e75			;ffe90e

Lffe910:									;ffe910
	addq.l	#2,a0					;$5488			;ffe910
	neg.w	d1					;$4441			;ffe912
Lffe914:									;ffe914
	rol.w	#1,d6					;$e35e			;ffe914
	bcc.s	Lffe920					;$6408			;ffe916
	not.w	-(a0)					;$4660			;ffe918
	dbra.w	d1,Lffe914				;$51c9,$fff8		;ffe91a
	rts						;$4e75			;ffe91e

Lffe920:									;ffe920
	subq.l	#2,a0					;$5588			;ffe920
	dbra.w	d1,Lffe914				;$51c9,$fff0		;ffe922
	rts						;$4e75			;ffe926

Lffe928:									;ffe928
	move.w	($0d1a),d0				;$3038,$0d1a		;ffe928
	bne.s	Lffe942					;$6614			;ffe92c
	rol.w	#1,d6					;$e35e			;ffe92e
	bcc.s	Lffe93a					;$6408			;ffe930
	move.w	d7,(a0)+				;$30c7			;ffe932
	dbra.w	d1,Lffe928				;$51c9,$fff2		;ffe934
	rts						;$4e75			;ffe938

Lffe93a:									;ffe93a
	addq.l	#2,a0					;$5488			;ffe93a
	dbra.w	d1,Lffe928				;$51c9,$ffea		;ffe93c
	rts						;$4e75			;ffe940

Lffe942:									;ffe942
	rol.w	#1,d6					;$e35e			;ffe942
	bcc.s	Lffe94e					;$6408			;ffe944
	not.w	(a0)+					;$4658			;ffe946
	dbra.w	d1,Lffe942				;$51c9,$fff8		;ffe948
	rts						;$4e75			;ffe94c

Lffe94e:									;ffe94e
	addq.l	#2,a0					;$5488			;ffe94e
	dbra.w	d1,Lffe942				;$51c9,$fff0		;ffe950
	rts						;$4e75			;ffe954

Lffe956:									;ffe956
	cmp.w	d4,d1					;$b244			;ffe956
	bcc.s	Lffe95c					;$6402			;ffe958
	exg.l	d1,d4					;$c344			;ffe95a
Lffe95c:									;ffe95c
	sub.w	d4,d1					;$9244			;ffe95c
	moveq.l	#$00,d0					;$7000			;ffe95e
	move.w	d5,d0					;$3005			;ffe960
	swap.w	d0					;$4840			;ffe962
	lsr.l	#6,d0					;$ec88			;ffe964
	btst.b	#$02,($0962)				;$0838,$0002,$0962	;ffe966
	bne.s	Lffe970					;$6602			;ffe96c
	add.l	d0,d0					;$d080			;ffe96e
Lffe970:									;ffe970
	movea.l	($095c),a1				;$2278,$095c		;ffe970
	adda.l	d0,a1					;$d3c0			;ffe974
	adda.w	d4,a1					;$d2c4			;ffe976
	adda.w	d4,a1					;$d2c4			;ffe978
	addq.w	#1,d1					;$5241			;ffe97a
	swap.w	d1					;$4841			;ffe97c
	clr.w	d1					;$4241			;ffe97e
	swap.w	d1					;$4841			;ffe980
	move.w	d7,d0					;$3007			;ffe982
	swap.w	d7					;$4847			;ffe984
	move.w	d0,d7					;$3e00			;ffe986
	move.w	($0d1a),d0				;$3038,$0d1a		;ffe988
	beq.w	Lffeb56					;$6700,$01c8		;ffe98c
	bra.w	Lffebba					;$6000,$0228		;ffe990
Lffe994:									;ffe994
	cmp.w	d5,d1					;$b245			;ffe994
	bgt.s	Lffe99c					;$6e04			;ffe996
	addq.w	#1,d1					;$5241			;ffe998
	bra.s	Lffe99e					;$6002			;ffe99a
Lffe99c:									;ffe99c
	subq.w	#1,d1					;$5341			;ffe99c
Lffe99e:									;ffe99e
	bsr.w	Lffea74					;$6100,$00d4		;ffe99e
	bcs.s	Lffe9e6					;$6542			;ffe9a2
	cmp.w	#$ffff,d6				;$bc7c,$ffff		;ffe9a4
	beq.s	Lffe9f6					;$674c			;ffe9a8
	moveq.l	#$00,d0					;$7000			;ffe9aa
	move.w	d5,d0					;$3005			;ffe9ac
	swap.w	d0					;$4840			;ffe9ae
	lsr.l	#6,d0					;$ec88			;ffe9b0
	btst.b	#$02,($0962)				;$0838,$0002,$0962	;ffe9b2
	bne.s	Lffe9bc					;$6602			;ffe9b8
	add.l	d0,d0					;$d080			;ffe9ba
Lffe9bc:									;ffe9bc
	movea.l	($095c),a0				;$2078,$095c		;ffe9bc
	adda.l	d0,a0					;$d1c0			;ffe9c0
	adda.w	d4,a0					;$d0c4			;ffe9c2
	adda.w	d4,a0					;$d0c4			;ffe9c4
	moveq.l	#$00,d0					;$7000			;ffe9c6
	move.w	($0962),d0				;$3038,$0962		;ffe9c8
	sub.w	d5,d1					;$9245			;ffe9cc
	bcc.s	Lffe9d4					;$6404			;ffe9ce
	neg.w	d0					;$4440			;ffe9d0
	neg.w	d1					;$4441			;ffe9d2
Lffe9d4:									;ffe9d4
	move.w	($0d1a),d2				;$3438,$0d1a		;ffe9d4
	bne.s	Lffe9e8					;$660e			;ffe9d8
Lffe9da:									;ffe9da
	rol.w	#1,d6					;$e35e			;ffe9da
	bcc.s	Lffe9e0					;$6402			;ffe9dc
	move.w	d7,(a0)					;$3087			;ffe9de
Lffe9e0:									;ffe9e0
	adda.w	d0,a0					;$d0c0			;ffe9e0
	dbra.w	d1,Lffe9da				;$51c9,$fff6		;ffe9e2
Lffe9e6:									;ffe9e6
	rts						;$4e75			;ffe9e6

Lffe9e8:									;ffe9e8
	rol.w	#1,d6					;$e35e			;ffe9e8
	bcc.s	Lffe9ee					;$6402			;ffe9ea
	not.w	(a0)					;$4650			;ffe9ec
Lffe9ee:									;ffe9ee
	adda.w	d0,a0					;$d0c0			;ffe9ee
	dbra.w	d1,Lffe9e8				;$51c9,$fff6		;ffe9f0
	rts						;$4e75			;ffe9f4

Lffe9f6:									;ffe9f6
	cmp.w	d5,d1					;$b245			;ffe9f6
	bcc.s	Lffe9fc					;$6402			;ffe9f8
	exg.l	d1,d5					;$c345			;ffe9fa
Lffe9fc:									;ffe9fc
	sub.w	d5,d1					;$9245			;ffe9fc
	moveq.l	#$00,d0					;$7000			;ffe9fe
	move.w	d5,d0					;$3005			;ffea00
	swap.w	d0					;$4840			;ffea02
	lsr.l	#6,d0					;$ec88			;ffea04
	btst.b	#$02,($0962)				;$0838,$0002,$0962	;ffea06
	bne.s	Lffea10					;$6602			;ffea0c
	add.l	d0,d0					;$d080			;ffea0e
Lffea10:									;ffea10
	movea.l	($095c),a1				;$2278,$095c		;ffea10
	adda.l	d0,a1					;$d3c0			;ffea14
	adda.w	d4,a1					;$d2c4			;ffea16
	adda.w	d4,a1					;$d2c4			;ffea18
	addq.w	#1,d1					;$5241			;ffea1a
	swap.w	d1					;$4841			;ffea1c
	clr.w	d1					;$4241			;ffea1e
	swap.w	d1					;$4841			;ffea20
	btst.b	#$03,($0962)				;$0838,$0003,$0962	;ffea22
	sne.b	d0					;$56c0			;ffea28
	move.w	($0d1a),d2				;$3438,$0d1a		;ffea2a
	beq.w	Lffec32					;$6700,$0202		;ffea2e
	bra.w	Lffec1e					;$6000,$01ea		;ffea32
Lffea36:									;ffea36
	move.l	($0968),d2				;$2438,$0968		;ffea36
	move.l	($096c),d3				;$2638,$096c		;ffea3a
	cmp.w	d2,d5					;$ba42			;ffea3e
	blt.s	Lffea6e					;$6d2c			;ffea40
	cmp.w	d3,d5					;$ba43			;ffea42
	bgt.s	Lffea6e					;$6e28			;ffea44
	swap.w	d2					;$4842			;ffea46
	swap.w	d3					;$4843			;ffea48
	cmp.w	d4,d1					;$b244			;ffea4a
	bge.s	Lffea56					;$6c08			;ffea4c
	exg.l	d4,d1					;$c941			;ffea4e
	bsr.s	Lffea56					;$6104			;ffea50
	exg.l	d4,d1					;$c941			;ffea52
	rts						;$4e75			;ffea54

Lffea56:									;ffea56
	cmp.w	d2,d1					;$b242			;ffea56
	blt.s	Lffea6e					;$6d14			;ffea58
	cmp.w	d3,d4					;$b843			;ffea5a
	bgt.s	Lffea6e					;$6e10			;ffea5c
	cmp.w	d2,d4					;$b842			;ffea5e
	bge.s	Lffea64					;$6c02			;ffea60
	move.w	d2,d4					;$3802			;ffea62
Lffea64:									;ffea64
	cmp.w	d3,d1					;$b243			;ffea64
	ble.s	Lffea6a					;$6f02			;ffea66
	move.w	d3,d1					;$3203			;ffea68
Lffea6a:									;ffea6a
	tst.w	d0					;$4a40			;ffea6a
	rts						;$4e75			;ffea6c

Lffea6e:									;ffea6e
	ori.b	#$01,ccr				;$003c,$0001		;ffea6e
	rts						;$4e75			;ffea72

Lffea74:									;ffea74
	cmp.w	($0968),d4				;$b878,$0968		;ffea74
	blt.s	Lffea6e					;$6df4			;ffea78
	cmp.w	($096c),d4				;$b878,$096c		;ffea7a
	bgt.s	Lffea6e					;$6eee			;ffea7e
	move.w	($096a),d2				;$3438,$096a		;ffea80
	move.w	($096e),d3				;$3638,$096e		;ffea84
	cmp.w	d5,d1					;$b245			;ffea88
	bge.s	Lffea94					;$6c08			;ffea8a
	exg.l	d5,d1					;$cb41			;ffea8c
	bsr.s	Lffea94					;$6104			;ffea8e
	exg.l	d5,d1					;$cb41			;ffea90
	rts						;$4e75			;ffea92

Lffea94:									;ffea94
	cmp.w	d2,d1					;$b242			;ffea94
	blt.s	Lffea6e					;$6dd6			;ffea96
	cmp.w	d3,d5					;$ba43			;ffea98
	bgt.s	Lffea6e					;$6ed2			;ffea9a
	cmp.w	d2,d5					;$ba42			;ffea9c
	bge.s	Lffeaa2					;$6c02			;ffea9e
	move.w	d2,d5					;$3a02			;ffeaa0
Lffeaa2:									;ffeaa2
	cmp.w	d3,d1					;$b243			;ffeaa2
	ble.s	Lffeaa8					;$6f02			;ffeaa4
	move.w	d3,d1					;$3203			;ffeaa6
Lffeaa8:									;ffeaa8
	tst.w	d0					;$4a40			;ffeaa8
	rts						;$4e75			;ffeaaa

Lffeaac:									;ffeaac
	rts						;$4e75			;ffeaac

Lffeaae:									;ffeaae
	cmp.w	d0,d2					;$b440			;ffeaae
	bge.s	Lffeab4					;$6c02			;ffeab0
	exg.l	d0,d2					;$c142			;ffeab2
Lffeab4:									;ffeab4
	cmp.w	d1,d3					;$b641			;ffeab4
	bge.s	Lffeaba					;$6c02			;ffeab6
	exg.l	d1,d3					;$c343			;ffeab8
Lffeaba:									;ffeaba
	move.l	($0968),d4				;$2838,$0968		;ffeaba
	move.l	($096c),d5				;$2a38,$096c		;ffeabe
	cmp.w	d4,d3					;$b644			;ffeac2
	blt.s	Lffeaac					;$6de6			;ffeac4
	cmp.w	d5,d1					;$b245			;ffeac6
	bgt.s	Lffeaac					;$6ee2			;ffeac8
	swap.w	d4					;$4844			;ffeaca
	swap.w	d5					;$4845			;ffeacc
	cmp.w	d4,d2					;$b444			;ffeace
	blt.s	Lffeaac					;$6dda			;ffead0
	cmp.w	d5,d0					;$b045			;ffead2
	bgt.s	Lffeaac					;$6ed6			;ffead4
	cmp.w	d4,d0					;$b044			;ffead6
	bge.s	Lffeadc					;$6c02			;ffead8
	move.w	d4,d0					;$3004			;ffeada
Lffeadc:									;ffeadc
	cmp.w	d5,d2					;$b445			;ffeadc
	ble.s	Lffeae2					;$6f02			;ffeade
	move.w	d5,d2					;$3405			;ffeae0
Lffeae2:									;ffeae2
	swap.w	d4					;$4844			;ffeae2
	swap.w	d5					;$4845			;ffeae4
	cmp.w	d4,d1					;$b244			;ffeae6
	bge.s	Lffeaec					;$6c02			;ffeae8
	move.w	d4,d1					;$3204			;ffeaea
Lffeaec:									;ffeaec
	cmp.w	d5,d3					;$b645			;ffeaec
	ble.s	Lffeaf2					;$6f02			;ffeaee
	move.w	d5,d3					;$3605			;ffeaf0
Lffeaf2:									;ffeaf2
	move.w	d7,d6					;$3c07			;ffeaf2
	swap.w	d7					;$4847			;ffeaf4
	move.w	d6,d7					;$3e06			;ffeaf6
	move.w	($0d1a),d4				;$3838,$0d1a		;ffeaf8
	beq.s	Lffeb14					;$6716			;ffeafc
	lea.l	(Lffebba,pc),a3				;$47fa,$00ba		;ffeafe
	bra.s	Lffeb18					;$6014			;ffeb02
Lffeb04:									;ffeb04
	movem.l	($0968),d0/d2				;$4cf8,$0005,$0968	;ffeb04
	move.w	d0,d1					;$3200			;ffeb0a
	move.w	d2,d3					;$3602			;ffeb0c
	swap.w	d0					;$4840			;ffeb0e
	swap.w	d2					;$4842			;ffeb10
	moveq.l	#$00,d7					;$7e00			;ffeb12
Lffeb14:									;ffeb14
	lea.l	(Lffeb56,pc),a3				;$47fa,$0040		;ffeb14
Lffeb18:									;ffeb18
	sub.w	d0,d2					;$9440			;ffeb18
	addq.w	#1,d2					;$5242			;ffeb1a
	sub.w	d1,d3					;$9641			;ffeb1c
	move.w	d0,d4					;$3800			;ffeb1e
	moveq.l	#$00,d0					;$7000			;ffeb20
	move.w	d1,d0					;$3001			;ffeb22
	swap.w	d0					;$4840			;ffeb24
	lsr.l	#6,d0					;$ec88			;ffeb26
	btst.b	#$02,($0962)				;$0838,$0002,$0962	;ffeb28
	bne.s	Lffeb32					;$6602			;ffeb2e
	add.l	d0,d0					;$d080			;ffeb30
Lffeb32:									;ffeb32
	movea.l	($095c),a2				;$2478,$095c		;ffeb32
	adda.l	d0,a2					;$d5c0			;ffeb36
	adda.w	d4,a2					;$d4c4			;ffeb38
	adda.w	d4,a2					;$d4c4			;ffeb3a
	moveq.l	#$00,d4					;$7800			;ffeb3c
	move.w	($0962),d4				;$3838,$0962		;ffeb3e
	swap.w	d2					;$4842			;ffeb42
	clr.w	d2					;$4242			;ffeb44
	swap.w	d2					;$4842			;ffeb46
Lffeb48:									;ffeb48
	movea.l	a2,a1					;$224a			;ffeb48
	move.l	d2,d1					;$2202			;ffeb4a
	jsr	(a3)					;$4e93			;ffeb4c
	adda.l	d4,a2					;$d5c4			;ffeb4e
	dbra.w	d3,Lffeb48				;$51cb,$fff6		;ffeb50
	rts						;$4e75			;ffeb54

Lffeb56:									;ffeb56
	ror.l	#6,d1					;$ec99			;ffeb56
	subq.w	#1,d1					;$5341			;ffeb58
	bmi.s	Lffeb66					;$6b0a			;ffeb5a
	lea.l	(Lffeb62,pc),a0				;$41fa,$0004		;ffeb5c
Lffeb60:									;ffeb60
	bra.s	Lffeb78					;$6016			;ffeb60
Lffeb62:									;ffeb62
	dbra.w	d1,Lffeb60				;$51c9,$fffc		;ffeb62
Lffeb66:									;ffeb66
	clr.w	d1					;$4241			;ffeb66
	rol.l	#5,d1					;$eb99			;ffeb68
	bpl.s	Lffeb6e					;$6a02			;ffeb6a
	move.w	d7,(a1)+				;$32c7			;ffeb6c
Lffeb6e:									;ffeb6e
	add.w	d1,d1					;$d241			;ffeb6e
	neg.w	d1					;$4441			;ffeb70
	movea.l	(a7)+,a0				;$205f			;ffeb72
	jmp	(Lffebb8,pc,d1.w)			;$4efb,$1042		;ffeb74

Lffeb78:									;ffeb78
	move.l	d7,(a1)+				;$22c7			;ffeb78
	move.l	d7,(a1)+				;$22c7			;ffeb7a
	move.l	d7,(a1)+				;$22c7			;ffeb7c
	move.l	d7,(a1)+				;$22c7			;ffeb7e
	move.l	d7,(a1)+				;$22c7			;ffeb80
	move.l	d7,(a1)+				;$22c7			;ffeb82
	move.l	d7,(a1)+				;$22c7			;ffeb84
	move.l	d7,(a1)+				;$22c7			;ffeb86
	move.l	d7,(a1)+				;$22c7			;ffeb88
	move.l	d7,(a1)+				;$22c7			;ffeb8a
	move.l	d7,(a1)+				;$22c7			;ffeb8c
	move.l	d7,(a1)+				;$22c7			;ffeb8e
	move.l	d7,(a1)+				;$22c7			;ffeb90
	move.l	d7,(a1)+				;$22c7			;ffeb92
	move.l	d7,(a1)+				;$22c7			;ffeb94
	move.l	d7,(a1)+				;$22c7			;ffeb96
	move.l	d7,(a1)+				;$22c7			;ffeb98
	move.l	d7,(a1)+				;$22c7			;ffeb9a
	move.l	d7,(a1)+				;$22c7			;ffeb9c
	move.l	d7,(a1)+				;$22c7			;ffeb9e
	move.l	d7,(a1)+				;$22c7			;ffeba0
	move.l	d7,(a1)+				;$22c7			;ffeba2
	move.l	d7,(a1)+				;$22c7			;ffeba4
	move.l	d7,(a1)+				;$22c7			;ffeba6
	move.l	d7,(a1)+				;$22c7			;ffeba8
	move.l	d7,(a1)+				;$22c7			;ffebaa
	move.l	d7,(a1)+				;$22c7			;ffebac
	move.l	d7,(a1)+				;$22c7			;ffebae
	move.l	d7,(a1)+				;$22c7			;ffebb0
	move.l	d7,(a1)+				;$22c7			;ffebb2
	move.l	d7,(a1)+				;$22c7			;ffebb4
	move.l	d7,(a1)+				;$22c7			;ffebb6
Lffebb8:									;ffebb8
	jmp	(a0)					;$4ed0			;ffebb8

Lffebba:									;ffebba
	ror.l	#6,d1					;$ec99			;ffebba
	subq.w	#1,d1					;$5341			;ffebbc
	bmi.s	Lffebca					;$6b0a			;ffebbe
	lea.l	(Lffebc6,pc),a0				;$41fa,$0004		;ffebc0
Lffebc4:									;ffebc4
	bra.s	Lffebdc					;$6016			;ffebc4
Lffebc6:									;ffebc6
	dbra.w	d1,Lffebc4				;$51c9,$fffc		;ffebc6
Lffebca:									;ffebca
	clr.w	d1					;$4241			;ffebca
	rol.l	#5,d1					;$eb99			;ffebcc
	bpl.s	Lffebd2					;$6a02			;ffebce
	not.w	(a1)+					;$4659			;ffebd0
Lffebd2:									;ffebd2
	add.w	d1,d1					;$d241			;ffebd2
	neg.w	d1					;$4441			;ffebd4
	movea.l	(a7)+,a0				;$205f			;ffebd6
	jmp	(Lffec1c,pc,d1.w)			;$4efb,$1042		;ffebd8

Lffebdc:									;ffebdc
	not.l	(a1)+					;$4699			;ffebdc
	not.l	(a1)+					;$4699			;ffebde
	not.l	(a1)+					;$4699			;ffebe0
	not.l	(a1)+					;$4699			;ffebe2
	not.l	(a1)+					;$4699			;ffebe4
	not.l	(a1)+					;$4699			;ffebe6
	not.l	(a1)+					;$4699			;ffebe8
	not.l	(a1)+					;$4699			;ffebea
	not.l	(a1)+					;$4699			;ffebec
	not.l	(a1)+					;$4699			;ffebee
	not.l	(a1)+					;$4699			;ffebf0
	not.l	(a1)+					;$4699			;ffebf2
	not.l	(a1)+					;$4699			;ffebf4
	not.l	(a1)+					;$4699			;ffebf6
	not.l	(a1)+					;$4699			;ffebf8
	not.l	(a1)+					;$4699			;ffebfa
	not.l	(a1)+					;$4699			;ffebfc
	not.l	(a1)+					;$4699			;ffebfe
	not.l	(a1)+					;$4699			;ffec00
	not.l	(a1)+					;$4699			;ffec02
	not.l	(a1)+					;$4699			;ffec04
	not.l	(a1)+					;$4699			;ffec06
	not.l	(a1)+					;$4699			;ffec08
	not.l	(a1)+					;$4699			;ffec0a
	not.l	(a1)+					;$4699			;ffec0c
	not.l	(a1)+					;$4699			;ffec0e
	not.l	(a1)+					;$4699			;ffec10
	not.l	(a1)+					;$4699			;ffec12
	not.l	(a1)+					;$4699			;ffec14
	not.l	(a1)+					;$4699			;ffec16
	not.l	(a1)+					;$4699			;ffec18
	not.l	(a1)+					;$4699			;ffec1a
Lffec1c:									;ffec1c
	jmp	(a0)					;$4ed0			;ffec1c

Lffec1e:									;ffec1e
	lea.l	($4000),a3				;$47f8,$4000		;ffec1e
	lea.l	(Lffecea,pc),a2				;$45fa,$00c6		;ffec22
	tst.b	d0					;$4a00			;ffec26
	beq.s	Lffec44					;$671a			;ffec28
	adda.l	a3,a3					;$d7cb			;ffec2a
	lea.l	(Lffed2c,pc),a2				;$45fa,$00fe		;ffec2c
	bra.s	Lffec44					;$6012			;ffec30
Lffec32:									;ffec32
	lea.l	($4000),a3				;$47f8,$4000		;ffec32
	lea.l	(Lffec66,pc),a2				;$45fa,$002e		;ffec36
	tst.b	d0					;$4a00			;ffec3a
	beq.s	Lffec44					;$6706			;ffec3c
	adda.l	a3,a3					;$d7cb			;ffec3e
	lea.l	(Lffeca8,pc),a2				;$45fa,$0066		;ffec40
Lffec44:									;ffec44
	ror.l	#4,d1					;$e899			;ffec44
	subq.w	#1,d1					;$5341			;ffec46
	bmi.s	Lffec56					;$6b0c			;ffec48
	lea.l	(Lffec50,pc),a0				;$41fa,$0004		;ffec4a
Lffec4e:									;ffec4e
	jmp	(a2)					;$4ed2			;ffec4e

Lffec50:									;ffec50
	adda.l	a3,a1					;$d3cb			;ffec50
	dbra.w	d1,Lffec4e				;$51c9,$fffa		;ffec52
Lffec56:									;ffec56
	clr.w	d1					;$4241			;ffec56
	rol.l	#4,d1					;$e999			;ffec58
	add.w	d1,d1					;$d241			;ffec5a
	add.w	d1,d1					;$d241			;ffec5c
	neg.w	d1					;$4441			;ffec5e
	movea.l	(a7)+,a0				;$205f			;ffec60
	jmp	($40,a2,d1.w)				;$4ef2,$1040		;ffec62

Lffec66:									;ffec66
	move.w	d7,($3c00,a1)				;$3347,$3c00		;ffec66
	move.w	d7,($3800,a1)				;$3347,$3800		;ffec6a
	move.w	d7,($3400,a1)				;$3347,$3400		;ffec6e
	move.w	d7,($3000,a1)				;$3347,$3000		;ffec72
	move.w	d7,($2c00,a1)				;$3347,$2c00		;ffec76
	move.w	d7,($2800,a1)				;$3347,$2800		;ffec7a
	move.w	d7,($2400,a1)				;$3347,$2400		;ffec7e
	move.w	d7,($2000,a1)				;$3347,$2000		;ffec82
	move.w	d7,($1c00,a1)				;$3347,$1c00		;ffec86
	move.w	d7,($1800,a1)				;$3347,$1800		;ffec8a
	move.w	d7,($1400,a1)				;$3347,$1400		;ffec8e
	move.w	d7,($1000,a1)				;$3347,$1000		;ffec92
	move.w	d7,($0c00,a1)				;$3347,$0c00		;ffec96
	move.w	d7,($0800,a1)				;$3347,$0800		;ffec9a
	move.w	d7,($0400,a1)				;$3347,$0400		;ffec9e
	move.w	d7,(a1)					;$3287			;ffeca2
	nop						;$4e71			;ffeca4
	jmp	(a0)					;$4ed0			;ffeca6

Lffeca8:									;ffeca8
	move.w	d7,($7800,a1)				;$3347,$7800		;ffeca8
	move.w	d7,($7000,a1)				;$3347,$7000		;ffecac
	move.w	d7,($6800,a1)				;$3347,$6800		;ffecb0
	move.w	d7,($6000,a1)				;$3347,$6000		;ffecb4
	move.w	d7,($5800,a1)				;$3347,$5800		;ffecb8
	move.w	d7,($5000,a1)				;$3347,$5000		;ffecbc
	move.w	d7,($4800,a1)				;$3347,$4800		;ffecc0
	move.w	d7,($4000,a1)				;$3347,$4000		;ffecc4
	move.w	d7,($3800,a1)				;$3347,$3800		;ffecc8
	move.w	d7,($3000,a1)				;$3347,$3000		;ffeccc
	move.w	d7,($2800,a1)				;$3347,$2800		;ffecd0
	move.w	d7,($2000,a1)				;$3347,$2000		;ffecd4
	move.w	d7,($1800,a1)				;$3347,$1800		;ffecd8
	move.w	d7,($1000,a1)				;$3347,$1000		;ffecdc
	move.w	d7,($0800,a1)				;$3347,$0800		;ffece0
	move.w	d7,(a1)					;$3287			;ffece4
	nop						;$4e71			;ffece6
	jmp	(a0)					;$4ed0			;ffece8

Lffecea:									;ffecea
	not.w	($3c00,a1)				;$4669,$3c00		;ffecea
	not.w	($3800,a1)				;$4669,$3800		;ffecee
	not.w	($3400,a1)				;$4669,$3400		;ffecf2
	not.w	($3000,a1)				;$4669,$3000		;ffecf6
	not.w	($2c00,a1)				;$4669,$2c00		;ffecfa
	not.w	($2800,a1)				;$4669,$2800		;ffecfe
	not.w	($2400,a1)				;$4669,$2400		;ffed02
	not.w	($2000,a1)				;$4669,$2000		;ffed06
	not.w	($1c00,a1)				;$4669,$1c00		;ffed0a
	not.w	($1800,a1)				;$4669,$1800		;ffed0e
	not.w	($1400,a1)				;$4669,$1400		;ffed12
	not.w	($1000,a1)				;$4669,$1000		;ffed16
	not.w	($0c00,a1)				;$4669,$0c00		;ffed1a
	not.w	($0800,a1)				;$4669,$0800		;ffed1e
	not.w	($0400,a1)				;$4669,$0400		;ffed22
	not.w	(a1)					;$4651			;ffed26
	nop						;$4e71			;ffed28
	jmp	(a0)					;$4ed0			;ffed2a

Lffed2c:									;ffed2c
	not.w	($7800,a1)				;$4669,$7800		;ffed2c
	not.w	($7000,a1)				;$4669,$7000		;ffed30
	not.w	($6800,a1)				;$4669,$6800		;ffed34
	not.w	($6000,a1)				;$4669,$6000		;ffed38
	not.w	($5800,a1)				;$4669,$5800		;ffed3c
	not.w	($5000,a1)				;$4669,$5000		;ffed40
	not.w	($4800,a1)				;$4669,$4800		;ffed44
	not.w	($4000,a1)				;$4669,$4000		;ffed48
	not.w	($3800,a1)				;$4669,$3800		;ffed4c
	not.w	($3000,a1)				;$4669,$3000		;ffed50
	not.w	($2800,a1)				;$4669,$2800		;ffed54
	not.w	($2000,a1)				;$4669,$2000		;ffed58
	not.w	($1800,a1)				;$4669,$1800		;ffed5c
	not.w	($1000,a1)				;$4669,$1000		;ffed60
	not.w	($0800,a1)				;$4669,$0800		;ffed64
	not.w	(a1)					;$4651			;ffed68
	nop						;$4e71			;ffed6a
	jmp	(a0)					;$4ed0			;ffed6c

Lffed6e:									;ffed6e
	.dcb.b	4753,$ff							;ffed6e
Lffffff:									;ffffff
	.dc.b	$ff								;ffffff
L000000:									;01000000

	.end	Start								;01000000
