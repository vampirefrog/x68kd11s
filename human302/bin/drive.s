;=============================================
;  Filename human302/bin/drive.x
;
;
;  Base address 000000
;  Exec address 000000
;  Text size    000786 byte(s)
;  Data size    0005bc byte(s)
;  Bss  size    0006ea byte(s)
;  151 Labels
;
;  Commandline dis  -h -k -m68000 -q1 -B -M -w16 -o120 -ghuman302/bin/drive.lab --overwrite human302/bin/drive.x human302/bin/drive.s
;          DIS version 3.16
;=============================================

	.include	inc/doscall.mac
	.include	inc/iocscall.mac
	.include	inc/fefunc.mac

	.cpu	68000

	.text

Start:
	lea.l	(StackTop),a7
	clr.b	(UnknownByteVar2)
	clr.b	(UnknownByteVar3)
	DOS	_VERNUM
	cmp.w	#$0332,d0
	bcc	BadOSVersionExit
	movea.l	(Start-$0000e0),a0
	addq.l	#1,a0
	lea.l	(UnknownBuffer1),a1
	lea.l	(UnknownBuffer2),a2
	bsr	ParseCmdLine
	move.l	d0,(UnknownLongVar1)
	lea.l	(UnknownBuffer2),a0
L000040:
	tst.b	(a0)
	beq	L000078
	bsr	UnknownSubroutine1
L000048:
	move.b	(a0)+,d0
	beq	L000040
	cmp.b	#$64,d0			;'d'
	beq	L000064
	cmp.b	#$76,d0			;'v'
	bne	L00053a
	move.b	#-$01,(UnknownByteVar3)
	bra	L000048

L000064:
	tst.l	(UnknownLongVar1)
	bne	L00053a
	move.b	#-$01,(UnknownByteVar2)
	bra	L000048

L000078:
	DOS	_CURDRV
	move.w	d0,-(a7)
	DOS	_CHGDRV
	addq.l	#2,a7
	move.w	d0,d4
	clr.l	d5
	move.l	(UnknownLongVar1),d0
	bne	L0000cc
	tst.b	(UnknownByteVar2)
	beq	L0001d0
	DOS	_VERNUM
	cmp.w	#$0162,d0
	bcs	L00053a
	DOS	_CURDRV
	move.w	d0,d2
	move.w	#$ffff,-(a7)
	move.w	#$ffff,-(a7)
	DOS	_DRVXCHG
	addq.l	#4,a7
	move.w	d0,d1
	tst.l	d0
	bmi	L00053a
	pea.l	(AllDriveNamesResetString)
	DOS	_PRINT
	addq.l	#4,a7
	cmp.w	d1,d2
	beq	L0001d0
	bra	L000198

L0000cc:
	cmp.l	#$00000002,d0
	bhi	L00053a
	lea.l	(UnknownBuffer1),a0
	cmpi.b	#$3a,($0001,a0)		;':'
	bne	L00053a
	tst.b	($0002,a0)
	bne	L00053a
	move.b	(a0),d0
	or.b	#$20,d0
	sub.b	#$61,d0			;'a'
	move.b	d0,d2
	cmp.w	d4,d0
	bhi	BadDriveExit
	and.l	#$000000ff,d2
	cmpi.l	#$00000001,(UnknownLongVar1)
	beq	L0001d2
L000114:
	tst.b	(a0)+
	bne	L000114
	cmpi.b	#$3a,($0001,a0)		;':'
	bne	L00053a
	tst.b	($0002,a0)
	bne	L00053a
	move.b	(a0),d0
	or.b	#$20,d0
	sub.b	#$61,d0			;'a'
	move.b	d0,d1
	cmp.w	d4,d0
	bhi	BadDriveExit
	and.l	#$000000ff,d1
	cmp.w	d1,d2
	beq	BadDriveExit
	move.w	d1,-(a7)
	addq.w	#1,(a7)
	move.w	d2,-(a7)
	addq.w	#1,(a7)
	DOS	_DRVXCHG
	addq.l	#4,a7
	DOS	_FFLUSH
	pea.l	(DriveString)
	DOS	_PRINT
	addq.l	#4,a7
	move.w	d2,-(a7)
	addi.w	#$0041,(a7)
	DOS	_PUTCHAR
	addq.l	#2,a7
	pea.l	(WhenString)
	DOS	_PRINT
	addq.l	#4,a7
	move.w	d1,-(a7)
	addi.w	#$0041,(a7)
	DOS	_PUTCHAR
	addq.l	#2,a7
	pea.l	(ReplacedString)
	DOS	_PRINT
	addq.l	#4,a7
	DOS	_CURDRV
	cmp.w	d2,d0
	beq	L000198
	cmp.w	d1,d0
	bne	L0001d0
	move.w	d1,d0
	move.w	d2,d1
	move.w	d0,d2
