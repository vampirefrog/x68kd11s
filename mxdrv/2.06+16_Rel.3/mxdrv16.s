;=============================================
;  Filename mxdrv/2.06+16_Rel.3/mxdrv16.x
;
;
;  Base address 000000
;  Exec address 001356
;  Text size    0016bc byte(s)
;  Data size    000000 byte(s)
;  Bss  size    000698 byte(s)
;  352 Labels
;
;  Commandline dis  -b2 -h -m68000 --sp -q1 -B -M -o120 -gmxdrv/2.06+16_Rel.3/mxdrv16.lab --overwrite mxdrv/2.06+16_Rel.3/mxdrv16.x mxdrv/2.06+16_Rel.3/mxdrv16.s
;          DIS version 3.16
;=============================================

	.include	inc/doscall.mac
	.include	inc/iocscall.mac
	.include	inc/fefunc.mac

	.cpu	68000

	.text

L000000:
	.dc.b	'EX16'
L000004:
	.dc.b	'mxdrv206'
Trap4Handler:
	movem.l	d1-d7/a0-a6,-(sp)
	lea.l	(L001d18,pc),a5
	and.w	#$001f,d0
	add.w	d0,d0
	move.w	(MXDRVCallTable,pc,d0.w),d0
	jsr	(MXDRVCallTable,pc,d0.w)
L000022:
	movem.l	(sp)+,d1-d7/a0-a6
	rte

MXDRVCallTable:
	.dc.w	L0002b2-MXDRVCallTable
	.dc.w	L000624-MXDRVCallTable
	.dc.w	L0002cc-MXDRVCallTable
	.dc.w	L0002ee-MXDRVCallTable
	.dc.w	L00049a-MXDRVCallTable
	.dc.w	L00034e-MXDRVCallTable
	.dc.w	L0003c6-MXDRVCallTable
	.dc.w	L000406-MXDRVCallTable
	.dc.w	L000628-MXDRVCallTable
	.dc.w	L000646-MXDRVCallTable
	.dc.w	L000068-MXDRVCallTable
	.dc.w	L00006e-MXDRVCallTable
	.dc.w	L000074-MXDRVCallTable
	.dc.w	L000204-MXDRVCallTable
	.dc.w	L00007e-MXDRVCallTable
	.dc.w	L0004a0-MXDRVCallTable
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
	lea.l	(L001948,pc),a0
	move.l	a0,d0
	rts

L00008c:
	lea.l	(L00191a,pc),a0
	tst.l	d1
	bmi.s	L000098
	move.b	d1,(a0)
	rts

L000098:
	move.b	(a0),d0
	rts

L00009c:
	move.b	(-$03fa,a5),-(sp)
	move.w	(sp)+,d0
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
	bsr.w	L00034e
	rts

L0000d2:
	move.b	(-$0404,a5),d0
	beq.w	L0001e8
	movem.l	d1-d7/a0-a6,-(sp)
	st.b	($0039,a5)
	lea.l	(L00192a,pc),a0
	lea.l	(L001923,pc),a1
	tst.b	(a1)
	beq.w	L000172
	bpl.s	L0000fa
	move.b	#$7f,(a1)
	move.w	(a0),($0002,a0)
L0000fa:
	tst.w	($0002,a0)
	bmi.s	L000106
	subq.w	#2,($0002,a0)
	bra.s	L000172

L000106:
	lea.l	(L001920,pc),a1
	cmpi.b	#$0a,(a1)
	bge.s	L00011e
L000110:
	cmpi.b	#$3e,(a1)		;'>'
	bge.s	L000124
	addq.b	#1,(a1)
	move.w	(a0),($0002,a0)
	bra.s	L000172

L00011e:
	st.b	(-$03f7,a5)
	bra.s	L000110

L000124:
	tst.b	(-$03f4,a5)
	beq.s	L000132
	bsr.w	L00045e
	bra.w	L0001d0

L000132:
	move.b	#$7f,(a1)
	clr.b	(-$03f5,a5)
	move.b	#$01,(-$03f9,a5)
	bsr.w	L0003c6
	movea.l	($0088),a0
	move.l	(-$0008,a0),d0
	cmp.l	#$50434d34,d0		;'PCM4'
	beq.s	L00015c
	cmp.l	#$50434d38,d0		;'PCM8'
	bne.s	L000162
L00015c:
	move.w	#$0100,d0
	trap	#2
L000162:
	tst.b	(-$0418,a5)
	beq.s	L000172
	move.w	#$01ff,d0
	trap	#2
	clr.b	(-$0418,a5)
L000172:
	lea.l	(L001918,pc),a0
	move.b	(a0),d2
	moveq.l	#$12,d1
	tst.b	(-$03f9,a5)
	bne.s	L0001d0
	lea.l	(L001a48,pc),a6
	moveq.l	#$00,d7
L000186:
	bsr.w	L000cd0
	bsr.w	L000e34
	move.w	(L001928,pc),d0
	btst.l	d7,d0
	bne.s	L00019a
	bsr.w	L00090c
L00019a:
	lea.l	($0050,a6),a6
	addq.w	#1,d7
	cmp.w	#$0009,d7
	bcs.s	L000186
	tst.b	(-$0418,a5)
	beq.s	L0001d0
	lea.l	(L0016d0,pc),a6
L0001b0:
	bsr.w	L000cd0
	bsr.w	L000e34
	move.w	(L001928,pc),d0
	btst.l	d7,d0
	bne.s	L0001c4
	bsr.w	L00090c
L0001c4:
	lea.l	($0050,a6),a6
	addq.w	#1,d7
	cmp.w	#$0010,d7
	bcs.s	L0001b0
L0001d0:
	tst.b	($00e90003)
	bmi.s	L0001d0
	move.b	#$1b,($00e90001)
	clr.b	($0039,a5)
	movem.l	(sp)+,d1-d7/a0-a6
L0001e8:
	move.b	(-$03fa,a5),-(sp)
	move.w	(sp)+,d0
	move.b	(-$03f9,a5),d0
	rts

L0001f4:
	lea.l	(L0016d0,pc),a0
	move.l	a0,d0
	rts

L0001fc:
	lea.l	(L0016c0,pc),a0
	move.l	a0,d0
	rts

L000204:
	cmp.b	#$f0,d1
	beq.s	L00026a
	cmp.b	#$fc,d1
	beq.s	L000246
	tst.l	d1
	bmi.s	L00024c
	tst.b	(-$03f4,a5)
	bne.w	L000624
	move.l	a2,(-$03dc,a5)
	move.l	a1,(-$03e8,a5)
	move.l	a1,(-$03e4,a5)
L000228:
	tst.w	(a1)
	beq.s	L000230
	addq.w	#6,a1
	bra.s	L000228

L000230:
	subq.w	#6,a1
	move.l	a1,(-$03e0,a5)
	st.b	(-$03f4,a5)
	st.b	(-$03f3,a5)
	movea.l	(L001930,pc),a0
	bra.w	L00046c

L000246:
	move.b	(L001925,pc),d0
	rts

L00024c:
	clr.b	(-$03f4,a5)
	clr.b	($0024,a5)
	clr.b	($0025,a5)
	movea.l	(L001940,pc),a0
	move.l	(a0),($000c,a5)
	move.l	($0004,a0),($0010,a5)
	bra.w	L000356

L00026a:
	bsr.s	L00024c
L00026c:
	movea.l	(L00193c,pc),a0
	pea.l	(a0)
	DOS	_MFREE
	addq.w	#4,sp
	moveq.l	#$00,d0
	move.l	d0,(-$03dc,a5)
	move.b	d0,(-$03f3,a5)
	rts

