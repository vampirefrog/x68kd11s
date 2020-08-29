;=============================================
;  Filename mxdrv/2.06+15/mxdrv.x
;
;
;  Base address 000000
;  Exec address 0014ca
;  Text size    0018ba byte(s)
;  Data size    000000 byte(s)
;  Bss  size    000456 byte(s)
;  349 Labels
;
;  Commandline dis  -h -k -m68030 -q1 -B -M -w16 -o120 -gmxdrv/2.06+15/mxdrv.lab --overwrite mxdrv/2.06+15/mxdrv.x mxdrv/2.06+15/mxdrv.s
;          DIS version 3.16
;=============================================

	.include	inc/doscall.mac
	.include	inc/iocscall.mac
	.include	inc/fefunc.mac

	.cpu	68030

	.text

L000000:
	.dc.b	'EX15'
L000004:
	.dc.b	'mxdrv206'
Trap4Handler:
	movem.l	d1-d7/a0-a6,-(a7)
	lea.l	(L001cd4,pc),a5
	and.w	#$001f,d0
	add.w	d0,d0
	move.w	(MXDRVCallTable,pc,d0.w),d0
	jsr	(MXDRVCallTable,pc,d0.w)
	movem.l	(a7)+,d1-d7/a0-a6
L_Nop:
	rte

MXDRVCallTable:
	.dc.w	MXDRVFree-MXDRVCallTable
	.dc.w	MXDRVError-MXDRVCallTable
	.dc.w	L_SETMDX-MXDRVCallTable
	.dc.w	L_SETPDX-MXDRVCallTable
	.dc.w	L_PLAY-MXDRVCallTable
	.dc.w	L_STOP-MXDRVCallTable
	.dc.w	L_PAUSE-MXDRVCallTable
	.dc.w	L_CONT-MXDRVCallTable
	.dc.w	L_GetMDXTitle-MXDRVCallTable
	.dc.w	L_GetPDXFilename-MXDRVCallTable
	.dc.w	L_0A-MXDRVCallTable
	.dc.w	L_0B-MXDRVCallTable
	.dc.w	L_FadeOut-MXDRVCallTable
	.dc.w	L_0D-MXDRVCallTable
	.dc.w	L_SetChannelMask-MXDRVCallTable
	.dc.w	L_PlayWithMask-MXDRVCallTable
	.dc.w	L_GetOPMBuf-MXDRVCallTable
	.dc.w	L_11-MXDRVCallTable
	.dc.w	L_GetPlaybackFlags-MXDRVCallTable
	.dc.w	L_SetIgnoreKeys-MXDRVCallTable
	.dc.w	L_14-MXDRVCallTable
	.dc.w	L_15-MXDRVCallTable
	.dc.w	L_16-MXDRVCallTable
	.dc.w	L_17-MXDRVCallTable
	.dc.w	L_Nop-MXDRVCallTable
	.dc.w	L_Nop-MXDRVCallTable
	.dc.w	L_Nop-MXDRVCallTable
	.dc.w	L_Nop-MXDRVCallTable
	.dc.w	L_Nop-MXDRVCallTable
	.dc.w	L_Nop-MXDRVCallTable
	.dc.w	L_Nop-MXDRVCallTable
	.dc.w	L_Nop-MXDRVCallTable
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
	lea.l	(OPMBuf,pc),a0
	move.l	a0,d0
	rts

L_11:
	lea.l	(L0018d6,pc),a0
	tst.l	d1
	bmi	L000098
	move.b	d1,(a0)
	rts

L000098:
	move.b	(a0),d0
	rts

L_GetPlaybackFlags:
	move.b	(-$03fa,a5),d0
	lsl.w	#8,d0
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
	beq	L000190
	movem.l	d1-d7/a0-a6,-(a7)
	st.b	($0039,a5)
	lea.l	(L0018e6,pc),a0
	lea.l	(L0018df,pc),a1
	tst.b	(a1)
	beq	L000144
	bpl	L0000fc
	move.b	#$7f,(a1)
	move.w	(a0),($0002,a0)
L0000fc:
	tst.w	($0002,a0)
	bmi	L000108
	subq.w	#2,($0002,a0)
	bra	L000144

L000108:
	lea.l	(L0018dc,pc),a1
	cmpi.b	#$0a,(a1)
	bge	L000120
L000112:
	cmpi.b	#$3e,(a1)		;'>'
	bge	L000126
	addq.b	#1,(a1)
	move.w	(a0),($0002,a0)
	bra	L000144

L000120:
	st.b	(-$03f7,a5)
	bra	L000112

L000126:
	tst.b	(-$03f4,a5)
	beq	L000132
	bsr	L0003c4
	bra	L000178

L000132:
	move.b	#$7f,(a1)
	clr.b	(-$03f5,a5)
	move.b	#$01,(-$03f9,a5)
	bsr	L_PAUSE
L000144:
	lea.l	(L0018d4,pc),a0
	move.b	(a0),d2
	moveq.l	#$12,d1
	tst.b	(-$03f9,a5)
	bne	L000178
	lea.l	(L001a04,pc),a6
	moveq.l	#$00,d7
L000158:
	bsr	L000f1c
	bsr	L001072
	move.w	(L0018e4,pc),d0
	btst.l	d7,d0
	bne	L00016c
	bsr	L0007b6
L00016c:
	lea.l	($0050,a6),a6
	addq.w	#1,d7
	cmp.w	#$0009,d7
	bcs	L000158
L000178:
	tst.b	($00e90003)
	bmi	L000178
	move.b	#$1b,($00e90001)
	clr.b	($0039,a5)
	movem.l	(a7)+,d1-d7/a0-a6
L000190:
	move.b	(-$03fa,a5),d0
	lsl.w	#8,d0
	move.b	(-$03f9,a5),d0
	rts

L00019c:
	rts

L_0D:
	cmp.b	#$f0,d1
	beq	L000204
	cmp.b	#$fc,d1
	beq	L0001e0
	tst.l	d1
	bmi	L0001e6
	tst.b	(-$03f4,a5)
	bne	MXDRVError
	move.l	a2,(-$03dc,a5)
	move.l	a1,(-$03e8,a5)
	move.l	a1,(-$03e4,a5)
L0001c2:
	tst.w	(a1)
	beq	L0001ca
	addq.w	#6,a1
	bra	L0001c2

L0001ca:
	subq.w	#6,a1
	move.l	a1,(-$03e0,a5)
	st.b	(-$03f4,a5)
	st.b	(-$03f3,a5)
	movea.l	(L0018ec,pc),a0
	bra	L0003d2

L0001e0:
	move.b	(L0018e1,pc),d0
	rts

L0001e6:
	clr.b	(-$03f4,a5)
	clr.b	($0024,a5)
	clr.b	($0025,a5)
	movea.l	(L0018fc,pc),a0
	move.l	(a0),($000c,a5)
	move.l	($0004,a0),($0010,a5)
	bra	L000320

L000204:
	bsr	L0001e6
L000206:
	movea.l	(L0018f8,pc),a0
	pea.l	(a0)
	DOS	_MFREE
	addq.w	#4,a7
	moveq.l	#$00,d0
	move.l	d0,(-$03dc,a5)
	move.b	d0,(-$03f3,a5)
	rts

L00021c:
	move.w	sr,-(a7)
	ori.w	#$0700,sr
	clr.b	(-$03f9,a5)
	tst.b	(-$0404,a5)
	bne	L000248
	lea.l	(L000584,pc),a1
	suba.l	a0,a0
	move.l	a1,($010c,a0)
	movea.l	#$00e88000,a0
	ori.b	#$08,($0009,a0)
	ori.b	#$08,($0015,a0)
L000248:
	move.w	(a7)+,sr
	rts

MXDRVFree:
	bsr	L000320
	move.l	(a5),($0090,a0)
	move.l	($0008,a5),($01a8,a0)
	move.l	(-$040a,a5),($01ac,a0)
	move.l	(-$041a,a5),($0580,a0)
	move.l	(-$0416,a5),($0588,a0)
	move.l	(-$0412,a5),($0590,a0)
	move.l	(-$040e,a5),($059c,a0)
	move.b	#$01,($00e92001)
	pea.l	(L000000-$0000f0,pc)
	DOS	_MFREE
	addq.w	#4,a7
	tst.b	(-$03f3,a5)
	beq	L000292
	bra	L000206

