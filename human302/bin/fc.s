;=============================================
;  Filename human302/bin/fc.x
;
;
;  Base address 000000
;  Exec address 000000
;  Text size    000cdc byte(s)
;  Data size    000000 byte(s)
;  Bss  size    000ee4 byte(s)
;  204 Labels
;
;  Commandline dis  -h -k -m68000 -q1 -B -M -w16 -o120 -ghuman302/bin/fc.lab --overwrite human302/bin/fc.x human302/bin/fc.s
;          DIS version 3.16
;=============================================

	.include	inc/doscall.mac
	.include	inc/iocscall.mac
	.include	inc/fefunc.mac

	.cpu	68000

	.text

L000000:
	lea.l	(L001bc0),a7
	bsr	L000ad6
	move.l	a0,-(a7)
	bsr	L00026e
	movea.l	(a7)+,a0
	bsr	L000938
	bsr	L0002b2
	bsr	L0002c0
	tst.w	(L00118a)
	bne	L00002e
	lea.l	(L000252,pc),a0
	bsr	L000c12
L00002e:
	lea.l	(L0011a2),a1
	bsr	L000b42
	lea.l	(L0015b0),a1
	bsr	L000b42
	clr.w	d0
	bra	L000b0c

L000048:
	lea.l	(L00023b,pc),a0
	bra	L00006e

L00004e:
	lea.l	(L000220,pc),a0
	bra	L00006e

L000054:
	move.l	a0,-(a7)
	lea.l	(L000203,pc),a0
	bsr	L000c12
	movea.l	(a7)+,a0
	bsr	L000c12
	lea.l	(L000208,pc),a0
	bra	L00006e

L00006a:
	lea.l	(L00008c,pc),a0
L00006e:
	bsr	L000c12
	lea.l	(L0011a2),a1
	bsr	L000b42
	lea.l	(L0015b0),a1
	bsr	L000b42
	moveq.l	#$01,d0
	bra	L000b0c

L00008c:
	.dc.b	'X68k Fc v1.01 Copyright 1989 SHARP/Hudson',$0d,$0a
	.dc.b	'使用法：fc［スイッチ］ファイル１　ファイル２',$0d,$0a
	.dc.b	$09,'/a',$09,'アスキーモードで比較する',$0d,$0a
	.dc.b	$09,'/b',$09,'バイナリーモードで比較する',$0d,$0a
	.dc.b	$09,'/c',$09,'大文字小文字を区別しない',$0d,$0a
	.dc.b	$09,'/d',$09,'比較結果を省略表示する',$0d,$0a
	.dc.b	$09,'/n',$09,'行番号を表示する',$0d,$0a
	.dc.b	$09,'/w',$09,'ブランク文字を圧縮比較する',$0d,$0a
	.dc.b	$09,'/t数値',$09,'タブをタブカラムまでのスペースとする(2,4,8,16)',$0d,$0a
	.dc.b	$09,'/l数値',$09,'比較する最大行数の指定',$0d,$0a
	.dc.b	$09,'/数値',$09,'一致行数の指定',$0d,$0a,$00
L000203:
	.dc.b	'fc: ',$00
L000208:
	.dc.b	' をオープンできません',$0d,$0a,$00
L000220:
	.dc.b	'fc: メモリーが足りません',$0d,$0a,$00
L00023b:
	.dc.b	'fc: 違いが多すぎます',$0d,$0a,$00
L000252:
	.dc.b	'fc: 違いは見つかりません',$0d,$0a,$00,$00
L00026e:
	move.w	#$0002,(L001182)
	move.w	#$0003,(L00118e)
	move.w	#$0064,(L00118c)	;'d'
	clr.w	(L001184)
	clr.w	(L001180)
	clr.w	(L00118a)
	clr.w	(L00117e)
	clr.w	(L00117c)
	clr.w	(L001186)
	clr.w	(L001188)
	rts

L0002b2:
	move.l	(L001192),d1
	move.l	d1,(L00116a)
	rts

