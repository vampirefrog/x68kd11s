;=============================================
;  Filename pcm8.x
;  Time Stamp Sun Dec 30 23:03:24 2018
;
;  Base address 000000
;  Exec address 006512
;  Text size    006d4e byte(s)
;  Data size    000000 byte(s)
;  Bss  size    000000 byte(s)
;  966 Labels
;
;  Commandline dis  -b2 -h -m68000 --sp -q1 -B -M -p -o120 -gpcm8.lab --overwrite pcm8.x pcm8.s
;          DIS version 3.16
;=============================================

	.include	inc/doscall.mac
	.include	inc/iocscall.mac
	.include	inc/fefunc.mac

	.cpu	68000

	.text

Start:
	.dc.b	'@CM8/048'
Trap2Handler:
	ori.w	#$0700,sr
	movem.l	d1-d7/a0-a6,-(sp)
	cmpi.w	#$0030,d0		;'0'
	bcs.s	OutputFuncs
	cmpi.w	#$0070,d0		;'p'
	bcs.s	UnknownFunc
	cmpi.w	#$00a0,d0
	bcc.w	L0000be
	subi.w	#$0040,d0
OutputFuncs:
	moveq.l	#$0f,d7
	and.w	d0,d7
	cmpi.w	#$0008,d7
	bcc.s	UnknownFunc
	lsl.w	#6,d7
	lea.l	(L001682,pc),a6
	lea.l	(a6,d7.w),a6
	andi.w	#$00f0,d0
	tst.b	($0c32)
	beq.s	L000048
	addq.w	#8,d0
L000048:
	move.b	(L001961,pc),d7
	beq.s	L000050
	addq.w	#4,d0
L000050:
	movea.l	(JumpTable,pc,d0.w),a0
	jmp	(a0)

UnknownFunc:
	moveq.l	#$00,d0
	movem.l	(sp)+,d1-d7/a0-a6
	rte

JumpTable:
	.dc.l	L0004c6
	.dc.l	L000a50
	.dc.l	L000f54
	.dc.l	L000f54
	.dc.l	L0005a6
	.dc.l	L000b42
	.dc.l	L000f54
	.dc.l	L000f54
	.dc.l	L000686
	.dc.l	L000c42
	.dc.l	L000fd2
	.dc.l	L000fd2
	.dc.l	L000756
	.dc.l	L000d30
	.dc.l	L000fb4
	.dc.l	L000fb4
	.dc.l	L0007c4
	.dc.l	L000df6
	.dc.l	UnknownFunc
	.dc.l	UnknownFunc
	.dc.l	L000122
	.dc.l	L000122
	.dc.l	L000122
	.dc.l	L000122
L0000be:
	cmpi.w	#$0200,d0
	bcc.w	L0001fe
	cmpi.w	#$0100,d0
	bcs.s	L000104
	addq.b	#5,d0
	bcs.s	L0000ea
	cmpi.b	#$08,d0
	bcc.s	L000104
	tst.b	($0c32)
	bne.s	L000104
	move.b	(L001946,pc),d1
	beq.s	L0000e4
	addq.b	#3,d0
L0000e4:
	cmp.b	(L001961,pc),d1
	bne.s	L0000f6
L0000ea:
	ext.w	d0
	add.w	d0,d0
	move.w	(L00010c,pc,d0.w),d0
	jmp	(L00010c,pc,d0.w)

L0000f6:
	move.b	d1,(L001961)
	pea.l	($0000)
	bra.w	L001a02

L000104:
	moveq.l	#$00,d0
	movem.l	(sp)+,d1-d7/a0-a6
	rte

L00010c:
	.dc.w	L000138-L00010c
	.dc.w	L00018a-L00010c
	.dc.w	L0001ec-L00010c
	.dc.w	L0001ee-L00010c
	.dc.w	L0001f6-L00010c
	.dc.w	L00030a-L00010c
	.dc.w	L000422-L00010c
	.dc.w	L000440-L00010c
	.dc.w	L0009c8-L00010c
	.dc.w	L0009d8-L00010c
	.dc.w	L000a16-L00010c
L000122:
	move.w	($001e,a6),d0
	swap.w	d0
	move.w	($001c,a6),d0
	lsl.w	#8,d0
	move.b	(L00196e,pc),d0
	movem.l	(sp)+,d1-d7/a0-a6
	rte

L000138:
	moveq.l	#$00,d0
	move.l	(L00194e,pc),d0
	tst.l	d1
	bmi.w	L00021e
	swap.w	d1
	andi.w	#$0007,d1
	swap.w	d1
	move.l	d1,(L00194e)
	swap.w	d1
	add.w	d1,d1
	move.w	(L00016a,pc,d1.w),d1
	move.w	d1,(L001b84+$000002)
	move.w	d1,(L001ba8+$000002)
	bra.w	L00021e

L00016a:
	.dc.w	$f8ff,$f9ff,$faff,$fbff
	.dc.w	$fcff,$fdff,$feff,$ffff
L00017a:
	cmpi.w	#$0002,d1
	bcs.s	L000182
	moveq.l	#$02,d1
L000182:
	move.b	d1,(L001945)
	bra.s	L00019c

L00018a:
	tst.w	d1
	bmi.s	L0001c8
	cmpi.w	#$0002,d1
	bcs.s	L000196
	moveq.l	#$02,d1
L000196:
	move.b	d1,(L001944)
L00019c:
	moveq.l	#$00,d0
	move.b	(L001944),d0
	move.w	d0,d1
	add.w	d0,d0
	add.w	d1,d0
	add.b	(L001945),d0
	move.b	(L0001d0,pc,d0.w),(L001948)
	move.b	(L0001d9,pc,d0.w),(L001946)
	move.b	(L0001e2,pc,d0.w),(L001947)
L0001c8:
	moveq.l	#$00,d0
	move.b	(L001948,pc),d0
	bra.s	L00021e

L0001d0:
	.dc.b	$00,$00,$00,$00,$01,$02,$00,$02
	.dc.b	$02
L0001d9:
	.dc.b	$ff,$ff,$ff,$ff,$00,$00,$ff,$00
	.dc.b	$00
L0001e2:
	.dc.b	$ff,$ff,$ff,$ff,$00,$ff,$ff,$ff
	.dc.b	$ff,$00
L0001ec:
	bra.s	L00021c

L0001ee:
	st.b	(L001942)
	bra.s	L00021c

L0001f6:
	sf.b	(L001942)
	bra.s	L00021c

L0001fe:
	tst.w	d0
	bmi.s	L000268
	cmpi.w	#$7f00,d0
	beq.s	L000224
	cmpi.w	#$7f02,d0
	beq.w	L00017a
	cmpi.w	#$7f03,d0
	beq.s	L00023a
	cmpi.w	#$7f04,d0
	beq.s	L000252
L00021c:
	moveq.l	#$00,d0
L00021e:
	movem.l	(sp)+,d1-d7/a0-a6
	rte

L000224:
	subq.w	#2,d1
	beq.s	L000232
	addq.w	#2,d1
	sne.b	(L001949)
	bra.s	L00021c

L000232:
	not.b	(L001949)
	bra.s	L00021c

L00023a:
	cmpi.w	#$0008,d1
	bhi.s	L00024a
	moveq.l	#$08,d0
	sub.w	d1,d0
	move.w	d0,(L00194c)
L00024a:
	moveq.l	#$08,d0
	sub.w	(L00194c,pc),d0
	bra.s	L00021e

L000252:
	subq.w	#2,d1
	beq.s	L000260
	addq.w	#2,d1
	sne.b	(L00194b)
	bra.s	L00021c

L000260:
	not.b	(L00194b)
	bra.s	L00021c

L000268:
	moveq.l	#$ff,d0
	move.b	(L001942,pc),d1
	bne.s	L00021e
	moveq.l	#$fe,d0
	lea.l	(VectorOverrides,pc),a0
	moveq.l	#$06,d1
L000278:
	movea.l	(a0)+,a1
	move.l	(a0)+,d2
	cmp.l	(a1),d2
	bne.s	L00021e
	dbra.w	d1,L000278
	st.b	($00e840c0)
	move.b	#$10,($00e840c7)
	st.b	($00e840c0)
	move.b	#$88,($00e92003)
	lea.l	(VectorOverrides,pc),a0
	lea.l	(L001662,pc),a1
	moveq.l	#$06,d1
L0002aa:
	movea.l	(a0)+,a2
	addq.l	#4,a0
	move.l	(a1)+,(a2)
	dbra.w	d1,L0002aa
	move.b	#$40,(Start)		;'@'
	moveq.l	#$00,d1
	move.w	d1,($0c32)
	IOCS	_ADPCMMOD
	pea.l	(Start-$0000f0,pc)
	DOS	_MFREE
	addq.l	#4,sp
	bra.w	L00021c

VectorOverrides:
	.dc.l	$00000580
	.dc.l	Override_ADPCMOUT
	.dc.l	$00000588
	.dc.l	Override_ADPCMAOT
	.dc.l	$00000590
	.dc.l	Override_ADPCMLOT
	.dc.l	$0000059c
	.dc.l	Override_ADPCMMOD
	.dc.l	$000001a8
	.dc.l	DMAEndInterrupt
	.dc.l	$000001ac
	.dc.l	DMAErrorInterrupt
	.dc.l	$00000088
	.dc.l	Trap2Handler
L00030a:
	move.b	(L00195f,pc),d0
	bne.s	L00033c
	lea.l	(L0016a2,pc),a5
	moveq.l	#$00,d5
	move.w	d5,(a5)
	move.w	d5,($0040,a5)
	move.w	d5,($0080,a5)
	move.w	d5,($00c0,a5)
	move.w	d5,($0100,a5)
	move.w	d5,($0140,a5)
	move.w	d5,($0180,a5)
	move.w	d5,($01c0,a5)
	moveq.l	#$00,d0
	movem.l	(sp)+,d1-d7/a0-a6
	rte

L00033c:
	lea.l	(L001682,pc),a5
	moveq.l	#$00,d5
	move.l	d5,(a5)
	move.l	d5,($0004,a5)
	move.l	d5,($0040,a5)
	move.l	d5,($0044,a5)
	move.l	d5,($0080,a5)
	move.l	d5,($0084,a5)
	move.l	d5,($00c0,a5)
	move.l	d5,($00c4,a5)
	move.l	d5,($0100,a5)
	move.l	d5,($0104,a5)
	move.l	d5,($0140,a5)
	move.l	d5,($0144,a5)
	move.l	d5,($0180,a5)
	move.l	d5,($0184,a5)
	move.l	d5,($01c0,a5)
	move.l	d5,($01c4,a5)
	sf.b	(L00195f)
	st.b	(L00195e)
	moveq.l	#$00,d0
	movem.l	(sp)+,d1-d7/a0-a6
	rte

L000394:
	move.b	(L00195f,pc),d0
	bne.s	L0003c8
	lea.l	(L0016a2,pc),a5
	moveq.l	#$00,d5
	move.w	d5,(a5)
	move.w	d5,($0040,a5)
	move.w	d5,($0080,a5)
	move.w	d5,($00c0,a5)
	move.w	d5,($0100,a5)
	move.w	d5,($0140,a5)
	move.w	d5,($0180,a5)
	move.w	d5,($01c0,a5)
	moveq.l	#$00,d0
	movem.l	(sp)+,d1-d7/a0-a6
	move.w	(sp)+,sr
	rts

L0003c8:
	lea.l	(L001682,pc),a5
	moveq.l	#$00,d5
	move.l	d5,(a5)
	move.l	d5,($0004,a5)
	move.l	d5,($0040,a5)
	move.l	d5,($0044,a5)
	move.l	d5,($0080,a5)
	move.l	d5,($0084,a5)
	move.l	d5,($00c0,a5)
	move.l	d5,($00c4,a5)
	move.l	d5,($0100,a5)
	move.l	d5,($0104,a5)
	move.l	d5,($0140,a5)
	move.l	d5,($0144,a5)
	move.l	d5,($0180,a5)
	move.l	d5,($0184,a5)
	move.l	d5,($01c0,a5)
	move.l	d5,($01c4,a5)
	sf.b	(L00195f)
	st.b	(L00195e)
	moveq.l	#$00,d0
	movem.l	(sp)+,d1-d7/a0-a6
	move.w	(sp)+,sr
	rts

L000422:
	st.b	(L00195f)
	moveq.l	#$00,d0
	movem.l	(sp)+,d1-d7/a0-a6
	rte

L000430:
	st.b	(L00195f)
	moveq.l	#$00,d0
	movem.l	(sp)+,d1-d7/a0-a6
	move.w	(sp)+,sr
	rts

L000440:
	move.b	(L00195f,pc),d0
	beq.s	L00047a
	sf.b	(L00195f)
	lea.l	(L001682,pc),a5
	move.l	(a5),d5
	or.l	($0040,a5),d5
	or.l	($0080,a5),d5
	or.l	($00c0,a5),d5
	or.l	($0100,a5),d5
	or.l	($0140,a5),d5
	or.l	($0180,a5),d5
	or.l	($01c0,a5),d5
	seq.b	(L00195e)
	beq.s	L00047a
	bsr.w	L0007e4
L00047a:
	moveq.l	#$00,d0
	movem.l	(sp)+,d1-d7/a0-a6
	rte

L000482:
	move.b	(L00195f,pc),d0
	beq.s	L0004bc
	sf.b	(L00195f)
	lea.l	(L001682,pc),a5
	move.l	(a5),d5
	or.l	($0040,a5),d5
	or.l	($0080,a5),d5
	or.l	($00c0,a5),d5
	or.l	($0100,a5),d5
	or.l	($0140,a5),d5
	or.l	($0180,a5),d5
	or.l	($01c0,a5),d5
	seq.b	(L00195e)
	beq.s	L0004bc
	bsr.w	L0007e4
L0004bc:
	moveq.l	#$00,d0
	movem.l	(sp)+,d1-d7/a0-a6
	move.w	(sp)+,sr
	rts

L0004c6:
	move.b	(L001946,pc),d0
	bne.w	L000a5e
	move.b	(L00195f,pc),d0
	beq.s	L00052a
L0004d4:
	sf.b	(L001961)
	lea.l	(L001682,pc),a5
	moveq.l	#$00,d5
	move.l	d5,(a5)
	move.l	d5,($0004,a5)
	move.l	d5,($0040,a5)
	move.l	d5,($0044,a5)
	move.l	d5,($0080,a5)
	move.l	d5,($0084,a5)
	move.l	d5,($00c0,a5)
	move.l	d5,($00c4,a5)
	move.l	d5,($0100,a5)
	move.l	d5,($0104,a5)
	move.l	d5,($0140,a5)
	move.l	d5,($0144,a5)
	move.l	d5,($0180,a5)
	move.l	d5,($0184,a5)
	move.l	d5,($01c0,a5)
	move.l	d5,($01c4,a5)
	sf.b	(L00195f)
	st.b	(L00195e)
L00052a:
	tst.l	d2
	bmi.w	L0007c4
	beq.w	L000782
	bsr.w	L00086c
	beq.w	L000782
	cmpi.w	#$0005,($001c,a6)
	bne.s	L000556
	moveq.l	#$01,d0
	and.b	d2,d0
	bne.w	L000782
	move.l	a1,d0
	andi.b	#$01,d0
	bne.w	L000782
L000556:
	move.w	($0006,a6),d5
	add.w	d5,(L00195a)
	moveq.l	#$00,d5
	move.l	d5,(a6)
	move.l	d5,($0004,a6)
	move.b	(L00194a,pc),d5
	beq.s	L00058a
	btst.b	#$03,($00e840c0)
	beq.s	L00058a
	move.w	(L00195e,pc),d5
	beq.s	L00058e
	move.l	#$ff000000,(L00195c)
	bra.s	L00058e

L00058a:
	bsr.w	L0007e4
L00058e:
	moveq.l	#$00,d0
	move.w	d0,($0020,a6)
	move.l	d2,(a6)+
	move.l	d0,(a6)+
	move.l	a1,(a6)+
	move.l	#End+$00d702,(a6)
	movem.l	(sp)+,d1-d7/a0-a6
	rte

L0005a6:
	move.b	(L001946,pc),d0
	bne.w	L000b50
	move.b	(L00195f,pc),d0
	beq.s	L00060a
L0005b4:
	sf.b	(L001961)
	lea.l	(L001682,pc),a5
	moveq.l	#$00,d5
	move.l	d5,(a5)
	move.l	d5,($0004,a5)
	move.l	d5,($0040,a5)
	move.l	d5,($0044,a5)
	move.l	d5,($0080,a5)
	move.l	d5,($0084,a5)
	move.l	d5,($00c0,a5)
	move.l	d5,($00c4,a5)
	move.l	d5,($0100,a5)
	move.l	d5,($0104,a5)
	move.l	d5,($0140,a5)
	move.l	d5,($0144,a5)
	move.l	d5,($0180,a5)
	move.l	d5,($0184,a5)
	move.l	d5,($01c0,a5)
	move.l	d5,($01c4,a5)
	sf.b	(L00195f)
	st.b	(L00195e)
L00060a:
	tst.l	d2
	bmi.w	L0007c4
	tst.w	d2
	beq.w	L000782
	bsr.w	L00086c
	beq.w	L000782
	move.l	a1,d0
	andi.b	#$01,d0
	bne.w	L000782
	move.w	($0006,a6),d5
	add.w	d5,(L00195a)
	moveq.l	#$00,d5
	move.l	d5,(a6)
	move.l	d5,($0004,a6)
	move.b	(L00194a,pc),d5
	beq.s	L00065c
	btst.b	#$03,($00e840c0)
	beq.s	L00065c
	move.w	(L00195e,pc),d5
	beq.s	L000660
	move.l	#$ff000000,(L00195c)
	bra.s	L000660

L00065c:
	bsr.w	L0007e4
L000660:
	moveq.l	#$01,d1
	move.w	d1,($0020,a6)
	move.w	d2,($0022,a6)
	movea.l	(a1)+,a2
	move.w	(a1)+,d1
	move.l	a1,($0024,a6)
	move.l	d1,(a6)+
	moveq.l	#$00,d0
	move.l	d0,(a6)+
	move.l	a2,(a6)+
	move.l	#End+$00d702,(a6)
	movem.l	(sp)+,d1-d7/a0-a6
	rte

L000686:
	move.b	(L001946,pc),d0
	bne.w	L000c50
	move.b	(L00195f,pc),d0
	beq.s	L0006ea
L000694:
	sf.b	(L001961)
	lea.l	(L001682,pc),a5
	moveq.l	#$00,d5
	move.l	d5,(a5)
	move.l	d5,($0004,a5)
	move.l	d5,($0040,a5)
	move.l	d5,($0044,a5)
	move.l	d5,($0080,a5)
	move.l	d5,($0084,a5)
	move.l	d5,($00c0,a5)
	move.l	d5,($00c4,a5)
	move.l	d5,($0100,a5)
	move.l	d5,($0104,a5)
	move.l	d5,($0140,a5)
	move.l	d5,($0144,a5)
	move.l	d5,($0180,a5)
	move.l	d5,($0184,a5)
	move.l	d5,($01c0,a5)
	move.l	d5,($01c4,a5)
	sf.b	(L00195f)
	st.b	(L00195e)
L0006ea:
	bsr.w	L00086c
	beq.w	L000782
	move.l	a1,d0
	andi.b	#$01,d0
	bne.w	L000782
	move.w	($0006,a6),d5
	add.w	d5,(L00195a)
	moveq.l	#$00,d5
	move.l	d5,(a6)
	move.l	d5,($0004,a6)
	move.b	(L00194a,pc),d5
	beq.s	L000730
	btst.b	#$03,($00e840c0)
	beq.s	L000730
	move.w	(L00195e,pc),d5
	beq.s	L000734
	move.l	#$ff000000,(L00195c)
	bra.s	L000734

L000730:
	bsr.w	L0007e4
L000734:
	moveq.l	#$02,d1
	move.w	d1,($0020,a6)
	movea.l	(a1)+,a2
	move.w	(a1)+,d1
	move.l	a1,($0024,a6)
	move.l	d1,(a6)+
	moveq.l	#$00,d0
	move.l	d0,(a6)+
	move.l	a2,(a6)+
	move.l	#End+$00d702,(a6)
	movem.l	(sp)+,d1-d7/a0-a6
	rte

L000756:
	move.w	d1,-(sp)
	move.b	(sp)+,d0
	cmp.b	#$07,d0
	bcc.s	L000774
	cmp.b	($001d,a6),d0
	beq.s	L000774
	cmpi.b	#$05,d0
	bcc.s	L000782
	cmpi.w	#$0005,($001c,a6)
	bcc.s	L000782
L000774:
	bsr.w	L00086c
	beq.s	L000782
	moveq.l	#$00,d0
	movem.l	(sp)+,d1-d7/a0-a6
	rte

L000782:
	move.w	($0006,a6),d5
	add.w	d5,(L00195a)
	moveq.l	#$00,d5
	move.l	d5,(a6)
	move.l	d5,($0004,a6)
	lea.l	(L001682,pc),a5
	move.l	(a5),d5
	or.l	($0040,a5),d5
	or.l	($0080,a5),d5
	or.l	($00c0,a5),d5
	or.l	($0100,a5),d5
	or.l	($0140,a5),d5
	or.l	($0180,a5),d5
	or.l	($01c0,a5),d5
	seq.b	(L00195e)
	moveq.l	#$00,d0
	movem.l	(sp)+,d1-d7/a0-a6
	rte

L0007c4:
	move.b	(L00195e,pc),d0
	bne.w	L0009c8
	move.w	($0020,a6),d0
	beq.s	L0007dc
	neg.w	d0
	ext.l	d0
	movem.l	(sp)+,d1-d7/a0-a6
	rte

L0007dc:
	move.l	(a6),d0
	movem.l	(sp)+,d1-d7/a0-a6
	rte

L0007e4:
	movea.l	#$00e840c0,a5
	st.b	(a5)
	move.b	#$10,($0007,a5)
	st.b	(a5)
	move.l	#L00157a,($000c,a5)
	move.w	#$0004,($000a,a5)
	move.l	#L00157a,($001c,a5)
	move.w	#$002c,($001a,a5)	;','
	move.l	#$00e92003,($0014,a5)
	move.b	#$32,($0005,a5)		;'2'
	move.b	#$c8,($0007,a5)
	move.b	#$02,($00e92001)
	btst.b	#$07,($09da)
	beq.s	L000852
	movea.l	#$00e90003,a5
L00083a:
	tst.b	(a5)
	bmi.s	L00083a
	move.b	#$1b,(-$0002,a5)
L000844:
	tst.b	(a5)
	bmi.s	L000844
	bclr.b	#$07,($09da)
	move.b	($09da),(a5)
L000852:
	move.w	#$ffff,(L001952)
	move.l	#$ff000000,(L00195c)
	st.b	(L00194a)
	rts

L00086c:
	moveq.l	#$00,d7
	swap.w	d1
	cmpi.b	#$10,d1
	bcc.s	L00087c
	ext.w	d1
	move.w	d1,($001e,a6)
L00087c:
	swap.w	d1
	move.w	d1,-(sp)
	move.b	(sp)+,d7
	cmpi.b	#$07,d7
	bcc.s	L00088c
	move.b	d7,($001d,a6)
L00088c:
	tst.b	d1
	beq.s	L0008d6
	cmpi.b	#$04,d1
	bcc.s	L00089c
	move.b	d1,(L00196e)
L00089c:
	move.w	($001c,a6),d7
	cmpi.w	#$0007,d7
	bcc.s	L0008d6
	add.w	d7,d7
	move.w	(L0008da,pc,d7.w),($0016,a6)
	lsl.w	#3,d7
	tst.b	(L00194b)
	bne.s	L0008be
	ori.b	#$08,d7
	bra.s	L0008c2

L0008be:
	or.b	($001f,a6),d7
L0008c2:
	add.w	d7,d7
	move.w	(L0008e8,pc,d7.w),d7
	addi.l	#L0008e8,d7
	move.l	d7,($0018,a6)
	moveq.l	#$ff,d7
	rts

L0008d6:
	moveq.l	#$00,d7
	rts

L0008da:
	.dc.w	$000c,$0010,$0018,$0020
	.dc.w	$0030,$00c0,$0060