L000292:
	rts

L_SETMDX:
	tst.b	(-$03f4,a5)
	beq	L0002a6
	movem.l	d1/a1,-(a7)
	bsr	L000204
	movem.l	(a7)+,d1/a1
L0002a6:
	lea.l	($0024,a5),a2
	movea.l	(L0018fc,pc),a0
	move.l	a0,($000c,a5)
	move.l	($0014,a5),d0
	bra	L0002da

L_SETPDX:
	tst.b	(-$03f4,a5)
	beq	L0002ca
	movem.l	d1/a1,-(a7)
	bsr	L000204
	movem.l	(a7)+,d1/a1
L0002ca:
	lea.l	($0025,a5),a2
	movea.l	(L001900,pc),a0
	move.l	a0,($0010,a5)
	move.l	($0018,a5),d0
L0002da:
	cmp.l	d1,d0
	bcs	L000312
	movem.l	d1/a0-a2,-(a7)
	bsr	L000320
	movem.l	(a7)+,d1/a0-a2
	move.w	d1,d0
	andi.w	#$0003,d0
	lsr.l	#2,d1
	swap.w	d1
L0002f2:
	swap.w	d1
L0002f4:
	move.l	(a1)+,(a0)+
	dbra	d1,L0002f4
	swap.w	d1
	dbra	d1,L0002f2
	tst.w	d0
	beq	L00030c
	subq.w	#1,d0
L000306:
	move.b	(a1)+,(a0)+
	dbra	d0,L000306
L00030c:
	st.b	(a2)
	moveq.l	#$00,d0
	rts

L000312:
	bset.l	#$1f,d0
	rts

L_STOP:
	tst.b	(-$03f4,a5)
	bne	L000204
L000320:
	move.b	#$01,(-$03f9,a5)
	move.w	sr,-(a7)
	ori.w	#$0700,sr
	bsr	L000372
	moveq.l	#$0f,d2
	moveq.l	#$e0,d1
L000332:
	bsr	WriteOPM
	addq.b	#1,d1
	bne	L000332
	lea.l	(L001d04,pc),a0
	moveq.l	#$07,d3
	moveq.l	#$00,d2
	moveq.l	#$08,d1
L000344:
	bsr	WriteOPM
	move.b	d2,(a0)+
	addq.b	#1,d2
	dbra	d3,L000344
	movea.l	#$00e88000,a0
	andi.b	#$f7,($0009,a0)
	andi.b	#$f7,($0015,a0)
	suba.l	a0,a0
	move.l	($0004,a5),($010c,a0)
	move.w	(a7)+,sr
	rts

L_PAUSE:
	st.b	(-$03fa,a5)
L000372:
	moveq.l	#$07,d7
	lea.l	(L001a04,pc),a6
L000378:
	moveq.l	#$7f,d0
	bsr	L000976
	lea.l	($0050,a6),a6
	dbra	d7,L000378
	bra	L000efe

L_CONT:
	clr.b	(-$03fa,a5)
	moveq.l	#$07,d7
	lea.l	(L001a04,pc),a6
L000394:
	bsr	L000948
	lea.l	($0050,a6),a6
	dbra	d7,L000394
L0003a0:
	moveq.l	#$30,d2			;'0'
	move.b	(L0018d0,pc),d1
	bne	L0003aa
	moveq.l	#$3a,d2			;':'
L0003aa:
	moveq.l	#$14,d1
	bra	WriteOPM

L0003b0:
	movea.l	(L0018f0,pc),a0
	movea.l	(L0018ec,pc),a1
	subq.w	#6,a0
	cmpa.l	a1,a0
	bcc	L0003d2
	movea.l	(L0018f4,pc),a0
	bra	L0003d2

L0003c4:
	movea.l	(L0018f0,pc),a0
	addq.w	#6,a0
	tst.w	(a0)
	bne	L0003d2
	movea.l	(L0018ec,pc),a0
L0003d2:
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
	bra	L00040a

L_PLAY:
	clr.w	(-$03f0,a5)
	bra	L00040a

L_PlayWithMask:
	move.w	d1,(-$03f0,a5)
L00040a:
	clr.b	(-$03f8,a5)
	clr.b	(-$03f7,a5)
	clr.b	(-$03f5,a5)
	clr.b	(-$03f9,a5)
	clr.b	(-$03fa,a5)
	move.w	#$01ff,(-$03f2,a5)
	move.w	#$01ff,(-$0406,a5)
	clr.w	($003a,a5)
	move.b	($0024,a5),d0
	beq	MXDRVError
	bsr	L000320
	movea.l	($000c,a5),a2
	move.w	($0002,a2),d1
	bmi	L000466
	tst.b	($0025,a5)
	beq	MXDRVError
	movea.l	($0010,a5),a0
	bra	L00045a

L000452:
	tst.l	(a0)
	beq	MXDRVError
	adda.l	(a0),a0
L00045a:
	dbra	d1,L000452
	adda.w	($0004,a0),a0
	move.l	a0,($0020,a5)
L000466:
	adda.w	($0004,a2),a2
	movea.l	a2,a1
	movea.l	a2,a0
	adda.w	(a1)+,a2
	move.l	a2,($001c,a5)
	lea.l	(L001a04,pc),a6
	lea.l	(L000542,pc),a3
	moveq.l	#$ff,d6
	moveq.l	#$00,d7
L000480:
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
	beq	L0004ea
	moveq.l	#$38,d1			;'8'
	add.b	d7,d1
	moveq.l	#$00,d2
	bsr	WriteOPM
	addq.w	#1,d7
	lea.l	($0050,a6),a6
	bra	L000480

L0004ea:
	move.b	#$10,($001c,a6)
	st.b	($0022,a6)
	st.b	($0018,a6)
	lea.l	($0027,a5),a0
	moveq.l	#$08,d0
L0004fe:
	clr.b	(a0)+
	dbra	d0,L0004fe
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
	bne	L000534
	bsr	WriteOPM
L000534:
	bsr	L00021c
	bsr	L0003a0
	moveq.l	#$00,d0
	rts

MXDRVError:
	moveq.l	#$ff,d0
L000542:
	rts

L_GetMDXTitle:
	tst.b	($0024,a5)
	beq	L000580
	movea.l	($000c,a5),a0
	bra	L000556

L000550:
	tst.w	(a0)
	beq	L000580
	adda.w	(a0),a0
L000556:
	dbra	d1,L000550
	adda.w	($0006,a0),a0
	move.l	a0,d0
	rts

L_GetPDXFilename:
	tst.b	($0025,a5)
	beq	L000580
	movea.l	($0010,a5),a0
	bra	L000574

L00056e:
	tst.l	(a0)
	beq	L000580
	adda.l	(a0),a0
L000574:
	dbra	d1,L00056e
	adda.w	($0006,a0),a0
	move.l	a0,d0
	rts

L000580:
	moveq.l	#$00,d0
	rts

L000584:
	bclr.b	#$03,($00e88015)
	movem.l	d0-d7/a0-a6,-(a7)
	lea.l	(L001cd4,pc),a5
	st.b	($0039,a5)
	eori.w	#$0500,sr
	tst.b	(-$03fa,a5)
	bne	L000602
	lea.l	(L0018e6,pc),a0
	lea.l	(L0018df,pc),a1
	tst.b	(a1)
	beq	L000602
	bpl	L0005b8
	move.b	#$7f,(a1)
	move.w	(a0),($0002,a0)
L0005b8:
	tst.w	($0002,a0)
	bmi	L0005c4
	subq.w	#2,($0002,a0)
	bra	L000602

L0005c4:
	lea.l	(L0018dc,pc),a1
	cmpi.b	#$0a,(a1)
	bge	L0005dc
