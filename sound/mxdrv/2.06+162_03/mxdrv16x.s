;=============================================
;  Filename sound/mxdrv/2.06+162_03/mxdrv16x.x
;
;
;  Base address 000000
;  Exec address 001488
;  Text size    00164e byte(s)
;  Data size    000222 byte(s)
;  Bss  size    0006b8 byte(s)
;  377 Labels
;
;  Commandline dis  -h -k -m68030 -q1 -B -M -w16 -o120 -gsound/mxdrv/2.06+162_03/mxdrv16x.lab --overwrite sound/mxdrv/2.06+162_03/mxdrv16x.x sound/mxdrv/2.06+162_03/mxdrv16x.s
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
	lea.l	(L001ecc,pc),a5
	and.w	#$001f,d0
	add.w	d0,d0
	move.w	(MXDRVCallTable,pc,d0.w),d0
	jsr	(MXDRVCallTable,pc,d0.w)
L000022:
	movem.l	(a7)+,d1-d7/a0-a6
	rte

MXDRVCallTable:
	.dc.w	L0002a4-MXDRVCallTable
	.dc.w	L000614-MXDRVCallTable
	.dc.w	L0002be-MXDRVCallTable
	.dc.w	L0002e0-MXDRVCallTable
	.dc.w	L00047e-MXDRVCallTable
	.dc.w	L000340-MXDRVCallTable
	.dc.w	L0003be-MXDRVCallTable
	.dc.w	L0003f4-MXDRVCallTable
	.dc.w	L000618-MXDRVCallTable
	.dc.w	L000636-MXDRVCallTable
	.dc.w	L000068-MXDRVCallTable
	.dc.w	L00006e-MXDRVCallTable
	.dc.w	L000074-MXDRVCallTable
	.dc.w	L0001f8-MXDRVCallTable
	.dc.w	L00007e-MXDRVCallTable
	.dc.w	L000484-MXDRVCallTable
	.dc.w	L000084-MXDRVCallTable
	.dc.w	L00008c-MXDRVCallTable
	.dc.w	L00009c-MXDRVCallTable
	.dc.w	L0000a8-MXDRVCallTable
	.dc.w	L0000b2-MXDRVCallTable
	.dc.w	L0000ba-MXDRVCallTable
	.dc.w	L0000c4-MXDRVCallTable
	.dc.w	L0000d2-MXDRVCallTable
	.dc.w	L0001e8-MXDRVCallTable
	.dc.w	L0001f0-MXDRVCallTable
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
	lea.l	(L001afc,pc),a0
	move.l	a0,d0
	rts

L00008c:
	lea.l	(L001ace,pc),a0
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
	bsr	L000340
	rts

L0000d2:
	move.b	(-$0404,a5),d0
	beq	L0001dc
	movem.l	d1-d7/a0-a6,-(a7)
	st.b	($0039,a5)
	lea.l	(L001ade,pc),a0
	lea.l	(L001ad7,pc),a1
	tst.b	(a1)
	beq	L000166
	bpl	L0000f8
	move.b	#$7f,(a1)
	move.w	(a0),($0002,a0)
L0000f8:
	tst.w	($0002,a0)
	bmi	L000104
	subq.w	#2,($0002,a0)
	bra	L000166

L000104:
	lea.l	(L001ad4,pc),a1
	cmpi.b	#$0a,(a1)
	bge	L00011c
L00010e:
	cmpi.b	#$3e,(a1)		;'>'
	bge	L000122
	addq.b	#1,(a1)
	move.w	(a0),($0002,a0)
	bra	L000166

L00011c:
	st.b	(-$03f7,a5)
	bra	L00010e

L000122:
	tst.b	(-$03f4,a5)
	beq	L000130
	bsr	L000442
	bra	L0001c4

L000130:
	move.b	#$7f,(a1)
	clr.b	(-$03f5,a5)
	move.b	#$01,(-$03f9,a5)
	bsr	L0003be
	movea.l	($0088),a0
	cmpi.l	#$50434d38,(-$0008,a0)	;'PCM8'
	bne	L000156
	move.w	#$0100,d0
	trap	#2
L000156:
	tst.b	(-$0418,a5)
	beq	L000166
	move.w	#$01ff,d0
	trap	#2
	clr.b	(-$0418,a5)
L000166:
	lea.l	(L001acc,pc),a0
	move.b	(a0),d2
	moveq.l	#$12,d1
	tst.b	(-$03f9,a5)
	bne	L0001c4
	lea.l	(L001bfc,pc),a6
	moveq.l	#$00,d7
L00017a:
	bsr	L000cf4
	bsr	L000e8c
	move.w	(L001adc,pc),d0
	btst.l	d7,d0
	bne	L00018e
	bsr	L0008f4
L00018e:
	lea.l	($0050,a6),a6
	addq.w	#1,d7
	cmp.w	#$0009,d7
	bcs	L00017a
	tst.b	(-$0418,a5)
	beq	L0001c4
	lea.l	(L001884,pc),a6
L0001a4:
	bsr	L000cf4
	bsr	L000e8c
	move.w	(L001adc,pc),d0
	btst.l	d7,d0
	bne	L0001b8
	bsr	L0008f4
L0001b8:
	lea.l	($0050,a6),a6
	addq.w	#1,d7
	cmp.w	#$0010,d7
	bcs	L0001a4
L0001c4:
	tst.b	($00e90003)
	bmi	L0001c4
	move.b	#$1b,($00e90001)
	clr.b	($0039,a5)
	movem.l	(a7)+,d1-d7/a0-a6
L0001dc:
	move.b	(-$03fa,a5),-(a7)
	move.w	(a7)+,d0
	move.b	(-$03f9,a5),d0
	rts

L0001e8:
	lea.l	(L001884,pc),a0
	move.l	a0,d0
	rts

L0001f0:
	lea.l	(L001874,pc),a0
	move.l	a0,d0
	rts

L0001f8:
	cmp.b	#$f0,d1
	beq	L00025e
	cmp.b	#$fc,d1
	beq	L00023a
	tst.l	d1
	bmi	L000240
	tst.b	(-$03f4,a5)
	bne	L000614
	move.l	a2,(-$03dc,a5)
	move.l	a1,(-$03e8,a5)
	move.l	a1,(-$03e4,a5)
L00021c:
	tst.w	(a1)
	beq	L000224
	addq.w	#6,a1
	bra	L00021c

L000224:
	subq.w	#6,a1
	move.l	a1,(-$03e0,a5)
	st.b	(-$03f4,a5)
	st.b	(-$03f3,a5)
	movea.l	(L001ae4,pc),a0
	bra	L000450

L00023a:
	move.b	(L001ad9,pc),d0
	rts

L000240:
	clr.b	(-$03f4,a5)
	clr.b	($0024,a5)
	clr.b	($0025,a5)
	movea.l	(L001af4,pc),a0
	move.l	(a0),($000c,a5)
	move.l	($0004,a0),($0010,a5)
	bra	L000348

L00025e:
	bsr	L000240
L000260:
	movea.l	(L001af0,pc),a0
	pea.l	(a0)
	DOS	_MFREE
	addq.w	#4,a7
	moveq.l	#$00,d0
	move.l	d0,(-$03dc,a5)
	move.b	d0,(-$03f3,a5)
	rts

L000276:
	move.w	sr,-(a7)
	ori.w	#$0700,sr
	clr.b	(-$03f9,a5)
	tst.b	(-$0404,a5)
	bne	L0002a0
	lea.l	(L000658,pc),a1
	move.l	a1,($010c)
	movea.l	#$00e88000,a0
	ori.b	#$08,($0009,a0)
	ori.b	#$08,($0015,a0)
L0002a0:
	move.w	(a7)+,sr
	rts

L0002a4:
	bsr	L000348
	move.l	(a5),($0090)
	pea.l	(L000000-$0000f0,pc)
	DOS	_MFREE
	addq.w	#4,a7
	tst.b	(-$03f3,a5)
	beq	L0002bc
	bra	L000260

L0002bc:
	rts

L0002be:
	tst.b	(-$03f4,a5)
	beq	L0002ce
	movem.l	d1/a1,-(a7)
	bsr	L00025e
	movem.l	(a7)+,d1/a1
