;--------------------------------------------------------
; File Created by SLCC : free open source ANSI-C Compiler
; Version 3.6.0 #Jan 18 2022 (MSVC)
;--------------------------------------------------------
; SL port for the RISC core
;--------------------------------------------------------
;	.file	"E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\7_XC8P8600_内置电压基准输出\SOURCEFILES2.C"
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
	global	_TCC_Init
	global	_IO_Init
	global	_CLR_RAM
	global	_ADC_Init
	global	_main
	global	_int_isr
	global	_RegADCDang
	global	_BIT_FLAG
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
UD_SOURCEFILES2_0	udata
_RegADCDang	res	1

UD_SOURCEFILES2_1	udata
_BIT_FLAG	res	1

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
UD_abs_SOURCEFILES2_10	udata_ovr	0x0010
_A_BUFF
	res	1
UD_abs_SOURCEFILES2_11	udata_ovr	0x0011
_R3_BUFF
	res	1
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

;@Allocation info for local variables in function 'CLR_RAM'
;@CLR_RAM IO_Init                   Allocated to registers ;size:2
;@CLR_RAM TCC_Init                  Allocated to registers ;size:2
;@CLR_RAM IARbits                   Allocated to registers ;size:1
;@CLR_RAM TCCbits                   Allocated to registers ;size:1
;@CLR_RAM PCLbits                   Allocated to registers ;size:1
;@CLR_RAM STATUSbits                Allocated to registers ;size:1
;@CLR_RAM RSRbits                   Allocated to registers ;size:1
;@CLR_RAM PORT6bits                 Allocated to registers ;size:1
;@CLR_RAM ADCONbits                 Allocated to registers ;size:1
;@CLR_RAM PWMCONbits                Allocated to registers ;size:1
;@CLR_RAM PRDbits                   Allocated to registers ;size:1
;@CLR_RAM PDC1bits                  Allocated to registers ;size:1
;@CLR_RAM PDC2bits                  Allocated to registers ;size:1
;@CLR_RAM PDC3bits                  Allocated to registers ;size:1
;@CLR_RAM ICIECRbits                Allocated to registers ;size:1
;@CLR_RAM CPUCONbits                Allocated to registers ;size:1
;@CLR_RAM ISRbits                   Allocated to registers ;size:1
;@CLR_RAM RegADCDang                Allocated to registers ;size:1
;@CLR_RAM BIT_FLAG                  Allocated to registers ;size:1
;@CLR_RAM A_BUFF                    Allocated to registers ;size:1
;@CLR_RAM R3_BUFF                   Allocated to registers ;size:1
;@CLR_RAM IAR                       Allocated to registers ;size:1
;@CLR_RAM TCC                       Allocated to registers ;size:1
;@CLR_RAM PCL                       Allocated to registers ;size:1
;@CLR_RAM STATUS                    Allocated to registers ;size:1
;@CLR_RAM RSR                       Allocated to registers ;size:1
;@CLR_RAM PORT6                     Allocated to registers ;size:1
;@CLR_RAM ADCON                     Allocated to registers ;size:1
;@CLR_RAM PWMCON                    Allocated to registers ;size:1
;@CLR_RAM PRD                       Allocated to registers ;size:1
;@CLR_RAM PDC1                      Allocated to registers ;size:1
;@CLR_RAM PDC2                      Allocated to registers ;size:1
;@CLR_RAM PDC3                      Allocated to registers ;size:1
;@CLR_RAM ICIECR                    Allocated to registers ;size:1
;@CLR_RAM CPUCON                    Allocated to registers ;size:1
;@CLR_RAM ISR                       Allocated to registers ;size:1
;@end Allocation info for local variables in function 'CLR_RAM';

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
;	.line	108; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\7_XC8P8600_内置电压基准输出\SOURCEFILES2.C	__asm__("org 0x08");
	org	0x08
;	.line	109; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\7_XC8P8600_内置电压基准输出\SOURCEFILES2.C	PUSH(_A_BUFF,_R3_BUFF);			//中断入栈保护
	mov	_A_BUFF,a
	swap	_A_BUFF
	swapa	STATUS
	mov	_R3_BUFF,a
