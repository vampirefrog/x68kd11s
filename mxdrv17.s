;=============================================
;  Filename mxdrv17.x
;  Time Stamp Thu Apr 30 09:52:56 1992
;
;  Base address 000000
;  Exec address 0017ea
;  Text size    001ba6 byte(s)
;  Data size    000000 byte(s)
;  Bss  size    0006a2 byte(s)
;  449 Labels
;
;  Commandline dis  -b2 -h -m68000 --sp -q1 -B -M -p -o120 -gmxdrv17.lab --overwrite mxdrv17.x mxdrv17.s
;          DIS version 3.16
;=============================================

	.include	inc/doscall.mac
	.include	inc/iocscall.mac
	.include	inc/fefunc.mac

	.cpu	68000

	.text

L000000:
	.dc.b	'EX17'
L000004:
	.dc.b	'mxdrv206'
L00000c:
	movem.l	d1-d7/a0-a6,-(sp)
	lea.l	(L00220c,pc),a5
	cmp.b	#$20,d0			;' '
	bcc.s	L000024
	add.w	d0,d0
	move.w	(TrapCallTable,pc,d0.w),d0
	jsr	(TrapCallTable,pc,d0.w)
L000024:
	movem.l	(sp)+,d1-d7/a0-a6
	rte

TrapCallTable:
	.dc.w	L_FREE-TrapCallTable
	.dc.w	L_ERROR-TrapCallTable
	.dc.w	L_SETMDX-TrapCallTable
	.dc.w	L_SETPDX-TrapCallTable
	.dc.w	L_PLAY-TrapCallTable
	.dc.w	L_STOP-TrapCallTable
	.dc.w	L_PAUSE-TrapCallTable
	.dc.w	L_CONT-TrapCallTable
	.dc.w	L_GetMDXTitle-TrapCallTable
	.dc.w	L_GetPDXFilename-TrapCallTable
	.dc.w	L_0A-TrapCallTable
	.dc.w	L_0B-TrapCallTable
	.dc.w	L_FadeOut-TrapCallTable
	.dc.w	L_0D-TrapCallTable
	.dc.w	L_SetChannelMask-TrapCallTable
	.dc.w	L_PlayWithMask-TrapCallTable
	.dc.w	L_GetOPMBuf-TrapCallTable
	.dc.w	L_11-TrapCallTable
	.dc.w	L_GetPlaybackFlags-TrapCallTable
	.dc.w	L_SetIgnoreKeys-TrapCallTable
	.dc.w	L_14-TrapCallTable
	.dc.w	L_15-TrapCallTable
	.dc.w	L_16-TrapCallTable
	.dc.w	L_17-TrapCallTable
	.dc.w	L_GetPCMBuf-TrapCallTable
	.dc.w	L_19-TrapCallTable
	.dc.w	L_1A-TrapCallTable
	.dc.w	L_1B-TrapCallTable
	.dc.w	L_1C-TrapCallTable
	.dc.w	L_1D-TrapCallTable
	.dc.w	L_1E-TrapCallTable
	.dc.w	L_1F-TrapCallTable
L_0A:
	move.b	d1,(-$03f8,a5)
	rts

L_0B:
	move.b	d1,(-$03f7,a5)
	rts

L_FadeOut:
	move.w	d1,(-$03ee,a5)
	st.b	(-$03f5,a5)
L00007e:
	rts

L_SetChannelMask:
	move.w	d1,(-$03f0,a5)
	rts

L_GetOPMBuf:
	lea.l	(L001e3c,pc),a0
	move.l	a0,d0
	rts

L_11:
	lea.l	(L001e0e,pc),a0
	tst.l	d1
	bmi.s	L00009a
	move.b	d1,(a0)
	rts

L00009a:
	move.b	(a0),d0
	rts

L_GetPlaybackFlags:
	move.b	(-$03fa,a5),-(sp)
	move.w	(sp)+,d0
	move.b	(-$03f9,a5),d0
	rts

L_SetIgnoreKeys:
	move.b	(-$0402,a5),d0
	move.b	d1,(-$0402,a5)
	rts

L_14:
	move.w	(-$0406,a5),d0
	not.w	d0
	rts

L_15:
	move.b	(-$0401,a5),d0
	move.b	d1,(-$0401,a5)
	rts

L_16:
	move.b	(-$0404,a5),d0
	move.b	d1,(-$0404,a5)
	bsr.w	L_STOP
	rts

L_17:
	move.b	(-$0404,a5),d0
	beq.w	L0001ee
L0000dc:
	movem.l	d1-d7/a0-a6,-(sp)
	st.b	($0039,a5)
	lea.l	(L001e1e,pc),a0
	lea.l	(fadeout_enable,pc),a1
	tst.b	(a1)
	beq.w	L000174
	bpl.s	L0000fc
	move.b	#$7f,(a1)
	move.w	(a0),($0002,a0)
L0000fc:
	tst.w	($0002,a0)
	bmi.s	L000108
	subq.w	#2,($0002,a0)
	bra.s	L000174

L000108:
	lea.l	(fadeout_offset,pc),a1
	cmpi.b	#$0a,(a1)
	bge.s	L000120
L000112:
	cmpi.b	#$3e,(a1)		;'>'
	bge.s	L000126
	addq.b	#1,(a1)
	move.w	(a0),($0002,a0)
	bra.s	L000174

L000120:
	st.b	(-$03f7,a5)
	bra.s	L000112

L000126:
	tst.b	(-$03f4,a5)
	beq.s	L000134
	bsr.w	L00077a
	bra.w	L0001d6

L000134:
	move.b	#$7f,(a1)
	clr.b	(-$03f5,a5)
	move.b	#$01,(-$03f9,a5)
	bsr.w	L_PAUSE
	movea.l	($0088),a0
	move.l	(-$0008,a0),d0
	cmp.l	#$50434d34,d0		;'PCM4'
	beq.s	L00015e
	cmp.l	#$50434d38,d0		;'PCM8'
	bne.s	L000164
L00015e:
	move.w	#$0100,d0
	trap	#2
L000164:
	tst.b	(-$0418,a5)
	beq.s	L000174
	move.w	#$01ff,d0
	trap	#2
	clr.b	(-$0418,a5)
L000174:
	lea.l	(opm_tempo,pc),a0
	move.b	(a0),d2
	moveq.l	#$12,d1
	tst.b	(-$03f9,a5)
	bne.s	L0001d6
	addq.w	#1,(-$0666,a5)
	lea.l	(L001f3c,pc),a6
	moveq.l	#$00,d7
L00018c:
	bsr.w	L001050
	bsr.w	L0011b4
	move.w	(channel_mask,pc),d0
	btst.l	d7,d0
	bne.s	L0001a0
	bsr.w	L000c66
L0001a0:
	lea.l	($0050,a6),a6
	addq.w	#1,d7
	cmp.w	#$0009,d7
	bcs.s	L00018c
	tst.b	(-$0418,a5)
	beq.s	L0001d6
	lea.l	(L001bc4,pc),a6
L0001b6:
	bsr.w	L001050
	bsr.w	L0011b4
	move.w	(channel_mask,pc),d0
	btst.l	d7,d0
	bne.s	L0001ca
	bsr.w	L000c66
L0001ca:
	lea.l	($0050,a6),a6
	addq.w	#1,d7
	cmp.w	#$0010,d7
	bcs.s	L0001b6
L0001d6:
	tst.b	($00e90003)
	bmi.s	L0001d6
	move.b	#$1b,($00e90001)
	clr.b	($0039,a5)
	movem.l	(sp)+,d1-d7/a0-a6
L0001ee:
	move.b	(-$03fa,a5),-(sp)
	move.w	(sp)+,d0
	move.b	(-$03f9,a5),d0
	rts

L_GetPCMBuf:
	lea.l	(L001bc4,pc),a0
	move.l	a0,d0
	rts

L_19:
	lea.l	(pcm_work_area,pc),a0
	move.l	a0,d0
	rts

L_1A:
	bsr.s	L000216
	tst.l	d0
	bmi.s	L000214
	move.l	d1,($0004,sp)
L000214:
	rts

L000216:
	movem.l	d2-d4/a0-a2,-(sp)
	movea.l	a0,a1
	moveq.l	#$00,d0
	moveq.l	#$ff,d3
	moveq.l	#$00,d1
L000222:
	move.l	(a1)+,d4
	move.l	(a1)+,d2
	and.l	#$00ffffff,d4
	beq.s	L00025a
	cmp.l	(-$0008,a1),d4
	bne.s	L000260
	and.l	#$00ffffff,d2
	beq.s	L00025a
	cmp.l	(-$0004,a1),d2
	bne.s	L000260
	add.l	d4,d2
	cmp.l	d1,d2
	bcs.s	L00024a
	move.l	d2,d1
L00024a:
	cmp.l	d4,d3
	bcs.s	L000250
	move.l	d4,d3
L000250:
	lea.l	(a0,d3.l),a2
	cmpa.l	a2,a1
	beq.s	L00025e
	bhi.s	L000266
L00025a:
	addq.w	#1,d0
	bra.s	L000222

L00025e:
	addq.w	#1,d0
L000260:
	movem.l	(sp)+,d2-d4/a0-a2
	rts

L000266:
	moveq.l	#$ff,d0
	movem.l	(sp)+,d2-d4/a0-a2
	rts

L_1B:
	movem.l	d1-d5/a0-a2,-(sp)
	bsr.s	L000216
	move.l	d0,d2
	bmi.s	L0002e4
	move.l	d0,d5
	lsl.l	#3,d0
	moveq.l	#$60,d3			;'`'
L00027e:
	sub.l	d3,d2
	bcc.s	L00027e
	add.l	d3,d2
	beq.s	L0002e4
	sub.l	d2,d3
	move.l	d3,d4
	lsl.l	#3,d3
	move.l	d1,d2
	addq.l	#1,d2
	and.w	#$fffe,d2
	lea.l	(a0,d2.l),a2
	add.l	d3,d1
	lea.l	(a0,d1.l),a1
	sub.l	d0,d2
	lsr.l	#1,d2
	move.l	d2,d0
	lsr.l	#1,d0
	subq.l	#1,d0
	swap.w	d0
