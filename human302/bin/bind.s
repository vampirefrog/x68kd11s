;=============================================
;  Filename human302/bin/bind.x
;
;
;  Base address 000000
;  Exec address 000000
;  Text size    00155c byte(s)
;  Data size    000556 byte(s)
;  Bss  size    00110a byte(s)
;  316 Labels
;
;  Commandline dis  -h -k -m68000 -q1 -B -M -w16 -o120 -ghuman302/bin/bind.lab --overwrite human302/bin/bind.x human302/bin/bind.s
;          DIS version 3.16
;=============================================

	.include	inc/doscall.mac
	.include	inc/iocscall.mac
	.include	inc/fefunc.mac

	.cpu	68000

	.text

Start:
	lea.l	(End),a7
	lea.l	(Start-$0000f0),a0
	lea.l	(End),a1
	suba.l	a0,a1
	move.l	a1,-(a7)
	move.l	a0,-(a7)
	DOS	_SETBLOCK
	addq.l	#8,a7
	pea.l	(L001588)
	DOS	_PRINT
	addq.l	#4,a7
	move.l	#$00ffffff,-(a7)
	DOS	_MALLOC
	sub.l	#$81000000,d0
	cmp.l	#$00000500,d0
	bcs	L0008be
	cmp.l	#$01000000,d0
	bcc	L0008be
	move.l	d0,d1
	move.l	d0,(a7)
	DOS	_MALLOC
	addq.l	#4,a7
	move.l	d0,(L001b3a)
	move.l	d1,(L001b3e)
	clr.b	(L001fb1)
	clr.b	(L001fb2)
	clr.b	(L001fb3)
	clr.b	(L001fb4)
	clr.b	(L001fb5)
	clr.b	(L001fb6)
	clr.b	(L001fb7)
	clr.b	(L001fb8)
	clr.b	(L001fb9)
	clr.b	(L001fba)
	clr.b	(L001fae)
	move.w	#$ffff,(L001b44)
	move.w	#$ffff,(L001b46)
	movea.l	(Start-$0000e0),a0
	addq.l	#1,a0
	lea.l	(L001b4a),a1
	lea.l	(L001c62),a2
	lea.l	(L001d7a),a3
	lea.l	(L001e92),a4
	bsr	L000fe4
	move.w	d0,(L001b42)
	move.b	d2,(L001faf)
	move.b	d3,(L001fb0)
	lea.l	(L001c62),a0
L0000ea:
	tst.b	(a0)
	beq	L000290
	bsr	L0011ca
L0000f4:
	move.b	(a0)+,d0
	beq	L0000ea
	cmp.b	#$75,d0			;'u'
	beq	L0001c6
	cmp.b	#$78,d0			;'x'
	beq	L000198
	cmp.b	#$64,d0			;'d'
	beq	L00016a
	cmp.b	#$6f,d0			;'o'
	beq	L00020a
	cmp.b	#$74,d0			;'t'
	beq	L000236
	cmp.b	#$61,d0			;'a'
	beq	L0001e8
	cmp.b	#$76,d0			;'v'
	beq	L000262
	cmp.b	#$62,d0			;'b'
	beq	L00026e
	cmp.b	#$6c,d0			;'l'
	bne	L0008d6
	move.b	(L001fb3),d0
	or.b	(L001fb2),d0
	or.b	(L001fb1),d0
	or.b	(L001fb7),d0
	or.b	(L001fb9),d0
	bne	L0008d6
	move.b	#-$01,(L001fb4)
	bra	L0000f4

L00016a:
	move.b	(L001fb4),d0
	or.b	(L001fb2),d0
	or.b	(L001fb1),d0
	or.b	(L001fb7),d0
	or.b	(L001fb9),d0
	bne	L0008d6
	move.b	#-$01,(L001fb3)
	bra	L0000f4

L000198:
	move.b	(L001fb4),d0
	or.b	(L001fb3),d0
	or.b	(L001fb1),d0
	or.b	(L001fb7),d0
	or.b	(L001fb9),d0
	bne	L0008d6
	move.b	#-$01,(L001fb2)
	bra	L0000f4

L0001c6:
	move.b	(L001fb4),d0
	or.b	(L001fb3),d0
	or.b	(L001fb2),d0
	bne	L0008d6
	move.b	#-$01,(L001fb1)
	bra	L0000f4

L0001e8:
	move.b	(L001fb4),d0
	or.b	(L001fb3),d0
	or.b	(L001fb2),d0
	bne	L0008d6
	move.b	#-$01,(L001fb7)
	bra	L0000f4

L00020a:
	move.b	(a3),d0
	beq	L0008d6
	cmp.b	#$2d,d0			;'-'
	beq	L0008d6
	cmp.b	#$2f,d0			;'/'
	beq	L0008d6
	tst.b	(L001fb5)
	bne	L0008d6
	move.b	#-$01,(L001fb5)
	bra	L0000f4

L000236:
	move.b	(a4),d0
	beq	L0008d6
	cmp.b	#$2d,d0			;'-'
	beq	L0008d6
	cmp.b	#$2f,d0			;'/'
	beq	L0008d6
	tst.b	(L001fb6)
	bne	L0008d6
	move.b	#-$01,(L001fb6)
	bra	L0000f4

L000262:
	move.b	#-$01,(L001fb8)
	bra	L0000f4

L00026e:
	move.b	(L001fb4),d0
	or.b	(L001fb3),d0
	or.b	(L001fb2),d0
	bne	L0008d6
	move.b	#-$01,(L001fb9)
	bra	L0000f4

L000290:
	move.b	(L001fb4),d0
	or.b	(L001fb3),d0
	or.b	(L001fb2),d0
	not.b	d0
	move.b	d0,(L001fb1)
	not.b	(L001fb9)
	and.b	d0,(L001fb9)
	move.w	(L001b42),d0
	tst.b	(L001fb5)
	bne	L0002dc
	tst.w	d0
	beq	L0008d6
	lea.l	(L001b4a),a1
	lea.l	(L001d7a),a0
	bsr	L001184
	subq.w	#1,d0
L0002dc:
	tst.b	(L001fb4)
	beq	L0002ec
	tst.w	d0
	bne	L0008d6
	bra	L0002f4

L0002ec:
	cmp.w	#$0001,d0
	bcs	L0008d6
L0002f4:
	lea.l	(L001e92),a0
	tst.b	(L001fb6)
	bne	L00032a
	lea.l	(L001c62),a0
	clr.b	(a0)
	move.l	a0,-(a7)
	clr.l	-(a7)
	pea.l	(L001aa7)
	DOS	_GETENV
	lea.l	($000c,a7),a7
	bsr	L00116a
	movea.l	a0,a1
	lea.l	(L001e92),a0
	bsr	L001184
L00032a:
	movea.l	a0,a2
	bsr	L0013b6
	movea.l	a2,a0
	bsr	L001222
	lea.l	(L001aad),a1
	tst.b	(a0)
	beq	L000346
	lea.l	(L001aac),a1
