;=============================================
;  Filename mxdrv/2.06+16_Rel.1/mxdrv16.x
;  Time Stamp Wed Nov  6 00:03:50 1991
;
;  Base address 000000
;  Exec address 0013e0
;  Text size    001746 byte(s)
;  Data size    000000 byte(s)
;  Bss  size    000698 byte(s)
;  353 Labels
;
;  Commandline dis  -h -k -m68030 -q1 -B -M -w16 -o120 -gmxdrv/2.06+16_Rel.1/mxdrv16.lab --overwrite mxdrv/2.06+16_Rel.1/mxdrv16.x mxdrv/2.06+16_Rel.1/mxdrv16.s
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
	lea.l	(WorkAreaEnd,pc),a5
	and.w	#$001f,d0
	add.w	d0,d0
	move.w	(Trap4CallTable,pc,d0.w),d0
	jsr	(Trap4CallTable,pc,d0.w)
L_1A_1F:
	movem.l	(a7)+,d1-d7/a0-a6
	rte

Trap4CallTable:
	.dc.w	L_FREE-Trap4CallTable
	.dc.w	L_ERROR-Trap4CallTable
	.dc.w	L_SETMDX-Trap4CallTable
	.dc.w	L_SETPDX-Trap4CallTable
	.dc.w	L_PLAY-Trap4CallTable
	.dc.w	L_STOP-Trap4CallTable
	.dc.w	L_PAUSE-Trap4CallTable
	.dc.w	L_CONT-Trap4CallTable
	.dc.w	L_GetMDXTitle-Trap4CallTable
	.dc.w	L_GetPDXFilename-Trap4CallTable
	.dc.w	L_0A-Trap4CallTable
	.dc.w	L_0B-Trap4CallTable
	.dc.w	L_FadeOut-Trap4CallTable
	.dc.w	L_0D-Trap4CallTable
	.dc.w	L_SetChannelMask-Trap4CallTable
	.dc.w	L_PlayWithMask-Trap4CallTable
	.dc.w	L_GetOPMBuf-Trap4CallTable
	.dc.w	L_11-Trap4CallTable
	.dc.w	L_GetPlaybackFlags-Trap4CallTable
	.dc.w	L_SetIgnoreKeys-Trap4CallTable
	.dc.w	L_14-Trap4CallTable
	.dc.w	L_15-Trap4CallTable
	.dc.w	L_16-Trap4CallTable
	.dc.w	L_17-Trap4CallTable
	.dc.w	L_GetPCMBuf-Trap4CallTable
	.dc.w	L_19-Trap4CallTable
	.dc.w	L_1A_1F-Trap4CallTable
	.dc.w	L_1A_1F-Trap4CallTable
	.dc.w	L_1A_1F-Trap4CallTable
	.dc.w	L_1A_1F-Trap4CallTable
	.dc.w	L_1A_1F-Trap4CallTable
	.dc.w	L_1A_1F-Trap4CallTable
L_0A:
	move.b	d1,(-$03f8,a5)
	rts

L_0B:
	move.b	d1,(-$03f7,a5)
	rts

L_FadeOut:
	move.w	d1,(-$03ee,a5)
	st.b	(-$03f5,a5)
	rts

L_SetChannelMask:
	move.w	d1,(-$03f0,a5)
	rts

L_GetOPMBuf:
	lea.l	($194c,pc),a0
	move.l	a0,d0
	rts

L_11:
	lea.l	($1916,pc),a0
	tst.l	d1
	bmi	L000098
	move.b	d1,(a0)
	rts

L000098:
	move.b	(a0),d0
	rts

L_GetPlaybackFlags:
	move.b	(-$03fa,a5),-(a7)
	move.w	(a7)+,d0
	move.b	(-$03f9,a5),d0
	rts

L_SetIgnoreKeys:
	move.b	(-$0402,a5),d0
	move.b	d1,(-$0402,a5)
	rts

L_14:
	move.w	(-$0406,a5),d0
	not.w	d0
	andi.w	#$01ff,d0
	rts

L_15:
	move.b	(-$0401,a5),d0
	move.b	d1,(-$0401,a5)
	rts

L_16:
	move.b	(-$0404,a5),d0
	move.b	d1,(-$0404,a5)
	bsr	L_STOP
	rts

L_17:
	move.b	(-$0404,a5),d0
	beq	L0001ec
	movem.l	d1-d7/a0-a6,-(a7)
	st.b	($0039,a5)
	lea.l	($18cc,pc),a0
	lea.l	($18c1,pc),a1
	tst.b	(a1)
	beq	L000176
	bpl	L0000fe
	move.b	#$7f,(a1)
	move.w	(a0),($0002,a0)
L0000fe:
	tst.w	($0002,a0)
	bmi	L00010a
	subq.w	#2,($0002,a0)
	bra	L000176

L00010a:
	lea.l	($189e,pc),a1
	cmpi.b	#$0a,(a1)
	bge	L000122
L000114:
	cmpi.b	#$3e,(a1)		;'>'
	bge	L000128
	addq.b	#1,(a1)
	move.w	(a0),($0002,a0)
	bra	L000176

L000122:
	st.b	(-$03f7,a5)
	bra	L000114

L000128:
	tst.b	(-$03f4,a5)
	beq	L000136
	bsr	L000474
	bra	L0001d4

L000136:
	move.b	#$7f,(a1)
	clr.b	(-$03f5,a5)
	move.b	#$01,(-$03f9,a5)
	bsr	L_PAUSE
	movea.l	($0088),a0
	move.l	(-$0008,a0),d0
	cmp.l	#$50434d34,d0		;'PCM4'
	beq	L000160
	cmp.l	#$50434d38,d0		;'PCM8'
	bne	L000166
L000160:
	move.w	#$0100,d0
	trap	#2
L000166:
	tst.b	(-$0418,a5)
	beq	L000176
	move.w	#$01ff,d0
	trap	#2
	clr.b	(-$0418,a5)
L000176:
	lea.l	(UnknownVar4,pc),a0
	move.b	(a0),d2
	moveq.l	#$12,d1
	tst.b	(-$03f9,a5)
	bne	L0001d4
	lea.l	($194c,pc),a6
	moveq.l	#$00,d7
L00018a:
	bsr	L000d36
	bsr	L000e9a
	move.w	(UnknownVar7,pc),d0
	btst.l	d7,d0
	bne	L00019e
	bsr	L000922
L00019e:
	lea.l	($0050,a6),a6
	addq.w	#1,d7
	cmp.w	#$0009,d7
	bcs	L00018a
	tst.b	(-$0418,a5)
	beq	L0001d4
	lea.l	($15a8,pc),a6
L0001b4:
	bsr	L000d36
	bsr	L000e9a
	move.w	(UnknownVar7,pc),d0
	btst.l	d7,d0
	bne	L0001c8
	bsr	L000922
L0001c8:
	lea.l	($0050,a6),a6
	addq.w	#1,d7
	cmp.w	#$0010,d7
	bcs	L0001b4
L0001d4:
	tst.b	($00e90003)
	bmi	L0001d4
	move.b	#$1b,($00e90001)
	clr.b	($0039,a5)
	movem.l	(a7)+,d1-d7/a0-a6
L0001ec:
	move.b	(-$03fa,a5),-(a7)
	move.w	(a7)+,d0
	move.b	(-$03f9,a5),d0
	rts

L_GetPCMBuf:
	lea.l	($1560,pc),a0
	move.l	a0,d0
	rts

L_19:
	lea.l	($1548,pc),a0
	move.l	a0,d0
	rts

L_0D:
	cmp.b	#$f0,d1
	beq	L00026e
	cmp.b	#$fc,d1
	beq	L00024a
	tst.l	d1
	bmi	L000250
	tst.b	(-$03f4,a5)
	bne	L_ERROR
	move.l	a2,(-$03dc,a5)
	move.l	a1,(-$03e8,a5)
	move.l	a1,(-$03e4,a5)