L0002aa:
	swap.w	d0
L0002ac:
	move.l	-(a2),-(a1)
	dbra.w	d0,L0002ac
	swap.w	d0
	dbra.w	d0,L0002aa
	and.w	#$0001,d2
	beq.s	L0002c0
	move.w	-(a2),-(a1)
L0002c0:
	subq.w	#1,d4
L0002c2:
	clr.l	-(a1)
	clr.l	-(a1)
	dbra.w	d4,L0002c2
	subq.l	#1,d5
	swap.w	d5
L0002ce:
	swap.w	d5
L0002d0:
	move.l	(a0)+,d0
	beq.s	L0002d8
	add.l	d3,(-$0004,a0)
L0002d8:
	addq.w	#4,a0
	dbra.w	d5,L0002d0
	swap.w	d5
	dbra.w	d5,L0002ce
L0002e4:
	move.l	d1,d0
	movem.l	(sp)+,d1-d5/a0-a2
	rts

L_1C:
	movem.l	d1-d7/a0-a4,-(sp)
	bsr.w	L000216
	tst.l	d0
	bmi.w	L000462
	add.l	a0,d1
	addq.l	#1,d1
	and.w	#$fffe,d1
	move.l	d1,d3
	move.l	d3,d7
	move.l	d0,d2
	exg.l	a0,a1
	bsr.w	L000216
	tst.l	d0
	bmi.w	L000462
	add.l	d1,d3
	add.l	a0,d1
	move.l	d1,d6
	move.l	d0,d1
	lsl.l	#3,d1
	add.l	a0,d1
	move.l	d1,d4
	suba.l	d3,a2
	bcs.w	L00045a
	moveq.l	#$60,d1			;'`'
	move.l	d2,d3
L00032c:
	sub.l	d1,d3
	bcc.s	L00032c
	add.l	d1,d3
	beq.s	L000342
	sub.l	d1,d3
	neg.l	d3
	move.l	d3,d1
	lsl.l	#3,d3
	cmp.l	a2,d3
	bhi.w	L00045a
L000342:
	add.l	d0,d3
	lsl.l	#3,d3
	add.l	d7,d3
	movea.l	a0,a4
	cmp.l	a0,d3
	bcs.s	L00037a
	move.l	d0,d1
	lsl.l	#3,d1
	cmp.l	(-$0664,a5),d1
	bhi.w	L00045e
	movea.l	(-$0660,a5),a4
	movea.l	a0,a3
	move.l	d0,d1
	subq.l	#1,d1
	swap.w	d1
L000366:
	swap.w	d1
L000368:
	move.l	(a3)+,(a4)+
	move.l	(a3)+,(a4)+
	dbra.w	d1,L000368
	swap.w	d1
	dbra.w	d1,L000366
	movea.l	(-$0660,a5),a4
L00037a:
	lsl.l	#3,d0
	move.l	d0,d5
	exg.l	a0,a1
	bsr.w	L_1B
	tst.l	d0
	bmi.w	L000466
	bsr.w	L000216
	move.l	d0,d2
	bmi.w	L000462
	add.l	a0,d1
	addq.l	#1,d1
	and.w	#$fffe,d1
	movea.l	d1,a2
	add.l	d5,d1
	lsl.l	#3,d0
	add.l	a0,d0
	add.l	d5,d0
	movea.l	d1,a3
	movea.l	a3,a1
	sub.l	d0,d1
	move.l	d1,d7
	lsr.l	#2,d1
	move.w	sr,-(sp)
	subq.l	#1,d1
	swap.w	d1
L0003b6:
	swap.w	d1
L0003b8:
	move.l	-(a2),-(a3)
	dbra.w	d1,L0003b8
	swap.w	d1
	dbra.w	d1,L0003b6
	move.w	(sp)+,sr
	bcc.s	L0003ca
	move.w	-(a2),-(a3)
L0003ca:
	movea.l	d0,a2
	suba.l	d5,a2
	cmpa.l	a2,a4
	beq.s	L0003ea
	move.l	d5,d1
	lsr.l	#3,d1
	subq.l	#1,d1
	swap.w	d1
L0003da:
	swap.w	d1
L0003dc:
	move.l	(a4)+,(a2)+
	move.l	(a4)+,(a2)+
	dbra.w	d1,L0003dc
	swap.w	d1
	dbra.w	d1,L0003da
L0003ea:
	movea.l	d4,a2
	sub.l	d4,d6
	move.l	d6,d1
	lsr.l	#2,d1
	subq.l	#1,d1
	swap.w	d1
L0003f6:
	swap.w	d1
L0003f8:
	move.l	(a2)+,(a1)+
	dbra.w	d1,L0003f8
	swap.w	d1
	dbra.w	d1,L0003f6
	move.w	d6,d1
	and.w	#$0002,d1
	beq.s	L00040e
	move.w	(a2)+,(a1)+
L00040e:
	and.w	#$0001,d6
	beq.s	L000416
	move.b	(a2)+,(a1)+
L000416:
	suba.l	a0,a1
	move.l	d5,d1
	move.l	d2,d0
	lsl.l	#3,d0
	add.l	d0,d7
	subq.l	#1,d2
	swap.w	d2
L000424:
	swap.w	d2
L000426:
	move.l	(a0),d0
	beq.s	L00042c
	add.l	d1,(a0)
L00042c:
	addq.w	#8,a0
	dbra.w	d2,L000426
	swap.w	d2
	dbra.w	d2,L000424
	lsr.l	#3,d5
	subq.l	#1,d5
	swap.w	d5
L00043e:
	swap.w	d5
L000440:
	move.l	(a0),d0
	beq.s	L000446
	add.l	d7,(a0)
L000446:
	addq.w	#8,a0
	dbra.w	d5,L000440
	swap.w	d5
	dbra.w	d5,L00043e
	move.l	a1,d0
L000454:
	movem.l	(sp)+,d1-d7/a0-a4
	rts

L00045a:
	moveq.l	#$ff,d0
	bra.s	L000454

L00045e:
	moveq.l	#$fe,d0
	bra.s	L000454

L000462:
	moveq.l	#$fd,d0
	bra.s	L000454

L000466:
	moveq.l	#$fc,d0
	bra.s	L000454

L_1D:
	move.b	(-$0404,a5),d4
	move.w	d1,d3
	st.b	(-$0404,a5)
	move.w	#$ffff,d1
	movem.l	d2-d4,-(sp)
	bsr.w	L_PlayWithMask
	movem.l	(sp)+,d2-d4
	bra.s	L000496

L_1E:
	move.b	(-$0404,a5),d4
	move.w	d1,d3
	move.w	#$ffff,(-$03f0,a5)
	st.b	(-$0404,a5)
L000496:
	ori.w	#$0700,sr
	andi.b	#$f7,($00e88009)
	andi.w	#$f8ff,sr
	tst.b	(-$03f9,a5)
	bne.s	L0004c0
	subq.w	#1,d2
	bcs.s	L0004c0
	movem.l	d2-d4,-(sp)
L0004b4:
	bsr.w	L0000dc
	dbra.w	d2,L0004b4
	movem.l	(sp)+,d2-d4
L0004c0:
	move.w	d3,(-$03f0,a5)
	move.b	d4,(-$0404,a5)
	bne.s	L_1F
	tst.b	(-$03f9,a5)
	bne.s	L_1F
	bsr.w	L00056a
	moveq.l	#$12,d1
	move.b	(-$0400,a5),d2
	bsr.w	L_WRITEOPM
	moveq.l	#$14,d1
	moveq.l	#$3a,d2			;':'
	bsr.w	L_WRITEOPM
L_1F:
	move.w	(-$0666,a5),d0
	rts

L_0D:
	cmp.b	#$f0,d1
	beq.s	L000552
	cmp.b	#$fc,d1
	beq.s	L00052e
	tst.l	d1
	bmi.s	L000534
	tst.b	(-$03f4,a5)
	bne.w	L_ERROR
	move.l	a2,(-$03dc,a5)
	move.l	a1,(-$03e8,a5)
	move.l	a1,(-$03e4,a5)
L000510:
	tst.w	(a1)
	beq.s	L000518
	addq.w	#6,a1
	bra.s	L000510

L000518:
	subq.w	#6,a1
	move.l	a1,(-$03e0,a5)
	st.b	(-$03f4,a5)
	st.b	(-$03f3,a5)
	movea.l	(L001e24,pc),a0
	bra.w	L000788

L00052e:
	move.b	(L001e19,pc),d0
	rts

L000534:
	clr.b	(-$03f4,a5)
	clr.b	($0024,a5)
	clr.b	($0025,a5)
	movea.l	(mdx_data,pc),a0
	move.l	(a0),($000c,a5)
	move.l	($0004,a0),($0010,a5)
	bra.w	StopPlayback

L000552:
	bsr.s	L000534
L000554:
	movea.l	(L001e30,pc),a0
	pea.l	(a0)
	DOS	_MFREE
	addq.w	#4,sp
	moveq.l	#$00,d0
	move.l	d0,(-$03dc,a5)
	move.b	d0,(-$03f3,a5)
	rts

L00056a:
	move.w	sr,-(sp)
	ori.w	#$0700,sr
	clr.b	(-$03f9,a5)
	tst.b	(-$0404,a5)
	bne.s	L000596
	lea.l	(L_OPMINT,pc),a1
	suba.l	a0,a0
	move.l	a1,($010c,a0)
	movea.l	#$00e88000,a0
	ori.b	#$08,($0009,a0)
	ori.b	#$08,($0015,a0)
L000596:
	move.w	(sp)+,sr
	rts

L_FREE:
	bsr.w	StopPlayback
	move.l	(a5),($0090,a0)
	pea.l	(L000000-$0000f0,pc)
	DOS	_MFREE
	addq.w	#4,sp
	tst.b	(-$03f3,a5)
	beq.s	L0005b2
	bra.s	L000554

