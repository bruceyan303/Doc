;--------------------------------------------------------
; File Created by SLCC : free open source ANSI-C Compiler
; Version 3.6.0 #Jan 18 2022 (MSVC)
;--------------------------------------------------------
; SL port for the RISC core
;--------------------------------------------------------
;	.file	"E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C"
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
	global	_file_tcc_wakeIDEL_set
	global	_file_tcc_exitIDEL_set
	global	_file_pwm_wakeIDEL_set
	global	_file_pwm_exitIDEL_set
	global	_file_IDLEWake_slep
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
UD_XC8P8600_IDLE_____0	udata
_reg_sleep_cnt	res	1

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
UD_abs_XC8P8600_IDLE_____10	udata_ovr	0x0010
_A_BUFF
	res	1
UD_abs_XC8P8600_IDLE_____11	udata_ovr	0x0011
_R3_BUFF
	res	1
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_XC8P8600_IDLE_____0	udata
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
;	.line	60; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	__asm__("org 0x08");			//�ж���ڵ�ַ			
	org	0x08
;	.line	61; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	PUSH(_A_BUFF,_R3_BUFF);			//�ж���ջ����
	mov	_A_BUFF,a
	swap	_A_BUFF
	swapa	STATUS
	mov	_R3_BUFF,a
;	.line	63; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	if(TCIF)					//�ж�TCIF�Ƿ�Ϊ1
	JBTS	_ISRbits,0
	JMP	_00121_DS_
;	.line	65; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	TCC	  += 0x06;				//1/2 * 8 * (256-6) = 1000us	��ʽ��1/IRCƵ�� * Ԥ��Ƶ * ��256-��ֵ��
	MOV	A,@0x06
	ADD	_TCC,A
;	.line	66; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	ISR    = 0xfe;				//��TC0�жϱ�־λ
	MOV	A,@0xfe
	MOV	_ISR,A
;	.line	67; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	io_ledOut = !io_ledOut;			//P61�ڷ�ת
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
;	.line	70; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	POP(_A_BUFF,_R3_BUFF);			//�жϳ�ջ�����ָ�
	swapa	_R3_BUFF
	mov	STATUS,a
	swapa	_A_BUFF
;	.line	71; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	}
END_OF_INTERRUPT:
	RETI	

;--------------------------------------------------------
; code
;--------------------------------------------------------
code_XC8P8600_IDLE____	code
;***
;  pBlock Stats: dbName = M
;***
;has an exit
;functions called:
;   _file_clrRam
;   _file_init
;   _file_project_init
;   _file_IDLEWake_slep
;   _file_clrRam
;   _file_init
;   _file_project_init
;   _file_IDLEWake_slep
;; Starting pCode block
S_XC8P8600_IDLE______main	code
_main:	;Function start
; 2 exit points
;	.line	154; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	file_clrRam();					//��RAM
	CALL	_file_clrRam
;	.line	155; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	file_init();					//io�Ĵ�����ʼ��
	CALL	_file_init
;	.line	156; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	file_project_init();			//�������蹦������
	CALL	_file_project_init
;	.line	157; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	EI();							//�����ж�
	ei	
_00149_DS_:
;	.line	160; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	file_IDLEWake_slep();		//IDLEģʽ����
	CALL	_file_IDLEWake_slep
;	.line	161; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	NOP();
	nop	
;	.line	162; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	NOP();
	nop	
;	.line	163; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	NOP();
	nop	
	JMP	_00149_DS_
;	.line	165; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	}
	RET	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _file_tcc_wakeIDEL_set
;   _file_tcc_exitIDEL_set
;   _file_tcc_wakeIDEL_set
;   _file_tcc_exitIDEL_set
;; Starting pCode block
S_XC8P8600_IDLE______file_IDLEWake_slep	code
_file_IDLEWake_slep:	;Function start
; 2 exit points
;	.line	126; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	for(reg_sleep_cnt=0;reg_sleep_cnt<10;reg_sleep_cnt++)
	CLR	_reg_sleep_cnt
_00143_DS_:
;	.line	128; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	DI();
	di	
;	.line	129; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	CWDT();
	CWDT	
;	.line	131; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	file_tcc_wakeIDEL_set();	//����ģʽ�£�tcc����IDEL 5V����,12k����,434.8ms����
	CALL	_file_tcc_wakeIDEL_set
;	.line	135; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	SLEEP();
	sleep	
;	.line	136; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	NOP();
	nop	
;	.line	137; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	NOP();
	nop	
;	.line	139; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	file_tcc_exitIDEL_set();	//����ģʽ�£�tcc����IDEL
	CALL	_file_tcc_exitIDEL_set
