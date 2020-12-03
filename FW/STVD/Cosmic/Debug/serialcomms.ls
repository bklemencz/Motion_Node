   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
   4                     ; Optimizer V4.4.11 - 19 Nov 2019
  88                     ; 4 void Serial_Send_PWM_Onoff(uint8_t ID, bool Onoff)
  88                     ; 5 {
  90                     	switch	.text
  91  0000               _Serial_Send_PWM_Onoff:
  93  0000 89            	pushw	x
  94       00000000      OFST:	set	0
  97                     ; 6     UART2_SendData8('P');
  99  0001 a650          	ld	a,#80
 100  0003 cd0000        	call	_UART2_SendData8
 102                     ; 7     UART2_SendData8(ID);
 104  0006 7b01          	ld	a,(OFST+1,sp)
 105  0008 cd0000        	call	_UART2_SendData8
 107                     ; 8     UART2_SendData8('C');
 109  000b a643          	ld	a,#67
 110  000d cd0000        	call	_UART2_SendData8
 112                     ; 9     if (Onoff) UART2_SendData8('O');
 114  0010 7b02          	ld	a,(OFST+2,sp)
 115  0012 2704          	jreq	L34
 118  0014 a64f          	ld	a,#79
 121  0016 2002          	jra	L54
 122  0018               L34:
 123                     ; 10     else UART2_SendData8('F');
 125  0018 a646          	ld	a,#70
 127  001a               L54:
 128  001a cd0000        	call	_UART2_SendData8
 129                     ; 11     UART2_SendData8('0');
 131  001d a630          	ld	a,#48
 132  001f cd0000        	call	_UART2_SendData8
 134                     ; 12     UART2_SendData8('0');
 136  0022 a630          	ld	a,#48
 137  0024 cd0000        	call	_UART2_SendData8
 139                     ; 13     UART2_SendData8('\r');
 141  0027 a60d          	ld	a,#13
 142  0029 cd0000        	call	_UART2_SendData8
 144                     ; 14 }
 147  002c 85            	popw	x
 148  002d 81            	ret	
 182                     ; 16 void Serial_Send_PWM_MotionDet(uint8_t ID)
 182                     ; 17 {
 183                     	switch	.text
 184  002e               _Serial_Send_PWM_MotionDet:
 186  002e 88            	push	a
 187       00000000      OFST:	set	0
 190                     ; 18     UART2_SendData8('P');
 192  002f a650          	ld	a,#80
 193  0031 cd0000        	call	_UART2_SendData8
 195                     ; 19     UART2_SendData8(ID);
 197  0034 7b01          	ld	a,(OFST+1,sp)
 198  0036 cd0000        	call	_UART2_SendData8
 200                     ; 20     UART2_SendData8('C');
 202  0039 a643          	ld	a,#67
 203  003b cd0000        	call	_UART2_SendData8
 205                     ; 21     UART2_SendData8('M');
 207  003e a64d          	ld	a,#77
 208  0040 cd0000        	call	_UART2_SendData8
 210                     ; 22     UART2_SendData8('0');
 212  0043 a630          	ld	a,#48
 213  0045 cd0000        	call	_UART2_SendData8
 215                     ; 23     UART2_SendData8('0');
 217  0048 a630          	ld	a,#48
 218  004a cd0000        	call	_UART2_SendData8
 220                     ; 24     UART2_SendData8('\r');
 222  004d a60d          	ld	a,#13
 223  004f cd0000        	call	_UART2_SendData8
 225                     ; 25 }
 228  0052 84            	pop	a
 229  0053 81            	ret	
 273                     ; 27 void Serial_Send_PWM_MotionEN(uint8_t ID, bool MotionEN)
 273                     ; 28 {
 274                     	switch	.text
 275  0054               _Serial_Send_PWM_MotionEN:
 277  0054 89            	pushw	x
 278       00000000      OFST:	set	0
 281                     ; 29     UART2_SendData8('P');
 283  0055 a650          	ld	a,#80
 284  0057 cd0000        	call	_UART2_SendData8
 286                     ; 30     UART2_SendData8(ID);
 288  005a 7b01          	ld	a,(OFST+1,sp)
 289  005c cd0000        	call	_UART2_SendData8
 291                     ; 31     UART2_SendData8('S');
 293  005f a653          	ld	a,#83
 294  0061 cd0000        	call	_UART2_SendData8
 296                     ; 32     UART2_SendData8('E');
 298  0064 a645          	ld	a,#69
 299  0066 cd0000        	call	_UART2_SendData8
 301                     ; 33     if (MotionEN) UART2_SendData8('1');
 303  0069 7b02          	ld	a,(OFST+2,sp)
 304  006b 2704          	jreq	L301
 307  006d a631          	ld	a,#49
 310  006f 2002          	jra	L501
 311  0071               L301:
 312                     ; 34     else UART2_SendData8('0');
 314  0071 a630          	ld	a,#48
 316  0073               L501:
 317  0073 cd0000        	call	_UART2_SendData8
 318                     ; 35     UART2_SendData8('0');
 320  0076 a630          	ld	a,#48
 321  0078 cd0000        	call	_UART2_SendData8
 323                     ; 36     UART2_SendData8('\r');
 325  007b a60d          	ld	a,#13
 326  007d cd0000        	call	_UART2_SendData8
 328                     ; 37 }
 331  0080 85            	popw	x
 332  0081 81            	ret	
 376                     ; 39 void Serial_Send_PWM_NightEN(uint8_t ID, bool NightEN)
 376                     ; 40 {
 377                     	switch	.text
 378  0082               _Serial_Send_PWM_NightEN:
 380  0082 89            	pushw	x
 381       00000000      OFST:	set	0
 384                     ; 41     UART2_SendData8('P');
 386  0083 a650          	ld	a,#80
 387  0085 cd0000        	call	_UART2_SendData8
 389                     ; 42     UART2_SendData8(ID);
 391  0088 7b01          	ld	a,(OFST+1,sp)
 392  008a cd0000        	call	_UART2_SendData8
 394                     ; 43     UART2_SendData8('C');
 396  008d a643          	ld	a,#67
 397  008f cd0000        	call	_UART2_SendData8
 399                     ; 44     UART2_SendData8('N');
 401  0092 a64e          	ld	a,#78
 402  0094 cd0000        	call	_UART2_SendData8
 404                     ; 45     if (NightEN) UART2_SendData8('1');
 406  0097 7b02          	ld	a,(OFST+2,sp)
 407  0099 2704          	jreq	L721
 410  009b a631          	ld	a,#49
 413  009d 2002          	jra	L131
 414  009f               L721:
 415                     ; 46     else UART2_SendData8('0');
 417  009f a630          	ld	a,#48
 419  00a1               L131:
 420  00a1 cd0000        	call	_UART2_SendData8
 421                     ; 47     UART2_SendData8('0');
 423  00a4 a630          	ld	a,#48
 424  00a6 cd0000        	call	_UART2_SendData8
 426                     ; 48     UART2_SendData8('\r');
 428  00a9 a60d          	ld	a,#13
 429  00ab cd0000        	call	_UART2_SendData8
 431                     ; 49 }
 434  00ae 85            	popw	x
 435  00af 81            	ret	
 483                     ; 51 void Serial_Send_PWM_Bright(uint8_t ID, uint8_t Ch1, uint8_t Ch2)
 483                     ; 52 {
 484                     	switch	.text
 485  00b0               _Serial_Send_PWM_Bright:
 487  00b0 89            	pushw	x
 488       00000000      OFST:	set	0
 491                     ; 53     UART2_SendData8('P');
 493  00b1 a650          	ld	a,#80
 494  00b3 cd0000        	call	_UART2_SendData8
 496                     ; 54     UART2_SendData8(ID);
 498  00b6 7b01          	ld	a,(OFST+1,sp)
 499  00b8 cd0000        	call	_UART2_SendData8
 501                     ; 55     UART2_SendData8('C');
 503  00bb a643          	ld	a,#67
 504  00bd cd0000        	call	_UART2_SendData8
 506                     ; 56     UART2_SendData8('3');
 508  00c0 a633          	ld	a,#51
 509  00c2 cd0000        	call	_UART2_SendData8
 511                     ; 57     UART2_SendData8(Ch1);
 513  00c5 7b02          	ld	a,(OFST+2,sp)
 514  00c7 cd0000        	call	_UART2_SendData8
 516                     ; 58     UART2_SendData8(Ch2);
 518  00ca 7b05          	ld	a,(OFST+5,sp)
 519  00cc cd0000        	call	_UART2_SendData8
 521                     ; 59     UART2_SendData8('\r');
 523  00cf a60d          	ld	a,#13
 524  00d1 cd0000        	call	_UART2_SendData8
 526                     ; 60 }
 529  00d4 85            	popw	x
 530  00d5 81            	ret	
 578                     ; 62 void Serial_Send_PWM_ChBright(uint8_t ID, uint8_t Ch, uint8_t Val)
 578                     ; 63 {
 579                     	switch	.text
 580  00d6               _Serial_Send_PWM_ChBright:
 582  00d6 89            	pushw	x
 583       00000000      OFST:	set	0
 586                     ; 64     UART2_SendData8('P');
 588  00d7 a650          	ld	a,#80
 589  00d9 cd0000        	call	_UART2_SendData8
 591                     ; 65     UART2_SendData8(ID);
 593  00dc 7b01          	ld	a,(OFST+1,sp)
 594  00de cd0000        	call	_UART2_SendData8
 596                     ; 66     UART2_SendData8('C');
 598  00e1 a643          	ld	a,#67
 599  00e3 cd0000        	call	_UART2_SendData8
 601                     ; 67     if (Ch==1) UART2_SendData8('1');
 603  00e6 7b02          	ld	a,(OFST+2,sp)
 604  00e8 a101          	cp	a,#1
 605  00ea 2607          	jrne	L371
 608  00ec a631          	ld	a,#49
 609  00ee cd0000        	call	_UART2_SendData8
 611  00f1 7b02          	ld	a,(OFST+2,sp)
 612  00f3               L371:
 613                     ; 68     if (Ch==2) UART2_SendData8('2');
 615  00f3 a102          	cp	a,#2
 616  00f5 2607          	jrne	L571
 619  00f7 a632          	ld	a,#50
 620  00f9 cd0000        	call	_UART2_SendData8
 622  00fc 7b02          	ld	a,(OFST+2,sp)
 623  00fe               L571:
 624                     ; 69     if (Ch==3) UART2_SendData8('4');
 626  00fe a103          	cp	a,#3
 627  0100 2605          	jrne	L771
 630  0102 a634          	ld	a,#52
 631  0104 cd0000        	call	_UART2_SendData8
 633  0107               L771:
 634                     ; 70     UART2_SendData8(Val);
 636  0107 7b05          	ld	a,(OFST+5,sp)
 637  0109 cd0000        	call	_UART2_SendData8
 639                     ; 71     UART2_SendData8('0');
 641  010c a630          	ld	a,#48
 642  010e cd0000        	call	_UART2_SendData8
 644                     ; 72     UART2_SendData8('\r');
 646  0111 a60d          	ld	a,#13
 647  0113 cd0000        	call	_UART2_SendData8
 649                     ; 73 }
 652  0116 85            	popw	x
 653  0117 81            	ret	
 666                     	xdef	_Serial_Send_PWM_ChBright
 667                     	xdef	_Serial_Send_PWM_Bright
 668                     	xdef	_Serial_Send_PWM_NightEN
 669                     	xdef	_Serial_Send_PWM_MotionEN
 670                     	xdef	_Serial_Send_PWM_MotionDet
 671                     	xdef	_Serial_Send_PWM_Onoff
 672                     	xref	_UART2_SendData8
 691                     	end