L0002ce:
	lea.l	($0024,a5),a2
	movea.l	(L001af4,pc),a0
	move.l	a0,($000c,a5)
	move.l	($0014,a5),d0
	bra	L000302

L0002e0:
	tst.b	(-$03f4,a5)
	beq	L0002f2
	movem.l	d1/a1,-(a7)
	bsr	L00025e
	movem.l	(a7)+,d1/a1
L0002f2:
	lea.l	($0025,a5),a2
	movea.l	(L001af8,pc),a0
	move.l	a0,($0010,a5)
	move.l	($0018,a5),d0
L000302:
	cmp.l	d1,d0
	bcs	L00033a
	movem.l	d1/a0-a2,-(a7)
	bsr	L000348
	movem.l	(a7)+,d1/a0-a2
	move.w	d1,d0
	andi.w	#$0003,d0
	lsr.l	#2,d1
	swap.w	d1
L00031a:
	swap.w	d1
L00031c:
	move.l	(a1)+,(a0)+
	dbra	d1,L00031c
	swap.w	d1
	dbra	d1,L00031a
	tst.w	d0
	beq	L000334
	subq.w	#1,d0
L00032e:
	move.b	(a1)+,(a0)+
	dbra	d0,L00032e
L000334:
	st.b	(a2)
	moveq.l	#$00,d0
	rts

L00033a:
	bset.l	#$1f,d0
	rts

L000340:
	tst.b	(-$03f4,a5)
	bne	L00025e
L000348:
	move.b	#$01,(-$03f9,a5)
	move.w	sr,-(a7)
	ori.w	#$0700,sr
	bsr	L0003c2
	movea.l	($0088),a0
	cmpi.l	#$50434d38,(-$0008,a0)	;'PCM8'
	bne	L00036a
	move.w	#$0100,d0
	trap	#2
L00036a:
	tst.b	(-$0418,a5)
	beq	L00037a
	move.w	#$01ff,d0
	trap	#2
	clr.b	(-$0418,a5)
L00037a:
	moveq.l	#$0f,d2
	moveq.l	#$e0,d1
L00037e:
	bsr	L001452
	addq.b	#1,d1
	bne	L00037e
	lea.l	(L001efc,pc),a0
	lea.l	(L001874,pc),a1
	moveq.l	#$07,d3
	moveq.l	#$00,d2
	moveq.l	#$08,d1
L000394:
	bsr	L001452
	move.b	d2,(a0)+
	move.b	d2,(a1)+
	addq.b	#1,d2
	dbra	d3,L000394
	movea.l	#$00e88000,a0
	andi.b	#$f7,($0009,a0)
	andi.b	#$f7,($0015,a0)
	move.l	($0004,a5),($010c)
	move.w	(a7)+,sr
	rts

L0003be:
	st.b	(-$03fa,a5)
L0003c2:
	moveq.l	#$07,d7
	lea.l	(L001bfc,pc),a6
L0003c8:
	moveq.l	#$7f,d0
	bsr	L000ab6
	lea.l	($0050,a6),a6
	dbra	d7,L0003c8
	movea.l	($0088),a0
	cmpi.l	#$50434d38,(-$0008,a0)	;'PCM8'
	bne	L0003ec
	move.w	#$0101,d0
	trap	#2
	rts

L0003ec:
	moveq.l	#$67,d0			;'g'
	moveq.l	#$00,d1
	trap	#15
	rts

L0003f4:
	clr.b	(-$03fa,a5)
	moveq.l	#$07,d7
	lea.l	(L001bfc,pc),a6
L0003fe:
	bsr	L000a8c
	lea.l	($0050,a6),a6
	dbra	d7,L0003fe
	movea.l	($0088),a0
	cmpi.l	#$50434d38,(-$0008,a0)	;'PCM8'
	bne	L00041e
	move.w	#$0102,d0
	trap	#2
L00041e:
	moveq.l	#$30,d2			;'0'
	move.b	(L001ac8,pc),d1
	bne	L000428
	moveq.l	#$3a,d2			;':'
L000428:
	moveq.l	#$14,d1
	bra	L001452

L00042e:
	movea.l	(L001ae8,pc),a0
	movea.l	(L001ae4,pc),a1
	subq.w	#6,a0
	cmpa.l	a1,a0
	bcc	L000450
	movea.l	(L001aec,pc),a0
	bra	L000450

L000442:
	movea.l	(L001ae8,pc),a0
	addq.w	#6,a0
	tst.w	(a0)
	bne	L000450
	movea.l	(L001ae4,pc),a0
L000450:
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
	bra	L000488

L00047e:
	clr.w	(-$03f0,a5)
	bra	L000488

L000484:
	move.w	d1,(-$03f0,a5)
L000488:
	lea.l	(L001f08,pc),a3
	moveq.l	#$00,d0
	move.l	d0,(a3)+
	move.l	d0,(a3)+
	move.l	d0,(a3)+
	move.l	d0,(a3)+
	clr.b	(-$03f8,a5)
	clr.b	(-$03f7,a5)
	clr.b	(-$03f5,a5)
	clr.b	(-$03f9,a5)
	tst.b	(-$03fa,a5)
	beq	L0004c0
	movea.l	($0088),a0
	cmpi.l	#$50434d38,(-$0008,a0)	;'PCM8'
	bne	L0004c0
	move.w	#$0100,d0
	trap	#2
L0004c0:
	clr.b	(-$03fa,a5)
	clr.b	(-$0418,a5)
	move.w	#$01ff,(-$03f2,a5)
	move.w	#$01ff,(-$0406,a5)
	clr.w	($003a,a5)
	move.b	($0024,a5),d0
	beq	L000614
	bsr	L000348
	movea.l	($000c,a5),a2
	move.w	($0002,a2),d1
	bmi	L000510
	tst.b	($0025,a5)
	beq	L000614
	movea.l	($0010,a5),a0
	bra	L000504

L0004fc:
	tst.l	(a0)
	beq	L000614
	adda.l	(a0),a0
L000504:
	dbra	d1,L0004fc
	adda.w	($0004,a0),a0
	move.l	a0,($0020,a5)
L000510:
	adda.w	($0004,a2),a2
	movea.l	a2,a1
	movea.l	a2,a0
	moveq.l	#$00,d0
	add.w	(a1)+,d0
	adda.l	d0,a2
	move.l	a2,($001c,a5)
	lea.l	(L001bfc,pc),a6
	lea.l	(L000616,pc),a3
	moveq.l	#$ff,d6
	moveq.l	#$00,d7
L00052e:
	movea.l	a0,a2
	moveq.l	#$00,d0
	add.w	(a1)+,d0
	adda.l	d0,a2
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
	bcc	L00059c
	moveq.l	#$38,d1			;'8'
	add.b	d7,d1
	moveq.l	#$00,d2
	bsr	L001452
	addq.w	#1,d7
	lea.l	($0050,a6),a6
	bra	L00052e

L00059c:
	move.b	#$10,($001c,a6)
	move.b	#$08,($0022,a6)
	st.b	($0018,a6)
	clr.b	($0004,a6)
	cmp.w	#$000f,d7
	beq	L0005cc
	addq.w	#1,d7
	lea.l	($0050,a6),a6
	cmp.w	#$0009,d7
	bne	L00052e
	lea.l	(L001884,pc),a6
	bra	L00052e

L0005cc:
	lea.l	(-$0416,a5),a0
	moveq.l	#$0f,d0
L0005d2:
	clr.b	(a0)+
	dbra	d0,L0005d2
	clr.b	($0026,a5)
	moveq.l	#$00,d2
	moveq.l	#$01,d1
	bsr	L001452
	moveq.l	#$0f,d1
	bsr	L001452
	moveq.l	#$19,d1
	bsr	L001452
	moveq.l	#$80,d2
	bsr	L001452
	moveq.l	#$c8,d2
	moveq.l	#$12,d1
	move.b	d2,(-$0400,a5)
	tst.b	(-$0404,a5)
	bne	L000608
	bsr	L001452
L000608:
	bsr	L000276
	bsr	L00041e
	moveq.l	#$00,d0
	rts

