   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
 109                     ; 53 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
 109                     ; 54 {
 111                     .text:	section	.text,new
 112  0000               _GPIO_DeInit:
 116                     ; 55   GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
 118  0000 7f            	clr	(x)
 119                     ; 56   GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
 121  0001 6f02          	clr	(2,x)
 122                     ; 57   GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
 124  0003 6f03          	clr	(3,x)
 125                     ; 58   GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
 127  0005 6f04          	clr	(4,x)
 128                     ; 59 }
 131  0007 81            	ret
 371                     ; 71 void GPIO_Init(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
 371                     ; 72 {
 372                     .text:	section	.text,new
 373  0000               _GPIO_Init:
 375  0000 89            	pushw	x
 376       00000000      OFST:	set	0
 379                     ; 77   assert_param(IS_GPIO_MODE_OK(GPIO_Mode));
 381                     ; 78   assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
 383                     ; 81   GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 385  0001 7b05          	ld	a,(OFST+5,sp)
 386  0003 43            	cpl	a
 387  0004 e404          	and	a,(4,x)
 388  0006 e704          	ld	(4,x),a
 389                     ; 87   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
 391  0008 7b06          	ld	a,(OFST+6,sp)
 392  000a a580          	bcp	a,#128
 393  000c 271d          	jreq	L771
 394                     ; 89     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
 396  000e 7b06          	ld	a,(OFST+6,sp)
 397  0010 a510          	bcp	a,#16
 398  0012 2706          	jreq	L102
 399                     ; 91       GPIOx->ODR |= (uint8_t)GPIO_Pin;
 401  0014 f6            	ld	a,(x)
 402  0015 1a05          	or	a,(OFST+5,sp)
 403  0017 f7            	ld	(x),a
 405  0018 2007          	jra	L302
 406  001a               L102:
 407                     ; 95       GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
 409  001a 1e01          	ldw	x,(OFST+1,sp)
 410  001c 7b05          	ld	a,(OFST+5,sp)
 411  001e 43            	cpl	a
 412  001f f4            	and	a,(x)
 413  0020 f7            	ld	(x),a
 414  0021               L302:
 415                     ; 98     GPIOx->DDR |= (uint8_t)GPIO_Pin;
 417  0021 1e01          	ldw	x,(OFST+1,sp)
 418  0023 e602          	ld	a,(2,x)
 419  0025 1a05          	or	a,(OFST+5,sp)
 420  0027 e702          	ld	(2,x),a
 422  0029 2009          	jra	L502
 423  002b               L771:
 424                     ; 103     GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
 426  002b 1e01          	ldw	x,(OFST+1,sp)
 427  002d 7b05          	ld	a,(OFST+5,sp)
 428  002f 43            	cpl	a
 429  0030 e402          	and	a,(2,x)
 430  0032 e702          	ld	(2,x),a
 431  0034               L502:
 432                     ; 110   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
 434  0034 7b06          	ld	a,(OFST+6,sp)
 435  0036 a540          	bcp	a,#64
 436  0038 270a          	jreq	L702
 437                     ; 112     GPIOx->CR1 |= (uint8_t)GPIO_Pin;
 439  003a 1e01          	ldw	x,(OFST+1,sp)
 440  003c e603          	ld	a,(3,x)
 441  003e 1a05          	or	a,(OFST+5,sp)
 442  0040 e703          	ld	(3,x),a
 444  0042 2009          	jra	L112
 445  0044               L702:
 446                     ; 116     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 448  0044 1e01          	ldw	x,(OFST+1,sp)
 449  0046 7b05          	ld	a,(OFST+5,sp)
 450  0048 43            	cpl	a
 451  0049 e403          	and	a,(3,x)
 452  004b e703          	ld	(3,x),a
 453  004d               L112:
 454                     ; 123   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
 456  004d 7b06          	ld	a,(OFST+6,sp)
 457  004f a520          	bcp	a,#32
 458  0051 270a          	jreq	L312
 459                     ; 125     GPIOx->CR2 |= (uint8_t)GPIO_Pin;
 461  0053 1e01          	ldw	x,(OFST+1,sp)
 462  0055 e604          	ld	a,(4,x)
 463  0057 1a05          	or	a,(OFST+5,sp)
 464  0059 e704          	ld	(4,x),a
 466  005b 2009          	jra	L512
 467  005d               L312:
 468                     ; 129     GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 470  005d 1e01          	ldw	x,(OFST+1,sp)
 471  005f 7b05          	ld	a,(OFST+5,sp)
 472  0061 43            	cpl	a
 473  0062 e404          	and	a,(4,x)
 474  0064 e704          	ld	(4,x),a
 475  0066               L512:
 476                     ; 131 }
 479  0066 85            	popw	x
 480  0067 81            	ret
 524                     ; 141 void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t PortVal)
 524                     ; 142 {
 525                     .text:	section	.text,new
 526  0000               _GPIO_Write:
 528  0000 89            	pushw	x
 529       00000000      OFST:	set	0
 532                     ; 143   GPIOx->ODR = PortVal;
 534  0001 7b05          	ld	a,(OFST+5,sp)
 535  0003 1e01          	ldw	x,(OFST+1,sp)
 536  0005 f7            	ld	(x),a
 537                     ; 144 }
 540  0006 85            	popw	x
 541  0007 81            	ret
 588                     ; 154 void GPIO_WriteHigh(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 588                     ; 155 {
 589                     .text:	section	.text,new
 590  0000               _GPIO_WriteHigh:
 592  0000 89            	pushw	x
 593       00000000      OFST:	set	0
 596                     ; 156   GPIOx->ODR |= (uint8_t)PortPins;
 598  0001 f6            	ld	a,(x)
 599  0002 1a05          	or	a,(OFST+5,sp)
 600  0004 f7            	ld	(x),a
 601                     ; 157 }
 604  0005 85            	popw	x
 605  0006 81            	ret
 652                     ; 167 void GPIO_WriteLow(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 652                     ; 168 {
 653                     .text:	section	.text,new
 654  0000               _GPIO_WriteLow:
 656  0000 89            	pushw	x
 657       00000000      OFST:	set	0
 660                     ; 169   GPIOx->ODR &= (uint8_t)(~PortPins);
 662  0001 7b05          	ld	a,(OFST+5,sp)
 663  0003 43            	cpl	a
 664  0004 f4            	and	a,(x)
 665  0005 f7            	ld	(x),a
 666                     ; 170 }
 669  0006 85            	popw	x
 670  0007 81            	ret
 717                     ; 180 void GPIO_WriteReverse(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 717                     ; 181 {
 718                     .text:	section	.text,new
 719  0000               _GPIO_WriteReverse:
 721  0000 89            	pushw	x
 722       00000000      OFST:	set	0
 725                     ; 182   GPIOx->ODR ^= (uint8_t)PortPins;
 727  0001 f6            	ld	a,(x)
 728  0002 1805          	xor	a,(OFST+5,sp)
 729  0004 f7            	ld	(x),a
 730                     ; 183 }
 733  0005 85            	popw	x
 734  0006 81            	ret
 772                     ; 191 uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
 772                     ; 192 {
 773                     .text:	section	.text,new
 774  0000               _GPIO_ReadOutputData:
 778                     ; 193   return ((uint8_t)GPIOx->ODR);
 780  0000 f6            	ld	a,(x)
 783  0001 81            	ret
 820                     ; 202 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 820                     ; 203 {
 821                     .text:	section	.text,new
 822  0000               _GPIO_ReadInputData:
 826                     ; 204   return ((uint8_t)GPIOx->IDR);
 828  0000 e601          	ld	a,(1,x)
 831  0002 81            	ret
 899                     ; 213 BitStatus GPIO_ReadInputPin(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
 899                     ; 214 {
 900                     .text:	section	.text,new
 901  0000               _GPIO_ReadInputPin:
 903  0000 89            	pushw	x
 904       00000000      OFST:	set	0
 907                     ; 215   return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
 909  0001 e601          	ld	a,(1,x)
 910  0003 1405          	and	a,(OFST+5,sp)
 913  0005 85            	popw	x
 914  0006 81            	ret
 992                     ; 225 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, FunctionalState NewState)
 992                     ; 226 {
 993                     .text:	section	.text,new
 994  0000               _GPIO_ExternalPullUpConfig:
 996  0000 89            	pushw	x
 997       00000000      OFST:	set	0
1000                     ; 228   assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
1002                     ; 229   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1004                     ; 231   if (NewState != DISABLE) /* External Pull-Up Set*/
1006  0001 0d06          	tnz	(OFST+6,sp)
1007  0003 2708          	jreq	L174
1008                     ; 233     GPIOx->CR1 |= (uint8_t)GPIO_Pin;
1010  0005 e603          	ld	a,(3,x)
1011  0007 1a05          	or	a,(OFST+5,sp)
1012  0009 e703          	ld	(3,x),a
1014  000b 2009          	jra	L374
1015  000d               L174:
1016                     ; 236     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
1018  000d 1e01          	ldw	x,(OFST+1,sp)
1019  000f 7b05          	ld	a,(OFST+5,sp)
1020  0011 43            	cpl	a
1021  0012 e403          	and	a,(3,x)
1022  0014 e703          	ld	(3,x),a
1023  0016               L374:
1024                     ; 238 }
1027  0016 85            	popw	x
1028  0017 81            	ret
1041                     	xdef	_GPIO_ExternalPullUpConfig
1042                     	xdef	_GPIO_ReadInputPin
1043                     	xdef	_GPIO_ReadOutputData
1044                     	xdef	_GPIO_ReadInputData
1045                     	xdef	_GPIO_WriteReverse
1046                     	xdef	_GPIO_WriteLow
1047                     	xdef	_GPIO_WriteHigh
1048                     	xdef	_GPIO_Write
1049                     	xdef	_GPIO_Init
1050                     	xdef	_GPIO_DeInit
1069                     	end
