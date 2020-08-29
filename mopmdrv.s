;=============================================
;  Filename mopmdrv.x
;
;
;  Base address 000000
;  Exec address 002458
;  Text size    002872 byte(s)
;  Data size    001258 byte(s)
;  Bss  size    0086be byte(s)
;  511 Labels
;
;  Commandline dis  -b2 -h -m68000 --sp -q1 -B -M -o120 -gmopmdrv.lab --overwrite mopmdrv.x mopmdrv.s
;          DIS version 3.16
;=============================================

	.include	inc/doscall.mac
	.include	inc/iocscall.mac
	.include	inc/fefunc.mac

	.cpu	68000

	.text

L000000:
	.dc.l	L000016
	.dc.w	$8020
	.dc.l	L00002c
	.dc.l	L000048
	.dc.w	$4f50,$4d20,$2020,$2020
L000016:
	.dc.w	$ffff,$ffff,$8020
	.dc.l	L00003a
	.dc.l	L000048
L000024:
	.dc.b	'MOPM    '
L00002c:
	clr.b	(L003ab6)
	move.l	a5,(L003ab2)
	rts

L00003a:
	st.b	(L003ab6)
	move.l	a5,(L003ab2)
	rts

L000048:
	movem.l	d0/a5,-(sp)
	movea.l	(L003ab2,pc),a5
	moveq.l	#$00,d0
L000052:
	move.b	($0002,a5),d0
	add.w	d0,d0
	move.w	(L000074,pc,d0.w),d0
	jsr	(L000074,pc,d0.w)
	addq.l	#3,a5
	move.b	d0,(a5)+
	lsr.w	#8,d0
	move.b	d0,(a5)+
L000068:
	clr.b	(L003ab6)
	movem.l	(sp)+,d0/a5
	rts

L000074:
	.dc.w	L002422-L000074
	.dc.w	L00008e-L000074
	.dc.w	L00008e-L000074
	.dc.w	L00008e-L000074
	.dc.w	L00008e-L000074
	.dc.w	L000320-L000074
	.dc.w	L000320-L000074
	.dc.w	L000320-L000074
	.dc.w	L0000ac-L000074
	.dc.w	L0000ac-L000074
	.dc.w	L000320-L000074
	.dc.w	L000320-L000074
	.dc.w	L00008e-L000074
L00008e:
	move.w	#$5003,d0
	rts

L000094:
	clr.b	(L005274)
	bra.s	L0000bc

L00009c:
	move.b	(L003ab6,pc),d1
	beq.w	L0002de
	st.b	(L005274)
	bra.s	L0000bc

	movem.l	d1-d7/a0-a6,-(sp)
	lea.l	(-$0200,sp),sp
	movea.l	($000e,a5),a4
	move.l	($0012,a5),d4
L0000bc:
	subq.l	#1,d4
	blt.w	L000318
	move.b	(a4)+,d0
	cmp.b	#$0a,d0
	beq.s	L000094
	cmp.b	#$0d,d0
	beq.s	L000094
	cmp.b	#$1a,d0
	beq.s	L000094
	move.b	(L005274,pc),d1
	bne.s	L0000bc
	cmp.b	#$21,d0			;'!'
	bcs.s	L0000bc
	cmp.b	#$2f,d0			;'/'
	beq.s	L00009c
	cmp.b	#$28,d0			;'('
	bne.w	L0002de
L0000f0:
	subq.l	#1,d4
	bmi.w	L000318
	move.b	(a4)+,d0
	cmp.b	#$20,d0			;' '
	beq.s	L0000f0
	bcs.s	L0000bc
	ori.b	#$20,d0
	cmp.b	#$69,d0			;'i'
	beq.s	L000184
	cmp.b	#$6d,d0			;'m'
	beq.w	L0001a4
	cmp.b	#$61,d0			;'a'
	beq.w	L0001d8
	cmp.b	#$76,d0			;'v'
	beq.w	L0001f8
	cmp.b	#$6f,d0			;'o'
	beq.w	L000240
	cmp.b	#$74,d0			;'t'
	beq.w	L000254
	cmp.b	#$70,d0			;'p'
	beq.w	L00027e
	cmp.b	#$77,d0			;'w'
	beq.w	L00028e
	cmp.b	#$73,d0			;'s'
	beq.w	L0002b0
	cmp.b	#$63,d0			;'c'
	beq.w	L0002c0
	cmp.b	#$64,d0			;'d'
	bne.s	L0000f0
	bsr.w	L0003be
	ble.w	L000264
	move.l	d1,d2
	movea.l	sp,a1
	moveq.l	#$03,d1
	bsr.w	L00040a
	bsr.w	L0003be
	ble.w	L000264
	move.l	d1,d2
	movea.l	sp,a1
	moveq.l	#$04,d1
	move.w	d0,-(sp)
	bsr.w	L00040a
	move.w	(sp)+,d0
	bra.w	L000264

L000184:
	clr.l	(L00524a)
	moveq.l	#$00,d1
	move.b	(a4),d0
	ori.b	#$20,d0
	cmp.b	#$69,d0			;'i'
	bne.s	L00019a
	moveq.l	#$14,d1
L00019a:
	bsr.w	L00040a
	moveq.l	#$00,d0
	bra.w	L000264

L0001a4:
	bsr.w	L0003be
	ble.w	L000264
	move.l	d1,d2
	bsr.w	L0003be
	ble.w	L000264
	swap.w	d2
	subq.l	#1,d1
	bcs.w	L000264
	cmp.l	#$0000ffff,d1
	bhi.w	L000264
	move.w	d1,d2
	moveq.l	#$01,d1
	move.w	d0,-(sp)
	bsr.w	L00040a
	move.w	(sp)+,d0
	bra.w	L000264

L0001d8:
	bsr.w	L0003be
	ble.w	L000264
	move.l	d1,d2
	bsr.w	L0003be
	ble.s	L000264
	swap.w	d2
	move.w	d1,d2
	moveq.l	#$02,d1
	move.w	d0,-(sp)
	bsr.w	L00040a
	move.w	(sp)+,d0
	bra.s	L000264

L0001f8:
	bsr.w	L0003be
	ble.s	L000264
	move.l	d1,d2
	movea.l	sp,a1
	moveq.l	#$03,d1
	bsr.w	L00040a
	bsr.w	L0003be
	ble.s	L000264
	cmp.l	#$00000037,d1
	bcc.s	L000264
	movea.l	sp,a1
	adda.l	d1,a1
	move.l	d1,d3
L00021c:
	bsr.w	L0003be
	blt.s	L000264
	move.b	d1,(a1)+
	cmp.b	#$29,d0			;')'
	beq.s	L000234
	addq.l	#1,d3
	cmp.b	#$37,d3			;'7'
	bcc.s	L000264
	bra.s	L00021c

L000234:
	movea.l	sp,a1
	moveq.l	#$04,d1
	bsr.w	L00040a
	bra.w	L0000bc

L000240:
	bsr.w	L0003be
	ble.s	L000264
	move.l	d1,d2
	moveq.l	#$05,d1
	move.w	d0,-(sp)
	bsr.w	L00040a
	move.w	(sp)+,d0
	bra.s	L000264

L000254:
	bsr.w	L0003be
	ble.s	L000264
	move.l	d1,(L00524a)
	bra.w	L000264

L000264:
	cmp.b	#$29,d0			;')'
	beq.w	L0000bc
	subq.l	#1,d4
	blt.w	L000318
	move.b	(a4)+,d0
	cmp.b	#$20,d0			;' '
	bcs.w	L0000bc
	bra.s	L000264

L00027e:
	bsr.w	L0003a8
	blt.s	L000264
	moveq.l	#$08,d1
	bsr.w	L00040a
	bra.w	L0000bc

L00028e:
	bsr.w	L0003a8
	blt.s	L000264
L000294:
	moveq.l	#$09,d1
	bsr.w	L00040a
	tst.w	d0
	beq.w	L0000bc
	moveq.l	#$0c,d1
	IOCS	_BITSNS
	btst.l	#$01,d0
	bne.w	L0000bc
	bra.s	L000294

L0002b0:
	bsr.w	L0003a8
	blt.s	L000264
	moveq.l	#$0a,d1
	bsr.w	L00040a
	bra.w	L0000bc

L0002c0:
	bsr.w	L0003a8
	blt.s	L000264
	moveq.l	#$0b,d1
	bsr.w	L00040a
	bra.w	L0000bc

L0002d0:
	move.b	(L003ab6,pc),d1
	beq.s	L0002e0
	st.b	(L005274)
	bra.s	L0002e2

L0002de:
	movea.l	sp,a1
L0002e0:
	move.b	d0,(a1)+
L0002e2:
	subq.l	#1,d4
	blt.s	L000312
	move.b	(a4)+,d0
	cmp.b	#$20,d0			;' '
	bcs.s	L000306
	move.b	(L005274,pc),d1
	bne.s	L0002e2
	cmp.b	#$2f,d0			;'/'
	beq.s	L0002d0
	cmp.b	#$28,d0			;'('
	bne.s	L0002e0
	lea.l	(L0000f0,pc),a2
	bra.s	L000324

L000306:
	clr.b	(L005274)
	lea.l	(L0000bc,pc),a2
	bra.s	L000324

L000312:
	lea.l	(L000318,pc),a2
	bra.s	L000324

L000318:
	lea.l	($0200,sp),sp
	movem.l	(sp)+,d1-d7/a0-a6
	clr.w	d0
	rts

L000324:
	clr.b	(a1)
	movea.l	sp,a1
	move.l	(L00524a,pc),d2
	moveq.l	#$06,d1
	bsr.w	L00040a
	tst.l	d0
	beq.s	L00036c
	move.b	($3786,pc),d1
	bne.s	L00036c
	move.b	($080e),d1
	andi.b	#$02,d1
	beq.s	L00036c
	lea.l	($0050,pc),a1
	bsr.s	L00036e
	move.l	(L00524a,pc),d0
	lea.l	($0050,pc),a1
	bsr.s	L00036e
	lea.l	($003d,pc),a1
	IOCS	_B_PRINT
	movea.l	sp,a1
	IOCS	_B_PRINT
	lea.l	(L000392,pc),a1
	IOCS	_B_PRINT
L00036c:
	jmp	(a2)

L00036e:
	divu.w	#$0064,d0
	addi.b	#$30,d0			;'0'
	move.b	d0,(a1)+
	clr.w	d0
	swap.w	d0
	divu.w	#$000a,d0
	addi.b	#$30,d0			;'0'
	move.b	d0,(a1)+
	clr.w	d0
	swap.w	d0
	addi.b	#$30,d0			;'0'
	move.b	d0,(a1)
	rts

L000392:
	.dc.b	$0d,$0a,$00
	.dc.b	'err000 in trk000 ',$00,$00
L0003a8:
	moveq.l	#$00,d2
L0003aa:
	bsr.s	L0003be
	tst.l	d1
	beq.s	L0003b4
	subq.b	#1,d1
	bset.l	d1,d2
L0003b4:
	cmp.b	#$29,d0			;')'
	bne.s	L0003aa
	tst.l	d4
	rts

L0003be:
	moveq.l	#$00,d0
	moveq.l	#$00,d1
L0003c2:
	move.b	(a4)+,d0
	subq.l	#1,d4
	blt.s	L0003fe
	cmp.b	#$20,d0			;' '
	beq.s	L0003c2
	cmp.b	#$09,d0
	beq.s	L0003c2
	cmp.b	#$0d,d0
	beq.s	L0003c2
	cmp.b	#$0a,d0
	beq.s	L0003c2
L0003e0:
	cmp.b	#$30,d0			;'0'
	bcs.s	L0003fe
	cmp.b	#$39,d0			;'9'
	bhi.s	L0003fe
	sub.b	#$30,d0			;'0'
	add.l	d1,d1
	add.l	d1,d0
	lsl.l	#2,d1
	add.l	d0,d1
	move.b	(a4)+,d0
	subq.l	#1,d4
	bge.s	L0003e0
L0003fe:
	tst.l	d4
	rts

L000402:
	.dc.b	'MEWOPM',$01,$00
L00040a:
	movem.l	d1-d7/a1-a6,-(sp)
	cmp.w	#$ffff,d1
	beq.s	L000474
	cmp.w	#$fffe,d1
	beq.s	L00046c
	moveq.l	#$ff,d0
	cmp.w	#$001d,d1
	bcc.s	L00042c
	add.w	d1,d1
	move.w	(Table3,pc,d1.w),d1
	jsr	(Table3,pc,d1.w)
L00042c:
	movem.l	(sp)+,d1-d7/a1-a6
	rts

Table3:
	.dc.w	L000ab0-Table3
	.dc.w	L0004c8-Table3
	.dc.w	L000548-Table3
	.dc.w	L00059a-Table3
	.dc.w	L0005c0-Table3
	.dc.w	L0005e6-Table3
	.dc.w	L000616-Table3
	.dc.w	L000636-Table3
	.dc.w	L000662-Table3
	.dc.w	L000788-Table3
	.dc.w	L0007cc-Table3
	.dc.w	L000864-Table3
	.dc.w	L000966-Table3
	.dc.w	L00098a-Table3
	.dc.w	L0009ca-Table3
	.dc.w	L000a34-Table3
	.dc.w	L000a42-Table3
	.dc.w	L000a74-Table3
	.dc.w	L000a7a-Table3
	.dc.w	L000a98-Table3
	.dc.w	L000aac-Table3
	.dc.w	L000a80-Table3
	.dc.w	L000aa0-Table3
	.dc.w	L000aa8-Table3
	.dc.w	L000a86-Table3
	.dc.w	L000938-Table3
	.dc.w	L000a00-Table3
	.dc.w	L0009f2-Table3
	.dc.w	L0008e2-Table3
L00046c:
	moveq.l	#$00,d0
	move.w	(-$0068,pc),d0
	bra.s	L00042c

L000474:
	moveq.l	#$fe,d0
	move.l	(L00523a,pc),d1
	bne.s	L00042c
	bsr.w	L0009ca
	move.l	(L005242,pc),-(sp)
	move.w	#$01f0,-(sp)
	DOS	_INTVCS
	addq.l	#6,sp
	bsr.s	$000004b0
	tst.b	(UnknownVar1)
	beq.s	L0004aa
	pea.l	(L000000-$0000f0,pc)
	DOS	_MFREE
	addq.l	#4,sp
	tst.l	d0
	bmi.s	L0004a6
	moveq.l	#$00,d0
	bra.s	L00042c

L0004a6:
	moveq.l	#$ff,d0
	bra.s	L00042c

L0004aa:
	moveq.l	#$01,d0
	bra.w	L00042c

	move.l	#L000000,d0
	lea.l	($1cb6),a0
	bra.s	L0004be

L0004bc:
	movea.l	(a0),a0
L0004be:
	cmp.l	(a0),d0
	bne.s	L0004bc
	move.l	(L000016,pc),(a0)
	rts

L0004c8:
	bsr.w	L000bd4
	bsr.w	L0007c0
	moveq.l	#$00,d1
	move.w	d2,d1
	swap.w	d2
	subq.w	#1,d2
	cmp.w	#$00f9,d2
	bhi.w	L000be6
	addq.l	#1,d1
	add.w	d2,d2
	add.w	d2,d2
	lea.l	($39ca,pc),a0
	move.l	d1,(a0,d2.w)
	bsr.s	L000510
	bmi.s	L000502
	bsr.w	L000ba4
	bsr.w	L000b80
	bsr.w	L000bba
	moveq.l	#$00,d0
	rts

L000502:
	lea.l	($39ae,pc),a0
	moveq.l	#$01,d1
	move.l	d1,(a0,d2.w)
	moveq.l	#$05,d0
	rts

L000510:
	lea.l	($39a0,pc),a0
	moveq.l	#$00,d0
	move.w	#$00f9,d1
L00051a:
	add.l	(a0)+,d0
	dbra.w	d1,L00051a
	cmp.l	(L003ac6,pc),d0
	bcc.s	L00052c
	move.l	(L003ac2,pc),d0
	rts

L00052c:
	moveq.l	#$ff,d0
	rts

L000530:
	lea.l	($4d38,pc),a0
	moveq.l	#$00,d0
L000536:
	move.b	d0,(a0,d0.w)
	addq.w	#1,d0
	cmp.w	#$0008,d0
	bne.s	L000536
	st.b	(a0,d0.w)
	rts

L000548:
	bsr.w	L000bd4
	lea.l	($4d1c,pc),a0
	move.l	d2,d1
	swap.w	d1
	subq.w	#1,d1
	moveq.l	#$07,d3
	move.b	(L003ab6,pc),d0
	beq.s	L000560
	moveq.l	#$08,d3
L000560:
	cmp.w	d3,d1
	bhi.w	L000bee
	tst.w	d2
	beq.s	L000592
	cmp.w	#$00ff,d2
	beq.s	L000582
	subq.w	#1,d2
	cmp.w	#$00f9,d2
	bhi.w	L000be6
	move.b	d2,(a0,d1.w)
	moveq.l	#$00,d0
	rts

L000582:
	cmp.w	#$0008,d1
	bne.w	L000be6
	move.b	d2,(a0,d1.w)
	moveq.l	#$00,d0
	rts

L000592:
	moveq.l	#$01,d0
	add.b	(a0,d1.w),d0
	rts

L00059a:
	bsr.w	L000bd4
	subq.l	#1,d2
	cmp.l	#$000000c8,d2
	bcc.w	L000bf2
	mulu.w	#$0037,d2
	lea.l	(L00568f,pc),a0
	adda.l	d2,a0
	moveq.l	#$36,d0			;'6'
L0005b6:
	move.b	(a0)+,(a1)+
	dbra.w	d0,L0005b6
	moveq.l	#$00,d0
	rts

L0005c0:
	bsr.w	L000bd4
	subq.l	#1,d2
	cmp.l	#$000000c8,d2
	bcc.w	L000bf2
	mulu.w	#$0037,d2
	lea.l	(L00568f,pc),a0
	adda.l	d2,a0
	moveq.l	#$36,d0			;'6'
L0005dc:
	move.b	(a1)+,(a0)+
	dbra.w	d0,L0005dc
	moveq.l	#$00,d0
	rts

L0005e6:
	bsr.w	L000bd4
	tst.l	d2
	bmi.s	L00060e
	cmp.w	#$00c8,d2
	bhi.w	L000be2
	cmp.w	#$0020,d2		;' '
	bcs.w	L000be2
	move.b	d2,(L00568e)
	move.w	d2,d0
	bsr.w	L00196e
	moveq.l	#$00,d0
	rts

L00060e:
	moveq.l	#$00,d0
	move.b	(L00568d,pc),d0
	rts

L000616:
	bsr.w	L000bd4
	subq.l	#1,d2
	move.l	#$000000fa,d0
	cmp.l	d0,d2
	bcc.w	L000be6
	movea.l	a1,a0
	move.l	d2,d0
	bsr.w	L000bf6
	move.l	(L00524e,pc),d0
	rts

