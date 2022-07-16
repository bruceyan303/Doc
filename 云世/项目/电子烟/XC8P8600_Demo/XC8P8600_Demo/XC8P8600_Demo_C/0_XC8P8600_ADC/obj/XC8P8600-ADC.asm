;--------------------------------------------------------
; File Created by SLCC : free open source ANSI-C Compiler
; Version 3.6.0 #Jan 18 2022 (MSVC)
;--------------------------------------------------------
; SL port for the RISC core
;--------------------------------------------------------
;	.file	"E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C"
	list	p=XC8P8600
	radix dec
	include "XC8P8600.inc"
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	__moduint
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
	global	_int_isr
	global	_file_adc_read
	global	_file_adc_start
	global	_file_clrRam
	global	_file_init
	global	_file_project_init
	global	_main
	global	_A_BUFF
	global	_R3_BUFF
	global	_ADCDATA_COUNT
	global	_ADATH_TEMP
	global	_ADATL_TEMP
	global	_ADCDATA_TEMP
	global	_ADCDATA
	global	_ADCDATA_SUM
	global	_reg_contTime
	global	_flag_mode

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
UD_XC8P8600_ADC_0	udata
_ADCDATA_COUNT	res	1

UD_XC8P8600_ADC_1	udata
_ADATH_TEMP	res	1

UD_XC8P8600_ADC_2	udata
_ADATL_TEMP	res	1

UD_XC8P8600_ADC_3	udata
_ADCDATA_TEMP	res	2

UD_XC8P8600_ADC_4	udata
_ADCDATA	res	2

UD_XC8P8600_ADC_5	udata
_ADCDATA_SUM	res	2

UD_XC8P8600_ADC_6	udata
_reg_contTime	res	2

UD_XC8P8600_ADC_7	udata
_flag_mode	res	1

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
UD_abs_XC8P8600_ADC_10	udata_ovr	0x0010
_A_BUFF
	res	1
UD_abs_XC8P8600_ADC_11	udata_ovr	0x0011
_R3_BUFF
	res	1
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_XC8P8600_ADC_0	udata
r0x1010	res	1
r0x1011	res	1
r0x100C	res	1
r0x100D	res	1
r0x100E	res	1
r0x100F	res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

;@Allocation info for local variables in function 'int_isr'
;@int_isr int_isr                   Allocated to registers ;size:2
;@int_isr _moduint                  Allocated to registers ;size:2
;@int_isr IARbits                   Allocated to registers ;size:1
;@int_isr TCCbits                   Allocated to registers ;size:1
;@int_isr PCLbits                   Allocated to registers ;size:1
;@int_isr STATUSbits                Allocated to registers ;size:1
;@int_isr RSRbits                   Allocated to registers ;size:1
;@int_isr PORT6bits                 Allocated to registers ;size:1
;@int_isr ADCONbits                 Allocated to registers ;size:1
;@int_isr PWMCONbits                Allocated to registers ;size:1
;@int_isr PRDbits                   Allocated to registers ;size:1
;@int_isr PDC1bits                  Allocated to registers ;size:1
;@int_isr PDC2bits                  Allocated to registers ;size:1
;@int_isr PDC3bits                  Allocated to registers ;size:1
;@int_isr ICIECRbits                Allocated to registers ;size:1
;@int_isr CPUCONbits                Allocated to registers ;size:1
;@int_isr ISRbits                   Allocated to registers ;size:1
;@int_isr A_BUFF                    Allocated to registers ;size:1
;@int_isr R3_BUFF                   Allocated to registers ;size:1
;@int_isr ADCDATA_COUNT             Allocated to registers ;size:1
;@int_isr ADATH_TEMP                Allocated to registers ;size:1
;@int_isr ADATL_TEMP                Allocated to registers ;size:1
;@int_isr ADCDATA_TEMP              Allocated to registers ;size:2
;@int_isr ADCDATA                   Allocated to registers ;size:2
;@int_isr ADCDATA_SUM               Allocated to registers ;size:2
;@int_isr reg_contTime              Allocated to registers ;size:2
;@int_isr flag_mode                 Allocated to registers ;size:1
;@int_isr IAR                       Allocated to registers ;size:1
;@int_isr TCC                       Allocated to registers ;size:1
;@int_isr PCL                       Allocated to registers ;size:1
;@int_isr STATUS                    Allocated to registers ;size:1
;@int_isr RSR                       Allocated to registers ;size:1
;@int_isr PORT6                     Allocated to registers ;size:1
;@int_isr ADCON                     Allocated to registers ;size:1
;@int_isr PWMCON                    Allocated to registers ;size:1
;@int_isr PRD                       Allocated to registers ;size:1
;@int_isr PDC1                      Allocated to registers ;size:1
;@int_isr PDC2                      Allocated to registers ;size:1
;@int_isr PDC3                      Allocated to registers ;size:1
;@int_isr ICIECR                    Allocated to registers ;size:1
;@int_isr CPUCON                    Allocated to registers ;size:1
;@int_isr ISR                       Allocated to registers ;size:1
;@end Allocation info for local variables in function 'int_isr';

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
;functions called:
;   __moduint
;   __moduint
;5 compiler assigned registers:
;   r0x1010
;   r0x1011
;   STK02
;   STK01
;   STK00
;; Starting pCode block
_int_isr:	;Function start
; 0 exit points
;	.line	33; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	__asm__("org 0x08");			//中断入口地址			
	org	0x08