L000198:
	move.w	d1,-(a7)
	DOS	_CHGDRV
	addq.l	#2,a7
	pea.l	(CurrentString)
	DOS	_PRINT
	addq.l	#4,a7
	move.w	d2,-(a7)
	addi.w	#$0041,(a7)
	DOS	_PUTCHAR
	addq.l	#2,a7
	pea.l	(DriveSemicolonString)
	DOS	_PRINT
	addq.l	#4,a7
	move.w	d1,-(a7)
	addi.w	#$0041,(a7)
	DOS	_PUTCHAR
	addq.l	#2,a7
	pea.l	(SwitchedToString)
	DOS	_PRINT
	addq.l	#4,a7
L0001d0:
	clr.w	d2
L0001d2:
	move.w	d2,d0
	addq.w	#1,d2
	cmp.w	d4,d2
	bhi	L0004f8
	lea.l	(VirtualDriveString),a0
	bsr	UnknownSubroutine4
	tst.l	d0
	bne	L000228
	pea.l	(DPBBuffer)
	move.w	d2,-(a7)
	DOS	_GETDPB
	addq.l	#6,a7
	tst.l	d0
	seq.b	(UnknownByteVar4)
	bpl	L000284
	pea.l	(Stack,pc)
	clr.w	-(a7)
	move.w	d2,-(a7)
	move.w	#$000d,-(a7)
	DOS	_IOCTRL
	tst.l	d0
	bmi	L000222
	move.w	(Stack,pc),d1
	moveq.l	#$00,d3
	move.b	d2,d0
	subq.w	#1,d0
	bra	L0002c8

L000222:
	lea.l	(DriveInfoDoesNotExistString),a0
L000228:
	tst.l	d5
	beq	L00025c
	cmpa.l	d5,a0
	beq	L000272
	move.w	d2,d0
	sub.w	d6,d0
	cmp.w	#$0002,d0
	bcs	L00025c
	cmp.w	#$0003,d0
	bcs	L00024a
	pea.l	(PipeString)
	DOS	_PRINT
	addq.l	#4,a7
L00024a:
	move.w	d2,d0
	add.w	#$003f,d0
	move.w	d0,-(a7)
	DOS	_PUTCHAR
	addq.l	#2,a7
	move.l	d5,-(a7)
	DOS	_PRINT
	addq.l	#4,a7
L00025c:
	move.l	a0,d5
	move.w	d2,d6
	move.w	d2,d0
	add.w	#$0040,d0
	move.w	d0,-(a7)
	DOS	_PUTCHAR
	addq.l	#2,a7
	move.l	a0,-(a7)
	DOS	_PRINT
	addq.l	#4,a7
L000272:
	cmpi.l	#$00000001,(UnknownLongVar1)
	bne	L0001d2
	bra	L000528

L000284:
	tst.l	d5
	beq	L0002b6
	move.w	d2,d0
	sub.w	d6,d0
	cmp.w	#$0002,d0
	bcs	L0002b4
	cmp.w	#$0003,d0
	bcs	L0002a2
	pea.l	(PipeString)
	DOS	_PRINT
	addq.l	#4,a7
L0002a2:
	move.w	d2,d0
	add.w	#$003f,d0
	move.w	d0,-(a7)
	DOS	_PUTCHAR
	addq.l	#2,a7
	move.l	d5,-(a7)
	DOS	_PRINT
	addq.l	#4,a7
L0002b4:
	clr.l	d5
