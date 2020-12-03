   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  43                     ; 53 void EXTI_DeInit(void)
  43                     ; 54 {
  45                     .text:	section	.text,new
  46  0000               _EXTI_DeInit:
  50                     ; 55   EXTI->CR1 = EXTI_CR1_RESET_VALUE;
  52  0000 725f50a0      	clr	20640
  53                     ; 56   EXTI->CR2 = EXTI_CR2_RESET_VALUE;
  55  0004 725f50a1      	clr	20641
  56                     ; 57 }
  59  0008 81            	ret
 184                     ; 70 void EXTI_SetExtIntSensitivity(EXTI_Port_TypeDef Port, EXTI_Sensitivity_TypeDef SensitivityValue)
 184                     ; 71 {
 185                     .text:	section	.text,new
 186  0000               _EXTI_SetExtIntSensitivity:
 188  0000 89            	pushw	x
 189       00000000      OFST:	set	0
 192                     ; 73   assert_param(IS_EXTI_PORT_OK(Port));
 194                     ; 74   assert_param(IS_EXTI_SENSITIVITY_OK(SensitivityValue));
 196                     ; 77   switch (Port)
 198  0001 9e            	ld	a,xh
 200                     ; 99   default:
 200                     ; 100     break;
 201  0002 4d            	tnz	a
 202  0003 270e          	jreq	L12
 203  0005 4a            	dec	a
 204  0006 271d          	jreq	L32
 205  0008 4a            	dec	a
 206  0009 272e          	jreq	L52
 207  000b 4a            	dec	a
 208  000c 2742          	jreq	L72
 209  000e 4a            	dec	a
 210  000f 2756          	jreq	L13
 211  0011 2064          	jra	L311
 212  0013               L12:
 213                     ; 79   case EXTI_PORT_GPIOA:
 213                     ; 80     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PAIS);
 215  0013 c650a0        	ld	a,20640
 216  0016 a4fc          	and	a,#252
 217  0018 c750a0        	ld	20640,a
 218                     ; 81     EXTI->CR1 |= (uint8_t)(SensitivityValue);
 220  001b c650a0        	ld	a,20640
 221  001e 1a02          	or	a,(OFST+2,sp)
 222  0020 c750a0        	ld	20640,a
 223                     ; 82     break;
 225  0023 2052          	jra	L311
 226  0025               L32:
 227                     ; 83   case EXTI_PORT_GPIOB:
 227                     ; 84     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PBIS);
 229  0025 c650a0        	ld	a,20640
 230  0028 a4f3          	and	a,#243
 231  002a c750a0        	ld	20640,a
 232                     ; 85     EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 2);
 234  002d 7b02          	ld	a,(OFST+2,sp)
 235  002f 48            	sll	a
 236  0030 48            	sll	a
 237  0031 ca50a0        	or	a,20640
 238  0034 c750a0        	ld	20640,a
 239                     ; 86     break;
 241  0037 203e          	jra	L311
 242  0039               L52:
 243                     ; 87   case EXTI_PORT_GPIOC:
 243                     ; 88     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PCIS);
 245  0039 c650a0        	ld	a,20640
 246  003c a4cf          	and	a,#207
 247  003e c750a0        	ld	20640,a
 248                     ; 89     EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 4);
 250  0041 7b02          	ld	a,(OFST+2,sp)
 251  0043 97            	ld	xl,a
 252  0044 a610          	ld	a,#16
 253  0046 42            	mul	x,a
 254  0047 9f            	ld	a,xl
 255  0048 ca50a0        	or	a,20640
 256  004b c750a0        	ld	20640,a
 257                     ; 90     break;
 259  004e 2027          	jra	L311
 260  0050               L72:
 261                     ; 91   case EXTI_PORT_GPIOD:
 261                     ; 92     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PDIS);
 263  0050 c650a0        	ld	a,20640
 264  0053 a43f          	and	a,#63
 265  0055 c750a0        	ld	20640,a
 266                     ; 93     EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 6);
 268  0058 7b02          	ld	a,(OFST+2,sp)
 269  005a 97            	ld	xl,a
 270  005b a640          	ld	a,#64
 271  005d 42            	mul	x,a
 272  005e 9f            	ld	a,xl
 273  005f ca50a0        	or	a,20640
 274  0062 c750a0        	ld	20640,a
 275                     ; 94     break;
 277  0065 2010          	jra	L311
 278  0067               L13:
 279                     ; 95   case EXTI_PORT_GPIOE:
 279                     ; 96     EXTI->CR2 &= (uint8_t)(~EXTI_CR2_PEIS);
 281  0067 c650a1        	ld	a,20641
 282  006a a4fc          	and	a,#252
 283  006c c750a1        	ld	20641,a
 284                     ; 97     EXTI->CR2 |= (uint8_t)(SensitivityValue);
 286  006f c650a1        	ld	a,20641
 287  0072 1a02          	or	a,(OFST+2,sp)
 288  0074 c750a1        	ld	20641,a
 289                     ; 98     break;
 291  0077               L33:
 292                     ; 99   default:
 292                     ; 100     break;
 294  0077               L311:
 295                     ; 102 }
 298  0077 85            	popw	x
 299  0078 81            	ret
 357                     ; 111 void EXTI_SetTLISensitivity(EXTI_TLISensitivity_TypeDef SensitivityValue)
 357                     ; 112 {
 358                     .text:	section	.text,new
 359  0000               _EXTI_SetTLISensitivity:
 363                     ; 114   assert_param(IS_EXTI_TLISENSITIVITY_OK(SensitivityValue));
 365                     ; 117   EXTI->CR2 &= (uint8_t)(~EXTI_CR2_TLIS);
 367  0000 721550a1      	bres	20641,#2
 368                     ; 118   EXTI->CR2 |= (uint8_t)(SensitivityValue);
 370  0004 ca50a1        	or	a,20641
 371  0007 c750a1        	ld	20641,a
 372                     ; 119 }
 375  000a 81            	ret
 419                     ; 126 EXTI_Sensitivity_TypeDef EXTI_GetExtIntSensitivity(EXTI_Port_TypeDef Port)
 419                     ; 127 {
 420                     .text:	section	.text,new
 421  0000               _EXTI_GetExtIntSensitivity:
 423  0000 88            	push	a
 424       00000001      OFST:	set	1
 427                     ; 128   uint8_t value = 0;
 429  0001 0f01          	clr	(OFST+0,sp)
 431                     ; 131   assert_param(IS_EXTI_PORT_OK(Port));
 433                     ; 133   switch (Port)
 436                     ; 150   default:
 436                     ; 151     break;
 437  0003 4d            	tnz	a
 438  0004 270e          	jreq	L341
 439  0006 4a            	dec	a
 440  0007 2714          	jreq	L541
 441  0009 4a            	dec	a
 442  000a 271c          	jreq	L741
 443  000c 4a            	dec	a
 444  000d 2725          	jreq	L151
 445  000f 4a            	dec	a
 446  0010 2730          	jreq	L351
 447  0012 2035          	jra	L102
 448  0014               L341:
 449                     ; 135   case EXTI_PORT_GPIOA:
 449                     ; 136     value = (uint8_t)(EXTI->CR1 & EXTI_CR1_PAIS);
 451  0014 c650a0        	ld	a,20640
 452  0017 a403          	and	a,#3
 453  0019 6b01          	ld	(OFST+0,sp),a
 455                     ; 137     break;
 457  001b 202c          	jra	L102
 458  001d               L541:
 459                     ; 138   case EXTI_PORT_GPIOB:
 459                     ; 139     value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PBIS) >> 2);
 461  001d c650a0        	ld	a,20640
 462  0020 a40c          	and	a,#12
 463  0022 44            	srl	a
 464  0023 44            	srl	a
 465  0024 6b01          	ld	(OFST+0,sp),a
 467                     ; 140     break;
 469  0026 2021          	jra	L102
 470  0028               L741:
 471                     ; 141   case EXTI_PORT_GPIOC:
 471                     ; 142     value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PCIS) >> 4);
 473  0028 c650a0        	ld	a,20640
 474  002b a430          	and	a,#48
 475  002d 4e            	swap	a
 476  002e a40f          	and	a,#15
 477  0030 6b01          	ld	(OFST+0,sp),a
 479                     ; 143     break;
 481  0032 2015          	jra	L102
 482  0034               L151:
 483                     ; 144   case EXTI_PORT_GPIOD:
 483                     ; 145     value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PDIS) >> 6);
 485  0034 c650a0        	ld	a,20640
 486  0037 a4c0          	and	a,#192
 487  0039 4e            	swap	a
 488  003a 44            	srl	a
 489  003b 44            	srl	a
 490  003c a403          	and	a,#3
 491  003e 6b01          	ld	(OFST+0,sp),a
 493                     ; 146     break;
 495  0040 2007          	jra	L102
 496  0042               L351:
 497                     ; 147   case EXTI_PORT_GPIOE:
 497                     ; 148     value = (uint8_t)(EXTI->CR2 & EXTI_CR2_PEIS);
 499  0042 c650a1        	ld	a,20641
 500  0045 a403          	and	a,#3
 501  0047 6b01          	ld	(OFST+0,sp),a
 503                     ; 149     break;
 505  0049               L551:
 506                     ; 150   default:
 506                     ; 151     break;
 508  0049               L102:
 509                     ; 154   return((EXTI_Sensitivity_TypeDef)value);
 511  0049 7b01          	ld	a,(OFST+0,sp)
 514  004b 5b01          	addw	sp,#1
 515  004d 81            	ret
 549                     ; 162 EXTI_TLISensitivity_TypeDef EXTI_GetTLISensitivity(void)
 549                     ; 163 {
 550                     .text:	section	.text,new
 551  0000               _EXTI_GetTLISensitivity:
 553  0000 88            	push	a
 554       00000001      OFST:	set	1
 557                     ; 164   uint8_t value = 0;
 559                     ; 167   value = (uint8_t)(EXTI->CR2 & EXTI_CR2_TLIS);
 561  0001 c650a1        	ld	a,20641
 562  0004 a404          	and	a,#4
 563  0006 6b01          	ld	(OFST+0,sp),a
 565                     ; 169   return((EXTI_TLISensitivity_TypeDef)value);
 567  0008 7b01          	ld	a,(OFST+0,sp)
 570  000a 5b01          	addw	sp,#1
 571  000c 81            	ret
 584                     	xdef	_EXTI_GetTLISensitivity
 585                     	xdef	_EXTI_GetExtIntSensitivity
 586                     	xdef	_EXTI_SetTLISensitivity
 587                     	xdef	_EXTI_SetExtIntSensitivity
 588                     	xdef	_EXTI_DeInit
 607                     	end