;	.line	34; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	PUSH(_A_BUFF,_R3_BUFF);			//中断入栈保护
	mov	_A_BUFF,a
	swap	_A_BUFF
	swapa	STATUS
	mov	_R3_BUFF,a
;	.line	36; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	if(TCIF)					//判断TCIF是否为1
	JBTS	_ISRbits,0
	JMP	_00110_DS_
;	.line	38; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	TCC	  += data_tcc;			//1/2 * 8 * (256-6) = 1000us	公式：1/IRC频率 * 预分频 * （256-初值）
	MOV	A,@0x06
	ADD	_TCC,A
;	.line	39; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	ISR    = 0xfe;				//清TC0中断标志位
	MOV	A,@0xfe
	MOV	_ISR,A
;	.line	40; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	io_ledOut = !io_ledOut;			//P61口翻转
	CLR	r0x1010
	JBTC	_PORT6bits,0
	INC	r0x1010
	MOV	A,r0x1010
	MOV	A,@0x00
	JBTC	STATUS,2
	MOV	A,@0x01
	MOV	r0x1010,A
	MOV	r0x1011,A
;;101	MOV	A,r0x1011
	RCA	r0x1010
	JBTS	STATUS,0
	BTC	_PORT6bits,0
	JBTC	STATUS,0
	BTS	_PORT6bits,0
;	.line	42; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	reg_contTime++;
	INC	_reg_contTime
	JBTC	STATUS,2
	INC	(_reg_contTime + 1)
;	.line	43; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	if((reg_contTime % 10) == 0)//每10ms,reg_contTime个位数为0成立			
	MOV	A,@0x0a
	MOV	STK02,A
	MOV	A,@0x00
	MOV	STK01,A
	MOV	A,_reg_contTime
	MOV	STK00,A
	MOV	A,(_reg_contTime + 1)
	CALL	__moduint
	MOV	r0x1011,A
	MOV	A,STK00
	MOV	r0x1010,A
	MOV	A,r0x1010
	OR	A,r0x1011
	JBTS	STATUS,2
	JMP	_00106_DS_
;	.line	45; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	bit_end10ms = 1;			
	BTS	_flag_mode,1
_00106_DS_:
;	.line	48; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	if(reg_contTime >= 500)		//每0.5s
	MOV	A,@0x01
	SUB	A,(_reg_contTime + 1)
	JBTS	STATUS,2
	JMP	_00127_DS_
	MOV	A,@0xf4
	SUB	A,_reg_contTime
_00127_DS_:
	JBTS	STATUS,0
	JMP	_00110_DS_
;	.line	50; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	reg_contTime = 0;
	CLR	_reg_contTime
	CLR	(_reg_contTime + 1)
;	.line	51; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	bit_end500ms = 1;
	BTS	_flag_mode,2
_00110_DS_:
;	.line	55; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	if(ADIF)					//AD采样中断
	JBTS	_ISRbits,4
	JMP	_00112_DS_
;	.line	57; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	ISR    = 0x0f;	
	MOV	A,@0x0f
	MOV	_ISR,A
;	.line	59; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	PORT6_4 = !PORT6_4;	
	CLR	r0x1010
	JBTC	_PORT6bits,4
	INC	r0x1010
	MOV	A,r0x1010
	MOV	A,@0x00
	JBTC	STATUS,2
	MOV	A,@0x01
	MOV	r0x1010,A
	MOV	r0x1011,A
;;99	MOV	A,r0x1011
	RCA	r0x1010
	JBTS	STATUS,0
	BTC	_PORT6bits,4
	JBTC	STATUS,0
	BTS	_PORT6bits,4