L0002b6:
	move.b	(DPBBuffer),d0
	move.b	(DPBMediaBytes),d1
	move.b	(DPBUnitNumber),d3
L0002c8:
	lea.l	(TwoHD1MBString),a0
	cmp.b	#$fe,d1
	beq	L000346
	lea.l	(RamDiskString),a0
	cmp.b	#$f9,d1
	beq	L000346
	lea.l	(HardDiskString),a0
	cmp.b	#$f8,d1
	beq	L000346
	lea.l	(HardDiskSCSIString),a0
	cmp.b	#$f7,d1
	beq	L000346
	lea.l	(MODiskSCSIString),a0
	cmp.b	#$f6,d1
	beq	L000346
	lea.l	(TwoHCString,pc),a0
	cmp.b	#$fd,d1
	beq	L000346
	lea.l	(TwoDDS640tring,pc),a0
	cmp.b	#$fb,d1
	beq	L000346
	lea.l	(TwoDD720String,pc),a0
	cmp.b	#$fc,d1
	beq	L000346
	lea.l	(TwoHD144String,pc),a0
	cmp.b	#$fa,d1
	beq	L000346
	lea.l	(CDROMSCSIString,pc),a0
	cmpi.b	#$f5,d1
	beq	L000346
	lea.l	(DATDriveSCSIString,pc),a0
	cmpi.b	#$f4,d1
	beq	L000346
	lea.l	(OtherTypesString),a0
L000346:
	add.b	#$41,d0			;'A'
	move.w	d0,-(a7)
	DOS	_PUTCHAR
	addq.l	#2,a7
	move.l	a0,-(a7)
	DOS	_PRINT
	addq.l	#4,a7
	pea.l	(UnitNumberString)
	DOS	_PRINT
	addq.l	#4,a7
	clr.l	d0
	move.b	d3,d0
	lea.l	(UnknownBuffer2),a0
	bsr	DecimalString
	clr.b	(UnknownByteVar1)
	pea.l	(L000fe2)
	DOS	_PRINT
	addq.l	#4,a7
	tst.b	(UnknownByteVar3)
	beq	L0003de
	move.w	#$ffff,-(a7)
	move.w	#$0010,-(a7)
	DOS	_CONCTRL
	addq.l	#4,a7
	cmp.b	#$01,d0
	bhi	L0003de
	move.w	d2,d0
	and.w	#$00ff,d0
	move.w	d0,-(a7)
	DOS	_DRVCTRL
	addq.l	#2,a7
	and.l	#$00000004,d0
	bne	L0003de
	lea.l	(UnknownBuffer2),a0
	lea.l	(AWildcardString),a1
	bsr	StrCpy
	move.b	d2,d0
	add.b	#$40,d0			;'@'
	move.b	d0,(a0)
	move.w	#$0008,-(a7)
	move.l	a0,-(a7)
	pea.l	(L000fe6)
	DOS	_FILES
	lea.l	($000a,a7),a7
	tst.l	d0
	bmi	L0003de
	bsr	PrintVolumeLabel