;	.line	126; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	for(reg_sleep_cnt=0;reg_sleep_cnt<10;reg_sleep_cnt++)
	INC	_reg_sleep_cnt
	MOV	A,@0x0a
	SUB	A,_reg_sleep_cnt
	JBTS	STATUS,0
	JMP	_00143_DS_
;	.line	143; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	reg_sleep_cnt = 0;
	CLR	_reg_sleep_cnt
;	.line	144; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	io_led2Out=1;	
	BTS	_PORT6bits,1
;	.line	145; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	NOP();
	nop	
;	.line	146; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	NOP();
	nop	
;	.line	147; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	io_led2Out=0; 
	BTC	_PORT6bits,1
;	.line	148; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	}
	RET	
; exit point of _file_IDLEWake_slep

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_XC8P8600_IDLE______file_pwm_exitIDEL_set	code
_file_pwm_exitIDEL_set:	;Function start
; 2 exit points
;	.line	115; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	IDLE=0;					//ϵͳִ�� SLEEP ָ��ʱ����˯��ģʽ	
	BTC	_CPUCONbits,0
;	.line	116; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	PWMCKS=0;				//0:ѡ��ָ������ʱ��
	BTC	_CPUCONbits,6
;	.line	117; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	PWMWE=0;				//0:PWM ���ѽ�ֹ	
	BTC	_CPUCONbits,4
;	.line	118; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	STPHX=0;				//0:����ʱ����������
	BTC	_CPUCONbits,2
;	.line	119; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	CLKMD=0;				//0:ϵͳʱ��ʹ�ø��� IRC ���߾�������ʱ�� 
	BTC	_CPUCONbits,1
;	.line	120; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	}
	RET	
; exit point of _file_pwm_exitIDEL_set

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_XC8P8600_IDLE______file_pwm_wakeIDEL_set	code
_file_pwm_wakeIDEL_set:	;Function start
; 2 exit points
;	.line	102; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	PWMCON = 0x88;			//pwm=255*2(��Ƶ)*(1/����RCʱ��)=38ms PWM���ƼĴ��� T1EN PWM3EN PWM2EN PWM1EN T1PTEN T1PSR<2> T1PSR<1> T1PSR<0> 
	MOV	A,@0x88
	MOV	_PWMCON,A
;	.line	103; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	PRD = 255;				//PWM���ڼĴ���
	MOV	A,@0xff
	MOV	_PRD,A
;	.line	104; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	NOP();
	nop	
;	.line	105; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	NOP();		
	nop	
;	.line	107; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	IDLE=1;					//1:ϵͳִ�� SLEEP ָ��ʱ�������ģʽ��ϵͳʱ����������
	BTS	_CPUCONbits,0
;	.line	108; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	PWMWE=1;				//1:PWM ����ʹ�ܣ��ɻ��ѿ���ģʽ 
	BTS	_CPUCONbits,4
;	.line	109; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	PWMCKS=1;				//1:ѡ��ϵͳʱ��Fosc
	BTS	_CPUCONbits,6
;	.line	110; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	CLKMD=1;				//1:ϵͳʱ��ʹ�õ��� RC ����ʱ��
	BTS	_CPUCONbits,1
;	.line	111; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	STPHX=1;				//1:ֹͣ����ʱ�ӣ����� IRC �;�������ʱ�ӣ������� RTC ʱ�ӣ� 
	BTS	_CPUCONbits,2
;	.line	112; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	}
	RET	
; exit point of _file_pwm_wakeIDEL_set

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_XC8P8600_IDLE______file_tcc_exitIDEL_set	code
_file_tcc_exitIDEL_set:	;Function start
; 2 exit points
;	.line	90; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	IDLE=0;				//0:ϵͳִ�� SLEEP ָ��ʱ����˯��ģʽ	
	BTC	_CPUCONbits,0
;	.line	91; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	TCCCKS=0;			//TCC ʱ��Դѡ��,0:ѡ��ָ������ʱ��
	BTC	_CPUCONbits,5
;	.line	92; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	TCCWE=0;				//0:TCC ���ѽ�ֹ	
	BTC	_CPUCONbits,3
;	.line	93; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	STPHX=0;			//0:����ʱ����������
	BTC	_CPUCONbits,2
;	.line	94; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	CLKMD=0;			//0:ϵͳʱ��ʹ�ø��� IRC ���߾�������ʱ�� 
	BTC	_CPUCONbits,1
;	.line	95; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	}
	RET	
; exit point of _file_tcc_exitIDEL_set

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_XC8P8600_IDLE______file_tcc_wakeIDEL_set	code
_file_tcc_wakeIDEL_set:	;Function start
; 2 exit points
;	.line	78; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	CONTW(0X00);		//Ԥ��Ƶ���ָ�TCC 07;Ԥ��Ƶ���ָ�WDT  32.768ms
	mov	a,@0X00
	ctw