L0005b2:
	rts

L_SETMDX:
	tst.b	(-$03f4,a5)
	beq.s	L0005c4
	movem.l	d1/a1,-(sp)
	bsr.s	L000552
	movem.l	(sp)+,d1/a1
L0005c4:
	lea.l	($0024,a5),a2
	movea.l	(mdx_data,pc),a0
	move.l	a0,($000c,a5)
	move.l	($0014,a5),d0
	bra.s	L0005f8

L_SETPDX:
	tst.b	(-$03f4,a5)
	beq.s	L0005e8
	movem.l	d1/a1,-(sp)
	bsr.w	L000552
	movem.l	(sp)+,d1/a1
L0005e8:
	lea.l	($0025,a5),a2
	movea.l	(pdx_data,pc),a0
	move.l	a0,($0010,a5)
	move.l	($0018,a5),d0
L0005f8:
	cmp.l	d1,d0
	bcs.s	L000630
	movem.l	d1/a0-a2,-(sp)
	bsr.s	StopPlayback
	movem.l	(sp)+,d1/a0-a2
	move.w	d1,d0
	andi.w	#$0003,d0
	lsr.l	#2,d1
	swap.w	d1
L000610:
	swap.w	d1
L000612:
	move.l	(a1)+,(a0)+
	dbra.w	d1,L000612
	swap.w	d1
	dbra.w	d1,L000610
	tst.w	d0
	beq.s	L00062a
	subq.w	#1,d0
L000624:
	move.b	(a1)+,(a0)+
	dbra.w	d0,L000624
L00062a:
	st.b	(a2)
	moveq.l	#$00,d0
	rts

L000630:
	bset.l	#$1f,d0
	rts

L_STOP:
	tst.b	(-$03f4,a5)
	bne.w	L000552
StopPlayback:
	move.b	#$01,(-$03f9,a5)
	move.w	sr,-(sp)
	ori.w	#$0700,sr
	bsr.s	PausePlayback
	movea.l	($0088),a0
	move.l	(-$0008,a0),d0
	cmp.l	#$50434d34,d0		;'PCM4'
	beq.s	L000664
	cmp.l	#$50434d38,d0		;'PCM8'
	bne.s	L00066a
L000664:
	move.w	#$0100,d0
	trap	#2
L00066a:
	tst.b	(-$0418,a5)
	beq.s	L00067a
	move.w	#$01ff,d0
	trap	#2
	clr.b	(-$0418,a5)
L00067a:
	moveq.l	#$0f,d2
	moveq.l	#$e0,d1
L00067e:
	bsr.w	L_WRITEOPM
	addq.b	#1,d1
	bne.s	L00067e
	lea.l	(L00223c,pc),a0
	lea.l	(pcm_work_area,pc),a1
	moveq.l	#$07,d3
	moveq.l	#$00,d2
	moveq.l	#$08,d1
L000694:
	bsr.w	L_WRITEOPM
	move.b	d2,(a0)+
	move.b	d2,(a1)+
	addq.b	#1,d2
	dbra.w	d3,L000694
	movea.l	#$00e88000,a0
	andi.b	#$f7,($0009,a0)
	andi.b	#$f7,($0015,a0)
	suba.l	a0,a0
	move.l	($0004,a5),($010c,a0)
	move.w	(sp)+,sr
	rts

L_PAUSE:
	st.b	(-$03fa,a5)
PausePlayback:
	moveq.l	#$07,d7
	lea.l	(L001f3c,pc),a6
L0006ca:
	moveq.l	#$7f,d0
	bsr.w	WriteTL
	lea.l	($0050,a6),a6
	dbra.w	d7,L0006ca
	movea.l	($0088),a0
	move.l	(-$0008,a0),d0
	cmp.l	#$50434d34,d0		;'PCM4'
	beq.s	L0006f0
	cmp.l	#$50434d38,d0		;'PCM8'
	bne.s	L00070c
L0006f0:
	move.w	#$01fc,d0
	moveq.l	#$ff,d1
	trap	#2
	cmp.b	#$01,d0
	bne.s	L000706
	move.w	#$0101,d0
	trap	#2
	rts

L000706:
	moveq.l	#$67,d0			;'g'
	moveq.l	#$01,d1
	trap	#15
L00070c:
	moveq.l	#$67,d0			;'g'
	moveq.l	#$00,d1
	trap	#15
	rts

L_CONT:
	clr.b	(-$03fa,a5)
	moveq.l	#$07,d7
	lea.l	(L001f3c,pc),a6
L00071e:
	bsr.w	SetOPMVolume
	lea.l	($0050,a6),a6
	dbra.w	d7,L00071e
	movea.l	($0088),a0
	move.l	(-$0008,a0),d0
	cmp.l	#$50434d34,d0		;'PCM4'
	beq.s	L000742
	cmp.l	#$50434d38,d0		;'PCM8'
	bne.s	EnableTimerIRQ
L000742:
	move.w	#$01fc,d0
	moveq.l	#$ff,d1
	trap	#2
	cmp.b	#$01,d0
	bne.s	EnableTimerIRQ
	move.w	#$0102,d0
	trap	#2
EnableTimerIRQ:
	moveq.l	#$30,d2			;'0'
	move.b	(disable_timer_writes,pc),d1
	bne.s	L000760
	moveq.l	#$3a,d2			;':'
L000760:
	moveq.l	#$14,d1
	bra.w	L_WRITEOPM

L000766:
	movea.l	(L001e28,pc),a0
	movea.l	(L001e24,pc),a1
	subq.w	#6,a0
	cmpa.l	a1,a0
	bcc.s	L000788
	movea.l	(L001e2c,pc),a0
	bra.s	L000788

L00077a:
	movea.l	(L001e28,pc),a0
	addq.w	#6,a0
	tst.w	(a0)
	bne.s	L000788
	movea.l	(L001e24,pc),a0
L000788:
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
	bra.s	StartPlay

L_PLAY:
	clr.w	(-$03f0,a5)
	bra.s	StartPlay

L_PlayWithMask:
	move.w	d1,(-$03f0,a5)
StartPlay:
	clr.b	(-$03f8,a5)
	clr.b	(-$03f7,a5)
	clr.b	(-$03f5,a5)
	clr.b	(-$03f9,a5)
	tst.b	(-$03fa,a5)
	beq.s	L0007f4
	movea.l	($0088),a0
	move.l	(-$0008,a0),d0
	cmp.l	#$50434d34,d0		;'PCM4'
	beq.s	L0007ee
	cmp.l	#$50434d38,d0		;'PCM8'
	bne.s	L0007f4
L0007ee:
	move.w	#$0100,d0
	trap	#2
L0007f4:
	clr.b	(-$03fa,a5)
	clr.b	(-$0418,a5)
	move.w	#$01ff,(-$03f2,a5)
	move.w	#$01ff,(-$0406,a5)
	clr.w	($003a,a5)
	clr.w	(-$0666,a5)
	move.b	($0024,a5),d0
	beq.w	L_ERROR
	bsr.w	StopPlayback
	movea.l	($000c,a5),a2
	move.w	($0002,a2),d1
	bmi.s	L000848
	tst.b	($0025,a5)
	beq.w	L_ERROR
	movea.l	($0010,a5),a0
	bra.s	L00083c

L000834:
	tst.l	(a0)
	beq.w	L_ERROR
	adda.l	(a0),a0
L00083c:
	dbra.w	d1,L000834
	adda.w	($0004,a0),a0
	move.l	a0,($0020,a5)
L000848:
	adda.w	($0004,a2),a2
	movea.l	a2,a1
	movea.l	a2,a0
	moveq.l	#$00,d0
	move.w	(a1)+,d0
	adda.l	d0,a2
	move.l	a2,($001c,a5)
	lea.l	(L001f3c,pc),a6
	lea.l	(L00095a,pc),a3
	moveq.l	#$ff,d6
	moveq.l	#$00,d7
L000866:
	movea.l	a0,a2
	move.w	(a1)+,d0
	adda.l	d0,a2
	move.l	a2,(a6)
	move.l	a3,($0026,a6)
	move.l	a3,($0040,a6)
	move.w	d6,($0014,a6)
	move.b	d6,($0023,a6)
	move.b	d7,($0018,a6)
	move.b	#$00,($001d,a6)
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
	bcc.s	L0008d4
	moveq.l	#$38,d1			;'8'
	add.b	d7,d1
	moveq.l	#$00,d2
	bsr.w	L_WRITEOPM
	addq.w	#1,d7
	lea.l	($0050,a6),a6
	bra.s	L000866

L0008d4:
	move.b	#$10,($001c,a6)
	move.b	#$08,($0022,a6)
	move.b	d7,($0018,a6)
	andi.b	#$07,($0018,a6)
	ori.b	#$80,($0018,a6)
	clr.b	($0004,a6)
	cmp.w	#$000f,d7
	beq.s	L000910
	addq.w	#1,d7
	lea.l	($0050,a6),a6
	cmp.w	#$0009,d7
	bne.w	L000866
	lea.l	(L001bc4,pc),a6
	bra.w	L000866

L000910:
	lea.l	(-$0416,a5),a0
	moveq.l	#$0f,d0
L000916:
	clr.b	(a0)+
	dbra.w	d0,L000916
	clr.b	($0026,a5)
	moveq.l	#$00,d2
	moveq.l	#$01,d1
	bsr.w	L_WRITEOPM
	moveq.l	#$0f,d1
	bsr.w	L_WRITEOPM
	moveq.l	#$19,d1
	bsr.w	L_WRITEOPM
	moveq.l	#$80,d2
	bsr.w	L_WRITEOPM
	moveq.l	#$c8,d2
	moveq.l	#$12,d1
	move.b	d2,(-$0400,a5)
	tst.b	(-$0404,a5)
	bne.s	L00094c
	bsr.w	L_WRITEOPM
L00094c:
	bsr.w	L00056a
	bsr.w	EnableTimerIRQ
	moveq.l	#$00,d0
	rts