L000614:
	moveq.l	#$ff,d0
L000616:
	rts

L000618:
	tst.b	($0024,a5)
	beq	L000654
	movea.l	($000c,a5),a0
	bra	L00062a

L000624:
	tst.w	(a0)
	beq	L000654
	adda.w	(a0),a0
L00062a:
	dbra	d1,L000624
	adda.w	($0006,a0),a0
	move.l	a0,d0
	rts

L000636:
	tst.b	($0025,a5)
	beq	L000654
	movea.l	($0010,a5),a0
	bra	L000648

L000642:
	tst.l	(a0)
	beq	L000654
	adda.l	(a0),a0
L000648:
	dbra	d1,L000642
	adda.w	($0006,a0),a0
	move.l	a0,d0
	rts

L000654:
	moveq.l	#$00,d0
	rts

L000658:
	andi.b	#$f7,($00e88015)
	move.l	a6,-(a7)
	movea.l	($0006,a7),a6
	cmpa.l	($01a8),a6
	bne	L00067a
	pea.l	(L000674,pc)
	move.w	sr,-(a7)
	jmp	(a6)

L000674:
	movea.l	(a7)+,a6
	addq.w	#6,a7
	move.l	a6,-(a7)
L00067a:
	andi.w	#$faff,sr
	movem.l	d0-d7/a0-a5,-(a7)
	lea.l	(L001ecc,pc),a5
	lea.l	(L001f08,pc),a3
	st.b	($0039,a5)
	tst.b	(-$03fa,a5)
	bne	L00071a
	lea.l	(L001ade,pc),a0
	lea.l	(L001ad7,pc),a1
	tst.b	(a1)
	beq	L00071a
	bpl	L0006ac
	move.b	#$7f,(a1)
	move.w	(a0),($0002,a0)
L0006ac:
	tst.w	($0002,a0)
	bmi	L0006b8
	subq.w	#2,($0002,a0)
	bra	L00071a

L0006b8:
	lea.l	(L001ad4,pc),a1
	cmpi.b	#$0a,(a1)
	bge	L0006d0
L0006c2:
	cmpi.b	#$3e,(a1)		;'>'
	bge	L0006d6
	addq.b	#1,(a1)
	move.w	(a0),($0002,a0)
	bra	L00071a

L0006d0:
	st.b	(-$03f7,a5)
	bra	L0006c2

L0006d6:
	tst.b	(-$03f4,a5)
	beq	L0006e4
	bsr	L000442
	bra	L0008ce

L0006e4:
	move.b	#$7f,(a1)
	clr.b	(-$03f5,a5)
	move.b	#$01,(-$03f9,a5)
	bsr	L0003be
	movea.l	($0088),a0
	cmpi.l	#$50434d38,(-$0008,a0)	;'PCM8'
	bne	L00070a
	move.w	#$0100,d0
	trap	#2
L00070a:
	tst.b	(-$0418,a5)
	beq	L00071a
	move.w	#$01ff,d0
	trap	#2
	clr.b	(-$0418,a5)
L00071a:
	lea.l	(L001acc,pc),a0
	move.b	(a0),d2
	moveq.l	#$12,d1
	tst.b	(-$0402,a5)
	bne	L000862
	move.b	($080e),d7
	and.b	#$0f,d7
	cmp.b	#$05,d7
	beq	L0007ca
	cmp.b	#$09,d7
	beq	L0007be
	cmp.b	#$06,d7
	beq	L0007b8
	cmp.b	#$0a,d7
	beq	L0007b0
	cmp.b	#$04,d7
	beq	L0007fe
	cmp.b	#$08,d7
	beq	L0007d4
	cmp.b	#$02,d7
	bne	L000862
	move.b	($080b),d7
	and.b	#$03,d7
	cmpi.b	#$80,($080a)
	beq	L0007a0
	cmp.b	#$02,d7
	beq	L000790
	cmp.b	#$01,d7
	bne	L000862
	tst.b	(-$03fc,a5)
	bne	L00085c
	subq.b	#1,($0002,a0)
	bra	L00085c

L000790:
	tst.b	(-$03fc,a5)
	bne	L00085c
	addq.b	#1,($0002,a0)
	bra	L00085c

L0007a0:
	tst.b	(-$03fc,a5)
	bne	L00085c
	clr.b	($0002,a0)
	bra	L00085c

L0007b0:
	move.b	#$ff,d2
	bra	L00086a

L0007b8:
	moveq.l	#$00,d2
	bra	L00086a

L0007be:
	neg.b	d2
	lsr.b	#2,d2
	addq.b	#1,d2
	neg.b	d2
	bra	L00086a

L0007ca:
	neg.b	d2
	add.b	d2,d2
	neg.b	d2
	bra	L00086a

L0007d4:
	btst.b	#$01,($080b)
	beq	L000862
	tst.b	(-$03fa,a5)
	beq	L0007f2
	bpl	L000850
	tst.b	(-$03fc,a5)
	bne	L00085c
	bsr	L0003f4
	bra	L000850

L0007f2:
	tst.b	(-$03fc,a5)
	bne	L00085c
	bsr	L0003be
	bra	L000850

L0007fe:
	move.b	($080b),d7
	beq	L000814
	and.b	#$03,d7
	cmp.b	#$02,d7
	beq	L000840
	cmp.b	#$01,d7
	beq	L00082e
L000814:
	cmpi.b	#$80,($080a)
	bne	L000862
	tst.b	(-$03fc,a5)
	bne	L00085c
	move.w	#$0011,(-$03ee,a5)
	st.b	(-$03f5,a5)
	bra	L00085c

L00082e:
	tst.b	(-$03fc,a5)
	bne	L00085c
	tst.b	(-$03f4,a5)
	beq	L000856
	bsr	L00042e
	bra	L000850

L000840:
	tst.b	(-$03fc,a5)
	bne	L00085c
	tst.b	(-$03f4,a5)
	beq	L000856
	bsr	L000442
L000850:
	st.b	(-$03fc,a5)
	bra	L0008ce

L000856:
	bsr	L00047e
	bra	L000850

L00085c:
	st.b	(-$03fc,a5)
	bra	L000866

L000862:
	clr.b	(-$03fc,a5)
L000866:
	add.b	($0002,a0),d2
L00086a:
	tst.b	(-$03fa,a5)
	bne	L000876
	tst.b	(-$03f9,a5)
	beq	L00087e
L000876:
	moveq.l	#$00,d2
	bsr	L001452
	bra	L0008ce

L00087e:
	bsr	L001452
	lea.l	(L001bfc,pc),a6
	moveq.l	#$00,d7
L000888:
	bsr	L000cf4
	bsr	L000e8c
	move.w	(L001adc,pc),d0
	btst.l	d7,d0
	bne	L00089a
	bsr	L0008f4
L00089a:
	lea.l	($0050,a6),a6
	addq.w	#1,d7
	cmp.w	#$0009,d7
	bcs	L000888
	tst.b	(-$0418,a5)
	beq	L0008ce
	lea.l	(L001884,pc),a6
L0008b0:
	bsr	L000cf4
	bsr	L000e8c
	move.w	(L001adc,pc),d0
	btst.l	d7,d0
	bne	L0008c2
	bsr	L0008f4
L0008c2:
	lea.l	($0050,a6),a6
	addq.w	#1,d7
	cmp.w	#$0010,d7
	bcs	L0008b0
L0008ce:
	bsr	L00041e
L0008d2:
	tst.b	($00e90003)
	bmi	L0008d2
	move.b	#$1b,($00e90001)
	clr.b	($0039,a5)
	movem.l	(a7)+,d0-d7/a0-a6
	ori.b	#$08,($00e88015)
	rte

L0008f4:
	btst.b	#$00,($0016,a6)
	beq	L00095c
	tst.b	($0020,a6)
	bne	L000958
	tst.b	($0018,a6)
	bmi	L00094c
	bsr	L000a12
	bsr	L000af8
	btst.b	#$03,($0016,a6)
	bne	L000942
	move.b	($0024,a6),($0025,a6)
	beq	L00092c
	clr.l	($0036,a6)
	clr.w	($004a,a6)
	bsr	L000d68
