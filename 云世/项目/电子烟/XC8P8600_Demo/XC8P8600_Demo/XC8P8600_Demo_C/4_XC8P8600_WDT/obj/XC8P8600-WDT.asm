;--------------------------------------------------------
; File Created by SLCC : free open source ANSI-C Compiler
; Version 3.6.0 #Jan 18 2022 (MSVC)
;--------------------------------------------------------
; SL port for the RISC core
;--------------------------------------------------------
;	.file	"E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C"
	list	p=XC8P8600
	radix dec
	include "XC8P8600.inc"
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_delayUs
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
	global	_file_WDTTime
	global	_file_WDTWake_slep
	global	_main
	global	_A_BUFF
	global	_R3_BUFF
	global	_reg_sleep_cnt

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
UD_XC8P8600_WDT_0	udata
_reg_sleep_cnt	res	1

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
UD_abs_XC8P8600_WDT_10	udata_ovr	0x0010
_A_BUFF
	res	1
UD_abs_XC8P8600_WDT_11	udata_ovr	0x0011
_R3_BUFF
	res	1
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_XC8P8600_WDT_0	udata
r0x1001	res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

;@Allocation info for local variables in function 'file_clrRam'
;@file_clrRam delayUs                   Allocated to registers ;size:2
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
;@file_clrRam reg_sleep_cnt             Allocated to registers ;size:1
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
;2 compiler assigned registers:
;   r0x1001
;   r0x1002
;; Starting pCode block
_int_isr:	;Function start
; 0 exit points
;	.line	59; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	__asm__("org 0x08");			//中断入口地址			
	org	0x08
;	.line	60; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	PUSH(_A_BUFF,_R3_BUFF);			//中断入栈保护
	mov	_A_BUFF,a
	swap	_A_BUFF
	swapa	STATUS
	mov	_R3_BUFF,a
;	.line	62; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	if(TCIF)					//判断TCIF是否为1
	JBTS	_ISRbits,0
	JMP	_00121_DS_
;	.line	64; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	TCC	  += 0x06;				//1/2 * 8 * (256-6) = 1000us	公式：1/IRC频率 * 预分频 * （256-初值）
	MOV	A,@0x06
	ADD	_TCC,A
;	.line	65; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	ISR    = 0xfe;				//清TC0中断标志位
	MOV	A,@0xfe
	MOV	_ISR,A
;	.line	66; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	io_ledOut = !io_ledOut;		//P61口翻转
	CLR	r0x1001
	JBTC	_PORT6bits,0
	INC	r0x1001
	MOV	A,r0x1001
	MOV	A,@0x00
	JBTC	STATUS,2
	MOV	A,@0x01
	MOV	r0x1001,A
;;1	MOV	r0x1002,A
;;99	MOV	A,r0x1002
	RCA	r0x1001
	JBTS	STATUS,0
	BTC	_PORT6bits,0
	JBTC	STATUS,0
	BTS	_PORT6bits,0
_00121_DS_:
;	.line	69; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	POP(_A_BUFF,_R3_BUFF);			//中断出栈保护恢复
	swapa	_R3_BUFF
	mov	STATUS,a
	swapa	_A_BUFF
;	.line	70; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	}
END_OF_INTERRUPT:
	RETI	

;--------------------------------------------------------
; code
;--------------------------------------------------------
code_XC8P8600_WDT	code
;***
;  pBlock Stats: dbName = M
;***
;has an exit
;functions called:
;   _file_clrRam
;   _file_init
;   _file_project_init
;   _file_WDTTime
;   _file_WDTWake_slep
;   _file_clrRam
;   _file_init
;   _file_project_init
;   _file_WDTTime
;   _file_WDTWake_slep
;; Starting pCode block
S_XC8P8600_WDT__main	code
_main:	;Function start
; 2 exit points
;	.line	142; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	if(T)
	JBTS	_STATUSbits,4
	JMP	_00138_DS_
;	.line	144; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	file_clrRam();				//上电复位，反之WDT复位
	CALL	_file_clrRam
_00138_DS_:
;	.line	146; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	file_init();					//io寄存器初始化
	CALL	_file_init
;	.line	147; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	file_project_init();			//程序所需功能设置
	CALL	_file_project_init
;	.line	148; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	EI();							//打开总中断
	ei	
_00140_DS_:
;	.line	152; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	file_WDTTime();				//WDT定时
	CALL	_file_WDTTime
;	.line	153; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	file_WDTWake_slep();		//WDT唤醒睡眠
	CALL	_file_WDTWake_slep
;	.line	154; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	NOP();
	nop	
;	.line	155; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	NOP();
	nop	
;	.line	156; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	NOP();
	nop	
	JMP	_00140_DS_
;	.line	158; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	}
	RET	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_XC8P8600_WDT__file_WDTWake_slep	code
