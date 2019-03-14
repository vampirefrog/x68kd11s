;=============================================
;  Filename mxdrv/2.06+16_Rel.2/mxdrv16.x
;  Time Stamp Sat Nov 23 02:18:36 1991
;
;  Base address 000000
;  Exec address 0013dc
;  Text size    001742 byte(s)
;  Data size    000000 byte(s)
;  Bss  size    000698 byte(s)
;  362 Labels
;
;  Commandline dis  -h -k -m68030 -q1 -B -M -w16 -o120 -gmxdrv/2.06+16_Rel.2/mxdrv16.lab --overwrite mxdrv/2.06+16_Rel.2/mxdrv16.x mxdrv/2.06+16_Rel.2/mxdrv16.s
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
Trap4Handler:
	movem.l	d1-d7/a0-a6,-(a7)
	lea.l	(L001d9e,pc),a5
	and.w	#$001f,d0
	add.w	d0,d0
	move.w	(MXDRVCallTable,pc,d0.w),d0
	jsr	(MXDRVCallTable,pc,d0.w)
L000022:
	movem.l	(a7)+,d1-d7/a0-a6
	rte

MXDRVCallTable:
	.dc.w	L0002b2-MXDRVCallTable
	.dc.w	L000636-MXDRVCallTable
	.dc.w	L0002cc-MXDRVCallTable
	.dc.w	L0002ee-MXDRVCallTable
	.dc.w	L0004ac-MXDRVCallTable
	.dc.w	L00034e-MXDRVCallTable
	.dc.w	L0003d8-MXDRVCallTable
	.dc.w	L000418-MXDRVCallTable
	.dc.w	L00063a-MXDRVCallTable
	.dc.w	L000658-MXDRVCallTable
	.dc.w	L000068-MXDRVCallTable
	.dc.w	L00006e-MXDRVCallTable
	.dc.w	L000074-MXDRVCallTable
	.dc.w	L000204-MXDRVCallTable
	.dc.w	L00007e-MXDRVCallTable
	.dc.w	L0004b2-MXDRVCallTable
	.dc.w	L000084-MXDRVCallTable
	.dc.w	L00008c-MXDRVCallTable
	.dc.w	L00009c-MXDRVCallTable
	.dc.w	L0000a8-MXDRVCallTable
	.dc.w	L0000b2-MXDRVCallTable
	.dc.w	L0000ba-MXDRVCallTable
	.dc.w	L0000c4-MXDRVCallTable
	.dc.w	L0000d2-MXDRVCallTable
	.dc.w	L0001f4-MXDRVCallTable
	.dc.w	L0001fc-MXDRVCallTable
	.dc.w	L000022-MXDRVCallTable
	.dc.w	L000022-MXDRVCallTable
	.dc.w	L000022-MXDRVCallTable
	.dc.w	L000022-MXDRVCallTable
	.dc.w	L000022-MXDRVCallTable
	.dc.w	L000022-MXDRVCallTable
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
	lea.l	(L0019ce,pc),a0
	move.l	a0,d0
	rts

L00008c:
	lea.l	(L0019a0,pc),a0
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
	lea.l	(L0019b0,pc),a0
	lea.l	(L0019a9,pc),a1
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
	lea.l	(L0019a6,pc),a1
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
	bsr	L000470
	bra	L0001d0

L000132:
	move.b	#$7f,(a1)
	clr.b	(-$03f5,a5)
	move.b	#$01,(-$03f9,a5)
	bsr	L0003d8
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
	lea.l	(L00199e,pc),a0
	move.b	(a0),d2
	moveq.l	#$12,d1
	tst.b	(-$03f9,a5)
	bne	L0001d0
	lea.l	(L001ace,pc),a6
	moveq.l	#$00,d7
L000186:
	bsr	L000d32
	bsr	L000e96
	move.w	(L0019ae,pc),d0
	btst.l	d7,d0
	bne	L00019a
	bsr	L00091e
L00019a:
	lea.l	($0050,a6),a6
	addq.w	#1,d7
	cmp.w	#$0009,d7
	bcs	L000186
	tst.b	(-$0418,a5)
	beq	L0001d0
	lea.l	(L001756,pc),a6
L0001b0:
	bsr	L000d32
	bsr	L000e96
	move.w	(L0019ae,pc),d0
	btst.l	d7,d0
	bne	L0001c4
	bsr	L00091e
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
	lea.l	(L001756,pc),a0
	move.l	a0,d0
	rts

L0001fc:
	lea.l	(L001746,pc),a0
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
	bne	L000636
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
	movea.l	(L0019b6,pc),a0
	bra	L00047e

L000246:
	move.b	(L0019ab,pc),d0
	rts

L00024c:
	clr.b	(-$03f4,a5)
	clr.b	($0024,a5)
	clr.b	($0025,a5)
	movea.l	(L0019c6,pc),a0
	move.l	(a0),($000c,a5)
	move.l	($0004,a0),($0010,a5)
	bra	L000356

L00026a:
	bsr	L00024c
L00026c:
	movea.l	(L0019c2,pc),a0
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
	lea.l	(L00067a,pc),a1
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
	movea.l	(L0019c6,pc),a0
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
	movea.l	(L0019ca,pc),a0
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
	bsr	L0003dc
	movea.l	($0088),a0
	move.l	(-$0008,a0),d0
	cmp.l	#$50434d34,d0		;'PCM4'
	beq	L00037c
	cmp.l	#$50434d38,d0		;'PCM8'
	bne	L000382
L00037c:
	move.w	#$0100,d0
	trap	#2
L000382:
	tst.b	(-$0418,a5)
	beq	L000392
	move.w	#$01ff,d0
	trap	#2
	clr.b	(-$0418,a5)
L000392:
	moveq.l	#$0f,d2
	moveq.l	#$e0,d1
L000396:
	bsr	WriteOPM
	addq.b	#1,d1
	bne	L000396
	lea.l	(L001dce,pc),a0
	lea.l	(L001746,pc),a1
	moveq.l	#$07,d3
	moveq.l	#$00,d2
	moveq.l	#$08,d1
L0003ac:
	bsr	WriteOPM
	move.b	d2,(a0)+
	move.b	d2,(a1)+
	addq.b	#1,d2
	dbra	d3,L0003ac
	movea.l	#$00e88000,a0
	andi.b	#$f7,($0009,a0)
	andi.b	#$f7,($0015,a0)
	suba.l	a0,a0
	move.l	($0004,a5),($010c,a0)
	move.w	(a7)+,sr
	rts

L0003d8:
	st.b	(-$03fa,a5)
L0003dc:
	moveq.l	#$07,d7
	lea.l	(L001ace,pc),a6
L0003e2:
	moveq.l	#$7f,d0
	bsr	L000ae0
	lea.l	($0050,a6),a6
	dbra	d7,L0003e2
	movea.l	($0088),a0
	move.l	(-$0008,a0),d0
	cmp.l	#$50434d34,d0		;'PCM4'
	beq	L000408
	cmp.l	#$50434d38,d0		;'PCM8'
	bne	L000410
L000408:
	move.w	#$0101,d0
	trap	#2
	rts

L000410:
	moveq.l	#$67,d0			;'g'
	moveq.l	#$00,d1
	trap	#15
	rts