L00092c:
	btst.b	#$01,($0016,a6)
	beq	L000942
	moveq.l	#$01,d1
	moveq.l	#$02,d2
	bsr	L001452
	moveq.l	#$00,d2
	bsr	L001452
L000942:
	clr.l	($000c,a6)
	bsr	L00096a
	bsr	L000a8c
L00094c:
	bsr	L000b10
	andi.b	#$fe,($0016,a6)
	rts

L000958:
	subq.b	#1,($0020,a6)
L00095c:
	tst.b	($0018,a6)
	bmi	L000968
	bsr	L00096a
	bsr	L000a8c
L000968:
	rts

L00096a:
	move.w	($0012,a6),d2
	add.w	($000c,a6),d2
	add.w	($0036,a6),d2
	cmp.w	($0014,a6),d2
	beq	L0009b0
	move.w	d2,($0014,a6)
	move.w	#$17ff,d1
	cmp.w	d1,d2
	bls	L000992
	tst.w	d2
	bpl	L000990
	moveq.l	#$00,d2
	bra	L000992

L000990:
	move.w	d1,d2
L000992:
	add.w	d2,d2
	add.w	d2,d2
	moveq.l	#$30,d1			;'0'
	add.b	($0018,a6),d1
	bsr	L001452
	subq.b	#8,d1
	move.w	d2,-(a7)
	moveq.l	#$00,d2
	move.b	(a7)+,d2
	move.b	(OPMNoteTable,pc,d2.w),d2
	bsr	L001452
L0009b0:
	rts

OPMNoteTable:
	.dc.b	$00,$01,$02,$04,$05,$06,$08,$09,$0a,$0c,$0d,$0e,$10,$11,$12,$14
	.dc.b	$15,$16,$18,$19,$1a,$1c,$1d,$1e,$20,$21,$22,$24,$25,$26,$28,$29
	.dc.b	$2a,$2c,$2d,$2e,$30,$31,$32,$34,$35,$36,$38,$39,$3a,$3c,$3d,$3e
	.dc.b	$40,$41,$42,$44,$45,$46,$48,$49,$4a,$4c,$4d,$4e,$50,$51,$52,$54
	.dc.b	$55,$56,$58,$59,$5a,$5c,$5d,$5e,$60,$61,$62,$64,$65,$66,$68,$69
	.dc.b	$6a,$6c,$6d,$6e,$70,$71,$72,$74,$75,$76,$78,$79,$7a,$7c,$7d,$7e
L000a12:
	bclr.b	#$01,($0017,a6)
	beq	L000a82
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
L000a4a:
	move.b	(a0)+,d2
	bsr	L001452
	addq.b	#8,d1
	dbra	d0,L000a4a
	moveq.l	#$03,d0
L000a58:
	move.b	(a0)+,d2
	lsr.b	#1,d3
	bcc	L000a60
	moveq.l	#$7f,d2
L000a60:
	bsr	L001452
	addq.b	#8,d1
	dbra	d0,L000a58
	moveq.l	#$0f,d0
L000a6c:
	move.b	(a0)+,d2
	bsr	L001452
	addq.b	#8,d1
	dbra	d0,L000a6c
	st.b	($0023,a6)
	ori.b	#$64,($0017,a6)
L000a82:
	rts

CarrierSlot:
	.dc.b	$08,$08,$08,$08,$0c,$0e,$0e,$0f
L000a8c:
	moveq.l	#$00,d0
	move.b	($0022,a6),d0
	bclr.l	#$07,d0
	bne	L000a9c
	move.b	(VolumeTable,pc,d0.w),d0
L000a9c:
	add.b	(L001ad4,pc),d0
	bcs	L000aa4
	bpl	L000aa6
L000aa4:
	moveq.l	#$7f,d0
L000aa6:
	add.b	($004a,a6),d0
	bcs	L000aae
	bpl	L000ab0
L000aae:
	moveq.l	#$7f,d0
L000ab0:
	cmp.b	($0023,a6),d0
	beq	L000ae6
L000ab6:
	move.b	d0,($0023,a6)
	movea.l	($0004,a6),a0
	addq.w	#6,a0
	move.b	($0019,a6),d3
	move.b	#$60,d1			;'`'
	add.b	($0018,a6),d1
	moveq.l	#$03,d4
L000ace:
	move.b	(a0)+,d2
	lsr.b	#1,d3
	bcc	L000ae0
	add.b	d0,d2
	bpl	L000adc
	move.b	#$7f,d2
L000adc:
	bsr	L001452
L000ae0:
	addq.b	#8,d1
	dbra	d4,L000ace
L000ae6:
	rts

VolumeTable:
	.dc.b	$2a,$28,$25,$22,$20,$1d,$1a,$18,$15,$12,$10,$0d,$0a,$08,$05,$02
L000af8:
	bclr.b	#$02,($0017,a6)
	beq	L000b0e
	move.b	($001c,a6),d2
	moveq.l	#$20,d1			;' '
	add.b	($0018,a6),d1
	bra	L001452

L000b0e:
	rts

L000b10:
	bset.b	#$03,($0016,a6)
	bne	L000b0e
	tst.b	($0018,a6)
	bmi	L000b3a
	move.b	($001d,a6),d2
	lea.l	(L001efc,pc),a2
	move.b	d2,(a2,d7.w)
	lea.l	(L001874,pc),a2
	move.b	d2,(a2,d7.w)
	move.b	#$08,d1
	bra	L001452

L000b3a:
	move.b	($0025,a5),d0
	beq	L000bce
	tst.b	(-$0403,a5)
	bne	L000bce
	moveq.l	#$00,d0
	move.w	($0012,a6),d0
	lsr.w	#6,d0
	move.b	($001c,a6),d2
	move.b	d2,d1
	and.w	#$0003,d1
	beq	L000b64
	cmp.w	#$0003,d1
	bne	L000b68
L000b64:
	eori.w	#$0003,d1
L000b68:
	and.w	#$001c,d2
	lsl.w	#6,d2
	or.w	d1,d2
	tst.b	(-$0418,a5)
	bne	L000bd0
	tst.b	(-$03f7,a5)
	beq	L000b80
	andi.b	#$fc,d2
L000b80:
	lsl.w	#3,d0
	movea.l	($0020,a5),a1
	lea.l	(a1,d0.w),a0
	adda.l	(a0)+,a1
	addq.w	#2,a0
	move.w	(a0)+,d3
	beq	L000bce
	movea.l	($0088),a2
	cmpi.l	#$50434d38,(-$0008,a2)	;'PCM8'
	bne	L000bae
	move.w	#$0101,d0
	trap	#2
	move.w	#$0100,d0
	trap	#2
	bra	L000bb4

L000bae:
	moveq.l	#$67,d0			;'g'
	moveq.l	#$00,d1
	trap	#15
L000bb4:
	moveq.l	#$60,d0			;'`'
	move.w	d2,d1
	moveq.l	#$00,d2
	move.w	d3,d2
	trap	#15
	lea.l	(L001efc,pc),a2
	clr.b	(a2,d7.w)
	lea.l	(L001874,pc),a2
	clr.b	(a2,d7.w)
L000bce:
	rts

L000bd0:
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
	beq	L000bce
	adda.l	(a0),a1
	lea.l	(L001f28,pc),a0
	cmpa.l	a0,a1
	bcs	L000c58
	move.l	a1,d0
	add.l	d3,d0
	bcs	L000c58
	cmp.l	(-$065c,a5),d0
	bcc	L000c58
	move.w	d7,d0
	subq.w	#8,d0
	moveq.l	#$00,d1
	move.b	($0022,a6),d1
	bclr.l	#$07,d1
	bne	L000c1c
	lea.l	(VolumeTable,pc),a2
	move.b	(a2,d1.w),d1
L000c1c:
	add.b	(L001ad4,pc),d1
	bmi	L000c28
	cmp.b	#$2b,d1			;'+'
	bcs	L000c2e
L000c28:
	moveq.l	#$00,d1
	clr.b	d2
	bra	L000c32

L000c2e:
	move.b	(PCMVolumeTable,pc,d1.w),d1
