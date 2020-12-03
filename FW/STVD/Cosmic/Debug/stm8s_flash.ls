   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  75                     ; 87 void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
  75                     ; 88 {
  77                     .text:	section	.text,new
  78  0000               _FLASH_Unlock:
  82                     ; 90   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
  84                     ; 93   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
  86  0000 a1fd          	cp	a,#253
  87  0002 260a          	jrne	L73
  88                     ; 95     FLASH->PUKR = FLASH_RASS_KEY1;
  90  0004 35565062      	mov	20578,#86
  91                     ; 96     FLASH->PUKR = FLASH_RASS_KEY2;
  93  0008 35ae5062      	mov	20578,#174
  95  000c 2008          	jra	L14
  96  000e               L73:
  97                     ; 101     FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
  99  000e 35ae5064      	mov	20580,#174
 100                     ; 102     FLASH->DUKR = FLASH_RASS_KEY1;
 102  0012 35565064      	mov	20580,#86
 103  0016               L14:
 104                     ; 104 }
 107  0016 81            	ret
 142                     ; 112 void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
 142                     ; 113 {
 143                     .text:	section	.text,new
 144  0000               _FLASH_Lock:
 148                     ; 115   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
 150                     ; 118   FLASH->IAPSR &= (uint8_t)FLASH_MemType;
 152  0000 c4505f        	and	a,20575
 153  0003 c7505f        	ld	20575,a
 154                     ; 119 }
 157  0006 81            	ret
 180                     ; 126 void FLASH_DeInit(void)
 180                     ; 127 {
 181                     .text:	section	.text,new
 182  0000               _FLASH_DeInit:
 186                     ; 128   FLASH->CR1 = FLASH_CR1_RESET_VALUE;
 188  0000 725f505a      	clr	20570
 189                     ; 129   FLASH->CR2 = FLASH_CR2_RESET_VALUE;
 191  0004 725f505b      	clr	20571
 192                     ; 130   FLASH->NCR2 = FLASH_NCR2_RESET_VALUE;
 194  0008 35ff505c      	mov	20572,#255
 195                     ; 131   FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_DUL);
 197  000c 7217505f      	bres	20575,#3
 198                     ; 132   FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_PUL);
 200  0010 7213505f      	bres	20575,#1
 201                     ; 133   (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
 203  0014 c6505f        	ld	a,20575
 204                     ; 134 }
 207  0017 81            	ret
 262                     ; 142 void FLASH_ITConfig(FunctionalState NewState)
 262                     ; 143 {
 263                     .text:	section	.text,new
 264  0000               _FLASH_ITConfig:
 268                     ; 145   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 270                     ; 147   if(NewState != DISABLE)
 272  0000 4d            	tnz	a
 273  0001 2706          	jreq	L711
 274                     ; 149     FLASH->CR1 |= FLASH_CR1_IE; /* Enables the interrupt sources */
 276  0003 7212505a      	bset	20570,#1
 278  0007 2004          	jra	L121
 279  0009               L711:
 280                     ; 153     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE); /* Disables the interrupt sources */
 282  0009 7213505a      	bres	20570,#1
 283  000d               L121:
 284                     ; 155 }
 287  000d 81            	ret
 319                     ; 164 void FLASH_EraseByte(uint32_t Address)
 319                     ; 165 {
 320                     .text:	section	.text,new
 321  0000               _FLASH_EraseByte:
 323       00000000      OFST:	set	0
 326                     ; 167   assert_param(IS_FLASH_ADDRESS_OK(Address));
 328                     ; 170   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = FLASH_CLEAR_BYTE; 
 330  0000 1e05          	ldw	x,(OFST+5,sp)
 331  0002 7f            	clr	(x)
 332                     ; 171 }
 335  0003 81            	ret
 374                     ; 181 void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
 374                     ; 182 {
 375                     .text:	section	.text,new
 376  0000               _FLASH_ProgramByte:
 378       00000000      OFST:	set	0
 381                     ; 184   assert_param(IS_FLASH_ADDRESS_OK(Address));
 383                     ; 185   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = Data;
 385  0000 7b07          	ld	a,(OFST+7,sp)
 386  0002 1e05          	ldw	x,(OFST+5,sp)
 387  0004 f7            	ld	(x),a
 388                     ; 186 }
 391  0005 81            	ret
 423                     ; 195 uint8_t FLASH_ReadByte(uint32_t Address)
 423                     ; 196 {
 424                     .text:	section	.text,new
 425  0000               _FLASH_ReadByte:
 427       00000000      OFST:	set	0
 430                     ; 198   assert_param(IS_FLASH_ADDRESS_OK(Address));
 432                     ; 201   return(*(PointerAttr uint8_t *) (MemoryAddressCast)Address); 
 434  0000 1e05          	ldw	x,(OFST+5,sp)
 435  0002 f6            	ld	a,(x)
 438  0003 81            	ret
 477                     ; 212 void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
 477                     ; 213 {
 478                     .text:	section	.text,new
 479  0000               _FLASH_ProgramWord:
 481       00000000      OFST:	set	0
 484                     ; 215   assert_param(IS_FLASH_ADDRESS_OK(Address));
 486                     ; 218   FLASH->CR2 |= FLASH_CR2_WPRG;
 488  0000 721c505b      	bset	20571,#6
 489                     ; 219   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NWPRG);
 491  0004 721d505c      	bres	20572,#6
 492                     ; 222   *((PointerAttr uint8_t*)(MemoryAddressCast)Address)       = *((uint8_t*)(&Data));
 494  0008 7b07          	ld	a,(OFST+7,sp)
 495  000a 1e05          	ldw	x,(OFST+5,sp)
 496  000c f7            	ld	(x),a
 497                     ; 224   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 1) = *((uint8_t*)(&Data)+1); 
 499  000d 7b08          	ld	a,(OFST+8,sp)
 500  000f 1e05          	ldw	x,(OFST+5,sp)
 501  0011 e701          	ld	(1,x),a
 502                     ; 226   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 2) = *((uint8_t*)(&Data)+2); 
 504  0013 7b09          	ld	a,(OFST+9,sp)
 505  0015 1e05          	ldw	x,(OFST+5,sp)
 506  0017 e702          	ld	(2,x),a
 507                     ; 228   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 3) = *((uint8_t*)(&Data)+3); 
 509  0019 7b0a          	ld	a,(OFST+10,sp)
 510  001b 1e05          	ldw	x,(OFST+5,sp)
 511  001d e703          	ld	(3,x),a
 512                     ; 229 }
 515  001f 81            	ret
 556                     ; 237 void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
 556                     ; 238 {
 557                     .text:	section	.text,new
 558  0000               _FLASH_ProgramOptionByte:
 560  0000 89            	pushw	x
 561       00000000      OFST:	set	0
 564                     ; 240   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 566                     ; 243   FLASH->CR2 |= FLASH_CR2_OPT;
 568  0001 721e505b      	bset	20571,#7
 569                     ; 244   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
 571  0005 721f505c      	bres	20572,#7
 572                     ; 247   if(Address == 0x4800)
 574  0009 a34800        	cpw	x,#18432
 575  000c 2607          	jrne	L522
 576                     ; 250     *((NEAR uint8_t*)Address) = Data;
 578  000e 7b05          	ld	a,(OFST+5,sp)
 579  0010 1e01          	ldw	x,(OFST+1,sp)
 580  0012 f7            	ld	(x),a
 582  0013 200c          	jra	L722
 583  0015               L522:
 584                     ; 255     *((NEAR uint8_t*)Address) = Data;
 586  0015 7b05          	ld	a,(OFST+5,sp)
 587  0017 1e01          	ldw	x,(OFST+1,sp)
 588  0019 f7            	ld	(x),a
 589                     ; 256     *((NEAR uint8_t*)((uint16_t)(Address + 1))) = (uint8_t)(~Data);
 591  001a 7b05          	ld	a,(OFST+5,sp)
 592  001c 43            	cpl	a
 593  001d 1e01          	ldw	x,(OFST+1,sp)
 594  001f e701          	ld	(1,x),a
 595  0021               L722:
 596                     ; 258   FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
 598  0021 a6fd          	ld	a,#253
 599  0023 cd0000        	call	_FLASH_WaitForLastOperation
 601                     ; 261   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 603  0026 721f505b      	bres	20571,#7
 604                     ; 262   FLASH->NCR2 |= FLASH_NCR2_NOPT;
 606  002a 721e505c      	bset	20572,#7
 607                     ; 263 }
 610  002e 85            	popw	x
 611  002f 81            	ret
 645                     ; 270 void FLASH_EraseOptionByte(uint16_t Address)
 645                     ; 271 {
 646                     .text:	section	.text,new
 647  0000               _FLASH_EraseOptionByte:
 649  0000 89            	pushw	x
 650       00000000      OFST:	set	0
 653                     ; 273   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 655                     ; 276   FLASH->CR2 |= FLASH_CR2_OPT;
 657  0001 721e505b      	bset	20571,#7
 658                     ; 277   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
 660  0005 721f505c      	bres	20572,#7
 661                     ; 280   if(Address == 0x4800)
 663  0009 a34800        	cpw	x,#18432
 664  000c 2603          	jrne	L542
 665                     ; 283     *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
 667  000e 7f            	clr	(x)
 669  000f 2009          	jra	L742
 670  0011               L542:
 671                     ; 288     *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
 673  0011 1e01          	ldw	x,(OFST+1,sp)
 674  0013 7f            	clr	(x)
 675                     ; 289     *((NEAR uint8_t*)((uint16_t)(Address + (uint16_t)1 ))) = FLASH_SET_BYTE;
 677  0014 1e01          	ldw	x,(OFST+1,sp)
 678  0016 a6ff          	ld	a,#255
 679  0018 e701          	ld	(1,x),a
 680  001a               L742:
 681                     ; 291   FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
 683  001a a6fd          	ld	a,#253
 684  001c cd0000        	call	_FLASH_WaitForLastOperation
 686                     ; 294   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 688  001f 721f505b      	bres	20571,#7
 689                     ; 295   FLASH->NCR2 |= FLASH_NCR2_NOPT;
 691  0023 721e505c      	bset	20572,#7
 692                     ; 296 }
 695  0027 85            	popw	x
 696  0028 81            	ret
 751                     ; 303 uint16_t FLASH_ReadOptionByte(uint16_t Address)
 751                     ; 304 {
 752                     .text:	section	.text,new
 753  0000               _FLASH_ReadOptionByte:
 755  0000 5204          	subw	sp,#4
 756       00000004      OFST:	set	4
 759                     ; 305   uint8_t value_optbyte, value_optbyte_complement = 0;
 761                     ; 306   uint16_t res_value = 0;
 763                     ; 309   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 765                     ; 311   value_optbyte = *((NEAR uint8_t*)Address); /* Read option byte */
 767  0002 f6            	ld	a,(x)
 768  0003 6b01          	ld	(OFST-3,sp),a
 770                     ; 312   value_optbyte_complement = *(((NEAR uint8_t*)Address) + 1); /* Read option byte complement */
 772  0005 e601          	ld	a,(1,x)
 773  0007 6b02          	ld	(OFST-2,sp),a
 775                     ; 315   if(Address == 0x4800)	 
 777  0009 a34800        	cpw	x,#18432
 778  000c 2608          	jrne	L372
 779                     ; 317     res_value =	 value_optbyte;
 781  000e 7b01          	ld	a,(OFST-3,sp)
 782  0010 5f            	clrw	x
 783  0011 97            	ld	xl,a
 784  0012 1f03          	ldw	(OFST-1,sp),x
 787  0014 2023          	jra	L572
 788  0016               L372:
 789                     ; 321     if(value_optbyte == (uint8_t)(~value_optbyte_complement))
 791  0016 7b02          	ld	a,(OFST-2,sp)
 792  0018 43            	cpl	a
 793  0019 1101          	cp	a,(OFST-3,sp)
 794  001b 2617          	jrne	L772
 795                     ; 323       res_value = (uint16_t)((uint16_t)value_optbyte << 8);
 797  001d 7b01          	ld	a,(OFST-3,sp)
 798  001f 5f            	clrw	x
 799  0020 97            	ld	xl,a
 800  0021 4f            	clr	a
 801  0022 02            	rlwa	x,a
 802  0023 1f03          	ldw	(OFST-1,sp),x
 804                     ; 324       res_value = res_value | (uint16_t)value_optbyte_complement;
 806  0025 7b02          	ld	a,(OFST-2,sp)
 807  0027 5f            	clrw	x
 808  0028 97            	ld	xl,a
 809  0029 01            	rrwa	x,a
 810  002a 1a04          	or	a,(OFST+0,sp)
 811  002c 01            	rrwa	x,a
 812  002d 1a03          	or	a,(OFST-1,sp)
 813  002f 01            	rrwa	x,a
 814  0030 1f03          	ldw	(OFST-1,sp),x
 817  0032 2005          	jra	L572
 818  0034               L772:
 819                     ; 328       res_value = FLASH_OPTIONBYTE_ERROR;
 821  0034 ae5555        	ldw	x,#21845
 822  0037 1f03          	ldw	(OFST-1,sp),x
 824  0039               L572:
 825                     ; 331   return(res_value);
 827  0039 1e03          	ldw	x,(OFST-1,sp)
 830  003b 5b04          	addw	sp,#4
 831  003d 81            	ret
 905                     ; 340 void FLASH_SetLowPowerMode(FLASH_LPMode_TypeDef FLASH_LPMode)
 905                     ; 341 {
 906                     .text:	section	.text,new
 907  0000               _FLASH_SetLowPowerMode:
 909  0000 88            	push	a
 910       00000000      OFST:	set	0
 913                     ; 343   assert_param(IS_FLASH_LOW_POWER_MODE_OK(FLASH_LPMode));
 915                     ; 346   FLASH->CR1 &= (uint8_t)(~(FLASH_CR1_HALT | FLASH_CR1_AHALT)); 
 917  0001 c6505a        	ld	a,20570
 918  0004 a4f3          	and	a,#243
 919  0006 c7505a        	ld	20570,a
 920                     ; 349   FLASH->CR1 |= (uint8_t)FLASH_LPMode; 
 922  0009 c6505a        	ld	a,20570
 923  000c 1a01          	or	a,(OFST+1,sp)
 924  000e c7505a        	ld	20570,a
 925                     ; 350 }
 928  0011 84            	pop	a
 929  0012 81            	ret
 987                     ; 358 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
 987                     ; 359 {
 988                     .text:	section	.text,new
 989  0000               _FLASH_SetProgrammingTime:
 993                     ; 361   assert_param(IS_FLASH_PROGRAM_TIME_OK(FLASH_ProgTime));
 995                     ; 363   FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
 997  0000 7211505a      	bres	20570,#0
 998                     ; 364   FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
1000  0004 ca505a        	or	a,20570
1001  0007 c7505a        	ld	20570,a
1002                     ; 365 }
1005  000a 81            	ret
1030                     ; 372 FLASH_LPMode_TypeDef FLASH_GetLowPowerMode(void)
1030                     ; 373 {
1031                     .text:	section	.text,new
1032  0000               _FLASH_GetLowPowerMode:
1036                     ; 374   return((FLASH_LPMode_TypeDef)(FLASH->CR1 & (uint8_t)(FLASH_CR1_HALT | FLASH_CR1_AHALT)));
1038  0000 c6505a        	ld	a,20570
1039  0003 a40c          	and	a,#12
1042  0005 81            	ret
1067                     ; 382 FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
1067                     ; 383 {
1068                     .text:	section	.text,new
1069  0000               _FLASH_GetProgrammingTime:
1073                     ; 384   return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
1075  0000 c6505a        	ld	a,20570
1076  0003 a401          	and	a,#1
1079  0005 81            	ret
1111                     ; 392 uint32_t FLASH_GetBootSize(void)
1111                     ; 393 {
1112                     .text:	section	.text,new
1113  0000               _FLASH_GetBootSize:
1115  0000 5204          	subw	sp,#4
1116       00000004      OFST:	set	4
1119                     ; 394   uint32_t temp = 0;
1121                     ; 397   temp = (uint32_t)((uint32_t)FLASH->FPR * (uint32_t)512);
1123  0002 c6505d        	ld	a,20573
1124  0005 5f            	clrw	x
1125  0006 97            	ld	xl,a
1126  0007 90ae0200      	ldw	y,#512
1127  000b cd0000        	call	c_umul
1129  000e 96            	ldw	x,sp
1130  000f 1c0001        	addw	x,#OFST-3
1131  0012 cd0000        	call	c_rtol
1134                     ; 400   if(FLASH->FPR == 0xFF)
1136  0015 c6505d        	ld	a,20573
1137  0018 a1ff          	cp	a,#255
1138  001a 2611          	jrne	L714
1139                     ; 402     temp += 512;
1141  001c ae0200        	ldw	x,#512
1142  001f bf02          	ldw	c_lreg+2,x
1143  0021 ae0000        	ldw	x,#0
1144  0024 bf00          	ldw	c_lreg,x
1145  0026 96            	ldw	x,sp
1146  0027 1c0001        	addw	x,#OFST-3
1147  002a cd0000        	call	c_lgadd
1150  002d               L714:
1151                     ; 406   return(temp);
1153  002d 96            	ldw	x,sp
1154  002e 1c0001        	addw	x,#OFST-3
1155  0031 cd0000        	call	c_ltor
1159  0034 5b04          	addw	sp,#4
1160  0036 81            	ret
1269                     ; 417 FlagStatus FLASH_GetFlagStatus(FLASH_Flag_TypeDef FLASH_FLAG)
1269                     ; 418 {
1270                     .text:	section	.text,new
1271  0000               _FLASH_GetFlagStatus:
1273  0000 88            	push	a
1274       00000001      OFST:	set	1
1277                     ; 419   FlagStatus status = RESET;
1279                     ; 421   assert_param(IS_FLASH_FLAGS_OK(FLASH_FLAG));
1281                     ; 424   if((FLASH->IAPSR & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
1283  0001 c4505f        	and	a,20575
1284  0004 2706          	jreq	L174
1285                     ; 426     status = SET; /* FLASH_FLAG is set */
1287  0006 a601          	ld	a,#1
1288  0008 6b01          	ld	(OFST+0,sp),a
1291  000a 2002          	jra	L374
1292  000c               L174:
1293                     ; 430     status = RESET; /* FLASH_FLAG is reset*/
1295  000c 0f01          	clr	(OFST+0,sp)
1297  000e               L374:
1298                     ; 434   return status;
1300  000e 7b01          	ld	a,(OFST+0,sp)
1303  0010 5b01          	addw	sp,#1
1304  0012 81            	ret
1393                     ; 549 IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType)) 
1393                     ; 550 {
1394                     .text:	section	.text,new
1395  0000               _FLASH_WaitForLastOperation:
1397  0000 5203          	subw	sp,#3
1398       00000003      OFST:	set	3
1401                     ; 551   uint8_t flagstatus = 0x00;
1403  0002 0f03          	clr	(OFST+0,sp)
1405                     ; 552   uint16_t timeout = OPERATION_TIMEOUT;
1407  0004 aeffff        	ldw	x,#65535
1408  0007 1f01          	ldw	(OFST-2,sp),x
1410                     ; 557     if(FLASH_MemType == FLASH_MEMTYPE_PROG)
1412  0009 a1fd          	cp	a,#253
1413  000b 2628          	jrne	L155
1415  000d 200e          	jra	L735
1416  000f               L535:
1417                     ; 561         flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_EOP |
1417                     ; 562                                                         FLASH_IAPSR_WR_PG_DIS));
1419  000f c6505f        	ld	a,20575
1420  0012 a405          	and	a,#5
1421  0014 6b03          	ld	(OFST+0,sp),a
1423                     ; 563         timeout--;
1425  0016 1e01          	ldw	x,(OFST-2,sp)
1426  0018 1d0001        	subw	x,#1
1427  001b 1f01          	ldw	(OFST-2,sp),x
1429  001d               L735:
1430                     ; 559       while((flagstatus == 0x00) && (timeout != 0x00))
1432  001d 0d03          	tnz	(OFST+0,sp)
1433  001f 261c          	jrne	L545
1435  0021 1e01          	ldw	x,(OFST-2,sp)
1436  0023 26ea          	jrne	L535
1437  0025 2016          	jra	L545
1438  0027               L745:
1439                     ; 570         flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_HVOFF |
1439                     ; 571                                                         FLASH_IAPSR_WR_PG_DIS));
1441  0027 c6505f        	ld	a,20575
1442  002a a441          	and	a,#65
1443  002c 6b03          	ld	(OFST+0,sp),a
1445                     ; 572         timeout--;
1447  002e 1e01          	ldw	x,(OFST-2,sp)
1448  0030 1d0001        	subw	x,#1
1449  0033 1f01          	ldw	(OFST-2,sp),x
1451  0035               L155:
1452                     ; 568       while((flagstatus == 0x00) && (timeout != 0x00))
1454  0035 0d03          	tnz	(OFST+0,sp)
1455  0037 2604          	jrne	L545
1457  0039 1e01          	ldw	x,(OFST-2,sp)
1458  003b 26ea          	jrne	L745
1459  003d               L545:
1460                     ; 583   if(timeout == 0x00 )
1462  003d 1e01          	ldw	x,(OFST-2,sp)
1463  003f 2604          	jrne	L755
1464                     ; 585     flagstatus = FLASH_STATUS_TIMEOUT;
1466  0041 a602          	ld	a,#2
1467  0043 6b03          	ld	(OFST+0,sp),a
1469  0045               L755:
1470                     ; 588   return((FLASH_Status_TypeDef)flagstatus);
1472  0045 7b03          	ld	a,(OFST+0,sp)
1475  0047 5b03          	addw	sp,#3
1476  0049 81            	ret
1535                     ; 598 IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
1535                     ; 599 {
1536                     .text:	section	.text,new
1537  0000               _FLASH_EraseBlock:
1539  0000 89            	pushw	x
1540  0001 5206          	subw	sp,#6
1541       00000006      OFST:	set	6
1544                     ; 600   uint32_t startaddress = 0;
1546                     ; 610   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
1548                     ; 611   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
1550  0003 7b0b          	ld	a,(OFST+5,sp)
1551  0005 a1fd          	cp	a,#253
1552  0007 260c          	jrne	L706
1553                     ; 613     assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
1555                     ; 614     startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
1557  0009 ae8000        	ldw	x,#32768
1558  000c 1f05          	ldw	(OFST-1,sp),x
1559  000e ae0000        	ldw	x,#0
1560  0011 1f03          	ldw	(OFST-3,sp),x
1563  0013 200a          	jra	L116
1564  0015               L706:
1565                     ; 618     assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
1567                     ; 619     startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
1569  0015 ae4000        	ldw	x,#16384
1570  0018 1f05          	ldw	(OFST-1,sp),x
1571  001a ae0000        	ldw	x,#0
1572  001d 1f03          	ldw	(OFST-3,sp),x
1574  001f               L116:
1575                     ; 627     pwFlash = (PointerAttr uint32_t *)(MemoryAddressCast)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
1577  001f 1e07          	ldw	x,(OFST+1,sp)
1578  0021 a680          	ld	a,#128
1579  0023 cd0000        	call	c_cmulx
1581  0026 96            	ldw	x,sp
1582  0027 1c0003        	addw	x,#OFST-3
1583  002a cd0000        	call	c_ladd
1585  002d be02          	ldw	x,c_lreg+2
1586  002f 1f01          	ldw	(OFST-5,sp),x
1588                     ; 631   FLASH->CR2 |= FLASH_CR2_ERASE;
1590  0031 721a505b      	bset	20571,#5
1591                     ; 632   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NERASE);
1593  0035 721b505c      	bres	20572,#5
1594                     ; 636     *pwFlash = (uint32_t)0;
1596  0039 1e01          	ldw	x,(OFST-5,sp)
1597  003b a600          	ld	a,#0
1598  003d e703          	ld	(3,x),a
1599  003f a600          	ld	a,#0
1600  0041 e702          	ld	(2,x),a
1601  0043 a600          	ld	a,#0
1602  0045 e701          	ld	(1,x),a
1603  0047 a600          	ld	a,#0
1604  0049 f7            	ld	(x),a
1605                     ; 644 }
1608  004a 5b08          	addw	sp,#8
1609  004c 81            	ret
1707                     ; 655 IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType, 
1707                     ; 656                         FLASH_ProgramMode_TypeDef FLASH_ProgMode, uint8_t *Buffer))
1707                     ; 657 {
1708                     .text:	section	.text,new
1709  0000               _FLASH_ProgramBlock:
1711  0000 89            	pushw	x
1712  0001 5206          	subw	sp,#6
1713       00000006      OFST:	set	6
1716                     ; 658   uint16_t Count = 0;
1718                     ; 659   uint32_t startaddress = 0;
1720                     ; 662   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
1722                     ; 663   assert_param(IS_FLASH_PROGRAM_MODE_OK(FLASH_ProgMode));
1724                     ; 664   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
1726  0003 7b0b          	ld	a,(OFST+5,sp)
1727  0005 a1fd          	cp	a,#253
1728  0007 260c          	jrne	L756
1729                     ; 666     assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
1731                     ; 667     startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
1733  0009 ae8000        	ldw	x,#32768
1734  000c 1f03          	ldw	(OFST-3,sp),x
1735  000e ae0000        	ldw	x,#0
1736  0011 1f01          	ldw	(OFST-5,sp),x
1739  0013 200a          	jra	L166
1740  0015               L756:
1741                     ; 671     assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
1743                     ; 672     startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
1745  0015 ae4000        	ldw	x,#16384
1746  0018 1f03          	ldw	(OFST-3,sp),x
1747  001a ae0000        	ldw	x,#0
1748  001d 1f01          	ldw	(OFST-5,sp),x
1750  001f               L166:
1751                     ; 676   startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
1753  001f 1e07          	ldw	x,(OFST+1,sp)
1754  0021 a680          	ld	a,#128
1755  0023 cd0000        	call	c_cmulx
1757  0026 96            	ldw	x,sp
1758  0027 1c0001        	addw	x,#OFST-5
1759  002a cd0000        	call	c_lgadd
1762                     ; 679   if(FLASH_ProgMode == FLASH_PROGRAMMODE_STANDARD)
1764  002d 0d0c          	tnz	(OFST+6,sp)
1765  002f 260a          	jrne	L366
1766                     ; 682     FLASH->CR2 |= FLASH_CR2_PRG;
1768  0031 7210505b      	bset	20571,#0
1769                     ; 683     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NPRG);
1771  0035 7211505c      	bres	20572,#0
1773  0039 2008          	jra	L566
1774  003b               L366:
1775                     ; 688     FLASH->CR2 |= FLASH_CR2_FPRG;
1777  003b 7218505b      	bset	20571,#4
1778                     ; 689     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NFPRG);
1780  003f 7219505c      	bres	20572,#4
1781  0043               L566:
1782                     ; 693   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1784  0043 5f            	clrw	x
1785  0044 1f05          	ldw	(OFST-1,sp),x
1787  0046               L766:
1788                     ; 695     *((PointerAttr uint8_t*) (MemoryAddressCast)startaddress + Count) = ((uint8_t)(Buffer[Count]));
1790  0046 1e0d          	ldw	x,(OFST+7,sp)
1791  0048 72fb05        	addw	x,(OFST-1,sp)
1792  004b f6            	ld	a,(x)
1793  004c 1e03          	ldw	x,(OFST-3,sp)
1794  004e 72fb05        	addw	x,(OFST-1,sp)
1795  0051 f7            	ld	(x),a
1796                     ; 693   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1798  0052 1e05          	ldw	x,(OFST-1,sp)
1799  0054 1c0001        	addw	x,#1
1800  0057 1f05          	ldw	(OFST-1,sp),x
1804  0059 1e05          	ldw	x,(OFST-1,sp)
1805  005b a30080        	cpw	x,#128
1806  005e 25e6          	jrult	L766
1807                     ; 697 }
1810  0060 5b08          	addw	sp,#8
1811  0062 81            	ret
1824                     	xdef	_FLASH_WaitForLastOperation
1825                     	xdef	_FLASH_ProgramBlock
1826                     	xdef	_FLASH_EraseBlock
1827                     	xdef	_FLASH_GetFlagStatus
1828                     	xdef	_FLASH_GetBootSize
1829                     	xdef	_FLASH_GetProgrammingTime
1830                     	xdef	_FLASH_GetLowPowerMode
1831                     	xdef	_FLASH_SetProgrammingTime
1832                     	xdef	_FLASH_SetLowPowerMode
1833                     	xdef	_FLASH_EraseOptionByte
1834                     	xdef	_FLASH_ProgramOptionByte
1835                     	xdef	_FLASH_ReadOptionByte
1836                     	xdef	_FLASH_ProgramWord
1837                     	xdef	_FLASH_ReadByte
1838                     	xdef	_FLASH_ProgramByte
1839                     	xdef	_FLASH_EraseByte
1840                     	xdef	_FLASH_ITConfig
1841                     	xdef	_FLASH_DeInit
1842                     	xdef	_FLASH_Lock
1843                     	xdef	_FLASH_Unlock
1844                     	xref.b	c_lreg
1845                     	xref.b	c_x
1846                     	xref.b	c_y
1865                     	xref	c_ladd
1866                     	xref	c_cmulx
1867                     	xref	c_ltor
1868                     	xref	c_lgadd
1869                     	xref	c_rtol
1870                     	xref	c_umul
1871                     	end