L000418:
	clr.b	(-$03fa,a5)
	moveq.l	#$07,d7
	lea.l	(L001ace,pc),a6
L000422:
	bsr	L000ab6
	lea.l	($0050,a6),a6
	dbra	d7,L000422
	movea.l	($0088),a0
	move.l	(-$0008,a0),d0
	cmp.l	#$50434d34,d0		;'PCM4'
	beq	L000446
	cmp.l	#$50434d38,d0		;'PCM8'
	bne	L00044c
L000446:
	move.w	#$0102,d0
	trap	#2
L00044c:
	moveq.l	#$30,d2			;'0'
	move.b	(L00199a,pc),d1
	bne	L000456
	moveq.l	#$3a,d2			;':'
L000456:
	moveq.l	#$14,d1
	bra	WriteOPM

L00045c:
	movea.l	(L0019ba,pc),a0
	movea.l	(L0019b6,pc),a1
	subq.w	#6,a0
	cmpa.l	a1,a0
	bcc	L00047e
	movea.l	(L0019be,pc),a0
	bra	L00047e

L000470:
	movea.l	(L0019ba,pc),a0
	addq.w	#6,a0
	tst.w	(a0)
	bne	L00047e
	movea.l	(L0019b6,pc),a0
L00047e:
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
	bra	L0004b6

L0004ac:
	clr.w	(-$03f0,a5)
	bra	L0004b6

L0004b2:
	move.w	d1,(-$03f0,a5)
L0004b6:
	clr.b	(-$03f8,a5)
	clr.b	(-$03f7,a5)
	clr.b	(-$03f5,a5)
	clr.b	(-$03f9,a5)
	tst.b	(-$03fa,a5)
	beq	L0004ea
	movea.l	($0088),a0
	move.l	(-$0008,a0),d0
	cmp.l	#$50434d34,d0		;'PCM4'
	beq	L0004e4
	cmp.l	#$50434d38,d0		;'PCM8'
	bne	L0004ea
L0004e4:
	move.w	#$0100,d0
	trap	#2
L0004ea:
	clr.b	(-$03fa,a5)
	clr.b	(-$0418,a5)
	move.w	#$01ff,(-$03f2,a5)
	move.w	#$01ff,(-$0406,a5)
	clr.w	($003a,a5)
	move.b	($0024,a5),d0
	beq	L000636
	bsr	L000356
	movea.l	($000c,a5),a2
	move.w	($0002,a2),d1
	bmi	L00053a
	tst.b	($0025,a5)
	beq	L000636
	movea.l	($0010,a5),a0
	bra	L00052e

L000526:
	tst.l	(a0)
	beq	L000636
	adda.l	(a0),a0
L00052e:
	dbra	d1,L000526
	adda.w	($0004,a0),a0
	move.l	a0,($0020,a5)
L00053a:
	adda.w	($0004,a2),a2
	movea.l	a2,a1
	movea.l	a2,a0
	adda.w	(a1)+,a2
	move.l	a2,($001c,a5)
	lea.l	(L001ace,pc),a6
	lea.l	(L000638,pc),a3
	moveq.l	#$ff,d6
	moveq.l	#$00,d7
L000554:
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
	bcc	L0005be
	moveq.l	#$38,d1			;'8'
	add.b	d7,d1
	moveq.l	#$00,d2
	bsr	WriteOPM
	addq.w	#1,d7
	lea.l	($0050,a6),a6
	bra	L000554

L0005be:
	move.b	#$10,($001c,a6)
	move.b	#$08,($0022,a6)
	st.b	($0018,a6)
	clr.b	($0004,a6)
	cmp.w	#$000f,d7
	beq	L0005ee
	addq.w	#1,d7
	lea.l	($0050,a6),a6
	cmp.w	#$0009,d7
	bne	L000554
	lea.l	(L001756,pc),a6
	bra	L000554

L0005ee:
	lea.l	(-$0416,a5),a0
	moveq.l	#$0f,d0
L0005f4:
	clr.b	(a0)+
	dbra	d0,L0005f4
	clr.b	($0026,a5)
	moveq.l	#$00,d2
	moveq.l	#$01,d1
	bsr	WriteOPM
	moveq.l	#$0f,d1
	bsr	WriteOPM
	moveq.l	#$19,d1
	bsr	WriteOPM
	moveq.l	#$80,d2
	bsr	WriteOPM
	moveq.l	#$c8,d2
	moveq.l	#$12,d1
	move.b	d2,(-$0400,a5)
	tst.b	(-$0404,a5)
	bne	L00062a
	bsr	WriteOPM
L00062a:
	bsr	L000282
	bsr	L00044c
	moveq.l	#$00,d0
	rts

L000636:
	moveq.l	#$ff,d0
L000638:
	rts

L00063a:
	tst.b	($0024,a5)
	beq	L000676
	movea.l	($000c,a5),a0
	bra	L00064c

L000646:
	tst.w	(a0)
	beq	L000676
	adda.w	(a0),a0
L00064c:
	dbra	d1,L000646
	adda.w	($0006,a0),a0
	move.l	a0,d0
	rts

L000658:
	tst.b	($0025,a5)
	beq	L000676
	movea.l	($0010,a5),a0
	bra	L00066a

L000664:
	tst.l	(a0)
	beq	L000676
	adda.l	(a0),a0
L00066a:
	dbra	d1,L000664
	adda.w	($0006,a0),a0
	move.l	a0,d0
	rts

L000676:
	moveq.l	#$00,d0
	rts

L00067a:
	andi.b	#$f7,($00e88015)
	move.l	a6,-(a7)
	movea.l	($0006,a7),a6
	cmpa.l	($01a8),a6
	bne	L00069c
	pea.l	(L000696,pc)
	move.w	sr,-(a7)
	jmp	(a6)

L000696:
	movea.l	(a7)+,a6
	addq.w	#6,a7
	move.l	a6,-(a7)
L00069c:
	andi.w	#$faff,sr
	movem.l	d0-d7/a0-a5,-(a7)
	lea.l	(L001d9e,pc),a5
	st.b	($0039,a5)
	tst.b	(-$03fa,a5)
	bne	L000744
	lea.l	(L0019b0,pc),a0
	lea.l	(L0019a9,pc),a1
	tst.b	(a1)
	beq	L000744
	bpl	L0006cc
	move.b	#$7f,(a1)
	move.w	(a0),($0002,a0)
L0006cc:
	tst.w	($0002,a0)
	bmi	L0006d8
	subq.w	#2,($0002,a0)
	bra	L000744

L0006d8:
	lea.l	(L0019a6,pc),a1
	cmpi.b	#$0a,(a1)
	bge	L0006f0
L0006e2:
	cmpi.b	#$3e,(a1)		;'>'
	bge	L0006f6
	addq.b	#1,(a1)
	move.w	(a0),($0002,a0)
	bra	L000744

L0006f0:
	st.b	(-$03f7,a5)
	bra	L0006e2

L0006f6:
	tst.b	(-$03f4,a5)
	beq	L000704
	bsr	L000470
	bra	L0008f8

L000704:
	move.b	#$7f,(a1)
	clr.b	(-$03f5,a5)
	move.b	#$01,(-$03f9,a5)
	bsr	L0003d8
	movea.l	($0088),a0
	move.l	(-$0008,a0),d0
	cmp.l	#$50434d34,d0		;'PCM4'
	beq	L00072e
	cmp.l	#$50434d38,d0		;'PCM8'
	bne	L000734
