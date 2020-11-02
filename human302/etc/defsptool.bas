   10 /***********************************/
   20 /* sprite pattern editor ver.1.2
   30 /*   Copyright (C) 1987,1989 SHARP
  100 /******initialize********
  110 str help_file="\ETC\DEFSPTOOL.HLP"
  120 dim int  pal(15,15) /*palet data*/
  130 dim char w(255)     /*pattern work*/
  140 int  l=1            /*lut no*/
  150 int  p=0            /*palet code*/
  160 int  c              /*color code*/
  170 int  b              /*blue*/
  180 int  r              /*red*/
  190 int  g              /*green*/
  200 int  i              /*i*/
  210 int  pf=0           /*palet flag*/
  220 int  px,py          /*mouse cusor position*/
  230 int  f=15+1         /*number of functions*/
  240 int  x,y            /*mouse dx,dy*/
  250 int  bl,br          /*left and right sw.*/
  310 int  X1=64,X2=192   /*position data*/
  320 int    Y11=64,Y12=320
  330 int    Y13=400,Y14=448+8
  340 int      XX1=4,YY11=4
  350 int  X3=240,X4=272
  360 int    Y31=64,Y32=96
  370 int    Y33=400,Y34=440
  380 int    Y35=120-8,Y36 : Y36=Y35+16*f-1
  390 int    Y37,Y38 : Y37=Y36+1:Y38=Y37+12
  400 int  X5=320,X6=448
  410 int    Y51=64,Y52=192
  420 int    Y53=200,Y54=448
  430 int      XX5=40,YY51=8,YY53=25,YY54=57
  440 int  X7=456,X8=464
  450 int    Y71=64,Y72=192
  460 int      XX7=57,YY71=8
  500 /*
  510 width 64
  520 color 5
  530 locate 0,14
  540 color 6
  550 print "              説明は必要ですか？［Ｙ／Ｎ］";
  560 color 3
  570 if (tolower(asc(inkey$)) = 'y') then {
  580   print "Ｙ"
  590   type_doc()
  600 }
  650 cls
  900 init()
 1000 /*********main***********
 1010 while(1)
 1020   mspos(px,py)
 1030   sp_move(0,px,py)
 1040   msstat(x,y,bl,br)
 1050   if (bl) then {
 1060     if (px >= X1 and px < X2) then {
 1070       if (py >= Y13 and py < Y14) then {
 1080         mk_pal((px-X1)/4,(py-Y13)/8)
 1090       }
 1100     } else if (px >= X3 and px < X4) then {
 1110       if (py >= Y33 and py < Y34) then {
 1120         set_pal()
 1130       } else if (py >= Y35 and py < Y36) then {
 1140         sel_func((py-Y35)/4)
 1150       } else if (py >= Y37 and py < Y38) then {
 1160         if (term()) then end
 1170       }
 1180     } else if (px >= X5 and px < X6) then {
 1190       if (py >= Y51 and py < Y52) then {
 1200         mk_pat((px-X5)/8,(py-Y51)/8)
 1210       } else if (py >= Y53+16 and py < Y54) then {
 1220         sel_lut((px-X5)/8,(py-Y53)/8)
 1230       }
 1240     } else if (px >= X7 and px < X8) then {
 1250       if (py >= Y71 and py < Y72) then {
 1260         sel_pal((py-Y71)/8)
 1270       }
 1280     }
 1290   } else if (br) then {
 1300     if (px >= X5 and px < X6) then {
 1310       if (py >= Y51 and py < Y52) then {
 1320         mk_pat0((px-X5)/8,(py-Y51)/8)
 1330       }
 1340     }
 1350   }
 1360 endwhile
 1370 end
10000 /************************
10010 func sel_lut(x,y)
10020   int i
10030   if (y mod 2) then return()
10040   sp_set(0,,,253)
10050   dot(XX7+2,YY71+p,0)
10060   p=x
10070   dot(XX7+2,YY71+p,65535)
10080   i=y/2
10090   if (i = l) then {
10100     c=pal(l,p)
10110     pal_disp(c)
10120   } else {
10130     c=pal(i,p)
10140     pattern(i)
10150   }
10160   sp_set(0,,,254)
10170 endfunc
11000 /************************
11010 func sel_pal(y)
11030   sp_set(0,,,253)
11040   dot(XX7+2,YY71+p,0)
11050   p=y
11060   dot(XX7+2,YY71+p,65535)
11070   c=pal(l,p)
11080   pal_disp(c)
11090   sp_set(0,,,254)
11100 endfunc
12000 /************************
12010 func mk_pal(x,y)
12020   int wc
12030   if (y mod 2) then return()
12040   switch (y / 2)
12050     case 0: b=x
12060             pal_vol(0,b)
12070             break
12080     case 1: r=x
12090             pal_vol(1,r)
12100             break
12110     case 2: g=x
12120             pal_vol(2,g)
12130             break
12140     case 3: if (x > 1) then return()
12150             i=x
12160             pal_vol(3,i)
12170             break
12180   endswitch
12190   pf=0
12200   wc=rgb(r,g,b)+i
12210   fill(X3,Y33,X4-1,Y34-1,wc)
12220   mspos(px,py)
12230   sp_move(0,px,py)
12240   fill(X1+58,Y14,X1+81,Y14+11,0)
12250   symbol(X1+58,Y14,right$("000"+hex$(wc),4),1,1,0,65535,0)
12260 endfunc
13000 /************************
13010 func mk_pat(x,y)
13030   if not(pf) then {
13040     sp_set(0,,,253)
13050     pal_disp(c)
13060     sp_set(0,,,254)
13070   }
13080   fill(X5+x*8,Y51+y*8,X5+x*8+7,Y51+y*8+7,c)
13090   fill(X3+x*2,Y31+y*2,X3+x*2+1,Y31+y*2+1,c)
13100   w(x+y*16)=p
13110 endfunc
13500 /************************
13510 func mk_pat0(x,y)
13530   if not(pf or p) then {
13540     sp_set(0,,,253)
13550     pal_disp(c)
13560     sp_set(0,,,254)
13570   }
13580   fill(X5+x*8,Y51+y*8,X5+x*8+7,Y51+y*8+7,pal(l,0))
13590   fill(X3+x*2,Y31+y*2,X3+x*2+1,Y31+y*2+1,pal(l,0))
13600   w(x+y*16)=0
13610 endfunc
14000 /************************
14010 func set_pal()
14020   int count=0,x,y,bl,br,c_old
14030   msbtn(0,0,0)
14040   box(X3-1,Y33-1,X4,Y34,65472,65535)
14050   cls
14060   color 2
14070   print "        パレットの設定"
14080   while (count < 200)
14090     mspos(px,py)
14100     sp_move(0,px,py)
14110     msstat(x,y,bl,br)
14120     if (bl) then break else count=count+1
14130   endwhile
14140   if (count < 200 and px >= X3 and px < X4 and py >= Y33 and py < Y34 ) then {
14150     sp_set(0,,,253)
14160     c_old=c
14170     c=rgb(r,g,b)+i
14180     pal(l,p)=c
14190     pattern(l)
14200     dot(XX5+p,YY53+l*2,c)
14210     dot(XX7,YY71+p,c)
14220     sp_color(p,c,l)
14230     sp_set(0,,,254)
14240     if (not sure()) then {
14250       sp_set(0,,,253)
14260       c=c_old
14270       pal(l,p)=c
14280       pattern(l)
14290       dot(XX5+p,YY53+l*2,c)
14300       dot(XX7,YY71+p,c)
14310       sp_color(p,c,l)
14320       sp_set(0,,,254)
14330     }
14340   }
14350   box(X3-1,Y33-1,X4,Y34,65535,65535)
14360   cls
14370   color 3
14380 endfunc
15000 /************************
15010 func sel_func(n)
15020   int i,x,y,bl,br
15030   if (n mod 4 = 3) then return() else n=n/4
15040   if n > f then return()
15050   msbtn(0,0,0)
15060   fill(X3,Y35+n*16,X4-1,Y35+n*16+11,62)
15070   set_func(n)
15080   set_msg(n)
15090   while(i<200)
15100     mspos(px,py)
15110     sp_move(0,px,py)
15120     msstat(x,y,bl,br)
15130     if (bl) then break else i=i+1
15140   endwhile
15150   if (i < 200 and px >= X3 and px < X4 and py >= Y35+n*16 and py < Y35+n*16+11) then {
15160     fill(X3,Y35+n*16,X4-1,Y35+n*16+11,1984)
15170     set_func(n)
15180     if n < 8 then {
15190       rotate(n)
15200     } else {
15210       switch (n)
15220         case 8: get_pat()
15230                 break;
15240         case 9: set_pat()
15250                 break;
15260         case 10: fill_pat()
15270                 break;
15280         case 11: program()
15290                 break;
15300         case 12: sp_palet()
15310                 break;
15320         case 13: init_pal()
15330                 break;
15340         case 14: clr()
15350                 break;
15360         case 15: help()
15370                 break;
15380       endswitch
15390     }
15400   }
15410   cls
15420   color 3
15430   fill(X3,Y35+n*16,X4-1,Y35+n*16+11,0)
15440   set_func(n)
15450 endfunc
20000 /*+++++++++++++++++++++++
20010 func rotate(n)
20020   int i,j,d(255)
20030   sp_set(0,,,253)
20040   switch (n)
20050     case 0: for i=0 to 15
20060               d(i)=w(i*16+15)
20070             next
20080             for i=0 to 254
20090               w(255-i)=w(254-i)
20100               mspos(px,py):sp_move(0,px,py)
20110             next
20120             for i=0 to 15
20130               w(i*16)=d(i)
20140             next
20150             break
20160     case 1: for i=0 to 15
20170               d(i)=w(i*16)
20180             next
20190             for i=0 to 254
20200               w(i)=w(i+1)
20210               mspos(px,py):sp_move(0,px,py)
20220             next
20230             for i=0 to 15
20240               w(i*16+15)=d(i)
20250             next
20260             break
20270     case 2: for i=0 to 15
20280               d(i)=w(i)
20290             next
20300             for i=0 to 239
20310               w(i)=w(i+16)
20320               mspos(px,py):sp_move(0,px,py)
20330             next
20340             for i=0 to 15
20350               w(i+240)=d(i)
20360             next
20370             break
20380     case 3: for i=0 to 15
20390               d(i)=w(i+240)
20400             next
20410             for i=0 to 239
20420               w(255-i)=w(239-i)
20430               mspos(px,py):sp_move(0,px,py)
20440             next
20450             for i=0 to 15
20460               w(i)=d(i)
20470             next
20480             break
20490     case 4: for i=0 to 15
20500               for j=0 to 15
20510                 d(240-i*16+j)=w(j*16+i)
20520               next
20530               mspos(px,py):sp_move(0,px,py)
20540             next
20550             for i=0 to 255
20560               w(i)=d(i)
20570               mspos(px,py):sp_move(0,px,py)
20580             next
20590             break
20600     case 5: for i=0 to 255
20610               d(i)=w(i)
20620               mspos(px,py):sp_move(0,px,py)
20630             next
20640             for i=0 to 255
20650               w(i)=d(255-i)
20660               mspos(px,py):sp_move(0,px,py)
20670             next
20680             break
20690     case 6: for i=0 to 15
20700               for j=0 to 15
20710                 d(j)=w(i+j*16)
20720               next
20730               mspos(px,py):sp_move(0,px,py)
20740               for j=0 to 15
20750                 w(i+j*16)=d(15-j)
20760               next
20770             next
20780             break
20790     case 7: for i=0 to 15
20800               for j=0 to 15
20810                 d(j)=w(i*16+j)
20820               next
20830               mspos(px,py):sp_move(0,px,py)
20840               for j=0 to 15
20850                 w(i*16+j)=d(15-j)
20860               next
20870             next
20880             break
20890   endswitch
20900   pattern(l)
20910   sp_set(0,,,254)
20920 endfunc
21000 /*+++++++++++++++++++++++
21010 func set_pat()
21020   int n,att
21030   dim char temp(255)
21040   n=get_no()
21050   sp_set(0,,,254)
21060   if (n >= 0) then {
21070     x0=n mod 8+4
21080     y0=n/8+4
21090     sp_pat(n,temp)
21100     att=bg_get(1,x0,y0)
21110     sp_def(n,w)
21120     bg_put(1,x0,y0,n+256*l)
21130     if (not sure()) then {
21140       sp_def(n,temp)
21150       bg_put(1,x0,y0,att)
21160     }
21170     restore(n)
21180   }
21190   sp_off(1)
21200 endfunc
22000 /*+++++++++++++++++++++++
22010 func get_pat()
22020   int n
22030   n=get_no()
22040   if (n >= 0) then {
22050     sp_set(0,,,253)
22060     sp_pat(n,w)
22070     i=bg_get(1,n mod 8+4,n/8+4)/256
22080     pattern(i)
22090     restore(n)
22100   }
22110   sp_set(0,,,254)
22120   sp_off(1)
22130 endfunc
23000 /*+++++++++++++++++++++++
23010 func fill_pat()
23020   int i,j,wp,x,y,bl=0,br=0
23030   cls
23040   print "        パレットの指定"
23050   msbtn(0,0,0)
23060   while not(bl)
23070     mspos(px,py)
23080     sp_move(0,px,py)
23090     msstat(x,y,bl,br)
23100   endwhile
23110   if (px >= X5 and px < X6 and py >= Y53 and py < Y54 and not(py/8 mod 2)) then {
23120     sp_set(0,,,253)
23130     wp=(px-X5)/8
23140     for i=0 to 255
23150       w(i)=wp
23160     next
23170     i=(py-Y53)/16
23180     if (i <> l) then pal_blk(i)
23190   } else if (px >= X7 and px < X8 and py >= Y71 and py < Y72) then {
23200     sp_set(0,,,253)
23210     wp=(py-Y71)/8
23220     for i=0 to 255
23230       w(i)=wp
23240     next
23250   }
23260   mspos(px,py)
23270   sp_move(0,px,py)
23280   fill(X5,Y51,X6-1,Y52-1,pal(l,wp))
23290   fill(X3,Y31,X4-1,Y32-1,pal(l,wp))
23300   sp_set(0,,,254)
23310 endfunc
24000 /*+++++++++++++++++++++++
24010 func program()
24020   int i=0
24030   mspos(px,py)
24040   sp_off(0)
24050   mouse(0)
24060   mouse(1)
24070   setmspos(px,py)
24080   mouse(2)
24090   console 22,2,1
24100   locate 0,22,1
24110   print "    １．パターン　２．パレット"
24120   print "      ［１ｏｒ２］？";
24130   i=instr(1,"12",inkey$)
24140   if (i = 1) then  {
24150     wr_pattern()
24160   } else if (i = 2) then {
24170     wr_palet()
24180   }
24190   console 22,2,0
24200   locate 0,22,0
24210   mspos(px,py)
24220   sp_move(0,px,py)
24230   mouse(4)
24240   mouse(1)
24250   setmspos(px,py)
24260   mouse(2)
24270   sp_on(0)
24280 endfunc
25000 /*+++++++++++++++++++++++
25010 func sp_palet()
25020   int i,n,x,y,bl=0,br
25030   n=get_no()
25040   if (n >= 0) then {
25050     sp_set(0,,,254)
25060     cls
25070     print "      パレットブロックの指定"
25080     msbtn(0,0,0)
25090     while (not bl)
25100       mspos(px,py)
25110       sp_move(0,px,py)
25120       msstat(x,y,bl,br)
25130     endwhile
25140     if (px >= X5 and px < X6 and py >= Y53+16 and py < Y54) then {
25150       i=(py-Y53)
25160       if (i mod 16 < 11) then {
25170         bg_put(1,n mod 8+X1/16,n/8+Y11/16,i/16*256+n)
25180         msbtn(0,0,0)
25190       }
25200     }
25210     restore(n)
25220     sp_set(0,,,254)
25230     sp_off(1)
25240   }
25250 endfunc
26000 /*+++++++++++++++++++++++
26010 func init_pal()
26020   int i,j
26030   if (not sure()) then return()
26040   sp_set(0,,,253)
26050   for i=1 to 15
26060     pal(i,0)=0
26070     pal(i,1)=&H5294
26080     pal(i,2)=&H20
26090     pal(i,3)=&H3E
26100     pal(i,4)=&H400
26110     pal(i,5)=&H7C0
26120     pal(i,6)=&H420
26130     pal(i,7)=&H7FE
26140     pal(i,8)=&H8000
26150     pal(i,9)=&HF800
26160     pal(i,10)=&H8020
26170     pal(i,11)=&HF83E
26180     pal(i,12)=&H8400
26190     pal(i,13)=&HFFC0
26200     pal(i,14)=&HAD6A
26210     pal(i,15)=&HFFFE
26220     for j=0 to 15
26230       sp_color(j,pal(i,j),i)
26240       dot(XX5+j,YY53+i*2,pal(i,j))
26250     next
26260   next
26270   for i=0 to 15
26280     dot(XX7,YY71+i,pal(l,i))
26290   next
26300   pattern(l)
26310   sp_set(0,,,254)
26320 endfunc
27000 /*++++++++++++++++++++++
27010 func clr()
27030   if (sure()) then sp_clr(0,127)
27040 endfunc
28000 /*++++++++++++++++++++++
28010 func int term()
28020   int i
28030   fill(X3,Y37,X4-1,Y38-1,62)
28040   set_func(16)
28050   set_msg(16)
28060   while(i < 200)
28070     mspos(px,py)
28080     sp_move(0,px,py)
28090     msstat(x,y,bl,br)
28100     if (bl) then break else i=i+1
28110   endwhile
28120   if (i < 200 and px >= X3 and px < X4 and py >= Y37 and py < Y38) then {
28130     fill(X3,Y37,X4-1,Y38-1,1984)
28140     set_func(16)
28150     console 0,31,1
28160     width 64
28170     mouse(0)
28180     return(-1)
28190   } else {
28200     fill(X3,Y37,X4-1,Y38-1,0)
28210     set_func(16)
28220     cls
28230     return(0)
28240   }
28250 endfunc
30000 /*----------------------
30010 func pattern(ll)
30020   int i,j,brg,x5,x3,y51,y52,y31,y32
30030   if (ll <> l) then {
30040     fill(X5-16,Y53+l*16,X5-9,Y53+l*16+7,0)
30050     l=ll:fill(X5-16,Y53+l*16,X5-9,Y53+l*16+7,65535)
30060   for i=0 to 15
30070     dot(XX7,YY71+i,pal(l,i))
30080   next
30090   }
30100   for i=0 to 15:y51=Y51+i*8:y52=y51+7:y31=Y31+i*2:y32=y31+1
30110   for j=0 to 15:brg=pal(l,w(i*16+j)):x5=X5+j*8:x3=X3+j*2:fill(x5,y51,x5+7,y52,brg):fill(x3,y31,x3+1,y32,brg):mspos(px,py):sp_move(0,px,py):next:next
30120   c=pal(l,p)
30130   pal_disp(c)
30140 endfunc
31000 /*----------------------
31010 func dot(x,y,c)
31020   fill(x*8,y*8,x*8+7,y*8+7,c)
31030   mspos(px,py)
31040   sp_move(0,px,py)
31050 endfunc
32000 /*----------------------
32010 func pal_blk(ll)
32020   int i
32030   fill(X5-16,Y53+l*16,X5-9,Y53+l*16+7,0)
32040   l=ll
32050   fill(X5-16,Y53+l*16,X5-9,Y53+l*16+7,65535)
32060   for i=0 to 15
32070     dot(XX7,YY71+i,pal(l,i))
32080   next
32090   c=pal(l,p)
32100   pal_disp(c)
32110 endfunc
33000 /*----------------------
33010 func pal_disp(c)
33030   fill(X3,Y33,X4-1,Y34-1,c)
33040   b=(c and &H3E) shr 1
33050   pal_vol(0,b)
33060   r=(c and &H7C0) shr 6
33070   pal_vol(1,r)
33080   g=(c and &HF800) shr 11
33090   pal_vol(2,g)
33100   i=c and 1
33110   pal_vol(3,i)
33120   pf=-1
33130   fill(X1+58,Y14,X1+81,Y14+11,0)
33140   symbol(X1+58,Y14,right$("000"+hex$(c),4),1,1,0,65535,0)
33150 endfunc
34000 /*----------------------
34010 func pal_vol(c,v)
34020   int i,s,y,bc,c16
34030   if (c < 3) then {
34040     s=c*5+1
34050     bc=31 shl s
34060   } else {
34070     s=1
34080     bc =65535
34090   }
34100   c16=c*16
34110   fill(X1-13,Y13+c16-2,X1-2,Y13+c16+9,0)
34120   symbol(X1-13,Y13+c*16-2,right$(" "+str$(v),2),1,1,0,65535,0)
34130   symbol(X1-7,Y13+c*16-2,right$(str$(v),1),1,1,0,65535,0)
34140   y=Y13+c16
34150   for i=0 to v
34160     fill(X1+i*4,y,X1+i*4+3,y+7,i shl s)
34170     mspos(px,py)
34180     sp_move(0,px,py)
34190   next
34200   fill(X1+v*4,y,X1+v*4+3,y+7,bc)
34210   if (c = 3) then {
34220       if (v = 0) then fill(X1+4,y,X1+7,y+7,0)
34230   } else if (v < 31) then {
34240       fill(X1+i*4,y,X2-1,y+7,0)
34250   }
34260 endfunc
35000 /*-----------------------
35010 func get_no()
35020   int i,n,n16,x,y,bl=0,br,m,m8,flg=0
35030   int x0,x1,x2,x3,x4 : x0=X1-10:x1=X1-3:x2=X1-34+16:x4=X1-10
35040   str m$
35050   dim int c(2)={63520,65472,34784}
35060   dim int y1(1) : y1(0)=Y11-18:y1(1)=Y12+2
35070   dim str num(7)={"0","1","2","3","4","5","6","7" }
35080   cls
35090   print "        パターンの指定"
35100   msbtn(0,0,0)
35110   while not(bl)
35120     mspos(px,py)
35130     if (px >= X1 and px < X2 and py >= Y11 and py < Y12) then {
35140       tx=(px-X1)/16
35150       ty=(py-Y11)/16
35160       px=tx*16+X1
35170       py=ty*16+Y11
35180       if (flg) then {
35190         sp_move(0,px,py)
35200         i=(tx+ty*8)
35210         if (n/8 = i/8) then {
35220           if (n <> i) then {
35230             fill(x0,y0,x1,y0+15,0)
35240             symbol(x3,y1(m8),m$,1,1,1,c(m8),0)
35250             x3=px+4
35260             n=i
35270             m=n mod 16
35280             m8=m/8
35290             m$=hex$(m)
35300             symbol(x4,y0,m$,1,1,1,c(2),0)
35310             symbol(x3,y1(m8),m$,1,1,1,c(2),0)
35320           }
35330         } else {
35340           fill(x0,y0,x1,y0+15,0)
35350           symbol(x2,y0,num(n16)+"x",1,1,1,c(m/8),0)
35360           symbol(x3,y1(m8),m$,1,1,1,c(m8),0)
35370           x3=px+4
35380           y0=py
35390           n=i
35400           n16=n/16
35410           m=n mod 16
35420           m8=m/8
35430           m$=hex$(m)
35440           fill(x0,y0,x1,y0+15,0)
35450           symbol(x2,y0,num(n16)+m$,1,1,1,c(2),0)
35460           symbol(x3,y1(m8),m$,1,1,1,c(2),0)
35470         }
35480       } else {
35490         sp_set(0,px+16,py+16,252)
35500         x3=px+4
35510         y0=py
35520         n=(tx+ty*8)
35530         n16=n/16
35540         m=n mod 16
35550         m8=m/8
35560         m$=hex$(m)
35570         fill(x0,y0,x1,y0+15,0)
35580         symbol(x2,y0,num(n16)+m$,1,1,1,c(2),0)
35590         symbol(x3,y1(m8),m$,1,1,1,c(2),0)
35600         flg=-1
35610       }
35620     } else if (flg) then {
35630       sp_set(0,px+16,py+16,254)
35640       fill(x0,y0,x1,y0+15,0)
35650       symbol(x2,y0,num(n16)+"x",1,1,1,c(m8),0)
35660       symbol(x3,y1(m8),m$,1,1,1,c(m8),0)
35670       flg=0
35680     } else {
35690       sp_move(0,px,py)
35700       }
35710     msstat(x,y,bl,br)
35720   endwhile
35730   if (flg) then {
35740     sp_set(1,px+16,py+16,252,3)
35750     return( n )
35760   }
35770   return( -1 )
35780 endfunc
36000 /*-----------------------
36010 func restore(n)
36020   int x0,y0,m8
36030   str m$
36040   dim int c(1)={63520,65472}
36050   dim int y1(1) : y1(0)=Y11-18:y1(1)=Y12+2
36060   x0=sp_stat(1,0)-12
36070   y0=sp_stat(1,1)-16
36080   m$=hex$(n mod 16)
36090   m8=(n mod 16)/8
36100   fill(X1-10,y0,X1-3,y0+15,0)
36110   symbol(X1-18,y0,itoa(n/16)+"x",1,1,1,c(m8),0)
36120   symbol(x0,y1(m8),m$,1,1,1,c(m8),0)
36130   sp_set(0,,,254)
36140   sp_off(1)
36150 endfunc
37000 /*-----------------------
37010 func wr_pattern()
37020   int i,j,k,lno,n,no,no0,no1
37030   str file,a[80]
37040   dim char d(255)
37050   error off
37060   cls
37070   print "      ファイル名"
37080   input "  ";file
37090   if (file = "") then return()
37100   cls
37110   input "    先頭パターン番号 =";no0
37120   input "    最終パターン番号 =";no1
37130   if (no1 = 0) then no1=no0
37140   print file
37150   print "no.";itoa(no0);
37160   if (no0 <> no1) then print "�";itoa(no1);
37170   locate 10,23,1
37180   print " ＯＫ？［ＹorＮ］";
37190   if (tolower(asc(inkey$)) <> 'y') then return()
37200   print "Ｙ";
37210   locate 0,22,0
37220   no=no1-no0
37230   if (no0 < 0 or no0 > no1 or no1 > 127) then {
37240     ferr(2)
37250     return()
37260   }
37270   fp=fopen(file,"c")
37280   if (fp = -1) then {
37290     ferr(0)
37300     return()
37310   }
37320   a="   10 sprite_pattern():end"+chr$(13)+chr$(10)
37330   if (fwrites(a,fp) = -1) then {
37340     ferr(1)
37350     return()
37360   }
37370   a="60000 func sprite_pattern()"+chr$(13)+chr$(10)
37380   if (fwrites(a,fp) = -1) then {
37390     ferr(1)
37400     return()
37410   }
37420   a="60010   dim char c(255)"+chr$(13)+chr$(10)
37430   if (fwrites(a,fp) = -1) then {
37440     ferr(1)
37450     return()
37460   }
37470   for i=0 to no
37480     sp_pat(no0+i,d)
37490     lno=60020+i*20
37500     a=itoa(lno)+"   c={"+chr$(13)+chr$(10)
37510     if (fwrites(a,fp) = -1) then {
37520       ferr(1)
37530       return()
37540     }
37550     for j=0 to 15
37560       lno=lno+1
37570       a=itoa(lno)+"     "
37580       for k=0 to 15
37590         n=d(j*16+k)
37600         a=a+"&H"+hex$(n)+","
37610       next
37620       if (j <> 15) then {
37630         a=a+chr$(13)+chr$(10)
37640         if (fwrites(a,fp) = -1) then {
37650           ferr(1)
37660           return()
37670         }
37680       } else {
37690         a=left$(a,strlen(a)-1)+chr$(13)+chr$(10)
37700         if (fwrites(a,fp) = -1) then {
37710           ferr(1)
37720           return()
37730         }
37740       }
37750     next
37760     a=itoa(lno+1)+"   }"+chr$(13)+chr$(10)
37770     if (fwrites(a,fp) = -1) then {
37780       ferr(1)
37790       return()
37800     }
37810     a=itoa(lno+2)+"   sp_def("+itoa(no0+i)+",c)"+chr$(13)+chr$(10)
37820     if (fwrites(a,fp) = -1) then {
37830       ferr(1)
37840       return()
37850     }
37860   next
37870   a=itoa(lno+4)+" endfunc"+chr$(13)+chr$(10)+chr$(26)
37880   if (fwrites(a,fp) = -1) then {
37890     ferr(1)
37900     return()
37910   }
37920   fclose(fp)
37930   cls
37940   error on
37950 endfunc
38000 /*-----------------------
38010 func wr_palet()
38020   int i,j,lno
38030   str file,a[80],i$
38040   error off
38050   cls
38060   print "  ファイル名"
38070   input "  ";file
38080   if (file = "") then return()
38090   print file
38100   print "    ＯＫ？［ＹorＮ］";
38110   if (tolower(asc(inkey$)) <> 'y') then return()
38120   print "Ｙ";
38130   fp=fopen(file,"c")
38140   if (fp = -1) then {
38150     ferr(0)
38160     return()
38170   }
38180   a="   10 sprite_pallet():end"+chr$(13)+chr$(10)
38190   if (fwrites(a,fp) = -1) then {
38200     ferr(1)
38210     return()
38220   }
38230   a="60000 func sprite_pallet()"+chr$(13)+chr$(10)
38240   if (fwrites(a,fp) = -1) then {
38250     ferr(1)
38260     return()
38270   }
38280   lno=60010
38290   for i=1 to 15
38300     i$=itoa(i)
38310     for j=0 to 15
38320       a=itoa(lno)+"   sp_color("+itoa(j)+","+itoa(pal(i,j))+","+i$+")"+chr$(13)+chr$(10)
38330       if (fwrites(a,fp) = -1) then {
38340         ferr(1)
38350         return()
38360       }
38370       lno=lno+10
38380     next
38390   next
38400   a=itoa(lno)+" endfunc"+chr$(13)+chr$(10)+chr$(26)
38410   if (fwrites(a,fp) = -1) then {
38420     ferr(1)
38430     return()
38440   }
38450   fclose(fp)
38460   cls
38470   sp_on(0)
38480   error on
38490 endfunc
39000 /*----------------------
39010 func ferr(mode)
39020   int i=0,x,y,bl,br
39030   dim str msg(2)[34]
39040   msg(0) = "ファイルのオープンに"+chr$(13)+chr$(10)+"失敗しました"
39050   msg(1) = "ファイルの書き込みに"+chr$(13)+chr$(10)+"失敗しました"
39070   msg(2) = "パターン番号が無効です"
39080   /*          
39090   cls
39100   locate 0,22,0
39110   color 9
39120   print msg(mode);
39130   color 3
39140   msbtn(1,0,2000)
39150 endfunc
40000 /*----------------------
40010 func set_msg(n)
40020   int i
40030   cls
40040   color 2
40050   switch (n)
40060     case 0: print "        １ドット右へシフト"
40070             break
40080     case 1: print "        １ドット左へシフト"
40090             break
40100     case 2: print "        １ドット上へシフト"
40110             break
40120     case 3: print "        １ドット下へシフト"
40130             break
40140     case 4: print "        ９０度回転"
40150             break
40160     case 5: print "        １８０度回転"
40170             break
40180     case 6: print "        上下反転"
40190             break
40200     case 7: print "        左右反転"
40210             break
40220     case 8: print "        パターン取り込み"
40230             break
40240     case 9: print "        パターン定義"
40250             break
40260     case 10: print "        ぬりつぶし"
40270              break
40280     case 11: print "パターン又はパレットのセーブ"
40290              break
40300     case 12: print "      パレットブロックの変更"
40310              break
40320     case 13: print "        パレットの初期化"
40330              break
40340     case 14: print "        全パターンのクリア"
40350              break
40360     case 15: print "        ヘルプファイルの表示"
40370              break
40380     case 16: print "        プログラムの終了"
40390              break
40400   endswitch
40410   color 3
40420 endfunc
41000 /*----------------------
41010 func sure()
41020   int i,x,y,bl=0,br,XS,XE,YS,YE : XS=X1:XE=X1+30:YS=22*16:YE=23*16
41030   msbtn(0,0,0)
41040   cls
41050   box(XS-1,YS-1,XE,YE,65535,65535)
41060   symbol(XS+7,YS,"OK",1,1,1,65535,0)
41070   while (not bl)
41080     mspos(px,py)
41090     sp_move(0,px,py)
41100     msstat(x,y,bl,br)
41110   endwhile
41120   fill(XS-1,YS-1,XE,YE,0)
41130   if (px >= XS and px < XE and py >= YS and py < YE) then return(-1)
41140   return(0)
41150 endfunc
42000 /*----------------------
42010 func help()
42030   mspos(px,py)
42040   sp_off(0)
42050   bg_set(0,,0)
42060   vpage(0)
42070   console 0,31,0
42080   cls
42090   type_doc()
42100   cls
42110   vpage(1)
42120   console 22,2,0
42130   vpage(1)
42140   mouse(1)
42150   setmspos(px,py)
42160   mouse(2)
42170   sp_on(0)
42180   bg_set(0,,1)
42190 endfunc
50000 /***********************
50010 func init()
50020   int i
50030   screen 1,3,1,1
50040   console 22,2,0
50050   locate 0,22,0
50060   symbol(130,4,"Sprite pattern editor",1,1,2,65472,0)
50070   sp_off()
50080   bg_fill(1,255)
50090   sp_clr(255)
50100   bg_set(0,1,1)
50110   bg_scroll(0,0,0)
50120   sp_disp(1)
50130   set_mscursor()
50140   pat_disp()
50150   lut_disp()
50160   c=pal(l,p)
50170   box(X5-1,Y51-1,X6,Y52,65535,65535)
50180   fill(X5,Y51,X6-1,Y52-1,c)
50190   box(X3-1,Y31-1,X4,Y32,65535,65535)
50200   fill(X3,Y31,X4-1,Y32-1,c)
50210   box(X1-1,Y13-1,X2,Y13+8,&H3E,65535)
50220   box(X1-1,Y13+15,X2,Y13+24,&H7C0,65535)
50230   box(X1-1,Y13+31,X2,Y13+40,&HF800,65535)
50240   box(X1-1,Y13+47,X1+8,Y14,&HFFFF,65535)
50250   box(X3-1,Y33-1,X4,Y34,65535,65535)
50260   pal_disp(c)
50270   symbol(X1+46,Y14,"&h",1,1,0,65535,0)
50280   for i=0 to f
50290     set_func(i)
50300   next
50310   mouse(4)
50320   msarea(0,0,511,511)
50330   mouse(1)
50340   setmspos(X5,Y51)
50350   mouse(2)
50360   sp_set(0,X5+16,Y51+16,254,3)
50370 endfunc
51000 /*-----------------------
51010 func pat_disp()
51020   int i
51030   dim int c(1)={63520,65472}
51040   box(X1-1,Y11-1,X2,Y12,65535,65535)
51050   for i=0 to 7
51060     symbol(X1+i*16+4,Y11-18,hex$(i),1,1,1,c(0),0)
51070   next
51080   for i=0 to 7
51090     symbol(X1+i*16+4,Y12+2,hex$(i+8),1,1,1,c(1),0)
51100   next
51110   for i=0 to 7
51120     symbol(X1-18,Y11+i*32,hex$(i)+"x",1,1,1,c(0),0)
51130     symbol(X1-18,Y11+i*32+16,hex$(i)+"x",1,1,1,c(1),0)
51140   next
51150   for i=0 to 15
51160     for j=0 to 7
51170       bg_put(1,XX1+j,YY11+i,256+i*8+j)
51180     next
51190   next
51200 endfunc
52000 /*----------------------
52010 func lut_disp()
52020   int i,j
52030   for i=1 to 15
52040     box(X5-1,Y53+i*16-1,X6,Y53+i*16+8,65535,65535)
52050     for j=0 to 15
52060       pal(i,j)=sp_color(j,,i)
52070       fill(X5+j*8,Y53+i*16,X5+j*8+7,Y53+i*16+7,pal(i,j))
52080     next
52090   next
52100   box(X7-1,Y71-1,X8,Y72,65535,65535)
52110   for i=0 to 15
52120     dot(XX7,YY71+i,pal(l,i))
52130   next
52140   dot(XX5-2,YY53+l*2,65535)
52150   dot(XX7+2,YY71+p,65535)
52160 endfunc
53000 /*-----------------------
53010 func set_func(n)
53020   int x : x=(X4+X3)/2
53030   box(X3-1,Y35+n*16-1,X4,Y35+n*16+12,65535,65535)
53040   switch (n)
53050     case 0: symbol(x-3,Y35+n*16,chr$(28),1,1,0,65472,0)
53060             break;
53070     case 1: symbol(x-3,Y35+n*16,chr$(29),1,1,0,65472,0)
53080             break;
53090     case 2: symbol(x-3,Y35+n*16,chr$(30),1,1,0,65472,0)
53100             break;
53110     case 3: symbol(x-3,Y35+n*16,chr$(31),1,1,0,65472,0)
53120             break;
53130     case 4: symbol(x-6,Y35+n*16,"90",1,1,0,65472,0)
53140             break;
53150     case 5: symbol(x-9,Y35+n*16,"180",1,1,0,65472,0)
53160             break;
53170     case 6: symbol(x-6,Y35+n*16,chr$(31)+chr$(30),1,1,0,65472,0)
53180             break;
53190     case 7: symbol(x-6,Y35+n*16,chr$(29)+chr$(28),1,1,0,65472,0)
53200             break;
53210     case 8: symbol(x-9,Y35+n*16,"get",1,1,0,65472,0)
53220             break;
53230     case 9: symbol(x-9,Y35+n*16,"put",1,1,0,65472,0)
53240             break;
53250     case 10: symbol(x-12,Y35+n*16,"fill",1,1,0,65472,0)
53260             break;
53270     case 11: symbol(x-12,Y35+n*16,"save",1,1,0,65472,0)
53280             break;
53290     case 12: symbol(x-15,Y35+n*16,"palet",1,1,0,65472,0)
53300             break;
53310     case 13: symbol(x-12,Y35+n*16,"init",1,1,0,65472,0)
53320             break;
53330     case 14: symbol(x-9,Y35+n*16,"clr",1,1,0,65472,0)
53340             break;
53350     case 15: symbol(x-12,Y35+n*16,"help",1,1,0,65472,0)
53360             break;
53370     case 16: symbol(x-9,Y35+n*16,"end",1,1,0,65472,0)
53380             break;
53390   endswitch
53400 endfunc
54000 /***********************
54010 func type_doc()
54020   int fp,i,j,c
54030   str s[80]
54040   error off
54050   fp=fopen(help_file,"r")
54060   if (fp < 0) then {
54070     locate 0,22,0
54080     print "        ";chr$(34);help_file;chr$(34)
54090     color 2
54100     print "        がオープンできませんでした。"
54110     print "        何かキーを押して下さい。"
54120     color 3
54130     error on
54140     s=inkey$
54150     return()
54160   }
54170   repeat
54180     cls
54190     for i=0 to 29
54200       freads(s,fp)
54210       print s
54220     next
54230     c=asc(inkey$)
54240     if (c <> ' ') then break
54250   until feof(fp)
54260   fclose(fp)
54270   error on
54280 endfunc
60000 /***********************
60010 func set_mscursor()
60020   dim char c(255)
60030   c={
60031     4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,
60032     4,8,8,8,8,8,8,8,8,8,8,8,8,8,8,4,
60033     4,8,0,0,0,0,0,0,0,0,0,0,0,0,8,4,
60034     4,8,0,0,0,0,0,0,0,0,0,0,0,0,8,4,
60035     4,8,0,0,0,0,0,0,0,0,0,0,0,0,8,4,
60036     4,8,0,0,0,0,0,0,0,0,0,0,0,0,8,4,
60037     4,8,0,0,0,0,0,0,0,0,0,0,0,0,8,4,
60038     4,8,0,0,0,0,0,0,0,0,0,0,0,0,8,4,
60039     4,8,0,0,0,0,0,0,0,0,0,0,0,0,8,4,
60040     4,8,0,0,0,0,0,0,0,0,0,0,0,0,8,4,
60041     4,8,0,0,0,0,0,0,0,0,0,0,0,0,8,4,
60042     4,8,0,0,0,0,0,0,0,0,0,0,0,0,8,4,
60043     4,8,0,0,0,0,0,0,0,0,0,0,0,0,8,4,
60044     4,8,0,0,0,0,0,0,0,0,0,0,0,0,8,4,
60045     4,8,8,8,8,8,8,8,8,8,8,8,8,8,8,4,
60046     4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4
60047   }
60048   sp_def(252,c)
60050   c={
60051     0,0,0,0,4,4,4,4,0,0,0,0,0,0,0,0,
60052     0,0,0,4,8,8,8,8,4,0,0,0,0,0,0,0,
60053     0,0,0,4,8,8,8,8,4,0,0,0,0,0,0,0,
60054     0,0,4,8,4,4,4,4,8,4,0,0,0,0,0,0,
60055     0,4,8,4,4,8,4,4,4,8,4,0,0,0,0,0,
60056     0,4,8,4,4,8,4,4,4,8,4,0,0,0,0,0,
60057     4,8,4,4,4,8,4,4,4,4,8,4,0,0,0,0,
60058     4,8,4,4,4,8,4,4,4,4,8,4,0,0,0,0,
60059     4,8,4,4,4,8,4,4,4,4,8,4,0,0,0,0,
60060     4,8,4,4,4,8,8,8,8,4,8,4,0,0,0,0,
60061     4,8,4,4,4,4,4,4,4,4,8,4,0,0,0,0,
60062     0,4,8,4,4,4,4,4,4,8,4,0,0,0,0,0,
60063     0,4,8,4,4,4,4,4,4,8,4,0,0,0,0,0,
60064     0,0,4,8,4,4,4,4,8,4,0,0,0,0,0,0,
60065     0,0,0,4,8,8,8,8,4,0,0,0,0,0,0,0,
60066     0,0,0,0,4,4,4,4,0,0,0,0,0,0,0,0
60067   }
60068   sp_def(253,c)
60070   c={
60071     4,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
60072     4,8,4,0,0,0,0,0,0,0,0,0,0,0,0,0,
60073     4,8,8,4,0,0,0,0,0,0,0,0,0,0,0,0,
60074     4,8,8,8,4,0,0,0,0,0,0,0,0,0,0,0,
60075     4,8,8,8,8,4,0,0,0,0,0,0,0,0,0,0,
60076     4,8,8,8,8,8,4,0,0,0,0,0,0,0,0,0,
60077     4,8,8,8,8,8,8,4,0,0,0,0,0,0,0,0,
60078     4,8,8,8,8,8,8,8,4,0,0,0,0,0,0,0,
60079     4,8,8,8,8,4,4,4,4,4,0,0,0,0,0,0,
60080     4,8,8,4,8,8,4,0,0,0,0,0,0,0,0,0,
60081     4,8,4,0,8,8,4,0,0,0,0,0,0,0,0,0,
60082     4,4,0,0,4,8,8,4,0,0,0,0,0,0,0,0,
60083     4,0,0,0,4,8,8,4,0,0,0,0,0,0,0,0,
60084     0,0,0,0,0,4,8,8,4,0,0,0,0,0,0,0,
60085     0,0,0,0,0,4,8,8,4,0,0,0,0,0,0,0,
60086     0,0,0,0,0,0,4,4,4,0,0,0,0,0,0,0
60087   }
60088   sp_def(254,c)
60090 endfunc