;	.line	111; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\7_XC8P8600_内置电压基准输出\SOURCEFILES2.C	if(TCIF)					//判断TCIF是否为1
	JBTS	_ISRbits,0
	JMP	_00131_DS_
;	.line	113; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\7_XC8P8600_内置电压基准输出\SOURCEFILES2.C	ISR = 0x00;					//清TC0中断标志位
	CLR	_ISR
;	.line	114; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\7_XC8P8600_内置电压基准输出\SOURCEFILES2.C	TCC += 0x06;				//1/2 * 8 * (256-6) = 1000us	公式：1/IRC频率 * 预分频 * （256-初值）		
	MOV	A,@0x06
	ADD	_TCC,A
;	.line	115; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\7_XC8P8600_内置电压基准输出\SOURCEFILES2.C	BitTCCEnable=1;
	BTS	_BIT_FLAG,0
_00131_DS_:
;	.line	118; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\7_XC8P8600_内置电压基准输出\SOURCEFILES2.C	POP(_A_BUFF,_R3_BUFF);			//中断出栈保护恢复
	swapa	_R3_BUFF
	mov	STATUS,a
	swapa	_A_BUFF
;	.line	119; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\7_XC8P8600_内置电压基准输出\SOURCEFILES2.C	}
END_OF_INTERRUPT:
	RETI	

;--------------------------------------------------------
; code
;--------------------------------------------------------
code_SOURCEFILES2	code
;***
;  pBlock Stats: dbName = M
;***
;has an exit
;functions called:
;   _CLR_RAM
;   _IO_Init
;   _TCC_Init
;   _ADC_Init
;   _CLR_RAM
;   _IO_Init
;   _TCC_Init
;   _ADC_Init
;; Starting pCode block
S_SOURCEFILES2__main	code
_main:	;Function start
; 2 exit points
;	.line	83; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\7_XC8P8600_内置电压基准输出\SOURCEFILES2.C	CLR_RAM();
	CALL	_CLR_RAM
;	.line	84; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\7_XC8P8600_内置电压基准输出\SOURCEFILES2.C	BitADCEnable=0;
	BTC	_BIT_FLAG,1
;	.line	85; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\7_XC8P8600_内置电压基准输出\SOURCEFILES2.C	RegADCDang=0;
	CLR	_RegADCDang
;	.line	86; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\7_XC8P8600_内置电压基准输出\SOURCEFILES2.C	IO_Init();
	CALL	_IO_Init
;	.line	87; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\7_XC8P8600_内置电压基准输出\SOURCEFILES2.C	TCC_Init();
	CALL	_TCC_Init
;	.line	88; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\7_XC8P8600_内置电压基准输出\SOURCEFILES2.C	ADC_Init();
	CALL	_ADC_Init
;	.line	89; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\7_XC8P8600_内置电压基准输出\SOURCEFILES2.C	EI();										//打开总中断
	ei	
_00125_DS_:
;	.line	92; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\7_XC8P8600_内置电压基准输出\SOURCEFILES2.C	NOP();	
	nop	
;	.line	93; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\7_XC8P8600_内置电压基准输出\SOURCEFILES2.C	PORT6_5 = 1; //adc内置基准电压
	BTS	_PORT6bits,5
;	.line	94; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\7_XC8P8600_内置电压基准输出\SOURCEFILES2.C	PORT6_4= 1;	 //vdd电压
	BTS	_PORT6bits,4
	JMP	_00125_DS_
;	.line	101; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\7_XC8P8600_内置电压基准输出\SOURCEFILES2.C	}
	RET	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_SOURCEFILES2__ADC_Init	code
_ADC_Init:	;Function start
; 2 exit points
;	.line	72; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\7_XC8P8600_内置电压基准输出\SOURCEFILES2.C	IOCP_W(ADPS,0x10);				//AD0设置为模拟输入口
	mov	a,@0x10
	iw	ADPS
;	.line	73; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\7_XC8P8600_内置电压基准输出\SOURCEFILES2.C	IOCP_W(ADCVS,0x02);				//ADC时钟：Fosc/16; ADC通道：AD0(P60); 内部基准电压：3V
	mov	a,@0x02
	iw	ADCVS