L_ERROR:
	moveq.l	#$ff,d0
L00095a:
	rts

L_GetMDXTitle:
	tst.b	($0024,a5)
	beq.s	L000998
	movea.l	($000c,a5),a0
	bra.s	L00096e

L000968:
	tst.w	(a0)
	beq.s	L000998
	adda.w	(a0),a0
L00096e:
	dbra.w	d1,L000968
	adda.w	($0006,a0),a0
	move.l	a0,d0
	rts

L_GetPDXFilename:
	tst.b	($0025,a5)
	beq.s	L000998
	movea.l	($0010,a5),a0
	bra.s	L00098c

L000986:
	tst.l	(a0)
	beq.s	L000998
	adda.l	(a0),a0
L00098c:
	dbra.w	d1,L000986
	adda.w	($0006,a0),a0
	move.l	a0,d0
	rts

L000998:
	moveq.l	#$00,d0
	rts

L_OPMINT:
	andi.b	#$f7,($00e88015)
	move.l	a6,-(sp)
	movea.l	($0006,sp),a6
	cmpa.l	($01a8),a6
	bne.s	L0009be
	pea.l	(L0009b8,pc)
	move.w	sr,-(sp)
	jmp	(a6)

L0009b8:
	movea.l	(sp)+,a6
	addq.w	#6,sp
	move.l	a6,-(sp)
L0009be:
	andi.w	#$faff,sr
	movem.l	d0-d7/a0-a5,-(sp)
	lea.l	(L00220c,pc),a5
	st.b	($0039,a5)
	tst.b	(-$03fa,a5)
	bne.w	L000a66
	lea.l	(L001e1e,pc),a0
	lea.l	(fadeout_enable,pc),a1
	tst.b	(a1)
	beq.w	L000a66
	bpl.s	L0009ee
	move.b	#$7f,(a1)
	move.w	(a0),($0002,a0)
L0009ee:
	tst.w	($0002,a0)
	bmi.s	L0009fa
	subq.w	#2,($0002,a0)
	bra.s	L000a66

L0009fa:
	lea.l	(fadeout_offset,pc),a1
	cmpi.b	#$0a,(a1)
	bge.s	L000a12
L000a04:
	cmpi.b	#$3e,(a1)		;'>'
	bge.s	L000a18
	addq.b	#1,(a1)
	move.w	(a0),($0002,a0)
	bra.s	L000a66

L000a12:
	st.b	(-$03f7,a5)
	bra.s	L000a04

L000a18:
	tst.b	(-$03f4,a5)
	beq.s	L000a26
	bsr.w	L00077a
	bra.w	L000c40

L000a26:
	move.b	#$7f,(a1)
	clr.b	(-$03f5,a5)
	move.b	#$01,(-$03f9,a5)
	bsr.w	L_PAUSE
	movea.l	($0088),a0
	move.l	(-$0008,a0),d0
	cmp.l	#$50434d34,d0		;'PCM4'
	beq.s	L000a50
	cmp.l	#$50434d38,d0		;'PCM8'
	bne.s	L000a56
L000a50:
	move.w	#$0100,d0
	trap	#2
L000a56:
	tst.b	(-$0418,a5)
	beq.s	L000a66
	move.w	#$01ff,d0
	trap	#2
	clr.b	(-$0418,a5)
L000a66:
	lea.l	(opm_tempo,pc),a0
	move.b	(a0),d2
	moveq.l	#$12,d1
	tst.b	(-$0402,a5)
	bne.w	L000bd0
	move.b	($080e),d7
	and.b	#$0f,d7
	cmp.b	#$05,d7
	beq.w	L000b16
	cmp.b	#$09,d7
	beq.s	L000b0a
	cmp.b	#$06,d7
	beq.s	L000b04
	cmp.b	#$0a,d7
	beq.s	L000afc
	cmp.b	#$04,d7
	beq.w	L000b6c
	cmp.b	#$08,d7
	beq.s	L000b20
	cmp.b	#$02,d7
	bne.w	L000bd0
	move.b	($080b),d7
	and.b	#$03,d7
	cmpi.b	#$80,($080a)
	beq.s	L000aec
	cmp.b	#$02,d7
	beq.s	L000adc
	cmp.b	#$01,d7
	bne.w	L000bd0
	tst.b	(-$03fc,a5)
	bne.w	L000bca
	subq.b	#1,($0002,a0)
	bra.w	L000bca

L000adc:
	tst.b	(-$03fc,a5)
	bne.w	L000bca
	addq.b	#1,($0002,a0)
	bra.w	L000bca

L000aec:
	tst.b	(-$03fc,a5)
	bne.w	L000bca
	clr.b	($0002,a0)
	bra.w	L000bca

L000afc:
	move.b	#$ff,d2
	bra.w	L000bd8

L000b04:
	moveq.l	#$00,d2
	bra.w	L000bd8

L000b0a:
	neg.b	d2
	lsr.b	#2,d2
	addq.b	#1,d2
	neg.b	d2
	bra.w	L000bd8

L000b16:
	neg.b	d2
	add.b	d2,d2
	neg.b	d2
	bra.w	L000bd8

L000b20:
	btst.b	#$00,($080b)
	bne.s	L000b56
	btst.b	#$01,($080b)
	beq.w	L000bd0
	tst.b	(-$03fa,a5)
	beq.s	L000b4a
	bpl.w	L000bbe
	tst.b	(-$03fc,a5)
	bne.w	L000bca
	bsr.w	L_CONT
	bra.s	L000bbe

L000b4a:
	tst.b	(-$03fc,a5)
	bne.s	L000bca
	bsr.w	L_PAUSE
	bra.s	L000bbe

L000b56:
	tst.b	(-$03fa,a5)
	beq.s	L000bca
	tst.b	(-$03fc,a5)
	bne.s	L000bca
	st.b	(-$03fc,a5)
	moveq.l	#$00,d2
	bra.w	L000bec

L000b6c:
	move.b	($080b),d7
	beq.s	L000b82
	and.b	#$03,d7
	cmp.b	#$02,d7
	beq.s	L000bae
	cmp.b	#$01,d7
	beq.s	L000b9c
L000b82:
	cmpi.b	#$80,($080a)
	bne.s	L000bd0
	tst.b	(-$03fc,a5)
	bne.s	L000bca
L000b90:
	move.w	#$0011,(-$03ee,a5)
	st.b	(-$03f5,a5)
	bra.s	L000bca

L000b9c:
	tst.b	(-$03fc,a5)
	bne.s	L000bca
	tst.b	(-$03f4,a5)
	beq.s	L000bc4
	bsr.w	L000766
	bra.s	L000bbe

L000bae:
	tst.b	(-$03fc,a5)
	bne.s	L000bca
	tst.b	(-$03f4,a5)
	beq.s	L000bc4
	bsr.w	L00077a
L000bbe:
	st.b	(-$03fc,a5)
	bra.s	L000c40

L000bc4:
	bsr.w	L_PLAY
	bra.s	L000bbe

L000bca:
	st.b	(-$03fc,a5)
	bra.s	L000bd4

L000bd0:
	clr.b	(-$03fc,a5)
L000bd4:
	add.b	($0002,a0),d2
L000bd8:
	tst.b	(-$03fa,a5)
	bne.s	L000be4
	tst.b	(-$03f9,a5)
	beq.s	L000bec
L000be4:
	moveq.l	#$00,d2
	bsr.w	L_WRITEOPM
	bra.s	L000c40

L000bec:
	bsr.w	L_WRITEOPM
	addq.w	#1,(-$0666,a5)
	lea.l	(L001f3c,pc),a6
	moveq.l	#$00,d7
L000bfa:
	bsr.w	L001050
	bsr.w	L0011b4
	move.w	(channel_mask,pc),d0
	btst.l	d7,d0
	bne.s	L000c0c
	bsr.s	L000c66
L000c0c:
	lea.l	($0050,a6),a6
	addq.w	#1,d7
	cmp.w	#$0009,d7
	bcs.s	L000bfa
	tst.b	(-$0418,a5)
	beq.s	L000c40
	lea.l	(L001bc4,pc),a6
L000c22:
	bsr.w	L001050
	bsr.w	L0011b4
	move.w	(channel_mask,pc),d0
	btst.l	d7,d0
	bne.s	L000c34
	bsr.s	L000c66
L000c34:
	lea.l	($0050,a6),a6
	addq.w	#1,d7
	cmp.w	#$0010,d7
	bcs.s	L000c22
L000c40:
	bsr.w	EnableTimerIRQ
L000c44:
	tst.b	($00e90003)
	bmi.s	L000c44
	move.b	#$1b,($00e90001)
	clr.b	($0039,a5)
	movem.l	(sp)+,d0-d7/a0-a6
	ori.b	#$08,($00e88015)
	rte

L000c66:
	btst.b	#$00,($0016,a6)
	beq.s	L000cce
	tst.b	($0020,a6)
	bne.s	L000cca
	tst.b	($0018,a6)
	bmi.s	L000cbe
	bsr.w	LoadVoice
	bsr.w	WritePan
	btst.b	#$03,($0016,a6)
	bne.s	L000cb4
	move.b	($0024,a6),($0025,a6)
	beq.s	L000c9e
	clr.l	($0036,a6)
	clr.w	($004a,a6)
	bsr.w	AdvanceLFODelay
L000c9e:
	btst.b	#$01,($0016,a6)
	beq.s	L000cb4
	moveq.l	#$01,d1
	moveq.l	#$02,d2
	bsr.w	L_WRITEOPM
	moveq.l	#$00,d2
	bsr.w	L_WRITEOPM
L000cb4:
	clr.l	($000c,a6)
	bsr.s	SetOPMPitch
	bsr.w	SetOPMVolume
L000cbe:
	bsr.w	SetPCMVolume
	andi.b	#$fe,($0016,a6)
	rts

L000cca:
	subq.b	#1,($0020,a6)
L000cce:
	tst.b	($0018,a6)
	bmi.s	L000cda
	bsr.s	SetOPMPitch
	bsr.w	SetOPMVolume