L000c32:
	swap.w	d1
	move.w	d2,d1
	moveq.l	#$00,d2
	trap	#2
	move.w	d7,d0
	subq.w	#8,d0
	move.l	d3,d2
	andi.l	#$00ffffff,d2
	trap	#2
	lea.l	(L001efc,pc),a2
	clr.b	($0008,a2)
	lea.l	(L001874,pc),a2
	clr.b	(a2,d7.w)
L000c58:
	rts

PCMVolumeTable:
	.dc.b	$0f,$0f,$0f,$0e,$0e,$0e,$0d,$0d,$0d,$0c,$0c,$0b,$0b,$0b,$0a,$0a
	.dc.b	$0a,$09,$09,$08,$08,$08,$07,$07,$07,$06,$06,$05,$05,$05,$04,$04
	.dc.b	$04,$03,$03,$02,$02,$02,$01,$01,$01,$00,$00,$ff
L000c86:
	bclr.b	#$03,($0016,a6)
	beq	L000cce
	move.b	($0018,a6),d2
	bmi	L000caa
	moveq.l	#$08,d1
	lea.l	(L001efc,pc),a2
	move.b	d2,(a2,d7.w)
	lea.l	(L001874,pc),a2
	move.b	d2,(a2,d7.w)
	bra	L001452

L000caa:
	move.b	($0025,a5),d0
	beq	L000cce
	tst.b	(-$0403,a5)
	bne	L000cce
	tst.b	(-$0418,a5)
	beq	L000cd0
	move.w	d7,d0
	subq.w	#8,d0
	moveq.l	#$00,d1
	move.b	($0022,a6),d1
	swap.w	d1
	move.w	d2,d1
	moveq.l	#$00,d2
	trap	#2
L000cce:
	rts

L000cd0:
	movea.l	($0088),a0
	cmpi.l	#$50434d38,(-$0008,a0)	;'PCM8'
	bne	L000cec
	move.w	#$0101,d0
	trap	#2
	move.w	#$0100,d0
	trap	#2
	rts

L000cec:
	moveq.l	#$67,d0			;'g'
	moveq.l	#$00,d1
	trap	#15
	rts

L000cf4:
	tst.b	($0018,a6)
	bmi	L000d62
	tst.b	($0016,a6)
	bpl	L000d3a
	tst.b	($0020,a6)
	bne	L000d3a
	move.l	($0008,a6),d0
	moveq.l	#$00,d3
	move.b	($0018,a6),d3
	move.b	(a3,d3.w),d3
	bne	L000d1c
	add.l	d0,($000c,a6)
	bra	L000d3a

L000d1c:
	move.l	d0,d1
	asr.l	#2,d1
	moveq.l	#$00,d2
	moveq.l	#$07,d4
L000d24:
	asr.l	#1,d1
	lsl.b	#1,d3
	bcc	L000d2c
	add.l	d1,d2
L000d2c:
	dbra	d4,L000d24
	add.l	d2,($000c,a6)
	sub.l	d2,d0
	move.l	d0,($0008,a6)
L000d3a:
	tst.b	($0024,a6)
	beq	L000d4c
	tst.b	($0020,a6)
	bne	L000d62
	tst.b	($0025,a6)
	bne	L000d68
L000d4c:
	btst.b	#$05,($0016,a6)
	beq	L000d56
	bsr	L000d8c
L000d56:
	btst.b	#$06,($0016,a6)
	beq	L000d62
	bsr	L000dee
L000d62:
	bsr	L000ff2
	rts

L000d68:
	subq.b	#1,($0025,a6)
	bne	L000d86
	btst.b	#$05,($0016,a6)
	beq	L000d7a
	bsr	L001308
L000d7a:
	btst.b	#$06,($0016,a6)
	beq	L000d86
	bsr	L001376
L000d86:
	bsr	L00102c
	rts

L000d8c:
	move.l	($0032,a6),d1
	movea.l	($0026,a6),a0
	jmp	(a0)

L000d96:
	add.l	d1,($0036,a6)
	subq.w	#1,($003e,a6)
	bne	L000daa
	move.w	($003c,a6),($003e,a6)
	neg.l	($0036,a6)
L000daa:
	rts

L000dac:
	move.l	d1,($0036,a6)
	subq.w	#1,($003e,a6)
	bne	L000dc0
	move.w	($003c,a6),($003e,a6)
	neg.l	($0032,a6)
L000dc0:
	rts

L000dc2:
	add.l	d1,($0036,a6)
	subq.w	#1,($003e,a6)
	bne	L000dd6
	move.w	($003c,a6),($003e,a6)
	neg.l	($0032,a6)
L000dd6:
	rts

L000dd8:
	subq.w	#1,($003e,a6)
	bne	L000dec
	bsr	L000e52
	muls.w	d1,d0
	move.l	d0,($0036,a6)
	move.w	($003c,a6),($003e,a6)
L000dec:
	rts

L000dee:
	move.w	($0048,a6),d1
	movea.l	($0040,a6),a0
	jmp	(a0)

L000df8:
	add.w	d1,($004a,a6)
	subq.w	#1,($004e,a6)
	bne	L000e0e
	move.w	($004c,a6),($004e,a6)
	move.w	($0046,a6),($004a,a6)
L000e0e:
	rts

L000e10:
	subq.w	#1,($004e,a6)
	bne	L000e24
	move.w	($004c,a6),($004e,a6)
	add.w	d1,($004a,a6)
	neg.w	($0048,a6)
L000e24:
	rts

L000e26:
	add.w	d1,($004a,a6)
	subq.w	#1,($004e,a6)
	bne	L000e3a
	move.w	($004c,a6),($004e,a6)
	neg.w	($0048,a6)
L000e3a:
	rts

L000e3c:
	subq.w	#1,($004e,a6)
	bne	L000e50
	bsr	L000e52
	muls.w	d0,d1
	move.w	($004c,a6),($004e,a6)
	move.w	d1,($004a,a6)
L000e50:
	rts

L000e52:
	move.w	(-$1064,a5),d0
	mulu.w	#$c549,d0
	add.l	#$0000000c,d0
	move.w	d0,(-$1064,a5)
	lsr.l	#8,d0
	rts

L000e68:
	.dc.w	$1234
L000e6a:
	lea.l	(L001ab6,pc),a0
	tst.b	(a0,d7.w)
	bne	L000e76
	rts

L000e76:
	clr.b	(a0,d7.w)
	cmp.w	#$0009,d7
	bcc	L000e84
	clr.b	($27,a5,d7.w)
L000e84:
	andi.b	#$f7,($0017,a6)
	bra	L000eae

L000e8c:
	btst.b	#$03,($0017,a6)
	bne	L000e6a
	btst.b	#$02,($0016,a6)
	bne	L000ea6
	subq.b	#1,($001b,a6)
	bne	L000ea6
	bsr	L000c86
L000ea6:
	subq.b	#1,($001a,a6)
	bne	L000f32
L000eae:
	movea.l	(a6),a4
	andi.b	#$7b,($0016,a6)
L000eb6:
	moveq.l	#$00,d0
	moveq.l	#$00,d1
	move.b	(a4)+,d0
	move.b	d0,d1
	bpl	L000ef0
	cmp.b	#$e0,d0
	bcc	L000f3c
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
	bmi	L000f34
	mulu.w	d0,d1
	lsr.w	#3,d1
L000ef0:
	addq.w	#1,d1
	move.b	d1,($001b,a6)
	addq.w	#1,d0
	move.b	d0,($001a,a6)
	move.l	a4,(a6)
	moveq.l	#$00,d0
	move.b	($0018,a6),d0
	bmi	L000f32
	tst.b	($0016,a6)
	bpl	L000f22
	move.b	(a3,d0.w),d1
	beq	L000f22
	moveq.l	#$00,d1
	move.b	($001a,a6),d1
	muls.w	($000a,a6),d1
	asl.l	#8,d1
	move.l	d1,($0008,a6)
L000f22:
	tst.b	($08,a3,d0.w)
	beq	L000f32
	move.b	#$01,($10,a3,d0.w)
	sf.b	($18,a3,d0.w)
L000f32:
	rts

L000f34:
	add.b	d0,d1
	bcs	L000ef0
	moveq.l	#$00,d1
	bra	L000ef0

