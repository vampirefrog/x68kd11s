;=============================================
;  Filename float2.x
;
;
;  Base address 000000
;  Exec address 0000f6
;  Text size    005174 byte(s)
;  Data size    00001c byte(s)
;  Bss  size    00014a byte(s)
;  982 Labels
;
;  Commandline dis  -b2 -h -m68000 --sp -q1 -B -M -o120 -gfloat2.lab --overwrite float2.x float2.s
;          DIS version 3.16
;=============================================

	.include	inc/doscall.mac
	.include	inc/iocscall.mac
	.include	inc/fefunc.mac

	.cpu	68000

	.text

L000000:
	.dc.b	$ff,$ff,$ff,$ff,$80,$00
	.dc.l	L00001a
	.dc.l	L000022
L00000e:
	.dc.b	'FLOAT*/-'
L000016:
	.dc.l	$00000000
L00001a:
	move.l	a5,(L000016)
	rts

L000022:
	movem.l	d0-d1/a1/a5,-(sp)
	movea.l	(L000016,pc),a5
	tst.b	($0002,a5)
	bsr.s	L000040
	move.b	d0,($0003,a5)
	lsr.w	#8,d0
	move.b	d0,($0004,a5)
	movem.l	(sp)+,d0-d1/a1/a5
	rts

L000040:
	bne.s	L00008a
	movea.l	($0012,a5),a1
L000046:
	tst.b	(a1)+
	bne.s	L000046
L00004a:
	move.b	(a1)+,d0
	beq.s	L000078
	cmp.b	#$2f,d0			;'/'
	beq.s	L00005a
	cmp.b	#$2d,d0			;'-'
	bne.s	L00004a
L00005a:
	move.b	(a1),d0
	or.b	#$20,d0
	cmp.b	#$71,d0			;'q'
	bne.s	L00006e
	move.w	#$4e71,(L000092)	;'Nq'
L00006e:
	cmp.b	#$68,d0			;'h'
	bne.s	L000078
	bsr.w	L000140
L000078:
	bsr.s	SetupVectors
	beq.s	L00008a
	bsr.s	L000096
	move.l	#L0052da,($000e,a5)
	moveq.l	#$00,d0
	rts

L00008a:
	move.w	#$5003,d0
	rts

L000090:
	movea.l	(sp)+,a1
L000092:
	DOS	_PRINT
	jmp	(a1)

L000096:
	moveq.l	#$08,d1
	lea.l	(LineFHandler,pc),a1
	IOCS	_B_INTVCS
	tst.b	($0cbc)
	bne.s	L0000ae
	move.w	#$4e71,(L0001c2)	;'Nq'
L0000ae:
	rts

SetupVectors:
	moveq.l	#$0b,d1
	lea.l	(LineFHandler,pc),a1
	IOCS	_B_INTVCS
	move.l	d0,(L0001a0+$000002)
	movea.l	d0,a1
	subq.l	#4,a1
	IOCS	_B_LPEEK
	cmp.l	(L0001a6,pc),d0
	bne.s	L0000e8
	pea.l	(L000166)
	bsr.s	L000090
	addq.l	#4,sp
L0000d8:
	movea.l	(L0001a0+$000002),a1
	moveq.l	#$0b,d1
	IOCS	_B_INTVCS
	moveq.l	#$00,d0
	rts

L0000e8:
	bsr.w	L0050fc
	beq.s	L0000d8
	bsr.w	L00511a
	moveq.l	#$ff,d0
	rts

Start:
	bsr.s	ParseCmdLine
	clr.l	-(sp)
	DOS	_SUPER
	move.l	d0,(sp)
	bsr.s	SetupVectors
	beq.s	L000110
	bsr.s	L000096
	DOS	_SUPER
	clr.w	-(sp)
	move.l	#$000052da,-(sp)
	DOS	_KEEPPR

L000110:
	DOS	_SUPER
	move.w	#$ffff,-(sp)
	DOS	_EXIT2

ParseCmdLine:
	bsr.s	L000152
	cmp.w	#$002f,d0		;'/'
	beq.s	L000126
	cmp.w	#$002d,d0		;'-'
	bne.s	L000150
L000126:
	bsr.s	L000152
	or.w	#$0020,d0
	cmp.b	#$71,d0			;'q'
	bne.s	L00013a
	move.w	#$4e71,(L000092)	;'Nq'
L00013a:
	cmp.w	#$0068,d0		;'h'
	bne.s	L000150
L000140:
	move.w	#$4e73,d0		;'Ns'
	move.w	d0,(L0001d8)
	move.w	d0,(L004f88)
L000150:
	rts

L000152:
	addq.l	#1,a2
	moveq.l	#$00,d0
	move.b	(a2),d0
	cmp.w	#$0020,d0		;' '
	beq.s	L000152
	cmp.w	#$0009,d0
	beq.s	L000152
	rts

L000166:
	.dc.b	$0d,$0a
	.dc.b	'すでに浮動小数点演算パッケージは登録されています',$0d,$0a,$00,$00
L00019c:
	movem.l	(sp)+,d6/a5-a6
L0001a0:
	jmp	($00000000).l

L0001a6:
	not.w	d5
	bne.s	L000218
LineFHandler:
	movem.l	d6/a5-a6,-(sp)
	lea.l	($000e,sp),a6
	movea.l	(a6),a5
	move.w	(a5)+,d6
	add.w	#$0200,d6
	cmp.w	#$0100,d6
	bcc.s	L00019c
	move.l	a5,(a6)+
L0001c2:
	addq.l	#2,a6
	add.w	d6,d6
	add.w	d6,d6
	movea.l	(FECallTable,pc,d6.w),a5
	jsr	(a5)
	move.w	sr,d6
	move.b	d6,($000d,sp)
	movem.l	(sp)+,d6/a5-a6
L0001d8:
	tst.w	(sp)
	bmi.s	L0001de
	rte

L0001de:
	ori.w	#$8000,sr
	rte

L0001e4:
	addq.l	#4,sp
	move.b	d6,($000d,sp)
	movem.l	(sp)+,d6/a5-a6
	tst.w	(sp)
	bmi.s	L0001de
	rte

__FEVECS:
	cmp.l	#$0000fe00,d0
	bcs.s	L00021c
	cmp.l	#$0000ff00,d0
	bcc.s	L00021c
	movem.l	a1,-(sp)
	sub.w	#$fe00,d0
	asl.l	#2,d0
	lea.l	(FECallTable,pc),a1
	adda.l	d0,a1
	move.l	(a1),d0
	move.l	a0,(a1)
L000218:
	movea.l	(sp)+,a1
	rts

L00021c:
	moveq.l	#$ff,d0
__NOP:
	rts

FECallTable:
	.dc.l	__LMUL
	.dc.l	__LDIV
	.dc.l	__LMOD
	.dc.l	__NOP
	.dc.l	__UMUL
	.dc.l	__UDIV
	.dc.l	__UMOD
	.dc.l	__NOP
	.dc.l	__IMUL
	.dc.l	__IDIV
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__RANDOMIZE
	.dc.l	__SRAND
	.dc.l	__RAND
	.dc.l	__NOP
	.dc.l	__STOL
	.dc.l	__LTOS
	.dc.l	__STOH
	.dc.l	__HTOS
	.dc.l	__STOO
	.dc.l	__OTOS
	.dc.l	__STOB
	.dc.l	__BTOS
	.dc.l	__IUSING
	.dc.l	__NOP
	.dc.l	__LTOD
	.dc.l	__DTOL
	.dc.l	__LTOF
	.dc.l	__FTOL
	.dc.l	__FTOD
	.dc.l	__DTOF
	.dc.l	__VAL
	.dc.l	__USING
	.dc.l	__STOD
	.dc.l	__DTOS
	.dc.l	__ECVT
	.dc.l	__FCVT
	.dc.l	__GCVT
	.dc.l	__NOP
	.dc.l	__DTST
	.dc.l	__DCMP
	.dc.l	__DNEG
	.dc.l	__DADD
	.dc.l	__DSUB
	.dc.l	__DMUL
	.dc.l	__DDIV
	.dc.l	__DMOD
	.dc.l	__DABS
	.dc.l	__DCEIL
	.dc.l	__DFIX
	.dc.l	__DFLOOR
	.dc.l	__DFRAC
	.dc.l	__DSGN
	.dc.l	__SIN
	.dc.l	__COS
	.dc.l	__TAN
	.dc.l	__ATAN
	.dc.l	__LOG
	.dc.l	__EXP
	.dc.l	__SQR
	.dc.l	__PI
	.dc.l	__NPI
	.dc.l	__POWER
	.dc.l	__RND
	.dc.l	__SINH
	.dc.l	__COSH
	.dc.l	__TANH
	.dc.l	__ATANH
	.dc.l	__ASIN
	.dc.l	__ACOS
	.dc.l	__LOG10
	.dc.l	__LOG2
	.dc.l	__DFREXP
	.dc.l	__DLDEXP
	.dc.l	__DADDONE
	.dc.l	__DSUBONE
	.dc.l	__DDIVTWO
	.dc.l	__DIEECNV
	.dc.l	__DIEECNV
	.dc.l	__FVAL
	.dc.l	__FUSING
	.dc.l	__STOF
	.dc.l	__FTOS
	.dc.l	__FECVT
	.dc.l	__FFCVT
	.dc.l	__FGCVT
	.dc.l	__NOP
	.dc.l	__FTST
	.dc.l	__FCMP
	.dc.l	__FNEG
	.dc.l	__FADD
	.dc.l	__FSUB
	.dc.l	__FMUL
	.dc.l	__FDIV
	.dc.l	__FMOD
	.dc.l	__FABS
	.dc.l	__FCEIL
	.dc.l	__FFIX
	.dc.l	__FFLOOR
	.dc.l	__FFRAC
	.dc.l	__FSGN
	.dc.l	__FSIN
	.dc.l	__FCOS
	.dc.l	__FTAN
	.dc.l	__FATAN
	.dc.l	__FLOG
	.dc.l	__FEXP
	.dc.l	__FSQR
	.dc.l	__FPI
	.dc.l	__FNPI
	.dc.l	__FPOWER
	.dc.l	__FRND
	.dc.l	__FSINH
	.dc.l	__FCOSH
	.dc.l	__FTANH
	.dc.l	__FATANH
	.dc.l	__FASIN
	.dc.l	__FACOS
	.dc.l	__FLOG10
	.dc.l	__FLOG2
	.dc.l	__FFREXP
	.dc.l	__FLDEXP
	.dc.l	__FADDONE
	.dc.l	__FSUBONE
	.dc.l	__FDIVTWO
	.dc.l	__DIEECNV
	.dc.l	__DIEECNV
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__NOP
	.dc.l	__CLMUL
	.dc.l	__CLDIV
	.dc.l	__CLMOD
	.dc.l	__CUMUL
	.dc.l	__CUDIV
	.dc.l	__CUMOD
	.dc.l	__CLTOD
	.dc.l	__CDTOL
	.dc.l	__CLTOF
	.dc.l	__CFTOL
	.dc.l	__CFTOD
	.dc.l	__CDTOF
	.dc.l	__CDCMP
	.dc.l	__CDADD
	.dc.l	__CDSUB
	.dc.l	__CDMUL
	.dc.l	__CDDIV
	.dc.l	__CDMOD
	.dc.l	__CFCMP
	.dc.l	__CFADD
	.dc.l	__CFSUB
	.dc.l	__CFMUL
	.dc.l	__CFDIV
	.dc.l	__CFMOD
	.dc.l	__CDTST
	.dc.l	__CFTST
	.dc.l	__CDINC
	.dc.l	__CFINC
	.dc.l	__CDDEC
	.dc.l	__CFDEC
	.dc.l	__FEVARG
	.dc.l	__FEVECS
__CDTST:
	btst.b	#$05,($0010,sp)
	bne.s	L00062a
	move.l	usp,a6
L00062a:
	move.l	d1,-(sp)
	move.l	d0,-(sp)
	movem.l	(a6),d0-d1
	bsr.w	__DTST
	move.w	sr,d6
	move.l	(sp)+,d0
	move.l	(sp)+,d1
	bra.w	L0001e4

__CFTST:
	btst.b	#$05,($0010,sp)
	bne.s	L00064a
	move.l	usp,a6
L00064a:
	move.l	d0,-(sp)
	move.l	(a6),d0
	bsr.w	__FTST
	move.w	sr,d6
	move.l	(sp)+,d0
	bra.w	L0001e4

__CLMUL:
	btst.b	#$05,($0010,sp)
	bne.s	L000664
	move.l	usp,a6
L000664:
	move.l	d1,-(sp)
	move.l	d0,-(sp)
	movem.l	(a6),d0-d1
	bsr.w	__LMUL
	move.w	sr,d6
	move.l	d0,(a6)
	move.l	(sp)+,d0
	move.l	(sp)+,d1
	bra.w	L0001e4

__CLDIV:
	btst.b	#$05,($0010,sp)
	bne.s	L000686
	move.l	usp,a6
L000686:
	move.l	d1,-(sp)
	move.l	d0,-(sp)
	movem.l	(a6),d0-d1
	bsr.w	__LDIV
	move.w	sr,d6
	move.l	d0,(a6)
	move.l	(sp)+,d0
	move.l	(sp)+,d1
	bra.w	L0001e4

__CLMOD:
	btst.b	#$05,($0010,sp)
	bne.s	L0006a8
	move.l	usp,a6
L0006a8:
	movem.l	d0-d1,-(sp)
	movem.l	(a6),d0-d1
	bsr.w	__LMOD
	movem.l	d0-d1,(a6)
	movem.l	(sp)+,d0-d1
	rts

__CUMUL:
	btst.b	#$05,($0010,sp)
	bne.s	L0006c8
	move.l	usp,a6
L0006c8:
	movem.l	d0-d1,-(sp)
	movem.l	(a6),d0-d1
	bsr.w	__UMUL
	movem.l	d0-d1,(a6)
	movem.l	(sp)+,d0-d1
	rts

__CUDIV:
	btst.b	#$05,($0010,sp)
	bne.s	L0006e8
	move.l	usp,a6
L0006e8:
	movem.l	d0-d1,-(sp)
	movem.l	(a6),d0-d1
	bsr.w	__UDIV
	movem.l	d0-d1,(a6)
	movem.l	(sp)+,d0-d1
	rts

__CUMOD:
	btst.b	#$05,($0010,sp)
	bne.s	L000708
	move.l	usp,a6
L000708:
	movem.l	d0-d1,-(sp)
	movem.l	(a6),d0-d1
	bsr.w	__UMOD
	movem.l	d0-d1,(a6)
	movem.l	(sp)+,d0-d1
	rts

__CDCMP:
	btst.b	#$05,($0010,sp)
	bne.s	L000728
	move.l	usp,a6
L000728:
	movem.l	d0-d3,-(sp)
	movem.l	(a6),d0-d3
	bsr.w	__DCMP
	movem.l	(sp)+,d0-d3
	rts

__CFCMP:
	btst.b	#$05,($0010,sp)
	bne.s	L000744
	move.l	usp,a6
L000744:
	movem.l	d0-d1,-(sp)
	movem.l	(a6),d0-d1
	bsr.w	__FCMP
	movem.l	(sp)+,d0-d1
	rts

__BTOS:
	movem.l	d0-d2/a1,-(sp)
	link.w	a6,#-$0022
	movea.l	sp,a1
	moveq.l	#$1f,d1
L000762:
	moveq.l	#$30,d2			;'0'
	lsl.l	#1,d0
	bcc.s	L00076a
	addq.b	#1,d2
L00076a:
	move.b	d2,(a1)+
	dbra.w	d1,L000762
	jmp	(L000e5e)

L000776:
	movem.l	d0-d1/a0,-(sp)
	move.b	(a0)+,d0
L00077c:
	move.b	(a0),d1
	move.b	d0,(a0)+
	beq.s	L000786
	move.b	d1,d0
	bra.s	L00077c

L000786:
	movem.l	(sp)+,d0-d1/a0
	rts

L00078c:
	addq.l	#1,a0
L00078e:
	move.b	(a0),d0
	cmp.b	#$09,d0
	beq.s	L00078c
	cmp.b	#$20,d0			;' '
	beq.s	L00078c
	tst.b	d0
	rts

L0007a0:
	movea.l	(-$0026,a6),a0
	tst.w	d0
	beq.s	L0007c8
	bmi.s	L0007c8
	clr.w	d1
L0007ac:
	cmp.w	#$00ff,d1
	beq.s	L0007c8
	cmp.w	d0,d1
	beq.s	L0007c8
	cmp.w	#$000e,d1
	bcc.s	L0007c2
	move.b	(a1)+,(a0)+
L0007be:
	addq.w	#1,d1
	bra.s	L0007ac

L0007c2:
	move.b	#$30,(a0)+		;'0'
	bra.s	L0007be

L0007c8:
	clr.b	(a0)
	rts

L0007cc:
	tst.w	d0
	bmi.s	L0007e8
	cmp.w	#$000e,d0
	bcc.s	L0007e8
	lea.l	(a1,d0.w),a0
	jsr	(L000f32)
	cmpa.l	a1,a0
	bcc.s	L0007e8
	movea.l	a0,a1
	addq.w	#1,d7
L0007e8:
	rts

__DABS:
	bclr.l	#$1f,d0
	rts

__DCMP:
	tst.l	d0
	bmi.s	L000816
	tst.l	d2
	bmi.s	L00080a
	cmp.l	d2,d0
	bcs.s	L000810
	bne.s	L00080a
	cmp.l	d3,d1
	bcs.s	L000810
	bne.s	L00080a
	move.w	#$0004,ccr
	rts

L00080a:
	move.w	#$0000,ccr
	rts

L000810:
	move.w	#$0009,ccr
	rts

L000816:
	tst.l	d2
	bpl.s	L000810
	cmp.l	d2,d0
	bcs.s	L00080a
	bne.s	L000810
	cmp.l	d3,d1
	bcs.s	L00080a
	bne.s	L000810
	move.w	#$0004,ccr
	rts

__DDIVTWO:
	tst.l	d0
	beq.s	L00086c
	bmi.s	L00084c
	cmp.l	#$7ff00000,d0
	bcc.s	L00086c
	sub.l	#$00100000,d0
	bcs.s	L000864
	cmp.l	#$00100000,d0
	bcs.s	L000864
	rts

L00084c:
	cmp.l	#$fff00000,d0
	bcc.s	L00086c
	sub.l	#$00100000,d0
	cmp.l	#$80100000,d0
	bcs.s	L000864
	rts

L000864:
	moveq.l	#$00,d0
	moveq.l	#$00,d1
	move.w	#$0005,ccr
L00086c:
	rts

__DFRAC:
	move.l	d3,-(sp)
	move.l	d2,-(sp)
	move.l	d0,d2
	swap.w	d2
	asr.w	#4,d2
	move.w	d2,-(sp)
	and.w	#$07ff,d2
	sub.w	#$03fe,d2
	bls.s	L000900
	cmp.w	#$0010,d2
	bcs.s	L0008c2
	cmp.w	#$0020,d2		;' '
	bcs.s	L0008a6
	cmp.w	#$0034,d2		;'4'
	bhi.s	L000908
	move.l	d1,d0
	moveq.l	#$00,d1
	sub.w	#$0020,d2
	lsl.l	d2,d0
	add.w	#$0020,d2
	bra.s	L0008ce

L0008a6:
	sub.w	#$0010,d2
	swap.w	d0
	swap.w	d1
	move.w	d1,d0
	rol.l	d2,d0
	swap.w	d1
	lsl.l	d2,d1
	swap.w	d1
	move.w	d1,d0
	clr.w	d1
	add.w	#$0010,d2
	bra.s	L0008ce

L0008c2:
	move.l	d1,d3
	move.w	d0,d3
	lsl.l	d2,d0
	lsl.l	d2,d1
	rol.l	d2,d3
	move.w	d3,d0
L0008ce:
	move.l	d0,d3
	andi.l	#$001fffff,d3
	or.l	d1,d3
	beq.s	L000908
	moveq.l	#$14,d3
	btst.l	d3,d0
	bne.s	L0008ea
L0008e0:
	addq.w	#1,d2
	add.l	d1,d1
	addx.l	d0,d0
	btst.l	d3,d0
	beq.s	L0008e0
L0008ea:
	sub.w	(sp)+,d2
	neg.w	d2
	lsl.w	#4,d2
	swap.w	d0
	andi.w	#$000f,d0
	add.w	d2,d0
	swap.w	d0
	move.l	(sp)+,d2
	move.l	(sp)+,d3
	rts

L000900:
	addq.l	#2,sp
	move.l	(sp)+,d2
	move.l	(sp)+,d3
	rts

L000908:
	move.w	(sp)+,d0
	swap.w	d0
	andi.l	#$80000000,d0
	moveq.l	#$00,d1
	move.l	(sp)+,d2
	move.l	(sp)+,d3
	rts

__DFREXP:
	move.l	d0,d2
	bclr.l	#$1f,d2
	or.l	d1,d2
	beq.s	L000944
	move.l	d0,d2
	swap.w	d2
	lsr.w	#4,d2
	and.l	#$000007ff,d2
	sub.l	#$000003ff,d2
	and.l	#$800fffff,d0
	or.l	#$3ff00000,d0
	rts

L000944:
	moveq.l	#$00,d0
	moveq.l	#$00,d1
	moveq.l	#$00,d2
	rts

__DLDEXP:
	movem.l	d2,-(sp)
	add.l	#$000003ff,d2
	move.l	d2,-(sp)
	move.l	d0,d2
	bclr.l	#$1f,d2
	or.l	d1,d2
	beq.s	L000990
	move.l	d0,d2
	and.l	#$7ff00000,d2
	rol.l	#8,d2
	rol.l	#4,d2
	sub.l	#$000003ff,d2
	add.l	(sp)+,d2
	cmp.l	#$00000800,d2
	bcc.s	L00099c
	ror.l	#4,d2
	ror.l	#8,d2
	and.l	#$800fffff,d0
	or.l	d2,d0
	movem.l	(sp)+,d2
	rts

L000990:
	addq.l	#4,sp
	clr.l	d0
	clr.l	d1
	movem.l	(sp)+,d2
	rts

L00099c:
	ori.b	#$01,ccr
	movem.l	(sp)+,d2
	rts

__DNEG:
	tst.l	d0
	beq.s	L0009ae
	bchg.l	#$1f,d0
L0009ae:
	rts

L0009b0:
	move.w	sr,-(sp)
	bcc.s	L0009c8
	beq.w	L000a5c
	bmi.w	L000a6a
	bvs.s	L000a0e
	jsr	(__DTST)
	beq.w	L000a52
L0009c8:
	cmp.l	#$47f00000,d0
	bcc.s	L0009e4
	sub.l	#$38000000,d0
	bls.s	L000a08
	move.w	d0,d1
	lsl.l	#3,d0
	rol.l	#3,d1
	move.w	d1,d0
	move.w	(sp)+,ccr
	rts

L0009e4:
	tst.l	d0
	bpl.s	L000a0e
	cmp.l	#$c7f00000,d0
	bcc.s	L000a3a
	sub.l	#$b8000000,d0
	bls.s	L000a08
	move.w	d0,d1
	lsl.l	#3,d0
	rol.l	#3,d1
	move.w	d1,d0
	bset.l	#$1f,d0
	move.w	(sp)+,ccr
	rts

L000a08:
	move.w	(sp)+,ccr
	moveq.l	#$00,d0
	rts

L000a0e:
	cmp.l	#$7ff00000,d0
	beq.s	L000a26
	bcc.s	L000a30
	move.w	(sp)+,ccr
	move.l	#$7f800000,d0
	move.w	#$0003,ccr
	rts

L000a26:
	andi.l	#$ff800000,d0
	move.w	(sp)+,ccr
	rts

L000a30:
	or.l	#$7fffffff,d0
	move.w	(sp)+,ccr
	rts

L000a3a:
	cmp.l	#$fff00000,d0
	beq.s	L000a26
	bcc.s	L000a30
	move.l	#$ff800000,d0
	move.w	(sp)+,ccr
	move.w	#$000b,ccr
	rts

L000a52:
	moveq.l	#$00,d0
	move.w	(sp)+,ccr
	move.w	#$0001,ccr
	rts

L000a5c:
	move.w	(sp)+,ccr
	move.l	#$7fffffff,d0
	move.w	#$0005,ccr
	rts

L000a6a:
	move.w	(sp)+,ccr
	move.w	#$0009,ccr
	rts

__DTOS:
	moveq.l	#$0e,d2
	move.l	a0,-(sp)
	jsr	(__GCVT)
	movea.l	(sp),a0
	bsr.s	L000a8a
	movea.l	(sp)+,a0
	jsr	(L00113a)
	rts

L000a8a:
	move.b	(a0)+,d0
	beq.s	L000aa2
	cmp.b	#$2e,d0			;'.'
	bne.s	L000a8a
	move.b	(a0),d0
	jsr	(L000e92)
	bcc.s	L000aa2
	subq.l	#1,a0
	bsr.s	L000aa4
L000aa2:
	rts

L000aa4:
	move.b	($0001,a0),(a0)+
	bne.s	L000aa4
	rts

__DTST:
	move.l	d0,-(sp)
	or.w	d1,d0
	swap.w	d1
	or.w	d1,d0
	swap.w	d1
	tst.l	d0
	movem.l	(sp)+,d0
	rts

__FECVT:
	jsr	(__FTOD)
__ECVT:
	movem.l	d2-d7/a0-a2,-(sp)
	link.w	a6,#-$0026
	jsr	(L002710)
	move.w	(-$0016,a6),d0
	jsr	(L0007cc)
	move.w	(-$0016,a6),d0
	jsr	(L0007a0)
	unlk	a6
	move.w	d7,d0
	ext.l	d0
	move.l	d6,d1
	movem.l	(sp)+,d2-d7/a0-a2
	rts

__FABS:
	bclr.l	#$1f,d0
	rts

__FCMP:
	tst.l	d0
	bmi.s	L000b1a
	tst.l	d1
	bmi.s	L000b0e
	cmp.l	d1,d0
	bcs.s	L000b14
	bne.s	L000b0e
	move.w	#$0004,ccr
	rts

L000b0e:
	move.w	#$0000,ccr
	rts

L000b14:
	move.w	#$0009,ccr
	rts

L000b1a:
	tst.l	d1
	bpl.s	L000b14
	cmp.l	d1,d0
	bcs.s	L000b0e
	bne.s	L000b14
	move.w	#$0004,ccr
	rts

__FFCVT:
	jsr	(__FTOD)
__FCVT:
	movem.l	d2-d7/a0-a2,-(sp)
	link.w	a6,#-$0026
	jsr	(L002710)
	move.w	(-$0016,a6),d0
	add.w	d7,d0
	jsr	(L0007cc)
	move.w	(-$0016,a6),d0
	add.w	d7,d0
	jsr	(L0007a0)
	unlk	a6
	move.w	d7,d0
	ext.l	d0
	move.l	d6,d1
	movem.l	(sp)+,d2-d7/a0-a2
	rts

__FDIVTWO:
	tst.l	d0
	beq.s	L000ba2
	bmi.s	L000b84
	cmp.l	#$7f800000,d0
	bcc.s	L000ba2
	sub.l	#$00800000,d0
	bcs.s	L000b9c
	cmp.l	#$00800000,d0
	bcs.s	L000b9c
	rts

L000b84:
	cmp.l	#$ff800000,d0
	bcc.s	L000ba2
	sub.l	#$00800000,d0
	cmp.l	#$80800000,d0
	bcs.s	L000b9c
	rts

L000b9c:
	moveq.l	#$00,d0
	move.w	#$0005,ccr
L000ba2:
	rts

__FFRAC:
	move.l	d3,-(sp)
	move.l	d2,-(sp)
	move.l	d0,d2
	swap.w	d2
	asr.w	#7,d2
	move.w	d2,-(sp)
	and.w	#$00ff,d2
	sub.w	#$007e,d2
	bls.s	L000bee
	cmp.w	#$002f,d2		;'/'
	bhi.s	L000bf6
	lsl.l	d2,d0
	andi.l	#$00ffffff,d0
	beq.s	L000bf6
	moveq.l	#$17,d3
	btst.l	d3,d0
	bne.s	L000bd8
L000bd0:
	addq.w	#1,d2
	add.l	d0,d0
	btst.l	d3,d0
	beq.s	L000bd0
L000bd8:
	sub.w	(sp)+,d2
	neg.w	d2
	lsl.w	#7,d2
	swap.w	d0
	andi.w	#$007f,d0
	add.w	d2,d0
	swap.w	d0
	move.l	(sp)+,d2
	move.l	(sp)+,d3
	rts

L000bee:
	addq.l	#2,sp
	move.l	(sp)+,d2
	move.l	(sp)+,d3
	rts