L000346:
	bsr	L0011a8
	movea.l	a2,a0
	bsr	L001266
	bsr	L001222
	clr.b	(a0)
	lea.l	(L001a9e),a1
	bsr	L001184
	movea.l	a2,a0
	bsr	L0011ca
	lea.l	(L001a9b),a2
	lea.l	(L001d7a),a1
	lea.l	(L001c62),a0
	bsr	L000df0
	tst.b	(L001fb4)
	bne	L000868
	tst.b	(L001fb1)
	bne	L00063c
	tst.b	(L001fb3)
	bne	L00052e
	clr.b	d2
	movea.l	(L001b3a),a3
	lea.l	(L001c62),a0
	bsr	L000e22
	move.l	a3,d1
	addq.l	#2,d1
	and.b	#$fe,d1
	movea.l	d1,a4
	move.l	(L001b3a),d4
	add.l	(L001b3e),d4
	sub.l	d1,d4
	and.w	#$fc00,d4
	cmp.l	#$00000400,d4
	bge	L0003dc
	lea.l	(L001fbb),a4
	move.l	#$00000400,d4
L0003dc:
	movea.l	(L001b3a),a3
	lea.l	(L001ab2),a0
	tst.l	($003c,a0)
	beq	L000934
	lea.l	(L001c62),a0
	bsr	L000d70
	move.w	d0,(L001b46)
	clr.b	d6
	tst.b	(L001fb5)
	bne	L00040c
L00040a:
	addq.b	#1,d6
L00040c:
	lea.l	(L001b4a),a0
	move.b	d6,d0
	bsr	L001388
	beq	L000522
	movea.l	a0,a1
	lea.l	(L001d7a),a0
	bsr	L001184
	bsr	L001222
	move.l	a0,(L001b36)
	tst.b	(a0)
	beq	L0008c6
	cmpi.b	#$2e,(a0)		;'.'
	beq	L0008c6
	lea.l	(L001a9b),a1
	bsr	L00139c
	movea.l	(L001b36),a0
	lea.l	(L001a5b),a1
	bsr	L000978
	lea.l	(L001f6e),a1
	bsr	L000f70
	movea.l	(L001b3a),a3
	clr.b	d3
L00046c:
	tst.b	(a3)
	beq	L000518
	movea.l	a3,a0
	lea.l	(L001f6e),a1
	bsr	L000b12
	bne	L000510
	lea.l	(L001d7a),a0
	bsr	L001266
	bsr	L001222
	bsr	L000ccc
	move.b	#$01,(L001fae)
	lea.l	(L001d7a),a0
	move.l	a0,(L001b36)
	lea.l	(L001c62),a1
	bsr	L001366
	beq	L00092c
	clr.w	d0
	move.b	($000b,a3),d0
	bsr	L000d94
	move.w	d0,(L001b44)
	move.b	#$02,(L001fae)
	clr.l	d5
	move.l	($0020,a3),d3
	move.l	($001c,a3),d2
	bsr	L000b70
	subq.l	#4,a7
	move.b	($0016,a3),($0003,a7)
	move.b	($0017,a3),($0002,a7)
	move.b	($0018,a3),($0001,a7)
	move.b	($0019,a3),(a7)
	move.w	(L001b44),-(a7)
	DOS	_FILEDATE
	addq.l	#6,a7
	swap.w	d0
	cmp.w	#$ffff,d0
	beq	L0008de
	bsr	L0009f2
	move.b	#-$01,d3
L000510:
	lea.l	($0024,a3),a3
	bra	L00046c

L000518:
	tst.b	d3
	beq	L000924
	bra	L00040a

L000522:
	clr.w	d0
	move.b	d0,(L001fae)
	bra	L00096e

L00052e:
	lea.l	(L001e92),a0
	bsr	L000d94
	move.w	d0,(L001b44)
	move.b	#-$01,(L001fae)
	movea.l	(L001b3a),a3
	lea.l	(L001b4a),a1
	lea.l	(L001a9b),a2
	lea.l	(L001d7a),a0
	clr.b	d2
	bsr	L000e1c
	lea.l	(L001ab2),a0
	tst.l	($003c,a0)
	beq	L000934
L000572:
	addq.b	#1,d2
	lea.l	(L001b4a),a0
	move.b	d2,d0
	bsr	L001388
	beq	L000616
	bsr	L001222
	tst.b	(a0)
	beq	L0008c6
	cmpi.b	#$2e,(a0)		;'.'
	beq	L0008c6
	movea.l	a0,a1
	lea.l	(L001d7a),a0
	bsr	L001184
	lea.l	(L001a9b),a1
	bsr	L00139c
	lea.l	(L001d7a),a0
	move.l	a0,(L001b36)
	lea.l	(L001a4b),a1
	bsr	L000978
	lea.l	(L001f6e),a1
	bsr	L000f70
	movea.l	(L001b3a),a0
	clr.b	d3
L0005d4:
	tst.b	(a0)
	beq	L00060c
	cmpi.b	#$e5,(a0)
	beq	L000606
	lea.l	(L001f6e),a1
	bsr	L000b12
	bne	L000606
	btst.b	#$00,($001b,a0)
	bne	L000914
	btst.b	#$02,($001b,a0)
	bne	L000914
	move.b	#$e5,(a0)
	move.b	#-$01,d3
L000606:
	lea.l	($0024,a0),a0
	bra	L0005d4

L00060c:
	tst.b	d3
	beq	L00091c
	bra	L000572

L000616:
	movea.l	(L001b3a),a3
	clr.b	d3
L00061e:
	tst.b	(a3)
	beq	L000632
	cmpi.b	#$e5,(a3)
	beq	L00062c
	move.b	#-$01,d3
L00062c:
	lea.l	($0024,a3),a3
	bra	L00061e

L000632:
	tst.b	d3
	beq	L0008ce
	bra	L000738

L00063c:
	lea.l	(L001e92),a0
	bsr	L000d94
	move.w	d0,(L001b44)
	move.b	#-$01,d2
	move.b	d2,(L001fae)
	movea.l	(L001b3a),a3
L00065c:
	addq.b	#1,d2
	lea.l	(L001b4a),a0
	move.b	d2,d0
	bsr	L001388
	beq	L000680
	movea.l	a0,a1
	lea.l	(L001a9b),a2
	lea.l	(L001d7a),a0
	bsr	L000e1c
	bra	L00065c

L000680:
	movea.l	(L001b3a),a3
L000686:
	tst.b	(a3)
	beq	L000738
	cmpi.b	#$e5,(a3)
	beq	L000730
	lea.l	(L001d7a),a0
	bsr	L000ccc
	lea.l	(L001a8b),a1
	tst.b	(L001fb5)
	bne	L0006b8
	tst.b	($001a,a3)
	beq	L0006bc
	lea.l	(L001a7b),a1
L0006b8:
	bsr	L000978
L0006bc:
	lea.l	($0024,a3),a2
L0006c0:
	tst.b	(a2)
	beq	L000730
	cmpi.b	#$e5,(a2)
	beq	L00072a
	movea.l	a3,a0
	movea.l	a2,a1
	bsr	L000b12
	bne	L00072a
	move.b	($001b,a3),d0
	and.b	(L001fb0),d0
	bsr	L000b4e
	bcs	L000722
	movem.l	d0/a0-a1,-(a7)
	lea.l	(L001d7a),a0
	bsr	L000ccc
	lea.l	(L001a6b),a1
	bsr	L000978
	movem.l	(a7)+,d0/a0-a1
	btst.l	#$00,d0
	bne	L0008b6
	btst.l	#$02,d0
	bne	L0008b6
	move.w	#$0023,d1		;'#'
L000714:
	move.b	(a1)+,(a0)+
	dbra	d1,L000714
	move.b	#-$01,d3
	or.b	#$20,d0
L000722:
	move.b	d0,($001b,a3)
	move.b	#$e5,(a2)