L0008e8:
	.dc.w	$27b8,$27f0,$2836,$286e
	.dc.w	$28b2,$28f8,$2930,$2974
	.dc.w	$2b5a,$29b2,$29ee,$2a2a
	.dc.w	$2a62,$2aa2,$2ade,$2b1a
	.dc.w	$2b8c,$2bc0,$2c02,$2c36
	.dc.w	$2c76,$2cb8,$2cec,$2d2c
	.dc.w	$2ef2,$2d66,$2d9e,$2dd6
	.dc.w	$2e0a,$2e46,$2e7e,$2eb6
	.dc.w	$2f20,$2f50,$2f8e,$2fbe
	.dc.w	$2ffa,$3038,$3068,$30a4
	.dc.w	$324a,$30da,$310e,$3142
	.dc.w	$3172,$31aa,$31de,$3212
	.dc.w	$3274,$32a2,$32de,$330c
	.dc.w	$3346,$3382,$33b0,$33ea
	.dc.w	$3580,$341e,$3450,$3482
	.dc.w	$34b0,$34e6,$3518,$354a
	.dc.w	$35a8,$366a,$3776,$3838
	.dc.w	$3942,$3a4e,$3b10,$3c1a
	.dc.w	$4304,$3cf6,$3dd0,$3eaa
	.dc.w	$3f6c,$405e,$4138,$4212
	.dc.w	$472e,$4766,$47ce,$4806
	.dc.w	$486e,$48d6,$490e,$4976
	.dc.w	$49ce,$4ad0,$4b28,$4b90
	.dc.w	$4bc8,$4c30,$4c88,$4cd0
	.dc.w	$51d0,$4d38,$5218,$4d3e
	.dc.w	$4d44,$5260,$4d4a,$52a8
	.dc.w	$5310,$5552,$55ba,$5632
	.dc.w	$567a,$56f2,$575a,$57b2
L0009c8:
	pea.l	($0000)
	bra.w	L001a02

L0009d0:
	pea.l	($0000)
	bra.w	L001a78

L0009d8:
	move.b	#$20,($00e840c7)	;' '
	move.b	#$88,($00e92003)
	st.b	(L00195f)
	moveq.l	#$00,d0
	movem.l	(sp)+,d1-d7/a0-a6
	rte

L0009f6:
	move.b	#$20,($00e840c7)	;' '
	move.b	#$88,($00e92003)
	st.b	(L00195f)
	moveq.l	#$00,d0
	movem.l	(sp)+,d1-d7/a0-a6
	move.w	(sp)+,sr
	rts

L000a16:
	move.b	(L00195f,pc),d0
	beq.s	L000a2a
	move.b	#$08,($00e840c7)
	sf.b	(L00195f)
L000a2a:
	moveq.l	#$00,d0
	movem.l	(sp)+,d1-d7/a0-a6
	rte

L000a32:
	move.b	(L00195f,pc),d0
	beq.s	L000a46
	move.b	#$08,($00e840c7)
	sf.b	(L00195f)
L000a46:
	moveq.l	#$00,d0
	movem.l	(sp)+,d1-d7/a0-a6
	move.w	(sp)+,sr
	rts

L000a50:
	move.b	(L001946,pc),d0
	beq.w	L0004d4
	move.b	(L00195f,pc),d0
	beq.s	L000abc
L000a5e:
	st.b	(L001961)
	move.b	#$01,(L001962)
	lea.l	(L001682,pc),a5
	moveq.l	#$00,d5
	move.l	d5,(a5)
	move.l	d5,($0004,a5)
	move.l	d5,($0040,a5)
	move.l	d5,($0044,a5)
	move.l	d5,($0080,a5)
	move.l	d5,($0084,a5)
	move.l	d5,($00c0,a5)
	move.l	d5,($00c4,a5)
	move.l	d5,($0100,a5)
	move.l	d5,($0104,a5)
	move.l	d5,($0140,a5)
	move.l	d5,($0144,a5)
	move.l	d5,($0180,a5)
	move.l	d5,($0184,a5)
	move.l	d5,($01c0,a5)
	move.l	d5,($01c4,a5)
	sf.b	(L00195f)
	st.b	(L00195e)
L000abc:
	tst.l	d2
	bmi.w	L000df6
	beq.w	L000db0
	bsr.w	L000ef8
	beq.w	L000db0
	lea.l	(L001682,pc),a5
	moveq.l	#$00,d5
	move.l	d5,(a5)
	move.l	d5,($0004,a5)
	move.l	d5,($0040,a5)
	move.l	d5,($0044,a5)
	move.l	d5,($0080,a5)
	move.l	d5,($0084,a5)
	move.l	d5,($00c0,a5)
	move.l	d5,($00c4,a5)
	move.l	d5,($0100,a5)
	move.l	d5,($0104,a5)
	move.l	d5,($0140,a5)
	move.l	d5,($0144,a5)
	move.l	d5,($0180,a5)
	move.l	d5,($0184,a5)
	move.l	d5,($01c0,a5)
	move.l	d5,($01c4,a5)
	sf.b	(L00195f)
	st.b	(L00195e)
	bsr.w	L000e1a
	moveq.l	#$00,d0
	move.w	d0,($0020,a6)
	move.b	d0,(L001963)
	move.l	d2,(a6)
	move.l	d2,(L00196a)
	move.l	a1,(L001966)
	movem.l	(sp)+,d1-d7/a0-a6
	rte

L000b42:
	move.b	(L001946,pc),d0
	beq.w	L0005b4
	move.b	(L00195f,pc),d0
	beq.s	L000bae
L000b50:
	st.b	(L001961)
	move.b	#$01,(L001962)
	lea.l	(L001682,pc),a5
	moveq.l	#$00,d5
	move.l	d5,(a5)
	move.l	d5,($0004,a5)
	move.l	d5,($0040,a5)
	move.l	d5,($0044,a5)
	move.l	d5,($0080,a5)
	move.l	d5,($0084,a5)
	move.l	d5,($00c0,a5)
	move.l	d5,($00c4,a5)
	move.l	d5,($0100,a5)
	move.l	d5,($0104,a5)
	move.l	d5,($0140,a5)
	move.l	d5,($0144,a5)
	move.l	d5,($0180,a5)
	move.l	d5,($0184,a5)
	move.l	d5,($01c0,a5)
	move.l	d5,($01c4,a5)
	sf.b	(L00195f)
	st.b	(L00195e)
L000bae:
	tst.l	d2
	bmi.w	L000df6
	tst.w	d2
	beq.w	L000db0
	bsr.w	L000ef8
	beq.w	L000db0
	move.l	a1,d0
	andi.b	#$01,d0
	bne.w	L000db0
	lea.l	(L001682,pc),a5
	moveq.l	#$00,d5
	move.l	d5,(a5)
	move.l	d5,($0004,a5)
	move.l	d5,($0040,a5)
	move.l	d5,($0044,a5)
	move.l	d5,($0080,a5)
	move.l	d5,($0084,a5)
	move.l	d5,($00c0,a5)
	move.l	d5,($00c4,a5)
	move.l	d5,($0100,a5)
	move.l	d5,($0104,a5)
	move.l	d5,($0140,a5)
	move.l	d5,($0144,a5)
	move.l	d5,($0180,a5)
	move.l	d5,($0184,a5)
	move.l	d5,($01c0,a5)
	move.l	d5,($01c4,a5)
	sf.b	(L00195f)
	st.b	(L00195e)
	bsr.w	L000e1a
	moveq.l	#$01,d0
	move.w	d0,($0020,a6)
	move.b	d0,(L001963)
	move.l	d0,(a6)
	move.w	d2,(L00196a)
	move.l	a1,(L001966)
	moveq.l	#$00,d0
	movem.l	(sp)+,d1-d7/a0-a6
	rte

L000c42:
	move.b	(L001946,pc),d0
	beq.w	L000694
	move.b	(L00195f,pc),d0
	beq.s	L000cae
L000c50:
	st.b	(L001961)
	move.b	#$01,(L001962)
	lea.l	(L001682,pc),a5
	moveq.l	#$00,d5
	move.l	d5,(a5)
	move.l	d5,($0004,a5)
	move.l	d5,($0040,a5)
	move.l	d5,($0044,a5)
	move.l	d5,($0080,a5)
	move.l	d5,($0084,a5)
	move.l	d5,($00c0,a5)
	move.l	d5,($00c4,a5)
	move.l	d5,($0100,a5)
	move.l	d5,($0104,a5)
	move.l	d5,($0140,a5)
	move.l	d5,($0144,a5)
	move.l	d5,($0180,a5)
	move.l	d5,($0184,a5)
	move.l	d5,($01c0,a5)
	move.l	d5,($01c4,a5)
	sf.b	(L00195f)
	st.b	(L00195e)
L000cae:
	bsr.w	L000ef8
	beq.w	L000db0
	move.l	a1,d0
	andi.b	#$01,d0
	bne.w	L000db0
	lea.l	(L001682,pc),a5
	moveq.l	#$00,d5
	move.l	d5,(a5)
	move.l	d5,($0004,a5)
	move.l	d5,($0040,a5)
	move.l	d5,($0044,a5)
	move.l	d5,($0080,a5)
	move.l	d5,($0084,a5)
	move.l	d5,($00c0,a5)
	move.l	d5,($00c4,a5)
	move.l	d5,($0100,a5)
	move.l	d5,($0104,a5)
	move.l	d5,($0140,a5)
	move.l	d5,($0144,a5)
	move.l	d5,($0180,a5)
	move.l	d5,($0184,a5)
	move.l	d5,($01c0,a5)
	move.l	d5,($01c4,a5)
	sf.b	(L00195f)
	st.b	(L00195e)
	bsr.w	L000e1a
	moveq.l	#$02,d0
	move.w	d0,($0020,a6)
	move.b	d0,(L001963)
	move.l	d0,(a6)
	move.l	a1,(L001966)
	moveq.l	#$00,d0
	movem.l	(sp)+,d1-d7/a0-a6
	rte

L000d30:
	move.w	d1,-(sp)
	move.b	(sp)+,d0
	cmp.b	#$07,d0
	bcc.s	L000d4e
	cmp.b	($001d,a6),d0
	beq.s	L000d4e
	cmpi.b	#$05,d0
	bcc.s	L000db0
	cmpi.w	#$0005,($001c,a6)
	bcc.s	L000db0
L000d4e:
	bsr.w	L000ef8
	beq.s	L000db0
	move.l	(a6),d0
	beq.s	L000da8
	moveq.l	#$00,d0
	move.b	(L001964,pc),d0
	add.w	d0,d0
	add.w	d0,d0
	or.b	(L001965,pc),d0
	add.w	d0,d0
	lea.l	(L000ed0,pc),a0
	move.w	(a0,d0.w),d1
	movea.l	#$00e9a005,a0
	moveq.l	#$f0,d0
	and.b	(a0),d0
	or.b	d1,d0
	move.b	d0,(a0)
	move.b	($09da),d1
	move.b	d1,d0
	add.b	d1,d1
	lsr.w	#1,d1
	cmp.b	d0,d1
	beq.s	L000da8
	movea.l	#$00e90003,a4
L000d92:
	tst.b	(a4)
	bmi.s	L000d92
	move.b	#$1b,(-$0002,a4)
	st.b	d7
L000d9e:
	tst.b	(a4)
	bmi.s	L000d9e
	move.b	d1,($09da)
	move.b	d1,(a4)
L000da8:
	moveq.l	#$00,d0
	movem.l	(sp)+,d1-d7/a0-a6
	rte

L000db0:
	move.w	($0006,a6),d5
	add.w	d5,(L00195a)
	moveq.l	#$00,d5
	move.l	d5,(a6)
	move.l	d5,($0004,a6)
	lea.l	(L001682,pc),a5
	move.l	(a5),d5
	or.l	($0040,a5),d5
	or.l	($0080,a5),d5
	or.l	($00c0,a5),d5
	or.l	($0100,a5),d5
	or.l	($0140,a5),d5
	or.l	($0180,a5),d5
	or.l	($01c0,a5),d5
	seq.b	(L00195e)
	beq.w	L0009c8
	moveq.l	#$00,d0
	movem.l	(sp)+,d1-d7/a0-a6
	rte

L000df6:
	move.b	(L00195e,pc),d0
	bne.w	L0009c8
	move.w	($0020,a6),d0
	beq.s	L000e0e
	neg.w	d0
	ext.l	d0
	movem.l	(sp)+,d1-d7/a0-a6
	rte

L000e0e:
	move.l	(a6),d0
	beq.s	L000e14
	moveq.l	#$fd,d0
L000e14:
	movem.l	(sp)+,d1-d7/a0-a6
	rte

L000e1a:
	movea.l	#$00e840c0,a5
	st.b	(a5)
	move.b	#$10,($0007,a5)
	st.b	(a5)
	move.l	#L00157a,($000c,a5)
	move.w	#$001a,($000a,a5)
	move.l	#L00157a,($001c,a5)
	move.w	#$0080,($001a,a5)
	move.l	#$00e92003,($0014,a5)
	move.b	#$32,($0005,a5)		;'2'
	move.b	#$c8,($0007,a5)
	move.b	#$02,($00e92001)
	movem.l	d0-d1,-(sp)
	move.b	(L001964,pc),d0
	add.w	d0,d0
	add.w	d0,d0
	or.b	(L001965,pc),d0
	add.w	d0,d0
	move.w	(L000ed0,pc,d0.w),d1
	movea.l	#$00e9a005,a5
	moveq.l	#$f0,d0
	and.b	(a5),d0
	or.b	d1,d0
	move.b	d0,(a5)
	move.b	($09da),d1
	move.b	d1,d0
	add.b	d1,d1
	lsr.w	#1,d1
	cmp.b	d0,d1
	beq.s	L000eae
	movea.l	#$00e90003,a5
L000e9a:
	tst.b	(a5)
	bmi.s	L000e9a
	move.b	#$1b,(-$0002,a5)
L000ea4:
	tst.b	(a5)
	bmi.s	L000ea4
	move.b	d1,($09da)
	move.b	d1,(a5)
L000eae:
	movem.l	(sp)+,d0-d1
	move.w	#$ffff,(L001952)
	st.b	(L001962)
	move.w	#$0000,(L00195e)
	st.b	(L00194a)
	rts

L000ed0:
	.dc.w	$0103,$0101,$0102,$0100
	.dc.w	$0107,$0105,$0106,$0104
	.dc.w	$0003,$0001,$0002,$0000
	.dc.w	$0007,$0005,$0006,$0004
	.dc.w	$000b,$0009,$000a,$0008
L000ef8:
	swap.w	d1
	cmpi.b	#$10,d1
	bcc.s	L000f06
	ext.w	d1
	move.w	d1,($001e,a6)
L000f06:
	swap.w	d1
	move.w	d1,-(sp)
	move.b	(sp)+,d7
	cmpi.b	#$07,d7
	bcc.s	L000f16
	move.b	d7,($001d,a6)
L000f16:
	tst.b	d1
	beq.s	L000f50
	cmpi.b	#$04,d1
	bcc.s	L000f26
	move.b	d1,(L00196e)
L000f26:
	cmpi.w	#$0005,($001c,a6)
	bcc.s	L000f50
	move.b	(L00196e,pc),d7
	move.b	d7,(L00196f)
	move.b	d7,(L001970)
	move.b	d7,(L001965)
	move.b	($001d,a6),(L001964)
	moveq.l	#$ff,d7
	rts

L000f50:
	moveq.l	#$00,d7
	rts

L000f54:
	lea.l	(L001682,pc),a5
	moveq.l	#$00,d5
	move.l	d5,(a5)
	move.l	d5,($0004,a5)
	move.l	d5,($0040,a5)
	move.l	d5,($0044,a5)
	move.l	d5,($0080,a5)
	move.l	d5,($0084,a5)
	move.l	d5,($00c0,a5)
	move.l	d5,($00c4,a5)
	move.l	d5,($0100,a5)
	move.l	d5,($0104,a5)
	move.l	d5,($0140,a5)
	move.l	d5,($0144,a5)
	move.l	d5,($0180,a5)
	move.l	d5,($0184,a5)
	move.l	d5,($01c0,a5)
	move.l	d5,($01c4,a5)
	sf.b	(L00195f)
	st.b	(L00195e)
	tst.l	d2
	ble.s	L000fac
	bsr.w	L00102c
L000fac:
	moveq.l	#$00,d0
	movem.l	(sp)+,d1-d7/a0-a6
	rte

L000fb4:
	move.w	d1,-(sp)
	move.b	(sp)+,d0
	cmp.b	#$07,d0
	bcc.s	L000fd2
	cmp.b	($001d,a6),d0
	beq.s	L000fd2
	cmpi.b	#$05,d0
	bcc.s	L000fac
	cmpi.w	#$0005,($001c,a6)
	bcc.s	L000fac
L000fd2:
	lea.l	(L001682,pc),a5
	moveq.l	#$00,d5
	move.l	d5,(a5)
	move.l	d5,($0004,a5)
	move.l	d5,($0040,a5)
	move.l	d5,($0044,a5)
	move.l	d5,($0080,a5)
	move.l	d5,($0084,a5)
	move.l	d5,($00c0,a5)
	move.l	d5,($00c4,a5)
	move.l	d5,($0100,a5)
	move.l	d5,($0104,a5)
	move.l	d5,($0140,a5)
	move.l	d5,($0144,a5)
	move.l	d5,($0180,a5)
	move.l	d5,($0184,a5)
	move.l	d5,($01c0,a5)
	move.l	d5,($01c4,a5)
	sf.b	(L00195f)
	st.b	(L00195e)
	bsr.s	L00102c
	moveq.l	#$00,d0
	movem.l	(sp)+,d1-d7/a0-a6
	rte

L00102c:
	swap.w	d1
	cmpi.b	#$10,d1
	bcc.s	L00103a
	ext.w	d1
	move.w	d1,($001e,a6)
L00103a:
	swap.w	d1
	move.w	d1,-(sp)
	move.b	(sp)+,d7
	cmpi.b	#$07,d7
	bcc.s	L00104a
	move.b	d7,($001d,a6)
L00104a:
	tst.b	d1
	beq.s	L00105a
	cmpi.b	#$04,d1
	bcc.s	L00105a
	move.b	d1,(L00196e)
L00105a:
	rts

Override_ADPCMOUT:
	move.w	sr,-(sp)
	ori.w	#$0700,sr
	cmpi.w	#$0008,(L00194c)
	bcc.w	L0011cc
	move.b	(L001947,pc),d0
	bne.w	L00117e
	move.b	(L001961,pc),d0
	beq.s	L0010f8
	sf.b	(L001961)
	movem.l	d5/a5,-(sp)
	lea.l	(L001682,pc),a5
	moveq.l	#$00,d5
	move.l	d5,(a5)
	move.l	d5,($0004,a5)
	move.l	d5,($0040,a5)
	move.l	d5,($0044,a5)
	move.l	d5,($0080,a5)
	move.l	d5,($0084,a5)
	move.l	d5,($00c0,a5)
	move.l	d5,($00c4,a5)
	move.l	d5,($0100,a5)
	move.l	d5,($0104,a5)
	move.l	d5,($0140,a5)
	move.l	d5,($0144,a5)
	move.l	d5,($0180,a5)
	move.l	d5,($0184,a5)
	move.l	d5,($01c0,a5)
	move.l	d5,($01c4,a5)
	sf.b	(L00195f)
	st.b	(L00195e)
	movem.l	(sp)+,d5/a5
	tst.l	d2
	beq.w	L0014fa
	tst.b	d1
	beq.w	L0014fa
	cmpi.b	#$04,d1
	bcc.w	L0014fa
	cmpi.w	#$0500,d1
	bcc.w	L0014fa
	bra.s	L001114

L0010f8:
	tst.l	d2
	beq.w	L0011cc
	tst.b	d1
	beq.w	L0011cc
	cmpi.b	#$04,d1
	bcc.w	L0011cc
	cmpi.w	#$0500,d1
	bcc.w	L0011cc
L001114:
	movem.l	d1-d7/a0-a6,-(sp)
	bsr.w	L00153e
	bmi.w	L0011c8
	swap.w	d1
	move.w	#$0008,d1
	swap.w	d1
	bsr.w	L00086c
	move.w	($0006,a6),d5
	add.w	d5,(L00195a)
	moveq.l	#$00,d5
	move.l	d5,(a6)
	move.l	d5,($0004,a6)
	move.b	(L00194a,pc),d5
	beq.s	L001160
	btst.b	#$03,($00e840c0)
	beq.s	L001160
	move.w	(L00195e,pc),d5
	beq.s	L001164
	move.l	#$ff000000,(L00195c)
	bra.s	L001164

L001160:
	bsr.w	L0007e4
L001164:
	moveq.l	#$00,d0
	move.w	d0,($0020,a6)
	move.l	d2,(a6)+
	move.l	d0,(a6)+
	move.l	a1,(a6)+
	move.l	#End+$00d702,(a6)
	movem.l	(sp)+,d1-d7/a0-a6
	move.w	(sp)+,sr
	rts

L00117e:
	st.b	(L001961)
	tst.l	d2
	beq.w	L0014fa
	tst.b	d1
	beq.w	L0014fa
	cmpi.b	#$04,d1
	bcc.w	L0014fa
	cmpi.w	#$0500,d1
	bcc.w	L0014fa
	movem.l	d1-d7/a0-a6,-(sp)
	move.w	d1,(L001964)
	bsr.w	L000e1a
	moveq.l	#$00,d0
	move.b	d0,(L001963)
	move.l	d2,(L00196a)
	move.l	a1,(L001966)
	move.b	#$02,($0c32)
L0011c8:
	movem.l	(sp)+,d1-d7/a0-a6
L0011cc:
	moveq.l	#$00,d0
	move.w	(sp)+,sr
	rts

Override_ADPCMAOT:
	move.w	sr,-(sp)
	ori.w	#$0700,sr
	cmpi.w	#$0008,(L00194c)
	bcc.s	L0011cc
	move.b	(L001947,pc),d0
	bne.w	L001300
	move.b	(L001961,pc),d0
	beq.s	L00126c
	sf.b	(L001961)
	movem.l	d5/a5,-(sp)
	lea.l	(L001682,pc),a5
	moveq.l	#$00,d5
	move.l	d5,(a5)
	move.l	d5,($0004,a5)
	move.l	d5,($0040,a5)
	move.l	d5,($0044,a5)
	move.l	d5,($0080,a5)
	move.l	d5,($0084,a5)
	move.l	d5,($00c0,a5)
	move.l	d5,($00c4,a5)
	move.l	d5,($0100,a5)
	move.l	d5,($0104,a5)
	move.l	d5,($0140,a5)
	move.l	d5,($0144,a5)
	move.l	d5,($0180,a5)
	move.l	d5,($0184,a5)
	move.l	d5,($01c0,a5)
	move.l	d5,($01c4,a5)
	sf.b	(L00195f)
	st.b	(L00195e)
	movem.l	(sp)+,d5/a5
	tst.l	d2
	beq.w	L0014fa
	tst.b	d1
	beq.w	L0014fa
	cmpi.b	#$04,d1
	bcc.w	L0014fa
	cmpi.w	#$0500,d1
	bcc.w	L0014fa
	bra.s	L001288

L00126c:
	tst.l	d2
	beq.w	L0011cc
	tst.b	d1
	beq.w	L0011cc
	cmpi.b	#$04,d1
	bcc.w	L0011cc
	cmpi.w	#$0500,d1
	bcc.w	L0011cc
L001288:
	movem.l	d1-d7/a0-a6,-(sp)
	bsr.w	L00153e
	bmi.w	L0011c8
	swap.w	d1
	move.w	#$0008,d1
	swap.w	d1
	bsr.w	L00086c
	move.w	($0006,a6),d5
	add.w	d5,(L00195a)
	moveq.l	#$00,d5
	move.l	d5,(a6)
	move.l	d5,($0004,a6)
	move.b	(L00194a,pc),d5
	beq.s	L0012d4
	btst.b	#$03,($00e840c0)
	beq.s	L0012d4
	move.w	(L00195e,pc),d5
	beq.s	L0012d8
	move.l	#$ff000000,(L00195c)
	bra.s	L0012d8

L0012d4:
	bsr.w	L0007e4
