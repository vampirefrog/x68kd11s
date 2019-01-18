;=============================================
;  Filename human.sys
;  Time Stamp Wed Sep 15 00:00:00 1993
;
;  Base address 006800
;  Exec address 006800
;  Text size    00a890 byte(s)
;  Data size    0033ea byte(s)
;  Bss  size    000000 byte(s)
;  1429 Labels
;
;  Commandline dis  -b2 -h -m68030 --sp -q1 -B -M -p -o120 -ghuman.lab --overwrite human.sys human.s
;          DIS version 3.16
;=============================================

	.include	inc/doscall.mac
	.include	inc/iocscall.mac
	.include	inc/fefunc.mac

	.cpu	68030

	.text

Start:
	bra.w	Start2

L006804:
	.dc.w	$0f14,$0400
L006808:
	.dc.b	$19
L006809:
	.dc.b	$19
L00680a:
	.dc.b	$00
L00680b:
	.dc.b	$00
L00680c:
	.dc.w	$0000
L00680e:
	.dc.w	$0000
L006810:
	.dc.l	$00000000
L006814:
	.dc.b	$00
L006815:
	.dc.b	$00
L006816:
	.dc.b	$00
L006817:
	.dc.b	$00
L006818:
	.dc.b	$01
HelloString:
	.dc.b	$1b,'*',$1b,'[1mHuman68k for X680x0',$1b,'[m version 3.02',$0d,$0a
	.dc.b	'Copyright 1987,88,89,90,91,92,93 SHARP/Hudson',$0d,$0a,$00
L006874:
	tst.b	($0cbc)
	bne.s	L006890
	move.l	#L006892,($00b8)
	move.l	#$4b756d61,-(sp)	;'Kuma'
	trap	#14
	addq.l	#4,sp
	move.b	d0,($0cbc)
L006890:
	rts

L006892:
	clr.l	d0
	cmpi.l	#$4b756d61,($0006,sp)	;'Kuma'
	beq.s	$000068a0
	moveq.l	#$03,d0
	rte

Start2:
	movea.l	#Start,sp
	bsr.s	L006874
	bsr.w	L0078fc
	bsr.w	L007902
	bsr.w	L008290
	bsr.w	L007e70
	move.l	a1,($1c1c)
	tst.b	($1c75)
	beq.s	L006928
	move.b	($1c15),d0
	add.b	d0,(L0083f2)
	bsr.w	L007a7c
	bsr.w	L0081e2
	bsr.w	L006bdc
	bsr.w	L008216
	bsr.w	L006ac2
	bsr.w	L006cb0
	bsr.w	L006b3c
	bsr.w	L006c6e
	bsr.w	L0076aa
	bsr.w	L0077fc
	bsr.w	L0077c0
	bsr.w	L006cc8
	bsr.w	L006a96
	pea.l	(Call_CTRLVC_ERRJVC_EXITVC)
	move.w	#$fff1,-(sp)
	DOS	_INTVCS
	addq.l	#6,sp
	bsr.w	L006cf8
	bsr.w	L006d10
	bsr.w	L006a88
	move.b	(L014074),($1c12)
	bra.w	L008472

L006928:
	lea.l	(Start),sp
	IOCS	_OS_CURON
	lea.l	(L007e32),a1
	IOCS	_B_PRINT
	clr.l	d0
	trap	#15
L006940:
	move.l	#$58363800,d0		;'X68'<<8
	trap	#10
	bra.s	L006940

L00694a:
	clr.l	d0
L00694c:
	move.b	d0,(a1)+
	dbra.w	d1,L00694c
	rts

L006954:
	tst.l	d7
	bmi.s	L006986
	bsr.w	L006a1c
L00695c:
	moveq.l	#$09,d1
	bsr.w	L006a2a
	bne.s	L006986
	movea.l	a0,a1
	movea.l	a6,a5
L006968:
	move.b	(a1)+,d1
	beq.s	L006978
	move.b	(a5)+,d0
	or.b	#$20,d0
	cmp.b	d0,d1
	beq.s	L006968
	bra.s	L00695c

L006978:
	move.b	(a5)+,d0
	cmp.b	#$20,d0			;' '
	beq.s	L006978
	cmp.b	#$3d,d0			;'='
	bne.s	L00695c
L006986:
	rts

L006988:
	cmpi.b	#$20,(a5)		;' '
	bne.s	L006992
	addq.l	#1,a5
	bra.s	L006988

L006992:
	movea.l	a5,a0
	move.l	a1,-(sp)
	movea.l	a0,a1
L006998:
	move.b	(a0)+,d0
	beq.s	L0069b4
L00699c:
	move.b	d0,(a1)+
	cmp.b	#$20,d0			;' '
	bne.s	L006998
	clr.b	(-$0001,a1)
L0069a8:
	move.b	(a0)+,d0
	beq.s	L0069b4
	cmp.b	#$20,d0			;' '
	beq.s	L0069a8
	bra.s	L00699c

L0069b4:
	clr.b	(a1)+
	clr.b	(a1)
	movea.l	(sp)+,a1
	rts

L0069bc:
	movem.l	a0/a5,-(sp)
L0069c0:
	move.b	(a5)+,d0
	cmp.b	#$20,d0			;' '
	bcs.s	L0069cc
	move.b	d0,(a0)+
	bra.s	L0069c0

L0069cc:
	clr.b	(a0)
	movem.l	(sp)+,a0/a5
	rts

L0069d4:
	clr.l	d1
	bra.s	L0069da

L0069d8:
	moveq.l	#$20,d1			;' '
L0069da:
	move.b	(a5)+,d0
	beq.s	L0069f2
	cmp.b	#$20,d0			;' '
	beq.s	L0069da
L0069e4:
	move.b	d0,(a0)+
	move.b	(a5)+,d0
	beq.s	L0069f2
	cmp.b	d1,d0
	bne.s	L0069e4
	clr.b	(a0)
	rts

L0069f2:
	clr.b	(a0)
	subq.l	#1,a5
	rts

L0069f8:
	clr.l	d0
	clr.l	d1
L0069fc:
	move.b	(a5)+,d0
	cmp.b	#$20,d0			;' '
	beq.s	L0069fc
L006a04:
	sub.b	#$30,d0			;'0'
	cmp.b	#$0a,d0
	bcc.s	L006a18
	mulu.w	#$000a,d1
	add.l	d0,d1
	move.b	(a5)+,d0
	bra.s	L006a04

L006a18:
	move.l	d1,d0
	rts

L006a1c:
	clr.w	-(sp)
	clr.l	-(sp)
	move.w	d7,-(sp)
	DOS	_SEEK
	lea.l	($0008,sp),sp
	rts

L006a2a:
	movea.l	a6,a5
L006a2c:
	bsr.s	L006a66
	bne.s	L006a52
	cmp.b	#$1a,d0
	beq.s	L006a52
	cmp.b	d1,d0
	bne.s	L006a3c
	moveq.l	#$20,d0			;' '
L006a3c:
	move.b	d0,(a5)+
	cmp.b	#$0a,d0
	bne.s	L006a2c
	clr.b	(a5)
	clr.b	-(a5)
	cmpi.b	#$0d,-(a5)
	bne.s	L006a50
	clr.b	(a5)
L006a50:
	rts

L006a52:
	cmpa.l	a6,a5
	beq.s	L006a5e
	moveq.l	#$1a,d0
	clr.b	(a5)+
	clr.b	(a5)
	rts

L006a5e:
	clr.b	(a5)+
	clr.b	(a5)
	moveq.l	#$ff,d0
	rts

L006a66:
	clr.w	-(sp)
	move.l	sp,d0
	move.l	#$00000001,-(sp)
	move.l	d0,-(sp)
	move.w	d7,-(sp)
	DOS	_READ
	lea.l	($0006,sp),sp
	cmp.l	(sp)+,d0
	bne.s	L006a82
	move.b	(sp),d0
	cmp.b	d0,d0
L006a82:
	lea.l	($0002,sp),sp
	rts

L006a88:
	move.w	#$0003,-(sp)
	move.w	#$0002,-(sp)
	DOS	_CONCTRL
	addq.l	#4,sp
	rts

L006a96:
	move.l	($1c24),d0
	add.l	#$00001fff,d0
	and.l	#$00ffe000,d0
	move.l	d0,(L00837a)
	lsr.l	#8,d0
	lsr.l	#5,d0
	subq.w	#1,d0
	cmp.w	#$0100,d0
	bcs.s	L006aba
	moveq.l	#$ff,d0
L006aba:
	move.b	d0,($00e86001)
	rts

L006ac2:
	tst.b	(L006818)
	beq.s	L006b3a
	move.w	#$0004,-(sp)
	pea.l	(L007a8c)
	pea.l	($00ea0044)
	DOS	_MEMCPY
	movea.l	(sp)+,a0
	addq.l	#6,sp
	tst.l	d0
	bne.s	L006af2
	cmpi.l	#$53435349,(a0)+	;'SCSI'
	bne.s	L006af2
	cmpi.w	#$4558,(a0)		;'EX'
	beq.s	L006b1a
L006af2:
	move.w	#$0004,-(sp)
	pea.l	(L007a8c)
	pea.l	($00fc0024)
	DOS	_MEMCPY
	movea.l	(sp)+,a0
	addq.l	#6,sp
	tst.l	d0
	bne.s	L006b3a
	cmpi.l	#$53435349,(a0)+	;'SCSI'
	bne.s	L006b3a
	cmpi.w	#$494e,(a0)		;'IN'
	bne.s	L006b3a
L006b1a:
	lea.l	(-$0028,a0),a0
	move.l	a0,d1
	IOCS	_BOOTINF
	eor.l	d1,d0
	and.l	#$00ffff00,d0
	beq.s	L006b3a
	movea.l	($1c1c),a2
	bsr.w	L006fea
	move.l	a2,($1c1c)
L006b3a:
	rts

L006b3c:
	tst.b	(L007c02)
	beq.w	L006bd0
	bsr.w	L006a96
	move.l	#$00000200,-(sp)
	DOS	_MALLOC
	addq.l	#4,sp
	tst.l	d0
	bmi.s	L006bd0
	movea.l	d0,a0
	pea.l	(a0)
	pea.l	($0080,a0)
	lea.l	($0200,a0),a1
	move.l	a1,usp
	lea.l	(L007ba6),a1
	moveq.l	#$10,d1
L006b6e:
	move.l	(a1)+,(a0)+
	dbra.w	d1,L006b6e
	pea.l	(Call_CTRLVC_ERRJVC_EXITVC)
	move.w	#$fff1,-(sp)
	DOS	_INTVCS
	addq.l	#6,sp
	bsr.w	L006cf8
	pea.l	(L007c02)
	move.w	#$0002,-(sp)
	DOS	_EXEC
	tst.l	d0
	bmi.s	L006bc8
	bsr.w	L0078f6
	move.w	#$0000,(sp)
	DOS	_EXEC
	move.l	d0,-(sp)
	bsr.w	L0078fc
	move.l	(sp)+,d0
	bmi.s	L006bc8
	cmp.l	#$00010000,d0
	bcc.s	L006bd2
	tst.w	d0
	bne.s	L006bc8
	lea.l	(SysStr),a0
	move.b	#$54,(a0)+		;'T'
	move.b	#$4d,(a0)+		;'M'
	move.b	#$50,(a0)		;'P'
L006bc8:
	lea.l	($000a,sp),sp
	DOS	_MFREE
	addq.l	#4,sp
L006bd0:
	rts

L006bd2:
	pea.l	(L007def)
	DOS	_PRINT
L006bda:
	bra.s	L006bda

L006bdc:
	lea.l	(-$00c8,sp),sp
	movea.l	sp,a6
	move.w	($00006806).l,($1c70)
	clr.l	d0
	move.b	d0,(L007c02)
	clr.l	d2
	clr.l	d3
	clr.l	d4
	move.b	(L006804),d2
	move.b	($00006805).l,d3
	move.b	(L006808),d4
	bsr.w	L00769c
	move.l	d0,d7
	bmi.s	L006c36
	bsr.w	L007662
	bsr.w	L00758c
	bsr.w	L0075e0
	movem.l	d2-d4,-(sp)
	bsr.w	L007614
	bsr.w	L00763c
	bsr.w	L006eb8
	bsr.w	L006ee0
	movem.l	(sp)+,d2-d4
L006c36:
	addq.w	#2,d2
	move.w	d2,($1c6e)
	move.b	d3,($1c72)
	move.b	d4,($1c73)
	clr.l	d0
	move.w	($1c70),d0
	add.w	#$0010,d0
	mulu.w	d3,d0
	add.l	($1c24),d0
	move.l	d2,d1
	subq.l	#5,d1
	mulu.w	#$0062,d1
	add.l	d1,d0
	add.l	#$00010000,d0
	cmp.l	($1c00),d0
	bcc.w	L006928
	bra.s	L006ce4

L006c6e:
	lea.l	(-$00c8,sp),sp
	movea.l	sp,a6
	bsr.w	L00769c
	move.l	d0,d7
	bsr.w	L006e80
	bsr.w	L006e8e
	bsr.w	L006e9c
	bsr.w	L007236
	bsr.w	L0072e0
	bsr.w	L00735c
	bsr.w	L007284
	bsr.w	L007204
	bsr.w	L00725c
	bsr.w	L00718e
	bsr.w	L0073e6
	bsr.w	L00748c
	bsr.w	L0074ea
	bra.s	L006ce4

L006cb0:
	movea.l	($1c1c),a2
	clr.l	d6
L006cb6:
	lea.l	(L007e6b),a5
	bsr.w	L006f38
	beq.s	L006cb6
	move.l	a2,($1c1c)
	rts

L006cc8:
	lea.l	(-$00c8,sp),sp
	movea.l	sp,a6
	bsr.w	L00769c
	move.l	d0,d7
	bmi.s	L006cf2
	movea.l	($1c1c),a2
L006cda:
	bsr.w	L006f6c
	beq.s	L006cda
	move.l	a2,($1c1c)
L006ce4:
	move.w	d7,-(sp)
	bmi.s	L006cea
	DOS	_CLOSE
L006cea:
	addq.l	#2,sp
	lea.l	($00c8,sp),sp
	rts

L006cf2:
	lea.l	($00c8,sp),sp
	rts

L006cf8:
	movea.l	#$000000a8,a0
	lea.l	(L0083be),a1
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0),(a1)
	rts

L006d10:
	move.l	#$000000f0,-(sp)
	DOS	_MALLOC
	addq.l	#4,sp
	move.l	d0,(L011090)
	bmi.w	L006928
	movea.l	d0,a0
	lea.l	($00f0,a0),a0
	move.l	a0,usp
	movea.l	($1c50),a6
	cmpa.l	#$00000000,a6
	beq.s	L006d3c
	move.l	a0,($000c,a6)
L006d3c:
	lea.l	(-$00c8,sp),sp
	movea.l	sp,a6
	bsr.w	L00769c
	move.l	d0,d7
	bmi.s	L006cf2
	bsr.s	L006d56
	bsr.w	L006e0a
	bsr.w	L006f20
	bra.s	L006ce4

L006d56:
	lea.l	(EnvsetStr),a0
	bsr.w	L006954
	bne.w	L006e08
	bsr.w	L0069f8
	cmp.l	#$00000200,d0
	bcs.w	L006dfe
	cmp.l	#$00010000,d0
	bcc.w	L006dfe
	move.l	d0,d3
	move.l	d3,-(sp)
	DOS	_MALLOC
	addq.l	#4,sp
	move.l	d0,d4
	bmi.s	L006dfe
	move.l	d4,(L008382)
	movea.l	d4,a0
	move.l	d3,(a0)+
	clr.w	(a0)
	move.b	(-$0001,a5),d0
	beq.s	L006e08
	bsr.w	L007658
	subq.l	#1,a5
	clr.w	-(sp)
	move.l	a5,-(sp)
	DOS	_OPEN
	addq.l	#6,sp
	tst.l	d0
	bmi.s	L006dfe
	movem.l	d7,-(sp)
	move.l	d0,d7
L006db2:
	moveq.l	#$20,d1			;' '
	bsr.w	L006a2a
	bne.s	L006df2
	movea.l	a6,a5
L006dbc:
	move.b	(a5)+,d0
	beq.s	L006de0
	cmp.b	#$3d,d0			;'='
	bne.s	L006dbc
	clr.b	(-$0001,a5)
	move.l	a5,-(sp)
	clr.l	-(sp)
	move.l	a6,-(sp)
	DOS	_SETENV
	lea.l	($000c,sp),sp
	tst.l	d0
	bpl.s	L006db2
	move.b	#$3d,(-$0001,a5)	;'='
L006de0:
	movea.l	a6,a0
	bsr.w	L007134
	lea.l	(CannotRegisterEnvVarStr),a0
	bsr.w	L007134
	bra.s	L006db2

L006df2:
	move.w	d7,-(sp)
	DOS	_CLOSE
	addq.l	#2,sp
	movem.l	(sp)+,d7
	rts

L006dfe:
	lea.l	(EnvsetStr),a0
	bsr.w	L00768c
L006e08:
	rts

L006e0a:
	bsr.w	L006a1c
L006e0e:
	lea.l	(ProgramStr),a0
	bsr.w	L00695c
	bne.s	L006e7e
	lea.l	(TitleSysStr),a0
	bsr.w	L0069d4
	move.l	(L008382),-(sp)
	move.l	(L011090),-(sp)
	pea.l	(TitleSysStr)
	move.w	#$0002,-(sp)
	DOS	_EXEC
	lea.l	($000e,sp),sp
	tst.l	d0
	bmi.s	L006e6c
	movem.l	d7/a6,-(sp)
	move.l	(L008382),-(sp)
	move.l	(L011090),-(sp)
	pea.l	(TitleSysStr)
	move.w	#$0000,-(sp)
	DOS	_EXEC
	lea.l	($000e,sp),sp
	movem.l	(sp)+,d7/a6
	tst.l	d0
	bpl.s	L006e0e
L006e6c:
	movea.l	a6,a0
	bsr.w	L007134
	lea.l	(CannotStartStr),a0
	bsr.w	L007134
	bra.s	L006e0e

L006e7e:
	rts

L006e80:
	pea.l	(TitleSysStr)
	lea.l	(TitleStr),a0
	bra.s	L006ea8

L006e8e:
	pea.l	(KeySysStr)
	lea.l	(KeyStr),a0
	bra.s	L006ea8

L006e9c:
	pea.l	(UskcgSysStr)
	lea.l	(UskcgStr),a0
L006ea8:
	bsr.w	L006954
	movem.l	(sp)+,a0
	bne.s	L006eb6
	bsr.w	L0069d8
L006eb6:
	rts

L006eb8:
	lea.l	(CttyStr),a0
	bsr.w	L006954
	bne.s	L006ede
	lea.l	(L013d1a),a0
	lea.l	(L013d24),a1
	moveq.l	#$02,d1
	move.w	#$0303,d0
L006ed6:
	move.w	d0,(a0)+
	move.w	d0,(a1)+
	dbra.w	d1,L006ed6
L006ede:
	rts

L006ee0:
	movem.l	d0-d7/a0-a6,-(sp)
	lea.l	(RomdbStr),a0
	bsr.w	L006954
	bne.s	L006f1a
	IOCS	_ROMVER
	cmp.l	#$12920101,d0
	bcc.s	L006f04
	jsr	($00fe0000)
	bra.s	L006f1a

L006f04:
	movea.l	($00ff0008),a0
	cmpa.l	#$01000000,a0
	bcc.s	L006f1a
	movea.l	#$00001000,a6
	jsr	(a0)
L006f1a:
	movem.l	(sp)+,d0-d7/a0-a6
	rts

L006f20:
	lea.l	(ShellStr),a0
	bsr.w	L006954
	bne.s	L006f36
	lea.l	(L011096),a0
	bsr.w	L0069d4
L006f36:
	rts

L006f38:
	add.w	#$0100,d6
	lea.l	(-$005a,sp),sp
	movea.l	sp,a0
	move.l	#$48756d61,(a0)		;'Huma'
	move.l	#$6e2e7379,($0004,a0)	;'n.sy'
	move.l	#$73000000,($0008,a0)
	movea.l	($1c24),a1
	move.l	d6,d0
	bsr.w	L007170
	bpl.s	L006fa6
	tst.l	d0
	lea.l	($005a,sp),sp
	rts

L006f6c:
	lea.l	(DeviceStr),a0
	bsr.w	L00695c
	bne.w	L00713e
	bsr.w	L006988
	lea.l	(-$005a,sp),sp
	movea.l	sp,a0
	bsr.w	L0069bc
	move.l	(a0),d0
	or.l	#$00202020,d0
	cmp.l	#$5b726f6d,d0		;'[rom'
	beq.s	L006fce
	movea.l	($1c24),a1
	clr.l	d0
	bsr.w	L007170
	bmi.w	L007128
L006fa6:
	tst.l	d0
	beq.s	L006fc6
	move.l	a5,d0
	lea.l	(-$001a,sp),sp
	movea.l	sp,a5
	bsr.w	L007140
	tst.b	($0003,a5)
	bne.w	L007122
	bsr.w	L0070ba
	lea.l	($001a,sp),sp
L006fc6:
	lea.l	($005a,sp),sp
	clr.l	d0
	rts

L006fce:
	addq.l	#4,a0
	bsr.s	L00702e
	tst.l	d1
	bmi.s	L006fe0
	cmp.b	#$5d,d0			;']'
	bne.s	L006fe0
	bsr.s	L006fea
	beq.s	L006fe4
L006fe0:
	bra.w	L007126

L006fe4:
	lea.l	($005a,sp),sp
	rts

L006fea:
	movem.l	d1/a0-a1/a5-a6,-(sp)
	movea.l	d1,a0
	lea.l	(L007a8c),a1
	moveq.l	#$04,d1
	bsr.w	L00e28a
	movem.l	(sp)+,d1/a0-a1/a5-a6
	tst.l	d0
	bne.s	L007028
	lea.l	(-$001a,sp),sp
	movea.l	sp,a5
	movea.l	a2,a1
	move.l	d1,d0
	move.b	($1c15),d2
	bsr.w	L007f0c
	move.b	d2,($1c15)
	lea.l	($001a,sp),sp
	cmpa.l	a1,a2
	beq.s	L007028
	movea.l	a1,a2
	clr.l	d0
	rts

L007028:
	moveq.l	#$ff,d0
	tst.l	d0
	rts

L00702e:
	clr.l	d1
	move.b	(a0)+,d1
	cmp.b	#$24,d1			;'$'
	beq.s	L00707e
	sub.b	#$30,d1			;'0'
	cmp.b	#$0a,d1
	bcc.s	L007052
	move.b	(a0),d0
	lsl.l	#2,d1
	lea.l	(L007056),a0
	move.l	(a0,d1.w),d1
	rts

L007052:
	moveq.l	#$ff,d1
	rts

L007056:
	.dc.w	$00bf,$fffc,$00fe,$4ffc
	.dc.w	$00ee,$0000,$00ee,$4000
	.dc.w	$00ee,$8000,$00ee,$c000
	.dc.w	$00ef,$0000,$00ef,$4000
	.dc.w	$00ef,$8000,$00ef,$c000
L00707e:
	clr.l	d1
L007080:
	move.b	(a0),d0
	cmp.b	#$30,d0			;'0'
	bcs.s	L0070b8
	cmp.b	#$3a,d0			;':'
	bcs.s	L0070ac
	cmp.b	#$41,d0			;'A'
	bcs.s	L0070b8
	cmp.b	#$47,d0			;'G'
	bcs.s	L0070aa
	cmp.b	#$61,d0			;'a'
	bcs.s	L0070b8
	cmp.b	#$67,d0			;'g'
	bcc.s	L0070b8
	sub.b	#$20,d0			;' '
L0070aa:
	subq.b	#7,d0
L0070ac:
	addq.l	#1,a0
	sub.b	#$30,d0			;'0'
	lsl.l	#4,d1
	or.b	d0,d1
	bra.s	L007080

L0070b8:
	rts

L0070ba:
	move.l	($000e,a5),d0
	add.l	#$00010000,d0
	cmp.l	($1c00),d0
	bcc.w	L006928
	sub.l	#$00010022,d0
	cmp.l	a1,d0
	bcs.w	L006928
	move.l	($000e,a5),($1c24)
	move.l	a1,(a2)
L0070e0:
	move.l	a2,-(sp)
	btst.b	#$07,($0004,a1)
	bne.s	L007110
	movea.l	a5,a0
	bsr.w	L0082d0
	bmi.s	L007104
	bsr.w	L008248
	bpl.s	L007114
L0070f8:
	lea.l	(L007dbd),a0
	bsr.s	L007134
	bra.w	L006928

L007104:
	lea.l	(L007d94),a0
	bsr.s	L007134
	bra.w	L006928

L007110:
	bsr.w	L00ac0a
L007114:
	movea.l	(sp)+,a2
	move.l	(a1),d1
	bmi.s	L00711e
	movea.l	d1,a1
	bra.s	L0070e0

L00711e:
	movea.l	a1,a2
	rts

L007122:
	lea.l	($001a,sp),sp
L007126:
	movea.l	sp,a0
L007128:
	bsr.s	L007134
	lea.l	($005a,sp),sp
	lea.l	(L007d7b),a0
L007134:
	move.l	a0,-(sp)
	DOS	_PRINT
	movea.l	(sp)+,a0
	clr.l	d0
	rts

L00713e:
	rts

L007140:
	move.b	#$16,($0000.w,a5)
	move.b	#$00,($0002,a5)
	btst.b	#$05,($0004,a1)
	beq.s	L00715a
	move.b	#$40,($0002,a5)		;'@'
L00715a:
	move.l	d0,($0012,a5)
	move.b	($1c75),d0
	addq.b	#1,d0
	move.b	d0,($0016,a5)
	move.l	a1,d1
	movea.l	d1,a1
	bra.w	L00defa

L007170:
	or.b	#$03,d0
	adda.l	#$03000000,a0
	move.l	($1c00),-(sp)
	move.l	a1,-(sp)
	move.l	a0,-(sp)
	move.w	d0,-(sp)
	DOS	_EXEC
	lea.l	($000e,sp),sp
	tst.l	d0
	rts

L00718e:
	lea.l	(BellStr),a0
	bsr.w	L006954
	bne.s	L0071f8
	bsr.w	L006988
	clr.w	-(sp)
	move.l	a5,-(sp)
	DOS	_OPEN
	addq.l	#6,sp
	tst.l	d0
	bmi.s	L0071fa
	move.w	d0,d2
	movea.l	($1c24),a0
	move.l	#$0000ffff,-(sp)
	move.l	a0,-(sp)
	move.w	d2,-(sp)
	DOS	_READ
	lea.l	($000a,sp),sp
	move.l	d0,-(sp)
	move.w	d2,-(sp)
	DOS	_CLOSE
	addq.l	#2,sp
	move.l	(sp)+,d0
	bmi.s	L0071fa
	movem.l	d0-d2,-(sp)
	move.w	d0,d2
	move.l	a0,d1
	moveq.l	#$39,d0			;'9'
	trap	#15
	movem.l	(sp)+,d0-d2
	addq.l	#1,d0
	bclr.l	#$00,d0
	adda.l	d0,a0
	move.l	a0,($1c24)
	move.l	a0,d0
	add.l	#$00010000,d0
	cmp.l	($1c00),d0
	bcc.w	L006928
L0071f8:
	rts

L0071fa:
	lea.l	(BellStr),a0
	bra.w	L00768c

L007204:
	lea.l	(NewfatStr),a0
	bsr.w	L006954
	bne.s	L00722a
	bsr.w	L0069f8
	tst.l	d0
	beq.s	L007220
	cmp.l	#$00000002,d0
	bne.s	L00722c
L007220:
	move.b	d0,($1c0b)
	move.b	d0,(L00cc2a)
L00722a:
	rts

L00722c:
	lea.l	(NewfatStr),a0
	bra.w	L00768c

L007236:
	lea.l	(FflushStr),a0
	bsr.w	L006954
	bne.s	L007250
	bsr.w	L006988
	bsr.s	L0072aa
	tst.w	d0
	bmi.s	L007252
	move.b	d0,($1cba)
L007250:
	rts

L007252:
	lea.l	(FflushStr),a0
	bra.w	L00768c

L00725c:
	lea.l	(DirschStr),a0
	bsr.w	L006954
	bne.s	L007278
	bsr.w	L006988
	bsr.s	L0072aa
	tst.w	d0
	bmi.s	L00727a
	move.b	d0,(L01120a)
L007278:
	rts

L00727a:
	lea.l	(DirschStr),a0
	bra.w	L00768c

L007284:
	lea.l	(VerifyStr),a0
	bsr.w	L006954
	bne.s	L00729e
	bsr.w	L006988
	bsr.s	L0072aa
	tst.w	d0
	bmi.s	L0072a0
	move.w	d0,($1c10)
L00729e:
	rts

L0072a0:
	lea.l	(VerifyStr),a0
	bra.w	L00768c

L0072aa:
	move.b	(a5)+,d0
	or.b	#$20,d0
	cmp.b	#$6f,d0			;'o'
	bne.s	L0072d8
	move.b	(a5)+,d0
	or.b	#$20,d0
	cmp.b	#$6e,d0			;'n'
	beq.s	L0072dc
	cmp.b	#$66,d0			;'f'
	bne.s	L0072d8
	move.b	(a5)+,d0
	or.b	#$20,d0
	cmp.b	#$66,d0			;'f'
	bne.s	L0072d8
	clr.l	d0
	rts

L0072d8:
	moveq.l	#$ff,d0
	rts

L0072dc:
	moveq.l	#$01,d0
	rts

L0072e0:
	lea.l	(OffStr),a0
	bsr.w	L006954
	bne.s	L00735a
	bsr.w	L006988
L0072f0:
	move.b	(a5)+,d0
	beq.s	L00735a
	cmp.w	#$0009,d0
	beq.s	L0072f0
	cmp.w	#$0020,d0		;' '
	beq.s	L0072f0
	cmp.w	#$002c,d0		;','
	beq.s	L0072f0
	or.b	#$20,d0
	cmp.b	#$63,d0			;'c'
	beq.s	L007332
	cmp.b	#$6e,d0			;'n'
	beq.s	L00733a
	cmp.b	#$70,d0			;'p'
	beq.s	L007342
	cmp.b	#$71,d0			;'q'
	beq.s	L00734a
	cmp.b	#$73,d0			;'s'
	beq.s	L007352
	lea.l	(OffStr),a0
	bra.w	L00768c

L007332:
	move.w	#$0103,($1cbc)
	bra.s	L0072f0

L00733a:
	move.w	#$010e,($1cbe)
	bra.s	L0072f0

L007342:
	move.w	#$0110,($1cc0)
	bra.s	L0072f0

L00734a:
	move.w	#$0111,($1cc2)
	bra.s	L0072f0

L007352:
	move.w	#$0113,($1cc4)
	bra.s	L0072f0

L00735a:
	rts

L00735c:
	lea.l	(BreakStr),a0
	bsr.w	L006954
	bne.s	L0073a6
	bsr.w	L006988
	move.b	(a5)+,d0
	or.b	#$20,d0
	cmp.b	#$6b,d0			;'k'
	beq.s	L0073b8
	cmp.b	#$6f,d0			;'o'
	bne.s	L0073a6
	move.b	(a5)+,d0
	or.b	#$20,d0
	cmp.b	#$6e,d0			;'n'
	beq.s	L0073ae
	cmp.b	#$66,d0			;'f'
	bne.s	L00739c
	move.b	(a5)+,d0
	or.b	#$20,d0
	cmp.b	#$66,d0			;'f'
	beq.s	L0073a6
L00739c:
	lea.l	(BreakStr),a0
	bsr.w	L00768c
L0073a6:
	clr.b	(L014074)
	rts

L0073ae:
	move.b	#$01,(L014074)
	rts

L0073b8:
	move.b	(a5)+,d0
	or.b	#$20,d0
	cmp.b	#$69,d0			;'i'
	bne.s	L00739c
	move.b	(a5)+,d0
	or.b	#$20,d0
	cmp.b	#$6c,d0			;'l'
	bne.s	L00739c
	move.b	(a5)+,d0
	or.b	#$20,d0
	cmp.b	#$6c,d0			;'l'
	bne.s	L00739c
	move.b	#$02,(L014074)
	rts

L0073e6:
	clr.l	d3
	clr.l	d4
	move.w	(L00680c),d3
	move.w	(L00680e),d4
	lea.l	(ShareStr),a0
	bsr.w	L006954
	bne.s	L00742c
	bsr.w	L0069f8
	cmp.l	#$0000005e,d0
	bcc.s	L007470
	move.l	d0,d3
	move.b	(-$0001,a5),d0
	cmp.b	#$20,d0			;' '
	bne.s	L007470
	bsr.w	L0069f8
	tst.l	d0
	beq.s	L007470
	cmp.l	#$0000010b,d0
	bcc.s	L007470
	move.l	d0,d4
L00742c:
	move.w	d3,($1c76)
	beq.s	L00746e
	move.w	d4,($1c78)
	beq.s	L00746e
	movea.l	($1c24),a0
	move.l	a0,($1c40)
	mulu.w	#$000c,d4
	add.l	#$0000005c,d4
	move.l	d4,($1c7a)
	subq.w	#1,d3
	bmi.s	L00745a
L007452:
	clr.l	(a0)
	adda.l	d4,a0
	dbra.w	d3,L007452
L00745a:
	move.l	a0,($1c24)
	move.l	a0,d0
	add.l	#$00010000,d0
	cmp.l	($1c00),d0
	bcc.w	L006928
L00746e:
	rts

L007470:
	clr.l	d3
	clr.l	d4
	move.w	(L00680c),d3
	move.w	(L00680e),d4
	bsr.s	L00742c
	lea.l	(ShareStr),a0
	bra.w	L00768c

L00748c:
	move.l	(L006810),d3
	lea.l	(CommonStr),a0
	bsr.w	L006954
	bne.s	L0074b0
	bsr.w	L0069f8
	cmp.l	#$00000401,d0
	bcc.s	L0074de
	move.l	d0,d3
	moveq.l	#$0a,d0
	lsl.l	d0,d3
L0074b0:
	tst.l	d3
	beq.s	L0074dc
	movea.l	($1c24),a0
	move.l	a0,($1c44)
	move.l	a0,($1c48)
	clr.l	(a0)
	adda.l	d3,a0
	move.l	a0,($1c4c)
	move.l	a0,($1c24)
	move.l	a0,d0
	add.l	#$00010000,d0
	cmp.l	($1c00),d0
	bcc.w	L006928
L0074dc:
	rts

L0074de:
	bsr.s	L0074b0
	lea.l	(CommonStr),a0
	bra.w	L00768c

L0074ea:
	clr.l	d3
	clr.l	d6
	clr.l	d5
	move.b	(L006814),d3
	move.b	(L006815),d6
	move.b	(L006816),d5
	lea.l	(ProcessStr),a0
	bsr.w	L006954
	bne.s	L00755a
	bsr.w	L0069f8
	cmp.l	#$00000021,d0
	bcc.s	L007568
	move.l	d0,d3
	move.b	(-$0001,a5),d0
	cmp.b	#$20,d0			;' '
	bne.s	L007568
	bsr.w	L0069f8
	cmp.l	#$00000002,d0
	bcc.s	L007534
	moveq.l	#$02,d0
L007534:
	cmp.l	#$00000100,d0
	bcc.s	L007568
	move.l	d0,d6
	move.b	(-$0001,a5),d0
	cmp.b	#$20,d0			;' '
	bne.s	L007568
	bsr.w	L0069f8
	tst.l	d0
	beq.s	L007568
	cmp.l	#$00000065,d0
	bcc.s	L007568
	move.l	d0,d5
L00755a:
	move.l	d3,d1
	move.b	d5,d2
	move.l	d6,d3
	subq.l	#1,d3
	bsr.w	L00e68c
	rts

L007568:
	clr.l	d3
	clr.l	d6
	clr.l	d5
	move.b	(L006814),d3
	move.b	(L006815),d6
	move.b	(L006816),d5
	bsr.s	L00755a
	lea.l	(ProcessStr),a0
	bra.w	L00768c

L00758c:
	lea.l	(BuffersStr),a0
	bsr.w	L006954
	bne.s	L0075d2
	bsr.w	L0069f8
	cmp.l	#$00000002,d0
	bcs.s	L0075d4
	cmp.l	#$000000fa,d0
	bcc.s	L0075d4
	move.l	d0,d3
	move.b	(-$0001,a5),d0
	beq.s	L0075d2
	cmp.b	#$20,d0			;' '
	bne.s	L0075d4
	bsr.w	L0069f8
	cmp.l	#$00000400,d0
	bcs.s	L0075d4
	cmp.l	#$00008001,d0
	bcc.s	L0075d4
	move.w	d0,($1c70)
L0075d2:
	rts

L0075d4:
	lea.l	(BuffersStr),a0
	bsr.w	L00768c
	rts

L0075e0:
	lea.l	(LastdriveStr),a0
	bsr.w	L006954
	bne.s	L007604
	bsr.s	L007658
	or.b	#$20,d0
	sub.b	#$61,d0			;'a'
	cmp.b	#$1a,d0
	bcc.s	L007606
	cmp.b	($1c75),d0
	bcs.s	L007606
	move.b	d0,d4
L007604:
	rts

L007606:
	lea.l	(LastdriveStr),a0
	bsr.s	L00768c
	move.b	($1c75),d4
	rts

L007614:
	lea.l	(ScsidevStr),a0
	bsr.w	L006954
	bne.s	L007632
	bsr.w	L006988
	bsr.w	L0072aa
	tst.w	d0
	bmi.s	L007634
	move.b	d0,(L006818)
L007632:
	rts

L007634:
	lea.l	(ScsidevStr),a0
	bra.s	L00768c

L00763c:
	pea.l	(L007c02)
	lea.l	(ExconfigStr),a0
	bsr.w	L006954
	movem.l	(sp)+,a0
	bne.s	L007656
	bsr.w	L0069d4
L007656:
	rts

L007658:
	move.b	(a5)+,d0
	cmp.b	#$20,d0			;' '
	beq.s	L007658
	rts

L007662:
	lea.l	(FilesStr),a0
	bsr.w	L006954
	bne.s	L007684
	bsr.w	L0069f8
	cmp.l	#$00000005,d0
	bcs.s	L007686
	cmp.l	#$0000005e,d0
	bcc.s	L007686
	move.l	d0,d2
L007684:
	rts

L007686:
	lea.l	(FilesStr),a0
L00768c:
	bsr.w	L007134
	lea.l	(L007d48),a0
	bsr.w	L007134
	rts

L00769c:
	clr.w	-(sp)
	pea.l	(ConfigDotStr)
	DOS	_OPEN
	addq.l	#6,sp
	rts

L0076aa:
	tst.b	(UskcgSysStr)
	beq.w	L0077be
	movea.l	($1c24),a1
	move.l	a1,d1
	clr.l	d2
	moveq.l	#$38,d0			;'8'
	trap	#15
	move.w	#$177f,d1
	bsr.w	L00694a
	move.l	a1,d1
	moveq.l	#$01,d2
	moveq.l	#$38,d0			;'8'
	trap	#15
	move.w	#$177f,d1
	bsr.w	L00694a
	move.l	a1,d1
	moveq.l	#$02,d2
	moveq.l	#$38,d0			;'8'
	trap	#15
	move.w	#$1fff,d1
	bsr.w	L00694a
	move.l	a1,d1
	moveq.l	#$03,d2
	moveq.l	#$38,d0			;'8'
	trap	#15
	move.w	#$34df,d1
	bsr.w	L00694a
	move.l	a1,d1
	moveq.l	#$04,d2
	moveq.l	#$38,d0			;'8'
	trap	#15
	move.w	#$34df,d1
	bsr.w	L00694a
	move.l	a1,d1
	moveq.l	#$05,d2
	moveq.l	#$38,d0			;'8'
	trap	#15
	move.w	#$5fff,d1
	bsr.w	L00694a
	move.l	a1,($1c24)
	move.l	a1,d0
	add.l	#$00010000,d0
	cmp.l	($1c00),d0
	bcc.w	L006928
	clr.w	-(sp)
	pea.l	(UskcgSysStr)
	DOS	_OPEN
	addq.l	#6,sp
	tst.l	d0
	bmi.w	L0077be
	move.w	d0,d2
	movea.l	($1c24),a2
	move.l	#$000126a2,-(sp)
	move.l	a2,-(sp)
	move.w	d2,-(sp)
	DOS	_READ
	lea.l	($000a,sp),sp
	tst.l	d0
	bmi.s	L0077b8
	move.l	d0,d3
	lea.l	($0022,a2),a2
L00775e:
	subq.l	#2,d3
	bmi.s	L0077b8
	moveq.l	#$08,d1
	swap.w	d1
	move.w	(a2)+,d1
	cmp.w	#$ffff,d1
	beq.s	L00778e
	cmp.w	#$8000,d1
	bcc.s	L007776
	ror.w	#8,d1
L007776:
	movea.l	a2,a1
	moveq.l	#$10,d0
	cmp.w	#$f000,d1
	bcc.s	L007782
	moveq.l	#$20,d0			;' '
L007782:
	adda.l	d0,a2
	sub.l	d0,d3
	bmi.s	L0077b8
	IOCS	_DEFCHR
	bra.s	L00775e

L00778e:
	subq.l	#2,d3
	bmi.s	L0077b8
	moveq.l	#$0c,d1
	swap.w	d1
	move.w	(a2)+,d1
	cmp.w	#$8000,d1
	bcc.s	L0077a0
	ror.w	#8,d1
L0077a0:
	movea.l	a2,a1
	moveq.l	#$30,d0			;'0'
	cmp.w	#$f000,d1
	bcc.s	L0077ac
	moveq.l	#$48,d0			;'H'
L0077ac:
	adda.l	d0,a2
	sub.l	d0,d3
	bmi.s	L0077b8
	IOCS	_DEFCHR
	bra.s	L00778e

L0077b8:
	move.w	d2,-(sp)
	DOS	_CLOSE
	addq.l	#2,sp
L0077be:
	rts

L0077c0:
	clr.w	-(sp)
	pea.l	(KeySysStr)
	DOS	_OPEN
	addq.l	#6,sp
	tst.l	d0
	bmi.s	L0077fa
	move.w	d0,d2
	move.l	#$000002c8,-(sp)
	pea.l	(L013a42)
	move.w	d2,-(sp)
	DOS	_READ
	lea.l	($000a,sp),sp
	move.w	d2,-(sp)
	DOS	_CLOSE
	addq.l	#2,sp
	tst.b	(L007a90)
	beq.s	L0077fa
	jsr	(L00fe1c)
L0077fa:
	rts

L0077fc:
	clr.w	-(sp)
	pea.l	(TitleSysStr)
	DOS	_OPEN
	addq.l	#6,sp
	tst.l	d0
	bmi.w	L0078e6
	movea.l	($1c24),a0
	move.w	d0,d2
	move.l	#$00010044,-(sp)
	move.l	a0,-(sp)
	move.w	d2,-(sp)
	DOS	_READ
	lea.l	($000a,sp),sp
	movea.l	d0,a1
	move.w	d2,-(sp)
	DOS	_CLOSE
	addq.l	#2,sp
	move.b	#$03,(L007a90)
	tst.b	(a0)
	bne.w	L0078de
	move.w	(a0)+,d0
	move.b	d0,(L007a90)
	move.w	d0,-(sp)
	move.w	#$0002,-(sp)
	tst.b	d0
	bne.s	L007858
	move.w	#$0003,-(sp)
	move.w	#$000e,-(sp)
	DOS	_CONCTRL
	addq.l	#4,sp
L007858:
	DOS	_CONCTRL
	addq.l	#4,sp
	move.w	(a0)+,d7
	move.w	(a0)+,d2
	move.w	#$0004,d1
	IOCS	_TPALET
	move.w	(a0)+,d2
	move.w	#$0008,d1
	IOCS	_TPALET
	IOCS	_B_CUROFF
	clr.w	d1
	move.b	d7,d1
	IOCS	_TCOLOR
	movea.l	a0,a5
	adda.l	#$00000034,a0
	move.l	a0,-(sp)
	lea.l	(L011096),a0
	bsr.w	L0069d4
	movea.l	(sp),a0
	move.w	(a0)+,d1
	move.w	(a0)+,d2
	movea.l	a0,a1
	IOCS	_TEXTPUT
	addq.l	#4,a0
	moveq.l	#$ff,d0
	move.w	#$3fff,d1
L0078a6:
	move.l	d0,(a0)+
	dbra.w	d1,L0078a6
	movea.l	(sp)+,a0
	move.w	d7,d1
	lsr.w	#8,d1
	tst.b	d1
	beq.s	L0078c4
	IOCS	_TCOLOR
	move.w	(a0)+,d1
	move.w	(a0)+,d2
	movea.l	a0,a1
	IOCS	_TEXTPUT
L0078c4:
	move.w	#$0003,d1
	IOCS	_TCOLOR
	IOCS	_B_CURON
	tst.b	(L007a90)
	beq.s	L0078dc
	IOCS	_OS_CURON
L0078dc:
	bra.s	L0078fa

L0078de:
	adda.l	a0,a1
	clr.b	(a1)
	clr.b	-(a1)
	bra.s	L0078ec

L0078e6:
	lea.l	(HelloString),a0
L0078ec:
	bsr.w	L007134
	jsr	(L00fe1c)
L0078f6:
	IOCS	_OS_CURON
L0078fa:
	rts

L0078fc:
	IOCS	_OS_CUROF
	rts

L007902:
	lea.l	(DosCallTable),a0
	lea.l	($1800),a1
	move.w	#$00ff,d1
L007910:
	move.l	(a0)+,(a1)+
	dbra.w	d1,L007910
	lea.l	($1c00),a0
	move.w	#$00ff,d1
L00791e:
	clr.l	(a0)+
	dbra.w	d1,L00791e
	move.l	#L008598,($002c)
	tst.b	($0cbc)
	beq.s	L00793a
	move.l	#L008598,($0020)
L00793a:
	move.l	#L00f6f4,($00b8)
	move.l	#L0086f2,($07fc)
	move.l	#$ffffffff,(L014076)
	lea.l	($00ac),a0
	move.l	(a0),($1c66)
	move.l	#L008670,(a0)
	lea.l	($00a8),a0
	move.l	(a0),($1c6a)
	move.l	#L00868e,(a0)
	lea.l	($00100000),a0
	bsr.w	L007a3c
	move.l	a0,($1c00)
	move.l	#DosCallTable,($1c24)
	lea.l	(L008372),a0
	move.l	a0,($1c04)
	bsr.w	L00a0ec
	pea.l	(L006928)
	move.w	#$fff1,-(sp)
	DOS	_INTVCS
	addq.l	#6,sp
	move.w	#$0003,($1cbc)
	move.w	#$000e,($1cbe)
	move.w	#$0010,($1cc0)
	move.w	#$0011,($1cc2)
	move.w	#$0013,($1cc4)
	move.w	($00006806).l,($1c70)
	move.b	(L00680a),(L014074)
	clr.w	d0
	move.b	(L00680b),d0
	move.w	d0,($1c10)
	move.b	#$02,($1c12)
	move.b	#$01,($1cba)
	lea.l	(L013d0a),a0
	move.l	a0,($1c28)
	move.w	#$0003,($1c0c)
	move.w	#$0064,($1c0e)		;'d'
	move.l	#L008372,($1c20)
	move.b	(L006809),($1c74)
	move.b	(L006817),($1c0b)
	move.b	(L006817),(L00cc2a)
	move.b	#$01,(L01120a)
	bsr.w	L00a6ea
	tst.b	($0160)
	beq.s	L007a3a
	move.w	#$00ff,($0160)
L007a3a:
	rts

L007a3c:
	movea.l	($00ed0008),a3
L007a42:
	cmpa.l	a3,a0
	bcc.s	L007a7a
	movea.l	sp,a6
	lea.l	(L007a74),a1
	movea.l	($0008),a2
	move.l	a1,($0008)
	move.l	(a0),d0
	move.l	#$5836386b,(a0)		;'X68k'
	cmpi.l	#$5836386b,(a0)		;'X68k'
	bne.s	L007a74
	move.l	d0,(a0)
	move.l	a2,($0008)
	adda.l	#$00100000,a0
	bra.s	L007a42

L007a74:
	movea.l	a6,sp
	move.l	a2,($0008)
L007a7a:
	rts

L007a7c:
	lea.l	(ClockStr),a0
	bsr.w	L00e7b6
	move.l	d0,($1cb6)
	rts

L007a8c:
	.dc.b	$00,$00,$00,$00
L007a90:
	.dc.b	$03
ClockStr:
	.dc.b	'CLOCK   '
ConfigDotStr:
	.dc.b	'CONFIG.'
SysStr:
	.dc.b	'SYS',$00
FilesStr:
	.dc.b	'files',$00
BuffersStr:
	.dc.b	'buffers',$00
LastdriveStr:
	.dc.b	'lastdrive',$00
TitleStr:
	.dc.b	'title',$00
KeyStr:
	.dc.b	'key',$00
UskcgStr:
	.dc.b	'uskcg',$00
BellStr:
	.dc.b	'bell',$00
DeviceStr:
	.dc.b	'device',$00
ProcessStr:
	.dc.b	'process',$00
ShareStr:
	.dc.b	'share',$00
CommonStr:
	.dc.b	'common',$00
EnvsetStr:
	.dc.b	'envset',$00
ProgramStr:
	.dc.b	'program',$00
ShellStr:
	.dc.b	'shell',$00
BreakStr:
	.dc.b	'break',$00
VerifyStr:
	.dc.b	'verify',$00
NewfatStr:
	.dc.b	'newfat',$00
ScsidevStr:
	.dc.b	'scsidev',$00
ExconfigStr:
	.dc.b	'exconfig',$00
FflushStr:
	.dc.b	'fflush',$00
DirschStr:
	.dc.b	'dirsch',$00
CttyStr:
	.dc.b	'ctty',$00
RomdbStr:
	.dc.b	'romdb',$00
OffStr:
	.dc.b	'off',$00
TitleSysStr:
	.dc.b	'TITLE.SYS',$00,$00,$00
HumanAuthorStr:
	.dc.b	'+--------------+|<Human68K�S��>||�{���F�v(kuma)|+--------------+',$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
KeySysStr:
	.dc.b	'KEY.SYS',$00
L007ba6:
	.dc.l	$00000040
DefaultPathStr:
	.dc.b	'path=\;\sys;\bin;\basic2;\etc;\shell',$00,$00
DoNotDistributeStr:
	.dc.b	'��͂���΂��Ăˏ���ɔz��Ȃ�I',$00,$00,$00,$00,$00,$00,$00,$00
UskcgSysStr:
	.dc.b	'USKCG.SYS',$00
L007c02:
	.dc.w	$0000,$0000,$0000
L007c08:
	.dc.l	$00000000,$00000000
VersionUpStr:
	.dc.b	'Version up ���� '
ForX68000Str:
	.dc.b	'-- For X68000 --'
StartVer:
	.dc.b	'1986-04 Start :M'
Ver100:
	.dc.b	'1987-03  1.00 :M'
Ver101:
	.dc.b	'1987-10  1.01 :M'
Ver200:
	.dc.b	'1989-03  2.00 :M'
Ver201:
	.dc.b	'1989-04  2.01 :T'
Ver202:
	.dc.b	'1990-04  2.02 :T'
Ver203:
	.dc.b	'1992-01  2.03 :T'
ForX680x0Str:
	.dc.b	'-- For X680x0 --'
Ver215:
	.dc.b	'1992-11  2.15 :M'
Ver300:
	.dc.b	'1993-02  3.00 :M'
StaffListStr:
	.dc.b	'vv �S���҈ꗗ vv'
YoshioMotosako1Str:
	.dc.b	'Yoshio  Motosako'
YuujiTanakaStr:
	.dc.b	'Yuuji   Tanaka  ',$00,$00
CannotRegisterEnvVarStr:
	.dc.b	' �͊��ϐ��Ƃ��ēo�^�ł��܂���ł����B',$0d,$0a,$00
CannotStartStr:
	.dc.b	' �͋N���ł��܂���ł����B',$0d,$0a,$00
L007d48:
	.dc.b	'�̃p�����[�^�[���ُ�ł��B�f�t�H���g���g�p���܂�',$0d,$0a,$00
L007d7b:
	.dc.b	'���o�^�ł��܂���ł���',$0d,$0a,$00
L007d94:
	.dc.b	'�P�Z�N�^������̃o�C�g�����傫�����܂�',$0d,$0a,$00
L007dbd:
	.dc.b	'lastdrive�̎w��ȏ�̃h���C�o�[�o�^�͂ł��܂���',$0d,$0a,$00
L007def:
	.dc.b	$0d,$0a
	.dc.b	$1b,'[mexconfig�w��̃v���O�����͏풓�ł��܂���B���Z�b�g���Ă�������'
L007e32:
	.dc.b	$0d,$0a
	.dc.b	$1b,'[m�V�X�e�����N���ł��܂���ł����B���Z�b�g���Ă�������'
L007e6b:
	.dc.b	$00,$00,$00,$00,$00
L007e70:
	suba.l	#$0000001a,sp
	movea.l	sp,a5
	move.b	#$17,($0000.w,a5)
	move.b	#$00,($0002,a5)
	move.l	#L00fa50,d1
L007e8a:
	bsr.w	L007f78
	bpl.s	L007e8a
	bsr.s	L007e9a
	adda.l	#$0000001a,sp
	rts

L007e9a:
	IOCS	_BOOTINF
	and.l	#$00ffffff,d0
	cmp.l	#$00000100,d0
	bcc.s	L007ef6
	and.b	#$f0,d0
	cmp.b	#$80,d0
	beq.s	L007ed4
	move.l	#L01097e,d1
	move.l	d1,(a1)
	bsr.w	L007f78
	move.b	($0016,a5),d0
	subq.b	#1,d0
	move.b	d0,($1c15)
	move.l	#L010da2,d1
	bra.s	L007ef0

L007ed4:
	move.l	#L010da2,d1
	move.l	d1,(a1)
	bsr.w	L007f78
	move.b	($0016,a5),d0
	subq.b	#1,d0
	move.b	d0,($1c15)
	move.l	#L01097e,d1
L007ef0:
	move.l	d1,(a1)
	bra.w	L007f78

L007ef6:
	bsr.s	L007f0c
	move.l	#L01097e,d1
	move.l	d1,(a1)
	bsr.s	L007f78
	move.l	#L010da2,d1
	move.l	d1,(a1)
	bra.s	L007f78

L007f0c:
	movem.l	d2-d3/a2-a4,-(sp)
	movea.l	a1,a2
	movea.l	d0,a1
	movea.l	(a1),a1
	cmp.l	a1,d0
	bcc.s	L007f6e
	move.l	-(a1),d0
	cmp.l	#$6e36386b,d0		;'n68k'
	bne.s	L007f6e
	move.l	-(a1),d0
	cmp.l	#$48756d61,d0		;'Huma'
	bne.s	L007f6e
	move.l	-(a1),d0
	movea.l	-(a1),a3
	clr.l	d2
L007f34:
	movea.l	($1c24),a4
	movea.l	a4,a1
	jsr	(a3)
	cmp.l	#$ffffffff,d2
	beq.s	L007f6e
	movea.l	a4,a1
	move.l	#L007f76,d0
	bsr.w	L007140
	tst.b	($0003,a5)
	bne.s	L007f34
	move.b	($0016,a5),d0
	subq.b	#1,d0
	move.b	d0,($1c15)
	movem.l	d2/a3,-(sp)
	bsr.w	L0070ba
	movem.l	(sp)+,d2/a3
	bra.s	L007f34

L007f6e:
	movea.l	a2,a1
	movem.l	(sp)+,d2-d3/a2-a4
	rts

L007f76:
	.dc.b	$00,$00
L007f78:
	movea.l	d1,a1
	move.b	($1c75),d0
	addq.b	#1,d0
	move.b	d0,($0016,a5)
	bsr.w	L00defa
	btst.b	#$07,($0004,a1)
	bne.s	L007fa8
	tst.b	($000d,a5)
	beq.s	L007fa8
	movea.l	a5,a0
	bsr.w	L0082d0
	bmi.w	L007104
	bsr.w	L008248
	bmi.w	L0070f8
L007fa8:
	move.l	(a1),d1
	rts

L007fac:
	movem.l	d1-d4,-(sp)
	clr.l	d3
	move.w	#$90ff,d1
	IOCS	_B_RECALI
	and.l	#$10000000,d0
	bne.s	$00007fce
	addq.w	#1,d3
	add.w	#$0100,d1
	cmp.w	#$94ff,d1
	bne.s	$00007fb6
	move.b	d3,($000d,a5)
	jsr	(L010a40)
	IOCS	_BOOTINF
	and.b	#$0f,d0
	add.b	d0,($0016,a5)
	move.l	#L010a52,($0012,a5)
	movem.l	(sp)+,d1-d4
	clr.l	d0
	bra.w	L00fadc

L007ff6:
	bsr.s	$00008008
	move.b	d0,($000d,a5)
	move.l	#L010e0c,($0012,a5)
	bra.w	L00fadc

	movem.l	d1-d7/a0-a6,-(sp)
	clr.l	d4
	lea.l	(L010e4c),a2
	lea.l	(-$0100,sp),sp
	movea.l	sp,a1
	clr.l	d1
	move.w	#$8000,d1
	moveq.l	#$04,d2
	move.l	#$00000100,d3
	movem.l	d1-d4/a1-a2,-(sp)
	IOCS	_B_RECALI
	movem.l	(sp)+,d1-d4/a1-a2
	tst.b	d0
	bne.w	$00008142
	clr.l	(a1)
	movem.l	d1-d4/a1-a2,-(sp)
	IOCS	_B_READ
	movem.l	(sp)+,d1-d4/a1-a2
	tst.b	d0
	bne.w	$00008142
	cmpi.l	#$5836384b,(a1)		;'X68K'
	bne.w	$00008142
	moveq.l	#$0e,d6
	movea.l	a1,a0
	lea.l	($0010,a0),a0
	cmpi.l	#$48756d61,(a0)		;'Huma'
	bne.s	$000080b4
	cmpi.l	#$6e36386b,($0004,a0)	;'n68k'
	beq.s	$000080bc
	cmpi.w	#$6e2f,($0004,a0)	;'n/'
	bne.s	$000080b4
	clr.l	d0
	move.b	($0006,a0),d0
	sub.b	#$30,d0			;'0'
	cmp.b	#$0a,d0
	bcc.s	$000080b4
	mulu.w	#$000a,d0
	move.w	d0,-(sp)
	move.b	($0007,a0),d0
	sub.b	#$30,d0			;'0'
	cmp.b	#$0a,d0
	bcc.s	$000080b2
	add.w	(sp),d0
	beq.s	$000080b2
	move.w	d0,(sp)
	subq.w	#1,d0
	and.w	(sp),d0
	bne.s	$000080b2
	move.w	(sp)+,d0
	move.b	d0,($0002,a2)
	bra.s	$000080bc

	addq.l	#2,sp
	dbra.w	d6,$0000805c
	bra.w	$00008142

	move.l	($0008,a0),d0
	btst.l	#$18,d0
	bne.s	$000080b4
	tst.b	($0008,a0)
	bne.s	$000080e0
	move.l	d0,-(sp)
	IOCS	_BOOTINF
	lsl.w	#8,d0
	cmp.w	d1,d0
	movem.l	(sp)+,d0
	bne.s	$000080e0
	add.b	d4,($0016,a5)
	cmp.b	#$10,d4
	bcc.s	$0000813e
	and.l	#$00ffffff,d0
	swap.w	d1
	or.l	d1,d0
	swap.w	d1
	move.l	d0,($000c,a2)
	move.l	($000c,a0),d0
	lsr.l	#2,d0
	cmp.l	#$0000fff7,d0
	bcc.s	$0000813e
	move.w	d0,($0008,a2)
	clr.l	d5
	move.b	($0002,a2),d5
	divu.w	d5,d0
	addq.w	#2,d0
	move.w	d0,d5
	move.l	d5,d0
	add.l	d5,d5
	cmp.w	#$0ff7,d0
	bcs.s	$00008120
	move.l	d5,d0
	add.l	d5,d0
	add.l	#$000007ff,d0
	lsr.l	#8,d0
	lsr.l	#3,d0
	cmp.l	#$00000100,d0
	bcc.s	$0000813e
	move.b	d0,($000b,a2)
	lea.l	($0010,a2),a2
	addq.l	#1,d4
	bra.w	$000080b4

	movem.l	a1/a4,-(sp)
	IOCS	_B_EJECT
	movem.l	(sp)+,a1/a4
	add.w	#$0100,d1
	cmp.w	#$9000,d1
	bne.w	$00008028
	bra.s	$00008160

	IOCS	_B_EJECT
	move.w	#$8100,d1
	IOCS	_B_RECALI
	IOCS	_B_EJECT
	move.w	#$8000,d1
	IOCS	_B_RECALI
	IOCS	_B_EJECT
	move.l	d4,d0
	lea.l	($0100,sp),sp
	movem.l	(sp)+,d1-d7/a0-a6
	rts

L008184:
	movem.l	d1-d2,-(sp)
	clr.l	d1
	move.b	($00ed001d),d1
	IOCS	_CRTMOD
	moveq.l	#$ff,d1
	moveq.l	#$ff,d2
	IOCS	_B_CONSOL
	cmp.w	#$001e,d2
	bcs.s	$000081a6
	move.w	#$001e,d2
	IOCS	_B_CONSOL
	move.l	#L00fb7c,d1
	moveq.l	#$37,d0			;'7'
	trap	#15
	IOCS	_B_SFTSNS
	move.w	d0,(L01242c)
	movem.l	(sp)+,d1-d2
	bra.w	L00fadc

L0081c6:
	moveq.l	#$ff,d1
	IOCS	_INIT_PRN
	bra.w	L00fadc

L0081d0:
	move.w	d1,-(sp)
	move.w	($00ed001a),d1
	IOCS	_SET232C
	move.w	(sp)+,d1
	bra.w	L00fadc

L0081e2:
	move.b	#$03,($1c72)
	move.b	($1c75),($1c73)
	move.w	#$0005,($1c6e)
	clr.l	d0
	move.l	d0,($1c2c)
	move.l	d0,($1c30)
	movea.l	($1c24),a0
L008202:
	move.l	a0,($1c34)
	clr.l	d2
	move.b	($1c72),d2
	clr.l	d3
	move.w	($1c70),d3
	bra.w	L00b6f2

L008216:
	movea.l	($1c24),a0
	bsr.s	L008202
	move.w	($1c6e),d1
	subq.w	#6,d1
	bcs.s	L008242
	move.l	a0,($1c2c)
	move.w	d1,d0
L00822a:
	move.w	#$ffff,(a0)+
	dbra.w	d1,L00822a
	move.l	a0,($1c30)
L008236:
	moveq.l	#$5f,d1			;'_'
L008238:
	clr.b	(a0)+
	dbra.w	d1,L008238
	dbra.w	d0,L008236
L008242:
	move.l	a0,($1c24)
	rts

L008248:
	movem.l	d0-d1/a0-a1,-(sp)
	move.b	($1c74),d0
	sub.b	($1c75),d0
	bmi.s	L00828a
	move.b	($1c75),d0
	cmp.b	($1c73),d0
	bcs.s	L008264
	move.b	d0,($1c73)
L008264:
	movea.l	($1c3c),a1
	movea.l	($1c38),a0
	clr.l	d1
	move.b	($1c75),d1
L008272:
	move.l	a1,($0046,a0)
	move.b	#$40,($0045,a0)		;'@'
	lea.l	($004e,a0),a0
	movea.l	($0006,a1),a1
	dbra.w	d1,L008272
	clr.l	d0
L00828a:
	movem.l	(sp)+,d0-d1/a0-a1
	rts

L008290:
	movea.l	($1c24),a0
	move.l	a0,($1c38)
	move.l	#$413a0900,d0
	clr.w	d2
	move.b	($1c74),d2
L0082a4:
	clr.l	d3
	bsr.s	L0082b2
	dbra.w	d2,L0082a4
	move.l	a0,($1c24)
	rts

L0082b2:
	move.l	d0,(a0)+
	add.l	#$01000000,d0
	moveq.l	#$40,d1			;'@'
L0082bc:
	clr.b	(a0)+
	dbra.w	d1,L0082bc
	move.b	d3,(a0)+
	move.l	a1,(a0)+
	move.w	#$ffff,(a0)+
	move.w	#$0002,(a0)+
	rts

L0082d0:
	movem.l	d0-d7/a0-a6,-(sp)
	move.l	($1c3c),d1
	bne.s	L0082e6
	movea.l	($1c24),a2
	move.l	a2,($1c3c)
	clr.l	d6
	bra.s	L0082fc

L0082e6:
	movea.l	d1,a3
	move.l	($0006,a3),d1
	bpl.s	L0082e6
	movea.l	($1c24),a2
	move.l	a2,($0006,a3)
	move.b	($0000.w,a3),d6
	addq.b	#1,d6
L0082fc:
	clr.w	d7
	move.b	($000d,a0),d7
	move.l	#$00010000,d5
	swap.w	d7
	clr.w	d7
	movea.l	($0012,a0),a3
L008310:
	move.b	d6,($0000.w,a2)
	move.b	d7,($0001,a2)
	move.l	a1,($0002,a2)
	move.l	a3,-(sp)
	btst.b	#$05,($0004,a1)
	bne.s	L008338
	movea.l	(a3),a3
	bsr.w	L00d322
	movea.l	a2,a3
	lea.l	($0038,a3),a2
	tst.l	d0
	bmi.s	L008358
	bra.s	L008344

L008338:
	clr.w	($000a,a2)
	movea.l	a2,a3
	lea.l	($000c,a3),a2
	clr.l	d0
L008344:
	sub.l	d5,d7
	cmp.l	d5,d7
	bcs.s	L008358
	move.l	a2,($0006,a3)
	movea.l	(sp)+,a3
	addq.l	#4,a3
	addq.w	#1,d7
	addq.w	#1,d6
	bra.s	L008310

L008358:
	move.l	#$ffffffff,($0006,a3)
	movea.l	(sp)+,a3
	move.b	d6,($1c75)
	move.l	a2,($1c24)
	tst.l	d0
	movem.l	(sp)+,d0-d7/a0-a6
L008370:
	rts

L008372:
	.dc.l	$00000000,$00000000
L00837a:
	.dc.l	DosCallTable
	.dc.l	$00000000
L008382:
	.dc.l	$ffffffff,$00000000
	.dc.l	$00000000,$00000000
	.dc.l	$00000000,$00000000
	.dc.l	$00000000,$00000000
	.dc.l	$00000000,$00000000
	.dc.l	$00000000,$00000000
	.dc.l	$00000000,$00002000
	.dc.l	$00006800
L0083be:
	.dc.l	$00000000,$00000000
	.dc.l	$00000000,$00000000
	.dc.l	$00000000,$00000000
	.dc.l	$00000000,$00000000
	.dc.l	$00000000,$00000000
	.dc.l	$00000000,$00000000
	.dc.l	$00000000
L0083f2:
	.dc.b	'A:\',$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00
	.dc.b	'HUMAN.SYS',$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
L008472:
	lea.l	(Start),a0
	lea.l	(L008370+$000001),a1
	suba.l	a0,a1
	move.l	a1,d1
	moveq.l	#$ff,d0
L008484:
	move.b	d0,(a0)+
	dbra.w	d1,L008484
L00848a:
	lea.l	(L008372),sp
	move.l	(L008382),-(sp)
	move.l	(L011090),-(sp)
	pea.l	(L011096)
	move.w	#$0002,-(sp)
	DOS	_EXEC
	lea.l	($000e,sp),sp
	tst.l	d0
	bmi.s	L0084f4
	move.l	(L008382),-(sp)
	move.l	(L011090),-(sp)
	pea.l	(L011096)
	move.w	#$0001,-(sp)
	DOS	_EXEC
	lea.l	($000e,sp),sp
	tst.l	d0
	bmi.s	L0084f4
	move.l	#$ffffffff,($0060,a0)
	move.l	(L008382),-(sp)
	move.l	(L011090),-(sp)
	move.l	d0,-(sp)
	move.w	#$0004,-(sp)
	DOS	_EXEC
	lea.l	($000e,sp),sp
	tst.l	d0
	bpl.s	L008518
L0084f4:
	move.w	#$0003,-(sp)
	move.w	#$0002,-(sp)
	DOS	_CONCTRL
	addq.l	#4,sp
	bsr.s	L00855a
	pea.l	(L011096)
	DOS	_PRINT
	addq.l	#4,sp
	pea.l	(L011193)
	DOS	_PRINT
	addq.l	#4,sp
	bra.s	L008524

L008518:
	bsr.s	L00855a
	pea.l	(L0111ae)
	DOS	_PRINT
	addq.l	#4,sp
L008524:
	pea.l	(L0111bd)
	bra.s	L008532

L00852c:
	pea.l	(L0111db)
L008532:
	DOS	_PRINT
	addq.l	#4,sp
	clr.b	(L011095)
	clr.b	(L011096)
	pea.l	(L011094)
	DOS	_GETSS
	addq.l	#4,sp
	bsr.s	L00855a
	tst.b	(L011095)
	beq.s	L00852c
	bra.w	L00848a

L00855a:
	pea.l	(L0111ee)
	DOS	_PRINT
	addq.l	#4,sp
	rts

Call_CTRLVC_ERRJVC_EXITVC:
	DOS	_GETPDB
	cmp.l	#L008382,d0
	bne.s	$00008596
	lea.l	(L008372),sp
	clr.l	-(sp)
	DOS	_SUPER
	addq.l	#4,sp
	movea.l	(L011090),a0
	lea.l	($00f0,a0),a0
	move.l	a0,usp
	bsr.s	L00855a
	pea.l	(L0111dd)
	DOS	_PRINT
	addq.l	#4,sp
	bra.s	L008524

	DOS	_EXIT

L008598:
	movem.l	d0/a5-a6,-(sp)
	lea.l	($000e,sp),a6
	movea.l	(a6),a5
	move.w	(a5)+,d0
	cmpi.w	#$ff00,d0
	bcs.s	$00008624
	move.l	a5,(a6)+
	tst.b	($0cbc)
	beq.s	$000085b4
	addq.l	#2,a6
	cmpi.w	#$fff5,d0
	bcc.w	L00e31c
	addq.l	#4,sp
	movem.l	d1-d7/a0-a4,-(sp)
	btst.b	#$05,($0038,sp)
	bne.s	$000085cc
	move.l	usp,a6
	clr.l	d1
	move.b	d0,d1
	move.l	d1,d0
	lea.l	($1800),a0
	add.w	d1,d1
	add.w	d1,d1
	adda.l	d1,a0
	movea.l	(a0),a0
	tst.w	($1c08)
	bne.s	$000085ec
	move.l	sp,($1c5c)
	move.b	d0,($1c0a)
	addq.w	#1,($1c08)
	clr.l	($1c98)
	jsr	(a0)
	clr.l	($1c98)
	subq.w	#1,($1c08)
	bne.s	$00008604
	clr.b	($1c0a)
	move.l	d0,-(sp)
	bsr.w	$00008740
	movem.l	(sp)+,d0-d7/a0-a6
	tst.b	($1c14)
	bne.w	$0000e050
	btst.b	#$07,(sp)
	bne.s	$0000861e
	rte

	ori.w	#$8000,sr
	rte

	movea.l	d0,a6
	and.w	#$ffc0,d0
	cmp.w	#$40c0,d0
	beq.s	$00008652
	move.l	a6,d0
	and.w	#$ff00,d0
	cmp.w	#$fe00,d0
	beq.s	L008646
	movem.l	(sp)+,d0/a5-a6
	move.l	($0010),-(sp)
	rts

L008646:
	move.l	a6,d7
	lea.l	($000c,sp),a6
	trap	#14
	bra.w	L008826

	move.l	a6,d0
	or.w	#$0200,d0
	move.w	d0,-(a5)
	movec.l	cacr,d0
	or.w	#$0008,d0
	movec.l	d0,cacr
	movem.l	(sp)+,d0/a5-a6
	rte

Call_Reserved:
	moveq.l	#$ff,d0
	rts

L008670:
	tst.b	($1c16)
	bne.s	$0000868c
	or.b	#$80,d0
	move.b	d0,($1c16)
	tst.w	($1c08)
	bne.s	$0000868c
	bsr.w	L008760
	clr.b	($1c16)
	rte

L00868e:
	move.l	d0,($1c18)
	move.b	#$01,($1c17)
	tst.w	($1c08)
	bne.s	$000086a2
	bsr.w	$00008798
	rte

	tst.b	($1ca0)
	beq.s	$000086b0
	bsr.w	L0087d4
	bmi.s	$000086d8
	movea.l	($1c5c),sp
	bsr.w	L009020
	lea.l	(L0111ec),a1
	bsr.w	L008818
	move.l	($1bc4),d0
	move.l	d0,($003a,sp)
	cmp.l	(L00837a),d0
	bcc.s	$000086d8
	ori.w	#$2000,($0038,sp)
	movea.l	($1c5c),sp
	clr.w	($1c08)
	clr.b	($1c0a)
	move.l	#$00002000,d0
	movem.l	(sp)+,d1-d7/a0-a6
	bra.w	$00008616

L0086f2:
	move.l	($1c98),d0
	beq.s	$0000870a
	movea.l	d0,a0
	move.l	($1c9c),d0
	bsr.w	$0000aba4
	bsr.w	L00dd02
	clr.l	($1c98)
	tst.b	($1ca0)
	beq.s	$00008716
	bsr.w	L0087d4
	bmi.s	$000086d8
	movea.l	($1c62),sp
	bsr.w	L00882e
	clr.w	($1c08)
	clr.b	($1c0a)
	tst.b	($0cbc)
	beq.s	$00008730
	move.w	#$0000,-(sp)
	move.l	($1bc8),-(sp)
	move.w	($1c60),-(sp)
	move.l	#$00004000,d0
	rte

	bsr.s	L008752
	tst.b	($1c17)
	beq.s	$00008750
	tst.w	($1c08)
	bne.s	$00008750
	bsr.s	$00008798
	rts

L008752:
	tst.b	($1c16)
	beq.s	$0000875e
	bsr.s	L008760
	clr.b	($1c16)
	rts

L008760:
	move.b	($1c16),d0
	and.l	#$0000007f,d0
	move.l	d0,-(sp)
	btst.l	#$00,d0
	bne.s	$00008778
	bsr.w	L00b6ba
	bra.s	$00008780

	bsr.w	L009020
	bsr.w	L009030
	move.l	(sp)+,d0
	tst.b	($0cbc)
	beq.s	$00008790
	movea.l	(sp)+,a0
	move.w	#$0000,-(sp)
	move.l	a0,-(sp)
	move.w	sr,-(sp)
	movea.l	($1c66),a0
	jmp	(a0)

	bsr.w	L008834
	clr.b	($1c17)
	bsr.s	$000087c0
	bsr.w	L00b6ba
	tst.b	($0cbc)
	beq.s	$000087b4
	movea.l	(sp)+,a0
	move.w	#$0000,-(sp)
	move.l	a0,-(sp)
	move.w	sr,-(sp)
	move.l	($1c18),d0
	movea.l	($1c6a),a0
	jmp	(a0)

	move.w	($1c6e),d2
	move.w	d2,-(sp)
	move.w	d2,d0
	bsr.w	$0000c236
	move.w	(sp)+,d2
	subq.w	#1,d2
	bpl.s	$000087c4
	rts

L0087d4:
	move.l	(L014076),d0
	bmi.s	$000087ec
	move.w	d0,-(sp)
	DOS	_CLOSE
	addq.l	#2,sp
	move.l	#$ffffffff,(L014076)
	move.b	($1ca0),d0
	clr.b	($1ca0)
	cmp.b	#-$03,d0
	beq.s	$00008814
	cmp.b	#-$02,d0
	beq.s	$0000880c
	moveq.l	#$01,d0
	bsr.w	$000099d8
	bmi.s	$00008816
	move.l	a0,($1caa)
	movea.l	($1caa),a0
	bsr.w	$00009384
	clr.l	d0
	rts

L008818:
	clr.w	d1
	move.b	(a1)+,d1
	beq.s	$00008824
	bsr.w	L008f48
	bra.s	$0000881a

	rts

L008826:
	IOCS	_ABORTJOB
	trap	#14
	rts

L00882e:
	IOCS	_ABORTRST
	rts

L008834:
	movem.l	d1-d2,-(sp)
	moveq.l	#$ff,d1
	IOCS	_CONTRAST
	move.l	d0,d2
	and.b	#$0f,d2
	asl.l	#1,d2
	clr.l	d1
	IOCS	_CONTRAST
	swap.w	d2
	dbra.w	d2,$0000884e
	swap.w	d2
	dbra.w	d2,$0000884c
	movem.l	(sp)+,d1-d2
	rts

Call_GETCHAR:
	bsr.w	Call_INKEY
	move.l	d0,d1
	cmp.w	($1cc0),d0
	beq.s	L00887c
	cmp.w	($1cbe),d0
	beq.s	$00008882
	bsr.w	$000088a6
	bsr.w	L008f48
	move.l	d1,d0
	rts

L00887c:
	not.b	($1c13)
	bra.s	Call_GETCHAR

	clr.b	($1c13)
	bra.s	Call_GETCHAR

Call_PUTCHAR:
	move.w	(a6),d1
	bsr.w	L008f48
	bsr.w	L009014
	cmp.w	($1cc4),d1
	beq.s	L0088c0
	clr.l	d0
	cmp.w	($1cc0),d1
	beq.s	$000088cc
	cmp.w	($1cbe),d1
	beq.s	L0088d8
	tst.b	($1c17)
	bne.w	$00008798
	cmpi.b	#$02,($1c12)
	beq.s	$000088be
	cmp.w	($1cbc),d1
	beq.w	$000086a4
	rts

L0088c0:
	bsr.w	$00008f62
	bsr.w	Call_INKEY
	move.l	d0,d1
	bra.s	$00008898

	bsr.w	$00008f62
	not.b	($1c13)
	clr.l	d0
	rts

L0088d8:
	bsr.w	$00008f62
	clr.b	($1c13)
	clr.l	d0
	rts

Call_COMINP:
	bsr.w	Call_CINSNS
	tst.l	d0
	bne.s	$000088f6
	bsr.w	L009014
	bsr.w	$000088a6
	bra.s	Call_COMINP

	bsr.w	L008f70
	rts

Call_COMOUT:
	move.w	(a6),-(sp)
	bsr.w	Call_COUTSNS
	tst.l	d0
	bne.s	$00008910
	bsr.w	L009014
	bsr.w	$000088a6
	bra.s	$000088fe

	move.w	(sp)+,d1
	bsr.w	$00008f74
	rts

Call_PRNOUT:
	move.w	(a6),-(sp)
	bsr.w	Call_PRNSNS
	tst.l	d0
	bne.s	$0000892c
	bsr.w	L009014
	bsr.w	$000088a6
	bra.s	$0000891a

	move.w	(sp)+,d1
	bsr.w	$00008f78
	rts

Call_INPOUT:
	move.w	(a6),d1
	cmp.b	#$ff,d1
	beq.s	L00894a
	cmp.b	#$fe,d1
	beq.s	L008952
	bsr.w	L008f48
	clr.l	d0
	rts

L00894a:
	bsr.w	$00008f62
	move.l	d1,d0
	rts

L008952:
	bsr.w	L009014
	move.l	d1,d0
	rts

L00895a:
	DOS	_CHANGE_PR
Call_INKEY:
	tst.b	($1c17)
	bne.w	$00008798
	bsr.w	$00008f62
	tst.l	d1
	beq.s	L00895a
	move.l	d1,d0
	rts

L008970:
	cmpi.b	#$02,($1c12)
	bne.w	$000086a4
Call_GETC:
	bsr.w	Call_INKEY
	cmp.w	($1cbc),d0
	beq.s	L008970
	cmp.w	($1cc0),d0
	beq.s	L008992
	cmp.w	($1cbe),d0
	beq.s	$00008998
	rts

L008992:
	not.b	($1c13)
	bra.s	Call_GETC

	clr.b	($1c13)
	bra.s	Call_GETC

Call_PRINT:
	movea.l	(a6),a1
	clr.w	d1
	move.b	(a1)+,d1
	beq.s	$000089ac
	bsr.w	$0000888a
	bra.s	$000089a0

	rts

L0089ae:
	clr.w	-(sp)
	move.w	d3,d0
	movem.l	a0-a1,-(sp)
	bsr.w	L00a9d8
	move.l	a0,d0
	movem.l	(sp)+,a0-a1
	move.l	d0,-(sp)
	move.w	d3,-(sp)
	bra.s	$000089d4

Call_GETSS:
	move.w	#$8000,-(sp)
	bra.s	$000089ce

Call_GETS:
	clr.w	-(sp)
	clr.l	-(sp)
	clr.w	-(sp)
	movea.l	(a6),a1
	movea.l	sp,a3
L0089d6:
	bsr.w	$00008da0
	lea.l	(-$0100,sp),sp
	move.b	(a1)+,d2
	movea.l	a1,a2
	addq.l	#1,a1
	movea.l	a1,a5
	movea.l	sp,a6
	move.w	#$00ff,d0
	move.b	(a5)+,(a6)+
	dbra.w	d0,$000089ec
	movea.l	sp,a6
	clr.w	d4
	bra.s	$00008a02

	moveq.l	#$07,d1
	bsr.w	$00008ea4
	bsr.w	L008e2c
	bsr.w	L008e72
	clr.l	d1
	move.b	d0,d1
	cmp.w	#$000a,d1
	beq.s	$00008a02
	cmp.w	#$000d,d1
	beq.s	$00008a56
	cmp.w	#$0008,d1
	beq.s	L008a78
	cmp.w	#$001b,d1
	beq.s	$00008a8e
	cmp.b	d2,d4
	bcc.s	$000089f8
	move.w	d1,d0
	bsr.w	L008bb6
	add.l	d4,d0
	cmp.b	d2,d0
	bcc.s	$000089f8
	clr.w	d0
	tst.b	($1ca2)
	bne.s	$00008a44
	move.b	(a1),d0
	beq.s	$00008a44
	bsr.w	L008bb6
	addq.l	#1,a1
	addq.b	#1,d4
	move.b	d1,(a6)+
	tst.w	d0
	beq.s	$00008a50
	move.b	#$20,(a1)		;' '
	bsr.w	L008afc
	bra.s	$00008a02

	moveq.l	#$0d,d1
	bsr.w	$00008ea4
	clr.b	(a6)
	move.b	d4,(a2)+
	clr.w	d0
	move.b	d4,d0
	movea.l	a2,a1
	movea.l	sp,a0
	move.b	(a0)+,(a1)+
	dbra.w	d0,$00008a68
	clr.l	d0
	move.b	d4,d0
	lea.l	($0108,sp),sp
	rts

L008a78:
	bsr.w	$00008da0
	bsr.w	$00008b1a
	cmpa.l	a1,a2
	bcs.w	$00008a02
	lea.l	($0001,a2),a1
	bra.w	$00008a02

	bsr.w	$00008e60
	move.l	d0,d1
	cmp.w	#$0020,d1		;' '
	bcs.s	$00008a22
	and.w	#$00df,d1
	lea.l	(L008ed6),a5
	lea.l	(L008ad8),a4
	move.w	#$0008,d0
	cmp.b	(a5)+,d1
	beq.s	$00008ad0
	addq.l	#4,a4
	dbra.w	d0,$00008aae
	cmp.b	#$40,d1			;'@'
	bcs.w	$00008a02
	cmp.b	#$60,d1			;'`'
	bcc.w	$00008a02
	and.w	#$001f,d1
	bra.w	$00008a22

	movea.l	(a4),a4
	jsr	(a4)
	bra.w	$00008a02

L008ad8:
	.dc.l	L008c52
	.dc.l	L008c7c
	.dc.l	L008c90
	.dc.l	L008cac
	.dc.l	L008cc6
	.dc.l	L008cdc
	.dc.l	L008cec
	.dc.l	L008d94
	.dc.l	L008d14
L008afc:
	cmp.b	#$20,d1			;' '
	bcs.s	$00008b06
	bra.w	$00008ea4

	move.w	d1,-(sp)
	move.b	#$5e,d1			;'^'
	bsr.w	$00008ea4
	move.w	(sp)+,d1
	add.w	#$0040,d1
	bra.w	$00008ea4

	clr.l	d0
	tst.b	d4
	beq.s	$00008b44
	bsr.s	L008b46
	move.l	d0,-(sp)
	moveq.l	#$08,d1
	bsr.w	$00008ea4
	moveq.l	#$20,d1			;' '
	bsr.w	$00008ea4
	moveq.l	#$08,d1
	bsr.w	$00008ea4
	move.l	(sp)+,d0
	subq.w	#1,d0
	bne.s	$00008b22
	swap.w	d0
	suba.l	d0,a1
	suba.l	d0,a6
	sub.b	d0,d4
	rts

L008b46:
	movem.l	d1/a6,-(sp)
	clr.l	d0
	move.b	d4,d0
	suba.l	d0,a6
	move.b	(a6)+,d1
	cmp.b	#$80,d1
	bcs.s	$00008b68
	cmp.b	#$a0,d1
	bcs.s	$00008b64
	cmp.b	#$e0,d1
	bcs.s	$00008b68
	addq.l	#1,a6
	subq.w	#1,d0
	subq.w	#1,d0
	bne.s	$00008b50
	move.b	d1,d0
	bsr.s	L008b76
	movem.l	(sp)+,d1/a6
	rts

L008b76:
	cmp.b	#$20,d0			;' '
	bcs.s	L008bae
	cmp.b	#$80,d0
	bcs.s	L008b9e
	beq.s	$00008b96
	cmp.b	#$a0,d0
	bcs.s	L008ba6
	cmp.b	#$e0,d0
	bcs.s	L008b9e
	cmp.b	#$f0,d0
	bcs.s	L008ba6
	move.l	#$00020001,d0
	rts

L008b9e:
	move.l	#$00010001,d0
	rts

L008ba6:
	move.l	#$00020002,d0
	rts

L008bae:
	move.l	#$00010002,d0
	rts

L008bb6:
	cmp.b	#$80,d0
	bcs.s	L008bcc
	cmp.b	#$a0,d0
	bcs.s	$00008bc8
	cmp.b	#$e0,d0
	bcs.s	L008bcc
	moveq.l	#$01,d0
	rts

L008bcc:
	clr.l	d0
	rts

L008bd0:
	bsr.w	L008e72
	clr.w	d1
	move.b	d0,d1
	bsr.s	L008bb6
	beq.s	$00008be8
	asl.w	#8,d1
	move.w	d1,-(sp)
	bsr.w	L008e72
	move.w	(sp)+,d1
	move.b	d0,d1
	rts

L008bea:
	clr.w	d5
	movea.l	a1,a5
	move.b	(a5)+,d0
	beq.s	L008c30
	addq.w	#1,d5
	cmp.b	#$80,d0
	bcs.s	$00008c0c
	cmp.b	#$a0,d0
	bcs.s	$00008c06
	cmp.b	#$e0,d0
	bcs.s	$00008c0c
	move.b	(a5)+,d0
	beq.s	L008c30
	addq.w	#1,d5
	cmp.w	#$0100,d1
	bcc.s	L008c34
	move.b	(a5)+,d0
	beq.s	L008c30
	move.w	d0,d6
	bsr.s	L008bb6
	beq.s	$00008c24
	move.b	(a5)+,d0
	beq.s	L008c30
	addq.w	#2,d5
	bra.s	$00008c12

	cmp.b	d1,d6
	beq.s	$00008c2c
	addq.w	#1,d5
	bra.s	$00008c12

	move.w	d5,d0
	rts

L008c30:
	clr.w	d0
	rts

L008c34:
	move.b	(a5)+,d0
	beq.s	L008c30
	move.w	d0,d6
	bsr.w	L008bb6
	beq.s	$00008c4e
	asl.w	#8,d6
	move.b	(a5)+,d6
	beq.s	L008c30
	cmp.w	d6,d1
	beq.s	$00008c2c
	addq.w	#2,d5
	bra.s	L008c34

	addq.w	#1,d5
	bra.s	L008c34

L008c52:
	bsr.w	$00008da0
	move.b	(a1),d0
	beq.s	$00008c7a
	bsr.w	L008b76
	swap.w	d0
	subq.w	#1,d0
	move.w	d0,d5
	add.b	d4,d0
	cmp.b	d2,d0
	bcc.s	$00008c7a
	clr.w	d1
	move.b	(a1)+,d1
	move.b	d1,(a6)+
	addq.b	#1,d4
	bsr.w	L008afc
	dbra.w	d5,$00008c6a
	rts

L008c7c:
	bsr.w	$00008da0
	bsr.w	L008bd0
	bsr.w	L008bea
	beq.s	$00008c7a
	move.w	d0,d5
	subq.w	#1,d5
	bra.s	$00008c6a

L008c90:
	bsr.w	$00008da0
	cmp.b	d2,d4
	bcc.s	$00008c7a
	clr.w	d1
	move.b	(a1)+,d1
	beq.s	$00008ca8
	move.b	d1,(a6)+
	addq.b	#1,d4
	bsr.w	L008afc
	bra.s	$00008c94

	subq.l	#1,a1
	rts

L008cac:
	bsr.w	$00008da0
	move.b	(a1)+,d0
	beq.s	$00008ca8
	bsr.w	L008b76
	swap.w	d0
	cmp.b	#$02,d0
	bne.s	$00008cc4
	move.b	(a1)+,d0
	beq.s	$00008ca8
	rts

L008cc6:
	bsr.w	$00008da0
	bsr.w	L008bd0
	bsr.w	L008bea
	beq.s	$00008c7a
	clr.l	d5
	move.w	d0,d5
	adda.l	d5,a1
	rts

L008cdc:
	bsr.w	$00008da0
	bsr.s	$00008d0c
	addq.l	#4,sp
	lea.l	($0001,a2),a1
	bra.w	$000089f2

L008cec:
	bsr.w	$00008da0
	tst.w	($0006,a3)
	bne.s	$00008d4e
	clr.b	(a6)
	move.b	#$40,d1			;'@'
	bsr.s	$00008d60
	lea.l	($0001,a2),a1
	addq.l	#4,sp
	movea.l	sp,a5
	movea.l	a1,a6
	bra.w	$000089e8

	bsr.w	$00008b1a
	bne.s	$00008d0c
	rts

L008d14:
	bsr.w	$00008da0
	clr.b	(a6)
	bsr.w	L008bd0
	move.l	d1,-(sp)
	bsr.s	$00008d0c
	lea.l	($0001,a2),a1
	lea.l	($0008,sp),a5
	movea.l	a1,a6
	move.w	#$00ff,d0
	move.b	(a5)+,(a6)+
	dbra.w	d0,$00008d30
	lea.l	($0008,sp),a6
	clr.w	d4
	move.l	(sp)+,d1
	bsr.w	L008bea
	beq.w	$00008c7a
	move.w	d0,d5
	subq.w	#1,d5
	bra.w	$00008c6a

	clr.b	(a6)
	bsr.s	$00008d0c
	lea.l	($0001,a2),a1
	addq.l	#4,sp
	movea.l	sp,a5
	movea.l	a1,a6
	bra.w	$000089e8

	bsr.w	$00008ea4
	moveq.l	#$08,d1
	bsr.w	$00008ea4
	tst.b	d4
	beq.s	$00008d8a
	bsr.w	L008b46
	move.l	d0,-(sp)
	moveq.l	#$08,d1
	bsr.w	$00008ea4
	move.l	(sp)+,d0
	subq.w	#1,d0
	bne.s	$00008d72
	swap.w	d0
	suba.l	d0,a1
	suba.l	d0,a6
	sub.b	d0,d4
	bne.s	$00008d6e
	moveq.l	#$0a,d1
	bsr.w	$00008ea4
	clr.w	d4
	rts

L008d94:
	not.b	($1ca2)
	clr.w	d0
	move.b	($1ca2),d0
	bra.s	$00008da6

	clr.w	d0
	move.b	d0,($1ca2)
	move.w	d0,-(sp)
	move.w	#$0004,-(sp)
	DOS	_KEYCTRL
	addq.l	#4,sp
	rts

L008db2:
	move.w	($1ca8),d0
	bne.s	$00008e0a
	lea.l	(L013f70),a1
	clr.w	d0
	move.b	($0001,a1),d0
	addq.w	#2,d0
	clr.b	(a1,d0.w)
	movem.l	d3/a0-a3,-(sp)
	move.w	d3,-(sp)
	bsr.w	L0089ae
	move.w	(sp)+,d3
	clr.w	-(sp)
	move.w	d3,d0
	bsr.w	L00a9d8
	move.l	a0,-(sp)
	move.w	d3,-(sp)
	movea.l	sp,a3
	moveq.l	#$0a,d1
	bsr.w	$00008ea4
	addq.l	#8,sp
	movem.l	(sp)+,d3/a0-a3
	lea.l	(L013f71),a1
	clr.l	d0
	move.b	(a1)+,d0
	move.l	a1,($1ca4)
	adda.l	d0,a1
	move.b	#$0d,(a1)+
	move.b	#$0a,(a1)
	addq.w	#2,d0
	subq.l	#1,d0
	move.w	d0,($1ca8)
	asl.w	#8,d0
	movea.l	($1ca4),a1
	move.b	(a1)+,d0
	move.l	a1,($1ca4)
	cmp.b	#$1a,d0
	bne.s	$00008e2a
	and.w	#$00ff,d0
	clr.w	($1ca8)
	rts

L008e2c:
	moveq.l	#$07,d0
	movem.l	d1/a1/a4-a5,-(sp)
	move.w	($0000.w,a3),d1
L008e36:
	bsr.w	$00009058
	movem.l	(sp)+,d1/a1/a4-a5
	rts

L008e40:
	bsr.s	L008e52
	tst.l	d1
	beq.s	$00008e50
	move.w	($0000.w,a3),d0
	bsr.w	$00008f9a
	move.l	d0,d1
	rts

L008e52:
	bsr.w	L008752
	moveq.l	#$05,d0
	bsr.s	$00008e2e
	move.l	d0,d1
	rts

L008e5e:
	DOS	_CHANGE_PR
	tst.b	($1c17)
	bne.w	$00008798
	bsr.s	L008e40
	tst.l	d1
	beq.s	L008e5e
	move.l	d1,d0
	rts

L008e72:
	bsr.s	$00008e60
	or.w	($0006,a3),d0
	cmp.w	($1cbc),d0
	beq.s	L008e8c
	cmp.w	($1cc0),d0
	beq.s	L008e98
	cmp.w	($1cbe),d0
	beq.s	$00008e9e
	rts

L008e8c:
	cmpi.b	#$02,($1c12)
	bne.w	$000086a4
	rts

L008e98:
	not.b	($1c13)
	bra.s	L008e72

	clr.b	($1c13)
	bra.s	L008e72

	move.l	($0002,a3),d0
	bne.s	L008ebc
	moveq.l	#$01,d0
	bsr.w	$00008f7e
	tst.b	($1c13)
	beq.s	$00008eba
	bsr.w	$00008f78
	rts

L008ebc:
	movem.l	d2/a0/a2,-(sp)
	movea.l	d0,a0
	moveq.l	#$01,d2
	move.w	d1,-(sp)
	lea.l	($0001,sp),a2
	bsr.w	L00caa8
	addq.l	#2,sp
	movem.l	(sp)+,d2/a0/a2
	bra.s	$00008eb0

L008ed6:
	.dc.b	$53,$54,$55,$56,$57,$45,$4a,$50
	.dc.b	$46,$00
Call_KEYSNS:
	bsr.w	L009014
	clr.l	d0
	tst.l	d1
	beq.s	$00008efc
	cmp.w	($1cc0),d1
	beq.s	L008efe
	cmp.w	($1cbe),d1
	beq.s	L008f0a
	bsr.w	$000088a6
	subq.l	#1,d0
	rts

L008efe:
	bsr.w	$00008f62
	not.b	($1c13)
	clr.l	d0
	rts

L008f0a:
	bsr.w	$00008f62
	clr.b	($1c13)
	clr.l	d0
	rts

Call_KFLUSH:
	move.w	(a6)+,d1
	bsr.w	L009020
	cmp.w	#$0001,d1
	beq.w	Call_GETCHAR
	cmp.w	#$0006,d1
	beq.w	Call_INPOUT
	cmp.w	#$0007,d1
	beq.w	Call_INKEY
	cmp.w	#$0008,d1
	beq.w	Call_GETC
	cmp.w	#$000a,d1
	beq.w	Call_GETS
	clr.l	d0
	rts

L008f48:
	bsr.s	$00008f7c
	tst.b	($1c13)
	beq.s	$00008f52
	bsr.s	$00008f78
	rts

L008f54:
	bsr.s	$00008f7e
	tst.b	($1c13)
	beq.s	$00008f5e
	bsr.s	$00008f78
	bra.w	$0000888e

	bsr.w	L009014
	tst.l	d1
	beq.s	$00008f6e
	bsr.s	L008f98
	move.l	d0,d1
	rts

L008f70:
	moveq.l	#$03,d0
	bra.s	$00008f9a

	moveq.l	#$03,d0
	bra.s	$00008f7e

	moveq.l	#$04,d0
	bra.s	$00008f7e

	moveq.l	#$01,d0
	movem.l	d1-d7/a0-a6,-(sp)
	move.w	d1,-(sp)
	lea.l	($0001,sp),a2
	moveq.l	#$01,d2
	move.w	d0,d1
	bsr.w	L00c438
	addq.l	#2,sp
	movem.l	(sp)+,d1-d7/a0-a6
	rts

L008f98:
	clr.l	d0
	movem.l	d1-d7/a0-a6,-(sp)
	clr.w	-(sp)
	lea.l	($0001,sp),a2
	moveq.l	#$01,d2
	move.w	d0,d1
	bsr.w	$0000c302
	move.w	(sp)+,d1
	tst.l	d0
	bmi.s	$00008fb6
	clr.l	d0
	move.w	d1,d0
	movem.l	(sp)+,d1-d7/a0-a6
	rts

L008fbc:
	clr.l	d2
	moveq.l	#$04,d0
	bra.s	$00008fd2

	clr.l	d2
	moveq.l	#$08,d0
	bra.s	$00008fd2

	moveq.l	#$01,d2
	moveq.l	#$04,d0
	bra.s	$00008fd2

	moveq.l	#$01,d2
	moveq.l	#$08,d0
	move.l	d1,-(sp)
	movea.l	sp,a2
	lea.l	(-$001a,sp),sp
	movea.l	sp,a5
	move.b	#$1a,($0000.w,a5)
	move.b	d0,($0002,a5)
	move.l	a2,($000e,a5)
	move.l	#$00000004,($0012,a5)
	move.l	d2,($0016,a5)
	move.l	($1cb6),d0
	bmi.s	$0000900c
	movea.l	d0,a1
	bsr.w	L00defa
	clr.l	d0
	move.b	($0003,a5),d0
	beq.s	$0000900c
	moveq.l	#$ff,d0
	lea.l	($001a,sp),sp
	move.l	(sp)+,d1
	rts

L009014:
	bsr.w	L008752
	moveq.l	#$05,d0
	bsr.s	$00009022
	move.l	d0,d1
	rts

L009020:
	moveq.l	#$07,d0
	movem.l	d1/a1/a4-a5,-(sp)
	clr.l	d1
	bsr.s	$00009058
	movem.l	(sp)+,d1/a1/a4-a5
	rts

L009030:
	moveq.l	#$07,d0
	movem.l	d1/a1/a4-a5,-(sp)
	moveq.l	#$03,d1
	bsr.s	$00009058
	movem.l	(sp)+,d1/a1/a4-a5
	rts

Call_CONSNS:
	moveq.l	#$0a,d0
	moveq.l	#$01,d1
	bra.s	L009092

Call_PRNSNS:
	moveq.l	#$0a,d0
	moveq.l	#$04,d1
	bra.s	L009092

Call_CINSNS:
	moveq.l	#$05,d0
	moveq.l	#$03,d1
	bra.s	L009092

Call_COUTSNS:
	moveq.l	#$0a,d0
	moveq.l	#$03,d1
	bra.s	L009092

	lea.l	(-$001a,sp),sp
	movea.l	sp,a5
	move.w	d0,-(sp)
	move.w	d1,d0
	bsr.w	L00a9d8
	moveq.l	#$20,d1			;' '
	move.w	(sp)+,d0
	btst.b	#$07,($0001,a0)
	beq.s	$00009088
	move.b	#$1a,($0000.w,a5)
	move.b	d0,($0002,a5)
	movea.l	($0002,a0),a1
	bsr.w	L00cba6
	move.b	($000d,a5),d1
	clr.l	d0
	move.b	d1,d0
	lea.l	($001a,sp),sp
	rts

L009092:
	lea.l	(-$001a,sp),sp
	movea.l	sp,a5
	move.w	d0,-(sp)
L00909a:
	move.w	d1,d0
	bsr.w	L00a9d8
	moveq.l	#$ff,d1
	move.w	(sp)+,d0
	btst.b	#$07,($0001,a0)
	beq.s	$000090c8
	move.b	#$1a,($0000.w,a5)
	move.b	d0,($0002,a5)
	movea.l	($0002,a0),a1
	bsr.w	L00defa
	clr.l	d1
	move.b	($0003,a5),d0
	bne.s	$000090c8
	moveq.l	#$ff,d1
	clr.l	d0
	move.b	d1,d0
	lea.l	($001a,sp),sp
	rts

Call_MALLOC2:
	move.w	(a6)+,d4
	cmp.b	#$03,d4
	bcs.s	$000090e0
	moveq.l	#$f2,d0
	rts

Call_MALLOC:
	clr.w	d4
	move.l	($1c04),d3
	move.l	($1c00),d5
	move.l	(a6)+,d0
	cmp.l	#$01000000,d0
	bcs.s	$000090f4
	moveq.l	#$ff,d0
	and.l	#$00ffffff,d0
	add.l	#$00000010,d0
	movea.l	(L013d0a),a0
	tst.w	d4
	bpl.s	$0000910c
	movea.l	(a6),a0
	clr.l	d7
	moveq.l	#$ff,d6
	suba.l	a6,a6
	suba.l	a5,a5
	movea.l	d3,a1
	move.l	($0008,a1),d1
	move.l	($000c,a1),d2
	beq.s	$0000917c
	add.l	#$0000000f,d1
	and.l	#$fffffff0,d1
	move.l	d2,d3
	sub.l	d1,d2
	cmp.l	d0,d2
	bcs.s	L009174
	tst.b	d4
	beq.s	$0000914c
	cmp.b	#$01,d4
	beq.s	$00009142
	movea.l	a1,a5
	bra.s	$00009114

	cmp.l	d6,d2
	bcc.s	$00009114
	move.l	d2,d6
	movea.l	a1,a6
	bra.s	$00009114

	movea.l	d1,a2
	movea.l	d3,a3
	add.l	d0,d1
	move.l	a1,($0000.w,a2)
	move.l	a0,($0004,a2)
	move.l	d1,($0008,a2)
	move.l	a3,($000c,a2)
	move.l	a2,($000c,a1)
	move.l	a2,($0000.w,a3)
	move.l	a2,d0
	add.l	#$00000010,d0
	rts

L009174:
	cmp.l	d2,d7
	bcc.s	$00009114
	move.l	d2,d7
	bra.s	$00009114

	move.l	d5,d2
	add.l	#$0000000f,d1
	and.l	#$fffffff0,d1
	move.l	d2,d3
	sub.l	d1,d2
	cmp.l	d0,d2
	bcs.s	L0091cc
	tst.b	d4
	beq.s	$000091aa
	cmp.b	#$01,d4
	beq.s	$000091a0
	movea.l	a1,a5
	bra.s	L0091cc

	cmp.l	d6,d2
	bcc.s	L0091cc
	move.l	d2,d6
	movea.l	a1,a6
	bra.s	L0091cc

	movea.l	d1,a2
	add.l	d0,d1
	move.l	a1,($0000.w,a2)
	move.l	a0,($0004,a2)
	move.l	d1,($0008,a2)
	clr.l	($000c,a2)
	move.l	a2,($000c,a1)
	move.l	a2,d0
	add.l	#$00000010,d0
	rts

L0091cc:
	tst.b	d4
	beq.s	$00009242
	cmp.b	#$01,d4
	beq.s	L00921e
	move.l	a5,d1
	beq.s	$00009242
	movea.l	a5,a1
	move.l	($0008,a1),d1
	move.l	($000c,a1),d2
	bne.s	$000091e8
	move.l	d5,d2
	sub.l	d0,d2
	and.l	#$fffffff0,d2
	add.l	d2,d0
	movea.l	d2,a2
	movea.l	($000c,a1),a3
	move.l	a3,d1
	beq.s	$00009200
	move.l	a2,($0000.w,a3)
	move.l	a1,($0000.w,a2)
	move.l	a0,($0004,a2)
	move.l	d0,($0008,a2)
	move.l	a3,($000c,a2)
	move.l	a2,($000c,a1)
	move.l	a2,d0
	add.l	#$00000010,d0
	rts

L00921e:
	move.l	a6,d1
	beq.s	$00009242
	movea.l	a6,a1
	move.l	($0008,a1),d1
	move.l	($000c,a1),d2
	bne.s	$00009230
	move.l	d5,d2
	add.l	#$0000000f,d1
	and.l	#$fffffff0,d1
	add.l	d1,d0
	movea.l	d1,a2
	bra.s	$000091f4

	cmp.l	d2,d7
	bcc.s	$00009248
	move.l	d2,d7
	move.l	d7,d0
	sub.l	#$00000010,d0
	bmi.s	L00925a
	add.l	#$81000000,d0
	rts

L00925a:
	add.l	#$00000010,d0
	add.l	#$82000000,d0
	rts

L009268:
	move.l	#$82000000.l,d0
	rts

Call_MFREE:
	move.l	($1c04),d1
	move.l	(a6),d0
	beq.s	L0092ac
	sub.l	#$00000010,d0
	movea.l	d1,a0
	cmp.l	d0,d1
	beq.s	L00928e
	move.l	($000c,a0),d1
	bne.s	$0000927e
	moveq.l	#$f7,d0
	rts

L00928e:
	movea.l	($0000.w,a0),a1
	move.l	a1,d0
	beq.s	$0000928a
	move.l	($000c,a0),d0
	move.l	d0,($000c,a1)
	tst.l	d0
	beq.s	$000092a8
	movea.l	d0,a2
	move.l	a1,($0000.w,a2)
	clr.l	d0
	rts

L0092ac:
	move.l	(L013d0a),d0
	bsr.s	L0092e6
	clr.l	d0
	rts

L0092b8:
	movem.l	d0-d1/a0-a2,-(sp)
	movea.l	($0000.w,a0),a1
L0092c0:
	move.l	a1,d0
	beq.s	$000092e0
	move.l	($000c,a0),d0
	move.l	d0,($000c,a1)
	beq.s	$000092d4
	movea.l	d0,a2
	move.l	a1,($0000.w,a2)
	move.l	($0004,a0),(L013d0a)
	move.l	a0,d0
	bsr.s	L0092e6
	movem.l	(sp)+,d0-d1/a0-a2
	rts

L0092e6:
	move.l	($1c04),d1
	movea.l	d1,a0
	move.l	($000c,a0),d1
	beq.s	$00009310
	cmp.l	($0004,a0),d0
	bne.s	$000092ea
	tst.l	($0000.w,a0)
	beq.s	$0000932a
	movea.l	($0000.w,a0),a1
	move.l	d1,($000c,a1)
	movea.l	d1,a2
	move.l	a1,($0000.w,a2)
	bsr.s	$0000931e
	bra.s	L0092e6

	cmp.l	($0004,a0),d0
	bne.s	$0000932a
	movea.l	($0000.w,a0),a1
	move.l	d1,($000c,a1)
	movem.l	d0-d1,-(sp)
	move.l	a0,d0
	bsr.s	L0092e6
	movem.l	(sp)+,d0-d1
	rts

Call_SETBLOCK:
	move.l	(a6)+,d1
	move.l	(a6),d0
	cmp.l	#$01000000,d0
	bcs.s	$0000933a
	moveq.l	#$ff,d0
	and.l	#$00ffffff,d0
	add.l	#$00000010,d0
	sub.l	#$00000010,d1
	move.l	($1c04),d2
	movea.l	d2,a0
	cmp.l	d1,d2
	beq.s	L009360
	move.l	($000c,a0),d2
	bne.s	$00009350
	moveq.l	#$f7,d0
	rts

L009360:
	move.l	($000c,a0),d2
	bne.s	$0000936a
	move.l	($1c00),d2
	sub.l	a0,d2
	cmp.l	d0,d2
	bcs.w	$00009246
	add.l	a0,d0
	move.l	d0,($0008,a0)
	clr.l	d0
	rts

Call_PSPSET:
	movea.l	(a6),a0
L00937e:
	suba.l	#$00000010,a0
	clr.l	d3
	clr.l	d6
	suba.l	a3,a3
	suba.l	a2,a2
	add.l	a0,d3
	add.l	#$00000100,d3
	movea.l	(L013d0a),a5
	move.l	a0,($0068,a5)
	move.l	d3,($0030,a0)
	move.l	d3,($0034,a0)
	add.l	d6,d3
	move.l	d3,($0038,a0)
	cmpa.l	#$00000000,a3
	bne.s	$000093be
	movea.l	(L013d0a),a5
	movea.l	($0010,a5),a3
	move.l	a3,($0010,a0)
	move.l	a2,($0020,a0)
	lea.l	($0024,a0),a6
	clr.l	(a6)+
	clr.l	(a6)+
	clr.l	(a6)
	movea.l	($1c5c),a5
	move.l	($003a,a5),($1bc0)
	lea.l	($003e,a5),a6
	tst.b	($0cbc)
	beq.s	$000093e6
	addq.l	#2,a6
	move.l	a6,($0040,a0)
	move.l	usp,a6
	move.l	a6,($003c,a0)
	move.w	($0038,a5),($0044,a0)
	clr.l	($0060,a0)
	clr.l	($0068,a0)
	bsr.w	L00a0ec
	move.l	a0,(L013d0a)
	clr.l	d0
	rts

Call_EXEC:
	cmpi.b	#$01,($0cbc)
	bls.s	$0000941a
	moveq.l	#$ac,d0
	moveq.l	#$03,d1
	trap	#15
	move.b	(a6)+,d0
	move.b	d0,($1ca1)
	clr.w	d1
	move.b	(a6)+,d1
	movea.l	(a6)+,a1
	cmp.w	#$0004,d1
	beq.w	L00976e
	movea.l	(a6)+,a2
	cmp.w	#$0005,d1
	beq.s	L00945a
	movea.l	(a6),a3
	tst.w	d1
	beq.w	L00960c
	cmp.w	#$0001,d1
	beq.w	L00960c
	cmp.w	#$0002,d1
	beq.w	L009bc4
	cmp.w	#$0003,d1
	beq.w	L009510
	moveq.l	#$f2,d0
	rts

L00945a:
	bsr.w	L009a80
	bmi.w	$0000950e
	lea.l	(-$0040,sp),sp
	movea.l	sp,a5
	move.l	#$00000040,-(sp)
	move.l	a5,-(sp)
	move.w	d2,-(sp)
	DOS	_READ
	addq.l	#6,sp
	cmp.l	(sp)+,d0
	bne.w	$00009500
	cmpi.w	#$4855,(a5)		;'HU'
	bne.s	$00009500
	moveq.l	#$fe,d6
	move.l	($003c,a5),d0
	beq.s	$000094fc
	clr.w	-(sp)
	move.l	d0,-(sp)
	move.w	d2,-(sp)
	DOS	_SEEK
	addq.l	#8,sp
	tst.l	d0
	bmi.s	$00009502
	lea.l	(-$0058,sp),sp
	movea.l	a2,a1
	movea.l	sp,a2
	movem.l	d1-d2/a0-a4,-(sp)
	bsr.w	L00ae1e
	movem.l	(sp)+,d1-d2/a0-a4
	move.b	#$58,($004b,a2)		;'X'
	lea.l	($0043,a2),a4
	moveq.l	#$ff,d5
	addq.b	#1,d5
	move.l	#$00000020,-(sp)
	move.l	a5,-(sp)
	move.w	d2,-(sp)
	DOS	_READ
	addq.l	#6,sp
	cmp.l	(sp)+,d0
	bne.s	$000094f8
	movea.l	a5,a1
	movea.l	a4,a2
	move.b	(a1),d0
	cmp.b	#$05,d0
	bne.s	$000094dc
	move.b	#$e5,d0
	bsr.w	L00f1ca
	bne.s	$000094b8
	move.l	($001c,a5),d6
	not.l	d6
	cmp.l	#$00000100,d6
	bcs.s	$000094f4
	clr.l	d6
	move.b	d5,d6
	lsl.l	#8,d6
	bra.s	$000094b8

	lea.l	($0058,sp),sp
	move.l	d6,d0
	bra.s	$00009502

	moveq.l	#$f5,d0
	lea.l	($0040,sp),sp
	move.l	d0,-(sp)
	bsr.w	L009ab4
	move.l	(sp)+,d0
	rts

L009510:
	bsr.w	$0000997c
	cmp.b	#$78,d0			;'x'
	beq.s	$0000958c
	cmp.b	#$72,d0			;'r'
	beq.s	L009560
	cmp.b	#$7a,d0			;'z'
	beq.s	$00009536
	move.l	a1,d0
	rol.l	#8,d0
	tst.b	d0
	beq.s	L00955c
	subq.b	#1,d0
	beq.s	L009560
	subq.b	#1,d0
	bne.s	$0000958c
	bsr.w	L009a0e
	tst.l	d0
	bmi.s	$0000955a
	cmpa.l	a2,a4
	bne.s	$00009554
	move.l	a2,d0
	add.l	d3,d0
	add.l	d6,d0
	cmpa.l	d0,a3
	bcs.s	$00009554
	bsr.w	L009a62
	bra.w	$000095fe

	bsr.w	$00009a5a
	moveq.l	#$f8,d0
	rts

L00955c:
	moveq.l	#$f3,d0
	rts

L009560:
	bsr.w	L009a80
	bmi.s	$0000955a
	bsr.w	L009a94
	bmi.w	$00009a5a
	move.l	d0,d3
	add.l	a2,d0
	cmpa.l	d0,a3
	bcs.s	$00009554
	move.l	d3,-(sp)
	move.l	a2,-(sp)
	move.w	d2,-(sp)
	DOS	_READ
	lea.l	($000a,sp),sp
	tst.l	d0
	beq.w	$00009a58
	bra.w	$00009a5a

	bsr.w	L009a80
	bmi.s	$0000955a
	lea.l	(-$0040,sp),sp
	movea.l	sp,a5
	move.l	#$00000040,-(sp)
	move.l	a5,-(sp)
	move.w	d2,-(sp)
	DOS	_READ
	addq.l	#6,sp
	cmp.l	(sp)+,d0
	bne.w	$0000995c
	cmpi.w	#$4855,(a5)		;'HU'
	bne.w	$0000995a
	bsr.w	L009ac6
	bcs.w	$0000995a
	move.l	($000c,a5),d3
	beq.w	$0000995c
	add.l	($0010,a5),d3
	move.l	($0014,a5),d6
	move.l	d3,d0
	add.l	a2,d0
	add.l	d6,d0
	cmpa.l	d0,a3
	bcs.w	L009956
	move.l	d3,-(sp)
	move.l	a2,-(sp)
	move.w	d2,-(sp)
	DOS	_READ
	addq.l	#6,sp
	cmp.l	(sp)+,d0
	bne.w	$0000995c
	movea.l	a2,a4
	bsr.w	L0098c0
	bmi.w	$0000995c
	bsr.w	L009ab4
	move.l	d3,d0
	add.l	d6,d0
	lea.l	($0040,sp),sp
	move.l	d0,-(sp)
	lea.l	(-$0100,a2),a0
	bsr.w	$000098a0
	move.l	(sp)+,d0
	rts

L00960c:
	move.b	#-$01,($1ca0)
	bsr.s	L00961a
	clr.b	($1ca0)
	rts

L00961a:
	move.l	a1,($1cb2)
	bsr.w	$0000997c
	cmp.b	#$78,d0			;'x'
	beq.w	$00009812
	cmp.b	#$72,d0			;'r'
	beq.w	L0097ca
	cmp.b	#$7a,d0			;'z'
	beq.s	$0000964e
	move.l	a1,d0
	rol.l	#8,d0
	tst.b	d0
	beq.w	L00955c
	subq.b	#1,d0
	beq.w	L0097ca
	subq.b	#1,d0
	bne.w	$00009812
	bsr.w	L009a0e
	tst.l	d0
	bmi.w	$0000955a
	movea.l	a4,a0
	suba.l	#$00000100,a0
	bsr.w	L009b40
	tst.l	d0
	bne.w	$00009a5a
	move.b	#-$02,($1ca0)
	move.l	a0,($1caa)
	bsr.w	L009a62
	tst.l	d0
	bmi.w	$000097b6
	bsr.w	$000098a0
	move.b	#-$03,($1ca0)
	bsr.w	$0000938c
	clr.b	($1ca0)
	movem.l	d1/a0-a5,-(sp)
	move.b	($1ca1),($0064,a0)
	movea.l	($1cb2),a1
	lea.l	(-$005a,sp),sp
	movea.l	sp,a2
	bsr.w	$0000ad68
	lea.l	($0080,a0),a1
	move.b	($0001,a2),d0
	bsr.w	L00a728
	add.b	#$41,d0			;'A'
	move.b	d0,(a1)+
	move.b	#$3a,(a1)+		;':'
	lea.l	($0002,a2),a3
	move.b	(a3)+,(a1)+
	bne.s	$000096c2
	lea.l	($00c4,a0),a1
	moveq.l	#$07,d1
	lea.l	($0043,a2),a3
	move.b	(a3)+,d0
	cmp.b	#$20,d0			;' '
	beq.s	$000096f4
	move.b	d0,(a1)+
	dbra.w	d1,$000096d0
	moveq.l	#$09,d1
	lea.l	($004e,a2),a3
	move.b	(a3)+,d0
	beq.s	$000096f4
	cmp.b	#$20,d0			;' '
	beq.s	$000096f4
	move.b	d0,(a1)+
	dbra.w	d1,$000096e4
	move.b	#$2e,(a1)+		;'.'
	moveq.l	#$02,d1
	lea.l	($004b,a2),a3
	move.b	(a3)+,d0
	cmp.b	#$20,d0			;' '
	beq.s	$0000970c
	move.b	d0,(a1)+
	dbra.w	d1,$000096fe
	clr.b	(a1)
	lea.l	($0080,a0),a1
	bsr.w	L00a7d6
	lea.l	($005a,sp),sp
	movem.l	(sp)+,d1/a0-a5
	move.l	a0,($001c,a5)
	move.l	a1,($0020,a5)
	move.l	a2,($0024,a5)
	move.l	a3,($0028,a5)
	move.l	a4,($002c,a5)
	move.l	a4,d0
	tst.w	d1
	bne.w	$0000955a
	bsr.w	L010134
	ori.w	#$0700,sr
	move.l	a4,($003a,a5)
	move.l	a4,d0
	and.l	#$00ffffff,d0
	cmp.l	(L00837a),d0
	bcc.s	L00975e
	ori.w	#$2000,($0038,a5)
	rts

L00975e:
	cmp.l	#$00c00000,d0
	bcc.s	$00009756
	andi.w	#$dfff,($0038,a5)
	rts

L00976e:
	movea.l	a1,a4
L009770:
	movea.l	(L013d0a),a0
	movea.l	($0038,a0),a1
	movea.l	($0020,a0),a2
	movea.l	($0010,a0),a3
	movea.l	($1c5c),a5
	move.l	($003a,a5),($1bc0)
	lea.l	($003e,a5),a6
	tst.b	($0cbc)
	beq.s	$00009798
	addq.l	#2,a6
	move.l	a6,($0040,a0)
	move.l	usp,a6
	move.l	a6,($003c,a0)
	move.w	($0038,a5),($0044,a0)
	bsr.w	L00a0ec
	clr.l	d1
	bra.w	$0000971e

	bsr.w	$00009a5a
	move.l	d0,-(sp)
	lea.l	($0010,a0),a0
	move.l	a0,-(sp)
	DOS	_MFREE
	addq.l	#4,sp
	move.l	(sp)+,d0
	clr.b	($1ca0)
	rts

L0097ca:
	bsr.w	L009a80
	bmi.w	$0000955a
	bsr.w	L009a94
	bmi.w	$00009a5a
	move.l	d0,d3
	add.l	#$000000f0,d0
	bsr.w	$000099d8
	bmi.w	$00009a5a
	move.b	#-$02,($1ca0)
	move.l	a0,($1caa)
	move.l	d3,-(sp)
	move.l	a4,-(sp)
	move.w	d2,-(sp)
	DOS	_READ
	lea.l	($000a,sp),sp
	tst.l	d0
	beq.w	$00009a58
	bmi.s	$000097b2
	bsr.w	L009ab4
	clr.l	d6
	bra.w	$0000967e

	bsr.w	L009a80
	bmi.w	$0000955a
	lea.l	(-$0040,sp),sp
	movea.l	sp,a5
	move.l	#$00000040,-(sp)
	move.l	a5,-(sp)
	move.w	d2,-(sp)
	DOS	_READ
	addq.l	#6,sp
	cmp.l	(sp)+,d0
	bne.w	$0000995c
	cmpi.w	#$4855,(a5)		;'HU'
	bne.w	$0000995a
	bsr.w	L009ac6
	bcs.w	$0000995a
	move.l	($000c,a5),d3
	beq.w	$0000995c
	add.l	($0010,a5),d3
	move.l	($0014,a5),d6
	move.l	d3,d0
	add.l	d6,d0
	add.l	#$000000f0,d0
	bsr.w	L0099b2
	bmi.w	$0000995c
	move.b	#-$02,($1ca0)
	move.l	a0,($1caa)
	move.l	d3,-(sp)
	move.l	a4,-(sp)
	move.w	d2,-(sp)
	DOS	_READ
	addq.l	#6,sp
	cmp.l	(sp)+,d0
	bne.w	$0000996c
	bsr.s	L0098c0
	bmi.w	$0000996c
	movea.l	($0008,a5),a4
	suba.l	($0004,a5),a4
	adda.l	a0,a4
	lea.l	($0100,a4),a4
	lea.l	($0040,sp),sp
	bsr.w	L009ab4
	bra.w	$0000967e

	lea.l	($0100,a0),a1
	adda.l	d3,a1
	tst.l	d6
	beq.s	$000098be
	move.l	d6,d0
	subq.l	#1,d0
	swap.w	d0
	swap.w	d0
	clr.b	(a1)+
	dbra.w	d0,$000098b2
	swap.w	d0
	dbra.w	d0,$000098b0
	rts

L0098c0:
	movem.l	d1/a0,-(sp)
	lea.l	(-$0104,sp),sp
	movea.l	sp,a0
	clr.w	(a0)
	move.l	a4,d7
	sub.l	($0004,a5),d7
	beq.s	$000098fa
	move.l	($0018,a5),d5
	tst.l	d5
	beq.s	$000098fa
	bsr.s	L009918
	bmi.s	$000098fc
	cmp.w	#$0001,d0
	bne.s	$000098ea
	bsr.s	L009908
	bmi.s	$000098fc
	bclr.l	#$00,d0
	adda.l	d0,a4
	bne.s	$000098f6
	add.l	d7,(a4)
	bra.s	$000098d8

	add.w	d7,(a4)
	bra.s	$000098d8

	clr.l	d0
	lea.l	($0104,sp),sp
	movem.l	(sp)+,d1/a0
	tst.l	d0
	rts

L009908:
	bsr.s	L009918
	bmi.s	$00009916
	move.l	d0,d1
	bsr.s	L009918
	bmi.s	$00009916
	swap.w	d1
	or.l	d1,d0
	rts

L009918:
	clr.l	d0
	tst.l	d5
	beq.s	$0000994c
	move.w	(a0)+,d0
	bne.s	$00009942
	move.l	#$00000100,-(sp)
	move.l	a0,-(sp)
	move.w	d2,-(sp)
	DOS	_READ
	lea.l	($000a,sp),sp
	tst.l	d0
	beq.s	L009950
	bmi.s	$00009952
	clr.w	(a0,d0.w)
	clr.w	(-$0002,a0)
	clr.w	d0
	move.w	(a0,d0.w),d0
	addq.b	#2,-(a0)
	subq.l	#1,a0
	subq.l	#2,d5
	tst.l	d0
	rts

L009950:
	moveq.l	#$f5,d0
	subq.l	#2,a0
	rts

L009956:
	moveq.l	#$f8,d0
	bra.s	$0000995c

	moveq.l	#$f5,d0
	lea.l	($0040,sp),sp
	tst.l	d0
	bmi.w	$00009a5a
	moveq.l	#$f5,d0
	bra.w	$00009a5a

	lea.l	($0040,sp),sp
	tst.l	d0
	bmi.w	$000097b2
	moveq.l	#$f5,d0
	bra.w	$000097b2

	movem.l	d1/a1,-(sp)
	clr.w	d1
	addq.w	#1,d1
	move.b	(a1)+,d0
	bne.s	$00009982
	subq.l	#1,a1
	subq.w	#1,d1
	beq.s	L0099aa
	move.b	-(a1),d0
	cmp.b	#$20,d0			;' '
	beq.s	$0000998a
	subq.l	#1,d1
	beq.s	L0099aa
	cmpi.b	#$2e,-(a1)		;'.'
	bne.s	L0099aa
	or.b	#$20,d0
	movem.l	(sp)+,d1/a1
	rts

L0099aa:
	movem.l	(sp)+,d1/a1
	clr.l	d0
	rts

L0099b2:
	movem.l	d1-d2,-(sp)
	move.b	($0003,a5),d1
	moveq.l	#$02,d2
	btst.l	#$01,d1
	bne.s	$000099ca
	subq.w	#1,d2
	btst.l	#$01,d1
	beq.s	$000099dc
	move.l	d0,-(sp)
	move.w	d2,-(sp)
	DOS	_MALLOC2
	addq.l	#6,sp
	tst.l	d0
	bmi.s	$00009a06
	bra.s	$000099fa

	movem.l	d1-d2,-(sp)
	move.l	#$00ffffff,d2
	move.l	d0,d1
	move.l	d2,-(sp)
	DOS	_MALLOC
	addq.l	#4,sp
	tst.l	d0
	bpl.s	$000099fa
	and.l	d0,d2
	cmp.l	d1,d2
	bcs.s	$00009a06
	move.l	d2,-(sp)
	DOS	_MALLOC
	addq.l	#4,sp
	movea.l	d0,a0
	lea.l	(-$0010,a0),a0
	movea.l	a0,a4
	lea.l	($0100,a4),a4
	movem.l	(sp)+,d1-d2
	tst.l	d0
	rts

L009a0e:
	bsr.s	L009a80
	bmi.s	$00009a60
	link.w	a5,#-$001e
	movea.l	sp,a6
	move.l	#$0000001c,-(sp)
	move.l	a6,-(sp)
	move.w	d2,-(sp)
	DOS	_READ
	adda.l	#$0000000a,sp
	move.w	(a6),d4
	move.l	($0002,a6),d3
	add.l	($0006,a6),d3
	move.l	($000a,a6),d6
	movea.l	($0016,a6),a4
	move.w	($001a,a6),d5
	unlk	a5
	tst.l	d0
	bmi.s	$00009a5a
	cmpi.w	#$001c,d0
	bne.s	$00009a58
	cmpi.w	#$601a,d4
	bne.s	$00009a58
	clr.l	d0
	tst.w	d5
	bne.s	$00009a60
	moveq.l	#$f5,d0
	move.l	d0,-(sp)
	bsr.s	L009ab4
	move.l	(sp)+,d0
	rts

L009a62:
	move.l	d3,-(sp)
	move.l	a4,-(sp)
	move.w	d2,-(sp)
	DOS	_READ
	adda.l	#$0000000a,sp
	tst.l	d0
	bmi.s	$00009a5a
	cmp.l	d0,d3
	bne.s	$00009a58
	bsr.s	L009ab4
	move.l	d3,d0
	add.l	d6,d0
	rts

L009a80:
	move.w	#$0000,-(sp)
	move.l	a1,-(sp)
	DOS	_OPEN
	addq.l	#6,sp
	move.l	d0,d2
	move.l	d0,(L014076)
	rts

L009a94:
	move.w	#$0002,-(sp)
	clr.l	-(sp)
	move.w	d2,-(sp)
	DOS	_SEEK
	lea.l	($0008,sp),sp
	move.l	d0,-(sp)
	clr.w	-(sp)
	clr.l	-(sp)
	move.w	d2,-(sp)
	DOS	_SEEK
	lea.l	($0008,sp),sp
	move.l	(sp)+,d0
	rts

L009ab4:
	move.w	d2,-(sp)
	DOS	_CLOSE
	addq.l	#2,sp
	move.l	#$ffffffff,(L014076)
	rts

L009ac6:
	movem.l	d1,-(sp)
	clr.l	d1
	move.b	($1ca1),d1
	beq.s	$00009b3a
	move.l	($003c,a5),d0
	beq.s	$00009b36
	asl.l	#5,d1
	add.l	d1,d0
	add.l	#$0000001c,d0
	clr.w	-(sp)
	move.l	d0,-(sp)
	move.w	d2,-(sp)
	DOS	_SEEK
	addq.l	#8,sp
	tst.l	d0
	bmi.s	$00009b36
	clr.l	-(sp)
	move.l	sp,d0
	move.l	#$00000004,-(sp)
	move.l	d0,-(sp)
	move.w	d2,-(sp)
	DOS	_READ
	lea.l	($000a,sp),sp
	move.l	(sp)+,d1
	bmi.s	$00009b36
	cmp.l	#$00000004,d0
	bne.s	$00009b36
	clr.w	-(sp)
	move.l	d1,-(sp)
	move.w	d2,-(sp)
	DOS	_SEEK
	addq.l	#8,sp
	tst.l	d0
	bmi.s	$00009b36
	move.l	#$00000040,-(sp)
	move.l	a5,-(sp)
	move.w	d2,-(sp)
	DOS	_READ
	addq.l	#6,sp
	cmp.l	(sp)+,d0
	bne.s	$00009b36
	cmpi.w	#$4855,(a5)		;'HU'
	beq.s	$00009b3a
	ori.b	#$01,ccr
	movem.l	(sp)+,d1
	rts

L009b40:
	movem.l	d1-d7/a0-a5,-(sp)
	move.l	a4,d0
	move.l	d3,d1
	add.l	d6,d1
	bsr.s	L009b7a
	tst.l	d0
	bne.s	$00009b74
	move.l	a1,($0000.w,a0)
	movea.l	(L013d0a),a5
	move.l	a5,($0004,a0)
	move.l	d5,($0008,a0)
	move.l	d3,($000c,a0)
	move.l	a0,($000c,a1)
	tst.l	d3
	beq.s	$00009b74
	movea.l	d3,a5
	move.l	a0,($0000.w,a5)
	movem.l	(sp)+,d1-d7/a0-a5
	rts

L009b7a:
	add.l	#$00000100,d1
	sub.l	#$00000100,d0
	add.l	d0,d1
	move.l	($1c04),d3
	movea.l	d3,a1
	move.l	($0008,a1),d4
	move.l	($000c,a1),d5
	beq.s	L009bae
	move.l	d5,d3
	cmp.l	a1,d1
	bcs.s	$00009b8c
	cmp.l	d4,d0
	bcs.s	L009bc0
	cmp.l	d0,d5
	bcs.s	$00009b8c
	cmp.l	d1,d5
	bcs.s	L009bc0
	clr.l	d0
	rts

L009bae:
	move.l	($1c00),d5
	cmp.l	d4,d0
	bcs.s	L009bc0
	cmp.l	d1,d5
	bcs.s	L009bc0
	clr.l	d0
	clr.l	d3
	rts

L009bc0:
	moveq.l	#$f8,d0
	rts

L009bc4:
	link.w	a6,#-$01ae
	cmpa.l	#$00000000,a3
	bne.s	$00009bda
	movea.l	(L013d0a),a3
	movea.l	($0010,a3),a3
	cmpa.l	#$ffffffff,a3
	bne.s	$00009be8
	lea.l	(L0111f2),a3
	move.l	a3,(-$0004,a6)
	movea.l	a2,a5
	move.l	a1,-(sp)
	lea.l	(-$0176,a6),a0
	bsr.w	L009ed4
	bsr.s	L009c16
	beq.s	$00009c0e
	bsr.w	L009d42
	beq.s	$00009c0e
	movea.l	a0,a1
	movea.l	(sp),a0
	bsr.w	L009ed4
	clr.l	d0
	bra.s	$00009c10

	moveq.l	#$fe,d0
	movea.l	(sp)+,a1
	unlk	a6
	rts

L009c16:
	lea.l	(-$0176,a6),a0
L009c1a:
	bsr.w	L009f18
	adda.l	d0,a0
	movea.l	a5,a1
	clr.w	d1
	move.b	(a0),d0
	beq.s	$00009c4e
	cmp.b	#$3f,d0			;'?'
	beq.w	L009d3e
	cmp.b	#$2a,d0			;'*'
	beq.w	L009d3e
	bsr.w	L00f250
	beq.s	$00009c4e
	bsr.w	L009f18
	tst.l	d0
	bne.s	$00009c4c
	move.b	(a0)+,(a1)+
	addq.w	#1,d1
	bra.s	$00009c24

	adda.l	d0,a0
	tst.w	d1
	beq.w	L009d3e
	clr.b	(a1)
	movea.l	a5,a2
	move.l	a2,-(sp)
	clr.b	d2
	clr.b	d3
	cmp.b	d1,d2
	beq.s	$00009c96
	move.b	(a2)+,d0
	tst.b	d3
	beq.s	$00009c6c
	clr.b	d3
	bra.s	$00009c92

	cmp.b	#$80,d0
	bcs.s	$00009c84
	cmp.b	#$a0,d0
	bcs.s	$00009c7e
	cmp.b	#$e0,d0
	bcs.s	$00009c84
	move.b	#$01,d3
	bra.s	$00009c92

	cmpi.b	#$3a,d0			;':'
	beq.s	$00009c90
	cmpi.b	#$5c,d0			;'\'
	bne.s	$00009c92
	move.l	a2,(sp)
	addq.b	#1,d2
	bra.s	$00009c5e

	movea.l	(sp)+,a2
	cmpa.l	a1,a2
	beq.w	L009d3e
	move.l	a1,d0
	sub.l	a2,d0
	cmpi.w	#$0016,d0
	bhi.w	L009d3e
	lea.l	(-$0076,a6),a3
	movea.l	a2,a4
	subq.w	#1,d0
	move.b	(a4)+,(a3)+
	dbra.w	d0,$00009cb2
	clr.b	(a3)
	lea.l	(-$005e,a6),a3
	movea.l	a5,a4
	move.l	a2,d0
	sub.l	a4,d0
	clr.b	(-$0005,a6)
	cmp.l	#$00000040,d0
	bhi.s	L009d3e
	tst.l	d0
	beq.s	$00009d04
	move.b	#$01,(-$0005,a6)
	cmp.l	#$00000002,d0
	bcs.s	$00009d04
	cmpi.b	#$3a,($0001,a4)		;':'
	bne.s	$00009d04
	move.l	d0,d1
	move.b	(a4),d0
	or.b	#$20,d0
	sub.b	#$61,d0			;'a'
	bsr.w	L009fce
	tst.l	d0
	bmi.s	L009d3e
	move.l	d1,d0
	bra.s	$00009d04

	move.b	(a4)+,(a3)+
	dbra.w	d0,$00009d02
	clr.b	(a3)
	lea.l	(-$0076,a6),a1
	move.b	#-$01,(-$0006,a6)
	move.b	(a1)+,d0
	cmpi.b	#$2e,d0			;'.'
	beq.s	$00009d24
	tst.b	d0
	bne.s	$00009d14
	addq.b	#1,(-$0006,a6)
	clr.b	d1
	lea.l	($0001,a5),a1
	move.b	(a0)+,(a1)+
	beq.s	$00009d36
	addq.b	#1,d1
	tst.b	d1
	beq.s	L009d3e
	bra.s	$00009d2a

	move.b	d1,(a5)
	move.w	#$ffff,d0
	rts

L009d3e:
	clr.w	d0
	rts

L009d42:
	tst.b	(-$0005,a6)
	beq.s	$00009d5c
	lea.l	(-$0076,a6),a1
	lea.l	(-$005e,a6),a0
	bsr.w	L009ee2
	lea.l	(L0111fc),a3
	bra.s	$00009d90

	movea.l	(-$0004,a6),a1
	lea.l	(L0111f6),a0
	bsr.w	L009f94
	bne.s	L009d72
	lea.l	(L0111fc),a3
L009d72:
	movea.l	a0,a3
	lea.l	(-$0076,a6),a1
	lea.l	(-$005e,a6),a0
L009d7c:
	bsr.w	L009ed4
	bra.s	$00009d90

	tst.b	(a3)
	bne.s	$00009d8e
	tst.b	(-$005e,a6)
	bne.s	L009df6
	bra.s	$00009d90

	bsr.s	L009dfa
	tst.b	(-$0006,a6)
	bne.s	$00009dae
	clr.b	d2
	lea.l	(-$005e,a6),a0
	bsr.w	L009ec2
	movea.l	a0,a2
	adda.l	d0,a2
	lea.l	(L011204),a1
	bsr.w	L009ee2
	lea.l	(-$005e,a6),a0
	lea.l	(-$01ae,a6),a1
	bsr.w	L009f7c
	tst.l	d0
	bmi.s	$00009d82
	tst.b	(-$0006,a6)
	bne.s	$00009de8
	lea.l	(-$0190,a6),a0
	bsr.w	L009e56
	lea.l	(-$01ae,a6),a1
	bsr.w	L009f8c
	tst.l	d0
	bpl.s	$00009dc4
	tst.b	d2
	beq.s	$00009d82
	movea.l	a4,a1
	movea.l	a2,a0
	move.b	#$2e,(a0)+		;'.'
	bsr.w	L009ed4
	lea.l	(-$005e,a6),a0
	movea.l	a5,a1
	move.b	#-$01,d0
	tst.b	d0
	rts

L009df6:
	clr.b	d0
	rts

L009dfa:
	lea.l	(-$005e,a6),a0
	clr.b	d3
	move.b	(a3)+,d0
	beq.s	$00009e36
	cmp.b	#$3b,d0			;';'
	beq.s	$00009e38
	move.b	d0,(a0)+
	tst.b	d3
	beq.s	$00009e1e
	cmp.b	#$02,d3
	beq.s	$00009e1c
	move.b	#$02,d3
	bra.s	$00009e00

	clr.b	d3
	cmp.b	#$80,d0
	bcs.s	$00009e00
	cmp.b	#$a0,d0
	bcs.s	$00009e30
	cmp.b	#$e0,d0
	bcs.s	$00009e00
	move.b	#$01,d3
	bra.s	$00009e00

	subq.l	#1,a3
	move.b	(-$0001,a0),d0
	cmp.b	#$02,d3
	beq.s	$00009e48
	cmp.b	#$5c,d0			;'\'
	beq.s	$00009e4c
	move.b	#$5c,(a0)+		;'\'
	lea.l	(-$0076,a6),a1
	bsr.w	L009ed4
	rts

L009e56:
	pea.l	(a0)
	bsr.w	L009f32
	addq.l	#4,sp
	clr.l	d1
	move.b	(a0)+,d0
	beq.s	$00009e6e
	cmp.b	#$2e,d0			;'.'
	bne.s	$00009e60
	move.l	a0,d1
	bra.s	$00009e60

	tst.l	d1
	beq.s	$00009ea0
	movea.l	d1,a0
	move.b	#$03,d1
	lea.l	(L0111fd),a1
	pea.l	(a0)
	pea.l	(a1)
	bsr.s	L009ea2
	lea.l	($0004,sp),sp
	beq.s	$00009e96
	tst.b	(a1)+
	bne.s	$00009e8a
	subq.b	#1,d1
	beq.s	$00009e96
	tst.b	(a1)
	bne.s	$00009e80
	addq.l	#4,sp
	cmp.b	d2,d1
	bcs.s	$00009ea0
	movea.l	a1,a4
	move.b	d1,d2
	rts

L009ea2:
	movem.l	d0/a4-a5,-(sp)
	movea.l	($0010,sp),a4
	movea.l	($0014,sp),a5
	move.b	(a5)+,d0
	beq.s	$00009eba
	cmp.b	(a4)+,d0
	beq.s	$00009eae
	moveq.l	#$ff,d0
	bra.s	$00009ebc

	tst.b	(a4)
	movem.l	(sp)+,d0/a4-a5
	rts

L009ec2:
	move.l	a0,-(sp)
	moveq.l	#$ff,d0
	addi.l	#$00000001,d0
	tst.b	(a0)+
	bne.s	$00009ec6
	movea.l	(sp)+,a0
	rts

L009ed4:
	movem.l	a0-a1,-(sp)
	move.b	(a1)+,(a0)+
	bne.s	$00009ed8
	movem.l	(sp)+,a0-a1
	rts

L009ee2:
	movem.l	a0-a1,-(sp)
	tst.b	(a0)+
	bne.s	$00009ee6
	subq.l	#1,a0
	move.b	(a1)+,(a0)+
	bne.s	$00009eec
	movem.l	(sp)+,a0-a1
	rts

L009ef6:
	movem.l	a0-a1,-(sp)
	bra.s	$00009f00

	cmpm.b	(a0)+,(a1)+
	bne.s	$00009f08
	dbra.w	d0,$00009efc
	clr.l	d0
	bra.s	$00009f10

	bcs.s	$00009f0e
	moveq.l	#$01,d0
	bra.s	$00009f10

	moveq.l	#$ff,d0
	tst.l	d0
	movem.l	(sp)+,a0-a1
	rts

L009f18:
	move.l	a0,-(sp)
	move.b	(a0)+,d0
	cmpi.b	#$20,d0			;' '
	beq.s	$00009f1a
	cmpi.b	#$09,d0
	beq.s	$00009f1a
	move.l	a0,d0
	movea.l	(sp)+,a0
	sub.l	a0,d0
	subq.l	#1,d0
	rts

L009f32:
	movem.l	d0-d1/a0,-(sp)
	movea.l	($0010,sp),a0
	clr.b	d1
	move.b	(a0),d0
	beq.s	$00009f76
	tst.b	d1
	beq.s	$00009f48
	clr.b	d1
	bra.s	$00009f5e

	cmp.b	#$80,d0
	bcs.s	$00009f62
	cmp.b	#$a0,d0
	bcs.s	$00009f5a
	cmp.b	#$e0,d0
	bcs.s	$00009f62
	move.b	#$01,d1
	addq.l	#1,a0
	bra.s	$00009f3c

	cmpi.b	#$41,d0			;'A'
	bcs.s	$00009f72
	cmpi.b	#$5a,d0			;'Z'
	bhi.s	$00009f72
	add.b	#$20,d0			;' '
	move.b	d0,(a0)+
	bra.s	$00009f3c

	movem.l	(sp)+,d0-d1/a0
	rts

L009f7c:
	move.w	#$0020,-(sp)		;' '
	move.l	a0,-(sp)
	move.l	a1,-(sp)
	DOS	_FILES
	lea.l	($000a,sp),sp
	rts

L009f8c:
	move.l	a1,-(sp)
	DOS	_NFILES
	addq.l	#4,sp
	rts

L009f94:
	movem.l	a1,-(sp)
	addq.l	#4,a1
	bsr.w	L009ec2
	tst.b	(a1)
	beq.s	$00009fb8
	movem.l	d0,-(sp)
	bsr.w	L009ef6
	beq.s	$00009fbc
	movem.l	(sp)+,d0
	addq.l	#1,a1
	tst.b	(a1)+
	bne.s	$00009fb2
	bra.s	$00009f9e

	clr.b	d0
	bra.s	$00009fc8

	movem.l	(sp)+,d0
	adda.l	d0,a1
	movea.l	a1,a0
	move.b	#-$01,d0
	movem.l	(sp)+,a1
	rts

L009fce:
	movem.l	d1,-(sp)
	and.l	#$000000ff,d0
	move.l	d0,d1
	DOS	_CURDRV
	move.w	d0,-(sp)
	move.w	d1,-(sp)
	DOS	_CHGDRV
	addq.l	#2,sp
	cmp.w	d1,d0
	bhi.s	$00009fec
	moveq.l	#$ff,d0
	bra.s	$00009ff0

	DOS	_CHGDRV
	clr.l	d0
	addq.l	#2,sp
	movem.l	(sp)+,d1
	rts

Call_EXIT:
	clr.l	d0
	bra.s	$0000a000

Call_EXIT2:
	clr.l	d0
	move.w	(a6),d0
	move.l	d0,($1cae)
	bsr.w	Call_ALLCLOSE
	movea.l	(L013d0a),a0
	bsr.w	L0092b8
	movea.l	($0040,a0),sp
	movea.l	($003c,a0),a5
	move.l	a5,usp
	tst.b	($0cbc)
	beq.s	$0000a026
	move.w	#$0000,-(sp)
	move.l	($0014,a0),-(sp)
	move.w	($0044,a0),-(sp)
	movea.l	(L013d0a),a0
	clr.l	($0068,a0)
	bsr.w	L00a11e
	bsr.w	L010134
	move.l	($1cae),d0
	clr.w	($1c08)
	rte

Call_KEEPPR:
	move.l	(a6)+,d1
	moveq.l	#$01,d0
	swap.w	d0
	move.w	(a6),d0
	move.l	d0,($1cae)
	movea.l	(L013d0a),a0
	move.l	($0004,a0),(L013d0a)
	ori.l	#$ff000000,($0004,a0)
	add.l	a0,d1
	add.l	#$00000100,d1
	cmp.l	($0008,a0),d1
	bcc.s	$0000a07e
	move.l	d1,($0008,a0)
	movea.l	($0040,a0),sp
	movea.l	($003c,a0),a5
	move.l	a5,usp
	tst.b	($0cbc)
	beq.s	$0000a092
	move.w	#$0000,-(sp)
	move.l	($0014,a0),-(sp)
	move.w	($0044,a0),-(sp)
	movea.l	(L013d0a),a0
	clr.l	($0068,a0)
	bsr.w	L00a150
	bsr.w	L010134
	move.l	($1cae),d0
	clr.w	($1c08)
	rte

Call_WAIT:
	move.l	($1cae),d0
	rts

Call_SETPDB:
	movea.l	(a6),a1
L00a0be:
	suba.l	#$00000010,a1
	move.l	(L013d0a),d0
	move.l	a1,(L013d0a)
L00a0d0:
	movea.l	a1,a0
	bsr.s	L00a11e
L00a0d4:
	add.l	#$00000010,d0
	rts

Call_GETPDB:
	movea.l	(L013d0a),a0
	adda.l	#$00000010,a0
	move.l	a0,d0
	rts

L00a0ec:
	movem.l	d1/a1-a2,-(sp)
	lea.l	($1bc0),a1
	lea.l	($0014,a0),a2
	moveq.l	#$02,d1
L00a0fa:
	move.l	(a1)+,(a2)+
	dbra.w	d1,L00a0fa
	lea.l	($00a8),a1
	lea.l	($0046,a0),a2
	move.w	($1c60),(a2)+
	move.l	($1c62),(a2)+
	moveq.l	#$04,d1
L00a112:
	move.l	(a1)+,(a2)+
	dbra.w	d1,L00a112
	movem.l	(sp)+,d1/a1-a2
	rts

L00a11e:
	movem.l	d1/a1-a2,-(sp)
	lea.l	($1bc0),a2
	lea.l	($0014,a0),a1
	moveq.l	#$02,d1
	move.l	(a1)+,(a2)+
	dbra.w	d1,$0000a12c
	lea.l	($00a8),a2
	lea.l	($0046,a0),a1
	move.w	(a1)+,($1c60)
	move.l	(a1)+,($1c62)
	moveq.l	#$04,d1
	move.l	(a1)+,(a2)+
	dbra.w	d1,$0000a144
	movem.l	(sp)+,d1/a1-a2
	rts

L00a150:
	movem.l	d0-d1/a0-a2,-(sp)
	lea.l	($1bc0),a2
	lea.l	($0014,a0),a1
	moveq.l	#$02,d1
	move.l	(a1)+,(a2)+
	dbra.w	d1,$0000a15e
	lea.l	($0046,a0),a1
	move.w	(a1)+,($1c60)
	move.l	(a1)+,($1c62)
	lea.l	($00a8),a2
	clr.l	d1
	move.l	(a2)+,d0
	cmp.l	(a1)+,d0
	beq.s	$0000a17e
	bsr.s	L00a18c
	addq.w	#4,d1
	cmp.w	#$0014,d1
	bcs.s	$0000a176
	movem.l	(sp)+,d0-d1/a0-a2
	rts

L00a18c:
	movem.l	d2/a0,-(sp)
	move.l	d0,($4c,a0,d1.w)
	move.l	($0004,a0),d2
	beq.s	$0000a19e
	movea.l	d2,a0
	bra.s	$0000a190

	movem.l	(sp)+,d2/a0
	rts

L00a1a4:
	rts

Call_GETENV:
	movea.l	(a6)+,a0
	move.l	(a6)+,d0
	bne.s	$0000a1b6
	movea.l	(L013d0a),a1
	move.l	($0010,a1),d0
	cmp.l	#$ffffffff,d0
	beq.s	L00a1d0
	movea.l	d0,a1
	movea.l	(a6),a2
	bsr.s	L00a1fa
	tst.b	d0
	beq.s	L00a1d0
	move.b	(a0)+,(a2)+
	bne.s	$0000a1c8
	clr.l	d0
	rts

L00a1d0:
	moveq.l	#$ff,d0
	rts

Call_SETENV:
	movea.l	(a6)+,a0
	move.l	(a6)+,d0
	bne.s	$0000a1e4
	movea.l	(L013d0a),a1
	move.l	($0010,a1),d0
	cmp.l	#$ffffffff,d0
	beq.s	L00a1d0
	movea.l	d0,a1
	movea.l	(a6),a2
	bsr.s	L00a254
	tst.b	d0
	beq.s	L00a1d0
	clr.l	d0
	rts

L00a1fa:
	link.w	a6,#-$0100
	movem.l	a1,-(sp)
	movea.l	a0,a1
	lea.l	(-$0100,a6),a0
	move.b	(a1)+,(a0)+
	bne.s	$0000a208
	move.b	#$3d,(-$0001,a0)	;'='
	clr.b	(a0)
	movem.l	(sp),a1
	addq.l	#4,a1
	lea.l	(-$0100,a6),a0
	bsr.w	L009ec2
	tst.b	(a1)
	beq.s	$0000a23c
	movem.l	d0,-(sp)
	bsr.w	L009ef6
	beq.s	$0000a240
	movem.l	(sp)+,d0
	addq.l	#1,a1
	tst.b	(a1)+
	bne.s	$0000a236
	bra.s	$0000a222

	clr.b	d0
	bra.s	$0000a24c

	movem.l	(sp)+,d0
	adda.l	d0,a1
	movea.l	a1,a0
	move.b	#-$01,d0
	movem.l	(sp)+,a1
	unlk	a6
	rts

L00a254:
	link.w	a6,#-$0200
	movem.l	d1-d2/a0-a5,-(sp)
	movea.l	a2,a5
	movea.l	a0,a2
	movea.l	a1,a3
	movea.l	a2,a1
	lea.l	(-$0100,a6),a0
	move.b	(a1)+,(a0)+
	bne.s	$0000a268
	move.b	#$3d,(-$0001,a0)	;'='
	clr.b	(a0)
	move.l	a5,(-$0004,sp)
	bne.s	$0000a27e
	movea.l	a0,a5
	bra.s	$0000a284

	movea.l	a5,a1
	move.b	(a1)+,(a0)+
	bne.s	$0000a280
	movea.l	a2,a1
	lea.l	(-$0100,a6),a2
	lea.l	(-$0200,a6),a0
	move.b	(a1)+,(a0)+
	bne.s	$0000a28e
	movea.l	a3,a1
	lea.l	(-$0200,a6),a0
	bsr.w	L009ec2
	addq.l	#1,d0
	move.l	d0,d1
	bsr.w	L00a1fa
	tst.b	d0
	beq.s	$0000a2d4
	suba.l	d1,a0
	bsr.w	L009ec2
	movea.l	a0,a4
	move.l	d0,d1
	movea.l	a2,a0
	bsr.w	L009ec2
	sub.l	d0,d1
	bcc.s	$0000a2c6
	neg.l	d1
	movea.l	a3,a0
	bsr.s	L00a30a
	cmp.l	d1,d0
	bcs.s	$0000a300
	movea.l	a4,a0
	move.w	#$0001,d2
	bsr.s	L00a32c
	movea.l	a0,a1
	movea.l	a4,a0
	bsr.s	L00a340
	tst.b	(a5)
	beq.s	$0000a2fc
	movea.l	a2,a0
	bsr.w	L009ec2
	move.l	d0,d1
	movea.l	a3,a0
	bsr.s	L00a30a
	cmp.l	d1,d0
	bcs.s	$0000a300
	movea.l	a3,a0
	addq.l	#4,a0
	move.w	#$0001,d2
	bsr.s	L00a32c
	bne.s	$0000a2ec
	movea.l	a2,a1
	move.b	(a1)+,(a0)+
	bne.s	$0000a2f6
	clr.b	(a0)
	moveq.l	#$ff,d0
	bra.s	$0000a302

	clr.l	d0
	movem.l	(sp)+,d1-d2/a0-a5
	unlk	a6
	rts

L00a30a:
	movem.l	d2/a1,-(sp)
	movea.l	a0,a1
	move.l	(a0)+,d0
	adda.l	d0,a1
	move.w	#$0001,d2
	bsr.s	L00a32c
	bne.s	$0000a314
	addq.l	#1,a0
	suba.l	a0,a1
	bcc.s	$0000a324
	suba.l	a1,a1
	move.l	a1,d0
	movem.l	(sp)+,d2/a1
	rts

L00a32c:
	tst.w	d2
	beq.s	$0000a33c
	tst.b	(a0)
	beq.s	$0000a33e
	tst.b	(a0)+
	bne.s	$0000a334
	subq.w	#1,d2
	bra.s	L00a32c

	tst.b	(a0)
	rts

L00a340:
	move.b	(a1)+,(a0)+
	beq.s	$0000a34a
	move.b	(a1)+,(a0)+
	bne.s	$0000a344
	bra.s	L00a340

	rts

Call_BREAKCK:
	move.w	(a6),d0
	cmp.w	#$0100,d0
	bcs.s	$0000a360
	cmp.w	#$0600,d0
	bcs.s	L00a37c
	cmp.w	#$ffff,d0
	bne.s	L00a378
	cmp.b	#$ff,d0
	beq.s	$0000a370
	cmp.b	#$03,d0
	bcc.s	L00a378
	move.b	d0,($1c12)
	clr.l	d0
	move.b	($1c12),d0
	rts

L00a378:
	moveq.l	#$f2,d0
	rts

L00a37c:
	addq.b	#1,d0
	cmp.b	#$03,d0
	bcc.s	L00a378
	move.w	d0,d1
	lsr.w	#8,d1
	subq.w	#1,d1
	and.l	#$000000ff,d1
	add.l	d1,d1
	lea.l	($1cbc),a0
	adda.w	d1,a0
	move.b	(a0),d1
	tst.b	d0
	beq.s	$0000a3a4
	and.b	#$01,d0
	move.b	d0,(a0)
	and.l	#$00000001,d1
	eori.b	#$01,d1
	move.l	d1,d0
	rts

L00a3b2:
	movem.l	d1-d7/a0-a6,-(sp)
	bsr.s	Call_GETDATE
	movem.l	(sp)+,d1-d7/a0-a6
	rts

Call_GETDATE:
	move.l	#$07c10707,d1
L00a3c4:
	bsr.w	L008fbc
	move.l	d1,d0
	swap.w	d1
	and.w	#$0fff,d1
	sub.w	#$07bc,d1
	swap.w	d1
	asl.b	#3,d1
	asl.w	#4,d1
	lsr.l	#7,d1
	rol.l	#4,d0
	and.l	#$00000007,d0
	swap.w	d0
	or.l	d1,d0
	rts

Call_SETDATE:
	clr.l	d1
	move.w	(a6),d1
	asl.l	#7,d1
	lsr.w	#4,d1
	lsr.b	#3,d1
	swap.w	d1
	add.w	#$07bc,d1
	swap.w	d1
	bra.w	$00008fc2

	movem.l	d1-d7/a0-a6,-(sp)
	bsr.s	Call_GETTIME
	movem.l	(sp)+,d1-d7/a0-a6
	rts

Call_GETTIME:
	bsr.s	Call_GETTIM2
	asl.b	#2,d0
	asl.w	#2,d0
	lsr.l	#5,d0
	rts

Call_GETTIM2:
	move.l	#$000c0500,d1
	bsr.w	$00008fc8
	move.l	d1,d0
	rts

Call_SETTIME:
	clr.l	d1
	move.w	(a6),d1
	asl.l	#5,d1
	lsr.w	#2,d1
	lsr.b	#2,d1
	bra.w	$00008fce

Call_SETTIM2:
	move.l	(a6),d1
	bra.w	$00008fce

Call_SUPER:
	move.l	(a6),d0
	beq.s	L00a46c
	sub.l	#$00000042,d0
	tst.b	($0cbc)
	beq.s	$0000a44a
	subq.l	#2,d0
	movea.l	d0,a1
	movea.l	sp,a0
	moveq.l	#$0e,d1
	move.l	(a0)+,(a1)+
	dbra.w	d1,$0000a450
	move.w	(a0)+,d1
	and.w	#$dfff,d1
	move.w	d1,(a1)+
	move.l	(a0)+,(a1)+
	tst.b	($0cbc)
	beq.s	$0000a468
	move.w	(a0)+,(a1)+
	movea.l	d0,sp
	rts

L00a46c:
	btst.b	#$05,($003c,sp)
	bne.s	L00a4a8
	move.l	usp,a1
	suba.l	#$00000042,a1
	tst.b	($0cbc)
	beq.s	$0000a484
	subq.l	#2,a1
	move.l	a1,d0
	movea.l	sp,a0
	moveq.l	#$0e,d1
	move.l	(a0)+,(a1)+
	dbra.w	d1,$0000a48a
	move.w	(a0)+,d1
	or.w	#$2000,d1
	move.w	d1,(a1)+
	move.l	(a0)+,(a1)+
	tst.b	($0cbc)
	beq.s	$0000a4a2
	move.w	(a0)+,(a1)+
	movea.l	d0,sp
	move.l	a0,d0
	rts

L00a4a8:
	moveq.l	#$e6,d0
	rts

Call_VERNUM:
	move.w	#$3638,d0		;'68'
	swap.w	d0
	move.w	#$0302,d0
	rts

Call_INTVCS:
	move.w	(a6)+,d0
	move.l	(a6),d1
	bsr.w	L00a562
	move.l	(a1),d0
	move.l	d1,(a1)
	movea.l	(L013d0a),a2
	cmpa.l	#$00001bc0,a1
	beq.s	L00a50c
	cmpa.l	#$00001bc4,a1
	beq.s	L00a512
	cmpa.l	#$00001bc8,a1
	beq.s	$0000a51a
	cmpa.l	#$000000a8,a1
	beq.s	L00a53c
	cmpa.l	#$000000ac,a1
	beq.s	L00a542
	cmpa.l	#$000000b0,a1
	beq.s	L00a548
	cmpa.l	#$000000b4,a1
	beq.s	L00a54e
	cmpa.l	#$000000b8,a1
	beq.s	L00a554
	rts

L00a50c:
	move.l	d1,($0014,a2)
	rts

L00a512:
	move.l	d1,($0018,a2)
	move.l	d1,($0004,a1)
	move.l	d1,($001c,a2)
	movea.l	($1c5c),a1
	move.w	($0038,a1),($1c60)
	move.w	($0038,a1),($0046,a2)
	lea.l	($003e,a1),a0
	move.l	a0,($1c62)
	move.l	a0,($0048,a2)
	rts

L00a53c:
	move.l	d1,($004c,a2)
	rts

L00a542:
	move.l	d1,($0050,a2)
	rts

L00a548:
	move.l	d1,($0054,a2)
	rts

L00a54e:
	move.l	d1,($0058,a2)
	rts

L00a554:
	move.l	d1,($005c,a2)
	rts

Call_INTVCG:
	move.w	(a6),d0
	bsr.s	L00a562
	move.l	(a1),d0
	rts

L00a562:
	suba.l	a1,a1
	cmp.w	#$0200,d0
	bcs.s	$0000a576
	movea.l	#$00001800,a1
	and.l	#$000000ff,d0
	add.l	d0,d0
	add.l	d0,d0
	adda.l	d0,a1
	rts

Call_FGETC:
	move.w	(a6),d1
	lea.l	(-$0002,sp),sp
	movea.l	sp,a2
	moveq.l	#$01,d2
	bsr.w	$0000c302
	tst.l	d0
	bmi.s	$0000a596
	beq.s	L00a59c
	clr.l	d0
	move.b	(sp),d0
	lea.l	($0002,sp),sp
	rts

L00a59c:
	moveq.l	#$ff,d0
	lea.l	($0002,sp),sp
	rts

Call_FGETS:
	movea.l	(a6)+,a2
	move.w	(a6),d1
	move.w	d1,d0
	bsr.w	L00a9d8
	tst.l	d0
	bmi.s	$0000a5cc
	move.b	($0001,a0),d0
	btst.l	#$07,d0
	beq.s	L00a5ce
	and.w	#$0021,d0
	cmp.w	#$0001,d0
	bne.s	L00a5ce
	subq.l	#4,a6
	bsr.w	Call_GETS
	rts

L00a5ce:
	clr.l	d7
	clr.l	d2
	move.b	(a2)+,d2
	move.l	a2,-(sp)
	addq.l	#1,a2
	tst.b	d2
	beq.s	$0000a60a
	movem.l	d2/d7/a0/a2,-(sp)
	moveq.l	#$01,d2
	bsr.w	$0000c30c
	movem.l	(sp)+,d2/d7/a0/a2
	tst.l	d0
	beq.s	$0000a61a
	bmi.s	$0000a61a
	addq.l	#1,d7
	move.b	(a2)+,d0
	cmp.b	#$1a,d0
	beq.s	$0000a60a
	cmp.b	#$0a,d0
	beq.s	$0000a622
	cmp.b	#$0d,d0
	beq.s	L00a614
	subq.b	#1,d2
	bne.s	$0000a5dc
	clr.b	(a2)
	move.l	d7,d0
	movea.l	(sp)+,a2
	move.b	d0,(a2)
	rts

L00a614:
	subq.l	#1,a2
	subq.l	#1,d7
	bra.s	$0000a5dc

	tst.l	d7
	bne.s	$0000a60a
	moveq.l	#$ff,d7
	bra.s	$0000a60a

	subq.l	#1,a2
	subq.l	#1,d7
	bra.s	$0000a60a

Call_FPUTC:
	move.w	(a6)+,d0
	move.w	(a6),d1
	lea.l	(-$0002,sp),sp
	movea.l	sp,a2
	move.b	d0,(a2)
	moveq.l	#$01,d2
	bsr.w	L00c438
	lea.l	($0002,sp),sp
	rts

Call_FPUTS:
	movea.l	(a6)+,a2
	move.w	(a6),d1
	clr.l	d2
	movea.l	a2,a0
	addq.l	#1,d2
	tst.b	(a0)+
	bne.s	$0000a648
	clr.l	d0
	subq.l	#1,d2
	beq.s	$0000a658
	bsr.w	L00c438
	rts

Call_ALLCLOSE:
	movea.l	(L013d0a),a1
	lea.l	($0024,a1),a0
	bsr.s	L00a678
	move.l	($0068,a1),d0
	beq.s	$0000a676
	move.l	a1,d1
	movea.l	d0,a1
	cmp.l	($0004,a1),d1
	beq.s	$0000a660
	rts

L00a678:
	movem.l	d0-d7/a0-a6,-(sp)
	moveq.l	#$0b,d2
	moveq.l	#$5f,d0			;'_'
	moveq.l	#$07,d1
	btst.b	d1,(a0,d2.w)
	beq.s	$0000a694
	movem.l	d0-d2/a0-a1,-(sp)
	bsr.w	$0000c236
	movem.l	(sp)+,d0-d2/a0-a1
	subq.w	#1,d0
	cmp.w	#$0005,d0
	dbcs.w	d1,$0000a682
	dbcs.w	d2,$0000a680
	movem.l	(sp)+,d0-d7/a0-a6
	rts

Call_DRVXCHG:
	cmpi.l	#$ffffffff,(a6)
	beq.s	L00a6d6
	bsr.s	L00a6fa
	bhi.s	L00a6d2
	move.l	d0,d1
	bsr.s	L00a6fa
	bhi.s	L00a6d2
	lea.l	($1c7e),a0
	move.b	(a0,d0.w),d2
	move.b	(a0,d1.w),d3
	move.b	d3,(a0,d0.w)
	move.b	d2,(a0,d1.w)
	clr.l	d0
	rts

L00a6d2:
	moveq.l	#$f1,d0
	rts

L00a6d6:
	lea.l	($1c7e),a0
	clr.w	d0
	move.b	($1c15),d0
	move.b	(a0,d0.w),d1
	bsr.s	L00a6ea
	move.b	d1,d0
	rts

L00a6ea:
	lea.l	($1c98),a0
	moveq.l	#$19,d0
L00a6f0:
	move.b	d0,-(a0)
	dbra.w	d0,L00a6f0
	clr.l	d0
	rts

L00a6fa:
	move.w	(a6)+,d0
	bne.s	$0000a704
	move.b	($1c15),d0
	addq.w	#1,d0
	subq.w	#1,d0
	cmp.b	($1c73),d0
	rts

L00a70c:
	and.w	#$00ff,d0
	cmp.b	($1c73),d0
	bhi.s	$0000a726
	movem.l	a0,-(sp)
	lea.l	($1c7e),a0
	move.b	(a0,d0.w),d0
	movem.l	(sp)+,a0
	rts

L00a728:
	movem.l	d1-d2/a0,-(sp)
	lea.l	($1c7e),a0
	clr.w	d1
	move.b	($1c73),d1
	clr.l	d2
	cmp.b	(a0)+,d0
	beq.s	$0000a744
	addq.w	#1,d2
	dbra.w	d1,$0000a738
	moveq.l	#$ff,d2
	move.l	d2,d0
	movem.l	(sp)+,d1-d2/a0
	rts

Call_CURDIR:
	bsr.w	L00a780
	movea.l	(a6),a1
	bsr.w	L00a792
	bmi.s	$0000a766
	movea.l	d0,a0
	move.l	a1,-(sp)
	bsr.s	L00a768
	movea.l	(sp)+,a1
	bsr.w	L00a7d6
	clr.l	d0
	rts

L00a768:
	move.w	($004c,a0),d0
	lea.l	($01,a0,d0.w),a0
	move.w	#$003d,d0		;'='
	move.b	(a0)+,(a1)+
	dbeq.w	d0,$0000a774
	beq.s	$0000a77e
	clr.b	(a1)+
	rts

L00a780:
	move.w	(a6)+,d0
	bne.s	$0000a78a
	move.b	($1c15),d0
	addq.w	#1,d0
	subq.w	#1,d0
	bsr.w	L00a70c
	rts

L00a792:
	movem.l	a0,-(sp)
	bsr.s	L00a79e
	movem.l	(sp)+,a0
	rts

L00a79e:
	cmp.b	($1c73),d0
	bhi.s	L00a7d2
	and.w	#$00ff,d0
	movea.l	($1c38),a0
	mulu.w	#$004e,d0
	adda.l	d0,a0
	move.b	($0045,a0),d0
	beq.s	L00a7d2
	cmp.b	#$60,d0			;'`'
	beq.s	L00a7d2
	movem.l	a0,-(sp)
	movea.l	($0046,a0),a0
	bsr.w	L00d428
	movem.l	(sp)+,a0
	move.l	a0,d0
	rts

L00a7d2:
	moveq.l	#$f1,d0
	rts

L00a7d6:
	move.b	(a1)+,d0
	beq.s	$0000a7f6
	cmp.b	#$09,d0
	beq.s	L00a7f8
	cmp.b	#$80,d0
	bcs.s	L00a7d6
	cmp.b	#$a0,d0
	bcs.s	$0000a7f2
	cmp.b	#$e0,d0
	bcs.s	L00a7d6
	move.b	(a1)+,d0
	bne.s	L00a7d6
	rts

L00a7f8:
	move.b	#$5c,(-$0001,a1)	;'\'
	bra.s	L00a7d6

	movem.l	a0,-(sp)
	movea.l	(L00f1ae,pc),a0
	move.b	(a0),d0
	beq.s	L00a88a
	clr.l	d0
	move.b	(a1)+,d0
	beq.s	L00a880
	cmp.b	#$20,d0			;' '
	beq.s	$0000a80e
	moveq.l	#$59,d1			;'Y'
	bra.s	$0000a820

	move.b	(a1)+,d0
	beq.s	L00a880
	cmp.b	#$e0,d0
	bcc.s	$0000a86a
	cmp.b	#$a0,d0
	bcc.s	$0000a85e
	cmp.b	#$80,d0
	bcc.s	$0000a86a
	cmp.b	#$20,d0			;' '
	bcs.s	$0000a878
	beq.s	$0000a89c
	cmp.b	#$3a,d0			;':'
	beq.s	L00a894
	movea.l	(L00f1ae,pc),a0
	cmp.b	(a0)+,d0
	beq.s	$0000a898
	cmp.b	(a0)+,d0
	beq.s	$0000a898
	cmp.w	(a0)+,d0
	beq.s	$0000a878
	swap.w	d1
	move.w	(a0)+,d1
	cmp.b	(a0)+,d0
	beq.s	$0000a878
	dbra.w	d1,$0000a854
	swap.w	d1
	move.b	d0,(a4)+
	or.w	#$0100,d0
	dbra.w	d1,$0000a81c
	bra.s	$0000a878

	move.b	d0,(a4)+
	subq.w	#1,d1
	bmi.s	$0000a878
	move.b	(a1)+,d0
	cmp.b	#$20,d0			;' '
	bcc.s	$0000a85e
	movem.l	(sp)+,a0
	moveq.l	#$f3,d0
	rts

L00a880:
	movem.l	(sp)+,a0
	clr.l	d0
	clr.b	(a4)
	rts

L00a88a:
	bsr.w	L00f2a8
	movem.l	(sp)+,a0
	rts

L00a894:
	moveq.l	#$3a,d0			;':'
	bra.s	$0000a85e

	moveq.l	#$09,d0
	bra.s	$0000a85e

	move.b	(a1)+,d0
	beq.s	L00a880
	cmp.b	#$20,d0			;' '
	beq.s	$0000a89c
	movea.l	(L00f1ae,pc),a0
	cmp.b	(a0)+,d0
	beq.s	$0000a898
	cmp.b	(a0)+,d0
	beq.s	$0000a898
	cmp.b	#$2e,d0			;'.'
	bne.s	$0000a878
	bra.s	$0000a85e

	bsr.w	L00a780
	bsr.w	L00a792
	bmi.s	$0000a8d8
	movea.l	d0,a0
	move.l	($0046,a0),d0
	movem.l	d0/a0,-(sp)
	movea.l	d0,a0
	bsr.w	L00d428
	movem.l	(sp)+,d0/a0
	tst.l	d0
	rts

L00a8dc:
	movem.l	d1/a0,-(sp)
	move.l	($1c3c),d1
	movea.l	d1,a0
	cmp.b	(a0),d0
	beq.s	$0000a8f6
	move.l	($0006,a0),d1
	bpl.s	$0000a8e4
	movea.l	#$fffffff1,a0
	move.l	a0,d0
	movem.l	(sp)+,d1/a0
	rts

Call_CHGDRV:
	move.w	(a6),d0
	cmp.b	($1c73),d0
	bhi.s	$0000a916
	move.w	d0,d1
	bsr.w	L00a70c
	bsr.w	L00a792
	bmi.s	L00a920
	move.b	d1,($1c15)
	clr.l	d0
	move.b	($1c73),d0
	addq.w	#1,d0
	rts

L00a920:
	clr.l	d0
	move.b	d1,d0
	rts

Call_CURDRV:
	clr.l	d0
	move.b	($1c15),d0
	rts

Call_DUP:
	move.w	(a6),d0
	bsr.w	L00a9d8
	move.l	d0,d2
	bmi.s	$0000a94c
	movea.l	a0,a2
	bsr.w	L00aa2e
	tst.l	d0
	bmi.s	$0000a94c
	move.b	d2,($0001,a0)
	addq.b	#1,(a2)
	bsr.w	L00aaa0
	rts

Call_DUP0:
	move.w	(a6)+,d1
	cmp.w	($1c6e),d1
	bhi.s	L00a984
	move.w	d1,d0
	rol.w	#8,d1
	or.w	d0,d1
	move.w	(a6),d0
	cmp.w	#$0004,d0
	bhi.s	L00a984
	lea.l	(L013d1a),a0
	add.w	d0,d0
	move.b	(a0,d0.w),d2
	move.w	d1,(a0,d0.w)
	lea.l	(L013d24),a0
	move.w	d1,(a0,d0.w)
	clr.l	d0
	move.b	d2,d0
	rts

L00a984:
	moveq.l	#$fc,d0
	rts

Call_DUP2:
	move.w	(a6)+,d0
	bsr.w	L00a9d8
	tst.l	d0
	bmi.s	$0000a9c8
	movem.l	d0/a0,-(sp)
	move.w	(a6),d0
	bsr.w	L00a9d8
	tst.l	d0
	bpl.s	$0000a9a4
	movea.l	a1,a5
	bra.s	$0000a9b8

	move.l	a1,-(sp)
	move.w	(a6),d0
	move.w	(a1),-(sp)
	bsr.w	L00aad0
	bsr.w	$0000c236
	move.w	(sp)+,d0
	movea.l	(sp)+,a5
	move.w	d0,(a5)
	move.w	(a6),d0
	bsr.w	L00aaa0
	movem.l	(sp)+,d0/a0
	move.b	d0,($0001,a5)
	addq.b	#1,(a0)
	rts

Call_GETFCB:
	move.w	(a6),d0
	bsr.s	L00a9d8
	tst.l	d0
	bmi.s	L00a9d6
	move.l	a0,d0
	rts

L00a9d6:
	rts

L00a9d8:
	cmp.w	($1c6e),d0
	bhi.s	L00aa26
	movea.l	#L013d24,a1
	cmp.w	#$0006,d0
	bcs.s	$0000a9f0
	subq.w	#6,d0
	movea.l	($1c2c),a1
	add.w	d0,d0
	lea.l	(a1,d0.w),a1
	move.w	(a1),d0
	and.l	#$000000ff,d0
	cmp.b	#-$01,d0
	beq.s	L00aa2a
	move.l	d0,-(sp)
	movea.l	#L013d30,a0
	cmp.w	#$0006,d0
	bcs.s	$0000aa18
	subq.w	#6,d0
	movea.l	($1c30),a0
	mulu.w	#$0060,d0
	adda.l	d0,a0
	move.l	(sp)+,d0
	tst.b	(a0)
	beq.s	L00aa2a
	rts

L00aa26:
	moveq.l	#$fc,d0
	rts

L00aa2a:
	moveq.l	#$fa,d0
	rts

L00aa2e:
	movea.l	#L013d2e,a0
	moveq.l	#$05,d0
	cmpi.w	#$ffff,(a0)
	beq.s	$0000aa66
	movea.l	($1c2c),a0
	move.w	($1c6e),d0
	subq.w	#2,d0
	subq.w	#6,d0
	bcs.s	$0000aa58
	move.w	d0,-(sp)
	cmpi.w	#$ffff,(a0)+
	dbeq.w	d0,$0000aa4c
	beq.s	L00aa5c
	addq.l	#2,sp
	moveq.l	#$fc,d0
	rts

L00aa5c:
	sub.w	d0,(sp)
	clr.l	d0
	move.w	(sp)+,d0
	addq.w	#6,d0
	subq.l	#2,a0
	rts

L00aa68:
	movea.l	#L013f10,a0
	moveq.l	#$05,d0
	tst.b	(a0)
	beq.s	$0000aa9e
	move.w	($1c6e),d0
	subq.w	#2,d0
	subq.w	#6,d0
	bcs.s	$0000aa92
	movea.l	($1c30),a0
	move.w	d0,-(sp)
	tst.b	(a0)
	beq.s	L00aa96
	lea.l	($0060,a0),a0
	dbra.w	d0,$0000aa84
	addq.l	#2,sp
	moveq.l	#$fc,d0
	rts

L00aa96:
	sub.w	d0,(sp)
	clr.l	d0
	move.w	(sp)+,d0
	addq.w	#6,d0
	rts

L00aaa0:
	movem.l	d0-d1/a0,-(sp)
	cmp.w	#$0060,d0		;'`'
	bcc.s	$0000aaca
	move.w	d0,d1
L00aaac:
	and.w	#$0007,d0
	lsr.w	#3,d1
	lea.l	(L013d0e),a0
	bset.b	d0,(a0,d1.w)
	movea.l	(L013d0a),a0
	lea.l	($0024,a0),a0
	bset.b	d0,(a0,d1.w)
	movem.l	(sp)+,d0-d1/a0
	rts

L00aad0:
	movem.l	d0-d1/a0,-(sp)
	cmp.w	#$0060,d0		;'`'
	bcc.s	$0000aafa
	move.w	d0,d1
L00aadc:
	and.w	#$0007,d0
	lsr.w	#3,d1
	lea.l	(L013d0e),a0
	bclr.b	d0,(a0,d1.w)
	movea.l	(L013d0a),a0
	lea.l	($0024,a0),a0
	bclr.b	d0,(a0,d1.w)
	movem.l	(sp)+,d0-d1/a0
	rts

L00ab00:
	movem.l	d1/a1,-(sp)
	cmp.w	#$0100,d2
	bcc.s	L00ab54
	bsr.w	L00aa2e
	movea.l	a0,a1
	move.l	d0,d1
	bmi.s	$0000ab44
	bsr.w	L00aa68
	tst.l	d0
	bmi.s	$0000ab44
	move.b	d0,(a1)
	move.b	d0,($0001,a1)
	movea.l	a0,a1
	moveq.l	#$10,d0
	clr.l	(a1)+
	dbra.w	d0,$0000ab26
	moveq.l	#$06,d0
	move.l	#$ffffffff,(a1)+
	dbra.w	d0,$0000ab2e
	move.l	d1,d0
	move.b	#$01,(a0)
	bsr.w	L00aaa0
	tst.l	d0
	movem.l	(sp)+,d1/a1
	bmi.s	$0000ab52
	move.l	a0,($1c98)
	move.l	d0,($1c9c)
	rts

L00ab54:
	movea.l	($1c2c),a0
	clr.l	d0
	move.w	($1c6e),d0
	move.w	d0,-(sp)
	subq.w	#6,d0
	add.w	d0,d0
	adda.l	d0,a0
	move.w	(sp)+,d0
	cmpi.w	#$ffff,(a0)
	beq.s	$0000ab7a
	subq.w	#1,d0
	cmpi.w	#$ffff,-(a0)
	beq.s	$0000ab7a
	moveq.l	#$fc,d0
	bra.s	$0000ab44

	movea.l	a0,a1
	move.l	d0,d1
	move.w	($1c6e),d0
	move.w	d0,-(sp)
	subq.w	#6,d0
	mulu.w	#$0060,d0
	movea.l	($1c30),a0
	adda.l	d0,a0
	move.w	(sp)+,d0
	tst.b	(a0)
	beq.s	$0000ab1c
	lea.l	(-$0060,a0),a0
	subq.w	#1,d0
	tst.b	(a0)
	beq.w	$0000ab1c
	bra.s	$0000ab76

	cmp.w	#$0005,d0
	bcs.s	L00abe6
	bsr.w	L00aad0
	bsr.w	L00a9d8
	tst.l	d0
	bmi.s	$0000ac08
	move.w	#$ffff,(a1)
	subq.b	#1,(a0)
	bne.s	$0000abe4
	cmp.w	#$0005,d0
	bcc.s	$0000abe4
	addq.b	#1,(a0)
	movem.l	d0-d1/a0-a3,-(sp)
	move.l	#L00fa50,d1
	movea.l	d1,a1
	btst.b	#$07,($0004,a1)
	beq.s	$0000abdc
	bsr.s	L00ac0a
	move.l	(a1),d1
	bpl.s	$0000abd0
	movem.l	(sp)+,d0-d1/a0-a3
	rts

L00abe6:
	move.l	d1,-(sp)
	move.l	d0,d1
	bsr.w	L00a9d8
	tst.l	d0
	bmi.s	$0000ac06
	move.l	a0,-(sp)
	add.w	d1,d1
	lea.l	(L013d1a),a0
	move.w	(a0,d1.w),(a1)
	movea.l	(sp)+,a0
	move.l	(sp)+,d1
	bra.s	$0000abba

	move.l	(sp)+,d1
	rts

L00ac0a:
	move.w	($0004,a1),d0
	btst.l	#$00,d0
	beq.s	L00ac20
	lea.l	(L013d30),a2
	move.l	a1,($0002,a2)
	bsr.s	L00ac6e
L00ac20:
	btst.l	#$01,d0
	beq.s	L00ac3e
	lea.l	(L013d90),a2
	move.l	a1,($0002,a2)
	bsr.s	L00ac6e
	lea.l	(L013df0),a2
	move.l	a1,($0002,a2)
	bsr.s	L00ac6e
L00ac3e:
	lea.l	(L013e50),a2
	bsr.s	L00ac5c
	bne.s	L00ac4c
	move.l	a1,($0002,a2)
L00ac4c:
	lea.l	(L013eb0),a2
	bsr.s	L00ac5c
	bne.s	L00ac5a
	move.l	a1,($0002,a2)
L00ac5a:
	rts

L00ac5c:
	moveq.l	#$07,d1
	lea.l	($000e,a1),a0
	lea.l	($0024,a2),a3
L00ac66:
	cmpm.b	(a0)+,(a3)+
	dbne.w	d1,L00ac66
	rts

L00ac6e:
	moveq.l	#$07,d1
	lea.l	($000e,a1),a0
	lea.l	($0024,a2),a3
L00ac78:
	move.b	(a0)+,(a3)+
	dbra.w	d1,L00ac78
	rts

Call_FFLUSH_SET:
	move.w	(a6),d1
	clr.l	d0
	move.b	($1cba),d0
	cmp.w	#$ffff,d1
	beq.s	$0000ac92
	move.b	d1,($1cba)
	rts

Call_FFLUSH:
	tst.b	($1cba)
	beq.s	$0000acb8
	bsr.w	L00b6ba
	bsr.w	$00008e26
	move.l	($1c3c),d0
	movea.l	d0,a0
	tst.w	($000a,a0)
	bne.s	$0000acb2
	bsr.w	$0000d862
	move.l	($0006,a0),d0
	bpl.s	$0000aca6
	clr.l	d0
	rts

L00acbc:
	movem.l	d2/a2,-(sp)
	movea.l	a1,a2
	moveq.l	#$01,d2
	bsr.w	L00cb46
	movem.l	(sp)+,d2/a2
	rts

L00acce:
	move.b	($000b,a1),d0
	and.b	#$18,d0
	bne.s	L00ad04
	move.b	($000b,a1),d0
	and.b	#$05,d0
	bne.s	L00ad04
	movem.l	d1-d7/a0-a6,-(sp)
	move.b	#$e5,(a1)
	move.w	($001a,a1),d7
	rol.w	#8,d7
	bsr.w	L00b7d2
	clr.l	d0
	move.w	d7,d0
	beq.s	$0000acfe
	bsr.w	L00ccde
	movem.l	(sp)+,d1-d7/a0-a6
	rts

L00ad04:
	moveq.l	#$ed,d0
	rts

Call_VERIFY:
	move.w	(a6),($1c10)
	rts

Call_VERIFYG:
	clr.l	d0
	move.w	($1c10),d0
	rts

Call_NAMESTS:
	movea.l	(a6)+,a1
	movea.l	(a6),a2
	bsr.w	$0000ad68
	bmi.s	$0000ad36
	movea.l	(a6),a1
	move.b	($0001,a1),d0
	bsr.w	L00a728
	move.b	d0,($0001,a1)
	addq.l	#2,a1
	bsr.w	L00a7d6
	clr.l	d0
	rts

Call_NAMECK:
	movea.l	(a6)+,a1
	movea.l	(a6),a2
	bsr.w	$0000ad90
	bmi.s	$0000ad62
	movea.l	(a6),a1
	clr.l	d0
	move.b	(a1)+,d0
	move.l	d0,-(sp)
	move.b	(a1),d0
	bsr.w	L00a728
	add.b	#$41,d0			;'A'
	move.b	d0,(-$0001,a1)
	move.b	#$3a,(a1)+		;':'
	bsr.w	L00a7d6
	move.l	(sp)+,d0
	rts

L00ad64:
	moveq.l	#$3f,d0			;'?'
	bra.s	$0000ad6a

	moveq.l	#$20,d0			;' '
	move.b	d0,($0000f1b3)
L00ad70:
	movem.l	d1-d2/a0-a1/a3-a4/a6,-(sp)
	lea.l	(-$005a,sp),sp
	movea.l	sp,a4
L00ad7a:
	bsr.w	$0000a800
	bmi.s	$0000ad86
	movea.l	sp,a1
	bsr.w	L00ae1e
	lea.l	($005a,sp),sp
	movem.l	(sp)+,d1-d2/a0-a1/a3-a4/a6
	rts

	movem.l	d1-d2/a0-a1/a3-a4/a6,-(sp)
	move.b	#$20,($0000f1b3)	;' '
	lea.l	(-$005a,sp),sp
	movea.l	sp,a4
	bsr.w	$0000a800
	bmi.s	$0000ae14
	movea.l	sp,a1
	clr.b	(L00f1b2)
	bsr.w	L00ae1e
	tst.l	d0
	bmi.s	$0000ae14
	lea.l	($004b,a2),a3
	move.b	(a3)+,d1
	rol.l	#8,d1
	move.b	(a3)+,d1
	rol.l	#8,d1
	move.b	(a3)+,d1
	rol.l	#8,d1
	lea.l	($0043,a2),a3
	moveq.l	#$07,d2
	cmpi.b	#$20,(a3)		;' '
	beq.s	$0000adf0
	addq.l	#1,a3
	dbra.w	d2,$0000adce
	lea.l	($004e,a2),a4
	moveq.l	#$09,d2
	move.b	(a4)+,d0
	beq.s	$0000adf0
	cmp.b	#$20,d0			;' '
	beq.s	$0000adf0
	move.b	d0,(a3)+
	dbra.w	d2,$0000ade0
	clr.b	(a3)
	lea.l	($0056,a2),a3
	tst.b	(L00f1b2)
	beq.s	$0000ae12
	move.b	#$2e,(a3)+		;'.'
	moveq.l	#$02,d2
	rol.l	#8,d1
	cmp.b	#$20,d1			;' '
	beq.s	$0000ae12
	move.b	d1,(a3)+
	dbra.w	d2,$0000ae04
	clr.b	(a3)
	lea.l	($005a,sp),sp
	movem.l	(sp)+,d1-d2/a0-a1/a3-a4/a6
	rts

L00ae1e:
	clr.b	(a2)
	move.b	(a1),d0
	beq.s	$0000ae40
	cmpi.b	#$3a,($0001,a1)		;':'
	bne.s	$0000ae40
	or.b	#$20,d0
	sub.b	#$61,d0			;'a'
	cmp.b	#$1a,d0
	bcc.w	L00aed2
	addq.l	#2,a1
	bra.s	$0000ae44

	move.b	($1c15),d0
	bsr.w	L00a70c
	move.b	d0,d1
	bsr.w	L00a792
	bmi.w	L00aed2
	movea.l	d0,a4
	move.b	d1,($0001,a2)
	lea.l	($0002,a2),a3
	cmpi.b	#$09,(a1)
	beq.s	$0000ae86
	movem.l	a0-a1,-(sp)
	movea.l	a4,a0
	movea.l	a3,a1
	moveq.l	#$09,d1
	move.b	d1,(a1)+
	bsr.w	L00a768
	cmp.b	(-$0002,a1),d1
	beq.s	$0000ae7e
	move.b	d1,(-$0001,a1)
	clr.b	(a1)+
	lea.l	(-$0001,a1),a3
	movem.l	(sp)+,a0-a1
	clr.l	d2
	move.l	a1,d1
	move.b	(a1)+,d0
	beq.s	$0000ae98
	cmp.b	#$09,d0
	bne.s	$0000ae8a
	move.l	a1,d2
	bra.s	$0000ae8a

	movea.l	d1,a1
	lea.l	($0002,a2),a0
	tst.l	d2
	beq.w	L00f20c
	sub.l	a1,d2
	move.b	(a1)+,d0
	cmp.b	#$09,d0
	bne.s	$0000aeb8
	move.b	#$09,(a3)+
	subq.w	#1,d2
	beq.s	$0000aebe
	move.b	(a1)+,d0
	bsr.w	L00f1f6
	bmi.s	$0000aed4
	clr.b	(a3)
	move.l	a3,d0
	sub.l	a0,d0
	cmp.l	#$0000003f,d0
	bcs.w	L00f20c
	moveq.l	#$f3,d0
	rts

L00aed2:
	moveq.l	#$f1,d0
	rts

Call_IOCTRL:
	move.w	(a6)+,d0
	cmp.w	#$000e,d0
	bcc.s	$0000aef2
	add.w	d0,d0
	add.w	d0,d0
	lea.l	(L00aef6),a0
	movea.l	(a0,d0.w),a0
	jsr	(a0)
	rts

L00aef0:
	addq.l	#4,sp
	moveq.l	#$f2,d0
	rts

L00aef6:
	.dc.l	L00af2e
	.dc.l	L00af58
	.dc.l	L00af80
	.dc.l	L00af84
	.dc.l	L00afb0
	.dc.l	L00afb4
	.dc.l	L00afe4
	.dc.l	L00afe8
	.dc.l	L00aef0
	.dc.l	L00b01c
	.dc.l	L00af2e
	.dc.l	L00b04c
	.dc.l	L00b058
	.dc.l	L00b0a0
L00af2e:
	move.w	(a6),d0
	bsr.w	L00a9d8
	tst.l	d0
	bmi.s	$0000af56
	movea.l	($0002,a0),a1
	clr.l	d0
	move.b	($0001,a0),d0
	btst.l	#$07,d0
	bne.s	$0000af4c
	movea.l	($0002,a1),a1
	move.w	($0004,a1),d1
	and.w	#$ff00,d1
	or.w	d1,d0
	rts

L00af58:
	move.w	(a6)+,d0
	bsr.w	L00a9d8
	tst.l	d0
	bmi.s	$0000af7e
	clr.l	d0
	move.b	($0001,a0),d0
	btst.l	#$07,d0
	beq.s	$0000af7e
	and.b	#$df,d0
	move.w	(a6),d1
	and.w	#$0020,d1
	or.b	d1,d0
	move.b	d0,($0001,a0)
	rts

L00af80:
	moveq.l	#$03,d7
	bra.s	$0000af86

L00af84:
	moveq.l	#$0c,d7
	move.w	(a6)+,d0
	bsr.w	L00a9d8
	tst.l	d0
	bmi.s	$0000afe2
	movea.l	($0002,a0),a1
	clr.l	d0
	move.b	($0001,a0),d0
	btst.l	#$07,d0
	beq.s	$0000afbe
	btst.b	#$06,($0004,a1)
	beq.s	$0000afe0
	clr.b	d1
	clr.b	d2
	bra.w	L00cae0

L00afb0:
	moveq.l	#$03,d7
	bra.s	$0000afb6

L00afb4:
	moveq.l	#$0c,d7
	bsr.w	$0000a8ba
	bmi.s	$0000afe2
	movea.l	d0,a1
	movea.l	a1,a2
	movea.l	($0002,a2),a1
	btst.b	#$06,($0004,a1)
	beq.s	$0000afe0
	btst.b	#$05,($0004,a1)
	bne.s	$0000afe0
	move.b	($0001,a2),d1
	move.b	($001a,a2),d2
	bra.w	L00cae0

	moveq.l	#$ef,d0
	rts

L00afe4:
	moveq.l	#$06,d7
	bra.s	$0000afea

L00afe8:
	moveq.l	#$0a,d7
	move.w	(a6),d0
	bsr.w	L00a9d8
	tst.l	d0
	bmi.s	$0000b01a
	movea.l	($0002,a0),a1
	clr.l	d0
	clr.w	d1
	move.b	($0001,a0),d0
	btst.l	#$07,d0
	bne.s	$0000b014
	btst.l	#$05,d0
	bne.s	$0000b018
	move.b	($0001,a1),d1
	movea.l	($0002,a1),a1
	bra.w	L00cb0a

	moveq.l	#$ff,d0
	rts

L00b01c:
	bsr.w	L00a780
	move.w	d0,d1
	bsr.w	L00a792
	bmi.s	$0000b04a
	movea.l	d0,a1
	movea.l	($0046,a1),a1
	clr.l	d0
	move.b	d1,d0
	movea.l	($0002,a1),a1
	move.w	($0004,a1),d1
	and.w	#$ff00,d1
	or.w	d1,d0
	btst.l	#$0d,d0
	beq.s	$0000b04a
	bset.l	#$05,d0
	rts

L00b04c:
	move.w	(a6)+,($1c0c)
	move.w	(a6),($1c0e)
	clr.l	d0
	rts

L00b058:
	move.w	(a6)+,d0
	bsr.w	L00a9d8
	tst.l	d0
	bmi.s	$0000b0d8
	movea.l	($0002,a0),a1
	btst.b	#$07,($0001,a0)
	beq.s	$0000b0a8
	clr.l	d1
	clr.l	d2
	moveq.l	#$13,d0
	lea.l	(-$001a,sp),sp
	movea.l	sp,a5
	move.b	#$1a,($0000.w,a5)
	move.b	d1,($0001,a5)
	move.b	d0,($0002,a5)
	move.b	d2,($000d,a5)
	move.w	(a6)+,($0012,a5)
	move.l	(a6),($000e,a5)
	bsr.w	L00cba6
	clr.l	d0
	lea.l	($001a,sp),sp
	rts

L00b0a0:
	bsr.w	$0000a8ba
	bmi.s	$0000b0d8
	movea.l	d0,a1
	movea.l	a1,a2
	movea.l	($0002,a2),a1
	btst.b	#$06,($0005,a1)
	beq.s	L00b0d6
	btst.b	#$05,($0004,a1)
	bne.s	$0000b0c8
	move.b	($0001,a2),d1
	move.b	($001a,a2),d2
	bra.s	$0000b072

	movea.l	a2,a0
	move.w	(a6)+,d2
	swap.w	d2
	move.l	(a6),d1
	bsr.w	$0000d984
	rts

L00b0d6:
	moveq.l	#$ef,d0
	rts

Call_DISKRED:
	movea.l	(a6)+,a2
L00b0dc:
	bsr.w	$0000a8ba
	bmi.s	$0000b106
	cmpi.b	#$40,($0045,a0)		;'@'
	bne.s	$0000b104
	movea.l	d0,a0
	move.l	a2,d2
	bmi.s	L00b108
	cmpi.w	#$0400,($000a,a0)
	bne.s	$0000b104
	clr.l	d1
	clr.l	d2
	move.w	(a6)+,d1
	move.w	(a6),d2
	bra.w	L00b7bc

	moveq.l	#$f1,d0
	rts

L00b108:
	move.l	(a6)+,d1
	move.l	(a6),d2
	tst.w	($000a,a0)
	beq.w	$0000cb52
	bra.w	L00b7bc

Call_DISKWRT:
	movea.l	(a6)+,a2
L00b11a:
	bsr.w	$0000a8ba
	bmi.s	$0000b148
	cmpi.b	#$40,($0045,a0)		;'@'
	bne.s	$0000b146
	movea.l	d0,a0
	move.l	a2,d2
	bmi.s	L00b14a
	cmpi.w	#$0400,($000a,a0)
	bne.s	$0000b146
	clr.l	d1
	clr.l	d2
	bsr.w	L00cbe2
	move.w	(a6)+,d1
	move.w	(a6),d2
	bra.w	L00b7a6

	moveq.l	#$f1,d0
	rts

L00b14a:
	move.l	(a6)+,d1
	move.l	(a6),d2
	tst.w	($000a,a0)
	beq.w	L00cb32
	bra.w	L00b7a6

Call_FATCHK:
	movea.l	(a6)+,a1
	moveq.l	#$fe,d7
	move.l	(a6)+,d6
	bpl.s	$0000b16c
	and.l	#$00ffffff,d6
	clr.l	d7
	move.w	(a6),d7
	movea.l	d6,a6
	lea.l	(-$0058,sp),sp
	movea.l	sp,a2
	bsr.w	L00b352
	tst.l	d0
	bmi.w	$0000b20a
	tst.b	(a2)
	bne.w	$0000b208
	subq.w	#2,d7
	bcs.s	$0000b200
	clr.l	d0
	move.b	($0001,a2),d0
	bsr.w	$0000a8be
	bmi.s	$0000b20a
	movea.l	a0,a1
	movea.l	d0,a0
	bsr.w	L00b24e
	bmi.s	$0000b20a
	clr.l	d0
	move.b	($0001,a2),d0
	bsr.w	L00a728
	move.w	d0,(a6)
	addq.w	#1,(a6)+
	tst.w	($000a,a0)
	beq.s	$0000b204
	bsr.w	$0000bcec
	tst.l	d0
	bmi.s	$0000b20a
	move.w	#$0002,d3
	move.w	($001a,a1),d1
	beq.s	$0000b1f4
	ror.w	#8,d1
	move.w	d1,d2
	bsr.w	L00b22e
	bsr.s	L00b210
	bcs.s	$0000b200
	move.w	d2,d1
	move.w	#$ffff,d2
	bsr.w	L00cc94
	tst.l	d0
	bmi.s	$0000b20a
	clr.l	d1
	move.w	d2,d1
	move.b	($000d,a0),d2
	asl.l	d2,d1
	bsr.s	L00b210
	bcs.s	$0000b200
	move.w	d0,d1
	cmp.w	#$ffff,d1
	bne.s	$0000b1c6
	clr.l	d1
	bsr.s	L00b210
	bcs.s	$0000b200
	clr.l	d0
	move.w	d3,d0
	bra.s	$0000b20a

	moveq.l	#$f2,d0
	bra.s	$0000b20a

	moveq.l	#$f1,d0
	bra.s	$0000b20a

	moveq.l	#$f3,d0
	lea.l	($0058,sp),sp
	rts

L00b210:
	tst.l	d7
	bmi.s	L00b21c
	move.l	d1,(a6)+
	addq.w	#4,d3
	subq.w	#4,d7
	rts

L00b21c:
	cmp.l	#$00010000,d1
	bcs.s	$0000b226
	moveq.l	#$ff,d1
	move.w	d1,(a6)+
	addq.w	#2,d3
	subq.w	#2,d7
	rts

L00b22e:
	clr.l	d0
	move.w	d1,d0
	beq.s	L00b246
	subq.w	#2,d0
	move.b	($000d,a0),d1
	lsl.l	d1,d0
	clr.l	d1
	move.w	($0014,a0),d1
	add.l	d0,d1
	rts

L00b246:
	clr.l	d1
	move.w	($0018,a0),d1
	rts

L00b24e:
	movem.l	d1-d2/a1/a3-a5,-(sp)
	cmpi.b	#$50,($0045,a1)		;'P'
	bne.s	$0000b29c
	move.b	(a1),d0
	and.b	#$1f,d0
	subq.b	#1,d0
	move.b	d0,($0001,a2)
	move.w	($004c,a1),d1
	lea.l	(a1,d1.w),a3
	subq.w	#2,d1
	beq.s	$0000b29c
	lea.l	($0002,a2),a4
	clr.l	d2
	addq.w	#1,d2
	tst.b	(a4)+
	bne.s	$0000b278
	move.w	d2,d0
	add.w	d1,d0
	cmp.w	#$0041,d0		;'A'
	bcc.s	$0000b2f2
	lea.l	(a4,d1.w),a5
	subq.w	#1,d2
	move.b	-(a4),-(a5)
	dbra.w	d2,$0000b28e
	subq.w	#1,d1
	move.b	-(a3),-(a5)
	dbra.w	d1,$0000b296
	move.w	(a2),d2
	move.b	d2,d0
	add.b	#$41,d0			;'A'
	move.b	d0,(a2)
	move.b	#$3a,($0001,a2)		;':'
	movea.l	($1c38),a4
	clr.w	d1
	move.b	($1c73),d1
	bsr.s	L00b2fa
	beq.s	$0000b2c8
	lea.l	($004e,a4),a4
	dbra.w	d1,$0000b2b6
	move.w	d2,(a2)
	clr.l	d0
	bra.s	$0000b2f4

	move.w	#$ffff,($004a,a1)
	movea.l	($0046,a4),a0
	bsr.w	L00d428
	move.b	($0000.w,a0),d2
	move.w	($004c,a4),d1
	lea.l	($0002,a2),a5
	lea.l	(a2,d1.w),a3
	move.b	(a3)+,(a5)+
	bne.s	$0000b2e6
	movea.w	a4,a1
	move.w	d2,(a2)
	bra.w	$0000b252

	moveq.l	#$f3,d0
	movem.l	(sp)+,d1-d2/a1/a3-a5
	rts

L00b2fa:
	cmpi.b	#$60,($0045,a4)		;'`'
	bne.s	$0000b320
	movem.l	d0-d2/a4-a5,-(sp)
	movea.l	a4,a5
	moveq.l	#$fe,d0
	addq.l	#1,d0
	tst.b	(a5)+
	bne.s	$0000b30a
	movea.l	a2,a5
	bsr.w	L00f27c
	bne.s	$0000b31c
	cmpi.b	#$09,(a5)
	movem.l	(sp)+,d0-d2/a4-a5
	rts

L00b322:
	sub.b	#$20,d0			;' '
	move.b	d0,(-$0001,a0)
	move.b	(a0)+,d0
	beq.s	$0000b350
	cmp.b	#$61,d0			;'a'
	bcs.s	$0000b32a
	cmp.b	#$7b,d0			;'{'
	bcs.s	L00b322
	cmp.b	#$80,d0
	bcs.s	$0000b32a
	cmp.b	#$a0,d0
	bcs.s	$0000b34c
	cmp.b	#$e0,d0
	bcs.s	$0000b32a
	move.b	(a0)+,d0
	bne.s	$0000b32a
	rts

L00b352:
	movem.l	a0,-(sp)
	bsr.w	$0000ad68
	move.l	d0,-(sp)
	bmi.s	$0000b36a
	bsr.w	L00f1b4
	bmi.s	$0000b36a
	move.l	#$fffffff3,(sp)
	move.l	(sp)+,d0
	movem.l	(sp)+,a0
	rts

L00b372:
	clr.l	d0
	move.w	($0014,a0),d0
	sub.l	d0,d1
	bcs.s	L00b386
	move.b	($000d,a0),d0
	lsr.l	d0,d1
	addq.l	#2,d1
	rts

L00b386:
	clr.l	d1
	rts

L00b38a:
	bsr.w	L00e8b2
	bpl.s	$0000b3a8
	move.w	($0002,a2),d0
	cmp.w	#$0900,d0
	bne.s	L00b3ac
	clr.l	d1
	move.w	($0018,a0),d1
	move.w	($0014,a0),d2
	sub.w	d1,d2
	subq.w	#1,d2
	clr.l	d0
	rts

L00b3ac:
	movem.l	a4-a5,-(sp)
	clr.w	d2
	move.b	($000c,a0),d2
	move.w	($004a,a1),d1
	beq.s	$0000b3e0
	cmp.w	#$ffff,d1
	beq.s	$0000b3e0
	bsr.w	L00b22e
	lea.l	($0002,a2),a5
	lea.l	($0002,a1),a4
	move.b	(a4)+,d0
	beq.s	$0000b3d8
	cmp.b	(a5)+,d0
	beq.s	$0000b3ce
	bra.s	$0000b3e0

	move.b	(a5)+,d0
	cmp.b	#$09,d0
	beq.s	$0000b3f2
	lea.l	($0003,a2),a5
	clr.l	d1
	move.w	($0018,a0),d1
	move.w	($0014,a0),d2
	sub.w	d1,d2
	subq.w	#1,d2
	bsr.s	L00b40a
	bmi.s	$0000b404
	bne.s	$0000b3f2
	clr.l	d2
	move.b	($000c,a0),d2
	bsr.w	L00e8c8
	clr.l	d0
	movem.l	(sp)+,a4-a5
	rts

L00b40a:
	movem.l	d3/a1-a2,-(sp)
	lea.l	(-$0018,sp),sp
	movea.l	sp,a1
	clr.l	d0
	tst.b	(a5)
	beq.s	$0000b46a
	move.b	#$09,(a1)+
	moveq.l	#$15,d3
	move.b	(a5)+,d0
	cmp.b	#$09,d0
	beq.s	$0000b432
	move.b	d0,(a1)+
	dbra.w	d3,$0000b420
	moveq.l	#$f3,d0
	bra.s	$0000b46a

	clr.b	(a1)
	movea.l	sp,a1
	lea.l	(-$0058,sp),sp
	movea.l	sp,a2
	movem.l	d1-d2/a0-a4,-(sp)
	bsr.w	L00ae1e
	movem.l	(sp)+,d1-d2/a0-a4
	tst.l	d0
	bmi.s	$0000b466
	lea.l	($0043,sp),a2
	bsr.w	L00b476
	bmi.s	$0000b466
	move.b	($000b,a1),d0
	and.b	#$10,d0
	beq.s	$0000b464
	moveq.l	#$01,d0
	bra.s	$0000b466

	moveq.l	#$fd,d0
	lea.l	($0058,sp),sp
	lea.l	($0018,sp),sp
	movem.l	(sp)+,d3/a1-a2
	tst.l	d0
	rts

L00b476:
	bsr.s	L00b48c
	bmi.s	$0000b48a
	beq.s	$0000b482
	bsr.s	L00b4de
	bmi.s	$0000b48a
	bra.s	L00b476

	clr.w	d2
	move.b	($000c,a0),d2
	moveq.l	#$01,d0
	rts

L00b48c:
	movem.l	d2-d3/a2,-(sp)
	move.l	d1,-(sp)
	bsr.w	L00b71a
	move.w	($000a,a0),d3
	lsr.w	#5,d3
	subq.w	#1,d3
	move.b	(a1),d0
	beq.s	$0000b4d2
	cmp.b	#$e5,d0
	beq.s	$0000b4b6
	cmp.b	#$05,d0
	bne.s	$0000b4b0
	moveq.l	#$e5,d0
	bsr.w	L00f1ca
	beq.s	$0000b4c2
	lea.l	($0020,a1),a1
	dbra.w	d3,$0000b49e
	moveq.l	#$01,d1
	bra.s	$0000b4d4

	addq.l	#4,sp
	move.w	($001a,a1),d1
	rol.w	#8,d1
	bsr.w	L00b22e
	clr.l	d0
	bra.s	$0000b4d8

	moveq.l	#$fd,d0
	movem.l	(sp)+,d1
	movem.l	(sp)+,d2-d3/a2
	rts

L00b4de:
	addq.l	#1,d1
	dbra.w	d2,$0000b4f0
	subq.l	#1,d1
	bsr.s	L00b4f4
	bmi.s	$0000b4f2
	clr.w	d2
	move.b	($000c,a0),d2
	clr.l	d0
	rts

L00b4f4:
	bsr.w	L00b372
	bne.s	L00b4fe
	moveq.l	#$fd,d0
	rts

L00b4fe:
	move.w	d1,d0
	bsr.w	L00cd26
	tst.w	d0
	beq.s	L00b518
	cmp.w	#$ffff,d0
	beq.s	$0000b4fa
	move.w	d0,d1
	bsr.w	L00b22e
	tst.l	d1
	rts

L00b518:
	move.w	#$1005,d7
	trap	#14
	bra.s	L00b518

	movem.l	a0-a1,-(sp)
	move.l	a0,($0002,a3)
	clr.l	($0006,a3)
	move.b	d0,($000e,a3)
	move.b	d1,($002f,a3)
	move.b	($0001,a2),d0
	and.w	#$001f,d0
	tst.w	($000a,a0)
	bne.s	$0000b546
	or.w	#$0020,d0
	or.w	#$0100,d0
	move.w	d0,(a3)
	lea.l	($0043,a2),a0
	lea.l	($0024,a3),a1
	moveq.l	#$07,d1
	move.b	(a0)+,(a1)+
	dbra.w	d1,$0000b556
	lea.l	($004e,a2),a0
	lea.l	($0030,a3),a1
	moveq.l	#$09,d1
	move.b	(a0)+,(a1)+
	dbra.w	d1,$0000b566
	lea.l	($004b,a2),a0
	lea.l	($002c,a3),a1
	moveq.l	#$02,d1
	move.b	(a0)+,(a1)+
	dbra.w	d1,$0000b576
	lea.l	($000f,a3),a0
	clr.b	(a0)+
	clr.l	(a0)+
	clr.l	(a0)+
	clr.l	(a0)+
	clr.l	(a0)+
	clr.l	(a0)
	lea.l	($003a,a3),a0
	bsr.w	$0000a400
	move.w	d0,(a0)+
	bsr.w	L00a3b2
	move.w	d0,(a0)+
	clr.w	(a0)+
	clr.l	(a0)+
	movem.l	(sp)+,a0-a1
	rts

Call_GETDPB:
	bsr.w	L00a780
	move.w	d0,d1
	bsr.w	L00a792
	bmi.s	$0000b628
	movea.l	d0,a0
	cmpi.b	#$40,($0045,a0)		;'@'
	bne.s	L00b626
	movea.l	($0046,a0),a1
	movea.l	(a6),a2
	move.w	(a1)+,(a2)
	move.w	d1,d0
	bsr.w	L00a728
	move.b	d0,(a2)
	move.l	(a1)+,($0012,a2)
	move.l	(a1)+,($0018,a2)
	tst.w	(a1)
	beq.s	L00b634
	lea.l	($0002,a2),a3
	move.w	#$000f,d0
	move.b	(a1)+,(a3)+
	dbra.w	d0,$0000b5e0
	move.w	(a1)+,($0016,a2)
	clr.l	d0
	cmpi.w	#$0002,(a1)
	bne.s	$0000b5f4
	subq.b	#1,d0
	move.b	d0,($0017,a2)
	move.w	($004a,a0),($001c,a2)
	lea.l	($001e,a2),a1
	movem.l	a1,-(sp)
	moveq.l	#$09,d1
	move.b	d1,(a1)+
	bsr.w	L00a768
	cmp.b	(-$0002,a1),d1
	beq.s	$0000b61a
	move.b	d1,(-$0001,a1)
	clr.b	(a1)
	movem.l	(sp)+,a1
	bsr.w	L00a7d6
	clr.l	d0
	rts

L00b626:
	moveq.l	#$f1,d0
	movea.l	(a6),a2
	add.w	#$0041,d1
	move.w	d1,($0002,a2)
	rts

L00b634:
	movea.l	($0046,a0),a1
	lea.l	($0002,a2),a3
	bsr.w	$0000d920
	tst.l	d0
	bmi.s	$0000b628
	move.b	d1,d0
	add.b	#$61,d0			;'a'
	move.b	d0,($0016,a2)
	clr.b	($0017,a2)
	clr.w	($001c,a2)
	bra.s	$0000b5fe

	movem.l	d0-d1,-(sp)
	moveq.l	#$14,d1
	move.b	(a4)+,d0
	cmp.b	#$e5,d0
	bne.s	$0000b66a
	move.b	#$05,d0
	move.b	d0,(a1)+
	move.b	(a4)+,(a1)+
	dbra.w	d1,$0000b66c
	moveq.l	#$02,d1
	move.w	(a4)+,d0
	rol.w	#8,d0
	move.w	d0,(a1)+
	dbra.w	d1,$0000b674
	move.l	(a4),d1
	rol.w	#8,d1
	swap.w	d1
	rol.w	#8,d1
	move.l	d1,(a1)+
	movem.l	(sp)+,d0-d1
	rts

L00b68e:
	.dc.l	L00e9ba
L00b692:
	jmp	(L00cb5c)

	jmp	(L00cb46)

	jmp	(L00cd3e)

	jmp	(L00cd4c)

L00b6aa:
	.dc.l	$00000000,$00000014
	.dc.l	$00000400,$00000000
L00b6ba:
	movem.l	a4-a5,-(sp)
	bsr.w	$0000e858
	bsr.w	L00cc2c
	movea.l	(L00b68e,pc),a4
	lea.l	(L00b692,pc),a5
	jsr	($000c,a4)
	movem.l	(sp)+,a4-a5
	rts

L00b6d8:
	movem.l	d0/a4-a5,-(sp)
L00b6dc:
	bsr.w	$0000cc44
	movea.l	(L00b68e,pc),a4
	lea.l	(L00b692,pc),a5
	jsr	($0042,a4)
	movem.l	(sp)+,d0/a4-a5
	rts

L00b6f2:
	movem.l	a4-a5,-(sp)
	move.l	a0,(L00b6aa)
	move.l	d2,($0000b6ae)
	move.l	d3,($0000b6b2)
	movea.l	(L00b68e,pc),a4
	lea.l	(L00b692,pc),a5
	jsr	($0006,a4)
	movem.l	(sp)+,a4-a5
	rts

L00b71a:
	movem.l	a4-a5,-(sp)
	movea.l	(L00b68e,pc),a4
	lea.l	(L00b692,pc),a5
	jsr	($0018,a4)
	movem.l	(sp)+,a4-a5
	rts

L00b730:
	movem.l	a4-a5,-(sp)
	movea.l	(L00b68e,pc),a4
	lea.l	(L00b692,pc),a5
	jsr	($001e,a4)
	movem.l	(sp)+,a4-a5
	rts

L00b746:
	movem.l	a4-a5,-(sp)
	movea.l	(L00b68e,pc),a4
	lea.l	(L00b692,pc),a5
	jsr	($0012,a4)
	movem.l	(sp)+,a4-a5
	rts

L00b75c:
	movem.l	a4-a5,-(sp)
	tst.w	($000a,a0)
	beq.s	$0000b78a
	bsr.w	$0000e864
	bsr.w	$0000cc38
	movea.l	(L00b68e,pc),a4
	lea.l	(L00b692,pc),a5
	jsr	($0048,a4)
	tst.b	(L01120a)
	beq.s	$0000b78a
	clr.l	($001e,a0)
	clr.l	($002a,a0)
	movem.l	(sp)+,a4-a5
	rts

L00b790:
	movem.l	a4-a5,-(sp)
	movea.l	(L00b68e,pc),a4
	lea.l	(L00b692,pc),a5
	jsr	($0036,a4)
	movem.l	(sp)+,a4-a5
	rts

L00b7a6:
	movem.l	a4-a5,-(sp)
	movea.l	(L00b68e,pc),a4
	lea.l	(L00b692,pc),a5
	jsr	($0054,a4)
	movem.l	(sp)+,a4-a5
	rts

L00b7bc:
	movem.l	a4-a5,-(sp)
	movea.l	(L00b68e,pc),a4
	lea.l	(L00b692,pc),a5
	jsr	($004e,a4)
	movem.l	(sp)+,a4-a5
	rts

L00b7d2:
	movem.l	a4-a5,-(sp)
	movea.l	(L00b68e,pc),a4
	lea.l	(L00b692,pc),a5
	jsr	($0024,a4)
	bra.s	$0000b814

	movem.l	a4-a5,-(sp)
	movea.l	(L00b68e,pc),a4
	lea.l	(L00b692,pc),a5
	move.l	($0018,a3),d0
	beq.s	$0000b7fe
	movea.l	d0,a1
	jsr	($0030,a4)
	beq.s	$0000b814
	jsr	($0024,a4)
	move.l	a1,($0018,a3)
	bra.s	$0000b814

L00b808:
	movem.l	a4-a5,-(sp)
	movea.l	(L00b68e,pc),a4
	lea.l	(L00b692,pc),a5
	jsr	($003c,a4)
	movem.l	(sp)+,a4-a5
	rts

L00b81e:
	movem.l	a4-a5,-(sp)
	movea.l	(L00b68e,pc),a4
	lea.l	(L00b692,pc),a5
	move.l	($0018,a3),d0
	beq.s	$0000b838
	movea.l	d0,a1
	jsr	($0030,a4)
	beq.s	$0000b840
	jsr	($0024,a4)
	move.l	a1,($0018,a3)
	clr.l	d0
	movem.l	(sp)+,a4-a5
	rts

L00b848:
	clr.b	(L011208)
	movem.l	d2-d7/a2-a4,-(sp)
	bsr.w	L00b38a
	bmi.s	$0000b8b4
	tst.b	(L01120a)
	beq.s	$0000b87e
	cmp.l	($001e,a0),d1
	beq.s	$0000b876
	move.l	d1,($001e,a0)
	move.l	d1,($0024,a0)
	move.w	d2,($0022,a0)
	move.w	d2,($0028,a0)
	move.l	($0024,a0),d1
	move.w	($0028,a0),d2
	move.w	($000a,a0),d3
	lsr.w	#5,d3
	subq.w	#1,d3
	bsr.w	L00b71a
	move.w	d3,d6
	clr.l	d0
	move.b	(a1),d0
	beq.s	L00b8ba
	cmp.b	#$e5,d0
	beq.s	L00b8ba
	adda.l	#$00000020,a1
	dbra.w	d6,$0000b88c
	bsr.s	$0000b8e2
	bne.s	$0000b886
	tst.b	(L01120a)
	beq.s	$0000b8b2
	clr.l	($001e,a0)
	moveq.l	#$e8,d0
	movem.l	(sp)+,d2-d7/a2-a4
	rts

L00b8ba:
	tst.b	(L01120a)
	beq.s	$0000b8ca
	move.l	d1,($0024,a0)
	move.w	d2,($0028,a0)
	sub.w	d6,d3
	tst.b	(L011208)
	bne.s	$0000b8dc
	move.w	d3,d4
	lsl.w	#5,d4
	bsr.w	L00e886
	clr.l	d0
	move.b	d3,d0
	bra.s	$0000b8b4

	move.w	($0014,a0),d0
	cmp.w	d0,d1
	bcc.s	L00b8f0
	addq.w	#1,d1
	cmp.w	d0,d1
	rts

L00b8f0:
	addq.l	#1,d1
	dbra.w	d2,$0000b902
	subq.l	#1,d1
	bsr.s	L00b906
	beq.s	$0000b904
	clr.w	d2
	move.b	($000c,a0),d2
	tst.l	d1
	rts

L00b906:
	bsr.w	L00b372
	move.w	d1,d0
	bsr.w	L00cd26
	tst.w	d0
	beq.w	L00b518
	cmp.w	#$ffff,d0
	beq.s	L00b926
	move.w	d0,d1
	bsr.w	L00b22e
	tst.l	d1
	rts

L00b926:
	bsr.w	L00ccae
	bmi.s	L00b940
	move.w	d0,-(sp)
	bsr.w	L00cd0e
	move.w	(sp)+,d1
	bsr.w	L00b22e
	bsr.w	L00bb1a
	tst.l	d1
	rts

L00b940:
	cmp.l	d0,d0
	rts

Call_CHDIR:
	movea.l	(a6),a1
	lea.l	(-$0058,sp),sp
	movea.l	sp,a2
L00b94c:
	bsr.w	L00b352
	tst.l	d0
	bmi.s	$0000b9be
	tst.b	(a2)
	bmi.s	$0000b960
	bne.s	$0000b9bc
	bsr.w	L00b9e0
	bmi.s	$0000b9be
	clr.l	d0
	move.b	($0001,a2),d0
	bsr.w	$0000a8be
	bmi.s	$0000b9be
	movea.l	a0,a1
	movea.l	d0,a0
	lea.l	(-$0042,sp),sp
	lea.l	($0002,a2),a3
	movea.l	sp,a4
	moveq.l	#$41,d0			;'A'
	move.b	(a3)+,(a4)+
	dbra.w	d0,$0000b97c
	bsr.w	L00b24e
	bmi.s	$0000b9b6
	movem.l	a1,-(sp)
	bsr.s	L00b9c4
	movem.l	(sp)+,a1
	tst.l	d0
	bmi.s	$0000b9b6
	move.w	d1,($004a,a1)
	movea.l	sp,a3
	move.w	($004c,a1),d0
	lea.l	(a1,d0.w),a4
	lea.l	($0002,a4),a2
	move.b	(a3)+,(a4)+
	bne.s	$0000b9a8
	clr.l	d0
	cmpa.l	a2,a4
	beq.s	$0000b9b6
	clr.b	(-$0002,a4)
	lea.l	($0042,sp),sp
	bra.s	$0000b9be

	moveq.l	#$f3,d0
	lea.l	($0058,sp),sp
	rts

L00b9c4:
	tst.w	($000a,a0)
	beq.s	L00b9d8
	bsr.w	L00b38a
	move.l	d0,-(sp)
	bsr.w	L00b372
	move.l	(sp)+,d0
	rts

L00b9d8:
	bsr.w	$0000d910
	moveq.l	#$ff,d1
	rts

L00b9e0:
	moveq.l	#$3f,d7			;'?'
	lea.l	($0002,a2),a3
	subq.w	#1,d7
	tst.b	(a3)+
	bne.s	$0000b9e6
	tst.w	d7
	bmi.s	L00ba1c
	addq.w	#1,d7
	subq.l	#1,a3
	movem.l	a1-a3,-(sp)
	lea.l	($0043,a2),a1
	movea.l	a3,a2
	clr.l	d1
	bsr.w	L00f292
	move.b	#$09,(a2)+
	clr.b	(a2)
	movem.l	(sp)+,a1-a3
	subq.w	#1,d7
	tst.b	(a3)+
	bne.s	$0000ba0e
	tst.w	d7
	bmi.s	L00ba1c
	clr.l	d0
	rts

L00ba1c:
	moveq.l	#$f3,d0
	rts

Call_MKDIR:
	movea.l	(a6)+,a1
	lea.l	(-$0058,sp),sp
	movea.l	sp,a2
L00ba28:
	bsr.w	L00b352
	tst.l	d0
	bmi.s	$0000ba6e
	tst.b	(a2)
	bne.s	$0000ba6c
	movea.l	sp,a1
	lea.l	(-$0058,sp),sp
	movea.l	sp,a2
	moveq.l	#$57,d0			;'W'
	move.b	(a1)+,(a2)+
	dbra.w	d0,$0000ba3e
	movea.l	sp,a2
	bsr.w	L00b9e0
	lea.l	($0058,sp),sp
	bmi.s	$0000ba6e
	movea.l	sp,a2
	clr.l	d0
	move.b	($0001,a2),d0
	bsr.w	$0000a8be
	bmi.s	$0000ba6e
	movea.l	a0,a1
	movea.l	d0,a0
	bsr.w	L00b24e
	bmi.s	$0000ba6e
	bsr.s	L00ba74
	bra.s	$0000ba6e

	moveq.l	#$f3,d0
	lea.l	($0058,sp),sp
	rts

L00ba74:
	tst.w	($000a,a0)
	beq.w	L00bb14
	lea.l	(-$0060,sp),sp
	movea.l	sp,a3
	moveq.l	#$04,d0
	moveq.l	#$10,d1
	move.l	a1,-(sp)
	bsr.w	$0000b520
	bsr.w	L00cbe2
	bsr.w	L00b38a
	movea.l	(sp)+,a1
	bmi.s	$0000bb0e
	movem.l	d1-d2/a1-a2,-(sp)
	lea.l	($0043,a2),a2
	bsr.w	L00b476
	movem.l	(sp)+,d1-d2/a1-a2
	bpl.s	$0000bb0c
	cmp.l	#$fffffffd,d0
	bne.s	$0000bb0e
	movem.l	d1,-(sp)
	bsr.w	L00c058
	movem.l	(sp)+,d2
	bmi.s	$0000bb0e
	move.w	($003e,a3),d1
	bsr.w	L00b22e
	bsr.w	L00b730
	move.l	a1,-(sp)
	bsr.w	L00bb56
	bsr.s	L00bb34
	bsr.w	L00bb66
	move.b	#$2e,($0024,a3)		;'.'
	lea.l	($0024,a3),a4
	bsr.w	$0000b658
	move.w	#$2e2e,($0024,a3)	;'..'
	move.l	d2,d1
	bsr.w	L00b372
	move.w	d1,($003e,a3)
	lea.l	($0024,a3),a4
	bsr.w	$0000b658
	movea.l	(sp)+,a1
	bsr.w	L00b808
	bsr.w	L00b6d8
	clr.l	d0
	bra.s	$0000bb0e

	moveq.l	#$ec,d0
	lea.l	($0060,sp),sp
	rts

L00bb14:
	bsr.w	$0000d8ec
	rts

L00bb1a:
	movem.l	d0-d7/a0-a6,-(sp)
	bsr.w	L00b730
	move.l	a1,-(sp)
	bsr.s	L00bb56
	bsr.s	L00bb34
	movea.l	(sp)+,a1
	bsr.w	L00b790
	movem.l	(sp)+,d0-d7/a0-a6
	rts

L00bb34:
	clr.w	d0
	move.b	($000c,a0),d0
	subq.w	#1,d0
	bcs.s	$0000bb54
	move.l	d1,-(sp)
	addq.l	#1,d1
	movem.l	d0-d1/a0-a1,-(sp)
	bsr.w	L00acbc
	movem.l	(sp)+,d0-d1/a0-a1
	dbra.w	d0,$0000bb40
	move.l	(sp)+,d1
	rts

L00bb56:
	movea.l	a1,a4
	move.w	($000a,a0),d0
	subq.w	#1,d0
	clr.b	(a4)+
	dbra.w	d0,$0000bb5e
	rts

L00bb66:
	lea.l	($0024,a3),a4
	moveq.l	#$0a,d1
	moveq.l	#$20,d0			;' '
	move.b	d0,(a4)+
	dbra.w	d1,$0000bb6e
	addq.l	#1,a4
	moveq.l	#$09,d1
	clr.b	(a4)+
	dbra.w	d1,$0000bb78
	rts

Call_FILES:
	movea.l	(a6)+,a5
	movea.l	(a6)+,a1
	move.w	(a6),d2
	move.b	d2,(a5)
	suba.l	#$00000058,sp
	movea.l	sp,a2
	ror.w	#8,d2
	cmp.b	#$01,d2
	beq.s	$0000bb9e
	bsr.w	$0000ad68
	bra.s	$0000bba2

	bsr.w	L00ad64
	tst.l	d0
	bmi.s	$0000bbf4
	bsr.s	$0000bc08
	move.b	($0001,a2),d0
	bsr.w	$0000a8be
	bmi.s	$0000bbf4
	movea.l	a0,a1
	movea.l	d0,a0
	bsr.w	L00b24e
	bmi.s	$0000bbf4
	move.b	($0000.w,a0),($0001,a5)
	tst.w	($000a,a0)
	beq.s	L00bc02
	bsr.w	L00bce0
	tst.l	d0
	bmi.s	$0000bbf4
	move.l	d1,($0002,a5)
	move.w	d0,($0008,a5)
	swap.w	d0
	move.w	d0,($0006,a5)
	bsr.s	L00bc48
	bmi.s	$0000bbf4
	movea.l	a5,a1
	bsr.w	L00f222
	tst.l	d0
	bmi.s	$0000bbf4
	tst.b	(a2)
	bne.s	$0000bbfa
	bsr.w	L00f238
	move.w	#$ffff,($0008,a5)
	adda.l	#$00000058,sp
	rts

L00bc02:
	bsr.w	$0000d932
	bra.s	$0000bbfa

	movem.l	a0-a1,-(sp)
	move.l	a5,d0
	bpl.s	$0000bc32
	lea.l	($0001,a2),a0
	lea.l	($0035,a5),a1
	moveq.l	#$41,d0			;'A'
	add.b	(a0)+,d0
	move.b	d0,(a1)+
	move.b	#$3a,(a1)+		;':'
	moveq.l	#$55,d1			;'U'
	move.b	(a0)+,(a1)+
	dbra.w	d1,$0000bc24
	lea.l	($0035,a5),a1
	bsr.w	L00a7d6
	lea.l	($0043,a2),a0
	lea.l	($000a,a5),a1
	moveq.l	#$0a,d0
	move.b	(a0)+,(a1)+
	dbra.w	d0,$0000bc3c
	movem.l	(sp)+,a0-a1
	rts

L00bc48:
	move.b	($000b,a1),($0015,a5)
	move.w	($0016,a1),d0
	rol.w	#8,d0
	move.w	d0,($0016,a5)
	move.w	($0018,a1),d0
	rol.w	#8,d0
	move.w	d0,($0018,a5)
	move.l	($001c,a1),d0
	rol.w	#8,d0
	swap.w	d0
	rol.w	#8,d0
	move.l	d0,($001a,a5)
	movem.l	a2,-(sp)
	lea.l	($001e,a5),a2
	moveq.l	#$01,d1
	bsr.w	L00f292
	movem.l	(sp)+,a2
	bmi.s	L00bc86
	rts

L00bc86:
	move.w	#$5007,d7
	trap	#14
	moveq.l	#$ee,d0
	rts

Call_NFILES:
	movea.l	(a6),a5
	move.b	($0001,a5),d0
	bsr.w	L00a8dc
	tst.l	d0
	bmi.s	$0000bcd2
	movea.l	d0,a0
	tst.w	($000a,a0)
	beq.s	L00bcda
	moveq.l	#$ee,d0
	cmpi.w	#$ffff,($0008,a5)
	beq.s	$0000bcd2
	bsr.w	L00be48
	tst.l	d0
	bmi.s	L00bcce
	move.l	d1,($0002,a5)
	move.w	d0,($0008,a5)
	swap.w	d0
	move.w	d0,($0006,a5)
	bsr.w	L00bc48
	clr.l	d0
	rts

L00bcce:
	bsr.w	L00f238
	move.w	#$ffff,($0008,a5)
	rts

L00bcda:
	bsr.w	$0000d942
	rts

L00bce0:
	movem.l	d2-d7/a2,-(sp)
	clr.w	d7
	move.b	(a5),d7
	swap.w	d7
	bra.s	$0000bcfa

	movem.l	d2-d7/a2,-(sp)
	moveq.l	#$ff,d7
	bsr.w	$0000e870
	bpl.w	L00be06
	bsr.w	L00b38a
	tst.l	d0
	bmi.w	$0000be00
	tst.l	d7
	bpl.s	$0000bd44
	tst.b	(L01120a)
L00bd0e:
	beq.s	$0000bd44
	cmp.l	($002a,a0),d1
	beq.s	$0000bd2c
	move.l	d1,($002a,a0)
	move.l	d1,($0030,a0)
	move.w	d2,($002e,a0)
	move.w	d2,($0034,a0)
	clr.w	($0036,a0)
	bra.s	$0000bd44

	move.l	($0030,a0),d1
	move.w	($0034,a0),d2
	clr.l	d4
	move.w	($0036,a0),d4
	bsr.w	$0000be7c
	lea.l	($0043,a2),a2
	bra.s	$0000bd58

	move.w	($000a,a0),d3
	lsr.w	#5,d3
	subq.w	#1,d3
	lea.l	($0043,a2),a2
	bsr.w	L00b71a
	move.w	d3,d6
	clr.w	d4
	move.b	(a1),d0
	beq.s	$0000bd6c
	bsr.w	$0000be12
	beq.s	$0000bdda
	dbra.w	d6,$0000bd58
	bsr.w	L00b4de
	beq.s	$0000bd50
	tst.l	d7
	bpl.s	$0000bdd6
	tst.b	(L01120a)
L00bd76:
	beq.s	$0000bdd6
	move.l	($002a,a0),d1
	move.w	($002e,a0),d2
	cmp.l	($0030,a0),d1
	beq.s	$0000bda2
	bsr.w	L00b71a
	move.w	d3,d6
	clr.w	d4
	move.b	(a1),d0
	beq.s	$0000bdd6
	bsr.s	$0000be12
	beq.s	$0000bde6
	dbra.w	d6,$0000bd8e
	bsr.w	L00b4de
	beq.s	$0000bd80
	bra.s	$0000bdc2

	tst.w	($0036,a0)
	beq.s	$0000bdc2
	bsr.w	L00b71a
	move.w	d3,d6
	clr.w	d4
	cmp.w	($0036,a0),d4
	beq.s	$0000bdc2
	move.b	(a1),d0
	beq.s	$0000bdc2
	bsr.s	$0000be12
	beq.s	$0000bde6
	dbra.w	d6,$0000bdb0
	move.l	($002a,a0),d0
	move.l	d0,($0030,a0)
	move.w	($002e,a0),d0
	move.w	d0,($0034,a0)
	clr.w	($0036,a0)
	moveq.l	#$fe,d0
	bra.s	$0000be00

	tst.l	d7
	bpl.s	$0000bdfa
	tst.b	(L01120a)
	beq.s	$0000bdf2
	move.l	d1,($0030,a0)
	move.w	d2,($0034,a0)
	move.w	d4,($0036,a0)
	lea.l	(-$0043,a2),a2
	bsr.w	L00e886
	move.w	d2,d0
	swap.w	d0
	move.w	d4,d0
	movem.l	(sp)+,d2-d7/a2
	rts

L00be06:
	bsr.w	L00b71a
	clr.l	d0
	move.w	d4,d0
	adda.l	d0,a1
	bra.s	$0000bdfa

	cmp.b	#$e5,d0
	beq.s	L00be3c
	swap.w	d7
	move.b	($000b,a1),d5
	bne.s	$0000be22
	moveq.l	#$20,d5			;' '
	and.b	d7,d5
	swap.w	d7
	tst.b	d5
	beq.s	L00be3c
	cmp.b	#$05,d0
	bne.s	$0000be34
	move.b	#$e5,d0
	bsr.w	L00f1ca
	bne.s	L00be3c
	rts

L00be3c:
	adda.l	#$00000020,a1
	add.w	#$0020,d4
	rts

L00be48:
	movem.l	d2-d7/a2,-(sp)
	movea.l	a5,a2
	bsr.w	L00f1e0
	tst.l	d0
	bmi.w	$0000bdd6
	clr.w	d7
	move.b	(a5),d7
	swap.w	d7
	move.l	($0002,a5),d1
	move.w	($0006,a5),d2
	clr.l	d4
	move.w	($0008,a5),d4
	bsr.s	$0000be7c
	add.w	#$0020,d4
	adda.l	#$00000020,a1
	bra.w	$0000bd62

	move.w	($000a,a0),d3
	bsr.w	L00b71a
	adda.l	d4,a1
	lsr.w	#5,d3
	subq.w	#1,d3
	move.l	d4,d6
	lsr.w	#5,d6
	move.w	d3,d0
	sub.w	d6,d0
	move.w	d0,d6
	rts

Call_MAKETMP:
	movea.l	(a6),a1
	movea.l	a1,a0
	move.b	(a1)+,d0
	beq.s	$0000becc
	cmp.b	#$5c,d0			;'\'
	beq.s	$0000be98
	cmp.b	#$3a,d0			;':'
	beq.s	$0000be98
	cmp.b	#$2f,d0			;'/'
	beq.s	$0000be98
	cmp.b	#$81,d0
	bcs.s	$0000be9a
	cmp.b	#$a0,d0
	bcs.s	$0000bec8
	cmp.b	#$e0,d0
	bcs.s	$0000be9a
	cmp.b	#$f0,d0
	bcc.s	$0000be9a
	move.b	(a1)+,d0
	bne.s	$0000be9a
	move.l	a1,d5
	sub.l	a0,d5
	subq.l	#2,d5
	bmi.s	$0000bf26
	move.b	(a0)+,d0
	beq.s	$0000bee6
	cmp.b	#$3f,d0			;'?'
	bne.s	$0000bed4
	move.b	#$30,(-$0001,a0)	;'0'
	bra.s	$0000bed4

	lea.l	(-$0001,a0),a5
	movem.l	d5/a5-a6,-(sp)
	bsr.s	Call_NEWFILE
	movem.l	(sp)+,d5/a5-a6
	cmp.l	#$ffffffb0,d0
	bne.s	$0000bf20
	movea.l	a5,a1
	move.l	d5,d1
	move.b	-(a1),d0
	cmp.b	#$30,d0			;'0'
	bcs.s	$0000bf1a
	cmp.b	#$3a,d0			;':'
	bcc.s	$0000bf1a
	addq.b	#1,d0
	cmp.b	#$3a,d0			;':'
	bcs.s	L00bf22
	move.b	#$30,(a1)		;'0'
	dbra.w	d1,$0000bf00
	moveq.l	#$b0,d0
	rts

L00bf22:
	move.b	d0,(a1)
	bra.s	$0000beea

	moveq.l	#$f3,d0
	rts

Call_NEWFILE:
	clr.l	d7
	bra.s	$0000bf30

Call_CREATE:
	moveq.l	#$01,d7
	movea.l	(a6)+,a1
	lea.l	(-$0058,sp),sp
	movea.l	sp,a2
	bsr.w	L00b352
	tst.l	d0
	bmi.s	$0000bf60
	tst.b	(a2)
	bne.s	$0000bf5e
	clr.l	d0
	move.b	($0001,a2),d0
	bsr.w	$0000a8be
	bmi.s	$0000bf60
	movea.l	a0,a1
	movea.l	d0,a0
	bsr.w	L00b24e
	bmi.s	$0000bf60
	bsr.s	L00bf66
	bra.s	$0000bf60

	moveq.l	#$f3,d0
	lea.l	($0058,sp),sp
	rts

L00bf66:
	move.l	a0,-(sp)
	moveq.l	#$03,d2
	bsr.w	L00ab00
	movea.l	a0,a3
	movea.l	(sp)+,a0
	move.l	d0,-(sp)
	bmi.w	$0000c054
	move.w	(a6),d1
	bne.s	$0000bf7e
	moveq.l	#$20,d1			;' '
	tst.w	d7
	beq.s	$0000bf8a
	swap.w	d7
	move.w	d1,d7
	clr.b	d7
	swap.w	d7
	moveq.l	#$03,d0
	bsr.w	$0000b520
	bsr.w	L00dc20
	bmi.w	L00c036
	tst.w	($000a,a0)
	beq.w	L00c04a
	move.l	a1,-(sp)
	bsr.w	L00cbe2
	tst.l	d7
	bmi.s	$0000bff0
	bsr.w	$0000bcec
	cmp.l	#$fffffffe,d0
	beq.s	$0000bff0
	tst.l	d0
	bmi.s	$0000c01e
	tst.w	d7
	beq.s	L00c01c
	bsr.w	L00acce
	bmi.s	$0000c01e
	tst.b	(L01120a)
L00bfca:
	beq.s	$0000bfec
	move.l	($002a,a0),d0
	move.l	d0,($001e,a0)
	move.l	($0030,a0),d0
	move.l	d0,($0024,a0)
	move.w	($002e,a0),d0
	move.w	d0,($0022,a0)
	move.w	($0034,a0),d0
	move.w	d0,($0028,a0)
	bsr.w	L00e89c
	movea.l	(sp)+,a1
	bsr.w	L00b848
	tst.l	d0
	bmi.s	$0000c024
	move.l	d1,($001c,a3)
	move.b	d0,($000f,a3)
	clr.w	d0
	btst.b	#$03,($002f,a3)
	bne.s	$0000c012
	bsr.w	L00ccae
	bmi.s	$0000c022
	move.w	d0,($003e,a3)
	bsr.s	L00c07e
	move.l	(sp)+,d0
	rts

L00c01c:
	moveq.l	#$b0,d0
	addq.l	#4,sp
	bra.s	$0000c024

	moveq.l	#$e9,d0
	move.l	(sp)+,d1
	move.l	d0,-(sp)
	move.l	d1,d0
	bsr.w	$0000aba4
	bsr.w	L00dd02
	move.l	(sp)+,d0
	rts

L00c036:
	tst.w	d7
	bne.s	$0000c03c
	moveq.l	#$b0,d0
	move.l	(sp)+,d1
	move.l	d0,-(sp)
	move.l	d1,d0
	bsr.w	$0000aba4
	move.l	(sp)+,d0
	rts

L00c04a:
	move.w	(a6),d0
	bsr.w	$0000d8c4
	tst.l	d0
	bmi.s	$0000c024
	move.l	(sp)+,d0
	rts

L00c058:
	move.b	#$01,(L011208)
	bsr.w	$0000b84e
	tst.l	d0
	bmi.s	$0000c07c
	move.l	d1,($001c,a3)
	move.b	d0,($000f,a3)
	bsr.w	L00ccae
	bmi.s	$0000c07c
	move.w	d0,($003e,a3)
	bsr.s	L00c07e
	rts

L00c07e:
	moveq.l	#$20,d0			;' '
	bra.s	$0000c084

	moveq.l	#$e5,d0
	move.w	d0,-(sp)
	movea.l	($0002,a3),a0
	move.l	($001c,a3),d1
	bsr.w	L00b71a
	move.w	(sp)+,d0
	move.l	a1,-(sp)
	clr.l	d2
	move.b	($000f,a3),d2
	asl.w	#5,d2
	adda.l	d2,a1
	lea.l	($0024,a3),a4
	cmp.b	#$e5,d0
	bne.s	$0000c0ba
	cmp.b	(a1),d0
	beq.s	L00c0c8
	move.w	($001a,a1),d0
	rol.w	#8,d0
	cmp.w	($001a,a4),d0
	bne.s	L00c0c8
	bsr.w	$0000b658
	movea.l	(sp)+,a1
	bsr.w	L00b790
	clr.l	d0
	rts

L00c0c8:
	movem.l	d0-d7/a0-a6,-(sp)
	move.w	#$400f,d7
	movea.l	($1c5c),a6
	lea.l	($0038,a6),a6
	trap	#14
	movem.l	(sp)+,d0-d7/a0-a6
	movea.l	(sp)+,a1
	clr.l	d0
	rts

Call_OPEN:
	movea.l	(a6)+,a1
	move.w	(a6),d2
	move.w	d2,d1
	and.w	#$000f,d1
	cmp.b	#$03,d1
	bcc.s	$0000c164
	cmp.b	#$50,d2			;'P'
	bcc.s	$0000c164
	lea.l	(-$0058,sp),sp
	movea.l	sp,a2
	bsr.w	$0000ad68
	tst.l	d0
	bmi.s	$0000c15a
	tst.b	(a2)
	bne.s	L00c160
	bsr.w	L00ab00
	move.l	d0,-(sp)
	bmi.s	$0000c158
	movea.l	a0,a3
	bsr.w	L00f1b4
	bmi.s	L00c168
	movea.l	d0,a0
	move.l	a0,($0002,a3)
	move.b	d2,($000e,a3)
	move.w	($0004,a0),d0
	and.b	#$3f,d0
	or.b	#$c0,d0
	move.b	d0,($0001,a3)
	lea.l	($0043,a2),a0
	lea.l	($0024,a3),a1
	moveq.l	#$07,d1
	move.b	(a0)+,(a1)+
	dbra.w	d1,$0000c140
	btst.l	#$03,d0
	beq.s	$0000c158
	moveq.l	#$f3,d0
	move.l	(sp)+,d1
	move.l	d0,-(sp)
	move.l	d1,d0
	bsr.w	$0000aba4
	move.l	(sp)+,d0
	lea.l	($0058,sp),sp
	rts

L00c160:
	moveq.l	#$f3,d0
	bra.s	$0000c15a

	moveq.l	#$f4,d0
	rts

L00c168:
	clr.l	d0
	move.b	($0001,a2),d0
	bsr.w	$0000a8be
	bmi.s	$0000c14e
	movea.l	a0,a1
	movea.l	d0,a0
	bsr.w	L00b24e
	bmi.s	$0000c14e
	moveq.l	#$20,d1			;' '
	move.w	(a6),d0
	bsr.w	$0000b520
	bsr.w	L00dc20
	bmi.s	$0000c14e
	bsr.s	$0000c1a0
	bpl.s	$0000c158
	move.l	(sp)+,d1
	move.l	d0,-(sp)
	move.l	d1,d0
	bsr.w	$0000aba4
	bsr.w	L00dd02
	bra.s	$0000c158

	tst.w	($000a,a0)
	beq.s	L00c1ac
	bsr.s	L00c1b4
	tst.l	d0
	rts

L00c1ac:
	bsr.w	$0000d8b2
	tst.l	d0
	rts

L00c1b4:
	movem.l	d1/a0-a1/a4,-(sp)
L00c1b8:
	bsr.w	$0000bcec
	tst.l	d0
	bmi.s	$0000c1f8
	move.l	d1,($001c,a3)
	lsr.w	#5,d0
	move.b	d0,($000f,a3)
	lea.l	($0024,a3),a4
	bsr.s	L00c1fe
	move.b	($002f,a3),d0
	and.w	#$0018,d0
	bne.s	$0000c1f6
	move.b	($000e,a3),d0
	and.b	#$0f,d0
	beq.s	$0000c1f2
	move.b	($002f,a3),d0
	and.w	#$0005,d0
	beq.s	$0000c1f2
	moveq.l	#$ed,d0
	bra.s	$0000c1f8

	clr.l	d0
	bra.s	$0000c1f8

	moveq.l	#$fb,d0
	movem.l	(sp)+,d1/a0-a1/a4
	rts

L00c1fe:
	movem.l	d0-d1,-(sp)
	moveq.l	#$14,d1
	move.b	(a1)+,d0
	cmp.b	#$05,d0
	bne.s	$0000c210
	move.b	#$e5,d0
	move.b	d0,(a4)+
	move.b	(a1)+,(a4)+
	dbra.w	d1,$0000c212
	moveq.l	#$02,d1
	move.w	(a1)+,d0
	rol.w	#8,d0
	move.w	d0,(a4)+
	dbra.w	d1,$0000c21a
	move.l	(a1),d1
	rol.w	#8,d1
	swap.w	d1
	rol.w	#8,d1
	move.l	d1,(a4)
	movem.l	(sp)+,d0-d1
	rts

Call_CLOSE:
	move.w	(a6),d0
	bsr.w	$0000aba4
	tst.l	d0
	bmi.s	$0000c26c
	clr.l	d0
	btst.b	#$07,($0001,a0)
	bne.s	$0000c26c
	tst.b	(a0)
	bne.s	L00c26e
	bsr.w	L00dd02
	btst.b	#$05,($0001,a0)
	bne.s	L00c278
	movem.l	a0,-(sp)
	movea.l	($0002,a0),a0
	bsr.w	L00d428
	movem.l	(sp)+,a0
	bmi.s	$0000c26c
	bsr.s	L00c27e
	rts

L00c26e:
	btst.b	#$05,($0001,a0)
	beq.s	$0000c258
	rts

L00c278:
	bsr.w	$0000d8d6
	rts

L00c27e:
	movem.l	d1-d7/a0-a4,-(sp)
	clr.l	d0
	movea.l	a0,a3
	bclr.b	#$06,($0001,a0)
	beq.s	$0000c29e
	DOS	_GETTIME
	move.w	d0,($003a,a0)
	DOS	_GETDATE
	move.w	d0,($003c,a0)
	bsr.w	$0000c082
	movea.l	($0002,a3),a0
	bsr.w	L00b6d8
	movem.l	(sp)+,d1-d7/a0-a4
	rts

Call_READ:
	clr.l	d0
	move.w	(a6)+,d1
	movea.l	(a6)+,a2
	move.l	(a6),d2
	beq.s	$0000c320
	move.w	d1,d0
	bsr.w	L00a9d8
	tst.l	d0
	bmi.s	$0000c320
	move.b	($0001,a0),d0
	btst.l	#$07,d0
	bne.s	L00c326
	bsr.w	$0000dcb6
	bmi.s	$0000c320
	move.b	($0001,a0),d0
	btst.l	#$05,d0
	bne.s	$0000c2fa
	movem.l	a0,-(sp)
	movea.l	($0002,a0),a0
	bsr.w	L00d428
	movem.l	(sp)+,a0
	moveq.l	#$fa,d0
	tst.b	(a0)
	beq.w	$0000c3fa
	bsr.w	L00c490
	bra.w	$0000c3fa

	bsr.w	$0000d888
	bra.w	$0000c3fa

	move.w	d1,d0
	bsr.w	L00a9d8
	tst.l	d0
	bmi.s	$0000c320
	move.b	($0001,a0),d0
	btst.l	#$07,d0
	beq.s	$0000c2ca
	btst.l	#$02,d0
	bne.s	L00c322
	bsr.w	$0000caac
	rts

L00c322:
	clr.l	d0
	rts

L00c326:
	btst.l	#$02,d0
	bne.s	L00c322
	and.w	#$0021,d0
	cmp.w	#$0001,d0
	beq.s	L00c368
	and.w	#$0020,d0
	bne.s	$0000c31c
	clr.l	d7
	movem.l	d2/a2,-(sp)
	moveq.l	#$01,d2
	bsr.w	$0000caac
	movem.l	(sp)+,d2/a2
	tst.l	d0
	beq.s	$0000c364
	addq.l	#1,d7
	move.b	(a2)+,d0
	cmp.b	#$1a,d0
	beq.s	$0000c364
	cmp.b	#$0a,d0
	beq.s	$0000c364
	subq.l	#1,d2
	bne.s	$0000c33e
	move.l	d7,d0
	rts

L00c368:
	move.w	d1,d3
	clr.l	d1
	movem.l	d1-d3/a2,-(sp)
	bsr.w	L008db2
	movem.l	(sp)+,d1-d3/a2
	move.b	d0,(a2)+
	addq.l	#1,d1
	and.w	#$ff00,d0
	beq.s	$0000c386
	subq.l	#1,d2
	bne.s	$0000c36c
	move.l	d1,d0
	rts

Call_WRITE:
	clr.l	d0
	move.w	(a6)+,d1
	move.w	d1,d7
	movea.l	(a6)+,a2
	move.l	(a6),d2
	move.w	d1,d0
	bsr.w	L00a9d8
	tst.l	d0
	bmi.s	$0000c412
	move.b	($000e,a0),d0
	and.b	#$0f,d0
	beq.w	$0000c430
	move.b	($0001,a0),d0
	btst.l	#$07,d0
	bne.w	L00c464
	bsr.w	$0000dcb6
	bmi.s	$0000c412
	move.b	($0001,a0),d0
	btst.l	#$05,d0
	bne.s	$0000c424
	movem.l	a0,-(sp)
	movea.l	($0002,a0),a0
	bsr.w	L00d428
	movem.l	(sp)+,a0
	moveq.l	#$fa,d0
	tst.b	(a0)
	beq.s	$0000c3fa
	tst.l	d2
	beq.s	L00c414
	bsr.w	$0000c72e
	tst.l	d0
	bmi.s	$0000c3fa
	move.l	d0,-(sp)
	move.l	($0020,a0),d0
	cmp.l	($0040,a0),d0
	bcs.s	$0000c3f8
	move.l	d0,($0040,a0)
	move.l	(sp)+,d0
	cmpi.b	#$01,($1c12)
	bne.s	$0000c412
	move.l	d0,-(sp)
	bsr.w	L009014
	move.l	(sp)+,d0
	cmp.w	($1cbc),d1
	beq.w	$000086a4
	rts

L00c414:
	bsr.w	L00c6c8
	move.l	($0006,a0),d0
	move.l	d0,($0040,a0)
	clr.l	d0
	bra.s	$0000c3fa

	bsr.w	$0000d874
	bset.b	#$06,($0001,a0)
	bra.s	$0000c3fa

	moveq.l	#$f4,d0
	rts

L00c434:
	move.l	d2,d0
	rts

L00c438:
	move.w	d1,d0
	bsr.w	L00a9d8
	tst.l	d0
	bmi.s	$0000c412
	move.b	($000e,a0),d0
	and.b	#$0f,d0
	beq.s	$0000c430
	move.b	($0001,a0),d0
	btst.l	#$07,d0
	beq.w	$0000c3b6
	btst.l	#$02,d0
	bne.s	L00c434
	bsr.w	L00caa8
	rts

L00c464:
	btst.l	#$02,d0
	bne.s	L00c434
	tst.l	d2
	beq.s	L00c48c
	and.w	#$0020,d0
	bne.s	$0000c45e
	tst.l	d2
	beq.s	L00c48c
	move.l	d2,-(sp)
	clr.w	d1
	move.b	(a2)+,d1
	move.w	d7,d0
	bsr.w	L008f54
	subq.l	#1,d2
	bne.s	$0000c47a
	move.l	(sp)+,d0
	rts

L00c48c:
	clr.l	d0
	rts

L00c490:
	movem.l	d1-d7/a0-a6,-(sp)
	movea.l	a0,a3
	movea.l	($0002,a3),a0
	move.l	($0006,a3),d3
	clr.l	d7
	move.l	($0040,a3),d0
	sub.l	d3,d0
	beq.w	$0000c55c
	cmp.l	d0,d2
	bcs.s	$0000c4b0
	move.l	d0,d2
	bsr.w	L00c576
	bmi.w	$0000c570
	clr.l	d4
	move.w	($000a,a0),d4
	tst.w	d3
	beq.s	$0000c4f0
	bsr.w	L00b81e
	move.l	d4,d5
	sub.w	d3,d5
	clr.l	d0
	cmp.l	d5,d2
	bcc.s	$0000c4d4
	move.w	d2,d5
	moveq.l	#$ff,d0
	adda.l	d3,a1
	sub.l	d5,d2
	add.l	d5,d7
	subq.w	#1,d5
	move.b	(a1)+,(a2)+
	dbra.w	d5,$0000c4dc
	tst.w	d0
	bne.s	$0000c564
	bsr.w	L00c652
	beq.s	$0000c55c
	clr.l	($0018,a3)
	cmp.l	d4,d2
	bcs.s	$0000c532
	subq.l	#1,d4
	and.l	d2,d4
	move.b	($001b,a0),d0
	lsr.l	d0,d2
	tst.l	d1
	beq.s	$0000c564
	move.l	d2,-(sp)
	bsr.w	L00c69c
	move.l	d0,-(sp)
	bsr.w	L00b7bc
	clr.l	($0018,a3)
	move.l	(sp)+,d1
	move.l	(sp)+,d5
	tst.l	d0
	bmi.s	$0000c570
	move.l	d2,d0
	sub.l	d2,d5
	move.l	d5,d2
	clr.l	d5
	move.b	($001b,a0),d5
	lsl.l	d5,d0
	add.l	d0,d7
	adda.l	d0,a2
	tst.l	d2
	bne.s	$0000c4fe
	move.l	d4,d2
	tst.l	d2
	beq.s	$0000c564
	tst.l	d1
	beq.s	$0000c564
	bsr.w	L00b81e
	add.l	d2,d7
	clr.l	d0
	cmp.w	($000a,a0),d2
	beq.s	$0000c54a
	moveq.l	#$ff,d0
	subq.w	#1,d2
	move.b	(a1)+,(a2)+
	dbra.w	d2,$0000c54c
	tst.l	d0
	bne.s	$0000c564
	bsr.w	L00c652
	bne.s	$0000c564
	clr.l	($0014,a3)
	clr.l	($0018,a3)
	move.l	d7,d0
	add.l	d0,($0006,a3)
	move.l	($0006,a3),($0020,a3)
	movem.l	(sp)+,d1-d7/a0-a6
	rts

L00c576:
	move.l	($0020,a3),d1
	eor.l	d3,d1
	clr.l	d0
	move.w	($000a,a0),d0
	cmp.l	d0,d1
	bcc.s	L00c5a0
	move.l	($0014,a3),d1
	beq.s	L00c5a0
	cmp.l	#$ffffffff,d1
	beq.s	L00c59c
	subq.l	#1,d0
	and.l	d0,d3
	clr.l	d0
	rts

L00c59c:
	moveq.l	#$e9,d0
	rts

L00c5a0:
	clr.l	($0018,a3)
	move.w	($0012,a3),d1
	bne.s	$0000c5c4
	move.w	($003e,a3),d1
	beq.s	L00c61e
	move.w	d1,($0012,a3)
	clr.b	($0010,a3)
	bsr.w	L00b22e
	move.l	d1,($0014,a3)
	clr.l	($0020,a3)
	clr.l	d0
	move.w	($000a,a0),d0
	move.b	($000d,a0),d1
	asl.l	d1,d0
	move.l	($0020,a3),d1
	eor.l	d3,d1
	cmp.l	d0,d1
	bcc.s	L00c622
	move.l	($0014,a3),d1
	beq.s	L00c622
	cmp.l	#$ffffffff,d1
	beq.s	L00c59c
	move.l	d3,d1
	move.b	($001b,a0),d0
	lsr.l	d0,d1
	move.l	d1,-(sp)
	clr.l	d0
	move.w	($000a,a0),d0
	subq.l	#1,d0
	and.l	d0,d3
	move.w	($0012,a3),d1
	bsr.w	L00b22e
	move.l	(sp)+,d0
	and.b	($000c,a0),d0
	move.b	d0,($0010,a3)
	and.l	#$000000ff,d0
	add.l	d0,d1
	move.l	d1,($0014,a3)
	clr.l	d0
	rts

L00c61e:
	moveq.l	#$e7,d0
	rts

L00c622:
	move.l	d3,d1
	move.b	($001b,a0),d0
	lsr.l	d0,d1
	move.l	d1,-(sp)
	clr.l	d0
	move.w	($000a,a0),d0
	subq.l	#1,d0
	and.l	d0,d3
	move.l	d1,d0
	move.b	($000d,a0),d1
	lsr.l	d1,d0
	move.w	($003e,a3),d1
	bsr.w	$0000cc50
	bmi.s	$0000c64e
	move.w	d1,($0012,a3)
	bra.s	$0000c600

	addq.l	#4,sp
	rts

L00c652:
	move.b	($0010,a3),d0
	cmp.b	($000c,a0),d0
	bne.s	L00c68a
	move.w	($0012,a3),d0
	bsr.w	L00cd26
	bmi.s	L00c686
	cmp.w	#$ffff,d0
	beq.s	L00c686
	tst.w	d0
	beq.w	L00b518
	move.w	d0,d1
	move.w	d0,($0012,a3)
	bsr.w	L00b22e
	clr.b	($0010,a3)
	move.l	d1,($0014,a3)
	rts

L00c686:
	clr.l	d1
	rts

L00c68a:
	addq.b	#1,d0
	move.b	d0,($0010,a3)
	move.l	($0014,a3),d1
	addq.l	#1,d1
	move.l	d1,($0014,a3)
	rts

L00c69c:
	movem.l	d1/d3,-(sp)
	move.l	d2,d3
	subq.l	#1,d3
	move.l	d1,-(sp)
	bsr.s	L00c652
	movem.l	(sp)+,d0
	beq.s	$0000c6be
	sub.l	d1,d0
	addq.l	#1,d0
	bne.s	$0000c6ba
	tst.l	d3
	bne.s	$0000c6a2
	clr.l	d3
	move.l	d1,d0
	bra.s	$0000c6c0

	clr.l	d0
	sub.l	d3,d2
	movem.l	(sp)+,d1/d3
	rts

L00c6c8:
	movem.l	d1-d7/a0-a6,-(sp)
	movea.l	a0,a3
	movea.l	($0002,a3),a0
	move.l	($0006,a3),d3
	move.w	($003e,a3),d1
	clr.l	d0
	move.b	($001b,a0),d0
	lsr.l	d0,d3
	move.b	($000d,a0),d0
	lsr.l	d0,d3
	move.w	d1,d0
	bsr.w	L00cd26
	bmi.w	$0000c816
	tst.w	d0
	beq.w	L00b518
	cmp.w	#$ffff,d0
	beq.s	$0000c724
	tst.w	d3
	beq.s	$0000c708
	move.w	d0,d1
	subq.w	#1,d3
	bra.s	$0000c6ea

	move.w	d0,-(sp)
	moveq.l	#$ff,d0
	bsr.w	L00cd0e
	move.w	(sp)+,d0
	bsr.w	L00ccde
	lea.l	($0044,a3),a5
	moveq.l	#$06,d1
	moveq.l	#$ff,d0
	move.l	d0,(a5)+
	dbra.w	d1,$0000c71e
	bset.b	#$06,($0001,a3)
	bra.w	$0000c816

	movem.l	d1-d7/a0-a6,-(sp)
	movea.l	a0,a3
	movea.l	($0002,a3),a0
	move.l	($0006,a3),d3
	clr.l	d7
	bsr.w	$0000c83c
	bmi.w	$0000c820
	clr.l	d4
	move.w	($000a,a0),d4
	tst.w	d3
	beq.s	$0000c780
	bsr.w	$0000b7e4
	move.l	d4,d5
	sub.w	d3,d5
	clr.l	d0
	cmp.l	d5,d2
	bcc.s	$0000c762
	move.w	d2,d5
	moveq.l	#$ff,d0
	adda.l	d3,a1
	sub.l	d5,d2
	add.l	d5,d7
	subq.w	#1,d5
	move.b	(a2)+,(a1)+
	dbra.w	d5,$0000c76a
	tst.w	d0
	bne.s	$0000c7f2
	bsr.w	L00c918
	beq.w	L00c81c
	clr.l	($0018,a3)
	cmp.l	d2,d4
	bcc.s	$0000c7c4
	move.l	d4,d0
	subq.l	#1,d4
	and.l	d2,d4
	move.b	($001b,a0),d0
	lsr.l	d0,d2
	tst.l	d1
	beq.s	$0000c7f2
	move.l	d2,-(sp)
	bsr.w	$0000c974
	move.l	d0,-(sp)
	bsr.w	L00b7a6
	clr.l	($0018,a3)
	move.l	(sp)+,d1
	move.l	(sp)+,d5
	tst.l	d0
	bmi.s	$0000c816
	move.l	d2,d0
	sub.l	d2,d5
	move.l	d5,d2
	clr.l	d5
	move.b	($001b,a0),d5
	lsl.l	d5,d0
	add.l	d0,d7
	adda.l	d0,a2
	tst.l	d2
	bne.s	$0000c790
	move.l	d4,d2
	tst.l	d2
	beq.s	$0000c7f2
	tst.l	d1
	beq.s	$0000c7f2
	bsr.w	$0000b7e4
	add.l	d2,d7
	clr.l	d0
	cmp.w	($000a,a0),d2
	beq.s	$0000c7dc
	moveq.l	#$ff,d0
	subq.w	#1,d2
	move.b	(a2)+,(a1)+
	dbra.w	d2,$0000c7de
	tst.l	d0
	bne.s	$0000c7f2
	bsr.w	L00c918
	beq.s	L00c81c
	clr.l	($0018,a3)
	move.l	d7,d0
	beq.s	$0000c806
	add.l	d0,($0006,a3)
	move.l	($0006,a3),($0020,a3)
	bset.b	#$06,($0001,a3)
	tst.l	d1
	bne.s	$0000c816
	move.l	#$ffffffff,($0014,a3)
	clr.l	($0018,a3)
	movem.l	(sp)+,d1-d7/a0-a6
	rts

L00c81c:
	clr.l	d1
	bra.s	$0000c7f2

	clr.l	($0014,a3)
	clr.l	($0018,a3)
	cmp.l	#$ffffffe9,d0
	bne.s	$0000c816
	move.l	#$ffffffff,($0014,a3)
	clr.l	d0
	bra.s	$0000c816

	move.l	($0020,a3),d1
	eor.l	d3,d1
	clr.l	d0
	move.w	($000a,a0),d0
	cmp.l	d0,d1
	bcc.s	L00c866
	move.l	($0014,a3),d1
	beq.s	L00c866
	cmp.l	#$ffffffff,d1
	beq.s	L00c862
	subq.l	#1,d0
	and.l	d0,d3
	clr.l	d0
	rts

L00c862:
	moveq.l	#$e9,d0
	rts

L00c866:
	clr.l	($0018,a3)
	move.w	($0012,a3),d1
	bne.s	$0000c88a
	move.w	($003e,a3),d1
	beq.s	L00c8e4
	move.w	d1,($0012,a3)
	clr.b	($0010,a3)
	bsr.w	L00b22e
	move.l	d1,($0014,a3)
	clr.l	($0020,a3)
	clr.l	d0
	move.w	($000a,a0),d0
	move.b	($000d,a0),d1
	asl.l	d1,d0
	move.l	($0020,a3),d1
	eor.l	d3,d1
	cmp.l	d0,d1
	bcc.s	L00c8e8
	move.l	($0014,a3),d1
	beq.s	L00c8e8
	cmp.l	#$ffffffff,d1
	beq.s	L00c862
	move.l	d3,d1
	move.b	($001b,a0),d0
	lsr.l	d0,d1
	move.l	d1,-(sp)
	clr.l	d0
	move.w	($000a,a0),d0
	subq.l	#1,d0
	and.l	d0,d3
	move.w	($0012,a3),d1
	bsr.w	L00b22e
	move.l	(sp)+,d0
	and.b	($000c,a0),d0
	move.b	d0,($0010,a3)
	and.l	#$000000ff,d0
	add.l	d0,d1
	move.l	d1,($0014,a3)
	clr.l	d0
	rts

L00c8e4:
	moveq.l	#$e7,d0
	rts

L00c8e8:
	move.l	d3,d1
	move.b	($001b,a0),d0
	lsr.l	d0,d1
	move.l	d1,-(sp)
	clr.l	d0
	move.w	($000a,a0),d0
	subq.l	#1,d0
	and.l	d0,d3
	move.l	d1,d0
	move.b	($000d,a0),d1
	lsr.l	d1,d0
	move.w	($003e,a3),d1
	bsr.w	L00cc72
	bmi.s	$0000c914
	move.w	d1,($0012,a3)
	bra.s	$0000c8c6

	addq.l	#4,sp
	rts

L00c918:
	move.b	($0010,a3),d0
	cmp.b	($000c,a0),d0
	bne.s	L00c952
	move.w	($0012,a3),d1
	move.w	d1,d0
	bsr.w	L00cd26
	bmi.s	L00c94e
	cmp.w	#$ffff,d0
	beq.s	L00c964
	tst.w	d0
	beq.w	L00b518
	move.w	d0,d1
	move.w	d1,($0012,a3)
	bsr.w	L00b22e
	clr.b	($0010,a3)
	move.l	d1,($0014,a3)
	rts

L00c94e:
	clr.l	d1
	rts

L00c952:
	addq.b	#1,d0
	move.b	d0,($0010,a3)
	move.l	($0014,a3),d1
	addq.l	#1,d1
	move.l	d1,($0014,a3)
	rts

L00c964:
	bsr.w	L00ccae
	bmi.s	L00c94e
	move.w	d0,-(sp)
	bsr.w	L00cd0e
	move.w	(sp)+,d1
	bra.s	$0000c93c

	movem.l	d1/d3-d4,-(sp)
	move.l	d2,d3
	subq.l	#1,d3
	movem.l	d1,-(sp)
	bsr.s	L00c918
	movem.l	(sp)+,d0
	beq.s	$0000c998
	sub.l	d1,d0
	addq.l	#1,d0
	bne.s	$0000c994
	tst.l	d3
	bne.s	$0000c97a
	clr.l	d3
	move.l	d1,d0
	bra.s	$0000c99a

	clr.l	d0
	sub.l	d3,d2
	movem.l	(sp)+,d1/d3-d4
	rts

Call_SEEK:
	move.w	(a6)+,d0
	bsr.w	L00a9d8
	tst.l	d0
	bmi.s	$0000c9ec
	move.l	(a6)+,d1
	move.w	(a6),d3
	clr.l	d0
	btst.b	#$07,($0001,a0)
	bne.s	$0000c9e4
	btst.b	#$05,($0001,a0)
	bne.s	L00c9ee
	move.l	($0040,a0),d2
	tst.w	d3
	beq.s	$0000c9d8
	move.l	($0006,a0),d0
	subq.w	#1,d3
	beq.s	$0000c9d8
	subq.w	#1,d3
	bne.s	L00c9ea
	move.l	d2,d0
	add.l	d1,d0
	bmi.s	L00c9e6
	cmp.l	d0,d2
	bcs.s	L00c9e6
	move.l	d0,($0006,a0)
	rts

L00c9e6:
	moveq.l	#$e7,d0
	rts

L00c9ea:
	moveq.l	#$f2,d0
	rts

L00c9ee:
	bsr.w	$0000d89c
	rts

Call_FILEDATE:
	move.w	(a6)+,d0
	bsr.w	L00a9d8
	tst.l	d0
	bmi.s	$0000ca4a
	move.l	(a6),d2
	tst.l	d2
	beq.s	L00ca12
	move.b	($000e,a0),d0
	and.b	#$0f,d0
	bne.s	L00ca12
	moveq.l	#$f4,d0
	rts

L00ca12:
	clr.l	d0
	btst.b	#$07,($0001,a0)
	bne.s	$0000ca4a
	btst.b	#$05,($0001,a0)
	bne.s	L00ca4c
	tst.l	d2
	beq.s	L00ca40
	move.w	d2,($003a,a0)
	swap.w	d2
	move.w	d2,($003c,a0)
	movea.l	a0,a3
	bsr.w	$0000c082
	bclr.b	#$06,($0001,a3)
	rts

L00ca40:
	move.w	($003c,a0),d0
	swap.w	d0
	move.w	($003a,a0),d0
	rts

L00ca4c:
	bsr.w	$0000d952
	rts

Call_DSKFRE:
	bsr.w	L00a780
	move.w	d0,d1
	bsr.w	L00a792
	bmi.s	$0000ca9e
	movea.l	d0,a0
	movea.l	($0046,a0),a0
	tst.w	($000a,a0)
	beq.s	L00caa0
	bsr.w	L00ccc6
	bmi.s	$0000ca9e
	movea.l	(a6),a5
	clr.l	d3
	move.w	d0,d3
	move.w	($0016,a0),d2
	subq.w	#3,d2
	clr.w	d1
	move.b	($000c,a0),d1
	addq.w	#1,d1
	move.w	($000a,a0),d0
	move.w	d3,(a5)+
	move.w	d2,(a5)+
	move.w	d1,(a5)+
	move.w	d0,(a5)
	move.b	($000d,a0),d1
	lsl.l	d1,d3
	move.b	($001b,a0),d1
	lsl.l	d1,d3
	move.l	d3,d0
	rts

L00caa0:
	movea.l	(a6),a2
L00caa2:
	bsr.w	$0000d964
	rts

L00caa8:
	moveq.l	#$08,d0
	bra.s	$0000caae

	moveq.l	#$04,d0
	movem.l	a1/a4-a5,-(sp)
	lea.l	(-$001a,sp),sp
	movea.l	sp,a5
	move.b	#$1a,($0000.w,a5)
	move.b	d0,($0002,a5)
	move.l	a2,($000e,a5)
	move.l	d2,($0012,a5)
	movea.l	($0002,a0),a1
	bsr.w	L00cba6
	move.l	($0012,a5),d0
	lea.l	($001a,sp),sp
	movem.l	(sp)+,a1/a4-a5
	rts

L00cae0:
	lea.l	(-$001a,sp),sp
	movea.l	sp,a5
	move.b	#$1a,($0000.w,a5)
	move.b	d1,($0001,a5)
	move.b	d7,($0002,a5)
	move.b	d2,($000d,a5)
	move.l	(a6)+,($000e,a5)
	move.l	(a6)+,($0012,a5)
	bsr.w	L00cba6
	lea.l	($001a,sp),sp
	rts

L00cb0a:
	lea.l	(-$001a,sp),sp
	movea.l	sp,a5
	move.b	#$1a,($0000.w,a5)
	move.b	d1,($0001,a5)
	move.b	d7,($0002,a5)
	bsr.w	L00defa
	clr.l	d0
	tst.b	($0003,a5)
	bne.s	$0000cb2c
	moveq.l	#$ff,d0
	lea.l	($001a,sp),sp
	rts

L00cb32:
	tst.w	($000a,a0)
	bne.s	L00cb46
	moveq.l	#$54,d0			;'T'
	tst.w	($1c10)
	beq.s	$0000cb5e
	or.b	#$80,d0
	bra.s	$0000cb5e

L00cb46:
	moveq.l	#$08,d0
	tst.w	($1c10)
	beq.s	$0000cb5e
	moveq.l	#$09,d0
	bra.s	$0000cb5e

	tst.w	($000a,a0)
	bne.s	L00cb5c
	moveq.l	#$53,d0			;'S'
	bra.s	$0000cb5e

L00cb5c:
	moveq.l	#$04,d0
	movem.l	a1/a4-a5,-(sp)
	lea.l	(-$001a,sp),sp
	movea.l	sp,a5
	move.b	#$1a,($0000.w,a5)
	move.b	($0001,a0),($0001,a5)
	move.b	d0,($0002,a5)
	move.b	($001a,a0),($000d,a5)
	move.l	a2,($000e,a5)
	move.l	d2,($0012,a5)
	move.l	d1,($0016,a5)
	movea.l	($0002,a0),a1
	bsr.s	L00cba6
	cmpi.b	#$40,($0002,a5)		;'@'
	bcs.s	$0000cb9c
	move.l	($0012,a5),d0
	lea.l	($001a,sp),sp
	movem.l	(sp)+,a1/a4-a5
	rts

L00cba6:
	bsr.w	L00defa
	move.b	($0003,a5),d0
	beq.s	$0000cbb4
	bsr.s	L00cbb8
	bne.s	L00cba6
	clr.l	d0
	rts

L00cbb8:
	movem.l	d1-d7/a0-a6,-(sp)
	clr.b	($1ca3)
	move.b	($0004,a5),d7
	asl.w	#8,d7
	move.b	d0,d7
	movea.l	($1c5c),a6
	lea.l	($0038,a6),a6
	trap	#14
	move.b	#-$01,($1ca3)
	cmp.b	#$02,d7
	movem.l	(sp)+,d1-d7/a0-a6
	rts

L00cbe2:
	movem.l	d0-d7/a0-a6,-(sp)
	clr.l	d7
	bsr.w	L00cd5a
	move.w	#$700e,d7
	btst.l	#$03,d0
	beq.s	$0000cc0e
	movea.l	($1c5c),a6
	lea.l	($0038,a6),a6
	move.l	a0,-(sp)
	trap	#14
	movea.l	(sp)+,a0
	bsr.w	L00d428
	cmp.b	#$02,d7
	bne.s	$0000cbe6
	movem.l	(sp)+,d0-d7/a0-a6
	rts

L00cc14:
	.dc.l	L00eca0
L00cc18:
	jmp	(L00b518)

	jmp	(L00b746)

	jmp	(L00b808)

L00cc2a:
	.dc.w	$0000
L00cc2c:
	movea.l	(L00cc14,pc),a4
	lea.l	(L00cc18,pc),a5
	jmp	($000c,a4)

	movea.l	(L00cc14,pc),a4
	lea.l	(L00cc18,pc),a5
	jmp	($0042,a4)

	movea.l	(L00cc14,pc),a4
	lea.l	(L00cc18,pc),a5
	jmp	($0048,a4)

	movem.l	d2-d3/a1/a4-a5,-(sp)
	movea.l	(L00cc14,pc),a4
	lea.l	(L00cc18,pc),a5
	move.l	($0040,a3),d2
	clr.w	d3
	lea.l	($0044,a3),a1
	jsr	($0012,a4)
	tst.l	d0
	movem.l	(sp)+,d2-d3/a1/a4-a5
	rts

L00cc72:
	movem.l	d2-d3/a1/a4-a5,-(sp)
	movea.l	(L00cc14,pc),a4
	lea.l	(L00cc18,pc),a5
	move.l	($0040,a3),d2
	moveq.l	#$ff,d3
	lea.l	($0044,a3),a1
	jsr	($0012,a4)
	tst.l	d0
	movem.l	(sp)+,d2-d3/a1/a4-a5
	rts

L00cc94:
	movem.l	d3/a4-a5,-(sp)
	movea.l	(L00cc14,pc),a4
	lea.l	(L00cc18,pc),a5
	clr.w	d3
	jsr	($0018,a4)
	tst.l	d0
	movem.l	(sp)+,d3/a4-a5
	rts

L00ccae:
	movem.l	a4-a5,-(sp)
	movea.l	(L00cc14,pc),a4
	lea.l	(L00cc18,pc),a5
	jsr	($0024,a4)
	tst.l	d0
	movem.l	(sp)+,a4-a5
	rts

L00ccc6:
	movem.l	a4-a5,-(sp)
	movea.l	(L00cc14,pc),a4
	lea.l	(L00cc18,pc),a5
	jsr	($002a,a4)
	tst.l	d0
	movem.l	(sp)+,a4-a5
	rts

L00ccde:
	movem.l	a4-a5,-(sp)
	movea.l	(L00cc14,pc),a4
	lea.l	(L00cc18,pc),a5
	jsr	($0030,a4)
	tst.l	d0
	movem.l	(sp)+,a4-a5
	rts

L00ccf6:
	movem.l	a4-a5,-(sp)
	movea.l	(L00cc14,pc),a4
	lea.l	(L00cc18,pc),a5
	jsr	($0036,a4)
	tst.l	d0
	movem.l	(sp)+,a4-a5
	rts

L00cd0e:
	movem.l	a4-a5,-(sp)
	movea.l	(L00cc14,pc),a4
	lea.l	(L00cc18,pc),a5
	jsr	($003c,a4)
	tst.l	d0
	movem.l	(sp)+,a4-a5
	rts

L00cd26:
	movem.l	a4-a5,-(sp)
	movea.l	(L00cc14,pc),a4
	lea.l	(L00cc18,pc),a5
	jsr	($001e,a4)
	tst.l	d0
	movem.l	(sp)+,a4-a5
	rts

L00cd3e:
	movem.l	d0-d1/d7/a1/a4-a5,-(sp)
	moveq.l	#$06,d7
	bsr.s	L00cd5a
	movem.l	(sp)+,d0-d1/d7/a1/a4-a5
	rts

L00cd4c:
	movem.l	d0-d1/d7/a1/a4-a5,-(sp)
	moveq.l	#$07,d7
	bsr.s	L00cd5a
	movem.l	(sp)+,d0-d1/d7/a1/a4-a5
	rts

L00cd5a:
	lea.l	(-$001a,sp),sp
	movea.l	sp,a5
	move.b	#$1a,($0000.w,a5)
	moveq.l	#$05,d0
	tst.w	($000a,a0)
	bne.s	$0000cd70
	moveq.l	#$51,d0			;'Q'
	move.b	d0,($0002,a5)
	move.b	($0001,a0),d0
	move.b	d0,($0001,a5)
	move.b	d7,($000d,a5)
	move.l	a6,($000e,a5)
	clr.l	($0012,a5)
	movea.l	($0002,a0),a1
	bsr.w	L00cba6
	move.l	($0012,a5),d0
	bne.s	$0000cd9a
	move.b	($000d,a5),d0
	lea.l	($001a,sp),sp
	rts

Call_DRVCTRL:
	move.b	(a6)+,d7
	clr.w	d0
	move.b	(a6)+,d0
	bne.s	$0000cdae
	move.b	($1c15),d0
	addq.w	#1,d0
	subq.w	#1,d0
	bsr.w	L00a70c
	bsr.w	L00a792
	bmi.s	$0000cdf8
	movea.l	d0,a1
	movea.l	($0046,a1),a0
	cmp.b	#$01,d7
	beq.s	L00cdfa
	cmp.b	#$02,d7
	beq.s	L00cdee
	cmp.b	#$03,d7
	beq.s	$0000cdf0
	cmp.b	#$06,d7
	bcs.s	$0000cdf4
	cmp.b	#$09,d7
	beq.s	L00cdfa
	cmp.b	#$0a,d7
	beq.s	$0000ce20
	cmp.b	#$10,d7
	bcc.s	$0000cdf4
	moveq.l	#$f2,d0
	rts

L00cdee:
	bra.s	$0000cdf4

	bsr.w	L00b6d8
	bsr.w	L00cd5a
	rts

L00cdfa:
	movem.l	a1,-(sp)
	bsr.s	L00ce44
	bmi.s	$0000ce3e
	bsr.w	L00b6d8
	bsr.w	L00b75c
	movem.l	(sp)+,a1
	clr.w	($004a,a1)
	move.w	($004c,a1),d0
	move.b	#$09,(a1,d0.w)
	clr.b	($01,a1,d0.w)
	tst.w	($000a,a0)
	beq.s	$0000cdf4
	move.w	#$0002,($001c,a0)
	tst.b	(L01120a)
L00ce32:
	beq.s	$0000cdf4
	clr.l	($001e,a0)
	clr.l	($002a,a0)
	bra.s	$0000cdf4

	movem.l	(sp)+,a1
	rts

L00ce44:
	movem.l	d7/a0,-(sp)
	movea.l	a0,a5
	move.w	($1c6e),d6
	move.w	d6,d0
	bsr.w	L00a9d8
	tst.l	d0
	bmi.s	L00ce66
	cmpa.l	($0002,a0),a5
	bne.s	L00ce66
	moveq.l	#$de,d0
	movem.l	(sp)+,d7/a0
	rts

L00ce66:
	subq.w	#1,d6
	bpl.s	$0000ce4e
	clr.l	d0
	movem.l	(sp)+,d7/a0
	rts

Call_CHMOD:
	movea.l	(a6)+,a1
	lea.l	(-$0058,sp),sp
	movea.l	sp,a2
L00ce7a:
	bsr.w	L00b352
	tst.l	d0
	bmi.s	$0000cede
	tst.b	(a2)
	bne.s	$0000cedc
	move.b	($0001,a2),d0
	bsr.w	$0000a8be
	bmi.s	$0000cede
	movea.l	a0,a1
	movea.l	d0,a0
	bsr.w	L00b24e
	bmi.s	$0000cede
	cmpi.w	#$ffff,(a6)
	beq.s	$0000cea6
	bsr.w	L00dc02
	bmi.s	$0000cede
	tst.w	($000a,a0)
	beq.s	L00cee4
	cmpi.w	#$ffff,(a6)
	beq.s	$0000ceb6
	bsr.w	L00cbe2
	bsr.w	$0000bcec
	tst.l	d0
	bmi.s	$0000cede
	clr.l	d0
	lea.l	($000b,a1),a3
	move.b	(a3),d0
	move.w	(a6),d2
	cmp.w	#$ffff,d2
	beq.s	$0000cede
	move.b	d2,(a3)
	bsr.w	L00b7d2
	clr.l	d0
	bsr.w	L00b6d8
	bra.s	$0000cede

	moveq.l	#$f3,d0
	lea.l	($0058,sp),sp
	rts

L00cee4:
	move.w	(a6),d0
	bsr.w	$0000d83e
	bra.s	$0000cede

Call_DELETE:
	movea.l	(a6)+,a1
	lea.l	(-$0058,sp),sp
	movea.l	sp,a2
L00cef4:
	bsr.w	L00b352
	tst.l	d0
	bmi.s	$0000cf1e
	tst.b	(a2)
	bne.s	L00cf24
	clr.l	d0
	move.b	($0001,a2),d0
	bsr.w	$0000a8be
	bmi.s	$0000cf1e
	movea.l	a0,a1
	movea.l	d0,a0
	bsr.w	L00b24e
	bmi.s	$0000cf1e
	bsr.w	L00dc02
	bmi.s	$0000cf1e
	bsr.s	$0000cf28
	lea.l	($0058,sp),sp
	rts

L00cf24:
	moveq.l	#$f3,d0
	bra.s	$0000cf1e

	tst.w	($000a,a0)
	beq.s	L00cf78
	lea.l	(-$0060,sp),sp
	movea.l	sp,a3
	moveq.l	#$04,d0
	moveq.l	#$20,d1			;' '
	bsr.w	$0000b520
	bsr.w	L00cbe2
	bsr.w	$0000bcec
	tst.l	d0
	bmi.s	$0000cf72
	bsr.w	L00acce
	tst.l	d0
	bmi.s	$0000cf72
	bsr.w	L00b6d8
	tst.b	(L01120a)
	beq.s	$0000cf6c
	move.l	($001e,a0),d0
	move.l	d0,($0024,a0)
	move.w	($0022,a0),d0
	move.w	d0,($0028,a0)
	bsr.w	L00e89c
	clr.l	d0
	lea.l	($0060,sp),sp
	rts

L00cf78:
	bsr.w	$0000d974
	rts

Call_RENAME:
	movea.l	(a6)+,a1
	lea.l	(-$00b0,sp),sp
	movea.l	sp,a2
L00cf86:
	bsr.w	L00b352
	tst.l	d0
L00cf8c:
	bmi.w	$0000d0dc
	tst.b	(a2)
	bne.w	$0000d0da
	clr.l	d0
	move.b	($0001,a2),d0
	bsr.w	$0000a8be
	bmi.w	$0000d0dc
	movea.l	a0,a1
	movea.l	d0,a0
	bsr.w	L00b24e
	bmi.w	$0000d0dc
	bsr.w	L00dc02
	bmi.w	$0000d0dc
	movea.l	(a6),a1
	lea.l	($0058,sp),a2
	bsr.w	L00b352
	tst.l	d0
	bmi.w	$0000d0dc
	tst.b	(a2)
	bne.w	$0000d0da
	clr.l	d0
	move.b	($0001,a2),d0
	bsr.w	$0000a8be
	bmi.w	$0000d0dc
	movea.l	a0,a1
	movea.l	d0,a0
	bsr.w	L00b24e
	bmi.w	$0000d0dc
	move.b	($0001,a2),d0
	cmp.b	($0001,sp),d0
	bne.w	$0000d0ba
	tst.w	($000a,a0)
	beq.w	L00d0e2
	bsr.w	L00cbe2
	bsr.w	$0000bcec
	tst.l	d0
	bpl.w	$0000d0be
	cmp.l	#$fffffffe,d0
	bne.w	$0000d0dc
	movea.l	a2,a1
	movea.l	sp,a2
	pea.l	($0002,a2)
	pea.l	($0002,a1)
	bsr.w	L009ea2
	lea.l	($0008,sp),sp
	beq.s	$0000d070
	bsr.w	$0000bcec
	tst.l	d0
	bmi.w	$0000d0dc
	move.b	($000b,a1),d0
	and.b	#$1b,d0
	bne.w	$0000d0d6
	bsr.w	$0000d0ea
	moveq.l	#$1f,d0
	move.b	(a1)+,(a2)+
	dbra.w	d0,$0000d046
	move.b	#$e5,(-$0020,a1)
	bsr.w	L00b7d2
	lea.l	($0058,sp),a2
	bsr.w	L00b848
	tst.l	d0
	bmi.s	$0000d0dc
	movea.l	sp,a4
	movea.l	a1,a3
	moveq.l	#$1f,d2
	move.b	(a4)+,(a3)+
	dbra.w	d2,$0000d068
	bra.s	$0000d084

	bsr.w	$0000bcec
	tst.l	d0
	bmi.s	$0000d0dc
	move.b	($000b,a1),d0
	and.b	#$05,d0
	bne.s	$0000d0d6
	bsr.s	$0000d0ea
	movea.l	a1,a3
	lea.l	($0058,sp),a2
	lea.l	($0043,a2),a4
	move.b	(a4)+,d0
	cmp.b	#$e5,d0
	bne.s	$0000d09a
	move.b	#$05,d0
	move.b	d0,(a3)+
	moveq.l	#$09,d0
	move.b	(a4)+,(a3)+
	dbra.w	d0,$0000d09e
	addq.l	#1,a3
	moveq.l	#$09,d0
	move.b	(a4)+,(a3)+
	dbra.w	d0,$0000d0a8
	bsr.w	L00b7d2
	clr.l	d0
	bsr.w	L00b6d8
	bra.s	$0000d0dc

	moveq.l	#$f1,d0
	bra.s	$0000d0dc

	movea.l	($001a,a1),a3
	movea.l	sp,a2
	bsr.w	$0000bcec
	tst.l	d0
	bmi.s	$0000d0dc
	cmpa.l	($001a,a1),a3
	beq.s	$0000d078
	moveq.l	#$ea,d0
	bra.s	$0000d0dc

	moveq.l	#$ed,d0
	bra.s	$0000d0dc

	moveq.l	#$f3,d0
	lea.l	($00b0,sp),sp
	rts

L00d0e2:
	movea.l	sp,a1
L00d0e4:
	bsr.w	$0000d990
	bra.s	$0000d0dc

	move.b	($000b,a1),d0
	and.b	#$10,d0
	beq.s	L00d10c
	movem.l	d1/a1/a3,-(sp)
	lea.l	($0002,a2),a3
	movea.l	a3,a1
	bsr.w	L00d1ac
	movem.l	(sp)+,d1/a1/a3
	bsr.w	L00e8de
	rts

L00d10c:
	bsr.w	L00e89c
	rts

Call_RMDIR:
	movea.l	(a6),a1
	lea.l	(-$0058,sp),sp
	movea.l	sp,a2
L00d11a:
	bsr.w	L00b352
	tst.l	d0
	bmi.s	$0000d13e
	tst.b	(a2)
	bne.s	L00d144
	clr.l	d0
	move.b	($0001,a2),d0
	bsr.w	$0000a8be
	bmi.s	$0000d13e
	movea.l	a0,a1
	movea.l	d0,a0
	bsr.w	L00b24e
	bmi.s	$0000d13e
	bsr.s	$0000d148
	lea.l	($0058,sp),sp
	rts

L00d144:
	moveq.l	#$f3,d0
	bra.s	$0000d13e

	bsr.w	L00d1d6
	bmi.s	$0000d1a0
	tst.w	($000a,a0)
	beq.s	L00d1a6
	movem.l	a0-a2,-(sp)
	bsr.w	L00d2ae
	movem.l	(sp)+,a0-a2
	bmi.s	$0000d1a0
	bsr.w	$0000bcec
	tst.l	d0
	bmi.s	$0000d1a0
	move.b	($000b,a1),d0
	and.b	#$10,d0
	beq.s	L00d1a2
	bsr.w	$0000acd8
	bmi.s	$0000d1a0
	bsr.w	L00b6d8
	tst.b	(L01120a)
	beq.s	$0000d18e
	clr.l	($001e,a0)
	clr.l	($002a,a0)
	bsr.w	L00e89c
	lea.l	($0002,a2),a3
	movea.l	a3,a1
	bsr.s	L00d1ac
	bsr.w	L00e8de
	clr.l	d0
	rts

L00d1a2:
	moveq.l	#$fd,d0
	rts

L00d1a6:
	bsr.w	$0000d8fe
	rts

L00d1ac:
	move.b	(a3)+,(a1)+
	bne.s	L00d1ac
	subq.l	#1,a1
	movem.l	a2,-(sp)
	move.l	a1,d1
	lea.l	($0043,a2),a1
	movea.l	d1,a2
	clr.l	d1
	bsr.w	L00f292
	bne.s	$0000d1d0
	move.b	#$09,(a2)+
	clr.b	(a2)
	movea.l	a2,a1
	clr.l	d0
	movem.l	(sp)+,a2
	rts

L00d1d6:
	movem.l	d1-d2/a1-a3,-(sp)
	lea.l	(-$0050,sp),sp
	movea.l	sp,a1
	movea.l	a2,a3
	move.w	(a3)+,d0
	add.b	#$41,d0			;'A'
	move.b	d0,(a1)+
	move.b	#$3a,(a1)+		;':'
	bsr.s	L00d1ac
	clr.b	-(a1)
	movea.l	sp,a2
	pea.l	(a2)
	bsr.w	L009f32
	addq.l	#4,sp
	movea.l	($1c38),a1
	clr.w	d2
	move.b	($1c73),d2
	bsr.s	L00d222
	lea.l	($004e,a1),a1
	dbeq.w	d2,$0000d206
	beq.s	$0000d216
	clr.l	d0
	bra.s	$0000d218

	moveq.l	#$f0,d0
	lea.l	($0050,sp),sp
	movem.l	(sp)+,d1-d2/a1-a3
	rts

L00d222:
	movem.l	d0-d1/a1-a3,-(sp)
	lea.l	(-$0050,sp),sp
	movea.l	sp,a3
	moveq.l	#$4e,d0			;'N'
	move.b	(a1)+,(a3)+
	dbeq.w	d0,$0000d22e
	clr.b	(a3)
	movea.l	sp,a1
	pea.l	(a1)
	bsr.w	L009f32
	addq.l	#4,sp
	moveq.l	#$02,d0
	cmpm.b	(a1)+,(a2)+
	dbne.w	d0,$0000d242
	bne.s	$0000d2a4
	moveq.l	#$07,d0
	move.b	(a1)+,d1
	cmp.b	(a2)+,d1
	bne.s	$0000d2a4
	tst.b	d1
	beq.s	$0000d2a4
	cmp.b	#$09,d1
	beq.s	$0000d24a
	cmp.b	#$2e,d1			;'.'
	dbeq.w	d0,$0000d24c
	beq.s	$0000d28a
	move.b	(a1)+,d1
	beq.s	$0000d278
	cmp.b	#$2e,d1			;'.'
	beq.s	$0000d278
	cmp.b	#$09,d1
	bne.s	$0000d266
	subq.l	#1,a1
	move.b	(a2)+,d0
	beq.s	$0000d28a
	cmp.b	#$2e,d0			;'.'
	beq.s	$0000d28a
	cmp.b	#$09,d0
	bne.s	$0000d278
	subq.l	#1,a2
	or.b	d0,d1
	beq.s	$0000d2a4
	moveq.l	#$02,d0
	move.b	(a1)+,d1
	cmp.b	(a2)+,d1
	bne.s	$0000d2a4
	tst.b	d1
	beq.s	$0000d2a4
	cmp.b	#$09,d1
	dbeq.w	d0,$0000d290
	bra.s	$0000d24a

	lea.l	($0050,sp),sp
	movem.l	(sp)+,d0-d1/a1-a3
	rts

L00d2ae:
	movea.l	(a6),a1
	lea.l	(-$0080,sp),sp
	movea.l	sp,a2
	moveq.l	#$7b,d0			;'{'
	move.b	(a1)+,(a2)+
	dbeq.w	d0,$0000d2b8
	move.b	#$5c,(-$0001,a2)	;'\'
	move.b	#$2a,(a2)+		;'*'
	move.b	#$2e,(a2)+		;'.'
	move.b	#$2a,(a2)+		;'*'
	clr.b	(a2)
	movea.l	sp,a1
	lea.l	(-$0036,sp),sp
	movea.l	sp,a2
	move.l	a6,-(sp)
	move.w	#$00ff,-(sp)
	move.l	a1,-(sp)
	move.l	a2,-(sp)
	movea.l	sp,a6
	bsr.w	Call_FILES
	movea.l	(sp)+,a2
	addq.l	#6,sp
	tst.l	d0
	bmi.s	L00d318
	move.w	($001e,a2),d0
	cmp.w	#$2e00,d0
	beq.s	$0000d302
	cmp.w	#$2e2e,d0		;'..'
	bne.s	$0000d30e
	move.l	a2,-(sp)
	movea.l	sp,a6
	bsr.w	Call_NFILES
	movea.l	(sp)+,a2
	bra.s	$0000d2ee

	movea.l	(sp)+,a6
	lea.l	($00b6,sp),sp
	moveq.l	#$eb,d0
	rts

L00d318:
	movea.l	(sp)+,a6
	lea.l	($00b6,sp),sp
	clr.l	d0
	rts

L00d322:
	move.w	($1c70),d0
	cmp.w	($0000.w,a3),d0
	bcc.s	L00d330
L00d32c:
	moveq.l	#$ff,d0
	rts

L00d330:
	move.w	($0000.w,a3),d0
	move.w	d0,($000a,a2)
	subq.w	#1,d0
	moveq.l	#$ff,d1
L00d33c:
	addq.b	#1,d1
	lsr.w	#1,d0
	bcs.s	L00d33c
	move.b	d1,($001b,a2)
	move.b	($0002,a3),d0
	subq.b	#1,d0
	move.b	d0,($000c,a2)
	moveq.l	#$ff,d1
L00d352:
	addq.b	#1,d1
	lsr.b	#1,d0
	bcs.s	L00d352
	move.b	($0003,a3),d0
	bclr.l	#$07,d0
	beq.s	L00d366
	bset.l	#$07,d1
L00d366:
	move.b	d0,($0010,a2)
	move.b	d1,($000d,a2)
	move.w	($0004,a3),d0
	move.w	d0,($000e,a2)
	move.b	($000b,a3),d0
	move.b	d0,($0011,a2)
	move.w	($0006,a3),d2
	move.w	d2,($0012,a2)
	clr.w	d0
	clr.w	d1
	move.b	($0011,a2),d0
	move.b	($0010,a2),d1
	mulu.w	d1,d0
	add.w	($000e,a2),d0
	move.w	d0,($0018,a2)
	mulu.w	#$0020,d2
	divu.w	($000a,a2),d2
	cmp.l	d5,d2
	bcs.s	L00d3aa
	addq.w	#1,d2
L00d3aa:
	add.w	d2,d0
	move.w	d0,($0014,a2)
	clr.l	d1
	move.w	($0008,a3),d1
	bne.s	L00d3bc
	move.l	($000c,a3),d1
L00d3bc:
	sub.l	d0,d1
	move.b	($000d,a2),d0
	lsr.l	d0,d1
	addq.l	#3,d1
	cmp.l	#$0000fff8,d1
	bcc.w	L00d32c
	move.w	d1,($0016,a2)
	move.b	($000a,a3),d0
	move.b	d0,($001a,a2)
	move.w	#$0002,($001c,a2)
	tst.b	(L01120a)
	beq.s	L00d3f2
	clr.l	($001e,a2)
	clr.l	($002a,a2)
L00d3f2:
	clr.l	d0
	rts

L00d3f6:
	bsr.w	L00d4a6
	tst.l	d0
	beq.s	$0000d426
	movem.l	d1-d2/d5/a2-a3,-(sp)
	movea.l	a0,a2
	movea.l	d0,a3
	move.l	#$00010000,d5
	bsr.w	L00d322
	movem.l	(sp)+,d1-d2/d5/a2-a3
	beq.s	$0000d426
	movem.l	d0-d7/a0-a6,-(sp)
	move.w	#$2007,d7
	trap	#14
	movem.l	(sp)+,d0-d7/a0-a6
	bra.s	L00d3f6

	rts

L00d428:
	tst.w	($000a,a0)
	beq.s	L00d450
	bsr.w	$0000d4ec
	beq.s	L00d448
	bsr.s	L00d460
	tst.b	d0
	bpl.s	$0000d446
	bsr.w	L00b75c
	bsr.s	L00d3f6
	bsr.w	L00d534
	moveq.l	#$ff,d0
	rts

L00d448:
	bsr.w	L00b75c
	moveq.l	#$ff,d0
	rts

L00d450:
	bsr.w	$0000d850
	tst.b	d0
	bpl.s	$0000d446
	bsr.w	$0000d544
	moveq.l	#$ff,d0
	rts

L00d460:
	movem.l	a1/a4-a5,-(sp)
	lea.l	(-$001a,sp),sp
	movea.l	sp,a5
	move.b	#$1a,($0000.w,a5)
	move.b	#$01,($0002,a5)
	move.b	($0001,a0),d0
	move.b	d0,($0001,a5)
	move.b	($001a,a0),d0
	move.b	d0,($000d,a5)
	movea.l	($0002,a0),a1
	bsr.w	L00defa
	clr.l	d0
	move.b	($000e,a5),d0
	tst.b	($0003,a5)
	beq.s	$0000d49c
	moveq.l	#$ff,d0
	lea.l	($001a,sp),sp
	movem.l	(sp)+,a1/a4-a5
	rts

L00d4a6:
	movem.l	a1/a4-a5,-(sp)
	lea.l	(-$001a,sp),sp
	movea.l	sp,a5
	move.b	#$1a,($0000.w,a5)
	move.b	#$02,($0002,a5)
	move.b	($0001,a0),d0
	move.b	d0,($0001,a5)
	move.b	($001a,a0),d0
	move.b	d0,($000d,a5)
	movea.l	($0002,a0),a1
	clr.l	($0012,a5)
	bsr.w	L00defa
	clr.l	d0
	tst.b	($0003,a5)
	bne.s	$0000d52a
	move.l	($0012,a5),d0
	beq.s	$0000d52a
	movea.l	d0,a5
	move.l	(a5),d0
	bra.s	$0000d52a

	movem.l	a1/a4-a5,-(sp)
	lea.l	(-$001a,sp),sp
	movea.l	sp,a5
	move.b	#$1a,($0000.w,a5)
	move.b	#$05,($0002,a5)
	move.b	($0001,a0),d0
	move.b	d0,($0001,a5)
	move.b	#$09,($000d,a5)
	movea.l	($0002,a0),a1
	bsr.w	L00defa
	clr.l	d0
	move.b	($000d,a5),d0
	tst.b	($0003,a5)
	beq.s	$0000d526
	clr.l	d0
	and.b	#$02,d0
	lea.l	($001a,sp),sp
	movem.l	(sp)+,a1/a4-a5
	rts

L00d534:
	movem.l	d1/a1,-(sp)
L00d538:
	bsr.w	L00cd4c
	move.w	#$0002,($001c,a0)
	bra.s	$0000d548

	movem.l	d1/a1,-(sp)
	movea.l	($1c38),a1
	clr.l	d1
	move.b	($1c73),d1
	cmpa.l	($0046,a1),a0
	bne.w	$0000d5ec
	cmpi.b	#$60,($0045,a1)		;'`'
	bne.s	$0000d5c4
	movem.l	d1/a0-a3,-(sp)
	move.w	($004c,a1),d1
	clr.l	d0
	move.b	(a1),d0
	and.b	#$1f,d0
	subq.b	#1,d0
	mulu.w	#$004e,d0
	movea.l	($1c38),a3
	adda.l	d0,a3
	movem.l	d1/a1/a3,-(sp)
	subq.l	#1,d1
	cmpm.b	(a1)+,(a3)+
	bne.s	$0000d58e
	dbra.w	d1,$0000d584
	clr.l	d1
	movem.l	(sp)+,d1/a1/a3
	bne.s	$0000d5b8
	move.w	#$ffff,($004a,a1)
	move.w	#$ffff,($004a,a3)
	movem.l	d1/a3,-(sp)
	lea.l	(a3,d1.w),a3
	move.w	(a1),d1
	bsr.s	L00d5fa
	movem.l	(sp)+,d1/a1
	tst.l	d0
	bpl.s	$0000d5b8
	clr.b	(a1,d1.w)
	move.w	#$ffff,($004a,a1)
	movem.l	(sp)+,d1/a0-a3
	bra.s	$0000d5ec

	movem.l	d1/a0/a2-a3,-(sp)
	movea.l	a1,a3
	move.w	(a3)+,d1
	move.w	#$ffff,($004a,a1)
	bsr.s	L00d5fa
	tst.l	d0
	bpl.s	$0000d5e4
	move.w	#$0002,($004c,a1)
	clr.b	($0003,a1)
	moveq.l	#$ff,d1
	move.w	d1,($004a,a1)
	movem.l	(sp)+,d1/a0/a2-a3
	lea.l	($004e,a1),a1
	dbra.w	d1,$0000d552
	movem.l	(sp)+,d1/a1
	rts

L00d5fa:
	move.w	#$ffff,($004a,a1)
	lea.l	(-$005c,sp),sp
	movea.l	sp,a2
	move.w	d1,(a2)+
	move.b	(a3)+,(a2)+
	bne.s	$0000d608
	move.l	a2,d0
	sub.l	sp,d0
	cmp.l	#$00000004,d0
	beq.s	$0000d620
	move.b	#$09,(-$0001,a2)
	clr.b	(a2)
	movea.l	sp,a2
	movem.l	d2-d7/a1/a3-a6,-(sp)
	bsr.w	L00b9c4
	movem.l	(sp)+,d2-d7/a1/a3-a6
	lea.l	($005c,sp),sp
	rts

Call_ASSIGN:
	move.w	(a6)+,d7
	movea.l	(a6)+,a0
	clr.l	d1
	move.b	(a0)+,d1
	cmpi.b	#$3a,(a0)+		;':'
	bne.s	$0000d686
	tst.b	(a0)
	bne.s	$0000d686
	or.b	#$20,d1
	sub.b	#$61,d1			;'a'
	cmp.b	#$1a,d1
	bcc.s	$0000d686
	cmp.b	($1c73),d1
	bhi.s	L00d68a
	move.w	d1,d0
	bsr.w	L00a70c
	move.w	d0,d1
	movea.l	($1c38),a0
	moveq.l	#$4e,d0			;'N'
	mulu.w	d1,d0
	adda.l	d0,a0
	clr.l	d0
	move.b	($0045,a0),d0
	movea.l	(a6)+,a1
	tst.w	d7
	beq.w	$0000d7e4
	cmp.w	#$0001,d7
	beq.s	L00d6d6
	cmp.w	#$0004,d7
	beq.s	L00d68e
	moveq.l	#$f2,d0
	rts

L00d68a:
	moveq.l	#$f1,d0
	rts

L00d68e:
	cmp.b	#$60,d0			;'`'
	beq.s	$0000d69a
	cmp.b	#$50,d0			;'P'
	bne.s	$0000d686
	moveq.l	#$40,d2			;'@'
	move.w	d1,d0
	bsr.w	L00a8dc
	bpl.s	$0000d6b4
	move.b	($1c15),d0
	bsr.w	L00a70c
	cmp.b	d0,d1
	beq.s	$0000d686
	moveq.l	#$ff,d0
	moveq.l	#$00,d2
	ror.l	#8,d1
	add.l	#$413a0900,d1
	move.l	d1,(a0)
	move.b	d2,($0045,a0)
	move.l	d0,($0046,a0)
	move.w	#$ffff,($004a,a0)
	move.w	#$0002,($004c,a0)
	clr.l	d0
	rts

L00d6d6:
	move.w	d1,d2
	move.w	(a6),d1
	cmp.b	#$50,d1			;'P'
	beq.s	$0000d6fa
	cmp.b	#$60,d1			;'`'
	bne.s	$0000d686
	cmp.b	#$40,d0			;'@'
	bne.s	$0000d686
	move.b	($1c15),d0
	bsr.w	L00a70c
	cmp.b	d0,d2
	beq.s	$0000d686
	bra.s	$0000d708

	cmp.b	#$00,d0
	beq.s	$0000d708
	cmp.b	#$40,d0			;'@'
	bne.w	$0000d686
	move.l	d1,d6
	movea.l	a0,a6
	lea.l	(-$0058,sp),sp
	movea.l	sp,a2
	bsr.w	L00b352
	tst.l	d0
	bmi.s	$0000d788
	move.b	(a2),d0
	cmp.b	#$ff,d0
	beq.s	$0000d72c
	tst.b	d0
	bne.s	$0000d786
	bsr.w	L00b9e0
	bmi.s	$0000d788
	tst.b	($0003,a2)
	beq.s	$0000d75a
	move.w	d6,-(sp)
	movem.l	a0-a2/a6,-(sp)
	lea.l	(-$0036,sp),sp
	movea.l	sp,a2
	move.w	#$0110,-(sp)
	move.l	a1,-(sp)
	move.l	a2,-(sp)
	movea.l	sp,a6
	bsr.w	Call_FILES
	lea.l	($0040,sp),sp
	movem.l	(sp)+,a0-a2/a6
	move.w	(sp)+,d6
	tst.l	d0
	bmi.s	$0000d788
	clr.l	d0
	move.b	($0001,a2),d0
	bsr.w	$0000a8be
	bmi.s	$0000d788
	movea.l	a0,a1
	movea.l	d0,a0
	bsr.w	L00b24e
	bmi.s	$0000d788
	cmp.b	#$50,d6			;'P'
	bne.s	L00d78e
	move.l	a0,($0046,a6)
	move.w	#$ffff,($004a,a6)
	bra.s	$0000d7b4

	moveq.l	#$f2,d0
	bra.s	$0000d788

	moveq.l	#$f3,d0
	lea.l	($0058,sp),sp
	rts

L00d78e:
	move.b	($0001,a2),d0
	clr.l	d1
	move.b	d0,d1
	movea.l	($1c38),a1
	mulu.w	#$004e,d1
	adda.l	d1,a1
	cmpa.l	a1,a6
	beq.s	$0000d782
	cmpi.b	#$60,($0045,a1)		;'`'
	bne.s	$0000d7b4
	move.b	(a1),d0
	sub.b	#$41,d0			;'A'
	bra.s	$0000d792

	move.b	d6,($0045,a6)
	move.b	($0001,a2),d0
	add.b	#$41,d0			;'A'
	movea.l	a6,a1
	move.b	d0,(a1)+
	move.b	#$3a,(a1)+		;':'
	clr.l	d1
	addq.l	#2,a2
	addq.w	#1,d1
	move.b	(a2)+,(a1)+
	bne.s	$0000d7cc
	cmp.w	#$0002,d1
	beq.s	$0000d7dc
	clr.b	(-$0002,a1)
	move.w	d1,($004c,a6)
	clr.l	d0
	bra.s	$0000d788

	move.l	a1,-(sp)
	cmp.b	#$50,d0			;'P'
	beq.s	L00d814
	cmp.b	#$60,d0			;'`'
	beq.s	L00d814
	move.b	(a0)+,(a1)+
	bne.s	$0000d7f2
	movea.l	(sp)+,a1
	move.l	d0,-(sp)
	move.b	(a1),d0
	and.w	#$001f,d0
	subq.w	#1,d0
	bsr.w	L00a728
	add.w	#$0041,d0
	move.b	d0,(a1)
	bsr.w	L00a7d6
	move.l	(sp)+,d0
	rts

L00d814:
	move.w	($004c,a0),d1
	cmp.w	#$0002,d1
	beq.s	$0000d820
	subq.w	#1,d1
	move.b	(a0)+,(a1)+
	dbra.w	d1,$0000d820
	clr.b	(a1)
	bra.s	$0000d7f6

	movem.l	d1-d4/a0-a1/a4-a5,-(sp)
	move.l	d5,d1
	move.l	d6,d2
	move.l	a0,d3
	move.b	d7,d4
	movea.l	a1,a0
	moveq.l	#$58,d0			;'X'
	bra.w	$0000d99e

	movem.l	d1-d4/a0-a1/a4-a5,-(sp)
	move.l	a2,d1
	clr.l	d2
	clr.l	d3
	move.b	d0,d4
	moveq.l	#$46,d0			;'F'
	bra.w	$0000d99e

	movem.l	d1-d4/a0-a1/a4-a5,-(sp)
	clr.l	d1
	clr.l	d2
	clr.l	d3
	clr.l	d4
	moveq.l	#$57,d0			;'W'
	bra.w	$0000d99e

	movem.l	d1-d4/a0-a1/a4-a5,-(sp)
	clr.l	d1
	clr.l	d2
	clr.l	d3
	clr.l	d4
	moveq.l	#$56,d0			;'V'
	bra.w	$0000d99e

	movem.l	d1-d4/a0-a1/a4-a5,-(sp)
	move.l	a2,d1
	move.l	a0,d3
	clr.l	d4
	movea.l	($0002,a0),a0
	moveq.l	#$4d,d0			;'M'
	bra.w	$0000d99e

	movem.l	d1-d4/a0-a1/a4-a5,-(sp)
	move.l	a2,d1
	move.l	a0,d3
	clr.l	d4
	movea.l	($0002,a0),a0
	moveq.l	#$4c,d0			;'L'
	bra.w	$0000d99e

	movem.l	d1-d4/a0-a1/a4-a5,-(sp)
	move.b	d3,d4
	move.l	d1,d2
	clr.l	d1
	move.l	a0,d3
	movea.l	($0002,a0),a0
	moveq.l	#$4e,d0			;'N'
	bra.w	$0000d99e

	movem.l	d1-d4/a0-a1/a4-a5,-(sp)
	move.l	a2,d1
	clr.l	d2
	move.l	a3,d3
	clr.l	d4
	moveq.l	#$4a,d0			;'J'
	bra.w	$0000d99e

	movem.l	d1-d4/a0-a1/a4-a5,-(sp)
	move.b	d0,d4
	move.l	a2,d1
	move.l	d7,d2
	move.l	a3,d3
	moveq.l	#$49,d0			;'I'
	bra.w	$0000d99e

	movem.l	d1-d4/a0-a1/a4-a5,-(sp)
	clr.l	d1
	clr.l	d2
	move.l	a0,d3
	clr.l	d4
	movea.l	($0002,a0),a0
	moveq.l	#$4b,d0			;'K'
	bra.w	$0000d99e

	movem.l	d1-d4/a0-a1/a4-a5,-(sp)
	move.l	a2,d1
	clr.l	d2
	clr.l	d3
	clr.l	d4
	moveq.l	#$42,d0			;'B'
	bra.w	$0000d99e

	movem.l	d1-d4/a0-a1/a4-a5,-(sp)
	move.l	a2,d1
	clr.l	d2
	clr.l	d3
	clr.l	d4
	moveq.l	#$43,d0			;'C'
	bra.w	$0000d99e

	movem.l	d1-d4/a0-a1/a4-a5,-(sp)
	move.l	a2,d1
	clr.l	d2
	clr.l	d3
	clr.l	d4
	moveq.l	#$41,d0			;'A'
	bra.s	$0000d99e

	movem.l	d1-d4/a0-a1/a4-a5,-(sp)
	movea.l	a1,a0
	move.l	a3,d1
	clr.l	d2
	clr.l	d3
	clr.l	d4
	moveq.l	#$52,d0			;'R'
	bra.s	$0000d99e

	movem.l	d1-d4/a0-a1/a4-a5,-(sp)
	move.l	a2,d1
	move.l	a5,d2
	clr.l	d3
	move.b	(a5),d4
	moveq.l	#$47,d0			;'G'
	bra.s	$0000d99e

	movem.l	d1-d4/a0-a1/a4-a5,-(sp)
	clr.l	d1
	move.l	a5,d2
	clr.l	d3
	clr.l	d4
	moveq.l	#$48,d0			;'H'
	bra.s	$0000d99e

	movem.l	d1-d4/a0-a1/a4-a5,-(sp)
	clr.l	d1
	move.l	a0,d3
	clr.l	d4
	movea.l	($0002,a0),a0
	moveq.l	#$4f,d0			;'O'
	bra.s	$0000d99e

	movem.l	d1-d4/a0-a1/a4-a5,-(sp)
	move.l	a2,d1
	clr.l	d2
	clr.l	d3
	clr.l	d4
	moveq.l	#$50,d0			;'P'
	bra.s	$0000d99e

	movem.l	d1-d4/a0-a1/a4-a5,-(sp)
	move.l	a2,d1
	clr.l	d2
	clr.l	d3
	clr.l	d4
	moveq.l	#$45,d0			;'E'
	bra.s	$0000d99e

	movem.l	d1-d4/a0-a1/a4-a5,-(sp)
	clr.l	d3
	clr.l	d4
	moveq.l	#$55,d0			;'U'
	bra.s	$0000d99e

	movem.l	d1-d4/a0-a1/a4-a5,-(sp)
	move.l	a1,d1
	move.l	a2,d2
	clr.l	d3
	clr.l	d4
	moveq.l	#$44,d0			;'D'
	tst.w	($1c10)
	beq.s	$0000d9a8
	or.b	#$80,d0
	lea.l	(-$001a,sp),sp
	movea.l	sp,a5
	move.b	#$1a,($0000.w,a5)
	move.b	($0001,a0),($0001,a5)
	move.b	d0,($0002,a5)
	move.b	d4,($000d,a5)
	move.l	d1,($000e,a5)
	move.l	d2,($0012,a5)
	move.l	d3,($0016,a5)
	movea.l	($0002,a0),a1
	bsr.w	L00cba6
	move.l	($0012,a5),d0
	lea.l	($001a,sp),sp
	movem.l	(sp)+,d1-d4/a0-a1/a4-a5
	rts

Call_COMMON:
	move.w	(a6)+,d0
	movea.l	(a6)+,a2
	tst.w	d0
	beq.w	L00db90
	cmp.w	#$0005,d0
	beq.w	L00db9a
	bcc.s	L00da2c
	move.l	(a6)+,d4
	bmi.s	L00da2c
	movea.l	(a6)+,a3
	move.l	(a6),d5
	bmi.s	L00da2c
	subq.w	#1,d0
	beq.s	L00da4c
	subq.w	#1,d0
	beq.w	L00daac
	subq.w	#1,d0
	beq.s	L00da30
	bsr.w	L00dbd2
	bmi.s	$0000da2a
	cmpa.l	-(a0),a3
	bne.s	L00da2c
	cmp.l	-(a0),d5
	bne.s	L00da2c
	cmp.l	-(a0),d4
	bne.s	L00da2c
	clr.l	(a0)+
	clr.l	(a0)+
	clr.l	(a0)+
	clr.l	d0
	rts

L00da2c:
	moveq.l	#$f2,d0
	rts

L00da30:
	bsr.w	L00dbd2
	bmi.s	$0000da2a
	tst.l	-(a0)
	bne.s	L00da2c
	tst.l	-(a0)
	bne.s	L00da2c
	tst.l	-(a0)
	bne.s	L00da2c
	move.l	d4,(a0)+
	move.l	d5,(a0)+
	move.l	a3,(a0)
	clr.l	d0
	rts

L00da4c:
	bsr.w	L00dbd2
	bmi.s	$0000da66
	bsr.s	L00da68
	bmi.s	$0000da66
	cmp.l	d5,d3
	bcc.s	$0000da5c
	move.l	d3,d5
	move.l	d5,d0
	beq.s	$0000da66
	move.b	(a0)+,(a3)+
	subq.l	#1,d5
	bne.s	$0000da60
	rts

L00da68:
	movea.l	a0,a1
	move.l	(-$0010,a0),d3
	move.l	(-$000c,a0),d2
	move.l	(-$0008,a0),d1
	add.l	d2,d1
	move.l	d4,d6
	add.l	d5,d6
	move.l	(-$0004,a0),d0
	beq.s	$0000da9e
	sub.l	#$00000010,d0
	cmp.l	(L013d0a),d0
	beq.s	$0000da9e
	cmp.l	d2,d4
	bcc.s	$0000da9a
	cmp.l	d6,d2
	bcs.s	L00daa8
	bra.s	$0000da9e

	cmp.l	d1,d4
	bcs.s	L00daa8
	adda.l	d4,a0
	sub.l	d4,d3
	bcs.s	L00daa8
	clr.l	d0
	rts

L00daa8:
	moveq.l	#$f2,d0
	rts

L00daac:
	bsr.w	L00dbd2
	bmi.w	L00db42
	bsr.s	L00da68
	bmi.s	$0000db0a
	tst.l	d5
	beq.s	L00db10
	cmp.l	d5,d3
	bcc.s	$0000db02
	move.l	d5,d0
	sub.l	d3,d0
	move.l	(-$0010,a1),d1
	add.l	d0,d1
	add.l	#$0000001d,d1
	bclr.l	#$00,d1
	move.l	d1,d2
	sub.l	(-$0020,a1),d2
	movea.l	($1c48),a4
	movea.l	a4,a5
	adda.l	d2,a5
	move.l	($1c4c),d3
	cmp.l	a5,d3
	bcs.s	L00db0c
	move.l	a5,($1c48)
	move.l	d1,(-$0020,a1)
	add.l	d0,(-$0010,a1)
	move.l	a4,d0
	sub.l	a0,d0
	beq.s	$0000db02
	move.b	-(a4),-(a5)
	subq.l	#1,d0
	bne.s	$0000dafc
	move.l	d5,d0
	move.b	(a3)+,(a0)+
	subq.l	#1,d5
	bne.s	$0000db04
	rts

L00db0c:
	moveq.l	#$f8,d0
	rts

L00db10:
	move.l	d4,(-$0010,a1)
	moveq.l	#$1d,d0
	add.l	d4,d0
	bclr.l	#$00,d0
	move.l	(-$0020,a1),d1
	move.l	d0,(-$0020,a1)
	sub.l	d0,d1
	beq.s	$0000db3e
	move.l	($1c48),d0
	sub.l	d1,($1c48)
	movea.l	a0,a1
	adda.l	d1,a0
	sub.l	a0,d0
	beq.s	$0000db3e
	move.b	(a0)+,(a1)+
	subq.l	#1,d0
	bne.s	$0000db38
	clr.l	d0
	rts

L00db42:
	tst.l	d4
	bne.s	L00db8c
	moveq.l	#$21,d0			;'!'
	add.l	d5,d0
	bclr.l	#$00,d0
	movea.l	($1c48),a0
	movea.l	a0,a1
	adda.l	d0,a1
	move.l	($1c4c),d1
	cmp.l	a1,d1
	bcs.s	L00db0c
	move.l	a1,($1c48)
	subq.l	#4,d0
	move.l	d0,(a0)+
	moveq.l	#$0b,d1
	move.b	(a2)+,(a0)+
	dbeq.w	d1,$0000db68
	beq.s	$0000db74
	bra.s	$0000db78

	clr.b	(a0)+
	dbra.w	d1,$0000db72
	move.l	d5,(a0)+
	clr.l	(a0)+
	clr.l	(a0)+
	clr.l	(a0)+
	move.l	d5,d0
	beq.s	$0000db8a
	move.b	(a3)+,(a0)+
	subq.l	#1,d5
	bne.s	$0000db84
	rts

L00db8c:
	moveq.l	#$f2,d0
	rts

L00db90:
	bsr.s	L00dbd2
	bmi.s	$0000db98
	move.l	(-$0010,a0),d0
	rts

L00db9a:
	bsr.s	L00dbd2
	bmi.s	$0000dbd0
	move.l	(-$0004,a0),d0
	beq.s	L00dbb0
	cmp.l	(L013d0a),d0
	beq.s	L00dbb0
	moveq.l	#$f2,d0
	rts

L00dbb0:
	lea.l	(-$0020,a0),a1
	move.l	(a1),d1
	addq.l	#4,d1
	lea.l	(a1,d1.l),a2
	move.l	($1c48),d2
	sub.l	d1,($1c48)
	clr.l	d0
	sub.l	a2,d2
	beq.s	$0000dbd0
	move.b	(a2)+,(a1)+
	subq.l	#1,d2
	bne.s	$0000dbca
	rts

L00dbd2:
	move.l	($1c44),d7
	beq.s	L00dbfe
	move.l	($1c48),d6
	cmp.l	d6,d7
	beq.s	L00dbfa
	movea.l	d7,a0
	move.l	(a0)+,d7
	add.l	a0,d7
	lea.l	(a0),a4
	movea.l	a2,a5
	moveq.l	#$0b,d0
	bsr.w	L00e7ee
	bne.s	$0000dbdc
	lea.l	($001c,a0),a0
	clr.l	d0
	rts

L00dbfa:
	moveq.l	#$fe,d0
	rts

L00dbfe:
	moveq.l	#$ff,d0
	rts

L00dc02:
	move.l	($1c40),d0
	beq.s	$0000dc1e
	bsr.w	L00dd4a
	beq.s	$0000dc1e
	movem.l	a0,-(sp)
	movea.l	d0,a0
	moveq.l	#$03,d0
	bsr.w	L00dd7e
	movem.l	(sp)+,a0
	rts

L00dc20:
	movem.l	a0,-(sp)
	clr.l	($000a,a3)
	move.l	($1c40),d0
	beq.s	L00dc46
	bsr.w	L00dd4a
	beq.s	$0000dc54
	movea.l	d0,a0
	move.b	($000e,a3),d0
	bsr.w	L00dd7e
	bpl.s	$0000dc8a
	movem.l	(sp)+,a0
	rts

L00dc46:
	move.b	($000e,a3),d0
	and.w	#$00f0,d0
	beq.s	$0000dc40
	moveq.l	#$f4,d0
	bra.s	$0000dc40

	movea.l	($1c40),a0
	move.w	($1c76),d0
	subq.w	#1,d0
	bmi.s	$0000dcb2
	tst.b	(a0)
	beq.s	$0000dc6e
	adda.l	($1c7a),a0
	dbra.w	d0,$0000dc60
	bra.s	$0000dcb2

	movem.l	a1-a2,-(sp)
	movea.l	a0,a1
	clr.w	d0
	move.b	($000e,a3),d0
	move.w	d0,(a1)+
	clr.w	(a1)+
	moveq.l	#$15,d0
	move.l	(a2)+,(a1)+
	dbra.w	d0,$0000dc80
	movem.l	(sp)+,a1-a2
	move.w	($0002,a0),d0
	cmp.w	($1c78),d0
	bcc.s	$0000dcb2
	addq.b	#1,(a0)
	move.l	a0,($000a,a3)
	addq.w	#1,($0002,a0)
	mulu.w	#$000c,d0
	lea.l	($5c,a0,d0.l),a0
	moveq.l	#$ff,d0
	move.l	d0,(a0)+
	clr.l	(a0)+
	move.l	a3,(a0)
	clr.l	d0
	bra.s	$0000dc40

	moveq.l	#$e0,d0
	bra.s	$0000dc40

	move.l	($000a,a0),d0
	beq.s	$0000dcf8
	movem.l	d1-d3/a1,-(sp)
	movea.l	d0,a1
	move.w	($0002,a1),d3
	beq.s	$0000dcf2
	subq.w	#1,d3
	lea.l	($005c,a1),a1
	move.l	($0006,a0),d1
	add.l	d1,d2
	cmpa.l	($0008,a1),a0
	beq.s	$0000dcea
	move.l	(a1),d0
	bmi.s	$0000dcea
	cmp.l	d2,d0
	bcc.s	$0000dcea
	add.l	($0004,a1),d0
	cmp.l	d0,d1
	bcs.s	L00dcfa
	lea.l	($000c,a1),a1
	dbra.w	d3,$0000dcd4
	movem.l	(sp)+,d1-d3/a1
	clr.l	d0
	rts

L00dcfa:
	movem.l	(sp)+,d1-d3/a1
	moveq.l	#$df,d0
	rts

L00dd02:
	move.l	($000a,a0),d0
	beq.s	$0000dd48
	movem.l	d1/a1-a3,-(sp)
	movea.l	d0,a1
	subq.b	#1,(a1)
	beq.s	$0000dd3e
	move.w	($0002,a1),d0
	beq.s	$0000dd3e
	subq.w	#1,d0
	lea.l	($005c,a1),a2
	movea.l	a2,a3
	clr.l	d1
	cmpa.l	($0008,a2),a0
	beq.s	$0000dd32
	move.l	(a2)+,(a3)+
	move.l	(a2)+,(a3)+
	move.l	(a2),(a3)+
	subq.l	#8,a2
	addq.w	#1,d1
	lea.l	($000c,a2),a2
	dbra.w	d0,$0000dd22
	move.w	d1,($0002,a1)
	clr.l	($000a,a0)
	clr.l	d0
	movem.l	(sp)+,d1/a1-a3
	rts

L00dd4a:
	movem.l	d1-d4/a0/a3,-(sp)
	movea.l	($1c40),a0
	move.w	($1c76),d3
	beq.s	$0000dd76
	move.l	($1c7a),d4
	subq.w	#1,d3
	tst.b	(a0)
	beq.s	$0000dd70
	lea.l	($0004,a0),a3
	bsr.w	L00f266
	bne.s	$0000dd70
	move.l	a0,d0
	bra.s	$0000dd78

	adda.l	d4,a0
	dbra.w	d3,$0000dd5e
	clr.l	d0
	movem.l	(sp)+,d1-d4/a0/a3
	rts

L00dd7e:
	movem.l	d1/a1,-(sp)
	move.b	($0001,a0),d1
	rol.w	#4,d0
	rol.w	#4,d1
	lsl.b	#2,d0
	lsl.b	#2,d1
	ror.w	#6,d0
	ror.w	#4,d1
	and.w	#$001f,d0
	and.w	#$007c,d1
	lea.l	(L00ddb8),a1
	move.l	(a1,d1.w),d1
	btst.l	d0,d1
	beq.s	L00ddb0
	movem.l	(sp)+,d1/a1
	clr.l	d0
	rts

L00ddb0:
	movem.l	(sp)+,d1/a1
	moveq.l	#$df,d0
	rts

L00ddb8:
	.dc.l	$00000001,$00000000
	.dc.l	$00000000,$00000000
	.dc.l	$00000000,$00000000
	.dc.l	$00000000,$00000000
	.dc.l	$00010100,$00011000
	.dc.l	$00010000,$00011000
	.dc.l	$000a0200,$000aa000
	.dc.l	$000a0000,$000aa000
	.dc.l	$000f0f00,$000ff000
	.dc.l	$000f0000,$000ff000
Call_LOCK:
	move.w	(a6)+,d7
	move.w	(a6)+,d0
	bsr.w	L00a9d8
	tst.l	d0
	bmi.s	$0000de84
	move.l	(a6)+,d6
	move.l	(a6),d5
	btst.b	#$07,($0001,a0)
	bne.s	L00de82
	move.l	($000a,a0),d0
	beq.s	L00de82
	movea.l	d0,a5
	bsr.w	L00dedc
	bmi.s	$0000de84
	tst.w	d7
	beq.s	L00de86
	move.w	($0002,a5),d1
	beq.s	$0000de54
	lea.l	($005c,a5),a1
	cmp.l	(a1),d6
	bne.s	$0000de4c
	cmp.l	($0004,a1),d5
	bne.s	$0000de4c
	cmpa.l	($0008,a1),a0
	beq.s	L00de58
	lea.l	($000c,a1),a1
	subq.w	#1,d1
	bne.s	$0000de3c
	moveq.l	#$df,d0
	rts

L00de58:
	lea.l	($005c,a5),a2
	clr.l	d1
	move.w	($0002,a5),d1
	lsl.l	#2,d1
	move.l	d1,d0
	add.l	d1,d1
	add.l	d0,d1
	add.l	a2,d1
	sub.l	a1,d1
	beq.s	$0000de7a
	lea.l	($000c,a1),a2
	move.b	(a2)+,(a1)+
	subq.l	#1,d1
	bne.s	$0000de74
	subq.w	#1,($0002,a5)
	clr.l	d0
	rts

L00de82:
	moveq.l	#$f2,d0
	rts

L00de86:
	move.w	($0002,a5),d3
	beq.s	$0000deae
	subq.w	#1,d3
	lea.l	($005c,a5),a1
	move.l	d5,d2
	add.l	d6,d2
	move.l	(a1),d0
	bmi.s	$0000dea6
	cmp.l	d2,d0
	bcc.s	$0000dea6
	add.l	($0004,a1),d0
	cmp.l	d0,d6
	bcs.s	L00ded8
	lea.l	($000c,a1),a1
	dbra.w	d3,$0000de96
	lea.l	($005c,a5),a1
	clr.l	d1
	move.w	($0002,a5),d1
	move.w	($1c78),d0
	cmp.w	d0,d1
	bcc.s	L00de82
	addq.w	#1,($0002,a5)
	lsl.l	#2,d1
	move.l	d1,d0
	add.l	d1,d1
	add.l	d0,d1
	adda.l	d1,a1
	move.l	d6,(a1)+
	move.l	d5,(a1)+
	move.l	a0,(a1)
	clr.l	d0
	rts

L00ded8:
	moveq.l	#$df,d0
	rts

L00dedc:
	movem.l	d5-d7/a0/a5,-(sp)
	movea.l	($0002,a0),a1
	clr.l	d0
	move.w	($000a,a1),d0
	tst.l	d0
	bne.s	$0000def2
	bsr.w	$0000d82a
	movem.l	(sp)+,d5-d7/a0/a5
	rts

Call_CHANGE_KILL_OPEN_PR:
	rts

L00defa:
	cmpi.b	#$01,($0cbc)
	bls.s	L00df42
	movem.l	d1-d3,-(sp)
	moveq.l	#$ac,d0
	moveq.l	#$01,d1
	trap	#15
	move.l	d0,d3
	move.l	d0,d2
	and.l	#$00000001,d2
	moveq.l	#$ac,d0
	moveq.l	#$04,d1
	trap	#15
	move.l	d3,d0
	movem.l	(sp)+,d1-d3
	move.l	d0,-(sp)
	bsr.s	L00df42
	move.l	(sp)+,d0
	movem.l	d1-d2,-(sp)
	move.l	d0,-(sp)
	moveq.l	#$ac,d0
	moveq.l	#$03,d1
	trap	#15
	move.l	(sp)+,d2
	moveq.l	#$ac,d0
	moveq.l	#$04,d1
	trap	#15
	movem.l	(sp)+,d1-d2
	rts

L00df42:
	movea.l	($0006,a1),a4
	jsr	(a4)
	movea.l	($000a,a1),a4
	jsr	(a4)
	rts

Call_S_MALLOC:
	movea.l	($1c50),a0
	cmpa.l	($1c54),a0
	beq.w	Call_MALLOC2
	move.l	($0074,a0),d3
	move.l	($0078,a0),d5
	move.w	(a6)+,d4
	cmp.b	#$03,d4
	bcs.w	$000090e8
	moveq.l	#$f2,d0
	rts

Call_S_MFREE:
	movea.l	($1c50),a0
	movea.l	($1c54),a1
	cmpa.l	a1,a0
	beq.w	Call_MFREE
	move.l	($0074,a0),d1
	move.l	(a6),d2
	move.l	($0074,a1),d0
	cmp.l	d2,d0
	bne.w	$00009274
	move.l	d1,($1c04)
	move.l	($0078,a0),($1c00)
	movea.l	d2,a0
	movea.l	(-$0010,a0),a1
	movea.l	(-$0004,a0),a2
	move.l	a1,(a0)
	clr.b	(-$000c,a0)
	move.l	(-$000c,a0),($0004,a0)
	move.l	($000c,a0),d0
	beq.s	$0000dfba
	movea.l	d0,a0
	bra.s	$0000dfb0

	move.l	a2,($000c,a0)
	addq.l	#4,sp
	movem.l	(sp)+,d1-d7/a0-a4
	bra.w	$0000e60c

Call_S_PROCESS:
	moveq.l	#$ff,d0
	move.w	($1c58),d0
	beq.s	$0000e016
	clr.l	d1
	move.w	(a6)+,d1
	cmp.w	d1,d0
	bcs.s	$0000e016
	moveq.l	#$7c,d2			;'|'
	mulu.w	d2,d1
	movea.l	($1c50),a5
	adda.l	d1,a5
	tst.l	($0008,a5)
	beq.s	$0000e016
	movea.l	(a6)+,a0
	move.l	(a6)+,d1
	move.l	(a6),d2
	add.l	#$00000010,d2
	moveq.l	#$f2,d0
	cmp.l	d1,d2
	bcc.s	$0000e016
	add.l	a0,d1
	move.l	a0,($0074,a5)
	move.l	d1,($0078,a5)
	add.l	a0,d2
	move.b	#$fd,(-$000c,a0)
	clr.l	(a0)+
	clr.l	(a0)+
	move.l	d2,(a0)+
	clr.l	(a0)+
	move.l	a0,d0
	rts

L00e018:
	addq.l	#1,(L00e788)
	subq.b	#1,(L00e790)
	bne.s	$0000e04e
	move.b	(L00e791),(L00e790)
L00e030:
	movem.l	d0-d2/a5-a6,-(sp)
L00e034:
	bsr.w	$0000e216
	movem.l	(sp)+,d0-d2
	btst.b	#$05,($0008,sp)
	beq.s	$0000e05a
	move.b	#$01,($1c14)
	movem.l	(sp)+,a5-a6
	rte

	tst.w	($1c08)
	bne.s	$0000e04e
	movem.l	a5-a6,-(sp)
	lea.l	($000e,sp),a6
	tst.b	($0cbc)
	beq.s	$0000e066
	addq.l	#2,a6
	clr.b	($1c14)
	movea.l	($1c54),a5
	clr.b	(L00e782)
	move.l	($007c),(L00e784)
	move.l	#L00e204,($007c)
	ori.w	#$0700,sr
	cmpa.l	($1c50),a5
	bne.s	$0000e09a
	move.l	($1c04),($0074,a5)
	move.l	($1c00),($0078,a5)
	lea.l	($0058,a5),a5
	move.l	($1c5c),(a5)
	move.w	($1c08),-(a5)
	move.l	a6,-(a5)
	tst.b	($0cbc)
	beq.s	$0000e0b0
	subq.l	#2,a6
	move.l	-(a6),-(a5)
	move.w	-(a6),-(a5)
	move.l	-(a6),-(a5)
	move.l	-(a6),-(a5)
	movem.l	d0-d7/a0-a4,-(a5)
	move.l	usp,a0
	move.l	a0,-(a5)
	movea.l	(L013d0a),a0
	move.l	a0,-(a5)
	lea.l	($1bc0),a1
	lea.l	($0014,a0),a2
	move.l	(a1)+,(a2)+
	move.l	(a1)+,(a2)+
	move.l	(a1)+,(a2)+
	lea.l	($0046,a0),a2
	move.w	($1c60),(a2)+
	move.l	($1c62),(a2)+
	lea.l	($00a8),a1
	move.l	(a1)+,(a2)+
	move.l	(a1)+,(a2)+
	move.l	(a1)+,(a2)+
	move.l	(a1)+,(a2)+
	move.l	(a1)+,(a2)+
	move.b	($1c0a),-(a5)
	subq.l	#3,a5
	move.l	-(a5),d0
	tst.w	($1c5a)
	bne.s	$0000e10c
	move.b	($0006,a5),($0005,a5)
	lea.l	($0010,a5),a5
	bra.w	$0000e1d2

	movea.l	d0,a5
	move.w	($1c58),d7
	move.l	d7,d2
	move.w	#$0100,d6
	suba.l	a1,a1
	move.w	($0004,a5),d0
	beq.s	$0000e14a
	cmp.w	d6,d0
	bcc.s	$0000e128
	move.w	d0,d6
	movea.l	a5,a1
	movea.l	(a5),a5
	dbra.w	d7,$0000e11a
	tst.b	d6
	beq.s	$0000e146
	moveq.l	#$7c,d1			;'|'
	movea.l	($1c50),a0
	addq.l	#5,a0
	sub.b	d6,(a0)
	adda.l	d1,a0
	dbra.w	d2,$0000e13a
	movea.l	a1,a5
	bra.s	$0000e14a

	movea.l	($1c50),a5
	move.l	a5,($1c54)
	ori.w	#$0700,sr
	move.l	($0074,a5),($1c04)
	move.l	($0078,a5),($1c00)
	lea.l	($0058,a5),a6
	move.l	(a6),($1c5c)
	move.w	-(a6),($1c08)
	movea.l	-(a6),sp
	tst.b	($0cbc)
	beq.s	$0000e176
	move.w	#$0000,-(sp)
	move.l	-(a6),-(sp)
	move.w	-(a6),-(sp)
	move.l	-(a6),-(sp)
	move.l	-(a6),-(sp)
	move.b	($0006,a5),($0005,a5)
	move.b	($0007,a5),($1c0a)
	addq.l	#8,a5
	movea.l	(a5)+,a0
	move.l	a0,(L013d0a)
	lea.l	($1bc0),a2
	lea.l	($0014,a0),a1
	move.l	(a1)+,(a2)+
	move.l	(a1)+,(a2)+
	move.l	(a1)+,(a2)+
	lea.l	($0046,a0),a1
	move.w	(a1)+,($1c60)
	move.l	(a1)+,($1c62)
	lea.l	($00a8),a2
	move.l	(a1)+,(a2)+
	move.l	(a1)+,(a2)+
	move.l	(a1)+,(a2)+
	move.l	(a1)+,(a2)+
	move.l	(a1)+,(a2)+
	movea.l	(a5)+,a0
	move.l	a0,usp
	move.l	($1c54),d0
	sub.l	($1c50),d0
	divu.w	#$007c,d0
	movea.l	($1bfc),a0
	jsr	(a0)
	bsr.s	$0000e216
	move.b	(L00e791),(L00e790)
	movem.l	(a5)+,d0-d7/a0-a4
	movem.l	(sp)+,a5-a6
	move.l	(L00e784),($007c)
	tst.b	(L00e782)
	beq.w	$00008616
	clr.b	(L00e782)
	move.l	($007c),-(sp)
	rts

L00e204:
	move.b	#$01,(L00e782)
L00e20c:
	move.b	#$0c,($00e8e007)
	rte

	movea.l	($1c50),a6
	move.w	($1c58),d2
	move.l	(L00e788),d1
	move.l	(L00e78c),d0
	move.l	d1,(L00e78c)
L00e230:
	sub.l	d0,d1
	lea.l	($0070,a6),a6
	move.l	(a6),d0
	beq.s	$0000e254
	sub.l	d1,d0
	bhi.s	$0000e252
	moveq.l	#$ff,d0
	move.b	(-$006c,a6),d0
	move.l	d0,(-$0060,a6)
	addq.l	#2,d0
	beq.s	$0000e252
	clr.l	d0
	move.w	d0,(-$006c,a6)
	move.l	d0,(a6)
	lea.l	($007c,a6),a6
	dbra.w	d2,$0000e236
	rts

L00e25e:
	btst.b	#$05,($000c,sp)
	bne.s	$0000e268
	move.l	usp,a6
	cmp.w	#$fff6,d0
	beq.w	$0000e306
	addq.l	#4,sp
	bcs.w	L00e2fe
	movem.l	d1/a0-a1,-(sp)
	movea.l	(a6)+,a0
	movea.l	(a6)+,a1
	move.w	(a6),d1
	bsr.s	L00e28a
	movem.l	(sp)+,d1/a0-a1
	bra.w	$0000e368

L00e28a:
	move.w	sr,-(sp)
	ori.w	#$0700,sr
	movea.l	sp,a6
	movea.l	($0008),a5
	moveq.l	#$02,d0
	move.l	#L00e2bc,($0008)
	cmp.w	#$0001,d1
	beq.s	L00e2c0
	cmp.w	#$0002,d1
	beq.s	L00e2ca
	cmp.w	#$0004,d1
	beq.s	L00e2e4
L00e2b2:
	moveq.l	#$ff,d0
L00e2b4:
	move.l	a5,($0008)
	move.w	(sp)+,sr
	rts

L00e2bc:
	movea.l	a6,sp
	bra.s	L00e2b4

L00e2c0:
	move.b	(a0),d1
	subq.l	#1,d0
	move.b	d1,(a1)
	clr.l	d0
	bra.s	L00e2b4

L00e2ca:
	move.l	a0,d1
	btst.l	#$00,d1
	bne.s	L00e2b2
	move.l	a1,d1
	btst.l	#$00,d1
	bne.s	L00e2b2
	move.w	(a0),d1
	subq.l	#1,d0
	move.w	d1,(a1)
	clr.l	d0
	bra.s	L00e2b4

L00e2e4:
	move.l	a0,d1
	btst.l	#$00,d1
	bne.s	L00e2b2
	move.l	a1,d1
	btst.l	#$00,d1
	bne.s	L00e2b2
	move.l	(a0),d1
	subq.l	#1,d0
	move.l	d1,(a1)
	clr.l	d0
	bra.s	L00e2b4

L00e2fe:
	move.l	#$00001c08,d0
	bra.s	$0000e368

	movea.l	(a6),a6
	movem.l	(sp)+,d0/a5
	move.l	a6,-(sp)
	movea.l	($0004,sp),a6
	move.l	#L00e36c,($0004,sp)
	rts

L00e31c:
	cmp.w	#$fff8,d0
	bcs.w	L00e25e
	addq.l	#4,sp
	tst.l	($1c54)
	beq.s	$0000e362
	cmp.w	#$fffe,d0
	beq.s	$0000e37a
	bcc.w	$0000e066
	movea.l	a6,a5
	btst.b	#$05,($0008,sp)
	bne.s	$0000e342
	move.l	usp,a5
	cmp.w	#$fffc,d0
	beq.s	$0000e382
	bcc.s	$0000e3a8
	cmp.w	#$fffa,d0
	beq.w	$0000e436
	bcc.w	$0000e4d8
	cmp.w	#$fff8,d0
	beq.w	$0000e51c
	bra.w	$0000e60c

	moveq.l	#$ff,d0
	bra.s	$0000e368

	move.l	(sp)+,d1
	movem.l	(sp)+,a5-a6
L00e36c:
	btst.b	#$07,(sp)
	bne.s	$0000e374
	rte

	ori.w	#$8000,sr
	rte

	move.l	(L00e788),d0
	bra.s	$0000e368

	move.l	(a5),d0
	movea.l	($1c54),a5
	movea.l	($005c,a5),a5
	cmpi.w	#$ffff,($000a,a5)
	bne.s	$0000e368
	movea.l	($1c54),a5
	move.b	#$ff,($0004,a5)
	move.l	d0,($0070,a5)
	clr.l	d0
	bra.w	$0000e06e

	movem.l	d1-d2/a4,-(sp)
	move.w	(a5)+,d2
	moveq.l	#$ff,d0
	move.w	($1c58),d0
	bcs.s	$0000e42e
	clr.l	d1
	move.w	(a5)+,d1
	cmp.w	d1,d0
	bcs.s	$0000e42e
	movea.l	($1c50),a6
	mulu.w	#$007c,d1
	adda.l	d1,a6
	tst.l	($0008,a6)
	beq.s	$0000e42e
	swap.w	d2
	move.w	(a5)+,d2
	movea.l	(a5)+,a4
	move.l	(a5),d1
	cmp.w	#$fffb,d2
	beq.s	$0000e40c
	movea.l	($005c,a6),a5
	moveq.l	#$e4,d0
	cmpi.w	#$ffff,($000a,a5)
	bne.s	$0000e42e
	move.l	(a5),d0
	cmp.l	d1,d0
	bcs.s	$0000e42a
	movem.l	a5,-(sp)
	move.l	d1,(a5)+
	tst.l	d1
	beq.s	$0000e402
	movea.l	(a5),a5
	move.b	(a4)+,(a5)+
	subq.l	#1,d1
	bne.s	$0000e3fc
	movem.l	(sp)+,a5
	swap.w	d2
	move.l	d2,($0008,a5)
	move.b	($0004,a6),d0
	beq.s	$0000e426
	cmp.b	#$ff,d0
	bne.s	$0000e41e
	move.l	($0070,a6),($0010,a6)
	clr.l	($0070,a6)
	clr.w	($0004,a6)
	clr.l	d0
	bra.s	$0000e42e

	bset.l	#$1f,d0
	movem.l	(sp)+,d1-d2/a4
	bra.w	$0000e368

	movem.l	d1-d2,-(sp)
	moveq.l	#$ff,d0
	move.w	($1c58),d0
	beq.s	$0000e478
	clr.l	d1
	move.w	(a5)+,d1
	cmp.w	#$ffff,d1
	beq.s	$0000e492
	cmp.w	#$fffe,d1
	beq.s	$0000e480
	cmp.w	d1,d0
	bcs.s	$0000e478
	moveq.l	#$7c,d2			;'|'
	mulu.w	d2,d1
	movea.l	($1c50),a6
	adda.l	d1,a6
	tst.l	($0008,a6)
	beq.s	$0000e478
	clr.l	d0
	move.w	(-$0002,a5),d0
	movea.l	(a5),a5
	sub.w	#$0009,d2
	move.b	(a6)+,(a5)+
	dbra.w	d2,$0000e472
	movem.l	(sp)+,d1-d2
	bra.w	$0000e368

	move.l	($1c54),d0
	movea.l	d0,a6
	sub.l	($1c50),d0
	moveq.l	#$7c,d2			;'|'
	divu.w	d2,d0
	movea.l	(a5),a5
	bra.s	$0000e46e

	movea.l	($1c50),a6
	movea.l	(a5),a5
	move.w	($1c58),d1
	clr.l	d2
	movem.l	a5-a6,-(sp)
	tst.l	($0008,a6)
	beq.s	$0000e4b8
	lea.l	($0060,a5),a5
	lea.l	($0060,a6),a6
	move.b	(a6)+,d0
	beq.s	$0000e4ca
	cmp.b	(a5)+,d0
	beq.s	$0000e4b0
	movem.l	(sp)+,a5-a6
	lea.l	($007c,a6),a6
	addq.w	#1,d2
	dbra.w	d1,$0000e49e
	moveq.l	#$ff,d0
	bra.s	$0000e478

	tst.b	(a5)
	bne.s	$0000e4b8
	movem.l	(sp)+,a5-a6
	move.l	d2,d0
	moveq.l	#$7c,d2			;'|'
	bra.s	$0000e46e

	moveq.l	#$ff,d0
	move.w	($1c58),d0
	beq.w	$0000e368
	move.l	d1,-(sp)
	clr.l	d1
	move.w	(a5)+,d1
	cmp.w	d1,d0
	bcs.w	$0000e366
	movea.l	($1c50),a5
	mulu.w	#$007c,d1
	adda.l	d1,a5
	movem.l	(sp)+,d1
	cmpa.l	($1c54),a5
	beq.s	$0000e516
	tst.l	($0008,a5)
	beq.w	$0000e368
	move.b	#$fe,($0004,a5)
	clr.l	d0
	bra.w	$0000e368

	moveq.l	#$ff,d0
	bra.w	$0000e368

	movem.l	d1-d2/d4-d6/a0-a2/a4,-(sp)
	movea.l	a5,a6
	movea.l	(a6)+,a4
	tst.b	(a6)
	bne.w	$0000e5fe
	movea.l	($1c50),a2
	move.w	($1c58),d4
	beq.w	$0000e602
	cmp.w	($1c5a),d4
	beq.w	$0000e602
	clr.l	d5
	clr.l	d6
	move.w	d4,d6
	move.l	($0008,a2),d0
	beq.s	$0000e56a
	lea.l	($0060,a2),a0
	movea.l	a4,a1
	moveq.l	#$0f,d1
	move.b	(a0)+,d0
	beq.s	$0000e564
	cmp.b	(a1)+,d0
	dbne.w	d1,$0000e552
	bne.s	$0000e572
	moveq.l	#$e5,d0
	bra.w	$0000e604

	cmp.b	(a1)+,d0
	beq.s	$0000e55e
	bra.s	$0000e572

	tst.l	d5
	bne.s	$0000e572
	move.l	a2,d5
	sub.w	d4,d6
	movea.l	(a2),a2
	dbra.w	d4,$0000e544
	tst.l	d5
	beq.w	$0000e602
	movea.l	d5,a5
	move.l	($1c04),($0074,a5)
	move.l	($1c00),($0078,a5)
	lea.l	($0060,a5),a0
	moveq.l	#$0e,d0
	move.b	(a4)+,(a0)+
	dbra.w	d0,$0000e592
	clr.b	(a0)
	move.l	($0014,a6),($0070,a5)
	addq.l	#4,a5
	move.w	#$ffff,(a5)+
	move.w	(a6)+,d0
	beq.s	$0000e5ae
	subq.w	#1,d0
	bne.s	$0000e5b0
	moveq.l	#$01,d0
	move.b	d0,(a5)+
	clr.b	(a5)+
	move.l	(L013d0a),(a5)+
	move.l	(a6)+,(a5)+
	clr.l	(a5)+
	clr.l	(a5)+
	clr.l	(a5)+
	clr.l	(a5)+
	clr.l	(a5)+
	clr.l	(a5)+
	clr.l	(a5)+
	clr.l	(a5)+
	clr.l	(a5)+
	clr.l	(a5)+
	clr.l	(a5)+
	clr.l	(a5)+
	clr.l	(a5)+
	clr.l	(a5)+
	clr.l	(a5)+
	move.w	($0004,a6),(a5)
	andi.w	#$201f,(a5)+
	move.l	($0006,a6),(a5)+
	move.l	(a6),(a5)+
	clr.w	(a5)+
	clr.l	(a5)+
	move.l	($000a,a6),(a5)
	addq.w	#1,($1c5a)
	move.l	d6,d0
	movea.l	($1be0),a0
	jsr	(a0)
	bra.s	$0000e604

	moveq.l	#$f2,d0
	bra.s	$0000e604

	moveq.l	#$e3,d0
	movem.l	(sp)+,d1-d2/d4-d6/a0-a2/a4
	bra.w	$0000e368

	bsr.s	$0000e640
	bsr.w	Call_ALLCLOSE
	movea.l	(L013d0a),a0
	bsr.w	L0092b8
	movea.l	($1c54),a5
	movea.l	(a5),a5
	clr.b	(L00e782)
	move.l	($007c),(L00e784)
	move.l	#L00e204,($007c)
	ori.w	#$0700,sr
	bra.w	$0000e10e

	movea.l	($1be4),a5
	movea.l	(L013d0a),a0
	movea.l	($1c50),a1
	move.w	($1c58),d1
	clr.l	d0
	lea.l	($007c,a1),a1
	subq.w	#1,d1
	bcs.s	$0000e68a
	cmpa.l	($0008,a1),a0
	bne.s	$0000e654
	move.l	#$ffffffff,($0004,a1)
	clr.l	($0070,a1)
	clr.l	($0008,a1)
	subq.w	#1,($1c5a)
	jsr	(a5)
	addq.l	#1,d0
	lea.l	($007c,a1),a1
	subq.w	#1,d1
	bcs.s	$0000e68a
	cmpa.l	($0008,a1),a0
	bne.s	$0000e678
	bra.s	$0000e662

	rts

L00e68c:
	clr.b	($1c0a)
	cmp.w	#$0002,d1
	bcs.w	L00e770
	cmp.w	#$0021,d1		;'!'
	bcc.w	L00e770
	subq.w	#1,d1
	move.w	d1,($1c58)
	clr.w	($1c5a)
	movea.l	($1c24),a0
	move.l	a0,($1c50)
	move.l	a0,($1c54)
L00e6b6:
	movea.l	a0,a1
	moveq.l	#$7b,d0			;'{'
L00e6ba:
	clr.b	(a0)+
	dbra.w	d0,L00e6ba
	move.l	a0,(a1)+
	move.l	#$ffffffff,(a1)
	dbra.w	d1,L00e6b6
	move.l	a0,($1c24)
	movea.l	($1c50),a0
	move.l	a0,-(a1)
	clr.w	($0004,a0)
	move.b	d3,($0006,a0)
	move.l	(L013d0a),($0008,a0)
	move.l	#L00e792,($005c,a0)
	move.l	#$000067f2,($0052,a0)
	move.l	#$00100000,($000c,a0)
	move.l	($1c04),($0074,a0)
	move.l	($1c00),($0078,a0)
	lea.l	($0060,a0),a1
	lea.l	(L00e7a6),a0
	moveq.l	#$0f,d0
L00e716:
	move.b	(a0)+,(a1)+
	dbra.w	d0,L00e716
	clr.l	(a1)
	suba.l	a1,a1
	IOCS	_TIMERDST
	move.b	d2,(L00e790)
	move.b	d2,(L00e791)
	move.w	#$0714,d1
	lea.l	(L00e018),a1
	IOCS	_TIMERDST
	tst.l	d0
	bne.s	L00e76a
	cmpi.w	#$00ff,($007c)
	bne.s	L00e752
	move.l	#L00e20c,($007c)
L00e752:
	lea.l	(L00e762),a1
	move.w	#$016b,d1
	IOCS	_B_INTVCS
	rts

L00e762:
	.dc.b	$20,$3c
	.dc.l	L00e018
	.dc.b	$4e,$75
L00e76a:
	move.l	($1c50),($1c24)
L00e770:
	clr.w	($1c58)
	clr.w	($1c5a)
	clr.l	($1c50)
	clr.l	($1c54)
	rts

L00e782:
	.dc.b	$00,$00
L00e784:
	.dc.l	$00000000
L00e788:
	.dc.l	$00000000
L00e78c:
	.dc.l	$00000000
L00e790:
	.dc.b	$00
L00e791:
	.dc.b	$14
L00e792:
	.dc.l	$00000010,$00000000
	.dc.l	$00000000,$00000000
	.dc.l	$00000000
L00e7a6:
	.dc.b	'Human68k system',$00
L00e7b6:
	movem.l	d1-d3/a1/a4-a5,-(sp)
	movea.l	#L00fa50,a1
	moveq.l	#$ff,d3
L00e7c2:
	btst.b	#$07,($0004,a1)
	beq.s	L00e7dc
	lea.l	($000e,a1),a4
	movea.l	a0,a5
	move.w	#$0007,d0
	bsr.w	L00e7ee
	bne.s	L00e7dc
	move.l	a1,d3
L00e7dc:
	movea.l	(a1),a1
	cmpa.l	#$ffffffff,a1
	bne.s	L00e7c2
	move.l	d3,d0
	movem.l	(sp)+,d1-d3/a1/a4-a5
	rts

L00e7ee:
	move.b	(a5)+,d2
	move.b	(a4)+,d1
	beq.s	L00e836
	cmp.b	#$41,d1			;'A'
	bcs.s	L00e82a
	cmp.b	#$5b,d1			;'['
	bcs.s	L00e83c
	cmp.b	#$61,d1			;'a'
	bcs.s	L00e82a
	cmp.b	#$7b,d1			;'{'
	bcs.s	L00e842
	cmp.b	#$80,d1
	bcs.s	L00e82a
	cmp.b	#$a0,d1
	bcs.s	L00e81e
	cmp.b	#$e0,d1
	bcs.s	L00e82a
L00e81e:
	cmp.b	d1,d2
	bne.s	L00e834
	subq.w	#1,d0
	bmi.s	L00e832
	move.b	(a4)+,d1
	move.b	(a5)+,d2
L00e82a:
	cmp.b	d1,d2
	bne.s	L00e834
	dbra.w	d0,L00e7ee
L00e832:
	clr.l	d0
L00e834:
	rts

L00e836:
	tst.b	d2
	beq.s	L00e832
	rts

L00e83c:
	and.b	#$df,d2
	bra.s	L00e82a

L00e842:
	or.b	#$20,d2
	bra.s	L00e82a

L00e848:
	.dc.l	L00f11e
L00e84c:
	jmp	(L00f266)

	jmp	(L00f27c)

	movea.l	(L00e848,pc),a4
	lea.l	(L00e84c,pc),a5
	jmp	($000c,a4)

	movea.l	(L00e848,pc),a4
	lea.l	(L00e84c,pc),a5
	jmp	($0036,a4)

	movem.l	a4-a5,-(sp)
	movea.l	(L00e848,pc),a4
	lea.l	(L00e84c,pc),a5
	jsr	($0012,a4)
	movem.l	(sp)+,a4-a5
	rts

L00e886:
	movem.l	a4-a5,-(sp)
	movea.l	(L00e848,pc),a4
	lea.l	(L00e84c,pc),a5
	jsr	($0018,a4)
	movem.l	(sp)+,a4-a5
	rts

L00e89c:
	movem.l	a4-a5,-(sp)
	movea.l	(L00e848,pc),a4
	lea.l	(L00e84c,pc),a5
	jsr	($001e,a4)
	movem.l	(sp)+,a4-a5
	rts

L00e8b2:
	movem.l	a4-a5,-(sp)
	movea.l	(L00e848,pc),a4
	lea.l	(L00e84c,pc),a5
	jsr	($0024,a4)
	movem.l	(sp)+,a4-a5
	rts

L00e8c8:
	movem.l	a4-a5,-(sp)
	movea.l	(L00e848,pc),a4
	lea.l	(L00e84c,pc),a5
	jsr	($002a,a4)
	movem.l	(sp)+,a4-a5
	rts

L00e8de:
	movem.l	a4-a5,-(sp)
	movea.l	(L00e848,pc),a4
	lea.l	(L00e84c,pc),a5
	jsr	($0030,a4)
	movem.l	(sp)+,a4-a5
	rts

Call_OS_PATCH:
	move.w	(a6)+,d1
	move.l	(a6),d2
	subq.b	#1,d1
	bne.s	$0000e90e
	lea.l	(L00b68e),a6
	lea.l	(L00b692),a5
	lea.l	(L00e99e,pc),a4
	bra.s	L00e954

	subq.b	#1,d1
	bne.s	$0000e924
	lea.l	(L00cc14),a6
	lea.l	(L00cc18),a5
	lea.l	(L00e9a4,pc),a4
	bra.s	L00e954

	subq.b	#1,d1
	bne.s	$0000e93e
	lea.l	(L00e848),a6
	lea.l	(L00e84c),a5
	tst.l	d2
	beq.s	L00e996
	tst.w	d1
	bne.s	L00e996
	bra.s	$0000e978

	subq.b	#1,d1
	bne.s	$0000e950
	lea.l	(L00f1a4),a6
	lea.l	(L00f1a8),a5
L00e94e:
	bra.s	$0000e934

	moveq.l	#$f2,d0
	rts

L00e954:
	tst.l	d2
	beq.s	L00e996
	tst.w	d1
	bne.s	L00e996
L00e95c:
	movea.l	#L013f10,a0
	jsr	(a4)
	move.w	($1c6e),d0
	subq.w	#6,d0
	movea.l	($1c30),a0
	jsr	(a4)
	lea.l	($0060,a0),a0
	dbra.w	d0,$0000e96e
	movea.l	(a6),a4
	move.l	a4,-(sp)
	jsr	($000c,a4)
	cmp.l	#$ffffffff,d2
	bne.s	$0000e98a
	move.l	(a6),d2
	move.l	d2,(a6)
	movea.l	d2,a4
	jsr	($0006,a4)
	move.l	(sp)+,d0
	rts

L00e996:
	movea.l	(a6),a4
	jsr	($0000.w,a4)
L00e99c:
	rts

L00e99e:
	clr.l	($0018,a0)
	rts

L00e9a4:
	lea.l	($0044,a0),a1
	moveq.l	#$ff,d1
	move.l	d1,(a1)+
	move.l	d1,(a1)+
	move.l	d1,(a1)+
	move.l	d1,(a1)+
	move.l	d1,(a1)+
	move.l	d1,(a1)+
	move.l	d1,(a1)
	rts

L00e9ba:
	jmp	(L00ea32)

	jmp	(L00ea36)

	jmp	(L00ea70)

	jmp	(L00eabe)

	jmp	(L00eb64)

	jmp	(L00eb6c)

	jmp	(L00eb74)

	jmp	(L00eb7c)

	jmp	(L00eb84)

	jmp	(L00eb94)

	jmp	(L00ebc2)

	jmp	(L00ebd0)

	jmp	(L00ec02)

	jmp	(L00ec34)

	jmp	(L00ec6a)

	jmp	(L00ea32)

	jmp	(L00ea32)

	jmp	(L00ea32)

	jmp	(L00ea32)

	jmp	(L00ea32)

L00ea32:
	moveq.l	#$ff,d0
	rts

L00ea36:
	movem.l	d0-d3/a1-a2,-(sp)
	movea.l	($0018,a5),a0
	move.l	($001c,a5),d2
	move.l	($0020,a5),d3
	move.l	a0,($0024,a5)
	moveq.l	#$ff,d0
	movea.l	d0,a1
	movea.l	a0,a2
	lea.l	($0010,a2),a0
	adda.l	d3,a0
	move.l	a0,(a2)+
	move.l	d0,(a2)+
	move.l	a1,(a2)+
	clr.l	(a2)+
	lea.l	(-$0010,a2),a1
	subq.w	#1,d2
	bne.s	$0000ea4e
	move.l	d0,($0000.w,a1)
	movem.l	(sp)+,d0-d3/a1-a2
	rts

L00ea70:
	movem.l	d0-d2/a0-a2,-(sp)
	move.l	($0024,a5),d0
	movea.l	d0,a1
	tst.b	($0004,a1)
	bmi.s	$0000eab4
	tst.b	($000c,a1)
	bpl.s	$0000eaae
	lea.l	($0010,a1),a2
	move.l	($000c,a1),d1
	and.l	#$00ffffff,d1
	movea.l	d1,a0
	move.l	($0004,a1),d1
	and.l	#$00ffffff,d1
	moveq.l	#$01,d2
	jsr	($0006,a5)
	clr.b	($000c,a1)
	jsr	($0012,a5)
	move.b	#-$01,($0004,a1)
	move.l	(a1),d0
	bpl.s	$0000ea78
	movem.l	(sp)+,d0-d2/a0-a2
	rts

L00eabe:
	move.w	#$0040,d0		;'@'
	movem.l	d1-d3/a2,-(sp)
	rol.l	#8,d1
	move.b	($0000.w,a0),d1
	ror.l	#8,d1
	move.l	($0024,a5),d2
	movea.l	d2,a1
	move.l	(a1),d2
	bmi.s	$0000eaec
	cmp.l	($0004,a1),d1
	bne.s	$0000ead2
	move.l	($0008,a1),d3
	bmi.s	$0000eb4a
	movea.l	d2,a2
	move.l	d3,($0008,a2)
	bra.s	$0000eb30

	cmp.l	($0004,a1),d1
	beq.s	$0000eb30
	tst.b	($0004,a1)
	bmi.s	$0000eb02
	bclr.b	#$07,($000c,a1)
	beq.s	$0000eb02
	bsr.s	L00eb54
	move.l	a0,d3
	rol.l	#8,d3
	move.b	d0,d3
	ror.l	#8,d3
	cmp.w	#$0100,d0
	bcc.s	$0000eb28
	movem.l	d1-d3,-(sp)
	and.l	#$00ffffff,d1
	lea.l	($0010,a1),a2
	moveq.l	#$01,d2
	jsr	($0000.w,a5)
	movem.l	(sp)+,d1-d3
	move.l	d1,($0004,a1)
	move.l	d3,($000c,a1)
	movea.l	($0008,a1),a2
	move.l	d2,(a2)
	movea.l	($0024,a5),a2
	move.l	a1,($0008,a2)
	move.l	a2,(a1)
	moveq.l	#$ff,d3
	move.l	d3,($0008,a1)
	move.l	a1,($0024,a5)
	lea.l	($0010,a1),a1
	movem.l	(sp)+,d1-d3/a2
	rts

L00eb54:
	movem.l	d0/a1,-(sp)
	lea.l	($0010,a1),a1
	bsr.s	L00eb94
	movem.l	(sp)+,d0/a1
	rts

L00eb64:
	move.w	#$0020,d0		;' '
	bra.w	$0000eac2

L00eb6c:
	move.w	#$0120,d0
	bra.w	$0000eac2

L00eb74:
	move.w	#$0010,d0
	bra.w	$0000eac2

L00eb7c:
	move.w	#$0110,d0
	bra.w	$0000eac2

L00eb84:
	move.l	d1,d0
	rol.l	#8,d0
	move.b	($0000.w,a0),d0
	ror.l	#8,d0
	cmp.l	(-$000c,a1),d0
	rts

L00eb94:
	movem.l	d1-d2/a0/a2,-(sp)
	movea.l	a1,a2
	move.l	(-$0004,a1),d1
	and.l	#$00ffffff,d1
	movea.l	d1,a0
	move.l	(-$000c,a1),d1
	and.l	#$00ffffff,d1
	moveq.l	#$01,d2
	jsr	($0006,a5)
	bclr.b	#$07,(-$0004,a1)
	movem.l	(sp)+,d1-d2/a0/a2
	rts

L00ebc2:
	bset.b	#$07,(-$0004,a1)
	bne.s	$0000ebce
	jsr	($000c,a5)
	rts

L00ebd0:
	movem.l	d0-d2/a1,-(sp)
	move.l	a0,d2
	lsl.l	#8,d2
	move.l	($0024,a5),d0
	movea.l	d0,a1
	tst.b	($0004,a1)
	bmi.s	$0000ebf4
	move.l	($000c,a1),d0
	bpl.s	$0000ebf4
	lsl.l	#8,d0
	cmp.l	d0,d2
	bne.s	$0000ebf4
	bsr.w	L00eb54
	move.l	(a1),d0
	bpl.s	$0000ebdc
	jsr	($0012,a5)
	movem.l	(sp)+,d0-d2/a1
	rts

L00ec02:
	movem.l	d1/a1,-(sp)
	move.l	a0,d1
	lsl.l	#8,d1
	move.l	($0024,a5),d0
	movea.l	d0,a1
	tst.b	($0004,a1)
	bmi.s	$0000ec2a
	move.l	($000c,a1),d0
	lsl.l	#8,d0
	cmp.l	d0,d1
	bne.s	$0000ec2a
	move.b	#-$01,($0004,a1)
	clr.b	($000c,a1)
	move.l	(a1),d0
	bpl.s	$0000ec0e
	movem.l	(sp)+,d1/a1
	rts

L00ec34:
	movem.l	d1-d2/a1,-(sp)
	rol.l	#8,d1
	move.b	($0000.w,a0),d1
	ror.l	#8,d1
	add.l	d1,d2
	move.l	($0024,a5),d0
	movea.l	d0,a1
	tst.b	($000c,a1)
	bpl.s	$0000ec5e
	move.l	($0004,a1),d0
	cmp.l	d2,d0
	bcc.s	$0000ec5e
	cmp.l	d1,d0
	bcs.s	$0000ec5e
	bsr.w	L00eb54
	move.l	(a1),d0
	bpl.s	$0000ec46
	movem.l	(sp)+,d1-d2/a1
	jmp	($0000.w,a5)

L00ec6a:
	movem.l	d1-d2/a1,-(sp)
	rol.l	#8,d1
	move.b	($0000.w,a0),d1
	ror.l	#8,d1
	add.l	d1,d2
	move.l	($0024,a5),d0
	movea.l	d0,a1
	move.l	($0004,a1),d0
	cmp.l	d2,d0
	bcc.s	$0000ec94
	cmp.l	d1,d0
	bcs.s	$0000ec94
	clr.b	($000c,a1)
	move.b	#-$01,($0004,a1)
	move.l	(a1),d0
	bpl.s	$0000ec7c
	movem.l	(sp)+,d1-d2/a1
	jmp	($0006,a5)

L00eca0:
	jmp	(L00ed18)

	jmp	(L00ed20)

	jmp	(L00ed24)

	jmp	(L00ed28)

	jmp	(L00eda2)

	jmp	(L00ede4)

	jmp	(L00ee78)

	jmp	(L00ef5c)

	jmp	(L00f03a)

	jmp	(L00f04e)

	jmp	(L00f05e)

	jmp	(L00ed18)

	jmp	(L00ed18)

	jmp	(L00ed18)

	jmp	(L00ed18)

	jmp	(L00ed18)

	jmp	(L00ed18)

	jmp	(L00ed18)

	jmp	(L00ed18)

	jmp	(L00ed18)

L00ed18:
	moveq.l	#$ff,d0
	rts

L00ed1c:
	jmp	($0000.w,a5)

L00ed20:
	clr.l	d0
	rts

L00ed24:
	clr.l	d0
	rts

L00ed28:
	movem.l	d5-d7/a6,-(sp)
	move.w	d0,d6
	beq.s	$0000ed90
	lea.l	($001c,a1),a6
	moveq.l	#$07,d5
	subq.w	#1,d5
	beq.s	$0000ed44
	move.w	-(a6),d7
	cmp.w	-(a6),d0
	bcs.s	$0000ed36
	sub.w	(a6),d0
	move.w	d7,d1
	move.w	d0,d7
	beq.s	$0000ed90
	move.w	d1,d0
	bsr.w	L00ede4
	bmi.s	$0000ed92
	tst.w	d0
	beq.s	L00ed1c
	cmp.w	d3,d0
	bne.s	$0000ed66
	bsr.w	L00ee78
	bmi.s	$0000ed92
	move.w	d0,-(sp)
	bsr.w	L00f05e
	move.w	(sp)+,d0
	move.w	d0,d1
	subq.w	#1,d7
	bne.s	$0000ed4a
	move.l	d2,d7
	move.b	($001b,a0),d0
	lsr.l	d0,d7
	move.b	($000d,a0),d0
	lsr.l	d0,d7
	move.l	d7,d0
	lsr.w	#3,d0
	moveq.l	#$06,d5
	lea.l	($001c,a1),a6
	subq.l	#4,a6
	sub.w	d0,d7
	cmp.w	d7,d6
	bcc.s	L00ed98
	dbra.w	d5,$0000ed84
	clr.l	d0
	movem.l	(sp)+,d5-d7/a6
	rts

L00ed98:
	cmp.w	(a6),d6
	bcc.s	$0000ed90
	move.w	d6,(a6)+
	move.w	d1,(a6)
	bra.s	$0000ed90

L00eda2:
	movem.l	d1/d4,-(sp)
	move.w	d2,d4
	subq.w	#1,d4
	move.w	d1,d0
	bsr.s	L00ede4
	bmi.s	$0000eddc
	tst.w	d0
	beq.w	L00ed1c
	cmp.w	d3,d0
	bne.s	$0000edc8
	bsr.w	L00ee78
	bmi.s	$0000eddc
	move.w	d0,-(sp)
	bsr.w	L00f05e
	move.w	(sp)+,d0
	sub.w	d0,d1
	addq.w	#1,d1
	bne.s	$0000edd6
	move.w	d0,d1
	dbra.w	d4,$0000edaa
	clr.w	d4
	move.w	d0,d1
	clr.l	d0
	move.w	d1,d0
	sub.w	d4,d2
	movem.l	(sp)+,d1/d4
	rts

L00ede4:
	movem.l	d1-d3/a1-a3,-(sp)
	cmpi.w	#$0ff8,($0016,a0)
	bcc.s	L00ee28
	move.w	d0,d3
	bsr.s	$0000ee44
	movea.l	a2,a3
	addq.l	#1,a2
	cmp.w	d0,d2
	bne.s	$0000ee02
	clr.l	d2
	addq.l	#1,d1
	bsr.s	$0000ee6a
	clr.l	d0
	move.b	(a2),d0
	asl.w	#8,d0
	move.b	(a3),d0
	btst.l	#$00,d3
	beq.s	$0000ee12
	lsr.w	#4,d0
	move.w	#$0fff,d1
	and.w	d1,d0
	cmp.w	d1,d0
	bne.s	$0000ee20
	move.w	#$ffff,d0
	movem.l	(sp)+,d1-d3/a1-a3
	tst.l	d0
	rts

L00ee28:
	bsr.s	$0000ee3a
	clr.l	d0
	move.w	(a2),d0
	btst.b	#$07,($000d,a0)
	beq.s	$0000ee20
	ror.w	#8,d0
	bra.s	$0000ee20

	and.l	#$0000ffff,d0
	add.l	d0,d0
	bra.s	$0000ee50

	clr.l	d1
	move.w	d0,d1
	move.l	d1,d0
	add.l	d1,d1
	add.l	d1,d0
	lsr.l	#1,d0
	clr.l	d1
	move.l	d0,d2
	move.b	($001b,a0),d1
	lsr.l	d1,d0
	move.w	($000e,a0),d1
	add.l	d0,d1
	clr.l	d0
	move.w	($000a,a0),d0
	subq.w	#1,d0
	and.l	d0,d2
	move.l	d0,-(sp)
	jsr	($0006,a5)
	move.l	(sp)+,d0
	movea.l	a1,a2
	adda.l	d2,a2
	rts

L00ee78:
	move.w	($001c,a0),d0
	tst.b	($0012,a5)
	beq.s	$0000ee84
	moveq.l	#$02,d0
	movem.l	d1-d3,-(sp)
	move.w	d0,d3
	move.w	($0016,a0),d1
	subq.w	#1,d1
	cmp.w	#$0ff7,d1
	bcc.s	$0000eed2
	move.w	d0,d2
	move.w	d2,d0
	bsr.w	L00ede4
	beq.s	L00eebe
	addq.w	#1,d2
	cmp.w	d1,d2
	bne.s	$0000eeaa
	move.w	#$0002,d2
	cmp.w	d3,d2
	bne.s	$0000ee98
	move.w	#$0002,($001c,a0)
	moveq.l	#$e9,d0
	movem.l	(sp)+,d1-d3
	tst.l	d0
	rts

L00eebe:
	move.w	#$ffff,d0
	move.w	d2,d1
	bsr.w	L00f05e
	clr.l	d0
	move.w	d2,d0
	move.w	d0,($001c,a0)
	bra.s	$0000eeb6

	movem.l	d4-d6/a1-a2,-(sp)
	move.w	d0,d3
	clr.l	d6
	move.w	d0,d6
	move.w	d0,d4
	move.w	($000a,a0),d5
	lsr.w	#1,d5
	subq.w	#1,d5
	and.w	d5,d4
	sub.w	d4,d5
	move.w	d1,d4
	and.l	#$0000ffff,d0
	add.l	d0,d0
	bsr.w	$0000ee50
	tst.w	(a2)+
	beq.s	$0000ef4c
	addq.w	#1,d6
	cmp.w	d4,d6
	bne.s	$0000ef22
	move.w	#$0002,d6
	cmp.w	d3,d6
	beq.s	$0000ef3c
	clr.l	d5
	clr.l	d1
	move.w	($000e,a0),d1
	move.w	($000a,a0),d5
	lsr.w	#1,d5
	subq.w	#3,d5
	moveq.l	#$04,d2
	bsr.w	$0000ee6a
	bra.s	$0000eef8

	cmp.w	d3,d6
	dbeq.w	d5,$0000eef8
	beq.s	$0000ef3c
	move.w	($000a,a0),d5
	lsr.w	#1,d5
	subq.w	#1,d5
	clr.l	d2
	addq.l	#1,d1
	bsr.w	$0000ee6a
	bra.s	$0000eef8

	moveq.l	#$e9,d0
	move.w	#$0002,($001c,a0)
	movem.l	(sp)+,d4-d6/a1-a2
	bra.w	$0000eeb6

	move.w	#$ffff,-(a2)
	jsr	($000c,a5)
	move.l	d6,d0
	move.w	d0,($001c,a0)
	bra.s	$0000ef44

L00ef5c:
	moveq.l	#$02,d0
	movem.l	d1-d5/a1-a3,-(sp)
	clr.l	d3
	move.w	($0016,a0),d1
	cmp.w	#$0ff8,d1
	bcc.w	$0000effe
	sub.w	d0,d1
	subq.w	#2,d1
	move.w	d1,d4
	swap.w	d4
	move.w	d0,d4
	move.w	($000a,a0),d5
	bsr.w	$0000ee44
	movea.l	a2,a3
	addq.l	#1,a2
	addq.l	#1,d2
	cmp.w	d5,d2
	bne.s	$0000ef94
	clr.l	d2
	addq.l	#1,d1
	bsr.w	$0000ee6a
	movea.l	a3,a1
	swap.w	d4
	swap.w	d4
	btst.l	#$00,d4
	beq.s	$0000efce
	clr.l	d0
	move.b	(a2),d0
	asl.w	#8,d0
	move.b	(a1),d0
	lsr.w	#4,d0
	addq.l	#1,a2
	addq.l	#1,d2
	cmp.w	d5,d2
	bne.s	$0000efba
	clr.l	d2
	addq.l	#1,d1
	bsr.w	$0000ee6a
	movea.l	a2,a3
	addq.l	#1,a2
	addq.l	#1,d2
	cmp.w	d5,d2
	bne.s	$0000efec
	clr.l	d2
	addq.l	#1,d1
	bsr.w	$0000ee6a
	bra.s	$0000efec

	clr.l	d0
	move.b	(a2),d0
	asl.w	#8,d0
	move.b	(a1),d0
	and.w	#$0fff,d0
	movea.l	a2,a3
	addq.l	#1,a2
	addq.l	#1,d2
	cmp.w	d5,d2
	bne.s	$0000efec
	clr.l	d2
	addq.l	#1,d1
	bsr.w	$0000ee6a
	movea.l	a3,a1
	tst.w	d0
	bne.s	$0000eff4
	addq.l	#1,d3
	addq.w	#1,d4
	swap.w	d4
	dbra.w	d4,$0000ef98
	bra.s	$0000f032

	sub.w	d0,d1
	move.w	d1,d4
	subq.w	#1,d4
	add.l	d0,d0
	bsr.w	$0000ee50
	move.w	($000a,a0),d5
	lsr.w	#1,d5
	subq.w	#3,d5
	tst.w	(a2)+
	bne.s	$0000f018
	addq.l	#1,d3
	subq.w	#1,d4
	dbeq.w	d5,$0000f012
	beq.s	$0000f032
	move.w	($000a,a0),d5
	lsr.w	#1,d5
	subq.w	#1,d5
	clr.l	d2
	addq.l	#1,d1
	bsr.w	$0000ee6a
	bra.s	$0000f012

	move.l	d3,d0
	movem.l	(sp)+,d1-d5/a1-a3
	rts

L00f03a:
	bsr.s	L00f04e
	tst.l	d0
	bmi.s	$0000f04c
	beq.w	L00ed1c
	cmp.w	#$ffff,d0
	bne.s	L00f03a
	clr.l	d0
	rts

L00f04e:
	movem.l	d1,-(sp)
	move.w	d0,d1
L00f054:
	clr.l	d0
	bsr.s	L00f05e
	movem.l	(sp)+,d1
	rts

L00f05e:
	movem.l	d1-d3/a1-a3,-(sp)
	cmpi.w	#$0ff8,($0016,a0)
	bcc.w	L00f0f6
	move.w	d0,d2
	move.w	d1,d0
	move.w	d1,d3
	movem.l	d1-d2,-(sp)
	bsr.w	$0000ee44
	jsr	($000c,a5)
	movea.l	a2,a3
	addq.l	#1,a2
	move.w	($000a,a0),d0
	subq.w	#1,d0
	cmp.w	d0,d2
	bne.s	$0000f098
	clr.l	d2
	addq.l	#1,d1
	bsr.w	$0000ee6a
	jsr	($000c,a5)
	movea.l	a3,a1
	movem.l	(sp)+,d1-d2
	btst.l	#$00,d3
	beq.s	$0000f0c4
	clr.l	d0
	move.b	(a2),d0
	ror.w	#4,d2
	move.b	d2,(a2)
	ror.w	#8,d2
	and.w	#$00f0,d2
	asl.w	#8,d0
	move.b	(a1),d0
	move.b	d0,d1
	and.w	#$000f,d1
	or.b	d2,d1
	move.b	d1,(a1)
	lsr.w	#4,d0
	bra.s	$0000f0e4

	clr.l	d0
	move.b	(a2),d0
	ror.w	#8,d2
	and.b	#$0f,d2
	move.w	d0,d1
	and.b	#$f0,d1
	or.b	d2,d1
	move.b	d1,(a2)
	asl.w	#8,d0
	ror.w	#8,d2
	move.b	(a1),d0
	move.b	d2,(a1)
	and.w	#$0fff,d0
	cmp.w	#$0fff,d0
	bne.s	$0000f0ee
	move.w	#$ffff,d0
	movem.l	(sp)+,d1-d3/a1-a3
	tst.l	d0
	rts

L00f0f6:
	move.w	d0,d2
	move.w	d1,d0
	movem.l	d1-d2,-(sp)
	bsr.w	$0000ee3a
	movem.l	(sp)+,d1-d2
	jsr	($000c,a5)
	clr.l	d0
	move.w	(a2),d0
	btst.b	#$07,($000d,a0)
	beq.s	$0000f11a
	ror.w	#8,d0
	ror.w	#8,d2
	move.w	d2,(a2)
	bra.s	$0000f0ee

L00f11e:
	jmp	(L00f18a)

	jmp	(L00f18e)

	jmp	(L00f192)

	jmp	(L00f194)

	jmp	(L00f198)

	jmp	(L00f19a)

	jmp	(L00f19c)

	jmp	(L00f1a0)

	jmp	(L00f1a2)

	jmp	(L00f18a)

	jmp	(L00f18a)

	jmp	(L00f18a)

	jmp	(L00f18a)

	jmp	(L00f18a)

	jmp	(L00f18a)

	jmp	(L00f18a)

	jmp	(L00f18a)

	jmp	(L00f18a)

L00f18a:
	moveq.l	#$ff,d0
	rts

L00f18e:
	clr.l	d0
	rts

L00f192:
	rts

L00f194:
	moveq.l	#$ff,d0
	rts

L00f198:
	rts

L00f19a:
	rts

L00f19c:
	moveq.l	#$ff,d0
	rts

L00f1a0:
	rts

L00f1a2:
	rts

L00f1a4:
	.dc.l	L00f2be
L00f1a8:
	jmp	(L00e7b6)

L00f1ae:
	.dc.l	CharStrings
L00f1b2:
	.dc.w	$0020
L00f1b4:
	movem.l	a4-a5,-(sp)
	movea.l	(L00f1a4,pc),a4
	lea.l	(L00f1a8,pc),a5
	jsr	($0012,a4)
	movem.l	(sp)+,a4-a5
	rts

L00f1ca:
	movem.l	a4-a5,-(sp)
	movea.l	(L00f1a4,pc),a4
	lea.l	(L00f1a8,pc),a5
	jsr	($0018,a4)
	movem.l	(sp)+,a4-a5
	rts

L00f1e0:
	movem.l	a4-a5,-(sp)
	movea.l	(L00f1a4,pc),a4
	lea.l	(L00f1a8,pc),a5
	jsr	($003c,a4)
	movem.l	(sp)+,a4-a5
	rts

L00f1f6:
	movem.l	a4-a5,-(sp)
	movea.l	(L00f1a4,pc),a4
	lea.l	(L00f1a8,pc),a5
	jsr	($002a,a4)
	movem.l	(sp)+,a4-a5
	rts

L00f20c:
	movem.l	a4-a5,-(sp)
	movea.l	(L00f1a4,pc),a4
	lea.l	(L00f1a8,pc),a5
	jsr	($0030,a4)
	movem.l	(sp)+,a4-a5
	rts

L00f222:
	movem.l	a4-a5,-(sp)
	movea.l	(L00f1a4,pc),a4
	lea.l	(L00f1a8,pc),a5
	jsr	($0036,a4)
	movem.l	(sp)+,a4-a5
	rts

L00f238:
	movem.l	d0/a1/a4-a5,-(sp)
	movea.l	a5,a1
	movea.l	(L00f1a4,pc),a4
	lea.l	(L00f1a8,pc),a5
	jsr	($0042,a4)
	movem.l	(sp)+,d0/a1/a4-a5
	rts

L00f250:
	movem.l	a4-a5,-(sp)
	movea.l	(L00f1a4,pc),a4
	lea.l	(L00f1a8,pc),a5
	jsr	($004e,a4)
	movem.l	(sp)+,a4-a5
	rts

L00f266:
	movem.l	a4-a5,-(sp)
	movea.l	(L00f1a4,pc),a4
	lea.l	(L00f1a8,pc),a5
	jsr	($001e,a4)
	movem.l	(sp)+,a4-a5
	rts

L00f27c:
	movem.l	a2-a3,-(sp)
	movea.l	(L00f1a4,pc),a2
	lea.l	(L00f1a8,pc),a3
	jsr	($0024,a2)
	movem.l	(sp)+,a2-a3
	rts

L00f292:
	movem.l	a4-a5,-(sp)
	movea.l	(L00f1a4,pc),a4
	lea.l	(L00f1a8,pc),a5
	jsr	($0048,a4)
	movem.l	(sp)+,a4-a5
	rts

L00f2a8:
	movem.l	a5,-(sp)
	movea.l	(L00f1a4,pc),a0
	lea.l	(L00f1a8,pc),a5
	jsr	($0054,a0)
	movem.l	(sp)+,a5
	rts

L00f2be:
	jmp	(L00f336)

	jmp	(L00f33a)

	jmp	(L00f346)

	jmp	(L00f34a)

	jmp	(L00f356)

	jmp	(L00f642)

	jmp	(L00f66e)

	jmp	(L00f478)

	jmp	(L00f4be)

	jmp	(L00f3c6)

	jmp	(L00f466)

	jmp	(L00f3da)

	jmp	(L00f3dc)

	jmp	(L00f6c8)

	jmp	(L00f6e0)

	jmp	(L00f336)

	jmp	(L00f336)

	jmp	(L00f336)

	jmp	(L00f336)

	jmp	(L00f336)

L00f336:
	moveq.l	#$ff,d0
	rts

L00f33a:
	move.l	#CharStrings,($0006,a5)
	clr.l	d0
	rts

L00f346:
	clr.l	d0
	rts

L00f34a:
	lea.l	($0043,a2),a0
	jsr	($0000.w,a5)
	tst.l	d0
	rts

L00f356:
	movem.l	d5/d7/a1-a2,-(sp)
	addq.l	#1,a1
	moveq.l	#$07,d5
	bsr.s	L00f36c
	bne.s	$0000f366
	moveq.l	#$02,d5
	bsr.s	L00f36c
	movem.l	(sp)+,d5/d7/a1-a2
	rts

L00f36c:
	move.b	(a2)+,d7
	cmp.b	#$80,d7
	bcs.s	$0000f392
	cmp.b	#$a0,d7
	bcs.s	$0000f380
	cmp.b	#$e0,d7
	bcs.s	$0000f392
	cmp.b	d0,d7
	bne.s	$0000f3c4
	move.b	(a1)+,d0
	subq.w	#1,d5
	bmi.s	$0000f3c2
	move.b	(a2)+,d7
	cmp.b	d0,d7
	bne.s	$0000f3c4
	bra.s	$0000f3bc

	cmp.b	#$3f,d7			;'?'
	beq.s	$0000f3bc
	cmp.b	#$61,d0			;'a'
	bcs.s	$0000f3a8
	cmp.b	#$7b,d0			;'{'
	bcc.s	$0000f3a8
	sub.b	#$20,d0			;' '
	cmp.b	#$61,d7			;'a'
	bcs.s	$0000f3b8
	cmp.b	#$7b,d7			;'{'
	bcc.s	$0000f3b8
	sub.b	#$20,d7			;' '
	cmp.b	d0,d7
	bne.s	$0000f3c4
	move.b	(a1)+,d0
	dbra.w	d5,L00f36c
	clr.b	d7
	rts

L00f3c6:
	lea.l	($0043,a2),a3
	lea.l	($000a,a1),a1
	moveq.l	#$0a,d0
	move.b	(a3)+,(a1)+
	dbra.w	d0,$0000f3d0
	clr.l	d0
	rts

L00f3da:
	rts

L00f3dc:
	movea.l	a1,a3
	move.b	(a3)+,d0
	tst.w	d1
	beq.s	$0000f3ee
	cmp.b	#$05,d0
	bne.s	$0000f3ee
	move.b	#$e5,d0
	swap.w	d1
	move.w	#$0007,d1
	cmp.b	#$20,d0			;' '
	beq.s	$0000f422
	bsr.s	L00f448
	move.b	d0,(a2)+
	move.b	(a3)+,d0
	dbra.w	d1,$0000f3f4
	lea.l	($000b,a1),a3
	clr.w	d1
	swap.w	d1
	adda.l	d1,a3
	moveq.l	#$09,d1
	move.b	(a3)+,d0
	beq.s	$0000f422
	cmp.b	#$20,d0			;' '
	beq.s	$0000f422
	bsr.s	L00f448
	move.b	d0,(a2)+
	dbra.w	d1,$0000f410
	lea.l	($0008,a1),a3
	cmpi.b	#$20,(a3)		;' '
	beq.s	$0000f442
	move.b	#$2e,(a2)+		;'.'
	moveq.l	#$02,d1
	move.b	(a3)+,d0
	cmp.b	#$20,d0			;' '
	beq.s	$0000f442
	bsr.s	L00f448
	move.b	d0,(a2)+
	dbra.w	d1,$0000f432
	clr.l	d0
	move.b	d0,(a2)
	rts

L00f448:
	bcs.s	L00f45e
	cmp.b	#$3a,d0			;':'
	beq.s	L00f45e
	cmp.b	#$3f,d0			;'?'
	beq.s	L00f45e
	cmp.b	#$2a,d0			;'*'
	beq.s	L00f45e
	rts

L00f45e:
	addq.l	#4,sp
	clr.b	(a2)
	moveq.l	#$ff,d0
	rts

L00f466:
	lea.l	($000a,a2),a2
	clr.l	d0
	rts

L00f46e:
	move.b	#$09,(a3)+
	subq.w	#1,d2
	beq.s	$0000f4b2
	move.b	(a1)+,d0
L00f478:
	cmp.b	#$2e,d0			;'.'
	bne.s	$0000f4a2
	subq.w	#1,d2
	move.b	(a1)+,d0
	cmp.b	#$09,d0
	beq.s	$0000f472
	subq.w	#1,d2
	cmp.b	#$2e,d0			;'.'
	bne.s	L00f4b6
	moveq.l	#$09,d0
	cmp.b	(a1)+,d0
	bne.s	L00f4b6
	subq.l	#1,a3
	cmpa.l	a0,a3
	beq.s	L00f4ba
	cmp.b	-(a3),d0
	bne.s	$0000f49c
	bra.s	L00f46e

	move.b	d0,(a3)+
	subq.w	#1,d2
	beq.s	$0000f4b2
	move.b	(a1)+,d0
	cmp.b	#$09,d0
	bne.s	$0000f4a2
	bra.s	L00f46e

	clr.l	d0
	rts

L00f4b6:
	moveq.l	#$f3,d0
	rts

L00f4ba:
	moveq.l	#$f3,d0
	rts

L00f4be:
	tst.b	(a1)
	beq.w	$0000f5fc
	cmpi.b	#$2e,(a1)		;'.'
	bne.s	$0000f4f4
	addq.l	#1,a1
	move.b	(a1),d0
	beq.w	$0000f5fc
	cmp.b	#$2e,d0			;'.'
	bne.w	$0000f5a2
	addq.l	#1,a1
	tst.b	(a1)
	bne.s	L00f4b6
	subq.l	#1,a3
	cmpa.l	a0,a3
	beq.s	L00f4ba
	moveq.l	#$09,d0
	cmp.b	-(a3),d0
	bne.s	$0000f4e8
	move.b	d0,(a3)+
	clr.b	(a3)
	bra.w	$0000f5fc

	moveq.l	#$07,d1
	lea.l	($0043,a2),a3
	move.b	(a1)+,d0
	beq.s	$0000f54c
	cmp.b	#$2a,d0			;'*'
	beq.s	$0000f558
	cmp.b	#$2e,d0			;'.'
	beq.s	$0000f56a
	cmp.b	#$3a,d0			;':'
	beq.s	L00f4b6
	cmp.b	#$3f,d0			;'?'
	bne.s	$0000f518
	addq.b	#1,(a2)
	move.b	d0,(a3)+
	dbra.w	d1,$0000f4fa
	moveq.l	#$09,d1
	lea.l	($004e,a2),a3
	move.b	(a1)+,d0
	beq.s	$0000f57a
	cmp.b	#$2a,d0			;'*'
	beq.s	$0000f584
	cmp.b	#$2e,d0			;'.'
	beq.s	$0000f58e
	cmp.b	#$3a,d0			;':'
	beq.w	L00f4b6
	cmp.b	#$3f,d0			;'?'
	bne.s	$0000f544
	addq.b	#1,(a2)
	move.b	d0,(a3)+
	dbra.w	d1,$0000f524
	bra.s	$0000f596

	move.b	#$20,(a3)+		;' '
	dbra.w	d1,$0000f54c
	bra.w	$0000f602

	addq.b	#1,(a2)
	move.b	#$3f,(a3)+		;'?'
	dbra.w	d1,$0000f558
	moveq.l	#$09,d1
	lea.l	($004e,a2),a3
	bra.s	$0000f584

	move.b	#$20,(a3)+		;' '
	dbra.w	d1,$0000f56a
	moveq.l	#$09,d1
	lea.l	($004e,a2),a3
	bra.s	$0000f58e

	clr.b	(a3)+
	dbra.w	d1,$0000f57a
	bra.w	$0000f604

	move.b	#$3f,(a3)+		;'?'
	dbra.w	d1,$0000f584
	bra.s	$0000f596

	clr.b	(a3)+
	dbra.w	d1,$0000f58e
	bra.s	$0000f5a8

	move.b	(a1)+,d0
	beq.s	$0000f604
	cmp.b	#$2e,d0			;'.'
	bne.s	L00f618
	bra.s	$0000f5a8

	bsr.s	L00f620
	bsr.w	L00f634
	move.b	#$01,($000a,a5)
	moveq.l	#$02,d1
	lea.l	($004b,a2),a3
	move.b	(a1)+,d0
	beq.s	L00f5e4
	cmp.b	#$2a,d0			;'*'
	beq.s	L00f5f0
	cmp.b	#$3a,d0			;':'
	beq.w	L00f4b6
	cmp.b	#$2e,d0			;'.'
	beq.w	L00f4b6
	cmp.b	#$3f,d0			;'?'
	bne.s	$0000f5d6
	addq.b	#1,(a2)
	move.b	d0,(a3)+
	dbra.w	d1,$0000f5b4
	tst.b	(a1)
	bne.s	L00f61c
	clr.l	d0
	rts

L00f5e4:
	move.b	#$20,(a3)+		;' '
	dbra.w	d1,L00f5e4
	clr.l	d0
	rts

L00f5f0:
	addq.b	#1,(a2)
	move.b	#$3f,(a3)+		;'?'
	dbra.w	d1,L00f5f0
	bra.s	$0000f5dc

	bsr.s	L00f620
	move.b	#-$01,(a2)
	bsr.s	L00f634
	lea.l	($004b,a2),a3
	moveq.l	#$02,d1
	move.b	($000b,a5),d0
	move.b	d0,(a3)+
	dbra.w	d1,$0000f60e
	clr.l	d0
	rts

L00f618:
	moveq.l	#$f3,d0
	rts

L00f61c:
	moveq.l	#$f3,d0
	rts

L00f620:
	lea.l	($0043,a2),a3
	move.b	($000b,a5),d0
	moveq.l	#$07,d1
	addq.b	#1,(a2)
	move.b	d0,(a3)+
	dbra.w	d1,$0000f62a
	rts

L00f634:
	lea.l	($004e,a2),a3
	moveq.l	#$09,d1
	clr.b	(a3)+
	dbra.w	d1,$0000f63a
	rts

L00f642:
	movem.l	a4-a5,-(sp)
	lea.l	($0001,a3),a4
	lea.l	($0001,a2),a5
	cmpm.b	(a4)+,(a5)+
	bne.s	$0000f668
	moveq.l	#$41,d0			;'A'
	bsr.s	L00f66e
	bne.s	$0000f668
	tst.b	d2
	bne.s	$0000f668
	lea.l	($0043,a3),a4
	lea.l	($0043,a2),a5
	moveq.l	#$0a,d0
	bsr.s	L00f66e
	movem.l	(sp)+,a4-a5
	rts

L00f66e:
	move.b	(a5)+,d2
	move.b	(a4)+,d1
	beq.s	L00f6b6
	cmp.b	#$41,d1			;'A'
	bcs.s	$0000f6aa
	cmp.b	#$5b,d1			;'['
	bcs.s	L00f6bc
	cmp.b	#$61,d1			;'a'
	bcs.s	$0000f6aa
	cmp.b	#$7b,d1			;'{'
	bcs.s	$0000f6c2
	cmp.b	#$80,d1
	bcs.s	$0000f6aa
	cmp.b	#$a0,d1
	bcs.s	$0000f69e
	cmp.b	#$e0,d1
	bcs.s	$0000f6aa
	cmp.b	d1,d2
	bne.s	$0000f6b4
	subq.w	#1,d0
	bmi.s	$0000f6b2
	move.b	(a4)+,d1
	move.b	(a5)+,d2
	cmp.b	d1,d2
	bne.s	$0000f6b4
	dbra.w	d0,L00f66e
	clr.l	d0
	rts

L00f6b6:
	tst.b	d2
	beq.s	$0000f6b2
	rts

L00f6bc:
	and.b	#$df,d2
	bra.s	$0000f6aa

	or.b	#$20,d2
	bra.s	$0000f6aa

L00f6c8:
	cmp.b	#$2f,d0			;'/'
	beq.s	$0000f6de
	cmp.b	#$2d,d0			;'-'
	beq.s	$0000f6de
	cmp.b	#$22,d0			;'"'
	beq.s	$0000f6de
	cmp.b	#$27,d0			;'''
	rts

L00f6e0:
	rts

CharStrings:
	.dc.b	'\/',$00
	.dc.b	'-',$00
	.dc.b	$0a
	.dc.b	'"',$27,'+,;<=>[]|',$00
L00f6f4:
	movem.l	d0-d6/a0-a6,-(sp)
	bsr.w	L00f918
	ori.w	#$0700,sr
	bsr.w	$0000f7b2
	moveq.l	#$16,d2
	moveq.l	#$10,d3
	moveq.l	#$33,d4			;'3'
	lea.l	(L01124c),a1
	bsr.w	$0000f8d6
	ror.w	#8,d7
	cmp.b	#$80,d7
	bcc.s	$0000f722
	cmp.b	#$10,d7
	bcc.s	$0000f726
	move.b	#$10,d7
	btst.l	#$04,d7
	bne.s	$0000f736
	lea.l	(L011214),a1
	bsr.w	$0000f8c4
	btst.l	#$05,d7
	bne.s	$0000f746
	lea.l	(L011218),a1
	bsr.w	$0000f8c4
	btst.l	#$06,d7
	bne.s	$0000f756
	lea.l	(L01121c),a1
	bsr.w	$0000f8c4
	andi.w	#$f8ff,sr
	bsr.w	L00fa16
	and.w	#$00df,d0
	cmp.b	#$41,d0			;'A'
	beq.s	$0000f78c
	cmp.b	#$52,d0			;'R'
	beq.s	$0000f780
	cmp.b	#$49,d0			;'I'
	bne.s	$0000f75a
	btst.l	#$06,d7
	beq.s	$0000f75a
	move.b	#$02,d7
	bra.s	$0000f79c

	btst.l	#$05,d7
	beq.s	$0000f75a
	move.b	#$01,d7
	bra.s	$0000f79c

	btst.l	#$04,d7
	beq.s	$0000f75a
	clr.b	d7
	move.w	#$0001,(L0116c4)
	bsr.w	L00f990
	tst.b	d7
	beq.s	$0000f7aa
	movem.l	(sp)+,d0-d6/a0-a6
	rte

	move.w	#$00ff,d0
	trap	#15
	bra.s	$0000f7a4

	lea.l	(L01134c),a1
	cmp.w	#$001f,d7
	beq.s	$0000f814
	cmp.w	#$301f,d7
	beq.s	$0000f814
	lea.l	(L011369),a1
L00f7ca:
	move.w	d7,d0
	ror.w	#8,d0
	cmp.b	#$fe,d0
	beq.s	$0000f814
	cmp.w	#$0002,d7
	bcs.s	$0000f83e
	cmp.w	#$0009,d7
	bcs.s	$0000f802
	cmp.w	#$1000,d7
	bcs.s	$0000f83e
	cmp.w	#$8000,d7
	bcc.s	$0000f83e
	clr.l	d0
	move.b	d7,d0
	subq.l	#1,d0
	bmi.s	$0000f83a
	cmp.b	#$0f,d0
	bcc.s	$0000f83e
	lea.l	(L011386),a1
	bra.s	$0000f82a

	clr.l	d0
	move.b	d7,d0
	subq.w	#2,d0
	lea.l	(L011281),a1
	mulu.w	#$001d,d0
	adda.l	d0,a1
	moveq.l	#$16,d2
	moveq.l	#$0f,d3
	moveq.l	#$1b,d4
	bsr.w	$0000f8d6
	lea.l	(L01123d),a1
	moveq.l	#$04,d4
	moveq.l	#$32,d2			;'2'
	bra.s	$0000f872

	mulu.w	#$0035,d0
	adda.l	d0,a1
	moveq.l	#$16,d2
	moveq.l	#$0f,d3
	moveq.l	#$33,d4			;'3'
	bra.w	$0000f8d6

	movea.l	a5,a1
	bra.s	$0000f830

	moveq.l	#$16,d2
	moveq.l	#$0f,d3
	moveq.l	#$08,d4
	lea.l	(L011224),a1
	bsr.w	$0000f8d6
	move.w	d7,d2
	lea.l	(L0123d2),a1
	bsr.w	$0000f8f2
	moveq.l	#$1f,d2
	moveq.l	#$0f,d3
	moveq.l	#$03,d4
	lea.l	(L0123d2),a1
	bsr.s	$0000f8d6
	lea.l	(L01122e),a1
	moveq.l	#$13,d4
	moveq.l	#$23,d2			;'#'
	moveq.l	#$0f,d3
	bsr.s	$0000f8d6
	move.w	(a6),d2
	lea.l	(L0123d2),a1
	bsr.s	$0000f8f2
	moveq.l	#$37,d2			;'7'
	moveq.l	#$0f,d3
	moveq.l	#$03,d4
	lea.l	(L0123d2),a1
	bsr.s	$0000f8d6
	moveq.l	#$3b,d2			;';'
	moveq.l	#$0f,d3
	moveq.l	#$04,d4
	lea.l	(L011243),a1
L00f89a:
	bsr.s	$0000f8d6
	move.l	($0002,a6),d2
	lea.l	(L0123d2),a1
	bsr.s	L00f8ec
	moveq.l	#$40,d2			;'@'
	moveq.l	#$0f,d3
	moveq.l	#$07,d4
	lea.l	(L0123d2),a1
	bsr.s	$0000f8d6
	moveq.l	#$48,d2			;'H'
	moveq.l	#$0f,d3
	moveq.l	#$01,d4
	lea.l	(L011249),a1
	bra.s	$0000f8d6

	move.w	(a1)+,d2
	move.w	(a1),d3
	lea.l	(L0123d2),a1
	move.l	#$81400000,(a1)
	moveq.l	#$01,d4
	cmpi.b	#$16,($00e80029)
	beq.s	$0000f8e4
	sub.w	#$0010,d2
	moveq.l	#$0d,d1
	IOCS	_B_PUTMES
	rts

L00f8ec:
	swap.w	d2
	bsr.s	$0000f8f2
	swap.w	d2
	rol.w	#4,d2
	bsr.s	$0000f900
	rol.w	#4,d2
	bsr.s	$0000f900
	rol.w	#4,d2
	bsr.s	$0000f900
	rol.w	#4,d2
	move.w	d2,d1
	and.w	#$000f,d1
	cmp.w	#$000a,d1
	bcs.s	$0000f90e
	addq.w	#7,d1
	add.w	#$0030,d1
	move.b	d1,(a1)+
	clr.b	(a1)
	rts

L00f918:
	addq.w	#1,(L0116c4)
	cmpi.w	#$0001,(L0116c4)
L00f926:
	bne.s	$0000f98e
	bsr.w	L00fa0a
L00f92c:
	lea.l	(L0116a2),a1
	move.b	($00e8e001),d0
	move.w	d0,(a1)+
	lea.l	($00e82200),a0
	moveq.l	#$0f,d0
	move.w	(a0)+,(a1)+
	dbra.w	d0,$0000f942
	move.b	($00ed0028),($00e8e001)
	lea.l	($00e82200),a0
	move.w	($00ed002e),d1
	move.w	($00ed0034),d0
	move.w	d1,(a0)+
	move.w	d0,(a0)+
	move.w	d1,(a0)+
	move.w	d0,(a0)+
	moveq.l	#$02,d1
	move.w	d0,($0002,a0)
	addq.l	#8,a0
	dbra.w	d1,$0000f96e
	lea.l	(L011220),a1
	bsr.w	L00fa32
	lea.l	(L0116c6),a1
	move.l	d0,(a1)+
	moveq.l	#$17,d0
	bsr.s	$0000f9c2
	rts

L00f990:
	subq.w	#1,(L0116c4)
	bne.s	$0000f98e
	bsr.s	L00fa0a
	lea.l	(L0116a2),a1
	move.w	(a1)+,d0
	move.b	d0,($00e8e001)
	lea.l	($00e82200),a0
	moveq.l	#$0f,d0
	move.w	(a1)+,(a0)+
	dbra.w	d0,$0000f9b0
	lea.l	(L0116c6),a1
	bsr.w	$0000fa46
	moveq.l	#$18,d0
	move.w	(a1)+,d1
	move.w	(a1)+,d2
	move.l	(a1)+,d3
	movem.l	d0-d3,-(sp)
	lea.l	(L0116d2),a1
	movea.l	#$00e07816,a2
	bsr.s	$0000f9ea
	movem.l	(sp)+,d0-d3
	lea.l	(L011d52),a1
	movea.l	#$00e27816,a2
	cmpi.b	#$16,($00e80029)
	beq.s	$0000f9fa
	suba.l	#$00000010,a2
	move.w	d0,-(sp)
	IOCS	_B_CUROFF
	move.w	(sp)+,d0
	trap	#15
	IOCS	_B_CURON
	rts

L00fa0a:
	btst.b	#$04,($00e88001)
	bne.s	L00fa0a
	rts

L00fa16:
	IOCS	_ABORTRST
	IOCS	_B_KEYSNS
	tst.l	d0
	beq.s	$0000fa28
	clr.l	d0
	trap	#15
	bra.s	$0000fa1a

	clr.l	d0
	trap	#15
	tst.b	d0
	beq.s	$0000fa28
	rts

L00fa32:
	move.w	(a1)+,d1
	move.w	(a1)+,d2
	cmpi.b	#$16,($00e80029)
	beq.s	$0000fa4a
	sub.w	#$0010,d1
	bra.s	$0000fa4a

	move.w	(a1)+,d1
	move.w	(a1)+,d2
	IOCS	_B_LOCATE
	rts

L00fa50:
	.dc.l	L00fae8
L00fa54:
	.dc.b	$80,$24
	.dc.l	L00fa9e
L00fa5a:
	.dc.l	L00faa6
L00fa5e:
	link.w	a5,#$4c20
	move.l	-(a0),d0
	move.l	-(a0),d0
L00fa66:
	ori.b	#$00,d0
L00fa6a:
	.dc.l	L00fadc
	.dc.l	L00fae4
	.dc.l	L00fae4
	.dc.l	L00fae4
	.dc.l	L00fae4
	.dc.l	L00fae4
	.dc.l	L00fae4
	.dc.l	L00fae4
	.dc.l	L00fae4
	.dc.l	L00fae4
	.dc.l	L00fae4
	.dc.l	L00fae4
	.dc.l	L00fae4
L00fa9e:
	move.l	a5,(L00fa66)
	rts

L00faa6:
	movem.l	d0/a4-a5,-(sp)
L00faaa:
	movea.l	(L00fa66),a5
	lea.l	(L00fa6a),a4
	clr.l	d0
	move.b	($0002,a5),d0
	add.w	d0,d0
	add.w	d0,d0
	adda.l	d0,a4
	movea.l	(a4),a4
	jsr	(a4)
	move.b	d0,($0003,a5)
	lsr.w	#8,d0
	move.b	d0,($0004,a5)
	movem.l	(sp)+,d0/a4-a5
	rts

L00fad6:
	move.w	#$5003,d0
	rts

L00fadc:
	move.l	#L011090,($000e,a5)
L00fae4:
	clr.w	d0
	rts

L00fae8:
	.dc.l	L010694
	.dc.b	$80,$03
	.dc.l	L00fb36
	.dc.l	L00fb3e
L00faf6:
	.dc.b	$43,$4f,$4e,$20,$20,$20,$20,$20
L00fafe:
	ori.b	#$00,d0
L00fb02:
	.dc.l	L008184
	.dc.l	L00fad6
	.dc.l	L00fad6
	.dc.l	L00fad6
	.dc.l	L010146
	.dc.l	L01016a
	.dc.l	L010176
	.dc.l	L01017a
	.dc.l	L00fb52
	.dc.l	L00fb52
	.dc.l	L00fb72
	.dc.l	L00fae4
	.dc.l	L00fad6
L00fb36:
	move.l	a5,(L00fafe)
	rts

L00fb3e:
	movem.l	d0/a4-a5,-(sp)
L00fb42:
	movea.l	(L00fafe),a5
	lea.l	(L00fb02),a4
	bra.w	$0000fab6

L00fb52:
	movem.l	d1/d3/a1,-(sp)
	move.l	($0012,a5),d3
	beq.s	$0000fb6a
	movea.l	($000e,a5),a1
	clr.l	d1
	move.b	(a1)+,d1
	bsr.s	$0000fb76
	subq.l	#1,d3
	bne.s	$0000fb62
	movem.l	(sp)+,d1/d3/a1
	bra.w	L00fae4

L00fb72:
	bra.w	L00fae4

	IOCS	_B_PUTC
	rts

L00fb7c:
	move.b	(a0)+,d0
	cmp.b	#$5b,d0			;'['
	bne.s	$0000fbcc
	move.b	(a0)+,d0
	cmp.b	#$36,d0			;'6'
	bne.s	L00fbce
	cmpi.b	#$6e,(a0)		;'n'
	bne.s	$0000fbcc
	lea.l	(L01240a),a0
	move.l	a0,(L012406)
	move.b	#$1b,(a0)+
	move.b	#$5b,(a0)+		;'['
	movem.l	d1-d2,-(sp)
	moveq.l	#$ff,d1
	IOCS	_B_LOCATE
	move.l	d1,d2
	addq.w	#1,d1
	bsr.s	$0000fbf4
	move.b	#$3b,(a0)+		;';'
	move.l	d2,d1
	swap.w	d1
	addq.w	#1,d1
	bsr.s	$0000fbf4
	movem.l	(sp)+,d1-d2
	move.b	#$52,(a0)+		;'R'
	clr.b	(a0)
	rts

L00fbce:
	cmp.b	#$3e,d0			;'>'
	bne.s	$0000fbcc
	cmpi.b	#$31,(a0)+		;'1'
	bne.s	$0000fbcc
	move.b	(a0),d0
	cmp.b	#$68,d0			;'h'
	beq.s	$0000fbee
	cmp.b	#$6c,d0			;'l'
	bne.s	$0000fbcc
	clr.l	d1
	bra.w	L00fce6

	moveq.l	#$03,d1
	bra.w	L00fce6

	and.l	#$000000ff,d1
	divu.w	#$0064,d1
	tst.w	d1
	beq.s	$0000fc0a
	add.b	#$30,d1			;'0'
	move.b	d1,(a0)+
	clr.w	d1
	swap.w	d1
	divu.w	#$000a,d1
	tst.w	d1
	beq.s	$0000fc1a
	add.b	#$30,d1			;'0'
	move.b	d1,(a0)+
	swap.w	d1
	add.b	#$30,d1			;'0'
	move.b	d1,(a0)+
	rts

Call_CONCTRL:
	move.w	(a6)+,d1
	move.l	(a6),d2
	cmp.w	#$0013,d1
	bcc.s	$0000fc40
	asl.w	#2,d1
	lea.l	(L00fc44),a0
	movea.l	(a0,d1.w),a0
	move.l	d2,d1
	swap.w	d1
	jmp	(a0)

	moveq.l	#$ff,d0
	rts

L00fc44:
	.dc.l	L00fc90
	.dc.l	L00fc96
	.dc.l	L00fc9e
	.dc.l	L00fca4
	.dc.l	L00fcaa
	.dc.l	L00fcb0
	.dc.l	L00fcb6
	.dc.l	L00fcbc
	.dc.l	L00fcc2
	.dc.l	L00fcc8
	.dc.l	L00fcce
	.dc.l	L00fcd4
	.dc.l	L00fcda
	.dc.l	L00fce0
	.dc.l	L00fce6
	.dc.l	L00fd5a
	.dc.l	L00fda2
	.dc.l	L00fe10
	.dc.l	L00fe16
L00fc90:
	IOCS	_B_PUTC
	rts

L00fc96:
	movea.l	d2,a1
	IOCS	_B_PRINT
	rts

L00fc9e:
	IOCS	_B_COLOR
	rts

L00fca4:
	IOCS	_B_LOCATE
	rts

L00fcaa:
	IOCS	_B_DOWN_S
	rts

L00fcb0:
	IOCS	_B_UP_S
	rts

L00fcb6:
	IOCS	_B_UP
	rts

L00fcbc:
	IOCS	_B_DOWN
	rts

L00fcc2:
	IOCS	_B_RIGHT
	rts

L00fcc8:
	IOCS	_B_LEFT
	rts

L00fcce:
	IOCS	_B_CLR_ST
	rts

L00fcd4:
	IOCS	_B_ERA_ST
	rts

L00fcda:
	IOCS	_B_INS
	rts

L00fce0:
	IOCS	_B_DEL
	rts

L00fce6:
	clr.l	d0
	move.b	(L013a40),d0
	cmp.b	#$04,d1
	bcc.s	$0000fd46
	move.l	d0,-(sp)
	bsr.w	L010134
	move.l	(sp)+,d0
	cmp.b	#$02,d1
	bcs.s	$0000fd4e
	beq.s	L00fd48
	cmp.b	d0,d1
	beq.s	$0000fd46
	bsr.s	L00fd26
	movem.l	d0-d2,-(sp)
	moveq.l	#$ff,d1
	moveq.l	#$ff,d2
	IOCS	_B_CONSOL
	clr.l	d1
	move.w	#$001f,d2
	IOCS	_B_CONSOL
	movem.l	(sp)+,d0-d2
	rts

L00fd26:
	movem.l	d0-d5/a1,-(sp)
L00fd2a:
	move.b	d1,(L013a40)
L00fd30:
	lea.l	(L00fd58),a1
	moveq.l	#$03,d1
	clr.l	d2
	moveq.l	#$1f,d3
	moveq.l	#$7f,d4
	IOCS	_B_PUTMES
	movem.l	(sp)+,d0-d5/a1
	rts

L00fd48:
	bsr.w	L00fe56
	bra.s	L00fd26

	bsr.w	L00fe56
	bsr.s	L00fd26
	bra.w	$0000fe20

L00fd58:
	move.l	d0,d0
L00fd5a:
	move.w	d1,d0
	add.w	d2,d0
	cmp.w	#$0021,d0		;'!'
	bcc.w	$0000fc40
	cmpi.b	#$03,(L013a40)
	beq.s	$0000fd78
	cmp.w	#$0020,d0		;' '
	beq.w	$0000fc40
	asl.w	#4,d1
	and.l	#$0000ffff,d1
	subq.w	#1,d2
	movem.l	d1-d2,-(sp)
	moveq.l	#$2e,d0			;'.'
	moveq.l	#$ff,d1
	moveq.l	#$ff,d2
	trap	#15
	swap.w	d2
	move.w	d2,d0
	movem.l	(sp)+,d1-d2
	swap.w	d2
	move.w	d0,d2
	swap.w	d2
	IOCS	_B_CONSOL
	rts

L00fda2:
	clr.l	d0
	move.b	(L013a41),d0
	cmp.w	#$0006,d1
	bcc.s	$0000fe02
	move.l	d0,-(sp)
	bsr.w	L010134
	move.b	d1,(L013a41)
	add.w	d1,d1
	lea.l	(L00fe04),a0
	move.w	(a0,d1.w),d1
	move.w	d1,-(sp)
	and.w	#$00ff,d1
	IOCS	_CRTMOD
	move.w	(sp)+,d0
	bpl.s	$0000fddc
	move.w	#$0090,d0
	trap	#15
	moveq.l	#$2e,d0			;'.'
	moveq.l	#$ff,d1
	moveq.l	#$ff,d2
	trap	#15
	cmpi.b	#$03,(L013a40)
	beq.s	$0000fdf0
	subq.l	#1,d2
	IOCS	_B_CONSOL
	cmpi.b	#$02,(L013a40)
	bcc.s	$0000fe00
	bsr.s	$0000fe20
	move.l	(sp)+,d0
	rts

L00fe04:
	.dc.b	$00,$10,$ff,$10,$00,$04,$ff,$04
	.dc.b	$ff,$08,$ff,$0c
L00fe10:
	IOCS	_OS_CURON
	rts

L00fe16:
	IOCS	_OS_CUROF
	rts

L00fe1c:
	bsr.w	L010134
	movem.l	d0/a6,-(sp)
	cmpi.b	#$03,(L013a40)
	beq.s	L00fe50
	lea.l	(L013a42),a6
	clr.w	d0
	move.b	(L013a40),d0
	beq.s	L00fe4e
	cmp.b	#$01,d0
	bne.s	L00fe50
	adda.l	#$00000140,a6
	move.b	#$2a,d0			;'*'
L00fe4e:
	bsr.s	L00fea4
L00fe50:
	movem.l	(sp)+,d0/a6
	rts

L00fe56:
	movem.l	d0,-(sp)
	cmp.b	#$03,d0
	bcs.s	$0000fe9e
	movem.l	d1-d3,-(sp)
	cmpi.b	#$03,(L013a40)
	bne.s	$0000fe88
	moveq.l	#$ff,d1
	IOCS	_B_LOCATE
	move.l	d0,d3
	cmp.w	#$001f,d3
	bne.s	$0000fe82
	IOCS	_B_DOWN_S
	subq.w	#1,d3
	move.l	d3,d1
	IOCS	_B_LOCATE
	moveq.l	#$ff,d1
	moveq.l	#$ff,d2
	IOCS	_B_CONSOL
	clr.l	d1
	move.w	#$001e,d2
	IOCS	_B_CONSOL
	movem.l	(sp)+,d1-d3
	movem.l	(sp)+,d0
	rts

L00fea4:
	movem.l	d0-d7/a0-a5,-(sp)
	clr.w	-(sp)
	movea.l	sp,a1
	move.b	d0,(a1)
	moveq.l	#$03,d1
	clr.l	d2
	moveq.l	#$1f,d3
	moveq.l	#$00,d4
	IOCS	_B_PUTMES
	addq.l	#2,sp
	move.w	#$0004,d7
	moveq.l	#$02,d5
	bsr.s	L00fede
	move.w	#$0004,d7
	moveq.l	#$32,d5			;'2'
	cmpi.b	#$16,($00e80029)
	beq.s	L00fed6
	moveq.l	#$21,d5			;'!'
L00fed6:
	bsr.s	L00fede
	movem.l	(sp)+,d0-d7/a0-a5
	rts

L00fede:
	movea.l	a6,a1
	moveq.l	#$0b,d1
	clr.l	d2
	move.w	d5,d2
	moveq.l	#$1f,d3
	moveq.l	#$07,d4
	cmpi.b	#$16,($00e80029)
	beq.s	L00fef6
	moveq.l	#$04,d4
L00fef6:
	IOCS	_B_PUTMES
	addq.w	#1,d2
	move.w	d2,d5
	lea.l	($0020,a6),a6
	dbra.w	d7,L00fede
	rts

Call_HENDSP:
	move.w	(a6)+,d0
	cmp.w	#$000c,d0
	bcc.s	$0000ff1e
	asl.w	#2,d0
	lea.l	(L00ff22),a0
	movea.l	(a0,d0.w),a0
	jmp	(a0)

	moveq.l	#$ff,d0
	rts

L00ff22:
	.dc.l	L00ff52
	.dc.l	L00ff60
	.dc.l	L00ff64
	.dc.l	L00ffa8
	.dc.l	L00ffae
	.dc.l	L00ffbe
	.dc.l	L00ffc2
	.dc.l	L00ffd8
	.dc.l	L010020
	.dc.l	L010038
	.dc.l	L01003c
	.dc.l	L010056
L00ff52:
	moveq.l	#$17,d0
	bsr.w	L01005c
	bsr.w	L0100c8
	moveq.l	#$10,d0
	rts

L00ff60:
	moveq.l	#$03,d1
	bra.s	$0000ff66

L00ff64:
	moveq.l	#$0b,d1
	moveq.l	#$10,d4
	moveq.l	#$50,d7			;'P'
	cmpi.b	#$16,($00e80029)
	beq.s	$0000ff76
	moveq.l	#$30,d7			;'0'
	clr.l	d2
	clr.l	d3
	move.w	(a6)+,d2
	sub.w	d2,d4
	bcs.s	$0000ffa0
	add.w	d7,d2
	move.w	#$001f,d3
	movea.l	(a6),a1
	moveq.l	#$ff,d0
	addq.l	#1,d0
	tst.b	(a1)+
	bne.s	$0000ff8a
	cmp.w	d0,d4
	bcs.s	$0000ff96
	move.w	d0,d4
	subq.w	#1,d4
	bmi.s	$0000ffa0
	movea.l	(a6),a1
	IOCS	_B_PUTMES
	clr.l	d0
	move.w	d2,d0
	sub.w	d7,d0
	rts

L00ffa8:
	moveq.l	#$18,d0
	bra.w	L01005c

L00ffae:
	moveq.l	#$50,d0			;'P'
	cmpi.b	#$16,($00e80029)
	beq.s	$0000ffbc
	moveq.l	#$30,d0			;'0'
	rts

L00ffbe:
	moveq.l	#$03,d1
	bra.s	$0000ffc4

L00ffc2:
	moveq.l	#$0b,d1
	moveq.l	#$00,d7
	move.w	#$0050,d4		;'P'
	cmpi.b	#$16,($00e80029)
	beq.s	$0000ff76
	moveq.l	#$30,d4			;'0'
	bra.s	$0000ff76

L00ffd8:
	clr.l	d5
	move.w	(a6),d5
	moveq.l	#$4f,d4			;'O'
	cmpi.b	#$16,($00e80029)
	beq.s	$0000ffea
	moveq.l	#$2f,d4			;'/'
	sub.l	d5,d4
	bcs.s	$0001001e
	move.w	#$000f,d2
	moveq.l	#$7f,d3
	sub.l	d4,d3
	lea.l	($00e0f800),a2
	adda.l	d5,a2
	movem.l	d0-d3,-(sp)
	bsr.s	$00010010
	movem.l	(sp)+,d0-d3
	lea.l	($00e2f800),a2
	adda.l	d5,a2
	move.w	d4,d1
	clr.b	(a2)+
	dbra.w	d1,$00010012
	adda.l	d3,a2
	dbra.w	d2,$00010010
	rts

L010020:
	moveq.l	#$17,d0
	bsr.s	L01008c
	bsr.w	L0100f6
	moveq.l	#$50,d0			;'P'
	cmpi.b	#$16,($00e80029)
	beq.s	$00010036
	moveq.l	#$30,d0			;'0'
	rts

L010038:
	moveq.l	#$01,d1
	bra.s	$0001003e

L01003c:
	moveq.l	#$09,d1
	moveq.l	#$00,d7
L010040:
	move.w	#$0050,d4		;'P'
	cmpi.b	#$16,($00e80029)
	beq.w	$0000ff76
	moveq.l	#$30,d4			;'0'
	bra.w	$0000ff76

L010056:
	moveq.l	#$18,d0
	bsr.s	L01008c
	rts

L01005c:
	move.w	#$005f,d1		;'_'
	move.w	#$000f,d2
	moveq.l	#$20,d3			;' '
	lea.l	(L012440),a1
	lea.l	($00e0f800),a2
	movem.l	d0-d3,-(sp)
	trap	#15
	movem.l	(sp)+,d0-d3
	lea.l	(L012a40),a1
	lea.l	($00e2f800),a2
	trap	#15
	rts

L01008c:
	moveq.l	#$4f,d1			;'O'
	cmpi.b	#$16,($00e80029)
	beq.s	$0001009a
	moveq.l	#$2f,d1			;'/'
	move.w	#$000f,d2
	moveq.l	#$7f,d3
	sub.l	d1,d3
	lea.l	(L013040),a1
	lea.l	($00e0f800),a2
	movem.l	d0-d3,-(sp)
	trap	#15
	movem.l	(sp)+,d0-d3
	lea.l	(L013540),a1
	lea.l	($00e2f800),a2
	trap	#15
	rts

L0100c8:
	move.w	#$000f,d2
	moveq.l	#$20,d3			;' '
	lea.l	($00e0f800),a2
	movem.l	d0-d3,-(sp)
	bsr.s	$000100e4
	movem.l	(sp)+,d0-d3
	lea.l	($00e2f800),a2
	move.w	#$0017,d1
	clr.l	(a2)+
	dbra.w	d1,$000100e8
	adda.l	d3,a2
	dbra.w	d2,$000100e4
	rts

L0100f6:
	moveq.l	#$13,d1
	moveq.l	#$30,d3			;'0'
	cmpi.b	#$16,($00e80029)
	beq.s	$00010108
	moveq.l	#$0b,d1
	moveq.l	#$50,d3			;'P'
	move.w	#$000f,d2
	lea.l	($00e0f800),a2
	movem.l	d0-d3,-(sp)
	bsr.s	$00010122
	movem.l	(sp)+,d0-d3
	lea.l	($00e2f800),a2
	move.w	d1,-(sp)
	clr.l	(a2)+
	dbra.w	d1,$00010124
	move.w	(sp)+,d1
	adda.l	d3,a2
	dbra.w	d2,$00010122
	rts

L010134:
	move.l	#$00000000,-(sp)
	move.l	#$00000001,-(sp)
	DOS	_KNJCTRL
	addq.l	#8,sp
	rts

L010146:
	movem.l	d3/a1,-(sp)
	move.l	($0012,a5),d3
	beq.s	$00010162
	movea.l	($000e,a5),a1
	bsr.w	L0101f8
	tst.b	d0
	beq.s	$00010154
	move.b	d0,(a1)+
	subq.l	#1,d3
	bne.s	$00010154
	movem.l	(sp)+,d3/a1
	bra.w	L00fae4

L01016a:
	bsr.w	L01021c
	move.b	d0,($000d,a5)
	bra.w	L00fae4

L010176:
	bra.w	L00fae4

L01017a:
	bsr.w	L01021c
	tst.b	d0
	beq.w	L00fae4
	bsr.s	L0101f8
	bra.s	L01017a

Call_FNCKEY:
	move.b	(a6)+,d2
	clr.l	d1
	move.b	(a6)+,d1
	movea.l	(a6),a1
	bsr.s	L0101c2
	beq.s	L0101ba
	tst.b	d2
	beq.s	L0101b0
	move.w	d3,d0
	move.b	(a1)+,(a0)+
	dbra.w	d3,$0001019a
	cmp.w	#$0005,d0
	beq.s	$000101ac
	bsr.s	L010134
	bsr.w	L00fe1c
	clr.l	d0
	rts

L0101b0:
	move.b	(a0)+,(a1)+
	dbra.w	d3,L0101b0
	clr.l	d0
	rts

L0101ba:
	moveq.l	#$ff,d0
	rts

Call_KNJCTRL:
	moveq.l	#$ff,d0
	rts

L0101c2:
	lea.l	(L013a42),a0
	move.w	#$02c7,d3
	subq.w	#1,d1
	bmi.s	$000101f4
	moveq.l	#$20,d3			;' '
	cmp.w	#$0014,d1
	bcs.s	L0101ee
	sub.w	#$0014,d1
	lea.l	(L013cc2),a0
	moveq.l	#$06,d3
	cmp.w	#$000c,d1
	bcs.s	L0101ee
	clr.w	d3
	rts

L0101ee:
	mulu.w	d3,d1
	adda.l	d1,a0
	subq.w	#1,d3
	tst.w	d3
	rts

L0101f8:
	bsr.s	L01021c
	tst.b	d0
L0101fc:
	beq.s	L010218
	movem.l	a0,-(sp)
	movea.l	(L012406),a0
	clr.l	d0
	move.b	(a0)+,d0
	move.l	a0,(L012406)
	movem.l	(sp)+,a0
	rts

L010218:
	clr.l	d0
	rts

L01021c:
	movem.l	a0,-(sp)
	clr.l	d0
	movea.l	(L012406),a0
	move.b	(a0),d0
	bne.s	$00010238
	IOCS	_B_KEYSNS
	tst.l	d0
	beq.s	$00010238
	bsr.s	L01023e
	bra.s	$00010220

	movem.l	(sp)+,a0
	rts

L01023e:
	lea.l	(L01240a),a0
	move.l	a0,(L012406)
	clr.b	(a0)
	IOCS	_B_SFTSNS
	move.w	d0,(L01242c)
	btst.l	#$06,d0
	bne.w	L010366
	btst.l	#$0e,d0
	bne.w	L0102e6
	btst.l	#$0d,d0
	bne.s	L01029c
	bsr.w	L01040a
	tst.b	d0
	bne.s	$00010296
	tst.b	(L01243e)
	beq.w	L010490
	movem.l	d0/a1,-(sp)
	lea.l	(L012436),a1
	move.b	(a1)+,(a0)+
	bne.s	$00010288
	subq.l	#1,a0
	movem.l	(sp)+,d0/a1
	bra.w	L010490

	move.b	d0,(a0)+
	clr.b	(a0)
	rts

L01029c:
	bsr.w	L01040a
	tst.b	d0
	bne.s	$000102ca
	tst.b	(L01243e)
	beq.w	L010490
	movem.l	d0/a1,-(sp)
	lea.l	(L012436),a1
	move.b	(a1)+,d0
	beq.s	$000102c0
	bsr.s	$000102ca
	bra.s	$000102b8

	clr.b	(a0)
	movem.l	(sp)+,d0/a1
	bra.w	L010490

	cmp.b	#$a6,d0
	bcs.s	$00010296
	cmp.b	#$b0,d0
	beq.s	$00010296
	cmp.b	#$de,d0
	bcc.s	$00010296
	move.b	#$80,(a0)+
	move.b	d0,(a0)+
	clr.b	(a0)
	rts

L0102e6:
	bsr.w	L01040a
	tst.b	d0
	bne.s	$0001032e
	tst.b	(L01243e)
	beq.w	L010490
	movem.l	d0/a1,-(sp)
	lea.l	(L012436),a1
	move.b	(a1)+,d0
	tst.b	d0
	beq.s	$00010324
	bsr.s	$0001032e
	move.b	(a1)+,d0
	cmp.b	#$de,d0
	beq.s	$0001031e
	cmp.b	#$df,d0
	bne.s	$00010304
	bsr.w	L0105dc
	bra.s	$00010302

	bsr.w	L01061a
	bra.s	$00010302

	clr.b	(a0)
	movem.l	(sp)+,d0/a1
	bra.w	L010490

	cmp.b	#$20,d0			;' '
	bcs.w	$00010296
	cmp.b	#$7f,d0
	beq.w	$00010296
	move.l	d1,-(sp)
	clr.l	d1
	move.b	d0,d1
	btst.b	#$05,(L01242c)
	bne.s	$00010354
	add.l	#$00010000,d1
	bsr.w	L0105d6
	move.w	d0,d1
	ror.w	#8,d0
	move.b	d0,(a0)+
	move.b	d1,(a0)+
	clr.b	(a0)
	move.l	(sp)+,d1
	rts

L010366:
	IOCS	_B_KEYINP
	tst.b	d0
	bne.s	$00010376
	bsr.w	L010490
	bra.w	$000103f8

	cmp.b	#$20,d0			;' '
	bcs.s	$000103f4
	cmp.b	#$7f,d0
	beq.s	$000103f4
	cmp.b	#$30,d0			;'0'
	bcs.s	$000103f8
	cmp.b	#$3a,d0			;':'
	bcs.s	$0001039c
	cmp.b	#$41,d0			;'A'
	bcs.s	$000103f8
	cmp.b	#$47,d0			;'G'
	bcc.s	$000103f8
	subq.w	#7,d0
	sub.w	#$0030,d0
	move.w	d1,-(sp)
	move.w	(L01242a),d1
L0103a8:
	asl.w	#4,d1
	or.b	d0,d1
L0103ac:
	move.w	d1,(L01242a)
	addq.b	#1,(L01243f)
	cmpi.b	#$04,(L01243f)
	bne.s	L010406
	cmp.w	#$0100,d1
	bcs.s	$000103f0
	cmp.w	#$f600,d1
	bcc.s	$000103e2
	cmp.w	#$f000,d1
	bcc.s	$000103ea
	cmp.w	#$8100,d1
	bcc.s	$000103e2
	cmp.w	#$8000,d1
	bcc.s	$000103ea
	bra.s	$000103e6

	bsr.w	L0105d0
	bsr.w	L0105ca
	move.w	d1,d0
	ror.w	#8,d0
	move.b	d0,(a0)+
	move.b	d1,d0
	move.w	(sp)+,d1
	move.b	d0,(a0)+
	clr.b	(a0)
	clr.b	(L01243f)
	clr.w	(L01242a)
	rts

L010406:
	move.w	(sp)+,d1
	rts

L01040a:
	clr.b	(L01243e)
	btst.l	#$05,d0
	beq.s	L010488
	IOCS	_B_KEYINP
	cmp.w	#$7000,d0
	bcc.s	$0001042c
	tst.b	d0
	bne.s	L010430
	move.w	d0,-(sp)
	clr.w	d0
	bsr.s	L01045e
	move.w	(sp)+,d0
	tst.b	d0
	rts

L010430:
	cmp.w	#$4000,d0
L010434:
	bcs.s	L01045e
	cmp.w	#$5200,d0
L01043a:
	bcc.s	L01045e
	movem.l	a2,-(sp)
	move.w	d0,-(sp)
	bsr.s	L01045e
	lea.l	(L012436),a2
	move.b	(L01243e),d0
	adda.l	d0,a2
	move.w	(sp)+,d0
	move.b	d0,-(a2)
	movem.l	(sp)+,a2
	clr.l	d0
	rts

L01045e:
	movem.l	d1/a1-a2,-(sp)
	lea.l	(L01242e),a1
	lea.l	(L012436),a2
	move.b	d0,d1
	IOCS	_RMACNV
	tst.l	d0
	beq.s	$00010480
	bmi.s	$00010480
	move.b	d0,(L01243e)
	movem.l	(sp)+,d1/a1-a2
	clr.l	d0
	rts

L010488:
	IOCS	_B_KEYINP
	tst.b	d0
	rts

L010490:
	lsr.w	#8,d0
	cmp.b	#$70,d0			;'p'
	bcc.s	$000104a4
	cmp.b	#$5a,d0			;'Z'
	bcs.s	$000104a6
	cmp.b	#$61,d0			;'a'
	bcc.s	$000104a6
	nop
	movem.l	a1,-(sp)
	movea.l	a0,a1
	bsr.s	L0104cc
	bmi.s	$000104c4
	cmpi.b	#$fe,(a0)
	bne.s	$000104bc
	addq.l	#8,a0
	subq.w	#8,d0
	bmi.s	$000104c4
	move.b	(a0)+,(a1)+
	dbeq.w	d0,$000104bc
	subq.l	#1,a1
	movea.l	a1,a0
	movem.l	(sp)+,a1
	rts

L0104cc:
	movem.l	d1/d3,-(sp)
	lea.l	(L0123f0),a0
	moveq.l	#$15,d1
	cmp.b	(a0)+,d0
	dbeq.w	d1,$000104d8
	beq.s	L0104e8
	movem.l	(sp)+,d1/d3
	moveq.l	#$ff,d0
	rts

L0104e8:
	moveq.l	#$16,d0
	sub.w	d1,d0
	move.w	d0,d1
	cmp.w	#$000b,d1
	bcs.s	L010504
	add.w	#$000a,d1
	bsr.w	L0101c2
	move.l	d3,d0
	movem.l	(sp)+,d1/d3
	rts

L010504:
	.dc.b	$70,$02,$4e,$4f,$08,$00,$00,$01
	.dc.b	$66,$0c,$08,$00,$00,$00,$67,$e4
	.dc.b	$d2,$7c,$00,$0a,$60,$de,$b2,$7c
	.dc.b	$00,$05,$65,$48,$67,$2a,$b2,$7c
	.dc.b	$00,$07,$66,$b8,$48,$e7,$2f,$fe
	.dc.b	$42,$81,$12,$39
	.dc.l	L013a40
	.dc.b	$52,$01,$c2,$3c,$00,$03,$b2,$3c
	.dc.b	$00,$03,$66,$02,$42,$81,$61,$00
	.dc.b	$f7,$a2,$4c,$df,$7f,$f4,$60,$94
	.dc.b	$ff,$0d,$42,$a7,$3f,$3c,$0f,$03
	.dc.b	$ff,$ab,$3e,$bc,$0f,$02,$ff,$ab
	.dc.b	$3e,$bc,$0f,$01,$ff,$ab,$5c,$8f
	.dc.b	$60,$00,$ff,$7a,$82,$7c,$01,$00
	.dc.b	$3f,$01,$ff,$0f,$54,$8f,$60,$00
	.dc.b	$ff,$6c
Call_KEYCTRL:
	move.w	(a6)+,d0
	move.w	(a6),d1
	cmp.w	#$0005,d0
	bcc.w	$0000fc40
	asl.w	#2,d0
	lea.l	(L010590),a0
	movea.l	(a0,d0.w),a0
	jmp	(a0)

L010590:
	.dc.l	L0101f8
	.dc.l	L01021c
	.dc.l	L0105a4
	.dc.l	L0105b0
	.dc.l	L0105b6
L0105a4:
	IOCS	_B_SFTSNS
	move.l	d0,d1
	lsr.w	#4,d0
	move.b	d1,d0
	rts

L0105b0:
	IOCS	_BITSNS
	rts

L0105b6:
	move.w	d1,d0
	movem.l	d1-d2,-(sp)
	move.l	d0,d2
	moveq.l	#$04,d1
	IOCS	_LEDMOD
	movem.l	(sp)+,d1-d2
	rts

L0105ca:
	IOCS	_JISSFT
	rts

L0105d0:
	IOCS	_SFTJIS
	rts

L0105d6:
	IOCS	_AKCONV
	rts

L0105dc:
	move.b	(-$0002,a0),d0
	rol.w	#8,d0
	move.b	(-$0001,a0),d0
	cmp.w	#$829f,d0
	bcs.s	L01060e
	cmp.w	#$82fd,d0
	bcs.s	$00010604
	cmp.w	#$839f,d0
	bcc.s	L01060e
	cmp.b	#$7f,d0
	bcs.s	$00010600
	subq.b	#1,d0
	add.b	#$5f,d0			;'_'
	bsr.s	L01066a
	bne.s	L01060e
	addq.b	#2,(-$0001,a0)
	rts

L01060e:
	move.b	#$81,(a0)+
	move.b	#$4b,(a0)+		;'K'
	clr.b	(a0)
	rts

L01061a:
	move.b	(-$0002,a0),d0
	rol.w	#8,d0
	move.b	(-$0001,a0),d0
	cmp.w	#$829f,d0
	bcs.s	L010656
	cmp.w	#$82fd,d0
	bcs.s	$00010648
	cmp.w	#$839f,d0
	bcc.s	L010656
	cmp.b	#$7f,d0
	bcs.s	$0001063e
	subq.b	#1,d0
	add.b	#$5f,d0			;'_'
	cmp.b	#$a4,d0
	beq.s	L010662
	bsr.s	L010686
	beq.s	$00010650
	bsr.s	L01066a
	bne.s	L010656
	addq.b	#1,(-$0001,a0)
	rts

L010656:
	move.b	#$81,(a0)+
	move.b	#$4a,(a0)+		;'J'
	clr.b	(a0)
	rts

L010662:
	move.b	#$94,(-$0001,a0)
	rts

L01066a:
	movem.l	d1/a1,-(sp)
	lea.l	(L0123eb),a1
	moveq.l	#$04,d1
	cmp.b	(a1)+,d0
	dbeq.w	d1,$00010676
	beq.s	$00010680
	tst.w	d1
	movem.l	(sp)+,d1/a1
	rts

L010686:
	movem.l	d1/a1,-(sp)
	lea.l	(L0123dc),a1
	moveq.l	#$0e,d1
	bra.s	$00010676

L010694:
	.dc.l	L01076e
	.dc.b	$80,$00
	.dc.l	L0106e2
	.dc.l	L0106ea
L0106a2:
	.dc.b	'AUX     '
L0106aa:
	.dc.b	$00,$00,$00,$00
L0106ae:
	.dc.l	L0081d0
	.dc.l	L00fad6
	.dc.l	L00fad6
	.dc.l	L00fad6
	.dc.l	L0106fe
	.dc.l	L01071e
	.dc.l	L01072a
	.dc.l	L01072e
	.dc.l	L01073e
	.dc.l	L01073e
	.dc.l	L010760
	.dc.l	L00fae4
	.dc.l	L00fad6
L0106e2:
	move.l	a5,(L0106aa)
	rts

L0106ea:
	movem.l	d0/a4-a5,-(sp)
L0106ee:
	movea.l	(L0106aa),a5
	lea.l	(L0106ae),a4
	bra.w	$0000fab6

L0106fe:
	movem.l	d3/a1,-(sp)
	move.l	($0012,a5),d3
	beq.s	$00010716
	movea.l	($000e,a5),a1
	IOCS	_INP232C
	move.b	d0,(a1)+
	subq.l	#1,d3
	bne.s	$0001070c
	movem.l	(sp)+,d3/a1
	bra.w	L00fae4

L01071e:
	IOCS	_ISNS232C
	move.b	d0,($000d,a5)
	bra.w	L00fae4

L01072a:
	bra.w	L00fae4

L01072e:
	IOCS	_ISNS232C
	tst.l	d0
	beq.w	L00fae4
	IOCS	_INP232C
	bra.s	L01072e

L01073e:
	movem.l	d1/d3/a1,-(sp)
	move.l	($0012,a5),d3
	beq.s	$00010758
	movea.l	($000e,a5),a1
	clr.l	d1
	move.b	(a1)+,d1
	IOCS	_OUT232C
	subq.l	#1,d3
	bne.s	$0001074e
	movem.l	(sp)+,d1/d3/a1
	bra.w	L00fae4

L010760:
	IOCS	_OSNS232C
	tst.b	d0
L010766:
	bne.w	L00fae4
	moveq.l	#$01,d0
	rts

L01076e:
	.dc.l	L0107d8
	.dc.b	$80,$00
	.dc.l	L0107bc
	.dc.l	L0107c4
PrnStr:
	.dc.b	'PRN     '
L010784:
	.dc.b	$00,$00,$00,$00
L010788:
	.dc.l	L0081c6
	.dc.l	L00fad6
	.dc.l	L00fad6
	.dc.l	L00fad6
	.dc.l	L00fad6
	.dc.l	L00fad6
	.dc.l	L00fad6
	.dc.l	L00fad6
	.dc.l	L010842
	.dc.l	L010842
	.dc.l	L010880
	.dc.l	L00fae4
	.dc.l	L00fad6
L0107bc:
	move.l	a5,(L010784)
	rts

L0107c4:
	movem.l	d0/a4-a5,-(sp)
L0107c8:
	movea.l	(L010784),a5
	lea.l	(L010788),a4
	bra.w	$0000fab6

L0107d8:
	.dc.l	L01088e
	.dc.b	$80,$00
	.dc.l	L010826
	.dc.l	L01082e
LptStr:
	.dc.b	'LPT     '
L0107ee:
	.dc.b	$00,$00,$00,$00
L0107f2:
	.dc.l	L0081c6
	.dc.l	L00fad6
	.dc.l	L00fad6
	.dc.l	L00fad6
	.dc.l	L00fad6
	.dc.l	L00fad6
	.dc.l	L00fad6
	.dc.l	L00fad6
	.dc.l	L010864
	.dc.l	L010864
	.dc.l	L010880
	.dc.l	L00fae4
	.dc.l	L00fad6
L010826:
	move.l	a5,(L0107ee)
	rts

L01082e:
	movem.l	d0/a4-a5,-(sp)
	movea.l	(L0107ee),a5
	lea.l	(L0107f2),a4
	bra.w	$0000fab6

L010842:
	movem.l	d1/d3/a1,-(sp)
	move.l	($0012,a5),d3
	beq.s	$0001085c
	movea.l	($000e,a5),a1
	clr.w	d1
	move.b	(a1)+,d1
	IOCS	_OUTPRN
	subq.l	#1,d3
	bne.s	$00010850
	movem.l	(sp)+,d1/d3/a1
	bra.w	L00fae4

L010864:
	movem.l	d1/d3/a1,-(sp)
	move.l	($0012,a5),d3
	beq.s	$0001085c
	movea.l	($000e,a5),a1
	clr.w	d1
	move.b	(a1)+,d1
	IOCS	_OUTLPT
	subq.l	#1,d3
	bne.s	$00010872
	bra.s	$0001085c

L010880:
	IOCS	_SNSPRN
	tst.b	d0
L010886:
	bne.w	L00fae4
	moveq.l	#$01,d0
	rts

L01088e:
	.dc.w	$ffff,$ffff,$8008
	.dc.l	L0108dc
	.dc.l	L0108e4
ClockStr:
	.dc.b	'CLOCK   '
L0108a4:
	.dc.b	$00,$00,$00,$00
L0108a8:
	.dc.l	L00fadc
	.dc.l	L00fae4
	.dc.l	L00fae4
	.dc.l	L00fae4
	.dc.l	L0108f8
	.dc.l	L00fae4
	.dc.l	L00fae4
	.dc.l	L00fae4
	.dc.l	L010934
	.dc.l	L010934
	.dc.l	L00fae4
	.dc.l	L00fae4
	.dc.l	L00fae4
L0108dc:
	move.l	a5,(L0108a4)
	rts

L0108e4:
	movem.l	d0/a4-a5,-(sp)
	movea.l	(L0108a4),a5
	lea.l	(L0108a8),a4
	bra.w	$0000fab6

L0108f8:
	movem.l	d1,-(sp)
	move.l	($0016,a5),d0
	beq.s	$0001090e
	IOCS	_TIMEGET
	move.l	d0,d1
	IOCS	_TIMEBIN
	bra.s	$00010918

	IOCS	_DATEGET
	move.l	d0,d1
	IOCS	_DATEBIN
	movea.l	($000e,a5),a4
	rol.l	#8,d0
	move.b	d0,(a4)+
	rol.l	#8,d0
	move.b	d0,(a4)+
	rol.l	#8,d0
	move.b	d0,(a4)+
	rol.l	#8,d0
	move.b	d0,(a4)
	movem.l	(sp)+,d1
	bra.w	L00fae4

L010934:
	movem.l	d1,-(sp)
	movea.l	($000e,a5),a4
	move.b	(a4)+,d1
	rol.l	#8,d1
	move.b	(a4)+,d1
	rol.l	#8,d1
	move.b	(a4)+,d1
	rol.l	#8,d1
	move.b	(a4)+,d1
	move.l	($0016,a5),d0
	beq.s	$00010960
	IOCS	_TIMEBCD
	move.l	d0,d1
	bmi.s	$0001096e
	IOCS	_TIMESET
	clr.l	d0
	bra.s	$0001096e

	IOCS	_DATEBCD
	move.l	d0,d1
	bmi.s	$0001096e
	IOCS	_DATESET
	clr.l	d0
	movem.l	(sp)+,d1
	tst.l	d0
	beq.w	L00fae4
	move.w	#$050c,d0
	rts

L01097e:
	.dc.w	$ffff,$ffff,$4040
	.dc.l	L0109f4
	.dc.l	L0109fc
L01098c:
	subi.w	#$4953,d4
	chk.l	($44,a2,d4.l),d5
L010994:
	jmp	(L010c1c)

	jmp	(L010a46)

L0109a0:
	.dc.l	$00000000
L0109a4:
	.dc.l	L007fac
	.dc.l	L010a8a
	.dc.l	L010ab8
	.dc.l	L010a10
	.dc.l	L010b6a
	.dc.l	L010d6a
	.dc.l	L00fae4
	.dc.l	L00fae4
	.dc.l	L010b70
	.dc.l	L010b76
	.dc.l	L00fae4
	.dc.l	L00fae4
	.dc.l	L010a2e
	.dc.l	L00fae4
	.dc.l	L00fae4
	.dc.l	L00fae4
	.dc.l	L00fae4
	.dc.l	L00fae4
	.dc.l	L00fae4
	.dc.l	L010ae0
L0109f4:
	move.l	a5,(L0109a0)
	rts

L0109fc:
	movem.l	d0/a4-a5,-(sp)
	movea.l	(L0109a0),a5
	lea.l	(L0109a4),a4
	bra.w	$0000fab6

L010a10:
	movem.l	a6,-(sp)
	movea.l	($000e,a5),a4
	lea.l	(L010994),a6
	moveq.l	#$05,d0
	move.w	(a6)+,(a4)+
	dbra.w	d0,$00010a20
	movem.l	(sp)+,a6
	bra.w	L00fae4

L010a2e:
	movem.l	a6,-(sp)
	movea.l	($000e,a5),a6
	lea.l	(L010994),a4
	moveq.l	#$02,d0
	bra.s	$00010a20

L010a40:
	move.b	d3,(L01098c)
L010a46:
	move.l	#$ffffffff,($00010a62)
	rts

L010a52:
	.dc.l	L010a66
	.dc.l	L010a66
	.dc.l	L010a66
	.dc.l	L010a66
	.dc.l	$ffffffff
L010a66:
	.dc.w	$0400,$0102,$0001,$00c0
	.dc.w	$04d0,$fe02,$0008,$0002
	.dc.w	$90ff
L010a78:
	.dc.w	$0200,$0102,$0001,$00e0
	.dc.w	$0960,$fd07,$000f,$0002
	.dc.w	$90ff
L010a8a:
	movem.l	d1-d2/a6,-(sp)
L010a8e:
	bsr.w	L010c0c
	clr.l	d1
	move.b	($0001,a5),d1
	or.b	#$90,d1
	asl.w	#8,d1
	moveq.l	#$08,d2
	IOCS	_B_DRVCHK
	move.b	(a6),d1
	beq.s	$00010aaa
	move.b	d1,d0
	move.b	d0,($000e,a5)
	clr.b	(a6)
	movem.l	(sp)+,d1-d2/a6
	bra.w	L00fae4

L010ab8:
	movem.l	a0/a6,-(sp)
	bsr.w	L010bf8
	move.b	($0001,a5),d0
	bsr.w	L010994
	move.b	($000a,a0),d0
	cmp.b	($000d,a5),d0
	beq.s	$00010ad8
	move.l	a0,(a6)
	move.l	a6,($0012,a5)
	movem.l	(sp)+,a0/a6
	bra.w	L00fae4

L010ae0:
	move.w	($0012,a5),d0
	beq.s	$00010b50
	cmp.w	#$0001,d0
	beq.s	$00010b20
	cmp.w	#$0002,d0
	beq.s	$00010b10
	cmp.w	#$ffff,d0
	bne.w	L00fad6
	movem.l	a0/a6,-(sp)
	movea.l	($000e,a5),a6
	move.l	#$4449534b,(a6)+	;'DISK'
	move.l	#$64657631,(a6)		;'dev1'
	bra.s	$00010ad8

	movem.l	a0/a6,-(sp)
	bsr.w	L010c0c
	move.l	($000e,a5),d0
	move.b	d0,(a6)
	bra.s	$00010ad8

	movem.l	a0/a6,-(sp)
	bsr.w	L010bf8
	move.b	($0001,a5),d0
	bsr.w	L010994
	movea.l	a0,a6
	movea.l	($000e,a5),a0
	move.l	d0,(a0)+
	moveq.l	#$0b,d0
	move.b	(a6)+,(a0)+
	dbra.w	d0,$00010b3a
	move.b	(a6)+,d0
	or.b	($0001,a5),d0
	move.b	d0,(a0)+
	bsr.w	L010c0c
	move.b	(a6),(a0)
	bra.s	$00010ad8

	movem.l	a0/a6,-(sp)
	bsr.w	L010bf8
	movea.l	(a6),a6
	movea.l	($000e,a5),a0
	clr.w	d0
	move.b	($000a,a6),d0
	move.w	d0,(a0)
	bra.w	$00010ad8

L010b6a:
	moveq.l	#$46,d0			;'F'
	bra.w	L010c68

L010b70:
	moveq.l	#$45,d0			;'E'
	bra.w	L010c68

L010b76:
	movem.l	d1-d7/a0-a6,-(sp)
	move.l	($0012,a5),d3
	movea.l	($000e,a5),a1
	move.l	($0016,a5),d1
	bsr.w	L010c8e
	bne.s	$00010bf2
	move.l	d3,d4
	move.w	($000c,a6),d5
	mulu.w	($000e,a6),d5
	mulu.w	(a6),d5
	move.w	d2,d6
	clr.b	d6
	ror.w	#8,d6
	clr.l	d0
	move.b	d2,d0
	subq.l	#1,d0
	mulu.w	($000c,a6),d6
	add.w	d0,d6
	mulu.w	(a6),d6
	tst.l	d4
	beq.s	$00010bf2
	move.l	d5,d3
	sub.l	d6,d3
	move.l	d4,d3
	cmp.l	d3,d4
	bcc.s	$00010bbc
	move.w	d4,d3
	movem.l	d1-d6/a1,-(sp)
	IOCS	_B_WRITE
	bsr.w	L010cee
	movem.l	(sp)+,d1-d6/a1
	bne.s	$00010bf2
	movem.l	d1-d6/a1,-(sp)
	IOCS	_B_VERIFY
	bsr.w	L010cee
	movem.l	(sp)+,d1-d6/a1
	bne.s	$00010bf2
	sub.l	d3,d4
	adda.l	d3,a1
	move.w	#$0001,d2
	add.l	#$00010000,d2
	clr.l	d6
	bra.s	$00010bac

	movem.l	(sp)+,d1-d7/a0-a6
	rts

L010bf8:
	move.b	($0001,a5),d0
	and.w	#$0003,d0
	add.w	d0,d0
	add.w	d0,d0
	lea.l	(L010a52,pc),a6
	adda.w	d0,a6
	rts

L010c0c:
	move.b	($0001,a5),d0
	and.w	#$0003,d0
	lea.l	(-$01b4,pc),a6
	adda.w	d0,a6
	rts

L010c1c:
	movem.l	d1-d3/a1,-(sp)
	and.l	#$00000003,d0
	move.w	d0,d1
	lsl.w	#8,d1
	or.w	#$9070,d1
	lea.l	($0c90),a1
	lsl.l	#3,d0
	adda.l	d0,a1
	moveq.l	#$00,d2
	IOCS	_B_READID
	btst.l	#$1e,d0
	bne.s	$00010c60
	clr.l	d0
	move.b	($0006,a1),d1
	lea.l	(L010a66),a0
	cmp.b	#$03,d1
	beq.s	$00010c62
	lea.l	(L010a78),a0
	cmp.b	#$02,d1
	beq.s	$00010c62
	movea.l	(a6),a0
	movem.l	(sp)+,d1-d3/a1
	rts

L010c68:
	movem.l	d1-d7/a0-a6,-(sp)
	move.l	($0012,a5),d3
	movea.l	($000e,a5),a1
	move.l	($0016,a5),d1
	movem.l	d0,-(sp)
	bsr.s	L010c8e
	movem.l	(sp)+,d0
	bne.s	$00010c88
	trap	#15
	bsr.s	L010cee
	movem.l	(sp)+,d1-d7/a0-a6
	rts

L010c8e:
	bsr.w	L010bf8
	movea.l	(a6),a6
	move.w	d1,d2
	add.w	d3,d2
	cmp.w	($0008,a6),d2
	bhi.s	L010ce8
	clr.l	d2
	move.w	($000c,a6),d0
	divu.w	d0,d1
	swap.w	d1
	move.b	d1,d2
	addq.b	#1,d2
	clr.w	d1
	swap.w	d1
	move.w	($000e,a6),d0
	divu.w	d0,d1
	lsl.l	#8,d3
	lsl.l	#1,d3
	add.w	#$0200,d1
	move.w	(a6),d0
	cmp.w	#$0200,d0
	beq.s	$00010ccc
	add.w	#$0100,d1
	lsl.l	#1,d3
	swap.w	d1
	lsl.w	#8,d1
	or.l	d1,d2
	move.b	($0001,a5),d1
	and.w	#$0003,d1
	or.b	($0010,a6),d1
	asl.w	#8,d1
	move.b	#$70,d1			;'p'
	clr.l	d0
	rts

L010ce8:
	move.w	#$5008,d0
	rts

L010cee:
	cmp.l	#$ffffffff,d0
	beq.s	L010d1e
	btst.l	#$1b,d0
	bne.s	L010d24
	btst.l	#$11,d0
	bne.s	L010d36
	btst.l	#$15,d0
	bne.s	L010d2a
	btst.l	#$0d,d0
	bne.s	L010d2a
	btst.l	#$0a,d0
	bne.s	L010d30
	btst.l	#$1e,d0
	bne.s	L010d1e
	clr.l	d0
	rts

L010d1e:
	move.w	#$7007,d0
	rts

L010d24:
	move.w	#$7002,d0
	rts

L010d2a:
	move.w	#$7004,d0
	rts

L010d30:
	move.w	#$700b,d0
	rts

L010d36:
	movem.l	d1/a6,-(sp)
	move.b	($0001,a5),d1
	move.w	#$0020,d0		;' '
	and.w	#$0003,d1
	bset.l	d1,d0
	move.b	d0,($00e94005)
	and.w	#$00e0,d0
	move.b	d0,($00e94005)
	bsr.w	L010c0c
	move.b	#$01,(a6)
	movem.l	(sp)+,d1/a6
	move.w	#$700d,d0
	rts

L010d6a:
	movem.l	d1-d2/a1/a6,-(sp)
L010d6e:
	bsr.w	L010c0c
	move.b	($0001,a5),d1
	and.l	#$00000003,d1
	asl.w	#8,d1
	or.w	#$9000,d1
	clr.w	d2
	move.b	($000d,a5),d2
	cmp.b	#$01,d2
	bne.s	$00010d92
	move.b	#-$01,(a6)
	IOCS	_B_DRVCHK
	move.b	d0,($000d,a5)
	movem.l	(sp)+,d1-d2/a1/a6
	bra.w	L00fae4

L010da2:
	.dc.b	$ff,$ff,$ff,$ff,$00,$00
	.dc.l	L010df0
	.dc.l	L010df8
	.dc.b	$10,$48,$41,$52,$44,$44,$53,$4b
L010db8:
	.dc.b	$00,$00,$00,$00
L010dbc:
	.dc.l	L007ff6
	.dc.l	L010f4c
	.dc.l	L010f56
	.dc.l	L00fad6
	.dc.l	L010f9a
	.dc.l	L010f78
	.dc.l	L00fae4
	.dc.l	L00fae4
	.dc.l	L010f9e
	.dc.l	L010fa2
	.dc.l	L00fae4
	.dc.l	L00fae4
	.dc.l	L00fad6
L010df0:
	move.l	a5,(L010db8)
	rts

L010df8:
	movem.l	d0/a4-a5,-(sp)
	movea.l	(L010db8),a5
	lea.l	(L010dbc),a4
	bra.w	$0000fab6

L010e0c:
	.dc.l	L010e4c
	.dc.l	L010e5c
	.dc.l	L010e6c
	.dc.l	L010e7c
	.dc.l	L010e8c
	.dc.l	L010e9c
	.dc.l	L010eac
	.dc.l	L010ebc
	.dc.l	L010ecc
	.dc.l	L010edc
	.dc.l	L010eec
	.dc.l	L010efc
	.dc.l	L010f0c
	.dc.l	L010f1c
	.dc.l	L010f2c
	.dc.l	L010f3c
L010e4c:
	.dc.l	$04000102,$00010200
	.dc.l	$2772f814,$80000000
L010e5c:
	.dc.l	$04000102,$00010200
	.dc.l	$2772f814,$81000000
L010e6c:
	.dc.l	$04000102,$00010200
	.dc.l	$2772f814,$82000000
L010e7c:
	.dc.l	$04000102,$00010200
	.dc.l	$2772f814,$83000000
L010e8c:
	.dc.l	$04000102,$00010200
	.dc.l	$2772f814,$84000000
L010e9c:
	.dc.l	$04000102,$00010200
	.dc.l	$2772f814,$85000000
L010eac:
	.dc.l	$04000102,$00010200
	.dc.l	$2772f814,$86000000
L010ebc:
	.dc.l	$04000102,$00010200
	.dc.l	$2772f814,$87000000
L010ecc:
	.dc.l	$04000102,$00010200
	.dc.l	$2772f814,$88000000
L010edc:
	.dc.l	$04000102,$00010200
	.dc.l	$2772f814,$89000000
L010eec:
	.dc.l	$04000102,$00010200
	.dc.l	$2772f814,$8a000000
L010efc:
	.dc.l	$04000102,$00010200
	.dc.l	$2772f814,$8b000000
L010f0c:
	.dc.l	$04000102,$00010200
	.dc.l	$2772f814,$8c000000
L010f1c:
	.dc.l	$04000102,$00010200
	.dc.l	$2772f814,$8d000000
L010f2c:
	.dc.l	$04000102,$00010200
	.dc.l	$2772f814,$8e000000
L010f3c:
	.dc.l	$04000102,$00010200
	.dc.l	$2772f814,$8f000000
L010f4c:
	move.b	#$01,($000e,a5)
	bra.w	L00fae4

L010f56:
	bra.w	L00fae4

	lea.l	(L010e4c),a4
	move.b	($0001,a5),d1
	and.w	#$000f,d1
	asl.w	#4,d1
	lea.l	(a4,d1.w),a4
	move.w	($000c,a4),d1
	and.w	#$ff00,d1
	rts

L010f78:
	movem.l	d1-d7/a0-a3,-(sp)
	bsr.s	$00010f5a
	move.b	($000d,a5),d0
	cmp.b	#$01,d0
	bne.s	$00010f8c
	IOCS	_B_EJECT
	move.b	#$42,($000d,a5)		;'B'
	movem.l	(sp)+,d1-d7/a0-a3
	bra.w	L00fae4

L010f9a:
	moveq.l	#$46,d0			;'F'
	bra.s	$00011012

L010f9e:
	moveq.l	#$45,d0			;'E'
	bra.s	$00011012

L010fa2:
	movem.l	d1-d7/a0-a6,-(sp)
	bsr.s	$00010f5a
	move.l	($0016,a5),d2
	add.w	($0014,a5),d2
	subq.w	#1,d2
	cmp.w	($0008,a4),d2
	bcc.w	$0001107c
	move.l	($0016,a5),d2
	asl.l	#2,d2
	add.l	($000c,a4),d2
	and.l	#$00ffffff,d2
	movea.l	($000e,a5),a1
	move.l	($0012,a5),d4
	asl.l	#2,d4
	clr.l	d0
	tst.l	d4
	beq.s	$00011006
	moveq.l	#$21,d3			;'!'
	move.w	d2,d0
	divu.w	d3,d0
	swap.w	d0
	sub.w	d0,d3
	cmp.w	d3,d4
	bcc.s	$00010fea
	move.w	d4,d3
	moveq.l	#$45,d0			;'E'
	bsr.s	L01100c
	tst.b	d0
	bne.s	$00011006
	moveq.l	#$41,d0			;'A'
	bsr.s	L01100c
	tst.b	d0
	bne.s	$00011006
	sub.l	d3,d4
	add.l	d3,d2
	move.l	d3,d0
	asl.l	#8,d0
	adda.l	d0,a1
	bra.s	$00010fd4

	movem.l	(sp)+,d1-d7/a0-a6
	rts

L01100c:
	movem.l	d1-d7/a0-a6,-(sp)
	bra.s	$00011044

	movem.l	d1-d7/a0-a6,-(sp)
	bsr.w	$00010f5a
	move.l	($0016,a5),d2
	add.w	($0014,a5),d2
	subq.w	#1,d2
	cmp.w	($0008,a4),d2
	bcc.s	$0001107c
	move.l	($0016,a5),d2
	asl.l	#2,d2
	add.l	($000c,a4),d2
	and.l	#$00ffffff,d2
	movea.l	($000e,a5),a1
	move.l	($0012,a5),d3
	asl.l	#2,d3
	asl.l	#8,d3
	trap	#15
	tst.b	d0
	beq.s	$00011088
	cmp.b	#$03,d0
	beq.s	$0001107c
	cmp.b	#$08,d0
	beq.s	$00011076
	cmp.b	#$09,d0
	beq.s	$0001107c
	cmp.b	#$14,d0
	beq.s	$00011070
	cmp.b	#-$02,d0
	beq.s	$00011082
	move.w	#$700c,d0
	bra.s	$0001108a

	move.w	#$7002,d0
	bra.s	$0001108a

	move.w	#$7006,d0
	bra.s	$0001108a

	move.w	#$5008,d0
	bra.s	$0001108a

	move.w	#$700b,d0
	bra.s	$0001108a

	clr.l	d0
	movem.l	(sp)+,d1-d7/a0-a6
	rts


	.data

L011090:
	.dc.l	$00000000
L011094:
	.dc.b	$fa
L011095:
	.dc.b	$00
L011096:
	.dc.b	'COMMAND /P',$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
L011193:
	.dc.b	'���@�N���ł��܂���ł����B',$00
L0111ae:
	.dc.b	'�I�����܂����B',$00
L0111bd:
	.dc.b	'�R�}���h���A���͂��Ă�������',$0d,$0a
L0111db:
	.dc.b	'#',$00
L0111dd:
	.dc.b	'��~���܂����B',$00
L0111ec:
	.dc.b	'^C'
L0111ee:
	.dc.b	$0d,$0a,$00,$00
L0111f2:
	.dc.b	$00,$00,$00
	.dc.b	$0b
L0111f6:
	.dc.b	'path=',$00
L0111fc:
	.dc.b	$00
L0111fd:
	.dc.b	'r',$00
	.dc.b	'z',$00
	.dc.b	'x',$00,$00
L011204:
	.dc.b	'.*',$00,$00
L011208:
	.dc.b	$00,$00
L01120a:
	.dc.w	$0100,$0016,$000f,$0016
	.dc.w	$0010
L011214:
	.dc.b	$00
	.dc.b	'#',$00
	.dc.b	$10
L011218:
	.dc.b	$00
	.dc.b	'0',$00
	.dc.b	$10
L01121c:
	.dc.b	$00
	.dc.b	';',$00
	.dc.b	$10
L011220:
	.dc.b	$00
	.dc.b	'B',$00
	.dc.b	$10
L011224:
	.dc.b	' �G���[($',$00
L01122e:
	.dc.b	')���������܂���'
L01123d:
	.dc.b	'(SR=$',$00
L011243:
	.dc.b	':PC=$',$00
L011249:
	.dc.b	') ',$00
L01124c:
	.dc.b	'�@�@�@ ���~���`�� �Ď��s���q�� �������h�� �H�@�@�@�@',$00
L011281:
	.dc.b	'  �o�X�G���[���������܂���  ',$00
L01129e:
	.dc.b	'�A�h���X�G���[���������܂���',$00
L0112bb:
	.dc.b	' �������Ȗ��߂����s���܂��� ',$00
	.dc.b	'�@�@ �O�ŏ��Z���܂���       ',$00
L0112f5:
	.dc.b	'�@�b�g�j���߂����s���܂����@',$00
L011312:
	.dc.b	'�s�q�`�o�u���߂����s���܂���',$00
L01132f:
	.dc.b	'   �������߂��g�p���܂���   ',$00
L01134c:
	.dc.b	' Interrupt������������܂���',$00
L011369:
	.dc.b	' ���Z�p�b�P�[�W�����o�^�ł� ',$00
L011386:
	.dc.b	'�@�@�@�@�@�����ȃ��j�b�g�ԍ����w�肵�܂����@�@�@�@�@',$00
L0113bb:
	.dc.b	'�@�@�@�f�B�X�N�������Ă��܂���A����Ă��������@�@�@',$00
L0113f0:
	.dc.b	'�@ �f�o�C�X�h���C�o�ɖ����ȃR�}���h���w�肵�܂��� �@',$00
	.dc.b	'                    �b�q�b�G���[�@�@�@�@�@�@�@�@�@�@',$00
L01145a:
	.dc.b	' �f�B�X�N�̊Ǘ��̈悪�j�󂳂�Ă��܂��A�g�p�s�\�ł� ',$00
	.dc.b	'                    �V�[�N�G���[�@�@�@�@�@�@�@�@�@�@',$00
L0114c4:
	.dc.b	'            �����ȃ��f�B�A���g�p���܂���  �@�@�@�@�@',$00
	.dc.b	'�@�@�@�@�@�@�@ �Z�N�^��������܂��� �@�@�@�@�@�@�@',$00
L01152e:
	.dc.b	'�@�@�@�@�@�@�v�����^���Ȃ����Ă��܂���@�@�@�@�@�@',$00
L011563:
	.dc.b	'�@�@�@�@�@�@�@�@�@ �������݃G���[ �@�@�@�@�@�@�@�@�@',$00
	.dc.b	'�@�@�@�@�@�@�@�@�@ �ǂݍ��݃G���[ �@�@�@�@�@�@�@�@�@',$00
L0115cd:
	.dc.b	'�@�@�@�@�@�@�@�G���[���������܂����@�@�@�@�@�@�@�@�@',$00
L011602:
	.dc.b	' �v���e�N�g���͂����āA�����f�B�X�N�����Ă������� ',$00
	.dc.b	'                 �������ݕs�\�ł�                 ',$00
L01166c:
	.dc.b	'     �t�@�C�����L�ᔽ�ł��B���ݎg�p�ł��܂���B     ',$00,$00
L0116a2:
	.dc.w	$000e,$0000,$f83e,$ffc0
	.dc.w	$fffe,$de6c,$de6c,$de6c
	.dc.w	$de6c,$4022,$4022,$4022
	.dc.w	$4022,$4022,$4022,$4022
	.dc.w	$4022
L0116c4:
	.dc.b	$00,$00
L0116c6:
	.dc.b	$00,$00,$00,$00,$00,$33,$00,$1f
	.dc.b	$00,$00,$00,$4c
L0116d2:
	.ds.b	1664
L011d52:
	.ds.b	1664
L0123d2:
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00
L0123dc:
	.dc.b	$a9,$ab,$ad,$af,$b1,$b3,$b5,$b7
	.dc.b	$b9,$bb,$bd,$bf,$c2,$c4,$c6
L0123eb:
	.dc.b	$cd,$d0,$d3,$d6,$d9
L0123f0:
	.dc.b	'cdefghijkl89^7<;=>?T6:'
L012406:
	.dc.l	L01240a
L01240a:
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
L01242a:
	.dc.b	$00,$00
L01242c:
	.dc.b	$00,$00
L01242e:
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
L012436:
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
L01243e:
	.dc.b	$00
L01243f:
	.dc.b	$00
L012440:
	.ds.b	1536
L012a40:
	.ds.b	1536
L013040:
	.ds.b	1280
L013540:
	.ds.b	1280
L013a40:
	.dc.b	$00
L013a41:
	.dc.b	$00
L013a42:
	.dc.b	$fe,' C1    ',$1b,'S',$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$fe,' CU    ',$1b,'T',$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$fe,' CA    ',$1b,'U',$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$fe,' S1    ',$1b,'V',$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$fe,' SU    ',$1b,'W',$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$fe,'VOID   ',$1b,'E',$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$fe,'NWL    ',$1b,'J',$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$fe,'INS    ',$1b,'P',$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$fe,'N&CU   ',$1b,'F',$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$fe,'EOF    ',$1b,'Z',$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	'DIR A:*.*',$0d,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	'DIR B:*.*',$0d,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	'COPY ',$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	'DEL ',$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	'REN ',$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	'DIR A:*.*/W',$0d,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	'DIR B:*.*/W',$0d,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	'TYPE ',$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	'DATE',$0d,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	'TIME',$0d,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
L013cc2:
	.dc.b	$1b,'E+',$0d,$00,$00
L013cc8:
	.dc.b	$1b,'E-',$0d,$00,$00
L013cce:
	.dc.b	$1b,'P',$00,$00,$00,$00
	.dc.b	$1b,'V',$00,$00,$00,$00
	.dc.b	$1b,'J',$00,$00,$00,$00
	.dc.b	$08,$00,$00,$00,$00,$00
	.dc.b	$1b,'S',$00,$00,$00,$00
	.dc.b	$1b,'U',$00,$00,$00,$00
	.dc.b	'CLS',$0d,$00,$00
	.dc.b	'HIS',$0d,$00,$00
	.dc.b	$1b,'E',$00,$00,$00,$00
	.dc.b	$1b,'U',$0d,$00,$00,$00
L013d0a:
	.dc.l	L008372
L013d0e:
	.dc.b	$1f,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
L013d1a:
	.dc.b	$00,$00,$01,$01,$02,$02,$03,$03
	.dc.b	$04,$04
L013d24:
	.dc.b	$00,$00,$01,$01,$02,$02,$03,$03
	.dc.b	$04,$04
L013d2e:
	.dc.b	$ff,$ff
L013d30:
	.dc.w	$01c1
L013d32:
	.dc.l	L00fae8
L013d36:
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00
L013d54:
	.dc.b	'CON     '
L013d5c:
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00
L013d90:
	.dc.w	$01c2
L013d92:
	.dc.l	L00fae8
L013d96:
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$01,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00
L013db4:
	.dc.b	'CON     '
L013dbc:
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00
L013df0:
	.dc.w	$01c2
L013df2:
	.dc.l	L00fae8
L013df6:
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$02,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00
L013e14:
	.dc.b	'CON     '
L013e1c:
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00
L013e50:
	.dc.w	$01c0
	.dc.l	L010694
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0200,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000
L013e74:
	.dc.b	'AUX     '
L013e7c:
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00
L013eb0:
	.dc.w	$01c0
L013eb2:
	.dc.l	L01076e
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$01,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00
L013ed4:
	.dc.b	'PRN     '
L013edc:
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00
L013f10:
	.ds.b	96
L013f70:
	.dc.b	$ff
L013f71:
	.ds.b	259
L014074:
	.dc.b	$00,$00
L014076:
	.dc.l	$ffffffff
DosCallTable:
	.dc.l	Call_EXIT
	.dc.l	Call_GETCHAR
	.dc.l	Call_PUTCHAR
	.dc.l	Call_COMINP
	.dc.l	Call_COMOUT
	.dc.l	Call_PRNOUT
	.dc.l	Call_INPOUT
	.dc.l	Call_INKEY
	.dc.l	Call_GETC
	.dc.l	Call_PRINT
	.dc.l	Call_GETS
	.dc.l	Call_KEYSNS
	.dc.l	Call_KFLUSH
	.dc.l	Call_FFLUSH
	.dc.l	Call_CHGDRV
	.dc.l	Call_DRVCTRL
	.dc.l	Call_CONSNS
	.dc.l	Call_PRNSNS
	.dc.l	Call_CINSNS
	.dc.l	Call_COUTSNS
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_FATCHK
	.dc.l	Call_HENDSP
	.dc.l	Call_CURDRV
	.dc.l	Call_GETSS
	.dc.l	Call_FGETC
	.dc.l	Call_FGETS
	.dc.l	Call_FPUTC
	.dc.l	Call_FPUTS
	.dc.l	Call_ALLCLOSE
	.dc.l	Call_SUPER
	.dc.l	Call_FNCKEY
	.dc.l	Call_KNJCTRL
	.dc.l	Call_CONCTRL
	.dc.l	Call_KEYCTRL
	.dc.l	Call_INTVCS
	.dc.l	Call_PSPSET
	.dc.l	Call_GETTIM2
	.dc.l	Call_SETTIM2
	.dc.l	Call_NAMESTS
	.dc.l	Call_GETDATE
	.dc.l	Call_SETDATE
	.dc.l	Call_GETTIME
	.dc.l	Call_SETTIME
	.dc.l	Call_VERIFY
	.dc.l	Call_DUP0
	.dc.l	Call_VERNUM
	.dc.l	Call_KEEPPR
	.dc.l	Call_GETDPB
	.dc.l	Call_BREAKCK
	.dc.l	Call_DRVXCHG
	.dc.l	Call_INTVCG
	.dc.l	Call_DSKFRE
	.dc.l	Call_NAMECK
	.dc.l	Call_Reserved
	.dc.l	Call_MKDIR
	.dc.l	Call_RMDIR
	.dc.l	Call_CHDIR
	.dc.l	Call_CREATE
	.dc.l	Call_OPEN
	.dc.l	Call_CLOSE
	.dc.l	Call_READ
	.dc.l	Call_WRITE
	.dc.l	Call_DELETE
	.dc.l	Call_SEEK
	.dc.l	Call_CHMOD
	.dc.l	Call_IOCTRL
	.dc.l	Call_DUP
	.dc.l	Call_DUP2
	.dc.l	Call_CURDIR
	.dc.l	Call_MALLOC
	.dc.l	Call_MFREE
	.dc.l	Call_SETBLOCK
	.dc.l	Call_EXEC
	.dc.l	Call_EXIT2
	.dc.l	Call_WAIT
	.dc.l	Call_FILES
	.dc.l	Call_NFILES
	.dc.l	Call_SETPDB
	.dc.l	Call_GETPDB
	.dc.l	Call_SETENV
	.dc.l	Call_GETENV
	.dc.l	Call_VERIFYG
	.dc.l	Call_COMMON
	.dc.l	Call_RENAME
	.dc.l	Call_FILEDATE
	.dc.l	Call_MALLOC2
	.dc.l	Call_Reserved
	.dc.l	Call_MAKETMP
	.dc.l	Call_NEWFILE
	.dc.l	Call_LOCK
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_ASSIGN
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_FFLUSH_SET
	.dc.l	Call_OS_PATCH
	.dc.l	Call_GETFCB
	.dc.l	Call_S_MALLOC
	.dc.l	Call_S_MFREE
	.dc.l	Call_S_PROCESS
	.dc.l	Call_SETPDB
	.dc.l	Call_GETPDB
	.dc.l	Call_SETENV
	.dc.l	Call_GETENV
	.dc.l	Call_VERIFYG
	.dc.l	Call_COMMON
	.dc.l	Call_RENAME
	.dc.l	Call_FILEDATE
	.dc.l	Call_MALLOC2
	.dc.l	Call_Reserved
	.dc.l	Call_MAKETMP
	.dc.l	Call_NEWFILE
	.dc.l	Call_LOCK
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_ASSIGN
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_FFLUSH_SET
	.dc.l	Call_OS_PATCH
	.dc.l	Call_GETFCB
	.dc.l	Call_S_MALLOC
	.dc.l	Call_S_MFREE
	.dc.l	Call_S_PROCESS
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_CTRLVC_ERRJVC_EXITVC
	.dc.l	Call_CTRLVC_ERRJVC_EXITVC
	.dc.l	Call_CTRLVC_ERRJVC_EXITVC
	.dc.l	Call_DISKRED
	.dc.l	Call_DISKWRT
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_CHANGE_KILL_OPEN_PR
	.dc.l	Call_CHANGE_KILL_OPEN_PR
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_Reserved
	.dc.l	Call_CHANGE_KILL_OPEN_PR
End:

	.end	Start