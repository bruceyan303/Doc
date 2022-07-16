;--------------------------------------------------------
; File Created by SLCC : free open source ANSI-C Compiler
; Version 3.6.0 #Jan 18 2022 (MSVC)
;--------------------------------------------------------
; SL port for the RISC core
;--------------------------------------------------------
;	.file	"E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\2_XC8P9520_RTC中断\XC8P9520-RTC.C"
	list	p=XC8P9520
	radix dec
	include "XC8P9520.inc"
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_IARbits
	extern	_TCCbits
	extern	_PCLbits
	extern	_STATUSbits
	extern	_RSRbits
	extern	_PORT6bits
	extern	_PWMCONbits
	extern	_PRDbits
	extern	_PDC1bits
	extern	_PDC2bits
	extern	_PDC3bits
	extern	_ICIECRbits
	extern	_CPUCONbits
	extern	_ISRbits
	extern	_IAR
	extern	_TCC
	extern	_PCL
	extern	_STATUS
	extern	_RSR
	extern	_PORT6
	extern	_PWMCON
	extern	_PRD
	extern	_PDC1
	extern	_PDC2
	extern	_PDC3
	extern	_ICIECR
	extern	_CPUCON
	extern	_ISR
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	global	_file_clrRam
	global	_file_init
	global	_file_project_init
	global	_int_isr
	global	_main
	global	_A_BUFF
	global	_R3_BUFF

	global STK11
	global STK10
	global STK09
	global STK08
	global STK07
	global STK06
	global STK05
	global STK04
	global STK03
	global STK02
	global STK01
	global STK00

sharebank udata_ovr 0x0020
STK11	res 1
STK10	res 1
STK09	res 1
STK08	res 1
STK07	res 1
STK06	res 1
STK05	res 1
STK04	res 1
STK03	res 1
STK02	res 1
STK01	res 1
STK00	res 1

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
UD_abs_XC8P9520_RTC_10	udata_ovr	0x0010
_A_BUFF
	res	1
UD_abs_XC8P9520_RTC_11	udata_ovr	0x0011
_R3_BUFF
	res	1
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_XC8P9520_RTC_0	udata
r0x1000	res	1
r0x1001	res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

;@Allocation info for local variables in function 'file_clrRam'
;@file_clrRam file_clrRam               Allocated to registers ;size:2
;@file_clrRam IARbits                   Allocated to registers ;size:1
;@file_clrRam TCCbits                   Allocated to registers ;size:1
;@file_clrRam PCLbits                   Allocated to registers ;size:1
;@file_clrRam STATUSbits                Allocated to registers ;size:1
;@file_clrRam RSRbits                   Allocated to registers ;size:1
;@file_clrRam PORT6bits                 Allocated to registers ;size:1
;@file_clrRam PWMCONbits                Allocated to registers ;size:1
;@file_clrRam PRDbits                   Allocated to registers ;size:1
;@file_clrRam PDC1bits                  Allocated to registers ;size:1
;@file_clrRam PDC2bits                  Allocated to registers ;size:1
;@file_clrRam PDC3bits                  Allocated to registers ;size:1
;@file_clrRam ICIECRbits                Allocated to registers ;size:1
;@file_clrRam CPUCONbits                Allocated to registers ;size:1
;@file_clrRam ISRbits                   Allocated to registers ;size:1
;@file_clrRam A_BUFF                    Allocated to registers ;size:1
;@file_clrRam R3_BUFF                   Allocated to registers ;size:1
;@file_clrRam IAR                       Allocated to registers ;size:1
;@file_clrRam TCC                       Allocated to registers ;size:1
;@file_clrRam PCL                       Allocated to registers ;size:1
;@file_clrRam STATUS                    Allocated to registers ;size:1
;@file_clrRam RSR                       Allocated to registers ;size:1
;@file_clrRam PORT6                     Allocated to registers ;size:1
;@file_clrRam PWMCON                    Allocated to registers ;size:1
;@file_clrRam PRD                       Allocated to registers ;size:1
;@file_clrRam PDC1                      Allocated to registers ;size:1
;@file_clrRam PDC2                      Allocated to registers ;size:1
;@file_clrRam PDC3                      Allocated to registers ;size:1
;@file_clrRam ICIECR                    Allocated to registers ;size:1
;@file_clrRam CPUCON                    Allocated to registers ;size:1
;@file_clrRam ISR                       Allocated to registers ;size:1
;@end Allocation info for local variables in function 'file_clrRam';