L0005ce:
	cmpi.b	#$3e,(a1)		;'>'
	bge	L0005e2
	addq.b	#1,(a1)
	move.w	(a0),($0002,a0)
	bra	L000602

L0005dc:
	st.b	(-$03f7,a5)
	bra	L0005ce

L0005e2:
	tst.b	(-$03f4,a5)
	beq	L0005f0
	bsr	L0003c4
	bra	L000790

L0005f0:
	move.b	#$7f,(a1)
	clr.b	(-$03f5,a5)
	move.b	#$01,(-$03f9,a5)
	bsr	L_PAUSE
L000602:
	lea.l	(L0018d4,pc),a0
	move.b	(a0),d2
	moveq.l	#$12,d1
	tst.b	(-$0402,a5)
	bne	L00074c
	move.b	($080e),d7
	and.b	#$0f,d7
	cmp.b	#$05,d7
	beq	L0006b4
	cmp.b	#$09,d7
	beq.w	L0006a8
	cmp.b	#$06,d7
	beq	L0006a2
	cmp.b	#$0a,d7
	beq	L00069a
	cmp.b	#$04,d7
	beq	L0006e8
	cmp.b	#$08,d7
	beq	L0006be
	cmp.b	#$02,d7
	bne	L00074c
	move.b	($080b),d7
	and.b	#$03,d7
	cmpi.b	#$80,($080a)
	beq	L00068a
	cmp.b	#$02,d7
	beq	L00067a
	cmp.b	#$01,d7
	bne	L00074c
	tst.b	(-$03fc,a5)
	bne	L000746
	subq.b	#1,($0002,a0)
	bra	L000746

L00067a:
	tst.b	(-$03fc,a5)
	bne	L000746
	addq.b	#1,($0002,a0)
	bra	L000746

L00068a:
	tst.b	(-$03fc,a5)
	bne	L000746
	clr.b	($0002,a0)
	bra	L000746

L00069a:
	move.b	#$ff,d2
	bra	L000754

L0006a2:
	moveq.l	#$00,d2
	bra	L000754

L0006a8:
	neg.b	d2
	lsr.b	#2,d2
	addq.b	#1,d2
	neg.b	d2
	bra	L000754

L0006b4:
	neg.b	d2
	lsl.b	#1,d2
	neg.b	d2
	bra	L000754

L0006be:
	btst.b	#$01,($080b)
	beq	L00074c
	tst.b	(-$03fa,a5)
	beq	L0006dc
	bpl	L00073a
	tst.b	(-$03fc,a5)
	bne	L000746
	bsr	L_CONT
	bra	L00073a

L0006dc:
	tst.b	(-$03fc,a5)
	bne	L000746
	bsr	L_PAUSE
	bra	L00073a

L0006e8:
	move.b	($080b),d7
	beq	L0006fe
	and.b	#$03,d7
	cmp.b	#$02,d7
	beq	L00072a
	cmp.b	#$01,d7
	beq	L000718
L0006fe:
	cmpi.b	#$80,($080a)
	bne	L00074c
	tst.b	(-$03fc,a5)
	bne	L000746
L00070c:
	.dc.b	$3b,$7c
L00070e:
	.dc.w	$0011,$fc12,$50ed,$fc0b,$602e
L000718:
	tst.b	(-$03fc,a5)
	bne	L000746
	tst.b	(-$03f4,a5)
	beq	L000740
	bsr	L0003b0
	bra	L00073a

L00072a:
	tst.b	(-$03fc,a5)
	bne	L000746
	tst.b	(-$03f4,a5)
	beq	L000740
	bsr	L0003c4
L00073a:
	st.b	(-$03fc,a5)
	bra	L000790

L000740:
	bsr	L_PLAY
	bra	L00073a

L000746:
	st.b	(-$03fc,a5)
	bra	L000750

L00074c:
	clr.b	(-$03fc,a5)
L000750:
	add.b	($0002,a0),d2
L000754:
	tst.b	(-$03fa,a5)
	bne	L000760
	tst.b	(-$03f9,a5)
	beq	L000768
L000760:
	moveq.l	#$00,d2
	bsr	WriteOPM
	bra	L000790

L000768:
	bsr	WriteOPM
	lea.l	(L001a04,pc),a6
	moveq.l	#$00,d7
L000772:
	bsr	L000f1c
	bsr	L001072
	move.w	(L0018e4,pc),d0
	btst.l	d7,d0
	bne	L000784
	bsr	L0007b6
L000784:
	lea.l	($0050,a6),a6
	addq.w	#1,d7
	cmp.w	#$0009,d7
	bcs	L000772
L000790:
	bsr	L0003a0
L000794:
	tst.b	($00e90003)
	bmi	L000794
	move.b	#$1b,($00e90001)
	clr.b	($0039,a5)
	movem.l	(a7)+,d0-d7/a0-a6
	bset.b	#$03,($00e88015)
	rte

L0007b6:
	btst.b	#$00,($0016,a6)
	beq	L00081e
	tst.b	($0020,a6)
	bne	L00081a
	tst.b	($0018,a6)
	bmi	L00080e
	bsr	LoadVoice
	bsr	L0009b8
	btst.b	#$03,($0016,a6)
	bne	L000804
	move.b	($0024,a6),($0025,a6)
	beq	L0007ee
	clr.l	($0036,a6)
	clr.w	($004a,a6)
	bsr	L000f60
L0007ee:
	btst.b	#$01,($0016,a6)
	beq	L000804
	moveq.l	#$01,d1
	moveq.l	#$02,d2
	bsr	WriteOPM
	moveq.l	#$00,d2
	bsr	WriteOPM
L000804:
	clr.l	($000c,a6)
	bsr	L00082c
	bsr	L000948
L00080e:
	bsr	L0009d0
	bclr.b	#$00,($0016,a6)
	rts

L00081a:
	subq.b	#1,($0020,a6)
L00081e:
	tst.b	($0018,a6)
	bmi	L00082a
	bsr	L00082c
	bsr	L000948
L00082a:
	rts

L00082c:
	move.w	($0012,a6),d2
	add.w	($000c,a6),d2
	add.w	($0036,a6),d2
	cmp.w	($0014,a6),d2
	beq	L00086c
	move.w	d2,($0014,a6)
	move.w	#$17ff,d1
	cmp.w	d1,d2
	bls	L000854
	tst.w	d2
	bpl	L000852
	moveq.l	#$00,d2
	bra	L000854

L000852:
	move.w	d1,d2
L000854:
	lsl.w	#2,d2
	moveq.l	#$30,d1			;'0'
	add.b	($0018,a6),d1
	bsr	WriteOPM
	subq.b	#8,d1
	lsr.w	#8,d2
	move.b	(OPMNoteTable,pc,d2.w),d2
	bsr	WriteOPM
L00086c:
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
	beq	L00093e
	movea.l	($0004,a6),a0
	andi.b	#$c0,($001c,a6)
	move.b	(a0)+,d0
	or.b	d0,($001c,a6)
	and.w	#$0007,d0
	move.b	(L000940,pc,d0.w),d3
	move.b	d3,($0019,a6)
	move.b	(a0)+,d0
	lsl.b	#3,d0
	or.b	($0018,a6),d0
	move.b	d0,($001d,a6)
	moveq.l	#$40,d1			;'@'
	add.b	($0018,a6),d1
	moveq.l	#$03,d0
L000906:
	move.b	(a0)+,d2
	bsr	WriteOPM
	addq.b	#8,d1
	dbra	d0,L000906
	moveq.l	#$03,d0
L000914:
	move.b	(a0)+,d2
	lsr.b	#1,d3
	bcc	L00091c
	moveq.l	#$7f,d2
L00091c:
	bsr	WriteOPM
	addq.b	#8,d1
	dbra	d0,L000914
	moveq.l	#$0f,d0
L000928:
	move.b	(a0)+,d2
	bsr	WriteOPM
	addq.b	#8,d1
	dbra	d0,L000928
	st.b	($0023,a6)
	bset.b	#$02,($0017,a6)
L00093e:
	rts

L000940:
	.dc.b	$08,$08,$08,$08,$0c,$0e,$0e,$0f
