;=============================================
;  Filename misc/db.x
;
;
;  Base address 000000
;  Exec address 000000
;  Text size    01168e byte(s)
;  Data size    000b78 byte(s)
;  Bss  size    00474e byte(s)
;  2935 Labels
;
;  Commandline dis  -h -k -m68000 -q1 -B -M -w16 -o120 -gmisc/db.lab --overwrite misc/db.x misc/db.s
;          DIS version 3.16
;=============================================

	.include	inc/doscall.mac
	.include	inc/iocscall.mac
	.include	inc/fefunc.mac

dtregi::	.equ	$00000056
adrg0::		.equ	$00000076
adrg1::		.equ	$0000007a
adrg2::		.equ	$0000007e
adrg3::		.equ	$00000082
adrg4::		.equ	$00000086
adrg5::		.equ	$0000008a
adrg6::		.equ	$0000008e
adrg7::		.equ	$00000092
arg1::		.equ	$00000002
arg2::		.equ	$00000006
arg3::		.equ	$0000000a
arg4::		.equ	$0000000e
arg5::		.equ	$00000012
arg6::		.equ	$00000016
arg7::		.equ	$0000001a
arg8::		.equ	$0000001e
argn::		.equ	$00000000
sprsp::		.equ	$000000a2
asmp::		.equ	$00000036
dumpp::		.equ	$0000002a
setp::		.equ	$0000002e
disap::		.equ	$00000032
bpbuf::		.equ	$000000a8
bpcnt::		.equ	$000000a6
bpcsv::		.equ	$0000004e
bpsts::		.equ	$00000052
gobrk::		.equ	$00000120
gobuf::		.equ	$00000124
combuf::	.equ	$0000046e
cursol::	.equ	$00000022
disaold::	.equ	$0000003a
dspflg::	.equ	$00000314
expflg::	.equ	$00000316
hibuf::		.equ	$00000182
intr7::		.equ	$0000007c
ivctsv::	.equ	$0000017e
linadr::	.equ	$0000003e
linbuf::	.equ	$0000059c
opbuf::		.equ	$0000012a
pcrg::		.equ	$00000096
pcsv::		.equ	$0000017a
ref::		.equ	$00000026
srgsv::		.equ	$00000042
sspsv::		.equ	$0000016a
sspsv2::	.equ	$0000016e
orgssp::	.equ	$00000172
size::		.equ	$00000312
stsrg::		.equ	$0000009e
trccnt::	.equ	$0000004a
trsv::		.equ	$00000176
tvnsv::		.equ	$00000046
usrsp::		.equ	$0000009a
width::		.equ	$0000044a
eamod::		.equ	$00000464
eaadr::		.equ	$00000468
easiz::		.equ	$00000466
zbuf::		.equ	$00000420
symidx::	.equ	$0000044c
symtop::	.equ	$00000450
symlen::	.equ	$00000454
lodadr::	.equ	$00000458
exeadr::	.equ	$00000460
lodsiz::	.equ	$0000045c
chkadrs::	.equ	$000006e6
ckadsiz::	.equ	$000006ea
ckaddir::	.equ	$000006ec
ckdtwok::	.equ	$000006ee
chkpuflg::	.equ	$000006e4
chkpbuf::	.equ	$000006e4
ptrflg::	.equ	$000006e2
doexitf::	.equ	$000006e0
consw::		.equ	$00000448
sx_info::	.equ	$000007cc
_68000::	.equ	$000007d0
_68881::	.equ	$000007d2
vcsvcnt::	.equ	$00000040
vcsvadr::	.equ	$00000008
msprg::		.equ	$000007d8
isprg::		.equ	$000007dc
sfcrg::		.equ	$000007e0
dfcrg::		.equ	$000007e4
cacrrg::	.equ	$000007e8
caarrg::	.equ	$000007ec
vbrrg::		.equ	$000007f0
fpregi::	.equ	$000009f0
fpcrrg::	.equ	$000007f4
fpsrrg::	.equ	$000007f8
fpiarg::	.equ	$000007fc
szarg::		.equ	$00000800
sclarg::	.equ	$00000802
bdflag::	.equ	$00000804
odflag::	.equ	$00000806
bdarg::		.equ	$00000808
odarg::		.equ	$0000080c
qdimm::		.equ	$00000940
sspsv3::	.equ	$00000810
vbrsv::		.equ	$00000814
cacrsv::	.equ	$00000818
sfcsv::		.equ	$0000081c
dfcsv::		.equ	$00000820
caarsv::	.equ	$00000824
mspsv::		.equ	$00000828
ispsv::		.equ	$0000082c
srsv2::		.equ	$00000830
fltofg::	.equ	$00000834
disxfg::	.equ	$00000836
fponfg::	.equ	$00000838
fxonfg::	.equ	$0000083a
qutbuf::	.equ	$00000960
farg1::		.equ	$00000980
farg2::		.equ	$00000990
farg3::		.equ	$000009a0
farg4::		.equ	$000009b0
flwork::	.equ	$000009c0
cnvbf1::	.equ	$0000083c
cnvbf2::	.equ	$000008bc
sspsv20::	.equ	$000007d4
sprsp20::	.equ	$00000b70
msprg20::	.equ	$00000b74
isprg20::	.equ	$00000b78
cacr20::	.equ	$00000b7c
trace_sr::	.equ	$00000b80
ntrace_sr::	.equ	$00000b82
cperr_sp::	.equ	$00000b84
cperr_vct::	.equ	$00000b88
msprintf::	.equ	$00000b8c
stepadr::	.equ	$00000b8e
gobrkchk::	.equ	$00000b92
stepcnt::	.equ	$00000b94
stepf::		.equ	$00000b98
commaflg::	.equ	$0000093e
srcwok::	.equ	$00000b9e
brcwok::	.equ	$00000b9a
unity::		.equ	$3fff0000

	.cpu	68000

	.text

startdb::
	DOS	_VERNUM
	cmp.l	#$3638020e,d0
	bcc	L000050
	pea.l	(L000012,pc)
	DOS	_PRINT
	DOS	_EXIT

L000012:
	.dc.b	'Incorrect Human68k version:‚±‚ÌHuman68k‚Å‚ÍŽg—p‚Å‚«‚Ü‚¹‚ñ.',$0d,$0a,$00,$00
L000050:
	move.l	a0,-(a7)
	lea.l	(work),a0
	move.w	#$05d1,d0
L00005c:
	clr.w	(a0)+
	dbra	d0,L00005c
	movea.l	(a7)+,a0
	lea.l	(stack),a7
	clr.l	-(a7)
	DOS	_SUPER
	addq.l	#4,a7
	lea.l	(work),a6
	move.l	d0,($0172,a6)
	andi.w	#$f8ff,sr
	clr.w	(L0129d8)
	jsr	(mpu_check)
	move.w	d0,(L0129d6)
	beq	L00009e
	jsr	(isFPCP)
	move.w	d0,(L0129d8)
L00009e:
	adda.l	#$00000010,a0
	suba.l	a0,a1
	move.l	a1,-(a7)
	move.l	a0,-(a7)
	DOS	_SETBLOCK
	addq.l	#8,a7
	DOS	_GETPDB
	move.l	d0,(monpdb)
	move.w	(trpdef),d0
	andi.l	#$0000000f,d0
	asl.l	#2,d0
	movea.l	d0,a0
	move.l	($0080,a0),($06dc,a6)
	move.l	#tproc,($0080,a0)
	move.w	sr,($0042,a6)
	move.l	a7,($016a,a6)
	lea.l	(work),a6
	movea.l	#$00000008,a0
	lea.l	($0318,a6),a1
	moveq.l	#$3f,d0			;'?'
L0000ee:
	move.l	(a0)+,(a1)+
	dbra	d0,L0000ee
	move.l	($0000007c).l,($017e,a6)
	bra	colds

L0000fe:
	.dc.b	$60,$00,$03,$7c
trpdef::
	.dc.w	$4e49
L000104:
	.dc.b	$4a,$79
	.dc.l	breakf
	.dc.b	$66,$0a,$13,$fc,$00,$0c,$00,$e8,$e0,$07,$4e,$73,$4e,$f9
	.dc.l	ibreak
L00011c:
	jmp	(inivset)

L000122:
	jmp	(inivset_20)

colds::
	lea.l	(work),a6
	movea.l	#stack,a7
	pea.l	(L000140,pc)
	tst.w	($07d0,a6)
	beq	L00011c
	bra	L000122

L000140:
	.dc.b	$4e,$b9
	.dc.l	bpclr
	.dc.b	$4e,$b9
	.dc.l	mtclr
	.dc.b	$23,$fc
	.dc.l	L000104
	.dc.b	$00,$00,$00,$7c,$7e,$63,$41,$ee,$01,$82,$20,$fc,$ff,$ff,$ff,$ff
	.dc.b	$51,$cf,$ff,$f8,$2d,$7c,$ff,$ff,$ff,$ff,$01,$20,$42,$ae,$01,$26
	.dc.b	$2d,$6e,$01,$72,$00,$92,$2d,$6e,$01,$72,$00,$a2,$2d,$7c
	.dc.l	stack1
	.dc.b	$00,$9a,$2d,$7c,$00,$00,$00,$00,$00,$9e,$3d,$7c,$00,$01,$00,$4a
	.dc.b	$3d,$7c,$ff,$ff,$04,$48,$2d,$7c,$00,$02,$00,$00,$07,$c8,$42,$6e
	.dc.b	$0b,$8c,$42,$ae,$0b,$8e,$42,$6e,$0b,$92,$42,$ae,$0b,$94,$42,$6e
	.dc.b	$0b,$98,$4a,$6e,$07,$d0,$67,$7c,$4e,$7a,$88,$03,$2d,$48,$07,$d8
	.dc.b	$2d,$7c
	.dc.l	msp_stack
	.dc.b	$08,$28,$4e,$7a,$88,$04,$2d,$48,$07,$dc,$4e,$7a,$80,$00,$2d,$48
	.dc.b	$07,$e0,$4e,$7a,$80,$01,$2d,$48,$07,$e4,$4e,$7a,$80,$02,$2d,$48
	.dc.b	$07,$e8,$4e,$7a,$88,$01,$2d,$48,$07,$f0,$4e,$7a,$88,$02,$2d,$48
	.dc.b	$07,$ec,$2d,$6e,$01,$72,$08,$2c,$4a,$6e,$07,$d2,$67,$30,$f2,$39
	.dc.b	$d0,$ff
	.dc.l	L012bf6
	.dc.b	$f2,$39,$9c,$00
	.dc.l	L0129fa
	.dc.b	$3d,$7c,$ff,$ff,$08,$34,$3d,$7c,$ff,$ff,$08,$36,$3d,$7c,$ff,$ff
	.dc.b	$08,$38,$3d,$7c,$ff,$ff,$08,$3a,$42,$6e,$0b,$80,$42,$6e,$0b,$82
	.dc.b	$42,$79
	.dc.l	breakf
	.dc.b	$42,$79
	.dc.l	nmiflg
	.dc.b	$42,$6e,$04,$4a,$4e,$b9
	.dc.l	L000b44
	.dc.b	$48,$79
	.dc.l	mainct
	.dc.b	$3f,$3c,$ff,$f1,$ff,$25,$5c,$8f,$20,$79
	.dc.l	monpdb
	.dc.b	$2a,$68,$00,$10,$52,$8d,$4e,$b9
	.dc.l	skpblk
	.dc.b	$4a,$00,$67,$14,$b0,$3c,$00,$2f,$67,$06,$b0,$3c,$00,$2d,$66,$08
	.dc.b	$4e,$b9
	.dc.l	L0002e0
	.dc.b	$60,$e2,$2f,$0d,$4e,$b9
	.dc.l	_SavMem
	.dc.b	$4e,$b9
	.dc.l	_CutMem
	.dc.b	$4e,$b9
	.dc.l	pspini
	.dc.b	$2a,$5f,$41,$f9
	.dc.l	begmes
	.dc.b	$4e,$b9
	.dc.l	print
	.dc.b	$4e,$b9
	.dc.l	L000e28
	.dc.b	$4e,$b9
	.dc.l	L000e40
	.dc.b	$4e,$b9
	.dc.l	L000e84
	.dc.b	$4a,$15,$67,$00,$01,$be,$20,$7c
	.dc.l	L0003dc
	.dc.b	$4e,$b9
	.dc.l	print
L0002cc:
	.dc.b	' MN¹'
L0002d0:
	.dc.l	print
	.dc.b	$4e,$b9
	.dc.l	newline
	.dc.b	$4e,$f9
	.dc.l	readfl
L0002e0:
	move.b	($0001,a5),d0
	move.l	a5,(L000334)
	jsr	(toupper)
	lea.l	(L000338),a0
L0002f6:
	tst.b	(a0)
	bmi	L00030c
	cmp.b	(a0),d0
	beq	L000302
	addq.l	#6,a0
	bra	L0002f6

L000302:
	addq.l	#2,a5
	movea.l	($0002,a0),a0
	jsr	(a0)
	rts

L00030c:
	lea.l	(L00034c),a0
	jsr	(print)
	movea.l	(L000334),a0
	jsr	(print)
	lea.l	(L000358),a0
	jsr	(print)
	clr.b	(a5)
	rts

L000334:
	.dc.l	$00000000
L000338:
	.dc.b	$52,$00
	.dc.l	L000b44
	.dc.b	$43,$00
	.dc.l	L000368
	.dc.b	$3f,$00
	.dc.l	L00035c
	.dc.b	$ff,$00
L00034c:
	.dc.b	'Error at ',$27,$00,$00
L000358:
	.dc.b	$27,$0d,$0a,$00
L00035c:
	jsr	(skpblk)
	st.b	($07ce,a6)
	rts

L000368:
	jsr	(skpblk)
	jsr	(L0003ac)
	bcs	L00030c
	addq.l	#1,a5
	move.l	d0,d1
L00037a:
	moveq.l	#$00,d0
	move.b	(a5)+,d0
	jsr	(L0003ac)
	bcs	L00038e
	mulu.w	#$000a,d1
	add.l	d0,d1
	bra	L00037a

L00038e:
	move.b	-(a5),d0
	and.w	#$00df,d0
	cmp.w	#$004b,d0		;'K'
	bne	L00039c
	addq.l	#1,a5
L00039c:
	and.l	#$0000ffff,d1
	asl.l	#8,d1
	asl.l	#2,d1
	move.l	d1,($07c8,a6)
	rts

L0003ac:
	andi.w	#$00ff,d0
	cmp.w	#$0030,d0		;'0'
	bcs	L0003c0
	cmp.w	#$003a,d0		;':'
	bcs	L0003c6
	bra.w	L0003c0

L0003c0:
	ori.b	#$01,ccr
	rts

L0003c6:
	sub.w	#$0030,d0
	bra	L0003d6

L0003cc:
	sub.w	#$0037,d0
	bra	L0003d6

L0003d2:
	sub.w	#$0057,d0
L0003d6:
	andi.b	#$fe,ccr
	rts

L0003dc:
	.dc.b	'loading ',$00
begmes::
	.dc.b	'X68k Debugger version 3.00 Copyright 1987-1993 SHARP/Hudson',$0d,$0a,$00
L000423:
	.dc.b	'program terminated normally',$0d,$0a,$00,$00
mainct::
	lea.l	(stack),a7
	DOS	_GETPDB
	cmp.l	(monpdb),d0
	beq	main
	DOS	_EXIT

mainex::
	.dc.b	$4f,$f9
	.dc.l	stack
	.dc.b	$4d,$f9
	.dc.l	work
	.dc.b	$4e,$b9
	.dc.l	resbp
	.dc.b	$4e,$b9
	.dc.l	pspini
	.dc.b	$42,$6e,$06,$e0,$20,$7c
	.dc.l	L000423
	.dc.b	$4e,$b9
	.dc.l	print
main::
	.dc.b	$4d,$f9
	.dc.l	work
	.dc.b	$42,$79
	.dc.l	nmiflg
	.dc.b	$42,$79
	.dc.l	breakf
	.dc.b	$42,$6e,$06,$e2,$42,$6e,$0b,$80,$42,$6e,$0b,$82,$2e,$7c
	.dc.l	stack
	.dc.b	$4a,$6e,$07,$d0,$67,$14,$41,$f9
	.dc.l	msp_stack
	.dc.b	$4e,$7b,$88,$03,$20,$7c,$00,$00,$08,$08,$4e,$7b,$80,$02,$2c,$7c
	.dc.l	work
	.dc.b	$02,$7c,$f8,$ff,$4e,$b9
	.dc.l	inpcom
	.dc.b	$4e,$b9
	.dc.l	L000616
	.dc.b	$60,$aa
pspini::
	move.l	#$00ffffff,-(a7)
	DOS	_MALLOC
	move.l	(a7)+,d1
	and.l	#$00ffffff,d0
	move.l	d0,-(a7)
	DOS	_MALLOC
	move.l	(a7)+,d1
	tst.l	d0
	bmi	L000516
	move.l	d0,-(a7)
	DOS	_PSPSET
	addq.l	#4,a7
	pea.l	(mainex)
	move.w	#$fff0,-(a7)
	DOS	_INTVCS
	addq.l	#6,a7
	move.l	(monpdb),-(a7)
	DOS	_SETPDB
	addq.l	#4,a7
	move.l	d0,(usrpdb)
	move.l	d0,(child)
L000516:
	movea.l	#work,a6
	move.l	(usrpdb),d0
	add.l	#$000000f0,d0
	move.l	d0,($0458,a6)
	move.l	d0,($0460,a6)
	clr.l	($045c,a6)
	move.l	d0,($002a,a6)
	move.l	d0,($002e,a6)
	move.l	d0,($0032,a6)
	move.l	d0,($0036,a6)
	move.l	d0,($0096,a6)
	move.l	($0172,a6),($0092,a6)
	move.l	#stack1,($009a,a6)
	clr.l	($009e,a6)
	rts

L00055c:
	.dc.b	$00,$41
	.dc.l	assembl
	.dc.b	$00,$44
	.dc.l	dump
	.dc.b	$00,$46
	.dc.l	L000b78
	.dc.b	$00,$47
	.dc.l	jumpcom
	.dc.b	$00,$48
	.dc.l	help
	.dc.b	$00,$4c
	.dc.l	disasm
	.dc.b	$00,$42
	.dc.l	breaks
	.dc.b	$00,$52
	.dc.l	readfl
	.dc.b	$00,$57
	.dc.l	writef
	.dc.b	$00,$54
	.dc.l	trace
	.dc.b	$00,$55
	.dc.l	untrace
	.dc.b	$00,$58
	.dc.l	regiset
	.dc.b	$00,$3f
	.dc.l	L000ad2
	.dc.b	$00,$5a
	.dc.l	L000a28
	.dc.b	$00,$56
	.dc.l	L000b44
	.dc.b	$00,$59
	.dc.l	L000d02
	.dc.b	$00,$5c
	.dc.l	L000d6e
	.dc.b	$00,$53
	.dc.l	step
	.dc.b	$00,$4f
	.dc.l	L000a20
	.dc.b	$00,$3e
	.dc.l	rd_out
	.dc.b	$00,$3c
	.dc.l	rd_in
	.dc.b	$00,$4e
	.dc.l	stmadrs
	.dc.b	$00,$51
	.dc.l	quit
	.dc.b	$00,$50
	.dc.l	L000818
	.dc.b	$00,$43
	.dc.l	L0007ec
	.dc.b	$00,$21
	.dc.l	shell
	.dc.b	$ff,$00,$ff,$ff,$ff,$ff
L0005fe:
	.dc.b	$00,$4d
	.dc.l	cmove
	.dc.b	$00,$45
	.dc.l	set
	.dc.b	$00,$53
	.dc.l	search
	.dc.b	$ff,$00,$ff,$ff,$ff,$ff
L000616:
	lea.l	($046e,a6),a5
L00061a:
	jsr	(skpblk)
	tst.b	d0
	beq	L00065a
	cmpi.b	#$3a,d0			;':'
	bne	L00062e
	addq.l	#1,a5
	bra	L00061a

L00062e:
	move.l	a5,($003e,a6)
	addq.l	#1,a5
	jsr	(L0006ae)
	bcs	comerr
	jsr	(L0006e6)
	move.l	a5,($003e,a6)
	jsr	(skpblk)
	tst.b	d0
	beq	L00065a
	cmpi.b	#$3a,d0			;':'
	bne	comerr
	addq.l	#1,a5
	bra	L00061a

L00065a:
	rts

comerr::
	movea.l	#L00068c,a0
	jsr	(print)
	movea.l	($003e,a6),a0
	jsr	(print)
	jsr	(newline)
	bra	main

badpar::
	lea.l	(L00069d),a0
	jsr	(print)
	bra	main

L00068c:
	.dc.b	'Command error.',$0d,$0a,$00
L00069d:
	.dc.b	'Bad parameter.',$0d,$0a,$00
L0006ae:
	jsr	(toupper)
	cmp.b	#$4d,d0			;'M'
	bne	L0006ca
	move.b	(a5)+,d0
	jsr	(toupper)
	movea.l	#L0005fe,a0
	bra	L0006d0

L0006ca:
	movea.l	#L00055c,a0
L0006d0:
	tst.b	(a0)+
	beq	L0006da
	ori.b	#$01,ccr
	rts

L0006da:
	cmp.b	(a0)+,d0
	beq	L0006e2
	addq.l	#4,a0
	bra	L0006d0

L0006e2:
	movea.l	(a0),a4
	rts

L0006e6:
	jsr	(a4)
	rts

getarg::
	clr.w	(comnum)
	clr.w	(nullflg)
	move.w	#$0001,($093c,a6)
	jsr	(skpblk)
	clr.w	($0000.w,a6)
	pea.l	($0002,a6)
L00070a:
	move.l	d0,-(a7)
	move.w	($093c,a6),d0
	lsl.w	#1,d0
	move.w	d0,($093c,a6)
	move.l	(a7)+,d0
	move.b	(a5),d0
	cmp.b	#$2c,d0			;','
	beq	L00074c
	cmpi.w	#$0001,($0000.w,a6)
	bne	L000760
	jsr	(toupper)
	cmp.b	#$4c,d0			;'L'
	bne	L000760
	addq.l	#1,a5
	jsr	(getexp)
	bcs	garg9
	jsr	(L0007d4)
	add.l	($0002,a6),d6
	subq.l	#1,d6
	bra	L00076e

L00074c:
	move.l	d0,-(a7)
	move.w	($093c,a6),d0
	or.w	d0,(nullflg)
	move.l	(a7)+,d0
	movea.l	(a7),a0
	move.l	(a0),d6
	bra	L00076e

L000760:
	jsr	(getexp)
	bcs	garg9
	jsr	(L0007d4)
L00076e:
	addq.w	#1,($0000.w,a6)
	cmpi.w	#$0001,($0000.w,a6)
	bne	L000788
	tst.w	($06e2,a6)
	beq	L000788
	move.l	a2,-(a7)
	movea.l	d6,a2
	move.l	(a2),d6
	movea.l	(a7)+,a2
L000788:
	movea.l	(a7),a0
	move.l	d6,(a0)+
	move.l	a0,(a7)
	cmpi.w	#$0008,($0000.w,a6)
	bcc	garg9
	cmpi.b	#$2c,d0			;','
	beq	L0007c2
	cmp.b	#$20,d0			;' '
	bne	garg9
	jsr	(skpblk)
	bra	L00070a

garg9::
	jsr	(skpblk)
	tst.b	d0
	beq	L0007be
	cmp.b	#$3a,d0			;':'
	bne	badpar
L0007be:
	addq.l	#4,a7
	rts

L0007c2:
	addq.l	#1,a5
	addq.w	#1,(comnum)
	jsr	(skpblk)
	bra	L00070a

L0007d4:
	move.b	(a5),d0
	cmp.b	#$20,d0			;' '
	bne	L0007ea
	jsr	(skpblk)
	cmp.b	#$2c,d0			;','
	beq	L0007ea
	move.b	-(a5),d0
L0007ea:
	rts

L0007ec:
	lea.l	(cmlnsb),a0
	bra	L0007fa

comset::
	lea.l	(comlin),a0
L0007fa:
	movea.l	a0,a1
	clr.b	(a0)+
	jsr	(skpblk)
	tst.b	d0
	beq	L000814
L000808:
	addq.b	#1,(a1)
	move.b	(a5)+,d0
	move.b	d0,(a0)+
	bne	L000808
	subq.l	#1,a5
	subq.b	#1,(a1)
L000814:
	clr.b	(a0)
	rts

L000818:
	move.b	(a5),d0
	beq	L00082e
	jsr	(toupper)
	cmp.b	#$53,d0			;'S'
	beq	L0008dc
	bra	comerr

L00082e:
	bsr	L000e40
	bsr	L000e84
	lea.l	(L000998),a0
	jsr	(print)
	move.l	(monpdb),d1
	add.l	#$000000f0,d1
	jsr	(putlhex)
	jsr	(newline)
	lea.l	(L0009ad),a0
	jsr	(print)
	move.l	(usrpdb),d1
	add.l	#$000000f0,d1
	jsr	(putlhex)
	jsr	(newline)
	move.l	($045c,a6),d1
	beq	L0008bc
	add.l	($0458,a6),d1
	lea.l	(L0009c2),a0
	jsr	(print)
	jsr	(putlhex)
	jsr	(newline)
	lea.l	(L0009d7),a0
	move.l	($0460,a6),d1
	jsr	(print)
	jsr	(putlhex)
	jsr	(newline)
L0008bc:
	move.l	($0450,a6),d1
	beq	L0008da
	lea.l	(L0009ec),a0
	jsr	(print)
	jsr	(putlhex)
	jsr	(newline)
L0008da:
	rts

L0008dc:
	addq.l	#1,a5
	move.l	($044c,a6),d1
	beq	L00098a
	movea.l	d1,a1
	jsr	(skpblk)
	lea.l	(tmpbuf),a0
L0008f4:
	move.b	(a5)+,d0
	beq	L000902
	cmp.b	#$3a,d0			;':'
	beq	L000902
	move.b	d0,(a0)+
	bra	L0008f4

L000902:
	clr.b	(a0)
	subq.l	#1,a5
	clr.w	($001e,a6)
	bra	L000948

L00090c:
	movea.l	(a1)+,a0
	move.l	($0002,a0),d1
	lea.l	($0006,a0),a0
	jsr	(L00096e)
	bcs	L000948
	addq.w	#1,($001e,a6)
	move.b	#$24,d0			;'$'
	jsr	(putch)
	jsr	(putlhex)
	move.b	#$3a,d0			;':'
	jsr	(putch)
	jsr	(print)
	jsr	(newline)
L000948:
	tst.l	(a1)
	beq	L00096c
	cmpi.w	#$0017,($001e,a6)
	bcs	L00090c
	clr.w	($001e,a6)
	lea.l	(cntmes),a0
	jsr	(print)
	jsr	(yesno)
	bra	L00090c

L00096c:
	rts

L00096e:
	movea.l	a0,a2
	lea.l	(tmpbuf),a3
L000976:
	move.b	(a3)+,d0
	beq	L000984
	cmp.b	(a2)+,d0
	beq	L000976
	ori.b	#$01,ccr
	rts

L000984:
	andi.b	#$fe,ccr
	rts

L00098a:
	lea.l	(L000a01),a0
	jsr	(print)
	rts

L000998:
	.dc.b	'debug program from $',$00
L0009ad:
	.dc.b	'user  program from $',$00
L0009c2:
	.dc.b	'              end  $',$00
L0009d7:
	.dc.b	'              exec $',$00
L0009ec:
	.dc.b	'symbol table  from $',$00
L000a01:
	.dc.b	'No symbol table',$0d,$0a,$00
cntmes::
	.dc.b	'-- More -- ',$00,$00
L000a20:
	eori.w	#$ffff,($044a,a6)
	rts

L000a28:
	move.b	(a5),d0
	beq	L000a40
	cmp.b	#$3a,d0			;':'
	beq	L000a40
	cmp.b	#$30,d0			;'0'
	bcs	L000a3e
	cmp.b	#$39,d0			;'9'
	bls	L000a98
L000a3e:
	rts

L000a40:
	lea.l	($0420,a6),a1
	moveq.l	#$30,d2			;'0'
L000a46:
	moveq.l	#$5a,d0			;'Z'
	jsr	(putch)
	move.b	d2,d0
	jsr	(putch)
	moveq.l	#$3a,d0			;':'
	jsr	(putch)
	move.l	(a1)+,d1
	jsr	(putlhex)
	move.l	d1,d0
	jsr	(valsch)
	tst.l	d0
	bmi	L000a88
	movea.l	d0,a0
	jsr	(puttab)
	moveq.l	#$2e,d0			;'.'
	jsr	(putch)
	jsr	(print)
L000a88:
	jsr	(newline)
	addq.b	#1,d2
	cmp.b	#$39,d2			;'9'
	bls	L000a46
	rts

L000a98:
	addq.l	#1,a5
	cmpi.b	#$3d,(a5)		;'='
	bne	comerr
	addq.l	#1,a5
	jsr	(skpblk)
	tst.w	d0
	beq	comerr
	clr.l	d2
	move.b	(-$0002,a5),d2
	sub.w	#$0030,d2
	lsl.l	#2,d2
	lea.l	($0420,a6),a1
	lea.l	(a1,d2.w),a1
	jsr	(getexp)
	bcs	badpar
	move.l	d6,(a1)
	rts

L000ad2:
	move.w	#$0002,($0312,a6)
	jsr	(skpblk)
	cmpi.b	#$3f,d0			;'?'
	bne	L000aec
	move.w	#$0001,($0312,a6)
	bra	L000afc

L000aec:
	jsr	(toupper)
	cmpi.b	#$50,d0			;'P'
	bne	L000afe
	clr.w	($0312,a6)
L000afc:
	addq.l	#1,a5
L000afe:
	tst.b	(a5)
	beq	badpar
	jsr	(getexp)
	cmpi.w	#$0001,($0312,a6)
	bhi	L000b2a
	beq	L000b20
	move.w	d6,d0
	jsr	(putch)
	bra	newline

L000b20:
	jsr	(putint)
	bra	newline

L000b2a:
	move.l	d6,d1
	jsr	(putlhex)
	bra	newline

undef::
	lea.l	(L000b40),a0
	bra	print

L000b40:
	.dc.b	'?',$0d,$0a,$00
L000b44:
	eori.w	#$ffff,($0448,a6)
	lea.l	(L000b6e),a1
L000b50:
	move.l	(a1)+,d0
	beq	L000b5e
	movea.l	d0,a0
	move.w	(a0),d0
	move.w	(a1),(a0)
	move.w	d0,(a1)+
	bra	L000b50

L000b5e:
	move.w	($0448,a6),d0
	and.w	#$0001,d0
	jsr	(conioset)
	rts

L000b6e:
	.dc.l	newline
	.dc.b	$4e,$71,$00,$00,$00,$00
L000b78:
	move.w	#$0001,($0312,a6)
	jsr	(skpblk)
	jsr	(toupper)
	cmpi.b	#$4c,d0			;'L'
	bne	L000b98
	move.w	#$0002,($0312,a6)
	bra	L000ba8

L000b98:
	cmpi.b	#$57,d0			;'W'
	beq	L000ba8
	cmpi.b	#$53,d0			;'S'
	bne	L000baa
	clr.w	($0312,a6)
L000ba8:
	addq.l	#1,a5
L000baa:
	move.l	($0096,a6),($0002,a6)
	jsr	(getarg)
	cmpi.w	#$0003,($0000.w,a6)
	bne	comerr
	move.l	($0006,a6),d7
	cmp.l	($0002,a6),d7
	bls	comerr
	move.l	($0002,a6),d6
	tst.w	($0312,a6)
	beq	L000be2
	btst.l	#$00,d6
	bne	comerr
	bclr.l	#$00,d7
L000be2:
	move.l	($000a,a6),d5
	movea.l	d6,a0
	cmpi.w	#$0001,($0312,a6)
	bhi	L000c02
	beq	L000bfa
L000bf2:
	move.b	d5,(a0)+
	cmpa.l	d7,a0
	bls	L000bf2
	rts

L000bfa:
	move.w	d5,(a0)+
	cmpa.l	d7,a0
	bls	L000bfa
	rts

L000c02:
	move.l	d5,(a0)+
	cmpa.l	d7,a0
	bls	L000c02
	rts

cmove::
	move.w	#$0001,($0312,a6)
	jsr	(skpblk)
	jsr	(toupper)
	cmpi.b	#$4c,d0			;'L'
	bne	L000c2a
	move.w	#$0002,($0312,a6)
	bra	L000c3a

L000c2a:
	cmpi.b	#$57,d0			;'W'
	beq	L000c3a
	cmpi.b	#$53,d0			;'S'
	bne	L000c3c
	clr.w	($0312,a6)
L000c3a:
	addq.l	#1,a5
L000c3c:
	move.l	($0096,a6),($0002,a6)
	jsr	(getarg)
	cmpi.w	#$0003,($0000.w,a6)
	bne	badpar
	move.l	($0006,a6),d7
	cmp.l	($0002,a6),d7
	bls	badpar
	move.l	($0002,a6),d6
	move.l	($000a,a6),d5
	tst.w	($0312,a6)
	beq	L000c84
	btst.l	#$00,d7
	beq	badpar
	btst.l	#$00,d6
	bne	badpar
	btst.l	#$00,d5
	bne	badpar
L000c84:
	move.l	d7,d0
	sub.l	d6,d0
	cmp.l	d6,d5
	bcc	L000cc2
	movea.l	d6,a0
	movea.l	d5,a1
	cmpi.w	#$0001,($0312,a6)
	bcc	L000caa
	swap.w	d0
L000c9a:
	swap.w	d0
L000c9c:
	move.b	(a0)+,(a1)+
	dbra	d0,L000c9c
	swap.w	d0
	dbra	d0,L000c9a
	rts

L000caa:
	addq.l	#1,d0
	lsr.l	#1,d0
	subq.l	#1,d0
	swap.w	d0
L000cb2:
	swap.w	d0
L000cb4:
	move.w	(a0)+,(a1)+
	dbra	d0,L000cb4
	swap.w	d0
	dbra	d0,L000cb2
	rts

L000cc2:
	movea.l	d7,a0
	movea.l	d5,a1
	adda.l	d0,a1
	cmpi.w	#$0001,($0312,a6)
	bcc	L000ce6
	addq.l	#1,a0
	addq.l	#1,a1
	swap.w	d0
L000cd6:
	swap.w	d0
L000cd8:
	move.b	-(a0),-(a1)
	dbra	d0,L000cd8
	swap.w	d0
	dbra	d0,L000cd6
	rts

L000ce6:
	addq.l	#1,a0
	addq.l	#1,a1
	addq.l	#1,d0
	lsr.l	#1,d0
	subq.l	#1,d0
	swap.w	d0
L000cf2:
	swap.w	d0
L000cf4:
	move.w	-(a0),-(a1)
	dbra	d0,L000cf4
	swap.w	d0
	dbra	d0,L000cf2
	rts

L000d02:
	cmpi.b	#$2f,(a5)		;'/'
	bne	comerr
	move.b	($0001,a5),d0
	jsr	(toupper)
	cmp.b	#$4e,d0			;'N'
	bne	comerr
	addq.l	#2,a5
	jsr	(newline)
yesno::
	movea.l	#L000d5c,a0
	jsr	(print)
L000d30:
	jsr	(getch)
	jsr	(toupper)
	cmpi.b	#$4e,d0			;'N'
	bne	newline
	jsr	(newline)
	bra	main

yesno_::
	movea.l	#L000d64,a0
	jsr	(print)
	bra	L000d30

L000d5c:
	.dc.b	'Y/N ? ',$00,$00
L000d64:
	.dc.b	'(y/n) ? ',$00,$00
L000d6e:
	lea.l	($046e,a6),a5
	rts

quit::
	.dc.b	$20,$7c,$00,$00,$00,$08,$43,$ee,$03,$18,$70,$3f,$20,$d9,$51,$c8
	.dc.b	$ff,$fc,$23,$ee,$01,$7e,$00,$00,$00,$7c,$30,$39
	.dc.l	trpdef
	.dc.b	$02,$80,$00,$00,$00,$0f,$e5,$80,$20,$40,$21,$6e,$06,$dc,$00,$80
	.dc.b	$4a,$79
	.dc.l	L0129d6
L000daa:
	.dc.b	'g* |',$00,$00
L000db0:
	.dc.b	$08,$08,$4e,$7b,$80,$02,$20,$6e,$07,$e0,$4e,$7b,$80,$00,$20,$6e
	.dc.b	$07,$e4,$4e,$7b,$80,$01,$20,$6e,$07,$e8,$4e,$7b,$80,$02,$20,$6e
	.dc.b	$07,$ec,$4e,$7b,$88,$02,$2f,$39
	.dc.l	monpdb
	.dc.b	$ff,$80,$42,$57,$ff,$4c
_SavMem::
	move.l	($07c8,a6),-(a7)
	DOS	_MALLOC
	move.l	(a7)+,d1
	tst.l	d0
	bmi	L000df4
	move.l	d0,($07c4,a6)
	rts

L000df4:
	clr.l	($07c4,a6)
	clr.l	($07c8,a6)
	rts

_CutMem::
	move.l	($07c4,a6),d0
	beq	L000e10
	move.l	($07c8,a6),-(a7)
	move.l	d0,-(a7)
	DOS	_SETBLOCK
	addq.l	#8,a7
	rts

L000e10:
	moveq.l	#$ff,d0
	rts

_PasMem::
	move.l	($07c4,a6),d0
	beq	L000e10
	move.l	#$00000100,-(a7)
	move.l	d0,-(a7)
	DOS	_SETBLOCK
	addq.l	#8,a7
	rts

L000e28:
	tst.w	($07ce,a6)
	beq	L000e3a
	lea.l	(L01168e),a0
	jsr	(print)
L000e3a:
	rts

L000e3c:
	moveq.l	#$ff,d0
	rts

L000e40:
	lea.l	(L0116e5),a0
	jsr	(print)
	tst.w	($07d0,a6)
	bne	L000e60
	lea.l	(L0116fb),a0
	jsr	(print)
	rts

L000e60:
	jsr	(isPMMU)
	bne	L000e76
	lea.l	(L01172a),a0
	jsr	(print)
	rts

L000e76:
	lea.l	(L011709),a0
	jsr	(print)
	rts

L000e84:
	lea.l	(L01173a),a0
	jsr	(print)
	tst.w	($07d2,a6)
	bne	L000ea4
	lea.l	(L011759),a0
	jsr	(print)
	rts

L000ea4:
	lea.l	(L01176f),a0
	jsr	(print)
	rts

assembl::
	clr.w	($001e,a6)
	cmpi.b	#$4e,(a5)		;'N'
	beq	L000ec2
	cmpi.b	#$6e,(a5)		;'n'
	bne	L000ec8
L000ec2:
	addq.l	#1,a5
	st.b	($001e,a6)
L000ec8:
	jsr	(getexp)
	bcc	L000eea
	jsr	(skpblk)
	tst.b	d0
	beq	L000ee6
	cmpi.b	#$3a,d0			;':'
	beq	L000ee6
	jmp	(comerr)

L000ee6:
	move.l	($0036,a6),d6
L000eea:
	move.l	a5,($003e,a6)
	bclr.l	#$00,d6
	move.l	d6,($0036,a6)
L000ef6:
	tst.w	($001e,a6)
	bne	L000f06
	movea.l	($0036,a6),a5
	bsr	dissub
	bra	L000f0c

L000f06:
	move.l	a5,d1
	bsr	putlhex
L000f0c:
	clr.w	d1
	lea.l	($059c,a6),a0
L000f12:
	addq.b	#1,d1
	tst.b	(a0)+
	bne	L000f12
	subq.b	#1,d1
	move.b	d1,($059b,a6)
	movea.l	a5,a4
	tst.w	($001e,a6)
	bne	L000f2c
	jsr	(puttab)
L000f2c:
	jsr	(puttab)
	jsr	(inplin)
	move.b	(a0),d0
	bne	L000f42
	move.l	a4,($0036,a6)
	bra	L000ef6

L000f42:
	cmpi.b	#$2e,d0			;'.'
	beq	L000f4e
	cmpi.b	#$3a,d0			;':'
	bne	L000f54
L000f4e:
	movea.l	($003e,a6),a5
	rts

L000f54:
	movea.l	a0,a5
	jsr	(skpblk)
	bsr	asmsub
	bra	L000ef6

asmsub::
	move.l	a7,($016a,a6)
	lea.l	($012a,a6),a0
	moveq.l	#$0f,d0
L000f6a:
	clr.l	(a0)+
	dbra	d0,L000f6a
	lea.l	($012a,a6),a0
	movea.l	a0,a4
	addq.l	#2,a4
	clr.w	($0834,a6)
	bsr	L001124
	lea.l	(L000fba),a0
	lsl.w	#2,d7
	movea.l	(a0,d7.w),a1
	jsr	(a1)
	move.l	a4,d0
	lea.l	($012a,a6),a0
	sub.l	a0,d0
	lsr.w	#1,d0
	beq	L001102
	cmpi.w	#$001e,d0
	bhi	L001102
	subq.w	#1,d0
	lea.l	($012a,a6),a0
	movea.l	($0036,a6),a1
L000fae:
	move.w	(a0)+,(a1)+
	dbra	d0,L000fae
	move.l	a1,($0036,a6)
	rts

L000fba:
	.dc.l	L002222
	.dc.l	L0022f8
	.dc.l	L002444
	.dc.l	L00246c
	.dc.l	L00248c
	.dc.l	L0024c2
	.dc.l	L002500
	.dc.l	L00253a
	.dc.l	L00259e
	.dc.l	L0025e4
	.dc.l	L002630
	.dc.l	L0026f4
	.dc.l	L002724
	.dc.l	L002740
	.dc.l	L00276e
	.dc.l	L00278c
	.dc.l	L0027e2
	.dc.l	L0027f6
	.dc.l	L002804
	.dc.l	L00281e
	.dc.l	L002864
	.dc.l	L00288a
	.dc.l	L00289e
	.dc.l	L0028d2
	.dc.l	L0028e2
	.dc.l	L00292a
	.dc.l	L00295a
	.dc.l	L0029b6
	.dc.l	L0029c6
	.dc.l	L0029f4
	.dc.l	L002a00
	.dc.l	L002a8c
	.dc.l	L002abe
	.dc.l	L002ad2
	.dc.l	L002b24
	.dc.l	L002b38
	.dc.l	L002b58
	.dc.l	L002b68
	.dc.l	L002b98
	.dc.l	L002ba4
	.dc.l	L002bba
	.dc.l	L002c82
	.dc.l	L002ce0
	.dc.l	L002d86
	.dc.l	L002dc2
	.dc.l	L002dd0
	.dc.l	L002e0a
	.dc.l	L002e4e
	.dc.l	L002e86
	.dc.l	L002f8e
	.dc.l	L002fd6
	.dc.l	L0030de
	.dc.l	L0032bc
	.dc.l	L003364
	.dc.l	L003412
	.dc.l	L003458
	.dc.l	L0036ac
	.dc.l	L0036c4
	.dc.l	L003712
	.dc.l	L003760
	.dc.l	L0037aa
	.dc.l	L0037be
	.dc.l	L0037ee
	.dc.l	L003abc
	.dc.l	L003c8c
	.dc.l	L003d62
	.dc.l	L003d72
	.dc.l	L003e48
	.dc.l	L003e5a
	.dc.l	L003ed4
	.dc.l	L003fb6
	.dc.l	L004018
	.dc.l	L004030
	.dc.l	L00407e
	.dc.l	L0040c8
	.dc.l	L004110
	.dc.l	L004140
	.dc.l	L004170
	.dc.l	L004170
	.dc.l	L004170
	.dc.l	L005abe
	.dc.l	L003940
L001102:
	lea.l	($059c,a6),a0
	movea.l	a0,a1
	move.b	#$3f,(a1)+		;'?'
	move.b	#$3f,(a1)+		;'?'
	clr.b	(a1)+
	jsr	(print)
	jsr	(newline)
	movea.l	($016a,a6),a7
	rts

L001124:
	lea.l	(L004172),a1
	lea.l	(L005a8b),a2
L001130:
	movea.l	a5,a0
L001132:
	tst.b	(a1)
	beq	L00114e
	move.b	(a0)+,d0
	jsr	(toupper)
	cmp.b	(a1)+,d0
	beq	L001132
L001142:
	tst.b	(a1)+
	bne	L001142
	addq.l	#3,a1
	cmpa.l	a1,a2
	bls	L001102
	bra	L001130

L00114e:
	clr.w	d5
	clr.w	($0800,a6)
	cmpi.b	#$2e,(a0)+		;'.'
	beq	L001162
	cmpi.b	#$20,-(a0)		;' '
	bhi	L001142
	bra	L0011d0

L001162:
	addq.w	#1,d5
	move.b	(a0),d0
	jsr	(toupper)
	cmpi.b	#$42,d0			;'B'
	beq	L0011c6
	move.b	($0001,a1),d0
	cmpi.b	#$1e,d0
	bne	L001182
	cmpi.b	#$53,d0			;'S'
	beq	L0011c6
L001182:
	move.b	(a0),d0
	jsr	(toupper)
	addq.w	#1,d5
	cmpi.b	#$57,d0			;'W'
	beq	L0011c6
	addq.w	#1,d5
	cmpi.b	#$4c,d0			;'L'
	beq	L0011c6
	addq.w	#1,d5
	cmpi.b	#$51,d0			;'Q'
	beq	L0011c6
	addq.w	#1,d5
	cmpi.b	#$53,d0			;'S'
	beq	L0011c6
	addq.w	#1,d5
	cmpi.b	#$44,d0			;'D'
	beq	L0011c6
	addq.w	#1,d5
	cmpi.b	#$58,d0			;'X'
	beq	L0011c6
	addq.w	#1,d5
	cmpi.b	#$50,d0			;'P'
	beq	L0011c6
	bne	L001102
L0011c6:
	addq.l	#1,a0
	cmpi.b	#$20,(a0)		;' '
	bhi	L001102
L0011d0:
	clr.w	d7
	addq.l	#1,a1
	move.b	(a1)+,d7
	move.b	(a1)+,d6
	lsl.w	#8,d6
	move.b	(a1)+,d6
	move.w	d6,($012a,a6)
	movea.l	a0,a5
	move.w	d5,($0800,a6)
	jsr	(skpblk)
	rts

L0011ee:
	lea.l	(L00123c),a0
	movem.l	d2-d3,-(a7)
	moveq.l	#$11,d0
	moveq.l	#$01,d3
L0011fc:
	movea.l	a5,a1
L0011fe:
	tst.b	(a0)
	beq	L001234
	movem.l	d0-d1,-(a7)
	move.b	(a0)+,d0
	jsr	(toupper)
	move.b	d0,d1
	move.b	(a1)+,d0
	jsr	(toupper)
	cmp.b	d1,d0
	movem.l	(a7)+,d0-d1
	beq	L0011fe
L001220:
	tst.b	(a0)+
	bne	L001220
	addq.w	#1,d3
	dbra	d0,L0011fc
	ori.b	#$01,ccr
	movem.l	(a7)+,d2-d3
	rts

L001234:
	addq.l	#8,a7
	movea.l	a1,a5
	moveq.l	#$14,d2
	rts

L00123c:
	.dc.b	'CCR',$00
L001240:
	.dc.b	$53,$52,$00,$55,$53,$50,$00,$53,$46,$43,$00,$44,$46,$43,$00,$43
	.dc.b	$41,$43,$52,$00,$56,$42,$52,$00,$43,$41,$41,$52,$00,$4d,$53,$50
	.dc.b	$00,$49,$53,$50,$00,$54,$43,$00,$49,$54,$54,$30,$00,$49,$54,$54
	.dc.b	$31,$00,$44,$54,$54,$30,$00,$44,$54,$54,$31,$00,$4d,$4d,$55,$53
	.dc.b	$52,$00,$55,$52,$50,$00,$53,$52,$50,$00
L00128a:
	jsr	(L001c3c)
L001290:
	clr.w	d4
	clr.w	($0802,a6)
	clr.w	($0804,a6)
	clr.w	($0806,a6)
	jsr	(skpblk)
	bsr	L0011ee
	bcs	L0012ac
	rts

L0012ac:
	move.b	(a5),d0
	jsr	(toupper)
	cmpi.b	#$41,d0			;'A'
	beq	L0018e0
	cmpi.b	#$53,d0			;'S'
	beq	L0018e0
	cmpi.b	#$44,d0			;'D'
	beq	L0018d4
	cmpi.b	#$28,d0			;'('
	beq	L001424
	cmpi.b	#$2d,d0			;'-'
	bne	L0012e4
	cmpi.b	#$28,($0001,a5)		;'('
	beq	L0018e6
L0012e4:
	cmpi.b	#$23,(a5)		;'#'
	beq	L001934
L0012ec:
	movem.l	d2-d7,-(a7)
	jsr	(getexp2)
	bcs	L001102
	movem.l	(a7)+,d2-d7
	bsr	L0014d6
	jsr	(skpblk)
	cmpi.b	#$28,d0			;'('
	bne	L00188a
	addq.l	#1,a5
	jsr	(skpblk)
	move.b	(a5),d0
	jsr	(toupper)
	cmpi.b	#$50,d0			;'P'
	bne	L001338
	move.b	($0001,a5),d0
	jsr	(toupper)
	cmpi.b	#$43,d0			;'C'
	beq	L001514
L001338:
	move.b	(a5),d0
	jsr	(toupper)
	cmpi.b	#$41,d0			;'A'
	beq	L00134e
	cmpi.b	#$53,d0			;'S'
	bne	L001102
L00134e:
	bsr	L001b28
	jsr	(skpblk)
	cmpi.b	#$29,d0			;')'
	beq	L00141e
	cmpi.b	#$2c,d0			;','
	bne	L001102
L001368:
	addq.l	#1,a5
L00136a:
	jsr	(skpblk)
	move.w	d3,-(a7)
	jsr	(toupper)
	cmpi.b	#$41,d0			;'A'
	beq	L001412
	cmpi.b	#$53,d0			;'S'
	beq	L001412
	bsr	L001afa
L00138c:
	cmpi.b	#$2e,(a5)		;'.'
	bne	L0013b8
	addq.l	#1,a5
	move.b	(a5)+,d0
	jsr	(toupper)
	cmpi.b	#$57,d0			;'W'
	beq	L0013b8
	move.b	(-$0001,a5),d0
	jsr	(toupper)
	cmpi.b	#$4c,d0			;'L'
	bne	L001102
	bset.l	#$08,d4
L0013b8:
	or.w	d3,d4
	jsr	(skpblk)
	cmpi.b	#$2a,d0			;'*'
	bne	L0013fe
	addq.l	#1,a5
	jsr	(skpblk2)
	cmpi.b	#$31,d0			;'1'
	beq	L0013fe
	cmpi.b	#$32,d0			;'2'
	bne	L0013e2
	move.w	#$0001,($0802,a6)
	bra	L0013fe

L0013e2:
	cmpi.b	#$34,d0			;'4'
	bne	L0013f0
	move.w	#$0002,($0802,a6)
	bra	L0013fe

L0013f0:
	cmpi.b	#$38,d0			;'8'
	bne	L001102
	move.w	#$0003,($0802,a6)
L0013fe:
	move.w	(a7)+,d3
	jsr	(skpblk)
	cmpi.b	#$29,(a5)+		;')'
	bne	L001102
	moveq.l	#$06,d2
	rts

L001412:
	bsr	L001b28
	bset.l	#$03,d4
	bra	L00138c

L00141e:
	addq.l	#1,a5
	moveq.l	#$05,d2
	rts

L001424:
	move.l	a5,-(a7)
	addq.l	#1,a5
	jsr	(skpblk)
	jsr	(toupper)
	cmpi.b	#$41,d0			;'A'
	beq	L001470
	cmpi.b	#$53,d0			;'S'
	beq	L001470
	cmpi.b	#$5b,d0			;'['
	beq	L001470
	cmpi.b	#$50,d0			;'P'
	beq	L001470
	movem.l	d2-d7,-(a7)
	jsr	(getexp2)
	movem.l	(a7)+,d2-d7
	bcs	L001470
	bsr	L0014d6
	jsr	(skpblk)
	cmpi.b	#$2c,d0			;','
	beq	L001470
	movea.l	(a7)+,a5
	bra	L0012ec

L001470:
	movea.l	(a7)+,a5
	addq.l	#1,a5
	jsr	(skpblk)
	cmpi.b	#$5b,d0			;'['
	beq	L00161a
	movem.l	d2-d7,-(a7)
	jsr	(getexp2)
	movem.l	(a7)+,d2-d7
	bsr	L0014d6
	bcc	L00157a
	jsr	(skpblk)
	jsr	(toupper)
	cmpi.b	#$5a,d0			;'Z'
	beq	L001594
	move.l	a5,-(a7)
	addq.l	#2,a5
	jsr	(skpblk)
	movea.l	(a7)+,a5
	cmpi.b	#$2c,d0			;','
	beq	L001594
	bsr	L001b28
	cmpi.b	#$29,(a5)+		;')'
	bne	L001102
	cmpi.b	#$2b,(a5)		;'+'
	bne	L001510
	addq.l	#1,a5
	moveq.l	#$03,d2
	rts

L0014d6:
	move.w	sr,-(a7)
	bcs	L0014f0
	cmpi.b	#$2e,(a5)		;'.'
	bne	L0014f0
	cmpi.b	#$52,($0001,a5)		;'R'
	beq	L0014f4
	cmpi.b	#$72,($0001,a5)		;'r'
	beq	L0014f4
L0014f0:
	move.w	(a7)+,sr
	rts

L0014f4:
	movem.l	d0/a0,-(a7)
	move.l	a4,d0
	lea.l	($012a,a6),a0
	sub.l	a0,d0
	sub.l	d0,d1
	sub.l	($0036,a6),d1
	movem.l	(a7)+,d0/a0
	addq.l	#2,a5
	move.w	(a7)+,sr
	rts

L001510:
	moveq.l	#$02,d2
	rts

L001514:
	addq.l	#2,a5
	jsr	(skpblk)
	cmpi.b	#$2c,d0			;','
	beq	L00155c
	cmpi.b	#$29,(a5)+		;')'
	bne	L001102
	movem.l	d0/a0,-(a7)
	move.l	a4,d0
	lea.l	($012a,a6),a0
	sub.l	a0,d0
	sub.l	d0,d1
	sub.l	($0036,a6),d1
	movem.l	(a7)+,d0/a0
L001540:
	cmpi.l	#$00008000,d1
	blt	L00154c
	bsr	L001c4c
L00154c:
	cmpi.l	#$ffff8000,d1
	bge	L001558
	bsr	L001c4c
L001558:
	moveq.l	#$0d,d2
	rts

L00155c:
	movem.l	d0/a0,-(a7)
	move.l	a4,d0
	lea.l	($012a,a6),a0
	sub.l	a0,d0
	sub.l	d0,d1
	sub.l	($0036,a6),d1
	movem.l	(a7)+,d0/a0
	bsr	L001368
	moveq.l	#$0e,d2
	rts

L00157a:
	bsr	L001810
	move.w	d0,($0804,a6)
	move.l	d1,($0808,a6)
	jsr	(skpblk2)
	cmpi.b	#$2c,d0			;','
	bne	L001102
L001594:
	jsr	(skpblk)
	jsr	(toupper)
	cmpi.b	#$5a,d0			;'Z'
	bne	L0015ae
	bset.l	#$0f,d4
	addq.l	#1,a5
	move.b	(a5),d0
L0015ae:
	jsr	(toupper)
	cmpi.b	#$50,d0			;'P'
	bne	L0015d2
	moveq.l	#$0f,d2
	cmpi.b	#$63,($0001,a5)		;'c'
	beq	L0015ce
	cmpi.b	#$43,($0001,a5)		;'C'
	bne	L001102
L0015ce:
	addq.l	#2,a5
	bra	L0015d8

L0015d2:
	bsr	L001b28
	moveq.l	#$07,d2
L0015d8:
	jsr	(skpblk2)
	cmpi.b	#$29,d0			;')'
	beq	L001614
	cmpi.b	#$2c,d0			;','
	bne	L001102
	jsr	(skpblk)
	jsr	(toupper)
	cmpi.b	#$5a,d0			;'Z'
	bne	L001606
	addq.l	#1,a5
	move.b	(a5),d0
	bset.l	#$0e,d4
L001606:
	movem.l	d1-d3,-(a7)
	bsr	L00136a
	movem.l	(a7)+,d1-d3
	rts

L001614:
	bset.l	#$0e,d4
	rts

L00161a:
	addq.l	#1,a5
	movem.l	d2-d7,-(a7)
	jsr	(getexp2)
	movem.l	(a7)+,d2-d7
	bcs	L00164c
	bsr	L0014d6
	bsr	L001810
	move.l	d1,($0808,a6)
	move.w	d0,($0804,a6)
	jsr	(skpblk2)
	cmpi.b	#$2c,d0			;','
	bne	L001102
	bra	L001650

L00164c:
	clr.w	($0804,a6)
L001650:
	jsr	(skpblk)
	jsr	(toupper)
	cmpi.b	#$5a,d0			;'Z'
	bne	L00166a
	addq.l	#1,a5
	move.b	(a5),d0
	bset.l	#$0f,d4
L00166a:
	jsr	(toupper)
	cmpi.b	#$50,d0			;'P'
	bne	L00168e
	moveq.l	#$10,d2
	move.b	($0001,a5),d0
	jsr	(toupper)
	cmpi.b	#$43,d0			;'C'
	bne	L001102
	addq.l	#2,a5
	bra	L001694

L00168e:
	bsr	L001b28
	moveq.l	#$08,d2
L001694:
	jsr	(skpblk2)
	cmpi.b	#$2c,d0			;','
	bne	L0016a4
	addq.w	#1,d2
	bra	L0016c4

L0016a4:
	cmpi.b	#$5d,d0			;']'
	bne	L001102
	jsr	(skpblk2)
	cmpi.b	#$2c,d0			;','
	beq	L0016c4
	bset.l	#$0e,d4
	clr.w	($0806,a6)
	bra	L0017d2

L0016c4:
	jsr	(skpblk)
	jsr	(toupper)
	cmp.b	#$5a,d0			;'Z'
	beq	L001700
	cmp.b	#$41,d0			;'A'
	beq	L001700
	cmp.b	#$53,d0			;'S'
	beq	L001700
	cmp.b	#$44,d0			;'D'
	beq	L001700
	cmp.b	#$09,d2
	beq	L001102
	cmp.b	#$11,d2
	beq	L001102
	bset.l	#$0e,d4
	bra	L0017e0

L001700:
	cmpi.b	#$5a,d0			;'Z'
	bne	L00170e
	addq.l	#1,a5
	move.b	(a5),d0
	bset.l	#$0e,d4
L00170e:
	move.w	d3,-(a7)
	jsr	(toupper)
	cmpi.b	#$41,d0			;'A'
	beq	L001722
	cmpi.b	#$53,d0			;'S'
	bne	L001730
L001722:
	move.l	d2,-(a7)
	bsr	L001b28
	move.l	(a7)+,d2
	bset.l	#$03,d4
	bra	L001738

L001730:
	move.l	d2,-(a7)
	bsr	L001afa
	move.l	(a7)+,d2
L001738:
	cmpi.b	#$2e,(a5)		;'.'
	bne	L001764
	addq.l	#1,a5
	move.b	(a5)+,d0
	jsr	(toupper)
	cmpi.b	#$57,d0			;'W'
	beq	L001764
	move.b	(-$0001,a5),d0
	jsr	(toupper)
	cmpi.b	#$4c,d0			;'L'
	bne	L001102
	bset.l	#$08,d4
L001764:
	or.w	d3,d4
	jsr	(skpblk)
	cmpi.b	#$2a,d0			;'*'
	bne	L0017aa
	addq.l	#1,a5
	jsr	(skpblk2)
	cmpi.b	#$31,d0			;'1'
	beq	L0017aa
	cmpi.b	#$32,d0			;'2'
	bne	L00178e
	move.w	#$0001,($0802,a6)
	bra	L0017aa

L00178e:
	cmpi.b	#$34,d0			;'4'
	bne	L00179c
	move.w	#$0002,($0802,a6)
	bra	L0017aa

L00179c:
	cmpi.b	#$38,d0			;'8'
	bne	L001102
	move.w	#$0003,($0802,a6)
L0017aa:
	move.w	(a7)+,d3
	jsr	(skpblk2)
	cmpi.w	#$0009,d2
	beq	L0017be
	cmpi.w	#$0011,d2
	bne	L0017cc
L0017be:
	cmpi.b	#$5d,d0			;']'
	bne	L001102
	jsr	(skpblk2)
L0017cc:
	cmpi.b	#$2c,d0			;','
	beq	L0017e0
L0017d2:
	cmpi.b	#$29,d0			;')'
	bne	L001102
	clr.w	($0806,a6)
	rts

L0017e0:
	movem.l	d2-d7,-(a7)
	jsr	(getexp2)
	movem.l	(a7)+,d2-d7
	bcs	L001102
	bsr	L0014d6
	bsr	L001810
	move.w	d0,($0806,a6)
	move.l	d1,($080c,a6)
	jsr	(skpblk2)
	cmpi.b	#$29,d0			;')'
	bne	L001102
	rts

L001810:
	jsr	(skpblk)
	cmpi.b	#$2e,d0			;'.'
	bne	L00185e
	addq.l	#1,a5
	move.b	(a5)+,d0
	jsr	(toupper)
	cmpi.b	#$57,d0			;'W'
	bne	L001848
	moveq.l	#$01,d0
	cmpi.l	#$00008000,d1
	blt	L00183a
	bsr	L001c4c
L00183a:
	cmpi.l	#$ffff8000,d1
	bge	L001876
	bsr	L001c4c
	bra	L001876

L001848:
	move.b	(-$0001,a5),d0
	jsr	(toupper)
	cmpi.b	#$4c,d0			;'L'
	bne	L001102
	moveq.l	#$02,d0
	bra	L001876

L00185e:
	moveq.l	#$01,d0
	cmpi.l	#$00008000,d1
	blt	L00186c
	moveq.l	#$02,d0
	bra	L001876

L00186c:
	cmpi.l	#$ffff8000,d1
	bge	L001876
	moveq.l	#$02,d0
L001876:
	rts

L001878:
	move.l	a4,d0
	lea.l	($012a,a6),a0
	sub.l	a0,d0
	sub.l	d0,d1
	sub.l	($0036,a6),d1
	bra	L001540

L00188a:
	moveq.l	#$0a,d2
	cmpi.b	#$2e,(a5)		;'.'
	bne	L0018b8
	addq.l	#1,a5
	move.b	(a5)+,d0
	jsr	(toupper)
	cmpi.b	#$57,d0			;'W'
	beq	L0018c8
	move.b	(-$0001,a5),d0
	jsr	(toupper)
	cmpi.b	#$4c,d0			;'L'
	bne	L001102
	moveq.l	#$0b,d2
	rts

L0018b8:
	cmpi.l	#$00008000,d1
	bge	L0018ca
	cmpi.l	#$ffff8000,d1
	blt	L0018ca
L0018c8:
	rts

L0018ca:
	moveq.l	#$0b,d2
	rts

L0018ce:
	jsr	(L001c3c)
L0018d4:
	bsr	L001af4
	rts

L0018da:
	jsr	(L001c3c)
L0018e0:
	bsr	L001b22
	rts

L0018e6:
	move.l	a5,-(a7)
	jsr	(skpblk)
	cmpi.b	#$2d,(a5)+		;'-'
	bne	L001912
	cmpi.b	#$28,(a5)+		;'('
	bne	L001912
	jsr	(skpblk)
	jsr	(toupper)
	cmpi.b	#$41,d0			;'A'
	beq	L001918
	cmpi.b	#$53,d0			;'S'
	beq	L001918
L001912:
	movea.l	(a7)+,a5
	bra	L0012ec

L001918:
	movea.l	(a7)+,a5
	addq.l	#1,a5
	cmpi.b	#$28,(a5)+		;'('
	bne	L001102
	bsr	L001b28
	cmpi.b	#$29,(a5)+		;')'
	bne	L001102
	moveq.l	#$04,d2
	rts

L001934:
	addq.l	#1,a5
L001936:
	jsr	(skpblk)
	tst.w	($0834,a6)
	beq	L00194c
	tst.w	d5
	beq	L00195e
	cmpi.w	#$0005,d5
	bcc	L00195e
L00194c:
	movem.l	d2-d7,-(a7)
	jsr	(getexp2)
	movem.l	(a7)+,d2-d7
	moveq.l	#$12,d2
	rts

L00195e:
	cmpi.b	#$24,d0			;'$'
	beq	eaim40
	movem.l	d2-d7,-(a7)
	cmpi.w	#$0008,d5
	beq	L0019dc
	jsr	(fbtran)
	bcs	L001102
	movem.l	(a7),d2-d7
	movem.l	a0-a3,-(a7)
	tst.w	d5
	beq	L00199e
	cmpi.w	#$0005,d5
	bcs	L001102
	cmpi.w	#$0006,d5
	bcs	L0019b8
	beq	L0019c8
	cmpi.w	#$0008,d5
	bcc	L001102
L00199e:
	lea.l	($09a0,a6),a0
	lea.l	($0940,a6),a1
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0),(a1)
L0019ac:
	movem.l	(a7)+,a0-a3
	movem.l	(a7)+,d2-d7
	moveq.l	#$12,d2
	rts

L0019b8:
	jsr	(x_s_trn)
	bcs	L001102
	move.l	d6,($0940,a6)
	bra	L0019ac

L0019c8:
	jsr	(x_d_trn)
	bcs	L001102
	lea.l	($0940,a6),a0
	movem.l	d5-d6,(a0)
	bra	L0019ac

L0019dc:
	movem.l	a0-a3,-(a7)
	jsr	(fpack)
	bcs	L001102
	bra	L0019ac

eaim40::
	addq.l	#1,a5
eaim41::
	move.b	(a5),d0
	jsr	(ishex)
	bcc	L001a00
	moveq.l	#$12,d2
	ori.b	#$01,ccr
	rts

L001a00:
	movem.l	d2-d7/a0-a3,-(a7)
	lea.l	($0940,a6),a3
	clr.l	(a3)
	clr.l	($0004,a3)
	clr.l	($0008,a3)
	tst.w	d5
	beq	L001a32
	cmpi.w	#$0005,d5
	bcs	L001102
	cmpi.w	#$0006,d5
	bcs	L001a7c
	beq	L001a86
	cmpi.w	#$0008,d5
	bhi	L001102
	bcs	L001a32
	beq	L001aac
L001a32:
	bsr	L001ac2
	bcs	L001a72
	move.l	(a3),d1
	lsl.l	#4,d1
	move.l	($0004,a3),d2
	rol.l	#4,d2
	andi.l	#$0000000f,d2
	or.l	d2,d1
	move.l	d1,(a3)
	move.l	($0004,a3),d1
	lsl.l	#4,d1
	move.l	($0008,a3),d2
	rol.l	#4,d2
	andi.l	#$0000000f,d2
	or.l	d2,d1
	move.l	d1,($0004,a3)
	move.l	($0008,a3),d1
	lsl.l	#4,d1
	or.l	d0,d1
	move.l	d1,($0008,a3)
	bra	L001a32

L001a72:
	movem.l	(a7)+,d2-d7/a0-a3
	move.b	(a5),d0
	moveq.l	#$12,d2
	rts

L001a7c:
	jsr	(gethex)
	move.l	d6,(a3)
	bra	L001a72

L001a86:
	bsr	L001ac2
	bcs	L001a72
	move.l	(a3),d1
	lsl.l	#4,d1
	move.l	($0004,a3),d2
	rol.l	#4,d2
	andi.l	#$0000000f,d2
	or.l	d2,d1
	move.l	d1,(a3)
	move.l	($0004,a3),d1
	lsl.l	#4,d1
	or.l	d0,d1
	move.l	d1,($0004,a3)
	bra	L001a86

L001aac:
	moveq.l	#$0b,d7
L001aae:
	bsr	L001ac2
	bcs	L001a72
	lsl.w	#4,d0
	move.b	d0,(a3)
	bsr	L001ac2
	bcs	L001a72
	or.b	d0,(a3)+
	dbra	d7,L001aae
	bra	L001a72

L001ac2:
	move.b	(a5),d0
	jsr	(ishex)
	bcc	L001ace
	rts

L001ace:
	addq.l	#1,a5
	jsr	(toupper)
	cmpi.b	#$41,d0			;'A'
	bcs	L001ae8
	subi.b	#$37,d0			;'7'
	andi.l	#$0000000f,d0
	rts

L001ae8:
	subi.b	#$30,d0			;'0'
	andi.l	#$0000000f,d0
	rts

L001af4:
	jsr	(skpblk)
L001afa:
	move.b	(a5)+,d0
	jsr	(toupper)
	cmpi.b	#$44,d0			;'D'
	bne	L001102
L001b0a:
	clr.w	d3
	clr.w	d2
	move.b	(a5)+,d3
	subi.b	#$30,d3			;'0'
	bcs	L001102
	cmpi.b	#$07,d3
	bhi	L001102
	rts

L001b22:
	jsr	(skpblk)
L001b28:
	move.b	(a5),d0
	jsr	(toupper)
	cmpi.b	#$53,d0			;'S'
	bne	L001b4e
	addq.l	#1,a5
	move.b	(a5)+,d0
	jsr	(toupper)
	cmpi.b	#$50,d0			;'P'
	bne	L001102
	moveq.l	#$07,d3
	moveq.l	#$01,d2
	rts

L001b4e:
	move.b	(a5)+,d0
	jsr	(toupper)
	cmpi.b	#$41,d0			;'A'
	bne	L001102
	bsr	L001b0a
	moveq.l	#$01,d2
	rts

L001b64:
	jsr	(L001c3c)
L001b6a:
	bsr	L001290
	cmpi.w	#$0002,d2
	bcs	L001102
	beq	L001b88
	cmpi.w	#$0005,d2
	bcs	L001102
	cmpi.w	#$0012,d2
	bcc	L001102
L001b88:
	rts

L001b8a:
	jsr	(L001c3c)
L001b90:
	bsr	L001290
	cmpi.w	#$0001,d2
	beq	L001102
	cmpi.w	#$0012,d2
	bhi	L001102
	rts

L001ba6:
	jsr	(L001c3c)
L001bac:
	bsr	L001290
L001bb0:
	cmpi.w	#$0012,d2
	bhi	L001102
	cmpi.w	#$0002,d2
	bcs	L001102
	rts

L001bc2:
	jsr	(L001c3c)
L001bc8:
	bsr	L001290
L001bcc:
	cmpi.w	#$000c,d2
	bcc	L001102
	rts

L001bd6:
	jsr	(L001c3c)
L001bdc:
	bsr	L001bc8
	cmpi.w	#$0001,d2
	beq	L001102
	rts

L001be8:
	jsr	(L001c3c)
L001bee:
	bsr	L001bc8
	bra	L001bb0

L001bf2:
	jsr	(L001c3c)
L001bf8:
	bsr	L001b6a
	bra	L001bcc

L001bfe:
	jsr	(L001c3c)
L001c04:
	bsr	L001290
	cmpi.w	#$0012,d2
	bne	L001102
	rts

L001c12:
	tst.w	d5
	beq	L001c1e
	cmpi.w	#$0003,d5
	bne	L001102
L001c1e:
	rts

L001c20:
	tst.w	d5
	beq	L001c2c
	cmpi.w	#$0002,d5
	bne	L001102
L001c2c:
	rts

L001c2e:
	tst.w	d5
	beq	L001c3a
	cmpi.w	#$0001,d5
	bne	L001102
L001c3a:
	rts

L001c3c:
	jsr	(skpblk)
	cmpi.b	#$2c,(a5)+		;','
	bne	L001102
	rts

L001c4c:
	movem.l	d0-d2/a0-a2,-(a7)
	lea.l	(L001c62),a0
	jsr	(print)
	movem.l	(a7)+,d0-d2/a0-a2
	rts

L001c62:
	.dc.b	$0d,$0a
	.dc.b	'offset overs',$0d,$0a,$00,$00
L001c74:
	move.w	d6,($012a,a6)
L001c78:
	cmpi.w	#$0014,d2
	bhi	L001102
	movem.l	d0-d3/a0-a1,-(a7)
	move.w	d2,d0
	lsl.w	#2,d0
	lea.l	(L001c9a),a0
	movea.l	(a0,d0.w),a1
	jsr	(a1)
	movem.l	(a7)+,d0-d3/a0-a1
	rts

L001c9a:
	.dc.l	L001cf2
	.dc.l	L001cf6
	.dc.l	L001d02
	.dc.l	L001d06
	.dc.l	L001d0a
	.dc.l	L001d0e
	.dc.l	L001d16
	.dc.l	L001d5c
	.dc.l	L001dde
	.dc.l	L001ea6
	.dc.l	L001f64
	.dc.l	L001f8c
	.dc.l	L001f98
	.dc.l	L001f9a
	.dc.l	L001fa6
	.dc.l	L001fae
	.dc.l	L001fb6
	.dc.l	L001fbe
	.dc.l	L001fc6
	.dc.l	L00203e
	.dc.l	L002040
	.dc.l	L001102
L001cf2:
	bra	L00205a

L001cf6:
	cmpi.w	#$0001,d5
	beq	L001102
	bra	L00205a

L001d02:
	bra	L00205a

L001d06:
	bra	L00205a

L001d0a:
	bra	L00205a

L001d0e:
	bsr	L00205a
	move.w	d1,(a4)+
	rts

L001d16:
	moveq.l	#$06,d2
L001d18:
	bsr	L00205a
	move.b	d4,d2
	lsl.w	#4,d2
	lsl.w	#8,d2
	btst.l	#$08,d4
	beq	L001d2c
	bset.l	#$0b,d2
L001d2c:
	cmpi.l	#$00000080,d1
	blt	L001d38
	bsr	L001c4c
L001d38:
	cmpi.l	#$ffffff80,d1
	bge	L001d44
	bsr	L001c4c
L001d44:
	andi.w	#$00ff,d1
	or.w	d1,d2
	move.w	($0802,a6),d1
	andi.w	#$0003,d1
	lsl.w	#8,d1
	lsl.w	#1,d1
	or.w	d1,d2
	move.w	d2,(a4)+
	rts

L001d5c:
	moveq.l	#$06,d2
L001d5e:
	bsr	L00205a
	move.b	d4,d2
	lsl.w	#4,d2
	lsl.w	#8,d2
	btst.l	#$08,d4
	beq	L001d72
	bset.l	#$0b,d2
L001d72:
	move.w	($0802,a6),d1
	andi.w	#$0003,d1
	lsl.w	#8,d1
	lsl.w	#1,d1
	or.w	d1,d2
	btst.l	#$0f,d4
	beq	L001d8a
	bset.l	#$07,d2
L001d8a:
	btst.l	#$0e,d4
	beq	L001d94
	bset.l	#$06,d2
L001d94:
	move.w	($0804,a6),d1
	addq.w	#1,d1
	andi.w	#$0003,d1
	lsl.w	#4,d1
	or.w	d1,d2
	bset.l	#$08,d2
	move.w	d2,(a4)+
	cmpi.w	#$0001,($0804,a6)
	bcc	L001db2
	rts

L001db2:
	bne	L001dd8
	move.l	($0808,a6),d1
	cmpi.l	#$00008000,d1
	blt	L001dc4
	bsr	L001c4c
L001dc4:
	cmpi.l	#$ffff8000,d1
	bge	L001dd0
	bsr	L001c4c
L001dd0:
	andi.w	#$ffff,d1
	move.w	d1,(a4)+
	rts

L001dd8:
	move.l	($0808,a6),(a4)+
	rts

L001dde:
	moveq.l	#$06,d2
L001de0:
	bsr	L00205a
	move.b	d4,d2
	lsl.w	#4,d2
	lsl.w	#8,d2
	btst.l	#$08,d4
	beq	L001df4
	bset.l	#$0b,d2
L001df4:
	move.w	($0802,a6),d1
	andi.w	#$0003,d1
	lsl.w	#8,d1
	lsl.w	#1,d1
	or.w	d1,d2
	btst.l	#$0f,d4
	beq	L001e0c
	bset.l	#$07,d2
L001e0c:
	btst.l	#$0e,d4
	beq	L001e16
	bset.l	#$06,d2
L001e16:
	move.w	($0804,a6),d1
	addq.w	#1,d1
	andi.w	#$0003,d1
	lsl.w	#4,d1
	or.w	d1,d2
	bset.l	#$08,d2
	move.w	($0806,a6),d1
	addq.w	#1,d1
	andi.w	#$0003,d1
	btst.l	#$06,d2
	bne	L001e3c
	bset.l	#$02,d1
L001e3c:
	or.w	d1,d2
	move.w	d2,(a4)+
	cmpi.w	#$0001,($0804,a6)
	bcc	L001e4a
	bra	L001e74

L001e4a:
	bne	L001e70
	move.l	($0808,a6),d1
	cmpi.l	#$00008000,d1
	blt	L001e5c
	bsr	L001c4c
L001e5c:
	cmpi.l	#$ffff8000,d1
	bge	L001e68
	bsr	L001c4c
L001e68:
	andi.w	#$ffff,d1
	move.w	d1,(a4)+
	bra	L001e74

L001e70:
	move.l	($0808,a6),(a4)+
L001e74:
	cmpi.w	#$0001,($0806,a6)
	bcc	L001e7e
	rts

L001e7e:
	bne	L001ea0
	move.l	($080c,a6),d1
	cmpi.l	#$00008000,d1
	blt	L001e90
	bsr	L001c4c
L001e90:
	cmpi.l	#$ffff8000,d1
	bge	L001e9c
	bsr	L001c4c
L001e9c:
	move.w	d1,(a4)+
	rts

L001ea0:
	move.l	($080c,a6),(a4)+
	rts

L001ea6:
	moveq.l	#$06,d2
L001ea8:
	bsr	L00205a
	move.b	d4,d2
	lsl.w	#4,d2
	lsl.w	#8,d2
	btst.l	#$08,d4
	beq	L001ebc
	bset.l	#$0b,d2
L001ebc:
	move.w	($0802,a6),d1
	andi.w	#$0003,d1
	lsl.w	#8,d1
	lsl.w	#1,d1
	or.w	d1,d2
	btst.l	#$0f,d4
	beq	L001ed4
	bset.l	#$07,d2
L001ed4:
	btst.l	#$0e,d4
	beq	L001ede
	bset.l	#$06,d2
L001ede:
	move.w	($0804,a6),d1
	addq.w	#1,d1
	andi.w	#$0003,d1
	lsl.w	#4,d1
	or.w	d1,d2
	bset.l	#$08,d2
	move.w	($0806,a6),d1
	addq.w	#1,d1
	andi.w	#$0003,d1
	or.w	d1,d2
	move.w	d2,(a4)+
	cmpi.w	#$0001,($0804,a6)
	bcc	L001f08
	bra	L001f32

L001f08:
	bne	L001f2e
	move.l	($0808,a6),d1
	cmpi.l	#$00008000,d1
	blt	L001f1a
	bsr	L001c4c
L001f1a:
	cmpi.l	#$ffff8000,d1
	bge	L001f26
	bsr	L001c4c
L001f26:
	andi.w	#$ffff,d1
	move.w	d1,(a4)+
	bra	L001f32

L001f2e:
	move.l	($0808,a6),(a4)+
L001f32:
	cmpi.w	#$0001,($0806,a6)
	bcc	L001f3c
	rts

L001f3c:
	bne	L001f5e
	move.l	($080c,a6),d1
	cmpi.l	#$00008000,d1
	blt	L001f4e
	bsr	L001c4c
L001f4e:
	cmpi.l	#$ffff8000,d1
	bge	L001f5a
	bsr	L001c4c
L001f5a:
	move.w	d1,(a4)+
	rts

L001f5e:
	move.l	($080c,a6),(a4)+
	rts

L001f64:
	cmpi.l	#$00008000,d1
	blt	L001f72
	bsr	L001c4c
	bra	L001f8c

L001f72:
	cmpi.l	#$ffff8000,d1
	bge	L001f80
	bsr	L001c4c
	bra	L001f8c

L001f80:
	clr.w	d3
	moveq.l	#$07,d2
	bsr	L00205a
	move.w	d1,(a4)+
	rts

L001f8c:
	moveq.l	#$01,d3
	moveq.l	#$07,d2
	bsr	L00205a
	move.l	d1,(a4)+
	rts

L001f98:
	nop
L001f9a:
	moveq.l	#$07,d2
	moveq.l	#$02,d3
	bsr	L00205a
	move.w	d1,(a4)+
	rts

L001fa6:
	moveq.l	#$07,d2
	moveq.l	#$03,d3
	bra	L001d18

L001fae:
	moveq.l	#$07,d2
	moveq.l	#$03,d3
	bra	L001d5e

L001fb6:
	moveq.l	#$07,d2
	moveq.l	#$03,d3
	bra	L001de0

L001fbe:
	moveq.l	#$07,d2
	moveq.l	#$03,d3
	bra	L001ea8

L001fc6:
	moveq.l	#$07,d2
	moveq.l	#$04,d3
	bsr	L00205a
	tst.w	d5
	beq	L001fe0
	cmpi.w	#$0002,d5
	bcc	L001fe8
	andi.w	#$00ff,d1
	move.w	d1,(a4)+
	rts

L001fe0:
	tst.w	($0834,a6)
	bne	L002022
	bra	L001fea

L001fe8:
	bne	L001fee
L001fea:
	move.w	d1,(a4)+
	rts

L001fee:
	cmpi.w	#$0004,d5
	bcc	L001ff8
	move.l	d1,(a4)+
	rts

L001ff8:
	bhi	L002004
	lea.l	($0940,a6),a0
	move.l	(a0)+,(a4)+
	move.l	(a0),(a4)+
	rts

L002004:
	cmpi.w	#$0006,d5
	bcc	L002010
	move.l	($0940,a6),(a4)+
	rts

L002010:
	bhi	L00201c
	lea.l	($0940,a6),a0
	move.l	(a0)+,(a4)+
	move.l	(a0),(a4)+
	rts

L00201c:
	cmpi.w	#$0008,d5
	bcc	L00202e
L002022:
	lea.l	($0940,a6),a0
	move.l	(a0)+,(a4)+
	move.l	(a0)+,(a4)+
	move.l	(a0),(a4)+
	rts

L00202e:
	bhi	L001102
	lea.l	($0940,a6),a0
	move.l	(a0)+,(a4)+
	move.l	(a0)+,(a4)+
	move.l	(a0),(a4)+
	rts

L00203e:
	rts

L002040:
	cmpi.w	#$0002,d3
	bhi	L002058
	tst.w	d3
	beq	L002058
	movem.l	d2-d3,-(a7)
	moveq.l	#$07,d2
	moveq.l	#$04,d3
	bsr	L00205a
	movem.l	(a7)+,d2-d3
L002058:
	rts

L00205a:
	movem.l	d2-d3,-(a7)
	andi.w	#$0007,d2
	andi.w	#$0007,d3
	asl.w	#3,d2
	or.w	d2,d3
	andi.w	#$ffc0,($012a,a6)
	or.w	d3,($012a,a6)
	movem.l	(a7)+,d2-d3
	rts

L00207a:
	asl.w	#6,d0
	move.w	d1,-(a7)
	move.w	($012a,a6),d1
	andi.w	#$fe3f,d1
	andi.w	#$01c0,d0
	or.w	d0,d1
	move.w	d1,($012a,a6)
	move.w	(a7)+,d1
	rts

L002094:
	tst.w	d5
	beq	L0020c2
	cmpi.w	#$0002,d5
	beq	L0020c2
	bhi	L0020b6
	moveq.l	#$10,d0
L0020a2:
	move.w	d1,-(a7)
	move.b	($012a,a6),d1
	andi.w	#$00cf,d1
	or.w	d0,d1
	move.b	d1,($012a,a6)
	move.w	(a7)+,d1
	rts

L0020b6:
	cmpi.w	#$0003,d5
	bhi	L001102
	moveq.l	#$20,d0			;' '
	bra	L0020a2

L0020c2:
	moveq.l	#$30,d0			;'0'
	bra	L0020a2

L0020c6:
	movem.l	d0-d3,-(a7)
	move.w	($012a,a6),-(a7)
	bsr	L001c78
	move.w	($012a,a6),d0
	move.w	d0,d1
	ror.w	#7,d1
	asl.w	#3,d0
	andi.w	#$01c0,d0
	andi.w	#$0e00,d1
	or.w	d0,d1
	move.w	(a7)+,d0
	andi.w	#$f03f,d0
	or.w	d0,d1
	move.w	d1,($012a,a6)
	movem.l	(a7)+,d0-d3
	rts

L0020f8:
	movem.l	d2-d3,-(a7)
	add.w	d3,d3
	andi.w	#$000f,d3
	move.b	($012a,a6),d2
	andi.w	#$00f1,d2
	or.w	d3,d2
	move.b	d2,($012a,a6)
	movem.l	(a7)+,d2-d3
	rts

L002116:
	bsr	L0020f8
L002118:
	cmpi.w	#$0003,d5
	bhi	L001102
	move.w	d5,d0
	bne	L002126
	moveq.l	#$02,d0
L002126:
	subq.w	#1,d0
	asl.w	#6,d0
	andi.w	#$00c0,d0
	andi.w	#$ff3f,($012a,a6)
	or.w	d0,($012a,a6)
	rts

L00213a:
	tst.w	d5
	beq	L002158
	cmpi.w	#$0002,d5
	beq	L002158
	bcs	L002156
	cmpi.w	#$0003,d5
	bhi	L001102
	ori.b	#$04,($012a,a6)
	rts

L002156:
	rts

L002158:
	ori.b	#$02,($012a,a6)
	rts

L002160:
	tst.w	d5
	beq	L002184
	cmpi.w	#$0002,d5
	beq	L002184
	bcs	L00217c
	cmpi.w	#$0003,d5
	bhi	L001102
	ori.b	#$06,($012a,a6)
	rts

L00217c:
	ori.b	#$02,($012a,a6)
	rts

L002184:
	ori.b	#$04,($012a,a6)
	rts

L00218c:
	jsr	(L001c3c)
L002192:
	bsr	L001b6a
L002196:
	bsr	L001c78
	rts

L00219c:
	jsr	(L001c3c)
L0021a2:
	bsr	L001b90
	bra	L002196

L0021a8:
	jsr	(L001c3c)
L0021ae:
	bsr	L001bac
	bra	L002196

L0021b4:
	jsr	(L001c3c)
	bsr	L001bc8
	bra	L002196

L0021c0:
	jsr	(L001c3c)
	bsr	L001290
	cmpi.w	#$0002,d2
	bcs	L001102
	cmpi.w	#$0003,d2
	beq	L001102
	cmpi.w	#$0004,d2
	beq	L001102
	cmpi.w	#$000c,d2
	bcc	L001102
	cmpi.w	#$000a,d2
	beq	L001102
	cmpi.w	#$000b,d2
	beq	L001102
	bra	L002196

L0021fc:
	jsr	(L001c3c)
L002202:
	bsr	L001bdc
	bra	L002196

L002208:
	jsr	(L001c3c)
L00220e:
	bsr	L001bee
	bra	L002196

L002214:
	jsr	(L001c3c)
L00221a:
	bsr	L001bf8
	bra	L002196

L002222:
	cmpi.w	#$0003,d5
	bhi	L001102
	bsr	L0011ee
	bcs	L00226e
	cmpi.w	#$0003,d3
	bhi	L001102
	cmpi.w	#$0002,d3
	bcs	L002252
	beq	L002260
	bsr	L001c12
	bsr	L0018da
	ori.w	#$4e68,d3
	move.w	d3,($012a,a6)
	rts

L002252:
	bsr	L001c20
	bsr	L0021fc
	ori.w	#$42c0,($012a,a6)
	rts

L002260:
	bsr	L001c20
	bsr	L0021fc
	ori.w	#$40c0,($012a,a6)
	rts

L00226e:
	bsr	L001290
	cmpi.w	#$0001,d2
	bne	L00229a
	move.w	d3,($012a,a6)
	jsr	(L001c3c)
	bsr	L0011ee
	bcs	L002298
	cmpi.w	#$0003,d3
	bne	L001102
	ori.w	#$4e60,($012a,a6)
	rts

L002298:
	subq.l	#1,a5
L00229a:
	bsr	L001c78
	movem.l	d2-d3,-(a7)
	bsr	L00128a
	cmpi.w	#$0014,d2
	bne	L0022dc
	ori.w	#$44c0,($012a,a6)
	cmpi.w	#$0001,d3
	beq	L0022c6
	cmpi.w	#$0002,d3
	bne	L001102
	bset.b	#$01,($012a,a6)
L0022c6:
	movem.l	(a7)+,d2-d3
	cmpi.w	#$0001,d2
	beq	L001102
	cmpi.w	#$0012,d2
	bhi	L001102
	rts

L0022dc:
	bsr	L002094
	cmpi.w	#$000b,d2
	bhi	L001102
	cmpi.w	#$0001,d2
	beq	L001102
	bsr	L0020c6
	addq.l	#8,a7
	rts

L0022f8:
	cmpi.w	#$0001,d5
	beq	L001102
	cmpi.w	#$0002,d5
	bls	L002314
	cmpi.w	#$0003,d5
	bhi	L001102
	bset.b	#$06,($012b,a6)
L002314:
	move.b	(a5),d0
	jsr	(toupper)
	cmpi.b	#$53,d0			;'S'
	beq	L00232e
	cmpi.b	#$41,d0			;'A'
	beq	L00232e
	cmpi.b	#$44,d0			;'D'
	bne	L002360
L00232e:
	bsr	L002396
	move.w	d0,(a4)+
	bsr	L0021b4
	cmpi.w	#$0002,d2
	bcs	L001102
	cmpi.w	#$0003,d2
	beq	L001102
	cmpi.w	#$0004,d2
	bne	L00235e
	moveq.l	#$0f,d2
	move.w	($012c,a6),d0
L002352:
	lsr.w	#1,d0
	roxl.w	#1,d1
	dbra	d2,L002352
	move.w	d1,($012c,a6)
L00235e:
	rts

L002360:
	bset.b	#$02,($012a,a6)
	addq.l	#2,a4
	bsr	L001290
	cmpi.w	#$0002,d2
	bcs	L001102
	cmpi.w	#$0004,d2
	beq	L001102
	cmpi.w	#$0012,d2
	bcc	L001102
	bsr	L001c78
	jsr	(L001c3c)
	bsr	L002396
	move.w	d0,($012c,a6)
	rts

L002396:
	jsr	(skpblk)
	move.b	(a5),d0
	jsr	(toupper)
	cmpi.b	#$44,d0			;'D'
	beq	L0023b8
	cmpi.b	#$53,d0			;'S'
	beq	L0023b8
	cmpi.b	#$41,d0			;'A'
	bne	L001102
L0023b8:
	movem.l	d1-d5,-(a7)
	clr.w	d5
	moveq.l	#$14,d4
L0023c0:
	move.b	(a5),d0
	jsr	(toupper)
	cmpi.b	#$44,d0			;'D'
	bne	L0023d4
	bsr	L001afa
	bra	L0023d8

L0023d4:
	bsr	L001b28
L0023d8:
	asl.w	#3,d2
	add.w	d2,d3
	bset.l	d3,d5
	jsr	(skpblk)
	cmpi.b	#$2d,(a5)		;'-'
	beq	L0023fc
	cmpi.b	#$2f,(a5)+		;'/'
	dbne	d4,L0023c0
	subq.l	#1,a5
L0023f4:
	move.w	d5,d0
	movem.l	(a7)+,d1-d5
	rts

L0023fc:
	addq.l	#1,a5
	movem.l	d3/d5,-(a7)
	btst.l	#$03,d2
	bne	L002414
	jsr	(skpblk)
	bsr	L001afa
	bra	L00241e

L002414:
	jsr	(skpblk)
	bsr	L001b28
L00241e:
	asl.w	#3,d2
	add.w	d3,d2
	movem.l	(a7)+,d3/d5
	cmp.w	d3,d2
	bls	L001102
L00242c:
	bset.l	d3,d5
	addq.w	#1,d3
	cmp.w	d3,d2
	bcc	L00242c
	jsr	(skpblk)
	cmpi.b	#$2f,(a5)+		;'/'
	beq	L0023c0
	subq.l	#1,a5
	bra	L0023f4

L002444:
	cmpi.w	#$0003,d5
	bhi	L001102
	bsr	L001c04
	tst.w	d1
	beq	L001102
	cmpi.w	#$0008,d1
	bhi	L001102
	bne	L002462
	clr.w	d1
L002462:
	move.w	d1,d3
	bsr	L002116
	bra	L0021b4

L00246c:
	cmpi.w	#$0003,d5
	bhi	L001102
	bsr	L001c04
	bsr	L002118
	bsr	L001c78
	cmpi.w	#$0c00,d6
	beq	L00219c
	bra	L0021fc

L00248c:
	cmpi.w	#$0003,d5
	bhi	L001102
	bsr	L001290
	tst.w	d2
	beq	L0024aa
	cmpi.w	#$0004,d2
	bne	L001102
	bset.b	#$03,($012b,a6)
L0024aa:
	move.w	d2,-(a7)
	or.w	d3,($012a,a6)
	bsr	L002118
	bsr	L00128a
	cmp.w	(a7)+,d2
	bne	L001102
	bra	L0020f8

L0024c2:
	cmpi.w	#$0003,d5
	bhi	L001102
	bsr	L001b90
L0024ce:
	bsr	L002118
	tst.w	d2
	beq	L0024e2
L0024d6:
	bsr	L001c78
	bsr	L0018ce
	bra	L0020f8

L0024e2:
	movem.l	d3/a5,-(a7)
	bsr	L00128a
	movem.l	(a7)+,d3/a5
	tst.w	d2
	beq	L0024d6
	bsr	L0020f8
	bset.b	#$00,($012a,a6)
	bra	L002208

L002500:
	cmpi.w	#$0002,d5
	bhi	L001102
	bsr	L001c2e
	moveq.l	#$01,d5
	bsr	L00248c
	cmpi.w	#$8140,d6
	beq	L002522
	cmpi.w	#$8180,d6
	beq	L002522
	tst.w	d0
	rts

L002522:
	moveq.l	#$02,d5
	move.w	($012a,a6),d0
	andi.w	#$0e0f,d0
	or.w	d6,d0
	move.w	d0,($012a,a6)
	bsr	L001bfe
	move.w	d1,(a4)+
	rts

L00253a:
	cmpi.w	#$0003,d5
	bhi	L001102
	bsr	L001290
	cmpi.w	#$0001,d2
	bcs	L002576
	beq	L001102
	cmpi.w	#$0012,d2
	beq	L00258e
	cmpi.w	#$000c,d2
	bcc	L001102
	bsr	L001c20
	bsr	L001c78
L002566:
	jsr	(skpblk)
	cmpi.b	#$2c,(a5)		;','
	beq	L001102
	rts

L002576:
	bset.b	#$05,($012b,a6)
L00257c:
	bsr	L002118
	bsr	L0020f8
	bsr	L0018ce
	or.w	d3,($012a,a6)
	rts

L00258e:
	move.w	d1,d3
	bne	L002594
	moveq.l	#$08,d3
L002594:
	cmpi.w	#$0008,d3
	bhi	L001102
	bra	L00257c

L00259e:
	cmpi.w	#$0003,d5
	bhi	L001102
	bsr	L001290
	tst.w	d2
	beq	L0025d8
	cmpi.w	#$0012,d2
	bne	L001102
	bset.b	#$03,($012a,a6)
	cmpi.l	#$0000ffff,d1
	bls	L0025c8
	bsr	L001c4c
L0025c8:
	move.w	d1,(a4)+
L0025ca:
	bsr	L0021fc
	tst.w	d2
	beq	L001c12
	bra	L001c2e

L0025d8:
	bsr	L0020f8
	bset.b	#$00,($012a,a6)
	bra	L0025ca

L0025e4:
	cmpi.w	#$0003,d5
	bhi	L001102
	bsr	L001c04
	bsr	L002118
	bsr	L001c78
	bsr	L00128a
	cmpi.w	#$0014,d2
	bne	L00261c
	bsr	L001c78
	cmpi.w	#$0002,d3
	bhi	L001102
	beq	L001c20
	bclr.b	#$06,($012b,a6)
	bra	L001c2e

L00261c:
	cmpi.w	#$000c,d2
	bcc	L001102
	cmpi.w	#$0001,d2
	beq	L001102
	bra	L001c78

L002630:
	btst.l	#$0f,d6
	beq	L0026ba
	cmpi.w	#$0001,d5
	beq	L001102
	cmpi.w	#$0003,d5
	bhi	L001102
	bne	L0026aa
	btst.l	#$0e,d6
	bne	L002662
	move.w	#$4c40,($012a,a6)	;'L@'
	btst.l	#$08,d6
	beq	L002672
	bset.b	#$03,(a4)
	bra	L002672

L002662:
	move.w	#$4c00,($012a,a6)
	btst.l	#$08,d6
	beq	L002672
	bset.b	#$03,(a4)
L002672:
	move.l	a4,-(a7)
	addq.l	#2,a4
	bsr	L0021a2
	bsr	L0018ce
	jsr	(skpblk)
	cmpi.b	#$3a,d0			;':'
	beq	L002694
	movea.l	(a7)+,a0
	or.w	d3,(a0)
	lsl.w	#4,d3
	or.b	d3,(a0)
	rts

L002694:
	movea.l	(a7),a0
	bset.b	#$02,(a0)
	or.w	d3,(a0)
	addq.l	#1,a5
	bsr	L0018d4
	movea.l	(a7)+,a0
	lsl.w	#4,d3
	or.b	d3,(a0)
	rts

L0026aa:
	bsr	L0021a2
	bsr	L0018ce
	bsr	L0020f8
	bra	L001c20

L0026ba:
	cmpi.w	#$0001,d5
	beq	L001102
	cmpi.w	#$0003,d5
	bhi	L001102
	bne	L0026d2
	bclr.b	#$07,($012b,a6)
L0026d2:
	bsr	L0021a2
	bsr	L0018ce
	lsl.w	#1,d3
	or.b	d3,($012a,a6)
	bset.b	#$00,($012a,a6)
	cmpi.w	#$0003,d5
	beq	L0026f2
	bset.b	#$07,($012b,a6)
L0026f2:
	rts

L0026f4:
	cmpi.w	#$0003,d5
	bhi	L001102
	cmpi.w	#$4a00,d6
	bne	L002718
	cmpi.w	#$0001,d5
	bne	L00270e
	bsr	L0021a2
	bra	L00271c

L00270e:
	bsr	L001290
	bsr	L001c78
	bra	L00271c

L002718:
	bsr	L002202
L00271c:
	bsr	L002118
	bra	L002566

L002724:
	cmpi.w	#$0003,d5
	bhi	L001102
	bsr	L001290
	bsr	L001c78
	bsr	L002118
	bsr	L0018ce
	bra	L0020f8

L002740:
	cmpi.w	#$0003,d5
	bhi	L001102
	bsr	L001290
	cmpi.w	#$0003,d2
	bne	L001102
	moveq.l	#$01,d2
	bsr	L00205a
	bsr	L00128a
	cmpi.w	#$0003,d2
	bne	L001102
	bsr	L0020f8
	bra	L002118

L00276e:
	cmpi.w	#$0003,d5
	bhi	L001102
	bsr	L0018d4
	bsr	L0020f8
	bsr	L0021fc
	bset.b	#$00,($012a,a6)
	bra	L002118

L00278c:
	cmpi.w	#$0003,d5
	bhi	L001102
	bsr	L001290
	cmpi.w	#$0001,d2
	bhi	L001102
	movem.l	d2-d3,-(a7)
	bsr	L00128a
	cmpi.w	#$0001,d2
	bhi	L001102
	movem.l	(a7)+,d0-d1
	cmp.w	d2,d0
	beq	L0027ca
	bhi	L0027bc
	exg.l	d1,d3
L0027bc:
	ori.w	#$0088,d1
	move.b	d1,($012b,a6)
	bsr	L0020f8
	rts

L0027ca:
	bsr	L0020f8
	ori.w	#$0040,d1
	tst.w	d2
	beq	L0027da
	bset.l	#$03,d1
L0027da:
	move.b	d1,($012b,a6)
	bra	L001c12

L0027e2:
	cmpi.w	#$0003,d5
	bhi	L001102
	bsr	L0018e0
	or.b	d3,($012b,a6)
L0027f2:
	bra	L002566

L0027f6:
	cmpi.w	#$0003,d5
	bhi	L001102
	bsr	L002192
	bra	L0027f2

L002804:
	cmpi.w	#$0003,d5
	bhi	L001102
	bsr	L002192
	bsr	L0018da
	add.w	d3,d3
	or.b	d3,($012a,a6)
	bra	L001c12

L00281e:
	cmpi.w	#$0003,d5
	bhi	L001102
	bsr	L0018e0
	or.b	d3,($012b,a6)
	bsr	L001bfe
	cmpi.w	#$0003,d5
	beq	L002854
	cmpi.l	#$00008000,d1
	blt	L002844
	bsr	L001c4c
L002844:
	cmpi.l	#$ffff8000,d1
	bge	L002850
	bsr	L001c4c
L002850:
	move.w	d1,(a4)+
	rts

L002854:
	andi.w	#$f9af,($012a,a6)
	ori.w	#$0008,($012a,a6)
	move.l	d1,(a4)+
	rts

L002864:
	cmpi.w	#$0003,d5
	bhi	L001102
	cmpi.w	#$0001,d5
	beq	L001102
	bsr	L001290
	bsr	L001c78
	bsr	L0018da
	bsr	L0020c6
	bsr	L002094
	rts

L00288a:
	cmpi.w	#$0003,d5
	bhi	L001102
	bsr	L001c2e
	bsr	L002202
L00289a:
	bra	L002566

L00289e:
	cmpi.w	#$0003,d5
	bhi	L001102
	bsr	L001c04
	cmpi.l	#$0000007f,d1
	ble	L0028b6
	bsr	L001c4c
L0028b6:
	cmpi.l	#$ffffff80,d1
	bge	L0028c2
	bsr	L001c4c
L0028c2:
	move.b	d1,($012b,a6)
	bsr	L0018ce
	bsr	L0020f8
	bra	L001c12

L0028d2:
	cmpi.w	#$0003,d5
	bhi	L001102
	bsr	L001c04
	move.w	d1,(a4)+
	bra	L00289a

L0028e2:
	cmpi.w	#$0003,d5
	bhi	L001102
	bsr	L0018d4
	or.b	d3,($012b,a6)
	cmpi.w	#$4840,d6		;'H@'
	bne	L0028fe
	bsr	L001c20
	bra	L00289a

L0028fe:
	cmpi.w	#$49c0,d6
	beq	L00291a
	cmpi.w	#$0001,d5
	beq	L001102
	move.w	d5,d0
	bne	L002912
	moveq.l	#$02,d0
L002912:
	asl.w	#6,d0
	or.b	d0,($012b,a6)
	bra	L00289a

L00291a:
	cmpi.w	#$0003,d5
	beq	L002926
	tst.w	d5
	bne	L001102
L002926:
	tst.w	d0
	rts

L00292a:
	cmpi.w	#$0003,d5
	bhi	L001102
	bsr	L001c04
	cmpi.w	#$4848,d6		;'HH'
	bne	L002948
	cmpi.l	#$00000007,d1
	bhi	L001102
	bra	L002952

L002948:
	cmpi.l	#$0000000f,d1
	bhi	L001102
L002952:
	or.b	d1,($012b,a6)
	bra	L002566

L00295a:
	cmpi.w	#$0003,d5
	bhi	L001102
	bsr	L001290
	tst.w	d2
	beq	L00299a
	cmpi.w	#$0005,d2
	bne	L001102
	bsr	L001c78
	bsr	L0018ce
	bsr	L0020f8
L00297e:
	bclr.b	#$05,($012b,a6)
	cmpi.w	#$0001,d5
	beq	L001102
	cmpi.w	#$0003,d5
	bne	L002998
	bset.b	#$06,($012b,a6)
L002998:
	rts

L00299a:
	bsr	L0020f8
	bset.b	#$07,($012b,a6)
	bsr	L00128a
	cmpi.w	#$0005,d2
	bne	L001102
	bsr	L001c78
	bra	L00297e

L0029b6:
	cmpi.w	#$0003,d5
	bhi	L001102
	bsr	L001290
	bra	L0024ce

L0029c6:
	cmpi.w	#$0003,d5
	bhi	L001102
	cmpi.w	#$0001,d5
	beq	L001102
	bsr	L001290
	bsr	L001c78
	bsr	L0018da
	bsr	L0020f8
	cmpi.w	#$0003,d5
	bne	L0029f2
	bset.b	#$00,($012a,a6)
L0029f2:
	rts

L0029f4:
	cmpi.w	#$0003,d5
	bhi	L001102
	rts

L0029fe:
	moveq.l	#$01,d5
L002a00:
	cmpi.w	#$0005,d5
	beq	L0029fe
	cmpi.w	#$0003,d5
	bhi	L001102
	bsr	L001290
	cmpi.w	#$000c,d2
	beq	L002a1e
	subq.l	#2,d1
	sub.l	($0036,a6),d1
L002a1e:
	cmpi.w	#$000c,d2
	bhi	L001102
	cmpi.w	#$000a,d2
	bcs	L001102
	btst.l	#$00,d1
	bne	L001102
	cmpi.w	#$0001,d5
	bne	L002a60
	cmpi.l	#$00000080,d1
	blt	L002a48
	bsr	L001c4c
L002a48:
	cmpi.l	#$ffffff80,d1
	bge	L002a54
	bsr	L001c4c
L002a54:
	tst.w	d1
	beq	L001102
	move.b	d1,($012b,a6)
	rts

L002a60:
	cmpi.w	#$0003,d5
	beq	L002a82
	cmpi.l	#$00008000,d1
	blt	L002a72
	bsr	L001c4c
L002a72:
	cmpi.l	#$ffff8000,d1
	bge	L002a7e
	bsr	L001c4c
L002a7e:
	move.w	d1,(a4)+
	rts

L002a82:
	ori.w	#$00ff,($012a,a6)
	move.l	d1,(a4)+
	rts

L002a8c:
	cmpi.w	#$0003,d5
	bcc	L001102
	bsr	L0018d4
	or.b	d3,($012b,a6)
	bsr	L00128a
	cmpi.w	#$000c,d2
	beq	L002aac
	subq.l	#2,d1
	sub.l	($0036,a6),d1
L002aac:
	cmpi.w	#$000c,d2
	bhi	L001102
	cmpi.w	#$000a,d2
	bcs	L001102
	bra	L002a60

L002abe:
	cmpi.w	#$0003,d5
	bhi	L001102
	bsr	L001c2e
	bsr	L002202
	bra	L002566

L002ad2:
	cmpi.w	#$0003,d5
	bhi	L001102
	bsr	L001290
	tst.w	d2
	beq	L002b14
	cmpi.w	#$0012,d2
	bne	L001102
	bset.b	#$03,($012a,a6)
	move.w	d1,(a4)+
	bsr	L00128a
	cmpi.w	#$0012,d2
	bcc	L001102
L002afe:
	cmpi.w	#$0001,d2
	beq	L001102
	bsr	L001c78
	tst.w	d2
	beq	L001c12
	bra	L001c2e

L002b14:
	bsr	L0020f8
	bset.b	#$00,($012a,a6)
	bsr	L00128a
	bra	L002afe

L002b24:
	cmpi.w	#$0003,d5
	bhi	L001102
	bsr	L001c12
	bsr	L002192
	bra	L002566

L002b38:
	tst.w	d5
	bne	L001102
	bsr	L001c04
	cmpi.l	#$000000ff,d1
	bls	L002b52
	bsr	L001c4c
	bra	L001102

L002b52:
	move.w	d1,(a4)+
	bra	L00218c

L002b58:
	bsr	L001290
	cmpi.w	#$0001,d2
	bhi	L001102
	bra	L001c78

L002b68:
	bsr	L00213a
	move.l	a4,-(a7)
	addq.l	#2,a4
	bsr	L002192
	jsr	(L001c3c)
	bsr	L001290
	cmpi.w	#$0001,d2
	bhi	L001102
	movea.l	(a7)+,a0
	lsl.w	#4,d3
	move.b	d3,(a0)
	tst.w	d2
	beq	L002b94
	bset.b	#$07,(a0)
L002b94:
	tst.w	d0
	rts

L002b98:
	move.l	a4,-(a7)
	bsr	L002b68
	movea.l	(a7)+,a0
	bset.b	#$03,(a0)
	rts

L002ba4:
	bsr	L002160
	bsr	L0018d4
	or.w	d3,(a4)
	bsr	L0018ce
	lsl.w	#6,d3
	or.w	d3,(a4)+
	bra	L002208

L002bba:
	cmpi.w	#$0001,d5
	beq	L001102
	bsr	L002160
	bsr	L0018d4
	or.w	d3,(a4)
	jsr	(skpblk2)
	cmpi.b	#$3a,d0			;':'
	bne	L001102
	bsr	L0018d4
	or.w	d3,($0002,a4)
	bsr	L0018ce
	lsl.w	#6,d3
	or.w	d3,(a4)
	jsr	(skpblk2)
	cmpi.b	#$3a,d0			;':'
	bne	L001102
	bsr	L0018d4
	lsl.w	#6,d3
	or.w	d3,($0002,a4)
	jsr	(L001c3c)
	jsr	(skpblk2)
	cmpi.b	#$28,d0			;'('
	bne	L001102
	bsr	L001290
	cmpi.w	#$0001,d2
	bhi	L001102
	bne	L002c28
	bset.b	#$07,(a4)
L002c28:
	lsl.w	#4,d3
	or.b	d3,(a4)
	jsr	(skpblk2)
	cmpi.b	#$29,d0			;')'
	bne	L001102
	jsr	(skpblk2)
	cmpi.b	#$3a,d0			;':'
	bne	L001102
	jsr	(skpblk2)
	cmpi.b	#$28,d0			;'('
	bne	L001102
	bsr	L001290
	cmpi.w	#$0001,d2
	bhi	L001102
	bne	L002c6a
	bset.b	#$07,($0002,a4)
L002c6a:
	lsl.w	#4,d3
	or.b	d3,($0002,a4)
	jsr	(skpblk2)
	cmpi.b	#$29,d0			;')'
	bne	L001102
	addq.l	#4,a4
	rts

L002c82:
	cmpi.w	#$0003,d5
	bhi	L001102
	bsr	L002118
	bsr	L001290
	cmpi.w	#$0002,d2
	bcc	L002cae
	bset.b	#$03,(a4)
	lsl.w	#4,d3
	tst.w	d2
	beq	L002ca6
	bset.l	#$07,d3
L002ca6:
	or.b	d3,(a4)
	addq.l	#2,a4
	bra	L002208

L002cae:
	cmpi.w	#$0002,d2
	bcs	L001102
	cmpi.w	#$000c,d2
	bcc	L001102
	move.l	a4,-(a7)
	addq.l	#2,a4
	bsr	L001c78
	bsr	L00128a
	cmpi.w	#$0001,d2
	bhi	L001102
	bne	L002cd8
	bset.l	#$03,d3
L002cd8:
	lsl.w	#4,d3
	movea.l	(a7)+,a0
	move.b	d3,(a0)
	rts

L002ce0:
	tst.w	d5
	beq	L002cec
	cmpi.w	#$0003,d5
	bne	L001102
L002cec:
	bsr	L001290
	cmpi.w	#$0014,d2
	beq	L002d28
	cmpi.w	#$0001,d2
	bhi	L001102
	bne	L002d04
	bset.l	#$03,d3
L002d04:
	lsl.w	#4,d3
	move.b	d3,(a4)
	bset.b	#$00,($012b,a6)
	bsr	L00128a
	cmpi.w	#$0014,d2
	bne	L001102
	cmpi.w	#$0003,d3
	bcs	L001102
	bsr	L002d4c
	addq.l	#2,a4
	rts

L002d28:
	cmpi.w	#$0003,d3
	bcs	L001102
	bsr	L002d4c
	bsr	L00128a
	cmpi.w	#$0001,d2
	bhi	L001102
	bne	L002d44
	bset.l	#$03,d3
L002d44:
	lsl.w	#4,d3
	or.b	d3,(a4)
	addq.l	#2,a4
	rts

L002d4c:
	lea.l	(L002d66),a0
	subq.w	#3,d3
	cmpi.w	#$000f,d3
	bhi	L001102
	lsl.w	#1,d3
	move.w	(a0,d3.w),d0
	or.w	d0,(a4)
	rts

L002d66:
	.dc.b	$08,$00,$00,$00,$00,$01,$00,$02,$08,$01,$08,$02,$08,$03,$08,$04
	.dc.b	$00,$03,$00,$04,$00,$05,$00,$06,$00,$07,$08,$05,$08,$06,$08,$07
L002d86:
	tst.w	d5
	beq	L002d92
	cmpi.w	#$0003,d5
	bne	L001102
L002d92:
	bset.b	#$03,(a4)
L002d96:
	move.l	a4,-(a7)
	addq.l	#2,a4
	bsr	L0021a2
	bsr	L0018ce
	movea.l	(a7),a0
	move.b	d3,($0001,a0)
	jsr	(skpblk2)
	cmpi.b	#$3a,d0			;':'
	bne	L001102
	bsr	L0018d4
	movea.l	(a7)+,a0
	lsl.w	#4,d3
	or.b	d3,(a0)
	rts

L002dc2:
	tst.w	d5
	beq	L002d96
	cmpi.w	#$0003,d5
	beq	L002d96
	bra	L001102

L002dd0:
	tst.w	d5
	bne	L001102
	move.l	a4,-(a7)
	addq.l	#2,a4
	bsr	L001290
	cmpi.w	#$0001,d2
	bcs	L002dfe
	beq	L001102
	cmpi.w	#$0002,d2
	beq	L002dfe
	cmpi.w	#$0005,d2
	bcs	L001102
	cmpi.w	#$0012,d2
	bcc	L001102
L002dfe:
	bsr	L001c78
	movea.l	(a7)+,a0
	bsr	L002ec6
	rts

L002e0a:
	tst.w	d5
	bne	L001102
	move.l	a4,-(a7)
	addq.l	#2,a4
	bsr	L001290
	cmpi.w	#$0001,d2
	bcs	L002e38
	beq	L001102
	cmpi.w	#$0002,d2
	beq	L002e38
	cmpi.w	#$0005,d2
	bcs	L001102
	cmpi.w	#$0012,d2
	bcc	L001102
L002e38:
	bsr	L001c78
	movea.l	(a7),a0
	bsr	L002ec6
	bsr	L0018ce
	movea.l	(a7)+,a0
	lsl.w	#4,d3
	or.b	d3,(a0)
	rts

L002e4e:
	tst.w	d5
	bne	L001102
	move.l	a4,-(a7)
	addq.l	#2,a4
	bsr	L001290
	cmpi.w	#$0001,d2
	bcs	L002e7c
	beq	L001102
	cmpi.w	#$0002,d2
	beq	L002e7c
	cmpi.w	#$0005,d2
	bcs	L001102
	cmpi.w	#$000c,d2
	bcc	L001102
L002e7c:
	bsr	L001c78
	movea.l	(a7)+,a0
	bsr	L002ec6
	rts

L002e86:
	tst.w	d5
	bne	L001102
	bsr	L0018d4
	lsl.w	#4,d3
	or.b	d3,(a4)
	move.l	a4,-(a7)
	addq.l	#2,a4
	bsr	L00128a
	cmpi.w	#$0001,d2
	bcs	L002ebc
	beq	L001102
	cmpi.w	#$0002,d2
	beq	L002ebc
	cmpi.w	#$0005,d2
	bcs	L001102
	cmpi.w	#$000c,d2
	bcc	L001102
L002ebc:
	bsr	L001c78
	movea.l	(a7)+,a0
	bsr	L002ec6
	rts

L002ec6:
	move.l	a0,-(a7)
	jsr	(skpblk2)
	cmpi.b	#$7b,d0			;'{'
	bne	L001102
	jsr	(skpblk)
	cmpi.b	#$44,d0			;'D'
	bne	L002ef2
	bsr	L001afa
	movea.l	(a7),a0
	bset.b	#$03,(a0)
	lsl.w	#6,d3
	or.w	d3,(a0)
	bra	L002f14

L002ef2:
	movem.l	d2-d7,-(a7)
	jsr	(getexp2)
	movem.l	(a7)+,d2-d7
	bcs	L001102
	cmpi.l	#$0000001f,d1
	bhi	L001102
	lsl.w	#6,d1
	movea.l	(a7),a0
	or.w	d1,(a0)
L002f14:
	jsr	(skpblk2)
	cmpi.b	#$3a,d0			;':'
	bne	L001102
	jsr	(skpblk)
	cmpi.b	#$44,d0			;'D'
	bne	L002f50
	bsr	L001afa
	movea.l	(a7)+,a0
	bset.b	#$05,($0001,a0)
	or.w	d3,(a0)
	jsr	(skpblk2)
	cmpi.b	#$7d,d0			;'}'
	bne	L001102
	jmp	(skpblk)

L002f50:
	movem.l	d2-d7,-(a7)
	jsr	(getexp2)
	movem.l	(a7)+,d2-d7
	bcs	L001102
	tst.l	d1
	beq	L001102
	cmpi.l	#$00000020,d1
	bhi	L001102
	bne	L002f76
	clr.w	d1
L002f76:
	movea.l	(a7)+,a0
	or.w	d1,(a0)
	jsr	(skpblk2)
	cmpi.b	#$7d,d0			;'}'
	bne	L001102
	jmp	(skpblk)

L002f8e:
	cmpi.w	#$0001,d5
	beq	L001102
	cmpi.w	#$0003,d5
	bhi	L001102
	cmpi.w	#$0002,d5
	bcc	L002fb8
	jsr	(skpblk)
	cmpi.b	#$23,d0			;'#'
	beq	L002fba
	ori.w	#$0004,($012a,a6)
	rts

L002fb8:
	bhi	L002fc8
L002fba:
	ori.w	#$0002,($012a,a6)
	bsr	L001c04
	move.w	d1,(a4)+
	rts

L002fc8:
	ori.w	#$0003,($012a,a6)
	bsr	L001c04
	move.l	d1,(a4)+
	rts

L002fd6:
	tst.w	d5
	bne	L001102
	bsr	L001c04
	cmpi.l	#$00008000,d1
	blt	L002fec
	bsr	L001c4c
L002fec:
	cmpi.l	#$ffff8000,d1
	bge	L002ff8
	bsr	L001c4c
L002ff8:
	move.w	d1,(a4)+
	rts

L002ffc:
	move.w	#$0001,d0
	lsl.w	#8,d0
	lsl.w	#1,d0
	ori.w	#$f000,d0
	move.w	d0,($012a,a6)
	rts

L00300e:
	lea.l	(L003058),a0
	movem.l	d1-d3,-(a7)
	moveq.l	#$02,d0
	clr.w	d3
L00301c:
	movea.l	a5,a1
L00301e:
	tst.b	(a0)
	beq	L00304a
	movem.l	d0,-(a7)
	move.b	(a0)+,d0
	jsr	(toupper)
	cmp.b	(a1)+,d0
	movem.l	(a7)+,d0
	beq	L00301e
L003036:
	tst.b	(a0)+
	bne	L003036
	addq.w	#1,d3
	dbra	d0,L00301c
	ori.b	#$01,ccr
	movem.l	(a7)+,d1-d3
	rts

L00304a:
	movea.l	a1,a5
	moveq.l	#$01,d0
	lsl.w	d3,d0
	movem.l	(a7)+,d1-d3
	tst.w	d0
	rts

L003058:
	.dc.b	'FPIAR',$00
L00305e:
	.dc.b	'FPSR',$00
L003063:
	.dc.b	'FPCR',$00
L003068:
	jsr	(skpblk)
	jsr	(toupper)
	cmpi.b	#$46,d0			;'F'
	bne	L0030a2
	move.b	($0001,a5),d0
	jsr	(toupper)
	cmpi.b	#$50,d0			;'P'
	bne	L0030a2
	move.b	($0002,a5),d0
	cmpi.b	#$30,d0			;'0'
	bcs	L0030a2
	cmpi.b	#$37,d0			;'7'
	bhi	L0030a2
	addq.l	#3,a5
	andi.w	#$0007,d0
	rts

L0030a2:
	ori.b	#$01,ccr
	rts

L0030a8:
	cmpi.w	#$0004,d5
	beq	L001102
	move.w	d5,d0
	cmpi.w	#$0008,d0
	bhi	L001102
	lsl.w	#1,d0
	lea.l	(L0030cc),a0
	move.w	(a0,d0.w),d1
	lsl.w	#2,d1
	or.b	d1,(a4)
	rts

L0030cc:
	.dc.b	$00,$02,$00,$06,$00,$04,$00,$00,$00,$05,$00,$01,$00,$05,$00,$02
	.dc.b	$00,$03
L0030de:
	bsr	L002ffc
	bsr	L00300e
	bcs	L00311a
	tst.w	d5
	beq	L0030f4
	cmpi.w	#$0003,d5
	bne	L001102
L0030f4:
	move.w	#$a000,(a4)
	move.w	d0,-(a7)
	lsl.b	#2,d0
	or.b	d0,(a4)
	addq.l	#2,a4
	bsr	L001bc2
	move.w	(a7)+,d0
	cmpi.w	#$0001,d2
	bne	L003114
	cmpi.w	#$0001,d0
	bne	L001102
L003114:
	bsr	L001c78
	rts

L00311a:
	bsr	L003068
	bcs	L00321c
	cmpi.w	#$0008,d5
	bcc	L00317c
	move.w	d0,-(a7)
	jsr	(L001c3c)
	bsr	L003068
	bcs	L003150
	tst.w	d5
	beq	L003142
	cmpi.w	#$0007,d5
	bne	L001102
L003142:
	move.w	d0,d1
	move.w	(a7)+,d0
	lsl.b	#2,d0
	or.b	d0,(a4)
	lsl.w	#7,d1
	or.w	d1,(a4)+
	rts

L003150:
	move.w	(a7)+,d0
	move.w	#$6000,(a4)
	lsl.w	#7,d0
	or.w	d0,(a4)
	bsr	L0030a8
	addq.l	#2,a4
	bsr	L001bdc
	tst.w	d2
	bne	L003176
	cmpi.w	#$0003,d5
	bls	L003176
	cmpi.w	#$0005,d5
	bne	L001102
L003176:
	bsr	L001c78
	rts

L00317c:
	move.w	#$6000,(a4)
	lsl.w	#7,d0
	or.w	d0,(a4)
	bsr	L0030a8
	move.l	a4,-(a7)
	addq.l	#2,a4
	bsr	L001bd6
	tst.w	d2
	beq	L001102
	bsr	L001c78
	jsr	(skpblk2)
	cmpi.b	#$7b,d0			;'{'
	bne	L001102
	jsr	(skpblk)
	cmpi.b	#$23,d0			;'#'
	beq	L0031e0
	jsr	(toupper)
	cmpi.b	#$44,d0			;'D'
	bne	L001102
	bsr	L0018d4
	jsr	(skpblk2)
	cmpi.b	#$7d,d0			;'}'
	bne	L001102
	movea.l	(a7)+,a0
	bset.b	#$04,(a0)
	lsl.w	#4,d3
	or.w	d3,(a0)
	rts

L0031e0:
	addq.l	#1,a5
	jsr	(getexp2)
	bcs	L001102
	jsr	(skpblk2)
	cmpi.b	#$7d,d0			;'}'
	bne	L001102
	cmpi.l	#$ffffffc0,d1
	bge	L003206
	bsr	L001c4c
L003206:
	cmpi.l	#$0000003f,d1
	ble	L003212
	bsr	L001c4c
L003212:
	andi.w	#$007f,d1
	movea.l	(a7)+,a0
	or.w	d1,(a0)
	rts

L00321c:
	bset.b	#$06,(a4)
	bsr	L0030a8
	move.l	a4,-(a7)
	addq.l	#2,a4
	move.w	#$00ff,($0834,a6)
	move.l	a5,-(a7)
	bsr	L001290
	move.w	d2,-(a7)
	cmpi.w	#$0001,d2
	bcc	L00324a
	cmpi.w	#$0003,d5
	bls	L00324a
	cmpi.w	#$0005,d5
	bne	L001102
L00324a:
	bsr	L001c78
	jsr	(L001c3c)
	bsr	L00300e
	bcc	L003276
	move.w	(a7)+,d2
	addq.l	#4,a7
	cmpi.w	#$0001,d2
	beq	L001102
	bsr	L003068
	bcs	L001102
	lsl.w	#7,d0
	movea.l	(a7)+,a0
	or.w	d0,(a0)
	rts

L003276:
	movea.l	(a7)+,a5
	move.w	d0,-(a7)
	clr.w	($0834,a6)
	bsr	L001290
	move.w	(a7)+,d0
	cmpi.w	#$0001,d2
	bne	L003292
	cmpi.w	#$0001,d0
	bne	L001102
L003292:
	tst.w	d5
	beq	L00329e
	cmpi.w	#$0003,d5
	bne	L001102
L00329e:
	bsr	L001c78
	jsr	(L001c3c)
	bsr	L00300e
	bcs	L001102
	movea.l	(a7)+,a0
	move.w	#$8000,(a0)
	lsl.w	#2,d0
	or.b	d0,(a0)
	rts

L0032bc:
	bsr	L002ffc
	move.w	d6,(a4)
	bsr	L003068
	bcc	L003320
	bset.b	#$06,(a4)
	bsr	L0030a8
	move.l	a4,-(a7)
	addq.l	#2,a4
	move.w	#$00ff,($0834,a6)
	bsr	L001290
	cmpi.w	#$0001,d2
	beq	L001102
	bhi	L0032fc
	tst.w	d5
	beq	L001102
	cmpi.w	#$0003,d5
	bls	L0032fc
	cmpi.w	#$0005,d5
	bne	L001102
L0032fc:
	bsr	L001c78
	cmpi.w	#$003a,d6		;':'
	bne	L00330a
	addq.l	#4,a7
	rts

L00330a:
	jsr	(L001c3c)
	bsr	L003068
	bcs	L001102
	lsl.w	#7,d0
	movea.l	(a7)+,a0
	or.w	d0,(a0)
	rts

L003320:
	tst.w	d5
	beq	L00332c
	cmpi.w	#$0007,d5
	bne	L001102
L00332c:
	move.w	d0,-(a7)
	lsl.w	#2,d0
	or.b	d0,(a4)
	cmpi.w	#$003a,d6		;':'
	bne	L00333e
	addq.l	#2,a7
	addq.l	#2,a4
	rts

L00333e:
	jsr	(skpblk)
	cmpi.b	#$2c,d0			;','
	beq	L003352
	move.w	(a7)+,d0
	lsl.w	#7,d0
	or.w	d0,(a4)+
	rts

L003352:
	addq.l	#2,a7
	addq.l	#1,a5
	bsr	L003068
	bcs	L001102
	lsl.w	#7,d0
	or.w	d0,(a4)+
	rts

L003364:
	bsr	L002ffc
	move.w	d6,(a4)
	bsr	L003068
	bcc	L0033d4
	bset.b	#$06,(a4)
	bsr	L0030a8
	move.l	a4,-(a7)
	addq.l	#2,a4
	move.w	#$00ff,($0834,a6)
	bsr	L001290
	cmpi.w	#$0001,d2
	beq	L001102
	bhi	L00339e
	cmpi.w	#$0003,d5
	bls	L00339e
	cmpi.w	#$0005,d5
	bne	L001102
L00339e:
	bsr	L001c78
	jsr	(L001c3c)
	bsr	L003068
	bcs	L001102
	movea.l	(a7),a0
	or.b	d0,($0001,a0)
	jsr	(skpblk2)
	cmpi.b	#$3a,d0			;':'
	bne	L001102
	bsr	L003068
	bcs	L001102
	lsl.w	#7,d0
	movea.l	(a7)+,a0
	or.w	d0,(a0)
	rts

L0033d4:
	tst.w	d5
	beq	L0033e0
	cmpi.w	#$0007,d5
	bne	L001102
L0033e0:
	lsl.w	#2,d0
	or.b	d0,(a4)
	jsr	(L001c3c)
	bsr	L003068
	bcs	L001102
	or.b	d0,($0001,a0)
	jsr	(skpblk2)
	cmpi.b	#$3a,d0			;':'
	bne	L001102
	bsr	L003068
	bcs	L001102
	lsl.w	#7,d0
	or.w	d0,(a4)+
	rts

L003412:
	bsr	L002ffc
	move.w	#$5c00,(a4)
	tst.w	d5
	beq	L003426
	cmpi.w	#$0007,d5
	bne	L001102
L003426:
	jsr	(skpblk2)
	cmpi.b	#$23,d0			;'#'
	bne	L001102
	jsr	(getexp2)
	bcs	L001102
	andi.w	#$007f,d1
	or.w	d1,(a4)
	jsr	(L001c3c)
	bsr	L003068
	bcs	L001102
	lsl.w	#7,d0
	or.w	d0,(a4)+
	rts

L003458:
	bsr	L002ffc
	tst.w	d5
	beq	L003468
	cmpi.w	#$0007,d5
	bne	L001102
L003468:
	bsr	L00300e
	bcs	L0034da
	move.w	d0,-(a7)
	moveq.l	#$03,d4
L003472:
	jsr	(skpblk)
	cmpi.b	#$2f,d0			;'/'
	bne	L003492
	addq.l	#1,a5
	bsr	L00300e
	bcs	L001102
	or.w	d0,(a7)
	dbra	d4,L003472
	bra	L001102

L003492:
	clr.w	d4
	cmpi.b	#$2c,d0			;','
	bne	L001102
	addq.l	#1,a5
	move.w	#$a000,(a4)
	move.w	(a7),d0
	lsl.w	#2,d0
	or.b	d0,(a4)+
	addq.l	#1,a4
	bsr	L001290
	move.w	(a7)+,d0
	cmpi.w	#$0001,d2
	bcc	L0034cc
	cmpi.w	#$0001,d0
	beq	L0034d6
	cmpi.w	#$0002,d0
	beq	L0034d6
	cmpi.w	#$0004,d0
	bne	L001102
	bra	L0034d6

L0034cc:
	bhi	L0034d6
	cmpi.w	#$0001,d0
	bne	L001102
L0034d6:
	bra	L001c78

L0034da:
	move.l	a5,-(a7)
	bsr	L003068
	bcs	L003520
	movea.l	(a7)+,a5
	bsr	L003626
	move.w	#$e000,(a4)
	or.w	d1,(a4)
	bsr	L00128a
	cmpi.w	#$0002,d2
	bcs	L001102
	cmpi.w	#$0004,d2
	bne	L003506
	bsr	L00369a
	bra	L00351a

L003506:
	bset.b	#$04,(a4)
	cmpi.w	#$0003,d2
	beq	L001102
	cmpi.w	#$0012,d2
	bcc	L001102
L00351a:
	addq.l	#2,a4
	bra	L001c78

L003520:
	movea.l	(a7)+,a5
	bsr	L001290
	movem.l	d1-d5,-(a7)
	jsr	(L001c3c)
	bsr	L00300e
	bcs	L003596
	move.w	d0,-(a7)
	moveq.l	#$03,d4
L00353a:
	jsr	(skpblk)
	cmpi.b	#$2f,d0			;'/'
	bne	L00355a
	addq.l	#1,a5
	bsr	L00300e
	bcs	L001102
	or.w	d0,(a7)
	dbra	d4,L00353a
	bra	L001102

L00355a:
	move.w	(a7)+,d0
	movem.l	(a7)+,d1-d5
	move.w	#$8000,(a4)
	cmpi.w	#$0001,d2
	bcc	L003580
	cmpi.w	#$0001,d0
	beq	L00358a
	cmpi.w	#$0002,d0
	beq	L00358a
	cmpi.w	#$0004,d0
	beq	L00358a
	bra	L001102

L003580:
	bhi	L00358a
	cmpi.w	#$0001,d0
	bne	L001102
L00358a:
	lsl.w	#2,d0
	or.b	d0,(a4)+
	addq.l	#1,a4
	bsr	L001c78
	rts

L003596:
	movem.l	(a7),d1-d5
	cmpi.w	#$0001,d2
	beq	L001102
	bhi	L0035de
	movem.l	(a7)+,d1-d5
	move.w	#$e800,(a4)
	lsl.w	#4,d3
	or.w	d3,(a4)
	bsr	L001290
	cmpi.w	#$0001,d2
	bls	L001102
	cmpi.w	#$000c,d2
	bcc	L001102
	cmpi.w	#$0003,d2
	beq	L001102
	cmpi.w	#$0004,d2
	beq	L0035d6
	bset.b	#$04,(a4)
L0035d6:
	addq.l	#2,a4
	bsr	L001c78
	rts

L0035de:
	move.l	a5,-(a7)
	bsr	L003068
	bcs	L003612
	movea.l	(a7)+,a5
	bsr	L003626
	move.w	#$d000,(a4)
	or.w	d1,(a4)+
	movem.l	(a7)+,d1-d5
L0035f4:
	cmpi.w	#$0002,d2
	bcs	L001102
	cmpi.w	#$0012,d2
	bcc	L001102
	cmpi.w	#$0004,d2
	beq	L001102
	bsr	L001c78
	rts

L003612:
	movea.l	(a7)+,a5
	bsr	L0018d4
	move.w	#$d800,(a4)
	lsl.w	#4,d3
	or.w	d3,(a4)+
	movem.l	(a7)+,d1-d5
	bra	L0035f4

L003626:
	movem.l	d2-d5,-(a7)
	clr.w	d5
	moveq.l	#$0a,d4
	bsr	L003068
	bcs	L001102
	bra	L00363c

L003638:
	bsr	L003068
L00363c:
	bset.l	d0,d5
	move.w	d0,d3
	jsr	(skpblk)
	cmpi.b	#$2d,(a5)		;'-'
	beq	L003660
	cmpi.b	#$2f,(a5)+		;'/'
	dbne	d4,L003638
	subq.l	#1,a5
L003656:
	move.w	d5,d1
	bsr	L003684
	movem.l	(a7)+,d2-d5
	rts

L003660:
	addq.l	#1,a5
	bsr	L003068
	cmp.w	d0,d3
	bcc	L001102
L00366c:
	bset.l	d3,d5
	addq.w	#1,d3
	cmp.w	d3,d0
	bcc	L00366c
	jsr	(skpblk)
	cmpi.b	#$2f,(a5)+		;'/'
	beq	L003638
	subq.l	#1,a5
	bra	L003656

L003684:
	clr.w	d0
	clr.w	d3
	moveq.l	#$07,d2
L00368a:
	btst.l	d2,d1
	beq	L003690
	bset.l	d0,d3
L003690:
	addq.w	#1,d0
	dbra	d2,L00368a
	move.w	d3,d1
	rts

L00369a:
	movem.l	d0-d7,-(a7)
	move.w	(a4),d1
	bsr	L003684
	move.b	d1,($0001,a4)
	movem.l	(a7)+,d0-d7
	rts

L0036ac:
	bsr	L002ffc
	bset.b	#$06,($012b,a6)
	move.w	d6,(a4)+
	cmpi.w	#$0001,d5
	bhi	L001102
	bra	L00220e

L0036c4:
	cmpi.w	#$0003,d5
	bcc	L001102
	bsr	L002ffc
	bset.b	#$06,($012b,a6)
	bset.b	#$03,($012b,a6)
	bsr	L0018d4
	or.w	d3,($012a,a6)
	move.w	d6,(a4)+
	tst.w	d5
	beq	L0036f2
	cmpi.w	#$0002,d5
	bne	L001102
L0036f2:
	bsr	L00128a
	cmpi.w	#$000c,d2
	beq	L00370e
	bhi	L001102
	cmpi.w	#$000a,d2
	bcs	L001102
	subq.l	#2,d1
	sub.l	($0036,a6),d1
L00370e:
	bra	L002a60

L003712:
	bsr	L002ffc
	move.w	d6,(a4)+
	cmpi.w	#$0001,d5
	beq	L001102
	cmpi.w	#$0003,d5
	bhi	L001102
	cmpi.w	#$0002,d5
	bcs	L00374c
	bhi	L00373e
L003730:
	ori.w	#$007a,($012a,a6)
	bsr	L001c04
	move.w	d1,(a4)+
	rts

L00373e:
	ori.w	#$007b,($012a,a6)
	bsr	L001c04
	move.l	d1,(a4)+
	rts

L00374c:
	jsr	(skpblk)
	cmpi.b	#$23,d0			;'#'
	beq	L003730
	ori.w	#$007c,($012a,a6)
	rts

L003760:
	bsr	L002ffc
	ori.w	#$0080,($012a,a6)
	or.w	d6,($012a,a6)
	bsr	L001290
	cmpi.w	#$000c,d2
	beq	L00378a
	bhi	L001102
	cmpi.w	#$000a,d2
	bcs	L001102
	subq.l	#2,d1
	sub.l	($0036,a6),d1
L00378a:
	cmpi.w	#$0001,d5
	beq	L001102
	cmpi.w	#$0003,d5
	bhi	L001102
	bne	L0037a6
	bset.b	#$06,($012b,a6)
	move.l	d1,(a4)+
	rts

L0037a6:
	bra	L002a60

L0037aa:
	tst.w	d5
	bne	L001102
	bsr	L002ffc
	bset.b	#$07,($012b,a6)
	clr.w	(a4)+
	rts

L0037be:
	tst.w	d5
	bne	L001102
	bsr	L002ffc
	ori.w	#$0140,($012a,a6)
	bsr	L001290
	cmpi.w	#$0002,d2
	bcs	L001102
	cmpi.w	#$0004,d2
	beq	L001102
	cmpi.w	#$0012,d2
	bcc	L001102
	bra	L001c78

L0037ee:
	tst.w	d5
	bne	L001102
	bsr	L002ffc
	ori.w	#$0100,($012a,a6)
	bsr	L001290
	cmpi.w	#$0002,d2
	bcs	L001102
	cmpi.w	#$0003,d2
	beq	L001102
	cmpi.w	#$000c,d2
	bcc	L001102
	bra	L001c78

L00381e:
	move.w	#$f000,($012a,a6)
	rts

L003826:
	lea.l	(L00386e),a0
	movem.l	d1-d3,-(a7)
	moveq.l	#$0b,d0
	clr.w	d3
L003834:
	movea.l	a5,a1
L003836:
	tst.b	(a0)
	beq	L003862
	movem.l	d0,-(a7)
	move.b	(a1)+,d0
	jsr	(toupper)
	cmp.b	(a0)+,d0
	movem.l	(a7)+,d0
	beq	L003836
L00384e:
	tst.b	(a0)+
	bne	L00384e
	addq.w	#1,d3
	dbra	d0,L003834
	ori.b	#$01,ccr
	movem.l	(a7)+,d1-d3
	rts

L003862:
	movea.l	a1,a5
	move.l	d3,d0
	movem.l	(a7)+,d1-d3
	tst.w	d0
	rts

L00386e:
	.dc.b	$54,$43,$00,$44,$52,$50,$00,$53,$52,$50,$00,$43,$52,$50,$00,$43
	.dc.b	$41,$4c,$00,$56,$41,$4c,$00,$53,$43,$43,$00,$41,$43,$00,$4d,$4d
	.dc.b	$55,$53,$52,$00,$50,$43,$53,$52,$00,$54,$54,$30,$00,$54,$54,$31
	.dc.b	$00,$00
L0038a0:
	jsr	(skpblk)
	jsr	(toupper)
	cmpi.b	#$42,d0			;'B'
	bne	L0038ea
	move.b	($0001,a5),d0
	jsr	(toupper)
	cmpi.b	#$41,d0			;'A'
	bne	L0038ea
	move.b	($0002,a5),d0
	jsr	(toupper)
	cmpi.b	#$44,d0			;'D'
	bne	L0038ea
	move.b	($0003,a5),d0
	cmpi.b	#$30,d0			;'0'
	bcs	L0038ea
	cmpi.b	#$37,d0			;'7'
	bhi	L0038ea
	addq.l	#4,a5
	andi.w	#$0007,d0
	rts

L0038ea:
	ori.b	#$01,ccr
	rts

L0038f0:
	jsr	(skpblk)
	jsr	(toupper)
	cmpi.b	#$42,d0			;'B'
	bne	L00393a
	move.b	($0001,a5),d0
	jsr	(toupper)
	cmpi.b	#$41,d0			;'A'
	bne	L00393a
	move.b	($0002,a5),d0
	jsr	(toupper)
	cmpi.b	#$43,d0			;'C'
	bne	L00393a
	move.b	($0003,a5),d0
	cmpi.b	#$30,d0			;'0'
	bcs	L00393a
	cmpi.b	#$37,d0			;'7'
	bhi	L00393a
	addq.l	#4,a5
	andi.w	#$0007,d0
	rts

L00393a:
	ori.b	#$01,ccr
	rts

L003940:
	bsr	L00381e
	bsr	L003826
	bcs	L0039d6
	bsr	L003c46
	cmpi.w	#$0008,d0
	bcc	L0039b6
	bset.b	#$06,(a4)
	bset.b	#$01,(a4)
	move.w	d0,-(a7)
	lsl.w	#2,d0
	ori.b	#$01,(a4)
	or.b	d0,(a4)+
	addq.l	#1,a4
	bsr	L00128a
	cmpi.w	#$0002,d2
	bcs	L001102
	cmpi.w	#$000c,d2
	bcc	L001102
	cmpi.w	#$0003,d2
	beq	L001102
	cmpi.w	#$0004,d2
	beq	L001102
	cmpi.w	#$000a,d2
	beq	L001102
	cmpi.w	#$000b,d2
	beq	L001102
	move.w	(a7)+,d0
	cmpi.w	#$0001,d2
	bhi	L0039b2
	cmpi.w	#$0003,d0
	bhi	L0039b2
	tst.w	d0
	bne	L001102
L0039b2:
	bra	L001c78

L0039b6:
	cmpi.b	#$0a,d0
	beq	L0039c6
	cmpi.b	#$0b,d0
	beq	L0039ce
	bra	L001102

L0039c6:
	ori.w	#$0b00,(a4)+
	bra	L0021c0

L0039ce:
	ori.w	#$0f00,(a4)+
	bra	L0021c0

L0039d6:
	bsr	L0038a0
	bcs	L0039f6
	ori.w	#$7300,(a4)
L0039e0:
	lsl.w	#2,d0
	or.w	d0,(a4)+
	tst.w	d5
	beq	L0021c0
	cmpi.w	#$0002,d5
	bne	L001102
	bra	L0021c0

L0039f6:
	bsr	L0038f0
	bcs	L003a02
	ori.w	#$7700,(a4)
	bra	L0039e0

L003a02:
	bsr	L001290
	cmpi.w	#$0002,d2
	bcs	L001102
	cmpi.w	#$000c,d2
	bcc	L001102
	cmpi.w	#$0003,d2
	beq	L001102
	cmpi.w	#$0004,d2
	beq	L001102
	cmpi.w	#$000a,d2
	beq	L001102
	cmpi.w	#$000b,d2
	beq	L001102
	movem.l	d1-d5,-(a7)
	jsr	(L001c3c)
	jsr	(skpblk)
	bsr	L003826
	bcs	L003a98
	bsr	L003c46
	cmpi.b	#$0a,d0
	beq	L003a80
	cmpi.b	#$0b,d0
	beq	L003a8c
	cmpi.w	#$0009,d0
	beq	L001102
	movem.l	(a7)+,d1-d5
	cmpi.w	#$0008,d0
	bcc	L003a7c
	ori.w	#$4100,(a4)
	lsl.w	#2,d0
	or.b	d0,(a4)
	addq.l	#2,a4
	bra	L001c78

L003a7c:
	bra	L001102

L003a80:
	movem.l	(a7)+,d1-d5
	ori.w	#$0900,(a4)+
	bra	L001c78

L003a8c:
	movem.l	(a7)+,d1-d5
	ori.w	#$0d00,(a4)+
	bra	L001c78

L003a98:
	bsr	L0038a0
	bcs	L003aae
	ori.w	#$7100,(a4)
L003aa2:
	lsl.w	#2,d0
	or.w	d0,(a4)+
	movem.l	(a7)+,d1-d5
	bra	L001c78

L003aae:
	bsr	L0038f0
	bcs	L001102
	ori.w	#$7500,(a4)
	bra	L003aa2

L003abc:
	bsr	L00381e
	bsr	L003826
	bcs	L003b5e
	bsr	L003c46
	cmpi.w	#$0008,d0
	bcc	L003b2e
	bset.b	#$06,(a4)
	bset.b	#$01,(a4)
	move.w	d0,-(a7)
	lsl.w	#2,d0
	or.b	d0,(a4)+
	addq.l	#1,a4
	bsr	L00128a
	cmpi.w	#$0002,d2
	bcs	L001102
	cmpi.w	#$000c,d2
	bcc	L001102
	cmpi.w	#$0003,d2
	beq	L001102
	cmpi.w	#$0004,d2
	beq	L001102
	cmpi.w	#$000a,d2
	beq	L001102
	cmpi.w	#$000b,d2
	beq	L001102
	move.w	(a7)+,d0
	cmpi.w	#$0001,d2
	bhi	L003b2a
	cmpi.w	#$0003,d0
	bhi	L003b2a
	tst.w	d0
	bne	L001102
L003b2a:
	bra	L001c78

L003b2e:
	cmpi.b	#$0a,d0
	beq	L003b4e
	cmpi.b	#$0b,d0
	beq	L003b56
	ori.w	#$6200,(a4)
	cmpi.w	#$0008,d0
	beq	L003b48
	bset.b	#$02,(a4)
L003b48:
	addq.l	#2,a4
	bra	L0021c0

L003b4e:
	ori.w	#$0a00,(a4)+
	bra	L0021c0

L003b56:
	ori.w	#$0e00,(a4)+
	bra	L0021c0

L003b5e:
	bsr	L0038a0
	bcs	L003b7e
	ori.w	#$7200,(a4)
L003b68:
	lsl.w	#2,d0
	or.w	d0,(a4)+
	tst.w	d5
	beq	L0021c0
	cmpi.w	#$0002,d5
	bne	L001102
	bra	L0021c0

L003b7e:
	bsr	L0038f0
	bcs	L003b8a
	ori.w	#$7600,(a4)
	bra	L003b68

L003b8a:
	bsr	L001290
	cmpi.w	#$0002,d2
	bcs	L001102
	cmpi.w	#$000c,d2
	bcc	L001102
	cmpi.w	#$0003,d2
	beq	L001102
	cmpi.w	#$0004,d2
	beq	L001102
	cmpi.w	#$000a,d2
	beq	L001102
	cmpi.w	#$000b,d2
	beq	L001102
	movem.l	d1-d5,-(a7)
	jsr	(L001c3c)
	jsr	(skpblk)
	bsr	L003826
	bcs	L003c22
	bsr	L003c46
	cmpi.b	#$0a,d0
	beq	L003c0a
	cmpi.b	#$0b,d0
	beq	L003c16
	cmpi.w	#$0009,d0
	beq	L001102
	movem.l	(a7)+,d1-d5
	cmpi.w	#$0008,d0
	bcc	L003c02
	ori.w	#$4000,(a4)
	lsl.w	#2,d0
	or.b	d0,(a4)
	addq.l	#2,a4
	bra	L001c78

L003c02:
	ori.w	#$6000,(a4)+
	bra	L001c78

L003c0a:
	movem.l	(a7)+,d1-d5
	ori.w	#$0800,(a4)+
	bra	L001c78

L003c16:
	movem.l	(a7)+,d1-d5
	ori.w	#$0c00,(a4)+
	bra	L001c78

L003c22:
	bsr	L0038a0
	bcs	L003c38
	ori.w	#$7000,(a4)
L003c2c:
	lsl.w	#2,d0
	or.w	d0,(a4)+
	movem.l	(a7)+,d1-d5
	bra	L001c78

L003c38:
	bsr	L0038f0
	bcs	L001102
	ori.w	#$7400,(a4)
	bra	L003c2c

L003c46:
	cmpi.w	#$000a,d0
	bcc	L003c8a
	tst.w	d5
	beq	L003c88
	cmpi.w	#$0001,d0
	bcc	L003c60
	cmpi.w	#$0003,d5
	bne	L001102
	rts

L003c60:
	cmpi.w	#$0004,d0
	bcc	L003c70
	cmpi.w	#$0004,d5
	bne	L001102
	rts

L003c70:
	cmpi.w	#$0007,d0
	bcc	L003c80
	cmpi.w	#$0001,d5
	bne	L001102
	rts

L003c80:
	cmpi.w	#$0002,d5
	bne	L001102
L003c88:
	rts

L003c8a:
	rts

L003c8c:
	tst.w	d5
	bne	L001102
	bsr	L00381e
	move.w	#$2000,(a4)
	move.l	a4,-(a7)
	jsr	(skpblk)
	bsr	L0011ee
	bcs	L003cbe
	cmpi.w	#$0004,d3
	bne	L003cb0
	bra	L003d04

L003cb0:
	cmpi.w	#$0005,d3
	bne	L001102
	ori.w	#$0001,(a4)
	bra	L003d04

L003cbe:
	jsr	(skpblk)
	jsr	(toupper)
	cmpi.b	#$44,d0			;'D'
	bne	L003cdc
	bsr	L0018d4
	ori.w	#$0008,d3
	or.w	d3,(a4)
	bra	L003d04

L003cdc:
	movem.l	d2-d7,-(a7)
	jsr	(getexp2)
	movem.l	(a7)+,d2-d7
	bcs	L001102
	cmpi.l	#$0000000f,d1
	bls	L003cfa
	bsr	L001c4c
L003cfa:
	andi.w	#$000f,d1
	ori.w	#$0010,d1
	or.w	d1,(a4)
L003d04:
	addq.l	#2,a4
	jsr	(L001c3c)
	jsr	(skpblk2)
	cmpi.b	#$23,d0			;'#'
	bne	L001102
	movem.l	d2-d7,-(a7)
	jsr	(getexp2)
	movem.l	(a7)+,d2-d7
	bcs	L001102
	cmpi.l	#$0000000f,d1
	bls	L003d38
	bsr	L001c4c
L003d38:
	andi.w	#$000f,d1
	movea.l	(a7),a0
	lsl.w	#5,d1
	or.w	d1,(a0)
	jsr	(skpblk)
	cmpi.b	#$2c,d0			;','
	beq	L003d56
	movea.l	(a7)+,a0
	ori.w	#$1000,(a0)
	rts

L003d56:
	addq.l	#1,a5
	movea.l	(a7)+,a0
	ori.w	#$1800,(a0)
	bra	L00221a

L003d62:
	tst.w	d5
	bne	L001102
	bsr	L00381e
	ori.w	#$2400,(a4)+
	rts

L003d72:
	tst.w	d5
	bne	L001102
	bsr	L00381e
	move.w	#$2000,(a4)
	move.l	a4,-(a7)
	jsr	(skpblk)
	bsr	L0011ee
	bcs	L003da4
	cmpi.w	#$0004,d3
	bne	L003d96
	bra	L003dea

L003d96:
	cmpi.w	#$0005,d3
	bne	L001102
	ori.w	#$0001,(a4)
	bra	L003dea

L003da4:
	jsr	(skpblk)
	jsr	(toupper)
	cmpi.b	#$44,d0			;'D'
	bne	L003dc2
	bsr	L0018d4
	ori.w	#$0008,d3
	or.w	d3,(a4)
	bra	L003dea

L003dc2:
	movem.l	d2-d7,-(a7)
	jsr	(getexp2)
	movem.l	(a7)+,d2-d7
	bcs	L001102
	cmpi.l	#$0000000f,d1
	bls	L003de0
	bsr	L001c4c
L003de0:
	andi.w	#$000f,d1
	ori.w	#$0010,d1
	or.w	d1,(a4)
L003dea:
	jsr	(L001c3c)
	addq.l	#2,a4
	jsr	(skpblk2)
	cmpi.b	#$23,d0			;'#'
	bne	L001102
	movem.l	d2-d7,-(a7)
	jsr	(getexp2)
	movem.l	(a7)+,d2-d7
	bcs	L001102
	cmpi.l	#$0000000f,d1
	bls	L003e1e
	bsr	L001c4c
L003e1e:
	andi.w	#$000f,d1
	movea.l	(a7),a0
	lsl.w	#5,d1
	or.w	d1,(a0)
	jsr	(skpblk)
	cmpi.b	#$2c,d0			;','
	beq	L003e3c
	movea.l	(a7)+,a0
	ori.w	#$1400,(a0)
	rts

L003e3c:
	addq.l	#1,a5
	movea.l	(a7)+,a0
	ori.w	#$1c00,(a0)
	bra	L00221a

L003e48:
	tst.w	d5
	bne	L001102
	bsr	L00381e
	move.w	#$a000,(a4)+
	bra	L0021ae

L003e5a:
	tst.w	d5
	bne	L001102
	bsr	L00381e
	move.w	d6,(a4)
	jsr	(skpblk)
	bsr	L0011ee
	bcs	L003e88
	cmpi.w	#$0004,d3
	bne	L003e7a
	bra	L003ece

L003e7a:
	cmpi.w	#$0005,d3
	bne	L001102
	ori.w	#$0001,(a4)
	bra	L003ece

L003e88:
	jsr	(skpblk)
	jsr	(toupper)
	cmpi.b	#$44,d0			;'D'
	bne	L003ea6
	bsr	L0018d4
	ori.w	#$0008,d3
	or.w	d3,(a4)
	bra	L003ece

L003ea6:
	movem.l	d2-d7,-(a7)
	jsr	(getexp2)
	movem.l	(a7)+,d2-d7
	bcs	L001102
	cmpi.l	#$0000000f,d1
	bls	L003ec4
	bsr	L001c4c
L003ec4:
	andi.w	#$000f,d1
	ori.w	#$0010,d1
	or.w	d1,(a4)
L003ece:
	addq.l	#2,a4
	bra	L002214

L003ed4:
	tst.w	d5
	bne	L001102
	bsr	L00381e
	move.w	d6,(a4)
	move.l	a4,-(a7)
	jsr	(skpblk)
	bsr	L0011ee
	bcs	L003f04
	cmpi.w	#$0004,d3
	bne	L003ef6
	bra	L003f4a

L003ef6:
	cmpi.w	#$0005,d3
	bne	L001102
	ori.w	#$0001,(a4)
	bra	L003f4a

L003f04:
	jsr	(skpblk)
	jsr	(toupper)
	cmpi.b	#$44,d0			;'D'
	bne	L003f22
	bsr	L0018d4
	ori.w	#$0008,d3
	or.w	d3,(a4)
	bra	L003f4a

L003f22:
	movem.l	d2-d7,-(a7)
	jsr	(getexp2)
	movem.l	(a7)+,d2-d7
	bcs	L001102
	cmpi.l	#$0000000f,d1
	bls	L003f40
	bsr	L001c4c
L003f40:
	andi.w	#$000f,d1
	ori.w	#$0010,d1
	or.w	d1,(a4)
L003f4a:
	addq.l	#2,a4
	bsr	L002214
	jsr	(L001c3c)
	jsr	(skpblk2)
	cmpi.b	#$23,d0			;'#'
	bne	L001102
	movem.l	d2-d7,-(a7)
	jsr	(getexp2)
	movem.l	(a7)+,d2-d7
	bcs	L001102
	cmpi.l	#$00000007,d1
	bls	L003f82
	bsr	L001c4c
L003f82:
	andi.w	#$0007,d1
	movea.l	(a7),a0
	lsl.w	#2,d1
	or.b	d1,(a0)
	jsr	(skpblk)
	cmpi.b	#$2c,d0			;','
	beq	L003f9e
	movea.l	(a7)+,a0
	tst.w	d0
	rts

L003f9e:
	addq.l	#1,a5
	jsr	(skpblk)
	bsr	L0018e0
	movea.l	(a7)+,a0
	ori.w	#$0008,d3
	lsl.w	#5,d3
	or.w	d3,(a0)
	rts

L003fb6:
	tst.w	d5
	beq	L003fc2
	cmpi.w	#$0003,d5
	bne	L001102
L003fc2:
	bsr	L00381e
	jsr	(skpblk)
	cmpi.b	#$41,d0			;'A'
	beq	L00400a
	jsr	(toupper)
	cmpi.b	#$56,d0			;'V'
	bne	L001102
	addq.l	#1,a5
	move.b	(a5)+,d0
	jsr	(toupper)
	cmpi.b	#$41,d0			;'A'
	bne	L001102
	move.b	(a5)+,d0
	jsr	(toupper)
	cmpi.b	#$4c,d0			;'L'
	bne	L001102
	move.w	#$2800,(a4)+
	bra	L002214

L00400a:
	bsr	L0018e0
	move.w	#$2c00,(a4)
	or.w	d3,(a4)+
	bra	L002214

L004018:
	cmpi.w	#$0001,d5
	bhi	L001102
	bsr	L00381e
	ori.w	#$0040,($012a,a6)
	move.w	d6,(a4)+
	bra	L002202

L004030:
	cmpi.w	#$0001,d5
	beq	L001102
	bsr	L00381e
	ori.w	#$0080,($012a,a6)
	cmpi.w	#$0003,d5
	bhi	L001102
	bne	L004052
	ori.w	#$0040,($012a,a6)
L004052:
	or.w	d6,($012a,a6)
	bsr	L001290
	cmpi.w	#$000c,d2
	beq	L004072
	bhi	L001102
	cmpi.w	#$000a,d2
	bcs	L001102
	subq.l	#2,d1
	sub.l	($0036,a6),d1
L004072:
	cmpi.w	#$0003,d5
	bne	L002a60
	move.l	d1,(a4)+
	rts

L00407e:
	cmpi.w	#$0003,d5
	bcc	L001102
	cmpi.w	#$0001,d5
	beq	L001102
	bsr	L00381e
	jsr	(skpblk)
	bsr	L0018d4
	ori.w	#$0048,($012a,a6)
	or.w	d3,($012a,a6)
	move.w	d6,(a4)+
	bsr	L00128a
	cmpi.w	#$000c,d2
	bhi	L001102
	beq	L0040c4
	cmpi.w	#$000a,d2
	bcs	L001102
	subq.l	#2,d1
	sub.l	($0036,a6),d1
L0040c4:
	bra	L002a60

L0040c8:
	cmpi.w	#$0003,d5
	bhi	L001102
	cmpi.w	#$0001,d5
	beq	L001102
	bsr	L00381e
	ori.w	#$0078,($012a,a6)
	move.w	d6,(a4)+
	cmpi.w	#$0002,d5
	bcc	L0040f2
	ori.w	#$0004,($012a,a6)
	rts

L0040f2:
	bhi	L004102
	ori.w	#$0002,($012a,a6)
	bsr	L001c04
	move.w	d1,(a4)+
	rts

L004102:
	ori.w	#$0003,($012a,a6)
	bsr	L001c04
	move.l	d1,(a4)+
	rts

L004110:
	tst.w	d5
	bne	L001102
	bsr	L00381e
	ori.w	#$0140,($012a,a6)
	bsr	L001290
	cmpi.w	#$0002,d2
	bcs	L001102
	cmpi.w	#$0004,d2
	beq	L001102
	cmpi.w	#$0012,d2
	bcc	L001102
	bra	L001c78

L004140:
	tst.w	d5
	bne	L001102
	bsr	L00381e
	ori.w	#$0100,($012a,a6)
	bsr	L001290
	cmpi.w	#$0002,d2
	bcs	L001102
	cmpi.w	#$0003,d2
	beq	L001102
	cmpi.w	#$000c,d2
	bcc	L001102
	bra	L001c78

L004170:
	rts

L004172:
	.dc.b	'ABCD',$00
L004177:
	.dc.b	$06,$c1,$00,$41,$44,$44,$00,$1b,$d0,$00,$41,$44,$44,$41,$00,$1c
	.dc.b	$d0,$c0,$41,$44,$44,$49,$00,$03,$06,$00,$41,$44,$44,$51,$00,$02
	.dc.b	$50,$00,$41,$44,$44,$58,$00,$04,$d1,$00,$41,$4e,$44,$00,$05,$c0
	.dc.b	$00,$41,$4e,$44,$49,$00,$09,$02,$00,$41,$53,$4c,$00,$07,$e1,$c0
	.dc.b	$41,$53,$52,$00,$07,$e0,$c0,$42,$43,$43,$00,$1e,$64,$00,$42,$43
	.dc.b	$53,$00,$1e,$65,$00,$42,$45,$51,$00,$1e,$67,$00,$42,$47,$45,$00
	.dc.b	$1e,$6c,$00,$42,$47,$54,$00,$1e,$6e,$00,$42,$48,$49,$00,$1e,$62
	.dc.b	$00,$42,$4b,$50,$54,$00,$19,$48,$48,$42,$4c,$45,$00,$1e,$6f,$00
	.dc.b	$42,$4c,$53,$00,$1e,$63,$00,$42,$4c,$54,$00,$1e,$6d,$00,$42,$4d
	.dc.b	$49,$00,$1e,$6b,$00,$42,$4e,$45,$00,$1e,$66,$00,$42,$50,$4c,$00
	.dc.b	$1e,$6a,$00,$42,$56,$43,$00,$1e,$68,$00,$42,$56,$53,$00,$1e,$69
	.dc.b	$00,$42,$43,$48,$47,$00,$08,$00,$40,$42,$43,$4c,$52,$00,$08,$00
	.dc.b	$80,$42,$52,$41,$00,$1e,$60,$00,$42,$53,$45,$54,$00,$08,$00,$c0
	.dc.b	$42,$53,$52,$00,$1e,$61,$00,$42,$54,$53,$54,$00,$21,$00,$00,$42
	.dc.b	$46,$54,$53,$54,$00,$2d,$e8,$c0,$42,$46,$45,$58,$54,$55,$00,$2e
	.dc.b	$e9,$c0,$42,$46,$43,$48,$47,$00,$2f,$ea,$c0,$42,$46,$45,$58,$54
	.dc.b	$53,$00,$2e,$eb,$c0,$42,$46,$43,$4c,$52,$00,$2f,$ec,$c0,$42,$46
	.dc.b	$46,$46,$4f,$00,$2e,$ed,$c0,$42,$46,$53,$45,$54,$00,$2f,$ee,$c0
	.dc.b	$42,$46,$49,$4e,$53,$00,$30,$ef,$c0,$43,$41,$4c,$4c,$4d,$00,$23
	.dc.b	$06,$c0,$43,$41,$53,$00,$27,$08,$c0,$43,$41,$53,$32,$00,$28,$08
	.dc.b	$fc,$43,$48,$4b,$00,$0a,$41,$80,$43,$48,$4b,$32,$00,$26,$00,$c0
	.dc.b	$43,$4c,$52,$00,$0b,$42,$00,$43,$4d,$50,$00,$0c,$b0,$00,$43,$4d
	.dc.b	$50,$32,$00,$25,$00,$c0,$43,$4d,$50,$41,$00,$1c,$b0,$c0,$43,$4d
	.dc.b	$50,$49,$00,$03,$0c,$00,$43,$4d,$50,$4d,$00,$0d,$b1,$08,$44,$42
	.dc.b	$43,$43,$00,$1f,$54,$c8,$44,$42,$43,$53,$00,$1f,$55,$c8,$44,$42
	.dc.b	$45,$51,$00,$1f,$57,$c8,$44,$42,$46,$00,$1f,$51,$c8,$44,$42,$52
	.dc.b	$41,$00,$1f,$51,$c8,$44,$42,$47,$45,$00,$1f,$5c,$c8,$44,$42,$47
	.dc.b	$54,$00,$1f,$5e,$c8,$44,$42,$48,$49,$00,$1f,$52,$c8,$44,$42,$4c
	.dc.b	$45,$00,$1f,$5f,$c8,$44,$42,$4c,$53,$00,$1f,$53,$c8,$44,$42,$4c
	.dc.b	$54,$00,$1f,$5d,$c8,$44,$42,$4d,$49,$00,$1f,$5b,$c8,$44,$42,$4e
	.dc.b	$45,$00,$1f,$56,$c8,$44,$42,$50,$4c,$00,$1f,$5a,$c8,$44,$42,$54
	.dc.b	$00,$1f,$50,$c8,$44,$42,$56,$43,$00,$1f,$58,$c8,$44,$42,$56,$53
	.dc.b	$00,$1f,$59,$c8,$44,$43,$00,$50,$00,$00,$44,$49,$56,$53,$00,$0a
	.dc.b	$81,$c0,$44,$49,$56,$55,$00,$0a,$80,$c0,$44,$49,$56,$53,$4c,$00
	.dc.b	$2b,$4c,$40,$44,$49,$56,$55,$4c,$00,$2c,$4c,$40,$45,$4f,$52,$00
	.dc.b	$0e,$b0,$00,$45,$4f,$52,$49,$00,$09,$0a,$00,$45,$58,$47,$00,$0f
	.dc.b	$c1,$00,$45,$58,$54,$00,$18,$48,$00,$45,$58,$54,$42,$00,$18,$49
	.dc.b	$c0,$49,$4c,$4c,$45,$47,$41,$4c,$00,$1d,$4a,$fc,$4a,$4d,$50,$00
	.dc.b	$11,$4e,$c0,$4a,$53,$52,$00,$11,$4e,$80,$4c,$45,$41,$00,$12,$41
	.dc.b	$c0,$4c,$49,$4e,$4b,$00,$13,$4e,$50,$4c,$53,$4c,$00,$07,$e3,$c8
	.dc.b	$4c,$53,$52,$00,$07,$e2,$c8,$4d,$4f,$56,$45,$00,$00,$00,$00,$4d
	.dc.b	$4f,$56,$45,$41,$00,$14,$00,$40,$4d,$4f,$56,$45,$43,$00,$2a,$4e
	.dc.b	$7a,$4d,$4f,$56,$45,$4d,$00,$01,$48,$80,$4d,$4f,$56,$45,$50,$00
	.dc.b	$1a,$01,$08,$4d,$4f,$56,$45,$51,$00,$16,$70,$00,$4d,$4f,$56,$45
	.dc.b	$53,$00,$29,$0e,$00,$4d,$55,$4c,$53,$00,$0a,$c1,$c0,$4d,$55,$4c
	.dc.b	$55,$00,$0a,$c0,$c0,$4e,$42,$43,$44,$00,$15,$48,$00,$4e,$45,$47
	.dc.b	$00,$0b,$44,$00,$4e,$45,$47,$58,$00,$0b,$40,$00,$4e,$4f,$50,$00
	.dc.b	$1d,$4e,$71,$4e,$4f,$54,$00,$0b,$46,$00,$4f,$52,$00,$05,$80,$00
	.dc.b	$4f,$52,$49,$00,$09,$00,$00,$50,$41,$43,$4b,$00,$06,$81,$40,$50
	.dc.b	$45,$41,$00,$22,$48,$40,$52,$45,$53,$45,$54,$00,$1d,$4e,$70,$52
	.dc.b	$4f,$4c,$00,$07,$e7,$d8,$52,$4f,$52,$00,$07,$e6,$d8,$52,$4f,$58
	.dc.b	$4c,$00,$07,$e5,$d0,$52,$4f,$58,$52,$00,$07,$e4,$d0,$52,$54,$44
	.dc.b	$00,$32,$4e,$74,$52,$54,$45,$00,$1d,$4e,$73,$52,$54,$4d,$00,$24
	.dc.b	$06,$c0,$52,$54,$52,$00,$1d,$4e,$77,$52,$54,$53,$00,$1d,$4e,$75
	.dc.b	$53,$42,$43,$44,$00,$06,$81,$00,$53,$43,$43,$00,$20,$54,$c0,$53
	.dc.b	$43,$53,$00,$20,$55,$c0,$53,$45,$51,$00,$20,$57,$c0,$53,$46,$00
	.dc.b	$20,$51,$c0,$53,$47,$45,$00,$20,$5c,$c0,$53,$47,$54,$00,$20,$5e
	.dc.b	$c0,$53,$48,$49,$00,$20,$52,$c0,$53,$4c,$45,$00,$20,$5f,$c0,$53
	.dc.b	$4c,$53,$00,$20,$53,$c0,$53,$4c,$54,$00,$20,$5d,$c0,$53,$4d,$49
	.dc.b	$00,$20,$5b,$c0,$53,$4e,$45,$00,$20,$56,$c0,$53,$50,$4c,$00,$20
	.dc.b	$5a,$c0,$53,$54,$00,$20,$50,$c0,$53,$56,$43,$00,$20,$58,$c0,$53
	.dc.b	$56,$53,$00,$20,$59,$c0,$53,$54,$4f,$50,$00,$17,$4e,$72,$53,$55
	.dc.b	$42,$00,$1b,$90,$00,$53,$55,$42,$41,$00,$1c,$90,$c0,$53,$55,$42
	.dc.b	$49,$00,$03,$04,$00,$53,$55,$42,$51,$00,$02,$51,$00,$53,$55,$42
	.dc.b	$58,$00,$04,$91,$00,$53,$57,$41,$50,$00,$18,$48,$40,$54,$41,$53
	.dc.b	$00,$15,$4a,$c0,$54,$52,$41,$50,$00,$19,$4e,$40,$54,$52,$41,$50
	.dc.b	$56,$00,$1d,$4e,$76,$54,$53,$54,$00,$0b,$4a,$00,$54,$52,$41,$50
	.dc.b	$54,$00,$31,$50,$f8,$54,$52,$41,$50,$46,$00,$31,$51,$f8,$54,$52
	.dc.b	$41,$50,$48,$49,$00,$31,$52,$f8,$54,$52,$41,$50,$4c,$53,$00,$31
	.dc.b	$53,$f8,$54,$52,$41,$50,$43,$43,$00,$31,$54,$f8,$54,$52,$41,$50
	.dc.b	$43,$53,$00,$31,$55,$f8,$54,$52,$41,$50,$4e,$45,$00,$31,$56,$f8
	.dc.b	$54,$52,$41,$50,$45,$51,$00,$31,$57,$f8,$54,$52,$41,$50,$56,$43
	.dc.b	$00,$31,$58,$f8,$54,$52,$41,$50,$56,$53,$00,$31,$59,$f8,$54,$52
	.dc.b	$41,$50,$50,$4c,$00,$31,$5a,$f8,$54,$52,$41,$50,$4d,$49,$00,$31
	.dc.b	$5b,$f8,$54,$52,$41,$50,$47,$45,$00,$31,$5c,$f8,$54,$52,$41,$50
	.dc.b	$4c,$54,$00,$31,$5d,$f8,$54,$52,$41,$50,$47,$54,$00,$31,$5e,$f8
	.dc.b	$54,$52,$41,$50,$4c,$45,$00,$31,$5f,$f8,$55,$4e,$4c,$4b,$00,$10
	.dc.b	$4e,$58,$55,$4e,$50,$4b,$00,$06,$81,$80,$46,$4d,$4f,$56,$45,$00
	.dc.b	$33,$00,$00,$46,$49,$4e,$54,$00,$34,$00,$01,$46,$53,$49,$4e,$48
	.dc.b	$00,$34,$00,$02,$46,$49,$4e,$54,$52,$5a,$00,$34,$00,$03,$46,$53
	.dc.b	$51,$52,$54,$00,$34,$00,$04,$46,$4c,$4f,$47,$4e,$50,$31,$00,$34
	.dc.b	$00,$06,$46,$45,$54,$4f,$58,$4d,$31,$00,$34,$00,$08,$46,$54,$41
	.dc.b	$4e,$48,$00,$34,$00,$09,$46,$41,$54,$41,$4e,$00,$34,$00,$0a,$46
	.dc.b	$41,$53,$49,$4e,$00,$34,$00,$0c,$46,$41,$54,$41,$4e,$48,$00,$34
	.dc.b	$00,$0d,$46,$53,$49,$4e,$00,$34,$00,$0e,$46,$54,$41,$4e,$00,$34
	.dc.b	$00,$0f,$46,$45,$54,$4f,$58,$00,$34,$00,$10,$46,$54,$57,$4f,$54
	.dc.b	$4f,$58,$00,$34,$00,$11,$46,$54,$45,$4e,$54,$4f,$58,$00,$34,$00
	.dc.b	$12,$46,$4c,$4f,$47,$4e,$00,$34,$00,$14,$46,$4c,$4f,$47,$31,$30
	.dc.b	$00,$34,$00,$15,$46,$4c,$4f,$47,$32,$00,$34,$00,$16,$46,$41,$42
	.dc.b	$53,$00,$34,$00,$18,$46,$43,$4f,$53,$48,$00,$34,$00,$19,$46,$4e
	.dc.b	$45,$47,$00,$34,$00,$1a,$46,$41,$43,$4f,$53,$00,$34,$00,$1c,$46
	.dc.b	$43,$4f,$53,$00,$34,$00,$1d,$46,$47,$45,$54,$45,$58,$50,$00,$34
	.dc.b	$00,$1e,$46,$47,$45,$54,$4d,$41,$4e,$00,$34,$00,$1f,$46,$44,$49
	.dc.b	$56,$00,$34,$00,$20,$46,$4d,$4f,$44,$00,$34,$00,$21,$46,$41,$44
	.dc.b	$44,$00,$34,$00,$22,$46,$4d,$55,$4c,$00,$34,$00,$23,$46,$53,$47
	.dc.b	$4c,$44,$49,$56,$00,$34,$00,$24,$46,$52,$45,$4d,$00,$34,$00,$25
	.dc.b	$46,$53,$43,$41,$4c,$45,$00,$34,$00,$26,$46,$53,$47,$4c,$4d,$55
	.dc.b	$4c,$00,$34,$00,$27,$46,$53,$55,$42,$00,$34,$00,$28,$46,$43,$4d
	.dc.b	$50,$00,$34,$00,$38,$46,$54,$53,$54,$00,$34,$00,$3a,$46,$53,$49
	.dc.b	$4e,$43,$4f,$53,$00,$35,$00,$30,$46,$4d,$4f,$56,$45,$43,$52,$00
	.dc.b	$36,$5c,$00,$46,$4d,$4f,$56,$45,$4d,$00,$37,$80,$00,$46,$53,$46
	.dc.b	$00,$38,$00,$00,$46,$53,$45,$51,$00,$38,$00,$01,$46,$53,$4f,$47
	.dc.b	$54,$00,$38,$00,$02,$46,$53,$4f,$47,$45,$00,$38,$00,$03,$46,$53
	.dc.b	$4f,$4c,$54,$00,$38,$00,$04,$46,$53,$4f,$4c,$45,$00,$38,$00,$05
	.dc.b	$46,$53,$4f,$47,$4c,$00,$38,$00,$06,$46,$53,$4f,$52,$00,$38,$00
	.dc.b	$07,$46,$53,$55,$4e,$00,$38,$00,$08,$46,$53,$55,$45,$51,$00,$38
	.dc.b	$00,$09,$46,$53,$55,$47,$54,$00,$38,$00,$0a,$46,$53,$55,$47,$45
	.dc.b	$00,$38,$00,$0b,$46,$53,$55,$4c,$54,$00,$38,$00,$0c,$46,$53,$55
	.dc.b	$4c,$45,$00,$38,$00,$0d,$46,$53,$4e,$45,$00,$38,$00,$0e,$46,$53
	.dc.b	$54,$00,$38,$00,$0f,$46,$53,$53,$46,$00,$38,$00,$10,$46,$53,$53
	.dc.b	$45,$51,$00,$38,$00,$11,$46,$53,$47,$54,$00,$38,$00,$12,$46,$53
	.dc.b	$47,$45,$00,$38,$00,$13,$46,$53,$4c,$54,$00,$38,$00,$14,$46,$53
	.dc.b	$4c,$45,$00,$38,$00,$15,$46,$53,$47,$4c,$00,$38,$00,$16,$46,$53
	.dc.b	$47,$4c,$45,$00,$38,$00,$17,$46,$53,$4e,$47,$4c,$45,$00,$38,$00
	.dc.b	$18,$46,$53,$4e,$47,$4c,$00,$38,$00,$19,$46,$53,$4e,$4c,$45,$00
	.dc.b	$38,$00,$1a,$46,$53,$4e,$4c,$54,$00,$38,$00,$1b,$46,$53,$4e,$47
	.dc.b	$45,$00,$38,$00,$1c,$46,$53,$4e,$47,$54,$00,$38,$00,$1d,$46,$53
	.dc.b	$53,$4e,$45,$00,$38,$00,$1e,$46,$53,$53,$54,$00,$38,$00,$1f,$46
	.dc.b	$44,$42,$52,$41,$00,$39,$00,$00,$46,$44,$42,$46,$00,$39,$00,$00
	.dc.b	$46,$44,$42,$45,$51,$00,$39,$00,$01,$46,$44,$42,$4f,$47,$54,$00
	.dc.b	$39,$00,$02,$46,$44,$42,$4f,$47,$45,$00,$39,$00,$03,$46,$44,$42
	.dc.b	$4f,$4c,$54,$00,$39,$00,$04,$46,$44,$42,$4f,$4c,$45,$00,$39,$00
	.dc.b	$05,$46,$44,$42,$4f,$47,$4c,$00,$39,$00,$06,$46,$44,$42,$4f,$52
	.dc.b	$00,$39,$00,$07,$46,$44,$42,$55,$4e,$00,$39,$00,$08,$46,$44,$42
	.dc.b	$55,$45,$51,$00,$39,$00,$09,$46,$44,$42,$55,$47,$54,$00,$39,$00
	.dc.b	$0a,$46,$44,$42,$55,$47,$45,$00,$39,$00,$0b,$46,$44,$42,$55,$4c
	.dc.b	$54,$00,$39,$00,$0c,$46,$44,$42,$55,$4c,$45,$00,$39,$00,$0d,$46
	.dc.b	$44,$42,$4e,$45,$00,$39,$00,$0e,$46,$44,$42,$54,$00,$39,$00,$0f
	.dc.b	$46,$44,$42,$53,$46,$00,$39,$00,$10,$46,$44,$42,$53,$45,$51,$00
	.dc.b	$39,$00,$11,$46,$44,$42,$47,$54,$00,$39,$00,$12,$46,$44,$42,$47
	.dc.b	$45,$00,$39,$00,$13,$46,$44,$42,$4c,$54,$00,$39,$00,$14,$46,$44
	.dc.b	$42,$4c,$45,$00,$39,$00,$15,$46,$44,$42,$47,$4c,$00,$39,$00,$16
	.dc.b	$46,$44,$42,$47,$4c,$45,$00,$39,$00,$17,$46,$44,$42,$4e,$47,$4c
	.dc.b	$45,$00,$39,$00,$18,$46,$44,$42,$4e,$47,$4c,$00,$39,$00,$19,$46
	.dc.b	$44,$42,$4e,$4c,$45,$00,$39,$00,$1a,$46,$44,$42,$4e,$4c,$54,$00
	.dc.b	$39,$00,$1b,$46,$44,$42,$4e,$47,$45,$00,$39,$00,$1c,$46,$44,$42
	.dc.b	$4e,$47,$54,$00,$39,$00,$1d,$46,$44,$42,$53,$4e,$45,$00,$39,$00
	.dc.b	$1e,$46,$44,$42,$53,$54,$00,$39,$00,$1f,$46,$54,$52,$41,$50,$46
	.dc.b	$00,$3a,$00,$00,$46,$54,$52,$41,$50,$45,$51,$00,$3a,$00,$01,$46
	.dc.b	$54,$52,$41,$50,$4f,$47,$54,$00,$3a,$00,$02,$46,$54,$52,$41,$50
	.dc.b	$4f,$47,$45,$00,$3a,$00,$03,$46,$54,$52,$41,$50,$4f,$4c,$54,$00
	.dc.b	$3a,$00,$04,$46,$54,$52,$41,$50,$4f,$4c,$45,$00,$3a,$00,$05,$46
	.dc.b	$54,$52,$41,$50,$4f,$47,$4c,$00,$3a,$00,$06,$46,$54,$52,$41,$50
	.dc.b	$4f,$52,$00,$3a,$00,$07,$46,$54,$52,$41,$50,$55,$4e,$00,$3a,$00
	.dc.b	$08,$46,$54,$52,$41,$50,$55,$45,$51,$00,$3a,$00,$09,$46,$54,$52
	.dc.b	$41,$50,$55,$47,$54,$00,$3a,$00,$0a,$46,$54,$52,$41,$50,$55,$47
	.dc.b	$45,$00,$3a,$00,$0b,$46,$54,$52,$41,$50,$55,$4c,$54,$00,$3a,$00
	.dc.b	$0c,$46,$54,$52,$41,$50,$55,$4c,$45,$00,$3a,$00,$0d,$46,$54,$52
	.dc.b	$41,$50,$4e,$45,$00,$3a,$00,$0e,$46,$54,$52,$41,$50,$54,$00,$3a
	.dc.b	$00,$0f,$46,$54,$52,$41,$50,$53,$46,$00,$3a,$00,$10,$46,$54,$52
	.dc.b	$41,$50,$53,$45,$51,$00,$3a,$00,$11,$46,$54,$52,$41,$50,$47,$54
	.dc.b	$00,$3a,$00,$12,$46,$54,$52,$41,$50,$47,$45,$00,$3a,$00,$13,$46
	.dc.b	$54,$52,$41,$50,$4c,$54,$00,$3a,$00,$14,$46,$54,$52,$41,$50,$4c
	.dc.b	$45,$00,$3a,$00,$15,$46,$54,$52,$41,$50,$47,$4c,$00,$3a,$00,$16
	.dc.b	$46,$54,$52,$41,$50,$47,$4c,$45,$00,$3a,$00,$17,$46,$54,$52,$41
	.dc.b	$50,$4e,$47,$4c,$45,$00,$3a,$00,$18,$46,$54,$52,$41,$50,$4e,$47
	.dc.b	$4c,$00,$3a,$00,$19,$46,$54,$52,$41,$50,$4e,$4c,$45,$00,$3a,$00
	.dc.b	$1a,$46,$54,$52,$41,$50,$4e,$4c,$54,$00,$3a,$00,$1b,$46,$54,$52
	.dc.b	$41,$50,$4e,$47,$45,$00,$3a,$00,$1c,$46,$54,$52,$41,$50,$4e,$47
	.dc.b	$54,$00,$3a,$00,$1d,$46,$54,$52,$41,$50,$53,$4e,$45,$00,$3a,$00
	.dc.b	$1e,$46,$54,$52,$41,$50,$53,$54,$00,$3a,$00,$1f,$46,$42,$46,$00
	.dc.b	$3b,$00,$00,$46,$42,$45,$51,$00,$3b,$00,$01,$46,$42,$4f,$47,$54
	.dc.b	$00,$3b,$00,$02,$46,$42,$4f,$47,$45,$00,$3b,$00,$03,$46,$42,$4f
	.dc.b	$4c,$54,$00,$3b,$00,$04,$46,$42,$4f,$4c,$45,$00,$3b,$00,$05,$46
	.dc.b	$42,$4f,$47,$4c,$00,$3b,$00,$06,$46,$42,$4f,$52,$00,$3b,$00,$07
	.dc.b	$46,$42,$55,$4e,$00,$3b,$00,$08,$46,$42,$55,$45,$51,$00,$3b,$00
	.dc.b	$09,$46,$42,$55,$47,$54,$00,$3b,$00,$0a,$46,$42,$55,$47,$45,$00
	.dc.b	$3b,$00,$0b,$46,$42,$55,$4c,$54,$00,$3b,$00,$0c,$46,$42,$55,$4c
	.dc.b	$45,$00,$3b,$00,$0d,$46,$42,$4e,$45,$00,$3b,$00,$0e,$46,$42,$52
	.dc.b	$41,$00,$3b,$00,$0f,$46,$42,$54,$00,$3b,$00,$0f,$46,$42,$53,$46
	.dc.b	$00,$3b,$00,$10,$46,$42,$53,$45,$51,$00,$3b,$00,$11,$46,$42,$47
	.dc.b	$54,$00,$3b,$00,$12,$46,$42,$47,$45,$00,$3b,$00,$13,$46,$42,$4c
	.dc.b	$54,$00,$3b,$00,$14,$46,$42,$4c,$45,$00,$3b,$00,$15,$46,$42,$47
	.dc.b	$4c,$00,$3b,$00,$16,$46,$42,$47,$4c,$45,$00,$3b,$00,$17,$46,$42
	.dc.b	$4e,$47,$4c,$45,$00,$3b,$00,$18,$46,$42,$4e,$47,$4c,$00,$3b,$00
	.dc.b	$19,$46,$42,$4e,$4c,$45,$00,$3b,$00,$1a,$46,$42,$4e,$4c,$54,$00
	.dc.b	$3b,$00,$1b,$46,$42,$4e,$47,$45,$00,$3b,$00,$1c,$46,$42,$4e,$47
	.dc.b	$54,$00,$3b,$00,$1d,$46,$42,$53,$4e,$45,$00,$3b,$00,$1e,$46,$42
	.dc.b	$53,$54,$00,$3b,$00,$1f,$46,$4e,$4f,$50,$00,$3c,$00,$00,$46,$52
	.dc.b	$45,$53,$54,$4f,$52,$45,$00,$3d,$00,$00,$46,$53,$41,$56,$45,$00
	.dc.b	$3e,$00,$00,$50,$4d,$4f,$56,$45,$00,$3f,$00,$00,$50,$4d,$4f,$56
	.dc.b	$45,$46,$44,$00,$51,$00,$00,$50,$46,$4c,$55,$53,$48,$00,$40,$00
	.dc.b	$00,$50,$46,$4c,$55,$53,$48,$41,$00,$41,$00,$00,$50,$46,$4c,$55
	.dc.b	$53,$48,$53,$00,$42,$00,$00,$50,$46,$4c,$55,$53,$48,$52,$00,$43
	.dc.b	$00,$00,$50,$4c,$4f,$41,$44,$52,$00,$44,$22,$00,$50,$4c,$4f,$41
	.dc.b	$44,$57,$00,$44,$20,$00,$50,$54,$45,$53,$54,$52,$00,$45,$82,$00
	.dc.b	$50,$54,$45,$53,$54,$57,$00,$45,$80,$00,$50,$56,$41,$4c,$49,$44
	.dc.b	$00,$46,$00,$00,$50,$53,$42,$53,$00,$47,$00,$00,$50,$53,$42,$43
	.dc.b	$00,$47,$00,$01,$50,$53,$4c,$53,$00,$47,$00,$02,$50,$53,$4c,$43
	.dc.b	$00,$47,$00,$03,$50,$53,$53,$53,$00,$47,$00,$04,$50,$53,$53,$43
	.dc.b	$00,$47,$00,$05,$50,$53,$41,$53,$00,$47,$00,$06,$50,$53,$41,$43
	.dc.b	$00,$47,$00,$07,$50,$53,$57,$53,$00,$47,$00,$08,$50,$53,$57,$43
	.dc.b	$00,$47,$00,$09,$50,$53,$49,$53,$00,$47,$00,$0a,$50,$53,$49,$43
	.dc.b	$00,$47,$00,$0b,$50,$53,$47,$53,$00,$47,$00,$0c,$50,$53,$47,$43
	.dc.b	$00,$47,$00,$0d,$50,$53,$43,$53,$00,$47,$00,$0e,$50,$53,$43,$43
	.dc.b	$00,$47,$00,$0f,$50,$42,$42,$53,$00,$48,$00,$00,$50,$42,$42,$43
	.dc.b	$00,$48,$00,$01,$50,$42,$4c,$53,$00,$48,$00,$02,$50,$42,$4c,$43
	.dc.b	$00,$48,$00,$03,$50,$42,$53,$53,$00,$48,$00,$04,$50,$42,$53,$43
	.dc.b	$00,$48,$00,$05,$50,$42,$41,$53,$00,$48,$00,$06,$50,$42,$41,$43
	.dc.b	$00,$48,$00,$07,$50,$42,$57,$53,$00,$48,$00,$08,$50,$42,$57,$43
	.dc.b	$00,$48,$00,$09,$50,$42,$49,$53,$00,$48,$00,$0a,$50,$42,$49,$43
	.dc.b	$00,$48,$00,$0b,$50,$42,$47,$53,$00,$48,$00,$0c,$50,$42,$47,$43
	.dc.b	$00,$48,$00,$0d,$50,$42,$43,$53,$00,$48,$00,$0e,$50,$42,$43,$43
	.dc.b	$00,$48,$00,$0f,$50,$44,$42,$42,$53,$00,$49,$00,$00,$50,$44,$42
	.dc.b	$42,$43,$00,$49,$00,$01,$50,$44,$42,$4c,$53,$00,$49,$00,$02,$50
	.dc.b	$44,$42,$4c,$43,$00,$49,$00,$03,$50,$44,$42,$53,$53,$00,$49,$00
	.dc.b	$04,$50,$44,$42,$53,$43,$00,$49,$00,$05,$50,$44,$42,$41,$53,$00
	.dc.b	$49,$00,$06,$50,$44,$42,$41,$43,$00,$49,$00,$07,$50,$44,$42,$57
	.dc.b	$53,$00,$49,$00,$08,$50,$44,$42,$57,$43,$00,$49,$00,$09,$50,$44
	.dc.b	$42,$49,$53,$00,$49,$00,$0a,$50,$44,$42,$49,$43,$00,$49,$00,$0b
	.dc.b	$50,$44,$42,$47,$53,$00,$49,$00,$0c,$50,$44,$42,$47,$43,$00,$49
	.dc.b	$00,$0d,$50,$44,$42,$43,$53,$00,$49,$00,$0e,$50,$44,$42,$43,$43
	.dc.b	$00,$49,$00,$0f,$50,$54,$52,$41,$50,$42,$53,$00,$4a,$00,$00,$50
	.dc.b	$54,$52,$41,$50,$42,$43,$00,$4a,$00,$01,$50,$54,$52,$41,$50,$4c
	.dc.b	$53,$00,$4a,$00,$02,$50,$54,$52,$41,$50,$4c,$43,$00,$4a,$00,$03
	.dc.b	$50,$54,$52,$41,$50,$53,$53,$00,$4a,$00,$04,$50,$54,$52,$41,$50
	.dc.b	$53,$43,$00,$4a,$00,$05,$50,$54,$52,$41,$50,$41,$53,$00,$4a,$00
	.dc.b	$06,$50,$54,$52,$41,$50,$41,$43,$00,$4a,$00,$07,$50,$54,$52,$41
	.dc.b	$50,$57,$53,$00,$4a,$00,$08,$50,$54,$52,$41,$50,$57,$43,$00,$4a
	.dc.b	$00,$09,$50,$54,$52,$41,$50,$49,$53,$00,$4a,$00,$0a,$50,$54,$52
	.dc.b	$41,$50,$49,$43,$00,$4a,$00,$0b,$50,$54,$52,$41,$50,$47,$53,$00
	.dc.b	$4a,$00,$0c,$50,$54,$52,$41,$50,$47,$43,$00,$4a,$00,$0d,$50,$54
	.dc.b	$52,$41,$50,$43,$53,$00,$4a,$00,$0e,$50,$54,$52,$41,$50,$43,$43
	.dc.b	$00,$4a,$00,$0f,$50,$52,$45,$53,$54,$4f,$52,$45,$00,$4b,$00,$00
	.dc.b	$50,$53,$41,$56,$45,$00,$4c,$00,$00
emulff::
	.dc.b	'_SETPDB',$00
L004f88:
	.dc.b	$1d,$ff,$80,$5f,$47,$45,$54,$50,$44,$42,$00,$1d,$ff,$81,$5f,$53
	.dc.b	$45,$54,$45,$4e,$56,$00,$1d,$ff,$82,$5f,$47,$45,$54,$45,$4e,$56
	.dc.b	$00,$1d,$ff,$83,$5f,$56,$45,$52,$49,$46,$59,$47,$00,$1d,$ff,$84
	.dc.b	$5f,$43,$4f,$4d,$4d,$4f,$4e,$00,$1d,$ff,$85,$5f,$52,$45,$4e,$41
	.dc.b	$4d,$45,$00,$1d,$ff,$86,$5f,$46,$49,$4c,$45,$44,$41,$54,$45,$00
	.dc.b	$1d,$ff,$87,$5f,$4d,$41,$4c,$4c,$4f,$43,$32,$00,$1d,$ff,$88,$5f
	.dc.b	$4d,$41,$4b,$45,$54,$4d,$50,$00,$1d,$ff,$8a,$5f,$4e,$45,$57,$46
	.dc.b	$49,$4c,$45,$00,$1d,$ff,$8b,$5f,$4c,$4f,$43,$4b,$00,$1d,$ff,$8c
	.dc.b	$5f,$41,$53,$53,$49,$47,$4e,$00,$1d,$ff,$8f,$5f,$53,$5f,$4d,$41
	.dc.b	$4c,$4c,$4f,$43,$00,$1d,$ff,$ad,$5f,$53,$5f,$4d,$46,$52,$45,$45
	.dc.b	$00,$1d,$ff,$ae,$5f,$53,$5f,$50,$52,$4f,$43,$45,$53,$53,$00,$1d
	.dc.b	$ff,$af,$5f,$41,$4c,$4c,$43,$4c,$4f,$53,$45,$00,$1d,$ff,$1f,$5f
	.dc.b	$42,$52,$45,$41,$4b,$43,$4b,$00,$1d,$ff,$33,$5f,$43,$48,$44,$49
	.dc.b	$52,$00,$1d,$ff,$3b,$5f,$43,$48,$44,$52,$56,$00,$1d,$ff,$0e,$5f
	.dc.b	$43,$48,$47,$44,$52,$56,$00,$1d,$ff,$0e,$5f,$43,$48,$4d,$4f,$44
	.dc.b	$00,$1d,$ff,$43,$5f,$43,$49,$4e,$53,$4e,$53,$00,$1d,$ff,$12,$5f
	.dc.b	$43,$4c,$4f,$53,$45,$00,$1d,$ff,$3e,$5f,$43,$54,$52,$4c,$56,$43
	.dc.b	$00,$1d,$ff,$f1,$5f,$43,$4f,$4d,$49,$4e,$50,$00,$1d,$ff,$03,$5f
	.dc.b	$43,$4f,$4d,$4f,$55,$54,$00,$1d,$ff,$04,$5f,$43,$4f,$4e,$43,$54
	.dc.b	$52,$4c,$00,$1d,$ff,$23,$5f,$43,$4f,$4e,$53,$4e,$53,$00,$1d,$ff
	.dc.b	$10,$5f,$43,$4f,$55,$54,$53,$4e,$53,$00,$1d,$ff,$13,$5f,$43,$52
	.dc.b	$45,$41,$54,$45,$00,$1d,$ff,$3c,$5f,$43,$55,$52,$44,$49,$52,$00
	.dc.b	$1d,$ff,$47,$5f,$43,$55,$52,$44,$52,$56,$00,$1d,$ff,$19,$5f,$44
	.dc.b	$45,$4c,$45,$54,$45,$00,$1d,$ff,$41,$5f,$44,$49,$53,$4b,$52,$45
	.dc.b	$44,$00,$1d,$ff,$f3,$5f,$44,$49,$53,$4b,$57,$52,$54,$00,$1d,$ff
	.dc.b	$f4,$5f,$44,$52,$56,$43,$54,$52,$4c,$00,$1d,$ff,$0f,$5f,$44,$52
	.dc.b	$56,$58,$43,$48,$47,$00,$1d,$ff,$34,$5f,$44,$53,$4b,$46,$52,$45
	.dc.b	$00,$1d,$ff,$36,$5f,$44,$55,$50,$00,$1d,$ff,$45,$5f,$44,$55,$50
	.dc.b	$30,$00,$1d,$ff,$2f,$5f,$44,$55,$50,$32,$00,$1d,$ff,$46,$5f,$45
	.dc.b	$52,$52,$4a,$56,$43,$00,$1d,$ff,$f2,$5f,$45,$58,$45,$43,$00,$1d
	.dc.b	$ff,$4b,$5f,$45,$58,$49,$54,$00,$1d,$ff,$00,$5f,$45,$58,$49,$54
	.dc.b	$32,$00,$1d,$ff,$4c,$5f,$45,$58,$49,$54,$56,$43,$00,$1d,$ff,$f0
	.dc.b	$5f,$46,$41,$54,$43,$48,$4b,$00,$1d,$ff,$17,$5f,$46,$46,$4c,$55
	.dc.b	$53,$48,$00,$1d,$ff,$0d,$5f,$46,$47,$45,$54,$43,$00,$1d,$ff,$1b
	.dc.b	$5f,$46,$47,$45,$54,$53,$00,$1d,$ff,$1c,$5f,$46,$49,$4c,$45,$44
	.dc.b	$41,$54,$45,$00,$1d,$ff,$57,$5f,$46,$49,$4c,$45,$53,$00,$1d,$ff
	.dc.b	$4e,$5f,$46,$4e,$43,$4b,$45,$59,$00,$1d,$ff,$21,$5f,$46,$50,$55
	.dc.b	$54,$43,$00,$1d,$ff,$1d,$5f,$46,$50,$55,$54,$53,$00,$1d,$ff,$1e
	.dc.b	$5f,$47,$45,$54,$43,$00,$1d,$ff,$08,$5f,$47,$45,$54,$43,$48,$41
	.dc.b	$52,$00,$1d,$ff,$01,$5f,$47,$45,$54,$44,$41,$54,$45,$00,$1d,$ff
	.dc.b	$2a,$5f,$47,$45,$54,$44,$50,$42,$00,$1d,$ff,$32,$5f,$47,$45,$54
	.dc.b	$45,$4e,$56,$00,$1d,$ff,$53,$5f,$47,$45,$54,$50,$44,$42,$00,$1d
	.dc.b	$ff,$51,$5f,$47,$45,$54,$53,$00,$1d,$ff,$0a,$5f,$47,$45,$54,$53
	.dc.b	$53,$00,$1d,$ff,$1a,$5f,$47,$45,$54,$54,$49,$4d,$32,$00,$1d,$ff
	.dc.b	$27,$5f,$47,$45,$54,$54,$49,$4d,$45,$00,$1d,$ff,$2c,$5f,$49,$4e
	.dc.b	$4b,$45,$59,$00,$1d,$ff,$07,$5f,$49,$4e,$50,$4f,$55,$54,$00,$1d
	.dc.b	$ff,$06,$5f,$49,$4e,$54,$56,$43,$47,$00,$1d,$ff,$35,$5f,$49,$4e
	.dc.b	$54,$56,$43,$53,$00,$1d,$ff,$25,$5f,$49,$4f,$43,$54,$52,$4c,$00
	.dc.b	$1d,$ff,$44,$5f,$4b,$45,$45,$50,$50,$52,$00,$1d,$ff,$31,$5f,$4b
	.dc.b	$45,$59,$43,$54,$52,$4c,$00,$1d,$ff,$24,$5f,$4b,$45,$59,$53,$4e
	.dc.b	$53,$00,$1d,$ff,$0b,$5f,$4b,$46,$4c,$55,$53,$48,$00,$1d,$ff,$0c
	.dc.b	$5f,$4b,$4e,$4a,$43,$54,$52,$4c,$00,$1d,$ff,$22,$5f,$4d,$41,$4c
	.dc.b	$4c,$4f,$43,$00,$1d,$ff,$48,$5f,$4d,$46,$52,$45,$45,$00,$1d,$ff
	.dc.b	$49,$5f,$4d,$4b,$44,$49,$52,$00,$1d,$ff,$39,$5f,$4e,$41,$4d,$45
	.dc.b	$43,$4b,$00,$1d,$ff,$37,$5f,$4e,$41,$4d,$45,$53,$54,$53,$00,$1d
	.dc.b	$ff,$29,$5f,$4e,$46,$49,$4c,$45,$53,$00,$1d,$ff,$4f,$5f,$4f,$50
	.dc.b	$45,$4e,$00,$1d,$ff,$3d,$5f,$50,$52,$49,$4e,$54,$00,$1d,$ff,$09
	.dc.b	$5f,$50,$52,$4e,$4f,$55,$54,$00,$1d,$ff,$05,$5f,$50,$52,$4e,$53
	.dc.b	$4e,$53,$00,$1d,$ff,$11,$5f,$50,$53,$50,$53,$45,$54,$00,$1d,$ff
	.dc.b	$26,$5f,$50,$55,$54,$43,$48,$41,$52,$00,$1d,$ff,$02,$5f,$52,$45
	.dc.b	$41,$44,$00,$1d,$ff,$3f,$5f,$52,$45,$4e,$41,$4d,$45,$00,$1d,$ff
	.dc.b	$56,$5f,$52,$4d,$44,$49,$52,$00,$1d,$ff,$3a,$5f,$53,$45,$45,$4b
	.dc.b	$00,$1d,$ff,$42,$5f,$53,$45,$54,$42,$4c,$4f,$43,$4b,$00,$1d,$ff
	.dc.b	$4a,$5f,$53,$45,$54,$44,$41,$54,$45,$00,$1d,$ff,$2b,$5f,$53,$45
	.dc.b	$54,$45,$4e,$56,$00,$1d,$ff,$52,$5f,$53,$45,$54,$50,$44,$42,$00
	.dc.b	$1d,$ff,$50,$5f,$53,$45,$54,$54,$49,$4d,$32,$00,$1d,$ff,$28,$5f
	.dc.b	$53,$45,$54,$54,$49,$4d,$45,$00,$1d,$ff,$2d,$5f,$53,$55,$50,$45
	.dc.b	$52,$00,$1d,$ff,$20,$5f,$56,$45,$52,$49,$46,$59,$00,$1d,$ff,$2e
	.dc.b	$5f,$56,$45,$52,$49,$46,$59,$47,$00,$1d,$ff,$54,$5f,$56,$45,$52
	.dc.b	$4e,$55,$4d,$00,$1d,$ff,$30,$5f,$57,$41,$49,$54,$00,$1d,$ff,$4d
	.dc.b	$5f,$57,$52,$49,$54,$45,$00,$1d,$ff,$40,$5f,$43,$4f,$4d,$4d,$4f
	.dc.b	$4e,$00,$1d,$ff,$55,$5f,$4d,$41,$4c,$4c,$4f,$43,$32,$00,$1d,$ff
	.dc.b	$58,$5f,$4d,$41,$4b,$45,$54,$4d,$50,$00,$1d,$ff,$5a,$5f,$4e,$45
	.dc.b	$57,$46,$49,$4c,$45,$00,$1d,$ff,$5b,$5f,$4c,$4f,$43,$4b,$00,$1d
	.dc.b	$ff,$5c,$5f,$41,$53,$53,$49,$47,$4e,$00,$1d,$ff,$5f,$5f,$53,$5f
	.dc.b	$4d,$41,$4c,$4c,$4f,$43,$00,$1d,$ff,$7d,$5f,$53,$5f,$4d,$46,$52
	.dc.b	$45,$45,$00,$1d,$ff,$7e,$5f,$53,$5f,$50,$52,$4f,$43,$45,$53,$53
	.dc.b	$00,$1d,$ff,$7f,$5f,$49,$4e,$44,$4f,$53,$46,$4c,$47,$00,$1d,$ff
	.dc.b	$f5,$5f,$53,$55,$50,$45,$52,$5f,$4a,$53,$52,$00,$1d,$ff,$f6,$5f
	.dc.b	$42,$55,$53,$5f,$45,$52,$52,$00,$1d,$ff,$f7,$5f,$4f,$50,$45,$4e
	.dc.b	$5f,$50,$52,$00,$1d,$ff,$f8,$5f,$4b,$49,$4c,$4c,$5f,$50,$52,$00
	.dc.b	$1d,$ff,$f9,$5f,$47,$45,$54,$5f,$50,$52,$00,$1d,$ff,$fa,$5f,$53
	.dc.b	$55,$53,$50,$45,$4e,$44,$00,$1d,$ff,$fb,$5f,$53,$4c,$45,$45,$50
	.dc.b	$5f,$50,$52,$00,$1d,$ff,$fc,$5f,$53,$45,$4e,$44,$5f,$50,$52,$00
	.dc.b	$1d,$ff,$fd,$5f,$54,$49,$4d,$45,$5f,$50,$52,$00,$1d,$ff,$fe,$5f
	.dc.b	$43,$48,$41,$4e,$47,$45,$5f,$50,$52,$00,$1d,$ff,$ff,$5f,$5f,$41
	.dc.b	$54,$41,$4e,$00,$1d,$fe,$39,$5f,$5f,$42,$54,$4f,$53,$00,$1d,$fe
	.dc.b	$17,$5f,$5f,$43,$44,$41,$44,$44,$00,$1d,$fe,$ed,$5f,$5f,$43,$44
	.dc.b	$43,$4d,$50,$00,$1d,$fe,$ec,$5f,$5f,$43,$44,$44,$45,$43,$00,$1d
	.dc.b	$fe,$fc,$5f,$5f,$43,$44,$44,$49,$56,$00,$1d,$fe,$f0,$5f,$5f,$43
	.dc.b	$44,$49,$4e,$43,$00,$1d,$fe,$fa,$5f,$5f,$43,$44,$4d,$4f,$44,$00
	.dc.b	$1d,$fe,$f1,$5f,$5f,$43,$44,$4d,$55,$4c,$00,$1d,$fe,$ef,$5f,$5f
	.dc.b	$43,$44,$53,$55,$42,$00,$1d,$fe,$ee,$5f,$5f,$43,$44,$54,$4f,$46
	.dc.b	$00,$1d,$fe,$eb,$5f,$5f,$43,$44,$54,$4f,$4c,$00,$1d,$fe,$e7,$5f
	.dc.b	$5f,$43,$44,$54,$53,$54,$00,$1d,$fe,$f8,$5f,$5f,$43,$46,$41,$44
	.dc.b	$44,$00,$1d,$fe,$f3,$5f,$5f,$43,$46,$43,$4d,$50,$00,$1d,$fe,$f2
	.dc.b	$5f,$5f,$43,$46,$44,$45,$43,$00,$1d,$fe,$fd,$5f,$5f,$43,$46,$44
	.dc.b	$49,$56,$00,$1d,$fe,$f6,$5f,$5f,$43,$46,$49,$4e,$43,$00,$1d,$fe
	.dc.b	$fb,$5f,$5f,$43,$46,$4d,$4f,$44,$00,$1d,$fe,$f7,$5f,$5f,$43,$46
	.dc.b	$4d,$55,$4c,$00,$1d,$fe,$f5,$5f,$5f,$43,$46,$53,$55,$42,$00,$1d
	.dc.b	$fe,$f4,$5f,$5f,$43,$46,$54,$4f,$44,$00,$1d,$fe,$ea,$5f,$5f,$43
	.dc.b	$46,$54,$4f,$4c,$00,$1d,$fe,$e9,$5f,$5f,$43,$46,$54,$53,$54,$00
	.dc.b	$1d,$fe,$f9,$5f,$5f,$43,$4c,$44,$49,$56,$00,$1d,$fe,$e1,$5f,$5f
	.dc.b	$43,$4c,$4d,$4f,$44,$00,$1d,$fe,$e2,$5f,$5f,$43,$4c,$4d,$55,$4c
	.dc.b	$00,$1d,$fe,$e0,$5f,$5f,$43,$4c,$54,$4f,$44,$00,$1d,$fe,$e6,$5f
	.dc.b	$5f,$43,$4c,$54,$4f,$46,$00,$1d,$fe,$e8,$5f,$5f,$43,$4f,$53,$00
	.dc.b	$1d,$fe,$37,$5f,$5f,$43,$55,$44,$49,$56,$00,$1d,$fe,$e4,$5f,$5f
	.dc.b	$43,$55,$4d,$4f,$44,$00,$1d,$fe,$e5,$5f,$5f,$43,$55,$4d,$55,$4c
	.dc.b	$00,$1d,$fe,$e3,$5f,$5f,$44,$41,$42,$53,$00,$1d,$fe,$30,$5f,$5f
	.dc.b	$44,$41,$44,$44,$00,$1d,$fe,$2b,$5f,$5f,$44,$41,$44,$44,$4f,$4e
	.dc.b	$45,$00,$1d,$fe,$4b,$5f,$5f,$44,$43,$45,$49,$4c,$00,$1d,$fe,$31
	.dc.b	$5f,$5f,$44,$43,$4d,$50,$00,$1d,$fe,$29,$5f,$5f,$44,$44,$49,$56
	.dc.b	$00,$1d,$fe,$2e,$5f,$5f,$44,$44,$49,$56,$54,$57,$4f,$00,$1d,$fe
	.dc.b	$4d,$5f,$5f,$44,$46,$49,$58,$00,$1d,$fe,$32,$5f,$5f,$44,$46,$4c
	.dc.b	$4f,$4f,$52,$00,$1d,$fe,$33,$5f,$5f,$44,$46,$52,$41,$43,$00,$1d
	.dc.b	$fe,$34,$5f,$5f,$44,$46,$52,$45,$58,$50,$00,$1d,$fe,$49,$5f,$5f
	.dc.b	$44,$49,$45,$45,$43,$4e,$56,$00,$1d,$fe,$4e,$5f,$5f,$44,$4c,$44
	.dc.b	$45,$58,$50,$00,$1d,$fe,$4a,$5f,$5f,$44,$4d,$4f,$44,$00,$1d,$fe
	.dc.b	$2f,$5f,$5f,$44,$4d,$55,$4c,$00,$1d,$fe,$2d,$5f,$5f,$44,$4e,$45
	.dc.b	$47,$00,$1d,$fe,$2a,$5f,$5f,$44,$53,$47,$4e,$00,$1d,$fe,$35,$5f
	.dc.b	$5f,$44,$53,$55,$42,$00,$1d,$fe,$2c,$5f,$5f,$44,$53,$55,$42,$4f
	.dc.b	$4e,$45,$00,$1d,$fe,$4c,$5f,$5f,$44,$54,$4f,$46,$00,$1d,$fe,$1f
	.dc.b	$5f,$5f,$44,$54,$4f,$4c,$00,$1d,$fe,$1b,$5f,$5f,$44,$54,$4f,$53
	.dc.b	$00,$1d,$fe,$23,$5f,$5f,$44,$54,$53,$54,$00,$1d,$fe,$28,$5f,$5f
	.dc.b	$45,$43,$56,$54,$00,$1d,$fe,$24,$5f,$5f,$45,$58,$50,$00,$1d,$fe
	.dc.b	$3b,$5f,$5f,$46,$41,$42,$53,$00,$1d,$fe,$60,$5f,$5f,$46,$41,$44
	.dc.b	$44,$00,$1d,$fe,$5b,$5f,$5f,$46,$41,$44,$44,$4f,$4e,$45,$00,$1d
	.dc.b	$fe,$7b,$5f,$5f,$46,$41,$54,$41,$4e,$00,$1d,$fe,$69,$5f,$5f,$46
	.dc.b	$43,$45,$49,$4c,$00,$1d,$fe,$61,$5f,$5f,$46,$43,$4d,$50,$00,$1d
	.dc.b	$fe,$59,$5f,$5f,$46,$43,$4f,$53,$00,$1d,$fe,$67,$5f,$5f,$46,$43
	.dc.b	$56,$54,$00,$1d,$fe,$25,$5f,$5f,$46,$44,$49,$56,$00,$1d,$fe,$5e
	.dc.b	$5f,$5f,$46,$44,$49,$56,$54,$57,$4f,$00,$1d,$fe,$7d,$5f,$5f,$46
	.dc.b	$45,$43,$56,$54,$00,$1d,$fe,$54,$5f,$5f,$46,$45,$56,$41,$52,$47
	.dc.b	$00,$1d,$fe,$fe,$5f,$5f,$46,$45,$56,$45,$43,$53,$00,$1d,$fe,$ff
	.dc.b	$5f,$5f,$46,$45,$58,$50,$00,$1d,$fe,$6b,$5f,$5f,$46,$46,$43,$56
	.dc.b	$54,$00,$1d,$fe,$55,$5f,$5f,$46,$46,$49,$58,$00,$1d,$fe,$62,$5f
	.dc.b	$5f,$46,$46,$4c,$4f,$4f,$52,$00,$1d,$fe,$63,$5f,$5f,$46,$46,$52
	.dc.b	$41,$43,$00,$1d,$fe,$64,$5f,$5f,$46,$46,$52,$45,$58,$50,$00,$1d
	.dc.b	$fe,$79,$5f,$5f,$46,$47,$43,$56,$54,$00,$1d,$fe,$56,$5f,$5f,$46
	.dc.b	$49,$45,$45,$43,$4e,$56,$00,$1d,$fe,$7e,$5f,$5f,$46,$4c,$44,$45
	.dc.b	$58,$50,$00,$1d,$fe,$7a,$5f,$5f,$46,$4c,$4f,$47,$00,$1d,$fe,$6a
	.dc.b	$5f,$5f,$46,$4d,$4f,$44,$00,$1d,$fe,$5f,$5f,$5f,$46,$4d,$55,$4c
	.dc.b	$00,$1d,$fe,$5d,$5f,$5f,$46,$4e,$45,$47,$00,$1d,$fe,$5a,$5f,$5f
	.dc.b	$46,$4e,$50,$49,$00,$1d,$fe,$6e,$5f,$5f,$46,$50,$49,$00,$1d,$fe
	.dc.b	$6d,$5f,$5f,$46,$50,$4f,$57,$45,$52,$00,$1d,$fe,$6f,$5f,$5f,$46
	.dc.b	$52,$4e,$44,$00,$1d,$fe,$70,$5f,$5f,$46,$53,$47,$4e,$00,$1d,$fe
	.dc.b	$65,$5f,$5f,$46,$53,$49,$4e,$00,$1d,$fe,$66,$5f,$5f,$46,$53,$51
	.dc.b	$52,$00,$1d,$fe,$6c,$5f,$5f,$46,$53,$55,$42,$00,$1d,$fe,$5c,$5f
	.dc.b	$5f,$46,$53,$55,$42,$4f,$4e,$45,$00,$1d,$fe,$7c,$5f,$5f,$46,$54
	.dc.b	$41,$4e,$00,$1d,$fe,$68,$5f,$5f,$46,$54,$4f,$44,$00,$1d,$fe,$1e
	.dc.b	$5f,$5f,$46,$54,$4f,$4c,$00,$1d,$fe,$1d,$5f,$5f,$46,$54,$4f,$53
	.dc.b	$00,$1d,$fe,$53,$5f,$5f,$46,$54,$53,$54,$00,$1d,$fe,$58,$5f,$5f
	.dc.b	$46,$55,$53,$49,$4e,$47,$00,$1d,$fe,$51,$5f,$5f,$46,$56,$41,$4c
	.dc.b	$00,$1d,$fe,$50,$5f,$5f,$47,$43,$56,$54,$00,$1d,$fe,$26,$5f,$5f
	.dc.b	$48,$54,$4f,$53,$00,$1d,$fe,$13,$5f,$5f,$49,$44,$49,$56,$00,$1d
	.dc.b	$fe,$09,$5f,$5f,$49,$45,$45,$44,$43,$4e,$56,$00,$1d,$fe,$4f,$5f
	.dc.b	$5f,$49,$45,$45,$46,$43,$4e,$56,$00,$1d,$fe,$7f,$5f,$5f,$49,$4d
	.dc.b	$55,$4c,$00,$1d,$fe,$08,$5f,$5f,$49,$55,$53,$49,$4e,$47,$00,$1d
	.dc.b	$fe,$18,$5f,$5f,$4c,$44,$49,$56,$00,$1d,$fe,$01,$5f,$5f,$4c,$4d
	.dc.b	$4f,$44,$00,$1d,$fe,$02,$5f,$5f,$4c,$4d,$55,$4c,$00,$1d,$fe,$00
	.dc.b	$5f,$5f,$4c,$4f,$47,$00,$1d,$fe,$3a,$5f,$5f,$4c,$54,$4f,$44,$00
	.dc.b	$1d,$fe,$1a,$5f,$5f,$4c,$54,$4f,$46,$00,$1d,$fe,$1c,$5f,$5f,$4c
	.dc.b	$54,$4f,$53,$00,$1d,$fe,$11,$5f,$5f,$4e,$50,$49,$00,$1d,$fe,$3e
	.dc.b	$5f,$5f,$4f,$54,$4f,$53,$00,$1d,$fe,$15,$5f,$5f,$50,$49,$00,$1d
	.dc.b	$fe,$3d,$5f,$5f,$50,$4f,$57,$45,$52,$00,$1d,$fe,$3f,$5f,$5f,$52
	.dc.b	$41,$4e,$44,$00,$1d,$fe,$0e,$5f,$5f,$52,$41,$4e,$44,$4f,$4d,$49
	.dc.b	$5a,$45,$00,$1d,$fe,$0c,$5f,$5f,$52,$4e,$44,$00,$1d,$fe,$40,$5f
	.dc.b	$5f,$53,$49,$4e,$00,$1d,$fe,$36,$5f,$5f,$53,$51,$52,$00,$1d,$fe
	.dc.b	$3c,$5f,$5f,$53,$52,$41,$4e,$44,$00,$1d,$fe,$0d,$5f,$5f,$53,$54
	.dc.b	$4f,$42,$00,$1d,$fe,$16,$5f,$5f,$53,$54,$4f,$44,$00,$1d,$fe,$22
	.dc.b	$5f,$5f,$53,$54,$4f,$46,$00,$1d,$fe,$52,$5f,$5f,$53,$54,$4f,$48
	.dc.b	$00,$1d,$fe,$12,$5f,$5f,$53,$54,$4f,$4c,$00,$1d,$fe,$10,$5f,$5f
	.dc.b	$53,$54,$4f,$4f,$00,$1d,$fe,$14,$5f,$5f,$54,$41,$4e,$00,$1d,$fe
	.dc.b	$38,$5f,$5f,$55,$44,$49,$56,$00,$1d,$fe,$05,$5f,$5f,$55,$4d,$4f
	.dc.b	$44,$00,$1d,$fe,$06,$5f,$5f,$55,$4d,$55,$4c,$00,$1d,$fe,$04,$5f
	.dc.b	$5f,$55,$53,$49,$4e,$47,$00,$1d,$fe,$21,$5f,$5f,$56,$41,$4c,$00
	.dc.b	$1d,$fe,$20
L005a8b:
	.dc.b	$00
getsize::
	move.w	#$0001,($0312,a6)
	move.b	(a5)+,d0
	jsr	(toupper)
	cmpi.b	#$53,d0			;'S'
	bne	L005aa6
	clr.w	($0312,a6)
	bra	L005abc

L005aa6:
	cmpi.b	#$57,d0			;'W'
	beq	L005abc
	cmpi.b	#$4c,d0			;'L'
	bne	L005aba
	move.w	#$0002,($0312,a6)
	bra	L005abc

L005aba:
	move.b	-(a5),d0
L005abc:
	rts

L005abe:
	subq.w	#2,a4
	move.w	d5,d0
	add.w	d0,d0
	move.w	(L005acc,pc,d0.w),d0
	jmp	(L005acc,pc,d0.w)

L005acc:
	.dc.w	L005b68-L005acc
	.dc.w	L005ade-L005acc
	.dc.w	L005b68-L005acc
	.dc.w	L005b96-L005acc
	.dc.w	L005bc4-L005acc
	.dc.w	L005bc8-L005acc
	.dc.w	L005bfe-L005acc
	.dc.w	L005c3c-L005acc
	.dc.w	L005c84-L005acc
L005ade:
	move.w	#$003f,d0		;'?'
	clr.w	($0834,a6)
	bsr	L005b28
	bne	L005af6
	bsr	L005cca
	subq.w	#1,d0
	bmi	L001102
	move.b	d1,(a4)+
L005af6:
	cmpi.b	#$2c,(a5)		;','
	bne	L005b12
L005afc:
	bsr	L005b1e
	bne	L005b0c
	bsr	L005cd4
	subq.w	#1,d0
	bmi	L001102
	move.b	d1,(a4)+
L005b0c:
	cmpi.b	#$2c,(a5)		;','
	beq	L005afc
L005b12:
	move.w	a4,d0
	andi.w	#$0001,d0
	beq	L005b1c
	clr.b	(a4)+
L005b1c:
	rts

L005b1e:
	addq.l	#1,a5
	bsr	L005b28
	bne	L005b26
	subq.l	#1,a5
L005b26:
	rts

L005b28:
	movem.l	d1-d4,-(a7)
	move.w	d0,d3
	jsr	(skpblk)
	cmpi.b	#$22,(a5)		;'"'
	beq	L005b4a
	cmpi.b	#$27,(a5)		;'''
	beq	L005b4a
	move.w	d3,d0
	moveq.l	#$00,d1
	movem.l	(a7)+,d1-d4
	rts

L005b4a:
	move.b	(a5)+,d4
L005b4c:
	move.b	(a5)+,d0
	beq	L005b5e
	cmp.b	d4,d0
	beq	L005b5e
	move.b	d0,(a4)+
	dbra	d3,L005b4c
	bra	L001102

L005b5e:
	move.w	d3,d0
	moveq.l	#$ff,d1
	movem.l	(a7)+,d1-d4
	rts

L005b68:
	move.w	#$003f,d0		;'?'
	clr.w	($0834,a6)
	bsr	L005cca
	subq.w	#2,d0
	bcs	L001102
	move.w	d1,(a4)+
	cmpi.b	#$2c,(a5)		;','
	bne	L005b94
L005b82:
	bsr	L005cd4
	subq.w	#2,d0
	bcs	L001102
	move.w	d1,(a4)+
	cmpi.b	#$2c,(a5)		;','
	beq	L005b82
L005b94:
	rts

L005b96:
	move.w	#$003f,d0		;'?'
	clr.w	($0834,a6)
	bsr	L005cca
	subq.w	#4,d0
	bcs	L001102
	move.l	d1,(a4)+
	cmpi.b	#$2c,(a5)		;','
	bne	L005bc2
L005bb0:
	bsr	L005cd4
	subq.w	#4,d0
	bcs	L001102
	move.l	d1,(a4)+
	cmpi.b	#$2c,(a5)		;','
	beq	L005bb0
L005bc2:
	rts

L005bc4:
	bra	L001102

L005bc8:
	move.w	#$003f,d0		;'?'
	st.b	($0834,a6)
	bsr	L005cca
	subq.w	#4,d0
	bcs	L001102
	move.l	($0940,a6),(a4)+
	cmpi.b	#$2c,(a5)		;','
	bne	L005bf8
L005be4:
	bsr	L005cd4
	subq.w	#4,d0
	bcs	L001102
	move.l	($0940,a6),(a4)+
	cmpi.b	#$2c,(a5)		;','
	beq	L005be4
L005bf8:
	clr.w	($0834,a6)
	rts

L005bfe:
	move.w	#$003f,d0		;'?'
	st.b	($0834,a6)
	bsr	L005cca
	subq.w	#8,d0
	bcs	L001102
	move.l	($0940,a6),(a4)+
	move.l	($0944,a6),(a4)+
	cmpi.b	#$2c,(a5)		;','
	bne	L005c36
L005c1e:
	bsr	L005cd4
	subq.w	#8,d0
	bcs	L001102
	move.l	($0940,a6),(a4)+
	move.l	($0944,a6),(a4)+
	cmpi.b	#$2c,(a5)		;','
	beq	L005c1e
L005c36:
	clr.w	($0834,a6)
	rts

L005c3c:
	move.w	#$003f,d0		;'?'
	st.b	($0834,a6)
	bsr	L005cca
	sub.w	#$000c,d0
	bcs	L001102
	move.l	($0940,a6),(a4)+
	move.l	($0944,a6),(a4)+
	move.l	($0948,a6),(a4)+
	cmpi.b	#$2c,(a5)		;','
	bne	L005c7e
L005c62:
	bsr	L005cd4
	sub.w	#$000c,d0
	bcs	L001102
	move.l	($0940,a6),(a4)+
	move.l	($0944,a6),(a4)+
	move.l	($0948,a6),(a4)+
	cmpi.b	#$2c,(a5)		;','
	beq	L005c62
L005c7e:
	clr.w	($0834,a6)
	rts

L005c84:
	move.w	#$003f,d0		;'?'
	st.b	($0834,a6)
	bsr	L005cca
	sub.w	#$000c,d0
	bcs	L001102
	move.l	($0940,a6),(a4)+
	move.l	($0944,a6),(a4)+
	move.l	($0948,a6),(a4)+
	cmpi.b	#$2c,(a5)		;','
	bne	L005cc4
L005ca8:
	bsr	L005cd4
	sub.w	#$000c,d0
	bcs	L001102
	move.l	($0940,a6),(a4)+
	move.l	($0944,a6),(a4)+
	move.l	($0948,a6),(a4)+
	cmpi.b	#$2c,(a5)		;','
	beq	L005ca8
L005cc4:
	clr.w	($0834,a6)
	rts

L005cca:
	move.l	d0,-(a7)
	bsr	L001936
	move.l	(a7)+,d0
	rts

L005cd4:
	move.l	d0,-(a7)
	bsr	L001934
	move.l	(a7)+,d0
	rts

inivset::
	lea.l	(L005fe4),a0
	movea.l	#$00000008,a1
	moveq.l	#$05,d0
L005cec:
	move.l	(a0)+,(a1)+
	dbra	d0,L005cec
	addq.l	#4,a0
	addq.l	#4,a1
	move.l	(a0),(a1)
	rts

L005cfa:
	.dc.b	$61,$00,$00,$ac,$62,$75,$73,$20,$65,$72,$72,$6f,$72,$00
L005d08:
	.dc.b	$61,$00,$00,$9e,$61,$64,$64,$72,$65,$73,$73,$20,$65,$72,$72,$6f
	.dc.b	$72,$00
L005d1a:
	.dc.b	$61,$00,$02,$3e,$75,$6e,$64,$65,$66,$69,$6e,$65,$64,$20,$69,$6e
	.dc.b	$73,$74,$72,$75,$63,$74,$69,$6f,$6e,$00
L005d34:
	.dc.b	$61,$00,$02,$24,$7a,$65,$72,$6f,$20,$64,$69,$76,$69,$64,$65,$00
L005d44:
	.dc.b	$61,$00,$02,$14,$63,$68,$6b,$20,$69,$6e,$73,$74,$72,$75,$63,$74
	.dc.b	$69,$6f,$6e,$00
L005d58:
	.dc.b	$61,$00,$02,$00,$74,$72,$61,$70,$76,$20,$69,$6e,$73,$74,$72,$75
	.dc.b	$63,$74,$69,$6f,$6e,$00
L005d6e:
	.dc.b	$61,$00,$01,$ea,$70,$72,$69,$76,$69,$6c,$65,$67,$65,$20,$76,$69
	.dc.b	$6f,$6c,$61,$74,$69,$6f,$6e,$00
tracei::
	.dc.b	$61,$00,$01,$d2,$74,$72,$61,$63,$65,$00
L005d90:
	.dc.b	$61,$00,$01,$c8,$6c,$69,$6e,$65,$20,$31,$30,$31,$30,$20,$65,$6d
	.dc.b	$75,$6c,$61,$74,$6f,$72,$00,$00,$48,$e7,$ff,$fe,$4d,$f9
	.dc.l	work
	.dc.b	$4e,$b9
	.dc.l	resbp
	.dc.b	$46,$fc,$20,$00,$2f,$39
	.dc.l	monpdb
	.dc.b	$ff,$80,$58,$8f,$b0,$b9
	.dc.l	monpdb
	.dc.b	$66,$28,$4c,$df,$7f,$ff,$4e,$b9
	.dc.l	newline
	.dc.b	$4e,$b9
	.dc.l	newline
L005dde:
	.dc.b	' WN¹'
L005de2:
	.dc.l	print
	.dc.b	$41,$f9
	.dc.l	L006008
	.dc.b	$4e,$b9
	.dc.l	print
	.dc.b	$60,$00,$01,$56
L005df6:
	move.l	d0,(usrpdb)
	movem.l	(a7)+,d0-d7/a0-a6
	move.l	a6,-(a7)
	movea.l	#work,a6
	movem.l	d0-d7/a0-a5,($0056,a6)
	move.l	(a7)+,($008e,a6)
	move.l	usp,a5
	move.l	a5,($009a,a6)
	move.l	a7,d0
	addi.l	#$00000012,d0
	move.l	d0,($0092,a6)
	movea.l	a7,a4
	move.w	($000c,a4),($00a0,a6)
	lea.l	(L006017),a0
	jsr	(print)
	movea.l	(a4)+,a0
	jsr	(print)
	jsr	(newline)
	lea.l	(L006034),a0
	jsr	(print)
	move.l	($0002,a4),d1
	jsr	(putlhex)
	jsr	(newline)
	lea.l	(L00602f),a0
	jsr	(print)
	movea.l	#$00000008,a0
	move.l	#L005ec2,d1
	moveq.l	#$08,d0
L005e7c:
	move.l	d1,(a0)+
	dbra	d0,L005e7c
	movea.l	($000a,a4),a5
	move.w	($0006,a4),d0
	cmp.w	(a5),d0
	beq	L005eb2
	cmp.w	-(a5),d0
	beq	L005eb2
	cmp.w	-(a5),d0
	beq	L005eb2
	cmp.w	-(a5),d0
	beq	L005eb2
	cmp.w	-(a5),d0
	beq	L005eb2
	cmp.w	-(a5),d0
	beq	L005eb2
	cmp.w	-(a5),d0
	beq	L005eb2
	cmp.w	-(a5),d0
	beq	L005eb2
	cmp.w	-(a5),d0
	beq	L005eb2
	lea.l	($0006,a4),a5
L005eb2:
	move.l	a5,($0096,a6)
	move.l	a4,-(a7)
	jsr	(dissub)
	movea.l	(a7)+,a4
	bra	L005ece

L005ec2:
	lea.l	(L00606d),a0
	jsr	(print)
L005ece:
	lea.l	(L00604a),a0
	jsr	(print)
	move.b	#$49,d0			;'I'
	btst.b	#$03,($0001,a4)
	beq	L005eea
	move.b	#$4e,d0			;'N'
L005eea:
	jsr	(putch)
	movea.l	#L006062,a0
	jsr	(print)
	move.b	#$52,d0			;'R'
	btst.b	#$04,($0001,a4)
	bne	L005f0c
	move.b	#$57,d0			;'W'
L005f0c:
	jsr	(putch)
	movea.l	#L006068,a0
	jsr	(print)
	move.b	($0001,a4),d0
	andi.b	#$07,d0
	addi.b	#$30,d0			;'0'
	jsr	(putch)
	jsr	(newline)
	move.w	($0464,a6),-(a7)
	move.w	#$ffff,($0464,a6)
	jsr	(allregi)
	move.w	(a7)+,($0464,a6)
L005f4a:
	bsr	inivset
	move.l	($0096,a6),($0032,a6)
	jmp	(main)

L005f5a:
	move.l	a6,-(a7)
	movea.l	#work,a6
	jsr	(resbp)
	move.w	#$2000,sr
	movem.l	d0-d7/a0-a5,($0056,a6)
	move.l	(a7)+,($008e,a6)
	move.l	usp,a5
	move.l	a5,($009a,a6)
	move.l	(monpdb),-(a7)
	DOS	_SETPDB
	addq.l	#4,a7
	move.l	d0,(usrpdb)
	movea.l	#L006017,a0
	jsr	(print)
	movea.l	(a7)+,a0
	jsr	(print)
	movea.l	#L00602f,a0
	jsr	(print)
	move.w	(a7),($00a0,a6)
	move.l	($0002,a7),d1
	move.l	d1,($0096,a6)
	jsr	(putlhex)
	jsr	(newline)
	move.l	a7,d0
	addq.l	#6,d0
	move.l	d0,($0092,a6)
	jsr	(allregi)
	jsr	(inivset)
	move.l	($0096,a6),($0032,a6)
	jmp	(main)

L005fe4:
	.dc.l	L005cfa
	.dc.l	L005d08
	.dc.l	L005d1a
	.dc.l	L005d34
	.dc.l	L005d44
	.dc.l	L005d58
	.dc.l	L005d6e
	.dc.l	tracei
	.dc.l	L005d90
L006008:
	.dc.b	' in debugger',$0d,$0a,$00
L006017:
	.dc.b	$0d,$0a
	.dc.b	'Exceptional Abort By ',$00
L00602f:
	.dc.b	' at ',$00
L006034:
	.dc.b	' By Memory Access of ',$00
L00604a:
	.dc.b	$0d,$0a
	.dc.b	'system status =  I/N=',$00
L006062:
	.dc.b	' R/W=',$00
L006068:
	.dc.b	' FC=',$00
L00606d:
	.dc.b	$0d,$0a
	.dc.b	'double exception in system status display',$0d,$0a,$00,$00
L00609c:
	bsr	newline
	jmp	(main)

input::
	move.b	#$3a,d0			;':'
	bsr	putch
	bsr	inplin
	movea.l	a0,a5
	rts

inplin::
	lea.l	($059c,a6),a0
	move.l	a0,d5
	bsr	getln
	cmpi.b	#$03,d0
	beq	L00609c
	move.w	d0,-(a7)
	move.l	a0,d0
	bsr	L00653a
	move.w	(a7)+,d0
	rts

inpcom::
	move.b	#$2d,d0			;'-'
	bsr	putch
	lea.l	($046e,a6),a0
	move.l	a0,d5
	bsr	getln
	cmpi.b	#$03,d0
	beq	L00609c
	move.w	d0,-(a7)
	move.l	a0,d0
	bsr	L00653a
	move.w	(a7)+,d0
	movea.l	a0,a5
	rts

getln_co::
	movea.l	d5,a0
	move.b	#$ff,(-$0002,a0)
	pea.l	(-$0002,a0)
	DOS	_GETS
	addq.l	#4,a7
	clr.l	d0
	move.b	(-$0001,a0),d0
	lea.l	(a0,d0.w),a1
	clr.b	(a1)
	clr.w	d0
	bra	newline

getln_rs::
	movea.l	d5,a0
L00611a:
	bsr	inch
	cmpi.b	#$03,d0
	beq	L0061b0
	cmpi.b	#$08,d0
	beq	L006138
	cmpi.b	#$18,d0
	beq	L006138
	cmpi.b	#$7f,d0
	bne	L006156
L006138:
	cmpa.l	d5,a0
	bls	L006168
	moveq.l	#$08,d0
	bsr	putc
	moveq.l	#$20,d0			;' '
	bsr	putc
	moveq.l	#$08,d0
	bsr	putc
	subq.l	#1,a0
	cmpa.l	d5,a0
	bls	L006168
	bra	L00611a

L006156:
	cmpi.b	#$15,d0
	bne	L00616c
L00615c:
	move.b	#$23,d0			;'#'
	bsr	putc
	bsr	newline
L006168:
	bra	getln

L00616c:
	cmpi.b	#$12,d0
	beq	L00618c
	cmpi.b	#$0d,d0
	beq	L0061a8
	move.l	d5,d4
	add.l	#$00000063,d4
	cmp.l	a0,d4
	bls	L00615c
	move.b	d0,(a0)+
	bsr	putc
	bra	L00611a

L00618c:
	movea.l	d5,a1
	bsr	newline
	move.b	#$20,d0			;' '
	bsr	putc
	exg.l	a1,a0
	clr.b	(a1)
	bsr	print
	exg.l	a0,a1
	bra	L00611a

L0061a8:
	bsr	newline
	clr.b	(a0)
	movea.l	a0,a1
	movea.l	d5,a0
L0061b0:
	rts

inch_co::
	move.w	#$00ff,-(a7)
L0061b6:
	DOS	_INPOUT
	tst.w	d0
	beq	L0061b6
	addq.l	#2,a7
	rts

inch_rs::
	bra	conin

putch_co::
	move.w	d0,-(a7)
	DOS	_PUTCHAR
	move.w	(a7)+,d0
	addq.w	#1,($0022,a6)
	rts

putch_rs::
	bsr	putc
	cmpi.b	#$03,d0
	beq	L00609c
	cmpi.b	#$1b,d0
	beq	L00609c
	rts

putc_co::
	move.w	d0,-(a7)
	DOS	_PUTCHAR
	addq.l	#2,a7
	addq.w	#1,($0022,a6)
	rts

putc_rs::
	cmpi.b	#$0d,d0
	bne	L006202
	bsr	conout
	clr.w	($0022,a6)
	bra	L006210

L006202:
	cmpi.b	#$0a,d0
	beq	L00620c
	addq.w	#1,($0022,a6)
L00620c:
	bsr	conout
L006210:
	clr.l	d0
	bsr	const
	beq	L006226
	bsr	inch
	cmpi.b	#$13,d0
	bne	L006226
	bsr	inch
L006226:
	rts

newline::
	bra	L006240

L00622a:
	move.b	#$0d,d0
	bsr	putch
	move.b	#$0a,d0
	bsr	putch
	clr.w	($0022,a6)
	rts

L006240:
	moveq.l	#$0d,d0
	bsr	putch
	moveq.l	#$0a,d0
	bra	putch

puttab::
	moveq.l	#$09,d0
	bra	putch

putspc::
	moveq.l	#$20,d0			;' '
	bra	putch

print_co::
	pea.l	(a0)
	DOS	_PRINT
	addq.l	#4,a7
	rts

print_rs::
	move.b	(a0)+,d0
	beq	L00626c
	bsr	putch
	bra	print

L00626c:
	rts

getch_co::
	DOS	_GETCHAR
	rts

getch_rs::
	bsr	inch
	move.w	d0,-(a7)
	bsr	putch
	move.w	(a7)+,d0
	rts

putint::
	move.l	d6,d3
	bsr	itoa
	bsr	print
	rts

itoa::
	lea.l	($0600,a6),a0
	clr.b	-(a0)
	moveq.l	#$09,d2
	moveq.l	#$0a,d6
	move.l	d3,d7
	bpl	L0062a8
	neg.l	d7
	bpl	L0062a8
	subq.l	#1,d7
	bsr	divide
	addi.b	#$31,d5			;'1'
	bra	L0062b0

L0062a8:
	bsr	divide
	addi.b	#$30,d5			;'0'
L0062b0:
	move.b	d5,-(a0)
	tst.l	d7
	dbeq	d2,L0062a8
	moveq.l	#$0a,d0
	sub.b	d2,d0
	tst.l	d3
	bpl	L0062c6
	move.b	#$2d,-(a0)		;'-'
	addq.w	#1,d0
L0062c6:
	rts

putlhex::
	swap.w	d1
	bsr	putwhex
	swap.w	d1
putwhex::
	move.w	#$0004,-(a7)
L0062d2:
	rol.w	#4,d1
	bsr	L0062e8
	subq.w	#1,(a7)
	bne	L0062d2
	adda.l	#$00000002,a7
	rts

putshex::
	rol.b	#4,d1
	bsr	L0062e8
	rol.b	#4,d1
L0062e8:
	move.b	d1,d0
	andi.b	#$0f,d0
	cmpi.b	#$0a,d0
	blt	L0062f8
	addi.b	#$07,d0
L0062f8:
	addi.b	#$30,d0			;'0'
	bsr	putch
	rts

wrtlhex::
	swap.w	d1
	bsr	wrtwhex
	swap.w	d1
wrtwhex::
	move.w	#$0004,-(a7)
L00630c:
	rol.w	#4,d1
	bsr	wrthex
	subq.w	#1,(a7)
	bne	L00630c
	adda.l	#$00000002,a7
	rts

wrtshex::
	rol.b	#4,d1
	bsr	wrthex
	rol.b	#4,d1
wrthex::
	move.b	d1,d0
	andi.b	#$0f,d0
	cmpi.b	#$0a,d0
	blt	L006332
	addi.b	#$07,d0
L006332:
	addi.b	#$30,d0			;'0'
	move.b	d0,(a3)+
	rts

ioinit::
	rts

const::
	IOCS	_ISNS232C
	tst.w	d0
	rts

conin::
	bsr	const
	beq	conin
	IOCS	_INP232C
	rts

conout::
	move.w	d1,-(a7)
	move.w	d0,d1
	cmpi.b	#$fe,d0
	bcc	L006364
L006358:
	IOCS	_OSNS232C
	tst.w	d0
	beq	L006358
	IOCS	_OUT232C
L006364:
	move.w	(a7)+,d1
	rts

rd_out::
	bsr	L006414
	move.w	#$0001,(L006506)
	btst.b	#$02,(L01177e)
	bne	L0063cc
	lea.l	(L011782),a4
	tst.w	(a4)
	bmi	L006394
	bsr	L0065f2
	move.w	#$ffff,(L01188e)
L006394:
	bsr	L00644c
	tst.w	(L006504)
	beq	L0063a8
	move.w	d0,(a4)
	clr.w	($0006,a4)
	bra	L0063bc

L0063a8:
	lea.l	(L015ec6),a0
	tst.b	(a0)
	beq	L0063c4
	bsr	L00657a
	tst.w	d0
	bmi	deverr
L0063bc:
	move.w	#$0002,(L01188e)
L0063c4:
	bsr	setoutf
	bra	L00609c

L0063cc:
	lea.l	(L011812),a4
	tst.w	(a4)
	bmi	L0063e2
	bsr	L0065f2
	move.w	#$ffff,(L011780)
L0063e2:
	bsr	L00644c
	tst.w	(L006504)
	beq	L0063f4
	move.w	d0,(a4)
	clr.w	($0006,a4)
	bra	L006408

L0063f4:
	lea.l	(L015ec6),a0
	tst.b	(a0)
	beq	L006410
	bsr	L00657a
	tst.w	d0
	bmi	deverr
L006408:
	move.w	#$0000,(L011780)
L006410:
	bra	L00609c

L006414:
	moveq.l	#$00,d1
L006416:
	move.b	(a5)+,d0
	cmpi.b	#$3e,d0			;'>'
	beq	L00643a
	cmpi.b	#$2b,d0			;'+'
	beq	L00643a
	cmpi.b	#$5c,d0			;'\'
	beq	L006440
	cmpi.b	#$40,d0			;'@'
	beq	L006446
	subq.l	#1,a5
	move.b	d1,(L01177e)
	rts

L00643a:
	ori.b	#$01,d1
	bra	L006416

L006440:
	ori.b	#$02,d1
	bra	L006416

L006446:
	ori.b	#$04,d1
	bra	L006416

L00644c:
	clr.w	(L006504)
	jsr	(skpblk)
	lea.l	(L015ec6),a0
	moveq.l	#$7f,d1
L006460:
	cmpi.b	#$20,(a5)		;' '
	bls	L00646c
	move.b	(a5)+,(a0)+
	dbra	d1,L006460
L00646c:
	clr.b	(a0)+
	lea.l	(L015ec6),a0
	tst.b	(a0)
	beq	L0064a8
	move.l	a0,-(a7)
	bsr	L0064ea
	tst.l	d0
	bmi	L0064a4
	move.w	d0,-(a7)
	move.w	d0,-(a7)
	move.w	#$0000,-(a7)
	DOS	_IOCTRL
	addq.l	#4,a7
	btst.l	#$07,d0
	bne	L0064ac
L006492:
	tst.w	(L006506)
	beq	L0064a2
	clr.w	(L006506)
	DOS	_CLOSE
L0064a2:
	move.w	(a7)+,d0
L0064a4:
	movea.l	(a7)+,a0
	rts

L0064a8:
	moveq.l	#$ff,d0
	rts

L0064ac:
	tst.w	(L006506)
	beq	L0064e2
	move.l	a5,-(a7)
	lea.l	(L015ec6),a5
	lea.l	(L006508),a0
	jsr	(strcmp)
	movea.l	(a7)+,a5
	bne	L0064dc
	move.w	#$0001,(L006504)
	clr.w	(L006506)
	bra	L006492

L0064dc:
	clr.w	(L006506)
L0064e2:
	DOS	_CLOSE
	addq.l	#2,a7
	bra	deverr

L0064ea:
	tst.w	(L006506)
	beq	L0064f8
	move.w	#$0001,-(a7)
	bra	L0064fc

L0064f8:
	move.w	#$0000,-(a7)
L0064fc:
	move.l	a0,-(a7)
	DOS	_OPEN
	addq.l	#6,a7
	rts

L006504:
	.dc.w	$0000
L006506:
	.dc.w	$0000
L006508:
	.dc.b	'PRN',$00
putch_rf::
	movem.l	d0-d1/a4,-(a7)
	lea.l	(L011782),a4
	bsr	put_rf
	movem.l	(a7)+,d0-d1/a4
	rts

print_rf::
	movem.l	d0-d1/a0/a4,-(a7)
	lea.l	(L011782),a4
L00652a:
	move.b	(a0)+,d0
	beq	L006534
	bsr	put_rf
	bra	L00652a

L006534:
	movem.l	(a7)+,d0-d1/a0/a4
	rts

L00653a:
	tst.w	(L011780)
	bpl	L006544
	rts

L006544:
	movem.l	d0-d1/a0/a4,-(a7)
	movea.l	d0,a0
	lea.l	(L011812),a4
	cmpi.w	#$3e40,(a0)		;'>@'
	bne	L00655e
	cmpi.b	#$21,($0002,a0)		;'!'
	bcs	L006574
L00655e:
	move.b	(a0)+,d0
	beq	L006568
	bsr	put_rf
	bra	L00655e

L006568:
	moveq.l	#$0d,d0
	bsr	put_rf
	moveq.l	#$0a,d0
	bsr	put_rf
L006574:
	movem.l	(a7)+,d0-d1/a0/a4
	rts

L00657a:
	btst.b	#$00,(L01177e)
	bne	L006590
L006584:
	move.w	#$0000,-(a7)
	move.l	a0,-(a7)
	DOS	_CREATE
	addq.l	#6,a7
	bra	L0065ea

L006590:
	move.w	#$0001,-(a7)
	move.l	a0,-(a7)
	DOS	_OPEN
	addq.l	#6,a7
	tst.l	d0
	bmi	L006584
	lea.l	(-$000c,a7),a7
	move.w	d0,(a7)
	move.l	#$ffffffff,($0002,a7)
	move.w	#$0002,($0006,a7)
	DOS	_SEEK
	move.l	a7,d0
	addi.l	#$0000000a,d0
	move.l	d0,($0002,a7)
	move.l	#$00000001,($0006,a7)
	DOS	_READ
	cmpi.b	#$1a,($000a,a7)
	bne	L0065e2
	move.l	#$ffffffff,($0002,a7)
	move.w	#$0002,($0006,a7)
	DOS	_SEEK
L0065e2:
	moveq.l	#$00,d0
	move.w	(a7),d0
	lea.l	($000c,a7),a7
L0065ea:
	move.w	d0,(a4)
	clr.w	($0006,a4)
	rts

L0065f2:
	bsr	flush_rf
	move.w	(a4),-(a7)
	DOS	_CLOSE
	addq.l	#2,a7
	move.w	#$ffff,(a4)
	rts

flushout::
	lea.l	(L011782),a4
	bsr	L00660e
	lea.l	(L011812),a4
L00660e:
	tst.w	(a4)
	bmi	L006614
	bsr	L0065f2
L006614:
	rts

put_rf::
	tst.b	d0
	beq	flush_rf
	move.w	($0006,a4),d1
	move.b	d0,($10,a4,d1.w)
	addq.w	#1,d1
	move.w	d1,($0006,a4)
	cmp.w	($0004,a4),d1
	bcc	flush_rf
	cmpi.b	#$0a,d0
	beq	flush_rf
	rts

flush_rf::
	move.w	($0006,a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a4,d0
	addi.l	#$00000010,d0
	move.l	d0,-(a7)
	move.w	(a4),-(a7)
	DOS	_WRITE
	lea.l	($000a,a7),a7
	clr.w	($0006,a4)
	rts

rd_in::
	clr.w	(L006506)
	tst.l	(L006690)
	beq	L00666c
L006664:
	tst.b	(a5)+
	bne	L006664
	subq.l	#1,a5
	rts

L00666c:
	bsr	L00644c
	move.w	d0,(L011842)
	bmi	deverr
	move.l	d0,(L006690)
	move.w	#$0002,(L01188a)
	bsr	setinf
	bra	L00609c

L006690:
	.dc.l	$00000000
getch_rf::
	bsr	inch_rf
	bsr	putch
	rts

getln_rf::
	move.l	a0,-(a7)
	movea.l	d5,a0
	clr.w	d1
L0066a2:
	bsr	inch_rf
	cmpi.b	#$0d,d0
	beq	L0066c6
	cmpi.b	#$1a,d0
	beq	L0066d2
	cmpi.b	#$03,d0
	beq	L0066e4
	cmp.w	#$00ff,d1
	beq	L0066a2
	move.b	d0,(a0)+
	bsr	putch
	addq.w	#1,d1
	bra	L0066a2

L0066c6:
	clr.b	(a0)
	bsr	newline
	moveq.l	#$0d,d0
	movea.l	(a7)+,a0
	rts

L0066d2:
	lea.l	(L011848),a0
	bsr	print
	moveq.l	#$1a,d0
	movea.l	(a7)+,a0
	clr.b	(a0)
	rts

L0066e4:
	bsr	putch
	bsr	newline
	bra	L00609c

inch_rf::
	move.w	(L011846),d0
	beq	L006726
	move.l	a0,-(a7)
	lea.l	(stack),a0
	move.w	(L011844),d0
	move.b	(a0,d0.w),d0
	subq.w	#1,(L011846)
	addq.w	#1,(L011844)
	movea.l	(a7)+,a0
	cmpi.b	#$1a,d0
	beq	L006752
	cmpi.b	#$0a,d0
	beq	inch_rf
	rts

L006726:
	move.l	#$00000400,-(a7)
	pea.l	(stack)
	move.w	(L011842),-(a7)
	DOS	_READ
	lea.l	($000a,a7),a7
	tst.l	d0
	bmi	L006752
	beq	L006752
	move.w	d0,(L011846)
	clr.w	(L011844)
	bra	inch_rf

L006752:
	move.w	(L011842),-(a7)
	DOS	_CLOSE
	addq.l	#2,a7
	move.w	#$ffff,(L01188a)
	bsr	setinf
	clr.l	(L006690)
	moveq.l	#$1a,d0
	rts

conioset::
	move.w	d0,(L011888)
	move.w	d0,(L01188c)
	bsr	setinf
	bsr	setoutf
	rts

setinf::
	movem.l	d0-d3/a0-a1,-(a7)
	move.w	(L011888),d2
	move.w	(L01188a),d1
	bmi	L006796
	moveq.l	#$ff,d2
L006796:
	lea.l	(L01184c),a1
	bsr	setsub
	movem.l	(a7)+,d0-d3/a0-a1
	rts

setoutf::
	movem.l	d0-d3/a0-a1,-(a7)
	move.w	(L01188e),d1
	move.w	(L01188c),d2
	btst.b	#$01,(L01177e)
	beq	L0067c4
	tst.w	d1
	bmi	L0067c4
	moveq.l	#$ff,d2
L0067c4:
	lea.l	(L01186a),a1
	bsr	setsub
	movem.l	(a7)+,d0-d3/a0-a1
	rts

setsub::
	moveq.l	#$02,d3
	asl.w	#1,d1
	asl.w	#1,d2
	bpl	L0067dc
	exg.l	d1,d2
L0067dc:
	movea.l	(a1),a0
	tst.w	d1
	bmi	L0067f6
	move.w	($04,a1,d1.w),d0
	subq.w	#2,d0
	move.w	#$6100,(a0)+
	move.w	d0,(a0)+
	move.w	($04,a1,d2.w),d0
	subq.w	#6,d0
	bra	L006800

L0067f6:
	tst.w	d2
	bmi	L006808
	move.w	($04,a1,d2.w),d0
	subq.w	#2,d0
L006800:
	move.w	#$6000,(a0)+
	move.w	d0,(a0)+
	bra	L00680c

L006808:
	move.w	#$4e75,(a0)		;'Nu'
L00680c:
	lea.l	($000a,a1),a1
	dbra	d3,L0067dc
	rts

inch::
	bra	inch_co

L00681a:
	.dc.b	$00,$00,$00,$00
getch::
	bra	getch_co

L006822:
	.dc.b	$00,$00,$00,$00
getln::
	bra	getln_co

L00682a:
	.dc.b	$00,$00,$00,$00
putch::
	bra	putch_co

L006832:
	.dc.b	$00,$00,$00,$00
putc::
	bra	putc_co

L00683a:
	.dc.b	$00,$00,$00,$00
print::
	bra	print_co

L006842:
	.dc.b	$00,$00,$00,$00
reglist::
	.dc.l	dx0_sym
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$56
	.dc.l	L006af8
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$5a
	.dc.l	L006afc
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$5e
	.dc.l	L006b00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$62
	.dc.l	L006b04
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$66
	.dc.l	L006b08
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$6a
	.dc.l	L006b0c
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$6e
	.dc.l	L006b10
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$72
	.dc.l	L006b14
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$01,$00,$76
	.dc.l	L006b18
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$01,$00,$7a
	.dc.l	L006b1c
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$01,$00,$7e
	.dc.l	L006b20
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$01,$00,$82
	.dc.l	L006b24
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$01,$00,$86
	.dc.l	L006b28
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$01,$00,$8a
	.dc.l	L006b2c
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$01,$00,$8e
	.dc.l	L006b30
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$02,$00,$92
	.dc.l	L006b34
	.dc.b	$00,$00,$00,$00,$00,$00,$03,$03,$09,$f0
	.dc.l	L006b39
	.dc.b	$00,$00,$00,$00,$00,$00,$03,$03,$09,$fc
	.dc.l	L006b3e
	.dc.b	$00,$00,$00,$00,$00,$00,$03,$03,$0a,$08
	.dc.l	L006b43
	.dc.b	$00,$00,$00,$00,$00,$00,$03,$03,$0a,$14
	.dc.l	L006b48
	.dc.b	$00,$00,$00,$00,$00,$00,$03,$03,$0a,$20
	.dc.l	L006b4d
	.dc.b	$00,$00,$00,$00,$00,$00,$03,$03,$0a,$2c
	.dc.l	L006b52
	.dc.b	$00,$00,$00,$00,$00,$00,$03,$03,$0a,$38
	.dc.l	L006b57
	.dc.b	$00,$00,$00,$00,$00,$00,$03,$03,$0a,$44
	.dc.l	L006b5c
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$04,$00,$9a
	.dc.l	L006b61
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$05,$00,$92
	.dc.l	L006b66
	.dc.b	$00,$00,$00,$00,$00,$00,$01,$06,$07,$d8
	.dc.l	L006b6b
	.dc.b	$00,$00,$00,$00,$00,$00,$01,$07,$00,$92
	.dc.l	L006b70
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$12,$00,$96
	.dc.l	L006b74
	.dc.b	$00,$00,$ff,$ff,$00,$00,$00,$08,$00,$9e
	.dc.l	L006b78
	.dc.b	$00,$00,$00,$03,$00,$00,$01,$09,$07,$e0
	.dc.l	L006b7d
	.dc.b	$00,$00,$00,$03,$00,$00,$01,$0a,$07,$e4
	.dc.l	L006b82
	.dc.b	$00,$00,$00,$00,$00,$00,$01,$0b,$07,$e8
	.dc.l	L006b88
	.dc.b	$00,$00,$00,$00,$00,$00,$01,$0c,$07,$ec
	.dc.l	L006b8e
	.dc.b	$00,$00,$00,$00,$00,$00,$01,$0d,$07,$f0
	.dc.l	L006b93
	.dc.b	$00,$00,$00,$00,$00,$00,$03,$0e,$07,$f4
	.dc.l	L006b99
	.dc.b	$00,$00,$00,$00,$00,$00,$03,$0f,$07,$f8
	.dc.l	L006b9f
	.dc.b	$00,$00,$00,$00,$00,$00,$03,$10,$07,$fc
	.dc.l	L006c0b
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$11,$00,$9e
	.dc.l	L006be3
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$04,$20
	.dc.l	L006be7
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$04,$24
	.dc.l	L006beb
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$04,$28
	.dc.l	L006bef
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$04,$2c
	.dc.l	L006bf3
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$04,$30
	.dc.l	L006bf7
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$04,$34
	.dc.l	L006bfb
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$04,$38
	.dc.l	L006bff
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$04,$3c
	.dc.l	L006c03
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$04,$40
	.dc.l	L006c07
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$04,$44
dx0_sym::
	.dc.b	$44,$30,$00,$00
L006af8:
	.dc.b	$44,$31,$00,$01
L006afc:
	.dc.b	$44,$32,$00,$02
L006b00:
	.dc.b	$44,$33,$00,$03
L006b04:
	.dc.b	$44,$34,$00,$04
L006b08:
	.dc.b	$44,$35,$00,$05
L006b0c:
	.dc.b	$44,$36,$00,$06
L006b10:
	.dc.b	$44,$37,$00,$07
L006b14:
	.dc.b	$41,$30,$00,$08
L006b18:
	.dc.b	$41,$31,$00,$09
L006b1c:
	.dc.b	$41,$32,$00,$0a
L006b20:
	.dc.b	$41,$33,$00,$0b
L006b24:
	.dc.b	$41,$34,$00,$0c
L006b28:
	.dc.b	$41,$35,$00,$0d
L006b2c:
	.dc.b	$41,$36,$00,$0e
L006b30:
	.dc.b	$41,$37,$00,$0f
L006b34:
	.dc.b	'FP0',$00
L006b38:
	.dc.b	$10
L006b39:
	.dc.b	'FP1',$00
L006b3d:
	.dc.b	$11
L006b3e:
	.dc.b	'FP2',$00
L006b42:
	.dc.b	$12
L006b43:
	.dc.b	'FP3',$00
L006b47:
	.dc.b	$13
L006b48:
	.dc.b	'FP4',$00
L006b4c:
	.dc.b	$14
L006b4d:
	.dc.b	'FP5',$00
L006b51:
	.dc.b	$15
L006b52:
	.dc.b	'FP6',$00
L006b56:
	.dc.b	$16
L006b57:
	.dc.b	'FP7',$00
L006b5b:
	.dc.b	$17
L006b5c:
	.dc.b	'USP',$00
L006b60:
	.dc.b	$18
L006b61:
	.dc.b	'SSP',$00
L006b65:
	.dc.b	$19
L006b66:
	.dc.b	'MSP',$00
L006b6a:
	.dc.b	$1a
L006b6b:
	.dc.b	'ISP',$00
L006b6f:
	.dc.b	$1b
L006b70:
	.dc.b	$50,$43,$00,$1c
L006b74:
	.dc.b	$53,$52,$00,$1d
L006b78:
	.dc.b	'SFC',$00
L006b7c:
	.dc.b	$1e
L006b7d:
	.dc.b	'DFC',$00
L006b81:
	.dc.b	$1f
L006b82:
	.dc.b	'CACR',$00
L006b87:
	.dc.b	$20
L006b88:
	.dc.b	'CAAR',$00
L006b8d:
	.dc.b	$21
L006b8e:
	.dc.b	'VBR',$00
L006b92:
	.dc.b	$22
L006b93:
	.dc.b	'FPCR',$00
L006b98:
	.dc.b	$23
L006b99:
	.dc.b	'FPSR',$00
L006b9e:
	.dc.b	$24
L006b9f:
	.dc.b	'FPIAR',$00
L006ba5:
	.dc.b	'%SP',$00
L006ba9:
	.dc.b	$0f,$52,$30,$00,$00,$52,$31,$00,$01,$52,$32,$00,$02,$52,$33,$00
	.dc.b	$03,$52,$34,$00,$04,$52,$35,$00,$05,$52,$36,$00,$06,$52,$37,$00
	.dc.b	$07,$49,$00,$ff,$4d,$00,$fe,$44,$49,$53,$00,$fd,$46,$50,$43,$50
	.dc.b	$00,$fc,$46,$50,$00,$fb,$46,$58,$00,$fa
L006be3:
	.dc.b	$5a,$30,$00,$27
L006be7:
	.dc.b	$5a,$31,$00,$28
L006beb:
	.dc.b	$5a,$32,$00,$29
L006bef:
	.dc.b	$5a,$33,$00,$2a
L006bf3:
	.dc.b	$5a,$34,$00,$2b
L006bf7:
	.dc.b	$5a,$35,$00,$2c
L006bfb:
	.dc.b	$5a,$36,$00,$2d
L006bff:
	.dc.b	$5a,$37,$00,$2e
L006c03:
	.dc.b	$5a,$38,$00,$2f
L006c07:
	.dc.b	$5a,$39,$00,$30
L006c0b:
	.dc.b	'CCR',$00
L006c0f:
	.dc.b	$26,$00,$00
L006c12:
	jmp	(badpar)

L006c18:
	jmp	(undef)

L006c1e:
	jmp	(comerr)

regiset::
	bsr	skpblk
	tst.b	(a5)
	beq	allregi
	cmpi.b	#$3a,(a5)		;':'
	beq	allregi
	movem.l	d0-d7/a0-a4/a6,-(a7)
	lea.l	(dx0_sym),a0
L006c40:
	tst.b	(a0)
	beq	L006c12
	pea.l	(a5)
	jsr	(strcmp)
	beq	L006c58
	movea.l	(a7)+,a5
L006c50:
	tst.b	(a0)+
	bne	L006c50
	addq.l	#1,a0
	bra	L006c40

L006c58:
	movea.l	a5,a1
	movea.l	(a7)+,a5
L006c5c:
	tst.b	(a0)+
	bne	L006c5c
	move.b	(a0)+,d0
	ext.w	d0
	cmpi.b	#$20,(a1)		;' '
	beq	L006d12
	cmpi.b	#$09,(a5)
	beq	L006d12
	cmpi.b	#$2c,(a1)		;','
	beq	L006d12
	cmpi.b	#$3a,(a1)		;':'
	beq	L006c86
	tst.b	(a1)
	bne	L006c40
L006c86:
	cmp.w	#$ffff,d0
	beq	L0075f6
	cmp.w	#$fffe,d0
	beq	L0076a0
	cmp.w	#$fffd,d0
	beq	L0076f4
	cmp.w	#$fffc,d0
	beq	L007744
	cmp.w	#$fffb,d0
	beq	L007786
	cmp.w	#$fffa,d0
	beq	L0077cc
	mulu.w	#$000e,d0
	lea.l	(reglist),a0
	adda.w	d0,a0
	move.l	($0008,a0),d0
	ori.l	#$ffff0000,d0
	bsr	L0074d4
	bne	L006c12
L006cd4:
	movea.l	a1,a5
	movea.l	($0000.w,a0),a1
	pea.l	(a0)
	movea.l	a1,a0
	jsr	(print)
	movea.l	(a7)+,a0
	moveq.l	#$3a,d0			;':'
	jsr	(putch)
	move.l	a0,-(a7)
	movea.l	a0,a1
	bsr	L007210
	moveq.l	#$3d,d0			;'='
	jsr	(putch)
	jsr	(inplin)
	movea.l	(a7)+,a1
	tst.b	(a0)
	beq	L006dc8
	movea.l	a0,a5
	movea.l	a1,a0
	bra	L006d4e

L006d12:
	movea.l	a1,a5
	andi.w	#$00ff,d0
	mulu.w	#$000e,d0
	lea.l	(reglist),a0
	adda.w	d0,a0
	move.l	($0008,a0),d0
	ori.l	#$ffff0000,d0
	bsr	L0074d4
	bne	L006c12
	jsr	(skpblk)
	beq	L006cd4
	cmp.b	#$2c,d0			;','
	bne	L006c12
	addq.l	#1,a5
	jsr	(skpblk)
L006d4e:
	movem.l	d3/a0,-(a7)
	jsr	(L007814)
	movem.l	(a7)+,d3/a0
	bcs	L006c12
	tst.l	($0004,a0)
	beq	L006d6c
	move.l	($0004,a0),d0
	and.l	d0,d6
L006d6c:
	move.l	($0008,a0),d0
	andi.w	#$00ff,d0
	cmp.w	#$0011,d0
	beq	L006de2
	cmp.w	#$0003,d0
	beq	L006dce
	cmp.w	#$0002,d0
	bne	L006dbe
	move.w	($000c,a0),d0
	lea.l	(a6,d0.w),a1
	move.l	d6,(a1)
	btst.b	#$05,($00a0,a6)
	beq	L006db2
	tst.w	($07d0,a6)
	beq	L006db8
	btst.b	#$04,($00a0,a6)
	beq	L006dac
	move.l	d6,($07d8,a6)
	bra	L006dc8

L006dac:
	move.l	d6,($0092,a6)
	bra	L006dc8

L006db2:
	move.l	d6,($009a,a6)
	bra	L006dc8

L006db8:
	move.l	d6,($0092,a6)
	bra	L006dc8

L006dbe:
	move.w	($000c,a0),d0
	lea.l	(a6,d0.w),a1
	move.l	d6,(a1)
L006dc8:
	movem.l	(a7)+,d0-d7/a0-a4/a6
	rts

L006dce:
	move.w	($000c,a0),d0
	lea.l	(a6,d0.w),a1
	move.l	d5,(a1)+
	move.l	d6,(a1)+
	move.l	d7,(a1)
	movem.l	(a7)+,d0-d7/a0-a4/a6
	rts

L006de2:
	moveq.l	#$00,d1
	move.l	d6,d0
	andi.w	#$000f,d0
	beq	L006df0
	or.w	#$0001,d1
L006df0:
	move.l	d6,d0
	andi.w	#$00f0,d0
	beq	L006dfc
	or.w	#$0002,d1
L006dfc:
	move.l	d6,d0
	andi.w	#$0f00,d0
	beq	L006e08
	or.w	#$0004,d1
L006e08:
	move.l	d6,d0
	andi.w	#$f000,d0
	beq	L006e14
	or.w	#$0008,d1
L006e14:
	move.l	d6,d0
	andi.l	#$000f0000,d0
	beq	L006e22
	or.w	#$0010,d1
L006e22:
	move.b	d1,($00a1,a6)
	movem.l	(a7)+,d0-d7/a0-a4/a6
	rts

memput::
	movem.l	d0-d7/a0-a6,-(a7)
	lea.l	($059c,a6),a3
	movea.l	($0468,a6),a5
	move.w	($0466,a6),d4
	bmi	L006e98
	beq	L006e98
	cmp.w	#$0008,d4
	bcc	L006e98
	move.l	($00000008).l,-(a7)
	move.l	($0000000c).l,-(a7)
	move.l	a7,($0b78,a6)
	move.l	#L006eb0,($00000008).l
	move.l	#L006eb0,($0000000c).l
	bsr	L006ed6
	clr.b	(a3)
	move.w	($0466,a6),d0
	add.w	d0,d0
	move.w	(L006e9e,pc,d0.w),d0
	lea.l	(L006e9e,pc,d0.w),a0
	jsr	(print)
	lea.l	($059c,a6),a0
	jsr	(print)
	move.l	(a7)+,($0000000c).l
	move.l	(a7)+,($00000008).l
L006e98:
	movem.l	(a7)+,d0-d7/a0-a6
	rts

L006e9e:
	.dc.w	$0000,$0210,$0216,$021c,$0222,$0228,$0230,$0238
	.dc.w	$0240
L006eb0:
	movea.l	($0b78,a6),a7
	move.l	(a7)+,($0000000c).l
	move.l	(a7)+,($00000008).l
	moveq.l	#$3f,d0			;'?'
	jsr	(putch)
	moveq.l	#$3f,d0			;'?'
	jsr	(putch)
	movem.l	(a7)+,d0-d7/a0-a6
	rts

L006ed6:
	cmpi.w	#$0001,d4
	bne	L006eea
	move.b	(a5)+,d1
	move.b	#$24,(a3)+		;'$'
	jsr	(wrtshex)
	rts

L006eea:
	cmpi.w	#$0002,d4
	bhi	L006efe
	move.w	(a5)+,d1
	move.b	#$24,(a3)+		;'$'
	jsr	(wrtwhex)
	rts

L006efe:
	cmpi.w	#$0004,d4
	bcc	L006f12
L006f04:
	move.l	(a5)+,d1
	move.b	#$24,(a3)+		;'$'
	jsr	(wrtlhex)
	rts

L006f12:
	cmpi.w	#$0005,d4
	bcc	L006f2e
L006f18:
	move.l	(a5)+,d1
	move.b	#$24,(a3)+		;'$'
	jsr	(wrtlhex)
	move.l	(a5)+,d1
	jsr	(wrtlhex)
	rts

L006f2e:
	bhi	L006f5c
	tst.w	($0836,a6)
	beq	L006f04
	movem.l	d2-d7/a3-a4,-(a7)
	move.l	(a5)+,d6
	jsr	(s_x_trn)
L006f42:
	lea.l	($083c,a6),a0
	lea.l	($08bc,a6),a1
	jsr	(formflt)
	movem.l	(a7)+,d2-d7/a3-a4
L006f54:
	move.b	(a1)+,(a3)+
	bne	L006f54
	subq.l	#1,a3
	rts

L006f5c:
	cmpi.w	#$0007,d4
	bcc	L006f78
	tst.w	($0836,a6)
	beq	L006f18
	movem.l	d2-d7/a3-a4,-(a7)
	movem.l	(a5)+,d5-d6
	jsr	(d_x_trn)
	bra	L006f42

L006f78:
	bhi	L006f90
	tst.w	($0836,a6)
	beq	L006f98
	lea.l	($09a0,a6),a0
	move.l	(a5)+,(a0)+
	move.l	(a5)+,(a0)+
	move.l	(a5)+,(a0)+
	movem.l	d2-d7/a3-a4,-(a7)
	bra	L006f42

L006f90:
	tst.w	($0836,a6)
	beq	L006f98
	bra	L006fb6

L006f98:
	move.b	#$24,(a3)+		;'$'
	move.l	(a5)+,d1
	jsr	(wrtlhex)
	move.l	(a5)+,d1
	jsr	(wrtlhex)
	move.l	(a5)+,d1
	jsr	(wrtlhex)
	rts

L006fb6:
	move.b	(a5)+,d1
	btst.l	#$05,d1
	bne	L006fc4
	btst.l	#$04,d1
	beq	L006fd2
L006fc4:
	lea.l	(L00709e),a0
L006fca:
	move.b	(a0)+,(a3)+
	bne	L006fca
	subq.l	#1,a3
	rts

L006fd2:
	btst.l	#$07,d1
	beq	L006fdc
	move.b	#$2d,(a3)+		;'-'
L006fdc:
	move.w	d1,-(a7)
	move.w	(a5)+,-(a7)
	move.b	(a5)+,d0
	andi.w	#$000f,d0
	cmpi.b	#$0a,d0
	bcc	L006eb0
	addi.b	#$30,d0			;'0'
	move.b	d0,(a3)+
	move.b	#$2e,(a3)+		;'.'
	move.w	#$0008,-(a7)
L006ffc:
	move.b	(a5)+,d1
	move.b	d1,d0
	lsr.w	#4,d0
	andi.w	#$000f,d0
	cmpi.b	#$0a,d0
	bcc	L006eb0
	addi.b	#$30,d0			;'0'
	move.b	d0,(a3)+
	move.b	d1,d0
	andi.w	#$000f,d0
	cmpi.b	#$0a,d0
	bcc	L006eb0
	addi.b	#$30,d0			;'0'
	move.b	d0,(a3)+
	subq.w	#1,(a7)
	bne	L006ffc
	addq.l	#2,a7
	move.b	#$45,(a3)+		;'E'
	move.w	(a7)+,d1
	move.w	(a7)+,d0
	btst.l	#$06,d0
	beq	L007040
	move.b	#$2d,(a3)+		;'-'
L007040:
	move.w	d0,-(a7)
	lsr.w	#4,d1
	move.w	d1,d0
	andi.w	#$000f,d0
	beq	L00705a
	cmpi.b	#$0a,d0
	bcc	L006eb0
	addi.b	#$30,d0			;'0'
	move.b	d0,(a3)+
L00705a:
	move.w	(a7)+,d0
	andi.w	#$000f,d0
	cmpi.b	#$0a,d0
	bcc	L006eb0
	addi.b	#$30,d0			;'0'
	move.b	d0,(a3)+
	move.w	d1,d0
	lsr.w	#8,d0
	andi.w	#$000f,d0
	cmpi.b	#$0a,d0
	bcc	L006eb0
	addi.b	#$30,d0			;'0'
	move.b	d0,(a3)+
	move.w	d1,d0
	lsr.w	#4,d0
	andi.w	#$000f,d0
	cmpi.b	#$0a,d0
	bcc	L006eb0
	addi.b	#$30,d0			;'0'
	move.b	d0,(a3)+
	clr.b	(a3)
	rts

L00709e:
	.dc.b	'NAN or INFINITY',$00
L0070ae:
	.dc.b	'byte ',$00
L0070b4:
	.dc.b	'word ',$00
L0070ba:
	.dc.b	'long ',$00
L0070c0:
	.dc.b	'quad ',$00
L0070c6:
	.dc.b	'single ',$00
L0070ce:
	.dc.b	'double ',$00
L0070d6:
	.dc.b	'extend ',$00
L0070de:
	.dc.b	'packed ',$00
allregi::
	movem.l	d0-d7/a0-a4/a6,-(a7)
	tst.w	($044a,a6)
	bne	L00711a
	tst.w	($07d0,a6)
	beq	L007112
	tst.w	($0838,a6)
	beq	L00710a
	tst.w	($07d2,a6)
	beq	L00710a
	lea.l	(L007389),a2
	bra	L007146

L00710a:
	lea.l	(L00734c),a2
	bra	L007146

L007112:
	lea.l	(L00731a),a2
	bra	L007146

L00711a:
	tst.w	($07d0,a6)
	beq	L00713c
	tst.w	($0838,a6)
	beq	L007134
	tst.w	($07d2,a6)
	beq	L007134
	lea.l	(L007463),a2
	bra	L007146

L007134:
	lea.l	(L00741f),a2
	bra	L007146

L00713c:
	lea.l	(L0073e9),a2
	bra.w	L007146

L007146:
	moveq.l	#$00,d0
	move.b	(a2)+,d0
	cmp.b	#-$01,d0
	beq	L0071ae
	cmp.b	#-$02,d0
	beq	L0071c0
	cmp.b	#-$03,d0
	beq	L0071cc
	cmp.b	#-$04,d0
	beq	L0071e0
	cmp.b	#-$05,d0
	beq	L0071a4
	cmp.b	#-$06,d0
	beq	L0071f4
	cmp.b	#-$07,d0
	beq	L007208
	move.w	d0,d1
	andi.w	#$007f,d1
	mulu.w	#$000e,d1
	lea.l	(reglist),a1
	adda.l	d1,a1
	tst.b	d0
	bpl	L0071a0
	movea.l	($0000.w,a1),a0
	jsr	(print)
	moveq.l	#$3a,d0			;':'
	jsr	(putch)
L0071a0:
	bsr	L007210
	bra	L007146

L0071a4:
	movem.l	(a7)+,d0-d7/a0-a4/a6
	bsr	L007502
	rts

L0071ae:
	moveq.l	#$0d,d0
	jsr	(putch)
	moveq.l	#$0a,d0
	jsr	(putch)
	bra	L007146

L0071c0:
	moveq.l	#$20,d0			;' '
	jsr	(putch)
	bra	L007146

L0071cc:
	moveq.l	#$44,d0			;'D'
	jsr	(putch)
	moveq.l	#$20,d0			;' '
	jsr	(putch)
	bra	L007146

L0071e0:
	moveq.l	#$41,d0			;'A'
	jsr	(putch)
	moveq.l	#$20,d0			;' '
	jsr	(putch)
	bra	L007146

L0071f4:
	moveq.l	#$46,d0			;'F'
	jsr	(putch)
	moveq.l	#$50,d0			;'P'
	jsr	(putch)
	bra	L007146

L007208:
	bsr	L007542
	bra	L007146

L007210:
	movem.l	d0-d7/a0-a6,-(a7)
	move.w	($000c,a1),d0
	lea.l	(a6,d0.w),a0
	move.l	(a0),d1
	tst.l	($0004,a1)
	beq	L00722a
	move.l	($0004,a1),d0
	and.l	d0,d1
L00722a:
	move.l	($0008,a1),d0
	and.w	#$00ff,d0
	add.w	d0,d0
	move.w	(L007242,pc,d0.w),d0
	jsr	(L007242,pc,d0.w)
	movem.l	(a7)+,d0-d7/a0-a6
	rts

L007242:
	.dc.w	L007268-L007242
	.dc.w	L007268-L007242
	.dc.w	L007270-L007242
	.dc.w	L00729e-L007242
	.dc.w	L007268-L007242
	.dc.w	L007268-L007242
	.dc.w	L007268-L007242
	.dc.w	L007268-L007242
	.dc.w	L0072c8-L007242
	.dc.w	L0072d0-L007242
	.dc.w	L0072d0-L007242
	.dc.w	L007268-L007242
	.dc.w	L007268-L007242
	.dc.w	L007268-L007242
	.dc.w	L007268-L007242
	.dc.w	L007268-L007242
	.dc.w	L007268-L007242
	.dc.w	L0072dc-L007242
	.dc.w	L007268-L007242
L007268:
	jsr	(putlhex)
	rts

L007270:
	btst.b	#$05,($00a0,a6)
	beq	L007292
	tst.w	($07d0,a6)
	beq	L007298
	btst.b	#$04,($00a0,a6)
	beq	L00728c
	move.l	($07d8,a6),d1
	bra	L007268

L00728c:
	move.l	($0092,a6),d1
	bra	L007268

L007292:
	move.l	($009a,a6),d1
	bra	L007268

L007298:
	move.l	($0092,a6),d1
	bra	L007268

L00729e:
	tst.w	($083a,a6)
	bne	L007892
	move.l	(a0)+,d1
	pea.l	(a0)
	jsr	(putlhex)
	movea.l	(a7)+,a0
	move.l	(a0)+,d1
	pea.l	(a0)
	jsr	(putlhex)
	movea.l	(a7)+,a0
	move.l	(a0)+,d1
	jsr	(putlhex)
	rts

L0072c8:
	jsr	(putwhex)
	rts

L0072d0:
	andi.w	#$0007,d1
	jsr	(putshex)
	rts

L0072dc:
	moveq.l	#$04,d2
	lea.l	(L007314,pc),a0
L0072e2:
	move.b	(a0)+,d0
	beq	L007312
	jsr	(putch)
	moveq.l	#$3a,d0			;':'
	jsr	(putch)
	btst.l	d2,d1
	sne.b	d0
	and.w	#$0001,d0
	add.w	#$0030,d0
	jsr	(putch)
	moveq.l	#$20,d0			;' '
	jsr	(putch)
	subq.w	#1,d2
	bra	L0072e2

L007312:
	rts

L007314:
	.dc.b	'XNZVC',$00
L00731a:
	.dc.b	$9c,$fe,$98,$fe,$99,$fe,$9d,$fe,$26,$ff,$f9,$fd,$fe,$00,$fe,$01
	.dc.b	$fe,$02,$fe,$03,$fe,$fe,$04,$fe,$05,$fe,$06,$fe,$07,$ff,$fc,$fe
	.dc.b	$08,$fe,$09,$fe,$0a,$fe,$0b,$fe,$fe,$0c,$fe,$0d,$fe,$0e,$fe,$0f
	.dc.b	$ff,$fb
L00734c:
	.dc.b	$9c,$fe,$98,$fe,$9a,$fe,$9b,$fe,$9d,$ff,$26,$9e,$fe,$9f,$fe,$a0
	.dc.b	$fe,$a1,$fe,$a2,$ff,$f9,$fd,$fe,$00,$fe,$01,$fe,$02,$fe,$03,$fe
	.dc.b	$fe,$04,$fe,$05,$fe,$06,$fe,$07,$ff,$fc,$fe,$08,$fe,$09,$fe,$0a
	.dc.b	$fe,$0b,$fe,$fe,$0c,$fe,$0d,$fe,$0e,$fe,$0f,$ff,$fb
L007389:
	.dc.b	$9c,$fe,$98,$fe,$9a,$fe,$9b,$fe,$9d,$ff,$26,$9e,$fe,$9f,$fe,$a0
	.dc.b	$fe,$a1,$fe,$a2,$ff,$f9,$fd,$fe,$00,$fe,$01,$fe,$02,$fe,$03,$fe
	.dc.b	$fe,$04,$fe,$05,$fe,$06,$fe,$07,$ff,$fc,$fe,$08,$fe,$09,$fe,$0a
	.dc.b	$fe,$0b,$fe,$fe,$0c,$fe,$0d,$fe,$0e,$fe,$0f,$ff,$fa,$fe,$10,$fe
	.dc.b	$11,$ff,$fe,$fe,$fe,$12,$fe,$13,$fe,$fe,$a3,$ff,$fe,$fe,$fe,$14
	.dc.b	$fe,$15,$fe,$fe,$a4,$ff,$fe,$fe,$fe,$16,$fe,$17,$fe,$a5,$ff,$fb
L0073e9:
	.dc.b	$9c,$fe,$98,$fe,$99,$ff,$9d,$fe,$26,$ff,$f9,$fd,$fe,$00,$fe,$01
	.dc.b	$fe,$02,$fe,$03,$ff,$fe,$fe,$fe,$04,$fe,$05,$fe,$06,$fe,$07,$ff
	.dc.b	$fc,$fe,$08,$fe,$09,$fe,$0a,$fe,$0b,$ff,$fe,$fe,$fe,$0c,$fe,$0d
	.dc.b	$fe,$0e,$fe,$0f,$ff,$fb
L00741f:
	.dc.b	$9c,$fe,$9d,$fe,$26,$ff,$98,$fe,$fe,$9a,$fe,$fe,$9b,$fe,$9e,$ff
	.dc.b	$a0,$fe,$a1,$fe,$a2,$fe,$9f,$ff,$f9,$fd,$fe,$00,$fe,$01,$fe,$02
	.dc.b	$fe,$03,$ff,$fe,$fe,$fe,$04,$fe,$05,$fe,$06,$fe,$07,$ff,$fc,$fe
	.dc.b	$08,$fe,$09,$fe,$0a,$fe,$0b,$ff,$fe,$fe,$fe,$0c,$fe,$0d,$fe,$0e
	.dc.b	$fe,$0f,$ff,$fb
L007463:
	.dc.b	$9c,$fe,$9d,$fe,$26,$ff,$98,$fe,$fe,$9a,$fe,$fe,$9b,$fe,$9e,$ff
	.dc.b	$a0,$fe,$a1,$fe,$a2,$fe,$9f,$ff,$f9,$fd,$fe,$00,$fe,$01,$fe,$02
	.dc.b	$fe,$03,$ff,$fe,$fe,$fe,$04,$fe,$05,$fe,$06,$fe,$07,$ff,$fc,$fe
	.dc.b	$08,$fe,$09,$fe,$0a,$fe,$0b,$ff,$fe,$fe,$fe,$0c,$fe,$0d,$fe,$0e
	.dc.b	$fe,$0f,$ff,$fa,$fe,$10,$ff,$fe,$fe,$fe,$11,$ff,$fe,$fe,$fe,$12
	.dc.b	$ff,$fe,$fe,$fe,$13,$ff,$fe,$fe,$fe,$14,$ff,$fe,$fe,$fe,$15,$ff
	.dc.b	$fe,$fe,$fe,$16,$ff,$fe,$fe,$fe,$17,$ff,$a3,$fe,$a4,$fe,$a5,$ff
	.dc.b	$fb
L0074d4:
	movem.l	d0,-(a7)
	tst.w	($07d0,a6)
	beq	L0074ec
	tst.w	($07d2,a6)
	beq	L0074f8
	moveq.l	#$00,d0
	movem.l	(a7)+,d0
	rts

L0074ec:
	btst.l	#$08,d0
	beq	L0074f8
	movem.l	(a7)+,d0
	rts

L0074f8:
	btst.l	#$09,d0
	movem.l	(a7)+,d0
	rts

L007502:
	move.l	a5,-(a7)
	movea.l	($0096,a6),a5
	move.l	a5,d0
	jsr	(valsch)
	tst.l	d0
	bmi	L00752c
	movea.l	d0,a0
	jsr	(print)
	move.b	#$3a,d0			;':'
	jsr	(putch)
	jsr	(newline)
L00752c:
	jsr	(dissb2)
	jsr	(L007550)
	jsr	(newline)
	movea.l	(a7)+,a5
	rts

L007542:
	jsr	(putcnd)
	jsr	(newline)
	rts

L007550:
	tst.w	($0464,a6)
	bne	L0075ba
	tst.w	($0466,a6)
	beq	L0075ba
	jsr	(puttab)
	jsr	(puttab)
	moveq.l	#$3b,d0			;';'
	jsr	(putch)
	moveq.l	#$24,d0			;'$'
	jsr	(putch)
	movea.l	($0468,a6),a0
	move.l	a0,d1
	jsr	(putlhex)
	move.l	d1,d0
	jsr	(valsch)
	tst.l	d0
	bmi	L0075a2
	movea.l	d0,a0
	move.b	#$2e,d0			;'.'
	jsr	(putch)
	jsr	(print)
L0075a2:
	move.w	#$0028,d0		;'('
	jsr	(putch)
	bsr	memput
	move.w	#$0029,d0		;')'
	jsr	(putch)
L0075ba:
	rts

L0075bc:
	jsr	(skpblk)
	tst.b	d0
	beq	L0075f0
	cmp.b	#$3a,d0			;':'
	beq	L0075f0
	cmp.b	#$2c,d0			;','
	bne	L0075e0
	addq.l	#1,a5
	jsr	(skpblk)
	tst.b	d0
	beq	L006c12
L0075e0:
	move.l	d3,-(a7)
	jsr	(getexp)
	move.l	(a7)+,d3
	bcs	L006c12
	rts

L0075f0:
	ori.b	#$01,ccr
	rts

L0075f6:
	movem.l	(a7)+,d0-d7/a0-a4/a6
	addq.l	#1,a5
	jsr	(L0075bc)
	bcc	L007658
	lea.l	(L007672),a0
	jsr	(print)
	move.b	($00a0,a6),d0
	andi.b	#$07,d0
	ori.b	#$30,d0
	jsr	(putch)
	lea.l	(L00768b),a0
	jsr	(print)
	jsr	(inplin)
	move.b	(a0),d0
	bne	L00763a
	rts

L00763a:
	move.l	a5,-(a7)
	movea.l	a0,a5
	jsr	(getexp)
	bcc	L007656
	jsr	(skpblk)
	movea.l	(a7)+,a5
	tst.b	d0
	bne	L006c18
	rts

L007656:
	movea.l	(a7)+,a5
L007658:
	cmpi.l	#$00000008,d6
	bcc	L006c12
	move.b	($00a0,a6),d0
	andi.b	#$f8,d0
	or.b	d0,d6
	move.b	d6,($00a0,a6)
	rts

L007672:
	.dc.b	'interrupt mask level is ',$00
L00768b:
	.dc.b	'   ,new level is ? ',$00,$00
L0076a0:
	movem.l	(a7)+,d0-d7/a0-a4/a6
	addq.l	#1,a5
	lea.l	(L0076ca),a0
	jsr	(print)
	lea.l	(L0076ea),a0
	eori.w	#$ffff,($0464,a6)
	beq	L0076c6
	lea.l	(L0076df),a0
L0076c6:
	bra	print

L0076ca:
	.dc.b	'Memory display mode ',$00
L0076df:
	.dc.b	'disable.',$0d,$0a,$00
L0076ea:
	.dc.b	'enable.',$0d,$0a,$00
L0076f4:
	movem.l	(a7)+,d0-d7/a0-a4/a6
	addq.l	#3,a5
	lea.l	(L00771e),a0
	jsr	(print)
	lea.l	(L0076df),a0
	eori.w	#$ffff,($0836,a6)
	beq	L00771a
	lea.l	(L0076ea),a0
L00771a:
	bra	print

L00771e:
	.dc.b	'FPCP disassemble parameter translate ',$00
L007744:
	movem.l	(a7)+,d0-d7/a0-a4/a6
	tst.w	($07d0,a6)
	beq	L006c12
	addq.l	#4,a5
	lea.l	(L007780),a0
	jsr	(print)
	lea.l	(L0076df),a0
	jsr	(isFPCP)
	tst.l	d0
	beq	L00777c
	eori.w	#$ffff,($07d2,a6)
	beq	L00777c
	lea.l	(L0076ea),a0
L00777c:
	bra	print

L007780:
	.dc.b	'FPCP ',$00
L007786:
	movem.l	(a7)+,d0-d7/a0-a4/a6
	tst.w	($07d0,a6)
	beq	L006c12
	addq.l	#2,a5
	lea.l	(L0077b8),a0
	jsr	(print)
	lea.l	(L0076df),a0
	eori.w	#$ffff,($0838,a6)
	beq	L0077b4
	lea.l	(L0076ea),a0
L0077b4:
	bra	print

L0077b8:
	.dc.b	'FPCP register dump ',$00
L0077cc:
	movem.l	(a7)+,d0-d7/a0-a4/a6
	addq.l	#2,a5
	lea.l	(L0077f6),a0
	jsr	(print)
	lea.l	(L0076df),a0
	eori.w	#$ffff,($083a,a6)
	beq	L0077f2
	lea.l	(L0076ea),a0
L0077f2:
	bra	print

L0077f6:
	.dc.b	'FPCP register dump translate ',$00
L007814:
	cmpi.b	#$03,($000b,a0)
	beq	L007824
	jsr	(getexp)
	rts

L007824:
	movem.l	a3/a5,-(a7)
	tst.w	($083a,a6)
	bne	L007852
	moveq.l	#$07,d5
	jsr	(skpblk)
	cmpi.b	#$24,d0			;'$'
	bne	L007844
	addq.l	#1,a5
	jsr	(skpblk)
L007844:
	jsr	(eaim41)
	bcs	L007862
	lea.l	($0940,a6),a1
	bra	L007878

L007852:
	movem.l	d2-d7/a2-a6,-(a7)
	jsr	(fbtran)
	movem.l	(a7)+,d2-d7/a2-a6
	bcc	L007874
L007862:
	jsr	(skpblk)
	movem.l	(a7)+,a3/a5
	tst.b	d0
	bne	L006c18
	rts

L007874:
	lea.l	($09a0,a6),a1
L007878:
	movem.l	(a7)+,a3/a5
	move.l	(a1)+,d5
	move.l	(a1)+,d6
	move.l	(a1),d7
L007882:
	tst.b	(a5)
	beq	L007890
	cmpi.b	#$3a,(a5)		;':'
	beq	L007890
	addq.l	#1,a5
	bra	L007882

L007890:
	rts

L007892:
	lea.l	($09a0,a6),a1
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0),(a1)
	lea.l	($083c,a6),a0
	lea.l	($08bc,a6),a1
	movem.l	d2-d7/a2-a6,-(a7)
	jsr	(formflt)
	movem.l	(a7)+,d2-d7/a2-a6
	movea.l	a1,a0
	moveq.l	#$18,d7
L0078b6:
	move.b	(a1)+,d0
	beq	L0078d2
	jsr	(putch)
	dbra	d7,L0078b6
L0078c4:
	move.b	(a1)+,d0
	beq	L0078d0
	jsr	(putch)
	bra	L0078c4

L0078d0:
	rts

L0078d2:
	move.b	#$20,d0			;' '
	jsr	(putch)
	dbra	d7,L0078d2
	rts

breaks::
	move.b	(a5)+,d0
	cmp.b	#$3a,d0			;':'
	bne	L0078ee
	subq.w	#1,a5
	bra	L007940

L0078ee:
	cmp.b	#$2d,d0			;'-'
	beq	L007b30
	bsr	toupper
	cmp.b	#$43,d0			;'C'
	beq	L007b30
	cmp.b	#$45,d0			;'E'
	beq	L007b3e
	cmp.b	#$44,d0			;'D'
	beq	L007b42
	cmp.b	#$52,d0			;'R'
	beq	L00792c
	subq.l	#1,a5
	move.l	a5,($0b9a,a6)
	bsr	skpblk
	beq	L007940
	movea.l	($0b9a,a6),a5
	bra	L0079f8

L00792c:
	moveq.l	#$0a,d0
	lea.l	($00a8,a6),a4
L007932:
	clr.w	($0006,a4)
	lea.l	($000c,a4),a4
	dbra	d0,L007932
	rts

L007940:
	tst.b	($00a6,a6)
	bne	L007952
	lea.l	(L0079e4),a0
	bsr	print
	rts

L007952:
	move.w	#$000a,($001e,a6)
	lea.l	($00a8,a6),a4
L00795c:
	tst.w	($000a,a4)
	bmi	L0079d6
	move.w	#$003a,d0		;':'
	sub.w	($001e,a6),d0
	bsr	putch
	bsr	putspc
	move.b	#$64,d0			;'d'
	tst.w	($000a,a4)
	beq	L007980
	move.b	#$65,d0			;'e'
L007980:
	bsr	putch
	bsr	putspc
	move.l	(a4),d1
	bsr	putlhex
	move.b	#$28,d0			;'('
	bsr	putch
	move.w	($0006,a4),d1
	bsr	putwhex
	move.b	#$3b,d0			;';'
	bsr	putch
	move.w	($0008,a4),d1
	bsr	putwhex
	move.b	#$29,d0			;')'
	bsr	putch
	move.l	(a4),d0
	bsr	valsch
	tst.l	d0
	bmi	L0079d2
	movea.l	d0,a0
	bsr	puttab
	move.b	#$2e,d0			;'.'
	bsr	putch
	bsr	print
L0079d2:
	bsr	newline
L0079d6:
	lea.l	($000c,a4),a4
	subq.w	#1,($001e,a6)
	bne	L00795c
	rts

L0079e4:
	.dc.b	'no break pointer',$0d,$0a,$00,$00
L0079f8:
	moveq.l	#$ff,d1
	clr.w	d0
	move.b	(a5),d0
	cmp.b	#$20,d0			;' '
	beq	L007a2e
	cmp.b	#$2c,d0			;','
	beq	L007a2e
	sub.w	#$0030,d0
	cmp.w	#$000a,d0
	bcc	L007c1e
	addq.l	#1,a5
	tst.b	(a5)
	beq	badpar
	cmpi.b	#$20,(a5)		;' '
	beq	L007a2c
	cmpi.b	#$2c,(a5)		;','
	bne	L007c1e
L007a2c:
	move.w	d0,d1
L007a2e:
	move.w	d1,-(a7)
	tst.w	d1
	bmi	L007a46
	clr.l	d0
	move.w	d1,d0
	bsr	L007ae8
	tst.l	d0
	beq	L007a46
	move.l	d0,($0002,a6)
	bra	L007a4c

L007a46:
	move.l	($0096,a6),($0002,a6)
L007a4c:
	bsr	getarg
	cmpi.w	#$0002,(comnum)
	bcc	badpar
	move.w	($0000.w,a6),d0
	beq	badpar
	cmp.w	#$0002,d0
	bhi	badpar
	beq	L007a76
	move.l	#$00000001,($0006,a6)
L007a76:
	bsr	L007aba
	bcs	L007aae
	move.w	(a7),d1
	bpl	L007a82
	bsr	L007b0c
L007a82:
	btst.b	#$00,($0005,a6)
	bne	badpar
	lea.l	($00a8,a6),a4
	mulu.w	#$000c,d1
	move.l	($0002,a6),(a4,d1.w)
	move.w	($0008,a6),($08,a4,d1.w)
	move.w	#$0001,($0a,a4,d1.w)
	addq.l	#2,a7
	bsr	L007bf8
	rts

L007aae:
	tst.w	(a7)
	bmi	L007a82
	cmp.w	(a7),d1
	bne	badpar
	bra	L007a82

L007aba:
	lea.l	($00a8,a6),a4
	move.l	($0002,a6),d0
	moveq.l	#$09,d1
L007ac4:
	tst.w	($000a,a4)
	bmi	L007ace
	cmp.l	(a4),d0
	beq	L007adc
L007ace:
	lea.l	($000c,a4),a4
	dbra	d1,L007ac4
	andi.b	#$fe,ccr
	rts

L007adc:
	sub.w	#$0009,d1
	neg.w	d1
	ori.b	#$01,ccr
	rts

L007ae8:
	lea.l	($00a8,a6),a4
	cmp.l	#$0000000a,d0
	bcc	L007b08
	lsl.l	#2,d0
	move.l	d0,d1
	lsl.l	#1,d0
	add.l	d1,d0
	adda.l	d0,a4
	tst.w	($000a,a4)
	bmi	L007b08
	move.l	(a4),d0
	rts

L007b08:
	clr.l	d0
	rts

L007b0c:
	cmpi.b	#$0a,($00a6,a6)
	bcc	L007c16
	clr.w	d1
	lea.l	($00a8,a6),a4
L007b1c:
	tst.w	($000a,a4)
	bmi	L007b2e
	lea.l	($000c,a4),a4
	addq.w	#1,d1
	cmp.w	#$000a,d1
	bcs	L007b1c
L007b2e:
	rts

L007b30:
	moveq.l	#$ff,d1
	bsr	L007b44
	bsr	L007bf8
	rts

bpclr::
	moveq.l	#$ff,d1
	bra	L007ba0

L007b3e:
	moveq.l	#$01,d1
	bra	L007b44

L007b42:
	moveq.l	#$00,d1
L007b44:
	clr.w	($0000.w,a6)
L007b48:
	bsr	skpblk
	tst.b	d0
	beq	L007bc4
	cmp.b	#$3a,d0			;':'
	beq	L007bc4
	cmp.b	#$2a,d0			;'*'
	beq	L007b9a
	cmp.b	#$2c,d0			;','
	bne	L007b72
	addq.l	#1,a5
	tst.w	($0000.w,a6)
	beq	L007bbc
	move.w	#$0001,($093e,a6)
	bra	L007b48

L007b72:
	clr.w	($093e,a6)
	move.w	d1,-(a7)
	bsr	getexp
	bcs	bpnumer
	move.w	(a7)+,d1
	move.w	($0000.w,a6),d0
	lsl.w	#2,d0
	move.l	d6,($02,a6,d0.w)
	addq.w	#1,($0000.w,a6)
	cmpi.w	#$0008,($0000.w,a6)
	bcs	L007b48
	bra	L007bc4

L007b9a:
	clr.w	($093e,a6)
	addq.l	#1,a5
L007ba0:
	move.w	#$0009,d0
	lea.l	($00a8,a6),a4
L007ba8:
	tst.w	($000a,a4)
	bmi	L007bb2
	move.w	d1,($000a,a4)
L007bb2:
	lea.l	($000c,a4),a4
	dbra	d0,L007ba8
	rts

L007bbc:
	clr.w	($093e,a6)
	bra	badpar

L007bc4:
	tst.w	($093e,a6)
	bne	L007bbc
	tst.w	($0000.w,a6)
	beq	bpnumer
	lea.l	($00a8,a6),a4
	lea.l	($0002,a6),a3
L007bd8:
	move.l	(a3)+,d0
	cmp.l	#$0000000a,d0
	bcc	L007c1e
	mulu.w	#$000c,d0
	tst.w	($0a,a4,d0.w)
	bmi	L007bf0
	move.w	d1,($0a,a4,d0.w)
L007bf0:
	subq.w	#1,($0000.w,a6)
	bne	L007bd8
	rts

L007bf8:
	lea.l	($00a8,a6),a4
	moveq.l	#$09,d0
	clr.b	($00a6,a6)
L007c02:
	tst.w	($000a,a4)
	bmi	L007c0c
	addq.b	#1,($00a6,a6)
L007c0c:
	lea.l	($000c,a4),a4
	dbra	d0,L007c02
	rts

L007c16:
	lea.l	(L007c74),a0
	bra	L007c2c

L007c1e:
	lea.l	(L007c34),a0
	bra	L007c2c

bpnumer::
	lea.l	(L007c52),a0
L007c2c:
	bsr	print
	bra	main

L007c34:
	.dc.b	'Bad breakpoint number (0-9)',$0d,$0a,$00
L007c52:
	.dc.b	'Breakpoint list or ',$27,'*',$27,' expected',$0d,$0a,$00
L007c74:
	.dc.b	'break pointer over',$0d,$0a,$00,$00
disasm::
	move.l	($0032,a6),($0002,a6)
	cmpi.b	#$2d,(a5)		;'-'
	bne	L007cb6
	addq.l	#1,a5
	bsr	getarg
	bsr	skpblk
	tst.w	($0000.w,a6)
	beq	L007cd0
	move.l	($0002,a6),d7
	neg.l	d7
	add.l	($0032,a6),d7
	move.l	d7,($0002,a6)
	bra	L007cd8

L007cb6:
	bsr	getarg
	bsr	skpblk
	tst.w	($0000.w,a6)
	bne	L007cd8
	tst.b	d0
	beq	L007cd0
	cmpi.b	#$3a,d0			;':'
	bne	comerr
L007cd0:
	move.l	($0032,a6),($0002,a6)
	bra	L007cee

L007cd8:
	cmpi.w	#$0001,($0000.w,a6)
	beq	L007cee
	move.l	($0006,a6),d7
	cmp.l	($0002,a6),d7
	bcs	comerr
	bra	L007d28

L007cee:
	move.w	#$0008,($001e,a6)
	move.l	($0002,a6),d0
	btst.l	#$00,d0
	bne	comerr
	move.l	a5,($003e,a6)
	move.l	($0002,a6),($0032,a6)
	move.l	($0032,a6),($003a,a6)
	movea.l	($0032,a6),a5
L007d14:
	bsr	dissub
	move.l	a5,($0032,a6)
	subq.w	#1,($001e,a6)
	bne	L007d14
	movea.l	($003e,a6),a5
	rts

L007d28:
	move.l	($0002,a6),d0
	btst.l	#$00,d0
	bne	comerr
	cmp.l	($0006,a6),d0
	bhi	comerr
	move.l	a5,($003e,a6)
	movea.l	d0,a5
	move.l	($0032,a6),($003a,a6)
	move.l	d0,($0032,a6)
	move.l	($0006,a6),($001e,a6)
L007d52:
	bsr	dissub
	move.l	a5,($0032,a6)
	cmpa.l	($001e,a6),a5
	bls	L007d52
	movea.l	($003e,a6),a5
	rts

symlchk::
	movem.l	d0-d1,-(a7)
	bsr	L007da4
	movem.l	(a7)+,d0-d1
	rts

L007d72:
	movem.l	d0-d1,-(a7)
	andi.l	#$0000ffff,d1
	bsr	L007da4
	beq	L007d84
	ext.l	d1
	bsr	L007da4
L007d84:
	movem.l	(a7)+,d0-d1
	rts

L007d8a:
	movem.l	d0-d1,-(a7)
	andi.l	#$000000ff,d1
	bsr	L007da4
	beq	L007d9e
	ext.w	d1
	ext.l	d1
	bsr	L007da4
L007d9e:
	movem.l	(a7)+,d0-d1
	rts

L007da4:
	move.l	d1,d0
	bsr	valsch
	tst.l	d0
	bmi	L007dbc
	movea.l	d0,a0
	move.b	#$2e,(a3)+		;'.'
L007db4:
	move.b	(a0)+,(a3)+
	bne	L007db4
	subq.l	#1,a3
	moveq.l	#$00,d0
L007dbc:
	rts

L007dbe:
	move.l	d1,d0
	bsr	valsch
	tst.l	d0
	bmi	L007dda
	movea.l	d0,a0
	bsr	print
	move.b	#$3a,d0			;':'
	bsr	putch
	bsr	newline
L007dda:
	rts

dissub::
	move.l	a5,d1
	bsr	L007dbe
	bsr	putspc
	bsr	putspc
	bsr	putlhex
	bsr	puttab
	bsr	dissb2
	bsr	newline
	rts

dissb2::
	clr.w	($0466,a6)
	move.l	a5,-(a7)
	move.l	a7,($016e,a6)
	lea.l	($059c,a6),a3
	move.w	(a5)+,d7
	move.w	d7,d4
	andi.w	#$f000,d4
	lsr.w	#6,d4
	lsr.w	#4,d4
	lea.l	(L007e2c),a4
	movea.l	(a4,d4.w),a1
	jsr	(a1)
	lea.l	($059c,a6),a0
	jsr	(print)
L007e28:
	addq.l	#4,a7
	rts

L007e2c:
	.dc.l	L008ff6
	.dc.l	L0093c0
	.dc.l	L00940c
	.dc.l	L009456
	.dc.l	L00945a
	.dc.l	L009a3c
	.dc.l	L009b1e
	.dc.l	L009b9a
	.dc.l	L009bd2
	.dc.l	L009cda
	.dc.l	L009d82
	.dc.l	L009dc4
	.dc.l	L009e4e
	.dc.l	L009ece
	.dc.l	L009ed4
	.dc.l	L00a092
L007e6c:
	lea.l	(L007e92),a0
	jsr	(print)
	movea.l	($016e,a6),a7
	movea.l	(a7),a5
	move.b	#$24,d0			;'$'
	jsr	(putch)
	move.w	(a5)+,d1
	jsr	(putwhex)
	bra	L007e28

L007e92:
	.dc.b	' undefined instruction ',$00
L007eaa:
	move.w	d7,d2
	andi.w	#$0038,d2
	lsr.w	#3,d2
	move.w	d7,d3
	andi.w	#$0007,d3
L007eb8:
	cmpi.w	#$0006,d2
	beq	L007ee2
	cmpi.w	#$0007,d2
	bne	L007ee0
	cmpi.w	#$0004,d3
	beq	L007f30
	cmpi.w	#$0003,d3
	beq	L007f08
	cmpi.w	#$0002,d3
	bcs	L007eda
	moveq.l	#$0d,d2
	rts

L007eda:
	moveq.l	#$0a,d2
	add.w	d3,d2
	rts

L007ee0:
	rts

L007ee2:
	btst.b	#$00,(a5)
	bne	L007eea
	rts

L007eea:
	move.w	(a5),d2
	andi.w	#$0007,d2
	bne	L007ef6
	moveq.l	#$07,d2
	rts

L007ef6:
	cmpi.w	#$0004,d2
	beq	L007e6c
	bhi	L007f04
	moveq.l	#$09,d2
	rts

L007f04:
	moveq.l	#$08,d2
	rts

L007f08:
	btst.b	#$00,(a5)
	bne	L007f12
	moveq.l	#$0e,d2
	rts

L007f12:
	move.w	(a5),d2
	andi.w	#$0007,d2
	bne	L007f1e
	moveq.l	#$0f,d2
	rts

L007f1e:
	cmpi.w	#$0004,d2
	beq	L007e6c
	bhi	L007f2c
	moveq.l	#$11,d2
	rts

L007f2c:
	moveq.l	#$10,d2
	rts

L007f30:
	moveq.l	#$12,d2
	cmpi.w	#$0004,d3
	bhi	L007e6c
	tst.w	d2
	rts

L007f3e:
	move.w	d7,d3
	andi.w	#$01c0,d3
	lsr.w	#6,d3
	move.w	d7,d2
	andi.w	#$0e00,d2
	lsr.w	#6,d2
	lsr.w	#3,d2
	rts

L007f52:
	bsr	L007f3e
	exg.l	d2,d3
	bsr	L007eb8
	exg.l	d2,d3
	rts

L007f5e:
	bsr	L007eaa
	cmpi.w	#$0002,d2
	bcs	L007e6c
	beq	L007f7c
	cmpi.w	#$0005,d2
	bcs	L007e6c
	cmpi.w	#$0012,d2
	bcc	L007e6c
L007f7c:
	rts

L007f7e:
	bsr	L007eaa
	cmpi.w	#$0002,d2
	bcs	L007e6c
	beq	L007f9c
	cmpi.w	#$0005,d2
	bcs	L007e6c
	cmpi.w	#$000c,d2
	bcc	L007e6c
L007f9c:
	rts

L007f9e:
	bsr	L007eaa
	cmpi.w	#$0001,d2
	beq	L007e6c
	cmpi.w	#$0013,d2
	bhi	L007e6c
	rts

L007fb4:
	bsr	L007eaa
L007fb8:
	cmpi.w	#$0013,d2
	bhi	L007e6c
	cmpi.w	#$0002,d2
	bcs	L007e6c
	rts

L007fca:
	bsr	L007eaa
	cmpi.w	#$000c,d2
	bcc	L007e6c
	rts

L007fd8:
	bsr	L007fca
	cmpi.w	#$0001,d2
	beq	L007e6c
	rts

L007fe4:
	bsr	L007fca
	bra	L007fb8

L007fe8:
	movem.w	d5-d6,-(a7)
	move.w	d5,($07d4,a6)
	bne	L00800c
	movem.l	d0/a0,-(a7)
	moveq.l	#$00,d0
	move.b	d6,d0
	lea.l	(L011e1b),a0
	move.b	(a0,d0.w),d0
	move.w	d0,($07d4,a6)
	movem.l	(a7)+,d0/a0
L00800c:
	addq.w	#1,d6
	cmp.w	#$00c4,d6
	bcc	L007e6c
	move.l	d6,-(a7)
	add.w	d6,d6
	lea.l	(L011890),a0
	move.w	(a0,d6.w),d6
	lea.l	(a0,d6.w),a0
	move.l	(a7)+,d6
L00802a:
	move.b	(a0)+,(a3)+
	bne	L00802a
	tst.w	d5
	beq	L00806a
	move.b	#$2e,(-$0001,a3)	;'.'
	cmpi.w	#$0002,d5
	beq	L008058
	bcs	L00805e
	cmpi.w	#$0003,d5
	bhi	L00804c
	move.b	#$6c,(a3)+		;'l'
	bra	L008062

L00804c:
	cmpi.w	#$0005,d5
	bcc	L00807c
	move.b	#$71,(a3)+		;'q'
	bra	L008062

L008058:
	move.b	#$77,(a3)+		;'w'
	bra	L008062

L00805e:
	move.b	#$62,(a3)+		;'b'
L008062:
	clr.b	(a3)
L008064:
	movem.w	(a7)+,d5-d6
	rts

L00806a:
	subq.w	#1,a3
	bra	L008064

L00806e:
	lea.l	(L0080a4),a0
	jsr	(print)
	bra	L008062

L00807c:
	bhi	L008084
	move.b	#$73,(a3)+		;'s'
	bra	L008062

L008084:
	cmpi.w	#$0007,d5
	bcc	L008090
	move.b	#$64,(a3)+		;'d'
	bra	L008062

L008090:
	bhi	L008098
	move.b	#$78,(a3)+		;'x'
	bra	L008062

L008098:
	cmpi.w	#$0008,d5
	bhi	L00806e
	move.b	#$70,(a3)+		;'p'
	bra	L008062

L0080a4:
	.dc.b	'fatal error',$0d,$0a,$00
L0080b2:
	move.b	#$09,(a3)+
	bsr	L0080c6
	clr.b	(a3)
	rts

L0080bc:
	move.b	#$2c,(a3)+		;','
	bsr	L0080c6
	clr.b	(a3)
	rts

L0080c6:
	tst.w	($0464,a6)
	bne	L0080f2
	movem.l	d0-d7/a0-a6,-(a7)
	move.w	($07d4,a6),d4
	tst.w	d4
	bne	L0080da
	moveq.l	#$02,d4
L0080da:
	add.w	d2,d2
	lea.l	(L008130),a0
	move.w	(a0,d2.w),d0
	ext.l	d0
	add.l	a0,d0
	movea.l	d0,a1
	jsr	(a1)
	movem.l	(a7)+,d0-d7/a0-a6
L0080f2:
	add.w	d2,d2
	lea.l	(L008106),a0
	move.w	(a0,d2.w),d0
	ext.l	d0
	add.l	a0,d0
	movea.l	d0,a1
	jmp	(a1)

L008106:
	.dc.b	$05,$2c,$05,$38,$05,$3e,$05,$4a,$05,$52,$05,$58,$05,$68,$05,$d8
	.dc.b	$06,$72,$07,$3c,$08,$0a,$08,$44,$08,$58,$08,$6a,$08,$7e,$08,$e8
	.dc.b	$09,$ba,$0a,$be,$0b,$c4,$0d,$d0,$0d,$e2
L008130:
	.dc.b	$00,$30,$00,$30,$00,$32,$00,$32,$00,$88,$00,$a6,$00,$b4,$00,$da
	.dc.b	$01,$20,$01,$7e,$01,$dc,$01,$ea,$01,$f4,$01,$f8,$02,$06,$02,$2a
	.dc.b	$02,$6e,$02,$ca,$00,$30,$00,$30,$00,$30
L00815a:
	clr.w	($0466,a6)
	rts

L008160:
	rts

L008162:
	move.w	d4,($0466,a6)
	bsr	L00816e
	move.l	a0,($0468,a6)
	rts

L00816e:
	andi.w	#$0007,d3
	cmp.w	#$0007,d3
	beq	L00818a
	lea.l	($0076,a6),a0
	andi.w	#$0007,d3
	add.w	d3,d3
	add.w	d3,d3
	movea.l	(a0,d3.w),a0
	rts

L00818a:
	btst.b	#$05,($00a0,a6)
	beq	L0081b2
	tst.w	($07d0,a6)
	beq	L0081ac
	btst.b	#$04,($00a0,a6)
	beq	L0081a6
	movea.l	($07d8,a6),a0
	rts

L0081a6:
	movea.l	($07dc,a6),a0
	rts

L0081ac:
	movea.l	($0092,a6),a0
	rts

L0081b2:
	movea.l	($009a,a6),a0
	rts

L0081b8:
	move.w	d4,($0466,a6)
	bsr	L00816e
	andi.w	#$0003,d4
	add.w	d4,d4
	adda.w	(L0081ce,pc,d4.w),a0
	move.l	a0,($0468,a6)
	rts

L0081ce:
	DOS	_TIME_PR
	DOS	_CHANGE_PR
	DOS	_TIME_PR
	DOS	_SLEEP_PR
	move.w	d4,($0466,a6)
	bsr	L00816e
	adda.w	(a5)+,a0
	move.l	a0,($0468,a6)
	rts

L0081e4:
	move.w	d4,($0466,a6)
	suba.l	a0,a0
	tst.b	($0001,a5)
	bmi	L0081f4
	bsr	L00816e
L0081f4:
	bsr	L008454
	adda.l	d0,a0
	move.b	($0001,a5),d0
	ext.w	d0
	ext.l	d0
	adda.l	d0,a0
	move.l	a0,($0468,a6)
	rts

L00820a:
	move.w	d4,($0466,a6)
	suba.l	a0,a0
	tst.b	($0001,a5)
	bmi	L00821a
	bsr	L00816e
L00821a:
	bsr	L008454
	adda.l	d0,a0
	move.w	(a5),d0
	andi.w	#$0030,d0
	lsr.w	#3,d0
	move.w	(L008236,pc,d0.w),d0
	jsr	(L008236,pc,d0.w)
	move.l	a0,($0468,a6)
	rts

L008236:
	.dc.b	$00,$08,$00,$0c,$00,$0e,$00,$14
L00823e:
	bra	L00815a

L008242:
	rts

L008244:
	adda.w	($0002,a5),a0
	rts

L00824a:
	adda.l	($0002,a5),a0
	rts

L008250:
	lea.l	($0002,a5),a1
	move.w	d4,($0466,a6)
	suba.l	a0,a0
	tst.b	($0001,a5)
	bmi	L008264
	bsr	L00816e
L008264:
	move.w	(a5),d0
	andi.w	#$0030,d0
	lsr.w	#3,d0
	move.w	(L008298,pc,d0.w),d0
	jsr	(L008298,pc,d0.w)
	bsr	L0085e8
	bne	L00815a
	bsr	L008454
	adda.l	d0,a0
	move.w	(a5),d0
	andi.w	#$0003,d0
	add.w	d0,d0
	move.w	(L008298,pc,d0.w),d0
	jsr	(L008298,pc,d0.w)
	move.l	a0,($0468,a6)
	rts

L008298:
	.dc.b	$00,$08,$00,$0c,$00,$0e,$00,$12
L0082a0:
	bra	L00815a

L0082a4:
	rts

L0082a6:
	adda.w	(a1)+,a0
	rts

L0082aa:
	adda.l	(a1)+,a0
	rts

L0082ae:
	lea.l	($0002,a5),a1
	move.w	d4,($0466,a6)
	suba.l	a0,a0
	tst.b	($0001,a5)
	bmi	L0082c2
	bsr	L00816e
L0082c2:
	bsr	L008454
	adda.l	d0,a0
	move.w	(a5),d0
	andi.w	#$0030,d0
	lsr.w	#3,d0
	move.w	(L0082f6,pc,d0.w),d0
	jsr	(L0082f6,pc,d0.w)
	bsr	L0085e8
	bne	L00815a
	move.w	(a5),d0
	andi.w	#$0003,d0
	add.w	d0,d0
	move.w	(L0082f6,pc,d0.w),d0
	jsr	(L0082f6,pc,d0.w)
	move.l	a0,($0468,a6)
	rts

L0082f6:
	.dc.b	$00,$08,$00,$0c,$00,$0e,$00,$12
L0082fe:
	bra	L00815a

L008302:
	rts

L008304:
	adda.w	(a1)+,a0
	rts

L008308:
	adda.l	(a1)+,a0
	rts

L00830c:
	move.w	d4,($0466,a6)
	move.w	(a5),d0
	ext.l	d0
	move.l	d0,($0468,a6)
	rts

L00831a:
	move.w	d4,($0466,a6)
	move.l	(a5),($0468,a6)
	rts

L008324:
	bra	L00815a

L008328:
	move.w	d4,($0466,a6)
	movea.l	a5,a0
	adda.w	(a5),a0
	move.l	a0,($0468,a6)
	rts

L008336:
	move.w	d4,($0466,a6)
	suba.l	a0,a0
	tst.b	($0001,a5)
	bmi	L008344
	movea.l	a5,a0
L008344:
	bsr	L008454
	adda.l	d0,a0
	move.b	($0001,a5),d0
	ext.w	d0
	ext.l	d0
	adda.l	d0,a0
	move.l	a0,($0468,a6)
	rts

L00835a:
	move.w	d4,($0466,a6)
	suba.l	a0,a0
	tst.b	($0001,a5)
	bmi	L008368
	movea.l	a5,a0
L008368:
	bsr	L008454
	adda.l	d0,a0
	move.w	(a5),d0
	andi.w	#$0030,d0
	lsr.w	#3,d0
	move.w	(L008384,pc,d0.w),d0
	jsr	(L008384,pc,d0.w)
	move.l	a0,($0468,a6)
	rts

L008384:
	.dc.b	$00,$08,$00,$0c,$00,$0e,$00,$14
L00838c:
	bra	L00815a

L008390:
	rts

L008392:
	adda.w	($0002,a5),a0
	rts

L008398:
	adda.l	($0002,a5),a0
	rts

L00839e:
	lea.l	($0002,a5),a1
	move.w	d4,($0466,a6)
	suba.l	a0,a0
	tst.b	($0001,a5)
	bmi	L0083b0
	movea.l	a5,a0
L0083b0:
	move.w	(a5),d0
	andi.w	#$0030,d0
	lsr.w	#3,d0
	move.w	(L0083e4,pc,d0.w),d0
	jsr	(L0083e4,pc,d0.w)
	bsr	L0085e8
	bne	L00815a
	bsr	L008454
	adda.l	d0,a0
	move.w	(a5),d0
	andi.w	#$0003,d0
	add.w	d0,d0
	move.w	(L0083e4,pc,d0.w),d0
	jsr	(L0083e4,pc,d0.w)
	move.l	a0,($0468,a6)
	rts

L0083e4:
	.dc.b	$00,$08,$00,$0c,$00,$0e,$00,$12
L0083ec:
	bra	L00815a

L0083f0:
	rts

L0083f2:
	adda.w	(a1)+,a0
	rts

L0083f6:
	adda.l	(a1)+,a0
	rts

L0083fa:
	lea.l	($0002,a5),a1
	move.w	d4,($0466,a6)
	suba.l	a0,a0
	tst.b	($0001,a5)
	bmi	L00840c
	movea.l	a5,a0
L00840c:
	move.w	(a5),d0
	andi.w	#$0030,d0
	lsr.w	#3,d0
	move.w	(L00843e,pc,d0.w),d0
	jsr	(L00843e,pc,d0.w)
	bsr	L008454
	adda.l	d0,a0
	bsr	L0085e8
	bne	L00815a
	move.w	(a5),d0
	andi.w	#$0003,d0
	add.w	d0,d0
	move.w	(L00843e,pc,d0.w),d0
	jsr	(L00843e,pc,d0.w)
	move.l	a0,($0468,a6)
	rts

L00843e:
	.dc.b	$00,$08,$00,$0c,$00,$0e,$00,$12
L008446:
	bra	L00815a

L00844a:
	rts

L00844c:
	adda.w	(a1)+,a0
	rts

L008450:
	adda.l	(a1)+,a0
	rts

L008454:
	bsr	L008462
	move.b	(a5),d1
	andi.w	#$0006,d1
	lsr.w	#1,d1
	lsr.l	d1,d0
	rts

L008462:
	move.w	(a5),d0
	andi.w	#$f000,d0
	rol.w	#5,d0
	move.w	(L008472,pc,d0.w),d0
	jmp	(L008472,pc,d0.w)

L008472:
	.dc.w	L0084b2-L008472
	.dc.w	L0084ba-L008472
	.dc.w	L0084c0-L008472
	.dc.w	L0084c8-L008472
	.dc.w	L0084ce-L008472
	.dc.w	L0084d6-L008472
	.dc.w	L0084dc-L008472
	.dc.w	L0084e4-L008472
	.dc.w	L0084ea-L008472
	.dc.w	L0084f2-L008472
	.dc.w	L0084f8-L008472
	.dc.w	L008500-L008472
	.dc.w	L008506-L008472
	.dc.w	L00850e-L008472
	.dc.w	L008514-L008472
	.dc.w	L00851c-L008472
	.dc.w	L008522-L008472
	.dc.w	L00852a-L008472
	.dc.w	L008530-L008472
	.dc.w	L008538-L008472
	.dc.w	L00853e-L008472
	.dc.w	L008546-L008472
	.dc.w	L00854c-L008472
	.dc.w	L008554-L008472
	.dc.w	L00855a-L008472
	.dc.w	L008562-L008472
	.dc.w	L008568-L008472
	.dc.w	L008570-L008472
	.dc.w	L008576-L008472
	.dc.w	L00857e-L008472
	.dc.w	L008584-L008472
	.dc.w	L0085ba-L008472
L0084b2:
	move.w	($0058,a6),d0
	ext.l	d0
	rts

L0084ba:
	move.l	($0056,a6),d0
	rts

L0084c0:
	move.w	($005c,a6),d0
	ext.l	d0
	rts

L0084c8:
	move.l	($005a,a6),d0
	rts

L0084ce:
	move.w	($0060,a6),d0
	ext.l	d0
	rts

L0084d6:
	move.l	($005e,a6),d0
	rts

L0084dc:
	move.w	($0064,a6),d0
	ext.l	d0
	rts

L0084e4:
	move.l	($0062,a6),d0
	rts

L0084ea:
	move.w	($0068,a6),d0
	ext.l	d0
	rts

L0084f2:
	move.l	($0066,a6),d0
	rts

L0084f8:
	move.w	($006c,a6),d0
	ext.l	d0
	rts

L008500:
	move.l	($006a,a6),d0
	rts

L008506:
	move.w	($0070,a6),d0
	ext.l	d0
	rts

L00850e:
	move.l	($006e,a6),d0
	rts

L008514:
	move.w	($0074,a6),d0
	ext.l	d0
	rts

L00851c:
	move.l	($0072,a6),d0
	rts

L008522:
	move.w	($0078,a6),d0
	ext.l	d0
	rts

L00852a:
	move.l	($0076,a6),d0
	rts

L008530:
	move.w	($007c,a6),d0
	ext.l	d0
	rts

L008538:
	move.l	($007a,a6),d0
	rts

L00853e:
	move.w	($0080,a6),d0
	ext.l	d0
	rts

L008546:
	move.l	($007e,a6),d0
	rts

L00854c:
	move.w	($0084,a6),d0
	ext.l	d0
	rts

L008554:
	move.l	($0082,a6),d0
	rts

L00855a:
	move.w	($0088,a6),d0
	ext.l	d0
	rts

L008562:
	move.l	($0086,a6),d0
	rts

L008568:
	move.w	($008c,a6),d0
	ext.l	d0
	rts

L008570:
	move.l	($008a,a6),d0
	rts

L008576:
	move.w	($0090,a6),d0
	ext.l	d0
	rts

L00857e:
	move.l	($008e,a6),d0
	rts

L008584:
	btst.b	#$05,($00a0,a6)
	beq	L0085b2
	tst.w	($07d0,a6)
	beq	L0085aa
	btst.b	#$04,($00a0,a6)
	beq	L0085a2
	move.w	($07da,a6),d0
	ext.l	d0
	rts

L0085a2:
	move.w	($07de,a6),d0
	ext.l	d0
	rts

L0085aa:
	move.w	($0094,a6),d0
	ext.l	d0
	rts

L0085b2:
	move.w	($009c,a6),d0
	ext.l	d0
	rts

L0085ba:
	btst.b	#$05,($00a0,a6)
	beq	L0085e2
	tst.w	($07d0,a6)
	beq	L0085dc
	btst.b	#$04,($00a0,a6)
	beq	L0085d6
	move.l	($07d8,a6),d0
	rts

L0085d6:
	move.l	($07dc,a6),d0
	rts

L0085dc:
	move.l	($0092,a6),d0
	rts

L0085e2:
	move.l	($009a,a6),d0
	rts

L0085e8:
	move.l	($00000008).l,-(a7)
	move.l	($0000000c).l,-(a7)
	move.l	a7,($0b78,a6)
	move.l	#L00861e,($00000008).l
	move.l	#L00861e,($0000000c).l
	movea.l	(a0),a0
	move.l	(a7)+,($0000000c).l
	move.l	(a7)+,($00000008).l
	moveq.l	#$00,d0
	rts

L00861e:
	movea.l	($0b78,a6),a7
	move.l	(a7)+,($0000000c).l
	move.l	(a7)+,($00000008).l
	moveq.l	#$ff,d0
	rts

L008632:
	move.b	#$44,(a3)+		;'D'
L008636:
	addi.b	#$30,d3			;'0'
	move.b	d3,(a3)+
	rts

L00863e:
	move.b	#$41,(a3)+		;'A'
	bra	L008636

L008644:
	move.b	#$28,(a3)+		;'('
	bsr	L00863e
	move.b	#$29,(a3)+		;')'
	rts

L008650:
	bsr	L008644
	move.b	#$2b,(a3)+		;'+'
	rts

L008658:
	move.b	#$2d,(a3)+		;'-'
	bra	L008644

L00865e:
	bsr	L00b350
	move.b	#$28,(a3)+		;'('
	bsr	L00863e
	move.b	#$29,(a3)+		;')'
	rts

L00866e:
	move.w	d3,-(a7)
	move.w	(a5)+,d1
	move.w	d1,d0
	andi.w	#$0600,d0
	lsr.w	#8,d0
	lsr.w	#1,d0
	move.w	d1,d3
	bclr.l	#$0f,d3
	lsr.w	#6,d3
	lsr.w	#6,d3
	clr.w	d2
	btst.l	#$0f,d1
	beq	L008690
	addq.w	#1,d2
L008690:
	movem.w	d0/d2-d3,-(a7)
	bsr	L00b336
	move.w	($0006,a7),d3
	move.b	#$28,(a3)+		;'('
	bsr	L00863e
	move.b	#$2c,(a3)+		;','
	movem.w	(a7)+,d0/d2-d3
	move.w	d0,-(a7)
	bsr	L0080f2
	move.b	#$2e,(a3)+		;'.'
	move.b	#$77,(a3)+		;'w'
	btst.l	#$0b,d1
	beq	L0086c4
	move.b	#$6c,(-$0001,a3)	;'l'
L0086c4:
	move.w	(a7)+,d0
	beq	L0086d6
	move.b	#$2a,(a3)+		;'*'
	moveq.l	#$01,d1
	lsl.w	d0,d1
	addi.b	#$30,d1			;'0'
	move.b	d1,(a3)+
L0086d6:
	move.b	#$29,(a3)+		;')'
	addq.l	#2,a7
	rts

L0086de:
	move.b	#$28,(a3)+		;'('
	move.w	(a5)+,d0
	move.w	d0,-(a7)
	andi.w	#$0030,d0
	beq	L007e6c
	lsr.w	#4,d0
	cmpi.w	#$0002,d0
	bcs	L00870a
	bhi	L008702
	bsr	L00b350
	move.b	#$2c,(a3)+		;','
	bra	L00870a

L008702:
	bsr	L00b376
	move.b	#$2c,(a3)+		;','
L00870a:
	move.w	(a7),d0
	btst.l	#$07,d0
	beq	L008716
	move.b	#$5a,(a3)+		;'Z'
L008716:
	bsr	L00863e
	move.b	#$2c,(a3)+		;','
	move.w	(a7),d0
	btst.l	#$06,d0
	beq	L00872c
	subq.l	#1,a3
	move.w	(a7)+,d0
	bra	L008772

L00872c:
	clr.w	d2
	btst.l	#$0f,d0
	beq	L008736
	addq.w	#1,d2
L008736:
	andi.w	#$7000,d0
	lsr.w	#8,d0
	lsr.w	#4,d0
	move.w	d0,d3
	bsr	L0080f2
	move.b	#$2e,(a3)+		;'.'
	move.b	#$77,(a3)+		;'w'
	btst.b	#$03,(a7)
	beq	L008758
	move.b	#$6c,(-$0001,a3)	;'l'
L008758:
	move.w	(a7)+,d0
	andi.w	#$0600,d0
	beq	L008772
	lsr.w	#8,d0
	lsr.w	#1,d0
	move.b	#$2a,(a3)+		;'*'
	moveq.l	#$01,d1
	lsl.w	d0,d1
	addi.b	#$30,d1			;'0'
	move.b	d1,(a3)+
L008772:
	move.b	#$29,(a3)+		;')'
	rts

L008778:
	move.b	#$28,(a3)+		;'('
	move.b	#$5b,(a3)+		;'['
	move.w	(a5)+,d0
	move.w	d0,-(a7)
	andi.w	#$0030,d0
	beq	L007e6c
	lsr.w	#4,d0
	cmpi.w	#$0002,d0
	bcs	L0087a8
	bhi	L0087a0
	bsr	L00b350
	move.b	#$2c,(a3)+		;','
	bra	L0087a8

L0087a0:
	bsr	L00b376
	move.b	#$2c,(a3)+		;','
L0087a8:
	move.w	(a7),d0
	btst.l	#$07,d0
	beq	L0087b4
	move.b	#$5a,(a3)+		;'Z'
L0087b4:
	bsr	L00863e
	move.b	#$5d,(a3)+		;']'
	move.b	#$2c,(a3)+		;','
	move.w	(a7),d0
	btst.l	#$06,d0
	beq	L0087cc
	bra	L007e6c

L0087cc:
	clr.w	d2
	btst.l	#$0f,d0
	beq	L0087d6
	addq.w	#1,d2
L0087d6:
	andi.w	#$7000,d0
	lsr.w	#8,d0
	lsr.w	#4,d0
	move.w	d0,d3
	bsr	L0080f2
	move.w	(a7),d1
	move.b	#$2e,(a3)+		;'.'
	move.b	#$77,(a3)+		;'w'
	btst.l	#$0b,d1
	beq	L0087fa
	move.b	#$6c,(-$0001,a3)	;'l'
L0087fa:
	move.w	(a7),d0
	andi.w	#$0600,d0
	beq	L008814
	lsr.w	#8,d0
	lsr.w	#1,d0
	move.b	#$2a,(a3)+		;'*'
	moveq.l	#$01,d1
	lsl.w	d0,d1
	addi.b	#$30,d1			;'0'
	move.b	d1,(a3)+
L008814:
	move.w	(a7)+,d0
	andi.w	#$0007,d0
	cmpi.w	#$0004,d0
	beq	L007e6c
	cmpi.w	#$0006,d0
	bcs	L00883c
	bhi	L008834
	move.b	#$2c,(a3)+		;','
	bsr	L00b350
	bra	L00883c

L008834:
	move.b	#$2c,(a3)+		;','
	bsr	L00b376
L00883c:
	move.b	#$29,(a3)+		;')'
	rts

L008842:
	move.b	#$28,(a3)+		;'('
	move.b	#$5b,(a3)+		;'['
	move.w	(a5)+,d0
	move.w	d0,-(a7)
	andi.w	#$0030,d0
	beq	L007e6c
	lsr.w	#4,d0
	cmpi.w	#$0002,d0
	bcs	L008872
	bhi	L00886a
	bsr	L00b350
	move.b	#$2c,(a3)+		;','
	bra	L008872

L00886a:
	bsr	L00b376
	move.b	#$2c,(a3)+		;','
L008872:
	move.w	(a7),d0
	btst.l	#$07,d0
	beq	L00887e
	move.b	#$5a,(a3)+		;'Z'
L00887e:
	bsr	L00863e
	move.b	#$2c,(a3)+		;','
	move.w	(a7),d0
	btst.l	#$06,d0
	beq	L008892
	subq.l	#1,a3
	bra	L0088da

L008892:
	clr.w	d2
	btst.l	#$0f,d0
	beq	L00889c
	addq.w	#1,d2
L00889c:
	andi.w	#$7000,d0
	lsr.w	#8,d0
	lsr.w	#4,d0
	move.w	d0,d3
	bsr	L0080f2
	move.w	(a7),d1
	move.b	#$2e,(a3)+		;'.'
	move.b	#$77,(a3)+		;'w'
	btst.l	#$0b,d1
	beq	L0088c0
	move.b	#$6c,(-$0001,a3)	;'l'
L0088c0:
	move.w	(a7),d0
	andi.w	#$0600,d0
	beq	L0088da
	lsr.w	#8,d0
	lsr.w	#1,d0
	move.b	#$2a,(a3)+		;'*'
	moveq.l	#$01,d1
	lsl.w	d0,d1
	addi.b	#$30,d1			;'0'
	move.b	d1,(a3)+
L0088da:
	move.b	#$5d,(a3)+		;']'
	move.w	(a7)+,d0
	andi.w	#$0007,d0
	beq	L007e6c
	cmpi.w	#$0004,d0
	bcc	L007e6c
	cmpi.w	#$0002,d0
	bcs	L00890a
	bhi	L008902
	move.b	#$2c,(a3)+		;','
	bsr	L00b350
	bra	L00890a

L008902:
	move.b	#$2c,(a3)+		;','
	bsr	L00b376
L00890a:
	move.b	#$29,(a3)+		;')'
	rts

L008910:
	move.w	(a5)+,d1
	bpl	L008930
	ext.l	d1
	move.b	#$24,(a3)+		;'$'
	jsr	(wrtlhex)
	jsr	(symlchk)
	move.b	#$2e,(a3)+		;'.'
	move.b	#$77,(a3)+		;'w'
	rts

L008930:
	move.b	#$24,(a3)+		;'$'
	jsr	(wrtwhex)
	jsr	(L007d72)
	move.b	#$2e,(a3)+		;'.'
	move.b	#$77,(a3)+		;'w'
	rts

L00894a:
	move.l	(a5)+,d1
	move.b	#$24,(a3)+		;'$'
	jsr	(wrtlhex)
	jsr	(symlchk)
	rts

L00895e:
	move.b	#$24,(a3)+		;'$'
	jsr	(wrtlhex)
	jsr	(symlchk)
	rts

L008970:
	bsr	L00b2cc
	lea.l	(L008f19),a1
	bsr	L008f06
	move.b	#$29,(a3)+		;')'
	rts

L008984:
	move.w	(a5)+,d1
	move.w	d1,d0
	andi.w	#$0600,d0
	lsr.w	#8,d0
	lsr.w	#1,d0
	move.w	d1,d3
	bclr.l	#$0f,d3
	lsr.w	#6,d3
	lsr.w	#6,d3
	clr.w	d2
	btst.l	#$0f,d1
	beq	L0089a4
	addq.w	#1,d2
L0089a4:
	movem.w	d0-d3,-(a7)
	bsr	L00b28a
	lea.l	(L008f19),a1
	bsr	L008f06
	move.b	#$2c,(a3)+		;','
	bsr	L0080f2
	movem.w	(a7)+,d0-d3
	move.b	#$2e,(a3)+		;'.'
	move.b	#$77,(a3)+		;'w'
	btst.l	#$0b,d1
	beq	L0089d6
	move.b	#$6c,(-$0001,a3)	;'l'
L0089d6:
	tst.w	d0
	beq	L0089e8
	move.b	#$2a,(a3)+		;'*'
	moveq.l	#$01,d1
	lsl.w	d0,d1
	addi.b	#$30,d1			;'0'
	move.b	d1,(a3)+
L0089e8:
	move.b	#$29,(a3)+		;')'
	rts

L0089ee:
	move.b	#$28,(a3)+		;'('
	move.w	(a5)+,d0
	move.w	d0,-(a7)
	andi.w	#$0030,d0
	beq	L007e6c
	lsr.w	#4,d0
	cmpi.w	#$0002,d0
	bcs	L008a4e
	bhi	L008a2c
	move.w	(a7),d0
	btst.l	#$07,d0
	bne	L008a22
	bsr	L00b2a8
	move.b	#$2e,(a3)+		;'.'
	move.b	#$72,(a3)+		;'r'
	move.b	#$2c,(a3)+		;','
	bra	L008a4e

L008a22:
	bsr	L00b350
	move.b	#$2c,(a3)+		;','
	bra	L008a4e

L008a2c:
	move.w	(a7),d0
	btst.l	#$07,d0
	bne	L008a46
	bsr	L00b2ee
	move.b	#$2e,(a3)+		;'.'
	move.b	#$72,(a3)+		;'r'
	move.b	#$2c,(a3)+		;','
	bra	L008a4e

L008a46:
	bsr	L00b376
	move.b	#$2c,(a3)+		;','
L008a4e:
	move.w	(a7),d0
	btst.l	#$07,d0
	beq	L008a5a
	move.b	#$5a,(a3)+		;'Z'
L008a5a:
	move.b	#$50,(a3)+		;'P'
	move.b	#$43,(a3)+		;'C'
	move.b	#$2c,(a3)+		;','
	move.w	(a7),d0
	btst.l	#$06,d0
	beq	L008a74
	subq.l	#1,a3
	move.w	(a7)+,d0
	bra	L008aba

L008a74:
	clr.w	d2
	btst.l	#$0f,d0
	beq	L008a7e
	addq.w	#1,d2
L008a7e:
	andi.w	#$7000,d0
	lsr.w	#8,d0
	lsr.w	#4,d0
	move.w	d0,d3
	bsr	L0080f2
	move.b	#$2e,(a3)+		;'.'
	move.b	#$77,(a3)+		;'w'
	btst.b	#$03,(a7)
	beq	L008aa0
	move.b	#$6c,(-$0001,a3)	;'l'
L008aa0:
	move.w	(a7)+,d0
	andi.w	#$0600,d0
	beq	L008aba
	lsr.w	#8,d0
	lsr.w	#1,d0
	move.b	#$2a,(a3)+		;'*'
	moveq.l	#$01,d1
	lsl.w	d0,d1
	addi.b	#$30,d1			;'0'
	move.b	d1,(a3)+
L008aba:
	move.b	#$29,(a3)+		;')'
	rts

L008ac0:
	move.b	#$28,(a3)+		;'('
	move.b	#$5b,(a3)+		;'['
	move.w	(a5)+,d0
	move.w	d0,-(a7)
	andi.w	#$0030,d0
	beq	L007e6c
	lsr.w	#4,d0
	cmpi.w	#$0002,d0
	bcs	L008b28
	bhi	L008b02
	move.w	(a7),d0
	btst.l	#$07,d0
	bne	L008af8
	bsr	L00b2a8
	move.b	#$2e,(a3)+		;'.'
	move.b	#$72,(a3)+		;'r'
	move.b	#$2c,(a3)+		;','
	bra	L008b28

L008af8:
	bsr	L00b350
	move.b	#$2c,(a3)+		;','
	bra	L008b28

L008b02:
	move.w	(a7),d0
	btst.l	#$07,d0
	bne	L008b1c
	bsr	L00b2ee
	move.b	#$2e,(a3)+		;'.'
	move.b	#$72,(a3)+		;'r'
	move.b	#$2c,(a3)+		;','
	bra	L008b28

L008b1c:
	bsr	L00b376
	move.b	#$2c,(a3)+		;','
	bra.w	L008b28

L008b28:
	move.w	(a7),d0
	btst.l	#$07,d0
	beq	L008b34
	move.b	#$5a,(a3)+		;'Z'
L008b34:
	move.b	#$50,(a3)+		;'P'
	move.b	#$43,(a3)+		;'C'
	move.b	#$5d,(a3)+		;']'
	move.b	#$2c,(a3)+		;','
	move.w	(a7),d0
	btst.l	#$06,d0
	beq	L008b50
	bra	L007e6c

L008b50:
	clr.w	d2
	btst.l	#$0f,d0
	beq	L008b5a
	addq.w	#1,d2
L008b5a:
	andi.w	#$7000,d0
	lsr.w	#8,d0
	lsr.w	#4,d0
	move.w	d0,d3
	bsr	L0080f2
	move.b	#$2e,(a3)+		;'.'
	move.b	#$77,(a3)+		;'w'
	btst.b	#$03,(a7)
	beq	L008b7c
	move.b	#$6c,(-$0001,a3)	;'l'
L008b7c:
	move.w	(a7),d0
	andi.w	#$0600,d0
	beq	L008b96
	lsr.w	#8,d0
	lsr.w	#1,d0
	move.b	#$2a,(a3)+		;'*'
	moveq.l	#$01,d1
	lsl.w	d0,d1
	addi.b	#$30,d1			;'0'
	move.b	d1,(a3)+
L008b96:
	move.w	(a7)+,d0
	andi.w	#$0007,d0
	cmpi.w	#$0004,d0
	beq	L007e6c
	cmpi.w	#$0006,d0
	bcs	L008bbe
	bhi	L008bb6
	move.b	#$2c,(a3)+		;','
	bsr	L00b350
	bra	L008bbe

L008bb6:
	move.b	#$2c,(a3)+		;','
	bsr	L00b376
L008bbe:
	move.b	#$29,(a3)+		;')'
	rts

L008bc4:
	move.b	#$28,(a3)+		;'('
	move.b	#$5b,(a3)+		;'['
	move.w	(a5)+,d0
	move.w	d0,-(a7)
	andi.w	#$0030,d0
	beq	L007e6c
	lsr.w	#4,d0
	cmpi.w	#$0002,d0
	bcs	L008c2a
	bhi	L008c06
	move.w	(a7),d0
	btst.l	#$07,d0
	bne	L008bfc
	bsr	L00b2a8
	move.b	#$2e,(a3)+		;'.'
	move.b	#$72,(a3)+		;'r'
	move.b	#$2c,(a3)+		;','
	bra	L008c2a

L008bfc:
	bsr	L00b350
	move.b	#$2c,(a3)+		;','
	bra	L008c2a

L008c06:
	move.w	(a7),d0
	btst.l	#$07,d0
	bne	L008c22
	bsr	L00b2ee
	move.b	#$2e,(a3)+		;'.'
	move.b	#$72,(a3)+		;'r'
	move.b	#$2c,(a3)+		;','
	bra	L00870a

L008c22:
	bsr	L00b376
	move.b	#$2c,(a3)+		;','
L008c2a:
	move.w	(a7),d0
	btst.l	#$07,d0
	beq	L008c36
	move.b	#$5a,(a3)+		;'Z'
L008c36:
	move.b	#$50,(a3)+		;'P'
	move.b	#$43,(a3)+		;'C'
	move.b	#$2c,(a3)+		;','
	move.w	(a7),d0
	btst.l	#$06,d0
	beq	L008c4e
	move.b	#$5a,(a3)+		;'Z'
L008c4e:
	clr.w	d2
	btst.l	#$0f,d0
	beq	L008c58
	addq.w	#1,d2
L008c58:
	andi.w	#$7000,d0
	lsr.w	#8,d0
	lsr.w	#4,d0
	move.w	d0,d3
	bsr	L0080f2
	move.b	#$2e,(a3)+		;'.'
	move.b	#$77,(a3)+		;'w'
	btst.b	#$03,(a7)
	beq	L008c7a
	move.b	#$6c,(-$0001,a3)	;'l'
L008c7a:
	move.w	(a7),d0
	andi.w	#$0600,d0
	beq	L008c94
	lsr.w	#8,d0
	lsr.w	#1,d0
	move.b	#$2a,(a3)+		;'*'
	moveq.l	#$01,d1
	lsl.w	d0,d1
	addi.b	#$30,d1			;'0'
	move.b	d1,(a3)+
L008c94:
	move.b	#$5d,(a3)+		;']'
	move.w	(a7)+,d0
	andi.w	#$0007,d0
	beq	L007e6c
	cmpi.w	#$0004,d0
	bcc	L007e6c
	cmpi.w	#$0002,d0
	bcs	L008cc4
	bhi	L008cbc
	move.b	#$2c,(a3)+		;','
	bsr	L00b350
	bra	L008cc4

L008cbc:
	move.b	#$2c,(a3)+		;','
	bsr	L00b376
L008cc4:
	move.b	#$29,(a3)+		;')'
	rts

L008cca:
	move.b	#$23,(a3)+		;'#'
	cmpi.w	#$0001,d4
	bne	L008ce8
	move.w	(a5)+,d1
	move.b	#$24,(a3)+		;'$'
	jsr	(wrtshex)
	jsr	(L007d8a)
	rts

L008ce8:
	cmpi.w	#$0002,d4
	bhi	L008d02
	move.w	(a5)+,d1
	move.b	#$24,(a3)+		;'$'
	jsr	(wrtwhex)
	jsr	(L007d72)
	rts

L008d02:
	cmpi.w	#$0004,d4
	bcc	L008d1c
L008d08:
	move.l	(a5)+,d1
	move.b	#$24,(a3)+		;'$'
	jsr	(wrtlhex)
	jsr	(symlchk)
	rts

L008d1c:
	cmpi.w	#$0005,d4
	bcc	L008d44
L008d22:
	move.l	(a5)+,d1
	move.b	#$24,(a3)+		;'$'
	jsr	(wrtlhex)
	jsr	(symlchk)
	move.l	(a5)+,d1
	jsr	(wrtlhex)
	jsr	(symlchk)
	rts

L008d44:
	bhi	L008d72
	tst.w	($0836,a6)
	beq	L008d08
	movem.l	d2-d7/a3-a4,-(a7)
	move.l	(a5)+,d6
	jsr	(s_x_trn)
L008d58:
	lea.l	($083c,a6),a0
	lea.l	($08bc,a6),a1
	jsr	(formflt)
	movem.l	(a7)+,d2-d7/a3-a4
L008d6a:
	move.b	(a1)+,(a3)+
	bne	L008d6a
	subq.l	#1,a3
	rts

L008d72:
	cmpi.w	#$0007,d4
	bcc	L008d8e
	tst.w	($0836,a6)
	beq	L008d22
	movem.l	d2-d7/a3-a4,-(a7)
	movem.l	(a5)+,d5-d6
	jsr	(d_x_trn)
	bra	L008d58

L008d8e:
	bhi	L008da6
	tst.w	($0836,a6)
	beq	L008dae
	lea.l	($09a0,a6),a0
	move.l	(a5)+,(a0)+
	move.l	(a5)+,(a0)+
	move.l	(a5)+,(a0)+
	movem.l	d2-d7/a3-a4,-(a7)
	bra	L008d58

L008da6:
	tst.w	($0836,a6)
	beq	L008dae
	bra	L008dde

L008dae:
	move.b	#$24,(a3)+		;'$'
	move.l	(a5)+,d1
	jsr	(wrtlhex)
	jsr	(symlchk)
	move.l	(a5)+,d1
	jsr	(wrtlhex)
	jsr	(symlchk)
	move.l	(a5)+,d1
	jsr	(wrtlhex)
	jsr	(symlchk)
	rts

L008dde:
	move.b	(a5)+,d1
	btst.l	#$05,d1
	bne	L008dec
	btst.l	#$04,d1
	beq	L008e0a
L008dec:
	lea.l	(L008dfa),a0
L008df2:
	move.b	(a0)+,(a3)+
	bne	L008df2
	subq.l	#1,a3
	rts

L008dfa:
	.dc.b	'NAN or INFINITY',$00
L008e0a:
	btst.l	#$07,d1
	beq	L008e14
	move.b	#$2d,(a3)+		;'-'
L008e14:
	move.w	d1,-(a7)
	move.w	(a5)+,-(a7)
	move.b	(a5)+,d0
	andi.w	#$000f,d0
	cmpi.b	#$0a,d0
	bcc	L007e6c
	addi.b	#$30,d0			;'0'
	move.b	d0,(a3)+
	move.b	#$2e,(a3)+		;'.'
	move.w	#$0008,-(a7)
L008e34:
	move.b	(a5)+,d1
	move.b	d1,d0
	lsr.w	#4,d0
	andi.w	#$000f,d0
	cmpi.b	#$0a,d0
	bcc	L007e6c
	addi.b	#$30,d0			;'0'
	move.b	d0,(a3)+
	move.b	d1,d0
	andi.w	#$000f,d0
	cmpi.b	#$0a,d0
	bcc	L007e6c
	addi.b	#$30,d0			;'0'
	move.b	d0,(a3)+
	subq.w	#1,(a7)
	bne	L008e34
	addq.l	#2,a7
	move.b	#$45,(a3)+		;'E'
	move.w	(a7)+,d1
	move.w	(a7)+,d0
	btst.l	#$06,d0
	beq	L008e78
	move.b	#$2d,(a3)+		;'-'
L008e78:
	move.w	d0,-(a7)
	lsr.w	#4,d1
	move.w	d1,d0
	andi.w	#$000f,d0
	beq	L008e92
	cmpi.b	#$0a,d0
	bcc	L007e6c
	addi.b	#$30,d0			;'0'
	move.b	d0,(a3)+
L008e92:
	move.w	(a7)+,d0
	andi.w	#$000f,d0
	cmpi.b	#$0a,d0
	bcc	L007e6c
	addi.b	#$30,d0			;'0'
	move.b	d0,(a3)+
	move.w	d1,d0
	lsr.w	#8,d0
	andi.w	#$000f,d0
	cmpi.b	#$0a,d0
	bcc	L007e6c
	addi.b	#$30,d0			;'0'
	move.b	d0,(a3)+
	move.w	d1,d0
	lsr.w	#4,d0
	andi.w	#$000f,d0
	cmpi.b	#$0a,d0
	bcc	L007e6c
	addi.b	#$30,d0			;'0'
	move.b	d0,(a3)+
	clr.b	(a3)
	rts

L008ed6:
	move.b	#$23,(a3)+		;'#'
	jsr	(wrtshex)
	jsr	(L007d8a)
	rts

L008ee8:
	cmpi.w	#$0002,d4
	beq	L008ef8
	bcc	L008f00
	lea.l	(L008f0e),a1
	bra	L008f06

L008ef8:
	lea.l	(L008f12),a1
	bra	L008f06

L008f00:
	lea.l	(L008f15),a1
L008f06:
	move.b	(a1)+,(a3)+
	bne	L008f06
	subq.l	#1,a3
	rts

L008f0e:
	.dc.b	'CCR',$00
L008f12:
	.dc.b	$53,$52,$00
L008f15:
	.dc.b	'USP',$00
L008f19:
	.dc.b	'(PC',$00,$00
L008f1e:
	move.b	#$44,d0			;'D'
L008f22:
	move.b	#$30,d1			;'0'
L008f26:
	ror.w	#1,d6
	bcs	L008f4c
L008f2a:
	addq.w	#1,d1
	cmpi.b	#$38,d1			;'8'
	bcs	L008f26
	cmpi.b	#$41,d0			;'A'
	beq	L008f3e
	move.b	#$41,d0			;'A'
	bra	L008f22

L008f3e:
	moveq.l	#$03,d0
L008f40:
	cmpi.b	#$2f,-(a3)		;'/'
	dbne	d0,L008f40
	addq.l	#1,a3
	rts

L008f4c:
	move.b	d0,(a3)+
	move.b	d1,(a3)+
	btst.l	#$00,d6
	bne	L008f5c
	move.b	#$2f,(a3)+		;'/'
	bra	L008f2a

L008f5c:
	cmpi.b	#$37,d1			;'7'
	bcs	L008f6e
	cmpi.b	#$44,d0			;'D'
	bne	L008f2a
	move.b	#$2f,(a3)+		;'/'
	bra	L008f2a

L008f6e:
	move.b	#$2d,(a3)+		;'-'
	addq.w	#1,d1
L008f74:
	ror.w	#1,d6
	btst.l	#$00,d6
	beq	L008f90
	addq.w	#1,d1
	cmpi.b	#$38,d1			;'8'
	bcs	L008f74
	move.b	d0,(a3)+
	move.b	#$37,(a3)+		;'7'
	move.b	#$2f,(a3)+		;'/'
	bra	L008f2a

L008f90:
	move.b	d0,(a3)+
	move.b	d1,(a3)+
	move.b	#$2f,(a3)+		;'/'
	bra	L008f2a

L008f9a:
	moveq.l	#$0f,d1
L008f9c:
	roxl.w	#1,d6
	roxr.w	#1,d0
	dbra	d1,L008f9c
	move.w	d0,d6
	bra	L008f1e

L008faa:
	move.w	d7,d1
	lsr.w	#8,d1
	andi.w	#$000f,d1
	cmpi.w	#$0001,d1
	bhi	L008fc6
	bne	L008fc0
	move.b	#$66,(a3)+		;'f'
	rts

L008fc0:
	move.b	#$74,(a3)+		;'t'
	rts

L008fc6:
	subq.w	#2,d1
	add.w	d1,d1
	lea.l	(L008fda),a0
	move.b	(a0,d1.w),(a3)+
	move.b	($01,a0,d1.w),(a3)+
	rts

L008fda:
	.dc.b	'hilscccsneeqvcvsplmigeltgtle'
L008ff6:
	move.w	d7,d0
	andi.w	#$ffc0,d0
	cmpi.w	#$06c0,d0
	beq	L00919c
	andi.w	#$f9c0,d0
	cmpi.w	#$00c0,d0
	beq	L0091f4
	cmpi.w	#$08c0,d0
	bne	L009028
	btst.l	#$09,d7
	bne	L009248
	btst.l	#$0a,d7
	bne	L009248
	bra	L00904c

L009028:
	move.w	d7,d0
	andi.w	#$ffc0,d0
	cmpi.w	#$0ec0,d0
	beq	L00904c
	cmpi.w	#$0e00,d0
	beq	L009352
	cmpi.w	#$0e80,d0
	beq	L009352
	cmpi.w	#$0e40,d0
	beq	L009352
L00904c:
	btst.l	#$08,d7
	beq	L0090d6
	bsr	L007eaa
	cmpi.b	#$01,d2
	beq	L009092
	moveq.l	#$01,d5
	tst.w	d2
	bne	L009066
	moveq.l	#$03,d5
L009066:
	bsr	L007f3e
	bclr.l	#$02,d3
	move.w	d3,d6
	bsr	L007fe8
	move.w	d2,d3
	clr.w	d2
	bsr	L0080b2
	tst.w	d6
	bne	L009086
	bsr	L007f9e
	bra	L00908a

L009086:
	bsr	L007fd8
L00908a:
	moveq.l	#$01,d4
	bsr	L0080bc
	rts

L009092:
	moveq.l	#$04,d6
	moveq.l	#$05,d2
	moveq.l	#$02,d5
	btst.l	#$06,d7
	beq	L0090a0
	moveq.l	#$03,d5
L0090a0:
	bsr	L007fe8
	btst.l	#$07,d7
	bne	L0090bc
	bsr	L0080b2
	bsr	L007f3e
	move.w	d2,d3
	clr.w	d2
	bsr	L0080bc
	rts

L0090bc:
	movem.w	d2-d3,-(a7)
	bsr	L007f3e
	move.w	d2,d3
	clr.w	d2
	bsr	L0080b2
	movem.w	(a7)+,d2-d3
	bsr	L0080bc
	rts

L0090d6:
	bsr	L007f3e
	cmpi.w	#$0007,d2
	beq	L007e6c
	cmpi.w	#$0004,d2
	bne	L009132
	move.w	d3,d6
	moveq.l	#$01,d5
	bsr	L007eaa
	tst.w	d2
	bne	L0090f6
	moveq.l	#$03,d5
L0090f6:
	bsr	L007fe8
	moveq.l	#$12,d2
	moveq.l	#$01,d4
	bsr	L0080b2
	move.w	d5,d4
	bsr	L007eaa
	cmpi.w	#$0012,d2
	bcc	L007e6c
	tst.w	d6
	beq	L00911c
	cmpi.w	#$000c,d2
	bcc	L007e6c
L00911c:
	cmpi.w	#$0001,d2
	beq	L007e6c
	cmpi.w	#$0012,d2
	bcc	L007e6c
	bsr	L0080bc
	rts

L009132:
	addq.w	#1,d3
	move.w	d3,d5
	move.w	d2,d6
	addq.w	#5,d6
	bsr	L007fe8
	move.w	d2,d6
	moveq.l	#$12,d2
	move.w	d5,d4
	bsr	L0080b2
	bsr	L007eaa
	cmpi.w	#$0005,d6
	beq	L009170
	cmpi.w	#$0002,d6
	bcs	L009170
	cmpi.w	#$0006,d6
	bne	L009186
	cmpi.w	#$0001,d2
	beq	L007e6c
	cmpi.w	#$0012,d2
	bcc	L007e6c
	bra	L009196

L009170:
	cmpi.w	#$0012,d2
	bne	L009186
	moveq.l	#$14,d2
	btst.l	#$06,d7
	bne	L009182
	moveq.l	#$01,d4
	bra	L009196

L009182:
	moveq.l	#$02,d4
	bra	L009196

L009186:
	cmpi.w	#$0001,d2
	beq	L007e6c
	cmpi.w	#$000c,d2
	bcc	L007e6c
L009196:
	bsr	L0080bc
	rts

L00919c:
	move.w	d7,d0
	andi.w	#$0030,d0
	beq	L0091da
	clr.w	d5
	moveq.l	#$49,d6			;'I'
	bsr	L007fe8
	move.w	(a5)+,-(a7)
	bsr	L007f5e
	move.w	(a7)+,d1
	move.b	#$09,(a3)+
	move.b	#$23,(a3)+		;'#'
	move.b	#$24,(a3)+		;'$'
	movem.l	d2-d4,-(a7)
	jsr	(wrtshex)
	jsr	(L007d8a)
	movem.l	(a7)+,d2-d4
	bsr	L0080bc
	rts

L0091da:
	moveq.l	#$4a,d6			;'J'
	clr.w	d5
	bsr	L007fe8
	bsr	L007eaa
	cmpi.w	#$0002,d2
	bcc	L007e6c
	bsr	L0080b2
	rts

L0091f4:
	btst.b	#$03,(a5)
	bne	L0091fe
	moveq.l	#$4b,d6			;'K'
	bra	L009200

L0091fe:
	moveq.l	#$4c,d6			;'L'
L009200:
	move.w	(a5)+,-(a7)
	move.w	d7,d5
	andi.w	#$0600,d5
	lsr.w	#8,d5
	lsr.w	#1,d5
	addq.w	#1,d5
	cmpi.w	#$0003,d5
	bhi	L007e6c
	move.w	d5,d4
	cmpi.w	#$0002,d5
	bne	L009220
	clr.w	d5
L009220:
	bsr	L007fe8
	bsr	L007f5e
	bsr	L0080b2
	move.w	(a7)+,d0
	clr.w	d2
	move.w	d0,d3
	andi.w	#$7000,d3
	lsr.w	#8,d3
	lsr.w	#4,d3
	btst.l	#$0f,d0
	beq	L009242
	addq.w	#1,d2
L009242:
	bsr	L0080bc
	rts

L009248:
	move.w	d7,d0
	andi.w	#$09ff,d0
	cmpi.w	#$08fc,d0
	beq	L009296
	moveq.l	#$4d,d6			;'M'
	move.w	d7,d5
	andi.w	#$0600,d5
	lsr.w	#8,d5
	lsr.w	#1,d5
	beq	L007e6c
	cmpi.w	#$0002,d5
	bne	L00926c
	clr.w	d5
L00926c:
	bsr	L007fe8
	clr.w	d2
	move.w	(a5)+,d3
	move.w	d3,-(a7)
	andi.w	#$0007,d3
	bsr	L0080b2
	clr.w	d2
	move.w	(a7)+,d3
	andi.w	#$01c0,d3
	lsr.w	#6,d3
	bsr	L0080bc
	bsr	L007fe4
	bsr	L0080bc
	rts

L009296:
	move.w	d7,d0
	andi.w	#$0600,d0
	cmpi.w	#$0400,d0
	bcs	L007e6c
	moveq.l	#$4e,d6			;'N'
	move.w	d7,d5
	andi.w	#$0600,d5
	lsr.w	#8,d5
	lsr.w	#1,d5
	beq	L007e6c
	cmpi.w	#$0002,d5
	bne	L0092bc
	clr.w	d5
L0092bc:
	bsr	L007fe8
	clr.w	d2
	move.w	(a5)+,d3
	move.w	d3,-(a7)
	andi.w	#$0007,d3
	bsr	L0080b2
	move.b	#$3a,(a3)+		;':'
	move.w	(a5)+,d3
	move.w	d3,-(a7)
	clr.w	d2
	andi.w	#$0007,d3
	bsr	L0080c6
	move.w	($0002,a7),d3
	clr.w	d2
	andi.w	#$01c0,d3
	lsr.w	#6,d3
	bsr	L0080bc
	move.b	#$3a,(a3)+		;':'
	move.w	(a7),d3
	clr.w	d2
	andi.w	#$01c0,d3
	lsr.w	#6,d3
	bsr	L0080c6
	move.b	#$2c,(a3)+		;','
	move.w	($0002,a7),d3
	clr.w	d2
	btst.l	#$0f,d3
	beq	L009314
	addq.w	#1,d2
L009314:
	andi.w	#$7000,d3
	lsr.w	#8,d3
	lsr.w	#4,d3
	move.b	#$28,(a3)+		;'('
	bsr	L0080c6
	move.b	#$29,(a3)+		;')'
	move.b	#$3a,(a3)+		;':'
	move.b	#$28,(a3)+		;'('
	move.w	(a7),d3
	clr.w	d2
	btst.l	#$0f,d3
	beq	L00933c
	addq.w	#1,d2
L00933c:
	andi.w	#$7000,d3
	lsr.w	#8,d3
	lsr.w	#4,d3
	bsr	L0080c6
	move.b	#$29,(a3)+		;')'
	clr.b	(a3)
	addq.l	#4,a7
	rts

L009352:
	moveq.l	#$4f,d6			;'O'
	move.w	d7,d5
	andi.w	#$00c0,d5
	lsr.w	#6,d5
	cmpi.w	#$0003,d5
	bcc	L007e6c
	addq.w	#1,d5
	cmpi.w	#$0002,d5
	bne	L00936e
	clr.w	d5
L00936e:
	bsr	L007fe8
	move.w	(a5)+,d0
	move.w	d0,-(a7)
	btst.l	#$0b,d0
	bne	L00939e
	bsr	L007fe4
	bsr	L0080b2
	move.w	(a7)+,d3
	clr.w	d2
	btst.l	#$0f,d3
	beq	L009390
	addq.w	#1,d2
L009390:
	andi.w	#$7000,d3
	lsr.w	#8,d3
	lsr.w	#4,d3
	bsr	L0080bc
	rts

L00939e:
	move.w	(a7)+,d3
	clr.w	d2
	btst.l	#$0f,d3
	beq	L0093aa
	addq.w	#1,d2
L0093aa:
	andi.w	#$7000,d3
	lsr.w	#8,d3
	lsr.w	#4,d3
	bsr	L0080b2
	bsr	L007fe4
	bsr	L0080bc
	rts

L0093c0:
	moveq.l	#$0c,d6
	moveq.l	#$01,d5
	bsr	L007fe8
	bsr	L007eaa
	cmpi.w	#$0001,d2
	beq	L007e6c
	move.w	d5,d4
	bsr	L0080b2
L0093da:
	bsr	L007f52
	cmpi.w	#$0012,d3
	beq	L007e6c
	cmpi.w	#$0013,d3
	beq	L007e6c
	cmpi.w	#$0001,d3
	beq	L007e6c
	cmpi.w	#$0010,d3
	bcc	L009404
	cmpi.w	#$000c,d3
	bcc	L007e6c
L009404:
	exg.l	d2,d3
	bsr	L0080bc
	rts

L00940c:
	moveq.l	#$03,d5
L00940e:
	move.w	d5,d4
	bsr	L007f3e
	cmpi.w	#$0001,d3
	beq	L00943c
	moveq.l	#$0c,d6
	bsr	L007fe8
	move.w	d2,-(a7)
	move.w	d7,d2
	andi.w	#$003f,d2
	cmp.w	#$003d,d2		;'='
	bcc	L007e6c
	move.w	(a7)+,d2
	bsr	L007eaa
	bsr	L0080b2
	bra	L0093da

L00943c:
	moveq.l	#$0d,d6
	bsr	L007fe8
	bsr	L007eaa
	bsr	L0080b2
	bsr	L007f3e
	exg.l	d2,d3
	bsr	L0080bc
	rts

L009456:
	moveq.l	#$02,d5
	bra	L00940e

L00945a:
	cmpi.w	#$4afc,d7
	bne	L00946c
	moveq.l	#$48,d6			;'H'
	clr.w	d5
	bsr	L007fe8
	clr.b	(a3)+
	rts

L00946c:
	cmpi.w	#$4e71,d7		;'Nq'
	bne	L00947a
	moveq.l	#$11,d6
	clr.w	d5
	bra	L007fe8

L00947a:
	move.w	d7,d0
	andi.w	#$ffc0,d0
	cmpi.w	#$42c0,d0
	beq	L0097e2
	move.w	d7,d0
	andi.w	#$fff8,d0
	cmpi.w	#$4808,d0
	beq	L009800
	cmpi.w	#$4848,d0		;'HH'
	beq	L00981e
	cmpi.w	#$4e74,d7		;'Nt'
	beq	L009856
	move.w	d7,d0
	andi.w	#$fffe,d0
	cmpi.w	#$4e7a,d0		;'Nz'
	beq	L009868
	andi.w	#$ffc0,d0
	cmpi.w	#$4c00,d0
	beq	L00995c
	cmpi.w	#$4c40,d0		;'L@'
	beq	L0099b6
	move.w	d7,d0
	andi.w	#$fff8,d0
	cmpi.w	#$49c0,d0
	beq	L009844
	btst.l	#$08,d7
	beq	L009536
	moveq.l	#$0e,d6
	btst.l	#$06,d7
	beq	L00950a
	addq.w	#1,d6
	btst.l	#$07,d7
	beq	L007e6c
	clr.w	d5
	bsr	L007fe8
	bsr	L007f5e
	bsr	L0080b2
	bsr	L007f3e
	exg.l	d2,d3
	moveq.l	#$01,d2
	bsr	L0080bc
	rts

L00950a:
	clr.w	d5
	btst.l	#$07,d7
	bne	L009514
	moveq.l	#$03,d5
L009514:
	bsr	L007fe8
	tst.w	d5
	bne	L00951e
	moveq.l	#$02,d5
L00951e:
	move.w	d5,d4
	bsr	L007f9e
	bsr	L0080b2
	bsr	L007f3e
	exg.l	d2,d3
	clr.w	d2
	bsr	L0080bc
	rts

L009536:
	bsr	L007f3e
	cmpi.w	#$0007,d2
	bne	L00962a
	cmpi.w	#$0001,d3
	bcs	L007e6c
	bne	L009610
	move.w	d7,d2
	andi.w	#$0038,d2
	lsr.w	#3,d2
	move.w	d7,d3
	andi.w	#$0007,d3
	cmpi.w	#$0006,d2
	bhi	L007e6c
	bne	L009588
	cmpi.w	#$0004,d3
	beq	L007e6c
	moveq.l	#$10,d6
	add.w	d3,d6
	clr.w	d5
	bsr	L007fe8
	cmpi.w	#$0002,d3
	bne	L009586
	moveq.l	#$12,d2
	moveq.l	#$02,d4
	bsr	L0080b2
L009586:
	rts

L009588:
	clr.w	d5
	cmpi.w	#$0002,d2
	bcc	L0095ba
	moveq.l	#$18,d6
	bsr	L007fe8
	move.b	#$09,(a3)+
	move.b	#$23,(a3)+		;'#'
	move.w	d7,d1
	andi.w	#$000f,d1
	move.b	#$24,(a3)+		;'$'
	jsr	(wrtshex)
	jsr	(L007d8a)
	move.b	#$00,(a3)+
	rts

L0095ba:
	cmpi.w	#$0003,d2
	bcc	L0095d6
	moveq.l	#$01,d2
	moveq.l	#$19,d6
	bsr	L007fe8
	moveq.l	#$02,d4
	bsr	L0080b2
	moveq.l	#$12,d2
	bsr	L0080bc
	rts

L0095d6:
	bhi	L0095e6
	moveq.l	#$1a,d6
	moveq.l	#$01,d2
	bsr	L007fe8
	bsr	L0080b2
	rts

L0095e6:
	moveq.l	#$0c,d6
	moveq.l	#$03,d4
	bsr	L007fe8
	cmpi.w	#$0004,d2
	bne	L009602
	moveq.l	#$01,d2
	bsr	L0080b2
	moveq.l	#$14,d2
	bsr	L0080bc
	rts

L009602:
	moveq.l	#$14,d2
	bsr	L0080b2
	moveq.l	#$01,d2
	bsr	L0080bc
	rts

L009610:
	moveq.l	#$1b,d6
	clr.w	d5
	btst.l	#$06,d7
	beq	L00961c
	moveq.l	#$1c,d6
L00961c:
	bsr	L007fe8
	bsr	L007f5e
	bsr	L0080b2
	rts

L00962a:
	clr.w	d5
	cmpi.w	#$0001,d2
	bhi	L009682
	beq	L009666
	cmpi.w	#$0003,d3
	bne	L009652
	moveq.l	#$0c,d6
	bsr	L007fe8
	moveq.l	#$14,d2
	moveq.l	#$02,d4
	bsr	L0080b2
	bsr	L007fd8
	bsr	L0080bc
	rts

L009652:
	addq.w	#1,d3
	move.w	d3,d5
	moveq.l	#$1d,d6
	bsr	L007fe8
	bsr	L007fd8
	bsr	L0080b2
	rts

L009666:
	cmpi.w	#$0003,d3
	bcc	L007e6c
	moveq.l	#$1e,d6
	addq.w	#1,d3
	move.w	d3,d5
	bsr	L007fe8
	bsr	L007fd8
	bsr	L0080b2
	rts

L009682:
	cmpi.w	#$0003,d2
	bhi	L0096f2
	beq	L0096be
	cmpi.w	#$0003,d3
	bne	L0096aa
	moveq.l	#$0c,d6
	bsr	L007fe8
	moveq.l	#$02,d4
	bsr	L007f9e
	bsr	L0080b2
	moveq.l	#$14,d2
	moveq.l	#$01,d4
	bsr	L0080bc
	rts

L0096aa:
	moveq.l	#$1f,d6
	addq.w	#1,d3
	move.w	d3,d5
	bsr	L007fe8
	bsr	L007fd8
	bsr	L0080b2
	rts

L0096be:
	cmpi.w	#$0003,d3
	bne	L0096de
	moveq.l	#$0c,d6
	bsr	L007fe8
	moveq.l	#$02,d4
	bsr	L007f9e
	bsr	L0080b2
	moveq.l	#$14,d2
	moveq.l	#$02,d4
	bsr	L0080bc
	rts

L0096de:
	moveq.l	#$20,d6			;' '
	move.w	d3,d5
	addq.w	#1,d5
	bsr	L007fe8
	bsr	L007fd8
	bsr	L0080b2
	rts

L0096f2:
	cmpi.w	#$0005,d2
	bhi	L0097b2
	beq	L009778
	cmpi.w	#$0001,d3
	bhi	L009738
	beq	L009714
	moveq.l	#$21,d6			;'!'
	bsr	L007fe8
	bsr	L007fd8
	bsr	L0080b2
	rts

L009714:
	bsr	L007eaa
	tst.w	d2
	beq	L00972c
	moveq.l	#$22,d6			;'"'
	bsr	L007fe8
	bsr	L007f5e
	bsr	L0080b2
	rts

L00972c:
	moveq.l	#$23,d6			;'#'
	bsr	L007fe8
	bsr	L0080b2
	rts

L009738:
	move.w	d3,d5
	bsr	L007eaa
	tst.w	d2
	bne	L00974e
	moveq.l	#$25,d6			;'%'
	bsr	L007fe8
	bsr	L0080b2
	rts

L00974e:
	moveq.l	#$24,d6			;'$'
	bsr	L007fe8
	move.w	(a5)+,d6
	move.b	#$09,(a3)+
	cmpi.w	#$0004,d2
	beq	L00976e
	bsr	L008f1e
	bsr	L007f7e
	bsr	L0080bc
	rts

L00976e:
	bsr	L008f9a
	bsr	L0080bc
	rts

L009778:
	cmpi.w	#$0003,d3
	bne	L00978e
	moveq.l	#$27,d6			;'''
	bsr	L007fe8
	bsr	L007fd8
	bsr	L0080b2
	rts

L00978e:
	move.w	d3,d5
	addq.w	#1,d5
	moveq.l	#$26,d6			;'&'
	move.w	d3,-(a7)
	move.w	d5,d4
	bsr	L007fe8
	move.w	(a7)+,d0
	tst.b	d0
	bne	L0097a8
	bsr	L007f9e
	bra	L0097ac

L0097a8:
	bsr	L007eaa
L0097ac:
	bsr	L0080b2
	rts

L0097b2:
	cmpi.w	#$0002,d3
	bcs	L007e6c
	move.w	d3,d5
	moveq.l	#$24,d6			;'$'
	bsr	L007fe8
	move.w	(a5)+,d6
	bsr	L007eaa
	cmpi.w	#$0003,d2
	beq	L0097d2
	bsr	L007f5e
L0097d2:
	bsr	L0080b2
	move.b	#$2c,(a3)+		;','
	bsr	L008f1e
	clr.b	(a3)+
	rts

L0097e2:
	moveq.l	#$0c,d6
	clr.w	d5
	bsr	L007fe8
	moveq.l	#$14,d2
	moveq.l	#$01,d4
	move.b	#$09,(a3)+
	bsr	L0080c6
	bsr	L007fd8
	bsr	L0080bc
	rts

L009800:
	moveq.l	#$19,d6
	moveq.l	#$03,d5
	bsr	L007fe8
	moveq.l	#$01,d2
	move.w	d7,d3
	andi.w	#$0007,d3
	bsr	L0080b2
	moveq.l	#$12,d2
	moveq.l	#$03,d4
	bsr	L0080bc
	rts

L00981e:
	moveq.l	#$50,d6			;'P'
	clr.w	d5
	bsr	L007fe8
	move.w	d7,d1
	andi.w	#$0007,d1
	move.b	#$09,(a3)+
	move.b	#$23,(a3)+		;'#'
	jsr	(wrtshex)
	jsr	(L007d8a)
	clr.b	(a3)
	rts

L009844:
	moveq.l	#$51,d6			;'Q'
	moveq.l	#$03,d5
	bsr	L007fe8
	bsr	L007eaa
	bsr	L0080b2
	rts

L009856:
	moveq.l	#$52,d6			;'R'
	clr.w	d5
	bsr	L007fe8
	moveq.l	#$12,d2
	moveq.l	#$02,d4
	bsr	L0080b2
	rts

L009868:
	moveq.l	#$53,d6			;'S'
	clr.w	d5
	bsr	L007fe8
	move.w	(a5)+,d5
	move.w	d5,-(a7)
	btst.l	#$00,d7
	bne	L00989a
	move.b	#$09,(a3)+
	bsr	L0098be
	move.w	(a7)+,d3
	clr.w	d2
	btst.l	#$0f,d3
	beq	L00988c
	addq.w	#1,d2
L00988c:
	andi.w	#$7000,d3
	lsr.w	#8,d3
	lsr.w	#4,d3
	bsr	L0080bc
	rts

L00989a:
	move.w	d5,d3
	clr.w	d2
	btst.l	#$0f,d3
	beq	L0098a6
	addq.w	#1,d2
L0098a6:
	andi.w	#$7000,d3
	lsr.w	#8,d3
	lsr.w	#4,d3
	bsr	L0080b2
	move.b	#$2c,(a3)+		;','
	move.w	(a7)+,d5
	bsr	L0098be
	clr.b	(a3)
	rts

L0098be:
	andi.w	#$0fff,d5
	lea.l	(L0098ea),a0
L0098c8:
	tst.w	(a0)
	bmi	L007e6c
	cmp.w	(a0)+,d5
	beq	L0098e2
L0098d2:
	tst.b	(a0)+
	bne	L0098d2
	move.w	a0,d0
	btst.l	#$00,d0
	beq	L0098c8
	addq.l	#1,a0
	bra	L0098c8

L0098e2:
	move.b	(a0)+,(a3)+
	bne	L0098e2
	subq.l	#1,a3
	rts

L0098ea:
	.dc.b	$00,$00,$53,$46,$43,$00,$00,$01,$44,$46,$43,$00,$00,$02,$43,$41
	.dc.b	$43,$52,$00,$00,$00,$03,$54,$43,$00,$00,$00,$04,$49,$54,$54,$30
	.dc.b	$00,$00,$00,$05,$49,$54,$54,$31,$00,$00,$00,$06,$44,$54,$54,$30
	.dc.b	$00,$00,$00,$07,$44,$54,$54,$31,$00,$00,$08,$00,$55,$53,$50,$00
	.dc.b	$08,$01,$56,$42,$52,$00,$08,$02,$43,$41,$41,$52,$00,$00,$08,$03
	.dc.b	$4d,$53,$50,$00,$08,$04,$49,$53,$50,$00,$08,$05,$4d,$4d,$55,$53
	.dc.b	$52,$00,$08,$06,$55,$52,$50,$00,$08,$07,$53,$52,$50,$00,$ff,$ff
	.dc.b	$ff,$ff
L00995c:
	moveq.l	#$03,d4
	move.w	(a5)+,d0
	move.w	d0,-(a7)
	moveq.l	#$39,d6			;'9'
	btst.l	#$0b,d0
	beq	L00996c
	addq.w	#1,d6
L00996c:
	moveq.l	#$03,d5
	bsr	L007fe8
	bsr	L007f9e
	bsr	L0080b2
	move.w	(a7),d3
	clr.w	d2
	btst.l	#$0a,d3
	bne	L009994
	andi.w	#$7000,d3
	lsr.w	#8,d3
	lsr.w	#4,d3
	bsr	L0080bc
	addq.l	#2,a7
	rts

L009994:
	andi.w	#$0007,d3
	clr.w	d2
	bsr	L0080bc
	move.b	#$3a,(a3)+		;':'
	move.w	(a7)+,d3
	andi.w	#$7000,d3
	lsr.w	#8,d3
	lsr.w	#4,d3
	clr.w	d2
	bsr	L0080c6
	clr.b	(a3)
	rts

L0099b6:
	moveq.l	#$03,d4
	move.w	(a5)+,d0
	move.w	d0,-(a7)
	btst.l	#$0a,d0
	bne	L0099da
	move.w	d0,d1
	move.w	d0,d2
	andi.w	#$0007,d1
	andi.w	#$7000,d2
	lsr.w	#8,d2
	lsr.w	#4,d2
	cmp.w	d1,d2
	beq	L009a16
	moveq.l	#$54,d6			;'T'
	bra	L0099dc

L0099da:
	moveq.l	#$2c,d6			;','
L0099dc:
	btst.l	#$0b,d0
	beq	L0099e4
	addq.w	#1,d6
L0099e4:
	moveq.l	#$03,d5
	bsr	L007fe8
	bsr	L007f9e
	bsr	L0080b2
	move.w	(a7),d3
	clr.w	d2
	andi.w	#$0007,d3
	bsr	L0080bc
	move.b	#$3a,(a3)+		;':'
	clr.w	d2
	move.w	(a7)+,d3
	andi.w	#$7000,d3
	lsr.w	#8,d3
	lsr.w	#4,d3
	bsr	L0080c6
	clr.b	(a3)
	rts

L009a16:
	moveq.l	#$2c,d6			;','
	btst.l	#$0b,d0
	beq	L009a20
	addq.w	#1,d6
L009a20:
	moveq.l	#$03,d5
	bsr	L007fe8
	bsr	L007f9e
	bsr	L0080b2
	clr.w	d2
	move.w	(a7)+,d3
	andi.w	#$0007,d3
	bsr	L0080bc
	rts

L009a3c:
	move.w	d7,d1
	andi.w	#$00c0,d1
	cmpi.w	#$00c0,d1
	beq	L009a8e
	bsr	L007f3e
	bclr.l	#$02,d3
	moveq.l	#$29,d6			;')'
	btst.l	#$08,d7
	bne	L009a5a
	moveq.l	#$28,d6			;'('
L009a5a:
	move.w	d3,d5
	addq.w	#1,d5
	bsr	L007fe8
	move.b	#$09,(a3)+
	move.b	#$23,(a3)+		;'#'
	move.w	d2,d1
	bne	L009a70
	moveq.l	#$08,d1
L009a70:
	jsr	(wrthex)
	bsr	L007fca
	cmpi.w	#$0001,d2
	bne	L009a88
	cmpi.w	#$0001,d5
	beq	L007e6c
L009a88:
	bsr	L0080bc
	rts

L009a8e:
	move.w	d7,d0
	andi.w	#$003f,d0
	cmpi.w	#$003a,d0		;':'
	bcc	L009ada
	bsr	L007eaa
	cmpi.w	#$0001,d2
	beq	L009abc
	move.b	#$73,(a3)+		;'s'
	bsr	L008faa
	bsr	L007fd8
	bsr	L0080b2
	move.w	#$0001,($0466,a6)
	rts

L009abc:
	move.b	#$64,(a3)+		;'d'
	move.b	#$62,(a3)+		;'b'
	bsr	L008faa
	clr.w	d2
	bsr	L0080b2
	move.b	#$2c,(a3)+		;','
	move.w	(a5)+,d1
	moveq.l	#$02,d0
	bra	L009b72

L009ada:
	move.w	d0,-(a7)
	moveq.l	#$18,d6
	clr.w	d5
	bsr	L007fe8
	bsr	L008faa
	move.w	(a7)+,d0
	cmpi.w	#$003c,d0		;'<'
	bhi	L007e6c
	bne	L009af8
	clr.b	(a3)
	rts

L009af8:
	move.b	#$2e,(a3)+		;'.'
	cmpi.w	#$003a,d0		;':'
	bne	L009b10
	move.b	#$77,(a3)+		;'w'
	moveq.l	#$12,d2
	moveq.l	#$02,d4
	bsr	L0080b2
	rts

L009b10:
	move.b	#$6c,(a3)+		;'l'
	moveq.l	#$12,d2
	moveq.l	#$03,d4
	bsr	L0080b2
	rts

L009b1e:
	move.b	#$62,(a3)+		;'b'
	move.w	d7,d1
	andi.w	#$0f00,d1
	bne	L009b34
	move.b	#$72,(a3)+		;'r'
	move.b	#$61,(a3)+		;'a'
	bra	L009b48

L009b34:
	cmpi.w	#$0100,d1
	bne	L009b44
	move.b	#$73,(a3)+		;'s'
	move.b	#$72,(a3)+		;'r'
	bra	L009b48

L009b44:
	bsr	L008faa
L009b48:
	move.b	#$2e,(a3)+		;'.'
	cmpi.b	#$ff,d7
	beq	L009b8c
	tst.b	d7
	bne	L009b64
	move.b	#$77,(a3)+		;'w'
	move.b	#$09,(a3)+
	move.w	(a5)+,d1
	moveq.l	#$02,d0
	bra	L009b72

L009b64:
	move.b	#$73,(a3)+		;'s'
	move.b	#$09,(a3)+
	move.w	d7,d1
	ext.w	d1
	clr.l	d0
L009b72:
	ext.l	d1
L009b74:
	add.l	a5,d1
	sub.l	d0,d1
	move.b	#$24,(a3)+		;'$'
	jsr	(wrtlhex)
	jsr	(symlchk)
	clr.b	(a3)+
	rts

L009b8c:
	move.b	#$6c,(a3)+		;'l'
	move.b	#$09,(a3)+
	move.l	(a5)+,d1
	moveq.l	#$04,d0
	bra	L009b74

L009b9a:
	btst.l	#$08,d7
	bne	L007e6c
	moveq.l	#$2a,d6			;'*'
	clr.w	d5
	bsr	L007fe8
	move.b	#$09,(a3)+
	move.b	#$23,(a3)+		;'#'
	move.w	d7,d1
	move.b	#$24,(a3)+		;'$'
	jsr	(wrtshex)
	jsr	(L007d8a)
	bsr	L007f3e
	move.w	d2,d3
	clr.w	d2
	bsr	L0080bc
	rts

L009bd2:
	clr.w	d5
	move.w	d7,d1
	andi.w	#$01f0,d1
	cmpi.w	#$0100,d1
	beq	L009bf2
	cmpi.w	#$0140,d1
	beq	L009c98
	cmpi.w	#$0180,d1
	beq	L009cd6
	bra	L009c2c

L009bf2:
	moveq.l	#$2b,d6			;'+'
L009bf4:
	bsr	L007fe8
	btst.l	#$03,d7
	bne	L009c14
	bsr	L007eaa
	bsr	L0080b2
	bsr	L007f3e
	move.w	d2,d3
	clr.w	d2
	bsr	L0080bc
	rts

L009c14:
	bsr	L007eaa
	moveq.l	#$04,d2
	bsr	L0080b2
	bsr	L007f3e
	move.w	d2,d3
	moveq.l	#$04,d2
	bsr	L0080bc
	rts

L009c2c:
	moveq.l	#$2c,d6			;','
L009c2e:
	bsr	L007f3e
	cmpi.w	#$0003,d3
	bne	L009c52
L009c38:
	bsr	L007fe8
	moveq.l	#$02,d4
	move.w	d2,-(a7)
	bsr	L007f9e
	bsr	L0080b2
	move.w	(a7)+,d3
	clr.w	d2
	bsr	L0080bc
	rts

L009c52:
	addq.w	#1,d6
	cmpi.w	#$0007,d3
	beq	L009c38
	moveq.l	#$2e,d6			;'.'
L009c5c:
	move.w	d3,d5
	addq.w	#1,d5
	andi.w	#$0003,d5
	bsr	L007fe8
	btst.l	#$08,d7
	beq	L009c80
	move.w	d2,d3
	clr.w	d2
	bsr	L0080b2
	bsr	L007fe4
	bsr	L0080bc
	rts

L009c80:
	bsr	L007f9e
	move.w	d5,d4
	bsr	L0080b2
	bsr	L007f3e
	move.w	d2,d3
	clr.w	d2
	bsr	L0080bc
	rts

L009c98:
	moveq.l	#$56,d6			;'V'
L009c9a:
	clr.w	d5
	bsr	L007fe8
	clr.w	d2
	move.w	d7,d3
	andi.w	#$0007,d3
	btst.l	#$03,d7
	beq	L009cb0
	moveq.l	#$04,d2
L009cb0:
	bsr	L0080b2
	clr.w	d2
	move.w	d7,d3
	andi.w	#$0e00,d3
	lsr.w	#8,d3
	lsr.w	#1,d3
	btst.l	#$03,d7
	beq	L009cc8
	moveq.l	#$04,d2
L009cc8:
	bsr	L0080bc
	moveq.l	#$02,d4
	moveq.l	#$12,d2
	bsr	L0080bc
	rts

L009cd6:
	moveq.l	#$57,d6			;'W'
	bra	L009c9a

L009cda:
	moveq.l	#$2f,d6			;'/'
L009cdc:
	move.w	d7,d1
	andi.w	#$00c0,d1
	cmpi.w	#$00c0,d1
	beq	L009d06
	btst.l	#$08,d7
	beq	L009d2e
	move.w	d7,d1
	andi.w	#$0030,d1
	bne	L009d2e
	bsr	L007f3e
	andi.w	#$0003,d3
	move.w	d3,d5
	addq.w	#1,d5
	bra	L009bf4

L009d06:
	addq.w	#1,d6
	moveq.l	#$02,d5
	btst.l	#$08,d7
	beq	L009d12
	moveq.l	#$03,d5
L009d12:
	bsr	L007fe8
	move.w	d5,d4
	bsr	L007eaa
	bsr	L0080b2
	bsr	L007f3e
	move.w	d2,d3
	moveq.l	#$01,d2
	bsr	L0080bc
	rts

L009d2e:
	addq.w	#2,d6
	bsr	L007f3e
	bclr.l	#$02,d3
	move.w	d3,d5
	addq.w	#1,d5
	bsr	L007fe8
	btst.l	#$08,d7
	beq	L009d58
	move.w	d2,d3
	clr.w	d2
	bsr	L0080b2
	bsr	L007fe4
	bsr	L0080bc
	rts

L009d58:
	tst.w	d3
	bne	L009d6a
	bsr	L007eaa
	cmpi.w	#$0001,d2
	beq	L007e6c
	bra	L009d6e

L009d6a:
	bsr	L007eaa
L009d6e:
	move.w	d5,d4
	bsr	L0080b2
	bsr	L007f3e
	move.w	d2,d3
	clr.w	d2
	bsr	L0080bc
	rts

L009d82:
	lea.l	(emulff),a1
L009d88:
	tst.b	(a1)
	beq	L009da8
	movea.l	a1,a0
L009d8e:
	tst.b	(a1)+
	bne	L009d8e
	adda.l	#$00000001,a1
	move.b	(a1)+,d0
	rol.w	#8,d0
	move.b	(a1)+,d0
	cmp.w	d0,d7
	bne	L009d88
L009da2:
	move.b	(a0)+,(a3)+
	bne	L009da2
	rts

L009da8:
	moveq.l	#$32,d6			;'2'
	moveq.l	#$32,d6			;'2'
L009dac:
	move.w	d7,d1
	move.b	#$24,(a3)+		;'$'
	bsr	wrtwhex
	move.b	#$09,(a3)+
	clr.w	d5
	bsr	L007fe8
	clr.b	(a3)+
	rts

L009dc4:
	btst.l	#$08,d7
	bne	L009df2
	bsr	L007f3e
	cmpi.w	#$0003,d3
	beq	L009de8
	move.w	d3,d5
	addq.w	#1,d5
	moveq.l	#$33,d6			;'3'
	move.w	d5,d4
	bsr	L007fe8
	bra	L009d58

L009de4:
	moveq.l	#$03,d5
	bra	L009dea

L009de8:
	moveq.l	#$02,d5
L009dea:
	move.w	d5,d4
	moveq.l	#$34,d6			;'4'
	bra	L009d12

L009df2:
	bsr	L007f3e
	bclr.l	#$02,d3
	cmpi.w	#$0003,d3
	beq	L009de4
	move.w	d3,d5
	addq.w	#1,d5
	move.w	d7,d2
	andi.w	#$0038,d2
	lsr.w	#3,d2
	move.w	d7,d3
	andi.w	#$0007,d3
	cmpi.w	#$0001,d2
	bne	L009e32
	moveq.l	#$35,d6			;'5'
	bsr	L007fe8
	moveq.l	#$03,d2
	bsr	L0080b2
	bsr	L007f3e
	move.w	d2,d3
	moveq.l	#$03,d2
	bsr	L0080bc
	rts

L009e32:
	bsr	L007f3e
	move.w	d2,d3
	clr.w	d2
	moveq.l	#$36,d6			;'6'
	bsr	L007fe8
	bsr	L0080b2
L009e44:
	bsr	L007fd8
	bsr	L0080bc
	rts

L009e4e:
	move.w	d7,d1
	clr.w	d5
	andi.w	#$01f8,d1
	moveq.l	#$37,d6			;'7'
	cmpi.w	#$0188,d1
	beq	L009e90
	cmpi.w	#$0140,d1
	beq	L009ea2
	cmpi.w	#$0148,d1
	beq	L009eb4
	moveq.l	#$38,d6			;'8'
	bclr.l	#$03,d1
	cmpi.w	#$0100,d1
	beq	L009bf4
	bsr	L007f3e
	bclr.l	#$02,d3
	moveq.l	#$39,d6			;'9'
	cmpi.w	#$0003,d3
	beq	L009c2e
	moveq.l	#$3b,d6			;';'
	bra	L009c5c

L009e90:
	bsr	L007fe8
	bsr	L007f3e
	move.w	d2,d3
	clr.w	d2
	bsr	L0080b2
	bra	L009ec4

L009ea2:
	bsr	L007fe8
	bsr	L007f3e
	move.w	d2,d3
	clr.w	d2
	bsr	L0080b2
	bra	L009e44

L009eb4:
	bsr	L007fe8
	bsr	L007f3e
	move.w	d2,d3
	moveq.l	#$01,d2
	bsr	L0080b2
L009ec4:
	bsr	L007eaa
	bsr	L0080bc
	rts

L009ece:
	moveq.l	#$3c,d6			;'<'
	bra	L009cdc

L009ed4:
	move.w	d7,d1
	moveq.l	#$3f,d6			;'?'
	andi.w	#$00c0,d1
	cmpi.w	#$00c0,d1
	beq	L009f36
	move.w	d7,d2
	andi.w	#$0018,d2
	lsr.w	#2,d2
	add.w	d2,d6
	btst.l	#$08,d7
	bne	L009ef4
	addq.w	#1,d6
L009ef4:
	bsr	L007f3e
	bclr.l	#$02,d3
	move.w	d3,d5
	addq.w	#1,d5
	bsr	L007fe8
	btst.l	#$05,d7
	bne	L009f20
	tst.w	d2
	bne	L009f10
	moveq.l	#$08,d2
L009f10:
	addi.b	#$30,d2			;'0'
	move.b	#$09,(a3)+
	move.b	#$23,(a3)+		;'#'
	move.b	d2,(a3)+
	bra	L009f28

L009f20:
	move.w	d2,d3
	clr.w	d2
	bsr	L0080b2
L009f28:
	move.w	d7,d3
	andi.w	#$0007,d3
	clr.w	d2
	bsr	L0080bc
	rts

L009f36:
	btst.l	#$0b,d7
	bne	L009f5c
	moveq.l	#$02,d5
	bsr	L007f3e
	add.w	d2,d2
	add.w	d2,d6
	btst.l	#$08,d7
	bne	L009f4e
	addq.w	#1,d6
L009f4e:
	bsr	L007fe8
	bsr	L007fe4
	bsr	L0080b2
	rts

L009f5c:
	moveq.l	#$58,d6			;'X'
	move.w	d7,d0
	andi.w	#$0700,d0
	lsr.w	#8,d0
	add.w	d0,d6
	clr.w	d5
	bsr	L007fe8
	move.w	(a5)+,d0
	move.w	d0,-(a7)
	move.w	d7,d0
	andi.w	#$0700,d0
	lsr.w	#8,d0
	cmpi.w	#$0007,d0
	beq	L009fc2
	move.w	(a7),d0
	btst.l	#$08,d7
	bne	L009f90
	andi.w	#$f000,d0
	bne	L007e6c
L009f90:
	btst.l	#$0f,d0
	bne	L007e6c
	bsr	L007eaa
	tst.w	d2
	beq	L009ffc
	move.w	d7,d0
	andi.w	#$0700,d0
	lsr.w	#8,d0
	beq	L009ff2
	cmpi.w	#$0002,d0
	bcs	L009ff2
	beq	L009ff8
	cmpi.w	#$0004,d0
	bcs	L009ff2
	beq	L009ff8
	cmpi.w	#$0006,d0
	bcs	L009ff2
	beq	L009ff8
L009fc2:
	move.w	(a7),d3
	clr.w	d2
	andi.w	#$f000,d3
	lsr.w	#8,d3
	lsr.w	#4,d3
	cmpi.w	#$0007,d3
	bhi	L007e6c
	bsr	L0080b2
	bsr	L007eaa
	tst.w	d2
	beq	L009fe6
	bsr	L007f7e
L009fe6:
	bsr	L0080bc
	move.w	(a7)+,d0
	bsr	L00a022
	clr.b	(a3)
	rts

L009ff2:
	bsr	L007f5e
	bra	L009ffc

L009ff8:
	bsr	L007f7e
L009ffc:
	bsr	L0080b2
	move.w	(a7),d0
	bsr	L00a022
	btst.l	#$08,d7
	bne	L00a010
	addq.l	#2,a7
	clr.b	(a3)
	rts

L00a010:
	move.w	(a7)+,d3
	andi.w	#$7000,d3
	lsr.w	#8,d3
	lsr.w	#4,d3
	clr.w	d2
	bsr	L0080bc
	rts

L00a022:
	move.b	#$7b,(a3)+		;'{'
	move.w	d0,-(a7)
	btst.l	#$0b,d0
	bne	L00a048
	move.w	d0,d1
	andi.w	#$07c0,d1
	lsr.w	#6,d1
	move.b	#$24,(a3)+		;'$'
	jsr	(wrtshex)
	jsr	(L007d8a)
	bra	L00a056

L00a048:
	clr.w	d2
	move.w	d0,d3
	andi.w	#$01c0,d3
	lsr.w	#6,d3
	bsr	L0080c6
L00a056:
	move.b	#$3a,(a3)+		;':'
	move.w	(a7)+,d0
	btst.l	#$05,d0
	bne	L00a07e
	move.w	d0,d1
	andi.w	#$001f,d1
	bne	L00a06c
	moveq.l	#$20,d1			;' '
L00a06c:
	move.b	#$24,(a3)+		;'$'
	jsr	(wrtshex)
	jsr	(L007d8a)
	bra	L00a08a

L00a07e:
	clr.w	d2
	move.w	d0,d3
	andi.w	#$0007,d3
	bsr	L0080c6
L00a08a:
	move.b	#$7d,(a3)+		;'}'
	clr.b	(a3)
	rts

L00a092:
	move.l	a7,($0810,a6)
	cmp.w	#$fe00,d7
	bcc	L00a0ac
	move.w	d7,d0
	andi.w	#$01c0,d0
	lsr.w	#6,d0
	cmpi.w	#$0005,d0
	bhi	L00a0ac
	bra	L00a0e2

L00a0ac:
	movea.l	($0810,a6),a7
	cmp.w	#$fe00,d7
	bcs	L00a0dc
	lea.l	(emulff),a1
L00a0bc:
	tst.b	(a1)
	beq	L00a0dc
	movea.l	a1,a0
L00a0c2:
	tst.b	(a1)+
	bne	L00a0c2
	adda.l	#$00000001,a1
	move.b	(a1)+,d0
	rol.w	#8,d0
	move.b	(a1)+,d0
	cmp.w	d0,d7
	bne	L00a0bc
L00a0d6:
	move.b	(a0)+,(a3)+
	bne	L00a0d6
	rts

L00a0dc:
	moveq.l	#$47,d6			;'G'
	bra	L009dac

L00a0e2:
	move.w	d7,d0
	andi.w	#$0e00,d0
	beq	L00a34a
	lsr.w	#8,d0
	lsr.w	#1,d0
	cmpi.w	#$0006,d0
	bcc	L00a102
	cmpi.w	#$0001,d0
	beq	L00ac7a
	bra	L00a102

L00a100:
	nop
L00a102:
	move.b	#$43,(a3)+		;'C'
	move.b	#$50,(a3)+		;'P'
	addi.b	#$30,d0			;'0'
	move.b	d0,(a3)+
	move.w	d7,d0
	andi.w	#$01c0,d0
	lsr.w	#6,d0
	beq	L00a13a
	cmpi.w	#$0005,d0
	bhi	L00a0ac
	beq	L00a32e
	cmpi.w	#$0002,d0
	bcs	L00a16a
	beq	L00a28c
	cmpi.w	#$0004,d0
	bcs	L00a2d0
	bra	L00a312

L00a13a:
	moveq.l	#$6e,d6			;'n'
	clr.w	d5
	bsr	L007fe8
	move.w	(a5)+,d1
	move.b	#$09,(a3)+
	move.b	#$28,(a3)+		;'('
	move.b	#$24,(a3)+		;'$'
	jsr	(wrtwhex)
	jsr	(L007d72)
	move.b	#$29,(a3)+		;')'
	bsr	L007eaa
	bsr	L0080bc
	rts

L00a16a:
	move.w	d7,d0
	andi.w	#$0038,d0
	lsr.w	#3,d0
	cmpi.w	#$0001,d0
	beq	L00a1c0
	cmpi.w	#$0007,d0
	bne	L00a194
	move.w	d7,d0
	andi.w	#$0007,d0
	cmpi.w	#$0002,d0
	bcs	L00a194
	cmpi.w	#$0004,d0
	bls	L00a20c
	bhi	L007e6c
L00a194:
	moveq.l	#$6f,d6			;'o'
	clr.w	d5
	bsr	L007fe8
	move.w	(a5)+,d1
	move.b	#$28,(a3)+		;'('
	move.b	#$24,(a3)+		;'$'
	jsr	(wrtshex)
	jsr	(L007d8a)
	move.b	#$29,(a3)+		;')'
	bsr	L007f7e
	bsr	L0080b2
	rts

L00a1c0:
	moveq.l	#$70,d6			;'p'
	clr.w	d5
	bsr	L007fe8
	move.w	(a5)+,d1
	move.b	#$28,(a3)+		;'('
	move.b	#$24,(a3)+		;'$'
	jsr	(wrtshex)
	jsr	(L007d8a)
	move.b	#$29,(a3)+		;')'
	clr.w	d2
	move.w	d7,d3
	andi.w	#$0007,d3
	bsr	L0080b2
	move.w	(a5)+,d1
	ext.l	d1
	move.b	#$2c,(a3)+		;','
	add.w	a5,d1
	subq.l	#4,d1
	move.b	#$24,(a3)+		;'$'
	jsr	(wrtlhex)
	jsr	(symlchk)
	rts

L00a20c:
	moveq.l	#$71,d6			;'q'
	clr.w	d5
	bsr	L007fe8
	move.w	(a5)+,d1
	move.b	#$28,(a3)+		;'('
	move.b	#$24,(a3)+		;'$'
	jsr	(wrtshex)
	jsr	(L007d8a)
	move.b	#$29,(a3)+		;')'
	move.w	d7,d0
	andi.w	#$0007,d0
	cmpi.w	#$0004,d0
	beq	L00a288
	cmpi.w	#$0002,d0
	bne	L00a264
	move.b	#$2e,(a3)+		;'.'
	move.b	#$77,(a3)+		;'w'
	move.b	#$09,(a3)+
	move.b	#$23,(a3)+		;'#'
	move.b	#$24,(a3)+		;'$'
	move.w	(a5)+,d1
	jsr	(wrtwhex)
	jsr	(L007d72)
	rts

L00a264:
	move.b	#$2e,(a3)+		;'.'
	move.b	#$6c,(a3)+		;'l'
	move.b	#$09,(a3)+
	move.b	#$23,(a3)+		;'#'
	move.b	#$24,(a3)+		;'$'
	move.l	(a5)+,d1
	jsr	(wrtlhex)
	jsr	(symlchk)
	rts

L00a288:
	clr.b	(a3)
	rts

L00a28c:
	moveq.l	#$72,d6			;'r'
	moveq.l	#$02,d5
	bsr	L007fe8
	move.w	d7,d1
	andi.w	#$003f,d1
	move.b	#$28,(a3)+		;'('
	move.b	#$24,(a3)+		;'$'
	jsr	(wrtshex)
	jsr	(L007d8a)
	move.b	#$29,(a3)+		;')'
	move.w	(a5)+,d1
	ext.l	d1
	move.b	#$09,(a3)+
	add.w	a5,d1
	subq.l	#2,d1
	move.b	#$24,(a3)+		;'$'
	jsr	(wrtlhex)
	jsr	(symlchk)
	rts

L00a2d0:
	moveq.l	#$72,d6			;'r'
	moveq.l	#$03,d5
	bsr	L007fe8
	move.w	d7,d1
	andi.w	#$003f,d1
	move.b	#$28,(a3)+		;'('
	move.b	#$24,(a3)+		;'$'
	jsr	(wrtshex)
	jsr	(L007d8a)
	move.b	#$29,(a3)+		;')'
	move.b	#$09,(a3)+
	move.l	(a5)+,d1
	add.w	a5,d1
	subq.l	#4,d1
	move.b	#$24,(a3)+		;'$'
	jsr	(wrtlhex)
	jsr	(symlchk)
	rts

L00a312:
	moveq.l	#$73,d6			;'s'
	clr.w	d5
	bsr	L007fe8
	bsr	L007eaa
	cmpi.w	#$0004,d2
	beq	L00a328
	bsr	L007f7e
L00a328:
	bsr	L0080b2
	rts

L00a32e:
	moveq.l	#$74,d6			;'t'
	clr.w	d5
	bsr	L007fe8
	bsr	L007eaa
	cmpi.w	#$0003,d2
	beq	L00a344
	bsr	L007f5e
L00a344:
	bsr	L0080b2
	rts

L00a34a:
	move.w	d7,d0
	andi.w	#$01c0,d0
	bne	L00a856
	move.w	(a5)+,d0
	move.w	d0,-(a7)
	andi.w	#$e000,d0
	beq	L00a3a0
	lsr.w	#8,d0
	lsr.w	#5,d0
	cmpi.w	#$0002,d0
	bcs	L00a434
	beq	L00a5b2
	cmpi.w	#$0004,d0
	bcs	L00a6a2
	beq	L00a7f4
	cmpi.w	#$0006,d0
	bcc	L00a0ac
	move.w	(a7)+,d0
	cmpi.w	#$a000,d0
	bne	L007e6c
	moveq.l	#$60,d6			;'`'
	clr.w	d5
	bsr	L007fe8
	bsr	L007fb4
	moveq.l	#$04,d4
	bsr	L0080b2
	rts

L00a3a0:
	move.w	(a7),d0
	andi.w	#$0100,d0
	beq	L00a3ac
	moveq.l	#$6c,d6			;'l'
	bra	L00a3ae

L00a3ac:
	moveq.l	#$64,d6			;'d'
L00a3ae:
	moveq.l	#$02,d5
	move.w	d5,d4
	bsr	L007fe8
	move.w	(a7),d0
	andi.w	#$e0ff,d0
	bne	L007e6c
	move.w	(a7),d0
	btst.l	#$09,d0
	bne	L00a3fc
	bsr	L007eaa
	bsr	L0080b2
	move.w	(a7)+,d0
	move.b	#$2c,(a3)+		;','
	btst.l	#$0a,d0
	beq	L00a3ec
	move.b	#$54,(a3)+		;'T'
	move.b	#$54,(a3)+		;'T'
	move.b	#$31,(a3)+		;'1'
	clr.b	(a3)
	rts

L00a3ec:
	move.b	#$54,(a3)+		;'T'
	move.b	#$54,(a3)+		;'T'
	move.b	#$30,(a3)+		;'0'
	clr.b	(a3)
	rts

L00a3fc:
	move.w	(a7)+,d0
	move.b	#$09,(a3)+
	btst.l	#$0a,d0
	beq	L00a41e
	move.b	#$54,(a3)+		;'T'
	move.b	#$54,(a3)+		;'T'
	move.b	#$31,(a3)+		;'1'
	bsr	L007fca
	bsr	L0080bc
	rts

L00a41e:
	move.b	#$54,(a3)+		;'T'
	move.b	#$54,(a3)+		;'T'
	move.b	#$30,(a3)+		;'0'
	bsr	L007fca
	bsr	L0080bc
	rts

L00a434:
	move.w	(a7),d0
	andi.w	#$1c00,d0
	lsr.w	#8,d0
	lsr.w	#2,d0
	beq	L00a4a6
	cmpi.w	#$0002,d0
	bcs	L00a538
	cmpi.w	#$0003,d0
	bhi	L00a538
	cmpi.w	#$0002,d0
	bne	L00a478
	cmpi.w	#$2800,(a7)+
	bne	L007e6c
	moveq.l	#$61,d6			;'a'
	clr.w	d5
	bsr	L007fe8
	move.b	#$09,(a3)+
	move.b	#$56,(a3)+		;'V'
	move.b	#$41,(a3)+		;'A'
	move.b	#$4c,(a3)+		;'L'
	bra	L00a49a

L00a478:
	moveq.l	#$61,d6			;'a'
	clr.w	d5
	bsr	L007fe8
	move.w	(a7),d0
	andi.w	#$fff8,d0
	cmpi.w	#$2c00,d0
	bne	L007e6c
	move.w	(a7)+,d3
	andi.w	#$0007,d3
	moveq.l	#$01,d2
	bsr	L0080b2
L00a49a:
	bsr	L007f7e
	moveq.l	#$03,d4
	bsr	L0080bc
	rts

L00a4a6:
	moveq.l	#$62,d6			;'b'
	clr.w	d5
	bsr	L007fe8
	move.w	(a7),d0
	btst.l	#$09,d0
	bne	L00a4bc
	move.b	#$77,(a3)+		;'w'
	bra	L00a4c0

L00a4bc:
	move.b	#$72,(a3)+		;'r'
L00a4c0:
	andi.w	#$fde0,d0
	cmpi.w	#$2000,d0
	bne	L007e6c
	move.b	#$09,(a3)+
	move.w	(a7)+,d1
	bsr	L00a4de
	bsr	L007f7e
	bsr	L0080bc
	rts

L00a4de:
	andi.w	#$001f,d1
	btst.l	#$04,d1
	bne	L00a506
	btst.l	#$03,d1
	bne	L00a51c
	cmpi.w	#$0001,d1
	bhi	L007e6c
	beq	L00a52a
	move.b	#$53,(a3)+		;'S'
	move.b	#$46,(a3)+		;'F'
	move.b	#$43,(a3)+		;'C'
	rts

L00a506:
	move.b	#$24,(a3)+		;'$'
	andi.w	#$000f,d1
	jsr	(wrtshex)
	jsr	(L007d8a)
	rts

L00a51c:
	move.w	d1,d3
	andi.w	#$0007,d3
	clr.w	d2
	bsr	L0080c6
	rts

L00a52a:
	move.b	#$44,(a3)+		;'D'
	move.b	#$46,(a3)+		;'F'
	move.b	#$43,(a3)+		;'C'
	rts

L00a538:
	move.w	d0,-(a7)
	moveq.l	#$63,d6			;'c'
	clr.w	d5
	bsr	L007fe8
	move.w	(a7)+,d0
	cmpi.w	#$0001,d0
	bne	L00a55c
	move.b	#$61,(a3)+		;'a'
	move.w	(a7)+,d0
	andi.w	#$01ff,d0
	bne	L007e6c
	clr.b	(a3)
	rts

L00a55c:
	btst.l	#$00,d0
	beq	L00a566
	move.b	#$73,(a3)+		;'s'
L00a566:
	move.b	#$09,(a3)+
	move.w	(a7),d1
	bsr	L00a4de
	move.w	(a7),d1
	move.b	#$2c,(a3)+		;','
	move.b	#$23,(a3)+		;'#'
	move.b	#$24,(a3)+		;'$'
	andi.w	#$01e0,d1
	lsr.w	#5,d1
	jsr	(wrtshex)
	jsr	(L007d8a)
	move.w	(a7)+,d0
	btst.l	#$0b,d0
	bne	L00a5a8
	move.l	a3,-(a7)
	bsr	L007eaa
	bsr	L0080bc
	movea.l	(a7)+,a3
	clr.b	(a3)
	rts

L00a5a8:
	bsr	L007f7e
	bsr	L0080bc
	rts

L00a5b2:
	move.w	(a7),d0
	andi.w	#$e1ff,d0
	cmpi.w	#$4000,d0
	beq	L00a5ca
	cmpi.w	#$4100,d0
	bne	L007e6c
	moveq.l	#$6c,d6			;'l'
	bra	L00a5cc

L00a5ca:
	moveq.l	#$64,d6			;'d'
L00a5cc:
	move.w	(a7),d0
	andi.w	#$1c00,d0
	lsr.w	#8,d0
	lsr.w	#2,d0
	bne	L00a5dc
	moveq.l	#$03,d5
	bra	L00a5f0

L00a5dc:
	cmpi.w	#$0004,d0
	bcc	L00a5e6
	moveq.l	#$04,d5
	bra	L00a5f0

L00a5e6:
	moveq.l	#$01,d5
	cmpi.w	#$0007,d0
	bne	L00a5f0
	moveq.l	#$02,d5
L00a5f0:
	move.w	d5,d4
	bsr	L007fe8
	move.w	(a7),d0
	andi.w	#$1c00,d0
	lsr.w	#8,d0
	lsr.w	#2,d0
	move.w	(a7)+,d1
	move.w	d0,-(a7)
	btst.l	#$09,d1
	bne	L00a690
	bsr	L007eaa
	bsr	L0080b2
	move.b	#$2c,(a3)+		;','
	move.w	(a7)+,d0
L00a61a:
	lea.l	(L00a62e),a0
	lsl.w	#2,d0
	movea.l	(a0,d0.w),a1
L00a626:
	move.b	(a1)+,(a3)+
	bne	L00a626
	subq.l	#1,a3
	rts

L00a62e:
	.dc.l	L00a65e
	.dc.l	L00a661
	.dc.l	L00a665
	.dc.l	L00a669
	.dc.l	L00a66d
	.dc.l	L00a671
	.dc.l	L00a675
	.dc.l	L00a679
	.dc.l	L00a67c
	.dc.l	L00a681
	.dc.l	L00a687
	.dc.l	L00a68b
L00a65e:
	.dc.b	$54,$43,$00
L00a661:
	.dc.b	'DRP',$00
L00a665:
	.dc.b	'SRP',$00
L00a669:
	.dc.b	'CRP',$00
L00a66d:
	.dc.b	'CAL',$00
L00a671:
	.dc.b	'VAL',$00
L00a675:
	.dc.b	'SCC',$00
L00a679:
	.dc.b	$41,$43,$00
L00a67c:
	.dc.b	'PCSR',$00
L00a681:
	.dc.b	'MMUSR',$00
L00a687:
	.dc.b	'TT0',$00
L00a68b:
	.dc.b	'TT1',$00,$00
L00a690:
	move.w	(a7)+,d0
	move.b	#$09,(a3)+
	bsr	L00a61a
	bsr	L007fca
	bsr	L0080bc
	rts

L00a6a2:
	move.w	(a7),d0
	andi.w	#$0100,d0
	beq	L00a6ae
	moveq.l	#$6c,d6			;'l'
	bra	L00a6b0

L00a6ae:
	moveq.l	#$64,d6			;'d'
L00a6b0:
	moveq.l	#$02,d5
	move.w	d5,d4
	bsr	L007fe8
	move.w	(a7),d0
	andi.w	#$1c00,d0
	lsr.w	#8,d0
	lsr.w	#2,d0
	cmpi.w	#$0001,d0
	bls	L00a75a
	cmpi.w	#$0004,d0
	bcs	L007e6c
	cmpi.w	#$0005,d0
	bhi	L007e6c
	move.w	(a7),d0
	andi.w	#$e0e3,d0
	cmpi.w	#$6000,d0
	bne	L007e6c
	move.w	(a7),d0
	btst.l	#$09,d0
	bne	L00a726
	bsr	L007eaa
	bsr	L0080b2
	move.w	(a7)+,d0
	move.b	#$2c,(a3)+		;','
	move.b	#$42,(a3)+		;'B'
	move.b	#$41,(a3)+		;'A'
	btst.l	#$0a,d0
	bne	L00a712
	move.b	#$44,(a3)+		;'D'
	bra	L00a716

L00a712:
	move.b	#$43,(a3)+		;'C'
L00a716:
	andi.w	#$001c,d0
	lsr.w	#2,d0
	addi.b	#$30,d0			;'0'
	move.b	d0,(a3)+
	clr.b	(a3)
	rts

L00a726:
	move.w	(a7)+,d0
	move.b	#$09,(a3)+
	move.b	#$42,(a3)+		;'B'
	move.b	#$41,(a3)+		;'A'
	btst.l	#$0a,d0
	bne	L00a740
	move.b	#$44,(a3)+		;'D'
	bra	L00a744

L00a740:
	move.b	#$43,(a3)+		;'C'
L00a744:
	andi.w	#$001c,d0
	lsr.w	#2,d0
	addi.b	#$30,d0			;'0'
	move.b	d0,(a3)+
	bsr	L007fca
	bsr	L0080bc
	rts

L00a75a:
	move.w	(a7),d0
	andi.w	#$e0ff,d0
	cmpi.w	#$6000,d0
	bne	L007e6c
	move.w	(a7),d0
	btst.l	#$09,d0
	bne	L00a7b0
	bsr	L007eaa
	bsr	L0080b2
	move.w	(a7)+,d0
	move.b	#$2c,(a3)+		;','
	btst.l	#$0a,d0
	beq	L00a798
	move.b	#$50,(a3)+		;'P'
	move.b	#$43,(a3)+		;'C'
	move.b	#$53,(a3)+		;'S'
	move.b	#$52,(a3)+		;'R'
	clr.b	(a3)
	rts

L00a798:
	move.b	#$4d,(a3)+		;'M'
	move.b	#$4d,(a3)+		;'M'
	move.b	#$55,(a3)+		;'U'
	move.b	#$53,(a3)+		;'S'
	move.b	#$52,(a3)+		;'R'
	clr.b	(a3)
	rts

L00a7b0:
	move.w	(a7)+,d0
	move.b	#$09,(a3)+
	btst.l	#$0a,d0
	beq	L00a7d6
	move.b	#$50,(a3)+		;'P'
	move.b	#$43,(a3)+		;'C'
	move.b	#$53,(a3)+		;'S'
	move.b	#$52,(a3)+		;'R'
	bsr	L007fca
	bsr	L0080bc
	rts

L00a7d6:
	move.b	#$4d,(a3)+		;'M'
	move.b	#$4d,(a3)+		;'M'
	move.b	#$55,(a3)+		;'U'
	move.b	#$53,(a3)+		;'S'
	move.b	#$52,(a3)+		;'R'
	bsr	L007fca
	bsr	L0080bc
	rts

L00a7f4:
	moveq.l	#$65,d6			;'e'
	clr.w	d5
	moveq.l	#$02,d4
	bsr	L007fe8
	move.w	(a7),d0
	btst.l	#$09,d0
	bne	L00a80c
	move.b	#$77,(a3)+		;'w'
	bra	L00a810

L00a80c:
	move.b	#$72,(a3)+		;'r'
L00a810:
	move.w	d0,d1
	move.b	#$09,(a3)+
	bsr	L00a4de
	bsr	L007f7e
	bsr	L0080bc
	move.w	(a7),d0
	move.b	#$2c,(a3)+		;','
	move.b	#$23,(a3)+		;'#'
	andi.w	#$1c00,d0
	lsr.w	#8,d0
	lsr.w	#2,d0
	addi.b	#$30,d0			;'0'
	move.b	d0,(a3)+
	move.w	(a7)+,d0
	btst.l	#$08,d0
	bne	L00a846
	clr.b	(a3)
	rts

L00a846:
	andi.w	#$00e0,d0
	lsr.w	#5,d0
	moveq.l	#$01,d2
	move.w	d0,d3
	bsr	L0080bc
	rts

L00a856:
	lsr.w	#6,d0
	cmpi.w	#$0002,d0
	bcc	L00a9b8
	move.w	d7,d0
	andi.w	#$0038,d0
	lsr.w	#3,d0
	cmpi.w	#$0001,d0
	beq	L00a966
	cmpi.w	#$0007,d0
	bne	L00a9a0
	move.w	d7,d0
	andi.w	#$0007,d0
	cmpi.w	#$0004,d0
	bhi	L007e6c
	cmpi.w	#$0001,d0
	bls	L00a9a0
	move.w	d0,-(a7)
	moveq.l	#$68,d6			;'h'
	clr.w	d5
	bsr	L007fe8
	move.w	(a5)+,d0
	cmpi.w	#$0040,d0		;'@'
	bcc	L007e6c
	bsr	L00a8da
	move.w	(a7)+,d0
	cmpi.w	#$0004,d0
	bne	L00a8b0
	clr.b	(a3)
	rts

L00a8b0:
	cmpi.w	#$0002,d0
	bne	L00a8c8
	move.b	#$2e,(a3)+		;'.'
	move.b	#$77,(a3)+		;'w'
	moveq.l	#$02,d4
	moveq.l	#$12,d2
	bsr	L0080b2
	rts

L00a8c8:
	move.b	#$2e,(a3)+		;'.'
	move.b	#$6c,(a3)+		;'l'
	moveq.l	#$03,d4
	moveq.l	#$12,d2
	bsr	L0080b2
	rts

L00a8da:
	cmpi.w	#$0010,d0
	bcc	L007e6c
	lea.l	(L00a8f6),a0
	lsl.w	#2,d0
	movea.l	(a0,d0.w),a1
L00a8ee:
	move.b	(a1)+,(a3)+
	bne	L00a8ee
	subq.l	#1,a3
	rts

L00a8f6:
	.dc.l	L00a936
	.dc.l	L00a939
	.dc.l	L00a93c
	.dc.l	L00a93f
	.dc.l	L00a942
	.dc.l	L00a945
	.dc.l	L00a948
	.dc.l	L00a94b
	.dc.l	L00a94e
	.dc.l	L00a951
	.dc.l	L00a954
	.dc.l	L00a957
	.dc.l	L00a95a
	.dc.l	L00a95d
	.dc.l	L00a960
	.dc.l	L00a963
L00a936:
	.dc.b	$62,$73,$00
L00a939:
	.dc.b	$62,$63,$00
L00a93c:
	.dc.b	$6c,$73,$00
L00a93f:
	.dc.b	$6c,$63,$00
L00a942:
	.dc.b	$73,$73,$00
L00a945:
	.dc.b	$73,$63,$00
L00a948:
	.dc.b	$61,$73,$00
L00a94b:
	.dc.b	$61,$63,$00
L00a94e:
	.dc.b	$77,$73,$00
L00a951:
	.dc.b	$77,$63,$00
L00a954:
	.dc.b	$69,$73,$00
L00a957:
	.dc.b	$69,$63,$00
L00a95a:
	.dc.b	$67,$73,$00
L00a95d:
	.dc.b	$67,$63,$00
L00a960:
	.dc.b	$63,$73,$00
L00a963:
	.dc.b	$63,$63,$00
L00a966:
	moveq.l	#$66,d6			;'f'
	clr.w	d5
	bsr	L007fe8
	move.w	(a5)+,d0
	bsr	L00a8da
	move.w	d7,d3
	clr.w	d2
	andi.w	#$0007,d3
	bsr	L0080b2
	move.w	(a5)+,d1
	ext.l	d1
	add.l	a5,d1
	subq.l	#4,d1
	move.b	#$2c,(a3)+		;','
	move.b	#$24,(a3)+		;'$'
	jsr	(wrtlhex)
	jsr	(symlchk)
	clr.b	(a3)
	rts

L00a9a0:
	moveq.l	#$67,d6			;'g'
	clr.w	d5
	bsr	L007fe8
	move.w	(a5)+,d0
	bsr	L00a8da
	bsr	L007fd8
	bsr	L0080b2
	rts

L00a9b8:
	cmpi.w	#$0004,d0
	bcc	L00aa06
	moveq.l	#$69,d6			;'i'
	clr.w	d5
	bsr	L007fe8
	move.w	d7,d0
	andi.w	#$003f,d0
	bsr	L00a8da
	btst.l	#$06,d7
	bne	L00a9f6
	move.w	(a5)+,d1
	ext.l	d1
	add.l	a5,d1
	subq.l	#2,d1
L00a9de:
	move.b	#$09,(a3)+
	move.b	#$24,(a3)+		;'$'
	jsr	(wrtlhex)
	jsr	(symlchk)
	clr.b	(a3)
	rts

L00a9f6:
	move.b	#$2e,(a3)+		;'.'
	move.b	#$6c,(a3)+		;'l'
	move.l	(a5)+,d1
	add.l	a5,d1
	subq.l	#4,d1
	bra	L00a9de

L00aa06:
	cmpi.w	#$0005,d0
	bcc	L00aa28
	moveq.l	#$6a,d6			;'j'
	clr.w	d5
	bsr	L007fe8
	bsr	L007eaa
	cmpi.w	#$0004,d2
	beq	L00aa22
	bsr	L007f5e
L00aa22:
	bsr	L0080b2
	rts

L00aa28:
	moveq.l	#$6b,d6			;'k'
	clr.w	d5
	bsr	L007fe8
	bsr	L007eaa
	cmpi.w	#$0003,d2
	beq	L00aa3e
	bsr	L007f5e
L00aa3e:
	bsr	L0080b2
	rts

L00aa44:
	move.b	#$09,(a3)+
	move.w	d0,-(a7)
	andi.w	#$1c00,d0
	lsr.w	#8,d0
	lsr.w	#2,d0
	bsr	L00aa66
	move.b	#$2c,(a3)+		;','
	move.w	(a7)+,d0
	andi.w	#$0380,d0
	lsr.w	#7,d0
	bsr	L00aa66
	clr.b	(a3)
	rts

L00aa66:
	andi.w	#$0007,d0
	addi.b	#$30,d0			;'0'
	move.b	#$46,(a3)+		;'F'
	move.b	#$50,(a3)+		;'P'
	move.b	d0,(a3)+
	clr.b	(a3)
	rts

L00aa7c:
	lea.l	(L00aa8e),a0
	clr.w	d5
	andi.w	#$0007,d0
	move.b	(a0,d0.w),d5
	rts

L00aa8e:
	btst.l	d1,d5
	movep.w	($0206,a0),d3
L00aa94:
	.dc.b	$01,$08
L00aa96:
	clr.w	d1
	btst.l	#$02,d0
	beq	L00aaac
	moveq.l	#$01,d1
	lea.l	(L00aaf1),a0
L00aaa6:
	move.b	(a0)+,(a3)+
	bne	L00aaa6
	subq.l	#1,a3
L00aaac:
	btst.l	#$01,d0
	beq	L00aac8
	tst.w	d1
	beq	L00aaba
	move.b	#$2f,(a3)+		;'/'
L00aaba:
	moveq.l	#$01,d1
	lea.l	(L00aaec),a0
L00aac2:
	move.b	(a0)+,(a3)+
	bne	L00aac2
	subq.l	#1,a3
L00aac8:
	btst.l	#$00,d0
	beq	L00aae2
	tst.w	d1
	beq	L00aad6
	move.b	#$2f,(a3)+		;'/'
L00aad6:
	lea.l	(L00aae6),a0
L00aadc:
	move.b	(a0)+,(a3)+
	bne	L00aadc
	subq.l	#1,a3
L00aae2:
	clr.b	(a3)
	rts

L00aae6:
	.dc.b	'FPIAR',$00
L00aaec:
	not.w	(a0)
	subq.w	#1,(a2)
L00aaf0:
	.dc.b	$00
L00aaf1:
	.dc.b	'FPCR',$00
L00aaf6:
	clr.w	d0
	move.b	#$30,d1			;'0'
L00aafc:
	lsl.b	#1,d6
	bcs	L00ab0c
L00ab00:
	addq.w	#1,d1
	cmpi.b	#$38,d1			;'8'
	bcs	L00aafc
	clr.b	(a3)
	rts

L00ab0c:
	tst.w	d0
	beq	L00ab14
	move.b	#$2f,(a3)+		;'/'
L00ab14:
	move.b	#$46,(a3)+		;'F'
	move.b	#$50,(a3)+		;'P'
	move.b	d1,(a3)+
	moveq.l	#$01,d0
	btst.l	#$07,d6
	bne	L00ab28
	bra	L00ab00

L00ab28:
	cmpi.b	#$37,d1			;'7'
	bcs	L00ab30
	bra	L00ab00

L00ab30:
	move.b	#$2d,(a3)+		;'-'
L00ab34:
	addq.w	#1,d1
	lsl.b	#1,d6
	btst.l	#$07,d6
	beq	L00ab52
	cmpi.b	#$38,d1			;'8'
	bcs	L00ab34
	move.b	#$46,(a3)+		;'F'
	move.b	#$50,(a3)+		;'P'
	move.b	#$37,(a3)+		;'7'
	bra	L00ab00

L00ab52:
	move.b	#$46,(a3)+		;'F'
	move.b	#$50,(a3)+		;'P'
	move.b	d1,(a3)+
	bra	L00ab00

L00ab5e:
	moveq.l	#$07,d1
L00ab60:
	roxl.b	#1,d6
	roxr.b	#1,d0
	dbra	d1,L00ab60
	move.w	d0,d6
	bra	L00aaf6

L00ab6c:
	cmpi.w	#$0020,d0		;' '
	bcc	L007e6c
	lea.l	(L00ab88),a0
	lsl.w	#2,d0
	movea.l	(a0,d0.w),a1
L00ab80:
	move.b	(a1)+,(a3)+
	bne	L00ab80
	subq.l	#1,a3
	rts

L00ab88:
	.dc.l	L00ac08
	.dc.l	L00ac0a
	.dc.l	L00ac0d
	.dc.l	L00ac11
	.dc.l	L00ac15
	.dc.l	L00ac19
	.dc.l	L00ac1d
	.dc.l	L00ac21
	.dc.l	L00ac24
	.dc.l	L00ac27
	.dc.l	L00ac2b
	.dc.l	L00ac2f
	.dc.l	L00ac33
	.dc.l	L00ac37
	.dc.l	L00ac3b
	.dc.l	L00ac3e
	.dc.l	L00ac40
	.dc.l	L00ac43
	.dc.l	L00ac47
	.dc.l	L00ac4a
	.dc.l	L00ac4d
	.dc.l	L00ac50
	.dc.l	L00ac53
	.dc.l	L00ac56
	.dc.l	L00ac5a
	.dc.l	L00ac5f
	.dc.l	L00ac63
	.dc.l	L00ac67
	.dc.l	L00ac6b
	.dc.l	L00ac6f
	.dc.l	L00ac73
	.dc.l	L00ac77
L00ac08:
	.dc.b	$66,$00
L00ac0a:
	.dc.b	$65,$71,$00
L00ac0d:
	.dc.b	'ogt',$00
L00ac11:
	.dc.b	'oge',$00
L00ac15:
	.dc.b	'olt',$00
L00ac19:
	.dc.b	'ole',$00
L00ac1d:
	.dc.b	'ogl',$00
L00ac21:
	.dc.b	$6f,$72,$00
L00ac24:
	.dc.b	$75,$6e,$00
L00ac27:
	.dc.b	'ueq',$00
L00ac2b:
	.dc.b	'ugt',$00
L00ac2f:
	.dc.b	'uge',$00
L00ac33:
	.dc.b	'ult',$00
L00ac37:
	.dc.b	'ule',$00
L00ac3b:
	.dc.b	$6e,$65,$00
L00ac3e:
	.dc.b	$74,$00
L00ac40:
	.dc.b	$73,$66,$00
L00ac43:
	.dc.b	'seq',$00
L00ac47:
	.dc.b	$67,$74,$00
L00ac4a:
	.dc.b	$67,$65,$00
L00ac4d:
	.dc.b	$6c,$74,$00
L00ac50:
	.dc.b	$6c,$65,$00
L00ac53:
	.dc.b	$67,$6c,$00
L00ac56:
	.dc.b	'gle',$00
L00ac5a:
	.dc.b	'ngle',$00
L00ac5f:
	.dc.b	'ngl',$00
L00ac63:
	.dc.b	'nle',$00
L00ac67:
	.dc.b	'nlt',$00
L00ac6b:
	.dc.b	'nge',$00
L00ac6f:
	.dc.b	'ngt',$00
L00ac73:
	.dc.b	'sne',$00
L00ac77:
	.dc.b	$73,$74,$00
L00ac7a:
	move.w	d7,d0
	andi.w	#$01c0,d0
	lsr.w	#6,d0
	bne	L00b08c
	move.w	(a5)+,d0
	move.w	d0,-(a7)
	andi.w	#$e000,d0
	cmpi.w	#$2000,d0
	beq	L00a0ac
	move.w	(a7),d6
	andi.w	#$007f,d6
	addi.w	#$0078,d6
	clr.w	d5
	cmpi.w	#$4000,d0
	beq	L00acae
	tst.w	d0
	bne	L00ae46
L00acae:
	btst.b	#$06,(a7)
	beq	L00adb4
	move.w	(a7),d0
	andi.w	#$fc00,d0
	cmpi.w	#$5c00,d0
	beq	L00ad18
	move.w	(a7),d0
	andi.w	#$0078,d0
	cmpi.w	#$0030,d0		;'0'
	bne	L00ad5c
	move.w	(a7),d0
	andi.w	#$1c00,d0
	lsr.w	#8,d0
	lsr.w	#2,d0
	bsr	L00aa7c
	bsr	L007fe8
	move.w	d5,d4
	bsr	L007f9e
	tst.w	d2
	bne	L00acf4
	cmpi.w	#$0005,d5
	bhi	L007e6c
L00acf4:
	bsr	L0080b2
	move.b	#$2c,(a3)+		;','
	move.w	(a7),d0
	andi.w	#$0007,d0
	bsr	L00aa66
	move.b	#$3a,(a3)+		;':'
	move.w	(a7)+,d0
	andi.w	#$0380,d0
	lsr.w	#7,d0
	bsr	L00aa66
	rts

L00ad18:
	move.w	d7,d0
	andi.w	#$01ff,d0
	bne	L007e6c
	move.w	#$00b8,d6
	moveq.l	#$07,d5
	bsr	L007fe8
	move.w	(a7),d1
	andi.w	#$007f,d1
	move.b	#$09,(a3)+
	move.b	#$23,(a3)+		;'#'
	move.b	#$24,(a3)+		;'$'
	jsr	(wrtshex)
	jsr	(L007d8a)
	move.b	#$2c,(a3)+		;','
	move.w	(a7)+,d0
	andi.w	#$0380,d0
	lsr.w	#7,d0
	bsr	L00aa66
	rts

L00ad5c:
	move.w	(a7),d0
	andi.w	#$007f,d0
	cmpi.w	#$0040,d0		;'@'
	bcc	L00a0ac
	move.w	(a7),d0
	andi.w	#$1c00,d0
	lsr.w	#8,d0
	lsr.w	#2,d0
	bsr	L00aa7c
	bsr	L007fe8
	move.w	d5,d4
	bsr	L007f9e
	tst.w	d2
	bne	L00ad8e
	cmpi.w	#$0005,d5
	bhi	L007e6c
L00ad8e:
	bsr	L0080b2
	move.w	(a7),d0
	andi.w	#$007f,d0
	cmpi.w	#$003a,d0		;':'
	bne	L00ada2
	addq.l	#2,a7
	rts

L00ada2:
	move.b	#$2c,(a3)+		;','
	move.w	(a7)+,d0
	andi.w	#$0380,d0
	lsr.w	#7,d0
	bsr	L00aa66
	rts

L00adb4:
	move.w	(a7),d0
	andi.w	#$0078,d0
	cmpi.w	#$0030,d0		;'0'
	bne	L00ae02
	move.w	d7,d0
	andi.w	#$01ff,d0
	bne	L007e6c
	moveq.l	#$07,d5
	bsr	L007fe8
	move.b	#$09,(a3)+
	move.w	(a7),d0
	andi.w	#$1c00,d0
	lsr.w	#8,d0
	lsr.w	#2,d0
	bsr	L00aa66
	move.b	#$2c,(a3)+		;','
	move.w	(a7),d0
	andi.w	#$0007,d0
	bsr	L00aa66
	move.b	#$3a,(a3)+		;':'
	move.w	(a7)+,d0
	andi.w	#$0380,d0
	lsr.w	#7,d0
	bsr	L00aa66
	rts

L00ae02:
	move.w	(a7),d0
	andi.w	#$007f,d0
	cmpi.w	#$0040,d0		;'@'
	bcc	L00a0ac
	move.w	d7,d0
	andi.w	#$01ff,d0
	bne	L007e6c
	moveq.l	#$07,d5
	bsr	L007fe8
	move.w	(a7),d0
	andi.w	#$007f,d0
	cmpi.w	#$003a,d0		;':'
	bne	L00ae3e
	move.w	(a7)+,d0
	andi.w	#$1c00,d0
	lsr.w	#8,d0
	lsr.w	#2,d0
	move.b	#$09,(a3)+
	bra	L00aa66

L00ae3e:
	move.w	(a7)+,d0
	bsr	L00aa44
	rts

L00ae46:
	cmpi.w	#$6000,d0
	bne	L00af00
	move.w	#$00b9,d6
	move.w	(a7),d0
	andi.w	#$1c00,d0
	lsr.w	#8,d0
	lsr.w	#2,d0
	bsr	L00aa7c
	bsr	L007fe8
	move.b	#$09,(a3)+
	move.w	(a7),d0
	andi.w	#$0380,d0
	lsr.w	#7,d0
	bsr	L00aa66
	move.w	d5,d4
	bsr	L007fd8
	tst.w	d2
	bne	L00ae8c
	cmpi.w	#$0003,d5
	bls	L00ae8c
	cmpi.w	#$0005,d5
	bne	L007e6c
L00ae8c:
	bsr	L0080bc
	cmpi.w	#$0008,d5
	beq	L00ae9c
	addq.l	#2,a7
	clr.b	(a3)
	rts

L00ae9c:
	move.b	#$7b,(a3)+		;'{'
	move.w	(a7)+,d0
	btst.l	#$0c,d0
	bne	L00aee2
	move.b	#$23,(a3)+		;'#'
	andi.w	#$007f,d0
	btst.l	#$06,d0
	beq	L00aeba
	ori.w	#$ff80,d0
L00aeba:
	ext.l	d0
	movem.l	d0-d7,-(a7)
	move.l	d0,d3
	jsr	(itoa)
	movem.l	(a7)+,d0-d7
	cmpi.b	#$20,(a0)		;' '
	bne	L00aed4
	addq.l	#1,a0
L00aed4:
	move.b	(a0)+,(a3)+
	bne	L00aed4
	subq.l	#1,a3
	move.b	#$7d,(a3)+		;'}'
	clr.b	(a3)
	rts

L00aee2:
	clr.w	d2
	move.w	d0,d3
	andi.w	#$000f,d0
	bne	L007e6c
	andi.w	#$0070,d3
	lsr.w	#4,d3
	bsr	L0080c6
	move.b	#$7d,(a3)+		;'}'
	clr.b	(a3)
	rts

L00af00:
	cmpi.w	#$a000,d0
	bhi	L00afe2
	moveq.l	#$03,d5
	move.w	d5,d4
	move.w	(a7),d0
	andi.w	#$03ff,d0
	bne	L007e6c
	move.w	(a7),d0
	andi.w	#$1c00,d0
	lsr.w	#8,d0
	lsr.w	#2,d0
	beq	L007e6c
	cmpi.w	#$0001,d0
	beq	L00af86
	cmpi.w	#$0002,d0
	beq	L00af86
	cmpi.w	#$0004,d0
	beq	L00af86
	move.w	#$00ba,d6
	move.w	d0,-(a7)
	bsr	L007fe8
	move.w	($0002,a7),d0
	btst.l	#$0d,d0
	bne	L00af68
	bsr	L007eaa
	cmpi.w	#$0001,d2
	bls	L007e6c
	bsr	L0080b2
	move.b	#$2c,(a3)+		;','
	move.w	(a7)+,d0
	bsr	L00aa96
	addq.l	#2,a7
	rts

L00af68:
	move.w	(a7)+,d0
	move.b	#$09,(a3)+
	bsr	L00aa96
	bsr	L007fca
	cmpi.w	#$0001,d2
	bls	L007e6c
	bsr	L0080bc
	addq.l	#2,a7
	rts

L00af86:
	move.w	#$00b9,d6
	move.w	d0,-(a7)
	bsr	L007fe8
	move.w	($0002,a7),d0
	btst.l	#$0d,d0
	bne	L00afbe
	bsr	L007eaa
	cmpi.w	#$0001,d2
	bne	L00afac
	cmpi.w	#$0001,(a7)
	bne	L007e6c
L00afac:
	bsr	L0080b2
	move.b	#$2c,(a3)+		;','
	move.w	(a7)+,d0
	bsr	L00aa96
	addq.l	#2,a7
	rts

L00afbe:
	move.b	#$09,(a3)+
	move.w	(a7),d0
	bsr	L00aa96
	bsr	L007fca
	cmpi.w	#$0001,d2
	bne	L00afda
	cmpi.w	#$0001,(a7)
	bne	L007e6c
L00afda:
	bsr	L0080bc
	addq.l	#4,a7
	rts

L00afe2:
	moveq.l	#$07,d5
	move.w	d5,d4
	move.w	#$00ba,d6
	bsr	L007fe8
	move.w	(a7),d0
	btst.l	#$0d,d0
	bne	L00b032
	btst.l	#$0c,d0
	beq	L007e6c
	bsr	L007eaa
	cmpi.w	#$0003,d2
	beq	L00b00c
	bsr	L007f5e
L00b00c:
	bsr	L0080b2
	move.w	(a7)+,d6
	btst.l	#$0b,d6
	bne	L00b022
	move.b	#$2c,(a3)+		;','
	bsr	L00aaf6
	rts

L00b022:
	andi.w	#$0070,d6
	move.w	d6,d3
	clr.w	d2
	lsr.w	#4,d3
	bsr	L0080bc
	rts

L00b032:
	btst.l	#$0b,d0
	beq	L00b048
	clr.w	d2
	move.w	d0,d3
	andi.w	#$0070,d3
	lsr.w	#4,d3
	bsr	L0080b2
	bra	L00b05e

L00b048:
	move.w	d0,d6
	move.b	#$09,(a3)+
	btst.l	#$0c,d0
	bne	L00b05a
	bsr	L00ab5e
	bra	L00b05e

L00b05a:
	bsr	L00aaf6
L00b05e:
	bsr	L007eaa
	cmpi.w	#$0004,d2
	bne	L00b078
	move.w	(a7)+,d0
	btst.l	#$0c,d0
	bne	L007e6c
	bsr	L0080bc
	rts

L00b078:
	move.w	(a7)+,d0
	btst.l	#$0c,d0
	beq	L007e6c
	bsr	L007f5e
	bsr	L0080bc
	rts

L00b08c:
	cmpi.w	#$0001,d0
	bne	L00b150
	move.w	(a5)+,d0
	move.w	d0,-(a7)
	move.w	d7,d0
	andi.w	#$003f,d0
	cmpi.w	#$003d,d0		;'='
	bcc	L00a0ac
	cmpi.w	#$003a,d0		;':'
	bcc	L00b0d0
	andi.w	#$0038,d0
	cmpi.w	#$0008,d0
	beq	L00b114
	move.w	#$00bc,d6
	clr.w	d5
	bsr	L007fe8
	move.w	(a7)+,d0
	bsr	L00ab6c
	bsr	L007fd8
	bsr	L0080b2
	rts

L00b0d0:
	move.w	#$00bd,d6
	clr.w	d5
	bsr	L007fe8
	move.w	(a7)+,d0
	bsr	L00ab6c
	move.w	d7,d0
	andi.w	#$0007,d0
	cmpi.w	#$0003,d0
	bcs	L00b0f0
	beq	L00b102
	rts

L00b0f0:
	move.b	#$2e,(a3)+		;'.'
	move.b	#$77,(a3)+		;'w'
	moveq.l	#$12,d2
	moveq.l	#$02,d4
	bsr	L0080b2
	rts

L00b102:
	move.b	#$2e,(a3)+		;'.'
	move.b	#$6c,(a3)+		;'l'
	moveq.l	#$12,d2
	moveq.l	#$03,d4
	bsr	L0080b2
	rts

L00b114:
	move.w	#$00bb,d6
	clr.w	d5
	bsr	L007fe8
	move.w	(a7)+,d0
	bsr	L00ab6c
	clr.w	d2
	move.w	d7,d3
	andi.w	#$0007,d3
	bsr	L0080b2
	move.w	(a5)+,d1
	ext.l	d1
	add.l	a5,d1
	subq.l	#4,d1
	move.b	#$2c,(a3)+		;','
	move.b	#$24,(a3)+		;'$'
	jsr	(wrtlhex)
	jsr	(symlchk)
	clr.b	(a3)
	rts

L00b150:
	cmpi.w	#$0002,d0
	bne	L00b1be
	move.w	d7,d0
	andi.w	#$003f,d0
	bne	L00b172
	tst.w	(a5)
	bne	L00b172
	addq.l	#2,a5
	move.w	#$00be,d6
	clr.w	d5
	bsr	L007fe8
	clr.b	(a3)
	rts

L00b172:
	move.w	d7,d0
	andi.w	#$003f,d0
	cmpi.w	#$000f,d0
	bne	L00b18a
	move.w	#$00c2,d6
	clr.w	d5
	bsr	L007fe8
	bra	L00b19e

L00b18a:
	move.w	#$00bf,d6
	clr.w	d5
	bsr	L007fe8
	move.w	d7,d0
	andi.w	#$003f,d0
	bsr	L00ab6c
L00b19e:
	move.w	(a5)+,d1
	ext.l	d1
	add.l	a5,d1
	subq.l	#2,d1
	move.b	#$09,(a3)+
	move.b	#$24,(a3)+		;'$'
	jsr	(wrtlhex)
	jsr	(symlchk)
	clr.b	(a3)
	rts

L00b1be:
	cmpi.w	#$0003,d0
	bne	L00b216
	move.w	d7,d0
	andi.w	#$003f,d0
	cmpi.w	#$000f,d0
	bne	L00b1dc
	move.w	#$00c2,d6
	clr.w	d5
	bsr	L007fe8
	bra	L00b1f0

L00b1dc:
	move.w	#$00bf,d6
	clr.w	d5
	bsr	L007fe8
	move.w	d7,d0
	andi.w	#$003f,d0
	bsr	L00ab6c
L00b1f0:
	move.b	#$2e,(a3)+		;'.'
	move.b	#$6c,(a3)+		;'l'
	move.l	(a5)+,d1
	add.l	a5,d1
	subq.l	#4,d1
	move.b	#$09,(a3)+
	move.b	#$24,(a3)+		;'$'
	jsr	(wrtlhex)
	jsr	(symlchk)
	clr.b	(a3)
	rts

L00b216:
	cmpi.w	#$0004,d0
	bne	L00b23a
	move.w	#$00c0,d6
	clr.w	d5
	bsr	L007fe8
	bsr	L007eaa
	cmpi.w	#$0004,d2
	beq	L00b234
	bsr	L007f7e
L00b234:
	bsr	L0080b2
	rts

L00b23a:
	cmpi.w	#$0005,d0
	bne	L00a0ac
	move.w	#$00c1,d6
	clr.w	d5
	bsr	L007fe8
	bsr	L007eaa
	cmpi.w	#$0003,d2
	beq	L00b25a
	bsr	L007f5e
L00b25a:
	bsr	L0080b2
	rts

L00b260:
	movem.l	d0/d2-d7/a0-a2/a4,-(a7)
	move.l	d1,-(a7)
	move.w	(a5),d1
	ext.w	d1
	ext.l	d1
	add.l	a5,d1
	subq.l	#2,d1
	move.b	#$24,(a3)+		;'$'
	jsr	(wrtlhex)
	jsr	(symlchk)
	addq.w	#2,a5
	move.l	(a7)+,d1
	movem.l	(a7)+,d0/d2-d7/a0-a2/a4
	rts

L00b28a:
	move.l	d1,-(a7)
	ext.w	d1
	ext.l	d1
	add.l	a5,d1
	subq.l	#2,d1
	move.b	#$24,(a3)+		;'$'
	jsr	(wrtlhex)
	jsr	(symlchk)
	move.l	(a7)+,d1
	rts

L00b2a8:
	movem.l	d0/d2-d7/a0-a2/a4,-(a7)
	move.w	(a5),d1
	ext.l	d1
	add.l	a5,d1
	subq.l	#2,d1
	move.b	#$24,(a3)+		;'$'
	jsr	(wrtlhex)
	jsr	(symlchk)
	addq.w	#2,a5
	movem.l	(a7)+,d0/d2-d7/a0-a2/a4
	rts

L00b2cc:
	movem.l	d0/d2-d7/a0-a2/a4,-(a7)
	move.w	(a5),d1
	ext.l	d1
	add.l	a5,d1
	move.b	#$24,(a3)+		;'$'
	jsr	(wrtlhex)
	jsr	(symlchk)
	addq.w	#2,a5
	movem.l	(a7)+,d0/d2-d7/a0-a2/a4
	rts

L00b2ee:
	movem.l	d0/d2-d7/a0-a2/a4,-(a7)
	move.l	(a5),d1
	add.l	a5,d1
	subq.l	#2,d1
	move.b	#$24,(a3)+		;'$'
	jsr	(wrtlhex)
	jsr	(symlchk)
	addq.w	#4,a5
	movem.l	(a7)+,d0/d2-d7/a0-a2/a4
	rts

L00b310:
	movem.l	d0/d2-d7/a0-a2/a4,-(a7)
	move.w	(a5),d1
	andi.w	#$00ff,d1
	tst.b	d1
	bpl	L00b324
	neg.b	d1
	move.b	#$2d,(a3)+		;'-'
L00b324:
	move.b	#$24,(a3)+		;'$'
	jsr	(wrtshex)
	move.w	(a5)+,d1
	movem.l	(a7)+,d0/d2-d7/a0-a2/a4
	rts

L00b336:
	move.w	d1,-(a7)
	tst.b	d1
	bpl	L00b342
	neg.b	d1
	move.b	#$2d,(a3)+		;'-'
L00b342:
	move.b	#$24,(a3)+		;'$'
	jsr	(wrtshex)
	move.w	(a7)+,d1
	rts

L00b350:
	movem.l	d0/d2-d7/a0-a2/a4,-(a7)
	move.w	(a5),d1
	bpl	L00b35e
	neg.w	d1
	move.b	#$2d,(a3)+		;'-'
L00b35e:
	move.b	#$24,(a3)+		;'$'
	jsr	(wrtwhex)
	move.w	(a5)+,d1
	jsr	(L007d72)
	movem.l	(a7)+,d0/d2-d7/a0-a2/a4
	rts

L00b376:
	movem.l	d0/d2-d7/a0-a2/a4,-(a7)
	move.l	(a5),d1
	bpl	L00b384
	neg.l	d1
	move.b	#$2d,(a3)+		;'-'
L00b384:
	move.b	#$24,(a3)+		;'$'
	jsr	(wrtlhex)
	move.l	(a5)+,d1
	jsr	(L007d72)
	movem.l	(a7)+,d0/d2-d7/a0-a2/a4
	rts

dump::
	move.w	#$0001,($0312,a6)
	clr.w	($06e2,a6)
L00b3a6:
	move.b	(a5)+,d0
	bsr	toupper
	cmpi.b	#$50,d0			;'P'
	bne	L00b3ba
	move.w	#$ffff,($06e2,a6)
	bra	L00b3a6

L00b3ba:
	cmpi.b	#$53,d0			;'S'
	bne	L00b3c6
	clr.w	($0312,a6)
	bra	L00b3dc

L00b3c6:
	cmpi.b	#$57,d0			;'W'
	beq	L00b3dc
	cmpi.b	#$4c,d0			;'L'
	bne	L00b3da
	move.w	#$0002,($0312,a6)
	bra	L00b3dc

L00b3da:
	move.b	-(a5),d0
L00b3dc:
	move.l	($002a,a6),($0002,a6)
	jsr	(getarg)
	tst.w	($0000.w,a6)
	bne	L00b40e
	tst.w	($06e2,a6)
	bne	L00b408
L00b3f4:
	bsr	chkdel
	move.l	($002a,a6),d0
	addi.l	#$0000007f,d0
	move.l	d0,($0006,a6)
	bra	L00b41a

L00b408:
	jmp	(badpar)

L00b40e:
	move.l	($0002,a6),($002a,a6)
	subq.w	#1,($0000.w,a6)
	beq	L00b3f4
L00b41a:
	move.l	($002a,a6),d0
	cmp.l	($0006,a6),d0
	bhi	L00b408
	move.l	d0,($002a,a6)
	move.l	d0,($0002,a6)
	movea.l	($0002,a6),a2
L00b430:
	cmpa.l	($0006,a6),a2
	bhi	L00b4cc
	move.l	a2,($002a,a6)
	move.l	a2,d1
	bsr	putlhex
	bsr	putspc
	moveq.l	#$10,d5
	tst.w	($044a,a6)
	beq	L00b450
	moveq.l	#$08,d5
L00b450:
	clr.w	d3
	move.w	($0312,a6),d4
	cmp.w	#$0002,d4
	bne	L00b45e
	moveq.l	#$03,d4
L00b45e:
	move.w	d5,($000a,a6)
L00b462:
	move.w	($000a,a6),d0
	and.w	d4,d0
	bne	L00b46e
	bsr	putspc
L00b46e:
	move.b	(a2)+,d1
	bsr	putshex
	cmpa.l	($0006,a6),a2
	bhi	L00b480
	subq.w	#1,($000a,a6)
	bne	L00b462
L00b480:
	bsr	L00b4e0
	move.w	d5,($000a,a6)
	movea.l	($0002,a6),a0
	move.l	a2,($0002,a6)
	movea.l	a0,a2
L00b490:
	move.b	(a2),d0
	bsr	L00b502
	move.b	(a2)+,d0
	bsr	L00b52e
	bcc	L00b4a4
	move.b	(a2)+,d0
	bsr	L00b518
	subq.w	#1,($000a,a6)
L00b4a4:
	cmpa.l	($0006,a6),a2
	bhi	L00b4bc
	subq.w	#1,($000a,a6)
	bgt	L00b490
	movea.l	a0,a2
	adda.l	d5,a2
L00b4b4:
	bsr	newline
	bra	L00b430

L00b4bc:
	movea.l	a0,a2
	adda.l	d5,a2
	cmpa.l	($0006,a6),a2
	bls	L00b4b4
	movea.l	($0006,a6),a2
	addq.l	#1,a2
L00b4cc:
	move.l	a2,($002a,a6)
	tst.w	($000a,a6)
	bmi	L00b4de
	bsr	newline
	clr.w	($06e2,a6)
L00b4de:
	rts

L00b4e0:
	tst.w	($044a,a6)
	bne	L00b4f4
	bsr	putspc
	cmpi.w	#$003c,($0022,a6)	;'<'
	bcs	L00b4e0
	rts

L00b4f4:
	bsr	putspc
	cmpi.w	#$0023,($0022,a6)	;'#'
	bcs	L00b4f4
	rts

L00b502:
	cmp.b	#$f6,d0
	bcc	L00b50e
	cmp.b	#$20,d0			;' '
	bcc	L00b512
L00b50e:
	move.b	#$2e,d0			;'.'
L00b512:
	bsr	putch
	rts

L00b518:
	cmp.b	#$20,d0			;' '
	bcs	L00b524
	cmp.b	#$fc,d0
	bls	L00b528
L00b524:
	move.b	#$2e,d0			;'.'
L00b528:
	bsr	putch
	rts

L00b52e:
	cmp.b	#$80,d0
	bcs	L00b54c
	cmp.b	#$f6,d0
	bcc	L00b54c
	cmp.b	#$e0,d0
	bcc	L00b546
	cmp.b	#$a0,d0
	bcc	L00b54c
L00b546:
	ori.b	#$01,ccr
	rts

L00b54c:
	andi.b	#$fe,ccr
	rts

L00b552:
	jmp	(comerr)

go::
	rts

gotosub::
	.dc.b	$b0,$bc,$ff,$ff,$ff,$ff,$67,$04,$2d,$40,$00,$96,$2d,$41,$01,$20
	.dc.b	$60,$00,$00,$8a
jumpcom::
	.dc.b	$0c,$15,$00,$3d,$66,$3e,$52,$8d,$4e,$b9
	.dc.l	getarg
	.dc.b	$4a,$15,$66,$d2,$4a,$6e,$00,$00,$67,$cc,$0c,$6e,$00,$03,$00,$00
	.dc.b	$64,$c4,$20,$2e,$00,$02,$6b,$10,$2d,$40,$00,$96,$3d,$7c,$00,$01
	.dc.b	$06,$e0,$08,$ae,$00,$00,$00,$99,$0c,$6e,$00,$02,$00,$00,$66,$40
	.dc.b	$20,$2e,$00,$06,$60,$2c,$4e,$b9
	.dc.l	getarg
	.dc.b	$4e,$b9
	.dc.l	skpblk
	.dc.b	$4a,$00,$67,$06,$b0,$3c,$00,$3a,$66,$8a,$4a,$6e,$00,$00,$67,$1e
	.dc.b	$0c,$6e,$00,$01,$00,$00,$66,$ce,$20,$2e,$00,$02,$6b,$00,$ff,$76
	.dc.b	$08,$00,$00,$00,$66,$00,$ff,$6e,$2d,$40,$01,$20,$60,$06,$70,$ff
	.dc.b	$2d,$40,$01,$20,$61,$00,$0c,$5a,$2d,$4f,$01,$6a,$40,$ee,$00,$42
	.dc.b	$2d,$4d,$00,$3e,$2e,$6e,$01,$6a,$61,$00,$02,$74,$4a,$2e,$00,$52
	.dc.b	$66,$28,$4a,$2e,$00,$a6,$67,$22,$72,$09,$20,$2e,$00,$96,$41,$ee
	.dc.b	$00,$a8,$4a,$68,$00,$0a,$6f,$04,$b0,$90,$67,$0a,$41,$e8,$00,$0c
	.dc.b	$51,$c9,$ff,$f0,$60,$04,$53,$68,$00,$06,$1d,$6e,$00,$a6,$00,$4e
	.dc.b	$61,$00,$05,$1a,$2d,$4f,$01,$6a,$2e,$6e,$00,$92,$2d,$79,$00,$00
	.dc.b	$00,$24,$01,$76,$2f,$39
	.dc.l	usrpdb
	.dc.b	$ff,$80,$58,$8f,$2a,$6e,$00,$9a,$4e,$65,$4c,$ee,$3f,$ff,$00,$56
	.dc.b	$23,$c8
	.dc.l	L0129da
	.dc.b	$4a,$79
	.dc.l	L0129d6
L00b674:
	.dc.b	'g^ |',$00,$00
L00b67a:
	.dc.b	$08,$08,$4e,$7b,$80,$02,$20,$79
	.dc.l	L0129e6
	.dc.b	$4e,$7b,$80,$00,$20,$79
	.dc.l	L0129ea
	.dc.b	$4e,$7b,$80,$01,$20,$79
	.dc.l	L0129ee
	.dc.b	$4e,$7b,$80,$02,$20,$79
	.dc.l	L0129f6
	.dc.b	$4e,$7b,$88,$01,$20,$79
	.dc.l	L0129f2
	.dc.b	$4e,$7b,$88,$02,$20,$79
	.dc.l	L0129de
	.dc.b	$4e,$7b,$88,$03,$4a,$79
	.dc.l	L0129d8
	.dc.b	$67,$10,$f2,$39,$d0,$ff
	.dc.l	L012bf6
	.dc.b	$f2,$39,$9c,$00
	.dc.l	L0129fa
	.dc.b	$20,$79
	.dc.l	L0129da
	.dc.b	$4a,$79
	.dc.l	L0129d6
	.dc.b	$67,$02,$42,$67
L00b6e4:
	move.l	($0096,a6),-(a7)
	move.w	($00a0,a6),-(a7)
	bclr.b	#$07,(a7)
	bclr.b	#$06,(a7)
	movem.l	($008e,a6),a6
	move.w	#$ffff,(breakf)
	rte

trace::
	clr.w	($0314,a6)
	bra	L00b710

untrace::
	move.w	#$0001,($0314,a6)
L00b710:
	tst.w	($07d0,a6)
	beq	L00b728
	cmpi.b	#$4e,(a5)		;'N'
	beq	L00b722
	cmpi.b	#$6e,(a5)		;'n'
	bne	L00b728
L00b722:
	addq.l	#1,a5
	st.b	($0b80,a6)
L00b728:
	cmpi.b	#$3d,(a5)		;'='
	bne	L00b75a
	addq.l	#1,a5
	move.l	($0096,a6),($0002,a6)
	jsr	(getarg)
	tst.w	($0000.w,a6)
	beq	L00b766
	move.l	($0002,a6),($0096,a6)
	cmpi.w	#$0001,($0000.w,a6)
	beq	L00b766
	move.l	($0006,a6),d0
	move.l	d0,($004a,a6)
	bra	L00b794

L00b75a:
	jsr	(getarg)
	move.w	($0000.w,a6),d0
	bne	L00b782
L00b766:
	jsr	(skpblk)
	tst.b	d0
	beq	L00b778
	cmpi.b	#$3a,d0			;':'
	bne	L00b552
L00b778:
	move.l	#$00000001,($004a,a6)
	bra	L00b794

L00b782:
	move.l	($0002,a6),d1
	cmp.w	#$0001,d0
	beq	trc3
	move.l	($0006,a6),d1
trc3::
	move.l	d1,($004a,a6)
L00b794:
	move.l	a7,($016a,a6)
	move.w	sr,($0042,a6)
	move.l	($00000024).l,($0176,a6)
	move.w	(trpdef),d0
	andi.l	#$0000000f,d0
	asl.l	#2,d0
	movea.l	d0,a1
	move.l	($0080,a1),($0046,a6)
L00b7ba:
	move.w	#$fffe,(breakf)
	bsr	L00b8c4
	tst.b	($0052,a6)
	bne	L00b7d2
	move.w	($0016,a6),ccr
	bcc	L00b830
L00b7d2:
	bsr	mtblchk
	bcs	L00b7f8
	tst.w	($0b8c,a6)
	beq	L00b7e4
	jsr	(newline)
L00b7e4:
	subq.l	#1,($004a,a6)
	beq	L00b84c
	tst.w	($0314,a6)
	bne	L00b7ba
	jsr	(allregi)
	bra	L00b7ba

L00b7f8:
	move.l	d0,-(a7)
	lea.l	(L00c2a8),a0
	jsr	(print)
	move.l	(a7),d1
	jsr	(putlhex)
	move.l	(a7)+,d0
	bsr	valsch
	tst.l	d0
	bmi	L00b830
	movea.l	d0,a0
	jsr	(puttab)
	move.b	#$2e,d0			;'.'
	jsr	(putch)
	jsr	(print)
L00b830:
	lea.l	(L00c274),a0
	jsr	(print)
	move.l	($0096,a6),d1
	jsr	(putlhex)
	jsr	(newline)
L00b84c:
	move.l	($0176,a6),($00000024).l
	move.w	(trpdef),d0
	andi.l	#$0000000f,d0
	asl.l	#2,d0
	movea.l	d0,a1
	move.l	($0046,a6),($0080,a1)
	move.l	($0096,a6),($0032,a6)
	jsr	(allregi)
	jmp	(main)

onetrc::
	.dc.b	$2d,$79,$00,$00,$00,$24,$01,$76,$30,$39
	.dc.l	trpdef
	.dc.b	$02,$80,$00,$00,$00,$0f,$e5,$80,$22,$40,$2d,$69,$00,$80,$00,$46
	.dc.b	$33,$fc,$ff,$ff
	.dc.l	breakf
	.dc.b	$61,$20,$23,$ee,$01,$76,$00,$00,$00,$24,$30,$39
	.dc.l	trpdef
	.dc.b	$02,$80,$00,$00,$00,$0f,$e5,$80,$22,$40,$23,$6e,$00,$46,$00,$80
	.dc.b	$4e,$75
L00b8c4:
	.dc.b	$61,$00,$02,$76,$30,$39
	.dc.l	trpdef
	.dc.b	$20,$6e,$00,$96,$b0,$50,$66,$06,$61,$cc,$60,$00,$04,$9a,$30,$10
	.dc.b	$c0,$7c,$ff,$f0,$b0,$7c,$4e,$40,$66,$10,$61,$0e,$20,$6e,$00,$92
	.dc.b	$08,$90,$00,$07,$08,$90,$00,$06,$4e,$75
L00b8f8:
	.dc.b	$2d,$4f,$01,$6a,$40,$ee,$00,$42,$23,$fc
	.dc.l	single
	.dc.b	$00,$00,$00,$24,$2f,$39
	.dc.l	usrpdb
	.dc.b	$ff,$80,$58,$8f,$2a,$6e,$00,$9a,$4e,$65,$4c,$ee,$3f,$ff,$00,$56
	.dc.b	$23,$c8
	.dc.l	L0129da
	.dc.b	$4a,$79
	.dc.l	L0129d6
L00b92c:
	.dc.b	'g^ |',$00,$00
L00b932:
	.dc.b	$08,$08,$4e,$7b,$80,$02,$20,$79
	.dc.l	L0129e6
	.dc.b	$4e,$7b,$80,$00,$20,$79
	.dc.l	L0129ea
	.dc.b	$4e,$7b,$80,$01,$20,$79
	.dc.l	L0129ee
	.dc.b	$4e,$7b,$80,$02,$20,$79
	.dc.l	L0129f6
	.dc.b	$4e,$7b,$88,$01,$20,$79
	.dc.l	L0129f2
	.dc.b	$4e,$7b,$88,$02,$20,$79
	.dc.l	L0129de
	.dc.b	$4e,$7b,$88,$03,$4a,$79
	.dc.l	L0129d8
	.dc.b	$67,$10,$f2,$39,$d0,$ff
	.dc.l	L012bf6
	.dc.b	$f2,$39,$9c,$00
	.dc.l	L0129fa
	.dc.b	$20,$79
	.dc.l	L0129da
	.dc.b	$2e,$6e,$00,$92,$2d,$6e,$00,$96,$01,$7a,$4a,$79
	.dc.l	L0129d6
	.dc.b	$67,$02,$42,$67
L00b9a6:
	move.l	($0096,a6),-(a7)
	move.w	($00a0,a6),-(a7)
	bclr.b	#$06,(a7)
	bset.b	#$07,(a7)
	tst.w	($0b80,a6)
	beq	L00b9c4
	bset.b	#$06,(a7)
	bclr.b	#$07,(a7)
L00b9c4:
	movem.l	($008e,a6),a6
	rte

single::
	.dc.b	$0c,$af
	.dc.l	startdb
	.dc.b	$00,$02,$65,$14,$0c,$af
	.dc.l	dbend
	.dc.b	$00,$02,$64,$0a,$08,$97,$00,$07,$08,$97,$00,$06,$4e,$73,$4a,$79
	.dc.l	nmiflg
	.dc.b	$66,$00,$05,$10,$42,$79
	.dc.l	breakf
	.dc.b	$2f,$0e,$4d,$f9
	.dc.l	work
	.dc.b	$48,$ee,$3f,$ff,$00,$56,$23,$c8
	.dc.l	L0129da
	.dc.b	$4a,$79
	.dc.l	L0129d6
	.dc.b	$67,$5e,$4e,$7a,$80,$00,$23,$c8
	.dc.l	L0129e6
	.dc.b	$4e,$7a,$80,$01,$23,$c8
	.dc.l	L0129ea
	.dc.b	$4e,$7a,$80,$02,$23,$c8
	.dc.l	L0129ee
	.dc.b	$4e,$7a,$88,$01,$23,$c8
	.dc.l	L0129f6
	.dc.b	$4e,$7a,$88,$02,$23,$c8
	.dc.l	L0129f2
	.dc.b	$4e,$7a,$88,$03,$23,$c8
	.dc.l	L0129de
	.dc.b	$20,$7c,$00,$00,$08,$08,$4e,$7b,$80,$02,$4a,$79
	.dc.l	L0129d8
	.dc.b	$67,$10,$f2,$39,$bc,$00
	.dc.l	L0129fa
	.dc.b	$f2,$39,$f0,$ff
	.dc.l	L012bf6
	.dc.b	$20,$79
	.dc.l	L0129da
	.dc.b	$2d,$5f,$00,$8e,$3d,$5f,$00,$a0,$2d,$5f,$00,$96,$4a,$79
	.dc.l	L0129d6
	.dc.b	$67,$02,$5c,$8f,$2d,$4f,$00,$92,$4e,$6d,$2d,$4d,$00,$9a,$2f,$39
	.dc.l	monpdb
	.dc.b	$ff,$80,$58,$8f,$23,$c0
	.dc.l	usrpdb
	.dc.b	$46,$ee,$00,$42,$2e,$6e,$01,$6a,$20,$2e,$00,$96,$42,$6e,$0b,$8c
	.dc.b	$61,$00,$01,$6c,$57,$ee,$00,$52,$40,$ee,$00,$16,$67,$54,$4a,$68
	.dc.b	$00,$04,$67,$4e,$28,$48,$54,$8c,$22,$00,$41,$f9
	.dc.l	L00bb1e
	.dc.b	$4e,$b9
	.dc.l	print
	.dc.b	$4e,$b9
	.dc.l	putlhex
	.dc.b	$4e,$b9
	.dc.l	puttab
	.dc.b	$10,$3c,$00,$28,$4e,$b9
	.dc.l	putch
	.dc.b	$32,$1c,$61,$00,$a7,$d4,$10,$3c,$00,$3b,$4e,$b9
	.dc.l	putch
	.dc.b	$32,$1c,$61,$00,$a7,$c4,$10,$3c,$00,$29,$4e,$b9
	.dc.l	putch
	.dc.b	$3d,$7c,$00,$01,$0b,$8c,$4e,$75
L00bb1e:
	.dc.b	$0d,$0a
	.dc.b	'encounter break pointer at ',$00
L00bb3c:
	movem.l	d0/a0-a1,-(a7)
	moveq.l	#$62,d0			;'b'
	lea.l	($0182,a6),a0
	movea.l	a0,a1
	addq.l	#4,a1
L00bb4a:
	move.l	(a1)+,(a0)+
	dbra	d0,L00bb4a
	move.l	($0096,a6),(a0)
	movem.l	(a7)+,d0/a0-a1
	rts

L00bb5a:
	move.w	(trpdef),d0
	andi.l	#$0000000f,d0
	asl.l	#2,d0
	movea.l	d0,a1
	move.l	($0080,a1),($0046,a6)
	move.l	#tproc,($0080,a1)
	move.l	($0120,a6),d0
	bmi	L00bb96
	cmp.l	#$00fc0000,d0
	bcc	L00bb96
	movea.l	d0,a0
	move.w	(a0),($0124,a6)
	clr.l	($0126,a6)
	move.w	(trpdef),(a0)
L00bb96:
	tst.b	($00a6,a6)
	bne	L00bb9e
	rts

L00bb9e:
	moveq.l	#$09,d1
	lea.l	($00a8,a6),a0
L00bba4:
	tst.w	($000a,a0)
	ble	L00bbc4
	movea.l	(a0),a1
	cmpa.l	#$00fc0000,a1
	bcc	L00bbc4
	move.w	(a1),($0004,a0)
	tst.w	($0008,a0)
	beq	L00bbc4
	move.w	(trpdef),(a1)
L00bbc4:
	lea.l	($000c,a0),a0
	dbra	d1,L00bba4
	rts

resbp::
	move.w	(trpdef),d0
	andi.l	#$0000000f,d0
	asl.l	#2,d0
	movea.l	d0,a1
	move.l	($0046,a6),($0080,a1)
	tst.b	($00a6,a6)
	beq	L00bc0c
	moveq.l	#$09,d1
	lea.l	($00a8,a6),a1
L00bbf0:
	tst.w	($000a,a1)
	ble	L00bc04
	movea.l	(a1),a0
	cmpa.l	#$00fc0000,a0
	bcc	L00bc04
	move.w	($0004,a1),(a0)
L00bc04:
	lea.l	($000c,a1),a1
	dbra	d1,L00bbf0
L00bc0c:
	move.l	($0120,a6),d0
	bmi	L00bc26
	cmp.l	#$00fc0000,d0
	bcc	L00bc26
	movea.l	d0,a0
	move.w	($0124,a6),(a0)
	moveq.l	#$ff,d0
	move.l	d0,($0120,a6)
L00bc26:
	rts

L00bc28:
	clr.w	($0b92,a6)
	tst.b	($00a6,a6)
	beq	L00bc60
	moveq.l	#$09,d1
	lea.l	($00a8,a6),a0
L00bc38:
	tst.w	($000a,a0)
	ble	L00bc42
	cmp.l	(a0),d0
	beq	L00bc4c
L00bc42:
	lea.l	($000c,a0),a0
	dbra	d1,L00bc38
	bra	L00bc60

L00bc4c:
	addq.w	#1,($0006,a0)
	move.w	($0006,a0),d1
	cmp.w	($0008,a0),d1
	addq.l	#4,a0
	andi.b	#$7b,ccr
	rts

L00bc60:
	move.w	#$0001,($0b92,a6)
	lea.l	($0120,a6),a0
	cmp.l	(a0)+,d0
	eori.b	#$04,ccr
	rts

L00bc72:
	tst.b	($00a6,a6)
	bne	L00bc7a
	rts

L00bc7a:
	lea.l	($00a8,a6),a0
	moveq.l	#$09,d1
L00bc80:
	clr.w	($0006,a0)
	lea.l	($000c,a0),a0
	dbra	d1,L00bc80
	rts

tproc::
	.dc.b	$0c,$af
	.dc.l	startdb
	.dc.b	$00,$02,$65,$14,$0c,$af
	.dc.l	dbend
	.dc.b	$00,$02,$64,$0a,$08,$97,$00,$07,$08,$97,$00,$06,$4e,$73,$42,$79
	.dc.l	breakf
	.dc.b	$55,$af,$00,$02,$2f,$0e,$4d,$f9
	.dc.l	work
	.dc.b	$2d,$5f,$00,$8e,$48,$ee,$3f,$ff,$00,$56,$23,$c8
	.dc.l	L0129da
	.dc.b	$4a,$79
	.dc.l	L0129d6
	.dc.b	$67,$5e,$4e,$7a,$80,$00,$23,$c8
	.dc.l	L0129e6
	.dc.b	$4e,$7a,$80,$01,$23,$c8
	.dc.l	L0129ea
	.dc.b	$4e,$7a,$80,$02,$23,$c8
	.dc.l	L0129ee
	.dc.b	$4e,$7a,$88,$01,$23,$c8
	.dc.l	L0129f6
	.dc.b	$4e,$7a,$88,$02,$23,$c8
	.dc.l	L0129f2
	.dc.b	$4e,$7a,$88,$03,$23,$c8
	.dc.l	L0129de
	.dc.b	$20,$7c,$00,$00,$08,$08,$4e,$7b,$80,$02,$4a,$79
	.dc.l	L0129d8
	.dc.b	$67,$10,$f2,$39,$bc,$00
	.dc.l	L0129fa
	.dc.b	$f2,$39,$f0,$ff
	.dc.l	L012bf6
	.dc.b	$20,$79
	.dc.l	L0129da
	.dc.b	$3d,$5f,$00,$a0,$22,$1f,$4a,$79
	.dc.l	L0129d6
	.dc.b	$67,$02,$54,$8f,$2d,$41,$00,$96,$2d,$4f,$00,$92,$4e,$6d,$2d,$4d
	.dc.b	$00,$9a,$2f,$39
	.dc.l	monpdb
	.dc.b	$ff,$80,$58,$8f,$23,$c0
	.dc.l	usrpdb
	.dc.b	$20,$01,$46,$fc,$20,$00,$61,$00,$fe,$b8,$66,$46,$46,$ee,$00,$42
	.dc.b	$2e,$6e,$01,$6a,$61,$00,$fe,$50,$41,$f9
	.dc.l	L00c292
	.dc.b	$4e,$b9
	.dc.l	print
	.dc.b	$22,$2e,$00,$96,$2d,$41,$00,$32,$4e,$b9
	.dc.l	putlhex
	.dc.b	$4e,$b9
	.dc.l	newline
	.dc.b	$54,$ae,$00,$96,$2d,$6e,$00,$96,$00,$32,$4e,$b9
	.dc.l	allregi
	.dc.b	$2a,$6e,$00,$3e,$4e,$f9
	.dc.l	main
	.dc.b	$64,$00,$02,$fa,$61,$00,$fd,$7c,$22,$40,$32,$90,$2d,$79,$00,$00
	.dc.b	$00,$24,$01,$76,$23,$fc
	.dc.l	L00be8e
	.dc.b	$00,$00,$00,$24,$2f,$39
	.dc.l	usrpdb
	.dc.b	$ff,$80,$58,$8f,$4a,$79
	.dc.l	L0129d6
	.dc.b	$67,$02,$42,$67,$2f,$2e,$00,$96,$3f,$2e,$00,$a0,$4c,$ee,$7f,$ff
	.dc.b	$00,$56,$23,$c8
	.dc.l	L0129da
	.dc.b	$4a,$79
	.dc.l	L0129d6
L00be06:
	.dc.b	'g^ |',$00,$00
L00be0c:
	.dc.b	$08,$08,$4e,$7b,$80,$02,$20,$79
	.dc.l	L0129e6
	.dc.b	$4e,$7b,$80,$00,$20,$79
	.dc.l	L0129ea
	.dc.b	$4e,$7b,$80,$01,$20,$79
	.dc.l	L0129ee
	.dc.b	$4e,$7b,$80,$02,$20,$79
	.dc.l	L0129f6
	.dc.b	$4e,$7b,$88,$01,$20,$79
	.dc.l	L0129f2
	.dc.b	$4e,$7b,$88,$02,$20,$79
	.dc.l	L0129de
	.dc.b	$4e,$7b,$88,$03,$4a,$79
	.dc.l	L0129d8
	.dc.b	$67,$10,$f2,$39,$d0,$ff
	.dc.l	L012bf6
	.dc.b	$f2,$39,$9c,$00
	.dc.l	L0129fa
	.dc.b	$20,$79
	.dc.l	L0129da
	.dc.b	$08,$97
L00be6e:
	.dc.b	$00,$06,$08,$d7,$00,$07,$4a,$79
	.dc.l	L012d86
	.dc.b	$67,$08,$08,$d7,$00,$06,$08,$97,$00,$07
L00be84:
	move.w	#$ffff,(breakf)
	rte

L00be8e:
	clr.w	(breakf)
	movem.l	a0/a6,-(a7)
	lea.l	(work),a6
	move.l	($0176,a6),($00000024).l
	movea.l	($0096,a6),a0
	move.w	(trpdef),(a0)
	movem.l	(a7)+,a0/a6
	bclr.b	#$07,(a7)
	bclr.b	#$06,(a7)
	move.w	#$ffff,(breakf)
	rte

ibreak::
	.dc.b	$13,$fc,$00,$0c,$00,$e8,$e0,$07,$0c,$af
	.dc.l	startdb
	.dc.b	$00,$02,$65,$14,$0c,$af
	.dc.l	dbend
	.dc.b	$00,$02,$64,$0a,$08,$97,$00,$07,$08,$97,$00,$06,$4e,$73,$0c,$79
	.dc.b	$ff,$fe
	.dc.l	breakf
	.dc.b	$66,$00,$00,$c8,$33,$fc,$ff,$ff
	.dc.l	nmiflg
L00bf00:
	.dc.b	'NsBy'
L00bf04:
	.dc.l	nmiflg
	.dc.b	$42,$79
	.dc.l	breakf
	.dc.b	$2f,$0e,$4d,$f9
	.dc.l	work
	.dc.b	$2d,$5f,$00,$8e,$48,$ee,$3f,$ff,$00,$56,$23,$c8
	.dc.l	L0129da
	.dc.b	$4a,$79
	.dc.l	L0129d6
	.dc.b	$67,$5e,$4e,$7a,$80,$00,$23,$c8
	.dc.l	L0129e6
	.dc.b	$4e,$7a,$80,$01,$23,$c8
	.dc.l	L0129ea
	.dc.b	$4e,$7a,$80,$02,$23,$c8
	.dc.l	L0129ee
	.dc.b	$4e,$7a,$88,$01,$23,$c8
	.dc.l	L0129f6
	.dc.b	$4e,$7a,$88,$02,$23,$c8
	.dc.l	L0129f2
	.dc.b	$4e,$7a,$88,$03,$23,$c8
	.dc.l	L0129de
	.dc.b	$20,$7c,$00,$00,$08,$08,$4e,$7b,$80,$02,$4a,$79
	.dc.l	L0129d8
	.dc.b	$67,$10,$f2,$39,$bc,$00
	.dc.l	L0129fa
	.dc.b	$f2,$39,$f0,$ff
	.dc.l	L012bf6
	.dc.b	$20,$79
	.dc.l	L0129da
	.dc.b	$3d,$5f,$00,$a0,$2d,$5f,$00,$96,$4a,$79
	.dc.l	L0129d6
	.dc.b	$67,$02,$5c,$8f
L00bfa4:
	move.l	a7,($0092,a6)
	move.l	usp,a5
	move.l	a5,($009a,a6)
	move.l	($0176,a6),($00000024).l
	andi.w	#$f8ff,sr
	bra	L00c076

L00bfbe:
	.dc.b	$42,$79
	.dc.l	nmiflg
	.dc.b	$42,$79
	.dc.l	breakf
	.dc.b	$2f,$0e,$4d,$f9
	.dc.l	work
	.dc.b	$2d,$5f,$00,$8e,$48,$ee,$3f,$ff,$00,$56,$23,$c8
	.dc.l	L0129da
	.dc.b	$4a,$79
	.dc.l	L0129d6
	.dc.b	$67,$5e,$4e,$7a,$80,$00,$23,$c8
	.dc.l	L0129e6
	.dc.b	$4e,$7a,$80,$01,$23,$c8
	.dc.l	L0129ea
	.dc.b	$4e,$7a,$80,$02,$23,$c8
	.dc.l	L0129ee
	.dc.b	$4e,$7a,$88,$01,$23,$c8
	.dc.l	L0129f6
	.dc.b	$4e,$7a,$88,$02,$23,$c8
	.dc.l	L0129f2
	.dc.b	$4e,$7a,$88,$03,$23,$c8
	.dc.l	L0129de
	.dc.b	$20,$7c,$00,$00,$08,$08,$4e,$7b,$80,$02,$4a,$79
	.dc.l	L0129d8
	.dc.b	$67,$10,$f2,$39,$bc,$00
	.dc.l	L0129fa
	.dc.b	$f2,$39,$f0,$ff
	.dc.l	L012bf6
	.dc.b	$20,$79
	.dc.l	L0129da
	.dc.b	$3d,$5f,$00,$a0,$2d,$5f,$00,$96,$4a,$79
	.dc.l	L0129d6
	.dc.b	$67,$02,$54,$8f
L00c060:
	move.l	a7,($0092,a6)
	move.l	usp,a5
	move.l	a5,($009a,a6)
	move.l	($0176,a6),($00000024).l
	andi.w	#$f8ff,sr
L00c076:
	move.l	(monpdb),-(a7)
	DOS	_SETPDB
	addq.l	#4,a7
	move.l	d0,(usrpdb)
	bsr	resbp
	lea.l	(L00c281),a0
	jsr	(print)
	move.l	($0096,a6),d1
	move.l	d1,($0032,a6)
	jsr	(putlhex)
	jsr	(newline)
	jsr	(allregi)
	jmp	(main)

L00c0b6:
	move.w	($0042,a6),sr
	movea.l	($016a,a6),a7
	bsr	resbp
	tst.w	($0b98,a6)
	bne	L00c0f4
	lea.l	(L00c274),a0
	jsr	(print)
	move.l	($0096,a6),d1
	move.l	d1,($0032,a6)
	jsr	(putlhex)
	jsr	(newline)
	jsr	(allregi)
	movea.l	($003e,a6),a5
	rts

L00c0f4:
	movea.l	($003e,a6),a5
	rts

step::
	.dc.b	$61,$56,$2d,$40,$0b,$94,$4e,$b9
	.dc.l	L00c16e
	.dc.b	$4a,$40,$66,$18,$2d,$6e,$00,$96,$00,$32,$4e,$b9
	.dc.l	allregi
	.dc.b	$53,$ae,$0b,$94,$66,$e4,$4e,$f9
	.dc.l	main
	.dc.b	$41,$f9
	.dc.l	L00c274
	.dc.b	$4e,$b9
	.dc.l	print
	.dc.b	$22,$2e,$00,$96,$2d,$41,$00,$32,$4e,$b9
	.dc.l	putlhex
	.dc.b	$4e,$b9
	.dc.l	newline
	.dc.b	$4e,$b9
	.dc.l	allregi
	.dc.b	$2a,$6e,$00,$3e,$4e,$f9
	.dc.l	main
	.dc.b	$4e,$b9
	.dc.l	getarg
	.dc.b	$30,$2e,$00,$00,$66,$0a,$4e,$b9
	.dc.l	skpblk
	.dc.b	$70,$01,$4e,$75
L00c168:
	move.l	($0002,a6),d0
	rts

L00c16e:
	.dc.b	$72,$01,$2a,$6e,$00,$96,$20,$0d,$c0,$bc,$00,$ff,$ff,$ff,$b0,$bc
	.dc.b	$00,$fe,$00,$00,$64,$68,$30,$15,$c0,$7c,$ff,$f0,$b0,$7c,$4e,$40
	.dc.b	$67,$1a,$c0,$7c,$ff,$c0,$b0,$7c,$4e,$80,$67,$10,$b0,$7c,$06,$c0
	.dc.b	$67,$0a,$c0,$7c,$ff,$00,$b0,$7c,$61,$00,$66,$42,$48,$e7,$60,$10
	.dc.b	$61,$00,$bc,$48,$4e,$b9
	.dc.l	newline
	.dc.b	$4c,$df,$08,$06,$2d,$4d,$01,$20,$2d,$4d,$0b,$8e,$3d,$7c,$00,$01
	.dc.b	$0b,$98,$61,$00,$f4,$2a,$42,$6e,$0b,$98,$20,$2e,$00,$96,$b0,$ae
	.dc.b	$0b,$8e,$66,$0a,$4a,$6e,$0b,$92,$67,$04,$42,$40,$4e,$75
L00c1e6:
	move.w	#$0001,d0
	rts

L00c1ec:
	move.l	a7,($016a,a6)
	move.w	sr,($0042,a6)
	move.l	($00000024).l,($0176,a6)
	move.w	(trpdef),d0
	andi.l	#$0000000f,d0
	asl.l	#2,d0
	movea.l	d0,a1
	move.l	($0080,a1),($0046,a6)
	move.w	#$fffe,(breakf)
	bsr	L00b8c4
	tst.b	($0052,a6)
	bne	L00c22c
	move.w	($0016,a6),ccr
	bcc	L00b830
L00c22c:
	move.l	($0176,a6),($00000024).l
	move.w	(trpdef),d0
	andi.l	#$0000000f,d0
	asl.l	#2,d0
	movea.l	d0,a1
	move.l	($0046,a6),($0080,a1)
	clr.w	d0
	rts

L00c24e:
	tst.w	($06e0,a6)
	bne	L00c272
	lea.l	(L00c2bc),a0
	jsr	(print)
	jsr	(newline)
	lea.l	(work),a6
	jmp	(main)

L00c272:
	rts

L00c274:
	.dc.b	$0d,$0a
	.dc.b	$09,'break at ',$00
L00c281:
	.dc.b	$0d,$0a
	.dc.b	$09,'NMI break at ',$00
L00c292:
	.dc.b	$0d,$0a
	.dc.b	$09,'encounter trap at ',$00
L00c2a8:
	.dc.b	$0d,$0a
	.dc.b	$09,'memory check at ',$00
L00c2bc:
	.dc.b	'no process',$00,$00
getexp2::
	move.w	#$0001,($0316,a6)
	jsr	(L00c2e2)
	movem.l	d6,-(a7)
	movem.l	(a7)+,d1
	rts

getexp::
	clr.w	($0316,a6)
L00c2e2:
	jsr	(L00c342)
	bcs	L00c340
	cmpi.b	#$5e,d0			;'^'
	beq	L00c2fc
	cmpi.b	#$7c,d0			;'|'
	beq	L00c2fc
	cmpi.b	#$26,d0			;'&'
	bne	L00c33e
L00c2fc:
	move.w	d0,-(a7)
L00c2fe:
	move.l	d6,-(a7)
	addq.l	#1,a5
	jsr	(L00c342)
	bcs	L00c802
	move.l	(a7)+,d5
	move.w	(a7)+,d0
	cmpi.b	#$5e,d0			;'^'
	bne	L00c31a
	eor.l	d5,d6
	bra	L00c326

L00c31a:
	cmpi.b	#$26,d0			;'&'
	bne	L00c324
	and.l	d5,d6
	bra	L00c326

L00c324:
	or.l	d5,d6
L00c326:
	move.b	(a5),d0
	cmpi.b	#$5e,d0			;'^'
	beq	L00c33a
	cmpi.b	#$26,d0			;'&'
	beq	L00c33a
	cmpi.b	#$7c,d0			;'|'
	bne	L00c33e
L00c33a:
	move.w	d0,-(a7)
	bra	L00c2fe

L00c33e:
	tst.w	d0
L00c340:
	rts

L00c342:
	jsr	(term)
	bcs	L00c35a
L00c34a:
	move.b	(a5)+,d0
	cmpi.b	#$2b,d0			;'+'
	beq	L00c35c
	cmpi.b	#$2d,d0			;'-'
	beq	L00c372
	move.b	-(a5),d0
L00c35a:
	rts

L00c35c:
	jsr	(skpblk)
	move.l	d6,-(a7)
	jsr	(term)
	bcs	L00c802
	add.l	(a7)+,d6
	bra	L00c34a

L00c372:
	jsr	(skpblk)
	move.l	d6,-(a7)
	jsr	(term)
	bcs	L00c802
	move.l	(a7)+,d5
	sub.l	d6,d5
	move.l	d5,d6
	bra	L00c34a

term::
	jsr	(L00c40c)
	bcs	L00c3aa
L00c394:
	move.b	(a5)+,d0
	cmpi.b	#$2a,d0			;'*'
	beq	L00c3ac
	cmpi.b	#$2f,d0			;'/'
	beq	L00c3cc
	cmpi.b	#$25,d0			;'%'
	beq	L00c3ec
	move.b	-(a5),d0
L00c3aa:
	rts

L00c3ac:
	jsr	(skpblk)
	move.l	d6,-(a7)
	jsr	(L00c40c)
	bcs	L00c802
	move.l	(a7)+,d3
	move.l	d6,d1
	jsr	(L00c6e0)
	move.l	d3,d6
	bra	L00c394

L00c3cc:
	jsr	(skpblk)
	move.l	d6,-(a7)
	jsr	(L00c40c)
	bcs	L00c802
	move.l	(a7)+,d3
	move.l	d6,d1
	jsr	(L00c72e)
	move.l	d3,d6
	bra	L00c394

L00c3ec:
	jsr	(skpblk)
	move.l	d6,-(a7)
	jsr	(L00c40c)
	bcs	L00c802
	move.l	(a7)+,d3
	move.l	d6,d1
	jsr	(L00c72e)
	move.l	d5,d6
	bra	L00c394

L00c40c:
	jsr	(skpblk)
	beq	L00c454
	cmpi.b	#$3a,d0			;':'
	beq	L00c454
	cmpi.b	#$2d,d0			;'-'
	beq	L00c43c
	cmpi.b	#$21,d0			;'!'
	bne	factor
	addq.l	#1,a5
	jsr	(skpblk)
	jsr	(L00c40c)
	bcs	L00c802
	not.l	d6
	rts

L00c43c:
	addq.l	#1,a5
	jsr	(skpblk)
	jsr	(L00c40c)
	bcs	L00c802
	neg.l	d6
	tst.w	d0
	rts

L00c454:
	ori.b	#$01,ccr
	rts

factor::
	cmpi.b	#$5b,d0			;'['
	beq	L00c8d2
	cmpi.b	#$28,d0			;'('
	beq	L00c60c
	cmpi.b	#$22,d0			;'"'
	beq	L00c650
	cmpi.b	#$27,d0			;'''
	beq	L00c650
	tst.b	d0
	beq	L00c4dc
	cmpi.b	#$5f,d0			;'_'
	beq	L00c6b2
	cmpi.b	#$24,d0			;'$'
	beq	L00c4a8
	tst.w	($0316,a6)
	beq	fact5
	jsr	(isnum)
	bcc	L00c672
	cmpi.b	#$2e,d0			;'.'
	beq	L00c4e2
	cmpi.b	#$24,d0			;'$'
	bne	L00c4dc
L00c4a8:
	addq.l	#1,a5
	move.b	(a5),d0
	jsr	(ishex)
	bcs	L00c802
	jsr	(gethex)
	rts

fact5::
	cmpi.b	#$2e,d0			;'.'
	beq	L00c4e2
	cmpi.b	#$5c,d0			;'\'
	beq	L00c670
	jsr	(ishex)
	bcs	L00c4dc
	jsr	(gethex)
	rts

L00c4dc:
	ori.b	#$01,ccr
	rts

L00c4e2:
	movem.l	a0-a1,-(a7)
	movea.l	a5,a0
	addq.l	#1,a0
	lea.l	(tmpbuf),a1
	move.l	a1,-(a7)
	jsr	(gettkn)
	movea.l	a0,a1
	movea.l	(a7)+,a0
	jsr	(L00c51a)
	bcs	L00c510
	jsr	(strsch)
	tst.l	d1
	bmi	L00c7ce
L00c510:
	movea.l	a1,a5
	move.l	d0,d6
	movem.l	(a7)+,a0-a1
	rts

L00c51a:
	jsr	(L00c52e)
	beq	L00c528
	andi.b	#$fe,ccr
	rts

L00c528:
	ori.b	#$01,ccr
	rts

L00c52e:
	movem.l	d1-d7/a0-a6,-(a7)
	lea.l	(dx0_sym),a1
	pea.l	(a0)
L00c53a:
	tst.b	(a1)
	beq	L00c55a
	move.b	(a0)+,d0
	jsr	(toupper)
	cmp.b	(a1)+,d0
	beq	L00c53a
L00c54a:
	tst.b	(a1)+
	bne	L00c54a
	addq.l	#1,a1
	tst.b	(a1)
	beq	L00c602
	movea.l	(a7),a0
	bra	L00c53a

L00c55a:
	moveq.l	#$00,d0
	move.b	($0001,a1),d0
	bmi	L00c602
	addq.l	#4,a7
	lea.l	(reglist),a1
	mulu.w	#$000e,d0
	adda.l	d0,a1
	move.w	($000c,a1),d1
	move.l	(a6,d1.w),d1
	move.l	($0008,a1),d0
	and.w	#$00ff,d0
	add.w	d0,d0
	move.w	(L00c58c,pc,d0.w),d0
	jmp	(L00c58c,pc,d0.w)

L00c58c:
	.dc.w	L00c5b2-L00c58c
	.dc.w	L00c5b2-L00c58c
	.dc.w	L00c5bc-L00c58c
	.dc.w	L00c604-L00c58c
	.dc.w	L00c5b2-L00c58c
	.dc.w	L00c5b2-L00c58c
	.dc.w	L00c5b2-L00c58c
	.dc.w	L00c5b2-L00c58c
	.dc.w	L00c5ea-L00c58c
	.dc.w	L00c5f2-L00c58c
	.dc.w	L00c5f2-L00c58c
	.dc.w	L00c5b2-L00c58c
	.dc.w	L00c5b2-L00c58c
	.dc.w	L00c5b2-L00c58c
	.dc.w	L00c5b2-L00c58c
	.dc.w	L00c5b2-L00c58c
	.dc.w	L00c5b2-L00c58c
	.dc.w	L00c5fa-L00c58c
	.dc.w	L00c5b2-L00c58c
L00c5b2:
	move.l	d1,d0
	moveq.l	#$00,d1
	movem.l	(a7)+,d1-d7/a0-a6
	rts

L00c5bc:
	btst.b	#$05,($00a0,a6)
	beq	L00c5de
	tst.w	($07d0,a6)
	beq	L00c5e4
	btst.b	#$04,($00a0,a6)
	beq	L00c5d8
	move.l	($07d8,a6),d1
	bra	L00c5b2

L00c5d8:
	move.l	($0092,a6),d1
	bra	L00c5b2

L00c5de:
	move.l	($009a,a6),d1
	bra	L00c5b2

L00c5e4:
	move.l	($0092,a6),d1
	bra	L00c5b2

L00c5ea:
	andi.l	#$0000ffff,d1
	bra	L00c5b2

L00c5f2:
	andi.l	#$00000007,d1
	bra	L00c5b2

L00c5fa:
	andi.l	#$000000ff,d1
	bra	L00c5b2

L00c602:
	addq.l	#4,a7
L00c604:
	moveq.l	#$ff,d1
	movem.l	(a7)+,d1-d7/a0-a6
	rts

L00c60c:
	tst.w	($0316,a6)
	beq	L00c636
	move.l	a5,-(a7)
	addq.l	#1,a5
	jsr	(L00c2e2)
	bcs	L00c62e
	move.l	(a5)+,d0
	cmpi.b	#$29,d0			;')'
	bne	L00c802
	addq.l	#4,a7
	bra	skpblk

L00c62e:
	movea.l	(a7)+,a5
	ori.b	#$01,ccr
	rts

L00c636:
	addq.l	#1,a5
	jsr	(L00c2e2)
	bcs	L00c64e
	move.b	(a5)+,d0
	cmpi.b	#$29,d0			;')'
	beq	skpblk
	bra	L00c802

L00c64e:
	rts

L00c650:
	andi.w	#$00ff,d0
	move.w	d0,-(a7)
	addq.l	#1,a5
	clr.l	d6
L00c65a:
	move.b	(a5)+,d0
	beq	L00c802
	cmp.w	(a7),d0
	beq	L00c66a
	lsl.l	#8,d6
	move.b	d0,d6
	bra	L00c65a

L00c66a:
	addq.l	#2,a7
	bra	skpblk

L00c670:
	addq.l	#1,a5
L00c672:
	jsr	(L00c8a4)
	bcs	L00c802
	move.l	d1,d6
	rts

gethex::
	clr.l	d6
L00c682:
	move.b	(a5)+,d0
	jsr	(ishex)
	bcs	L00c6ae
	cmpi.b	#$41,d0			;'A'
	bcs	L00c6a4
	cmpi.b	#$61,d0			;'a'
	bcs	L00c69e
	sub.b	#$57,d0			;'W'
	bra	L00c6a8

L00c69e:
	subi.b	#$37,d0			;'7'
	bra	L00c6a8

L00c6a4:
	subi.b	#$30,d0			;'0'
L00c6a8:
	lsl.l	#4,d6
	or.b	d0,d6
	bra	L00c682

L00c6ae:
	move.b	-(a5),d0
	rts

L00c6b2:
	clr.l	d6
	addq.l	#1,a5
	move.b	(a5),d0
	cmpi.b	#$30,d0			;'0'
	bcs	L00c802
	cmpi.b	#$31,d0			;'1'
	bls	L00c6ca
	bra	L00c802

L00c6ca:
	move.b	(a5)+,d0
	cmpi.b	#$30,d0			;'0'
	bcs	L00c6ae
	subi.b	#$31,d0			;'1'
	bhi	L00c6ae
	eori.b	#$10,ccr
	roxl.l	#1,d6
	bra	L00c6ca

L00c6e0:
	move.l	#$00007fff,d0
	cmp.l	d0,d3
	bgt	L00c6fc
	cmp.l	d0,d1
	bgt	L00c6fc
	not.l	d0
	cmp.l	d0,d3
	blt	L00c6fc
	cmp.l	d0,d1
	blt	L00c6fc
	muls.w	d1,d3
	rts

L00c6fc:
	move.l	d1,d4
	bpl	L00c702
	neg.l	d1
L00c702:
	eor.l	d3,d4
	tst.l	d3
	bpl	L00c70a
	neg.l	d3
L00c70a:
	move.l	d3,d5
	move.l	d3,d6
	mulu.w	d1,d3
	swap.w	d5
	mulu.w	d1,d5
	swap.w	d1
	mulu.w	d1,d6
	swap.w	d1
	swap.w	d5
	swap.w	d6
	clr.w	d5
	clr.w	d6
	add.l	d5,d3
	add.l	d6,d3
	tst.l	d4
	bpl	L00c72c
	neg.l	d3
L00c72c:
	rts

L00c72e:
	move.l	d1,d6
	bpl	L00c734
	neg.l	d6
L00c734:
	move.l	d3,d7
	bpl	L00c73a
	neg.l	d7
L00c73a:
	jsr	(divide)
	eor.l	d1,d3
	tst.l	d3
	bpl	L00c748
	neg.l	d7
L00c748:
	move.l	d7,d3
	rts

divide::
	cmp.l	d6,d7
	bhi	L00c75e
	bne	L00c758
	clr.l	d5
	moveq.l	#$01,d7
	rts

L00c758:
	move.l	d7,d5
	clr.l	d7
	rts

L00c75e:
	tst.l	d6
	bne	L00c76c
	move.l	#$7fffffff,d7
	move.l	d7,d5
	rts

L00c76c:
	swap.w	d6
	tst.w	d6
	bne	L00c78e
	swap.w	d6
	swap.w	d7
	cmp.w	d6,d7
	bcc	L00c78a
	swap.w	d7
	divu.w	d6,d7
	swap.w	d7
	move.w	d7,d5
	ext.l	d5
	clr.w	d7
	swap.w	d7
	rts

L00c78a:
	swap.w	d7
	bra	L00c790

L00c78e:
	swap.w	d6
L00c790:
	move.l	d4,-(a7)
	move.l	d6,d4
L00c794:
	asl.l	#1,d4
	bcs	L00c79e
	cmp.l	d7,d4
	bcs	L00c794
	beq	L00c7a0
L00c79e:
	roxr.l	#1,d4
L00c7a0:
	clr.l	d0
	not.l	d0
	sub.l	d4,d7
L00c7a6:
	bmi	L00c7b4
	lsl.l	#1,d0
	cmp.l	d4,d6
	beq	L00c7c0
	lsr.l	#1,d4
	sub.l	d4,d7
	bra	L00c7a6

L00c7b4:
	rol.l	#1,d0
	cmp.l	d4,d6
	beq	L00c7c0
	lsr.l	#1,d4
	add.l	d4,d7
	bra	L00c7a6

L00c7c0:
	move.l	d7,d5
	bpl	L00c7c6
	add.l	d4,d5
L00c7c6:
	not.l	d0
	move.l	d0,d7
	move.l	(a7)+,d4
	rts

L00c7ce:
	lea.l	(L00c87c),a0
	jsr	(print)
	lea.l	(tmpbuf),a0
	jsr	(print)
	jsr	(newline)
	jmp	(main)

L00c7f2:
	lea.l	(L00c84e),a0
	bra	L00c824

L00c7fa:
	lea.l	(L00c867),a0
	bra	L00c824

L00c802:
	cmpi.l	#L00c96e,($00000008).l
	bne	L00c81e
	move.l	($07d4,a6),($00000008).l
	move.l	($0b74,a6),($0000000c).l
L00c81e:
	lea.l	(L00c88e),a0
L00c824:
	jsr	(print)
	tst.b	(a5)
	beq	L00c842
	lea.l	(L00c89f),a0
	jsr	(print)
	movea.l	a5,a0
	jsr	(print)
L00c842:
	jsr	(newline)
	jmp	(main)

L00c84e:
	.dc.b	'Expression address error',$00
L00c867:
	.dc.b	'Expression bus error',$00
L00c87c:
	.dc.b	'Undefined symbol ',$00
L00c88e:
	.dc.b	'Expression error',$00
L00c89f:
	.dc.b	' at ',$00
L00c8a4:
	clr.l	d1
	move.b	(a5),d0
	jsr	(isnum)
	bcs	L00c8d0
	move.b	(a5)+,d0
L00c8b2:
	asl.l	#1,d1
	move.l	d1,d4
	asl.l	#2,d1
	add.l	d4,d1
	subi.b	#$30,d0			;'0'
	ext.w	d0
	ext.l	d0
	add.l	d0,d1
	move.b	(a5)+,d0
	jsr	(isnum)
	bcc	L00c8b2
	move.b	-(a5),d0
L00c8d0:
	rts

L00c8d2:
	bsr	L00c910
	tst.w	($0316,a6)
	beq	L00c8fc
	move.l	a5,-(a7)
	addq.l	#1,a5
	jsr	(L00c2e2)
	bcs	L00c802
	bsr	L00c98c
	addq.l	#4,a7
	bra	skpblk

L00c8f2:
	movea.l	(a7)+,a5
	bsr	L00c93e
	ori.b	#$01,ccr
	rts

L00c8fc:
	addq.l	#1,a5
	jsr	(L00c2e2)
	bcs	L00c802
	bsr	L00c98c
	bsr	L00c93e
	rts

L00c910:
	move.l	($00000008).l,($07d4,a6)
	move.l	($0000000c).l,($0b74,a6)
	move.l	a7,($0b78,a6)
	move.l	a5,($0b84,a6)
	move.l	#L00c96e,($00000008).l
	move.l	#L00c950,($0000000c).l
	rts

L00c93e:
	move.l	($07d4,a6),($00000008).l
	move.l	($0b74,a6),($0000000c).l
	rts

L00c950:
	move.l	($07d4,a6),($00000008).l
	move.l	($0b74,a6),($0000000c).l
	movea.l	($0b78,a6),a7
	addq.l	#4,a7
	movea.l	($0b84,a6),a5
	bra	L00c7f2

L00c96e:
	move.l	($07d4,a6),($00000008).l
	move.l	($0b74,a6),($0000000c).l
	movea.l	($0b78,a6),a7
	addq.l	#4,a7
	movea.l	($0b84,a6),a5
	bra	L00c7fa

L00c98c:
	cmpi.b	#$5d,(a5)		;']'
	bne	L00c802
	addq.l	#1,a5
	jsr	(skpblk)
	cmpi.b	#$2e,(a5)		;'.'
	bne	L00ca12
	addq.l	#1,a5
	jsr	(skpblk)
	cmpi.b	#$62,(a5)		;'b'
	beq	L00c9ea
	cmpi.b	#$42,(a5)		;'B'
	beq	L00c9ea
	cmpi.b	#$73,(a5)		;'s'
	beq	L00c9ea
	cmpi.b	#$53,(a5)		;'S'
	beq	L00c9ea
	cmpi.b	#$77,(a5)		;'w'
	beq	L00c9f8
	cmpi.b	#$57,(a5)		;'W'
	beq	L00c9f8
	cmpi.b	#$6c,(a5)		;'l'
	beq	L00ca10
	cmpi.b	#$4c,(a5)		;'L'
	beq	L00ca10
	cmpi.b	#$56,(a5)		;'V'
	beq	L00ca0c
	cmpi.b	#$76,(a5)		;'v'
	beq	L00ca0c
	bra	L00c802

L00c9ea:
	addq.l	#1,a5
	pea.l	(a0)
	movea.l	d6,a0
	moveq.l	#$00,d6
	move.b	(a0),d6
	movea.l	(a7)+,a0
	rts

L00c9f8:
	addq.l	#1,a5
	pea.l	(a0)
	movea.l	d6,a0
	moveq.l	#$00,d6
	move.b	(a0),d6
	lsl.w	#8,d6
	move.b	($0001,a0),d6
	movea.l	(a7)+,a0
	rts

L00ca0c:
	add.l	d6,d6
	add.l	d6,d6
L00ca10:
	addq.l	#1,a5
L00ca12:
	pea.l	(a0)
	movea.l	d6,a0
	move.b	(a0),d6
	lsl.l	#8,d6
	move.b	($0001,a0),d6
	lsl.l	#8,d6
	move.b	($0002,a0),d6
	lsl.l	#8,d6
	move.b	($0003,a0),d6
	movea.l	(a7)+,a0
	rts

L00ca2e:
	jmp	(badpar)

writef::
	cmpi.b	#$40,(a5)		;'@'
	beq	L00cd3c
	jsr	(L00ceec)
	cmpi.w	#$0002,($0000.w,a6)
	bne	L00ca2e
	move.l	($0006,a6),d0
	cmp.l	($0002,a6),d0
	bcs	L00ca2e
	move.w	#$0020,-(a7)		;' '
	pea.l	(filnam)
	DOS	_DELETE
	DOS	_CREATE
	addq.l	#6,a7
	move.l	d0,d7
	bpl	L00ca7c
	move.w	#$0001,-(a7)
	pea.l	(filnam)
	DOS	_OPEN
	addq.l	#6,a7
	tst.l	d0
	bmi	L00ca9e
	move.l	d0,d7
L00ca7c:
	move.l	($0006,a6),d1
	sub.l	($0002,a6),d1
	addq.l	#1,d1
	move.l	d1,-(a7)
	move.l	($0002,a6),-(a7)
	move.w	d7,-(a7)
	DOS	_WRITE
	move.l	d0,d2
	DOS	_CLOSE
	lea.l	($000a,a7),a7
	cmp.l	d2,d1
	bne	L00caa6
	rts

L00ca9e:
	lea.l	(L00cab8),a0
	bra	L00caac

L00caa6:
	lea.l	(L00cacc),a0
L00caac:
	jsr	(print)
	jmp	(main)

L00cab8:
	.dc.b	'File create error',$0d,$0a,$00
L00cacc:
	.dc.b	'Device write error',$0d,$0a,$00,$00
readfl::
	.dc.b	$0c,$15,$00,$40,$67,$00,$01,$d6,$4e,$b9
	.dc.l	L00ceec
	.dc.b	$4e,$b9
	.dc.l	L00cdda
	.dc.b	$42,$ae,$04,$58,$4a,$6e,$00,$00,$66,$32,$41,$f9
	.dc.l	comlin
	.dc.b	$43,$f9
	.dc.l	cmlnsb
	.dc.b	$12,$d8,$66,$fc,$42,$a7,$48,$79
	.dc.l	cmlnsb
	.dc.b	$48,$79
	.dc.l	dbend+$2fffc540
	.dc.b	$3f,$3c,$00,$01,$ff,$4b,$4f,$ef,$00,$0e,$4a,$80,$6a,$56,$4e,$b9
	.dc.l	L00cc90
	.dc.b	$2f,$3c,$00,$ff,$ff,$ff,$ff,$48,$c0,$bc,$00,$ff,$ff,$ff,$2e,$80
	.dc.b	$ff,$48,$22,$00,$2e,$80,$ff,$80,$ff,$26,$58,$8f,$20,$01,$d0,$bc
	.dc.b	$00,$00,$00,$f0,$4a,$6e,$00,$00,$66,$08,$4e,$b9
	.dc.l	L00cd98
	.dc.b	$60,$1a,$0c,$6e,$00,$01,$00,$00,$66,$00,$fe,$c2,$20,$2e,$00,$02
	.dc.b	$4e,$b9
	.dc.l	L00cd98
	.dc.b	$4a,$ae,$04,$54,$67,$04,$41,$e8,$00,$40,$42,$ae,$00,$9e,$4a,$79
	.dc.l	L0129d6
	.dc.b	$67,$58,$48,$50,$4e,$7a,$80,$00,$23,$c8
	.dc.l	L0129e6
	.dc.b	$4e,$7a,$80,$01,$23,$c8
	.dc.l	L0129ea
	.dc.b	$4e,$7a,$80,$02,$23,$c8
	.dc.l	L0129ee
	.dc.b	$4e,$7a,$88,$01,$23,$c8
	.dc.l	L0129f6
	.dc.b	$4e,$7a,$88,$02,$23,$c8
	.dc.l	L0129f2
	.dc.b	$4e,$7a,$88,$03,$23,$c8
	.dc.l	L0129de
L00cbcc:
	.dc.b	' _Jy'
L00cbd0:
	.dc.l	L0129d8
	.dc.b	$67,$10,$f2,$39,$bc,$00
	.dc.l	L0129fa
	.dc.b	$f2,$39,$f0,$ff
	.dc.l	L012bf6
	.dc.b	$2d,$48,$00,$76,$2d,$49,$00,$7a,$2d,$4a,$00,$7e,$2d,$4b,$00,$82
	.dc.b	$2d,$4c,$00,$86,$2d,$6e,$01,$72,$00,$92,$2d,$7c
	.dc.l	stack1
	.dc.b	$00,$9a,$20,$09,$90,$88,$90,$bc,$00,$00,$01,$00,$2d,$40,$04,$5c
	.dc.b	$2d,$4c,$04,$60,$2d,$4c,$00,$96,$2d,$4c,$00,$2a,$2d,$4c,$00,$2e
	.dc.b	$2d,$4c,$00,$32,$2d,$4c,$00,$36,$41,$e8,$01,$00,$2d,$48,$04,$58
	.dc.b	$48,$79
	.dc.l	mainex
	.dc.b	$3f,$3c,$ff,$f0,$ff,$25,$5c,$8f,$2f,$39
	.dc.l	monpdb
	.dc.b	$ff,$80,$58,$8f,$23,$c0
	.dc.l	usrpdb
	.dc.b	$23,$c0
	.dc.l	child
	.dc.b	$3d,$7c,$00,$01,$06,$e0,$20,$2e,$04,$58,$41,$f9
	.dc.l	header
L00cc6a:
	.dc.b	'¨',$00
	.dc.b	$04,'N¹'
L00cc70:
	.dc.l	symset
	.dc.b	$61,$00,$a4,$70,$4e,$f9
	.dc.l	main
L00cc7e:
	lea.l	(L00ccab),a0
	jsr	(print)
	jmp	(main)

L00cc90:
	lea.l	(L00ccab),a0
	bra	print

L00cc9a:
	.dc.b	'No symbol file',$0d,$0a,$00
L00ccab:
	.dc.b	'File read error',$0d,$0a,$00,$00
L00ccbe:
	addq.l	#1,a5
	move.l	($0096,a6),($0002,a6)
	jsr	(getarg)
	cmpi.w	#$0004,($0000.w,a6)
	bne	L00ca2e
	DOS	_VERNUM
	cmp.w	#$0150,d0
	bcs	L00ccfa
	move.l	($000e,a6),-(a7)
	move.l	($000a,a6),-(a7)
	move.w	($0008,a6),-(a7)
	move.l	($0002,a6),-(a7)
	bset.b	#$07,(a7)
	DOS	_DISKRED
	lea.l	($000e,a7),a7
	bra	L00cd14

L00ccfa:
	move.w	($0010,a6),-(a7)
	move.w	($000c,a6),-(a7)
	move.w	($0008,a6),-(a7)
	move.l	($0002,a6),-(a7)
	bclr.b	#$07,(a7)
	DOS	_DISKRED
	lea.l	($000a,a7),a7
L00cd14:
	tst.l	d0
	bmi	deverr
	rts

deverr::
	lea.l	(L00cd2c),a0
	jsr	(print)
	jmp	(main)

L00cd2c:
	.dc.b	'Device error',$0d,$0a,$00,$00
L00cd3c:
	addq.l	#1,a5
	move.l	($0096,a6),($0002,a6)
	jsr	(getarg)
	cmpi.w	#$0004,($0000.w,a6)
	bne	L00ca2e
	DOS	_VERNUM
	cmp.w	#$0150,d0
	bcs	L00cd78
	move.l	($000e,a6),-(a7)
	move.l	($000a,a6),-(a7)
	move.w	($0008,a6),-(a7)
	move.l	($0002,a6),-(a7)
	bset.b	#$07,(a7)
	DOS	_DISKWRT
	lea.l	($000e,a7),a7
	bra	L00cd92

L00cd78:
	move.w	($0010,a6),-(a7)
	move.w	($000c,a6),-(a7)
	move.w	($0008,a6),-(a7)
	move.l	($0002,a6),-(a7)
	bclr.b	#$07,(a7)
	DOS	_DISKWRT
	lea.l	($000a,a7),a7
L00cd92:
	tst.l	d0
	bmi	deverr
	rts

L00cd98:
	movea.l	d0,a0
	clr.w	-(a7)
	pea.l	(filnam)
	DOS	_OPEN
	addq.l	#6,a7
	move.l	d0,d7
	bmi	L00cc7e
	move.w	#$0002,-(a7)
	clr.l	-(a7)
	move.w	d7,-(a7)
	DOS	_SEEK
	move.l	d0,d6
	clr.w	($0006,a7)
	DOS	_SEEK
	addq.l	#8,a7
	move.l	d6,-(a7)
	pea.l	(a0)
	move.w	d7,-(a7)
	DOS	_READ
	DOS	_CLOSE
	lea.l	($000a,a7),a7
	movea.l	a0,a4
	movea.l	a0,a1
	adda.l	d6,a1
	lea.l	(-$0100,a0),a0
	rts

L00cdda:
	clr.w	-(a7)
	pea.l	(filnam)
	DOS	_OPEN
	addq.l	#6,a7
	move.l	d0,d7
	bmi	L00cc7e
	jsr	(L00cf5a)
	clr.l	($044c,a6)
	clr.l	($0454,a6)
	lea.l	(header),a0
	move.l	#$00000040,-(a7)
	pea.l	(a0)
	move.w	d7,-(a7)
	DOS	_READ
	lea.l	($000a,a7),a7
	cmp.l	#$00000040,d0
	bne	L00ce96
	cmpi.w	#$4855,(a0)		;'HU'
	bne	L00ce96
	move.l	($0450,a6),d0
	beq	L00ce2a
	move.l	d0,-(a7)
	DOS	_MFREE
	addq.l	#4,a7
L00ce2a:
	move.l	($001c,a0),d0
	move.l	d0,($0450,a6)
	move.l	d0,($0454,a6)
	beq	L00ce96
	moveq.l	#$40,d0			;'@'
	add.l	($000c,a0),d0
	add.l	($0010,a0),d0
	add.l	($0018,a0),d0
	clr.w	-(a7)
	move.l	d0,-(a7)
	move.w	d7,-(a7)
	DOS	_SEEK
	addq.l	#8,a7
	move.l	($001c,a0),-(a7)
	DOS	_MALLOC
	addq.l	#4,a7
	move.l	d0,($0450,a6)
	bmi	L00ceb8
	move.l	($001c,a0),-(a7)
	move.l	d0,-(a7)
	move.w	d7,-(a7)
	DOS	_READ
	lea.l	($000a,a7),a7
	jsr	(symcnt)
	addq.l	#1,d0
	lsl.l	#2,d0
	add.l	($0454,a6),d0
	move.l	d0,-(a7)
	move.l	($0450,a6),-(a7)
	DOS	_SETBLOCK
	addq.l	#8,a7
	tst.l	d0
	bmi	L00ceaa
	move.l	($0450,a6),d0
	add.l	($0454,a6),d0
	move.l	d0,($044c,a6)
	bra	L00cea2

L00ce96:
	lea.l	(L00cc9a),a0
	jsr	(print)
L00cea2:
	move.w	d7,-(a7)
	DOS	_CLOSE
	addq.l	#2,a7
	rts

L00ceaa:
	jsr	(L00cea2)
	move.l	($0450,a6),-(a7)
	DOS	_MFREE
	addq.l	#4,a7
L00ceb8:
	clr.l	($0450,a6)
	clr.l	($0454,a6)
	clr.l	($044c,a6)
	lea.l	(L00ced2),a0
	jsr	(print)
	bra	L00cea2

L00ced2:
	.dc.b	'Can',$27,'t make symbol table',$0d,$0a,$00
L00ceec:
	clr.w	($0000.w,a6)
	jsr	(skpblk)
	tst.w	d0
	beq	L00ca2e
	lea.l	(filnam),a0
L00cf02:
	move.b	(a5)+,d0
	beq	L00cf2e
	cmp.b	#$20,d0			;' '
	beq	L00cf2e
	cmp.b	#$2d,d0			;'-'
	beq	L00cf2e
	cmp.b	#$2f,d0			;'/'
	beq	L00cf2e
	cmp.b	#$22,d0			;'"'
	beq	L00cf2e
	cmp.b	#$27,d0			;'''
	beq	L00cf2e
	cmp.b	#$2c,d0			;','
	beq	L00cf3a
	move.b	d0,(a0)+
	bra	L00cf02

L00cf2e:
	clr.b	(a0)
	subq.l	#1,a5
	jsr	(comset)
	rts

L00cf3a:
	clr.b	(a0)
	clr.w	(comlin)
	move.l	(usrpdb),($0002,a6)
	jsr	(getarg)
	tst.w	($0000.w,a6)
	beq	L00ca2e
	rts

L00cf5a:
	movem.l	d0-d7/a0-a6,-(a7)
	movea.l	(child),a0
	move.l	a7,($0030,a0)
	pea.l	(a0)
	DOS	_SETPDB
	move.l	#L00cf7c,(a7)
	move.w	#$fff0,-(a7)
	DOS	_INTVCS
	clr.w	-(a7)
	DOS	_EXIT2

L00cf7c:
	movem.l	(a7)+,d0-d7/a0-a6
	rts

help::
	move.b	(a5),d0
	jsr	(toupper)
	cmpi.b	#$49,d0			;'I'
	beq	L00cfac
	cmpi.b	#$43,d0			;'C'
	bne	L00d0c2
	addq.l	#1,a5
	moveq.l	#$63,d7			;'c'
	lea.l	($0182,a6),a0
L00cfa0:
	move.l	#$ffffffff,(a0)+
	dbra	d7,L00cfa0
	rts

L00cfac:
	addq.l	#1,a5
	lea.l	(L00d084),a0
	jsr	(print)
	lea.l	($0182,a6),a2
	moveq.l	#$63,d7			;'c'
	moveq.l	#$00,d6
L00cfc2:
	tst.l	d6
	beq	L00cfd8
	move.l	d6,d0
	divu.w	#$0014,d0
	swap.w	d0
	tst.w	d0
	bne	L00cfd8
	jsr	(yesno_)
L00cfd8:
	move.l	(a2)+,d1
	cmp.l	#$ffffffff,d1
	beq	L00d066
	addq.w	#1,d6
	jsr	(putlhex)
	move.l	(-$0004,a2),d0
	jsr	(valsch)
	tst.l	d0
	bmi	L00d03c
	movea.l	d0,a0
	pea.l	(a0)
	jsr	(puttab)
	jsr	(print)
	moveq.l	#$3a,d0			;':'
	jsr	(putch)
	movea.l	(a7)+,a0
	moveq.l	#$00,d0
L00d016:
	addq.w	#1,d0
	tst.b	(a0)+
	bne	L00d016
	moveq.l	#$10,d1
	sub.w	d0,d1
	bmi	L00d02a
	cmp.w	#$0009,d1
	bcs	L00d048
	bra	L00d042

L00d02a:
	jsr	(newline)
	jsr	(puttab)
	jsr	(puttab)
L00d03c:
	jsr	(puttab)
L00d042:
	jsr	(puttab)
L00d048:
	jsr	(puttab)
	movem.l	d0-d7/a0-a6,-(a7)
	movea.l	(-$0004,a2),a5
	jsr	(dissb2)
	movem.l	(a7)+,d0-d7/a0-a6
	jsr	(newline)
L00d066:
	dbra	d7,L00cfc2
	tst.w	d6
	beq	L00d076
	jsr	(newline)
	rts

L00d076:
	lea.l	(L00d0a0),a0
	jsr	(print)
	rts

L00d084:
	.dc.b	'Trace history from older.',$0d,$0a,$00
L00d0a0:
	.dc.b	$0d,$0a
	.dc.b	$09,'** Empty history buffer **',$0d,$0a
	.dc.b	$0d,$0a,$00
L00d0c2:
	move.w	($0448,a6),d0
	btst.l	#$00,d0
	bne	L00d0d4
	lea.l	(L00d110),a1
	bra	L00d0da

L00d0d4:
	lea.l	(L00d230),a1
L00d0da:
	jsr	(newline)
L00d0e0:
	movea.l	(a1)+,a0
	move.l	a1,-(a7)
	jsr	(print)
	movea.l	(a7)+,a1
	tst.l	(a1)
	beq	L00d10e
	cmpi.l	#$ffffffff,(a1)
	bne	L00d0e0
	lea.l	(cntmes),a0
	jsr	(print)
	jsr	(yesno_)
	addq.l	#4,a1
	bra	L00d0da

L00d10e:
	rts

L00d110:
	.dc.l	L00d350
	.dc.l	L00d36b
	.dc.l	L00d397
	.dc.l	L00d3b6
	.dc.l	L00d3e7
	.dc.l	L00d40a
	.dc.l	L00d42f
	.dc.l	L00d454
	.dc.l	L00d476
	.dc.l	L00d499
	.dc.l	L00d4c0
	.dc.l	L00d4e3
	.dc.l	L00d51a
	.dc.l	L00d53d
	.dc.l	L00d559
	.dc.l	L00d575
	.dc.l	L00d598
	.dc.l	L00d5c5
	.dc.l	L00d5f7
	.dc.l	L00d61d
	.dc.l	L00d645
	.dc.l	L00d66a
	.dc.l	L00d6a9
	.dc.l	L00d6d2
	.dc.l	L00d6fb
	.dc.l	L00d724
	.dc.l	L00d78b
	.dc.l	L00d7ac
	.dc.l	L00d7cc
	.dc.l	L00d7ee
	.dc.b	$ff,$ff,$ff,$ff
	.dc.l	L00d805
	.dc.l	L00d831
	.dc.l	L00d868
	.dc.l	L00d883
	.dc.l	L00d8a8
	.dc.l	L00dc0b
	.dc.l	L00dc35
	.dc.l	L00d8d1
	.dc.l	L00d8ee
	.dc.l	L00d916
	.dc.l	L00d94c
	.dc.l	L00d967
	.dc.l	L00dc67
	.dc.l	L00dc88
	.dc.l	L00dcaa
	.dc.l	L00dccf
	.dc.l	L00dcf9
	.dc.l	L00dd1c
	.dc.l	L00d986
	.dc.l	L00d997
	.dc.l	L00d9b2
	.dc.l	L00d9d4
	.dc.l	L00d9eb
	.dc.l	L00da03
	.dc.l	L00da24
	.dc.l	L00da45
	.dc.l	L00da71
	.dc.l	L00da9f
	.dc.l	L00dac0
	.dc.l	L00dd3f
	.dc.b	$ff,$ff,$ff,$ff
	.dc.l	L00d73d
	.dc.l	L00d75d
	.dc.l	L00d767
	.dc.l	L00d780
	.dc.l	L00dae4
	.dc.l	L00db16
	.dc.l	L00db3a
	.dc.l	L00db7f
	.dc.l	L00dbbf
	.dc.b	$00,$00,$00,$00
L00d230:
	.dc.l	L00d350
	.dc.l	L00d36b
	.dc.l	L00d397
	.dc.l	L00d3b6
	.dc.l	L00d3e7
	.dc.l	L00d40a
	.dc.l	L00d42f
	.dc.l	L00d454
	.dc.l	L00d476
	.dc.l	L00d499
	.dc.l	L00d4c0
	.dc.l	L00d4e3
	.dc.l	L00d51a
	.dc.l	L00d53d
	.dc.l	L00d559
	.dc.l	L00d575
	.dc.l	L00d598
	.dc.l	L00d5c5
	.dc.l	L00d5f7
	.dc.l	L00d61d
	.dc.l	L00d645
	.dc.l	L00d66a
	.dc.l	L00d6a9
	.dc.b	$ff,$ff,$ff,$ff
	.dc.l	L00d6d2
	.dc.l	L00d6fb
	.dc.l	L00d724
	.dc.l	L00d78b
	.dc.l	L00d7ac
	.dc.l	L00d7cc
	.dc.l	L00d7ee
	.dc.l	L00d805
	.dc.l	L00d831
	.dc.l	L00d868
	.dc.l	L00d883
	.dc.l	L00d8a8
	.dc.l	L00dc0b
	.dc.l	L00dc35
	.dc.l	L00d8d1
	.dc.l	L00d8ee
	.dc.l	L00d916
	.dc.l	L00d94c
	.dc.l	L00d967
	.dc.l	L00dc67
	.dc.l	L00dc88
	.dc.l	L00dcaa
	.dc.l	L00dccf
	.dc.b	$ff,$ff,$ff,$ff
	.dc.l	L00dcf9
	.dc.l	L00dd1c
	.dc.l	L00d986
	.dc.l	L00d997
	.dc.l	L00d9b2
	.dc.l	L00d9d4
	.dc.l	L00d9eb
	.dc.l	L00da03
	.dc.l	L00da24
	.dc.l	L00da45
	.dc.l	L00da71
	.dc.l	L00da9f
	.dc.l	L00dac0
	.dc.l	L00dd3f
	.dc.l	L00d73d
	.dc.l	L00d75d
	.dc.l	L00d767
	.dc.l	L00d780
	.dc.l	L00dae4
	.dc.l	L00db16
	.dc.l	L00db3a
	.dc.l	L00db7f
	.dc.l	L00dbbf
	.dc.b	$00,$00,$00,$00
L00d350:
	.dc.b	'A[address]',$09,$09,$09,':ƒAƒZƒ“ƒuƒ‹',$0d,$0a,$00
L00d36b:
	.dc.b	'AN[address]',$09,$09,$09,':ƒAƒZƒ“ƒuƒ‹(Æ°ÓÆ¯¸•\Ž¦‚È‚µ)',$0d,$0a,$00
L00d397:
	.dc.b	'B',$09,$09,$09,$09,':ƒuƒŒ[ƒNƒ|ƒCƒ“ƒg‚Ì•\Ž¦',$0d,$0a,$00
L00d3b6:
	.dc.b	'B[bp] address [count]',$09,$09,':ƒuƒŒ[ƒNƒ|ƒCƒ“ƒg‚ÌÝ’è',$0d,$0a,$00
L00d3e7:
	.dc.b	'BC bp',$09,$09,$09,$09,':ƒuƒŒ[ƒNƒ|ƒCƒ“ƒg‚Ìíœ',$0d,$0a,$00
L00d40a:
	.dc.b	'BD bp',$09,$09,$09,$09,':ƒuƒŒ[ƒNƒ|ƒCƒ“ƒg‚Ì–³Œø‰»',$0d,$0a,$00
L00d42f:
	.dc.b	'BE bp',$09,$09,$09,$09,':ƒuƒŒ[ƒNƒ|ƒCƒ“ƒg‚Ì—LŒø‰»',$0d,$0a,$00
L00d454:
	.dc.b	'BR',$09,$09,$09,$09,':ƒuƒŒ[ƒNƒJƒEƒ“ƒg‚Ì‰Šú‰»',$0d,$0a,$00
L00d476:
	.dc.b	'C string',$09,$09,$09,':ƒRƒ}ƒ“ƒhƒ‰ƒCƒ“‚ÌÝ’è',$0d,$0a,$00
L00d499:
	.dc.b	'D[size][range]',$09,$09,$09,':ƒƒ‚ƒŠ“à—e‚Ìƒ_ƒ“ƒv',$0d,$0a,$00
L00d4c0:
	.dc.b	'F[size]range data',$09,$09,':ƒtƒBƒ‹ƒƒ‚ƒŠ',$0d,$0a,$00
L00d4e3:
	.dc.b	'G[=address] [address]',$09,$09,':ƒfƒoƒbƒO’†‚ÌƒvƒƒOƒ‰ƒ€‚ÌŽÀs',$0d,$0a,$00
L00d51a:
	.dc.b	'H',$09,$09,$09,$09,':ƒIƒ“ƒ‰ƒCƒ“ƒwƒ‹ƒvƒƒbƒZ[ƒW',$0d,$0a,$00
L00d53d:
	.dc.b	'HC',$09,$09,$09,$09,':ƒgƒŒ[ƒX—š—ð‚ÌÁ‹Ž',$0d,$0a,$00
L00d559:
	.dc.b	'HI',$09,$09,$09,$09,':ƒgƒŒ[ƒX—š—ð‚Ì•\Ž¦',$0d,$0a,$00
L00d575:
	.dc.b	'L[range]',$09,$09,$09,':ƒAƒZƒ“ƒuƒŠƒŠƒXƒg•\Ž¦',$0d,$0a,$00
L00d598:
	.dc.b	'ME[size][address] [data]',$09,':ƒƒ‚ƒŠ“à—e‚Ì•ÒW',$0d,$0a,$00
L00d5c5:
	.dc.b	'MEN[size][address]',$09,$09,':ƒƒ‚ƒŠ“à—e‚Ì•ÒW(•\Ž¦‚È‚µ)',$0d,$0a,$00
L00d5f7:
	.dc.b	'MM range address',$09,$09,':ƒƒ‚ƒŠ“à—e‚ÌˆÚ“®',$0d,$0a,$00
L00d61d:
	.dc.b	'MS[size]range data',$09,$09,':ƒƒ‚ƒŠ“à—e‚ÌŒŸõ',$0d,$0a,$00
L00d645:
	.dc.b	'N',$09,$09,$09,$09,':ƒƒ‚ƒŠƒ`ƒFƒbƒNƒ|ƒCƒ“ƒg‚Ì•\Ž¦',$0d,$0a,$00
L00d66a:
	.dc.b	'N[size][cp] address [cd][data]',$09,':ƒƒ‚ƒŠƒ`ƒFƒbƒNƒ|ƒCƒ“ƒg‚ÌÝ’è',$0d,$0a,$00
L00d6a9:
	.dc.b	'NC cp',$09,$09,$09,$09,':ƒƒ‚ƒŠƒ`ƒFƒbƒNƒ|ƒCƒ“ƒg‚ÌÁ‹Ž',$0d,$0a,$00
L00d6d2:
	.dc.b	'ND cp',$09,$09,$09,$09,':ƒƒ‚ƒŠƒ`ƒFƒbƒNƒ|ƒCƒ“ƒg‚Ì–³Œø',$0d,$0a,$00
L00d6fb:
	.dc.b	'NE cp',$09,$09,$09,$09,':ƒƒ‚ƒŠƒ`ƒFƒbƒNƒ|ƒCƒ“ƒg‚Ì—LŒø',$0d,$0a,$00
L00d724:
	.dc.b	'O',$09,$09,$09,$09,':‰æ–Ê•\Ž¦•‚Ì•ÏX',$0d,$0a,$00
L00d73d:
	.dc.b	'size',$09,$09,'s(byte) w(word) l(long)',$0d,$0a,$00
L00d75d:
	.dc.b	'bp',$09,$09,'0-9',$0d,$0a,$00
L00d767:
	.dc.b	'cd(condition)',$09,'0:<>,1:=',$0d,$0a,$00
L00d780:
	.dc.b	'cp',$09,$09,'0-9',$0d,$0a,$00,$00
L00d78b:
	.dc.b	'P',$09,$09,$09,$09,':ƒVƒXƒeƒ€ƒXƒe[ƒ^ƒX‚Ì•\Ž¦',$0d,$0a,$00
L00d7ac:
	.dc.b	'PS',$09,$09,$09,$09,':ƒVƒ“ƒ{ƒ‹ƒe[ƒuƒ‹‚Ì•\Ž¦',$0d,$0a,$00
L00d7cc:
	.dc.b	'PS symbol',$09,$09,$09,':ƒVƒ“ƒ{ƒ‹‚ÌŒŸõ•\Ž¦',$0d,$0a,$00
L00d7ee:
	.dc.b	'Q',$09,$09,$09,$09,':ƒfƒoƒbƒK‚ÌI—¹',$0d,$0a,$00
L00d805:
	.dc.b	'R filename[,address]',$09,$09,':ƒtƒ@ƒCƒ‹‚Ì“Ç‚Ýž‚Ý',$0d,$0a,$00
L00d831:
	.dc.b	'R@ address drive record count ',$09,':ƒfƒBƒXƒN‚Ì•¨—ƒŠ[ƒh',$0d,$0a,$00
L00d868:
	.dc.b	'S[count]',$09,$09,$09,':ƒXƒeƒbƒvŽÀs',$0d,$0a,$00
L00d883:
	.dc.b	'T[=address] [count]',$09,$09,':ƒgƒŒ[ƒXŽÀs',$0d,$0a,$00
L00d8a8:
	.dc.b	'U[=address] [count]',$09,$09,':•\Ž¦‚È‚µƒgƒŒ[ƒX',$0d,$0a,$00
L00d8d1:
	.dc.b	'V',$09,$09,$09,$09,':ƒRƒ“ƒ\[ƒ‹‚ÌØ‚è‘Ö‚¦',$0d,$0a,$00
L00d8ee:
	.dc.b	'W filename,range',$09,$09,':ƒtƒ@ƒCƒ‹‚Ì‘‚«ž‚Ý',$0d,$0a,$00
L00d916:
	.dc.b	'W@ address drive record count',$09,':ƒfƒBƒXƒN‚Ì•¨—ƒ‰ƒCƒg',$0d,$0a,$00
L00d94c:
	.dc.b	'X',$09,$09,$09,$09,':ƒŒƒWƒXƒ^“à—e‚Ì•\Ž¦',$0d,$0a,$00
L00d967:
	.dc.b	'X reg',$09,$09,$09,$09,':ƒŒƒWƒXƒ^“à—e‚Ì•ÏX',$0d,$0a,$00
L00d986:
	.dc.b	'Y/N',$09,$09,$09,$09,':ƒ|[ƒY',$0d,$0a,$00
L00d997:
	.dc.b	'Z',$09,$09,$09,$09,':ƒVƒXƒeƒ€•Ï”‚Ì•\Ž¦',$0d,$0a,$00
L00d9b2:
	.dc.b	'Z num=exp',$09,$09,$09,':ƒVƒXƒeƒ€•Ï”‚ÌÝ’è',$0d,$0a,$00
L00d9d4:
	.dc.b	'? exp',$09,$09,$09,$09,':‚P‚Ui•\Ž¦',$0d,$0a,$00
L00d9eb:
	.dc.b	'?? exp',$09,$09,$09,$09,':‚P‚Oi•\Ž¦',$0d,$0a,$00
L00da03:
	.dc.b	'\',$09,$09,$09,$09,':ƒRƒ}ƒ“ƒhƒ‰ƒCƒ“‚ÌŒJ‚è•Ô‚µ',$0d,$0a,$00
L00da24:
	.dc.b	'> filename',$09,$09,$09,':o—ÍƒŠƒ_ƒCƒŒƒNƒg',$0d,$0a,$00
L00da45:
	.dc.b	'>> filename',$09,$09,$09,':o—ÍƒŠƒ_ƒCƒŒƒNƒg(ƒAƒyƒ“ƒh)',$0d,$0a,$00
L00da71:
	.dc.b	'>@ filename',$09,$09,$09,':“ü—ÍƒRƒ}ƒ“ƒh‚ðƒtƒ@ƒCƒ‹‚É•Û‘¶',$0d,$0a,$00
L00da9f:
	.dc.b	'< filename',$09,$09,$09,':“ü—ÍƒŠƒ_ƒCƒŒƒNƒg',$0d,$0a,$00
L00dac0:
	.dc.b	'![os_command]',$09,$09,$09,':OSƒRƒ}ƒ“ƒh‚ÌŽÀs',$0d,$0a,$00
L00dae4:
	.dc.b	'symbol',$09,'  ',$09,'ƒVƒ“ƒ{ƒ‹EƒŒƒWƒXƒ^–¼‚Ìæ“ª‚É.(period)',$0d,$0a,$00
L00db16:
	.dc.b	'drive',$09,'  ',$09,'0:current,1:A,2:B, .....',$0d,$0a,$00
L00db3a:
	.dc.b	'reg',$09,'  ',$09,'d0-d7 a0-a7 ssp usp sr ccr pc isp msp vbr sfc dfc cacr caar',$0d,$0a,$00
L00db7f:
	.dc.b	'operators',$09,'+ - * / & (and) | (or) ! (not) % (residue) ^ (exor)',$0d,$0a,$00
L00dbbf:
	.dc.b	'number',$09,'  ',$09,'??(hex.) .??(symbol) \??(dec.) _??(bin.) [exp].s|w|l(indirect)',$0d,$0a,$00,$00
L00dc0b:
	.dc.b	'TN[=address] [count]',$09,$09,':•ªŠò–½—ßƒgƒŒ[ƒX',$0d,$0a,$00
L00dc35:
	.dc.b	'UN[=address] [count]',$09,$09,':•\Ž¦‚È‚µ•ªŠò–½—ßƒgƒŒ[ƒX',$0d,$0a,$00
L00dc67:
	.dc.b	'XI [exp]',$09,$09,$09,':Š„‚èž‚ÝƒŒƒxƒ‹•ÏX',$0d,$0a,$00
L00dc88:
	.dc.b	'XM',$09,$09,$09,$09,':ƒƒ‚ƒŠ“à—e•\Ž¦ƒ‚[ƒh•ÏX',$0d,$0a,$00
L00dcaa:
	.dc.b	'XFPCP',$09,$09,$09,$09,':•‚“®¬”“_ƒvƒƒZƒbƒT§Œä',$0d,$0a,$00
L00dccf:
	.dc.b	'XDIS',$09,$09,$09,$09,':ƒCƒ~ƒfƒBƒGƒCƒg’l•‚“®¬”“_•\Ž¦',$0d,$0a,$00
L00dcf9:
	.dc.b	'XFX',$09,$09,$09,$09,':ƒŒƒWƒXƒ^’l•‚“®¬”“_•\Ž¦',$0d,$0a,$00
L00dd1c:
	.dc.b	'XFP',$09,$09,$09,$09,':FPƒŒƒWƒXƒ^•\Ž¦ƒ‚[ƒh•ÏX',$0d,$0a,$00
L00dd3f:
	.dc.b	$0d,$0a,$00
L00dd42:
	jmp	(badpar)

search::
	move.w	#$0001,($0312,a6)
	move.b	(a5),d0
	jsr	(toupper)
	cmpi.b	#$53,d0			;'S'
	bne	L00dd62
	clr.w	($0312,a6)
	bra	L00dd74

L00dd62:
	cmpi.b	#$57,d0			;'W'
	beq	L00dd74
	cmpi.b	#$4c,d0			;'L'
	bne	L00dd76
	move.w	#$0002,($0312,a6)
L00dd74:
	addq.l	#1,a5
L00dd76:
	move.l	($0096,a6),($0002,a6)
	jsr	(L00ddb6)
	jsr	(getdta)
	move.w	d3,d6
	subq.w	#1,d6
	move.l	($0002,a6),d3
	move.l	($0006,a6),d4
	sub.l	d7,d4
	lea.l	($059c,a6),a0
	move.l	a0,d5
	cmp.l	d3,d4
	bcs	L00dd42
	clr.w	($001e,a6)
	move.w	($0312,a6),d0
	beq	L00df4a
	subq.w	#1,d0
	beq	L00df6a
	bra	L00df8a

L00ddb6:
	jsr	(skpblk)
	cmp.b	#$2c,d0			;','
	bne	L00ddc8
	move.l	($0002,a6),d6
	bra	L00ddd2

L00ddc8:
	jsr	(getexp)
	bcs	L00dd42
L00ddd2:
	move.l	d6,($0002,a6)
	move.b	(a5)+,d0
	cmp.b	#$2c,d0			;','
	beq	L00dde6
	cmp.b	#$20,d0			;' '
	bne	L00dd42
L00dde6:
	jsr	(skpblk)
	jsr	(toupper)
	cmp.b	#$4c,d0			;'L'
	bne	L00de0a
	addq.l	#1,a5
	jsr	(getexp)
	bcs	L00dd42
	add.l	($0002,a6),d6
	bra	L00de14

L00de0a:
	jsr	(getexp)
	bcs	L00dd42
L00de14:
	move.l	d6,($0006,a6)
	cmpi.b	#$20,(a5)		;' '
	beq	L00de26
	cmpi.b	#$2c,(a5)		;','
	bne	L00dd42
L00de26:
	jsr	(skpblk)
	move.l	($0002,a6),d0
	cmp.l	($0006,a6),d0
	bcc	L00dd42
	move.w	#$0002,($0000.w,a6)
	rts

getdta::
	jsr	(skpblk)
	cmp.b	#$2c,d0			;','
	bne	L00de54
	addq.l	#1,a5
	jsr	(skpblk)
L00de54:
	lea.l	($059c,a6),a1
	clr.l	d7
	clr.l	d3
	tst.b	d0
	beq	L00dd42
	cmp.b	#$27,d0			;'''
	beq	L00defc
	cmp.b	#$22,d0			;'"'
	beq	L00defc
	move.w	($0312,a6),d0
	beq	L00de80
	subq.w	#2,d0
	bhi	L00de80
	beq	L00deda
	bra	L00deae

L00de80:
	jsr	(getexp)
	bcs	L00dd42
	cmp.l	#$00000100,d6
	bcc	L00dfe4
	move.b	d6,(a1)+
	addq.w	#1,d7
	addq.w	#1,d3
	cmp.w	#$0080,d7
	bhi	L00df28
	jsr	(skpblk)
	tst.b	d0
	bne	L00de80
	rts

L00deae:
	jsr	(getexp)
	bcs	L00dd42
	cmp.l	#$00010000,d6
	bcc	L00dfe4
	move.w	d6,(a1)+
	addq.w	#2,d7
	addq.w	#1,d3
	cmp.w	#$0080,d7
	bhi	L00df28
	jsr	(skpblk)
	tst.b	d0
	bne	L00deae
	rts

L00deda:
	jsr	(getexp)
	bcs	L00dd42
	move.l	d6,(a1)+
	addq.w	#4,d7
	addq.w	#1,d3
	cmp.w	#$0080,d7
	bhi	L00df28
	jsr	(skpblk)
	tst.b	d0
	bne	L00deda
	rts

L00defc:
	cmpi.w	#$0003,($0312,a6)
	beq	L00df08
	clr.w	($0312,a6)
L00df08:
	addq.l	#1,a5
	move.b	d0,d2
L00df0c:
	move.b	(a5),d0
	beq	L00df24
	addq.l	#1,a5
	cmp.b	d0,d2
	beq	L00df24
	move.b	d0,(a1)+
	addq.w	#1,d7
	addq.w	#1,d3
	cmp.w	#$0080,d7
	bhi	L00df28
	bra	L00df0c

L00df24:
	clr.b	(a1)
	rts

L00df28:
	lea.l	(L00df3a),a0
	jsr	(print)
	jmp	(main)

L00df3a:
	.dc.b	'data too long',$0d,$0a,$00
L00df4a:
	cmp.l	d4,d3
	bhi	L00dfaa
	movea.l	d3,a0
	movea.l	d5,a1
	move.w	d6,d0
L00df54:
	cmpm.b	(a0)+,(a1)+
	dbne	d0,L00df54
	tst.w	d0
	bmi	L00df62
L00df5e:
	addq.l	#1,d3
	bra	L00df4a

L00df62:
	jsr	(L00dfb8)
	bra	L00df5e

L00df6a:
	cmp.l	d4,d3
	bhi	L00dfaa
	movea.l	d3,a0
	movea.l	d5,a1
	move.w	d6,d0
L00df74:
	cmpm.w	(a0)+,(a1)+
	dbne	d0,L00df74
	tst.w	d0
	bmi	L00df82
L00df7e:
	addq.l	#2,d3
	bra	L00df6a

L00df82:
	jsr	(L00dfb8)
	bra	L00df7e

L00df8a:
	cmp.l	d4,d3
	bhi	L00dfaa
	movea.l	d3,a0
	movea.l	d5,a1
	move.w	d6,d0
L00df94:
	cmpm.l	(a0)+,(a1)+
	dbne	d0,L00df94
	tst.w	d0
	bmi	L00dfa2
L00df9e:
	addq.l	#4,d3
	bra	L00df8a

L00dfa2:
	jsr	(L00dfb8)
	bra	L00df9e

L00dfaa:
	tst.w	($001e,a6)
	beq	L00dfb6
	jsr	(newline)
L00dfb6:
	rts

L00dfb8:
	cmpi.w	#$0008,($001e,a6)
	bcs	L00dfca
	jsr	(newline)
	clr.w	($001e,a6)
L00dfca:
	addq.w	#1,($001e,a6)
	move.l	d3,d1
	jsr	(putlhex)
	jsr	(putspc)
	jsr	(putspc)
	rts

L00dfe4:
	lea.l	(L00dff6),a0
	jsr	(print)
	jmp	(main)

L00dff6:
	.dc.b	'size(a6) over',$0d,$0a,$00
mtblchk::
	lea.l	($06e4,a6),a0
	moveq.l	#$09,d2
L00e00c:
	cmpi.w	#$0001,(a0)
	bne	L00e04a
	movea.l	($0002,a0),a1
	move.l	($000a,a0),d0
	cmpi.w	#$0001,($0006,a0)
	beq	L00e03e
	cmpi.w	#$0002,($0006,a0)
	beq	L00e044
	cmp.b	(a1),d0
	beq	L00e036
L00e02e:
	tst.w	($0008,a0)
	beq	L00e058
	bra	L00e04a

L00e036:
	tst.w	($0008,a0)
	beq	L00e04a
	bra	L00e058

L00e03e:
	cmp.w	(a1),d0
	beq	L00e036
	bra	L00e02e

L00e044:
	cmp.l	(a1),d0
	beq	L00e036
	bra	L00e02e

L00e04a:
	lea.l	($000e,a0),a0
	dbra	d2,L00e00c
	andi.b	#$7e,ccr
	rts

L00e058:
	move.l	($0002,a0),d0
	ori.b	#$01,ccr
	rts

stmadrs::
	clr.w	(ptrnum)
	move.w	#$0001,($0312,a6)
	move.b	(a5)+,d0
	jsr	(toupper)
	cmp.b	#$43,d0			;'C'
	beq	L00e3ac
	cmp.b	#$45,d0			;'E'
	beq	L00e3bc
	cmp.b	#$44,d0			;'D'
	beq	L00e3c0
	cmpi.b	#$53,d0			;'S'
	bne	L00e09a
	clr.w	($0312,a6)
	bra	L00e0c2

L00e09a:
	cmpi.b	#$57,d0			;'W'
	beq	L00e0c2
	cmpi.b	#$4c,d0			;'L'
	bne	L00e0ae
	move.w	#$0002,($0312,a6)
	bra	L00e0c2

L00e0ae:
	subq.l	#1,a5
	move.l	a5,($0b9e,a6)
	jsr	(skpblk)
	beq	L00e26a
	movea.l	($0b9e,a6),a5
L00e0c2:
	moveq.l	#$ff,d1
	clr.l	d0
	move.b	(a5),d0
	tst.b	d0
	beq	L00e0f4
	cmp.b	#$20,d0			;' '
	beq	L00e0f4
	sub.b	#$30,d0			;'0'
	cmp.b	#$0a,d0
	bcc	L00e4ca
	addq.l	#1,a5
	tst.b	(a5)
	beq	L00e0f2
	cmpi.b	#$20,(a5)		;' '
	beq	L00e0f2
	cmpi.b	#$2c,(a5)		;','
	bne	L00e4ca
L00e0f2:
	move.w	d0,d1
L00e0f4:
	move.w	d1,-(a7)
	move.w	d1,(ptrnum)
	tst.w	d1
	bmi	L00e13e
	clr.l	d0
	move.w	d1,d0
	jsr	(L00e11a)
	move.l	d0,(oldadr)
	tst.l	d0
	beq	L00e13e
	move.l	d0,($0002,a6)
	bra	L00e146

L00e11a:
	lea.l	($06e4,a6),a4
	cmp.l	#$0000000a,d0
	bcc	L00e13a
	lsl.l	#1,d0
	move.l	d0,d1
	lsl.l	#3,d0
	sub.l	d1,d0
	adda.l	d0,a4
	tst.w	(a4)
	bmi	L00e13a
	move.l	($0002,a4),d0
	rts

L00e13a:
	clr.l	d0
	rts

L00e13e:
	move.l	#$ffffffff,($0002,a6)
L00e146:
	jsr	(getarg)
	cmpi.w	#$0003,(comnum)
	bcc	L00dd42
	jsr	(L00e4a4)
	clr.l	d0
	move.w	(a7),d0
	bpl	L00e16e
	jsr	(L00e482)
	bcs	L00e4c2
L00e16e:
	lsl.l	#1,d0
	move.l	d0,d1
	lsl.l	#3,d0
	sub.l	d1,d0
	lea.l	($06e4,a6),a0
	adda.l	d0,a0
	move.l	a0,(smbuf)
	movea.l	#smwork,a0
	subq.w	#1,($0000.w,a6)
	beq	L00dd42
	clr.w	($0008,a0)
	move.w	($0312,a6),d0
	move.w	d0,($0006,a0)
	cmpi.l	#$ffffffff,($0006,a6)
	beq	L00dd42
	tst.w	d0
	beq	L00e1b6
	btst.b	#$00,($0009,a6)
	bne	L00dd42
L00e1b6:
	movea.l	($0006,a6),a1
	move.l	a1,($0002,a0)
	subq.w	#1,($0000.w,a6)
	beq	L00e246
	move.w	(nullflg),d0
	and.w	#$0004,d0
	beq	L00e1ee
	clr.l	($000a,a6)
	tst.l	(oldadr)
	beq	L00e1ee
	move.l	a1,-(a7)
	movea.l	(smbuf),a1
	move.w	($0008,a1),($000c,a6)
	movea.l	(a7)+,a1
L00e1ee:
	move.l	($000a,a6),d0
	andi.l	#$fffffffe,($000a,a6)
	bne	L00dd42
	move.w	d0,($0008,a0)
	subq.w	#1,($0000.w,a6)
	beq	L00e246
	move.l	#$0000ffff,d0
	tst.w	($0006,a0)
	bne	L00e21a
	move.l	#$000000ff,d0
L00e21a:
	cmpi.w	#$0002,($0006,a0)
	beq	L00e22a
	cmp.l	($000e,a6),d0
	bcs	L00dd42
L00e22a:
	move.l	($000e,a6),($000a,a0)
L00e230:
	addq.l	#2,a7
	move.w	#$0001,(a0)
	moveq.l	#$06,d0
	movea.l	(smbuf),a1
L00e23e:
	move.w	(a0)+,(a1)+
	dbra	d0,L00e23e
	rts

L00e246:
	tst.w	($0006,a0)
	beq	L00e25a
	cmpi.w	#$0001,($0006,a0)
	beq	L00e262
	move.l	(a1),($000a,a0)
	bra	L00e230

L00e25a:
	move.b	(a1),d0
	move.l	d0,($000a,a0)
	bra	L00e230

L00e262:
	move.w	(a1),d0
	move.l	d0,($000a,a0)
	bra	L00e230

L00e26a:
	clr.w	(L00e3aa)
	move.w	#$0000,($001e,a6)
	lea.l	($06e4,a6),a4
L00e27a:
	tst.w	(a4)
	bmi	L00e382
	addq.w	#1,(L00e3aa)
	move.w	#$0030,d0		;'0'
	add.w	($001e,a6),d0
	cmp.w	#$003a,d0		;':'
	bcs	L00e296
	addq.w	#7,d0
L00e296:
	jsr	(putch)
	jsr	(putspc)
	tst.w	(a4)
	beq	L00e2ac
	move.b	#$65,d0			;'e'
	bra	L00e2b0

L00e2ac:
	move.b	#$64,d0			;'d'
L00e2b0:
	jsr	(putch)
	jsr	(putspc)
	move.l	($0002,a4),d1
	jsr	(putlhex)
	move.b	#$28,d0			;'('
	jsr	(putch)
	move.b	#$73,d0			;'s'
	move.w	($0006,a4),d1
	beq	L00e2e6
	move.b	#$77,d0			;'w'
	subq.w	#1,d1
	beq	L00e2e6
	move.b	#$6c,d0			;'l'
L00e2e6:
	jsr	(putch)
	jsr	(putspc)
	move.w	($0008,a4),d0
	add.w	#$0030,d0
	jsr	(putch)
	jsr	(putspc)
	move.l	($000a,a4),d1
	jsr	(putlhex)
	move.b	#$29,d0			;')'
	jsr	(putch)
	jsr	(puttab)
	move.b	#$3b,d0			;';'
	jsr	(putch)
	move.l	($0002,a4),d1
	jsr	(putlhex)
	move.l	($0002,a4),d0
	jsr	(valsch)
	tst.l	d0
	bmi	L00e354
	movea.l	d0,a0
	move.b	#$2e,d0			;'.'
	jsr	(putch)
	jsr	(print)
L00e354:
	move.b	#$28,d0			;'('
	jsr	(putch)
	movea.l	($0002,a4),a0
	move.w	($0006,a4),($0466,a6)
	addq.w	#1,($0466,a6)
	jsr	(memput)
	move.b	#$29,d0			;')'
	jsr	(putch)
	jsr	(newline)
L00e382:
	lea.l	($000e,a4),a4
	addq.w	#1,($001e,a6)
	cmpi.w	#$000a,($001e,a6)
	bne	L00e27a
	tst.w	(L00e3aa)
	bne	L00e3a8
	lea.l	(L00e516),a0
	jsr	(print)
L00e3a8:
	rts

L00e3aa:
	.dc.w	$0000
L00e3ac:
	moveq.l	#$ff,d1
	jsr	(L00e3c2)
	rts

L00e3b6:
	moveq.l	#$ff,d1
	bra	L00e462

L00e3bc:
	moveq.l	#$01,d1
	bra	L00e3c2

L00e3c0:
	moveq.l	#$00,d1
L00e3c2:
	clr.w	($0000.w,a6)
L00e3c6:
	jsr	(skpblk)
	tst.b	d0
	beq	L00e422
	cmp.b	#$3a,d0			;':'
	beq	L00e422
	cmp.b	#$2a,d0			;'*'
	beq	L00e460
	cmp.b	#$2c,d0			;','
	bne	L00e3f6
	addq.l	#1,a5
	tst.w	($0000.w,a6)
	beq	L00e47a
	move.w	#$0001,($093e,a6)
	bra	L00e3c6

L00e3f6:
	clr.w	($093e,a6)
	move.w	d1,-(a7)
	jsr	(getexp)
	bcs	L00e4ca
	move.w	(a7)+,d1
	move.w	($0000.w,a6),d0
	lsl.w	#2,d0
	move.l	d6,($02,a6,d0.w)
	addq.w	#1,($0000.w,a6)
	cmpi.w	#$0008,($0000.w,a6)
	bcs	L00e3c6
	bra.w	L00e422

L00e422:
	tst.w	($093e,a6)
	bne	L00e47a
	tst.w	($0000.w,a6)
	beq	L00e4ba
	lea.l	($06e4,a6),a4
	lea.l	($0002,a6),a3
L00e438:
	move.l	(a3)+,d0
	cmp.l	#$0000000a,d0
	bcc	L00e4ca
	mulu.w	#$000e,d0
	tst.w	(a4,d0.w)
	bmi	L00e452
	move.w	d1,(a4,d0.w)
L00e452:
	subq.w	#1,($0000.w,a6)
	bne	L00e438
	rts

mtclr::
	move.w	#$ffff,d1
	bra	L00e462

L00e460:
	addq.l	#1,a5
L00e462:
	move.w	#$0009,d0
	lea.l	($06e4,a6),a4
L00e46a:
	tst.w	(a4)
	bmi	L00e470
	move.w	d1,(a4)
L00e470:
	lea.l	($000e,a4),a4
	dbra	d0,L00e46a
	rts

L00e47a:
	clr.w	($093e,a6)
	bra	L00dd42

L00e482:
	clr.l	d0
	lea.l	($06e4,a6),a4
L00e488:
	tst.w	(a4)
	bmi	L00e49e
	lea.l	($000e,a4),a4
	addq.l	#1,d0
	cmp.w	#$000a,d0
	bne	L00e488
	ori.b	#$01,ccr
	rts

L00e49e:
	andi.b	#$7e,ccr
	rts

L00e4a4:
	moveq.l	#$04,d1
	lea.l	($0002,a6),a0
L00e4aa:
	move.l	(a0),d2
	move.l	d0,(a0)+
	move.l	d2,d0
	dbra	d1,L00e4aa
	addq.w	#1,($0000.w,a6)
	rts

L00e4ba:
	lea.l	(L00e530),a0
	bra	L00e4d0

L00e4c2:
	lea.l	(L00e4fa),a0
	bra	L00e4d0

L00e4ca:
	lea.l	(L00e4dc),a0
L00e4d0:
	jsr	(print)
	jmp	(main)

L00e4dc:
	.dc.b	'Bad checkpoint number (0-9)',$0d,$0a,$00
L00e4fa:
	.dc.b	'memory check pointer over',$0d,$0a,$00
L00e516:
	.dc.b	'no memory check pointer',$0d,$0a,$00
L00e530:
	.dc.b	'Checkpoint list or ',$27,'*',$27,' expected',$0d,$0a,$00
set::
	move.w	#$0001,($0314,a6)
	move.w	#$0001,($0312,a6)
	move.b	(a5)+,d0
	jsr	(toupper)
	cmpi.b	#$4e,d0			;'N'
	bne	L00e578
	clr.w	($0314,a6)
	move.b	(a5)+,d0
	jsr	(toupper)
L00e578:
	cmpi.b	#$53,d0			;'S'
	bne	L00e584
	clr.w	($0312,a6)
	bra	L00e5a8

L00e584:
	cmpi.b	#$57,d0			;'W'
	beq	L00e5a8
	cmpi.b	#$4c,d0			;'L'
	bne	L00e598
	move.w	#$0002,($0312,a6)
	bra	L00e5a8

L00e598:
	cmpi.b	#$50,d0			;'P'
	bne	L00e5a6
	move.w	#$0003,($0312,a6)
	bra	L00e5a8

L00e5a6:
	move.b	-(a5),d0
L00e5a8:
	jsr	(skpblk)
	tst.b	d0
	beq	L00e5ec
	cmp.b	#$3a,d0			;':'
	beq	L00e5ec
	jsr	(getexp)
	bcs	L00e5e6
	move.l	d6,($002e,a6)
	jsr	(skpblk)
	tst.b	d0
	beq	L00e5ec
	cmp.b	#$3a,d0			;':'
	beq	L00e5ec
	jsr	(getdta)
	tst.w	d7
	beq	L00e5ec
	jsr	(L00e70e)
	rts

L00e5e6:
	jmp	(badpar)

L00e5ec:
	move.l	a5,-(a7)
	tst.w	($0312,a6)
	beq	L00e608
	cmpi.w	#$0003,($0312,a6)
	beq	L00e608
	move.l	($002e,a6),d0
	bclr.l	#$00,d0
	move.l	d0,($002e,a6)
L00e608:
	move.l	($002e,a6),d1
	jsr	(putlhex)
	jsr	(puttab)
	tst.w	($0314,a6)
	beq	L00e656
	movea.l	($002e,a6),a2
	cmpi.w	#$0003,($0312,a6)
	beq	L00e634
	cmpi.w	#$0001,($0312,a6)
	bhi	L00e648
	beq	L00e63e
L00e634:
	move.b	(a2),d1
	jsr	(putshex)
	bra	L00e650

L00e63e:
	move.w	(a2),d1
	jsr	(putwhex)
	bra	L00e650

L00e648:
	move.l	(a2),d1
	jsr	(putlhex)
L00e650:
	jsr	(putspc)
L00e656:
	jsr	(input)
	jsr	(skpblk2)
	cmpi.b	#$3b,d0			;';'
	beq	L00e692
	tst.b	d0
	beq	L00e6d2
	cmp.b	#$5e,d0			;'^'
	beq	L00e6f0
	cmpi.b	#$2d,d0			;'-'
	bne	L00e684
	jsr	(skpblk)
	tst.b	d0
	beq	L00e6f0
	bra	L00e69c

L00e684:
	cmpi.b	#$2e,d0			;'.'
	bne	L00e69c
	jsr	(skpblk)
	bne	L00e69c
L00e692:
	jsr	(newline)
	movea.l	(a7)+,a5
	rts

L00e69c:
	lea.l	($059c,a6),a5
	jsr	(getexp)
	bcc	L00e6b2
	jsr	(undef)
	bra	L00e608

L00e6b2:
	movea.l	($002e,a6),a2
	cmpi.w	#$0003,($0312,a6)
	beq	L00e6c8
	cmpi.w	#$0001,($0312,a6)
	bhi	L00e6d0
	beq	L00e6cc
L00e6c8:
	move.b	d6,(a2)+
	bra	L00e6d2

L00e6cc:
	move.w	d6,(a2)+
	bra	L00e6d2

L00e6d0:
	move.l	d6,(a2)+
L00e6d2:
	clr.l	d0
	move.w	($0312,a6),d0
	cmpi.w	#$0003,d0
	bne	L00e6e2
	moveq.l	#$02,d0
	bra	L00e6e8

L00e6e2:
	add.w	d0,d0
	bne	L00e6e8
	moveq.l	#$01,d0
L00e6e8:
	add.l	d0,($002e,a6)
	bra	L00e608

L00e6f0:
	clr.l	d0
	move.w	($0312,a6),d0
	cmpi.w	#$0003,d0
	bne	L00e700
	moveq.l	#$02,d0
	bra	L00e706

L00e700:
	add.w	d0,d0
	bne	L00e706
	moveq.l	#$01,d0
L00e706:
	sub.l	d0,($002e,a6)
	bra	L00e608

L00e70e:
	lea.l	($059c,a6),a1
	movea.l	($002e,a6),a0
	tst.w	($0312,a6)
	beq	L00e730
	cmpi.w	#$0003,($0312,a6)
	beq	L00e73a
	lsr.w	#1,d7
	subq.w	#1,d7
L00e728:
	move.w	(a1)+,(a0)+
	dbra	d7,L00e728
	rts

L00e730:
	subq.w	#1,d7
L00e732:
	move.b	(a1)+,(a0)+
	dbra	d7,L00e732
	rts

L00e73a:
	subq.w	#1,d7
L00e73c:
	move.b	(a1)+,(a0)+
	addq.l	#1,a0
	dbra	d7,L00e73c
skpblk::
	move.b	(a5)+,d0
	cmpi.b	#$20,d0			;' '
	beq	skpblk
	cmpi.b	#$09,d0
	beq	skpblk
	move.b	-(a5),d0
	rts

skpblk2::
	move.b	(a5)+,d0
	cmpi.b	#$20,d0			;' '
	beq	skpblk2
	cmpi.b	#$09,d0
	beq	skpblk2
	rts

ishex::
	jsr	(toupper)
	cmpi.b	#$30,d0			;'0'
	bcs	L00e792
	cmpi.b	#$3a,d0			;':'
	bcs	L00e78e
	cmpi.b	#$41,d0			;'A'
	bcs	L00e792
	cmpi.b	#$47,d0			;'G'
	bcs	L00e78e
	cmpi.b	#$61,d0			;'a'
	bcs	L00e792
	cmpi.b	#$67,d0			;'g'
L00e78e:
	eori.b	#$01,ccr
L00e792:
	rts

isnum::
	cmpi.b	#$39,d0			;'9'
	bhi	L00e7a0
	cmpi.b	#$30,d0			;'0'
	rts

L00e7a0:
	ori.b	#$01,ccr
	rts

isalpha::
	cmpi.b	#$20,d0			;' '
	bcs	L00e7b4
	cmpi.b	#$7f,d0
	eori.b	#$01,ccr
L00e7b4:
	rts

isalnum::
	cmpi.b	#$30,d0			;'0'
	bcs	L00e7ea
	cmpi.b	#$3a,d0			;':'
	bcs	L00e7e6
	cmpi.b	#$3f,d0			;'?'
	bls	L00e7ea
	cmpi.b	#$40,d0			;'@'
	beq	L00e7ea
	cmpi.b	#$5a,d0			;'Z'
	bcs	L00e7e6
	cmp.b	#$5f,d0			;'_'
	beq	L00e7e6
	bcs	L00e7ea
	cmp.b	#$60,d0			;'`'
	beq	L00e7ea
	cmp.b	#$7a,d0			;'z'
L00e7e6:
	eori.b	#$01,ccr
L00e7ea:
	rts

gettkn::
	move.b	(a0),d0
	beq	L00e84c
	cmp.b	#$2e,d0			;'.'
	beq	L00e82c
L00e7f6:
	move.b	(a0),d0
	cmp.b	#$30,d0			;'0'
	bcs	L00e84c
	cmp.b	#$3a,d0			;':'
	bcs	L00e82c
	cmp.b	#$3f,d0			;'?'
	bcs	L00e84c
	cmp.b	#$80,d0
	bcc	L00e832
	cmp.b	#$5b,d0			;'['
	bcs	L00e82c
	beq	L00e84c
	cmp.b	#$5d,d0			;']'
	beq	L00e84c
	cmp.b	#$7b,d0			;'{'
	bcs	L00e82c
	beq	L00e84c
	cmp.b	#$7d,d0			;'}'
	bls	L00e84c
L00e82c:
	addq.l	#1,a0
	move.b	d0,(a1)+
	bra	L00e7f6

L00e832:
	cmp.b	#$e0,d0
	bcc	L00e83e
	cmp.b	#$a0,d0
	bcc	L00e82c
L00e83e:
	addq.l	#1,a0
	move.b	d0,(a1)+
	move.b	(a0),d0
	cmp.b	#$20,d0			;' '
	bcc	L00e82c
	subq.l	#1,a1
L00e84c:
	clr.b	(a1)
	rts

strcmp::
	move.l	a5,-(a7)
L00e852:
	move.b	(a0),d0
	beq	L00e866
	move.b	(a5)+,d0
	jsr	(toupper)
	cmp.b	(a0)+,d0
	beq	L00e852
	movea.l	(a7)+,a5
	rts

L00e866:
	addq.l	#4,a7
	rts

toupper::
	cmpi.b	#$61,d0			;'a'
	bcs	L00e87a
	cmpi.b	#$7a,d0			;'z'
	bhi	L00e87a
	andi.b	#$df,d0
L00e87a:
	rts

chkdel::
	jsr	(skpblk)
	tst.b	d0
	beq	L00e88c
	cmpi.b	#$3a,d0			;':'
	bne	L00e88e
L00e88c:
	rts

L00e88e:
	jmp	(comerr)

symcnt::
	movea.l	($0450,a6),a0
	move.l	($0454,a6),d0
	movea.l	a0,a1
	adda.l	d0,a1
	clr.l	d1
L00e8a2:
	addq.l	#1,d1
	addq.l	#6,a0
L00e8a6:
	move.w	(a0)+,d0
	beq	L00e8ae
	tst.b	d0
	bne	L00e8a6
L00e8ae:
	cmpa.l	a1,a0
	bcs	L00e8a2
	move.l	d1,d0
	rts

symset::
	move.l	d0,d2
	movea.l	($0450,a6),a0
	move.l	($0454,a6),d0
	beq	L00e910
	movea.l	a0,a1
	adda.l	d0,a1
	movea.l	($044c,a6),a2
L00e8ca:
	move.l	a0,(a2)+
	move.w	(a0)+,d0
	and.w	#$00ff,d0
	beq	L00e8d6
	add.l	d2,(a0)
L00e8d6:
	addq.l	#4,a0
L00e8d8:
	move.w	(a0)+,d0
	beq	L00e8e0
	tst.b	d0
	bne	L00e8d8
L00e8e0:
	cmpa.l	a1,a0
	bcs	L00e8ca
	clr.l	(a2)
	movea.l	($044c,a6),a2
L00e8ea:
	move.l	a2,-(a7)
	moveq.l	#$ff,d1
L00e8ee:
	move.l	(a2)+,d0
	beq	L00e904
	movea.l	d0,a0
	cmp.l	($0002,a0),d1
	bcs	L00e8ee
	move.l	($0002,a0),d1
	lea.l	(-$0004,a2),a1
	bra	L00e8ee

L00e904:
	movea.l	(a7)+,a2
	move.l	(a1),d0
	move.l	(a2),(a1)
	move.l	d0,(a2)+
	tst.l	(a2)
	bne	L00e8ea
L00e910:
	rts

strsch::
	movem.l	a0-a3,-(a7)
	movea.l	a0,a2
	move.l	($044c,a6),d0
	beq	L00e94a
	movea.l	d0,a3
L00e920:
	move.l	(a3)+,d0
	beq	L00e94a
	movea.l	d0,a1
	addq.l	#6,a1
	movea.l	a2,a0
L00e92a:
	move.b	(a0)+,d0
	beq	L00e934
	cmp.b	(a1)+,d0
	beq	L00e92a
	bra	L00e920

L00e934:
	tst.b	(a1)
	bne	L00e920
	move.l	(-$0004,a3),d0
	movea.l	d0,a0
	move.l	($0002,a0),d0
	moveq.l	#$00,d1
L00e944:
	movem.l	(a7)+,a0-a3
	rts

L00e94a:
	moveq.l	#$ff,d1
	bra	L00e944

valsch::
	movem.l	d1/a0-a1,-(a7)
	move.l	($044c,a6),d1
	beq	L00e970
	movea.l	d1,a1
L00e95a:
	move.l	(a1)+,d1
	beq	L00e970
	movea.l	d1,a0
	cmp.l	($0002,a0),d0
	bne	L00e95a
	move.l	a0,d0
	addq.l	#6,d0
L00e96a:
	movem.l	(a7)+,d1/a0-a1
	rts

L00e970:
	moveq.l	#$ff,d0
	bra	L00e96a

mpu_check::
	moveq.l	#$00,d0
	tst.b	($0cbc)
	sne.b	d0
	and.b	#$14,d0
	rts

isFPCP::
	moveq.l	#$00,d0
	tst.b	($0cbd)
	sne.b	d0
	ext.w	d0
	ext.l	d0
	rts

isPMMU::
	moveq.l	#$00,d0
	tst.b	($0cbe)
	sne.b	d0
	ext.w	d0
	ext.l	d0
	rts

inivset_20::
	lea.l	(L012082),a0
	bsr	L00f6c8
	adda.l	#$00000008,a1
	move.l	#$000000f4,d0
	bsr	L00e9ea
	rts

L00e9b8:
	lea.l	(L012082),a0
	bsr	L00f6c8
	adda.l	#$00000008,a1
	move.l	#$00000074.l,d0
	bsr	L00e9ea
	lea.l	(L01210a),a0
	bsr	L00f6c8
	adda.l	#$00000090,a1
	move.l	#$0000006c.l,d0
	bsr	L00e9ea
	rts

L00e9ea:
	move.l	(a0)+,-(a7)
	beq	L00e9f6
	move.l	(a7)+,(a1)+
	subq.l	#4,d0
	bpl	L00e9ea
	rts

L00e9f6:
	addq.l	#4,a7
	addq.l	#4,a1
	subq.l	#4,d0
	bpl	L00e9ea
	rts

L00ea00:
	.dc.b	$23,$c8
	.dc.l	L0129da
	.dc.b	$4a,$79
	.dc.l	L0129d6
	.dc.b	$67,$00,$0d,$c6,$4e,$7a,$80,$00,$23,$c8
	.dc.l	L0129e6
	.dc.b	$4e,$7a,$80,$01,$23,$c8
	.dc.l	L0129ea
	.dc.b	$4e,$7a,$88,$01,$23,$c8
	.dc.l	L0129f6
	.dc.b	$4e,$7a,$88,$02,$23,$c8
	.dc.l	L0129f2
	.dc.b	$20,$79
	.dc.l	L0129da
	.dc.b	$4e,$75
L00ea40:
	.dc.b	$46,$fc,$27,$00,$23,$cf
	.dc.l	L012d76
	.dc.b	$23,$c8
	.dc.l	L0129da
	.dc.b	$4e,$7a,$80,$02,$23,$c8
	.dc.l	L012d82
	.dc.b	$20,$7c,$00,$00,$08,$08,$4e,$7b,$80,$02,$4e,$7a,$88,$03,$23,$c8
	.dc.l	L012d7a
	.dc.b	$4e,$7a,$88,$04,$23,$c8
	.dc.l	L012d7e
	.dc.b	$20,$79
	.dc.l	L0129da
	.dc.b	$4f,$f9
	.dc.l	errstk
	.dc.b	$46,$fc,$20,$00,$61,$00,$0c,$98,$62,$75,$73,$20,$65,$72,$72,$6f
	.dc.b	$72,$00
L00ea96:
	.dc.b	$46,$fc,$27,$00,$23,$cf
	.dc.l	L012d76
	.dc.b	$23,$c8
	.dc.l	L0129da
	.dc.b	$4e,$7a,$80,$02,$23,$c8
	.dc.l	L012d82
	.dc.b	$20,$7c,$00,$00,$08,$08,$4e,$7b,$80,$02,$4e,$7a,$88,$03,$23,$c8
	.dc.l	L012d7a
	.dc.b	$4e,$7a,$88,$04,$23,$c8
	.dc.l	L012d7e
	.dc.b	$20,$79
	.dc.l	L0129da
	.dc.b	$4f,$f9
	.dc.l	errstk
	.dc.b	$46,$fc,$20,$00,$61,$00,$0c,$42,$61,$64,$64,$72,$65,$73,$73,$20
	.dc.b	$65,$72,$72,$6f,$72,$00
L00eaf0:
	.dc.b	$46,$fc,$27,$00,$23,$cf
	.dc.l	L012d76
	.dc.b	$23,$c8
	.dc.l	L0129da
	.dc.b	$4e,$7a,$80,$02,$23,$c8
	.dc.l	L012d82
	.dc.b	$20,$7c,$00,$00,$08,$08,$4e,$7b,$80,$02,$4e,$7a,$88,$03,$23,$c8
	.dc.l	L012d7a
	.dc.b	$4e,$7a,$88,$04,$23,$c8
	.dc.l	L012d7e
	.dc.b	$20,$79
	.dc.l	L0129da
	.dc.b	$4f,$f9
	.dc.l	errstk
	.dc.b	$46,$fc,$20,$00,$61,$00,$0b,$e8,$75,$6e,$64,$65,$66,$69,$6e,$65
	.dc.b	$64,$20,$69,$6e,$73,$74,$72,$75,$63,$74,$69,$6f,$6e,$00
L00eb52:
	.dc.b	$46,$fc,$27,$00,$23,$cf
	.dc.l	L012d76
	.dc.b	$23,$c8
	.dc.l	L0129da
	.dc.b	$4e,$7a,$80,$02,$23,$c8
	.dc.l	L012d82
	.dc.b	$20,$7c,$00,$00,$08,$08,$4e,$7b,$80,$02,$4e,$7a,$88,$03,$23,$c8
	.dc.l	L012d7a
	.dc.b	$4e,$7a,$88,$04,$23,$c8
	.dc.l	L012d7e
	.dc.b	$20,$79
	.dc.l	L0129da
	.dc.b	$4f,$f9
	.dc.l	errstk
	.dc.b	$46,$fc,$20,$00,$61,$00,$0b,$86,$7a,$65,$72,$6f,$20,$64,$69,$76
	.dc.b	$69,$64,$65,$00
L00ebaa:
	.dc.b	$46,$fc,$27,$00,$23,$cf
	.dc.l	L012d76
	.dc.b	$23,$c8
	.dc.l	L0129da
	.dc.b	$4e,$7a,$80,$02,$23,$c8
	.dc.l	L012d82
	.dc.b	$20,$7c,$00,$00,$08,$08,$4e,$7b,$80,$02,$4e,$7a,$88,$03,$23,$c8
	.dc.l	L012d7a
	.dc.b	$4e,$7a,$88,$04,$23,$c8
	.dc.l	L012d7e
	.dc.b	$20,$79
	.dc.l	L0129da
	.dc.b	$4f,$f9
	.dc.l	errstk
	.dc.b	$46,$fc,$20,$00,$61,$00,$0b,$2e,$43,$48,$4b,$2c,$20,$43,$48,$4b
	.dc.b	$32,$20,$69,$6e,$73,$74,$72,$75,$63,$74,$69,$6f,$6e,$73,$00,$00
L00ec0e:
	.dc.b	$46,$fc,$27,$00,$23,$cf
	.dc.l	L012d76
	.dc.b	$23,$c8
	.dc.l	L0129da
	.dc.b	$4e,$7a,$80,$02,$23,$c8
	.dc.l	L012d82
	.dc.b	$20,$7c,$00,$00,$08,$08,$4e,$7b,$80,$02,$4e,$7a,$88,$03,$23,$c8
	.dc.l	L012d7a
	.dc.b	$4e,$7a,$88,$04,$23,$c8
	.dc.l	L012d7e
	.dc.b	$20,$79
	.dc.l	L0129da
	.dc.b	$4f,$f9
	.dc.l	errstk
	.dc.b	$46,$fc,$20,$00,$61,$00,$0a,$ca,$63,$70,$54,$52,$41,$50,$63,$63
	.dc.b	$2c,$20,$54,$52,$41,$50,$63,$63,$2c,$20,$54,$52,$41,$50,$56,$20
	.dc.b	$69,$6e,$73,$74,$72,$75,$63,$74,$69,$6f,$6e,$73,$00,$00,$46,$fc
	.dc.b	$27,$00,$23,$cf
	.dc.l	L012d76
	.dc.b	$23,$c8
	.dc.l	L0129da
	.dc.b	$4e,$7a,$80,$02,$23,$c8
	.dc.l	L012d82
	.dc.b	$20,$7c,$00,$00,$08,$08,$4e,$7b,$80,$02,$4e,$7a,$88,$03,$23,$c8
	.dc.l	L012d7a
	.dc.b	$4e,$7a,$88,$04,$23,$c8
	.dc.l	L012d7e
	.dc.b	$20,$79
	.dc.l	L0129da
	.dc.b	$4f,$f9
	.dc.l	errstk
	.dc.b	$46,$fc,$20,$00,$61,$00,$0a,$58,$70,$72,$69,$76,$69,$6c,$65,$67
	.dc.b	$65,$20,$76,$69,$6f,$6c,$61,$74,$69,$6f,$6e,$00
tracei_20::
	.dc.b	$46,$fc,$27,$00,$23,$cf
	.dc.l	L012d76
	.dc.b	$23,$c8
	.dc.l	L0129da
	.dc.b	$4e,$7a,$80,$02,$23,$c8
	.dc.l	L012d82
	.dc.b	$20,$7c,$00,$00,$08,$08,$4e,$7b,$80,$02,$4e,$7a,$88,$03,$23,$c8
	.dc.l	L012d7a
	.dc.b	$4e,$7a,$88,$04,$23,$c8
	.dc.l	L012d7e
	.dc.b	$20,$79
	.dc.l	L0129da
	.dc.b	$4f,$f9
	.dc.l	errstk
	.dc.b	$46,$fc,$20,$00,$61,$00,$09,$f8,$74,$72,$61,$63,$65,$00,$46,$fc
	.dc.b	$27,$00,$23,$cf
	.dc.l	L012d76
	.dc.b	$23,$c8
	.dc.l	L0129da
	.dc.b	$4e,$7a,$80,$02,$23,$c8
	.dc.l	L012d82
	.dc.b	$20,$7c,$00,$00,$08,$08,$4e,$7b,$80,$02,$4e,$7a,$88,$03,$23,$c8
	.dc.l	L012d7a
	.dc.b	$4e,$7a,$88,$04,$23,$c8
	.dc.l	L012d7e
	.dc.b	$20,$79
	.dc.l	L0129da
	.dc.b	$4f,$f9
	.dc.l	errstk
	.dc.b	$46,$fc,$20,$00,$61,$00,$09,$a6,$6c,$69,$6e,$65,$20,$31,$30,$31
	.dc.b	$30,$20,$65,$6d,$75,$6c,$61,$74,$6f,$72,$00,$00,$46,$fc,$27,$00
	.dc.b	$23,$cf
	.dc.l	L012d76
	.dc.b	$23,$c8
	.dc.l	L0129da
	.dc.b	$4e,$7a,$80,$02,$23,$c8
	.dc.l	L012d82
	.dc.b	$20,$7c,$00,$00,$08,$08,$4e,$7b,$80,$02,$4e,$7a,$88,$03,$23,$c8
	.dc.l	L012d7a
	.dc.b	$4e,$7a,$88,$04,$23,$c8
	.dc.l	L012d7e
	.dc.b	$20,$79
	.dc.l	L0129da
	.dc.b	$4f,$f9
	.dc.l	errstk
	.dc.b	$46,$fc,$20,$00,$61,$00,$09,$46,$6c,$69,$6e,$65,$20,$31,$31,$31
	.dc.b	$31,$20,$65,$6d,$75,$6c,$61,$74,$6f,$72,$00,$00
L00edf2:
	.dc.b	$46,$fc,$27,$00,$23,$cf
	.dc.l	L012d76
	.dc.b	$23,$c8
	.dc.l	L0129da
	.dc.b	$4e,$7a,$80,$02,$23,$c8
	.dc.l	L012d82
	.dc.b	$20,$7c,$00,$00,$08,$08,$4e,$7b,$80,$02,$4e,$7a,$88,$03,$23,$c8
	.dc.l	L012d7a
	.dc.b	$4e,$7a,$88,$04,$23,$c8
	.dc.l	L012d7e
	.dc.b	$20,$79
	.dc.l	L0129da
	.dc.b	$4f,$f9
	.dc.l	errstk
	.dc.b	$46,$fc,$20,$00,$61,$00,$08,$e6,$75,$6e,$61,$73,$73,$69,$67,$6e
	.dc.b	$65,$64,$2c,$20,$72,$65,$73,$65,$72,$76,$65,$64,$00,$00
L00ee54:
	.dc.b	$46,$fc,$27,$00,$23,$cf
	.dc.l	L012d76
	.dc.b	$23,$c8
	.dc.l	L0129da
	.dc.b	$4e,$7a,$80,$02,$23,$c8
	.dc.l	L012d82
	.dc.b	$20,$7c,$00,$00,$08,$08,$4e,$7b,$80,$02,$4e,$7a,$88,$03,$23,$c8
	.dc.l	L012d7a
	.dc.b	$4e,$7a,$88,$04,$23,$c8
	.dc.l	L012d7e
	.dc.b	$20,$79
	.dc.l	L0129da
	.dc.b	$4f,$f9
	.dc.l	errstk
	.dc.b	$46,$fc,$20,$00,$61,$00,$08,$84,$63,$6f,$70,$72,$6f,$63,$65,$73
	.dc.b	$73,$6f,$72,$20,$70,$72,$6f,$74,$6f,$63,$6f,$6c,$20,$76,$69,$6f
	.dc.b	$6c,$61,$74,$69,$6f,$6e,$00,$00
L00eec0:
	.dc.b	$46,$fc,$27,$00,$23,$cf
	.dc.l	L012d76
	.dc.b	$23,$c8
	.dc.l	L0129da
	.dc.b	$4e,$7a,$80,$02,$23,$c8
	.dc.l	L012d82
	.dc.b	$20,$7c,$00,$00,$08,$08,$4e,$7b,$80,$02,$4e,$7a,$88,$03,$23,$c8
	.dc.l	L012d7a
	.dc.b	$4e,$7a,$88,$04,$23,$c8
	.dc.l	L012d7e
	.dc.b	$20,$79
	.dc.l	L0129da
	.dc.b	$4f,$f9
	.dc.l	errstk
	.dc.b	$46,$fc,$20,$00,$61,$00,$08,$18,$66,$6f,$72,$6d,$61,$74,$20,$65
	.dc.b	$72,$72,$6f,$72,$00,$00
L00ef1a:
	.dc.b	$46,$fc,$27,$00,$23,$cf
	.dc.l	L012d76
	.dc.b	$23,$c8
	.dc.l	L0129da
	.dc.b	$4e,$7a,$80,$02,$23,$c8
	.dc.l	L012d82
	.dc.b	$20,$7c,$00,$00,$08,$08,$4e,$7b,$80,$02,$4e,$7a,$88,$03,$23,$c8
	.dc.l	L012d7a
	.dc.b	$4e,$7a,$88,$04,$23,$c8
	.dc.l	L012d7e
	.dc.b	$20,$79
	.dc.l	L0129da
	.dc.b	$4f,$f9
	.dc.l	errstk
	.dc.b	$46,$fc,$20,$00,$61,$00,$07,$be,$75,$6e,$69,$6e,$69,$74,$69,$61
	.dc.b	$6c,$69,$7a,$65,$64,$20,$69,$6e,$74,$65,$72,$72,$75,$70,$74,$20
	.dc.b	$76,$65,$63,$74,$6f,$72,$00,$00
L00ef86:
	.dc.b	$46,$fc,$27,$00,$23,$cf
	.dc.l	L012d76
	.dc.b	$23,$c8
	.dc.l	L0129da
	.dc.b	$4e,$7a,$80,$02,$23,$c8
	.dc.l	L012d82
	.dc.b	$20,$7c,$00,$00,$08,$08,$4e,$7b,$80,$02,$4e,$7a,$88,$03,$23,$c8
	.dc.l	L012d7a
	.dc.b	$4e,$7a,$88,$04,$23,$c8
	.dc.l	L012d7e
	.dc.b	$20,$79
	.dc.l	L0129da
	.dc.b	$4f,$f9
	.dc.l	errstk
	.dc.b	$46,$fc,$20,$00,$61,$00,$07,$52,$73,$70,$75,$72,$69,$6f,$75,$73
	.dc.b	$20,$69,$6e,$74,$65,$72,$72,$75,$70,$74,$00,$00
L00efe6:
	.dc.b	$46,$fc,$27,$00,$23,$cf
	.dc.l	L012d76
	.dc.b	$23,$c8
	.dc.l	L0129da
	.dc.b	$4e,$7a,$80,$02,$23,$c8
	.dc.l	L012d82
	.dc.b	$20,$7c,$00,$00,$08,$08,$4e,$7b,$80,$02,$4e,$7a,$88,$03,$23,$c8
	.dc.l	L012d7a
	.dc.b	$4e,$7a,$88,$04,$23,$c8
	.dc.l	L012d7e
	.dc.b	$20,$79
	.dc.l	L0129da
	.dc.b	$4f,$f9
	.dc.l	errstk
	.dc.b	$46,$fc,$20,$00,$61,$00,$06,$f2,$6c,$65,$76,$65,$6c,$20,$31,$20
	.dc.b	$61,$75,$74,$6f,$76,$65,$63,$74,$6f,$72,$00,$00
L00f046:
	.dc.b	$46,$fc,$27,$00,$23,$cf
	.dc.l	L012d76
	.dc.b	$23,$c8
	.dc.l	L0129da
	.dc.b	$4e,$7a,$80,$02,$23,$c8
	.dc.l	L012d82
	.dc.b	$20,$7c,$00,$00,$08,$08,$4e,$7b,$80,$02,$4e,$7a,$88,$03,$23,$c8
	.dc.l	L012d7a
	.dc.b	$4e,$7a,$88,$04,$23,$c8
	.dc.l	L012d7e
	.dc.b	$20,$79
	.dc.l	L0129da
	.dc.b	$4f,$f9
	.dc.l	errstk
	.dc.b	$46,$fc,$20,$00,$61,$00,$06,$92,$6c,$65,$76,$65,$6c,$20,$32,$20
	.dc.b	$61,$75,$74,$6f,$76,$65,$63,$74,$6f,$72,$00,$00
L00f0a6:
	.dc.b	$46,$fc,$27,$00,$23,$cf
	.dc.l	L012d76
	.dc.b	$23,$c8
	.dc.l	L0129da
	.dc.b	$4e,$7a,$80,$02,$23,$c8
	.dc.l	L012d82
	.dc.b	$20,$7c,$00,$00,$08,$08,$4e,$7b,$80,$02,$4e,$7a,$88,$03,$23,$c8
	.dc.l	L012d7a
	.dc.b	$4e,$7a,$88,$04,$23,$c8
	.dc.l	L012d7e
	.dc.b	$20,$79
	.dc.l	L0129da
	.dc.b	$4f,$f9
	.dc.l	errstk
	.dc.b	$46,$fc,$20,$00,$61,$00,$06,$32,$6c,$65,$76,$65,$6c,$20,$33,$20
	.dc.b	$61,$75,$74,$6f,$76,$65,$63,$74,$6f,$72,$00,$00
L00f106:
	.dc.b	$46,$fc,$27,$00,$23,$cf
	.dc.l	L012d76
	.dc.b	$23,$c8
	.dc.l	L0129da
	.dc.b	$4e,$7a,$80,$02,$23,$c8
	.dc.l	L012d82
	.dc.b	$20,$7c,$00,$00,$08,$08,$4e,$7b,$80,$02,$4e,$7a,$88,$03,$23,$c8
	.dc.l	L012d7a
	.dc.b	$4e,$7a,$88,$04,$23,$c8
	.dc.l	L012d7e
	.dc.b	$20,$79
	.dc.l	L0129da
	.dc.b	$4f,$f9
	.dc.l	errstk
	.dc.b	$46,$fc,$20,$00,$61,$00,$05,$d2,$6c,$65,$76,$65,$6c,$20,$34,$20
	.dc.b	$61,$75,$74,$6f,$76,$65,$63,$74,$6f,$72,$00,$00
L00f166:
	.dc.b	$46,$fc,$27,$00,$23,$cf
	.dc.l	L012d76
	.dc.b	$23,$c8
	.dc.l	L0129da
	.dc.b	$4e,$7a,$80,$02,$23,$c8
	.dc.l	L012d82
	.dc.b	$20,$7c,$00,$00,$08,$08,$4e,$7b,$80,$02,$4e,$7a,$88,$03,$23,$c8
	.dc.l	L012d7a
	.dc.b	$4e,$7a,$88,$04,$23,$c8
	.dc.l	L012d7e
	.dc.b	$20,$79
	.dc.l	L0129da
	.dc.b	$4f,$f9
	.dc.l	errstk
	.dc.b	$46,$fc,$20,$00,$61,$00,$05,$72,$6c,$65,$76,$65,$6c,$20,$35,$20
	.dc.b	$61,$75,$74,$6f,$76,$65,$63,$74,$6f,$72,$00,$00
L00f1c6:
	.dc.b	$46,$fc,$27,$00,$23,$cf
	.dc.l	L012d76
	.dc.b	$23,$c8
	.dc.l	L0129da
	.dc.b	$4e,$7a,$80,$02,$23,$c8
	.dc.l	L012d82
	.dc.b	$20,$7c,$00,$00,$08,$08,$4e,$7b,$80,$02,$4e,$7a,$88,$03,$23,$c8
	.dc.l	L012d7a
	.dc.b	$4e,$7a,$88,$04,$23,$c8
	.dc.l	L012d7e
	.dc.b	$20,$79
	.dc.l	L0129da
	.dc.b	$4f,$f9
	.dc.l	errstk
	.dc.b	$46,$fc,$20,$00,$61,$00,$05,$12,$6c,$65,$76,$65,$6c,$20,$36,$20
	.dc.b	$61,$75,$74,$6f,$76,$65,$63,$74,$6f,$72,$00,$00,$46,$fc,$27,$00
	.dc.b	$23,$cf
	.dc.l	L012d76
	.dc.b	$23,$c8
	.dc.l	L0129da
	.dc.b	$4e,$7a,$80,$02,$23,$c8
	.dc.l	L012d82
	.dc.b	$20,$7c,$00,$00,$08,$08,$4e,$7b,$80,$02,$4e,$7a,$88,$03,$23,$c8
	.dc.l	L012d7a
	.dc.b	$4e,$7a,$88,$04,$23,$c8
	.dc.l	L012d7e
	.dc.b	$20,$79
	.dc.l	L0129da
	.dc.b	$4f,$f9
	.dc.l	errstk
	.dc.b	$46,$fc,$20,$00,$61,$00,$04,$b2,$0d,$0a,$52,$4f,$4d,$20,$4d,$4f
	.dc.b	$4e,$49,$54,$4f,$52,$2c,$20,$6c,$65,$76,$65,$6c,$20,$37,$20,$69
	.dc.b	$6e,$74,$65,$72,$72,$75,$70,$74,$00,$00,$46,$fc,$27,$00,$23,$cf
	.dc.l	L012d76
	.dc.b	$23,$c8
	.dc.l	L0129da
	.dc.b	$4e,$7a,$80,$02,$23,$c8
	.dc.l	L012d82
	.dc.b	$20,$7c,$00,$00,$08,$08,$4e,$7b,$80,$02,$4e,$7a,$88,$03,$23,$c8
	.dc.l	L012d7a
	.dc.b	$4e,$7a,$88,$04,$23,$c8
	.dc.l	L012d7e
	.dc.b	$20,$79
	.dc.l	L0129da
	.dc.b	$4f,$f9
	.dc.l	errstk
	.dc.b	$46,$fc,$20,$00,$61,$00,$04,$44,$74,$72,$61,$70,$20,$69,$6e,$73
	.dc.b	$74,$72,$75,$63,$74,$69,$6f,$6e,$00,$00
L00f2f2:
	.dc.b	$46,$fc,$27,$00,$23,$cf
	.dc.l	L012d76
	.dc.b	$23,$c8
	.dc.l	L0129da
	.dc.b	$4e,$7a,$80,$02,$23,$c8
	.dc.l	L012d82
	.dc.b	$20,$7c,$00,$00,$08,$08,$4e,$7b,$80,$02,$4e,$7a,$88,$03,$23,$c8
	.dc.l	L012d7a
	.dc.b	$4e,$7a,$88,$04,$23,$c8
	.dc.l	L012d7e
	.dc.b	$20,$79
	.dc.l	L0129da
	.dc.b	$4f,$f9
	.dc.l	errstk
	.dc.b	$46,$fc,$20,$00,$61,$00,$03,$e6,$46,$50,$43,$50,$20,$62,$72,$61
	.dc.b	$6e,$63,$68,$20,$6f,$72,$20,$73,$65,$74,$20,$6f,$6e,$20,$75,$6e
	.dc.b	$6f,$72,$64,$65,$72,$65,$64,$20,$63,$6f,$6e,$64,$69,$74,$69,$6f
	.dc.b	$6e,$00
L00f368:
	.dc.b	$46,$fc,$27,$00,$23,$cf
	.dc.l	L012d76
	.dc.b	$23,$c8
	.dc.l	L0129da
	.dc.b	$4e,$7a,$80,$02,$23,$c8
	.dc.l	L012d82
	.dc.b	$20,$7c,$00,$00,$08,$08,$4e,$7b,$80,$02,$4e,$7a,$88,$03,$23,$c8
	.dc.l	L012d7a
	.dc.b	$4e,$7a,$88,$04,$23,$c8
	.dc.l	L012d7e
	.dc.b	$20,$79
	.dc.l	L0129da
	.dc.b	$4f,$f9
	.dc.l	errstk
	.dc.b	$46,$fc,$20,$00,$61,$00,$03,$70,$46,$50,$43,$50,$20,$69,$6e,$65
	.dc.b	$78,$61,$63,$74,$20,$72,$65,$73,$75,$6c,$74,$00
L00f3c8:
	.dc.b	$46,$fc,$27,$00,$23,$cf
	.dc.l	L012d76
	.dc.b	$23,$c8
	.dc.l	L0129da
	.dc.b	$4e,$7a,$80,$02,$23,$c8
	.dc.l	L012d82
	.dc.b	$20,$7c,$00,$00,$08,$08,$4e,$7b,$80,$02,$4e,$7a,$88,$03,$23,$c8
	.dc.l	L012d7a
	.dc.b	$4e,$7a,$88,$04,$23,$c8
	.dc.l	L012d7e
	.dc.b	$20,$79
	.dc.l	L0129da
	.dc.b	$4f,$f9
	.dc.l	errstk
	.dc.b	$46,$fc,$20,$00,$61,$00,$03,$10,$46,$50,$43,$50,$20,$64,$69,$76
	.dc.b	$69,$64,$65,$20,$62,$79,$20,$7a,$65,$72,$6f,$00
L00f428:
	.dc.b	$46,$fc,$27,$00,$23,$cf
	.dc.l	L012d76
	.dc.b	$23,$c8
	.dc.l	L0129da
	.dc.b	$4e,$7a,$80,$02,$23,$c8
	.dc.l	L012d82
	.dc.b	$20,$7c,$00,$00,$08,$08,$4e,$7b,$80,$02,$4e,$7a,$88,$03,$23,$c8
	.dc.l	L012d7a
	.dc.b	$4e,$7a,$88,$04,$23,$c8
	.dc.l	L012d7e
	.dc.b	$20,$79
	.dc.l	L0129da
	.dc.b	$4f,$f9
	.dc.l	errstk
	.dc.b	$46,$fc,$20,$00,$61,$00,$02,$b0,$46,$50,$43,$50,$20,$75,$6e,$64
	.dc.b	$65,$72,$66,$6c,$6f,$77,$00,$00
L00f484:
	.dc.b	$46,$fc,$27,$00,$23,$cf
	.dc.l	L012d76
	.dc.b	$23,$c8
	.dc.l	L0129da
	.dc.b	$4e,$7a,$80,$02,$23,$c8
	.dc.l	L012d82
	.dc.b	$20,$7c,$00,$00,$08,$08,$4e,$7b,$80,$02,$4e,$7a,$88,$03,$23,$c8
	.dc.l	L012d7a
	.dc.b	$4e,$7a,$88,$04,$23,$c8
	.dc.l	L012d7e
	.dc.b	$20,$79
	.dc.l	L0129da
	.dc.b	$4f,$f9
	.dc.l	errstk
	.dc.b	$46,$fc,$20,$00,$61,$00,$02,$54,$46,$50,$43,$50,$20,$6f,$70,$65
	.dc.b	$72,$61,$6e,$64,$20,$65,$72,$72,$6f,$72,$00,$00
L00f4e4:
	.dc.b	$46,$fc,$27,$00,$23,$cf
	.dc.l	L012d76
	.dc.b	$23,$c8
	.dc.l	L0129da
	.dc.b	$4e,$7a,$80,$02,$23,$c8
	.dc.l	L012d82
	.dc.b	$20,$7c,$00,$00,$08,$08,$4e,$7b,$80,$02,$4e,$7a,$88,$03,$23,$c8
	.dc.l	L012d7a
	.dc.b	$4e,$7a,$88,$04,$23,$c8
	.dc.l	L012d7e
	.dc.b	$20,$79
	.dc.l	L0129da
	.dc.b	$4f,$f9
	.dc.l	errstk
	.dc.b	$46,$fc,$20,$00,$61,$00,$01,$f4,$46,$50,$43,$50,$20,$6f,$76,$65
	.dc.b	$72,$66,$6c,$6f,$77,$00
L00f53e:
	.dc.b	$46,$fc,$27,$00,$23,$cf
	.dc.l	L012d76
	.dc.b	$23,$c8
	.dc.l	L0129da
	.dc.b	$4e,$7a,$80,$02,$23,$c8
	.dc.l	L012d82
	.dc.b	$20,$7c,$00,$00,$08,$08,$4e,$7b,$80,$02,$4e,$7a,$88,$03,$23,$c8
	.dc.l	L012d7a
	.dc.b	$4e,$7a,$88,$04,$23,$c8
	.dc.l	L012d7e
	.dc.b	$20,$79
	.dc.l	L0129da
	.dc.b	$4f,$f9
	.dc.l	errstk
	.dc.b	$46,$fc,$20,$00,$61,$00,$01,$9a,$46,$50,$43,$50,$20,$73,$69,$67
	.dc.b	$6e,$61,$6c,$69,$6e,$67,$20,$4e,$41,$4e,$00,$00
L00f59e:
	.dc.b	$46,$fc,$27,$00,$23,$cf
	.dc.l	L012d76
	.dc.b	$23,$c8
	.dc.l	L0129da
	.dc.b	$4e,$7a,$80,$02,$23,$c8
	.dc.l	L012d82
	.dc.b	$20,$7c,$00,$00,$08,$08,$4e,$7b,$80,$02,$4e,$7a,$88,$03,$23,$c8
	.dc.l	L012d7a
	.dc.b	$4e,$7a,$88,$04,$23,$c8
	.dc.l	L012d7e
	.dc.b	$20,$79
	.dc.l	L0129da
	.dc.b	$4f,$f9
	.dc.l	errstk
	.dc.b	$46,$fc,$20,$00,$61,$00,$01,$3a,$50,$4d,$4d,$55,$20,$63,$6f,$6e
	.dc.b	$66,$69,$67,$75,$72,$61,$74,$69,$6f,$6e,$00,$00
L00f5fe:
	.dc.b	$46,$fc,$27,$00,$23,$cf
	.dc.l	L012d76
	.dc.b	$23,$c8
	.dc.l	L0129da
	.dc.b	$4e,$7a,$80,$02,$23,$c8
	.dc.l	L012d82
	.dc.b	$20,$7c,$00,$00,$08,$08,$4e,$7b,$80,$02,$4e,$7a,$88,$03,$23,$c8
	.dc.l	L012d7a
	.dc.b	$4e,$7a,$88,$04,$23,$c8
	.dc.l	L012d7e
	.dc.b	$20,$79
	.dc.l	L0129da
	.dc.b	$4f,$f9
	.dc.l	errstk
	.dc.b	$46,$fc,$20,$00,$61,$00,$00,$da,$50,$4d,$4d,$55,$20,$69,$6c,$6c
	.dc.b	$65,$67,$61,$6c,$20,$6f,$70,$65,$72,$61,$74,$69,$6f,$6e,$00,$00
L00f662:
	.dc.b	$46,$fc,$27,$00,$23,$cf
	.dc.l	L012d76
	.dc.b	$23,$c8
	.dc.l	L0129da
	.dc.b	$4e,$7a,$80,$02,$23,$c8
	.dc.l	L012d82
	.dc.b	$20,$7c,$00,$00,$08,$08,$4e,$7b,$80,$02,$4e,$7a,$88,$03,$23,$c8
	.dc.l	L012d7a
	.dc.b	$4e,$7a,$88,$04,$23,$c8
	.dc.l	L012d7e
	.dc.b	$20,$79
	.dc.l	L0129da
	.dc.b	$4f,$f9
	.dc.l	errstk
	.dc.b	$46,$fc,$20,$00,$61,$76,$50,$4d,$4d,$55,$20,$61,$63,$63,$65,$73
	.dc.b	$73,$20,$6c,$65,$76,$65,$6c,$20,$76,$69,$6f,$6c,$61,$74,$69,$6f
	.dc.b	$6e,$00
L00f6c8:
	.dc.b	$4e,$7a,$98,$01,$b3,$ee,$07,$f0,$66,$02,$4e,$75
L00f6d4:
	move.l	a1,($07f0,a6)
	movem.l	d0-d7/a0/a2-a6,-(a7)
	lea.l	(L00f6f2),a0
	jsr	(print)
	movea.l	($07f0,a6),a1
	movem.l	(a7)+,d0-d7/a0/a2-a6
	rts

L00f6f2:
	.dc.b	$0d,$0a
	.dc.b	'Vector Base Register content is changed !!',$0d,$0a,$00,$00
L00f722:
	.dc.b	$61,$00,$f2,$dc,$48,$e7,$ff,$fe,$4d,$f9
	.dc.l	work
	.dc.b	$4e,$b9
	.dc.l	resbp
	.dc.b	$2f,$39
	.dc.l	monpdb
	.dc.b	$ff,$80,$58,$8f,$b0,$b9
	.dc.l	monpdb
	.dc.b	$66,$40,$4c,$df,$7f,$ff,$4d,$f9
	.dc.l	work
	.dc.b	$4e,$b9
	.dc.l	newline
	.dc.b	$4e,$b9
	.dc.l	newline
L00f75e:
	.dc.b	' WN¹'
L00f762:
	.dc.l	print
	.dc.b	$41,$f9
	.dc.l	L01217a
	.dc.b	$4e,$b9
	.dc.l	print
	.dc.b	$60,$00,$04,$50
L00f776:
	.dc.b	$2e,$79
	.dc.l	L012d8a
	.dc.b	$23,$f9
	.dc.l	L012d8e
	.dc.b	$00,$00,$00,$34,$60,$34,$23,$c0
	.dc.l	usrpdb
	.dc.b	$4c,$df,$7f,$ff,$48,$f9,$7f,$ff
	.dc.l	L01225c
	.dc.b	$4a,$79
	.dc.l	L0129d8
L00f7a0:
	.dc.b	'g2#Ï'
L00f7a4:
	.dc.l	L012d8a
	.dc.b	$23,$f9,$00,$00,$00,$34
	.dc.l	L012d8e
	.dc.b	$23,$fc
	.dc.l	L00f776
	.dc.b	$00,$00,$00,$34,$00,$00,$f3,$27,$f2,$39,$bc,$00
	.dc.l	L0129fa
	.dc.b	$f2,$39,$f0,$ff
	.dc.l	L012bf6
	.dc.b	$00,$00,$f3,$79
L00f7d4:
	.dc.b	$23,$f9
	.dc.l	L012d8e
	.dc.b	$00,$00,$00,$34,$4d,$f9
	.dc.l	work
L00f7e4:
	.dc.b	'Nm-M',$00
L00f7e9:
	.dc.b	$9a,$2d,$6e,$0b,$7c,$07,$e8,$2d,$6e,$0b,$70,$00,$a2,$2d,$6e,$0b
	.dc.b	$70,$00,$92,$2d,$6e,$0b,$74,$07,$d8,$2d,$6e,$0b,$78,$07,$dc,$20
	.dc.b	$6e,$00,$92,$3d,$50,$00,$a0,$2d,$68,$00,$02,$00,$96,$41,$f9
	.dc.l	L011f20
	.dc.b	$4e,$b9
	.dc.l	print
	.dc.b	$20,$79
	.dc.l	L0153d0
	.dc.b	$4e,$b9
	.dc.l	print
	.dc.b	$4e,$b9
	.dc.l	newline
	.dc.b	$28,$6e,$00,$92,$30,$2c,$00,$06,$e0,$48,$e8,$48,$4a,$40,$67,$34
	.dc.b	$0c,$40,$00,$02,$65,$00,$00,$88,$67,$00,$00,$92,$0c,$40,$00,$09
	.dc.b	$67,$00,$00,$e4,$0c,$40,$00,$0a,$67,$00,$01,$42,$0c,$40,$00,$0b
	.dc.b	$67,$00,$02,$d6,$41,$f9
	.dc.l	L011f02
	.dc.b	$4e,$b9
	.dc.l	print
	.dc.b	$60,$00,$02,$a8,$06,$ae,$00,$00,$00,$08,$00,$92,$41,$f9
	.dc.l	L011f36
	.dc.b	$4e,$b9
	.dc.l	print
	.dc.b	$22,$2c,$00,$02,$4e,$b9
	.dc.l	putlhex
	.dc.b	$41,$f9
	.dc.l	L011f3b
	.dc.b	$4e,$b9
	.dc.l	print
	.dc.b	$32,$14,$4e,$b9
	.dc.l	putwhex
	.dc.b	$4e,$b9
	.dc.l	newline
	.dc.b	$2f,$0c,$2a,$6e,$00,$96,$3d,$6e,$08,$3a,$08,$36,$4e,$b9
	.dc.l	dissub
L00f8c2:
	.dc.b	'(_N¹'
L00f8c6:
	.dc.l	newline
	.dc.b	$61,$00,$f0,$d2,$60,$00,$02,$52,$41,$f9
	.dc.l	L011f78
	.dc.b	$4e,$b9
	.dc.l	print
	.dc.b	$60,$98,$06,$ae,$00,$00,$00,$0c,$00,$92,$41,$f9
	.dc.l	L011f36
	.dc.b	$4e,$b9
	.dc.l	print
	.dc.b	$22,$2c,$00,$08,$4e,$b9
	.dc.l	putlhex
	.dc.b	$41,$f9
	.dc.l	L011f3b
	.dc.b	$4e,$b9
	.dc.l	print
	.dc.b	$32,$14,$4e,$b9
	.dc.l	putwhex
	.dc.b	$4e,$b9
	.dc.l	newline
	.dc.b	$2a,$6c,$00,$08,$2f,$0c,$3d,$6e,$08,$3a,$08,$36,$4e,$b9
	.dc.l	dissub
L00f92a:
	.dc.b	'(_N¹'
L00f92e:
	.dc.l	newline
	.dc.b	$61,$00,$f0,$6a,$60,$00,$01,$ea,$06,$ae,$00,$00,$00,$14,$00,$92
	.dc.b	$41,$f9
	.dc.l	L011fab
	.dc.b	$4e,$b9
	.dc.l	print
	.dc.b	$41,$f9
	.dc.l	L011f36
	.dc.b	$4e,$b9
	.dc.l	print
	.dc.b	$22,$2c,$00,$08,$4e,$b9
	.dc.l	putlhex
	.dc.b	$41,$f9
	.dc.l	L011f3b
	.dc.b	$4e,$b9
	.dc.l	print
	.dc.b	$32,$14,$4e,$b9
	.dc.l	putwhex
	.dc.b	$4e,$b9
	.dc.l	newline
	.dc.b	$2a,$6c,$00,$08,$2f,$0c,$3d,$6e,$08,$3a,$08,$36,$4e,$b9
	.dc.l	dissub
L00f990:
	.dc.b	'(_N¹'
L00f994:
	.dc.l	newline
	.dc.b	$61,$00,$f0,$04,$60,$00,$01,$84,$06,$ae,$00,$00,$00,$20,$00,$92
	.dc.b	$41,$f9
	.dc.l	L01200b
	.dc.b	$4e,$b9
	.dc.l	print
	.dc.b	$41,$f9
	.dc.l	L011f41
	.dc.b	$4e,$b9
	.dc.l	print
	.dc.b	$22,$2c,$00,$10,$4e,$b9
	.dc.l	putlhex
	.dc.b	$4e,$b9
	.dc.l	newline
	.dc.b	$41,$f9
	.dc.l	L011f36
	.dc.b	$4e,$b9
	.dc.l	print
	.dc.b	$41,$f9,$00,$00,$00,$08,$2a,$6c,$00,$02,$34,$2c,$00,$0a,$30,$2c
	.dc.b	$00,$0c,$08,$02,$00,$0f,$66,$0a,$30,$2c,$00,$0e,$08,$02,$00,$0e
	.dc.b	$67,$20,$b0,$55,$67,$1c,$b0,$65,$67,$18,$b0,$65,$67,$14,$b0,$65
	.dc.b	$67,$10,$b0,$65,$67,$0c,$b0,$65,$67,$08,$b0,$65,$67,$04,$2a,$6c
	.dc.b	$00,$02,$2d,$4d,$00,$96,$2f,$0c,$3d,$6e,$08,$3a,$08,$36,$4e,$b9
	.dc.l	dissub
L00fa30:
	.dc.b	'(_N¹'
L00fa34:
	.dc.l	newline
	.dc.b	$60,$0c,$41,$f9
	.dc.l	L011fdf
	.dc.b	$4e,$b9
	.dc.l	print
	.dc.b	$41,$f9
	.dc.l	L011f57
	.dc.b	$4e,$b9
	.dc.l	print
	.dc.b	$10,$3c,$00,$49,$08,$2c,$00,$00,$00,$0a,$67,$04,$10,$3c,$00,$4e
	.dc.b	$4e,$b9
	.dc.l	putch
	.dc.b	$41,$f9
	.dc.l	L011f6d
	.dc.b	$4e,$b9
	.dc.l	print
	.dc.b	$10,$3c,$00,$52,$08,$2c,$00,$06,$00,$0b,$66,$04,$10,$3c,$00,$57
	.dc.b	$4e,$b9
	.dc.l	putch
	.dc.b	$41,$f9
	.dc.l	L011f73
	.dc.b	$4e,$b9
	.dc.l	print
	.dc.b	$10,$2c,$00,$0b,$02,$00,$00,$07,$06,$00,$00,$30,$4e,$b9
	.dc.l	putch
	.dc.b	$08,$2c,$00,$07,$00,$0b,$67,$0c,$41,$f9
	.dc.l	L012052
	.dc.b	$4e,$b9
	.dc.l	print
	.dc.b	$41,$f9
	.dc.l	L01205d
	.dc.b	$4e,$b9
	.dc.l	print
	.dc.b	$30,$2c,$00,$0a,$02,$40,$00,$30,$e8,$48,$0c,$40,$00,$01,$64,$08
	.dc.b	$41,$f9
	.dc.l	L01206b
	.dc.b	$60,$1e,$66,$08,$41,$f9
	.dc.l	L012070
	.dc.b	$60,$14,$0c,$40,$00,$02,$66,$08,$41,$f9
	.dc.l	L012075
	.dc.b	$60,$06,$41,$f9
	.dc.l	L01207a
	.dc.b	$4e,$b9
	.dc.l	print
	.dc.b	$41,$f9
	.dc.l	L011f3b
	.dc.b	$4e,$b9
	.dc.l	print
	.dc.b	$32,$14,$4e,$b9
	.dc.l	putwhex
	.dc.b	$4e,$b9
	.dc.l	newline
	.dc.b	$61,$00,$ee,$7e,$2d,$6e,$00,$96,$00,$32,$4e,$b9
	.dc.l	allregi
	.dc.b	$20,$6e,$08,$28,$4e,$7b,$88,$03,$4e,$f9
	.dc.l	main
	.dc.b	$06,$ae,$00,$00,$00,$5c,$00,$92,$41,$f9
	.dc.l	L01202f
	.dc.b	$4e,$b9
	.dc.l	print
	.dc.b	$60,$00,$fe,$62,$48,$f9,$7f,$ff
	.dc.l	L01225c
	.dc.b	$4d,$f9
	.dc.l	work
L00fb62:
	.dc.b	'Nm-M',$00
L00fb67:
	.dc.b	'šA',$f9
L00fb6a:
	.dc.l	L011f20
	.dc.b	$4e,$b9
	.dc.l	print
L00fb74:
	.dc.b	' _N¹'
L00fb78:
	.dc.l	print
	.dc.b	$41,$f9
	.dc.l	L011f36
	.dc.b	$4e,$b9
	.dc.l	print
	.dc.b	$3d,$57,$00,$a0,$22,$2f,$00,$02,$2d,$41,$00,$96,$4e,$b9
	.dc.l	putlhex
	.dc.b	$41,$f9
	.dc.l	L011f3b
	.dc.b	$4e,$b9
	.dc.l	print
	.dc.b	$32,$17,$4e,$b9
	.dc.l	putwhex
	.dc.b	$4e,$b9
	.dc.l	newline
	.dc.b	$20,$0f,$5c,$80,$2d,$40,$00,$92,$61,$00,$ed,$e0,$60,$00,$ff,$60
	.dc.b	$61,$00,$ed,$d8,$2d,$6e,$00,$96,$00,$32,$20,$6e,$08,$28,$4e,$7b
	.dc.b	$88,$03,$4e,$f9
	.dc.l	main
f_mpy::
	movem.l	a0-a3,-(a7)
	lea.l	($0980,a6),a1
	lea.l	($0990,a6),a2
	lea.l	($09a0,a6),a3
	clr.l	(a3)
	move.w	(a1),d0
	move.w	(a2),d1
	andi.w	#$7fff,d0
	beq	L00fd04
	andi.w	#$7fff,d1
	beq	L00fd04
	add.w	d1,d0
	subi.w	#$3ffe,d0
	bls	L00fd04
	cmpi.w	#$7ffe,d0
	bls	L00fc3c
	move.w	(a1),d3
	move.w	(a2),d5
	eor.w	d3,d5
	andi.w	#$8000,d5
	ori.w	#$7ffe,d5
	move.w	d5,(a3)
	move.l	#$ffffffff,($0004,a3)
	move.l	#$ffffffff,($0008,a3)
	movem.l	(a7)+,a0-a3
	ori.b	#$01,ccr
	rts

L00fc3c:
	move.w	(a1),d7
	move.w	(a2),d5
	eor.w	d5,d7
	andi.w	#$8000,d7
	or.w	d0,d7
	move.w	d7,(a3)
	lea.l	($09c0,a6),a0
	clr.l	(a0)
	clr.l	(a0)+
	clr.l	(a0)+
	clr.l	(a0)+
	clr.l	d0
	clr.l	d1
	move.l	($0004,a2),d2
	move.l	($0008,a2),d3
	move.l	($0008,a1),d6
	bsr	L00fc70
	move.l	($0004,a1),d6
	bsr	L00fc70
	bra	L00fcb8

L00fc70:
	clr.w	d7
L00fc72:
	btst.l	d7,d6
	beq	L00fca6
	lea.l	($09c0,a6),a0
	adda.l	#$00000010,a0
	add.l	d3,-(a0)
	subq.l	#4,a0
	movem.l	(a0),d4
	addx.l	d2,d4
	movem.l	d4,(a0)
	subq.l	#4,a0
	movem.l	(a0),d4
	addx.l	d1,d4
	movem.l	d4,(a0)
	subq.l	#4,a0
	movem.l	(a0),d4
	addx.l	d0,d4
	movem.l	d4,(a0)
L00fca6:
	add.l	d3,d3
	addx.l	d2,d2
	addx.l	d1,d1
	addx.l	d0,d0
	addq.w	#1,d7
	cmpi.w	#$0020,d7		;' '
	bcs	L00fc72
	rts

L00fcb8:
	lea.l	($09c0,a6),a0
	clr.l	d3
	movem.l	(a0),d0-d2
	addi.l	#$80000000,d2
	addx.l	d3,d1
	addx.l	d3,d0
	movem.l	d0-d2,(a0)
	btst.b	#$07,($09c0,a6)
	bne	L00fcf2
	add.l	d2,d2
	addx.l	d1,d1
	addx.l	d0,d0
	movem.l	d0-d2,(a0)
	move.w	(a3),d0
	andi.w	#$7fff,d0
	subq.w	#1,d0
	bls	L00fd04
	andi.w	#$8000,(a3)
	or.w	d0,(a3)
L00fcf2:
	lea.l	($09c0,a6),a0
	move.l	(a0)+,($0004,a3)
	move.l	(a0),($0008,a3)
	movem.l	(a7)+,a0-a3
	rts

L00fd04:
	clr.l	(a3)+
	clr.l	(a3)+
	clr.l	(a3)+
	movem.l	(a7)+,a0-a3
	rts

f_div::
	movem.l	a0-a3,-(a7)
	lea.l	($0980,a6),a1
	lea.l	($0990,a6),a2
	lea.l	($09a0,a6),a3
	clr.l	(a3)
	move.w	(a1),d0
	move.w	(a2),d1
	andi.w	#$7fff,d0
	beq	L00fe1c
	andi.w	#$7fff,d1
	beq	L00fe44
	move.w	(a1),d7
	move.w	(a2),d6
	eor.w	d6,d7
	andi.w	#$8000,d7
	move.w	d7,(a3)
	move.l	($0004,a1),d5
	move.l	($0008,a1),d6
	move.l	($0004,a2),d3
	move.l	($0008,a2),d4
	cmp.l	d3,d5
	bne	L00fd5c
	cmp.l	d4,d6
	beq	L00fe6a
L00fd5c:
	sub.w	d1,d0
	cmpi.w	#$3fff,d0
	bge	L00fe4a
	cmpi.w	#$c001,d0
	blt	L00fe32
	addi.w	#$3fff,d0
	or.w	d0,d7
	move.w	d7,(a3)
	move.l	d6,d7
	move.l	d5,d6
	clr.l	d5
	movea.l	d4,a0
	move.l	d3,d4
	clr.l	d3
	clr.l	d0
	not.l	d0
	move.l	d0,d1
	moveq.l	#$3f,d2			;'?'
L00fd8a:
	sub.l	a0,d7
	subx.l	d4,d6
	subx.l	d3,d5
L00fd90:
	bmi	L00fdbe
	beq	L00fda4
	add.l	d1,d1
	addx.l	d0,d0
	add.l	d7,d7
	addx.l	d6,d6
	addx.l	d5,d5
	dbra	d2,L00fd8a
	bra	L00fdd6

L00fda4:
	add.l	d1,d1
	addx.l	d0,d0
	subq.w	#1,d2
	bmi	L00fdd6
	not.l	d1
	not.l	d0
L00fdb0:
	add.l	d1,d1
	addx.l	d0,d0
	dbra	d2,L00fdb0
	clr.l	d3
	clr.l	d4
	bra	L00fdf4

L00fdbe:
	add.l	d1,d1
	addx.l	d0,d0
	bset.l	#$00,d1
	add.l	d7,d7
	addx.l	d6,d6
	addx.l	d5,d5
	add.l	a0,d7
	addx.l	d4,d6
	addx.l	d3,d5
	dbra	d2,L00fd90
L00fdd6:
	tst.l	d5
	bpl	L00fde0
	add.l	a0,d7
	addx.l	d4,d6
	addx.l	d3,d5
L00fde0:
	move.l	d7,d4
	move.l	d6,d3
	not.l	d1
	not.l	d0
	btst.l	#$1f,d3
	beq	L00fdf4
	addq.l	#1,d1
	bcc	L00fdf4
	addq.l	#1,d0
L00fdf4:
	btst.l	#$1f,d0
	bne	L00fe0e
	add.l	d1,d1
	addx.l	d0,d0
	move.w	(a3),d7
	andi.w	#$7fff,d7
	subq.w	#1,d7
	ble	L00fe34
	andi.w	#$8000,(a3)
	or.w	d7,(a3)
L00fe0e:
	move.l	d0,($0004,a3)
	move.l	d1,($0008,a3)
	movem.l	(a7)+,a0-a3
	rts

L00fe1c:
	andi.w	#$7fff,d1
	bne	L00fe32
	clr.w	(a3)
	clr.l	($0004,a3)
	clr.l	($0008,a3)
	movem.l	(a7)+,a0-a3
	rts

L00fe32:
	move.l	d7,d5
L00fe34:
	clr.w	(a3)
	clr.l	($0004,a3)
	clr.l	($0008,a3)
	movem.l	(a7)+,a0-a3
	rts

L00fe44:
	move.w	(a1),d7
	move.w	(a2),d6
	eor.w	d6,d7
L00fe4a:
	ori.w	#$7fff,d7
	move.w	d7,(a3)
	move.l	#$ffffffff,($0004,a3)
	move.l	#$ffffffff,($0008,a3)
	ori.b	#$01,ccr
	movem.l	(a7)+,a0-a3
	rts

L00fe6a:
	sub.w	d1,d0
	cmpi.w	#$3fff,d0
	bgt	L00fe4a
	cmpi.w	#$c001,d0
	blt	L00fe32
	addi.w	#$3fff,d0
	or.w	d0,d7
	move.w	d7,(a3)
	move.l	#$80000000,($0004,a3)
	clr.l	($0008,a3)
	movem.l	(a7)+,a0-a3
	rts

fpack::
	lea.l	($09c0,a6),a0
	moveq.l	#$05,d0
	clr.l	d1
L00fe9a:
	move.l	d1,(a0)+
	dbra	d0,L00fe9a
	lea.l	($09c0,a6),a1
	clr.l	d3
	clr.l	d5
	clr.w	d7
	jsr	(skpblk)
	move.b	(a5),d0
	cmpi.b	#$2b,d0			;'+'
	beq	L00fec2
	cmpi.b	#$2d,d0			;'-'
	bne	L00fec4
	bset.l	#$1f,d3
L00fec2:
	addq.l	#1,a5
L00fec4:
	cmpi.b	#$30,(a5)		;'0'
	bne	L00fece
	addq.l	#1,a5
	bra	L00fec4

L00fece:
	move.b	(a5),d0
	cmpi.b	#$2e,d0			;'.'
	beq	L00ff06
	jsr	(isnum)
	bcs	L00ff72
	bsr	L010018
	cmpi.w	#$0019,d7
	bhi	L00ff72
	move.w	d3,d5
	clr.w	d3
	move.b	(a5),d0
	cmpi.b	#$2e,d0			;'.'
	beq	L00ff14
	cmpi.b	#$45,d0			;'E'
	beq	L00ff30
	cmpi.b	#$65,d0			;'e'
	beq	L00ff30
	bra	L00ff78

L00ff06:
	addq.l	#1,a5
L00ff08:
	cmpi.b	#$30,(a5)		;'0'
	bne	L00ff16
	subq.w	#1,d5
	addq.l	#1,a5
	bra	L00ff08

L00ff14:
	addq.l	#1,a5
L00ff16:
	bsr	L01001c
	cmpi.w	#$0019,d7
	bhi	L00ff72
	clr.w	d3
	cmpi.b	#$45,d0			;'E'
	beq	L00ff30
	cmpi.b	#$65,d0			;'e'
	beq	L00ff30
	bra	L00ff78

L00ff30:
	clr.w	d7
	addq.l	#1,a5
	move.b	(a5),d0
	cmpi.b	#$2b,d0			;'+'
	beq	L00ff46
	cmpi.b	#$2d,d0			;'-'
	bne	L00ff4a
	bset.l	#$1e,d3
L00ff46:
	addq.l	#1,a5
	move.b	(a5),d0
L00ff4a:
	jsr	(isnum)
	bcs	L00ff72
	movem.l	d3/d5,-(a7)
	bsr	L01060a
	move.w	d6,d1
	movem.l	(a7)+,d3/d5
	cmpi.w	#$0004,d7
	bhi	L00ff72
	btst.l	#$1e,d3
	beq	L00ff6e
	neg.w	d1
L00ff6e:
	add.w	d1,d3
	bra	L00ff78

L00ff72:
	ori.b	#$01,ccr
	rts

L00ff78:
	add.w	d5,d3
	subq.w	#1,d3
	lea.l	($0940,a6),a0
	clr.l	(a0)+
	clr.l	(a0)+
	clr.l	(a0)
	lea.l	($09c0,a6),a1
	lea.l	($0940,a6),a2
	tst.l	d3
	bpl	L00ff96
	bset.b	#$07,(a2)
L00ff96:
	tst.w	d3
	bpl	L00ffa0
	bset.b	#$06,(a2)
	neg.w	d3
L00ffa0:
	cmpi.w	#$1388,d3
	bhi	L00ff72
	ext.l	d3
	divu.w	#$03e8,d3
	lsl.w	#8,d3
	lsl.w	#4,d3
	or.w	d3,($0002,a2)
	clr.w	d3
	swap.w	d3
	divu.w	#$0064,d3
	lsl.w	#8,d3
	or.w	d3,(a2)
	clr.w	d3
	swap.w	d3
	divu.w	#$000a,d3
	lsl.w	#4,d3
	or.w	d3,(a2)
	swap.w	d3
	or.w	d3,(a2)
	move.b	(a1)+,d0
	andi.w	#$000f,d0
	or.w	d0,($0002,a2)
	addq.l	#4,a2
	bsr	L00ffee
	move.w	d1,(a2)+
	bsr	L00ffee
	move.w	d1,(a2)+
	bsr	L00ffee
	move.w	d1,(a2)+
	bsr	L00ffee
	move.w	d1,(a2)+
	rts

L00ffee:
	clr.w	d1
	move.b	(a1)+,d0
	andi.w	#$000f,d0
	or.w	d0,d1
	move.b	(a1)+,d0
	andi.w	#$000f,d0
	lsl.w	#4,d1
	or.w	d0,d1
	move.b	(a1)+,d0
	andi.w	#$000f,d0
	lsl.w	#4,d1
	or.w	d0,d1
	move.b	(a1)+,d0
	andi.w	#$000f,d0
	lsl.w	#4,d1
	or.w	d0,d1
	rts

L010018:
	lea.l	($09c0,a6),a1
L01001c:
	move.b	(a5)+,d0
	jsr	(isnum)
	bcs	L010036
L010026:
	move.b	d0,(a1)+
	addq.w	#1,d3
	addq.w	#1,d7
	move.b	(a5)+,d0
	jsr	(isnum)
	bcc	L010026
L010036:
	move.b	-(a5),d0
	rts

fbtran::
	bsr	asc_bin
	bcc	L010042
	rts

L010042:
	move.l	#$0000403e,d2
	btst.l	#$1f,d5
	bne	L010074
	tst.l	d5
	bne	L010066
	tst.l	d6
	bne	L010066
	move.l	a0,-(a7)
	lea.l	($09a0,a6),a0
	clr.l	(a0)+
	clr.l	(a0)+
	clr.l	(a0)
	movea.l	(a7)+,a0
	rts

L010066:
	btst.l	#$1f,d5
	bne	L010074
	lsl.l	#1,d6
	roxl.l	#1,d5
	subq.l	#1,d2
	bra	L010066

L010074:
	movem.l	a0-a3,-(a7)
	lea.l	($09a0,a6),a0
	clr.l	(a0)
	move.w	d2,d0
	andi.w	#$7fff,d0
	move.w	d0,(a0)
	move.l	d5,($0004,a0)
	move.l	d6,($0008,a0)
	move.l	d3,d7
	bpl	L010096
	bset.b	#$07,(a0)
L010096:
	tst.w	d7
	bmi	L0102f2
	cmpi.w	#$1344,d7
	bcc	L010520
	cmpi.w	#$1000,d7
	bcs	L0100de
	subi.w	#$1000,d7
	move.w	d7,-(a7)
	lea.l	($0990,a6),a2
	lea.l	($0980,a6),a1
	lea.l	($09a0,a6),a3
	move.l	(a3)+,(a1)+
	move.l	(a3)+,(a1)+
	move.l	(a3),(a1)
	move.l	#$75250000,(a2)+
	move.l	#$c4605202,(a2)+
	move.l	#$8a20979b,(a2)
	bsr	f_mpy
	bcs	L01051e
	move.w	(a7)+,d7
L0100de:
	cmpi.w	#$0800,d7
	bcs	L010118
	subi.w	#$0800,d7
	move.w	d7,-(a7)
	lea.l	($0980,a6),a1
	lea.l	($09a0,a6),a3
	move.l	(a3)+,(a1)+
	move.l	(a3)+,(a1)+
	move.l	(a3),(a1)
	lea.l	($0990,a6),a2
	move.l	#$5a920000,(a2)+
	move.l	#$9e8b3b5d,(a2)+
	move.l	#$c53d5de5,(a2)
	bsr	f_mpy
	bcs	L01051e
	move.w	(a7)+,d7
L010118:
	cmpi.w	#$0400,d7
	bcs	L010152
	subi.w	#$0400,d7
	move.w	d7,-(a7)
	lea.l	($0980,a6),a1
	lea.l	($09a0,a6),a3
	move.l	(a3)+,(a1)+
	move.l	(a3)+,(a1)+
	move.l	(a3),(a1)
	lea.l	($0990,a6),a2
	move.l	#$4d480000,(a2)+
	move.l	#$c9767586,(a2)+
	move.l	#$81750c17,(a2)
	bsr	f_mpy
	bcs	L01051e
	move.w	(a7)+,d7
L010152:
	cmpi.w	#$0200,d7
	bcs	L01018c
	subi.w	#$0200,d7
	move.w	d7,-(a7)
	lea.l	($0980,a6),a1
	lea.l	($09a0,a6),a3
	move.l	(a3)+,(a1)+
	move.l	(a3)+,(a1)+
	move.l	(a3),(a1)
	lea.l	($0990,a6),a2
	move.l	#$46a30000,(a2)+
	move.l	#$e319a0ae,(a2)+
	move.l	#$a60e91c7,(a2)
	bsr	f_mpy
	bcs	L01051e
	move.w	(a7)+,d7
L01018c:
	cmpi.w	#$0100,d7
	bcs	L0101c6
	subi.w	#$0100,d7
	lea.l	($0980,a6),a1
	lea.l	($09a0,a6),a3
	move.l	(a3)+,(a1)+
	move.l	(a3)+,(a1)+
	move.l	(a3),(a1)
	move.w	d7,-(a7)
	lea.l	($0990,a6),a2
	move.l	#$43510000,(a2)+
	move.l	#$aa7eebfb,(a2)+
	move.l	#$9df9de8e,(a2)
	bsr	f_mpy
	bcs	L01051e
	move.w	(a7)+,d7
L0101c6:
	cmpi.w	#$0080,d7
	bcs	L010200
	subi.w	#$0080,d7
	move.w	d7,-(a7)
	lea.l	($0980,a6),a1
	lea.l	($09a0,a6),a3
	move.l	(a3)+,(a1)+
	move.l	(a3)+,(a1)+
	move.l	(a3),(a1)
	lea.l	($0990,a6),a2
	move.l	#$41a80000,(a2)+
	move.l	#$93ba47c9,(a2)+
	move.l	#$80e98ce0,(a2)
	bsr	f_mpy
	bcs	L01051e
	move.w	(a7)+,d7
L010200:
	cmpi.w	#$0040,d7		;'@'
	bcs	L01023a
	subi.w	#$0040,d7
	move.w	d7,-(a7)
	lea.l	($0980,a6),a1
	lea.l	($09a0,a6),a3
	move.l	(a3)+,(a1)+
	move.l	(a3)+,(a1)+
	move.l	(a3),(a1)
	lea.l	($0990,a6),a2
	move.l	#$40d30000,(a2)+
	move.l	#$c2781f49,(a2)+
	move.l	#$ffcfa6d5,(a2)
	bsr	f_mpy
	bcs	L01051e
	move.w	(a7)+,d7
L01023a:
	cmpi.w	#$0020,d7		;' '
	bcs	L010274
	subi.w	#$0020,d7
	move.w	d7,-(a7)
	lea.l	($0980,a6),a1
	lea.l	($09a0,a6),a3
	move.l	(a3)+,(a1)+
	move.l	(a3)+,(a1)+
	move.l	(a3),(a1)
	lea.l	($0990,a6),a2
	move.l	#$40690000,(a2)+
	move.l	#$9dc5ada8,(a2)+
	move.l	#$2b70b59e,(a2)
	bsr	f_mpy
	bcs	L01051e
	move.w	(a7)+,d7
L010274:
	cmpi.w	#$0010,d7
	bcs	L0102ae
	subi.w	#$0010,d7
	move.w	d7,-(a7)
	lea.l	($0980,a6),a1
	lea.l	($09a0,a6),a3
	move.l	(a3)+,(a1)+
	move.l	(a3)+,(a1)+
	move.l	(a3),(a1)
	lea.l	($0990,a6),a2
	move.l	#$40340000,(a2)+
	move.l	#$8e1bc9bf,(a2)+
	move.l	#$04000000,(a2)
	bsr	f_mpy
	bcs	L01051e
	move.w	(a7)+,d7
L0102ae:
	cmpi.w	#$0010,d7
	bcc	L010520
	tst.w	d7
	beq	L0102ec
	lea.l	($0980,a6),a1
	lea.l	($09a0,a6),a3
	move.l	(a3)+,(a1)+
	move.l	(a3)+,(a1)+
	move.l	(a3),(a1)
	lea.l	(L010e92),a3
	mulu.w	#$000c,d7
	neg.w	d7
	lea.l	($0990,a6),a2
	move.l	(a3,d7.w),(a2)+
	move.l	($04,a3,d7.w),(a2)+
	move.l	($08,a3,d7.w),(a2)
	bsr	f_mpy
	bcs	L010520
L0102ec:
	movem.l	(a7)+,a0-a3
	rts

L0102f2:
	neg.w	d7
	cmpi.w	#$1344,d7
	bcc	L010540
	cmpi.w	#$1000,d7
	bcs	L010332
	subi.w	#$1000,d7
	move.w	d7,-(a7)
	lea.l	($0980,a6),a1
	lea.l	($09a0,a6),a3
	move.l	(a3)+,(a1)+
	move.l	(a3)+,(a1)+
	move.l	(a3),(a1)
	lea.l	($0990,a6),a0
	move.l	#$0ad80000,(a0)+
	move.l	#$a6dd04c8,(a0)+
	move.l	#$d2ce9fde,(a0)
	bsr	f_mpy
	move.w	(a7)+,d7
L010332:
	cmpi.w	#$0800,d7
	bcs	L010368
	subi.w	#$0800,d7
	move.w	d7,-(a7)
	lea.l	($0980,a6),a1
	lea.l	($09a0,a6),a3
	move.l	(a3)+,(a1)+
	move.l	(a3)+,(a1)+
	move.l	(a3),(a1)
	lea.l	($0990,a6),a0
	move.l	#$256b0000,(a0)+
	move.l	#$ceae534f,(a0)+
	move.l	#$34362de4,(a0)
	bsr	f_mpy
	move.w	(a7)+,d7
L010368:
	cmpi.w	#$0400,d7
	bcs	L01039e
	subi.w	#$0400,d7
	move.w	d7,-(a7)
	lea.l	($0980,a6),a1
	lea.l	($09a0,a6),a3
	move.l	(a3)+,(a1)+
	move.l	(a3)+,(a1)+
	move.l	(a3),(a1)
	lea.l	($0990,a6),a0
	move.l	#$32b50000,(a0)+
	move.l	#$a2a682a5,(a0)+
	move.l	#$da57c0be,(a0)
	bsr	f_mpy
	move.w	(a7)+,d7
L01039e:
	cmpi.w	#$0200,d7
	bcs	L0103d4
	subi.w	#$0200,d7
	move.w	d7,-(a7)
	lea.l	($0980,a6),a1
	lea.l	($09a0,a6),a3
	move.l	(a3)+,(a1)+
	move.l	(a3)+,(a1)+
	move.l	(a3),(a1)
	lea.l	($0990,a6),a0
	move.l	#$395a0000,(a0)+
	move.l	#$9049ee32,(a0)+
	move.l	#$db23d21c,(a0)
	bsr	f_mpy
	move.w	(a7)+,d7
L0103d4:
	cmpi.w	#$0100,d7
	bcs	L01040a
	subi.w	#$0100,d7
	move.w	d7,-(a7)
	lea.l	($0980,a6),a1
	lea.l	($09a0,a6),a3
	move.l	(a3)+,(a1)+
	move.l	(a3)+,(a1)+
	move.l	(a3),(a1)
	lea.l	($0990,a6),a0
	move.l	#$3cac0000,(a0)+
	move.l	#$c0314325,(a0)+
	move.l	#$637a193a,(a0)
	bsr	f_mpy
	move.w	(a7)+,d7
L01040a:
	cmpi.w	#$0080,d7
	bcs	L010440
	subi.w	#$0080,d7
	move.w	d7,-(a7)
	lea.l	($0980,a6),a1
	lea.l	($09a0,a6),a3
	move.l	(a3)+,(a1)+
	move.l	(a3)+,(a1)+
	move.l	(a3),(a1)
	lea.l	($0990,a6),a0
	move.l	#$3e550000,(a0)+
	move.l	#$ddd0467c,(a0)+
	move.l	#$64bce4a0,(a0)
	bsr	f_mpy
	move.w	(a7)+,d7
L010440:
	cmpi.w	#$0040,d7		;'@'
	bcs	L010476
	subi.w	#$0040,d7
	move.w	d7,-(a7)
	lea.l	($0980,a6),a1
	lea.l	($09a0,a6),a3
	move.l	(a3)+,(a1)+
	move.l	(a3)+,(a1)+
	move.l	(a3),(a1)
	lea.l	($0990,a6),a0
	move.l	#$3f2a0000,(a0)+
	move.l	#$a87fea27,(a0)+
	move.l	#$a539e9a5,(a0)
	bsr	f_mpy
	move.w	(a7)+,d7
L010476:
	cmpi.w	#$0020,d7		;' '
	bcs	L0104ac
	subi.w	#$0020,d7
	move.w	d7,-(a7)
	lea.l	($0980,a6),a1
	lea.l	($09a0,a6),a3
	move.l	(a3)+,(a1)+
	move.l	(a3)+,(a1)+
	move.l	(a3),(a1)
	lea.l	($0990,a6),a0
	move.l	#$3f940000,(a0)+
	move.l	#$cfb11ead,(a0)+
	move.l	#$453994ba,(a0)
	bsr	f_mpy
	move.w	(a7)+,d7
L0104ac:
	cmpi.w	#$0010,d7
	bcs	L0104e2
	subi.w	#$0010,d7
	move.w	d7,-(a7)
	lea.l	($0980,a6),a1
	lea.l	($09a0,a6),a3
	move.l	(a3)+,(a1)+
	move.l	(a3)+,(a1)+
	move.l	(a3),(a1)
	lea.l	($0990,a6),a0
	move.l	#$3fc90000,(a0)+
	move.l	#$e69594be,(a0)+
	move.l	#$c44de15b,(a0)
	bsr	f_mpy
	move.w	(a7)+,d7
L0104e2:
	cmpi.w	#$0010,d7
	bcc	L010540
	tst.w	d7
	beq	L010518
	lea.l	($0980,a6),a1
	lea.l	($09a0,a6),a3
	move.l	(a3)+,(a1)+
	move.l	(a3)+,(a1)+
	move.l	(a3),(a1)
	lea.l	(L010e92),a3
	mulu.w	#$000c,d7
	lea.l	($0990,a6),a2
	move.l	(a3,d7.w),(a2)+
	move.l	($04,a3,d7.w),(a2)+
	move.l	($08,a3,d7.w),(a2)
	bsr	f_mpy
L010518:
	movem.l	(a7)+,a0-a3
	rts

L01051e:
	move.w	(a7)+,d7
L010520:
	lea.l	($09a0,a6),a3
	move.l	#$7ffe0000,(a3)+
	move.l	#$ffffffff,(a3)+
	move.l	#$ffffffff,(a3)+
	ori.b	#$01,ccr
	movem.l	(a7)+,a0-a3
	rts

L010540:
	lea.l	($09a0,a6),a0
	clr.l	(a0)+
	clr.l	(a0)+
	clr.l	(a0)
	movem.l	(a7)+,a0-a3
	rts

asc_bin::
	jsr	(skpblk)
	clr.l	d3
	clr.l	d5
	clr.l	d6
	clr.w	d7
	move.b	(a5),d0
	cmpi.b	#$2b,d0			;'+'
	beq	L010570
	cmpi.b	#$2d,d0			;'-'
	bne	L010574
	bset.l	#$1f,d3
L010570:
	addq.l	#1,a5
	move.b	(a5),d0
L010574:
	cmpi.b	#$2e,d0			;'.'
	beq	L0105a6
	jsr	(isnum)
	bcs	L010604
	bsr	L01060a
	cmpi.w	#$0013,d7
	bhi	L010604
	clr.w	d3
	cmpi.b	#$2e,d0			;'.'
	beq	L0105a6
	cmpi.b	#$45,d0			;'E'
	beq	L0105c2
	cmpi.b	#$65,d0			;'e'
	beq	L0105c2
	move.w	d0,d0
	rts

L0105a6:
	addq.l	#1,a5
	bsr	L010618
	cmpi.w	#$0013,d7
	bhi	L010604
	neg.w	d3
	cmpi.b	#$45,d0			;'E'
	beq	L0105c2
	cmpi.b	#$65,d0			;'e'
	beq	L0105c2
	move.w	d0,d0
	rts

L0105c2:
	clr.w	d7
	addq.l	#1,a5
	move.b	(a5),d0
	cmpi.b	#$2b,d0			;'+'
	beq	L0105d8
	cmpi.b	#$2d,d0			;'-'
	bne	L0105dc
	bset.l	#$1e,d3
L0105d8:
	addq.l	#1,a5
	move.b	(a5),d0
L0105dc:
	jsr	(isnum)
	bcs	L010604
	movem.l	d3/d5-d6,-(a7)
	bsr	L01060a
	move.w	d6,d1
	movem.l	(a7)+,d3/d5-d6
	cmpi.w	#$0004,d7
	bhi	L010604
	btst.l	#$1e,d3
	beq	L0105fe
	neg.w	d1
L0105fe:
	add.w	d1,d3
	tst.w	d0
	rts

L010604:
	ori.b	#$01,ccr
	rts

L01060a:
	clr.l	d5
	clr.l	d6
L01060e:
	move.b	(a5)+,d0
	cmpi.b	#$30,d0			;'0'
	beq	L01060e
	bra	L01061a

L010618:
	move.b	(a5)+,d0
L01061a:
	jsr	(isnum)
	bcs	L010652
L010622:
	add.l	d6,d6
	addx.l	d5,d5
	move.l	d5,d1
	move.l	d6,d2
	add.l	d6,d6
	addx.l	d5,d5
	add.l	d6,d6
	addx.l	d5,d5
	add.l	d2,d6
	addx.l	d1,d5
	subi.b	#$30,d0			;'0'
	ext.w	d0
	ext.l	d0
	add.l	d0,d6
	clr.l	d0
	addx.l	d0,d5
	addq.w	#1,d3
	addq.w	#1,d7
	move.b	(a5)+,d0
	jsr	(isnum)
	bcc	L010622
L010652:
	move.b	-(a5),d0
	rts

formflt::
	movem.l	d0-d2/a0-a1,-(a7)
	bsr	bftran
	movem.l	(a7)+,d0-d2/a0-a1
	move.b	($0001,a0),d7
	cmpi.b	#$3f,d7			;'?'
	bne	frmft1
	move.b	d7,(a1)
	clr.b	($0001,a1)
	lea.l	($0001,a1),a3
	ori.b	#$01,ccr
	rts

frmft1::
	cmpi.b	#$30,d7			;'0'
	bne	L010694
	move.b	#$20,(a1)		;' '
	move.b	d7,($0001,a1)
	clr.b	($0002,a1)
	lea.l	($0002,a1),a3
	rts

L010694:
	moveq.l	#$11,d4
	lea.l	($0002,a0),a2
	movea.l	a1,a3
	move.b	(a0),(a3)+
	clr.w	d2
	move.b	($0015,a0),d2
	move.w	($0016,a0),d7
	bmi	L0106d0
	cmp.w	d4,d2
	bhi	L0106fc
	move.w	d7,d0
	addq.w	#1,d0
	cmp.w	d4,d0
	bhi	L0106fc
L0106b6:
	subq.w	#1,d2
	move.b	(a2)+,(a3)+
	dbra	d7,L0106b6
	subq.w	#1,d2
	bmi	L0106cc
	move.b	#$2e,(a3)+		;'.'
L0106c6:
	move.b	(a2)+,(a3)+
	dbra	d2,L0106c6
L0106cc:
	clr.b	(a3)
	rts

L0106d0:
	move.w	d7,d0
	neg.w	d0
	move.w	d0,d1
	subq.w	#1,d0
	add.w	d2,d0
	cmp.w	d4,d0
	bhi	L0106fc
	move.b	#$2e,(a3)+		;'.'
	subq.w	#2,d1
	bmi	L0106ee
L0106e6:
	move.b	#$30,(a3)+		;'0'
	dbra	d1,L0106e6
L0106ee:
	subq.w	#1,d2
	bmi	L0106fa
L0106f2:
	move.b	(a2)+,(a3)+
	dbra	d2,L0106f2
	clr.b	(a3)+
L0106fa:
	rts

L0106fc:
	lea.l	($0002,a0),a2
	lea.l	($0001,a1),a3
	subq.w	#1,d4
	bmi	L010718
	move.b	(a2)+,(a3)+
	subq.w	#1,d4
	bmi	L010718
	move.b	#$2e,(a3)+		;'.'
L010712:
	move.b	(a2)+,(a3)+
	dbra	d4,L010712
L010718:
	bsr	bdexpt
	clr.b	(a3)
	rts

L010720:
	cmpi.w	#$0011,d4
	bcs	L01072a
	moveq.l	#$11,d4
	rts

L01072a:
	cmp.b	($0015,a0),d4
	bcc	L010774
	lea.l	($02,a0,d4.w),a2
	move.b	d4,($0015,a0)
	cmpi.b	#$35,(a2)		;'5'
	bcs	L01075c
	lea.l	($0002,a0),a3
L010742:
	addq.b	#1,-(a2)
	cmpi.b	#$39,(a2)		;'9'
	bls	L01075c
	move.b	#$30,(a2)		;'0'
	cmpa.l	a3,a2
	bhi	L010742
	move.b	#$31,($0002,a0)		;'1'
	addq.w	#1,($0016,a0)
L01075c:
	move.w	d4,d0
	subq.w	#1,d0
	ble	L010774
	lea.l	($02,a0,d4.w),a3
L010766:
	cmpi.b	#$30,-(a3)		;'0'
	dbne	d0,L010766
	addq.w	#1,d0
	move.b	d0,($0015,a0)
L010774:
	rts

bftran::
	move.b	#$20,d0			;' '
	move.b	d0,(a0)
	move.b	d0,($0001,a0)
	move.w	($09a0,a6),d0
	bpl	L01078a
	move.b	#$2d,(a0)		;'-'
L01078a:
	andi.w	#$7fff,d0
	move.w	d0,($09a0,a6)
	bne	L0107b4
	move.b	#$30,($0001,a0)		;'0'
L01079a:
	move.b	#$01,($0015,a0)
	lea.l	($0002,a0),a2
	moveq.l	#$11,d1
L0107a6:
	move.b	#$30,(a2)+		;'0'
	dbra	d1,L0107a6
	clr.w	($0016,a0)
	rts

L0107b4:
	cmpi.w	#$7fff,d0
	bne	L0107c8
	move.b	#$3f,($0001,a0)		;'?'
	bsr	L01079a
	ori.b	#$01,ccr
	rts

L0107c8:
	movem.l	a0-a3,-(a7)
	lea.l	($09a0,a6),a3
	move.l	(a3),d5
	andi.l	#$7fff0000,d5
	clr.w	-(a7)
	cmpi.l	#$3fff0000,d5
	bcs	L010ae6
	lea.l	($09a0,a6),a3
	cmpi.l	#$75250000,(a3)
	bcs	L010830
	bne	L010808
	cmpi.l	#$c4605202,($0004,a3)
	bcs	L010830
	bne	L010808
	cmpi.l	#$8a20979b,($0008,a3)
	bcs	L010830
L010808:
	addi.w	#$1000,(a7)
	lea.l	($0980,a6),a1
	lea.l	($0990,a6),a2
	move.l	#$75250000,(a2)+
	move.l	#$c4605202,(a2)+
	move.l	#$8a20979b,(a2)
	move.l	(a3)+,(a1)+
	move.l	(a3)+,(a1)+
	move.l	(a3),(a1)
	bsr	f_div
L010830:
	lea.l	($09a0,a6),a3
	cmpi.l	#$5a920000,(a3)
	bcs	L01087c
	bne	L010854
	cmpi.l	#$9e8b3b5d,($0004,a3)
	bcs	L01087c
	bne	L010854
	cmpi.l	#$c53d5de5,($0008,a3)
	bcs	L01087c
L010854:
	addi.w	#$0800,(a7)
	lea.l	($0980,a6),a1
	lea.l	($0990,a6),a2
	move.l	#$5a920000,(a2)+
	move.l	#$9e8b3b5d,(a2)+
	move.l	#$c53d5de5,(a2)
	move.l	(a3)+,(a1)+
	move.l	(a3)+,(a1)+
	move.l	(a3),(a1)
	bsr	f_div
L01087c:
	lea.l	($09a0,a6),a3
	cmpi.l	#$4d480000,(a3)
	bcs	L0108c8
	bne	L0108a0
	cmpi.l	#$c9767586,($0004,a3)
	bcs	L0108c8
	bne	L0108a0
	cmpi.l	#$81750c17,($0008,a3)
	bcs	L0108c8
L0108a0:
	addi.w	#$0400,(a7)
	lea.l	($0980,a6),a1
	lea.l	($0990,a6),a2
	move.l	#$4d480000,(a2)+
	move.l	#$c9767586,(a2)+
	move.l	#$81750c17,(a2)
	move.l	(a3)+,(a1)+
	move.l	(a3)+,(a1)+
	move.l	(a3),(a1)
	bsr	f_div
L0108c8:
	lea.l	($09a0,a6),a3
	cmpi.l	#$46a30000,(a3)
	bcs	L010914
	bne	L0108ec
	cmpi.l	#$e319a0ae,($0004,a3)
	bcs	L010914
	bne	L0108ec
	cmpi.l	#$a60e91c7,($0008,a3)
	bcs	L010914
L0108ec:
	addi.w	#$0200,(a7)
	lea.l	($0980,a6),a1
	lea.l	($0990,a6),a2
	move.l	#$46a30000,(a2)+
	move.l	#$e319a0ae,(a2)+
	move.l	#$a60e91c7,(a2)
	move.l	(a3)+,(a1)+
	move.l	(a3)+,(a1)+
	move.l	(a3),(a1)
	bsr	f_div
L010914:
	lea.l	($09a0,a6),a3
	cmpi.l	#$43510000,(a3)
	bcs	L010960
	bne	L010938
	cmpi.l	#$aa7eebfb,($0004,a3)
	bcs	L010960
	bne	L010938
	cmpi.l	#$9df9de8e,($0008,a3)
	bcs	L010960
L010938:
	addi.w	#$0100,(a7)
	lea.l	($0980,a6),a1
	lea.l	($0990,a6),a2
	move.l	#$43510000,(a2)+
	move.l	#$aa7eebfb,(a2)+
	move.l	#$9df9de8e,(a2)
	move.l	(a3)+,(a1)+
	move.l	(a3)+,(a1)+
	move.l	(a3),(a1)
	bsr	f_div
L010960:
	lea.l	($09a0,a6),a3
	cmpi.l	#$41a80000,(a3)
	bcs	L0109ac
	bne	L010984
	cmpi.l	#$93ba47c9,($0004,a3)
	bcs	L0109ac
	bne	L010984
	cmpi.l	#$80e98ce0,($0008,a3)
	bcs	L0109ac
L010984:
	addi.w	#$0080,(a7)
	lea.l	($0980,a6),a1
	lea.l	($0990,a6),a2
	move.l	#$41a80000,(a2)+
	move.l	#$93ba47c9,(a2)+
	move.l	#$80e98ce0,(a2)
	move.l	(a3)+,(a1)+
	move.l	(a3)+,(a1)+
	move.l	(a3),(a1)
	bsr	f_div
L0109ac:
	lea.l	($09a0,a6),a3
	cmpi.l	#$40d30000,(a3)
	bcs	L0109f8
	bne	L0109d0
	cmpi.l	#$c2781f49,($0004,a3)
	bcs	L0109f8
	bne	L0109d0
	cmpi.l	#$ffcfa6d5,($0008,a3)
	bcs	L0109f8
L0109d0:
	addi.w	#$0040,(a7)
	lea.l	($0980,a6),a1
	lea.l	($0990,a6),a2
	move.l	#$40d30000,(a2)+
	move.l	#$c2781f49,(a2)+
	move.l	#$ffcfa6d5,(a2)
	move.l	(a3)+,(a1)+
	move.l	(a3)+,(a1)+
	move.l	(a3),(a1)
	bsr	f_div
L0109f8:
	lea.l	($09a0,a6),a3
	cmpi.l	#$40690000,(a3)
	bcs	L010a44
	bne	L010a1c
	cmpi.l	#$9dc5ada8,($0004,a3)
	bcs	L010a44
	bne	L010a1c
	cmpi.l	#$2b70b59e,($0008,a3)
	bcs	L010a44
L010a1c:
	addi.w	#$0020,(a7)
	lea.l	($0980,a6),a1
	lea.l	($0990,a6),a2
	move.l	#$40690000,(a2)+
	move.l	#$9dc5ada8,(a2)+
	move.l	#$2b70b59e,(a2)
	move.l	(a3)+,(a1)+
	move.l	(a3)+,(a1)+
	move.l	(a3),(a1)
	bsr	f_div
L010a44:
	lea.l	($09a0,a6),a3
	cmpi.l	#$40340000,(a3)
	bcs	L010a90
	bne	L010a68
	cmpi.l	#$8e1bc9bf,($0004,a3)
	bcs	L010a90
	bne	L010a68
	cmpi.l	#$04000000,($0008,a3)
	bcs	L010a90
L010a68:
	addi.w	#$0010,(a7)
	lea.l	($0980,a6),a1
	lea.l	($0990,a6),a2
	move.l	#$40340000,(a2)+
	move.l	#$8e1bc9bf,(a2)+
	move.l	#$04000000,(a2)
	move.l	(a3)+,(a1)+
	move.l	(a3)+,(a1)+
	move.l	(a3),(a1)
	bsr	f_div
L010a90:
	moveq.l	#$10,d2
	lea.l	(L010dde),a0
L010a98:
	move.l	(a0)+,d3
	move.l	(a0)+,d4
	move.l	(a0)+,d5
	subq.w	#1,d2
	lea.l	($09a0,a6),a3
	cmp.l	(a3)+,d3
	bhi	L010a98
	bne	L010ab4
	cmp.l	(a3)+,d4
	bhi	L010a98
	bne	L010ab4
	cmp.l	(a3),d5
	bhi	L010a98
L010ab4:
	tst.w	d2
	beq	L010ad6
	add.w	d2,(a7)
	lea.l	($0980,a6),a1
	lea.l	($0990,a6),a2
	lea.l	($09a0,a6),a3
	move.l	d3,(a2)+
	move.l	d4,(a2)+
	move.l	d5,(a2)
	move.l	(a3)+,(a1)+
	move.l	(a3)+,(a1)+
	move.l	(a3),(a1)
	bsr	f_div
L010ad6:
	move.w	(a7)+,d0
	movem.l	(a7)+,a0-a3
	move.w	d0,($0016,a0)
	bsr	L010fa6
	rts

L010ae6:
	lea.l	($09a0,a6),a3
	cmpi.l	#$0ad80000,(a3)
	bhi	L010b32
	bne	L010b0a
	cmpi.l	#$a6dd04c8,($0004,a3)
	bhi	L010b32
	bne	L010b0a
	cmpi.l	#$d2ce9fde,($0008,a3)
	bhi	L010b32
L010b0a:
	subi.w	#$1000,(a7)
	lea.l	($0980,a6),a1
	lea.l	($0990,a6),a2
	move.l	#$0ad80000,(a2)+
	move.l	#$a6dd04c8,(a2)+
	move.l	#$d2ce9fde,(a2)
	move.l	(a3)+,(a1)+
	move.l	(a3)+,(a1)+
	move.l	(a3),(a1)
	bsr	f_div
L010b32:
	lea.l	($09a0,a6),a3
	cmpi.l	#$256b0000,(a3)
	bhi	L010b7e
	bne	L010b56
	cmpi.l	#$ceae534f,($0004,a3)
	bhi	L010b7e
	bne	L010b56
	cmpi.l	#$34362de4,($0008,a3)
	bhi	L010b7e
L010b56:
	subi.w	#$0800,(a7)
	lea.l	($0980,a6),a1
	lea.l	($0990,a6),a2
	move.l	#$256b0000,(a2)+
	move.l	#$ceae534f,(a2)+
	move.l	#$34362de4,(a2)
	move.l	(a3)+,(a1)+
	move.l	(a3)+,(a1)+
	move.l	(a3),(a1)
	bsr	f_div
L010b7e:
	lea.l	($09a0,a6),a3
	cmpi.l	#$32b50000,(a3)
	bhi	L010bca
	bne	L010ba2
	cmpi.l	#$a2a682a5,($0004,a3)
	bhi	L010bca
	bne	L010ba2
	cmpi.l	#$da57c0be,($0008,a3)
	bhi	L010bca
L010ba2:
	subi.w	#$0400,(a7)
	lea.l	($0980,a6),a1
	lea.l	($0990,a6),a2
	move.l	#$32b50000,(a2)+
	move.l	#$a2a682a5,(a2)+
	move.l	#$da57c0be,(a2)
	move.l	(a3)+,(a1)+
	move.l	(a3)+,(a1)+
	move.l	(a3),(a1)
	bsr	f_div
L010bca:
	lea.l	($09a0,a6),a3
	cmpi.l	#$395a0000,(a3)
	bhi	L010c16
	bne	L010bee
	cmpi.l	#$9049ee32,($0004,a3)
	bhi	L010c16
	bne	L010bee
	cmpi.l	#$db23d21c,($0008,a3)
	bhi	L010c16
L010bee:
	subi.w	#$0200,(a7)
	lea.l	($0980,a6),a1
	lea.l	($0990,a6),a2
	move.l	#$395a0000,(a2)+
	move.l	#$9049ee32,(a2)+
	move.l	#$db23d21c,(a2)
	move.l	(a3)+,(a1)+
	move.l	(a3)+,(a1)+
	move.l	(a3),(a1)
	bsr	f_div
L010c16:
	lea.l	($09a0,a6),a3
	cmpi.l	#$3cac0000,(a3)
	bhi	L010c62
	bne	L010c3a
	cmpi.l	#$c0314325,($0004,a3)
	bhi	L010c62
	bne	L010c3a
	cmpi.l	#$637a193a,($0008,a3)
	bhi	L010c62
L010c3a:
	subi.w	#$0100,(a7)
	lea.l	($0980,a6),a1
	lea.l	($0990,a6),a2
	move.l	#$3cac0000,(a2)+
	move.l	#$c0314325,(a2)+
	move.l	#$637a193a,(a2)
	move.l	(a3)+,(a1)+
	move.l	(a3)+,(a1)+
	move.l	(a3),(a1)
	bsr	f_div
L010c62:
	lea.l	($09a0,a6),a3
	cmpi.l	#$3e550000,(a3)
	bhi	L010cae
	bne	L010c86
	cmpi.l	#$ddd0467c,($0004,a3)
	bhi	L010cae
	bne	L010c86
	cmpi.l	#$64bce4a0,($0008,a3)
	bhi	L010cae
L010c86:
	subi.w	#$0080,(a7)
	lea.l	($0980,a6),a1
	lea.l	($0990,a6),a2
	move.l	#$3e550000,(a2)+
	move.l	#$ddd0467c,(a2)+
	move.l	#$64bce4a0,(a2)
	move.l	(a3)+,(a1)+
	move.l	(a3)+,(a1)+
	move.l	(a3),(a1)
	bsr	f_div
L010cae:
	lea.l	($09a0,a6),a3
	cmpi.l	#$3f2a0000,(a3)
	bhi	L010cfa
	bne	L010cd2
	cmpi.l	#$a87fea27,($0004,a3)
	bhi	L010cfa
	bne	L010cd2
	cmpi.l	#$a539e9a5,($0008,a3)
	bhi	L010cfa
L010cd2:
	subi.w	#$0040,(a7)
	lea.l	($0980,a6),a1
	lea.l	($0990,a6),a2
	move.l	#$3f2a0000,(a2)+
	move.l	#$a87fea27,(a2)+
	move.l	#$a539e9a5,(a2)
	move.l	(a3)+,(a1)+
	move.l	(a3)+,(a1)+
	move.l	(a3),(a1)
	bsr	f_div
L010cfa:
	lea.l	($09a0,a6),a3
	cmpi.l	#$3f940000,(a3)
	bhi	L010d46
	bne	L010d1e
	cmpi.l	#$cfb11ead,($0004,a3)
	bhi	L010d46
	bne	L010d1e
	cmpi.l	#$453994ba,($0008,a3)
	bhi	L010d46
L010d1e:
	subi.w	#$0020,(a7)
	lea.l	($0980,a6),a1
	lea.l	($0990,a6),a2
	move.l	#$3f940000,(a2)+
	move.l	#$cfb11ead,(a2)+
	move.l	#$453994ba,(a2)
	move.l	(a3)+,(a1)+
	move.l	(a3)+,(a1)+
	move.l	(a3),(a1)
	bsr	f_div
L010d46:
	lea.l	($09a0,a6),a3
	cmpi.l	#$3fc90000,(a3)
	bhi	L010d92
	bne	L010d6a
	cmpi.l	#$e69594be,($0004,a3)
	bhi	L010d92
	bne	L010d6a
	cmpi.l	#$c44de15b,($0008,a3)
	bhi	L010d92
L010d6a:
	subi.w	#$0010,(a7)
	lea.l	($0980,a6),a1
	lea.l	($0990,a6),a2
	move.l	#$3fc90000,(a2)+
	move.l	#$e69594be,(a2)+
	move.l	#$c44de15b,(a2)
	move.l	(a3)+,(a1)+
	move.l	(a3)+,(a1)+
	move.l	(a3),(a1)
	bsr	f_div
L010d92:
	moveq.l	#$ff,d2
	lea.l	(L010e92),a0
L010d9a:
	move.l	(a0)+,d3
	move.l	(a0)+,d4
	move.l	(a0)+,d5
	addq.w	#1,d2
	lea.l	($09a0,a6),a3
	cmp.l	(a3)+,d3
	bcs	L010db6
	bne	L010d9a
	cmp.l	(a3)+,d4
	bcs	L010db6
	bne	L010d9a
	cmp.l	(a3),d5
	bhi	L010d9a
L010db6:
	tst.w	d2
	beq	L010ad6
	sub.w	d2,(a7)
	lea.l	($0990,a6),a2
	move.l	d3,(a2)+
	move.l	d4,(a2)+
	move.l	d5,(a2)
	lea.l	($0980,a6),a1
	lea.l	($09a0,a6),a3
	move.l	(a3)+,(a1)+
	move.l	(a3)+,(a1)+
	move.l	(a3),(a1)
	bsr	f_div
	bra	L010ad6

L010dde:
	.dc.b	$40,$30,$00,$00,$e3,$5f,$a9,$31,$a0,$00,$00,$05,$40,$2d,$00,$00
	.dc.b	$b5,$e6,$20,$f4,$80,$00,$00,$0a,$40,$2a,$00,$00,$91,$84,$e7,$29
	.dc.b	$ff,$ff,$ff,$f9,$40,$26,$00,$00,$e8,$d4,$a5,$10,$00,$00,$00,$08
	.dc.b	$40,$23,$00,$00,$ba,$43,$b7,$40,$00,$00,$00,$14,$40,$20,$00,$00
	.dc.b	$95,$02,$f8,$ff,$ff,$ff,$ff,$f9,$40,$1c,$00,$00,$ee,$6b,$28,$00
	.dc.b	$00,$00,$00,$01,$40,$19,$00,$00,$be,$bc,$20,$00,$00,$00,$00,$08
	.dc.b	$40,$16,$00,$00,$98,$96,$7f,$ff,$ff,$ff,$ff,$fd,$40,$12,$00,$00
	.dc.b	$f4,$24,$00,$00,$00,$00,$00,$03,$40,$0f,$00,$00,$c3,$50,$00,$00
	.dc.b	$00,$00,$00,$0d,$40,$0c,$00,$00,$9c,$3f,$ff,$ff,$ff,$ff,$ff,$ff
	.dc.b	$40,$08,$00,$00,$fa,$00,$00,$00,$00,$00,$00,$01,$40,$05,$00,$00
	.dc.b	$c8,$00,$00,$00,$00,$00,$00,$07,$40,$02,$00,$00,$a0,$00,$00,$00
	.dc.b	$00,$00,$00,$00
L010e92:
	.dc.b	$3f,$ff,$00,$00,$80,$00,$00,$00,$00,$00,$00,$00,$3f,$fb,$00,$00
	.dc.b	$cc,$cc,$cc,$cc,$cc,$cc,$cc,$cd,$3f,$f8,$00,$00,$a3,$d7,$0a,$3d
	.dc.b	$70,$a3,$d7,$04,$3f,$f5,$00,$00,$83,$12,$6e,$97,$8d,$4f,$df,$3b
	.dc.b	$3f,$f1,$00,$00,$d1,$b7,$17,$58,$e2,$19,$65,$2c,$3f,$ee,$00,$00
	.dc.b	$a7,$c5,$ac,$47,$1b,$47,$84,$17,$3f,$eb,$00,$00,$86,$37,$bd,$05
	.dc.b	$af,$6c,$69,$b4,$3f,$e7,$00,$00,$d6,$bf,$94,$d5,$e5,$7a,$42,$c0
	.dc.b	$3f,$e4,$00,$00,$ab,$cc,$77,$11,$84,$61,$ce,$f6,$3f,$e1,$00,$00
	.dc.b	$89,$70,$5f,$41,$36,$b4,$a5,$96,$3f,$dd,$00,$00,$db,$e6,$fe,$ce
	.dc.b	$bd,$ed,$d5,$c8,$3f,$da,$00,$00,$af,$eb,$ff,$0b,$cb,$24,$aa,$ec
	.dc.b	$3f,$d7,$00,$00,$8c,$bc,$cc,$09,$6f,$50,$88,$c7,$3f,$d3,$00,$00
	.dc.b	$e1,$2e,$13,$42,$4b,$b4,$0e,$1d,$3f,$d0,$00,$00,$b4,$24,$dc,$35
	.dc.b	$09,$5c,$d8,$05,$3f,$cd,$00,$00,$90,$1d,$7c,$f7,$3a,$b0,$ac,$d6
	.dc.b	$3f,$c9,$00,$00,$e6,$95,$94,$be,$c4,$4d,$e1,$5e,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
bdexpt::
	move.b	#$45,(a3)+		;'E'
	move.w	($0016,a0),d2
	move.b	#$2b,d0			;'+'
	tst.w	d2
	bpl	L010f80
	move.b	#$2d,d0			;'-'
	neg.w	d2
L010f80:
	move.b	d0,(a3)+
	moveq.l	#$0a,d0
	moveq.l	#$03,d1
	swap.w	d2
L010f88:
	clr.w	d2
	swap.w	d2
	divu.w	d0,d2
	swap.w	d2
	move.w	d2,-(a7)
	dbra	d1,L010f88
	moveq.l	#$03,d1
L010f98:
	move.w	(a7)+,d2
	addi.b	#$30,d2			;'0'
	move.b	d2,(a3)+
	dbra	d1,L010f98
	rts

L010fa6:
	move.l	a1,-(a7)
	lea.l	($09a0,a6),a1
	move.w	(a1),d0
	clr.l	d4
	move.l	($0004,a1),d5
	move.l	($0008,a1),d6
	add.l	d6,d6
	addx.l	d5,d5
	addx.l	d4,d4
	andi.w	#$7fff,d0
	subi.w	#$3fff,d0
	clr.w	d1
	tst.w	d0
	beq	L010fd8
	subq.w	#1,d0
L010fce:
	add.l	d6,d6
	addx.l	d5,d5
	addx.l	d4,d4
	dbra	d0,L010fce
L010fd8:
	clr.l	d2
	addi.l	#$00000054,d6
	addx.l	d2,d5
	addx.l	d2,d4
	cmpi.l	#$0000000a,d4
	bcs	L01102c
	addq.w	#1,($0016,a0)
	moveq.l	#$30,d0			;'0'
	move.b	#$31,($0002,a0)		;'1'
	moveq.l	#$11,d1
	lea.l	($0003,a0),a2
L010ffe:
	move.b	d0,(a2)+
	dbra	d1,L010ffe
	move.b	#$01,($0015,a0)
	movea.l	(a7)+,a1
	rts

L01100e:
	add.l	d6,d6
	addx.l	d5,d5
	addx.l	d4,d4
	movea.l	d6,a1
	move.l	d5,d7
	move.l	d4,d3
	add.l	d6,d6
	addx.l	d5,d5
	addx.l	d4,d4
	add.l	d6,d6
	addx.l	d5,d5
	addx.l	d4,d4
	add.l	a1,d6
	addx.l	d7,d5
	addx.l	d3,d4
L01102c:
	move.l	d4,d2
	addi.b	#$30,d2			;'0'
	move.b	d2,($02,a0,d1.w)
	clr.l	d4
	addq.w	#1,d1
	cmpi.w	#$0012,d1
	bls	L01100e
	moveq.l	#$10,d1
L011042:
	cmpi.b	#$30,($03,a0,d1.w)	;'0'
	dbne	d1,L011042
	addq.w	#2,d1
	move.b	d1,($0015,a0)
	movea.l	(a7)+,a1
	rts

l_x_trn::
	move.l	a3,-(a7)
	lea.l	($09a0,a6),a3
	cmpi.l	#$80000000,d6
	bne	L01107a
	lea.l	($09a0,a6),a0
	move.l	#$c01e0000,(a3)+
	move.l	#$80000000,(a3)+
	clr.l	(a3)
	movea.l	(a7)+,a3
	rts

L01107a:
	move.l	d6,d7
	bne	L011088
L01107e:
	clr.l	(a3)+
	clr.l	(a3)+
	clr.l	(a3)
	movea.l	(a7)+,a3
	rts

L011088:
	bpl	L01108e
	neg.l	d6
	beq	L01107e
L01108e:
	andi.l	#$80000000,d7
	move.l	d7,(a3)
	move.l	d6,d4
	move.w	#$401e,d2
L01109c:
	btst.l	#$1f,d4
	bne	L0110aa
	add.l	d4,d4
	dbra	d2,L01109c
	bra	L01107e

L0110aa:
	move.l	d4,($0004,a3)
	clr.l	($0008,a3)
	or.w	d2,(a3)
	clr.w	($0002,a3)
	movea.l	(a7)+,a3
	rts

x_l_trn::
	move.l	a3,-(a7)
	lea.l	($09a0,a6),a3
	cmpi.w	#$401d,(a3)
	bgt	L011138
	bne	L0110de
	cmpi.l	#$fffffffe,($0004,a3)
	bhi	L011138
	bne	L0110f6
	tst.l	($0008,a3)
	bne	L011138
	bra	L0110f6

L0110de:
	cmpi.w	#$c01e,(a3)
	bhi	L011146
	bne	L0110f6
	cmpi.l	#$80000000,($0004,a3)
	bne	L011146
	tst.l	($0008,a3)
	bne	L011146
L0110f6:
	move.w	(a3),d1
	move.l	($0004,a3),d5
	move.l	($0008,a3),d6
	andi.w	#$7fff,d1
	beq	L01114e
	addq.l	#1,d5
	bcc	L01110e
	roxr.l	#1,d5
	addq.w	#1,d1
L01110e:
	subi.w	#$401e,d1
	bmi	L011122
	subq.w	#1,d1
	bmi	L01112c
L011118:
	add.l	d6,d6
	addx.l	d5,d5
	dbra	d1,L011118
	bra	L01112c

L011122:
	neg.w	d1
	cmpi.w	#$0020,d1		;' '
	bcc	L01114e
	lsr.l	d1,d5
L01112c:
	tst.w	(a3)
	bpl	L011132
	neg.l	d5
L011132:
	move.l	d5,d6
	movea.l	(a7)+,a3
	rts

L011138:
	move.l	#$7fffffff,d6
L01113e:
	ori.b	#$01,ccr
	movea.l	(a7)+,a3
	rts

L011146:
	move.l	#$80000000,d6
	bra	L01113e

L01114e:
	clr.l	d6
	movea.l	(a7)+,a3
	rts

s_x_trn::
	move.l	a3,-(a7)
	lea.l	($09a0,a6),a3
	move.l	d6,d4
	move.l	d6,d5
	clr.l	d6
	andi.l	#$80000000,d5
	move.l	d5,(a3)
	move.l	d4,d0
	swap.w	d0
	andi.w	#$7f80,d0
	beq	L0111a2
	lsr.w	#7,d0
	cmpi.w	#$00ff,d0
	beq	L0111ac
	subi.w	#$007f,d0
	addi.l	#$00003fff,d0
	swap.w	d0
	clr.w	d0
	or.l	d0,(a3)
	andi.l	#$007fffff,d4
	bset.l	#$17,d4
	lsl.l	#8,d4
	move.l	d4,($0004,a3)
	clr.l	($0008,a3)
	movea.l	(a7)+,a3
	rts

L0111a2:
	clr.l	(a3)+
	clr.l	(a3)+
	clr.l	(a3)
	movea.l	(a7)+,a3
	rts

L0111ac:
	move.l	#$7fff0000,(a3)+
	clr.l	(a3)+
	clr.l	(a3)
	movea.l	(a7)+,a3
	rts

x_s_trn::
	move.l	a3,-(a7)
	lea.l	($09a0,a6),a3
	move.l	(a3),d4
	move.l	($0004,a3),d5
	move.w	(a3),d0
	andi.l	#$80000000,d4
	andi.w	#$7fff,d0
	beq	L01120c
	subi.w	#$3fff,d0
	lsr.l	#7,d5
	addq.l	#1,d5
	btst.l	#$19,d5
	beq	L0111e6
	lsr.l	#1,d5
	addq.w	#1,d0
L0111e6:
	lsr.l	#1,d5
	bclr.l	#$17,d5
	cmpi.w	#$007f,d0
	bgt	L011212
	cmpi.w	#$ff82,d0
	blt	L01120c
	addi.w	#$007f,d0
	lsl.w	#7,d0
	swap.w	d0
	clr.w	d0
	or.l	d0,d4
	or.l	d5,d4
	move.l	d4,d6
	movea.l	(a7)+,a3
	rts

L01120c:
	clr.l	d6
	movea.l	(a7)+,a3
	rts

L011212:
	move.l	#$7f000000,d6
	ori.b	#$01,ccr
	movea.l	(a7)+,a3
	rts

d_x_trn::
	move.l	a3,-(a7)
	lea.l	($09a0,a6),a3
	move.l	d5,d0
	andi.l	#$80000000,d0
	move.l	d0,(a3)
	move.l	d5,d0
	swap.w	d0
	andi.w	#$7ff0,d0
	beq	L011272
	lsr.w	#4,d0
	cmpi.w	#$07ff,d0
	beq	L01127c
	subi.w	#$03ff,d0
	addi.l	#$00003fff,d0
	swap.w	d0
	clr.w	d0
	or.l	d0,(a3)
	andi.l	#$000fffff,d5
	bset.l	#$14,d5
	moveq.l	#$0a,d0
L01125e:
	add.l	d6,d6
	addx.l	d5,d5
	dbra	d0,L01125e
	move.l	d5,($0004,a3)
	move.l	d6,($0008,a3)
	movea.l	(a7)+,a3
	rts

L011272:
	clr.l	(a3)+
	clr.l	(a3)+
	clr.l	(a3)
	movea.l	(a7)+,a3
	rts

L01127c:
	move.l	#$7fff0000,(a3)+
	clr.l	(a3)+
	clr.l	(a3)
	movea.l	(a7)+,a3
	rts

x_d_trn::
	move.l	a3,-(a7)
	lea.l	($09a0,a6),a3
	move.l	(a3),d4
	move.l	($0004,a3),d5
	move.l	($0008,a3),d6
	move.w	(a3),d0
	andi.l	#$80000000,d4
	andi.w	#$7fff,d0
	beq	L0112ee
	subi.w	#$3fff,d0
	moveq.l	#$09,d1
L0112ae:
	lsr.l	#1,d5
	roxr.l	#1,d6
	dbra	d1,L0112ae
	clr.l	d1
	addq.l	#1,d6
	addx.l	d1,d5
	btst.l	#$16,d5
	beq	L0112c8
	lsr.l	#1,d5
	roxr.l	#1,d6
	addq.w	#1,d0
L0112c8:
	lsr.l	#1,d5
	roxr.l	#1,d6
	bclr.l	#$14,d5
	cmpi.w	#$03ff,d0
	bgt	L0112f6
	cmpi.w	#$fc02,d0
	blt	L0112ee
	addi.w	#$03ff,d0
	lsl.w	#4,d0
	swap.w	d0
	clr.w	d0
	or.l	d0,d5
	or.l	d4,d5
	movea.l	(a7)+,a3
	rts

L0112ee:
	clr.l	d5
	clr.l	d6
	movea.l	(a7)+,a3
	rts

L0112f6:
	move.l	#$7ff00000,d5
	clr.l	d6
	ori.b	#$01,ccr
	movea.l	(a7)+,a3
	rts

L011306:
	move.w	($0448,a6),d0
	btst.l	#$00,d0
	beq	L011334
	move.w	#$0000,-(a7)
	move.w	#$0003,-(a7)
	DOS	_DUP0
	addq.l	#4,a7
	move.w	#$0001,-(a7)
	move.w	#$0003,-(a7)
	DOS	_DUP0
	addq.l	#4,a7
	move.w	#$0002,-(a7)
	move.w	#$0003,-(a7)
	DOS	_DUP0
	addq.l	#4,a7
L011334:
	rts

L011336:
	move.w	($0448,a6),d0
	btst.l	#$00,d0
	beq	L011364
	move.w	#$0000,-(a7)
	move.w	#$0000,-(a7)
	DOS	_DUP0
	addq.l	#4,a7
	move.w	#$0001,-(a7)
	move.w	#$0001,-(a7)
	DOS	_DUP0
	addq.l	#4,a7
	move.w	#$0002,-(a7)
	move.w	#$0002,-(a7)
	DOS	_DUP0
	addq.l	#4,a7
L011364:
	rts

shell::
	jsr	(shellcall)
	jmp	(main)

shellcall::
	move.l	a5,(L015f4e)
	jsr	(L0114ca)
	tst.b	d0
	beq	command_com
	cmp.b	#$0d,d0
	beq	command_com
	jsr	(L011524)
	jsr	(search_path)
	tst.l	d0
	bmi	command_com
L011398:
	move.l	(monpdb),d0
	movea.l	d0,a0
	move.l	($0058,a0),-(a7)
	jsr	(L011306)
	jsr	(L0114bc)
	moveq.l	#$00,d0
	jsr	(exec_sub)
	jsr	(L011440)
	jsr	(L011336)
	jsr	(L0114b0)
	move.l	(monpdb),d0
	movea.l	d0,a0
	move.l	(a7)+,($0058,a0)
	rts

command_com::
	move.w	#$0000,(L016052)
	pea.l	(L016052)
	clr.l	-(a7)
	pea.l	(L0121f0)
	DOS	_GETENV
	lea.l	($000c,a7),a7
	tst.b	(L016052)
	bne	shell7
shell5::
	lea.l	(L0121fb),a0
	lea.l	(L016052),a1
	moveq.l	#$1f,d0
shell6::
	move.b	(a0)+,(a1)+
	dbeq	d0,shell6
	jsr	(search_path)
	tst.l	d0
	bpl	shell7
	lea.l	(L0121f8),a0
	lea.l	(L016052),a1
	jsr	(L011540)
shell7::
	movea.l	(L015f4e),a5
	jsr	(L0114da)
	bra	L011398

search_path::
	moveq.l	#$02,d0
	bra	exec_sub

L011440:
	tst.l	d0
	bmi	L011450
	pea.l	(L01218a)
	DOS	_PRINT
	move.l	(a7)+,d0
	bra	L01145a

L011450:
	pea.l	(L0121ba)
	DOS	_PRINT
	move.l	(a7)+,d0
L01145a:
	move.w	#$00ff,-(a7)
	DOS	_INPOUT
	addq.l	#2,a7
	tst.l	d0
	beq	L01145a
	pea.l	(L0121ec)
	DOS	_PRINT
	move.l	(a7)+,d0
	rts

exec_sub::
	move.l	a7,(L015f46)
	move.l	usp,a0
	move.l	a0,(L015f4a)
	lea.l	(L016952),a0
	move.l	a0,usp
	clr.l	-(a7)
	pea.l	(L015f52)
	pea.l	(L016052)
	move.w	d0,-(a7)
	DOS	_EXEC
	movea.l	(L015f46),a7
	movea.l	(L015f4a),a0
	move.l	a0,usp
	lea.l	(work),a6
	rts

L0114b0:
	move.l	d0,-(a7)
	jsr	(_CutMem)
	move.l	(a7)+,d0
	rts

L0114bc:
	move.l	d0,-(a7)
	jsr	(_PasMem)
	move.l	(a7)+,d0
	rts

L0114c8:
	addq.l	#1,a5
L0114ca:
	move.b	(a5),d0
	cmp.b	#$20,d0			;' '
	beq	L0114c8
	cmp.b	#$09,d0
	beq	L0114c8
	rts

L0114da:
	jsr	(L0114ca)
	tst.b	d0
	beq	L011500
	cmp.b	#$0d,d0
	beq	L011500
	lea.l	(L015f53),a0
	move.b	#$2f,(a0)+		;'/'
	move.b	#$63,(a0)+		;'c'
	move.b	#$20,(a0)+		;' '
	moveq.l	#$03,d0
	bra	L01152c

L011500:
	move.w	#$0000,(L015f52)
	rts

L01150a:
	lea.l	(L015f53),a0
	moveq.l	#$00,d0
	jsr	(L01152c)
	move.b	#$00,(a0)
	move.b	d0,(L015f52)
	rts

L011524:
	lea.l	(L016052),a0
	moveq.l	#$00,d0
L01152c:
	cmpi.b	#$0d,(a5)
	beq	L01153e
	move.b	(a5)+,(a0)+
	beq	L01153e
	addq.w	#1,d0
	cmp.w	#$007e,d0		;'~'
	bcs	L01152c
L01153e:
	rts

L011540:
	move.b	(a0)+,(a1)+
	bne	L011540
	rts

getcnd::
	movem.l	d1-d2,-(a7)
	move.w	($00a0,a6),d0
	moveq.l	#$00,d2
	move.w	d0,ccr
	shi.b	d1
	and.w	#$0001,d1
	or.w	d1,d2
	move.w	d0,ccr
	sls.b	d1
	and.w	#$0002,d1
	or.w	d1,d2
	move.w	d0,ccr
	scc.b	d1
	and.w	#$0004,d1
	or.w	d1,d2
	move.w	d0,ccr
	scs.b	d1
	and.w	#$0008,d1
	or.w	d1,d2
	move.w	d0,ccr
	sne.b	d1
	and.w	#$0010,d1
	or.w	d1,d2
	move.w	d0,ccr
	seq.b	d1
	and.w	#$0020,d1
	or.w	d1,d2
	move.w	d0,ccr
	svc.b	d1
	ext.w	d1
	and.w	#$0040,d1
	or.w	d1,d2
	move.w	d0,ccr
	svs.b	d1
	ext.w	d1
	and.w	#$0080,d1
	or.w	d1,d2
	move.w	d0,ccr
	spl.b	d1
	ext.w	d1
	and.w	#$0100,d1
	or.w	d1,d2
	move.w	d0,ccr
	smi.b	d1
	ext.w	d1
	and.w	#$0200,d1
	or.w	d1,d2
	move.w	d0,ccr
	sge.b	d1
	ext.w	d1
	and.w	#$0400,d1
	or.w	d1,d2
	move.w	d0,ccr
	slt.b	d1
	ext.w	d1
	and.w	#$0800,d1
	or.w	d1,d2
	move.w	d0,ccr
	sgt.b	d1
	ext.w	d1
	and.w	#$1000,d1
	or.w	d1,d2
	move.w	d0,ccr
	sle.b	d1
	ext.w	d1
	and.w	#$2000,d1
	or.w	d1,d2
	move.w	d0,ccr
	scc.b	d1
	ext.w	d1
	and.w	#$4000,d1
	or.w	d1,d2
	move.w	d0,ccr
	scs.b	d1
	ext.w	d1
	and.w	#$8000,d1
	or.w	d1,d2
	move.l	d2,d0
	movem.l	(a7)+,d1-d2
	rts

putcnd::
	movem.l	d0-d3,-(a7)
	bsr	getcnd
	lea.l	(L01166e,pc),a1
	move.l	d0,d2
	moveq.l	#$00,d3
L01161c:
	move.b	(a1),d0
	jsr	(putch)
	move.b	($0001,a1),d0
	jsr	(putch)
	moveq.l	#$3a,d0			;':'
	jsr	(putch)
	moveq.l	#$30,d0			;'0'
	btst.l	d3,d2
	beq	L01163e
	moveq.l	#$31,d0			;'1'
L01163e:
	jsr	(putch)
	moveq.l	#$20,d0			;' '
	jsr	(putch)
	tst.w	($044a,a6)
	beq	L01165e
	cmp.w	#$0007,d3
	bne	L01165e
	jsr	(newline)
L01165e:
	addq.l	#2,a1
	addq.w	#1,d3
	cmp.w	#$0010,d3
	bcs	L01161c
	movem.l	(a7)+,d0-d3
	rts

L01166e:
	.dc.b	'HILSCCCSNEEQVCVSPLMIGELTGTLEHSLO'

	.data

L01168e:
	.dc.b	'db [-?][-r][-cn] target',$0d,$0a
	.dc.b	$09,'-?',$09,'Usage',$0d,$0a
	.dc.b	$09,'-r',$09,'TTY=AUX',$0d,$0a
	.dc.b	$09,'-cn',$09,'Child process size(a6)(nKbytes)',$0d,$0a
L0116e5:
	.dc.b	'Micro Processor Unit:',$00
L0116fb:
	.dc.b	'16bit MC68000',$00
L011709:
	.dc.b	'32bit MC68030 with INTERNAL PMMU',$00
L01172a:
	.dc.b	'32bit MC68EC030',$00
L01173a:
	.dc.b	$0d,$0a
	.dc.b	'Floating Point Co Processor:',$00
L011759:
	.dc.b	'Softwere emulation.',$0d,$0a,$00
L01176f:
	.dc.b	'MC68881/882',$0d,$0a,$00,$00
L01177e:
	.dc.b	$00,$00
L011780:
	.dc.w	$ffff
L011782:
	.dc.b	$ff,$ff,$00,$00,$00,$80,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
L011812:
	.dc.b	$ff,$ff,$00,$00,$00,$20,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
L011842:
	.dc.w	$0000
L011844:
	.dc.w	$0000
L011846:
	.dc.w	$0000
L011848:
	.dc.b	$0d,$0a,$00,$00
L01184c:
	.dc.l	inch
	.dc.b	$f9,$9c,$f9,$aa,$fe,$da
	.dc.l	getch
	.dc.b	$fa,$50,$fa,$54,$fe,$76
	.dc.l	getln
	.dc.b	$f8,$d0,$f8,$f2,$fe,$76
L01186a:
	.dc.l	putch
L01186e:
	.dc.b	'ù–ù¢üÞ'
L011874:
	.dc.l	putc
L011878:
	.dc.b	'ù°ù¼üÖ'
L01187e:
	.dc.l	print
	.dc.b	$fa,$1a,$fa,$22,$fc,$e2
L011888:
	.dc.w	$0000
L01188a:
	.dc.w	$ffff
L01188c:
	.dc.w	$0000
L01188e:
	.dc.w	$ffff
L011890:
	.dc.b	$01,$88,$01,$89,$01,$8e,$01,$93,$01,$98,$01,$9d,$01,$a3,$01,$a7
	.dc.b	$01,$ac,$01,$b1,$01,$b6,$01,$b7,$01,$bc,$01,$c1,$01,$c6,$01,$cc
	.dc.b	$01,$d0,$01,$d4,$01,$da,$01,$de,$01,$e3,$01,$e7,$01,$e8,$01,$ec
	.dc.b	$01,$f2,$01,$f6,$01,$fb,$02,$00,$02,$05,$02,$09,$02,$0d,$02,$12
	.dc.b	$02,$16,$02,$1a,$02,$1e,$02,$23,$02,$27,$02,$2c,$02,$32,$02,$36
	.dc.b	$02,$3a,$02,$3e,$02,$43,$02,$48,$02,$4e,$02,$53,$02,$58,$02,$5d
	.dc.b	$02,$60,$02,$65,$02,$6a,$02,$6e,$02,$81,$02,$85,$02,$8a,$02,$8f
	.dc.b	$02,$93,$02,$97,$02,$9c,$02,$a1,$02,$a6,$02,$aa,$02,$af,$02,$b4
	.dc.b	$02,$b8,$02,$bc,$02,$c0,$02,$c4,$02,$c8,$02,$cd,$02,$d2,$02,$d6
	.dc.b	$02,$da,$02,$ed,$02,$f5,$02,$fb,$02,$ff,$03,$04,$03,$09,$03,$0d
	.dc.b	$03,$12,$03,$18,$03,$1d,$03,$22,$03,$26,$03,$2c,$03,$32,$03,$38
	.dc.b	$03,$3d,$03,$42,$03,$48,$03,$4f,$03,$55,$03,$5c,$03,$62,$03,$68
	.dc.b	$03,$6e,$03,$74,$03,$7c,$03,$83,$03,$89,$03,$90,$03,$96,$03,$9c
	.dc.b	$03,$a0,$03,$a3,$03,$a9,$03,$ac,$03,$b2,$03,$bb,$03,$c3,$03,$c4
	.dc.b	$03,$c8,$03,$cc,$03,$d1,$03,$d8,$03,$dc,$03,$e1,$03,$e9,$03,$ea
	.dc.b	$03,$eb,$03,$ec,$03,$f2,$03,$f7,$03,$fd,$04,$04,$04,$0a,$04,$0b
	.dc.b	$04,$13,$04,$14,$04,$1c,$04,$22,$04,$28,$04,$29,$04,$2f,$04,$36
	.dc.b	$04,$3b,$04,$40,$04,$46,$04,$4e,$04,$56,$04,$57,$04,$5d,$04,$64
	.dc.b	$04,$6a,$04,$6b,$04,$70,$04,$76,$04,$7b,$04,$7c,$04,$82,$04,$87
	.dc.b	$04,$8f,$04,$97,$04,$9c,$04,$a1,$04,$a6,$04,$ab,$04,$b3,$04,$b8
	.dc.b	$04,$bf,$04,$c7,$04,$cc,$04,$cd,$04,$ce,$04,$cf,$04,$d0,$04,$d1
	.dc.b	$04,$d2,$04,$d3,$04,$db,$04,$e3,$04,$eb,$04,$f3,$04,$fb,$05,$03
	.dc.b	$05,$0b,$05,$13,$05,$18,$05,$19,$05,$1e,$05,$1f,$05,$20,$05,$21
	.dc.b	$05,$22,$05,$23,$05,$2b,$05,$31,$05,$38,$05,$3c,$05,$3f,$05,$45
	.dc.b	$05,$4a,$05,$4d,$05,$53,$05,$5c,$00,$62,$74,$73,$74,$00,$62,$63
	.dc.b	$68,$67,$00,$62,$63,$6c,$72,$00,$62,$73,$65,$74,$00,$6d,$6f,$76
	.dc.b	$65,$70,$00,$6f,$72,$69,$00,$61,$6e,$64,$69,$00,$73,$75,$62,$69
	.dc.b	$00,$61,$64,$64,$69,$00,$00,$65,$6f,$72,$69,$00,$63,$6d,$70,$69
	.dc.b	$00,$6d,$6f,$76,$65,$00,$6d,$6f,$76,$65,$61,$00,$63,$68,$6b,$00
	.dc.b	$6c,$65,$61,$00,$72,$65,$73,$65,$74,$00,$6e,$6f,$70,$00,$73,$74
	.dc.b	$6f,$70,$00,$72,$74,$65,$00,$00,$72,$74,$73,$00,$74,$72,$61,$70
	.dc.b	$76,$00,$72,$74,$72,$00,$74,$72,$61,$70,$00,$6c,$69,$6e,$6b,$00
	.dc.b	$75,$6e,$6c,$6b,$00,$6a,$73,$72,$00,$6a,$6d,$70,$00,$6e,$65,$67
	.dc.b	$78,$00,$63,$6c,$72,$00,$6e,$65,$67,$00,$6e,$6f,$74,$00,$6e,$62
	.dc.b	$63,$64,$00,$70,$65,$61,$00,$73,$77,$61,$70,$00,$6d,$6f,$76,$65
	.dc.b	$6d,$00,$65,$78,$74,$00,$74,$73,$74,$00,$74,$61,$73,$00,$61,$64
	.dc.b	$64,$71,$00,$73,$75,$62,$71,$00,$6d,$6f,$76,$65,$71,$00,$73,$62
	.dc.b	$63,$64,$00,$64,$69,$76,$75,$00,$64,$69,$76,$73,$00,$6f,$72,$00
	.dc.b	$73,$75,$62,$78,$00,$73,$75,$62,$61,$00,$73,$75,$62,$00,$6c,$69
	.dc.b	$6e,$65,$20,$31,$30,$31,$30,$20,$65,$6d,$75,$6c,$61,$74,$6f,$72
	.dc.b	$00,$63,$6d,$70,$00,$63,$6d,$70,$61,$00,$63,$6d,$70,$6d,$00,$65
	.dc.b	$6f,$72,$00,$65,$78,$67,$00,$61,$62,$63,$64,$00,$6d,$75,$6c,$75
	.dc.b	$00,$6d,$75,$6c,$73,$00,$61,$6e,$64,$00,$61,$64,$64,$78,$00,$61
	.dc.b	$64,$64,$61,$00,$61,$64,$64,$00,$61,$73,$6c,$00,$61,$73,$72,$00
	.dc.b	$6c,$73,$6c,$00,$6c,$73,$72,$00,$72,$6f,$78,$6c,$00,$72,$6f,$78
	.dc.b	$72,$00,$72,$6f,$6c,$00,$72,$6f,$72,$00,$6c,$69,$6e,$65,$20,$31
	.dc.b	$31,$31,$31,$20,$65,$6d,$75,$6c,$61,$74,$6f,$72,$00,$69,$6c,$6c
	.dc.b	$65,$67,$61,$6c,$00,$63,$61,$6c,$6c,$6d,$00,$72,$74,$6d,$00,$63
	.dc.b	$6d,$70,$32,$00,$63,$68,$6b,$32,$00,$63,$61,$73,$00,$63,$61,$73
	.dc.b	$32,$00,$6d,$6f,$76,$65,$73,$00,$62,$6b,$70,$74,$00,$65,$78,$74
	.dc.b	$62,$00,$72,$74,$64,$00,$6d,$6f,$76,$65,$63,$00,$64,$69,$76,$75
	.dc.b	$6c,$00,$64,$69,$76,$73,$6c,$00,$70,$61,$63,$6b,$00,$75,$6e,$70
	.dc.b	$6b,$00,$62,$66,$74,$73,$74,$00,$62,$66,$65,$78,$74,$75,$00,$62
	.dc.b	$66,$63,$68,$67,$00,$62,$66,$65,$78,$74,$73,$00,$62,$66,$63,$6c
	.dc.b	$72,$00,$62,$66,$66,$66,$6f,$00,$62,$66,$73,$65,$74,$00,$62,$66
	.dc.b	$69,$6e,$73,$00,$70,$66,$6c,$75,$73,$68,$72,$00,$70,$76,$61,$6c
	.dc.b	$69,$64,$00,$70,$6c,$6f,$61,$64,$00,$70,$66,$6c,$75,$73,$68,$00
	.dc.b	$70,$6d,$6f,$76,$65,$00,$70,$74,$65,$73,$74,$00,$70,$64,$62,$00
	.dc.b	$70,$73,$00,$70,$74,$72,$61,$70,$00,$70,$62,$00,$70,$73,$61,$76
	.dc.b	$65,$00,$70,$72,$65,$73,$74,$6f,$72,$65,$00,$70,$6d,$6f,$76,$65
	.dc.b	$66,$64,$00,$00,$47,$45,$4e,$00,$53,$63,$63,$00,$44,$42,$63,$63
	.dc.b	$00,$54,$52,$41,$50,$63,$63,$00,$42,$63,$63,$00,$53,$41,$56,$45
	.dc.b	$00,$52,$45,$53,$54,$4f,$52,$45,$00,$00,$00,$00,$66,$6d,$6f,$76
	.dc.b	$65,$00,$66,$69,$6e,$74,$00,$66,$73,$69,$6e,$68,$00,$66,$69,$6e
	.dc.b	$74,$72,$7a,$00,$66,$73,$71,$72,$74,$00,$00,$66,$6c,$6f,$67,$6e
	.dc.b	$70,$31,$00,$00,$66,$65,$74,$6f,$78,$6d,$31,$00,$66,$74,$61,$6e
	.dc.b	$68,$00,$66,$61,$74,$61,$6e,$00,$00,$66,$61,$73,$69,$6e,$00,$66
	.dc.b	$61,$74,$61,$6e,$68,$00,$66,$73,$69,$6e,$00,$66,$74,$61,$6e,$00
	.dc.b	$66,$65,$74,$6f,$78,$00,$66,$74,$77,$6f,$74,$6f,$78,$00,$66,$74
	.dc.b	$65,$6e,$74,$6f,$78,$00,$00,$66,$6c,$6f,$67,$6e,$00,$66,$6c,$6f
	.dc.b	$67,$31,$30,$00,$66,$6c,$6f,$67,$32,$00,$00,$66,$61,$62,$73,$00
	.dc.b	$66,$63,$6f,$73,$68,$00,$66,$6e,$65,$67,$00,$00,$66,$61,$63,$6f
	.dc.b	$73,$00,$66,$63,$6f,$73,$00,$66,$67,$65,$74,$65,$78,$70,$00,$66
	.dc.b	$67,$65,$74,$6d,$61,$6e,$00,$66,$64,$69,$76,$00,$66,$6d,$6f,$64
	.dc.b	$00,$66,$61,$64,$64,$00,$66,$6d,$75,$6c,$00,$66,$73,$67,$6c,$64
	.dc.b	$69,$76,$00,$66,$72,$65,$6d,$00,$66,$73,$63,$61,$6c,$65,$00,$66
	.dc.b	$73,$67,$6c,$6d,$75,$6c,$00,$66,$73,$75,$62,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$66,$73,$69,$6e,$63,$6f,$73,$00,$66,$73,$69,$6e,$63
	.dc.b	$6f,$73,$00,$66,$73,$69,$6e,$63,$6f,$73,$00,$66,$73,$69,$6e,$63
	.dc.b	$6f,$73,$00,$66,$73,$69,$6e,$63,$6f,$73,$00,$66,$73,$69,$6e,$63
	.dc.b	$6f,$73,$00,$66,$73,$69,$6e,$63,$6f,$73,$00,$66,$73,$69,$6e,$63
	.dc.b	$6f,$73,$00,$66,$63,$6d,$70,$00,$00,$66,$74,$73,$74,$00,$00,$00
	.dc.b	$00,$00,$00,$66,$6d,$6f,$76,$65,$63,$72,$00,$66,$6d,$6f,$76,$65
	.dc.b	$00,$66,$6d,$6f,$76,$65,$6d,$00,$66,$64,$62,$00,$66,$73,$00,$66
	.dc.b	$74,$72,$61,$70,$00,$66,$6e,$6f,$70,$00,$66,$62,$00,$66,$73,$61
	.dc.b	$76,$65,$00,$66,$72,$65,$73,$74,$6f,$72,$65,$00,$66,$62,$72,$61
	.dc.b	$00,$54,$68,$69,$73,$20,$70,$72,$6f,$67,$72,$61,$6d,$20,$69,$73
	.dc.b	$20,$74,$68,$65,$20,$70,$72,$6f,$70,$65,$72,$74,$79,$20,$6f,$66
	.dc.b	$20,$4b,$55,$4d,$41,$20,$4c,$41,$42,$2e,$00
L011e1b:
	.dc.b	$01,$01,$01,$01,$02,$02,$02,$02,$02,$00,$02,$02,$02,$02,$02,$03
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$02,$02,$03,$03,$02,$02,$02
	.dc.b	$02,$02,$03,$02,$02,$02,$02,$01,$02,$02,$03,$02,$02,$02,$02,$01
	.dc.b	$02,$02,$00,$02,$02,$02,$02,$02,$02,$02,$02,$02,$01,$02,$02,$02
	.dc.b	$02,$02,$02,$02,$02,$02,$02,$00,$00,$02,$02,$02,$02,$02,$02,$03
	.dc.b	$00,$03,$02,$03,$03,$03,$04,$04,$01,$01,$01,$01,$01,$01,$01,$01
	.dc.b	$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$00,$00,$03,$01
	.dc.b	$03,$03,$03,$03,$03,$00,$00,$00,$03,$03,$03,$03,$03,$00,$03,$00
	.dc.b	$03,$03,$03,$00,$03,$03,$03,$03,$03,$03,$03,$00,$03,$03,$03,$00
	.dc.b	$03,$03,$03,$00,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03
	.dc.b	$03,$00,$00,$00,$00,$00,$00,$00,$03,$03,$03,$03,$03,$03,$03,$03
	.dc.b	$03,$00,$03,$00,$00,$00,$00,$00,$03,$03,$03,$03,$03,$03,$03,$03
	.dc.b	$03,$03,$03,$0d,$0a,$41,$62,$6f,$72,$74,$65,$64,$20,$62,$79,$20
	.dc.b	$6e,$6f,$6e,$2d,$6d,$61,$73,$6b,$61,$62,$6c,$65,$20,$69,$6e,$74
	.dc.b	$65,$72,$72,$75,$70,$74,$00
L011f02:
	.dc.b	'Illegal stack format number',$0d,$0a,$00
L011f20:
	.dc.b	'Exceptional abort by ',$00
L011f36:
	.dc.b	' at ',$00
L011f3b:
	.dc.b	', SR=',$00
L011f41:
	.dc.b	' By memory access of ',$00
L011f57:
	.dc.b	'system status =  I/N=',$00
L011f6d:
	.dc.b	' R/W=',$00
L011f73:
	.dc.b	' FC=',$00
L011f78:
	.dc.b	'Stack format #1, Throwaway four word stack frame',$0d,$0a,$00
L011fab:
	.dc.b	'Coprocessor mid-instruction exception stack frame',$0d,$0a,$00
L011fdf:
	.dc.b	'double exception in system status display',$0d,$0a,$00
L01200b:
	.dc.b	'Short bus cycle fault stack frame',$0d,$0a,$00
L01202f:
	.dc.b	'Long bus cycle fault stack frame',$0d,$0a,$00
L012052:
	.dc.b	' ,RM cycle',$00
L01205d:
	.dc.b	' Access size=',$00
L01206b:
	.dc.b	'long',$00
L012070:
	.dc.b	'byte',$00
L012075:
	.dc.b	'word',$00
L01207a:
	.dc.b	'3 byte',$00,$00
L012082:
	.dc.l	L00ea40
	.dc.l	L00ea96
	.dc.l	L00eaf0
	.dc.l	L00eb52
	.dc.l	L00ebaa
	.dc.l	L00ec0e
	.dc.b	$00,$00,$00,$00
	.dc.l	tracei_20
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.l	L00edf2
	.dc.l	L00ee54
	.dc.l	L00eec0
	.dc.l	L00ef1a
	.dc.l	L00edf2
	.dc.l	L00edf2
	.dc.l	L00edf2
	.dc.l	L00edf2
	.dc.l	L00edf2
	.dc.l	L00edf2
	.dc.l	L00edf2
	.dc.l	L00edf2
	.dc.l	L00ef86
	.dc.l	L00efe6
	.dc.l	L00f046
	.dc.l	L00f0a6
	.dc.l	L00f106
	.dc.l	L00f166
	.dc.l	L00f1c6
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00
L01210a:
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.l	L00f2f2
	.dc.l	L00f368
	.dc.l	L00f3c8
	.dc.l	L00f428
	.dc.l	L00f484
	.dc.l	L00f4e4
	.dc.l	L00f53e
	.dc.l	L00edf2
	.dc.l	L00f59e
	.dc.l	L00f5fe
	.dc.l	L00f662
	.dc.l	L00edf2
	.dc.l	L00edf2
	.dc.l	L00edf2
	.dc.l	L00edf2
	.dc.l	L00edf2
L01217a:
	.dc.b	' in debugger',$0d,$0a,$00,$00
L01218a:
	.dc.b	$0d,$0a
	.dc.b	'ƒfƒoƒbƒK‚É–ß‚è‚Ü‚·I‰½‚©ƒL[‚ð‰Ÿ‚µ‚Ä‚­‚¾‚³‚¢',$00,$00
L0121ba:
	.dc.b	$0d,$0a
	.dc.b	'Shell‚Í‹N“®‚Å‚«‚Ü‚¹‚ñI‰½‚©ƒL[‚ð‰Ÿ‚µ‚Ä‚­‚¾‚³‚¢',$00
L0121ec:
	.dc.b	$0d,$0a,$00,$00
L0121f0:
	.dc.b	'comspec',$00
L0121f8:
	.dc.b	'A:\'
L0121fb:
	.dc.b	'command.x',$00,$00

	.bss

work::
	.ds.b	86
L01225c:
	.ds.b	1914
L0129d6:
	.ds.w	1
L0129d8:
	.ds.w	1
L0129da:
	.ds.l	1
L0129de:
	.ds.b	8
L0129e6:
	.ds.b	4
L0129ea:
	.ds.b	4
L0129ee:
	.ds.b	4
L0129f2:
	.ds.b	4
L0129f6:
	.ds.b	4
L0129fa:
	.ds.b	508
L012bf6:
	.ds.b	384
L012d76:
	.ds.l	1
L012d7a:
	.ds.b	4
L012d7e:
	.ds.b	4
L012d82:
	.ds.b	4
L012d86:
	.ds.b	4
L012d8a:
	.ds.l	1
L012d8e:
	.ds.b	26
smwork::
	.ds.b	14
smbuf::
	.ds.l	1
ptrnum::
	.ds.w	1
oldadr::
	.ds.l	1
nullflg::
	.ds.w	1
comnum::
	.ds.w	1
monpdb::
	.ds.l	1
usrpdb::
	.ds.l	1
child::
	.ds.l	1
breakf::
	.ds.w	1
nmiflg::
	.ds.w	1
tmpbuf::
	.ds.b	128
header::
	.ds.b	64
filnam::
	.ds.b	64
comlin::
	.ds.b	256
cmlnsb::
	.ds.b	4864
stack1::
stack2::
isp_stack::
	.ds.b	4348
L0153d0:
	.ds.l	1
errstk::
	.ds.b	498
msp_stack::
	.ds.b	2048
stack::
ramend::
	.ds.b	256
L015ec6:
	.ds.b	128
L015f46:
	.ds.l	1
L015f4a:
	.ds.l	1
L015f4e:
	.ds.l	1
L015f52:
	.ds.b	1
L015f53:
	.ds.b	255
L016052:
	.ds.b	2304
L016952:
	.ds.b	2

	.stack

dbend::

	.end	startdb
