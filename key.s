;=============================================
;  Filename key.x
;
;
;  Base address 000000
;  Exec address 000000
;  Text size    000544 byte(s)
;  Data size    0004c2 byte(s)
;  Bss  size    0006e8 byte(s)
;  116 Labels
;
;  Commandline dis  -b2 -h -m68000 --sp -q1 -B -M -o120 -gkey.lab --overwrite key.x key.s
;          DIS version 3.16
;=============================================

	.include	inc/doscall.mac
	.include	inc/iocscall.mac
	.include	inc/fefunc.mac

	.cpu	68000

	.text

Start:
	lea.l	(End),sp
	addq.l	#1,a2
	bsr.w	L000538
	bne.w	L0003e2
	lea.l	(L000546),a5
	bsr.w	L000530
	lea.l	(L00055b),a5
	bsr.w	L000530
L000024:
	DOS	_INKEY
	cmpi.b	#$03,d0
	beq.w	L0000cc
	or.b	#$20,d0
	cmp.b	#$75,d0			;'u'
	beq.w	L0000e6
	cmp.b	#$6c,d0			;'l'
	beq.s	L00004c
	move.w	#$0007,-(sp)
	clr.w	-(sp)
	DOS	_CONCTRL
	addq.l	#4,sp
	bra.s	L000024

L00004c:
	move.w	d0,-(sp)
	clr.w	-(sp)
	DOS	_CONCTRL
	addq.l	#4,sp
	bsr.w	L00051a
	lea.l	(L00057b),a5
	lea.l	(L000963),a6
	bsr.w	L0004ac
	clr.w	-(sp)
	pea.l	(L000963)
	DOS	_OPEN
	addq.l	#6,sp
	tst.l	d0
	bmi.s	L0000c0
	move.w	d0,d2
	move.l	#$000002c8,-(sp)
	pea.l	(L000a26)
	move.w	d2,-(sp)
	DOS	_READ
	lea.l	($000a,sp),sp
	cmp.l	#$000002c8,d0
	bne.s	L0000b2
	move.w	d2,-(sp)
	DOS	_CLOSE
	addq.l	#2,sp
	pea.l	(L000a26)
	move.w	#$0100,-(sp)
	DOS	_FNCKEY
	addq.l	#6,sp
	lea.l	(L0008b1),a5
	bra.s	L0000c6

L0000b2:
	move.w	d2,-(sp)
	DOS	_CLOSE
	addq.l	#2,sp
	lea.l	(L0008f5),a5
	bra.s	L0000c6

L0000c0:
	lea.l	(L0008da),a5
L0000c6:
	bsr.w	L000530
L0000ca:
	DOS	_EXIT

L0000cc:
	bsr.w	L00051a
	DOS	_EXIT

L0000d2:
	move.w	#$0200,-(sp)
L0000d6:
	move.w	(L000544),-(sp)
	move.w	#$0010,-(sp)
	DOS	_CONCTRL
	addq.l	#4,sp
	DOS	_EXIT2

L0000e6:
	move.w	d0,-(sp)
	clr.w	-(sp)
	DOS	_CONCTRL
	addq.l	#4,sp
	bsr.w	L00051a
	lea.l	(L00057b),a5
	lea.l	(L000963),a6
	bsr.w	L0004ac
	clr.w	-(sp)
	pea.l	(L000963)
	DOS	_OPEN
	addq.l	#6,sp
	tst.l	d0
	bmi.s	L000138
	move.w	d0,d2
	move.l	#$000002c8,-(sp)
	pea.l	(L000a26)
	move.w	d2,-(sp)
	DOS	_READ
	lea.l	($000a,sp),sp
	move.l	d0,-(sp)
	move.w	d2,-(sp)
	DOS	_CLOSE
	addq.l	#2,sp
	cmpi.l	#$000002c8,(sp)+
	beq.s	L000146
L000138:
	pea.l	(L000a26)
	move.w	#$0000,-(sp)
	DOS	_FNCKEY
	addq.l	#6,sp