L000636:
	bsr.w	L000bd4
	subq.w	#1,d2
	cmp.w	#$00fa,d2
	bcc.w	L000be6
	move.w	d2,d0
	bsr.w	L001798
	move.l	(a1),d0
	add.w	d2,d2
	add.w	d2,d2
	lea.l	($3860,pc),a0
	add.l	(a0,d2.w),d0
	lea.l	(L003aca,pc),a0
	sub.l	(a0,d2.w),d0
	rts

L000662:
	bsr.w	L000bd4
	tst.l	d2
	bne.s	L00066c
	moveq.l	#$ff,d2
L00066c:
	move.l	d2,-(sp)
	moveq.l	#$00,d2
	bsr.w	L000788
	move.l	(sp)+,d2
	move.l	d0,d3
	lea.l	(L005386,pc),a5
	lea.l	($4bec,pc),a0
	lea.l	(L003aca,pc),a1
	moveq.l	#$00,d7
	moveq.l	#$07,d1
	move.w	sr,-(sp)
	ori.w	#$0700,sr
L00068e:
	lsr.w	#1,d2
	bcc.s	L0006de
	bsr.w	L001cde
	moveq.l	#$00,d0
	move.b	(a0,d7.w),d0
	add.w	d0,d0
	add.w	d0,d0
	move.l	(a1,d0.w),($0002,a5)
	clr.w	(a5)
	clr.b	($0016,a5)
	clr.b	($0018,a5)
	clr.b	($001e,a5)
	clr.b	($0020,a5)
	clr.b	($0026,a5)
	clr.b	($0044,a5)
	clr.b	($0046,a5)
	clr.l	($004c,a5)
	move.b	#$15,($003c,a5)
	move.l	#$01010000,($0050,a5)
	move.b	#$01,($0014,a5)
	bset.l	d7,d3
L0006de:
	addq.b	#1,d7
	lea.l	($0056,a5),a5
	dbra.w	d1,L00068e
	move.b	($4b88,pc),d0
	cmp.b	#$ff,d0
	beq.s	L000746
	lsr.w	#1,d2
	bcc.s	L000746
	moveq.l	#$00,d1
	IOCS	_ADPCMMOD
	moveq.l	#$00,d0
	move.b	(a0,d7.w),d0
	add.w	d0,d0
	add.w	d0,d0
	move.l	(a1,d0.w),($0002,a5)
	clr.w	(a5)
	clr.b	($0016,a5)
	clr.b	($0018,a5)
	clr.b	($001e,a5)
	clr.b	($0020,a5)
	clr.b	($0026,a5)
	clr.b	($0044,a5)
	clr.b	($0046,a5)
	clr.l	($004c,a5)
	move.b	#$15,($003c,a5)
	move.l	#$01010000,($0050,a5)
	move.b	#$01,($0014,a5)
	bset.l	#$08,d3
L000746:
	move.w	d3,(L005262)
	move.w	#$0040,(L005264)	;'@'
	clr.l	(L005280)
	clr.b	(L00568c)
	move.w	d3,d4
	move.w	d3,d5
	and.w	(L00527a,pc),d4
	beq.s	L00076e
	bsr.w	L0019ce
L00076e:
	and.w	(L005278,pc),d5
	beq.s	L000778
	bsr.w	L0019c2
L000778:
	move.b	(L005276,pc),d2
	moveq.l	#$14,d1
	IOCS	_OPMSET
	moveq.l	#$00,d0
	move.w	(sp)+,sr
	rts

L000788:
	bsr.w	L000bd4
	moveq.l	#$00,d0
	moveq.l	#$08,d1
	lea.l	(L005386,pc),a5
L000794:
	move.b	($0014,a5),d3
	lsr.b	#1,d3
	roxr.w	#1,d0
	lea.l	($0056,a5),a5
	dbra.w	d1,L000794
	lsr.w	#7,d0
	move.b	($4aca,pc),d1
	cmp.b	#$ff,d1
	bne.s	L0007b4
	and.w	#$00ff,d0
L0007b4:
	tst.l	d2
	beq.s	L0007be
	and.w	d2,d0
	beq.s	L0007be
	moveq.l	#$01,d0
L0007be:
	rts

L0007c0:
	movem.l	d0-d2,-(sp)
	bsr.s	L0007ea
	movem.l	(sp)+,d0-d2
	rts

L0007cc:
	bsr.w	L000bd4
	tst.l	d2
	beq.s	L0007ea
	moveq.l	#$00,d0
	move.b	($4a9a,pc),d0
	cmp.b	#$ff,d0
	beq.s	L0007e4
	move.w	#$01ff,d0
L0007e4:
	and.w	d0,d2
	cmp.w	d0,d2
	bne.s	L0007ec
L0007ea:
	moveq.l	#$ff,d2
L0007ec:
	lea.l	(L005386,pc),a5
	moveq.l	#$00,d7
	moveq.l	#$07,d1
	move.w	sr,-(sp)
	ori.w	#$0700,sr
L0007fa:
	lsr.w	#1,d2
	bcc.s	L000806
	bsr.w	L001cde
	clr.b	($0014,a5)
L000806:
	addq.b	#1,d7
	lea.l	($0056,a5),a5
	dbra.w	d1,L0007fa
	lsr.w	#1,d2
	bcc.s	L000828
	clr.b	($0014,a5)
	move.b	($4a58,pc),d0
	cmp.b	#$ff,d0
	beq.s	L000828
	moveq.l	#$00,d1
	IOCS	_ADPCMMOD
L000828:
	moveq.l	#$00,d2
	bsr.w	L000788
	move.w	d0,d4
	move.w	d0,d5
	move.w	d0,d6
	and.w	(L00527a,pc),d4
	bne.s	L00083e
	bsr.w	L0019f6
L00083e:
	and.w	(L005278,pc),d5
	bne.s	L000848
	bsr.w	L0019ec
L000848:
	and.w	(L005284,pc),d6
	bne.s	L00085e
	move.b	(L005280),(L005281)
	clr.b	(L005280)
L00085e:
	moveq.l	#$00,d0
	move.w	(sp)+,sr
	rts

L000864:
	bsr.w	L000bd4
	tst.l	d2
	beq.s	L000882
	moveq.l	#$00,d0
	move.b	($4a02,pc),d0
	cmp.b	#$ff,d0
	beq.s	L00087c
	move.w	#$01ff,d0
L00087c:
	and.w	d0,d2
	cmp.w	d0,d2
	bne.s	L000884
L000882:
	moveq.l	#$ff,d2
L000884:
	lea.l	(L005386,pc),a5
	moveq.l	#$08,d1
	move.w	sr,-(sp)
	ori.w	#$0700,sr
L000890:
	lsr.w	#1,d2
	bcc.s	L00089a
	move.b	#$01,($0014,a5)
L00089a:
	lea.l	($0056,a5),a5
	dbra.w	d1,L000890
	moveq.l	#$00,d2
	bsr.w	L000788
	move.w	d0,d4
	move.w	d0,d5
	move.w	d0,d6
	and.w	(L00527a,pc),d4
	beq.s	L0008b8
	bsr.w	L0019ce
L0008b8:
	and.w	(L005278,pc),d5
	beq.s	L0008c2
	bsr.w	L0019c2
L0008c2:
	and.w	(L005284,pc),d6
	beq.s	L0008d2
	move.b	(L005281),(L005280)
L0008d2:
	move.b	(L005276,pc),d2
	moveq.l	#$14,d1
	IOCS	_OPMSET
	moveq.l	#$00,d0
	move.w	(sp)+,sr
	rts

L0008e2:
	bsr.w	L000bd4
	move.w	d2,d0
	swap.w	d2
	subq.w	#1,d2
	cmpi.w	#$0007,d2
	bhi.w	L000bee
	move.w	d2,d7
	mulu.w	#$0056,d2
	lea.l	(L005386,pc),a5
	adda.w	d2,a5
	moveq.l	#$00,d2
	move.b	($0053,a5),d2
	move.w	d0,d1
	bmi.s	L000934
	subq.w	#1,d0
	cmpi.w	#$00c8,d0
	bcc.w	L000bee
	move.b	d1,($0053,a5)
	move.w	sr,-(sp)
	ori.w	#$0700,sr
	bsr.w	L0020f4
	move.b	($0054,a5),d2
	moveq.l	#$30,d1			;'0'
	or.b	d7,d1
	IOCS	_OPMSET
	move.l	d2,d0
	move.w	(sp)+,sr
	rts

L000934:
	move.l	d2,d0
	rts

L000938:
	moveq.l	#$ff,d0
	move.b	d2,d0
	lsl.w	#8,d0
	move.l	d0,(L005280)
L000944:
	move.w	(L005278,pc),d0
	lsr.w	#8,d2
	andi.b	#$03,d2
	beq.s	L00095c
	move.w	(L00527a,pc),d0
	subq.b	#1,d2
	beq.s	L00095c
	move.w	#$01ff,d0
L00095c:
	move.w	d0,(L005284)
	moveq.l	#$00,d0
	rts

L000966:
	bsr.w	L000bd4
	bsr.w	L0007c0
	bsr.w	L000b28
	subq.w	#1,d2
	cmp.w	#$0009,d2
	bcc.w	L000bea
	mulu.w	#$0056,d2
	lea.l	(L005386,pc),a5
	move.l	($02,a5,d2.w),d0
	rts

L00098a:
	bsr.w	L0007c0
	lea.l	($3522,pc),a0
	move.w	#$00f9,d0
	moveq.l	#$01,d1
L000998:
	move.l	d1,(a0)+
	dbra.w	d0,L000998
	bsr.w	L000510
	bmi.s	L0009c2
	clr.b	(L005273)
	bsr.w	L000ba4
	bsr.w	L000ab0
	bsr.w	L001914
	move.b	(L005276,pc),d2
	moveq.l	#$14,d1
	IOCS	_OPMSET
	moveq.l	#$00,d0
L0009c2:
	move.b	d0,(L005273)
	rts

L0009ca:
	tst.b	(L005273)
	bne.s	L0009f0
	bsr.w	L0007c0
	suba.l	a1,a1
	IOCS	_OPMINTST
	moveq.l	#$30,d2			;'0'
	moveq.l	#$14,d1
	IOCS	_OPMSET
	move.l	(L005246,pc),($010c)
	st.b	(L005273)
L0009f0:
	rts

L0009f2:
	moveq.l	#$00,d0
	move.b	(L005277,pc),d0
	clr.b	(L005277)
	rts

L000a00:
	cmpi.b	#$3f,(L005276)		;'?'
	bne.s	L000a30
	tst.l	d2
	bmi.s	L000a28
	andi.w	#$01ff,d2
	move.w	d2,d1
	eori.w	#$01ff,d1
	move.w	d2,(L00527a)
	move.w	d1,(L005278)
	moveq.l	#$00,d0
	rts

L000a28:
	moveq.l	#$00,d0
	move.w	(L00527a,pc),d0
	rts

L000a30:
	moveq.l	#$ff,d0
	rts

L000a34:
	move.l	a1,(L003ac2)
	move.l	d2,(L003ac6)
	bra.s	L000ab0

	lea.l	($47fa,pc),a0
	lea.l	($05a0),a2
	move.l	a1,d1
	beq.s	L000a64
	tst.l	(a0)
	bne.s	L000a5a
	move.l	(a2),(a0)
	move.l	#L0023b4,(a2)
L000a5a:
	lea.l	(L00523a,pc),a0
	move.l	(a0),d0
	move.l	d1,(a0)
	rts

L000a64:
	move.l	(a0),d0
	beq.s	L000a72
	move.l	d0,(a2)
	clr.l	(a0)
	clr.l	(L00523a)
L000a72:
	rts

L000a74:
	move.l	(L00523a,pc),d0
	rts

L000a7a:
	lea.l	(L003ab8,pc),a0
	bra.s	L000a8a

	lea.l	(L003ab6,pc),a0
	bra.s	L000a8a

	lea.l	($47de,pc),a0
L000a8a:
	tst.l	d2
	beq.s	L000a90
	moveq.l	#$01,d2
L000a90:
	moveq.l	#$00,d0
	move.b	(a0),d0
	move.b	d2,(a0)
	rts

L000a98:
	move.l	#L005286,d0
	rts

L000aa0:
	move.l	#L005386,d0
	rts

L000aa8:
	moveq.l	#$56,d0			;'V'
	rts

L000aac:
	moveq.l	#$ff,d0
	bra.s	L000ab2

L000ab0:
	moveq.l	#$00,d0
L000ab2:
	bsr.w	L000bd4
	bsr.w	L0007c0
	bsr.w	L00233a
	bsr.w	L000530
	lea.l	($33ee,pc),a0
	move.w	#$00f9,d0
	moveq.l	#$01,d1
L000acc:
	move.l	d1,(a0)+
	dbra.w	d0,L000acc
	bsr.w	L000510
	bsr.w	L000ba4
	bsr.w	L000b80
	bsr.w	L000bba
	bsr.s	L000b28
	lea.l	($37b4,pc),a1
	move.w	#$00f9,d0
L000aec:
	move.l	#$04003008,($0004,a1)
	lea.l	($0010,a1),a1
	dbra.w	d0,L000aec
	clr.l	(L005280)
	clr.b	(L00568c)
L000b08:
	lea.l	(L005286,pc),a0
L000b0c:
	clr.b	($0002,a0)
	clr.b	($000e,a0)
	move.b	#$03,($0003,a0)
	move.b	#$04,($000d,a0)
	bsr.w	L00194e
	moveq.l	#$00,d0
	rts

L000b28:
	clr.b	d0
L000b2a:
	bsr.s	L000b36
	addq.b	#1,d0
	cmp.b	#$09,d0
	bne.s	L000b2a
	rts

L000b36:
	movem.l	d0-d1/a0/a5,-(sp)
	moveq.l	#$00,d1
L000b3c:
	move.b	d0,d1
	lea.l	($472a,pc),a0
	moveq.l	#$00,d0
	move.b	(a0,d1.w),d0
	cmp.b	#$ff,d0
	beq.s	L000b6a
	add.w	d0,d0
	add.w	d0,d0
	lea.l	(L003aca,pc),a0
	mulu.w	#$0056,d1
	lea.l	(L005386,pc),a5
	move.l	(a0,d0.w),($02,a5,d1.w)
	movem.l	(sp)+,d0-d1/a0/a5
	rts

L000b6a:
	mulu.w	#$0056,d1
	lea.l	(L005386,pc),a5
	move.l	#L001c2e,($02,a5,d1.w)
	movem.l	(sp)+,d0-d1/a0/a5
	rts

L000b80:
	movem.l	d0/a0-a1,-(sp)
	lea.l	(L003aca,pc),a0
	lea.l	($3710,pc),a1
	move.w	#$00f9,d0
L000b90:
	move.l	(a0)+,(a1)
	clr.l	($000a,a1)
	lea.l	($0010,a1),a1
	dbra.w	d0,L000b90
	movem.l	(sp)+,d0/a0-a1
	rts

L000ba4:
	lea.l	(L003aca,pc),a0
	lea.l	($3308,pc),a1
	move.w	#$00f9,d1
L000bb0:
	move.l	d0,(a0)+
	add.l	(a1)+,d0
	dbra.w	d1,L000bb0
	rts

L000bba:
	movem.l	d0/a0-a1,-(sp)
	lea.l	(L003aca,pc),a0
	move.w	#$00f9,d0
L000bc6:
	movea.l	(a0)+,a1
	st.b	(a1)
	dbra.w	d0,L000bc6
	movem.l	(sp)+,d0/a0-a1
	rts

L000bd4:
	tst.b	(L005273)
	beq.s	L000be0
	moveq.l	#$09,d0
	addq.l	#4,sp
L000be0:
	rts

L000be2:
	moveq.l	#$01,d0
	rts

L000be6:
	moveq.l	#$02,d0
	rts

L000bea:
	moveq.l	#$03,d0
	rts

L000bee:
	moveq.l	#$06,d0
	rts

L000bf2:
	moveq.l	#$08,d0
	rts

L000bf6:
	link.w	a6,#-$0014
	move.l	d0,(L00525e)
	clr.l	(L00524e)
	clr.l	(L005256)
	clr.l	(L00525a)
	bsr.w	L001798
L000c16:
	bsr.w	L001604
	moveq.l	#$00,d0
	move.b	(a0)+,d0
	beq.w	L000d6e
	bsr.w	L001786
	tst.b	(L003ab6)
L000c2c:
	beq.s	L000c5e
	cmp.b	#$4b,d0			;'K'
	beq.w	L0014ae
	cmp.b	#$57,d0			;'W'
	beq.w	L000d7a
	cmp.b	#$7e,d0			;'~'
	beq.w	L0014de
	cmp.b	#$5f,d0			;'_'
	beq.w	L001510
	cmp.b	#$54,d0			;'T'
	beq.w	L001270
	cmp.b	#$58,d0			;'X'
	beq.w	L001486
L000c5e:
	cmp.b	#$4f,d0			;'O'
	beq.w	L0010e0
	cmp.b	#$4c,d0			;'L'
	beq.w	L001120
	cmp.b	#$52,d0			;'R'
	beq.w	L0010ae
	cmp.b	#$56,d0			;'V'
	beq.w	L001446
	cmp.b	#$3c,d0			;'<'
	beq.w	L0010fe
	cmp.b	#$3e,d0			;'>'
	beq.w	L001110
	cmp.b	#$54,d0			;'T'
	beq.w	L001282
	cmp.b	#$40,d0			;'@'
	beq.w	L001192
	cmp.b	#$26,d0			;'&'
	beq.w	L00109a
	cmp.b	#$51,d0			;'Q'
	beq.w	L0010b8
	cmp.b	#$7c,d0			;'|'
	beq.w	L00100a
	cmp.b	#$3a,d0			;':'
	beq.w	L00107c
	cmp.b	#$5b,d0			;'['
	beq.w	L000f26
	cmp.b	#$7b,d0			;'{'
	beq.w	L000e64
	cmp.b	#$7d,d0			;'}'
	beq.w	L000e78
	cmp.b	#$59,d0			;'Y'
	beq.w	L000dd4
	cmp.b	#$50,d0			;'P'
	beq.w	L000daa
	bsr.w	L001724
	tst.w	d0
	bmi.s	L000cfa
	bsr.w	L001542
L000cf2:
	clr.b	($0005,a1)
	bra.w	L000c16

L000cfa:
	moveq.l	#$13,d0
	bra.s	L000d64

L000cfe:
	moveq.l	#$14,d0
	bra.s	L000d64

L000d02:
	moveq.l	#$15,d0
	bra.s	L000d64

L000d06:
	moveq.l	#$16,d0
	bra.s	L000d64

L000d0a:
	moveq.l	#$17,d0
	bra.s	L000d64

L000d0e:
	moveq.l	#$18,d0
	bra.s	L000d64

L000d12:
	moveq.l	#$19,d0
	bra.s	L000d64

L000d16:
	moveq.l	#$1a,d0
	bra.s	L000d64

L000d1a:
	moveq.l	#$1b,d0
	bra.s	L000d64

	moveq.l	#$1c,d0
	bra.s	L000d64

