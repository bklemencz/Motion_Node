   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  43                     ; 50 uint8_t ITC_GetCPUCC(void)
  43                     ; 51 {
  45                     .text:	section	.text,new
  46  0000               _ITC_GetCPUCC:
  50                     ; 53   _asm("push cc");
  53  0000 8a            push cc
  55                     ; 54   _asm("pop a");
  58  0001 84            pop a
  60                     ; 55   return; /* Ignore compiler warning, the returned value is in A register */
  63  0002 81            	ret
  86                     ; 80 void ITC_DeInit(void)
  86                     ; 81 {
  87                     .text:	section	.text,new
  88  0000               _ITC_DeInit:
  92                     ; 82   ITC->ISPR1 = ITC_SPRX_RESET_VALUE;
  94  0000 35ff7f70      	mov	32624,#255
  95                     ; 83   ITC->ISPR2 = ITC_SPRX_RESET_VALUE;
  97  0004 35ff7f71      	mov	32625,#255
  98                     ; 84   ITC->ISPR3 = ITC_SPRX_RESET_VALUE;
 100  0008 35ff7f72      	mov	32626,#255
 101                     ; 85   ITC->ISPR4 = ITC_SPRX_RESET_VALUE;
 103  000c 35ff7f73      	mov	32627,#255
 104                     ; 86   ITC->ISPR5 = ITC_SPRX_RESET_VALUE;
 106  0010 35ff7f74      	mov	32628,#255
 107                     ; 87   ITC->ISPR6 = ITC_SPRX_RESET_VALUE;
 109  0014 35ff7f75      	mov	32629,#255
 110                     ; 88   ITC->ISPR7 = ITC_SPRX_RESET_VALUE;
 112  0018 35ff7f76      	mov	32630,#255
 113                     ; 89   ITC->ISPR8 = ITC_SPRX_RESET_VALUE;
 115  001c 35ff7f77      	mov	32631,#255
 116                     ; 90 }
 119  0020 81            	ret
 144                     ; 97 uint8_t ITC_GetSoftIntStatus(void)
 144                     ; 98 {
 145                     .text:	section	.text,new
 146  0000               _ITC_GetSoftIntStatus:
 150                     ; 99   return (uint8_t)(ITC_GetCPUCC() & CPU_CC_I1I0);
 152  0000 cd0000        	call	_ITC_GetCPUCC
 154  0003 a428          	and	a,#40
 157  0005 81            	ret
 402                     .const:	section	.text
 403  0000               L22:
 404  0000 0023          	dc.w	L14
 405  0002 0023          	dc.w	L14
 406  0004 0023          	dc.w	L14
 407  0006 0023          	dc.w	L14
 408  0008 002c          	dc.w	L34
 409  000a 002c          	dc.w	L34
 410  000c 002c          	dc.w	L34
 411  000e 002c          	dc.w	L34
 412  0010 0060          	dc.w	L771
 413  0012 0060          	dc.w	L771
 414  0014 0035          	dc.w	L54
 415  0016 0035          	dc.w	L54
 416  0018 003e          	dc.w	L74
 417  001a 003e          	dc.w	L74
 418  001c 003e          	dc.w	L74
 419  001e 003e          	dc.w	L74
 420  0020 0047          	dc.w	L15
 421  0022 0060          	dc.w	L771
 422  0024 0060          	dc.w	L771
 423  0026 0047          	dc.w	L15
 424  0028 0050          	dc.w	L35
 425  002a 0050          	dc.w	L35
 426  002c 0050          	dc.w	L35
 427  002e 0050          	dc.w	L35
 428  0030 0059          	dc.w	L55
 429                     ; 107 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(ITC_Irq_TypeDef IrqNum)
 429                     ; 108 {
 430                     .text:	section	.text,new
 431  0000               _ITC_GetSoftwarePriority:
 433  0000 88            	push	a
 434  0001 89            	pushw	x
 435       00000002      OFST:	set	2
 438                     ; 109   uint8_t Value = 0;
 440  0002 0f02          	clr	(OFST+0,sp)
 442                     ; 110   uint8_t Mask = 0;
 444                     ; 113   assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 446                     ; 116   Mask = (uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U));
 448  0004 a403          	and	a,#3
 449  0006 48            	sll	a
 450  0007 5f            	clrw	x
 451  0008 97            	ld	xl,a
 452  0009 a603          	ld	a,#3
 453  000b 5d            	tnzw	x
 454  000c 2704          	jreq	L41
 455  000e               L61:
 456  000e 48            	sll	a
 457  000f 5a            	decw	x
 458  0010 26fc          	jrne	L61
 459  0012               L41:
 460  0012 6b01          	ld	(OFST-1,sp),a
 462                     ; 118   switch (IrqNum)
 464  0014 7b03          	ld	a,(OFST+1,sp)
 466                     ; 198   default:
 466                     ; 199     break;
 467  0016 a119          	cp	a,#25
 468  0018 2407          	jruge	L02
 469  001a 5f            	clrw	x
 470  001b 97            	ld	xl,a
 471  001c 58            	sllw	x
 472  001d de0000        	ldw	x,(L22,x)
 473  0020 fc            	jp	(x)
 474  0021               L02:
 475  0021 203d          	jra	L771
 476  0023               L14:
 477                     ; 120   case ITC_IRQ_TLI: /* TLI software priority can be read but has no meaning */
 477                     ; 121   case ITC_IRQ_AWU:
 477                     ; 122   case ITC_IRQ_CLK:
 477                     ; 123   case ITC_IRQ_PORTA:
 477                     ; 124     Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
 479  0023 c67f70        	ld	a,32624
 480  0026 1401          	and	a,(OFST-1,sp)
 481  0028 6b02          	ld	(OFST+0,sp),a
 483                     ; 125     break;
 485  002a 2034          	jra	L771
 486  002c               L34:
 487                     ; 127   case ITC_IRQ_PORTB:
 487                     ; 128   case ITC_IRQ_PORTC:
 487                     ; 129   case ITC_IRQ_PORTD:
 487                     ; 130   case ITC_IRQ_PORTE:
 487                     ; 131     Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
 489  002c c67f71        	ld	a,32625
 490  002f 1401          	and	a,(OFST-1,sp)
 491  0031 6b02          	ld	(OFST+0,sp),a
 493                     ; 132     break;
 495  0033 202b          	jra	L771
 496  0035               L54:
 497                     ; 141   case ITC_IRQ_SPI:
 497                     ; 142   case ITC_IRQ_TIM1_OVF:
 497                     ; 143     Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
 499  0035 c67f72        	ld	a,32626
 500  0038 1401          	and	a,(OFST-1,sp)
 501  003a 6b02          	ld	(OFST+0,sp),a
 503                     ; 144     break;
 505  003c 2022          	jra	L771
 506  003e               L74:
 507                     ; 146   case ITC_IRQ_TIM1_CAPCOM:
 507                     ; 147 #if defined (STM8S903) || defined (STM8AF622x)
 507                     ; 148   case ITC_IRQ_TIM5_OVFTRI:
 507                     ; 149   case ITC_IRQ_TIM5_CAPCOM:
 507                     ; 150 #else
 507                     ; 151   case ITC_IRQ_TIM2_OVF:
 507                     ; 152   case ITC_IRQ_TIM2_CAPCOM:
 507                     ; 153 #endif /* STM8S903 or STM8AF622x*/
 507                     ; 154   case ITC_IRQ_TIM3_OVF:
 507                     ; 155     Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
 509  003e c67f73        	ld	a,32627
 510  0041 1401          	and	a,(OFST-1,sp)
 511  0043 6b02          	ld	(OFST+0,sp),a
 513                     ; 156     break;
 515  0045 2019          	jra	L771
 516  0047               L15:
 517                     ; 158   case ITC_IRQ_TIM3_CAPCOM:
 517                     ; 159 #if defined(STM8S208) ||defined(STM8S207) || defined (STM8S007) || defined(STM8S103) || \
 517                     ; 160     defined(STM8S003) ||defined(STM8S903) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
 517                     ; 161   case ITC_IRQ_UART1_TX:
 517                     ; 162   case ITC_IRQ_UART1_RX:
 517                     ; 163 #endif /*STM8S208 or STM8S207 or STM8S007 or STM8S103 or STM8S003 or STM8S903 or STM8AF52Ax or STM8AF62Ax */ 
 517                     ; 164 #if defined(STM8AF622x)
 517                     ; 165   case ITC_IRQ_UART4_TX:
 517                     ; 166   case ITC_IRQ_UART4_RX:
 517                     ; 167 #endif /*STM8AF622x */
 517                     ; 168   case ITC_IRQ_I2C:
 517                     ; 169     Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
 519  0047 c67f74        	ld	a,32628
 520  004a 1401          	and	a,(OFST-1,sp)
 521  004c 6b02          	ld	(OFST+0,sp),a
 523                     ; 170     break;
 525  004e 2010          	jra	L771
 526  0050               L35:
 527                     ; 173   case ITC_IRQ_UART2_TX:
 527                     ; 174   case ITC_IRQ_UART2_RX:
 527                     ; 175 #endif /*STM8S105 or STM8AF626x*/
 527                     ; 176 #if defined(STM8S208) || defined(STM8S207) || defined(STM8S007) || defined(STM8AF52Ax) || \
 527                     ; 177     defined(STM8AF62Ax)
 527                     ; 178   case ITC_IRQ_UART3_TX:
 527                     ; 179   case ITC_IRQ_UART3_RX:
 527                     ; 180   case ITC_IRQ_ADC2:
 527                     ; 181 #endif /*STM8S208 or STM8S207 or STM8AF52Ax or STM8AF62Ax */
 527                     ; 182 #if defined(STM8S105) || defined(STM8S005) || defined(STM8S103) || defined(STM8S003) || \
 527                     ; 183     defined(STM8S903) || defined(STM8AF626x) || defined(STM8AF622x)
 527                     ; 184   case ITC_IRQ_ADC1:
 527                     ; 185 #endif /*STM8S105, STM8S005, STM8S103 or STM8S003 or STM8S903 or STM8AF626x or STM8AF622x */
 527                     ; 186 #if defined (STM8S903) || defined (STM8AF622x)
 527                     ; 187   case ITC_IRQ_TIM6_OVFTRI:
 527                     ; 188 #else
 527                     ; 189   case ITC_IRQ_TIM4_OVF:
 527                     ; 190 #endif /*STM8S903 or STM8AF622x */
 527                     ; 191     Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
 529  0050 c67f75        	ld	a,32629
 530  0053 1401          	and	a,(OFST-1,sp)
 531  0055 6b02          	ld	(OFST+0,sp),a
 533                     ; 192     break;
 535  0057 2007          	jra	L771
 536  0059               L55:
 537                     ; 194   case ITC_IRQ_EEPROM_EEC:
 537                     ; 195     Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
 539  0059 c67f76        	ld	a,32630
 540  005c 1401          	and	a,(OFST-1,sp)
 541  005e 6b02          	ld	(OFST+0,sp),a
 543                     ; 196     break;
 545  0060               L75:
 546                     ; 198   default:
 546                     ; 199     break;
 548  0060               L771:
 549                     ; 202   Value >>= (uint8_t)(((uint8_t)IrqNum % 4u) * 2u);
 551  0060 7b03          	ld	a,(OFST+1,sp)
 552  0062 a403          	and	a,#3
 553  0064 48            	sll	a
 554  0065 5f            	clrw	x
 555  0066 97            	ld	xl,a
 556  0067 7b02          	ld	a,(OFST+0,sp)
 557  0069 5d            	tnzw	x
 558  006a 2704          	jreq	L42
 559  006c               L62:
 560  006c 44            	srl	a
 561  006d 5a            	decw	x
 562  006e 26fc          	jrne	L62
 563  0070               L42:
 564  0070 6b02          	ld	(OFST+0,sp),a
 566                     ; 204   return((ITC_PriorityLevel_TypeDef)Value);
 568  0072 7b02          	ld	a,(OFST+0,sp)
 571  0074 5b03          	addw	sp,#3
 572  0076 81            	ret
 632                     	switch	.const
 633  0032               L44:
 634  0032 0035          	dc.w	L102
 635  0034 0035          	dc.w	L102
 636  0036 0035          	dc.w	L102
 637  0038 0035          	dc.w	L102
 638  003a 0047          	dc.w	L302
 639  003c 0047          	dc.w	L302
 640  003e 0047          	dc.w	L302
 641  0040 0047          	dc.w	L302
 642  0042 00b1          	dc.w	L152
 643  0044 00b1          	dc.w	L152
 644  0046 0059          	dc.w	L502
 645  0048 0059          	dc.w	L502
 646  004a 006b          	dc.w	L702
 647  004c 006b          	dc.w	L702
 648  004e 006b          	dc.w	L702
 649  0050 006b          	dc.w	L702
 650  0052 007d          	dc.w	L112
 651  0054 00b1          	dc.w	L152
 652  0056 00b1          	dc.w	L152
 653  0058 007d          	dc.w	L112
 654  005a 008f          	dc.w	L312
 655  005c 008f          	dc.w	L312
 656  005e 008f          	dc.w	L312
 657  0060 008f          	dc.w	L312
 658  0062 00a1          	dc.w	L512
 659                     ; 220 void ITC_SetSoftwarePriority(ITC_Irq_TypeDef IrqNum, ITC_PriorityLevel_TypeDef PriorityValue)
 659                     ; 221 {
 660                     .text:	section	.text,new
 661  0000               _ITC_SetSoftwarePriority:
 663  0000 89            	pushw	x
 664  0001 89            	pushw	x
 665       00000002      OFST:	set	2
 668                     ; 222   uint8_t Mask = 0;
 670                     ; 223   uint8_t NewPriority = 0;
 672                     ; 226   assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 674                     ; 227   assert_param(IS_ITC_PRIORITY_OK(PriorityValue));
 676                     ; 230   assert_param(IS_ITC_INTERRUPTS_DISABLED);
 678                     ; 234   Mask = (uint8_t)(~(uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U)));
 680  0002 9e            	ld	a,xh
 681  0003 a403          	and	a,#3
 682  0005 48            	sll	a
 683  0006 5f            	clrw	x
 684  0007 97            	ld	xl,a
 685  0008 a603          	ld	a,#3
 686  000a 5d            	tnzw	x
 687  000b 2704          	jreq	L23
 688  000d               L43:
 689  000d 48            	sll	a
 690  000e 5a            	decw	x
 691  000f 26fc          	jrne	L43
 692  0011               L23:
 693  0011 43            	cpl	a
 694  0012 6b01          	ld	(OFST-1,sp),a
 696                     ; 237   NewPriority = (uint8_t)((uint8_t)(PriorityValue) << (((uint8_t)IrqNum % 4U) * 2U));
 698  0014 7b03          	ld	a,(OFST+1,sp)
 699  0016 a403          	and	a,#3
 700  0018 48            	sll	a
 701  0019 5f            	clrw	x
 702  001a 97            	ld	xl,a
 703  001b 7b04          	ld	a,(OFST+2,sp)
 704  001d 5d            	tnzw	x
 705  001e 2704          	jreq	L63
 706  0020               L04:
 707  0020 48            	sll	a
 708  0021 5a            	decw	x
 709  0022 26fc          	jrne	L04
 710  0024               L63:
 711  0024 6b02          	ld	(OFST+0,sp),a
 713                     ; 239   switch (IrqNum)
 715  0026 7b03          	ld	a,(OFST+1,sp)
 717                     ; 329   default:
 717                     ; 330     break;
 718  0028 a119          	cp	a,#25
 719  002a 2407          	jruge	L24
 720  002c 5f            	clrw	x
 721  002d 97            	ld	xl,a
 722  002e 58            	sllw	x
 723  002f de0032        	ldw	x,(L44,x)
 724  0032 fc            	jp	(x)
 725  0033               L24:
 726  0033 207c          	jra	L152
 727  0035               L102:
 728                     ; 241   case ITC_IRQ_TLI: /* TLI software priority can be written but has no meaning */
 728                     ; 242   case ITC_IRQ_AWU:
 728                     ; 243   case ITC_IRQ_CLK:
 728                     ; 244   case ITC_IRQ_PORTA:
 728                     ; 245     ITC->ISPR1 &= Mask;
 730  0035 c67f70        	ld	a,32624
 731  0038 1401          	and	a,(OFST-1,sp)
 732  003a c77f70        	ld	32624,a
 733                     ; 246     ITC->ISPR1 |= NewPriority;
 735  003d c67f70        	ld	a,32624
 736  0040 1a02          	or	a,(OFST+0,sp)
 737  0042 c77f70        	ld	32624,a
 738                     ; 247     break;
 740  0045 206a          	jra	L152
 741  0047               L302:
 742                     ; 249   case ITC_IRQ_PORTB:
 742                     ; 250   case ITC_IRQ_PORTC:
 742                     ; 251   case ITC_IRQ_PORTD:
 742                     ; 252   case ITC_IRQ_PORTE:
 742                     ; 253     ITC->ISPR2 &= Mask;
 744  0047 c67f71        	ld	a,32625
 745  004a 1401          	and	a,(OFST-1,sp)
 746  004c c77f71        	ld	32625,a
 747                     ; 254     ITC->ISPR2 |= NewPriority;
 749  004f c67f71        	ld	a,32625
 750  0052 1a02          	or	a,(OFST+0,sp)
 751  0054 c77f71        	ld	32625,a
 752                     ; 255     break;
 754  0057 2058          	jra	L152
 755  0059               L502:
 756                     ; 264   case ITC_IRQ_SPI:
 756                     ; 265   case ITC_IRQ_TIM1_OVF:
 756                     ; 266     ITC->ISPR3 &= Mask;
 758  0059 c67f72        	ld	a,32626
 759  005c 1401          	and	a,(OFST-1,sp)
 760  005e c77f72        	ld	32626,a
 761                     ; 267     ITC->ISPR3 |= NewPriority;
 763  0061 c67f72        	ld	a,32626
 764  0064 1a02          	or	a,(OFST+0,sp)
 765  0066 c77f72        	ld	32626,a
 766                     ; 268     break;
 768  0069 2046          	jra	L152
 769  006b               L702:
 770                     ; 270   case ITC_IRQ_TIM1_CAPCOM:
 770                     ; 271 #if defined(STM8S903) || defined(STM8AF622x) 
 770                     ; 272   case ITC_IRQ_TIM5_OVFTRI:
 770                     ; 273   case ITC_IRQ_TIM5_CAPCOM:
 770                     ; 274 #else
 770                     ; 275   case ITC_IRQ_TIM2_OVF:
 770                     ; 276   case ITC_IRQ_TIM2_CAPCOM:
 770                     ; 277 #endif /*STM8S903 or STM8AF622x */
 770                     ; 278   case ITC_IRQ_TIM3_OVF:
 770                     ; 279     ITC->ISPR4 &= Mask;
 772  006b c67f73        	ld	a,32627
 773  006e 1401          	and	a,(OFST-1,sp)
 774  0070 c77f73        	ld	32627,a
 775                     ; 280     ITC->ISPR4 |= NewPriority;
 777  0073 c67f73        	ld	a,32627
 778  0076 1a02          	or	a,(OFST+0,sp)
 779  0078 c77f73        	ld	32627,a
 780                     ; 281     break;
 782  007b 2034          	jra	L152
 783  007d               L112:
 784                     ; 283   case ITC_IRQ_TIM3_CAPCOM:
 784                     ; 284 #if defined(STM8S208) ||defined(STM8S207) || defined (STM8S007) || defined(STM8S103) || \
 784                     ; 285     defined(STM8S003) ||defined(STM8S903) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
 784                     ; 286   case ITC_IRQ_UART1_TX:
 784                     ; 287   case ITC_IRQ_UART1_RX:
 784                     ; 288 #endif /*STM8S208 or STM8S207 or STM8S007 or STM8S103 or STM8S003 or STM8S903 or STM8AF52Ax or STM8AF62Ax */ 
 784                     ; 289 #if defined(STM8AF622x)
 784                     ; 290   case ITC_IRQ_UART4_TX:
 784                     ; 291   case ITC_IRQ_UART4_RX:
 784                     ; 292 #endif /*STM8AF622x */
 784                     ; 293   case ITC_IRQ_I2C:
 784                     ; 294     ITC->ISPR5 &= Mask;
 786  007d c67f74        	ld	a,32628
 787  0080 1401          	and	a,(OFST-1,sp)
 788  0082 c77f74        	ld	32628,a
 789                     ; 295     ITC->ISPR5 |= NewPriority;
 791  0085 c67f74        	ld	a,32628
 792  0088 1a02          	or	a,(OFST+0,sp)
 793  008a c77f74        	ld	32628,a
 794                     ; 296     break;
 796  008d 2022          	jra	L152
 797  008f               L312:
 798                     ; 299   case ITC_IRQ_UART2_TX:
 798                     ; 300   case ITC_IRQ_UART2_RX:
 798                     ; 301 #endif /*STM8S105 or STM8AF626x */
 798                     ; 302     
 798                     ; 303 #if defined(STM8S208) || defined(STM8S207) || defined(STM8S007) || defined(STM8AF52Ax) || \
 798                     ; 304     defined(STM8AF62Ax)
 798                     ; 305   case ITC_IRQ_UART3_TX:
 798                     ; 306   case ITC_IRQ_UART3_RX:
 798                     ; 307   case ITC_IRQ_ADC2:
 798                     ; 308 #endif /*STM8S208 or STM8S207 or STM8AF52Ax or STM8AF62Ax */
 798                     ; 309     
 798                     ; 310 #if defined(STM8S105) || defined(STM8S005) || defined(STM8S103) || defined(STM8S003) || \
 798                     ; 311     defined(STM8S903) || defined(STM8AF626x) || defined (STM8AF622x)
 798                     ; 312   case ITC_IRQ_ADC1:
 798                     ; 313 #endif /*STM8S105, STM8S005, STM8S103 or STM8S003 or STM8S903 or STM8AF626x or STM8AF622x */
 798                     ; 314     
 798                     ; 315 #if defined (STM8S903) || defined (STM8AF622x)
 798                     ; 316   case ITC_IRQ_TIM6_OVFTRI:
 798                     ; 317 #else
 798                     ; 318   case ITC_IRQ_TIM4_OVF:
 798                     ; 319 #endif /* STM8S903 or STM8AF622x */
 798                     ; 320     ITC->ISPR6 &= Mask;
 800  008f c67f75        	ld	a,32629
 801  0092 1401          	and	a,(OFST-1,sp)
 802  0094 c77f75        	ld	32629,a
 803                     ; 321     ITC->ISPR6 |= NewPriority;
 805  0097 c67f75        	ld	a,32629
 806  009a 1a02          	or	a,(OFST+0,sp)
 807  009c c77f75        	ld	32629,a
 808                     ; 322     break;
 810  009f 2010          	jra	L152
 811  00a1               L512:
 812                     ; 324   case ITC_IRQ_EEPROM_EEC:
 812                     ; 325     ITC->ISPR7 &= Mask;
 814  00a1 c67f76        	ld	a,32630
 815  00a4 1401          	and	a,(OFST-1,sp)
 816  00a6 c77f76        	ld	32630,a
 817                     ; 326     ITC->ISPR7 |= NewPriority;
 819  00a9 c67f76        	ld	a,32630
 820  00ac 1a02          	or	a,(OFST+0,sp)
 821  00ae c77f76        	ld	32630,a
 822                     ; 327     break;
 824  00b1               L712:
 825                     ; 329   default:
 825                     ; 330     break;
 827  00b1               L152:
 828                     ; 332 }
 831  00b1 5b04          	addw	sp,#4
 832  00b3 81            	ret
 845                     	xdef	_ITC_GetSoftwarePriority
 846                     	xdef	_ITC_SetSoftwarePriority
 847                     	xdef	_ITC_GetSoftIntStatus
 848                     	xdef	_ITC_DeInit
 849                     	xdef	_ITC_GetCPUCC
 868                     	end