L000146:
	lea.l	(L000595),a5
	lea.l	(L0009b4),a6
	bsr.w	L0004ac
	lea.l	(L0005af),a5
	bsr.w	L000530
	bsr.w	L0004cc
	bne.w	L0000ca
	move.w	#$ffff,-(sp)
	move.w	#$0010,-(sp)
	DOS	_CONCTRL
	move.w	d0,(L000544)
	pea.l	(L0000d2)
	move.w	#$fff1,-(sp)
	DOS	_INTVCS
	addq.l	#6,sp
	move.w	#$0000,($0002,sp)
	DOS	_CONCTRL
	addq.l	#4,sp
	lea.l	(L0005c9),a5
	bsr.w	L000530
	lea.l	(L000a26),a6
	lea.l	(L0005fd),a4
	moveq.l	#$13,d6
L0001a8:
	movea.l	a4,a5
	bsr.w	L000530
	movea.l	a6,a5
	bsr.w	L000404
	lea.l	($0010,a4),a4
	lea.l	($0020,a6),a6
	dbra.w	d6,L0001a8
	lea.l	(L00073d),a4
	moveq.l	#$0b,d6
L0001c8:
	movea.l	a4,a5
	bsr.w	L000530
	movea.l	a6,a5
	bsr.w	L000404
	lea.l	($0018,a4),a4
	lea.l	($0006,a6),a6
	dbra.w	d6,L0001c8
L0001e0:
	lea.l	(L00085d),a5
	bsr.w	L000530
L0001ea:
	DOS	_GETC
	cmp.b	#$0d,d0
	beq.w	L00036e
	and.w	#$00df,d0
	cmp.b	#$46,d0			;'F'
	bne.s	L0001ea
	move.w	d0,-(sp)
	DOS	_PUTCHAR
	move.w	(sp)+,d0
	moveq.l	#$01,d2
	clr.l	d1
L000208:
	DOS	_GETC
	cmp.b	#$0d,d0
	beq.w	L00036e
	cmp.b	#$30,d0			;'0'
	bcs.s	L000208
	cmp.b	#$3a,d0			;':'
	bcc.s	L000208
	move.w	d0,-(sp)
	DOS	_PUTCHAR
	move.w	(sp)+,d0
	mulu.w	#$000a,d1
	and.w	#$000f,d0
	add.w	d0,d1
	dbra.w	d2,L000208
	subq.w	#1,d1
	cmp.w	#$0020,d1		;' '
	bcc.s	L0001e0
L00023a:
	move.w	d1,-(sp)
	clr.l	d6
L00023e:
	lea.l	(L000871),a5
	bsr.w	L000530
	lea.l	(L000a06),a6
	adda.l	d6,a6
	clr.b	(a6)
	lea.l	(L000a06),a5
L000258:
	move.b	(a5)+,d0
	beq.s	L00028a
	cmp.b	#$80,d0
	bcs.s	L00027e
	cmp.b	#$a0,d0
	bcs.s	L000274
	cmp.b	#$e0,d0
	bcs.s	L00027e
	cmp.b	#$fe,d0
	beq.s	L00027e
L000274:
	tst.b	(a5)
	beq.s	L000284
	bsr.w	L00040e
	move.b	(a5)+,d0
L00027e:
	bsr.w	L00040e
	bra.s	L000258

L000284:
	clr.b	-(a5)
	subq.l	#1,a6
	subq.l	#1,d6
L00028a:
	DOS	_GETC
	cmp.b	#$0d,d0
	beq.s	L0002d8
	cmp.b	#$08,d0
	beq.s	L0002c6
	cmp.b	#$1f,d0
	beq.s	L0002b2
	cmp.b	#$1e,d0
	beq.s	L0002ae
	cmp.b	#$1d,d0
	bne.s	L0002b4
	moveq.l	#$08,d0
	bra.s	L0002b4

L0002ae:
	moveq.l	#$fe,d0
	bra.s	L0002b4

L0002b2:
	moveq.l	#$0d,d0
L0002b4:
	cmp.l	#$0000001f,d6
	bcc.s	L00028a
	move.b	d0,(a6)+
	addq.l	#1,d6
	bsr.w	L00040e
	bra.s	L00028a

L0002c6:
	tst.l	d6
	beq.w	L0001e0
	lea.l	(L000a06),a6
	subq.l	#1,d6
	bra.w	L00023e