L000d22:
	moveq.l	#$1d,d0
	bra.s	L000d64

L000d26:
	moveq.l	#$1f,d0
	bra.s	L000d64

L000d2a:
	moveq.l	#$20,d0			;' '
	bra.s	L000d64

L000d2e:
	moveq.l	#$21,d0			;'!'
	bra.s	L000d64

L000d32:
	moveq.l	#$22,d0			;'"'
	bra.s	L000d64

L000d36:
	moveq.l	#$23,d0			;'#'
	bra.s	L000d64

L000d3a:
	moveq.l	#$24,d0			;'$'
	bra.s	L000d64

L000d3e:
	moveq.l	#$26,d0			;'&'
	bra.s	L000d64

L000d42:
	moveq.l	#$27,d0			;'''
	bra.s	L000d64

L000d46:
	moveq.l	#$29,d0			;')'
	bra.s	L000d64

L000d4a:
	moveq.l	#$2a,d0			;'*'
	bra.s	L000d64

L000d4e:
	moveq.l	#$2b,d0			;'+'
	bra.s	L000d64

L000d52:
	moveq.l	#$2c,d0			;','
	bra.s	L000d64

L000d56:
	moveq.l	#$2d,d0			;'-'
	bra.s	L000d64

L000d5a:
	moveq.l	#$2e,d0			;'.'
	bra.s	L000d64

L000d5e:
	moveq.l	#$2f,d0			;'/'
	bra.s	L000d64

L000d62:
	moveq.l	#$30,d0			;'0'
L000d64:
	move.l	d0,(L00524e)
L000d6a:
	unlk	a6
	rts

L000d6e:
	tst.l	(L005256)
	beq.s	L000d6a
	moveq.l	#$28,d0			;'('
	bra.s	L000d64

L000d7a:
	bsr.w	L00160c
	tst.b	d0
	bmi.s	L000d90
	bsr.w	L00174a
	cmp.l	#$000000ff,d0
	bhi.s	L000d56
	bra.s	L000d92

L000d90:
	moveq.l	#$00,d0
L000d92:
	move.l	d0,d1
	moveq.l	#$b0,d0
	bsr.w	L00115c
	moveq.l	#$0f,d0
	bsr.w	L00115c
	move.l	d1,d0
	bsr.w	L00115c
	bra.w	L000c16

L000daa:
	bsr.w	L00160c
	tst.b	d0
	bmi.s	L000d5e
	bsr.w	L00174a
	cmp.l	#$00000003,d0
	bhi.s	L000d5e
	move.l	d0,d1
	moveq.l	#$e0,d0
	bsr.w	L00115c
	move.l	d1,d0
	bsr.w	L00115c
	bsr.w	L001152
	bra.w	L000c16

L000dd4:
	bsr.w	L00160c
	tst.b	d0
	bmi.w	L000d56
	bsr.w	L00174a
	cmp.l	#$000000ff,d0
	bhi.w	L000d56
	cmp.b	#$01,d0
	beq.w	L000d56
	cmp.b	#$10,d0
	beq.w	L000d56
	cmp.b	#$11,d0
	beq.w	L000d56
	cmp.b	#$12,d0
	beq.w	L000d56
	cmp.b	#$14,d0
	beq.w	L000d56
	move.w	d0,-(sp)
	bsr.w	L001604
	cmpi.b	#$2c,(a0)+		;','
	bne.w	L000d56
	bsr.w	L001604
	bsr.w	L00160c
	tst.b	d0
	bmi.w	L000d56
	bsr.w	L00174a
	cmp.l	#$000000ff,d0
	bhi.w	L000d56
	move.w	d0,-(sp)
	moveq.l	#$b0,d0
	bsr.w	L00115c
	move.w	(sp)+,d1
	move.w	(sp)+,d0
	bsr.w	L00115c
	move.b	d1,d0
	bsr.w	L00115c
	bra.w	L000c16

L000e58:
	tst.l	(L005256)
	bne.w	L000d52
	rts

L000e64:
	move.l	(a1),d0
	move.l	d0,(L005252)
	moveq.l	#$01,d0
	move.l	d0,(L005256)
	bra.w	L000c16

L000e78:
	clr.l	(L005256)
	bsr.w	L00160c
	bmi.s	L000ea6
	bsr.w	L00174a
	tst.l	d0
	beq.w	L000d1a
	cmp.l	#$00000040,d0
	bhi.w	L000d1a
	move.l	#$000000c0,d1
	divu.w	d0,d1
	moveq.l	#$00,d0
	move.w	d1,d0
	bra.s	L000eac

L000ea6:
	moveq.l	#$00,d0
	move.b	($0006,a1),d0
L000eac:
	move.l	(L00525a,pc),d1
	beq.w	L000d4a
	cmp.l	d1,d0
	bcs.w	L000d46
	divu.w	d1,d0
	moveq.l	#$00,d1
	move.w	d0,d1
	clr.w	d0
	swap.w	d0
	moveq.l	#$00,d2
	move.w	d0,d2
	movea.l	(L005252,pc),a2
L000ecc:
	tst.b	(a2)
	bmi.s	L000efc
	move.b	($0001,a2),d0
	cmp.b	($0002,a2),d0
	bne.s	L000ee6
	bsr.s	L000f1a
	move.b	d0,($0001,a2)
	move.b	d0,($0002,a2)
	bra.s	L000ef6

L000ee6:
	bsr.s	L000f1a
	move.b	d0,($0001,a2)
	move.b	d1,d0
	bsr.w	L0015c6
	move.b	d0,($0002,a2)
L000ef6:
	subq.l	#1,(L00525a)
L000efc:
	cmpi.b	#$f0,(a2)
	bne.s	L000f0c
	cmpi.b	#$0e,($0001,a2)
	bne.s	L000f0c
	addq.l	#1,a2
L000f0c:
	addq.l	#3,a2
	tst.l	(L00525a)
L000f14:
	bne.s	L000ecc
L000f16:
	bra.w	L000c16

L000f1a:
	move.l	d1,d0
	tst.l	d2
	beq.s	L000f24
	addq.l	#1,d0
	subq.l	#1,d2
L000f24:
	rts

L000f26:
	bsr.w	L001604
	bsr.s	L000f90
	bmi.w	L000cfe
	bsr.w	L001604
	cmpi.b	#$5d,(a0)+		;']'
	bne.w	L000d02
	add.w	d0,d0
	move.w	(L000f46,pc,d0.w),d0
	jmp	(L000f46,pc,d0.w)

L000f46:
	.dc.w	L000f5c-L000f46
	.dc.w	L000f78-L000f46
	.dc.w	L000f74-L000f46
	.dc.w	L000f74-L000f46
	.dc.w	L000f80-L000f46
	.dc.w	L000f80-L000f46
	.dc.w	L000f84-L000f46
	.dc.w	L000f84-L000f46
	.dc.w	L000f7c-L000f46
	.dc.w	L000f88-L000f46
	.dc.w	L000f8c-L000f46
L000f5c:
	moveq.l	#$03,d0
L000f5e:
	move.w	d0,-(sp)
	moveq.l	#$c0,d0
	bsr.w	L00115c
	move.w	(sp)+,d0
	bsr.w	L00115c
	bsr.w	L001152
	bra.w	L000c16

	moveq.l	#$04,d0
	bra.s	L000f5e

	moveq.l	#$05,d0
	bra.s	L000f5e

	moveq.l	#$06,d0
	bra.s	L000f5e

	moveq.l	#$07,d0
	bra.s	L000f5e

	moveq.l	#$08,d0
	bra.s	L000f5e

	moveq.l	#$09,d0
	bra.s	L000f5e

	moveq.l	#$0a,d0
	bra.s	L000f5e

L000f90:
	movem.l	d1/a1-a3,-(sp)
	lea.l	(L000fc4,pc),a3
	moveq.l	#$0a,d1
L000f9a:
	move.w	(a3)+,d0
	lea.l	(L000fc4,pc,d0.w),a1
	movea.l	a0,a2
L000fa2:
	tst.b	(a1)
	beq.s	L000fb8
	move.b	(a2)+,d0
	bsr.w	L001786
	cmp.b	(a1)+,d0
	beq.s	L000fa2
	dbra.w	d1,L000f9a
	moveq.l	#$ff,d0
	bra.s	L000fbe

L000fb8:
	movea.l	a2,a0
	moveq.l	#$0a,d0
	sub.l	d1,d0
L000fbe:
	movem.l	(sp)+,d1/a1-a3
	rts

L000fc4:
	.dc.w	$0016,$001b,$0020,$0026
	.dc.w	$0028,$002f,$0031,$0036
	.dc.w	$0038,$003d,$0040
UnknownBlob2:
	.dc.w	$442e,$432e,$0044,$2e53
	.dc.w	$2e00,$5345,$474e,$4f00
	.dc.w	$2400,$544f,$434f,$4441
	.dc.w	$002a,$0046,$494e,$4500
	.dc.w	$5e00,$434f,$4441,$0044
	.dc.w	$4f00,$4c4f,$4f50,$0000
L00100a:
	cmpi.b	#$3a,(a0)		;':'
	bne.s	L00104a
	addq.l	#1,a0
	bsr.w	L00160c
	tst.b	d0
	bmi.s	L001020
	bsr.w	L00174a
	bra.s	L001022

L001020:
	moveq.l	#$02,d0
L001022:
	tst.l	d0
	beq.w	L000d06
	cmp.l	#$00000100,d0
	bhi.w	L000d06
	move.b	d0,d1
	moveq.l	#$c0,d0
	bsr.w	L00115c
	moveq.l	#$00,d0
	bsr.w	L00115c
	move.b	d1,d0
	bsr.w	L00115c
	bra.w	L000c16

L00104a:
	bsr.w	L00160c
	tst.b	d0
	bmi.w	L000d0a
	bsr.w	L00174a
	subq.l	#1,d0
	cmp.l	#$000000ff,d0
	bhi.w	L000d0e
	move.b	d0,d1
	moveq.l	#$c0,d0
	bsr.w	L00115c
	moveq.l	#$02,d0
	bsr.w	L00115c
	move.b	d1,d0
	bsr.w	L00115c
	bra.w	L000c16

L00107c:
	cmpi.b	#$7c,(a0)		;'|'
	bne.w	L000c16
	addq.l	#1,a0
	moveq.l	#$c0,d0
	bsr.w	L00115c
	moveq.l	#$01,d0
	bsr.w	L00115c
	bsr.w	L001152
	bra.w	L000c16

L00109a:
	movea.l	(a1),a2
	move.b	(-$0003,a2),d0
	bmi.w	L000d62
	move.b	(-$0002,a2),(-$0001,a2)
	bra.w	L000c16

L0010ae:
	moveq.l	#$7f,d0
	bsr.w	L001560
	bra.w	L000cf2

L0010b8:
	bsr.w	L000e58
	bsr.w	L00160c
	tst.b	d0
	bmi.w	L000d4e
	bsr.w	L00174a
	tst.b	d0
	beq.w	L000d4e
	cmp.b	#$08,d0
	bhi.w	L000d4e
	move.b	d0,($0007,a1)
	bra.w	L000c16

L0010e0:
	bsr.w	L00160c
	tst.b	d0
	bmi.w	L000d12
	bsr.w	L00174a
	cmp.b	#$08,d0
	bhi.w	L000d16
	move.b	d0,($0004,a1)
	bra.w	L000c16

L0010fe:
	cmpi.b	#$08,($0004,a1)
	bcc.w	L000d16
	addq.b	#1,($0004,a1)
	bra.w	L000c16

L001110:
	tst.b	($0004,a1)
	beq.w	L000d16
	subq.b	#1,($0004,a1)
	bra.w	L000c16

L001120:
	bsr.w	L000e58
	bsr.w	L00160c
	tst.b	d0
	bmi.w	L000d32
	bsr.w	L00174a
	tst.l	d0
	beq.w	L000d1a
	cmp.l	#$00000040,d0
	bhi.w	L000d1a
	move.l	#$000000c0,d1
	divu.w	d0,d1
	move.b	d1,($0006,a1)
	bra.w	L000c16

L001152:
	move.l	d0,-(sp)
	moveq.l	#$00,d0
	bsr.s	L00115c
	move.l	(sp)+,d0
	rts

L00115c:
	movem.l	d1/a0-a2,-(sp)
	move.l	(L00525e,pc),d1
	add.w	d1,d1
	add.w	d1,d1
	lea.l	($2d48,pc),a0
	move.l	(a0,d1.w),d1
	subq.l	#1,d1
	cmp.l	($000a,a1),d1
	bls.s	L00118a
	addq.l	#1,($000a,a1)
	movea.l	(a1),a2
	move.b	d0,(a2)+
	st.b	(a2)
	move.l	a2,(a1)
	movem.l	(sp)+,d1/a0-a2
	rts

L00118a:
	movem.l	(sp)+,d1/a0-a2
	bra.w	$00000d1e

L001192:
	bsr.w	L00160c
	tst.b	d0
	bpl.w	L001246
	move.b	(a0)+,d0
	bsr.w	L001786
	cmp.b	#$56,d0			;'V'
	beq.w	L001416
	cmp.b	#$4c,d0			;'L'
	beq.s	L0011da
	cmp.b	#$57,d0			;'W'
	beq.s	L001204
	tst.b	(L003ab6)
	beq.s	L0011d6
	cmp.b	#$54,d0			;'T'
	beq.w	L00133a
	cmp.b	#$4b,d0			;'K'
	beq.w	L00139a
	cmp.b	#$46,d0			;'F'
	beq.w	L00130a
L0011d6:
	bra.w	L000d22

L0011da:
	bsr.w	L000e58
	bsr.w	L00160c
	tst.b	d0
	bmi.w	L000d5a
	bsr.w	L00174a
	tst.l	d0
	beq.w	L000d5a
	cmp.l	#$000000c0,d0
	bhi.w	L000d5a
	move.b	d0,($0006,a1)
	bra.w	L000c16

L001204:
	bsr.w	L00160c
	tst.b	d0
	bpl.s	L001212
	move.b	($0006,a1),d0
	bra.s	L001230

L001212:
	bsr.w	L00174a
	tst.l	d0
	beq.w	L000d26
	cmp.l	#$00000040,d0
	bhi.w	L000d26
	move.l	#$000000c0,d1
	divu.w	d0,d1
	move.b	d1,d0
L001230:
	move.l	d0,d1
	moveq.l	#$d0,d0
	bsr.w	L00115c
	move.l	d1,d0
	bsr.w	L00115c
	bsr.w	L00115c
	bra.w	L000c16

L001246:
	bsr.w	L00174a
	cmp.b	#$01,d0
	bcs.w	L000d42
	cmp.b	#$c8,d0
	bhi.w	L000d42
	move.l	d0,d1
	moveq.l	#$a0,d0
	bsr.w	L00115c
	move.l	d1,d0
	bsr.w	L00115c
	bsr.w	L001152
	bra.w	L000c16

L001270:
	bsr.w	L001604
	move.b	(a0),d0
	cmp.b	#$2b,d0			;'+'
	beq.s	L0012ba
	cmp.b	#$2d,d0			;'-'
	beq.s	L0012e2
L001282:
	bsr.w	L00160c
	tst.b	d0
	bmi.w	L000d2a
	bsr.w	L00174a
	cmp.l	#$00000020,d0
	bcs.w	L000d2e
	cmp.l	#$000000c8,d0
	bhi.w	L000d2e
	move.l	d0,d1
	moveq.l	#$90,d0
	bsr.w	L00115c
	move.l	d1,d0
	bsr.w	L00115c
	bsr.w	L001152
	bra.w	L000c16

L0012ba:
	addq.l	#1,a0
	bsr.w	L00160c
	tst.b	d0
	bmi.w	L000d2a
	bsr.w	L00174a
	move.l	d0,d1
	moveq.l	#$f0,d0
	bsr.w	L00115c
	moveq.l	#$06,d0
	bsr.w	L00115c
	move.l	d1,d0
	bsr.w	L00115c
	bra.w	L000c16

L0012e2:
	addq.l	#1,a0
	bsr.w	L00160c
	tst.b	d0
	bmi.w	L000d2a
	bsr.w	L00174a
	move.l	d0,d1
	moveq.l	#$f0,d0
	bsr.w	L00115c
	moveq.l	#$08,d0
	bsr.w	L00115c
	move.l	d1,d0
	bsr.w	L00115c
	bra.w	L000c16

L00130a:
	bsr.w	L00160c
	tst.b	d0
	bmi.w	L000cfa
	bsr.w	L00174a
	cmp.l	#$00000400,d0
	bcc.w	L000cfa
	move.l	d0,d1
	moveq.l	#$f0,d0
	bsr.w	L00115c
	moveq.l	#$0c,d0
	bsr.w	L00115c
	move.l	d1,d0
	bsr.w	L00115c
	bra.w	L000c16

L00133a:
	bsr.w	L001604
	move.b	(a0)+,d0
	cmp.b	#$2b,d0			;'+'
	beq.s	L00134e
	cmp.b	#$2d,d0			;'-'
	beq.s	L001368
	subq.l	#1,a0
L00134e:
	bsr.w	L00160c
	tst.b	d0
	bmi.w	L000cfa
	bsr.w	L00174a
	cmp.l	#$00000041,d0
	bcc.w	L000cfa
	bra.s	L001382

L001368:
	bsr.w	L00160c
	tst.b	d0
	bmi.w	L000cfa
	bsr.w	L00174a
	cmp.l	#$00000041,d0
	bcc.w	L000cfa
	neg.l	d0
L001382:
	move.l	d0,d1
	moveq.l	#$f0,d0
	bsr.w	L00115c
	moveq.l	#$0a,d0
	bsr.w	L00115c
	move.l	d1,d0
	bsr.w	L00115c
	bra.w	L000c16

L00139a:
	bsr.w	L001604
	move.b	(a0)+,d0
	cmp.b	#$2b,d0			;'+'
	beq.s	L0013ae
	cmp.b	#$2d,d0			;'-'
	beq.s	L0013ce
	subq.l	#1,a0
L0013ae:
	bsr.w	L00160c
	tst.b	d0
	bmi.w	L000cfa
	bsr.w	L00174a
	cmp.l	#$00000301,d0
	bcc.w	L000cfa
	addq.w	#5,d0
	add.w	d0,d0
	add.w	d0,d0
	bra.s	L0013f0

L0013ce:
	bsr.w	L00160c
	tst.b	d0
	bmi.w	L000cfa
	bsr.w	L00174a
	cmp.l	#$00000301,d0
	bcc.w	L000cfa
	moveq.l	#$05,d1
	sub.w	d0,d1
	add.w	d1,d1
	add.w	d1,d1
	move.w	d1,d0
L0013f0:
	moveq.l	#$00,d2
	move.b	d0,d2
	lsr.w	#8,d0
	moveq.l	#$00,d1
	move.b	d0,d1
	moveq.l	#$f0,d0
	bsr.w	L00115c
	moveq.l	#$0e,d0
	bsr.w	L00115c
	move.l	d1,d0
	bsr.w	L00115c
	move.l	d2,d0
	bsr.w	L00115c
	bra.w	L000c16