L00072e:
	move.w	#$0100,d0
	trap	#2
L000734:
	tst.b	(-$0418,a5)
	beq	L000744
	move.w	#$01ff,d0
	trap	#2
	clr.b	(-$0418,a5)
L000744:
	lea.l	(L00199e,pc),a0
	move.b	(a0),d2
	moveq.l	#$12,d1
	tst.b	(-$0402,a5)
	bne	L00088c
	move.b	($080e),d7
	and.b	#$0f,d7
	cmp.b	#$05,d7
	beq	L0007f4
	cmp.b	#$09,d7
	beq	L0007e8
	cmp.b	#$06,d7
	beq	L0007e2
	cmp.b	#$0a,d7
	beq	L0007da
	cmp.b	#$04,d7
	beq	L000828
	cmp.b	#$08,d7
	beq	L0007fe
	cmp.b	#$02,d7
	bne	L00088c
	move.b	($080b),d7
	and.b	#$03,d7
	cmpi.b	#$80,($080a)
	beq	L0007ca
	cmp.b	#$02,d7
	beq	L0007ba
	cmp.b	#$01,d7
	bne	L00088c
	tst.b	(-$03fc,a5)
	bne	L000886
	subq.b	#1,($0002,a0)
	bra	L000886

L0007ba:
	tst.b	(-$03fc,a5)
	bne	L000886
	addq.b	#1,($0002,a0)
	bra	L000886

L0007ca:
	tst.b	(-$03fc,a5)
	bne	L000886
	clr.b	($0002,a0)
	bra	L000886

L0007da:
	move.b	#$ff,d2
	bra	L000894

L0007e2:
	moveq.l	#$00,d2
	bra	L000894

L0007e8:
	neg.b	d2
	lsr.b	#2,d2
	addq.b	#1,d2
	neg.b	d2
	bra	L000894

L0007f4:
	neg.b	d2
	add.b	d2,d2
	neg.b	d2
	bra	L000894

L0007fe:
	btst.b	#$01,($080b)
	beq	L00088c
	tst.b	(-$03fa,a5)
	beq	L00081c
	bpl	L00087a
	tst.b	(-$03fc,a5)
	bne	L000886
	bsr	L000418
	bra	L00087a

L00081c:
	tst.b	(-$03fc,a5)
	bne	L000886
	bsr	L0003d8
	bra	L00087a

L000828:
	move.b	($080b),d7
	beq	L00083e
	and.b	#$03,d7
	cmp.b	#$02,d7
	beq	L00086a
	cmp.b	#$01,d7
	beq	L000858
L00083e:
	cmpi.b	#$80,($080a)
	bne	L00088c
	tst.b	(-$03fc,a5)
	bne	L000886
	move.w	#$0011,(-$03ee,a5)
L000852:
	st.b	(-$03f5,a5)
	bra	L000886

L000858:
	tst.b	(-$03fc,a5)
	bne	L000886
	tst.b	(-$03f4,a5)
	beq	L000880
	bsr	L00045c
	bra	L00087a

L00086a:
	tst.b	(-$03fc,a5)
	bne	L000886
	tst.b	(-$03f4,a5)
	beq	L000880
	bsr	L000470
L00087a:
	st.b	(-$03fc,a5)
	bra	L0008f8

L000880:
	bsr	L0004ac
	bra	L00087a

L000886:
	st.b	(-$03fc,a5)
	bra	L000890

L00088c:
	clr.b	(-$03fc,a5)
L000890:
	add.b	($0002,a0),d2
L000894:
	tst.b	(-$03fa,a5)
	bne	L0008a0
	tst.b	(-$03f9,a5)
	beq	L0008a8
L0008a0:
	moveq.l	#$00,d2
	bsr	WriteOPM
	bra	L0008f8

L0008a8:
	bsr	WriteOPM
	lea.l	(L001ace,pc),a6
	moveq.l	#$00,d7
L0008b2:
	bsr	L000d32
	bsr	L000e96
	move.w	(L0019ae,pc),d0
	btst.l	d7,d0
	bne	L0008c4
	bsr	L00091e
L0008c4:
	lea.l	($0050,a6),a6
	addq.w	#1,d7
	cmp.w	#$0009,d7
	bcs	L0008b2
	tst.b	(-$0418,a5)
	beq	L0008f8
	lea.l	(L001756,pc),a6
L0008da:
	bsr	L000d32
	bsr	L000e96
	move.w	(L0019ae,pc),d0
	btst.l	d7,d0
	bne	L0008ec
	bsr	L00091e
L0008ec:
	lea.l	($0050,a6),a6
	addq.w	#1,d7
	cmp.w	#$0010,d7
	bcs	L0008da
L0008f8:
	bsr	L00044c
L0008fc:
	tst.b	($00e90003)
	bmi	L0008fc
	move.b	#$1b,($00e90001)
	clr.b	($0039,a5)
	movem.l	(a7)+,d0-d7/a0-a6
	ori.b	#$08,($00e88015)
	rte

L00091e:
	btst.b	#$00,($0016,a6)
	beq	L000986
	tst.b	($0020,a6)
	bne	L000982
	tst.b	($0018,a6)
	bmi	L000976
	bsr	L000a3c
	bsr	L000b22
	btst.b	#$03,($0016,a6)
	bne	L00096c
	move.b	($0024,a6),($0025,a6)
	beq	L000956
	clr.l	($0036,a6)
	clr.w	($004a,a6)
	bsr	L000d76
L000956:
	btst.b	#$01,($0016,a6)
	beq	L00096c
	moveq.l	#$01,d1
	moveq.l	#$02,d2
	bsr	WriteOPM
	moveq.l	#$00,d2
	bsr	WriteOPM
L00096c:
	clr.l	($000c,a6)
	bsr	L000994
	bsr	L000ab6
L000976:
	bsr	L000b3a
	andi.b	#$fe,($0016,a6)
	rts

L000982:
	subq.b	#1,($0020,a6)
L000986:
	tst.b	($0018,a6)
	bmi	L000992
	bsr	L000994
	bsr	L000ab6
L000992:
	rts

L000994:
	move.w	($0012,a6),d2
	add.w	($000c,a6),d2
	add.w	($0036,a6),d2
	cmp.w	($0014,a6),d2
	beq	L0009da
	move.w	d2,($0014,a6)
	move.w	#$17ff,d1
	cmp.w	d1,d2
	bls	L0009bc
	tst.w	d2
	bpl	L0009ba
	moveq.l	#$00,d2
	bra	L0009bc

L0009ba:
	move.w	d1,d2
L0009bc:
	add.w	d2,d2
	add.w	d2,d2
	moveq.l	#$30,d1			;'0'
	add.b	($0018,a6),d1
	bsr	WriteOPM
	subq.b	#8,d1
	move.w	d2,-(a7)
	moveq.l	#$00,d2
	move.b	(a7)+,d2
	move.b	(OPMNoteTable,pc,d2.w),d2
	bsr	WriteOPM
L0009da:
	rts

