;--------------------------------------------------------
; File Created by SLCC : free open source ANSI-C Compiler
; Version 3.6.0 #Dec 13 2021 (MSVC)
;--------------------------------------------------------
; SL port for the RISC core
;--------------------------------------------------------
;	.file	"E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C"
	list	p=XC8P9520
	radix dec
	include "XC8P9520.inc"
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_delayUs
	extern	_delayMs
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
UD_XC8P9520______________0	udata
_reg_keyCont	res	1

UD_XC8P9520______________1	udata
_reg_sleep_cnt	res	1

UD_XC8P9520______________2	udata
_flag_mode	res	1

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
UD_abs_XC8P9520______________10	udata_ovr	0x0010
_A_BUFF
	res	1
UD_abs_XC8P9520______________11	udata_ovr	0x0011
_R3_BUFF
	res	1
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_XC8P9520______________0	udata
r0x1005	res	1
r0x1006	res	1
r0x1003	res	1
r0x1004	res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

;@Allocation info for local variables in function 'file_clrRam'
;@file_clrRam delayUs                   Allocated to registers ;size:2
;@file_clrRam delayMs                   Allocated to registers ;size:2
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
;@file_clrRam reg_keyCont               Allocated to registers ;size:1
;@file_clrRam reg_sleep_cnt             Allocated to registers ;size:1
;@file_clrRam flag_mode                 Allocated to registers ;size:1
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
;   r0x1005
;   r0x1006
;; Starting pCode block
_int_isr:	;Function start
; 0 exit points
;	.line	62; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	__asm__("org 0x08");			//中断入口地址			
	org	0x08
;	.line	63; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	PUSH(_A_BUFF,_R3_BUFF);			//中断入栈保护
	mov	_A_BUFF,a
	swap	_A_BUFF
	swapa	STATUS
	mov	_R3_BUFF,a
;	.line	65; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	if(TCIF == 1)					//判断TCIF是否为1
	CLR	r0x1005
	JBTC	_ISRbits,0
	INC	r0x1005
;;108	MOV	A,r0x1005
;;107	MOV	A,r0x1006
	MOV	A,r0x1005
	MOV	r0x1006,A
	XOR	A,@0x01
	JBTS	STATUS,2
	JMP	_00121_DS_
;	.line	67; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	TCC	  += 0x06;				//1/2 * 8 * (256-6) = 1000us	公式：1/IRC频率 * 预分频 * （256-初值）
	MOV	A,@0x06
	ADD	_TCC,A
;	.line	68; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	ISR    = 0xfe;				//清TC0中断标志位
	MOV	A,@0xfe
	MOV	_ISR,A
;	.line	69; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	io_ledOut = !io_ledOut;			//P61口翻转
	CLR	r0x1005
	JBTC	_PORT6bits,0
	INC	r0x1005
	MOV	A,r0x1005
	MOV	A,@0x00
	JBTC	STATUS,2
	MOV	A,@0x01
	MOV	r0x1005,A
	MOV	r0x1006,A
;;102	MOV	A,r0x1006
	RCA	r0x1005
	JBTS	STATUS,0
	BTC	_PORT6bits,0
	JBTC	STATUS,0
	BTS	_PORT6bits,0
_00121_DS_:
;	.line	72; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	POP(_A_BUFF,_R3_BUFF);			//中断出栈保护恢复
	swapa	_R3_BUFF
	mov	STATUS,a
	swapa	_A_BUFF
;	.line	73; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	}
END_OF_INTERRUPT:
	RETI	

;--------------------------------------------------------
; code
;--------------------------------------------------------
code_XC8P9520_____________	code
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
S_XC8P9520_______________main	code
_main:	;Function start
; 2 exit points
;	.line	164; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	file_clrRam();					//清RAM
	CALL	_file_clrRam
;	.line	165; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	file_init();					//io寄存器初始化
	CALL	_file_init
;	.line	166; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	file_project_init();			//程序所需功能设置
	CALL	_file_project_init
;	.line	167; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	EI();							//打开总中断
	ei	
_00166_DS_:
;	.line	172; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	file_scanKey();
	CALL	_file_scanKey
;	.line	173; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	file_keyDeal();
	CALL	_file_keyDeal
;	.line	174; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	file_sleep();
	CALL	_file_sleep
;	.line	175; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	NOP();
	nop	
;	.line	176; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	NOP();
	nop	
;	.line	177; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	NOP();
	nop	
	JMP	_00166_DS_
;	.line	179; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	}
	RET	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;2 compiler assigned registers:
;   r0x1003
;   r0x1004
;; Starting pCode block
S_XC8P9520_______________file_sleep	code
_file_sleep:	;Function start
; 2 exit points
;	.line	126; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	if((io_key==1)&&(bit_keyPress==0))
	CLR	r0x1003
	JBTC	_PORT6bits,3
	INC	r0x1003