L000bf6:
	move.w	(sp)+,d0
	swap.w	d0
	andi.l	#$80000000,d0
	move.l	(sp)+,d2
	move.l	(sp)+,d3
	rts

__FFREXP:
	move.l	d0,d1
	and.l	#$7fffffff,d1
	beq.s	L000c2e
	and.l	#$7f800000,d1
	rol.l	#8,d1
	rol.l	#1,d1
	sub.l	#$0000007f,d1
	and.l	#$807fffff,d0
	or.l	#$3f800000,d0
	rts

L000c2e:
	clr.l	d0
	rts

__FGCVT:
	move.l	d1,-(sp)
	jsr	(__FTOD)
	jsr	(__GCVT)
	movem.l	(sp)+,d1
	rts

__FLDEXP:
	move.l	d1,-(sp)
	add.l	#$0000007f,d1
	move.l	d1,-(sp)
	move.l	d0,d1
	and.l	#$7fffffff,d1
	beq.s	L000c84
	and.l	#$7f800000,d1
	rol.l	#8,d1
	rol.l	#1,d1
	sub.l	#$0000007f,d1
	add.l	(sp)+,d1
	cmp.l	#$00000100,d1
	bcc.s	L000c8c
	ror.l	#1,d1
	ror.l	#8,d1
	and.l	#$807fffff,d0
	or.l	d1,d0
	move.l	(sp)+,d1
	rts

L000c84:
	addq.l	#4,sp
	move.l	(sp)+,d1
	clr.l	d0
	rts

L000c8c:
	move.l	(sp)+,d1
	move.w	#$0001,ccr
	rts

__FNEG:
	tst.l	d0
	beq.s	L000c9c
	bchg.l	#$1f,d0
L000c9c:
	rts

__FRND:
	jsr	(__RND)
	jmp	(__DTOF)

__FSGN:
	tst.l	d0
	bpl.s	L000cc2
	cmp.l	#$80000000,d0
	beq.s	L000cbe
	move.l	#$bf800000,d0
	rts

L000cbe:
	moveq.l	#$00,d0
	rts

L000cc2:
	beq.s	L000cca
	move.l	#$3f800000,d0
L000cca:
	rts

__FTOS:
	move.l	d1,-(sp)
	jsr	(__FTOD)
	jsr	(__DTOS)
	jsr	(L0009b0)
	movem.l	(sp)+,d1
	rts

__FTST:
	cmp.l	#$80000000,d0
	beq.s	L000cf0
	tst.l	d0
L000cf0:
	rts

__FUSING:
	move.l	d1,-(sp)
	jsr	(__FTOD)
	jsr	(__USING)
	jsr	(L0009b0)
	movem.l	(sp)+,d1
	rts

__FVAL:
	move.l	d1,-(sp)
	jsr	(__VAL)
	jsr	(L0009b0)
	movem.l	(sp)+,d1
	rts

__GCVT:
	movem.l	d1-d2,-(sp)
	jsr	(__ECVT)
	tst.l	d1
	beq.s	L000d38
	jsr	(L000776)
	move.b	#$2d,(a0)+		;'-'
L000d38:
	tst.l	d0
	beq.s	L000da6
	bmi.s	L000d62
	and.w	#$00ff,d2
	cmp.w	d2,d0
	beq.s	L000dc2
	bcc.s	L000d82
	lea.l	(a0,d0.l),a0
	jsr	(L000776)
	move.b	#$2e,(a0)		;'.'
	jsr	(L00113a)
	bsr.w	L000e0c
	bra.s	L000dc2

L000d62:
	move.l	a0,-(sp)
	jsr	(L00113a)
	bsr.w	L000e0c
	suba.l	(sp),a0
	addq.l	#1,a0
	move.l	d0,d1
	neg.l	d1
	add.l	a0,d1
	movea.l	(sp)+,a0
	and.w	#$00ff,d2
	cmp.w	d2,d1
	bcs.s	L000dce
L000d82:
	addq.l	#1,a0
	jsr	(L000776)
	move.b	#$2e,(a0)		;'.'
	jsr	(L00113a)
	bsr.s	L000e0c
	move.b	#$45,(a0)+		;'E'
	subq.l	#1,d0
	jsr	(L001316)
	clr.b	(a0)
	bra.s	L000dc2

L000da6:
	jsr	(L000776)
	move.b	#$30,(a0)+		;'0'
	jsr	(L000776)
	move.b	#$2e,(a0)+		;'.'
	jsr	(L00113a)
	bsr.s	L000e0c
L000dc2:
	jsr	(L00113a)
	movem.l	(sp)+,d1-d2
	rts

L000dce:
	neg.l	d0
	and.w	#$00ff,d2
	cmp.w	d2,d0
	bls.s	L000dda
	move.w	d2,d0
L000dda:
	jsr	(L000776)
	move.b	#$30,(a0)+		;'0'
	jsr	(L000776)
	move.b	#$2e,(a0)+		;'.'
	tst.w	d0
	beq.s	L000e00
L000df2:
	jsr	(L000776)
	move.b	#$30,(a0)		;'0'
	subq.w	#1,d0
	bne.s	L000df2
L000e00:
	jsr	(L00113a)
	movem.l	(sp)+,d1-d2
	rts

L000e0c:
	cmpi.b	#$30,-(a0)		;'0'
	beq.s	L000e0c
	addq.l	#1,a0
	clr.b	(a0)
	rts

L000e18:
	clr.l	d7
	cmp.b	#$2b,d0			;'+'
	beq.s	L000e2a
	cmp.b	#$2d,d0			;'-'
	bne.s	L000e2c
	bset.l	#$1f,d7
L000e2a:
	addq.l	#1,a0
L000e2c:
	rts

__HTOS:
	movem.l	d0-d2/a1,-(sp)
	link.w	a6,#-$0022
	movea.l	sp,a1
	moveq.l	#$07,d2
L000e3a:
	clr.b	d1
	lsl.l	#1,d0
	roxl.b	#1,d1
	lsl.l	#1,d0
	roxl.b	#1,d1
	lsl.l	#1,d0
	roxl.b	#1,d1
	lsl.l	#1,d0
	roxl.b	#1,d1
	cmp.b	#$0a,d1
	bcs.s	L000e54
	addq.b	#7,d1
L000e54:
	add.b	#$30,d1			;'0'
	move.b	d1,(a1)+
	dbra.w	d2,L000e3a
L000e5e:
	clr.b	(a1)
	movea.l	sp,a1
L000e62:
	cmpi.b	#$30,(a1)		;'0'
	bne.s	L000e72
	tst.b	($0001,a1)
	beq.s	L000e72
	addq.l	#1,a1
	bra.s	L000e62

L000e72:
	move.b	(a1)+,(a0)+
	bne.s	L000e72
	subq.l	#1,a0
	unlk	a6
	movem.l	(sp)+,d0-d2/a1
	rts

__DIEECNV:
__FIEECNV:
__IEEDCNV:
__IEEFCNV:
	rts

L000e82:
	cmp.b	#$30,d0			;'0'
	bcs.s	L000e90
	cmp.b	#$32,d0			;'2'
	eori.b	#$01,ccr
L000e90:
	rts

L000e92:
	cmp.b	#$30,d0			;'0'
	bcs.s	L000ea0
	cmp.b	#$3a,d0			;':'
	eori.b	#$01,ccr
L000ea0:
	rts

L000ea2:
	cmp.b	#$61,d0			;'a'
	bcs.s	L000eb0
	cmp.b	#$7b,d0			;'{'
	eori.b	#$01,ccr
L000eb0:
	rts

L000eb2:
	cmp.b	#$30,d0			;'0'
	bcs.s	L000ec0
	cmp.b	#$38,d0			;'8'
	eori.b	#$01,ccr
L000ec0:
	rts

L000ec2:
	cmp.b	#$41,d0			;'A'
	bcs.s	L000ed0
	cmp.b	#$5b,d0			;'['
	eori.b	#$01,ccr
L000ed0:
	rts

L000ed2:
	jsr	(L000e92)
	bcc.s	L000ef4
	cmp.b	#$41,d0			;'A'
	bcs.s	L000ef4
	cmp.b	#$47,d0			;'G'
	bcs.s	L000ef0
	cmp.b	#$61,d0			;'a'
	bcs.s	L000ef4
	cmp.b	#$67,d0			;'g'
L000ef0:
	eori.b	#$01,ccr
L000ef4:
	rts

__IUSING:
	movem.l	d0-d2/a1,-(sp)
	lea.l	(-$0010,sp),sp
	movea.l	a0,a1
	movea.l	sp,a0
	jsr	(__LTOS)
	movea.l	sp,a0
	jsr	(L00134a)
	moveq.l	#$20,d2			;' '
	sub.b	d0,d1
L000f14:
	bmi.s	L000f1e
	beq.s	L000f1e
	move.b	d2,(a1)+
	subq.b	#1,d1
	bra.s	L000f14

L000f1e:
	movea.l	sp,a0
	jsr	(L00130e)
	movea.l	a1,a0
	lea.l	($0010,sp),sp
	movem.l	(sp)+,d0-d2/a1
	rts

L000f32:
	cmpi.b	#$35,(a0)		;'5'
	bcs.s	L000f4a
	move.b	#$30,(a0)		;'0'
L000f3c:
	addq.b	#1,-(a0)
	cmpi.b	#$39,(a0)		;'9'
	bls.s	L000f4a
	move.b	#$30,(a0)		;'0'
	bra.s	L000f3c

L000f4a:
	rts

__LTOS:
	movem.l	d0-d2/d7/a1-a2,-(sp)
	link.w	a6,#-$000a
	movea.l	sp,a1
	lea.l	(L000fae,pc),a2
	clr.w	d7
	tst.l	d0
	bpl.s	L000f64
	neg.l	d0
	not.w	d7
L000f64:
	move.l	(a2),d2
	beq.s	L000f7a
	clr.b	d1
L000f6a:
	addq.b	#1,d1
	sub.l	d2,d0
	bcc.s	L000f6a
	add.l	d2,d0
	subq.b	#1,d1
	move.b	d1,(a1)+
	addq.l	#4,a2
	bra.s	L000f64

L000f7a:
	clr.b	d1
	movea.l	sp,a1
L000f7e:
	tst.b	(a1)
	bne.s	L000f8c
	addq.l	#1,a1
	addq.b	#1,d1
	cmp.b	#$09,d1
	bcs.s	L000f7e
L000f8c:
	tst.w	d7
	beq.s	L000f94
	move.b	#$2d,(a0)+		;'-'
L000f94:
	move.b	(a1)+,d0
	add.b	#$30,d0			;'0'
	move.b	d0,(a0)+
	addq.b	#1,d1
	cmp.b	#$0a,d1
	bcs.s	L000f94
	clr.b	(a0)
	unlk	a6
	movem.l	(sp)+,d0-d2/d7/a1-a2
	rts

L000fae:
	.dc.l	$3b9aca00,$05f5e100
	.dc.l	$00989680,$000f4240
	.dc.l	$000186a0,$00002710
	.dc.l	$000003e8,$00000064
	.dc.l	$0000000a,$00000001
	.dc.l	$00000000
__OTOS:
	movem.l	d0-d2/a1,-(sp)
	link.w	a6,#-$0022
	movea.l	sp,a1
	moveq.l	#$0a,d2
	clr.b	d1
	bra.s	L000ff0

L000fea:
	clr.b	d1
	lsl.l	#1,d0
	roxl.b	#1,d1
L000ff0:
	lsl.l	#1,d0
	roxl.b	#1,d1
	lsl.l	#1,d0
	roxl.b	#1,d1
	add.b	#$30,d1			;'0'
	move.b	d1,(a1)+
	dbra.w	d2,L000fea
	jmp	(L000e5e)

__SRAND:
	movem.l	d7/a5,-(sp)
	lea.l	(L005190),a5
	moveq.l	#$36,d7			;'6'
L001014:
	mulu.w	#$3d09,d0
	addq.w	#1,d0
	move.w	d0,(a5)+
	dbra.w	d7,L001014
	move.w	#$0036,(L005174)	;'6'
	bsr.s	L001032
	movem.l	(sp)+,d7/a5
	moveq.l	#$00,d0
	rts

L001032:
	lea.l	(L005190),a5
	moveq.l	#$17,d7
L00103a:
	move.w	($003e,a5),d0
	sub.w	d0,(a5)+
	dbra.w	d7,L00103a
	moveq.l	#$1e,d7
L001046:
	move.w	(-$0030,a5),d0
	sub.w	d0,(a5)+
	dbra.w	d7,L001046
	rts

L001052:
	moveq.l	#$33,d0			;'3'
	bsr.s	__SRAND
__RAND:
	move.w	(L005174,pc),d0
	bmi.s	L001052
	movem.l	d7/a5,-(sp)
	cmp.w	#$0036,d0		;'6'
	bne.s	L00106a
	bsr.s	L001032
	moveq.l	#$ff,d0
L00106a:
	addq.w	#1,d0
	move.w	d0,(L005174)
	add.w	d0,d0
	lea.l	(L005190),a5
	move.w	(a5,d0.w),d0
	and.l	#$00007fff,d0
	movem.l	(sp)+,d7/a5
	rts

__RANDOMIZE:
	movem.l	d7/a5,-(sp)
	lea.l	(L0051fe),a5
	moveq.l	#$36,d7			;'6'
L001096:
	mulu.w	#$3d09,d0
	addq.w	#1,d0
	move.w	d0,(a5)+
	move.w	d0,(a5)+
	dbra.w	d7,L001096
	move.w	#$0036,(L005176)	;'6'
	bsr.s	L0010ba
	bsr.s	L0010ba
	bsr.s	L0010ba
	movem.l	(sp)+,d7/a5
	moveq.l	#$00,d0
	rts

L0010ba:
	lea.l	(L0051fe),a5
	moveq.l	#$17,d7
L0010c2:
	move.l	($007c,a5),d0
	sub.l	d0,(a5)+
	dbra.w	d7,L0010c2
	moveq.l	#$1e,d7
L0010ce:
	move.l	(-$0060,a5),d0
	sub.l	d0,(a5)+
	dbra.w	d7,L0010ce
	rts

__RND:
	movem.l	d7/a5,-(sp)
	bsr.s	L001110
	move.l	d0,d1
	bsr.s	L001110
	andi.l	#$001fffff,d0
	move.w	#$1ff0,d7
	bra.s	L0010f6

L0010f0:
	add.l	d1,d1
	addx.l	d0,d0
	subq.w	#8,d7
L0010f6:
	bclr.l	#$14,d0
	beq.s	L0010f0
	add.w	d7,d7
	swap.w	d0
	or.w	d7,d0
	swap.w	d0
	movem.l	(sp)+,d7/a5
	rts

L00110a:
	moveq.l	#$6f,d0			;'o'
	bsr.w	__RANDOMIZE
L001110:
	move.w	(L005176,pc),d0
	bmi.s	L00110a
	cmp.w	#$0036,d0		;'6'
	bne.s	L001120
	bsr.s	L0010ba
	moveq.l	#$ff,d0
L001120:
	addq.w	#1,d0
	move.w	d0,(L005176)
	add.w	d0,d0
	add.w	d0,d0
	lea.l	(L0051fe),a5
	move.l	(a5,d0.w),d0
	rts

L001138:
	addq.l	#1,a0
L00113a:
	tst.b	(a0)
	bne.s	L001138
	rts

__DSGN:
	tst.l	d0
	bpl.s	L00115e
	cmp.l	#$80000000,d0
	bne.s	L001150
	tst.l	d1
	beq.s	L00115a
L001150:
	move.l	#$bff00000,d0
	moveq.l	#$00,d1
	rts

L00115a:
	clr.l	d0
	rts

L00115e:
	bne.s	L001164
	tst.l	d1
	beq.s	L00116c
L001164:
	move.l	#$3ff00000,d0
	moveq.l	#$00,d1
L00116c:
	rts

__STOB:
	move.l	d1,-(sp)
	clr.l	d0
	move.b	(a0),d0
	jsr	(L000e82)
	bcs.s	L0011ac
	sub.b	#$30,d0			;'0'
	move.l	d0,d1
L001182:
	addq.l	#1,a0
	move.b	(a0),d0
	jsr	(L000e82)
	bcs.s	L00119a
	lsl.l	#1,d1
	bcs.s	L0011a4
	sub.b	#$30,d0			;'0'
	or.b	d0,d1
	bra.s	L001182

L00119a:
	move.l	d1,d0
	move.l	(sp)+,d1
	move.w	#$0000,ccr
	rts

L0011a4:
	move.l	(sp)+,d1
	move.w	#$0003,ccr
	rts

L0011ac:
	move.l	(sp)+,d1
	move.w	#$0009,ccr
	rts

__STOF:
	move.l	d1,-(sp)
	jsr	(__STOD)
	jsr	(L0009b0)
	movem.l	(sp)+,d1
	rts

__STOH:
	move.l	d1,-(sp)
	clr.l	d0
	move.b	(a0),d0
	jsr	(L000ed2)
	bcs.s	L001210
	jsr	(L001218)
	move.l	d0,d1
L0011de:
	addq.l	#1,a0
	move.b	(a0),d0
	jsr	(L000ed2)
	bcs.s	L0011fe
	cmp.l	#$10000000,d1
	bcc.s	L001208
	lsl.l	#4,d1
	jsr	(L001218)
	or.b	d0,d1
	bra.s	L0011de

L0011fe:
	move.l	d1,d0
	move.l	(sp)+,d1
	move.w	#$0000,ccr
	rts

L001208:
	move.l	(sp)+,d1
	move.w	#$0003,ccr
	rts

L001210:
	move.l	(sp)+,d1
	move.w	#$0009,ccr
	rts

L001218:
	jsr	(L001358)
	cmp.b	#$61,d0			;'a'
	bcs.s	L001228
	add.b	#-$27,d0
L001228:
	add.b	#-$30,d0
	rts

__STOL:
	movem.l	d1-d7,-(sp)
	link.w	a6,#$0000
	clr.l	d0
	jsr	(L00078e)
	beq.s	L00128a
	jsr	(L000e18)
	move.b	(a0),d0
	jsr	(L000e92)
	bcs.s	L00128a
	sub.b	#$30,d0			;'0'
	clr.l	d1
	move.b	d0,d1
L001258:
	addq.l	#1,a0
	move.b	(a0),d0
	jsr	(L000e92)
	bcs.s	L001296
	sub.b	#$30,d0			;'0'
	move.l	d1,-(sp)
	lsl.l	#1,d1
	bcs.s	L00127e
	lsl.l	#1,d1
	bcs.s	L00127e
	add.l	(sp)+,d1
	bcs.s	L00127e
	lsl.l	#1,d1
	bcs.s	L00127e
	add.l	d0,d1
	bcc.s	L001258
L00127e:
	unlk	a6
	movem.l	(sp)+,d1-d7
	move.w	#$0003,ccr
	rts

L00128a:
	unlk	a6
	movem.l	(sp)+,d1-d7
	move.w	#$0009,ccr
	rts

L001296:
	btst.l	#$1f,d7
	bne.s	L0012ae
	tst.l	d1
	bmi.s	L00127e
L0012a0:
	move.l	d1,d0
	unlk	a6
	movem.l	(sp)+,d1-d7
	move.w	#$0000,ccr
	rts

L0012ae:
	tst.l	d1
	bpl.s	L0012bc
	cmp.l	#$80000000,d1
	beq.s	L0012a0
	bra.s	L00127e

L0012bc:
	neg.l	d1
	bra.s	L0012a0

__STOO:
	move.l	d1,-(sp)
	clr.l	d0
	move.b	(a0),d0
	jsr	(L000eb2)
	bcs.s	L001306
	sub.b	#$30,d0			;'0'
	move.l	d0,d1
L0012d4:
	addq.l	#1,a0
	move.b	(a0),d0
	jsr	(L000eb2)
	bcs.s	L0012f4
	lsl.l	#1,d1
	bcs.s	L0012fe
	lsl.l	#1,d1
	bcs.s	L0012fe
	lsl.l	#1,d1
	bcs.s	L0012fe
	sub.b	#$30,d0			;'0'
	or.b	d0,d1
	bra.s	L0012d4

L0012f4:
	move.l	d1,d0
	move.l	(sp)+,d1
	move.w	#$0000,ccr
	rts

L0012fe:
	move.l	(sp)+,d1
	move.w	#$0003,ccr
	rts

L001306:
	move.l	(sp)+,d1
	move.w	#$0009,ccr
	rts

L00130e:
	move.b	(a0)+,(a1)+
	bne.s	L00130e
	subq.l	#1,a1
	rts

L001316:
	move.b	#$2b,d1			;'+'
	tst.l	d0
	bpl.s	L001324
	move.b	#$2d,d1			;'-'
	neg.l	d0
L001324:
	move.b	d1,(a0)+
	move.w	#$0064,d1		;'d'
	bsr.s	L00133a
	move.w	#$000a,d1
	bsr.s	L00133a
	add.b	#$30,d0			;'0'
	move.b	d0,(a0)+
	rts

L00133a:
	move.b	#$2f,d2			;'/'
L00133e:
	addq.b	#1,d2
	sub.w	d1,d0
	bcc.s	L00133e
	add.w	d1,d0
	move.b	d2,(a0)+
	rts

L00134a:
	moveq.l	#$00,d0
L00134c:
	tst.b	(a0)
	beq.s	L001356
	addq.l	#1,a0
	addq.l	#1,d0
	bra.s	L00134c

L001356:
	rts

L001358:
	jsr	(L000ec2)
	bcs.s	L001364
	add.b	#$20,d0			;' '
L001364:
	rts

L001366:
	jsr	(L000ea2)
	bcs.s	L001372
	sub.b	#$20,d0			;' '
L001372:
	rts

__USING:
	movem.l	d2-d7/a0-a2,-(sp)
	tst.l	d3
	bpl.s	L00137e
	clr.l	d3
L00137e:
	jsr	(__DTST)
	beq.s	L00138e
	btst.l	#$03,d4
	bne.w	L00140e
L00138e:
	btst.l	#$04,d4
	beq.s	L001396
	addq.l	#1,d2
L001396:
	movem.l	d2-d3,-(sp)
	link.w	a6,#-$0026
	move.l	d3,d2
	jsr	(L002710)
	move.w	(-$0016,a6),d0
	add.w	d7,d0
	jsr	(L0007cc)
	move.w	(-$0016,a6),d0
	add.w	d7,d0
	jsr	(L0007a0)
	bsr.w	L001508
	bsr.w	L00152e
	bsr.w	L001548
	bsr.w	L001582
	bsr.s	L0013ec
	bsr.w	L001602
	bsr.w	L0015aa
	bsr.w	L00161c
	unlk	a6
	move.w	d7,d0
	ext.l	d0
	move.l	d6,d1
	addq.l	#8,sp
	movem.l	(sp)+,d2-d7/a0-a2
	rts

L0013ec:
	btst.b	#$03,($0017,a6)
	beq.s	L00140c
	movea.l	(-$0026,a6),a0
	jsr	(L00113a)
	move.b	#$45,(a0)+		;'E'
	clr.l	d0
	jsr	(L001316)
	clr.b	(a0)
L00140c:
	rts

L00140e:
	btst.l	#$04,d4
	bne.s	L00142e
	btst.l	#$05,d4
	bne.s	L00142e
	btst.l	#$06,d4
	bne.s	L00142e
	tst.l	d2
	beq.s	L00142e
	subq.l	#1,d2
	bne.s	L00142e
	tst.l	d3
	bne.s	L00142e
	moveq.l	#$01,d2
L00142e:
	movem.l	d2-d3,-(sp)
	link.w	a6,#-$0026
	add.l	d3,d2
	jsr	(L002710)
	move.w	(-$0016,a6),d0
	jsr	(L0007cc)
	move.w	(-$0016,a6),d0
	jsr	(L0007a0)
	bsr.s	L001480
	movea.l	(-$0026,a6),a0
	jsr	(L00113a)
	move.b	#$45,(a0)+		;'E'
	move.w	d7,d0
	ext.l	d0
	jsr	(L001316)
	clr.b	(a0)
	bsr.s	L0014a0
	unlk	a6
	move.w	d7,d0
	ext.l	d0
	move.l	d6,d1
	addq.l	#8,sp
	movem.l	(sp)+,d2-d7/a0-a2
	rts

L001480:
	move.l	($0004,a6),d0
	tst.l	($0010,a6)
	bmi.s	L00149c
	movea.l	(-$0026,a6),a0
	lea.l	(a0,d0.w),a0
	jsr	(L000776)
	move.b	#$2e,(a0)		;'.'
L00149c:
	sub.w	d0,d7
	rts

L0014a0:
	movea.l	(-$0026,a6),a0
	move.l	($0014,a6),d0
	btst.l	#$04,d0
	bne.s	L0014d6
	btst.l	#$05,d0
	bne.s	L0014f4
	btst.l	#$06,d0
	bne.s	L0014ea
	tst.l	d6
	bne.s	L0014de
	move.l	($000c,a6),d1
	beq.s	L001506
	moveq.l	#$20,d0			;' '
	cmp.w	#$0002,d1
	bcc.s	L0014e0
	tst.l	($0008,a6)
	beq.s	L001506
	moveq.l	#$30,d0			;'0'
	bra.s	L0014e0

L0014d6:
	tst.l	d6
	bne.s	L0014de
	moveq.l	#$2b,d0			;'+'
	bra.s	L0014e0

L0014de:
	moveq.l	#$2d,d0			;'-'
L0014e0:
	jsr	(L000776)
	move.b	d0,(a0)
	rts

L0014ea:
	jsr	(L00113a)
	moveq.l	#$20,d0			;' '
	bra.s	L0014fc

L0014f4:
	jsr	(L00113a)
	moveq.l	#$2b,d0			;'+'
L0014fc:
	tst.l	d6
	beq.s	L001502
	moveq.l	#$2d,d0			;'-'
L001502:
	move.b	d0,(a0)+
	clr.b	(a0)
L001506:
	rts

L001508:
	tst.w	d7
	bpl.s	L00152c
	neg.w	d7
	movea.l	(-$0026,a6),a0
	cmp.w	(-$0016,a6),d7
	bcs.s	L00151e
	move.w	(-$0016,a6),d7
	beq.s	L00152c
L00151e:
	jsr	(L000776)
	move.b	#$30,(a0)		;'0'
	subq.w	#1,d7
	bne.s	L00151e
L00152c:
	rts

L00152e:
	tst.l	($0010,a6)
	bmi.s	L001546
	movea.l	(-$0026,a6),a0
	lea.l	(a0,d7.w),a0
	jsr	(L000776)
	move.b	#$2e,(a0)		;'.'
L001546:
	rts

L001548:
	tst.w	d7
	bne.s	L001580
	move.l	($000c,a6),d0
	beq.s	L001580
	subq.l	#2,d0
	bcc.s	L001570
	move.l	($0014,a6),d0
	btst.l	#$04,d0
	bne.s	L001570
	btst.l	#$05,d0
	bne.s	L001570
	btst.l	#$06,d0
	bne.s	L001570
	tst.l	d6
	bne.s	L001580
L001570:
	movea.l	(-$0026,a6),a0
	jsr	(L000776)
	move.b	#$30,(a0)		;'0'
	addq.w	#1,d7
L001580:
	rts

L001582:
	btst.b	#$02,($0017,a6)
	beq.s	L0015a8
	movea.l	(-$0026,a6),a0
	lea.l	(a0,d7.w),a0
L001592:
	subq.l	#3,a0
	cmpa.l	(-$0026,a6),a0
	bls.s	L0015a8
	jsr	(L000776)
	move.b	#$2c,(a0)		;','
	addq.w	#1,d7
	bra.s	L001592

L0015a8:
	rts

L0015aa:
	movea.l	(-$0026,a6),a0
	move.l	($0014,a6),d0
	btst.l	#$04,d0
	bne.s	L0015d6
	btst.l	#$05,d0
	bne.s	L0015de
	btst.l	#$06,d0
	bne.s	L0015ec
	tst.l	d6
	beq.s	L0015d4
L0015c8:
	moveq.l	#$2d,d0			;'-'
L0015ca:
	jsr	(L000776)
	move.b	d0,(a0)
	addq.w	#1,d7
L0015d4:
	rts

L0015d6:
	tst.l	d6
	bne.s	L0015c8
	moveq.l	#$2b,d0			;'+'
	bra.s	L0015ca

L0015de:
	jsr	(L00113a)
	tst.l	d6
	bne.s	L0015fa
	moveq.l	#$2b,d0			;'+'
	bra.s	L0015fc

L0015ec:
	jsr	(L00113a)
	tst.l	d6
	bne.s	L0015fa
	moveq.l	#$20,d0			;' '
	bra.s	L0015fc

L0015fa:
	moveq.l	#$2d,d0			;'-'