L001416:
	bsr.w	L00160c
	tst.b	d0
	bmi.w	L000d36
	bsr.w	L00174a
	cmp.l	#$0000007f,d0
	bhi.w	L000d3a
	moveq.l	#$7f,d1
	sub.l	d0,d1
	moveq.l	#$80,d0
	bsr.w	L00115c
	move.l	d1,d0
	bsr.w	L00115c
	bsr.w	L001152
	bra.w	L000c16

L001446:
	bsr.w	L00160c
	tst.b	d0
	bmi.w	L000d36
	bsr.w	L00174a
	cmp.l	#$0000000f,d0
	bhi.w	L000d3a
	move.b	(Table4,pc,d0.w),d1
	moveq.l	#$80,d0
	bsr.w	L00115c
	move.b	d1,d0
	bsr.w	L00115c
	bsr.w	L001152
	bra.w	L000c16

Table4:
	.dc.b	$2a,$28,$25,$22,$20,$1d,$1a,$18
	.dc.b	$15,$12,$10,$0d,$0a,$08,$05,$02
L001486:
	bsr.w	L00160c
	tst.b	d0
	bmi.s	L001496
	bsr.w	L00174a
	move.b	d0,d1
	bra.s	L001498

L001496:
	moveq.l	#$ff,d1
L001498:
	moveq.l	#$f0,d0
	bsr.w	L00115c
	moveq.l	#$10,d0
	bsr.w	L00115c
	move.b	d1,d0
	bsr.w	L00115c
	bra.w	L000c16

L0014ae:
	bsr.w	L00160c
	tst.b	d0
	bmi.s	L0014c6
	bsr.w	L00174a
	cmp.l	#$000000ff,d0
	bhi.w	L000d56
	bra.s	L0014c8

L0014c6:
	moveq.l	#$14,d0
L0014c8:
	move.l	d0,d1
	moveq.l	#$f0,d0
	bsr.w	L00115c
	bsr.w	L001152
	move.l	d1,d0
	bsr.w	L00115c
	bra.w	L000c16

L0014de:
	bsr.w	L00160c
	tst.b	d0
	bmi.s	L00150c
	bsr.w	L00174a
	cmp.l	#$0000007f,d0
	bhi.w	L000d3a
L0014f4:
	move.b	d0,d1
	moveq.l	#$f0,d0
	bsr.w	L00115c
	moveq.l	#$02,d0
	bsr.w	L00115c
	move.b	d1,d0
	bsr.w	L00115c
	bra.w	L000c16

L00150c:
	moveq.l	#$00,d0
	bra.s	L0014f4

L001510:
	bsr.w	L00160c
	tst.b	d0
	bmi.s	L00153e
	bsr.w	L00174a
	cmp.l	#$0000007f,d0
	bhi.w	L000d3a
L001526:
	move.l	d0,d1
	moveq.l	#$f0,d0
	bsr.w	L00115c
	moveq.l	#$04,d0
	bsr.w	L00115c
	move.l	d1,d0
	bsr.w	L00115c
	bra.w	L000c16

L00153e:
	moveq.l	#$00,d0
	bra.s	L001526

L001542:
	bsr.w	L0015e0
	add.b	d1,d0
	add.b	($0005,a1),d0
	moveq.l	#$00,d1
	move.b	($0004,a1),d1
	mulu.w	#$000c,d1
	add.b	d1,d0
	cmp.b	#$60,d0			;'`'
	bcc.w	L000d3e
L001560:
	move.b	d0,d5
	bsr.w	L00160c
	bmi.s	L001586
	bsr.w	L000e58
	bsr.w	L00174a
	tst.l	d0
	beq.w	L000d1a
	moveq.l	#$40,d1			;'@'
	cmp.l	d1,d0
	bhi.w	L000d1a
	add.w	#$0080,d1
	divu.w	d0,d1
	bra.s	L00158a

L001586:
	move.b	($0006,a1),d1
L00158a:
	tst.l	(L005256)
	beq.s	L001598
	addq.l	#1,(L00525a)
L001598:
	move.b	d1,d0
	moveq.l	#$03,d2
L00159c:
	bsr.s	L001604
	cmpi.b	#$2e,(a0)		;'.'
	bne.s	L0015b2
	bsr.w	L000e58
	lsr.b	#1,d1
	add.b	d1,d0
	addq.l	#1,a0
	subq.b	#1,d2
	bne.s	L00159c
L0015b2:
	exg.l	d0,d5
	bsr.w	L00115c
	move.b	d5,d0
	bsr.w	L00115c
	bsr.s	L0015c6
	bsr.w	L00115c
	rts

L0015c6:
	move.l	d1,-(sp)
	andi.w	#$00ff,d0
	moveq.l	#$00,d1
	move.b	($0007,a1),d1
	mulu.w	d1,d0
	lsr.w	#3,d0
	subq.b	#1,d0
	bcc.s	$000015dc
	clr.b	d0
	move.l	(sp)+,d1
	rts

L0015e0:
	bsr.s	L001604
	cmpi.b	#$23,(a0)		;'#'
	beq.s	L0015f8
	cmpi.b	#$2b,(a0)		;'+'
	beq.s	L0015f8
	cmpi.b	#$2d,(a0)		;'-'
	beq.s	$000015fc
	moveq.l	#$00,d1
	rts

L0015f8:
	moveq.l	#$01,d1
	bra.s	$000015fe

	moveq.l	#$ff,d1
	addq.l	#1,a0
	rts

L001602:
	addq.l	#1,a0
L001604:
	cmpi.b	#$20,(a0)		;' '
	beq.s	L001602
	rts

L00160c:
	bsr.s	L001604
	move.b	(a0),d0
	cmp.b	#$30,d0			;'0'
	bcs.s	L001620
	cmp.b	#$39,d0			;'9'
	bhi.s	L001620
	moveq.l	#$00,d0
	rts

L001620:
	moveq.l	#$ff,d0
	rts

Table5:
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
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
	.dc.b	$7e,$7e,$7e,$7e,$7e,$7e,$7e,$7e
	.dc.b	$7e,$7e,$7e,$7e,$7e,$7e,$7e,$7e
	.dc.b	$7e,$7e,$7e,$7e,$7e,$7e,$7e,$7e
	.dc.b	$7e,$7e,$7e,$7e,$7e,$7e,$7e,$7e
	.dc.b	$7e,$7e,$7e,$7e,$7e,$7e,$7e,$7e
	.dc.b	$7e,$7e,$7e,$7e,$7e,$7e,$7e,$7e
	.dc.b	$7e,$7e,$7e,$7e,$7e,$7e,$7e,$7e
	.dc.b	$7e,$7e,$7e,$7e,$7e,$7e,$7e,$7e
	.dc.b	$7e,$7e,$7e,$7e,$7e,$7e,$7e,$7e
	.dc.b	$7e,$7e,$7e,$7e,$7e,$7e,$7e,$7e
L001724:
	cmp.b	#$41,d0			;'A'
	bcs.s	L00173e
	cmp.b	#$47,d0			;'G'
	bhi.s	L00173e
	sub.b	#$41,d0			;'A'
	andi.w	#$00ff,d0
	move.b	(L001742,pc,d0.w),d0
	rts

L00173e:
	moveq.l	#$ff,d0
	rts

L001742:
	.dc.b	$06,$08,$fd,$ff,$01,$02,$04,$00
L00174a:
	move.l	d1,-(sp)
	moveq.l	#$00,d0
	moveq.l	#$00,d1
L001750:
	bsr.w	L001604
	cmpi.b	#$30,(a0)+		;'0'
	beq.s	L001750
	subq.l	#1,a0
L00175c:
	bsr.w	L001604
	move.b	(a0),d1
	cmp.b	#$30,d1			;'0'
	bcs.s	L001780
	cmp.b	#$39,d1			;'9'
	bhi.s	L001780
	sub.b	#$30,d1			;'0'
	mulu.w	#$000a,d0
	andi.b	#$0f,d1
	add.l	d1,d0
	addq.l	#1,a0
	bra.s	L00175c

L001780:
	movem.l	(sp)+,d1
	rts

L001786:
	cmp.b	#$61,d0			;'a'
	bcs.s	L001796
	cmp.b	#$7a,d0			;'z'
	bhi.s	L001796
	sub.b	#$20,d0			;' '
L001796:
	rts

L001798:
	move.l	d0,-(sp)
	lsl.w	#4,d0
	lea.l	($2afc,pc),a1
	adda.w	d0,a1
	move.l	(sp)+,d0
	rts

L0017a6:
	movem.l	d0-d7/a0-a6,-(sp)
	andi.b	#$f7,($00e88015)
	move.w	sr,d6
	andi.w	#$f8ff,d6
	ori.w	#$0500,d6
	move.w	d6,sr
	move.w	#$0100,d6
	move.b	($00e90003),d6
	move.b	(L005276,pc),d2
	moveq.l	#$14,d1
	IOCS	_OPMSET
	lsr.w	#1,d6
	bcc.s	L00182c
	lea.l	($3aa4,pc),a0
	addq.b	#1,(a0)
	andi.b	#$03,(a0)
	bne.s	L00182c
	swap.w	d6
	move.w	(L00527a,pc),d6
	move.w	(L005284,pc),d5
	moveq.l	#$00,d7
	lea.l	(-$017c,pc),a2
	lea.l	(L005386,pc),a5
L0017f6:
	ror.w	#1,d5
	lsr.w	#1,d6
	bcc.s	L001804
	swap.w	d6
	bsr.w	L001c32
	swap.w	d6
L001804:
	lea.l	($0056,a5),a5
	addq.b	#1,d7
	cmp.b	#$08,d7
	bne.s	L0017f6
	ror.w	#1,d5
	lsr.w	#1,d6
	bcc.s	L00182a
	move.b	($3a5a,pc),d0
	cmp.b	#$ff,d0
	beq.s	L00182a
	moveq.l	#$ff,d7
	swap.w	d6
	bsr.w	L001c52
	swap.w	d6
L00182a:
	swap.w	d6
L00182c:
	lsr.w	#1,d6
	bcc.w	L0018d0
	swap.w	d6
	move.w	(L005278,pc),d6
	move.w	(L005284,pc),d5
	moveq.l	#$00,d7
	lea.l	(-$01cc,pc),a2
	lea.l	(L005386,pc),a5
L001846:
	ror.w	#1,d5
	lsr.w	#1,d6
	bcc.s	L001854
	swap.w	d6
	bsr.w	L001c32
	swap.w	d6
L001854:
	lea.l	($0056,a5),a5
	addq.b	#1,d7
	cmp.b	#$08,d7
	bne.s	L001846
	ror.w	#1,d5
	lsr.w	#1,d6
	bcc.s	L001878
	move.b	($3a0a,pc),d0
	cmp.b	#$ff,d0
	beq.s	L001878
	moveq.l	#$ff,d7
	swap.w	d6
	bsr.w	L001c52
L001878:
	move.b	(L005280,pc),d0
	beq.s	L0018d0
	lea.l	(L005280,pc),a0
	subq.b	#1,($0003,a0)
	bcc.s	L0018d0
	addq.b	#1,(L00568c)
	cmpi.b	#$40,(L00568c)		;'@'
	bcc.s	L0018de
	move.b	($0002,a0),($0003,a0)
	moveq.l	#$00,d7
	lea.l	(L005386,pc),a5
	move.w	(L005284,pc),d5
L0018a8:
	ror.w	#1,d5
	bcc.s	L0018c4
	tst.b	($0014,a5)
	beq.s	L0018c4
	bmi.s	L0018c4
	bsr.w	L001e02
	move.b	($0038,a5),d2
	add.b	d7,d2
	moveq.l	#$08,d1
	IOCS	_OPMSET
L0018c4:
	lea.l	($0056,a5),a5
	addq.b	#1,d7
	cmp.b	#$08,d7
	bne.s	L0018a8
L0018d0:
	ori.b	#$08,($00e88015)
	movem.l	(sp)+,d0-d7/a0-a6
	rte

L0018de:
	move.w	(L005284,pc),d2
	bsr.w	L0007cc
	lea.l	(L001c2e,pc),a0
	lea.l	(L005386,pc),a5
	moveq.l	#$08,d0
	move.w	(L005284,pc),d6
L0018f4:
	lsr.w	#1,d6
	bcc.s	L0018fe
	clr.b	(a5)
	move.l	a0,($0002,a5)
L0018fe:
	lea.l	($0056,a5),a5
	dbra.w	d0,L0018f4
	clr.l	(L005280)
	clr.b	(L00568c)
	bra.s	L0018d0

L001914:
	move.w	sr,-(sp)
	ori.w	#$0700,sr
	move.l	($010c),(L005246)
	suba.l	a1,a1
	IOCS	_OPMINTST
	lea.l	(L001a06,pc),a1
	cmpi.b	#$3f,(L005276)		;'?'
	bne.s	L00193e
	bsr.w	L0019f6
	lea.l	(L0017a6,pc),a1
L00193e:
	IOCS	_OPMINTST
	moveq.l	#$78,d0			;'x'
	bsr.s	L00196e
	bsr.w	L0019ec
	move.w	(sp)+,sr
	rts

L00194e:
	move.w	sr,-(sp)
	ori.w	#$0700,sr
	moveq.l	#$78,d0			;'x'
	bsr.s	L00196e
	bsr.w	L0019ec
	cmpi.b	#$3f,(L005276)		;'?'
	bne.s	L00196a
	bsr.w	L0019f6
L00196a:
	move.w	(sp)+,sr
	rts

L00196e:
	move.b	d0,(L00568d)
	move.l	#$00009897,d2
	divu.w	d0,d2
	addq.w	#4,d2
	lsr.w	#3,d2
	neg.b	d2
	move.b	d2,(L00527d)
	moveq.l	#$12,d1
	IOCS	_OPMSET
	rts

L001990:
	move.b	d0,(L00568d)
L001996:
	move.l	#$00004c4b,d1
	divu.w	d0,d1
	move.w	#$0400,d2
	sub.w	d1,d2
	move.w	d2,(L00527e)
	move.w	d2,d3
	lsr.w	#2,d2
	moveq.l	#$10,d1
	IOCS	_OPMSET
	move.w	d3,d2
	and.b	#$03,d2
	moveq.l	#$11,d1
	IOCS	_OPMSET
	rts

L0019c2:
	move.b	(L00527d,pc),d2
	moveq.l	#$12,d1
	IOCS	_OPMSET
	rts

L0019ce:
	move.w	(L00527e),d2
	move.w	d2,d3
	lsr.w	#2,d2
	moveq.l	#$10,d1
	IOCS	_OPMSET
	move.w	d3,d2
	and.b	#$03,d2
	moveq.l	#$11,d1
	IOCS	_OPMSET
	rts

L0019ec:
	moveq.l	#$00,d2
	moveq.l	#$12,d1
	IOCS	_OPMSET
	rts

L0019f6:
	moveq.l	#$00,d2
	moveq.l	#$10,d1
	IOCS	_OPMSET
	moveq.l	#$11,d1
	IOCS	_OPMSET
	rts

L001a06:
	movem.l	d0-d7/a0-a6,-(sp)
	andi.b	#$f7,($00e88015)
	move.w	sr,d6
	andi.w	#$f8ff,d6
	ori.w	#$0500,d6
	move.w	d6,sr
	move.b	(L003ab8,pc),d0
	beq.w	L001afc
	lea.l	($383f,pc),a0
	move.b	($080e),d0
	andi.b	#$06,d0
	beq.w	L001aec
	move.b	($080a),d0
	btst.l	#$06,d0
	beq.s	L001a6c
	st.b	(L005275)
	move.b	($2074,pc),d0
	beq.s	L001a60
	moveq.l	#$f8,d2
	moveq.l	#$10,d1
	IOCS	_OPMSET
	moveq.l	#$00,d2
	moveq.l	#$11,d1
	IOCS	_OPMSET
	bra.w	L001afc

L001a60:
	moveq.l	#$f8,d2
	moveq.l	#$12,d1
	IOCS	_OPMSET
	bra.w	L001afc

L001a6c:
	btst.l	#$07,d0
	beq.s	L001a96
	tst.b	(a0)
	bne.s	L001aec
	st.b	(a0)
	clr.b	(L003ab8)
	moveq.l	#$00,d2
	move.b	(L00568e,pc),d2
	bsr.w	L0005e6
	moveq.l	#$00,d2
	bsr.w	L000662
	st.b	(L003ab8)
	bra.s	L001aec

L001a96:
	clr.b	(a0)
	move.b	($080b),d0
	btst.l	#$00,d0
	beq.s	L001ac0
	tst.b	($0001,a0)
	bne.s	L001aec
	st.b	($0001,a0)
	clr.b	(L003ab8)
	moveq.l	#$00,d2
	bsr.w	L0007cc
	st.b	(L003ab8)
L001abe:
	bra.s	L001aec

L001ac0:
	clr.b	($0001,a0)
	btst.l	#$01,d0
	beq.s	L001ae8
	tst.b	($0002,a0)
	bne.s	L001aec
	st.b	($0002,a0)
	clr.b	(L003ab8)
	moveq.l	#$00,d2
	bsr.w	L000864
	st.b	(L003ab8)
	bra.s	L001aec

L001ae8:
	clr.b	($0002,a0)
L001aec:
	move.b	(L005275,pc),d0
	beq.s	L001afc
	clr.b	(L005275)
	bsr.w	L0019c2
L001afc:
	move.b	($1fbe,pc),d7
	beq.s	L001b10
	lea.l	($3778,pc),a0
	addq.b	#1,(a0)
	andi.b	#$03,(a0)
	bne.w	L001bd2
L001b10:
	moveq.l	#$ff,d5
	moveq.l	#$00,d6
	moveq.l	#$00,d7
	lea.l	(-$04a4,pc),a2
	lea.l	(L005386,pc),a5
L001b1e:
	bsr.w	L001c32
	lea.l	($0056,a5),a5
	addq.b	#1,d7
	cmp.b	#$08,d7
	bne.s	L001b1e
	move.b	($3742,pc),d0
	cmp.b	#$ff,d0
	beq.s	L001b3e
	moveq.l	#$ff,d7
	bsr.w	L001c52
L001b3e:
	move.b	(L005280,pc),d0
	beq.s	L001b90
	lea.l	(L005280,pc),a0
	subq.b	#1,($0003,a0)
	bcc.s	L001b90
	addq.b	#1,(L00568c)
	cmpi.b	#$40,(L00568c)		;'@'
	bcc.w	L001bea
	move.b	($0002,a0),($0003,a0)
	moveq.l	#$00,d7
	lea.l	(L005386,pc),a5
L001b6c:
	tst.b	($0014,a5)
	beq.s	L001b84
	bmi.s	L001b84
	bsr.w	L001e02
	move.b	($0038,a5),d2
	add.b	d7,d2
	moveq.l	#$08,d1
	IOCS	_OPMSET
L001b84:
	lea.l	($0056,a5),a5
	addq.b	#1,d7
	cmp.b	#$08,d7
	bne.s	L001b6c