L00072a:
	lea.l	($0024,a2),a2
	bra	L0006c0

L000730:
	lea.l	($0024,a3),a3
	bra	L000686

L000738:
	clr.l	d5
	movea.l	(L001b3a),a3
L000740:
	tst.b	(a3)
	beq	L000770
	cmpi.b	#$e5,(a3)
	beq	L00076a
	add.l	($0020,a3),d5
	tst.b	(L001fb5)
	bne	L00075c
	tst.b	($001a,a3)
	beq	L00076a
L00075c:
	move.b	($001b,a3),d0
	or.b	(L001faf),d0
	move.b	d0,($001b,a3)
L00076a:
	lea.l	($0024,a3),a3
	bra	L000740

L000770:
	move.l	a3,d1
	addq.l	#2,d1
	and.b	#$fe,d1
	movea.l	d1,a4
	move.l	(L001b3a),d4
	add.l	(L001b3e),d4
	sub.l	d1,d4
	and.w	#$fc00,d4
	cmp.l	#$00000400,d4
	bge	L0007a0
	lea.l	(L001fbb),a4
	move.l	#$00000400,d4
L0007a0:
	movea.l	(L001b3a),a3
L0007a6:
	tst.b	(a3)
	beq	L00080a
	cmpi.b	#$e5,(a3)
	beq	L000804
	lea.l	(L001b4a),a0
	move.b	($001a,a3),d0
	bsr	L001388
	movea.l	a0,a1
	lea.l	(L001a9b),a2
	lea.l	(L001d7a),a0
	bsr	L000df0
	bsr	L0011ca
	bsr	L000d70
	move.w	d0,(L001b46)
	move.w	(L001b44),d0
	bsr	L000c0a
	move.l	d0,-(a7)
	move.l	($0020,a3),d3
	move.l	($001c,a3),d2
	bsr	L000b70
	move.l	(a7)+,($001c,a3)
	clr.b	($001a,a3)
	bsr	L000a0e
	clr.l	d5
L000804:
	lea.l	($0024,a3),a3
	bra	L0007a6

L00080a:
	movea.l	(L001b3a),a3
	movea.l	a3,a2
L000812:
	tst.b	(a3)
	beq	L000830
	cmpi.b	#$e5,(a3)
	beq	L00082a
	move.w	#$001f,d0
L000820:
	move.b	(a3)+,(a2)+
	dbra	d0,L000820
	addq.l	#4,a3
	bra	L000812

L00082a:
	lea.l	($0024,a3),a3
	bra	L000812

L000830:
	movea.l	(L001b3a),a0
	suba.l	a0,a2
	move.l	a2,-(a7)
	move.l	a0,-(a7)
	move.w	(L001b44),-(a7)
	DOS	_WRITE
	lea.l	($000a,a7),a7
	tst.l	d0
	bmi	L0008de
	move.w	(L001b44),d0
	bsr	L000c0a
	move.l	d0,d3
	bsr	L0009f2
	bsr	L000a2a
	clr.w	d0
	bra	L00096e

L000868:
	clr.b	d2
	movea.l	(L001b3a),a3
	lea.l	(L001c62),a0
	bsr	L000e22
	lea.l	(L001ab2),a0
	tst.l	($003c,a0)
	beq	L000934
	clr.w	(L001b48)
	movea.l	(L001b3a),a3
L000894:
	bsr	L000c18
	addq.w	#1,(L001b48)
	lea.l	($0024,a3),a3
	tst.b	(a3)
	bne	L000894
	tst.w	(L001b48)
	beq	L00093c
	clr.w	d0
	bra	L00096e

L0008b6:
	lea.l	(L001795),a0
	bra	L0008ec

L0008be:
	lea.l	(L0018bf),a0
	bra	L0008ec

L0008c6:
	lea.l	(L00172f),a0
	bra	L0008ec

L0008ce:
	lea.l	(L00176d),a0
	bra	L0008ec

L0008d6:
	lea.l	(L0015b8),a0
	bra	L0008ec

L0008de:
	move.b	(L001fae),d0
	bgt	L0008f2
	lea.l	(L001829),a0
L0008ec:
	bsr	L00142c
	bra	L00096c

L0008f2:
	cmp.b	#$02,d0
	bhi	L000900
	lea.l	(L001853),a0
	bra	L000962

L000900:
	lea.l	(L001c62),a0
	move.l	a0,(L001b36)
	lea.l	(L0018dd),a0
	bra	L000962

L000914:
	lea.l	(L001795),a0
	bra	L000962

L00091c:
	lea.l	(L001905),a0
	bra	L000962

L000924:
	lea.l	(L001933),a0
	bra	L000962

L00092c:
	lea.l	(L00187f),a0
	bra	L000962

L000934:
	lea.l	(L001801),a0
	bra	L000962

L00093c:
	lea.l	(L0017d9),a0
	bra	L000962

L000944:
	lea.l	(L001963),a0
	bra	L000962

L00094c:
	lea.l	(L00174d),a0
	bra	L000962

L000954:
	lea.l	(L00172f),a0
	bra	L000962

L00095c:
	lea.l	(L0017b7),a0
L000962:
	movea.l	a0,a1
	movea.l	(L001b36),a0
	bsr	L000980
L00096c:
	moveq.l	#$01,d0
L00096e:
	move.w	d0,-(a7)
	bsr	L000a0e
	bsr	L0009ac
	DOS	_EXIT2

L000978:
	tst.b	(L001fb8)
	beq	L0009aa
L000980:
	movem.l	d0/a0-a1,-(a7)
	move.l	a0,-(a7)
	movea.l	a1,a0
	bsr	L00142c
	lea.l	(L00199b),a0
	bsr	L00142c
	movea.l	(a7)+,a0
	bsr	L00142c
	lea.l	(L0019a2),a0
	bsr	L00142c
	movem.l	(a7)+,d0/a0-a1
L0009aa:
	rts

L0009ac:
	bsr	L0009f2
	lea.l	(L001e92),a0
	move.b	(L001fae),d0
	bmi	L0009de
	lea.l	(L001d7a),a0
	cmp.b	#$02,d0
	beq	L0009de
	blt	L0009f0
	lea.l	(L001e92),a0
	cmp.b	#$03,d0
	beq	L0009de
	bsr	L0009de
	lea.l	(L001c62),a0
L0009de:
	move.l	a1,-(a7)
	lea.l	(L001a3d),a1
	bsr	L000978
	movea.l	(a7)+,a1
	move.l	a0,-(a7)
	DOS	_DELETE
	addq.l	#4,a7
L0009f0:
	rts

L0009f2:
	tst.w	(L001b44)
	bmi	L000a0c
	move.w	(L001b44),-(a7)
	DOS	_CLOSE
	addq.l	#2,a7
	move.w	#$ffff,(L001b44)
L000a0c:
	rts

L000a0e:
	tst.w	(L001b46)
	bmi	L000a28
	move.w	(L001b46),-(a7)
	DOS	_CLOSE
	addq.l	#2,a7
	move.w	#$ffff,(L001b46)
L000a28:
	rts