L0015fc:
	move.b	d0,(a0)+
	clr.b	(a0)
	rts

L001602:
	btst.b	#$01,($0017,a6)
	beq.s	L00161a
	movea.l	(-$0026,a6),a0
	jsr	(L000776)
	move.b	#$5c,(a0)		;'\'
	addq.w	#1,d7
L00161a:
	rts

L00161c:
	ext.l	d7
	sub.l	($0004,a6),d7
	bcc.s	L001642
	movea.l	(-$0026,a6),a0
	neg.l	d7
	moveq.l	#$20,d0			;' '
	btst.b	#$00,($0017,a6)
	beq.s	L001636
	moveq.l	#$2a,d0			;'*'
L001636:
	jsr	(L000776)
	move.b	d0,(a0)
	subq.l	#1,d7
	bne.s	L001636
L001642:
	rts

__VAL:
	jsr	(L00078e)
	cmp.b	#$26,d0			;'&'
	bne.w	__STOD
	addq.l	#1,a0
	move.b	(a0)+,d0
	jsr	(L001366)
	cmp.b	#$42,d0			;'B'
	beq.s	L001674
	cmp.b	#$4f,d0			;'O'
	beq.s	L00167c
	cmp.b	#$48,d0			;'H'
	beq.s	L001684
	move.w	#$0009,ccr
	rts

L001674:
	jsr	(__STOB)
	bra.s	L00168a

L00167c:
	jsr	(__STOO)
	bra.s	L00168a

L001684:
	jsr	(__STOH)
L00168a:
	bcs.s	L001696
	jsr	(__LTOD)
	move.w	#$0000,ccr
L001696:
	rts

__ACOS:
	movem.l	d2-d3/d6,-(sp)
	jsr	(__ASIN)
	bcs.s	L0016ba
	move.l	d0,d2
	move.l	d1,d3
	move.l	#$3ff921fb,d0
	move.l	#$54442d18,d1
	jsr	(__DSUB)
L0016ba:
	movem.l	(sp)+,d2-d3/d6
	rts

__ASIN:
	movem.l	d0-d3/d6/a5-a6,-(sp)
	bclr.l	#$1f,d0
	cmp.l	#$7ff00000,d0
	bcc.s	L00172e
	cmp.l	#$3ff00000,d0
	bcc.s	L001714
L0016d8:
	move.l	d0,d2
	move.l	d1,d3
	jsr	(__DMUL)
	move.l	d0,d2
	move.l	d1,d3
	move.l	#$3ff00000,d0
	moveq.l	#$00,d1
	jsr	(__DSUB)
	jsr	(__SQR)
	move.l	d0,d2
	move.l	d1,d3
	movem.l	(sp)+,d0-d1
	jsr	(__DDIV)
	jsr	(__ATAN)
	movem.l	(sp)+,d2-d3/d6/a5-a6
	rts

L001714:
	bne.s	L00171a
	tst.l	d1
	beq.s	L0016d8
L00171a:
	move.l	#$7fffffff,d0
	moveq.l	#$ff,d1
	addq.w	#8,sp
	movem.l	(sp)+,d2-d3/d6/a5-a6
	move.w	#$0001,ccr
	rts

L00172e:
	beq.s	L00171a
	movem.l	(sp)+,d0-d3/d6/a5-a6
	rts

L001736:
	bne.s	L00173c
	tst.l	d1
	beq.s	L00176c
L00173c:
	move.w	#$0000,ccr
	movem.l	(sp)+,d0/d2-d7/a3-a6
	rts

__ATAN:
	movem.l	d0/d2-d7/a3-a6,-(sp)
	bclr.l	#$1f,d0
	cmpi.l	#$3f900000,d0
	bcs.w	L001880
	moveq.l	#$00,d2
	moveq.l	#$00,d3
	cmp.l	#$3ff00000,d0
	bcs.s	L001798
	cmp.l	#$7ff00000,d0
	bcc.s	L001736
L00176c:
	move.l	d0,d2
	move.l	d1,d3
	move.l	#$3ff00000,d0
	moveq.l	#$00,d1
	jsr	(__DDIV)
	move.l	#$9b7812ae,d2
	move.l	#$ef4b9ee6,d3
	eori.w	#$8000,(sp)
	cmpi.l	#$3f900000,d0
	bcs.w	L00188c
L001798:
	jsr	(L004308)
	move.l	#$40000000,d4
	moveq.l	#$00,d5
	movea.l	d4,a4
	movea.l	d5,a5
	move.l	d1,d7
	move.l	d0,d6
	lea.l	(L001a0a),a6
	moveq.l	#$00,d0
	bra.s	L0017c6

L0017b8:
	addq.l	#8,a6
L0017ba:
	addq.w	#1,d0
	cmpi.w	#$0011,d0
	beq.s	L001806
	asr.l	#1,d4
	roxr.l	#1,d5
L0017c6:
	cmp.l	d4,d6
	bne.s	L0017cc
	cmp.l	d5,d7
L0017cc:
	bcs.s	L0017b8
	exg.l	d4,d6
	exg.l	d5,d7
	subx.l	d5,d7
	subx.l	d4,d6
	neg.l	d7
	negx.l	d6
	move.l	d5,d1
	move.w	d4,d5
	asr.l	d0,d4
	ror.l	d0,d5
	lsr.l	d0,d1
	move.w	d1,d5
	move.l	a5,d1
	add.l	d1,d5
	move.l	a4,d1
	addx.l	d1,d4
	movea.l	d4,a4
	movea.l	d5,a5
	move.l	d5,d1
	move.w	d4,d5
	asr.l	d0,d4
	ror.l	d0,d5
	lsr.l	d0,d1
	move.w	d1,d5
	move.l	(a6)+,d1
	add.l	(a6)+,d3
	addx.l	d1,d2
	bra.s	L0017ba

L001806:
	moveq.l	#$01,d0
	bra.s	L001814

L00180a:
	addq.l	#8,a6
L00180c:
	addq.w	#1,d0
	cmpi.w	#$0004,d0
	beq.s	L00185c
L001814:
	asr.l	#1,d4
	roxr.l	#1,d5
	cmp.l	d4,d6
	bne.s	L00181e
	cmp.l	d5,d7
L00181e:
	bcs.s	L00180a
	exg.l	d4,d6
	exg.l	d5,d7
	subx.l	d5,d7
	subx.l	d4,d6
	neg.l	d7
	negx.l	d6
	move.w	d4,d5
	asr.l	d0,d4
	ror.l	d0,d5
	move.w	d4,d5
	swap.w	d5
	swap.w	d4
	ext.l	d4
	move.l	a5,d1
	add.l	d1,d5
	move.l	a4,d1
	addx.l	d1,d4
	movea.l	d4,a4
	movea.l	d5,a5
	move.w	d4,d5
	asr.l	d0,d4
	ror.l	d0,d5
	move.w	d4,d5
	swap.w	d5
	swap.w	d4
	ext.l	d4
	move.l	(a6)+,d1
	add.l	(a6)+,d3
	addx.l	d1,d2
	bra.s	L00180c

L00185c:
	movem.l	d2-d3,-(sp)
	bsr.s	L0018ba
	movem.l	(sp)+,d2-d3
	add.l	d3,d1
	addx.l	d2,d0
	tst.l	(sp)+
	bpl.s	L001872
	neg.l	d1
	negx.l	d0
L001872:
	suba.w	a3,a3
	jsr	(L004354)
	movem.l	(sp)+,d2-d7/a3-a6
	rts

L001880:
	move.l	(sp)+,d0
	bsr.w	L001964
	movem.l	(sp)+,d2-d7/a3-a6
	rts

L00188c:
	bsr.w	L001964
	move.l	#$3ff921fb,d2
	move.l	#$54442d18,d3
	jsr	(__DSUB)
	tst.l	(sp)+
	bpl.s	L0018aa
	bchg.l	#$1f,d0
L0018aa:
	move.w	#$0000,ccr
	movem.l	(sp)+,d2-d7/a3-a6
	rts

L0018b4:
	roxr.l	#1,d2
	roxr.l	#1,d3
	bra.s	L0018d0

L0018ba:
	move.l	d3,-(sp)
	move.l	d2,-(sp)
	move.l	a4,d2
	move.l	a5,d3
	move.l	d6,d0
	move.l	d7,d1
	add.l	d3,d3
	addx.l	d2,d2
	bcs.s	L0018b4
	lsr.l	#1,d0
	roxr.l	#1,d1
L0018d0:
	moveq.l	#$00,d7
	move.l	d7,-(sp)
	move.l	d7,-(sp)
	move.l	d3,-(sp)
	move.l	d2,-(sp)
	move.l	d7,-(sp)
	move.l	d7,-(sp)
	swap.w	d2
	move.l	d1,d3
	move.w	d0,d3
	swap.w	d3
	divu.w	d2,d3
	movem.w	($0008,sp),d4-d6
	mulu.w	d3,d4
	mulu.w	d3,d5
	mulu.w	d3,d6
	moveq.l	#$00,d7
	move.w	d4,d6
	swap.w	d6
	move.w	d7,d4
	swap.w	d4
	add.l	d5,d6
	addx.l	d7,d4
	sub.l	d6,d1
	subx.l	d4,d0
	bcc.s	L001916
	movem.l	($0004,sp),d4-d5
L00190e:
	subq.w	#1,d3
	add.l	d5,d1
	addx.l	d4,d0
	bcc.s	L00190e
L001916:
	move.w	d3,($0012,sp)
	move.l	d1,d3
	divu.w	d2,d3
	bvc.s	L001922
	moveq.l	#$ff,d3
L001922:
	movem.w	($0008,sp),d4-d5
	mulu.w	d3,d4
	mulu.w	d3,d5
	move.w	d7,d5
	swap.w	d5
	add.l	d5,d4
	sub.l	d4,d1
	subx.l	d7,d0
	bcc.s	L001946
	movem.l	($0002,sp),d4-d5
L00193e:
	subq.w	#1,d3
	add.l	d5,d1
	addx.l	d4,d0
	bcc.s	L00193e
L001946:
	move.w	d3,($0014,sp)
	moveq.l	#$00,d3
	move.w	d1,d3
	swap.w	d3
	divu.w	d2,d3
	bvc.s	L001956
	moveq.l	#$ff,d3
L001956:
	move.w	d3,($0016,sp)
	addq.l	#8,sp
	addq.l	#8,sp
	movem.l	(sp)+,d0-d3
	rts

L001964:
	lea.l	(L001996,pc),a4
	lea.l	(__ATANH,pc),a5
	move.l	d0,d4
	move.l	d1,d5
	bsr.s	L001978
	move.w	#$0000,ccr
	rts

L001978:
	movem.l	d0-d1,-(sp)
	move.l	d0,d2
	move.l	d1,d3
	jsr	(__DMUL)
	jsr	(L003c46)
	movem.l	(sp)+,d2-d3
	jmp	(__DMUL)

L001996:
	.dc.b	$3f,$bc,$71,$c7,$1c,$71,$c7,$1c
	.dc.b	$bf,$c2,$49,$24,$92,$49,$24,$92
	.dc.b	$3f,$c9,$99,$99,$99,$99,$99,$9a
	.dc.b	$bf,$d5,$55,$55,$55,$55,$55,$55
	.dc.b	$3f,$f0,$00,$00,$00,$00,$00,$00
__ATANH:
	movem.l	d2-d3/d6,-(sp)
	move.l	d0,d2
	move.l	d1,d3
	move.l	#$3ff00000,d0
	moveq.l	#$00,d1
	jsr	(__DSUB)
	bcs.s	L001a04
	movem.l	d0-d1,-(sp)
	move.l	#$3ff00000,d0
	moveq.l	#$00,d1
	jsr	(__DADD)
	movem.l	(sp)+,d2-d3
	bcs.s	L001a04
	jsr	(__DDIV)
	bcs.s	L001a04
	jsr	(__LOG)
	bcs.s	L001a04
	jsr	(__DDIVTWO)
L001a04:
	movem.l	(sp)+,d2-d3/d6
	rts

L001a0a:
	.dc.b	$32,$43,$f6,$a8,$88,$5a,$30,$8d
	.dc.b	$1d,$ac,$67,$05,$61,$bb,$4f,$68
	.dc.b	$0f,$ad,$ba,$fc,$96,$40,$6e,$b1
	.dc.b	$07,$f5,$6e,$a6,$ab,$0b,$db,$71
	.dc.b	$03,$fe,$ab,$76,$e5,$9f,$bd,$38
	.dc.b	$01,$ff,$d5,$5b,$ba,$97,$62,$4a
	.dc.b	$00,$ff,$fa,$aa,$dd,$db,$94,$d5
	.dc.b	$00,$7f,$ff,$55,$56,$ee,$ea,$5c
	.dc.b	$00,$3f,$ff,$ea,$aa,$b7,$77,$6e
	.dc.b	$00,$1f,$ff,$fd,$55,$55,$bb,$bb
	.dc.b	$00,$0f,$ff,$ff,$aa,$aa,$ad,$dd
	.dc.b	$00,$07,$ff,$ff,$f5,$55,$55,$6e
	.dc.b	$00,$03,$ff,$ff,$fe,$aa,$aa,$ab
	.dc.b	$00,$01,$ff,$ff,$ff,$d5,$55,$55
	.dc.b	$00,$00,$ff,$ff,$ff,$fa,$aa,$aa
	.dc.b	$00,$00,$7f,$ff,$ff,$ff,$55,$55
	.dc.b	$00,$00,$3f,$ff,$ff,$ff,$ea,$aa
	.dc.b	$00,$00,$1f,$ff,$ff,$ff,$fd,$55
	.dc.b	$00,$00,$0f,$ff,$ff,$ff,$ff,$aa
	.dc.b	$00,$00,$07,$ff,$ff,$ff,$ff,$f5
	.dc.b	$00,$00,$03,$ff,$ff,$ff,$ff,$fe
	.dc.b	$00,$00,$01,$ff,$ff,$ff,$ff,$ff
	.dc.b	$00,$00,$00,$ff,$ff,$ff,$ff,$ff
	.dc.b	$00,$00,$00,$7f,$ff,$ff,$ff,$ff
	.dc.b	$00,$00,$00,$3f,$ff,$ff,$ff,$ff
	.dc.b	$00,$00,$00,$1f,$ff,$ff,$ff,$ff
	.dc.b	$00,$00,$00,$0f,$ff,$ff,$ff,$ff
	.dc.b	$00,$00,$00,$07,$ff,$ff,$ff,$ff
	.dc.b	$00,$00,$00,$03,$ff,$ff,$ff,$ff
	.dc.b	$00,$00,$00,$01,$ff,$ff,$ff,$ff
	.dc.b	$00,$00,$00,$00,$ff,$ff,$ff,$ff
	.dc.b	$00,$00,$00,$00,$7f,$ff,$ff,$ff
	.dc.b	$00,$00,$00,$00,$3f,$ff,$ff,$ff
	.dc.b	$00,$00,$00,$00,$1f,$ff,$ff,$ff
	.dc.b	$00,$00,$00,$00,$0f,$ff,$ff,$ff
	.dc.b	$00,$00,$00,$00,$07,$ff,$ff,$ff
	.dc.b	$00,$00,$00,$00,$03,$ff,$ff,$ff
	.dc.b	$00,$00,$00,$00,$01,$ff,$ff,$ff
	.dc.b	$00,$00,$00,$00,$00,$ff,$ff,$ff
	.dc.b	$00,$00,$00,$00,$00,$7f,$ff,$ff
L001b4a:
	move.l	d6,-(sp)
	bsr.s	__DADD
	movem.l	(sp)+,d6
	rts

L001b54:
	move.l	d6,-(sp)
	bsr.w	__DSUB
	movem.l	(sp)+,d6
	rts

L001b60:
	move.l	d2,d0
	move.l	d3,d1
	and.l	#$000fffff,d0
	swap.w	d5
	clr.w	d5
	or.l	d5,d0
	addq.l	#2,sp
	movem.l	(sp)+,d2-d5
	rts

L001b78:
	bra.w	L001cb2

L001b7c:
	tst.l	d1
	bne.w	L001c9e
	add.w	d5,d5
	cmp.w	d6,d5
	bne.w	L001c72
	tst.l	d3
	bne.w	L001ca0
	tst.l	d6
	bpl.w	L001c72
	addq.l	#2,sp
	move.l	#$7fffffff,d0
	moveq.l	#$ff,d1
	move.w	#$0001,ccr
	movem.l	(sp)+,d2-d5
	rts

L001baa:
	tst.l	d3
	bne.w	L001ca0
	addq.l	#2,sp
	bra.w	L001c74

__DADD:
	movem.l	d2-d5,-(sp)
L001bba:
	swap.w	d0
	swap.w	d2
	move.l	d0,d4
	move.l	d2,d5
	move.w	d4,d6
	eor.w	d5,d6
	swap.w	d6
	move.w	#$000f,d6
	and.w	d6,d0
	and.w	d6,d2
	addq.w	#1,d6
	or.w	d6,d0
	or.w	d6,d2
	neg.w	d6
	and.w	d6,d4
	and.w	d6,d5
	swap.w	d0
	swap.w	d2
	add.w	d6,d6
	add.w	d4,d4
	move.w	sr,-(sp)
	beq.w	L001b60
	cmp.w	d6,d4
	beq.s	L001b7c
	add.w	d5,d5
	beq.s	L001b78
	cmp.w	d6,d5
	beq.s	L001baa
	tst.l	d6
	bmi.w	L001dca
L001bfc:
	sub.w	d4,d5
	beq.w	L001cda
	bcs.s	L001c0e
	add.w	d4,d5
	exg.l	d0,d2
	exg.l	d1,d3
	exg.l	d4,d5
	sub.w	d4,d5
L001c0e:
	asr.w	#5,d5
	not.w	d5
	beq.s	L001c42
	cmp.w	#$0010,d5
	bls.s	L001c36
	cmp.w	#$0020,d5		;' '
	bhi.w	L001cc6
	sub.w	#$0010,d5
	move.w	d2,d3
	lsr.l	d5,d2
	ror.l	d5,d3
	move.w	d2,d3
	clr.w	d2
	swap.w	d3
	swap.w	d2
	bra.s	L001c42

L001c36:
	move.l	d3,d6
	move.w	d2,d3
	lsr.l	d5,d2
	ror.l	d5,d3
	lsr.l	d5,d6
	move.w	d6,d3
L001c42:
	lsr.l	#1,d2
	roxr.l	#1,d3
	addx.l	d3,d1
	addx.l	d2,d0
	btst.l	#$15,d0
	beq.s	L001c5e
	add.w	#$0020,d4
	cmp.w	#$ffe0,d4
	beq.s	L001c88
	lsr.l	#1,d0
	roxr.l	#1,d1
L001c5e:
	move.w	(sp)+,ccr
	roxr.w	#1,d4
	swap.w	d0
	and.w	#$000f,d0
	or.w	d4,d0
	swap.w	d0
	movem.l	(sp)+,d2-d5
	rts

L001c72:
	move.w	(sp)+,ccr
L001c74:
	move.l	#$ffe00000,d0
	moveq.l	#$00,d1
	roxr.l	#1,d0
	move.w	#$0000,ccr
	movem.l	(sp)+,d2-d5
	rts

L001c88:
	move.w	(sp)+,ccr
	move.l	#$ffe00000,d0
	moveq.l	#$00,d1
	roxr.l	#1,d0
	move.w	#$0003,ccr
	movem.l	(sp)+,d2-d5
	rts

L001c9e:
	move.w	(sp),ccr
L001ca0:
	addq.l	#2,sp
	moveq.l	#$ff,d0
	moveq.l	#$ff,d1
	roxr.l	#1,d0
	move.w	#$0000,ccr
	movem.l	(sp)+,d2-d5
	rts

L001cb2:
	move.w	(sp)+,ccr
	roxr.w	#1,d4
	swap.w	d0
	and.w	#$000f,d0
	or.w	d4,d0
	swap.w	d0
	movem.l	(sp)+,d2-d5
	rts

L001cc6:
	cmp.w	#$0034,d5		;'4'
	bhi.s	L001cb2
	sub.w	#$0020,d5
	move.l	d2,d3
	moveq.l	#$00,d2
	lsr.l	d5,d3
	bra.w	L001c42

L001cda:
	add.w	#$0020,d4
	cmp.w	#$ffe0,d4
	beq.s	L001c88
	add.l	d3,d1
	addx.l	d2,d0
	lsr.l	#1,d0
	roxr.l	#1,d1
	move.w	(sp)+,ccr
	roxr.w	#1,d4
	swap.w	d0
	and.w	#$000f,d0
	or.w	d4,d0
	swap.w	d0
	movem.l	(sp)+,d2-d5
	rts

L001d00:
	roxr.w	#1,d5
	swap.w	d6
	and.w	#$8000,d6
	eor.w	d6,d5
	eori.w	#$8000,d5
	move.l	d2,d0
	move.l	d3,d1
	and.l	#$000fffff,d0
	swap.w	d5
	clr.w	d5
	or.l	d5,d0
	movem.l	(sp)+,d2-d5
	rts

L001d24:
	and.l	#$000fffff,d0
	swap.w	d4
	clr.w	d4
	or.l	d4,d0
	movem.l	(sp)+,d2-d5
	rts

L001d36:
	bra.s	L001d00

L001d38:
	move.w	sr,-(sp)
	add.w	d4,d4
	cmp.w	d6,d4
	bne.s	L001d6a
	tst.l	d1
	bne.w	L001ca0
	tst.l	d3
	bne.w	L001c9e
	eori.w	#$0010,(sp)
	tst.l	d6
	bmi.w	L001c72
	addq.l	#2,sp
	move.l	#$7fffffff,d0
	moveq.l	#$ff,d1
	move.w	#$0001,ccr
	movem.l	(sp)+,d2-d5
	rts

L001d6a:
	tst.l	d3
	bne.w	L001c9e
	eori.w	#$0010,(sp)
	bra.w	L001c72

L001d78:
	tst.l	d1
	beq.w	L001c72
	bra.w	L001c9e

__DSUB:
	movem.l	d2-d5,-(sp)
L001d86:
	swap.w	d0
	swap.w	d2
	move.l	d0,d4
	move.l	d2,d5
	move.w	d4,d6
	eor.w	d5,d6
	swap.w	d6
	move.w	#$000f,d6
	and.w	d6,d0
	and.w	d6,d2
	addq.w	#1,d6
	or.w	d6,d0
	or.w	d6,d2
	neg.w	d6
	and.w	d6,d4
	and.w	d6,d5
	swap.w	d0
	swap.w	d2
	add.w	d6,d6
	add.w	d5,d5
	beq.w	L001d24
	cmp.w	d6,d5
	beq.s	L001d38
	add.w	d4,d4
	beq.w	L001d36
	move.w	sr,-(sp)
	cmp.w	d6,d4
	beq.s	L001d78
	tst.l	d6
	bmi.w	L001bfc
L001dca:
	sub.w	d4,d5
	beq.w	L001ec8
	bcs.s	L001de0
	add.w	d4,d5
	exg.l	d0,d2
	exg.l	d1,d3
	exg.l	d4,d5
	sub.w	d4,d5
	eori.w	#$0010,(sp)
L001de0:
	asr.w	#5,d5
	not.w	d5
	beq.s	L001e50
	cmp.w	#$0010,d5
	bls.s	L001e0c
	cmp.w	#$0020,d5		;' '
	bcc.w	L001e94
	sub.w	#$0011,d5
	move.w	d2,d3
	lsr.l	d5,d2
	ror.l	d5,d3
	move.w	d2,d3
	clr.w	d2
	swap.w	d3
	swap.w	d2
	lsr.l	#1,d2
	roxr.l	#1,d3
	bra.s	L001e18

L001e0c:
	move.l	d3,d6
	move.w	d2,d3
	lsr.l	d5,d2
	ror.l	d5,d3
	lsr.l	d5,d6
	move.w	d6,d3
L001e18:
	moveq.l	#$00,d6
	addx.l	d6,d3
	addx.l	d6,d2
	add.l	d1,d1
	addx.l	d0,d0
	sub.l	d3,d1
	subx.l	d2,d0
	btst.l	#$15,d0
	bne.s	L001e38
	sub.w	#$0020,d4
	beq.w	L001ee4
	add.l	d1,d1
	addx.l	d0,d0
L001e38:
	lsr.l	#1,d0
	roxr.l	#1,d1
	move.w	(sp)+,ccr
	roxr.w	#1,d4
	swap.w	d0
	and.w	#$000f,d0
	or.w	d4,d0
	swap.w	d0
	movem.l	(sp)+,d2-d5
	rts

L001e50:
	add.l	d1,d1
	addx.l	d0,d0
	sub.l	d3,d1
	subx.l	d2,d0
	btst.l	#$15,d0
	bne.s	L001e66
	moveq.l	#$20,d5			;' '
	moveq.l	#$14,d6
	moveq.l	#$20,d2			;' '
	bra.s	L001e78

L001e66:
	lsr.l	#1,d0
	roxr.l	#1,d1
	moveq.l	#$00,d5
	moveq.l	#$14,d6
L001e6e:
	moveq.l	#$20,d2			;' '
	bra.s	L001e78

L001e72:
	add.l	d1,d1
	addx.l	d0,d0
	add.w	d2,d5
L001e78:
	btst.l	d6,d0
	beq.s	L001e72
	sub.w	d5,d4
	bls.s	L001ee4
	move.w	(sp)+,ccr
	roxr.w	#1,d4
	swap.w	d0
	and.w	#$000f,d0
	or.w	d4,d0
	swap.w	d0
	movem.l	(sp)+,d2-d5
	rts

L001e94:
	beq.s	L001eaa
	cmp.w	#$0034,d5		;'4'
	bhi.s	L001eb4
	sub.w	#$0020,d5
	move.l	d2,d3
	moveq.l	#$00,d2
	lsr.l	d5,d3
	bra.w	L001e18

L001eaa:
	add.l	d3,d3
	move.l	d2,d3
	moveq.l	#$00,d2
	bra.w	L001e18

L001eb4:
	bchg.l	#$14,d0
	move.w	(sp)+,ccr
	roxr.w	#1,d4
	swap.w	d4
	clr.w	d4
	or.l	d4,d0
	movem.l	(sp)+,d2-d5
	rts

L001ec8:
	moveq.l	#$00,d5
	moveq.l	#$14,d6
	sub.l	d3,d1
	subx.l	d2,d0
	bhi.s	L001e6e
	eori.w	#$0010,(sp)
	neg.l	d1
	negx.l	d0
	bne.s	L001e6e
	addq.l	#2,sp
	movem.l	(sp)+,d2-d5
	rts

L001ee4:
	move.w	(sp)+,ccr
	moveq.l	#$00,d0
	moveq.l	#$00,d1
	roxr.l	#1,d0
	move.w	#$0001,ccr
	movem.l	(sp)+,d2-d5
	rts

__DADDONE:
	movem.l	d2-d3/d6,-(sp)
	move.l	#$3ff00000,d2
	moveq.l	#$00,d3
	jsr	(__DADD)
	movem.l	(sp)+,d2-d3/d6
	rts

__DCEIL:
	tst.l	d0
	bmi.w	__DFIX
	movem.l	d0-d3,-(sp)
	jsr	(L00227e)
	movem.l	(sp)+,d2-d3
	cmp.l	d3,d1
	bne.s	L001f30
	cmp.l	d2,d0
	bne.s	L001f30
	movem.l	(sp)+,d2-d3
	rts

L001f30:
	move.l	#$3ff00000,d2
	moveq.l	#$00,d3
	jsr	(L001b4a)
	movem.l	(sp)+,d2-d3
	rts

L001f44:
	move.l	d6,-(sp)
	bsr.w	__DDIV
	movem.l	(sp)+,d6
	rts

L001f50:
	swap.w	d0
	swap.w	d2
	move.l	d0,d7
	and.l	#$000fffff,d7
	or.l	d1,d7
	beq.s	L001f7e
	moveq.l	#$10,d5
L001f62:
	sub.w	#$0010,d5
	add.l	d1,d1
	addx.l	d0,d0
	cmp.l	#$00100000,d0
	bcs.s	L001f62
	swap.w	d0
	swap.w	d2
	move.w	#$7ff0,d7
	bra.w	L002056

L001f7e:
	and.w	#$7ff0,d6
	cmp.w	#$7ff0,d6
	bne.s	L001f9a
	move.l	d2,d7
	and.l	#$000fffff,d7
	or.l	d3,d7
	beq.w	L002252
	bra.w	L00202e

L001f9a:
	tst.w	d6
	bne.w	L002252
	bra.w	L00223a

