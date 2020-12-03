   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  43                     ; 58 void TIM1_DeInit(void)
  43                     ; 59 {
  45                     .text:	section	.text,new
  46  0000               _TIM1_DeInit:
  50                     ; 60   TIM1->CR1  = TIM1_CR1_RESET_VALUE;
  52  0000 725f5250      	clr	21072
  53                     ; 61   TIM1->CR2  = TIM1_CR2_RESET_VALUE;
  55  0004 725f5251      	clr	21073
  56                     ; 62   TIM1->SMCR = TIM1_SMCR_RESET_VALUE;
  58  0008 725f5252      	clr	21074
  59                     ; 63   TIM1->ETR  = TIM1_ETR_RESET_VALUE;
  61  000c 725f5253      	clr	21075
  62                     ; 64   TIM1->IER  = TIM1_IER_RESET_VALUE;
  64  0010 725f5254      	clr	21076
  65                     ; 65   TIM1->SR2  = TIM1_SR2_RESET_VALUE;
  67  0014 725f5256      	clr	21078
  68                     ; 67   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  70  0018 725f525c      	clr	21084
  71                     ; 68   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  73  001c 725f525d      	clr	21085
  74                     ; 70   TIM1->CCMR1 = 0x01;
  76  0020 35015258      	mov	21080,#1
  77                     ; 71   TIM1->CCMR2 = 0x01;
  79  0024 35015259      	mov	21081,#1
  80                     ; 72   TIM1->CCMR3 = 0x01;
  82  0028 3501525a      	mov	21082,#1
  83                     ; 73   TIM1->CCMR4 = 0x01;
  85  002c 3501525b      	mov	21083,#1
  86                     ; 75   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  88  0030 725f525c      	clr	21084
  89                     ; 76   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  91  0034 725f525d      	clr	21085
  92                     ; 77   TIM1->CCMR1 = TIM1_CCMR1_RESET_VALUE;
  94  0038 725f5258      	clr	21080
  95                     ; 78   TIM1->CCMR2 = TIM1_CCMR2_RESET_VALUE;
  97  003c 725f5259      	clr	21081
  98                     ; 79   TIM1->CCMR3 = TIM1_CCMR3_RESET_VALUE;
 100  0040 725f525a      	clr	21082
 101                     ; 80   TIM1->CCMR4 = TIM1_CCMR4_RESET_VALUE;
 103  0044 725f525b      	clr	21083
 104                     ; 81   TIM1->CNTRH = TIM1_CNTRH_RESET_VALUE;
 106  0048 725f525e      	clr	21086
 107                     ; 82   TIM1->CNTRL = TIM1_CNTRL_RESET_VALUE;
 109  004c 725f525f      	clr	21087
 110                     ; 83   TIM1->PSCRH = TIM1_PSCRH_RESET_VALUE;
 112  0050 725f5260      	clr	21088
 113                     ; 84   TIM1->PSCRL = TIM1_PSCRL_RESET_VALUE;
 115  0054 725f5261      	clr	21089
 116                     ; 85   TIM1->ARRH  = TIM1_ARRH_RESET_VALUE;
 118  0058 35ff5262      	mov	21090,#255
 119                     ; 86   TIM1->ARRL  = TIM1_ARRL_RESET_VALUE;
 121  005c 35ff5263      	mov	21091,#255
 122                     ; 87   TIM1->CCR1H = TIM1_CCR1H_RESET_VALUE;
 124  0060 725f5265      	clr	21093
 125                     ; 88   TIM1->CCR1L = TIM1_CCR1L_RESET_VALUE;
 127  0064 725f5266      	clr	21094
 128                     ; 89   TIM1->CCR2H = TIM1_CCR2H_RESET_VALUE;
 130  0068 725f5267      	clr	21095
 131                     ; 90   TIM1->CCR2L = TIM1_CCR2L_RESET_VALUE;
 133  006c 725f5268      	clr	21096
 134                     ; 91   TIM1->CCR3H = TIM1_CCR3H_RESET_VALUE;
 136  0070 725f5269      	clr	21097
 137                     ; 92   TIM1->CCR3L = TIM1_CCR3L_RESET_VALUE;
 139  0074 725f526a      	clr	21098
 140                     ; 93   TIM1->CCR4H = TIM1_CCR4H_RESET_VALUE;
 142  0078 725f526b      	clr	21099
 143                     ; 94   TIM1->CCR4L = TIM1_CCR4L_RESET_VALUE;
 145  007c 725f526c      	clr	21100
 146                     ; 95   TIM1->OISR  = TIM1_OISR_RESET_VALUE;
 148  0080 725f526f      	clr	21103
 149                     ; 96   TIM1->EGR   = 0x01; /* TIM1_EGR_UG */
 151  0084 35015257      	mov	21079,#1
 152                     ; 97   TIM1->DTR   = TIM1_DTR_RESET_VALUE;
 154  0088 725f526e      	clr	21102
 155                     ; 98   TIM1->BKR   = TIM1_BKR_RESET_VALUE;
 157  008c 725f526d      	clr	21101
 158                     ; 99   TIM1->RCR   = TIM1_RCR_RESET_VALUE;
 160  0090 725f5264      	clr	21092
 161                     ; 100   TIM1->SR1   = TIM1_SR1_RESET_VALUE;
 163  0094 725f5255      	clr	21077
 164                     ; 101 }
 167  0098 81            	ret
 270                     ; 111 void TIM1_TimeBaseInit(uint16_t TIM1_Prescaler,
 270                     ; 112                        TIM1_CounterMode_TypeDef TIM1_CounterMode,
 270                     ; 113                        uint16_t TIM1_Period,
 270                     ; 114                        uint8_t TIM1_RepetitionCounter)
 270                     ; 115 {
 271                     .text:	section	.text,new
 272  0000               _TIM1_TimeBaseInit:
 274  0000 89            	pushw	x
 275       00000000      OFST:	set	0
 278                     ; 117   assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
 280                     ; 120   TIM1->ARRH = (uint8_t)(TIM1_Period >> 8);
 282  0001 7b06          	ld	a,(OFST+6,sp)
 283  0003 c75262        	ld	21090,a
 284                     ; 121   TIM1->ARRL = (uint8_t)(TIM1_Period);
 286  0006 7b07          	ld	a,(OFST+7,sp)
 287  0008 c75263        	ld	21091,a
 288                     ; 124   TIM1->PSCRH = (uint8_t)(TIM1_Prescaler >> 8);
 290  000b 9e            	ld	a,xh
 291  000c c75260        	ld	21088,a
 292                     ; 125   TIM1->PSCRL = (uint8_t)(TIM1_Prescaler);
 294  000f 9f            	ld	a,xl
 295  0010 c75261        	ld	21089,a
 296                     ; 128   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)(~(TIM1_CR1_CMS | TIM1_CR1_DIR)))
 296                     ; 129                         | (uint8_t)(TIM1_CounterMode));
 298  0013 c65250        	ld	a,21072
 299  0016 a48f          	and	a,#143
 300  0018 1a05          	or	a,(OFST+5,sp)
 301  001a c75250        	ld	21072,a
 302                     ; 132   TIM1->RCR = TIM1_RepetitionCounter;
 304  001d 7b08          	ld	a,(OFST+8,sp)
 305  001f c75264        	ld	21092,a
 306                     ; 133 }
 309  0022 85            	popw	x
 310  0023 81            	ret
 593                     ; 154 void TIM1_OC1Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 593                     ; 155                   TIM1_OutputState_TypeDef TIM1_OutputState,
 593                     ; 156                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 593                     ; 157                   uint16_t TIM1_Pulse,
 593                     ; 158                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 593                     ; 159                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 593                     ; 160                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 593                     ; 161                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 593                     ; 162 {
 594                     .text:	section	.text,new
 595  0000               _TIM1_OC1Init:
 597  0000 89            	pushw	x
 598  0001 5203          	subw	sp,#3
 599       00000003      OFST:	set	3
 602                     ; 164   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 604                     ; 165   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 606                     ; 166   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 608                     ; 167   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 610                     ; 168   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 612                     ; 169   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 614                     ; 170   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 616                     ; 174   TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC1E | TIM1_CCER1_CC1NE 
 616                     ; 175                              | TIM1_CCER1_CC1P | TIM1_CCER1_CC1NP));
 618  0003 c6525c        	ld	a,21084
 619  0006 a4f0          	and	a,#240
 620  0008 c7525c        	ld	21084,a
 621                     ; 178   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC1E)
 621                     ; 179                                      | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC1NE))
 621                     ; 180                            | (uint8_t)( (uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC1P)
 621                     ; 181                                        | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC1NP)));
 623  000b 7b0c          	ld	a,(OFST+9,sp)
 624  000d a408          	and	a,#8
 625  000f 6b03          	ld	(OFST+0,sp),a
 627  0011 7b0b          	ld	a,(OFST+8,sp)
 628  0013 a402          	and	a,#2
 629  0015 1a03          	or	a,(OFST+0,sp)
 630  0017 6b02          	ld	(OFST-1,sp),a
 632  0019 7b08          	ld	a,(OFST+5,sp)
 633  001b a404          	and	a,#4
 634  001d 6b01          	ld	(OFST-2,sp),a
 636  001f 9f            	ld	a,xl
 637  0020 a401          	and	a,#1
 638  0022 1a01          	or	a,(OFST-2,sp)
 639  0024 1a02          	or	a,(OFST-1,sp)
 640  0026 ca525c        	or	a,21084
 641  0029 c7525c        	ld	21084,a
 642                     ; 184   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | 
 642                     ; 185                           (uint8_t)TIM1_OCMode);
 644  002c c65258        	ld	a,21080
 645  002f a48f          	and	a,#143
 646  0031 1a04          	or	a,(OFST+1,sp)
 647  0033 c75258        	ld	21080,a
 648                     ; 188   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS1 | TIM1_OISR_OIS1N));
 650  0036 c6526f        	ld	a,21103
 651  0039 a4fc          	and	a,#252
 652  003b c7526f        	ld	21103,a
 653                     ; 190   TIM1->OISR |= (uint8_t)((uint8_t)( TIM1_OCIdleState & TIM1_OISR_OIS1 ) | 
 653                     ; 191                           (uint8_t)( TIM1_OCNIdleState & TIM1_OISR_OIS1N ));
 655  003e 7b0e          	ld	a,(OFST+11,sp)
 656  0040 a402          	and	a,#2
 657  0042 6b03          	ld	(OFST+0,sp),a
 659  0044 7b0d          	ld	a,(OFST+10,sp)
 660  0046 a401          	and	a,#1
 661  0048 1a03          	or	a,(OFST+0,sp)
 662  004a ca526f        	or	a,21103
 663  004d c7526f        	ld	21103,a
 664                     ; 194   TIM1->CCR1H = (uint8_t)(TIM1_Pulse >> 8);
 666  0050 7b09          	ld	a,(OFST+6,sp)
 667  0052 c75265        	ld	21093,a
 668                     ; 195   TIM1->CCR1L = (uint8_t)(TIM1_Pulse);
 670  0055 7b0a          	ld	a,(OFST+7,sp)
 671  0057 c75266        	ld	21094,a
 672                     ; 196 }
 675  005a 5b05          	addw	sp,#5
 676  005c 81            	ret
 778                     ; 217 void TIM1_OC2Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 778                     ; 218                   TIM1_OutputState_TypeDef TIM1_OutputState,
 778                     ; 219                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 778                     ; 220                   uint16_t TIM1_Pulse,
 778                     ; 221                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 778                     ; 222                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 778                     ; 223                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 778                     ; 224                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 778                     ; 225 {
 779                     .text:	section	.text,new
 780  0000               _TIM1_OC2Init:
 782  0000 89            	pushw	x
 783  0001 5203          	subw	sp,#3
 784       00000003      OFST:	set	3
 787                     ; 227   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 789                     ; 228   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 791                     ; 229   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 793                     ; 230   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 795                     ; 231   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 797                     ; 232   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 799                     ; 233   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 801                     ; 237   TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC2E | TIM1_CCER1_CC2NE | 
 801                     ; 238                              TIM1_CCER1_CC2P | TIM1_CCER1_CC2NP));
 803  0003 c6525c        	ld	a,21084
 804  0006 a40f          	and	a,#15
 805  0008 c7525c        	ld	21084,a
 806                     ; 242   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC2E  ) | 
 806                     ; 243                                      (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC2NE )) | 
 806                     ; 244                            (uint8_t)((uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC2P  ) | 
 806                     ; 245                                      (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC2NP )));
 808  000b 7b0c          	ld	a,(OFST+9,sp)
 809  000d a480          	and	a,#128
 810  000f 6b03          	ld	(OFST+0,sp),a
 812  0011 7b0b          	ld	a,(OFST+8,sp)
 813  0013 a420          	and	a,#32
 814  0015 1a03          	or	a,(OFST+0,sp)
 815  0017 6b02          	ld	(OFST-1,sp),a
 817  0019 7b08          	ld	a,(OFST+5,sp)
 818  001b a440          	and	a,#64
 819  001d 6b01          	ld	(OFST-2,sp),a
 821  001f 9f            	ld	a,xl
 822  0020 a410          	and	a,#16
 823  0022 1a01          	or	a,(OFST-2,sp)
 824  0024 1a02          	or	a,(OFST-1,sp)
 825  0026 ca525c        	or	a,21084
 826  0029 c7525c        	ld	21084,a
 827                     ; 248   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | 
 827                     ; 249                           (uint8_t)TIM1_OCMode);
 829  002c c65259        	ld	a,21081
 830  002f a48f          	and	a,#143
 831  0031 1a04          	or	a,(OFST+1,sp)
 832  0033 c75259        	ld	21081,a
 833                     ; 252   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS2 | TIM1_OISR_OIS2N));
 835  0036 c6526f        	ld	a,21103
 836  0039 a4f3          	and	a,#243
 837  003b c7526f        	ld	21103,a
 838                     ; 254   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS2 & TIM1_OCIdleState) | 
 838                     ; 255                           (uint8_t)(TIM1_OISR_OIS2N & TIM1_OCNIdleState));
 840  003e 7b0e          	ld	a,(OFST+11,sp)
 841  0040 a408          	and	a,#8
 842  0042 6b03          	ld	(OFST+0,sp),a
 844  0044 7b0d          	ld	a,(OFST+10,sp)
 845  0046 a404          	and	a,#4
 846  0048 1a03          	or	a,(OFST+0,sp)
 847  004a ca526f        	or	a,21103
 848  004d c7526f        	ld	21103,a
 849                     ; 258   TIM1->CCR2H = (uint8_t)(TIM1_Pulse >> 8);
 851  0050 7b09          	ld	a,(OFST+6,sp)
 852  0052 c75267        	ld	21095,a
 853                     ; 259   TIM1->CCR2L = (uint8_t)(TIM1_Pulse);
 855  0055 7b0a          	ld	a,(OFST+7,sp)
 856  0057 c75268        	ld	21096,a
 857                     ; 260 }
 860  005a 5b05          	addw	sp,#5
 861  005c 81            	ret
 963                     ; 281 void TIM1_OC3Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 963                     ; 282                   TIM1_OutputState_TypeDef TIM1_OutputState,
 963                     ; 283                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 963                     ; 284                   uint16_t TIM1_Pulse,
 963                     ; 285                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 963                     ; 286                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 963                     ; 287                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 963                     ; 288                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 963                     ; 289 {
 964                     .text:	section	.text,new
 965  0000               _TIM1_OC3Init:
 967  0000 89            	pushw	x
 968  0001 5203          	subw	sp,#3
 969       00000003      OFST:	set	3
 972                     ; 291   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 974                     ; 292   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 976                     ; 293   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 978                     ; 294   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 980                     ; 295   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 982                     ; 296   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 984                     ; 297   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 986                     ; 301   TIM1->CCER2 &= (uint8_t)(~( TIM1_CCER2_CC3E | TIM1_CCER2_CC3NE | 
 986                     ; 302                              TIM1_CCER2_CC3P | TIM1_CCER2_CC3NP));
 988  0003 c6525d        	ld	a,21085
 989  0006 a4f0          	and	a,#240
 990  0008 c7525d        	ld	21085,a
 991                     ; 305   TIM1->CCER2 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState  & TIM1_CCER2_CC3E   ) |
 991                     ; 306                                      (uint8_t)(TIM1_OutputNState & TIM1_CCER2_CC3NE  )) | 
 991                     ; 307                            (uint8_t)((uint8_t)(TIM1_OCPolarity   & TIM1_CCER2_CC3P   ) | 
 991                     ; 308                                      (uint8_t)(TIM1_OCNPolarity  & TIM1_CCER2_CC3NP  )));
 993  000b 7b0c          	ld	a,(OFST+9,sp)
 994  000d a408          	and	a,#8
 995  000f 6b03          	ld	(OFST+0,sp),a
 997  0011 7b0b          	ld	a,(OFST+8,sp)
 998  0013 a402          	and	a,#2
 999  0015 1a03          	or	a,(OFST+0,sp)