L00022c:
	tst.w	(a1)
	beq	L000234
	addq.w	#6,a1
	bra	L00022c

L000234:
	subq.w	#6,a1
	move.l	a1,(-$03e0,a5)
	st.b	(-$03f4,a5)
	st.b	(-$03f3,a5)
	movea.l	($1776,pc),a0
	bra	L000482

L00024a:
	move.b	($1763,pc),d0
	rts

L000250:
	clr.b	(-$03f4,a5)
	clr.b	($0024,a5)
	clr.b	($0025,a5)
	movea.l	($176c,pc),a0
	move.l	(a0),($000c,a5)
	move.l	($0004,a0),($0010,a5)
	bra	L00035a

L00026e:
	bsr	L000250
L000270:
	movea.l	($1754,pc),a0
	pea.l	(a0)
	DOS	_MFREE
	addq.w	#4,a7
	moveq.l	#$00,d0
	move.l	d0,(-$03dc,a5)
	move.b	d0,(-$03f3,a5)
	rts

L000286:
	move.w	sr,-(a7)
	ori.w	#$0700,sr
	clr.b	(-$03f9,a5)
	tst.b	(-$0404,a5)
	bne	L0002b2
	lea.l	(L00067e,pc),a1
	suba.l	a0,a0
	move.l	a1,($010c,a0)
	movea.l	#$00e88000,a0
	ori.b	#$08,($0009,a0)
	ori.b	#$08,($0015,a0)
L0002b2:
	move.w	(a7)+,sr
	rts

L_FREE:
	bsr	L00035a
	move.l	(a5),($0090,a0)
	pea.l	(L000000-$0000f0,pc)
	DOS	_MFREE
	addq.w	#4,a7
	tst.b	(-$03f3,a5)
	beq	L0002ce
	bra	L000270

L0002ce:
	rts

L_SETMDX:
	tst.b	(-$03f4,a5)
	beq	L0002e0
	movem.l	d1/a1,-(a7)
	bsr	L00026e
	movem.l	(a7)+,d1/a1
L0002e0:
	lea.l	($0024,a5),a2
	movea.l	($16e4,pc),a0
	move.l	a0,($000c,a5)
	move.l	($0014,a5),d0
	bra	L000314

L_SETPDX:
	tst.b	(-$03f4,a5)
	beq	L000304
	movem.l	d1/a1,-(a7)
	bsr	L00026e
	movem.l	(a7)+,d1/a1
L000304:
	lea.l	($0025,a5),a2
	movea.l	($16c4,pc),a0
	move.l	a0,($0010,a5)
	move.l	($0018,a5),d0
L000314:
	cmp.l	d1,d0
	bcs	L00034c
	movem.l	d1/a0-a2,-(a7)
	bsr	L00035a
	movem.l	(a7)+,d1/a0-a2
	move.w	d1,d0
	andi.w	#$0003,d0
	lsr.l	#2,d1
	swap.w	d1
L00032c:
	swap.w	d1
L00032e:
	move.l	(a1)+,(a0)+
	dbra	d1,L00032e
	swap.w	d1
	dbra	d1,L00032c
	tst.w	d0
	beq	L000346
	subq.w	#1,d0
L000340:
	move.b	(a1)+,(a0)+
	dbra	d0,L000340
L000346:
	st.b	(a2)
	moveq.l	#$00,d0
	rts

L00034c:
	bset.l	#$1f,d0
	rts

L_STOP:
	tst.b	(-$03f4,a5)
	bne	L00026e
L00035a:
	move.b	#$01,(-$03f9,a5)
	move.w	sr,-(a7)
	ori.w	#$0700,sr
	bsr	L0003e0
	movea.l	($0088),a0
	move.l	(-$0008,a0),d0
	cmp.l	#$50434d34,d0		;'PCM4'
	beq	L000380
	cmp.l	#$50434d38,d0		;'PCM8'
	bne	L000386
L000380:
	move.w	#$0100,d0
	trap	#2
L000386:
	tst.b	(-$0418,a5)
	beq	L000396
	move.w	#$01ff,d0
	trap	#2
	clr.b	(-$0418,a5)
L000396:
	moveq.l	#$0f,d2
	moveq.l	#$e0,d1
L00039a:
	bsr	WriteOPM
	addq.b	#1,d1
	bne	L00039a
	lea.l	($1a2e,pc),a0
	lea.l	($13a2,pc),a1
	moveq.l	#$07,d3
	moveq.l	#$00,d2
	moveq.l	#$08,d1
L0003b0:
	bsr	WriteOPM
	move.b	d2,(a0)+
	move.b	d2,(a1)+
	addq.b	#1,d2
	dbra	d3,L0003b0
	movea.l	#$00e88000,a0
	andi.b	#$f7,($0009,a0)
	andi.b	#$f7,($0015,a0)
	suba.l	a0,a0
	move.l	($0004,a5),($010c,a0)
	move.w	(a7)+,sr
	rts

L_PAUSE:
	st.b	(-$03fa,a5)
L0003e0:
	moveq.l	#$07,d7
	lea.l	($16ee,pc),a6
L0003e6:
	moveq.l	#$7f,d0
	bsr	L000ae4
	lea.l	($0050,a6),a6
	dbra	d7,L0003e6
	movea.l	($0088),a0
	move.l	(-$0008,a0),d0
	cmp.l	#$50434d34,d0		;'PCM4'
	beq	L00040c
	cmp.l	#$50434d38,d0		;'PCM8'
	bne	L000414
L00040c:
	move.w	#$0101,d0
	trap	#2
	rts

L000414:
	moveq.l	#$67,d0			;'g'
	moveq.l	#$00,d1
L000418:
	trap	#15
	rts

L_CONT:
	clr.b	(-$03fa,a5)
	moveq.l	#$07,d7
	lea.l	($16ae,pc),a6
L000426:
	bsr	L000aba
	lea.l	($0050,a6),a6
	dbra	d7,L000426
	movea.l	($0088),a0
	move.l	(-$0008,a0),d0
	cmp.l	#$50434d34,d0		;'PCM4'
	beq	L00044a
	cmp.l	#$50434d38,d0		;'PCM8'
	bne	L000450
L00044a:
	move.w	#$0102,d0
	trap	#2
L000450:
	moveq.l	#$30,d2			;'0'
	move.b	($154a,pc),d1
	bne	L00045a
	moveq.l	#$3a,d2			;':'
L00045a:
	moveq.l	#$14,d1
	bra	WriteOPM

L000460:
	movea.l	($155c,pc),a0
	movea.l	($1554,pc),a1
	subq.w	#6,a0
	cmpa.l	a1,a0
	bcc	L000482
	movea.l	($1552,pc),a0
	bra	L000482

L000474:
	movea.l	($1548,pc),a0
	addq.w	#6,a0
	tst.w	(a0)
	bne	L000482
	movea.l	($153a,pc),a0
L000482:
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
	bra	L0004ba

L_PLAY:
	clr.w	(-$03f0,a5)
	bra	L0004ba

L_PlayWithMask:
	move.w	d1,(-$03f0,a5)
L0004ba:
	clr.b	(-$03f8,a5)
	clr.b	(-$03f7,a5)
	clr.b	(-$03f5,a5)
	clr.b	(-$03f9,a5)
	tst.b	(-$03fa,a5)
	beq	L0004ee
	movea.l	($0088),a0
	move.l	(-$0008,a0),d0
	cmp.l	#$50434d34,d0		;'PCM4'
	beq	L0004e8
	cmp.l	#$50434d38,d0		;'PCM8'
	bne	L0004ee
L0004e8:
	move.w	#$0100,d0
	trap	#2