L000f3c:
	ext.w	d0
	not.w	d0
	add.w	d0,d0
	pea.l	(L000eb6,pc)
	move.w	(L000f4e,pc,d0.w),d0
	jmp	(L000f4e,pc,d0.w)

L000f4e:
	.dc.w	L000f8e-L000f4e
	.dc.w	L000fa2-L000f4e
	.dc.w	L001048-L000f4e
	.dc.w	L001070-L000f4e
	.dc.w	L0010a6-L000f4e
	.dc.w	L0010b2-L000f4e
	.dc.w	L0010ce-L000f4e
	.dc.w	L0010ee-L000f4e
	.dc.w	L0010f4-L000f4e
	.dc.w	L0010fc-L000f4e
	.dc.w	L001100-L000f4e
	.dc.w	L001122-L000f4e
	.dc.w	L00113e-L000f4e
	.dc.w	L00114a-L000f4e
	.dc.w	L00116a-L000f4e
	.dc.w	L001238-L000f4e
	.dc.w	L00123e-L000f4e
	.dc.w	L001256-L000f4e
	.dc.w	L001282-L000f4e
	.dc.w	L0012a2-L000f4e
	.dc.w	L001336-L000f4e
	.dc.w	L0013a4-L000f4e
	.dc.w	L0013f6-L000f4e
	.dc.w	L0013fc-L000f4e
	.dc.w	L00142a-L000f4e
	.dc.w	L0011ce-L000f4e
	.dc.w	L0011ce-L000f4e
	.dc.w	L0011ce-L000f4e
	.dc.w	L0011ce-L000f4e
	.dc.w	L0011ce-L000f4e
	.dc.w	L0011ce-L000f4e
	.dc.w	L0011ce-L000f4e
L000f8e:
	moveq.l	#$12,d1
	move.b	(a4)+,d2
	tst.b	(-$0404,a5)
	bne	L000fa0
	move.b	d2,(-$0400,a5)
	bra	L001452

L000fa0:
	rts

L000fa2:
	move.b	(a4)+,d1
	move.b	(a4)+,d2
	cmp.b	#$06,d1
	beq	L000fc6
	cmp.b	#$07,d1
	beq	L000fd2
	cmp.b	#$12,d1
	bne	L000fc2
	tst.b	(-$0404,a5)
	bne	L000fa0
	move.b	d2,(-$0400,a5)
L000fc2:
	bra	L001452

L000fc6:
	move.b	($0018,a6),d1
	bmi	L000fd0
	move.b	d2,(a3,d1.w)
L000fd0:
	rts

L000fd2:
	move.b	($0018,a6),d1
	bmi	L000ff0
	move.b	d2,($08,a3,d1.w)
	move.b	d2,($10,a3,d1.w)
	sf.b	($18,a3,d1.w)
	moveq.l	#$38,d1			;'8'
	add.b	($0018,a6),d1
	moveq.l	#$00,d2
	bsr	L001452
L000ff0:
	rts

L000ff2:
	moveq.l	#$00,d0
	move.b	($0018,a6),d0
	bmi	L00102a
	move.b	($08,a3,d0.w),d1
	beq	L00102a
	subq.b	#1,($10,a3,d0.w)
	bne	L00102a
	moveq.l	#$00,d1
	move.b	($18,a3,d0.w),d1
	cmp.b	#$08,d1
	beq	L00102a
	move.b	(Table1,pc,d1.w),d2
	moveq.l	#$38,d1			;'8'
	add.b	d0,d1
	bsr	L001452
	move.b	($08,a3,d0.w),d2
	move.b	d2,($10,a3,d0.w)
	addq.b	#1,($18,a3,d0.w)
L00102a:
	rts

L00102c:
	moveq.l	#$00,d0
	move.b	($0018,a6),d0
	bmi	L00103e
	move.b	#$01,($10,a3,d0.w)
	sf.b	($18,a3,d0.w)
L00103e:
	rts

Table1:
	.dc.b	$00,$10,$21,$31,$42,$52,$63,$73
L001048:
	tst.b	($0018,a6)
	bmi	L00106a
	move.b	(a4)+,d0
	movea.l	($001c,a5),a0
	bra	L00105a

L001056:
	lea.l	($001a,a0),a0
L00105a:
	cmp.b	(a0)+,d0
	bne	L001056
	move.l	a0,($0004,a6)
	ori.b	#$02,($0017,a6)
	rts

L00106a:
	move.b	(a4)+,($0004,a6)
	rts

L001070:
	tst.b	($0018,a6)
	bmi	L00108c
	move.b	($001c,a6),d0
	ror.w	#6,d0
	move.b	(a4)+,d0
	rol.w	#6,d0
	move.b	d0,($001c,a6)
	ori.b	#$04,($0017,a6)
	rts

L00108c:
	move.b	(a4)+,d0
	beq	L001096
	cmp.b	#$03,d0
	bne	L00109a
L001096:
	eori.b	#$03,d0
L00109a:
	andi.b	#$fc,($001c,a6)
	or.b	d0,($001c,a6)
	rts

L0010a6:
	move.b	(a4)+,($0022,a6)
	ori.b	#$01,($0017,a6)
	rts

L0010b2:
	move.b	($0022,a6),d2
	bmi	L0010c6
	beq	L0010c4
L0010ba:
	subq.b	#1,($0022,a6)
	ori.b	#$01,($0017,a6)
L0010c4:
	rts

L0010c6:
	cmp.b	#-$01,d2
	bne	L0010da
	rts

L0010ce:
	move.b	($0022,a6),d2
	bmi	L0010e6
	cmp.b	#$0f,d2
	beq	L0010e4
L0010da:
	addq.b	#1,($0022,a6)
	ori.b	#$01,($0017,a6)
L0010e4:
	rts

L0010e6:
	cmp.b	#$80,d2
	bne	L0010ba
	rts

L0010ee:
	move.b	(a4)+,($001e,a6)
	rts

L0010f4:
	ori.b	#$04,($0016,a6)
	rts

L0010fc:
	move.b	(a4)+,(a4)+
	rts

L001100:
	move.b	(a4)+,-(a7)
	move.w	(a7)+,d0
	move.b	(a4)+,d0
	subq.b	#1,(-$01,a4,d0.w)
	beq	L001120
	tst.b	(-$0401,a5)
	beq	L00111e
	cmpi.b	#$f1,(a4)
	bne	L00111e
	tst.b	($0001,a4)
	beq	L001172
L00111e:
	adda.w	d0,a4
L001120:
	rts

L001122:
	move.b	(a4)+,-(a7)
	move.w	(a7)+,d0
	move.b	(a4)+,d0
	lea.l	(a4,d0.w),a0
	move.b	(a0)+,-(a7)
	move.w	(a7)+,d0
	move.b	(a0)+,d0
	cmpi.b	#$01,(-$01,a0,d0.w)
	bne	L00113c
	movea.l	a0,a4
L00113c:
	rts

L00113e:
	move.b	(a4)+,-(a7)
	move.w	(a7)+,d0
	move.b	(a4)+,d0
	move.w	d0,($0010,a6)
	rts

L00114a:
	ori.b	#$80,($0016,a6)
	move.b	(a4)+,-(a7)
	move.w	(a7)+,d0
	move.b	(a4)+,d0
	ext.l	d0
	move.b	($0018,a6),d1
	tst.b	(a3,d1.w)
	bne	L001164
	asl.l	#8,d0
L001164:
	move.l	d0,($0008,a6)
	rts

L00116a:
	move.b	(a4)+,-(a7)
	beq	L0011cc
	move.w	(a7)+,d0
	move.b	(a4)+,d0
L001172:
	adda.w	d0,a4
	move.w	(L001ada,pc),d0
	bclr.l	d7,d0
	move.w	d0,(-$03f2,a5)
	and.w	(L001ac6,pc),d0
	bne	L0011ca
	tst.b	(-$03f4,a5)
	bne	L0011a2
	move.w	#$01ff,(-$03f2,a5)
	tst.b	(-$0418,a5)
	beq	L00119c
	ori.w	#$fe00,(-$03f2,a5)
L00119c:
	addq.w	#1,($003a,a5)
	bra	L0011ca