L001b90:
	move.b	($36d4,pc),d0
	beq.s	L001bd2
	move.w	(L005262,pc),d0
	bne.s	L001bd2
	move.w	(L005264,pc),d0
	beq.s	L001bac
	subq.w	#1,d0
	move.w	d0,(L005264)
	bra.s	L001bd2

L001bac:
	move.b	(L003ab8,pc),(L001c30)
	clr.b	(L003ab8)
	moveq.l	#$00,d2
	move.b	(L00568e,pc),d2
	bsr.w	L0005e6
	moveq.l	#$00,d2
	bsr.w	L000662
	move.b	(L001c30,pc),(L003ab8)
L001bd2:
	move.b	(L005276,pc),d2
	moveq.l	#$14,d1
	IOCS	_OPMSET
	ori.b	#$08,($00e88015)
	movem.l	(sp)+,d0-d7/a0-a6
	rte

L001bea:
	move.b	(L003ab8,pc),(L001c30)
	clr.b	(L003ab8)
	moveq.l	#$00,d2
	bsr.w	L0007cc
	lea.l	(L001c2e,pc),a0
	lea.l	(L005386,pc),a5
	moveq.l	#$08,d0
L001c08:
	clr.b	(a5)
	move.l	a0,($0002,a5)
	lea.l	($0056,a5),a5
	dbra.w	d0,L001c08
	clr.l	(L005280)
	clr.b	(L00568c)
	move.b	(L001c30,pc),(L003ab8)
	bra.w	L001b90

L001c2e:
	DOS	_CHANGE_PR
L001c30:
	.dc.b	$00,$00
L001c32:
	tst.b	($0014,a5)
	beq.s	L001c50
	tst.b	(a5)
	beq.s	L001c62
	subq.b	#1,(a5)
	beq.s	L001c62
	tst.b	($0001,a5)
	beq.w	L001cde
	subq.b	#1,($0001,a5)
	beq.w	L001cde
L001c50:
	rts

L001c52:
	tst.b	($0014,a5)
	beq.s	L001c60
	tst.b	(a5)
	beq.s	L001c72
	subq.b	#1,(a5)
	beq.s	L001c72
L001c60:
	rts

L001c62:
	lea.l	(L001d00,pc),a4
	movea.l	($0002,a5),a0
	bsr.s	L001c82
	move.l	a0,($0002,a5)
	rts

L001c72:
	lea.l	($009c,pc),a4
	movea.l	($0002,a5),a0
	bsr.s	L001c82
	move.l	a0,($0002,a5)
	rts

L001c82:
	moveq.l	#$00,d0
	move.b	(a0)+,d0
	bpl.w	L001d20
	cmp.b	#$ff,d0
	beq.s	L001ca2
	move.b	(a0)+,d1
	move.b	(a0)+,d2
	lsr.w	#4,d0
	subq.w	#8,d0
	add.w	d0,d0
	move.w	(a4,d0.w),d0
	jmp	(a4,d0.w)

L001ca2:
	subq.l	#1,a0
	st.b	($004d,a5)
	move.w	(L005262,pc),d0
	tst.b	d7
	bpl.s	L001cb6
	andi.w	#$00ff,d0
	bra.s	L001cb8

L001cb6:
	bclr.l	d7,d0
L001cb8:
	move.w	d0,(L005262)
	and.w	(L005278,pc),d0
	bne.s	L001cc8
	bsr.w	L0019ec
L001cc8:
	move.w	(L005262,pc),d0
	and.w	(L00527a,pc),d0
	bne.s	L001cd6
	bsr.w	L0019f6
L001cd6:
	clr.b	($0014,a5)
	tst.b	d7
	bmi.s	L001cf0
L001cde:
	movem.l	d0-d2,-(sp)
	move.b	d7,d2
	moveq.l	#$08,d1
	IOCS	_OPMSET
	movem.l	(sp)+,d0-d2
	rts

L001cf0:
	movem.l	d0-d1,-(sp)
	moveq.l	#$00,d1
L001cf6:
	IOCS	_ADPCMMOD
	movem.l	(sp)+,d0-d1
	rts

L001d00:
	.dc.w	$00f8,$008e,$00aa,$00ba
	.dc.w	$027a,$00d0,$00d8,$0198
	.dc.w	$ff72,$007e,$ff72,$00aa
L001d18:
	andi.w	#$00c0,($00dc,a2)
	bchg.b	d0,(a6)+
L001d20:
	move.b	(a0)+,(a5)
	move.b	(a0)+,($0001,a5)
	cmp.b	#$7f,d0
	beq.s	L001d68
	move.b	#$01,($0014,a5)
	tst.b	d7
	bmi.s	L001d70
	add.b	($004e,a5),d0
	move.b	(a2,d0.w),d2
	moveq.l	#$28,d1			;'('
	add.b	d7,d1
	IOCS	_OPMSET
	tst.b	($003a,a5)
	beq.s	L001d5a
	moveq.l	#$01,d1
	moveq.l	#$02,d2
	IOCS	_OPMSET
	moveq.l	#$00,d2
	IOCS	_OPMSET
L001d5a:
	move.b	($0038,a5),d2
	add.b	d7,d2
	moveq.l	#$08,d1
	IOCS	_OPMSET
	rts

L001d68:
	move.b	#$81,($0014,a5)
	rts

L001d70:
	move.b	($004e,a5),d3
	bne.s	L001d86
L001d76:
	move.b	(L005280,pc),d1
	bne.s	L001d84
	move.b	d0,d2
	moveq.l	#$02,d1
	IOCS	_OPMSET
L001d84:
	rts

L001d86:
	add.b	d3,d0
	bcc.s	L001d76
	moveq.l	#$00,d0
	bra.s	L001d76

	tst.b	d6
	bmi.s	L001d9e
	moveq.l	#$00,d0
	move.b	d1,d0
	bsr.w	L00196e
	bra.w	L001c82

L001d9e:
	moveq.l	#$00,d0
	move.b	d1,d0
	bsr.w	L001996
	bra.w	L001c82

	move.b	d1,($0053,a5)
	move.b	d1,d0
	subq.b	#1,d0
	bsr.w	L0020f4
	bra.w	L001c82

	cmpi.b	#$02,d1
	bne.s	L001dc8
	move.b	(L005280,pc),d0
	bne.w	L001c82
L001dc8:
	IOCS	_OPMSET
	bra.w	L001c82

	move.b	d1,(a5)
	move.b	d1,($0001,a5)
	rts

L001dd8:
	move.b	d1,d2
	lsl.b	#6,d2
	or.b	($003e,a5),d2
	moveq.l	#$20,d1			;' '
	or.b	d7,d1
	IOCS	_OPMSET
	bra.w	L001c82

	move.b	d1,d2
	moveq.l	#$03,d1
	IOCS	_OPMSET
	bra.w	L001c82

	move.b	d1,($003c,a5)
	bsr.s	L001e02
	bra.w	L001c82

L001e02:
	move.b	($003c,a5),d3
	tst.w	d5
	bpl.s	L001e12
	add.b	(L00568c,pc),d3
	bpl.s	L001e12
	moveq.l	#$7f,d3
L001e12:
	moveq.l	#$78,d1			;'x'
	add.b	d7,d1
	move.b	($002e,a5),d2
	tst.b	($0036,a5)
	beq.s	L001e26
	add.b	d3,d2
	bpl.s	L001e26
	moveq.l	#$7f,d2
L001e26:
	IOCS	_OPMSET
	subq.b	#8,d1
	move.b	($002a,a5),d2
	tst.b	($0032,a5)
	beq.s	L001e3c
	add.b	d3,d2
	bpl.s	L001e3c
	moveq.l	#$7f,d2
L001e3c:
	IOCS	_OPMSET
	subq.b	#8,d1
	move.b	($002c,a5),d2
	tst.b	($0034,a5)
	beq.s	L001e52
	add.b	d3,d2
	bpl.s	L001e52
	moveq.l	#$7f,d2
L001e52:
	IOCS	_OPMSET
	subq.b	#8,d1
	move.b	($0028,a5),d2
	tst.b	($0030,a5)
	beq.s	L001e68
	add.b	d3,d2
	bpl.s	L001e68
	moveq.l	#$7f,d2
L001e68:
	IOCS	_OPMSET
	rts

L001e6e:
	and.w	#$00ff,d1
	move.w	(Table1,pc,d1.w),d0
	jmp	(Table1,pc,d0.w)

Table1:
	.dc.w	L001e8c-Table1
	.dc.w	L001c82-Table1
	.dc.w	L001c82-Table1
	.dc.w	L001efa-Table1
	.dc.w	L001f1a-Table1
	.dc.w	L001f3a-Table1
	.dc.w	L001f68-Table1
	.dc.w	L001f4a-Table1
	.dc.w	L001f46-Table1
L001e8c:
	move.b	d1,d2
	moveq.l	#$0d,d1
	IOCS	_OPMSET
	bra.w	L001c82

	and.w	#$00ff,d1
	move.w	(Table2,pc,d1.w),d0
	jmp	(Table2,pc,d0.w)

Table2:
	.dc.w	L001f58-Table2
	.dc.w	L001eb6-Table2
	.dc.w	L001ed8-Table2
	.dc.w	L001efa-Table2
	.dc.w	L001f1a-Table2
	.dc.w	L001f3a-Table2
	.dc.w	L001f68-Table2
	.dc.w	L001f4a-Table2
	.dc.w	L001f70-Table2
L001eb6:
	tst.b	d2
	bne.s	$00001ebe
	move.b	($0050,a5),d2
	move.b	($003c,a5),d1
	sub.b	d2,d1
	bcc.s	$00001ec8
	moveq.l	#$00,d1
	move.b	d1,($003c,a5)
	move.b	d2,($0050,a5)
	bsr.w	L001e02
	bra.w	L001c82

	tst.b	d2
	bne.s	$00001ee0
	move.b	($0051,a5),d2
	move.b	($003c,a5),d1
	add.b	d2,d1
	bpl.s	$00001eea
	moveq.l	#$7f,d1
	move.b	d1,($003c,a5)
	move.b	d2,($0051,a5)
	bsr.w	L001e02
	bra.w	L001c82

	tst.b	d6
	bmi.w	L001c82
	moveq.l	#$00,d1
	move.b	(L00568d,pc),d1
	and.w	#$00ff,d2
	add.w	d2,d1
	cmp.w	#$00c8,d1
	bcs.w	$00001d8e
	moveq.l	#$c8,d1
	bra.w	$00001d8e

	tst.b	d6
	bmi.w	L001c82
	moveq.l	#$00,d0
	move.b	(L00568d,pc),d1
	and.w	#$00ff,d2
	sub.w	d2,d1
	cmp.w	#$0020,d1		;' '
	bcc.w	$00001d8e
	moveq.l	#$20,d1			;' '
	bra.w	$00001d8e

	move.b	d2,($004f,a5)
	add.b	($0052,a5),d2
	move.b	d2,($004e,a5)
	bra.w	L001c82

	move.b	d2,($0052,a5)
	add.b	($004f,a5),d2
	move.b	d2,($004e,a5)
	move.b	(a0)+,d2
	move.b	d2,($0054,a5)
	moveq.l	#$30,d1			;'0'
	or.b	d7,d1
	IOCS	_OPMSET
	bra.w	L001c82

	bsr.w	L000938
	bra.w	L001c82

	move.b	d2,(L005277)
	bra.w	L001c82

	cmp.b	#$0b,d1
	bcc.w	L001c82
	moveq.l	#$00,d0
	move.b	d1,d0
	add.w	d0,d0
	move.w	(L001f90,pc,d0.w),d0
	jmp	(L001f90,pc,d0.w)

L001f90:
	.dc.w	L00207e-L001f90
	.dc.w	L002098-L001f90
	.dc.w	L0020c8-L001f90
	.dc.w	L001fa6-L001f90
	.dc.w	L001fce-L001f90
	.dc.w	L001fdc-L001f90
	.dc.w	L001c82-L001f90
	.dc.w	L002006-L001f90
	.dc.w	L002032-L001f90
	.dc.w	L00203e-L001f90
	.dc.w	L00204c-L001f90
L001fa6:
	tst.b	($0016,a5)
	bne.w	L001c82
	move.l	a0,($001a,a5)
	move.b	d7,d0
	bsr.w	L000b36
	movea.l	($0002,a5),a0
	moveq.l	#$01,d0
	move.b	d0,($0016,a5)
	move.b	d0,($0018,a5)
	move.b	d0,($001e,a5)
	bra.w	L001c82

	move.b	#$01,($0020,a5)
	move.l	a0,($0022,a5)
	bra.w	L001c82

	tst.b	($0020,a5)
	beq.w	L001c82
	tst.b	($0026,a5)
	bne.w	L001c82
	moveq.l	#$01,d0
	move.b	d0,($0026,a5)
	move.b	d0,($0018,a5)
	move.b	d0,($001e,a5)
	move.l	a0,($001a,a5)
	movea.l	($0022,a5),a0
	bra.w	L001c82

	tst.b	($001e,a5)
	beq.w	L001c82
	movea.l	($001a,a5),a0
	cmpi.b	#$c0,(a0)
	bne.s	$00002020
	cmpi.b	#$06,($0001,a0)
	beq.s	$0000202c
	cmpi.b	#$ff,(a0)
	beq.w	$00001ca4
	addq.l	#3,a0
	bra.s	$00002012

	addq.l	#3,a0
	bra.w	L001c82

	tst.b	($0018,a5)
	beq.w	L001c82
	bra.w	$00001ca4

	move.b	#$01,($0046,a5)
	move.l	a0,($0048,a5)
	bra.w	L001c82

	addq.b	#1,($004c,a5)
	bcc.s	$00002056
	st.b	($004c,a5)
	tst.b	($0046,a5)
	beq.s	$00002070
	move.l	($0048,a5),d0
	addq.l	#3,d0
	cmp.l	a0,d0
	beq.w	L001c82
	movea.l	($0048,a5),a0
	bra.w	L001c82

	move.b	d7,d0
	bsr.w	L000b36
	movea.l	($0002,a5),a0
	bra.w	L001c82

	move.b	d2,($0012,a5)
	move.l	a0,($000a,a5)
	clr.b	($0042,a5)
	clr.b	($0040,a5)
	move.b	#$01,($0044,a5)
	bra.w	L001c82

	tst.b	($0044,a5)
	beq.w	L001c82
	tst.b	($0040,a5)
	beq.s	$000020b2
	move.b	#$01,($0042,a5)
	move.l	a0,($000e,a5)
	bra.s	$000020b8

	subq.b	#1,($0012,a5)
	beq.s	$000020c0
	movea.l	($000a,a5),a0
	bra.w	L001c82

	clr.b	($0044,a5)
	bra.w	L001c82

	tst.b	($0040,a5)
	beq.s	$000020ea
	tst.b	($0042,a5)
	beq.s	$000020e4
	clr.b	($0040,a5)
	clr.b	($0042,a5)
	movea.l	($000e,a5),a0
	bra.w	L001c82

	st.b	(a0)
	bra.w	L001c82

	move.b	#$01,($0040,a5)
	bra.w	L001c82

L0020f4:
	movem.l	d0-d3/a1,-(sp)
	lea.l	(L00568f,pc),a1
	mulu.w	#$0037,d0
	adda.l	d0,a1
	bsr.w	L0022c6
	moveq.l	#$0f,d2
	moveq.l	#$f8,d1
	or.b	d7,d1
	IOCS	_OPMSET
	subq.l	#8,d1
	IOCS	_OPMSET
	subq.l	#8,d1
	IOCS	_OPMSET
	subq.l	#8,d1
	IOCS	_OPMSET
	moveq.l	#$20,d1			;' '
	or.b	d7,d1
	move.b	($0009,a1),d2
	lsl.b	#6,d2
	or.b	(a1),d2
	IOCS	_OPMSET
	moveq.l	#$38,d1			;'8'
	or.b	d7,d1
	move.b	($0007,a1),d2
	lsl.b	#4,d2
	or.b	($0008,a1),d2
	IOCS	_OPMSET
	moveq.l	#$18,d1
	move.b	($0004,a1),d2
	IOCS	_OPMSET
	moveq.l	#$19,d1
	move.b	($0005,a1),d2
	ori.b	#$80,d2
	IOCS	_OPMSET
	moveq.l	#$19,d1
	move.b	($0006,a1),d2
	andi.b	#$7f,d2
	IOCS	_OPMSET
	moveq.l	#$1b,d1
	move.b	($0002,a1),d2
	andi.b	#$03,d2
	IOCS	_OPMSET
	moveq.l	#$40,d1			;'@'
	or.b	d7,d1
	move.b	($0013,a1),d2
	lsl.b	#4,d2
	or.b	($0012,a1),d2
	IOCS	_OPMSET
	addq.b	#8,d1
	move.b	($0029,a1),d2
	lsl.b	#4,d2
	or.b	($0028,a1),d2
	IOCS	_OPMSET
	addq.b	#8,d1
	move.b	($001e,a1),d2
	lsl.b	#4,d2
	or.b	($001d,a1),d2
	IOCS	_OPMSET
	addq.b	#8,d1
	move.b	($0034,a1),d2
	lsl.b	#4,d2
	or.b	($0033,a1),d2
	IOCS	_OPMSET
	bsr.w	L001e02
	moveq.l	#$80,d1
	or.b	d7,d1
	move.b	($0011,a1),d2
	lsl.b	#6,d2
	or.b	($000b,a1),d2
	IOCS	_OPMSET
	addq.b	#8,d1
	move.b	($0027,a1),d2
	lsl.b	#6,d2
	or.b	($0021,a1),d2
	IOCS	_OPMSET
	addq.b	#8,d1
	move.b	($001c,a1),d2
	lsl.b	#6,d2
	or.b	($0016,a1),d2
	IOCS	_OPMSET
	addq.b	#8,d1
	move.b	($0032,a1),d2
	lsl.b	#6,d2
	or.b	($002c,a1),d2
	IOCS	_OPMSET
	addq.b	#8,d1
	move.b	($0015,a1),d2
	lsl.b	#7,d2
	or.b	($000c,a1),d2
	IOCS	_OPMSET
	addq.b	#8,d1
	move.b	($002b,a1),d2
	lsl.b	#7,d2
	or.b	($0022,a1),d2
	IOCS	_OPMSET
	addq.b	#8,d1
	move.b	($0020,a1),d2
	lsl.b	#7,d2
	or.b	($0017,a1),d2
	IOCS	_OPMSET
	addq.b	#8,d1
	move.b	($0036,a1),d2
	lsl.b	#7,d2
	or.b	($002d,a1),d2
	IOCS	_OPMSET
	addq.b	#8,d1
	move.b	($0014,a1),d2
	lsl.b	#6,d2
	or.b	($000d,a1),d2
	IOCS	_OPMSET
	addq.b	#8,d1
	move.b	($002a,a1),d2
	lsl.b	#6,d2
	or.b	($0023,a1),d2
	IOCS	_OPMSET
	addq.b	#8,d1
	move.b	($001f,a1),d2
	lsl.b	#6,d2
	or.b	($0018,a1),d2
	IOCS	_OPMSET
	addq.b	#8,d1
	move.b	($0035,a1),d2
	lsl.b	#6,d2
	or.b	($002e,a1),d2
	IOCS	_OPMSET
	addq.b	#8,d1
	move.b	($000f,a1),d2
	lsl.b	#4,d2
	or.b	($000e,a1),d2
	IOCS	_OPMSET
	addq.b	#8,d1
	move.b	($0025,a1),d2
	lsl.b	#4,d2
	or.b	($0024,a1),d2
	IOCS	_OPMSET
	addq.b	#8,d1
	move.b	($001a,a1),d2
	lsl.b	#4,d2
	or.b	($0019,a1),d2
	IOCS	_OPMSET
	addq.b	#8,d1
	move.b	($0030,a1),d2
	lsl.b	#4,d2
	or.b	($002f,a1),d2
	IOCS	_OPMSET
	movem.l	(sp)+,d0-d3/a1
	rts

