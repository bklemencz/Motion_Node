   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
   4                     ; Optimizer V4.4.11 - 19 Nov 2019
  48                     ; 59 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
  48                     ; 60 {
  49                     	switch	.text
  50  0000               f_NonHandledInterrupt:
  54                     ; 64 }
  57  0000 80            	iret	
  79                     ; 72 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  79                     ; 73 {
  80                     	switch	.text
  81  0001               f_TRAP_IRQHandler:
  85                     ; 77 }
  88  0001 80            	iret	
 110                     ; 84 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
 110                     ; 85 
 110                     ; 86 {
 111                     	switch	.text
 112  0002               f_TLI_IRQHandler:
 116                     ; 90 }
 119  0002 80            	iret	
 141                     ; 97 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 141                     ; 98 {
 142                     	switch	.text
 143  0003               f_AWU_IRQHandler:
 147                     ; 102 }
 150  0003 80            	iret	
 172                     ; 109 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 172                     ; 110 {
 173                     	switch	.text
 174  0004               f_CLK_IRQHandler:
 178                     ; 114 }
 181  0004 80            	iret	
 204                     ; 121 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 204                     ; 122 {
 205                     	switch	.text
 206  0005               f_EXTI_PORTA_IRQHandler:
 210                     ; 126 }
 213  0005 80            	iret	
 236                     ; 133 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 236                     ; 134 {
 237                     	switch	.text
 238  0006               f_EXTI_PORTB_IRQHandler:
 242                     ; 138 }
 245  0006 80            	iret	
 276                     ; 145 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 276                     ; 146 {
 277                     	switch	.text
 278  0007               f_EXTI_PORTC_IRQHandler:
 280  0007 8a            	push	cc
 281  0008 84            	pop	a
 282  0009 a4bf          	and	a,#191
 283  000b 88            	push	a
 284  000c 86            	pop	cc
 285  000d 3b0002        	push	c_x+2
 286  0010 be00          	ldw	x,c_x
 287  0012 89            	pushw	x
 288  0013 3b0002        	push	c_y+2
 289  0016 be00          	ldw	x,c_y
 290  0018 89            	pushw	x
 293                     ; 150   if (GPIO_ReadInputPin(RADAR_GPIO_PORT, (GPIO_Pin_TypeDef)RADAR_PIN))
 295  0019 4b08          	push	#8
 296  001b ae500a        	ldw	x,#20490
 297  001e cd0000        	call	_GPIO_ReadInputPin
 299  0021 5b01          	addw	sp,#1
 300  0023 4d            	tnz	a
 301  0024 271b          	jreq	L311
 302                     ; 152     RADAR_Motion = TRUE;
 304  0026 35010000      	mov	_RADAR_Motion,#1
 305                     ; 153     if (Status_Disp_EN) GPIO_WriteHigh(STATUS_2_GPIO_PORT, (GPIO_Pin_TypeDef) STATUS_2_PIN);
 307  002a 725d0000      	tnz	_Status_Disp_EN
 308  002e 2709          	jreq	L511
 311  0030 4b01          	push	#1
 312  0032 ae500f        	ldw	x,#20495
 313  0035 cd0000        	call	_GPIO_WriteHigh
 315  0038 84            	pop	a
 316  0039               L511:
 317                     ; 154     RADAR_Conf_Timer = RADAR_DELAY_MS;
 319  0039 ae017c        	ldw	x,#380
 320  003c cf0000        	ldw	_RADAR_Conf_Timer,x
 322  003f 200c          	jra	L711
 323  0041               L311:
 324                     ; 157     RADAR_Motion = FALSE;
 326  0041 c70000        	ld	_RADAR_Motion,a
 327                     ; 158     GPIO_WriteLow(STATUS_2_GPIO_PORT, (GPIO_Pin_TypeDef) STATUS_2_PIN);
 329  0044 4b01          	push	#1
 330  0046 ae500f        	ldw	x,#20495
 331  0049 cd0000        	call	_GPIO_WriteLow
 333  004c 84            	pop	a
 334  004d               L711:
 335                     ; 161   if (GPIO_ReadInputPin(PIR_GPIO_PORT, (GPIO_Pin_TypeDef) PIR_PIN))
 337  004d 4b04          	push	#4
 338  004f ae500a        	ldw	x,#20490
 339  0052 cd0000        	call	_GPIO_ReadInputPin
 341  0055 5b01          	addw	sp,#1
 342  0057 4d            	tnz	a
 343  0058 271b          	jreq	L121
 344                     ; 163     PIR_Motion = TRUE;
 346  005a 35010000      	mov	_PIR_Motion,#1
 347                     ; 164     if (Status_Disp_EN) GPIO_WriteHigh(STATUS_3_GPIO_PORT, (GPIO_Pin_TypeDef) STATUS_3_PIN);
 349  005e 725d0000      	tnz	_Status_Disp_EN
 350  0062 2709          	jreq	L321
 353  0064 4b04          	push	#4
 354  0066 ae500f        	ldw	x,#20495
 355  0069 cd0000        	call	_GPIO_WriteHigh
 357  006c 84            	pop	a
 358  006d               L321:
 359                     ; 165     PIR_Conf_Timer = PIR_DELAY_MS;
 361  006d ae017c        	ldw	x,#380
 362  0070 cf0000        	ldw	_PIR_Conf_Timer,x
 364  0073 200c          	jra	L521
 365  0075               L121:
 366                     ; 168     PIR_Motion = FALSE;
 368  0075 c70000        	ld	_PIR_Motion,a
 369                     ; 169     GPIO_WriteLow(STATUS_3_GPIO_PORT, (GPIO_Pin_TypeDef) STATUS_3_PIN);
 371  0078 4b04          	push	#4
 372  007a ae500f        	ldw	x,#20495
 373  007d cd0000        	call	_GPIO_WriteLow
 375  0080 84            	pop	a
 376  0081               L521:
 377                     ; 171 }
 380  0081 85            	popw	x
 381  0082 bf00          	ldw	c_y,x
 382  0084 320002        	pop	c_y+2
 383  0087 85            	popw	x
 384  0088 bf00          	ldw	c_x,x
 385  008a 320002        	pop	c_x+2
 386  008d 80            	iret	
 409                     ; 178 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 409                     ; 179 {
 410                     	switch	.text
 411  008e               f_EXTI_PORTD_IRQHandler:
 415                     ; 183 }
 418  008e 80            	iret	
 441                     ; 190 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 441                     ; 191 {
 442                     	switch	.text
 443  008f               f_EXTI_PORTE_IRQHandler:
 447                     ; 195 }
 450  008f 80            	iret	
 472                     ; 242 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 472                     ; 243 {
 473                     	switch	.text
 474  0090               f_SPI_IRQHandler:
 478                     ; 247 }
 481  0090 80            	iret	
 504                     ; 254 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 504                     ; 255 {
 505                     	switch	.text
 506  0091               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 510                     ; 259 }
 513  0091 80            	iret	
 536                     ; 266 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 536                     ; 267 {
 537                     	switch	.text
 538  0092               f_TIM1_CAP_COM_IRQHandler:
 542                     ; 271 }
 545  0092 80            	iret	
 568                     ; 304  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 568                     ; 305  {
 569                     	switch	.text
 570  0093               f_TIM2_UPD_OVF_BRK_IRQHandler:
 574                     ; 309  }
 577  0093 80            	iret	
 600                     ; 316  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 600                     ; 317  {
 601                     	switch	.text
 602  0094               f_TIM2_CAP_COM_IRQHandler:
 606                     ; 321  }
 609  0094 80            	iret	
 632                     ; 331  INTERRUPT_HANDLER(TIM3_UPD_OVF_BRK_IRQHandler, 15)
 632                     ; 332  {
 633                     	switch	.text
 634  0095               f_TIM3_UPD_OVF_BRK_IRQHandler:
 638                     ; 336  }
 641  0095 80            	iret	
 664                     ; 343  INTERRUPT_HANDLER(TIM3_CAP_COM_IRQHandler, 16)
 664                     ; 344  {
 665                     	switch	.text
 666  0096               f_TIM3_CAP_COM_IRQHandler:
 670                     ; 348  }
 673  0096 80            	iret	
 695                     ; 409 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 695                     ; 410 {
 696                     	switch	.text
 697  0097               f_I2C_IRQHandler:
 701                     ; 414 }
 704  0097 80            	iret	
 727                     ; 422  INTERRUPT_HANDLER(UART2_TX_IRQHandler, 20)
 727                     ; 423  {
 728                     	switch	.text
 729  0098               f_UART2_TX_IRQHandler:
 733                     ; 427  }
 736  0098 80            	iret	
 759                     ; 434  INTERRUPT_HANDLER(UART2_RX_IRQHandler, 21)
 759                     ; 435  {
 760                     	switch	.text
 761  0099               f_UART2_RX_IRQHandler:
 765                     ; 439  }
 768  0099 80            	iret	
 791                     ; 488  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 791                     ; 489  {
 792                     	switch	.text
 793  009a               f_ADC1_IRQHandler:
 795  009a 8a            	push	cc
 796  009b 84            	pop	a
 797  009c a4bf          	and	a,#191
 798  009e 88            	push	a
 799  009f 86            	pop	cc
 800  00a0 3b0002        	push	c_x+2
 801  00a3 be00          	ldw	x,c_x
 802  00a5 89            	pushw	x
 803  00a6 3b0002        	push	c_y+2
 804  00a9 be00          	ldw	x,c_y
 805  00ab 89            	pushw	x
 808                     ; 493     ADC_INTHANDLE();
 810  00ac cd0000        	call	_ADC_INTHANDLE
 812                     ; 494  }
 815  00af 85            	popw	x
 816  00b0 bf00          	ldw	c_y,x
 817  00b2 320002        	pop	c_y+2
 818  00b5 85            	popw	x
 819  00b6 bf00          	ldw	c_x,x
 820  00b8 320002        	pop	c_x+2
 821  00bb 80            	iret	
 846                     ; 515  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 846                     ; 516  {
 847                     	switch	.text
 848  00bc               f_TIM4_UPD_OVF_IRQHandler:
 850  00bc 8a            	push	cc
 851  00bd 84            	pop	a
 852  00be a4bf          	and	a,#191
 853  00c0 88            	push	a
 854  00c1 86            	pop	cc
 855  00c2 3b0002        	push	c_x+2
 856  00c5 be00          	ldw	x,c_x
 857  00c7 89            	pushw	x
 858  00c8 3b0002        	push	c_y+2
 859  00cb be00          	ldw	x,c_y
 860  00cd 89            	pushw	x
 863                     ; 520   Timer_Handle();
 865  00ce cd0000        	call	_Timer_Handle
 867                     ; 521   TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
 869  00d1 a601          	ld	a,#1
 870  00d3 cd0000        	call	_TIM4_ClearITPendingBit
 872                     ; 522  }
 875  00d6 85            	popw	x
 876  00d7 bf00          	ldw	c_y,x
 877  00d9 320002        	pop	c_y+2
 878  00dc 85            	popw	x
 879  00dd bf00          	ldw	c_x,x
 880  00df 320002        	pop	c_x+2
 881  00e2 80            	iret	
 904                     ; 530 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 904                     ; 531 {
 905                     	switch	.text
 906  00e3               f_EEPROM_EEC_IRQHandler:
 910                     ; 535 }
 913  00e3 80            	iret	
 925                     	xref	_Status_Disp_EN
 926                     	xref	_RADAR_Conf_Timer
 927                     	xref	_PIR_Conf_Timer
 928                     	xref	_RADAR_Motion
 929                     	xref	_PIR_Motion
 930                     	xref	_ADC_INTHANDLE
 931                     	xref	_Timer_Handle
 932                     	xdef	f_EEPROM_EEC_IRQHandler
 933                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 934                     	xdef	f_ADC1_IRQHandler
 935                     	xdef	f_UART2_TX_IRQHandler
 936                     	xdef	f_UART2_RX_IRQHandler
 937                     	xdef	f_I2C_IRQHandler
 938                     	xdef	f_TIM3_CAP_COM_IRQHandler
 939                     	xdef	f_TIM3_UPD_OVF_BRK_IRQHandler
 940                     	xdef	f_TIM2_CAP_COM_IRQHandler
 941                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 942                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 943                     	xdef	f_TIM1_CAP_COM_IRQHandler
 944                     	xdef	f_SPI_IRQHandler
 945                     	xdef	f_EXTI_PORTE_IRQHandler
 946                     	xdef	f_EXTI_PORTD_IRQHandler
 947                     	xdef	f_EXTI_PORTC_IRQHandler
 948                     	xdef	f_EXTI_PORTB_IRQHandler
 949                     	xdef	f_EXTI_PORTA_IRQHandler
 950                     	xdef	f_CLK_IRQHandler
 951                     	xdef	f_AWU_IRQHandler
 952                     	xdef	f_TLI_IRQHandler
 953                     	xdef	f_TRAP_IRQHandler
 954                     	xdef	f_NonHandledInterrupt
 955                     	xref	_TIM4_ClearITPendingBit
 956                     	xref	_GPIO_ReadInputPin
 957                     	xref	_GPIO_WriteLow
 958                     	xref	_GPIO_WriteHigh
 959                     	xref.b	c_x
 960                     	xref.b	c_y
 979                     	end
