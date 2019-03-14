;=============================================
;  Filename mxdrv/2.06+16_Rel2++/mxdrvpp.x
;  Time Stamp Sun Feb 27 06:58:36 1994
;
;  Base address 000000
;  Exec address 0013f0
;  Text size    001756 byte(s)
;  Data size    000000 byte(s)
;  Bss  size    000698 byte(s)
;  363 Labels
;
;  Commandline dis  -h -k -m68030 -q1 -B -M -w16 -o120 -gmxdrv/2.06+16_Rel2++/mxdrvpp.lab --overwrite mxdrv/2.06+16_Rel2++/mxdrvpp.x mxdrv/2.06+16_Rel2++/mxdrvpp.s
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
	lea.l	(L001db2,pc),a5
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
	lea.l	(L0019e2,pc),a0
	move.l	a0,d0
	rts

L00008c:
	lea.l	(L0019b4,pc),a0
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
	lea.l	(L0019c4,pc),a0
	lea.l	(L0019bd,pc),a1
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
	lea.l	(L0019ba,pc),a1
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
	lea.l	(L0019b2,pc),a0
	move.b	(a0),d2
	moveq.l	#$12,d1
	tst.b	(-$03f9,a5)
	bne	L0001d0
	lea.l	(L001ae2,pc),a6
	moveq.l	#$00,d7
L000186:
	bsr	L000d46
	bsr	L000eaa
	move.w	(L0019c2,pc),d0
	btst.l	d7,d0
	bne	L00019a
	bsr	L000932
L00019a:
	lea.l	($0050,a6),a6
	addq.w	#1,d7
	cmp.w	#$0009,d7
	bcs	L000186
	tst.b	(-$0418,a5)
	beq	L0001d0
	lea.l	(L00176a,pc),a6
L0001b0:
	bsr	L000d46
	bsr	L000eaa
	move.w	(L0019c2,pc),d0
	btst.l	d7,d0
	bne	L0001c4
	bsr	L000932
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
	lea.l	(L00176a,pc),a0
	move.l	a0,d0
	rts

L0001fc:
	lea.l	(L00175a,pc),a0
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
	movea.l	(L0019ca,pc),a0
	bra	L00047e

L000246:
	move.b	(L0019bf,pc),d0
	rts

L00024c:
	clr.b	(-$03f4,a5)
	clr.b	($0024,a5)
	clr.b	($0025,a5)
	movea.l	(L0019da,pc),a0
	move.l	(a0),($000c,a5)
	move.l	($0004,a0),($0010,a5)
	bra	L000356

L00026a:
	bsr	L00024c
L00026c:
	movea.l	(L0019d6,pc),a0
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
	movea.l	(L0019da,pc),a0
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
	movea.l	(L0019de,pc),a0
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
	lea.l	(L001de2,pc),a0
	lea.l	(L00175a,pc),a1
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
	lea.l	(L001ae2,pc),a6
L0003e2:
	moveq.l	#$7f,d0
	bsr	L000af4
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
	lea.l	(L001ae2,pc),a6
L000422:
	bsr	L000aca
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
	move.b	(L0019ae,pc),d1
	bne	L000456
	moveq.l	#$3a,d2			;':'
L000456:
	moveq.l	#$14,d1
	bra	WriteOPM

L00045c:
	movea.l	(L0019ce,pc),a0
	movea.l	(L0019ca,pc),a1
	subq.w	#6,a0
	cmpa.l	a1,a0
	bcc	L00047e
	movea.l	(L0019d2,pc),a0
	bra	L00047e

L000470:
	movea.l	(L0019ce,pc),a0
	addq.w	#6,a0
	tst.w	(a0)
	bne	L00047e
	movea.l	(L0019ca,pc),a0
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
	lea.l	(L001ae2,pc),a6
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
	lea.l	(L00176a,pc),a6
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
	bne	L0006b0
	move.w	#$01a8,-(a7)
	pea.l	(L00069a,pc)
	move.w	sr,-(a7)
	jmp	(a6)

L00069a:
	tst.b	($0cbc)
	bne	L0006a2
	addq.l	#2,a7
L0006a2:
	movea.l	(a7)+,a6
	addq.w	#6,a7
	tst.b	($0cbc)
	beq	L0006ae
	addq.l	#2,a7
L0006ae:
	move.l	a6,-(a7)
L0006b0:
	andi.w	#$faff,sr
	movem.l	d0-d7/a0-a5,-(a7)
	lea.l	(L001db2,pc),a5
	st.b	($0039,a5)
	tst.b	(-$03fa,a5)
	bne	L000758
	lea.l	(L0019c4,pc),a0
	lea.l	(L0019bd,pc),a1
	tst.b	(a1)
	beq	L000758
	bpl	L0006e0
	move.b	#$7f,(a1)
	move.w	(a0),($0002,a0)
L0006e0:
	tst.w	($0002,a0)
	bmi	L0006ec
	subq.w	#2,($0002,a0)
	bra	L000758

L0006ec:
	lea.l	(L0019ba,pc),a1
	cmpi.b	#$0a,(a1)
	bge	L000704
L0006f6:
	cmpi.b	#$3e,(a1)		;'>'
	bge	L00070a
	addq.b	#1,(a1)
	move.w	(a0),($0002,a0)
	bra	L000758

L000704:
	st.b	(-$03f7,a5)
	bra	L0006f6

L00070a:
	tst.b	(-$03f4,a5)
	beq	L000718
	bsr	L000470
	bra	L00090c

L000718:
	move.b	#$7f,(a1)
	clr.b	(-$03f5,a5)
	move.b	#$01,(-$03f9,a5)
	bsr	L0003d8
	movea.l	($0088),a0
	move.l	(-$0008,a0),d0
	cmp.l	#$50434d34,d0		;'PCM4'
	beq	L000742
	cmp.l	#$50434d38,d0		;'PCM8'
	bne	L000748
