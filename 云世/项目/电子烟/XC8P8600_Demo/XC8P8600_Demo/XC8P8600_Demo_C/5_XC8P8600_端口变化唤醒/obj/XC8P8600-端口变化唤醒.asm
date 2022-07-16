;--------------------------------------------------------
; File Created by SLCC : free open source ANSI-C Compiler
; Version 3.6.0 #Jan 18 2022 (MSVC)
;--------------------------------------------------------
; SL port for the RISC core
;--------------------------------------------------------
;	.file	"E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C"
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
	global	_file_scanKey
	global	_file_keyDeal
	global	_file_sleep
	global	_main
	global	_A_BUFF
	global	_R3_BUFF
	global	_reg_keyCont
	global	_reg_sleep_cnt
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
UD_XC8P8600______________0	udata
_reg_keyCont	res	1

UD_XC8P8600______________1	udata
_reg_sleep_cnt	res	1

UD_XC8P8600______________2	udata
_flag_mode	res	1

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
UD_abs_XC8P8600______________10	udata_ovr	0x0010
_A_BUFF
	res	1
UD_abs_XC8P8600______________11	udata_ovr	0x0011
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
;@file_clrRam reg_keyCont               Allocated to registers ;size:1
;@file_clrRam reg_sleep_cnt             Allocated to registers ;size:1
;@file_clrRam flag_mode                 Allocated to registers ;size:1
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
;	.line	60; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	__asm__("org 0x08");			//中断入口地址			
	org	0x08
;	.line	61; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	PUSH(_A_BUFF,_R3_BUFF);			//中断入栈保护
	mov	_A_BUFF,a
	swap	_A_BUFF
	swapa	STATUS
	mov	_R3_BUFF,a
;	.line	63; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	if(TCIF)					//判断TCIF是否为1
	JBTS	_ISRbits,0
	JMP	_00121_DS_
;	.line	65; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	TCC	  += 0x06;				//1/2 * 8 * (256-6) = 1000us	公式：1/IRC频率 * 预分频 * （256-初值）
	MOV	A,@0x06
	ADD	_TCC,A
;	.line	66; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	ISR    = 0xfe;				//清TC0中断标志位
	MOV	A,@0xfe
	MOV	_ISR,A
_00121_DS_:
;	.line	70; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	POP(_A_BUFF,_R3_BUFF);			//中断出栈保护恢复
	swapa	_R3_BUFF
	mov	STATUS,a
	swapa	_A_BUFF
;	.line	71; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	}
END_OF_INTERRUPT:
	RETI	

;--------------------------------------------------------
; code
;--------------------------------------------------------
code_XC8P8600_____________	code
;***
;  pBlock Stats: dbName = M
;***
;has an exit
;functions called:
;   _file_clrRam
;   _file_init
;   _file_project_init
;   _file_scanKey
;   _file_keyDeal
;   _file_sleep
;   _file_clrRam
;   _file_init
;   _file_project_init
;   _file_scanKey
;   _file_keyDeal
;   _file_sleep
;; Starting pCode block
S_XC8P8600_______________main	code
_main:	;Function start
; 2 exit points
;	.line	163; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	file_clrRam();					//清RAM
	CALL	_file_clrRam
;	.line	164; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	file_init();					//io寄存器初始化
	CALL	_file_init
;	.line	165; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	file_project_init();			//程序所需功能设置
	CALL	_file_project_init
;	.line	166; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	EI();							//打开总中断
	ei	
_00166_DS_:
;	.line	171; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	file_scanKey();
	CALL	_file_scanKey
;	.line	172; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	file_keyDeal();
	CALL	_file_keyDeal
;	.line	173; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	file_sleep();
	CALL	_file_sleep
;	.line	174; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	NOP();
	nop	
;	.line	175; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	NOP();
	nop	
;	.line	176; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	NOP();
	nop	
	JMP	_00166_DS_
;	.line	178; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	}
	RET	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_XC8P8600_______________file_sleep	code