L0022c6:
	movem.l	d0/a0,-(sp)
L0022ca:
	move.b	($0010,a1),($0028,a5)
	move.b	($001b,a1),($002a,a5)
	move.b	($0026,a1),($002c,a5)
	move.b	($0031,a1),($002e,a5)
	move.b	(a1),d0
	andi.w	#$0007,d0
	add.w	d0,d0
	add.w	d0,d0
	lea.l	(L00231a,pc,d0.w),a0
	move.b	(a0)+,($0030,a5)
	move.b	(a0)+,($0032,a5)
	move.b	(a0)+,($0034,a5)
	move.b	(a0)+,($0036,a5)
	move.b	($0001,a1),d0
	lsl.b	#3,d0
	move.b	d0,($0038,a5)
	move.b	($0003,a1),($003a,a5)
	move.b	(a1),($003e,a5)
	movem.l	(sp)+,d0/a0
	rts

L00231a:
	.dc.b	$00,$00,$00,$01,$00,$00,$00,$01
	.dc.b	$00,$00,$00,$01,$00,$00,$00,$01
	.dc.b	$00,$01,$00,$01,$00,$01,$01,$01
	.dc.b	$00,$01,$01,$01,$01,$01,$01,$01
L00233a:
	movem.l	d0-d7/a0-a1,-(sp)
	tst.l	d0
	beq.s	$00002354
	lea.l	(L00568f,pc),a1
	lea.l	(UnknownBlob,pc),a0
	move.w	#$0e9b,d0
	move.b	(a0)+,(a1)+
	dbra.w	d0,$0000234e
	moveq.l	#$00,d2
	moveq.l	#$0f,d1
	IOCS	_OPMSET
	lea.l	(L005386,pc),a5
	moveq.l	#$30,d1			;'0'
	moveq.l	#$14,d2
	moveq.l	#$07,d3
	moveq.l	#$00,d7
	clr.w	(a5)
	clr.b	($0016,a5)
	clr.b	($0018,a5)
	clr.b	($001e,a5)
	clr.b	($0020,a5)
	clr.b	($0026,a5)
	clr.b	($0044,a5)
	clr.b	($0046,a5)
	clr.l	($004c,a5)
	move.b	#$15,($003c,a5)
	move.l	#$01010000,($0050,a5)
	moveq.l	#$00,d0
	bsr.w	L0020f4
	IOCS	_OPMSET
	addq.b	#1,d1
	addq.b	#1,d7
	lea.l	($0056,a5),a5
	dbra.w	d3,$00002368
	movem.l	(sp)+,d0-d7/a0-a1
	rts

L0023b4:
	move.l	a0,-(sp)
	lea.l	(L005286,pc),a0
	moveq.l	#$00,d0
	move.b	d1,d0
	move.b	d2,(a0,d0.w)
	tst.b	($0002,a0)
	bne.s	L0023d0
	movea.l	(sp)+,a0
	move.l	($2e72,pc),-(sp)
	rts

L0023d0:
	movem.l	d1-d3/a1,-(sp)
	move.l	(L00523a,pc),d3
	beq.s	$00002412
	IOCS	_ADPCMSNS
	tst.l	d0
	beq.s	$000023ee
	tst.b	($000e,a0)
	bne.s	$00002416
	moveq.l	#$00,d1
	IOCS	_ADPCMMOD
	move.b	($000d,a0),d1
	lsl.w	#8,d1
	move.b	($0003,a0),d1
	moveq.l	#$00,d0
	move.b	($0002,a0),d0
	lsl.w	#3,d0
	add.l	d3,d0
	movea.l	d0,a1
	move.l	($0004,a1),d2
	beq.s	$00002412
	st.b	(a1)
	movea.l	(a1),a1
	IOCS	_ADPCMOUT
	clr.b	($000e,a0)
	clr.b	($0002,a0)
	movem.l	(sp)+,d1-d3/a1
	movea.l	(sp)+,a0
	rts

L002422:
	movem.l	d1-d7/a0-a6,-(sp)
	movea.l	($0012,a5),a2
	tst.b	(a2)+
	bne.s	$0000242a
	movea.l	a2,a0
	tst.b	(a0)+
	bne.s	$00002430
	move.b	#$20,(-$0001,a0)	;' '
	tst.b	(a0)
	bne.s	$00002430
	clr.b	(UnknownVar1)
L002444:
	bsr.s	L0024ba
	bmi.s	$00002452
L002448:
	bsr.w	L00271a
	bmi.s	$00002452
	bsr.w	L002756
	movem.l	(sp)+,d1-d7/a0-a6
	rts

Start:
	lea.l	(StackTop),sp
	st.b	(UnknownVar1)
	lea.l	($0010,a0),a3
	movea.l	($0008,a0),a4
	addq.l	#1,a2
	clr.l	-(sp)
	DOS	_SUPER
	move.l	d0,(sp)
	bsr.s	L0024ba
	bmi.s	L002496
	bsr.w	L002738
	bmi.s	L002496
	bsr.w	L002756
	bsr.s	L0024a0
	DOS	_SUPER
	addq.l	#4,sp
	lea.l	(L003745,pc),a0
	bsr.w	L002864
	clr.w	-(sp)
	move.l	d7,-(sp)
	DOS	_KEEPPR

L002496:
	DOS	_SUPER
	addq.l	#4,sp
	move.w	#$0001,-(sp)
	DOS	_EXIT2

L0024a0:
	move.l	a1,-(sp)
	moveq.l	#$ff,d0
	lea.l	($1cb6),a0
	bra.s	L0024ac

L0024aa:
	movea.l	(a0),a0
L0024ac:
	cmp.l	(a0),d0
	bne.s	L0024aa
	lea.l	(L000000,pc),a1
	move.l	a1,(a0)
	movea.l	(sp)+,a1
	rts

L0024ba:
	lea.l	(L003ab8,pc),a1
	bra.s	L0024d2

L0024c0:
	move.b	(a2)+,d0
	beq.w	L00267e
	cmp.b	#$20,d0			;' '
	beq.s	L0024d2
	cmp.b	#$09,d0
	bne.s	L0024c0
L0024d2:
	move.b	(a2)+,d0
	cmp.b	#$20,d0			;' '
	beq.s	L0024d2
	cmp.b	#$09,d0
	beq.s	L0024d2
	subq.l	#1,a2
	movea.l	a2,a0
	move.b	(a0)+,d0
	beq.w	L00267e
	cmpi.b	#$2d,d0			;'-'
	beq.s	L002534
	cmpi.b	#$2f,d0			;'/'
	beq.s	L002534
	cmpi.b	#$23,d0			;'#'
	bne.s	L0024c0
	moveq.l	#$00,d1
L0024fe:
	move.b	(a0)+,d0
	beq.s	L002522
	cmp.b	#$30,d0			;'0'
	beq.s	L0024fe
L002508:
	cmp.b	#$30,d0			;'0'
	bcs.s	L002522
	cmp.b	#$39,d0			;'9'
	bhi.s	L002522
	andi.w	#$000f,d0
	mulu.w	#$000a,d1
	add.w	d0,d1
	move.b	(a0)+,d0
	bra.s	L002508

L002522:
	tst.l	d1
	bne.s	L002528
	moveq.l	#$40,d1			;'@'
L002528:
	moveq.l	#$0a,d0
	lsl.l	d0,d1
	move.l	d1,(L003ac6)
	bra.s	L0024c0

L002534:
	move.b	(a0)+,d0
	ori.b	#$20,d0
	cmp.b	#$6b,d0			;'k'
	bne.s	L00254e
	bsr.w	L00263a
	bmi.w	L00262e
	st.b	(a1)
	bra.w	L0024c0

L00254e:
	cmp.b	#$74,d0			;'t'
	bne.s	L002564
	bsr.w	L00263a
	bmi.w	L00262e
	st.b	($0001,a1)
	bra.w	L0024c0

L002564:
	cmp.b	#$6d,d0			;'m'
	bne.s	L00257a
	bsr.w	L00263a
	bmi.w	L00262e
	st.b	($0002,a1)
	bra.w	L0024c0

L00257a:
	cmp.b	#$72,d0			;'r'
	bne.s	L002590
	bsr.w	L00263a
	bmi.w	L00262e
	st.b	($0003,a1)
	bra.w	L0024c0

L002590:
	cmp.b	#$61,d0			;'a'
	bne.s	L0025e0
	bsr.w	L00263a
	bmi.s	L0025a4
	st.b	($0004,a1)
	bra.w	L0024c0

L0025a4:
	moveq.l	#$00,d0
	moveq.l	#$00,d1
L0025a8:
	move.b	(a0),d0
	beq.s	L0025d0
	cmpi.b	#$20,d0			;' '
	beq.s	L0025d0
	cmpi.b	#$09,d0
	beq.s	L0025d0
	subi.b	#$30,d0			;'0'
	bcs.s	L00262e
	beq.s	L0025ce
	cmpi.b	#$0a,d0
	bcc.s	L00262e
	subq.b	#1,d0
	bset.l	d0,d1
	addq.l	#1,a0
	bra.s	L0025a8

L0025ce:
	moveq.l	#$00,d1
L0025d0:
	move.w	d1,(L003ac0)
	move.b	#$01,($0004,a1)
	bra.w	L0024c0

L0025e0:
	cmp.b	#$62,d0			;'b'
	bne.s	L0025f2
	bsr.s	L00263a
	bmi.s	L00262e
	st.b	($0005,a1)
	bra.w	L0024c0

L0025f2:
	cmp.b	#$65,d0			;'e'
	bne.s	L002604
	bsr.s	L00263a
	bmi.s	L00262e
	st.b	($0006,a1)
	bra.w	L0024c0

L002604:
	cmp.b	#$68,d0			;'h'
	bne.s	L002610
	bsr.s	L00263a
	bmi.s	L00262e
	bra.s	L00261a

L002610:
	cmp.b	#$3f,d0			;'?'
	bne.s	L00262e
	bsr.s	L00263a
	bmi.s	L00262e
L00261a:
	lea.l	(L00370e,pc),a0
	bsr.w	L002864
	lea.l	(L003777,pc),a0
	bsr.w	L002864
	moveq.l	#$ff,d0
	rts

L00262e:
	lea.l	(L003a97,pc),a0
	bsr.w	L002864
	moveq.l	#$ff,d0
	rts

L00263a:
	move.b	(a0),d0
	beq.s	L00264c
	cmp.b	#$20,d0			;' '
	beq.s	L00264c
	cmp.b	#$09,d0
	beq.s	L00264c
	moveq.l	#$ff,d0
L00264c:
	rts

L00264e:
	move.w	#$01f0,-(sp)
	DOS	_INTVCG
	addq.l	#2,sp
	movea.l	d0,a0
	cmpi.l	#$4d45574f,(-$0008,a0)	;'MEWO'
	bne.s	L00267a
	cmpi.w	#$504d,(-$0004,a0)	;'PM'
	bne.s	L00267a
	cmpi.w	#$0040,(-$0002,a0)	;'@'
	bcs.s	L002676
	moveq.l	#$00,d0
	rts

L002676:
	moveq.l	#$01,d0
	rts

L00267a:
	moveq.l	#$ff,d0
	rts

L00267e:
	lea.l	(L00370e,pc),a0
	bsr.w	L002864
	tst.b	($0003,a1)
	bne.s	L0026a0
	bsr.s	L00264e
	bmi.s	L00269c
	lea.l	(L0039ad,pc),a0
	bsr.w	L002864
	moveq.l	#$ff,d0
	rts

L00269c:
	moveq.l	#$00,d0
	rts

L0026a0:
	bsr.s	L00264e
	beq.s	L0026ba
	bmi.s	L0026e8
	lea.l	(L0039f4,pc),a0
	bsr.w	L002864
	lea.l	(L003a4e,pc),a0
	bsr.w	L002864
	moveq.l	#$ff,d0
	rts

L0026ba:
	moveq.l	#$f0,d0
	moveq.l	#$ff,d1
	trap	#15
	move.l	d0,d1
	bmi.s	L002708
	lea.l	(L003977,pc),a0
	bsr.w	L002864
	tst.b	d1
	beq.s	L0026dc
	lea.l	(L00398a,pc),a0
	bsr.w	L002864
	moveq.l	#$ff,d0
	rts

L0026dc:
	lea.l	(L003745,pc),a0
	bsr.w	L002864
	moveq.l	#$ff,d0
	rts

L0026e8:
	lea.l	(L0039d3,pc),a0
	bsr.w	L002864
	moveq.l	#$ff,d0
	rts

L0026f4:
	lea.l	(L003a2f,pc),a0
	bsr.w	L002864
	lea.l	(L003a4e,pc),a0
	bsr.w	L002864
	moveq.l	#$ff,d0
	rts

L002708:
	cmp.b	#-$02,d1
	beq.s	L0026f4
	lea.l	(L003a65,pc),a0
	bsr.w	L002864
	moveq.l	#$ff,d0
	rts

L00271a:
	lea.l	(StackBottom,pc),a0
	adda.l	(L003ac6,pc),a0
	move.l	($1c00),d0
	sub.l	#$00020000,d0
	cmpa.l	d0,a0
	bcc.s	L00274a
	move.l	a0,($000e,a5)
	moveq.l	#$00,d0
	rts

L002738:
	lea.l	(StackBottom,pc),a0
	adda.l	(L003ac6,pc),a0
	cmpa.l	a0,a4
	bcs.s	L00274a
	suba.l	a3,a0
	move.l	a0,d7
	rts

L00274a:
	lea.l	(L003a80,pc),a0
	bsr.w	L002864
	moveq.l	#$ff,d0
	rts

L002756:
	lea.l	(L003748,pc),a0
	bsr.w	L002864
	lea.l	(L003aca,pc),a0
	move.w	#$46bd,d0
L002766:
	clr.b	(a0)+
	dbra.w	d0,L002766
	pea.l	(L00040a,pc)
	move.w	#$01f0,-(sp)
	DOS	_INTVCS
	addq.l	#6,sp
	move.l	d0,(L005242)
	move.b	#$3a,(L005276)		;':'
	move.w	#$01ff,(L005278)
	tst.b	($0004,a1)
	beq.s	L002806
	bpl.s	L0027e0
	movem.l	a0-a1,-(sp)
	lea.l	(L001990,pc),a0
	lea.l	(L00196e,pc),a1
	moveq.l	#$32,d0			;'2'
L0027a4:
	move.b	(a0)+,(a1)+
	dbra.w	d0,L0027a4
	lea.l	(L0019ce,pc),a0
	lea.l	(L0019c2,pc),a1
	moveq.l	#$1e,d0
L0027b4:
	move.b	(a0)+,(a1)+
	dbra.w	d0,L0027b4
	lea.l	(L0019f6,pc),a0
	lea.l	(L0019ec,pc),a1
	moveq.l	#$10,d0
L0027c4:
	move.b	(a0)+,(a1)+
	dbra.w	d0,L0027c4
	movem.l	(sp)+,a0-a1
	move.b	#$35,(L005276)		;'5'
	lea.l	(L0038c0,pc),a0
	bsr.w	L002864
	bra.s	L002806

L0027e0:
	move.w	(L003ac0,pc),d0
	move.w	d0,d1
	eori.w	#$01ff,d1
	move.w	d0,(L00527a)
	move.w	d1,(L005278)
	move.b	#$3f,(L005276)		;'?'
	clr.b	(a1)
	lea.l	(L0038df,pc),a0
	bsr.s	L002864
L002806:
	tst.b	(a1)
	beq.s	L002810
	lea.l	(L003900,pc),a0
	bsr.s	L002864
L002810:
	tst.b	($0002,a1)
	beq.s	L002826
	move.l	#L00003a,($00000006).l
	lea.l	(L003921,pc),a0
	bsr.s	L002864
L002826:
	tst.b	($0005,a1)
	beq.s	L002848
	move.w	#$0506,($00000440).l
	move.w	#$50f9,(L000068)
	st.b	(L003ab6)
	lea.l	(L003951,pc),a0
	bsr.s	L002864
L002848:
	lea.l	(L00568f,pc),a2
	lea.l	(UnknownBlob,pc),a0
	move.w	#$0e9b,d0
L002854:
	move.b	(a0)+,(a2)+
	dbra.w	d0,L002854
	moveq.l	#$0d,d1
	IOCS	_OPMDRV
	moveq.l	#$00,d0
	rts

L002864:
	tst.b	($0001,a1)
	bne.s	L002870
	move.l	a0,-(sp)
	DOS	_PRINT
	addq.l	#4,sp
L002870:
	rts


	.data