L000742:
	move.w	#$0100,d0
	trap	#2
L000748:
	tst.b	(-$0418,a5)
	beq	L000758
	move.w	#$01ff,d0
	trap	#2
	clr.b	(-$0418,a5)
L000758:
	lea.l	(L0019b2,pc),a0
	move.b	(a0),d2
	moveq.l	#$12,d1
	tst.b	(-$0402,a5)
	bne	L0008a0
	move.b	($080e),d7
	and.b	#$0f,d7
	cmp.b	#$05,d7
	beq	L000808
	cmp.b	#$09,d7
	beq	L0007fc
	cmp.b	#$06,d7
	beq	L0007f6
	cmp.b	#$0a,d7
	beq	L0007ee
	cmp.b	#$04,d7
	beq	L00083c
	cmp.b	#$08,d7
	beq	L000812
	cmp.b	#$02,d7
	bne	L0008a0
	move.b	($080b),d7
	and.b	#$03,d7
	cmpi.b	#$80,($080a)
	beq	L0007de
	cmp.b	#$02,d7
	beq	L0007ce
	cmp.b	#$01,d7
	bne	L0008a0
	tst.b	(-$03fc,a5)
	bne	L00089a
	subq.b	#1,($0002,a0)
	bra	L00089a

L0007ce:
	tst.b	(-$03fc,a5)
	bne	L00089a
	addq.b	#1,($0002,a0)
	bra	L00089a

L0007de:
	tst.b	(-$03fc,a5)
	bne	L00089a
	clr.b	($0002,a0)
	bra	L00089a

L0007ee:
	move.b	#$ff,d2
	bra	L0008a8

L0007f6:
	moveq.l	#$00,d2
	bra	L0008a8

L0007fc:
	neg.b	d2
	lsr.b	#2,d2
	addq.b	#1,d2
	neg.b	d2
	bra	L0008a8

L000808:
	neg.b	d2
	add.b	d2,d2
	neg.b	d2
	bra	L0008a8

L000812:
	btst.b	#$01,($080b)
	beq	L0008a0
	tst.b	(-$03fa,a5)
	beq	L000830
	bpl	L00088e
	tst.b	(-$03fc,a5)
	bne	L00089a
	bsr	L000418
	bra	L00088e

L000830:
	tst.b	(-$03fc,a5)
	bne	L00089a
	bsr	L0003d8
	bra	L00088e

L00083c:
	move.b	($080b),d7
	beq	L000852
	and.b	#$03,d7
	cmp.b	#$02,d7
	beq	L00087e
	cmp.b	#$01,d7
	beq	L00086c
L000852:
	cmpi.b	#$80,($080a)
	bne	L0008a0
	tst.b	(-$03fc,a5)
	bne	L00089a
	move.w	#$0011,(-$03ee,a5)
	st.b	(-$03f5,a5)
	bra	L00089a

L00086c:
	tst.b	(-$03fc,a5)
	bne	L00089a
	tst.b	(-$03f4,a5)
	beq	L000894
	bsr	L00045c
	bra	L00088e

L00087e:
	tst.b	(-$03fc,a5)
	bne	L00089a
	tst.b	(-$03f4,a5)
	beq	L000894
	bsr	L000470
L00088e:
	st.b	(-$03fc,a5)
	bra	L00090c

L000894:
	bsr	L0004ac
	bra	L00088e

L00089a:
	st.b	(-$03fc,a5)
	bra	L0008a4

L0008a0:
	clr.b	(-$03fc,a5)
L0008a4:
	add.b	($0002,a0),d2
L0008a8:
	tst.b	(-$03fa,a5)
	bne	L0008b4
	tst.b	(-$03f9,a5)
	beq	L0008bc
L0008b4:
	moveq.l	#$00,d2
	bsr	WriteOPM
	bra	L00090c

L0008bc:
	bsr	WriteOPM
	lea.l	(L001ae2,pc),a6
	moveq.l	#$00,d7
L0008c6:
	bsr	L000d46
	bsr	L000eaa
	move.w	(L0019c2,pc),d0
	btst.l	d7,d0
	bne	L0008d8
	bsr	L000932
L0008d8:
	lea.l	($0050,a6),a6
	addq.w	#1,d7
	cmp.w	#$0009,d7
	bcs	L0008c6
	tst.b	(-$0418,a5)
	beq	L00090c
	lea.l	(L00176a,pc),a6
L0008ee:
	bsr	L000d46
	bsr	L000eaa
	move.w	(L0019c2,pc),d0
	btst.l	d7,d0
	bne	L000900
	bsr	L000932
L000900:
	lea.l	($0050,a6),a6
	addq.w	#1,d7
	cmp.w	#$0010,d7
	bcs	L0008ee
L00090c:
	bsr	L00044c
L000910:
	tst.b	($00e90003)
	bmi	L000910
	move.b	#$1b,($00e90001)
	clr.b	($0039,a5)
	movem.l	(a7)+,d0-d7/a0-a6
	ori.b	#$08,($00e88015)
	rte

L000932:
	btst.b	#$00,($0016,a6)
	beq	L00099a
	tst.b	($0020,a6)
	bne	L000996
	tst.b	($0018,a6)
	bmi	L00098a
	bsr	L000a50
	bsr	L000b36
	btst.b	#$03,($0016,a6)
	bne	L000980
	move.b	($0024,a6),($0025,a6)
	beq	L00096a
	clr.l	($0036,a6)
	clr.w	($004a,a6)
	bsr	L000d8a
L00096a:
	btst.b	#$01,($0016,a6)
	beq	L000980
	moveq.l	#$01,d1
	moveq.l	#$02,d2
	bsr	WriteOPM
	moveq.l	#$00,d2
	bsr	WriteOPM
L000980:
	clr.l	($000c,a6)
	bsr	L0009a8
	bsr	L000aca