L000a2a:
	lea.l	(L001e92),a0
	lea.l	(L001c62),a1
	move.b	(a0),d0
	or.b	#$20,d0
	move.b	(a1),d1
	or.b	#$20,d1
	cmp.b	d0,d1
	beq	L000aa8
	bsr	L000d70
	move.w	d0,(L001b46)
	move.b	#$03,(L001fae)
	movea.l	a1,a0
	bsr	L000d94
	move.w	d0,(L001b44)
	move.b	#$04,(L001fae)
	move.l	(L001b3a),d1
	addq.l	#1,d1
	and.b	#$fe,d1
	movea.l	d1,a4
	add.l	(L001b3e),d4
	sub.l	d1,d4
	and.w	#$fc00,d4
	cmp.l	#$00000400,d4
	bge	L000a9a
	lea.l	(L001fbb),a4
	move.l	#$00000400,d4
L000a9a:
	bsr	L000bcc
	move.b	#$03,(L001fae)
	rts

L000aa8:
	move.w	#$003f,-(a7)		;'?'
	pea.l	(L001c62)
	pea.l	(L001f32)
	DOS	_FILES
	lea.l	($000a,a7),a7
	tst.l	d0
	bmi	L000ad2
	pea.l	(L001c62)
	DOS	_DELETE
	addq.l	#4,a7
	tst.l	d0
	bmi	L000900
L000ad2:
	movem.l	a0-a1,-(a7)
	lea.l	(L001a2f),a1
	lea.l	(L001e92),a0
	bsr	L000978
	lea.l	(L001a21),a1
	lea.l	(L001c62),a0
	bsr	L000978
	movem.l	(a7)+,a0-a1
	pea.l	(L001c62)
	pea.l	(L001e92)
	DOS	_RENAME
	addq.l	#8,a7
	tst.l	d0
	bmi	L000900
	rts

L000b12:
	link.w	a6,#-$0018
	movem.l	d0/a0-a1,-(a7)
	move.l	a0,-(a7)
	lea.l	(-$000c,a6),a0
	move.w	#$000b,d0
	bsr	L001192
	bsr	L0011ca
	movea.l	(a7)+,a1
	lea.l	(-$0018,a6),a0
	move.w	#$000b,d0
	bsr	L001192
	bsr	L0011ca
	lea.l	(-$000c,a6),a1
	bsr	L001366
	movem.l	(a7)+,d0/a0-a1
	unlk	a6
	rts

L000b4e:
	movem.l	d0-d1/a0-a1,-(a7)
	lea.l	($001a,a0),a0
	lea.l	($001a,a1),a1
	move.w	#$0003,d0
L000b5e:
	subq.l	#1,a0
	subq.l	#1,a1
	move.b	(a1),d1
	cmp.b	(a0),d1
	dbne	d0,L000b5e
	movem.l	(a7)+,d0-d1/a0-a1
	rts

L000b70:
	clr.w	-(a7)
	move.l	d2,-(a7)
	move.w	(L001b46),-(a7)
	DOS	_SEEK
	addq.l	#8,a7
	tst.l	d0
	bmi	L00095c
	move.w	(L001b46),d0
	bsr	L000dc0
	move.l	d5,(L001aee)
	move.l	#$00000040,-(a7)
	pea.l	(L001ab2)
	move.w	(L001b44),-(a7)
	DOS	_WRITE
	lea.l	($000a,a7),a7
	tst.l	d0
	bmi	L0008de
	add.l	#$00000040,d2
	clr.w	-(a7)
	move.l	d2,-(a7)
	move.w	(L001b46),-(a7)
	DOS	_SEEK
	addq.l	#8,a7
	sub.l	#$00000040,d3
L000bcc:
	tst.l	d3
	beq	L000c08
	move.l	d3,d1
	cmp.l	d4,d1
	bcs	L000bd8
	move.l	d4,d1
L000bd8:
	move.l	d1,-(a7)
	move.l	a4,-(a7)
	move.w	(L001b46),-(a7)
	DOS	_READ
	lea.l	($000a,a7),a7
	cmp.l	d0,d1
	bne	L00095c
	move.l	d1,-(a7)
	move.l	a4,-(a7)
	move.w	(L001b44),-(a7)
	DOS	_WRITE
	lea.l	($000a,a7),a7
	cmp.l	d0,d1
	bne	L0008de
	sub.l	d1,d3
	bra	L000bcc

L000c08:
	rts

L000c0a:
	move.w	#$0001,-(a7)
	clr.l	-(a7)
	move.w	d0,-(a7)
	DOS	_SEEK
	addq.l	#8,a7
	rts

L000c18:
	link.w	a6,#-$0118
	move.w	(L001b48),d0
	and.w	#$001f,d0
	bne	L000c32
	pea.l	(L0019a6)
	DOS	_PRINT
	addq.l	#4,a7
L000c32:
	bsr	L001440
	clr.l	d0
	move.w	(L001b48),d0
	lea.l	(-$0118,a6),a0
	bsr	L0013c4
	pea.l	($0007,a0)
	DOS	_PRINT
	addq.l	#4,a7
	bsr	L001440
	btst.b	#$01,($001b,a3)
	bne	L000cbe
	bsr	L000ccc
	move.l	a0,-(a7)
	DOS	_PRINT
	addq.l	#4,a7
	bsr	L0011bc
	sub.l	#$00000017,d0
	neg.l	d0
	bsr	L00141e
	move.l	($0020,a3),d0
	bsr	L0013c4
	pea.l	(a0)
	DOS	_PRINT
	addq.l	#4,a7
	bsr	L001440
	move.b	($0019,a3),d0
	asl.w	#8,d0
	or.b	($0018,a3),d0
	bsr	L00144a
	bsr	L001440
	move.b	($0017,a3),d0
	asl.w	#8,d0
	or.b	($0016,a3),d0
	bsr	L0014b6
	bsr	L001440
	move.b	($000b,a3),d0
	bsr	L00151e
	pea.l	(L001a1e)
	DOS	_PRINT
	addq.l	#4,a7
	unlk	a6
	rts

L000cbe:
	pea.l	(L0019e6)
	DOS	_PRINT
	addq.l	#4,a7
	unlk	a6
	rts

L000ccc:
	move.l	a0,-(a7)
	lea.l	($0000.w,a3),a1
	move.w	#$0008,d0
	bsr	L001192
	cmpi.b	#$05,(a0)
	bne	L000ce4
	move.b	#$e5,(a0)
L000ce4:
	bsr	L0013b6
	lea.l	($000c,a3),a1
	move.w	#$000a,d0
	bsr	L001192
	bsr	L0011bc
	adda.l	d0,a0
	move.b	#$2e,(a0)+		;'.'
	lea.l	($0008,a3),a1
	move.w	#$0003,d0
	bsr	L001192
	bsr	L0013b6
	movea.l	(a7)+,a0
	rts

L000d12:
	move.l	#$00000020,-(a7)
	pea.l	(L001f8e)
	move.w	d0,-(a7)
	DOS	_READ
	lea.l	($000a,a7),a7
	cmp.l	#$00000020,d0
	blt	L00093c
	rts

L000d32:
	move.w	#$001f,d1
	lea.l	(L001f6e),a0
	lea.l	(L001f8e),a1
L000d42:
	move.b	(a1)+,(a0)+
	dbra	d1,L000d42
	move.l	#$00000020,-(a7)
	pea.l	(L001f8e)
	move.w	d0,-(a7)
	DOS	_READ
	lea.l	($000a,a7),a7
	tst.l	d0
	bmi	L00093c
	beq	L000d6e
	cmp.l	#$00000020,d0
	bne	L00093c
L000d6e:
	rts