OPMNoteTable:
	.dc.b	$00,$01,$02,$04,$05,$06,$08,$09,$0a,$0c,$0d,$0e,$10,$11,$12,$14
	.dc.b	$15,$16,$18,$19,$1a,$1c,$1d,$1e,$20,$21,$22,$24,$25,$26,$28,$29
	.dc.b	$2a,$2c,$2d,$2e,$30,$31,$32,$34,$35,$36,$38,$39,$3a,$3c,$3d,$3e
	.dc.b	$40,$41,$42,$44,$45,$46,$48,$49,$4a,$4c,$4d,$4e,$50,$51,$52,$54
	.dc.b	$55,$56,$58,$59,$5a,$5c,$5d,$5e,$60,$61,$62,$64,$65,$66,$68,$69
	.dc.b	$6a,$6c,$6d,$6e,$70,$71,$72,$74,$75,$76,$78,$79,$7a,$7c,$7d,$7e
L000a3c:
	bclr.b	#$01,($0017,a6)
	beq	L000aac
	movea.l	($0004,a6),a0
	andi.b	#$c0,($001c,a6)
	move.b	(a0)+,d0
	or.b	d0,($001c,a6)
	and.w	#$0007,d0
	move.b	(CarrierSlot,pc,d0.w),d3
	move.b	d3,($0019,a6)
	move.b	(a0)+,d0
	lsl.b	#3,d0
	or.b	($0018,a6),d0
	move.b	d0,($001d,a6)
	moveq.l	#$40,d1			;'@'
	add.b	($0018,a6),d1
	moveq.l	#$03,d0
L000a74:
	move.b	(a0)+,d2
	bsr	WriteOPM
	addq.b	#8,d1
	dbra	d0,L000a74
	moveq.l	#$03,d0
L000a82:
	move.b	(a0)+,d2
	lsr.b	#1,d3
	bcc	L000a8a
	moveq.l	#$7f,d2
L000a8a:
	bsr	WriteOPM
	addq.b	#8,d1
	dbra	d0,L000a82
	moveq.l	#$0f,d0
L000a96:
	move.b	(a0)+,d2
	bsr	WriteOPM
	addq.b	#8,d1
	dbra	d0,L000a96
	st.b	($0023,a6)
	ori.b	#$64,($0017,a6)
L000aac:
	rts

CarrierSlot:
	.dc.b	$08,$08,$08,$08,$0c,$0e,$0e,$0f
L000ab6:
	moveq.l	#$00,d0
	move.b	($0022,a6),d0
	bclr.l	#$07,d0
	bne	L000ac6
	move.b	(VolumeTable,pc,d0.w),d0
L000ac6:
	add.b	(L0019a6,pc),d0
	bcs	L000ace
	bpl	L000ad0
L000ace:
	moveq.l	#$7f,d0
L000ad0:
	add.b	($004a,a6),d0
	bcs	L000ad8
	bpl	L000ada
L000ad8:
	moveq.l	#$7f,d0
L000ada:
	cmp.b	($0023,a6),d0
	beq	L000b10
L000ae0:
	move.b	d0,($0023,a6)
	movea.l	($0004,a6),a0
	addq.w	#6,a0
	move.b	($0019,a6),d3
	move.b	#$60,d1			;'`'
	add.b	($0018,a6),d1
	moveq.l	#$03,d4
L000af8:
	move.b	(a0)+,d2
	lsr.b	#1,d3
	bcc	L000b0a
	add.b	d0,d2
	bpl	L000b06
	move.b	#$7f,d2
L000b06:
	bsr	WriteOPM
L000b0a:
	addq.b	#8,d1
	dbra	d4,L000af8
L000b10:
	rts

VolumeTable:
	.dc.b	$2a,$28,$25,$22,$20,$1d,$1a,$18,$15,$12,$10,$0d,$0a,$08,$05,$02
L000b22:
	bclr.b	#$02,($0017,a6)
	beq	L000b38
	move.b	($001c,a6),d2
	moveq.l	#$20,d1			;' '
	add.b	($0018,a6),d1
	bra	WriteOPM

L000b38:
	rts

L000b3a:
	bset.b	#$03,($0016,a6)
	bne	L000b38
	tst.b	($0018,a6)
	bmi	L000b64
	move.b	($001d,a6),d2
	lea.l	(L001dce,pc),a2
	move.b	d2,(a2,d7.w)
	lea.l	(L001746,pc),a2
	move.b	d2,(a2,d7.w)
	move.b	#$08,d1
	bra	WriteOPM

L000b64:
	move.b	($0025,a5),d0
	beq	L000c02
	tst.b	(-$0403,a5)
	bne	L000c02
	moveq.l	#$00,d0
	move.w	($0012,a6),d0
	lsr.w	#6,d0
	move.b	($001c,a6),d2
	move.b	d2,d1
	and.w	#$0003,d1
	beq	L000b8e
	cmp.w	#$0003,d1
	bne	L000b92
L000b8e:
	eori.w	#$0003,d1
L000b92:
	and.w	#$001c,d2
	lsl.w	#6,d2
	or.w	d1,d2
	tst.b	(-$0418,a5)
	bne	L000c04
	tst.b	(-$03f7,a5)
	beq	L000baa
	andi.b	#$fc,d2
L000baa:
	lsl.w	#3,d0
	movea.l	($0020,a5),a1
	lea.l	(a1,d0.w),a0
	adda.l	(a0)+,a1
	addq.w	#2,a0
	move.w	(a0)+,d3
	beq	L000c02
	movea.l	($0088),a2
	move.l	(-$0008,a2),d0
	cmp.l	#$50434d34,d0		;'PCM4'
	beq	L000bd4
	cmp.l	#$50434d38,d0		;'PCM8'
	bne	L000be2
L000bd4:
	move.w	#$0101,d0
	trap	#2
	move.w	#$0100,d0
	trap	#2
	bra	L000be8

L000be2:
	moveq.l	#$67,d0			;'g'
	moveq.l	#$00,d1
	trap	#15
L000be8:
	moveq.l	#$60,d0			;'`'
	move.w	d2,d1
	moveq.l	#$00,d2
	move.w	d3,d2
	trap	#15
	lea.l	(L001dce,pc),a2
	clr.b	(a2,d7.w)
	lea.l	(L001746,pc),a2
	clr.b	(a2,d7.w)
L000c02:
	rts

L000c04:
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
	beq	L000c02
	adda.l	(a0),a1
	lea.l	(L001dda,pc),a0
	cmpa.l	a0,a1
	bcs	L000c8c
	move.l	a1,d0
	add.l	d3,d0
	bcs	L000c8c
	cmp.l	(-$065c,a5),d0
	bcc	L000c8c
	move.w	d7,d0
	subq.w	#8,d0
	moveq.l	#$00,d1
	move.b	($0022,a6),d1
	bclr.l	#$07,d1
	bne	L000c50
	lea.l	(VolumeTable,pc),a2
	move.b	(a2,d1.w),d1
L000c50:
	add.b	(L0019a6,pc),d1
	bmi	L000c5c
	cmp.b	#$2b,d1			;'+'
	bcs	L000c62
L000c5c:
	moveq.l	#$00,d1
	clr.b	d2
	bra	L000c66

L000c62:
	move.b	(PCMVolumeTable,pc,d1.w),d1