_00112_DS_:
;	.line	62; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	POP(_A_BUFF,_R3_BUFF);			//中断出栈保护恢复
	swapa	_R3_BUFF
	mov	STATUS,a
	swapa	_A_BUFF
;	.line	63; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	}
END_OF_INTERRUPT:
	RETI	

;--------------------------------------------------------
; code
;--------------------------------------------------------
code_XC8P8600_ADC	code
;***
;  pBlock Stats: dbName = M
;***
;has an exit
;functions called:
;   _file_clrRam
;   _file_init
;   _file_project_init
;   _file_adc_start
;   _file_clrRam
;   _file_init
;   _file_project_init
;   _file_adc_start
;; Starting pCode block
S_XC8P8600_ADC__main	code
_main:	;Function start
; 2 exit points
;	.line	147; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	file_clrRam();					//清RAM
	CALL	_file_clrRam
;	.line	148; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	file_init();					//io寄存器初始化
	CALL	_file_init
;	.line	149; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	file_project_init();			//程序所需功能设置
	CALL	_file_project_init
;	.line	150; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	EI();							//打开总中断
	ei	
_00162_DS_:
;	.line	153; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	if(bit_end10ms)
	JBTS	_flag_mode,1
	JMP	_00162_DS_
;	.line	155; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	bit_end10ms = 0;
	BTC	_flag_mode,1
;	.line	156; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	file_adc_start();		//每10ms，采集一次AD
	CALL	_file_adc_start
	JMP	_00162_DS_
;	.line	198; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	}
	RET	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_XC8P8600_ADC__file_project_init	code
_file_project_init:	;Function start
; 2 exit points
;	.line	137; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	IOCP_W(ADPS,0x80);		//AD3设置为模拟输入口
	mov	a,@0x80
	iw	ADPS
;	.line	138; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	IOCP_W(ADCVS,0x19);		//ADC时钟：Fosc/16; ADC通道：AD3(P65); 内部基准电压：4V
	mov	a,@0x19
	iw	ADCVS
;	.line	139; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	ADCON = 0x40;			//ADC使能
	MOV	A,@0x40
	MOV	_ADCON,A
;	.line	140; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	}
	RET	
; exit point of _file_project_init

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_XC8P8600_ADC__file_init	code
_file_init:	;Function start
; 2 exit points
;	.line	120; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	CONTW(0x02);			//TCC 8分频
	mov	a,@0x02
	ctw
;	.line	121; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	TCC = data_tcc;			//1/2 * 8 * (256-6) = 1000us	公式：1/IRC频率 * 预分频 * （256-初值）
	MOV	A,@0x06
	MOV	_TCC,A
;	.line	122; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	PORT6 = 0;				//P6口输出低
	CLR	_PORT6
;	.line	123; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	IOCP_W(P6CR,0x20);		//P65输入，其他口设为输出
	mov	a,@0x20
	iw	P6CR
;	.line	124; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	IOCP_W(PHDCR,0xff);		//端口上下拉控制寄存器，bit7-bit4对应P67-P64下拉;bit3-bit0对应P53-P50上拉 
	mov	a,@0xff
	iw	PHDCR
;	.line	125; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	IOCP_W(PDCR,0xff);		//端口下拉控制寄存器，  bit6-bit4对应P62-P60,bit3-bit0对应P53-P50
	mov	a,@0xff
	iw	PDCR
;	.line	126; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	IOCP_W(PHCR,0xff);		//P6端口上拉控制寄存器  bit7-bit0对应P67-P60
	mov	a,@0xff
	iw	PHCR
;	.line	127; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	IOCP_W(WDTCR,0x00);		//WDT 使能控制寄存器
	mov	a,@0x00
	iw	WDTCR
;	.line	128; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	IOCP_W(IMR,0x01);		//中断使能控制寄存器 
	mov	a,@0x01
	iw	IMR
;	.line	129; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	ISR = 0x0;				//清TC0中断标志位 
	CLR	_ISR
;	.line	130; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	}
	RET	
; exit point of _file_init

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_XC8P8600_ADC__file_clrRam	code
_file_clrRam:	;Function start
; 2 exit points
;	.line	111; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	for(RSR=0x90;RSR<0xCF;RSR++)	//清零 BANK0 RAM  IAR-R0,RSR-R4
	MOV	A,@0x90
	MOV	_RSR,A
_00146_DS_:
	MOV	A,@0xcf
	SUB	A,_RSR
	JBTC	STATUS,0
	JMP	_00144_DS_