L0002d8:
	clr.b	(a6)
	move.w	(sp)+,d1
	lea.l	(L000a26),a4
	move.w	d1,d4
	cmp.w	#$0014,d4
	bcc.s	L0002f0
	asl.w	#5,d4
	moveq.l	#$1f,d0
	bra.s	L00030a

L0002f0:
	cmp.w	#$0006,d6
	bcc.w	L00023a
	sub.w	#$0014,d4
	lea.l	($0280,a4),a4
	asl.w	#1,d4
	move.w	d4,d0
	asl.w	#1,d4
	add.w	d0,d4
	moveq.l	#$05,d0
L00030a:
	lea.l	(a4,d4.w),a4
	movea.l	a4,a0
L000310:
	clr.b	(a0)+
	dbra.w	d0,L000310
	lea.l	(L000a06),a5
	movea.l	a4,a0
L00031e:
	move.b	(a5)+,(a0)+
	bne.s	L00031e
	lea.l	(L0005fd),a5
	move.w	d1,d4
	cmp.w	#$0014,d4
	bcc.s	L000336
	asl.w	#4,d4
	moveq.l	#$22,d0			;'"'
	bra.s	L00034a

L000336:
	sub.w	#$0014,d4
	lea.l	(L00073d),a5
	asl.w	#3,d4
	move.w	d4,d0
	asl.w	#1,d4
	add.w	d0,d4
	moveq.l	#$09,d0
L00034a:
	lea.l	(a5,d4.w),a5
	move.l	d0,d4
	bsr.w	L000530
	move.w	#$0020,-(sp)		;' '
L000358:
	DOS	_INPOUT
	dbra.w	d4,L000358
	addq.l	#2,sp
	bsr.w	L000530
	movea.l	a4,a5
	bsr.w	L000404
	bra.w	L0001e0

L00036e:
	lea.l	(L000885),a5
	bsr.w	L000530
	bsr.w	L0004cc
	bne.w	L0001e0
	bsr.w	L00051a
	lea.l	(L0009b4),a5
	bsr.w	L000530
	lea.l	(L00089a),a5
	bsr.w	L000530
	bsr.w	L0004cc
	bne.s	L0003ce
	move.w	#$0020,-(sp)		;' '
	pea.l	(L0009b4)
	DOS	_CREATE
	addq.l	#6,sp
	tst.l	d0
	tst.l	d0
	bmi.s	L0003ce
	move.w	d0,d2
	move.l	#$000002c8,-(sp)
	pea.l	(L000a26)
	move.w	d2,-(sp)
	DOS	_WRITE
	lea.l	($000a,sp),sp
	move.w	d2,-(sp)
	DOS	_CLOSE
	addq.l	#2,sp
L0003ce:
	pea.l	(L000a26)
	move.w	#$0100,-(sp)
	DOS	_FNCKEY
	addq.l	#6,sp
	clr.w	-(sp)
	bra.w	L0000d6

L0003e2:
	subq.l	#1,a2
	bsr.w	L0004f4
	subq.w	#1,d1
	cmp.w	#$0020,d1		;' '
	bcc.w	L0000ca
	addq.w	#1,d1
	or.w	#$0100,d1
	move.l	a2,-(sp)
	move.w	d1,-(sp)
	DOS	_FNCKEY
	addq.l	#6,sp
	bra.w	L0000ca

L000404:
	move.b	(a5)+,d0
	beq.s	L00040c
	bsr.s	L00040e
	bra.s	L000404

L00040c:
	rts

L00040e:
	and.w	#$00ff,d0
	cmp.b	#$fe,d0
	beq.s	L000482
	bcc.w	L0004aa
	cmp.b	#$20,d0			;' '
	bcs.s	L000432
	move.w	d0,-(sp)
	move.w	#$0009,-(sp)
	move.w	#$0002,-(sp)
	DOS	_CONCTRL
	addq.l	#4,sp
	bra.s	L00049a