;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; reset vector 
;--------------------------------------------------------
STARTUP	code 0x0000
	jmp	_main
;--------------------------------------------------------
; interrupt and initialization code
;--------------------------------------------------------
c_interrupt	code	0x0003
__sdcc_interrupt:
;***
;  pBlock Stats: dbName = I
;***
;2 compiler assigned registers:
;   r0x1000
;   r0x1001
;; Starting pCode block
_int_isr:	;Function start
; 0 exit points
;	.line	71; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\2_XC8P9520_RTC中断\XC8P9520-RTC.C	__asm__("org 0x08");			//中断入口地址			
	org	0x08
;	.line	72; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\2_XC8P9520_RTC中断\XC8P9520-RTC.C	PUSH(_A_BUFF,_R3_BUFF);			//中断入栈保护
	mov	_A_BUFF,a
	swap	_A_BUFF
	swapa	STATUS
	mov	_R3_BUFF,a
;	.line	74; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\2_XC8P9520_RTC中断\XC8P9520-RTC.C	if(TCIF == 1)					//判断TCIF是否为1
	CLR	r0x1000
	JBTC	_ISRbits,0
	INC	r0x1000
;;101	MOV	A,r0x1000
;;100	MOV	A,r0x1001
	MOV	A,r0x1000
	MOV	r0x1001,A
	XOR	A,@0x01
	JBTS	STATUS,2
	JMP	_00121_DS_
;	.line	77; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\2_XC8P9520_RTC中断\XC8P9520-RTC.C	ISR    = 0xfe;				//清TC0中断标志位
	MOV	A,@0xfe
	MOV	_ISR,A
;	.line	78; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\2_XC8P9520_RTC中断\XC8P9520-RTC.C	PORT6_1 = !PORT6_1;			//P61口翻转
	CLR	r0x1000
	JBTC	_PORT6bits,1
	INC	r0x1000
	MOV	A,r0x1000
	MOV	A,@0x00
	JBTC	STATUS,2
	MOV	A,@0x01
	MOV	r0x1000,A
	MOV	r0x1001,A
;;99	MOV	A,r0x1001
	RCA	r0x1000
	JBTS	STATUS,0
	BTC	_PORT6bits,1
	JBTC	STATUS,0
	BTS	_PORT6bits,1
_00121_DS_:
;	.line	81; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\2_XC8P9520_RTC中断\XC8P9520-RTC.C	POP(_A_BUFF,_R3_BUFF);			//中断出栈保护恢复
	swapa	_R3_BUFF
	mov	STATUS,a
	swapa	_A_BUFF
;	.line	82; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\2_XC8P9520_RTC中断\XC8P9520-RTC.C	}
END_OF_INTERRUPT:
	RETI	

;--------------------------------------------------------
; code
;--------------------------------------------------------
code_XC8P9520_RTC	code
;***
;  pBlock Stats: dbName = M
;***
;has an exit
;functions called:
;   _file_clrRam
;   _file_init
;   _file_project_init
;   _file_clrRam
;   _file_init
;   _file_project_init
;; Starting pCode block
S_XC8P9520_RTC__main	code
_main:	;Function start
; 2 exit points
;	.line	89; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\2_XC8P9520_RTC中断\XC8P9520-RTC.C	file_clrRam();					//清RAM
	CALL	_file_clrRam
;	.line	90; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\2_XC8P9520_RTC中断\XC8P9520-RTC.C	file_init();					//io寄存器初始化
	CALL	_file_init
;	.line	91; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\2_XC8P9520_RTC中断\XC8P9520-RTC.C	file_project_init();			//程序所需功能设置
	CALL	_file_project_init
;	.line	92; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\2_XC8P9520_RTC中断\XC8P9520-RTC.C	EI();							//打开总中断
	ei	
_00127_DS_:
;	.line	96; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\2_XC8P9520_RTC中断\XC8P9520-RTC.C	NOP();
	nop	
;	.line	97; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\2_XC8P9520_RTC中断\XC8P9520-RTC.C	NOP();
	nop	
;	.line	98; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\2_XC8P9520_RTC中断\XC8P9520-RTC.C	NOP();
	nop	
	JMP	_00127_DS_
