   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  43                     ; 8 void EEPROM_Config(void)
  43                     ; 9 {
  45                     .text:	section	.text,new
  46  0000               _EEPROM_Config:
  50                     ; 11   FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
  52  0000 7211505a      	bres	20570,#0
  53                     ; 12   FLASH->CR1 |= (uint8_t)0x00;
  55  0004 c6505a        	ld	a,20570
  56                     ; 18   FLASH->DUKR = ((uint8_t)0xAE); /* Warning: keys are reversed on data memory !!! */
  58  0007 35ae5064      	mov	20580,#174
  59                     ; 19   FLASH->DUKR = ((uint8_t)0x56);
  61  000b 35565064      	mov	20580,#86
  63  000f               L52:
  64                     ; 22   while((FLASH->IAPSR & (uint8_t)0x08) == (uint8_t)RESET)
  66  000f c6505f        	ld	a,20575
  67  0012 a508          	bcp	a,#8
  68  0014 27f9          	jreq	L52
  69                     ; 25 }
  72  0016 81            	ret
 118                     .const:	section	.text
 119  0000               L01:
 120  0000 00004000      	dc.l	16384
 121                     ; 27 void EEPROM_ProgramByte(uint16_t Address, uint8_t Data)
 121                     ; 28 {
 122                     .text:	section	.text,new
 123  0000               _EEPROM_ProgramByte:
 125  0000 89            	pushw	x
 126  0001 5204          	subw	sp,#4
 127       00000004      OFST:	set	4
 130                     ; 29   uint32_t TempAddress = ((uint32_t)0x004000) + Address;
 132  0003 cd0000        	call	c_uitolx
 134  0006 ae0000        	ldw	x,#L01
 135  0009 cd0000        	call	c_ladd
 137  000c 96            	ldw	x,sp
 138  000d 1c0001        	addw	x,#OFST-3
 139  0010 cd0000        	call	c_rtol
 142                     ; 30   *(PointerAttr uint8_t*) (MemoryAddressCast)TempAddress = Data;
 144  0013 7b09          	ld	a,(OFST+5,sp)
 145  0015 1e03          	ldw	x,(OFST-1,sp)
 146  0017 f7            	ld	(x),a
 147                     ; 31 }
 150  0018 5b06          	addw	sp,#6
 151  001a 81            	ret
 190                     ; 33 uint8_t EEPROM_ReadByte(uint16_t Address)
 190                     ; 34 {
 191                     .text:	section	.text,new
 192  0000               _EEPROM_ReadByte:
 194  0000 5204          	subw	sp,#4
 195       00000004      OFST:	set	4
 198                     ; 36   uint32_t TempAddress = ((uint32_t)0x004000) + Address;
 200  0002 cd0000        	call	c_uitolx
 202  0005 ae0000        	ldw	x,#L01
 203  0008 cd0000        	call	c_ladd
 205  000b 96            	ldw	x,sp
 206  000c 1c0001        	addw	x,#OFST-3
 207  000f cd0000        	call	c_rtol
 210                     ; 37   return(*(PointerAttr uint8_t *) (MemoryAddressCast)TempAddress);
 212  0012 1e03          	ldw	x,(OFST-1,sp)
 213  0014 f6            	ld	a,(x)
 216  0015 5b04          	addw	sp,#4
 217  0017 81            	ret
 272                     ; 40 void EEPROM_Program2Byte(uint16_t Address, uint16_t Data)
 272                     ; 41 {
 273                     .text:	section	.text,new
 274  0000               _EEPROM_Program2Byte:
 276  0000 89            	pushw	x
 277  0001 89            	pushw	x
 278       00000002      OFST:	set	2
 281                     ; 43   uint8_t Data_H = Data /256;
 283  0002 7b07          	ld	a,(OFST+5,sp)
 284  0004 6b01          	ld	(OFST-1,sp),a
 286                     ; 44   uint8_t Data_L = Data %256;
 288  0006 7b08          	ld	a,(OFST+6,sp)
 289  0008 a4ff          	and	a,#255
 290  000a 6b02          	ld	(OFST+0,sp),a
 292                     ; 45   EEPROM_ProgramByte(Address, Data_H);
 294  000c 7b01          	ld	a,(OFST-1,sp)
 295  000e 88            	push	a
 296  000f cd0000        	call	_EEPROM_ProgramByte
 298  0012 84            	pop	a
 299                     ; 47   EEPROM_ProgramByte(Address+1, Data_L);
 301  0013 7b02          	ld	a,(OFST+0,sp)
 302  0015 88            	push	a
 303  0016 1e04          	ldw	x,(OFST+2,sp)
 304  0018 5c            	incw	x
 305  0019 cd0000        	call	_EEPROM_ProgramByte
 307  001c 84            	pop	a
 308                     ; 49 }
 311  001d 5b04          	addw	sp,#4
 312  001f 81            	ret
 381                     ; 51 void EEPROM_Program4Byte(uint16_t Address, uint32_t Data)
 381                     ; 52 {
 382                     .text:	section	.text,new
 383  0000               _EEPROM_Program4Byte:
 385  0000 89            	pushw	x
 386  0001 5204          	subw	sp,#4
 387       00000004      OFST:	set	4
 390                     ; 53   uint8_t Data_3 = BYTE_3(Data);
 392  0003 7b09          	ld	a,(OFST+5,sp)
 393  0005 6b01          	ld	(OFST-3,sp),a
 395                     ; 54   uint8_t Data_2 = BYTE_2(Data);
 397  0007 7b0a          	ld	a,(OFST+6,sp)
 398  0009 a4ff          	and	a,#255
 399  000b 6b02          	ld	(OFST-2,sp),a
 401                     ; 55   uint8_t Data_1 = BYTE_1(Data);
 403  000d 7b0b          	ld	a,(OFST+7,sp)
 404  000f a4ff          	and	a,#255
 405  0011 6b03          	ld	(OFST-1,sp),a
 407                     ; 56   uint8_t Data_0 = BYTE_0(Data);
 409  0013 7b0c          	ld	a,(OFST+8,sp)
 410  0015 a4ff          	and	a,#255
 411  0017 6b04          	ld	(OFST+0,sp),a
 413                     ; 58   EEPROM_ProgramByte(Address, Data_3);
 415  0019 7b01          	ld	a,(OFST-3,sp)
 416  001b 88            	push	a
 417  001c cd0000        	call	_EEPROM_ProgramByte
 419  001f 84            	pop	a
 420                     ; 59   EEPROM_ProgramByte(Address+1, Data_2);
 422  0020 7b02          	ld	a,(OFST-2,sp)
 423  0022 88            	push	a
 424  0023 1e06          	ldw	x,(OFST+2,sp)
 425  0025 5c            	incw	x
 426  0026 cd0000        	call	_EEPROM_ProgramByte
 428  0029 84            	pop	a
 429                     ; 60   EEPROM_ProgramByte(Address+2, Data_1);
 431  002a 7b03          	ld	a,(OFST-1,sp)
 432  002c 88            	push	a
 433  002d 1e06          	ldw	x,(OFST+2,sp)
 434  002f 5c            	incw	x
 435  0030 5c            	incw	x
 436  0031 cd0000        	call	_EEPROM_ProgramByte
 438  0034 84            	pop	a
 439                     ; 61   EEPROM_ProgramByte(Address+3, Data_0);
 441  0035 7b04          	ld	a,(OFST+0,sp)
 442  0037 88            	push	a
 443  0038 1e06          	ldw	x,(OFST+2,sp)
 444  003a 1c0003        	addw	x,#3
 445  003d cd0000        	call	_EEPROM_ProgramByte
 447  0040 84            	pop	a
 448                     ; 62 }
 451  0041 5b06          	addw	sp,#6
 452  0043 81            	ret
 492                     ; 64 uint32_t EEPROM_Read4Byte(uint16_t Address)
 492                     ; 65 {
 493                     .text:	section	.text,new
 494  0000               _EEPROM_Read4Byte:
 496  0000 89            	pushw	x
 497  0001 520c          	subw	sp,#12
 498       0000000c      OFST:	set	12
 501                     ; 67   Temp = (EEPROM_ReadByte(Address) * 0x1000000) + (EEPROM_ReadByte(Address+1) * 0x10000) + (EEPROM_ReadByte(Address+2) * 0x100) + EEPROM_ReadByte(Address+3);
 503  0003 1c0003        	addw	x,#3
 504  0006 cd0000        	call	_EEPROM_ReadByte
 506  0009 88            	push	a
 507  000a 1e0e          	ldw	x,(OFST+2,sp)
 508  000c 5c            	incw	x
 509  000d 5c            	incw	x
 510  000e cd0000        	call	_EEPROM_ReadByte
 512  0011 5f            	clrw	x
 513  0012 97            	ld	xl,a
 514  0013 4f            	clr	a
 515  0014 02            	rlwa	x,a
 516  0015 cd0000        	call	c_itolx
 518  0018 96            	ldw	x,sp
 519  0019 1c0006        	addw	x,#OFST-6
 520  001c cd0000        	call	c_rtol
 523  001f 1e0e          	ldw	x,(OFST+2,sp)
 524  0021 5c            	incw	x
 525  0022 cd0000        	call	_EEPROM_ReadByte
 527  0025 b703          	ld	c_lreg+3,a
 528  0027 3f02          	clr	c_lreg+2
 529  0029 3f01          	clr	c_lreg+1
 530  002b 3f00          	clr	c_lreg
 531  002d a610          	ld	a,#16
 532  002f cd0000        	call	c_llsh
 534  0032 96            	ldw	x,sp
 535  0033 1c0002        	addw	x,#OFST-10
 536  0036 cd0000        	call	c_rtol
 539  0039 1e0e          	ldw	x,(OFST+2,sp)
 540  003b cd0000        	call	_EEPROM_ReadByte
 542  003e b703          	ld	c_lreg+3,a
 543  0040 3f02          	clr	c_lreg+2
 544  0042 3f01          	clr	c_lreg+1
 545  0044 3f00          	clr	c_lreg
 546  0046 a618          	ld	a,#24
 547  0048 cd0000        	call	c_llsh
 549  004b 96            	ldw	x,sp
 550  004c 1c0002        	addw	x,#OFST-10
 551  004f cd0000        	call	c_ladd
 553  0052 96            	ldw	x,sp
 554  0053 1c0006        	addw	x,#OFST-6
 555  0056 cd0000        	call	c_ladd
 557  0059 84            	pop	a
 558  005a cd0000        	call	c_ladc
 560  005d 96            	ldw	x,sp
 561  005e 1c0009        	addw	x,#OFST-3
 562  0061 cd0000        	call	c_rtol
 565                     ; 68   return Temp;
 567  0064 96            	ldw	x,sp
 568  0065 1c0009        	addw	x,#OFST-3
 569  0068 cd0000        	call	c_ltor
 573  006b 5b0e          	addw	sp,#14
 574  006d 81            	ret
 614                     ; 71 uint16_t EEPROM_Read2Byte(uint16_t Address)
 614                     ; 72 {
 615                     .text:	section	.text,new
 616  0000               _EEPROM_Read2Byte:
 618  0000 89            	pushw	x
 619  0001 5203          	subw	sp,#3
 620       00000003      OFST:	set	3
 623                     ; 74   Temp = (EEPROM_ReadByte(Address)*256) + EEPROM_ReadByte(Address+1);
 625  0003 5c            	incw	x
 626  0004 cd0000        	call	_EEPROM_ReadByte
 628  0007 6b01          	ld	(OFST-2,sp),a
 630  0009 1e04          	ldw	x,(OFST+1,sp)
 631  000b cd0000        	call	_EEPROM_ReadByte
 633  000e 5f            	clrw	x
 634  000f 97            	ld	xl,a
 635  0010 4f            	clr	a
 636  0011 02            	rlwa	x,a
 637  0012 01            	rrwa	x,a
 638  0013 1b01          	add	a,(OFST-2,sp)
 639  0015 2401          	jrnc	L42
 640  0017 5c            	incw	x
 641  0018               L42:
 642  0018 02            	rlwa	x,a
 643  0019 1f02          	ldw	(OFST-1,sp),x
 644  001b 01            	rrwa	x,a
 646                     ; 75   return Temp;
 648  001c 1e02          	ldw	x,(OFST-1,sp)
 651  001e 5b05          	addw	sp,#5
 652  0020 81            	ret
 665                     	xdef	_EEPROM_Read4Byte
 666                     	xdef	_EEPROM_Program4Byte
 667                     	xdef	_EEPROM_Read2Byte
 668                     	xdef	_EEPROM_Program2Byte
 669                     	xdef	_EEPROM_ReadByte
 670                     	xdef	_EEPROM_ProgramByte
 671                     	xdef	_EEPROM_Config
 672                     	xref.b	c_lreg
 691                     	xref	c_ltor
 692                     	xref	c_ladc
 693                     	xref	c_itolx
 694                     	xref	c_llsh
 695                     	xref	c_rtol
 696                     	xref	c_ladd
 697                     	xref	c_uitolx
 698                     	end