L000c66:
	swap.w	d1
	move.w	d2,d1
	moveq.l	#$00,d2
	trap	#2
	move.w	d7,d0
	subq.w	#8,d0
	move.l	d3,d2
	andi.l	#$00ffffff,d2
	trap	#2
	lea.l	(L001dce,pc),a2
	clr.b	($0008,a2)
	lea.l	(L001746,pc),a2
	clr.b	(a2,d7.w)
L000c8c:
	rts

PCMVolumeTable:
	.dc.b	$0f,$0f,$0f,$0e,$0e,$0e,$0d,$0d,$0d,$0c,$0c,$0b,$0b,$0b,$0a,$0a
	.dc.b	$0a,$09,$09,$08,$08,$08,$07,$07,$07,$06,$06,$05,$05,$05,$04,$04
	.dc.b	$04,$03,$03,$02,$02,$02,$01,$01,$01,$00,$00,$ff
L000cba:
	bclr.b	#$03,($0016,a6)
	beq	L000d02
	move.b	($0018,a6),d2
	bmi	L000cde
	moveq.l	#$08,d1
	lea.l	(L001dce,pc),a2
	move.b	d2,(a2,d7.w)
	lea.l	(L001746,pc),a2
	move.b	d2,(a2,d7.w)
	bra	WriteOPM

L000cde:
	move.b	($0025,a5),d0
	beq	L000d02
	tst.b	(-$0403,a5)
	bne	L000d02
	tst.b	(-$0418,a5)
	beq	L000d04
	move.w	d7,d0
	subq.w	#8,d0
	moveq.l	#$00,d1
	move.b	($0022,a6),d1
	swap.w	d1
	move.w	d2,d1
	moveq.l	#$00,d2
	trap	#2
L000d02:
	rts

L000d04:
	movea.l	($0088),a0
	move.l	(-$0008,a0),d0
	cmp.l	#$50434d34,d0		;'PCM4'
	beq	L000d1c
	cmp.l	#$50434d38,d0		;'PCM8'
	bne	L000d2a
L000d1c:
	move.w	#$0101,d0
	trap	#2
	move.w	#$0100,d0
	trap	#2
	rts

L000d2a:
	moveq.l	#$67,d0			;'g'
	moveq.l	#$00,d1
	trap	#15
	rts

L000d32:
	tst.b	($0018,a6)
	bmi	L000d74
	tst.b	($0016,a6)
	bpl	L000d4c
	tst.b	($0020,a6)
	bne	L000d4c
	move.l	($0008,a6),d0
	add.l	d0,($000c,a6)
L000d4c:
	tst.b	($0024,a6)
	beq	L000d5e
	tst.b	($0020,a6)
	bne	L000d74
	tst.b	($0025,a6)
	bne	L000d76
L000d5e:
	btst.b	#$05,($0016,a6)
	beq	L000d68
	bsr	L000d96
L000d68:
	btst.b	#$06,($0016,a6)
	beq	L000d74
	bsr	L000df8
L000d74:
	rts

L000d76:
	subq.b	#1,($0025,a6)
	bne	L000d94
	btst.b	#$05,($0016,a6)
	beq	L000d88
	bsr	L00124e
L000d88:
	btst.b	#$06,($0016,a6)
	beq	L000d94
	bsr	L0012bc
L000d94:
	rts

L000d96:
	move.l	($0032,a6),d1
	movea.l	($0026,a6),a0
	jmp	(a0)

L000da0:
	add.l	d1,($0036,a6)
	subq.w	#1,($003e,a6)
	bne	L000db4
	move.w	($003c,a6),($003e,a6)
	neg.l	($0036,a6)
L000db4:
	rts

L000db6:
	move.l	d1,($0036,a6)
	subq.w	#1,($003e,a6)
	bne	L000dca
	move.w	($003c,a6),($003e,a6)
	neg.l	($0032,a6)
L000dca:
	rts

L000dcc:
	add.l	d1,($0036,a6)
	subq.w	#1,($003e,a6)
	bne	L000de0
	move.w	($003c,a6),($003e,a6)
	neg.l	($0032,a6)
L000de0:
	rts

L000de2:
	subq.w	#1,($003e,a6)
	bne	L000df6
	bsr	L000e5c
	muls.w	d1,d0
	move.l	d0,($0036,a6)
	move.w	($003c,a6),($003e,a6)
L000df6:
	rts

L000df8:
	move.w	($0048,a6),d1
	movea.l	($0040,a6),a0
	jmp	(a0)

L000e02:
	add.w	d1,($004a,a6)
	subq.w	#1,($004e,a6)
	bne	L000e18
	move.w	($004c,a6),($004e,a6)
	move.w	($0046,a6),($004a,a6)
L000e18:
	rts

L000e1a:
	subq.w	#1,($004e,a6)
	bne	L000e2e
	move.w	($004c,a6),($004e,a6)
	add.w	d1,($004a,a6)
	neg.w	($0048,a6)
L000e2e:
	rts

L000e30:
	add.w	d1,($004a,a6)
	subq.w	#1,($004e,a6)
	bne	L000e44
	move.w	($004c,a6),($004e,a6)
	neg.w	($0048,a6)
L000e44:
	rts

L000e46:
	subq.w	#1,($004e,a6)
	bne	L000e5a
	bsr	L000e5c
	muls.w	d0,d1
	move.w	($004c,a6),($004e,a6)
	move.w	d1,($004a,a6)
L000e5a:
	rts

L000e5c:
	move.w	(-$0f2c,a5),d0
	mulu.w	#$c549,d0
	add.l	#$0000000c,d0
	move.w	d0,(-$0f2c,a5)
	lsr.l	#8,d0
	rts

L000e72:
	.dc.w	$1234
L000e74:
	lea.l	(L001988,pc),a0
	tst.b	(a0,d7.w)
	bne	L000e80
	rts

L000e80:
	clr.b	(a0,d7.w)
	cmp.w	#$0009,d7
	bcc	L000e8e
	clr.b	($27,a5,d7.w)
L000e8e:
	andi.b	#$f7,($0017,a6)
	bra	L000eb6

L000e96:
	btst.b	#$03,($0017,a6)
	bne	L000e74
	btst.b	#$02,($0016,a6)
	bne	L000eb0
	subq.b	#1,($001b,a6)
	bne	L000eb0
	bsr	L000cba
L000eb0:
	subq.b	#1,($001a,a6)
	bne	L000f06
L000eb6:
	movea.l	(a6),a4
	andi.b	#$7b,($0016,a6)
L000ebe:
	moveq.l	#$00,d0
	moveq.l	#$00,d1
	move.b	(a4)+,d0
	move.b	d0,d1
	bpl	L000ef8
	cmp.b	#$e0,d0
	bcc	L000f10
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
	bmi	L000f08
	mulu.w	d0,d1
	lsr.w	#3,d1
L000ef8:
	addq.w	#1,d1
	move.b	d1,($001b,a6)
	addq.w	#1,d0
	move.b	d0,($001a,a6)
	move.l	a4,(a6)
L000f06:
	rts

L000f08:
	add.b	d0,d1
	bcs	L000ef8
	moveq.l	#$00,d1
	bra	L000ef8

L000f10:
	ext.w	d0
	not.w	d0
	add.w	d0,d0
	move.w	(L000f22,pc,d0.w),d0
	pea.l	(L000ebe,pc)
	jmp	(L000f22,pc,d0.w)

