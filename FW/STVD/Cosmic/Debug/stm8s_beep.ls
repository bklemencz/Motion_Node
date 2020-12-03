   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  43                     ; 54 void BEEP_DeInit(void)
  43                     ; 55 {
  45                     .text:	section	.text,new
  46  0000               _BEEP_DeInit:
  50                     ; 56   BEEP->CSR = BEEP_CSR_RESET_VALUE;
  52  0000 351f50f3      	mov	20723,#31
  53                     ; 57 }
  56  0004 81            	ret
 121                     ; 67 void BEEP_Init(BEEP_Frequency_TypeDef BEEP_Frequency)
 121                     ; 68 {
 122                     .text:	section	.text,new
 123  0000               _BEEP_Init:
 125  0000 88            	push	a
 126       00000000      OFST:	set	0
 129                     ; 70   assert_param(IS_BEEP_FREQUENCY_OK(BEEP_Frequency));
 131                     ; 73   if ((BEEP->CSR & BEEP_CSR_BEEPDIV) == BEEP_CSR_BEEPDIV)
 133  0001 c650f3        	ld	a,20723
 134  0004 a41f          	and	a,#31
 135  0006 a11f          	cp	a,#31
 136  0008 2610          	jrne	L15
 137                     ; 75     BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPDIV); /* Clear bits */
 139  000a c650f3        	ld	a,20723
 140  000d a4e0          	and	a,#224
 141  000f c750f3        	ld	20723,a
 142                     ; 76     BEEP->CSR |= BEEP_CALIBRATION_DEFAULT;
 144  0012 c650f3        	ld	a,20723
 145  0015 aa0b          	or	a,#11
 146  0017 c750f3        	ld	20723,a
 147  001a               L15:
 148                     ; 80   BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPSEL);
 150  001a c650f3        	ld	a,20723
 151  001d a43f          	and	a,#63
 152  001f c750f3        	ld	20723,a
 153                     ; 81   BEEP->CSR |= (uint8_t)(BEEP_Frequency);
 155  0022 c650f3        	ld	a,20723
 156  0025 1a01          	or	a,(OFST+1,sp)
 157  0027 c750f3        	ld	20723,a
 158                     ; 82 }
 161  002a 84            	pop	a
 162  002b 81            	ret
 217                     ; 91 void BEEP_Cmd(FunctionalState NewState)
 217                     ; 92 {
 218                     .text:	section	.text,new
 219  0000               _BEEP_Cmd:
 223                     ; 93   if (NewState != DISABLE)
 225  0000 4d            	tnz	a
 226  0001 2706          	jreq	L101
 227                     ; 96     BEEP->CSR |= BEEP_CSR_BEEPEN;
 229  0003 721a50f3      	bset	20723,#5
 231  0007 2004          	jra	L301
 232  0009               L101:
 233                     ; 101     BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPEN);
 235  0009 721b50f3      	bres	20723,#5
 236  000d               L301:
 237                     ; 103 }
 240  000d 81            	ret
 287                     .const:	section	.text
 288  0000               L41:
 289  0000 000003e8      	dc.l	1000
 290                     ; 118 void BEEP_LSICalibrationConfig(uint32_t LSIFreqHz)
 290                     ; 119 {
 291                     .text:	section	.text,new
 292  0000               _BEEP_LSICalibrationConfig:
 294  0000 5206          	subw	sp,#6
 295       00000006      OFST:	set	6
 298                     ; 124   assert_param(IS_LSI_FREQUENCY_OK(LSIFreqHz));
 300                     ; 126   lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
 302  0002 96            	ldw	x,sp
 303  0003 1c0009        	addw	x,#OFST+3
 304  0006 cd0000        	call	c_ltor
 306  0009 ae0000        	ldw	x,#L41
 307  000c cd0000        	call	c_ludv
 309  000f be02          	ldw	x,c_lreg+2
 310  0011 1f03          	ldw	(OFST-3,sp),x
 312                     ; 130   BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPDIV); /* Clear bits */
 314  0013 c650f3        	ld	a,20723
 315  0016 a4e0          	and	a,#224
 316  0018 c750f3        	ld	20723,a
 317                     ; 132   A = (uint16_t)(lsifreqkhz >> 3U); /* Division by 8, keep integer part only */
 319  001b 1e03          	ldw	x,(OFST-3,sp)
 320  001d 54            	srlw	x
 321  001e 54            	srlw	x
 322  001f 54            	srlw	x
 323  0020 1f05          	ldw	(OFST-1,sp),x
 325                     ; 134   if ((8U * A) >= ((lsifreqkhz - (8U * A)) * (1U + (2U * A))))
 327  0022 1e05          	ldw	x,(OFST-1,sp)
 328  0024 58            	sllw	x
 329  0025 58            	sllw	x
 330  0026 58            	sllw	x
 331  0027 1f01          	ldw	(OFST-5,sp),x
 333  0029 1e03          	ldw	x,(OFST-3,sp)
 334  002b 72f001        	subw	x,(OFST-5,sp)
 335  002e 1605          	ldw	y,(OFST-1,sp)
 336  0030 9058          	sllw	y
 337  0032 905c          	incw	y
 338  0034 cd0000        	call	c_imul
 340  0037 1605          	ldw	y,(OFST-1,sp)
 341  0039 9058          	sllw	y
 342  003b 9058          	sllw	y
 343  003d 9058          	sllw	y
 344  003f bf00          	ldw	c_x,x
 345  0041 90b300        	cpw	y,c_x
 346  0044 250c          	jrult	L521
 347                     ; 136     BEEP->CSR |= (uint8_t)(A - 2U);
 349  0046 7b06          	ld	a,(OFST+0,sp)
 350  0048 a002          	sub	a,#2
 351  004a ca50f3        	or	a,20723
 352  004d c750f3        	ld	20723,a
 354  0050 2009          	jra	L721
 355  0052               L521:
 356                     ; 140     BEEP->CSR |= (uint8_t)(A - 1U);
 358  0052 7b06          	ld	a,(OFST+0,sp)
 359  0054 4a            	dec	a
 360  0055 ca50f3        	or	a,20723
 361  0058 c750f3        	ld	20723,a
 362  005b               L721:
 363                     ; 142 }
 366  005b 5b06          	addw	sp,#6
 367  005d 81            	ret
 380                     	xdef	_BEEP_LSICalibrationConfig
 381                     	xdef	_BEEP_Cmd
 382                     	xdef	_BEEP_Init
 383                     	xdef	_BEEP_DeInit
 384                     	xref.b	c_lreg
 385                     	xref.b	c_x
 404                     	xref	c_imul
 405                     	xref	c_ludv
 406                     	xref	c_ltor
 407                     	end