L001fa4:
	swap.w	d0
	swap.w	d2
	and.w	d7,d6
	cmp.w	d7,d6
	bne.s	L001fd6
	move.l	d0,d7
	and.l	#$000fffff,d7
	or.l	d1,d7
	move.l	d2,d6
	and.l	#$000fffff,d6
	or.l	d3,d6
	or.l	d6,d7
	beq.w	L00223a
	move.l	d0,d7
	and.l	#$000fffff,d7
	or.l	d1,d7
	bne.s	L001ff2
	bra.s	L00202e

L001fd6:
	move.l	d0,d7
	and.l	#$000fffff,d7
	or.l	d1,d7
	bne.s	L001ff2
	and.l	#$80000000,d5
	or.l	#$7ff00000,d5
	move.l	d5,d0
	moveq.l	#$00,d1
L001ff2:
	move.w	#$0000,ccr
	bra.w	L00220c

L001ffa:
	bra.w	L001f50

L001ffe:
	bra.s	L001fa4

L002000:
	swap.w	d0
	swap.w	d2
	and.l	#$80000000,d5
	or.l	#$7ff00000,d5
	move.l	d5,d0
	moveq.l	#$00,d1
	move.w	#$0005,ccr
	bra.w	L00220c

L00201c:
	swap.w	d0
	swap.w	d2
	move.l	d2,d7
	and.l	#$000fffff,d7
	or.l	d3,d7
	beq.w	L002252
L00202e:
	move.l	d2,d0
	move.l	d3,d1
	bra.s	L001ff2

__DDIV:
	movem.l	d2-d5/d7,-(sp)
L002038:
	swap.w	d0
	swap.w	d2
	move.w	d0,d5
	eor.w	d2,d5
	and.w	#$8000,d5
	swap.w	d5
	move.w	d0,d5
	move.w	d2,d6
	move.w	#$7ff0,d7
	and.w	d7,d5
	beq.s	L001ffa
	cmp.w	d7,d5
	beq.s	L001ffe
L002056:
	and.w	d7,d6
	beq.s	L002000
	cmp.w	d7,d6
	beq.s	L00201c
	moveq.l	#$0f,d7
	and.w	d7,d0
	and.w	d7,d2
	or.w	#$0010,d0
	swap.w	d0
	swap.w	d2
	bne.s	L00207a
	tst.l	d3
	bne.s	L00207a
	add.w	#$3ff0,d5
	bra.w	L0021f2

L00207a:
	bset.l	#$14,d2
	move.l	d3,d4
	move.w	d2,d4
	lsr.l	#5,d2
	ror.l	#5,d3
	ror.l	#5,d4
	swap.w	d3
	and.w	#$f800,d3
	swap.w	d2
	swap.w	d4
	move.w	d4,d2
	move.l	d1,d4
	move.w	d0,d4
	lsl.l	#6,d0
	lsl.l	#6,d1
	rol.l	#6,d4
	move.w	d4,d0
	tst.l	d3
	bne.s	L0020cc
	tst.w	d2
	bne.s	L0020cc
	swap.w	d2
	move.w	d1,d7
	swap.w	d1
	divu.w	d2,d0
	move.l	d0,d3
	swap.w	d0
	move.w	d1,d3
	divu.w	d2,d3
	move.w	d3,d0
	move.w	d7,d3
	divu.w	d2,d3
	move.w	d3,d1
	swap.w	d1
	clr.w	d3
	divu.w	d2,d3
	move.w	d3,d1
	bra.w	L0021a8

L0020cc:
	move.l	d6,-(sp)
	move.l	d5,-(sp)
	subq.l	#8,sp
	move.l	d3,-(sp)
	move.l	d2,-(sp)
	moveq.l	#$00,d7
	move.l	d7,-(sp)
	move.l	d7,-(sp)
	move.l	d0,d3
	swap.w	d2
	divu.w	d2,d3
	movem.w	($0008,sp),d4-d7
	mulu.w	d3,d4
	mulu.w	d3,d5
	mulu.w	d3,d6
	mulu.w	d3,d7
	move.w	d5,d7
	swap.w	d7
	clr.w	d5
	swap.w	d5
	add.l	d7,d6
	addx.l	d5,d4
	sub.l	d6,d1
	subx.l	d4,d0
	bcc.s	L002110
	movem.l	($0006,sp),d4-d5
L002108:
	subq.w	#1,d3
	add.l	d5,d1
	addx.l	d4,d0
	bcc.s	L002108
L002110:
	move.w	d3,($0010,sp)
	move.l	d1,d3
	move.w	d0,d3
	swap.w	d3
	divu.w	d2,d3
	bvc.s	L002120
	moveq.l	#$ff,d3
L002120:
	movem.w	($0008,sp),d4-d6
	mulu.w	d3,d4
	mulu.w	d3,d5
	mulu.w	d3,d6
	moveq.l	#$00,d7
	move.w	d4,d6
	swap.w	d6
	clr.w	d4
	swap.w	d4
	add.l	d5,d6
	addx.l	d7,d4
	sub.l	d6,d1
	subx.l	d4,d0
	bcc.s	L00214e
	movem.l	($0004,sp),d4-d5
L002146:
	subq.w	#1,d3
	add.l	d5,d1
	addx.l	d4,d0
	bcc.s	L002146
L00214e:
	move.w	d3,($0012,sp)
	move.l	d1,d3
	divu.w	d2,d3
	bvc.s	L00215a
	moveq.l	#$ff,d3
L00215a:
	movem.w	($0008,sp),d4-d5
	mulu.w	d3,d4
	mulu.w	d3,d5
	clr.w	d5
	swap.w	d5
	add.l	d5,d4
	sub.l	d4,d1
	subx.l	d7,d0
	bcc.s	L00217e
	movem.l	($0002,sp),d4-d5
L002176:
	subq.w	#1,d3
	add.l	d5,d1
	addx.l	d4,d0
	bcc.s	L002176
L00217e:
	move.w	d3,($0014,sp)
	move.l	d1,d3
	swap.w	d3
	clr.w	d3
	divu.w	d2,d3
	bvc.s	L00218e
	moveq.l	#$ff,d3
L00218e:
	move.w	($0008,sp),d4
	mulu.w	d3,d4
	sub.l	d4,d1
	subx.l	d7,d0
	bcc.s	L00219c
	subq.w	#1,d3
L00219c:
	move.w	d3,($0016,sp)
	lea.l	($0010,sp),sp
	movem.l	(sp)+,d0-d1/d5-d6
L0021a8:
	cmp.l	#$08000000,d0
	bcs.s	L0021d2
	move.w	d1,d4
	move.l	d1,d7
	move.w	d0,d1
	lsr.l	#7,d0
	ror.l	#7,d1
	lsr.l	#7,d7
	move.w	d7,d1
	and.w	#$007f,d4
	cmp.w	#$0041,d4		;'A'
	bcs.s	L0021cc
	addq.l	#1,d1
	beq.s	L002212
L0021cc:
	add.w	#$3ff0,d5
	bra.s	L0021f2

L0021d2:
	move.w	d1,d4
	move.l	d1,d7
	move.w	d0,d1
	lsr.l	#6,d0
	ror.l	#6,d1
	lsr.l	#6,d7
	move.w	d7,d1
	and.w	#$003f,d4
	cmp.w	#$0021,d4		;'!'
	bcs.s	L0021ee
	addq.l	#1,d1
	beq.s	L002226
L0021ee:
	add.w	#$3fe0,d5
L0021f2:
	sub.w	d6,d5
	bls.s	L002248
	cmp.w	#$7ff0,d5
	bcc.s	L00225c
	swap.w	d0
	and.w	#$000f,d0
	or.w	d5,d0
	swap.w	d5
	or.w	d5,d0
	swap.w	d0
	move.w	d5,ccr
L00220c:
	movem.l	(sp)+,d2-d5/d7
	rts

L002212:
	addq.l	#1,d0
	cmp.l	#$00200000,d0
	bcs.s	L0021cc
	lsr.l	#1,d0
	roxr.l	#1,d1
	add.w	#$0010,d5
	bra.s	L0021cc

L002226:
	addq.l	#1,d0
	cmp.l	#$00200000,d0
	bcs.s	L0021ee
	lsr.l	#1,d0
	roxr.l	#1,d1
	add.w	#$0010,d5
	bra.s	L0021ee

L00223a:
	move.l	#$7fffffff,d0
	moveq.l	#$ff,d1
	move.w	#$0001,ccr
	bra.s	L00220c

L002248:
	moveq.l	#$00,d0
	moveq.l	#$00,d1
	move.w	#$0001,ccr
	bra.s	L00220c

L002252:
	moveq.l	#$00,d0
	moveq.l	#$00,d1
	move.w	#$0000,ccr
	bra.s	L00220c

L00225c:
	and.l	#$80000000,d5
	or.l	#$7ff00000,d5
	move.l	d5,d0
	moveq.l	#$00,d1
	move.w	#$0003,ccr
	bra.s	L00220c

__DFIX:
	movem.l	d2-d3,-(sp)
	bsr.s	L00227e
	movem.l	(sp)+,d2-d3
	rts

L00227e:
	move.l	d0,d2
	swap.w	d2
	lsr.w	#4,d2
	and.w	#$07ff,d2
	sub.w	#$03ff,d2
	bcs.s	L0022b8
	cmp.w	#$0034,d2		;'4'
	bcc.s	L0022bc
	cmp.w	#$0015,d2
	bcc.s	L0022a8
	moveq.l	#$00,d1
	move.l	#$fff00000,d3
	asr.l	d2,d3
	and.l	d3,d0
	rts

L0022a8:
	sub.w	#$0015,d2
	move.l	#$80000000,d3
	asr.l	d2,d3
	and.l	d3,d1
	rts

L0022b8:
	moveq.l	#$00,d0
	moveq.l	#$00,d1
L0022bc:
	rts

__DFLOOR:
	tst.l	d0
	bpl.w	__DFIX
	movem.l	d0-d3,-(sp)
	jsr	(L00227e)
	movem.l	(sp)+,d2-d3
	cmp.l	d3,d1
	bne.s	L0022e0
	cmp.l	d2,d0
	bne.s	L0022e0
	movem.l	(sp)+,d2-d3
	rts

L0022e0:
	move.l	#$3ff00000,d2
	moveq.l	#$00,d3
	jsr	(L001b54)
	movem.l	(sp)+,d2-d3
	rts

L0022f4:
	move.l	#$7fffffff,d0
	moveq.l	#$ff,d1
	addq.l	#4,sp
	move.w	#$0005,ccr
	movem.l	(sp)+,d2-d6
	rts

L002308:
	moveq.l	#$00,d0
	moveq.l	#$00,d1
	addq.l	#4,sp
	move.w	#$0000,ccr
	movem.l	(sp)+,d2-d6
	rts

L002318:
	bne.s	L00231e
	tst.l	d3
	beq.s	L00237e
L00231e:
	move.l	d2,d0
	move.l	d3,d1
	swap.w	d0
	addq.l	#4,sp
	move.w	#$0000,ccr
	movem.l	(sp)+,d2-d6
	rts

L002330:
	bne.s	L00234a
	tst.l	d1
	bne.s	L00234a
	move.l	#$7fffffff,d0
	moveq.l	#$ff,d1
	addq.l	#4,sp
	move.w	#$0001,ccr
	movem.l	(sp)+,d2-d6
	rts

L00234a:
	swap.w	d0
	addq.l	#4,sp
	move.w	#$0000,ccr
	movem.l	(sp)+,d2-d6
	rts

__DMOD:
	movem.l	d0/d2-d6,-(sp)
	bclr.l	#$1f,d0
	swap.w	d0
	swap.w	d2
	move.l	d0,d4
	move.l	d2,d5
	move.w	#$7ff0,d6
	and.w	d6,d4
	beq.s	L002308
	cmp.w	d6,d4
	beq.s	L002330
	and.w	d6,d5
	beq.w	L0022f4
	cmp.w	d6,d5
	beq.s	L002318
L00237e:
	moveq.l	#$0f,d6
	and.w	d6,d0
	and.w	d6,d2
	moveq.l	#$10,d6
	or.w	d6,d0
	or.w	d6,d2
	swap.w	d0
	swap.w	d2
	move.l	#$00100000,d6
L002394:
	cmp.w	d5,d4
	bcs.s	L0023d4
	beq.s	L0023b0
	cmp.l	d2,d0
	bcs.s	L0023a6
	bne.s	L0023ba
	cmp.l	d3,d1
	bcs.s	L0023a6
	bra.s	L0023ba

L0023a6:
	sub.w	#$0010,d4
	add.l	d1,d1
	addx.l	d0,d0
	bra.s	L0023ba

L0023b0:
	cmp.l	d2,d0
	bcs.s	L0023d4
	bne.s	L0023ba
	cmp.l	d3,d1
	bcs.s	L0023d4
L0023ba:
	sub.l	d3,d1
	subx.l	d2,d0
	beq.s	L0023de
	cmp.l	d6,d0
	bcc.s	L002394
L0023c4:
	sub.w	#$0010,d4
	bcs.s	L0023f0
	add.l	d1,d1
	addx.l	d0,d0
	cmp.l	d6,d0
	bcs.s	L0023c4
	bra.s	L002394

L0023d4:
	swap.w	d0
	and.w	#$000f,d0
	or.w	d4,d0
	swap.w	d0
L0023de:
	tst.l	(sp)+
	bpl.s	L0023e6
	bset.l	#$1f,d0
L0023e6:
	move.w	#$0000,ccr
	movem.l	(sp)+,d2-d6
	rts

L0023f0:
	addq.l	#4,sp
	moveq.l	#$00,d0
	moveq.l	#$00,d1
	bra.s	L0023e6

L0023f8:
	movem.l	d0/d2-d7,-(sp)
	move.w	#$4010,d5
	bra.s	L00240a

L002402:
	movem.l	d0/d2-d7,-(sp)
	move.w	#$4000,d5
L00240a:
	move.l	#$001921fb,d2
	move.l	#$54442d18,d3
	move.l	#$469898cc,d7
	bclr.l	#$1f,d0
	swap.w	d0
	move.l	d0,d4
	and.w	#$7ff0,d4
	and.w	#$000f,d0
	or.w	#$0010,d0
	swap.w	d0
	moveq.l	#$00,d6
L002434:
	cmp.w	d5,d4
	bcs.s	L00248c
	beq.s	L002458
	cmp.l	d2,d0
	bcs.s	L00244c
	bne.s	L002468
	cmp.l	d3,d1
	bcs.s	L00244c
	bne.s	L002468
	cmp.l	d7,d6
	bcs.s	L00244c
	bra.s	L002468

L00244c:
	sub.w	#$0010,d4
	add.l	d6,d6
	addx.l	d1,d1
	addx.l	d0,d0
	bra.s	L002468

L002458:
	cmp.l	d2,d0
	bcs.s	L00248c
	bne.s	L002468
	cmp.l	d3,d1
	bcs.s	L00248c
	bne.s	L002468
	cmp.l	d7,d6
	bcs.s	L00248c
L002468:
	sub.l	d7,d6
	subx.l	d3,d1
	subx.l	d2,d0
	beq.s	L00249a
	cmp.l	#$00100000,d0
	bcc.s	L002434
L002478:
	sub.w	#$0010,d4
	add.l	d6,d6
	addx.l	d1,d1
	addx.l	d0,d0
	cmp.l	#$00100000,d0
	bcs.s	L002478
	bra.s	L002434

L00248c:
	swap.w	d0
	and.w	#$000f,d0
	or.w	d4,d0
	swap.w	d0
	bra.w	L00249a

L00249a:
	tst.l	(sp)+
	bpl.s	L0024a2
	bset.l	#$1f,d0
L0024a2:
	move.w	#$0000,ccr
	movem.l	(sp)+,d2-d7
	rts

L0024ac:
	move.l	d6,-(sp)
	bsr.w	__DMUL
	movem.l	(sp)+,d6
	rts

L0024b8:
	swap.w	d0
	swap.w	d2
	and.w	d7,d6
	cmp.w	d7,d6
	bne.w	L0026da
	move.l	d2,d7
	and.l	#$000fffff,d7
	or.l	d3,d7
	beq.s	L002506
	bra.s	L00254a

L0024d2:
	swap.w	d0
	swap.w	d2
	and.w	d7,d6
	cmp.w	d7,d6
	bne.s	L0024f6
	move.l	d0,d7
	and.l	#$000fffff,d7
	or.l	d1,d7
	bne.s	L002526
	move.l	d2,d7
	and.l	#$000fffff,d7
	or.l	d3,d7
	bne.s	L00254a
	bra.s	L002516

L0024f6:
	move.l	d0,d7
	and.l	#$000fffff,d7
	or.l	d1,d7
	bne.s	L002526
	tst.w	d6
	bne.s	L002516
L002506:
	move.l	#$7fffffff,d0
	moveq.l	#$ff,d1
	move.w	#$0001,ccr
	bra.w	L0026ca

L002516:
	and.l	#$80000000,d5
	or.l	#$7ff00000,d5
	move.l	d5,d0
	moveq.l	#$00,d1
L002526:
	move.w	#$0000,ccr
	bra.w	L0026ca

L00252e:
	bra.s	L0024b8

L002530:
	bra.s	L0024d2

L002532:
	swap.w	d0
	swap.w	d2
	bra.w	L0026da

L00253a:
	swap.w	d0
	swap.w	d2
	move.l	d2,d7
	and.l	#$000fffff,d7
	or.l	d3,d7
	beq.s	L002516
L00254a:
	move.l	d2,d0
	move.l	d3,d1
	bra.s	L002526

__DMUL:
	movem.l	d2-d5/d7,-(sp)
L002554:
	swap.w	d0
	swap.w	d2
	move.w	d0,d5
	eor.w	d2,d5
	and.w	#$8000,d5
	swap.w	d5
	move.w	d0,d5
	move.w	d2,d6
	move.w	#$7ff0,d7
	and.w	d7,d5
	beq.s	L00252e
	cmp.w	d7,d5
	beq.s	L002530
	and.w	d7,d6
	beq.s	L002532
	cmp.w	d7,d6
	beq.s	L00253a
	moveq.l	#$0f,d7
	and.w	d7,d0
	and.w	d7,d2
	moveq.l	#$10,d7
	or.w	d7,d0
	or.w	d7,d2
	swap.w	d0
	swap.w	d2
	tst.l	d1
	bne.s	L002598
	movem.l	d2-d3/d5-d6,-(sp)
	move.l	d0,d2
	moveq.l	#$00,d0
	bra.s	L0025da

L002598:
	movem.l	d0-d1/d5-d6,-(sp)
	tst.l	d3
	bne.s	L0025a6
	moveq.l	#$00,d0
	moveq.l	#$00,d1
	bra.s	L0025da

L0025a6:
	move.l	d0,d1
	swap.w	d1
	mulu.w	d3,d1
	mulu.w	d3,d0
	clr.w	d0
	swap.w	d0
	add.l	d0,d1
	moveq.l	#$00,d0
	addx.w	d0,d0
	movem.w	(sp),d4-d6
	swap.w	d3
	mulu.w	d3,d4
	mulu.w	d3,d5
	mulu.w	d3,d6
	move.w	d4,d6
	clr.w	d4
	swap.w	d4
	swap.w	d6
	add.l	d5,d6
	moveq.l	#$00,d5
	addx.l	d5,d4
	add.l	d6,d1
	addx.l	d4,d0
	addq.l	#2,d1
	addx.l	d5,d0
L0025da:
	tst.l	($0004,sp)
	bne.s	L00260a
	movem.w	(sp),d4-d5
	mulu.w	d2,d4
	mulu.w	d2,d5
	move.l	d5,d7
	swap.w	d7
	clr.w	d7
	clr.w	d5
	swap.w	d5
	add.l	d5,d4
	add.l	d7,d1
	addx.l	d4,d0
	movem.w	(sp),d4-d5
	swap.w	d2
	mulu.w	d2,d4
	mulu.w	d2,d5
	swap.w	d4
	add.l	d4,d5
	add.l	d5,d0
	bra.s	L002644

L00260a:
	movem.w	(sp),d4-d7
	mulu.w	d2,d4
	mulu.w	d2,d5
	mulu.w	d2,d6
	mulu.w	d2,d7
	move.w	d5,d7
	clr.w	d5
	swap.w	d5
	swap.w	d7
	add.l	d7,d6
	addx.l	d5,d4
	add.l	d6,d1
	addx.l	d4,d0
	movem.w	(sp),d4-d7
	swap.w	d2
	mulu.w	d2,d4
	mulu.w	d2,d5
	mulu.w	d2,d6
	mulu.w	d2,d7
	swap.w	d4
	swap.w	d6
	move.w	d6,d4
	clr.w	d6
	add.l	d6,d7
	addx.l	d4,d5
	add.l	d7,d1
	addx.l	d5,d0
L002644:
	addq.l	#8,sp
	move.l	(sp)+,d5
	move.l	(sp)+,d6
	btst.l	#$19,d0
	beq.s	L002676
	add.w	#$0010,d5
	move.w	d1,d7
	move.l	d1,d2
	move.w	d0,d1
	lsr.l	#5,d0
	ror.l	#5,d1
	lsr.l	#5,d2
	bcc.s	L0026aa
	move.w	d2,d1
	and.w	#$000f,d7
	bne.s	L002692
	btst.l	#$00,d1
	beq.s	L0026ac
	addq.l	#1,d1
	bcc.s	L0026ac
	bra.s	L002696

L002676:
	move.w	d1,d7
	move.l	d1,d2
	move.w	d0,d1
	lsr.l	#4,d0
	ror.l	#4,d1
	lsr.l	#4,d2
	bcc.s	L0026aa
	move.w	d2,d1
	and.w	#$0007,d7
	bne.s	L002692
	btst.l	#$00,d1
	beq.s	L0026ac
L002692:
	addq.l	#1,d1
	bcc.s	L0026ac
L002696:
	addq.l	#1,d0
	cmp.l	#$00200000,d0
	bcs.s	L0026ac
	add.w	#$0010,d5
	lsr.l	#1,d0
	roxr.l	#1,d1
	bra.s	L0026ac

L0026aa:
	move.w	d2,d1
L0026ac:
	add.w	d5,d6
	sub.w	#$3ff0,d6
	bls.s	L0026d0
	cmp.w	#$7ff0,d6
	bcc.s	L0026e4
	swap.w	d0
	and.w	#$000f,d0
	or.w	d6,d0
	swap.w	d5
	or.w	d5,d0
	swap.w	d0
	move.w	d5,ccr
L0026ca:
	movem.l	(sp)+,d2-d5/d7
	rts

L0026d0:
	moveq.l	#$00,d0
	moveq.l	#$00,d1
	move.w	#$0001,ccr
	bra.s	L0026ca

L0026da:
	moveq.l	#$00,d0
	moveq.l	#$00,d1
	move.w	#$0000,ccr
	bra.s	L0026ca

L0026e4:
	move.l	#$00007ff0,d0
	swap.w	d5
	or.w	d5,d0
	swap.w	d0
	moveq.l	#$00,d1
	move.w	#$0003,ccr
	bra.s	L0026ca

__DSUBONE:
	movem.l	d2-d3/d6,-(sp)
	move.l	#$3ff00000,d2
	moveq.l	#$00,d3
	jsr	(__DSUB)
	movem.l	(sp)+,d2-d3/d6
	rts

L002710:
	move.l	a0,(-$0026,a6)
	clr.w	(-$0016,a6)
	move.b	d2,(-$0015,a6)
	move.l	d0,d6
	swap.w	d6
	and.w	#$7ff0,d6
	cmp.w	#$7ff0,d6
	beq.s	L002756
	bsr.s	L002790
	lea.l	(-$0014,a6),a1
	move.b	#$30,(a1)+		;'0'
	move.l	a1,-(sp)
	bsr.w	L002826
	lea.l	(-$0013,a6),a0
	adda.l	#$0000000e,a0
	jsr	(L000f32)
	movea.l	(sp)+,a1
	cmpa.l	a1,a0
	bcc.s	L002754
	movea.l	a0,a1
	addq.w	#1,d7
L002754:
	rts

L002756:
	lea.l	(-$0014,a6),a1
	move.l	#$234e414e,d6		;'#NAN'
	move.l	d0,d7
	and.l	#$000fffff,d0
	or.l	d1,d0
	bne.s	L002772
	move.l	#$23494e46,d6		;'#INF'
L002772:
	move.l	d6,(a1)
	moveq.l	#$00,d6
	move.l	d6,($0004,a1)
	move.l	d6,($0008,a1)
	move.l	d6,($000c,a1)
	move.l	d6,($0010,a1)
	tst.l	d7
	smi.b	d6
	neg.b	d6
	moveq.l	#$04,d7
	rts

L002790:
	clr.l	d6
	move.l	d0,d2
	lsl.l	#1,d2
	roxl.l	#1,d6
	and.l	#$7fffffff,d0
	bne.s	L0027a8
	tst.l	d1
	bne.s	L0027a8
	moveq.l	#$01,d7
	rts

L0027a8:
	moveq.l	#$01,d7
	move.l	#$3ff00000,d2
	moveq.l	#$00,d3
	jsr	(__DCMP)
	bcs.s	L002802
	lea.l	(L00288a,pc),a2
	lea.l	(L0029e2,pc),a1
L0027c2:
	move.l	(a2)+,d2
	move.l	(a2)+,d3
	move.w	(a1)+,d4
	beq.s	L0027fc
	jsr	(__DCMP)
	bcs.s	L0027c2
	move.l	($00a8,a2),d2
	move.l	($00ac,a2),d3
	jsr	(L0024ac)
	move.l	#$40240000,d2
	moveq.l	#$00,d3
	jsr	(__DCMP)
	bne.s	L0027fe
	addq.w	#1,d4
	move.l	#$3ff00000,d0
	moveq.l	#$00,d1
	add.w	d4,d7
L0027fc:
	rts

L0027fe:
	add.w	d4,d7
	bra.s	L0027c2

L002802:
	lea.l	(L00293a,pc),a2
	lea.l	(L0029e2,pc),a1
L00280a:
	move.l	(a2)+,d2
	move.l	(a2)+,d3
	move.w	(a1)+,d4
	beq.s	L002824
	jsr	(__DCMP)
	bhi.s	L00280a
	jsr	(L001f44)
	sub.w	d4,d7
	bra.s	L00280a

L002824:
	rts

L002826:
	move.l	d0,d3
	beq.s	L00284a
	swap.w	d3
	lsr.w	#4,d3
	sub.w	#$03fb,d3
	and.l	#$000fffff,d0
	or.l	#$00100000,d0
	move.l	d1,d2
	move.w	d0,d2
	lsl.l	d3,d0
	lsl.l	d3,d1
	rol.l	d3,d2
	move.w	d2,d0
L00284a:
	moveq.l	#$0f,d4
	move.l	d0,d2
	rol.l	#8,d2
	tst.b	d2
	beq.s	L00285e
	add.w	#$0030,d2
	move.b	d2,(a1)+
	subq.w	#1,d4
	bra.s	L002860

L00285e:
	subq.w	#1,d7
L002860:
	and.l	#$00ffffff,d0
	add.l	d1,d1
	addx.l	d0,d0
	move.l	d0,d2
	move.l	d1,d3
	add.l	d1,d1
	addx.l	d0,d0
	add.l	d1,d1
	addx.l	d0,d0
	add.l	d3,d1
	addx.l	d2,d0
	move.l	d0,d2
	rol.l	#8,d2
	add.w	#$0030,d2
	move.b	d2,(a1)+
	subq.w	#1,d4
	bne.s	L002860
	rts

L00288a:
	.dc.b	$75,$15,$4f,$dd,$7f,$73,$bf,$3c
	.dc.b	$5a,$82,$77,$48,$f9,$30,$1d,$32
	.dc.b	$4d,$38,$4f,$03,$e9,$3f,$f9,$f5
	.dc.b	$46,$93,$b8,$b5,$b5,$05,$6e,$17
	.dc.b	$43,$41,$c3,$79,$37,$e0,$80,$00
	.dc.b	$43,$0c,$6b,$f5,$26,$34,$00,$00
	.dc.b	$42,$d6,$bc,$c4,$1e,$90,$00,$00
	.dc.b	$42,$a2,$30,$9c,$e5,$40,$00,$00
	.dc.b	$42,$6d,$1a,$94,$a2,$00,$00,$00
	.dc.b	$42,$37,$48,$76,$e8,$00,$00,$00
	.dc.b	$42,$02,$a0,$5f,$20,$00,$00,$00
	.dc.b	$41,$cd,$cd,$65,$00,$00,$00,$00
	.dc.b	$41,$97,$d7,$84,$00,$00,$00,$00
	.dc.b	$41,$63,$12,$d0,$00,$00,$00,$00
	.dc.b	$41,$2e,$84,$80,$00,$00,$00,$00
	.dc.b	$40,$f8,$6a,$00,$00,$00,$00,$00
	.dc.b	$40,$c3,$88,$00,$00,$00,$00,$00
	.dc.b	$40,$8f,$40,$00,$00,$00,$00,$00
	.dc.b	$40,$59,$00,$00,$00,$00,$00,$00
	.dc.b	$40,$24,$00,$00,$00,$00,$00,$00
	.dc.b	$3f,$f0,$00,$00,$00,$00,$00,$00
	.dc.b	$3f,$b9,$99,$99,$99,$99,$99,$9a