L0012d8:
	moveq.l	#$01,d1
	move.w	d1,($0020,a6)
	move.w	d2,($0022,a6)
	movea.l	(a1)+,a2
	move.w	(a1)+,d1
	move.l	a1,($0024,a6)
	move.l	d1,(a6)+
	moveq.l	#$00,d0
	move.l	d0,(a6)+
	move.l	a2,(a6)+
	move.l	#End+$00d702,(a6)
	movem.l	(sp)+,d1-d7/a0-a6
	move.w	(sp)+,sr
	rts

L001300:
	st.b	(L001961)
	tst.l	d2
	beq.w	L0014fa
	tst.b	d1
	beq.w	L0014fa
	cmpi.b	#$04,d1
	bcc.w	L0014fa
	cmpi.w	#$0500,d1
	bcc.w	L0014fa
	movem.l	d1-d7/a0-a6,-(sp)
	move.w	d1,(L001964)
	bsr.w	L000e1a
	moveq.l	#$01,d0
	move.b	d0,(L001963)
	move.w	d2,(L00196a)
	move.l	a1,(L001966)
	move.b	#$12,($0c32)
	movem.l	(sp)+,d1-d7/a0-a6
	moveq.l	#$00,d0
	move.w	(sp)+,sr
	rts

Override_ADPCMLOT:
	move.w	sr,-(sp)
	ori.w	#$0700,sr
	cmpi.w	#$0008,(L00194c)
	bcc.w	L0011cc
	move.b	(L001947,pc),d0
	bne.w	L001474
	move.b	(L001961,pc),d0
	beq.s	L0013ea
	sf.b	(L001961)
	movem.l	d5/a5,-(sp)
	lea.l	(L001682,pc),a5
	moveq.l	#$00,d5
	move.l	d5,(a5)
	move.l	d5,($0004,a5)
	move.l	d5,($0040,a5)
	move.l	d5,($0044,a5)
	move.l	d5,($0080,a5)
	move.l	d5,($0084,a5)
	move.l	d5,($00c0,a5)
	move.l	d5,($00c4,a5)
	move.l	d5,($0100,a5)
	move.l	d5,($0104,a5)
	move.l	d5,($0140,a5)
	move.l	d5,($0144,a5)
	move.l	d5,($0180,a5)
	move.l	d5,($0184,a5)
	move.l	d5,($01c0,a5)
	move.l	d5,($01c4,a5)
	sf.b	(L00195f)
	st.b	(L00195e)
	movem.l	(sp)+,d5/a5
	tst.b	d1
	beq.w	L0014fa
	cmpi.b	#$04,d1
	bcc.w	L0014fa
	cmpi.w	#$0500,d1
	bcc.w	L0014fa
	bra.s	L001400

L0013ea:
	tst.b	d1
	beq.w	L0011cc
	cmpi.b	#$04,d1
	bcc.w	L0011cc
	cmpi.w	#$0500,d1
	bcc.w	L0011cc
L001400:
	movem.l	d1-d7/a0-a6,-(sp)
	bsr.w	L00153e
	bmi.w	L0011c8
	swap.w	d1
	move.w	#$0008,d1
	swap.w	d1
	bsr.w	L00086c
	move.w	($0006,a6),d5
	add.w	d5,(L00195a)
	moveq.l	#$00,d5
	move.l	d5,(a6)
	move.l	d5,($0004,a6)
	move.b	(L00194a,pc),d5
	beq.s	L00144c
	btst.b	#$03,($00e840c0)
	beq.s	L00144c
	move.w	(L00195e,pc),d5
	beq.s	L001450
	move.l	#$ff000000,(L00195c)
	bra.s	L001450

L00144c:
	bsr.w	L0007e4
L001450:
	moveq.l	#$02,d1
	move.w	d1,($0020,a6)
	movea.l	(a1)+,a2
	move.w	(a1)+,d1
	move.l	a1,($0024,a6)
	move.l	d1,(a6)+
	moveq.l	#$00,d0
	move.l	d0,(a6)+
	move.l	a2,(a6)+
	move.l	#End+$00d702,(a6)
	movem.l	(sp)+,d1-d7/a0-a6
	move.w	(sp)+,sr
	rts

L001474:
	st.b	(L001961)
	tst.b	d1
	beq.s	L0014fa
	cmpi.b	#$04,d1
	bcc.s	L0014fa
	cmpi.w	#$0500,d1
	bcc.s	L0014fa
	movem.l	d1-d7/a0-a6,-(sp)
	move.w	d1,(L001964)
	bsr.w	L000e1a
	moveq.l	#$02,d0
	move.b	d0,(L001963)
	move.l	a1,(L001966)
	move.b	#$22,($0c32)		;'"'
	movem.l	(sp)+,d1-d7/a0-a6
	moveq.l	#$00,d0
	move.w	(sp)+,sr
	rts

Override_ADPCMMOD:
	move.w	sr,-(sp)
	ori.w	#$0700,sr
	cmpi.w	#$0003,d1
	bcc.s	L001504
	move.b	(L001947,pc),d0
	cmp.b	(L001961,pc),d0
	bne.s	L0014f4
	movem.l	d1-d7/a0-a6,-(sp)
	tst.b	d0
	bne.s	L0014e4
	move.w	d1,d0
	beq.w	L000394
	subq.w	#1,d0
	beq.w	L000430
	bra.w	L000482

L0014e4:
	move.w	d1,d0
	beq.w	L0009d0
	subq.w	#1,d0
	beq.w	L0009f6
	bra.w	L000a32

L0014f4:
	move.b	d0,(L001961)
L0014fa:
	moveq.l	#$00,d0
	movem.l	d0-d7/a0-a6,-(sp)
	bra.w	L001a78

L001504:
	cmpi.l	#$50434d38,d1		;'PCM8'
	bne.s	L001530
	movem.l	a0-a1,-(sp)
	lea.l	(PCM8String,pc),a0
	movea.l	($0088),a1
	subq.l	#8,a1
	cmpm.l	(a0)+,(a1)+
	bne.s	L00152c
	cmpm.l	(a0)+,(a1)+
	bne.s	L00152c
	movem.l	(sp)+,a0-a1
	moveq.l	#$30,d0			;'0'
	move.w	(sp)+,sr
	rts

L00152c:
	movem.l	(sp)+,a0-a1
L001530:
	moveq.l	#$ff,d0
	move.w	(sp)+,sr
	rts

PCM8String:
	.dc.b	'PCM8/048'
L00153e:
	moveq.l	#$ff,d3
	move.w	(L00194c,pc),d6
	move.l	#$01000000,d4
	lea.l	(L001842,pc),a6
	moveq.l	#$07,d0
L001550:
	move.l	(a6),d5
	ble.s	L001572
	tst.w	($0020,a6)
	bne.s	L001564
	cmp.l	d5,d4
	bcs.s	L001564
	move.l	d5,d4
	move.w	d0,d3
	movea.l	a6,a0
L001564:
	lea.l	(-$0040,a6),a6
	cmp.w	d6,d0
	dble.w	d0,L001550
	movea.l	a0,a6
	move.w	d3,d0
L001572:
	tst.w	d0
	rts

L001576:
	moveq.l	#$ff,d0
	rts

L00157a:
	.dc.b	'ˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆ'
	.dc.b	'ˆˆˆˆˆˆˆˆ'
L0015fa:
	.dc.l	L001602
	.dc.l	L001632
L001602:
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
L001632:
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
L001662:
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
L001682:
	.dc.l	$00000000,$00000000
	.dc.l	$00000000,$00000000
	.dc.l	$00000000,$00000000
	.dc.l	$00000000,$00000000
L0016a2:
	.ds.b	416
L001842:
	.ds.b	64
L001882:
	.ds.b	192
L001942:
	.dc.b	$00,$00
L001944:
	.dc.b	$01
L001945:
	.dc.b	$01
L001946:
	.dc.b	$00
L001947:
	.dc.b	$00
L001948:
	.dc.b	$01
L001949:
	.dc.b	$00
L00194a:
	.dc.b	$00
L00194b:
	.dc.b	$ff
L00194c:
	.dc.w	$0000
L00194e:
	.dc.b	$00,$03
L001950:
	.dc.w	$df00
L001952:
	.dc.w	$ffff
L001954:
	.dc.l	EntryPoint
	.dc.b	$00,$00
L00195a:
	.dc.w	$0000
L00195c:
	.dc.b	$00,$00
L00195e:
	.dc.b	$ff
L00195f:
	.dc.b	$00,$00
L001961:
	.dc.b	$00
L001962:
	.dc.b	$00
L001963:
	.dc.b	$00
L001964:
	.dc.b	$00
L001965:
	.dc.b	$00
L001966:
	.dc.l	$00000000
L00196a:
	.dc.l	$00000000
L00196e:
	.dc.b	$03
L00196f:
	.dc.b	$03
L001970:
	.dc.b	$03,$00
DMAEndInterrupt:
	ori.w	#$0700,sr
	addq.w	#1,(L001952)
	bgt.s	L0019ee
	movem.l	d0-d7/a0-a6,-(sp)
L001982:
	movea.l	#$00e840c0,a5
	btst.b	#$03,(a5)
	beq.s	L001a08
	move.b	(L001949,pc),d0
	bne.s	L0019f0
L001994:
	move.b	($0c32),d0
	bne.w	L002efc
	move.l	(L00195e,pc),d0
	beq.w	L001b10
	tst.b	d0
	bne.w	L002efc
	st.b	(a5)
	tst.b	(L00194a)
	beq.s	L0019ce
	move.l	#L00157a,($001c,a5)
	move.w	#$0080,($001a,a5)
	move.b	#$48,($0007,a5)		;'H'
	sf.b	(L00194a)
L0019ce:
	move.w	#$ffff,(L001952)
	move.b	(L001949,pc),d0
	bne.s	L0019e2
	movem.l	(sp)+,d0-d7/a0-a6
	rte

L0019e2:
	move.w	#$0000,($00e82200)
	movem.l	(sp)+,d0-d7/a0-a6
L0019ee:
	rte

L0019f0:
	move.w	#$0020,($00e82200)	;' '
	bra.s	L001994

DMAErrorInterrupt:
	ori.w	#$0700,sr
	movem.l	d0-d7/a0-a6,-(sp)
L001a02:
	movea.l	#$00e840c0,a5
L001a08:
	st.b	(a5)
	move.b	#$10,($0007,a5)
	st.b	(a5)
	move.l	#L00157a,($000c,a5)
	move.l	#$00e92003,($0014,a5)
	move.w	#$0080,($000a,a5)
	move.b	#$32,($0005,a5)		;'2'
	move.b	#$02,($00e92001)
	move.b	#$88,($00e92003)
	moveq.l	#$00,d0
	lea.l	(L001682,pc),a0
	moveq.l	#$07,d1
L001a46:
	move.l	d0,(a0)+
	move.l	d0,(a0)+
	lea.l	($0038,a0),a0
	dbra.w	d1,L001a46
	lea.l	(L00195c,pc),a0
	move.l	#$0000ff00,(a0)
	lea.l	(L001962,pc),a0
	move.l	d0,(a0)+
	move.l	d0,(a0)+
	move.l	d0,(a0)
	move.w	d0,($0c32)
	move.b	d0,(L00194a)
	bra.w	L0019ce

L001a74:
	movem.l	d0-d7/a0-a6,-(sp)
L001a78:
	movea.l	#$00e840c0,a5
	st.b	(a5)
	move.b	#$10,($0007,a5)
	st.b	(a5)
	move.l	#L00157a,($000c,a5)
	move.l	#$00e92003,($0014,a5)
	move.w	#$0080,($000a,a5)
	move.b	#$32,($0005,a5)		;'2'
	move.b	#$02,($00e92001)
	move.b	#$88,($00e92003)
	moveq.l	#$00,d0
	lea.l	(L001682,pc),a0
	moveq.l	#$07,d1
L001abc:
	move.l	d0,(a0)+
	move.l	d0,(a0)+
	lea.l	($0038,a0),a0
	dbra.w	d1,L001abc
	lea.l	(L00195c,pc),a0
	move.l	#$0000ff00,(a0)
	lea.l	(L001962,pc),a0
	move.l	d0,(a0)+
	move.l	d0,(a0)+
	move.l	d0,(a0)
	move.w	d0,($0c32)
	move.b	d0,(L00194a)
	move.w	#$ffff,(L001952)
	move.b	(L001949,pc),d0
	bne.s	L001afc
	movem.l	(sp)+,d0-d7/a0-a6
	move.w	(sp)+,sr
	rts

L001afc:
	move.w	#$0000,($00e82200)
	movem.l	(sp)+,d0-d7/a0-a6
	move.w	(sp)+,sr
	rts

L001b0c:
	.dc.b	$0b,$09,$0a,$08
L001b10:
	movea.l	#$00e88015,a0
	moveq.l	#$00,d0
	movep.w	(-$0002,a0),d0
	move.l	d0,-(sp)
	and.w	(L001950,pc),d0
	movep.w	d0,(-$0002,a0)
	lea.l	(L00196e,pc),a0
	moveq.l	#$00,d1
	move.b	($0002,a0),d1
	move.b	(L001b0c,pc,d1.w),d1
	move.b	($0001,a0),($0002,a0)
	move.b	(a0),($0001,a0)
	movea.l	#$00e9a005,a0
	moveq.l	#$f0,d0
	and.b	(a0),d0
	or.b	d1,d0
	move.b	d0,(a0)
	lea.l	(L0015fa,pc),a0
	movea.l	(a0)+,a6
	movea.l	(a0)+,a1
	move.l	a6,-(a0)
	move.l	a1,-(a0)
	move.b	(L00195c,pc),d0
	beq.s	L001b96
	st.b	(a5)
	move.l	#L00157a,($001c,a5)
	move.w	#$0030,($001a,a5)	;'0'
	move.b	#$48,($0007,a5)		;'H'
	lea.l	(L001954,pc),a0
	moveq.l	#$00,d2
	move.l	#EntryPoint,(a0)+
	move.l	d2,(a0)+
	move.b	d2,(a0)
L001b84:
	andi.w	#$fbff,sr
	bra.w	L002d22

L001b8c:
	.dc.w	$0000,$000f,$00f0,$f000
	.dc.w	$8888
L001b96:
	st.b	(a5)
	move.l	a6,($001c,a5)
	move.w	#$0030,($001a,a5)	;'0'
	move.b	#$48,($0007,a5)		;'H'
L001ba8:
	andi.w	#$fbff,sr
	movem.w	(L001b8c,pc),d2/d4-d6/a2
	lea.l	(L001882,pc),a1
	lea.l	(L001954,pc),a4
	movea.l	(a4)+,a0
	move.w	(a4)+,d0
	movea.l	#$0f000f00,a3
	move.l	a3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L001bdc
	cmp.w	(a0)+,d1
	bcc.s	L001bd6
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L001bd6:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L001bee

L001bdc:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L001be8
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L001be8:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L001bee:
	adda.w	(a0),a0
	and.w	d3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L001c08
	cmp.w	(a0)+,d1
	bcc.s	L001c02
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L001c02:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L001c1a

L001c08:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L001c14
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L001c14:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L001c1a:
	adda.w	(a0),a0
	and.w	d6,d3
	or.w	d3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L001c36
	cmp.w	(a0)+,d1
	bcc.s	L001c30
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L001c30:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L001c48

L001c36:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L001c42
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L001c42:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L001c48:
	adda.w	(a0),a0
	and.w	d4,d3
	or.w	d3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L001c64
	cmp.w	(a0)+,d1
	bcc.s	L001c5e
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L001c5e:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L001c76

L001c64:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L001c70
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L001c70:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L001c76:
	adda.w	(a0),a0
	and.w	d5,d3
	or.w	d3,d7
	swap.w	d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L001c94
	cmp.w	(a0)+,d1
	bcc.s	L001c8e
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L001c8e:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L001ca6

L001c94:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L001ca0
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L001ca0:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L001ca6:
	adda.w	(a0),a0
	and.w	d3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L001cc0
	cmp.w	(a0)+,d1
	bcc.s	L001cba
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L001cba:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L001cd2

L001cc0:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L001ccc
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L001ccc:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L001cd2:
	adda.w	(a0),a0
	and.w	d6,d3
	or.w	d3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L001cee
	cmp.w	(a0)+,d1
	bcc.s	L001ce8
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L001ce8:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L001d00

L001cee:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L001cfa
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L001cfa:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L001d00:
	adda.w	(a0),a0
	and.w	d4,d3
	or.w	d3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L001d1c
	cmp.w	(a0)+,d1
	bcc.s	L001d16
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L001d16:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L001d2e

L001d1c:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L001d28
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L001d28:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L001d2e:
	adda.w	(a0),a0
	and.w	d5,d3
	or.w	d3,d7
	move.l	d7,(a6)+
	move.l	a3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L001d4e
	cmp.w	(a0)+,d1
	bcc.s	L001d48
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L001d48:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L001d60

L001d4e:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L001d5a
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L001d5a:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L001d60:
	adda.w	(a0),a0
	and.w	d3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L001d7a
	cmp.w	(a0)+,d1
	bcc.s	L001d74
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L001d74:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L001d8c

L001d7a:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L001d86
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L001d86:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L001d8c:
	adda.w	(a0),a0
	and.w	d6,d3
	or.w	d3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L001da8
	cmp.w	(a0)+,d1
	bcc.s	L001da2
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L001da2:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L001dba

L001da8:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L001db4
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L001db4:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L001dba:
	adda.w	(a0),a0
	and.w	d4,d3
	or.w	d3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L001dd6
	cmp.w	(a0)+,d1
	bcc.s	L001dd0
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L001dd0:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L001de8

L001dd6:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L001de2
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L001de2:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L001de8:
	adda.w	(a0),a0
	and.w	d5,d3
	or.w	d3,d7
	swap.w	d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L001e06
	cmp.w	(a0)+,d1
	bcc.s	L001e00
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L001e00:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L001e18

L001e06:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L001e12
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L001e12:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L001e18:
	adda.w	(a0),a0
	and.w	d3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L001e32
	cmp.w	(a0)+,d1
	bcc.s	L001e2c
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L001e2c:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L001e44

L001e32:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L001e3e
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L001e3e:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L001e44:
	adda.w	(a0),a0
	and.w	d6,d3
	or.w	d3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L001e60
	cmp.w	(a0)+,d1
	bcc.s	L001e5a
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L001e5a:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L001e72

L001e60:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L001e6c
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L001e6c:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L001e72:
	adda.w	(a0),a0
	and.w	d4,d3
	or.w	d3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L001e8e
	cmp.w	(a0)+,d1
	bcc.s	L001e88
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L001e88:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L001ea0

L001e8e:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L001e9a
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L001e9a:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L001ea0:
	adda.w	(a0),a0
	and.w	d5,d3
	or.w	d3,d7
	move.l	d7,(a6)+
	move.l	a3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L001ec0
	cmp.w	(a0)+,d1
	bcc.s	L001eba
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L001eba:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L001ed2

L001ec0:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L001ecc
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L001ecc:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L001ed2:
	adda.w	(a0),a0
	and.w	d3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L001eec
	cmp.w	(a0)+,d1
	bcc.s	L001ee6
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L001ee6:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L001efe

L001eec:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L001ef8
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L001ef8:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L001efe:
	adda.w	(a0),a0
	and.w	d6,d3
	or.w	d3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L001f1a
	cmp.w	(a0)+,d1
	bcc.s	L001f14
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L001f14:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L001f2c

L001f1a:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L001f26
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L001f26:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L001f2c:
	adda.w	(a0),a0
	and.w	d4,d3
	or.w	d3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L001f48
	cmp.w	(a0)+,d1
	bcc.s	L001f42
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L001f42:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L001f5a

L001f48:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L001f54
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L001f54:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L001f5a:
	adda.w	(a0),a0
	and.w	d5,d3
	or.w	d3,d7
	swap.w	d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L001f78
	cmp.w	(a0)+,d1
	bcc.s	L001f72
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L001f72:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L001f8a

L001f78:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L001f84
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L001f84:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L001f8a:
	adda.w	(a0),a0
	and.w	d3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L001fa4
	cmp.w	(a0)+,d1
	bcc.s	L001f9e
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L001f9e:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L001fb6

L001fa4:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L001fb0
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L001fb0:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L001fb6:
	adda.w	(a0),a0
	and.w	d6,d3
	or.w	d3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L001fd2
	cmp.w	(a0)+,d1
	bcc.s	L001fcc
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L001fcc:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L001fe4

L001fd2:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L001fde
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L001fde:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L001fe4:
	adda.w	(a0),a0
	and.w	d4,d3
	or.w	d3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L002000
	cmp.w	(a0)+,d1
	bcc.s	L001ffa
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L001ffa:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L002012

L002000:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L00200c
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L00200c:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L002012:
	adda.w	(a0),a0
	and.w	d5,d3
	or.w	d3,d7
	move.l	d7,(a6)+
	move.l	a3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L002032
	cmp.w	(a0)+,d1
	bcc.s	L00202c
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L00202c:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L002044

L002032:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L00203e
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L00203e:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L002044:
	adda.w	(a0),a0
	and.w	d3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L00205e
	cmp.w	(a0)+,d1
	bcc.s	L002058
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L002058:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L002070

L00205e:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L00206a
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L00206a:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L002070:
	adda.w	(a0),a0
	and.w	d6,d3
	or.w	d3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L00208c
	cmp.w	(a0)+,d1
	bcc.s	L002086
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L002086:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L00209e

L00208c:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L002098
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L002098:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L00209e:
	adda.w	(a0),a0
	and.w	d4,d3
	or.w	d3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L0020ba
	cmp.w	(a0)+,d1
	bcc.s	L0020b4
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L0020b4:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L0020cc

L0020ba:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L0020c6
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L0020c6:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L0020cc:
	adda.w	(a0),a0
	and.w	d5,d3
	or.w	d3,d7
	swap.w	d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L0020ea
	cmp.w	(a0)+,d1
	bcc.s	L0020e4
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L0020e4:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L0020fc

L0020ea:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L0020f6
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L0020f6:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L0020fc:
	adda.w	(a0),a0
	and.w	d3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L002116
	cmp.w	(a0)+,d1
	bcc.s	L002110
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L002110:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L002128

L002116:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L002122
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L002122:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L002128:
	adda.w	(a0),a0
	and.w	d6,d3
	or.w	d3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L002144
	cmp.w	(a0)+,d1
	bcc.s	L00213e
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L00213e:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L002156

L002144:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L002150
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L002150:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L002156:
	adda.w	(a0),a0
	and.w	d4,d3
	or.w	d3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L002172
	cmp.w	(a0)+,d1
	bcc.s	L00216c
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L00216c:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L002184

L002172:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L00217e
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L00217e:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L002184:
	adda.w	(a0),a0
	and.w	d5,d3
	or.w	d3,d7
	move.l	d7,(a6)+
	move.l	a3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L0021a4
	cmp.w	(a0)+,d1
	bcc.s	L00219e
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L00219e:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L0021b6

L0021a4:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L0021b0
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L0021b0:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L0021b6:
	adda.w	(a0),a0
	and.w	d3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L0021d0
	cmp.w	(a0)+,d1
	bcc.s	L0021ca
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L0021ca:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L0021e2

L0021d0:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L0021dc
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L0021dc:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L0021e2:
	adda.w	(a0),a0
	and.w	d6,d3
	or.w	d3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L0021fe
	cmp.w	(a0)+,d1
	bcc.s	L0021f8
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L0021f8:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L002210

L0021fe:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L00220a
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L00220a:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L002210:
	adda.w	(a0),a0
	and.w	d4,d3
	or.w	d3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L00222c
	cmp.w	(a0)+,d1
	bcc.s	L002226
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L002226:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L00223e

L00222c:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L002238
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L002238:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L00223e:
	adda.w	(a0),a0
	and.w	d5,d3
	or.w	d3,d7
	swap.w	d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L00225c
	cmp.w	(a0)+,d1
	bcc.s	L002256
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L002256:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L00226e

L00225c:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L002268
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L002268:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L00226e:
	adda.w	(a0),a0
	and.w	d3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L002288
	cmp.w	(a0)+,d1
	bcc.s	L002282
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L002282:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L00229a

L002288:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L002294
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L002294:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L00229a:
	adda.w	(a0),a0
	and.w	d6,d3
	or.w	d3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L0022b6
	cmp.w	(a0)+,d1
	bcc.s	L0022b0
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L0022b0:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L0022c8

