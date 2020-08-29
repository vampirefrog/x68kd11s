;=============================================
;  Filename mxdrv/2.06+16_Rel.3/mxdrv30.x
;
;
;  Base address 000000
;  Exec address 00136a
;  Text size    0016d0 byte(s)
;  Data size    000000 byte(s)
;  Bss  size    000698 byte(s)
;  356 Labels
;
;  Commandline dis  -h -k -m68030 -q1 -B -M -w16 -o120 -gmxdrv/2.06+16_Rel.3/mxdrv30.lab --overwrite mxdrv/2.06+16_Rel.3/mxdrv30.x mxdrv/2.06+16_Rel.3/mxdrv30.s
;          DIS version 3.16
;=============================================

	.include	inc/doscall.mac
	.include	inc/iocscall.mac
	.include	inc/fefunc.mac

	.cpu	68030

	.text

L000000:
	.dc.b	'EX16'
L000004:
	.dc.b	'mxdrv206'
L00000c:
	movem.l	d1-d7/a0-a6,-(a7)
	lea.l	(L001d2c,pc),a5
	and.w	#$001f,d0
	add.w	d0,d0
	move.w	(L000028,pc,d0.w),d0
	jsr	(L000028,pc,d0.w)
L000022:
	movem.l	(a7)+,d1-d7/a0-a6
	rte

L000028:
	.dc.w	L0002b2-L000028
	.dc.w	L000624-L000028
	.dc.w	L0002cc-L000028
	.dc.w	L0002ee-L000028
	.dc.w	L00049a-L000028
	.dc.w	L00034e-L000028
	.dc.w	L0003c6-L000028
	.dc.w	L000406-L000028
	.dc.w	L000628-L000028
	.dc.w	L000646-L000028
	.dc.w	L000068-L000028
	.dc.w	L00006e-L000028
	.dc.w	L000074-L000028
	.dc.w	L000204-L000028
	.dc.w	L00007e-L000028
	.dc.w	L0004a0-L000028
	.dc.w	L000084-L000028
	.dc.w	L00008c-L000028
	.dc.w	L00009c-L000028
	.dc.w	L0000a8-L000028
	.dc.w	L0000b2-L000028
	.dc.w	L0000ba-L000028
	.dc.w	L0000c4-L000028
	.dc.w	L0000d2-L000028
	.dc.w	L0001f4-L000028
	.dc.w	L0001fc-L000028
	.dc.w	L000022-L000028
	.dc.w	L000022-L000028
	.dc.w	L000022-L000028
	.dc.w	L000022-L000028
	.dc.w	L000022-L000028
	.dc.w	L000022-L000028
L000068:
	move.b	d1,(-$03f8,a5)
	rts

L00006e:
	move.b	d1,(-$03f7,a5)
	rts

L000074:
	move.w	d1,(-$03ee,a5)
	st.b	(-$03f5,a5)
	rts

L00007e:
	move.w	d1,(-$03f0,a5)
	rts

L000084:
	lea.l	(L00195c,pc),a0
	move.l	a0,d0
	rts

L00008c:
	lea.l	(L00192e,pc),a0
	tst.l	d1
	bmi	L000098
	move.b	d1,(a0)
	rts

L000098:
	move.b	(a0),d0
	rts

L00009c:
	move.b	(-$03fa,a5),-(a7)
	move.w	(a7)+,d0
	move.b	(-$03f9,a5),d0
	rts

L0000a8:
	move.b	(-$0402,a5),d0
	move.b	d1,(-$0402,a5)
	rts

L0000b2:
	move.w	(-$0406,a5),d0
	not.w	d0
	rts

L0000ba:
	move.b	(-$0401,a5),d0
	move.b	d1,(-$0401,a5)
	rts

L0000c4:
	move.b	(-$0404,a5),d0
	move.b	d1,(-$0404,a5)
	bsr	L00034e
	rts

L0000d2:
	move.b	(-$0404,a5),d0
	beq	L0001e8
	movem.l	d1-d7/a0-a6,-(a7)
	st.b	($0039,a5)
	lea.l	(L00193e,pc),a0
	lea.l	(L001937,pc),a1
	tst.b	(a1)
	beq	L000172
	bpl	L0000fa
	move.b	#$7f,(a1)
	move.w	(a0),($0002,a0)
L0000fa:
	tst.w	($0002,a0)
	bmi	L000106
	subq.w	#2,($0002,a0)
	bra	L000172

L000106:
	lea.l	(L001934,pc),a1
	cmpi.b	#$0a,(a1)
	bge	L00011e
L000110:
	cmpi.b	#$3e,(a1)		;'>'
	bge	L000124
	addq.b	#1,(a1)
	move.w	(a0),($0002,a0)
	bra	L000172

L00011e:
	st.b	(-$03f7,a5)
	bra	L000110

L000124:
	tst.b	(-$03f4,a5)
	beq	L000132
	bsr	L00045e
	bra	L0001d0

L000132:
	move.b	#$7f,(a1)
	clr.b	(-$03f5,a5)
	move.b	#$01,(-$03f9,a5)
	bsr	L0003c6
	movea.l	($0088),a0
	move.l	(-$0008,a0),d0
	cmp.l	#$50434d34,d0		;'PCM4'
	beq	L00015c
	cmp.l	#$50434d38,d0		;'PCM8'
	bne	L000162
L00015c:
	move.w	#$0100,d0
	trap	#2
L000162:
	tst.b	(-$0418,a5)
	beq	L000172
	move.w	#$01ff,d0
	trap	#2
	clr.b	(-$0418,a5)
L000172:
	lea.l	(L00192c,pc),a0
	move.b	(a0),d2
	moveq.l	#$12,d1
	tst.b	(-$03f9,a5)
	bne	L0001d0
	lea.l	(L001a5c,pc),a6
	moveq.l	#$00,d7
L000186:
	bsr	L000ce4
	bsr	L000e48
	move.w	(L00193c,pc),d0
	btst.l	d7,d0
	bne	L00019a
	bsr	L000920
L00019a:
	lea.l	($0050,a6),a6
	addq.w	#1,d7
	cmp.w	#$0009,d7
	bcs	L000186
	tst.b	(-$0418,a5)
	beq	L0001d0
	lea.l	(L0016e4,pc),a6
L0001b0:
	bsr	L000ce4
	bsr	L000e48
	move.w	(L00193c,pc),d0
	btst.l	d7,d0
	bne	L0001c4
	bsr	L000920
L0001c4:
	lea.l	($0050,a6),a6
	addq.w	#1,d7
	cmp.w	#$0010,d7
	bcs	L0001b0
L0001d0:
	tst.b	($00e90003)
	bmi	L0001d0
	move.b	#$1b,($00e90001)
	clr.b	($0039,a5)
	movem.l	(a7)+,d1-d7/a0-a6
L0001e8:
	move.b	(-$03fa,a5),-(a7)
	move.w	(a7)+,d0
	move.b	(-$03f9,a5),d0
	rts

L0001f4:
	lea.l	(L0016e4,pc),a0
	move.l	a0,d0
	rts

L0001fc:
	lea.l	(L0016d4,pc),a0
	move.l	a0,d0
	rts

L000204:
	cmp.b	#$f0,d1
	beq	L00026a
	cmp.b	#$fc,d1
	beq	L000246
	tst.l	d1
	bmi	L00024c
	tst.b	(-$03f4,a5)
	bne	L000624
	move.l	a2,(-$03dc,a5)
	move.l	a1,(-$03e8,a5)
	move.l	a1,(-$03e4,a5)
L000228:
	tst.w	(a1)
	beq	L000230
	addq.w	#6,a1
	bra	L000228

L000230:
	subq.w	#6,a1
	move.l	a1,(-$03e0,a5)
	st.b	(-$03f4,a5)
	st.b	(-$03f3,a5)
	movea.l	(L001944,pc),a0
	bra	L00046c