L000282:
	move.w	sr,-(sp)
	ori.w	#$0700,sr
	clr.b	(-$03f9,a5)
	tst.b	(-$0404,a5)
	bne.s	L0002ae
	lea.l	(L000668,pc),a1
	suba.l	a0,a0
	move.l	a1,($010c,a0)
	movea.l	#$00e88000,a0
	ori.b	#$08,($0009,a0)
	ori.b	#$08,($0015,a0)
L0002ae:
	move.w	(sp)+,sr
	rts

L0002b2:
	bsr.w	L000356
	move.l	(a5),($0090,a0)
	pea.l	(L000000-$0000f0,pc)
	DOS	_MFREE
	addq.w	#4,sp
	tst.b	(-$03f3,a5)
	beq.s	L0002ca
	bra.s	L00026c

L0002ca:
	rts

L0002cc:
	tst.b	(-$03f4,a5)
	beq.s	L0002dc
	movem.l	d1/a1,-(sp)
	bsr.s	L00026a
	movem.l	(sp)+,d1/a1
L0002dc:
	lea.l	($0024,a5),a2
	movea.l	(L001940,pc),a0
	move.l	a0,($000c,a5)
	move.l	($0014,a5),d0
	bra.s	L000310

L0002ee:
	tst.b	(-$03f4,a5)
	beq.s	L000300
	movem.l	d1/a1,-(sp)
	bsr.w	L00026a
	movem.l	(sp)+,d1/a1
L000300:
	lea.l	($0025,a5),a2
	movea.l	(L001944,pc),a0
	move.l	a0,($0010,a5)
	move.l	($0018,a5),d0
L000310:
	cmp.l	d1,d0
	bcs.s	L000348
	movem.l	d1/a0-a2,-(sp)
	bsr.s	L000356
	movem.l	(sp)+,d1/a0-a2
	move.w	d1,d0
	andi.w	#$0003,d0
	lsr.l	#2,d1
	swap.w	d1
L000328:
	swap.w	d1
L00032a:
	move.l	(a1)+,(a0)+
	dbra.w	d1,L00032a
	swap.w	d1
	dbra.w	d1,L000328
	tst.w	d0
	beq.s	L000342
	subq.w	#1,d0
L00033c:
	move.b	(a1)+,(a0)+
	dbra.w	d0,L00033c
L000342:
	st.b	(a2)
	moveq.l	#$00,d0
	rts

L000348:
	bset.l	#$1f,d0
	rts

L00034e:
	tst.b	(-$03f4,a5)
	bne.w	L00026a
L000356:
	move.b	#$01,(-$03f9,a5)
	move.w	sr,-(sp)
	ori.w	#$0700,sr
	bsr.s	L0003ca
	moveq.l	#$67,d0			;'g'
	moveq.l	#$01,d1
	trap	#15
	moveq.l	#$67,d0			;'g'
	moveq.l	#$00,d1
	trap	#15
	tst.b	(-$0418,a5)
	beq.s	L000380
	move.w	#$01ff,d0
	trap	#2
	clr.b	(-$0418,a5)
L000380:
	moveq.l	#$0f,d2
	moveq.l	#$e0,d1
L000384:
	bsr.w	L001320
	addq.b	#1,d1
	bne.s	L000384
	lea.l	(L001d48,pc),a0
	lea.l	(L0016c0,pc),a1
	moveq.l	#$07,d3
	moveq.l	#$00,d2
	moveq.l	#$08,d1
L00039a:
	bsr.w	L001320
	move.b	d2,(a0)+
	move.b	d2,(a1)+
	addq.b	#1,d2
	dbra.w	d3,L00039a
	movea.l	#$00e88000,a0
	andi.b	#$f7,($0009,a0)
	andi.b	#$f7,($0015,a0)
	suba.l	a0,a0
	move.l	($0004,a5),($010c,a0)
	move.w	(sp)+,sr
	rts

L0003c6:
	st.b	(-$03fa,a5)
L0003ca:
	moveq.l	#$07,d7
	lea.l	(L001a48,pc),a6
L0003d0:
	moveq.l	#$7f,d0
	bsr.w	L000ace
	lea.l	($0050,a6),a6
	dbra.w	d7,L0003d0
	movea.l	($0088),a0
	move.l	(-$0008,a0),d0
	cmp.l	#$50434d34,d0		;'PCM4'
	beq.s	L0003f6
	cmp.l	#$50434d38,d0		;'PCM8'
	bne.s	L0003fe
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
	lea.l	(L001a48,pc),a6
L000410:
	bsr.w	L000aa4
	lea.l	($0050,a6),a6
	dbra.w	d7,L000410
	movea.l	($0088),a0
	move.l	(-$0008,a0),d0
	cmp.l	#$50434d34,d0		;'PCM4'
	beq.s	L000434
	cmp.l	#$50434d38,d0		;'PCM8'
	bne.s	L00043a
L000434:
	move.w	#$0102,d0
	trap	#2
L00043a:
	moveq.l	#$30,d2			;'0'
	move.b	(L001914,pc),d1
	bne.s	L000444
	moveq.l	#$3a,d2			;':'
L000444:
	moveq.l	#$14,d1
	bra.w	L001320

L00044a:
	movea.l	(L001934,pc),a0
	movea.l	(L001930,pc),a1
	subq.w	#6,a0
	cmpa.l	a1,a0
	bcc.s	L00046c
	movea.l	(L001938,pc),a0
	bra.s	L00046c

L00045e:
	movea.l	(L001934,pc),a0
	addq.w	#6,a0
	tst.w	(a0)
	bne.s	L00046c
	movea.l	(L001930,pc),a0
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
	bra.s	L0004a4

L00049a:
	clr.w	(-$03f0,a5)
	bra.s	L0004a4

L0004a0:
	move.w	d1,(-$03f0,a5)
L0004a4:
	clr.b	(-$03f8,a5)
	clr.b	(-$03f7,a5)
	clr.b	(-$03f5,a5)
	clr.b	(-$03f9,a5)
	tst.b	(-$03fa,a5)
	beq.s	L0004d8
	movea.l	($0088),a0
	move.l	(-$0008,a0),d0
	cmp.l	#$50434d34,d0		;'PCM4'
	beq.s	L0004d2
	cmp.l	#$50434d38,d0		;'PCM8'
	bne.s	L0004d8
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
	beq.w	L000624
	bsr.w	L000356
	movea.l	($000c,a5),a2
	move.w	($0002,a2),d1
	bmi.s	L000528
	tst.b	($0025,a5)
	beq.w	L000624
	movea.l	($0010,a5),a0
	bra.s	L00051c

L000514:
	tst.l	(a0)
	beq.w	L000624
	adda.l	(a0),a0
L00051c:
	dbra.w	d1,L000514
	adda.w	($0004,a0),a0
	move.l	a0,($0020,a5)
L000528:
	adda.w	($0004,a2),a2
	movea.l	a2,a1
	movea.l	a2,a0
	adda.w	(a1)+,a2
	move.l	a2,($001c,a5)
	lea.l	(L001a48,pc),a6
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
	bcc.s	L0005ac
	moveq.l	#$38,d1			;'8'
	add.b	d7,d1
	moveq.l	#$00,d2
	bsr.w	L001320
	addq.w	#1,d7
	lea.l	($0050,a6),a6
	bra.s	L000542

L0005ac:
	move.b	#$10,($001c,a6)
	move.b	#$08,($0022,a6)
	st.b	($0018,a6)
	clr.b	($0004,a6)
	cmp.w	#$000f,d7
	beq.s	L0005dc
	addq.w	#1,d7
	lea.l	($0050,a6),a6
	cmp.w	#$0009,d7
	bne.w	L000542
	lea.l	(L0016d0,pc),a6
	bra.w	L000542

L0005dc:
	lea.l	(-$0416,a5),a0
	moveq.l	#$0f,d0