L0002c0:
	cmpi.w	#$0002,(L001168)
	bne	L00006a
	lea.l	(L0010e4),a0
	tst.b	(a0)
	beq	L00006a
	lea.l	(L0011a2),a1
	bsr	L000b34
	tst.l	d0
	bmi	L000054
	lea.l	(L001126),a0
	tst.b	(a0)
	beq	L00006a
	lea.l	(L0015b0),a1
	bsr	L000b34
	tst.l	d0
	bmi	L000054
	tst.w	(L00117c)
	bne	L00030e
	bsr	L00031c
L00030e:
	cmpi.w	#$0002,(L00117c)
	beq	L00072a
	bra	L000380

L00031c:
	lea.l	(L0010e4),a0
	bsr	L00032a
	lea.l	(L001126),a0
L00032a:
	move.b	(a0)+,d0
	beq	L00036a
	cmp.b	#$2e,d0			;'.'
	bne	L00032a
	lea.l	(L000ce4),a1
L00033a:
	move.b	(a0)+,(a1)+
	bne	L00033a
	lea.l	(L000ce4),a0
	bsr	L0008a2
	lea.l	(L00036c,pc),a0
L00034c:
	tst.b	(a0)
	bmi	L00036a
	lea.l	(L000ce4),a1
	bsr	L000904
	beq	L000362
L00035c:
	tst.b	(a0)+
	bne	L00035c
	bra	L00034c

L000362:
	move.w	#$0002,(L00117c)
L00036a:
	rts

L00036c:
	.dc.b	$78,$00,$72,$00,$61,$00,$6f,$00,$7a,$00,$62,$69,$6e,$00,$73,$79
	.dc.b	$73,$00,$ff,$00
L000380:
	bsr	L000680
	move.l	(L001172),d0
	beq	L0003be
	move.l	(L001176),d1
	beq	L0003c6
	movea.l	d0,a4
	movea.l	d1,a5
L000398:
	movea.l	d0,a2
	movea.l	d1,a3
L00039c:
	lea.l	($0006,a2),a0
	lea.l	($0006,a3),a1
	bsr	L0004e4
	bne	L00040a
	movea.l	a2,a4
	movea.l	a3,a5
	move.l	(a2),d0
	beq	L0003b6
	move.l	(a3),d1
	bne	L000398
L0003b6:
	move.l	(a2),d0
	or.w	(a3),d0
	bne	L00040a
	rts

L0003be:
	pea.l	(L0010e4)
	bra	L0003cc

L0003c6:
	pea.l	(L001126)
L0003cc:
	lea.l	(L0003ec,pc),a0
	bsr	L000c12
	movea.l	(a7)+,a0
	bsr	L000c12
	lea.l	(L0003f1,pc),a0
	bsr	L000c12
	move.w	#$0001,(L00118a)
	rts

L0003ec:
	.dc.b	'fc: ',$00
L0003f1:
	.dc.b	' は不正なファイルです',$0d,$0a,$00,$00
L00040a:
	move.w	(L00118c),d0
	move.w	d0,(L001190)
L000416:
	movea.l	a2,a0
	movea.l	a3,a1
	bsr	L000462
	bcs	L000440
	movea.l	a2,a1
	movea.l	a3,a0
	bsr	L000462
	exg.l	a0,a1
	bcs	L000440
	move.l	(a2),d0
	beq	L00044c
	move.l	(a3),d1
	beq	L00044c
	movea.l	d0,a2
	movea.l	d1,a3
	subq.w	#1,(L001190)
	bne	L000416
	bra	L000048

L000440:
	movea.l	a0,a2
	movea.l	a1,a3
	bsr	L000510
	bra	L00039c

L00044c:
	tst.l	(a2)
	beq	L000454
	movea.l	(a2)+,a2
	bra	L00044c

L000454:
	tst.l	(a3)
	beq	L00045c
	movea.l	(a3)+,a3
	bra	L000454

L00045c:
	bsr	L000510
	rts

L000462:
	movem.l	a2-a3,-(a7)
	movea.l	a0,a2
	movea.l	a1,a3
	lea.l	($0006,a2),a0
	move.w	(L00118c),d0
	lsr.w	#1,d0
	move.w	d0,-(a7)