L000d70:
	move.l	a1,-(a7)
	lea.l	(L001a2f),a1
	bsr	L000978
	movea.l	(a7)+,a1
	clr.w	-(a7)
	move.l	a0,-(a7)
	DOS	_OPEN
	addq.l	#6,a7
	move.l	a0,(L001b36)
	tst.l	d0
	bmi	L00094c
	rts

L000d94:
	cmpi.b	#$01,(L001fae)
	beq	L000da2
	move.w	#$0020,d0		;' '
L000da2:
	move.l	a1,-(a7)
	lea.l	(L001a21),a1
	bsr	L000978
	movea.l	(a7)+,a1
	move.w	d0,-(a7)
	move.l	a0,-(a7)
	DOS	_CREATE
	addq.l	#6,a7
	tst.l	d0
	bmi	L0008de
	rts

L000dc0:
	move.l	#$00000041,-(a7)
	pea.l	(L001ab2)
	move.w	d0,-(a7)
	DOS	_READ
	lea.l	($000a,a7),a7
	cmp.l	#$00000041,d0
	blt	L00095c
	lea.l	(L001ab2),a0
	cmpi.w	#$4855,($0000.w,a0)	;'HU'
	bne	L00095c
	rts

L000df0:
	bsr	L001184
	move.l	a0,-(a7)
	bsr	L001222
	move.l	(a7),(L001b36)
	tst.b	(a0)
	beq	L000954
	cmpi.b	#$2e,(a0)		;'.'
	beq	L000954
	movea.l	a2,a1
	bsr	L00139c
	movea.l	(a7)+,a0
	bsr	L001266
	rts

L000e1c:
	bsr	L000df0
	bsr	L0011ca
L000e22:
	bsr	L000d70
	move.w	d0,(L001b46)
	bsr	L000dc0
	lea.l	(L001ab2),a0
	tst.l	($003c,a0)
	beq	L000ef0
	move.b	(L001fba),d0
	or.b	(L001fb9),d0
	tst.b	(L001fba)
	bne	L000944
	move.b	d0,(L001fba)
	clr.w	-(a7)
	move.l	($003c,a0),-(a7)
	move.w	(L001b46),-(a7)
	DOS	_SEEK
	addq.l	#8,a7
	tst.l	d0
	bmi	L00093c
	clr.w	(L001b48)
	move.w	(L001b46),d0
	bsr	L000d12
L000e7e:
	move.w	(L001b46),d0
	bsr	L000d32
	tst.l	d0
	bne	L000e9c
	clr.b	(L001f8e)
	move.l	(L001aee),(L001faa)
L000e9c:
	lea.l	(L001f6e),a0
	move.b	d2,($001a,a0)
	move.l	(L001b3a),d0
	add.l	(L001b3e),d0
	sub.l	#$00000024,d0
	cmp.l	a3,d0
	bcs	L0008be
	move.w	#$001f,d0
L000ec2:
	move.b	(a0)+,(a3)+
	dbra	d0,L000ec2
	move.l	(L001faa),d0
	sub.l	(L001f8a),d0
	move.l	d0,(a3)+
	addq.w	#1,(L001b48)
	tst.b	(L001f8e)
	bne	L000e7e
	tst.w	(L001b48)
	beq	L00093c
	bra	L000f1a

L000ef0:
	move.l	(L001b3a),d0
	add.l	(L001b3e),d0
	sub.l	#$00000024,d0
	cmp.l	a3,d0
	bcs	L0008be
	movea.l	a3,a1
	lea.l	(L001d7a),a0
	bsr	L000f22
	move.b	d2,($001a,a3)
	lea.l	($0024,a3),a3
L000f1a:
	clr.b	(a3)
	bsr	L000a0e
	rts

L000f22:
	move.w	#$003f,-(a7)		;'?'
	move.l	a0,-(a7)
	pea.l	(L001f32)
	DOS	_FILES
	lea.l	($000a,a7),a7
	lea.l	(L001f50),a0
	movea.l	a1,a2
	bsr	L000f76
	move.b	(L001f47),($000b,a2)
	clr.b	($001b,a2)
	move.l	(L001f4c),($0020,a2)
	lea.l	($0016,a2),a1
	move.b	(L001f49),(a1)+
	move.b	(L001f48),(a1)+
	move.b	(L001f4b),(a1)+
	move.b	(L001f4a),(a1)
	rts

L000f70:
	movea.l	a1,a2
	bsr	L000f76
	rts

L000f76:
	cmpi.b	#$e5,(a0)
	bne	L000f80
	move.b	#$05,(a0)
L000f80:
	move.w	#$000a,d0
L000f84:
	move.b	#$20,(a1)+		;' '
	dbra	d0,L000f84
	move.w	#$0014,d0
L000f90:
	clr.b	(a1)+
	dbra	d0,L000f90
	movea.l	a2,a1
	move.w	#$0007,d1
L000f9c:
	move.b	(a0)+,d0
	beq	L000fe2
	cmp.b	#$2e,d0			;'.'
	beq	L000fd0
	move.b	d0,(a1)+
	dbra	d1,L000f9c
	lea.l	($000c,a2),a1
	move.w	#$0009,d1
L000fb4:
	move.b	(a0)+,d0
	beq	L000fe2
	cmp.b	#$2e,d0			;'.'
	beq	L000fd0
	move.b	d0,(a1)+
	dbra	d1,L000fb4
L000fc4:
	move.b	(a0)+,d0
	beq	L000fe2
	cmp.b	#$2e,d0			;'.'
	beq	L000fd0
	bra	L000fc4

L000fd0:
	lea.l	($0008,a2),a1
	move.w	#$0002,d1
L000fd8:
	move.b	(a0)+,d0
	beq	L000fe2
	move.b	d0,(a1)+
	dbra	d1,L000fd8
L000fe2:
	rts

L000fe4:
	movem.l	d1/a0-a4,-(a7)
	clr.w	d1
	clr.b	d2
	move.b	#-$01,d3
L000ff0:
	bsr	L00116a
	adda.l	d0,a0
	tst.b	(a0)
	beq	L001124
	move.b	(a0)+,d0
	cmp.b	#$2d,d0			;'-'
	beq	L00100c
	cmp.b	#$2f,d0			;'/'
	bne	L0010d4
L00100c:
	move.b	(a0)+,d0
	beq	L001124
	cmp.b	#$09,d0
	beq	L0010ce
	cmp.b	#$20,d0			;' '
	beq	L0010ce
	move.b	d0,(a2)+
	or.b	#$20,d0
	cmp.b	#$6f,d0			;'o'
	bne	L00104e
	bsr	L00116a
	adda.l	d0,a0
L001034:
	move.b	(a0)+,d0
	beq	L001124
	cmp.b	#$09,d0
	beq	L0010ce
	cmp.b	#$20,d0			;' '
	beq	L0010ce
	move.b	d0,(a3)+
	bra	L001034

L00104e:
	cmp.b	#$74,d0			;'t'
	bne	L001070
	bsr	L00116a
	adda.l	d0,a0
L00105a:
	move.b	(a0)+,d0
	beq	L001124
	cmp.b	#$09,d0
	beq	L0010ce
	cmp.b	#$20,d0			;' '
	beq	L0010ce
	move.b	d0,(a4)+
	bra	L00105a

L001070:
	cmp.b	#$61,d0			;'a'
	bne	L0010ce
	bsr	L00116a
	adda.l	d0,a0
L00107c:
	move.b	(a0)+,d0
	beq	L001124
	cmp.b	#$2d,d0			;'-'
	beq	L0010a6
	cmp.b	#$2b,d0			;'+'
	bne	L0010c2
