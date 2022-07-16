;--------------------------------------------------------
; File Created by SLCC : free open source ANSI-C Compiler
; Version 3.6.0 #Dec 13 2021 (MSVC)
;--------------------------------------------------------
; SL port for the RISC core
;--------------------------------------------------------
;	.file	"E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_���ж�ģ��\XC9520-INTERRUPT.C"
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
UD_abs_XC9520_INTERRUPT_10	udata_ovr	0x0010
_A_BUFF
	res	1
UD_abs_XC9520_INTERRUPT_11	udata_ovr	0x0011
_R3_BUFF
	res	1
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_XC9520_INTERRUPT_0	udata
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
;	.line	78; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_���ж�ģ��\XC9520-INTERRUPT.C	__asm__("org 0x08");			//�ж���ڵ�ַ			
	org	0x08
;	.line	79; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_���ж�ģ��\XC9520-INTERRUPT.C	PUSH(_A_BUFF,_R3_BUFF);			//�ж���ջ����
	mov	_A_BUFF,a
	swap	_A_BUFF
	swapa	STATUS
	mov	_R3_BUFF,a
;	.line	81; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_���ж�ģ��\XC9520-INTERRUPT.C	if(TCIF == 1)					//�ж�TCIF�Ƿ�Ϊ1
	CLR	r0x1000
	JBTC	_ISRbits,0
	INC	r0x1000
;;110	MOV	A,r0x1000
;;109	MOV	A,r0x1001
	MOV	A,r0x1000
	MOV	r0x1001,A
	XOR	A,@0x01
	JBTS	STATUS,2
	JMP	_00121_DS_
;	.line	83; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_���ж�ģ��\XC9520-INTERRUPT.C	TCC	  += 0x06;				//1/2 * 8 * (256-6) = 1000us	��ʽ��1/IRCƵ�� * Ԥ��Ƶ * ��256-��ֵ��
	MOV	A,@0x06
	ADD	_TCC,A
;	.line	84; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_���ж�ģ��\XC9520-INTERRUPT.C	ISR    = 0xfe;				//��TC0�жϱ�־λ
	MOV	A,@0xfe
	MOV	_ISR,A
;	.line	85; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_���ж�ģ��\XC9520-INTERRUPT.C	io_ledOut = !io_ledOut;			//P61�ڷ�ת
	CLR	r0x1000
	JBTC	_PORT6bits,0
	INC	r0x1000
	MOV	A,r0x1000
	MOV	A,@0x00
	JBTC	STATUS,2
	MOV	A,@0x01
	MOV	r0x1000,A
	MOV	r0x1001,A
;;108	MOV	A,r0x1001
	RCA	r0x1000
	JBTS	STATUS,0
	BTC	_PORT6bits,0
	JBTC	STATUS,0
	BTS	_PORT6bits,0
_00121_DS_:
;	.line	87; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_���ж�ģ��\XC9520-INTERRUPT.C	if(EXIF == 1)					//�ж�EXIF�Ƿ�Ϊ1,�ⲿ�ж�
	CLR	r0x1000
	JBTC	_ISRbits,2
	INC	r0x1000
;;107	MOV	A,r0x1000
;;106	MOV	A,r0x1001
	MOV	A,r0x1000
	MOV	r0x1001,A
	XOR	A,@0x01
	JBTS	STATUS,2
	JMP	_00123_DS_
;	.line	89; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_���ж�ģ��\XC9520-INTERRUPT.C	ISR    = 0xfb;				//��EXIF�жϱ�־λ
	MOV	A,@0xfb
	MOV	_ISR,A
;	.line	90; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_���ж�ģ��\XC9520-INTERRUPT.C	PORT6_4 = !PORT6_4;			//P64�ڷ�ת
	CLR	r0x1000
	JBTC	_PORT6bits,4
	INC	r0x1000
	MOV	A,r0x1000
	MOV	A,@0x00
	JBTC	STATUS,2
	MOV	A,@0x01
	MOV	r0x1000,A
	MOV	r0x1001,A
;;105	MOV	A,r0x1001
	RCA	r0x1000
	JBTS	STATUS,0
	BTC	_PORT6bits,4
	JBTC	STATUS,0
	BTS	_PORT6bits,4
_00123_DS_:
;	.line	92; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_���ж�ģ��\XC9520-INTERRUPT.C	if(ICIF == 1)					//�ж�ICIF�Ƿ�Ϊ1,�˿ڱ仯�ж�
	CLR	r0x1000
	JBTC	_ISRbits,1
	INC	r0x1000
