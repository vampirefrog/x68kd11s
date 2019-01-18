;=============================================
;  Filename commando.x
;  Time Stamp Fri Jan 18 05:39:51 2019
;
;  Base address 000000
;  Exec address 000010
;  Text size    0058b2 byte(s)
;  Data size    000c2e byte(s)
;  Bss  size    000fa2 byte(s)
;  1403 Labels
;
;  Commandline dis  -b2 -h -m68000 --sp -q1 -B -M -o120 -gcommando.lab --overwrite commando.x commando.s
;          DIS version 3.16
;=============================================

	.include	inc/doscall.mac
	.include	inc/iocscall.mac
	.include	inc/fefunc.mac

	.cpu	68000

	.text

L000000:
	.dc.l	L00649a
	.dc.b	$00,$00,$74,$81
	.dc.l	L007482+$001000
L00000c:
	.dc.l	$00000a1c
Start:
	bra.s	Start2

L000012:
	.dc.b	'Command2.03Hu',$00
Start2:
	DOS	_VERNUM
	cmp.w	#$0332,d0
	bcs.s	L000038
	lea.l	(L0062f3),a0
	bsr.w	L002044
	move.w	#$0700,-(sp)
	DOS	_EXIT2

L000038:
	DOS	_GETPDB
	movea.l	d0,a0
	movea.l	($00f8,a0),sp
	bsr.w	L00052a
	move.b	#-$01,(L006ea2)
	bsr.w	L0005b2
	bsr.w	L000216
	tst.b	(L006eb1)
	bne.s	L000064
	tst.b	(L006eae)
	bne.s	L000068
L000064:
	bsr.w	L001a9a
L000068:
	tst.b	(L006eb1)
	beq.s	L0000aa
	tst.b	(L006eae)
	bne.s	L000088
	tst.b	(L006eaf)
	bne.s	L0000ea
	move.b	#-$01,(L006e9f)
L000088:
	lea.l	(L0065ce),a1
	tst.b	(a1)+
	bne.s	L000098
	lea.l	(L005b3b),a1
L000098:
	lea.l	(L006ec8),a0
	bsr.w	L001c94
	bsr.w	L001c86
	move.b	d0,-(a0)
	bra.s	L0000da

L0000aa:
	lea.l	(L0065ce),a1
	tst.b	(a1)+
	bne.s	L000098
	bra.s	L0000ea

L0000b6:
	move.b	#-$01,(L006ea2)
	clr.b	(L006e9f)
	tst.b	(L006ea4)
	beq.s	L0000d4
	clr.b	(L006ea4)
	bra.s	L0000da

L0000d4:
	bsr.w	L000cec
	beq.s	L0000b6
L0000da:
	bsr.w	L0013a8
	beq.s	L0000ea
	bsr.w	L001628
	beq.s	L0000ea
	bsr.w	L0018a0
L0000ea:
	bsr.w	L00280c
	bra.s	L0000b6

L0000f0:
	lea.l	(L005bcf),a0
	bsr.w	L002044
	tst.b	(L006ea2)
L000100:
	bne.s	L00012a
L000102:
	move.l	#$000003fc,d0
	cmp.w	#$0100,d1
	bcs.s	L000126
	addq.l	#1,d0
	cmp.w	#$0200,d1
	bcs.s	L000126
	addq.l	#2,d0
	cmp.w	#$ff00,d1
	bcc.s	L000126
	cmp.w	#$f000,d1
	bcc.s	L000126
	move.b	d1,d0
L000126:
	move.w	d0,-(sp)
	DOS	_EXIT2

L00012a:
	move.l	#$000003fc,d0
	cmp.w	#$0100,d1
	bcs.s	L00014e
	addq.l	#1,d0
	cmp.w	#$0200,d1
	bcs.s	L00014e
	addq.l	#2,d0
	cmp.w	#$ff00,d1
	bcc.s	L00014e
	cmp.w	#$f000,d1
	bcc.s	L00014e
	move.b	d1,d0
L00014e:
	move.l	d0,(L0064b6)
	DOS	_GETPDB
	movea.l	d0,a0
	movea.l	($00f8,a0),sp
	moveq.l	#$26,d0			;'&'
	bsr.w	L002db8
	bra.s	L000194

L000164:
	lea.l	(L005bcf),a0
	bsr.w	L002044
	tst.b	(L006ea2)
	bne.s	L00017c
	move.w	#$0200,-(sp)
	DOS	_EXIT2

L00017c:
	move.l	#$00000200,(L0064b6)
	DOS	_GETPDB
	movea.l	d0,a0
	movea.l	($00f8,a0),sp
	moveq.l	#$22,d0			;'"'
	bsr.w	L002db8
L000194:
	clr.b	(L006ea5)
	clr.b	(L006ea7)
	clr.b	(L006ea8)
	tst.b	(L006ea3)
	beq.s	L0001b0
	bsr.s	L0001cc
L0001b0:
	tst.b	(L006eb5)
	bmi.w	L00045e
	bne.w	L000454
	bsr.w	L0004ec
	bsr.w	L0027e6
	DOS	_FFLUSH
	bra.w	L0000b6

L0001cc:
	lea.l	(L006340),a0
	bsr.w	L002044
	move.w	#$0001,-(sp)
	DOS	_KFLUSH
	addq.l	#2,sp
	or.b	#$20,d0
	cmp.b	#$6e,d0			;'n'
	beq.s	L00020a
	cmp.b	#$79,d0			;'y'
	bne.s	L0001cc
	move.l	#$00000200,(L0064b6)
	move.b	#-$01,(L006ead)
	clr.b	(L006ea3)
	bsr.w	L000430
L00020a:
	lea.l	(L005bcf),a0
	bsr.w	L002044
	rts

L000216:
	move.w	#$ffff,(L0064c4)
	move.w	#$ffff,(L0064c6)
	move.w	#$ffff,(L0064c8)
	move.w	#$ffff,(L0064ca)
	clr.b	(L006eab)
	clr.b	(L006eac)
	move.b	#-$01,(L006ea2)
	move.b	#-$01,(L006ead)
	move.b	#$ff,(L006ec6)
	move.b	#$ff,(L0064cc)
	clr.l	(L0064b6)
	clr.l	(L0064ba)
	clr.l	(L00649a)
	clr.b	(L006e9f)
	clr.b	(L006ea3)
	clr.b	(L006ea4)
	clr.b	(L006ea5)
	clr.b	(L006ea6)
	clr.b	(L006ea7)
	clr.b	(L006ea8)
	clr.b	(L006ec7)
	clr.b	(L006ec8)
	clr.b	(L0064cd)
	clr.b	(L0064ce)
	clr.b	(L006ea9)
	clr.b	(L006eaa)
	clr.b	(L006ea1)
	clr.b	(L006eb4)
	clr.b	(L006eb5)
	DOS	_VERNUM
	cmp.w	#$014a,d0
	bcs.s	L0002e4
	move.b	#-$01,(L006eb4)
L0002e4:
	move.b	(L007480),(L006ea0)
	DOS	_GETPDB
	movea.l	d0,a0
	movea.l	(a0),a0
	move.l	#$00000200,d1
	cmpa.l	#$ffffffff,a0
	beq.s	L000328
	tst.b	(L006eb1)
	bne.s	L00030c
	move.l	(a0),d1
L00030c:
	tst.b	(L006eb0)
	beq.s	L00033e
	clr.l	d0
	move.b	(L006eb2),d0
	addq.l	#2,d0
	lsl.l	#8,d0
	cmp.l	d1,d0
	bcs.s	L00033e
	move.l	d0,d1
	bra.s	L00033e

L000328:
	tst.b	(L006eb0)
	beq.s	L00033e
	clr.l	d0
	move.b	(L006eb2),d0
	addq.l	#2,d0
	lsl.l	#8,d0
	move.l	d0,d1
L00033e:
	move.l	d1,-(sp)
	bsr.w	L002e1c
	addq.l	#4,sp
	move.l	d0,(L0064a2)
	movea.l	d0,a0
	move.l	d1,(a0)+
	lea.l	(L005b89),a1
	tst.b	(L006eb1)
	bne.s	L000370
	DOS	_GETPDB
	movea.l	d0,a2
	movea.l	(a2),a2
	cmpa.l	#$ffffffff,a2
	beq.s	L000370
	addq.l	#4,a2
	movea.l	a2,a1
L000370:
	bsr.w	L00207e
	DOS	_GETPDB
	movea.l	d0,a0
	move.l	(L0064a2),(a0)
	clr.l	d0
	move.b	(L006eb3),d0
	addq.l	#2,d0
	lsl.l	#8,d0
	move.l	d0,d1
	move.l	d1,-(sp)
	bsr.w	L002e1c
	addq.l	#4,sp
	move.l	d0,(L0064a6)
	movea.l	d0,a0
	move.l	d1,(a0)+
	move.l	a0,(L0064aa)
	move.l	a0,(L0064ae)
	move.l	a0,(L0064b2)
	clr.b	(a0)+
	clr.b	(a0)
	bsr.w	L002d8c
	move.b	#-$01,(L006ea1)
	move.b	#-$01,(L007480)
	bsr.w	L0004ee
	pea.l	(L000164)
	move.w	#$fff1,-(sp)
	DOS	_INTVCS
	addq.l	#6,sp
	pea.l	(L0000f0)
	move.w	#$fff2,-(sp)
	DOS	_INTVCS
	addq.l	#6,sp
	rts

L0003ea:
	move.l	d0,-(sp)
	bsr.w	L0004a2
	tst.l	(L00649a)
	beq.s	L000408
	move.l	(L00649a),-(sp)
	DOS	_MFREE
	addq.l	#4,sp
	clr.l	(L00649a)
L000408:
	move.l	(sp)+,d0
	move.l	d0,d1
	move.l	d1,-(sp)
	DOS	_MALLOC
	addq.l	#4,sp
	tst.l	d0
	bmi.s	L000422
	movea.l	d0,a0
	move.l	d0,(L00649a)
	move.l	d1,(a0)+
	clr.b	(a0)
L000422:
	movem.l	d0,-(sp)
	bsr.w	L0004ee
	movem.l	(sp)+,d0
	rts

L000430:
	move.w	#$0001,d0
	tst.l	(L00649a)
	beq.s	L000452
	bsr.s	L0004a2
	move.l	(L00649a),-(sp)
	DOS	_MFREE
	addq.l	#4,sp
	clr.l	(L00649a)
	bsr.w	L0004ee
L000452:
	rts

L000454:
	lea.l	(L005ccb),a0
	bsr.w	L002044
L00045e:
	lea.l	(L0062e2),a0
	bsr.w	L002044
	bsr.w	L00280c
	bsr.w	L002d9e
	bsr.w	L000572
	move.w	#$0700,-(sp)
	DOS	_EXIT2

L00047a:
	move.l	d0,-(sp)
	and.l	#$000000ff,d0
	lea.l	(L0061db),a0
	cmp.b	#$19,d0
	bhi.s	L00049a
	lsl.l	#2,d0
	lea.l	(Table2),a0
	movea.l	(a0,d0.l),a0
L00049a:
	bsr.w	L002044
	move.l	(sp)+,d0
	rts

L0004a2:
	move.l	(L006eb6),d0
	bmi.s	L0004ba
	move.l	d0,-(sp)
	DOS	_MFREE
	addq.l	#4,sp
	move.l	#$ffffffff,(L006eb6)
L0004ba:
	move.l	(L006ebe),d0
	bmi.s	L0004d2
	move.l	d0,-(sp)
	DOS	_MFREE
	addq.l	#4,sp
	move.l	#$ffffffff,(L006ebe)
L0004d2:
	move.l	(L006eba),d0
	bmi.s	L0004ea
	move.l	d0,-(sp)
	DOS	_MFREE
	addq.l	#4,sp
	move.l	#$ffffffff,(L006eba)
L0004ea:
	rts

L0004ec:
	bsr.s	L0004a2
L0004ee:
	move.l	#$0000af20,-(sp)
	bsr.w	L002e1c
	addq.l	#4,sp
	move.l	d0,(L006eb6)
	move.l	#$000015e4,-(sp)
	bsr.w	L002e1c
	addq.l	#4,sp
	move.l	d0,(L006ebe)
	move.l	#$00000400,-(sp)
	bsr.w	L002e1c
	addq.l	#4,sp
	move.l	d0,(L006eba)
	move.w	#$0001,d0
	rts

L00052a:
	bsr.w	L002d7a
	beq.s	L00055a
	move.l	(L00000c),d0
	bsr.w	L002d62
	lea.l	(L000000-$000004),a2
L000540:
	movea.l	(a2),a2
	tst.l	(a2)
	beq.s	L000558
	move.l	($0004,a2),d0
	beq.s	L000540
	movea.l	d0,a0
	move.l	($0010,a2),d0
	bsr.w	L002d62
	bra.s	L000540

L000558:
	rts

L00055a:
	lea.l	(L000000-$0000f0),a0
	lea.l	(L007482+$001000),a1
	suba.l	a0,a1
	move.l	a1,-(sp)
	move.l	a0,-(sp)
	DOS	_SETBLOCK
	addq.l	#8,sp
	rts

L000572:
	bsr.w	L002d7a
	beq.s	L0005a2
	exg.l	a0,a1
	move.l	(L00000c),d0
	bsr.w	L002d62
	lea.l	(L000000-$000004),a2
L00058a:
	movea.l	(a2),a2
	tst.l	(a2)
	beq.s	L0005a2
	move.l	($0004,a2),d0
	beq.s	L00058a
	movea.l	d0,a1
	move.l	($0010,a2),d0
	bsr.w	L002d62
	bra.s	L00058a

L0005a2:
	rts

L0005a4:
	tst.b	(L006ead)
	beq.s	L0005b0
	bsr.w	L00264c
L0005b0:
	rts

L0005b2:
	clr.b	(L006eae)
	clr.b	(L006eaf)
	clr.b	(L006eb1)
	clr.b	(L006eb0)
	clr.b	(L006eb2)
	clr.b	(L006eb3)
	clr.b	(L0065ce)
	DOS	_GETPDB
	movea.l	d0,a0
	move.l	($0050,a0),d0
	movea.l	($0010,a0),a0
	addq.l	#1,a0
	tst.l	d0
	bpl.s	L0005f6
	move.b	#-$01,(L006eb1)
L0005f6:
	bsr.w	L002060
	beq.w	L000732
	cmp.b	#$63,d0			;'c'
	bne.s	L000636
	move.b	#-$01,(L006eae)
	bsr.w	L001d0e
	adda.l	d0,a0
	bsr.w	L001c86
	cmp.l	#$000000ff,d0
	bcs.s	L000624
	move.l	#$000000fe,d0
L000624:
	movea.l	a0,a1
	lea.l	(L0065ce),a0
	move.b	d0,(a0)+
	bra.w	L001ca2

L000632:
	bra.w	L000732

L000636:
	cmp.b	#$64,d0			;'d'
	bne.s	L000646
	move.b	#-$01,(L006eaf)
	bra.s	L0005f6

L000646:
	cmp.b	#$65,d0			;'e'
	bne.s	L0006a0
	cmpi.b	#$3a,(a0)+		;':'
	bne.w	L000732
	bsr.w	L001bea
	move.l	d0,d2
L00065a:
	move.b	(a0),d0
	beq.s	L000672
	cmp.b	#$2f,d0			;'/'
	beq.s	L000672
	addq.l	#1,a0
	cmp.b	#$09,d0
	beq.s	L000672
	cmp.b	#$20,d0			;' '
	bne.s	L00065a
L000672:
	tst.l	d1
	bpl.s	L000678
	not.b	d1
L000678:
	beq.w	L0005f6
	cmp.b	#$0a,d1
	bhi.w	L0005f6
	cmp.l	#$000000ff,d2
	bhi.w	L0005f6
	move.b	#-$01,(L006eb0)
	move.b	d2,(L006eb2)
	bra.w	L0005f6

L0006a0:
	cmp.b	#$68,d0			;'h'
	bne.s	L0006f2
	cmpi.b	#$3a,(a0)+		;':'
	bne.w	L000732
	bsr.w	L001bea
	move.l	d0,d2
L0006b4:
	move.b	(a0),d0
	beq.s	L0006cc
	cmp.b	#$2f,d0			;'/'
	beq.s	L0006cc
	addq.l	#1,a0
	cmp.b	#$09,d0
	beq.s	L0006cc
	cmp.b	#$20,d0			;' '
	bne.s	L0006b4
L0006cc:
	tst.l	d1
	bpl.s	L0006d2
	not.b	d1
L0006d2:
	beq.w	L0005f6
	cmp.b	#$0a,d1
	bhi.w	L0005f6
	cmp.l	#$000000ff,d2
	bhi.w	L0005f6
	move.b	d2,(L006eb3)
	bra.w	L0005f6

L0006f2:
	cmp.b	#$62,d0			;'b'
	bne.s	L000720
	cmpi.b	#$3a,(a0)+		;':'
	bne.s	L000732
L0006fe:
	move.b	(a0),d0
	beq.w	L0005f6
	cmp.b	#$2f,d0			;'/'
	beq.w	L0005f6
	addq.l	#1,a0
	cmp.b	#$09,d0
	beq.w	L0005f6
	cmp.b	#$20,d0			;' '
	bne.s	L0006fe
	bra.w	L0005f6

L000720:
	cmp.b	#$70,d0			;'p'
	bne.s	L000732
	move.b	#-$01,(L006eb1)
	bra.w	L0005f6

L000732:
	move.b	(L006eb1),d0
	and.b	d0,(L006eaf)
	rts

L000740:
	movea.l	#$ffffffff,a1
	movea.l	a1,a2
	movea.l	a1,a3
	movea.l	a1,a4
	clr.b	d1
	lea.l	(L006ec8),a0
	bsr.w	L001d0e
	adda.l	d0,a0
	moveq.l	#$ff,d0
	tst.b	(a0)
	beq.w	L000b26
	lea.l	(L006ec8),a0
L000768:
	bsr.w	L000b9e
	beq.w	L000bca
L000770:
	move.b	(a0)+,d0
	beq.w	L000818
	tst.b	d1
	beq.s	L00077e
	clr.b	d1
	bra.s	L000770

L00077e:
	cmp.b	#$80,d0
	bcs.s	L000796
	cmp.b	#$a0,d0
	bcs.s	L000790
	cmp.b	#$e0,d0
	bcs.s	L000796
L000790:
	move.b	#$01,d1
	bra.s	L000770

L000796:
	cmp.b	#$22,d0			;'"'
	beq.w	L000b2a
	cmp.b	#$27,d0			;'''
	beq.w	L000b38
	cmp.b	#$3c,d0			;'<'
	beq.s	L0007ea
	cmp.b	#$7c,d0			;'|'
	beq.s	L0007da
	cmp.b	#$3e,d0			;'>'
	bne.s	L000770
	cmpa.l	#$ffffffff,a2
	bne.w	L000bea
	movea.l	a0,a2
	cmpa.l	#$ffffffff,a3
	bne.s	L0007d0
	movea.l	a0,a3
	subq.l	#1,a3
L0007d0:
	cmpi.b	#$3e,(a0)		;'>'
	bne.s	L000768
	addq.l	#1,a0
	bra.s	L000768

L0007da:
	movea.l	a0,a4
	cmpa.l	#$ffffffff,a3
	bne.s	L000808
	movea.l	a0,a3
	subq.l	#1,a3
	bra.s	L000808

L0007ea:
	cmpa.l	#$ffffffff,a1
	bne.w	L000be2
	movea.l	a0,a1
	cmpa.l	#$ffffffff,a3
	bne.w	L000768
	movea.l	a0,a3
	subq.l	#1,a3
	bra.w	L000768

L000808:
	cmpi.b	#$7c,(a0)		;'|'
	bne.s	L000810
	addq.l	#1,a0
L000810:
	bsr.w	L000b9e
	beq.w	L000bca
L000818:
	cmpa.l	#$ffffffff,a1
	beq.s	L000854
	tst.b	(L006ea9)
	bne.w	L000be2
	movea.l	a1,a0
	bsr.w	L000b46
	tst.b	(a0)
	beq.w	L000bca
	clr.l	(L0064ba)
	lea.l	(L006eab),a5
	tst.b	(L006eaa)
	bne.s	L000850
	lea.l	(L006eac),a5
L000850:
	clr.b	(a5)
	bra.s	L000884

L000854:
	tst.b	(L006ea9)
	beq.w	L0008e0
	clr.b	(L006ea9)
	lea.l	(L006c32),a0
	lea.l	(L006eab),a5
	tst.b	(L006eaa)
	bne.s	L000884
	lea.l	(L006d4a),a0
	lea.l	(L006eac),a5
L000884:
	tst.b	(a5)
	beq.s	L00088c
	move.b	#$02,(a5)
L00088c:
	clr.w	-(sp)
	DOS	_DUP
	addq.l	#2,sp
	move.w	d0,(L0064c4)
	clr.w	-(sp)
	move.l	a0,-(sp)
	DOS	_OPEN
	addq.l	#6,sp
	move.w	d0,(L0064c6)
	bmi.w	L000bda
	clr.w	-(sp)
	move.w	d0,-(sp)
	DOS	_DUP2
	addq.l	#4,sp
	clr.w	-(sp)
	clr.w	-(sp)
	DOS	_IOCTRL
	addq.l	#4,sp
	btst.l	#$07,d0
	beq.s	L0008d2
	clr.w	-(sp)
	move.w	#$0006,-(sp)
	DOS	_IOCTRL
	addq.l	#4,sp
	tst.l	d0
	beq.w	L000bba
	bra.s	L0008e0

L0008d2:
	clr.w	-(sp)
	move.l	(L0064ba),-(sp)
	clr.w	-(sp)
	DOS	_SEEK
	addq.l	#8,sp
L0008e0:
	cmpa.l	#$ffffffff,a2
	beq.w	L0009f8
	cmpi.b	#$3e,(a2)		;'>'
	bne.w	L0009ae
	addq.l	#1,a2
	movea.l	a2,a0
	bsr.w	L000b46
	tst.b	(a0)
	beq.w	L000bca
	movea.l	a0,a2
	move.w	#$0001,-(sp)
	DOS	_DUP
	addq.l	#2,sp
	move.w	d0,(L0064c8)
	move.w	#$0002,-(sp)
	move.l	a0,-(sp)
	DOS	_OPEN
	addq.l	#6,sp
	move.w	d0,(L0064ca)
	bmi.w	L0009ca
	move.w	#$0001,-(sp)
	move.w	d0,-(sp)
	DOS	_DUP2
	addq.l	#4,sp
	move.w	#$0001,-(sp)
	clr.w	-(sp)
	DOS	_IOCTRL
	addq.l	#4,sp
	btst.l	#$07,d0
	beq.s	L000954
	move.w	#$0001,-(sp)
	move.w	#$0007,-(sp)
	DOS	_IOCTRL
	addq.l	#4,sp
	tst.l	d0
	beq.w	L000bc2
	bra.w	L0009f8

L000954:
	move.w	#$0002,-(sp)
	clr.l	-(sp)
	move.w	#$0001,-(sp)
	DOS	_SEEK
	addq.l	#8,sp
L000962:
	move.l	d0,d2
	beq.w	L0009f8
	move.w	#$0001,-(sp)
	move.l	#$ffffffff,-(sp)
	move.w	#$0001,-(sp)
	DOS	_SEEK
	addq.l	#8,sp
	move.l	#$00000001,-(sp)
	pea.l	(L006fc8)
	move.w	#$0001,-(sp)
	DOS	_READ
	lea.l	($000a,sp),sp
	cmpi.b	#$1a,(L006fc8)
	bne.s	L0009f8
	move.w	#$0001,-(sp)
	move.l	#$ffffffff,-(sp)
	move.w	#$0001,-(sp)
	DOS	_SEEK
	addq.l	#8,sp
	bra.s	L000962

L0009ae:
	movea.l	a2,a0
	bsr.w	L000b46
	tst.b	(a0)
	beq.w	L000bca
	movea.l	a0,a2
	move.w	#$0001,-(sp)
	DOS	_DUP
	addq.l	#2,sp
	move.w	d0,(L0064c8)
L0009ca:
	move.w	#$0020,-(sp)		;' '
	move.l	a0,-(sp)
	DOS	_CREATE
	addq.l	#6,sp
	tst.w	d0
	bpl.s	L0009e2
	move.w	#$0001,-(sp)
	move.l	a0,-(sp)
	DOS	_OPEN
	addq.l	#6,sp
L0009e2:
	move.w	d0,(L0064ca)
	bmi.w	L000bf2
	move.w	#$0001,-(sp)
	move.w	d0,-(sp)
	DOS	_DUP2
	addq.l	#4,sp
	clr.l	d2
L0009f8:
	cmpa.l	#$ffffffff,a4
	beq.w	L000b0a
	cmpi.b	#$7c,(a4)+		;'|'
	beq.w	L000aca
	subq.l	#1,a4
	move.b	#-$01,(L006ea9)
	cmpa.l	#$ffffffff,a2
	bne.s	L000a80
	lea.l	(L006c32),a0
	lea.l	(L006eab),a5
	tst.b	(L006eaa)
	beq.s	L000a3c
	lea.l	(L006d4a),a0
	lea.l	(L006eac),a5
L000a3c:
	clr.b	(a5)
	bsr.w	L000c48
	tst.l	d0
	beq.w	L000bf2
	clr.l	(L0064ba)
	move.w	#$0001,-(sp)
	DOS	_DUP
	addq.l	#2,sp
	move.w	d0,(L0064c8)
	move.w	#$0020,-(sp)		;' '
	move.l	a0,-(sp)
	DOS	_CREATE
	addq.l	#6,sp
	move.w	d0,(L0064ca)
	bmi.w	L000bf2
	move.b	#$01,(a5)
	move.w	#$0001,-(sp)
	move.w	d0,-(sp)
	DOS	_DUP2
	addq.l	#4,sp
	bra.s	L000ac2

L000a80:
	lea.l	(L006c32),a0
	lea.l	(L006eab),a5
	tst.b	(L006eaa)
	beq.s	L000aa0
	lea.l	(L006d4a),a0
	lea.l	(L006eac),a5
L000aa0:
	clr.b	(a5)
	move.l	d2,(L0064ba)
	move.l	a0,-(sp)
	movea.l	a2,a0
	bsr.w	L001c86
	movea.l	(sp)+,a0
	cmp.l	#$00000057,d0
	bhi.w	L000bd2
	movea.l	a2,a1
	bsr.w	L001c94
L000ac2:
	eori.b	#-$01,(L006eaa)
L000aca:
	movea.l	a4,a0
	bsr.w	L000b9e
	beq.w	L000bca
	movea.l	a0,a1
	bsr.w	L001c86
	tst.b	(L006ea3)
	beq.s	L000af2
	lea.l	(L0066d0),a0
	move.b	#-$01,(L006ea8)
	bra.s	L000b00

L000af2:
	lea.l	(L0065ce),a0
	move.b	#-$01,(L006ea7)
L000b00:
	move.b	#$ff,(a0)+
	move.b	d0,(a0)+
	bsr.w	L001c94
L000b0a:
	cmpa.l	#$ffffffff,a3
	beq.s	L000b14
	clr.b	(a3)
L000b14:
	lea.l	(L006ec8),a0
	bsr.w	L001c86
	move.b	d0,-(a0)
	beq.w	L000bca
	clr.l	d0
L000b26:
	tst.l	d0
	rts

L000b2a:
	move.b	(a0)+,d0
	beq.s	L000b26
	cmp.b	#$22,d0			;'"'
	bne.s	L000b2a
	bra.w	L000770

L000b38:
	move.b	(a0)+,d0
	beq.s	L000b26
	cmp.b	#$27,d0			;'''
	bne.s	L000b38
	bra.w	L000770

L000b46:
	bsr.w	L001d0e
	adda.l	d0,a0
	tst.b	(a0)
	beq.s	L000b9c
	move.l	a0,-(sp)
	clr.b	d1
L000b54:
	bsr.w	L001d0e
	tst.l	d0
	bne.s	L000b98
L000b5c:
	move.b	(a0),d0
	beq.s	L000b98
	tst.b	d1
	beq.s	L000b68
	clr.b	d1
	bra.s	L000b7e

L000b68:
	cmp.b	#$80,d0
	bcs.s	L000b82
	cmp.b	#$a0,d0
	bcs.s	L000b7a
	cmp.b	#$e0,d0
	bcs.s	L000b82
L000b7a:
	move.b	#$01,d1
L000b7e:
	addq.l	#1,a0
	bra.s	L000b5c

L000b82:
	cmp.b	#$3c,d0			;'<'
	beq.s	L000b98
	cmp.b	#$7c,d0			;'|'
	beq.s	L000b98
	cmp.b	#$3e,d0			;'>'
	beq.s	L000b98
	addq.l	#1,a0
	bra.s	L000b54

L000b98:
	clr.b	(a0)
	movea.l	(sp)+,a0
L000b9c:
	rts

L000b9e:
	bsr.w	L001d0e
	adda.l	d0,a0
	move.b	(a0),d0
	beq.s	L000bb8
	cmp.b	#$3c,d0			;'<'
	beq.s	L000bb8
	cmp.b	#$7c,d0			;'|'
	beq.s	L000bb8
	cmp.b	#$3e,d0			;'>'
L000bb8:
	rts

L000bba:
	lea.l	(L006020),a0
	bra.s	L000bf8

L000bc2:
	lea.l	(L006045),a0
	bra.s	L000bf8

L000bca:
	lea.l	(L00606a),a0
	bra.s	L000bf8

L000bd2:
	lea.l	(L005d37),a0
	bra.s	L000bf8

L000bda:
	lea.l	(L005ff6),a0
	bra.s	L000bf8

L000be2:
	lea.l	(L005fc8),a0
	bra.s	L000bf8

L000bea:
	lea.l	(L005fdf),a0
	bra.s	L000bf8

L000bf2:
	lea.l	(L00600d),a0
L000bf8:
	bsr.w	L002044
	tst.b	(L006ea3)
	beq.s	L000c0c
	clr.b	(L006ea8)
	beq.s	L000c12
L000c0c:
	clr.b	(L006ea7)
L000c12:
	clr.b	(L006ea9)
	tst.b	(L006eab)
	beq.s	L000c28
	move.b	#$02,(L006eab)
L000c28:
	tst.b	(L006eac)
	beq.s	L000c38
	move.b	#$02,(L006eac)
L000c38:
	move.l	#$00000700,d0
	move.l	d0,(L0064b6)
	bra.w	L000b26

L000c48:
	movem.l	a0,-(sp)
	lea.l	(L005b78),a0
	DOS	_GETPDB
	movea.l	d0,a1
	movea.l	(a1),a1
	bsr.w	L001ef2
	beq.s	L000c84
	tst.b	(a0)
	beq.s	L000c84
	movea.l	a0,a1
	movem.l	(sp),a0
	bsr.w	L001c94
	bsr.w	L0028f6
	move.b	(a0),d0
	movem.l	(sp),a0
	beq.s	L000c9a
	lea.l	(L005b5b),a1
	bsr.w	L001cb8
	bra.s	L000c9a

L000c84:
	movem.l	(sp),a0
	lea.l	(L005b59),a1
	bsr.w	L001c94
	DOS	_CURDRV
	add.w	#$0061,d0
	move.b	d0,(a0)
L000c9a:
	lea.l	(L005b5d),a1
	bsr.w	L001cb8
	bsr.w	L001df0
	bsr.w	L0028f6
L000cac:
	movem.l	(sp),a1
	move.w	#$00ff,-(sp)
	move.l	a1,-(sp)
	pea.l	(L007412)
	DOS	_FILES
	lea.l	($000a,sp),sp
	tst.l	d0
	bmi.s	L000ce6
	lea.l	($0007,a0),a1
	move.w	#$0002,d1
L000cce:
	tst.w	d1
	beq.s	L000ce4
	addq.b	#1,(a1)
	cmpi.b	#$39,(a1)		;'9'
	bls.s	L000cac
	move.b	#$30,(a1)		;'0'
	subq.l	#1,a1
	dbra.w	d1,L000cce
L000ce4:
	clr.l	d0
L000ce6:
	movem.l	(sp)+,a0
	rts

L000cec:
	tst.b	(L006ea3)
	beq.s	L000d24
	tst.b	(L006ea8)
	bne.s	L000d68
	cmpi.b	#$01,(L006ea5)
	beq.s	L000d34
	tst.b	(L006e9e)
	beq.w	L001076
	bsr.w	L000430
	move.b	#-$01,(L006ead)
	clr.b	(L006ea3)
	rts

