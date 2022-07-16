;--------------------------------------------------------
; File Created by SLCC : free open source ANSI-C Compiler
; Version 3.6.0 #Dec 13 2021 (MSVC)
;--------------------------------------------------------
; SL port for the RISC core
;--------------------------------------------------------
;	.file	"E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C"
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
	global	_file_tcc_wakeIDEL_set
	global	_file_tcc_exitIDEL_set
	global	_file_pwm_wakeIDEL_set
	global	_file_pwm_exitIDEL_set
	global	_file_RTC_wakeIDEL_set
	global	_file_RTC_exitIDEL_set
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
UD_XC8P9520_IDLE_____0	udata
_reg_sleep_cnt	res	1

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
UD_abs_XC8P9520_IDLE_____10	udata_ovr	0x0010
_A_BUFF
	res	1
UD_abs_XC8P9520_IDLE_____11	udata_ovr	0x0011
_R3_BUFF
	res	1
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_XC8P9520_IDLE_____0	udata
r0x1001	res	1
r0x1002	res	1
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
;@file_clrRam reg_sleep_cnt             Allocated to registers ;size:1
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
;   r0x1001
;   r0x1002
;; Starting pCode block
_int_isr:	;Function start
; 0 exit points
;	.line	61; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	__asm__("org 0x08");			//�ж���ڵ�ַ			
	org	0x08
;	.line	62; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	PUSH(_A_BUFF,_R3_BUFF);			//�ж���ջ����
	mov	_A_BUFF,a
	swap	_A_BUFF
	swapa	STATUS
	mov	_R3_BUFF,a
;	.line	64; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	if(TCIF == 1)					//�ж�TCIF�Ƿ�Ϊ1
	CLR	r0x1001
	JBTC	_ISRbits,0
	INC	r0x1001
;;101	MOV	A,r0x1001
;;100	MOV	A,r0x1002
	MOV	A,r0x1001
	MOV	r0x1002,A
	XOR	A,@0x01
	JBTS	STATUS,2
	JMP	_00121_DS_
;	.line	66; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	TCC	  += 0x06;				//1/2 * 8 * (256-6) = 1000us	��ʽ��1/IRCƵ�� * Ԥ��Ƶ * ��256-��ֵ��
	MOV	A,@0x06
	ADD	_TCC,A
;	.line	67; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	ISR    = 0xfe;				//��TC0�жϱ�־λ
	MOV	A,@0xfe
	MOV	_ISR,A
;	.line	68; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	io_ledOut = !io_ledOut;			//P61�ڷ�ת
	CLR	r0x1001
	JBTC	_PORT6bits,0
	INC	r0x1001
	MOV	A,r0x1001
	MOV	A,@0x00
	JBTC	STATUS,2
	MOV	A,@0x01
	MOV	r0x1001,A
	MOV	r0x1002,A
;;99	MOV	A,r0x1002
	RCA	r0x1001
	JBTS	STATUS,0
	BTC	_PORT6bits,0
	JBTC	STATUS,0
	BTS	_PORT6bits,0
_00121_DS_:
;	.line	71; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	POP(_A_BUFF,_R3_BUFF);			//�жϳ�ջ�����ָ�
	swapa	_R3_BUFF
	mov	STATUS,a
	swapa	_A_BUFF
;	.line	72; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	}
END_OF_INTERRUPT:
	RETI	

;--------------------------------------------------------
; code
;--------------------------------------------------------
code_XC8P9520_IDLE____	code
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
S_XC8P9520_IDLE______main	code
_main:	;Function start
; 2 exit points
;	.line	176; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	file_clrRam();					//��RAM
	CALL	_file_clrRam
;	.line	177; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	file_init();					//io�Ĵ�����ʼ��
	CALL	_file_init
;	.line	178; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	file_project_init();			//�������蹦������
	CALL	_file_project_init
;	.line	179; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	EI();							//�����ж�
	ei	
_00157_DS_:
;	.line	182; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	file_IDLEWake_slep();		//IDLEģʽ����
	CALL	_file_IDLEWake_slep
;	.line	183; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	NOP();
	nop	
;	.line	184; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	NOP();
	nop	