L000246:
	move.b	(L001939,pc),d0
	rts

L00024c:
	clr.b	(-$03f4,a5)
	clr.b	($0024,a5)
	clr.b	($0025,a5)
	movea.l	(L001954,pc),a0
	move.l	(a0),($000c,a5)
	move.l	($0004,a0),($0010,a5)
	bra	L000356

L00026a:
	bsr	L00024c
L00026c:
	movea.l	(L001950,pc),a0
	pea.l	(a0)
	DOS	_MFREE
	addq.w	#4,a7
	moveq.l	#$00,d0
	move.l	d0,(-$03dc,a5)
	move.b	d0,(-$03f3,a5)
	rts

L000282:
	move.w	sr,-(a7)
	ori.w	#$0700,sr
	clr.b	(-$03f9,a5)
	tst.b	(-$0404,a5)
	bne	L0002ae
	lea.l	(L000668,pc),a1
	suba.l	a0,a0
	move.l	a1,($010c,a0)
	movea.l	#$00e88000,a0
	ori.b	#$08,($0009,a0)
	ori.b	#$08,($0015,a0)
L0002ae:
	move.w	(a7)+,sr
	rts

L0002b2:
	bsr	L000356
	move.l	(a5),($0090,a0)
	pea.l	(L000000-$0000f0,pc)
	DOS	_MFREE
	addq.w	#4,a7
	tst.b	(-$03f3,a5)
	beq	L0002ca
	bra	L00026c

L0002ca:
	rts

L0002cc:
	tst.b	(-$03f4,a5)
	beq	L0002dc
	movem.l	d1/a1,-(a7)
	bsr	L00026a
	movem.l	(a7)+,d1/a1
L0002dc:
	lea.l	($0024,a5),a2
	movea.l	(L001954,pc),a0
	move.l	a0,($000c,a5)
	move.l	($0014,a5),d0
	bra	L000310

L0002ee:
	tst.b	(-$03f4,a5)
	beq	L000300
	movem.l	d1/a1,-(a7)
	bsr	L00026a
	movem.l	(a7)+,d1/a1
L000300:
	lea.l	($0025,a5),a2
	movea.l	(L001958,pc),a0
	move.l	a0,($0010,a5)
	move.l	($0018,a5),d0
L000310:
	cmp.l	d1,d0
	bcs	L000348
	movem.l	d1/a0-a2,-(a7)
	bsr	L000356
	movem.l	(a7)+,d1/a0-a2
	move.w	d1,d0
	andi.w	#$0003,d0
	lsr.l	#2,d1
	swap.w	d1
L000328:
	swap.w	d1
L00032a:
	move.l	(a1)+,(a0)+
	dbra	d1,L00032a
	swap.w	d1
	dbra	d1,L000328
	tst.w	d0
	beq	L000342
	subq.w	#1,d0
L00033c:
	move.b	(a1)+,(a0)+
	dbra	d0,L00033c
L000342:
	st.b	(a2)
	moveq.l	#$00,d0
	rts

L000348:
	bset.l	#$1f,d0
	rts

L00034e:
	tst.b	(-$03f4,a5)
	bne	L00026a
L000356:
	move.b	#$01,(-$03f9,a5)
	move.w	sr,-(a7)
	ori.w	#$0700,sr
	bsr	L0003ca
	moveq.l	#$67,d0			;'g'
	moveq.l	#$01,d1
	trap	#15
	moveq.l	#$67,d0			;'g'
	moveq.l	#$00,d1
	trap	#15
	tst.b	(-$0418,a5)
	beq	L000380
	move.w	#$01ff,d0
	trap	#2
	clr.b	(-$0418,a5)
L000380:
	moveq.l	#$0f,d2
	moveq.l	#$e0,d1
L000384:
	bsr	L001334
	addq.b	#1,d1
	bne	L000384
	lea.l	(L001d5c,pc),a0
	lea.l	(L0016d4,pc),a1
	moveq.l	#$07,d3
	moveq.l	#$00,d2
	moveq.l	#$08,d1
L00039a:
	bsr	L001334
	move.b	d2,(a0)+
	move.b	d2,(a1)+
	addq.b	#1,d2
	dbra	d3,L00039a
	movea.l	#$00e88000,a0
	andi.b	#$f7,($0009,a0)
	andi.b	#$f7,($0015,a0)
	suba.l	a0,a0
	move.l	($0004,a5),($010c,a0)
	move.w	(a7)+,sr
	rts

L0003c6:
	st.b	(-$03fa,a5)
L0003ca:
	moveq.l	#$07,d7
	lea.l	(L001a5c,pc),a6
L0003d0:
	moveq.l	#$7f,d0
	bsr	L000ae2
	lea.l	($0050,a6),a6
	dbra	d7,L0003d0
	movea.l	($0088),a0
	move.l	(-$0008,a0),d0
	cmp.l	#$50434d34,d0		;'PCM4'
	beq	L0003f6
	cmp.l	#$50434d38,d0		;'PCM8'
	bne	L0003fe
L0003f6:
	move.w	#$0101,d0
	trap	#2
	rts

L0003fe:
	moveq.l	#$67,d0			;'g'
	moveq.l	#$00,d1
	trap	#15
	rts

L000406:
	clr.b	(-$03fa,a5)
	moveq.l	#$07,d7
	lea.l	(L001a5c,pc),a6
L000410:
	bsr	L000ab8
	lea.l	($0050,a6),a6
	dbra	d7,L000410
	movea.l	($0088),a0
	move.l	(-$0008,a0),d0
	cmp.l	#$50434d34,d0		;'PCM4'
	beq	L000434
	cmp.l	#$50434d38,d0		;'PCM8'
	bne	L00043a
L000434:
	move.w	#$0102,d0
	trap	#2
L00043a:
	moveq.l	#$30,d2			;'0'
	move.b	(L001928,pc),d1
	bne	L000444
	moveq.l	#$3a,d2			;':'
L000444:
	moveq.l	#$14,d1
	bra	L001334

L00044a:
	movea.l	(L001948,pc),a0
	movea.l	(L001944,pc),a1
	subq.w	#6,a0
	cmpa.l	a1,a0
	bcc	L00046c
	movea.l	(L00194c,pc),a0
	bra	L00046c

L00045e:
	movea.l	(L001948,pc),a0
	addq.w	#6,a0
	tst.w	(a0)
	bne	L00046c
	movea.l	(L001944,pc),a0
L00046c:
	move.l	a0,(-$03e4,a5)
	move.w	(a0),(-$03ea,a5)
	movea.l	($0002,a0),a1
	move.l	(a1),($0010,a5)
	addq.w	#4,a1
	move.w	(a1),d0
	not.w	d0
	move.w	($0002,a1),d1
	not.w	d1
	move.b	d0,($0024,a5)
	move.b	d1,($0025,a5)
	move.l	a1,($000c,a5)
	clr.w	(-$03f0,a5)
	bra	L0004a4

L00049a:
	clr.w	(-$03f0,a5)
	bra	L0004a4

L0004a0:
	move.w	d1,(-$03f0,a5)
L0004a4:
	clr.b	(-$03f8,a5)
	clr.b	(-$03f7,a5)
	clr.b	(-$03f5,a5)
	clr.b	(-$03f9,a5)
	tst.b	(-$03fa,a5)
	beq	L0004d8
	movea.l	($0088),a0
	move.l	(-$0008,a0),d0
	cmp.l	#$50434d34,d0		;'PCM4'
	beq	L0004d2
	cmp.l	#$50434d38,d0		;'PCM8'
	bne	L0004d8
L0004d2:
	move.w	#$0100,d0
	trap	#2
L0004d8:
	clr.b	(-$03fa,a5)
	clr.b	(-$0418,a5)
	move.w	#$01ff,(-$03f2,a5)
	move.w	#$01ff,(-$0406,a5)
	clr.w	($003a,a5)
	move.b	($0024,a5),d0
	beq	L000624
	bsr	L000356
	movea.l	($000c,a5),a2
	move.w	($0002,a2),d1
	bmi	L000528
	tst.b	($0025,a5)
	beq	L000624
	movea.l	($0010,a5),a0
	bra	L00051c