L000d24:
	tst.b	(L006ea7)
	bne.s	L000d48
	tst.b	(L006ea5)
	beq.s	L000d88
L000d34:
	movea.l	(L0064be),a0
	tst.b	(a0)
	bne.w	L0011d4
	clr.b	(L006ea5)
	rts

L000d48:
	clr.b	(L006ea7)
	lea.l	(L0065ce),a1
	lea.l	(L006ec6),a0
	move.b	(a1)+,(a0)+
	move.b	(a1)+,d0
	move.b	d0,(a0)+
	bsr.w	L001c94
	tst.b	d0
	rts

L000d68:
	clr.b	(L006ea8)
	lea.l	(L0066d0),a1
	lea.l	(L006ec6),a0
	move.b	(a1)+,(a0)+
	move.b	(a1)+,d0
	move.b	d0,(a0)+
	bsr.w	L001c94
	tst.b	d0
	rts

L000d88:
	tst.b	(L006eae)
	beq.s	L000d9c
	tst.b	(L006eb1)
	bne.s	L000d9c
	bsr.w	L00486c
L000d9c:
	movea.l	(L0064ae),a0
	move.l	a0,(L0064b2)
	clr.l	(L0064b6)
	lea.l	(L006ec6),a0
	lea.l	(L0064cc),a1
	move.b	(a1)+,(a0)+
	move.b	(a1)+,(a0)+
	bsr.w	L001c94
L000dc2:
	bsr.w	L0005a4
L000dc6:
	pea.l	(L006ec6)
	DOS	_GETS
	addq.l	#4,sp
	tst.b	(L006ec7)
	beq.w	L000faa
	lea.l	(L006ec8),a0
	bsr.w	L001d0e
	tst.b	(a0,d0.l)
	beq.w	L000faa
	cmpi.b	#$2b,(a0)+		;'+'
	beq.w	L000e7a
	cmpi.b	#$2d,(-$0001,a0)	;'-'
	bne.w	L000fb2
	moveq.l	#$01,d0
	tst.b	(a0)
	beq.s	L000e1c
	bsr.w	L001bea
	tst.b	d1
	bmi.w	L000ea6
	cmp.b	#$0a,d1
	bhi.s	L000e30
	cmp.l	#$00010000,d0
	bcc.s	L000e30
L000e1c:
	movea.l	(L0064b2),a0
	movea.l	(L0064a6),a1
	addq.l	#4,a1
	bsr.w	L0020b2
	bne.s	L000e52
L000e30:
	movea.l	(L0064b2),a0
	bsr.w	L001c86
	movea.l	a0,a1
	lea.l	(L006ec7),a0
	bsr.w	L001036
	move.b	d0,(a0)+
	bsr.w	L001c94
	bra.w	L000dc6

L000e50:
	movea.l	a3,a0
L000e52:
	move.l	a0,(L0064b2)
	bsr.w	L001c86
	movea.l	a0,a1
	lea.l	(L006ec7),a0
	bsr.w	L001036
	move.b	d0,(a0)+
	bsr.w	L001c94
	bsr.w	L001ff4
	bsr.w	L001b4c
	bra.w	L000dc2

L000e7a:
	moveq.l	#$01,d0
	tst.b	(a0)
	beq.s	L000e98
	bsr.w	L001bea
	tst.b	d1
	bmi.w	L000f2c
	cmp.b	#$0a,d1
	bhi.s	L000e30
	cmp.l	#$00010000,d0
	bcc.s	L000e30
L000e98:
	movea.l	(L0064b2),a0
	bsr.w	L00209e
	bne.s	L000e52
	bra.s	L000e30

L000ea6:
	clr.b	d3
	cmpi.b	#$2f,(a0)+		;'/'
	beq.s	L000ebc
	cmpi.b	#$3f,(-$0001,a0)	;'?'
	bne.w	L000e30
	move.b	#-$01,d3
L000ebc:
	bsr.w	L001d4c
	bsr.w	L001c86
	movea.l	a0,a2
	move.l	d0,d1
	movea.l	(L0064b2),a3
L000ece:
	movea.l	a3,a0
	move.w	#$0001,d0
	movea.l	(L0064a6),a1
	addq.l	#4,a1
	bsr.w	L0020b2
	beq.w	L000e30
	movea.l	a0,a3
	movea.l	a0,a1
	lea.l	(L006fc8),a0
	bsr.w	L001c94
	bsr.w	L001d4c
	movea.l	a2,a1
	tst.b	d3
	bne.s	L000f08
	move.l	d1,d0
	bsr.w	L001cee
	beq.w	L000e50
	bra.s	L000ece

L000f08:
	move.l	d1,d0
	bsr.w	L001cee
	beq.w	L000e50
	move.b	(a0)+,d0
	beq.s	L000ece
	cmp.b	#$80,d0
	bcs.s	L000f08
	cmp.b	#$a0,d0
	bcs.s	L000f28
	cmp.b	#$e0,d0
	bcs.s	L000f08
L000f28:
	addq.l	#1,a0
	bra.s	L000f08

L000f2c:
	clr.b	d3
	cmpi.b	#$2f,(a0)+		;'/'
	beq.s	L000f42
	cmpi.b	#$3f,(-$0001,a0)	;'?'
	bne.w	L000e30
	move.b	#-$01,d3
L000f42:
	bsr.w	L001d4c
	bsr.w	L001c86
	movea.l	a0,a2
	move.l	d0,d1
	movea.l	(L0064b2),a3
L000f54:
	movea.l	a3,a0
	move.w	#$0001,d0
	bsr.w	L00209e
	beq.w	L000e30
	movea.l	a0,a3
	movea.l	a0,a1
	lea.l	(L006fc8),a0
	bsr.w	L001c94
	bsr.w	L001d4c
	movea.l	a2,a1
	tst.b	d3
	bne.s	L000f86
	move.l	d1,d0
	bsr.w	L001cee
	beq.w	L000e50
	bra.s	L000f54

L000f86:
	move.l	d1,d0
	bsr.w	L001cee
	beq.w	L000e50
	move.b	(a0)+,d0
	beq.s	L000f54
	cmp.b	#$80,d0
	bcs.s	L000f86
	cmp.b	#$a0,d0
	bcs.s	L000fa6
	cmp.b	#$e0,d0
	bcs.s	L000f86
L000fa6:
	addq.l	#1,a0
	bra.s	L000f86

L000faa:
	bsr.w	L001b4c
	clr.w	d0
	rts

L000fb2:
	bsr.w	L001b4c
	lea.l	(L006ec8),a0
	bsr.w	L001c86
	move.l	d0,d3
	movea.l	(L0064a6),a0
	move.l	(a0),d1
	add.l	a0,d1
	move.l	(L0064aa),d2
	add.l	d2,d0
	addq.l	#2,d0
	cmp.l	d0,d1
	bcc.s	L000ffa
	sub.l	d1,d0
	addq.l	#3,d0
	adda.l	d0,a0
L000fe0:
	tst.b	(a0)+
	bne.s	L000fe0
	movea.l	a0,a1
	movea.l	(L0064a6),a0
	addq.l	#4,a0
	bsr.w	L00207e
	subq.l	#1,a0
	move.l	a0,(L0064aa)
L000ffa:
	movea.l	(L0064aa),a0
	move.l	a0,(L0064ae)
	lea.l	(L006ec8),a1
	bsr.w	L001c94
	adda.l	d3,a0
	addq.l	#1,a0
	move.l	a0,(L0064aa)
	clr.b	(a0)
	lea.l	(L0064cc),a0
	lea.l	(L006ec6),a1
	move.b	(a1)+,(a0)+
	move.b	(a1)+,(a0)+
	bsr.w	L001c94
	move.w	#$ffff,d0
	rts

L001036:
	movem.l	d0/d4/a0-a1,-(sp)
	clr.l	d4
	addq.l	#1,a0
L00103e:
	move.b	(a0)+,d0
	beq.s	L00104e
	addq.l	#1,d4
	cmp.b	#$20,d0			;' '
	bcc.s	L00103e
	addq.l	#1,d4
	bra.s	L00103e

L00104e:
	move.w	d4,-(sp)
	bsr.w	L0005a4
	move.w	(sp),d4
L001056:
	move.w	#$0020,-(sp)		;' '
	DOS	_INPOUT
	addq.l	#2,sp
	dbra.w	d4,L001056
	move.w	(sp)+,d4
L001064:
	move.w	#$0008,-(sp)
	DOS	_INPOUT
	addq.l	#2,sp
	dbra.w	d4,L001064
	movem.l	(sp)+,d0/d4/a0-a1
	rts

L001076:
	bsr.w	L0005a4
	DOS	_KEYSNS
	clr.b	d1
	movea.l	(L00649e),a0
	lea.l	(L006ec8),a1
L00108a:
	move.b	(a0),d0
	beq.s	L0010b4
	cmp.b	#$1a,d0
	beq.s	L0010b4
	cmp.b	#$0d,d0
	beq.s	L0010ae
	addq.l	#1,a0
	cmp.b	#$25,d0			;'%'
	beq.s	L001116
L0010a2:
	cmp.b	#$ff,d1
	beq.s	L0010d4
	move.b	d0,(a1)+
	addq.b	#1,d1
	bra.s	L00108a

L0010ae:
	bsr.w	L00208a
	bra.s	L0010bc

L0010b4:
	move.b	#-$01,(L006e9e)
L0010bc:
	clr.b	(a1)
	move.b	d1,(L006ec7)
	move.l	a0,(L00649e)
	bsr.w	L001162
	move.w	#$ffff,d0
	rts

L0010d4:
	clr.b	(a1)
	bsr.w	L00116a
	lea.l	(L005d22),a0
	bsr.w	L002044
	bsr.w	L000430
	move.l	#$00000400,(L0064b6)
	clr.b	(L006ec7)
	clr.b	(L006ec8)
	move.b	#-$01,(L006ead)
	clr.b	(L006ea8)
	clr.b	(L006ea3)
	clr.w	d0
	rts

L001116:
	move.b	(a0),d2
	cmp.b	#$25,d2			;'%'
	beq.s	L00115c
	cmp.b	#$30,d2			;'0'
	bcs.s	L00117a
	cmp.b	#$39,d2			;'9'
	bhi.s	L00117a
	addq.l	#1,a0
	sub.b	#$30,d2			;'0'
	ext.w	d2
	movea.l	a0,a2
	lea.l	(L0067d2),a0
	exg.l	d0,d2
	bsr.w	L00209e
	exg.l	d0,d2
	beq.s	L001156
L001144:
	move.b	(a0),d0
	beq.s	L001156
	cmp.b	#$ff,d1
	beq.s	L0010d4
	move.b	d0,(a1)+
	addq.l	#1,a0
	addq.b	#1,d1
	bra.s	L001144

L001156:
	movea.l	a2,a0
	bra.w	L00108a

L00115c:
	addq.l	#1,a0
	bra.w	L0010a2

L001162:
	tst.b	(L006ead)
	beq.s	L001178
L00116a:
	lea.l	(L006ec8),a0
	bsr.w	L001ff4
	bsr.w	L001b4c
L001178:
	rts

L00117a:
	movea.l	a0,a3
	movea.l	a1,a4
	clr.b	d0
	lea.l	(L006fc8),a1
L001186:
	move.b	(a0)+,d2
	beq.s	L0011c8
	cmp.b	#$1a,d2
	beq.s	L0011c8
	cmp.b	#$0d,d2
	beq.s	L0011c8
	cmp.b	#$25,d2			;'%'
	beq.s	L0011a8
	cmp.b	#$ff,d0
	beq.s	L0011c8
	move.b	d2,(a1)+
	addq.b	#1,d0
	bra.s	L001186

L0011a8:
	movea.l	a0,a2
	move.b	#$3d,(a1)+		;'='
	clr.b	(a1)
	lea.l	(L006fc8),a0
	DOS	_GETPDB
	movea.l	d0,a1
	movea.l	(a1),a1
	bsr.w	L001ef2
	beq.s	L0011c8
	movea.l	a4,a1
	bra.w	L001144

L0011c8:
	movea.l	a3,a0
	movea.l	a4,a1
	move.b	(-$0001,a0),d0
	bra.w	L0010a2

L0011d4:
	bsr.w	L0005a4
	DOS	_KEYSNS
L0011da:
	clr.b	d1
	clr.b	d5
	lea.l	(L006b1a),a0
	lea.l	(L006ec8),a1
L0011ea:
	move.b	(a0),d0
	beq.s	L001206
	addq.l	#1,a0
	cmp.b	#$25,d0			;'%'
	beq.w	L0012da
L0011f8:
	cmp.b	#$ff,d1
	beq.w	L0012aa
	move.b	d0,(a1)+
	addq.b	#1,d1
	bra.s	L0011ea

L001206:
	clr.b	(a1)
	move.b	d1,(L006ec7)
	tst.b	(L006ea6)
	bne.s	L001260
	tst.b	d5
	bne.s	L001282
	movea.l	(L0064be),a0
	bsr.w	L002bc8
	tst.b	d0
	beq.s	L001288
	move.w	#$0025,-(sp)		;'%'
	move.l	a0,-(sp)
	pea.l	(L006e62)
	DOS	_FILES
	lea.l	($000a,sp),sp
L00123a:
	tst.l	d0
	bmi.w	L00135a
	move.b	(L006e77),d0
	and.b	#$1a,d0
	beq.s	L001258
	pea.l	(L006e62)
	DOS	_NFILES
	addq.l	#4,sp
	bra.s	L00123a

L001258:
	move.b	#-$01,(L006ea6)
L001260:
	pea.l	(L006e62)
	DOS	_NFILES
	addq.l	#4,sp
	tst.l	d0
	bmi.s	L00127c
	move.b	(L006e77),d0
	and.b	#$1a,d0
	beq.s	L0012a0
	bra.s	L001260

L00127c:
	clr.b	(L006ea6)
L001282:
	movea.l	(L0064be),a0
L001288:
	move.w	#$0001,d0
	bsr.w	L00209e
	move.l	a0,(L0064be)
	tst.b	(a0)
	bne.s	L0012a0
	clr.b	(L006ea5)
L0012a0:
	bsr.w	L001162
	move.w	#$ffff,d0
	rts

L0012aa:
	clr.b	(a1)
	bsr.w	L00116a
	lea.l	(L005d22),a0
	bsr.w	L002044
	move.l	#$00000400,(L0064b6)
	clr.b	(L006ec7)
	clr.b	(L006ec8)
	clr.b	(L006ea5)
	clr.w	d0
	rts

L0012da:
	move.b	#-$01,d5
	move.l	d0,d2
	movea.l	a0,a2
	movea.l	a1,a3
	lea.l	(L0068ea),a0
	bsr.w	L001c86
	move.l	d0,d4
	movea.l	a2,a1
	bsr.w	L001cee
	move.l	d0,d3
	movea.l	a3,a1
	movea.l	a2,a0
	move.l	d2,d0
	tst.l	d3
	bne.w	L0011f8
	adda.l	d4,a2
	movea.l	(L0064be),a0
	bsr.w	L002bc8
	tst.b	d0
	beq.s	L00138e
	tst.b	(L006ea6)
	bne.s	L001352
	move.w	#$0025,-(sp)		;'%'
	move.l	a0,-(sp)
	pea.l	(L006e62)
	DOS	_FILES
	lea.l	($000a,sp),sp
L00132e:
	tst.l	d0
	bmi.s	L00135a
	move.b	(L006e77),d0
	and.b	#$1a,d0
	beq.s	L00134a
	pea.l	(L006e62)
	DOS	_NFILES
	addq.l	#4,sp
	bra.s	L00132e

L00134a:
	move.b	#-$01,(L006ea6)
L001352:
	lea.l	(L006e80),a0
	bra.s	L00138e

L00135a:
	movea.l	(L0064be),a0
	move.w	#$0001,d0
	bsr.w	L00209e
	move.l	a0,(L0064be)
	tst.b	(a0)
	bne.w	L0011da
	clr.b	(L006ec7)
	clr.b	(L006ec8)
	bsr.w	L001162
	clr.b	(L006ea5)
	clr.w	d0
	rts

L00138e:
	move.b	(a0),d0
	beq.s	L0013a2
	cmp.b	#$ff,d1
	beq.w	L0012aa
	move.b	d0,(a1)+
	addq.l	#1,a0
	addq.b	#1,d1
	bra.s	L00138e

L0013a2:
	movea.l	a2,a0
	bra.w	L0011ea

L0013a8:
	lea.l	(L006ec8),a0
	lea.l	(L0070ca),a1
	lea.l	(L0071e2),a2
	bsr.w	L001aa6
	movea.l	a1,a0
	bsr.w	L001d4c
	lea.l	(L005a4a),a1
	bsr.w	L001ccc
	beq.s	L0013e4
	lea.l	(L005a56),a1
	bsr.w	L001ccc
	beq.s	L0013e4
	bsr.w	L000740
	bne.w	L0014fa
L0013e4:
	lea.l	(L006ec8),a0
	bsr.w	L001d0e
	adda.l	d0,a0
	move.b	(a0),d1
	beq.w	L0014fa
	cmp.b	#$3a,d1			;':'
	beq.w	L0014fa
	bsr.w	L001c86
	cmp.l	#$00000002,d0
	bne.s	L001416
	move.b	d1,d0
	cmpi.b	#$3a,($0001,a0)		;':'
	beq.w	L0015f4
L001416:
	movea.l	a0,a1
	lea.l	(L007466),a0
	clr.b	d1
	clr.b	d2
L001422:
	move.b	(a1)+,d0
	beq.s	L00147e
	tst.b	d2
	beq.s	L00142e
	clr.b	d2
	bra.s	L001470

L00142e:
	cmp.b	#$80,d0
	bcs.s	L001446
	cmp.b	#$a0,d0
	bcs.s	L001440
	cmp.b	#$e0,d0
	bcs.s	L001446
L001440:
	move.b	#$01,d2
	bra.s	L001470

L001446:
	cmp.b	#$5c,d0			;'\'
	beq.s	L00147e
	cmp.b	#$20,d0			;' '
	beq.s	L00147e
	cmp.b	#$09,d0
	beq.s	L00147e
	cmp.b	#$2f,d0			;'/'
	beq.s	L00147e
	cmp.b	#$22,d0			;'"'
	beq.s	L00147e
	cmp.b	#$27,d0			;'''
	beq.s	L00147e
	cmp.b	#$3d,d0			;'='
	beq.s	L00147e
L001470:
	move.b	d0,(a0)+
	addq.b	#1,d1
	cmp.b	#$17,d1
	bhi.w	L00179a
	bra.s	L001422

L00147e:
	clr.b	(a0)
	subq.l	#1,a1
	tst.b	d1
	beq.s	L0014fe
	movea.l	a1,a0
L001488:
	bsr.w	L001d0e
	adda.l	d0,a0
	cmpi.b	#$3d,(a0)+		;'='
	beq.s	L001488
	subq.l	#1,a0
	movea.l	a0,a1
	bsr.w	L001c86
	lea.l	(L006fc8),a0
	move.b	d0,(a0)+
	bsr.w	L001c94
	lea.l	(L00744e),a0
	lea.l	(L007466),a1
	bsr.w	L001c94
	bsr.w	L001d4c
	bsr.w	L00156a
	tst.b	(a0)
	beq.s	L001504
	move.l	a0,-(sp)
	lea.l	(L006fc9),a0
	lea.l	(L0070ca),a1
	lea.l	(L0071e2),a2
	bsr.w	L001aa6
	move.w	d0,(L006ec4)
	move.w	d1,(L006ec2)
	movea.l	(sp)+,a0
	movea.l	($0008,a0),a0
	jsr	(a0)
	tst.l	d0
	beq.s	L0014fa
	move.l	d0,(L0064b6)
L0014fa:
	clr.l	d0
	rts

L0014fe:
	move.w	#$ffff,d0
	rts

L001504:
	bsr.w	L002d7a
	beq.s	L0014fe
	bsr.s	L00158a
	tst.l	(a0)
	beq.s	L0014fe
	move.l	a0,-(sp)
	lea.l	(L006fc9),a0
	lea.l	(L0070ca),a1
	lea.l	(L0071e2),a2
	bsr.w	L001aa6
	move.w	d1,d2
	move.w	d0,d1
	bsr.w	L0004a2
	bsr.w	L001c86
	lea.l	(L0015d4),a3
	movea.l	(sp)+,a4
	jsr	(a4)
	move.l	d0,-(sp)
	bsr.w	L0004ee
	move.l	(sp)+,d0
	beq.s	L0014fa
	bmi.s	L00155a
	move.l	d0,(L0064b6)
	move.l	a0,d0
	beq.s	L0014fa
	bsr.w	L002044
	bra.s	L0014fa

L00155a:
	bsr.w	L002ccc
	move.l	d0,(L0064b6)
	bsr.w	L00047a
	bra.s	L0014fa

L00156a:
	lea.l	(L00744e),a1
	lea.l	(L0058b2),a0
L001576:
	tst.b	(a0)
	beq.s	L001588
	bsr.w	L001ccc
	beq.s	L001588
	adda.l	#$0000000c,a0
	bra.s	L001576

L001588:
	rts

L00158a:
	lea.l	(L00744e),a1
	lea.l	(L000000-$000004),a0
L001596:
	movea.l	(a0),a0
	tst.l	(a0)
	beq.s	L0015d2
	move.l	a0,-(sp)
	clr.l	d0
	movea.l	($002a,a0),a0
	clr.l	d0
L0015a6:
	tst.l	(a0)
	beq.s	L0015c0
	move.l	d0,-(sp)
	move.l	a0,-(sp)
	movea.l	(a0),a0
	bsr.w	L001ccc
	beq.s	L0015c4
	movea.l	(sp)+,a0
	move.l	(sp)+,d0
	addq.l	#4,a0
	addq.l	#4,d0
	bra.s	L0015a6

L0015c0:
	movea.l	(sp)+,a0
	bra.s	L001596

L0015c4:
	addq.l	#4,sp
	move.l	(sp)+,d0
	movea.l	(sp)+,a0
	movea.l	($002e,a0),a0
	movea.l	(a0,d0.l),a0
L0015d2:
	rts

L0015d4:
	cmp.l	#$00000034,d7
	bhi.s	L0015f0
	asl.w	#2,d7
	lea.l	(Table1),a3
L0015e4:
	move.l	(a3,d7.l),-(sp)
L0015e8:
	lea.l	(L0015d4),a3
	rts

L0015f0:
	moveq.l	#$ff,d0
	rts

L0015f4:
	bsr.w	L001d3a
	sub.b	#$41,d0			;'A'
	clr.w	d1
	move.b	d0,d1
	bsr.w	L002754
	tst.l	d0
	bmi.s	L001610
	move.w	d1,-(sp)
	DOS	_CHGDRV
	addq.l	#2,sp
	bra.s	L001624

L001610:
	lea.l	(L005d9d),a0
	bsr.w	L002044
	move.l	#$00000500,(L0064b6)
L001624:
	clr.w	d0
	rts

L001628:
	lea.l	(L006ec8),a0
	bsr.w	L001d0e
	adda.l	d0,a0
	lea.l	(L006fc8),a1
	clr.w	d1
L00163c:
	move.b	(a0),d0
	beq.s	L001678
	cmp.b	#$3f,d0			;'?'
	beq.w	L001782
	cmp.b	#$2a,d0			;'*'
	beq.w	L001782
	cmp.b	#$2f,d0			;'/'
	beq.s	L001678
	cmp.b	#$2d,d0			;'-'
	beq.s	L001678
	cmp.b	#$22,d0			;'"'
	beq.s	L001678
	cmp.b	#$27,d0			;'''
	beq.s	L001678
	bsr.w	L001d0e
	tst.l	d0
	bne.s	L001676
	move.b	(a0)+,(a1)+
	addq.w	#1,d1
	bra.s	L00163c

L001676:
	adda.l	d0,a0
L001678:
	tst.w	d1
	beq.w	L0017b6
	clr.b	(a1)
	lea.l	(L006fc8),a2
	move.l	a2,-(sp)
	clr.b	d2
	clr.b	d3
L00168c:
	cmp.b	d1,d2
	beq.s	L0016c4
	move.b	(a2)+,d0
	tst.b	d3
	beq.s	L00169a
	clr.b	d3
	bra.s	L0016c0

L00169a:
	cmp.b	#$80,d0
	bcs.s	L0016b2
	cmp.b	#$a0,d0
	bcs.s	L0016ac
	cmp.b	#$e0,d0
	bcs.s	L0016b2
L0016ac:
	move.b	#$01,d3
	bra.s	L0016c0

L0016b2:
	cmpi.b	#$3a,d0			;':'
	beq.s	L0016be
	cmpi.b	#$5c,d0			;'\'
	bne.s	L0016c0
L0016be:
	move.l	a2,(sp)
L0016c0:
	addq.b	#1,d2
	bra.s	L00168c

L0016c4:
	movea.l	(sp)+,a2
	cmpa.l	a1,a2
	beq.w	L0017b6
	move.l	a1,d0
	sub.l	a2,d0
	cmpi.w	#$0016,d0
	bhi.w	L00179a
	lea.l	(L007466),a3
	movea.l	a2,a4
	subq.w	#1,d0
L0016e2:
	move.b	(a4)+,(a3)+
	dbra.w	d0,L0016e2
	clr.b	(a3)
	lea.l	(L0072fa),a3
	lea.l	(L006fc8),a4
	move.l	a2,d0
	sub.l	a4,d0
	clr.b	(L00747f)
	cmp.l	#$00000040,d0
	bhi.w	L0017a2
	tst.l	d0
	beq.s	L001740
	move.b	#$01,(L00747f)
	cmp.l	#$00000002,d0
	bcs.s	L001740
	cmpi.b	#$3a,($0001,a4)		;':'
	bne.s	L001740
	move.l	d0,d1
	move.b	(a4),d0
	bsr.w	L001d3a
	sub.b	#$41,d0			;'A'
	bsr.w	L002754
	tst.l	d0
	bmi.s	L00178a
	move.l	d1,d0
	bra.s	L001740

L00173e:
	move.b	(a4)+,(a3)+
L001740:
	dbra.w	d0,L00173e
	clr.b	(a3)
	lea.l	(L007466),a1
	clr.b	(L00747e)
L001752:
	move.b	(a1)+,d0
	beq.s	L001764
	cmp.b	#$2e,d0			;'.'
	bne.s	L001752
	move.b	#-$01,(L00747e)
L001764:
	clr.b	d1
	lea.l	(L006fc9),a1
L00176c:
	move.b	(a0)+,(a1)+
	beq.s	L001776
	addq.b	#1,d1
	beq.s	L001792
	bra.s	L00176c

L001776:
	move.b	d1,(L006fc8)
	move.w	#$ffff,d0
	rts

L001782:
	lea.l	(L005d86),a0
	bra.s	L0017a8

L00178a:
	lea.l	(L005d9d),a0
	bra.s	L0017a8

L001792:
	lea.l	(L005d22),a0
	bra.s	L0017a8

L00179a:
	lea.l	(L005d37),a0
	bra.s	L0017a8

L0017a2:
	lea.l	(L005d50),a0
L0017a8:
	bsr.w	L002044
	move.l	#$00000600,(L0064b6)
L0017b6:
	clr.w	d0
	rts

L0017ba:
	clr.w	-(sp)
	pea.l	(L0072fa)
	DOS	_OPEN
	addq.l	#6,sp
	tst.l	d0
	bmi.w	L00188a
	move.w	d0,(L0064c2)
	move.w	#$0002,-(sp)
	clr.l	-(sp)
	move.w	(L0064c2),-(sp)
	DOS	_SEEK
	addq.l	#8,sp
	addq.l	#5,d0
	bsr.w	L0003ea
	tst.l	d0
	bmi.w	L00188a
	clr.w	-(sp)
	clr.l	-(sp)
	move.w	(L0064c2),-(sp)
	DOS	_SEEK
	addq.l	#8,sp
	movea.l	(L00649a),a0
	move.l	(a0)+,d1
	subq.l	#4,d1
	move.l	a0,(L00649e)
	move.l	d1,-(sp)
	move.l	a0,-(sp)
	move.w	(L0064c2),-(sp)
	DOS	_READ
	lea.l	($000a,sp),sp
	tst.l	d0
	bmi.s	L00187c
	adda.l	d0,a0
	move.b	#$1a,(a0)
	move.w	(L0064c2),-(sp)
	DOS	_CLOSE
	addq.l	#2,sp
	lea.l	(L007466),a1
	lea.l	(L0067d2),a0
	bsr.w	L001c94
	bsr.w	L001c86
	adda.l	d0,a0
	addq.l	#1,a0
	lea.l	(L006fc9),a1
	bsr.w	L0020e6
	move.b	#-$01,d0
	tst.b	(L006ea5)
	beq.s	L001868
	move.b	d0,(L006ea5)
	move.b	#$01,d0
L001868:
	move.b	d0,(L006ea3)
	clr.b	(L006ea8)
	clr.b	(L006e9e)
	rts

L00187c:
	bsr.w	L000430
	move.w	(L0064c2),-(sp)
	DOS	_CLOSE
	addq.l	#2,sp
L00188a:
	lea.l	(L005cde),a0
	bsr.w	L002044
	move.l	#$00000400,(L0064b6)
	rts

L0018a0:
	tst.b	(L00747f)
	beq.s	L0018c0
	lea.l	(L007466),a1
	lea.l	(L0072fa),a0
	bsr.w	L001cb8
	lea.l	(L005b89),a3
	bra.s	L001900

L0018c0:
	DOS	_GETPDB
	movea.l	d0,a1
	movea.l	(a1),a1
	lea.l	(L005b6a),a0
	bsr.w	L001ef2
	bne.s	L0018d8
	lea.l	(L005b89),a0
L0018d8:
	movea.l	a0,a3
	lea.l	(L007466),a1
	lea.l	(L0072fa),a0
	bsr.w	L001c94
	bra.s	L001900

L0018ec:
	tst.b	(a3)
	bne.s	L0018fc
	tst.b	(L0072fa)
	bne.w	L0019da
	bra.s	L001900

L0018fc:
	bsr.w	L0019f8
L001900:
	tst.b	(L00747e)
	bne.s	L001922
	clr.b	d2
	lea.l	(L0072fa),a0
	bsr.w	L001c86
	movea.l	a0,a2
	adda.l	d0,a2
	lea.l	(L005b82),a1
	bsr.w	L001cb8
L001922:
	lea.l	(L0072fa),a0
	lea.l	(L007412),a1
	bsr.w	L001dd8
	tst.l	d0
	bmi.s	L0018ec
	tst.b	(L00747e)
	bne.s	L001966
L00193e:
	lea.l	(L007430),a0
	bsr.w	L001a58
	lea.l	(L007412),a1
	bsr.w	L001de8
	tst.l	d0
	bpl.s	L00193e
	tst.b	d2
	beq.s	L0018ec
	movea.l	a4,a1
	movea.l	a2,a0
	move.b	#$2e,(a0)+		;'.'
	bsr.w	L001c94
L001966:
	lea.l	(L0072fa),a0
	bsr.w	L001c86
	lea.l	(-$03,a0,d0.w),a1
	lea.l	(L00744e),a0
	bsr.w	L001c94
	bsr.w	L001d4c
	lea.l	(L005b36),a1
	bsr.w	L001ccc
	tst.w	d0
	beq.w	L0017ba
	lea.l	(L006fc8),a0
	lea.l	(L0072fa),a1
	bsr.w	L002de6
	tst.l	d0
	bpl.s	L0019bc
	lea.l	(L005de8),a0
	bsr.w	L002044
	move.l	#$00000600,(L0064b6)
	bra.s	L0019d6

L0019bc:
	cmp.l	#$00010000,d0
	bcs.s	L0019d0
	and.l	#$000000ff,d0
	or.l	#$00000100,d0
L0019d0:
	move.l	d0,(L0064b6)
L0019d6:
	clr.w	d0
	rts

L0019da:
	tst.b	(L006e9f)
	bne.s	L0019f6
	lea.l	(L005c83),a0
	bsr.w	L002044
	move.l	#$00000600,(L0064b6)
L0019f6:
	rts

L0019f8:
	lea.l	(L0072fa),a0
	clr.b	d3
L001a00:
	move.b	(a3)+,d0
	beq.s	L001a36
	cmp.b	#$3b,d0			;';'
	beq.s	L001a38
	move.b	d0,(a0)+
	tst.b	d3
	beq.s	L001a1e
	cmp.b	#$02,d3
	beq.s	L001a1c
	move.b	#$02,d3
	bra.s	L001a00

L001a1c:
	clr.b	d3