;	.line	185; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	NOP();
	nop	
	JMP	_00157_DS_
;	.line	187; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	}
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
S_XC8P9520_IDLE______file_IDLEWake_slep	code
_file_IDLEWake_slep:	;Function start
; 2 exit points
;	.line	146; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	for(reg_sleep_cnt=0;reg_sleep_cnt<10;reg_sleep_cnt++)
	CLR	_reg_sleep_cnt
_00151_DS_:
;	.line	148; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	DI();
	di	
;	.line	149; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	CWDT();
	CWDT	
;	.line	151; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	file_tcc_wakeIDEL_set();	//����ģʽ�£�tcc����IDEL 5V����,12k����,412ms����
	CALL	_file_tcc_wakeIDEL_set
;	.line	156; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	SLEEP();
	sleep	
;	.line	157; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	NOP();
	nop	
;	.line	158; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	NOP();
	nop	
;	.line	160; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	file_tcc_exitIDEL_set();	//����ģʽ�£�tcc����IDEL
	CALL	_file_tcc_exitIDEL_set
;	.line	146; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	for(reg_sleep_cnt=0;reg_sleep_cnt<10;reg_sleep_cnt++)
	INC	_reg_sleep_cnt
	MOV	A,@0x0a
	SUB	A,_reg_sleep_cnt
	JBTS	STATUS,0
	JMP	_00151_DS_
;	.line	165; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	reg_sleep_cnt = 0;
	CLR	_reg_sleep_cnt
;	.line	166; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	io_led2Out=1;	
	BTS	_PORT6bits,1
;	.line	167; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	NOP();
	nop	
;	.line	168; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	NOP();
	nop	
;	.line	169; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	io_led2Out=0; 
	BTC	_PORT6bits,1
;	.line	170; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	}
	RET	
; exit point of _file_IDLEWake_slep

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_XC8P9520_IDLE______file_RTC_exitIDEL_set	code
_file_RTC_exitIDEL_set:	;Function start
; 2 exit points
;	.line	137; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	IDLE=0;					//0:ϵͳִ�� SLEEP ָ��ʱ����˯��ģʽ	
	BTC	_CPUCONbits,0
;	.line	138; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	TCCCKS=0;				//TCC ʱ��Դѡ��,0:ѡ��ָ������ʱ��
	BTC	_CPUCONbits,5
;	.line	139; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	TCCWE=0;				//0:TCC ���ѽ�ֹ	 
	BTC	_CPUCONbits,3
;	.line	140; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	}
	RET	
; exit point of _file_RTC_exitIDEL_set

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_XC8P9520_IDLE______file_RTC_wakeIDEL_set	code
_file_RTC_wakeIDEL_set:	;Function start
; 2 exit points
;	.line	128; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	CONTW(0X80);			//����TCCԤ��Ƶ1:2,bit7:RTCSʹ0x84;bit7=1:ѡ���ⲿ����ʱ��(LXT��4��Ƶ�� 
	mov	a,@0X80
	ctw
;	.line	129; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	TCC=0;					//��ʱ�ж�����T = (1/32.768KHz)*4Clock*2*256 = 62.5ms 
	CLR	_TCC
;	.line	130; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	NOP();
	nop	
;	.line	131; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	IDLE=1;					//1:ϵͳִ�� SLEEP ָ��ʱ�������ģʽ��ϵͳʱ����������
	BTS	_CPUCONbits,0
;	.line	132; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	TCCCKS=1;				//TCC ʱ��Դѡ��,1:ѡ��ϵͳʱ��
	BTS	_CPUCONbits,5
;	.line	133; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	TCCWE=1;				//1:TCC����ʹ��,�ɻ��ѿ���ģʽ,RTC ģʽ�¿ɻ���˯���Լ�����ģʽ
	BTS	_CPUCONbits,3
;	.line	134; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	}
	RET	
; exit point of _file_RTC_wakeIDEL_set

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_XC8P9520_IDLE______file_pwm_exitIDEL_set	code
_file_pwm_exitIDEL_set:	;Function start
; 2 exit points
;	.line	116; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	IDLE=0;					//ϵͳִ�� SLEEP ָ��ʱ����˯��ģʽ	
	BTC	_CPUCONbits,0