L0004ee:
	clr.b	(-$03fa,a5)
	clr.b	(-$0418,a5)
	move.w	#$01ff,(-$03f2,a5)
	move.w	#$01ff,(-$0406,a5)
	clr.w	($003a,a5)
	move.b	($0024,a5),d0
	beq	L_ERROR
	bsr	L00035a
	movea.l	($000c,a5),a2
	move.w	($0002,a2),d1
	bmi	L00053e
	tst.b	($0025,a5)
	beq	L_ERROR
	movea.l	($0010,a5),a0
	bra	L000532

L00052a:
	tst.l	(a0)
	beq	L_ERROR
	adda.l	(a0),a0
L000532:
	dbra	d1,L00052a
	adda.w	($0004,a0),a0
	move.l	a0,($0020,a5)
L00053e:
	adda.w	($0004,a2),a2
	movea.l	a2,a1
	movea.l	a2,a0
	adda.w	(a1)+,a2
	move.l	a2,($001c,a5)
	lea.l	($1584,pc),a6
	lea.l	($00ea,pc),a3
	moveq.l	#$ff,d6
	moveq.l	#$00,d7
L000558:
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
	bcc	L0005c2
	moveq.l	#$38,d1			;'8'
	add.b	d7,d1
	moveq.l	#$00,d2
	bsr	WriteOPM
	addq.w	#1,d7
	lea.l	($0050,a6),a6
	bra	L000558

L0005c2:
	move.b	#$10,($001c,a6)
	move.b	#$08,($0022,a6)
	st.b	($0018,a6)
	clr.b	($0004,a6)
	cmp.w	#$000f,d7
	beq	L0005f2
	addq.w	#1,d7
	lea.l	($0050,a6),a6
	cmp.w	#$0009,d7
	bne	L000558
	lea.l	($116e,pc),a6
	bra	L000558

L0005f2:
	lea.l	(-$0416,a5),a0
	moveq.l	#$0f,d0
L0005f8:
	clr.b	(a0)+
	dbra	d0,L0005f8
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
	bne	L00062e
	bsr	WriteOPM
L00062e:
	bsr	L000286
	bsr	L000450
	moveq.l	#$00,d0
	rts

L_ERROR:
	moveq.l	#$ff,d0
	rts

L_GetMDXTitle:
	tst.b	($0024,a5)
	beq	L00067a
	movea.l	($000c,a5),a0
	bra	L000650

L00064a:
	tst.w	(a0)
	beq	L00067a
	adda.w	(a0),a0
L000650:
	dbra	d1,L00064a
	adda.w	($0006,a0),a0
	move.l	a0,d0
	rts

L_GetPDXFilename:
	tst.b	($0025,a5)
	beq	L00067a
	movea.l	($0010,a5),a0
	bra	L00066e

L000668:
	tst.l	(a0)
	beq	L00067a
	adda.l	(a0),a0
L00066e:
	dbra	d1,L000668
	adda.w	($0006,a0),a0
	move.l	a0,d0
	rts

L00067a:
	moveq.l	#$00,d0
	rts

L00067e:
	bclr.b	#$03,($00e88015)
	move.l	a6,-(a7)
	movea.l	($0006,a7),a6
	cmpa.l	($01a8),a6
	bne	L0006a0
	pea.l	($0006,pc)
	move.w	sr,-(a7)
	jmp	(a6)

	movea.l	(a7)+,a6
	addq.w	#6,a7
	move.l	a6,-(a7)
L0006a0:
	andi.w	#$faff,sr
	movem.l	d0-d7/a0-a5,-(a7)
	lea.l	(WorkAreaEnd,pc),a5
	st.b	($0039,a5)
	tst.b	(-$03fa,a5)
	bne	L000748
	lea.l	($12fa,pc),a0
	lea.l	($12ef,pc),a1
	tst.b	(a1)
	beq	L000748
	bpl	L0006d0
	move.b	#$7f,(a1)
	move.w	(a0),($0002,a0)
L0006d0:
	tst.w	($0002,a0)
	bmi	L0006dc
	subq.w	#2,($0002,a0)
	bra	L000748

L0006dc:
	lea.l	($12cc,pc),a1
	cmpi.b	#$0a,(a1)
	bge	L0006f4
L0006e6:
	cmpi.b	#$3e,(a1)		;'>'
	bge	L0006fa
	addq.b	#1,(a1)
	move.w	(a0),($0002,a0)
	bra	L000748

L0006f4:
	st.b	(-$03f7,a5)
	bra	L0006e6

L0006fa:
	tst.b	(-$03f4,a5)
	beq	L000708
	bsr	L000474
	bra	L0008fc

L000708:
	move.b	#$7f,(a1)
	clr.b	(-$03f5,a5)
	move.b	#$01,(-$03f9,a5)
	bsr	L_PAUSE
	movea.l	($0088),a0
	move.l	(-$0008,a0),d0
	cmp.l	#$50434d34,d0		;'PCM4'
	beq	L000732
	cmp.l	#$50434d38,d0		;'PCM8'
	bne	L000738
L000732:
	move.w	#$0100,d0
	trap	#2
L000738:
	tst.b	(-$0418,a5)
	beq	L000748
	move.w	#$01ff,d0
	trap	#2
	clr.b	(-$0418,a5)
L000748:
	lea.l	(UnknownVar4,pc),a0
	move.b	(a0),d2
	moveq.l	#$12,d1
	tst.b	(-$0402,a5)
	bne	L000890
	move.b	($080e),d7
	and.b	#$0f,d7
	cmp.b	#$05,d7
	beq	L0007f8
	cmp.b	#$09,d7
	beq	L0007ec
	cmp.b	#$06,d7
	beq	L0007e6
	cmp.b	#$0a,d7
	beq	L0007de
	cmp.b	#$04,d7
	beq	L00082c
	cmp.b	#$08,d7
	beq	L000802
	cmp.b	#$02,d7
	bne	L000890
	move.b	($080b),d7
	and.b	#$03,d7
	cmpi.b	#$80,($080a)
	beq	L0007ce
	cmp.b	#$02,d7
	beq	L0007be
	cmp.b	#$01,d7
	bne	L000890
	tst.b	(-$03fc,a5)
	bne	L00088a
	subq.b	#1,($0002,a0)
	bra	L00088a

L0007be:
	tst.b	(-$03fc,a5)
	bne	L00088a
	addq.b	#1,($0002,a0)
	bra	L00088a

L0007ce:
	tst.b	(-$03fc,a5)
	bne	L00088a
	clr.b	($0002,a0)
	bra	L00088a

L0007de:
	move.b	#$ff,d2
	bra	L000898

L0007e6:
	moveq.l	#$00,d2
	bra	L000898

L0007ec:
	neg.b	d2
	lsr.b	#2,d2
	addq.b	#1,d2
	neg.b	d2
	bra	L000898

L0007f8:
	neg.b	d2
	add.b	d2,d2
	neg.b	d2
	bra	L000898

L000802:
	btst.b	#$01,($080b)
	beq	L000890
	tst.b	(-$03fa,a5)
	beq	L000820
	bpl	L00087e
	tst.b	(-$03fc,a5)
	bne	L00088a
	bsr	L_CONT
	bra	L00087e

L000820:
	tst.b	(-$03fc,a5)
	bne	L00088a
	bsr	L_PAUSE
	bra	L00087e

L00082c:
	move.b	($080b),d7
	beq	L000842
	and.b	#$03,d7
	cmp.b	#$02,d7
	beq	L00086e
	cmp.b	#$01,d7
	beq	L00085c
L000842:
	cmpi.b	#$80,($080a)
	bne	L000890
	tst.b	(-$03fc,a5)
	bne	L00088a
L000850:
	move.w	#$0011,(-$03ee,a5)
	st.b	(-$03f5,a5)
	bra	L00088a

L00085c:
	tst.b	(-$03fc,a5)
	bne	L00088a
	tst.b	(-$03f4,a5)
	beq	L000884
	bsr	L000460
	bra	L00087e