L0022b6:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L0022c2
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L0022c2:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L0022c8:
	adda.w	(a0),a0
	and.w	d4,d3
	or.w	d3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L0022e4
	cmp.w	(a0)+,d1
	bcc.s	L0022de
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L0022de:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L0022f6

L0022e4:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L0022f0
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L0022f0:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L0022f6:
	adda.w	(a0),a0
	and.w	d5,d3
	or.w	d3,d7
	move.l	d7,(a6)+
	move.l	a3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L002316
	cmp.w	(a0)+,d1
	bcc.s	L002310
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L002310:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L002328

L002316:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L002322
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L002322:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L002328:
	adda.w	(a0),a0
	and.w	d3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L002342
	cmp.w	(a0)+,d1
	bcc.s	L00233c
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L00233c:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L002354

L002342:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L00234e
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L00234e:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L002354:
	adda.w	(a0),a0
	and.w	d6,d3
	or.w	d3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L002370
	cmp.w	(a0)+,d1
	bcc.s	L00236a
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L00236a:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L002382

L002370:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L00237c
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L00237c:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L002382:
	adda.w	(a0),a0
	and.w	d4,d3
	or.w	d3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L00239e
	cmp.w	(a0)+,d1
	bcc.s	L002398
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L002398:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L0023b0

L00239e:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L0023aa
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L0023aa:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L0023b0:
	adda.w	(a0),a0
	and.w	d5,d3
	or.w	d3,d7
	swap.w	d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L0023ce
	cmp.w	(a0)+,d1
	bcc.s	L0023c8
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L0023c8:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L0023e0

L0023ce:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L0023da
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L0023da:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L0023e0:
	adda.w	(a0),a0
	and.w	d3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L0023fa
	cmp.w	(a0)+,d1
	bcc.s	L0023f4
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L0023f4:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L00240c

L0023fa:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L002406
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L002406:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L00240c:
	adda.w	(a0),a0
	and.w	d6,d3
	or.w	d3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L002428
	cmp.w	(a0)+,d1
	bcc.s	L002422
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L002422:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L00243a

L002428:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L002434
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L002434:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L00243a:
	adda.w	(a0),a0
	and.w	d4,d3
	or.w	d3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L002456
	cmp.w	(a0)+,d1
	bcc.s	L002450
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L002450:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L002468

L002456:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L002462
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L002462:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L002468:
	adda.w	(a0),a0
	and.w	d5,d3
	or.w	d3,d7
	move.l	d7,(a6)+
	move.l	a3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L002488
	cmp.w	(a0)+,d1
	bcc.s	L002482
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L002482:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L00249a

L002488:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L002494
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L002494:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L00249a:
	adda.w	(a0),a0
	and.w	d3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L0024b4
	cmp.w	(a0)+,d1
	bcc.s	L0024ae
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L0024ae:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L0024c6

L0024b4:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L0024c0
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L0024c0:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L0024c6:
	adda.w	(a0),a0
	and.w	d6,d3
	or.w	d3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L0024e2
	cmp.w	(a0)+,d1
	bcc.s	L0024dc
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L0024dc:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L0024f4

L0024e2:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L0024ee
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L0024ee:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L0024f4:
	adda.w	(a0),a0
	and.w	d4,d3
	or.w	d3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L002510
	cmp.w	(a0)+,d1
	bcc.s	L00250a
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L00250a:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L002522

L002510:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L00251c
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L00251c:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L002522:
	adda.w	(a0),a0
	and.w	d5,d3
	or.w	d3,d7
	swap.w	d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L002540
	cmp.w	(a0)+,d1
	bcc.s	L00253a
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L00253a:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L002552

L002540:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L00254c
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L00254c:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L002552:
	adda.w	(a0),a0
	and.w	d3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L00256c
	cmp.w	(a0)+,d1
	bcc.s	L002566
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L002566:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L00257e

L00256c:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L002578
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L002578:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L00257e:
	adda.w	(a0),a0
	and.w	d6,d3
	or.w	d3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L00259a
	cmp.w	(a0)+,d1
	bcc.s	L002594
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L002594:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L0025ac

L00259a:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L0025a6
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L0025a6:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L0025ac:
	adda.w	(a0),a0
	and.w	d4,d3
	or.w	d3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L0025c8
	cmp.w	(a0)+,d1
	bcc.s	L0025c2
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L0025c2:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L0025da

L0025c8:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L0025d4
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L0025d4:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L0025da:
	adda.w	(a0),a0
	and.w	d5,d3
	or.w	d3,d7
	move.l	d7,(a6)+
	move.l	a3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L0025fa
	cmp.w	(a0)+,d1
	bcc.s	L0025f4
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L0025f4:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L00260c

L0025fa:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L002606
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L002606:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L00260c:
	adda.w	(a0),a0
	and.w	d3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L002626
	cmp.w	(a0)+,d1
	bcc.s	L002620
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L002620:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L002638

L002626:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L002632
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L002632:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L002638:
	adda.w	(a0),a0
	and.w	d6,d3
	or.w	d3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L002654
	cmp.w	(a0)+,d1
	bcc.s	L00264e
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L00264e:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L002666

L002654:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L002660
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L002660:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L002666:
	adda.w	(a0),a0
	and.w	d4,d3
	or.w	d3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L002682
	cmp.w	(a0)+,d1
	bcc.s	L00267c
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L00267c:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L002694

L002682:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L00268e
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L00268e:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L002694:
	adda.w	(a0),a0
	and.w	d5,d3
	or.w	d3,d7
	swap.w	d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L0026b2
	cmp.w	(a0)+,d1
	bcc.s	L0026ac
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L0026ac:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L0026c4

L0026b2:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L0026be
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L0026be:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L0026c4:
	adda.w	(a0),a0
	and.w	d3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L0026de
	cmp.w	(a0)+,d1
	bcc.s	L0026d8
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L0026d8:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L0026f0

L0026de:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L0026ea
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L0026ea:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L0026f0:
	adda.w	(a0),a0
	and.w	d6,d3
	or.w	d3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L00270c
	cmp.w	(a0)+,d1
	bcc.s	L002706
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L002706:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L00271e

L00270c:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L002718
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L002718:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L00271e:
	adda.w	(a0),a0
	and.w	d4,d3
	or.w	d3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L00273a
	cmp.w	(a0)+,d1
	bcc.s	L002734
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L002734:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L00274c

L00273a:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L002746
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L002746:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L00274c:
	adda.w	(a0),a0
	and.w	d5,d3
	or.w	d3,d7
	move.l	d7,(a6)+
	move.l	a3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L00276c
	cmp.w	(a0)+,d1
	bcc.s	L002766
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L002766:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L00277e

L00276c:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L002778
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L002778:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L00277e:
	adda.w	(a0),a0
	and.w	d3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L002798
	cmp.w	(a0)+,d1
	bcc.s	L002792
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L002792:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L0027aa

L002798:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L0027a4
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L0027a4:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L0027aa:
	adda.w	(a0),a0
	and.w	d6,d3
	or.w	d3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L0027c6
	cmp.w	(a0)+,d1
	bcc.s	L0027c0
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L0027c0:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L0027d8

L0027c6:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L0027d2
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L0027d2:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L0027d8:
	adda.w	(a0),a0
	and.w	d4,d3
	or.w	d3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L0027f4
	cmp.w	(a0)+,d1
	bcc.s	L0027ee
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L0027ee:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L002806

L0027f4:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L002800
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L002800:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L002806:
	adda.w	(a0),a0
	and.w	d5,d3
	or.w	d3,d7
	swap.w	d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L002824
	cmp.w	(a0)+,d1
	bcc.s	L00281e
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L00281e:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L002836

L002824:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L002830
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L002830:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L002836:
	adda.w	(a0),a0
	and.w	d3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L002850
	cmp.w	(a0)+,d1
	bcc.s	L00284a
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L00284a:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L002862

L002850:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L00285c
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L00285c:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L002862:
	adda.w	(a0),a0
	and.w	d6,d3
	or.w	d3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L00287e
	cmp.w	(a0)+,d1
	bcc.s	L002878
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L002878:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L002890

L00287e:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L00288a
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L00288a:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L002890:
	adda.w	(a0),a0
	and.w	d4,d3
	or.w	d3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L0028ac
	cmp.w	(a0)+,d1
	bcc.s	L0028a6
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L0028a6:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L0028be

L0028ac:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L0028b8
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L0028b8:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L0028be:
	adda.w	(a0),a0
	and.w	d5,d3
	or.w	d3,d7
	move.l	d7,(a6)+
	move.l	a3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L0028de
	cmp.w	(a0)+,d1
	bcc.s	L0028d8
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L0028d8:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L0028f0

L0028de:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L0028ea
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L0028ea:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L0028f0:
	adda.w	(a0),a0
	and.w	d3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L00290a
	cmp.w	(a0)+,d1
	bcc.s	L002904
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L002904:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L00291c

L00290a:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L002916
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L002916:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L00291c:
	adda.w	(a0),a0
	and.w	d6,d3
	or.w	d3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L002938
	cmp.w	(a0)+,d1
	bcc.s	L002932
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L002932:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L00294a

L002938:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L002944
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L002944:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L00294a:
	adda.w	(a0),a0
	and.w	d4,d3
	or.w	d3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L002966
	cmp.w	(a0)+,d1
	bcc.s	L002960
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L002960:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L002978

L002966:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L002972
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L002972:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L002978:
	adda.w	(a0),a0
	and.w	d5,d3
	or.w	d3,d7
	swap.w	d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L002996
	cmp.w	(a0)+,d1
	bcc.s	L002990
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L002990:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L0029a8

L002996:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L0029a2
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L0029a2:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L0029a8:
	adda.w	(a0),a0
	and.w	d3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L0029c2
	cmp.w	(a0)+,d1
	bcc.s	L0029bc
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L0029bc:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L0029d4

L0029c2:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L0029ce
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L0029ce:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L0029d4:
	adda.w	(a0),a0
	and.w	d6,d3
	or.w	d3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L0029f0
	cmp.w	(a0)+,d1
	bcc.s	L0029ea
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L0029ea:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L002a02

L0029f0:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L0029fc
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L0029fc:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L002a02:
	adda.w	(a0),a0
	and.w	d4,d3
	or.w	d3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L002a1e
	cmp.w	(a0)+,d1
	bcc.s	L002a18
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L002a18:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L002a30

L002a1e:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L002a2a
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L002a2a:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L002a30:
	adda.w	(a0),a0
	and.w	d5,d3
	or.w	d3,d7
	move.l	d7,(a6)+
	move.l	a3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L002a50
	cmp.w	(a0)+,d1
	bcc.s	L002a4a
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L002a4a:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L002a62

L002a50:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L002a5c
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L002a5c:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L002a62:
	adda.w	(a0),a0
	and.w	d3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L002a7c
	cmp.w	(a0)+,d1
	bcc.s	L002a76
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L002a76:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L002a8e

L002a7c:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L002a88
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L002a88:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L002a8e:
	adda.w	(a0),a0
	and.w	d6,d3
	or.w	d3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L002aaa
	cmp.w	(a0)+,d1
	bcc.s	L002aa4
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L002aa4:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L002abc

L002aaa:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L002ab6
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L002ab6:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L002abc:
	adda.w	(a0),a0
	and.w	d4,d3
	or.w	d3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L002ad8
	cmp.w	(a0)+,d1
	bcc.s	L002ad2
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L002ad2:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L002aea

L002ad8:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L002ae4
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L002ae4:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L002aea:
	adda.w	(a0),a0
	and.w	d5,d3
	or.w	d3,d7
	swap.w	d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L002b08
	cmp.w	(a0)+,d1
	bcc.s	L002b02
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L002b02:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L002b1a

L002b08:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L002b14
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L002b14:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L002b1a:
	adda.w	(a0),a0
	and.w	d3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L002b34
	cmp.w	(a0)+,d1
	bcc.s	L002b2e
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L002b2e:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L002b46

L002b34:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L002b40
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L002b40:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L002b46:
	adda.w	(a0),a0
	and.w	d6,d3
	or.w	d3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L002b62
	cmp.w	(a0)+,d1
	bcc.s	L002b5c
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L002b5c:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L002b74

L002b62:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L002b6e
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L002b6e:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L002b74:
	adda.w	(a0),a0
	and.w	d4,d3
	or.w	d3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L002b90
	cmp.w	(a0)+,d1
	bcc.s	L002b8a
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L002b8a:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L002ba2

L002b90:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L002b9c
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L002b9c:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L002ba2:
	adda.w	(a0),a0
	and.w	d5,d3
	or.w	d3,d7
	move.l	d7,(a6)+
	move.l	a3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L002bc2
	cmp.w	(a0)+,d1
	bcc.s	L002bbc
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L002bbc:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L002bd4

L002bc2:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L002bce
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L002bce:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L002bd4:
	adda.w	(a0),a0
	and.w	d3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L002bee
	cmp.w	(a0)+,d1
	bcc.s	L002be8
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L002be8:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L002c00

L002bee:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L002bfa
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L002bfa:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L002c00:
	adda.w	(a0),a0
	and.w	d6,d3
	or.w	d3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L002c1c
	cmp.w	(a0)+,d1
	bcc.s	L002c16
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L002c16:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L002c2e

L002c1c:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L002c28
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L002c28:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L002c2e:
	adda.w	(a0),a0
	and.w	d4,d3
	or.w	d3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L002c4a
	cmp.w	(a0)+,d1
	bcc.s	L002c44
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L002c44:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L002c5c

L002c4a:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L002c56
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L002c56:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L002c5c:
	adda.w	(a0),a0
	and.w	d5,d3
	or.w	d3,d7
	swap.w	d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L002c7a
	cmp.w	(a0)+,d1
	bcc.s	L002c74
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L002c74:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L002c8c

L002c7a:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L002c86
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L002c86:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L002c8c:
	adda.w	(a0),a0
	and.w	d3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L002ca6
	cmp.w	(a0)+,d1
	bcc.s	L002ca0
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L002ca0:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L002cb8

L002ca6:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L002cb2
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L002cb2:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L002cb8:
	adda.w	(a0),a0
	and.w	d6,d3
	or.w	d3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L002cd4
	cmp.w	(a0)+,d1
	bcc.s	L002cce
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L002cce:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L002ce6

L002cd4:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L002ce0
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L002ce0:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L002ce6:
	adda.w	(a0),a0
	and.w	d4,d3
	or.w	d3,d7
	move.w	(a1)+,d1
	sub.w	d0,d1
	bmi.s	L002d02
	cmp.w	(a0)+,d1
	bcc.s	L002cfc
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L002cfc:
	move.w	(a0)+,d3
	add.w	(a0)+,d0
	bra.s	L002d14

L002d02:
	neg.w	d1
	cmp.w	(a0)+,d1
	bcc.s	L002d0e
	move.b	($30,a0,d1.w),d2
	adda.w	d2,a0
L002d0e:
	move.w	a2,d3
	or.w	(a0)+,d3
	sub.w	(a0)+,d0
L002d14:
	adda.w	(a0),a0
	and.w	d5,d3
	or.w	d3,d7
	move.l	d7,(a6)+
	move.w	(a4),d2
	move.w	d0,-(a4)
	move.l	a0,-(a4)
L002d22:
	lea.l	(L001942,pc),a5
	move.w	d2,d0
	swap.w	d0
	move.w	d2,d0
	move.l	d0,d1
	move.l	d0,d2
	move.l	d0,d3
	move.l	d0,d4
	move.l	d0,d5
	move.l	d0,d6
	move.l	d0,d7
	movea.l	d0,a0
	movea.l	d0,a1
	movea.l	d0,a2
	movea.l	d0,a3
	movem.l	d0-d7/a0-a3,-(a5)
	movem.l	d0-d7/a0-a3,-(a5)
	movem.l	d0-d7/a0-a3,-(a5)
	movem.l	d0-d7/a0-a3,-(a5)
	move.b	(L001949,pc),d0
	bne.s	L002da2
L002d58:
	lea.l	(L001682,pc),a6
	moveq.l	#$07,d7
L002d5e:
	movem.l	(a6),d0/d6/a0-a4
	tst.l	d0
	ble.s	L002d74
	sub.l	a3,d0
	ble.s	L002dac
	jsr	(a4)
	movem.l	d0/d6/a0-a1,(a6)
L002d70:
	bset.l	#$1f,d7
L002d74:
	lea.l	($0040,a6),a6
	dbra.w	d7,L002d5e
	ori.w	#$0700,sr
	tst.l	d7
	spl.b	(L00195e)
	move.l	(sp)+,d0
	movea.l	#$00e88015,a0
	movep.w	d0,(-$0002,a0)
	subq.w	#1,(L001952)
	bmi.w	L0019ce
	bra.w	L001982

L002da2:
	move.w	#$0018,($00e82200)
	bra.s	L002d58

L002dac:
	add.l	a3,d0
	lea.l	(-$00c0,sp),sp
	movea.l	sp,a5
	cmpi.w	#$0005,($001c,a6)
	bcc.w	L002e3e
	move.w	a3,d1
	subq.w	#1,d1
L002dc2:
	move.b	(a0)+,(a5)+
	subq.l	#1,d0
	bgt.s	L002e04
	move.w	($0020,a6),d0
	beq.s	L002e20
	subq.w	#1,d0
	bne.s	L002de0
	subq.w	#1,($0022,a6)
	bls.s	L002e20
	move.l	a1,-(sp)
	movea.l	($0024,a6),a1
	bra.s	L002df6

L002de0:
	move.l	a1,-(sp)
	movea.l	($0024,a6),a1
	move.l	(a1),d0
	bne.s	L002dee
L002dea:
	movea.l	(sp)+,a1
	bra.s	L002e20

L002dee:
	btst.l	#$01,d0
	bne.s	L002dea
	movea.l	d0,a1
L002df6:
	movea.l	(a1)+,a0
	moveq.l	#$00,d0
	move.w	(a1)+,d0
	beq.s	L002dea
	move.l	a1,($0024,a6)
	movea.l	(sp)+,a1
L002e04:
	dbra.w	d1,L002dc2
L002e08:
	movea.l	a0,a5
	movea.l	sp,a0
	jsr	(a4)
	lea.l	($00c0,sp),sp
	movea.l	a5,a0
	movem.l	d0/d6/a0-a1,(a6)
	bra.w	L002d70

L002e1c:
	move.b	#$88,(a5)+
L002e20:
	dbra.w	d1,L002e1c
L002e24:
	movea.l	sp,a0
	jsr	(a4)
	lea.l	($00c0,sp),sp
	add.w	d6,(L00195a)
	moveq.l	#$00,d0
	move.l	d0,(a6)
	move.l	d0,($0004,a6)
	bra.w	L002d70

L002e3e:
	bhi.s	L002ea4
	moveq.l	#$5f,d1			;'_'
L002e42:
	move.w	(a0)+,(a5)+
	subq.l	#2,d0
	bgt.s	L002e92
	move.w	($0020,a6),d0
	beq.s	L002e9e
	subq.w	#1,d0
	bne.s	L002e60
	subq.w	#1,($0022,a6)
	bls.s	L002e9e
	move.l	a1,-(sp)
	movea.l	($0024,a6),a1
	bra.s	L002e76

L002e60:
	move.l	a1,-(sp)
	movea.l	($0024,a6),a1
	move.l	(a1),d0
	bne.s	L002e6e
L002e6a:
	movea.l	(sp)+,a1
	bra.s	L002e9e

L002e6e:
	btst.l	#$01,d0
	bne.s	L002e6a
	movea.l	d0,a1
L002e76:
	move.l	(a1)+,d0
	btst.l	#$00,d0
	bne.s	L002e6a
	movea.l	d0,a0
	moveq.l	#$00,d0
	move.w	(a1)+,d0
	beq.s	L002e6a
	btst.l	#$00,d0
	bne.s	L002e6a
	move.l	a1,($0024,a6)
	movea.l	(sp)+,a1
L002e92:
	dbra.w	d1,L002e42
	bra.w	L002e08

L002e9a:
	move.w	(-$0002,a5),(a5)+
L002e9e:
	dbra.w	d1,L002e9a
	bra.s	L002e24

L002ea4:
	moveq.l	#$5f,d1			;'_'
L002ea6:
	move.b	(a0)+,(a5)+
	subq.l	#1,d0
	bgt.s	L002ee8
	move.w	($0020,a6),d0
	beq.s	L002ef4
	subq.w	#1,d0
	bne.s	L002ec4
	subq.w	#1,($0022,a6)
	bls.s	L002ef4
	move.l	a1,-(sp)
	movea.l	($0024,a6),a1
	bra.s	L002eda

L002ec4:
	move.l	a1,-(sp)
	movea.l	($0024,a6),a1
	move.l	(a1),d0
	bne.s	L002ed2
L002ece:
	movea.l	(sp)+,a1
	bra.s	L002ef4

L002ed2:
	btst.l	#$01,d0
	bne.s	L002ece
	movea.l	d0,a1
L002eda:
	movea.l	(a1)+,a0
	moveq.l	#$00,d0
	move.w	(a1)+,d0
	beq.s	L002ece
	move.l	a1,($0024,a6)
	movea.l	(sp)+,a1
L002ee8:
	dbra.w	d1,L002ea6
	bra.w	L002e08

L002ef0:
	move.b	(-$0001,a5),(a5)+
L002ef4:
	dbra.w	d1,L002ef0
	bra.w	L002e24

L002efc:
	lea.l	(L001962,pc),a1
	move.w	(a1),d6
	beq.w	L003028
	bpl.w	L001a08
	moveq.l	#$00,d0
	move.b	d0,(a1)
	subq.b	#1,d6
	beq.w	L002fe2
	bpl.w	L003008
	move.l	#$0000ff00,d1
	move.l	(L00196a,pc),d0
	cmp.l	d1,d0
	bhi.s	L002f5c
	st.b	(a5)
	move.b	#$10,($0007,a5)
	st.b	(a5)
	move.l	(L001966,pc),($000c,a5)
	move.w	d0,($000a,a5)
	move.l	#L00157a,($001c,a5)
	move.w	#$0080,($001a,a5)
	move.b	#$32,($0005,a5)		;'2'
	move.b	#$c8,($0007,a5)
	move.b	#$01,(a1)
L002f58:
	bra.w	L0019ce

L002f5c:
	move.l	#$00008000,d2
	sub.l	d2,d0
	cmp.l	d1,d0
	bhi.s	L002fa0
	movea.l	(L001966,pc),a0
	st.b	(a5)
	move.b	#$10,($0007,a5)
	st.b	(a5)
	move.l	a0,($000c,a5)
	move.w	d2,($000a,a5)
	adda.l	d2,a0
	move.l	a0,($001c,a5)
	move.w	d0,($001a,a5)
	move.b	#$32,($0005,a5)		;'2'
	move.b	#$c8,($0007,a5)
	moveq.l	#$00,d0
	move.l	d0,(L00196a)
	move.w	d0,(a1)
	bra.s	L002f58

L002fa0:
	movea.l	(L001966,pc),a0
	st.b	(a5)
	move.b	#$10,($0007,a5)
	st.b	(a5)
	move.l	a0,($000c,a5)
	move.w	d2,($000a,a5)
	adda.l	d2,a0
	move.l	a0,($001c,a5)
	move.w	d2,($001a,a5)
	move.b	#$32,($0005,a5)		;'2'
	move.b	#$c8,($0007,a5)
	adda.l	d2,a0
	sub.l	d2,d0
	move.l	a0,(L001966)
	move.l	d0,(L00196a)
	clr.w	(a1)
	bra.w	L002f58

L002fe2:
	st.b	(a5)
	move.b	#$10,($0007,a5)
	st.b	(a5)
	move.l	(L001966,pc),($001c,a5)
	move.w	(L00196a,pc),($001a,a5)
	move.b	#$3a,($0005,a5)		;':'
	move.b	#$88,($0007,a5)
	bra.w	L002f58

L003008:
	st.b	(a5)
	move.b	#$10,($0007,a5)
	st.b	(a5)
	move.l	(L001966,pc),($001c,a5)
	move.b	#$3e,($0005,a5)		;'>'
	move.b	#$88,($0007,a5)
	bra.w	L002f58