;;104	MOV	A,r0x1000
;;103	MOV	A,r0x1001
	MOV	A,r0x1000
	MOV	r0x1001,A
	XOR	A,@0x01
	JBTS	STATUS,2
	JMP	_00125_DS_
;	.line	94; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_���ж�ģ��\XC9520-INTERRUPT.C	ISR    = 0xfd;				//��ICIF�жϱ�־λ
	MOV	A,@0xfd
	MOV	_ISR,A
;	.line	95; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_���ж�ģ��\XC9520-INTERRUPT.C	PORT6_4 = !PORT6_4;			//P64�ڷ�ת
	CLR	r0x1000
	JBTC	_PORT6bits,4
	INC	r0x1000
	MOV	A,r0x1000
	MOV	A,@0x00
	JBTC	STATUS,2
	MOV	A,@0x01
	MOV	r0x1000,A
	MOV	r0x1001,A
;;102	MOV	A,r0x1001
	RCA	r0x1000
	JBTS	STATUS,0
	BTC	_PORT6bits,4
	JBTC	STATUS,0
	BTS	_PORT6bits,4
_00125_DS_:
;	.line	98; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_���ж�ģ��\XC9520-INTERRUPT.C	if(T1IF == 1)					//�ж�T1IF�Ƿ�Ϊ1,pwm�����ж�
	CLR	r0x1000
	JBTC	_ISRbits,3
	INC	r0x1000
;;101	MOV	A,r0x1000
;;100	MOV	A,r0x1001
	MOV	A,r0x1000
	MOV	r0x1001,A
	XOR	A,@0x01
	JBTS	STATUS,2
	JMP	_00127_DS_
;	.line	100; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_���ж�ģ��\XC9520-INTERRUPT.C	ISR    = 0xf7;				//ISR��bit3:T1IF����
	MOV	A,@0xf7
	MOV	_ISR,A
;	.line	101; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_���ж�ģ��\XC9520-INTERRUPT.C	PORT6_4 = !PORT6_4;			//P64�ڷ�ת
	CLR	r0x1000
	JBTC	_PORT6bits,4
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
	BTC	_PORT6bits,4
	JBTC	STATUS,0
	BTS	_PORT6bits,4
_00127_DS_:
;	.line	104; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_���ж�ģ��\XC9520-INTERRUPT.C	POP(_A_BUFF,_R3_BUFF);			//�жϳ�ջ�����ָ�
	swapa	_R3_BUFF
	mov	STATUS,a
	swapa	_A_BUFF
;	.line	105; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_���ж�ģ��\XC9520-INTERRUPT.C	}
END_OF_INTERRUPT:
	RETI	

;--------------------------------------------------------
; code
;--------------------------------------------------------
code_XC9520_INTERRUPT	code
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
S_XC9520_INTERRUPT__main	code
_main:	;Function start
; 2 exit points
;	.line	112; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_���ж�ģ��\XC9520-INTERRUPT.C	file_clrRam();					//��RAM
	CALL	_file_clrRam
;	.line	113; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_���ж�ģ��\XC9520-INTERRUPT.C	file_init();					//io�Ĵ�����ʼ��
	CALL	_file_init
;	.line	114; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_���ж�ģ��\XC9520-INTERRUPT.C	file_project_init();			//�������蹦������
	CALL	_file_project_init
;	.line	115; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_���ж�ģ��\XC9520-INTERRUPT.C	EI();							//�����ж�
	ei	
_00133_DS_:
;	.line	119; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_���ж�ģ��\XC9520-INTERRUPT.C	NOP();
	nop	
;	.line	120; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_���ж�ģ��\XC9520-INTERRUPT.C	NOP();
	nop	
;	.line	121; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_���ж�ģ��\XC9520-INTERRUPT.C	NOP();
	nop	
	JMP	_00133_DS_
;	.line	123; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_���ж�ģ��\XC9520-INTERRUPT.C	}
	RET	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_XC9520_INTERRUPT__file_project_init	code
_file_project_init:	;Function start
; 2 exit points
;	.line	55; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_���ж�ģ��\XC9520-INTERRUPT.C	IOCP_W(P6CR,0x01);		//P60�����
	mov	a,@0x01
	iw	P6CR
