;--------------------------------------------------------
; File Created by SLCC : free open source ANSI-C Compiler
; Version 3.6.0 #Jan 18 2022 (MSVC)
;--------------------------------------------------------
; SL port for the RISC core
;--------------------------------------------------------
;	.file	"E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C"
	list	p=XC8P8600
	radix dec
	include "XC8P8600.inc"
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_IARbits
	extern	_TCCbits
	extern	_PCLbits
	extern	_STATUSbits
	extern	_RSRbits
	extern	_PORT6bits
	extern	_ADCONbits
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
	extern	_ADCON
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
UD_abs_XC8P8600_INTERRUPT_10	udata_ovr	0x0010
_A_BUFF
	res	1
UD_abs_XC8P8600_INTERRUPT_11	udata_ovr	0x0011
_R3_BUFF
	res	1
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
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
;@file_clrRam ADCONbits                 Allocated to registers ;size:1
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
;@file_clrRam ADCON                     Allocated to registers ;size:1
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
;; Starting pCode block
_int_isr:	;Function start
; 0 exit points
;	.line	81; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	__asm__("org 0x08");			//中断入口地址			
	org	0x08
;	.line	82; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	PUSH(_A_BUFF,_R3_BUFF);			//中断入栈保护
	mov	_A_BUFF,a
	swap	_A_BUFF
	swapa	STATUS
	mov	_R3_BUFF,a
;	.line	84; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	if(TCIF )					//判断TCIF是否为1
	JBTS	_ISRbits,0
	JMP	_00121_DS_
;	.line	86; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	TCC	  += 0x06;				//1/2 * 8 * (256-6) = 1000us	公式：1/IRC频率 * 预分频 * （256-初值）
	MOV	A,@0x06
	ADD	_TCC,A
;	.line	87; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	ISR    = 0xfe;				//清TC0中断标志位
	MOV	A,@0xfe
	MOV	_ISR,A
_00121_DS_:
;	.line	90; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	if(EXIF)					//判断EXIF是否为1,外部中断
	JBTS	_ISRbits,2
	JMP	_00123_DS_
;	.line	92; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	ISR    = 0xfb;				//清EXIF中断标志位
	MOV	A,@0xfb
	MOV	_ISR,A
_00123_DS_:
;	.line	95; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	if(ICIF)					//判断ICIF是否为1,端口变化中断
	JBTS	_ISRbits,1
	JMP	_00125_DS_
;	.line	97; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	ISR    = 0xfd;				//清ICIF中断标志位
	MOV	A,@0xfd
	MOV	_ISR,A
_00125_DS_:
;	.line	101; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	if(T1IF)					//判断T1IF是否为1,pwm周期中断
	JBTS	_ISRbits,3
	JMP	_00127_DS_
;	.line	103; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	ISR    = 0xf7;				//ISR的bit3:T1IF清零
	MOV	A,@0xf7
	MOV	_ISR,A
_00127_DS_:
;	.line	107; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	POP(_A_BUFF,_R3_BUFF);			//中断出栈保护恢复
	swapa	_R3_BUFF
	mov	STATUS,a
	swapa	_A_BUFF
;	.line	108; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	}
END_OF_INTERRUPT:
	RETI	

;--------------------------------------------------------
; code
;--------------------------------------------------------
code_XC8P8600_INTERRUPT	code
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
S_XC8P8600_INTERRUPT__main	code
_main:	;Function start
; 2 exit points
;	.line	115; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	file_clrRam();					//清RAM
	CALL	_file_clrRam
;	.line	116; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	file_init();					//io寄存器初始化
	CALL	_file_init
;	.line	117; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	file_project_init();			//程序所需功能设置
	CALL	_file_project_init
;	.line	118; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	EI();							//打开总中断
	ei	
_00133_DS_:
;	.line	122; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	NOP();
	nop	
;	.line	123; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	NOP();
	nop	
;	.line	124; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	NOP();
	nop	
	JMP	_00133_DS_
;	.line	126; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	}
	RET	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_XC8P8600_INTERRUPT__file_project_init	code
_file_project_init:	;Function start
; 2 exit points
;	.line	71; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	IOCP_W(IMR,0x09);		//TCC+PWM周期中断 	
	mov	a,@0x09
	iw	IMR
;	.line	72; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	PWMCON = 0x88;			//pwm=1/8*2(分频)*4clock*100=100us
	MOV	A,@0x88
	MOV	_PWMCON,A
;	.line	73; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	PRD = 100;				//PWM周期寄存器
	MOV	A,@0x64
	MOV	_PRD,A
;	.line	74; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	}
	RET	
; exit point of _file_project_init

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_XC8P8600_INTERRUPT__file_init	code
_file_init:	;Function start
; 2 exit points
;	.line	38; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	CONTW(0x02);			//TCC 8分频
	mov	a,@0x02
	ctw
;	.line	39; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	TCC = data_tcc;			//1/2 * 8 * (256-6) = 1000us	公式：1/IRC频率 * 预分频 * （256-初值）
	MOV	A,@0x06
	MOV	_TCC,A
;	.line	40; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	PORT6 = 0;				//P6口输出低
	CLR	_PORT6
;	.line	41; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	IOCP_W(P6CR,0x08);		//P6口设为输出
	mov	a,@0x08
	iw	P6CR
;	.line	42; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	IOCP_W(PHDCR,0xff);		//端口上下拉控制寄存器，bit7-bit4对应P67-P64下拉;bit3-bit0对应P53-P50上拉 
	mov	a,@0xff
	iw	PHDCR
;	.line	43; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	IOCP_W(PDCR,0xff);		//端口下拉控制寄存器，  bit6-bit4对应P62-P60,bit3-bit0对应P53-P50
	mov	a,@0xff
	iw	PDCR
;	.line	44; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	IOCP_W(PHCR,0xff);		//P6端口上拉控制寄存器  bit7-bit0对应P67-P60
	mov	a,@0xff
	iw	PHCR
;	.line	45; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	IOCP_W(WDTCR,0x00);		//WDT 使能控制寄存器
	mov	a,@0x00
	iw	WDTCR
;	.line	46; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	IOCP_W(IMR,0x01);		//中断使能控制寄存器 
	mov	a,@0x01
	iw	IMR
;	.line	47; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	ISR = 0x0;				//清TC0中断标志位 
	CLR	_ISR
;	.line	48; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	}
	RET	
; exit point of _file_init

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_XC8P8600_INTERRUPT__file_clrRam	code
_file_clrRam:	;Function start
; 2 exit points
;	.line	29; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	for(RSR=0x90;RSR<0xFF;RSR++)	//清零 BANK0 RAM  IAR-R0,RSR-R4
	MOV	A,@0x90
	MOV	_RSR,A
_00107_DS_:
	MOV	A,@0xff
	SUB	A,_RSR
	JBTC	STATUS,0
	JMP	_00105_DS_
;	.line	30; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	{IAR = 0;}
	CLR	_IAR
;	.line	29; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	for(RSR=0x90;RSR<0xFF;RSR++)	//清零 BANK0 RAM  IAR-R0,RSR-R4
	INC	_RSR
	JMP	_00107_DS_
_00105_DS_:
;	.line	31; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	IAR = 0;
	CLR	_IAR
;	.line	32; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	}
	RET	
; exit point of _file_clrRam


;	code size estimation:
;	   45+    0 =    45 instructions (   90 byte)

	end