L003028:
	movea.l	(L001966,pc),a0
	move.l	(L00196a,pc),d0
	beq.s	L003082
	cmp.l	#$0000ff00,d0
	bhi.s	L003056
	st.b	(a5)
	move.l	a0,($001c,a5)
	move.w	d0,($001a,a5)
	move.b	#$48,($0007,a5)		;'H'
	moveq.l	#$00,d0
	move.l	d0,(L00196a)
	bra.w	L0019ce

L003056:
	move.l	#$00008000,d2
	st.b	(a5)
	move.l	a0,($001c,a5)
	move.w	d2,($001a,a5)
	move.b	#$48,($0007,a5)		;'H'
	adda.l	d2,a0
	sub.l	d2,d0
	move.l	a0,(L001966)
	move.l	d0,(L00196a)
	clr.w	(a1)
	bra.w	L0019ce

L003082:
	st.b	(a5)
	move.l	#L00157a,($001c,a5)
	move.w	#$0080,($001a,a5)
	move.b	#$48,($0007,a5)		;'H'
	move.b	#$01,(a1)
	bra.w	L0019ce

L0030a0:
	swap.w	d6
	moveq.l	#$0b,d4
L0030a4:
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#3,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#3,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	adda.w	($6200,a1),a1
	dbra.w	d4,L0030a4
	swap.w	d6
	move.w	d5,d6
	rts

L0030d8:
	swap.w	d6
	moveq.l	#$0b,d4
L0030dc:
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	move.w	d5,d3
	asr.w	#2,d3
	sub.w	d3,d5
	sub.w	d5,(a2)+
	sub.w	d5,(a2)+
	sub.w	d5,(a2)+
	sub.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	move.w	d5,d3
	asr.w	#2,d3
	sub.w	d3,d5
	sub.w	d5,(a2)+
	sub.w	d5,(a2)+
	sub.w	d5,(a2)+
	sub.w	d5,(a2)+
	adda.w	($6200,a1),a1
	dbra.w	d4,L0030dc
	swap.w	d6
	move.w	d5,d6
	neg.w	d6
	rts

L00311e:
	swap.w	d6
	moveq.l	#$0b,d4
L003122:
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	adda.w	($6200,a1),a1
	dbra.w	d4,L003122
	swap.w	d6
	move.w	d5,d6
	rts

L003156:
	swap.w	d6
	moveq.l	#$0b,d4
L00315a:
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	move.w	d5,d3
	asr.w	#2,d3
	add.w	d3,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	move.w	d5,d3
	asr.w	#2,d3
	add.w	d3,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	adda.w	($6200,a1),a1
	dbra.w	d4,L00315a
	swap.w	d6
	move.w	d5,d6
	rts

L00319a:
	swap.w	d6
	moveq.l	#$0b,d4
L00319e:
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	move.w	d5,d3
	asr.w	#2,d3
	sub.w	d3,d5
	sub.w	d5,(a2)+
	sub.w	d5,(a2)+
	sub.w	d5,(a2)+
	sub.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	move.w	d5,d3
	asr.w	#2,d3
	sub.w	d3,d5
	sub.w	d5,(a2)+
	sub.w	d5,(a2)+
	sub.w	d5,(a2)+
	sub.w	d5,(a2)+
	adda.w	($6200,a1),a1
	dbra.w	d4,L00319e
	swap.w	d6
	move.w	d5,d6
	neg.w	d6
	rts

L0031e0:
	swap.w	d6
	moveq.l	#$0b,d4
L0031e4:
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	adda.w	($6200,a1),a1
	dbra.w	d4,L0031e4
	swap.w	d6
	move.w	d5,d6
	rts

L003218:
	swap.w	d6
	moveq.l	#$0b,d4
L00321c:
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	move.w	d5,d3
	asr.w	#2,d3
	add.w	d3,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	move.w	d5,d3
	asr.w	#2,d3
	add.w	d3,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	adda.w	($6200,a1),a1
	dbra.w	d4,L00321c
	swap.w	d6
	move.w	d5,d6
	rts

L00325c:
	swap.w	d6
	moveq.l	#$0b,d4
L003260:
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	sub.w	d6,d5
	sub.w	d5,(a2)+
	sub.w	d5,(a2)+
	sub.w	d5,(a2)+
	sub.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	sub.w	d6,d5
	sub.w	d5,(a2)+
	sub.w	d5,(a2)+
	sub.w	d5,(a2)+
	sub.w	d5,(a2)+
	adda.w	($6200,a1),a1
	dbra.w	d4,L003260
	swap.w	d6
	move.w	d5,d6
	neg.w	d6
	rts

L00329a:
	swap.w	d6
	moveq.l	#$0b,d4
L00329e:
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	adda.w	($6200,a1),a1
	dbra.w	d4,L00329e
	swap.w	d6
	move.w	d5,d6
	rts

L0032d6:
	swap.w	d6
	moveq.l	#$0b,d4
L0032da:
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	adda.w	($6200,a1),a1
	dbra.w	d4,L0032da
	swap.w	d6
	move.w	d5,d6
	rts

L003312:
	swap.w	d6
	moveq.l	#$0b,d4
L003316:
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	add.w	d5,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	add.w	d5,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	adda.w	($6200,a1),a1
	dbra.w	d4,L003316
	swap.w	d6
	move.w	d5,d6
	rts

L00334a:
	swap.w	d6
	moveq.l	#$0b,d4
L00334e:
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	add.w	d6,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	add.w	d6,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	adda.w	($6200,a1),a1
	dbra.w	d4,L00334e
	swap.w	d6
	move.w	d5,d6
	rts

L00338a:
	swap.w	d6
	moveq.l	#$0b,d4
L00338e:
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	add.w	d5,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	add.w	d5,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	adda.w	($6200,a1),a1
	dbra.w	d4,L00338e
	swap.w	d6
	move.w	d5,d6
	rts

L0033c6:
	swap.w	d6
	moveq.l	#$0b,d4
L0033ca:
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	add.w	d5,d5
	add.w	d5,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	add.w	d5,d5
	add.w	d5,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	adda.w	($6200,a1),a1
	dbra.w	d4,L0033ca
	swap.w	d6
	move.w	d5,d6
	rts

L003402:
	swap.w	d6
	moveq.l	#$0b,d4
L003406:
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	add.w	d5,d5
	add.w	d5,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	add.w	d5,d5
	add.w	d5,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	adda.w	($6200,a1),a1
	dbra.w	d4,L003406
	swap.w	d6
	move.w	d5,d6
	rts

L003442:
	swap.w	d6
	moveq.l	#$0b,d4
L003446:
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	add.w	d6,(a2)+
	add.w	d6,(a2)+
	add.w	d6,(a2)+
	add.w	d6,(a2)+
	add.w	(a1),d6
	add.w	d6,(a2)+
	add.w	d6,(a2)+
	add.w	d6,(a2)+
	add.w	d6,(a2)+
	adda.w	($6200,a1),a1
	dbra.w	d4,L003446
	move.w	d6,d5
	swap.w	d6
	move.w	d5,d6
	rts

L003474:
	swap.w	d6
	moveq.l	#$0f,d4
L003478:
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#3,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#3,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	adda.w	($6200,a1),a1
	dbra.w	d4,L003478
	swap.w	d6
	move.w	d5,d6
	rts

L0034a8:
	swap.w	d6
	moveq.l	#$0f,d4
L0034ac:
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	move.w	d5,d3
	asr.w	#2,d3
	sub.w	d3,d5
	sub.w	d5,(a2)+
	sub.w	d5,(a2)+
	sub.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	move.w	d5,d3
	asr.w	#2,d3
	sub.w	d3,d5
	sub.w	d5,(a2)+
	sub.w	d5,(a2)+
	sub.w	d5,(a2)+
	adda.w	($6200,a1),a1
	dbra.w	d4,L0034ac
	swap.w	d6
	move.w	d5,d6
	neg.w	d6
	rts

L0034ea:
	swap.w	d6
	moveq.l	#$0f,d4
L0034ee:
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	adda.w	($6200,a1),a1
	dbra.w	d4,L0034ee
	swap.w	d6
	move.w	d5,d6
	rts

L00351e:
	swap.w	d6
	moveq.l	#$0f,d4
L003522:
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	move.w	d5,d3
	asr.w	#2,d3
	add.w	d3,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	move.w	d5,d3
	asr.w	#2,d3
	add.w	d3,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	adda.w	($6200,a1),a1
	dbra.w	d4,L003522
	swap.w	d6
	move.w	d5,d6
	rts

L00355e:
	swap.w	d6
	moveq.l	#$0f,d4
L003562:
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	move.w	d5,d3
	asr.w	#2,d3
	sub.w	d3,d5
	sub.w	d5,(a2)+
	sub.w	d5,(a2)+
	sub.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	move.w	d5,d3
	asr.w	#2,d3
	sub.w	d3,d5
	sub.w	d5,(a2)+
	sub.w	d5,(a2)+
	sub.w	d5,(a2)+
	adda.w	($6200,a1),a1
	dbra.w	d4,L003562
	swap.w	d6
	move.w	d5,d6
	neg.w	d6
	rts

L0035a0:
	swap.w	d6
	moveq.l	#$0f,d4
L0035a4:
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	adda.w	($6200,a1),a1
	dbra.w	d4,L0035a4
	swap.w	d6
	move.w	d5,d6
	rts

L0035d4:
	swap.w	d6
	moveq.l	#$0f,d4
L0035d8:
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	move.w	d5,d3
	asr.w	#2,d3
	add.w	d3,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	move.w	d5,d3
	asr.w	#2,d3
	add.w	d3,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	adda.w	($6200,a1),a1
	dbra.w	d4,L0035d8
	swap.w	d6
	move.w	d5,d6
	rts

L003614:
	swap.w	d6
	moveq.l	#$0f,d4
L003618:
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	sub.w	d6,d5
	sub.w	d5,(a2)+
	sub.w	d5,(a2)+
	sub.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	sub.w	d6,d5
	sub.w	d5,(a2)+
	sub.w	d5,(a2)+
	sub.w	d5,(a2)+
	adda.w	($6200,a1),a1
	dbra.w	d4,L003618
	swap.w	d6
	move.w	d5,d6
	neg.w	d6
	rts

L00364e:
	swap.w	d6
	moveq.l	#$0f,d4
L003652:
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	adda.w	($6200,a1),a1
	dbra.w	d4,L003652
	swap.w	d6
	move.w	d5,d6
	rts

L003686:
	swap.w	d6
	moveq.l	#$0f,d4
L00368a:
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	adda.w	($6200,a1),a1
	dbra.w	d4,L00368a
	swap.w	d6
	move.w	d5,d6
	rts

L0036be:
	swap.w	d6
	moveq.l	#$0f,d4
L0036c2:
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	add.w	d5,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	add.w	d5,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	adda.w	($6200,a1),a1
	dbra.w	d4,L0036c2
	swap.w	d6
	move.w	d5,d6
	rts

L0036f2:
	swap.w	d6
	moveq.l	#$0f,d4
L0036f6:
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	add.w	d6,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	add.w	d6,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	adda.w	($6200,a1),a1
	dbra.w	d4,L0036f6
	swap.w	d6
	move.w	d5,d6
	rts

L00372e:
	swap.w	d6
	moveq.l	#$0f,d4
L003732:
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	add.w	d5,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	add.w	d5,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	adda.w	($6200,a1),a1
	dbra.w	d4,L003732
	swap.w	d6
	move.w	d5,d6
	rts

L003766:
	swap.w	d6
	moveq.l	#$0f,d4
L00376a:
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	add.w	d5,d5
	add.w	d5,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	add.w	d5,d5
	add.w	d5,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	adda.w	($6200,a1),a1
	dbra.w	d4,L00376a
	swap.w	d6
	move.w	d5,d6
	rts

L00379e:
	swap.w	d6
	moveq.l	#$0f,d4
L0037a2:
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	add.w	d5,d5
	add.w	d5,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	add.w	d5,d5
	add.w	d5,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	adda.w	($6200,a1),a1
	dbra.w	d4,L0037a2
	swap.w	d6
	move.w	d5,d6
	rts

L0037da:
	swap.w	d6
	moveq.l	#$0f,d4
L0037de:
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	add.w	d6,(a2)+
	add.w	d6,(a2)+
	add.w	d6,(a2)+
	add.w	(a1),d6
	add.w	d6,(a2)+
	add.w	d6,(a2)+
	add.w	d6,(a2)+
	adda.w	($6200,a1),a1
	dbra.w	d4,L0037de
	move.w	d6,d5
	swap.w	d6
	move.w	d5,d6
	rts

L003808:
	swap.w	d6
	moveq.l	#$17,d4
L00380c:
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#3,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#3,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	adda.w	($6200,a1),a1
	dbra.w	d4,L00380c
	swap.w	d6
	move.w	d5,d6
	rts

L003838:
	swap.w	d6
	moveq.l	#$17,d4
L00383c:
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	move.w	d5,d3
	asr.w	#2,d3
	sub.w	d3,d5
	sub.w	d5,(a2)+
	sub.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	move.w	d5,d3
	asr.w	#2,d3
	sub.w	d3,d5
	sub.w	d5,(a2)+
	sub.w	d5,(a2)+
	adda.w	($6200,a1),a1
	dbra.w	d4,L00383c
	swap.w	d6
	move.w	d5,d6
	neg.w	d6
	rts

L003876:
	swap.w	d6
	moveq.l	#$17,d4
L00387a:
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	adda.w	($6200,a1),a1
	dbra.w	d4,L00387a
	swap.w	d6
	move.w	d5,d6
	rts

L0038a6:
	swap.w	d6
	moveq.l	#$17,d4
L0038aa:
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	move.w	d5,d3
	asr.w	#2,d3
	add.w	d3,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	move.w	d5,d3
	asr.w	#2,d3
	add.w	d3,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	adda.w	($6200,a1),a1
	dbra.w	d4,L0038aa
	swap.w	d6
	move.w	d5,d6
	rts

L0038e2:
	swap.w	d6
	moveq.l	#$17,d4
L0038e6:
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	move.w	d5,d3
	asr.w	#2,d3
	sub.w	d3,d5
	sub.w	d5,(a2)+
	sub.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	move.w	d5,d3
	asr.w	#2,d3
	sub.w	d3,d5
	sub.w	d5,(a2)+
	sub.w	d5,(a2)+
	adda.w	($6200,a1),a1
	dbra.w	d4,L0038e6
	swap.w	d6
	move.w	d5,d6
	neg.w	d6
	rts

L003920:
	swap.w	d6
	moveq.l	#$17,d4
L003924:
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	adda.w	($6200,a1),a1
	dbra.w	d4,L003924
	swap.w	d6
	move.w	d5,d6
	rts

L003950:
	swap.w	d6
	moveq.l	#$17,d4
L003954:
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	move.w	d5,d3
	asr.w	#2,d3
	add.w	d3,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	move.w	d5,d3
	asr.w	#2,d3
	add.w	d3,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	adda.w	($6200,a1),a1
	dbra.w	d4,L003954
	swap.w	d6
	move.w	d5,d6
	rts

L00398c:
	swap.w	d6
	moveq.l	#$17,d4
L003990:
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	sub.w	d6,d5
	sub.w	d5,(a2)+
	sub.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	sub.w	d6,d5
	sub.w	d5,(a2)+
	sub.w	d5,(a2)+
	adda.w	($6200,a1),a1
	dbra.w	d4,L003990
	swap.w	d6
	move.w	d5,d6
	neg.w	d6
	rts

L0039c2:
	swap.w	d6
	moveq.l	#$17,d4
L0039c6:
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	adda.w	($6200,a1),a1
	dbra.w	d4,L0039c6
	swap.w	d6
	move.w	d5,d6
	rts

L0039f6:
	swap.w	d6
	moveq.l	#$17,d4
L0039fa:
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	adda.w	($6200,a1),a1
	dbra.w	d4,L0039fa
	swap.w	d6
	move.w	d5,d6
	rts

L003a2a:
	swap.w	d6
	moveq.l	#$17,d4
L003a2e:
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	add.w	d5,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	add.w	d5,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	adda.w	($6200,a1),a1
	dbra.w	d4,L003a2e
	swap.w	d6
	move.w	d5,d6
	rts

L003a5a:
	swap.w	d6
	moveq.l	#$17,d4
L003a5e:
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	add.w	d6,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	add.w	d6,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	adda.w	($6200,a1),a1
	dbra.w	d4,L003a5e
	swap.w	d6
	move.w	d5,d6
	rts

L003a92:
	swap.w	d6
	moveq.l	#$17,d4
L003a96:
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	add.w	d5,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	add.w	d5,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	adda.w	($6200,a1),a1
	dbra.w	d4,L003a96
	swap.w	d6
	move.w	d5,d6
	rts

L003ac6:
	swap.w	d6
	moveq.l	#$17,d4
L003aca:
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	add.w	d5,d5
	add.w	d5,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	add.w	d5,d5
	add.w	d5,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	adda.w	($6200,a1),a1
	dbra.w	d4,L003aca
	swap.w	d6
	move.w	d5,d6
	rts

L003afa:
	swap.w	d6
	moveq.l	#$17,d4
L003afe:
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	add.w	d5,d5
	add.w	d5,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	add.w	d5,d5
	add.w	d5,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	adda.w	($6200,a1),a1
	dbra.w	d4,L003afe
	swap.w	d6
	move.w	d5,d6
	rts

L003b32:
	swap.w	d6
	moveq.l	#$17,d4
L003b36:
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	add.w	d6,(a2)+
	add.w	d6,(a2)+
	add.w	(a1),d6
	add.w	d6,(a2)+
	add.w	d6,(a2)+
	adda.w	($6200,a1),a1
	dbra.w	d4,L003b36
	move.w	d6,d5
	swap.w	d6
	move.w	d5,d6
	rts

L003b5c:
	swap.w	d6
	moveq.l	#$1f,d4
L003b60:
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#3,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#3,d5
	add.w	d5,(a2)+
	adda.w	($6200,a1),a1
	dbra.w	d4,L003b60
	swap.w	d6
	move.w	d5,d6
	rts

L003b8a:
	swap.w	d6
	moveq.l	#$1f,d4
L003b8e:
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	move.w	d5,d3
	asr.w	#2,d3
	sub.w	d3,d5
	sub.w	d5,(a2)+
	sub.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	move.w	d5,d3
	asr.w	#2,d3
	sub.w	d3,d5
	sub.w	d5,(a2)+
	adda.w	($6200,a1),a1
	dbra.w	d4,L003b8e
	swap.w	d6
	move.w	d5,d6
	neg.w	d6
	rts

L003bc6:
	swap.w	d6
	moveq.l	#$1f,d4
L003bca:
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	add.w	d5,(a2)+
	adda.w	($6200,a1),a1
	dbra.w	d4,L003bca
	swap.w	d6
	move.w	d5,d6
	rts

L003bf4:
	swap.w	d6
	moveq.l	#$1f,d4
L003bf8:
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	move.w	d5,d3
	asr.w	#2,d3
	add.w	d3,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	move.w	d5,d3
	asr.w	#2,d3
	add.w	d3,d5
	add.w	d5,(a2)+
	adda.w	($6200,a1),a1
	dbra.w	d4,L003bf8
	swap.w	d6
	move.w	d5,d6
	rts

L003c2e:
	swap.w	d6
	moveq.l	#$1f,d4
L003c32:
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	move.w	d5,d3
	asr.w	#2,d3
	sub.w	d3,d5
	sub.w	d5,(a2)+
	sub.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	move.w	d5,d3
	asr.w	#2,d3
	sub.w	d3,d5
	sub.w	d5,(a2)+
	adda.w	($6200,a1),a1
	dbra.w	d4,L003c32
	swap.w	d6
	move.w	d5,d6
	neg.w	d6
	rts

L003c6a:
	swap.w	d6
	moveq.l	#$1f,d4
L003c6e:
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	add.w	d5,(a2)+
	adda.w	($6200,a1),a1
	dbra.w	d4,L003c6e
	swap.w	d6
	move.w	d5,d6
	rts

L003c98:
	swap.w	d6
	moveq.l	#$1f,d4
L003c9c:
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	move.w	d5,d3
	asr.w	#2,d3
	add.w	d3,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	move.w	d5,d3
	asr.w	#2,d3
	add.w	d3,d5
	add.w	d5,(a2)+
	adda.w	($6200,a1),a1
	dbra.w	d4,L003c9c
	swap.w	d6
	move.w	d5,d6
	rts

L003cd2:
	swap.w	d6
	moveq.l	#$1f,d4
L003cd6:
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	sub.w	d6,d5
	sub.w	d5,(a2)+
	sub.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	sub.w	d6,d5
	sub.w	d5,(a2)+
	adda.w	($6200,a1),a1
	dbra.w	d4,L003cd6
	swap.w	d6
	move.w	d5,d6
	neg.w	d6
	rts

L003d06:
	swap.w	d6
	moveq.l	#$1f,d4
L003d0a:
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	adda.w	($6200,a1),a1
	dbra.w	d4,L003d0a
	swap.w	d6
	move.w	d5,d6
	rts

L003d38:
	swap.w	d6
	moveq.l	#$1f,d4
L003d3c:
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	adda.w	($6200,a1),a1
	dbra.w	d4,L003d3c
	swap.w	d6
	move.w	d5,d6
	rts

L003d6a:
	swap.w	d6
	moveq.l	#$1f,d4
L003d6e:
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	add.w	d5,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	add.w	d5,d5
	add.w	d5,(a2)+
	adda.w	($6200,a1),a1
	dbra.w	d4,L003d6e
	swap.w	d6
	move.w	d5,d6
	rts

L003d98:
	swap.w	d6
	moveq.l	#$1f,d4
L003d9c:
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	add.w	d6,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	add.w	d6,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	adda.w	($6200,a1),a1
	dbra.w	d4,L003d9c
	swap.w	d6
	move.w	d5,d6
	rts

L003dce:
	swap.w	d6
	moveq.l	#$1f,d4
L003dd2:
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	add.w	d5,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	add.w	d5,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	adda.w	($6200,a1),a1
	dbra.w	d4,L003dd2
	swap.w	d6
	move.w	d5,d6
	rts

L003e00:
	swap.w	d6
	moveq.l	#$1f,d4
L003e04:
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	add.w	d5,d5
	add.w	d5,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	add.w	d5,d5
	add.w	d5,d5
	add.w	d5,(a2)+
	adda.w	($6200,a1),a1
	dbra.w	d4,L003e04
	swap.w	d6
	move.w	d5,d6
	rts

L003e32:
	swap.w	d6
	moveq.l	#$1f,d4
L003e36:
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	add.w	d5,d5
	add.w	d5,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	add.w	d5,d5
	add.w	d5,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	adda.w	($6200,a1),a1
	dbra.w	d4,L003e36
	swap.w	d6
	move.w	d5,d6
	rts

L003e68:
	swap.w	d6
	moveq.l	#$1f,d4
L003e6c:
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	add.w	d6,(a2)+
	add.w	d6,(a2)+
	add.w	(a1),d6
	add.w	d6,(a2)+
	adda.w	($6200,a1),a1
	dbra.w	d4,L003e6c
	move.w	d6,d5
	swap.w	d6
	move.w	d5,d6
	rts

L003e90:
	swap.w	d6
	moveq.l	#$07,d4
L003e94:
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#3,d5
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#3,d5
	add.w	d5,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#3,d5
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#3,d5
	add.w	d5,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#3,d5
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#3,d5
	add.w	d5,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#3,d5
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#3,d5
	add.w	d5,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#3,d5
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#3,d5
	add.w	d5,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#3,d5
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#3,d5
	add.w	d5,(a2)+
	adda.w	($6200,a1),a1
	dbra.w	d4,L003e94
	swap.w	d6
	move.w	d5,d6
	rts

L003f52:
	swap.w	d6
	moveq.l	#$07,d4