L0005e2:
	clr.b	(a0)+
	dbra.w	d0,L0005e2
	clr.b	($0026,a5)
	moveq.l	#$00,d2
	moveq.l	#$01,d1
	bsr.w	L001320
	moveq.l	#$0f,d1
	bsr.w	L001320
	moveq.l	#$19,d1
	bsr.w	L001320
	moveq.l	#$80,d2
	bsr.w	L001320
	moveq.l	#$c8,d2
	moveq.l	#$12,d1
	move.b	d2,(-$0400,a5)
	tst.b	(-$0404,a5)
	bne.s	L000618
	bsr.w	L001320
L000618:
	bsr.w	L000282
	bsr.w	L00043a
	moveq.l	#$00,d0
	rts

L000624:
	moveq.l	#$ff,d0
L000626:
	rts

L000628:
	tst.b	($0024,a5)
	beq.s	L000664
	movea.l	($000c,a5),a0
	bra.s	L00063a

L000634:
	tst.w	(a0)
	beq.s	L000664
	adda.w	(a0),a0
L00063a:
	dbra.w	d1,L000634
	adda.w	($0006,a0),a0
	move.l	a0,d0
	rts

L000646:
	tst.b	($0025,a5)
	beq.s	L000664
	movea.l	($0010,a5),a0
	bra.s	L000658

L000652:
	tst.l	(a0)
	beq.s	L000664
	adda.l	(a0),a0
L000658:
	dbra.w	d1,L000652
	adda.w	($0006,a0),a0
	move.l	a0,d0
	rts

L000664:
	moveq.l	#$00,d0
	rts

L000668:
	andi.b	#$f7,($00e88015)
	move.l	a6,-(sp)
	movea.l	($0006,sp),a6
	cmpa.l	($01a8),a6
	bne.s	L00068a
	pea.l	(L000684,pc)
	move.w	sr,-(sp)
	jmp	(a6)

L000684:
	movea.l	(sp)+,a6
	addq.w	#6,sp
	move.l	a6,-(sp)
L00068a:
	andi.w	#$faff,sr
	movem.l	d0-d7/a0-a5,-(sp)
	lea.l	(L001d18,pc),a5
	st.b	($0039,a5)
	tst.b	(-$03fa,a5)
	bne.w	L000732
	lea.l	(L00192a,pc),a0
	lea.l	(L001923,pc),a1
	tst.b	(a1)
	beq.w	L000732
	bpl.s	L0006ba
	move.b	#$7f,(a1)
	move.w	(a0),($0002,a0)
L0006ba:
	tst.w	($0002,a0)
	bmi.s	L0006c6
	subq.w	#2,($0002,a0)
	bra.s	L000732

L0006c6:
	lea.l	(L001920,pc),a1
	cmpi.b	#$0a,(a1)
	bge.s	L0006de
L0006d0:
	cmpi.b	#$3e,(a1)		;'>'
	bge.s	L0006e4
	addq.b	#1,(a1)
	move.w	(a0),($0002,a0)
	bra.s	L000732

L0006de:
	st.b	(-$03f7,a5)
	bra.s	L0006d0

L0006e4:
	tst.b	(-$03f4,a5)
	beq.s	L0006f2
	bsr.w	L00045e
	bra.w	L0008e6

L0006f2:
	move.b	#$7f,(a1)
	clr.b	(-$03f5,a5)
	move.b	#$01,(-$03f9,a5)
	bsr.w	L0003c6
	movea.l	($0088),a0
	move.l	(-$0008,a0),d0
	cmp.l	#$50434d34,d0		;'PCM4'
	beq.s	L00071c
	cmp.l	#$50434d38,d0		;'PCM8'
	bne.s	L000722
L00071c:
	move.w	#$0100,d0
	trap	#2
L000722:
	tst.b	(-$0418,a5)
	beq.s	L000732
	move.w	#$01ff,d0
	trap	#2
	clr.b	(-$0418,a5)
L000732:
	lea.l	(L001918,pc),a0
	move.b	(a0),d2
	moveq.l	#$12,d1
	tst.b	(-$0402,a5)
	bne.w	L00087a
	move.b	($080e),d7
	and.b	#$0f,d7
	cmp.b	#$05,d7
	beq.w	L0007e2
	cmp.b	#$09,d7
	beq.s	L0007d6
	cmp.b	#$06,d7
	beq.s	L0007d0
	cmp.b	#$0a,d7
	beq.s	L0007c8
	cmp.b	#$04,d7
	beq.w	L000816
	cmp.b	#$08,d7
	beq.s	L0007ec
	cmp.b	#$02,d7
	bne.w	L00087a
	move.b	($080b),d7
	and.b	#$03,d7
	cmpi.b	#$80,($080a)
	beq.s	L0007b8
	cmp.b	#$02,d7
	beq.s	L0007a8
	cmp.b	#$01,d7
	bne.w	L00087a
	tst.b	(-$03fc,a5)
	bne.w	L000874
	subq.b	#1,($0002,a0)
	bra.w	L000874

L0007a8:
	tst.b	(-$03fc,a5)
	bne.w	L000874
	addq.b	#1,($0002,a0)
	bra.w	L000874

L0007b8:
	tst.b	(-$03fc,a5)
	bne.w	L000874
	clr.b	($0002,a0)
	bra.w	L000874

L0007c8:
	move.b	#$ff,d2
	bra.w	L000882

L0007d0:
	moveq.l	#$00,d2
	bra.w	L000882

L0007d6:
	neg.b	d2
	lsr.b	#2,d2
	addq.b	#1,d2
	neg.b	d2
	bra.w	L000882

L0007e2:
	neg.b	d2
	add.b	d2,d2
	neg.b	d2
	bra.w	L000882

L0007ec:
	btst.b	#$01,($080b)
	beq.w	L00087a
	tst.b	(-$03fa,a5)
	beq.s	L00080a
	bpl.s	L000868
	tst.b	(-$03fc,a5)
	bne.s	L000874
	bsr.w	L000406
	bra.s	L000868

L00080a:
	tst.b	(-$03fc,a5)
	bne.s	L000874
	bsr.w	L0003c6
	bra.s	L000868

L000816:
	move.b	($080b),d7
	beq.s	L00082c
	and.b	#$03,d7
	cmp.b	#$02,d7
	beq.s	L000858
	cmp.b	#$01,d7
	beq.s	L000846
L00082c:
	cmpi.b	#$80,($080a)
	bne.s	L00087a
	tst.b	(-$03fc,a5)
	bne.s	L000874
	move.w	#$0011,(-$03ee,a5)
	st.b	(-$03f5,a5)
	bra.s	L000874

L000846:
	tst.b	(-$03fc,a5)
	bne.s	L000874
	tst.b	(-$03f4,a5)
	beq.s	L00086e
	bsr.w	L00044a
	bra.s	L000868

L000858:
	tst.b	(-$03fc,a5)
	bne.s	L000874
	tst.b	(-$03f4,a5)
	beq.s	L00086e
	bsr.w	L00045e
L000868:
	st.b	(-$03fc,a5)
	bra.s	L0008e6

L00086e:
	bsr.w	L00049a
	bra.s	L000868

L000874:
	st.b	(-$03fc,a5)
	bra.s	L00087e

L00087a:
	clr.b	(-$03fc,a5)
L00087e:
	add.b	($0002,a0),d2
L000882:
	tst.b	(-$03fa,a5)
	bne.s	L00088e
	tst.b	(-$03f9,a5)
	beq.s	L000896
L00088e:
	moveq.l	#$00,d2
	bsr.w	L001320
	bra.s	L0008e6

L000896:
	bsr.w	L001320
	lea.l	(L001a48,pc),a6
	moveq.l	#$00,d7
L0008a0:
	bsr.w	L000cd0
	bsr.w	L000e34
	move.w	(L001928,pc),d0
	btst.l	d7,d0
	bne.s	L0008b2
	bsr.s	L00090c