L000478:
	lea.l	($0006,a3),a1
	bsr	L0004e4
	beq	L000496
L000480:
	move.l	(a3),d0
	beq	L00048a
	movea.l	d0,a3
	subq.w	#1,(a7)
	bne	L000478
L00048a:
	andi.b	#$fe,ccr
L00048e:
	addq.l	#2,a7
	movem.l	(a7)+,a2-a3
	rts

L000496:
	bsr	L0004a4
	bcs	L000480
	movea.l	a2,a0
	movea.l	a3,a1
	ori.b	#$01,ccr
	bra	L00048e

L0004a4:
	movem.l	a0-a3,-(a7)
	move.w	(L00118e),-(a7)
	bra	L0004bc

L0004b0:
	lea.l	($0006,a2),a0
	lea.l	($0006,a3),a1
	bsr	L0004e4
	bne	L0004d8
L0004bc:
	move.l	(a2),d0
	or.l	(a3),d0
	beq	L0004d2
	move.l	(a2),d0
	beq	L0004d8
	move.l	(a3),d1
	beq	L0004d8
	movea.l	d0,a2
	movea.l	d1,a3
	subq.w	#1,(a7)
	bne	L0004b0
L0004d2:
	andi.b	#$fe,ccr
	bra	L0004dc

L0004d8:
	ori.b	#$01,ccr
L0004dc:
	addq.l	#2,a7
	movem.l	(a7)+,a0-a3
	rts

L0004e4:
	movem.l	a0-a2,-(a7)
	lea.l	(L000ce4),a1
	bsr	L000848
	movea.l	d0,a2
	movea.l	($0004,a7),a0
	lea.l	(L000ee4),a1
	bsr	L000848
	movea.l	d0,a1
	movea.l	a2,a0
	bsr	L000904
	movem.l	(a7)+,a0-a2
	rts

L000510:
	move.l	a2,-(a7)
	addq.w	#1,(L00118a)
	pea.l	(L0010e4)
	pea.l	(a4)
	pea.l	(a2)
	bsr	L000558
	lea.l	($000c,a7),a7
	pea.l	(L001126)
	pea.l	(a5)
	pea.l	(a3)
	bsr	L000558
	lea.l	($000c,a7),a7
	lea.l	(L000ee4),a2
	lea.l	(L00061e),a0
	bsr	L000616
	move.b	#$0d,(a2)+
	move.b	#$0a,(a2)+
	bsr	L000602
	movea.l	(a7)+,a2
	rts

L000558:
	link.w	a6,#$0000
	movem.l	a0-a1,-(a7)
	lea.l	(L000ee4),a2
	lea.l	(L00061e),a0
	bsr	L000616
	movea.l	($0010,a6),a0
	bsr	L000616
	bsr	L000602
	movea.l	($000c,a6),a1
	tst.w	(L001188)
	bne	L00059c
L000588:
	bsr	L0005d4
	cmpa.l	($0008,a6),a1
	beq	L000594
	movea.l	(a1),a1
	bra	L000588

L000594:
	movem.l	(a7)+,a0-a1
	unlk	a6
	rts

L00059c:
	bsr	L0005d4
	movea.l	(a1),a0
	cmpa.l	($0008,a6),a0
	beq	L0005c0
	move.l	(a0),d0
	cmp.l	($0008,a6),d0
	beq	L0005bc
	lea.l	(L0005cc,pc),a0
	bsr	L000c12
	movea.l	($0008,a6),a1
	bra	L0005c2

L0005bc:
	movea.l	(a1),a1
	bsr	L0005d4
L0005c0:
	movea.l	(a1),a1
L0005c2:
	bsr	L0005d4
	movem.l	(a7)+,a0-a1
	unlk	a6
	rts

L0005cc:
	.dc.b	'.....',$0d,$0a,$00
L0005d4:
	lea.l	(L000ee4),a2
	tst.w	(L00117e)
	beq	L0005fc
	move.w	($0004,a1),d0
	bsr	L000624
	lea.l	(L000cdc),a0
	bsr	L000616
	move.b	#$3a,(a2)+		;':'
	move.b	#$20,(a2)+		;' '
	move.b	#$20,(a2)+		;' '