L00293a:
	.dc.b	$0a,$c8,$06,$28,$64,$ac,$6f,$43
	.dc.b	$25,$5b,$ba,$08,$cf,$8c,$97,$9d
	.dc.b	$32,$a5,$0f,$fd,$44,$f4,$a7,$3d
	.dc.b	$39,$49,$f6,$23,$d5,$a8,$a7,$33
	.dc.b	$3c,$9c,$d2,$b2,$97,$d8,$89,$bc
	.dc.b	$3c,$d2,$03,$af,$9e,$e7,$56,$16
	.dc.b	$3d,$06,$84,$9b,$86,$a1,$2b,$9b
	.dc.b	$3d,$3c,$25,$c2,$68,$49,$76,$82
	.dc.b	$3d,$71,$97,$99,$81,$2d,$ea,$11
	.dc.b	$3d,$a5,$fd,$7f,$e1,$79,$64,$95
	.dc.b	$3d,$db,$7c,$df,$d9,$d7,$bd,$bb
	.dc.b	$3e,$11,$2e,$0b,$e8,$26,$d6,$95
	.dc.b	$3e,$45,$79,$8e,$e2,$30,$8c,$3a
	.dc.b	$3e,$7a,$d7,$f2,$9a,$bc,$af,$48
	.dc.b	$3e,$b0,$c6,$f7,$a0,$b5,$ed,$8d
	.dc.b	$3e,$e4,$f8,$b5,$88,$e3,$68,$f1
	.dc.b	$3f,$1a,$36,$e2,$eb,$1c,$43,$2d
	.dc.b	$3f,$50,$62,$4d,$d2,$f1,$a9,$fc
	.dc.b	$3f,$84,$7a,$e1,$47,$ae,$14,$7b
	.dc.b	$3f,$b9,$99,$99,$99,$99,$99,$9a
	.dc.b	$3f,$f0,$00,$00,$00,$00,$00,$00
L0029e2:
	.dc.b	$01,$00,$00,$80,$00,$40,$00,$20
	.dc.b	$00,$10,$00,$0f,$00,$0e,$00,$0d
	.dc.b	$00,$0c,$00,$0b,$00,$0a,$00,$09
	.dc.b	$00,$08,$00,$07,$00,$06,$00,$05
	.dc.b	$00,$04,$00,$03,$00,$02,$00,$01
	.dc.b	$00,$00,$ff,$ff,$ff,$fe,$00,$00
__DTOF:
	tst.l	d0
	beq.s	L002a88
	cmp.l	#$47f00000,d0
	bcc.s	L002a4a
	sub.l	#$38000000,d0
	bls.s	L002a8e
	move.l	d1,-(sp)
	addi.l	#$10000000,d1
	negx.l	d0
	neg.l	d0
	move.w	d0,d1
	lsl.l	#3,d0
	rol.l	#3,d1
	move.w	d1,d0
	move.l	(sp)+,d1
	cmpi.l	#$7f800000,d0
	beq.s	L002aa6
	move.w	#$0000,ccr
	rts

L002a4a:
	tst.l	d0
	bpl.s	L002a96
	cmpi.l	#$80000000,d0
	beq.s	L002a88
	cmp.l	#$c7f00000,d0
	bcc.s	L002ac4
	sub.l	#$b8000000,d0
	bls.s	L002a8e
	move.l	d1,-(sp)
	addi.l	#$10000000,d1
	negx.l	d0
	neg.l	d0
	move.w	d0,d1
	lsl.l	#3,d0
	rol.l	#3,d1
	move.w	d1,d0
	move.l	(sp)+,d1
	cmpi.l	#$ff800000,d0
	beq.s	L002ad4
	bset.l	#$1f,d0
L002a88:
	move.w	#$0000,ccr
	rts

L002a8e:
	moveq.l	#$00,d0
	move.w	#$0000,ccr
	rts

L002a96:
	cmp.l	#$7ff00000,d0
	beq.s	L002aac
	bcc.s	L002ab8
	move.l	#$7f800000,d0
L002aa6:
	move.w	#$0003,ccr
	rts

L002aac:
	andi.l	#$ff800000,d0
	move.w	#$0000,ccr
	rts

L002ab8:
	ori.l	#$7fffffff,d0
	move.w	#$0000,ccr
	rts

L002ac4:
	cmp.l	#$fff00000,d0
	beq.s	L002aac
	bcc.s	L002ab8
	move.l	#$ff800000,d0
L002ad4:
	move.w	#$0003,ccr
	rts

__DTOL:
	movem.l	d1-d4,-(sp)
	move.l	d0,d2
	swap.w	d0
	move.l	d0,d4
	lsr.w	#4,d4
	and.w	#$07ff,d4
	cmp.w	#$07ff,d4
	beq.s	L002b54
	sub.w	#$03ff,d4
	bcs.s	L002b3a
	and.w	#$000f,d0
	or.w	#$0010,d0
	swap.w	d0
	cmp.w	#$001f,d4
	bcc.s	L002b3e
	cmp.w	#$0014,d4
	bcc.s	L002b26
	moveq.l	#$14,d1
	sub.w	d4,d1
	lsr.l	d1,d0
L002b12:
	tst.l	d2
	bpl.s	L002b18
	neg.l	d0
L002b18:
	andi.b	#$18,ccr
	move.w	#$0000,ccr
	movem.l	(sp)+,d1-d4
	rts

L002b26:
	beq.s	L002b12
	sub.w	#$0014,d4
	move.l	d1,d3
	move.w	d0,d3
	lsl.l	d4,d0
	lsl.l	d4,d1
	rol.l	d4,d3
	move.w	d3,d0
	bra.s	L002b12

L002b3a:
	moveq.l	#$00,d0
	bra.s	L002b18

L002b3e:
	bne.s	L002b5a
	cmp.l	#$c1e00000,d2
	bne.s	L002b5a
	tst.l	d1
	bne.s	L002b5a
	move.l	#$80000000,d0
	bra.s	L002b18

L002b54:
	tst.l	d1
	beq.s	L002b5a
	moveq.l	#$00,d2
L002b5a:
	move.l	#$7fffffff,d0
	tst.l	d2
	bpl.s	L002b66
	addq.l	#1,d0
L002b66:
	movem.l	(sp)+,d1-d4
	move.w	#$0001,ccr
	rts

L002b70:
	bne.s	L002b9c
	tst.l	d1
	bne.s	L002b9c
	moveq.l	#$00,d0
	moveq.l	#$00,d1
	movem.l	(sp)+,d2-d7/a5-a6
	move.w	#$0000,ccr
	rts

L002b84:
	bne.s	L002b9c
	tst.l	d1
	bne.s	L002b9c
	move.l	#$7ff00000,d0
	moveq.l	#$00,d1
	movem.l	(sp)+,d2-d7/a5-a6
	move.w	#$0000,ccr
	rts

L002b9c:
	movem.l	(sp)+,d2-d7/a5-a6
	move.w	#$0000,ccr
	rts

__EXP:
	movem.l	d2-d7/a5-a6,-(sp)
	move.l	d0,d4
	bmi.s	L002bde
	cmp.l	#$3fe62e42,d0
	bcc.s	L002bcc
	bsr.w	L002cba
	bsr.w	L002d28
	swap.w	d0
	or.w	#$3ff0,d0
	swap.w	d0
	movem.l	(sp)+,d2-d7/a5-a6
	rts

L002bcc:
	cmp.l	#$401bb9d3,d0
	bcs.w	L002c6c
	cmp.l	#$7ff00000,d0
	bcc.s	L002b84
L002bde:
	cmp.l	#$fff00000,d0
	bcc.s	L002b70
	move.l	#$3ff71547,d2
	move.l	#$652b82fe,d3
	jsr	(L0024ac)
	bcs.s	L002c5a
	bsr.w	L002efe
	cmp.w	#$0400,d6
	bge.s	L002c5e
	cmp.w	#$fc00,d6
	ble.s	L002c54
	move.l	#$3fe62e42,d2
	move.l	#$fefa39ef,d3
	jsr	(L0024ac)
	bcs.s	L002c4a
	move.w	d6,-(sp)
	bsr.w	L002cba
L002c24:
	bsr.w	L002d28
	move.w	(sp)+,d6
L002c2a:
	move.w	#$03ff,d2
	add.w	d6,d2
	bmi.s	L002c54
	cmp.w	#$07ff,d2
	bcc.s	L002c5e
	lsl.w	#4,d2
	swap.w	d0
	and.w	#$000f,d0
	or.w	d2,d0
	swap.w	d0
L002c44:
	movem.l	(sp)+,d2-d7/a5-a6
	rts

L002c4a:
	move.l	#$3ff00000,d0
	moveq.l	#$00,d1
	bra.s	L002c2a

L002c54:
	moveq.l	#$00,d0
	moveq.l	#$00,d1
	bra.s	L002c44

L002c5a:
	tst.l	d4
	bmi.s	L002c54
L002c5e:
	move.l	#$7ff00000,d0
	moveq.l	#$00,d1
	move.w	#$0003,ccr
	bra.s	L002c44

L002c6c:
	swap.w	d0
	move.w	d0,d5
	lsr.w	#4,d5
	sub.w	#$03fe,d5
	and.w	#$000f,d0
	or.w	#$0010,d0
	swap.w	d0
	move.l	d1,d6
	move.w	d0,d6
	lsl.l	d5,d0
	lsl.l	d5,d1
	rol.l	d5,d6
	move.w	d6,d0
	moveq.l	#$00,d6
	move.l	#$00162e42,d2
	move.l	#$fefa39ef,d3
L002c9a:
	sub.l	d3,d1
	subx.l	d2,d0
	bmi.s	L002ca4
	addq.w	#1,d6
	bra.s	L002c9a

L002ca4:
	add.l	d3,d1
	addx.l	d2,d0
	move.w	d6,-(sp)
	add.l	d1,d1
	addx.l	d0,d0
	add.l	d1,d1
	addx.l	d0,d0
	add.l	d1,d1
	addx.l	d0,d0
	bra.w	L002c24

L002cba:
	swap.w	d0
	move.w	d0,d7
	lsr.w	#4,d7
	and.w	#$000f,d0
	or.w	#$0010,d0
	swap.w	d0
	sub.w	#$03fb,d7
	bcc.s	L002cf4
	neg.w	d7
	cmp.w	#$0010,d7
	bcs.s	L002d1a
	cmp.w	#$0020,d7		;' '
	bcs.s	L002d0e
	cmp.w	#$0030,d7		;'0'
	bcs.s	L002d02
	sub.w	#$0030,d7
	move.l	d0,d1
	moveq.l	#$00,d0
	move.w	d0,d1
	swap.w	d1
	lsr.w	d7,d1
	rts

L002cf4:
	move.l	d1,d6
	move.w	d0,d6
	lsl.l	d7,d0
	lsl.l	d7,d1
	rol.l	d7,d6
	move.w	d6,d0
	rts

L002d02:
	sub.w	#$0020,d7
	move.l	d0,d1
	moveq.l	#$00,d0
	lsr.l	d7,d1
	rts

L002d0e:
	sub.w	#$0010,d7
	move.w	d0,d1
	clr.w	d0
	swap.w	d0
	swap.w	d1
L002d1a:
	move.l	d1,d6
	move.w	d0,d1
	lsr.l	d7,d0
	ror.l	d7,d1
	lsr.l	d7,d6
	move.w	d6,d1
	rts

L002d28:
	move.l	#$01000000,d2
	moveq.l	#$00,d3
	lea.l	(L003b46),a5
	movea.l	d1,a6
	move.l	d0,d4
	move.l	a6,d5
	move.l	(a5)+,d7
	sub.l	(a5)+,d5
	subx.l	d7,d4
	bmi.s	L002d54
	move.l	d4,d0
	movea.l	d5,a6
	move.l	d2,d4
	move.l	d3,d5
	lsr.l	#1,d4
	roxr.l	#1,d5
	add.l	d5,d3
	addx.l	d4,d2
L002d54:
	move.l	d0,d4
	move.l	a6,d5
	move.l	(a5)+,d7
	sub.l	(a5)+,d5
	subx.l	d7,d4
	bmi.s	L002d74
	move.l	d4,d0
	movea.l	d5,a6
	move.l	d2,d4
	move.l	d3,d5
	lsr.l	#1,d4
	roxr.l	#1,d5
	lsr.l	#1,d4
	roxr.l	#1,d5
	add.l	d5,d3
	addx.l	d4,d2
L002d74:
	moveq.l	#$03,d6
	moveq.l	#$0c,d1
L002d78:
	move.l	d0,d4
	move.l	a6,d5
	move.l	(a5)+,d7
	sub.l	(a5)+,d5
	subx.l	d7,d4
	bmi.s	L002d9c
	move.l	d4,d0
	movea.l	d5,a6
	move.l	d2,d4
	move.l	d3,d5
	move.l	d5,d7
	move.w	d4,d5
	lsr.l	d6,d4
	ror.l	d6,d5
	lsr.l	d6,d7
	move.w	d7,d5
	add.l	d5,d3
	addx.l	d4,d2
L002d9c:
	addq.w	#1,d6
	dbra.w	d1,L002d78
	move.l	d0,d4
	move.l	a6,d5
	move.l	(a5)+,d7
	sub.l	(a5)+,d5
	subx.l	d7,d4
	bmi.s	L002dc2
	move.l	d4,d0
	movea.l	d5,a6
	move.l	d2,d4
	move.l	d3,d5
	move.w	d4,d5
	clr.w	d4
	swap.w	d4
	swap.w	d5
	add.l	d5,d3
	addx.l	d4,d2
L002dc2:
	moveq.l	#$01,d6
	moveq.l	#$0b,d1
L002dc6:
	move.l	d0,d4
	move.l	a6,d5
	move.l	(a5)+,d7
	sub.l	(a5)+,d5
	subx.l	d7,d4
	bmi.s	L002dec
	move.l	d4,d0
	movea.l	d5,a6
	move.l	d2,d4
	move.l	d3,d5
	move.w	d4,d5
	lsr.l	d6,d4
	ror.l	d6,d5
	move.w	d4,d5
	clr.w	d4
	swap.w	d5
	swap.w	d4
	add.l	d5,d3
	addx.l	d4,d2
L002dec:
	addq.w	#1,d6
	dbra.w	d1,L002dc6
	move.l	a6,d1
	movea.l	d3,a6
	move.l	d2,-(sp)
	move.l	d1,d6
	move.w	d0,d6
	lsl.l	#4,d0
	lsl.l	#4,d1
	rol.l	#4,d6
	move.w	d6,d0
	move.l	d3,d6
	move.w	d2,d6
	lsl.l	#4,d2
	lsl.l	#4,d3
	rol.l	#4,d6
	move.w	d6,d2
	tst.l	d0
	bne.s	L002e66
	move.l	d1,d4
	move.l	d1,d3
	move.l	d2,d5
	moveq.l	#$00,d6
	swap.w	d2
	swap.w	d1
	mulu.w	d1,d5
	mulu.w	d2,d3
	mulu.w	d2,d1
	clr.w	d3
	swap.w	d3
	clr.w	d5
	swap.w	d5
	add.l	d3,d5
	add.l	d5,d1
	addx.l	d6,d0
L002e34:
	move.l	(sp)+,d2
	add.l	a6,d1
	addx.l	d2,d0
	move.l	d1,d7
	and.w	#$000f,d7
	move.l	d1,d6
	move.w	d0,d1
	lsr.l	#4,d0
	ror.l	#4,d1
	lsr.l	#4,d6
	move.w	d6,d1
	cmp.w	#$000c,d7
	bcs.s	L002e64
	addq.l	#1,d1
	bcc.s	L002e64
	addq.l	#1,d0
	cmp.l	#$00200000,d0
	bcs.s	L002e64
	subq.l	#1,d0
	subq.l	#1,d1
L002e64:
	rts

L002e66:
	bsr.s	L002e72
	move.w	d0,d1
	move.w	d4,d0
	swap.w	d0
	swap.w	d1
	bra.s	L002e34

L002e72:
	movem.l	d0-d3,-(sp)
	move.l	d0,d1
	swap.w	d1
	mulu.w	d3,d1
	mulu.w	d3,d0
	move.l	d0,d5
	moveq.l	#$00,d0
	move.w	d0,d5
	swap.w	d5
	add.l	d5,d1
	addx.l	d0,d0
	movem.w	(sp),d4-d6
	swap.w	d3
	mulu.w	d3,d4
	mulu.w	d3,d5
	mulu.w	d3,d6
	moveq.l	#$00,d7
	move.w	d4,d6
	move.w	d7,d4
	swap.w	d4
	swap.w	d6
	add.l	d5,d6
	addx.l	d7,d4
	add.l	d6,d1
	addx.l	d4,d0
	moveq.l	#$00,d3
	movem.w	(sp),d4-d7
	mulu.w	d2,d4
	mulu.w	d2,d5
	mulu.w	d2,d6
	mulu.w	d2,d7
	move.w	d5,d7
	move.w	#$0000,d5
	swap.w	d5
	swap.w	d7
	add.l	d7,d6
	addx.l	d5,d4
	addx.l	d3,d3
	moveq.l	#$00,d4
	add.l	d6,d1
	addx.l	d4,d0
	addx.l	d4,d3
	movem.w	(sp),d4-d7
	swap.w	d2
	mulu.w	d2,d4
	mulu.w	d2,d5
	mulu.w	d2,d6
	mulu.w	d2,d7
	swap.w	d4
	swap.w	d6
	move.w	d6,d4
	move.w	#$0000,d6
	moveq.l	#$00,d2
	add.l	d6,d7
	addx.l	d4,d5
	addx.l	d2,d3
	add.l	d7,d1
	addx.l	d5,d0
	addx.l	d2,d3
	move.l	d3,d4
	addq.l	#8,sp
	movem.l	(sp)+,d2-d3
	rts

L002efe:
	move.l	d0,d4
	move.l	d1,d5
	move.l	d0,d2
	swap.w	d2
	lsr.w	#4,d2
	and.w	#$07ff,d2
	sub.w	#$03ff,d2
	bcs.w	L002f98
	cmp.w	#$000f,d2
	bcc.w	L002fa0
	move.l	d0,d6
	and.l	#$000fffff,d6
	or.l	#$00100000,d6
	moveq.l	#$14,d3
	sub.w	d2,d3
	lsr.l	d3,d6
	tst.l	d4
	bpl.s	L002f60
	move.l	#$fff00000,d3
	asr.l	d2,d3
	and.l	d3,d0
	moveq.l	#$00,d1
	move.l	d0,d2
	move.l	d1,d3
	move.l	d4,d0
	move.l	d5,d1
	jsr	(L001b54)
L002f4e:
	not.w	d6
	move.l	#$3ff00000,d2
	moveq.l	#$00,d3
	jsr	(L001b4a)
	rts

L002f60:
	move.l	#$000fffff,d3
	lsr.l	d2,d3
	and.l	d3,d0
	bne.s	L002f72
	tst.l	d1
	bne.s	L002f72
	rts

L002f72:
	move.l	d4,d2
	swap.w	d2
	and.w	#$7ff0,d2
	move.l	#$00100000,d3
L002f80:
	add.l	d1,d1
	addx.l	d0,d0
	sub.w	#$0010,d2
	cmp.l	d3,d0
	bcs.s	L002f80
	swap.w	d0
	and.w	#$000f,d0
	or.w	d2,d0
	swap.w	d0
	rts

L002f98:
	moveq.l	#$00,d6
	tst.l	d0
	bmi.s	L002f4e
	rts

L002fa0:
	tst.l	d4
	bmi.s	L002fac
	move.l	#$00000401,d6
	rts

L002fac:
	move.l	#$fffffbff,d6
	rts

__FACOS:
	move.l	d1,-(sp)
	jsr	(__FTOD)
	jsr	(__ACOS)
	jsr	(L0009b0)
	movem.l	(sp)+,d1
	rts

L002fce:
	move.l	d6,-(sp)
	bsr.s	__FADD
	movem.l	(sp)+,d6
	rts

L002fd8:
	move.l	d6,-(sp)
	bsr.s	__FSUB
	movem.l	(sp)+,d6
	rts

__FSUB:
	movem.l	d1-d5,-(sp)
	bchg.l	#$1f,d1
	bra.s	L002ff0

__FADD:
	movem.l	d1-d5,-(sp)
L002ff0:
	move.l	#$7f800000,d6
	move.l	d0,d4
	and.l	d6,d4
	beq.w	L0030b0
	cmp.l	d6,d4
	beq.w	L003174
	move.l	d1,d4
	and.l	d6,d4
	beq.w	L0030b2
	cmp.l	d6,d4
	beq.w	L003168
	move.l	d0,d4
	eor.l	d1,d4
	bmi.w	L0030c0
	move.l	d0,d2
	move.l	d1,d3
	swap.w	d0
	swap.w	d1
	move.w	d0,d2
	move.w	d1,d3
	moveq.l	#$7f,d6
	and.w	d6,d0
	and.w	d6,d1
	addq.w	#1,d6
	or.w	d6,d0
	or.w	d6,d1
	swap.w	d0
	swap.w	d1
	lsr.w	#7,d2
	lsr.w	#7,d3
	and.w	#$00ff,d2
	and.w	#$00ff,d3
	cmp.w	d2,d3
	beq.s	L00305c
	bcs.s	L00304c
	exg.l	d0,d1
	exg.l	d2,d3
L00304c:
	move.w	d2,d5
	sub.w	d3,d5
	cmp.w	#$0019,d5
	bcc.s	L003078
	lsr.l	d5,d1
	addx.l	d1,d0
	bra.s	L003066

L00305c:
	add.l	d1,d0
	lsr.l	#1,d0
	moveq.l	#$00,d1
	addx.l	d1,d0
	addq.w	#1,d2
L003066:
	cmp.l	#$01000000,d0
	bcs.s	L003072
	lsr.l	#1,d0
	addq.w	#1,d2
L003072:
	cmp.w	#$00ff,d2
	bcc.s	L003098
L003078:
	lsl.w	#7,d2
	move.l	d2,d1
	and.l	#$80000000,d1
	swap.w	d0
	and.w	#$007f,d0
	or.w	d2,d0
	swap.w	d0
	or.l	d1,d0
	move.w	#$0000,ccr
	movem.l	(sp)+,d1-d5
	rts

L003098:
	move.l	d4,d0
	and.l	#$80000000,d0
	or.l	#$7f800000,d0
	move.w	#$0003,ccr
	movem.l	(sp)+,d1-d5
	rts

L0030b0:
	move.l	d1,d0
L0030b2:
	cmp.l	#$80000000,d0
	beq.w	L00315c
	bra.w	L00315e

L0030c0:
	move.l	d0,d2
	move.l	d1,d3
	swap.w	d0
	swap.w	d1
	move.w	d0,d2
	move.w	d1,d3
	moveq.l	#$7f,d6
	and.w	d6,d0
	and.w	d6,d1
	addq.w	#1,d6
	or.w	d6,d0
	or.w	d6,d1
	swap.w	d0
	swap.w	d1
	lsr.w	#7,d2
	lsr.w	#7,d3
	and.w	#$00ff,d2
	and.w	#$00ff,d3
	cmp.w	d2,d3
	beq.s	L003108
	bcs.s	L0030f2
	exg.l	d0,d1
	exg.l	d2,d3
L0030f2:
	move.w	d2,d5
	sub.w	d3,d5
	cmp.w	#$0019,d5
	bcc.s	L003158
	subq.w	#2,d2
	add.l	d0,d0
	add.l	d1,d1
	add.l	d0,d0
	add.l	d1,d1
	lsr.l	d5,d1
L003108:
	cmp.l	d0,d1
	beq.s	L00315c
	bcs.s	L003112
	exg.l	d0,d1
	exg.l	d2,d3
L003112:
	sub.l	d1,d0
	cmp.l	#$01000000,d0
	bcc.s	L00314a
L00311c:
	cmp.l	#$00800000,d0
	bcc.s	L00312c
	add.l	d0,d0
	subq.w	#1,d2
	beq.s	L00315c
	bra.s	L00311c

L00312c:
	lsl.w	#7,d2
	swap.w	d0
	and.w	#$007f,d0
	or.w	d2,d0
	swap.w	d2
	and.w	#$8000,d2
	or.w	d2,d0
	swap.w	d0
	move.w	#$0000,ccr
	movem.l	(sp)+,d1-d5
	rts

L00314a:
	lsr.l	#1,d0
	addq.w	#1,d2
	cmp.l	#$01000000,d0
	bcc.s	L00314a
	bra.s	L00312c

L003158:
	moveq.l	#$00,d1
	bra.s	L003108

L00315c:
	moveq.l	#$00,d0
L00315e:
	move.w	#$0000,ccr
	movem.l	(sp)+,d1-d5
	rts

L003168:
	move.l	d1,d0
	move.w	#$0000,ccr
	movem.l	(sp)+,d1-d5
	rts

L003174:
	move.l	d0,d4
	bclr.l	#$1f,d4
	cmp.l	d6,d4
	bne.s	L00319e
	move.l	d1,d4
	bclr.l	#$1f,d4
	cmp.l	d6,d4
	bcs.s	L00319e
	bne.s	L003168
	cmp.l	d0,d1
	beq.s	L00319e
	move.l	#$7fffffff,d0
	move.w	#$0001,ccr
	movem.l	(sp)+,d1-d5
	rts

L00319e:
	move.w	#$0000,ccr
	movem.l	(sp)+,d1-d5
	rts

__FADDONE:
	movem.l	d1/d6,-(sp)
	move.l	#$3f800000,d1
	jsr	(__FADD)
	movem.l	(sp)+,d1/d6
	rts

__FASIN:
	move.l	d1,-(sp)
	jsr	(__FTOD)
	jsr	(__ASIN)
	jsr	(L0009b0)
	movem.l	(sp)+,d1
	rts

__FATAN:
	move.l	d1,-(sp)
	jsr	(__FTOD)
	jsr	(__ATAN)
	jsr	(L0009b0)
	movem.l	(sp)+,d1
	rts

__FATANH:
	move.l	d1,-(sp)
	jsr	(__FTOD)
	jsr	(__ATANH)
	jsr	(L0009b0)
	movem.l	(sp)+,d1
	rts

__FCEIL:
	move.l	d1,-(sp)
	jsr	(__FTOD)
	jsr	(__DCEIL)
	jsr	(L0009b0)
	move.l	(sp)+,d1
	rts

__FCOS:
	move.l	d1,-(sp)
	jsr	(__FTOD)
	jsr	(__COS)
	jsr	(L0009b0)
	movem.l	(sp)+,d1
	rts

__FCOSH:
	move.l	d1,-(sp)
	jsr	(__FTOD)
	jsr	(__COSH)
	jsr	(L0009b0)
	movem.l	(sp)+,d1
	rts

L003258:
	move.l	d6,-(sp)
	bsr.w	__FDIV
	movem.l	(sp)+,d6
	rts

L003264:
	and.l	d7,d6
	cmp.l	d7,d6
	bne.s	L003278
	move.l	d1,d7
	and.l	#$007fffff,d7
	beq.w	L0033aa
	bra.s	L0032e8

L003278:
	tst.l	d6
	bne.w	L0033aa
	bra.w	L0033c8

L003282:
	and.l	d7,d6
	cmp.l	d7,d6
	bne.s	L0032aa
	move.l	d0,d7
	and.l	#$007fffff,d7
	move.l	d1,d6
	and.l	#$007fffff,d6
	or.l	d6,d7
	beq.w	L0033c8
	move.l	d0,d7
	and.l	#$007fffff,d7
	bne.s	L0032bc
	bra.s	L0032e8

L0032aa:
	move.l	d0,d7
	and.l	#$007fffff,d7
	bne.s	L0032bc
	or.l	#$7f800000,d4
	move.l	d4,d0
L0032bc:
	move.w	#$0000,ccr
	bra.w	L0033a4

L0032c4:
	move.l	#$7f800000,d0
	or.l	d4,d0
	move.w	#$0005,ccr
	bra.w	L0033a4

L0032d4:
	move.l	d1,d7
	and.l	#$007fffff,d7
	bne.s	L0032e8
	moveq.l	#$00,d0
	move.w	#$0000,ccr
	bra.w	L0033a4

L0032e8:
	move.l	d1,d0
	bra.s	L0032bc