L0011a2:
	tst.b	(-$03f5,a5)
	bne	L0011ca
	move.w	#$01ff,(-$03f2,a5)
	tst.b	(-$0418,a5)
	beq	L0011ba
	ori.w	#$fe00,(-$03f2,a5)
L0011ba:
	subq.w	#1,(-$03ea,a5)
	bne	L0011ca
	move.w	#$0011,(-$03ee,a5)
	st.b	(-$03f5,a5)
L0011ca:
	rts

L0011cc:
	addq.w	#2,a7
L0011ce:
	lea.l	(EndPlayBytes,pc),a4
	move.w	(L001ada,pc),d0
	bclr.l	d7,d0
	move.w	d0,(-$03f2,a5)
	move.w	(L001ac6,pc),d0
	bclr.l	d7,d0
	move.w	d0,(-$0406,a5)
	bne	L001236
	move.b	#$01,(-$03f9,a5)
	movea.l	($0088),a0
	cmpi.l	#$50434d38,(-$0008,a0)	;'PCM8'
	bne	L001208
	move.w	#$0101,d0
	trap	#2
	move.w	#$0100,d0
	trap	#2
L001208:
	tst.b	(-$0418,a5)
	beq	L001218
	move.w	#$01ff,d0
	trap	#2
	clr.b	(-$0418,a5)
L001218:
	tst.b	(-$03f4,a5)
	bne	L001226
	move.w	#$ffff,($003a,a5)
	bra	L001236

L001226:
	move.w	#$ffff,(-$03ee,a5)
	st.b	(-$03f5,a5)
	move.w	#$0037,(-$03f8,a5)	;'7'
L001236:
	rts

L001238:
	move.b	(a4)+,($001f,a6)
	rts

L00123e:
	moveq.l	#$00,d0
	move.b	(a4)+,d0
	lea.l	(L001ab6,pc),a0
	st.b	(a0,d0.w)
	cmp.w	#$0009,d0
	bcc	L001254
	st.b	($27,a5,d0.w)
L001254:
	rts

L001256:
	lea.l	(L001ab6,pc),a0
	tst.b	(a0,d7.w)
	beq	L001276
	clr.b	(a0,d7.w)
	cmp.w	#$0009,d7
	bcc	L00126e
	clr.b	($27,a5,d7.w)
L00126e:
	andi.b	#$f7,($0017,a6)
	rts

L001276:
	ori.b	#$08,($0017,a6)
	move.l	a4,(a6)
	addq.w	#4,a7
	rts

L001282:
	move.b	(a4)+,d2
	tst.b	($0018,a6)
	bmi	L001294
	move.b	d2,($0026,a5)
	moveq.l	#$0f,d1
	bra	L001452

L001294:
	lsl.b	#2,d2
	andi.b	#$03,($001c,a6)
	or.b	d2,($001c,a6)
	rts

L0012a2:
	ori.b	#$20,($0016,a6)
	moveq.l	#$00,d1
	move.b	(a4)+,d1
	bmi	L00131c
	move.w	d1,-(a7)
	andi.b	#$03,d1
	add.w	d1,d1
	move.w	(L00132e,pc,d1.w),d0
	lea.l	(L00132e,pc,d0.w),a0
	move.l	a0,($0026,a6)
	move.b	(a4)+,-(a7)
	move.w	(a7)+,d2
	move.b	(a4)+,d2
	move.w	d2,($003c,a6)
	cmp.b	#$02,d1
	beq	L0012dc
	lsr.w	#1,d2
	cmpi.b	#$06,d1
	bne	L0012dc
	moveq.l	#$01,d2
L0012dc:
	move.w	d2,($003a,a6)
	move.b	(a4)+,-(a7)
	move.w	(a7)+,d0
	move.b	(a4)+,d0
	ext.l	d0
	asl.l	#8,d0
	move.w	(a7)+,d1
	cmpi.b	#$04,d1
	bcs	L0012f8
	asl.l	#8,d0
	andi.b	#$03,d1
L0012f8:
	move.l	d0,($002e,a6)
	cmp.b	#$02,d1
	beq	L001304
	moveq.l	#$00,d0
L001304:
	move.l	d0,($002a,a6)
L001308:
	move.w	($003a,a6),($003e,a6)
	move.l	($002e,a6),($0032,a6)
	move.l	($002a,a6),($0036,a6)
	rts

L00131c:
	and.b	#$01,d1
	bne	L001308
	andi.b	#$df,($0016,a6)
	clr.l	($0036,a6)
	rts

L00132e:
	.dc.w	L000d96-L00132e
	.dc.w	L000dac-L00132e
	.dc.w	L000dc2-L00132e
	.dc.w	L000dd8-L00132e
L001336:
	ori.b	#$40,($0016,a6)
	moveq.l	#$00,d2
	move.b	(a4)+,d2
	bmi	L00138a
	add.w	d2,d2
	move.w	(L00139c,pc,d2.w),d0
	lea.l	(L00139c,pc,d0.w),a0
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
	bne	L00136c
	muls.w	d1,d0
L00136c:
	neg.w	d0
	bpl	L001372
	moveq.l	#$00,d0
L001372:
	move.w	d0,($0046,a6)
L001376:
	move.w	($004c,a6),($004e,a6)
	move.w	($0044,a6),($0048,a6)
	move.w	($0046,a6),($004a,a6)
	rts

L00138a:
	and.b	#$01,d2
	bne	L001376
	andi.b	#$bf,($0016,a6)
	clr.w	($004a,a6)
	rts

L00139c:
	.dc.w	L000df8-L00139c
	.dc.w	L000e10-L00139c
	.dc.w	L000e26-L00139c
	.dc.w	L000e3c-L00139c
L0013a4:
	move.b	(a4)+,d2
	bmi	L0013ea
	andi.b	#$fd,($0016,a6)
	bclr.l	#$06,d2
	beq	L0013ba
	ori.b	#$02,($0016,a6)
L0013ba:
	move.b	($09da),d0
	and.b	#$c0,d0
	or.b	d0,d2
	moveq.l	#$1b,d1
	bsr	L001452
	moveq.l	#$18,d1
	move.b	(a4)+,d2
	bsr	L001452
	moveq.l	#$19,d1
	move.b	(a4)+,d2
	bsr	L001452
	move.b	(a4)+,d2
	bsr	L001452
	move.b	(a4)+,d2
	move.b	d2,($0021,a6)
L0013e2:
	moveq.l	#$38,d1			;'8'
	add.b	($0018,a6),d1
	bra	L001452

L0013ea:
	and.b	#$01,d2
	beq	L0013e2
	move.b	($0021,a6),d2
	bra	L0013e2

L0013f6:
	move.b	(a4)+,($0024,a6)
	rts

L0013fc:
	movea.l	($0088),a0
	cmpa.l	#$00f00000,a0
	bcc	L001428
	cmpi.l	#$50434d38,(-$0008,a0)	;'PCM8'
	bne	L001428
	st.b	(-$0418,a5)
	move.w	#$01fe,d0
	trap	#2
	ori.w	#$fe00,(-$03f2,a5)
	ori.w	#$fe00,(-$0406,a5)
L001428:
	rts

L00142a:
	moveq.l	#$00,d0
	move.b	(a4)+,d0
	cmp.w	#$0002,d0
	bcc	L0011ce
	add.w	d0,d0
	move.w	(L001440,pc,d0.w),d0
	jmp	(L001440,pc,d0.w)

L001440:
	.dc.w	L0011ce-L001440
	.dc.w	L001444-L001440
L001444:
	moveq.l	#$00,d0
	move.b	(a4)+,d0
	move.w	d0,(-$03ee,a5)
	st.b	(-$03f5,a5)
	rts

L001452:
	ori.w	#$0300,sr
	tst.b	($00e90003)
	bmi	L001452
	move.b	d1,($00e90001)
	and.w	#$00ff,d1
	lea.l	(L001afc,pc),a2
	move.b	d2,(a2,d1.w)
	move.b	d2,($00e90003)
	andi.w	#$faff,sr
	cmp.b	#$1b,d1
	beq	L001482
	rts

L001482:
	move.b	d2,($09da)
	rts

