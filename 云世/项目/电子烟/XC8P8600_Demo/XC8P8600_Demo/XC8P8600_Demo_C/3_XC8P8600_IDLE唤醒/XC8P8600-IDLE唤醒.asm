jmp	0x6b                		; 	jmp	_main                          	000000 106b		
;	.line	60; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	__asm__("org 0x08");			//中断入口地址			
;	.line	61; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	PUSH(_A_BUFF,_R3_BUFF);			//中断入栈保护
mov	0x10, a             		; 	mov	_A_BUFF,a                      	000008 3890		
swap	0x10               		; 	swap	_A_BUFF                       	000009 3690		
swapa	0x3               		; 	swapa	STATUS                       	00000a 3603		
mov	0x11, a             		; 	mov	_R3_BUFF,a                     	00000b 3891		
;	.line	63; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	if(TCIF)					//判断TCIF是否为1
jbts	0xf, 0             		; 	JBTS	_ISRbits,0                    	00000c 240f		
jmp	0x1f                		; 	JMP	_00121_DS_                     	00000d 101f		
;	.line	65; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	TCC	  += 0x06;				//1/2 * 8 * (256-6) = 1000us	公式：1/IRC频率 * 预分频 * （256-初值）
mov	a, @0x6             		; 	MOV	A,@0x06                        	00000e 0806		
add	0x1, a              		; 	ADD	_TCC,A                         	00000f 3f81		
;	.line	66; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	ISR    = 0xfe;				//清TC0中断标志位
dw	0x8fe  ;unknown opcode		; 	MOV	A,@0xfe                        	000010 08fe		
mov	0xf, a              		; 	MOV	_ISR,A                         	000011 388f		
;	.line	67; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	io_ledOut = !io_ledOut;			//P61口翻转
clr	0x13                		; 	CLR	r0x1001                        	000012 3993		
jbtc	0x6, 0             		; 	JBTC	_PORT6bits,0                  	000013 2006		
inc	0x13                		; 	INC	r0x1001                        	000014 3293		
mov	a, 0x13             		; 	MOV	A,r0x1001                      	000015 3013		
mov	a, @0               		; 	MOV	A,@0x00                        	000016 0800		
jbtc	0x3, 0x2           		; 	JBTC	STATUS,2                      	000017 2103		
mov	a, @0x1             		; 	MOV	A,@0x01                        	000018 0801		
mov	0x13, a             		; 	MOV	r0x1001,A                      	000019 3893		
rca	0x13                		; 	RCA	r0x1001                        	00001a 3413		
jbts	0x3, 0             		; 	JBTS	STATUS,0                      	00001b 2403		
btc	0x6, 0              		; 	BTC	_PORT6bits,0                   	00001c 2806		
jbtc	0x3, 0             		; 	JBTC	STATUS,0                      	00001d 2003		
bts	0x6, 0              		; 	BTS	_PORT6bits,0                   	00001e 2c06		
;	.line	70; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	POP(_A_BUFF,_R3_BUFF);			//中断出栈保护恢复
swapa	0x11              		; 	swapa	_R3_BUFF                     	00001f 3611		
mov	0x3, a              		; 	mov	STATUS,a                       	000020 3883		
swapa	0x10              		; 	swapa	_A_BUFF                      	000021 3610		
;	.line	71; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	}
reti                    		; 	RETI	                              	000022 3823		
;	.line	154; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	file_clrRam();					//清RAM
call	0x60               		; 	CALL	_file_clrRam                  	00006b 1860		
;	.line	155; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	file_init();					//io寄存器初始化
call	0x36               		; 	CALL	_file_init                    	00006c 1836		
;	.line	156; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	file_project_init();			//程序所需功能设置
call	0x7                		; 	CALL	_file_project_init            	00006d 1807		
;	.line	157; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	EI();							//打开总中断
ei                      		; 	ei	                                	00006e 3820		
;	.line	160; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	file_IDLEWake_slep();		//IDLE模式唤醒
call	0x23               		; 	CALL	_file_IDLEWake_slep           	00006f 1823		
;	.line	161; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	NOP();
nop                     		; 	nop	                               	000070 3800		
;	.line	162; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	NOP();
nop                     		; 	nop	                               	000071 3800		
;	.line	163; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	NOP();
nop                     		; 	nop	                               	000072 3800		
jmp	0x6f                		; 	JMP	_00149_DS_                     	000073 106f		
;	.line	165; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	}
ret                     		; 	RET	                               	000074 3822		
;	.line	126; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	for(reg_sleep_cnt=0;reg_sleep_cnt<10;reg_sleep_cnt++)
clr	0x12                		; 	CLR	_reg_sleep_cnt                 	000023 3992		
;	.line	128; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	DI();
di                      		; 	di	                                	000024 3821		
;	.line	129; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	CWDT();
cwdt                    		; 	CWDT	                              	000025 3804		
;	.line	131; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	file_tcc_wakeIDEL_set();	//低速模式下，tcc唤醒IDEL 5V供电,12k左右,434.8ms唤醒
call	0x55               		; 	CALL	_file_tcc_wakeIDEL_set        	000026 1855		
;	.line	135; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	SLEEP();
sleep                   		; 	sleep	                             	000027 3803		
;	.line	136; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	NOP();
nop                     		; 	nop	                               	000028 3800		
;	.line	137; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	NOP();
nop                     		; 	nop	                               	000029 3800		
;	.line	139; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	file_tcc_exitIDEL_set();	//低速模式下，tcc唤醒IDEL
call	0x75               		; 	CALL	_file_tcc_exitIDEL_set        	00002a 1875		
;	.line	126; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	for(reg_sleep_cnt=0;reg_sleep_cnt<10;reg_sleep_cnt++)
inc	0x12                		; 	INC	_reg_sleep_cnt                 	00002b 3292		
mov	a, @0xa             		; 	MOV	A,@0x0a                        	00002c 080a		
sub	a, 0x12             		; 	SUB	A,_reg_sleep_cnt               	00002d 3a12		
jbts	0x3, 0             		; 	JBTS	STATUS,0                      	00002e 2403		
jmp	0x24                		; 	JMP	_00143_DS_                     	00002f 1024		
;	.line	143; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	reg_sleep_cnt = 0;
clr	0x12                		; 	CLR	_reg_sleep_cnt                 	000030 3992		
;	.line	144; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	io_led2Out=1;	
bts	0x6, 0x1            		; 	BTS	_PORT6bits,1                   	000031 2c86		
;	.line	145; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	NOP();
nop                     		; 	nop	                               	000032 3800		
;	.line	146; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	NOP();
nop                     		; 	nop	                               	000033 3800		
;	.line	147; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	io_led2Out=0; 
btc	0x6, 0x1            		; 	BTC	_PORT6bits,1                   	000034 2886		
;	.line	148; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	}
ret                     		; 	RET	                               	000035 3822		
;	.line	115; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	IDLE=0;					//系统执行 SLEEP 指令时进入睡眠模式	
btc	0xe, 0              		; 	BTC	_CPUCONbits,0                  	000001 280e		
;	.line	116; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	PWMCKS=0;				//0:选择指令周期时钟
btc	0xe, 0x6            		; 	BTC	_CPUCONbits,6                  	000002 2b0e		
;	.line	117; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	PWMWE=0;				//0:PWM 唤醒禁止	
btc	0xe, 0x4            		; 	BTC	_CPUCONbits,4                  	000003 2a0e		
;	.line	118; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	STPHX=0;				//0:高速时钟正常工作
btc	0xe, 0x2            		; 	BTC	_CPUCONbits,2                  	000004 290e		
;	.line	119; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	CLKMD=0;				//0:系统时钟使用高速 IRC 或者晶振振荡器时钟 
btc	0xe, 0x1            		; 	BTC	_CPUCONbits,1                  	000005 288e		
;	.line	120; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	}
ret                     		; 	RET	                               	000006 3822		
;	.line	102; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	PWMCON = 0x88;			//pwm=255*2(分频)*(1/低速RC时钟)=38ms PWM控制寄存器 T1EN PWM3EN PWM2EN PWM1EN T1PTEN T1PSR<2> T1PSR<1> T1PSR<0> 
dw	0x888  ;unknown opcode		; 	MOV	A,@0x88                        	000049 0888		
mov	0x8, a              		; 	MOV	_PWMCON,A                      	00004a 3888		
;	.line	103; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	PRD = 255;				//PWM周期寄存器
dw	0x8ff  ;unknown opcode		; 	MOV	A,@0xff                        	00004b 08ff		
mov	0x9, a              		; 	MOV	_PRD,A                         	00004c 3889		
;	.line	104; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	NOP();
nop                     		; 	nop	                               	00004d 3800		
;	.line	105; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	NOP();		
nop                     		; 	nop	                               	00004e 3800		
;	.line	107; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	IDLE=1;					//1:系统执行 SLEEP 指令时进入空闲模式，系统时钟正常工作
bts	0xe, 0              		; 	BTS	_CPUCONbits,0                  	00004f 2c0e		
;	.line	108; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	PWMWE=1;				//1:PWM 唤醒使能，可唤醒空闲模式 
bts	0xe, 0x4            		; 	BTS	_CPUCONbits,4                  	000050 2e0e		
;	.line	109; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	PWMCKS=1;				//1:选择系统时钟Fosc
bts	0xe, 0x6            		; 	BTS	_CPUCONbits,6                  	000051 2f0e		
;	.line	110; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	CLKMD=1;				//1:系统时钟使用低速 RC 振荡器时钟
bts	0xe, 0x1            		; 	BTS	_CPUCONbits,1                  	000052 2c8e		
;	.line	111; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	STPHX=1;				//1:停止高速时钟，包括 IRC 和晶振振荡器时钟（不包括 RTC 时钟） 
bts	0xe, 0x2            		; 	BTS	_CPUCONbits,2                  	000053 2d0e		
;	.line	112; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	}
ret                     		; 	RET	                               	000054 3822		
;	.line	90; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	IDLE=0;				//0:系统执行 SLEEP 指令时进入睡眠模式	
btc	0xe, 0              		; 	BTC	_CPUCONbits,0                  	000075 280e		
;	.line	91; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	TCCCKS=0;			//TCC 时钟源选择,0:选择指令周期时钟
btc	0xe, 0x5            		; 	BTC	_CPUCONbits,5                  	000076 2a8e		
;	.line	92; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	TCCWE=0;				//0:TCC 唤醒禁止	
btc	0xe, 0x3            		; 	BTC	_CPUCONbits,3                  	000077 298e		
;	.line	93; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	STPHX=0;			//0:高速时钟正常工作
btc	0xe, 0x2            		; 	BTC	_CPUCONbits,2                  	000078 290e		
;	.line	94; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	CLKMD=0;			//0:系统时钟使用高速 IRC 或者晶振振荡器时钟 
btc	0xe, 0x1            		; 	BTC	_CPUCONbits,1                  	000079 288e		
;	.line	95; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	}
ret                     		; 	RET	                               	00007a 3822		
;	.line	78; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	CONTW(0X00);		//预分频器分给TCC 07;预分频器分给WDT  32.768ms
mov	a, @0               		; 	mov	a,@0X00                        	000055 0800		
ctw                     		; 	ctw                                	000056 3802		
;	.line	79; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	NOP();
nop                     		; 	nop	                               	000057 3800		
;	.line	80; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	NOP();
nop                     		; 	nop	                               	000058 3800		
;	.line	81; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	TCC=0;				//TCC定时唤醒时间=TCC*TCC分频*(1/低速RC时钟)=256*2*(1/低速RC时钟)
clr	0x1                 		; 	CLR	_TCC                           	000059 3981		
;	.line	82; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	IDLE=1;				//1:系统执行 SLEEP 指令时进入空闲模式，系统时钟正常工作
bts	0xe, 0              		; 	BTS	_CPUCONbits,0                  	00005a 2c0e		
;	.line	83; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	TCCCKS=1;			//TCC 时钟源选择,1:选择系统时钟
bts	0xe, 0x5            		; 	BTS	_CPUCONbits,5                  	00005b 2e8e		
;	.line	84; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	TCCWE=1;			//1:TCC唤醒使能,可唤醒空闲模式,RTC 模式下可唤醒睡眠以及空闲模式
bts	0xe, 0x3            		; 	BTS	_CPUCONbits,3                  	00005c 2d8e		
;	.line	85; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	CLKMD=1;			//1:系统时钟使用低速 RC 振荡器时钟
bts	0xe, 0x1            		; 	BTS	_CPUCONbits,1                  	00005d 2c8e		
;	.line	86; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	STPHX=1;			//1:停止高速时钟，包括 IRC 和晶振振荡器时钟（不包括 RTC 时钟） 	
bts	0xe, 0x2            		; 	BTS	_CPUCONbits,2                  	00005e 2d0e		
;	.line	87; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	}
ret                     		; 	RET	                               	00005f 3822		
;	.line	54; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	}
;	.line	54; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	}
ret                     		; 	RET	                               	000007 3822		
;	.line	38; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	CONTW(0x02);			//TCC 8分频
mov	a, @0x2             		; 	mov	a,@0x02                        	000036 0802		
ctw                     		; 	ctw                                	000037 3802		
;	.line	39; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	TCC = data_tcc;			//1/2 * 8 * (256-6) = 1000us	公式：1/IRC频率 * 预分频 * （256-初值）
mov	a, @0x6             		; 	MOV	A,@0x06                        	000038 0806		
mov	0x1, a              		; 	MOV	_TCC,A                         	000039 3881		
;	.line	40; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	PORT6 = 0;				//P6口输出低
clr	0x6                 		; 	CLR	_PORT6                         	00003a 3986		
;	.line	41; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	IOCP_W(P6CR,0x08);		//P6口设为输出
mov	a, @0x8             		; 	mov	a,@0x08                        	00003b 0808		
iw	0x6                  		; 	iw	P6CR                            	00003c 3806		
;	.line	42; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	IOCP_W(PHDCR,0xff);		//端口上下拉控制寄存器，bit7-bit4对应P67-P64下拉;bit3-bit0对应P53-P50上拉 
dw	0x8ff  ;unknown opcode		; 	mov	a,@0xff                        	00003d 08ff		
iw	0x9                  		; 	iw	PHDCR                           	00003e 3809		
;	.line	43; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	IOCP_W(PDCR,0xff);		//端口下拉控制寄存器，  bit6-bit4对应P62-P60,bit3-bit0对应P53-P50
dw	0x8ff  ;unknown opcode		; 	mov	a,@0xff                        	00003f 08ff		
iw	0xb                  		; 	iw	PDCR                            	000040 380b		
;	.line	44; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	IOCP_W(PHCR,0xff);		//P6端口上拉控制寄存器  bit7-bit0对应P67-P60
dw	0x8ff  ;unknown opcode		; 	mov	a,@0xff                        	000041 08ff		
iw	0xd                  		; 	iw	PHCR                            	000042 380d		
;	.line	45; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	IOCP_W(WDTCR,0x00);		//WDT 使能控制寄存器
mov	a, @0               		; 	mov	a,@0x00                        	000043 0800		
iw	0xe                  		; 	iw	WDTCR                           	000044 380e		
;	.line	46; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	IOCP_W(IMR,0x01);		//中断使能控制寄存器 
mov	a, @0x1             		; 	mov	a,@0x01                        	000045 0801		
iw	0xf                  		; 	iw	IMR                             	000046 380f		
;	.line	47; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	ISR = 0x0;				//清TC0中断标志位 
clr	0xf                 		; 	CLR	_ISR                           	000047 398f		
;	.line	48; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	}
ret                     		; 	RET	                               	000048 3822		
;	.line	29; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	for(RSR=0x90;RSR<0xFF;RSR++)	//清零 BANK0 RAM  IAR-R0,RSR-R4
dw	0x890  ;unknown opcode		; 	MOV	A,@0x90                        	000060 0890		
mov	0x4, a              		; 	MOV	_RSR,A                         	000061 3884		
dw	0x8ff  ;unknown opcode		; 	MOV	A,@0xff                        	000062 08ff		
sub	a, 0x4              		; 	SUB	A,_RSR                         	000063 3a04		
jbtc	0x3, 0             		; 	JBTC	STATUS,0                      	000064 2003		
jmp	0x69                		; 	JMP	_00105_DS_                     	000065 1069		
;	.line	30; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	{IAR = 0;}
clr	0                   		; 	CLR	_IAR                           	000066 3980		
;	.line	29; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	for(RSR=0x90;RSR<0xFF;RSR++)	//清零 BANK0 RAM  IAR-R0,RSR-R4
inc	0x4                 		; 	INC	_RSR                           	000067 3284		
jmp	0x62                		; 	JMP	_00107_DS_                     	000068 1062		
;	.line	31; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	IAR = 0;
clr	0                   		; 	CLR	_IAR                           	000069 3980		
;	.line	32; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\3_XC8P8600_IDLE唤醒\XC8P8600-IDLE唤醒.C	}
ret                     		; 	RET	                               	00006a 3822		