UnknownBlob:
	.dc.b	$3a,$0f,$02,$00,$dc,$00,$00,$00
	.dc.b	$00,$03,$00,$1c,$04,$00,$05,$01
	.dc.b	$25,$02,$01,$07,$00,$00,$16,$09
	.dc.b	$01,$02,$01,$2f,$02,$0c,$00,$00
	.dc.b	$00,$1d,$04,$03,$06,$01,$25,$01
	.dc.b	$03,$03,$00,$00,$0f,$07,$00,$05
	.dc.b	$0a,$00,$02,$01,$00,$00,$01,$1c
	.dc.b	$0f,$02,$00,$de,$1e,$0a,$00,$00
	.dc.b	$03,$00,$1f,$0a,$01,$03,$0f,$1d
	.dc.b	$00,$07,$03,$00,$00,$1d,$0c,$09
	.dc.b	$07,$0a,$00,$00,$07,$07,$00,$01
	.dc.b	$1f,$05,$01,$03,$0f,$27,$02,$05
	.dc.b	$03,$01,$00,$1c,$0c,$09,$07,$0a
	.dc.b	$00,$00,$07,$03,$00,$01,$1c,$0f
	.dc.b	$02,$00,$b4,$00,$00,$00,$00,$03
	.dc.b	$00,$1f,$0f,$00,$06,$07,$35,$02
	.dc.b	$0f,$05,$01,$00,$1f,$07,$05,$08
	.dc.b	$02,$0d,$03,$01,$00,$00,$01,$1f
	.dc.b	$06,$00,$06,$04,$25,$02,$01,$02
	.dc.b	$00,$00,$1f,$07,$00,$07,$00,$00
	.dc.b	$01,$01,$07,$00,$01,$3a,$0f,$02
	.dc.b	$00,$82,$00,$00,$00,$00,$03,$00
	.dc.b	$1c,$04,$03,$07,$01,$23,$02,$01
	.dc.b	$03,$00,$00,$1b,$08,$01,$02,$00
	.dc.b	$25,$03,$0f,$07,$00,$00,$1c,$03
	.dc.b	$00,$00,$0f,$1b,$02,$01,$06,$00
	.dc.b	$00,$1a,$09,$00,$0a,$0f,$00,$02
	.dc.b	$0a,$00,$00,$01,$0d,$0f,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$03,$00,$1f
	.dc.b	$0a,$0c,$05,$0f,$48,$01,$0e,$02
	.dc.b	$00,$01,$1f,$0a,$0c,$05,$0f,$07
	.dc.b	$01,$04,$07,$00,$01,$1f,$0a,$0c
	.dc.b	$07,$0f,$07,$01,$0c,$07,$00,$01
	.dc.b	$1f,$0a,$0c,$06,$0f,$07,$01,$09
	.dc.b	$03,$00,$01,$32,$0f,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$03,$00,$1f,$00
	.dc.b	$00,$0f,$00,$19,$01,$03,$00,$00
	.dc.b	$00,$1f,$00,$00,$0f,$00,$23,$03
	.dc.b	$0c,$04,$00,$01,$1f,$00,$00,$02
	.dc.b	$00,$24,$01,$01,$00,$00,$00,$1f
	.dc.b	$06,$04,$05,$0f,$00,$02,$01,$04
	.dc.b	$00,$01,$21,$0f,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$03,$00,$1c,$05,$04
	.dc.b	$03,$0f,$2a,$03,$02,$01,$00,$00
	.dc.b	$1f,$07,$04,$01,$02,$25,$01,$03
	.dc.b	$07,$00,$00,$1f,$03,$04,$01,$02
	.dc.b	$23,$03,$03,$04,$00,$00,$1f,$02
	.dc.b	$01,$04,$01,$00,$02,$01,$02,$00
	.dc.b	$00,$3a,$0f,$02,$00,$d2,$00,$00
	.dc.b	$00,$00,$03,$00,$1f,$0d,$01,$04
	.dc.b	$0f,$29,$02,$0f,$03,$00,$00,$1f
	.dc.b	$14,$05,$0f,$0e,$39,$01,$0d,$07
	.dc.b	$02,$00,$14,$0a,$01,$07,$08,$23
	.dc.b	$01,$03,$07,$00,$00,$17,$05,$01
	.dc.b	$07,$0f,$00,$00,$01,$03,$00,$01
	.dc.b	$3a,$0f,$02,$00,$96,$00,$00,$00
	.dc.b	$00,$03,$00,$1f,$0d,$01,$04,$0f
	.dc.b	$20,$01,$00,$07,$00,$00,$1f,$0b
	.dc.b	$01,$0a,$0f,$37,$01,$04,$05,$00
	.dc.b	$00,$1f,$0b,$01,$0a,$0f,$1d,$00
	.dc.b	$00,$02,$00,$00,$1f,$0b,$01,$08
	.dc.b	$0f,$00,$01,$00,$03,$00,$01,$03
	.dc.b	$0f,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$03,$00,$1f,$0e,$01,$0a,$0a,$2a
	.dc.b	$00,$06,$06,$00,$00,$1f,$05,$00
	.dc.b	$0a,$06,$1a,$00,$00,$04,$00,$00
	.dc.b	$1f,$02,$04,$06,$01,$20,$00,$00
	.dc.b	$04,$00,$00,$1c,$01,$06,$08,$01
	.dc.b	$00,$00,$01,$03,$00,$01,$3a,$0f
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$03
	.dc.b	$00,$18,$0a,$00,$02,$05,$1b,$01
	.dc.b	$05,$07,$00,$00,$1a,$10,$00,$08
	.dc.b	$0b,$1e,$00,$0f,$00,$00,$00,$1c
	.dc.b	$10,$00,$04,$03,$20,$00,$01,$06
	.dc.b	$00,$00,$18,$0b,$00,$06,$0f,$00
	.dc.b	$02,$01,$03,$00,$00,$01,$0f,$02
	.dc.b	$00,$c8,$00,$00,$00,$00,$03,$00
	.dc.b	$1f,$1f,$08,$02,$0c,$34,$00,$03
	.dc.b	$07,$00,$00,$1f,$0b,$01,$03,$01
	.dc.b	$23,$01,$09,$03,$00,$00,$1c,$07
	.dc.b	$09,$04,$0f,$11,$00,$01,$01,$00
	.dc.b	$00,$12,$01,$01,$04,$0f,$00,$01
	.dc.b	$01,$00,$00,$01,$3a,$0f,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$03,$00,$1f
	.dc.b	$19,$01,$02,$02,$4c,$00,$06,$00
	.dc.b	$00,$00,$1f,$10,$01,$02,$0d,$1a
	.dc.b	$01,$03,$07,$00,$00,$1f,$04,$02
	.dc.b	$02,$0c,$25,$01,$01,$00,$00,$00
	.dc.b	$1f,$0a,$00,$03,$0f,$00,$01,$01
	.dc.b	$00,$00,$01,$38,$0f,$02,$00,$c8
	.dc.b	$00,$00,$00,$00,$03,$00,$1a,$08
	.dc.b	$05,$07,$02,$1c,$03,$03,$07,$00
	.dc.b	$00,$1d,$04,$05,$05,$01,$1f,$03
	.dc.b	$04,$01,$00,$00,$1c,$04,$02,$06
	.dc.b	$02,$20,$03,$01,$07,$00,$00,$1d
	.dc.b	$09,$03,$03,$01,$00,$03,$01,$03
	.dc.b	$00,$01,$3e,$0f,$02,$00,$02,$08
	.dc.b	$01,$03,$02,$03,$00,$1f,$14,$00
	.dc.b	$0a,$00,$24,$00,$08,$03,$00,$00
	.dc.b	$14,$02,$01,$0a,$03,$00,$00,$02
	.dc.b	$07,$00,$01,$14,$02,$01,$0a,$03
	.dc.b	$00,$00,$01,$01,$00,$01,$14,$02
	.dc.b	$01,$0a,$03,$00,$00,$06,$02,$00
	.dc.b	$01,$3f,$0f,$02,$00,$be,$00,$00
	.dc.b	$00,$00,$03,$00,$1f,$01,$01,$0a
	.dc.b	$00,$1d,$00,$08,$03,$00,$01,$13
	.dc.b	$02,$01,$0a,$01,$02,$00,$03,$07
	.dc.b	$00,$01,$13,$02,$01,$0a,$01,$02
	.dc.b	$00,$01,$00,$00,$01,$13,$02,$01
	.dc.b	$0a,$01,$02,$00,$02,$06,$00,$01
	.dc.b	$1f,$0f,$02,$00,$c8,$03,$02,$02
	.dc.b	$01,$03,$00,$1f,$14,$00,$0f,$0f
	.dc.b	$0c,$00,$07,$00,$00,$01,$1f,$02
	.dc.b	$01,$0f,$00,$05,$00,$03,$02,$00
	.dc.b	$01,$1f,$02,$01,$0f,$00,$07,$00
	.dc.b	$03,$00,$00,$01,$1f,$02,$01,$0f
	.dc.b	$00,$05,$00,$02,$06,$00,$01,$38
	.dc.b	$0f,$02,$00,$b4,$1e,$00,$02,$00
	.dc.b	$03,$00,$1f,$00,$00,$00,$00,$27
	.dc.b	$01,$06,$03,$00,$00,$1f,$03,$01
	.dc.b	$01,$01,$26,$01,$07,$03,$00,$01
	.dc.b	$13,$02,$01,$06,$01,$26,$01,$01
	.dc.b	$07,$00,$00,$10,$00,$00,$09,$00
	.dc.b	$00,$01,$02,$07,$00,$01,$3a,$0f
	.dc.b	$02,$00,$ca,$38,$03,$03,$00,$03
	.dc.b	$00,$14,$02,$00,$05,$01,$21,$01
	.dc.b	$01,$00,$00,$00,$19,$06,$00,$08
	.dc.b	$03,$1e,$01,$05,$07,$00,$00,$1c
	.dc.b	$03,$00,$06,$01,$30,$01,$01,$00
	.dc.b	$00,$00,$0c,$04,$00,$06,$00,$00
	.dc.b	$01,$01,$04,$00,$01,$38,$0f,$02
	.dc.b	$00,$c8,$50,$00,$02,$00,$03,$00
	.dc.b	$12,$1f,$14,$0a,$00,$0a,$01,$0f
	.dc.b	$07,$03,$00,$1f,$11,$0c,$0a,$00
	.dc.b	$23,$01,$06,$07,$00,$00,$0d,$12
	.dc.b	$01,$03,$00,$1b,$02,$01,$07,$00
	.dc.b	$00,$0c,$02,$01,$0a,$01,$00,$01
	.dc.b	$01,$03,$00,$01,$3a,$0f,$02,$00
	.dc.b	$cd,$50,$00,$02,$00,$03,$00,$1e
	.dc.b	$01,$00,$01,$01,$1e,$03,$00,$02
	.dc.b	$00,$00,$1f,$01,$00,$02,$01,$26
	.dc.b	$03,$02,$03,$00,$00,$1e,$01,$00
	.dc.b	$01,$01,$30,$01,$01,$03,$00,$00
	.dc.b	$08,$02,$00,$06,$00,$00,$00,$01
	.dc.b	$04,$00,$01,$3d,$0f,$02,$00,$c8
	.dc.b	$5a,$00,$02,$00,$03,$00,$1f,$01
	.dc.b	$01,$02,$00,$1f,$03,$00,$00,$00
	.dc.b	$00,$09,$01,$00,$06,$00,$00,$00
	.dc.b	$01,$01,$00,$00,$0a,$01,$00,$07
	.dc.b	$00,$00,$00,$01,$01,$00,$00,$09
	.dc.b	$02,$00,$07,$00,$00,$00,$01,$01
	.dc.b	$00,$01,$3c,$0f,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$03,$00,$1f,$16,$01
	.dc.b	$03,$0f,$18,$00,$01,$03,$00,$00
	.dc.b	$12,$0f,$01,$05,$0e,$00,$01,$01
	.dc.b	$07,$00,$01,$1f,$0f,$00,$03,$0f
	.dc.b	$20,$01,$01,$03,$00,$00,$1f,$0f
	.dc.b	$01,$05,$0e,$00,$01,$01,$03,$00
	.dc.b	$01,$06,$0f,$02,$00,$c8,$5a,$00
	.dc.b	$04,$00,$03,$00,$0a,$00,$01,$03
	.dc.b	$00,$4d,$00,$01,$00,$00,$00,$0c
	.dc.b	$00,$00,$05,$00,$07,$02,$03,$03
	.dc.b	$00,$01,$0c,$00,$01,$06,$02,$00
	.dc.b	$01,$02,$07,$00,$01,$12,$00,$00
	.dc.b	$06,$00,$11,$01,$01,$03,$00,$01
	.dc.b	$29,$0f,$02,$00,$ce,$28,$00,$04
	.dc.b	$00,$03,$00,$13,$12,$04,$04,$05
	.dc.b	$42,$00,$06,$03,$03,$00,$15,$0e
	.dc.b	$06,$0a,$06,$34,$00,$04,$07,$03
	.dc.b	$00,$0b,$1f,$03,$0a,$00,$2d,$00
	.dc.b	$01,$07,$00,$00,$0e,$1f,$01,$08
	.dc.b	$00,$00,$00,$01,$03,$00,$01,$24
	.dc.b	$0f,$00,$00,$50,$01,$02,$01,$01
	.dc.b	$03,$00,$14,$02,$01,$05,$03,$24
	.dc.b	$01,$04,$00,$00,$01,$06,$07,$07
	.dc.b	$06,$00,$00,$00,$00,$00,$01,$01
	.dc.b	$14,$02,$01,$05,$03,$25,$03,$04
	.dc.b	$06,$00,$00,$07,$07,$07,$07,$00
	.dc.b	$00,$00,$00,$02,$01,$01,$07,$0f
	.dc.b	$02,$00,$c8,$46,$00,$04,$00,$03
	.dc.b	$00,$00,$00,$00,$00,$00,$7f,$00
	.dc.b	$00,$04,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$7f,$00,$00,$04,$00,$00,$0f
	.dc.b	$0c,$00,$09,$00,$00,$00,$05,$07
	.dc.b	$02,$00,$0d,$0c,$00,$09,$00,$00
	.dc.b	$00,$08,$07,$00,$01,$04,$0f,$02
	.dc.b	$00,$c8,$00,$00,$00,$00,$03,$00
	.dc.b	$12,$0a,$01,$0a,$03,$2f,$01,$02
	.dc.b	$04,$00,$00,$13,$0b,$03,$09,$02
	.dc.b	$00,$00,$02,$04,$00,$00,$12,$0a
	.dc.b	$01,$0a,$05,$4d,$01,$06,$04,$03
	.dc.b	$00,$13,$0b,$03,$09,$02,$00,$00
	.dc.b	$02,$04,$00,$00,$3b,$0f,$02,$00
	.dc.b	$c4,$10,$00,$05,$00,$03,$00,$1c
	.dc.b	$05,$03,$05,$0e,$2a,$03,$02,$07
	.dc.b	$01,$00,$0b,$07,$00,$05,$0f,$33
	.dc.b	$01,$02,$00,$00,$00,$0e,$02,$00
	.dc.b	$04,$02,$30,$03,$01,$03,$00,$00
	.dc.b	$0c,$10,$00,$06,$01,$00,$02,$01
	.dc.b	$00,$00,$01,$3a,$0f,$02,$00,$c6
	.dc.b	$1e,$08,$04,$01,$03,$00,$19,$0b
	.dc.b	$00,$03,$01,$25,$03,$01,$03,$00
	.dc.b	$00,$1c,$0c,$0c,$0b,$05,$25,$03
	.dc.b	$09,$03,$00,$00,$19,$10,$00,$0b
	.dc.b	$01,$2f,$01,$02,$03,$00,$00,$11
	.dc.b	$0a,$00,$0b,$01,$00,$01,$04,$03
	.dc.b	$00,$01,$3a,$0f,$02,$00,$c6,$0b
	.dc.b	$00,$04,$00,$03,$00,$13,$02,$02
	.dc.b	$00,$01,$24,$01,$02,$00,$00,$00
	.dc.b	$1c,$12,$03,$0b,$04,$20,$00,$09
	.dc.b	$00,$00,$00,$1d,$14,$01,$09,$01
	.dc.b	$37,$01,$01,$00,$00,$00,$11,$0f
	.dc.b	$00,$09,$00,$00,$00,$01,$00,$00
	.dc.b	$01,$2c,$0f,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$03,$00,$12,$00,$00,$0a
	.dc.b	$00,$2f,$00,$01,$04,$00,$00,$14
	.dc.b	$00,$00,$0a,$00,$00,$01,$02,$04
	.dc.b	$00,$00,$13,$0e,$00,$0a,$01,$27
	.dc.b	$00,$01,$04,$00,$00,$14,$00,$00
	.dc.b	$0a,$00,$00,$00,$05,$04,$00,$00
	.dc.b	$3a,$0f,$02,$00,$c8,$28,$00,$03
	.dc.b	$00,$03,$00,$12,$00,$00,$06,$00
	.dc.b	$24,$00,$00,$00,$00,$00,$12,$00
	.dc.b	$00,$06,$03,$2f,$00,$04,$00,$01
	.dc.b	$00,$12,$00,$00,$06,$00,$2a,$00
	.dc.b	$00,$00,$00,$00,$0e,$08,$00,$08
	.dc.b	$01,$00,$00,$01,$07,$00,$01,$3a
	.dc.b	$0f,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$03,$00,$0e,$0e,$00,$03,$01,$1b
	.dc.b	$02,$01,$03,$00,$00,$0e,$0e,$00
	.dc.b	$03,$0f,$25,$02,$07,$02,$00,$00
	.dc.b	$0d,$0e,$00,$03,$01,$25,$02,$01
	.dc.b	$04,$00,$00,$13,$03,$00,$0a,$00
	.dc.b	$00,$01,$01,$06,$00,$01,$3a,$0f
	.dc.b	$02,$00,$cd,$00,$00,$00,$00,$03
	.dc.b	$00,$0d,$09,$00,$09,$03,$22,$00
	.dc.b	$01,$04,$00,$00,$1f,$11,$00,$0f
	.dc.b	$0c,$2d,$01,$05,$04,$02,$00,$0c
	.dc.b	$0b,$00,$08,$01,$32,$00,$01,$04
	.dc.b	$00,$00,$0e,$1f,$00,$0a,$00,$01
	.dc.b	$00,$01,$04,$00,$01,$3a,$0f,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$03,$00
	.dc.b	$10,$0c,$00,$08,$00,$1c,$00,$01
	.dc.b	$00,$00,$00,$0e,$0e,$00,$0a,$0f
	.dc.b	$28,$00,$02,$00,$02,$00,$14,$0e
	.dc.b	$00,$0a,$07,$31,$00,$01,$00,$00
	.dc.b	$00,$10,$0e,$00,$08,$01,$00,$00
	.dc.b	$01,$00,$00,$01,$36,$0f,$02,$00
	.dc.b	$cb,$02,$02,$01,$01,$03,$00,$0f
	.dc.b	$0a,$01,$05,$06,$15,$01,$00,$01
	.dc.b	$00,$00,$11,$02,$01,$08,$03,$00
	.dc.b	$00,$01,$03,$00,$01,$1e,$02,$12
	.dc.b	$0a,$05,$00,$02,$01,$07,$00,$01
	.dc.b	$0f,$02,$01,$0a,$05,$00,$02,$00
	.dc.b	$03,$00,$01,$3c,$0f,$00,$00,$c8
	.dc.b	$00,$00,$00,$00,$03,$00,$12,$0c
	.dc.b	$01,$0a,$02,$20,$01,$01,$00,$00
	.dc.b	$00,$12,$0a,$01,$0a,$03,$00,$00
	.dc.b	$01,$01,$00,$01,$0f,$0a,$01,$0a
	.dc.b	$05,$13,$01,$01,$02,$00,$00,$14
	.dc.b	$02,$01,$0a,$03,$07,$00,$01,$06
	.dc.b	$00,$01,$3a,$0f,$02,$00,$ce,$28
	.dc.b	$00,$03,$00,$03,$00,$10,$0f,$00
	.dc.b	$08,$01,$18,$00,$01,$07,$00,$00
	.dc.b	$10,$0c,$00,$04,$01,$3b,$00,$08
	.dc.b	$00,$02,$00,$12,$00,$00,$04,$00
	.dc.b	$33,$00,$01,$00,$00,$00,$10,$00
	.dc.b	$00,$0a,$00,$00,$00,$02,$00,$00
	.dc.b	$01,$38,$0f,$02,$00,$d2,$01,$05
	.dc.b	$03,$01,$03,$00,$12,$00,$00,$03
	.dc.b	$00,$26,$00,$09,$03,$00,$00,$12
	.dc.b	$00,$00,$03,$00,$26,$00,$07,$07
	.dc.b	$00,$00,$0f,$05,$00,$03,$01,$25
	.dc.b	$00,$01,$03,$00,$00,$0f,$08,$00
	.dc.b	$09,$02,$00,$00,$03,$07,$00,$01
	.dc.b	$3b,$0f,$02,$00,$cc,$14,$00,$05
	.dc.b	$00,$03,$00,$1f,$10,$00,$0a,$0f
	.dc.b	$0c,$00,$04,$00,$00,$00,$18,$0a
	.dc.b	$00,$0a,$00,$4d,$00,$02,$00,$00
	.dc.b	$00,$14,$14,$00,$0a,$03,$4d,$00
	.dc.b	$03,$07,$01,$00,$10,$05,$00,$0a
	.dc.b	$07,$00,$00,$04,$00,$00,$01,$3b
	.dc.b	$0f,$02,$00,$c4,$12,$00,$05,$00
	.dc.b	$03,$00,$11,$11,$10,$06,$03,$37
	.dc.b	$00,$04,$04,$01,$00,$0f,$12,$01
	.dc.b	$00,$02,$2f,$00,$02,$04,$00,$00
	.dc.b	$0d,$14,$00,$07,$02,$2f,$00,$02
	.dc.b	$07,$00,$00,$10,$1f,$00,$09,$00
	.dc.b	$00,$00,$01,$04,$00,$01,$02,$0f
	.dc.b	$02,$00,$f4,$2f,$00,$07,$00,$03
	.dc.b	$00,$1f,$00,$00,$0a,$00,$2f,$00
	.dc.b	$06,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$0f,$7f,$00,$01,$00,$00,$00,$1f
	.dc.b	$00,$00,$0a,$00,$2b,$00,$0a,$00
	.dc.b	$00,$00,$14,$08,$00,$0a,$01,$00
	.dc.b	$00,$02,$00,$00,$01,$3b,$0f,$02
	.dc.b	$00,$c8,$50,$00,$03,$00,$03,$00
	.dc.b	$14,$00,$00,$0a,$00,$00,$00,$04
	.dc.b	$00,$00,$00,$0e,$10,$00,$0a,$05
	.dc.b	$3e,$00,$02,$03,$00,$00,$12,$12
	.dc.b	$00,$0a,$09,$26,$00,$03,$00,$01
	.dc.b	$00,$0e,$0c,$00,$0a,$02,$00,$01
	.dc.b	$01,$00,$00,$01,$3c,$0f,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$03,$00,$1f
	.dc.b	$19,$05,$02,$00,$00,$00,$0f,$00
	.dc.b	$00,$00,$1f,$12,$12,$0c,$07,$00
	.dc.b	$00,$01,$00,$00,$01,$1f,$19,$00
	.dc.b	$00,$0f,$00,$00,$03,$00,$01,$00
	.dc.b	$1f,$11,$0f,$0a,$0f,$00,$00,$01
	.dc.b	$00,$00,$01,$02,$0f,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$03,$00,$1e,$10
	.dc.b	$01,$0a,$0f,$2b,$00,$02,$00,$03
	.dc.b	$00,$1e,$0a,$00,$0a,$0f,$2f,$00
	.dc.b	$00,$07,$01,$00,$1e,$14,$00,$0a
	.dc.b	$0f,$0f,$00,$00,$03,$03,$00,$1e
	.dc.b	$13,$00,$0a,$0f,$00,$00,$01,$00
	.dc.b	$00,$01,$00,$0f,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$03,$00,$1e,$1a,$00
	.dc.b	$0d,$0f,$1a,$00,$01,$00,$01,$00
	.dc.b	$1e,$1c,$00,$0e,$0f,$25,$00,$0e
	.dc.b	$00,$03,$00,$1e,$10,$00,$08,$0f
	.dc.b	$05,$00,$00,$00,$01,$00,$1d,$10
	.dc.b	$00,$08,$0f,$00,$00,$00,$00,$00
	.dc.b	$01,$3b,$0f,$02,$00,$6e,$00,$00
	.dc.b	$00,$00,$03,$00,$1c,$14,$0c,$0f
	.dc.b	$0a,$16,$00,$03,$00,$02,$00,$1c
	.dc.b	$13,$05,$02,$0a,$11,$03,$01,$00
	.dc.b	$01,$00,$1c,$0f,$0a,$0a,$05,$11
	.dc.b	$03,$00,$03,$00,$00,$1e,$0c,$07
	.dc.b	$05,$06,$00,$01,$01,$00,$00,$01
	.dc.b	$02,$0f,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$03,$00,$1c,$0c,$00,$04,$0f
	.dc.b	$24,$01,$00,$00,$01,$00,$14,$08
	.dc.b	$00,$04,$0f,$1b,$01,$00,$00,$02
	.dc.b	$00,$1c,$0a,$00,$05,$0f,$22,$00
	.dc.b	$00,$00,$00,$00,$10,$05,$00,$02
	.dc.b	$0f,$00,$03,$00,$00,$00,$01,$3b
	.dc.b	$0f,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$03,$00,$18,$17,$00,$0b,$0f,$00
	.dc.b	$00,$03,$00,$03,$00,$1a,$0e,$00
	.dc.b	$07,$0f,$28,$00,$02,$00,$02,$00
	.dc.b	$1a,$0a,$00,$05,$0f,$39,$00,$02
	.dc.b	$00,$03,$00,$16,$10,$00,$08,$0f
	.dc.b	$00,$02,$06,$00,$00,$01,$32,$0f
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$03
	.dc.b	$00,$1c,$0f,$00,$06,$0f,$1a,$01
	.dc.b	$02,$03,$03,$00,$18,$10,$00,$07
	.dc.b	$0f,$20,$00,$08,$07,$02,$00,$1a
	.dc.b	$0b,$00,$07,$0f,$1d,$01,$05,$03
	.dc.b	$00,$00,$18,$07,$00,$04,$0f,$00
	.dc.b	$02,$02,$07,$03,$01,$03,$0f,$00
	.dc.b	$00,$64,$00,$00,$00,$00,$03,$00
	.dc.b	$1f,$06,$00,$04,$0f,$33,$00,$01
	.dc.b	$00,$03,$00,$1f,$00,$00,$02,$00
	.dc.b	$1b,$00,$08,$07,$02,$00,$1f,$08
	.dc.b	$00,$06,$05,$43,$00,$09,$03,$01
	.dc.b	$00,$1f,$0a,$00,$05,$0f,$00,$00
	.dc.b	$0a,$03,$02,$01,$3b,$0f,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$03,$00,$1e
	.dc.b	$14,$00,$0a,$0f,$1b,$00,$0f,$02
	.dc.b	$00,$00,$1e,$11,$00,$08,$0f,$1b
	.dc.b	$01,$04,$00,$01,$00,$1c,$0c,$00
	.dc.b	$06,$0f,$2b,$01,$02,$03,$02,$00
	.dc.b	$1a,$10,$00,$08,$0f,$00,$01,$02
	.dc.b	$00,$03,$01,$04,$0f,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$03,$00,$1f,$07
	.dc.b	$00,$01,$01,$23,$00,$07,$03,$00
	.dc.b	$00,$1f,$0a,$00,$06,$00,$00,$00
	.dc.b	$02,$07,$00,$01,$1f,$07,$00,$01
	.dc.b	$01,$23,$00,$07,$07,$00,$00,$1f
	.dc.b	$0d,$00,$06,$00,$00,$00,$02,$03
	.dc.b	$00,$01,$04,$0f,$02,$00,$d0,$00
	.dc.b	$00,$00,$00,$03,$00,$0d,$0a,$04
	.dc.b	$04,$0f,$1d,$01,$03,$07,$00,$00
	.dc.b	$11,$07,$00,$04,$0f,$00,$02,$01
	.dc.b	$00,$00,$01,$0e,$08,$05,$03,$0f
	.dc.b	$23,$02,$01,$07,$00,$00,$0f,$08
	.dc.b	$00,$04,$0f,$07,$02,$04,$03,$00
	.dc.b	$01,$1c,$0f,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$03,$00,$1f,$18,$00,$0c
	.dc.b	$0f,$20,$00,$0e,$02,$00,$00,$1f
	.dc.b	$0f,$00,$08,$0f,$00,$00,$02,$00
	.dc.b	$00,$00,$1f,$14,$00,$04,$0f,$1b
	.dc.b	$00,$0f,$00,$00,$00,$1f,$0e,$00
	.dc.b	$05,$0f,$00,$00,$02,$00,$00,$01
	.dc.b	$2c,$0f,$02,$00,$c5,$28,$0d,$02
	.dc.b	$03,$03,$00,$18,$0e,$00,$07,$0f
	.dc.b	$32,$01,$0c,$03,$00,$00,$18,$0a
	.dc.b	$00,$07,$0f,$00,$01,$04,$00,$00
	.dc.b	$01,$1a,$0e,$00,$06,$0f,$39,$01
	.dc.b	$04,$00,$00,$00,$1a,$08,$00,$06
	.dc.b	$0f,$00,$02,$01,$00,$00,$01,$2c
	.dc.b	$0f,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$03,$00,$18,$11,$00,$07,$0f,$2a
	.dc.b	$01,$04,$03,$00,$00,$18,$04,$00
	.dc.b	$02,$0f,$00,$03,$00,$03,$00,$01
	.dc.b	$18,$14,$00,$0a,$0f,$20,$01,$06
	.dc.b	$07,$00,$00,$18,$0c,$00,$06,$0f
	.dc.b	$00,$02,$02,$07,$00,$01,$3b,$0f
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$03
	.dc.b	$00,$1d,$04,$03,$02,$03,$00,$00
	.dc.b	$0e,$00,$01,$00,$1d,$0f,$03,$02
	.dc.b	$07,$1b,$00,$06,$00,$01,$00,$1d
	.dc.b	$17,$00,$0a,$0f,$1b,$00,$07,$00
	.dc.b	$02,$00,$1e,$14,$15,$0f,$0f,$00
	.dc.b	$00,$01,$00,$00,$01,$34,$0f,$02
	.dc.b	$00,$6f,$00,$00,$00,$00,$03,$00
	.dc.b	$1f,$01,$00,$05,$0c,$07,$00,$00
	.dc.b	$00,$03,$00,$1f,$0d,$0f,$0a,$0f
	.dc.b	$0e,$00,$0e,$00,$01,$00,$1f,$16
	.dc.b	$07,$08,$06,$13,$00,$00,$07,$00
	.dc.b	$00,$1f,$14,$14,$08,$0f,$02,$00
	.dc.b	$00,$00,$01,$00,$2c,$0f,$02,$00
	.dc.b	$c8,$00,$00,$00,$00,$03,$00,$1f
	.dc.b	$04,$00,$00,$01,$04,$00,$03,$07
	.dc.b	$01,$00,$1f,$1f,$03,$02,$01,$1d
	.dc.b	$01,$05,$00,$02,$00,$19,$1c,$05
	.dc.b	$03,$03,$07,$00,$01,$07,$02,$00
	.dc.b	$1f,$1f,$05,$03,$07,$00,$02,$07
	.dc.b	$00,$03,$01,$1a,$0f,$02,$00,$c8
	.dc.b	$14,$03,$03,$02,$03,$00,$12,$01
	.dc.b	$01,$0a,$03,$11,$01,$02,$01,$00
	.dc.b	$00,$14,$02,$01,$0a,$00,$0c,$00
	.dc.b	$03,$00,$01,$00,$1f,$13,$01,$00
	.dc.b	$0f,$19,$00,$00,$00,$00,$00,$14
	.dc.b	$02,$01,$0a,$03,$00,$02,$01,$03
	.dc.b	$00,$01,$1c,$03,$02,$00,$d2,$28
	.dc.b	$00,$03,$00,$03,$00,$1f,$10,$00
	.dc.b	$00,$0f,$07,$01,$02,$03,$00,$00
	.dc.b	$1f,$00,$00,$08,$00,$07,$01,$01
	.dc.b	$06,$00,$01,$1f,$00,$00,$08,$00
	.dc.b	$0c,$01,$02,$07,$00,$00,$1f,$00
	.dc.b	$00,$08,$00,$00,$01,$01,$03,$00
	.dc.b	$01,$04,$0f,$01,$00,$9e,$44,$00
	.dc.b	$06,$00,$03,$00,$00,$00,$00,$00
	.dc.b	$0f,$7f,$00,$01,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$0f,$7f,$00,$01,$00
	.dc.b	$00,$01,$1f,$00,$00,$01,$00,$25
	.dc.b	$00,$0e,$00,$00,$00,$10,$00,$00
	.dc.b	$04,$00,$00,$00,$05,$07,$01,$01
	.dc.b	$3a,$0f,$02,$00,$78,$78,$1e,$07
	.dc.b	$02,$03,$00,$1f,$00,$00,$00,$00
	.dc.b	$11,$00,$02,$00,$02,$00,$1f,$00
	.dc.b	$00,$00,$00,$0a,$00,$01,$00,$01
	.dc.b	$00,$1f,$00,$00,$00,$00,$1d,$00
	.dc.b	$01,$00,$02,$00,$0c,$00,$00,$04
	.dc.b	$00,$00,$00,$00,$00,$00,$01,$04
	.dc.b	$0f,$00,$00,$dc,$78,$00,$07,$00
	.dc.b	$03,$00,$1f,$00,$00,$05,$00,$0f
	.dc.b	$00,$00,$00,$03,$00,$14,$00,$00
	.dc.b	$0a,$00,$07,$00,$07,$00,$01,$01
	.dc.b	$0c,$00,$00,$05,$00,$2f,$00,$03
	.dc.b	$00,$03,$00,$10,$00,$00,$08,$00
	.dc.b	$00,$00,$01,$00,$00,$01,$06,$0f
	.dc.b	$03,$00,$d1,$46,$00,$06,$00,$03
	.dc.b	$00,$1f,$00,$00,$00,$00,$19,$00
	.dc.b	$0c,$00,$00,$00,$14,$0e,$00,$07
	.dc.b	$0f,$07,$00,$04,$00,$00,$00,$14
	.dc.b	$0e,$00,$07,$0f,$00,$00,$02,$04
	.dc.b	$03,$00,$14,$0e,$00,$07,$0f,$00
	.dc.b	$00,$02,$04,$00,$00,$20,$0f,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$03,$00
	.dc.b	$1f,$08,$00,$04,$0f,$0d,$00,$03
	.dc.b	$00,$02,$00,$0a,$07,$00,$04,$0f
	.dc.b	$11,$03,$01,$00,$01,$00,$1f,$00
	.dc.b	$00,$00,$00,$03,$00,$01,$00,$02
	.dc.b	$00,$10,$09,$00,$04,$0f,$00,$03
	.dc.b	$00,$00,$00,$01