L00086e:
	tst.b	(-$03fc,a5)
	bne	L00088a
	tst.b	(-$03f4,a5)
	beq	L000884
	bsr	L000474
L00087e:
	st.b	(-$03fc,a5)
	bra	L0008fc

L000884:
	bsr	L_PLAY
	bra	L00087e

L00088a:
	st.b	(-$03fc,a5)
	bra	L000894

L000890:
	clr.b	(-$03fc,a5)
L000894:
	add.b	($0002,a0),d2
L000898:
	tst.b	(-$03fa,a5)
	bne	L0008a4
	tst.b	(-$03f9,a5)
	beq	L0008ac
L0008a4:
	moveq.l	#$00,d2
	bsr	WriteOPM
	bra	L0008fc

L0008ac:
	bsr	WriteOPM
	lea.l	($1220,pc),a6
	moveq.l	#$00,d7
L0008b6:
	bsr	L000d36
	bsr	L000e9a
	move.w	(UnknownVar7,pc),d0
	btst.l	d7,d0
	bne	L0008c8
	bsr	L000922
L0008c8:
	lea.l	($0050,a6),a6
	addq.w	#1,d7
	cmp.w	#$0009,d7
	bcs	L0008b6
	tst.b	(-$0418,a5)
	beq	L0008fc
	lea.l	($0e7e,pc),a6
L0008de:
	bsr	L000d36
	bsr	L000e9a
	move.w	(UnknownVar7,pc),d0
	btst.l	d7,d0
	bne	L0008f0
	bsr	L000922
L0008f0:
	lea.l	($0050,a6),a6
	addq.w	#1,d7
	cmp.w	#$0010,d7
	bcs	L0008de
L0008fc:
	bsr	L000450
L000900:
	tst.b	($00e90003)
	bmi	L000900
	move.b	#$1b,($00e90001)
	clr.b	($0039,a5)
	movem.l	(a7)+,d0-d7/a0-a6
	bset.b	#$03,($00e88015)
	rte

L000922:
	btst.b	#$00,($0016,a6)
	beq	L00098a
	tst.b	($0020,a6)
	bne	L000986
	tst.b	($0018,a6)
	bmi	L00097a
	bsr	LoadVoice
	bsr	WritePan
	btst.b	#$03,($0016,a6)
	bne	L000970
	move.b	($0024,a6),($0025,a6)
	beq	L00095a
	clr.l	($0036,a6)
	clr.w	($004a,a6)
	bsr	L000d7a
L00095a:
	btst.b	#$01,($0016,a6)
	beq	L000970
	moveq.l	#$01,d1
	moveq.l	#$02,d2
	bsr	WriteOPM
	moveq.l	#$00,d2
	bsr	WriteOPM
L000970:
	clr.l	($000c,a6)
	bsr	L000998
	bsr	L000aba
L00097a:
	bsr	L000b3e
	bclr.b	#$00,($0016,a6)
	rts

L000986:
	subq.b	#1,($0020,a6)
L00098a:
	tst.b	($0018,a6)
	bmi	L000996
	bsr	L000998
	bsr	L000aba
L000996:
	rts

L000998:
	move.w	($0012,a6),d2
	add.w	($000c,a6),d2
	add.w	($0036,a6),d2
	cmp.w	($0014,a6),d2
	beq	L0009de
	move.w	d2,($0014,a6)
	move.w	#$17ff,d1
	cmp.w	d1,d2
	bls	L0009c0
	tst.w	d2
	bpl	L0009be
	moveq.l	#$00,d2
	bra	L0009c0

L0009be:
	move.w	d1,d2
L0009c0:
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
L0009de:
	rts

OPMNoteTable:
	.dc.b	$00,$01,$02,$04,$05,$06,$08,$09,$0a,$0c,$0d,$0e,$10,$11,$12,$14
	.dc.b	$15,$16,$18,$19,$1a,$1c,$1d,$1e,$20,$21,$22,$24,$25,$26,$28,$29
	.dc.b	$2a,$2c,$2d,$2e,$30,$31,$32,$34,$35,$36,$38,$39,$3a,$3c,$3d,$3e
	.dc.b	$40,$41,$42,$44,$45,$46,$48,$49,$4a,$4c,$4d,$4e,$50,$51,$52,$54
	.dc.b	$55,$56,$58,$59,$5a,$5c,$5d,$5e,$60,$61,$62,$64,$65,$66,$68,$69
	.dc.b	$6a,$6c,$6d,$6e,$70,$71,$72,$74,$75,$76,$78,$79,$7a,$7c,$7d,$7e
LoadVoice:
	bclr.b	#$01,($0017,a6)
	beq	L000ab0
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
L000a78:
	move.b	(a0)+,d2
	bsr	WriteOPM
	addq.b	#8,d1
	dbra	d0,L000a78
	moveq.l	#$03,d0
L000a86:
	move.b	(a0)+,d2
	lsr.b	#1,d3
	bcc	L000a8e
	moveq.l	#$7f,d2
L000a8e:
	bsr	WriteOPM
	addq.b	#8,d1
	dbra	d0,L000a86
	moveq.l	#$0f,d0
L000a9a:
	move.b	(a0)+,d2
	bsr	WriteOPM
	addq.b	#8,d1
	dbra	d0,L000a9a
	st.b	($0023,a6)
	bset.b	#$02,($0017,a6)
L000ab0:
	rts

CarrierSlot:
	.dc.b	$08,$08,$08,$08,$0c,$0e,$0e,$0f
L000aba:
	moveq.l	#$00,d0
	move.b	($0022,a6),d0
	bclr.l	#$07,d0
	bne	L000aca
	move.b	(VolumeTable,pc,d0.w),d0
L000aca:
	add.b	($0ede,pc),d0
	bcs	L000ad2
	bpl	L000ad4
L000ad2:
	moveq.l	#$7f,d0
L000ad4:
	add.b	($004a,a6),d0
	bcs	L000adc
	bpl	L000ade
L000adc:
	moveq.l	#$7f,d0
L000ade:
	cmp.b	($0023,a6),d0
	beq	L000b14
L000ae4:
	move.b	d0,($0023,a6)
	movea.l	($0004,a6),a0
	addq.w	#6,a0
	move.b	($0019,a6),d3
	move.b	#$60,d1			;'`'
	add.b	($0018,a6),d1
	moveq.l	#$03,d4
L000afc:
	move.b	(a0)+,d2
	lsr.b	#1,d3
	bcc	L000b0e
	add.b	d0,d2
	bpl	L000b0a
	move.b	#$7f,d2
L000b0a:
	bsr	WriteOPM
L000b0e:
	addq.b	#8,d1
	dbra	d4,L000afc
L000b14:
	rts

VolumeTable:
	.dc.b	$2a,$28,$25,$22,$20,$1d,$1a,$18,$15,$12,$10,$0d,$0a,$08,$05,$02
WritePan:
	bclr.b	#$02,($0017,a6)
	beq	L000b3c
	move.b	($001c,a6),d2
	moveq.l	#$20,d1			;' '
	add.b	($0018,a6),d1
	bra	WriteOPM

L000b3c:
	rts

L000b3e:
	bset.b	#$03,($0016,a6)
	bne	L000b3c
	tst.b	($0018,a6)
	bmi	L000b68
	move.b	($001d,a6),d2
	lea.l	($1280,pc),a2
	move.b	d2,(a2,d7.w)
	lea.l	($0bf0,pc),a2
	move.b	d2,(a2,d7.w)
	move.b	#$08,d1
	bra	WriteOPM

L000b68:
	move.b	($0025,a5),d0
	beq	L000c06
	tst.b	(-$0403,a5)
	bne	L000c06
	moveq.l	#$00,d0
	move.w	($0012,a6),d0
	lsr.w	#6,d0
	move.b	($001c,a6),d2
	move.b	d2,d1
	and.w	#$0003,d1
	beq	L000b92
	cmp.w	#$0003,d1
	bne	L000b96