L000948:
	moveq.l	#$00,d0
	move.b	($0022,a6),d0
	bclr.l	#$07,d0
	bne	L000958
	move.b	(VolumeTable,pc,d0.w),d0
L000958:
	add.b	(L0018dc,pc),d0
	bcs	L000960
	bpl	L000964
L000960:
	move.b	#$7f,d0
L000964:
	add.b	($004a,a6),d0
	bcs	L00096c
	bpl	L000970
L00096c:
	move.b	#$7f,d0
L000970:
	cmp.b	($0023,a6),d0
	beq	L0009a6
L000976:
	move.b	d0,($0023,a6)
	movea.l	($0004,a6),a0
	addq.w	#6,a0
	move.b	($0019,a6),d3
	move.b	#$60,d1			;'`'
	add.b	($0018,a6),d1
	moveq.l	#$03,d4
L00098e:
	move.b	(a0)+,d2
	lsr.b	#1,d3
	bcc	L0009a0
	add.b	d0,d2
	bpl	L00099c
	move.b	#$7f,d2
L00099c:
	bsr	WriteOPM
L0009a0:
	addq.b	#8,d1
	dbra	d4,L00098e
L0009a6:
	rts

VolumeTable:
	.dc.b	$2a,$28,$25,$22,$20,$1d,$1a,$18,$15,$12,$10,$0d,$0a,$08,$05,$02
L0009b8:
	bclr.b	#$02,($0017,a6)
	beq	L0009ce
	move.b	($001c,a6),d2
	moveq.l	#$20,d1			;' '
	add.b	($0018,a6),d1
	bra	WriteOPM

L0009ce:
	rts

L0009d0:
	bset.b	#$03,($0016,a6)
	bne	L0009ce
	tst.b	($0018,a6)
	bmi	L0009f2
	move.b	($001d,a6),d2
	lea.l	(L001d04,pc),a2
	move.b	d2,(a2,d7.w)
	move.b	#$08,d1
	bra	WriteOPM

L0009f2:
	move.w	sr,-(a7)
	ori.w	#$0700,sr
	move.b	($0025,a5),d0
	beq	L000a6e
	tst.b	(-$0403,a5)
	bne	L000a6e
	tst.b	(-$03f7,a5)
	beq	L000a10
	ori.b	#$03,($001c,a6)
L000a10:
	move.w	($0012,a6),d2
	lsr.w	#6,d2
	lsl.w	#3,d2
	movea.l	($0020,a5),a1
	lea.l	(a1,d2.w),a0
	adda.l	(a0)+,a1
	addq.w	#2,a0
	move.w	(a0)+,d3
	beq	L000a6e
	move.b	($001c,a6),d0
	bsr	L000e8e
	lea.l	(L0016b6,pc),a2
	move.l	a1,($0006,a2)
	move.w	d3,($000a,a2)
	cmpi.b	#$ff,(-$03f6,a5)
	bne	L000a72
	movea.l	#$00e840c0,a1
	st.b	(a1)
	move.b	#$3a,($0005,a1)		;':'
	move.l	a2,($001c,a1)
	move.w	#$0003,($001a,a1)
	clr.w	($0c32)
	move.b	#$88,($0007,a1)
	lea.l	(L001d04,pc),a2
	clr.b	(a2,d7.w)
L000a6e:
	move.w	(a7)+,sr
	rts

L000a72:
	move.b	#$80,($0c32)
	st.b	($00e840c0)
	move.b	#$32,($00e840c5)	;'2'
	lea.l	(L0016c8,pc),a2
	move.l	a2,($00e840cc)
	move.w	#$0020,($00e840ca)	;' '
	move.b	#$88,($00e840c7)
	move.w	(a7)+,sr
	rts

L000aa4:
	ori.w	#$0700,sr
	movem.l	d0/a0,-(a7)
	move.b	($0c32),d0
	bmi	L000b1c
	move.b	#$08,($00e92003)
L000aba:
	st.b	($00e840c0)
	lea.l	(L0018d1,pc),a0
	move.b	(a0),d0
	beq	L000ad2
	clr.w	($0c32)
	addq.b	#1,d0
	bcc	L000ad2
	clr.b	(a0)
L000ad2:
	movem.l	(a7)+,d0/a0
	rte

L000ad8:
	cmpi.b	#$82,d0
	bcc	L000aba
	lea.l	(L0018de,pc),a0
	move.b	(a0),($00e9a005)
	st.b	(a0)
	lea.l	(L0016b6,pc),a0
	st.b	($00e840c0)
	move.b	#$3a,($00e840c5)	;':'
	move.l	a0,($00e840dc)
	move.w	#$0003,($00e840da)
	clr.w	($0c32)
	move.b	#$88,($00e840c7)
	movem.l	(a7)+,d0/a0
	rte

L000b1c:
	cmpi.b	#$90,d0
	bcs	L000ad8
	cmpi.b	#$a0,d0
	bcc	L000b72
	move.b	#$12,($0c32)
	lea.l	(L0018de,pc),a0
	cmpi.b	#$ff,(a0)
	beq	L000b40
	move.b	(a0),($00e9a005)
	st.b	(a0)
L000b40:
	st.b	($00e840c0)
	move.b	#$3a,($00e840c5)	;':'
	lea.l	(L0016e8,pc),a0
	move.l	(a0)+,($00e840dc)
	move.w	(a0)+,($00e840da)
	lea.l	(L0018d1,pc),a0
	st.b	(a0)
	move.b	#$88,($00e840c7)
	movem.l	(a7)+,d0/a0
	rte

L000b72:
	move.b	#$22,($0c32)		;'"'
	lea.l	(L0018de,pc),a0
	cmpi.b	#$ff,(a0)
	beq	L000b8a
	move.b	(a0),($00e9a005)
	st.b	(a0)
L000b8a:
	st.b	($00e840c0)
	move.b	#$3e,($00e840c5)	;'>'
	lea.l	(L0016e8,pc),a0
	move.l	(a0)+,($00e840dc)
	lea.l	(L0018d1,pc),a0
	st.b	(a0)
	move.b	#$88,($00e840c7)
	movem.l	(a7)+,d0/a0
	rte

L000bb6:
	ori.w	#$0700,sr
	movem.l	d0/a0,-(a7)
	move.b	($0c32),d0
	move.b	#$08,($00e92003)
	st.b	($00e840c0)
	lea.l	(L0018d1,pc),a0
	move.b	(a0),d0
	beq	L000be2
	clr.w	($0c32)
	addq.b	#1,d0
	bcc	L000be2
	clr.b	(a0)
L000be2:
	movem.l	(a7)+,d0/a0
	rte

L000be8:
	move.w	#$2200,sr
	movem.l	d0-d4/a1,-(a7)
L000bf0:
	tst.b	($0c32)
	bne	L000bf0
	lea.l	(L0018d1,pc),a0
	move.b	#$fe,(a0)
	st.b	($00e840c0)
	move.b	#$10,($00e840c7)
	bsr	L000e58
	move.l	d2,d3
	move.l	d2,d4
	move.l	#$0000ff00,d2
	moveq.l	#$03,d0
	cmp.l	d2,d4
	bls	L000c24
	move.l	d2,d4
	moveq.l	#$02,d0
L000c24:
	lea.l	(L0016c8,pc),a0
	st.b	($00e840c0)
	move.b	#$32,($00e840c5)	;'2'
	move.l	a0,($00e840cc)
	move.w	#$0020,($00e840ca)	;' '
	move.b	#$02,($0c32)
	move.b	#$88,($00e840c7)
L000c52:
	tst.b	($0c32)
	bne	L000c52
	lea.l	(L0018de,pc),a0
	cmpi.b	#$ff,(a0)
	beq	L000c6a
	move.b	(a0),($00e9a005)
	st.b	(a0)