L000514:
	tst.l	(a0)
	beq	L000624
	adda.l	(a0),a0
L00051c:
	dbra	d1,L000514
	adda.w	($0004,a0),a0
	move.l	a0,($0020,a5)
L000528:
	adda.w	($0004,a2),a2
	movea.l	a2,a1
	movea.l	a2,a0
	adda.w	(a1)+,a2
	move.l	a2,($001c,a5)
	lea.l	(L001a5c,pc),a6
	lea.l	(L000626,pc),a3
	moveq.l	#$ff,d6
	moveq.l	#$00,d7
L000542:
	movea.l	a0,a2
	adda.w	(a1)+,a2
	move.l	a2,(a6)
	move.l	a3,($0026,a6)
	move.l	a3,($0040,a6)
	move.w	d6,($0014,a6)
	move.b	d6,($0023,a6)
	move.b	d7,($0018,a6)
	move.b	d7,($001d,a6)
	move.b	#$01,($001a,a6)
	move.b	#$08,($0022,a6)
	move.b	#$c0,($001c,a6)
	move.b	#$08,($001e,a6)
	clr.w	($0036,a6)
	clr.w	($004a,a6)
	clr.w	($0010,a6)
	clr.b	($0024,a6)
	clr.b	($001f,a6)
	clr.b	($0019,a6)
	clr.w	($0016,a6)
	cmp.w	#$0008,d7
	bcc	L0005ac
	moveq.l	#$38,d1			;'8'
	add.b	d7,d1
	moveq.l	#$00,d2
	bsr	L001334
	addq.w	#1,d7
	lea.l	($0050,a6),a6
	bra	L000542

L0005ac:
	move.b	#$10,($001c,a6)
	move.b	#$08,($0022,a6)
	st.b	($0018,a6)
	clr.b	($0004,a6)
	cmp.w	#$000f,d7
	beq	L0005dc
	addq.w	#1,d7
	lea.l	($0050,a6),a6
	cmp.w	#$0009,d7
	bne	L000542
	lea.l	(L0016e4,pc),a6
	bra	L000542

L0005dc:
	lea.l	(-$0416,a5),a0
	moveq.l	#$0f,d0
L0005e2:
	clr.b	(a0)+
	dbra	d0,L0005e2
	clr.b	($0026,a5)
	moveq.l	#$00,d2
	moveq.l	#$01,d1
	bsr	L001334
	moveq.l	#$0f,d1
	bsr	L001334
	moveq.l	#$19,d1
	bsr	L001334
	moveq.l	#$80,d2
	bsr	L001334
	moveq.l	#$c8,d2
	moveq.l	#$12,d1
	move.b	d2,(-$0400,a5)
	tst.b	(-$0404,a5)
	bne	L000618
	bsr	L001334
L000618:
	bsr	L000282
	bsr	L00043a
	moveq.l	#$00,d0
	rts

L000624:
	moveq.l	#$ff,d0
L000626:
	rts

L000628:
	tst.b	($0024,a5)
	beq	L000664
	movea.l	($000c,a5),a0
	bra	L00063a

L000634:
	tst.w	(a0)
	beq	L000664
	adda.w	(a0),a0
L00063a:
	dbra	d1,L000634
	adda.w	($0006,a0),a0
	move.l	a0,d0
	rts

L000646:
	tst.b	($0025,a5)
	beq	L000664
	movea.l	($0010,a5),a0
	bra	L000658

L000652:
	tst.l	(a0)
	beq	L000664
	adda.l	(a0),a0
L000658:
	dbra	d1,L000652
	adda.w	($0006,a0),a0
	move.l	a0,d0
	rts

L000664:
	moveq.l	#$00,d0
	rts

L000668:
	andi.b	#$f7,($00e88015)
	move.l	a6,-(a7)
	movea.l	($0006,a7),a6
	cmpa.l	($01a8),a6
	bne	L00069e
	move.w	#$01a8,-(a7)
	pea.l	(L000688,pc)
	move.w	sr,-(a7)
	jmp	(a6)

L000688:
	tst.b	($0cbc)
	bne	L000690
	addq.l	#2,a7
L000690:
	movea.l	(a7)+,a6
	addq.w	#6,a7
	tst.b	($0cbc)
	beq	L00069c
	addq.l	#2,a7
L00069c:
	move.l	a6,-(a7)
L00069e:
	andi.w	#$faff,sr
	movem.l	d0-d7/a0-a5,-(a7)
	lea.l	(L001d2c,pc),a5
	st.b	($0039,a5)
	tst.b	(-$03fa,a5)
	bne	L000746
	lea.l	(L00193e,pc),a0
	lea.l	(L001937,pc),a1
	tst.b	(a1)
	beq	L000746
	bpl	L0006ce
	move.b	#$7f,(a1)
	move.w	(a0),($0002,a0)
L0006ce:
	tst.w	($0002,a0)
	bmi	L0006da
	subq.w	#2,($0002,a0)
	bra	L000746

L0006da:
	lea.l	(L001934,pc),a1
	cmpi.b	#$0a,(a1)
	bge	L0006f2
L0006e4:
	cmpi.b	#$3e,(a1)		;'>'
	bge	L0006f8
	addq.b	#1,(a1)
	move.w	(a0),($0002,a0)
	bra	L000746

L0006f2:
	st.b	(-$03f7,a5)
	bra	L0006e4

L0006f8:
	tst.b	(-$03f4,a5)
	beq	L000706
	bsr	L00045e
	bra	L0008fa

L000706:
	move.b	#$7f,(a1)
	clr.b	(-$03f5,a5)
	move.b	#$01,(-$03f9,a5)
	bsr	L0003c6
	movea.l	($0088),a0
	move.l	(-$0008,a0),d0
	cmp.l	#$50434d34,d0		;'PCM4'
	beq	L000730
	cmp.l	#$50434d38,d0		;'PCM8'
	bne	L000736
L000730:
	move.w	#$0100,d0
	trap	#2
L000736:
	tst.b	(-$0418,a5)
	beq	L000746
	move.w	#$01ff,d0
	trap	#2
	clr.b	(-$0418,a5)
L000746:
	lea.l	(L00192c,pc),a0
	move.b	(a0),d2
	moveq.l	#$12,d1
	tst.b	(-$0402,a5)
	bne	L00088e
	move.b	($080e),d7
	and.b	#$0f,d7
	cmp.b	#$05,d7
	beq	L0007f6
	cmp.b	#$09,d7
	beq	L0007ea
	cmp.b	#$06,d7
	beq	L0007e4
	cmp.b	#$0a,d7
	beq	L0007dc
	cmp.b	#$04,d7
	beq	L00082a
	cmp.b	#$08,d7
	beq	L000800
	cmp.b	#$02,d7
	bne	L00088e
	move.b	($080b),d7
	and.b	#$03,d7
	cmpi.b	#$80,($080a)
	beq	L0007cc
	cmp.b	#$02,d7
	beq	L0007bc
	cmp.b	#$01,d7
	bne	L00088e
	tst.b	(-$03fc,a5)
	bne	L000888
	subq.b	#1,($0002,a0)
	bra	L000888

L0007bc:
	tst.b	(-$03fc,a5)
	bne	L000888
	addq.b	#1,($0002,a0)
	bra	L000888

L0007cc:
	tst.b	(-$03fc,a5)
	bne	L000888
	clr.b	($0002,a0)
	bra	L000888

L0007dc:
	move.b	#$ff,d2
	bra	L000896

L0007e4:
	moveq.l	#$00,d2
	bra	L000896

L0007ea:
	neg.b	d2
	lsr.b	#2,d2
	addq.b	#1,d2
	neg.b	d2
	bra	L000896