L000b92:
	eori.w	#$0003,d1
L000b96:
	and.w	#$001c,d2
	lsl.w	#6,d2
	or.w	d1,d2
	tst.b	(-$0418,a5)
	bne	L000c08
	tst.b	(-$03f7,a5)
	beq	L000bae
	andi.b	#$fc,d2
L000bae:
	lsl.w	#3,d0
	movea.l	($0020,a5),a1
	lea.l	(a1,d0.w),a0
	adda.l	(a0)+,a1
	addq.w	#2,a0
	move.w	(a0)+,d3
	beq	L000c06
	movea.l	($0088),a2
	move.l	(-$0008,a2),d0
	cmp.l	#$50434d34,d0		;'PCM4'
	beq	L000bd8
	cmp.l	#$50434d38,d0		;'PCM8'
	bne	L000be6
L000bd8:
	move.w	#$0101,d0
	trap	#2
	move.w	#$0100,d0
	trap	#2
	bra	L000bec

L000be6:
	moveq.l	#$67,d0			;'g'
	moveq.l	#$00,d1
	trap	#15
L000bec:
	moveq.l	#$60,d0			;'`'
	move.w	d2,d1
	moveq.l	#$00,d2
	move.w	d3,d2
	trap	#15
	lea.l	($11da,pc),a2
	clr.b	(a2,d7.w)
	lea.l	($0b4a,pc),a2
	clr.b	(a2,d7.w)
L000c06:
	rts

L000c08:
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
	beq	L000c06
	adda.l	(a0),a1
	lea.l	($11b4,pc),a0
	cmpa.l	a0,a1
	bcs	L000c90
	move.l	a1,d0
	add.l	d3,d0
	bcs	L000c90
	cmp.l	(-$065c,a5),d0
	bcc	L000c90
	move.w	d7,d0
	subq.w	#8,d0
	moveq.l	#$00,d1
	move.b	($0022,a6),d1
	bclr.l	#$07,d1
	bne	L000c54
	lea.l	(VolumeTable,pc),a2
	move.b	(a2,d1.w),d1
L000c54:
	add.b	($0d54,pc),d1
	bmi	L000c60
	cmp.b	#$2b,d1			;'+'
	bcs	L000c66
L000c60:
	moveq.l	#$00,d1
	clr.b	d2
	bra	L000c6a

L000c66:
	move.b	(PCMVolumeTable,pc,d1.w),d1
L000c6a:
	swap.w	d1
	move.w	d2,d1
	moveq.l	#$00,d2
	trap	#2
	move.w	d7,d0
	subq.w	#8,d0
	move.l	d3,d2
	andi.l	#$00ffffff,d2
	trap	#2
	lea.l	($1150,pc),a2
	clr.b	($0008,a2)
	lea.l	($0ac0,pc),a2
	clr.b	(a2,d7.w)
L000c90:
	rts

PCMVolumeTable:
	.dc.b	$0f,$0f,$0f,$0e,$0e,$0e,$0d,$0d,$0d,$0c,$0c,$0b,$0b,$0b,$0a,$0a
	.dc.b	$0a,$09,$09,$08,$08,$08,$07,$07,$07,$06,$06,$05,$05,$05,$04,$04
	.dc.b	$04,$03,$03,$02,$02,$02,$01,$01,$01,$00,$00,$ff
L000cbe:
	bclr.b	#$03,($0016,a6)
	beq	L000d06
	move.b	($0018,a6),d2
	bmi	L000ce2
	moveq.l	#$08,d1
	lea.l	($1102,pc),a2
	move.b	d2,(a2,d7.w)
	lea.l	($0a72,pc),a2
	move.b	d2,(a2,d7.w)
	bra	WriteOPM

L000ce2:
	move.b	($0025,a5),d0
	beq	L000d06
	tst.b	(-$0403,a5)
	bne	L000d06
	tst.b	(-$0418,a5)
	beq	L000d08
	move.w	d7,d0
	subq.w	#8,d0
	moveq.l	#$00,d1
	move.b	($0022,a6),d1
	swap.w	d1
	move.w	d2,d1
	moveq.l	#$00,d2
	trap	#2
L000d06:
	rts

L000d08:
	movea.l	($0088),a0
	move.l	(-$0008,a0),d0
	cmp.l	#$50434d34,d0		;'PCM4'
	beq	L000d20
	cmp.l	#$50434d38,d0		;'PCM8'
	bne	L000d2e
L000d20:
	move.w	#$0101,d0
	trap	#2
	move.w	#$0100,d0
	trap	#2
	rts

L000d2e:
	moveq.l	#$67,d0			;'g'
	moveq.l	#$00,d1
	trap	#15
	rts

L000d36:
	tst.b	($0018,a6)
	bmi	L000d78
	tst.b	($0016,a6)
	bpl	L000d50
	tst.b	($0020,a6)
	bne	L000d50
	move.l	($0008,a6),d0
	add.l	d0,($000c,a6)
L000d50:
	tst.b	($0024,a6)
	beq	L000d62
	tst.b	($0020,a6)
	bne	L000d78
	tst.b	($0025,a6)
	bne	L000d7a
L000d62:
	btst.b	#$05,($0016,a6)
	beq	L000d6c
	bsr	L000d9a
L000d6c:
	btst.b	#$06,($0016,a6)
	beq	L000d78
	bsr	L000dfc
L000d78:
	rts

L000d7a:
	subq.b	#1,($0025,a6)
	bne	L000d98
	btst.b	#$05,($0016,a6)
	beq	L000d8c
	bsr	L001252
L000d8c:
	btst.b	#$06,($0016,a6)
	beq	L000d98
	bsr	L0012c0
L000d98:
	rts

L000d9a:
	move.l	($0032,a6),d1
	movea.l	($0026,a6),a0
	jmp	(a0)

	add.l	d1,($0036,a6)
	subq.w	#1,($003e,a6)
	bne	L000db8
	move.w	($003c,a6),($003e,a6)
	neg.l	($0036,a6)
L000db8:
	rts

L000dba:
	move.l	d1,($0036,a6)
	subq.w	#1,($003e,a6)
	bne	L000dce
	move.w	($003c,a6),($003e,a6)
	neg.l	($0032,a6)
L000dce:
	rts

L000dd0:
	add.l	d1,($0036,a6)
	subq.w	#1,($003e,a6)
	bne	L000de4
	move.w	($003c,a6),($003e,a6)
	neg.l	($0032,a6)
L000de4:
	rts

L000de6:
	subq.w	#1,($003e,a6)
	bne	L000dfa
	bsr	L000e60
	muls.w	d1,d0
	move.l	d0,($0036,a6)
	move.w	($003c,a6),($003e,a6)
L000dfa:
	rts

L000dfc:
	move.w	($0048,a6),d1
	movea.l	($0040,a6),a0
	jmp	(a0)

	add.w	d1,($004a,a6)
	subq.w	#1,($004e,a6)
	bne	L000e1c
	move.w	($004c,a6),($004e,a6)
	move.w	($0046,a6),($004a,a6)
L000e1c:
	rts

L000e1e:
	subq.w	#1,($004e,a6)
	bne	L000e32
	move.w	($004c,a6),($004e,a6)
	add.w	d1,($004a,a6)
	neg.w	($0048,a6)
L000e32:
	rts

L000e34:
	add.w	d1,($004a,a6)
	subq.w	#1,($004e,a6)
	bne	L000e48
	move.w	($004c,a6),($004e,a6)
	neg.w	($0048,a6)
L000e48:
	rts

L000e4a:
	subq.w	#1,($004e,a6)
	bne	L000e5e
	bsr	L000e60
	muls.w	d0,d1
	move.w	($004c,a6),($004e,a6)
	move.w	d1,($004a,a6)