L001a1e:
	cmp.b	#$80,d0
	bcs.s	L001a00
	cmp.b	#$a0,d0
	bcs.s	L001a30
	cmp.b	#$e0,d0
	bcs.s	L001a00
L001a30:
	move.b	#$01,d3
	bra.s	L001a00

L001a36:
	subq.l	#1,a3
L001a38:
	move.b	(-$0001,a0),d0
	cmp.b	#$02,d3
	beq.s	L001a48
	cmp.b	#$5c,d0			;'\'
	beq.s	L001a4c
L001a48:
	move.b	#$5c,(a0)+		;'\'
L001a4c:
	lea.l	(L007466),a1
	bsr.w	L001c94
	rts

L001a58:
	bsr.w	L001d4c
	clr.l	d1
L001a5e:
	move.b	(a0)+,d0
	beq.s	L001a6c
	cmp.b	#$2e,d0			;'.'
	bne.s	L001a5e
	move.l	a0,d1
	bra.s	L001a5e

L001a6c:
	tst.l	d1
	beq.s	L001a98
	movea.l	d1,a0
	move.b	#$04,d1
	lea.l	(L005b30),a1
L001a7c:
	bsr.w	L001ccc
	tst.l	d0
	beq.s	L001a90
L001a84:
	tst.b	(a1)+
	bne.s	L001a84
	subq.b	#1,d1
	beq.s	L001a90
	tst.b	(a1)
	bne.s	L001a7c
L001a90:
	cmp.b	d2,d1
	bcs.s	L001a98
	movea.l	a1,a4
	move.b	d1,d2
L001a98:
	rts

L001a9a:
	pea.l	(L005bb7)
	DOS	_PRINT
	addq.l	#4,sp
	rts

L001aa6:
	movem.l	d2/a0-a2,-(sp)
	clr.l	d1
	clr.l	d2
L001aae:
	bsr.w	L001d0e
	adda.l	d0,a0
	tst.b	(a0)
	beq.w	L001b3a
	move.b	(a0)+,d0
	cmp.b	#$2d,d0			;'-'
	beq.s	L001ac8
	cmp.b	#$2f,d0			;'/'
	bne.s	L001af0
L001ac8:
	move.b	(a0)+,d0
	beq.s	L001b3a
L001acc:
	cmp.b	#$09,d0
	beq.s	L001aae
	cmp.b	#$20,d0			;' '
	beq.s	L001aae
	addq.l	#1,d2
	move.b	d0,(a2)+
	clr.b	(a2)+
	move.b	(a0)+,d0
	beq.s	L001b3a
	cmp.b	#$2d,d0			;'-'
	beq.s	L001ac8
	cmp.b	#$2f,d0			;'/'
	beq.s	L001ac8
	bra.s	L001acc

L001af0:
	addq.l	#1,d1
L001af2:
	move.b	d0,(a1)+
	cmp.b	#$22,d0			;'"'
	bne.s	L001b08
L001afa:
	move.b	(a0)+,d0
	beq.s	L001b3a
	move.b	d0,(a1)+
	cmp.b	#$22,d0			;'"'
	bne.s	L001afa
	bra.s	L001b1a

L001b08:
	cmp.b	#$27,d0			;'''
	bne.s	L001b1a
L001b0e:
	move.b	(a0)+,d0
	beq.s	L001b3a
	move.b	d0,(a1)+
	cmp.b	#$27,d0			;'''
	bne.s	L001b0e
L001b1a:
	move.b	(a0),d0
	beq.s	L001b3a
	cmp.b	#$2f,d0			;'/'
	beq.s	L001b34
	addq.l	#1,a0
	cmp.b	#$09,d0
	beq.s	L001b34
	cmp.b	#$20,d0			;' '
	beq.s	L001b34
	bra.s	L001af2

L001b34:
	clr.b	(a1)+
	bra.w	L001aae

L001b3a:
	clr.b	(a1)+
	clr.b	(a1)
	clr.b	(a2)+
	clr.b	(a2)
	move.l	d1,d0
	move.l	d2,d1
	movem.l	(sp)+,d2/a0-a2
	rts

L001b4c:
	pea.l	(L005bcf)
	DOS	_PRINT
	addq.l	#4,sp
	rts

L001b58:
	move.w	#$0020,-(sp)		;' '
	DOS	_PUTCHAR
	addq.l	#2,sp
	rts

L001b62:
	movem.l	d0-d2/a0-a1,-(sp)
	bsr.s	L001b7c
	bsr.s	L001ba4
	movem.l	(sp)+,d0-d2/a0-a1
	rts

L001b70:
	movem.l	d0-d2/a0-a1,-(sp)
	bsr.s	L001b7c
	movem.l	(sp)+,d0-d2/a0-a1
	rts

L001b7c:
	movem.l	a0,-(sp)
	lea.l	(L005acc),a1
L001b86:
	clr.b	d2
	move.l	(a1)+,d1
	beq.s	L001b9c
L001b8c:
	addq.b	#1,d2
	sub.l	d1,d0
	bcc.s	L001b8c
	add.l	d1,d0
	add.b	#$2f,d2			;'/'
	move.b	d2,(a0)+
	bra.s	L001b86

L001b9c:
	clr.b	(a0)
	movem.l	(sp)+,a0
	rts

L001ba4:
	move.b	(a0)+,d0
	beq.s	L001bba
	cmp.b	#$30,d0			;'0'
	bne.s	L001bba
	tst.b	(a0)
	beq.s	L001bba
	move.b	#$20,(-$0001,a0)	;' '
	bra.s	L001ba4

L001bba:
	rts

L001bbc:
	movem.l	d0-d2/a0,-(sp)
	addq.l	#8,a0
	clr.b	(a0)
	move.w	#$0007,d2
L001bc8:
	move.l	d0,d1
	and.b	#$0f,d1
	cmpi.b	#$09,d1
	bls.s	L001bd8
	add.b	#$27,d1			;'''
L001bd8:
	add.b	#$30,d1			;'0'
	move.b	d1,-(a0)
	lsr.l	#4,d0
	dbra.w	d2,L001bc8
	movem.l	(sp)+,d0-d2/a0
	rts

L001bea:
	movem.l	d2-d4/a0-a1,-(sp)
	bsr.s	L001c08
	movem.l	(sp)+,d2-d4/a0-a1
	rts

L001bf6:
	movem.l	d2-d4/a0-a1,-(sp)
	bsr.w	L001d0e
	adda.l	d0,a0
	bsr.s	L001c08
	movem.l	(sp)+,d2-d4/a0-a1
	rts

L001c08:
	clr.l	d0
	clr.b	d3
	clr.l	d4
	move.b	#$0a,d2
	cmpi.b	#$2d,(a0)		;'-'
	bne.s	L001c1e
	addq.l	#1,a0
	move.b	#-$01,d3
L001c1e:
	cmpi.b	#$30,(a0)		;'0'
	bne.s	L001c3a
L001c24:
	cmpi.b	#$30,(a0)+		;'0'
	beq.s	L001c24
	move.b	-(a0),d1
	cmp.b	#$31,d1			;'1'
	bcs.s	L001c38
	cmp.b	#$39,d1			;'9'
	bls.s	L001c3a
L001c38:
	subq.l	#1,a0
L001c3a:
	tst.b	d2
	beq.s	L001c7c
	move.b	(a0)+,d1
	beq.s	L001c7c
	cmp.b	#$30,d1			;'0'
	bcs.s	L001c7a
	cmp.b	#$39,d1			;'9'
	bhi.s	L001c7a
	sub.b	#$30,d1			;'0'
	and.l	#$0000000f,d1
	add.l	d0,d0
	bcs.s	L001c76
	move.l	d0,-(sp)
	add.l	d0,d0
	bcs.s	L001c74
	add.l	d0,d0
	bcs.s	L001c74
	add.l	(sp)+,d0
	bcs.s	L001c76
	add.l	d1,d0
	bcs.s	L001c76
	addq.l	#1,d4
	subq.b	#1,d2
	bra.s	L001c3a

L001c74:
	addq.l	#4,sp
L001c76:
	moveq.l	#$0b,d4
	bra.s	L001c82

L001c7a:
	not.l	d4
L001c7c:
	tst.b	d3
	beq.s	L001c82
	neg.l	d0
L001c82:
	move.l	d4,d1
	rts

L001c86:
	move.l	a0,-(sp)
	moveq.l	#$ff,d0
L001c8a:
	addq.l	#1,d0
	tst.b	(a0)+
	bne.s	L001c8a
	movea.l	(sp)+,a0
	rts

L001c94:
	movem.l	a0-a1,-(sp)
L001c98:
	move.b	(a1)+,(a0)+
	bne.s	L001c98
	movem.l	(sp)+,a0-a1
	rts

L001ca2:
	movem.l	d0/a0-a1,-(sp)
	tst.b	(a1)
	bra.s	L001cac

L001caa:
	move.b	(a1)+,(a0)+
L001cac:
	dbeq.w	d0,L001caa
	clr.b	(a0)
	movem.l	(sp)+,d0/a0-a1
	rts

L001cb8:
	movem.l	a0-a1,-(sp)
L001cbc:
	tst.b	(a0)+
	bne.s	L001cbc
	subq.l	#1,a0
L001cc2:
	move.b	(a1)+,(a0)+
	bne.s	L001cc2
	movem.l	(sp)+,a0-a1
	rts

L001ccc:
	movem.l	a0-a1,-(sp)
L001cd0:
	move.b	(a0)+,d0
	beq.s	L001ce2
	cmp.b	(a1)+,d0
	beq.s	L001cd0
	bcs.s	L001cde
	moveq.l	#$01,d0
	bra.s	L001ce8

L001cde:
	moveq.l	#$ff,d0
	bra.s	L001ce8

L001ce2:
	tst.b	(a1)
	bne.s	L001cde
	clr.l	d0
L001ce8:
	movem.l	(sp)+,a0-a1
	rts

L001cee:
	movem.l	a0-a1,-(sp)
	bra.s	L001cf8

L001cf4:
	cmpm.b	(a0)+,(a1)+
	bne.s	L001d00
L001cf8:
	dbra.w	d0,L001cf4
	clr.l	d0
	bra.s	L001d08

L001d00:
	bcs.s	L001d06
	moveq.l	#$01,d0
	bra.s	L001d08

L001d06:
	moveq.l	#$ff,d0
L001d08:
	movem.l	(sp)+,a0-a1
	rts

L001d0e:
	move.l	a0,-(sp)
L001d10:
	move.b	(a0)+,d0
	cmpi.b	#$20,d0			;' '
	beq.s	L001d10
	cmpi.b	#$09,d0
	beq.s	L001d10
	move.l	a0,d0
	movea.l	(sp)+,a0
	sub.l	a0,d0
	subq.l	#1,d0
	rts

L001d28:
	cmpi.b	#$41,d0			;'A'
	bcs.s	L001d38
	cmpi.b	#$5a,d0			;'Z'
	bhi.s	L001d38
	add.b	#$20,d0			;' '
L001d38:
	rts

L001d3a:
	cmpi.b	#$61,d0			;'a'
	bcs.s	L001d4a
	cmpi.b	#$7a,d0			;'z'
	bhi.s	L001d4a
	sub.b	#$20,d0			;' '
L001d4a:
	rts

L001d4c:
	movem.l	d0-d1/a0,-(sp)
	clr.b	d1
L001d52:
	move.b	(a0),d0
	beq.s	L001d8c
	tst.b	d1
	beq.s	L001d5e
	clr.b	d1
	bra.s	L001d74

L001d5e:
	cmp.b	#$80,d0
	bcs.s	L001d78
	cmp.b	#$a0,d0
	bcs.s	L001d70
	cmp.b	#$e0,d0
	bcs.s	L001d78
L001d70:
	move.b	#$01,d1
L001d74:
	addq.l	#1,a0
	bra.s	L001d52

L001d78:
	cmpi.b	#$41,d0			;'A'
	bcs.s	L001d88
	cmpi.b	#$5a,d0			;'Z'
	bhi.s	L001d88
	add.b	#$20,d0			;' '
L001d88:
	move.b	d0,(a0)+
	bra.s	L001d52

L001d8c:
	movem.l	(sp)+,d0-d1/a0
	rts

L001d92:
	movem.l	d0-d1/a0,-(sp)
	clr.b	d1
L001d98:
	move.b	(a0),d0
	beq.s	L001dd2
	tst.b	d1
	beq.s	L001da4
	clr.b	d1
	bra.s	L001dba

L001da4:
	cmp.b	#$80,d0
	bcs.s	L001dbe
	cmp.b	#$a0,d0
	bcs.s	L001db6
	cmp.b	#$e0,d0
	bcs.s	L001dbe
L001db6:
	move.b	#$01,d1
L001dba:
	addq.l	#1,a0
	bra.s	L001d98

L001dbe:
	cmpi.b	#$61,d0			;'a'
	bcs.s	L001dce
	cmpi.b	#$7a,d0			;'z'
	bhi.s	L001dce
	sub.b	#$20,d0			;' '
L001dce:
	move.b	d0,(a0)+
	bra.s	L001d98

L001dd2:
	movem.l	(sp)+,d0-d1/a0
	rts

L001dd8:
	move.w	#$0020,-(sp)		;' '
	move.l	a0,-(sp)
	move.l	a1,-(sp)
	DOS	_FILES
	lea.l	($000a,sp),sp
	rts

L001de8:
	move.l	a1,-(sp)
	DOS	_NFILES
	addq.l	#4,sp
	rts

L001df0:
	link.w	a6,#-$0118
	movem.l	d0-d2/a0-a3,-(sp)
	lea.l	(-$0118,a6),a1
	move.l	a0,-(sp)
	clr.w	d1
	move.b	($0001,a0),d0
	cmp.b	#$3a,d0			;':'
	bne.s	L001e1c
	move.b	(a0)+,d0
	bsr.w	L001d3a
	move.b	d0,(a1)+
	sub.b	#$40,d0			;'@'
	move.b	(a0)+,(a1)+
	move.w	d0,d1
	bra.s	L001e2c

L001e1c:
	DOS	_CURDRV
	move.b	d0,d1
	addq.b	#1,d1
	add.b	#$41,d0			;'A'
	move.b	d0,(a1)+
	move.b	#$3a,(a1)+		;':'
L001e2c:
	movea.l	a0,a2
	clr.b	d2
L001e30:
	move.b	(a2)+,d0
	beq.s	L001e62
	tst.b	d2
	beq.s	L001e3c
	clr.b	d2
	bra.s	L001e30

L001e3c:
	cmp.b	#$80,d0
	bcs.s	L001e54
	cmp.b	#$a0,d0
	bcs.s	L001e4e
	cmp.b	#$e0,d0
	bcs.s	L001e54
L001e4e:
	move.b	#$01,d2
	bra.s	L001e30

L001e54:
	cmp.b	#$5c,d0			;'\'
	beq.s	L001e5c
	bra.s	L001e30

L001e5c:
	cmpi.b	#$5c,(a0)		;'\'
	beq.s	L001e7e
L001e62:
	move.b	#$5c,(a1)+		;'\'
	move.l	a1,-(sp)
	move.w	d1,-(sp)
	DOS	_CURDIR
	addq.l	#6,sp
	movea.l	a1,a2
L001e70:
	tst.b	(a1)+
	bne.s	L001e70
	subq.l	#1,a1
	cmpa.l	a1,a2
	beq.s	L001e7e
	move.b	#$5c,(a1)+		;'\'
L001e7e:
	move.b	(a0)+,(a1)+
	bne.s	L001e7e
	clr.b	d2
	movea.l	(sp)+,a0
	lea.l	(-$0118,a6),a1
	lea.l	(sp),a3
	clr.l	-(sp)
L001e8e:
	move.b	(a1)+,d0
	tst.b	d2
	beq.s	L001e98
	clr.b	d2
	bra.s	L001ee4

L001e98:
	cmp.b	#$80,d0
	bcs.s	L001eb0
	cmp.b	#$a0,d0
	bcs.s	L001eaa
	cmp.b	#$e0,d0
	bcs.s	L001eb0
L001eaa:
	move.b	#$01,d2
	bra.s	L001ee4

L001eb0:
	cmp.b	#$5c,d0			;'\'
	bne.s	L001ee4
	cmpi.b	#$2e,(a1)		;'.'
	bne.s	L001ee2
	cmpi.b	#$5c,($0001,a1)		;'\'
	beq.s	L001ede
	cmpi.b	#$2e,($0001,a1)		;'.'
	bne.s	L001ee2
	cmpi.b	#$5c,($0002,a1)		;'\'
	bne.s	L001ee2
	move.l	(sp)+,d1
	beq.s	L001ee4
	movea.l	d1,a0
	addq.l	#2,a1
	bra.s	L001e8e

L001ede:
	addq.l	#1,a1
	bra.s	L001e8e

L001ee2:
	move.l	a0,-(sp)
L001ee4:
	move.b	d0,(a0)+
	bne.s	L001e8e
	lea.l	(a3),sp
	movem.l	(sp)+,d0-d2/a0-a3
	unlk	a6
	rts

L001ef2:
	movem.l	a1,-(sp)
	addq.l	#4,a1
	bsr.w	L001c86
L001efc:
	tst.b	(a1)
	beq.s	L001f16
	movem.l	d0,-(sp)
	bsr.w	L001cee
	beq.s	L001f1a
	movem.l	(sp)+,d0
	addq.l	#1,a1
L001f10:
	tst.b	(a1)+
	bne.s	L001f10
	bra.s	L001efc

L001f16:
	clr.b	d0
	bra.s	L001f26

L001f1a:
	movem.l	(sp)+,d0
	adda.l	d0,a1
	movea.l	a1,a0
	move.b	#-$01,d0
L001f26:
	movem.l	(sp)+,a1
	rts

L001f2c:
	link.w	a6,#-$0100
	movem.l	d1-d2/a0-a5,-(sp)
	movea.l	a0,a2
	movea.l	a1,a3
	movea.l	a0,a1
	lea.l	(-$0100,a6),a0
L001f3e:
	move.b	(a1)+,d0
	move.b	d0,(a0)+
	cmp.b	#$3d,d0			;'='
	bne.s	L001f3e
	movea.l	a1,a5
	clr.b	(a0)
	movea.l	a3,a1
	lea.l	(-$0100,a6),a0
	bsr.w	L001c86
	move.l	d0,d1
	bsr.s	L001ef2
	tst.b	d0
	beq.s	L001f8e
	suba.l	d1,a0
	bsr.w	L001c86
	movea.l	a0,a4
	move.l	d0,d1
	movea.l	a2,a0
	bsr.w	L001c86
	sub.l	d0,d1
	bcc.s	L001f7c
	neg.l	d1
	movea.l	a3,a0
	bsr.s	L001fd0
	cmp.l	d1,d0
	bcs.s	L001fc6
L001f7c:
	movea.l	a4,a0
	move.w	#$0001,d0
	bsr.w	L00209e
	movea.l	a0,a1
	movea.l	a4,a0
	bsr.w	L00207e
L001f8e:
	tst.b	(a5)
	beq.s	L001fc2
	movea.l	a2,a0
	bsr.w	L001c86
	addq.l	#1,d0
	move.l	d0,d1
	movea.l	a3,a0
	bsr.s	L001fd0
	cmp.l	d1,d0
	bcs.s	L001fc6
	movea.l	a3,a0
	addq.l	#4,a0
L001fa8:
	move.w	#$0001,d0
	bsr.w	L00209e
	bne.s	L001fa8
	movea.l	a2,a1
	bsr.w	L001c94
	bsr.w	L001c86
	adda.l	d0,a0
	addq.l	#1,a0
	clr.b	(a0)
L001fc2:
	moveq.l	#$ff,d0
	bra.s	L001fc8

L001fc6:
	clr.l	d0
L001fc8:
	movem.l	(sp)+,d1-d2/a0-a5
	unlk	a6
	rts

L001fd0:
	movem.l	d2/a1,-(sp)
	movea.l	a0,a1
	move.l	(a0)+,d0
	adda.l	d0,a1
L001fda:
	move.w	#$ffff,d0
	bsr.w	L00209e
	bne.s	L001fda
	addq.l	#1,a0
	suba.l	a0,a1
	bcc.s	L001fec
	suba.l	a1,a1
L001fec:
	move.l	a1,d0
	movem.l	(sp)+,d2/a1
	rts

L001ff4:
	movem.l	d0/a0,-(sp)
L001ff8:
	move.b	(a0)+,d0
	beq.s	L002022
	cmp.b	#$80,d0
	bcs.s	L00201e
	cmp.b	#$a0,d0
	bcs.s	L00200e
	cmp.b	#$e0,d0
	bcs.s	L00201e
L00200e:
	tst.b	(a0)
	beq.s	L002022
	bsr.s	L002028
	move.b	(a0)+,d0
	move.w	d0,-(sp)
	DOS	_PUTCHAR
	addq.l	#2,sp
	bra.s	L001ff8

L00201e:
	bsr.s	L002028
	bra.s	L001ff8

L002022:
	movem.l	(sp)+,d0/a0
	rts

L002028:
	move.w	d0,-(sp)
	cmp.b	#$20,d0			;' '
	bcc.s	L00203e
	add.b	#$40,d0			;'@'
	move.w	d0,(sp)
	move.w	#$005e,-(sp)		;'^'
	DOS	_PUTCHAR
	addq.l	#2,sp
L00203e:
	DOS	_PUTCHAR
	addq.l	#2,sp
	rts

L002044:
	movem.l	d0/a0,-(sp)
	bsr.w	L001c86
	move.l	d0,-(sp)
	move.l	a0,-(sp)
	move.w	#$0002,-(sp)
	DOS	_WRITE
	lea.l	($000a,sp),sp
	movem.l	(sp)+,d0/a0
	rts

L002060:
	bsr.w	L001d0e
	adda.l	d0,a0
	cmpi.b	#$2f,(a0)+		;'/'
	bne.s	L002074
	move.b	(a0)+,d0
	or.b	#$20,d0
	rts

L002074:
	tst.b	-(a0)
	beq.s	L00207c
	move.b	#$63,d0			;'c'
L00207c:
	rts

L00207e:
	move.b	(a1)+,(a0)+
	beq.s	L002088
L002082:
	move.b	(a1)+,(a0)+
	bne.s	L002082
	bra.s	L00207e

L002088:
	rts

L00208a:
	move.b	(a0),d0
	beq.s	L00209c
	cmp.b	#$1a,d0
	beq.s	L00209c
	addq.l	#1,a0
	cmp.b	#$0a,d0
	bne.s	L00208a
L00209c:
	rts

L00209e:
	tst.w	d0
	beq.s	L0020ae
	tst.b	(a0)
	beq.s	L0020b0
L0020a6:
	tst.b	(a0)+
	bne.s	L0020a6
	subq.w	#1,d0
	bra.s	L00209e

L0020ae:
	tst.b	(a0)
L0020b0:
	rts

L0020b2:
	tst.w	d0
	bne.s	L0020ba
L0020b6:
	tst.b	(a0)
	rts

L0020ba:
	cmpa.l	a0,a1
	bcc.s	L0020dc
L0020be:
	tst.b	-(a0)
	beq.s	L0020c8
	cmpa.l	a0,a1
	bcc.s	L0020dc
	bra.s	L0020be

L0020c8:
	tst.b	-(a0)
	beq.s	L0020d2
	cmpa.l	a0,a1
	bcc.s	L0020da
	bra.s	L0020c8

L0020d2:
	subq.w	#1,d0
	bne.s	L0020c8
	addq.l	#1,a0
	bra.s	L0020b6

L0020da:
	subq.w	#1,d0
L0020dc:
	bne.s	L0020e2
	tst.w	d0
	beq.s	L0020b6
L0020e2:
	clr.w	d0
	rts

L0020e6:
	move.l	a0,-(sp)
	movea.l	a1,a0
	bsr.w	L001d0e
	adda.l	d0,a0
	movea.l	a0,a1
	movea.l	(sp)+,a0
L0020f4:
	move.b	(a1)+,d0
	beq.s	L002132
	cmp.b	#$09,d0
	beq.s	L00212e
	cmp.b	#$20,d0			;' '
	beq.s	L00212e
	move.b	d0,(a0)+
	cmp.b	#$27,d0			;'''
	beq.s	L002120
	cmp.b	#$22,d0			;'"'
	bne.s	L0020f4
L002112:
	move.b	(a1)+,d0
	beq.s	L002132
	move.b	d0,(a0)+
	cmp.b	#$22,d0			;'"'
	bne.s	L002112
	bra.s	L0020f4

L002120:
	move.b	(a1)+,d0
	beq.s	L002132
	move.b	d0,(a0)+
	cmp.b	#$27,d0			;'''
	bne.s	L002120
	bra.s	L0020f4

L00212e:
	clr.b	(a0)+
	bra.s	L0020e6

L002132:
	clr.b	(a0)+
	clr.b	(a0)
	rts

L002138:
	move.l	a0,-(sp)
	DOS	_PRINT
	addq.l	#4,sp
	move.w	#$0008,-(sp)
	DOS	_KFLUSH
	addq.l	#2,sp
	rts

L002148:
	move.l	a0,-(sp)
	DOS	_PRINT
	addq.l	#4,sp
	move.w	#$0001,-(sp)
	DOS	_KFLUSH
	addq.l	#2,sp
	move.b	d0,d1
	or.b	#$20,d1
	cmp.b	#$79,d1			;'y'
	beq.s	L00216e
	cmp.b	#$6e,d1			;'n'
	beq.s	L002174
	move.w	#$0001,d1
	rts

L00216e:
	move.w	#$ffff,d1
	rts

L002174:
	clr.w	d1
	rts

L002178:
	movem.l	d0-d2,-(sp)
	pea.l	(L005bd2)
	DOS	_PRINT
	addq.l	#4,sp
	DOS	_VERNUM
	move.w	d0,d1
	ext.w	d1
	ext.l	d1
	divu.w	#$000a,d1
	move.l	d1,d2
	lsr.w	#8,d0
	swap.w	d2
	and.b	#$0f,d0
	and.b	#$0f,d1
	and.b	#$0f,d2
	add.b	#$30,d0			;'0'
	add.b	#$30,d1			;'0'
	add.b	#$30,d2			;'0'
	move.w	d0,-(sp)
	DOS	_PUTCHAR
	move.w	#$002e,-(sp)		;'.'
	DOS	_PUTCHAR
	move.w	d1,-(sp)
	DOS	_PUTCHAR
	move.w	d2,-(sp)
	DOS	_PUTCHAR
	addq.l	#8,sp
	movem.l	(sp)+,d0-d2
	rts

L0021ca:
	link.w	a6,#-$005a
	movem.l	d0,-(sp)
	tst.w	d0
	bne.s	L0021da
	DOS	_CURDRV
	addq.w	#1,d0
L0021da:
	move.w	d0,-(sp)
	add.w	#$0040,d0
	move.w	d0,-(sp)
	DOS	_PUTCHAR
	addq.l	#2,sp
	move.w	#$003a,-(sp)		;':'
	DOS	_PUTCHAR
	addq.l	#2,sp
	move.w	#$005c,-(sp)		;'\'
	DOS	_PUTCHAR
	addq.l	#2,sp
	move.w	(sp)+,d0
	pea.l	(-$005a,a6)
	move.w	d0,-(sp)
	DOS	_CURDIR
	addq.l	#6,sp
	pea.l	(-$005a,a6)
	DOS	_PRINT
	addq.l	#4,sp
	movem.l	(sp)+,d0
	unlk	a6
	rts

L002212:
	link.w	a6,#-$001e
	move.l	a0,-(sp)
	lea.l	(-$001e,a6),a0
	bsr.s	L00222a
	move.l	a0,-(sp)
	DOS	_PRINT
	addq.l	#4,sp
	movea.l	(sp)+,a0
	unlk	a6
	rts

L00222a:
	link.w	a6,#-$000c
	movem.l	d0-d1/a0-a1,-(sp)
	movea.l	a0,a1
	move.l	d0,d1
	lea.l	(-$000c,a6),a0
	lsr.l	#8,d0
	lsr.l	#1,d0
	and.l	#$0000007f,d0
	add.l	#$00000050,d0
	bsr.w	L001b62
	addq.l	#8,a0
	exg.l	a0,a1
	bsr.w	L001c94
	bsr.w	L001c86
	adda.l	d0,a0
	bsr.w	L0022e2
	movem.l	(sp)+,d0-d1/a0-a1
	unlk	a6
	rts

L002268:
	link.w	a6,#-$001e
	move.l	a0,-(sp)
	lea.l	(-$001e,a6),a0
	bsr.s	L002280
	move.l	a0,-(sp)
	DOS	_PRINT
	addq.l	#4,sp
	movea.l	(sp)+,a0
	unlk	a6
	rts

L002280:
	link.w	a6,#-$000c
	movem.l	d0-d1/a0-a1,-(sp)
	movea.l	a0,a1
	move.l	d0,d1
	lea.l	(-$000c,a6),a0
	lsr.l	#8,d0
	lsr.l	#1,d0
	and.l	#$0000007f,d0
	add.l	#$000007bc,d0
	bsr.w	L001b62
	addq.l	#6,a0
	exg.l	a0,a1
	bsr.w	L001c94
	bsr.w	L001c86
	adda.l	d0,a0
	bsr.s	L0022e2
	move.b	#$20,(a0)+		;' '
	move.b	#$28,(a0)+		;'('
	move.l	d1,d0
	lsr.l	#8,d0
	lsr.l	#7,d0
	and.l	#$0000000e,d0
	lea.l	(L005b20),a1
	adda.l	d0,a1
	move.b	(a1)+,(a0)+
	move.b	(a1)+,(a0)+
	move.b	#$29,(a0)+		;')'
	clr.b	(a0)
	movem.l	(sp)+,d0-d1/a0-a1
	unlk	a6
	rts

L0022e2:
	move.b	#$2d,(a0)+		;'-'
	movea.l	a0,a1
	lea.l	(-$000c,a6),a0
	move.l	d1,d0
	lsr.l	#5,d0
	and.l	#$0000000f,d0
	bsr.w	L001b70
	addq.l	#8,a0
	exg.l	a0,a1
	bsr.w	L001c94
	bsr.w	L001c86
	adda.l	d0,a0
	move.b	#$2d,(a0)+		;'-'
	movea.l	a0,a1
	lea.l	(-$000c,a6),a0
	move.l	d1,d0
	and.l	#$0000001f,d0
	bsr.w	L001b70
	addq.l	#8,a0
	exg.l	a0,a1
	bsr.w	L001c94
	bsr.w	L001c86
	adda.l	d0,a0
	rts

L00232e:
	movem.l	d1-d4/a0,-(sp)
	bsr.w	L001bea
	bsr.w	L0027c8
	tst.l	d1
	beq.w	L002470
	cmp.l	#$00000064,d0
	bcs.s	L002370
	cmp.l	#$00000004,d1
	bne.w	L002470
	cmp.l	#$000007bc,d0
	bcs.w	L002470
	cmp.l	#$0000081f,d0
	bhi.w	L002470
	sub.l	#$000007bc,d0
	move.l	d0,d2
	bra.s	L002394

L002370:
	cmp.l	#$00000002,d1
	bhi.w	L002470
	cmp.l	#$0000004f,d0
	bhi.s	L00238c
	add.l	#$00000014,d0
	move.l	d0,d2
	bra.s	L002394

L00238c:
	sub.l	#$00000050,d0
	move.l	d0,d2
L002394:
	cmpi.b	#$2d,(-$0001,a0)	;'-'
	beq.s	L0023a6
	cmpi.b	#$2f,(-$0001,a0)	;'/'
	bne.w	L002470
L0023a6:
	bsr.w	L001bea
	bsr.w	L0027c8
	tst.l	d1
	beq.w	L002470
	cmp.l	#$00000002,d1
	bhi.w	L002470
	tst.l	d0
	beq.w	L002470
	cmp.l	#$0000000c,d0
	bhi.w	L002470
	move.l	d0,d3
	cmpi.b	#$2d,(-$0001,a0)	;'-'
	beq.s	L0023e2
	cmpi.b	#$2f,(-$0001,a0)	;'/'
	bne.w	L002470
L0023e2:
	bsr.w	L001bea
	bsr.w	L0027c8
	tst.l	d1
	beq.w	L002470
	cmp.l	#$00000002,d1
	bhi.s	L002470
	tst.l	d0
	beq.s	L002470
	cmp.l	#$0000001f,d0
	bhi.s	L002470
	move.l	d0,-(sp)
	subq.l	#1,a0
	bsr.w	L001d0e
	adda.l	d0,a0
	move.l	(sp)+,d0
	tst.b	(a0)
	bne.s	L002470
	move.l	d0,d4
	cmp.l	#$00000002,d3
	bne.s	L002436
	cmp.l	#$0000001d,d4
	bhi.s	L002470
	bcs.s	L002454
	btst.l	#$00,d2
	bne.s	L002470
	btst.l	#$01,d2
	bne.s	L002470
	bra.s	L002454