L0003de:
	pea.l	(CRLFString2)
	DOS	_PRINT
	addq.l	#4,a7
	cmpi.l	#$00000001,(UnknownLongVar1)
	bne	L0001d2
	tst.b	(UnknownByteVar4)
	beq	L000528
	lea.l	(BytesPerSectorString),a0
	move.w	(DPBBytesPerSector),d0
	and.l	#$0000ffff,d0
	bsr	UnknownSubroutine5
	lea.l	(SectorsPerClusterString),a0
	move.b	(DPBSectorsPerCluster),d0
	and.l	#$000000ff,d0
	addq.l	#1,d0
	bsr	UnknownSubroutine5
	lea.l	(TotalClustersString),a0
	move.w	(DPBTotalClustersPlusOne),d0
	and.l	#$0000ffff,d0
	subq.l	#1,d0
	bsr	UnknownSubroutine5
	lea.l	(FirstFileSectorString),a0
	move.w	(DPBFirstFATSector),d0
	and.l	#$0000ffff,d0
	bsr	UnknownSubroutine5
	lea.l	(NumberOfFileSectorString),a0
	move.b	(DPBFATSectors),d0
	and.l	#$000000ff,d0
	bsr	UnknownSubroutine5
	lea.l	(RootDirStartSectorString),a0
	move.w	(DPBFirstRootSector),d0
	and.l	#$0000ffff,d0
	bsr	UnknownSubroutine5
	lea.l	(MaximumRootDirsString),a0
	move.w	(DPBRootDirFiles),d0
	and.l	#$0000ffff,d0
	bsr	UnknownSubroutine5
	lea.l	(FirstSectorString),a0
	move.w	(DPBFirstDataSector),d0
	and.l	#$0000ffff,d0
	bsr	UnknownSubroutine5
	move.w	d2,d0
	and.w	#$00ff,d0
	move.w	d0,-(a7)
	DOS	_DRVCTRL
	addq.l	#2,a7
	move.l	d0,d1
	lea.l	(AccessString),a0
	and.l	#$00000004,d0
	bsr	UnknownSubroutine6
	lea.l	(EjectString),a0
	move.l	d1,d0
	and.l	#$00000040,d0
	bsr	UnknownSubroutine6
	lea.l	(WritingString),a0
	move.l	d1,d0
	and.l	#$0000000c,d0
	bsr	UnknownSubroutine6
	bra	L000528

L0004f8:
	tst.l	d5
	beq	L000528
	move.w	d2,d0
	sub.w	d6,d0
	cmp.w	#$0002,d0
	bcs	L000528
	cmp.w	#$0003,d0
	bcs	L000516
	pea.l	(PipeString)
	DOS	_PRINT
	addq.l	#4,a7
L000516:
	move.w	d2,d0
	add.w	#$003f,d0
	move.w	d0,-(a7)
	DOS	_PUTCHAR
	addq.l	#2,a7
	move.l	d5,-(a7)
	DOS	_PRINT
	addq.l	#4,a7
L000528:
	DOS	_EXIT

BadDriveExit:
	pea.l	(DriveSpecificationIsInvalidString)
	DOS	_PRINT
	addq.l	#4,a7
	move.w	#$0002,-(a7)
	DOS	_EXIT2

L00053a:
	lea.l	(CRLFString),a0
	DOS	_VERNUM
	cmp.w	#$0162,d0
	bcs	L00054e
	lea.l	(UsageString2),a0
L00054e:
	pea.l	(UsageString)
	DOS	_PRINT
	addq.l	#4,a7
	move.l	a0,-(a7)
	DOS	_PRINT
	addq.l	#4,a7
	pea.l	(DetailsHelpString)
	DOS	_PRINT
	addq.l	#4,a7
	move.w	#$0001,-(a7)
	DOS	_EXIT2

BadOSVersionExit:
	pea.l	(CannotBeUsedWithThisOSString)
	DOS	_PRINT
	addq.l	#4,a7
	move.w	#$0002,-(a7)
	DOS	_EXIT2

UnknownSubroutine5:
	move.l	d0,-(a7)
	move.l	a0,-(a7)
	DOS	_PRINT
	addq.l	#4,a7
	move.l	(a7)+,d0
	lea.l	(UnknownBuffer2),a0
	bsr	DecimalString
	clr.b	(UnknownByteVar1)
	pea.l	(L000fdf)
	DOS	_PRINT
	addq.l	#4,a7
	pea.l	(CRLFString2)
	DOS	_PRINT
	addq.l	#4,a7
	rts

UnknownSubroutine6:
	move.l	d0,-(a7)
	move.l	a0,-(a7)
	DOS	_PRINT
	addq.l	#4,a7
	move.l	(a7)+,d0
	tst.b	d0
	beq	L0005c4
	pea.l	(NoString)
	bra	L0005ca

L0005c4:
	pea.l	(YesString)
L0005ca:
	DOS	_PRINT
	addq.l	#4,a7
	rts

PrintVolumeLabel:
	pea.l	(TheVolumeLabelIsString)
	DOS	_PRINT
	addq.l	#4,a7
	move.w	#$0015,d1
	lea.l	(L001004),a0
	clr.w	d0