L0005fc:
	lea.l	($0006,a1),a0
	bsr	L000616
L000602:
	move.b	#$0d,(a2)+
	move.b	#$0a,(a2)+
	clr.b	(a2)
	lea.l	(L000ee4),a0
	bra	L000c12

L000616:
	move.b	(a0)+,(a2)+
	bne	L000616
	subq.l	#1,a2
	rts

L00061e:
	move.l	($2b2b,a3),-(a5)
	move.l	d0,d0
L000624:
	move.l	a0,-(a7)
	lea.l	(L000cdc),a0
	and.l	#$0000ffff,d0
	move.w	#$2710,d1
	bsr	L00065e
	move.w	#$03e8,d1
	bsr	L00065e
	move.w	#$0064,d1		;'d'
	bsr	L00065e
	move.w	#$000a,d1
	bsr	L00065e
	move.w	#$0001,d1
	bsr	L00065e
	clr.b	(a0)
	lea.l	(L000cdc),a0
	bsr	L00066c
	movea.l	(a7)+,a0
	rts

L00065e:
	divu.w	d1,d0
	add.w	#$0030,d0
	move.b	d0,(a0)+
	clr.w	d0
	swap.w	d0
	rts

L00066c:
	moveq.l	#$03,d1
L00066e:
	move.b	(a0),d0
	cmp.b	#$30,d0			;'0'
	bne	L00067e
	move.b	#$20,(a0)+		;' '
	dbra	d1,L00066e
L00067e:
	rts

L000680:
	clr.l	(L001172)
	move.l	#L001172,(L00116e)
	clr.w	(L00117a)
	lea.l	(L0011a2),a1
	bsr	L0006be
	clr.l	(L001176)
	move.l	#L001176,(L00116e)
	clr.w	(L00117a)
	lea.l	(L0015b0),a1
	bsr	L0006be
	rts

L0006be:
	lea.l	(L000ce4),a0
	bsr	L000b7a
	tst.l	d0
	bmi	L0006e6
	move.l	a1,-(a7)
	lea.l	(L000ee4),a1
	bsr	L0007f6
	movea.l	a1,a0
	addq.w	#1,(L00117a)
	bsr	L0006e8
	movea.l	(a7)+,a1
	bra	L0006be

L0006e6:
	rts

L0006e8:
	move.l	(L00116a),d0
	addq.l	#1,d0
	bclr.l	#$00,d0
	movea.l	d0,a1
	movea.l	(L00116e),a2
	move.l	a1,(a2)
	move.l	a1,(L00116e)
	clr.l	(a1)+
	move.w	(L00117a),(a1)+
L00070c:
	move.b	(a0)+,(a1)+
	bne	L00070c
	move.l	(L001196),d0
	sub.l	a1,d0
	cmp.l	#$00000200,d0
	bcs	L00004e
	move.l	a1,(L00116a)
	rts

L00072a:
	moveq.l	#$ff,d7
L00072c:
	addq.l	#1,d7
	lea.l	(L0011a2),a1
	bsr	L000b50
	move.l	d0,d1
	lea.l	(L0015b0),a1
	bsr	L000b50
	move.w	d0,d2
	or.w	d1,d0
	bmi	L00078e
	cmp.b	d1,d2
	beq	L00072c
	addq.w	#1,(L00118a)
	lea.l	(L000ce4),a1
	move.l	d7,d0
	bsr	L0008d6
	move.b	#$3a,(a1)+		;':'
	move.b	#$20,(a1)+		;' '
	move.l	d1,d0
	bsr	L0008e2
	move.b	#$20,(a1)+		;' '
	move.l	d2,d0
	bsr	L0008e2
	move.b	#$0d,(a1)+
	move.b	#$0a,(a1)+
	clr.b	(a1)
	lea.l	(L000ce4),a0
	bsr	L000c12
	bra	L00072c

L00078e:
	move.w	d1,d0
	and.w	d2,d0
	bmi	L0007d0
	lea.l	(L0010e4),a1
	lea.l	(L001126),a2
	tst.w	d2
	bmi	L0007a6
	exg.l	a1,a2