;	.line	100; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\2_XC8P9520_RTC中断\XC8P9520-RTC.C	}
	RET	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_XC8P9520_RTC__file_project_init	code
_file_project_init:	;Function start
; 2 exit points
;	.line	65; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\2_XC8P9520_RTC中断\XC8P9520-RTC.C	}
;	.line	65; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\2_XC8P9520_RTC中断\XC8P9520-RTC.C	}
	RET	
; exit point of _file_project_init

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_XC8P9520_RTC__file_init	code
_file_init:	;Function start
; 2 exit points
;	.line	41; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\2_XC8P9520_RTC中断\XC8P9520-RTC.C	CONTW(0x84);			//TCC 32分频,开RTC
	mov	a,@0x84
	ctw
;	.line	42; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\2_XC8P9520_RTC中断\XC8P9520-RTC.C	TCC = 0;
	CLR	_TCC
;	.line	43; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\2_XC8P9520_RTC中断\XC8P9520-RTC.C	PORT6 = 0;				//P6口输出低
	CLR	_PORT6
;	.line	44; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\2_XC8P9520_RTC中断\XC8P9520-RTC.C	IOCP_W(P6CR,0x08);		//P6口设为输出
	mov	a,@0x08
	iw	P6CR
;	.line	45; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\2_XC8P9520_RTC中断\XC8P9520-RTC.C	IOCP_W(PHDCR,0xff);		//端口上下拉控制寄存器，bit7-bit4对应P67-P64下拉;bit3-bit0对应P53-P50上拉 
	mov	a,@0xff
	iw	PHDCR
;	.line	46; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\2_XC8P9520_RTC中断\XC8P9520-RTC.C	IOCP_W(PDCR,0xff);		//端口下拉控制寄存器，  bit6-bit4对应P62-P60,bit3-bit0对应P53-P50
	mov	a,@0xff
	iw	PDCR
;	.line	47; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\2_XC8P9520_RTC中断\XC8P9520-RTC.C	IOCP_W(PHCR,0xff);		//P6端口上拉控制寄存器  bit7-bit0对应P67-P60
	mov	a,@0xff
	iw	PHCR
;	.line	48; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\2_XC8P9520_RTC中断\XC8P9520-RTC.C	IOCP_W(WDTCR,0x00);		//WDT 使能控制寄存器
	mov	a,@0x00
	iw	WDTCR
;	.line	49; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\2_XC8P9520_RTC中断\XC8P9520-RTC.C	IOCP_W(IMR,0x01);		//中断使能控制寄存器 
	mov	a,@0x01
	iw	IMR
;	.line	50; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\2_XC8P9520_RTC中断\XC8P9520-RTC.C	ISR = 0x0;				//清TC0中断标志位 
	CLR	_ISR
;	.line	51; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\2_XC8P9520_RTC中断\XC8P9520-RTC.C	}
	RET	
; exit point of _file_init

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_XC8P9520_RTC__file_clrRam	code
_file_clrRam:	;Function start
; 2 exit points
;	.line	31; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\2_XC8P9520_RTC中断\XC8P9520-RTC.C	for(RSR=0x90;RSR<0xFF;RSR++)	//清零 BANK0 RAM  IAR-R0,RSR-R4
	MOV	A,@0x90
	MOV	_RSR,A
_00107_DS_:
	MOV	A,@0xff
	SUB	A,_RSR
	JBTC	STATUS,0
	JMP	_00105_DS_
;	.line	33; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\2_XC8P9520_RTC中断\XC8P9520-RTC.C	{IAR = 0;}
	CLR	_IAR
;	.line	31; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\2_XC8P9520_RTC中断\XC8P9520-RTC.C	for(RSR=0x90;RSR<0xFF;RSR++)	//清零 BANK0 RAM  IAR-R0,RSR-R4
	INC	_RSR
	JMP	_00107_DS_
_00105_DS_:
;	.line	34; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\2_XC8P9520_RTC中断\XC8P9520-RTC.C	IAR = 0;
	CLR	_IAR
;	.line	35; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\2_XC8P9520_RTC中断\XC8P9520-RTC.C	}
	RET	
; exit point of _file_clrRam


;	code size estimation:
;	   46+    0 =    46 instructions (   92 byte)

	end