L002436:
	cmp.l	#$0000001f,d4
	bne.s	L002454
	cmp.l	#$00000008,d3
	bcs.s	L00244e
	btst.l	#$00,d3
	bne.s	L002470
	bra.s	L002454

L00244e:
	btst.l	#$00,d3
	beq.s	L002470
L002454:
	clr.l	d0
	and.w	#$001f,d4
	move.w	d4,d0
	and.w	#$000f,d3
	lsl.w	#5,d3
	or.w	d3,d0
	and.w	#$007f,d2
	lsl.w	#8,d2
	lsl.w	#1,d2
	or.w	d2,d0
	bra.s	L002472

L002470:
	moveq.l	#$ff,d0
L002472:
	movem.l	(sp)+,d1-d4/a0
	rts

L002478:
	link.w	a6,#-$001e
	move.l	a0,-(sp)
	lea.l	(-$001e,a6),a0
	bsr.s	L002490
	move.l	a0,-(sp)
	DOS	_PRINT
	addq.l	#4,sp
	movea.l	(sp)+,a0
	unlk	a6
	rts

L002490:
	link.w	a6,#-$000c
	movem.l	d0-d1/a0-a1,-(sp)
	movea.l	a0,a1
	move.l	d0,d1
	lea.l	(-$000c,a6),a0
	lsr.l	#8,d0
	lsr.l	#3,d0
	and.l	#$0000001f,d0
	bsr.w	L001b62
	addq.l	#8,a0
	exg.l	a0,a1
	bsr.w	L001c94
	bsr.w	L001c86
	adda.l	d0,a0
	move.b	#$3a,(a0)+		;':'
	movea.l	a0,a1
	move.l	d1,d0
	lea.l	(-$000c,a6),a0
	lsr.l	#5,d0
	and.l	#$0000003f,d0
	bsr.w	L001b70
	addq.l	#8,a0
	exg.l	a0,a1
	bsr.w	L001c94
	bsr.w	L001c86
	adda.l	d0,a0
	move.b	#$3a,(a0)+		;':'
	movea.l	a0,a1
	move.l	d1,d0
	lea.l	(-$000c,a6),a0
	and.l	#$0000001f,d0
	lsl.l	#1,d0
	bsr.w	L001b70
	addq.l	#8,a0
	exg.l	a0,a1
	bsr.w	L001c94
	movem.l	(sp)+,d0-d1/a0-a1
	unlk	a6
	rts

L00250a:
	link.w	a6,#-$001e
	move.l	a0,-(sp)
	lea.l	(-$001e,a6),a0
	bsr.s	L002522
	move.l	a0,-(sp)
	DOS	_PRINT
	addq.l	#4,sp
	movea.l	(sp)+,a0
	unlk	a6
	rts

L002522:
	link.w	a6,#-$000c
	movem.l	d0-d1/a0-a1,-(sp)
	movea.l	a0,a1
	move.l	d0,d1
	lea.l	(-$000c,a6),a0
	lsr.l	#8,d0
	lsr.l	#8,d0
	and.l	#$0000001f,d0
	bsr.w	L001b62
	addq.l	#8,a0
	exg.l	a0,a1
	bsr.w	L001c94
	bsr.w	L001c86
	adda.l	d0,a0
	move.b	#$3a,(a0)+		;':'
	movea.l	a0,a1
	move.l	d1,d0
	lea.l	(-$000c,a6),a0
	lsr.l	#8,d0
	and.l	#$0000003f,d0
	bsr.w	L001b70
	addq.l	#8,a0
	exg.l	a0,a1
	bsr.w	L001c94
	bsr.w	L001c86
	adda.l	d0,a0
	move.b	#$3a,(a0)+		;':'
	movea.l	a0,a1
	move.l	d1,d0
	lea.l	(-$000c,a6),a0
	and.l	#$0000003f,d0
	bsr.w	L001b70
	addq.l	#8,a0
	exg.l	a0,a1
	bsr.w	L001c94
	movem.l	(sp)+,d0-d1/a0-a1
	unlk	a6
	rts

L00259a:
	movem.l	d1-d4/a0,-(sp)
L00259e:
	bsr.w	L001bea
	bsr.w	L0027c8
	tst.l	d1
	beq.w	L002644
	cmp.l	#$00000002,d1
	bhi.w	L002644
	cmp.l	#$00000017,d0
	bhi.w	L002644
	move.l	d0,d2
	cmpi.b	#$3a,(-$0001,a0)	;':'
	bne.s	L002644
	bsr.w	L001bea
	bsr.w	L0027c8
	tst.l	d1
	beq.s	L002644
	cmp.l	#$00000002,d1
	bhi.s	L002644
	cmp.l	#$0000003b,d0
	bhi.s	L002644
	move.l	d0,d3
	cmpi.b	#$3a,(-$0001,a0)	;':'
	bne.s	L002644
	bsr.w	L001bea
	bsr.w	L0027c8
	tst.l	d1
	beq.s	L002644
	cmp.l	#$00000002,d1
	bhi.s	L002644
	cmp.l	#$0000003b,d0
	bhi.s	L002644
	move.l	d0,-(sp)
	subq.l	#1,a0
	bsr.w	L001d0e
	adda.l	d0,a0
	move.l	(sp)+,d0
	tst.b	(a0)
	bne.s	L002644
	move.l	d0,d4
	and.l	#$0000003f,d4
	move.l	d4,d0
	and.l	#$0000003f,d3
	lsl.l	#8,d3
	or.l	d3,d0
	and.l	#$0000001f,d2
	lsl.l	#8,d2
	lsl.l	#8,d2
	or.l	d2,d0
	and.l	#$001f3f3f,d0
	bra.s	L002646

L002644:
	moveq.l	#$ff,d0
L002646:
	movem.l	(sp)+,d1-d4/a0
	rts

L00264c:
	movem.l	d0/a0-a2,-(sp)
	DOS	_GETPDB
	movea.l	d0,a1
	movea.l	(a1),a1
	lea.l	(L005b70),a0
	bsr.w	L001ef2
	bne.s	L002668
	lea.l	(L005b85),a0
L002668:
	movea.l	a0,a2
L00266a:
	move.b	(a2)+,d0
	beq.s	L0026e6
	cmp.b	#$24,d0			;'$'
	bne.s	L0026de
	move.b	(a2)+,d0
	beq.s	L0026e6
	cmp.b	#$24,d0			;'$'
	beq.s	L0026de
	cmp.b	#$5f,d0			;'_'
	beq.w	L00274c
	cmp.b	#$6e,d0			;'n'
	beq.w	L002714
	cmp.b	#$4e,d0			;'N'
	beq.w	L00271c
	or.b	#$20,d0
	cmp.b	#$62,d0			;'b'
	beq.s	L0026ec
	cmp.b	#$64,d0			;'d'
	beq.s	L0026f2
	cmp.b	#$65,d0			;'e'
	beq.s	L0026fc
	cmp.b	#$67,d0			;'g'
	beq.s	L002702
	cmp.b	#$68,d0			;'h'
	beq.s	L002708
	cmp.b	#$6c,d0			;'l'
	beq.s	L00270e
	cmp.b	#$70,d0			;'p'
	beq.s	L002724
	cmp.b	#$71,d0			;'q'
	beq.s	L00272e
	cmp.b	#$73,d0			;'s'
	beq.s	L002734
	cmp.b	#$74,d0			;'t'
	beq.s	L00273a
	cmp.b	#$76,d0			;'v'
	beq.s	L002744
	bra.s	L00266a

L0026de:
	move.w	d0,-(sp)
	DOS	_PUTCHAR
	addq.l	#2,sp
	bra.s	L00266a

L0026e6:
	movem.l	(sp)+,d0/a0-a2
	rts

L0026ec:
	move.b	#$7c,d0			;'|'
	bra.s	L0026de

L0026f2:
	DOS	_GETDATE
	bsr.w	L002268
	bra.w	L00266a

L0026fc:
	move.b	#$1b,d0
	bra.s	L0026de

L002702:
	move.b	#$3e,d0			;'>'
	bra.s	L0026de

L002708:
	move.b	#$08,d0
	bra.s	L0026de

L00270e:
	move.b	#$3c,d0			;'<'
	bra.s	L0026de

L002714:
	DOS	_CURDRV
	add.w	#$0061,d0
	bra.s	L0026de

L00271c:
	DOS	_CURDRV
	add.w	#$0041,d0
	bra.s	L0026de

L002724:
	clr.w	d0
	bsr.w	L0021ca
	bra.w	L00266a

L00272e:
	move.b	#$3d,d0			;'='
	bra.s	L0026de

L002734:
	move.b	#$20,d0			;' '
	bra.s	L0026de

L00273a:
	DOS	_GETTIM2
	bsr.w	L00250a
	bra.w	L00266a

L002744:
	bsr.w	L002178
	bra.w	L00266a

L00274c:
	bsr.w	L001b4c
	bra.w	L00266a

L002754:
	move.l	d1,-(sp)
	clr.w	d1
	move.b	d0,d1
	DOS	_CURDRV
	move.w	d0,-(sp)
	move.w	d1,-(sp)
	DOS	_CHGDRV
	addq.l	#2,sp
	cmp.w	d1,d0
	bhi.s	L00276c
	moveq.l	#$ff,d0
	bra.s	L002770

L00276c:
	DOS	_CHGDRV
	clr.l	d0
L002770:
	addq.l	#2,sp
	move.l	(sp)+,d1
	rts

L002776:
	link.w	a6,#-$0058
	movem.l	d0-d1/a0-a1,-(sp)
	pea.l	(-$0058,a6)
	move.l	a0,-(sp)
	DOS	_NAMESTS
	addq.l	#8,sp
	lea.l	(-$0015,a6),a1
	move.w	#$0007,d1
L002790:
	move.b	(a1)+,d0
	cmp.b	#$20,d0			;' '
	beq.s	L00279e
	move.b	d0,(a0)+
	dbra.w	d1,L002790
L00279e:
	lea.l	(-$000d,a6),a1
	cmpi.b	#$20,(a1)		;' '
	beq.s	L0027be
	move.b	#$2e,(a0)+		;'.'
	move.w	#$0002,d1
L0027b0:
	move.b	(a1)+,d0
	cmp.b	#$20,d0			;' '
	beq.s	L0027be
	move.b	d0,(a0)+
	dbra.w	d1,L0027b0
L0027be:
	clr.b	(a0)
	movem.l	(sp)+,d0-d1/a0-a1
	unlk	a6
	rts

L0027c8:
	movem.l	d0,-(sp)
	clr.l	d1
L0027ce:
	move.b	(a0)+,d0
	cmp.b	#$30,d0			;'0'
	bcs.s	L0027e0
	cmp.b	#$39,d0			;'9'
	bhi.s	L0027e0
	addq.l	#1,d1
	bra.s	L0027ce

L0027e0:
	movem.l	(sp)+,d0
	rts

L0027e6:
	clr.b	(L006ea9)
	tst.b	(L006eab)
	beq.s	L0027fc
	move.b	#$02,(L006eab)
L0027fc:
	tst.b	(L006eac)
	beq.s	L00280c
	move.b	#$02,(L006eac)
L00280c:
	move.w	(L0064c4),d0
	bmi.s	L002830
	clr.w	-(sp)
	move.w	d0,-(sp)
	DOS	_DUP2
	addq.l	#4,sp
	move.w	(L0064c4),d0
	move.w	d0,-(sp)
	DOS	_CLOSE
	addq.l	#2,sp
	move.w	#$ffff,(L0064c4)
L002830:
	move.w	(L0064c6),d0
	bmi.s	L002846
	move.w	d0,-(sp)
	DOS	_CLOSE
	addq.l	#2,sp
	move.w	#$ffff,(L0064c6)
L002846:
	move.w	(L0064c8),d0
	bmi.s	L00286c
	move.w	#$0001,-(sp)
	move.w	d0,-(sp)
	DOS	_DUP2
	addq.l	#4,sp
	move.w	(L0064c8),d0
	move.w	d0,-(sp)
	DOS	_CLOSE
	addq.l	#2,sp
	move.w	#$ffff,(L0064c8)
L00286c:
	move.w	(L0064ca),d0
	bmi.s	L002882
	move.w	d0,-(sp)
	DOS	_CLOSE
	addq.l	#2,sp
	move.w	#$ffff,(L0064ca)
L002882:
	cmpi.b	#$02,(L006eab)
	bne.s	L00289c
	pea.l	(L006c32)
	DOS	_DELETE
	addq.l	#4,sp
	clr.b	(L006eab)
L00289c:
	cmpi.b	#$02,(L006eac)
	bne.s	L0028b6
	pea.l	(L006d4a)
	DOS	_DELETE
	addq.l	#4,sp
	clr.b	(L006eac)
L0028b6:
	DOS	_ALLCLOSE
	rts

L0028ba:
	move.l	d2,-(sp)
	move.w	#$ffff,-(sp)
	move.w	#$000e,-(sp)
	DOS	_CONCTRL
	addq.l	#4,sp
	move.b	#$1f,d1
	cmp.b	#$03,d0
	bne.s	L0028d6
	move.b	#$20,d1			;' '
L0028d6:
	move.w	#$ffff,-(sp)
	move.w	#$0010,-(sp)
	DOS	_CONCTRL
	addq.l	#4,sp
	move.b	#$40,d2			;'@'
	cmp.b	#$01,d0
	bhi.s	L0028f0
	move.b	#$60,d2			;'`'
L0028f0:
	move.b	d2,d0
	move.l	(sp)+,d2
	rts

L0028f6:
	movem.l	d0-d1,-(sp)
	clr.b	d1
	move.l	a0,-(sp)
L0028fe:
	move.b	(a0)+,d0
	beq.s	L002932
	tst.b	d1
	beq.s	L00290a
	clr.b	d1
	bra.s	L0028fe

L00290a:
	cmp.b	#$80,d0
	bcs.s	L002922
	cmp.b	#$a0,d0
	bcs.s	L00291c
	cmp.b	#$e0,d0
	bcs.s	L002922
L00291c:
	move.b	#$01,d1
	bra.s	L0028fe

L002922:
	cmp.b	#$5c,d0			;'\'
	beq.s	L00292e
	cmp.b	#$3a,d0			;':'
	bne.s	L0028fe
L00292e:
	move.l	a0,(sp)
	bra.s	L0028fe

L002932:
	movea.l	(sp)+,a0
	movem.l	(sp)+,d0-d1
	rts

L00293a:
	link.w	a6,#-$0018
	movem.l	d1/a0-a1,-(sp)
	movem.l	a0,-(sp)
	lea.l	(-$0018,a6),a1
	move.w	#$0012,d1
L00294e:
	move.b	(a0)+,d0
	cmp.b	#$2a,d0			;'*'
	beq.s	L002964
	cmp.b	#$2e,d0			;'.'
	beq.s	L00297a
	move.b	d0,(a1)+
	dbra.w	d1,L00294e
	bra.s	L0029b6

L002964:
	subq.w	#1,d1
	bcs.s	L002970
L002968:
	move.b	#$3f,(a1)+		;'?'
	dbra.w	d1,L002968
L002970:
	move.b	(a0)+,d0
	beq.s	L00297a
	cmp.b	#$2e,d0			;'.'
	bne.s	L002970
L00297a:
	move.b	(-$0001,a0),(a1)+
	move.w	#$0003,d1
L002982:
	move.b	(a0)+,d0
	beq.s	L0029a4
	cmp.b	#$2a,d0			;'*'
	beq.s	L002994
	move.b	d0,(a1)+
	dbra.w	d1,L002982
	bra.s	L0029b6

L002994:
	subq.w	#1,d1
	bcs.s	L0029a0
L002998:
	move.b	#$3f,(a1)+		;'?'
	dbra.w	d1,L002998
L0029a0:
	move.b	(a0)+,d0
	bne.s	L0029a0
L0029a4:
	clr.b	(a1)
	movem.l	(sp)+,a0
	lea.l	(-$0018,a6),a1
	bsr.w	L001c94
	clr.l	d0
	bra.s	L0029bc

L0029b6:
	moveq.l	#$ff,d0
	movem.l	(sp)+,a0
L0029bc:
	movem.l	(sp)+,d1/a0-a1
	unlk	a6
	rts

L0029c4:
	link.w	a6,#-$00b0
	movem.l	d0/a0-a2,-(sp)
	pea.l	(-$0058,a6)
	move.l	a0,-(sp)
	DOS	_NAMESTS
	addq.l	#8,sp
	pea.l	(-$00b0,a6)
	move.l	a2,-(sp)
	DOS	_NAMESTS
	addq.l	#8,sp
	lea.l	(-$0015,a6),a0
	lea.l	(-$006d,a6),a2
	move.w	#$0014,d1
L0029ec:
	cmpi.b	#$3f,(a2)		;'?'
	bne.s	L0029f4
	move.b	(a0),(a2)
L0029f4:
	addq.l	#1,a0
	addq.l	#1,a2
	dbra.w	d1,L0029ec
	lea.l	(-$006d,a6),a0
	move.w	#$0007,d1
L002a04:
	move.b	(a0)+,d0
	cmp.b	#$20,d0			;' '
	beq.s	L002a12
	move.b	d0,(a1)+
	dbra.w	d1,L002a04
L002a12:
	lea.l	(-$0062,a6),a0
	move.w	#$0009,d1
L002a1a:
	move.b	(a0)+,d0
	beq.s	L002a24
	move.b	d0,(a1)+
	dbra.w	d1,L002a1a
L002a24:
	cmpi.b	#$20,(-$0065,a6)	;' '
	beq.s	L002a46
	move.b	#$2e,(a1)+		;'.'
	lea.l	(-$0065,a6),a0
	move.w	#$0002,d1
L002a38:
	move.b	(a0)+,d0
	cmp.b	#$20,d0			;' '
	beq.s	L002a46
	move.b	d0,(a1)+
	dbra.w	d1,L002a38
L002a46:
	clr.b	(a1)
	movem.l	(sp)+,d0/a0-a2
	unlk	a6
	rts

L002a50:
	link.w	a6,#-$003c
	movem.l	d0-d6/a1-a2,-(sp)
	move.w	#$ffff,d2
	bra.s	L002a68

L002a5e:
	link.w	a6,#-$003c
	movem.l	d0-d6/a1-a2,-(sp)
	clr.w	d2
L002a68:
	movea.l	a0,a1
	bsr.w	L001c86
	move.w	d0,d1
	beq.w	L002ba8
	clr.b	d3
L002a76:
	move.b	(a1)+,d4
	beq.s	L002aac
	tst.b	d3
	beq.s	L002a94
	cmp.b	#$01,d3
	beq.s	L002a8e
	cmp.b	#$2e,d4			;'.'
	beq.s	L002a94
	clr.b	d3
	bra.s	L002a94

L002a8e:
	move.b	#$02,d3
	bra.s	L002a76

L002a94:
	cmp.b	#$80,d4
	bcs.s	L002a76
	cmp.b	#$a0,d4
	bcs.s	L002aa6
	cmp.b	#$e0,d4
	bcs.s	L002a76
L002aa6:
	move.b	#$01,d3
	bra.s	L002a76

L002aac:
	subq.l	#1,a1
	tst.b	d3
	bne.s	L002ace
	cmpi.b	#$5c,(-$0001,a1)	;'\'
	bne.s	L002ace
	cmp.w	#$0001,d1
	beq.w	L002ba8
	cmpi.b	#$3a,(-$0002,a1)	;':'
	beq.w	L002ba8
	clr.b	-(a1)
L002ace:
	cmpi.b	#$3a,(-$0001,a1)	;':'
	beq.w	L002ba8
	cmpi.b	#$2e,(-$0001,a1)	;'.'
	bne.s	L002b0a
	tst.b	d3
	bne.s	L002b0a
	cmp.w	#$0001,d1
	beq.s	L002afa
	cmpi.b	#$3a,(-$0002,a1)	;':'
	beq.s	L002afa
	cmpi.b	#$5c,(-$0002,a1)	;'\'
	bne.s	L002b0a
L002afa:
	move.b	#$2a,(-$0001,a1)	;'*'
	move.b	#$2e,(a1)+		;'.'
	move.b	#$2a,(a1)+		;'*'
	clr.b	(a1)
L002b0a:
	bsr.w	L002bc8
	tst.b	d0
	bne.s	L002b2e
	move.w	#$0010,-(sp)
	move.l	a0,-(sp)
	pea.l	(-$003c,a6)
	DOS	_FILES
	lea.l	($000a,sp),sp
	tst.l	d0
	bmi.s	L002b2e
	btst.b	#$04,(-$0027,a6)
	bne.s	L002ba4
L002b2e:
	clr.b	d3
	movea.l	a0,a2
	clr.b	d5
	clr.b	d6
L002b36:
	move.b	(a2)+,d0
	beq.s	L002b9c
	tst.b	d3
	beq.s	L002b42
	clr.b	d3
	bra.s	L002b36

L002b42:
	cmp.b	#$80,d0
	bcs.s	L002b5e
	cmp.b	#$a0,d0
	bcs.s	L002b54
	cmp.b	#$e0,d0
	bcs.s	L002b5e
L002b54:
	move.b	#$01,d3
	move.b	#$20,d5			;' '
	bra.s	L002b36

L002b5e:
	cmp.b	#$2e,d0			;'.'
	bne.s	L002b7e
	tst.b	d5
	beq.s	L002b7a
	cmp.b	#$3a,d5			;':'
	beq.s	L002b7a
	cmp.b	#$5c,d5			;'\'
	beq.s	L002b7a
	cmp.b	#$2e,d5			;'.'
	bne.s	L002b7e
L002b7a:
	tst.b	(a2)
	beq.s	L002ba4
L002b7e:
	cmpi.b	#$5c,(a2)		;'\'
	bne.s	L002b8a
	tst.b	($0001,a2)
	beq.s	L002ba8
L002b8a:
	move.b	d0,d5
	cmp.b	#$2e,d0			;'.'
	beq.s	L002b98
	cmp.b	#$5c,d0			;'\'
	bne.s	L002b36
L002b98:
	move.b	d0,d6
	bra.s	L002b36

L002b9c:
	cmp.b	#$2e,d6			;'.'
	beq.s	L002bc0
	bra.s	L002bae

L002ba4:
	move.b	#$5c,(a1)+		;'\'
L002ba8:
	move.b	#$2a,(a1)+		;'*'
	clr.w	d2
L002bae:
	move.b	#$2e,(a1)+		;'.'
	move.b	#$2a,(a1)+		;'*'
	tst.w	d2
	beq.s	L002bbe
	clr.b	(-$0002,a1)
L002bbe:
	clr.b	(a1)
L002bc0:
	movem.l	(sp)+,d0-d6/a1-a2
	unlk	a6
	rts

L002bc8:
	movem.l	a0,-(sp)
	bsr.w	L0028f6
L002bd0:
	move.b	(a0)+,d0
	beq.s	L002be0
	cmp.b	#$2a,d0			;'*'
	beq.s	L002be0
	cmp.b	#$3f,d0			;'?'
	bne.s	L002bd0
L002be0:
	movem.l	(sp)+,a0
	rts

L002be6:
	link.w	a6,#-$0094
	movem.l	d1-d2/a0-a2,-(sp)
	movea.l	a1,a2
	clr.l	d2
	move.w	#$0035,-(sp)		;'5'
	move.l	a0,-(sp)
	pea.l	(-$003c,a6)
	DOS	_FILES
	lea.l	($000a,sp),sp
	tst.l	d0
	bmi.w	L002cae
L002c08:
	lea.l	(-$001e,a6),a0
	cmpi.b	#$2e,(a0)		;'.'
	bne.s	L002c26
	move.b	($0001,a0),d0
	beq.w	L002ca0
	cmp.b	#$2e,d0			;'.'
	bne.s	L002c26
	move.b	($0002,a0),d0
	beq.s	L002ca0
L002c26:
	move.b	(-$0027,a6),d0
	and.b	#$0e,d0
	bne.s	L002ca0
	addq.w	#1,d2
	cmp.w	#$0578,d2
	bhi.w	L002cc0
	move.w	#$0015,d1
	movea.l	a2,a1
L002c40:
	move.b	#$20,(a1)+		;' '
	dbra.w	d1,L002c40
	clr.b	(a1)
	pea.l	(-$0094,a6)
	move.l	a0,-(sp)
	DOS	_NAMESTS
	addq.l	#8,sp
	move.w	#$0007,d1
	movea.l	a2,a1
	lea.l	(-$0051,a6),a0
L002c5e:
	move.b	(a0)+,(a1)+
	dbra.w	d1,L002c5e
	move.w	#$0009,d1
	lea.l	($0008,a2),a1
	lea.l	(-$0046,a6),a0
L002c70:
	move.b	(a0)+,d0
	beq.s	L002c7a
	move.b	d0,(a1)+
	dbra.w	d1,L002c70
L002c7a:
	move.w	#$0002,d1
	lea.l	($0013,a2),a1
	lea.l	(-$0049,a6),a0
L002c86:
	move.b	(a0)+,(a1)+
	dbra.w	d1,L002c86
	lea.l	($0017,a2),a2
	move.b	(-$0027,a6),(a2)+
	move.l	(-$0022,a6),(a2)+
	move.w	(-$0024,a6),(a2)+
	move.w	(-$0026,a6),(a2)+
L002ca0:
	pea.l	(-$003c,a6)
	DOS	_NFILES
	addq.l	#4,sp
	tst.l	d0
	bpl.w	L002c08
L002cae:
	cmp.l	#$fffffffe,d0
	beq.s	L002cc0
	cmp.l	#$ffffffee,d0
	beq.s	L002cc0
	moveq.l	#$ff,d2
L002cc0:
	clr.b	(a2)
	move.l	d2,d0
	movem.l	(sp)+,d1-d2/a0-a2
	unlk	a6
	rts

L002ccc:
	movem.l	d1/a0,-(sp)
	move.l	d0,d1
	and.l	#$ffffff00,d1
	cmp.l	#$ffff0000,d1
	beq.s	L002d56
	and.l	#$ff000000,d1
	cmp.l	#$80000000,d1
	beq.s	L002d32
	cmp.l	#$81000000,d1
	beq.s	L002d3e
	cmp.l	#$82000000,d1
	beq.s	L002d3e
	neg.l	d0
	cmp.l	#$00000050,d0
	beq.s	L002d4a
	cmp.l	#$00000028,d0
	bcc.s	L002d26
	lea.l	(L005af8),a0
	move.b	(a0,d0.l),d0
	add.l	#$00000500,d0
	movem.l	(sp)+,d1/a0
	rts

L002d26:
	move.l	#$0000050f,d0
	movem.l	(sp)+,d1/a0
	rts

L002d32:
	move.l	#$00000514,d0
	movem.l	(sp)+,d1/a0
	rts

L002d3e:
	move.l	#$0000050b,d0
	movem.l	(sp)+,d1/a0
	rts

L002d4a:
	move.l	#$00000510,d0
	movem.l	(sp)+,d1/a0
	rts

L002d56:
	move.l	#$00000515,d0
	movem.l	(sp)+,d1/a0
	rts

L002d62:
	tst.l	d0
	beq.s	L002d78
	subq.l	#1,d0
	swap.w	d0
L002d6a:
	swap.w	d0
L002d6c:
	move.b	(a0)+,(a1)+
	dbra.w	d0,L002d6c
	swap.w	d0
	dbra.w	d0,L002d6a
L002d78:
	rts

L002d7a:
	DOS	_GETPDB
	movea.l	d0,a0
	movea.l	($00f0,a0),a1
	lea.l	(L00649a),a0
	cmpa.l	a0,a1
	rts

L002d8c:
	tst.b	(L007480)
	bne.s	L002d98
	moveq.l	#$36,d0			;'6'
	bsr.s	L002db8
L002d98:
	moveq.l	#$0c,d0
	bsr.s	L002db8
	rts

L002d9e:
	tst.b	(L006ea1)
	beq.s	L002db6
	moveq.l	#$32,d0			;'2'
	bsr.s	L002db8
	tst.b	(L006ea0)
	bne.s	L002db6
	moveq.l	#$3a,d0			;':'
	bsr.s	L002db8
L002db6:
	rts

L002db8:
	move.l	d0,-(sp)
	bsr.s	L002d7a
	beq.s	L002de2
	move.l	(sp)+,d0
	lea.l	(L000000-$000004),a2
L002dc6:
	movea.l	(a2),a2
	tst.l	(a2)
	beq.s	L002de4
	tst.l	(a2,d0.l)
	beq.s	L002dc6
	movem.l	d0/a2,-(sp)
	movea.l	(a2,d0.l),a2
	jsr	(a2)
	movem.l	(sp)+,d0/a2
	bra.s	L002dc6

L002de2:
	addq.l	#4,sp
L002de4:
	rts

L002de6:
	movem.l	d1-d7/a0-a6,-(sp)
	bsr.w	L0004a2
	DOS	_GETPDB
	movea.l	d0,a2
	move.l	(a2),-(sp)
	move.l	a0,-(sp)
	move.l	a1,-(sp)
	clr.w	-(sp)
	clr.b	(L006ea2)
	DOS	_EXEC
	lea.l	($000e,sp),sp
	move.b	#-$01,(L006ea2)
	move.l	d0,-(sp)
	bsr.w	L0004ee
	move.l	(sp)+,d0
	movem.l	(sp)+,d1-d7/a0-a6
	rts

L002e1c:
	move.l	($0004,sp),d0
	movem.l	d1-d3/a0,-(sp)
	move.l	d0,d2
L002e26:
	move.w	#$03e8,d1
L002e2a:
	move.l	d2,-(sp)
	DOS	_MALLOC
	addq.l	#4,sp
	tst.l	d0
	bpl.s	L002e96
	tst.b	(L006eb4)
	beq.w	L000454
	move.l	d0,d3
	ori.b	#$01,(L006eb5)
	DOS	_KEYSNS
	DOS	_CHANGE_PR
	dbra.w	d1,L002e2a
	lea.l	(L005ccb),a0
	bsr.w	L002044
	ori.b	#-$01,(L006eb5)
	lea.l	(L006310),a0
	bsr.w	L002044
	move.w	#$0001,-(sp)
	DOS	_KFLUSH
	addq.l	#2,sp
	move.b	d0,d1
	lea.l	(L005bcf),a0
	bsr.w	L002044
	cmp.b	#$1a,d1
	beq.w	L00045e
	or.b	#$20,d1
	cmp.b	#$79,d1			;'y'
	bne.s	L002e26
	bra.w	L00045e

L002e96:
	clr.b	(L006eb5)
	movem.l	(sp)+,d1-d3/a0
	rts

Table1:
	.dc.l	L001b62
	.dc.l	L001b70
	.dc.l	L001bbc
	.dc.l	L001bea
	.dc.l	L001bf6
	.dc.l	L00232e
	.dc.l	L00222a
	.dc.l	L002280
	.dc.l	L00259a
	.dc.l	L002490
	.dc.l	L002522
	.dc.l	L001c86
	.dc.l	L001c94
	.dc.l	L001ca2
	.dc.l	L001cb8
	.dc.l	L001ccc
	.dc.l	L001cee
	.dc.l	L001d28
	.dc.l	L001d3a
	.dc.l	L001d4c
	.dc.l	L001d92
	.dc.l	L0020e6
	.dc.l	L00209e
	.dc.l	L0020b2
	.dc.l	L00207e
	.dc.l	L002138
	.dc.l	L002148
	.dc.l	L0021ca
	.dc.l	L002212
	.dc.l	L002268
	.dc.l	L002478
	.dc.l	L00250a
	.dc.l	L00264c
	.dc.l	L001b4c
	.dc.l	L001b58
	.dc.l	L001ff4
	.dc.l	L002028
	.dc.l	L002044
	.dc.l	L002776
	.dc.l	L001df0
	.dc.l	L0028f6
	.dc.l	L00293a
	.dc.l	L0029c4
	.dc.l	L002a50
	.dc.l	L002a5e
	.dc.l	L002be6
	.dc.l	L002754
	.dc.l	L0028ba
	.dc.l	L00208a
	.dc.l	L002d62
	.dc.l	L0027c8
	.dc.l	L001d0e
	.dc.l	L002de6