L00098a:
	bsr	L000b4e
	andi.b	#$fe,($0016,a6)
	rts

L000996:
	subq.b	#1,($0020,a6)
L00099a:
	tst.b	($0018,a6)
	bmi	L0009a6
	bsr	L0009a8
	bsr	L000aca
L0009a6:
	rts

L0009a8:
	move.w	($0012,a6),d2
	add.w	($000c,a6),d2
	add.w	($0036,a6),d2
	cmp.w	($0014,a6),d2
	beq	L0009ee
	move.w	d2,($0014,a6)
	move.w	#$17ff,d1
	cmp.w	d1,d2
	bls	L0009d0
	tst.w	d2
	bpl	L0009ce
	moveq.l	#$00,d2
	bra	L0009d0

L0009ce:
	move.w	d1,d2
L0009d0:
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
L0009ee:
	rts

OPMNoteTable:
	.dc.b	$00,$01,$02,$04,$05,$06,$08,$09,$0a,$0c,$0d,$0e,$10,$11,$12,$14
	.dc.b	$15,$16,$18,$19,$1a,$1c,$1d,$1e,$20,$21,$22,$24,$25,$26,$28,$29
	.dc.b	$2a,$2c,$2d,$2e,$30,$31,$32,$34,$35,$36,$38,$39,$3a,$3c,$3d,$3e
	.dc.b	$40,$41,$42,$44,$45,$46,$48,$49,$4a,$4c,$4d,$4e,$50,$51,$52,$54
	.dc.b	$55,$56,$58,$59,$5a,$5c,$5d,$5e,$60,$61,$62,$64,$65,$66,$68,$69
	.dc.b	$6a,$6c,$6d,$6e,$70,$71,$72,$74,$75,$76,$78,$79,$7a,$7c,$7d,$7e
L000a50:
	bclr.b	#$01,($0017,a6)
	beq	L000ac0
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
L000a88:
	move.b	(a0)+,d2
	bsr	WriteOPM
	addq.b	#8,d1
	dbra	d0,L000a88
	moveq.l	#$03,d0
L000a96:
	move.b	(a0)+,d2
	lsr.b	#1,d3
	bcc	L000a9e
	moveq.l	#$7f,d2
L000a9e:
	bsr	WriteOPM
	addq.b	#8,d1
	dbra	d0,L000a96
	moveq.l	#$0f,d0
L000aaa:
	move.b	(a0)+,d2
	bsr	WriteOPM
	addq.b	#8,d1
	dbra	d0,L000aaa
	st.b	($0023,a6)
	ori.b	#$64,($0017,a6)
L000ac0:
	rts

CarrierSlot:
	.dc.b	$08,$08,$08,$08,$0c,$0e,$0e,$0f
L000aca:
	moveq.l	#$00,d0
	move.b	($0022,a6),d0
	bclr.l	#$07,d0
	bne	L000ada
	move.b	(VolumeTable,pc,d0.w),d0
L000ada:
	add.b	(L0019ba,pc),d0
	bcs	L000ae2
	bpl	L000ae4
L000ae2:
	moveq.l	#$7f,d0
L000ae4:
	add.b	($004a,a6),d0
	bcs	L000aec
	bpl	L000aee
L000aec:
	moveq.l	#$7f,d0
L000aee:
	cmp.b	($0023,a6),d0
	beq	L000b24
L000af4:
	move.b	d0,($0023,a6)
	movea.l	($0004,a6),a0
	addq.w	#6,a0
	move.b	($0019,a6),d3
	move.b	#$60,d1			;'`'
	add.b	($0018,a6),d1
	moveq.l	#$03,d4
L000b0c:
	move.b	(a0)+,d2
	lsr.b	#1,d3
	bcc	L000b1e
	add.b	d0,d2
	bpl	L000b1a
	move.b	#$7f,d2
L000b1a:
	bsr	WriteOPM
L000b1e:
	addq.b	#8,d1
	dbra	d4,L000b0c
L000b24:
	rts

VolumeTable:
	.dc.b	$2a,$28,$25,$22,$20,$1d,$1a,$18,$15,$12,$10,$0d,$0a,$08,$05,$02
L000b36:
	bclr.b	#$02,($0017,a6)
	beq	L000b4c
	move.b	($001c,a6),d2
	moveq.l	#$20,d1			;' '
	add.b	($0018,a6),d1
	bra	WriteOPM

L000b4c:
	rts

L000b4e:
	bset.b	#$03,($0016,a6)
	bne	L000b4c
	tst.b	($0018,a6)
	bmi	L000b78
	move.b	($001d,a6),d2
	lea.l	(L001de2,pc),a2
	move.b	d2,(a2,d7.w)
	lea.l	(L00175a,pc),a2
	move.b	d2,(a2,d7.w)
	move.b	#$08,d1
	bra	WriteOPM

L000b78:
	move.b	($0025,a5),d0
	beq	L000c16
	tst.b	(-$0403,a5)
	bne	L000c16
	moveq.l	#$00,d0
	move.w	($0012,a6),d0
	lsr.w	#6,d0
	move.b	($001c,a6),d2
	move.b	d2,d1
	and.w	#$0003,d1
	beq	L000ba2
	cmp.w	#$0003,d1
	bne	L000ba6
L000ba2:
	eori.w	#$0003,d1
L000ba6:
	and.w	#$007c,d2
	lsl.w	#6,d2
	or.w	d1,d2
	tst.b	(-$0418,a5)
	bne	L000c18
	tst.b	(-$03f7,a5)
	beq	L000bbe
	andi.b	#$fc,d2
L000bbe:
	lsl.w	#3,d0
	movea.l	($0020,a5),a1
	lea.l	(a1,d0.w),a0
	adda.l	(a0)+,a1
	addq.w	#2,a0
	move.w	(a0)+,d3
	beq	L000c16
	movea.l	($0088),a2
	move.l	(-$0008,a2),d0
	cmp.l	#$50434d34,d0		;'PCM4'
	beq	L000be8
	cmp.l	#$50434d38,d0		;'PCM8'
	bne	L000bf6