__FDIV:
	movem.l	d1-d5/d7,-(sp)
	move.l	d0,d5
	move.l	d1,d6
	move.l	d0,d4
	eor.l	d1,d4
	and.l	#$80000000,d4
	move.l	#$7f800000,d7
	and.l	d7,d5
	beq.w	L003264
	cmp.l	d7,d5
	beq.w	L003282
	and.l	d7,d6
	beq.s	L0032c4
	cmp.l	d7,d6
	beq.s	L0032d4
	and.l	#$007fffff,d0
	or.l	#$00800000,d0
	lsl.l	#4,d0
	lsl.l	#8,d1
	or.l	#$80000000,d1
	move.l	d4,-(sp)
	move.l	d0,d2
	swap.w	d1
	divu.w	d1,d2
	move.w	d2,d3
	move.l	d1,d4
	swap.w	d1
	move.l	d1,d7
	mulu.w	d2,d4
	mulu.w	d2,d7
	clr.w	d7
	swap.w	d7
	add.l	d7,d4
	sub.l	d4,d0
	bcc.s	L003358
	move.l	d1,d7
	clr.w	d7
	swap.w	d7
L003352:
	subq.w	#1,d3
	add.l	d7,d0
	bcc.s	L003352
L003358:
	swap.w	d3
	clr.w	d3
	swap.w	d0
	clr.w	d0
	swap.w	d1
	divu.w	d1,d0
	bvc.s	L003368
	moveq.l	#$ff,d0
L003368:
	or.w	d0,d3
	move.l	d3,d0
	move.l	(sp)+,d4
L00336e:
	cmp.l	#$10000000,d0
	bcs.s	L003380
	lsr.l	#1,d0
	add.l	#$00800000,d5
	bra.s	L00336e

L003380:
	addq.l	#7,d0
	lsr.l	#4,d0
	and.l	#$007fffff,d0
	add.l	#$3f000000,d5
	sub.l	d6,d5
	bls.s	L0033b2
	cmp.l	#$7f800000,d5
	bcc.s	L0033ba
	or.l	d5,d0
	or.l	d4,d0
	move.w	#$0000,ccr
L0033a4:
	movem.l	(sp)+,d1-d5/d7
	rts

L0033aa:
	moveq.l	#$00,d0
	move.w	#$0000,ccr
	bra.s	L0033a4

L0033b2:
	moveq.l	#$00,d0
	move.w	#$0001,ccr
	bra.s	L0033a4

L0033ba:
	move.l	#$7f800000,d0
	or.l	d4,d0
	move.w	#$0003,ccr
	bra.s	L0033a4

L0033c8:
	move.l	#$7fffffff,d0
	or.l	d4,d0
	move.w	#$0001,ccr
	bra.s	L0033a4

__FEXP:
	move.l	d1,-(sp)
	jsr	(__FTOD)
	jsr	(__EXP)
	jsr	(L0009b0)
	movem.l	(sp)+,d1
	rts

__FFIX:
	move.l	d1,-(sp)
	jsr	(__FTOD)
	jsr	(__DFIX)
	jsr	(L0009b0)
	movem.l	(sp)+,d1
	rts

__FFLOOR:
	move.l	d1,-(sp)
	jsr	(__FTOD)
	jsr	(__DFLOOR)
	jsr	(L0009b0)
	move.l	(sp)+,d1
	rts

__FLOG:
	move.l	d1,-(sp)
	jsr	(__FTOD)
	jsr	(__LOG)
	jsr	(L0009b0)
	movem.l	(sp)+,d1
	rts

__FLOG10:
	move.l	d1,-(sp)
	jsr	(__FTOD)
	jsr	(__LOG10)
	jsr	(L0009b0)
	movem.l	(sp)+,d1
	rts

__FLOG2:
	move.l	d1,-(sp)
	jsr	(__FTOD)
	jsr	(__LOG2)
	jsr	(L0009b0)
	movem.l	(sp)+,d1
	rts

__FMOD:
	movem.l	d1-d4,-(sp)
	move.l	d0,d4
	move.l	d1,d0
	jsr	(__FTOD)
	move.l	d0,d2
	move.l	d1,d3
	move.l	d4,d0
	jsr	(__FTOD)
	jsr	(__DMOD)
	jsr	(L0009b0)
	movem.l	(sp)+,d1-d4
	rts

L00349c:
	move.l	d6,-(sp)
	bsr.s	__FMUL
	movem.l	(sp)+,d6
	rts

L0034a6:
	and.l	d7,d6
	cmp.l	d7,d6
	bne.w	L0035b0
	move.l	d1,d7
	and.l	#$007fffff,d7
	beq.s	L0034da
	bra.s	L003508

L0034ba:
	and.l	d7,d6
	cmp.l	d7,d6
	bne.s	L0034cc
	move.l	d0,d7
	and.l	#$007fffff,d7
	bne.s	L0034f2
	bra.s	L003508

L0034cc:
	move.l	d0,d7
	and.l	#$007fffff,d7
	bne.s	L0034f2
	tst.l	d6
	bne.s	L0034ea
L0034da:
	or.l	#$7fffffff,d4
	move.l	d4,d0
	move.w	#$0001,ccr
	bra.w	L0035aa

L0034ea:
	or.l	#$7f800000,d4
	move.l	d4,d0
L0034f2:
	move.w	#$0000,ccr
	bra.w	L0035aa

L0034fa:
	bra.w	L0035b0

L0034fe:
	move.l	d1,d7
	and.l	#$007fffff,d7
	beq.s	L0034ea
L003508:
	move.l	d1,d0
	bra.s	L0034f2

__FMUL:
	movem.l	d1-d5/d7,-(sp)
	move.l	d0,d5
	move.l	d1,d6
	move.l	d0,d4
	eor.l	d1,d4
	and.l	#$80000000,d4
	move.l	#$7f800000,d7
	and.l	d7,d5
	beq.w	L0034a6
	cmp.l	d7,d5
	beq.s	L0034ba
	and.l	d7,d6
	beq.s	L0034fa
	cmp.l	d7,d6
	beq.s	L0034fe
	lsl.l	#6,d0
	lsl.l	#6,d1
	swap.w	d0
	swap.w	d1
	move.w	#$1fff,d7
	and.w	d7,d0
	and.w	d7,d1
	addq.w	#1,d7
	or.w	d7,d0
	or.w	d7,d1
	move.l	d0,d2
	move.l	d1,d3
	swap.w	d0
	swap.w	d1
	move.l	d4,-(sp)
	moveq.l	#$00,d4
	move.w	d2,d7
	mulu.w	d3,d7
	mulu.w	d2,d1
	mulu.w	d3,d0
	add.l	d1,d0
	addx.l	d4,d4
	swap.w	d4
	clr.w	d0
	swap.w	d0
	add.l	d7,d0
	add.l	d4,d0
	move.l	(sp)+,d4
	lsr.l	#2,d0
	moveq.l	#$00,d7
	cmp.l	#$02000000,d0
	bcs.s	L003584
	lsr.l	#1,d0
	move.l	#$00800000,d7
L003584:
	addq.l	#1,d0
	lsr.l	#1,d0
	and.l	#$007fffff,d0
	add.l	d7,d5
	add.l	d6,d5
	sub.l	#$3f800000,d5
	bls.s	L0035b8
	cmp.l	#$7f800000,d5
	bcc.s	L0035c0
	or.l	d5,d0
	or.l	d4,d0
	move.w	#$0000,ccr
L0035aa:
	movem.l	(sp)+,d1-d5/d7
	rts

L0035b0:
	moveq.l	#$00,d0
	move.w	#$0000,ccr
	bra.s	L0035aa

L0035b8:
	moveq.l	#$00,d0
	move.w	#$0001,ccr
	bra.s	L0035aa

L0035c0:
	move.l	#$7f800000,d0
	or.l	d4,d0
	move.w	#$0003,ccr
	bra.s	L0035aa

__FNPI:
	movem.l	d1/d6,-(sp)
	move.l	#$40490fdb,d1
	jsr	(__FMUL)
	movem.l	(sp)+,d1/d6
	rts

__FPI:
	move.l	#$40490fdb,d0
	rts

__FPOWER:
	movem.l	d1-d4/d6/a5-a6,-(sp)
	move.l	d0,d4
	move.l	d1,d0
	jsr	(__FTOD)
	move.l	d0,d2
	move.l	d1,d3
	move.l	d4,d0
	jsr	(__FTOD)
	jsr	(__POWER)
	jsr	(L0009b0)
	movem.l	(sp)+,d1-d4/d6/a5-a6
	rts

__FSIN:
	move.l	d1,-(sp)
	jsr	(__FTOD)
	jsr	(__SIN)
	jsr	(L0009b0)
	movem.l	(sp)+,d1
	rts

__FSINH:
	move.l	d1,-(sp)
	jsr	(__FTOD)
	jsr	(__SINH)
	jsr	(L0009b0)
	movem.l	(sp)+,d1
	rts

__FSQR:
	movem.l	d1/d6/a5-a6,-(sp)
	jsr	(__FTOD)
	jsr	(__SQR)
	jsr	(L0009b0)
	movem.l	(sp)+,d1/d6/a5-a6
	rts

__FSUBONE:
	movem.l	d1/d6,-(sp)
	move.l	#$3f800000,d1
	jsr	(__FSUB)
	movem.l	(sp)+,d1/d6
	rts

__FTAN:
	move.l	d1,-(sp)
	jsr	(__FTOD)
	jsr	(__TAN)
	jsr	(L0009b0)
	movem.l	(sp)+,d1
	rts

__FTANH:
	move.l	d1,-(sp)
	jsr	(__FTOD)
	jsr	(__TANH)
	jsr	(L0009b0)
	movem.l	(sp)+,d1
	rts

__FTOD:
	tst.l	d0
	beq.s	L0036f8
	bmi.s	L0036d4
	cmp.l	#$7f800000,d0
	beq.s	L0036fc
	bcc.s	L00370c
	moveq.l	#$00,d1
	move.w	d0,d1
	lsr.l	#3,d0
	ror.l	#3,d1
	clr.w	d1
	add.l	#$38000000,d0
	rts

L0036d4:
	cmp.l	#$80000000,d0
	beq.s	L0036f8
	cmp.l	#$ff800000,d0
	beq.s	L0036fc
	bcc.s	L00370c
	moveq.l	#$00,d1
	move.w	d0,d1
	lsr.l	#3,d0
	ror.l	#3,d1
	clr.w	d1
	add.l	#$a8000000,d0
	rts

L0036f8:
	moveq.l	#$00,d1
	rts

L0036fc:
	moveq.l	#$00,d1
	and.l	#$80000000,d0
	or.l	#$7ff00000,d0
	rts

L00370c:
	moveq.l	#$ff,d1
	or.l	#$7fffffff,d0
	rts

__FTOL:
	movem.l	d1-d4,-(sp)
	move.l	d0,d2
	cmp.l	#$4f000000,d0
	beq.s	L0037a0
	swap.w	d0
	move.l	d0,d4
	lsr.w	#7,d4
	and.w	#$00ff,d4
	cmp.w	#$00ff,d4
	beq.s	L00378c
	sub.w	#$007f,d4
	bcs.s	L003770
	and.w	#$007f,d0
	or.w	#$0080,d0
	swap.w	d0
	cmp.w	#$001f,d4
	bcc.s	L003774
	cmp.w	#$0017,d4
	bcc.s	L003766
	moveq.l	#$17,d1
	sub.w	d4,d1
	lsr.l	d1,d0
L003756:
	tst.l	d2
	bpl.s	L00375c
	neg.l	d0
L00375c:
	move.w	#$0000,ccr
L003760:
	movem.l	(sp)+,d1-d4
	rts

L003766:
	beq.s	L003756
	sub.w	#$0017,d4
	lsl.l	d4,d0
	bra.s	L003756

L003770:
	moveq.l	#$00,d0
	bra.s	L003760

L003774:
	bne.s	L0037a0
	and.l	#$00ffffff,d0
	cmp.l	#$00800000,d0
	bne.s	L0037a0
	move.l	#$80000000,d0
	bra.s	L003760

L00378c:
	move.l	d2,d0
	add.l	d0,d0
	cmp.l	#$ff000000,d0
	beq.s	L0037a0
	move.l	#$7fffff00,d0
	bra.s	L0037ac

L0037a0:
	move.l	#$7fffffff,d0
	tst.l	d2
	bpl.s	L0037ac
	addq.l	#1,d0
L0037ac:
	movem.l	(sp)+,d1-d4
	move.w	#$0001,ccr
	rts

L0037b6:
	swap.w	d0
	jsr	(__DSUBONE)
	lea.l	(L003a66,pc),a4
	lea.l	(__LOG10,pc),a5
	bsr.w	L003c46
	move.w	#$0000,ccr
	movem.l	(sp)+,d2-d7/a4-a6
	rts

L0037d4:
	and.w	#$7ff0,d6
	beq.s	L00380a
	cmp.w	#$7ff0,d6
	beq.s	L0037f0
L0037e0:
	move.l	#$7fffffff,d0
	moveq.l	#$ff,d1
	move.w	#$0001,ccr
	bra.w	L0038f0

L0037f0:
	tst.l	d1
	beq.s	L0037e0
	move.l	d0,d6
	swap.w	d6
	and.l	#$000fffff,d6
	beq.s	L0037e0
L003800:
	swap.w	d0
	move.w	#$0000,ccr
	bra.w	L0038f0

L00380a:
	move.l	#$fff00000,d0
	moveq.l	#$00,d1
	move.w	#$0001,ccr
	bra.w	L0038f0

__LOG:
	movem.l	d2-d7/a4-a6,-(sp)
	swap.w	d0
	cmp.w	#$3fec,d0
	bcs.s	L00382c
	cmp.w	#$3ff2,d0
	bcs.s	L0037b6
L00382c:
	move.w	d0,d6
	bmi.s	L0037d4
	lsr.w	#1,d6
	and.w	#$3ff8,d6
	beq.s	L00380a
	cmp.w	#$3ff8,d6
	beq.s	L003800
	sub.w	#$1fe8,d6
	and.w	#$000f,d0
	or.w	#$0010,d0
	swap.w	d0
	add.l	d1,d1
	addx.l	d0,d0
	add.l	d1,d1
	addx.l	d0,d0
	cmp.l	#$00733333,d0		;'s33'
	bcc.s	L003862
	subq.w	#8,d6
	add.l	d1,d1
	addx.l	d0,d0
L003862:
	move.w	d6,-(sp)
	bsr.w	L003976
	moveq.l	#$40,d6			;'@'
	moveq.l	#$20,d2			;' '
	swap.w	d2
	cmp.l	d2,d0
	bcs.s	L003894
L003872:
	sub.w	#$0010,d6
	lsr.l	#1,d0
	roxr.l	#1,d1
	cmp.l	d2,d0
	bcc.s	L003872
	roxr.w	#1,d7
	bpl.s	L003894
	moveq.l	#$00,d7
	addq.l	#1,d1
	addx.l	d7,d0
	cmp.l	d2,d0
	bcs.s	L003894
	sub.w	#$0010,d6
	lsr.l	#1,d0
	roxr.l	#1,d1
L003894:
	swap.w	d0
	or.w	#$bff0,d0
	sub.w	d6,d0
	swap.w	d0
	move.w	(sp)+,d6
	bne.s	L0038aa
	move.w	d6,ccr
	movem.l	(sp)+,d2-d7/a4-a6
	rts

L0038aa:
	cmp.w	#$0080,d6
	bcc.s	L0038c2
	movem.l	(L0038f6,pc,d6.w),d2-d3
	jsr	(__DADD)
	movem.l	(sp)+,d2-d7/a4-a6
	rts

L0038c2:
	move.l	d0,d4
	move.l	d1,d5
	asr.w	#3,d6
	ext.l	d6
	move.l	d6,d0
	jsr	(__LTOD)
	move.l	#$3fe62e42,d2
	move.l	#$fefa39ef,d3
	jsr	(__DMUL)
	bcs.s	L0038f0
	move.l	d4,d2
	move.l	d5,d3
	jsr	(__DADD)
L0038f0:
	movem.l	(sp)+,d2-d7/a4-a6
	rts

L0038f6:
	.dc.d	0f0
	.dc.d	0f-6.1546488229599023e+227
	.dc.d	0f-6.1546488229633495e+227
	.dc.d	0f1.5232004175765733e+249
	.dc.d	0f-4.0335106525833731e+232
	.dc.d	0f1.6254912590667125e+211
	.dc.d	0f1.5232004175773872e+249
	.dc.d	0f-4.1969658190937553e-068
	.dc.d	0f-6.1546488229150884e+227
	.dc.d	0f1.7524571481328455e-089
	.dc.d	0f1.6254912590676693e+211
	.dc.d	0f-6.5686966578371136e-111
	.dc.d	0f1.5232004175782012e+249
	.dc.d	0f1.7245882032427077e-220
	.dc.d	0f-4.1969658190971288e-068
	.dc.d	0f1.6334819093056265e+080
L003976:
	movea.l	d1,a6
	moveq.l	#$0d,d1
	moveq.l	#$02,d6
	lea.l	(L003b46),a5
	movea.l	#$01000000,a4
	moveq.l	#$00,d2
	moveq.l	#$00,d3
	move.l	d0,d4
	move.l	a6,d5
	lsr.l	#1,d4
	roxr.l	#1,d5
	add.l	a6,d5
	addx.l	d0,d4
	cmp.l	a4,d4
	bcc.s	L0039b0
	move.l	d4,d0
	movea.l	d5,a6
	move.l	(a5)+,d7
	sub.l	(a5)+,d3
	subx.l	d7,d2
	lsr.l	#1,d4
	roxr.l	#1,d5
	lsr.l	#1,d4
	roxr.l	#1,d5
	bra.s	L0039c8

L0039b0:
	sub.l	a6,d5
	subx.l	d0,d4
	lsr.l	#1,d4
	roxr.l	#1,d5
	addq.l	#8,a5
	bra.s	L0039c8

L0039bc:
	move.l	d5,d7
	move.w	d4,d5
	lsr.l	d6,d4
	ror.l	d6,d5
	lsr.l	d6,d7
	move.w	d7,d5
L0039c8:
	add.l	a6,d5
	addx.l	d0,d4
	cmp.l	a4,d4
	bcc.s	L0039f2
	move.l	d4,d0
	movea.l	d5,a6
	move.l	(a5)+,d7
	sub.l	(a5)+,d3
	subx.l	d7,d2
	addq.w	#1,d6
	dbra.w	d1,L0039bc
	moveq.l	#$0a,d1
	moveq.l	#$00,d6
	move.l	a6,d5
	move.l	d0,d4
	move.w	d4,d5
	clr.w	d4
	swap.w	d4
	swap.w	d5
	bra.s	L003a22

L0039f2:
	sub.l	a6,d5
	subx.l	d0,d4
	lsr.l	#1,d4
	roxr.l	#1,d5
	addq.l	#8,a5
	addq.w	#1,d6
	dbra.w	d1,L0039c8
	moveq.l	#$0a,d1
	moveq.l	#$00,d6
	move.l	a6,d5
	move.l	d0,d4
	move.w	d4,d5
	clr.w	d4
	swap.w	d4
	swap.w	d5
	bra.s	L003a22

L003a14:
	move.w	d4,d5
	lsr.l	d6,d4
	ror.l	d6,d5
	move.w	d4,d5
	clr.w	d4
	swap.w	d5
	swap.w	d4
L003a22:
	add.l	a6,d5
	addx.l	d0,d4
	cmp.l	a4,d4
	bcc.s	L003a48
	move.l	d4,d0
	movea.l	d5,a6
	move.l	(a5)+,d7
	sub.l	(a5)+,d3
	subx.l	d7,d2
	addq.w	#1,d6
	dbra.w	d1,L003a14
	move.l	a6,d1
	add.l	d3,d1
	addx.l	d2,d0
	sub.l	a4,d0
	neg.l	d1
	negx.l	d0
	rts

L003a48:
	sub.l	a6,d5
	subx.l	d0,d4
	lsr.l	#1,d4
	roxr.l	#1,d5
	addq.l	#8,a5
	addq.w	#1,d6
	dbra.w	d1,L003a22
	move.l	a6,d1
	add.l	d3,d1
	addx.l	d2,d0
	sub.l	a4,d0
	neg.l	d1
	negx.l	d0
	rts

L003a66:
	.dc.b	$bf,$ac,$71,$c7,$1c,$71,$c7,$1c
	.dc.b	$3f,$ae,$1e,$1e,$1e,$1e,$1e,$1e
	.dc.b	$bf,$b0,$00,$00,$00,$00,$00,$00
	.dc.b	$3f,$b1,$11,$11,$11,$11,$11,$11
	.dc.b	$bf,$b2,$49,$24,$92,$49,$24,$92
	.dc.b	$3f,$b3,$b1,$3b,$13,$b1,$3b,$14
	.dc.b	$bf,$b5,$55,$55,$55,$55,$55,$55
	.dc.b	$3f,$b7,$45,$d1,$74,$5d,$17,$46
	.dc.b	$bf,$b9,$99,$99,$99,$99,$99,$9a
	.dc.b	$3f,$bc,$71,$c7,$1c,$71,$c7,$1c
	.dc.b	$bf,$c0,$00,$00,$00,$00,$00,$00
	.dc.b	$3f,$c2,$49,$24,$92,$49,$24,$92
	.dc.b	$bf,$c5,$55,$55,$55,$55,$55,$55
	.dc.b	$3f,$c9,$99,$99,$99,$99,$99,$9a
	.dc.b	$bf,$d0,$00,$00,$00,$00,$00,$00
	.dc.b	$3f,$d5,$55,$55,$55,$55,$55,$55
	.dc.b	$bf,$e0,$00,$00,$00,$00,$00,$00
	.dc.b	$3f,$f0,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
__LOG10:
	movem.l	d2-d3/d6,-(sp)
	move.l	#$3fdbcb7b,d2
	move.l	#$1526e50e,d3
	jsr	(__LOG)
	bcs.s	L003b1c
	jsr	(__DMUL)
L003b1c:
	movem.l	(sp)+,d2-d3/d6
	rts

__LOG2:
	movem.l	d2-d3/d6,-(sp)
	move.l	#$3ff71547,d2
	move.l	#$652b82ff,d3
	jsr	(__LOG)
	bcs.s	L003b40
	jsr	(__DMUL)
L003b40:
	movem.l	(sp)+,d2-d3/d6
	rts

L003b46:
	.dc.b	$00,$67,$cc,$8f,$b2,$fe,$61,$2f
	.dc.b	$00,$39,$1f,$ef,$8f,$35,$34,$43
	.dc.b	$00,$1e,$27,$07,$6e,$2a,$f2,$e5
	.dc.b	$00,$0f,$85,$18,$60,$08,$b1,$53
	.dc.b	$00,$07,$e0,$a6,$c3,$9e,$0c,$c0
	.dc.b	$00,$03,$f8,$15,$16,$1f,$80,$7c
	.dc.b	$00,$01,$fe,$02,$a6,$b1,$06,$78
	.dc.b	$00,$00,$ff,$80,$55,$15,$88,$5e
	.dc.b	$00,$00,$7f,$e0,$0a,$a6,$ac,$43
	.dc.b	$00,$00,$3f,$f8,$01,$55,$15,$62
	.dc.b	$00,$00,$1f,$fe,$00,$2a,$a6,$ab
	.dc.b	$00,$00,$0f,$ff,$80,$05,$55,$15
	.dc.b	$00,$00,$07,$ff,$e0,$00,$aa,$a6
	.dc.b	$00,$00,$03,$ff,$f8,$00,$15,$55
	.dc.b	$00,$00,$01,$ff,$fe,$00,$02,$aa
	.dc.b	$00,$00,$00,$ff,$ff,$80,$00,$55
	.dc.b	$00,$00,$00,$7f,$ff,$e0,$00,$0a
	.dc.b	$00,$00,$00,$3f,$ff,$f8,$00,$01
	.dc.b	$00,$00,$00,$1f,$ff,$fe,$00,$00
	.dc.b	$00,$00,$00,$0f,$ff,$ff,$80,$00
	.dc.b	$00,$00,$00,$07,$ff,$ff,$e0,$00
	.dc.b	$00,$00,$00,$03,$ff,$ff,$f8,$00
	.dc.b	$00,$00,$00,$01,$ff,$ff,$fe,$00
	.dc.b	$00,$00,$00,$00,$ff,$ff,$ff,$80
	.dc.b	$00,$00,$00,$00,$7f,$ff,$ff,$e0
	.dc.b	$00,$00,$00,$00,$3f,$ff,$ff,$f8
	.dc.b	$00,$00,$00,$00,$1f,$ff,$ff,$fe
	.dc.b	$00,$00,$00,$00,$0f,$ff,$ff,$ff
	.dc.b	$00,$00,$00,$00,$07,$ff,$ff,$ff
	.dc.b	$00,$00,$00,$00,$03,$ff,$ff,$ff
	.dc.b	$00,$00,$00,$00,$01,$ff,$ff,$ff
	.dc.b	$00,$00,$00,$00,$00,$ff,$ff,$ff
L003c46:
	move.l	d1,-(sp)
	move.l	d0,-(sp)
	move.l	(a4)+,d0
	move.l	(a4)+,d1
L003c4e:
	move.l	(sp),d2
	move.l	($0004,sp),d3
	jsr	(__DMUL)
	move.l	(a4)+,d2
	move.l	(a4)+,d3
	jsr	(__DADD)
	cmpa.l	a5,a4
	bne.s	L003c4e
	addq.l	#8,sp
	rts

__LTOD:
	move.l	d0,d1
	beq.s	L003c7a
	bpl.s	L003c7c
	neg.l	d0
	bsr.s	L003c7c
	bchg.l	#$1f,d0
L003c7a:
	rts

L003c7c:
	cmpi.l	#$00010000,d0
	bcs.s	L003ca4
	move.l	#$0000041e,d1
L003c8a:
	add.l	d0,d0
	dbcs.w	d1,L003c8a
	move.w	d0,-(sp)
	and.w	#$f000,d0
	or.w	d1,d0
	move.w	(sp)+,d1
	swap.w	d1
	asl.l	#4,d1
	swap.w	d0
	rol.l	#4,d0
	rts

L003ca4:
	move.l	#$0000040e,d1
L003caa:
	add.w	d0,d0
	dbcs.w	d1,L003caa
	swap.w	d1
	or.l	d1,d0
	moveq.l	#$00,d1
	rol.l	#4,d0
	rts

__LTOF:
	tst.l	d0
	beq.s	L003cc8
	bpl.s	L003cca
	neg.l	d0
	bsr.s	L003cca
	bchg.l	#$1f,d0
L003cc8:
	rts

L003cca:
	move.w	d1,-(sp)
	cmpi.l	#$00010000,d0
	bcs.s	L003cf2
	move.w	#$009e,d1
L003cd8:
	add.l	d0,d0
	dbcs.w	d1,L003cd8
	add.l	#$00000100,d0
	negx.w	d1
	neg.w	d1
	move.b	d1,d0
	move.w	(sp)+,d1
	ror.l	#8,d0
	lsr.l	#1,d0
	rts

L003cf2:
	move.w	#$008e,d1
L003cf6:
	add.w	d0,d0
	dbcs.w	d1,L003cf6
	swap.w	d0
	move.w	d1,d0
	move.w	(sp)+,d1
	rol.l	#7,d0
	swap.w	d0
	rts

__NPI:
	movem.l	d2-d3/d6,-(sp)
	move.l	#$400921fb,d2
	move.l	#$54442d18,d3
	jsr	(__DMUL)
	movem.l	(sp)+,d2-d3/d6
	rts

__PI:
	move.l	#$400921fb,d0
	move.l	#$54442d18,d1
	rts

L003d32:
	move.l	d0,d6
	and.l	#$7ff00000,d6
	cmp.l	#$7ff00000,d6
	bne.s	L003d50
	move.l	d0,d6
	and.l	#$000fffff,d6
	or.l	d1,d6
	beq.s	L003d50
	rts

L003d50:
	move.l	#$3ff00000,d0
	moveq.l	#$00,d1
	rts

L003d5a:
	move.l	d0,d6
	and.l	#$7ff00000,d6
	cmp.l	#$7ff00000,d6
	bne.s	L003d76
	move.l	d0,d6
	and.l	#$000fffff,d6
	or.l	d1,d6
	bne.s	L003da2
L003d76:
	move.l	d2,d6
	and.l	#$000fffff,d6
	or.l	d3,d6
	bne.s	L003d9e
	move.l	d0,d6
	and.l	#$7ff00000,d6
	beq.s	L003dc6
	tst.l	d0
	bmi.s	L003dd4
	cmp.l	#$7ff00000,d6
	beq.s	L003da8
	tst.l	d2
	bmi.w	L003e50