L002f76:
	link.w	a6,#-$0118
	clr.w	d0
	cmpi.w	#$0001,(L006ec4)
	bhi.w	L00300e
	bne.s	L002fb6
	lea.l	(L0070ca),a0
	cmpi.b	#$3a,($0001,a0)		;':'
	bne.s	L002fc0
	move.b	(a0),d0
	bsr.w	L001d3a
	sub.b	#$41,d0			;'A'
	move.b	d0,d1
	bsr.w	L002754
	tst.l	d0
	bmi.s	L002ffc
	tst.b	($0002,a0)
	bne.s	L002fc0
	addq.w	#1,d1
	move.b	d1,d0
L002fb6:
	bsr.w	L0021ca
	bsr.w	L001b4c
	bra.s	L003020

L002fc0:
	lea.l	(-$0118,a6),a1
L002fc4:
	tst.b	(a0)
	beq.s	L002fd4
	bsr.w	L001d0e
	tst.w	d0
	bne.s	L003020
	move.b	(a0)+,(a1)+
	bra.s	L002fc4

L002fd4:
	clr.b	(a1)
	lea.l	(-$0118,a6),a0
	bsr.w	L001df0
	movem.l	a0,-(sp)
	DOS	_CHDIR
	addq.l	#4,sp
	tst.l	d0
	bpl.s	L003020
	lea.l	(L006130),a0
	bsr.w	L002044
	move.l	#$00000503,d0
	bra.s	L003022

L002ffc:
	lea.l	(L005d9d),a0
	bsr.w	L002044
	move.l	#$00000500,d0
	bra.s	L003022

L00300e:
	lea.l	(L005eb5),a0
	bsr.w	L002044
	move.l	#$00000500,d0
	bra.s	L003022

L003020:
	clr.l	d0
L003022:
	unlk	a6
	rts

L003026:
	link.w	a6,#-$0118
	moveq.l	#$04,d0
	bsr.w	L0034ee
	beq.s	L003086
	move.l	a0,-(sp)
	lea.l	(L006fc9),a0
	bsr.w	L001d0e
	adda.l	d0,a0
	movea.l	a0,a1
	lea.l	(-$0118,a6),a0
	bsr.w	L001c94
	bsr.w	L001d4c
	lea.l	(L005b52),a1
	bsr.w	L001ccc
	tst.w	d0
	beq.s	L003072
	lea.l	(L005b4d),a1
	bsr.w	L001ccc
	tst.w	d0
	bne.s	L00307c
	clr.b	(L006ead)
	bra.s	L0030b2

L003072:
	move.b	#-$01,(L006ead)
	bra.s	L0030b2

L00307c:
	DOS	_PRINT
	addq.l	#4,sp
	bsr.w	L001b4c
	bra.s	L0030b4

L003086:
	pea.l	(L005bf9)
	DOS	_PRINT
	addq.l	#4,sp
	lea.l	(L005b4d),a0
	tst.b	(L006ead)
	beq.s	L0030a4
	lea.l	(L005b52),a0
L0030a4:
	move.l	a0,-(sp)
	DOS	_PRINT
	addq.l	#4,sp
	pea.l	(L005c1a)
	DOS	_PRINT
L0030b2:
	addq.l	#4,sp
L0030b4:
	clr.l	d0
	unlk	a6
	rts

L0030ba:
	clr.l	d0
	rts

L0030be:
	moveq.l	#$05,d0
	bsr.w	L0034ee
	bne.s	L0030cc
	lea.l	(L005c5a),a0
L0030cc:
	bsr.w	L002138
	bsr.w	L001b4c
	clr.l	d0
	rts

L0030d8:
	link.w	a6,#-$0118
	clr.l	d0
	tst.b	(L006ea3)
	beq.s	L00314e
	moveq.l	#$04,d0
	bsr.w	L0034ee
	beq.s	L00311e
	move.l	a0,-(sp)
	movea.l	(L00649a),a0
	addq.l	#4,a0
L0030f8:
	bsr.s	L003152
	beq.s	L00311e
	movem.l	a0,-(sp)
	lea.l	(-$0118,a6),a1
	bsr.s	L003174
	movea.l	($0004,sp),a0
	lea.l	(-$0118,a6),a1
	bsr.w	L001ccc
	movem.l	(sp)+,a0
	bne.s	L0030f8
	bsr.w	L00208a
	bra.s	L003138

L00311e:
	move.b	#-$01,(L006e9e)
	lea.l	(L00609e),a0
	bsr.w	L002044
	move.l	#$00000500,d0
	bra.s	L00314e

L003138:
	move.l	a0,(L00649e)
	addq.l	#4,sp
	clr.b	(L006e9e)
	clr.b	(L006ea5)
	clr.l	d0
L00314e:
	unlk	a6
	rts

L003152:
	move.b	(a0),d0
	beq.s	L003172
	cmp.b	#$1a,d0
	beq.s	L003172
	bsr.w	L001d0e
	adda.l	d0,a0
	cmpi.b	#$3a,(a0)+		;':'
	beq.s	L00316e
	bsr.w	L00208a
	bra.s	L003152

L00316e:
	move.b	#-$01,d0
L003172:
	rts

L003174:
	move.b	(a0)+,d0
	cmp.b	#$1a,d0
	beq.s	L003186
	cmp.b	#$0d,d0
	beq.s	L003186
	move.b	d0,(a1)+
	bne.s	L003174
L003186:
	clr.b	(a1)
	rts

L00318a:
	tst.b	(L006ea3)
	beq.s	L0031b4
	move.w	#$0001,d0
	lea.l	(L0067d2),a0
	bsr.w	L00209e
	movea.l	a0,a1
	clr.w	d0
	lea.l	(L0067d2),a0
	bsr.w	L00209e
	beq.s	L0031b4
	bsr.w	L00207e
L0031b4:
	clr.l	d0
	rts

L0031b8:
	link.w	a6,#-$026c
	clr.b	d4
	lea.l	(L006fc9),a0
	bsr.w	L001d0e
	adda.l	d0,a0
	movea.l	a0,a1
	movea.l	a0,a2
	lea.l	(-$0230,a6),a0
	bsr.w	L0020e6
	lea.l	(-$0230,a6),a1
	lea.l	(-$0118,a6),a0
	bsr.w	L00207e
	lea.l	(-$0118,a6),a0
	tst.b	(a0)
	beq.w	L00330e
L0031ec:
	bsr.w	L001d4c
	lea.l	(L005b8a),a1
	bsr.w	L001ccc
	tst.w	d0
	beq.w	L003288
	lea.l	(L005b90),a1
	bsr.w	L001ccc
	tst.w	d0
	beq.w	L00329e
	lea.l	(L005b9b),a1
	bsr.w	L001ccc
	tst.w	d0
	beq.w	L0032bc
	lea.l	(L005ba4),a1
	bsr.w	L001ccc
	tst.w	d0
	beq.w	L0032d8
	movea.l	a0,a3
	lea.l	(-$0230,a6),a1
	lea.l	(-$0118,a6),a0
	bsr.w	L00207e
	movea.l	a2,a4
	movea.l	a3,a0
	bsr.w	L003326
	beq.s	L00326c
	lea.l	(L005ba8),a1
	bsr.w	L001ccc
	tst.w	d0
	bne.s	L00326c
	bsr.w	L003326
	beq.w	L00330e
	movea.l	a3,a1
	bsr.w	L001ccc
	tst.w	d0
	beq.s	L0032e2
	bra.w	L003308

L00326c:
	movea.l	a3,a0
	movea.l	a4,a2
	bsr.w	L001bea
	tst.b	d1
	bmi.w	L00330e
	cmp.b	#$0a,d1
	bhi.s	L0032e2
	tst.l	d0
	bne.s	L0032e2
	bra.w	L003308

L003288:
	bsr.w	L003326
	beq.w	L00330e
	lea.l	(-$026c,a6),a1
	bsr.w	L001dd8
	tst.l	d0
	bpl.s	L0032e2
	bra.s	L003308

L00329e:
	bsr.w	L003326
	beq.s	L00330e
	bsr.w	L001bea
	tst.b	d1
	bmi.s	L00330e
	cmp.b	#$0a,d1
	bhi.s	L003308
	cmp.l	(L0064b6),d0
L0032b8:
	bls.s	L0032e2
	bra.s	L003308

L0032bc:
	bsr.s	L003326
	beq.s	L00330e
L0032c0:
	bsr.w	L001bea
	tst.b	d1
	bmi.s	L00330e
	cmp.b	#$0a,d1
	bhi.s	L003308
	cmp.l	(L0064b6),d0
	beq.s	L0032e2
	bra.s	L003308

L0032d8:
	not.b	d4
	bsr.s	L003326
	beq.s	L00330e
	bra.w	L0031ec

L0032e2:
	tst.b	d4
	bne.s	L003320
L0032e6:
	bsr.s	L003326
	beq.s	L003320
	move.b	#-$01,(L006ea4)
L0032f2:
	movea.l	a2,a0
L0032f4:
	bsr.w	L001c86
	movea.l	a2,a1
	lea.l	(L006ec7),a0
	move.b	d0,(a0)+
	bsr.w	L001c94
	bra.s	L003320

L003308:
	tst.b	d4
	bne.s	L0032e6
	bra.s	L003320

L00330e:
	lea.l	(L00606a),a0
	bsr.w	L002044
	move.l	#$00000500,d0
	bra.s	L003322

L003320:
	clr.l	d0
L003322:
	unlk	a6
	rts

L003326:
	movea.l	a0,a1
	movea.l	a2,a0
L00332a:
	bsr.w	L001d0e
	tst.l	d0
	bne.s	L003358
	move.b	(a0)+,d0
	cmp.b	#$27,d0			;'''
	beq.s	L00334c
	cmp.b	#$22,d0			;'"'
	bne.s	L00332a
L003340:
	move.b	(a0)+,d0
	beq.s	L00335a
	cmp.b	#$22,d0			;'"'
	bne.s	L003340
	bra.s	L00332a

L00334c:
	move.b	(a0)+,d0
	beq.s	L00335a
	cmp.b	#$27,d0			;'''
	bne.s	L00334c
	bra.s	L00332a

L003358:
	adda.l	d0,a0
L00335a:
	movea.l	a0,a2
	movea.l	a1,a0
	move.w	#$0001,d0
	bsr.w	L00209e
	rts

L003368:
	link.w	a6,#-$0118
	lea.l	(L006fc9),a0
	clr.b	(L006ea5)
	bsr.w	L001d0e
	adda.l	d0,a0
	movea.l	a0,a1
	movea.l	a0,a2
	lea.l	(-$0118,a6),a0
	bsr.w	L0020e6
	lea.l	(-$0118,a6),a0
	movea.l	a0,a3
	cmpi.b	#$25,(a0)+		;'%'
	bne.w	L0034d6
	tst.b	(a0)
	beq.w	L0034d6
	lea.l	(L0068ea),a1
L0033a4:
	move.b	(a0)+,(a1)+
	bne.s	L0033a4
	movea.l	a3,a0
	bsr.w	L003326
	move.b	($0002,a0),d0
	clr.b	($0002,a0)
	bsr.w	L001d4c
	move.b	d0,($0002,a0)
	moveq.l	#$02,d0
	lea.l	(L005bab),a1
	bsr.w	L001cee
	bne.w	L0034d6
	addq.l	#2,a0
	addq.l	#3,a2
	move.b	(a0)+,d0
	bne.s	L0033e8
	movea.l	a0,a3
	movea.l	a2,a0
	bsr.w	L001d0e
	adda.l	d0,a0
	movea.l	a0,a2
	addq.l	#1,a2
	movea.l	a3,a0
	move.b	(a0)+,d0
L0033e8:
	cmp.b	#$28,d0			;'('
	bne.w	L0034d6
	tst.b	(a0)
	bne.s	L003404
	addq.l	#1,a0
	movea.l	a0,a3
	movea.l	a2,a0
	bsr.w	L001d0e
	adda.l	d0,a0
	movea.l	a0,a2
	movea.l	a3,a0
L003404:
	lea.l	(L006a02),a1
L00340a:
	cmpi.b	#$29,(a0)		;')'
	bne.s	L003426
	tst.b	($0001,a0)
	bne.s	L003420
	movea.l	a1,a3
	bsr.w	L003326
	movea.l	a3,a1
	bra.s	L003474

L003420:
	addq.l	#1,a0
	addq.l	#1,a2
	bra.s	L003474

L003426:
	tst.b	(a0)
	beq.w	L0034d6
L00342c:
	addq.l	#1,a2
	move.b	(a0)+,(a1)+
	bne.s	L00342c
	movea.l	a0,a3
	movea.l	a2,a0
	movea.l	a2,a4
	bsr.w	L001d0e
	adda.l	d0,a0
	movea.l	a0,a2
	movea.l	a3,a0
	cmpi.b	#$29,(-$0002,a0)	;')'
	beq.s	L003472
	movea.l	a0,a3
	subq.l	#4,a0
	bsr.w	L001d4c
	movea.l	a1,a5
	lea.l	(L005bae),a1
	bsr.w	L001ccc
	movea.l	a3,a0
	movea.l	a5,a1
	tst.l	d0
	bne.s	L00340a
	subq.l	#3,a0
	movea.l	a4,a2
	subq.l	#2,a1
	subq.l	#3,a2
	clr.b	(-$0001,a1)
L003472:
	subq.l	#2,a1
L003474:
	clr.b	(a1)
	lea.l	(L006a02),a1
	tst.b	(a1)
	beq.s	L0034d6
	move.l	a1,(L0064be)
	bsr.w	L001d4c
	lea.l	(L005baf),a1
	bsr.w	L001ccc
	tst.l	d0
	bne.s	L0034d6
	addq.l	#2,a2
	movea.l	a2,a0
	bsr.w	L001d0e
	adda.l	d0,a0
	tst.b	(a0)
	beq.s	L0034d6
	movea.l	a0,a1
	lea.l	(L006b1a),a0
	bsr.w	L001c94
	move.b	#-$01,d0
	tst.b	(L006ea3)
	beq.s	L0034c8
	move.b	d0,(L006ea3)
	move.b	#$01,d0
L0034c8:
	move.b	d0,(L006ea5)
	clr.b	(L006ea6)
	bra.s	L0034e8

L0034d6:
	lea.l	(L00606a),a0
	bsr.w	L002044
	move.l	#$00000500,d0
	bra.s	L0034ea

L0034e8:
	clr.l	d0
L0034ea:
	unlk	a6
	rts

L0034ee:
	move.l	d0,-(sp)
	lea.l	(L006ec8),a0
	bsr.w	L001d0e
	adda.l	d0,a0
	move.l	(sp)+,d0
	adda.l	d0,a0
	tst.b	(a0)
	beq.s	L003514
	cmpi.b	#$20,(a0)		;' '
	beq.s	L003510
	cmpi.b	#$09,(a0)
	bne.s	L003514
L003510:
	addq.l	#1,a0
	tst.b	(a0)
L003514:
	rts

L003516:
	link.w	a6,#-$0118
	cmpi.w	#$0001,(L006ec4)
	bne.s	L003598
	lea.l	(L0070ca),a0
	cmpi.b	#$3a,($0001,a0)		;':'
	bne.s	L00354a
	tst.b	($0002,a0)
	beq.s	L003598
	move.b	(a0),d0
	bsr.w	L001d3a
	sub.b	#$41,d0			;'A'
	bsr.w	L002754
	tst.l	d0
	bmi.s	L003586
L00354a:
	lea.l	(-$0118,a6),a1
L00354e:
	tst.b	(a0)
	beq.s	L00355e
	bsr.w	L001d0e
	tst.w	d0
	bne.s	L0035aa
	move.b	(a0)+,(a1)+
	bra.s	L00354e

L00355e:
	clr.b	(a1)
	lea.l	(-$0118,a6),a0
	bsr.w	L001df0
	movem.l	a0,-(sp)
	DOS	_MKDIR
	addq.l	#4,sp
	tst.l	d0
	bpl.s	L0035aa
	lea.l	(L00614f),a0
	bsr.w	L002044
	move.l	#$00000506,d0
	bra.s	L0035ac

L003586:
	lea.l	(L005d9d),a0
	bsr.w	L002044
	move.l	#$00000500,d0
	bra.s	L0035ac

L003598:
	lea.l	(L005eb5),a0
	bsr.w	L002044
	move.l	#$00000500,d0
	bra.s	L0035ac

L0035aa:
	clr.l	d0
L0035ac:
	unlk	a6
	rts

L0035b0:
	link.w	a6,#-$0118
	cmpi.w	#$0001,(L006ec4)
	bne.s	L003632
	lea.l	(L0070ca),a0
	cmpi.b	#$3a,($0001,a0)		;':'
	bne.s	L0035e4
	tst.b	($0002,a0)
	beq.s	L003632
	move.b	(a0),d0
	bsr.w	L001d3a
	sub.b	#$41,d0			;'A'
	bsr.w	L002754
	tst.l	d0
	bmi.s	L003620
L0035e4:
	lea.l	(-$0118,a6),a1
L0035e8:
	tst.b	(a0)
	beq.s	L0035f8
	bsr.w	L001d0e
	tst.w	d0
	bne.s	L003644
	move.b	(a0)+,(a1)+
	bra.s	L0035e8

L0035f8:
	clr.b	(a1)
	lea.l	(-$0118,a6),a0
	bsr.w	L001df0
	movem.l	a0,-(sp)
	DOS	_RMDIR
	addq.l	#4,sp
	tst.l	d0
	bpl.s	L003644
	lea.l	(L0060f3),a0
	bsr.w	L002044
	move.l	#$00000506,d0
	bra.s	L003646

L003620:
	lea.l	(L005d9d),a0
	bsr.w	L002044
	move.l	#$00000500,d0
	bra.s	L003646

L003632:
	lea.l	(L005eb5),a0
	bsr.w	L002044
	move.l	#$00000500,d0
	bra.s	L003646

L003644:
	clr.l	d0
L003646:
	unlk	a6
	rts

L00364a:
	link.w	a6,#-$011c
	cmpi.w	#$0001,(L006ec4)
	bne.w	L003812
	clr.w	(-$011c,a6)
	clr.w	(-$011a,a6)
	cmpi.w	#$0001,(L006ec2)
	bhi.w	L003812
	lea.l	(L0071e2),a0
L003674:
	tst.b	(a0)
	beq.s	L0036b4
	bsr.w	L001d4c
L00367c:
	move.b	(a0)+,d0
	beq.s	L003674
	cmp.b	#$79,d0			;'y'
	beq.s	L0036a4
	cmp.b	#$71,d0			;'q'
	bne.w	L003812
	tst.w	(-$011a,a6)
	bne.w	L003812
	move.w	#$ffff,(-$011a,a6)
	move.w	#$ffff,(-$011c,a6)
	bra.s	L00367c

L0036a4:
	tst.w	(-$011a,a6)
	bne.w	L003812
	move.w	#$ffff,(-$011c,a6)
	bra.s	L00367c

L0036b4:
	lea.l	(L0070ca),a0
	cmpi.b	#$3a,($0001,a0)		;':'
	bne.s	L0036d6
	move.b	(a0),d0
	bsr.w	L001d3a
	sub.b	#$41,d0			;'A'
	bsr.w	L002754
	tst.l	d0
	bmi.w	L0037ee
L0036d6:
	lea.l	(L0070ca),a0
	bsr.w	L002a50
	bsr.w	L002bc8
	tst.b	d0
	beq.s	L003726
	tst.w	(-$011c,a6)
	bne.s	L00372a
	lea.l	(L0070ca),a1
	lea.l	(-$0118,a6),a0
L0036f8:
	bsr.w	L001c94
	bsr.w	L001df0
	move.l	a0,-(sp)
	DOS	_PRINT
	addq.l	#4,sp
	pea.l	(L005c4b)
	DOS	_PRINT
	addq.l	#4,sp
L003710:
	lea.l	(L006329),a0
	bsr.w	L002148
	bsr.w	L001b4c
	tst.w	d1
	beq.w	L0037d6
	bpl.s	L003710
L003726:
	clr.w	(-$011a,a6)
L00372a:
	lea.l	(L0070ca),a0
	movea.l	(L006eb6),a1
	bsr.w	L002be6
	cmp.l	#$ffffffff,d0
	beq.w	L003800
	cmp.w	#$0578,d0
	bls.s	L003754
	lea.l	(L00621b),a0
	bsr.w	L002044
L003754:
	lea.l	(L0070ca),a0
	bsr.w	L0028f6
	movea.l	(L006eb6),a1
	clr.b	d2
L003766:
	tst.b	(a1)
	beq.s	L0037d2
	move.b	($0017,a1),d0
	and.b	#$1f,d0
	bne.s	L0037cc
	cmpi.b	#$20,($0013,a1)		;' '
	beq.s	L003782
	move.b	#$2e,($0012,a1)		;'.'
L003782:
	bsr.w	L001c94
	move.b	#-$01,d2
	tst.w	(-$011a,a6)
	bne.s	L0037a0
	pea.l	(L0070ca)
	DOS	_PRINT
	addq.l	#4,sp
	bsr.w	L001b4c
	bra.s	L0037c2

L0037a0:
	pea.l	(L0070ca)
	DOS	_PRINT
	addq.l	#4,sp
	move.l	a0,-(sp)
	lea.l	(L006379),a0
	bsr.w	L002148
	movea.l	(sp)+,a0
	bsr.w	L001b4c
	tst.w	d1
	beq.s	L0037cc
	bpl.s	L0037a0
L0037c2:
	pea.l	(L0070ca)
	DOS	_DELETE
	addq.l	#4,sp
L0037cc:
	lea.l	($0020,a1),a1
	bra.s	L003766

L0037d2:
	tst.b	d2
	beq.s	L0037dc
L0037d6:
	clr.l	d0
L0037d8:
	unlk	a6
	rts

L0037dc:
	lea.l	(L005fb1),a0
	bsr.w	L002044
	move.l	#$00000503,d0
	bra.s	L0037d8

L0037ee:
	lea.l	(L005d9d),a0
	bsr.w	L002044
	move.l	#$00000500,d0
	bra.s	L0037d8

L003800:
	lea.l	(L006130),a0
	bsr.w	L002044
	move.l	#$00000508,d0
	bra.s	L0037d8

L003812:
	lea.l	(L005eb5),a0
	bsr.w	L002044
	move.l	#$00000500,d0
	bra.s	L0037d8

L003824:
	link.w	a6,#-$0068
	cmpi.w	#$0001,(L006ec4)
	bhi.w	L003bba
	clr.w	(-$005c,a6)
	clr.w	(-$0062,a6)
	clr.w	(-$0052,a6)
	clr.w	(-$0054,a6)
	clr.w	(-$0056,a6)
	clr.w	(-$0058,a6)
	lea.l	(L0071e2),a0
L003852:
	tst.b	(a0)
	beq.w	L0038f6
	bsr.w	L001d4c
L00385c:
	move.b	(a0)+,d0
	beq.s	L003852
	cmp.b	#$6e,d0			;'n'
	beq.s	L0038a6
	cmp.b	#$6c,d0			;'l'
	beq.s	L0038b6
	cmp.b	#$74,d0			;'t'
	beq.s	L0038c6
	cmp.b	#$72,d0			;'r'
	beq.s	L00389e
	cmp.b	#$77,d0			;'w'
	beq.s	L003892
	cmp.b	#$70,d0			;'p'
	bne.w	L003bba
	move.b	#-$01,(-$0062,a6)
	clr.b	(-$0060,a6)
	bra.s	L00385c

L003892:
	move.b	#-$01,(-$005c,a6)
	clr.b	(-$005a,a6)
	bra.s	L00385c

L00389e:
	move.b	#-$01,(-$0058,a6)
	bra.s	L00385c

L0038a6:
	tst.b	(-$0052,a6)
	bne.s	L00385c
	bsr.s	L0038d6
	move.b	#$01,(-$0052,a6)
	bra.s	L00385c

L0038b6:
	tst.b	(-$0054,a6)
	bne.s	L00385c
	bsr.s	L0038d6
	move.b	#$01,(-$0054,a6)
	bra.s	L00385c

L0038c6:
	tst.b	(-$0056,a6)
	bne.s	L00385c
	bsr.s	L0038d6
	move.b	#$01,(-$0056,a6)
	bra.s	L00385c

L0038d6:
	tst.b	(-$0052,a6)
	beq.s	L0038e0
	addq.b	#1,(-$0052,a6)
L0038e0:
	tst.b	(-$0054,a6)
	beq.s	L0038ea
	addq.b	#1,(-$0054,a6)
L0038ea:
	tst.b	(-$0056,a6)
	beq.s	L0038f4
	addq.b	#1,(-$0056,a6)
L0038f4:
	rts

L0038f6:
	lea.l	(-$0044,a6),a0
	lea.l	(L005b7e),a1
	bsr.w	L001c94
	cmpi.b	#$3a,(L0070cb)		;':'
	bne.s	L00392a
	move.b	(L0070ca),d0
	bsr.w	L001d3a
	move.b	d0,(a0)
	sub.b	#$41,d0			;'A'
	bsr.w	L002754
	tst.l	d0
	bmi.w	L003bde
	bra.s	L003932

L00392a:
	DOS	_CURDRV
	add.w	#$0041,d0
	move.b	d0,(a0)
L003932:
	bsr.w	L001b4c
	move.w	#$0008,-(sp)
	move.l	a0,-(sp)
	pea.l	(-$003c,a6)
	DOS	_FILES
	lea.l	($000a,sp),sp
	tst.l	d0
	bmi.s	L00397e
	move.w	#$0020,-(sp)		;' '
	DOS	_PUTCHAR
	addq.l	#2,sp
	move.w	#$0016,d1
	lea.l	(-$001e,a6),a0
	clr.w	d0
L00395c:
	tst.w	d1
	beq.s	L003988
	move.b	(a0)+,d0
	beq.s	L003978
	cmp.b	#$2e,d0			;'.'
	beq.s	L00395c
	move.w	d0,-(sp)
	DOS	_PUTCHAR
	addq.l	#2,sp
	subq.w	#1,d1
	bra.s	L00395c

L003974:
	bsr.w	L001b58
L003978:
	dbra.w	d1,L003974
	bra.s	L003988

L00397e:
	pea.l	(L00629b)
	DOS	_PRINT
	addq.l	#4,sp
L003988:
	bsr.w	L001b58
	lea.l	(L0070ca),a0
	bsr.w	L002a5e
	bsr.w	L001df0
	move.l	a0,-(sp)
	clr.b	d1
L00399e:
	move.b	(a0)+,d0
	beq.s	L0039cc
	tst.b	d1
	beq.s	L0039aa
	clr.b	d1
	bra.s	L00399e

L0039aa:
	cmp.b	#$80,d0
	bcs.s	L0039c2
	cmp.b	#$a0,d0
	bcs.s	L0039bc
	cmp.b	#$e0,d0
	bcs.s	L0039c2
L0039bc:
	move.b	#$01,d1
	bra.s	L00399e

L0039c2:
	cmp.b	#$5c,d0			;'\'
	bne.s	L00399e
	move.l	a0,(sp)
	bra.s	L00399e

L0039cc:
	movea.l	(sp)+,a0
	cmpi.b	#$3a,(-$0002,a0)	;':'
	beq.s	L0039d8
	subq.l	#1,a0
L0039d8:
	move.b	(a0),-(sp)
	clr.b	(a0)
	pea.l	(L0070ca)
	DOS	_PRINT
	addq.l	#4,sp
	move.b	(sp)+,(a0)
	bsr.w	L001b4c
	lea.l	(L0070ca),a0
	movea.l	(L006eb6),a1
	bsr.w	L002be6
	cmp.l	#$ffffffff,d0
	beq.w	L003bcc
	cmp.w	#$0578,d0
	bls.s	L003a1a
	lea.l	(L00621b),a0
	bsr.w	L002044
	move.w	#$0578,d0
L003a1a:
	lea.l	(-$0050,a6),a0
	and.l	#$0000ffff,d0
	bsr.w	L001b62
	pea.l	($0004,a0)
	DOS	_PRINT
	addq.l	#4,sp
	pea.l	(L0062b3)
	DOS	_PRINT
	addq.l	#4,sp
	pea.l	(-$003c,a6)
	clr.w	d0
	move.b	(L0070ca),d0
	bsr.w	L001d3a
	sub.b	#$40,d0			;'@'
	move.w	d0,-(sp)
	DOS	_DSKFRE
	addq.l	#6,sp
	lsr.l	#7,d0
	move.l	d0,-(sp)
	clr.l	d0
	clr.l	d1
	move.w	(-$0038,a6),d0
	move.w	(-$0036,a6),d1
	mulu.w	d1,d0
	lsr.l	#7,d0
	clr.l	d1
	move.w	(-$003a,a6),d1
	mulu.w	d1,d0
	sub.l	(sp),d0
	lsr.l	#3,d0
	lea.l	(-$0050,a6),a0
	bsr.w	L001b62
	move.l	a0,-(sp)
	DOS	_PRINT
	addq.l	#4,sp
	pea.l	(L0062bd)
	DOS	_PRINT
	addq.l	#4,sp
	pea.l	(L0062c9)
	DOS	_PRINT
	addq.l	#4,sp
	move.l	(sp)+,d0
	lsr.l	#3,d0
	bsr.w	L001b62
	move.l	a0,-(sp)
	DOS	_PRINT
	addq.l	#4,sp
	pea.l	(L0062bd)
	DOS	_PRINT
	addq.l	#4,sp
	pea.l	(L0062cc)
	DOS	_PRINT
	addq.l	#4,sp
	movea.l	(L006eb6),a5
	movea.l	(L006ebe),a4
	bsr.w	L003c22
	bsr.w	L003c56
	move.l	(-$0068,a6),d0
	lea.l	(-$0050,a6),a0
	bsr.w	L001b62
	move.l	a0,-(sp)
	DOS	_PRINT
	addq.l	#4,sp
	pea.l	(L0062bd)
	DOS	_PRINT
	addq.l	#4,sp
	bsr.w	L001b4c
	tst.l	(a4)
	beq.w	L003bae
	bsr.w	L0028ba
	sub.b	#$17,d0
	bcc.s	L003afe
	clr.b	d0
L003afe:
	move.b	d0,(-$005e,a6)
	tst.b	d1
	beq.s	L003b08
	subq.b	#1,d1
L003b08:
	move.b	d1,(-$0064,a6)
L003b0c:
	movea.l	(a4)+,a5
	tst.w	(-$005c,a6)
	beq.s	L003b48
	move.l	a5,-(sp)
	DOS	_PRINT
	addq.l	#4,sp
	addi.b	#$18,(-$005a,a6)
	move.b	(-$005e,a6),d0
	cmp.b	(-$005a,a6),d0
	bcc.s	L003b34
	clr.b	(-$005a,a6)
L003b2e:
	bsr.w	L003bf6
	bra.s	L003ba6

L003b34:
	tst.l	(a4)
	beq.s	L003b2e
	move.w	#$0081,-(sp)
	DOS	_PUTCHAR
	move.w	#$0062,-(sp)		;'b'
	DOS	_PUTCHAR
	addq.l	#4,sp
	bra.s	L003ba6

L003b48:
	move.l	a5,-(sp)
	DOS	_PRINT
	addq.l	#4,sp
	adda.l	#$00000017,a5
	bsr.w	L001b58
	move.b	(a5)+,d0
	btst.l	#$04,d0
	beq.s	L003b6e
	pea.l	(L00628e)
	DOS	_PRINT
	addq.l	#4,sp
	addq.l	#4,a5
	bra.s	L003b86

L003b6e:
	move.l	(a5)+,d0
	lea.l	(-$0050,a6),a0
	bsr.w	L001b62
	move.l	a0,-(sp)
	DOS	_PRINT
	addq.l	#4,sp
	bsr.w	L001b58
	bsr.w	L001b58
L003b86:
	move.w	(a5)+,d1
	beq.s	L003b98
	move.w	d1,d0
	bsr.w	L002212
	bsr.w	L001b58
	bsr.w	L001b58
L003b98:
	move.w	(a5)+,d0
	beq.s	L003ba4
	tst.w	d1
	beq.s	L003ba4
	bsr.w	L002478
L003ba4:
	bsr.s	L003bf6
L003ba6:
	tst.l	(a4)
	bne.w	L003b0c
	bra.s	L003bf0

L003bae:
	pea.l	(L005fb0)
	DOS	_PRINT
	addq.l	#4,sp
	bra.s	L003bf0

L003bba:
	lea.l	(L005eb5),a0
	bsr.w	L002044
	move.l	#$00000500,d0
	bra.s	L003bf2