L0008b2:
	lea.l	($0050,a6),a6
	addq.w	#1,d7
	cmp.w	#$0009,d7
	bcs.s	L0008a0
	tst.b	(-$0418,a5)
	beq.s	L0008e6
	lea.l	(L0016d0,pc),a6
L0008c8:
	bsr.w	L000cd0
	bsr.w	L000e34
	move.w	(L001928,pc),d0
	btst.l	d7,d0
	bne.s	L0008da
	bsr.s	L00090c
L0008da:
	lea.l	($0050,a6),a6
	addq.w	#1,d7
	cmp.w	#$0010,d7
	bcs.s	L0008c8
L0008e6:
	bsr.w	L00043a
L0008ea:
	tst.b	($00e90003)
	bmi.s	L0008ea
	move.b	#$1b,($00e90001)
	clr.b	($0039,a5)
	movem.l	(sp)+,d0-d7/a0-a6
	ori.b	#$08,($00e88015)
	rte

L00090c:
	btst.b	#$00,($0016,a6)
	beq.s	L000974
	tst.b	($0020,a6)
	bne.s	L000970
	tst.b	($0018,a6)
	bmi.s	L000964
	bsr.w	L000a2a
	bsr.w	L000b10
	btst.b	#$03,($0016,a6)
	bne.s	L00095a
	move.b	($0024,a6),($0025,a6)
	beq.s	L000944
	clr.l	($0036,a6)
	clr.w	($004a,a6)
	bsr.w	L000d14
L000944:
	btst.b	#$01,($0016,a6)
	beq.s	L00095a
	moveq.l	#$01,d1
	moveq.l	#$02,d2
	bsr.w	L001320
	moveq.l	#$00,d2
	bsr.w	L001320
L00095a:
	clr.l	($000c,a6)
	bsr.s	L000982
	bsr.w	L000aa4
L000964:
	bsr.w	L000b28
	andi.b	#$fe,($0016,a6)
	rts

L000970:
	subq.b	#1,($0020,a6)
L000974:
	tst.b	($0018,a6)
	bmi.s	L000980
	bsr.s	L000982
	bsr.w	L000aa4
L000980:
	rts

L000982:
	move.w	($0012,a6),d2
	add.w	($000c,a6),d2
	add.w	($0036,a6),d2
	cmp.w	($0014,a6),d2
	beq.s	L0009c8
	move.w	d2,($0014,a6)
	move.w	#$17ff,d1
	cmp.w	d1,d2
	bls.s	L0009aa
	tst.w	d2
	bpl.s	L0009a8
	moveq.l	#$00,d2
	bra.s	L0009aa

L0009a8:
	move.w	d1,d2
L0009aa:
	add.w	d2,d2
	add.w	d2,d2
	moveq.l	#$30,d1			;'0'
	add.b	($0018,a6),d1
	bsr.w	L001320
	subq.b	#8,d1
	move.w	d2,-(sp)
	moveq.l	#$00,d2
	move.b	(sp)+,d2
	move.b	(OPMNoteTable,pc,d2.w),d2
	bsr.w	L001320
L0009c8:
	rts

OPMNoteTable:
	.dc.b	$00,$01,$02,$04,$05,$06,$08,$09
	.dc.b	$0a,$0c,$0d,$0e,$10,$11,$12,$14
	.dc.b	$15,$16,$18,$19,$1a,$1c,$1d,$1e
	.dc.b	$20,$21,$22,$24,$25,$26,$28,$29
	.dc.b	$2a,$2c,$2d,$2e,$30,$31,$32,$34
	.dc.b	$35,$36,$38,$39,$3a,$3c,$3d,$3e
	.dc.b	$40,$41,$42,$44,$45,$46,$48,$49
	.dc.b	$4a,$4c,$4d,$4e,$50,$51,$52,$54
	.dc.b	$55,$56,$58,$59,$5a,$5c,$5d,$5e
	.dc.b	$60,$61,$62,$64,$65,$66,$68,$69
	.dc.b	$6a,$6c,$6d,$6e,$70,$71,$72,$74
	.dc.b	$75,$76,$78,$79,$7a,$7c,$7d,$7e
L000a2a:
	bclr.b	#$01,($0017,a6)
	beq.s	L000a9a
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
L000a62:
	move.b	(a0)+,d2
	bsr.w	L001320
	addq.b	#8,d1
	dbra.w	d0,L000a62
	moveq.l	#$03,d0
L000a70:
	move.b	(a0)+,d2
	lsr.b	#1,d3
	bcc.s	L000a78
	moveq.l	#$7f,d2
L000a78:
	bsr.w	L001320
	addq.b	#8,d1
	dbra.w	d0,L000a70
	moveq.l	#$0f,d0
L000a84:
	move.b	(a0)+,d2
	bsr.w	L001320
	addq.b	#8,d1
	dbra.w	d0,L000a84
	st.b	($0023,a6)
	ori.b	#$64,($0017,a6)
L000a9a:
	rts

CarrierSlot:
	.dc.b	$08,$08,$08,$08,$0c,$0e,$0e,$0f
L000aa4:
	moveq.l	#$00,d0
	move.b	($0022,a6),d0
	bclr.l	#$07,d0
	bne.s	L000ab4
	move.b	(VolumeTable,pc,d0.w),d0
L000ab4:
	add.b	(L001920,pc),d0
	bcs.s	L000abc
	bpl.s	L000abe
L000abc:
	moveq.l	#$7f,d0
L000abe:
	add.b	($004a,a6),d0
	bcs.s	L000ac6
	bpl.s	L000ac8
L000ac6:
	moveq.l	#$7f,d0
L000ac8:
	cmp.b	($0023,a6),d0
	beq.s	L000afe
L000ace:
	move.b	d0,($0023,a6)
	movea.l	($0004,a6),a0
	addq.w	#6,a0
	move.b	($0019,a6),d3
	move.b	#$60,d1			;'`'
	add.b	($0018,a6),d1
	moveq.l	#$03,d4
L000ae6:
	move.b	(a0)+,d2
	lsr.b	#1,d3
	bcc.s	L000af8
	add.b	d0,d2
	bpl.s	L000af4
	move.b	#$7f,d2
L000af4:
	bsr.w	L001320
L000af8:
	addq.b	#8,d1
	dbra.w	d4,L000ae6
L000afe:
	rts

VolumeTable:
	.dc.b	$2a,$28,$25,$22,$20,$1d,$1a,$18
	.dc.b	$15,$12,$10,$0d,$0a,$08,$05,$02
L000b10:
	bclr.b	#$02,($0017,a6)
	beq.s	L000b26
	move.b	($001c,a6),d2
	moveq.l	#$20,d1			;' '
	add.b	($0018,a6),d1
	bra.w	L001320

L000b26:
	rts

L000b28:
	bset.b	#$03,($0016,a6)
	bne.s	L000b26
	tst.b	($0018,a6)
	bmi.s	L000b52
	move.b	($001d,a6),d2
	lea.l	(L001d48,pc),a2
	move.b	d2,(a2,d7.w)
	lea.l	(L0016c0,pc),a2
	move.b	d2,(a2,d7.w)
	move.b	#$08,d1
	bra.w	L001320

L000b52:
	move.b	($0025,a5),d0
	beq.s	L000bc6
	tst.b	(-$0403,a5)
	bne.s	L000bc6
	moveq.l	#$00,d0
	move.w	($0012,a6),d0
	lsr.w	#6,d0
	move.b	($001c,a6),d2
	move.b	d2,d1
	and.w	#$0003,d1
	beq.s	L000b78
	cmp.w	#$0003,d1
	bne.s	L000b7c
L000b78:
	eori.w	#$0003,d1