L003d9e:
	move.l	d2,d0
	move.l	d3,d1
L003da2:
	move.w	#$0000,ccr
	rts

L003da8:
	move.l	d0,d6
	and.l	#$000fffff,d6
	or.l	d1,d6
	bne.s	L003da2
	tst.l	d2
	bpl.s	L003da2
	move.l	#$7fffffff,d0
	moveq.l	#$ff,d1
	move.w	#$0000,ccr
	rts

L003dc6:
	move.l	#$7fffffff,d0
	moveq.l	#$ff,d1
	move.w	#$0001,ccr
	rts

L003dd4:
	tst.l	d2
	bmi.s	L003de6
	move.l	#$fff00000,d0
	moveq.l	#$00,d1
	move.w	#$0000,ccr
	rts

L003de6:
	move.l	#$7fffffff,d0
	moveq.l	#$ff,d1
	move.w	#$0001,ccr
	rts

L003df4:
	bra.w	L003d32

L003df8:
	bra.w	L003d5a

__POWER:
	move.l	d2,d6
	swap.w	d6
	and.w	#$7ff0,d6
	beq.s	L003df4
	cmp.w	#$7ff0,d6
	beq.s	L003df8
	sub.w	#$3ff0,d6
	bcs.s	L003e2e
	lsr.w	#4,d6
	cmp.w	#$0010,d6
	bcc.s	L003e2e
	tst.l	d3
	bne.s	L003e2e
	movea.l	d5,a5
	move.l	#$000fffff,d5
	lsr.l	d6,d5
	and.l	d2,d5
	beq.s	L003e58
	move.l	a5,d5
L003e2e:
	move.l	d0,d6
	and.l	#$7ff00000,d6
	beq.s	L003e50
	jsr	(__LOG)
	bcs.s	L003e4e
	jsr	(__DMUL)
	bcs.s	L003e4e
	jmp	(__EXP)

L003e4e:
	rts

L003e50:
	moveq.l	#$00,d0
	moveq.l	#$00,d1
	move.w	d0,ccr
	rts

L003e58:
	move.l	a5,d5
	move.l	d0,d6
	and.l	#$7ff00000,d6
	beq.s	L003e50
	movem.l	d2-d3/d7,-(sp)
	link.w	a6,#$0000
	movem.l	d0-d1,-(sp)
	move.l	d2,-(sp)
	bclr.l	#$1f,d2
	move.l	d2,d0
	move.l	d3,d1
	jsr	(__DTOL)
	bcs.s	L003ea6
	move.l	d0,d7
	bsr.s	L003ed0
	bcs.s	L003ea6
	tst.l	(sp)+
	bpl.s	L003e9e
	move.l	d0,d2
	move.l	d1,d3
	move.l	#$3ff00000,d0
	moveq.l	#$00,d1
	jsr	(L001f44)
L003e9e:
	unlk	a6
	movem.l	(sp)+,d2-d3/d7
	rts

L003ea6:
	move.w	sr,d0
	tst.l	(-$000c,a6)
	bpl.s	L003eb2
	bchg.l	#$01,d0
L003eb2:
	btst.l	#$01,d0
	bne.s	L003ec2
	moveq.l	#$00,d0
	moveq.l	#$00,d1
	move.w	#$0001,ccr
	bra.s	L003e9e

L003ec2:
	move.l	#$7ff00000,d0
	moveq.l	#$00,d1
	move.w	#$0003,ccr
	bra.s	L003e9e

L003ed0:
	tst.l	d7
	beq.s	L003f00
	btst.l	#$00,d7
	beq.s	L003ef0
	subq.l	#1,d7
	beq.s	L003f06
	bsr.s	L003ed0
	bcs.s	L003ea6
	move.l	(-$0008,a6),d2
	move.l	(-$0004,a6),d3
	jmp	(L0024ac)

L003ef0:
	lsr.l	#1,d7
	bsr.s	L003ed0
	bcs.s	L003ea6
	move.l	d0,d2
	move.l	d1,d3
	jmp	(L0024ac)

L003f00:
	moveq.l	#$00,d0
	moveq.l	#$00,d1
	rts

L003f06:
	move.l	(-$0008,a6),d0
	move.l	(-$0004,a6),d1
	rts

__SIN:
	movem.l	d2-d7/a3-a6,-(sp)
	suba.w	a3,a3
	move.l	d0,d4
	bclr.l	#$1f,d4
	cmpi.l	#$3ff921fb,d4
	bls.s	L003f36
	cmp.l	#$7ff00000,d4
	bcc.s	L003f52
	bsr.w	L004042
	move.l	d0,d4
	bclr.l	#$1f,d4
L003f36:
	cmpi.l	#$3f500000,d4
	bcs.w	L003fdc
	bsr.w	L0040dc
	move.l	d7,d1
	move.l	d6,d0
	bsr.w	L004354
	movem.l	(sp)+,d2-d7/a3-a6
	rts

L003f52:
	bne.s	L003f6a
	tst.l	d1
	bne.s	L003f6a
	move.l	#$7fffffff,d0
	moveq.l	#$ff,d1
	move.w	#$0001,ccr
	movem.l	(sp)+,d2-d7/a3-a6
	rts

L003f6a:
	move.w	#$0000,ccr
	movem.l	(sp)+,d2-d7/a3-a6
	rts

__COS:
	movem.l	d2-d7/a3-a6,-(sp)
	suba.w	a3,a3
	move.l	d0,d4
	bclr.l	#$1f,d4
	cmpi.l	#$3ff921fb,d4
	bls.s	L003f9a
	cmp.l	#$7ff00000,d4
	bcc.s	L003f52
	bsr.w	L004042
	move.l	d0,d4
	bclr.l	#$1f,d4
L003f9a:
	cmpi.l	#$3ff91dfb,d4
	bcc.s	L003fb4
	bsr.w	L0040dc
	move.l	d5,d1
	move.l	d4,d0
	bsr.w	L004354
	movem.l	(sp)+,d2-d7/a3-a6
	rts

L003fb4:
	move.l	#$3ff921fb,d2
	move.l	#$54442d18,d3
	bset.l	#$1f,d0
	jsr	(L001b4a)
	move.l	#$3c91a626,d2
	move.l	#$33145c07,d3
	jsr	(L001b4a)
L003fdc:
	move.l	d0,d2
	move.l	d1,d3
	move.l	d2,d4
	move.l	d3,d5
	jsr	(L0024ac)
	move.l	d0,d6
	move.l	d1,d7
	move.l	#$405e0000,d2
	moveq.l	#$00,d3
	jsr	(L001f44)
	move.l	#$3fc55555,d2
	move.l	#$55555555,d3		;'UUUU'
	jsr	(L001b54)
	move.l	d6,d2
	move.l	d7,d3
	jsr	(L0024ac)
	move.l	d4,d2
	move.l	d5,d3
	jsr	(L0024ac)
	jsr	(L001b4a)
	move.w	a3,d2
	swap.w	d2
	clr.w	d2
	eor.l	d2,d0
	movem.l	(sp)+,d2-d7/a3-a6
	rts

L004036:
	cmpi.l	#$3ff921fb,d4
	bhi.s	L004042
	suba.w	a3,a3
	rts

L004042:
	cmpi.l	#$4012d97c,d4
	bhi.s	L004084
	move.l	#$400921fb,d2
	move.l	#$54442d18,d3
	movea.w	#$8000,a3
	move.l	d0,d4
	eor.l	d0,d2
	bset.l	#$1f,d2
	eor.l	d0,d2
	jsr	(L001b4a)
	move.l	#$3ca1a626,d2
	move.l	#$33145c07,d3
	eor.l	d4,d2
	bset.l	#$1f,d2
	eor.l	d4,d2
	jmp	(L001b4a)

L004084:
	suba.w	a3,a3
	move.l	#$401921fb,d2
	move.l	#$54442d18,d3
	cmp.l	d2,d4
	bcs.s	L0040b2
	jsr	(L0023f8)
	move.l	d0,d4
	bclr.l	#$1f,d4
	cmp.l	#$401921fb,d4
	bcs.s	L004036
	moveq.l	#$00,d4
	moveq.l	#$00,d0
	moveq.l	#$00,d1
	rts

L0040b2:
	move.l	d0,d4
	eor.l	d0,d2
	bset.l	#$1f,d2
	eor.l	d0,d2
	jsr	(L001b4a)
	move.l	#$3cb1a626,d2
	move.l	#$33145c07,d3
	eor.l	d4,d2
	bset.l	#$1f,d2
	eor.l	d4,d2
	jmp	(L001b4a)

L0040dc:
	movem.l	(L005178,pc),d2-d7
	cmp.l	d2,d0
	beq.w	L0042ba
L0040e8:
	move.l	d1,-(sp)
	move.l	d0,-(sp)
	bsr.w	L004308
	move.l	#$26dd3b6a,d4
	move.l	#$10d7969b,d5
	moveq.l	#$00,d6
	moveq.l	#$00,d7
	lea.l	(L001a0a),a6
	move.l	d0,d2
	move.l	d1,d3
	moveq.l	#$02,d0
	tst.l	d2
	bmi.s	L004150
	move.l	d4,d1
	movea.l	d5,a5
	sub.l	d7,d5
	subx.l	d6,d4
	add.l	a5,d7
	addx.l	d1,d6
	move.l	(a6)+,d1
	sub.l	(a6)+,d3
	subx.l	d1,d2
	bmi.s	L004164
L004124:
	movea.l	d2,a4
	movea.l	d3,a5
	move.l	d4,d2
	move.l	d5,d3
	asr.l	#1,d2
	roxr.l	#1,d3
	add.l	d7,d3
	addx.l	d6,d2
	asr.l	#1,d6
	roxr.l	#1,d7
	sub.l	d7,d5
	subx.l	d6,d4
	move.l	d2,d6
	move.l	d3,d7
	move.l	a4,d2
	move.l	a5,d3
	move.l	(a6)+,d1
	sub.l	(a6)+,d3
	subx.l	d1,d2
	bpl.s	L004196
	bra.w	L0041d6

L004150:
	move.l	d6,d1
	movea.l	d7,a5
	sub.l	d5,d7
	subx.l	d4,d6
	add.l	a5,d5
	addx.l	d1,d4
	move.l	(a6)+,d1
	add.l	(a6)+,d3
	addx.l	d1,d2
	bpl.s	L004124
L004164:
	movea.l	d2,a4
	movea.l	d3,a5
	move.l	d6,d2
	move.l	d7,d3
	asr.l	#1,d2
	roxr.l	#1,d3
	add.l	d5,d3
	addx.l	d4,d2
	asr.l	#1,d4
	roxr.l	#1,d5
	sub.l	d5,d7
	subx.l	d4,d6
	move.l	d2,d4
	move.l	d3,d5
	move.l	a4,d2
	move.l	a5,d3
	move.l	(a6)+,d1
	add.l	(a6)+,d3
	addx.l	d1,d2
	bpl.s	L004196
	bra.s	L0041d6

L00418e:
	addq.w	#1,d0
	cmpi.w	#$0011,d0
	beq.s	L004210
L004196:
	movea.l	d2,a4
	movea.l	d3,a5
	move.l	d4,d2
	move.l	d5,d3
	move.l	d3,d1
	move.w	d2,d3
	asr.l	d0,d2
	ror.l	d0,d3
	lsr.l	d0,d1
	move.w	d1,d3
	add.l	d7,d3
	addx.l	d6,d2
	move.l	d7,d1
	move.w	d6,d7
	asr.l	d0,d6
	ror.l	d0,d7
	lsr.l	d0,d1
	move.w	d1,d7
	sub.l	d7,d5
	subx.l	d6,d4
	move.l	d2,d6
	move.l	d3,d7
	move.l	a4,d2
	move.l	a5,d3
	move.l	(a6)+,d1
	sub.l	(a6)+,d3
	subx.l	d1,d2
	bpl.s	L00418e
L0041ce:
	addq.w	#1,d0
	cmpi.w	#$0011,d0
	beq.s	L004214
L0041d6:
	movea.l	d2,a4
	movea.l	d3,a5
	move.l	d6,d2
	move.l	d7,d3
	move.l	d3,d1
	move.w	d2,d3
	asr.l	d0,d2
	ror.l	d0,d3
	lsr.l	d0,d1
	move.w	d1,d3
	add.l	d5,d3
	addx.l	d4,d2
	move.l	d5,d1
	move.w	d4,d5
	asr.l	d0,d4
	ror.l	d0,d5
	lsr.l	d0,d1
	move.w	d1,d5
	sub.l	d5,d7
	subx.l	d4,d6
	move.l	d2,d4
	move.l	d3,d5
	move.l	a4,d2
	move.l	a5,d3
	move.l	(a6)+,d1
	add.l	(a6)+,d3
	addx.l	d1,d2
	bpl.s	L00418e
	bra.s	L0041ce

L004210:
	moveq.l	#$01,d0
	bra.s	L004222

L004214:
	moveq.l	#$01,d0
	bra.s	L004266

L004218:
	addq.w	#1,d0
	cmpi.w	#$000f,d0
	beq.w	L0042a6
L004222:
	movea.l	d2,a4
	movea.l	d3,a5
	move.l	d4,d2
	move.l	d5,d3
	move.w	d2,d3
	asr.l	d0,d2
	ror.l	d0,d3
	move.w	d2,d3
	swap.w	d3
	swap.w	d2
	ext.l	d2
	add.l	d7,d3
	addx.l	d6,d2
	move.w	d6,d7
	asr.l	d0,d6
	ror.l	d0,d7
	move.w	d6,d7
	swap.w	d7
	swap.w	d6
	ext.l	d6
	sub.l	d7,d5
	subx.l	d6,d4
	move.l	d2,d6
	move.l	d3,d7
	move.l	a4,d2
	move.l	a5,d3
	move.l	(a6)+,d1
	sub.l	(a6)+,d3
	subx.l	d1,d2
	bpl.s	L004218
L00425e:
	addq.w	#1,d0
	cmpi.w	#$000f,d0
	beq.s	L0042a6
L004266:
	movea.l	d2,a4
	movea.l	d3,a5
	move.l	d6,d2
	move.l	d7,d3
	move.w	d2,d3
	asr.l	d0,d2
	ror.l	d0,d3
	move.w	d2,d3
	swap.w	d3
	swap.w	d2
	ext.l	d2
	add.l	d5,d3
	addx.l	d4,d2
	move.w	d4,d5
	asr.l	d0,d4
	ror.l	d0,d5
	move.w	d4,d5
	swap.w	d5
	swap.w	d4
	ext.l	d4
	sub.l	d5,d7
	subx.l	d4,d6
	move.l	d2,d4
	move.l	d3,d5
	move.l	a4,d2
	move.l	a5,d3
	move.l	(a6)+,d1
	add.l	(a6)+,d3
	addx.l	d1,d2
	bpl.w	L004218
	bra.s	L00425e

L0042a6:
	jsr	(L0043f0)
	move.l	(sp)+,d2
	move.l	(sp)+,d3
	movem.l	d2-d7,(L005178)
	rts

L0042ba:
	cmp.l	d3,d1
	bne.w	L0040e8
	rts

__COSH:
	movem.l	d2-d3/d6/a3,-(sp)
	lea.l	(__DADD),a3
	bra.s	L0042d8

__SINH:
	movem.l	d2-d3/d6/a3,-(sp)
	lea.l	(__DSUB),a3
L0042d8:
	jsr	(__EXP)
	bcs.s	L004302
	move.l	d0,d2
	move.l	d1,d3
	move.l	#$3ff00000,d0
	moveq.l	#$00,d1
	jsr	(__DDIV)
	bcs.s	L004302
	exg.l	d0,d2
	exg.l	d1,d3
	jsr	(a3)
	bcs.s	L004302
	jsr	(__DDIVTWO)
L004302:
	movem.l	(sp)+,d2-d3/d6/a3
	rts

L004308:
	swap.w	d0
	move.w	d0,d7
	bmi.s	L004342
	and.w	#$000f,d0
	or.w	#$0010,d0
	swap.w	d0
L004318:
	lsr.w	#4,d7
	andi.w	#$07ff,d7
	sub.w	#$03f5,d7
	bmi.s	L004332
	move.l	d1,d4
	move.w	d0,d4
	lsl.l	d7,d0
	lsl.l	d7,d1
	rol.l	d7,d4
	move.w	d4,d0
	rts

L004332:
	neg.w	d7
	move.l	d1,d4
	move.w	d0,d1
	lsr.l	d7,d0
	ror.l	d7,d1
	lsr.l	d7,d4
	move.w	d4,d1
	rts

L004342:
	and.w	#$000f,d0
	or.w	#$0010,d0
	swap.w	d0
	bsr.s	L004318
	neg.l	d1
	negx.l	d0
	rts

L004354:
	move.l	d0,d4
	beq.s	L004394
	bpl.s	L00435e
	neg.l	d1
	negx.l	d0
L00435e:
	cmpi.l	#$00200000,d0
	bhi.s	L0043a0
L004366:
	move.w	#$1fa8,d2
	moveq.l	#$14,d3
	btst.l	d3,d0
	bne.s	L00437a
L004370:
	subq.w	#8,d2
	add.l	d1,d1
	addx.l	d0,d0
	btst.l	d3,d0
	beq.s	L004370
L00437a:
	add.w	d2,d2
	swap.w	d4
	move.w	a3,d3
	eor.w	d3,d4
	and.w	#$8000,d4
	swap.w	d0
	and.w	#$000f,d0
	or.w	d2,d0
	or.w	d4,d0
	swap.w	d0
L004392:
	rts

L004394:
	tst.l	d1
	beq.s	L004392
	bpl.s	L004366
	neg.l	d1
	negx.l	d0
	bra.s	L004366

L0043a0:
	move.l	d0,d3
	swap.w	d3
	moveq.l	#$0c,d2
L0043a6:
	subq.w	#1,d2
	add.w	d3,d3
	bcc.s	L0043a6
	move.l	d1,d3
	move.w	d0,d1
	lsr.l	d2,d0
	ror.l	d2,d1
	lsr.l	d2,d3
	bcc.s	L0043d0
	move.w	d3,d1
	addq.l	#1,d1
	bne.s	L0043d2
	addq.l	#1,d0
	cmpi.l	#$00200000,d0
	bcs.s	L0043d2
	addq.w	#1,d2
	lsr.l	#1,d0
	roxr.l	#1,d1
	bra.s	L0043d2

L0043d0:
	move.w	d3,d1
L0043d2:
	add.w	#$03f5,d2
	lsl.w	#4,d2
	swap.w	d4
	move.w	a3,d3
	eor.w	d3,d4
	and.w	#$8000,d4
	swap.w	d0
	and.w	#$000f,d0
	or.w	d2,d0
	or.w	d4,d0
	swap.w	d0
	rts

L0043f0:
	movea.l	d2,a6
	move.l	d3,-(sp)
	movea.l	d4,a4
	movea.l	d5,a5
	bsr.s	L004416
	add.l	d7,d5
	addx.l	d6,d4
	exg.l	d7,d5
	exg.l	d6,d4
	move.l	a6,d2
	move.l	(sp)+,d3
	bsr.s	L004416
	move.l	a4,d2
	move.l	a5,d3
	sub.l	d5,d3
	subx.l	d4,d2
	move.l	d3,d5
	move.l	d2,d4
	rts

L004416:
	tst.l	d2
	bpl.s	L00441c
	neg.l	d3
L00441c:
	eor.l	d4,d2
	bpl.s	L004424
	pea.l	(L00447c,pc)
L004424:
	tst.l	d4
	bpl.s	L00442c
	neg.l	d5
	negx.l	d4
L00442c:
	move.l	d5,d1
	move.l	d4,d0
	mulu.w	d3,d0
	swap.w	d0
	move.w	d4,d2
	swap.w	d4
	move.w	d4,d5
	mulu.w	d3,d4
	swap.w	d3
	mulu.w	d3,d5
	swap.w	d1
	mulu.w	d3,d1
	swap.w	d1
	mulu.w	d3,d2
	move.l	d4,d3
	moveq.l	#$00,d4
	add.w	d2,d1
	clr.w	d2
	swap.w	d2
	addx.l	d2,d5
	moveq.l	#$00,d2
	addx.l	d2,d4
	add.w	d3,d1
	clr.w	d3
	swap.w	d3
	addx.l	d3,d5
	addx.l	d2,d4
	add.w	d0,d1
	addx.l	d2,d5
	addx.l	d2,d4
	add.w	d1,d1
	addx.l	d5,d5
	addx.l	d4,d4
	add.w	d1,d1
	addx.l	d5,d5
	addx.l	d4,d4
	add.w	d1,d1
	addx.l	d2,d5
	addx.l	d2,d4
	rts

L00447c:
	neg.l	d5
	negx.l	d4
	rts

L004482:
	move.l	a6,d0
	addq.l	#4,sp
	movem.l	(sp)+,d2-d3
	move.w	#$0000,ccr
	rts

L004490:
	beq.s	L0044c0
	and.w	#$7ff0,d6
	beq.s	L004482
	cmp.w	#$7ff0,d6
	bne.s	L0044ac
	move.l	a6,d0
	move.l	d0,d6
	and.l	#$000fffff,d6
	or.l	d1,d6
	bne.s	L004482
L0044ac:
	move.l	#$7fffffff,d0
	moveq.l	#$ff,d1
	addq.l	#4,sp
	movem.l	(sp)+,d2-d3
	move.w	#$0001,ccr
	rts

L0044c0:
	moveq.l	#$00,d0
	moveq.l	#$00,d1
	addq.l	#4,sp
	movem.l	(sp)+,d2-d3
	move.w	#$0004,ccr
	rts

__SQR:
	movea.l	d0,a6
	movem.l	d1-d3,-(sp)
	swap.w	d0
	move.w	d0,d6
	ble.s	L004490
	and.w	#$000f,d0
	or.w	#$0010,d0
	swap.w	d0
	and.w	#$7ff0,d6
	cmp.w	#$7ff0,d6
	beq.s	L004482
	sub.w	#$3fe0,d6
	asr.w	#1,d6
	bclr.l	#$03,d6
	beq.s	L004504
	add.w	#$0010,d6
	lsr.l	#1,d0
	roxr.l	#1,d1
L004504:
	move.l	d1,d2
	move.w	d0,d1
	lsr.l	#5,d0
	ror.l	#5,d1
	lsr.l	#5,d2
	move.w	d2,d1
	cmp.w	#$fffe,d0
	bcs.s	L004524
	lsr.l	#1,d0
	roxr.l	#1,d1
	or.w	#$8000,d0
	move.l	d0,d2
	move.l	d1,d3
	bra.s	L004568

L004524:
	movea.l	d1,a5
	move.l	d0,d2
	lsr.w	#1,d2
	or.w	#$8000,d2
	move.w	d0,d1
	swap.w	d1
	move.l	d1,d0
	divu.w	d2,d0
	subq.w	#1,d2
L004538:
	addq.w	#1,d2
	add.w	d0,d2
	roxr.w	#1,d2
	move.l	d1,d0
	divu.w	d2,d0
	subq.w	#1,d2
	cmp.w	d0,d2
	bhi.s	L004538
	addq.w	#1,d2
	move.l	d0,d3
	cmp.w	d0,d2
	bcc.s	L004552
	exg.l	d0,d2
L004552:
	move.w	a5,d3
	divu.w	d2,d3
	moveq.l	#$00,d1
	add.w	d0,d2
	roxr.w	#1,d2
	roxr.w	#1,d3
	addx.w	d1,d3
	addx.w	d2,d1
	swap.w	d3
	clr.w	d3
	move.l	d1,d2
L004568:
	move.l	d3,d0
	move.w	d2,d0
	lsl.l	#5,d2
	lsl.l	#5,d3
	rol.l	#5,d0
	move.w	d0,d2
	add.w	#$3fe0,d6
	swap.w	d2
	and.w	#$000f,d2
	or.w	d6,d2
	swap.w	d2
	move.l	a6,d0
	move.l	(sp)+,d1
	jsr	(__DDIV)
	cmp.l	d0,d2
	bne.s	L0045be
	move.l	d0,d6
	add.l	d3,d1
	addx.l	d2,d0
	lsr.l	#1,d0
	roxr.l	#1,d1
	bcc.s	L0045a8
	btst.l	#$00,d1
	beq.s	L0045a8
	addq.l	#1,d1
	bne.s	L0045a8
	addq.l	#1,d0
L0045a8:
	swap.w	d6
	swap.w	d0
	and.w	#$000f,d0
	and.w	#$fff0,d6
	or.w	d6,d0
	swap.w	d0
	move.l	(sp)+,d2
	move.l	(sp)+,d3
	rts

L0045be:
	jsr	(__DADD)
	sub.l	#$00100000,d0
	move.l	(sp)+,d2
	move.l	(sp)+,d3
	rts

__IDIV:
	tst.l	d1
	beq.s	L0045e6
	movem.l	d2-d3,-(sp)
	jsr	(L00480a)
	move.l	d2,d1
	movem.l	(sp)+,d2-d3
	rts

L0045e6:
	ori.b	#$01,ccr
	rts

__IMUL:
	move.l	d2,-(sp)
	jsr	(L004822)
	move.l	(sp)+,d2
	rts

__LDIV:
	movem.l	d1-d3/d7,-(sp)
	move.l	d0,d7
	beq.s	L00462c
	bpl.s	L004604
	neg.l	d0
L004604:
	eor.l	d1,d7
	tst.l	d1
	beq.s	L004640
	bpl.s	L00460e
	neg.l	d1
L00460e:
	cmp.l	#$00010000,d1
	bcs.s	L00464a
	jsr	(L00480a)
	tst.l	d7
	bpl.s	L00462c
	neg.l	d0
L004622:
	andi.b	#$fe,ccr
	movem.l	(sp)+,d1-d3/d7
	rts

L00462c:
	cmp.l	#$80000000,d0
	bne.s	L004622
	subq.l	#1,d0
	move.w	#$0003,ccr
	movem.l	(sp)+,d1-d3/d7
	rts

L004640:
	movem.l	(sp)+,d1-d3/d7
	ori.b	#$01,ccr
	rts

L00464a:
	move.l	d0,d2
	clr.w	d0
	swap.w	d0
	cmp.w	d1,d0
	bcc.s	L004668
	divu.w	d1,d2
	move.w	d2,d0
	tst.l	d7
	bpl.s	L00462c
	neg.l	d0
	andi.b	#$fe,ccr
	movem.l	(sp)+,d1-d3/d7
	rts

L004668:
	divu.w	d1,d0
	move.w	d0,d3
	move.w	d2,d0
	divu.w	d1,d0
	swap.w	d0
	move.w	d3,d0
	swap.w	d0
	tst.l	d7
	bpl.s	L00462c
	neg.l	d0
	andi.b	#$fe,ccr
	movem.l	(sp)+,d1-d3/d7
	rts

__LMOD:
	movem.l	d1-d3/d7,-(sp)
	move.l	d0,d7
	beq.s	L0046ae
	bpl.s	L004692
	neg.l	d0
L004692:
	tst.l	d1
	beq.s	L0046c2
	bpl.s	L00469a
	neg.l	d1
L00469a:
	jsr	(L00480a)
	tst.l	d7
	bpl.s	L0046a6
	neg.l	d2
L0046a6:
	move.l	d2,d0
	movem.l	(sp)+,d1-d3/d7
	rts

L0046ae:
	cmp.l	#$80000000,d0
	bne.s	L0046cc
	subq.l	#1,d0
	move.w	#$0003,ccr
	movem.l	(sp)+,d1-d3/d7
	rts

L0046c2:
	movem.l	(sp)+,d1-d3/d7
	ori.b	#$01,ccr
	rts

L0046cc:
	andi.b	#$fe,ccr
	movem.l	(sp)+,d1-d3/d7
	rts

__LMUL:
	movem.l	d1-d2/d7,-(sp)
	move.l	d0,d7
	beq.s	L004742
	bpl.s	L0046e2
	neg.l	d0
L0046e2:
	eor.l	d1,d7
	tst.l	d1
	beq.s	L004742
	bpl.s	L0046ec
	neg.l	d1
L0046ec:
	move.l	d0,d2
	or.l	d1,d2
	swap.w	d2
	tst.w	d2
	beq.s	L00471a
	jsr	(L004822)
	tst.l	d0
	bne.s	L004738
	move.l	d1,d0
	tst.l	d7
	bpl.s	L004734
	cmp.l	#$80000000,d0
	bhi.s	L004738
	neg.l	d0
	andi.b	#$fe,ccr
L004714:
	movem.l	(sp)+,d1-d2/d7
	rts

L00471a:
	mulu.w	d1,d0
	tst.l	d7
	bpl.s	L004734
	cmp.l	#$80000000,d0
	bhi.s	L004738
	neg.l	d0
	andi.b	#$fe,ccr
	movem.l	(sp)+,d1-d2/d7
	rts