;	.line	117; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	PWMCKS=0;				//0:ѡ��ָ������ʱ��
	BTC	_CPUCONbits,6
;	.line	118; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	PWMWE=0;				//0:PWM ���ѽ�ֹ	
	BTC	_CPUCONbits,4
;	.line	119; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	STPHX=0;				//0:����ʱ����������
	BTC	_CPUCONbits,2
;	.line	120; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	CLKMD=0;				//0:ϵͳʱ��ʹ�ø��� IRC ���߾�������ʱ�� 
	BTC	_CPUCONbits,1
;	.line	121; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	}
	RET	
; exit point of _file_pwm_exitIDEL_set

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_XC8P9520_IDLE______file_pwm_wakeIDEL_set	code
_file_pwm_wakeIDEL_set:	;Function start
; 2 exit points
;	.line	103; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	PWMCON = 0x88;			//pwm=255*2(��Ƶ)*(1/����RCʱ��)=38ms PWM���ƼĴ��� T1EN PWM3EN PWM2EN PWM1EN T1PTEN T1PSR<2> T1PSR<1> T1PSR<0> 
	MOV	A,@0x88
	MOV	_PWMCON,A
;	.line	104; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	PRD = 255;				//PWM���ڼĴ���
	MOV	A,@0xff
	MOV	_PRD,A
;	.line	105; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	NOP();
	nop	
;	.line	106; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	NOP();		
	nop	
;	.line	108; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	IDLE=1;					//1:ϵͳִ�� SLEEP ָ��ʱ�������ģʽ��ϵͳʱ����������
	BTS	_CPUCONbits,0
;	.line	109; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	PWMWE=1;				//1:PWM ����ʹ�ܣ��ɻ��ѿ���ģʽ 
	BTS	_CPUCONbits,4
;	.line	110; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	PWMCKS=1;				//1:ѡ��ϵͳʱ��Fosc
	BTS	_CPUCONbits,6
;	.line	111; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	CLKMD=1;				//1:ϵͳʱ��ʹ�õ��� RC ����ʱ��
	BTS	_CPUCONbits,1
;	.line	112; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	STPHX=1;				//1:ֹͣ����ʱ�ӣ����� IRC �;�������ʱ�ӣ������� RTC ʱ�ӣ� 
	BTS	_CPUCONbits,2
;	.line	113; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	}
	RET	
; exit point of _file_pwm_wakeIDEL_set

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_XC8P9520_IDLE______file_tcc_exitIDEL_set	code
_file_tcc_exitIDEL_set:	;Function start
; 2 exit points
;	.line	91; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	IDLE=0;				//0:ϵͳִ�� SLEEP ָ��ʱ����˯��ģʽ	
	BTC	_CPUCONbits,0
;	.line	92; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	TCCCKS=0;			//TCC ʱ��Դѡ��,0:ѡ��ָ������ʱ��
	BTC	_CPUCONbits,5
;	.line	93; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	TCCWE=0;				//0:TCC ���ѽ�ֹ	
	BTC	_CPUCONbits,3
;	.line	94; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	STPHX=0;			//0:����ʱ����������
	BTC	_CPUCONbits,2
;	.line	95; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	CLKMD=0;			//0:ϵͳʱ��ʹ�ø��� IRC ���߾�������ʱ�� 
	BTC	_CPUCONbits,1
;	.line	96; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	}
	RET	
; exit point of _file_tcc_exitIDEL_set

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_XC8P9520_IDLE______file_tcc_wakeIDEL_set	code
_file_tcc_wakeIDEL_set:	;Function start
; 2 exit points
;	.line	79; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	CONTW(0X00);		//Ԥ��Ƶ���ָ�TCC 07;Ԥ��Ƶ���ָ�WDT  32.768ms
	mov	a,@0X00
	ctw
;	.line	80; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	NOP();
	nop	
;	.line	81; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	NOP();
	nop	
;	.line	82; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	TCC=0;				//TCC��ʱ����ʱ��=TCC*TCC��Ƶ*(1/����RCʱ��)=256*2*(1/����RCʱ��)
	CLR	_TCC