L0007f6:
	neg.b	d2
	add.b	d2,d2
	neg.b	d2
	bra	L000896

L000800:
	btst.b	#$01,($080b)
	beq	L00088e
	tst.b	(-$03fa,a5)
	beq	L00081e
	bpl	L00087c
	tst.b	(-$03fc,a5)
	bne	L000888
	bsr	L000406
	bra	L00087c

L00081e:
	tst.b	(-$03fc,a5)
	bne	L000888
	bsr	L0003c6
	bra	L00087c

L00082a:
	move.b	($080b),d7
	beq	L000840
	and.b	#$03,d7
	cmp.b	#$02,d7
	beq	L00086c
	cmp.b	#$01,d7
	beq	L00085a
L000840:
	.dc.b	$0c,$38,$00,$80,$08,$0a,$66,$46,$4a,$2d,$fc,$04,$66,$3a,$3b,$7c
L000850:
	.dc.w	$0011,$fc12,$50ed,$fc0b,$602e
L00085a:
	tst.b	(-$03fc,a5)
	bne	L000888
	tst.b	(-$03f4,a5)
	beq	L000882
	bsr	L00044a
	bra	L00087c

L00086c:
	tst.b	(-$03fc,a5)
	bne	L000888
	tst.b	(-$03f4,a5)
	beq	L000882
	bsr	L00045e
L00087c:
	st.b	(-$03fc,a5)
	bra	L0008fa

L000882:
	bsr	L00049a
	bra	L00087c

L000888:
	st.b	(-$03fc,a5)
	bra	L000892

L00088e:
	clr.b	(-$03fc,a5)
L000892:
	add.b	($0002,a0),d2
L000896:
	tst.b	(-$03fa,a5)
	bne	L0008a2
	tst.b	(-$03f9,a5)
	beq	L0008aa
L0008a2:
	moveq.l	#$00,d2
	bsr	L001334
	bra	L0008fa

L0008aa:
	bsr	L001334
	lea.l	(L001a5c,pc),a6
	moveq.l	#$00,d7
L0008b4:
	bsr	L000ce4
	bsr	L000e48
	move.w	(L00193c,pc),d0
	btst.l	d7,d0
	bne	L0008c6
	bsr	L000920
L0008c6:
	lea.l	($0050,a6),a6
	addq.w	#1,d7
	cmp.w	#$0009,d7
	bcs	L0008b4
	tst.b	(-$0418,a5)
	beq	L0008fa
	lea.l	(L0016e4,pc),a6
L0008dc:
	bsr	L000ce4
	bsr	L000e48
	move.w	(L00193c,pc),d0
	btst.l	d7,d0
	bne	L0008ee
	bsr	L000920
L0008ee:
	lea.l	($0050,a6),a6
	addq.w	#1,d7
	cmp.w	#$0010,d7
	bcs	L0008dc
L0008fa:
	bsr	L00043a
L0008fe:
	tst.b	($00e90003)
	bmi	L0008fe
	move.b	#$1b,($00e90001)
	clr.b	($0039,a5)
	movem.l	(a7)+,d0-d7/a0-a6
	ori.b	#$08,($00e88015)
	rte

L000920:
	btst.b	#$00,($0016,a6)
	beq	L000988
	tst.b	($0020,a6)
	bne	L000984
	tst.b	($0018,a6)
	bmi	L000978
	bsr	L000a3e
	bsr	L000b24
	btst.b	#$03,($0016,a6)
	bne	L00096e
	move.b	($0024,a6),($0025,a6)
	beq	L000958
	clr.l	($0036,a6)
	clr.w	($004a,a6)
	bsr	L000d28
L000958:
	btst.b	#$01,($0016,a6)
	beq	L00096e
	moveq.l	#$01,d1
	moveq.l	#$02,d2
	bsr	L001334
	moveq.l	#$00,d2
	bsr	L001334
L00096e:
	clr.l	($000c,a6)
	bsr	L000996
	bsr	L000ab8
L000978:
	bsr	L000b3c
	andi.b	#$fe,($0016,a6)
	rts

L000984:
	subq.b	#1,($0020,a6)
L000988:
	tst.b	($0018,a6)
	bmi	L000994
	bsr	L000996
	bsr	L000ab8
L000994:
	rts

L000996:
	move.w	($0012,a6),d2
	add.w	($000c,a6),d2
	add.w	($0036,a6),d2
	cmp.w	($0014,a6),d2
	beq	L0009dc
	move.w	d2,($0014,a6)
	move.w	#$17ff,d1
	cmp.w	d1,d2
	bls	L0009be
	tst.w	d2
	bpl	L0009bc
	moveq.l	#$00,d2
	bra	L0009be

L0009bc:
	move.w	d1,d2
L0009be:
	add.w	d2,d2
	add.w	d2,d2
	moveq.l	#$30,d1			;'0'
	add.b	($0018,a6),d1
	bsr	L001334
	subq.b	#8,d1
	move.w	d2,-(a7)
	moveq.l	#$00,d2
	move.b	(a7)+,d2
	move.b	(L0009de,pc,d2.w),d2
	bsr	L001334
L0009dc:
	rts

L0009de:
	.dc.b	$00,$01,$02,$04,$05,$06,$08,$09,$0a,$0c,$0d,$0e,$10,$11,$12,$14
	.dc.b	$15,$16,$18,$19,$1a,$1c,$1d,$1e,$20,$21,$22,$24,$25,$26,$28,$29
	.dc.b	$2a,$2c,$2d,$2e,$30,$31,$32,$34,$35,$36,$38,$39,$3a,$3c,$3d,$3e
	.dc.b	$40,$41,$42,$44,$45,$46,$48,$49,$4a,$4c,$4d,$4e,$50,$51,$52,$54
	.dc.b	$55,$56,$58,$59,$5a,$5c,$5d,$5e,$60,$61,$62,$64,$65,$66,$68,$69
	.dc.b	$6a,$6c,$6d,$6e,$70,$71,$72,$74,$75,$76,$78,$79,$7a,$7c,$7d,$7e
L000a3e:
	bclr.b	#$01,($0017,a6)
	beq	L000aae
	movea.l	($0004,a6),a0
	andi.b	#$c0,($001c,a6)
	move.b	(a0)+,d0
	or.b	d0,($001c,a6)
	and.w	#$0007,d0
	move.b	(L000ab0,pc,d0.w),d3
	move.b	d3,($0019,a6)
	move.b	(a0)+,d0
	lsl.b	#3,d0
	or.b	($0018,a6),d0
	move.b	d0,($001d,a6)
	moveq.l	#$40,d1			;'@'
	add.b	($0018,a6),d1
	moveq.l	#$03,d0
L000a76:
	move.b	(a0)+,d2
	bsr	L001334
	addq.b	#8,d1
	dbra	d0,L000a76
	moveq.l	#$03,d0
L000a84:
	move.b	(a0)+,d2
	lsr.b	#1,d3
	bcc	L000a8c
	moveq.l	#$7f,d2
L000a8c:
	bsr	L001334
	addq.b	#8,d1
	dbra	d0,L000a84
	moveq.l	#$0f,d0
L000a98:
	move.b	(a0)+,d2
	bsr	L001334
	addq.b	#8,d1
	dbra	d0,L000a98
	st.b	($0023,a6)
	ori.b	#$64,($0017,a6)
L000aae:
	rts

L000ab0:
	.dc.b	$08,$08,$08,$08,$0c,$0e,$0e,$0f
L000ab8:
	moveq.l	#$00,d0
	move.b	($0022,a6),d0
	bclr.l	#$07,d0
	bne	L000ac8
	move.b	(L000b14,pc,d0.w),d0
L000ac8:
	add.b	(L001934,pc),d0
	bcs	L000ad0
	bpl	L000ad2
L000ad0:
	moveq.l	#$7f,d0
