   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
   4                     ; Optimizer V4.4.11 - 19 Nov 2019
  19                     .const:	section	.text
  20  0000               L5_Gamma:
  21  0000 01            	dc.b	1
  22  0001 01            	dc.b	1
  23  0002 01            	dc.b	1
  24  0003 02            	dc.b	2
  25  0004 02            	dc.b	2
  26  0005 02            	dc.b	2
  27  0006 02            	dc.b	2
  28  0007 03            	dc.b	3
  29  0008 03            	dc.b	3
  30  0009 03            	dc.b	3
  31  000a 03            	dc.b	3
  32  000b 04            	dc.b	4
  33  000c 04            	dc.b	4
  34  000d 04            	dc.b	4
  35  000e 05            	dc.b	5
  36  000f 05            	dc.b	5
  37  0010 05            	dc.b	5
  38  0011 06            	dc.b	6
  39  0012 06            	dc.b	6
  40  0013 06            	dc.b	6
  41  0014 07            	dc.b	7
  42  0015 07            	dc.b	7
  43  0016 08            	dc.b	8
  44  0017 08            	dc.b	8
  45  0018 09            	dc.b	9
  46  0019 09            	dc.b	9
  47  001a 0a            	dc.b	10
  48  001b 0a            	dc.b	10
  49  001c 0b            	dc.b	11
  50  001d 0c            	dc.b	12
  51  001e 0c            	dc.b	12
  52  001f 0d            	dc.b	13
  53  0020 0e            	dc.b	14
  54  0021 0f            	dc.b	15
  55  0022 0f            	dc.b	15
  56  0023 10            	dc.b	16
  57  0024 11            	dc.b	17
  58  0025 12            	dc.b	18
  59  0026 13            	dc.b	19
  60  0027 14            	dc.b	20
  61  0028 15            	dc.b	21
  62  0029 16            	dc.b	22
  63  002a 17            	dc.b	23
  64  002b 18            	dc.b	24
  65  002c 19            	dc.b	25
  66  002d 1b            	dc.b	27
  67  002e 1c            	dc.b	28
  68  002f 1d            	dc.b	29
  69  0030 1f            	dc.b	31
  70  0031 20            	dc.b	32
  71  0032 22            	dc.b	34
  72  0033 24            	dc.b	36
  73  0034 25            	dc.b	37
  74  0035 27            	dc.b	39
  75  0036 29            	dc.b	41
  76  0037 2b            	dc.b	43
  77  0038 2d            	dc.b	45
  78  0039 2f            	dc.b	47
  79  003a 31            	dc.b	49
  80  003b 33            	dc.b	51
  81  003c 35            	dc.b	53
  82  003d 38            	dc.b	56
  83  003e 3a            	dc.b	58
  84  003f 3d            	dc.b	61
  85  0040 3f            	dc.b	63
  86  0041 42            	dc.b	66
  87  0042 45            	dc.b	69
  88  0043 48            	dc.b	72
  89  0044 4b            	dc.b	75
  90  0045 4e            	dc.b	78
  91  0046 52            	dc.b	82
  92  0047 55            	dc.b	85
  93  0048 59            	dc.b	89
  94  0049 5c            	dc.b	92
  95  004a 60            	dc.b	96
  96  004b 64            	dc.b	100
  97  004c 69            	dc.b	105
  98  004d 6d            	dc.b	109
  99  004e 71            	dc.b	113
 100  004f 76            	dc.b	118
 101  0050 7b            	dc.b	123
 102  0051 80            	dc.b	128
 103  0052 85            	dc.b	133
 104  0053 8a            	dc.b	138
 105  0054 90            	dc.b	144
 106  0055 96            	dc.b	150
 107  0056 9b            	dc.b	155
 108  0057 a2            	dc.b	162
 109  0058 a8            	dc.b	168
 110  0059 af            	dc.b	175
 111  005a b5            	dc.b	181
 112  005b bd            	dc.b	189
 113  005c c4            	dc.b	196
 114  005d cb            	dc.b	203
 115  005e d3            	dc.b	211
 116  005f db            	dc.b	219
 117  0060 e4            	dc.b	228
 118  0061 ec            	dc.b	236
 119  0062 f5            	dc.b	245
 120  0063 ff            	dc.b	255
 151                     ; 20 void WS2811_Init(void)
 151                     ; 21 {
 153                     	switch	.text
 154  0000               _WS2811_Init:
 158                     ; 22 	GPIO_DeInit(GPIOA);
 160  0000 ae5000        	ldw	x,#20480
 161  0003 cd0000        	call	_GPIO_DeInit
 163                     ; 23 	GPIO_Init(WS2811_GPIO_PORT, (GPIO_Pin_TypeDef)WS2811_1_PIN,GPIO_MODE_OUT_PP_LOW_FAST);
 165  0006 4be0          	push	#224
 166  0008 4b02          	push	#2
 167  000a ae5000        	ldw	x,#20480
 168  000d cd0000        	call	_GPIO_Init
 170  0010 85            	popw	x
 171                     ; 24 	GPIO_Init(WS2811_GPIO_PORT, (GPIO_Pin_TypeDef)WS2811_2_PIN,GPIO_MODE_OUT_PP_LOW_FAST);
 173  0011 4be0          	push	#224
 174  0013 4b04          	push	#4
 175  0015 ae5000        	ldw	x,#20480
 176  0018 cd0000        	call	_GPIO_Init
 178  001b 85            	popw	x
 179                     ; 25 }
 182  001c 81            	ret	
 215                     ; 27 uint8_t WS2811_Gamma_Corr(uint8_t Percentage)
 215                     ; 28 {
 216                     	switch	.text
 217  001d               _WS2811_Gamma_Corr:
 219       00000000      OFST:	set	0
 222                     ; 29 	if (Percentage == 0)
 224  001d 4d            	tnz	a
 225  001e 2601          	jrne	L14
 226                     ; 30 		return 0;
 230  0020 81            	ret	
 231  0021               L14:
 232                     ; 32 		return Gamma[Percentage-1];
 234  0021 5f            	clrw	x
 235  0022 97            	ld	xl,a
 236  0023 5a            	decw	x
 237  0024 d60000        	ld	a,(L5_Gamma,x)
 240  0027 81            	ret	
 264                     ; 35 void WS2811_Update(void)
 264                     ; 36 {
 265                     	switch	.text
 266  0028               _WS2811_Update:
 270                     ; 37 	if(bitRead(Main_State, MAINSTATE_WS))
 272                     ; 41 }
 275  0028 81            	ret	
 341                     ; 43 void WS2811_1_Update_800K(uint8_t *ToSend, uint8_t Nr)
 341                     ; 44 {
 342                     	switch	.text
 343  0029               _WS2811_1_Update_800K:
 345  0029 89            	pushw	x
 346  002a 5203          	subw	sp,#3
 347       00000003      OFST:	set	3
 350                     ; 46 	for (j=0;j<Nr;j++)
 352  002c 0f01          	clr	(OFST-2,sp)
 355  002e 203c          	jra	L111
 356  0030               L501:
 357                     ; 48 		ActByte=ToSend[j];
 359  0030 5f            	clrw	x
 360  0031 97            	ld	xl,a
 361  0032 72fb04        	addw	x,(OFST+1,sp)
 362  0035 f6            	ld	a,(x)
 363  0036 6b03          	ld	(OFST+0,sp),a
 365                     ; 49 	for (i=0; i<8; i++)
 367  0038 0f02          	clr	(OFST-1,sp)
 369  003a               L511:
 370                     ; 51 		if (ActByte&0x80)
 372  003a 7b03          	ld	a,(OFST+0,sp)
 373  003c 2a13          	jrpl	L321
 374                     ; 53 			_asm("bset 0x5000,#1"); // A1 high
 377  003e 72125000      	bset	0x5000,#1
 379                     ; 54 			_asm("nop");
 382  0042 9d            	nop	
 384                     ; 55 			_asm("nop");
 387  0043 9d            	nop	
 389                     ; 56 			_asm("nop");
 392  0044 9d            	nop	
 394                     ; 57 			_asm("nop");
 397  0045 9d            	nop	
 399                     ; 58 			_asm("nop");
 402  0046 9d            	nop	
 404                     ; 59 			_asm("nop");
 407  0047 9d            	nop	
 409                     ; 60 			_asm("nop");
 412  0048 9d            	nop	
 414                     ; 61 			_asm("nop");
 417  0049 9d            	nop	
 419                     ; 62 			_asm("nop");
 422  004a 9d            	nop	
 424                     ; 64 			_asm("bres 0x5000,#1"); // A2 low
 427  004b 72135000      	bres	0x5000,#1
 430  004f 200f          	jra	L521
 431  0051               L321:
 432                     ; 69 			_asm("bset 0x5000,#1"); // A1 high
 435  0051 72125000      	bset	0x5000,#1
 437                     ; 70 			_asm("nop");
 440  0055 9d            	nop	
 442                     ; 71 			_asm("nop");
 445  0056 9d            	nop	
 447                     ; 72 			_asm("nop");
 450  0057 9d            	nop	
 452                     ; 73 			_asm("nop");
 455  0058 9d            	nop	
 457                     ; 75 			_asm("bres 0x5000,#1"); // A1 low
 460  0059 72135000      	bres	0x5000,#1
 462                     ; 76 			_asm("nop");
 465  005d 9d            	nop	
 467                     ; 77 			_asm("nop");
 470  005e 9d            	nop	
 472                     ; 78 			_asm("nop");
 475  005f 9d            	nop	
 477  0060               L521:
 478                     ; 81 		ActByte <<= 1;
 480  0060 0803          	sll	(OFST+0,sp)
 482                     ; 49 	for (i=0; i<8; i++)
 484  0062 0c02          	inc	(OFST-1,sp)
 488  0064 7b02          	ld	a,(OFST-1,sp)
 489  0066 a108          	cp	a,#8
 490  0068 25d0          	jrult	L511
 491                     ; 46 	for (j=0;j<Nr;j++)
 493  006a 0c01          	inc	(OFST-2,sp)
 495  006c               L111:
 498  006c 7b01          	ld	a,(OFST-2,sp)
 499  006e 1108          	cp	a,(OFST+5,sp)
 500  0070 25be          	jrult	L501
 501                     ; 84 }
 504  0072 5b05          	addw	sp,#5
 505  0074 81            	ret	
 571                     ; 86 void WS2811_2_Update_800K(uint8_t *ToSend, uint8_t Nr)
 571                     ; 87 {
 572                     	switch	.text
 573  0075               _WS2811_2_Update_800K:
 575  0075 89            	pushw	x
 576  0076 5203          	subw	sp,#3
 577       00000003      OFST:	set	3
 580                     ; 89 	for (j=0;j<Nr;j++)
 582  0078 0f01          	clr	(OFST-2,sp)
 585  007a 203c          	jra	L161
 586  007c               L551:
 587                     ; 91 		ActByte = ToSend[j];
 589  007c 5f            	clrw	x
 590  007d 97            	ld	xl,a
 591  007e 72fb04        	addw	x,(OFST+1,sp)
 592  0081 f6            	ld	a,(x)
 593  0082 6b03          	ld	(OFST+0,sp),a
 595                     ; 92 	for (i=0; i<8; i++)
 597  0084 0f02          	clr	(OFST-1,sp)
 599  0086               L561:
 600                     ; 94 		if (ActByte&0x80)
 602  0086 7b03          	ld	a,(OFST+0,sp)
 603  0088 2a13          	jrpl	L371
 604                     ; 96 			_asm("bset 0x5000,#2"); // A2 high
 607  008a 72145000      	bset	0x5000,#2
 609                     ; 97 			_asm("nop");
 612  008e 9d            	nop	
 614                     ; 98 			_asm("nop");
 617  008f 9d            	nop	
 619                     ; 99 			_asm("nop");
 622  0090 9d            	nop	
 624                     ; 100 			_asm("nop");
 627  0091 9d            	nop	
 629                     ; 101 			_asm("nop");
 632  0092 9d            	nop	
 634                     ; 102 			_asm("nop");
 637  0093 9d            	nop	
 639                     ; 103 			_asm("nop");
 642  0094 9d            	nop	
 644                     ; 104 			_asm("nop");
 647  0095 9d            	nop	
 649                     ; 105 			_asm("nop");
 652  0096 9d            	nop	
 654                     ; 107 			_asm("bres 0x5000,#2"); // A2 low
 657  0097 72155000      	bres	0x5000,#2
 660  009b 200f          	jra	L571
 661  009d               L371:
 662                     ; 112 			_asm("bset 0x5000,#2"); // A2 high
 665  009d 72145000      	bset	0x5000,#2
 667                     ; 113 			_asm("nop");
 670  00a1 9d            	nop	
 672                     ; 114 			_asm("nop");
 675  00a2 9d            	nop	
 677                     ; 115 			_asm("nop");
 680  00a3 9d            	nop	
 682                     ; 116 			_asm("nop");
 685  00a4 9d            	nop	
 687                     ; 118 			_asm("bres 0x5000,#2"); // A2 low
 690  00a5 72155000      	bres	0x5000,#2
 692                     ; 119 			_asm("nop");
 695  00a9 9d            	nop	
 697                     ; 120 			_asm("nop");
 700  00aa 9d            	nop	
 702                     ; 121 			_asm("nop");
 705  00ab 9d            	nop	
 707  00ac               L571:
 708                     ; 124 		ActByte <<= 1;
 710  00ac 0803          	sll	(OFST+0,sp)
 712                     ; 92 	for (i=0; i<8; i++)
 714  00ae 0c02          	inc	(OFST-1,sp)
 718  00b0 7b02          	ld	a,(OFST-1,sp)
 719  00b2 a108          	cp	a,#8
 720  00b4 25d0          	jrult	L561
 721                     ; 89 	for (j=0;j<Nr;j++)
 723  00b6 0c01          	inc	(OFST-2,sp)
 725  00b8               L161:
 728  00b8 7b01          	ld	a,(OFST-2,sp)
 729  00ba 1108          	cp	a,(OFST+5,sp)
 730  00bc 25be          	jrult	L551
 731                     ; 127 }
 734  00be 5b05          	addw	sp,#5
 735  00c0 81            	ret	
 760                     	xref	_Main_State
 761                     	xdef	_WS2811_Update
 762                     	xdef	_WS2811_Gamma_Corr
 763                     	xdef	_WS2811_2_Update_800K
 764                     	xdef	_WS2811_1_Update_800K
 765                     	xdef	_WS2811_Init
 766                     	xref	_GPIO_Init
 767                     	xref	_GPIO_DeInit
 786                     	end