L000be8:
	move.w	#$0101,d0
	trap	#2
	move.w	#$0100,d0
	trap	#2
	bra	L000bfc

L000bf6:
	moveq.l	#$67,d0			;'g'
	moveq.l	#$00,d1
	trap	#15
L000bfc:
	moveq.l	#$60,d0			;'`'
	move.w	d2,d1
	moveq.l	#$00,d2
	move.w	d3,d2
	trap	#15
	lea.l	(L001de2,pc),a2
	clr.b	(a2,d7.w)
	lea.l	(L00175a,pc),a2
	clr.b	(a2,d7.w)
L000c16:
	rts

L000c18:
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
	beq	L000c16
	adda.l	(a0),a1
	lea.l	(L001dee,pc),a0
	cmpa.l	a0,a1
	bcs	L000ca0
	move.l	a1,d0
	add.l	d3,d0
	bcs	L000ca0
	cmp.l	(-$065c,a5),d0
	bcc	L000ca0
	move.w	d7,d0
	subq.w	#8,d0
	moveq.l	#$00,d1
	move.b	($0022,a6),d1
	bclr.l	#$07,d1
	bne	L000c64
	lea.l	(VolumeTable,pc),a2
	move.b	(a2,d1.w),d1
L000c64:
	add.b	(L0019ba,pc),d1
	bmi	L000c70
	cmp.b	#$2b,d1			;'+'
	bcs	L000c76
L000c70:
	moveq.l	#$00,d1
	clr.b	d2
	bra	L000c7a

L000c76:
	move.b	(PCMVolumeTable,pc,d1.w),d1
L000c7a:
	swap.w	d1
	move.w	d2,d1
	moveq.l	#$00,d2
	trap	#2
	move.w	d7,d0
	subq.w	#8,d0
	move.l	d3,d2
	andi.l	#$00ffffff,d2
	trap	#2
	lea.l	(L001de2,pc),a2
	clr.b	($0008,a2)
	lea.l	(L00175a,pc),a2
	clr.b	(a2,d7.w)
L000ca0:
	rts

PCMVolumeTable:
	.dc.b	$0f,$0f,$0f,$0e,$0e,$0e,$0d,$0d,$0d,$0c,$0c,$0b,$0b,$0b,$0a,$0a
	.dc.b	$0a,$09,$09,$08,$08,$08,$07,$07,$07,$06,$06,$05,$05,$05,$04,$04
	.dc.b	$04,$03,$03,$02,$02,$02,$01,$01,$01,$00,$00,$ff
L000cce:
	bclr.b	#$03,($0016,a6)
	beq	L000d16
	move.b	($0018,a6),d2
	bmi	L000cf2
	moveq.l	#$08,d1
	lea.l	(L001de2,pc),a2
	move.b	d2,(a2,d7.w)
	lea.l	(L00175a,pc),a2
	move.b	d2,(a2,d7.w)
	bra	WriteOPM

L000cf2:
	move.b	($0025,a5),d0
	beq	L000d16
	tst.b	(-$0403,a5)
	bne	L000d16
	tst.b	(-$0418,a5)
	beq	L000d18
	move.w	d7,d0
	subq.w	#8,d0
	moveq.l	#$00,d1
	move.b	($0022,a6),d1
	swap.w	d1
	move.w	d2,d1
	moveq.l	#$00,d2
	trap	#2
L000d16:
	rts

L000d18:
	movea.l	($0088),a0
	move.l	(-$0008,a0),d0
	cmp.l	#$50434d34,d0		;'PCM4'
	beq	L000d30
	cmp.l	#$50434d38,d0		;'PCM8'
	bne	L000d3e
L000d30:
	move.w	#$0101,d0
	trap	#2
	move.w	#$0100,d0
	trap	#2
	rts

L000d3e:
	moveq.l	#$67,d0			;'g'
	moveq.l	#$00,d1
	trap	#15
	rts

L000d46:
	tst.b	($0018,a6)
	bmi	L000d88
	tst.b	($0016,a6)
	bpl	L000d60
	tst.b	($0020,a6)
	bne	L000d60
	move.l	($0008,a6),d0
	add.l	d0,($000c,a6)
L000d60:
	tst.b	($0024,a6)
	beq	L000d72
	tst.b	($0020,a6)
	bne	L000d88
	tst.b	($0025,a6)
	bne	L000d8a
L000d72:
	btst.b	#$05,($0016,a6)
	beq	L000d7c
	bsr	L000daa
L000d7c:
	btst.b	#$06,($0016,a6)
	beq	L000d88
	bsr	L000e0c
L000d88:
	rts

L000d8a:
	subq.b	#1,($0025,a6)
	bne	L000da8
	btst.b	#$05,($0016,a6)
	beq	L000d9c
	bsr	L001262
L000d9c:
	btst.b	#$06,($0016,a6)
	beq	L000da8
	bsr	L0012d0
L000da8:
	rts

L000daa:
	move.l	($0032,a6),d1
	movea.l	($0026,a6),a0
	jmp	(a0)

L000db4:
	add.l	d1,($0036,a6)
	subq.w	#1,($003e,a6)
	bne	L000dc8
	move.w	($003c,a6),($003e,a6)
	neg.l	($0036,a6)
L000dc8:
	rts

L000dca:
	move.l	d1,($0036,a6)
	subq.w	#1,($003e,a6)
	bne	L000dde
	move.w	($003c,a6),($003e,a6)
	neg.l	($0032,a6)
L000dde:
	rts

L000de0:
	add.l	d1,($0036,a6)
	subq.w	#1,($003e,a6)
	bne	L000df4
	move.w	($003c,a6),($003e,a6)
	neg.l	($0032,a6)