L000cda:
	rts

SetOPMPitch:
	move.w	($0012,a6),d2
	add.w	($000c,a6),d2
	add.w	($0036,a6),d2
	cmp.w	($0014,a6),d2
	beq.s	L000d22
	move.w	d2,($0014,a6)
	move.w	#$17ff,d1
	cmp.w	d1,d2
	bls.s	L000d04
	tst.w	d2
	bpl.s	L000d02
	moveq.l	#$00,d2
	bra.s	L000d04

L000d02:
	move.w	d1,d2
L000d04:
	add.w	d2,d2
	add.w	d2,d2
	moveq.l	#$30,d1			;'0'
	add.b	($0018,a6),d1
	bsr.w	L_WRITEOPM
	subq.b	#8,d1
	move.w	d2,-(sp)
	moveq.l	#$00,d2
	move.b	(sp)+,d2
	move.b	(OPMNoteTable,pc,d2.w),d2
	bsr.w	L_WRITEOPM
L000d22:
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
LoadVoice:
	bclr.b	#$01,($0017,a6)
	beq.s	L000df4
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
L000dbc:
	move.b	(a0)+,d2
	bsr.w	L_WRITEOPM
	addq.b	#8,d1
	dbra.w	d0,L000dbc
	moveq.l	#$03,d0
L000dca:
	move.b	(a0)+,d2
	lsr.b	#1,d3
	bcc.s	L000dd2
	moveq.l	#$7f,d2
L000dd2:
	bsr.w	L_WRITEOPM
	addq.b	#8,d1
	dbra.w	d0,L000dca
	moveq.l	#$0f,d0
L000dde:
	move.b	(a0)+,d2
	bsr.w	L_WRITEOPM
	addq.b	#8,d1
	dbra.w	d0,L000dde
	st.b	($0023,a6)
	ori.b	#$64,($0017,a6)
L000df4:
	rts

CarrierSlot:
	.dc.b	$08,$08,$08,$08,$0c,$0e,$0e,$0f
SetOPMVolume:
	moveq.l	#$00,d0
	move.b	($0022,a6),d0
	bclr.l	#$07,d0
	bne.s	L000e0e
	move.b	(VolumeTable,pc,d0.w),d0
L000e0e:
	add.b	(fadeout_offset,pc),d0
	bcs.s	L000e16
	bpl.s	L000e18
L000e16:
	moveq.l	#$7f,d0
L000e18:
	add.b	($004a,a6),d0
	bcs.s	L000e20
	bpl.s	L000e22
L000e20:
	moveq.l	#$7f,d0
L000e22:
	cmp.b	($0023,a6),d0
	beq.s	L000e54
WriteTL:
	move.b	d0,($0023,a6)
	movea.l	($0004,a6),a0
	addq.w	#6,a0
	move.b	($0019,a6),d3
	moveq.l	#$60,d1			;'`'
	add.b	($0018,a6),d1
	moveq.l	#$03,d4
L000e3e:
	move.b	(a0)+,d2
	lsr.b	#1,d3
	bcc.s	L000e4e
	add.b	d0,d2
	bpl.s	L000e4a
	moveq.l	#$7f,d2
L000e4a:
	bsr.w	L_WRITEOPM
L000e4e:
	addq.b	#8,d1
	dbra.w	d4,L000e3e
L000e54:
	rts

VolumeTable:
	.dc.b	$2a,$28,$25,$22,$20,$1d,$1a,$18
	.dc.b	$15,$12,$10,$0d,$0a,$08,$05,$02
WritePan:
	bclr.b	#$02,($0017,a6)
	beq.s	L000e7c
	move.b	($001c,a6),d2
	moveq.l	#$20,d1			;' '
	add.b	($0018,a6),d1
	bra.w	L_WRITEOPM

L000e7c:
	rts

SetPCMVolume:
	bset.b	#$03,($0016,a6)
	bne.s	L000e7c
	btst.b	#$04,($0016,a6)
	beq.s	L000e92
	bsr.w	SendKeyOff
L000e92:
	tst.b	($0018,a6)
	bmi.s	L000eb2
	move.b	($001d,a6),d2
	lea.l	(L00223c,pc),a2
	move.b	d2,(a2,d7.w)
	lea.l	(pcm_work_area,pc),a2
	move.b	d2,(a2,d7.w)
	moveq.l	#$08,d1
	bra.w	L_WRITEOPM

L000eb2:
	move.b	($0025,a5),d0
	beq.s	L000f26
	tst.b	(-$0403,a5)
	bne.s	L000f26
	moveq.l	#$00,d0
	move.w	($0012,a6),d0
	lsr.w	#6,d0
	move.b	($001c,a6),d2
	move.b	d2,d1
	and.w	#$0003,d1
	beq.s	L000ed8
	cmp.w	#$0003,d1
	bne.s	L000edc
L000ed8:
	eori.w	#$0003,d1
L000edc:
	and.w	#$001c,d2
	lsl.w	#6,d2
	or.w	d1,d2
	tst.b	(-$0418,a5)
	bne.s	L000f28
	tst.b	(-$03f7,a5)
	beq.s	L000ef4
	andi.b	#$fc,d2
L000ef4:
	lsl.w	#3,d0
	movea.l	($0020,a5),a1
	lea.l	(a1,d0.w),a0
	adda.l	(a0)+,a1
	addq.w	#2,a0
	move.w	(a0)+,d3
	beq.s	L000f26
	moveq.l	#$67,d0			;'g'
	moveq.l	#$00,d1
	trap	#15
	moveq.l	#$60,d0			;'`'
	move.w	d2,d1
	moveq.l	#$00,d2
	move.w	d3,d2
	trap	#15
	lea.l	(L00223c,pc),a2
	clr.b	(a2,d7.w)
	lea.l	(pcm_work_area,pc),a2
	clr.b	(a2,d7.w)
L000f26:
	rts

L000f28:
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
	beq.s	L000f26
	adda.l	(a0),a1
	lea.l	(L002248,pc),a0
	cmpa.l	a0,a1
	bcs.s	L000fb8
	move.l	a1,d0
	add.l	d3,d0
	bcs.s	L000fb8
	cmp.l	(-$065c,a5),d0
	bcc.s	L000fb8
	move.b	($0018,a6),d0
	and.w	#$0007,d0
	moveq.l	#$00,d1
	move.b	($0022,a6),d1
	bclr.l	#$07,d1
	bne.s	L000f78
	lea.l	(VolumeTable,pc),a2
	move.b	(a2,d1.w),d1
L000f78:
	add.b	(fadeout_offset,pc),d1
	bmi.s	L000f84
	cmp.b	#$2b,d1			;'+'
	bcs.s	L000f8a
L000f84:
	moveq.l	#$00,d1
	clr.b	d2
	bra.s	L000f8e

L000f8a:
	move.b	(PCMVolumeTable,pc,d1.w),d1
L000f8e:
	swap.w	d1
	move.w	d2,d1
	moveq.l	#$00,d2
	trap	#2
	move.b	($0018,a6),d0
	and.w	#$0007,d0
	move.l	d3,d2
	andi.l	#$00ffffff,d2
	trap	#2
	lea.l	(L00223c,pc),a2
	clr.b	($0008,a2)
	lea.l	(pcm_work_area,pc),a2
	clr.b	(a2,d7.w)
L000fb8:
	rts

PCMVolumeTable:
	.dc.b	$0f,$0f,$0f,$0e,$0e,$0e,$0d,$0d
	.dc.b	$0d,$0c,$0c,$0b,$0b,$0b,$0a,$0a
	.dc.b	$0a,$09,$09,$08,$08,$08,$07,$07
	.dc.b	$07,$06,$06,$05,$05,$05,$04,$04
	.dc.b	$04,$03,$03,$02,$02,$02,$01,$01
	.dc.b	$01,$00,$00,$ff
L000fe6:
	bclr.b	#$03,($0016,a6)
	beq.s	L00103a
	btst.b	#$04,($0016,a6)
	bne.s	L00103a
SendKeyOff:
	move.b	($0018,a6),d2
	bmi.s	L001012
	moveq.l	#$08,d1
	lea.l	(L00223c,pc),a2
	move.b	d2,(a2,d7.w)
	lea.l	(pcm_work_area,pc),a2
	move.b	d2,(a2,d7.w)
	bra.w	L_WRITEOPM

L001012:
	move.b	($0025,a5),d0
	beq.s	L00103a
	tst.b	(-$0403,a5)
	bne.s	L00103a
	tst.b	(-$0418,a5)
	beq.s	L00103c
	move.b	($0018,a6),d0
	and.w	#$0007,d0
	moveq.l	#$00,d1
	move.b	($0022,a6),d1
	swap.w	d1
	move.w	d2,d1
	moveq.l	#$00,d2
	trap	#2
L00103a:
	rts

L00103c:
	tst.b	($0017,a6)
	bne.s	L001048
	moveq.l	#$67,d0			;'g'
	moveq.l	#$01,d1
	trap	#15
L001048:
	moveq.l	#$67,d0			;'g'
	moveq.l	#$00,d1
	trap	#15
	rts

L001050:
	tst.b	($0018,a6)
	bmi.s	L001092
	tst.b	($0016,a6)
	bpl.s	L00106a
	tst.b	($0020,a6)
	bne.s	L00106a
	move.l	($0008,a6),d0
	add.l	d0,($000c,a6)
L00106a:
	tst.b	($0024,a6)
	beq.s	L00107c
	tst.b	($0020,a6)
	bne.s	L001092
	tst.b	($0025,a6)
	bne.s	AdvanceLFODelay
L00107c:
	btst.b	#$05,($0016,a6)
	beq.s	L001086
	bsr.s	L0010b4
L001086:
	btst.b	#$06,($0016,a6)
	beq.s	L001092
	bsr.w	L001116
L001092:
	rts

AdvanceLFODelay:
	subq.b	#1,($0025,a6)
	bne.s	L0010b2
	btst.b	#$05,($0016,a6)
	beq.s	L0010a6
	bsr.w	L001562