;	.line	112; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	{IAR = 0;}
	CLR	_IAR
;	.line	111; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	for(RSR=0x90;RSR<0xCF;RSR++)	//清零 BANK0 RAM  IAR-R0,RSR-R4
	INC	_RSR
	JMP	_00146_DS_
_00144_DS_:
;	.line	113; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	IAR = 0;
	CLR	_IAR
;	.line	114; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	}
	RET	
; exit point of _file_clrRam

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _file_adc_read
;   _file_adc_read
;; Starting pCode block
S_XC8P8600_ADC__file_adc_start	code
_file_adc_start:	;Function start
; 2 exit points
;	.line	98; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	ADRUN = 1;												//使能AD转换
	BTS	_ADCONbits,7
_00139_DS_:
;	.line	99; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	while(ADRUN);											//等待转换完成
	JBTC	_ADCONbits,7
	JMP	_00139_DS_
;	.line	100; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	file_adc_read();
	CALL	_file_adc_read
;	.line	105; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	}
	RET	
; exit point of _file_adc_start

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;4 compiler assigned registers:
;   r0x100C
;   r0x100D
;   r0x100E
;   r0x100F
;; Starting pCode block
S_XC8P8600_ADC__file_adc_read	code
_file_adc_read:	;Function start
; 2 exit points
;	.line	80; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	IOCP_R(_ADATH_TEMP,ADATH);								//取AD转换值高8位
	ir	ADATH
	mov	_ADATH_TEMP,a
;	.line	81; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	IOCP_R(_ADATL_TEMP,ADATL);								//取AD转换值低8位
	ir	ADATL
	mov	_ADATL_TEMP,a
;	.line	82; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	ADCDATA_TEMP = ((ADATH_TEMP & 0xf0) << 4) + ADATL_TEMP;	//存放AD采集结果	
	MOV	A,@0xf0
	AND	A,_ADATH_TEMP
	MOV	r0x100D,A
	MOV	r0x100C,A
;;100	MOV	A,r0x100C
	CLR	r0x100E
	SWAPA	r0x100E
	AND	A,@0xf0
	MOV	r0x100F,A
	SWAPA	r0x100D
	MOV	r0x100C,A
	AND	A,@0x0f
	OR	r0x100F,A
	XOR	r0x100C,A
	MOV	A,_ADATL_TEMP
	MOV	r0x100D,A
	CLR	r0x100E
	MOV	A,r0x100D
	ADD	A,r0x100C
	MOV	_ADCDATA_TEMP,A
	MOV	A,r0x100F
	MOV	(_ADCDATA_TEMP + 1),A
	MOV	A,@0x00
	MOV	A,@0x00
	JBTC	STATUS,0
	IJA	r0x100E
	ADD	(_ADCDATA_TEMP + 1),A
;	.line	83; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	ADCDATA_SUM += ADCDATA_TEMP;							//累加8次求平均
	MOV	A,_ADCDATA_TEMP
	ADD	_ADCDATA_SUM,A
	MOV	A,(_ADCDATA_TEMP + 1)
	MOV	A,(_ADCDATA_TEMP + 1)
	JBTC	STATUS,0
	IJA	(_ADCDATA_TEMP + 1)
	ADD	(_ADCDATA_SUM + 1),A
;	.line	84; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	ADCDATA_COUNT ++;
	INC	_ADCDATA_COUNT
;	.line	85; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	if(ADCDATA_COUNT >= 8)
	MOV	A,@0x08
	SUB	A,_ADCDATA_COUNT
	JBTS	STATUS,0
	JMP	_00134_DS_
;	.line	87; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	ADCDATA_COUNT = 0;		
	CLR	_ADCDATA_COUNT
;	.line	88; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	ADCDATA = ADCDATA_SUM / 8;
	BTC	STATUS,0
	RCA	(_ADCDATA_SUM + 1)
	MOV	(_ADCDATA + 1),A
	RCA	_ADCDATA_SUM
	MOV	_ADCDATA,A
	BTC	STATUS,0
	RCR	(_ADCDATA + 1)
	RCR	_ADCDATA
	BTC	STATUS,0
	RCR	(_ADCDATA + 1)
	RCR	_ADCDATA
;	.line	89; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	ADCDATA_SUM = 0;
	CLR	_ADCDATA_SUM
	CLR	(_ADCDATA_SUM + 1)
;	.line	91; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	}
_00134_DS_:
	RET	
; exit point of _file_adc_read


;	code size estimation:
;	  155+    0 =   155 instructions (  310 byte)

	end