L000c6a:
	lea.l	(L0016b6,pc),a0
	move.l	a1,($0006,a0)
	move.w	d4,($000a,a0)
	st.b	($00e840c0)
	move.b	#$3a,($00e840c5)	;':'
	move.l	a0,($00e840dc)
	move.w	d0,($00e840da)
	addi.w	#$00fc,d0
	lea.l	(L0018d1,pc),a0
	move.b	d0,(a0)
	addq.w	#1,d0
	andi.w	#$0080,d0
	addq.w	#2,d0
	move.b	d0,($0c32)
	move.b	#$88,($00e840c7)
	tst.b	d0
	bpl	L000d38
L000cb4:
	adda.l	d2,a1
	sub.l	d2,d3
	move.l	d3,d4
	cmp.l	d2,d4
	bls	L000cf8
	move.l	d2,d4
L000cc0:
	tst.b	($0c32)
	bne	L000cc0
	lea.l	(L0018d1,pc),a0
	move.b	#$fe,(a0)
	move.b	#$82,($0c32)
	st.b	($00e840c0)
	move.b	#$32,($00e840c5)	;'2'
	move.l	a1,($00e840cc)
	move.w	d4,($00e840ca)
	move.b	#$88,($00e840c7)
	bra	L000cb4

L000cf8:
	tst.b	($0c32)
	bne	L000cf8
	lea.l	(L0018d1,pc),a0
	st.b	(a0)
	move.b	#$02,($0c32)
	lea.l	(L0016bc,pc),a0
	move.l	a1,(a0)
	move.w	d4,($0004,a0)
	st.b	($00e840c0)
	move.b	#$3a,($00e840c5)	;':'
	move.l	a0,($00e840dc)
	move.w	#$0002,($00e840da)
	move.b	#$88,($00e840c7)
L000d38:
	movem.l	(a7)+,d0-d4/a1
	rts

L000d3e:
	move.w	#$2200,sr
	movem.l	d0-d1,-(a7)
L000d46:
	tst.b	($0c32)
	bne	L000d46
	lea.l	(L0018d1,pc),a0
	move.b	#$fe,(a0)
	lea.l	(L0016e8,pc),a0
	move.l	a1,(a0)
	move.w	d2,($0004,a0)
	st.b	($00e840c0)
	move.b	#$10,($00e840c7)
	bsr	L000e58
	move.b	#$92,($0c32)
	st.b	($00e840c0)
	move.b	#$32,($00e840c5)	;'2'
	lea.l	(L0016c8,pc),a0
	move.l	a0,($00e840cc)
	move.w	#$0020,($00e840ca)	;' '
	move.b	#$88,($00e840c7)
	movem.l	(a7)+,d0-d1
	rts

L000da4:
	move.w	#$2200,sr
	movem.l	d0-d1,-(a7)
L000dac:
	tst.b	($0c32)
	bne	L000dac
	lea.l	(L0018d1,pc),a0
	move.b	#$fe,(a0)
	lea.l	(L0016e8,pc),a0
	move.l	a1,(a0)
	st.b	($00e840c0)
	move.b	#$10,($00e840c7)
	bsr	L000e58
	move.b	#$a2,($0c32)
	st.b	($00e840c0)
	move.b	#$32,($00e840c5)	;'2'
	lea.l	(L0016c8,pc),a0
	move.l	a0,($00e840cc)
	move.w	#$0020,($00e840ca)	;' '
	move.b	#$88,($00e840c7)
	movem.l	(a7)+,d0-d1
	rts

L000e06:
	tst.b	d1
	beq	L000e1a
	cmp.b	#$01,d1
	beq	L000e3c
	cmp.b	#$02,d1
	beq	L000e4c
	moveq.l	#$ff,d0
	rts

L000e1a:
	clr.w	($0c32)
	ori.w	#$0700,sr
	move.b	#$10,($00e840c7)
	move.b	#$08,($00e92003)
	lea.l	(L0018d1,pc),a0
	clr.b	(a0)
	moveq.l	#$00,d0
	rts

L000e3c:
	ori.w	#$0700,sr
	move.b	#$20,($00e840c7)	;' '
	moveq.l	#$00,d0
	rts

L000e4c:
	move.b	#$08,($00e840c7)
	moveq.l	#$00,d0
	rts

L000e58:
	movem.l	d0-d2,-(a7)
	move.b	d1,d0
	andi.b	#$03,d0
	beq	L000e6a
	cmpi.b	#$03,d0
	bne	L000e6e
L000e6a:
	eori.b	#$03,d0
L000e6e:
	lsr.w	#6,d1
	andi.b	#$1c,d1
	or.b	d1,d0
	movem.l	a0/a2/a5-a6,-(a7)
	lea.l	(L001c84,pc),a6
	lea.l	(L001cd4,pc),a5
	bsr	L000e8e
	movem.l	(a7)+,a0/a2/a5-a6
	movem.l	(a7)+,d0-d2
	rts

L000e8e:
	cmp.b	($0022,a6),d0
	beq	L000ee0
	move.b	d0,($0022,a6)
	move.w	sr,-(a7)
	ori.w	#$0700,sr
	movea.w	#$09da,a0
	ori.b	#$80,(a0)
	cmp.b	#$08,d0
	bcs	L000eb2
	subq.b	#8,d0
	andi.b	#$7f,(a0)
L000eb2:
	moveq.l	#$1b,d1
	move.b	(a0),d2
	bsr	WriteOPM
	move.w	(a7)+,sr
	movea.l	#$00e9a005,a0
	move.b	(a0),d1
	and.b	#$f0,d1
	or.b	d0,d1
	move.b	d1,(-$03f6,a5)
	andi.b	#$0c,d1
	andi.b	#$f3,($00e9a005)
	or.b	d1,($00e9a005)
L000ee0:
	rts

L000ee2:
	bclr.b	#$03,($0016,a6)
	beq	L000f1a
	move.b	($0018,a6),d2
	bmi	L000efe
	moveq.l	#$08,d1
	lea.l	(L001d04,pc),a2
	move.b	d2,(a2,d7.w)
	bra	WriteOPM

L000efe:
	move.b	($0025,a5),d0
	beq	L000f1a
	tst.b	(-$0403,a5)
	bne	L000f1a
	move.b	#$10,($00e840c7)
	move.b	#$08,($00e92003)
L000f1a:
	rts

L000f1c:
	tst.b	($0018,a6)
	bmi	L000f5e
	tst.b	($0016,a6)
	bpl	L000f36
	tst.b	($0020,a6)
	bne	L000f36
	move.l	($0008,a6),d0
	add.l	d0,($000c,a6)
L000f36:
	tst.b	($0024,a6)
	beq	L000f48
	tst.b	($0020,a6)
	bne	L000f5e
	tst.b	($0025,a6)
	bne	L000f60
L000f48:
	btst.b	#$05,($0016,a6)
	beq	L000f52
	bsr	L000f80
L000f52:
	btst.b	#$06,($0016,a6)
	beq	L000f5e
	bsr	L000fe2
L000f5e:
	rts

L000f60:
	subq.b	#1,($0025,a6)
	bne	L000f7e
	btst.b	#$05,($0016,a6)
	beq	L000f72
	bsr	L0013b4
L000f72:
	btst.b	#$06,($0016,a6)
	beq	L000f7e
	bsr	L001422
L000f7e:
	rts

L000f80:
	move.l	($0032,a6),d1
	movea.l	($0026,a6),a0
	jmp	(a0)

L000f8a:
	add.l	d1,($0036,a6)
	subq.w	#1,($003e,a6)
	bne	L000f9e
	move.w	($003c,a6),($003e,a6)
	neg.l	($0036,a6)
L000f9e:
	rts

L000fa0:
	move.l	d1,($0036,a6)
	subq.w	#1,($003e,a6)
	bne	L000fb4
	move.w	($003c,a6),($003e,a6)
	neg.l	($0032,a6)
L000fb4:
	rts

L000fb6:
	add.l	d1,($0036,a6)
	subq.w	#1,($003e,a6)
	bne	L000fca
	move.w	($003c,a6),($003e,a6)
	neg.l	($0032,a6)
L000fca:
	rts