L003f56:
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	move.w	d5,d3
	asr.w	#2,d3
	sub.w	d3,d5
	sub.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	move.w	d5,d3
	asr.w	#2,d3
	sub.w	d3,d5
	sub.w	d5,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	move.w	d5,d3
	asr.w	#2,d3
	sub.w	d3,d5
	sub.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	move.w	d5,d3
	asr.w	#2,d3
	sub.w	d3,d5
	sub.w	d5,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	move.w	d5,d3
	asr.w	#2,d3
	sub.w	d3,d5
	sub.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	move.w	d5,d3
	asr.w	#2,d3
	sub.w	d3,d5
	sub.w	d5,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	move.w	d5,d3
	asr.w	#2,d3
	sub.w	d3,d5
	sub.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	move.w	d5,d3
	asr.w	#2,d3
	sub.w	d3,d5
	sub.w	d5,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	move.w	d5,d3
	asr.w	#2,d3
	sub.w	d3,d5
	sub.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	move.w	d5,d3
	asr.w	#2,d3
	sub.w	d3,d5
	sub.w	d5,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	move.w	d5,d3
	asr.w	#2,d3
	sub.w	d3,d5
	sub.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	move.w	d5,d3
	asr.w	#2,d3
	sub.w	d3,d5
	sub.w	d5,(a2)+
	adda.w	($6200,a1),a1
	dbra.w	d4,L003f56
	swap.w	d6
	move.w	d5,d6
	neg.w	d6
	rts

L00405e:
	swap.w	d6
	moveq.l	#$07,d4
L004062:
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	add.w	d5,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	add.w	d5,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	add.w	d5,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	add.w	d5,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	add.w	d5,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	add.w	d5,(a2)+
	adda.w	($6200,a1),a1
	dbra.w	d4,L004062
	swap.w	d6
	move.w	d5,d6
	rts

L004120:
	swap.w	d6
	moveq.l	#$07,d4
L004124:
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	move.w	d5,d3
	asr.w	#2,d3
	add.w	d3,d5
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	move.w	d5,d3
	asr.w	#2,d3
	add.w	d3,d5
	add.w	d5,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	move.w	d5,d3
	asr.w	#2,d3
	add.w	d3,d5
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	move.w	d5,d3
	asr.w	#2,d3
	add.w	d3,d5
	add.w	d5,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	move.w	d5,d3
	asr.w	#2,d3
	add.w	d3,d5
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	move.w	d5,d3
	asr.w	#2,d3
	add.w	d3,d5
	add.w	d5,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	move.w	d5,d3
	asr.w	#2,d3
	add.w	d3,d5
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	move.w	d5,d3
	asr.w	#2,d3
	add.w	d3,d5
	add.w	d5,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	move.w	d5,d3
	asr.w	#2,d3
	add.w	d3,d5
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	move.w	d5,d3
	asr.w	#2,d3
	add.w	d3,d5
	add.w	d5,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	move.w	d5,d3
	asr.w	#2,d3
	add.w	d3,d5
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	move.w	d5,d3
	asr.w	#2,d3
	add.w	d3,d5
	add.w	d5,(a2)+
	adda.w	($6200,a1),a1
	dbra.w	d4,L004124
	swap.w	d6
	move.w	d5,d6
	rts

L00422a:
	swap.w	d6
	moveq.l	#$07,d4
L00422e:
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	move.w	d5,d3
	asr.w	#2,d3
	sub.w	d3,d5
	sub.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	move.w	d5,d3
	asr.w	#2,d3
	sub.w	d3,d5
	sub.w	d5,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	move.w	d5,d3
	asr.w	#2,d3
	sub.w	d3,d5
	sub.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	move.w	d5,d3
	asr.w	#2,d3
	sub.w	d3,d5
	sub.w	d5,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	move.w	d5,d3
	asr.w	#2,d3
	sub.w	d3,d5
	sub.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	move.w	d5,d3
	asr.w	#2,d3
	sub.w	d3,d5
	sub.w	d5,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	move.w	d5,d3
	asr.w	#2,d3
	sub.w	d3,d5
	sub.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	move.w	d5,d3
	asr.w	#2,d3
	sub.w	d3,d5
	sub.w	d5,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	move.w	d5,d3
	asr.w	#2,d3
	sub.w	d3,d5
	sub.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	move.w	d5,d3
	asr.w	#2,d3
	sub.w	d3,d5
	sub.w	d5,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	move.w	d5,d3
	asr.w	#2,d3
	sub.w	d3,d5
	sub.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	move.w	d5,d3
	asr.w	#2,d3
	sub.w	d3,d5
	sub.w	d5,(a2)+
	adda.w	($6200,a1),a1
	dbra.w	d4,L00422e
	swap.w	d6
	move.w	d5,d6
	neg.w	d6
	rts

L004336:
	swap.w	d6
	moveq.l	#$07,d4
L00433a:
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	add.w	d5,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	add.w	d5,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	add.w	d5,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	add.w	d5,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	add.w	d5,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	add.w	d5,(a2)+
	adda.w	($6200,a1),a1
	dbra.w	d4,L00433a
	swap.w	d6
	move.w	d5,d6
	rts

L0043f8:
	swap.w	d6
	moveq.l	#$07,d4
L0043fc:
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	move.w	d5,d3
	asr.w	#2,d3
	add.w	d3,d5
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	move.w	d5,d3
	asr.w	#2,d3
	add.w	d3,d5
	add.w	d5,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	move.w	d5,d3
	asr.w	#2,d3
	add.w	d3,d5
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	move.w	d5,d3
	asr.w	#2,d3
	add.w	d3,d5
	add.w	d5,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	move.w	d5,d3
	asr.w	#2,d3
	add.w	d3,d5
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	move.w	d5,d3
	asr.w	#2,d3
	add.w	d3,d5
	add.w	d5,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	move.w	d5,d3
	asr.w	#2,d3
	add.w	d3,d5
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	move.w	d5,d3
	asr.w	#2,d3
	add.w	d3,d5
	add.w	d5,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	move.w	d5,d3
	asr.w	#2,d3
	add.w	d3,d5
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	move.w	d5,d3
	asr.w	#2,d3
	add.w	d3,d5
	add.w	d5,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	move.w	d5,d3
	asr.w	#2,d3
	add.w	d3,d5
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	move.w	d5,d3
	asr.w	#2,d3
	add.w	d3,d5
	add.w	d5,(a2)+
	adda.w	($6200,a1),a1
	dbra.w	d4,L0043fc
	swap.w	d6
	move.w	d5,d6
	rts

L004502:
	swap.w	d6
	moveq.l	#$07,d4
L004506:
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	sub.w	d6,d5
	sub.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	sub.w	d6,d5
	sub.w	d5,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	sub.w	d6,d5
	sub.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	sub.w	d6,d5
	sub.w	d5,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	sub.w	d6,d5
	sub.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	sub.w	d6,d5
	sub.w	d5,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	sub.w	d6,d5
	sub.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	sub.w	d6,d5
	sub.w	d5,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	sub.w	d6,d5
	sub.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	sub.w	d6,d5
	sub.w	d5,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	sub.w	d6,d5
	sub.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	sub.w	d6,d5
	sub.w	d5,(a2)+
	adda.w	($6200,a1),a1
	dbra.w	d4,L004506
	swap.w	d6
	move.w	d5,d6
	neg.w	d6
	rts

L0045de:
	swap.w	d6
	moveq.l	#$07,d4
L0045e2:
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#2,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	adda.w	($6200,a1),a1
	dbra.w	d4,L0045e2
	swap.w	d6
	move.w	d5,d6
	rts

L0046b8:
	swap.w	d6
	moveq.l	#$07,d4
L0046bc:
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	adda.w	($6200,a1),a1
	dbra.w	d4,L0046bc
	swap.w	d6
	move.w	d5,d6
	rts

L004792:
	swap.w	d6
	moveq.l	#$07,d4
L004796:
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	add.w	d5,d5
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	add.w	d5,d5
	add.w	d5,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	add.w	d5,d5
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	add.w	d5,d5
	add.w	d5,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	add.w	d5,d5
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	add.w	d5,d5
	add.w	d5,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	add.w	d5,d5
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	add.w	d5,d5
	add.w	d5,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	add.w	d5,d5
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	add.w	d5,d5
	add.w	d5,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	add.w	d5,d5
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	add.w	d5,d5
	add.w	d5,(a2)+
	adda.w	($6200,a1),a1
	dbra.w	d4,L004796
	swap.w	d6
	move.w	d5,d6
	rts

L004854:
	swap.w	d6
	moveq.l	#$07,d4
L004858:
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	add.w	d6,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	add.w	d6,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	add.w	d6,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	add.w	d6,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	add.w	d6,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	add.w	d6,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	add.w	d6,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	add.w	d6,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	add.w	d6,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	add.w	d6,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	add.w	d6,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	asr.w	#1,d5
	add.w	d6,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	adda.w	($6200,a1),a1
	dbra.w	d4,L004858
	swap.w	d6
	move.w	d5,d6
	rts

L004946:
	swap.w	d6
	moveq.l	#$07,d4
L00494a:
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	add.w	d5,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	add.w	d5,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	add.w	d5,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	add.w	d5,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	add.w	d5,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	add.w	d5,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	add.w	d5,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	add.w	d5,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	add.w	d5,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	add.w	d5,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	add.w	d5,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	add.w	d5,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	adda.w	($6200,a1),a1
	dbra.w	d4,L00494a
	swap.w	d6
	move.w	d5,d6
	rts

L004a20:
	swap.w	d6
	moveq.l	#$07,d4
L004a24:
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	add.w	d5,d5
	add.w	d5,d5
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	add.w	d5,d5
	add.w	d5,d5
	add.w	d5,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	add.w	d5,d5
	add.w	d5,d5
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	add.w	d5,d5
	add.w	d5,d5
	add.w	d5,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	add.w	d5,d5
	add.w	d5,d5
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	add.w	d5,d5
	add.w	d5,d5
	add.w	d5,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	add.w	d5,d5
	add.w	d5,d5
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	add.w	d5,d5
	add.w	d5,d5
	add.w	d5,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	add.w	d5,d5
	add.w	d5,d5
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	add.w	d5,d5
	add.w	d5,d5
	add.w	d5,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	add.w	d5,d5
	add.w	d5,d5
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	add.w	d5,d5
	add.w	d5,d5
	add.w	d5,(a2)+
	adda.w	($6200,a1),a1
	dbra.w	d4,L004a24
	swap.w	d6
	move.w	d5,d6
	rts

L004afa:
	swap.w	d6
	moveq.l	#$07,d4
L004afe:
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	add.w	d5,d5
	add.w	d5,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	add.w	d5,d5
	add.w	d5,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	add.w	d5,d5
	add.w	d5,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	add.w	d5,d5
	add.w	d5,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	add.w	d5,d5
	add.w	d5,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	add.w	d5,d5
	add.w	d5,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	add.w	d5,d5
	add.w	d5,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	add.w	d5,d5
	add.w	d5,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	add.w	d5,d5
	add.w	d5,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	add.w	d5,d5
	add.w	d5,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	move.w	d6,d5
	add.w	d5,d5
	add.w	d5,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	add.w	(a1),d6
	move.w	d6,d5
	add.w	d5,d5
	add.w	d5,d5
	add.w	d6,d5
	add.w	d5,(a2)+
	adda.w	($6200,a1),a1
	dbra.w	d4,L004afe
	swap.w	d6
	move.w	d5,d6
	rts

L004bec:
	swap.w	d6
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	add.w	d6,(a2)+
	add.w	(a1),d6
	add.w	d6,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	add.w	d6,(a2)+
	add.w	(a1),d6
	add.w	d6,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	add.w	d6,(a2)+
	add.w	(a1),d6
	add.w	d6,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	add.w	d6,(a2)+
	add.w	(a1),d6
	add.w	d6,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	add.w	d6,(a2)+
	add.w	(a1),d6
	add.w	d6,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	add.w	d6,(a2)+
	add.w	(a1),d6
	add.w	d6,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	add.w	d6,(a2)+
	add.w	(a1),d6
	add.w	d6,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	add.w	d6,(a2)+
	add.w	(a1),d6
	add.w	d6,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	add.w	d6,(a2)+
	add.w	(a1),d6
	add.w	d6,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	add.w	d6,(a2)+
	add.w	(a1),d6
	add.w	d6,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	add.w	d6,(a2)+
	add.w	(a1),d6
	add.w	d6,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	add.w	d6,(a2)+
	add.w	(a1),d6
	add.w	d6,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	add.w	d6,(a2)+
	add.w	(a1),d6
	add.w	d6,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	add.w	d6,(a2)+
	add.w	(a1),d6
	add.w	d6,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	add.w	d6,(a2)+
	add.w	(a1),d6
	add.w	d6,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	add.w	d6,(a2)+
	add.w	(a1),d6
	add.w	d6,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	add.w	d6,(a2)+
	add.w	(a1),d6
	add.w	d6,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	add.w	d6,(a2)+
	add.w	(a1),d6
	add.w	d6,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	add.w	d6,(a2)+
	add.w	(a1),d6
	add.w	d6,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	add.w	d6,(a2)+
	add.w	(a1),d6
	add.w	d6,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	add.w	d6,(a2)+
	add.w	(a1),d6
	add.w	d6,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	add.w	d6,(a2)+
	add.w	(a1),d6
	add.w	d6,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	add.w	d6,(a2)+
	add.w	(a1),d6
	add.w	d6,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	add.w	d6,(a2)+
	add.w	(a1),d6
	add.w	d6,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	add.w	d6,(a2)+
	add.w	(a1),d6
	add.w	d6,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	add.w	d6,(a2)+
	add.w	(a1),d6
	add.w	d6,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	add.w	d6,(a2)+
	add.w	(a1),d6
	add.w	d6,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	add.w	d6,(a2)+
	add.w	(a1),d6
	add.w	d6,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	add.w	d6,(a2)+
	add.w	(a1),d6
	add.w	d6,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	add.w	d6,(a2)+
	add.w	(a1),d6
	add.w	d6,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	add.w	d6,(a2)+
	add.w	(a1),d6
	add.w	d6,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	add.w	d6,(a2)+
	add.w	(a1),d6
	add.w	d6,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	add.w	d6,(a2)+
	add.w	(a1),d6
	add.w	d6,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	add.w	d6,(a2)+
	add.w	(a1),d6
	add.w	d6,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	add.w	d6,(a2)+
	add.w	(a1),d6
	add.w	d6,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	add.w	d6,(a2)+
	add.w	(a1),d6
	add.w	d6,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	add.w	d6,(a2)+
	add.w	(a1),d6
	add.w	d6,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	add.w	d6,(a2)+
	add.w	(a1),d6
	add.w	d6,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	add.w	d6,(a2)+
	add.w	(a1),d6
	add.w	d6,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	add.w	d6,(a2)+
	add.w	(a1),d6
	add.w	d6,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	add.w	d6,(a2)+
	add.w	(a1),d6
	add.w	d6,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	add.w	d6,(a2)+
	add.w	(a1),d6
	add.w	d6,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	add.w	d6,(a2)+
	add.w	(a1),d6
	add.w	d6,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	add.w	d6,(a2)+
	add.w	(a1),d6
	add.w	d6,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	add.w	d6,(a2)+
	add.w	(a1),d6
	add.w	d6,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	add.w	d6,(a2)+
	add.w	(a1),d6
	add.w	d6,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	add.w	d6,(a2)+
	add.w	(a1),d6
	add.w	d6,(a2)+
	moveq.l	#$00,d2
	move.b	(a0)+,d2
	add.w	d2,d2
	add.w	($6200,a1),d2
	adda.w	d2,a1
	add.w	(-$6200,a1),d6
	add.w	d6,(a2)+
	add.w	(a1),d6
	add.w	d6,(a2)+
	adda.w	($6200,a1),a1
	move.w	d6,d5
	swap.w	d6
	move.w	d5,d6
	rts

L005016:
	moveq.l	#$0b,d4
L005018:
	move.w	(a0)+,d6
	asr.w	#3,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	asr.w	#3,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	asr.w	#3,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	asr.w	#3,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	asr.w	#3,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	asr.w	#3,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	asr.w	#3,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	asr.w	#3,d6
	add.w	d6,(a2)+
	dbra.w	d4,L005018
	rts

L00504e:
	moveq.l	#$0b,d4
L005050:
	move.w	(a0)+,d6
	asr.w	#2,d6
	move.w	d6,d5
	asr.w	#2,d5
	sub.w	d5,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	asr.w	#2,d6
	move.w	d6,d5
	asr.w	#2,d5
	sub.w	d5,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	asr.w	#2,d6
	move.w	d6,d5
	asr.w	#2,d5
	sub.w	d5,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	asr.w	#2,d6
	move.w	d6,d5
	asr.w	#2,d5
	sub.w	d5,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	asr.w	#2,d6
	move.w	d6,d5
	asr.w	#2,d5
	sub.w	d5,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	asr.w	#2,d6
	move.w	d6,d5
	asr.w	#2,d5
	sub.w	d5,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	asr.w	#2,d6
	move.w	d6,d5
	asr.w	#2,d5
	sub.w	d5,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	asr.w	#2,d6
	move.w	d6,d5
	asr.w	#2,d5
	sub.w	d5,d6
	add.w	d6,(a2)+
	dbra.w	d4,L005050
	rts

L0050b6:
	moveq.l	#$0b,d4
L0050b8:
	move.w	(a0)+,d6
	asr.w	#2,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	asr.w	#2,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	asr.w	#2,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	asr.w	#2,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	asr.w	#2,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	asr.w	#2,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	asr.w	#2,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	asr.w	#2,d6
	add.w	d6,(a2)+
	dbra.w	d4,L0050b8
	rts

L0050ee:
	moveq.l	#$0b,d4
L0050f0:
	move.w	(a0)+,d6
	asr.w	#2,d6
	move.w	d6,d5
	asr.w	#2,d5
	add.w	d5,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	asr.w	#2,d6
	move.w	d6,d5
	asr.w	#2,d5
	add.w	d5,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	asr.w	#2,d6
	move.w	d6,d5
	asr.w	#2,d5
	add.w	d5,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	asr.w	#2,d6
	move.w	d6,d5
	asr.w	#2,d5
	add.w	d5,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	asr.w	#2,d6
	move.w	d6,d5
	asr.w	#2,d5
	add.w	d5,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	asr.w	#2,d6
	move.w	d6,d5
	asr.w	#2,d5
	add.w	d5,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	asr.w	#2,d6
	move.w	d6,d5
	asr.w	#2,d5
	add.w	d5,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	asr.w	#2,d6
	move.w	d6,d5
	asr.w	#2,d5
	add.w	d5,d6
	add.w	d6,(a2)+
	dbra.w	d4,L0050f0
	rts

L005156:
	moveq.l	#$0b,d4
L005158:
	move.w	(a0)+,d6
	asr.w	#1,d6
	move.w	d6,d5
	asr.w	#2,d5
	sub.w	d5,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	asr.w	#1,d6
	move.w	d6,d5
	asr.w	#2,d5
	sub.w	d5,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	asr.w	#1,d6
	move.w	d6,d5
	asr.w	#2,d5
	sub.w	d5,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	asr.w	#1,d6
	move.w	d6,d5
	asr.w	#2,d5
	sub.w	d5,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	asr.w	#1,d6
	move.w	d6,d5
	asr.w	#2,d5
	sub.w	d5,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	asr.w	#1,d6
	move.w	d6,d5
	asr.w	#2,d5
	sub.w	d5,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	asr.w	#1,d6
	move.w	d6,d5
	asr.w	#2,d5
	sub.w	d5,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	asr.w	#1,d6
	move.w	d6,d5
	asr.w	#2,d5
	sub.w	d5,d6
	add.w	d6,(a2)+
	dbra.w	d4,L005158
	rts

L0051be:
	moveq.l	#$0b,d4
L0051c0:
	move.w	(a0)+,d6
	asr.w	#1,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	asr.w	#1,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	asr.w	#1,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	asr.w	#1,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	asr.w	#1,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	asr.w	#1,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	asr.w	#1,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	asr.w	#1,d6
	add.w	d6,(a2)+
	dbra.w	d4,L0051c0
	rts

L0051f6:
	moveq.l	#$0b,d4
L0051f8:
	move.w	(a0)+,d6
	asr.w	#1,d6
	move.w	d6,d5
	asr.w	#2,d5
	add.w	d5,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	asr.w	#1,d6
	move.w	d6,d5
	asr.w	#2,d5
	add.w	d5,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	asr.w	#1,d6
	move.w	d6,d5
	asr.w	#2,d5
	add.w	d5,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	asr.w	#1,d6
	move.w	d6,d5
	asr.w	#2,d5
	add.w	d5,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	asr.w	#1,d6
	move.w	d6,d5
	asr.w	#2,d5
	add.w	d5,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	asr.w	#1,d6
	move.w	d6,d5
	asr.w	#2,d5
	add.w	d5,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	asr.w	#1,d6
	move.w	d6,d5
	asr.w	#2,d5
	add.w	d5,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	asr.w	#1,d6
	move.w	d6,d5
	asr.w	#2,d5
	add.w	d5,d6
	add.w	d6,(a2)+
	dbra.w	d4,L0051f8
	rts

L00525e:
	moveq.l	#$0b,d4
L005260:
	move.w	(a0)+,d6
	move.w	d6,d5
	asr.w	#2,d5
	sub.w	d5,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	move.w	d6,d5
	asr.w	#2,d5
	sub.w	d5,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	move.w	d6,d5
	asr.w	#2,d5
	sub.w	d5,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	move.w	d6,d5
	asr.w	#2,d5
	sub.w	d5,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	move.w	d6,d5
	asr.w	#2,d5
	sub.w	d5,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	move.w	d6,d5
	asr.w	#2,d5
	sub.w	d5,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	move.w	d6,d5
	asr.w	#2,d5
	sub.w	d5,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	move.w	d6,d5
	asr.w	#2,d5
	sub.w	d5,d6
	add.w	d6,(a2)+
	dbra.w	d4,L005260
	rts

L0052b6:
	movem.w	(a0)+,d1-d6
	add.w	d1,(a2)+
	add.w	d2,(a2)+
	add.w	d3,(a2)+
	add.w	d4,(a2)+
	add.w	d5,(a2)+
	add.w	d6,(a2)+
	movem.w	(a0)+,d1-d6
	add.w	d1,(a2)+
	add.w	d2,(a2)+
	add.w	d3,(a2)+
	add.w	d4,(a2)+
	add.w	d5,(a2)+
	add.w	d6,(a2)+
	movem.w	(a0)+,d1-d6
	add.w	d1,(a2)+
	add.w	d2,(a2)+
	add.w	d3,(a2)+
	add.w	d4,(a2)+
	add.w	d5,(a2)+
	add.w	d6,(a2)+
	movem.w	(a0)+,d1-d6
	add.w	d1,(a2)+
	add.w	d2,(a2)+
	add.w	d3,(a2)+
	add.w	d4,(a2)+
	add.w	d5,(a2)+
	add.w	d6,(a2)+
	movem.w	(a0)+,d1-d6
	add.w	d1,(a2)+
	add.w	d2,(a2)+
	add.w	d3,(a2)+
	add.w	d4,(a2)+
	add.w	d5,(a2)+
	add.w	d6,(a2)+
	movem.w	(a0)+,d1-d6
	add.w	d1,(a2)+
	add.w	d2,(a2)+
	add.w	d3,(a2)+
	add.w	d4,(a2)+
	add.w	d5,(a2)+
	add.w	d6,(a2)+
	movem.w	(a0)+,d1-d6
	add.w	d1,(a2)+
	add.w	d2,(a2)+
	add.w	d3,(a2)+
	add.w	d4,(a2)+
	add.w	d5,(a2)+
	add.w	d6,(a2)+
	movem.w	(a0)+,d1-d6
	add.w	d1,(a2)+
	add.w	d2,(a2)+
	add.w	d3,(a2)+
	add.w	d4,(a2)+
	add.w	d5,(a2)+
	add.w	d6,(a2)+
	movem.w	(a0)+,d1-d6
	add.w	d1,(a2)+
	add.w	d2,(a2)+
	add.w	d3,(a2)+
	add.w	d4,(a2)+
	add.w	d5,(a2)+
	add.w	d6,(a2)+
	movem.w	(a0)+,d1-d6
	add.w	d1,(a2)+
	add.w	d2,(a2)+
	add.w	d3,(a2)+
	add.w	d4,(a2)+
	add.w	d5,(a2)+
	add.w	d6,(a2)+
	movem.w	(a0)+,d1-d6
	add.w	d1,(a2)+
	add.w	d2,(a2)+
	add.w	d3,(a2)+
	add.w	d4,(a2)+
	add.w	d5,(a2)+
	add.w	d6,(a2)+
	movem.w	(a0)+,d1-d6
	add.w	d1,(a2)+
	add.w	d2,(a2)+
	add.w	d3,(a2)+
	add.w	d4,(a2)+
	add.w	d5,(a2)+
	add.w	d6,(a2)+
	movem.w	(a0)+,d1-d6
	add.w	d1,(a2)+
	add.w	d2,(a2)+
	add.w	d3,(a2)+
	add.w	d4,(a2)+
	add.w	d5,(a2)+
	add.w	d6,(a2)+
	movem.w	(a0)+,d1-d6
	add.w	d1,(a2)+
	add.w	d2,(a2)+
	add.w	d3,(a2)+
	add.w	d4,(a2)+
	add.w	d5,(a2)+
	add.w	d6,(a2)+
	movem.w	(a0)+,d1-d6
	add.w	d1,(a2)+
	add.w	d2,(a2)+
	add.w	d3,(a2)+
	add.w	d4,(a2)+
	add.w	d5,(a2)+
	add.w	d6,(a2)+
	movem.w	(a0)+,d1-d6
	add.w	d1,(a2)+
	add.w	d2,(a2)+
	add.w	d3,(a2)+
	add.w	d4,(a2)+
	add.w	d5,(a2)+
	add.w	d6,(a2)+
	rts