L000432:
	move.w	d0,-(sp)
	move.w	#$000b,-(sp)
	move.w	#$0002,-(sp)
	DOS	_CONCTRL
	addq.l	#4,sp
	move.w	(sp)+,d0
	cmp.b	#$1b,d0
	beq.s	L00046c
	cmp.b	#$0d,d0
	beq.s	L00045e
	add.w	#$0040,d0
	move.w	d0,-(sp)
	move.w	#$005e,-(sp)		;'^'
	DOS	_INPOUT
	addq.l	#2,sp
	bra.s	L00049a

L00045e:
	move.w	#$0063,-(sp)		;'c'
	DOS	_INPOUT
	addq.l	#2,sp
	move.w	#$0072,-(sp)		;'r'
	bra.s	L00049a

L00046c:
	move.w	#$0065,-(sp)		;'e'
	DOS	_INPOUT
	addq.l	#2,sp
	move.w	#$0073,-(sp)		;'s'
	DOS	_INPOUT
	addq.l	#2,sp
	move.w	#$0063,-(sp)		;'c'
	bra.s	L00049a

L000482:
	move.w	#$000a,-(sp)
	move.w	#$0002,-(sp)
	DOS	_CONCTRL
	addq.l	#4,sp
	move.w	#$0066,-(sp)		;'f'
	DOS	_INPOUT
	addq.l	#2,sp
	move.w	#$0065,-(sp)		;'e'
L00049a:
	DOS	_INPOUT
	addq.l	#2,sp
	move.w	#$0003,-(sp)
	move.w	#$0002,-(sp)
	DOS	_CONCTRL
	addq.l	#4,sp
L0004aa:
	rts

L0004ac:
	bsr.w	L000530
	lea.l	(L000910),a5
	clr.b	($0001,a5)
	bsr.s	L000520
	tst.b	($0001,a5)
	beq.s	L0004ca
	lea.l	($0002,a5),a5
L0004c6:
	move.b	(a5)+,(a6)+
	bne.s	L0004c6
L0004ca:
	rts

L0004cc:
	move.w	#$0008,-(sp)
	DOS	_KFLUSH
	addq.l	#2,sp
	or.b	#$20,d0
	cmp.b	#$79,d0			;'y'
	beq.s	L0004e6
	cmp.b	#$6e,d0			;'n'
	bne.s	L0004cc
	or.b	d0,d0
L0004e6:
	move.w	sr,-(sp)
	move.w	d0,-(sp)
	DOS	_PUTCHAR
	addq.l	#2,sp
	bsr.s	L00051a
	move.w	(sp)+,ccr
	rts

L0004f4:
	bsr.s	L000538
	clr.l	d1
L0004f8:
	cmp.b	#$30,d0			;'0'
	bcs.s	L000518
	cmp.b	#$3a,d0			;':'
	bcc.s	L000518
	and.l	#$0000000f,d0
	add.l	d1,d1
	move.l	d1,d2
	asl.l	#2,d1
	add.l	d2,d1
	add.l	d0,d1
	move.b	(a2)+,d0
	bra.s	L0004f8

L000518:
	rts

L00051a:
	moveq.l	#$0d,d0
	bsr.s	L000528
	bra.s	L000526

L000520:
	move.l	a5,-(sp)
	DOS	_GETS
	addq.l	#4,sp
L000526:
	moveq.l	#$0a,d0
L000528:
	move.w	d0,-(sp)
	DOS	_PUTCHAR
	addq.l	#2,sp
	rts

L000530:
	move.l	a5,-(sp)
	DOS	_PRINT
	addq.l	#4,sp
	rts

L000538:
	move.b	(a2)+,d0
	beq.s	L000542
	cmp.b	#$20,d0			;' '
	beq.s	L000538
L000542:
	rts


	.data

L000544:
	.dc.w	$0000
L000546:
	.dc.b	$0d,$0a
	.dc.b	'KEY Version 1.00',$0d,$0a,$00
L00055b:
	.dc.b	$0d,$0a
	.dc.b	'更新ですか、登録ですか？[U/L]',$00
L00057b:
	.dc.b	'入力ファイル名 [KEY.SYS]:',$00
L000595:
	.dc.b	'出力ファイル名 [KEY.SYS]:',$00
L0005af:
	.dc.b	'処理を開始しますか？[Y/N]',$00