;;101	MOV	A,r0x1003
;;99	MOV	r0x1004,A
;;100	MOV	A,r0x1004
	MOV	A,r0x1003
	XOR	A,@0x01
	JBTS	STATUS,2
	JMP	_00157_DS_
	JBTC	_flag_mode,1
	JMP	_00157_DS_
;	.line	128; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	reg_sleep_cnt++;
	INC	_reg_sleep_cnt
;	.line	129; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	if(reg_sleep_cnt>=100) //50ms
	MOV	A,@0x64
	SUB	A,_reg_sleep_cnt
	JBTS	STATUS,0
	JMP	_00160_DS_
;	.line	131; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	reg_sleep_cnt=0;
	CLR	_reg_sleep_cnt
;	.line	132; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	ICIECR=0X08;		//P63端口独立唤醒
	MOV	A,@0x08
	MOV	_ICIECR,A
;	.line	133; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	TCC=0;
	CLR	_TCC
;	.line	135; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	IOCP_W(WDTCR,0x00);	
	mov	a,@0x00
	iw	WDTCR
;	.line	136; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	ISR	=0;
	CLR	_ISR
;	.line	137; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	DI();				//禁止唤醒进入中断
	di	
;	.line	138; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	IOCP_W(IMR,0x02);
	mov	a,@0x02
	iw	IMR
;	.line	139; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	SLEEP();
	sleep	
;	.line	140; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	NOP(); 
	nop	
;	.line	141; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	NOP();
	nop	
;	.line	142; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	NOP();
	nop	
;	.line	143; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	NOP();
	nop	
;	.line	144; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	CWDT();
	CWDT	
;	.line	146; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	CONTW(0x02);
	mov	a,@0x02
	ctw
;	.line	147; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	IOCP_W(WDTCR,0x00);
	mov	a,@0x00
	iw	WDTCR
;	.line	148; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	IOCP_W(IMR,0x01);
	mov	a,@0x01
	iw	IMR
;	.line	149; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	TCC = data_tcc;
	MOV	A,@0x06
	MOV	_TCC,A
;	.line	150; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	EI();
	ei	
;	.line	151; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	ISR=0;
	CLR	_ISR
	JMP	_00160_DS_
_00157_DS_:
;	.line	156; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	reg_sleep_cnt=0;
	CLR	_reg_sleep_cnt
;	.line	158; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	}
_00160_DS_:
	RET	
; exit point of _file_sleep

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;2 compiler assigned registers:
;   r0x1003
;   r0x1004
;; Starting pCode block
S_XC8P9520_______________file_keyDeal	code
_file_keyDeal:	;Function start
; 2 exit points
;	.line	98; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	if(bit_keyPress==1)
	CLR	r0x1003
	JBTC	_flag_mode,1
	INC	r0x1003
;;112	MOV	A,r0x1003
;;111	MOV	A,r0x1004
	MOV	A,r0x1003
	MOV	r0x1004,A
	XOR	A,@0x01
	JBTS	STATUS,2
	JMP	_00147_DS_
;	.line	100; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	if(bit_keyPress_deal==0) //按键未处理
	JBTC	_flag_mode,2
	JMP	_00149_DS_
;	.line	102; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	bit_keyPress_deal=1;
	BTS	_flag_mode,2
;	.line	103; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	if(bit_modeOpen==1)
	CLR	r0x1003
	JBTC	_flag_mode,0
	INC	r0x1003
;;106	MOV	A,r0x1003
;;105	MOV	A,r0x1004
	MOV	A,r0x1003
	MOV	r0x1004,A
	XOR	A,@0x01
	JBTS	STATUS,2
	JMP	_00142_DS_
;	.line	105; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	bit_modeOpen=0;
	BTC	_flag_mode,0
;	.line	106; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	io_led2Out=0;
	BTC	_PORT6bits,1
	JMP	_00149_DS_
_00142_DS_:
;	.line	110; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	bit_modeOpen=1;
	BTS	_flag_mode,0
;	.line	111; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	io_led2Out=1;			
	BTS	_PORT6bits,1
	JMP	_00149_DS_
_00147_DS_:
;	.line	117; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	bit_keyPress_deal=0;
	BTC	_flag_mode,2
;	.line	120; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	}
_00149_DS_:
	RET	
; exit point of _file_keyDeal

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;2 compiler assigned registers:
;   r0x1003
;   r0x1004
;; Starting pCode block
S_XC8P9520_______________file_scanKey	code
_file_scanKey:	;Function start
; 2 exit points
;	.line	77; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	if(((io_key==1)&&(bit_keyPress==0))||((io_key==0)&&(bit_keyPress==1)))
	CLR	r0x1003
	JBTC	_PORT6bits,3
	INC	r0x1003