L000df4:
	rts

L000df6:
	subq.w	#1,($003e,a6)
	bne	L000e0a
	bsr	L000e70
	muls.w	d1,d0
	move.l	d0,($0036,a6)
	move.w	($003c,a6),($003e,a6)
L000e0a:
	rts

L000e0c:
	move.w	($0048,a6),d1
	movea.l	($0040,a6),a0
	jmp	(a0)

L000e16:
	add.w	d1,($004a,a6)
	subq.w	#1,($004e,a6)
	bne	L000e2c
	move.w	($004c,a6),($004e,a6)
	move.w	($0046,a6),($004a,a6)
L000e2c:
	rts

L000e2e:
	subq.w	#1,($004e,a6)
	bne	L000e42
	move.w	($004c,a6),($004e,a6)
	add.w	d1,($004a,a6)
	neg.w	($0048,a6)
L000e42:
	rts

L000e44:
	add.w	d1,($004a,a6)
	subq.w	#1,($004e,a6)
	bne	L000e58
	move.w	($004c,a6),($004e,a6)
	neg.w	($0048,a6)
L000e58:
	rts

L000e5a:
	subq.w	#1,($004e,a6)
	bne	L000e6e
	bsr	L000e70
	muls.w	d0,d1
	move.w	($004c,a6),($004e,a6)
	move.w	d1,($004a,a6)
L000e6e:
	rts

L000e70:
	move.w	(-$0f2c,a5),d0
	mulu.w	#$c549,d0
	add.l	#$0000000c,d0
	move.w	d0,(-$0f2c,a5)
	lsr.l	#8,d0
	rts

L000e86:
	.dc.w	$1234
L000e88:
	lea.l	(L00199c,pc),a0
	tst.b	(a0,d7.w)
	bne	L000e94
	rts

L000e94:
	clr.b	(a0,d7.w)
	cmp.w	#$0009,d7
	bcc	L000ea2
	clr.b	($27,a5,d7.w)
L000ea2:
	andi.b	#$f7,($0017,a6)
	bra	L000eca

L000eaa:
	btst.b	#$03,($0017,a6)
	bne	L000e88
	btst.b	#$02,($0016,a6)
	bne	L000ec4
	subq.b	#1,($001b,a6)
	bne	L000ec4
	bsr	L000cce
L000ec4:
	subq.b	#1,($001a,a6)
	bne	L000f1a
L000eca:
	movea.l	(a6),a4
	andi.b	#$7b,($0016,a6)
L000ed2:
	moveq.l	#$00,d0
	moveq.l	#$00,d1
	move.b	(a4)+,d0
	move.b	d0,d1
	bpl	L000f0c
	cmp.b	#$e0,d0
	bcc	L000f24
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
	bmi	L000f1c
	mulu.w	d0,d1
	lsr.w	#3,d1
L000f0c:
	addq.w	#1,d1
	move.b	d1,($001b,a6)
	addq.w	#1,d0
	move.b	d0,($001a,a6)
	move.l	a4,(a6)
L000f1a:
	rts

L000f1c:
	add.b	d0,d1
	bcs	L000f0c
	moveq.l	#$00,d1
	bra	L000f0c

L000f24:
	ext.w	d0
	not.w	d0
	add.w	d0,d0
	move.w	(L000f36,pc,d0.w),d0
	pea.l	(L000ed2,pc)
	jmp	(L000f36,pc,d0.w)

L000f36:
	.dc.w	L000f76-L000f36
	.dc.w	L000f8a-L000f36
	.dc.w	L000fa2-L000f36
	.dc.w	L000fca-L000f36
	.dc.w	L001000-L000f36
	.dc.w	L00100c-L000f36
	.dc.w	L001028-L000f36
	.dc.w	L001048-L000f36
	.dc.w	L00104e-L000f36
	.dc.w	L001056-L000f36
	.dc.w	L00105a-L000f36
	.dc.w	L00107c-L000f36
	.dc.w	L001098-L000f36
	.dc.w	L0010a4-L000f36
	.dc.w	L0010ba-L000f36
	.dc.w	L001192-L000f36
	.dc.w	L001198-L000f36
	.dc.w	L0011b0-L000f36
	.dc.w	L0011dc-L000f36
	.dc.w	L0011fc-L000f36
	.dc.w	L001290-L000f36
	.dc.w	L0012fe-L000f36
	.dc.w	L001354-L000f36
	.dc.w	L00135a-L000f36
	.dc.w	L001392-L000f36
	.dc.w	L00111e-L000f36
	.dc.w	L00111e-L000f36
	.dc.w	L00111e-L000f36
	.dc.w	L00111e-L000f36
	.dc.w	L00111e-L000f36
	.dc.w	L00111e-L000f36
	.dc.w	L00111e-L000f36
L000f76:
	moveq.l	#$12,d1
	move.b	(a4)+,d2
	tst.b	(-$0404,a5)
	bne	L000f88
	move.b	d2,(-$0400,a5)
	bra	WriteOPM

L000f88:
	rts

L000f8a:
	move.b	(a4)+,d1
	move.b	(a4)+,d2
	cmp.b	#$12,d1
	bne	L000f9e
	tst.b	(-$0404,a5)
	bne	L000f88
	move.b	d2,(-$0400,a5)
L000f9e:
	bra	WriteOPM

L000fa2:
	tst.b	($0018,a6)
	bmi	L000fc4
	move.b	(a4)+,d0
	movea.l	($001c,a5),a0
	bra	L000fb4

L000fb0:
	lea.l	($001a,a0),a0
L000fb4:
	cmp.b	(a0)+,d0
	bne	L000fb0
	move.l	a0,($0004,a6)
	ori.b	#$02,($0017,a6)
	rts

L000fc4:
	move.b	(a4)+,($0004,a6)
	rts