L0005e6:
	tst.w	d1
	beq	L00060a
	move.b	(a0)+,d0
	beq	L000606
	cmp.b	#$2e,d0			;'.'
	beq	L0005e6
	move.w	d0,-(a7)
	DOS	_PUTCHAR
	addq.l	#2,a7
	subq.w	#1,d1
	bra	L0005e6

L0005fe:
	move.w	#$0020,-(a7)		;' '
	DOS	_PUTCHAR
	addq.l	#2,a7
L000606:
	dbra	d1,L0005fe
L00060a:
	pea.l	(IsString)
	DOS	_PRINT
	addq.l	#4,a7
	rts

ParseCmdLine:
	movem.l	d1/a0-a2,-(a7)
	clr.l	d1
L00061c:
	bsr	SkipWhitespace
	adda.l	d0,a0
	tst.b	(a0)
	beq	L000698
	move.b	(a0)+,d0
	cmp.b	#$2d,d0			;'-'
	beq	L000634
	cmp.b	#$2f,d0			;'/'
	bne	L00064a
L000634:
	move.b	(a0)+,d0
	beq	L000698
	cmp.b	#$09,d0
	beq	L000646
	cmp.b	#$20,d0			;' '
	beq	L000646
	move.b	d0,(a2)+
L000646:
	clr.b	(a2)+
	bra	L00061c

L00064a:
	addq.l	#1,d1
L00064c:
	move.b	d0,(a1)+
	cmp.b	#$22,d0			;'"'
	bne	L000662
L000654:
	move.b	(a0)+,d0
	beq	L000698
	move.b	d0,(a1)+
	cmp.b	#$22,d0			;'"'
	bne	L000654
	bra	L000674

L000662:
	cmp.b	#$27,d0			;'''
	bne	L000674
L000668:
	move.b	(a0)+,d0
	beq	L000698
	move.b	d0,(a1)+
	cmp.b	#$27,d0			;'''
	bne	L000668
L000674:
	move.b	(a0),d0
	beq	L000698
	cmp.b	#$2f,d0			;'/'
	beq	L000694
	cmp.b	#$2d,d0			;'-'
	beq	L000694
	addq.l	#1,a0
	cmp.b	#$09,d0
	beq	L000694
	cmp.b	#$20,d0			;' '
	beq	L000694
	bra	L00064c

L000694:
	clr.b	(a1)+
	bra	L00061c

L000698:
	clr.b	(a1)+
	clr.b	(a1)
	clr.b	(a2)+
	clr.b	(a2)
	move.l	d1,d0
	movem.l	(a7)+,d1/a0-a2
	rts

SkipWhitespace:
	move.l	a0,-(a7)
L0006aa:
	move.b	(a0)+,d0
	cmpi.b	#$20,d0			;' '
	beq	L0006aa
	cmpi.b	#$09,d0
	beq	L0006aa
	move.l	a0,d0
	movea.l	(a7)+,a0
	sub.l	a0,d0
	subq.l	#1,d0
	rts

StrCpy:
	movem.l	a0-a1,-(a7)
L0006c6:
	move.b	(a1)+,(a0)+
	bne	L0006c6
	movem.l	(a7)+,a0-a1
	rts

UnknownSubroutine1:
	movem.l	d0-d1/a0,-(a7)
	clr.b	d1
L0006d6:
	move.b	(a0),d0
	beq	L000710
	tst.b	d1
	beq	L0006e2
	clr.b	d1
	bra	L0006f8

L0006e2:
	cmp.b	#$80,d0
	bcs	L0006fc
	cmp.b	#$a0,d0
	bcs	L0006f4
	cmp.b	#$e0,d0
	bcs	L0006fc
L0006f4:
	move.b	#$01,d1
L0006f8:
	addq.l	#1,a0
	bra	L0006d6

L0006fc:
	cmpi.b	#$41,d0			;'A'
	bcs	L00070c
	cmpi.b	#$5a,d0			;'Z'
	bhi	L00070c
	add.b	#$20,d0			;' '
L00070c:
	move.b	d0,(a0)+
	bra	L0006d6

L000710:
	movem.l	(a7)+,d0-d1/a0
	rts

