   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  78                     ; 48 void IWDG_WriteAccessCmd(IWDG_WriteAccess_TypeDef IWDG_WriteAccess)
  78                     ; 49 {
  80                     .text:	section	.text,new
  81  0000               _IWDG_WriteAccessCmd:
  85                     ; 51   assert_param(IS_IWDG_WRITEACCESS_MODE_OK(IWDG_WriteAccess));
  87                     ; 53   IWDG->KR = (uint8_t)IWDG_WriteAccess; /* Write Access */
  89  0000 c750e0        	ld	20704,a
  90                     ; 54 }
  93  0003 81            	ret
 183                     ; 63 void IWDG_SetPrescaler(IWDG_Prescaler_TypeDef IWDG_Prescaler)
 183                     ; 64 {
 184                     .text:	section	.text,new
 185  0000               _IWDG_SetPrescaler:
 189                     ; 66   assert_param(IS_IWDG_PRESCALER_OK(IWDG_Prescaler));
 191                     ; 68   IWDG->PR = (uint8_t)IWDG_Prescaler;
 193  0000 c750e1        	ld	20705,a
 194                     ; 69 }
 197  0003 81            	ret
 229                     ; 78 void IWDG_SetReload(uint8_t IWDG_Reload)
 229                     ; 79 {
 230                     .text:	section	.text,new
 231  0000               _IWDG_SetReload:
 235                     ; 80   IWDG->RLR = IWDG_Reload;
 237  0000 c750e2        	ld	20706,a
 238                     ; 81 }
 241  0003 81            	ret
 264                     ; 89 void IWDG_ReloadCounter(void)
 264                     ; 90 {
 265                     .text:	section	.text,new
 266  0000               _IWDG_ReloadCounter:
 270                     ; 91   IWDG->KR = IWDG_KEY_REFRESH;
 272  0000 35aa50e0      	mov	20704,#170
 273                     ; 92 }
 276  0004 81            	ret
 299                     ; 99 void IWDG_Enable(void)
 299                     ; 100 {
 300                     .text:	section	.text,new
 301  0000               _IWDG_Enable:
 305                     ; 101   IWDG->KR = IWDG_KEY_ENABLE;
 307  0000 35cc50e0      	mov	20704,#204
 308                     ; 102 }
 311  0004 81            	ret
 324                     	xdef	_IWDG_Enable
 325                     	xdef	_IWDG_ReloadCounter
 326                     	xdef	_IWDG_SetReload
 327                     	xdef	_IWDG_SetPrescaler
 328                     	xdef	_IWDG_WriteAccessCmd
 347                     	end
