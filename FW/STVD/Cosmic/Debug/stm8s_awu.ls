   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  15                     .const:	section	.text
  16  0000               _APR_Array:
  17  0000 00            	dc.b	0
  18  0001 1e            	dc.b	30
  19  0002 1e            	dc.b	30
  20  0003 1e            	dc.b	30
  21  0004 1e            	dc.b	30
  22  0005 1e            	dc.b	30
  23  0006 1e            	dc.b	30
  24  0007 1e            	dc.b	30
  25  0008 1e            	dc.b	30
  26  0009 1e            	dc.b	30
  27  000a 1e            	dc.b	30
  28  000b 1e            	dc.b	30
  29  000c 1e            	dc.b	30
  30  000d 3d            	dc.b	61
  31  000e 17            	dc.b	23
  32  000f 17            	dc.b	23
  33  0010 3e            	dc.b	62
  34  0011               _TBR_Array:
  35  0011 00            	dc.b	0
  36  0012 01            	dc.b	1
  37  0013 02            	dc.b	2
  38  0014 03            	dc.b	3
  39  0015 04            	dc.b	4
  40  0016 05            	dc.b	5
  41  0017 06            	dc.b	6
  42  0018 07            	dc.b	7
  43  0019 08            	dc.b	8
  44  001a 09            	dc.b	9
  45  001b 0a            	dc.b	10
  46  001c 0b            	dc.b	11
  47  001d 0c            	dc.b	12
  48  001e 0c            	dc.b	12
  49  001f 0e            	dc.b	14
  50  0020 0f            	dc.b	15
  51  0021 0f            	dc.b	15
  80                     ; 73 void AWU_DeInit(void)
  80                     ; 74 {
  82                     .text:	section	.text,new
  83  0000               _AWU_DeInit:
  87                     ; 75   AWU->CSR = AWU_CSR_RESET_VALUE;
  89  0000 725f50f0      	clr	20720
  90                     ; 76   AWU->APR = AWU_APR_RESET_VALUE;
  92  0004 353f50f1      	mov	20721,#63
  93                     ; 77   AWU->TBR = AWU_TBR_RESET_VALUE;
  95  0008 725f50f2      	clr	20722
  96                     ; 78 }
  99  000c 81            	ret
 261                     ; 88 void AWU_Init(AWU_Timebase_TypeDef AWU_TimeBase)
 261                     ; 89 {
 262                     .text:	section	.text,new
 263  0000               _AWU_Init:
 265  0000 88            	push	a
 266       00000000      OFST:	set	0
 269                     ; 91   assert_param(IS_AWU_TIMEBASE_OK(AWU_TimeBase));
 271                     ; 94   AWU->CSR |= AWU_CSR_AWUEN;
 273  0001 721850f0      	bset	20720,#4
 274                     ; 97   AWU->TBR &= (uint8_t)(~AWU_TBR_AWUTB);
 276  0005 c650f2        	ld	a,20722
 277  0008 a4f0          	and	a,#240
 278  000a c750f2        	ld	20722,a
 279                     ; 98   AWU->TBR |= TBR_Array[(uint8_t)AWU_TimeBase];
 281  000d 7b01          	ld	a,(OFST+1,sp)
 282  000f 5f            	clrw	x
 283  0010 97            	ld	xl,a
 284  0011 c650f2        	ld	a,20722
 285  0014 da0011        	or	a,(_TBR_Array,x)
 286  0017 c750f2        	ld	20722,a
 287                     ; 101   AWU->APR &= (uint8_t)(~AWU_APR_APR);
 289  001a c650f1        	ld	a,20721
 290  001d a4c0          	and	a,#192
 291  001f c750f1        	ld	20721,a
 292                     ; 102   AWU->APR |= APR_Array[(uint8_t)AWU_TimeBase];
 294  0022 7b01          	ld	a,(OFST+1,sp)
 295  0024 5f            	clrw	x
 296  0025 97            	ld	xl,a
 297  0026 c650f1        	ld	a,20721
 298  0029 da0000        	or	a,(_APR_Array,x)
 299  002c c750f1        	ld	20721,a
 300                     ; 103 }
 303  002f 84            	pop	a
 304  0030 81            	ret
 359                     ; 112 void AWU_Cmd(FunctionalState NewState)
 359                     ; 113 {
 360                     .text:	section	.text,new
 361  0000               _AWU_Cmd:
 365                     ; 114   if (NewState != DISABLE)
 367  0000 4d            	tnz	a
 368  0001 2706          	jreq	L331
 369                     ; 117     AWU->CSR |= AWU_CSR_AWUEN;
 371  0003 721850f0      	bset	20720,#4
 373  0007 2004          	jra	L531
 374  0009               L331:
 375                     ; 122     AWU->CSR &= (uint8_t)(~AWU_CSR_AWUEN);
 377  0009 721950f0      	bres	20720,#4
 378  000d               L531:
 379                     ; 124 }
 382  000d 81            	ret
 429                     	switch	.const
 430  0022               L41:
 431  0022 000003e8      	dc.l	1000
 432                     ; 139 void AWU_LSICalibrationConfig(uint32_t LSIFreqHz)
 432                     ; 140 {
 433                     .text:	section	.text,new
 434  0000               _AWU_LSICalibrationConfig:
 436  0000 5206          	subw	sp,#6
 437       00000006      OFST:	set	6
 440                     ; 141   uint16_t lsifreqkhz = 0x0;
 442                     ; 142   uint16_t A = 0x0;
 444                     ; 145   assert_param(IS_LSI_FREQUENCY_OK(LSIFreqHz));
 446                     ; 147   lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
 448  0002 96            	ldw	x,sp
 449  0003 1c0009        	addw	x,#OFST+3
 450  0006 cd0000        	call	c_ltor
 452  0009 ae0022        	ldw	x,#L41
 453  000c cd0000        	call	c_ludv
 455  000f be02          	ldw	x,c_lreg+2
 456  0011 1f03          	ldw	(OFST-3,sp),x
 458                     ; 151   A = (uint16_t)(lsifreqkhz >> 2U); /* Division by 4, keep integer part only */
 460  0013 1e03          	ldw	x,(OFST-3,sp)
 461  0015 54            	srlw	x
 462  0016 54            	srlw	x
 463  0017 1f05          	ldw	(OFST-1,sp),x
 465                     ; 153   if ((4U * A) >= ((lsifreqkhz - (4U * A)) * (1U + (2U * A))))
 467  0019 1e05          	ldw	x,(OFST-1,sp)
 468  001b 58            	sllw	x
 469  001c 58            	sllw	x
 470  001d 1f01          	ldw	(OFST-5,sp),x
 472  001f 1e03          	ldw	x,(OFST-3,sp)
 473  0021 72f001        	subw	x,(OFST-5,sp)
 474  0024 1605          	ldw	y,(OFST-1,sp)
 475  0026 9058          	sllw	y
 476  0028 905c          	incw	y
 477  002a cd0000        	call	c_imul
 479  002d 1605          	ldw	y,(OFST-1,sp)
 480  002f 9058          	sllw	y
 481  0031 9058          	sllw	y
 482  0033 bf00          	ldw	c_x,x
 483  0035 90b300        	cpw	y,c_x
 484  0038 2509          	jrult	L751
 485                     ; 155     AWU->APR = (uint8_t)(A - 2U);
 487  003a 7b06          	ld	a,(OFST+0,sp)
 488  003c a002          	sub	a,#2
 489  003e c750f1        	ld	20721,a
 491  0041 2006          	jra	L161
 492  0043               L751:
 493                     ; 159     AWU->APR = (uint8_t)(A - 1U);
 495  0043 7b06          	ld	a,(OFST+0,sp)
 496  0045 4a            	dec	a
 497  0046 c750f1        	ld	20721,a
 498  0049               L161:
 499                     ; 161 }
 502  0049 5b06          	addw	sp,#6
 503  004b 81            	ret
 526                     ; 168 void AWU_IdleModeEnable(void)
 526                     ; 169 {
 527                     .text:	section	.text,new
 528  0000               _AWU_IdleModeEnable:
 532                     ; 171   AWU->CSR &= (uint8_t)(~AWU_CSR_AWUEN);
 534  0000 721950f0      	bres	20720,#4
 535                     ; 174   AWU->TBR = (uint8_t)(~AWU_TBR_AWUTB);
 537  0004 35f050f2      	mov	20722,#240
 538                     ; 175 }
 541  0008 81            	ret
 585                     ; 183 FlagStatus AWU_GetFlagStatus(void)
 585                     ; 184 {
 586                     .text:	section	.text,new
 587  0000               _AWU_GetFlagStatus:
 591                     ; 185   return((FlagStatus)(((uint8_t)(AWU->CSR & AWU_CSR_AWUF) == (uint8_t)0x00) ? RESET : SET));
 593  0000 c650f0        	ld	a,20720
 594  0003 a520          	bcp	a,#32
 595  0005 2603          	jrne	L22
 596  0007 4f            	clr	a
 597  0008 2002          	jra	L42
 598  000a               L22:
 599  000a a601          	ld	a,#1
 600  000c               L42:
 603  000c 81            	ret
 638                     	xdef	_TBR_Array
 639                     	xdef	_APR_Array
 640                     	xdef	_AWU_GetFlagStatus
 641                     	xdef	_AWU_IdleModeEnable
 642                     	xdef	_AWU_LSICalibrationConfig
 643                     	xdef	_AWU_Cmd
 644                     	xdef	_AWU_Init
 645                     	xdef	_AWU_DeInit
 646                     	xref.b	c_lreg
 647                     	xref.b	c_x
 666                     	xref	c_imul
 667                     	xref	c_ludv
 668                     	xref	c_ltor
 669                     	end