;	.line	56; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_���ж�ģ��\XC9520-INTERRUPT.C	IOCP_W(WDTCR,0x40);		//Bit<6>:EIS-P60 �ⲿ�ж�ʹ��λ,����P60Ϊ�жϽ�
	mov	a,@0x40
	iw	WDTCR
;	.line	57; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_���ж�ģ��\XC9520-INTERRUPT.C	IOCP_W(IMR,0x05);		//TCC+P60�ⲿ�ж�/* */ 			
	mov	a,@0x05
	iw	IMR
;	.line	71; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_���ж�ģ��\XC9520-INTERRUPT.C	}
	RET	
; exit point of _file_project_init

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_XC9520_INTERRUPT__file_init	code
_file_init:	;Function start
; 2 exit points
;	.line	35; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_���ж�ģ��\XC9520-INTERRUPT.C	CONTW(0x02);			//TCC 8��Ƶ
	mov	a,@0x02
	ctw
;	.line	36; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_���ж�ģ��\XC9520-INTERRUPT.C	TCC = data_tcc;			//1/2 * 8 * (256-6) = 1000us	��ʽ��1/IRCƵ�� * Ԥ��Ƶ * ��256-��ֵ��
	MOV	A,@0x06
	MOV	_TCC,A
;	.line	37; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_���ж�ģ��\XC9520-INTERRUPT.C	PORT6 = 0;				//P6�������
	CLR	_PORT6
;	.line	38; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_���ж�ģ��\XC9520-INTERRUPT.C	IOCP_W(P6CR,0x08);		//P6����Ϊ���
	mov	a,@0x08
	iw	P6CR
;	.line	39; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_���ж�ģ��\XC9520-INTERRUPT.C	IOCP_W(PHDCR,0xff);		//�˿����������ƼĴ�����bit7-bit4��ӦP67-P64����;bit3-bit0��ӦP53-P50���� 
	mov	a,@0xff
	iw	PHDCR
;	.line	40; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_���ж�ģ��\XC9520-INTERRUPT.C	IOCP_W(PDCR,0xff);		//�˿��������ƼĴ�����  bit6-bit4��ӦP62-P60,bit3-bit0��ӦP53-P50
	mov	a,@0xff
	iw	PDCR
;	.line	41; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_���ж�ģ��\XC9520-INTERRUPT.C	IOCP_W(PHCR,0xff);		//P6�˿��������ƼĴ���  bit7-bit0��ӦP67-P60
	mov	a,@0xff
	iw	PHCR
;	.line	42; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_���ж�ģ��\XC9520-INTERRUPT.C	IOCP_W(WDTCR,0x00);		//WDT ʹ�ܿ��ƼĴ���
	mov	a,@0x00
	iw	WDTCR
;	.line	43; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_���ж�ģ��\XC9520-INTERRUPT.C	IOCP_W(IMR,0x01);		//�ж�ʹ�ܿ��ƼĴ��� 
	mov	a,@0x01
	iw	IMR
;	.line	44; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_���ж�ģ��\XC9520-INTERRUPT.C	ISR = 0x0;				//��TC0�жϱ�־λ 
	CLR	_ISR
;	.line	45; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_���ж�ģ��\XC9520-INTERRUPT.C	}
	RET	
; exit point of _file_init

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_XC9520_INTERRUPT__file_clrRam	code
_file_clrRam:	;Function start
; 2 exit points
;	.line	26; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_���ж�ģ��\XC9520-INTERRUPT.C	for(RSR=0x90;RSR<0xFF;RSR++)	//���� BANK0 RAM  IAR-R0,RSR-R4
	MOV	A,@0x90
	MOV	_RSR,A
_00107_DS_:
	MOV	A,@0xff
	SUB	A,_RSR
	JBTC	STATUS,0
	JMP	_00105_DS_
;	.line	27; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_���ж�ģ��\XC9520-INTERRUPT.C	{IAR = 0;}
	CLR	_IAR
;	.line	26; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_���ж�ģ��\XC9520-INTERRUPT.C	for(RSR=0x90;RSR<0xFF;RSR++)	//���� BANK0 RAM  IAR-R0,RSR-R4
	INC	_RSR
	JMP	_00107_DS_
_00105_DS_:
;	.line	28; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_���ж�ģ��\XC9520-INTERRUPT.C	IAR = 0;
	CLR	_IAR
;	.line	29; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_���ж�ģ��\XC9520-INTERRUPT.C	}
	RET	
; exit point of _file_clrRam


;	code size estimation:
;	  121+    0 =   121 instructions (  242 byte)

	end
