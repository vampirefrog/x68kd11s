;=============================================
;  Filename attrib.x
;
;
;  Base address 000000
;  Exec address 000000
;  Text size    00025c byte(s)
;  Data size    0000be byte(s)
;  Bss  size    00108e byte(s)
;  44 Labels
;
;  Commandline dis  -b2 -h -m68000 --sp -q1 -B -M -o120 -gattrib.lab --overwrite attrib.x attrib.s
;          DIS version 3.16
;=============================================

	.include	inc/doscall.mac
	.include	inc/iocscall.mac
	.include	inc/fefunc.mac

	.cpu	68000

	.text

L000000:
	lea.l	(L0013a8),sp
	clr.b	(L000260)
	move.b	#$ff,(L000261)
	addq.l	#1,a2
L000016:
	bsr.w	L000240
	beq.w	L000232
	cmp.b	#$2d,d0			;'-'
	beq.s	L00007c
	cmp.b	#$2b,d0			;'+'
	bne.w	L0000e8
L00002c:
	move.b	(a2)+,d0
L00002e:
	or.b	#$20,d0
	cmp.b	#$73,d0			;'s'
	beq.s	L00005a
	cmp.b	#$72,d0			;'r'
	beq.s	L000050
	cmp.b	#$68,d0			;'h'
	bne.w	L000232
	bset.b	#$01,(L000260)
	bra.s	L000062

L000050:
	bset.b	#$00,(L000260)
	bra.s	L000062

L00005a:
	bset.b	#$02,(L000260)
L000062:
	move.b	(a2)+,d0
	beq.w	L000232
	cmp.b	#$2d,d0			;'-'
	beq.s	L00007c
	cmp.b	#$2b,d0			;'+'
	beq.s	L00002c
	cmp.b	#$20,d0			;' '
	beq.s	L000016
	bra.s	L00002e

L00007c:
	move.b	(a2)+,d0
L00007e:
	or.b	#$20,d0
	cmp.b	#$73,d0			;'s'
	beq.s	L0000ba
	cmp.b	#$72,d0			;'r'
	beq.s	L0000a8
	cmp.b	#$68,d0			;'h'
	bne.w	L000232
	bclr.b	#$01,(L000260)
	bclr.b	#$01,(L000261)
	bra.s	L0000ca

L0000a8:
	bclr.b	#$00,(L000260)
	bclr.b	#$00,(L000261)
	bra.s	L0000ca

L0000ba:
	bclr.b	#$02,(L000260)
	bclr.b	#$02,(L000261)
L0000ca:
	move.b	(a2)+,d0
	beq.w	L000232
	cmp.b	#$2d,d0			;'-'
	beq.s	L00007c
	cmp.b	#$2b,d0			;'+'
	beq.w	L00002c
	cmp.b	#$20,d0			;' '
	beq.w	L000016
	bra.s	L00007e

L0000e8:
	subq.l	#1,a2
	pea.l	(L00031a)
	move.l	a2,-(sp)
	DOS	_NAMESTS
	addq.l	#8,sp
	tst.l	d0
	bmi.w	L000216
	lea.l	(L00031a),a0
	cmpi.b	#$ff,(a0)
	beq.w	L000216
	move.b	($0001,a0),d0
	add.b	#$41,d0			;'A'
	move.b	d0,(a0)+
	move.b	#$3a,(a0)+		;':'
L000118:
	tst.b	(a0)+
	bne.s	L000118
	subq.l	#1,a0
	move.l	a0,(L00025c)
	move.w	#$ffff,-(sp)
	move.l	a2,-(sp)
	pea.l	(L000372)
	DOS	_FILES
	lea.l	($000a,sp),sp
	tst.l	d0
	bmi.w	L000224
L00013c:
	clr.w	d7
	move.b	(L000387),d7
	tst.b	(L000260)
	bne.s	L000156
	cmpi.b	#$ff,(L000261)
	beq.s	L000188