;	.line	79; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	NOP();
	nop	
;	.line	80; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	NOP();
	nop	
;	.line	81; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	TCC=0;				//TCC��ʱ����ʱ��=TCC*TCC��Ƶ*(1/����RCʱ��)=256*2*(1/����RCʱ��)
	CLR	_TCC
;	.line	82; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	IDLE=1;				//1:ϵͳִ�� SLEEP ָ��ʱ�������ģʽ��ϵͳʱ����������
	BTS	_CPUCONbits,0
;	.line	83; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	TCCCKS=1;			//TCC ʱ��Դѡ��,1:ѡ��ϵͳʱ��
	BTS	_CPUCONbits,5
;	.line	84; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	TCCWE=1;			//1:TCC����ʹ��,�ɻ��ѿ���ģʽ,RTC ģʽ�¿ɻ���˯���Լ�����ģʽ
	BTS	_CPUCONbits,3
;	.line	85; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	CLKMD=1;			//1:ϵͳʱ��ʹ�õ��� RC ����ʱ��
	BTS	_CPUCONbits,1
;	.line	86; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	STPHX=1;			//1:ֹͣ����ʱ�ӣ����� IRC �;�������ʱ�ӣ������� RTC ʱ�ӣ� 	
	BTS	_CPUCONbits,2
;	.line	87; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	}
	RET	
; exit point of _file_tcc_wakeIDEL_set

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_XC8P8600_IDLE______file_project_init	code
_file_project_init:	;Function start
; 2 exit points
;	.line	54; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	}
;	.line	54; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	}
	RET	
; exit point of _file_project_init

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_XC8P8600_IDLE______file_init	code
_file_init:	;Function start
; 2 exit points
;	.line	38; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	CONTW(0x02);			//TCC 8��Ƶ
	mov	a,@0x02
	ctw
;	.line	39; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	TCC = data_tcc;			//1/2 * 8 * (256-6) = 1000us	��ʽ��1/IRCƵ�� * Ԥ��Ƶ * ��256-��ֵ��
	MOV	A,@0x06
	MOV	_TCC,A
;	.line	40; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	PORT6 = 0;				//P6�������
	CLR	_PORT6
;	.line	41; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	IOCP_W(P6CR,0x08);		//P6����Ϊ���
	mov	a,@0x08
	iw	P6CR
;	.line	42; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	IOCP_W(PHDCR,0xff);		//�˿����������ƼĴ�����bit7-bit4��ӦP67-P64����;bit3-bit0��ӦP53-P50���� 
	mov	a,@0xff
	iw	PHDCR
;	.line	43; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	IOCP_W(PDCR,0xff);		//�˿��������ƼĴ�����  bit6-bit4��ӦP62-P60,bit3-bit0��ӦP53-P50
	mov	a,@0xff
	iw	PDCR
;	.line	44; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	IOCP_W(PHCR,0xff);		//P6�˿��������ƼĴ���  bit7-bit0��ӦP67-P60
	mov	a,@0xff
	iw	PHCR
;	.line	45; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	IOCP_W(WDTCR,0x00);		//WDT ʹ�ܿ��ƼĴ���
	mov	a,@0x00
	iw	WDTCR
;	.line	46; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	IOCP_W(IMR,0x01);		//�ж�ʹ�ܿ��ƼĴ��� 
	mov	a,@0x01
	iw	IMR
;	.line	47; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	ISR = 0x0;				//��TC0�жϱ�־λ 
	CLR	_ISR
;	.line	48; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	}
	RET	
; exit point of _file_init

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_XC8P8600_IDLE______file_clrRam	code
_file_clrRam:	;Function start
; 2 exit points
;	.line	29; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	for(RSR=0x90;RSR<0xFF;RSR++)	//���� BANK0 RAM  IAR-R0,RSR-R4
	MOV	A,@0x90
	MOV	_RSR,A
_00107_DS_:
	MOV	A,@0xff
	SUB	A,_RSR
	JBTC	STATUS,0
	JMP	_00105_DS_
;	.line	30; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	{IAR = 0;}
	CLR	_IAR
;	.line	29; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	for(RSR=0x90;RSR<0xFF;RSR++)	//���� BANK0 RAM  IAR-R0,RSR-R4
	INC	_RSR
	JMP	_00107_DS_
_00105_DS_:
;	.line	31; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	IAR = 0;
	CLR	_IAR
;	.line	32; E:\360��ȫ����-ͬ����\00���ܵ�Ƭ��DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE����\XC8P8600-IDLE����.C	}
	RET	
; exit point of _file_clrRam


;	code size estimation:
;	   84+    0 =    84 instructions (  168 byte)

	end