L00108e:
	move.b	(a0),d0
	beq	L001124
	or.b	#$20,d0
	bsr	L001138
	tst.b	d0
	beq	L00107c
	or.b	d0,d2
	addq.l	#1,a0
	bra	L00108e

L0010a6:
	move.b	(a0),d0
	beq	L001124
	or.b	#$20,d0
	bsr	L001138
	tst.b	d0
	beq	L00107c
	not.b	d0
	and.b	d0,d3
	addq.l	#1,a0
	bra	L0010a6

L0010be:
	move.b	(a0)+,d0
	beq	L001124
L0010c2:
	cmp.b	#$09,d0
	beq	L0010ce
	cmp.b	#$20,d0			;' '
	bne	L0010be
L0010ce:
	clr.b	(a2)+
	bra	L000ff0

L0010d4:
	addq.w	#1,d1
L0010d6:
	move.b	d0,(a1)+
	cmp.b	#$22,d0			;'"'
	bne	L0010ec
L0010de:
	move.b	(a0)+,d0
	beq	L001124
	move.b	d0,(a1)+
	cmp.b	#$22,d0			;'"'
	bne	L0010de
	bra	L0010fe

L0010ec:
	cmp.b	#$27,d0			;'''
	bne	L0010fe
L0010f2:
	move.b	(a0)+,d0
	beq	L001124
	move.b	d0,(a1)+
	cmp.b	#$27,d0			;'''
	bne	L0010f2
L0010fe:
	move.b	(a0),d0
	beq	L001124
	cmp.b	#$2f,d0			;'/'
	beq	L00111e
	cmp.b	#$2d,d0			;'-'
	beq	L00111e
	addq.l	#1,a0
	cmp.b	#$09,d0
	beq	L00111e
	cmp.b	#$20,d0			;' '
	beq	L00111e
	bra	L0010d6

L00111e:
	clr.b	(a1)+
	bra	L000ff0

L001124:
	clr.b	(a1)+
	clr.b	(a1)
	clr.b	(a2)+
	clr.b	(a2)
	clr.b	(a3)
	clr.b	(a4)
	move.w	d1,d0
	movem.l	(a7)+,d1/a0-a4
	rts

L001138:
	move.l	d1,-(a7)
	move.b	#$01,d1
	cmp.b	#$72,d0			;'r'
	beq	L001164
	move.b	#$02,d1
	cmp.b	#$68,d0			;'h'
	beq	L001164
	move.b	#$04,d1
	cmp.b	#$73,d0			;'s'
	beq	L001164
	move.b	#$20,d1			;' '
	cmp.b	#$61,d0			;'a'
	beq	L001164
	clr.b	d1
L001164:
	move.b	d1,d0
	move.l	(a7)+,d1
	rts

L00116a:
	move.l	a0,-(a7)
L00116c:
	move.b	(a0)+,d0
	cmpi.b	#$20,d0			;' '
	beq	L00116c
	cmpi.b	#$09,d0
	beq	L00116c
	move.l	a0,d0
	movea.l	(a7)+,a0
	sub.l	a0,d0
	subq.l	#1,d0
	rts

L001184:
	movem.l	a0-a1,-(a7)
L001188:
	move.b	(a1)+,(a0)+
	bne	L001188
	movem.l	(a7)+,a0-a1
	rts

L001192:
	movem.l	a0-a1,-(a7)
	bra	L00119c

L001198:
	move.b	(a1)+,(a0)+
	beq	L0011a2
L00119c:
	dbra	d0,L001198
	clr.b	(a0)
L0011a2:
	movem.l	(a7)+,a0-a1
	rts

L0011a8:
	movem.l	a0-a1,-(a7)
L0011ac:
	tst.b	(a0)+
	bne	L0011ac
	subq.l	#1,a0
L0011b2:
	move.b	(a1)+,(a0)+
	bne	L0011b2
	movem.l	(a7)+,a0-a1
	rts

L0011bc:
	move.l	a0,-(a7)
	moveq.l	#$ff,d0
L0011c0:
	addq.l	#1,d0
	tst.b	(a0)+
	bne	L0011c0
	movea.l	(a7)+,a0
	rts

L0011ca:
	movem.l	d0-d1/a0,-(a7)
	clr.b	d1
L0011d0:
	move.b	(a0),d0
	beq	L00120a
	tst.b	d1
	beq	L0011dc
	clr.b	d1
	bra	L0011f2

L0011dc:
	cmp.b	#$80,d0
	bcs	L0011f6
	cmp.b	#$a0,d0
	bcs	L0011ee
	cmp.b	#$e0,d0
	bcs	L0011f6
L0011ee:
	move.b	#$01,d1
L0011f2:
	addq.l	#1,a0
	bra	L0011d0

L0011f6:
	cmpi.b	#$41,d0			;'A'
	bcs	L001206
	cmpi.b	#$5a,d0			;'Z'
	bhi	L001206
	add.b	#$20,d0			;' '
L001206:
	move.b	d0,(a0)+
	bra	L0011d0

L00120a:
	movem.l	(a7)+,d0-d1/a0
	rts

L001210:
	cmpi.b	#$61,d0			;'a'
	bcs	L001220
	cmpi.b	#$7a,d0			;'z'
	bhi	L001220
	sub.b	#$20,d0			;' '
L001220:
	rts

L001222:
	movem.l	d0-d1,-(a7)
	clr.b	d1
	move.l	a0,-(a7)
L00122a:
	move.b	(a0)+,d0
	beq	L00125e
	tst.b	d1
	beq	L001236
	clr.b	d1
	bra	L00122a

L001236:
	cmp.b	#$80,d0
	bcs	L00124e
	cmp.b	#$a0,d0
	bcs	L001248
	cmp.b	#$e0,d0
	bcs	L00124e
L001248:
	move.b	#$01,d1
	bra	L00122a

L00124e:
	cmp.b	#$5c,d0			;'\'
	beq	L00125a
	cmp.b	#$3a,d0			;':'
	bne	L00122a
L00125a:
	move.l	a0,(a7)
	bra	L00122a

L00125e:
	movea.l	(a7)+,a0
	movem.l	(a7)+,d0-d1
	rts

L001266:
	link.w	a6,#-$0118
	movem.l	d0-d2/a0-a3,-(a7)
	lea.l	(-$0118,a6),a1
	move.l	a0,-(a7)
	clr.w	d1
	move.b	($0001,a0),d0
	cmp.b	#$3a,d0			;':'
	bne	L001290
	move.b	(a0)+,d0
	bsr	L001210
	move.b	d0,(a1)+
	sub.b	#$40,d0			;'@'
	move.b	(a0)+,(a1)+
	move.w	d0,d1
	bra	L0012a0

L001290:
	DOS	_CURDRV
	move.b	d0,d1
	addq.b	#1,d1
	add.b	#$41,d0			;'A'
	move.b	d0,(a1)+
	move.b	#$3a,(a1)+		;':'
L0012a0:
	movea.l	a0,a2
	clr.b	d2
L0012a4:
	move.b	(a2)+,d0
	beq	L0012d6
	tst.b	d2
	beq	L0012b0
	clr.b	d2
	bra	L0012a4

L0012b0:
	cmp.b	#$80,d0
	bcs	L0012c8
	cmp.b	#$a0,d0
	bcs	L0012c2
	cmp.b	#$e0,d0
	bcs	L0012c8