L000b7c:
	and.w	#$001c,d2
	lsl.w	#6,d2
	or.w	d1,d2
	tst.b	(-$0418,a5)
	bne.s	L000bc8
	tst.b	(-$03f7,a5)
	beq.s	L000b94
	andi.b	#$fc,d2
L000b94:
	lsl.w	#3,d0
	movea.l	($0020,a5),a1
	lea.l	(a1,d0.w),a0
	adda.l	(a0)+,a1
	addq.w	#2,a0
	move.w	(a0)+,d3
	beq.s	L000bc6
	moveq.l	#$67,d0			;'g'
	moveq.l	#$00,d1
	trap	#15
	moveq.l	#$60,d0			;'`'
	move.w	d2,d1
	moveq.l	#$00,d2
	move.w	d3,d2
	trap	#15
	lea.l	(L001d48,pc),a2
	clr.b	(a2,d7.w)
	lea.l	(L0016c0,pc),a2
	clr.b	(a2,d7.w)
L000bc6:
	rts

L000bc8:
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
	beq.s	L000bc6
	adda.l	(a0),a1
	lea.l	(L001d54,pc),a0
	cmpa.l	a0,a1
	bcs.s	L000c50
	move.l	a1,d0
	add.l	d3,d0
	bcs.s	L000c50
	cmp.l	(-$065c,a5),d0
	bcc.s	L000c50
	move.w	d7,d0
	subq.w	#8,d0
	moveq.l	#$00,d1
	move.b	($0022,a6),d1
	bclr.l	#$07,d1
	bne.s	L000c14
	lea.l	(VolumeTable,pc),a2
	move.b	(a2,d1.w),d1
L000c14:
	add.b	(L001920,pc),d1
	bmi.s	L000c20
	cmp.b	#$2b,d1			;'+'
	bcs.s	L000c26
L000c20:
	moveq.l	#$00,d1
	clr.b	d2
	bra.s	L000c2a

L000c26:
	move.b	(PCMVolumeTable,pc,d1.w),d1
L000c2a:
	swap.w	d1
	move.w	d2,d1
	moveq.l	#$00,d2
	trap	#2
	move.w	d7,d0
	subq.w	#8,d0
	move.l	d3,d2
	andi.l	#$00ffffff,d2
	trap	#2
	lea.l	(L001d48,pc),a2
	clr.b	($0008,a2)
	lea.l	(L0016c0,pc),a2
	clr.b	(a2,d7.w)
L000c50:
	rts

PCMVolumeTable:
	.dc.b	$0f,$0f,$0f,$0e,$0e,$0e,$0d,$0d
	.dc.b	$0d,$0c,$0c,$0b,$0b,$0b,$0a,$0a
	.dc.b	$0a,$09,$09,$08,$08,$08,$07,$07
	.dc.b	$07,$06,$06,$05,$05,$05,$04,$04
	.dc.b	$04,$03,$03,$02,$02,$02,$01,$01
	.dc.b	$01,$00,$00,$ff
L000c7e:
	bclr.b	#$03,($0016,a6)
	beq.s	L000cc6
	move.b	($0018,a6),d2
	bmi.s	L000ca2
	moveq.l	#$08,d1
	lea.l	(L001d48,pc),a2
	move.b	d2,(a2,d7.w)
	lea.l	(L0016c0,pc),a2
	move.b	d2,(a2,d7.w)
	bra.w	L001320

L000ca2:
	move.b	($0025,a5),d0
	beq.s	L000cc6
	tst.b	(-$0403,a5)
	bne.s	L000cc6
	tst.b	(-$0418,a5)
	beq.s	L000cc8
	move.w	d7,d0
	subq.w	#8,d0
	moveq.l	#$00,d1
	move.b	($0022,a6),d1
	swap.w	d1
	move.w	d2,d1
	moveq.l	#$00,d2
	trap	#2
L000cc6:
	rts

L000cc8:
	moveq.l	#$67,d0			;'g'
	moveq.l	#$00,d1
	trap	#15
	rts

L000cd0:
	tst.b	($0018,a6)
	bmi.s	L000d12
	tst.b	($0016,a6)
	bpl.s	L000cea
	tst.b	($0020,a6)
	bne.s	L000cea
	move.l	($0008,a6),d0
	add.l	d0,($000c,a6)
L000cea:
	tst.b	($0024,a6)
	beq.s	L000cfc
	tst.b	($0020,a6)
	bne.s	L000d12
	tst.b	($0025,a6)
	bne.s	L000d14
L000cfc:
	btst.b	#$05,($0016,a6)
	beq.s	L000d06
	bsr.s	L000d34
L000d06:
	btst.b	#$06,($0016,a6)
	beq.s	L000d12
	bsr.w	L000d96
L000d12:
	rts

L000d14:
	subq.b	#1,($0025,a6)
	bne.s	L000d32
	btst.b	#$05,($0016,a6)
	beq.s	L000d26
	bsr.w	L0011c8
L000d26:
	btst.b	#$06,($0016,a6)
	beq.s	L000d32
	bsr.w	L001236
L000d32:
	rts

L000d34:
	move.l	($0032,a6),d1
	movea.l	($0026,a6),a0
	jmp	(a0)

L000d3e:
	add.l	d1,($0036,a6)
	subq.w	#1,($003e,a6)
	bne.s	L000d52
	move.w	($003c,a6),($003e,a6)
	neg.l	($0036,a6)
L000d52:
	rts

L000d54:
	move.l	d1,($0036,a6)
	subq.w	#1,($003e,a6)
	bne.s	L000d68
	move.w	($003c,a6),($003e,a6)
	neg.l	($0032,a6)
L000d68:
	rts

L000d6a:
	add.l	d1,($0036,a6)
	subq.w	#1,($003e,a6)
	bne.s	L000d7e
	move.w	($003c,a6),($003e,a6)
	neg.l	($0032,a6)
L000d7e:
	rts

L000d80:
	subq.w	#1,($003e,a6)
	bne.s	L000d94
	bsr.s	L000dfa
	muls.w	d1,d0
	move.l	d0,($0036,a6)
	move.w	($003c,a6),($003e,a6)
L000d94:
	rts

L000d96:
	move.w	($0048,a6),d1
	movea.l	($0040,a6),a0
	jmp	(a0)

L000da0:
	add.w	d1,($004a,a6)
	subq.w	#1,($004e,a6)
	bne.s	L000db6
	move.w	($004c,a6),($004e,a6)
	move.w	($0046,a6),($004a,a6)
L000db6:
	rts

L000db8:
	subq.w	#1,($004e,a6)
	bne.s	L000dcc
	move.w	($004c,a6),($004e,a6)
	add.w	d1,($004a,a6)
	neg.w	($0048,a6)
L000dcc:
	rts

L000dce:
	add.w	d1,($004a,a6)
	subq.w	#1,($004e,a6)
	bne.s	L000de2
	move.w	($004c,a6),($004e,a6)
	neg.w	($0048,a6)
L000de2:
	rts

L000de4:
	subq.w	#1,($004e,a6)
	bne.s	L000df8
	bsr.s	L000dfa
	muls.w	d0,d1
	move.w	($004c,a6),($004e,a6)
	move.w	d1,($004a,a6)
L000df8:
	rts

L000dfa:
	move.w	(-$0f08,a5),d0
	mulu.w	#$c549,d0
	add.l	#$0000000c,d0
	move.w	d0,(-$0f08,a5)
	lsr.l	#8,d0
	rts

L000e10:
	.dc.w	$1234
L000e12:
	lea.l	(L001902,pc),a0
	tst.b	(a0,d7.w)
	bne.s	L000e1e
	rts

L000e1e:
	clr.b	(a0,d7.w)
	cmp.w	#$0009,d7
	bcc.s	L000e2c
	clr.b	($27,a5,d7.w)
L000e2c:
	andi.b	#$f7,($0017,a6)
	bra.s	L000e54