L000ad2:
	add.b	($004a,a6),d0
	bcs	L000ada
	bpl	L000adc
L000ada:
	moveq.l	#$7f,d0
L000adc:
	cmp.b	($0023,a6),d0
	beq	L000b12
L000ae2:
	move.b	d0,($0023,a6)
	movea.l	($0004,a6),a0
	addq.w	#6,a0
	move.b	($0019,a6),d3
	move.b	#$60,d1			;'`'
	add.b	($0018,a6),d1
	moveq.l	#$03,d4
L000afa:
	move.b	(a0)+,d2
	lsr.b	#1,d3
	bcc	L000b0c
	add.b	d0,d2
	bpl	L000b08
	move.b	#$7f,d2
L000b08:
	bsr	L001334
L000b0c:
	addq.b	#8,d1
	dbra	d4,L000afa
L000b12:
	rts

L000b14:
	.dc.b	$2a,$28,$25,$22,$20,$1d,$1a,$18,$15,$12,$10,$0d,$0a,$08,$05,$02
L000b24:
	bclr.b	#$02,($0017,a6)
	beq	L000b3a
	move.b	($001c,a6),d2
	moveq.l	#$20,d1			;' '
	add.b	($0018,a6),d1
	bra	L001334

L000b3a:
	rts

L000b3c:
	bset.b	#$03,($0016,a6)
	bne	L000b3a
	tst.b	($0018,a6)
	bmi	L000b66
	move.b	($001d,a6),d2
	lea.l	(L001d5c,pc),a2
	move.b	d2,(a2,d7.w)
	lea.l	(L0016d4,pc),a2
	move.b	d2,(a2,d7.w)
	move.b	#$08,d1
	bra	L001334

L000b66:
	move.b	($0025,a5),d0
	beq	L000bda
	tst.b	(-$0403,a5)
	bne	L000bda
	moveq.l	#$00,d0
	move.w	($0012,a6),d0
	lsr.w	#6,d0
	move.b	($001c,a6),d2
	move.b	d2,d1
	and.w	#$0003,d1
	beq	L000b8c
	cmp.w	#$0003,d1
	bne	L000b90
L000b8c:
	eori.w	#$0003,d1
L000b90:
	and.w	#$001c,d2
	lsl.w	#6,d2
	or.w	d1,d2
	tst.b	(-$0418,a5)
	bne	L000bdc
	tst.b	(-$03f7,a5)
	beq	L000ba8
	andi.b	#$fc,d2
L000ba8:
	lsl.w	#3,d0
	movea.l	($0020,a5),a1
	lea.l	(a1,d0.w),a0
	adda.l	(a0)+,a1
	addq.w	#2,a0
	move.w	(a0)+,d3
	beq	L000bda
	moveq.l	#$67,d0			;'g'
	moveq.l	#$00,d1
	trap	#15
	moveq.l	#$60,d0			;'`'
	move.w	d2,d1
	moveq.l	#$00,d2
	move.w	d3,d2
	trap	#15
	lea.l	(L001d5c,pc),a2
	clr.b	(a2,d7.w)
	lea.l	(L0016d4,pc),a2
	clr.b	(a2,d7.w)
L000bda:
	rts

L000bdc:
	moveq.l	#$00,d1
	move.b	($0004,a6),d1
	lsl.l	#5,d1
	add.l	d1,d0
	add.l	d1,d1
	add.l	d1,d0
	lsl.l	#3,d0
	movea.l	($0020,a5),a1
	lea.l	(a1,d0.l),a0
	move.l	($0004,a0),d3
	beq	L000bda
	adda.l	(a0),a1
	lea.l	(L001d68,pc),a0
	cmpa.l	a0,a1
	bcs	L000c64
	move.l	a1,d0
	add.l	d3,d0
	bcs	L000c64
	cmp.l	(-$065c,a5),d0
	bcc	L000c64
	move.w	d7,d0
	subq.w	#8,d0
	moveq.l	#$00,d1
	move.b	($0022,a6),d1
	bclr.l	#$07,d1
	bne	L000c28
	lea.l	(L000b14,pc),a2
	move.b	(a2,d1.w),d1
L000c28:
	add.b	(L001934,pc),d1
	bmi	L000c34
	cmp.b	#$2b,d1			;'+'
	bcs	L000c3a
L000c34:
	moveq.l	#$00,d1
	clr.b	d2
	bra	L000c3e

L000c3a:
	move.b	(L000c66,pc,d1.w),d1
L000c3e:
	swap.w	d1
	move.w	d2,d1
	moveq.l	#$00,d2
	trap	#2
	move.w	d7,d0
	subq.w	#8,d0
	move.l	d3,d2
	andi.l	#$00ffffff,d2
	trap	#2
	lea.l	(L001d5c,pc),a2
	clr.b	($0008,a2)
	lea.l	(L0016d4,pc),a2
	clr.b	(a2,d7.w)
L000c64:
	rts

L000c66:
	.dc.b	$0f,$0f,$0f,$0e,$0e,$0e,$0d,$0d,$0d,$0c,$0c,$0b,$0b,$0b,$0a,$0a
	.dc.b	$0a,$09,$09,$08,$08,$08,$07,$07,$07,$06,$06,$05,$05,$05,$04,$04
	.dc.b	$04,$03,$03,$02,$02,$02,$01,$01,$01,$00,$00,$ff
L000c92:
	bclr.b	#$03,($0016,a6)
	beq	L000cda
	move.b	($0018,a6),d2
	bmi	L000cb6
	moveq.l	#$08,d1
	lea.l	(L001d5c,pc),a2
	move.b	d2,(a2,d7.w)
	lea.l	(L0016d4,pc),a2
	move.b	d2,(a2,d7.w)
	bra	L001334

L000cb6:
	move.b	($0025,a5),d0
	beq	L000cda
	tst.b	(-$0403,a5)
	bne	L000cda
	tst.b	(-$0418,a5)
	beq	L000cdc
	move.w	d7,d0
	subq.w	#8,d0
	moveq.l	#$00,d1
	move.b	($0022,a6),d1
	swap.w	d1
	move.w	d2,d1
	moveq.l	#$00,d2
	trap	#2
L000cda:
	rts

L000cdc:
	moveq.l	#$67,d0			;'g'
	moveq.l	#$00,d1
	trap	#15
	rts

L000ce4:
	tst.b	($0018,a6)
	bmi	L000d26
	tst.b	($0016,a6)
	bpl	L000cfe
	tst.b	($0020,a6)
	bne	L000cfe
	move.l	($0008,a6),d0
	add.l	d0,($000c,a6)
L000cfe:
	tst.b	($0024,a6)
	beq	L000d10
	tst.b	($0020,a6)
	bne	L000d26
	tst.b	($0025,a6)
	bne	L000d28
L000d10:
	btst.b	#$05,($0016,a6)
	beq	L000d1a
	bsr	L000d48
L000d1a:
	btst.b	#$06,($0016,a6)
	beq	L000d26
	bsr	L000daa
L000d26:
	rts

L000d28:
	subq.b	#1,($0025,a6)
	bne	L000d46
	btst.b	#$05,($0016,a6)
	beq	L000d3a
	bsr	L0011dc
L000d3a:
	btst.b	#$06,($0016,a6)
	beq	L000d46
	bsr	L00124a
L000d46:
	rts

L000d48:
	move.l	($0032,a6),d1
	movea.l	($0026,a6),a0
	jmp	(a0)

L000d52:
	add.l	d1,($0036,a6)
	subq.w	#1,($003e,a6)
	bne	L000d66
	move.w	($003c,a6),($003e,a6)
	neg.l	($0036,a6)
L000d66:
	rts

L000d68:
	move.l	d1,($0036,a6)
	subq.w	#1,($003e,a6)
	bne	L000d7c
	move.w	($003c,a6),($003e,a6)
	neg.l	($0032,a6)
L000d7c:
	rts