L0012c2:
	move.b	#$01,d2
	bra	L0012a4

L0012c8:
	cmp.b	#$5c,d0			;'\'
	beq	L0012d0
	bra	L0012a4

L0012d0:
	cmpi.b	#$5c,(a0)		;'\'
	beq	L0012f2
L0012d6:
	move.b	#$5c,(a1)+		;'\'
	move.l	a1,-(a7)
	move.w	d1,-(a7)
	DOS	_CURDIR
	addq.l	#6,a7
	movea.l	a1,a2
L0012e4:
	tst.b	(a1)+
	bne	L0012e4
	subq.l	#1,a1
	cmpa.l	a1,a2
	beq	L0012f2
	move.b	#$5c,(a1)+		;'\'
L0012f2:
	move.b	(a0)+,(a1)+
	bne	L0012f2
	clr.b	d2
	movea.l	(a7)+,a0
	lea.l	(-$0118,a6),a1
	lea.l	(a7),a3
	clr.l	-(a7)
L001302:
	move.b	(a1)+,d0
	tst.b	d2
	beq	L00130c
	clr.b	d2
	bra	L001358

L00130c:
	cmp.b	#$80,d0
	bcs	L001324
	cmp.b	#$a0,d0
	bcs	L00131e
	cmp.b	#$e0,d0
	bcs	L001324
L00131e:
	move.b	#$01,d2
	bra	L001358

L001324:
	cmp.b	#$5c,d0			;'\'
	bne	L001358
	cmpi.b	#$2e,(a1)		;'.'
	bne	L001356
	cmpi.b	#$5c,($0001,a1)		;'\'
	beq	L001352
	cmpi.b	#$2e,($0001,a1)		;'.'
	bne	L001356
	cmpi.b	#$5c,($0002,a1)		;'\'
	bne	L001356
	move.l	(a7)+,d1
	beq	L001358
	movea.l	d1,a0
	addq.l	#2,a1
	bra	L001302

L001352:
	addq.l	#1,a1
	bra	L001302

L001356:
	move.l	a0,-(a7)
L001358:
	move.b	d0,(a0)+
	bne	L001302
	lea.l	(a3),a7
	movem.l	(a7)+,d0-d2/a0-a3
	unlk	a6
	rts

L001366:
	movem.l	a0-a1,-(a7)
L00136a:
	move.b	(a0)+,d0
	beq	L00137c
	cmp.b	(a1)+,d0
	beq	L00136a
	bcs	L001378
	moveq.l	#$01,d0
	bra	L001382

L001378:
	moveq.l	#$ff,d0
	bra	L001382

L00137c:
	tst.b	(a1)
	bne	L001378
	clr.l	d0
L001382:
	movem.l	(a7)+,a0-a1
	rts

L001388:
	tst.b	d0
	beq	L001398
	tst.b	(a0)
	beq	L00139a
L001390:
	tst.b	(a0)+
	bne	L001390
	subq.b	#1,d0
	bra	L001388

L001398:
	tst.b	(a0)
L00139a:
	rts

L00139c:
	bsr	L0013a8
	tst.b	(a0)
	bne	L0013a6
	bsr	L001184
L0013a6:
	rts

L0013a8:
	tst.b	(a0)
	beq	L0013b4
	cmpi.b	#$2e,(a0)+		;'.'
	bne	L0013a8
	subq.l	#1,a0
L0013b4:
	rts

L0013b6:
	tst.b	(a0)
	beq	L0013c2
	cmpi.b	#$20,(a0)+		;' '
	bne	L0013b6
	clr.b	-(a0)
L0013c2:
	rts

L0013c4:
	movem.l	d0-d2/a0-a1,-(a7)
	bsr	L0013de
	bsr	L001406
	movem.l	(a7)+,d0-d2/a0-a1
	rts

L0013d2:
	movem.l	d0-d2/a0-a1,-(a7)
	bsr	L0013de
	movem.l	(a7)+,d0-d2/a0-a1
	rts

L0013de:
	movem.l	a0,-(a7)
	lea.l	(L00155c),a1
L0013e8:
	clr.b	d2
	move.l	(a1)+,d1
	beq	L0013fe
L0013ee:
	addq.b	#1,d2
	sub.l	d1,d0
	bcc	L0013ee
	add.l	d1,d0
	add.b	#$2f,d2			;'/'
	move.b	d2,(a0)+
	bra	L0013e8

L0013fe:
	clr.b	(a0)
	movem.l	(a7)+,a0
	rts

L001406:
	move.b	(a0)+,d0
	beq	L00141c
	cmp.b	#$30,d0			;'0'
	bne	L00141c
	tst.b	(a0)
	beq	L00141c
	move.b	#$20,(-$0001,a0)	;' '
	bra	L001406

L00141c:
	rts

L00141e:
	bra	L001426

L001420:
	move.l	d0,-(a7)
	bsr	L001440
	move.l	(a7)+,d0
L001426:
	dbra	d0,L001420
	rts

L00142c:
	bsr	L0011bc
	move.l	d0,-(a7)
	move.l	a0,-(a7)
	move.w	#$0002,-(a7)
	DOS	_WRITE
	lea.l	($000a,a7),a7
	rts

L001440:
	move.w	#$0020,-(a7)		;' '
	DOS	_PUTCHAR
	addq.l	#2,a7
	rts

L00144a:
	link.w	a6,#-$0118
	movem.l	d0-d1/a0,-(a7)
	lea.l	(-$0118,a6),a0
	move.l	d0,d1
	lsr.l	#8,d0
	lsr.l	#1,d0
	and.l	#$0000003f,d0
	add.l	#$00000050,d0
	bsr	L0013c4
	pea.l	($0008,a0)
	DOS	_PRINT
	addq.l	#4,a7
	move.w	#$002d,-(a7)		;'-'
	DOS	_PUTCHAR
	addq.l	#2,a7
	move.l	d1,d0
	lsr.l	#5,d0
	and.l	#$0000000f,d0
	bsr	L0013d2
	pea.l	($0008,a0)
	DOS	_PRINT
	addq.l	#4,a7
	move.w	#$002d,-(a7)		;'-'
	DOS	_PUTCHAR
	addq.l	#2,a7
	move.l	d1,d0
	and.l	#$0000001f,d0
	bsr	L0013d2
	pea.l	($0008,a0)
	DOS	_PRINT
	addq.l	#4,a7
	movem.l	(a7)+,d0-d1/a0
	unlk	a6
	rts

L0014b6:
	link.w	a6,#-$0118
	movem.l	d0-d1/a0,-(a7)
	lea.l	(-$0118,a6),a0
	move.l	d0,d1
	lsr.l	#8,d0
	lsr.l	#3,d0
	and.l	#$0000001f,d0
	bsr	L0013c4
	pea.l	($0008,a0)
	DOS	_PRINT
	addq.l	#4,a7
	move.w	#$003a,-(a7)		;':'
	DOS	_PUTCHAR
	addq.l	#2,a7
	move.l	d1,d0
	lsr.l	#5,d0
	and.l	#$0000003f,d0
	bsr	L0013d2
	pea.l	($0008,a0)
	DOS	_PRINT
	addq.l	#4,a7
	move.w	#$003a,-(a7)		;':'
	DOS	_PUTCHAR
	addq.l	#2,a7
	move.l	d1,d0
	and.l	#$0000001f,d0
	lsl.l	#1,d0
	bsr	L0013d2
	pea.l	($0008,a0)
	DOS	_PRINT
	addq.l	#4,a7
	movem.l	(a7)+,d0-d1/a0
	unlk	a6
	rts