L003bcc:
	lea.l	(L006130),a0
	bsr.w	L002044
	move.l	#$00000508,d0
	bra.s	L003bf2

L003bde:
	lea.l	(L005d9d),a0
	bsr.w	L002044
	move.l	#$00000500,d0
	bra.s	L003bf2

L003bf0:
	clr.l	d0
L003bf2:
	unlk	a6
	rts

L003bf6:
	tst.b	(-$0062,a6)
	beq.s	L003c1c
	addq.b	#1,(-$0060,a6)
	move.b	(-$0060,a6),d0
	cmp.b	(-$0064,a6),d0
	bcs.s	L003c1c
	bsr.w	L001b4c
	lea.l	(L005c5a),a0
	bsr.w	L002138
	clr.b	(-$0060,a6)
L003c1c:
	bsr.w	L001b4c
	rts

L003c22:
	movem.l	d0-d1/a4-a5,-(sp)
	clr.l	(-$0068,a6)
L003c2a:
	tst.b	(a5)
	beq.s	L003c4e
	move.l	a5,(a4)+
	adda.l	#$00000017,a5
	move.b	(a5)+,d0
	move.l	(a5)+,d1
	btst.l	#$04,d0
	bne.s	L003c4a
	lsr.l	#8,d1
	lsr.l	#2,d1
	addq.l	#1,d1
	add.l	d1,(-$0068,a6)
L003c4a:
	addq.l	#4,a5
	bra.s	L003c2a

L003c4e:
	clr.l	(a4)
	movem.l	(sp)+,d0-d1/a4-a5
	rts

L003c56:
	movem.l	d0-d6/a0-a5,-(sp)
	move.b	(-$0052,a6),d1
	move.b	(-$0054,a6),d2
	move.b	(-$0056,a6),d3
	move.b	(-$0058,a6),d4
	move.b	d1,d0
	or.b	d2,d0
	or.b	d3,d0
	or.b	d4,d0
	beq.s	L003c98
L003c74:
	movea.l	a4,a5
L003c76:
	addq.l	#4,a5
	movea.l	(a4),a2
	movea.l	(a5),a3
	move.l	a2,(-$0004,sp)
	beq.s	L003c98
	move.l	a3,(-$0004,sp)
	bne.s	L003c8c
	addq.l	#4,a4
	bra.s	L003c74

L003c8c:
	bsr.s	L003c9e
	tst.b	d0
	beq.s	L003c76
	move.l	a3,(a4)
	move.l	a2,(a5)
	bra.s	L003c76

L003c98:
	movem.l	(sp)+,d0-d6/a0-a5
	rts

L003c9e:
	move.b	#$03,d5
L003ca2:
	suba.l	a0,a0
	move.w	#$0015,d0
	move.b	d4,d6
	cmp.b	d5,d1
	beq.s	L003ce4
	movea.l	#$00000018,a0
	move.w	#$0003,d0
	move.b	d4,d6
	cmp.b	d5,d2
	beq.s	L003ce4
	movea.l	#$0000001c,a0
	move.w	#$0003,d0
	move.b	d4,d6
	eori.b	#-$01,d6
	cmp.b	d5,d3
	beq.s	L003ce4
L003cd2:
	subq.b	#1,d5
	bne.s	L003ca2
	tst.b	d4
	bne.s	L003cde
	cmpa.l	a2,a3
	bra.s	L003ce0

L003cde:
	cmpa.l	a3,a2
L003ce0:
	bcc.s	L003d04
	bra.s	L003cfe

L003ce4:
	movea.l	a0,a1
	adda.l	a2,a0
	adda.l	a3,a1
L003cea:
	tst.b	d6
	bne.s	L003cf2
	cmpm.b	(a0)+,(a1)+
	bra.s	L003cf4

L003cf2:
	cmpm.b	(a1)+,(a0)+
L003cf4:
	bcs.s	L003cfe
	bne.s	L003d04
	dbra.w	d0,L003cea
	bra.s	L003cd2

L003cfe:
	move.b	#-$01,d0
	rts

L003d04:
	clr.b	d0
	rts

L003d08:
	pea.l	(L005bb2)
	DOS	_PRINT
	addq.l	#4,sp
	clr.l	d0
	rts

L003d16:
	link.w	a6,#-$0480
	cmpi.w	#$0002,(L006ec4)
	bne.w	L00403e
	clr.w	(-$0480,a6)
	cmpi.w	#$0001,(L006ec2)
	bhi.w	L00403e
	lea.l	(L0071e2),a0
L003d3c:
	tst.b	(a0)
	beq.s	L003d58
	bsr.w	L001d4c
L003d44:
	move.b	(a0)+,d0
	beq.s	L003d3c
	cmp.b	#$71,d0			;'q'
	bne.w	L00403e
	move.w	#$ffff,(-$0480,a6)
	bra.s	L003d44

L003d58:
	lea.l	(-$0118,a6),a0
	lea.l	(L0070ca),a1
	bsr.w	L001c94
	movea.l	a1,a0
	bsr.w	L001c86
	lea.l	($01,a1,d0.l),a1
	lea.l	(-$0230,a6),a0
	bsr.w	L001c94
	lea.l	(-$0118,a6),a0
	bsr.w	L002a50
	lea.l	(-$0118,a6),a0
	cmpi.b	#$3a,($0001,a0)		;':'
	bne.s	L003da0
	move.b	(a0),d0
	bsr.w	L001d3a
	sub.b	#$41,d0			;'A'
	bsr.w	L002754
	tst.l	d0
	bmi.w	L004036
L003da0:
	bsr.w	L002bc8
	tst.b	d0
	bne.s	L003dac
	clr.w	(-$0480,a6)
L003dac:
	lea.l	(-$0118,a6),a0
	movea.l	(L006eb6),a1
	bsr.w	L002be6
	cmp.l	#$ffffffff,d0
	beq.w	L004028
	cmp.w	#$0578,d0
	bls.s	L003dd4
	lea.l	(L00621b),a0
	bsr.w	L002044
L003dd4:
	lea.l	(-$0230,a6),a0
	bsr.w	L002a50
	bsr.w	L0028f6
	movea.l	a0,a3
	lea.l	(-$0230,a6),a0
	cmpi.b	#$3a,($0001,a0)		;':'
	bne.s	L003df0
	addq.l	#2,a0
L003df0:
	movea.l	a0,a2
	bsr.w	L0028f6
	cmpa.l	a0,a2
	bne.s	L003e26
	movea.l	a0,a1
	lea.l	(-$024e,a6),a0
	bsr.w	L001c94
	lea.l	(-$0118,a6),a1
	cmpi.b	#$3a,($0001,a1)		;':'
	bne.s	L003e12
	addq.l	#2,a1
L003e12:
	movea.l	a2,a0
	bsr.w	L001c94
	bsr.w	L0028f6
	lea.l	(-$024e,a6),a1
	bsr.w	L001c94
	bra.s	L003e28

L003e26:
	movea.l	a3,a0
L003e28:
	bsr.w	L00293a
	movea.l	a0,a1
	lea.l	(-$024e,a6),a0
	bsr.w	L001c94
	clr.b	d2
	movea.l	(L006eb6),a0
L003e3e:
	tst.b	(a0)
	beq.w	L004058
	btst.b	#$04,($0017,a0)
	bne.w	L004018
	cmpi.b	#$20,($0013,a0)		;' '
	beq.s	L003e5c
	move.b	#$2e,($0012,a0)		;'.'
L003e5c:
	move.l	a0,-(sp)
	lea.l	(-$0118,a6),a0
	bsr.w	L0028f6
	movea.l	(sp)+,a1
	bsr.w	L001c94
	lea.l	(-$0230,a6),a0
	bsr.w	L0028f6
	exg.l	a0,a1
	lea.l	(-$024e,a6),a2
	bsr.w	L0029c4
	tst.w	(-$0480,a6)
	beq.s	L003ea8
L003e84:
	pea.l	(-$0118,a6)
	DOS	_PRINT
	addq.l	#4,sp
	move.l	a0,-(sp)
	lea.l	(L006393),a0
	bsr.w	L002148
	movea.l	(sp)+,a0
	bsr.w	L001b4c
	tst.w	d1
	beq.w	L004018
	bpl.s	L003e84
	bra.s	L003eb4

L003ea8:
	pea.l	(-$0118,a6)
	DOS	_PRINT
	addq.l	#4,sp
	bsr.w	L001b4c
L003eb4:
	movem.l	a0-a2,-(sp)
	lea.l	(-$0230,a6),a1
	lea.l	(-$047e,a6),a0
	bsr.w	L001c94
	movea.l	a0,a2
	movea.l	a1,a0
	movea.l	a2,a1
	lea.l	(-$0118,a6),a2
	cmpi.b	#$3a,($0001,a1)		;':'
	beq.s	L003ef4
	cmpi.b	#$3a,($0001,a2)		;':'
	bne.s	L003f08
	move.b	(a2)+,(a0)+
	move.b	(a2)+,(a0)+
	bsr.w	L001c94
	subq.l	#2,a0
	movea.l	a0,a2
	movea.l	a1,a0
	movea.l	a2,a1
	bsr.w	L001c94
	bra.s	L003f08

L003ef4:
	move.b	(a1),d0
	bsr.w	L001d3a
	sub.b	#$41,d0			;'A'
	bsr.w	L002754
	tst.l	d0
	bmi.w	L004036
L003f08:
	lea.l	(-$047e,a6),a0
	bsr.w	L001df0
	bsr.w	L0028f6
	clr.b	(a0)
	lea.l	(-$0118,a6),a1
	lea.l	(-$0366,a6),a0
	bsr.w	L001c94
	bsr.w	L001df0
	bsr.w	L0028f6
	clr.b	(a0)
	lea.l	(-$0366,a6),a0
	lea.l	(-$047e,a6),a1
L003f34:
	move.b	(a0),d0
	beq.s	L003f82
	cmp.b	#$80,d0
	bcs.s	L003f54
	cmp.b	#$a0,d0
	bcs.s	L003f4a
	cmp.b	#$e0,d0
	bcs.s	L003f54
L003f4a:
	cmpm.b	(a0)+,(a1)+
	bne.s	L003f84
	cmpm.b	(a0)+,(a1)+
	bne.s	L003f84
	bra.s	L003f34

L003f54:
	cmp.b	#$20,d0			;' '
	beq.s	L003f76
	bsr.w	L001d28
	move.b	d0,d1
	move.b	(a1),d0
	bsr.w	L001d28
	cmp.b	d0,d1
	beq.s	L003f70
	move.b	#-$01,d0
	bra.s	L003f84

L003f70:
	addq.l	#1,a0
	addq.l	#1,a1
	bra.s	L003f34

L003f76:
	addq.l	#1,a0
L003f78:
	cmpi.b	#$20,(a1)		;' '
	bne.s	L003f34
	addq.l	#1,a1
	bra.s	L003f78

L003f82:
	move.b	(a1),d0
L003f84:
	movem.l	(sp)+,a0-a2
	tst.b	d0
	bne.w	L004020
	movem.l	a0-a2,-(sp)
	lea.l	(-$0230,a6),a1
	lea.l	(-$047e,a6),a0
	bsr.w	L001c94
	bsr.w	L001df0
	bsr.w	L0028f6
	movea.l	a0,a2
	lea.l	(-$0118,a6),a1
	lea.l	(-$0366,a6),a0
	bsr.w	L001c94
	bsr.w	L001df0
	bsr.w	L0028f6
	movea.l	a2,a1
L003fbe:
	move.b	(a0),d0
	beq.s	L003ffa
	cmp.b	#$80,d0
	bcs.s	L003fde
	cmp.b	#$a0,d0
	bcs.s	L003fd4
	cmp.b	#$e0,d0
	bcs.s	L003fde
L003fd4:
	cmpm.b	(a0)+,(a1)+
	bne.s	L003ffc
	cmpm.b	(a0)+,(a1)+
	bne.s	L003ffc
	bra.s	L003fbe

L003fde:
	cmp.b	#$20,d0			;' '
	beq.s	L003fee
	cmp.b	(a1),d0
	bne.s	L003ffc
	addq.l	#1,a0
	addq.l	#1,a1
	bra.s	L003fbe

L003fee:
	addq.l	#1,a0
L003ff0:
	cmpi.b	#$20,(a1)		;' '
	bne.s	L003fbe
	addq.l	#1,a1
	bra.s	L003ff0

L003ffa:
	move.b	(a1),d0
L003ffc:
	movem.l	(sp)+,a0-a2
	tst.b	d0
	beq.s	L004046
	pea.l	(-$0230,a6)
	pea.l	(-$0118,a6)
	DOS	_RENAME
	addq.l	#8,sp
	tst.l	d0
	bne.s	L004046
	move.b	#-$01,d2
L004018:
	lea.l	($0020,a0),a0
	bra.w	L003e3e

L004020:
	lea.l	(L005e22),a0
	bra.s	L00404c

L004028:
	lea.l	(L006130),a0
	move.l	#$00000508,d0
	bra.s	L004052

L004036:
	lea.l	(L005d9d),a0
	bra.s	L00404c

L00403e:
	lea.l	(L005eb5),a0
	bra.s	L00404c

L004046:
	lea.l	(L005e5d),a0
L00404c:
	move.l	#$00000500,d0
L004052:
	bsr.w	L002044
	bra.s	L00405e

L004058:
	tst.b	d2
	beq.s	L004046
	clr.l	d0
L00405e:
	unlk	a6
	rts

L004062:
	tst.w	(L006ec4)
	beq.s	L0040b6
	lea.l	(L006ec8),a0
	bsr.w	L001d0e
	adda.l	d0,a0
	addq.l	#3,a0
L004078:
	bsr.w	L001d0e
	adda.l	d0,a0
	cmpi.b	#$3d,(a0)+		;'='
	beq.s	L004078
	tst.b	-(a0)
	beq.s	L0040b6
	movea.l	a0,a1
	move.w	#$00ff,d0
L00408e:
	move.b	(a0)+,d1
	beq.s	L0040d4
	cmp.b	#$3d,d1			;'='
	beq.s	L00409e
	dbra.w	d0,L00408e
	bra.s	L0040d4

L00409e:
	movea.l	a1,a0
	DOS	_GETPDB
	movea.l	d0,a1
	movea.l	(a1),a1
	bsr.w	L001f2c
	tst.l	d0
	bne.s	L0040e6
	lea.l	(L005d01),a0
	bra.s	L0040da

L0040b6:
	DOS	_GETPDB
	movea.l	d0,a0
	movea.l	(a0),a0
	addq.l	#4,a0
L0040be:
	tst.b	(a0)
	beq.s	L0040e6
	bsr.w	L001ff4
	bsr.w	L001b4c
	move.w	#$0001,d0
	bsr.w	L00209e
	bra.s	L0040be

L0040d4:
	lea.l	(L00606a),a0
L0040da:
	bsr.w	L002044
	move.l	#$00000500,d0
	bra.s	L0040e8

L0040e6:
	clr.l	d0
L0040e8:
	rts

L0040ea:
	bsr.w	L001b4c
	bsr.w	L002178
	bsr.w	L001b4c
	bsr.w	L001b4c
	clr.l	d0
	rts

L0040fe:
	link.w	a6,#-$0088
	clr.w	(-$0082,a6)
	clr.w	(-$0084,a6)
	lea.l	(L0071e2),a0
L004110:
	tst.b	(a0)
	beq.s	L00413a
	bsr.w	L001d4c
L004118:
	move.b	(a0)+,d0
	beq.s	L004110
	cmp.b	#$73,d0			;'s'
	beq.s	L004132
	cmp.b	#$63,d0			;'c'
	bne.w	L00445a
	move.b	#-$01,(-$0082,a6)
	bra.s	L004118

L004132:
	move.b	#-$01,(-$0084,a6)
	bra.s	L004118

L00413a:
	tst.b	(-$0082,a6)
	beq.s	L004148
	tst.b	(-$0084,a6)
	bne.w	L00445a
L004148:
	clr.w	d1
	cmpi.w	#$0001,(L006ec4)
	bhi.w	L00445a
	bne.s	L004188
	lea.l	(L0070ca),a0
	cmpi.b	#$3a,($0001,a0)		;':'
	bne.w	L004278
	move.b	(a0),d0
	bsr.w	L001d3a
	sub.b	#$41,d0			;'A'
	move.b	d0,d1
	bsr.w	L002754
	tst.l	d0
	bmi.w	L004448
	addq.w	#1,d1
	tst.b	($0002,a0)
	bne.w	L004278
L004188:
	tst.b	(-$0084,a6)
	bne.w	L00445a
	tst.b	(-$0082,a6)
	bne.w	L00422c
L004198:
	tst.b	d1
	bne.s	L0041a2
	DOS	_CURDRV
	addq.w	#1,d0
	move.b	d0,d1
L0041a2:
	lea.l	(-$005a,a6),a0
	lea.l	(L005b7e),a1
	bsr.w	L001c94
	add.b	#$40,d1			;'@'
	move.b	d1,(a0)
	pea.l	(L005d65)
	DOS	_PRINT
	move.w	d1,-(sp)
	DOS	_PUTCHAR
	pea.l	(L005d6f)
	DOS	_PRINT
	lea.l	($000a,sp),sp
	move.w	#$0008,-(sp)
	move.l	a0,-(sp)
	pea.l	(-$003c,a6)
	DOS	_FILES
	lea.l	($000a,sp),sp
	tst.l	d0
	bmi.s	L00421e
	bsr.w	L001b58
	move.w	#$0015,d1
	lea.l	(-$001e,a6),a0
	clr.w	d0
L0041f0:
	tst.w	d1
	beq.s	L004210
	move.b	(a0)+,d0
	beq.s	L00420c
	cmp.b	#$2e,d0			;'.'
	beq.s	L0041f0
	move.w	d0,-(sp)
	DOS	_PUTCHAR
	addq.l	#2,sp
	subq.w	#1,d1
	bra.s	L0041f0

L004208:
	bsr.w	L001b58
L00420c:
	dbra.w	d1,L004208
L004210:
	pea.l	(L005c1b)
	DOS	_PRINT
	addq.l	#4,sp
	bra.w	L0044a2

L00421e:
	pea.l	(L005fbb)
	DOS	_PRINT
	addq.l	#4,sp
	bra.w	L0044a2

L00422c:
	tst.b	d1
	bne.s	L004236
	DOS	_CURDRV
	addq.w	#1,d0
	move.b	d0,d1
L004236:
	add.b	#$40,d1			;'@'
	lea.l	(-$005a,a6),a0
	lea.l	(L005b7e),a1
	bsr.w	L001c94
	move.b	d1,(a0)
	lea.l	(-$0080,a6),a0
	bsr.w	L001c94
	move.b	d1,(a0)
	move.w	#$0008,-(sp)
	move.l	a0,-(sp)
	pea.l	(-$003c,a6)
	DOS	_FILES
	lea.l	($000a,sp),sp
	tst.l	d0
	bmi.w	L004490
	bsr.w	L0044a8
	tst.l	d0
	bmi.w	L00447e
	bra.w	L0044a2

L004278:
	tst.b	(-$0082,a6)
	bne.w	L00445a
	tst.b	(-$0084,a6)
	beq.w	L004198
	lea.l	(L0070ca),a0
	cmpi.b	#$3a,($0001,a0)		;':'
	bne.s	L0042a0
	move.b	(a0),d0
	bsr.w	L001d3a
	addq.l	#2,a0
	bra.s	L0042a6

L0042a0:
	DOS	_CURDRV
	add.b	#$41,d0			;'A'
L0042a6:
	movea.l	a0,a2
	move.b	d0,(-$005a,a6)
	bsr.w	L001c86
	cmp.b	#$15,d0
	bhi.s	L004326
	lea.l	(-$0080,a6),a0
	lea.l	(L005b7e),a1
	bsr.w	L001c94
	move.b	(-$005a,a6),(-$0080,a6)
	movea.l	a2,a1
	lea.l	(-$0059,a6),a0
	move.b	#$3a,(a0)+		;':'
	move.b	#$5c,(a0)+		;'\'
	bsr.w	L001c94
	clr.b	d1
L0042de:
	clr.b	d2
L0042e0:
	move.b	(a0)+,d0
	beq.s	L00433a
	addq.b	#1,d1
	cmp.b	#$3a,d0			;':'
	beq.s	L004326
	cmp.b	#$2e,d0			;'.'
	beq.s	L004326
	cmp.b	#$2a,d0			;'*'
	beq.s	L004326
	cmp.b	#$3f,d0			;'?'
	beq.s	L004326
	tst.b	d2
	bne.s	L0042de
	cmp.b	#$80,d0
	bcs.s	L004320
	cmp.b	#$a0,d0
	bcs.s	L004314
	cmp.b	#$e0,d0
	bcs.s	L004320
L004314:
	cmp.b	#$12,d1
	beq.s	L004326
	move.b	#-$01,d2
	bra.s	L0042e0

L004320:
	cmp.b	#$5c,d0			;'\'
	bne.s	L0042e0
L004326:
	lea.l	(L005dcb),a0
	bsr.w	L002044
	move.l	#$00000500,d0
	bra.w	L0044a4

L00433a:
	clr.l	(-$0088,a6)
	move.w	#$003f,-(sp)		;'?'
	pea.l	(-$0080,a6)
	pea.l	(-$003c,a6)
	DOS	_FILES
	lea.l	($000a,sp),sp
	tst.l	d0
	bmi.s	L00437a
	btst.b	#$03,(-$0027,a6)
	bne.s	L004370
L00435c:
	pea.l	(-$003c,a6)
	DOS	_NFILES
	addq.l	#4,sp
	tst.l	d0
	bmi.s	L00437a
	btst.b	#$03,(-$0027,a6)
	beq.s	L00435c
L004370:
	move.l	(-$0026,a6),d0
	swap.w	d0
	move.l	d0,(-$0088,a6)
L00437a:
	lea.l	(-$005a,a6),a1
	lea.l	(-$0078,a6),a0
	bsr.w	L001c94
	bsr.w	L001c86
	cmp.b	#$15,d0
	bls.s	L0043a4
	adda.l	#$00000015,a0
	adda.l	#$00000015,a1
	move.b	#$2e,(a0)+		;'.'
	bsr.w	L001c94
L0043a4:
	move.w	#$003f,-(sp)		;'?'
	pea.l	(-$0078,a6)
	pea.l	(-$003c,a6)
	DOS	_FILES
	lea.l	($000a,sp),sp
	tst.l	d0
	bmi.s	L0043f2
	btst.b	#$03,(-$0027,a6)
	beq.s	L0043de
L0043c2:
	pea.l	(-$003c,a6)
	DOS	_NFILES
	addq.l	#4,sp
	tst.l	d0
	bmi.s	L0043f2
	btst.b	#$03,(-$0027,a6)
	bne.s	L0043c2
	bra.s	L0043de

L0043d8:
	move.l	d0,-(sp)
	DOS	_CLOSE
	addq.l	#2,sp
L0043de:
	lea.l	(L00616a),a0
	bsr.w	L002044
	move.l	#$00000502,d0
	bra.w	L0044a4

L0043f2:
	tst.l	(-$0088,a6)
	bne.s	L004408
	move.w	#$0002,-(sp)
	pea.l	(-$0078,a6)
	DOS	_OPEN
	addq.l	#6,sp
	tst.l	d0
	bpl.s	L0043d8
L004408:
	bsr.w	L0044a8
	tst.l	d0
	bmi.s	L00446c
	move.w	#$0008,-(sp)
	pea.l	(-$0078,a6)
	DOS	_CREATE
	addq.l	#6,sp
	tst.l	d0
	bmi.s	L0043de
	tst.l	(-$0088,a6)
	beq.s	L00443c
	move.l	(-$0088,a6),-(sp)
	move.w	d0,d1
	move.w	d0,-(sp)
	DOS	_FILEDATE
	addq.l	#6,sp
	exg.l	d0,d1
	cmp.l	#$ffff0000,d1
	bcc.s	L0043d8
L00443c:
	move.w	d0,-(sp)
	DOS	_CLOSE
	addq.l	#2,sp
	tst.l	d0
	bmi.s	L0043de
	bra.s	L0044a2

L004448:
	lea.l	(L005d9d),a0
	bsr.w	L002044
	move.l	#$00000500,d0
	bra.s	L0044a4

L00445a:
	lea.l	(L005eb5),a0
	bsr.w	L002044
	move.l	#$00000500,d0
	bra.s	L0044a4

L00446c:
	lea.l	(L0061a8),a0
	bsr.w	L002044
	move.l	#$00000502,d0
	bra.s	L0044a4

L00447e:
	lea.l	(L0061aa),a0
	bsr.w	L002044
	move.l	#$00000502,d0
	bra.s	L0044a4

L004490:
	lea.l	(L006094),a0
	bsr.w	L002044
	move.l	#$00000503,d0
	bra.s	L0044a4

L0044a2:
	clr.l	d0
L0044a4:
	unlk	a6
	rts

L0044a8:
	move.w	#$0008,-(sp)
	pea.l	(-$0080,a6)
	pea.l	(-$003c,a6)
	DOS	_FILES
	lea.l	($000a,sp),sp
L0044ba:
	tst.l	d0
	bmi.s	L0044f6
	btst.b	#$00,(-$0027,a6)
	bne.s	L0044fa
	lea.l	(-$0057,a6),a0
	lea.l	(-$001e,a6),a1
	bsr.w	L001c94
	clr.w	-(sp)
	pea.l	(-$005a,a6)
	DOS	_CHMOD
	addq.l	#6,sp
	tst.l	d0
	bmi.s	L0044f8
	pea.l	(-$005a,a6)
	DOS	_DELETE
	addq.l	#4,sp
	tst.l	d0
	bmi.s	L0044f8
	pea.l	(-$003c,a6)
	DOS	_NFILES
	addq.l	#4,sp
	bra.s	L0044ba

L0044f6:
	clr.l	d0
L0044f8:
	rts

L0044fa:
	moveq.l	#$ff,d0
	rts

L0044fe:
	link.w	a6,#-$0102
	lea.l	(L006fc9),a0
	bsr.w	L001d0e
	adda.l	d0,a0
	tst.b	(a0)
	bne.s	L00454e
	pea.l	(L005bee)
	DOS	_PRINT
	addq.l	#4,sp
	pea.l	(L005be4)
	DOS	_PRINT
	addq.l	#4,sp
	pea.l	(L005bf5)
	DOS	_PRINT
	addq.l	#4,sp
	DOS	_GETDATE
	bsr.w	L002268
	pea.l	(L005c1b)
	DOS	_PRINT
	addq.l	#4,sp
	lea.l	(-$0102,a6),a0
	move.b	#$ff,(a0)+
	clr.b	(a0)+
	clr.b	(a0)
	bra.s	L00457c

L00454e:
	lea.l	(L006fc8),a1
	lea.l	(-$0102,a6),a0
	move.b	#$ff,(a0)+
	move.b	(a1)+,(a0)+
	bsr.w	L001c94
	bra.s	L0045a4

L004564:
	bsr.w	L001b4c
	pea.l	(L005be4)
	DOS	_PRINT
	addq.l	#4,sp
	pea.l	(L005c38)
	DOS	_PRINT
	addq.l	#4,sp
L00457c:
	pea.l	(L005be4)
	DOS	_PRINT
	addq.l	#4,sp
	pea.l	(L005c23)
	DOS	_PRINT
	addq.l	#4,sp
	pea.l	(-$0102,a6)
	DOS	_GETS
	addq.l	#4,sp
	bsr.w	L001b4c
	lea.l	(-$0101,a6),a0
	tst.b	(a0)+
	beq.s	L0045b6
L0045a4:
	bsr.w	L00232e
	tst.l	d0
	bmi.s	L004564
	move.w	d0,-(sp)
	DOS	_SETDATE
	addq.l	#2,sp
	tst.l	d0
	bmi.s	L004564
L0045b6:
	clr.l	d0
	unlk	a6
	rts

L0045bc:
	link.w	a6,#-$0118
	cmpi.w	#$0001,(L006ec4)
	bhi.w	L00465a
	bne.s	L004630
	lea.l	(-$0118,a6),a0
	lea.l	(L005b6a),a1
	bsr.w	L001c94
	lea.l	(L006fc9),a1
	tst.b	(a1)
	beq.s	L004630
	bsr.w	L001cb8
	move.l	a0,-(sp)
L0045ec:
	move.b	(a0)+,d0
	beq.s	L00460e
	cmp.b	#$20,d0			;' '
	beq.s	L00460a
	cmp.b	#$09,d0
	beq.s	L00460a
	cmp.b	#$2f,d0			;'/'
	bne.s	L0045ec
	move.b	#$5c,(-$0001,a0)	;'\'
	bra.s	L0045ec

L00460a:
	clr.b	(-$0001,a0)
L00460e:
	movea.l	(sp)+,a0
	DOS	_GETPDB
	movea.l	d0,a1
	movea.l	(a1),a1
	bsr.w	L001f2c
	tst.l	d0
	bne.s	L004676
	lea.l	(L005d01),a0
	bsr.w	L002044
	move.l	#$00000500,d0
	bra.s	L004678

L004630:
	DOS	_GETPDB
	movea.l	d0,a1
	movea.l	(a1),a1
	lea.l	(L005b6a),a0
	bsr.w	L001ef2
	beq.s	L00466c
	tst.b	(a0)
	beq.s	L00466c
	pea.l	(L005b6a)
	DOS	_PRINT
	move.l	a0,-(sp)
	DOS	_PRINT
	addq.l	#8,sp
	bsr.w	L001b4c
	bra.s	L004676

L00465a:
	lea.l	(L005eb5),a0
	bsr.w	L002044
	move.l	#$00000500,d0
	bra.s	L004678

L00466c:
	pea.l	(L0060d8)
	DOS	_PRINT
	addq.l	#4,sp
L004676:
	clr.l	d0
L004678:
	unlk	a6
	rts

L00467c:
	link.w	a6,#-$0102
	lea.l	(L006fc9),a0
	bsr.w	L001d0e
	adda.l	d0,a0
	tst.b	(a0)
	bne.s	L0046cc
	pea.l	(L005bee)
	DOS	_PRINT
	addq.l	#4,sp
	pea.l	(L005be9)
	DOS	_PRINT
	addq.l	#4,sp
	pea.l	(L005bf5)
	DOS	_PRINT
	addq.l	#4,sp
	DOS	_GETTIM2
	bsr.w	L00250a
	pea.l	(L005c1b)
	DOS	_PRINT
	addq.l	#4,sp
	lea.l	(-$0102,a6),a0
	move.b	#$ff,(a0)+
	clr.b	(a0)+
	clr.b	(a0)
	bra.s	L0046fa

L0046cc:
	lea.l	(L006fc8),a1
	lea.l	(-$0102,a6),a0
	move.b	#$ff,(a0)+
	move.b	(a1)+,(a0)+
	bsr.w	L001c94
	bra.s	L004722

L0046e2:
	bsr.w	L001b4c
	pea.l	(L005be9)
	DOS	_PRINT
	addq.l	#4,sp
	pea.l	(L005c38)
	DOS	_PRINT
	addq.l	#4,sp
L0046fa:
	pea.l	(L005be9)
	DOS	_PRINT
	addq.l	#4,sp
	pea.l	(L005c23)
	DOS	_PRINT
	addq.l	#4,sp
	pea.l	(-$0102,a6)
	DOS	_GETS
	addq.l	#4,sp
	bsr.w	L001b4c
	lea.l	(-$0101,a6),a0
	tst.b	(a0)+
	beq.s	L004734
L004722:
	bsr.w	L00259a
	tst.l	d0
	bmi.s	L0046e2
	move.l	d0,-(sp)
	DOS	_SETTIM2
	addq.l	#4,sp
	tst.l	d0
	bmi.s	L0046e2
L004734:
	clr.l	d0
	unlk	a6
	rts

L00473a:
	link.w	a6,#-$0118
	cmpi.w	#$0001,(L006ec4)
	bhi.w	L00484a
	bne.w	L004818
	lea.l	(-$0118,a6),a0
	lea.l	(L005b78),a1
	bsr.w	L001c94
	lea.l	(L006fc9),a1
	tst.b	(a1)
	beq.w	L004818
	bsr.w	L001cb8
	movea.l	a0,a2
L00476e:
	move.b	(a0)+,d0
	beq.s	L004790
	cmp.b	#$20,d0			;' '
	beq.s	L00478c
	cmp.b	#$09,d0
	beq.s	L00478c
	cmp.b	#$2f,d0			;'/'
	bne.s	L00476e
	move.b	#$5c,(-$0001,a0)	;'\'
	bra.s	L00476e

