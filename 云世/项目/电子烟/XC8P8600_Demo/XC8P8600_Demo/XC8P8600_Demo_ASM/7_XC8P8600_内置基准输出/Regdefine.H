/**********************************************************************/
/**********************无锡矽杰微电子有限公司****************************/
/**********************项目: 各类定义头文件****************************/
/**********************编程: Louie	       ****************************/
/**********************时间: 2010.11.23    ****************************/
/**********************************************************************/             
;          __________
;         |          |
;      ---|RA0   RA1 |---  
;      ---|RB7   RA2 |---  
;      ---|RB6   RA3 |---  
; VCC  ---|VCC   GND |---  VSS
;      ---|RB5   RB0 |---  
;      ---|RB4   RB1 |---  
;      ---|RB3   RB2 |---  
;         |__________|
;************************************
;----------------宏定义--------------
;		所有宏定义都用大写字母
;************************************

//TCC_1_1   						EQU  	0X08 /* TCC PRESCALE 1:1 (DEFAULT) */ 
//TCC_1_2   						EQU  	0X00 /* TCC PRESCALE 1:2 */
//TCC_1_4   						EQU  	0X01 /* TCC PRESCALE 1:4 */
TCC_1_8  	 						EQU 	0X02 /* TCC PRESCALE 1:8 */
//TCC_1_16  						EQU  	0X03 /* TCC PRESCALE 1:16 */
//TCC_1_32  						EQU  	0X04 /* TCC PRESCALE 1:32 */
//TCC_1_64  						EQU  	0X05 /* TCC PRESCALE 1:64 */
//TCC_1_128 						EQU  	0X06 /* TCC PRESCALE 1:128 */
//TCC_1_256 						EQU  	0X07 /* TCC PRESCALE 1:256 */	

TCC_NUM							EQU		6	;//	165;//6;//156;		
;------------------------------------				
EntestClearRam					EQU		1	;//	清RAM使能
//EnText0						EQU		1	;//	
EnText1							EQU		1	;//	

;	-------变量寄存器定义----------------
;R4_BUFF						EQU		0X10		
A_BUFF							EQU		0X11
R3_BUFF							EQU		0X12
RegBuff1						EQU		0x13
RegBuff2						equ		0x14
RegAdcDATA0						equ		0x15
RegAdcDATA1						equ		0x16
reg_AdCnt						EQU		0X17
RegADCDangBuff					equ		0x18
RegADCDang						equ		0x19
RegLvBo							equ		0x1a
RegADCwork						equ		0x1b
RegLEDWOrk						equ		0x1c

;****************************************
;	    所有标志位都以 bit_ 开头
;****************************************

;---------------------------------------		
RegBit1							EQU		0x2f
BitTCCEnable	            	EQU		0x2f.0
BitADCEnable					equ		0x2f.1
BitLvBo							equ		0x2f.2

;***************************************
;	---------------------端口定义-------
;		    所有端口位都以 iobit_ 开头
;***************************************	
IOLED1			        		EQU		port6.5		;//
IOLED2							equ		port6.4		;//
IOLED3							EQU		port6.3		;//
IOLED4							EQU		port6.2		;//

FiliCLRRAM  MACRO        
			MOV      A,@0X10
            MOV      R4,A
            CLR      R0
            INC      R4
            MOV      A,R4
            XOR      A,@0XFF
            JBtS      R3,2
            JMP      $-5        
            CLR      0X4F
            ENDM