L0007a6:
	lea.l	(L0007d2,pc),a0
	bsr	L000c12
	movea.l	a1,a0
	bsr	L000c12
	lea.l	(L0007d7,pc),a0
	bsr	L000c12
	movea.l	a2,a0
	bsr	L000c12
	lea.l	(L0007dc,pc),a0
	bsr	L000c12
	addq.w	#1,(L00118a)
L0007d0:
	rts

L0007d2:
	.dc.b	'fc: ',$00
L0007d7:
	.dc.b	' は ',$00
L0007dc:
	.dc.b	' より大きいファイルです',$0d,$0a,$00
L0007f6:
	movem.l	a0-a1,-(a7)
	clr.w	d7
L0007fc:
	move.b	(a0),d0
	beq	L00080e
	addq.l	#1,a0
	cmp.b	#$09,d0
	beq	L000816
L000808:
	addq.w	#1,d7
	move.b	d0,(a1)+
	bra	L0007fc

L00080e:
	clr.b	(a1)
	movem.l	(a7)+,a0-a1
	rts

L000816:
	tst.w	(L001184)
	beq	L000808
	move.w	d7,d1
	move.w	(L001182),d0
	lsl.w	#1,d0
	move.w	(L000840,pc,d0.w),d2
	add.w	d2,d1
	addq.w	#1,d1
	not.w	d2
	and.w	d2,d1
L000834:
	addq.w	#1,d7
	move.b	#$20,(a1)+		;' '
	cmp.w	d7,d1
	bne	L000834
	bra	L0007fc

L000840:
	.dc.w	$0001,$0003,$0007,$000f
L000848:
	move.w	(L001186),d0
	or.w	(L001180),d0
	bne	L00085a
	move.l	a0,d0
	rts

L00085a:
	movem.l	a0-a1,-(a7)
	tst.w	(L001186)
	beq	L000868
	bsr	L0008a2
L000868:
	move.b	(a0)+,d0
	cmp.b	#$20,d0			;' '
	beq	L000876
	cmp.b	#$09,d0
	bne	L000884
L000876:
	tst.w	(L001180)
	beq	L000884
	bsr	L000890
	move.b	#$20,d0			;' '
L000884:
	move.b	d0,(a1)+
	bne	L000868
	movem.l	(a7)+,a0-a1
	move.l	a1,d0
	rts

L000890:
	move.b	(a0)+,d0
	cmp.b	#$20,d0			;' '
	beq	L000890
	cmp.b	#$09,d0
	beq	L000890
	move.b	-(a0),d0
	rts

L0008a2:
	move.l	a0,-(a7)
L0008a4:
	move.b	(a0),d0
	beq	L0008d2
	cmp.b	#$81,d0
	bcc	L0008c2
	cmp.b	#$5b,d0			;'['
	bcc	L0008be
	cmp.b	#$41,d0			;'A'
	bcs	L0008be
	add.b	#$20,d0			;' '
L0008be:
	move.b	d0,(a0)+
	bra	L0008a4

L0008c2:
	cmp.b	#$e0,d0
	bcc	L0008ce
	cmp.b	#$a0,d0
	bcc	L0008be
L0008ce:
	addq.l	#2,a0
	bra	L0008a4

L0008d2:
	movea.l	(a7)+,a0
	rts

L0008d6:
	swap.w	d0
	bsr	L0008dc
	swap.w	d0
L0008dc:
	rol.w	#8,d0
	bsr	L0008e2
	rol.w	#8,d0
L0008e2:
	move.w	d0,-(a7)
	lsr.w	#4,d0
	bsr	L0008f0
	move.w	(a7),d0
	bsr	L0008f0
	move.w	(a7)+,d0
	rts

L0008f0:
	and.w	#$000f,d0
	add.w	#$0030,d0
	cmp.w	#$003a,d0		;':'
	bcs	L000900
	addq.w	#7,d0
L000900:
	move.b	d0,(a1)+
	rts