L0005c9:
	.dc.b	$1b,'*',$09,'＊＊＊　現在のファンクションキー定義状態　＊＊＊',$00
L0005fd:
	.dc.b	$1b,'[04;08HF01:',$00,$00,$00,$00
L00060d:
	.dc.b	$1b,'[05;08HF02:',$00,$00,$00,$00
L00061d:
	.dc.b	$1b,'[06;08HF03:',$00,$00,$00,$00
L00062d:
	.dc.b	$1b,'[07;08HF04:',$00,$00,$00,$00
L00063d:
	.dc.b	$1b,'[08;08HF05:',$00,$00,$00,$00
L00064d:
	.dc.b	$1b,'[09;08HF06:',$00,$00,$00,$00
L00065d:
	.dc.b	$1b,'[10;08HF07:',$00,$00,$00,$00
L00066d:
	.dc.b	$1b,'[11;08HF08:',$00,$00,$00,$00
L00067d:
	.dc.b	$1b,'[12;08HF09:',$00,$00,$00,$00
L00068d:
	.dc.b	$1b,'[13;08HF10:',$00,$00,$00,$00
L00069d:
	.dc.b	$1b,'[04;48HF11:',$00,$00,$00,$00
L0006ad:
	.dc.b	$1b,'[05;48HF12:',$00,$00,$00,$00
L0006bd:
	.dc.b	$1b,'[06;48HF13:',$00,$00,$00,$00
L0006cd:
	.dc.b	$1b,'[07;48HF14:',$00,$00,$00,$00
L0006dd:
	.dc.b	$1b,'[08;48HF15:',$00,$00,$00,$00
L0006ed:
	.dc.b	$1b,'[09;48HF16:',$00,$00,$00,$00
L0006fd:
	.dc.b	$1b,'[10;48HF17:',$00,$00,$00,$00
L00070d:
	.dc.b	$1b,'[11;48HF18:',$00,$00,$00,$00
L00071d:
	.dc.b	$1b,'[12;48HF19:',$00,$00,$00,$00
L00072d:
	.dc.b	$1b,'[13;48HF20:',$00,$00,$00,$00
L00073d:
	.dc.b	$1b,'[15;01H(ROLL UP  )F21:',$00
L000755:
	.dc.b	$1b,'[16;01H(ROLL DOWN)F22:',$00
L00076d:
	.dc.b	$1b,'[17;01H(   INS   )F23:',$00
L000785:
	.dc.b	$1b,'[18;01H(   DEL   )F24:',$00
L00079d:
	.dc.b	$1b,'[15;27H(　　↑　 )F25:',$00
L0007b5:
	.dc.b	$1b,'[16;27H(　　←　 )F26:',$00
L0007cd:
	.dc.b	$1b,'[17;27H(　　→　 )F27:',$00
L0007e5:
	.dc.b	$1b,'[18;27H(　　↓　 )F28:',$00
L0007fd:
	.dc.b	$1b,'[15;53H(  CLR    )F29:',$00
L000815:
	.dc.b	$1b,'[16;53H(  HELP   )F30:',$00
L00082d:
	.dc.b	$1b,'[17;53H(  HOME   )F31:',$00
L000845:
	.dc.b	$1b,'[18;53H(  UNDO   )F32:',$00
L00085d:
	.dc.b	$1b,'[20;1H',$1b,'[Jキー番号:',$00
L000871:
	.dc.b	$1b,'[22;1H',$1b,'[Jキー機能:',$00
L000885:
	.dc.b	$0d,'終了しますか？[Y/N]',$00
L00089a:
	.dc.b	' を更新しますか？[Y/N]',$00
L0008b1:
	.dc.b	'ファイルの内容をシステムに登録しました',$0d,$0a,$00
L0008da:
	.dc.b	'ファイルが見つかりません',$0d,$0a,$00
L0008f5:
	.dc.b	'ファイルが読み込めません',$0d,$0a,$00
L000910:
	.dc.b	$50,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00
L000963:
	.dc.b	'KEY.SYS',$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
L0009b4:
	.dc.b	'KEY.SYS',$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

	.bss

L000a06:
	.ds.b	32
L000a26:
	.ds.b	1736
End:

	.end	Start