L000e5e:
	rts

L000e60:
	move.w	(-$0f2c,a5),d0
	mulu.w	#$c549,d0
	add.l	#$0000000c,d0
	move.w	d0,(-$0f2c,a5)
	lsr.l	#8,d0
	rts

L000e76:
	.dc.w	$1234
L000e78:
	lea.l	($0b12,pc),a0
	tst.b	(a0,d7.w)
L000e80:
	bne	L000e84
	rts

L000e84:
	clr.b	(a0,d7.w)
L000e88:
	cmp.w	#$0009,d7
	bcc	L000e92
	clr.b	($27,a5,d7.w)
L000e92:
	bclr.b	#$03,($0017,a6)
	bra	L000eba

L000e9a:
	btst.b	#$03,($0017,a6)
	bne	L000e78
	btst.b	#$02,($0016,a6)
	bne	L000eb4
	subq.b	#1,($001b,a6)
	bne	L000eb4
	bsr	L000cbe
L000eb4:
	subq.b	#1,($001a,a6)
	bne	L000f10
L000eba:
	movea.l	(a6),a4
	bclr.b	#$02,($0016,a6)
	bclr.b	#$07,($0016,a6)
	moveq.l	#$00,d0
	moveq.l	#$00,d1
	move.b	(a4)+,d0
	move.b	d0,d1
	bpl	L000f02
	cmp.b	#$e0,d0
	bcc	L000f1a
	and.w	#$007f,d0
	lsl.w	#6,d0
	addq.w	#5,d0
	add.w	($0010,a6),d0
	move.w	d0,($0012,a6)
	bset.b	#$00,($0016,a6)
	move.b	($001f,a6),($0020,a6)
	moveq.l	#$00,d0
	move.b	(a4)+,d0
	move.b	($001e,a6),d1
	bmi	L000f12
	mulu.w	d0,d1
	lsr.w	#3,d1
L000f02:
	addq.w	#1,d1
	move.b	d1,($001b,a6)
	addq.w	#1,d0
	move.b	d0,($001a,a6)
	move.l	a4,(a6)
L000f10:
	rts

L000f12:
	add.b	d0,d1
	bcs	L000f02
	moveq.l	#$00,d1
	bra	L000f02

L000f1a:
	ext.w	d0
	not.w	d0
	add.w	d0,d0
	move.w	(L000f2c,pc,d0.w),d0
	pea.l	(-$005e,pc)
	jmp	(L000f2c,pc,d0.w)

L000f2c:
	.dc.w	SetTempoCommandFunc-L000f2c
	.dc.w	WriteOPMCommandFunc-L000f2c
	.dc.w	SetVoiceCommandFunc-L000f2c
	.dc.w	PanCommandFunc-L000f2c
	.dc.w	VolumeCommandFunc-L000f2c
	.dc.w	VolumeDownCommandFunc-L000f2c
	.dc.w	VolumeUpCommandFunc-L000f2c
	.dc.w	SetNoteLengthCommandFunc-L000f2c
	.dc.w	SetLegatoCommandFunc-L000f2c
	.dc.w	RepeatStartCommandFunc-L000f2c
	.dc.w	RepeatEndCommandFunc-L000f2c
	.dc.w	RepeatEscapeCommandFunc-L000f2c
	.dc.w	DetuneCommandFunc-L000f2c
	.dc.w	PortamentoCommandFunc-L000f2c
	.dc.w	PerformanceEndCommandFunc-L000f2c
	.dc.w	KeyOnDelayCommandFunc-L000f2c
	.dc.w	SyncSendCommandFunc-L000f2c
	.dc.w	SyncWaitCommandFunc-L000f2c
	.dc.w	SetNoiseFreqCommandFunc-L000f2c
	.dc.w	PitchModulationCommandFunc-L000f2c
	.dc.w	AmplitudeModulationCommandFunc-L000f2c
	.dc.w	OPMLFOCommandFunc-L000f2c
	.dc.w	SetLFOKeyOnDelayCommandFunc-L000f2c
	.dc.w	EnablePCM8CommandFunc-L000f2c
	.dc.w	FadeOutCommandFunc-L000f2c
	.dc.w	EndPlayCommand-L000f2c
	.dc.w	EndPlayCommand-L000f2c
	.dc.w	EndPlayCommand-L000f2c
	.dc.w	EndPlayCommand-L000f2c
	.dc.w	EndPlayCommand-L000f2c
	.dc.w	EndPlayCommand-L000f2c
	.dc.w	EndPlayCommand-L000f2c
SetTempoCommandFunc:
	moveq.l	#$12,d1
	move.b	(a4)+,d2
	tst.b	(-$0404,a5)
	bne	L000f7e
	move.b	d2,(-$0400,a5)
	bra	WriteOPM

L000f7e:
	rts

WriteOPMCommandFunc:
	move.b	(a4)+,d1
	move.b	(a4)+,d2
	cmp.b	#$12,d1
	bne	L000f94
	tst.b	(-$0404,a5)
	bne	L000f7e
	move.b	d2,(-$0400,a5)
L000f94:
	bra	WriteOPM

SetVoiceCommandFunc:
	tst.b	($0018,a6)
	bmi	L000fba
	move.b	(a4)+,d0
	movea.l	($001c,a5),a0
	bra	L000faa

L000fa6:
	lea.l	($001a,a0),a0
L000faa:
	cmp.b	(a0)+,d0
	bne	L000fa6
	move.l	a0,($0004,a6)
	bset.b	#$01,($0017,a6)
	rts

L000fba:
	move.b	(a4)+,($0004,a6)
	rts

PanCommandFunc:
	tst.b	($0018,a6)
	bmi	L000fdc
	move.b	($001c,a6),d0
	ror.w	#6,d0
	move.b	(a4)+,d0
	rol.w	#6,d0
	move.b	d0,($001c,a6)
	bset.b	#$02,($0017,a6)
	rts

L000fdc:
	move.b	(a4)+,d0
	beq	L000fe6
	cmp.b	#$03,d0
	bne	L000fea
L000fe6:
	eori.b	#$03,d0
L000fea:
	andi.b	#$fc,($001c,a6)
	or.b	d0,($001c,a6)
	rts

VolumeCommandFunc:
	move.b	(a4)+,($0022,a6)
	bset.b	#$00,($0017,a6)
	rts

VolumeDownCommandFunc:
	move.b	($0022,a6),d2
	bmi	L001016
	beq	L001014
L00100a:
	subq.b	#1,($0022,a6)
	bset.b	#$00,($0017,a6)
L001014:
	rts

L001016:
	cmp.b	#-$01,d2
	bne	L00102a
	rts

VolumeUpCommandFunc:
	move.b	($0022,a6),d2
	bmi	L001036
	cmp.b	#$0f,d2
	beq	L001034
L00102a:
	addq.b	#1,($0022,a6)
	bset.b	#$00,($0017,a6)
L001034:
	rts

L001036:
	cmp.b	#$80,d2
	bne	L00100a
	rts

SetNoteLengthCommandFunc:
	move.b	(a4)+,($001e,a6)
	rts

SetLegatoCommandFunc:
	bset.b	#$02,($0016,a6)
	rts

RepeatStartCommandFunc:
	move.b	(a4)+,(a4)+
	rts

RepeatEndCommandFunc:
	move.b	(a4)+,-(a7)
	move.w	(a7)+,d0
	move.b	(a4)+,d0
	subq.b	#1,(-$01,a4,d0.w)
	beq	L00106a
	adda.w	d0,a4
	move.b	(-$0401,a5),d0
	beq	L00106a
	cmp.b	(-$0002,a4),d0
	bls	L0010b4
L00106a:
	rts