L000e34:
	btst.b	#$03,($0017,a6)
	bne.s	L000e12
	btst.b	#$02,($0016,a6)
	bne.s	L000e4e
	subq.b	#1,($001b,a6)
	bne.s	L000e4e
	bsr.w	L000c7e
L000e4e:
	subq.b	#1,($001a,a6)
	bne.s	L000ea4
L000e54:
	movea.l	(a6),a4
	andi.b	#$7b,($0016,a6)
L000e5c:
	moveq.l	#$00,d0
	moveq.l	#$00,d1
	move.b	(a4)+,d0
	move.b	d0,d1
	bpl.s	L000e96
	cmp.b	#$e0,d0
	bcc.s	L000eae
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
	bmi.s	L000ea6
	mulu.w	d0,d1
	lsr.w	#3,d1
L000e96:
	addq.w	#1,d1
	move.b	d1,($001b,a6)
	addq.w	#1,d0
	move.b	d0,($001a,a6)
	move.l	a4,(a6)
L000ea4:
	rts

L000ea6:
	add.b	d0,d1
	bcs.s	L000e96
	moveq.l	#$00,d1
	bra.s	L000e96

L000eae:
	ext.w	d0
	not.w	d0
	add.w	d0,d0
	move.w	(L000ec0,pc,d0.w),d0
	pea.l	(L000e5c,pc)
	jmp	(L000ec0,pc,d0.w)

L000ec0:
	.dc.w	L000f00-L000ec0
	.dc.w	L000f14-L000ec0
	.dc.w	L000f2c-L000ec0
	.dc.w	L000f54-L000ec0
	.dc.w	L000f8a-L000ec0
	.dc.w	L000f96-L000ec0
	.dc.w	L000fb2-L000ec0
	.dc.w	L000fd2-L000ec0
	.dc.w	L000fd8-L000ec0
	.dc.w	L000fe0-L000ec0
	.dc.w	L000fe4-L000ec0
	.dc.w	L001006-L000ec0
	.dc.w	L001022-L000ec0
	.dc.w	L00102e-L000ec0
	.dc.w	L001044-L000ec0
	.dc.w	L0010f8-L000ec0
	.dc.w	L0010fe-L000ec0
	.dc.w	L001116-L000ec0
	.dc.w	L001142-L000ec0
	.dc.w	L001162-L000ec0
	.dc.w	L0011f6-L000ec0
	.dc.w	L001264-L000ec0
	.dc.w	L0012ba-L000ec0
	.dc.w	L0012c0-L000ec0
	.dc.w	L0012f8-L000ec0
	.dc.w	L0010a8-L000ec0
	.dc.w	L0010a8-L000ec0
	.dc.w	L0010a8-L000ec0
	.dc.w	L0010a8-L000ec0
	.dc.w	L0010a8-L000ec0
	.dc.w	L0010a8-L000ec0
	.dc.w	L0010a8-L000ec0
L000f00:
	moveq.l	#$12,d1
	move.b	(a4)+,d2
	tst.b	(-$0404,a5)
	bne.s	L000f12
	move.b	d2,(-$0400,a5)
	bra.w	L001320

L000f12:
	rts

L000f14:
	move.b	(a4)+,d1
	move.b	(a4)+,d2
	cmp.b	#$12,d1
	bne.s	L000f28
	tst.b	(-$0404,a5)
	bne.s	L000f12
	move.b	d2,(-$0400,a5)
L000f28:
	bra.w	L001320

L000f2c:
	tst.b	($0018,a6)
	bmi.s	L000f4e
	move.b	(a4)+,d0
	movea.l	($001c,a5),a0
	bra.s	L000f3e

L000f3a:
	lea.l	($001a,a0),a0
L000f3e:
	cmp.b	(a0)+,d0
	bne.s	L000f3a
	move.l	a0,($0004,a6)
	ori.b	#$02,($0017,a6)
	rts

L000f4e:
	move.b	(a4)+,($0004,a6)
	rts

L000f54:
	tst.b	($0018,a6)
	bmi.s	L000f70
	move.b	($001c,a6),d0
	ror.w	#6,d0
	move.b	(a4)+,d0
	rol.w	#6,d0
	move.b	d0,($001c,a6)
	ori.b	#$04,($0017,a6)
	rts

L000f70:
	move.b	(a4)+,d0
	beq.s	L000f7a
	cmp.b	#$03,d0
	bne.s	L000f7e
L000f7a:
	eori.b	#$03,d0
L000f7e:
	andi.b	#$fc,($001c,a6)
	or.b	d0,($001c,a6)
	rts

L000f8a:
	move.b	(a4)+,($0022,a6)
	ori.b	#$01,($0017,a6)
	rts

L000f96:
	move.b	($0022,a6),d2
	bmi.s	L000faa
	beq.s	L000fa8
L000f9e:
	subq.b	#1,($0022,a6)
	ori.b	#$01,($0017,a6)
L000fa8:
	rts

L000faa:
	cmp.b	#-$01,d2
	bne.s	L000fbe
	rts

L000fb2:
	move.b	($0022,a6),d2
	bmi.s	L000fca
	cmp.b	#$0f,d2
	beq.s	L000fc8
L000fbe:
	addq.b	#1,($0022,a6)
	ori.b	#$01,($0017,a6)
L000fc8:
	rts

L000fca:
	cmp.b	#$80,d2
	bne.s	L000f9e
	rts

L000fd2:
	move.b	(a4)+,($001e,a6)
	rts

L000fd8:
	ori.b	#$04,($0016,a6)
	rts

L000fe0:
	move.b	(a4)+,(a4)+
	rts

L000fe4:
	move.b	(a4)+,-(sp)
	move.w	(sp)+,d0
	move.b	(a4)+,d0
	subq.b	#1,(-$01,a4,d0.w)
	beq.s	L001004
	tst.b	(-$0401,a5)
	beq.s	L001002
	cmpi.b	#$f1,(a4)
	bne.s	L001002
	tst.b	($0001,a4)
	beq.s	L00104c
L001002:
	adda.w	d0,a4
L001004:
	rts

L001006:
	move.b	(a4)+,-(sp)
	move.w	(sp)+,d0
	move.b	(a4)+,d0
	lea.l	(a4,d0.w),a0
	move.b	(a0)+,-(sp)
	move.w	(sp)+,d0
	move.b	(a0)+,d0
	cmpi.b	#$01,(-$01,a0,d0.w)
	bne.s	L001020
	movea.l	a0,a4
L001020:
	rts

L001022:
	move.b	(a4)+,-(sp)
	move.w	(sp)+,d0
	move.b	(a4)+,d0
	move.w	d0,($0010,a6)
	rts

L00102e:
	move.b	(a4)+,-(sp)
	move.w	(sp)+,d0
	move.b	(a4)+,d0
	ext.l	d0
	asl.l	#8,d0
	move.l	d0,($0008,a6)
	ori.b	#$80,($0016,a6)
	rts

L001044:
	move.b	(a4)+,-(sp)
	beq.s	L0010a6
	move.w	(sp)+,d0
	move.b	(a4)+,d0
L00104c:
	adda.w	d0,a4
	move.w	(L001926,pc),d0
	bclr.l	d7,d0
	move.w	d0,(-$03f2,a5)
	and.w	(L001912,pc),d0
	bne.s	L0010a4
	tst.b	(-$03f4,a5)
	bne.s	L00107c
	move.w	#$01ff,(-$03f2,a5)
	tst.b	(-$0418,a5)
	beq.s	L001076
	ori.w	#$fe00,(-$03f2,a5)
L001076:
	addq.w	#1,($003a,a5)
	bra.s	L0010a4

L00107c:
	tst.b	(-$03f5,a5)
	bne.s	L0010a4
	move.w	#$01ff,(-$03f2,a5)
	tst.b	(-$0418,a5)
	beq.s	L001094
	ori.w	#$fe00,(-$03f2,a5)