L000fca:
	tst.b	($0018,a6)
	bmi	L000fe6
	move.b	($001c,a6),d0
	ror.w	#6,d0
	move.b	(a4)+,d0
	rol.w	#6,d0
	move.b	d0,($001c,a6)
	ori.b	#$04,($0017,a6)
	rts

L000fe6:
	move.b	(a4)+,d0
	beq	L000ff0
	cmp.b	#$03,d0
	bne	L000ff4
L000ff0:
	eori.b	#$03,d0
L000ff4:
	andi.b	#$fc,($001c,a6)
	or.b	d0,($001c,a6)
	rts

L001000:
	move.b	(a4)+,($0022,a6)
	ori.b	#$01,($0017,a6)
	rts

L00100c:
	move.b	($0022,a6),d2
	bmi	L001020
	beq	L00101e
L001014:
	subq.b	#1,($0022,a6)
	ori.b	#$01,($0017,a6)
L00101e:
	rts

L001020:
	cmp.b	#-$01,d2
	bne	L001034
	rts

L001028:
	move.b	($0022,a6),d2
	bmi	L001040
	cmp.b	#$0f,d2
	beq	L00103e
L001034:
	addq.b	#1,($0022,a6)
	ori.b	#$01,($0017,a6)
L00103e:
	rts

L001040:
	cmp.b	#$80,d2
	bne	L001014
	rts

L001048:
	move.b	(a4)+,($001e,a6)
	rts

L00104e:
	ori.b	#$04,($0016,a6)
	rts

L001056:
	move.b	(a4)+,(a4)+
	rts

L00105a:
	move.b	(a4)+,-(a7)
	move.w	(a7)+,d0
	move.b	(a4)+,d0
	subq.b	#1,(-$01,a4,d0.w)
	beq	L00107a
	tst.b	(-$0401,a5)
	beq	L001078
	cmpi.b	#$f1,(a4)
	bne	L001078
	tst.b	($0001,a4)
	beq	L0010c2
L001078:
	adda.w	d0,a4
L00107a:
	rts

L00107c:
	move.b	(a4)+,-(a7)
	move.w	(a7)+,d0
	move.b	(a4)+,d0
	lea.l	(a4,d0.w),a0
	move.b	(a0)+,-(a7)
	move.w	(a7)+,d0
	move.b	(a0)+,d0
	cmpi.b	#$01,(-$01,a0,d0.w)
	bne	L001096
	movea.l	a0,a4
L001096:
	rts

L001098:
	move.b	(a4)+,-(a7)
	move.w	(a7)+,d0
	move.b	(a4)+,d0
	move.w	d0,($0010,a6)
	rts

L0010a4:
	move.b	(a4)+,-(a7)
	move.w	(a7)+,d0
	move.b	(a4)+,d0
	ext.l	d0
	asl.l	#8,d0
	move.l	d0,($0008,a6)
	ori.b	#$80,($0016,a6)
	rts

L0010ba:
	move.b	(a4)+,-(a7)
	beq	L00111c
	move.w	(a7)+,d0
	move.b	(a4)+,d0
L0010c2:
	adda.w	d0,a4
	move.w	(L0019c0,pc),d0
	bclr.l	d7,d0
	move.w	d0,(-$03f2,a5)
	and.w	(L0019ac,pc),d0
	bne	L00111a
	tst.b	(-$03f4,a5)
	bne	L0010f2
	move.w	#$01ff,(-$03f2,a5)
	tst.b	(-$0418,a5)
	beq	L0010ec
	ori.w	#$fe00,(-$03f2,a5)
L0010ec:
	addq.w	#1,($003a,a5)
	bra	L00111a

L0010f2:
	tst.b	(-$03f5,a5)
	bne	L00111a
	move.w	#$01ff,(-$03f2,a5)
	tst.b	(-$0418,a5)
	beq	L00110a
	ori.w	#$fe00,(-$03f2,a5)
L00110a:
	subq.w	#1,(-$03ea,a5)
	bne	L00111a
	move.w	#$0011,(-$03ee,a5)
	st.b	(-$03f5,a5)
L00111a:
	rts

L00111c:
	addq.w	#2,a7
L00111e:
	lea.l	(L001584,pc),a4
	move.w	(L0019c0,pc),d0
	bclr.l	d7,d0
	move.w	d0,(-$03f2,a5)
	move.w	(L0019ac,pc),d0
	bclr.l	d7,d0
	move.w	d0,(-$0406,a5)
	bne	L001190
	move.b	#$01,(-$03f9,a5)
	movea.l	($0088),a0
	move.l	(-$0008,a0),d0
	cmp.l	#$50434d34,d0		;'PCM4'
	beq	L001156
	cmp.l	#$50434d38,d0		;'PCM8'
	bne	L001162
L001156:
	move.w	#$0101,d0
	trap	#2
	move.w	#$0100,d0
	trap	#2
L001162:
	tst.b	(-$0418,a5)
	beq	L001172
	move.w	#$01ff,d0
	trap	#2
	clr.b	(-$0418,a5)
L001172:
	tst.b	(-$03f4,a5)
	bne	L001180
	move.w	#$ffff,($003a,a5)
	bra	L001190

L001180:
	move.w	#$ffff,(-$03ee,a5)
	st.b	(-$03f5,a5)
	move.w	#$0037,(-$03f8,a5)	;'7'
L001190:
	rts

L001192:
	move.b	(a4)+,($001f,a6)
	rts

L001198:
	moveq.l	#$00,d0
	move.b	(a4)+,d0
	lea.l	(L00199c,pc),a0
	st.b	(a0,d0.w)
	cmp.w	#$0009,d0
	bcc	L0011ae
	st.b	($27,a5,d0.w)
L0011ae:
	rts

L0011b0:
	lea.l	(L00199c,pc),a0
	tst.b	(a0,d7.w)
	beq	L0011d0
	clr.b	(a0,d7.w)
	cmp.w	#$0009,d7
	bcc	L0011c8
	clr.b	($27,a5,d7.w)