_file_sleep:	;Function start
; 2 exit points
;	.line	125; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	if((io_key)&&(!bit_keyPress))
	JBTS	_PORT6bits,3
	JMP	_00157_DS_
	JBTC	_flag_mode,3
	JMP	_00157_DS_
;	.line	127; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	reg_sleep_cnt++;
	INC	_reg_sleep_cnt
;	.line	128; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	if(reg_sleep_cnt>=100) //50ms
	MOV	A,@0x64
	SUB	A,_reg_sleep_cnt
	JBTS	STATUS,0
	JMP	_00160_DS_
;	.line	130; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	reg_sleep_cnt=0;
	CLR	_reg_sleep_cnt
;	.line	131; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	ICIECR=0X08;		//P63端口独立唤醒 //当 OPTION 选项【 P6 端口唤醒】 为【独立控制（寄存器为 0x0D）】 时有效
	MOV	A,@0x08
	MOV	_ICIECR,A
;	.line	132; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	TCC=0;
	CLR	_TCC
;	.line	134; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	IOCP_W(WDTCR,0x00);	
	mov	a,@0x00
	iw	WDTCR
;	.line	135; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	ISR	=0;
	CLR	_ISR
;	.line	136; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	DI();				//禁止唤醒进入中断
	di	
;	.line	137; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	IOCP_W(IMR,0x02);
	mov	a,@0x02
	iw	IMR
;	.line	138; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	SLEEP();
	sleep	
;	.line	139; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	NOP(); 
	nop	
;	.line	140; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	NOP();
	nop	
;	.line	141; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	NOP();
	nop	
;	.line	142; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	NOP();
	nop	
;	.line	143; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	CWDT();
	CWDT	
;	.line	145; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	CONTW(0x02);
	mov	a,@0x02
	ctw
;	.line	146; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	IOCP_W(WDTCR,0x00);
	mov	a,@0x00
	iw	WDTCR
;	.line	147; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	IOCP_W(IMR,0x01);
	mov	a,@0x01
	iw	IMR
;	.line	148; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	TCC = data_tcc;
	MOV	A,@0x06
	MOV	_TCC,A
;	.line	149; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	EI();
	ei	
;	.line	150; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	ISR=0;
	CLR	_ISR
	JMP	_00160_DS_
_00157_DS_:
;	.line	155; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	reg_sleep_cnt=0;
	CLR	_reg_sleep_cnt
;	.line	157; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	}
_00160_DS_:
	RET	
; exit point of _file_sleep

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_XC8P8600_______________file_keyDeal	code
_file_keyDeal:	;Function start
; 2 exit points
;	.line	96; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	if(bit_keyPress)
	JBTS	_flag_mode,3
	JMP	_00147_DS_
;	.line	98; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	if(!bit_keyPress_deal) //按键未处理
	JBTC	_flag_mode,4
	JMP	_00149_DS_
;	.line	100; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	bit_keyPress_deal=1;
	BTS	_flag_mode,4
;	.line	101; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	if(bit_modeOpen)
	JBTS	_flag_mode,0
	JMP	_00142_DS_
;	.line	103; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	bit_modeOpen=0;
	BTC	_flag_mode,0
;	.line	104; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	io_led2Out=0;
	BTC	_PORT6bits,1
	JMP	_00149_DS_
_00142_DS_:
;	.line	108; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	bit_modeOpen=1;
	BTS	_flag_mode,0
;	.line	109; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	io_led2Out=1;			
	BTS	_PORT6bits,1
	JMP	_00149_DS_
_00147_DS_:
;	.line	116; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	bit_keyPress_deal=0;
	BTC	_flag_mode,4
;	.line	119; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	}
_00149_DS_:
	RET	
; exit point of _file_keyDeal

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_XC8P8600_______________file_scanKey	code
_file_scanKey:	;Function start
; 2 exit points
;	.line	75; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	if(((io_key)&&(!bit_keyPress))||((!io_key)&&(bit_keyPress)))
	JBTS	_PORT6bits,3
	JMP	_00130_DS_
	JBTS	_flag_mode,3
	JMP	_00126_DS_