L0010a6:
	btst.b	#$06,($0016,a6)
	beq.s	L0010b2
	bsr.w	L0015d0
L0010b2:
	rts

L0010b4:
	move.l	($0032,a6),d1
	movea.l	($0026,a6),a0
	jmp	(a0)

L0010be:
	add.l	d1,($0036,a6)
	subq.w	#1,($003e,a6)
	bne.s	L0010d2
	move.w	($003c,a6),($003e,a6)
	neg.l	($0036,a6)
L0010d2:
	rts

L0010d4:
	move.l	d1,($0036,a6)
	subq.w	#1,($003e,a6)
	bne.s	L0010e8
	move.w	($003c,a6),($003e,a6)
	neg.l	($0032,a6)
L0010e8:
	rts

L0010ea:
	add.l	d1,($0036,a6)
	subq.w	#1,($003e,a6)
	bne.s	L0010fe
	move.w	($003c,a6),($003e,a6)
	neg.l	($0032,a6)
L0010fe:
	rts

L001100:
	subq.w	#1,($003e,a6)
	bne.s	L001114
	bsr.s	L00117a
	muls.w	d1,d0
	move.l	d0,($0036,a6)
	move.w	($003c,a6),($003e,a6)
L001114:
	rts

L001116:
	move.w	($0048,a6),d1
	movea.l	($0040,a6),a0
	jmp	(a0)

L001120:
	add.w	d1,($004a,a6)
	subq.w	#1,($004e,a6)
	bne.s	L001136
	move.w	($004c,a6),($004e,a6)
	move.w	($0046,a6),($004a,a6)
L001136:
	rts

L001138:
	subq.w	#1,($004e,a6)
	bne.s	L00114c
	move.w	($004c,a6),($004e,a6)
	add.w	d1,($004a,a6)
	neg.w	($0048,a6)
L00114c:
	rts

L00114e:
	add.w	d1,($004a,a6)
	subq.w	#1,($004e,a6)
	bne.s	L001162
	move.w	($004c,a6),($004e,a6)
	neg.w	($0048,a6)
L001162:
	rts

L001164:
	subq.w	#1,($004e,a6)
	bne.s	L001178
	bsr.s	L00117a
	muls.w	d0,d1
	move.w	($004c,a6),($004e,a6)
	move.w	d1,($004a,a6)
L001178:
	rts

L00117a:
	move.w	(-$107c,a5),d0
	mulu.w	#$c549,d0
	add.l	#$0000000c,d0
	move.w	d0,(-$107c,a5)
	lsr.l	#8,d0
	rts

L001190:
	.dc.b	$12,$34
L001192:
	lea.l	(chanel_sync_wait,pc),a0
	tst.b	(a0,d7.w)
	bne.s	L00119e
	rts

L00119e:
	clr.b	(a0,d7.w)
	cmp.w	#$0009,d7
	bcc.s	L0011ac
	clr.b	($27,a5,d7.w)
L0011ac:
	andi.b	#$f7,($0017,a6)
	bra.s	InitChannel

L0011b4:
	btst.b	#$03,($0017,a6)
	bne.s	L001192
	btst.b	#$02,($0016,a6)
	bne.s	L0011ce
	subq.b	#1,($001b,a6)
	bne.s	L0011ce
	bsr.w	L000fe6
L0011ce:
	subq.b	#1,($001a,a6)
	bne.s	L001224
InitChannel:
	movea.l	(a6),a4
	andi.b	#$7b,($0016,a6)
L0011dc:
	moveq.l	#$00,d0
	moveq.l	#$00,d1
	move.b	(a4)+,d0
	move.b	d0,d1
	bpl.s	L001216
	cmp.b	#$e0,d0
	bcc.s	L00122e
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
	bmi.s	L001226
	mulu.w	d0,d1
	lsr.w	#3,d1
L001216:
	addq.w	#1,d1
	move.b	d1,($001b,a6)
	addq.w	#1,d0
	move.b	d0,($001a,a6)
	move.l	a4,(a6)
L001224:
	rts

L001226:
	add.b	d0,d1
	bcs.s	L001216
	moveq.l	#$00,d1
	bra.s	L001216

L00122e:
	ext.w	d0
	not.w	d0
	add.w	d0,d0
	move.w	(CommandFuncs,pc,d0.w),d0
	pea.l	(L0011dc,pc)
	jmp	(CommandFuncs,pc,d0.w)

L001240:
	ext.w	d0
	not.w	d0
	add.w	d0,d0
	move.w	(CommandFuncs,pc,d0.w),d0
	pea.l	(L00177a,pc)
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
	.dc.w	EnablePCM8CommandFunc-CommandFuncs
	.dc.w	FadeOutCommandFunc-CommandFuncs
	.dc.w	EndPlayCommand-CommandFuncs
	.dc.w	EndPlayCommand-CommandFuncs
	.dc.w	EndPlayCommand-CommandFuncs
	.dc.w	EndPlayCommand-CommandFuncs
	.dc.w	EndPlayCommand-CommandFuncs
	.dc.w	EndPlayCommand-CommandFuncs
	.dc.w	EndPlayCommand-CommandFuncs
SetTempoCommandFunc:
	moveq.l	#$12,d1
	move.b	(a4)+,d2
	move.b	d2,(-$0400,a5)
	tst.b	(-$0404,a5)
	bne.s	L0012a4
	bra.w	L_WRITEOPM

L0012a4:
	rts

WriteOPMCommandFunc:
	move.b	(a4)+,d1
	move.b	(a4)+,d2
	cmp.b	#$12,d1
	bne.s	L0012ba
	tst.b	(-$0404,a5)
	bne.s	L0012a4
	move.b	d2,(-$0400,a5)
L0012ba:
	bra.w	L_WRITEOPM

SetVoiceCommandFunc:
	tst.b	($0018,a6)
	bmi.s	L0012e0
	move.b	(a4)+,d0
	movea.l	($001c,a5),a0
	bra.s	L0012d0

L0012cc:
	lea.l	($001a,a0),a0
L0012d0:
	cmp.b	(a0)+,d0
	bne.s	L0012cc
	move.l	a0,($0004,a6)
	ori.b	#$02,($0017,a6)
	rts

L0012e0:
	move.b	(a4)+,($0004,a6)
	rts

PanCommandFunc:
	tst.b	($0018,a6)
	bmi.s	L001302
	move.b	($001c,a6),d0
	ror.w	#6,d0
	move.b	(a4)+,d0
	rol.w	#6,d0
	move.b	d0,($001c,a6)
	ori.b	#$04,($0017,a6)
	rts

L001302:
	move.b	(a4)+,d0
	beq.s	L00130c
	cmp.b	#$03,d0
	bne.s	L001310
L00130c:
	eori.b	#$03,d0
L001310:
	andi.b	#$fc,($001c,a6)
	or.b	d0,($001c,a6)
	rts

VolumeCommandFunc:
	move.b	(a4)+,($0022,a6)
	ori.b	#$01,($0017,a6)
	rts

VolumeDownCommandFunc:
	move.b	($0022,a6),d2
	bmi.s	L00133c
	beq.s	L00133a
L001330:
	subq.b	#1,($0022,a6)
	ori.b	#$01,($0017,a6)
L00133a:
	rts

L00133c:
	cmp.b	#-$01,d2
	bne.s	L001350
	rts

VolumeUpCommandFunc:
	move.b	($0022,a6),d2
	bmi.s	L00135c
	cmp.b	#$0f,d2
	beq.s	L00135a
L001350:
	addq.b	#1,($0022,a6)
	ori.b	#$01,($0017,a6)
L00135a:
	rts

L00135c:
	cmp.b	#$80,d2
	bne.s	L001330
	rts

SetNoteLengthCommandFunc:
	move.b	(a4)+,($001e,a6)
	rts

SetLegatoCommandFunc:
	ori.b	#$04,($0016,a6)
	rts

RepeatStartCommandFunc:
	move.b	(a4)+,(a4)+
	rts

RepeatEndCommandFunc:
	moveq.l	#$ff,d0
	move.b	(a4)+,-(sp)
	move.w	(sp)+,d0
	move.b	(a4)+,d0
	subq.b	#1,(-$01,a4,d0.l)
	beq.s	L001398
	tst.b	(-$0401,a5)
	beq.s	L001396
	cmpi.b	#$f1,(a4)
	bne.s	L001396
	tst.b	($0001,a4)
	beq.s	L0013e6
L001396:
	adda.w	d0,a4
L001398:
	rts

RepeatEscapeCommandFunc:
	moveq.l	#$00,d0
	move.b	(a4)+,-(sp)
	move.w	(sp)+,d0
	move.b	(a4)+,d0
	lea.l	(a4,d0.l),a0
	moveq.l	#$ff,d0
	move.b	(a0)+,-(sp)
	move.w	(sp)+,d0
	move.b	(a0)+,d0
	cmpi.b	#$01,(-$01,a0,d0.l)
	bne.s	L0013b8
	movea.l	a0,a4
L0013b8:
	rts

DetuneCommandFunc:
	move.b	(a4)+,-(sp)
	move.w	(sp)+,d0
	move.b	(a4)+,d0
	move.w	d0,($0010,a6)
	rts

PortamentoCommandFunc:
	move.b	(a4)+,-(sp)
	move.w	(sp)+,d0
	move.b	(a4)+,d0
	ext.l	d0
	asl.l	#8,d0
	move.l	d0,($0008,a6)
	ori.b	#$80,($0016,a6)
	rts

PerformanceEndCommandFunc:
	moveq.l	#$ff,d0
	move.b	(a4)+,-(sp)
	beq.s	InitFadeout
	move.w	(sp)+,d0
	move.b	(a4)+,d0
L0013e6:
	adda.l	d0,a4
	move.w	(channel_enable,pc),d0
	bclr.l	d7,d0
	move.w	d0,(-$03f2,a5)
	and.w	(L001e06,pc),d0
	bne.s	L00143e
	tst.b	(-$03f4,a5)
	bne.s	L001416
	move.w	#$01ff,(-$03f2,a5)
	tst.b	(-$0418,a5)
	beq.s	L001410
	ori.w	#$fe00,(-$03f2,a5)
