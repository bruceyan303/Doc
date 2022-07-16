;--------------------------------------------------------
; File Created by SLCC : free open source ANSI-C Compiler
; Version 3.6.0 #Dec 13 2021 (MSVC)
;--------------------------------------------------------
; SL port for the RISC core
;--------------------------------------------------------
;	.file	"E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C"
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
	global	_main
	global	_int_isr
	global	_A_BUFF
	global	_R3_BUFF
	global	_Temp
	global	_flag_key

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
UD_ALLREG_0	udata
_Temp	res	1

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
UD_abs_ALLREG_10	udata_ovr	0x0010
_A_BUFF
	res	1
UD_abs_ALLREG_11	udata_ovr	0x0011
_R3_BUFF
	res	1
UD_abs_ALLREG_12	udata_ovr	0x0012
_flag_key
	res	1
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

;@Allocation info for local variables in function 'main'
;@main main                      Allocated to registers ;size:2
;@main IARbits                   Allocated to registers ;size:1
;@main TCCbits                   Allocated to registers ;size:1
;@main PCLbits                   Allocated to registers ;size:1
;@main STATUSbits                Allocated to registers ;size:1
;@main RSRbits                   Allocated to registers ;size:1
;@main PORT6bits                 Allocated to registers ;size:1
;@main PWMCONbits                Allocated to registers ;size:1
;@main PRDbits                   Allocated to registers ;size:1
;@main PDC1bits                  Allocated to registers ;size:1
;@main PDC2bits                  Allocated to registers ;size:1
;@main PDC3bits                  Allocated to registers ;size:1
;@main ICIECRbits                Allocated to registers ;size:1
;@main CPUCONbits                Allocated to registers ;size:1
;@main ISRbits                   Allocated to registers ;size:1
;@main A_BUFF                    Allocated to registers ;size:1
;@main R3_BUFF                   Allocated to registers ;size:1
;@main Temp                      Allocated to registers ;size:1
;@main flag_key                  Allocated to registers ;size:1
;@main IAR                       Allocated to registers ;size:1
;@main TCC                       Allocated to registers ;size:1
;@main PCL                       Allocated to registers ;size:1
;@main STATUS                    Allocated to registers ;size:1
;@main RSR                       Allocated to registers ;size:1
;@main PORT6                     Allocated to registers ;size:1
;@main PWMCON                    Allocated to registers ;size:1
;@main PRD                       Allocated to registers ;size:1
;@main PDC1                      Allocated to registers ;size:1
;@main PDC2                      Allocated to registers ;size:1
;@main PDC3                      Allocated to registers ;size:1
;@main ICIECR                    Allocated to registers ;size:1
;@main CPUCON                    Allocated to registers ;size:1
;@main ISR                       Allocated to registers ;size:1
;@end Allocation info for local variables in function 'main';

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
;	.line	138; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	__asm__("org 0x08");
	org	0x08
;	.line	139; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	PUSH(_A_BUFF,_R3_BUFF);			//中断入栈保护
	mov	_A_BUFF,a
	swap	_A_BUFF
	swapa	STATUS
	mov	_R3_BUFF,a
;	.line	143; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	POP(_A_BUFF,_R3_BUFF);			//中断出栈保护恢复
	swapa	_R3_BUFF
	mov	STATUS,a
	swapa	_A_BUFF
;	.line	144; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	}
END_OF_INTERRUPT:
	RETI	

;--------------------------------------------------------
; code
;--------------------------------------------------------
code_ALLREG	code
;***
;  pBlock Stats: dbName = M
;***
;has an exit
;; Starting pCode block
S_ALLREG__main	code
_main:	;Function start
; 2 exit points
;	.line	60; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	IAR = 0xAA;					//IAR赋值0xAA
	MOV	A,@0xaa
	MOV	_IAR,A
;	.line	61; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	Temp = IAR;					//读IAR到Temp
	MOV	A,_IAR
	MOV	_Temp,A
;	.line	63; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	TCC = 0xAA;					//TCC赋值0xAA
	MOV	A,@0xaa
	MOV	_TCC,A
;	.line	64; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	Temp = TCC;					//读TCC到Temp
	MOV	A,_TCC
	MOV	_Temp,A
;	.line	66; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	PCL = 0xAA;					//PCL赋值0xAA
	MOV	A,@0xaa
	MOV	_PCL,A
;	.line	67; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	Temp = PCL;					//读PCL到Temp
	MOV	A,_PCL
	MOV	_Temp,A
;	.line	69; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	STATUS = 0xAA;				//STATUS赋值0xAA
	MOV	A,@0xaa
	MOV	_STATUS,A
;	.line	70; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	Temp = STATUS;				//读STATUS到Temp
	MOV	A,_STATUS
	MOV	_Temp,A
;	.line	72; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	RSR = 0xAA;					//RSR赋值0xAA
	MOV	A,@0xaa
	MOV	_RSR,A
;	.line	73; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	Temp = RSR;					//读RSR到Temp
	MOV	A,_RSR
	MOV	_Temp,A
;	.line	75; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	PORT6 = 0xAA;				//PORT6赋值0xAA
	MOV	A,@0xaa
	MOV	_PORT6,A
