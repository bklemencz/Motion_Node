   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  53                     ; 15 static void _delay_cycl( uint16_t ticks )
  53                     ; 16 {
  55                     .text:	section	.text,new
  56  0000               L3__delay_cycl:
  60                     ; 20 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", ticks);
  63  0000 9d            nop
  64  0001                L6:
  65  0001 5a             decw X
  66  0002 26fd           jrne L6
  67  0004 9d             nop
  68                      
  70                     ; 21 }
  73  0005 81            	ret
 108                     .const:	section	.text
 109  0000               L21:
 110  0000 00000003      	dc.l	3
 111                     ; 23 void _delay_us( const uint16_t us )
 111                     ; 24 {
 112                     .text:	section	.text,new
 113  0000               __delay_us:
 117                     ; 25 	_delay_cycl( (uint16_t)( T_COUNT(us) );
 119  0000 a610          	ld	a,#16
 120  0002 cd0000        	call	c_cmulx
 122  0005 a603          	ld	a,#3
 123  0007 cd0000        	call	c_lsbc
 125  000a ae0000        	ldw	x,#L21
 126  000d cd0000        	call	c_ludv
 128  0010 be02          	ldw	x,c_lreg+2
 129  0012 cd0000        	call	L3__delay_cycl
 131                     ; 26 }
 134  0015 81            	ret
 167                     ; 28 void _delay_ms( uint16_t ms )
 167                     ; 29 {
 168                     .text:	section	.text,new
 169  0000               __delay_ms:
 171  0000 89            	pushw	x
 172       00000000      OFST:	set	0
 175  0001 2006          	jra	L36
 176  0003               L16:
 177                     ; 32 		_delay_us( 1000 );
 179  0003 ae03e8        	ldw	x,#1000
 180  0006 cd0000        	call	__delay_us
 182  0009               L36:
 183                     ; 30 	while ( ms-- )
 185  0009 1e01          	ldw	x,(OFST+1,sp)
 186  000b 1d0001        	subw	x,#1
 187  000e 1f01          	ldw	(OFST+1,sp),x
 188  0010 1c0001        	addw	x,#1
 189  0013 a30000        	cpw	x,#0
 190  0016 26eb          	jrne	L16
 191                     ; 34 }
 194  0018 85            	popw	x
 195  0019 81            	ret
 222                     ; 36 void Timer_Init(void)
 222                     ; 37 {
 223                     .text:	section	.text,new
 224  0000               _Timer_Init:
 228                     ; 38   TIM4_TimeBaseInit(TIM4_MS_PRESC, TIM4_MS_PERIOD);
 230  0000 ae077c        	ldw	x,#1916
 231  0003 cd0000        	call	_TIM4_TimeBaseInit
 233                     ; 39   TIM4_ClearFlag(TIM4_FLAG_UPDATE);
 235  0006 a601          	ld	a,#1
 236  0008 cd0000        	call	_TIM4_ClearFlag
 238                     ; 40   TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
 240  000b ae0101        	ldw	x,#257
 241  000e cd0000        	call	_TIM4_ITConfig
 243                     ; 41   TIM4_Cmd(ENABLE);
 245  0011 a601          	ld	a,#1
 246  0013 cd0000        	call	_TIM4_Cmd
 248                     ; 42 }
 251  0016 81            	ret
 280                     ; 44 void Timer_Handle(void)
 280                     ; 45 {
 281                     .text:	section	.text,new
 282  0000               _Timer_Handle:
 286                     ; 46   Uptime++;
 288  0000 ae0006        	ldw	x,#_Uptime
 289  0003 a601          	ld	a,#1
 290  0005 cd0000        	call	c_lgadc
 292                     ; 47   if (LED_Fade_Timer>0) LED_Fade_Timer--;
 294  0008 ce0004        	ldw	x,_LED_Fade_Timer
 295  000b 2709          	jreq	L701
 298  000d ce0004        	ldw	x,_LED_Fade_Timer
 299  0010 1d0001        	subw	x,#1
 300  0013 cf0004        	ldw	_LED_Fade_Timer,x
 301  0016               L701:
 302                     ; 48   if (AD_Trigger_Timer>0) AD_Trigger_Timer--;
 304  0016 ce0002        	ldw	x,_AD_Trigger_Timer
 305  0019 2709          	jreq	L111
 308  001b ce0002        	ldw	x,_AD_Trigger_Timer
 309  001e 1d0001        	subw	x,#1
 310  0021 cf0002        	ldw	_AD_Trigger_Timer,x
 311  0024               L111:
 312                     ; 49   if (RADAR_Conf_Timer>0) RADAR_Conf_Timer--;
 314  0024 ce0000        	ldw	x,_RADAR_Conf_Timer
 315  0027 2709          	jreq	L311
 318  0029 ce0000        	ldw	x,_RADAR_Conf_Timer
 319  002c 1d0001        	subw	x,#1
 320  002f cf0000        	ldw	_RADAR_Conf_Timer,x
 321  0032               L311:
 322                     ; 50   if (PIR_Conf_Timer>0) PIR_Conf_Timer--;
 324  0032 ce0000        	ldw	x,_PIR_Conf_Timer
 325  0035 2709          	jreq	L511
 328  0037 ce0000        	ldw	x,_PIR_Conf_Timer
 329  003a 1d0001        	subw	x,#1
 330  003d cf0000        	ldw	_PIR_Conf_Timer,x
 331  0040               L511:
 332                     ; 51   if (RF_TX_Timer>0)  RF_TX_Timer--;
 334  0040 ce0000        	ldw	x,_RF_TX_Timer
 335  0043 2709          	jreq	L711
 338  0045 ce0000        	ldw	x,_RF_TX_Timer
 339  0048 1d0001        	subw	x,#1
 340  004b cf0000        	ldw	_RF_TX_Timer,x
 341  004e               L711:
 342                     ; 52 }
 345  004e 81            	ret
 396                     	xref	_RADAR_Conf_Timer
 397                     	xref	_PIR_Conf_Timer
 398                     	switch	.bss
 399  0000               _RF_TX_Timer:
 400  0000 0000          	ds.b	2
 401                     	xdef	_RF_TX_Timer
 402  0002               _AD_Trigger_Timer:
 403  0002 0000          	ds.b	2
 404                     	xdef	_AD_Trigger_Timer
 405  0004               _LED_Fade_Timer:
 406  0004 0000          	ds.b	2
 407                     	xdef	_LED_Fade_Timer
 408  0006               _Uptime:
 409  0006 00000000      	ds.b	4
 410                     	xdef	_Uptime
 411                     	xdef	_Timer_Handle
 412                     	xdef	_Timer_Init
 413                     	xdef	__delay_ms
 414                     	xdef	__delay_us
 415                     	xref	_TIM4_ClearFlag
 416                     	xref	_TIM4_ITConfig
 417                     	xref	_TIM4_Cmd
 418                     	xref	_TIM4_TimeBaseInit
 419                     	xref.b	c_lreg
 420                     	xref.b	c_x
 440                     	xref	c_lgadc
 441                     	xref	c_ludv
 442                     	xref	c_lsbc
 443                     	xref	c_cmulx
 444                     	end