L00478c:
	clr.b	(-$0001,a0)
L004790:
	movea.l	a2,a0
	clr.b	d1
L004794:
	move.b	(a0)+,d0
	beq.s	L0047b4
	cmp.b	#$80,d0
	bcs.s	L0047b0
	cmp.b	#$a0,d0
	bcs.s	L0047aa
	cmp.b	#$e0,d0
	bcs.s	L0047b0
L0047aa:
	move.b	(a0)+,d0
	beq.s	L0047b4
	bra.s	L004794

L0047b0:
	move.b	d0,d1
	bra.s	L004794

L0047b4:
	cmp.b	#$5c,d1			;'\'
	beq.s	L0047d8
	movea.l	a2,a0
	bsr.w	L001c86
	cmp.b	#$3a,d1			;':'
	beq.s	L0047d0
	adda.l	d0,a0
	move.b	#$5c,(a0)+		;'\'
	clr.b	(a0)
	bra.s	L0047d8

L0047d0:
	cmp.l	#$00000007,d0
	bne.s	L00484a
L0047d8:
	movea.l	a2,a0
	cmpi.b	#$3a,($0006,a0)		;':'
	bne.s	L0047f6
	move.b	($0005,a0),d0
	bsr.w	L001d3a
	sub.b	#$41,d0			;'A'
	bsr.w	L002754
	tst.l	d0
	bmi.s	L004842
L0047f6:
	movea.l	a2,a0
	DOS	_GETPDB
	movea.l	d0,a1
	movea.l	(a1),a1
	bsr.w	L001f2c
	tst.l	d0
	bne.s	L004866
	lea.l	(L005d01),a0
	bsr.w	L002044
	move.l	#$00000500,d0
	bra.s	L004868

L004818:
	DOS	_GETPDB
	movea.l	d0,a1
	movea.l	(a1),a1
	lea.l	(L005b78),a0
	bsr.w	L001ef2
	beq.s	L00485c
	tst.b	(a0)
	beq.s	L00485c
	pea.l	(L005b78)
	DOS	_PRINT
	move.l	a0,-(sp)
	DOS	_PRINT
	addq.l	#8,sp
	bsr.w	L001b4c
	bra.s	L004866

L004842:
	lea.l	(L005d9d),a0
	bra.s	L004850

L00484a:
	lea.l	(L005eb5),a0
L004850:
	bsr.w	L002044
	move.l	#$00000500,d0
	bra.s	L004868

L00485c:
	pea.l	(L0060ce)
	DOS	_PRINT
	addq.l	#4,sp
L004866:
	clr.l	d0
L004868:
	unlk	a6
	rts

L00486c:
	tst.b	(L006eb1)
	bne.s	L00488a
	bsr.w	L0027e6
	bsr.w	L002d9e
	move.l	(L0064b6),d0
	move.w	d0,-(sp)
	bsr.w	L000572
	DOS	_EXIT2

L00488a:
	lea.l	(L0061f2),a0
	bsr.w	L002044
	move.l	#$00000500,d0
	rts

L00489c:
	link.w	a6,#-$05ca
	clr.w	(-$05bc,a6)
	clr.w	(-$05c8,a6)
	clr.w	(-$05c2,a6)
	clr.w	(-$05c0,a6)
	clr.l	(-$05c6,a6)
	move.w	#$ffff,(-$05b4,a6)
	lea.l	(L0071e2),a0
L0048c0:
	tst.b	(a0)
	beq.s	L0048f8
	bsr.w	L001d4c
L0048c8:
	move.b	(a0)+,d0
	beq.s	L0048c0
	cmp.b	#$76,d0			;'v'
	beq.s	L0048e8
	cmp.b	#$62,d0			;'b'
	beq.s	L0048f0
	cmp.b	#$71,d0			;'q'
	bne.w	L004cb6
	move.b	#-$01,(-$05bc,a6)
	bra.s	L0048c8

L0048e8:
	move.b	#-$01,(-$05c8,a6)
	bra.s	L0048c8

L0048f0:
	move.b	#-$01,(-$05c2,a6)
	bra.s	L0048c8

L0048f8:
	tst.w	(L006ec4)
	beq.w	L004cb6
	cmpi.w	#$0002,(L006ec4)
	bhi.w	L004cb6
	lea.l	(-$0118,a6),a0
	lea.l	(L0070ca),a1
	bsr.w	L001c94
	movea.l	a1,a0
	bsr.w	L001c86
	adda.l	d0,a1
	addq.l	#1,a1
	lea.l	(-$0230,a6),a0
	bsr.w	L001c94
	lea.l	(-$0118,a6),a1
	lea.l	(-$0366,a6),a0
L004936:
	move.b	(a1)+,d0
L004938:
	move.b	d0,(a0)+
	beq.s	L004968
	cmp.b	#$e0,d0
	bcc.s	L004962
	cmp.b	#$a0,d0
	bcc.s	L004936
	cmp.b	#$80,d0
	bcc.s	L004962
	cmp.b	#$2b,d0			;'+'
	bne.s	L004936
	clr.b	(-$0001,a0)
L004958:
	move.b	(a1)+,d0
	cmp.b	#$2b,d0			;'+'
	beq.s	L004958
	bra.s	L004938

L004962:
	move.b	(a1)+,d0
	move.b	d0,(a0)+
	bne.s	L004936
L004968:
	clr.b	(a0)
	lea.l	(-$0366,a6),a0
	tst.b	(a0)
	beq.w	L004cb6
	bsr.w	L001c86
	adda.l	d0,a0
	addq.l	#1,a0
	tst.b	(a0)
	beq.s	L004986
	move.w	#$ffff,(-$05c0,a6)
L004986:
	lea.l	(-$0366,a6),a5
L00498a:
	lea.l	(-$0118,a6),a0
	movea.l	a5,a1
	bsr.w	L001c94
	movea.l	a5,a0
	bsr.w	L001c86
	adda.l	d0,a0
	addq.l	#1,a0
	movea.l	a0,a5
	lea.l	(-$0118,a6),a0
	bsr.w	L002a50
	move.w	#$ffff,(-$05be,a6)
	bsr.w	L002bc8
	tst.b	d0
	bne.s	L0049be
	clr.w	(-$05bc,a6)
	clr.w	(-$05be,a6)
L0049be:
	lea.l	(-$0118,a6),a0
	cmpi.b	#$3a,($0001,a0)		;':'
	bne.s	L0049de
	move.b	(a0),d0
	bsr.w	L001d3a
	sub.b	#$41,d0			;'A'
	bsr.w	L002754
	tst.l	d0
	bmi.w	L004cae
L0049de:
	movea.l	(L006eb6),a1
	bsr.w	L002be6
	cmp.l	#$ffffffff,d0
	beq.w	L004c92
	cmp.w	#$0578,d0
	bls.s	L004a02
	lea.l	(L00621b),a0
	bsr.w	L002044
L004a02:
	movea.l	(L006eb6),a1
L004a08:
	tst.b	(a1)
	beq.s	L004a1a
	btst.b	#$04,($0017,a1)
	beq.s	L004a32
	lea.l	($0020,a1),a1
	bra.s	L004a08

L004a1a:
	move.w	#$003f,-(sp)		;'?'
	pea.l	(-$0118,a6)
	pea.l	(-$0596,a6)
	DOS	_FILES
	lea.l	($000a,sp),sp
	tst.l	d0
	bpl.w	L004ca0
L004a32:
	lea.l	(-$0230,a6),a1
	lea.l	(-$0596,a6),a0
	bsr.w	L001c94
	movea.l	a0,a2
	movea.l	a1,a0
	movea.l	a2,a1
	lea.l	(-$0118,a6),a2
	tst.b	(a1)
	beq.s	L004a54
	cmpi.b	#$3a,($0001,a1)		;':'
	beq.s	L004a7a
L004a54:
	cmpi.b	#$3a,($0001,a2)		;':'
	bne.s	L004a8e
	DOS	_CURDRV
	add.b	#$41,d0			;'A'
	move.b	d0,(a0)+
	move.b	($0001,a2),(a0)+
	bsr.w	L001c94
	subq.l	#2,a0
	movea.l	a0,a2
	movea.l	a1,a0
	movea.l	a2,a1
	bsr.w	L001c94
	bra.s	L004a8e

L004a7a:
	move.b	(a1),d0
	bsr.w	L001d3a
	sub.b	#$41,d0			;'A'
	bsr.w	L002754
	tst.l	d0
	bmi.w	L004cae
L004a8e:
	lea.l	(-$0230,a6),a0
	bsr.w	L002a50
	bsr.w	L0028f6
	bsr.w	L00293a
	movea.l	a0,a1
	lea.l	(-$024e,a6),a0
	bsr.w	L001c94
	tst.w	(-$05c0,a6)
	bne.s	L004ac2
	tst.w	(-$05be,a6)
	beq.s	L004ac2
	bsr.w	L002bc8
	tst.b	d0
	bne.s	L004ac2
	move.w	#$ffff,(-$05c0,a6)
L004ac2:
	tst.w	(-$05c8,a6)
	beq.s	L004ad6
	DOS	_VERIFYG
	move.w	d0,(-$05ca,a6)
	move.w	#$0001,-(sp)
	DOS	_VERIFY
	addq.l	#2,sp
L004ad6:
	movea.l	(L006eb6),a0
	tst.b	(a0)
	bne.w	L004b78
	move.w	#$0015,d0
L004ae6:
	move.b	#$20,(a0)+		;' '
	dbra.w	d0,L004ae6
	clr.b	(a0)
	lea.l	(-$0118,a6),a0
	bsr.w	L0028f6
	movea.l	a0,a2
	movea.l	(L006eb6),a0
L004b00:
	move.b	(a2)+,d0
	beq.s	L004b20
	cmp.b	#$2e,d0			;'.'
	beq.s	L004b0e
	move.b	d0,(a0)+
	bra.s	L004b00

L004b0e:
	movea.l	(L006eb6),a0
	lea.l	($0013,a0),a0
L004b18:
	move.b	(a2)+,d0
	beq.s	L004b20
	move.b	d0,(a0)+
	bra.s	L004b18

L004b20:
	movea.l	(L006eb6),a0
	move.b	#$2e,($0012,a0)		;'.'
	clr.w	-(sp)
	move.l	a0,-(sp)
	DOS	_OPEN
	addq.l	#6,sp
	tst.l	d0
	bmi.w	L004ca0
	move.w	d0,-(sp)
	DOS	_CLOSE
	addq.l	#2,sp
	move.l	a0,-(sp)
	lea.l	(-$0118,a6),a0
	bsr.w	L0028f6
	movea.l	a1,a2
	movea.l	(sp)+,a1
	bsr.w	L001c94
	movea.l	a1,a0
	movea.l	a2,a1
	lea.l	(-$024e,a6),a2
	bsr.w	L0029c4
	pea.l	(-$0118,a6)
	DOS	_PRINT
	addq.l	#4,sp
	bsr.w	L001b4c
	bsr.w	L004d24
	tst.l	d0
	bne.w	L004c8c
	bra.w	L004c82

L004b78:
	tst.b	(a0)
	beq.w	L004c82
	btst.b	#$04,($0017,a0)
	bne.w	L004c7a
	cmpi.b	#$20,($0013,a0)		;' '
	beq.s	L004b96
	move.b	#$2e,($0012,a0)		;'.'
L004b96:
	move.l	a0,-(sp)
	lea.l	(-$0118,a6),a0
	bsr.w	L0028f6
	movea.l	a1,a2
	movea.l	(sp)+,a1
	bsr.w	L001c94
	movea.l	a1,a0
	movea.l	a2,a1
	lea.l	(-$024e,a6),a2
	bsr.w	L0029c4
	movem.l	a0-a1,-(sp)
	lea.l	(-$0118,a6),a1
	lea.l	(-$047e,a6),a0
	bsr.w	L001c94
	bsr.w	L001df0
	lea.l	(-$0230,a6),a1
	lea.l	(-$0596,a6),a0
	bsr.w	L001c94
	bsr.w	L001df0
	move.w	#$000a,-(sp)
	lea.l	(-$05b2,a6),a1
	move.l	a1,-(sp)
	bset.b	#$07,(sp)
	move.l	a0,-(sp)
	DOS	_FATCHK
	lea.l	($000a,sp),sp
	cmp.l	#$fffffff2,d0
	beq.s	L004bfa
	tst.l	d0
	bmi.s	L004c3a
L004bfa:
	move.w	#$000a,-(sp)
	lea.l	(-$05a4,a6),a0
	move.l	a0,-(sp)
	bset.b	#$07,(sp)
	pea.l	(-$047e,a6)
	DOS	_FATCHK
	lea.l	($000a,sp),sp
	cmp.l	#$fffffff2,d0
	beq.s	L004c1e
	tst.l	d0
	bmi.s	L004c3a
L004c1e:
	cmpm.w	(a0)+,(a1)+
	bne.s	L004c3a
	cmpm.l	(a0)+,(a1)+
	bne.s	L004c3a
	movem.l	(sp)+,a0-a1
	pea.l	(-$0118,a6)
	DOS	_PRINT
	addq.l	#4,sp
	bsr.w	L001b4c
	bra.w	L004cbe

L004c3a:
	movem.l	(sp)+,a0-a1
	tst.w	(-$05bc,a6)
	bne.s	L004c52
	pea.l	(-$0118,a6)
	DOS	_PRINT
	addq.l	#4,sp
	bsr.w	L001b4c
	bra.s	L004c72

L004c52:
	pea.l	(-$0118,a6)
	DOS	_PRINT
	addq.l	#4,sp
	move.l	a0,-(sp)
	lea.l	(L006361),a0
	bsr.w	L002148
	movea.l	(sp)+,a0
	bsr.w	L001b4c
	tst.w	d1
	beq.s	L004c7a
	bpl.s	L004c52
L004c72:
	bsr.w	L004d24
	tst.l	d0
	bne.s	L004c8c
L004c7a:
	lea.l	($0020,a0),a0
	bra.w	L004b78

L004c82:
	tst.b	(a5)
	bne.w	L00498a
	clr.l	d0
	bra.s	L004cce

L004c8c:
	bsr.w	L00047a
	bra.s	L004cce

L004c92:
	move.l	#$00000508,d0
	lea.l	(L006130),a0
	bra.s	L004cca

L004ca0:
	move.l	#$00000503,d0
	lea.l	(L005f51),a0
	bra.s	L004cca

L004cae:
	lea.l	(L005d9d),a0
	bra.s	L004cc4

L004cb6:
	lea.l	(L005eb5),a0
	bra.s	L004cc4

L004cbe:
	lea.l	(L005e03),a0
L004cc4:
	move.l	#$00000500,d0
L004cca:
	bsr.w	L002044
L004cce:
	move.l	d0,-(sp)
	tst.w	(-$05c0,a6)
	beq.s	L004ce6
	move.w	(-$05b4,a6),d0
	bmi.s	L004ce6
	addq.l	#1,(-$05c6,a6)
	move.w	d0,-(sp)
	DOS	_CLOSE
	addq.l	#2,sp
L004ce6:
	move.l	(-$05c6,a6),d0
	beq.s	L004d06
	lea.l	(-$024e,a6),a0
	bsr.w	L001b62
	move.l	a0,-(sp)
	DOS	_PRINT
	addq.l	#4,sp
	pea.l	(L0063c8)
	DOS	_PRINT
	addq.l	#4,sp
	bra.s	L004d10

L004d06:
	pea.l	(L0063ad)
	DOS	_PRINT
	addq.l	#4,sp
L004d10:
	tst.w	(-$05c8,a6)
	beq.s	L004d1e
	move.w	(-$05ca,a6),-(sp)
	DOS	_VERIFY
	addq.l	#2,sp
L004d1e:
	move.l	(sp)+,d0
	unlk	a6
	rts

L004d24:
	movem.l	d1-d4/a0,-(sp)
	move.w	#$ffff,(-$05b6,a6)
	tst.w	(-$05c0,a6)
	bne.s	L004d3a
	move.w	#$ffff,(-$05b4,a6)
L004d3a:
	move.l	(L006eba),-(sp)
	DOS	_MFREE
	addq.l	#4,sp
	tst.l	d0
	bmi.w	L004f8a
	move.l	#$00ffffff,-(sp)
	DOS	_MALLOC
	addq.l	#4,sp
	sub.l	#$81000000,d0
	move.l	d0,d1
	move.l	d0,-(sp)
	DOS	_MALLOC
	addq.l	#4,sp
	move.l	d0,(L006eba)
	tst.l	d0
	bmi.w	L004f8a
	move.l	d1,(-$05ba,a6)
	move.w	#$0000,-(sp)
	pea.l	(-$0118,a6)
	DOS	_OPEN
	addq.l	#6,sp
	tst.l	d0
	bmi.w	L004f8a
	move.w	d0,(-$05b6,a6)
	tst.w	(-$05b4,a6)
	bpl.s	L004dd2
	tst.w	(-$05c0,a6)
	bne.s	L004da4
	move.w	#$ffff,-(sp)
	pea.l	(-$0118,a6)
	DOS	_CHMOD
	addq.l	#6,sp
	tst.l	d0
	bpl.s	L004da8
L004da4:
	move.w	#$0020,d0		;' '
L004da8:
	move.w	d0,-(sp)
	pea.l	(-$0230,a6)
	DOS	_CREATE
	addq.l	#6,sp
	tst.l	d0
	bpl.s	L004dce
	move.l	d0,d1
	move.w	#$0001,-(sp)
	pea.l	(-$0230,a6)
	DOS	_OPEN
	addq.l	#6,sp
	tst.l	d0
	bpl.s	L004dce
	move.l	d1,d0
	bra.w	L004f8a

L004dce:
	move.w	d0,(-$05b4,a6)
L004dd2:
	clr.b	d2
	clr.b	d3
	clr.b	d4
	move.w	(-$05b4,a6),-(sp)
	clr.w	-(sp)
	DOS	_IOCTRL
	addq.l	#4,sp
	btst.l	#$07,d0
	beq.s	L004dfc
	move.b	#-$01,d4
	btst.l	#$05,d0
	bne.s	L004dfc
	btst.l	#$01,d0
	beq.s	L004dfc
	move.b	#-$01,d3
L004dfc:
	move.w	(-$05b6,a6),-(sp)
	clr.w	-(sp)
	DOS	_IOCTRL
	addq.l	#4,sp
	btst.l	#$07,d0
	beq.s	L004e1e
	btst.l	#$02,d0
	bne.w	L004ebe
	btst.l	#$05,d0
	bne.s	L004e1e
	move.b	#-$01,d2
L004e1e:
	move.l	(-$05ba,a6),-(sp)
	move.l	(L006eba),-(sp)
	move.w	(-$05b6,a6),-(sp)
	DOS	_READ
	lea.l	($000a,sp),sp
	tst.l	d0
	bmi.w	L004f8a
	beq.w	L004ebe
	move.l	d0,d1
	tst.b	d2
	beq.s	L004e5a
	movea.l	(L006eba),a0
	lea.l	(-$01,a0,d1.l),a0
	cmpi.b	#$1a,(a0)
	bne.s	L004e5a
	tst.b	d3
	beq.s	L004e9c
	subq.l	#1,d1
	bra.s	L004e9c

L004e5a:
	tst.b	d3
	beq.s	L004e7a
	movea.l	(L006eba),a0
	clr.l	d0
L004e66:
	tst.l	d1
	beq.s	L004e76
	cmpi.b	#$1a,(a0)+
	beq.s	L004e9a
	addq.l	#1,d0
	subq.l	#1,d1
	bra.s	L004e66

L004e76:
	move.l	d0,d1
	beq.s	L004ebe
L004e7a:
	move.l	d1,-(sp)
	move.l	(L006eba),-(sp)
	move.w	(-$05b4,a6),-(sp)
	DOS	_WRITE
	lea.l	($000a,sp),sp
	tst.l	d0
	bmi.w	L004f8a
	cmp.l	d1,d0
	blt.w	L004f64
	bra.s	L004e1e

L004e9a:
	move.l	d0,d1
L004e9c:
	tst.l	d1
	beq.s	L004ebe
	move.l	d1,-(sp)
	move.l	(L006eba),-(sp)
	move.w	(-$05b4,a6),-(sp)
	DOS	_WRITE
	lea.l	($000a,sp),sp
	tst.l	d0
	bmi.w	L004f8a
	cmp.l	d1,d0
	blt.w	L004f64
L004ebe:
	tst.b	d4
	bne.s	L004f16
	tst.w	(-$05c0,a6)
	beq.s	L004f16
	tst.w	(-$05c2,a6)
	bne.s	L004f16
L004ece:
	move.w	#$0001,-(sp)
	move.l	#$ffffffff,-(sp)
	move.w	(-$05b4,a6),-(sp)
	DOS	_SEEK
	addq.l	#8,sp
	tst.l	d0
	bmi.s	L004f16
	movea.l	(L006eba),a0
	move.l	#$00000001,-(sp)
	move.l	a0,-(sp)
	move.w	(-$05b4,a6),-(sp)
	DOS	_READ
	lea.l	($000a,sp),sp
	cmpi.b	#$1a,(a0)
	bne.s	L004f16
	move.w	#$0001,-(sp)
	move.l	#$ffffffff,-(sp)
	move.w	(-$05b4,a6),-(sp)
	DOS	_SEEK
	addq.l	#8,sp
	bra.s	L004ece

L004f16:
	move.w	(-$05b4,a6),-(sp)
	clr.w	-(sp)
	DOS	_IOCTRL
	addq.l	#4,sp
	btst.l	#$07,d0
	bne.s	L004f60
	move.w	(-$05b6,a6),-(sp)
	clr.w	-(sp)
	DOS	_IOCTRL
	addq.l	#4,sp
	btst.l	#$07,d0
	bne.s	L004f60
	clr.l	-(sp)
	move.w	(-$05b6,a6),-(sp)
	DOS	_FILEDATE
	addq.l	#6,sp
	cmp.l	#$ffff0000,d0
	bcc.s	L004f8a
	tst.w	(-$05c0,a6)
	bne.s	L004f60
	move.l	d0,-(sp)
	move.w	(-$05b4,a6),-(sp)
	DOS	_FILEDATE
	addq.l	#6,sp
	cmp.l	#$ffff0000,d0
	bcc.s	L004f8a
L004f60:
	clr.l	d0
	bra.s	L004f8e

L004f64:
	move.w	(-$05b4,a6),-(sp)
	DOS	_CLOSE
	addq.l	#2,sp
	tst.l	d0
	bmi.s	L004f8a
	pea.l	(-$0230,a6)
	DOS	_DELETE
	addq.l	#4,sp
	tst.l	d0
	bmi.s	L004f8a
	move.w	#$ffff,(-$05b4,a6)
	move.l	#$00000505,d0
	bra.s	L004f8e

L004f8a:
	bsr.w	L002ccc
L004f8e:
	move.l	d0,-(sp)
	move.l	(L006eba),d0
	bmi.s	L004f9e
	move.l	d0,-(sp)
	DOS	_MFREE
	addq.l	#4,sp
L004f9e:
	move.l	#$00000400,-(sp)
	bsr.w	L002e1c
	addq.l	#4,sp
	move.l	d0,(L006eba)
	move.w	(-$05b6,a6),d0
	bmi.s	L004fbc
	move.w	d0,-(sp)
	DOS	_CLOSE
	addq.l	#2,sp
L004fbc:
	tst.w	(-$05c0,a6)
	bne.s	L004fd8
	move.w	(-$05b4,a6),d0
	bmi.s	L004fd8
	move.w	d0,-(sp)
	addq.l	#1,(-$05c6,a6)
	DOS	_CLOSE
	addq.l	#2,sp
	move.w	#$ffff,(-$05b4,a6)
L004fd8:
	move.l	(sp)+,d0
	movem.l	(sp)+,d1-d4/a0
	rts

L004fe0:
	link.w	a6,#-$015a
	tst.w	(L006ec4)
	beq.w	L00520c
	move.l	#$00000400,(-$0006,a6)
	clr.w	(-$0002,a6)
	cmpi.w	#$0001,(L006ec4)
	beq.s	L00500a
	move.w	#$ffff,(-$0002,a6)
L00500a:
	lea.l	(L0070ca),a1
	tst.b	(a1)
	beq.w	L0051f8
	lea.l	(-$015a,a6),a0
	bsr.w	L001c94
	lea.l	(L0070ca),a0
	move.w	#$0001,d0
	bsr.w	L00209e
	movea.l	a0,a1
	lea.l	(L0070ca),a0
	bsr.w	L00207e
	lea.l	(-$015a,a6),a0
	cmpi.b	#$3a,($0001,a0)		;':'
	bne.s	L005058
	move.b	(a0),d0
	bsr.w	L001d3a
	sub.b	#$41,d0			;'A'
	bsr.w	L002754
	tst.l	d0
	bmi.w	L00521a
L005058:
	bsr.w	L002a50
	movea.l	(L006eb6),a1
	bsr.w	L002be6
	cmp.l	#$ffffffff,d0
	beq.w	L005228
	cmp.w	#$0578,d0
	bls.s	L005080
	lea.l	(L00621b),a0
	bsr.w	L002044
L005080:
	tst.w	(-$0002,a6)
	bne.s	L005098
	lea.l	(-$015a,a6),a0
	bsr.w	L002bc8
	tst.b	d0
	beq.s	L005098
	move.w	#$ffff,(-$0002,a6)
L005098:
	clr.b	d4
	movea.l	(L006eb6),a2
	tst.b	(a2)
	beq.s	L0050c6
L0050a4:
	tst.b	(a2)
	beq.w	L0051f0
	move.b	($0017,a2),d0
	and.b	#$1e,d0
	bne.w	L0051e6
	cmpi.b	#$20,($0013,a2)		;' '
	beq.s	L00512e
	move.b	#$2e,($0012,a2)		;'.'
	bra.s	L00512e

L0050c6:
	move.w	#$003f,-(sp)		;'?'
	pea.l	(-$015a,a6)
	pea.l	(-$0042,a6)
	DOS	_FILES
	lea.l	($000a,sp),sp
	tst.l	d0
	bpl.w	L0051f0
	clr.b	($0020,a2)
	move.w	#$0015,d0
L0050e6:
	move.b	#$20,(a2)+		;' '
	dbra.w	d0,L0050e6
	clr.b	(a2)
	lea.l	(-$015a,a6),a0
	bsr.w	L0028f6
	movea.l	a0,a3
	movea.l	(L006eb6),a0
L005100:
	move.b	(a3)+,d0
	beq.s	L005122
	cmp.b	#$2e,d0			;'.'
	beq.s	L00510e
	move.b	d0,(a0)+
	bra.s	L005100

L00510e:
	movea.l	(L006eb6),a0
	adda.l	#$00000013,a0
L00511a:
	move.b	(a3)+,d0
	beq.s	L005122
	move.b	d0,(a0)+
	bra.s	L00511a

L005122:
	movea.l	(L006eb6),a2
	move.b	#$2e,($0012,a2)		;'.'
L00512e:
	lea.l	(-$015a,a6),a0
	bsr.w	L0028f6
	movea.l	a2,a1
	bsr.w	L001c94
	tst.w	(-$0002,a6)
	beq.s	L005154
	lea.l	(-$015a,a6),a0
	bsr.w	L002044
	lea.l	(L005bcf),a0
	bsr.w	L002044
L005154:
	move.b	#-$01,d4
	clr.w	-(sp)
	pea.l	(-$015a,a6)
	DOS	_OPEN
	addq.l	#6,sp
	tst.l	d0
	bmi.w	L005236
	move.w	d0,d1
	movea.l	(L006eba),a0
L005170:
	move.l	(-$0006,a6),-(sp)
	move.l	a0,-(sp)
	move.w	d1,-(sp)
	DOS	_READ
	lea.l	($000a,sp),sp
	tst.l	d0
	bmi.s	L0051d6
	beq.s	L0051d6
	clr.l	d3
	move.l	d0,d2
	movea.l	a0,a1
	subq.l	#1,d2
	swap.w	d2
L00518e:
	swap.w	d2
L005190:
	cmpi.b	#$1a,(a1)+
	beq.s	L0051bc
	addq.l	#1,d3
	dbra.w	d2,L005190
	swap.w	d2
	dbra.w	d2,L00518e
	move.l	d3,-(sp)
	move.l	a0,-(sp)
	move.w	#$0001,-(sp)
	DOS	_WRITE
	lea.l	($000a,sp),sp
	tst.l	d0
	bmi.w	L005248
	cmp.l	d3,d0
	blt.s	L0051fe
	bra.s	L005170

L0051bc:
	tst.l	d3
	beq.s	L0051d6
	move.l	d3,-(sp)
	move.l	a0,-(sp)
	move.w	#$0001,-(sp)
	DOS	_WRITE
	lea.l	($000a,sp),sp
	tst.l	d0
	bmi.s	L005248
	cmp.l	d3,d0
	blt.s	L0051fe
L0051d6:
	move.w	d1,-(sp)
	DOS	_CLOSE
	addq.l	#2,sp
	lea.l	(L005bcf),a0
	bsr.w	L002044
L0051e6:
	adda.l	#$00000020,a2
	bra.w	L0050a4

L0051f0:
	tst.b	d4
	beq.s	L005236
	bra.w	L00500a

L0051f8:
	clr.l	d0
L0051fa:
	unlk	a6
	rts

L0051fe:
	lea.l	(L005ecc),a0
	move.l	#$00000505,d0
	bra.s	L005242

L00520c:
	lea.l	(L005eb5),a0
	move.l	#$00000500,d0
	bra.s	L005242

L00521a:
	lea.l	(L005d9d),a0
	move.l	#$00000500,d0
	bra.s	L005242

L005228:
	move.l	#$00000508,d0
	lea.l	(L006130),a0
	bra.s	L005242

L005236:
	lea.l	(L005fb1),a0
	move.l	#$00000503,d0
L005242:
	bsr.w	L002044
	bra.s	L0051fa

L005248:
	bsr.w	L002ccc
	bsr.w	L00047a
	bra.s	L0051fa

L005252:
	link.w	a6,#-$0118
	cmpi.w	#$0001,(L006ec4)
	bne.s	L0052d4
	lea.l	(L0070ca),a1
	lea.l	(-$0118,a6),a0
	bsr.w	L001c94
	bsr.w	L001d4c
	lea.l	(L005b51),a1
	bsr.w	L001ccc
	tst.l	d0
	beq.s	L0052b0
	lea.l	(L005b55),a1
	bsr.w	L001ccc
	tst.l	d0
	bne.s	L0052e6
	clr.w	-(sp)
	move.w	#$0003,-(sp)
	DOS	_DUP0
	move.w	#$0001,-(sp)
	move.w	#$0003,-(sp)
	DOS	_DUP0
	move.w	#$0002,-(sp)
	move.w	#$0003,-(sp)
	DOS	_DUP0
	lea.l	($000c,sp),sp
	bra.s	L0052ce

L0052b0:
	clr.w	-(sp)
	clr.w	-(sp)
	DOS	_DUP0
	move.w	#$0001,-(sp)
	move.w	#$0001,-(sp)
	DOS	_DUP0
	move.w	#$0002,-(sp)
	move.w	#$0002,-(sp)
	DOS	_DUP0
	lea.l	($000c,sp),sp
L0052ce:
	clr.l	d0
L0052d0:
	unlk	a6
	rts

L0052d4:
	lea.l	(L005eb5),a0
	bsr.w	L002044
	move.l	#$00000500,d0
	bra.s	L0052d0

L0052e6:
	lea.l	(L005db4),a0
	bsr.w	L002044
	move.l	#$00000500,d0
	bra.s	L0052d0

L0052f8:
	tst.w	(L006ec4)
	beq.s	L005356
	cmpi.w	#$0001,(L006ec4)
	bne.w	L00539a
	lea.l	(L0070ca),a0
	bsr.w	L001d4c
	lea.l	(L005b52),a1
	move.w	#$0001,d1
	bsr.w	L001ccc
	tst.l	d0
	beq.s	L00534a
	lea.l	(L005b4d),a1
L00532e:
	clr.w	d1
L005330:
	bsr.w	L001ccc
	tst.l	d0
	beq.s	L00534a
	lea.l	(L005b48),a1
	move.w	#$0002,d1
	bsr.w	L001ccc
	tst.l	d0
	bne.s	L00539a
L00534a:
	move.w	d1,-(sp)
	DOS	_BREAKCK
	addq.l	#2,sp
	tst.l	d0
	bmi.s	L00539a
	bra.s	L005396

