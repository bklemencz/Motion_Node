   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  59                     ; 53 void WWDG_Init(uint8_t Counter, uint8_t WindowValue)
  59                     ; 54 {
  61                     .text:	section	.text,new
  62  0000               _WWDG_Init:
  64  0000 89            	pushw	x
  65       00000000      OFST:	set	0
  68                     ; 56   assert_param(IS_WWDG_WINDOWLIMITVALUE_OK(WindowValue));
  70                     ; 58   WWDG->WR = WWDG_WR_RESET_VALUE;
  72  0001 357f50d2      	mov	20690,#127
  73                     ; 59   WWDG->CR = (uint8_t)((uint8_t)(WWDG_CR_WDGA | WWDG_CR_T6) | (uint8_t)Counter);
  75  0005 9e            	ld	a,xh
  76  0006 aac0          	or	a,#192
  77  0008 c750d1        	ld	20689,a
  78                     ; 60   WWDG->WR = (uint8_t)((uint8_t)(~WWDG_CR_WDGA) & (uint8_t)(WWDG_CR_T6 | WindowValue));
  80  000b 7b02          	ld	a,(OFST+2,sp)
  81  000d aa40          	or	a,#64
  82  000f a47f          	and	a,#127
  83  0011 c750d2        	ld	20690,a
  84                     ; 61 }
  87  0014 85            	popw	x
  88  0015 81            	ret
 120                     ; 69 void WWDG_SetCounter(uint8_t Counter)
 120                     ; 70 {
 121                     .text:	section	.text,new
 122  0000               _WWDG_SetCounter:
 126                     ; 72   assert_param(IS_WWDG_COUNTERVALUE_OK(Counter));
 128                     ; 76   WWDG->CR = (uint8_t)(Counter & (uint8_t)BIT_MASK);
 130  0000 a47f          	and	a,#127
 131  0002 c750d1        	ld	20689,a
 132                     ; 77 }
 135  0005 81            	ret
 158                     ; 86 uint8_t WWDG_GetCounter(void)
 158                     ; 87 {
 159                     .text:	section	.text,new
 160  0000               _WWDG_GetCounter:
 164                     ; 88   return(WWDG->CR);
 166  0000 c650d1        	ld	a,20689
 169  0003 81            	ret
 192                     ; 96 void WWDG_SWReset(void)
 192                     ; 97 {
 193                     .text:	section	.text,new
 194  0000               _WWDG_SWReset:
 198                     ; 98   WWDG->CR = WWDG_CR_WDGA; /* Activate WWDG, with clearing T6 */
 200  0000 358050d1      	mov	20689,#128
 201                     ; 99 }
 204  0004 81            	ret
 237                     ; 108 void WWDG_SetWindowValue(uint8_t WindowValue)
 237                     ; 109 {
 238                     .text:	section	.text,new
 239  0000               _WWDG_SetWindowValue:
 243                     ; 111   assert_param(IS_WWDG_WINDOWLIMITVALUE_OK(WindowValue));
 245                     ; 113   WWDG->WR = (uint8_t)((uint8_t)(~WWDG_CR_WDGA) & (uint8_t)(WWDG_CR_T6 | WindowValue));
 247  0000 aa40          	or	a,#64
 248  0002 a47f          	and	a,#127
 249  0004 c750d2        	ld	20690,a
 250                     ; 114 }
 253  0007 81            	ret
 266                     	xdef	_WWDG_SetWindowValue
 267                     	xdef	_WWDG_SWReset
 268                     	xdef	_WWDG_GetCounter
 269                     	xdef	_WWDG_SetCounter
 270                     	xdef	_WWDG_Init
 289                     	end