L0011c8:
	andi.b	#$f7,($0017,a6)
	rts

L0011d0:
	ori.b	#$08,($0017,a6)
	move.l	a4,(a6)
	addq.w	#4,a7
	rts

L0011dc:
	move.b	(a4)+,d2
	tst.b	($0018,a6)
	bmi	L0011ee
	move.b	d2,($0026,a5)
	moveq.l	#$0f,d1
	bra	WriteOPM

L0011ee:
	lsl.b	#2,d2
	andi.b	#$03,($001c,a6)
	or.b	d2,($001c,a6)
	rts

L0011fc:
	ori.b	#$20,($0016,a6)
	moveq.l	#$00,d1
	move.b	(a4)+,d1
	bmi	L001276
	move.w	d1,-(a7)
	andi.b	#$03,d1
	add.w	d1,d1
	move.w	(L001288,pc,d1.w),d0
	lea.l	(L001288,pc,d0.w),a0
	move.l	a0,($0026,a6)
	move.b	(a4)+,-(a7)
	move.w	(a7)+,d2
	move.b	(a4)+,d2
	move.w	d2,($003c,a6)
	cmp.b	#$02,d1
	beq	L001236
	lsr.w	#1,d2
	cmpi.b	#$06,d1
	bne	L001236
	moveq.l	#$01,d2
L001236:
	move.w	d2,($003a,a6)
	move.b	(a4)+,-(a7)
	move.w	(a7)+,d0
	move.b	(a4)+,d0
	ext.l	d0
	asl.l	#8,d0
	move.w	(a7)+,d1
	cmpi.b	#$04,d1
	bcs	L001252
	asl.l	#8,d0
	andi.b	#$03,d1
L001252:
	move.l	d0,($002e,a6)
	cmp.b	#$02,d1
	beq	L00125e
	moveq.l	#$00,d0
L00125e:
	move.l	d0,($002a,a6)
L001262:
	move.w	($003a,a6),($003e,a6)
	move.l	($002e,a6),($0032,a6)
	move.l	($002a,a6),($0036,a6)
	rts

L001276:
	and.b	#$01,d1
	bne	L001262
	andi.b	#$df,($0016,a6)
	clr.l	($0036,a6)
	rts

L001288:
	.dc.w	L000db4-L001288
	.dc.w	L000dca-L001288
	.dc.w	L000de0-L001288
	.dc.w	L000df6-L001288
L001290:
	ori.b	#$40,($0016,a6)
	moveq.l	#$00,d2
	move.b	(a4)+,d2
	bmi	L0012e4
	add.w	d2,d2
	move.w	(L0012f6,pc,d2.w),d0
	lea.l	(L0012f6,pc,d0.w),a0
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
	bne	$000012c6
	muls.w	d1,d0
	neg.w	d0
	bpl	$000012cc
	moveq.l	#$00,d0
	move.w	d0,($0046,a6)
L0012d0:
	move.w	($004c,a6),($004e,a6)
	move.w	($0044,a6),($0048,a6)
	move.w	($0046,a6),($004a,a6)
	rts

L0012e4:
	and.b	#$01,d2
	bne	L0012d0
	andi.b	#$bf,($0016,a6)
	clr.w	($004a,a6)
	rts

L0012f6:
	.dc.w	L000e16-L0012f6
	.dc.w	L000e2e-L0012f6
	.dc.w	L000e44-L0012f6
	.dc.w	L000e5a-L0012f6
L0012fe:
	move.b	(a4)+,d2
	bmi	$00001348
	andi.b	#$fd,($0016,a6)
	bclr.l	#$06,d2
	beq	$00001314
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
	beq	$00001340
	move.b	($0021,a6),d2
	bra	$00001340

	move.b	(a4)+,($0024,a6)
	rts

L00135a:
	movea.l	($0088),a0
	cmpa.l	#$00f00000,a0
	bcc	L001390
	cmpi.l	#$50434d34,(-$0008,a0)	;'PCM4'
	beq	L00137a
	cmpi.l	#$50434d38,(-$0008,a0)	;'PCM8'
	bne	L001390
L00137a:
	st.b	(-$0418,a5)
	move.w	#$01fe,d0
	trap	#2
	ori.w	#$fe00,(-$03f2,a5)
	ori.w	#$fe00,(-$0406,a5)
L001390:
	rts

L001392:
	moveq.l	#$00,d0
	move.b	(a4)+,d0
	cmp.w	#$0002,d0
	bcc	L00111e
	add.w	d0,d0
	move.w	(L0013a8,pc,d0.w),d0
	jmp	(L0013a8,pc,d0.w)

L0013a8:
	.dc.w	L00111e-L0013a8
	.dc.w	L0013ac-L0013a8
L0013ac:
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
	lea.l	(L0019e2,pc),a2
	move.b	d2,(a2,d1.w)
	move.b	d2,($00e90003)
	andi.w	#$faff,sr
	cmp.b	#$1b,d1
	beq	L0013ea
	rts

L0013ea:
	move.b	d2,($09da)
	rts

Start:
	clr.l	-(a7)
	DOS	_SUPER
	pea.l	(L001587,pc)
	DOS	_PRINT
	lea.l	(L001db2,pc),a5
	move.w	#$0001,(-$03fa,a5)
	clr.l	(-$0404,a5)
	move.l	($0008,a0),(-$065c,a5)
	move.l	#$00010000,($0014,a5)
	move.l	#$0004e000,($0018,a5)
	clr.b	($0024,a5)
	clr.b	($0025,a5)
	addq.w	#1,a2
	bsr	L001488
	lea.l	(L001dee,pc),a4
	lea.l	(L0019da,pc),a1
	move.l	a4,(a1)
	adda.l	($0014,a5),a4
	move.l	a4,($0004,a1)
	adda.l	($0018,a5),a4
	cmpa.l	($0008,a0),a4
	bhi	L001572
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