L000fcc:
	subq.w	#1,($003e,a6)
	bne	L000fe0
	bsr	L001046
	muls.w	d1,d0
	move.l	d0,($0036,a6)
	move.w	($003c,a6),($003e,a6)
L000fe0:
	rts

L000fe2:
	move.w	($0048,a6),d1
	movea.l	($0040,a6),a0
	jmp	(a0)

L000fec:
	add.w	d1,($004a,a6)
	subq.w	#1,($004e,a6)
	bne	L001002
	move.w	($004c,a6),($004e,a6)
	move.w	($0046,a6),($004a,a6)
L001002:
	rts

L001004:
	subq.w	#1,($004e,a6)
	bne	L001018
	move.w	($004c,a6),($004e,a6)
	add.w	d1,($004a,a6)
	neg.w	($0048,a6)
L001018:
	rts

L00101a:
	add.w	d1,($004a,a6)
	subq.w	#1,($004e,a6)
	bne	L00102e
	move.w	($004c,a6),($004e,a6)
	neg.w	($0048,a6)
L00102e:
	rts

L001030:
	subq.w	#1,($004e,a6)
	bne	L001044
	bsr	L001046
	muls.w	d0,d1
	move.w	($004c,a6),($004e,a6)
	move.w	d1,($004a,a6)
L001044:
	rts

L001046:
	move.w	(-$0c78,a5),d0
	mulu.w	#$c549,d0
	add.l	#$0000000c,d0
	move.w	d0,(-$0c78,a5)
	lsr.l	#8,d0
	rts

L00105c:
	.dc.b	$12,$34
L00105e:
	tst.b	($27,a5,d7.w)
	bne	L001066
	rts

L001066:
	clr.b	($27,a5,d7.w)
	bclr.b	#$03,($0017,a6)
	bra	L001092

L001072:
	btst.b	#$03,($0017,a6)
	bne	L00105e
	btst.b	#$02,($0016,a6)
	bne	L00108c
	subq.b	#1,($001b,a6)
	bne	L00108c
	bsr	L000ee2
L00108c:
	subq.b	#1,($001a,a6)
	bne	L0010e8
L001092:
	movea.l	(a6),a4
	bclr.b	#$02,($0016,a6)
	bclr.b	#$07,($0016,a6)
L0010a0:
	moveq.l	#$00,d0
	moveq.l	#$00,d1
	move.b	(a4)+,d0
	move.b	d0,d1
	bpl	L0010da
	cmp.b	#$e0,d0
	bcc	L0010f2
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
	bmi	L0010ea
	mulu.w	d0,d1
	lsr.w	#3,d1
L0010da:
	addq.w	#1,d1
	move.b	d1,($001b,a6)
	addq.w	#1,d0
	move.b	d0,($001a,a6)
	move.l	a4,(a6)
L0010e8:
	rts

L0010ea:
	add.b	d0,d1
	bcs	L0010da
	moveq.l	#$00,d1
	bra	L0010da

L0010f2:
	ext.w	d0
	not.w	d0
	add.w	d0,d0
	move.w	(CommandFuncs,pc,d0.w),d0
	pea.l	(L0010a0,pc)
	jmp	(CommandFuncs,pc,d0.w)

CommandFuncs:
	.dc.w	SetTempoCommandFunc-CommandFuncs
	.dc.w	WriteOPMCommandFunc-CommandFuncs
	.dc.w	SetVoiceCommandFunc-CommandFuncs
	.dc.w	PanCommandFunc-CommandFuncs
	.dc.w	VolumeCommandFunc-CommandFuncs
	.dc.w	VolumeDownCommandFunc-CommandFuncs
	.dc.w	VolumeUpCommandFunc-CommandFuncs
	.dc.w	SetNoteLengthCommandFunc-CommandFuncs
	.dc.w	SetLegatoCommandFunc-CommandFuncs
	.dc.w	RepeatStartCommandFunc-CommandFuncs
	.dc.w	RepeatEndCommandFunc-CommandFuncs
	.dc.w	RepeatEscapeCommandFunc-CommandFuncs
	.dc.w	DetuneCommandFunc-CommandFuncs
	.dc.w	PortamentoCommandFunc-CommandFuncs
	.dc.w	PerformanceEndCommandFunc-CommandFuncs
	.dc.w	KeyOnDelayCommandFunc-CommandFuncs
	.dc.w	SyncSendCommandFunc-CommandFuncs
	.dc.w	SyncWaitCommandFunc-CommandFuncs
	.dc.w	SetNoiseFreqCommandFunc-CommandFuncs
	.dc.w	PitchModulationCommandFunc-CommandFuncs
	.dc.w	AmplitudeModulationCommandFunc-CommandFuncs
	.dc.w	OPMLFOCommandFunc-CommandFuncs
	.dc.w	SetLFOKeyOnDelayCommandFunc-CommandFuncs
	.dc.w	L_Nop-CommandFuncs
	.dc.w	L_Nop-CommandFuncs
	.dc.w	L_Nop-CommandFuncs
	.dc.w	L_Nop-CommandFuncs
	.dc.w	L_Nop-CommandFuncs
	.dc.w	L_Nop-CommandFuncs
	.dc.w	L_Nop-CommandFuncs
	.dc.w	L_Nop-CommandFuncs
	.dc.w	L_Nop-CommandFuncs
SetTempoCommandFunc:
	moveq.l	#$12,d1
	move.b	(a4)+,d2
	tst.b	(-$0404,a5)
	bne	L001156
	move.b	d2,(-$0400,a5)
	bra	WriteOPM

L001156:
	rts

WriteOPMCommandFunc:
	move.b	(a4)+,d1
	move.b	(a4)+,d2
	cmp.b	#$12,d1
	bne	L00116c
	tst.b	(-$0404,a5)
	bne	L001156
	move.b	d2,(-$0400,a5)
L00116c:
	bra	WriteOPM

SetVoiceCommandFunc:
	move.b	(a4)+,d0
	movea.l	($001c,a5),a0
	bra	L00117c

L001178:
	lea.l	($001a,a0),a0
L00117c:
	cmp.b	(a0)+,d0
	bne	L001178
	move.l	a0,($0004,a6)
	bset.b	#$01,($0017,a6)
	rts

PanCommandFunc:
	tst.b	($0018,a6)
	bmi	L0011a8
	move.b	($001c,a6),d0
	ror.w	#6,d0
	move.b	(a4)+,d0
	rol.w	#6,d0
	move.b	d0,($001c,a6)
	bset.b	#$02,($0017,a6)
	rts

L0011a8:
	move.b	(a4)+,d0
	beq	L0011b2
	cmp.b	#$03,d0
	bne	L0011b6
L0011b2:
	eori.b	#$03,d0
L0011b6:
	andi.b	#$fc,($001c,a6)
	or.b	d0,($001c,a6)
	rts

VolumeCommandFunc:
	move.b	(a4)+,($0022,a6)
	bset.b	#$00,($0017,a6)
	rts

VolumeDownCommandFunc:
	move.b	($0022,a6),d2
	bmi	L0011e2
	beq	L0011e0
L0011d6:
	subq.b	#1,($0022,a6)
	bset.b	#$00,($0017,a6)
L0011e0:
	rts

L0011e2:
	cmp.b	#-$01,d2
	bne	L0011f6
	rts

VolumeUpCommandFunc:
	move.b	($0022,a6),d2
	bmi	L001202
	cmp.b	#$0f,d2
	beq	L001200
L0011f6:
	addq.b	#1,($0022,a6)
	bset.b	#$00,($0017,a6)
L001200:
	rts

L001202:
	cmp.b	#$80,d2
	bne	L0011d6
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
	move.b	(a4)+,d0
	lsl.w	#8,d0
	move.b	(a4)+,d0
	subq.b	#1,(-$01,a4,d0.w)
	beq	L001236
	adda.w	d0,a4
	move.b	(-$0401,a5),d0
	beq	L001236
	cmp.b	(-$0002,a4),d0
	bls	L001280
L001236:
	rts