;	.line	75; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\7_XC8P8600_内置电压基准输出\SOURCEFILES2.C	ADCON = 0x40;					//ADC使能
	MOV	A,@0x40
	MOV	_ADCON,A
;	.line	76; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\7_XC8P8600_内置电压基准输出\SOURCEFILES2.C	}
	RET	
; exit point of _ADC_Init

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_SOURCEFILES2__TCC_Init	code
_TCC_Init:	;Function start
; 2 exit points
;	.line	59; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\7_XC8P8600_内置电压基准输出\SOURCEFILES2.C	CONTW(0x02);					//TCC 8分频
	mov	a,@0x02
	ctw
;	.line	60; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\7_XC8P8600_内置电压基准输出\SOURCEFILES2.C	IOCP_W(WDTCR,0X10);				//P65输出基准电压使能
	mov	a,@0X10
	iw	WDTCR
;	.line	61; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\7_XC8P8600_内置电压基准输出\SOURCEFILES2.C	TCC = 0x06;						//1/2 * 8 * (256-6) = 1000us	公式：1/IRC频率 * 预分频 * （256-初值）
	MOV	A,@0x06
	MOV	_TCC,A
;	.line	62; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\7_XC8P8600_内置电压基准输出\SOURCEFILES2.C	ISR = 0xfe;						//清TC0中断标志位
	MOV	A,@0xfe
	MOV	_ISR,A
;	.line	63; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\7_XC8P8600_内置电压基准输出\SOURCEFILES2.C	IOCP_W(IMR,0x01);				//使能TCC
	mov	a,@0x01
	iw	IMR
;	.line	64; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\7_XC8P8600_内置电压基准输出\SOURCEFILES2.C	}
	RET	
; exit point of _TCC_Init

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_SOURCEFILES2__IO_Init	code
_IO_Init:	;Function start
; 2 exit points
;	.line	48; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\7_XC8P8600_内置电压基准输出\SOURCEFILES2.C	PORT6 = 0x00;					//P6口输出低
	CLR	_PORT6
;	.line	49; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\7_XC8P8600_内置电压基准输出\SOURCEFILES2.C	IOCP_W(P6CR,0x00);				//P6口设为输出
	mov	a,@0x00
	iw	P6CR
;	.line	50; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\7_XC8P8600_内置电压基准输出\SOURCEFILES2.C	IOCP_W(PDCR,0XFF);				//下拉关闭
	mov	a,@0XFF
	iw	PDCR
;	.line	51; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\7_XC8P8600_内置电压基准输出\SOURCEFILES2.C	IOCP_W(PHCR,0XFF);				//上拉关闭
	mov	a,@0XFF
	iw	PHCR
;	.line	52; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\7_XC8P8600_内置电压基准输出\SOURCEFILES2.C	}
	RET	
; exit point of _IO_Init

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_SOURCEFILES2__CLR_RAM	code
_CLR_RAM:	;Function start
; 2 exit points
;	.line	38; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\7_XC8P8600_内置电压基准输出\SOURCEFILES2.C	for(RSR=0x90;RSR<0xCF;RSR++)	//清零 BANK0 RAM
	MOV	A,@0x90
	MOV	_RSR,A
_00107_DS_:
	MOV	A,@0xcf
	SUB	A,_RSR
	JBTC	STATUS,0
	JMP	_00105_DS_
;	.line	39; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\7_XC8P8600_内置电压基准输出\SOURCEFILES2.C	{IAR=0;}
	CLR	_IAR
;	.line	38; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\7_XC8P8600_内置电压基准输出\SOURCEFILES2.C	for(RSR=0x90;RSR<0xCF;RSR++)	//清零 BANK0 RAM
	INC	_RSR
	JMP	_00107_DS_
_00105_DS_:
;	.line	40; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\7_XC8P8600_内置电压基准输出\SOURCEFILES2.C	IAR	= 0;
	CLR	_IAR
;	.line	41; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\7_XC8P8600_内置电压基准输出\SOURCEFILES2.C	}
	RET	
; exit point of _CLR_RAM


;	code size estimation:
;	   38+    0 =    38 instructions (   76 byte)

	end