L00370e:
	.dc.b	$0d,$0a
	.dc.b	'MEW OPM DRIVER ver 0.999････ Copyright 1991,92,93 MEW'
L003745:
	.dc.b	$0d,$0a,$00
L003748:
	.dc.b	'OPM,MOPMのファイル名でＦＭ音源に出力可能です',$0d,$0a,$00
L003777:
	.dc.b	' option(s): #n Get n(KB) buffer',$0d,$0a
	.dc.b	'            -t Don',$27,'t print all message',$0d,$0a
	.dc.b	'            -e Don',$27,'t print error message',$0d,$0a
	.dc.b	'            -r Release MOPMDRV.X',$0d,$0a
	.dc.b	'            -k Enable key control',$0d,$0a
	.dc.b	'            -m Device OPM = Device MOPM',$0d,$0a
	.dc.b	'            -b BASIC mode(?)',$0d,$0a
	.dc.b	'            -a Use OPM Timer A',$0d,$0a
	.dc.b	'      -a???･･･ Set OPM Timer A chanel',$0d,$0a
	.dc.b	$0d,$0a,$00
L0038c0:
	.dc.b	'＜OPM Timer-A を使用します＞',$0d,$0a,$00
L0038df:
	.dc.b	'＜OPM Timer-A&B を使用します＞',$0d,$0a,$00
L003900:
	.dc.b	'＜キーコントロールが可能です＞',$0d,$0a,$00
L003921:
	.dc.b	'＜OPMのファイル名でも拡張機能が使用可能です＞',$0d,$0a,$00
L003951:
	.dc.b	'＜BASICでも拡張機能が使用可能です＞',$0d,$0a,$00
L003977:
	.dc.b	'常駐解除しました。',$00
L00398a:
	.dc.b	'メモリの解放はできませんでした。',$0d,$0a,$00
L0039ad:
	.dc.b	'すでに MOPMDRV.X は常駐しています。',$0d,$0a,$00
L0039d3:
	.dc.b	'MOPMDRV.X は常駐していません。',$0d,$0a,$00
L0039f4:
	.dc.b	'常駐している MOPMDRV.X のバージョンが ver0.40 以下です。',$0d,$0a,$00
L003a2f:
	.dc.b	'ＰＣＭデータが常駐しています。',$00
L003a4e:
	.dc.b	'常駐解除できません。',$0d,$0a,$00
L003a65:
	.dc.b	'常駐解除に失敗しました。',$0d,$0a,$00
L003a80:
	.dc.b	'メモリが足りません。',$0d,$0a,$00
L003a97:
	.dc.b	'スイッチの指定が無効です',$0d,$0a,$00
L003ab2:
	.dc.b	$00,$00,$00,$00
L003ab6:
	.dc.b	$00
UnknownVar1:
	.dc.b	$00
L003ab8:
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
L003ac0:
	.dc.w	$0000
L003ac2:
	.dc.l	StackBottom
L003ac6:
	.dc.l	$00010000

	.bss

L003aca:
	.ds.b	6000
L00523a:
	.ds.b	8
L005242:
	.ds.l	1
L005246:
	.ds.b	4
L00524a:
	.ds.b	4
L00524e:
	.ds.b	4
L005252:
	.ds.l	1
L005256:
	.ds.l	1
L00525a:
	.ds.b	4
L00525e:
	.ds.b	4
L005262:
	.ds.b	2
L005264:
	.ds.b	15
L005273:
	.ds.b	1
L005274:
	.ds.b	1
L005275:
	.ds.b	1
L005276:
	.ds.b	1
L005277:
	.ds.b	1
L005278:
	.ds.w	1
L00527a:
	.ds.b	3
L00527d:
	.ds.b	1
L00527e:
	.ds.b	2
L005280:
	.ds.b	1
L005281:
	.ds.b	3
L005284:
	.ds.b	2
L005286:
	.ds.b	256
L005386:
	.ds.b	774
L00568c:
	.ds.b	1
L00568d:
	.ds.b	1
L00568e:
	.ds.b	1
L00568f:
	.ds.b	11001
StackBottom:
	.ds.b	16384
StackTop:

	.end	Start