;;110	MOV	A,r0x1003
;;109	MOV	A,r0x1004
	MOV	A,r0x1003
	MOV	r0x1004,A
	XOR	A,@0x01
	JBTS	STATUS,2
	JMP	_00130_DS_
	JBTS	_flag_mode,1
	JMP	_00126_DS_
_00130_DS_:
	JBTC	_PORT6bits,3
	JMP	_00127_DS_
	CLR	r0x1003
	JBTC	_flag_mode,1
	INC	r0x1003
;;104	MOV	A,r0x1003
;;103	MOV	A,r0x1004
	MOV	A,r0x1003
	MOV	r0x1004,A
	XOR	A,@0x01
	JBTS	STATUS,2
	JMP	_00127_DS_
_00126_DS_:
;	.line	79; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	reg_keyCont=0;
	CLR	_reg_keyCont
_00127_DS_:
;	.line	81; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	if(++reg_keyCont>=10)
	INC	_reg_keyCont
	MOV	A,@0x0a
	SUB	A,_reg_keyCont
	JBTS	STATUS,0
	JMP	_00136_DS_
;	.line	83; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	reg_keyCont=0;			//;滤波结束
	CLR	_reg_keyCont
;	.line	84; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	if(io_key==0)
	JBTC	_PORT6bits,3
	JMP	_00132_DS_
;	.line	86; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	bit_keyPress=1;		//;置按键按下标志位
	BTS	_flag_mode,1
	JMP	_00136_DS_
_00132_DS_:
;	.line	89; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	bit_keyPress=0;		//;清按键按下标志位	    
	BTC	_flag_mode,1
;	.line	91; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	}
_00136_DS_:
	RET	
; exit point of _file_scanKey

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_XC8P9520_______________file_project_init	code
_file_project_init:	;Function start
; 2 exit points
;	.line	56; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	}
;	.line	56; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	}
	RET	
; exit point of _file_project_init

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_XC8P9520_______________file_init	code
_file_init:	;Function start
; 2 exit points
;	.line	40; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	CONTW(0x02);			//TCC 8分频
	mov	a,@0x02
	ctw
;	.line	41; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	TCC = data_tcc;			//1/2 * 8 * (256-6) = 1000us	公式：1/IRC频率 * 预分频 * （256-初值）
	MOV	A,@0x06
	MOV	_TCC,A
;	.line	42; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	PORT6 = 0;				//P6口输出低
	CLR	_PORT6
;	.line	43; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	IOCP_W(P6CR,0x08);		//P6口设为输出
	mov	a,@0x08
	iw	P6CR
;	.line	44; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	IOCP_W(PHDCR,0xff);		//端口上下拉控制寄存器，bit7-bit4对应P67-P64下拉;bit3-bit0对应P53-P50上拉 
	mov	a,@0xff
	iw	PHDCR
;	.line	45; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	IOCP_W(PDCR,0xff);		//端口下拉控制寄存器，  bit6-bit4对应P62-P60,bit3-bit0对应P53-P50
	mov	a,@0xff
	iw	PDCR
;	.line	46; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	IOCP_W(PHCR,0xff);		//P6端口上拉控制寄存器  bit7-bit0对应P67-P60
	mov	a,@0xff
	iw	PHCR
;	.line	47; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	IOCP_W(WDTCR,0x00);		//WDT 使能控制寄存器
	mov	a,@0x00
	iw	WDTCR
;	.line	48; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	IOCP_W(IMR,0x01);		//中断使能控制寄存器 
	mov	a,@0x01
	iw	IMR
;	.line	49; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	ISR = 0x0;				//清TC0中断标志位 
	CLR	_ISR
;	.line	50; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	}
	RET	
; exit point of _file_init

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_XC8P9520_______________file_clrRam	code
_file_clrRam:	;Function start
; 2 exit points
;	.line	30; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	for(RSR=0x90;RSR<0xFF;RSR++)	//清零 BANK0 RAM  IAR-R0,RSR-R4
	MOV	A,@0x90
	MOV	_RSR,A
_00107_DS_:
	MOV	A,@0xff
	SUB	A,_RSR
	JBTC	STATUS,0
	JMP	_00105_DS_
;	.line	32; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	{IAR = 0;}
	CLR	_IAR
;	.line	30; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	for(RSR=0x90;RSR<0xFF;RSR++)	//清零 BANK0 RAM  IAR-R0,RSR-R4
	INC	_RSR
	JMP	_00107_DS_
_00105_DS_:
;	.line	33; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	IAR = 0;
	CLR	_IAR
;	.line	34; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	}
	RET	
; exit point of _file_clrRam


;	code size estimation:
;	  137+    0 =   137 instructions (  274 byte)

	end