L001410:
	addq.w	#1,($003a,a5)
	bra.s	L00143e

L001416:
	tst.b	(-$03f5,a5)
	bne.s	L00143e
	move.w	#$01ff,(-$03f2,a5)
	tst.b	(-$0418,a5)
	beq.s	L00142e
	ori.w	#$fe00,(-$03f2,a5)
L00142e:
	subq.w	#1,(-$03ea,a5)
	bne.s	L00143e
	move.w	#$0011,(-$03ee,a5)
	st.b	(-$03f5,a5)
L00143e:
	rts

InitFadeout:
	addq.w	#2,sp
EndPlayCommand:
	lea.l	(EndPlayBytes,pc),a4
	move.w	(channel_enable,pc),d0
	bclr.l	d7,d0
	move.w	d0,(-$03f2,a5)
	move.w	(L001e06,pc),d0
	bclr.l	d7,d0
	move.w	d0,(-$0406,a5)
	bne.s	L001490
	move.b	#$01,(-$03f9,a5)
	tst.b	(-$0418,a5)
	beq.s	L001472
	move.w	#$01ff,d0
	trap	#2
	clr.b	(-$0418,a5)
L001472:
	tst.b	(-$03f4,a5)
	bne.s	L001480
	move.w	#$ffff,($003a,a5)
	bra.s	L001490

L001480:
	move.w	#$ffff,(-$03ee,a5)
	st.b	(-$03f5,a5)
	move.w	#$0037,(-$03f8,a5)	;'7'
L001490:
	rts

KeyOnDelayCommandFunc:
	move.b	(a4)+,($001f,a6)
	rts

SyncSendCommandFunc:
	moveq.l	#$00,d0
	move.b	(a4)+,d0
	lea.l	(chanel_sync_wait,pc),a0
	st.b	(a0,d0.w)
	cmp.w	#$0009,d0
	bcc.s	L0014ae
	st.b	($27,a5,d0.w)
L0014ae:
	rts

SyncWaitCommandFunc:
	lea.l	(chanel_sync_wait,pc),a0
	tst.b	(a0,d7.w)
	beq.s	L0014d0
	clr.b	(a0,d7.w)
	cmp.w	#$0009,d7
	bcc.s	L0014c8
	clr.b	($27,a5,d7.w)
L0014c8:
	andi.b	#$f7,($0017,a6)
	rts

L0014d0:
	ori.b	#$08,($0017,a6)
	move.l	a4,(a6)
	addq.w	#4,sp
	rts

SetNoiseFreqCommandFunc:
	move.b	(a4)+,d2
	tst.b	($0018,a6)
	bmi.s	L0014ee
	move.b	d2,($0026,a5)
	moveq.l	#$0f,d1
	bra.w	L_WRITEOPM

L0014ee:
	lsl.b	#2,d2
	andi.b	#$03,($001c,a6)
	or.b	d2,($001c,a6)
	rts

PitchModulationCommandFunc:
	ori.b	#$20,($0016,a6)
	moveq.l	#$00,d1
	move.b	(a4)+,d1
	bmi.s	L001576
	move.w	d1,-(sp)
	andi.b	#$03,d1
	add.w	d1,d1
	move.w	(L001588,pc,d1.w),d0
	lea.l	(L001588,pc,d0.w),a0
	move.l	a0,($0026,a6)
	move.b	(a4)+,-(sp)
	move.w	(sp)+,d2
	move.b	(a4)+,d2
	move.w	d2,($003c,a6)
	cmp.b	#$02,d1
	beq.s	L001536
	lsr.w	#1,d2
	cmpi.b	#$06,d1
	bne.s	L001536
	moveq.l	#$01,d2
L001536:
	move.w	d2,($003a,a6)
	move.b	(a4)+,-(sp)
	move.w	(sp)+,d0
	move.b	(a4)+,d0
	ext.l	d0
	asl.l	#8,d0
	move.w	(sp)+,d1
	cmpi.b	#$04,d1
	bcs.s	L001552
	asl.l	#8,d0
	andi.b	#$03,d1
L001552:
	move.l	d0,($002e,a6)
	cmp.b	#$02,d1
	beq.s	L00155e
	moveq.l	#$00,d0
L00155e:
	move.l	d0,($002a,a6)
L001562:
	move.w	($003a,a6),($003e,a6)
	move.l	($002e,a6),($0032,a6)
	move.l	($002a,a6),($0036,a6)
	rts

L001576:
	and.b	#$01,d1
	bne.s	L001562
	andi.b	#$df,($0016,a6)
	clr.l	($0036,a6)
	rts

L001588:
	.dc.b	$fb,$36,$fb,$4c,$fb,$62,$fb,$78
AmplitudeModulationCommandFunc:
	ori.b	#$40,($0016,a6)
	moveq.l	#$00,d2
	move.b	(a4)+,d2
	bmi.s	L0015e4
	add.w	d2,d2
	move.w	(L0015f6,pc,d2.w),d0
	lea.l	(L0015f6,pc,d0.w),a0
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
	bne.s	L0015c6
	muls.w	d1,d0
L0015c6:
	neg.w	d0
	bpl.s	L0015cc
	moveq.l	#$00,d0
L0015cc:
	move.w	d0,($0046,a6)
L0015d0:
	move.w	($004c,a6),($004e,a6)
	move.w	($0044,a6),($0048,a6)
	move.w	($0046,a6),($004a,a6)
	rts

L0015e4:
	and.b	#$01,d2
	bne.s	L0015d0
	andi.b	#$bf,($0016,a6)
	clr.w	($004a,a6)
	rts

L0015f6:
	.dc.b	$fb,$2a,$fb,$42,$fb,$58,$fb,$6e
OPMLFOCommandFunc:
	move.b	(a4)+,d2
	bmi.s	L00164a
	andi.b	#$fd,($0016,a6)
	bclr.l	#$06,d2
	beq.s	L001614
	ori.b	#$02,($0016,a6)
L001614:
	move.b	($09da),d0
	and.b	#$c0,d0
	or.b	d0,d2
	moveq.l	#$1b,d1
	bsr.w	L_WRITEOPM
	moveq.l	#$18,d1
	move.b	(a4)+,d2
	bsr.w	L_WRITEOPM
	moveq.l	#$19,d1
	move.b	(a4)+,d2
	bsr.w	L_WRITEOPM
	move.b	(a4)+,d2
	bsr.w	L_WRITEOPM
	move.b	(a4)+,d2
	move.b	d2,($0021,a6)
L001640:
	moveq.l	#$38,d1			;'8'
	add.b	($0018,a6),d1
	bra.w	L_WRITEOPM

L00164a:
	and.b	#$01,d2
	beq.s	L001640
	move.b	($0021,a6),d2
	bra.s	L001640

SetLFOKeyOnDelayCommandFunc:
	move.b	(a4)+,($0024,a6)
	rts

EnablePCM8CommandFunc:
	movea.l	($0088),a0
	cmpa.l	#$00f00000,a0
	bcc.s	L001692
	cmpi.l	#$50434d34,(-$0008,a0)	;'PCM4'
	beq.s	L00167c
	cmpi.l	#$50434d38,(-$0008,a0)	;'PCM8'
	bne.s	L001692
L00167c:
	st.b	(-$0418,a5)
	move.w	#$01fe,d0
	trap	#2
	ori.w	#$fe00,(-$03f2,a5)
	ori.w	#$fe00,(-$0406,a5)
L001692:
	rts

FadeOutCommandFunc:
	moveq.l	#$00,d0
	move.b	(a4)+,d0
	cmp.w	#$0007,d0
	bcc.w	EndPlayCommand
	add.w	d0,d0
	move.w	(FadeOutFuncs,pc,d0.w),d0
	jmp	(FadeOutFuncs,pc,d0.w)

FadeOutFuncs:
	.dc.w	EndPlayCommand-FadeOutFuncs
	.dc.w	EnableFadeout-FadeOutFuncs
	.dc.w	AdvanceChannel-FadeOutFuncs
	.dc.w	L0016fa-FadeOutFuncs
	.dc.w	L00170e-FadeOutFuncs
	.dc.w	L00178a-FadeOutFuncs
	.dc.w	L0017a0-FadeOutFuncs
EnableFadeout:
	moveq.l	#$00,d0
	move.b	(a4)+,d0
	move.w	d0,(-$03ee,a5)
	st.b	(-$03f5,a5)
	rts

AdvanceChannel:
	movea.l	($0088),a0
	move.l	(-$0008,a0),d0
	cmp.l	#$50434d38,d0		;'PCM8'
	beq.s	L0016e2
	cmp.l	#$50434d34,d0		;'PCM4'
	beq.s	L0016e2
	addq.w	#6,a4
	rts

L0016e2:
	move.b	(a4)+,-(sp)
	move.w	(sp)+,d0
	move.b	(a4)+,d0
	move.b	(a4)+,-(sp)
	move.w	(sp)+,d1
	move.b	(a4)+,d1
	swap.w	d1
	move.b	(a4)+,-(sp)
	move.w	(sp)+,d1
	move.b	(a4)+,d1
	trap	#2
	rts

L0016fa:
	tst.b	(a4)+
	beq.s	L001706
	ori.b	#$10,($0016,a6)
	rts

L001706:
	andi.b	#$ef,($0016,a6)
	rts

L00170e:
	move.b	(a4)+,d0
	movem.l	d7/a6,-(sp)
	lea.l	(-$02d0,a5),a6
	move.w	d0,d7
	cmp.b	#$09,d0
	bcs.s	L001724
	lea.l	(-$0918,a5),a6