L001094:
	subq.w	#1,(-$03ea,a5)
	bne.s	L0010a4
	move.w	#$0011,(-$03ee,a5)
	st.b	(-$03f5,a5)
L0010a4:
	rts

L0010a6:
	addq.w	#2,sp
L0010a8:
	lea.l	(L0014ea,pc),a4
	move.w	(L001926,pc),d0
	bclr.l	d7,d0
	move.w	d0,(-$03f2,a5)
	move.w	(L001912,pc),d0
	bclr.l	d7,d0
	move.w	d0,(-$0406,a5)
	bne.s	L0010f6
	move.b	#$01,(-$03f9,a5)
	tst.b	(-$0418,a5)
	beq.s	L0010d8
	move.w	#$01ff,d0
	trap	#2
	clr.b	(-$0418,a5)
L0010d8:
	tst.b	(-$03f4,a5)
	bne.s	L0010e6
	move.w	#$ffff,($003a,a5)
	bra.s	L0010f6

L0010e6:
	move.w	#$ffff,(-$03ee,a5)
	st.b	(-$03f5,a5)
	move.w	#$0037,(-$03f8,a5)	;'7'
L0010f6:
	rts

L0010f8:
	move.b	(a4)+,($001f,a6)
	rts

L0010fe:
	moveq.l	#$00,d0
	move.b	(a4)+,d0
	lea.l	(L001902,pc),a0
	st.b	(a0,d0.w)
	cmp.w	#$0009,d0
	bcc.s	L001114
	st.b	($27,a5,d0.w)
L001114:
	rts

L001116:
	lea.l	(L001902,pc),a0
	tst.b	(a0,d7.w)
	beq.s	L001136
	clr.b	(a0,d7.w)
	cmp.w	#$0009,d7
	bcc.s	L00112e
	clr.b	($27,a5,d7.w)
L00112e:
	andi.b	#$f7,($0017,a6)
	rts

L001136:
	ori.b	#$08,($0017,a6)
	move.l	a4,(a6)
	addq.w	#4,sp
	rts

L001142:
	move.b	(a4)+,d2
	tst.b	($0018,a6)
	bmi.s	L001154
	move.b	d2,($0026,a5)
	moveq.l	#$0f,d1
	bra.w	L001320

L001154:
	lsl.b	#2,d2
	andi.b	#$03,($001c,a6)
	or.b	d2,($001c,a6)
	rts

L001162:
	ori.b	#$20,($0016,a6)
	moveq.l	#$00,d1
	move.b	(a4)+,d1
	bmi.s	L0011dc
	move.w	d1,-(sp)
	andi.b	#$03,d1
	add.w	d1,d1
	move.w	(L0011ee,pc,d1.w),d0
	lea.l	(L0011ee,pc,d0.w),a0
	move.l	a0,($0026,a6)
	move.b	(a4)+,-(sp)
	move.w	(sp)+,d2
	move.b	(a4)+,d2
	move.w	d2,($003c,a6)
	cmp.b	#$02,d1
	beq.s	L00119c
	lsr.w	#1,d2
	cmpi.b	#$06,d1
	bne.s	L00119c
	moveq.l	#$01,d2
L00119c:
	move.w	d2,($003a,a6)
	move.b	(a4)+,-(sp)
	move.w	(sp)+,d0
	move.b	(a4)+,d0
	ext.l	d0
	asl.l	#8,d0
	move.w	(sp)+,d1
	cmpi.b	#$04,d1
	bcs.s	L0011b8
	asl.l	#8,d0
	andi.b	#$03,d1
L0011b8:
	move.l	d0,($002e,a6)
	cmp.b	#$02,d1
	beq.s	L0011c4
	moveq.l	#$00,d0
L0011c4:
	move.l	d0,($002a,a6)
L0011c8:
	move.w	($003a,a6),($003e,a6)
	move.l	($002e,a6),($0032,a6)
	move.l	($002a,a6),($0036,a6)
	rts

L0011dc:
	and.b	#$01,d1
	bne.s	L0011c8
	andi.b	#$df,($0016,a6)
	clr.l	($0036,a6)
	rts

L0011ee:
	.dc.w	L000d3e-L0011ee
	.dc.w	L000d54-L0011ee
	.dc.w	L000d6a-L0011ee
	.dc.w	L000d80-L0011ee
L0011f6:
	ori.b	#$40,($0016,a6)
	moveq.l	#$00,d2
	move.b	(a4)+,d2
	bmi.s	L00124a
	add.w	d2,d2
	move.w	(L00125c,pc,d2.w),d0
	lea.l	(L00125c,pc,d0.w),a0
	move.l	a0,($0040,a6)
	move.b	(a4)+,-(sp)
	move.w	(sp)+,d1
	move.b	(a4)+,d1
	move.w	d1,($004c,a6)
	move.b	(a4)+,-(sp)
	move.w	(sp)+,d0
	move.b	(a4)+,d0
	move.w	d0,($0044,a6)
	btst.l	#$01,d2
	bne.s	$0000122c
	muls.w	d1,d0
	neg.w	d0
	bpl.s	$00001232
	moveq.l	#$00,d0
	move.w	d0,($0046,a6)
L001236:
	move.w	($004c,a6),($004e,a6)
	move.w	($0044,a6),($0048,a6)
	move.w	($0046,a6),($004a,a6)
	rts

L00124a:
	and.b	#$01,d2
	bne.s	L001236
	andi.b	#$bf,($0016,a6)
	clr.w	($004a,a6)
	rts

L00125c:
	.dc.w	L000da0-L00125c
	.dc.w	L000db8-L00125c
	.dc.w	L000dce-L00125c
	.dc.w	L000de4-L00125c
L001264:
	move.b	(a4)+,d2
	bmi.s	$000012ae
	andi.b	#$fd,($0016,a6)
	bclr.l	#$06,d2
	beq.s	$0000127a
	ori.b	#$02,($0016,a6)
	move.b	($09da),d0
	and.b	#$c0,d0
	or.b	d0,d2
	moveq.l	#$1b,d1
	bsr.w	L001320
	moveq.l	#$18,d1
	move.b	(a4)+,d2
	bsr.w	L001320
	moveq.l	#$19,d1
	move.b	(a4)+,d2
	bsr.w	L001320
	move.b	(a4)+,d2
	bsr.w	L001320
	move.b	(a4)+,d2
	move.b	d2,($0021,a6)
	moveq.l	#$38,d1			;'8'
	add.b	($0018,a6),d1
	bra.s	L001320

	and.b	#$01,d2
	beq.s	$000012a6
	move.b	($0021,a6),d2
	bra.s	$000012a6

	move.b	(a4)+,($0024,a6)
	rts

L0012c0:
	movea.l	($0088),a0
	cmpa.l	#$00f00000,a0
	bcc.s	L0012f6
	cmpi.l	#$50434d34,(-$0008,a0)	;'PCM4'
	beq.s	L0012e0
	cmpi.l	#$50434d38,(-$0008,a0)	;'PCM8'
	bne.s	L0012f6
L0012e0:
	st.b	(-$0418,a5)
	move.w	#$01fe,d0
	trap	#2
	ori.w	#$fe00,(-$03f2,a5)
	ori.w	#$fe00,(-$0406,a5)
L0012f6:
	rts

L0012f8:
	moveq.l	#$00,d0
	move.b	(a4)+,d0
	cmp.w	#$0002,d0
	bcc.w	L0010a8
	add.w	d0,d0
	move.w	(L00130e,pc,d0.w),d0
	jmp	(L00130e,pc,d0.w)

L00130e:
	.dc.w	L0010a8-L00130e
	.dc.w	L001312-L00130e
L001312:
	moveq.l	#$00,d0
	move.b	(a4)+,d0
	move.w	d0,(-$03ee,a5)
	st.b	(-$03f5,a5)
	rts