L004734:
	tst.l	d0
	bpl.s	L004714
L004738:
	movem.l	(sp)+,d1-d2/d7
	move.w	#$0003,ccr
	rts

L004742:
	clr.l	d0
	movem.l	(sp)+,d1-d2/d7
	rts

__UDIV:
	movem.l	d1-d3/d7,-(sp)
	tst.l	d0
	beq.s	L004768
	tst.l	d1
	beq.s	L0047a8
	cmp.l	#$00010000,d1
	bcs.s	L004778
	jsr	(L00480a)
	andi.b	#$fe,ccr
L004768:
	movem.l	(sp)+,d1-d3/d7
	rts

L00476e:
	movem.l	(sp)+,d1-d3/d7
	ori.b	#$01,ccr
	rts

L004778:
	move.l	d0,d2
	clr.w	d0
	swap.w	d0
	cmp.w	d1,d0
	bcc.s	L004790
	divu.w	d1,d2
	move.w	d2,d0
	andi.b	#$fe,ccr
	movem.l	(sp)+,d1-d3/d7
	rts

L004790:
	divu.w	d1,d0
	move.w	d0,d3
	move.w	d2,d0
	divu.w	d1,d0
	swap.w	d0
	move.w	d3,d0
	swap.w	d0
	andi.b	#$fe,ccr
	movem.l	(sp)+,d1-d3/d7
	rts

L0047a8:
	movem.l	(sp)+,d1-d3/d7
	ori.b	#$01,ccr
	rts

__UMOD:
	movem.l	d1-d3/d7,-(sp)
	move.l	d0,d7
	beq.s	L0047c6
	tst.l	d1
	beq.s	L0047cc
	jsr	(L00480a)
	move.l	d2,d0
L0047c6:
	movem.l	(sp)+,d1-d3/d7
	rts

L0047cc:
	clr.l	d0
	movem.l	(sp)+,d1-d3/d7
	ori.b	#$01,ccr
	rts

__UMUL:
	movem.l	d1-d2/d7,-(sp)
	move.l	d0,d2
	or.l	d1,d2
	swap.w	d2
	tst.w	d2
	bne.s	L0047f8
	mulu.w	d1,d0
	movem.l	(sp)+,d1-d2/d7
	rts

L0047ee:
	movem.l	(sp)+,d1-d2/d7
	move.w	#$0003,ccr
	rts

L0047f8:
	jsr	(L004822)
	tst.l	d0
	bne.s	L0047ee
	move.l	d1,d0
	movem.l	(sp)+,d1-d2/d7
	rts

L00480a:
	clr.l	d2
	moveq.l	#$1f,d3
L00480e:
	lsl.l	#1,d0
	roxl.l	#1,d2
	cmp.l	d1,d2
	bcs.s	L00481c
	bset.l	#$00,d0
	sub.l	d1,d2
L00481c:
	dbra.w	d3,L00480e
	rts

L004822:
	move.w	d1,d2
	mulu.w	d0,d2
	move.l	d2,-(sp)
	clr.l	-(sp)
	move.l	d0,d2
	swap.w	d2
	mulu.w	d1,d2
	add.l	d2,($0002,sp)
	bcc.s	L004838
	addq.w	#1,(sp)
L004838:
	move.l	d1,d2
	swap.w	d2
	mulu.w	d0,d2
	add.l	d2,($0002,sp)
	bcc.s	L004846
	addq.w	#1,(sp)
L004846:
	swap.w	d0
	swap.w	d1
	mulu.w	d1,d0
	add.l	(sp)+,d0
	move.l	(sp)+,d1
	rts

__STOD:
	movem.l	d2-d7/a1-a2,-(sp)
	link.w	a6,#-$001e
	jsr	(L00078e)
	beq.w	L00497c
	jsr	(L000e18)
	move.w	#$ffff,(-$0006,a6)
	clr.l	(-$0004,a6)
	move.b	(a0),d0
	clr.l	d6
	cmp.b	#$2e,d0			;'.'
	bne.s	L00488a
	bset.l	#$1f,d6
	clr.w	(-$0006,a6)
	addq.l	#1,a0
	move.b	(a0),d0
L00488a:
	jsr	(L000e92)
	bcs.w	L004966
	addq.l	#1,a0
	bsr.w	L004a02
	lea.l	(-$001e,a6),a1
	move.b	#$30,(a1)+		;'0'
	movea.l	a1,a2
	clr.w	d5
	bra.s	L0048d0

L0048a8:
	move.b	(a0),d0
	cmp.b	#$2e,d0			;'.'
	bne.s	L0048c2
	tst.l	d6
	bne.w	L00497c
	bset.l	#$1f,d6
	clr.w	(-$0006,a6)
	addq.l	#1,a0
	bra.s	L0048a8

L0048c2:
	jsr	(L000e92)
	bcs.s	L0048f6
	addq.l	#1,a0
	bsr.w	L004a02
L0048d0:
	cmp.w	#$0012,d5
	beq.s	L0048e2
	btst.l	#$1e,d7
	beq.s	L0048e6
	addq.w	#1,d5
	move.b	d0,(a1)+
	bra.s	L0048a8

L0048e2:
	addq.w	#1,d6
	bra.s	L0048a8

L0048e6:
	cmp.b	#$30,d0			;'0'
	beq.s	L0048a8
	bset.l	#$1e,d7
	addq.w	#1,d5
	move.b	d0,(a1)+
	bra.s	L0048a8

L0048f6:
	bsr.w	L004ae0
	bsr.w	L004a70
	bsr.w	L004a0a
	btst.l	#$1f,d7
	beq.s	L00490e
	jsr	(__DNEG)
L00490e:
	move.l	d0,(-$000e,a6)
	move.l	d1,(-$000a,a6)
	tst.w	(-$0006,a6)
	beq.s	L004946
	jsr	(__DTOL)
	bcs.s	L004942
	move.l	d0,d4
	jsr	(__LTOD)
	move.l	(-$000e,a6),d2
	move.l	(-$000a,a6),d3
	jsr	(__DCMP)
	bne.s	L004942
	move.l	d4,(-$0004,a6)
	bra.s	L004946

L004942:
	clr.w	(-$0006,a6)
L004946:
	move.l	(-$000e,a6),d0
	move.l	(-$000a,a6),d1
	clr.l	d2
	move.w	(-$0006,a6),d2
	move.l	(-$0004,a6),d3
	unlk	a6
	addq.l	#8,sp
	movem.l	(sp)+,d4-d7/a1-a2
	move.w	#$0000,ccr
	rts

L004966:
	cmp.b	#$23,d0			;'#'
	bne.s	L00497c
	cmpi.b	#$4e,($0001,a0)		;'N'
	beq.s	L00498c
	cmpi.b	#$49,($0001,a0)		;'I'
	beq.s	L0049b0
L00497c:
	unlk	a6
	movem.l	(sp)+,d2-d7/a1-a2
	clr.l	d0
	clr.l	d1
	move.w	#$0009,ccr
	rts

L00498c:
	cmpi.b	#$41,($0002,a0)		;'A'
	bne.s	L00497c
	cmpi.b	#$4e,($0003,a0)		;'N'
	bne.s	L00497c
	addq.l	#4,a0
	move.l	#$7fffffff,(-$000e,a6)
	move.l	#$ffffffff,(-$000a,a6)
	bra.s	L004942

L0049b0:
	cmpi.b	#$4e,($0002,a0)		;'N'
	bne.s	L00497c
	cmpi.b	#$46,($0003,a0)		;'F'
	bne.s	L00497c
	addq.l	#4,a0
	move.l	#$7ff00000,(-$000e,a6)
	move.l	#$00000000,(-$000a,a6)
	bra.w	L004942

L0049d6:
	moveq.l	#$00,d0
	moveq.l	#$00,d1
L0049da:
	unlk	a6
	movem.l	(sp)+,d2-d7/a1-a2
	move.w	#$0001,ccr
	rts

L0049e6:
	move.l	d4,d0
	and.l	#$80000000,d0
	or.l	#$7ff00000,d0
	moveq.l	#$00,d1
L0049f6:
	unlk	a6
	movem.l	(sp)+,d2-d7/a1-a2
	move.w	#$0003,ccr
	rts

L004a02:
	tst.l	d6
	bpl.s	L004a08
	subq.w	#1,d6
L004a08:
	rts

L004a0a:
	clr.l	d0
	clr.l	d1
	tst.w	d5
	beq.s	L004a6e
L004a12:
	move.l	#$40240000,d2
	moveq.l	#$00,d3
	jsr	(L0024ac)
	move.l	d0,d2
	move.l	d1,d3
	clr.l	d0
	move.b	(a2)+,d0
	sub.b	#$30,d0			;'0'
	jsr	(__LTOD)
	jsr	(L001b4a)
	subq.w	#1,d5
	bne.s	L004a12
	add.w	d6,d4
	beq.s	L004a6e
	bmi.s	L004a58
L004a42:
	move.l	#$40240000,d2
	moveq.l	#$00,d3
	jsr	(L0024ac)
	bcs.s	L0049f6
	subq.w	#1,d4
	bne.s	L004a42
	rts

L004a58:
	move.l	#$40240000,d2
	moveq.l	#$00,d3
	jsr	(L001f44)
	bcs.w	L0049da
	addq.w	#1,d4
	bne.s	L004a58
L004a6e:
	rts

L004a70:
	clr.l	d4
	cmp.b	#$45,d0			;'E'
	beq.s	L004a80
	cmp.b	#$65,d0			;'e'
	beq.s	L004a80
	rts

L004a80:
	clr.w	(-$0006,a6)
	addq.l	#1,a0
	move.b	(a0),d0
	cmp.b	#$2b,d0			;'+'
	beq.s	L004a98
	cmp.b	#$2d,d0			;'-'
	bne.s	L004a9c
	bset.l	#$1f,d4
L004a98:
	addq.l	#1,a0
	move.b	(a0),d0
L004a9c:
	jsr	(L000e92)
	bcs.w	L00497c
	sub.b	#$30,d0			;'0'
	move.b	d0,d4
	clr.w	d0
L004aae:
	addq.l	#1,a0
	move.b	(a0),d0
	jsr	(L000e92)
	bcs.s	L004ad8
	sub.b	#$30,d0			;'0'
	move.w	d4,-(sp)
	lsl.w	#2,d4
	add.w	(sp)+,d4
	lsl.w	#1,d4
	add.w	d0,d4
	cmp.w	#$03e8,d4
	bcs.s	L004aae
	tst.l	d4
	bpl.w	L0049e6
	bra.w	L0049d6

L004ad8:
	tst.l	d4
	bpl.s	L004ade
	neg.w	d4
L004ade:
	rts

L004ae0:
	clr.b	(a1)
	cmp.w	#$0012,d5
	bne.s	L004b28
	cmpi.b	#$35,-(a1)		;'5'
	bcs.s	L004afc
L004aee:
	addq.b	#1,-(a1)
	cmpi.b	#$3a,(a1)		;':'
	bcs.s	L004afc
	move.b	#$30,(a1)		;'0'
	bra.s	L004aee

L004afc:
	cmpa.l	a2,a1
	bcc.s	L004b04
	movea.l	a1,a2
	addq.w	#1,d6
L004b04:
	move.b	(a0),d0
	jsr	(L000e92)
	bcc.s	L004b1e
	cmp.b	#$2e,d0			;'.'
	bne.s	L004b28
	tst.l	d6
	bmi.w	L00497c
	bset.l	#$1f,d6
L004b1e:
	addq.l	#1,a0
	tst.l	d6
	bmi.s	L004b04
	addq.w	#1,d6
	bra.s	L004b04

L004b28:
	rts

L004b2a:
	bne.s	L004b42
	tst.l	d1
	bne.s	L004b42
	move.l	#$7fffffff,d0
	moveq.l	#$ff,d1
	move.w	#$0001,ccr
	movem.l	(sp)+,d2-d7/a3-a6
	rts

L004b42:
	move.w	#$0000,ccr
	movem.l	(sp)+,d2-d7/a3-a6
	rts

__TAN:
	movem.l	d2-d7/a3-a6,-(sp)
	move.l	d0,d4
	bclr.l	#$1f,d4
	move.l	#$400921fb,d2
	move.l	#$54442d18,d3
	cmp.l	d2,d4
	bcs.s	L004b74
	cmp.l	#$7ff00000,d4
	bcc.s	L004b2a
	jsr	(L002402)
L004b74:
	move.l	d0,d4
	bclr.l	#$1f,d4
	cmp.l	#$3ff921fb,d4
	bcs.s	L004bac
	move.l	d0,d4
	eor.l	d0,d2
	bclr.l	#$1f,d2
	eor.l	d0,d2
	jsr	(L001b54)
	move.l	#$3ca1a626,d2
	move.l	#$33145c07,d3
	eor.l	d4,d2
	bclr.l	#$1f,d2
	eor.l	d4,d2
	jsr	(L001b54)
L004bac:
	move.l	d0,-(sp)
	move.l	d0,d2
	beq.w	L004cda
	bpl.s	L004bba
	bclr.l	#$1f,d0
L004bba:
	cmpi.l	#$3f500000,d0
	bcs.w	L004ce8
	cmpi.l	#$3ff91dfb,d0
	bcc.w	L004d44
	jsr	(L004308)
	move.l	#$26dd3b6a,d4
	move.l	#$10d7969b,d5
	moveq.l	#$00,d6
	moveq.l	#$00,d7
	lea.l	(L001a0a),a6
	move.l	d0,d2
	move.l	d1,d3
	moveq.l	#$00,d0
	move.l	(a6)+,d1
	movea.l	(a6)+,a4
	sub.l	a4,d3
	subx.l	d1,d2
	bmi.s	L004c08
	move.l	d4,d1
	movea.l	d5,a4
	sub.l	d7,d5
	subx.l	d6,d4
	add.l	a4,d7
	addx.l	d1,d6
	bra.s	L004c0c

L004c08:
	add.l	a4,d3
	addx.l	d1,d2
L004c0c:
	addq.w	#1,d0
	cmpi.w	#$0011,d0
	beq.s	L004c50
	move.l	(a6)+,d1
	movea.l	(a6)+,a4
	sub.l	a4,d3
	subx.l	d1,d2
	bmi.s	L004c08
	movea.l	d2,a4
	movea.l	d3,a5
	move.l	d4,d2
	move.l	d5,d3
	move.l	d3,d1
	move.w	d2,d3
	asr.l	d0,d2
	ror.l	d0,d3
	lsr.l	d0,d1
	move.w	d1,d3
	addx.l	d7,d3
	addx.l	d6,d2
	move.l	d7,d1
	move.w	d6,d7
	asr.l	d0,d6
	ror.l	d0,d7
	lsr.l	d0,d1
	move.w	d1,d7
	subx.l	d7,d5
	subx.l	d6,d4
	move.l	d2,d6
	move.l	d3,d7
	move.l	a4,d2
	move.l	a5,d3
	bra.s	L004c0c

L004c50:
	moveq.l	#$01,d0
	bra.s	L004c60

L004c54:
	add.l	a4,d3
	addx.l	d1,d2
L004c58:
	addq.w	#1,d0
	cmpi.w	#$0010,d0
	beq.s	L004ca0
L004c60:
	move.l	(a6)+,d1
	movea.l	(a6)+,a4
	sub.l	a4,d3
	subx.l	d1,d2
	bmi.s	L004c54
	movea.l	d2,a4
	movea.l	d3,a5
	move.l	d4,d2
	move.l	d5,d3
	move.w	d2,d3
	asr.l	d0,d2
	ror.l	d0,d3
	move.w	d2,d3
	swap.w	d3
	swap.w	d2
	ext.l	d2
	add.l	d7,d3
	addx.l	d6,d2
	move.w	d6,d7
	asr.l	d0,d6
	ror.l	d0,d7
	move.w	d6,d7
	swap.w	d7
	swap.w	d6
	ext.l	d6
	sub.l	d7,d5
	subx.l	d6,d4
	move.l	d2,d6
	move.l	d3,d7
	move.l	a4,d2
	move.l	a5,d3
	bra.s	L004c58

L004ca0:
	jsr	(L0043f0)
	tst.l	(sp)+
	bpl.s	L004cae
	neg.l	d7
	negx.l	d6
L004cae:
	suba.w	a3,a3
	move.l	d4,d0
	move.l	d5,d1
	jsr	(L004354)
	move.l	d1,-(sp)
	move.l	d0,-(sp)
	move.l	d6,d0
	move.l	d7,d1
	suba.w	a3,a3
	jsr	(L004354)
	move.l	(sp)+,d2
	move.l	(sp)+,d3
	jsr	(L001f44)
	movem.l	(sp)+,d2-d7/a3-a6
	rts

L004cda:
	tst.l	d1
	bne.w	L004bba
	addq.l	#4,sp
	movem.l	(sp)+,d2-d7/a3-a6
	rts

L004ce8:
	move.l	d2,d0
	move.l	d1,d3
	move.l	d0,d4
	move.l	d1,d5
	jsr	(L0024ac)
	move.l	d0,d6
	move.l	d1,d7
	move.l	#$402e0000,d2
	moveq.l	#$00,d3
	jsr	(L001b54)
	exg.l	d0,d6
	exg.l	d1,d7
	move.l	#$40140000,d2
	moveq.l	#$00,d3
	jsr	(L0024ac)
	move.l	d6,d2
	move.l	d7,d3
	jsr	(L001b4a)
	exg.l	d0,d6
	exg.l	d1,d7
	move.l	d4,d2
	move.l	d5,d3
	jsr	(L0024ac)
	move.l	d6,d2
	move.l	d7,d3
	jsr	(L001f44)
	addq.l	#4,sp
	movem.l	(sp)+,d2-d7/a3-a6
	rts

L004d44:
	move.l	d2,d0
	move.l	d1,d3
	eori.l	#$3ff921fb,d0
	bclr.l	#$1f,d0
	eor.l	d2,d0
	move.l	#$54442d18,d1
	move.l	d0,d4
	jsr	(L001b54)
	move.l	#$3c91a626,d2
	move.l	#$33145c07,d3
	eor.l	d4,d2
	bclr.l	#$1f,d2
	eor.l	d4,d2
	jsr	(L001b4a)
	move.l	d0,d2
	move.l	d1,d3
	move.l	d0,d4
	move.l	d1,d5
	jsr	(L0024ac)
	move.l	d0,d6
	move.l	d1,d7
	move.l	#$402e0000,d2
	moveq.l	#$00,d3
	jsr	(L001b54)
	exg.l	d0,d6
	exg.l	d1,d7
	move.l	#$40140000,d2
	moveq.l	#$00,d3
	jsr	(L0024ac)
	move.l	d6,d2
	move.l	d7,d3
	jsr	(L001b4a)
	exg.l	d0,d6
	exg.l	d1,d7
	move.l	d4,d2
	move.l	d5,d3
	jsr	(L0024ac)
	move.l	d0,d2
	move.l	d1,d3
	move.l	d6,d0
	move.l	d7,d1
	jsr	(L001f44)
	addq.l	#4,sp
	movem.l	(sp)+,d2-d7/a3-a6
	rts

__TANH:
	movem.l	d0-d3/d6,-(sp)
	jsr	(__COSH)
	bcs.s	L004e08
	move.l	d0,d2
	move.l	d1,d3
	movem.l	(sp),d0-d1
	jsr	(__SINH)
	bcs.s	L004e08
	jsr	(__DDIV)
	bcs.s	L004e08
	addq.l	#8,sp
	movem.l	(sp)+,d2-d3/d6
	rts

L004e08:
	move.l	(sp),d0
	addq.l	#8,sp
	moveq.l	#$00,d1
	and.l	#$80000000,d0
	or.l	#$3ff00000,d0
	movem.l	(sp)+,d2-d3/d6
	rts

__CDINC:
	btst.b	#$05,($0010,sp)
	bne.s	L004e2a
	move.l	usp,a6
L004e2a:
	movem.l	d0-d3,-(sp)
	movem.l	(a6),d0-d1
	move.l	#$3ff00000,d2
	moveq.l	#$00,d3
	jsr	(__DADD)
	movem.l	d0-d1,(a6)
	movem.l	(sp)+,d0-d3
	rts

__CFINC:
	btst.b	#$05,($0010,sp)
	bne.s	L004e54
	move.l	usp,a6
L004e54:
	move.l	d1,-(sp)
	move.l	d0,-(sp)
	move.l	(a6),d0
	move.l	#$3f800000,d1
	jsr	(__FADD)
	movem.l	d0,(a6)
	movem.l	(sp)+,d0-d1
	rts

__CDDEC:
	btst.b	#$05,($0010,sp)
	bne.s	L004e7a
	move.l	usp,a6
L004e7a:
	movem.l	d0-d3,-(sp)
	movem.l	(a6),d0-d1
	move.l	#$3ff00000,d2
	moveq.l	#$00,d3
	jsr	(__DSUB)
	movem.l	d0-d1,(a6)
	movem.l	(sp)+,d0-d3
	rts

__CFDEC:
	btst.b	#$05,($0010,sp)
	bne.s	L004ea4
	move.l	usp,a6
L004ea4:
	move.l	d1,-(sp)
	move.l	d0,-(sp)
	move.l	(a6),d0
	move.l	#$3f800000,d1
	jsr	(__FSUB)
	movem.l	d0,(a6)
	movem.l	(sp)+,d0-d1
	rts

__CLTOD:
	btst.b	#$05,($0010,sp)
	bne.s	L004eca
	move.l	usp,a6
L004eca:
	move.l	d1,-(sp)
	move.l	d0,-(sp)
	move.l	(a6),d0
	bsr.w	__LTOD
	movem.l	d0-d1,(a6)
	movem.l	(sp)+,d0-d1
	rts

__CDTOL:
	btst.b	#$05,($0010,sp)
	bne.s	L004ee8
	move.l	usp,a6
L004ee8:
	move.l	d1,-(sp)
	move.l	d0,-(sp)
	movem.l	(a6),d0-d1
	bsr.w	__DTOL
	movem.l	d0,(a6)
	movem.l	(sp)+,d0-d1
	rts

__CFTOL:
	btst.b	#$05,($0010,sp)
	bne.s	L004f08
	move.l	usp,a6
L004f08:
	move.l	d0,-(sp)
	move.l	(a6),d0
	bsr.w	__FTOL
	movem.l	d0,(a6)
	movem.l	(sp)+,d0
	rts

__CLTOF:
	btst.b	#$05,($0010,sp)
	bne.s	L004f24
	move.l	usp,a6
L004f24:
	move.l	d0,-(sp)
	move.l	(a6),d0
	bsr.w	__LTOF
	movem.l	d0,(a6)
	movem.l	(sp)+,d0
	rts

__CFTOD:
	btst.b	#$05,($0010,sp)
	bne.s	L004f40
	move.l	usp,a6
L004f40:
	move.l	d1,-(sp)
	move.l	d0,-(sp)
	move.l	(a6),d0
	bsr.w	__FTOD
	movem.l	d0-d1,(a6)
	movem.l	(sp)+,d0-d1
	rts

__CDTOF:
	btst.b	#$05,($0010,sp)
	bne.s	L004f5e
	move.l	usp,a6
L004f5e:
	move.l	d1,-(sp)
	move.l	d0,-(sp)
	movem.l	(a6),d0-d1
	bsr.w	__DTOF
	movem.l	d0,(a6)
	movem.l	(sp)+,d0-d1
	rts

L004f74:
	move.w	sr,d6
	move.l	d0,(a6)+
	move.l	d1,(a6)+
	move.l	(sp)+,d0
	move.l	a5,d1
	addq.l	#4,sp
	move.b	d6,($000d,sp)
	movem.l	(sp)+,d6/a5-a6
L004f88:
	tst.w	(sp)
	bmi.s	L004f8e
	rte

L004f8e:
	ori.w	#$8000,sr
	rte

__CDADD:
	btst.b	#$05,($0010,sp)
	bne.s	L004f9e
	move.l	usp,a6
L004f9e:
	movea.l	d1,a5
	move.l	d0,-(sp)
	pea.l	(L004f74,pc)
	movem.l	d2-d5,-(sp)
	movem.l	(a6),d0-d3
	bra.w	L001bba

__CDSUB:
	btst.b	#$05,($0010,sp)
	bne.s	L004fbc
	move.l	usp,a6
L004fbc:
	movea.l	d1,a5
	move.l	d0,-(sp)
	pea.l	(L004f74,pc)
	movem.l	d2-d5,-(sp)
	movem.l	(a6),d0-d3
	bra.w	L001d86

__CDMUL:
	btst.b	#$05,($0010,sp)
	bne.s	L004fda
	move.l	usp,a6
L004fda:
	movea.l	d1,a5
	move.l	d0,-(sp)
	pea.l	(L004f74,pc)
	movem.l	d2-d5/d7,-(sp)
	movem.l	(a6),d0-d3
	bra.w	L002554

__CDDIV:
	btst.b	#$05,($0010,sp)
	bne.s	L004ff8
	move.l	usp,a6
L004ff8:
	movea.l	d1,a5
	move.l	d0,-(sp)
	pea.l	(L004f74,pc)
	movem.l	d2-d5/d7,-(sp)
	movem.l	(a6),d0-d3
	bra.w	L002038

__CDMOD:
	btst.b	#$05,($0010,sp)
	bne.s	L005016
	move.l	usp,a6
L005016:
	movem.l	d0-d3,-(sp)
	movem.l	(a6),d0-d3
	bsr.w	__DMOD
	movem.l	d0-d1,(a6)
	movem.l	(sp)+,d0-d3
	rts

__CFADD:
	btst.b	#$05,($0010,sp)
	bne.s	L005036
	move.l	usp,a6
L005036:
	move.l	d1,-(sp)
	move.l	d0,-(sp)
	movem.l	(a6),d0-d1
	jsr	(__FADD)
	movem.l	d0,(a6)
	movem.l	(sp)+,d0-d1
	rts

__CFSUB:
	btst.b	#$05,($0010,sp)
	bne.s	L005058
	move.l	usp,a6
L005058:
	move.l	d1,-(sp)
	move.l	d0,-(sp)
	movem.l	(a6),d0-d1
	jsr	(__FSUB)
	movem.l	d0,(a6)
	movem.l	(sp)+,d0-d1
	rts

__CFMUL:
	btst.b	#$05,($0010,sp)
	bne.s	L00507a
	move.l	usp,a6
L00507a:
	move.l	d1,-(sp)
	move.l	d0,-(sp)
	movem.l	(a6),d0-d1
	jsr	(__FMUL)
	movem.l	d0,(a6)
	movem.l	(sp)+,d0-d1
	rts

__CFDIV:
	btst.b	#$05,($0010,sp)
	bne.s	L00509c
	move.l	usp,a6
L00509c:
	move.l	d1,-(sp)
	move.l	d0,-(sp)
	movem.l	(a6),d0-d1
	jsr	(__FDIV)
	movem.l	d0,(a6)
	movem.l	(sp)+,d0-d1
	rts

__CFMOD:
	btst.b	#$05,($0010,sp)
	bne.s	L0050be
	move.l	usp,a6
L0050be:
	movem.l	d0-d3,-(sp)
	move.l	($0004,a6),d0
	jsr	(__FTOD)
	move.l	d0,d2
	move.l	d1,d3
	move.l	(a6),d0
	jsr	(__FTOD)
	jsr	(__DMOD)
	jsr	(L0009b0)
	movem.l	d0,(a6)
	movem.l	(sp)+,d0-d3
	rts

__FEVARG:
	move.l	#$49454545,d0		;'IEEE'
	move.l	#$534f4654,d1		;'SOFT'
	rts

L0050fc:
	move.l	a5,-(sp)
	DOS	_GETDATE
	move.l	d0,-(sp)
	DOS	_GETTIME
	add.w	(sp)+,d0
	add.w	(sp)+,d0
	movea.l	d0,a5
	bsr.w	__SRAND
	move.l	a5,d0
	bsr.w	__RANDOMIZE
	movea.l	(sp)+,a5
	moveq.l	#$ff,d0
	rts

L00511a:
	pea.l	(L005124,pc)
	DOS	_PRINT
	addq.l	#4,sp
	rts

L005124:
	.dc.b	$0d,$0a
	.dc.b	'浮動小数点演算パッケージ for X680x0 version 2.03',$0d,$0a
	.dc.b	'（ＩＥＥＥフォーマット）',$0d,$0a,$00,$00

	.data

L005174:
	.dc.w	$ffff
L005176:
	.dc.w	$ffff
L005178:
	.dc.l	$43686170,$756e69a5
	.dc.l	$92c38a4b,$9053926e
	.dc.l	$947489c1,$89ea8148

	.bss

L005190:
	.ds.b	110
L0051fe:
	.ds.b	220
L0052da:

	.end	Start