_00130_DS_:
	JBTC	_PORT6bits,3
	JMP	_00127_DS_
	JBTS	_flag_mode,3
	JMP	_00127_DS_
_00126_DS_:
;	.line	77; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	reg_keyCont=0;
	CLR	_reg_keyCont
_00127_DS_:
;	.line	79; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	if(++reg_keyCont>=10)
	INC	_reg_keyCont
	MOV	A,@0x0a
	SUB	A,_reg_keyCont
	JBTS	STATUS,0
	JMP	_00136_DS_
;	.line	81; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	reg_keyCont=0;			//;滤波结束
	CLR	_reg_keyCont
;	.line	82; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	if(io_key==0)
	JBTC	_PORT6bits,3
	JMP	_00132_DS_
;	.line	84; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	bit_keyPress=1;		//;置按键按下标志位
	BTS	_flag_mode,3
	JMP	_00136_DS_
_00132_DS_:
;	.line	87; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	bit_keyPress=0;		//;清按键按下标志位	    
	BTC	_flag_mode,3
;	.line	89; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	}
_00136_DS_:
	RET	
; exit point of _file_scanKey

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_XC8P8600_______________file_project_init	code
_file_project_init:	;Function start
; 2 exit points
;	.line	54; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	}
;	.line	54; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	}
	RET	
; exit point of _file_project_init

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_XC8P8600_______________file_init	code
_file_init:	;Function start
; 2 exit points
;	.line	38; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	CONTW(0x02);			//TCC 8分频
	mov	a,@0x02
	ctw
;	.line	39; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	TCC = data_tcc;			//1/2 * 8 * (256-6) = 1000us	公式：1/IRC频率 * 预分频 * （256-初值）
	MOV	A,@0x06
	MOV	_TCC,A
;	.line	40; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	PORT6 = 0;				//P6口输出低
	CLR	_PORT6
;	.line	41; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	IOCP_W(P6CR,0x08);		//P6口设为输出
	mov	a,@0x08
	iw	P6CR
;	.line	42; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	IOCP_W(PHDCR,0xff);		//端口上下拉控制寄存器，bit7-bit4对应P67-P64下拉;bit3-bit0对应P53-P50上拉 
	mov	a,@0xff
	iw	PHDCR
;	.line	43; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	IOCP_W(PDCR,0xff);		//端口下拉控制寄存器，  bit6-bit4对应P62-P60,bit3-bit0对应P53-P50
	mov	a,@0xff
	iw	PDCR
;	.line	44; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	IOCP_W(PHCR,0xff);		//P6端口上拉控制寄存器  bit7-bit0对应P67-P60
	mov	a,@0xff
	iw	PHCR
;	.line	45; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	IOCP_W(WDTCR,0x00);		//WDT 使能控制寄存器
	mov	a,@0x00
	iw	WDTCR
;	.line	46; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	IOCP_W(IMR,0x01);		//中断使能控制寄存器 
	mov	a,@0x01
	iw	IMR
;	.line	47; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	ISR = 0x0;				//清TC0中断标志位 
	CLR	_ISR
;	.line	48; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	}
	RET	
; exit point of _file_init

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_XC8P8600_______________file_clrRam	code
_file_clrRam:	;Function start
; 2 exit points
;	.line	29; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	for(RSR=0x90;RSR<0xFF;RSR++)	//清零 BANK0 RAM  IAR-R0,RSR-R4
	MOV	A,@0x90
	MOV	_RSR,A
_00107_DS_:
	MOV	A,@0xff
	SUB	A,_RSR
	JBTC	STATUS,0
	JMP	_00105_DS_
;	.line	30; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	{IAR = 0;}
	CLR	_IAR
;	.line	29; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	for(RSR=0x90;RSR<0xFF;RSR++)	//清零 BANK0 RAM  IAR-R0,RSR-R4
	INC	_RSR
	JMP	_00107_DS_
_00105_DS_:
;	.line	31; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	IAR = 0;
	CLR	_IAR
;	.line	32; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	}
	RET	
; exit point of _file_clrRam


;	code size estimation:
;	   88+    0 =    88 instructions (  176 byte)

	end