L0053b8:
	moveq.l	#$0b,d4
L0053ba:
	move.w	(a0)+,d6
	move.w	d6,d5
	asr.w	#2,d5
	add.w	d5,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	move.w	d6,d5
	asr.w	#2,d5
	add.w	d5,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	move.w	d6,d5
	asr.w	#2,d5
	add.w	d5,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	move.w	d6,d5
	asr.w	#2,d5
	add.w	d5,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	move.w	d6,d5
	asr.w	#2,d5
	add.w	d5,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	move.w	d6,d5
	asr.w	#2,d5
	add.w	d5,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	move.w	d6,d5
	asr.w	#2,d5
	add.w	d5,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	move.w	d6,d5
	asr.w	#2,d5
	add.w	d5,d6
	add.w	d6,(a2)+
	dbra.w	d4,L0053ba
	rts

L005410:
	moveq.l	#$0b,d4
L005412:
	move.w	(a0)+,d6
	move.w	d6,d5
	add.w	d6,d6
	asr.w	#1,d5
	sub.w	d5,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	move.w	d6,d5
	add.w	d6,d6
	asr.w	#1,d5
	sub.w	d5,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	move.w	d6,d5
	add.w	d6,d6
	asr.w	#1,d5
	sub.w	d5,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	move.w	d6,d5
	add.w	d6,d6
	asr.w	#1,d5
	sub.w	d5,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	move.w	d6,d5
	add.w	d6,d6
	asr.w	#1,d5
	sub.w	d5,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	move.w	d6,d5
	add.w	d6,d6
	asr.w	#1,d5
	sub.w	d5,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	move.w	d6,d5
	add.w	d6,d6
	asr.w	#1,d5
	sub.w	d5,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	move.w	d6,d5
	add.w	d6,d6
	asr.w	#1,d5
	sub.w	d5,d6
	add.w	d6,(a2)+
	dbra.w	d4,L005412
	rts

L005478:
	moveq.l	#$0b,d4
L00547a:
	move.w	(a0)+,d6
	add.w	d6,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	add.w	d6,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	add.w	d6,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	add.w	d6,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	add.w	d6,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	add.w	d6,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	add.w	d6,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	add.w	d6,d6
	add.w	d6,(a2)+
	dbra.w	d4,L00547a
	rts

L0054b0:
	moveq.l	#$0b,d4
L0054b2:
	move.w	(a0)+,d6
	move.w	d6,d5
	add.w	d6,d6
	asr.w	#1,d5
	add.w	d5,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	move.w	d6,d5
	add.w	d6,d6
	asr.w	#1,d5
	add.w	d5,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	move.w	d6,d5
	add.w	d6,d6
	asr.w	#1,d5
	add.w	d5,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	move.w	d6,d5
	add.w	d6,d6
	asr.w	#1,d5
	add.w	d5,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	move.w	d6,d5
	add.w	d6,d6
	asr.w	#1,d5
	add.w	d5,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	move.w	d6,d5
	add.w	d6,d6
	asr.w	#1,d5
	add.w	d5,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	move.w	d6,d5
	add.w	d6,d6
	asr.w	#1,d5
	add.w	d5,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	move.w	d6,d5
	add.w	d6,d6
	asr.w	#1,d5
	add.w	d5,d6
	add.w	d6,(a2)+
	dbra.w	d4,L0054b2
	rts

L005518:
	moveq.l	#$0b,d4
L00551a:
	move.w	(a0)+,d6
	move.w	d6,d5
	add.w	d5,d6
	add.w	d5,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	move.w	d6,d5
	add.w	d5,d6
	add.w	d5,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	move.w	d6,d5
	add.w	d5,d6
	add.w	d5,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	move.w	d6,d5
	add.w	d5,d6
	add.w	d5,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	move.w	d6,d5
	add.w	d5,d6
	add.w	d5,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	move.w	d6,d5
	add.w	d5,d6
	add.w	d5,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	move.w	d6,d5
	add.w	d5,d6
	add.w	d5,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	move.w	d6,d5
	add.w	d5,d6
	add.w	d5,d6
	add.w	d6,(a2)+
	dbra.w	d4,L00551a
	rts

L005570:
	moveq.l	#$0b,d4
L005572:
	move.w	(a0)+,d6
	add.w	d6,d6
	add.w	d6,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	add.w	d6,d6
	add.w	d6,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	add.w	d6,d6
	add.w	d6,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	add.w	d6,d6
	add.w	d6,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	add.w	d6,d6
	add.w	d6,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	add.w	d6,d6
	add.w	d6,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	add.w	d6,d6
	add.w	d6,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	add.w	d6,d6
	add.w	d6,d6
	add.w	d6,(a2)+
	dbra.w	d4,L005572
	rts

L0055b8:
	moveq.l	#$0b,d4
L0055ba:
	move.w	(a0)+,d6
	move.w	d6,d5
	add.w	d6,d6
	add.w	d6,d6
	add.w	d5,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	move.w	d6,d5
	add.w	d6,d6
	add.w	d6,d6
	add.w	d5,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	move.w	d6,d5
	add.w	d6,d6
	add.w	d6,d6
	add.w	d5,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	move.w	d6,d5
	add.w	d6,d6
	add.w	d6,d6
	add.w	d5,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	move.w	d6,d5
	add.w	d6,d6
	add.w	d6,d6
	add.w	d5,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	move.w	d6,d5
	add.w	d6,d6
	add.w	d6,d6
	add.w	d5,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	move.w	d6,d5
	add.w	d6,d6
	add.w	d6,d6
	add.w	d5,d6
	add.w	d6,(a2)+
	move.w	(a0)+,d6
	move.w	d6,d5
	add.w	d6,d6
	add.w	d6,d6
	add.w	d5,d6
	add.w	d6,(a2)+
	dbra.w	d4,L0055ba
	rts

L005620:
	lea.l	(Table1,pc),a3
	bra.s	L005636

L005626:
	lea.l	(Table2,pc),a3
	bra.s	L005636

L00562c:
	lea.l	(Table3,pc),a3
	bra.s	L005636

L005632:
	lea.l	(Table4,pc),a3
L005636:
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	moveq.l	#$00,d6
	move.b	(a0)+,d6
	move.b	(a3,d6.w),d6
	ext.w	d6
	add.w	d6,(a2)+
	rts

L005ab8:
	moveq.l	#$0b,d4
L005aba:
	move.b	(a0)+,d6
	ext.w	d6
	asr.w	#3,d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	asr.w	#3,d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	asr.w	#3,d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	asr.w	#3,d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	asr.w	#3,d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	asr.w	#3,d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	asr.w	#3,d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	asr.w	#3,d6
	add.w	d6,(a2)+
	dbra.w	d4,L005aba
	rts

L005b00:
	moveq.l	#$0b,d4
L005b02:
	move.b	(a0)+,d6
	ext.w	d6
	asr.w	#2,d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	asr.w	#2,d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	asr.w	#2,d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	asr.w	#2,d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	asr.w	#2,d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	asr.w	#2,d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	asr.w	#2,d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	asr.w	#2,d6
	add.w	d6,(a2)+
	dbra.w	d4,L005b02
	rts

L005b48:
	moveq.l	#$0b,d4
L005b4a:
	move.b	(a0)+,d6
	ext.w	d6
	asr.w	#1,d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	asr.w	#1,d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	asr.w	#1,d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	asr.w	#1,d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	asr.w	#1,d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	asr.w	#1,d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	asr.w	#1,d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	asr.w	#1,d6
	add.w	d6,(a2)+
	dbra.w	d4,L005b4a
	rts

L005b90:
	moveq.l	#$0b,d4
L005b92:
	move.b	(a0)+,d6
	ext.w	d6
	move.w	d6,d5
	asr.w	#2,d5
	sub.w	d5,d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	move.w	d6,d5
	asr.w	#2,d5
	sub.w	d5,d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	move.w	d6,d5
	asr.w	#2,d5
	sub.w	d5,d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	move.w	d6,d5
	asr.w	#2,d5
	sub.w	d5,d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	move.w	d6,d5
	asr.w	#2,d5
	sub.w	d5,d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	move.w	d6,d5
	asr.w	#2,d5
	sub.w	d5,d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	move.w	d6,d5
	asr.w	#2,d5
	sub.w	d5,d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	move.w	d6,d5
	asr.w	#2,d5
	sub.w	d5,d6
	add.w	d6,(a2)+
	dbra.w	d4,L005b92
	rts

L005bf8:
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,(a2)+
	rts

L005e3a:
	moveq.l	#$0b,d4
L005e3c:
	move.b	(a0)+,d6
	ext.w	d6
	move.w	d6,d5
	asr.w	#2,d5
	add.w	d5,d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	move.w	d6,d5
	asr.w	#2,d5
	add.w	d5,d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	move.w	d6,d5
	asr.w	#2,d5
	add.w	d5,d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	move.w	d6,d5
	asr.w	#2,d5
	add.w	d5,d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	move.w	d6,d5
	asr.w	#2,d5
	add.w	d5,d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	move.w	d6,d5
	asr.w	#2,d5
	add.w	d5,d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	move.w	d6,d5
	asr.w	#2,d5
	add.w	d5,d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	move.w	d6,d5
	asr.w	#2,d5
	add.w	d5,d6
	add.w	d6,(a2)+
	dbra.w	d4,L005e3c
	rts

L005ea2:
	moveq.l	#$0b,d4
L005ea4:
	move.b	(a0)+,d6
	ext.w	d6
	move.w	d6,d5
	add.w	d6,d6
	asr.w	#1,d5
	sub.w	d5,d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	move.w	d6,d5
	add.w	d6,d6
	asr.w	#1,d5
	sub.w	d5,d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	move.w	d6,d5
	add.w	d6,d6
	asr.w	#1,d5
	sub.w	d5,d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	move.w	d6,d5
	add.w	d6,d6
	asr.w	#1,d5
	sub.w	d5,d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	move.w	d6,d5
	add.w	d6,d6
	asr.w	#1,d5
	sub.w	d5,d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	move.w	d6,d5
	add.w	d6,d6
	asr.w	#1,d5
	sub.w	d5,d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	move.w	d6,d5
	add.w	d6,d6
	asr.w	#1,d5
	sub.w	d5,d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	move.w	d6,d5
	add.w	d6,d6
	asr.w	#1,d5
	sub.w	d5,d6
	add.w	d6,(a2)+
	dbra.w	d4,L005ea4
	rts

L005f1a:
	moveq.l	#$0b,d4
L005f1c:
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,d6
	add.w	d6,(a2)+
	dbra.w	d4,L005f1c
	rts

L005f62:
	moveq.l	#$0b,d4
L005f64:
	move.b	(a0)+,d6
	ext.w	d6
	move.w	d6,d5
	add.w	d6,d6
	asr.w	#1,d5
	add.w	d5,d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	move.w	d6,d5
	add.w	d6,d6
	asr.w	#1,d5
	add.w	d5,d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	move.w	d6,d5
	add.w	d6,d6
	asr.w	#1,d5
	add.w	d5,d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	move.w	d6,d5
	add.w	d6,d6
	asr.w	#1,d5
	add.w	d5,d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	move.w	d6,d5
	add.w	d6,d6
	asr.w	#1,d5
	add.w	d5,d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	move.w	d6,d5
	add.w	d6,d6
	asr.w	#1,d5
	add.w	d5,d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	move.w	d6,d5
	add.w	d6,d6
	asr.w	#1,d5
	add.w	d5,d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	move.w	d6,d5
	add.w	d6,d6
	asr.w	#1,d5
	add.w	d5,d6
	add.w	d6,(a2)+
	dbra.w	d4,L005f64
	rts

L005fda:
	moveq.l	#$0b,d4
L005fdc:
	move.b	(a0)+,d6
	ext.w	d6
	move.w	d6,d5
	add.w	d5,d6
	add.w	d5,d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	move.w	d6,d5
	add.w	d5,d6
	add.w	d5,d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	move.w	d6,d5
	add.w	d5,d6
	add.w	d5,d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	move.w	d6,d5
	add.w	d5,d6
	add.w	d5,d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	move.w	d6,d5
	add.w	d5,d6
	add.w	d5,d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	move.w	d6,d5
	add.w	d5,d6
	add.w	d5,d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	move.w	d6,d5
	add.w	d5,d6
	add.w	d5,d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	move.w	d6,d5
	add.w	d5,d6
	add.w	d5,d6
	add.w	d6,(a2)+
	dbra.w	d4,L005fdc
	rts

L006042:
	moveq.l	#$0b,d4
L006044:
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,d6
	add.w	d6,d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,d6
	add.w	d6,d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,d6
	add.w	d6,d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,d6
	add.w	d6,d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,d6
	add.w	d6,d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,d6
	add.w	d6,d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,d6
	add.w	d6,d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	add.w	d6,d6
	add.w	d6,d6
	add.w	d6,(a2)+
	dbra.w	d4,L006044
	rts

L00609a:
	moveq.l	#$0b,d4
L00609c:
	move.b	(a0)+,d6
	ext.w	d6
	move.w	d6,d5
	add.w	d6,d6
	add.w	d6,d6
	add.w	d5,d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	move.w	d6,d5
	add.w	d6,d6
	add.w	d6,d6
	add.w	d5,d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	move.w	d6,d5
	add.w	d6,d6
	add.w	d6,d6
	add.w	d5,d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	move.w	d6,d5
	add.w	d6,d6
	add.w	d6,d6
	add.w	d5,d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	move.w	d6,d5
	add.w	d6,d6
	add.w	d6,d6
	add.w	d5,d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	move.w	d6,d5
	add.w	d6,d6
	add.w	d6,d6
	add.w	d5,d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	move.w	d6,d5
	add.w	d6,d6
	add.w	d6,d6
	add.w	d5,d6
	add.w	d6,(a2)+
	move.b	(a0)+,d6
	ext.w	d6
	move.w	d6,d5
	add.w	d6,d6
	add.w	d6,d6
	add.w	d5,d6
	add.w	d6,(a2)+
	dbra.w	d4,L00609c
	rts

Table1:
	.dc.b	$00,$00,$00,$00,$00,$00,$01,$01
	.dc.b	$01,$01,$01,$02,$02,$02,$02,$02
	.dc.b	$03,$03,$03,$03,$03,$03,$04,$04
	.dc.b	$04,$04,$04,$05,$05,$05,$05,$05
	.dc.b	$06,$06,$06,$06,$06,$06,$07,$07
	.dc.b	$07,$07,$07,$08,$08,$08,$08,$08
	.dc.b	$09,$09,$09,$09,$09,$09,$0a,$0a
	.dc.b	$0a,$0a,$0a,$0b,$0b,$0b,$0b,$0b
	.dc.b	$0c,$0c,$0c,$0c,$0c,$0c,$0d,$0d
	.dc.b	$0d,$0d,$0d,$0e,$0e,$0e,$0e,$0e
	.dc.b	$0f,$0f,$0f,$0f,$0f,$0f,$10,$10
	.dc.b	$10,$10,$10,$11,$11,$11,$11,$11
	.dc.b	$12,$12,$12,$12,$12,$12,$13,$13
	.dc.b	$13,$13,$13,$14,$14,$14,$14,$14
	.dc.b	$15,$15,$15,$15,$15,$15,$16,$16
	.dc.b	$16,$16,$16,$17,$17,$17,$17,$17
	.dc.b	$e8,$e9,$e9,$e9,$e9,$e9,$ea,$ea
	.dc.b	$ea,$ea,$ea,$eb,$eb,$eb,$eb,$eb
	.dc.b	$eb,$ec,$ec,$ec,$ec,$ec,$ed,$ed
	.dc.b	$ed,$ed,$ed,$ee,$ee,$ee,$ee,$ee
	.dc.b	$ee,$ef,$ef,$ef,$ef,$ef,$f0,$f0
	.dc.b	$f0,$f0,$f0,$f1,$f1,$f1,$f1,$f1
	.dc.b	$f1,$f2,$f2,$f2,$f2,$f2,$f3,$f3
	.dc.b	$f3,$f3,$f3,$f4,$f4,$f4,$f4,$f4
	.dc.b	$f4,$f5,$f5,$f5,$f5,$f5,$f6,$f6
	.dc.b	$f6,$f6,$f6,$f7,$f7,$f7,$f7,$f7
	.dc.b	$f7,$f8,$f8,$f8,$f8,$f8,$f9,$f9
	.dc.b	$f9,$f9,$f9,$fa,$fa,$fa,$fa,$fa
	.dc.b	$fa,$fb,$fb,$fb,$fb,$fb,$fc,$fc
	.dc.b	$fc,$fc,$fc,$fd,$fd,$fd,$fd,$fd
	.dc.b	$fd,$fe,$fe,$fe,$fe,$fe,$ff,$ff
	.dc.b	$ff,$ff,$ff,$00,$00,$00,$00,$00
Table2:
	.dc.b	$00,$00,$00,$00,$01,$01,$01,$02
	.dc.b	$02,$02,$03,$03,$03,$04,$04,$04
	.dc.b	$05,$05,$05,$05,$06,$06,$06,$07
	.dc.b	$07,$07,$08,$08,$08,$09,$09,$09
	.dc.b	$0a,$0a,$0a,$0a,$0b,$0b,$0b,$0c
	.dc.b	$0c,$0c,$0d,$0d,$0d,$0e,$0e,$0e
	.dc.b	$0f,$0f,$0f,$0f,$10,$10,$10,$11
	.dc.b	$11,$11,$12,$12,$12,$13,$13,$13
	.dc.b	$14,$14,$14,$14,$15,$15,$15,$16
	.dc.b	$16,$16,$17,$17,$17,$18,$18,$18
	.dc.b	$19,$19,$19,$19,$1a,$1a,$1a,$1b
	.dc.b	$1b,$1b,$1c,$1c,$1c,$1d,$1d,$1d
	.dc.b	$1e,$1e,$1e,$1e,$1f,$1f,$1f,$20
	.dc.b	$20,$20,$21,$21,$21,$22,$22,$22
	.dc.b	$23,$23,$23,$23,$24,$24,$24,$25
	.dc.b	$25,$25,$26,$26,$26,$27,$27,$27
	.dc.b	$d8,$d9,$d9,$d9,$da,$da,$da,$db
	.dc.b	$db,$db,$dc,$dc,$dc,$dd,$dd,$dd
	.dc.b	$dd,$de,$de,$de,$df,$df,$df,$e0
	.dc.b	$e0,$e0,$e1,$e1,$e1,$e2,$e2,$e2
	.dc.b	$e2,$e3,$e3,$e3,$e4,$e4,$e4,$e5
	.dc.b	$e5,$e5,$e6,$e6,$e6,$e7,$e7,$e7
	.dc.b	$e7,$e8,$e8,$e8,$e9,$e9,$e9,$ea
	.dc.b	$ea,$ea,$eb,$eb,$eb,$ec,$ec,$ec
	.dc.b	$ec,$ed,$ed,$ed,$ee,$ee,$ee,$ef
	.dc.b	$ef,$ef,$f0,$f0,$f0,$f1,$f1,$f1
	.dc.b	$f1,$f2,$f2,$f2,$f3,$f3,$f3,$f4
	.dc.b	$f4,$f4,$f5,$f5,$f5,$f6,$f6,$f6
	.dc.b	$f6,$f7,$f7,$f7,$f8,$f8,$f8,$f9
	.dc.b	$f9,$f9,$fa,$fa,$fa,$fb,$fb,$fb
	.dc.b	$fb,$fc,$fc,$fc,$fd,$fd,$fd,$fe
	.dc.b	$fe,$fe,$ff,$ff,$ff,$00,$00,$00
Table3:
	.dc.b	$00,$00,$00,$01,$01,$01,$02,$02
	.dc.b	$03,$03,$03,$04,$04,$04,$05,$05
	.dc.b	$06,$06,$06,$07,$07,$07,$08,$08
	.dc.b	$09,$09,$09,$0a,$0a,$0a,$0b,$0b
	.dc.b	$0c,$0c,$0c,$0d,$0d,$0d,$0e,$0e
	.dc.b	$0f,$0f,$0f,$10,$10,$10,$11,$11
	.dc.b	$12,$12,$12,$13,$13,$13,$14,$14
	.dc.b	$15,$15,$15,$16,$16,$16,$17,$17
	.dc.b	$18,$18,$18,$19,$19,$19,$1a,$1a
	.dc.b	$1b,$1b,$1b,$1c,$1c,$1c,$1d,$1d
	.dc.b	$1e,$1e,$1e,$1f,$1f,$1f,$20,$20
	.dc.b	$21,$21,$21,$22,$22,$22,$23,$23
	.dc.b	$24,$24,$24,$25,$25,$25,$26,$26
	.dc.b	$27,$27,$27,$28,$28,$28,$29,$29
	.dc.b	$2a,$2a,$2a,$2b,$2b,$2b,$2c,$2c
	.dc.b	$2d,$2d,$2d,$2e,$2e,$2e,$2f,$2f
	.dc.b	$d0,$d1,$d1,$d2,$d2,$d2,$d3,$d3
	.dc.b	$d3,$d4,$d4,$d5,$d5,$d5,$d6,$d6
	.dc.b	$d6,$d7,$d7,$d8,$d8,$d8,$d9,$d9
	.dc.b	$d9,$da,$da,$db,$db,$db,$dc,$dc
	.dc.b	$dc,$dd,$dd,$de,$de,$de,$df,$df
	.dc.b	$df,$e0,$e0,$e1,$e1,$e1,$e2,$e2
	.dc.b	$e2,$e3,$e3,$e4,$e4,$e4,$e5,$e5
	.dc.b	$e5,$e6,$e6,$e7,$e7,$e7,$e8,$e8
	.dc.b	$e8,$e9,$e9,$ea,$ea,$ea,$eb,$eb
	.dc.b	$eb,$ec,$ec,$ed,$ed,$ed,$ee,$ee
	.dc.b	$ee,$ef,$ef,$f0,$f0,$f0,$f1,$f1
	.dc.b	$f1,$f2,$f2,$f3,$f3,$f3,$f4,$f4
	.dc.b	$f4,$f5,$f5,$f6,$f6,$f6,$f7,$f7
	.dc.b	$f7,$f8,$f8,$f9,$f9,$f9,$fa,$fa
	.dc.b	$fa,$fb,$fb,$fc,$fc,$fc,$fd,$fd
	.dc.b	$fd,$fe,$fe,$ff,$ff,$ff,$00,$00