_file_WDTWake_slep:	;Function start
; 2 exit points
;	.line	93; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	IOCP_W(WDTCR,0x00);		 //;如果分频是由TCC切换而来，需要先关WDT 
	mov	a,@0x00
	iw	WDTCR
;	.line	95; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	IOCP_W(IMR,0x00);
	mov	a,@0x00
	iw	IMR
;	.line	96; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	ISR=0;
	CLR	_ISR
;	.line	97; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	CWDT();
	CWDT	
;	.line	98; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	CONTW(0x09);			//预分频分给wdt,2分频 
	mov	a,@0x09
	ctw
;	.line	99; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	IOCP_W(WDTCR,0x80);
	mov	a,@0x80
	iw	WDTCR
;	.line	100; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	DI();
	di	
;	.line	101; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	NOP();
	nop	
;	.line	102; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	SLEEP();
	sleep	
;	.line	103; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	NOP();
	nop	
;	.line	104; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	NOP();
	nop	
;	.line	105; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	}
	RET	
; exit point of _file_WDTWake_slep

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_XC8P8600_WDT__file_WDTTime	code
_file_WDTTime:	;Function start
; 2 exit points
;	.line	76; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	if(++reg_sleep_cnt>=10) // 
	INC	_reg_sleep_cnt
	MOV	A,@0x0a
	SUB	A,_reg_sleep_cnt
	JBTS	STATUS,0
	JMP	_00128_DS_
;	.line	78; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	reg_sleep_cnt=0;
	CLR	_reg_sleep_cnt
;	.line	79; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	io_led2Out =1;
	BTS	_PORT6bits,1
;	.line	81; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	NOP();
	nop	
;	.line	82; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	NOP();
	nop	
;	.line	84; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	io_led2Out =0;
	BTC	_PORT6bits,1
;	.line	86; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	}
_00128_DS_:
	RET	
; exit point of _file_WDTTime

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_XC8P8600_WDT__file_project_init	code
_file_project_init:	;Function start
; 2 exit points
;	.line	53; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	}
;	.line	53; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	}
	RET	
; exit point of _file_project_init

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_XC8P8600_WDT__file_init	code
_file_init:	;Function start
; 2 exit points
;	.line	37; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	CONTW(0x02);			//TCC 8分频
	mov	a,@0x02
	ctw
;	.line	38; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	TCC = data_tcc;			//1/2 * 8 * (256-6) = 1000us	公式：1/IRC频率 * 预分频 * （256-初值）
	MOV	A,@0x06
	MOV	_TCC,A
;	.line	39; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	PORT6 = 0;				//P6口输出低
	CLR	_PORT6
;	.line	40; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	IOCP_W(P6CR,0x08);		//P6口设为输出
	mov	a,@0x08
	iw	P6CR
;	.line	41; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	IOCP_W(PHDCR,0xff);		//端口上下拉控制寄存器，bit7-bit4对应P67-P64下拉;bit3-bit0对应P53-P50上拉 
	mov	a,@0xff
	iw	PHDCR
;	.line	42; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	IOCP_W(PDCR,0xff);		//端口下拉控制寄存器，  bit6-bit4对应P62-P60,bit3-bit0对应P53-P50
	mov	a,@0xff
	iw	PDCR
;	.line	43; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	IOCP_W(PHCR,0xff);		//P6端口上拉控制寄存器  bit7-bit0对应P67-P60
	mov	a,@0xff
	iw	PHCR
;	.line	44; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	IOCP_W(WDTCR,0x00);		//WDT 使能控制寄存器
	mov	a,@0x00
	iw	WDTCR
;	.line	45; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	IOCP_W(IMR,0x01);		//中断使能控制寄存器 
	mov	a,@0x01
	iw	IMR
;	.line	46; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	ISR = 0x0;				//清TC0中断标志位 
	CLR	_ISR
;	.line	47; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	}
	RET	
; exit point of _file_init

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_XC8P8600_WDT__file_clrRam	code
_file_clrRam:	;Function start
; 2 exit points
;	.line	28; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	for(RSR=0x90;RSR<0xFF;RSR++)	//清零 BANK0 RAM  IAR-R0,RSR-R4
	MOV	A,@0x90
	MOV	_RSR,A
_00107_DS_:
	MOV	A,@0xff
	SUB	A,_RSR
	JBTC	STATUS,0
	JMP	_00105_DS_
;	.line	29; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	{IAR = 0;}
	CLR	_IAR
;	.line	28; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	for(RSR=0x90;RSR<0xFF;RSR++)	//清零 BANK0 RAM  IAR-R0,RSR-R4
	INC	_RSR
	JMP	_00107_DS_
_00105_DS_:
;	.line	30; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	IAR = 0;
	CLR	_IAR
;	.line	31; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	}
	RET	
; exit point of _file_clrRam


;	code size estimation:
;	   57+    0 =    57 instructions (  114 byte)

	end