L000d7e:
	add.l	d1,($0036,a6)
	subq.w	#1,($003e,a6)
	bne	L000d92
	move.w	($003c,a6),($003e,a6)
	neg.l	($0032,a6)
L000d92:
	rts

L000d94:
	subq.w	#1,($003e,a6)
	bne	L000da8
	bsr	L000e0e
	muls.w	d1,d0
	move.l	d0,($0036,a6)
	move.w	($003c,a6),($003e,a6)
L000da8:
	rts

L000daa:
	move.w	($0048,a6),d1
	movea.l	($0040,a6),a0
	jmp	(a0)

L000db4:
	add.w	d1,($004a,a6)
	subq.w	#1,($004e,a6)
	bne	L000dca
	move.w	($004c,a6),($004e,a6)
	move.w	($0046,a6),($004a,a6)
L000dca:
	rts

L000dcc:
	subq.w	#1,($004e,a6)
	bne	L000de0
	move.w	($004c,a6),($004e,a6)
	add.w	d1,($004a,a6)
	neg.w	($0048,a6)
L000de0:
	rts

L000de2:
	add.w	d1,($004a,a6)
	subq.w	#1,($004e,a6)
	bne	L000df6
	move.w	($004c,a6),($004e,a6)
	neg.w	($0048,a6)
L000df6:
	rts

L000df8:
	subq.w	#1,($004e,a6)
	bne	L000e0c
	bsr	L000e0e
	muls.w	d0,d1
	move.w	($004c,a6),($004e,a6)
	move.w	d1,($004a,a6)
L000e0c:
	rts

L000e0e:
	move.w	(-$0f08,a5),d0
	mulu.w	#$c549,d0
	add.l	#$0000000c,d0
	move.w	d0,(-$0f08,a5)
	lsr.l	#8,d0
	rts

L000e24:
	.dc.b	$12,$34
L000e26:
	lea.l	(L001916,pc),a0
	tst.b	(a0,d7.w)
	bne	L000e32
	rts

L000e32:
	clr.b	(a0,d7.w)
	cmp.w	#$0009,d7
	bcc	L000e40
	clr.b	($27,a5,d7.w)
L000e40:
	andi.b	#$f7,($0017,a6)
	bra	L000e68

L000e48:
	btst.b	#$03,($0017,a6)
	bne	L000e26
	btst.b	#$02,($0016,a6)
	bne	L000e62
	subq.b	#1,($001b,a6)
	bne	L000e62
	bsr	L000c92
L000e62:
	subq.b	#1,($001a,a6)
	bne	L000eb8
L000e68:
	movea.l	(a6),a4
	andi.b	#$7b,($0016,a6)
L000e70:
	moveq.l	#$00,d0
	moveq.l	#$00,d1
	move.b	(a4)+,d0
	move.b	d0,d1
	bpl	L000eaa
	cmp.b	#$e0,d0
	bcc	L000ec2
	and.w	#$007f,d0
	lsl.w	#6,d0
	addq.w	#5,d0
	add.w	($0010,a6),d0
	move.w	d0,($0012,a6)
	ori.b	#$01,($0016,a6)
	move.b	($001f,a6),($0020,a6)
	moveq.l	#$00,d0
	move.b	(a4)+,d0
	move.b	($001e,a6),d1
	bmi	L000eba
	mulu.w	d0,d1
	lsr.w	#3,d1
L000eaa:
	addq.w	#1,d1
	move.b	d1,($001b,a6)
	addq.w	#1,d0
	move.b	d0,($001a,a6)
	move.l	a4,(a6)
L000eb8:
	rts

L000eba:
	add.b	d0,d1
	bcs	L000eaa
	moveq.l	#$00,d1
	bra	L000eaa

L000ec2:
	ext.w	d0
	not.w	d0
	add.w	d0,d0
	move.w	(L000ed4,pc,d0.w),d0
	pea.l	(L000e70,pc)
	jmp	(L000ed4,pc,d0.w)

L000ed4:
	.dc.w	$0040,$0054,$006c,$0094,$00ca,$00d6,$00f2,$0112
	.dc.w	$0118,$0120,$0124,$0146,$0162,$016e,$0184,$0238
	.dc.w	$023e,$0256,$0282,$02a2,$0336,$03a4,$03fa,$0400
	.dc.w	$0438,$01e8,$01e8,$01e8,$01e8,$01e8,$01e8,$01e8
	.dc.w	$7212,$141c,$4a2d,$fbfc,$6608,$1b42,$fc00,$6000
	.dc.w	$0410
L000f26:
	rts

L000f28:
	move.b	(a4)+,d1
	move.b	(a4)+,d2
	cmp.b	#$12,d1
	bne	L000f3c
	tst.b	(-$0404,a5)
	bne	L000f26
	move.b	d2,(-$0400,a5)
L000f3c:
	bra	L001334

L000f40:
	tst.b	($0018,a6)
	bmi	L000f62
	move.b	(a4)+,d0
	movea.l	($001c,a5),a0
	bra	L000f52

L000f4e:
	lea.l	($001a,a0),a0
L000f52:
	cmp.b	(a0)+,d0
	bne	L000f4e
	move.l	a0,($0004,a6)
	ori.b	#$02,($0017,a6)
	rts

L000f62:
	move.b	(a4)+,($0004,a6)
	rts

L000f68:
	tst.b	($0018,a6)
	bmi	L000f84
	move.b	($001c,a6),d0
	ror.w	#6,d0
	move.b	(a4)+,d0
	rol.w	#6,d0
	move.b	d0,($001c,a6)
	ori.b	#$04,($0017,a6)
	rts

L000f84:
	move.b	(a4)+,d0
	beq	L000f8e
	cmp.b	#$03,d0
	bne	L000f92
L000f8e:
	eori.b	#$03,d0
L000f92:
	andi.b	#$fc,($001c,a6)
	or.b	d0,($001c,a6)
	rts

L000f9e:
	move.b	(a4)+,($0022,a6)
	ori.b	#$01,($0017,a6)
	rts

L000faa:
	move.b	($0022,a6),d2
	bmi	L000fbe
	beq	L000fbc
L000fb2:
	subq.b	#1,($0022,a6)
	ori.b	#$01,($0017,a6)
L000fbc:
	rts

L000fbe:
	cmp.b	#-$01,d2
	bne	L000fd2
	rts

L000fc6:
	move.b	($0022,a6),d2
	bmi	L000fde
	cmp.b	#$0f,d2
	beq	L000fdc
L000fd2:
	addq.b	#1,($0022,a6)
	ori.b	#$01,($0017,a6)
L000fdc:
	rts

L000fde:
	cmp.b	#$80,d2
	bne	L000fb2
	rts

L000fe6:
	move.b	(a4)+,($001e,a6)
	rts

L000fec:
	ori.b	#$04,($0016,a6)
	rts

L000ff4:
	move.b	(a4)+,(a4)+
	rts

L000ff8:
	move.b	(a4)+,-(a7)
	move.w	(a7)+,d0
	move.b	(a4)+,d0
	subq.b	#1,(-$01,a4,d0.w)
	beq	L001018
	tst.b	(-$0401,a5)
	beq	L001016
	cmpi.b	#$f1,(a4)
	bne	L001016
	tst.b	($0001,a4)
	beq	L001060
L001016:
	adda.w	d0,a4
L001018:
	rts

L00101a:
	move.b	(a4)+,-(a7)
	move.w	(a7)+,d0
	move.b	(a4)+,d0
	lea.l	(a4,d0.w),a0
	move.b	(a0)+,-(a7)
	move.w	(a7)+,d0
	move.b	(a0)+,d0
	cmpi.b	#$01,(-$01,a0,d0.w)
	bne	L001034
	movea.l	a0,a4
L001034:
	rts

L001036:
	move.b	(a4)+,-(a7)
	move.w	(a7)+,d0
	move.b	(a4)+,d0
	move.w	d0,($0010,a6)
	rts