Table4:
	.dc.b	$00,$00,$01,$01,$02,$03,$03,$04
	.dc.b	$05,$05,$06,$06,$07,$08,$08,$09
	.dc.b	$0a,$0a,$0b,$0b,$0c,$0d,$0d,$0e
	.dc.b	$0f,$0f,$10,$10,$11,$12,$12,$13
	.dc.b	$14,$14,$15,$15,$16,$17,$17,$18
	.dc.b	$19,$19,$1a,$1a,$1b,$1c,$1c,$1d
	.dc.b	$1e,$1e,$1f,$1f,$20,$21,$21,$22
	.dc.b	$23,$23,$24,$24,$25,$26,$26,$27
	.dc.b	$28,$28,$29,$29,$2a,$2b,$2b,$2c
	.dc.b	$2d,$2d,$2e,$2e,$2f,$30,$30,$31
	.dc.b	$32,$32,$33,$33,$34,$35,$35,$36
	.dc.b	$37,$37,$38,$38,$39,$3a,$3a,$3b
	.dc.b	$3c,$3c,$3d,$3d,$3e,$3f,$3f,$40
	.dc.b	$41,$41,$42,$42,$43,$44,$44,$45
	.dc.b	$46,$46,$47,$47,$48,$49,$49,$4a
	.dc.b	$4b,$4b,$4c,$4c,$4d,$4e,$4e,$4f
	.dc.b	$b0,$b1,$b2,$b2,$b3,$b4,$b4,$b5
	.dc.b	$b5,$b6,$b7,$b7,$b8,$b9,$b9,$ba
	.dc.b	$ba,$bb,$bc,$bc,$bd,$be,$be,$bf
	.dc.b	$bf,$c0,$c1,$c1,$c2,$c3,$c3,$c4
	.dc.b	$c4,$c5,$c6,$c6,$c7,$c8,$c8,$c9
	.dc.b	$c9,$ca,$cb,$cb,$cc,$cd,$cd,$ce
	.dc.b	$ce,$cf,$d0,$d0,$d1,$d2,$d2,$d3
	.dc.b	$d3,$d4,$d5,$d5,$d6,$d7,$d7,$d8
	.dc.b	$d8,$d9,$da,$da,$db,$dc,$dc,$dd
	.dc.b	$dd,$de,$df,$df,$e0,$e1,$e1,$e2
	.dc.b	$e2,$e3,$e4,$e4,$e5,$e6,$e6,$e7
	.dc.b	$e7,$e8,$e9,$e9,$ea,$eb,$eb,$ec
	.dc.b	$ec,$ed,$ee,$ee,$ef,$f0,$f0,$f1
	.dc.b	$f1,$f2,$f3,$f3,$f4,$f5,$f5,$f6
	.dc.b	$f6,$f7,$f8,$f8,$f9,$fa,$fa,$fb
	.dc.b	$fb,$fc,$fd,$fd,$fe,$ff,$ff,$00
EntryPoint:
	move.l	($0008,a0),d7
	subi.l	#End+$01b302,d7
	pea.l	($0000)
	DOS	_SUPER
	move.l	d0,(sp)
	pea.l	(HelloString,pc)
	DOS	_PRINT
	addq.l	#4,sp
	bsr.w	ParseCmdlineArgs
	bmi.s	ErrExitPrintHelp
	beq.s	L0065a0
	bsr.w	CheckPCM8Loaded
	bne.s	ErrExitNotLoaded
	moveq.l	#$ff,d0
	trap	#2
	tst.l	d0
	bmi.s	ErrExitCannotUnlock
	pea.l	(CanceledString,pc)
L006546:
	DOS	_PRINT
	addq.l	#4,sp
	DOS	_SUPER
	addq.l	#4,sp
	DOS	_EXIT

ErrExitCannotUnlock:
	addq.w	#1,d0
	bmi.s	ErrExitVectorInUse
	pea.l	(CannotUnlockString,pc)
	bra.s	PrintErrAndExit

ErrExitVectorInUse:
	addq.w	#1,d0
	bmi.s	ErrExitCannotCancel
	pea.l	(VectorAlreadyInUseString,pc)
	bra.s	PrintErrAndExit

ErrExitCannotCancel:
	pea.l	(CannotCancelString,pc)
	bra.s	PrintErrAndExit

ErrExitNotLoaded:
	pea.l	(NotLoadedString,pc)
	bra.s	PrintErrAndExit

ErrExitPrintHelp:
	pea.l	(HelpString,pc)
	bra.s	PrintErrAndExit

ErrExitOutOfMem:
	pea.l	(OutOfMemoryString,pc)
	bra.s	PrintErrAndExit

ErrExitAlreadyLoaded:
	pea.l	(AlreadyLoadedString,pc)
	bra.s	PrintErrAndExit

ErrExitCouldNotLoad:
	pea.l	(CouldNotLoadString,pc)
PrintErrAndExit:
	DOS	_PRINT
	addq.l	#4,sp
	DOS	_SUPER
	addq.l	#4,sp
	move.w	#$0001,-(sp)
	DOS	_EXIT2

L006594:
	bsr.w	L00681e
	bmi.s	ErrExitAlreadyLoaded
	pea.l	(SettingChangedString,pc)
	bra.s	L006546

L0065a0:
	bsr.s	CheckPCM8Loaded
	beq.s	L006594
	tst.l	d7
	bmi.s	ErrExitOutOfMem
	move.l	($0088),d0
	cmpi.l	#$00f00000,d0
	bcs.s	ErrExitCouldNotLoad
	bsr.w	L0068cc
	lea.l	(EntryPoint),a0
	lea.l	(End+$019b02),a1
	lea.l	($00c2,a1),a2
	move.w	#$041d,d0
L0065cc:
	move.w	(a0)+,(a1)+
	dbra.w	d0,L0065cc
	jmp	(a2)

L0065d4:
	bsr.w	Sub006b3e
	bsr.w	L006886
	tst.l	d0
	bmi.s	ErrExitCouldNotLoad
	bsr.w	L00681e
	DOS	_SUPER
	addq.l	#4,sp
	clr.w	-(sp)
	move.l	#$00020850,-(sp)
	DOS	_KEEPPR

CheckPCM8Loaded:
	movea.l	($0088),a0
	cmpi.w	#$5043,(-$0008,a0)	;'PC'
	bne.s	L006614
	cmpi.b	#$2f,(-$0004,a0)	;'/'
	bne.s	L006614
	move.w	(-$0006,a0),d0
	cmpi.w	#$4d38,d0		;'M8'
	beq.s	L006614
	cmpi.w	#$4d34,d0		;'M4'
L006614:
	rts

ParseCmdlineArgs:
	addq.l	#1,a2
	lea.l	(L0067bc,pc),a0
L00661c:
	bsr.w	L0067c4
	beq.w	L0066ca
	cmpi.b	#$2d,d0			;'-'
	beq.s	L0066a0
	cmpi.b	#$2f,d0			;'/'
	beq.s	L0066a0
	andi.b	#$df,d0
	cmpi.b	#$4d,d0			;'M'
	beq.w	L006780
	tst.b	(a0)
	bne.w	L0066c6
	cmpi.b	#$4f,d0			;'O'
	beq.s	L006678
	cmpi.b	#$46,d0			;'F'
	bne.s	L0066c6
	moveq.l	#$df,d0
	and.b	(a2)+,d0
	cmpi.b	#$4e,d0			;'N'
	beq.s	L006668
	cmpi.b	#$55,d0			;'U'
	bne.s	L0066c6
	moveq.l	#$df,d0
	and.b	(a2)+,d0
	cmpi.b	#$4e,d0			;'N'
	bne.s	L0066c6
L006668:
	moveq.l	#$df,d0
	and.b	(a2)+,d0
	cmpi.b	#$43,d0			;'C'
	bne.s	L0066c6
L006672:
	move.b	#$32,(a0)		;'2'
	bra.s	L00661c

L006678:
	moveq.l	#$df,d0
	and.b	(a2)+,d0
	cmpi.b	#$4e,d0			;'N'
	beq.s	L006698
	cmpi.b	#$46,d0			;'F'
	bne.s	L0066c6
	moveq.l	#$df,d0
	and.b	(a2)+,d0
	cmpi.b	#$46,d0			;'F'
	bne.s	L0066c6
L006692:
	move.b	#$30,(a0)		;'0'
	bra.s	L00661c

L006698:
	move.b	#$31,(a0)		;'1'
	bra.w	L00661c

L0066a0:
	move.b	(a2)+,d0
	andi.b	#$df,d0
	cmpi.b	#$52,d0			;'R'
	beq.s	L0066ce
	cmpi.b	#$44,d0			;'D'
	beq.s	L0066dc
	cmpi.b	#$4c,d0			;'L'
	beq.w	L006760
	cmpi.b	#$49,d0			;'I'
	beq.s	L006710
	cmpi.b	#$56,d0			;'V'
	beq.s	L00672c
L0066c6:
	moveq.l	#$ff,d0
	rts

L0066ca:
	moveq.l	#$00,d0
	rts

L0066ce:
	tst.w	(a0)
	bne.s	L0066c6
	bsr.w	L0067c4
	bne.s	L0066c6
	moveq.l	#$01,d0
	rts

L0066dc:
	tst.b	($0001,a0)
	bne.s	L0066c6
	move.b	(a2)+,d0
	cmpi.b	#$30,d0			;'0'
	beq.s	L006708
	cmpi.b	#$31,d0			;'1'
	beq.s	L006708
	cmpi.b	#$2d,d0			;'-'
	beq.s	L006702
	cmpi.b	#$2b,d0			;'+'
	beq.s	L006706
	subq.l	#1,a2
	moveq.l	#$32,d0			;'2'
	bra.s	L006708

L006702:
	moveq.l	#$30,d0			;'0'
	bra.s	L006708

L006706:
	moveq.l	#$31,d0			;'1'
L006708:
	move.b	d0,($0001,a0)
	bra.w	L00661c

L006710:
	tst.b	($0003,a0)
	bne.s	L0066c6
	move.b	(a2)+,d0
	cmpi.b	#$30,d0			;'0'
	bcs.s	L0066c6
	cmpi.b	#$38,d0			;'8'
	bhi.s	L0066c6
	move.b	d0,($0003,a0)
	bra.w	L00661c

L00672c:
	tst.b	($0002,a0)
	bne.s	L0066c6
	move.b	(a2)+,d0
	cmpi.b	#$30,d0			;'0'
	beq.s	L006758
	cmpi.b	#$31,d0			;'1'
	beq.s	L006758
	cmpi.b	#$2d,d0			;'-'
	beq.s	L006752
	cmpi.b	#$2b,d0			;'+'
	beq.s	L006756
	subq.l	#1,a2
	moveq.l	#$32,d0			;'2'
	bra.s	L006758

L006752:
	moveq.l	#$30,d0			;'0'
	bra.s	L006758

L006756:
	moveq.l	#$31,d0			;'1'
L006758:
	move.b	d0,($0002,a0)
	bra.w	L00661c

L006760:
	tst.b	(a0)
	bne.w	L0066c6
	move.b	(a2)+,d0
	subi.b	#$30,d0			;'0'
	beq.w	L006692
	subq.b	#1,d0
	beq.w	L006698
	subq.b	#1,d0
	beq.w	L006672
	bra.w	L0066c6

L006780:
	moveq.l	#$df,d0
	and.b	(a2)+,d0
	cmpi.b	#$41,d0			;'A'
	bne.w	L0066c6
	moveq.l	#$df,d0
	and.b	(a2)+,d0
	cmpi.b	#$53,d0			;'S'
	bne.w	L0066c6
	moveq.l	#$df,d0
	and.b	(a2)+,d0
	cmpi.b	#$4b,d0			;'K'
	bne.w	L0066c6
	cmpi.b	#$3a,(a2)+		;':'
	bne.w	L0066c6
	bsr.s	L0067d6
	bmi.w	L0066c6
	lea.l	(L0067c0,pc),a1
	move.l	d1,(a1)
	bra.w	L00661c

L0067bc:
	.dc.l	$00000000
L0067c0:
	.dc.l	$ffffffff
L0067c4:
	move.b	(a2)+,d0
	beq.s	L0067d4
	cmpi.b	#$20,d0			;' '
	beq.s	L0067c4
	cmpi.b	#$09,d0
	beq.s	L0067c4
L0067d4:
	rts

L0067d6:
	moveq.l	#$00,d1
	move.b	(a2)+,d0
L0067da:
	cmpi.b	#$30,d0			;'0'
	bcs.s	L00681a
	cmpi.b	#$39,d0			;'9'
	bhi.s	L0067ec
	subi.b	#$30,d0			;'0'
	bra.s	L006800

L0067ec:
	andi.b	#$df,d0
	cmpi.b	#$41,d0			;'A'
	bcs.s	L00681a
	cmpi.b	#$46,d0			;'F'
	bhi.s	L00681a
	subi.b	#$37,d0			;'7'
L006800:
	lsl.l	#4,d1
	add.b	d0,d1
	move.b	(a2)+,d0
	beq.s	L006814
	cmpi.b	#$20,d0			;' '
	beq.s	L006814
	cmpi.b	#$09,d0
	bne.s	L0067da
L006814:
	subq.l	#1,a2
	moveq.l	#$00,d0
	rts

L00681a:
	moveq.l	#$ff,d0
	rts

L00681e:
	move.l	(L0067bc,pc),d2
	bne.s	L00682e
	move.l	(L0067c0,pc),d0
	bpl.s	L00682e
	moveq.l	#$ff,d0
	rts

L00682e:
	swap.w	d2
	moveq.l	#$00,d1
	move.b	d2,d1
	beq.s	L006840
	sub.b	#$30,d1			;'0'
	move.w	#$7f00,d0
	trap	#2
L006840:
	lsr.w	#8,d2
	moveq.l	#$00,d1
	move.b	d2,d1
	beq.s	L006852
	sub.b	#$30,d1			;'0'
	move.w	#$7f02,d0
	trap	#2
L006852:
	swap.w	d2
	moveq.l	#$00,d1
	move.b	d2,d1
	beq.s	L006864
	sub.b	#$30,d1			;'0'
	move.w	#$7f03,d0
	trap	#2
L006864:
	lsr.w	#8,d2
	moveq.l	#$00,d1
	move.b	d2,d1
	beq.s	L006876
	sub.b	#$30,d1			;'0'
	move.w	#$7f04,d0
	trap	#2
L006876:
	move.l	(L0067c0,pc),d1
	bmi.s	L006882
	move.w	#$01fb,d0
	trap	#2
L006882:
	moveq.l	#$00,d0
	rts

L006886:
	move.w	sr,-(sp)
	ori.w	#$0700,sr
	move.l	($0088),d0
	cmpi.l	#$00f00000,d0
	bcs.s	L0068c6
	moveq.l	#$00,d1
	IOCS	_ADPCMMOD
	lea.l	(VectorOverrides),a0
	lea.l	(L001662),a1
	moveq.l	#$06,d1
L0068ac:
	movea.l	(a0)+,a2
	move.l	(a2),(a1)+
	move.l	(a0)+,(a2)
	dbra.w	d1,L0068ac
	move.b	#$50,(Start)		;'P'
	moveq.l	#$00,d0
	jmp	(L001a74)

L0068c6:
	moveq.l	#$ff,d0
	move.w	(sp)+,sr
	rts

L0068cc:
	lea.l	(L001682),a0
	lea.l	(L001882),a1
	moveq.l	#$30,d1			;'0'
	moveq.l	#$07,d0
L0068dc:
	move.w	#$0004,($001c,a0)
	move.w	#$0008,($001e,a0)
	move.l	a1,($0010,a0)
	move.l	d1,($0014,a0)
	lea.l	($0040,a0),a0
	dbra.w	d0,L0068dc
	rts

HelloString:
	.dc.b	'X68k PCM8 polyphonic PCM driver v0.48b (c)1991-93 H.Etoh',$0d,$0a,$00
HelpString:
	.dc.b	'Žg—p–@: PCM8 [option]',$0d,$0a
	.dc.b	$09,'-R',$09,'‰ðœ',$0d,$0a
	.dc.b	$09,'-D',$09,'“®ì•\Ž¦ƒIƒ“/ƒIƒt',$0d,$0a
	.dc.b	$09,'-V',$09,'‰¹—Ê‰Â•ÏƒIƒ“/ƒIƒt',$0d,$0a
	.dc.b	$09,'-Inum',$09,'IOCS“¯ŽžÄ¶Å‘å”Ý’è',$0d,$0a
	.dc.b	$09,'ON',$09,'ƒ|ƒŠEƒ‚[ƒh',$09,'<default>',$0d,$0a
	.dc.b	$09,'FNC',$09,'ƒtƒ@ƒ“ƒNƒVƒ‡ƒ“ŒÀ’èƒ|ƒŠEƒ‚[ƒh',$0d,$0a
	.dc.b	$09,'OFF',$09,'ƒ‚ƒmEƒ‚[ƒh',$0d,$0a
	.dc.b	$09,'< ‘g‚Ýž‚Ýó‘Ô‚Å‚ÌÝ’è•ÏX‚ª‰Â”\‚Å‚· >',$0d,$0a,$00
CanceledString:
	.dc.b	'(( ‰ðœ‚µ‚Ü‚µ‚½ ))',$0d,$0a,$00
NotLoadedString:
	.dc.b	'(( ‘g‚Ýž‚Ü‚ê‚Ä‚¢‚Ü‚¹‚ñ ))',$0d,$0a,$00
AlreadyLoadedString:
	.dc.b	'(( Šù‚É‘g‚Ýž‚Ü‚ê‚Ä‚¢‚Ü‚· ))',$0d,$0a,$00
CouldNotLoadString:
	.dc.b	'(( ‘g‚Ýž‚Ý‚ð‹‘”Û‚³‚ê‚Ü‚µ‚½ ))',$0d,$0a,$00
SettingChangedString:
	.dc.b	'(( Ý’è‚ð•ÏX‚µ‚Ü‚µ‚½ ))',$0d,$0a,$00
CannotUnlockString:
	.dc.b	'(( è—L‚³‚ê‚Ä‚¢‚Ü‚·A‰ðœo—ˆ‚Ü‚¹‚ñ ))',$0d,$0a,$00
VectorAlreadyInUseString:
	.dc.b	'(( ƒxƒNƒ^‚ª•ÏX‚³‚ê‚Ä‚¢‚Ü‚·A‰ðœo—ˆ‚Ü‚¹‚ñ ))',$0d,$0a,$00
CannotCancelString:
	.dc.b	'(( ‰ðœo—ˆ‚Ü‚¹‚ñ ))',$0d,$0a,$00
OutOfMemoryString:
	.dc.b	'(( ƒƒ‚ƒŠ‚ª•s‘«‚µ‚Ä‚¢‚Ü‚· ))',$0d,$0a,$00
Sub006b3e:
	lea.l	(EntryPoint),a1
	lea.l	(Table5,pc),a0
	moveq.l	#$30,d7			;'0'
L006b4a:
	move.w	(a0)+,d1
	movea.l	a1,a3
	moveq.l	#$00,d2
	moveq.l	#$07,d6
L006b52:
	add.w	d1,d2
	move.w	d2,d3
	lsr.w	#3,d3
	move.w	d3,(a3)+
	neg.w	d3
	move.w	d3,($000e,a3)
	add.w	d1,d2
	dbra.w	d6,L006b52
	lea.l	($0020,a1),a1
	dbra.w	d7,L006b4a
	lea.l	(End+$00d702),a6
	lea.l	(EntryPoint),a5
	movea.l	a6,a0
	movea.l	a5,a3
	moveq.l	#$30,d2			;'0'
	moveq.l	#$09,d1
	lea.l	(L006ccc,pc),a4
	moveq.l	#$00,d7
	moveq.l	#$30,d6			;'0'
L006b8a:
	moveq.l	#$00,d5
L006b8c:
	moveq.l	#$0f,d0
	and.w	d5,d0
	add.w	d0,d0
	move.w	(a3,d0.w),(-$6200,a0)
	move.w	(a4,d0.w),d3
	add.w	d7,d3
	bpl.s	L006ba6
	moveq.l	#$00,d3
	movea.l	a5,a2
	bra.s	L006bb4

L006ba6:
	cmp.w	d2,d3
	ble.s	L006bac
	move.w	d2,d3
L006bac:
	move.w	d3,d0
	lsl.w	#5,d0
	lea.l	(a5,d0.w),a2
L006bb4:
	moveq.l	#$f0,d0
	and.w	d5,d0
	lsr.w	#3,d0
	move.w	(a2,d0.w),(a0)+
	add.w	(a4,d0.w),d3
	bpl.s	L006bca
	lea.l	($0002,a6),a1
	bra.s	L006bd6

L006bca:
	cmp.w	d2,d3
	ble.s	L006bd0
	move.w	d2,d3
L006bd0:
	lsl.w	d1,d3
	lea.l	($02,a6,d3.w),a1
L006bd6:
	suba.l	a0,a1
	move.w	a1,($61fe,a0)
	addq.b	#1,d5
	bne.s	L006b8c
	addq.w	#1,d7
	lea.l	($0020,a3),a3
	dbra.w	d6,L006b8a
	lea.l	(EntryPoint),a1
	lea.l	(Table5,pc),a0
	lea.l	(-$0126,sp),sp
	movea.l	a0,a2
	movea.l	a1,a4
	movea.l	sp,a1
	moveq.l	#$32,d4			;'2'
	moveq.l	#$00,d1
	moveq.l	#$30,d0			;'0'
L006c04:
	move.w	(a0)+,d2
	move.w	d2,d3
	asl.w	#3,d2
	sub.w	d3,d2
	asr.w	#2,d2
	addq.w	#1,d2
	move.w	d2,(a1)+
	addq.w	#1,d2
	moveq.l	#$fe,d3
	and.w	d3,d2
	move.w	d2,(a1)+
	move.w	d1,(a1)+
	add.w	d4,d1
	add.w	d2,d1
	dbra.w	d0,L006c04
	movea.l	a2,a0
	movea.l	sp,a1
	movea.l	a1,a3
	moveq.l	#$00,d1
	moveq.l	#$30,d0			;'0'
L006c2e:
	move.w	(a1)+,(a4)+
	move.w	(a1)+,d2
	add.w	d2,d2
	add.w	d2,d2
	move.w	(a1)+,d3
	move.w	(a0)+,d7
	lea.l	(L006c94,pc),a2
	moveq.l	#$07,d4
L006c40:
	addq.w	#6,d3
	move.w	d1,d5
	add.w	(a2)+,d5
	bpl.s	L006c4c
	moveq.l	#$00,d5
	bra.s	L006c54

L006c4c:
	cmpi.w	#$0031,d5		;'1'
	bcs.s	L006c54
	moveq.l	#$30,d5			;'0'
L006c54:
	move.w	d5,d6
	add.w	d5,d5
	add.w	d6,d5
	add.w	d5,d5
	move.w	(a2)+,(a4)+
	move.w	d7,d6
	muls.w	(a2)+,d6
	asr.w	#3,d6
	move.w	d6,(a4)+
	move.w	($04,a3,d5.w),d6
	sub.w	d3,d6
	move.w	d6,(a4)+
	dbra.w	d4,L006c40
	move.w	d7,d6
	move.b	(a2)+,d3
	moveq.l	#$00,d4
L006c78:
	cmp.w	d6,d4
	bls.s	L006c80
	add.w	d7,d6
	move.b	(a2)+,d3
L006c80:
	move.b	d3,(a4)+
	addq.w	#4,d4
	cmp.w	d2,d4
	bcs.s	L006c78
	addq.w	#1,d1
	dbra.w	d0,L006c2e
	lea.l	($0126,sp),sp
	rts

L006c94:
	.dc.w	$0008,$7777,$000f,$ffff
	.dc.w	$0000,$0001,$ffff,$1111
	.dc.w	$0003,$ffff,$2222,$0005
	.dc.w	$ffff,$3333,$0007,$0002
	.dc.w	$4444,$0009,$0004,$5555
	.dc.w	$000b,$0006,$6666,$000d
	.dc.w	$060c,$1218,$1e24,$2a00
L006ccc:
	.dc.w	$ffff,$ffff,$ffff,$ffff
	.dc.w	$0002,$0004,$0006,$0008
	.dc.w	$ffff,$ffff,$ffff,$ffff
	.dc.w	$0002,$0004,$0006,$0008
Table5:
	.dc.w	$0010,$0011,$0013,$0015
	.dc.w	$0017,$0019,$001c,$001f
	.dc.w	$0022,$0025,$0029,$002d
	.dc.w	$0032,$0037,$003c,$0042
	.dc.w	$0049,$0050,$0058,$0061
	.dc.w	$006b,$0076,$0082,$008f
	.dc.w	$009d,$00ad,$00be,$00d1
	.dc.w	$00e6,$00fd,$0117,$0133
	.dc.w	$0151,$0173,$0198,$01c1
	.dc.w	$01ee,$0220,$0256,$0292
	.dc.w	$02d4,$031c,$036c,$03c3
	.dc.w	$0424,$048e,$0502,$0583
	.dc.w	$0610
End:

	.end	EntryPoint