L001468:
	movea.l	($0090),a4
	cmpa.l	#$00fe0000,a4
	bcc	L001486
	subq.w	#8,a4
	lea.l	(L000004,pc),a3
	move.w	#$0004,d0
L00147e:
	cmpm.b	(a3)+,(a4)+
	bne	L001486
	dbra	d0,L00147e
L001486:
	rts

L001488:
	move.b	(a2)+,d0
	bne	L001494
	bsr	L001468
	beq	L00156c
	rts

L001494:
	cmp.b	#$20,d0			;' '
	beq	L001488
	cmp.b	#$09,d0
	beq	L001488
	cmp.b	#$2d,d0			;'-'
	beq	L0014ae
	cmp.b	#$2f,d0			;'/'
	bne	L001578
L0014ae:
	move.b	(a2)+,d0
	beq	L001578
	or.b	#$20,d0
	cmp.b	#$72,d0			;'r'
	bne	L0014de
	bsr	L001468
	bne	L001566
	moveq.l	#$00,d0
	trap	#4
	tst.l	d0
	bne	L0014d8
	pea.l	(L0016dd,pc)
L0014d0:
	DOS	_PRINT
	addq.w	#4,a7
	clr.w	-(a7)
	DOS	_EXIT2

L0014d8:
	pea.l	(L001736,pc)
	bra	L0014d0

L0014de:
	bsr	L001468
	beq	L00156c
	cmp.b	#$6d,d0			;'m'
	bne	L0014fa
	cmpi.b	#$3a,(a2)		;':'
	bne	L0014f2
	addq.w	#1,a2
L0014f2:
	bsr	L001540
	move.l	d0,($0014,a5)
	bra	L001488

L0014fa:
	cmp.b	#$70,d0			;'p'
	bne	L001512
	cmpi.b	#$3a,(a2)		;':'
	bne	L001508
	addq.w	#1,a2
L001508:
	bsr	L001540
	move.l	d0,($0018,a5)
	bra	L001488

L001512:
	cmpi.b	#$66,d0			;'f'
	bne	L001578
	cmpi.b	#$3a,(a2)		;':'
	bne	L001520
	addq.w	#1,a2
L001520:
	move.l	a2,-(a7)
	bsr	L001540
	cmpa.l	(a7)+,a2
	beq	L001534
	lsr.l	#8,d0
	lsr.l	#2,d0
	andi.l	#$00007fff,d0
	bra	L001536

L001534:
	moveq.l	#$11,d0
L001536:
	move.w	d0,($00000862).l
	bra	L001488

L001540:
	moveq.l	#$00,d0
L001542:
	moveq.l	#$00,d1
	move.b	(a2),d1
	sub.b	#$30,d1			;'0'
	bcs	L00155c
	cmp.b	#$09,d1
	bhi	L00155c
	mulu.w	#$000a,d0
	add.l	d1,d0
	addq.w	#1,a2
	bra	L001542

L00155c:
	tst.l	d0
	bmi	L001578
	moveq.l	#$0a,d1
	lsl.l	d1,d0
	rts

L001566:
	pea.l	(L001717,pc)
	bra	L00157c

L00156c:
	pea.l	(L0016f4,pc)
	bra	L00157c

L001572:
	pea.l	(L0016c3,pc)
	bra	L00157c

L001578:
	pea.l	(L0015e4,pc)
L00157c:
	DOS	_PRINT
	move.w	#$ffff,-(a7)
	DOS	_EXIT2

L001584:
	.dc.b	$7f,$f1,$00
L001587:
	.dc.b	'X68k MXDRV music driver version 2.06+16 Rel2++(c)1988-91 milk.,K.MAEKAWA, Missy.M, Yatsube',$0d,$0a,$00
L0015e4:
	.dc.b	'使い方: mxdrv [switch]',$0d,$0a
	.dc.b	$09,'-m:<num> MMLバッファサイズ(Kbytes)           [省略時 64]',$0d,$0a
	.dc.b	$09,'-p:<num> PCMバッファサイズ(Kbytes)           [省略時312]',$0d,$0a
	.dc.b	$09,'-f:<num> FADEOUT SPEED (FAST 0 - 32767 SLOW) [省略時 23]',$0d,$0a
	.dc.b	$09,'-r       mxdrv解除',$0d,$0a,$00
L0016c3:
	.dc.b	$09,'メモリが不足しています',$0d,$0a,$00
L0016dd:
	.dc.b	$09,'mxdrvを解除しました',$0d,$0a,$00
L0016f4:
	.dc.b	$09,'mxdrvはすでに組み込まれています',$0d,$0a,$00
L001717:
	.dc.b	$09,'mxdrvは組み込まれていません',$0d,$0a,$00
L001736:
	.dc.b	$09,'mxdrvを解除出来ませんでした',$0d,$0a,$00,$00

	.bss

L001756:
	.ds.b	4
L00175a:
	.ds.b	16
L00176a:
	.ds.b	562
L00199c:
	.ds.b	16
L0019ac:
	.ds.w	1
L0019ae:
	.ds.b	4
L0019b2:
	.ds.b	2
L0019b4:
	.ds.b	6
L0019ba:
	.ds.b	3
L0019bd:
	.ds.b	2
L0019bf:
	.ds.b	1
L0019c0:
	.ds.w	1
L0019c2:
	.ds.w	1
L0019c4:
	.ds.b	6
L0019ca:
	.ds.l	1
L0019ce:
	.ds.l	1
L0019d2:
	.ds.l	1
L0019d6:
	.ds.l	1
L0019da:
	.ds.l	1
L0019de:
	.ds.l	1
L0019e2:
	.ds.b	256
L001ae2:
	.ds.b	720
L001db2:
	.ds.b	48
L001de2:
	.ds.b	12
L001dee:

	.end	Start