;	.line	76; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	Temp = PORT6;				//读PORT6到Temp
	MOV	A,_PORT6
	MOV	_Temp,A
;	.line	78; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	PWMCON = 0xAA;				//PWMCON赋值0xAA
	MOV	A,@0xaa
	MOV	_PWMCON,A
;	.line	79; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	Temp = PWMCON;				//读PWMCON到Temp
	MOV	A,_PWMCON
	MOV	_Temp,A
;	.line	81; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	PRD = 0xAA;					//PRD赋值0xAA
	MOV	A,@0xaa
	MOV	_PRD,A
;	.line	82; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	Temp = PRD;					//读PRD到Temp
	MOV	A,_PRD
	MOV	_Temp,A
;	.line	84; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	PDC1 = 0xAA;				//PDC1赋值0xAA
	MOV	A,@0xaa
	MOV	_PDC1,A
;	.line	85; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	Temp = PDC1;				//读PDC1到Temp
	MOV	A,_PDC1
	MOV	_Temp,A
;	.line	87; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	PDC2 = 0xAA;				//PDC2赋值0xAA
	MOV	A,@0xaa
	MOV	_PDC2,A
;	.line	88; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	Temp = PDC2;				//读PDC2到Temp
	MOV	A,_PDC2
	MOV	_Temp,A
;	.line	90; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	PDC3 = 0xAA;				//PDC3赋值0xAA
	MOV	A,@0xaa
	MOV	_PDC3,A
;	.line	91; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	Temp = PDC3;				//读PDC3到Temp
	MOV	A,_PDC3
	MOV	_Temp,A
;	.line	93; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	ICIECR = 0xAA;				//ICIECR赋值0xAA
	MOV	A,@0xaa
	MOV	_ICIECR,A
;	.line	94; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	Temp = ICIECR;				//读ICIECR到Temp
	MOV	A,_ICIECR
	MOV	_Temp,A
;	.line	96; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	CPUCON = 0xAA;				//CPUCON赋值0xAA
	MOV	A,@0xaa
	MOV	_CPUCON,A
;	.line	97; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	Temp = CPUCON;				//读CPUCON到Temp
	MOV	A,_CPUCON
	MOV	_Temp,A
;	.line	99; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	ISR = 0xAA;					//ISR赋值0xAA
	MOV	A,@0xaa
	MOV	_ISR,A
;	.line	100; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	Temp = ISR;					//读ISR到Temp
	MOV	A,_ISR
	MOV	_Temp,A
;	.line	105; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	CONTW(0x08);				//CONT赋值0x08
	mov	a,@0x08
	ctw
;	.line	107; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	IOCP_W(P6CR,0xAA);			//P6CR赋值0xAA
	mov	a,@0xAA
	iw	P6CR
;	.line	108; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	IOCP_R(_Temp,P6CR);			//读P6CR到Temp
	ir	P6CR
	mov	_Temp,a
;	.line	110; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	IOCP_W(PHDCR,0xAA);			//PHDCR赋值0xAA
	mov	a,@0xAA
	iw	PHDCR
;	.line	111; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	IOCP_R(_Temp,PHDCR);		//读PHDCR到Temp
	ir	PHDCR
	mov	_Temp,a
;	.line	113; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	IOCP_W(PDCR,0xAA);			//PDCR赋值0xAA
	mov	a,@0xAA
	iw	PDCR
;	.line	114; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	IOCP_R(_Temp,PDCR);			//读PDCR到Temp
	ir	PDCR
	mov	_Temp,a
;	.line	116; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	IOCP_W(PHCR,0xAA);			//PHCR赋值0xAA
	mov	a,@0xAA
	iw	PHCR
;	.line	117; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	IOCP_R(_Temp,PHCR);			//读PHCR到Temp
	ir	PHCR
	mov	_Temp,a
;	.line	119; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	IOCP_W(WDTCR,0xAA);			//WDTCR赋值0xAA
	mov	a,@0xAA
	iw	WDTCR
;	.line	120; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	IOCP_R(_Temp,WDTCR);		//读WDTCR到Temp
	ir	WDTCR
	mov	_Temp,a
;	.line	122; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	IOCP_W(IMR,0xAA);			//IMR赋值0xAA
	mov	a,@0xAA
	iw	IMR
;	.line	123; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	IOCP_R(_Temp,IMR);			//读IMR到Temp
	ir	IMR
	mov	_Temp,a
;	.line	125; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	IOCP_W_AND(P6CR,0X01);		//P6口与0x01给到P6口
	ir	P6CR
	and	a,@0X01
	iw	P6CR
;	.line	127; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	IOCP_W_OR(P6CR,0XFE);		//P6口或0xFE给到P6口
	ir	P6CR
	or	a,@0XFE
	iw	P6CR
;	.line	129; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	P61_INPUT;					//位操作i/o
	ir	PORT6
	or	a,@0X02
	iw	PORT6
;	.line	130; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	P61_OUTPUT;					//位操作i/o
	ir	PORT6
	and	a,@0XFD
	iw	PORT6
;	.line	131; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	}
	RET	
; exit point of _main


;	code size estimation:
;	   58+    0 =    58 instructions (  116 byte)

	end