L000f22:
	.dc.w	L000f62-L000f22
	.dc.w	L000f76-L000f22
	.dc.w	L000f8e-L000f22
	.dc.w	L000fb6-L000f22
	.dc.w	L000fec-L000f22
	.dc.w	L000ff8-L000f22
	.dc.w	L001014-L000f22
	.dc.w	L001034-L000f22
	.dc.w	L00103a-L000f22
	.dc.w	L001042-L000f22
	.dc.w	L001046-L000f22
	.dc.w	L001068-L000f22
	.dc.w	L001084-L000f22
	.dc.w	L001090-L000f22
	.dc.w	L0010a6-L000f22
	.dc.w	L00117e-L000f22
	.dc.w	L001184-L000f22
	.dc.w	L00119c-L000f22
	.dc.w	L0011c8-L000f22
	.dc.w	L0011e8-L000f22
	.dc.w	L00127c-L000f22
	.dc.w	L0012ea-L000f22
	.dc.w	L001340-L000f22
	.dc.w	L001346-L000f22
	.dc.w	L00137e-L000f22
	.dc.w	L00110a-L000f22
	.dc.w	L00110a-L000f22
	.dc.w	L00110a-L000f22
	.dc.w	L00110a-L000f22
	.dc.w	L00110a-L000f22
	.dc.w	L00110a-L000f22
	.dc.w	L00110a-L000f22
L000f62:
	moveq.l	#$12,d1
	move.b	(a4)+,d2
	tst.b	(-$0404,a5)
	bne	L000f74
	move.b	d2,(-$0400,a5)
	bra	WriteOPM

L000f74:
	rts

L000f76:
	move.b	(a4)+,d1
	move.b	(a4)+,d2
	cmp.b	#$12,d1
	bne	L000f8a
	tst.b	(-$0404,a5)
	bne	L000f74
	move.b	d2,(-$0400,a5)
L000f8a:
	bra	WriteOPM

L000f8e:
	tst.b	($0018,a6)
	bmi	L000fb0
	move.b	(a4)+,d0
	movea.l	($001c,a5),a0
	bra	L000fa0

L000f9c:
	lea.l	($001a,a0),a0
L000fa0:
	cmp.b	(a0)+,d0
	bne	L000f9c
	move.l	a0,($0004,a6)
	ori.b	#$02,($0017,a6)
	rts

L000fb0:
	move.b	(a4)+,($0004,a6)
	rts

L000fb6:
	tst.b	($0018,a6)
	bmi	L000fd2
	move.b	($001c,a6),d0
	ror.w	#6,d0
	move.b	(a4)+,d0
	rol.w	#6,d0
	move.b	d0,($001c,a6)
	ori.b	#$04,($0017,a6)
	rts

L000fd2:
	move.b	(a4)+,d0
	beq	L000fdc
	cmp.b	#$03,d0
	bne	L000fe0
L000fdc:
	eori.b	#$03,d0
L000fe0:
	andi.b	#$fc,($001c,a6)
	or.b	d0,($001c,a6)
	rts

L000fec:
	move.b	(a4)+,($0022,a6)
	ori.b	#$01,($0017,a6)
	rts

L000ff8:
	move.b	($0022,a6),d2
	bmi	L00100c
	beq	L00100a
L001000:
	subq.b	#1,($0022,a6)
	ori.b	#$01,($0017,a6)
L00100a:
	rts

L00100c:
	cmp.b	#-$01,d2
	bne	L001020
	rts

L001014:
	move.b	($0022,a6),d2
	bmi	L00102c
	cmp.b	#$0f,d2
	beq	L00102a
L001020:
	addq.b	#1,($0022,a6)
	ori.b	#$01,($0017,a6)
L00102a:
	rts

L00102c:
	cmp.b	#$80,d2
	bne	L001000
	rts

L001034:
	move.b	(a4)+,($001e,a6)
	rts

L00103a:
	ori.b	#$04,($0016,a6)
	rts

L001042:
	move.b	(a4)+,(a4)+
	rts

L001046:
	move.b	(a4)+,-(a7)
	move.w	(a7)+,d0
	move.b	(a4)+,d0
	subq.b	#1,(-$01,a4,d0.w)
	beq	L001066
	tst.b	(-$0401,a5)
	beq	L001064
	cmpi.b	#$f1,(a4)
	bne	L001064
	tst.b	($0001,a4)
	beq	L0010ae
L001064:
	adda.w	d0,a4
L001066:
	rts

L001068:
	move.b	(a4)+,-(a7)
	move.w	(a7)+,d0
	move.b	(a4)+,d0
	lea.l	(a4,d0.w),a0
	move.b	(a0)+,-(a7)
	move.w	(a7)+,d0
	move.b	(a0)+,d0
	cmpi.b	#$01,(-$01,a0,d0.w)
	bne	L001082
	movea.l	a0,a4
L001082:
	rts

L001084:
	move.b	(a4)+,-(a7)
	move.w	(a7)+,d0
	move.b	(a4)+,d0
	move.w	d0,($0010,a6)
	rts

L001090:
	move.b	(a4)+,-(a7)
	move.w	(a7)+,d0
	move.b	(a4)+,d0
	ext.l	d0
	asl.l	#8,d0
	move.l	d0,($0008,a6)
	ori.b	#$80,($0016,a6)
	rts

L0010a6:
	move.b	(a4)+,-(a7)
	beq	L001108
	move.w	(a7)+,d0
	move.b	(a4)+,d0
L0010ae:
	adda.w	d0,a4
	move.w	(L0019ac,pc),d0
	bclr.l	d7,d0
	move.w	d0,(-$03f2,a5)
	and.w	(L001998,pc),d0
	bne	L001106
	tst.b	(-$03f4,a5)
	bne	L0010de
	move.w	#$01ff,(-$03f2,a5)
	tst.b	(-$0418,a5)
	beq	L0010d8
	ori.w	#$fe00,(-$03f2,a5)
L0010d8:
	addq.w	#1,($003a,a5)
	bra	L001106

L0010de:
	tst.b	(-$03f5,a5)
	bne	L001106
	move.w	#$01ff,(-$03f2,a5)
	tst.b	(-$0418,a5)
	beq	L0010f6
	ori.w	#$fe00,(-$03f2,a5)
L0010f6:
	subq.w	#1,(-$03ea,a5)
	bne	L001106
	move.w	#$0011,(-$03ee,a5)
	st.b	(-$03f5,a5)
L001106:
	rts

L001108:
	addq.w	#2,a7
L00110a:
	lea.l	(L001570,pc),a4
	move.w	(L0019ac,pc),d0
	bclr.l	d7,d0
	move.w	d0,(-$03f2,a5)
	move.w	(L001998,pc),d0
	bclr.l	d7,d0
	move.w	d0,(-$0406,a5)
	bne	L00117c
	move.b	#$01,(-$03f9,a5)
	movea.l	($0088),a0
	move.l	(-$0008,a0),d0
	cmp.l	#$50434d34,d0		;'PCM4'
	beq	L001142
	cmp.l	#$50434d38,d0		;'PCM8'
	bne	L00114e
L001142:
	move.w	#$0101,d0
	trap	#2
	move.w	#$0100,d0
	trap	#2