L005356:
	pea.l	(L005c03)
	DOS	_PRINT
	addq.l	#4,sp
	move.w	#$ffff,-(sp)
	DOS	_BREAKCK
	addq.l	#2,sp
	lea.l	(L005b4d),a0
	tst.l	d0
	beq.s	L005386
	lea.l	(L005b52),a0
	cmp.l	#$00000001,d0
	beq.s	L005386
	lea.l	(L005b48),a0
L005386:
	move.l	a0,-(sp)
	DOS	_PRINT
	addq.l	#4,sp
	pea.l	(L005c1a)
	DOS	_PRINT
	addq.l	#4,sp
L005396:
	clr.l	d0
	rts

L00539a:
	lea.l	(L005eb5),a0
	bsr.w	L002044
	move.l	#$00000500,d0
	rts

L0053ac:
	link.w	a6,#-$0118
	lea.l	(-$0118,a6),a0
	lea.l	(L005b70),a1
	bsr.w	L001c94
	lea.l	(L006fc9),a1
	bsr.w	L001cb8
	DOS	_GETPDB
	movea.l	d0,a1
	movea.l	(a1),a1
	bsr.w	L001f2c
	tst.l	d0
	bne.s	L0053e8
	lea.l	(L005d01),a0
	bsr.w	L002044
	move.l	#$00000500,d0
	bra.s	L0053ea

L0053e8:
	clr.l	d0
L0053ea:
	unlk	a6
	rts

L0053ee:
	link.w	a6,#-$000c
	clr.l	d1
	clr.l	d2
	bsr.w	L0004a2
	clr.l	-(sp)
L0053fc:
	move.l	#$00ffffff,-(sp)
	DOS	_MALLOC
	addq.l	#4,sp
	sub.l	#$81000000,d0
	cmp.l	#$01000000,d0
	bcc.s	L00542c
	move.l	d0,d3
	move.l	d0,-(sp)
	DOS	_MALLOC
	addq.l	#4,sp
	tst.l	d0
	bmi.s	L0053fc
	add.l	d3,d1
	cmp.l	d3,d2
	bcc.s	L005428
	move.l	d3,d2
L005428:
	move.l	d0,-(sp)
	bra.s	L0053fc

L00542c:
	clr.l	d3
L00542e:
	move.l	(sp)+,d0
	beq.s	L005440
	move.l	d0,-(sp)
	DOS	_MFREE
	addq.l	#4,sp
	tst.l	d0
	bpl.s	L00542e
	moveq.l	#$ff,d3
	bra.s	L00542e

L005440:
	tst.l	d3
	bne.s	L005486
	move.l	d2,d0
	lea.l	(-$000c,a6),a0
	bsr.w	L001b62
	pea.l	(a0)
	DOS	_PRINT
	addq.l	#4,sp
	pea.l	(L006254)
	DOS	_PRINT
	addq.l	#4,sp
	cmp.l	d1,d2
	beq.s	L00547c
	move.l	d1,d0
	lea.l	(-$000c,a6),a0
	bsr.w	L001b62
	pea.l	(a0)
	DOS	_PRINT
	addq.l	#4,sp
	pea.l	(L006271)
	DOS	_PRINT
	addq.l	#4,sp
L00547c:
	bsr.w	L0004ee
	clr.l	d0
	unlk	a6
	rts

L005486:
	pea.l	(L005ca8)
	DOS	_PRINT
	addq.l	#4,sp
	bra.s	L00547c

L005492:
	link.w	a6,#-$0118
	moveq.l	#$ff,d3
	move.l	d3,d4
	move.l	d3,d5
	lea.l	(L0070ca),a1
	lea.l	(-$0118,a6),a0
L0054a6:
	move.b	(a1),d0
	beq.s	L0054cc
L0054aa:
	move.b	(a1)+,(a0)+
	bne.s	L0054aa
	cmpi.b	#$2c,(-$0002,a1)	;','
	beq.s	L0054c8
	tst.b	(a1)
	beq.s	L0054cc
	cmpi.b	#$2c,(a1)		;','
	beq.s	L0054c8
	move.b	#$2c,(-$0001,a0)	;','
	bra.s	L0054a6

L0054c8:
	subq.l	#1,a0
	bra.s	L0054a6

L0054cc:
	clr.b	(a0)
	lea.l	(-$0118,a6),a0
	tst.b	(a0)
	beq.w	L005678
	cmpi.b	#$2c,(a0)+		;','
	beq.s	L00550e
	subq.l	#1,a0
	bsr.w	L001bea
	bsr.w	L0027c8
	cmp.l	#$00000001,d1
	bne.w	L0056a6
	cmp.l	#$00000001,d0
	bhi.w	L0056a6
	move.l	d0,d3
	tst.b	(-$0001,a0)
	beq.s	L005572
	cmpi.b	#$2c,(-$0001,a0)	;','
	bne.w	L0056a6
L00550e:
	tst.b	(a0)
	beq.s	L005572
	cmpi.b	#$2c,(a0)+		;','
	beq.s	L005548
	subq.l	#1,a0
	bsr.w	L001bea
	bsr.w	L0027c8
	cmp.l	#$00000001,d1
	bne.w	L0056a6
	cmp.l	#$00000003,d0
	bhi.w	L0056a6
	move.l	d0,d4
	tst.b	(-$0001,a0)
	beq.s	L005572
	cmpi.b	#$2c,(-$0001,a0)	;','
	bne.w	L0056a6
L005548:
	tst.b	(a0)
	beq.s	L005572
	bsr.w	L001bea
	bsr.w	L0027c8
	cmp.l	#$00000001,d1
	bne.w	L0056a6
	cmp.l	#$00000003,d0
	bhi.w	L0056a6
	move.l	d0,d5
	tst.b	(-$0001,a0)
	bne.w	L0056a6
L005572:
	move.w	#$ffff,d1
	cmp.l	#$ffffffff,d3
	beq.s	L0055ac
	cmp.l	#$ffffffff,d4
	bne.s	L0055d4
	move.w	#$ffff,-(sp)
	move.w	#$0010,-(sp)
	DOS	_CONCTRL
	addq.l	#4,sp
	move.l	d0,d4
	cmp.l	#$00000002,d4
	bcs.s	L0055d4
	tst.l	d3
	beq.s	L0055a4
	subq.l	#2,d4
	bra.s	L0055d4

L0055a4:
	subq.l	#2,d4
	beq.s	L0055d4
	moveq.l	#$01,d4
	bra.s	L0055d4

L0055ac:
	cmp.l	#$ffffffff,d4
	beq.s	L0055ec
	move.w	#$ffff,-(sp)
	move.w	#$0010,-(sp)
	DOS	_CONCTRL
	addq.l	#4,sp
	moveq.l	#$01,d3
	cmp.b	#$02,d0
	bcc.s	L0055d4
	clr.l	d3
	cmp.l	#$00000001,d4
	bhi.w	L0056a6
L0055d4:
	move.w	#$0002,d1
	tst.l	d3
	bne.s	L0055ea
	clr.w	d1
	cmp.l	#$00000001,d4
	bhi.w	L0056a6
	moveq.l	#$01,d4
L0055ea:
	add.w	d4,d1
L0055ec:
	cmp.w	#$ffff,d5
	beq.s	L00562e
	cmp.w	#$ffff,d1
	beq.s	L005616
	cmp.w	#$0001,d1
	beq.s	L00562e
	cmp.w	#$0002,d1
	bhi.s	L00562e
L005604:
	cmp.w	#$0001,d5
	beq.w	L0056a6
	cmp.w	#$0003,d5
	beq.w	L0056a6
	bra.s	L00562e

L005616:
	move.w	#$ffff,-(sp)
	move.w	#$0010,-(sp)
	DOS	_CONCTRL
	addq.l	#4,sp
	cmp.w	#$0001,d0
	beq.s	L00562e
	cmp.w	#$0003,d0
	bcs.s	L005604
L00562e:
	cmp.w	#$ffff,d1
	beq.s	L00563e
	move.w	d1,-(sp)
	move.w	#$0010,-(sp)
	DOS	_CONCTRL
	addq.l	#4,sp
L00563e:
	cmp.w	#$ffff,d5
	beq.s	L0056a0
	move.l	#$00000093,d0
	move.w	#$ffff,d1
	trap	#15
	and.w	#$ffa0,d0
	bset.l	#$05,d0
	btst.l	#$00,d5
	beq.s	L005662
	or.w	#$001f,d0
L005662:
	btst.l	#$01,d5
	beq.s	L00566c
	bset.l	#$06,d0
L00566c:
	move.w	d0,d1
	move.l	#$00000093,d0
	trap	#15
	bra.s	L0056a0

L005678:
	clr.w	-(sp)
	move.w	#$0010,-(sp)
	DOS	_CONCTRL
	addq.l	#4,sp
	move.l	#$00000093,d0
	move.w	#$ffff,d1
	trap	#15
	and.w	#$ffa0,d0
	bset.l	#$05,d0
	move.w	d0,d1
	move.l	#$00000093,d0
	trap	#15
L0056a0:
	clr.l	d0
L0056a2:
	unlk	a6
	rts

L0056a6:
	lea.l	(L005eb5),a0
	bsr.w	L002044
	move.l	#$00000500,d0
	bra.s	L0056a2

L0056b8:
	tst.w	(L006ec4)
	beq.s	L0056fe
	cmpi.w	#$0001,(L006ec4)
	bne.s	L00572e
	lea.l	(L0070ca),a0
	bsr.w	L001d4c
	lea.l	(L005b52),a1
	move.w	#$0001,d1
	bsr.w	L001ccc
	tst.l	d0
	beq.s	L0056f6
	lea.l	(L005b4d),a1
	bsr.w	L001ccc
	tst.l	d0
	bne.s	L00572e
	clr.w	d1
L0056f6:
	move.w	d1,-(sp)
	DOS	_VERIFY
	addq.l	#2,sp
	bra.s	L00572a

L0056fe:
	pea.l	(L005c0e)
	DOS	_PRINT
	addq.l	#4,sp
	DOS	_VERIFYG
	lea.l	(L005b4d),a0
	tst.l	d0
	beq.s	L00571a
	lea.l	(L005b52),a0
L00571a:
	move.l	a0,-(sp)
	DOS	_PRINT
	addq.l	#4,sp
	pea.l	(L005c1a)
	DOS	_PRINT
	addq.l	#4,sp
L00572a:
	clr.l	d0
	rts

L00572e:
	lea.l	(L005eb5),a0
	bsr.w	L002044
	move.l	#$00000500,d0
	rts

L005740:
	link.w	a6,#-$010e
	clr.w	(-$000e,a6)
	lea.l	(L0071e2),a0
L00574e:
	tst.b	(a0)
	beq.s	L00576a
	bsr.w	L001d4c
L005756:
	move.b	(a0)+,d0
	beq.s	L00574e
	cmp.b	#$62,d0			;'b'
	bne.w	L00589a
	move.b	#-$01,(-$000e,a6)
	bra.s	L005756

L00576a:
	move.w	#$ffff,d3
	clr.w	d4
	lea.l	(L0070ca),a1
	lea.l	(-$010e,a6),a0
L00577a:
	move.b	(a1),d0
	beq.s	L0057a0
L00577e:
	move.b	(a1)+,(a0)+
	bne.s	L00577e
	cmpi.b	#$2c,(-$0002,a1)	;','
	beq.s	L00579c
	tst.b	(a1)
	beq.s	L0057a0
	cmpi.b	#$2c,(a1)		;','
	beq.s	L00579c
	move.b	#$2c,(-$0001,a0)	;','
	bra.s	L00577a

L00579c:
	subq.l	#1,a0
	bra.s	L00577a

L0057a0:
	clr.b	(a0)
	lea.l	(-$010e,a6),a0
	tst.b	(a0)
	beq.s	L00581a
	cmpi.b	#$2c,(a0)+		;','
	beq.s	L0057e6
	subq.l	#1,a0
	bsr.w	L001bea
	bsr.w	L0027c8
	tst.l	d1
	beq.w	L00589a
	cmp.l	#$00000005,d1
	bhi.w	L00589a
	cmp.l	#$00010000,d0
	bcc.w	L00589a
	move.w	d0,d3
	tst.b	(-$0001,a0)
	beq.s	L005818
	cmpi.b	#$2c,(-$0001,a0)	;','
	bne.w	L00589a
L0057e6:
	tst.b	(a0)
	beq.s	L00581a
	bsr.w	L001bea
	bsr.w	L0027c8
	tst.l	d1
	beq.w	L00589a
	cmp.l	#$00000005,d1
	bhi.w	L00589a
	cmp.l	#$00010000,d0
	bcc.w	L00589a
	move.w	d0,d4
	tst.b	(-$0001,a0)
	bne.w	L00589a
	bra.s	L00581a

L005818:
	move.w	d3,d4
L00581a:
	cmp.w	d3,d4
	bcs.s	L005824
	move.w	d3,-(sp)
	move.w	d4,d3
	move.w	(sp)+,d4
L005824:
	clr.l	d1
	movea.l	(L0064a6),a0
	addq.l	#4,a0
L00582e:
	tst.b	(a0)
	beq.s	L00583e
	move.w	#$0001,d0
	bsr.w	L00209e
	addq.l	#1,d1
	bra.s	L00582e

L00583e:
	movea.l	(L0064a6),a1
	addq.l	#4,a1
L005846:
	tst.l	d1
	beq.s	L0058ac
	subq.l	#1,d1
	cmp.w	d3,d1
	bhi.s	L00588c
	cmp.w	d4,d1
	bcs.s	L00588c
	tst.w	(-$000e,a6)
	bne.s	L005882
	move.l	d1,d0
	lea.l	(-$000c,a6),a0
	bsr.w	L001b70
	addq.l	#5,a0
	move.l	a0,-(sp)
	DOS	_PRINT
	move.w	#$003a,-(sp)		;':'
	DOS	_PUTCHAR
	addq.l	#6,sp
	move.l	a0,-(sp)
	movea.l	a1,a0
	bsr.w	L001ff4
	movea.l	(sp)+,a0
	bsr.w	L001b4c
	bra.s	L00588c

L005882:
	move.l	a1,-(sp)
	DOS	_PRINT
	addq.l	#4,sp
	bsr.w	L001b4c
L00588c:
	move.w	#$0001,d0
	movea.l	a1,a0
	bsr.w	L00209e
	movea.l	a0,a1
	bra.s	L005846

L00589a:
	lea.l	(L005eb5),a0
	bsr.w	L002044
	move.l	#$00000500,d0
	bra.s	L0058ae

L0058ac:
	clr.l	d0
L0058ae:
	unlk	a6
	rts


	.data

L0058b2:
	.dc.b	'exit',$00,$00,$00,$00
L0058ba:
	.dc.l	L00486c
L0058be:
	.dc.b	'cls',$00,$00,$00,$00,$00
L0058c6:
	.dc.l	L003d08
L0058ca:
	.dc.b	'dir',$00,$00,$00,$00,$00
L0058d2:
	.dc.l	L003824
L0058d6:
	.dc.b	'copy',$00,$00,$00,$00
L0058de:
	.dc.l	L00489c
L0058e2:
	.dc.b	'del',$00,$00,$00,$00,$00
L0058ea:
	.dc.l	L00364a
L0058ee:
	.dc.b	'erase',$00,$00,$00
L0058f6:
	.dc.l	L00364a
L0058fa:
	.dc.b	'ren',$00,$00,$00,$00,$00
L005902:
	.dc.l	L003d16
L005906:
	.dc.b	'rename',$00,$00
L00590e:
	.dc.l	L003d16
L005912:
	.dc.b	'cd',$00,$00,$00,$00,$00,$00
L00591a:
	.dc.l	L002f76
L00591e:
	.dc.b	'chdir',$00,$00,$00
L005926:
	.dc.l	L002f76
L00592a:
	.dc.b	'md',$00,$00,$00,$00,$00,$00
L005932:
	.dc.l	L003516
L005936:
	.dc.b	'mkdir',$00,$00,$00
L00593e:
	.dc.l	L003516
L005942:
	.dc.b	'rd',$00,$00,$00,$00,$00,$00
L00594a:
	.dc.l	L0035b0
L00594e:
	.dc.b	'rmdir',$00,$00,$00
L005956:
	.dc.l	L0035b0
L00595a:
	.dc.b	'type',$00,$00,$00,$00
L005962:
	.dc.l	L004fe0
L005966:
	.dc.b	'ver',$00,$00,$00,$00,$00
L00596e:
	.dc.l	L0040ea
L005972:
	.dc.b	'date',$00,$00,$00,$00
L00597a:
	.dc.l	L0044fe
L00597e:
	.dc.b	'time',$00,$00,$00,$00
L005986:
	.dc.l	L00467c
L00598a:
	.dc.b	'his',$00,$00,$00,$00,$00
L005992:
	.dc.l	L005740
L005996:
	.dc.b	'set',$00,$00,$00,$00,$00
L00599e:
	.dc.l	L004062
L0059a2:
	.dc.b	'path',$00,$00,$00,$00
L0059aa:
	.dc.l	L0045bc
L0059ae:
	.dc.b	'prompt',$00,$00
L0059b6:
	.dc.l	L0053ac
L0059ba:
	.dc.b	'vol',$00,$00,$00,$00,$00
L0059c2:
	.dc.l	L0040fe
L0059c6:
	.dc.b	'break',$00,$00,$00
L0059ce:
	.dc.l	L0052f8
L0059d2:
	.dc.b	'verify',$00,$00
L0059da:
	.dc.l	L0056b8
L0059de:
	.dc.b	'ctty',$00,$00,$00,$00
L0059e6:
	.dc.l	L005252
L0059ea:
	.dc.b	'screen',$00,$00
L0059f2:
	.dc.l	L005492
L0059f6:
	.dc.b	'temp',$00,$00,$00,$00
L0059fe:
	.dc.l	L00473a
L005a02:
	.dc.b	'memfree',$00
L005a0a:
	.dc.l	L0053ee
L005a0e:
	.dc.b	'rem',$00,$00,$00,$00,$00
L005a16:
	.dc.l	L0030ba
L005a1a:
	.dc.b	'echo',$00,$00,$00,$00
L005a22:
	.dc.l	L003026
L005a26:
	.dc.b	'pause',$00,$00,$00
L005a2e:
	.dc.l	L0030be
L005a32:
	.dc.b	'goto',$00,$00,$00,$00
L005a3a:
	.dc.l	L0030d8
L005a3e:
	.dc.b	'shift',$00,$00,$00
L005a46:
	.dc.l	L00318a
L005a4a:
	.dc.b	'if',$00,$00,$00,$00,$00,$00
L005a52:
	.dc.l	L0031b8
L005a56:
	.dc.b	'for',$00,$00,$00,$00,$00
L005a5e:
	.dc.l	L003368
	.dc.b	$00,$00
Table2:
	.dc.l	L005eb5
	.dc.l	L005ee5
	.dc.l	L005f15
	.dc.l	L005fb1
	.dc.l	L005f93
	.dc.l	L005ecc
	.dc.l	L006189
	.dc.l	L005ca8
	.dc.l	L0060b7
	.dc.l	L005f74
	.dc.l	L006193
	.dc.l	L005cec
	.dc.l	L005f02
	.dc.l	L005f30
	.dc.l	L00607b
	.dc.l	L0061db
	.dc.l	L005e94
	.dc.l	L0061cd
	.dc.l	L005d86
	.dc.l	L005d9d
	.dc.l	L0063e8
	.dc.l	L006403
	.dc.l	L00641c
	.dc.l	L006437
	.dc.l	L006454
	.dc.l	L006479
L005acc:
	.dc.b	$3b,$9a,$ca,$00,$05,$f5,$e1,$00
	.dc.b	$00,$98,$96,$80,$00,$0f,$42,$40
	.dc.b	$00,$01,$86,$a0,$00,$00,$27,$10
	.dc.b	$00,$00,$03,$e8,$00,$00,$00,$64
	.dc.b	$00,$00,$00,$0a,$00,$00,$00,$01
	.dc.b	$00,$00,$00,$00
L005af8:
	.dc.b	$11,$11,$03,$08,$09,$0a,$0a,$07
	.dc.b	$0b,$07,$11,$11,$0a,$12,$11,$13
	.dc.b	$08,$06,$03,$0c,$10,$10,$10,$05
	.dc.b	$04,$0a,$11,$16,$14,$16,$0f,$0f
	.dc.b	$17,$18,$19,$0f,$0f,$0f,$0f,$0f
L005b20:
	.dc.b	'日月火水木金土？'
L005b30:
	.dc.b	'r',$00
	.dc.b	'z',$00
	.dc.b	'x',$00
L005b36:
	.dc.b	'bat',$00,$00
L005b3b:
	.dc.b	'AUTOEXEC.BAT',$00
L005b48:
	.dc.b	'kill',$00
L005b4d:
	.dc.b	'off',$00
L005b51:
	.dc.b	'c'
L005b52:
	.dc.b	'on',$00
L005b55:
	.dc.b	'aux',$00
L005b59:
	.dc.b	'a:'
L005b5b:
	.dc.b	'\',$00
L005b5d:
	.dc.b	'%pipe000.$$$',$00
L005b6a:
	.dc.b	'path=',$00
L005b70:
	.dc.b	'prompt=',$00
L005b78:
	.dc.b	'temp=',$00
L005b7e:
	.dc.b	'A:\*'
L005b82:
	.dc.b	'.*',$00
L005b85:
	.dc.b	'$N$G'
L005b89:
	.dc.b	$00
L005b8a:
	.dc.b	'exist',$00
L005b90:
	.dc.b	'errorlevel',$00
L005b9b:
	.dc.b	'exitcode',$00
L005ba4:
	.dc.b	'not',$00
L005ba8:
	.dc.b	'==',$00
L005bab:
	.dc.b	'in',$00
L005bae:
	.dc.b	')'
L005baf:
	.dc.b	'do',$00
L005bb2:
	.dc.b	$1b,'[2J',$00
L005bb7:
	.dc.b	$0d,$0a
	.dc.b	'Command version 3.00',$0d,$0a
L005bcf:
	.dc.b	$0d,$0a,$00
L005bd2:
	.dc.b	'Human68k version ',$00
L005be4:
	.dc.b	'日付',$00
L005be9:
	.dc.b	'時刻',$00
L005bee:
	.dc.b	'現在の',$00
L005bf5:
	.dc.b	'は ',$00
L005bf9:
	.dc.b	'echo は <',$00
L005c03:
	.dc.b	'break は <',$00
L005c0e:
	.dc.b	'verify は <',$00
L005c1a:
	.dc.b	'>'
L005c1b:
	.dc.b	' です',$0d,$0a,$00
L005c23:
	.dc.b	'を入力してください: ',$00
L005c38:
	.dc.b	'の指定が違います',$0d,$0a,$00
L005c4b:
	.dc.b	'を削除します',$0d,$0a,$00
L005c5a:
	.dc.b	'準備ができたらどれかキーを押してください',$00
L005c83:
	.dc.b	'コマンドまたはファイル名が違います',$0d,$0a,$00
L005ca8:
	.dc.b	'メモリ・アロケーションが異常です',$0d,$0a,$00
L005ccb:
	.dc.b	'メモリが不足です',$0d,$0a,$00
L005cde:
	.dc.b	'バッチのための'
L005cec:
	.dc.b	'メモリが足りません',$0d,$0a,$00
L005d01:
	.dc.b	'環境のためのメモリが足りません',$0d,$0a,$00
L005d22:
	.dc.b	'文字数が多すぎます',$0d,$0a,$00
L005d37:
	.dc.b	'ファイル名が長すぎます',$0d,$0a,$00
L005d50:
	.dc.b	'パス名が長すぎます',$0d,$0a,$00
L005d65:
	.dc.b	'ドライブ ',$00
L005d6f:
	.dc.b	': のボリュームラベルは',$00
L005d86:
	.dc.b	'ファイル名が無効です',$0d,$0a,$00
L005d9d:
	.dc.b	'ドライブ名が無効です',$0d,$0a,$00
L005db4:
	.dc.b	'デバイス名が無効です',$0d,$0a,$00
L005dcb:
	.dc.b	'ボリュームラベルが無効です',$0d,$0a,$00
L005de8:
	.dc.b	'ファイルは実行できません',$0d,$0a,$00
L005e03:
	.dc.b	'コピー元とコピー先が同一です',$0d,$0a,$00
L005e22:
	.dc.b	'新ファイル名と旧ファイル名のドライブ名、パス名が違います',$0d,$0a,$00
L005e5d:
	.dc.b	'ファイルが見つからないか、ファイル名が重複しています',$0d,$0a,$00
L005e94:
	.dc.b	'ファイルがすでに存在しています',$0d,$0a,$00
L005eb5:
	.dc.b	'パラメータが無効です',$0d,$0a,$00
L005ecc:
	.dc.b	'ディスクがいっぱいです',$0d,$0a,$00
L005ee5:
	.dc.b	'ディスクから読み込めません',$0d,$0a,$00
L005f02:
	.dc.b	'書き込み禁止です',$0d,$0a,$00
L005f15:
	.dc.b	'ディスクに書き込めません',$0d,$0a,$00
L005f30:
	.dc.b	'ディスクの準備が出来ていません',$0d,$0a,$00
L005f51:
	.dc.b	'コピー元ファイルが見つかりません',$0d,$0a,$00
L005f74:
	.dc.b	'ファイルがオープンできません',$0d,$0a,$00
L005f93:
	.dc.b	'ディレクトリがいっぱいです',$0d,$0a,$00
L005fb0:
	.dc.b	' '
L005fb1:
	.dc.b	'ファイルが'
L005fbb:
	.dc.b	'ありません',$0d,$0a,$00
L005fc8:
	.dc.b	'入力が重複しています',$0d,$0a,$00
L005fdf:
	.dc.b	'出力が重複しています',$0d,$0a,$00
L005ff6:
	.dc.b	'入力が見つかりません',$0d,$0a,$00
L00600d:
	.dc.b	'出力が作れません',$0d,$0a,$00
L006020:
	.dc.b	'デバイスが入力として使用できません',$0d,$0a,$00
L006045:
	.dc.b	'デバイスが出力として使用できません',$0d,$0a,$00
L00606a:
	.dc.b	'文法が違います',$0d,$0a,$00
L00607b:
	.dc.b	'セクタが見つかりません',$0d,$0a,$00
L006094:
	.dc.b	'ボリューム'
L00609e:
	.dc.b	'ラベルが見つかりません',$0d,$0a,$00
L0060b7:
	.dc.b	'パスが見つかりません',$0d,$0a,$00
L0060ce:
	.dc.b	'テンポラリ'
L0060d8:
	.dc.b	'パスは定義されていません',$0d,$0a,$00
L0060f3:
	.dc.b	'ディレクトリが空でないか、見つからないか、カレントパスです',$0d,$0a,$00
L006130:
	.dc.b	'ディレクトリが見つかりません',$0d,$0a,$00
L00614f:
	.dc.b	'ディレクトリが作れません',$0d,$0a,$00
L00616a:
	.dc.b	'ボリュームラベルが作れません',$0d,$0a,$00
L006189:
	.dc.b	'デバイスが'
L006193:
	.dc.b	'アクセスできません',$0d,$0a,$00
L0061a8:
	.dc.b	'旧'
L0061aa:
	.dc.b	'ボリュームラベルが消去できません',$0d,$0a,$00
L0061cd:
	.dc.b	'システム内部で'
L0061db:
	.dc.b	'エラーが発生しました',$0d,$0a,$00
L0061f2:
	.dc.b	'常駐しているので親プロセスに帰れません',$0d,$0a,$00
L00621b:
	.dc.b	'ディレクトリが最大数を超えました。それ以後を無視します',$0d,$0a,$00
L006254:
	.dc.b	'バイト: 最大使用可能メモリ',$0d,$0a,$00
L006271:
	.dc.b	'バイト: 全体使用可能メモリ',$0d,$0a,$00
L00628e:
	.dc.b	'<dir>       ',$00
L00629b:
	.dc.b	' ボリュームがありません',$00
L0062b3:
	.dc.b	' ファイル',$00
L0062bd:
	.dc.b	'K Byte 使用',$00
L0062c9:
	.dc.b	'中',$00
L0062cc:
	.dc.b	'可能',$0d,$0a
	.dc.b	' ファイル使用量',$00
L0062e2:
	.dc.b	'異常終了します',$0d,$0a,$00
L0062f3:
	.dc.b	'このＯＳでは使用できません',$0d,$0a,$00
L006310:
	.dc.b	' 強制終了しますか <Y/N> ',$00
L006329:
	.dc.b	' よろしいですか <Y/N> ',$00
L006340:
	.dc.b	' バッチ処理を中止しますか <Y/N> ',$00
L006361:
	.dc.b	'をコピーしますか <Y/N> ',$00
L006379:
	.dc.b	'をデリートしますか <Y/N> ',$00
L006393:
	.dc.b	'をリネームしますか <Y/N> ',$00
L0063ad:
	.dc.b	'コピーはされませんでした',$0d,$0a,$00
L0063c8:
	.dc.b	' 個のファイルをコピーしました',$0d,$0a,$00
L0063e8:
	.dc.b	'プロセス間通信エラーです',$0d,$0a,$00
L006403:
	.dc.b	'プロセスＩＤが不正です',$0d,$0a,$00
L00641c:
	.dc.b	'プロセスを生成できません',$0d,$0a,$00
L006437:
	.dc.b	'ファイルをロックできません',$0d,$0a,$00
L006454:
	.dc.b	'ファイルのアクセスが拒否されました',$0d,$0a,$00
L006479:
	.dc.b	'オープン中のファイルがあります',$0d,$0a,$00
L00649a:
	.dc.b	'Modi'
L00649e:
	.dc.b	'fied'
L0064a2:
	.dc.b	' 199'
L0064a6:
	.dc.b	'3/02'
L0064aa:
	.dc.b	'/03 '
L0064ae:
	.dc.b	'by Y'
L0064b2:
	.dc.b	'uuji'
L0064b6:
	.dc.l	$2054616e
L0064ba:
	.dc.b	'aka',$00
L0064be:
	.dc.b	'Fish'
L0064c2:
	.dc.b	'も'
L0064c4:
	.dc.b	'い'
L0064c6:
	.dc.b	'い'
L0064c8:
	.dc.b	'け'
L0064ca:
	.dc.b	'ど'
L0064cc:
	.dc.b	'c'
L0064cd:
	.dc.b	'o'
L0064ce:
	.dc.b	'mmand.xも使ってネ',$00

	.bss

L0064e0:
	.ds.b	238
L0065ce:
	.ds.b	258
L0066d0:
	.ds.b	258
L0067d2:
	.ds.b	280
L0068ea:
	.ds.b	280
L006a02:
	.ds.b	280
L006b1a:
	.ds.b	280
L006c32:
	.ds.b	280
L006d4a:
	.ds.b	280
L006e62:
	.ds.b	21
L006e77:
	.ds.b	9
L006e80:
	.ds.b	30
L006e9e:
	.ds.b	1
L006e9f:
	.ds.b	1
L006ea0:
	.ds.b	1
L006ea1:
	.ds.b	1
L006ea2:
	.ds.b	1
L006ea3:
	.ds.b	1
L006ea4:
	.ds.b	1
L006ea5:
	.ds.b	1
L006ea6:
	.ds.b	1
L006ea7:
	.ds.b	1
L006ea8:
	.ds.b	1
L006ea9:
	.ds.b	1
L006eaa:
	.ds.b	1
L006eab:
	.ds.b	1
L006eac:
	.ds.b	1
L006ead:
	.ds.b	1
L006eae:
	.ds.b	1
L006eaf:
	.ds.b	1
L006eb0:
	.ds.b	1
L006eb1:
	.ds.b	1
L006eb2:
	.ds.b	1
L006eb3:
	.ds.b	1
L006eb4:
	.ds.b	1
L006eb5:
	.ds.b	1
L006eb6:
	.ds.l	1
L006eba:
	.ds.l	1
L006ebe:
	.ds.l	1
L006ec2:
	.ds.w	1
L006ec4:
	.ds.w	1
L006ec6:
	.ds.b	1
L006ec7:
	.ds.b	1
L006ec8:
	.ds.b	256
L006fc8:
	.ds.b	1
L006fc9:
	.ds.b	257
L0070ca:
	.ds.b	1
L0070cb:
	.ds.b	279
L0071e2:
	.ds.b	280
L0072fa:
	.ds.b	280
L007412:
	.ds.b	30
L007430:
	.ds.b	30
L00744e:
	.ds.b	24
L007466:
	.ds.b	24
L00747e:
	.ds.b	1
L00747f:
	.ds.b	1
L007480:
	.ds.b	2
L007482:

	.end	Start