1000  0017 6b02          	ld	(OFST-1,sp),a
1002  0019 7b08          	ld	a,(OFST+5,sp)
1003  001b a404          	and	a,#4
1004  001d 6b01          	ld	(OFST-2,sp),a
1006  001f 9f            	ld	a,xl
1007  0020 a401          	and	a,#1
1008  0022 1a01          	or	a,(OFST-2,sp)
1009  0024 1a02          	or	a,(OFST-1,sp)
1010  0026 ca525d        	or	a,21085
1011  0029 c7525d        	ld	21085,a
1012                     ; 311   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1012                     ; 312                           (uint8_t)TIM1_OCMode);
1014  002c c6525a        	ld	a,21082
1015  002f a48f          	and	a,#143
1016  0031 1a04          	or	a,(OFST+1,sp)
1017  0033 c7525a        	ld	21082,a
1018                     ; 315   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS3 | TIM1_OISR_OIS3N));
1020  0036 c6526f        	ld	a,21103
1021  0039 a4cf          	and	a,#207
1022  003b c7526f        	ld	21103,a
1023                     ; 317   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS3 & TIM1_OCIdleState) | 
1023                     ; 318                           (uint8_t)(TIM1_OISR_OIS3N & TIM1_OCNIdleState));
1025  003e 7b0e          	ld	a,(OFST+11,sp)
1026  0040 a420          	and	a,#32
1027  0042 6b03          	ld	(OFST+0,sp),a
1029  0044 7b0d          	ld	a,(OFST+10,sp)
1030  0046 a410          	and	a,#16
1031  0048 1a03          	or	a,(OFST+0,sp)
1032  004a ca526f        	or	a,21103
1033  004d c7526f        	ld	21103,a
1034                     ; 321   TIM1->CCR3H = (uint8_t)(TIM1_Pulse >> 8);
1036  0050 7b09          	ld	a,(OFST+6,sp)
1037  0052 c75269        	ld	21097,a
1038                     ; 322   TIM1->CCR3L = (uint8_t)(TIM1_Pulse);
1040  0055 7b0a          	ld	a,(OFST+7,sp)
1041  0057 c7526a        	ld	21098,a
1042                     ; 323 }
1045  005a 5b05          	addw	sp,#5
1046  005c 81            	ret
1118                     ; 338 void TIM1_OC4Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1118                     ; 339                   TIM1_OutputState_TypeDef TIM1_OutputState,
1118                     ; 340                   uint16_t TIM1_Pulse,
1118                     ; 341                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1118                     ; 342                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState)
1118                     ; 343 {
1119                     .text:	section	.text,new
1120  0000               _TIM1_OC4Init:
1122  0000 89            	pushw	x
1123  0001 88            	push	a
1124       00000001      OFST:	set	1
1127                     ; 345   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
1129                     ; 346   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
1131                     ; 347   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
1133                     ; 348   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
1135                     ; 351   TIM1->CCER2 &= (uint8_t)(~(TIM1_CCER2_CC4E | TIM1_CCER2_CC4P));
1137  0002 c6525d        	ld	a,21085
1138  0005 a4cf          	and	a,#207
1139  0007 c7525d        	ld	21085,a
1140                     ; 353   TIM1->CCER2 |= (uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER2_CC4E ) |  
1140                     ; 354                            (uint8_t)(TIM1_OCPolarity  & TIM1_CCER2_CC4P ));
1142  000a 7b08          	ld	a,(OFST+7,sp)
1143  000c a420          	and	a,#32
1144  000e 6b01          	ld	(OFST+0,sp),a
1146  0010 9f            	ld	a,xl
1147  0011 a410          	and	a,#16
1148  0013 1a01          	or	a,(OFST+0,sp)
1149  0015 ca525d        	or	a,21085
1150  0018 c7525d        	ld	21085,a
1151                     ; 357   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1151                     ; 358                           TIM1_OCMode);
1153  001b c6525b        	ld	a,21083
1154  001e a48f          	and	a,#143
1155  0020 1a02          	or	a,(OFST+1,sp)
1156  0022 c7525b        	ld	21083,a
1157                     ; 361   if (TIM1_OCIdleState != TIM1_OCIDLESTATE_RESET)
1159  0025 0d09          	tnz	(OFST+8,sp)
1160  0027 270a          	jreq	L714
1161                     ; 363     TIM1->OISR |= (uint8_t)(~TIM1_CCER2_CC4P);
1163  0029 c6526f        	ld	a,21103
1164  002c aadf          	or	a,#223
1165  002e c7526f        	ld	21103,a
1167  0031 2004          	jra	L124
1168  0033               L714:
1169                     ; 367     TIM1->OISR &= (uint8_t)(~TIM1_OISR_OIS4);
1171  0033 721d526f      	bres	21103,#6
1172  0037               L124:
1173                     ; 371   TIM1->CCR4H = (uint8_t)(TIM1_Pulse >> 8);
1175  0037 7b06          	ld	a,(OFST+5,sp)
1176  0039 c7526b        	ld	21099,a
1177                     ; 372   TIM1->CCR4L = (uint8_t)(TIM1_Pulse);
1179  003c 7b07          	ld	a,(OFST+6,sp)
1180  003e c7526c        	ld	21100,a
1181                     ; 373 }
1184  0041 5b03          	addw	sp,#3
1185  0043 81            	ret
1388                     ; 388 void TIM1_BDTRConfig(TIM1_OSSIState_TypeDef TIM1_OSSIState,
1388                     ; 389                      TIM1_LockLevel_TypeDef TIM1_LockLevel,
1388                     ; 390                      uint8_t TIM1_DeadTime,
1388                     ; 391                      TIM1_BreakState_TypeDef TIM1_Break,
1388                     ; 392                      TIM1_BreakPolarity_TypeDef TIM1_BreakPolarity,
1388                     ; 393                      TIM1_AutomaticOutput_TypeDef TIM1_AutomaticOutput)
1388                     ; 394 {
1389                     .text:	section	.text,new
1390  0000               _TIM1_BDTRConfig:
1392  0000 89            	pushw	x
1393  0001 88            	push	a
1394       00000001      OFST:	set	1
1397                     ; 396   assert_param(IS_TIM1_OSSI_STATE_OK(TIM1_OSSIState));
1399                     ; 397   assert_param(IS_TIM1_LOCK_LEVEL_OK(TIM1_LockLevel));
1401                     ; 398   assert_param(IS_TIM1_BREAK_STATE_OK(TIM1_Break));
1403                     ; 399   assert_param(IS_TIM1_BREAK_POLARITY_OK(TIM1_BreakPolarity));
1405                     ; 400   assert_param(IS_TIM1_AUTOMATIC_OUTPUT_STATE_OK(TIM1_AutomaticOutput));
1407                     ; 402   TIM1->DTR = (uint8_t)(TIM1_DeadTime);
1409  0002 7b06          	ld	a,(OFST+5,sp)
1410  0004 c7526e        	ld	21102,a
1411                     ; 406   TIM1->BKR  =  (uint8_t)((uint8_t)(TIM1_OSSIState | (uint8_t)TIM1_LockLevel)  | 
1411                     ; 407                           (uint8_t)((uint8_t)(TIM1_Break | (uint8_t)TIM1_BreakPolarity)  | 
1411                     ; 408                           (uint8_t)TIM1_AutomaticOutput));
1413  0007 7b07          	ld	a,(OFST+6,sp)
1414  0009 1a08          	or	a,(OFST+7,sp)
1415  000b 1a09          	or	a,(OFST+8,sp)
1416  000d 6b01          	ld	(OFST+0,sp),a
1418  000f 9f            	ld	a,xl
1419  0010 1a02          	or	a,(OFST+1,sp)
1420  0012 1a01          	or	a,(OFST+0,sp)
1421  0014 c7526d        	ld	21101,a
1422                     ; 409 }
1425  0017 5b03          	addw	sp,#3
1426  0019 81            	ret
1626                     ; 423 void TIM1_ICInit(TIM1_Channel_TypeDef TIM1_Channel,
1626                     ; 424                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
1626                     ; 425                  TIM1_ICSelection_TypeDef TIM1_ICSelection,
1626                     ; 426                  TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
1626                     ; 427                  uint8_t TIM1_ICFilter)
1626                     ; 428 {
1627                     .text:	section	.text,new
1628  0000               _TIM1_ICInit:
1630  0000 89            	pushw	x
1631       00000000      OFST:	set	0
1634                     ; 430   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
1636                     ; 431   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
1638                     ; 432   assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
1640                     ; 433   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
1642                     ; 434   assert_param(IS_TIM1_IC_FILTER_OK(TIM1_ICFilter));
1644                     ; 436   if (TIM1_Channel == TIM1_CHANNEL_1)
1646  0001 9e            	ld	a,xh
1647  0002 4d            	tnz	a
1648  0003 2614          	jrne	L546
1649                     ; 439     TI1_Config((uint8_t)TIM1_ICPolarity,
1649                     ; 440                (uint8_t)TIM1_ICSelection,
1649                     ; 441                (uint8_t)TIM1_ICFilter);
1651  0005 7b07          	ld	a,(OFST+7,sp)
1652  0007 88            	push	a
1653  0008 7b06          	ld	a,(OFST+6,sp)
1654  000a 97            	ld	xl,a
1655  000b 7b03          	ld	a,(OFST+3,sp)
1656  000d 95            	ld	xh,a
1657  000e cd0000        	call	L3_TI1_Config
1659  0011 84            	pop	a
1660                     ; 443     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1662  0012 7b06          	ld	a,(OFST+6,sp)
1663  0014 cd0000        	call	_TIM1_SetIC1Prescaler
1666  0017 2046          	jra	L746
1667  0019               L546:
1668                     ; 445   else if (TIM1_Channel == TIM1_CHANNEL_2)
1670  0019 7b01          	ld	a,(OFST+1,sp)
1671  001b a101          	cp	a,#1
1672  001d 2614          	jrne	L156
1673                     ; 448     TI2_Config((uint8_t)TIM1_ICPolarity,
1673                     ; 449                (uint8_t)TIM1_ICSelection,
1673                     ; 450                (uint8_t)TIM1_ICFilter);
1675  001f 7b07          	ld	a,(OFST+7,sp)
1676  0021 88            	push	a
1677  0022 7b06          	ld	a,(OFST+6,sp)
1678  0024 97            	ld	xl,a
1679  0025 7b03          	ld	a,(OFST+3,sp)
1680  0027 95            	ld	xh,a
1681  0028 cd0000        	call	L5_TI2_Config
1683  002b 84            	pop	a
1684                     ; 452     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1686  002c 7b06          	ld	a,(OFST+6,sp)
1687  002e cd0000        	call	_TIM1_SetIC2Prescaler
1690  0031 202c          	jra	L746
1691  0033               L156:
1692                     ; 454   else if (TIM1_Channel == TIM1_CHANNEL_3)
1694  0033 7b01          	ld	a,(OFST+1,sp)
1695  0035 a102          	cp	a,#2
1696  0037 2614          	jrne	L556
1697                     ; 457     TI3_Config((uint8_t)TIM1_ICPolarity,
1697                     ; 458                (uint8_t)TIM1_ICSelection,
1697                     ; 459                (uint8_t)TIM1_ICFilter);
1699  0039 7b07          	ld	a,(OFST+7,sp)
1700  003b 88            	push	a
1701  003c 7b06          	ld	a,(OFST+6,sp)
1702  003e 97            	ld	xl,a
1703  003f 7b03          	ld	a,(OFST+3,sp)
1704  0041 95            	ld	xh,a
1705  0042 cd0000        	call	L7_TI3_Config
1707  0045 84            	pop	a
1708                     ; 461     TIM1_SetIC3Prescaler(TIM1_ICPrescaler);
1710  0046 7b06          	ld	a,(OFST+6,sp)
1711  0048 cd0000        	call	_TIM1_SetIC3Prescaler
1714  004b 2012          	jra	L746
1715  004d               L556:
1716                     ; 466     TI4_Config((uint8_t)TIM1_ICPolarity,
1716                     ; 467                (uint8_t)TIM1_ICSelection,
1716                     ; 468                (uint8_t)TIM1_ICFilter);
1718  004d 7b07          	ld	a,(OFST+7,sp)
1719  004f 88            	push	a
1720  0050 7b06          	ld	a,(OFST+6,sp)
1721  0052 97            	ld	xl,a
1722  0053 7b03          	ld	a,(OFST+3,sp)
1723  0055 95            	ld	xh,a
1724  0056 cd0000        	call	L11_TI4_Config
1726  0059 84            	pop	a
1727                     ; 470     TIM1_SetIC4Prescaler(TIM1_ICPrescaler);
1729  005a 7b06          	ld	a,(OFST+6,sp)
1730  005c cd0000        	call	_TIM1_SetIC4Prescaler
1732  005f               L746:
1733                     ; 472 }
1736  005f 85            	popw	x
1737  0060 81            	ret
1827                     ; 488 void TIM1_PWMIConfig(TIM1_Channel_TypeDef TIM1_Channel,
1827                     ; 489                      TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
1827                     ; 490                      TIM1_ICSelection_TypeDef TIM1_ICSelection,
1827                     ; 491                      TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
1827                     ; 492                      uint8_t TIM1_ICFilter)
1827                     ; 493 {
1828                     .text:	section	.text,new
1829  0000               _TIM1_PWMIConfig:
1831  0000 89            	pushw	x
1832  0001 89            	pushw	x
1833       00000002      OFST:	set	2
1836                     ; 494   uint8_t icpolarity = TIM1_ICPOLARITY_RISING;
1838                     ; 495   uint8_t icselection = TIM1_ICSELECTION_DIRECTTI;
1840                     ; 498   assert_param(IS_TIM1_PWMI_CHANNEL_OK(TIM1_Channel));
1842                     ; 499   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
1844                     ; 500   assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
1846                     ; 501   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
1848                     ; 504   if (TIM1_ICPolarity != TIM1_ICPOLARITY_FALLING)
1850  0002 9f            	ld	a,xl
1851  0003 a101          	cp	a,#1
1852  0005 2706          	jreq	L127
1853                     ; 506     icpolarity = TIM1_ICPOLARITY_FALLING;
1855  0007 a601          	ld	a,#1
1856  0009 6b01          	ld	(OFST-1,sp),a
1859  000b 2002          	jra	L327
1860  000d               L127:
1861                     ; 510     icpolarity = TIM1_ICPOLARITY_RISING;
1863  000d 0f01          	clr	(OFST-1,sp)
1865  000f               L327:
1866                     ; 514   if (TIM1_ICSelection == TIM1_ICSELECTION_DIRECTTI)
1868  000f 7b07          	ld	a,(OFST+5,sp)
1869  0011 a101          	cp	a,#1
1870  0013 2606          	jrne	L527
1871                     ; 516     icselection = TIM1_ICSELECTION_INDIRECTTI;
1873  0015 a602          	ld	a,#2
1874  0017 6b02          	ld	(OFST+0,sp),a
1877  0019 2004          	jra	L727
1878  001b               L527:
1879                     ; 520     icselection = TIM1_ICSELECTION_DIRECTTI;
1881  001b a601          	ld	a,#1
1882  001d 6b02          	ld	(OFST+0,sp),a
1884  001f               L727:
1885                     ; 523   if (TIM1_Channel == TIM1_CHANNEL_1)
1887  001f 0d03          	tnz	(OFST+1,sp)
1888  0021 2626          	jrne	L137
1889                     ; 526     TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
1889                     ; 527                (uint8_t)TIM1_ICFilter);
1891  0023 7b09          	ld	a,(OFST+7,sp)
1892  0025 88            	push	a
1893  0026 7b08          	ld	a,(OFST+6,sp)
1894  0028 97            	ld	xl,a
1895  0029 7b05          	ld	a,(OFST+3,sp)
1896  002b 95            	ld	xh,a
1897  002c cd0000        	call	L3_TI1_Config
1899  002f 84            	pop	a
1900                     ; 530     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1902  0030 7b08          	ld	a,(OFST+6,sp)
1903  0032 cd0000        	call	_TIM1_SetIC1Prescaler
1905                     ; 533     TI2_Config(icpolarity, icselection, TIM1_ICFilter);
1907  0035 7b09          	ld	a,(OFST+7,sp)
1908  0037 88            	push	a
1909  0038 7b03          	ld	a,(OFST+1,sp)
1910  003a 97            	ld	xl,a
1911  003b 7b02          	ld	a,(OFST+0,sp)
1912  003d 95            	ld	xh,a
1913  003e cd0000        	call	L5_TI2_Config
1915  0041 84            	pop	a
1916                     ; 536     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1918  0042 7b08          	ld	a,(OFST+6,sp)
1919  0044 cd0000        	call	_TIM1_SetIC2Prescaler
1922  0047 2024          	jra	L337
1923  0049               L137:
1924                     ; 541     TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
1924                     ; 542                (uint8_t)TIM1_ICFilter);
1926  0049 7b09          	ld	a,(OFST+7,sp)
1927  004b 88            	push	a
1928  004c 7b08          	ld	a,(OFST+6,sp)
1929  004e 97            	ld	xl,a
1930  004f 7b05          	ld	a,(OFST+3,sp)
1931  0051 95            	ld	xh,a
1932  0052 cd0000        	call	L5_TI2_Config
1934  0055 84            	pop	a
1935                     ; 545     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1937  0056 7b08          	ld	a,(OFST+6,sp)
1938  0058 cd0000        	call	_TIM1_SetIC2Prescaler
1940                     ; 548     TI1_Config(icpolarity, icselection, TIM1_ICFilter);
1942  005b 7b09          	ld	a,(OFST+7,sp)
1943  005d 88            	push	a
1944  005e 7b03          	ld	a,(OFST+1,sp)
1945  0060 97            	ld	xl,a
1946  0061 7b02          	ld	a,(OFST+0,sp)
1947  0063 95            	ld	xh,a
1948  0064 cd0000        	call	L3_TI1_Config
1950  0067 84            	pop	a
1951                     ; 551     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1953  0068 7b08          	ld	a,(OFST+6,sp)
1954  006a cd0000        	call	_TIM1_SetIC1Prescaler
1956  006d               L337:
1957                     ; 553 }
1960  006d 5b04          	addw	sp,#4
1961  006f 81            	ret
2016                     ; 561 void TIM1_Cmd(FunctionalState NewState)
2016                     ; 562 {
2017                     .text:	section	.text,new
2018  0000               _TIM1_Cmd:
2022                     ; 564   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2024                     ; 567   if (NewState != DISABLE)
2026  0000 4d            	tnz	a
2027  0001 2706          	jreq	L367
2028                     ; 569     TIM1->CR1 |= TIM1_CR1_CEN;
2030  0003 72105250      	bset	21072,#0
2032  0007 2004          	jra	L567
2033  0009               L367:
2034                     ; 573     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_CEN);
2036  0009 72115250      	bres	21072,#0
2037  000d               L567:
2038                     ; 575 }
2041  000d 81            	ret
2077                     ; 583 void TIM1_CtrlPWMOutputs(FunctionalState NewState)
2077                     ; 584 {
2078                     .text:	section	.text,new
2079  0000               _TIM1_CtrlPWMOutputs:
2083                     ; 586   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2085                     ; 590   if (NewState != DISABLE)
2087  0000 4d            	tnz	a
2088  0001 2706          	jreq	L5001
2089                     ; 592     TIM1->BKR |= TIM1_BKR_MOE;
2091  0003 721e526d      	bset	21101,#7
2093  0007 2004          	jra	L7001
2094  0009               L5001:
2095                     ; 596     TIM1->BKR &= (uint8_t)(~TIM1_BKR_MOE);
2097  0009 721f526d      	bres	21101,#7
2098  000d               L7001:
2099                     ; 598 }
2102  000d 81            	ret
2209                     ; 617 void TIM1_ITConfig(TIM1_IT_TypeDef  TIM1_IT, FunctionalState NewState)
2209                     ; 618 {
2210                     .text:	section	.text,new
2211  0000               _TIM1_ITConfig:
2213  0000 89            	pushw	x
2214       00000000      OFST:	set	0
2217                     ; 620   assert_param(IS_TIM1_IT_OK(TIM1_IT));
2219                     ; 621   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2221                     ; 623   if (NewState != DISABLE)
2223  0001 9f            	ld	a,xl
2224  0002 4d            	tnz	a
2225  0003 2709          	jreq	L7501
2226                     ; 626     TIM1->IER |= (uint8_t)TIM1_IT;
2228  0005 9e            	ld	a,xh
2229  0006 ca5254        	or	a,21076
2230  0009 c75254        	ld	21076,a
2232  000c 2009          	jra	L1601
2233  000e               L7501:
2234                     ; 631     TIM1->IER &= (uint8_t)(~(uint8_t)TIM1_IT);
2236  000e 7b01          	ld	a,(OFST+1,sp)
2237  0010 43            	cpl	a
2238  0011 c45254        	and	a,21076
2239  0014 c75254        	ld	21076,a
2240  0017               L1601:
2241                     ; 633 }
2244  0017 85            	popw	x
2245  0018 81            	ret
2269                     ; 640 void TIM1_InternalClockConfig(void)
2269                     ; 641 {
2270                     .text:	section	.text,new
2271  0000               _TIM1_InternalClockConfig:
2275                     ; 643   TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_SMS);
2277  0000 c65252        	ld	a,21074
2278  0003 a4f8          	and	a,#248
2279  0005 c75252        	ld	21074,a
2280                     ; 644 }
2283  0008 81            	ret
2398                     ; 662 void TIM1_ETRClockMode1Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2398                     ; 663                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2398                     ; 664                               uint8_t ExtTRGFilter)
2398                     ; 665 {
2399                     .text:	section	.text,new
2400  0000               _TIM1_ETRClockMode1Config:
2402  0000 89            	pushw	x
2403       00000000      OFST:	set	0
2406                     ; 667   assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
2408                     ; 668   assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
2410                     ; 671   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
2412  0001 7b05          	ld	a,(OFST+5,sp)
2413  0003 88            	push	a
2414  0004 9f            	ld	a,xl
2415  0005 97            	ld	xl,a
2416  0006 7b02          	ld	a,(OFST+2,sp)
2417  0008 95            	ld	xh,a
2418  0009 cd0000        	call	_TIM1_ETRConfig
2420  000c 84            	pop	a
2421                     ; 674   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~(uint8_t)(TIM1_SMCR_SMS | TIM1_SMCR_TS )))
2421                     ; 675                          | (uint8_t)((uint8_t)TIM1_SLAVEMODE_EXTERNAL1 | TIM1_TS_ETRF ));
2423  000d c65252        	ld	a,21074
2424  0010 a488          	and	a,#136
2425  0012 aa77          	or	a,#119
2426  0014 c75252        	ld	21074,a
2427                     ; 676 }
2430  0017 85            	popw	x
2431  0018 81            	ret
2487                     ; 694 void TIM1_ETRClockMode2Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2487                     ; 695                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2487                     ; 696                               uint8_t ExtTRGFilter)
2487                     ; 697 {
2488                     .text:	section	.text,new
2489  0000               _TIM1_ETRClockMode2Config:
2491  0000 89            	pushw	x
2492       00000000      OFST:	set	0
2495                     ; 699   assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
2497                     ; 700   assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
2499                     ; 703   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
2501  0001 7b05          	ld	a,(OFST+5,sp)
2502  0003 88            	push	a
2503  0004 9f            	ld	a,xl
2504  0005 97            	ld	xl,a
2505  0006 7b02          	ld	a,(OFST+2,sp)
2506  0008 95            	ld	xh,a
2507  0009 cd0000        	call	_TIM1_ETRConfig
2509  000c 84            	pop	a
2510                     ; 706   TIM1->ETR |= TIM1_ETR_ECE;
2512  000d 721c5253      	bset	21075,#6
2513                     ; 707 }
2516  0011 85            	popw	x
2517  0012 81            	ret
2571                     ; 725 void TIM1_ETRConfig(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2571                     ; 726                     TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2571                     ; 727                     uint8_t ExtTRGFilter)
2571                     ; 728 {
2572                     .text:	section	.text,new
2573  0000               _TIM1_ETRConfig:
2575  0000 89            	pushw	x
2576       00000000      OFST:	set	0
2579                     ; 730   assert_param(IS_TIM1_EXT_TRG_FILTER_OK(ExtTRGFilter));
2581                     ; 732   TIM1->ETR |= (uint8_t)((uint8_t)(TIM1_ExtTRGPrescaler | (uint8_t)TIM1_ExtTRGPolarity )|
2581                     ; 733                          (uint8_t)ExtTRGFilter );
2583  0001 9f            	ld	a,xl
2584  0002 1a01          	or	a,(OFST+1,sp)
2585  0004 1a05          	or	a,(OFST+5,sp)
2586  0006 ca5253        	or	a,21075
2587  0009 c75253        	ld	21075,a
2588                     ; 734 }
2591  000c 85            	popw	x
2592  000d 81            	ret
2679                     ; 751 void TIM1_TIxExternalClockConfig(TIM1_TIxExternalCLK1Source_TypeDef TIM1_TIxExternalCLKSource,
2679                     ; 752                                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
2679                     ; 753                                  uint8_t ICFilter)
2679                     ; 754 {
2680                     .text:	section	.text,new
2681  0000               _TIM1_TIxExternalClockConfig:
2683  0000 89            	pushw	x
2684       00000000      OFST:	set	0
2687                     ; 756   assert_param(IS_TIM1_TIXCLK_SOURCE_OK(TIM1_TIxExternalCLKSource));
2689                     ; 757   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
2691                     ; 758   assert_param(IS_TIM1_IC_FILTER_OK(ICFilter));
2693                     ; 761   if (TIM1_TIxExternalCLKSource == TIM1_TIXEXTERNALCLK1SOURCE_TI2)
2695  0001 9e            	ld	a,xh
2696  0002 a160          	cp	a,#96
2697  0004 260e          	jrne	L1521
2698                     ; 763     TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
2700  0006 7b05          	ld	a,(OFST+5,sp)
2701  0008 88            	push	a
2702  0009 9f            	ld	a,xl
2703  000a ae0001        	ldw	x,#1
2704  000d 95            	ld	xh,a
2705  000e cd0000        	call	L5_TI2_Config
2707  0011 84            	pop	a
2709  0012 200d          	jra	L3521
2710  0014               L1521:
2711                     ; 767     TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
2713  0014 7b05          	ld	a,(OFST+5,sp)
2714  0016 88            	push	a
2715  0017 7b03          	ld	a,(OFST+3,sp)
2716  0019 ae0001        	ldw	x,#1
2717  001c 95            	ld	xh,a
2718  001d cd0000        	call	L3_TI1_Config
2720  0020 84            	pop	a
2721  0021               L3521:
2722                     ; 771   TIM1_SelectInputTrigger((TIM1_TS_TypeDef)TIM1_TIxExternalCLKSource);
2724  0021 7b01          	ld	a,(OFST+1,sp)
2725  0023 cd0000        	call	_TIM1_SelectInputTrigger
2727                     ; 774   TIM1->SMCR |= (uint8_t)(TIM1_SLAVEMODE_EXTERNAL1);
2729  0026 c65252        	ld	a,21074
2730  0029 aa07          	or	a,#7
2731  002b c75252        	ld	21074,a
2732                     ; 775 }
2735  002e 85            	popw	x
2736  002f 81            	ret
2821                     ; 787 void TIM1_SelectInputTrigger(TIM1_TS_TypeDef TIM1_InputTriggerSource)
2821                     ; 788 {
2822                     .text:	section	.text,new
2823  0000               _TIM1_SelectInputTrigger:
2825  0000 88            	push	a
2826       00000000      OFST:	set	0
2829                     ; 790   assert_param(IS_TIM1_TRIGGER_SELECTION_OK(TIM1_InputTriggerSource));
2831                     ; 793   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_TS)) | (uint8_t)TIM1_InputTriggerSource);
2833  0001 c65252        	ld	a,21074
2834  0004 a48f          	and	a,#143
2835  0006 1a01          	or	a,(OFST+1,sp)
2836  0008 c75252        	ld	21074,a
2837                     ; 794 }
2840  000b 84            	pop	a
2841  000c 81            	ret
2877                     ; 803 void TIM1_UpdateDisableConfig(FunctionalState NewState)
2877                     ; 804 {
2878                     .text:	section	.text,new
2879  0000               _TIM1_UpdateDisableConfig:
2883                     ; 806   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2885                     ; 809   if (NewState != DISABLE)
2887  0000 4d            	tnz	a
2888  0001 2706          	jreq	L1331
2889                     ; 811     TIM1->CR1 |= TIM1_CR1_UDIS;
2891  0003 72125250      	bset	21072,#1
2893  0007 2004          	jra	L3331
2894  0009               L1331:
2895                     ; 815     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_UDIS);
2897  0009 72135250      	bres	21072,#1
2898  000d               L3331:
2899                     ; 817 }
2902  000d 81            	ret
2960                     ; 827 void TIM1_UpdateRequestConfig(TIM1_UpdateSource_TypeDef TIM1_UpdateSource)
2960                     ; 828 {
2961                     .text:	section	.text,new
2962  0000               _TIM1_UpdateRequestConfig:
2966                     ; 830   assert_param(IS_TIM1_UPDATE_SOURCE_OK(TIM1_UpdateSource));
2968                     ; 833   if (TIM1_UpdateSource != TIM1_UPDATESOURCE_GLOBAL)
2970  0000 4d            	tnz	a
2971  0001 2706          	jreq	L3631
2972                     ; 835     TIM1->CR1 |= TIM1_CR1_URS;
2974  0003 72145250      	bset	21072,#2
2976  0007 2004          	jra	L5631
2977  0009               L3631:
2978                     ; 839     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_URS);
2980  0009 72155250      	bres	21072,#2
2981  000d               L5631:
2982                     ; 841 }
2985  000d 81            	ret
3021                     ; 849 void TIM1_SelectHallSensor(FunctionalState NewState)
3021                     ; 850 {
3022                     .text:	section	.text,new
3023  0000               _TIM1_SelectHallSensor:
3027                     ; 852   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3029                     ; 855   if (NewState != DISABLE)
3031  0000 4d            	tnz	a
3032  0001 2706          	jreq	L5041
3033                     ; 857     TIM1->CR2 |= TIM1_CR2_TI1S;
3035  0003 721e5251      	bset	21073,#7
3037  0007 2004          	jra	L7041
3038  0009               L5041:
3039                     ; 861     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_TI1S);
3041  0009 721f5251      	bres	21073,#7
3042  000d               L7041:
3043                     ; 863 }
3046  000d 81            	ret
3103                     ; 873 void TIM1_SelectOnePulseMode(TIM1_OPMode_TypeDef TIM1_OPMode)
3103                     ; 874 {
3104                     .text:	section	.text,new
3105  0000               _TIM1_SelectOnePulseMode:
3109                     ; 876   assert_param(IS_TIM1_OPM_MODE_OK(TIM1_OPMode));
3111                     ; 879   if (TIM1_OPMode != TIM1_OPMODE_REPETITIVE)
3113  0000 4d            	tnz	a
3114  0001 2706          	jreq	L7341
3115                     ; 881     TIM1->CR1 |= TIM1_CR1_OPM;
3117  0003 72165250      	bset	21072,#3
3119  0007 2004          	jra	L1441
3120  0009               L7341:
3121                     ; 885     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_OPM);
3123  0009 72175250      	bres	21072,#3
3124  000d               L1441:
3125                     ; 888 }
3128  000d 81            	ret
3226                     ; 903 void TIM1_SelectOutputTrigger(TIM1_TRGOSource_TypeDef TIM1_TRGOSource)
3226                     ; 904 {
3227                     .text:	section	.text,new
3228  0000               _TIM1_SelectOutputTrigger:
3230  0000 88            	push	a
3231       00000000      OFST:	set	0
3234                     ; 906   assert_param(IS_TIM1_TRGO_SOURCE_OK(TIM1_TRGOSource));
3236                     ; 909   TIM1->CR2 = (uint8_t)((uint8_t)(TIM1->CR2 & (uint8_t)(~TIM1_CR2_MMS)) | 
3236                     ; 910                         (uint8_t) TIM1_TRGOSource);
3238  0001 c65251        	ld	a,21073
3239  0004 a48f          	and	a,#143
3240  0006 1a01          	or	a,(OFST+1,sp)
3241  0008 c75251        	ld	21073,a
3242                     ; 911 }
3245  000b 84            	pop	a
3246  000c 81            	ret
3320                     ; 923 void TIM1_SelectSlaveMode(TIM1_SlaveMode_TypeDef TIM1_SlaveMode)
3320                     ; 924 {
3321                     .text:	section	.text,new
3322  0000               _TIM1_SelectSlaveMode:
3324  0000 88            	push	a
3325       00000000      OFST:	set	0
3328                     ; 926   assert_param(IS_TIM1_SLAVE_MODE_OK(TIM1_SlaveMode));
3330                     ; 929   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_SMS)) |
3330                     ; 930                          (uint8_t)TIM1_SlaveMode);
3332  0001 c65252        	ld	a,21074
3333  0004 a4f8          	and	a,#248
3334  0006 1a01          	or	a,(OFST+1,sp)
3335  0008 c75252        	ld	21074,a
3336                     ; 931 }
3339  000b 84            	pop	a
3340  000c 81            	ret
3376                     ; 939 void TIM1_SelectMasterSlaveMode(FunctionalState NewState)
3376                     ; 940 {
3377                     .text:	section	.text,new
3378  0000               _TIM1_SelectMasterSlaveMode:
3382                     ; 942   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3384                     ; 945   if (NewState != DISABLE)
3386  0000 4d            	tnz	a
3387  0001 2706          	jreq	L3551
3388                     ; 947     TIM1->SMCR |= TIM1_SMCR_MSM;
3390  0003 721e5252      	bset	21074,#7
3392  0007 2004          	jra	L5551
3393  0009               L3551:
3394                     ; 951     TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_MSM);
3396  0009 721f5252      	bres	21074,#7
3397  000d               L5551:
3398                     ; 953 }
3401  000d 81            	ret
3487                     ; 975 void TIM1_EncoderInterfaceConfig(TIM1_EncoderMode_TypeDef TIM1_EncoderMode,
3487                     ; 976                                  TIM1_ICPolarity_TypeDef TIM1_IC1Polarity,
3487                     ; 977                                  TIM1_ICPolarity_TypeDef TIM1_IC2Polarity)
3487                     ; 978 {
3488                     .text:	section	.text,new
3489  0000               _TIM1_EncoderInterfaceConfig:
3491  0000 89            	pushw	x
3492       00000000      OFST:	set	0
3495                     ; 980   assert_param(IS_TIM1_ENCODER_MODE_OK(TIM1_EncoderMode));
3497                     ; 981   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC1Polarity));
3499                     ; 982   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC2Polarity));
3501                     ; 985   if (TIM1_IC1Polarity != TIM1_ICPOLARITY_RISING)
3503  0001 9f            	ld	a,xl
3504  0002 4d            	tnz	a
3505  0003 2706          	jreq	L7161
3506                     ; 987     TIM1->CCER1 |= TIM1_CCER1_CC1P;
3508  0005 7212525c      	bset	21084,#1
3510  0009 2004          	jra	L1261
3511  000b               L7161:
3512                     ; 991     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
3514  000b 7213525c      	bres	21084,#1
3515  000f               L1261:
3516                     ; 994   if (TIM1_IC2Polarity != TIM1_ICPOLARITY_RISING)
3518  000f 0d05          	tnz	(OFST+5,sp)
3519  0011 2706          	jreq	L3261
3520                     ; 996     TIM1->CCER1 |= TIM1_CCER1_CC2P;
3522  0013 721a525c      	bset	21084,#5
3524  0017 2004          	jra	L5261
3525  0019               L3261:
3526                     ; 1000     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
3528  0019 721b525c      	bres	21084,#5
3529  001d               L5261:
3530                     ; 1003   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(TIM1_SMCR_MSM | TIM1_SMCR_TS))
3530                     ; 1004                          | (uint8_t) TIM1_EncoderMode);
3532  001d c65252        	ld	a,21074
3533  0020 a4f0          	and	a,#240
3534  0022 1a01          	or	a,(OFST+1,sp)
3535  0024 c75252        	ld	21074,a
3536                     ; 1007   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_CCxS)) 
3536                     ; 1008                           | (uint8_t) CCMR_TIxDirect_Set);
3538  0027 c65258        	ld	a,21080
3539  002a a4fc          	and	a,#252
3540  002c aa01          	or	a,#1
3541  002e c75258        	ld	21080,a
3542                     ; 1009   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_CCxS))
3542                     ; 1010                           | (uint8_t) CCMR_TIxDirect_Set);
3544  0031 c65259        	ld	a,21081
3545  0034 a4fc          	and	a,#252
3546  0036 aa01          	or	a,#1
3547  0038 c75259        	ld	21081,a
3548                     ; 1011 }
3551  003b 85            	popw	x
3552  003c 81            	ret
3617                     ; 1023 void TIM1_PrescalerConfig(uint16_t Prescaler,
3617                     ; 1024                           TIM1_PSCReloadMode_TypeDef TIM1_PSCReloadMode)
3617                     ; 1025 {
3618                     .text:	section	.text,new
3619  0000               _TIM1_PrescalerConfig:
3621  0000 89            	pushw	x
3622       00000000      OFST:	set	0
3625                     ; 1027   assert_param(IS_TIM1_PRESCALER_RELOAD_OK(TIM1_PSCReloadMode));
3627                     ; 1030   TIM1->PSCRH = (uint8_t)(Prescaler >> 8);
3629  0001 9e            	ld	a,xh
3630  0002 c75260        	ld	21088,a
3631                     ; 1031   TIM1->PSCRL = (uint8_t)(Prescaler);
3633  0005 9f            	ld	a,xl
3634  0006 c75261        	ld	21089,a
3635                     ; 1034   TIM1->EGR = (uint8_t)TIM1_PSCReloadMode;
3637  0009 7b05          	ld	a,(OFST+5,sp)
3638  000b c75257        	ld	21079,a
3639                     ; 1035 }
3642  000e 85            	popw	x
3643  000f 81            	ret
3679                     ; 1048 void TIM1_CounterModeConfig(TIM1_CounterMode_TypeDef TIM1_CounterMode)
3679                     ; 1049 {
3680                     .text:	section	.text,new
3681  0000               _TIM1_CounterModeConfig:
3683  0000 88            	push	a
3684       00000000      OFST:	set	0
3687                     ; 1051   assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
3689                     ; 1055   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)((uint8_t)(~TIM1_CR1_CMS) & (uint8_t)(~TIM1_CR1_DIR)))
3689                     ; 1056                         | (uint8_t)TIM1_CounterMode);
3691  0001 c65250        	ld	a,21072
3692  0004 a48f          	and	a,#143
3693  0006 1a01          	or	a,(OFST+1,sp)
3694  0008 c75250        	ld	21072,a
3695                     ; 1057 }
3698  000b 84            	pop	a
3699  000c 81            	ret
3757                     ; 1067 void TIM1_ForcedOC1Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3757                     ; 1068 {
3758                     .text:	section	.text,new
3759  0000               _TIM1_ForcedOC1Config:
3761  0000 88            	push	a
3762       00000000      OFST:	set	0
3765                     ; 1070   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3767                     ; 1073   TIM1->CCMR1 =  (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM))|
3767                     ; 1074                            (uint8_t)TIM1_ForcedAction);
3769  0001 c65258        	ld	a,21080
3770  0004 a48f          	and	a,#143
3771  0006 1a01          	or	a,(OFST+1,sp)
3772  0008 c75258        	ld	21080,a
3773                     ; 1075 }
3776  000b 84            	pop	a
3777  000c 81            	ret
3813                     ; 1085 void TIM1_ForcedOC2Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3813                     ; 1086 {
3814                     .text:	section	.text,new
3815  0000               _TIM1_ForcedOC2Config:
3817  0000 88            	push	a
3818       00000000      OFST:	set	0
3821                     ; 1088   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3823                     ; 1091   TIM1->CCMR2  =  (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
3823                     ; 1092                             | (uint8_t)TIM1_ForcedAction);
3825  0001 c65259        	ld	a,21081
3826  0004 a48f          	and	a,#143
3827  0006 1a01          	or	a,(OFST+1,sp)
3828  0008 c75259        	ld	21081,a
3829                     ; 1093 }
3832  000b 84            	pop	a
3833  000c 81            	ret
3869                     ; 1104 void TIM1_ForcedOC3Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3869                     ; 1105 {
3870                     .text:	section	.text,new
3871  0000               _TIM1_ForcedOC3Config:
3873  0000 88            	push	a
3874       00000000      OFST:	set	0
3877                     ; 1107   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3879                     ; 1110   TIM1->CCMR3  =  (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM))  
3879                     ; 1111                             | (uint8_t)TIM1_ForcedAction);
3881  0001 c6525a        	ld	a,21082
3882  0004 a48f          	and	a,#143
3883  0006 1a01          	or	a,(OFST+1,sp)
3884  0008 c7525a        	ld	21082,a
3885                     ; 1112 }
3888  000b 84            	pop	a
3889  000c 81            	ret
3925                     ; 1123 void TIM1_ForcedOC4Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3925                     ; 1124 {
3926                     .text:	section	.text,new
3927  0000               _TIM1_ForcedOC4Config:
3929  0000 88            	push	a
3930       00000000      OFST:	set	0
3933                     ; 1126   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3935                     ; 1129   TIM1->CCMR4  =  (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
3935                     ; 1130                             | (uint8_t)TIM1_ForcedAction);
3937  0001 c6525b        	ld	a,21083
3938  0004 a48f          	and	a,#143
3939  0006 1a01          	or	a,(OFST+1,sp)
3940  0008 c7525b        	ld	21083,a
3941                     ; 1131 }
3944  000b 84            	pop	a
3945  000c 81            	ret
3981                     ; 1139 void TIM1_ARRPreloadConfig(FunctionalState NewState)
3981                     ; 1140 {
3982                     .text:	section	.text,new
3983  0000               _TIM1_ARRPreloadConfig:
3987                     ; 1142   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3989                     ; 1145   if (NewState != DISABLE)
3991  0000 4d            	tnz	a
3992  0001 2706          	jreq	L3102
3993                     ; 1147     TIM1->CR1 |= TIM1_CR1_ARPE;
3995  0003 721e5250      	bset	21072,#7
3997  0007 2004          	jra	L5102
3998  0009               L3102:
3999                     ; 1151     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_ARPE);
4001  0009 721f5250      	bres	21072,#7
4002  000d               L5102:
4003                     ; 1153 }
4006  000d 81            	ret
4041                     ; 1161 void TIM1_SelectCOM(FunctionalState NewState)
4041                     ; 1162 {
4042                     .text:	section	.text,new
4043  0000               _TIM1_SelectCOM:
4047                     ; 1164   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4049                     ; 1167   if (NewState != DISABLE)
4051  0000 4d            	tnz	a
4052  0001 2706          	jreq	L5302
4053                     ; 1169     TIM1->CR2 |= TIM1_CR2_COMS;
4055  0003 72145251      	bset	21073,#2
4057  0007 2004          	jra	L7302
4058  0009               L5302:
4059                     ; 1173     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_COMS);
4061  0009 72155251      	bres	21073,#2
4062  000d               L7302:
4063                     ; 1175 }
4066  000d 81            	ret
4102                     ; 1183 void TIM1_CCPreloadControl(FunctionalState NewState)
4102                     ; 1184 {
4103                     .text:	section	.text,new
4104  0000               _TIM1_CCPreloadControl:
4108                     ; 1186   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4110                     ; 1189   if (NewState != DISABLE)
4112  0000 4d            	tnz	a
4113  0001 2706          	jreq	L7502
4114                     ; 1191     TIM1->CR2 |= TIM1_CR2_CCPC;
4116  0003 72105251      	bset	21073,#0
4118  0007 2004          	jra	L1602
4119  0009               L7502:
4120                     ; 1195     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCPC);
4122  0009 72115251      	bres	21073,#0
4123  000d               L1602:
4124                     ; 1197 }
4127  000d 81            	ret
4163                     ; 1205 void TIM1_OC1PreloadConfig(FunctionalState NewState)
4163                     ; 1206 {
4164                     .text:	section	.text,new
4165  0000               _TIM1_OC1PreloadConfig:
4169                     ; 1208   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4171                     ; 1211   if (NewState != DISABLE)
4173  0000 4d            	tnz	a
4174  0001 2706          	jreq	L1012
4175                     ; 1213     TIM1->CCMR1 |= TIM1_CCMR_OCxPE;
4177  0003 72165258      	bset	21080,#3
4179  0007 2004          	jra	L3012
4180  0009               L1012:
4181                     ; 1217     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4183  0009 72175258      	bres	21080,#3
4184  000d               L3012:
4185                     ; 1219 }
4188  000d 81            	ret
4224                     ; 1227 void TIM1_OC2PreloadConfig(FunctionalState NewState)
4224                     ; 1228 {
4225                     .text:	section	.text,new
4226  0000               _TIM1_OC2PreloadConfig:
4230                     ; 1230   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4232                     ; 1233   if (NewState != DISABLE)
4234  0000 4d            	tnz	a
4235  0001 2706          	jreq	L3212
4236                     ; 1235     TIM1->CCMR2 |= TIM1_CCMR_OCxPE;
4238  0003 72165259      	bset	21081,#3
4240  0007 2004          	jra	L5212
4241  0009               L3212:
4242                     ; 1239     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4244  0009 72175259      	bres	21081,#3
4245  000d               L5212:
4246                     ; 1241 }
4249  000d 81            	ret
4285                     ; 1249 void TIM1_OC3PreloadConfig(FunctionalState NewState)
4285                     ; 1250 {
4286                     .text:	section	.text,new
4287  0000               _TIM1_OC3PreloadConfig:
4291                     ; 1252   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4293                     ; 1255   if (NewState != DISABLE)
4295  0000 4d            	tnz	a
4296  0001 2706          	jreq	L5412
4297                     ; 1257     TIM1->CCMR3 |= TIM1_CCMR_OCxPE;
4299  0003 7216525a      	bset	21082,#3
4301  0007 2004          	jra	L7412
4302  0009               L5412:
4303                     ; 1261     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4305  0009 7217525a      	bres	21082,#3
4306  000d               L7412:
4307                     ; 1263 }
4310  000d 81            	ret
4346                     ; 1271 void TIM1_OC4PreloadConfig(FunctionalState NewState)
4346                     ; 1272 {
4347                     .text:	section	.text,new
4348  0000               _TIM1_OC4PreloadConfig:
4352                     ; 1274   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4354                     ; 1277   if (NewState != DISABLE)
4356  0000 4d            	tnz	a
4357  0001 2706          	jreq	L7612
4358                     ; 1279     TIM1->CCMR4 |= TIM1_CCMR_OCxPE;
4360  0003 7216525b      	bset	21083,#3
4362  0007 2004          	jra	L1712
4363  0009               L7612:
4364                     ; 1283     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4366  0009 7217525b      	bres	21083,#3
4367  000d               L1712:
4368                     ; 1285 }
4371  000d 81            	ret
4406                     ; 1293 void TIM1_OC1FastConfig(FunctionalState NewState)
4406                     ; 1294 {
4407                     .text:	section	.text,new
4408  0000               _TIM1_OC1FastConfig:
4412                     ; 1296   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4414                     ; 1299   if (NewState != DISABLE)
4416  0000 4d            	tnz	a
4417  0001 2706          	jreq	L1122
4418                     ; 1301     TIM1->CCMR1 |= TIM1_CCMR_OCxFE;
4420  0003 72145258      	bset	21080,#2
4422  0007 2004          	jra	L3122
4423  0009               L1122:
4424                     ; 1305     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4426  0009 72155258      	bres	21080,#2
4427  000d               L3122:
4428                     ; 1307 }
4431  000d 81            	ret
4466                     ; 1315 void TIM1_OC2FastConfig(FunctionalState NewState)
4466                     ; 1316 {
4467                     .text:	section	.text,new
4468  0000               _TIM1_OC2FastConfig:
4472                     ; 1318   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4474                     ; 1321   if (NewState != DISABLE)
4476  0000 4d            	tnz	a
4477  0001 2706          	jreq	L3322
4478                     ; 1323     TIM1->CCMR2 |= TIM1_CCMR_OCxFE;
4480  0003 72145259      	bset	21081,#2
4482  0007 2004          	jra	L5322
4483  0009               L3322:
4484                     ; 1327     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4486  0009 72155259      	bres	21081,#2
4487  000d               L5322:
4488                     ; 1329 }
4491  000d 81            	ret
4526                     ; 1337 void TIM1_OC3FastConfig(FunctionalState NewState)
4526                     ; 1338 {
4527                     .text:	section	.text,new
4528  0000               _TIM1_OC3FastConfig:
4532                     ; 1340   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4534                     ; 1343   if (NewState != DISABLE)
4536  0000 4d            	tnz	a
4537  0001 2706          	jreq	L5522
4538                     ; 1345     TIM1->CCMR3 |= TIM1_CCMR_OCxFE;
4540  0003 7214525a      	bset	21082,#2
4542  0007 2004          	jra	L7522
4543  0009               L5522:
4544                     ; 1349     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4546  0009 7215525a      	bres	21082,#2
4547  000d               L7522:
4548                     ; 1351 }
4551  000d 81            	ret
4586                     ; 1359 void TIM1_OC4FastConfig(FunctionalState NewState)
4586                     ; 1360 {
4587                     .text:	section	.text,new
4588  0000               _TIM1_OC4FastConfig:
4592                     ; 1362   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4594                     ; 1365   if (NewState != DISABLE)
4596  0000 4d            	tnz	a
4597  0001 2706          	jreq	L7722
4598                     ; 1367     TIM1->CCMR4 |= TIM1_CCMR_OCxFE;
4600  0003 7214525b      	bset	21083,#2
4602  0007 2004          	jra	L1032
4603  0009               L7722:
4604                     ; 1371     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4606  0009 7215525b      	bres	21083,#2
4607  000d               L1032:
4608                     ; 1373 }
4611  000d 81            	ret
4716                     ; 1389 void TIM1_GenerateEvent(TIM1_EventSource_TypeDef TIM1_EventSource)
4716                     ; 1390 {
4717                     .text:	section	.text,new
4718  0000               _TIM1_GenerateEvent:
4722                     ; 1392   assert_param(IS_TIM1_EVENT_SOURCE_OK(TIM1_EventSource));
4724                     ; 1395   TIM1->EGR = (uint8_t)TIM1_EventSource;
4726  0000 c75257        	ld	21079,a
4727                     ; 1396 }
4730  0003 81            	ret
4766                     ; 1406 void TIM1_OC1PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
4766                     ; 1407 {
4767                     .text:	section	.text,new
4768  0000               _TIM1_OC1PolarityConfig:
4772                     ; 1409   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
4774                     ; 1412   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
4776  0000 4d            	tnz	a
4777  0001 2706          	jreq	L3632
4778                     ; 1414     TIM1->CCER1 |= TIM1_CCER1_CC1P;
4780  0003 7212525c      	bset	21084,#1
4782  0007 2004          	jra	L5632
4783  0009               L3632:
4784                     ; 1418     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
4786  0009 7213525c      	bres	21084,#1
4787  000d               L5632:
4788                     ; 1420 }
4791  000d 81            	ret
4827                     ; 1430 void TIM1_OC1NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
4827                     ; 1431 {
4828                     .text:	section	.text,new
4829  0000               _TIM1_OC1NPolarityConfig:
4833                     ; 1433   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
4835                     ; 1436   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
4837  0000 4d            	tnz	a
4838  0001 2706          	jreq	L5042
4839                     ; 1438     TIM1->CCER1 |= TIM1_CCER1_CC1NP;
4841  0003 7216525c      	bset	21084,#3
4843  0007 2004          	jra	L7042
4844  0009               L5042:
4845                     ; 1442     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NP);
4847  0009 7217525c      	bres	21084,#3
4848  000d               L7042:
4849                     ; 1444 }
4852  000d 81            	ret
4888                     ; 1454 void TIM1_OC2PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
4888                     ; 1455 {
4889                     .text:	section	.text,new
4890  0000               _TIM1_OC2PolarityConfig:
4894                     ; 1457   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
4896                     ; 1460   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
4898  0000 4d            	tnz	a
4899  0001 2706          	jreq	L7242
4900                     ; 1462     TIM1->CCER1 |= TIM1_CCER1_CC2P;
4902  0003 721a525c      	bset	21084,#5
4904  0007 2004          	jra	L1342
4905  0009               L7242:
4906                     ; 1466     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
4908  0009 721b525c      	bres	21084,#5
4909  000d               L1342:
4910                     ; 1468 }
4913  000d 81            	ret
4949                     ; 1478 void TIM1_OC2NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
4949                     ; 1479 {
4950                     .text:	section	.text,new
4951  0000               _TIM1_OC2NPolarityConfig:
4955                     ; 1481   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
4957                     ; 1484   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
4959  0000 4d            	tnz	a
4960  0001 2706          	jreq	L1542
4961                     ; 1486     TIM1->CCER1 |= TIM1_CCER1_CC2NP;
4963  0003 721e525c      	bset	21084,#7
4965  0007 2004          	jra	L3542
4966  0009               L1542:
4967                     ; 1490     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NP);
4969  0009 721f525c      	bres	21084,#7
4970  000d               L3542:
4971                     ; 1492 }
4974  000d 81            	ret
5010                     ; 1502 void TIM1_OC3PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
5010                     ; 1503 {
5011                     .text:	section	.text,new
5012  0000               _TIM1_OC3PolarityConfig:
5016                     ; 1505   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
5018                     ; 1508   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
5020  0000 4d            	tnz	a
5021  0001 2706          	jreq	L3742
5022                     ; 1510     TIM1->CCER2 |= TIM1_CCER2_CC3P;
5024  0003 7212525d      	bset	21085,#1
5026  0007 2004          	jra	L5742
5027  0009               L3742:
5028                     ; 1514     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
5030  0009 7213525d      	bres	21085,#1
5031  000d               L5742:
5032                     ; 1516 }
5035  000d 81            	ret
5071                     ; 1527 void TIM1_OC3NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
5071                     ; 1528 {
5072                     .text:	section	.text,new
5073  0000               _TIM1_OC3NPolarityConfig:
5077                     ; 1530   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
5079                     ; 1533   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
5081  0000 4d            	tnz	a
5082  0001 2706          	jreq	L5152
5083                     ; 1535     TIM1->CCER2 |= TIM1_CCER2_CC3NP;
5085  0003 7216525d      	bset	21085,#3
5087  0007 2004          	jra	L7152
5088  0009               L5152:
5089                     ; 1539     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NP);
5091  0009 7217525d      	bres	21085,#3
5092  000d               L7152:
5093                     ; 1541 }
5096  000d 81            	ret
5132                     ; 1551 void TIM1_OC4PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
5132                     ; 1552 {
5133                     .text:	section	.text,new
5134  0000               _TIM1_OC4PolarityConfig:
5138                     ; 1554   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
5140                     ; 1557   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
5142  0000 4d            	tnz	a
5143  0001 2706          	jreq	L7352
5144                     ; 1559     TIM1->CCER2 |= TIM1_CCER2_CC4P;
5146  0003 721a525d      	bset	21085,#5
5148  0007 2004          	jra	L1452
5149  0009               L7352:
5150                     ; 1563     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
5152  0009 721b525d      	bres	21085,#5
5153  000d               L1452:
5154                     ; 1565 }
5157  000d 81            	ret
5202                     ; 1579 void TIM1_CCxCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
5202                     ; 1580 {
5203                     .text:	section	.text,new
5204  0000               _TIM1_CCxCmd:
5206  0000 89            	pushw	x
5207       00000000      OFST:	set	0
5210                     ; 1582   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
5212                     ; 1583   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5214                     ; 1585   if (TIM1_Channel == TIM1_CHANNEL_1)
5216  0001 9e            	ld	a,xh
5217  0002 4d            	tnz	a
5218  0003 2610          	jrne	L5652
5219                     ; 1588     if (NewState != DISABLE)
5221  0005 9f            	ld	a,xl
5222  0006 4d            	tnz	a
5223  0007 2706          	jreq	L7652
5224                     ; 1590       TIM1->CCER1 |= TIM1_CCER1_CC1E;
5226  0009 7210525c      	bset	21084,#0
5228  000d 2040          	jra	L3752
5229  000f               L7652:
5230                     ; 1594       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
5232  000f 7211525c      	bres	21084,#0
5233  0013 203a          	jra	L3752
5234  0015               L5652:
5235                     ; 1598   else if (TIM1_Channel == TIM1_CHANNEL_2)
5237  0015 7b01          	ld	a,(OFST+1,sp)
5238  0017 a101          	cp	a,#1
5239  0019 2610          	jrne	L5752
5240                     ; 1601     if (NewState != DISABLE)
5242  001b 0d02          	tnz	(OFST+2,sp)
5243  001d 2706          	jreq	L7752
5244                     ; 1603       TIM1->CCER1 |= TIM1_CCER1_CC2E;
5246  001f 7218525c      	bset	21084,#4
5248  0023 202a          	jra	L3752
5249  0025               L7752:
5250                     ; 1607       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
5252  0025 7219525c      	bres	21084,#4
5253  0029 2024          	jra	L3752
5254  002b               L5752:
5255                     ; 1610   else if (TIM1_Channel == TIM1_CHANNEL_3)
5257  002b 7b01          	ld	a,(OFST+1,sp)
5258  002d a102          	cp	a,#2
5259  002f 2610          	jrne	L5062
5260                     ; 1613     if (NewState != DISABLE)
5262  0031 0d02          	tnz	(OFST+2,sp)
5263  0033 2706          	jreq	L7062
5264                     ; 1615       TIM1->CCER2 |= TIM1_CCER2_CC3E;
5266  0035 7210525d      	bset	21085,#0
5268  0039 2014          	jra	L3752
5269  003b               L7062:
5270                     ; 1619       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
5272  003b 7211525d      	bres	21085,#0
5273  003f 200e          	jra	L3752
5274  0041               L5062:
5275                     ; 1625     if (NewState != DISABLE)
5277  0041 0d02          	tnz	(OFST+2,sp)
5278  0043 2706          	jreq	L5162
5279                     ; 1627       TIM1->CCER2 |= TIM1_CCER2_CC4E;
5281  0045 7218525d      	bset	21085,#4
5283  0049 2004          	jra	L3752
5284  004b               L5162:
5285                     ; 1631       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
5287  004b 7219525d      	bres	21085,#4
5288  004f               L3752:
5289                     ; 1634 }
5292  004f 85            	popw	x
5293  0050 81            	ret
5338                     ; 1647 void TIM1_CCxNCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
5338                     ; 1648 {
5339                     .text:	section	.text,new
5340  0000               _TIM1_CCxNCmd:
5342  0000 89            	pushw	x
5343       00000000      OFST:	set	0
5346                     ; 1650   assert_param(IS_TIM1_COMPLEMENTARY_CHANNEL_OK(TIM1_Channel));
5348                     ; 1651   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5350                     ; 1653   if (TIM1_Channel == TIM1_CHANNEL_1)
5352  0001 9e            	ld	a,xh
5353  0002 4d            	tnz	a
5354  0003 2610          	jrne	L3462
5355                     ; 1656     if (NewState != DISABLE)
5357  0005 9f            	ld	a,xl
5358  0006 4d            	tnz	a
5359  0007 2706          	jreq	L5462
5360                     ; 1658       TIM1->CCER1 |= TIM1_CCER1_CC1NE;
5362  0009 7214525c      	bset	21084,#2
5364  000d 202a          	jra	L1562
5365  000f               L5462:
5366                     ; 1662       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NE);
5368  000f 7215525c      	bres	21084,#2
5369  0013 2024          	jra	L1562
5370  0015               L3462:
5371                     ; 1665   else if (TIM1_Channel == TIM1_CHANNEL_2)
5373  0015 7b01          	ld	a,(OFST+1,sp)
5374  0017 a101          	cp	a,#1
5375  0019 2610          	jrne	L3562
5376                     ; 1668     if (NewState != DISABLE)
5378  001b 0d02          	tnz	(OFST+2,sp)
5379  001d 2706          	jreq	L5562
5380                     ; 1670       TIM1->CCER1 |= TIM1_CCER1_CC2NE;
5382  001f 721c525c      	bset	21084,#6
5384  0023 2014          	jra	L1562
5385  0025               L5562:
5386                     ; 1674       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NE);
5388  0025 721d525c      	bres	21084,#6
5389  0029 200e          	jra	L1562
5390  002b               L3562:
5391                     ; 1680     if (NewState != DISABLE)
5393  002b 0d02          	tnz	(OFST+2,sp)
5394  002d 2706          	jreq	L3662
5395                     ; 1682       TIM1->CCER2 |= TIM1_CCER2_CC3NE;
5397  002f 7214525d      	bset	21085,#2
5399  0033 2004          	jra	L1562
5400  0035               L3662:
5401                     ; 1686       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NE);
5403  0035 7215525d      	bres	21085,#2
5404  0039               L1562:
5405                     ; 1689 }
5408  0039 85            	popw	x
5409  003a 81            	ret
5454                     ; 1712 void TIM1_SelectOCxM(TIM1_Channel_TypeDef TIM1_Channel, TIM1_OCMode_TypeDef TIM1_OCMode)
5454                     ; 1713 {
5455                     .text:	section	.text,new
5456  0000               _TIM1_SelectOCxM:
5458  0000 89            	pushw	x
5459       00000000      OFST:	set	0
5462                     ; 1715   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
5464                     ; 1716   assert_param(IS_TIM1_OCM_OK(TIM1_OCMode));
5466                     ; 1718   if (TIM1_Channel == TIM1_CHANNEL_1)
5468  0001 9e            	ld	a,xh
5469  0002 4d            	tnz	a
5470  0003 2610          	jrne	L1172
5471                     ; 1721     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
5473  0005 7211525c      	bres	21084,#0
5474                     ; 1724     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) 
5474                     ; 1725                             | (uint8_t)TIM1_OCMode);
5476  0009 c65258        	ld	a,21080
5477  000c a48f          	and	a,#143
5478  000e 1a02          	or	a,(OFST+2,sp)
5479  0010 c75258        	ld	21080,a
5481  0013 203a          	jra	L3172
5482  0015               L1172:
5483                     ; 1727   else if (TIM1_Channel == TIM1_CHANNEL_2)
5485  0015 7b01          	ld	a,(OFST+1,sp)
5486  0017 a101          	cp	a,#1
5487  0019 2610          	jrne	L5172
5488                     ; 1730     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
5490  001b 7219525c      	bres	21084,#4
5491                     ; 1733     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
5491                     ; 1734                             | (uint8_t)TIM1_OCMode);
5493  001f c65259        	ld	a,21081
5494  0022 a48f          	and	a,#143
5495  0024 1a02          	or	a,(OFST+2,sp)
5496  0026 c75259        	ld	21081,a
5498  0029 2024          	jra	L3172
5499  002b               L5172:
5500                     ; 1736   else if (TIM1_Channel == TIM1_CHANNEL_3)
5502  002b 7b01          	ld	a,(OFST+1,sp)
5503  002d a102          	cp	a,#2
5504  002f 2610          	jrne	L1272
5505                     ; 1739     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
5507  0031 7211525d      	bres	21085,#0
5508                     ; 1742     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) 
5508                     ; 1743                             | (uint8_t)TIM1_OCMode);
5510  0035 c6525a        	ld	a,21082
5511  0038 a48f          	and	a,#143
5512  003a 1a02          	or	a,(OFST+2,sp)
5513  003c c7525a        	ld	21082,a
5515  003f 200e          	jra	L3172
5516  0041               L1272:
5517                     ; 1748     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
5519  0041 7219525d      	bres	21085,#4
5520                     ; 1751     TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
5520                     ; 1752                             | (uint8_t)TIM1_OCMode);
5522  0045 c6525b        	ld	a,21083
5523  0048 a48f          	and	a,#143
5524  004a 1a02          	or	a,(OFST+2,sp)
5525  004c c7525b        	ld	21083,a
5526  004f               L3172:
5527                     ; 1754 }
5530  004f 85            	popw	x
5531  0050 81            	ret
5563                     ; 1762 void TIM1_SetCounter(uint16_t Counter)
5563                     ; 1763 {
5564                     .text:	section	.text,new
5565  0000               _TIM1_SetCounter:
5569                     ; 1765   TIM1->CNTRH = (uint8_t)(Counter >> 8);
5571  0000 9e            	ld	a,xh
5572  0001 c7525e        	ld	21086,a
5573                     ; 1766   TIM1->CNTRL = (uint8_t)(Counter);
5575  0004 9f            	ld	a,xl
5576  0005 c7525f        	ld	21087,a
5577                     ; 1767 }
5580  0008 81            	ret
5612                     ; 1775 void TIM1_SetAutoreload(uint16_t Autoreload)
5612                     ; 1776 {
5613                     .text:	section	.text,new
5614  0000               _TIM1_SetAutoreload:
5618                     ; 1778   TIM1->ARRH = (uint8_t)(Autoreload >> 8);
5620  0000 9e            	ld	a,xh
5621  0001 c75262        	ld	21090,a
5622                     ; 1779   TIM1->ARRL = (uint8_t)(Autoreload);
5624  0004 9f            	ld	a,xl
5625  0005 c75263        	ld	21091,a
5626                     ; 1780  }
5629  0008 81            	ret
5661                     ; 1788 void TIM1_SetCompare1(uint16_t Compare1)
5661                     ; 1789 {
5662                     .text:	section	.text,new
5663  0000               _TIM1_SetCompare1:
5667                     ; 1791   TIM1->CCR1H = (uint8_t)(Compare1 >> 8);
5669  0000 9e            	ld	a,xh
5670  0001 c75265        	ld	21093,a
5671                     ; 1792   TIM1->CCR1L = (uint8_t)(Compare1);
5673  0004 9f            	ld	a,xl
5674  0005 c75266        	ld	21094,a
5675                     ; 1793 }
5678  0008 81            	ret
5710                     ; 1801 void TIM1_SetCompare2(uint16_t Compare2)
5710                     ; 1802 {
5711                     .text:	section	.text,new
5712  0000               _TIM1_SetCompare2:
5716                     ; 1804   TIM1->CCR2H = (uint8_t)(Compare2 >> 8);
5718  0000 9e            	ld	a,xh
5719  0001 c75267        	ld	21095,a
5720                     ; 1805   TIM1->CCR2L = (uint8_t)(Compare2);
5722  0004 9f            	ld	a,xl
5723  0005 c75268        	ld	21096,a
5724                     ; 1806 }
5727  0008 81            	ret
5759                     ; 1814 void TIM1_SetCompare3(uint16_t Compare3)
5759                     ; 1815 {
5760                     .text:	section	.text,new
5761  0000               _TIM1_SetCompare3:
5765                     ; 1817   TIM1->CCR3H = (uint8_t)(Compare3 >> 8);
5767  0000 9e            	ld	a,xh
5768  0001 c75269        	ld	21097,a
5769                     ; 1818   TIM1->CCR3L = (uint8_t)(Compare3);
5771  0004 9f            	ld	a,xl
5772  0005 c7526a        	ld	21098,a
5773                     ; 1819 }
5776  0008 81            	ret
5808                     ; 1827 void TIM1_SetCompare4(uint16_t Compare4)
5808                     ; 1828 {
5809                     .text:	section	.text,new
5810  0000               _TIM1_SetCompare4:
5814                     ; 1830   TIM1->CCR4H = (uint8_t)(Compare4 >> 8);
5816  0000 9e            	ld	a,xh
5817  0001 c7526b        	ld	21099,a
5818                     ; 1831   TIM1->CCR4L = (uint8_t)(Compare4);
5820  0004 9f            	ld	a,xl
5821  0005 c7526c        	ld	21100,a
5822                     ; 1832 }
5825  0008 81            	ret
5861                     ; 1844 void TIM1_SetIC1Prescaler(TIM1_ICPSC_TypeDef TIM1_IC1Prescaler)
5861                     ; 1845 {
5862                     .text:	section	.text,new
5863  0000               _TIM1_SetIC1Prescaler:
5865  0000 88            	push	a
5866       00000000      OFST:	set	0
5869                     ; 1847   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC1Prescaler));
5871                     ; 1850   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_ICxPSC)) 
5871                     ; 1851                           | (uint8_t)TIM1_IC1Prescaler);
5873  0001 c65258        	ld	a,21080
5874  0004 a4f3          	and	a,#243
5875  0006 1a01          	or	a,(OFST+1,sp)
5876  0008 c75258        	ld	21080,a
5877                     ; 1852 }
5880  000b 84            	pop	a
5881  000c 81            	ret
5917                     ; 1864 void TIM1_SetIC2Prescaler(TIM1_ICPSC_TypeDef TIM1_IC2Prescaler)
5917                     ; 1865 {
5918                     .text:	section	.text,new
5919  0000               _TIM1_SetIC2Prescaler:
5921  0000 88            	push	a
5922       00000000      OFST:	set	0
5925                     ; 1868   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC2Prescaler));
5927                     ; 1871   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_ICxPSC))
5927                     ; 1872                           | (uint8_t)TIM1_IC2Prescaler);
5929  0001 c65259        	ld	a,21081
5930  0004 a4f3          	and	a,#243
5931  0006 1a01          	or	a,(OFST+1,sp)
5932  0008 c75259        	ld	21081,a
5933                     ; 1873 }
5936  000b 84            	pop	a
5937  000c 81            	ret
5973                     ; 1885 void TIM1_SetIC3Prescaler(TIM1_ICPSC_TypeDef TIM1_IC3Prescaler)
5973                     ; 1886 {
5974                     .text:	section	.text,new
5975  0000               _TIM1_SetIC3Prescaler:
5977  0000 88            	push	a
5978       00000000      OFST:	set	0
5981                     ; 1889   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC3Prescaler));
5983                     ; 1892   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | 
5983                     ; 1893                           (uint8_t)TIM1_IC3Prescaler);
5985  0001 c6525a        	ld	a,21082
5986  0004 a4f3          	and	a,#243
5987  0006 1a01          	or	a,(OFST+1,sp)
5988  0008 c7525a        	ld	21082,a
5989                     ; 1894 }
5992  000b 84            	pop	a
5993  000c 81            	ret
6029                     ; 1906 void TIM1_SetIC4Prescaler(TIM1_ICPSC_TypeDef TIM1_IC4Prescaler)
6029                     ; 1907 {
6030                     .text:	section	.text,new
6031  0000               _TIM1_SetIC4Prescaler:
6033  0000 88            	push	a
6034       00000000      OFST:	set	0
6037                     ; 1910   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC4Prescaler));
6039                     ; 1913   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_ICxPSC)) |
6039                     ; 1914                           (uint8_t)TIM1_IC4Prescaler);
6041  0001 c6525b        	ld	a,21083
6042  0004 a4f3          	and	a,#243
6043  0006 1a01          	or	a,(OFST+1,sp)
6044  0008 c7525b        	ld	21083,a
6045                     ; 1915 }
6048  000b 84            	pop	a
6049  000c 81            	ret
6095                     ; 1922 uint16_t TIM1_GetCapture1(void)
6095                     ; 1923 {
6096                     .text:	section	.text,new
6097  0000               _TIM1_GetCapture1:
6099  0000 5204          	subw	sp,#4
6100       00000004      OFST:	set	4
6103                     ; 1926   uint16_t tmpccr1 = 0;
6105                     ; 1927   uint8_t tmpccr1l=0, tmpccr1h=0;
6109                     ; 1929   tmpccr1h = TIM1->CCR1H;
6111  0002 c65265        	ld	a,21093
6112  0005 6b02          	ld	(OFST-2,sp),a
6114                     ; 1930   tmpccr1l = TIM1->CCR1L;
6116  0007 c65266        	ld	a,21094
6117  000a 6b01          	ld	(OFST-3,sp),a
6119                     ; 1932   tmpccr1 = (uint16_t)(tmpccr1l);
6121  000c 7b01          	ld	a,(OFST-3,sp)
6122  000e 5f            	clrw	x
6123  000f 97            	ld	xl,a
6124  0010 1f03          	ldw	(OFST-1,sp),x
6126                     ; 1933   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
6128  0012 7b02          	ld	a,(OFST-2,sp)
6129  0014 5f            	clrw	x
6130  0015 97            	ld	xl,a
6131  0016 4f            	clr	a
6132  0017 02            	rlwa	x,a
6133  0018 01            	rrwa	x,a
6134  0019 1a04          	or	a,(OFST+0,sp)
6135  001b 01            	rrwa	x,a
6136  001c 1a03          	or	a,(OFST-1,sp)
6137  001e 01            	rrwa	x,a
6138  001f 1f03          	ldw	(OFST-1,sp),x
6140                     ; 1935   return (uint16_t)tmpccr1;
6142  0021 1e03          	ldw	x,(OFST-1,sp)
6145  0023 5b04          	addw	sp,#4
6146  0025 81            	ret
6192                     ; 1943 uint16_t TIM1_GetCapture2(void)
6192                     ; 1944 {
6193                     .text:	section	.text,new
6194  0000               _TIM1_GetCapture2:
6196  0000 5204          	subw	sp,#4
6197       00000004      OFST:	set	4
6200                     ; 1947   uint16_t tmpccr2 = 0;
6202                     ; 1948   uint8_t tmpccr2l=0, tmpccr2h=0;
6206                     ; 1950   tmpccr2h = TIM1->CCR2H;
6208  0002 c65267        	ld	a,21095
6209  0005 6b02          	ld	(OFST-2,sp),a
6211                     ; 1951   tmpccr2l = TIM1->CCR2L;
6213  0007 c65268        	ld	a,21096
6214  000a 6b01          	ld	(OFST-3,sp),a
6216                     ; 1953   tmpccr2 = (uint16_t)(tmpccr2l);
6218  000c 7b01          	ld	a,(OFST-3,sp)
6219  000e 5f            	clrw	x
6220  000f 97            	ld	xl,a
6221  0010 1f03          	ldw	(OFST-1,sp),x
6223                     ; 1954   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
6225  0012 7b02          	ld	a,(OFST-2,sp)
6226  0014 5f            	clrw	x
6227  0015 97            	ld	xl,a
6228  0016 4f            	clr	a
6229  0017 02            	rlwa	x,a
6230  0018 01            	rrwa	x,a
6231  0019 1a04          	or	a,(OFST+0,sp)
6232  001b 01            	rrwa	x,a
6233  001c 1a03          	or	a,(OFST-1,sp)
6234  001e 01            	rrwa	x,a
6235  001f 1f03          	ldw	(OFST-1,sp),x
6237                     ; 1956   return (uint16_t)tmpccr2;
6239  0021 1e03          	ldw	x,(OFST-1,sp)
6242  0023 5b04          	addw	sp,#4
6243  0025 81            	ret
6289                     ; 1964 uint16_t TIM1_GetCapture3(void)
6289                     ; 1965 {
6290                     .text:	section	.text,new
6291  0000               _TIM1_GetCapture3:
6293  0000 5204          	subw	sp,#4
6294       00000004      OFST:	set	4
6297                     ; 1967   uint16_t tmpccr3 = 0;
6299                     ; 1968   uint8_t tmpccr3l=0, tmpccr3h=0;
6303                     ; 1970   tmpccr3h = TIM1->CCR3H;
6305  0002 c65269        	ld	a,21097
6306  0005 6b02          	ld	(OFST-2,sp),a
6308                     ; 1971   tmpccr3l = TIM1->CCR3L;
6310  0007 c6526a        	ld	a,21098
6311  000a 6b01          	ld	(OFST-3,sp),a
6313                     ; 1973   tmpccr3 = (uint16_t)(tmpccr3l);
6315  000c 7b01          	ld	a,(OFST-3,sp)
6316  000e 5f            	clrw	x
6317  000f 97            	ld	xl,a
6318  0010 1f03          	ldw	(OFST-1,sp),x
6320                     ; 1974   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
6322  0012 7b02          	ld	a,(OFST-2,sp)
6323  0014 5f            	clrw	x
6324  0015 97            	ld	xl,a
6325  0016 4f            	clr	a
6326  0017 02            	rlwa	x,a
6327  0018 01            	rrwa	x,a
6328  0019 1a04          	or	a,(OFST+0,sp)
6329  001b 01            	rrwa	x,a
6330  001c 1a03          	or	a,(OFST-1,sp)
6331  001e 01            	rrwa	x,a
6332  001f 1f03          	ldw	(OFST-1,sp),x
6334                     ; 1976   return (uint16_t)tmpccr3;
6336  0021 1e03          	ldw	x,(OFST-1,sp)
6339  0023 5b04          	addw	sp,#4
6340  0025 81            	ret
6386                     ; 1984 uint16_t TIM1_GetCapture4(void)
6386                     ; 1985 {
6387                     .text:	section	.text,new
6388  0000               _TIM1_GetCapture4:
6390  0000 5204          	subw	sp,#4
6391       00000004      OFST:	set	4
6394                     ; 1987   uint16_t tmpccr4 = 0;
6396                     ; 1988   uint8_t tmpccr4l=0, tmpccr4h=0;
6400                     ; 1990   tmpccr4h = TIM1->CCR4H;
6402  0002 c6526b        	ld	a,21099
6403  0005 6b02          	ld	(OFST-2,sp),a
6405                     ; 1991   tmpccr4l = TIM1->CCR4L;
6407  0007 c6526c        	ld	a,21100
6408  000a 6b01          	ld	(OFST-3,sp),a
6410                     ; 1993   tmpccr4 = (uint16_t)(tmpccr4l);
6412  000c 7b01          	ld	a,(OFST-3,sp)
6413  000e 5f            	clrw	x
6414  000f 97            	ld	xl,a
6415  0010 1f03          	ldw	(OFST-1,sp),x
6417                     ; 1994   tmpccr4 |= (uint16_t)((uint16_t)tmpccr4h << 8);
6419  0012 7b02          	ld	a,(OFST-2,sp)
6420  0014 5f            	clrw	x
6421  0015 97            	ld	xl,a
6422  0016 4f            	clr	a
6423  0017 02            	rlwa	x,a
6424  0018 01            	rrwa	x,a
6425  0019 1a04          	or	a,(OFST+0,sp)
6426  001b 01            	rrwa	x,a
6427  001c 1a03          	or	a,(OFST-1,sp)
6428  001e 01            	rrwa	x,a
6429  001f 1f03          	ldw	(OFST-1,sp),x
6431                     ; 1996   return (uint16_t)tmpccr4;
6433  0021 1e03          	ldw	x,(OFST-1,sp)
6436  0023 5b04          	addw	sp,#4
6437  0025 81            	ret
6469                     ; 2004 uint16_t TIM1_GetCounter(void)
6469                     ; 2005 {
6470                     .text:	section	.text,new
6471  0000               _TIM1_GetCounter:
6473  0000 89            	pushw	x
6474       00000002      OFST:	set	2
6477                     ; 2006   uint16_t tmpcntr = 0;
6479                     ; 2008   tmpcntr = ((uint16_t)TIM1->CNTRH << 8);
6481  0001 c6525e        	ld	a,21086
6482  0004 5f            	clrw	x
6483  0005 97            	ld	xl,a
6484  0006 4f            	clr	a
6485  0007 02            	rlwa	x,a
6486  0008 1f01          	ldw	(OFST-1,sp),x
6488                     ; 2011   return (uint16_t)(tmpcntr | (uint16_t)(TIM1->CNTRL));
6490  000a c6525f        	ld	a,21087
6491  000d 5f            	clrw	x
6492  000e 97            	ld	xl,a
6493  000f 01            	rrwa	x,a
6494  0010 1a02          	or	a,(OFST+0,sp)
6495  0012 01            	rrwa	x,a
6496  0013 1a01          	or	a,(OFST-1,sp)
6497  0015 01            	rrwa	x,a
6500  0016 5b02          	addw	sp,#2
6501  0018 81            	ret
6533                     ; 2019 uint16_t TIM1_GetPrescaler(void)
6533                     ; 2020 {
6534                     .text:	section	.text,new
6535  0000               _TIM1_GetPrescaler:
6537  0000 89            	pushw	x
6538       00000002      OFST:	set	2
6541                     ; 2021   uint16_t temp = 0;
6543                     ; 2023   temp = ((uint16_t)TIM1->PSCRH << 8);
6545  0001 c65260        	ld	a,21088
6546  0004 5f            	clrw	x
6547  0005 97            	ld	xl,a
6548  0006 4f            	clr	a
6549  0007 02            	rlwa	x,a
6550  0008 1f01          	ldw	(OFST-1,sp),x
6552                     ; 2026   return (uint16_t)( temp | (uint16_t)(TIM1->PSCRL));
6554  000a c65261        	ld	a,21089
6555  000d 5f            	clrw	x
6556  000e 97            	ld	xl,a
6557  000f 01            	rrwa	x,a
6558  0010 1a02          	or	a,(OFST+0,sp)
6559  0012 01            	rrwa	x,a
6560  0013 1a01          	or	a,(OFST-1,sp)
6561  0015 01            	rrwa	x,a
6564  0016 5b02          	addw	sp,#2
6565  0018 81            	ret
6735                     ; 2047 FlagStatus TIM1_GetFlagStatus(TIM1_FLAG_TypeDef TIM1_FLAG)
6735                     ; 2048 {
6736                     .text:	section	.text,new
6737  0000               _TIM1_GetFlagStatus:
6739  0000 89            	pushw	x
6740  0001 89            	pushw	x
6741       00000002      OFST:	set	2
6744                     ; 2049   FlagStatus bitstatus = RESET;
6746                     ; 2050   uint8_t tim1_flag_l = 0, tim1_flag_h = 0;
6750                     ; 2053   assert_param(IS_TIM1_GET_FLAG_OK(TIM1_FLAG));
6752                     ; 2055   tim1_flag_l = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_FLAG);
6754  0002 9f            	ld	a,xl
6755  0003 c45255        	and	a,21077
6756  0006 6b01          	ld	(OFST-1,sp),a
6758                     ; 2056   tim1_flag_h = (uint8_t)((uint16_t)TIM1_FLAG >> 8);
6760  0008 7b03          	ld	a,(OFST+1,sp)
6761  000a 6b02          	ld	(OFST+0,sp),a
6763                     ; 2058   if ((tim1_flag_l | (uint8_t)(TIM1->SR2 & tim1_flag_h)) != 0)
6765  000c c65256        	ld	a,21078
6766  000f 1402          	and	a,(OFST+0,sp)
6767  0011 1a01          	or	a,(OFST-1,sp)
6768  0013 2706          	jreq	L7433
6769                     ; 2060     bitstatus = SET;
6771  0015 a601          	ld	a,#1
6772  0017 6b02          	ld	(OFST+0,sp),a
6775  0019 2002          	jra	L1533
6776  001b               L7433:
6777                     ; 2064     bitstatus = RESET;
6779  001b 0f02          	clr	(OFST+0,sp)
6781  001d               L1533:
6782                     ; 2066   return (FlagStatus)(bitstatus);
6784  001d 7b02          	ld	a,(OFST+0,sp)
6787  001f 5b04          	addw	sp,#4
6788  0021 81            	ret
6823                     ; 2087 void TIM1_ClearFlag(TIM1_FLAG_TypeDef TIM1_FLAG)
6823                     ; 2088 {
6824                     .text:	section	.text,new
6825  0000               _TIM1_ClearFlag:
6827  0000 89            	pushw	x
6828       00000000      OFST:	set	0
6831                     ; 2090   assert_param(IS_TIM1_CLEAR_FLAG_OK(TIM1_FLAG));
6833                     ; 2093   TIM1->SR1 = (uint8_t)(~(uint8_t)(TIM1_FLAG));
6835  0001 9f            	ld	a,xl
6836  0002 43            	cpl	a
6837  0003 c75255        	ld	21077,a
6838                     ; 2094   TIM1->SR2 = (uint8_t)((uint8_t)(~((uint8_t)((uint16_t)TIM1_FLAG >> 8))) & 
6838                     ; 2095                         (uint8_t)0x1E);
6840  0006 7b01          	ld	a,(OFST+1,sp)
6841  0008 43            	cpl	a
6842  0009 a41e          	and	a,#30
6843  000b c75256        	ld	21078,a
6844                     ; 2096 }
6847  000e 85            	popw	x
6848  000f 81            	ret
6908                     ; 2112 ITStatus TIM1_GetITStatus(TIM1_IT_TypeDef TIM1_IT)
6908                     ; 2113 {
6909                     .text:	section	.text,new
6910  0000               _TIM1_GetITStatus:
6912  0000 88            	push	a
6913  0001 89            	pushw	x
6914       00000002      OFST:	set	2
6917                     ; 2114   ITStatus bitstatus = RESET;
6919                     ; 2115   uint8_t TIM1_itStatus = 0, TIM1_itEnable = 0;
6923                     ; 2118   assert_param(IS_TIM1_GET_IT_OK(TIM1_IT));
6925                     ; 2120   TIM1_itStatus = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_IT);
6927  0002 c45255        	and	a,21077
6928  0005 6b01          	ld	(OFST-1,sp),a
6930                     ; 2122   TIM1_itEnable = (uint8_t)(TIM1->IER & (uint8_t)TIM1_IT);
6932  0007 c65254        	ld	a,21076
6933  000a 1403          	and	a,(OFST+1,sp)
6934  000c 6b02          	ld	(OFST+0,sp),a
6936                     ; 2124   if ((TIM1_itStatus != (uint8_t)RESET ) && (TIM1_itEnable != (uint8_t)RESET ))
6938  000e 0d01          	tnz	(OFST-1,sp)
6939  0010 270a          	jreq	L7143
6941  0012 0d02          	tnz	(OFST+0,sp)
6942  0014 2706          	jreq	L7143
6943                     ; 2126     bitstatus = SET;
6945  0016 a601          	ld	a,#1
6946  0018 6b02          	ld	(OFST+0,sp),a
6949  001a 2002          	jra	L1243
6950  001c               L7143:
6951                     ; 2130     bitstatus = RESET;
6953  001c 0f02          	clr	(OFST+0,sp)
6955  001e               L1243:
6956                     ; 2132   return (ITStatus)(bitstatus);
6958  001e 7b02          	ld	a,(OFST+0,sp)
6961  0020 5b03          	addw	sp,#3
6962  0022 81            	ret
6998                     ; 2149 void TIM1_ClearITPendingBit(TIM1_IT_TypeDef TIM1_IT)
6998                     ; 2150 {
6999                     .text:	section	.text,new
7000  0000               _TIM1_ClearITPendingBit:
7004                     ; 2152   assert_param(IS_TIM1_IT_OK(TIM1_IT));
7006                     ; 2155   TIM1->SR1 = (uint8_t)(~(uint8_t)TIM1_IT);
7008  0000 43            	cpl	a
7009  0001 c75255        	ld	21077,a
7010                     ; 2156 }
7013  0004 81            	ret
7059                     ; 2174 static void TI1_Config(uint8_t TIM1_ICPolarity,
7059                     ; 2175                        uint8_t TIM1_ICSelection,
7059                     ; 2176                        uint8_t TIM1_ICFilter)
7059                     ; 2177 {
7060                     .text:	section	.text,new
7061  0000               L3_TI1_Config:
7063  0000 89            	pushw	x
7064  0001 88            	push	a
7065       00000001      OFST:	set	1
7068                     ; 2179   TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
7070  0002 7211525c      	bres	21084,#0
7071                     ; 2182   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) | 
7071                     ; 2183                           (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7073  0006 7b06          	ld	a,(OFST+5,sp)
7074  0008 97            	ld	xl,a
7075  0009 a610          	ld	a,#16
7076  000b 42            	mul	x,a
7077  000c 9f            	ld	a,xl
7078  000d 1a03          	or	a,(OFST+2,sp)
7079  000f 6b01          	ld	(OFST+0,sp),a
7081  0011 c65258        	ld	a,21080
7082  0014 a40c          	and	a,#12
7083  0016 1a01          	or	a,(OFST+0,sp)
7084  0018 c75258        	ld	21080,a
7085                     ; 2186   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7087  001b 0d02          	tnz	(OFST+1,sp)
7088  001d 2706          	jreq	L1643
7089                     ; 2188     TIM1->CCER1 |= TIM1_CCER1_CC1P;
7091  001f 7212525c      	bset	21084,#1
7093  0023 2004          	jra	L3643
7094  0025               L1643:
7095                     ; 2192     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
7097  0025 7213525c      	bres	21084,#1
7098  0029               L3643:
7099                     ; 2196   TIM1->CCER1 |=  TIM1_CCER1_CC1E;
7101  0029 7210525c      	bset	21084,#0
7102                     ; 2197 }
7105  002d 5b03          	addw	sp,#3
7106  002f 81            	ret
7152                     ; 2215 static void TI2_Config(uint8_t TIM1_ICPolarity,
7152                     ; 2216                        uint8_t TIM1_ICSelection,
7152                     ; 2217                        uint8_t TIM1_ICFilter)
7152                     ; 2218 {
7153                     .text:	section	.text,new
7154  0000               L5_TI2_Config:
7156  0000 89            	pushw	x
7157  0001 88            	push	a
7158       00000001      OFST:	set	1
7161                     ; 2220   TIM1->CCER1 &=  (uint8_t)(~TIM1_CCER1_CC2E);
7163  0002 7219525c      	bres	21084,#4
7164                     ; 2223   TIM1->CCMR2  = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) 
7164                     ; 2224                            | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7166  0006 7b06          	ld	a,(OFST+5,sp)
7167  0008 97            	ld	xl,a
7168  0009 a610          	ld	a,#16
7169  000b 42            	mul	x,a
7170  000c 9f            	ld	a,xl
7171  000d 1a03          	or	a,(OFST+2,sp)
7172  000f 6b01          	ld	(OFST+0,sp),a
7174  0011 c65259        	ld	a,21081
7175  0014 a40c          	and	a,#12
7176  0016 1a01          	or	a,(OFST+0,sp)
7177  0018 c75259        	ld	21081,a
7178                     ; 2226   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7180  001b 0d02          	tnz	(OFST+1,sp)
7181  001d 2706          	jreq	L5053
7182                     ; 2228     TIM1->CCER1 |= TIM1_CCER1_CC2P;
7184  001f 721a525c      	bset	21084,#5
7186  0023 2004          	jra	L7053
7187  0025               L5053:
7188                     ; 2232     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
7190  0025 721b525c      	bres	21084,#5
7191  0029               L7053:
7192                     ; 2235   TIM1->CCER1 |=  TIM1_CCER1_CC2E;
7194  0029 7218525c      	bset	21084,#4
7195                     ; 2236 }
7198  002d 5b03          	addw	sp,#3
7199  002f 81            	ret
7245                     ; 2254 static void TI3_Config(uint8_t TIM1_ICPolarity,
7245                     ; 2255                        uint8_t TIM1_ICSelection,
7245                     ; 2256                        uint8_t TIM1_ICFilter)
7245                     ; 2257 {
7246                     .text:	section	.text,new
7247  0000               L7_TI3_Config:
7249  0000 89            	pushw	x
7250  0001 88            	push	a
7251       00000001      OFST:	set	1
7254                     ; 2259   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC3E);
7256  0002 7211525d      	bres	21085,#0
7257                     ; 2262   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF))) 
7257                     ; 2263                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7259  0006 7b06          	ld	a,(OFST+5,sp)
7260  0008 97            	ld	xl,a
7261  0009 a610          	ld	a,#16
7262  000b 42            	mul	x,a
7263  000c 9f            	ld	a,xl
7264  000d 1a03          	or	a,(OFST+2,sp)
7265  000f 6b01          	ld	(OFST+0,sp),a
7267  0011 c6525a        	ld	a,21082
7268  0014 a40c          	and	a,#12
7269  0016 1a01          	or	a,(OFST+0,sp)
7270  0018 c7525a        	ld	21082,a
7271                     ; 2266   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7273  001b 0d02          	tnz	(OFST+1,sp)
7274  001d 2706          	jreq	L1353
7275                     ; 2268     TIM1->CCER2 |= TIM1_CCER2_CC3P;
7277  001f 7212525d      	bset	21085,#1
7279  0023 2004          	jra	L3353
7280  0025               L1353:
7281                     ; 2272     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
7283  0025 7213525d      	bres	21085,#1
7284  0029               L3353:
7285                     ; 2275   TIM1->CCER2 |=  TIM1_CCER2_CC3E;
7287  0029 7210525d      	bset	21085,#0
7288                     ; 2276 }
7291  002d 5b03          	addw	sp,#3
7292  002f 81            	ret
7338                     ; 2294 static void TI4_Config(uint8_t TIM1_ICPolarity,
7338                     ; 2295                        uint8_t TIM1_ICSelection,
7338                     ; 2296                        uint8_t TIM1_ICFilter)
7338                     ; 2297 {
7339                     .text:	section	.text,new
7340  0000               L11_TI4_Config:
7342  0000 89            	pushw	x
7343  0001 88            	push	a
7344       00000001      OFST:	set	1
7347                     ; 2299   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC4E);
7349  0002 7219525d      	bres	21085,#4
7350                     ; 2302   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF )))
7350                     ; 2303                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7352  0006 7b06          	ld	a,(OFST+5,sp)
7353  0008 97            	ld	xl,a
7354  0009 a610          	ld	a,#16
7355  000b 42            	mul	x,a
7356  000c 9f            	ld	a,xl
7357  000d 1a03          	or	a,(OFST+2,sp)
7358  000f 6b01          	ld	(OFST+0,sp),a
7360  0011 c6525b        	ld	a,21083
7361  0014 a40c          	and	a,#12
7362  0016 1a01          	or	a,(OFST+0,sp)
7363  0018 c7525b        	ld	21083,a
7364                     ; 2306   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7366  001b 0d02          	tnz	(OFST+1,sp)
7367  001d 2706          	jreq	L5553
7368                     ; 2308     TIM1->CCER2 |= TIM1_CCER2_CC4P;
7370  001f 721a525d      	bset	21085,#5
7372  0023 2004          	jra	L7553
7373  0025               L5553:
7374                     ; 2312     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
7376  0025 721b525d      	bres	21085,#5
7377  0029               L7553:
7378                     ; 2316   TIM1->CCER2 |=  TIM1_CCER2_CC4E;
7380  0029 7218525d      	bset	21085,#4
7381                     ; 2317 }
7384  002d 5b03          	addw	sp,#3
7385  002f 81            	ret
7398                     	xdef	_TIM1_ClearITPendingBit
7399                     	xdef	_TIM1_GetITStatus
7400                     	xdef	_TIM1_ClearFlag
7401                     	xdef	_TIM1_GetFlagStatus
7402                     	xdef	_TIM1_GetPrescaler
7403                     	xdef	_TIM1_GetCounter
7404                     	xdef	_TIM1_GetCapture4
7405                     	xdef	_TIM1_GetCapture3
7406                     	xdef	_TIM1_GetCapture2
7407                     	xdef	_TIM1_GetCapture1
7408                     	xdef	_TIM1_SetIC4Prescaler
7409                     	xdef	_TIM1_SetIC3Prescaler
7410                     	xdef	_TIM1_SetIC2Prescaler
7411                     	xdef	_TIM1_SetIC1Prescaler
7412                     	xdef	_TIM1_SetCompare4
7413                     	xdef	_TIM1_SetCompare3
7414                     	xdef	_TIM1_SetCompare2
7415                     	xdef	_TIM1_SetCompare1
7416                     	xdef	_TIM1_SetAutoreload
7417                     	xdef	_TIM1_SetCounter
7418                     	xdef	_TIM1_SelectOCxM
7419                     	xdef	_TIM1_CCxNCmd
7420                     	xdef	_TIM1_CCxCmd
7421                     	xdef	_TIM1_OC4PolarityConfig
7422                     	xdef	_TIM1_OC3NPolarityConfig
7423                     	xdef	_TIM1_OC3PolarityConfig
7424                     	xdef	_TIM1_OC2NPolarityConfig
7425                     	xdef	_TIM1_OC2PolarityConfig
7426                     	xdef	_TIM1_OC1NPolarityConfig
7427                     	xdef	_TIM1_OC1PolarityConfig
7428                     	xdef	_TIM1_GenerateEvent
7429                     	xdef	_TIM1_OC4FastConfig
7430                     	xdef	_TIM1_OC3FastConfig
7431                     	xdef	_TIM1_OC2FastConfig
7432                     	xdef	_TIM1_OC1FastConfig
7433                     	xdef	_TIM1_OC4PreloadConfig
7434                     	xdef	_TIM1_OC3PreloadConfig
7435                     	xdef	_TIM1_OC2PreloadConfig
7436                     	xdef	_TIM1_OC1PreloadConfig
7437                     	xdef	_TIM1_CCPreloadControl
7438                     	xdef	_TIM1_SelectCOM
7439                     	xdef	_TIM1_ARRPreloadConfig
7440                     	xdef	_TIM1_ForcedOC4Config
7441                     	xdef	_TIM1_ForcedOC3Config
7442                     	xdef	_TIM1_ForcedOC2Config
7443                     	xdef	_TIM1_ForcedOC1Config
7444                     	xdef	_TIM1_CounterModeConfig
7445                     	xdef	_TIM1_PrescalerConfig
7446                     	xdef	_TIM1_EncoderInterfaceConfig
7447                     	xdef	_TIM1_SelectMasterSlaveMode
7448                     	xdef	_TIM1_SelectSlaveMode
7449                     	xdef	_TIM1_SelectOutputTrigger
7450                     	xdef	_TIM1_SelectOnePulseMode
7451                     	xdef	_TIM1_SelectHallSensor
7452                     	xdef	_TIM1_UpdateRequestConfig
7453                     	xdef	_TIM1_UpdateDisableConfig
7454                     	xdef	_TIM1_SelectInputTrigger
7455                     	xdef	_TIM1_TIxExternalClockConfig
7456                     	xdef	_TIM1_ETRConfig
7457                     	xdef	_TIM1_ETRClockMode2Config
7458                     	xdef	_TIM1_ETRClockMode1Config
7459                     	xdef	_TIM1_InternalClockConfig
7460                     	xdef	_TIM1_ITConfig
7461                     	xdef	_TIM1_CtrlPWMOutputs
7462                     	xdef	_TIM1_Cmd
7463                     	xdef	_TIM1_PWMIConfig
7464                     	xdef	_TIM1_ICInit
7465                     	xdef	_TIM1_BDTRConfig
7466                     	xdef	_TIM1_OC4Init
7467                     	xdef	_TIM1_OC3Init
7468                     	xdef	_TIM1_OC2Init
7469                     	xdef	_TIM1_OC1Init
7470                     	xdef	_TIM1_TimeBaseInit
7471                     	xdef	_TIM1_DeInit
7490                     	end