L000904:
	movem.l	d0-d1/a0-a1,-(a7)
L000908:
	move.b	(a0)+,d0
	beq	L00091a
	move.b	(a1)+,d1
	beq	L000928
	cmp.b	d1,d0
	beq	L000908
L000914:
	movem.l	(a7)+,d0-d1/a0-a1
	rts

L00091a:
	tst.b	(a1)
	beq	L00092e
	andi.b	#$fb,ccr
	ori.b	#$01,ccr
	bra	L000914

L000928:
	andi.b	#$fa,ccr
	bra	L000914

L00092e:
	andi.b	#$e0,ccr
	ori.b	#$04,ccr
	bra	L000914

L000938:
	clr.w	(L001168)
	clr.w	(L0010e4)
	clr.w	(L001126)
L00094a:
	bsr	L00097a
	tst.b	(a0)
	beq	L000956
	bsr	L000958
	tst.b	(a0)
	bne	L00094a
L000956:
	rts

L000958:
	lea.l	(L0010e4),a1
	tst.w	(a1)
	beq	L00096e
	lea.l	(L001126),a1
	tst.w	(a1)
	bne	L00006a
L00096e:
	bsr	L000ac2
	addq.w	#1,(L001168)
	rts

L00097a:
	bsr	L000890
	cmp.b	#$2d,d0			;'-'
	beq	L00098c
	cmp.b	#$2f,d0			;'/'
	beq	L00098c
	rts

L00098c:
	addq.l	#1,a0
L00098e:
	move.b	(a0),d0
	beq	L00097a
	cmp.b	#$20,d0			;' '
	beq	L00097a
	addq.l	#1,a0
	bsr	L000ab0
	lea.l	(L0009bc,pc),a1
L0009a2:
	move.w	(a1)+,d1
	bmi	L0009b0
	movea.l	(a1)+,a2
	cmp.b	d1,d0
	bne	L0009a2
	jsr	(a2)
	bra	L00098e

L0009b0:
	bsr	L000aa0
	bcs	L00006a
	bsr	L000a2a
	bra	L00098e

L0009bc:
	.dc.b	$00,$74
	.dc.l	L000a4c
	.dc.b	$00,$6e
	.dc.l	L0009ee
	.dc.b	$00,$62
	.dc.l	L000a02
	.dc.b	$00,$61
	.dc.l	L0009f8
	.dc.b	$00,$77
	.dc.l	L000a0c
	.dc.b	$00,$63
	.dc.l	L000a16
	.dc.b	$00,$64
	.dc.l	L000a20
	.dc.b	$00,$6c
	.dc.l	L000a3a
	.dc.b	$ff,$ff
L0009ee:
	move.w	#$ffff,(L00117e)
	rts

L0009f8:
	move.w	#$0001,(L00117c)
	rts

L000a02:
	move.w	#$0002,(L00117c)
	rts

L000a0c:
	move.w	#$ffff,(L001180)
	rts

L000a16:
	move.w	#$ffff,(L001186)
	rts

L000a20:
	move.w	#$ffff,(L001188)
	rts

L000a2a:
	and.w	#$00ff,d0
	beq	L00006a
	move.w	d0,(L00118e)
	rts

L000a3a:
	bsr	L000a80
	cmp.w	#$000a,d0
	bcs	L00006a
	move.w	d0,(L00118c)
	rts

L000a4c:
	bsr	L000a80
	clr.w	d1
	cmp.w	#$0002,d0
	beq	L000a70
	addq.w	#1,d1
	cmp.w	#$0004,d0
	beq	L000a70
	addq.w	#1,d1
	cmp.w	#$0008,d0
	beq	L000a70
	addq.w	#1,d1
	cmp.w	#$0010,d0
	bne	L00006a
L000a70:
	move.w	d1,(L001182)
	move.w	#$ffff,(L001184)
	rts

L000a80:
	clr.l	d1
	clr.l	d0
L000a84:
	move.b	(a0)+,d0
	sub.w	#$0030,d0
	bmi	L000a9a
	cmp.w	#$000a,d0
	bcc	L000a9a
	mulu.w	#$000a,d1
	add.l	d0,d1
	bra	L000a84

