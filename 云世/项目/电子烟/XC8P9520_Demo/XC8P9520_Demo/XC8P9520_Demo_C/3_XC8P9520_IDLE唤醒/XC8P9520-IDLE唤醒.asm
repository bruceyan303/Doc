jmp	0x72                		; 	jmp	_main                          	000000 1072		
;	.line	61; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	__asm__("org 0x08");			//�ж���ڵ�ַ			
;	.line	62; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	PUSH(_A_BUFF,_R3_BUFF);			//�ж���ջ����
mov	0x10, a             		; 	mov	_A_BUFF,a                      	000008 3890		
swap	0x10               		; 	swap	_A_BUFF                       	000009 3690		
swapa	0x3               		; 	swapa	STATUS                       	00000a 3603		
mov	0x11, a             		; 	mov	_R3_BUFF,a                     	00000b 3891		
;	.line	64; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	if(TCIF == 1)					//�ж�TCIF�Ƿ�Ϊ1
clr	0x12                		; 	CLR	r0x1001                        	00000c 3992		
jbtc	0xf, 0             		; 	JBTC	_ISRbits,0                    	00000d 200f		
inc	0x12                		; 	INC	r0x1001                        	00000e 3292		
mov	a, 0x12             		; 	MOV	A,r0x1001                      	00000f 3012		
mov	0x13, a             		; 	MOV	r0x1002,A                      	000010 3893		
xor	a, @0x1             		; 	XOR	A,@0x01                        	000011 0e01		
jbts	0x3, 0x2           		; 	JBTS	STATUS,2                      	000012 2503		
jmp	0x26                		; 	JMP	_00121_DS_                     	000013 1026		
;	.line	66; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	TCC	  += 0x06;				//1/2 * 8 * (256-6) = 1000us	��ʽ��1/IRCƵ�� * Ԥ��Ƶ * ��256-��ֵ��
mov	a, @0x6             		; 	MOV	A,@0x06                        	000014 0806		
add	0x1, a              		; 	ADD	_TCC,A                         	000015 3f81		
;	.line	67; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	ISR    = 0xfe;				//��TC0�жϱ�־λ
dw	0x8fe  ;unknown opcode		; 	MOV	A,@0xfe                        	000016 08fe		
mov	0xf, a              		; 	MOV	_ISR,A                         	000017 388f		
;	.line	68; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	io_ledOut = !io_ledOut;			//P61�ڷ�ת
clr	0x12                		; 	CLR	r0x1001                        	000018 3992		
jbtc	0x6, 0             		; 	JBTC	_PORT6bits,0                  	000019 2006		
inc	0x12                		; 	INC	r0x1001                        	00001a 3292		
mov	a, 0x12             		; 	MOV	A,r0x1001                      	00001b 3012		
mov	a, @0               		; 	MOV	A,@0x00                        	00001c 0800		
jbtc	0x3, 0x2           		; 	JBTC	STATUS,2                      	00001d 2103		
mov	a, @0x1             		; 	MOV	A,@0x01                        	00001e 0801		
mov	0x12, a             		; 	MOV	r0x1001,A                      	00001f 3892		
mov	0x13, a             		; 	MOV	r0x1002,A                      	000020 3893		
rca	0x12                		; 	RCA	r0x1001                        	000021 3412		
jbts	0x3, 0             		; 	JBTS	STATUS,0                      	000022 2403		
btc	0x6, 0              		; 	BTC	_PORT6bits,0                   	000023 2806		
jbtc	0x3, 0             		; 	JBTC	STATUS,0                      	000024 2003		
bts	0x6, 0              		; 	BTS	_PORT6bits,0                   	000025 2c06		
;	.line	71; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	POP(_A_BUFF,_R3_BUFF);			//�жϳ�ջ�����ָ�
swapa	0x11              		; 	swapa	_R3_BUFF                     	000026 3611		
mov	0x3, a              		; 	mov	STATUS,a                       	000027 3883		
swapa	0x10              		; 	swapa	_A_BUFF                      	000028 3610		
;	.line	72; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	}
reti                    		; 	RETI	                              	000029 3823		
;	.line	176; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	file_clrRam();					//��RAM
call	0x67               		; 	CALL	_file_clrRam                  	000072 1867		
;	.line	177; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	file_init();					//io�Ĵ�����ʼ��
call	0x3d               		; 	CALL	_file_init                    	000073 183d		
;	.line	178; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	file_project_init();			//�������蹦������
call	0x7                		; 	CALL	_file_project_init            	000074 1807		
;	.line	179; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	EI();							//�����ж�
ei                      		; 	ei	                                	000075 3820		
;	.line	182; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	file_IDLEWake_slep();		//IDLEģʽ����
call	0x2a               		; 	CALL	_file_IDLEWake_slep           	000076 182a		
;	.line	183; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	NOP();
nop                     		; 	nop	                               	000077 3800		
;	.line	184; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	NOP();
nop                     		; 	nop	                               	000078 3800		
;	.line	185; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	NOP();
nop                     		; 	nop	                               	000079 3800		
jmp	0x76                		; 	JMP	_00157_DS_                     	00007a 1076		
;	.line	187; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	}
ret                     		; 	RET	                               	00007b 3822		
;	.line	146; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	for(reg_sleep_cnt=0;reg_sleep_cnt<10;reg_sleep_cnt++)
clr	0x14                		; 	CLR	_reg_sleep_cnt                 	00002a 3994		
;	.line	148; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	DI();
di                      		; 	di	                                	00002b 3821		
;	.line	149; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	CWDT();
cwdt                    		; 	CWDT	                              	00002c 3804		
;	.line	151; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	file_tcc_wakeIDEL_set();	//����ģʽ�£�tcc����IDEL 5V����,12k����,412ms����
call	0x5c               		; 	CALL	_file_tcc_wakeIDEL_set        	00002d 185c		
;	.line	156; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	SLEEP();
sleep                   		; 	sleep	                             	00002e 3803		
;	.line	157; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	NOP();
nop                     		; 	nop	                               	00002f 3800		
;	.line	158; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	NOP();
nop                     		; 	nop	                               	000030 3800		
;	.line	160; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	file_tcc_exitIDEL_set();	//����ģʽ�£�tcc����IDEL
call	0x84               		; 	CALL	_file_tcc_exitIDEL_set        	000031 1884		
;	.line	146; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	for(reg_sleep_cnt=0;reg_sleep_cnt<10;reg_sleep_cnt++)
inc	0x14                		; 	INC	_reg_sleep_cnt                 	000032 3294		
mov	a, @0xa             		; 	MOV	A,@0x0a                        	000033 080a		
sub	a, 0x14             		; 	SUB	A,_reg_sleep_cnt               	000034 3a14		
jbts	0x3, 0             		; 	JBTS	STATUS,0                      	000035 2403		
jmp	0x2b                		; 	JMP	_00151_DS_                     	000036 102b		
;	.line	165; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	reg_sleep_cnt = 0;
clr	0x14                		; 	CLR	_reg_sleep_cnt                 	000037 3994		
;	.line	166; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	io_led2Out=1;	
bts	0x6, 0x1            		; 	BTS	_PORT6bits,1                   	000038 2c86		
;	.line	167; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	NOP();
nop                     		; 	nop	                               	000039 3800		
;	.line	168; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	NOP();
nop                     		; 	nop	                               	00003a 3800		
;	.line	169; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	io_led2Out=0; 
btc	0x6, 0x1            		; 	BTC	_PORT6bits,1                   	00003b 2886		
;	.line	170; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	}
ret                     		; 	RET	                               	00003c 3822		
;	.line	137; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	IDLE=0;					//0:ϵͳִ�� SLEEP ָ��ʱ����˯��ģʽ	
btc	0xe, 0              		; 	BTC	_CPUCONbits,0                  	00008a 280e		
;	.line	138; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	TCCCKS=0;				//TCC ʱ��Դѡ��,0:ѡ��ָ������ʱ��
btc	0xe, 0x5            		; 	BTC	_CPUCONbits,5                  	00008b 2a8e		
;	.line	139; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	TCCWE=0;				//0:TCC ���ѽ�ֹ	 
btc	0xe, 0x3            		; 	BTC	_CPUCONbits,3                  	00008c 298e		
;	.line	140; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	}
ret                     		; 	RET	                               	00008d 3822		
;	.line	128; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	CONTW(0X80);			//����TCCԤ��Ƶ1:2,bit7:RTCSʹ0x84;bit7=1:ѡ���ⲿ����ʱ��(LXT��4��Ƶ�� 
dw	0x880  ;unknown opcode		; 	mov	a,@0X80                        	00007c 0880		
ctw                     		; 	ctw                                	00007d 3802		
;	.line	129; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	TCC=0;					//��ʱ�ж�����T = (1/32.768KHz)*4Clock*2*256 = 62.5ms 
clr	0x1                 		; 	CLR	_TCC                           	00007e 3981		
;	.line	130; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	NOP();
nop                     		; 	nop	                               	00007f 3800		
;	.line	131; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	IDLE=1;					//1:ϵͳִ�� SLEEP ָ��ʱ�������ģʽ��ϵͳʱ����������
bts	0xe, 0              		; 	BTS	_CPUCONbits,0                  	000080 2c0e		
;	.line	132; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	TCCCKS=1;				//TCC ʱ��Դѡ��,1:ѡ��ϵͳʱ��
bts	0xe, 0x5            		; 	BTS	_CPUCONbits,5                  	000081 2e8e		
;	.line	133; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	TCCWE=1;				//1:TCC����ʹ��,�ɻ��ѿ���ģʽ,RTC ģʽ�¿ɻ���˯���Լ�����ģʽ
bts	0xe, 0x3            		; 	BTS	_CPUCONbits,3                  	000082 2d8e		
;	.line	134; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	}
ret                     		; 	RET	                               	000083 3822		
;	.line	116; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	IDLE=0;					//ϵͳִ�� SLEEP ָ��ʱ����˯��ģʽ	
btc	0xe, 0              		; 	BTC	_CPUCONbits,0                  	000001 280e		
;	.line	117; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	PWMCKS=0;				//0:ѡ��ָ������ʱ��
btc	0xe, 0x6            		; 	BTC	_CPUCONbits,6                  	000002 2b0e		
;	.line	118; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	PWMWE=0;				//0:PWM ���ѽ�ֹ	
btc	0xe, 0x4            		; 	BTC	_CPUCONbits,4                  	000003 2a0e		
;	.line	119; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	STPHX=0;				//0:����ʱ����������
btc	0xe, 0x2            		; 	BTC	_CPUCONbits,2                  	000004 290e		
;	.line	120; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	CLKMD=0;				//0:ϵͳʱ��ʹ�ø��� IRC ���߾�������ʱ�� 
btc	0xe, 0x1            		; 	BTC	_CPUCONbits,1                  	000005 288e		
;	.line	121; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	}
ret                     		; 	RET	                               	000006 3822		
;	.line	103; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	PWMCON = 0x88;			//pwm=255*2(��Ƶ)*(1/����RCʱ��)=38ms PWM���ƼĴ��� T1EN PWM3EN PWM2EN PWM1EN T1PTEN T1PSR<2> T1PSR<1> T1PSR<0> 
dw	0x888  ;unknown opcode		; 	MOV	A,@0x88                        	000050 0888		
mov	0x8, a              		; 	MOV	_PWMCON,A                      	000051 3888		
;	.line	104; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	PRD = 255;				//PWM���ڼĴ���
dw	0x8ff  ;unknown opcode		; 	MOV	A,@0xff                        	000052 08ff		
mov	0x9, a              		; 	MOV	_PRD,A                         	000053 3889		
;	.line	105; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	NOP();
nop                     		; 	nop	                               	000054 3800		
;	.line	106; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	NOP();		
nop                     		; 	nop	                               	000055 3800		
;	.line	108; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	IDLE=1;					//1:ϵͳִ�� SLEEP ָ��ʱ�������ģʽ��ϵͳʱ����������
bts	0xe, 0              		; 	BTS	_CPUCONbits,0                  	000056 2c0e		
;	.line	109; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	PWMWE=1;				//1:PWM ����ʹ�ܣ��ɻ��ѿ���ģʽ 
bts	0xe, 0x4            		; 	BTS	_CPUCONbits,4                  	000057 2e0e		
;	.line	110; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	PWMCKS=1;				//1:ѡ��ϵͳʱ��Fosc
bts	0xe, 0x6            		; 	BTS	_CPUCONbits,6                  	000058 2f0e		
;	.line	111; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	CLKMD=1;				//1:ϵͳʱ��ʹ�õ��� RC ����ʱ��
bts	0xe, 0x1            		; 	BTS	_CPUCONbits,1                  	000059 2c8e		
;	.line	112; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	STPHX=1;				//1:ֹͣ����ʱ�ӣ����� IRC �;�������ʱ�ӣ������� RTC ʱ�ӣ� 
bts	0xe, 0x2            		; 	BTS	_CPUCONbits,2                  	00005a 2d0e		
;	.line	113; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	}
ret                     		; 	RET	                               	00005b 3822		
;	.line	91; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	IDLE=0;				//0:ϵͳִ�� SLEEP ָ��ʱ����˯��ģʽ	
btc	0xe, 0              		; 	BTC	_CPUCONbits,0                  	000084 280e		
;	.line	92; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	TCCCKS=0;			//TCC ʱ��Դѡ��,0:ѡ��ָ������ʱ��
btc	0xe, 0x5            		; 	BTC	_CPUCONbits,5                  	000085 2a8e		
;	.line	93; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	TCCWE=0;				//0:TCC ���ѽ�ֹ	
btc	0xe, 0x3            		; 	BTC	_CPUCONbits,3                  	000086 298e		
;	.line	94; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	STPHX=0;			//0:����ʱ����������
btc	0xe, 0x2            		; 	BTC	_CPUCONbits,2                  	000087 290e		
;	.line	95; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	CLKMD=0;			//0:ϵͳʱ��ʹ�ø��� IRC ���߾�������ʱ�� 
btc	0xe, 0x1            		; 	BTC	_CPUCONbits,1                  	000088 288e		
;	.line	96; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	}
ret                     		; 	RET	                               	000089 3822		
;	.line	79; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	CONTW(0X00);		//Ԥ��Ƶ���ָ�TCC 07;Ԥ��Ƶ���ָ�WDT  32.768ms
mov	a, @0               		; 	mov	a,@0X00                        	00005c 0800		
ctw                     		; 	ctw                                	00005d 3802		
;	.line	80; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	NOP();
nop                     		; 	nop	                               	00005e 3800		
;	.line	81; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	NOP();
nop                     		; 	nop	                               	00005f 3800		
;	.line	82; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	TCC=0;				//TCC��ʱ����ʱ��=TCC*TCC��Ƶ*(1/����RCʱ��)=256*2*(1/����RCʱ��)
clr	0x1                 		; 	CLR	_TCC                           	000060 3981		
;	.line	83; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	IDLE=1;				//1:ϵͳִ�� SLEEP ָ��ʱ�������ģʽ��ϵͳʱ����������
bts	0xe, 0              		; 	BTS	_CPUCONbits,0                  	000061 2c0e		
;	.line	84; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	TCCCKS=1;			//TCC ʱ��Դѡ��,1:ѡ��ϵͳʱ��
bts	0xe, 0x5            		; 	BTS	_CPUCONbits,5                  	000062 2e8e		
;	.line	85; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	TCCWE=1;			//1:TCC����ʹ��,�ɻ��ѿ���ģʽ,RTC ģʽ�¿ɻ���˯���Լ�����ģʽ
bts	0xe, 0x3            		; 	BTS	_CPUCONbits,3                  	000063 2d8e		
;	.line	86; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	CLKMD=1;			//1:ϵͳʱ��ʹ�õ��� RC ����ʱ��
bts	0xe, 0x1            		; 	BTS	_CPUCONbits,1                  	000064 2c8e		
;	.line	87; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	STPHX=1;			//1:ֹͣ����ʱ�ӣ����� IRC �;�������ʱ�ӣ������� RTC ʱ�ӣ� 	
bts	0xe, 0x2            		; 	BTS	_CPUCONbits,2                  	000065 2d0e		
;	.line	88; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	}
ret                     		; 	RET	                               	000066 3822		
;	.line	55; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	}
;	.line	55; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	}
ret                     		; 	RET	                               	000007 3822		
;	.line	39; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	CONTW(0x02);			//TCC 8��Ƶ
mov	a, @0x2             		; 	mov	a,@0x02                        	00003d 0802		
ctw                     		; 	ctw                                	00003e 3802		
;	.line	40; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	TCC = data_tcc;			//1/2 * 8 * (256-6) = 1000us	��ʽ��1/IRCƵ�� * Ԥ��Ƶ * ��256-��ֵ��
mov	a, @0x6             		; 	MOV	A,@0x06                        	00003f 0806		
mov	0x1, a              		; 	MOV	_TCC,A                         	000040 3881		
;	.line	41; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	PORT6 = 0;				//P6�������
clr	0x6                 		; 	CLR	_PORT6                         	000041 3986		
;	.line	42; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	IOCP_W(P6CR,0x08);		//P6����Ϊ���
mov	a, @0x8             		; 	mov	a,@0x08                        	000042 0808		
iw	0x6                  		; 	iw	P6CR                            	000043 3806		
;	.line	43; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	IOCP_W(PHDCR,0xff);		//�˿����������ƼĴ�����bit7-bit4��ӦP67-P64����;bit3-bit0��ӦP53-P50���� 
dw	0x8ff  ;unknown opcode		; 	mov	a,@0xff                        	000044 08ff		
iw	0x9                  		; 	iw	PHDCR                           	000045 3809		
;	.line	44; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	IOCP_W(PDCR,0xff);		//�˿��������ƼĴ�����  bit6-bit4��ӦP62-P60,bit3-bit0��ӦP53-P50
dw	0x8ff  ;unknown opcode		; 	mov	a,@0xff                        	000046 08ff		
iw	0xb                  		; 	iw	PDCR                            	000047 380b		
;	.line	45; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	IOCP_W(PHCR,0xff);		//P6�˿��������ƼĴ���  bit7-bit0��ӦP67-P60
dw	0x8ff  ;unknown opcode		; 	mov	a,@0xff                        	000048 08ff		
iw	0xd                  		; 	iw	PHCR                            	000049 380d		
;	.line	46; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	IOCP_W(WDTCR,0x00);		//WDT ʹ�ܿ��ƼĴ���
mov	a, @0               		; 	mov	a,@0x00                        	00004a 0800		
iw	0xe                  		; 	iw	WDTCR                           	00004b 380e		
;	.line	47; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	IOCP_W(IMR,0x01);		//�ж�ʹ�ܿ��ƼĴ��� 
mov	a, @0x1             		; 	mov	a,@0x01                        	00004c 0801		
iw	0xf                  		; 	iw	IMR                             	00004d 380f		
;	.line	48; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	ISR = 0x0;				//��TC0�жϱ�־λ 
clr	0xf                 		; 	CLR	_ISR                           	00004e 398f		
;	.line	49; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	}
ret                     		; 	RET	                               	00004f 3822		
;	.line	29; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	for(RSR=0x90;RSR<0xFF;RSR++)	//���� BANK0 RAM  IAR-R0,RSR-R4
dw	0x890  ;unknown opcode		; 	MOV	A,@0x90                        	000067 0890		
mov	0x4, a              		; 	MOV	_RSR,A                         	000068 3884		
dw	0x8ff  ;unknown opcode		; 	MOV	A,@0xff                        	000069 08ff		
sub	a, 0x4              		; 	SUB	A,_RSR                         	00006a 3a04		
jbtc	0x3, 0             		; 	JBTC	STATUS,0                      	00006b 2003		
jmp	0x70                		; 	JMP	_00105_DS_                     	00006c 1070		
;	.line	31; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	{IAR = 0;}
clr	0                   		; 	CLR	_IAR                           	00006d 3980		
;	.line	29; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	for(RSR=0x90;RSR<0xFF;RSR++)	//���� BANK0 RAM  IAR-R0,RSR-R4
inc	0x4                 		; 	INC	_RSR                           	00006e 3284		
jmp	0x69                		; 	JMP	_00107_DS_                     	00006f 1069		
;	.line	32; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	IAR = 0;
clr	0                   		; 	CLR	_IAR                           	000070 3980		
;	.line	33; E:\00���ܵ�Ƭ��DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE����\XC8P9520-IDLE����.C	}
ret                     		; 	RET	                               	000071 3822		