L001724:
	mulu.w	#$0050,d0
	adda.w	d0,a6
	move.l	(a6),-(sp)
	andi.b	#$7b,($0016,a6)
	moveq.l	#$00,d0
	moveq.l	#$00,d1
	move.b	(a4)+,d0
	move.b	d0,d1
	bpl.s	L00176e
	cmp.b	#$e0,d0
	bcc.w	L001240
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
	bmi.s	L001782
	mulu.w	d0,d1
	lsr.w	#3,d1
L00176e:
	addq.w	#1,d1
	move.b	d1,($001b,a6)
	addq.w	#1,d0
	move.b	d0,($001a,a6)
L00177a:
	move.l	(sp)+,(a6)
	movem.l	(sp)+,d7/a6
	rts

L001782:
	add.b	d0,d1
	bcs.s	L00176e
	moveq.l	#$00,d1
	bra.s	L00176e

L00178a:
	move.b	(a4)+,d0
	move.b	d0,d1
	bsr.w	L001216
	andi.b	#$fe,($0016,a6)
	bsr.w	SetPCMVolume
	addq.w	#4,sp
	rts

L0017a0:
	tst.b	(a4)+
	beq.s	L0017ac
	ori.b	#$80,($0017,a6)
	rts

L0017ac:
	andi.b	#$7f,($0017,a6)
	rts

L_WRITEOPM:
	ori.w	#$0300,sr
	tst.b	($00e90003)
	bmi.s	L_WRITEOPM
	move.b	d1,($00e90001)
	and.w	#$00ff,d1
	lea.l	(L001e3c,pc),a2
	move.b	d2,(a2,d1.w)
	move.b	d2,($00e90003)
	andi.w	#$faff,sr
	cmp.b	#$1b,d1
	beq.s	L0017e4
	rts

L0017e4:
	move.b	d2,($09da)
	rts

Start:
	clr.l	-(sp)
	DOS	_SUPER
	pea.l	(VersionString,pc)
	DOS	_PRINT
	lea.l	(L00220c,pc),a5
	move.w	#$0001,(-$03fa,a5)
	clr.l	(-$0404,a5)
	move.l	($0008,a0),(-$065c,a5)
	move.l	#$00010000,($0014,a5)
	move.l	#$0004e000,($0018,a5)
	move.l	#$00000600,(-$0664,a5)
	clr.b	($0024,a5)
	clr.b	($0025,a5)
	addq.w	#1,a2
	bsr.s	ParseCmdLineArgs
	lea.l	(L002248,pc),a4
	lea.l	(mdx_data,pc),a1
	move.l	a4,(a1)
	adda.l	($0014,a5),a4
	move.l	a4,($0004,a1)
	adda.l	($0018,a5),a4
	move.l	a4,(-$0660,a5)
	adda.l	(-$0664,a5),a4
	cmpa.l	($0008,a0),a4
	bhi.w	PrintInsufficientMemory
	suba.l	a0,a0
	move.l	($0090,a0),(a5)
	move.l	($010c,a0),($0004,a5)
	lea.l	(L00000c,pc),a1
	move.l	a1,($0090,a0)
	lea.l	(L000000,pc),a1
	suba.l	a1,a4
	clr.w	-(sp)
	move.l	a4,-(sp)
	DOS	_KEEPPR

L001872:
	movea.l	($0090),a4
	cmpa.l	#$00fe0000,a4
	bcc.s	L001890
	subq.w	#8,a4
	lea.l	(L000004,pc),a3
	move.w	#$0004,d0
L001888:
	cmpm.b	(a3)+,(a4)+
	bne.s	L001890
	dbra.w	d0,L001888
L001890:
	rts

ParseCmdLineArgs:
	move.b	(a2)+,d0
	bne.s	L00189e
	bsr.s	L001872
	beq.w	PrintAlreadyLoaded
	rts

L00189e:
	cmp.b	#$20,d0			;' '
	beq.s	ParseCmdLineArgs
	cmp.b	#$09,d0
	beq.s	ParseCmdLineArgs
	cmp.b	#$2d,d0			;'-'
	beq.s	L0018b8
	cmp.b	#$2f,d0			;'/'
	bne.w	PrintHelp
L0018b8:
	move.b	(a2)+,d0
	beq.w	PrintHelp
	or.b	#$20,d0
	cmp.b	#$72,d0			;'r'
	bne.s	L0018e8
	bsr.s	L001872
	bne.w	PrintNotLoaded
	moveq.l	#$00,d0
	trap	#4
	tst.l	d0
	bne.s	L0018e2
	pea.l	(MXDRVReleasedString,pc)
L0018da:
	DOS	_PRINT
	addq.w	#4,sp
	clr.w	-(sp)
	DOS	_EXIT2

L0018e2:
	pea.l	(CouldNotReleaseString,pc)
	bra.s	L0018da

L0018e8:
	bsr.s	L001872
	beq.w	PrintAlreadyLoaded
	cmp.b	#$6d,d0			;'m'
	bne.s	L001904
	cmpi.b	#$3a,(a2)		;':'
	bne.s	L0018fc
	addq.w	#1,a2
L0018fc:
	bsr.s	L001966
	move.l	d0,($0014,a5)
	bra.s	ParseCmdLineArgs

L001904:
	cmp.b	#$70,d0			;'p'
	bne.s	L00191c
	cmpi.b	#$3a,(a2)		;':'
	bne.s	L001912
	addq.w	#1,a2
L001912:
	bsr.s	L001966
	move.l	d0,($0018,a5)
	bra.w	ParseCmdLineArgs

L00191c:
	cmp.b	#$62,d0			;'b'
	bne.s	L00193c
	cmpi.b	#$3a,(a2)		;':'
	bne.s	L00192a
	addq.w	#1,a2
L00192a:
	bsr.s	L001972
	move.l	d0,-(sp)
	add.l	d0,d0
	add.l	(sp)+,d0
	lsl.l	#8,d0
	move.l	d0,(-$0664,a5)
	bra.w	ParseCmdLineArgs

L00193c:
	cmpi.b	#$66,d0			;'f'
	bne.s	PrintHelp
	cmpi.b	#$3a,(a2)		;':'
	bne.s	L00194a
	addq.w	#1,a2
L00194a:
	move.l	a2,-(sp)
	bsr.s	L001972
	cmpa.l	(sp)+,a2
	beq.s	L00195a
	andi.l	#$00007fff,d0
	bra.s	L00195c

L00195a:
	moveq.l	#$11,d0
L00195c:
	move.w	d0,(L000b90+$000002)
	bra.w	ParseCmdLineArgs

L001966:
	bsr.s	L001972
	tst.l	d0
	bmi.s	PrintHelp
	moveq.l	#$0a,d1
	lsl.l	d1,d0
	rts

L001972:
	moveq.l	#$00,d0
L001974:
	moveq.l	#$00,d1
	move.b	(a2),d1
	sub.b	#$30,d1			;'0'
	bcs.s	L001992
	cmp.b	#$09,d1
	bhi.s	L001992
	add.l	d0,d0
	add.l	d0,d1
	add.l	d0,d0
	add.l	d0,d0
	add.l	d1,d0
	addq.w	#1,a2
	bra.s	L001974

L001992:
	rts

PrintNotLoaded:
	pea.l	(MXDRVNotLoadedString,pc)
	bra.s	L0019aa

PrintAlreadyLoaded:
	pea.l	(MXDRVAlreadyLoadedString,pc)
	bra.s	L0019aa

PrintInsufficientMemory:
	pea.l	(InsufficientMemoryString,pc)
	bra.s	L0019aa

PrintHelp:
	pea.l	(HelpString,pc)
L0019aa:
	DOS	_PRINT
	move.w	#$ffff,-(sp)
	DOS	_EXIT2

EndPlayBytes:
	.dc.b	$7f,$f1,$00
VersionString:
	.dc.b	'X68k MXDRV music driver version 2.06+17 Rel.X5-S (c)1988-92 milk.,K.MAEKAWA, Missy.M, Yatsube',$0d,$0a,$00
HelpString:
	.dc.b	'使い方: mxdrv [switch]',$0d,$0a
	.dc.b	$09,'-m:<num> MMLバッファサイズ(Kbytes)',$09,$09,'[省略時 64]',$0d,$0a
	.dc.b	$09,'-p:<num> PCMバッファサイズ(Kbytes)',$09,$09,'[省略時312]',$0d,$0a
	.dc.b	$09,'-b:<num> LINKバッファサイズ(banks)',$09,$09,'[省略時  2]',$0d,$0a
	.dc.b	$09,'-f:<num> FADEOUT SPEED (FAST 0 - 32767 SLOW)',$09,'[省略時 23]',$0d,$0a
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
	.dc.b	$09,'mxdrvを解除出来ませんでした',$0d,$0a,$00

	.bss

L001ba6:
	.ds.b	14
pcm_work_area:
	.ds.b	16
L001bc4:
	.ds.b	560
pcm8_enable:
	.ds.b	2
chanel_sync_wait:
	.ds.b	16
L001e06:
	.ds.w	1
disable_timer_writes:
	.ds.b	2
ignore_keys:
	.ds.b	2
opm_tempo:
	.ds.b	2
L001e0e:
	.ds.b	4
paused:
	.ds.b	1
ended:
	.ds.b	1
fadeout_offset:
	.ds.b	3
fadeout_enable:
	.ds.b	2
L001e19:
	.ds.b	1
channel_enable:
	.ds.w	1
channel_mask:
	.ds.w	1
L001e1e:
	.ds.b	6
L001e24:
	.ds.l	1
L001e28:
	.ds.l	1
L001e2c:
	.ds.l	1
L001e30:
	.ds.l	1
mdx_data:
	.ds.l	1
pdx_data:
	.ds.l	1
L001e3c:
	.ds.b	256
L001f3c:
	.ds.b	720
L00220c:
	.ds.b	12
mdx_title:
	.ds.l	1
pdx_filename:
	.ds.l	1
mdx_size:
	.ds.l	1
pdx_size:
	.ds.l	1
voice_data:
	.ds.l	1
pdx_sample_indices:
	.ds.b	16
L00223c:
	.ds.b	10
loop_count:
	.ds.w	1
L002248:

	.end	Start