RepeatEscapeCommandFunc:
	move.b	(a4)+,d0
	lsl.w	#8,d0
	move.b	(a4)+,d0
	lea.l	(a4,d0.w),a0
	move.b	(a0)+,d0
	lsl.w	#8,d0
	move.b	(a0)+,d0
	cmpi.b	#$01,(-$01,a0,d0.w)
	bne	L001252
	movea.l	a0,a4
L001252:
	rts

DetuneCommandFunc:
	move.b	(a4)+,d0
	lsl.w	#8,d0
	move.b	(a4)+,d0
	move.w	d0,($0010,a6)
	rts

PortamentoCommandFunc:
	move.b	(a4)+,d0
	lsl.w	#8,d0
	move.b	(a4)+,d0
	ext.l	d0
	asl.l	#8,d0
	move.l	d0,($0008,a6)
	bset.b	#$07,($0016,a6)
	rts

PerformanceEndCommandFunc:
	move.b	(a4)+,d0
	beq	L0012be
	lsl.w	#8,d0
	move.b	(a4)+,d0
	adda.w	d0,a4
L001280:
	move.w	(L0018e2,pc),d0
	bclr.l	d7,d0
	move.w	d0,(-$03f2,a5)
	tst.w	d0
	bne	L0012bc
	tst.b	(-$03f4,a5)
	bne	L0012a0
	move.w	#$01ff,(-$03f2,a5)
	addq.w	#1,($003a,a5)
	bra	L0012bc

L0012a0:
	tst.b	(-$03f5,a5)
	bne	L0012bc
	move.w	#$01ff,(-$03f2,a5)
	subq.w	#1,(-$03ea,a5)
	bne	L0012bc
	move.w	#$0011,(-$03ee,a5)
	st.b	(-$03f5,a5)
L0012bc:
	rts

L0012be:
	lea.l	(EndPlayBytes,pc),a4
	move.w	(L0018e2,pc),d0
	bclr.l	d7,d0
	move.w	d0,(-$03f2,a5)
	move.w	(L0018ce,pc),d0
	bclr.l	d7,d0
	move.w	d0,(-$0406,a5)
	tst.w	d0
	bne	L0012fe
	move.b	#$01,(-$03f9,a5)
	tst.b	(-$03f4,a5)
	bne	L0012ee
	move.w	#$ffff,($003a,a5)
	bra	L0012fe

L0012ee:
	move.w	#$ffff,(-$03ee,a5)
	st.b	(-$03f5,a5)
	move.w	#$0037,(-$03f8,a5)	;'7'
L0012fe:
	rts

KeyOnDelayCommandFunc:
	move.b	(a4)+,($001f,a6)
	rts

SyncSendCommandFunc:
	moveq.l	#$00,d0
	move.b	(a4)+,d0
	st.b	($27,a5,d0.w)
	rts

SyncWaitCommandFunc:
	tst.b	($27,a5,d7.w)
	beq	L001322
	clr.b	($27,a5,d7.w)
	bclr.b	#$03,($0017,a6)
	rts

L001322:
	bset.b	#$03,($0017,a6)
	move.l	a4,(a6)
	addq.w	#4,a7
	rts

SetNoiseFreqCommandFunc:
	move.b	(a4)+,d2
	tst.b	($0018,a6)
	bmi	L001340
	move.b	d2,($0026,a5)
	moveq.l	#$0f,d1
	bra	WriteOPM

L001340:
	lsl.b	#2,d2
	andi.b	#$03,($001c,a6)
	or.b	d2,($001c,a6)
	rts

PitchModulationCommandFunc:
	bset.b	#$05,($0016,a6)
	moveq.l	#$00,d1
	move.b	(a4)+,d1
	bmi	L0013c8
	move.w	d1,-(a7)
	andi.b	#$03,d1
	add.w	d1,d1
	move.w	(L0013da,pc,d1.w),d0
	lea.l	(L0013da,pc,d0.w),a0
	move.l	a0,($0026,a6)
	move.b	(a4)+,d2
	lsl.w	#8,d2
	move.b	(a4)+,d2
	move.w	d2,($003c,a6)
	cmp.b	#$02,d1
	beq	L001388
	lsr.w	#1,d2
	cmpi.b	#$06,d1
	bne	L001388
	moveq.l	#$01,d2
L001388:
	move.w	d2,($003a,a6)
	move.b	(a4)+,d0
	lsl.w	#8,d0
	move.b	(a4)+,d0
	ext.l	d0
	asl.l	#8,d0
	move.w	(a7)+,d1
	cmpi.b	#$04,d1
	bcs	L0013a4
	asl.l	#8,d0
	andi.b	#$03,d1
L0013a4:
	move.l	d0,($002e,a6)
	cmp.b	#$02,d1
	beq	L0013b0
	moveq.l	#$00,d0
L0013b0:
	move.l	d0,($002a,a6)
L0013b4:
	move.w	($003a,a6),($003e,a6)
	move.l	($002e,a6),($0032,a6)
	move.l	($002a,a6),($0036,a6)
	rts

L0013c8:
	and.b	#$01,d1
	bne	L0013b4
	bclr.b	#$05,($0016,a6)
	clr.l	($0036,a6)
	rts

L0013da:
	.dc.w	L000f8a-L0013da
	.dc.w	L000fa0-L0013da
	.dc.w	L000fb6-L0013da
	.dc.w	L000fcc-L0013da
AmplitudeModulationCommandFunc:
	bset.b	#$06,($0016,a6)
	moveq.l	#$00,d2
	move.b	(a4)+,d2
	bmi	L001436
	add.w	d2,d2
	move.w	(L001448,pc,d2.w),d0
	lea.l	(L001448,pc,d0.w),a0
	move.l	a0,($0040,a6)
	move.b	(a4)+,d1
	lsl.w	#8,d1
	move.b	(a4)+,d1
	move.w	d1,($004c,a6)
	move.b	(a4)+,d0
	lsl.w	#8,d0
	move.b	(a4)+,d0
	move.w	d0,($0044,a6)
	btst.l	#$01,d2
	bne	$00001418
	muls.w	d1,d0
	neg.w	d0
	bpl	$0000141e
	moveq.l	#$00,d0
	move.w	d0,($0046,a6)
L001422:
	move.w	($004c,a6),($004e,a6)
	move.w	($0044,a6),($0048,a6)
	move.w	($0046,a6),($004a,a6)
	rts

L001436:
	and.b	#$01,d2
	bne	L001422
	bclr.b	#$06,($0016,a6)
	clr.w	($004a,a6)
	rts

L001448:
	.dc.w	L000fec-L001448
	.dc.w	L001004-L001448
	.dc.w	L00101a-L001448
	.dc.w	L001030-L001448
OPMLFOCommandFunc:
	move.b	(a4)+,d2
	bmi	$00001496
	bclr.b	#$01,($0016,a6)
	bclr.l	#$06,d2
	beq	$00001466
	bset.b	#$01,($0016,a6)
	movea.w	#$09da,a0
	move.b	(a0),d0
	and.b	#$c0,d0
	or.b	d0,d2
	move.b	d2,(a0)
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
	beq	$0000148e
	move.b	($0021,a6),d2
	bra	$0000148e

SetLFOKeyOnDelayCommandFunc:
	move.b	(a4)+,($0024,a6)
	rts

WriteOPM:
	tst.b	($00e90003)
	bmi	WriteOPM
	move.b	d1,($00e90001)
	move.b	d2,($00e90003)
	and.w	#$00ff,d1
	lea.l	(OPMBuf,pc),a2
	move.b	d2,(a2,d1.w)
	rts