L00114e:
	tst.b	(-$0418,a5)
	beq	L00115e
	move.w	#$01ff,d0
	trap	#2
	clr.b	(-$0418,a5)
L00115e:
	tst.b	(-$03f4,a5)
	bne	L00116c
	move.w	#$ffff,($003a,a5)
	bra	L00117c

L00116c:
	move.w	#$ffff,(-$03ee,a5)
	st.b	(-$03f5,a5)
	move.w	#$0037,(-$03f8,a5)	;'7'
L00117c:
	rts

L00117e:
	move.b	(a4)+,($001f,a6)
	rts

L001184:
	moveq.l	#$00,d0
	move.b	(a4)+,d0
	lea.l	(L001988,pc),a0
	st.b	(a0,d0.w)
	cmp.w	#$0009,d0
	bcc	L00119a
	st.b	($27,a5,d0.w)
L00119a:
	rts

L00119c:
	lea.l	(L001988,pc),a0
	tst.b	(a0,d7.w)
	beq	L0011bc
	clr.b	(a0,d7.w)
	cmp.w	#$0009,d7
	bcc	L0011b4
	clr.b	($27,a5,d7.w)
L0011b4:
	andi.b	#$f7,($0017,a6)
	rts

L0011bc:
	ori.b	#$08,($0017,a6)
	move.l	a4,(a6)
	addq.w	#4,a7
	rts

L0011c8:
	move.b	(a4)+,d2
	tst.b	($0018,a6)
	bmi	L0011da
	move.b	d2,($0026,a5)
	moveq.l	#$0f,d1
	bra	WriteOPM

L0011da:
	lsl.b	#2,d2
	andi.b	#$03,($001c,a6)
	or.b	d2,($001c,a6)
	rts

L0011e8:
	ori.b	#$20,($0016,a6)
	moveq.l	#$00,d1
	move.b	(a4)+,d1
	bmi	L001262
	move.w	d1,-(a7)
	andi.b	#$03,d1
	add.w	d1,d1
	move.w	(L001274,pc,d1.w),d0
	lea.l	(L001274,pc,d0.w),a0
	move.l	a0,($0026,a6)
	move.b	(a4)+,-(a7)
	move.w	(a7)+,d2
	move.b	(a4)+,d2
	move.w	d2,($003c,a6)
	cmp.b	#$02,d1
	beq	L001222
	lsr.w	#1,d2
	cmpi.b	#$06,d1
	bne	L001222
	moveq.l	#$01,d2
L001222:
	move.w	d2,($003a,a6)
	move.b	(a4)+,-(a7)
	move.w	(a7)+,d0
	move.b	(a4)+,d0
	ext.l	d0
	asl.l	#8,d0
	move.w	(a7)+,d1
	cmpi.b	#$04,d1
	bcs	L00123e
	asl.l	#8,d0
	andi.b	#$03,d1
L00123e:
	move.l	d0,($002e,a6)
	cmp.b	#$02,d1
	beq	L00124a
	moveq.l	#$00,d0
L00124a:
	move.l	d0,($002a,a6)
L00124e:
	move.w	($003a,a6),($003e,a6)
	move.l	($002e,a6),($0032,a6)
	move.l	($002a,a6),($0036,a6)
	rts

L001262:
	and.b	#$01,d1
	bne	L00124e
	andi.b	#$df,($0016,a6)
	clr.l	($0036,a6)
	rts

L001274:
	.dc.w	L000da0-L001274
	.dc.w	L000db6-L001274
	.dc.w	L000dcc-L001274
	.dc.w	L000de2-L001274
L00127c:
	ori.b	#$40,($0016,a6)
	moveq.l	#$00,d2
	move.b	(a4)+,d2
	bmi	L0012d0
	add.w	d2,d2
	move.w	(L0012e2,pc,d2.w),d0
	lea.l	(L0012e2,pc,d0.w),a0
	move.l	a0,($0040,a6)
	move.b	(a4)+,-(a7)
	move.w	(a7)+,d1
	move.b	(a4)+,d1
	move.w	d1,($004c,a6)
	move.b	(a4)+,-(a7)
	move.w	(a7)+,d0
	move.b	(a4)+,d0
	move.w	d0,($0044,a6)
	btst.l	#$01,d2
	bne	$000012b2
	muls.w	d1,d0
	neg.w	d0
	bpl	$000012b8
	moveq.l	#$00,d0
	move.w	d0,($0046,a6)
L0012bc:
	move.w	($004c,a6),($004e,a6)
	move.w	($0044,a6),($0048,a6)
	move.w	($0046,a6),($004a,a6)
	rts

L0012d0:
	and.b	#$01,d2
	bne	L0012bc
	andi.b	#$bf,($0016,a6)
	clr.w	($004a,a6)
	rts

L0012e2:
	.dc.w	L000e02-L0012e2
	.dc.w	L000e1a-L0012e2
	.dc.w	L000e30-L0012e2
	.dc.w	L000e46-L0012e2
L0012ea:
	move.b	(a4)+,d2
	bmi	$00001334
	andi.b	#$fd,($0016,a6)
	bclr.l	#$06,d2
	beq	$00001300
	ori.b	#$02,($0016,a6)
	move.b	($09da),d0
	and.b	#$c0,d0
	or.b	d0,d2
	moveq.l	#$1b,d1
	bsr	WriteOPM
	moveq.l	#$18,d1
	move.b	(a4)+,d2
	bsr	WriteOPM
	moveq.l	#$19,d1
	move.b	(a4)+,d2
	bsr	WriteOPM
	move.b	(a4)+,d2
	bsr	WriteOPM
	move.b	(a4)+,d2
	move.b	d2,($0021,a6)
	moveq.l	#$38,d1			;'8'
	add.b	($0018,a6),d1
	bra	WriteOPM

	and.b	#$01,d2
	beq	$0000132c
	move.b	($0021,a6),d2
	bra	$0000132c

	move.b	(a4)+,($0024,a6)
	rts

L001346:
	movea.l	($0088),a0
	cmpa.l	#$00f00000,a0
	bcc	L00137c
	cmpi.l	#$50434d34,(-$0008,a0)	;'PCM4'
	beq	L001366
	cmpi.l	#$50434d38,(-$0008,a0)	;'PCM8'
	bne	L00137c
L001366:
	st.b	(-$0418,a5)
	move.w	#$01fe,d0
	trap	#2
	ori.w	#$fe00,(-$03f2,a5)
	ori.w	#$fe00,(-$0406,a5)
L00137c:
	rts

L00137e:
	moveq.l	#$00,d0
	move.b	(a4)+,d0
	cmp.w	#$0002,d0
	bcc	L00110a
	add.w	d0,d0
	move.w	(L001394,pc,d0.w),d0
	jmp	(L001394,pc,d0.w)

L001394:
	.dc.w	L00110a-L001394
	.dc.w	L001398-L001394
L001398:
	moveq.l	#$00,d0
	move.b	(a4)+,d0
	move.w	d0,(-$03ee,a5)
	st.b	(-$03f5,a5)
	rts

WriteOPM:
	ori.w	#$0300,sr
	tst.b	($00e90003)
	bmi	WriteOPM
	move.b	d1,($00e90001)
	and.w	#$00ff,d1
	lea.l	(L0019ce,pc),a2
	move.b	d2,(a2,d1.w)
	move.b	d2,($00e90003)
	andi.w	#$faff,sr
	cmp.b	#$1b,d1
	beq	L0013d6
	rts