L001042:
	move.b	(a4)+,-(a7)
	move.w	(a7)+,d0
	move.b	(a4)+,d0
	ext.l	d0
	asl.l	#8,d0
	move.l	d0,($0008,a6)
	ori.b	#$80,($0016,a6)
	rts

L001058:
	move.b	(a4)+,-(a7)
	beq	L0010ba
	move.w	(a7)+,d0
	move.b	(a4)+,d0
L001060:
	adda.w	d0,a4
	move.w	(L00193a,pc),d0
	bclr.l	d7,d0
	move.w	d0,(-$03f2,a5)
	and.w	(L001926,pc),d0
	bne	L0010b8
	tst.b	(-$03f4,a5)
	bne	L001090
	move.w	#$01ff,(-$03f2,a5)
	tst.b	(-$0418,a5)
	beq	L00108a
	ori.w	#$fe00,(-$03f2,a5)
L00108a:
	addq.w	#1,($003a,a5)
	bra	L0010b8

L001090:
	tst.b	(-$03f5,a5)
	bne	L0010b8
	move.w	#$01ff,(-$03f2,a5)
	tst.b	(-$0418,a5)
	beq	L0010a8
	ori.w	#$fe00,(-$03f2,a5)
L0010a8:
	subq.w	#1,(-$03ea,a5)
	bne	L0010b8
	move.w	#$0011,(-$03ee,a5)
	st.b	(-$03f5,a5)
L0010b8:
	rts

L0010ba:
	addq.w	#2,a7
L0010bc:
	lea.l	(L0014fe,pc),a4
	move.w	(L00193a,pc),d0
	bclr.l	d7,d0
	move.w	d0,(-$03f2,a5)
	move.w	(L001926,pc),d0
	bclr.l	d7,d0
	move.w	d0,(-$0406,a5)
	bne	L00110a
	move.b	#$01,(-$03f9,a5)
	tst.b	(-$0418,a5)
	beq	L0010ec
	move.w	#$01ff,d0
	trap	#2
	clr.b	(-$0418,a5)
L0010ec:
	tst.b	(-$03f4,a5)
	bne	L0010fa
	move.w	#$ffff,($003a,a5)
	bra	L00110a

L0010fa:
	move.w	#$ffff,(-$03ee,a5)
	st.b	(-$03f5,a5)
	move.w	#$0037,(-$03f8,a5)	;'7'
L00110a:
	rts

L00110c:
	move.b	(a4)+,($001f,a6)
	rts

L001112:
	moveq.l	#$00,d0
	move.b	(a4)+,d0
	lea.l	(L001916,pc),a0
	st.b	(a0,d0.w)
	cmp.w	#$0009,d0
	bcc	L001128
	st.b	($27,a5,d0.w)
L001128:
	rts

L00112a:
	lea.l	(L001916,pc),a0
	tst.b	(a0,d7.w)
	beq	L00114a
	clr.b	(a0,d7.w)
	cmp.w	#$0009,d7
	bcc	L001142
	clr.b	($27,a5,d7.w)
L001142:
	andi.b	#$f7,($0017,a6)
	rts

L00114a:
	ori.b	#$08,($0017,a6)
	move.l	a4,(a6)
	addq.w	#4,a7
	rts

L001156:
	move.b	(a4)+,d2
	tst.b	($0018,a6)
	bmi	L001168
	move.b	d2,($0026,a5)
	moveq.l	#$0f,d1
	bra	L001334

L001168:
	lsl.b	#2,d2
	andi.b	#$03,($001c,a6)
	or.b	d2,($001c,a6)
	rts

L001176:
	ori.b	#$20,($0016,a6)
	moveq.l	#$00,d1
	move.b	(a4)+,d1
	bmi	L0011f0
	move.w	d1,-(a7)
	andi.b	#$03,d1
	add.w	d1,d1
	move.w	(L001202,pc,d1.w),d0
	lea.l	(L001202,pc,d0.w),a0
	move.l	a0,($0026,a6)
	move.b	(a4)+,-(a7)
	move.w	(a7)+,d2
	move.b	(a4)+,d2
	move.w	d2,($003c,a6)
	cmp.b	#$02,d1
	beq	L0011b0
	lsr.w	#1,d2
	cmpi.b	#$06,d1
	bne	L0011b0
	moveq.l	#$01,d2
L0011b0:
	move.w	d2,($003a,a6)
	move.b	(a4)+,-(a7)
	move.w	(a7)+,d0
	move.b	(a4)+,d0
	ext.l	d0
	asl.l	#8,d0
	move.w	(a7)+,d1
	cmpi.b	#$04,d1
	bcs	L0011cc
	asl.l	#8,d0
	andi.b	#$03,d1
L0011cc:
	move.l	d0,($002e,a6)
	cmp.b	#$02,d1
	beq	L0011d8
	moveq.l	#$00,d0
L0011d8:
	move.l	d0,($002a,a6)
L0011dc:
	move.w	($003a,a6),($003e,a6)
	move.l	($002e,a6),($0032,a6)
	move.l	($002a,a6),($0036,a6)
	rts

L0011f0:
	and.b	#$01,d1
	bne	L0011dc
	andi.b	#$df,($0016,a6)
	clr.l	($0036,a6)
	rts

L001202:
	.dc.w	$fb50,$fb66,$fb7c,$fb92,$002e,$0040,$0016,$7400
	.dc.w	$141c,$6b48,$d442,$303b,$2056,$41fb,$0052,$2d48
	.dc.w	$0040,$1f1c,$321f,$121c,$3d41,$004c,$1f1c,$301f
	.dc.w	$101c,$3d40,$0044,$0802,$0001,$6602,$c1c1,$4440
	.dc.w	$6a02,$7000,$3d40,$0046
L00124a:
	move.w	($004c,a6),($004e,a6)
	move.w	($0044,a6),($0048,a6)
	move.w	($0046,a6),($004a,a6)
	rts

L00125e:
	and.b	#$01,d2
	bne	L00124a
	andi.b	#$bf,($0016,a6)
	clr.w	($004a,a6)
	rts

L001270:
	.dc.b	$fb,$44,$fb,$5c,$fb,$72,$fb,$88,$14,$1c,$6b,$46,$02,$2e,$00,$fd
	.dc.b	$00,$16,$08,$82,$00,$06,$67,$06,$00,$2e,$00,$02,$00,$16,$10,$38
	.dc.b	$09,$da,$c0,$3c,$00,$c0,$84,$00,$72,$1b,$61,$00,$00,$98,$72,$18
	.dc.b	$14,$1c,$61,$00,$00,$90,$72,$19,$14,$1c,$61,$00,$00,$88,$14,$1c
	.dc.b	$61,$00,$00,$82,$14,$1c,$1d,$42,$00,$21,$72,$38,$d2,$2e,$00,$18
	.dc.b	$60,$72,$c4,$3c,$00,$01,$67,$f2,$14,$2e,$00,$21,$60,$ec,$1d,$5c
	.dc.b	$00,$24,$4e,$75
L0012d4:
	movea.l	($0088),a0
	cmpa.l	#$00f00000,a0
	bcc	L00130a
	cmpi.l	#$50434d34,(-$0008,a0)	;'PCM4'
	beq	L0012f4
	cmpi.l	#$50434d38,(-$0008,a0)	;'PCM8'
	bne	L00130a
L0012f4:
	st.b	(-$0418,a5)
	move.w	#$01fe,d0
	trap	#2
	ori.w	#$fe00,(-$03f2,a5)
	ori.w	#$fe00,(-$0406,a5)
L00130a:
	rts

L00130c:
	moveq.l	#$00,d0
	move.b	(a4)+,d0
	cmp.w	#$0002,d0
	bcc	L0010bc
	add.w	d0,d0
	move.w	(L001322,pc,d0.w),d0
	jmp	(L001322,pc,d0.w)

L001322:
	.dc.w	L0010bc-L001322
	.dc.w	L001326-L001322