L001320:
	ori.w	#$0300,sr
	tst.b	($00e90003)
	bmi.s	L001320
	move.b	d1,($00e90001)
	and.w	#$00ff,d1
	lea.l	(L001948,pc),a2
	move.b	d2,(a2,d1.w)
	move.b	d2,($00e90003)
	andi.w	#$faff,sr
	cmp.b	#$1b,d1
	beq.s	L001350
	rts

L001350:
	move.b	d2,($09da)
	rts

L001356:
	clr.l	-(sp)
	DOS	_SUPER
	pea.l	(L0014ed,pc)
	DOS	_PRINT
	lea.l	(L001d18,pc),a5
	move.w	#$0001,(-$03fa,a5)
	clr.l	(-$0404,a5)
	move.l	($0008,a0),(-$065c,a5)
	move.l	#$00010000,($0014,a5)
	move.l	#$0004e000,($0018,a5)
	clr.b	($0024,a5)
	clr.b	($0025,a5)
	addq.w	#1,a2
	bsr.s	L0013ee
	lea.l	(L001d54,pc),a4
	lea.l	(L001940,pc),a1
	move.l	a4,(a1)
	adda.l	($0014,a5),a4
	move.l	a4,($0004,a1)
	adda.l	($0018,a5),a4
	cmpa.l	($0008,a0),a4
	bhi.w	L0014d8
	suba.l	a0,a0
	move.l	($0090,a0),(a5)
	move.l	($010c,a0),($0004,a5)
	lea.l	(Trap4Handler,pc),a1
	move.l	a1,($0090,a0)
	lea.l	(L000000,pc),a1
	suba.l	a1,a4
	clr.w	-(sp)
	move.l	a4,-(sp)
	DOS	_KEEPPR

L0013ce:
	movea.l	($0090),a4
	cmpa.l	#$00fe0000,a4
	bcc.s	L0013ec
	subq.w	#8,a4
	lea.l	(L000004,pc),a3
	move.w	#$0004,d0
L0013e4:
	cmpm.b	(a3)+,(a4)+
	bne.s	L0013ec
	dbra.w	d0,L0013e4
L0013ec:
	rts

L0013ee:
	move.b	(a2)+,d0
	bne.s	L0013fa
	bsr.s	L0013ce
	beq.w	L0014d2
	rts

L0013fa:
	cmp.b	#$20,d0			;' '
	beq.s	L0013ee
	cmp.b	#$09,d0
	beq.s	L0013ee
	cmp.b	#$2d,d0			;'-'
	beq.s	L001414
	cmp.b	#$2f,d0			;'/'
	bne.w	L0014de
L001414:
	move.b	(a2)+,d0
	beq.w	L0014de
	or.b	#$20,d0
	cmp.b	#$72,d0			;'r'
	bne.s	L001444
	bsr.s	L0013ce
	bne.w	L0014cc
	moveq.l	#$00,d0
	trap	#4
	tst.l	d0
	bne.s	L00143e
	pea.l	(L001643,pc)
L001436:
	DOS	_PRINT
	addq.w	#4,sp
	clr.w	-(sp)
	DOS	_EXIT2

L00143e:
	pea.l	(L00169c,pc)
	bra.s	L001436

L001444:
	bsr.s	L0013ce
	beq.w	L0014d2
	cmp.b	#$6d,d0			;'m'
	bne.s	L001460
	cmpi.b	#$3a,(a2)		;':'
	bne.s	L001458
	addq.w	#1,a2
L001458:
	bsr.s	L0014a6
	move.l	d0,($0014,a5)
	bra.s	L0013ee

L001460:
	cmp.b	#$70,d0			;'p'
	bne.s	L001478
	cmpi.b	#$3a,(a2)		;':'
	bne.s	L00146e
	addq.w	#1,a2
L00146e:
	bsr.s	L0014a6
	move.l	d0,($0018,a5)
	bra.w	L0013ee

L001478:
	cmpi.b	#$66,d0			;'f'
	bne.s	L0014de
	cmpi.b	#$3a,(a2)		;':'
	bne.s	L001486
	addq.w	#1,a2
L001486:
	move.l	a2,-(sp)
	bsr.s	L0014a6
	cmpa.l	(sp)+,a2
	beq.s	L00149a
	lsr.l	#8,d0
	lsr.l	#2,d0
	andi.l	#$00007fff,d0
	bra.s	L00149c

L00149a:
	moveq.l	#$11,d0
L00149c:
	move.w	d0,($0000083c).l
	bra.w	L0013ee

L0014a6:
	moveq.l	#$00,d0
L0014a8:
	moveq.l	#$00,d1
	move.b	(a2),d1
	sub.b	#$30,d1			;'0'
	bcs.s	L0014c2
	cmp.b	#$09,d1
	bhi.s	L0014c2
	mulu.w	#$000a,d0
	add.l	d1,d0
	addq.w	#1,a2
	bra.s	L0014a8

L0014c2:
	tst.l	d0
	bmi.s	L0014de
	moveq.l	#$0a,d1
	lsl.l	d1,d0
	rts

L0014cc:
	pea.l	(L00167d,pc)
	bra.s	L0014e2

L0014d2:
	pea.l	(L00165a,pc)
	bra.s	L0014e2

L0014d8:
	pea.l	(L001629,pc)
	bra.s	L0014e2

L0014de:
	pea.l	(L00154a,pc)
L0014e2:
	DOS	_PRINT
	move.w	#$ffff,-(sp)
	DOS	_EXIT2

L0014ea:
	.dc.b	$7f,$f1,$00
L0014ed:
	.dc.b	'X68k MXDRV music driver version 2.06+16 Rel.3 (c)1988-91 milk.,K.MAEKAWA, Missy.M, Yatsube',$0d,$0a,$00
L00154a:
	.dc.b	'使い方: mxdrv [switch]',$0d,$0a
	.dc.b	$09,'-m:<num> MMLバッファサイズ(Kbytes)           [省略時 64]',$0d,$0a
	.dc.b	$09,'-p:<num> PCMバッファサイズ(Kbytes)           [省略時312]',$0d,$0a
	.dc.b	$09,'-f:<num> FADEOUT SPEED (FAST 0 - 32767 SLOW) [省略時 23]',$0d,$0a
	.dc.b	$09,'-r       mxdrv解除',$0d,$0a,$00
L001629:
	.dc.b	$09,'メモリが不足しています',$0d,$0a,$00
L001643:
	.dc.b	$09,'mxdrvを解除しました',$0d,$0a,$00
L00165a:
	.dc.b	$09,'mxdrvはすでに組み込まれています',$0d,$0a,$00
L00167d:
	.dc.b	$09,'mxdrvは組み込まれていません',$0d,$0a,$00
L00169c:
	.dc.b	$09,'mxdrvを解除出来ませんでした',$0d,$0a,$00,$00

	.bss

L0016bc:
	.ds.b	4
L0016c0:
	.ds.b	16
L0016d0:
	.ds.b	562
L001902:
	.ds.b	16
L001912:
	.ds.w	1
L001914:
	.ds.b	4
L001918:
	.ds.b	2
L00191a:
	.ds.b	6
L001920:
	.ds.b	3
L001923:
	.ds.b	2
L001925:
	.ds.b	1
L001926:
	.ds.w	1
L001928:
	.ds.w	1
L00192a:
	.ds.b	6
L001930:
	.ds.l	1
L001934:
	.ds.l	1
L001938:
	.ds.l	1
L00193c:
	.ds.l	1
L001940:
	.ds.l	1
L001944:
	.ds.l	1
L001948:
	.ds.b	256
L001a48:
	.ds.b	720
L001d18:
	.ds.b	48
L001d48:
	.ds.b	12
L001d54:

	.end	L001356