L000a9a:
	subq.l	#1,a0
	move.l	d1,d0
	rts

L000aa0:
	sub.b	#$30,d0			;'0'
	bcs	L000aae
	cmp.b	#$0a,d0
	eori.b	#$01,ccr
L000aae:
	rts

L000ab0:
	cmp.b	#$5b,d0			;'['
	bcc	L000ac0
	cmp.b	#$41,d0			;'A'
	bcs	L000ac0
	add.b	#$20,d0			;' '
L000ac0:
	rts

L000ac2:
	move.b	(a0)+,d0
	beq	L000ad0
	cmp.b	#$20,d0			;' '
	beq	L000ad0
	move.b	d0,(a1)+
	bra	L000ac2

L000ad0:
	subq.l	#1,a0
	clr.b	(a1)+
	rts

L000ad6:
	adda.l	#$00000010,a0
	suba.l	a0,a1
	movem.l	a0-a1,-(a7)
	DOS	_SETBLOCK
	move.l	#$00ffffff,(a7)
	DOS	_MALLOC
	and.l	#$00ffffff,d0
	move.l	d0,(a7)
	DOS	_MALLOC
	move.l	d0,(L001192)
	add.l	(a7)+,d0
	move.l	d0,(L001196)
	addq.l	#4,a7
	lea.l	($0001,a2),a0
	rts

L000b0c:
	move.w	d0,-(a7)
	DOS	_EXIT2

L000b10:
	move.l	a0,($000a,a1)
	clr.w	($0006,a1)
	clr.w	($0004,a1)
	clr.w	($0008,a1)
	move.w	($0002,a1),-(a7)
	move.l	a0,-(a7)
	DOS	_OPEN
	addq.l	#6,a7
	move.w	d0,($0000.w,a1)
	movea.l	($000a,a1),a0
	rts

L000b34:
	move.l	a0,-(a7)
	move.w	#$0000,($0002,a1)
	bsr	L000b10
	movea.l	(a7)+,a0
	rts

L000b42:
	cmpi.w	#$0005,(a1)
	blt	L000b4e
	move.w	(a1),-(a7)
	DOS	_CLOSE
	addq.l	#2,a7
L000b4e:
	rts

L000b50:
	move.l	a0,-(a7)
	move.w	($0008,a1),d0
	cmp.w	($0006,a1),d0
	bcs	L000b64
	bsr	L000bee
	subq.l	#1,d0
	bmi	L000b76
L000b64:
	clr.l	d0
	move.w	($0008,a1),d0
	lea.l	($000e,a1),a0
	adda.l	d0,a0
	move.b	(a0),d0
	addq.w	#1,($0008,a1)
L000b76:
	movea.l	(a7)+,a0
	rts

L000b7a:
	movem.l	d1/a0-a1,-(a7)
	clr.w	d1
L000b80:
	move.w	($0008,a1),d0
	cmp.w	($0006,a1),d0
	bcs	L000b90
	bsr	L000bee
	subq.l	#1,d0
	bmi	L000be2
L000b90:
	move.w	($0008,a1),d0
	move.b	($0e,a1,d0.w),d0
	addq.w	#1,($0008,a1)
	cmp.b	#$0d,d0
	beq	L000bc8
	cmp.b	#$1a,d0
	beq	L000bb8
	move.b	d0,(a0)+
	addq.w	#1,d1
	cmp.w	#$00ff,d1
	bcs	L000b80
	clr.b	(a0)
	clr.l	d0
	bra	L000be8

L000bb8:
	subq.w	#1,($0008,a1)
	cmpa.l	($0004,a7),a0
	beq	L000be6
	clr.b	(a0)
	clr.l	d0
	bra	L000be8

L000bc8:
	clr.b	(a0)
	move.w	($0008,a1),d0
	cmp.w	($0006,a1),d0
	bcs	L000bda
	bsr	L000bee
	subq.l	#1,d0
	bmi	L000be2
L000bda:
	addq.w	#1,($0008,a1)
	clr.l	d0
	bra	L000be8

L000be2:
	clr.w	($0008,a1)