;	.line	83; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	IDLE=1;				//1:ϵͳִ�� SLEEP ָ��ʱ�������ģʽ��ϵͳʱ����������
	BTS	_CPUCONbits,0
;	.line	84; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	TCCCKS=1;			//TCC ʱ��Դѡ��,1:ѡ��ϵͳʱ��
	BTS	_CPUCONbits,5
;	.line	85; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	TCCWE=1;			//1:TCC����ʹ��,�ɻ��ѿ���ģʽ,RTC ģʽ�¿ɻ���˯���Լ�����ģʽ
	BTS	_CPUCONbits,3
;	.line	86; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	CLKMD=1;			//1:ϵͳʱ��ʹ�õ��� RC ����ʱ��
	BTS	_CPUCONbits,1
;	.line	87; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	STPHX=1;			//1:ֹͣ����ʱ�ӣ����� IRC �;�������ʱ�ӣ������� RTC ʱ�ӣ� 	
	BTS	_CPUCONbits,2
;	.line	88; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	}
	RET	
; exit point of _file_tcc_wakeIDEL_set

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_XC8P9520_IDLE______file_project_init	code
_file_project_init:	;Function start
; 2 exit points
;	.line	55; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	}
;	.line	55; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	}
	RET	
; exit point of _file_project_init

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_XC8P9520_IDLE______file_init	code
_file_init:	;Function start
; 2 exit points
;	.line	39; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	CONTW(0x02);			//TCC 8��Ƶ
	mov	a,@0x02
	ctw
;	.line	40; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	TCC = data_tcc;			//1/2 * 8 * (256-6) = 1000us	��ʽ��1/IRCƵ�� * Ԥ��Ƶ * ��256-��ֵ��
	MOV	A,@0x06
	MOV	_TCC,A
;	.line	41; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	PORT6 = 0;				//P6�������
	CLR	_PORT6
;	.line	42; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	IOCP_W(P6CR,0x08);		//P6����Ϊ���
	mov	a,@0x08
	iw	P6CR
;	.line	43; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	IOCP_W(PHDCR,0xff);		//�˿����������ƼĴ�����bit7-bit4��ӦP67-P64����;bit3-bit0��ӦP53-P50���� 
	mov	a,@0xff
	iw	PHDCR
;	.line	44; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	IOCP_W(PDCR,0xff);		//�˿��������ƼĴ�����  bit6-bit4��ӦP62-P60,bit3-bit0��ӦP53-P50
	mov	a,@0xff
	iw	PDCR
;	.line	45; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	IOCP_W(PHCR,0xff);		//P6�˿��������ƼĴ���  bit7-bit0��ӦP67-P60
	mov	a,@0xff
	iw	PHCR
;	.line	46; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	IOCP_W(WDTCR,0x00);		//WDT ʹ�ܿ��ƼĴ���
	mov	a,@0x00
	iw	WDTCR
;	.line	47; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	IOCP_W(IMR,0x01);		//�ж�ʹ�ܿ��ƼĴ��� 
	mov	a,@0x01
	iw	IMR
;	.line	48; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	ISR = 0x0;				//��TC0�жϱ�־λ 
	CLR	_ISR
;	.line	49; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	}
	RET	
; exit point of _file_init

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_XC8P9520_IDLE______file_clrRam	code
_file_clrRam:	;Function start
; 2 exit points
;	.line	29; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	for(RSR=0x90;RSR<0xFF;RSR++)	//���� BANK0 RAM  IAR-R0,RSR-R4
	MOV	A,@0x90
	MOV	_RSR,A
_00107_DS_:
	MOV	A,@0xff
	SUB	A,_RSR
	JBTC	STATUS,0
	JMP	_00105_DS_
;	.line	31; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	{IAR = 0;}
	CLR	_IAR
;	.line	29; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	for(RSR=0x90;RSR<0xFF;RSR++)	//���� BANK0 RAM  IAR-R0,RSR-R4
	INC	_RSR
	JMP	_00107_DS_
_00105_DS_:
;	.line	32; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	IAR = 0;
	CLR	_IAR
;	.line	33; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	}
	RET	
; exit point of _file_clrRam


;	code size estimation:
;	  100+    0 =   100 instructions (  200 byte)

	end