L001326:
	moveq.l	#$00,d0
	move.b	(a4)+,d0
	move.w	d0,(-$03ee,a5)
	st.b	(-$03f5,a5)
	rts

L001334:
	ori.w	#$0300,sr
	tst.b	($00e90003)
	bmi	L001334
	move.b	d1,($00e90001)
	and.w	#$00ff,d1
	lea.l	(L00195c,pc),a2
	move.b	d2,(a2,d1.w)
L001352:
	tst.b	($00e90003)
	bmi	L001352
	move.b	d2,($00e90003)
	andi.w	#$faff,sr
	bra	L001648

L001368:
	nop
L00136a:
	clr.l	-(a7)
	DOS	_SUPER
	pea.l	(L001501,pc)
	DOS	_PRINT
	lea.l	(L001d2c,pc),a5
	move.w	#$0001,(-$03fa,a5)
	clr.l	(-$0404,a5)
	move.l	($0008,a0),(-$065c,a5)
	move.l	#$00010000,($0014,a5)
	move.l	#$0004e000,($0018,a5)
	clr.b	($0024,a5)
	clr.b	($0025,a5)
	addq.w	#1,a2
	bsr	L001402
	lea.l	(L001d68,pc),a4
	lea.l	(L001954,pc),a1
	move.l	a4,(a1)
	adda.l	($0014,a5),a4
	move.l	a4,($0004,a1)
	adda.l	($0018,a5),a4
	cmpa.l	($0008,a0),a4
	bhi	L0014ec
	suba.l	a0,a0
	move.l	($0090,a0),(a5)
	move.l	($010c,a0),($0004,a5)
	lea.l	(L00000c,pc),a1
	move.l	a1,($0090,a0)
	lea.l	(L000000,pc),a1
	suba.l	a1,a4
	clr.w	-(a7)
	move.l	a4,-(a7)
	DOS	_KEEPPR

L0013e2:
	movea.l	($0090),a4
	cmpa.l	#$00fe0000,a4
	bcc	L001400
	subq.w	#8,a4
	lea.l	(L000004,pc),a3
	move.w	#$0004,d0
L0013f8:
	cmpm.b	(a3)+,(a4)+
	bne	L001400
	dbra	d0,L0013f8
L001400:
	rts

L001402:
	move.b	(a2)+,d0
	bne	L00140e
	bsr	L0013e2
	beq	L0014e6
	rts

L00140e:
	cmp.b	#$20,d0			;' '
	beq	L001402
	cmp.b	#$09,d0
	beq	L001402
	cmp.b	#$2d,d0			;'-'
	beq	L001428
	cmp.b	#$2f,d0			;'/'
	bne	L0014f2
L001428:
	move.b	(a2)+,d0
	beq	L0014f2
	or.b	#$20,d0
	cmp.b	#$72,d0			;'r'
	bne	L001458
	bsr	L0013e2
	bne	L0014e0
	moveq.l	#$00,d0
	trap	#4
	tst.l	d0
	bne	L001452
	pea.l	(L001657,pc)
L00144a:
	DOS	_PRINT
	addq.w	#4,a7
	clr.w	-(a7)
	DOS	_EXIT2

L001452:
	pea.l	(L0016b0,pc)
	bra	L00144a

L001458:
	bsr	L0013e2
	beq	L0014e6
	cmp.b	#$6d,d0			;'m'
	bne	L001474
	cmpi.b	#$3a,(a2)		;':'
	bne	L00146c
	addq.w	#1,a2
L00146c:
	bsr	L0014ba
	move.l	d0,($0014,a5)
	bra	L001402

L001474:
	cmp.b	#$70,d0			;'p'
	bne	L00148c
	cmpi.b	#$3a,(a2)		;':'
	bne	L001482
	addq.w	#1,a2
L001482:
	bsr	L0014ba
	move.l	d0,($0018,a5)
	bra	L001402

L00148c:
	cmpi.b	#$66,d0			;'f'
	bne	L0014f2
	cmpi.b	#$3a,(a2)		;':'
	bne	L00149a
	addq.w	#1,a2
L00149a:
	move.l	a2,-(a7)
	bsr	L0014ba
	cmpa.l	(a7)+,a2
	beq	L0014ae
	lsr.l	#8,d0
	lsr.l	#2,d0
	andi.l	#$00007fff,d0
	bra	L0014b0

L0014ae:
	moveq.l	#$11,d0
L0014b0:
	move.w	d0,(L000850)
	bra	L001402

L0014ba:
	moveq.l	#$00,d0
L0014bc:
	moveq.l	#$00,d1
	move.b	(a2),d1
	sub.b	#$30,d1			;'0'
	bcs	L0014d6
	cmp.b	#$09,d1
	bhi	L0014d6
	mulu.w	#$000a,d0
	add.l	d1,d0
	addq.w	#1,a2
	bra	L0014bc

L0014d6:
	tst.l	d0
	bmi	L0014f2
	moveq.l	#$0a,d1
	lsl.l	d1,d0
	rts

L0014e0:
	pea.l	(L001691,pc)
	bra	L0014f6

L0014e6:
	pea.l	(L00166e,pc)
	bra	L0014f6

L0014ec:
	pea.l	(L00163d,pc)
	bra	L0014f6

L0014f2:
	pea.l	(L00155e,pc)
L0014f6:
	DOS	_PRINT
	move.w	#$ffff,-(a7)
	DOS	_EXIT2

L0014fe:
	.dc.b	$7f,$f1,$00
L001501:
	.dc.b	'X68k MXDRV version 2.06+16 Rel.3 (c)1988-91 milk.,K.MAEKAWA, Missy.M, Yatsube, RANN,Shalem',$0d,$0a,$00
L00155e:
	.dc.b	'使い方: mxdrv [switch]',$0d,$0a
	.dc.b	$09,'-m:<num> MMLバッファサイズ(Kbytes)           [省略時 64]',$0d,$0a
	.dc.b	$09,'-p:<num> PCMバッファサイズ(Kbytes)           [省略時312]',$0d,$0a
	.dc.b	$09,'-f:<num> FADEOUT SPEED (FAST 0 - 32767 SLOW) [省略時 23]',$0d,$0a
	.dc.b	$09,'-r       mxdrv解除',$0d,$0a,$00
L00163d:
	.dc.b	$09,'メモリ ',$0d,$0a,$00
L001648:
	cmp.b	#$1b,d1
	beq	L001650
	rts

L001650:
	move.b	d2,($09da)
	rts

L001656:
	.dc.b	$00
L001657:
	.dc.b	$09,'mxdrvを解除しました',$0d,$0a,$00
L00166e:
	.dc.b	$09,'mxdrvはすでに組み込まれています',$0d,$0a,$00
L001691:
	.dc.b	$09,'mxdrvは組み込まれていません',$0d,$0a,$00
L0016b0:
	.dc.b	$09,'mxdrvを解除出来ませんでした',$0d,$0a,$00,$00

	.bss

L0016d0:
	.ds.b	4
L0016d4:
	.ds.b	16
L0016e4:
	.ds.b	562
L001916:
	.ds.b	16
L001926:
	.ds.w	1
L001928:
	.ds.b	4
L00192c:
	.ds.b	2
L00192e:
	.ds.b	6
L001934:
	.ds.b	3
L001937:
	.ds.b	2
L001939:
	.ds.b	1
L00193a:
	.ds.w	1
L00193c:
	.ds.w	1
L00193e:
	.ds.b	6
L001944:
	.ds.l	1
L001948:
	.ds.l	1
L00194c:
	.ds.l	1
L001950:
	.ds.l	1
L001954:
	.ds.l	1
L001958:
	.ds.l	1
L00195c:
	.ds.b	256
L001a5c:
	.ds.b	720
L001d2c:
	.ds.b	48
L001d5c:
	.ds.b	12
L001d68:

	.end	L00136a