L000be6:
	moveq.l	#$ff,d0
L000be8:
	movem.l	(a7)+,d1/a0-a1
	rts

L000bee:
	move.l	#$00000400,-(a7)
	pea.l	($000e,a1)
	move.w	($0000.w,a1),-(a7)
	DOS	_READ
	adda.l	#$0000000a,a7
	move.w	d0,($0006,a1)
	addq.w	#1,($0004,a1)
	clr.w	($0008,a1)
	rts

L000c12:
	pea.l	(a0)
	DOS	_PRINT
	addq.l	#4,a7
	rts

L000c1a:
	move.w	d0,-(a7)
	DOS	_PUTCHAR
	move.w	(a7)+,d0
	rts

L000c22:
	move.l	d0,-(a7)
	move.w	#$000d,-(a7)
	DOS	_PUTCHAR
	move.w	#$000a,(a7)
	DOS	_PUTCHAR
	addq.l	#2,a7
	move.l	(a7)+,d0
	rts

L000c36:
	movem.l	d0-d2,-(a7)
	move.w	d0,d2
	rol.w	#8,d2
	bra	L000c4e

L000c40:
	movem.l	d0-d2,-(a7)
	move.w	d0,d2
	rol.w	#4,d2
	bsr	L000c5c
	rol.w	#4,d2
	bsr	L000c5c
L000c4e:
	rol.w	#4,d2
	bsr	L000c5c
	rol.w	#4,d2
	bsr	L000c5c
	movem.l	(a7)+,d0-d2
	rts

L000c5c:
	move.w	d2,d0
	and.w	#$000f,d0
	cmp.w	#$000a,d0
	bcs	L000c6a
	addq.w	#7,d0
L000c6a:
	add.w	#$0030,d0
	bra	L000c1a

L000c70:
	link.w	a6,#-$0006
	movem.l	d0-d2/a0,-(a7)
	lea.l	(-$0006,a6),a0
	and.l	#$0000ffff,d0
	move.w	#$2710,d1
	bsr	L000cb6
	move.w	#$03e8,d1
	bsr	L000cb6
	move.w	#$0064,d1		;'d'
	bsr	L000cb6
	move.w	#$000a,d1
	bsr	L000cb6
	move.w	#$0001,d1
	bsr	L000cb6
	clr.b	(a0)
	lea.l	(-$0006,a6),a0
	bsr	L000cc4
	addq.l	#1,a0
	bsr	L000c12
	movem.l	(a7)+,d0-d2/a0
	unlk	a6
	rts

L000cb6:
	divu.w	d1,d0
	add.w	#$0030,d0
	move.b	d0,(a0)+
	clr.w	d0
	swap.w	d0
	rts

L000cc4:
	move.l	a0,-(a7)
	moveq.l	#$03,d1
L000cc8:
	move.b	(a0),d0
	cmp.b	#$30,d0			;'0'
	bne	L000cd8
	move.b	#$20,(a0)+		;' '
	dbra	d1,L000cc8
L000cd8:
	movea.l	(a7)+,a0
	rts


	.bss

L000cdc:
	.ds.b	8
L000ce4:
	.ds.b	512
L000ee4:
	.ds.b	512
L0010e4:
	.ds.b	66
L001126:
	.ds.b	66
L001168:
	.ds.w	1
L00116a:
	.ds.l	1
L00116e:
	.ds.l	1
L001172:
	.ds.l	1
L001176:
	.ds.l	1
L00117a:
	.ds.w	1
L00117c:
	.ds.w	1
L00117e:
	.ds.w	1
L001180:
	.ds.w	1
L001182:
	.ds.w	1
L001184:
	.ds.w	1
L001186:
	.ds.w	1
L001188:
	.ds.w	1
L00118a:
	.ds.w	1
L00118c:
	.ds.w	1
L00118e:
	.ds.w	1
L001190:
	.ds.w	1
L001192:
	.ds.l	1
L001196:
	.ds.b	12
L0011a2:
	.ds.b	1038
L0015b0:
	.ds.b	1552
L001bc0:

	.end	L000000