L00151e:
	move.b	d0,d1
	clr.w	d0
	move.b	#$41,d0			;'A'
	move.b	#$05,d2
	bsr	L00154c
	move.b	#$53,d0			;'S'
	move.b	#$02,d2
	bsr	L00154c
	move.b	#$48,d0			;'H'
	move.b	#$01,d2
	bsr	L00154c
	move.b	#$52,d0			;'R'
	move.b	#$00,d2
	bsr	L00154c
	rts

L00154c:
	btst.l	d2,d1
	bne	L001554
	move.b	#$2d,d0			;'-'
L001554:
	move.w	d0,-(a7)
	DOS	_PUTCHAR
	addq.l	#2,a7
	rts


	.data

L00155c:
	.dc.b	$3b,$9a,$ca,$00,$05,$f5,$e1,$00,$00,$98,$96,$80,$00,$0f,$42,$40
	.dc.b	$00,$01,$86,$a0,$00,$00,$27,$10,$00,$00,$03,$e8,$00,$00,$00,$64
	.dc.b	$00,$00,$00,$0a,$00,$00,$00,$01,$00,$00,$00,$00
L001588:
	.dc.b	'X68k Binder v1.00 Copyright 1989 SHARP/Hudson',$0d,$0a,$00
L0015b8:
	.dc.b	'�g�p�@�Fbind�m�X�C�b�`�n�t�@�C�����m�t�@�C�����E�E�n',$0d,$0a
	.dc.b	$09,'/u',$09,'�t�@�C���̍X�V�i�f�B�t�H���g�j',$0d,$0a
	.dc.b	$09,'/x',$09,'�w�t�@�C���̎��o��',$0d,$0a
	.dc.b	$09,'/d',$09,'�w�t�@�C���̍폜',$0d,$0a
	.dc.b	$09,'/l',$09,'���X�g�o��',$0d,$0a
	.dc.b	$09,'/o file',$09,'�o�C���h�t�@�C�����w��',$0d,$0a
	.dc.b	$09,'/t path',$09,'�e���|�����p�X���w��',$0d,$0a
	.dc.b	$0d,$0a
	.dc.b	$09,'/u /x /d /l�̃X�C�b�`�͂ǂꂩ����w�肵�܂�',$0d,$0a
	.dc.b	$09,'/l�X�C�b�`��t�������̓o�C���h�t�@�C���̂ݎw�肵�܂�',$0d,$0a
	.dc.b	$09,'/o�X�C�b�`���ȗ�����ƍŏ��̃t�@�C���𑀍삵�܂�',$0d,$0a,$00
L00172f:
	.dc.b	'bind:�t�@�C����������܂���',$0d,$0a,$00
L00174d:
	.dc.b	'bind:�t�@�C����������܂���',$0d,$0a,$00
L00176d:
	.dc.b	'bind:���ׂĂ��폜���邱�Ƃ͂ł��܂���',$0d,$0a,$00
L001795:
	.dc.b	'bind:�������݂͋֎~����Ă��܂�',$0d,$0a,$00
L0017b7:
	.dc.b	'bind:�w�t�@�C���̍\�����s���ł�',$0d,$0a,$00
L0017d9:
	.dc.b	'bind:�o�C���h�t�@�C���̍\�����s���ł�',$0d,$0a,$00
L001801:
	.dc.b	'bind:�t�@�C���̓o�C���h����Ă��܂���',$0d,$0a,$00
L001829:
	.dc.b	'bind:�e���|�����t�@�C�����쐬�ł��܂���',$0d,$0a,$00
L001853:
	.dc.b	'bind:���o�����w�t�@�C�����쐬�ł��܂���',$0d,$0a,$00
L00187f:
	.dc.b	'bind:���o���w�t�@�C�����ƃo�C���h�t�@�C�������d�����Ă��܂�',$0d,$0a,$00
L0018bf:
	.dc.b	'bind:���������s�����Ă��܂�',$0d,$0a,$00
L0018dd:
	.dc.b	'bind:�o�C���h�t�@�C�����쐬�ł��܂���',$0d,$0a,$00
L001905:
	.dc.b	'bind:�폜���ׂ��w�t�@�C���͊܂܂�Ă��܂���',$0d,$0a,$00
L001933:
	.dc.b	'bind:���o���ׂ��w�t�@�C���͊܂܂�Ă��܂���',$0d,$0a,$00
L001963:
	.dc.b	'bind:�o�C���h����Ă���w�t�@�C���̓o�C���h�ł��܂���',$0d,$0a,$00
L00199b:
	.dc.b	'File <',$00
L0019a2:
	.dc.b	'>',$0d,$0a,$00
L0019a6:
	.dc.b	'=No=         =name=          =length=   =date=   =time=  =at=',$0d,$0a,$00
L0019e6:
	.dc.b	'-system reserved file- ---------- -------- --:--:-- ----'
L001a1e:
	.dc.b	$0d,$0a,$00
L001a21:
	.dc.b	'�t�@�C���쐬 ',$00
L001a2f:
	.dc.b	'�t�@�C���Ǎ� ',$00
L001a3d:
	.dc.b	'�t�@�C������ ',$00
L001a4b:
	.dc.b	'���W���[���폜 ',$00
L001a5b:
	.dc.b	'���W���[����o ',$00
L001a6b:
	.dc.b	'���W���[���X�V ',$00
L001a7b:
	.dc.b	'���W���[���ǉ� ',$00
L001a8b:
	.dc.b	'���W���[���쐬 ',$00
L001a9b:
	.dc.b	$2e,$78,$00
L001a9e:
	.dc.b	'bind.$$$',$00
L001aa7:
	.dc.b	'temp',$00
L001aac:
	.dc.b	$5c
L001aad:
	.dc.b	'*.*',$00,$00

	.bss

L001ab2:
	.ds.b	60
L001aee:
	.ds.b	72
L001b36:
	.ds.l	1
L001b3a:
	.ds.l	1
L001b3e:
	.ds.l	1
L001b42:
	.ds.w	1
L001b44:
	.ds.w	1
L001b46:
	.ds.w	1
L001b48:
	.ds.w	1
L001b4a:
	.ds.b	280
L001c62:
	.ds.b	280
L001d7a:
	.ds.b	280
L001e92:
	.ds.b	160
L001f32:
	.ds.b	21
L001f47:
	.ds.b	1
L001f48:
	.ds.b	1
L001f49:
	.ds.b	1
L001f4a:
	.ds.b	1
L001f4b:
	.ds.b	1
L001f4c:
	.ds.l	1
L001f50:
	.ds.b	30
L001f6e:
	.ds.b	28
L001f8a:
	.ds.l	1
L001f8e:
	.ds.b	28
L001faa:
	.ds.l	1
L001fae:
	.ds.b	1
L001faf:
	.ds.b	1
L001fb0:
	.ds.b	1
L001fb1:
	.ds.b	1
L001fb2:
	.ds.b	1
L001fb3:
	.ds.b	1
L001fb4:
	.ds.b	1
L001fb5:
	.ds.b	1
L001fb6:
	.ds.b	1
L001fb7:
	.ds.b	1
L001fb8:
	.ds.b	1
L001fb9:
	.ds.b	1
L001fba:
	.ds.b	1
L001fbb:
	.ds.b	3073
End:

	.end	Start