Start:
	clr.l	-(a7)
	DOS	_SUPER
	pea.l	(VersionString,pc)
	DOS	_PRINT
	lea.l	(L001cd4,pc),a5
	move.w	#$0001,(-$03fa,a5)
	clr.l	(-$0404,a5)
	move.l	#$00010000,($0014,a5)
	move.l	#$0004e000,($0018,a5)
	clr.b	($0024,a5)
	clr.b	($0025,a5)
	addq.w	#1,a2
	bsr	ParseCmdLineArgs
	lea.l	(L001d10,pc),a4
	lea.l	(L0018fc,pc),a1
	move.l	a4,(a1)
	adda.l	($0014,a5),a4
	move.l	a4,($0004,a1)
	adda.l	($0018,a5),a4
	cmpa.l	($0008,a0),a4
	bhi	L0016a4
	suba.l	a0,a0
	move.l	($0090,a0),(a5)
	move.l	($010c,a0),($0004,a5)
	move.l	($01a8,a0),($0008,a5)
	move.l	($01ac,a0),(-$040a,a5)
	move.l	($0580,a0),(-$041a,a5)
	move.l	($0588,a0),(-$0416,a5)
	move.l	($0590,a0),(-$0412,a5)
	move.l	($059c,a0),(-$040e,a5)
	lea.l	(Trap4Handler,pc),a1
	move.l	a1,($0090,a0)
	lea.l	(L000aa4,pc),a1
	move.l	a1,($01a8,a0)
	lea.l	(L000bb6,pc),a1
	move.l	a1,($01ac,a0)
	lea.l	(L000be8,pc),a1
	move.l	a1,($0580,a0)
	lea.l	(L000d3e,pc),a1
	move.l	a1,($0588,a0)
	lea.l	(L000da4,pc),a1
	move.l	a1,($0590,a0)
	lea.l	(L000e06,pc),a1
	move.l	a1,($059c,a0)
	move.b	#$02,($00e92001)
	lea.l	(L000004,pc),a1
	suba.l	a1,a4
	clr.w	-(a7)
	move.l	a4,-(a7)
	DOS	_KEEPPR

L00159a:
	movea.l	($0090),a4
	cmpa.l	#$00fe0000,a4
	bcc	L0015b8
	subq.w	#8,a4
	lea.l	(L000004,pc),a3
	move.w	#$0004,d0
L0015b0:
	cmpm.b	(a3)+,(a4)+
	bne	L0015b8
	dbra	d0,L0015b0
L0015b8:
	rts

ParseCmdLineArgs:
	move.b	(a2)+,d0
	bne	L0015c6
	bsr	L00159a
	beq	PrintAlreadyLoaded
	rts

L0015c6:
	cmp.b	#$20,d0			;' '
	beq	ParseCmdLineArgs
	cmp.b	#$09,d0
	beq	ParseCmdLineArgs
	cmp.b	#$2d,d0			;'-'
	beq	L0015e0
	cmp.b	#$2f,d0			;'/'
	bne	PrintHelp
L0015e0:
	move.b	(a2)+,d0
	beq	PrintHelp
	or.b	#$20,d0
	cmp.b	#$72,d0			;'r'
	bne	L001610
	bsr	L00159a
	bne	L001698
	moveq.l	#$00,d0
	trap	#4
	tst.l	d0
	bne	L00160a
	pea.l	(MXDRVReleasedString,pc)
L001602:
	DOS	_PRINT
	addq.w	#4,a7
	clr.w	-(a7)
	DOS	_EXIT2

L00160a:
	pea.l	(CouldNotReleaseString,pc)
	bra	L001602

L001610:
	bsr	L00159a
	beq	PrintAlreadyLoaded
	cmp.b	#$6d,d0			;'m'
	bne	L00162c
	cmpi.b	#$3a,(a2)		;':'
	bne	L001624
	addq.w	#1,a2
L001624:
	bsr	L001672
	move.l	d0,($0014,a5)
	bra	ParseCmdLineArgs

L00162c:
	cmp.b	#$70,d0			;'p'
	bne	L001644
	cmpi.b	#$3a,(a2)		;':'
	bne	L00163a
	addq.w	#1,a2
L00163a:
	bsr	L001672
	move.l	d0,($0018,a5)
	bra	ParseCmdLineArgs

L001644:
	cmpi.b	#$66,d0			;'f'
	bne	PrintHelp
	cmpi.b	#$3a,(a2)		;':'
	bne	L001652
	addq.w	#1,a2
L001652:
	move.l	a2,-(a7)
	bsr	L001672
	cmpa.l	(a7)+,a2
	beq	L001666
	lsr.l	#8,d0
	lsr.l	#2,d0
	andi.l	#$00007fff,d0
	bra	L001668

L001666:
	moveq.l	#$11,d0
L001668:
	move.w	d0,(L00070e)
	bra	ParseCmdLineArgs

L001672:
	moveq.l	#$00,d0
L001674:
	moveq.l	#$00,d1
	move.b	(a2),d1
	sub.b	#$30,d1			;'0'
	bcs	L00168e
	cmp.b	#$09,d1
	bhi	L00168e
	mulu.w	#$000a,d0
	add.l	d1,d0
	addq.w	#1,a2
	bra	L001674

L00168e:
	tst.l	d0
	bmi	PrintHelp
	moveq.l	#$0a,d1
	lsl.l	d1,d0
	rts

L001698:
	pea.l	(MXDRVNotLoadedString,pc)
	bra	L0016ae

PrintAlreadyLoaded:
	pea.l	(MXDRVAlreadyLoadedString,pc)
	bra	L0016ae

L0016a4:
	pea.l	(InsufficientMemoryString,pc)
	bra	L0016ae

PrintHelp:
	pea.l	(HelpString,pc)
L0016ae:
	DOS	_PRINT
	move.w	#$ffff,-(a7)
	DOS	_EXIT2

L0016b6:
	.dc.l	L0016c8
	.dc.b	$00,$20
L0016bc:
	.dc.b	$00,$00,$00,$00,$00,$00
	.dc.l	L0016c8
	.dc.b	$00,$20
L0016c8:
	.dc.b	$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08
	.dc.b	$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08
L0016e8:
	.dc.b	$00,$00,$00,$00,$00,$00
EndPlayBytes:
	.dc.b	$7f,$f1,$00
VersionString:
	.dc.b	'X68k MXDRV music driver version 2.06+15 (c)1988-90 milk.,K.MAEKAWA, Missy.M, Yatsube',$0d,$0a,$00
HelpString:
	.dc.b	'使い方: mxdrv [switch]',$0d,$0a
	.dc.b	$09,'-m:<num> MMLバッファサイズ(Kbytes)           [省略時 64]',$0d,$0a
	.dc.b	$09,'-p:<num> PCMバッファサイズ(Kbytes)           [省略時312]',$0d,$0a
	.dc.b	$09,'-f:<num> FADEOUT SPEED (FAST 0 - 32767 SLOW) [省略時 23]',$0d,$0a
	.dc.b	$09,'-r       mxdrv解除',$0d,$0a,$00
InsufficientMemoryString:
	.dc.b	$09,'メモリが不足しています',$0d,$0a,$00
MXDRVReleasedString:
	.dc.b	$09,'mxdrvを解除しました',$0d,$0a,$00
MXDRVAlreadyLoadedString:
	.dc.b	$09,'mxdrvはすでに組み込まれています',$0d,$0a,$00
MXDRVNotLoadedString:
	.dc.b	$09,'mxdrvは組み込まれていません',$0d,$0a,$00
CouldNotReleaseString:
	.dc.b	$09,'mxdrvを解除出来ませんでした',$0d,$0a,$00,$00

	.bss

L0018ba:
	.ds.b	20
L0018ce:
	.ds.w	1
L0018d0:
	.ds.b	1
L0018d1:
	.ds.b	3
L0018d4:
	.ds.b	2
L0018d6:
	.ds.b	6
L0018dc:
	.ds.b	2
L0018de:
	.ds.b	1
L0018df:
	.ds.b	2
L0018e1:
	.ds.b	1
L0018e2:
	.ds.w	1
L0018e4:
	.ds.w	1
L0018e6:
	.ds.b	6
L0018ec:
	.ds.l	1
L0018f0:
	.ds.l	1
L0018f4:
	.ds.l	1
L0018f8:
	.ds.l	1
L0018fc:
	.ds.l	1
L001900:
	.ds.l	1
OPMBuf:
	.ds.b	256
L001a04:
	.ds.b	640
L001c84:
	.ds.b	80
L001cd4:
	.ds.b	48
L001d04:
	.ds.b	12
L001d10:

	.end	Start