L000156:
	and.b	(L000261),d7
	or.b	(L000260),d7
	lea.l	(L000390),a0
	movea.l	(L00025c),a1
L00016e:
	move.b	(a0)+,(a1)+
	bne.s	L00016e
	move.w	d7,-(sp)
	pea.l	(L00031a)
	DOS	_CHMOD
	addq.l	#6,sp
	tst.l	d0
	bpl.s	L000188
	move.b	(L000387),d7
L000188:
	clr.w	d1
	move.b	#$41,d1			;'A'
	btst.l	#$05,d7
	bne.s	L000198
	move.b	#$2d,d1			;'-'
L000198:
	bsr.w	L00024c
	move.b	#$44,d1			;'D'
	btst.l	#$04,d7
	bne.s	L0001aa
	move.b	#$2d,d1			;'-'
L0001aa:
	bsr.w	L00024c
	move.b	#$56,d1			;'V'
	btst.l	#$03,d7
	bne.s	L0001bc
	move.b	#$2d,d1			;'-'
L0001bc:
	bsr.w	L00024c
	move.b	#$53,d1			;'S'
	btst.l	#$02,d7
	bne.s	L0001ce
	move.b	#$2d,d1			;'-'
L0001ce:
	bsr.s	L00024c
	move.b	#$48,d1			;'H'
	btst.l	#$01,d7
	bne.s	L0001de
	move.b	#$2d,d1			;'-'
L0001de:
	bsr.s	L00024c
	move.b	#$52,d1			;'R'
	btst.l	#$00,d7
	bne.s	L0001ee
	move.b	#$2d,d1			;'-'
L0001ee:
	bsr.s	L00024c
	moveq.l	#$09,d1
	bsr.s	L00024c
	lea.l	(L000390),a5
	bsr.s	L000254
	lea.l	(L000262),a5
	bsr.s	L000254
	pea.l	(L000372)
	DOS	_NFILES
	addq.l	#4,sp
	tst.l	d0
	bpl.w	L00013c
	DOS	_EXIT

L000216:
	lea.l	(L000265),a5
	bsr.s	L000254
	move.w	#$0002,-(sp)
	DOS	_EXIT2

L000224:
	lea.l	(L00027c),a5
	bsr.s	L000254
	move.w	#$0003,-(sp)
	DOS	_EXIT2

L000232:
	lea.l	(L000297),a5
	bsr.s	L000254
	move.w	#$0001,-(sp)
	DOS	_EXIT2

L000240:
	move.b	(a2)+,d0
	beq.s	L00024a
	cmp.b	#$20,d0			;' '
	beq.s	L000240
L00024a:
	rts

L00024c:
	move.w	d1,-(sp)
	DOS	_PUTCHAR
	addq.l	#2,sp
	rts

L000254:
	move.l	a5,-(sp)
	DOS	_PRINT
	addq.l	#4,sp
	rts


	.data

L00025c:
	.dc.l	L00031d
L000260:
	.dc.b	$00
L000261:
	.dc.b	$ff
L000262:
	.dc.b	$0d,$0a,$00
L000265:
	.dc.b	'ファイル名が異常です',$0d,$0a,$00
L00027c:
	.dc.b	'ファイルが見つかりません',$0d,$0a,$00
L000297:
	.dc.b	'使用法：attrib [スイッチ] ファイル名',$0d,$0a
	.dc.b	$09,'+r',$09,'読み出し専用属性設定',$0d,$0a
	.dc.b	$09,'-r',$09,'読み出し専用属性解除',$0d,$0a
	.dc.b	$09,'+h',$09,'不可視属性設定',$0d,$0a
	.dc.b	$09,'-h',$09,'不可視属性解除',$0d,$0a,$00

	.bss

L00031a:
	.ds.b	3
L00031d:
	.ds.b	85
L000372:
	.ds.b	21
L000387:
	.ds.b	9
L000390:
	.ds.b	4120
L0013a8:

	.end	L000000
