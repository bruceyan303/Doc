jmp	0x72                		; 	jmp	_main                          	000000 1072		
;	.line	61; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	__asm__("org 0x08");			//中断入口地址			
;	.line	62; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	PUSH(_A_BUFF,_R3_BUFF);			//中断入栈保护
mov	0x10, a             		; 	mov	_A_BUFF,a                      	000008 3890		
swap	0x10               		; 	swap	_A_BUFF                       	000009 3690		
swapa	0x3               		; 	swapa	STATUS                       	00000a 3603		
mov	0x11, a             		; 	mov	_R3_BUFF,a                     	00000b 3891		
;	.line	64; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	if(TCIF == 1)					//判断TCIF是否为1
clr	0x12                		; 	CLR	r0x1001                        	00000c 3992		
jbtc	0xf, 0             		; 	JBTC	_ISRbits,0                    	00000d 200f		
inc	0x12                		; 	INC	r0x1001                        	00000e 3292		
mov	a, 0x12             		; 	MOV	A,r0x1001                      	00000f 3012		
mov	0x13, a             		; 	MOV	r0x1002,A                      	000010 3893		
xor	a, @0x1             		; 	XOR	A,@0x01                        	000011 0e01		
jbts	0x3, 0x2           		; 	JBTS	STATUS,2                      	000012 2503		
jmp	0x26                		; 	JMP	_00121_DS_                     	000013 1026		
;	.line	66; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	TCC	  += 0x06;				//1/2 * 8 * (256-6) = 1000us	公式：1/IRC频率 * 预分频 * （256-初值）
mov	a, @0x6             		; 	MOV	A,@0x06                        	000014 0806		
add	0x1, a              		; 	ADD	_TCC,A                         	000015 3f81		
;	.line	67; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	ISR    = 0xfe;				//清TC0中断标志位
dw	0x8fe  ;unknown opcode		; 	MOV	A,@0xfe                        	000016 08fe		
mov	0xf, a              		; 	MOV	_ISR,A                         	000017 388f		
;	.line	68; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	io_ledOut = !io_ledOut;			//P61口翻转
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
;	.line	71; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	POP(_A_BUFF,_R3_BUFF);			//中断出栈保护恢复
swapa	0x11              		; 	swapa	_R3_BUFF                     	000026 3611		
mov	0x3, a              		; 	mov	STATUS,a                       	000027 3883		
swapa	0x10              		; 	swapa	_A_BUFF                      	000028 3610		
;	.line	72; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	}
reti                    		; 	RETI	                              	000029 3823		
;	.line	176; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	file_clrRam();					//清RAM
call	0x67               		; 	CALL	_file_clrRam                  	000072 1867		
;	.line	177; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	file_init();					//io寄存器初始化
call	0x3d               		; 	CALL	_file_init                    	000073 183d		
;	.line	178; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	file_project_init();			//程序所需功能设置
call	0x7                		; 	CALL	_file_project_init            	000074 1807		
;	.line	179; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	EI();							//打开总中断
ei                      		; 	ei	                                	000075 3820		
;	.line	182; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	file_IDLEWake_slep();		//IDLE模式唤醒
call	0x2a               		; 	CALL	_file_IDLEWake_slep           	000076 182a		
;	.line	183; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	NOP();
nop                     		; 	nop	                               	000077 3800		
;	.line	184; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	NOP();
nop                     		; 	nop	                               	000078 3800		
;	.line	185; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	NOP();
nop                     		; 	nop	                               	000079 3800		
jmp	0x76                		; 	JMP	_00157_DS_                     	00007a 1076		
;	.line	187; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	}
ret                     		; 	RET	                               	00007b 3822		
;	.line	146; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	for(reg_sleep_cnt=0;reg_sleep_cnt<10;reg_sleep_cnt++)
clr	0x14                		; 	CLR	_reg_sleep_cnt                 	00002a 3994		
;	.line	148; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	DI();
di                      		; 	di	                                	00002b 3821		
;	.line	149; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	CWDT();
cwdt                    		; 	CWDT	                              	00002c 3804		
;	.line	151; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	file_tcc_wakeIDEL_set();	//低速模式下，tcc唤醒IDEL 5V供电,12k左右,412ms唤醒
call	0x5c               		; 	CALL	_file_tcc_wakeIDEL_set        	00002d 185c		
;	.line	156; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	SLEEP();
sleep                   		; 	sleep	                             	00002e 3803		
;	.line	157; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	NOP();
nop                     		; 	nop	                               	00002f 3800		
;	.line	158; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	NOP();
nop                     		; 	nop	                               	000030 3800		
;	.line	160; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	file_tcc_exitIDEL_set();	//低速模式下，tcc唤醒IDEL
call	0x84               		; 	CALL	_file_tcc_exitIDEL_set        	000031 1884		
;	.line	146; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	for(reg_sleep_cnt=0;reg_sleep_cnt<10;reg_sleep_cnt++)
inc	0x14                		; 	INC	_reg_sleep_cnt                 	000032 3294		
mov	a, @0xa             		; 	MOV	A,@0x0a                        	000033 080a		
sub	a, 0x14             		; 	SUB	A,_reg_sleep_cnt               	000034 3a14		
jbts	0x3, 0             		; 	JBTS	STATUS,0                      	000035 2403		
jmp	0x2b                		; 	JMP	_00151_DS_                     	000036 102b		
;	.line	165; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	reg_sleep_cnt = 0;
clr	0x14                		; 	CLR	_reg_sleep_cnt                 	000037 3994		
;	.line	166; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	io_led2Out=1;	
bts	0x6, 0x1            		; 	BTS	_PORT6bits,1                   	000038 2c86		
;	.line	167; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	NOP();
nop                     		; 	nop	                               	000039 3800		
;	.line	168; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	NOP();
nop                     		; 	nop	                               	00003a 3800		
;	.line	169; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	io_led2Out=0; 
btc	0x6, 0x1            		; 	BTC	_PORT6bits,1                   	00003b 2886		
;	.line	170; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	}
ret                     		; 	RET	                               	00003c 3822		
;	.line	137; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	IDLE=0;					//0:系统执行 SLEEP 指令时进入睡眠模式	
btc	0xe, 0              		; 	BTC	_CPUCONbits,0                  	00008a 280e		
;	.line	138; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	TCCCKS=0;				//TCC 时钟源选择,0:选择指令周期时钟
btc	0xe, 0x5            		; 	BTC	_CPUCONbits,5                  	00008b 2a8e		
;	.line	139; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	TCCWE=0;				//0:TCC 唤醒禁止	 
btc	0xe, 0x3            		; 	BTC	_CPUCONbits,3                  	00008c 298e		
;	.line	140; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	}
ret                     		; 	RET	                               	00008d 3822		
;	.line	128; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	CONTW(0X80);			//设置TCC预分频1:2,bit7:RTCS使0x84;bit7=1:选择外部晶振时钟(LXT的4分频） 
dw	0x880  ;unknown opcode		; 	mov	a,@0X80                        	00007c 0880		
ctw                     		; 	ctw                                	00007d 3802		
;	.line	129; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	TCC=0;					//定时中断设置T = (1/32.768KHz)*4Clock*2*256 = 62.5ms 
clr	0x1                 		; 	CLR	_TCC                           	00007e 3981		
;	.line	130; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	NOP();
nop                     		; 	nop	                               	00007f 3800		
;	.line	131; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	IDLE=1;					//1:系统执行 SLEEP 指令时进入空闲模式，系统时钟正常工作
bts	0xe, 0              		; 	BTS	_CPUCONbits,0                  	000080 2c0e		
;	.line	132; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	TCCCKS=1;				//TCC 时钟源选择,1:选择系统时钟
bts	0xe, 0x5            		; 	BTS	_CPUCONbits,5                  	000081 2e8e		
;	.line	133; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	TCCWE=1;				//1:TCC唤醒使能,可唤醒空闲模式,RTC 模式下可唤醒睡眠以及空闲模式
bts	0xe, 0x3            		; 	BTS	_CPUCONbits,3                  	000082 2d8e		
;	.line	134; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	}
ret                     		; 	RET	                               	000083 3822		
;	.line	116; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	IDLE=0;					//系统执行 SLEEP 指令时进入睡眠模式	
btc	0xe, 0              		; 	BTC	_CPUCONbits,0                  	000001 280e		
;	.line	117; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	PWMCKS=0;				//0:选择指令周期时钟
btc	0xe, 0x6            		; 	BTC	_CPUCONbits,6                  	000002 2b0e		
;	.line	118; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	PWMWE=0;				//0:PWM 唤醒禁止	
btc	0xe, 0x4            		; 	BTC	_CPUCONbits,4                  	000003 2a0e		
;	.line	119; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	STPHX=0;				//0:高速时钟正常工作
btc	0xe, 0x2            		; 	BTC	_CPUCONbits,2                  	000004 290e		
;	.line	120; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	CLKMD=0;				//0:系统时钟使用高速 IRC 或者晶振振荡器时钟 
btc	0xe, 0x1            		; 	BTC	_CPUCONbits,1                  	000005 288e		
;	.line	121; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	}
ret                     		; 	RET	                               	000006 3822		
;	.line	103; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	PWMCON = 0x88;			//pwm=255*2(分频)*(1/低速RC时钟)=38ms PWM控制寄存器 T1EN PWM3EN PWM2EN PWM1EN T1PTEN T1PSR<2> T1PSR<1> T1PSR<0> 
dw	0x888  ;unknown opcode		; 	MOV	A,@0x88                        	000050 0888		
mov	0x8, a              		; 	MOV	_PWMCON,A                      	000051 3888		
;	.line	104; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	PRD = 255;				//PWM周期寄存器
dw	0x8ff  ;unknown opcode		; 	MOV	A,@0xff                        	000052 08ff		
mov	0x9, a              		; 	MOV	_PRD,A                         	000053 3889		
;	.line	105; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	NOP();
nop                     		; 	nop	                               	000054 3800		
;	.line	106; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	NOP();		
nop                     		; 	nop	                               	000055 3800		
;	.line	108; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	IDLE=1;					//1:系统执行 SLEEP 指令时进入空闲模式，系统时钟正常工作
bts	0xe, 0              		; 	BTS	_CPUCONbits,0                  	000056 2c0e		
;	.line	109; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	PWMWE=1;				//1:PWM 唤醒使能，可唤醒空闲模式 
bts	0xe, 0x4            		; 	BTS	_CPUCONbits,4                  	000057 2e0e		
;	.line	110; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	PWMCKS=1;				//1:选择系统时钟Fosc
bts	0xe, 0x6            		; 	BTS	_CPUCONbits,6                  	000058 2f0e		
;	.line	111; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	CLKMD=1;				//1:系统时钟使用低速 RC 振荡器时钟
bts	0xe, 0x1            		; 	BTS	_CPUCONbits,1                  	000059 2c8e		
;	.line	112; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	STPHX=1;				//1:停止高速时钟，包括 IRC 和晶振振荡器时钟（不包括 RTC 时钟） 
bts	0xe, 0x2            		; 	BTS	_CPUCONbits,2                  	00005a 2d0e		
;	.line	113; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	}
ret                     		; 	RET	                               	00005b 3822		
;	.line	91; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	IDLE=0;				//0:系统执行 SLEEP 指令时进入睡眠模式	
btc	0xe, 0              		; 	BTC	_CPUCONbits,0                  	000084 280e		
;	.line	92; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	TCCCKS=0;			//TCC 时钟源选择,0:选择指令周期时钟
btc	0xe, 0x5            		; 	BTC	_CPUCONbits,5                  	000085 2a8e		
;	.line	93; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	TCCWE=0;				//0:TCC 唤醒禁止	
btc	0xe, 0x3            		; 	BTC	_CPUCONbits,3                  	000086 298e		
;	.line	94; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	STPHX=0;			//0:高速时钟正常工作
btc	0xe, 0x2            		; 	BTC	_CPUCONbits,2                  	000087 290e		
;	.line	95; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	CLKMD=0;			//0:系统时钟使用高速 IRC 或者晶振振荡器时钟 
btc	0xe, 0x1            		; 	BTC	_CPUCONbits,1                  	000088 288e		
;	.line	96; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	}
ret                     		; 	RET	                               	000089 3822		
;	.line	79; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	CONTW(0X00);		//预分频器分给TCC 07;预分频器分给WDT  32.768ms
mov	a, @0               		; 	mov	a,@0X00                        	00005c 0800		
ctw                     		; 	ctw                                	00005d 3802		
;	.line	80; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	NOP();
nop                     		; 	nop	                               	00005e 3800		
;	.line	81; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	NOP();
nop                     		; 	nop	                               	00005f 3800		
;	.line	82; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	TCC=0;				//TCC定时唤醒时间=TCC*TCC分频*(1/低速RC时钟)=256*2*(1/低速RC时钟)
clr	0x1                 		; 	CLR	_TCC                           	000060 3981		
;	.line	83; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	IDLE=1;				//1:系统执行 SLEEP 指令时进入空闲模式，系统时钟正常工作
bts	0xe, 0              		; 	BTS	_CPUCONbits,0                  	000061 2c0e		
;	.line	84; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	TCCCKS=1;			//TCC 时钟源选择,1:选择系统时钟
bts	0xe, 0x5            		; 	BTS	_CPUCONbits,5                  	000062 2e8e		
;	.line	85; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	TCCWE=1;			//1:TCC唤醒使能,可唤醒空闲模式,RTC 模式下可唤醒睡眠以及空闲模式
bts	0xe, 0x3            		; 	BTS	_CPUCONbits,3                  	000063 2d8e		
;	.line	86; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	CLKMD=1;			//1:系统时钟使用低速 RC 振荡器时钟
bts	0xe, 0x1            		; 	BTS	_CPUCONbits,1                  	000064 2c8e		
;	.line	87; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	STPHX=1;			//1:停止高速时钟，包括 IRC 和晶振振荡器时钟（不包括 RTC 时钟） 	
bts	0xe, 0x2            		; 	BTS	_CPUCONbits,2                  	000065 2d0e		
;	.line	88; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	}
ret                     		; 	RET	                               	000066 3822		
;	.line	55; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	}
;	.line	55; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	}
ret                     		; 	RET	                               	000007 3822		
;	.line	39; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	CONTW(0x02);			//TCC 8分频
mov	a, @0x2             		; 	mov	a,@0x02                        	00003d 0802		
ctw                     		; 	ctw                                	00003e 3802		
;	.line	40; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	TCC = data_tcc;			//1/2 * 8 * (256-6) = 1000us	公式：1/IRC频率 * 预分频 * （256-初值）
mov	a, @0x6             		; 	MOV	A,@0x06                        	00003f 0806		
mov	0x1, a              		; 	MOV	_TCC,A                         	000040 3881		
;	.line	41; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	PORT6 = 0;				//P6口输出低
clr	0x6                 		; 	CLR	_PORT6                         	000041 3986		
;	.line	42; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	IOCP_W(P6CR,0x08);		//P6口设为输出
mov	a, @0x8             		; 	mov	a,@0x08                        	000042 0808		
iw	0x6                  		; 	iw	P6CR                            	000043 3806		
;	.line	43; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	IOCP_W(PHDCR,0xff);		//端口上下拉控制寄存器，bit7-bit4对应P67-P64下拉;bit3-bit0对应P53-P50上拉 
dw	0x8ff  ;unknown opcode		; 	mov	a,@0xff                        	000044 08ff		
iw	0x9                  		; 	iw	PHDCR                           	000045 3809		
;	.line	44; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	IOCP_W(PDCR,0xff);		//端口下拉控制寄存器，  bit6-bit4对应P62-P60,bit3-bit0对应P53-P50
dw	0x8ff  ;unknown opcode		; 	mov	a,@0xff                        	000046 08ff		
iw	0xb                  		; 	iw	PDCR                            	000047 380b		
;	.line	45; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	IOCP_W(PHCR,0xff);		//P6端口上拉控制寄存器  bit7-bit0对应P67-P60
dw	0x8ff  ;unknown opcode		; 	mov	a,@0xff                        	000048 08ff		
iw	0xd                  		; 	iw	PHCR                            	000049 380d		
;	.line	46; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	IOCP_W(WDTCR,0x00);		//WDT 使能控制寄存器
mov	a, @0               		; 	mov	a,@0x00                        	00004a 0800		
iw	0xe                  		; 	iw	WDTCR                           	00004b 380e		
;	.line	47; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	IOCP_W(IMR,0x01);		//中断使能控制寄存器 
mov	a, @0x1             		; 	mov	a,@0x01                        	00004c 0801		
iw	0xf                  		; 	iw	IMR                             	00004d 380f		
;	.line	48; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	ISR = 0x0;				//清TC0中断标志位 
clr	0xf                 		; 	CLR	_ISR                           	00004e 398f		
;	.line	49; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	}
ret                     		; 	RET	                               	00004f 3822		
;	.line	29; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	for(RSR=0x90;RSR<0xFF;RSR++)	//清零 BANK0 RAM  IAR-R0,RSR-R4
dw	0x890  ;unknown opcode		; 	MOV	A,@0x90                        	000067 0890		
mov	0x4, a              		; 	MOV	_RSR,A                         	000068 3884		
dw	0x8ff  ;unknown opcode		; 	MOV	A,@0xff                        	000069 08ff		
sub	a, 0x4              		; 	SUB	A,_RSR                         	00006a 3a04		
jbtc	0x3, 0             		; 	JBTC	STATUS,0                      	00006b 2003		
jmp	0x70                		; 	JMP	_00105_DS_                     	00006c 1070		
;	.line	31; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	{IAR = 0;}
clr	0                   		; 	CLR	_IAR                           	00006d 3980		
;	.line	29; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	for(RSR=0x90;RSR<0xFF;RSR++)	//清零 BANK0 RAM  IAR-R0,RSR-R4
inc	0x4                 		; 	INC	_RSR                           	00006e 3284		
jmp	0x69                		; 	JMP	_00107_DS_                     	00006f 1069		
;	.line	32; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	IAR = 0;
clr	0                   		; 	CLR	_IAR                           	000070 3980		
;	.line	33; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\3_XC8P9520_IDLE唤醒\XC8P9520-IDLE唤醒.C	}
ret                     		; 	RET	                               	000071 3822		