DecimalString:
	movem.l	d0-d2/a0-a1,-(a7)
	movem.l	a0,-(a7)
	lea.l	(PowersOfTenTable),a1
L000724:
	clr.b	d2
	move.l	(a1)+,d1
	beq	L00073a
L00072a:
	addq.b	#1,d2
	sub.l	d1,d0
	bcc	L00072a
	add.l	d1,d0
	add.b	#$2f,d2			;'/'
	move.b	d2,(a0)+
	bra	L000724

L00073a:
	clr.b	(a0)
	movem.l	(a7)+,a0
L000740:
	move.b	(a0)+,d0
	beq	L000756
	cmp.b	#$30,d0			;'0'
	bne	L000756
	tst.b	(a0)
	beq	L000756
	move.b	#$20,(-$0001,a0)	;' '
	bra	L000740

L000756:
	movem.l	(a7)+,d0-d2/a0-a1
	rts

UnknownSubroutine4:
	movem.l	d1,-(a7)
	and.l	#$000000ff,d0
	move.l	d0,d1
	DOS	_CURDRV
	move.w	d0,-(a7)
	move.w	d1,-(a7)
	DOS	_CHGDRV
	addq.l	#2,a7
	cmp.w	d1,d0
	bhi	L00077a
	moveq.l	#$ff,d0
	bra	L00077e

L00077a:
	DOS	_CHGDRV
	clr.l	d0
L00077e:
	addq.l	#2,a7
	movem.l	(a7)+,d1
	rts


	.data

PowersOfTenTable:
	.dc.l	$3b9aca00,$05f5e100,$00989680,$000f4240
	.dc.l	$000186a0,$00002710,$000003e8,$00000064
	.dc.l	$0000000a,$00000001,$00000000
AWildcardString:
	.dc.b	'A:\*.*',$00
UsageString:
	.dc.b	'X68k Drive v2.20 Copyright 1989,90,91,92,93 SHARP/Hudson',$0d,$0a
	.dc.b	'使用法：drive［スイッチ］［ドライブ名１］［ドライブ名２］',$0d,$0a
	.dc.b	$09,'/v',$09,'ボリュームラベルを表示する',$0d,$0a,$00
UsageString2:
	.dc.b	$09,'/d',$09,'すべてのドライブ名を初期状態に戻す',$0d,$0a
	.dc.b	$0d,$0a
	.dc.b	$09,'/dのスイッチを付けた場合ドライブ名は指定しない'
CRLFString:
	.dc.b	$0d,$0a,$00
DetailsHelpString:
	.dc.b	$09,'ドライブ名の指定が無いと全ドライブのタイプを表示する',$0d,$0a
	.dc.b	$09,'ドライブ名１のみ指定するとステ－タスを表示する',$0d,$0a
	.dc.b	$09,'ドライブ名１，２を指定するとドライブ名を交換する',$0d,$0a,$00
TheVolumeLabelIsString:
	.dc.b	' ボリュ－ムラベルは ',$00
IsString:
	.dc.b	' です',$00
DriveSpecificationIsInvalidString:
	.dc.b	'drive: ドライブ指定が無効です',$0d,$0a,$00
CannotBeUsedWithThisOSString:
	.dc.b	'このＯＳでは使用できません',$0d,$0a,$00
WhenString:
	.dc.b	':と'
DriveString:
	.dc.b	'ドライブ ',$00
ReplacedString:
	.dc.b	':を入れ替えました',$0d,$0a,$00
CurrentString:
	.dc.b	'カレント ',$00
DriveSemicolonString:
	.dc.b	':をドライブ ',$00
SwitchedToString:
	.dc.b	':に切り替えました',$0d,$0a,$00
AllDriveNamesResetString:
	.dc.b	'すべてのドライブ名を初期状態に戻しました',$0d,$0a,$00
PipeString:
	.dc.b	'|',$0d,$0a,$00
TwoHD1MBString:
	.dc.b	': ２ＨＤ（１ＭＢ）',$09,$00
RamDiskString:
	.dc.b	': ＲＡＭ　ＤＩＳＫ',$09,$00
HardDiskString:
	.dc.b	': ハードディスク',$09,$00