RepeatEscapeCommandFunc:
	move.b	(a4)+,-(a7)
	move.w	(a7)+,d0
	move.b	(a4)+,d0
	lea.l	(a4,d0.w),a0
	move.b	(a0)+,-(a7)
	move.w	(a7)+,d0
	move.b	(a0)+,d0
	cmpi.b	#$01,(-$01,a0,d0.w)
	bne	L001086
	movea.l	a0,a4
L001086:
	rts

DetuneCommandFunc:
	move.b	(a4)+,-(a7)
	move.w	(a7)+,d0
	move.b	(a4)+,d0
	move.w	d0,($0010,a6)
	rts

PortamentoCommandFunc:
	move.b	(a4)+,-(a7)
	move.w	(a7)+,d0
	move.b	(a4)+,d0
	ext.l	d0
	asl.l	#8,d0
	move.l	d0,($0008,a6)
	bset.b	#$07,($0016,a6)
	rts

PerformanceEndCommandFunc:
	move.b	(a4)+,-(a7)
	beq	L00110a
	move.w	(a7)+,d0
	move.b	(a4)+,d0
	adda.w	d0,a4
L0010b4:
	move.w	($08fa,pc),d0
	bclr.l	d7,d0
	move.w	d0,(-$03f2,a5)
	tst.w	d0
	bne	L001108
	tst.b	(-$03f4,a5)
	bne	L0010e0
	move.w	#$01ff,(-$03f2,a5)
	tst.b	(-$0418,a5)
	beq	L0010da
	ori.w	#$fe00,(-$03f2,a5)
L0010da:
	addq.w	#1,($003a,a5)
	bra	L001108

L0010e0:
	tst.b	(-$03f5,a5)
	bne	L001108
	move.w	#$01ff,(-$03f2,a5)
	tst.b	(-$0418,a5)
	beq	L0010f8
	ori.w	#$fe00,(-$03f2,a5)
L0010f8:
	subq.w	#1,(-$03ea,a5)
	bne	L001108
	move.w	#$0011,(-$03ee,a5)
	st.b	(-$03f5,a5)
L001108:
	rts

L00110a:
	addq.w	#2,a7
EndPlayCommand:
	lea.l	(L001574,pc),a4
	move.w	($089e,pc),d0
	bclr.l	d7,d0
	move.w	d0,(-$03f2,a5)
	move.w	($0880,pc),d0
	bclr.l	d7,d0
	move.w	d0,(-$0406,a5)
	tst.w	d0
	bne	L001180
	move.b	#$01,(-$03f9,a5)
	movea.l	($0088),a0
	move.l	(-$0008,a0),d0
	cmp.l	#$50434d34,d0		;'PCM4'
	beq	L001146
	cmp.l	#$50434d38,d0		;'PCM8'
	bne	L001152
L001146:
	move.w	#$0101,d0
	trap	#2
	move.w	#$0100,d0
	trap	#2
L001152:
	tst.b	(-$0418,a5)
	beq	L001162
	move.w	#$01ff,d0
	trap	#2
	clr.b	(-$0418,a5)
L001162:
	tst.b	(-$03f4,a5)
	bne	L001170
	move.w	#$ffff,($003a,a5)
	bra	L001180

L001170:
	move.w	#$ffff,(-$03ee,a5)
	st.b	(-$03f5,a5)
	move.w	#$0037,(-$03f8,a5)	;'7'
L001180:
	rts

KeyOnDelayCommandFunc:
	move.b	(a4)+,($001f,a6)
	rts

SyncSendCommandFunc:
	moveq.l	#$00,d0
	move.b	(a4)+,d0
	lea.l	($07fe,pc),a0
	st.b	(a0,d0.w)
	cmp.w	#$0009,d0
	bcc	L00119e
	st.b	($27,a5,d0.w)
L00119e:
	rts

SyncWaitCommandFunc:
	lea.l	($07ea,pc),a0
	tst.b	(a0,d7.w)
	beq	L0011c0
	clr.b	(a0,d7.w)
	cmp.w	#$0009,d7
	bcc	L0011b8
	clr.b	($27,a5,d7.w)
L0011b8:
	bclr.b	#$03,($0017,a6)
	rts

L0011c0:
	bset.b	#$03,($0017,a6)
	move.l	a4,(a6)
	addq.w	#4,a7
	rts

SetNoiseFreqCommandFunc:
	move.b	(a4)+,d2
	tst.b	($0018,a6)
	bmi	L0011de
	move.b	d2,($0026,a5)
	moveq.l	#$0f,d1
	bra	WriteOPM

L0011de:
	lsl.b	#2,d2
	andi.b	#$03,($001c,a6)
	or.b	d2,($001c,a6)
	rts

PitchModulationCommandFunc:
	bset.b	#$05,($0016,a6)
	moveq.l	#$00,d1
	move.b	(a4)+,d1
	bmi	L001266
	move.w	d1,-(a7)
	andi.b	#$03,d1
	add.w	d1,d1
	move.w	(L001278,pc,d1.w),d0
	lea.l	(L001278,pc,d0.w),a0
	move.l	a0,($0026,a6)
	move.b	(a4)+,-(a7)
	move.w	(a7)+,d2
	move.b	(a4)+,d2
	move.w	d2,($003c,a6)
	cmp.b	#$02,d1
	beq	L001226
	lsr.w	#1,d2
	cmpi.b	#$06,d1
	bne	L001226
	moveq.l	#$01,d2
L001226:
	move.w	d2,($003a,a6)
	move.b	(a4)+,-(a7)
	move.w	(a7)+,d0
	move.b	(a4)+,d0
	ext.l	d0
	asl.l	#8,d0
	move.w	(a7)+,d1
	cmpi.b	#$04,d1
	bcs	L001242
	asl.l	#8,d0
	andi.b	#$03,d1
L001242:
	move.l	d0,($002e,a6)
	cmp.b	#$02,d1
	beq	L00124e
	moveq.l	#$00,d0
L00124e:
	move.l	d0,($002a,a6)
L001252:
	move.w	($003a,a6),($003e,a6)
	move.l	($002e,a6),($0032,a6)
	move.l	($002a,a6),($0036,a6)
	rts

L001266:
	and.b	#$01,d1
	bne	L001252
	bclr.b	#$05,($0016,a6)
	clr.l	($0036,a6)
	rts

L001278:
	.dc.w	L000da4-L001278
	.dc.w	L000dba-L001278
	.dc.w	L000dd0-L001278
	.dc.w	L000de6-L001278
AmplitudeModulationCommandFunc:
	bset.b	#$06,($0016,a6)
	moveq.l	#$00,d2
	move.b	(a4)+,d2
	bmi	L0012d4
	add.w	d2,d2
	move.w	(L0012e6,pc,d2.w),d0
	lea.l	(L0012e6,pc,d0.w),a0
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
	bne	L0012b6
	muls.w	d1,d0
L0012b6:
	neg.w	d0
	bpl	L0012bc
	moveq.l	#$00,d0
L0012bc:
	move.w	d0,($0046,a6)
L0012c0:
	move.w	($004c,a6),($004e,a6)
	move.w	($0044,a6),($0048,a6)
	move.w	($0046,a6),($004a,a6)
	rts

L0012d4:
	and.b	#$01,d2
	bne	L0012c0
	bclr.b	#$06,($0016,a6)
	clr.w	($004a,a6)
	rts

L0012e6:
	.dc.w	L000e06-L0012e6
	.dc.w	L000e1e-L0012e6
	.dc.w	L000e34-L0012e6
	.dc.w	L000e4a-L0012e6
OPMLFOCommandFunc:
	move.b	(a4)+,d2
	bmi	L001338
	bclr.b	#$01,($0016,a6)
	bclr.l	#$06,d2
	beq	L001304
	bset.b	#$01,($0016,a6)
L001304:
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
L001330:
	moveq.l	#$38,d1			;'8'
	add.b	($0018,a6),d1
	bra	WriteOPM