L001488:
	clr.l	-(a7)
	DOS	_SUPER
	pea.l	(VersionString,pc)
	DOS	_PRINT
	lea.l	(L001ecc,pc),a5
	move.w	#$0001,(-$03fa,a5)
	clr.l	(-$0404,a5)
	move.l	($0008,a0),(-$065c,a5)
	move.l	#$00010000,($0014,a5)
	move.l	#$0004e000,($0018,a5)
	clr.b	($0024,a5)
	clr.b	($0025,a5)
	addq.w	#1,a2
	bsr	L00151e
	lea.l	(L001f28,pc),a4
	lea.l	(L001af4,pc),a1
	move.l	a4,(a1)
	adda.l	($0014,a5),a4
	move.l	a4,($0004,a1)
	adda.l	($0018,a5),a4
	cmpa.l	($0008,a0),a4
	bhi	L00163c
	move.l	($0090),(a5)
	move.l	($010c),($0004,a5)
	lea.l	(Trap4Handler,pc),a1
	move.l	a1,($0090)
	lea.l	(L000000,pc),a1
	suba.l	a1,a4
	clr.w	-(a7)
	move.l	a4,-(a7)
	DOS	_KEEPPR

L0014fe:
	movea.l	($0090),a4
	cmpa.l	#$00fe0000,a4
	bcc	L00151c
	subq.w	#8,a4
	lea.l	(L000004,pc),a3
	move.w	#$0004,d0
L001514:
	cmpm.b	(a3)+,(a4)+
	bne	L00151c
	dbra	d0,L001514
L00151c:
	rts

L00151e:
	move.b	(a2)+,d0
	bne	L00152a
	bsr	L0014fe
	beq	L001636
	rts

L00152a:
	cmp.b	#$20,d0			;' '
	beq	L00151e
	cmp.b	#$09,d0
	beq	L00151e
	cmp.b	#$2d,d0			;'-'
	beq	L001544
	cmp.b	#$2f,d0			;'/'
	bne	L001642
L001544:
	move.b	(a2)+,d0
	beq	L001642
	or.b	#$20,d0
	cmp.b	#$72,d0			;'r'
	bne	L0015a4
	bsr	L0014fe
	bne	L001630
	moveq.l	#$00,d0
	trap	#4
	tst.l	d0
	bne	L00159e
	move.b	(a2)+,d0
	or.b	#$20,d0
	cmp.b	#$72,d0			;'r'
	bne	L001592
	movea.l	($0088),a0
	cmpi.l	#$50434d38,(-$0008,a0)	;'PCM8'
	bne	L001592
	moveq.l	#$ff,d0
	trap	#2
	tst.l	d0
	bmi	L00158a
	pea.l	(PCM8ReleasedString,pc)
	bra	L00158e

L00158a:
	pea.l	(PCM8CouldNotReleaseString,pc)
L00158e:
	DOS	_PRINT
	addq.w	#4,a7
L001592:
	pea.l	(MXDRVReleasedString,pc)
L001596:
	DOS	_PRINT
	addq.w	#4,a7
	clr.w	-(a7)
	DOS	_EXIT2

L00159e:
	pea.l	(CouldNotReleaseString,pc)
	bra	L001596

L0015a4:
	bsr	L0014fe
	beq	L001636
	cmp.b	#$6d,d0			;'m'
	bne	L0015c4
	cmpi.b	#$3a,(a2)		;':'
	bne	L0015ba
	addq.w	#1,a2
L0015ba:
	bsr	L00160a
	move.l	d0,($0014,a5)
	bra	L00151e

L0015c4:
	cmp.b	#$70,d0			;'p'
	bne	L0015dc
	cmpi.b	#$3a,(a2)		;':'
	bne	L0015d2
	addq.w	#1,a2
L0015d2:
	bsr	L00160a
	move.l	d0,($0018,a5)
	bra	L00151e

L0015dc:
	cmpi.b	#$66,d0			;'f'
	bne	L001642
	cmpi.b	#$3a,(a2)		;':'
	bne	L0015ea
	addq.w	#1,a2
L0015ea:
	move.l	a2,-(a7)
	bsr	L00160a
	cmpa.l	(a7)+,a2
	beq	L0015fe
	lsr.l	#8,d0
	lsr.l	#2,d0
	andi.l	#$00007fff,d0
	bra	L001600

L0015fe:
	moveq.l	#$11,d0
L001600:
	move.w	d0,($00000824).l
	bra	L00151e

L00160a:
	moveq.l	#$00,d0
L00160c:
	moveq.l	#$00,d1
	move.b	(a2),d1
	sub.b	#$30,d1			;'0'
	bcs	L001626
	cmp.b	#$09,d1
	bhi	L001626
	mulu.w	#$000a,d0
	add.l	d1,d0
	addq.w	#1,a2
	bra	L00160c

L001626:
	tst.l	d0
	bmi	L001642
	moveq.l	#$0a,d1
	lsl.l	d1,d0
	rts

L001630:
	pea.l	(MXDRVNotLoadedString,pc)
	bra	L001646

L001636:
	pea.l	(MXDRVAlreadyLoadedString,pc)
	bra	L001646

L00163c:
	pea.l	(InsufficientMemoryString,pc)
	bra	L001646

L001642:
	pea.l	(HelpString,pc)
L001646:
	DOS	_PRINT
	move.w	#$ffff,-(a7)
	DOS	_EXIT2


	.data

EndPlayBytes:
	.dc.b	$7f,$f1,$00
VersionString:
	.dc.b	'X68k MXDRV music driver version 2.06+162/03 (c)1988-91 milk.,K.MAEKAWA, Missy.M, Yatsube, ゆ.',$0d,$0a,$00
HelpString:
	.dc.b	'使い方: mxdrv [switch]',$0d,$0a
	.dc.b	$09,'-m:<num> MMLバッファサイズ(Kbytes)           [省略時 64]',$0d,$0a
	.dc.b	$09,'-p:<num> PCMバッファサイズ(Kbytes)           [省略時312]',$0d,$0a
	.dc.b	$09,'-f:<num> FADEOUT SPEED (FAST 0 - 32767 SLOW) [省略時 23]',$0d,$0a
	.dc.b	$09,'-r       mxdrv解除',$0d,$0a
	.dc.b	$09,'-rr      mxdrv/pcm8解除',$0d,$0a,$00
InsufficientMemoryString:
	.dc.b	$09,'メモリが不足しています',$0d,$0a,$00
MXDRVReleasedString:
	.dc.b	$09,'mxdrvを解除しました',$0d,$0a,$00
MXDRVAlreadyLoadedString:
	.dc.b	$09,'mxdrvはすでに組み込まれています',$0d,$0a,$00
MXDRVNotLoadedString:
	.dc.b	$09,'mxdrvは組み込まれていません',$0d,$0a,$00
CouldNotReleaseString:
	.dc.b	$09,'mxdrvを解除出来ませんでした',$0d,$0a,$00
PCM8ReleasedString:
	.dc.b	$09,'pcm8を解除しました',$0d,$0a,$00
PCM8CouldNotReleaseString:
	.dc.b	$09,'pcm8の解除を拒否されました',$0d,$0a,$00

	.bss

L001870:
	.ds.b	4
L001874:
	.ds.b	16
L001884:
	.ds.b	562
L001ab6:
	.ds.b	16
L001ac6:
	.ds.w	1
L001ac8:
	.ds.b	4
L001acc:
	.ds.b	2
L001ace:
	.ds.b	6
L001ad4:
	.ds.b	3
L001ad7:
	.ds.b	2
L001ad9:
	.ds.b	1
L001ada:
	.ds.w	1
L001adc:
	.ds.w	1
L001ade:
	.ds.b	6
L001ae4:
	.ds.l	1
L001ae8:
	.ds.l	1
L001aec:
	.ds.l	1
L001af0:
	.ds.l	1
L001af4:
	.ds.l	1
L001af8:
	.ds.l	1
L001afc:
	.ds.b	256
L001bfc:
	.ds.b	720
L001ecc:
	.ds.b	48
L001efc:
	.ds.b	12
L001f08:
	.ds.b	32
L001f28:

	.end	L001488
