   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  43                     ; 67 void I2C_DeInit(void)
  43                     ; 68 {
  45                     .text:	section	.text,new
  46  0000               _I2C_DeInit:
  50                     ; 69   I2C->CR1 = I2C_CR1_RESET_VALUE;
  52  0000 725f5210      	clr	21008
  53                     ; 70   I2C->CR2 = I2C_CR2_RESET_VALUE;
  55  0004 725f5211      	clr	21009
  56                     ; 71   I2C->FREQR = I2C_FREQR_RESET_VALUE;
  58  0008 725f5212      	clr	21010
  59                     ; 72   I2C->OARL = I2C_OARL_RESET_VALUE;
  61  000c 725f5213      	clr	21011
  62                     ; 73   I2C->OARH = I2C_OARH_RESET_VALUE;
  64  0010 725f5214      	clr	21012
  65                     ; 74   I2C->ITR = I2C_ITR_RESET_VALUE;
  67  0014 725f521a      	clr	21018
  68                     ; 75   I2C->CCRL = I2C_CCRL_RESET_VALUE;
  70  0018 725f521b      	clr	21019
  71                     ; 76   I2C->CCRH = I2C_CCRH_RESET_VALUE;
  73  001c 725f521c      	clr	21020
  74                     ; 77   I2C->TRISER = I2C_TRISER_RESET_VALUE;
  76  0020 3502521d      	mov	21021,#2
  77                     ; 78 }
  80  0024 81            	ret
 247                     .const:	section	.text
 248  0000               L01:
 249  0000 000186a1      	dc.l	100001
 250  0004               L21:
 251  0004 000f4240      	dc.l	1000000
 252                     ; 96 void I2C_Init(uint32_t OutputClockFrequencyHz, uint16_t OwnAddress, 
 252                     ; 97               I2C_DutyCycle_TypeDef I2C_DutyCycle, I2C_Ack_TypeDef Ack, 
 252                     ; 98               I2C_AddMode_TypeDef AddMode, uint8_t InputClockFrequencyMHz )
 252                     ; 99 {
 253                     .text:	section	.text,new
 254  0000               _I2C_Init:
 256  0000 5209          	subw	sp,#9
 257       00000009      OFST:	set	9
 260                     ; 100   uint16_t result = 0x0004;
 262                     ; 101   uint16_t tmpval = 0;
 264                     ; 102   uint8_t tmpccrh = 0;
 266  0002 0f07          	clr	(OFST-2,sp)
 268                     ; 105   assert_param(IS_I2C_ACK_OK(Ack));
 270                     ; 106   assert_param(IS_I2C_ADDMODE_OK(AddMode));
 272                     ; 107   assert_param(IS_I2C_OWN_ADDRESS_OK(OwnAddress));
 274                     ; 108   assert_param(IS_I2C_DUTYCYCLE_OK(I2C_DutyCycle));  
 276                     ; 109   assert_param(IS_I2C_INPUT_CLOCK_FREQ_OK(InputClockFrequencyMHz));
 278                     ; 110   assert_param(IS_I2C_OUTPUT_CLOCK_FREQ_OK(OutputClockFrequencyHz));
 280                     ; 115   I2C->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
 282  0004 c65212        	ld	a,21010
 283  0007 a4c0          	and	a,#192
 284  0009 c75212        	ld	21010,a
 285                     ; 117   I2C->FREQR |= InputClockFrequencyMHz;
 287  000c c65212        	ld	a,21010
 288  000f 1a15          	or	a,(OFST+12,sp)
 289  0011 c75212        	ld	21010,a
 290                     ; 121   I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
 292  0014 72115210      	bres	21008,#0
 293                     ; 124   I2C->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
 295  0018 c6521c        	ld	a,21020
 296  001b a430          	and	a,#48
 297  001d c7521c        	ld	21020,a
 298                     ; 125   I2C->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
 300  0020 725f521b      	clr	21019
 301                     ; 128   if (OutputClockFrequencyHz > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
 303  0024 96            	ldw	x,sp
 304  0025 1c000c        	addw	x,#OFST+3
 305  0028 cd0000        	call	c_ltor
 307  002b ae0000        	ldw	x,#L01
 308  002e cd0000        	call	c_lcmp
 310  0031 2403          	jruge	L41
 311  0033 cc00c0        	jp	L511
 312  0036               L41:
 313                     ; 131     tmpccrh = I2C_CCRH_FS;
 315  0036 a680          	ld	a,#128
 316  0038 6b07          	ld	(OFST-2,sp),a
 318                     ; 133     if (I2C_DutyCycle == I2C_DUTYCYCLE_2)
 320  003a 0d12          	tnz	(OFST+9,sp)
 321  003c 2630          	jrne	L711
 322                     ; 136       result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 3));
 324  003e 96            	ldw	x,sp
 325  003f 1c000c        	addw	x,#OFST+3
 326  0042 cd0000        	call	c_ltor
 328  0045 a603          	ld	a,#3
 329  0047 cd0000        	call	c_smul
 331  004a 96            	ldw	x,sp
 332  004b 1c0001        	addw	x,#OFST-8
 333  004e cd0000        	call	c_rtol
 336  0051 7b15          	ld	a,(OFST+12,sp)
 337  0053 b703          	ld	c_lreg+3,a
 338  0055 3f02          	clr	c_lreg+2
 339  0057 3f01          	clr	c_lreg+1
 340  0059 3f00          	clr	c_lreg
 341  005b ae0004        	ldw	x,#L21
 342  005e cd0000        	call	c_lmul
 344  0061 96            	ldw	x,sp
 345  0062 1c0001        	addw	x,#OFST-8
 346  0065 cd0000        	call	c_ludv
 348  0068 be02          	ldw	x,c_lreg+2
 349  006a 1f08          	ldw	(OFST-1,sp),x
 352  006c 2034          	jra	L121
 353  006e               L711:
 354                     ; 141       result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 25));
 356  006e 96            	ldw	x,sp
 357  006f 1c000c        	addw	x,#OFST+3
 358  0072 cd0000        	call	c_ltor
 360  0075 a619          	ld	a,#25
 361  0077 cd0000        	call	c_smul
 363  007a 96            	ldw	x,sp
 364  007b 1c0001        	addw	x,#OFST-8
 365  007e cd0000        	call	c_rtol
 368  0081 7b15          	ld	a,(OFST+12,sp)
 369  0083 b703          	ld	c_lreg+3,a
 370  0085 3f02          	clr	c_lreg+2
 371  0087 3f01          	clr	c_lreg+1
 372  0089 3f00          	clr	c_lreg
 373  008b ae0004        	ldw	x,#L21
 374  008e cd0000        	call	c_lmul
 376  0091 96            	ldw	x,sp
 377  0092 1c0001        	addw	x,#OFST-8
 378  0095 cd0000        	call	c_ludv
 380  0098 be02          	ldw	x,c_lreg+2
 381  009a 1f08          	ldw	(OFST-1,sp),x
 383                     ; 143       tmpccrh |= I2C_CCRH_DUTY;
 385  009c 7b07          	ld	a,(OFST-2,sp)
 386  009e aa40          	or	a,#64
 387  00a0 6b07          	ld	(OFST-2,sp),a
 389  00a2               L121:
 390                     ; 147     if (result < (uint16_t)0x01)
 392  00a2 1e08          	ldw	x,(OFST-1,sp)
 393  00a4 2605          	jrne	L321
 394                     ; 150       result = (uint16_t)0x0001;
 396  00a6 ae0001        	ldw	x,#1
 397  00a9 1f08          	ldw	(OFST-1,sp),x
 399  00ab               L321:
 400                     ; 156     tmpval = ((InputClockFrequencyMHz * 3) / 10) + 1;
 402  00ab 7b15          	ld	a,(OFST+12,sp)
 403  00ad 97            	ld	xl,a
 404  00ae a603          	ld	a,#3
 405  00b0 42            	mul	x,a
 406  00b1 a60a          	ld	a,#10
 407  00b3 cd0000        	call	c_sdivx
 409  00b6 5c            	incw	x
 410  00b7 1f05          	ldw	(OFST-4,sp),x
 412                     ; 157     I2C->TRISER = (uint8_t)tmpval;
 414  00b9 7b06          	ld	a,(OFST-3,sp)
 415  00bb c7521d        	ld	21021,a
 417  00be 2043          	jra	L521
 418  00c0               L511:
 419                     ; 164     result = (uint16_t)((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz << (uint8_t)1));
 421  00c0 96            	ldw	x,sp
 422  00c1 1c000c        	addw	x,#OFST+3
 423  00c4 cd0000        	call	c_ltor
 425  00c7 3803          	sll	c_lreg+3
 426  00c9 3902          	rlc	c_lreg+2
 427  00cb 3901          	rlc	c_lreg+1
 428  00cd 3900          	rlc	c_lreg
 429  00cf 96            	ldw	x,sp
 430  00d0 1c0001        	addw	x,#OFST-8
 431  00d3 cd0000        	call	c_rtol
 434  00d6 7b15          	ld	a,(OFST+12,sp)
 435  00d8 b703          	ld	c_lreg+3,a
 436  00da 3f02          	clr	c_lreg+2
 437  00dc 3f01          	clr	c_lreg+1
 438  00de 3f00          	clr	c_lreg
 439  00e0 ae0004        	ldw	x,#L21
 440  00e3 cd0000        	call	c_lmul
 442  00e6 96            	ldw	x,sp
 443  00e7 1c0001        	addw	x,#OFST-8
 444  00ea cd0000        	call	c_ludv
 446  00ed be02          	ldw	x,c_lreg+2
 447  00ef 1f08          	ldw	(OFST-1,sp),x
 449                     ; 167     if (result < (uint16_t)0x0004)
 451  00f1 1e08          	ldw	x,(OFST-1,sp)
 452  00f3 a30004        	cpw	x,#4
 453  00f6 2405          	jruge	L721
 454                     ; 170       result = (uint16_t)0x0004;
 456  00f8 ae0004        	ldw	x,#4
 457  00fb 1f08          	ldw	(OFST-1,sp),x
 459  00fd               L721:
 460                     ; 176     I2C->TRISER = (uint8_t)(InputClockFrequencyMHz + (uint8_t)1);
 462  00fd 7b15          	ld	a,(OFST+12,sp)
 463  00ff 4c            	inc	a
 464  0100 c7521d        	ld	21021,a
 465  0103               L521:
 466                     ; 181   I2C->CCRL = (uint8_t)result;
 468  0103 7b09          	ld	a,(OFST+0,sp)
 469  0105 c7521b        	ld	21019,a
 470                     ; 182   I2C->CCRH = (uint8_t)((uint8_t)((uint8_t)(result >> 8) & I2C_CCRH_CCR) | tmpccrh);
 472  0108 7b08          	ld	a,(OFST-1,sp)
 473  010a a40f          	and	a,#15
 474  010c 1a07          	or	a,(OFST-2,sp)
 475  010e c7521c        	ld	21020,a
 476                     ; 185   I2C->CR1 |= I2C_CR1_PE;
 478  0111 72105210      	bset	21008,#0
 479                     ; 188   I2C_AcknowledgeConfig(Ack);
 481  0115 7b13          	ld	a,(OFST+10,sp)
 482  0117 cd0000        	call	_I2C_AcknowledgeConfig
 484                     ; 191   I2C->OARL = (uint8_t)(OwnAddress);
 486  011a 7b11          	ld	a,(OFST+8,sp)
 487  011c c75213        	ld	21011,a
 488                     ; 192   I2C->OARH = (uint8_t)((uint8_t)(AddMode | I2C_OARH_ADDCONF) |
 488                     ; 193                    (uint8_t)((OwnAddress & (uint16_t)0x0300) >> (uint8_t)7));
 490  011f 1e10          	ldw	x,(OFST+7,sp)
 491  0121 4f            	clr	a
 492  0122 01            	rrwa	x,a
 493  0123 48            	sll	a
 494  0124 59            	rlcw	x
 495  0125 01            	rrwa	x,a
 496  0126 a406          	and	a,#6
 497  0128 5f            	clrw	x
 498  0129 6b04          	ld	(OFST-5,sp),a
 500  012b 7b14          	ld	a,(OFST+11,sp)
 501  012d aa40          	or	a,#64
 502  012f 1a04          	or	a,(OFST-5,sp)
 503  0131 c75214        	ld	21012,a
 504                     ; 194 }
 507  0134 5b09          	addw	sp,#9
 508  0136 81            	ret
 563                     ; 202 void I2C_Cmd(FunctionalState NewState)
 563                     ; 203 {
 564                     .text:	section	.text,new
 565  0000               _I2C_Cmd:
 569                     ; 205   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 571                     ; 207   if (NewState != DISABLE)
 573  0000 4d            	tnz	a
 574  0001 2706          	jreq	L751
 575                     ; 210     I2C->CR1 |= I2C_CR1_PE;
 577  0003 72105210      	bset	21008,#0
 579  0007 2004          	jra	L161
 580  0009               L751:
 581                     ; 215     I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
 583  0009 72115210      	bres	21008,#0
 584  000d               L161:
 585                     ; 217 }
 588  000d 81            	ret
 623                     ; 225 void I2C_GeneralCallCmd(FunctionalState NewState)
 623                     ; 226 {
 624                     .text:	section	.text,new
 625  0000               _I2C_GeneralCallCmd:
 629                     ; 228   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 631                     ; 230   if (NewState != DISABLE)
 633  0000 4d            	tnz	a
 634  0001 2706          	jreq	L102
 635                     ; 233     I2C->CR1 |= I2C_CR1_ENGC;
 637  0003 721c5210      	bset	21008,#6
 639  0007 2004          	jra	L302
 640  0009               L102:
 641                     ; 238     I2C->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
 643  0009 721d5210      	bres	21008,#6
 644  000d               L302:
 645                     ; 240 }
 648  000d 81            	ret
 683                     ; 250 void I2C_GenerateSTART(FunctionalState NewState)
 683                     ; 251 {
 684                     .text:	section	.text,new
 685  0000               _I2C_GenerateSTART:
 689                     ; 253   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 691                     ; 255   if (NewState != DISABLE)
 693  0000 4d            	tnz	a
 694  0001 2706          	jreq	L322
 695                     ; 258     I2C->CR2 |= I2C_CR2_START;
 697  0003 72105211      	bset	21009,#0
 699  0007 2004          	jra	L522
 700  0009               L322:
 701                     ; 263     I2C->CR2 &= (uint8_t)(~I2C_CR2_START);
 703  0009 72115211      	bres	21009,#0
 704  000d               L522:
 705                     ; 265 }
 708  000d 81            	ret
 743                     ; 273 void I2C_GenerateSTOP(FunctionalState NewState)
 743                     ; 274 {
 744                     .text:	section	.text,new
 745  0000               _I2C_GenerateSTOP:
 749                     ; 276   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 751                     ; 278   if (NewState != DISABLE)
 753  0000 4d            	tnz	a
 754  0001 2706          	jreq	L542
 755                     ; 281     I2C->CR2 |= I2C_CR2_STOP;
 757  0003 72125211      	bset	21009,#1
 759  0007 2004          	jra	L742
 760  0009               L542:
 761                     ; 286     I2C->CR2 &= (uint8_t)(~I2C_CR2_STOP);
 763  0009 72135211      	bres	21009,#1
 764  000d               L742:
 765                     ; 288 }
 768  000d 81            	ret
 804                     ; 296 void I2C_SoftwareResetCmd(FunctionalState NewState)
 804                     ; 297 {
 805                     .text:	section	.text,new
 806  0000               _I2C_SoftwareResetCmd:
 810                     ; 299   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 812                     ; 301   if (NewState != DISABLE)
 814  0000 4d            	tnz	a
 815  0001 2706          	jreq	L762
 816                     ; 304     I2C->CR2 |= I2C_CR2_SWRST;
 818  0003 721e5211      	bset	21009,#7
 820  0007 2004          	jra	L172
 821  0009               L762:
 822                     ; 309     I2C->CR2 &= (uint8_t)(~I2C_CR2_SWRST);
 824  0009 721f5211      	bres	21009,#7
 825  000d               L172:
 826                     ; 311 }
 829  000d 81            	ret
 865                     ; 320 void I2C_StretchClockCmd(FunctionalState NewState)
 865                     ; 321 {
 866                     .text:	section	.text,new
 867  0000               _I2C_StretchClockCmd:
 871                     ; 323   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 873                     ; 325   if (NewState != DISABLE)
 875  0000 4d            	tnz	a
 876  0001 2706          	jreq	L113
 877                     ; 328     I2C->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
 879  0003 721f5210      	bres	21008,#7
 881  0007 2004          	jra	L313
 882  0009               L113:
 883                     ; 334     I2C->CR1 |= I2C_CR1_NOSTRETCH;
 885  0009 721e5210      	bset	21008,#7
 886  000d               L313:
 887                     ; 336 }
 890  000d 81            	ret
 926                     ; 345 void I2C_AcknowledgeConfig(I2C_Ack_TypeDef Ack)
 926                     ; 346 {
 927                     .text:	section	.text,new
 928  0000               _I2C_AcknowledgeConfig:
 930  0000 88            	push	a
 931       00000000      OFST:	set	0
 934                     ; 348   assert_param(IS_I2C_ACK_OK(Ack));
 936                     ; 350   if (Ack == I2C_ACK_NONE)
 938  0001 4d            	tnz	a
 939  0002 2606          	jrne	L333
 940                     ; 353     I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);
 942  0004 72155211      	bres	21009,#2
 944  0008 2014          	jra	L533
 945  000a               L333:
 946                     ; 358     I2C->CR2 |= I2C_CR2_ACK;
 948  000a 72145211      	bset	21009,#2
 949                     ; 360     if (Ack == I2C_ACK_CURR)
 951  000e 7b01          	ld	a,(OFST+1,sp)
 952  0010 a101          	cp	a,#1
 953  0012 2606          	jrne	L733
 954                     ; 363       I2C->CR2 &= (uint8_t)(~I2C_CR2_POS);
 956  0014 72175211      	bres	21009,#3
 958  0018 2004          	jra	L533
 959  001a               L733:
 960                     ; 368       I2C->CR2 |= I2C_CR2_POS;
 962  001a 72165211      	bset	21009,#3
 963  001e               L533:
 964                     ; 371 }
 967  001e 84            	pop	a
 968  001f 81            	ret