L001338:
	and.b	#$01,d2
	beq	L001330
	move.b	($0021,a6),d2
	bra	L001330

SetLFOKeyOnDelayCommandFunc:
	move.b	(a4)+,($0024,a6)
	rts

EnablePCM8CommandFunc:
	movea.l	($0088),a0
	cmpa.l	#$00f00000,a0
	bcc	L001380
	cmpi.l	#$50434d34,(-$0008,a0)	;'PCM4'
	beq	L00136a
	cmpi.l	#$50434d38,(-$0008,a0)	;'PCM8'
	bne	L001380
L00136a:
	st.b	(-$0418,a5)
	move.w	#$01fe,d0
	trap	#2
	ori.w	#$fe00,(-$03f2,a5)
	ori.w	#$fe00,(-$0406,a5)
L001380:
	rts

FadeOutCommandFunc:
	moveq.l	#$00,d0
	move.b	(a4)+,d0
	cmp.w	#$0002,d0
	bcc	EndPlayCommand
	add.w	d0,d0
	move.w	(L001398,pc,d0.w),d0
	jmp	(L001398,pc,d0.w)

L001398:
	.dc.w	EndPlayCommand-L001398
	.dc.w	L00139c-L001398
L00139c:
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
	lea.l	($0610,pc),a2
	move.b	d2,(a2,d1.w)
	move.b	d2,($00e90003)
	andi.w	#$faff,sr
	cmp.b	#$1b,d1
	beq	L0013da
	rts

L0013da:
	move.b	d2,($09da)
	rts

Start:
	clr.l	-(a7)
	DOS	_SUPER
	pea.l	(L001577,pc)
	DOS	_PRINT
	lea.l	(WorkAreaEnd,pc),a5
	move.w	#$0001,(-$03fa,a5)
	clr.l	(-$0404,a5)
	move.l	($0008,a0),(-$065c,a5)
	move.l	#$00010000,($0014,a5)
	move.l	#$0004e000,($0018,a5)
	clr.b	($0024,a5)
	clr.b	($0025,a5)
	addq.w	#1,a2
	bsr	L001478
	lea.l	($09c2,pc),a4
	lea.l	($05aa,pc),a1
	move.l	a4,(a1)
	adda.l	($0014,a5),a4
	move.l	a4,($0004,a1)
	adda.l	($0018,a5),a4
	cmpa.l	($0008,a0),a4
	bhi	L001562
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

L001458:
	movea.l	($0090),a4
	cmpa.l	#$00fe0000,a4
	bcc	L001476
	subq.w	#8,a4
	lea.l	(L000004,pc),a3
	move.w	#$0004,d0
L00146e:
	cmpm.b	(a3)+,(a4)+
	bne	L001476
	dbra	d0,L00146e
L001476:
	rts

L001478:
	move.b	(a2)+,d0
	bne	L001484
	bsr	L001458
	beq	L00155c
	rts

L001484:
	cmp.b	#$20,d0			;' '
	beq	L001478
	cmp.b	#$09,d0
	beq	L001478
	cmp.b	#$2d,d0			;'-'
	beq	L00149e
	cmp.b	#$2f,d0			;'/'
	bne	L001568
L00149e:
	move.b	(a2)+,d0
	beq	L001568
	or.b	#$20,d0
	cmp.b	#$72,d0			;'r'
	bne	L0014ce
	bsr	L001458
	bne	L001556
	moveq.l	#$00,d0
	trap	#4
	tst.l	d0
	bne	L0014c8
	pea.l	(L0016cd,pc)
L0014c0:
	DOS	_PRINT
	addq.w	#4,a7
	clr.w	-(a7)
	DOS	_EXIT2

L0014c8:
	pea.l	(L001726,pc)
	bra	L0014c0

L0014ce:
	bsr	L001458
	beq	L00155c
	cmp.b	#$6d,d0			;'m'
	bne	L0014ea
	cmpi.b	#$3a,(a2)		;':'
	bne	L0014e2
	addq.w	#1,a2
L0014e2:
	bsr	L001530
	move.l	d0,($0014,a5)
	bra	L001478

L0014ea:
	cmp.b	#$70,d0			;'p'
	bne	L001502
	cmpi.b	#$3a,(a2)		;':'
	bne	L0014f8
	addq.w	#1,a2
L0014f8:
	bsr	L001530
	move.l	d0,($0018,a5)
	bra	L001478

L001502:
	cmpi.b	#$66,d0			;'f'
	bne	L001568
	cmpi.b	#$3a,(a2)		;':'
	bne	L001510
	addq.w	#1,a2
L001510:
	move.l	a2,-(a7)
	bsr	L001530
	cmpa.l	(a7)+,a2
	beq	L001524
	lsr.l	#8,d0
	lsr.l	#2,d0
	andi.l	#$00007fff,d0
	bra	L001526

L001524:
	moveq.l	#$11,d0
L001526:
	move.w	d0,($00000852).l
	bra	L001478

L001530:
	moveq.l	#$00,d0
L001532:
	moveq.l	#$00,d1
	move.b	(a2),d1
	sub.b	#$30,d1			;'0'
	bcs	L00154c
	cmp.b	#$09,d1
	bhi	L00154c
	mulu.w	#$000a,d0
	add.l	d1,d0
	addq.w	#1,a2
	bra	L001532

L00154c:
	tst.l	d0
	bmi	L001568
	moveq.l	#$0a,d1
	lsl.l	d1,d0
	rts

L001556:
	pea.l	(L001707,pc)
	bra	L00156c

L00155c:
	pea.l	(L0016e4,pc)
	bra	L00156c

L001562:
	pea.l	(L0016b3,pc)
	bra	L00156c

L001568:
	pea.l	(L0015d4,pc)
L00156c:
	DOS	_PRINT
	move.w	#$ffff,-(a7)
	DOS	_EXIT2

L001574:
	.dc.b	$7f,$f1,$00
L001577:
	.dc.b	'X68k MXDRV music driver version 2.06+16 Rel.1 (c)1988-91 milk.,K.MAEKAWA, Missy.M, Yatsube',$0d,$0a,$00
L0015d4:
	.dc.b	'使い方: mxdrv [switch]',$0d,$0a
	.dc.b	$09,'-m:<num> MMLバッファサイズ(Kbytes)           [省略時 64]',$0d,$0a
	.dc.b	$09,'-p:<num> PCMバッファサイズ(Kbytes)           [省略時312]',$0d,$0a
	.dc.b	$09,'-f:<num> FADEOUT SPEED (FAST 0 - 32767 SLOW) [省略時 23]',$0d,$0a
	.dc.b	$09,'-r       mxdrv解除',$0d,$0a,$00
L0016b3:
	.dc.b	$09,'メモリが不足しています',$0d,$0a,$00
L0016cd:
	.dc.b	$09,'mxdrvを解除しました',$0d,$0a,$00
L0016e4:
	.dc.b	$09,'mxdrvはすでに組み込まれています',$0d,$0a,$00
L001707:
	.dc.b	$09,'mxdrvは組み込まれていません',$0d,$0a,$00
L001726:
	.dc.b	$09,'mxdrvを解除出来ませんでした',$0d,$0a,$00,$00

	.bss

L001746:
	.ds.b	2
UnknownArray1:
	.ds.b	16
UnknownVar1:
	.ds.b	562
UnknownVar2:
	.ds.b	22
UnknownVar3:
	.ds.b	2
UnknownVar4:
	.ds.b	6
UnknownVar5:
	.ds.b	3
UnknownVar6:
	.ds.b	7
UnknownVar7:
	.ds.b	30
OPMBufPtr:
	.ds.b	256
WorkArea:
	.ds.b	722
WorkAreaEnd:
	.ds.b	46
UnknownArray2:
	.ds.b	14

	.stack

Lffffff:

	.end	Start