L0013d6:
	move.b	d2,($09da)
	rts

L0013dc:
	clr.l	-(a7)
	DOS	_SUPER
	pea.l	(VersionString,pc)
	DOS	_PRINT
	lea.l	(L001d9e,pc),a5
	move.w	#$0001,(-$03fa,a5)
	clr.l	(-$0404,a5)
	move.l	($0008,a0),(-$065c,a5)
	move.l	#$00010000,($0014,a5)
	move.l	#$0004e000,($0018,a5)
	clr.b	($0024,a5)
	clr.b	($0025,a5)
	addq.w	#1,a2
	bsr	L001474
	lea.l	(L001dda,pc),a4
	lea.l	(L0019c6,pc),a1
	move.l	a4,(a1)
	adda.l	($0014,a5),a4
	move.l	a4,($0004,a1)
	adda.l	($0018,a5),a4
	cmpa.l	($0008,a0),a4
	bhi	L00155e
	suba.l	a0,a0
	move.l	($0090,a0),(a5)
	move.l	($010c,a0),($0004,a5)
	lea.l	(Trap4Handler,pc),a1
	move.l	a1,($0090,a0)
	lea.l	(L000000,pc),a1
	suba.l	a1,a4
	clr.w	-(a7)
	move.l	a4,-(a7)
	DOS	_KEEPPR

L001454:
	movea.l	($0090),a4
	cmpa.l	#$00fe0000,a4
	bcc	L001472
	subq.w	#8,a4
	lea.l	(L000004,pc),a3
	move.w	#$0004,d0
L00146a:
	cmpm.b	(a3)+,(a4)+
	bne	L001472
	dbra	d0,L00146a
L001472:
	rts

L001474:
	move.b	(a2)+,d0
	bne	L001480
	bsr	L001454
	beq	L001558
	rts

L001480:
	cmp.b	#$20,d0			;' '
	beq	L001474
	cmp.b	#$09,d0
	beq	L001474
	cmp.b	#$2d,d0			;'-'
	beq	L00149a
	cmp.b	#$2f,d0			;'/'
	bne	L001564
L00149a:
	move.b	(a2)+,d0
	beq	L001564
	or.b	#$20,d0
	cmp.b	#$72,d0			;'r'
	bne	L0014ca
	bsr	L001454
	bne	L001552
	moveq.l	#$00,d0
	trap	#4
	tst.l	d0
	bne	L0014c4
	pea.l	(L0016c9,pc)
L0014bc:
	DOS	_PRINT
	addq.w	#4,a7
	clr.w	-(a7)
	DOS	_EXIT2

L0014c4:
	pea.l	(L001722,pc)
	bra	L0014bc

L0014ca:
	bsr	L001454
	beq	L001558
	cmp.b	#$6d,d0			;'m'
	bne	L0014e6
	cmpi.b	#$3a,(a2)		;':'
	bne	L0014de
	addq.w	#1,a2
L0014de:
	bsr	L00152c
	move.l	d0,($0014,a5)
	bra	L001474

L0014e6:
	cmp.b	#$70,d0			;'p'
	bne	L0014fe
	cmpi.b	#$3a,(a2)		;':'
	bne	L0014f4
	addq.w	#1,a2
L0014f4:
	bsr	L00152c
	move.l	d0,($0018,a5)
	bra	L001474

L0014fe:
	cmpi.b	#$66,d0			;'f'
	bne	L001564
	cmpi.b	#$3a,(a2)		;':'
	bne	L00150c
	addq.w	#1,a2
L00150c:
	move.l	a2,-(a7)
	bsr	L00152c
	cmpa.l	(a7)+,a2
	beq	L001520
	lsr.l	#8,d0
	lsr.l	#2,d0
	andi.l	#$00007fff,d0
	bra	L001522

L001520:
	moveq.l	#$11,d0
L001522:
	move.w	d0,($0000084e).l
	bra	L001474

L00152c:
	moveq.l	#$00,d0
L00152e:
	moveq.l	#$00,d1
	move.b	(a2),d1
	sub.b	#$30,d1			;'0'
	bcs	L001548
	cmp.b	#$09,d1
	bhi	L001548
	mulu.w	#$000a,d0
	add.l	d1,d0
	addq.w	#1,a2
	bra	L00152e

L001548:
	tst.l	d0
	bmi	L001564
	moveq.l	#$0a,d1
	lsl.l	d1,d0
	rts

L001552:
	pea.l	(L001703,pc)
	bra	L001568

L001558:
	pea.l	(L0016e0,pc)
	bra	L001568

L00155e:
	pea.l	(OutOfMemoryString,pc)
	bra	L001568

L001564:
	pea.l	(HelpString,pc)
L001568:
	DOS	_PRINT
	move.w	#$ffff,-(a7)
	DOS	_EXIT2

L001570:
	.dc.b	$7f,$f1,$00
VersionString:
	.dc.b	'X68k MXDRV music driver version 2.06+16 Rel.2 (c)1988-91 milk.,K.MAEKAWA, Missy.M, Yatsube',$0d,$0a,$00
HelpString:
	.dc.b	'使い方: mxdrv [switch]',$0d,$0a
	.dc.b	$09,'-m:<num> MMLバッファサイズ(Kbytes)           [省略時 64]',$0d,$0a
	.dc.b	$09,'-p:<num> PCMバッファサイズ(Kbytes)           [省略時312]',$0d,$0a
	.dc.b	$09,'-f:<num> FADEOUT SPEED (FAST 0 - 32767 SLOW) [省略時 23]',$0d,$0a
	.dc.b	$09,'-r       mxdrv解除',$0d,$0a,$00
OutOfMemoryString:
	.dc.b	$09,'メモリが不足しています',$0d,$0a,$00
L0016c9:
	.dc.b	$09,'mxdrvを解除しました',$0d,$0a,$00
L0016e0:
	.dc.b	$09,'mxdrvはすでに組み込まれています',$0d,$0a,$00
L001703:
	.dc.b	$09,'mxdrvは組み込まれていません',$0d,$0a,$00
L001722:
	.dc.b	$09,'mxdrvを解除出来ませんでした',$0d,$0a,$00,$00

	.bss

L001742:
	.ds.b	4
L001746:
	.ds.b	16
L001756:
	.ds.b	562
L001988:
	.ds.b	16
L001998:
	.ds.w	1
L00199a:
	.ds.b	4
L00199e:
	.ds.b	2
L0019a0:
	.ds.b	6
L0019a6:
	.ds.b	3
L0019a9:
	.ds.b	2
L0019ab:
	.ds.b	1
L0019ac:
	.ds.w	1
L0019ae:
	.ds.w	1
L0019b0:
	.ds.b	6
L0019b6:
	.ds.l	1
L0019ba:
	.ds.l	1
L0019be:
	.ds.l	1
L0019c2:
	.ds.l	1
L0019c6:
	.ds.l	1
L0019ca:
	.ds.l	1
L0019ce:
	.ds.b	256
L001ace:
	.ds.b	720
L001d9e:
	.ds.b	48
L001dce:
	.ds.b	12
L001dda:

	.end	L0013dc