HardDiskSCSIString:
	.dc.b	': ハードディスク(SCSI)',$09,$00
MODiskSCSIString:
	.dc.b	': 光磁気ディスク(SCSI)',$09,$00
CDROMSCSIString:
	.dc.b	': ＣＤＲＯＭ(SCSI)',$09,$00
DATDriveSCSIString:
	.dc.b	': ＤＡＴドライブ(SCSI)',$09,$00
TwoHCString:
	.dc.b	': ２ＨＣ（１ＭＢ）',$09,$00
TwoDDS640tring:
	.dc.b	': ２ＤＤ（６４０ＫＢ）',$09,$00
TwoDD720String:
	.dc.b	': ２ＤＤ（７２０ＫＢ）',$09,$00
TwoHD144String:
	.dc.b	': ２ＨＤ（１.４４ＭＢ）',$00
OtherTypesString:
	.dc.b	': その他のタイプ　',$09,$00
UnitNumberString:
	.dc.b	'ユニット番号････   ',$00
DriveInfoDoesNotExistString:
	.dc.b	': ドライブの装置情報が存在しません',$0d,$0a,$00
VirtualDriveString:
	.dc.b	': 仮想ドライブです',$0d,$0a,$00
BytesPerSectorString:
	.dc.b	'１セクタあたりのバイト数････････････････',$00
SectorsPerClusterString:
	.dc.b	'１クラスタあたりのセクタ数･･････････････',$00
TotalClustersString:
	.dc.b	'総クラスタ数････････････････････････････',$00
FirstFileSectorString:
	.dc.b	'ファイルアロケーションの先頭セクタ番号･･',$00
NumberOfFileSectorString:
	.dc.b	'ファイルアロケーションのセクタ数････････',$00
RootDirStartSectorString:
	.dc.b	'ルートディレクトリの先頭セクタ番号･･････',$00
MaximumRootDirsString:
	.dc.b	'ルートディレクトリの最大個数････････････',$00
FirstSectorString:
	.dc.b	'データ領域の先頭セクタ番号･･････････････',$00
AccessString:
	.dc.b	'アクセス････････････････････････････････ ',$00
EjectString:
	.dc.b	'イジェクト･･････････････････････････････ ',$00
WritingString:
	.dc.b	'書き込み････････････････････････････････ ',$00
YesString:
	.dc.b	'  可',$0d,$0a,$00
NoString:
	.dc.b	'不可'
CRLFString2:
	.dc.b	$0d,$0a,$00

	.bss

UnknownLongVar1:
	.ds.l	1
UnknownBuffer1:
	.ds.b	280
UnknownBuffer2:
	.ds.b	280
DPBBuffer:
	.ds.b	1
DPBUnitNumber:
	.ds.b	1
DPBBytesPerSector:
	.ds.w	1
DPBSectorsPerCluster:
	.ds.b	1
DPBSectorsPerClusterShift:
	.ds.b	1
DPBFirstFATSector:
	.ds.w	1
DPBNumFATAreas:
	.ds.b	1
DPBFATSectors:
	.ds.b	1
DPBRootDirFiles:
	.ds.w	1
DPBFirstDataSector:
	.ds.w	1
DPBTotalClustersPlusOne:
	.ds.w	1
DPBFirstRootSector:
	.ds.w	1
DPBDeviceDriverPointer:
	.ds.l	1
DPBMediaBytes:
	.ds.b	1
DPBUsageFlag:
	.ds.b	1
DPBNextDPB:
	.ds.l	1
DPBCurDirClusterNumber:
	.ds.w	1
DPBCurDirStr:
	.ds.b	70
UnknownBuffer2:
	.ds.b	5
L000fdf:
	.ds.b	3
L000fe2:
	.ds.b	2
UnknownByteVar1:
	.ds.b	2
L000fe6:
	.ds.b	30
L001004:
	.ds.b	30
UnknownByteVar2:
	.ds.b	1
UnknownByteVar3:
	.ds.b	1
UnknownByteVar4:
	.ds.b	2
Stack:
	.ds.b	1028
StackTop:
	.ds.b	2
End:

	.end	Start