1040                     ; 381 void I2C_ITConfig(I2C_IT_TypeDef I2C_IT, FunctionalState NewState)
1040                     ; 382 {
1041                     .text:	section	.text,new
1042  0000               _I2C_ITConfig:
1044  0000 89            	pushw	x
1045       00000000      OFST:	set	0
1048                     ; 384   assert_param(IS_I2C_INTERRUPT_OK(I2C_IT));
1050                     ; 385   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1052                     ; 387   if (NewState != DISABLE)
1054  0001 9f            	ld	a,xl
1055  0002 4d            	tnz	a
1056  0003 2709          	jreq	L773
1057                     ; 390     I2C->ITR |= (uint8_t)I2C_IT;
1059  0005 9e            	ld	a,xh
1060  0006 ca521a        	or	a,21018
1061  0009 c7521a        	ld	21018,a
1063  000c 2009          	jra	L104
1064  000e               L773:
1065                     ; 395     I2C->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
1067  000e 7b01          	ld	a,(OFST+1,sp)
1068  0010 43            	cpl	a
1069  0011 c4521a        	and	a,21018
1070  0014 c7521a        	ld	21018,a
1071  0017               L104:
1072                     ; 397 }
1075  0017 85            	popw	x
1076  0018 81            	ret
1112                     ; 405 void I2C_FastModeDutyCycleConfig(I2C_DutyCycle_TypeDef I2C_DutyCycle)
1112                     ; 406 {
1113                     .text:	section	.text,new
1114  0000               _I2C_FastModeDutyCycleConfig:
1118                     ; 408   assert_param(IS_I2C_DUTYCYCLE_OK(I2C_DutyCycle));
1120                     ; 410   if (I2C_DutyCycle == I2C_DUTYCYCLE_16_9)
1122  0000 a140          	cp	a,#64
1123  0002 2606          	jrne	L124
1124                     ; 413     I2C->CCRH |= I2C_CCRH_DUTY;
1126  0004 721c521c      	bset	21020,#6
1128  0008 2004          	jra	L324
1129  000a               L124:
1130                     ; 418     I2C->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
1132  000a 721d521c      	bres	21020,#6
1133  000e               L324:
1134                     ; 420 }
1137  000e 81            	ret
1160                     ; 427 uint8_t I2C_ReceiveData(void)
1160                     ; 428 {
1161                     .text:	section	.text,new
1162  0000               _I2C_ReceiveData:
1166                     ; 430   return ((uint8_t)I2C->DR);
1168  0000 c65216        	ld	a,21014
1171  0003 81            	ret
1234                     ; 440 void I2C_Send7bitAddress(uint8_t Address, I2C_Direction_TypeDef Direction)
1234                     ; 441 {
1235                     .text:	section	.text,new
1236  0000               _I2C_Send7bitAddress:
1238  0000 89            	pushw	x
1239       00000000      OFST:	set	0
1242                     ; 443   assert_param(IS_I2C_ADDRESS_OK(Address));
1244                     ; 444   assert_param(IS_I2C_DIRECTION_OK(Direction));
1246                     ; 447   Address &= (uint8_t)0xFE;
1248  0001 7b01          	ld	a,(OFST+1,sp)
1249  0003 a4fe          	and	a,#254
1250  0005 6b01          	ld	(OFST+1,sp),a
1251                     ; 450   I2C->DR = (uint8_t)(Address | (uint8_t)Direction);
1253  0007 7b01          	ld	a,(OFST+1,sp)
1254  0009 1a02          	or	a,(OFST+2,sp)
1255  000b c75216        	ld	21014,a
1256                     ; 451 }
1259  000e 85            	popw	x
1260  000f 81            	ret
1292                     ; 458 void I2C_SendData(uint8_t Data)
1292                     ; 459 {
1293                     .text:	section	.text,new
1294  0000               _I2C_SendData:
1298                     ; 461   I2C->DR = Data;
1300  0000 c75216        	ld	21014,a
1301                     ; 462 }
1304  0003 81            	ret
1524                     ; 578 ErrorStatus I2C_CheckEvent(I2C_Event_TypeDef I2C_Event)
1524                     ; 579 {
1525                     .text:	section	.text,new
1526  0000               _I2C_CheckEvent:
1528  0000 89            	pushw	x
1529  0001 5206          	subw	sp,#6
1530       00000006      OFST:	set	6
1533                     ; 580   __IO uint16_t lastevent = 0x00;
1535  0003 5f            	clrw	x
1536  0004 1f04          	ldw	(OFST-2,sp),x
1538                     ; 581   uint8_t flag1 = 0x00 ;
1540                     ; 582   uint8_t flag2 = 0x00;
1542                     ; 583   ErrorStatus status = ERROR;
1544                     ; 586   assert_param(IS_I2C_EVENT_OK(I2C_Event));
1546                     ; 588   if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
1548  0006 1e07          	ldw	x,(OFST+1,sp)
1549  0008 a30004        	cpw	x,#4
1550  000b 260b          	jrne	L506
1551                     ; 590     lastevent = I2C->SR2 & I2C_SR2_AF;
1553  000d c65218        	ld	a,21016
1554  0010 a404          	and	a,#4
1555  0012 5f            	clrw	x
1556  0013 97            	ld	xl,a
1557  0014 1f04          	ldw	(OFST-2,sp),x
1560  0016 201f          	jra	L706
1561  0018               L506:
1562                     ; 594     flag1 = I2C->SR1;
1564  0018 c65217        	ld	a,21015
1565  001b 6b03          	ld	(OFST-3,sp),a
1567                     ; 595     flag2 = I2C->SR3;
1569  001d c65219        	ld	a,21017
1570  0020 6b06          	ld	(OFST+0,sp),a
1572                     ; 596     lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
1574  0022 7b03          	ld	a,(OFST-3,sp)
1575  0024 5f            	clrw	x
1576  0025 97            	ld	xl,a
1577  0026 1f01          	ldw	(OFST-5,sp),x
1579  0028 7b06          	ld	a,(OFST+0,sp)
1580  002a 5f            	clrw	x
1581  002b 97            	ld	xl,a
1582  002c 4f            	clr	a
1583  002d 02            	rlwa	x,a
1584  002e 01            	rrwa	x,a
1585  002f 1a02          	or	a,(OFST-4,sp)
1586  0031 01            	rrwa	x,a
1587  0032 1a01          	or	a,(OFST-5,sp)
1588  0034 01            	rrwa	x,a
1589  0035 1f04          	ldw	(OFST-2,sp),x
1591  0037               L706:
1592                     ; 599   if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
1594  0037 1e04          	ldw	x,(OFST-2,sp)
1595  0039 01            	rrwa	x,a
1596  003a 1408          	and	a,(OFST+2,sp)
1597  003c 01            	rrwa	x,a
1598  003d 1407          	and	a,(OFST+1,sp)
1599  003f 01            	rrwa	x,a
1600  0040 1307          	cpw	x,(OFST+1,sp)
1601  0042 2606          	jrne	L116
1602                     ; 602     status = SUCCESS;
1604  0044 a601          	ld	a,#1
1605  0046 6b06          	ld	(OFST+0,sp),a
1608  0048 2002          	jra	L316
1609  004a               L116:
1610                     ; 607     status = ERROR;
1612  004a 0f06          	clr	(OFST+0,sp)
1614  004c               L316:
1615                     ; 611   return status;
1617  004c 7b06          	ld	a,(OFST+0,sp)
1620  004e 5b08          	addw	sp,#8
1621  0050 81            	ret
1670                     ; 628 I2C_Event_TypeDef I2C_GetLastEvent(void)
1670                     ; 629 {
1671                     .text:	section	.text,new
1672  0000               _I2C_GetLastEvent:
1674  0000 5206          	subw	sp,#6
1675       00000006      OFST:	set	6
1678                     ; 630   __IO uint16_t lastevent = 0;
1680  0002 5f            	clrw	x
1681  0003 1f05          	ldw	(OFST-1,sp),x
1683                     ; 631   uint16_t flag1 = 0;
1685                     ; 632   uint16_t flag2 = 0;
1687                     ; 634   if ((I2C->SR2 & I2C_SR2_AF) != 0x00)
1689  0005 c65218        	ld	a,21016
1690  0008 a504          	bcp	a,#4
1691  000a 2707          	jreq	L736
1692                     ; 636     lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
1694  000c ae0004        	ldw	x,#4
1695  000f 1f05          	ldw	(OFST-1,sp),x
1698  0011 201b          	jra	L146
1699  0013               L736:
1700                     ; 641     flag1 = I2C->SR1;
1702  0013 c65217        	ld	a,21015
1703  0016 5f            	clrw	x
1704  0017 97            	ld	xl,a
1705  0018 1f01          	ldw	(OFST-5,sp),x
1707                     ; 642     flag2 = I2C->SR3;
1709  001a c65219        	ld	a,21017
1710  001d 5f            	clrw	x
1711  001e 97            	ld	xl,a
1712  001f 1f03          	ldw	(OFST-3,sp),x
1714                     ; 645     lastevent = ((uint16_t)((uint16_t)flag2 << 8) | (uint16_t)flag1);
1716  0021 1e03          	ldw	x,(OFST-3,sp)
1717  0023 4f            	clr	a
1718  0024 02            	rlwa	x,a
1719  0025 01            	rrwa	x,a
1720  0026 1a02          	or	a,(OFST-4,sp)
1721  0028 01            	rrwa	x,a
1722  0029 1a01          	or	a,(OFST-5,sp)
1723  002b 01            	rrwa	x,a
1724  002c 1f05          	ldw	(OFST-1,sp),x
1726  002e               L146:
1727                     ; 648   return (I2C_Event_TypeDef)lastevent;
1729  002e 1e05          	ldw	x,(OFST-1,sp)
1732  0030 5b06          	addw	sp,#6
1733  0032 81            	ret
1944                     ; 679 FlagStatus I2C_GetFlagStatus(I2C_Flag_TypeDef I2C_Flag)
1944                     ; 680 {
1945                     .text:	section	.text,new
1946  0000               _I2C_GetFlagStatus:
1948  0000 89            	pushw	x
1949  0001 89            	pushw	x
1950       00000002      OFST:	set	2
1953                     ; 681   uint8_t tempreg = 0;
1955  0002 0f02          	clr	(OFST+0,sp)
1957                     ; 682   uint8_t regindex = 0;
1959                     ; 683   FlagStatus bitstatus = RESET;
1961                     ; 686   assert_param(IS_I2C_FLAG_OK(I2C_Flag));
1963                     ; 689   regindex = (uint8_t)((uint16_t)I2C_Flag >> 8);
1965  0004 9e            	ld	a,xh
1966  0005 6b01          	ld	(OFST-1,sp),a
1968                     ; 691   switch (regindex)
1970  0007 7b01          	ld	a,(OFST-1,sp)
1972                     ; 708     default:
1972                     ; 709       break;
1973  0009 4a            	dec	a
1974  000a 2708          	jreq	L346
1975  000c 4a            	dec	a
1976  000d 270c          	jreq	L546
1977  000f 4a            	dec	a
1978  0010 2710          	jreq	L746
1979  0012 2013          	jra	L757
1980  0014               L346:
1981                     ; 694     case 0x01:
1981                     ; 695       tempreg = (uint8_t)I2C->SR1;
1983  0014 c65217        	ld	a,21015
1984  0017 6b02          	ld	(OFST+0,sp),a
1986                     ; 696       break;
1988  0019 200c          	jra	L757
1989  001b               L546:
1990                     ; 699     case 0x02:
1990                     ; 700       tempreg = (uint8_t)I2C->SR2;
1992  001b c65218        	ld	a,21016
1993  001e 6b02          	ld	(OFST+0,sp),a
1995                     ; 701       break;
1997  0020 2005          	jra	L757
1998  0022               L746:
1999                     ; 704     case 0x03:
1999                     ; 705       tempreg = (uint8_t)I2C->SR3;
2001  0022 c65219        	ld	a,21017
2002  0025 6b02          	ld	(OFST+0,sp),a
2004                     ; 706       break;
2006  0027               L156:
2007                     ; 708     default:
2007                     ; 709       break;
2009  0027               L757:
2010                     ; 713   if ((tempreg & (uint8_t)I2C_Flag ) != 0)
2012  0027 7b04          	ld	a,(OFST+2,sp)
2013  0029 1502          	bcp	a,(OFST+0,sp)
2014  002b 2706          	jreq	L167
2015                     ; 716     bitstatus = SET;
2017  002d a601          	ld	a,#1
2018  002f 6b02          	ld	(OFST+0,sp),a
2021  0031 2002          	jra	L367
2022  0033               L167:
2023                     ; 721     bitstatus = RESET;
2025  0033 0f02          	clr	(OFST+0,sp)
2027  0035               L367:
2028                     ; 724   return bitstatus;
2030  0035 7b02          	ld	a,(OFST+0,sp)
2033  0037 5b04          	addw	sp,#4
2034  0039 81            	ret
2076                     ; 759 void I2C_ClearFlag(I2C_Flag_TypeDef I2C_FLAG)
2076                     ; 760 {
2077                     .text:	section	.text,new
2078  0000               _I2C_ClearFlag:
2080  0000 89            	pushw	x
2081       00000002      OFST:	set	2
2084                     ; 761   uint16_t flagpos = 0;
2086                     ; 763   assert_param(IS_I2C_CLEAR_FLAG_OK(I2C_FLAG));
2088                     ; 766   flagpos = (uint16_t)I2C_FLAG & FLAG_Mask;
2090  0001 01            	rrwa	x,a
2091  0002 a4ff          	and	a,#255
2092  0004 5f            	clrw	x
2093  0005 02            	rlwa	x,a
2094  0006 1f01          	ldw	(OFST-1,sp),x
2095  0008 01            	rrwa	x,a
2097                     ; 768   I2C->SR2 = (uint8_t)((uint16_t)(~flagpos));
2099  0009 7b02          	ld	a,(OFST+0,sp)
2100  000b 43            	cpl	a
2101  000c c75218        	ld	21016,a
2102                     ; 769 }
2105  000f 85            	popw	x
2106  0010 81            	ret
2270                     ; 791 ITStatus I2C_GetITStatus(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
2270                     ; 792 {
2271                     .text:	section	.text,new
2272  0000               _I2C_GetITStatus:
2274  0000 89            	pushw	x
2275  0001 5204          	subw	sp,#4
2276       00000004      OFST:	set	4
2279                     ; 793   ITStatus bitstatus = RESET;
2281                     ; 794   __IO uint8_t enablestatus = 0;
2283  0003 0f03          	clr	(OFST-1,sp)
2285                     ; 795   uint16_t tempregister = 0;
2287                     ; 798     assert_param(IS_I2C_ITPENDINGBIT_OK(I2C_ITPendingBit));
2289                     ; 800   tempregister = (uint8_t)( ((uint16_t)((uint16_t)I2C_ITPendingBit & ITEN_Mask)) >> 8);
2291  0005 9e            	ld	a,xh
2292  0006 a407          	and	a,#7
2293  0008 5f            	clrw	x
2294  0009 97            	ld	xl,a
2295  000a 1f01          	ldw	(OFST-3,sp),x
2297                     ; 803   enablestatus = (uint8_t)(I2C->ITR & ( uint8_t)tempregister);
2299  000c c6521a        	ld	a,21018
2300  000f 1402          	and	a,(OFST-2,sp)
2301  0011 6b03          	ld	(OFST-1,sp),a
2303                     ; 805   if ((uint16_t)((uint16_t)I2C_ITPendingBit & REGISTER_Mask) == REGISTER_SR1_Index)
2305  0013 7b05          	ld	a,(OFST+1,sp)
2306  0015 97            	ld	xl,a
2307  0016 7b06          	ld	a,(OFST+2,sp)
2308  0018 9f            	ld	a,xl
2309  0019 a430          	and	a,#48
2310  001b 97            	ld	xl,a
2311  001c 4f            	clr	a
2312  001d 02            	rlwa	x,a
2313  001e a30100        	cpw	x,#256
2314  0021 2615          	jrne	L1701
2315                     ; 808     if (((I2C->SR1 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
2317  0023 c65217        	ld	a,21015
2318  0026 1506          	bcp	a,(OFST+2,sp)
2319  0028 270a          	jreq	L3701
2321  002a 0d03          	tnz	(OFST-1,sp)
2322  002c 2706          	jreq	L3701
2323                     ; 811       bitstatus = SET;
2325  002e a601          	ld	a,#1
2326  0030 6b04          	ld	(OFST+0,sp),a
2329  0032 2017          	jra	L7701
2330  0034               L3701:
2331                     ; 816       bitstatus = RESET;
2333  0034 0f04          	clr	(OFST+0,sp)
2335  0036 2013          	jra	L7701
2336  0038               L1701:
2337                     ; 822     if (((I2C->SR2 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
2339  0038 c65218        	ld	a,21016
2340  003b 1506          	bcp	a,(OFST+2,sp)
2341  003d 270a          	jreq	L1011
2343  003f 0d03          	tnz	(OFST-1,sp)
2344  0041 2706          	jreq	L1011
2345                     ; 825       bitstatus = SET;
2347  0043 a601          	ld	a,#1
2348  0045 6b04          	ld	(OFST+0,sp),a
2351  0047 2002          	jra	L7701
2352  0049               L1011:
2353                     ; 830       bitstatus = RESET;
2355  0049 0f04          	clr	(OFST+0,sp)
2357  004b               L7701:
2358                     ; 834   return  bitstatus;
2360  004b 7b04          	ld	a,(OFST+0,sp)
2363  004d 5b06          	addw	sp,#6
2364  004f 81            	ret
2407                     ; 871 void I2C_ClearITPendingBit(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
2407                     ; 872 {
2408                     .text:	section	.text,new
2409  0000               _I2C_ClearITPendingBit:
2411  0000 89            	pushw	x
2412       00000002      OFST:	set	2
2415                     ; 873   uint16_t flagpos = 0;
2417                     ; 876   assert_param(IS_I2C_CLEAR_ITPENDINGBIT_OK(I2C_ITPendingBit));
2419                     ; 879   flagpos = (uint16_t)I2C_ITPendingBit & FLAG_Mask;
2421  0001 01            	rrwa	x,a
2422  0002 a4ff          	and	a,#255
2423  0004 5f            	clrw	x
2424  0005 02            	rlwa	x,a
2425  0006 1f01          	ldw	(OFST-1,sp),x
2426  0008 01            	rrwa	x,a
2428                     ; 882   I2C->SR2 = (uint8_t)((uint16_t)~flagpos);
2430  0009 7b02          	ld	a,(OFST+0,sp)
2431  000b 43            	cpl	a
2432  000c c75218        	ld	21016,a
2433                     ; 883 }
2436  000f 85            	popw	x
2437  0010 81            	ret
2450                     	xdef	_I2C_ClearITPendingBit
2451                     	xdef	_I2C_GetITStatus
2452                     	xdef	_I2C_ClearFlag
2453                     	xdef	_I2C_GetFlagStatus
2454                     	xdef	_I2C_GetLastEvent
2455                     	xdef	_I2C_CheckEvent
2456                     	xdef	_I2C_SendData
2457                     	xdef	_I2C_Send7bitAddress
2458                     	xdef	_I2C_ReceiveData
2459                     	xdef	_I2C_ITConfig
2460                     	xdef	_I2C_FastModeDutyCycleConfig
2461                     	xdef	_I2C_AcknowledgeConfig
2462                     	xdef	_I2C_StretchClockCmd
2463                     	xdef	_I2C_SoftwareResetCmd
2464                     	xdef	_I2C_GenerateSTOP
2465                     	xdef	_I2C_GenerateSTART
2466                     	xdef	_I2C_GeneralCallCmd
2467                     	xdef	_I2C_Cmd
2468                     	xdef	_I2C_Init
2469                     	xdef	_I2C_DeInit
2470                     	xref.b	c_lreg
2471                     	xref.b	c_x
2490                     	xref	c_sdivx
2491                     	xref	c_ludv
2492                     	xref	c_rtol
2493                     	xref	c_smul
2494                     	xref	c_lmul
2495                     	xref	c_lcmp
2496                     	xref	c_ltor
2497                     	end
