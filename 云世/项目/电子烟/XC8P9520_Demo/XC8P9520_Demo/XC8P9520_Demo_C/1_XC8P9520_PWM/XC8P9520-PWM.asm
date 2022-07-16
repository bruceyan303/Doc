jmp	0x6d                		; 	jmp	_main                          	000000 106d		
;	.line	74; D:\DOC\DOC\云世\项目\电子烟\XC8P9520_DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\1_XC8P9520_PWM\XC8P9520-PWM.C	__asm__("org 0x08");			//中断入口地址			
;	.line	75; D:\DOC\DOC\云世\项目\电子烟\XC8P9520_DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\1_XC8P9520_PWM\XC8P9520-PWM.C	PUSH(_A_BUFF,_R3_BUFF);			//中断入栈保护
mov	0x10, a             		; 	mov	_A_BUFF,a                      	000008 3890		
swap	0x10               		; 	swap	_A_BUFF                       	000009 3690		
swapa	0x3               		; 	swapa	STATUS                       	00000a 3603		
mov	0x11, a             		; 	mov	_R3_BUFF,a                     	00000b 3891		
;	.line	77; D:\DOC\DOC\云世\项目\电子烟\XC8P9520_DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\1_XC8P9520_PWM\XC8P9520-PWM.C	if(TCIF == 1)					//判断TCIF是否为1
clr	0x12                		; 	CLR	r0x1000                        	00000c 3992		
jbtc	0xf, 0             		; 	JBTC	_ISRbits,0                    	00000d 200f		
inc	0x12                		; 	INC	r0x1000                        	00000e 3292		
mov	a, 0x12             		; 	MOV	A,r0x1000                      	00000f 3012		
mov	0x13, a             		; 	MOV	r0x1001,A                      	000010 3893		
xor	a, @0x1             		; 	XOR	A,@0x01                        	000011 0e01		
jbts	0x3, 0x2           		; 	JBTS	STATUS,2                      	000012 2503		
jmp	0x26                		; 	JMP	_00121_DS_                     	000013 1026		
;	.line	79; D:\DOC\DOC\云世\项目\电子烟\XC8P9520_DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\1_XC8P9520_PWM\XC8P9520-PWM.C	TCC	  += 6;			//1/2 * 8 * (256-6) = 1000us	公式：1/IRC频率 * 预分频 * （256-初值）
mov	a, @0x6             		; 	MOV	A,@0x06                        	000014 0806		
add	0x1, a              		; 	ADD	_TCC,A                         	000015 3f81		
;	.line	80; D:\DOC\DOC\云世\项目\电子烟\XC8P9520_DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\1_XC8P9520_PWM\XC8P9520-PWM.C	ISR    = 0xfe;				//清TC0中断标志位
dw	0x8fe  ;unknown opcode		; 	MOV	A,@0xfe                        	000016 08fe		
mov	0xf, a              		; 	MOV	_ISR,A                         	000017 388f		
;	.line	81; D:\DOC\DOC\云世\项目\电子烟\XC8P9520_DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\1_XC8P9520_PWM\XC8P9520-PWM.C	PORT6_4 = !PORT6_4;			//P64口翻转
clr	0x12                		; 	CLR	r0x1000                        	000018 3992		
jbtc	0x6, 0x4           		; 	JBTC	_PORT6bits,4                  	000019 2206		
inc	0x12                		; 	INC	r0x1000                        	00001a 3292		
mov	a, 0x12             		; 	MOV	A,r0x1000                      	00001b 3012		
mov	a, @0               		; 	MOV	A,@0x00                        	00001c 0800		
jbtc	0x3, 0x2           		; 	JBTC	STATUS,2                      	00001d 2103		
mov	a, @0x1             		; 	MOV	A,@0x01                        	00001e 0801		
mov	0x12, a             		; 	MOV	r0x1000,A                      	00001f 3892		
mov	0x13, a             		; 	MOV	r0x1001,A                      	000020 3893		
rca	0x12                		; 	RCA	r0x1000                        	000021 3412		
jbts	0x3, 0             		; 	JBTS	STATUS,0                      	000022 2403		
btc	0x6, 0x4            		; 	BTC	_PORT6bits,4                   	000023 2a06		
jbtc	0x3, 0             		; 	JBTC	STATUS,0                      	000024 2003		
bts	0x6, 0x4            		; 	BTS	_PORT6bits,4                   	000025 2e06		
;	.line	84; D:\DOC\DOC\云世\项目\电子烟\XC8P9520_DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\1_XC8P9520_PWM\XC8P9520-PWM.C	if(T1IF == 1)					//判断T1IF是否为1,pwm周期中断
clr	0x12                		; 	CLR	r0x1000                        	000026 3992		
jbtc	0xf, 0x3           		; 	JBTC	_ISRbits,3                    	000027 218f		
inc	0x12                		; 	INC	r0x1000                        	000028 3292		
mov	a, 0x12             		; 	MOV	A,r0x1000                      	000029 3012		
mov	0x13, a             		; 	MOV	r0x1001,A                      	00002a 3893		
xor	a, @0x1             		; 	XOR	A,@0x01                        	00002b 0e01		
jbts	0x3, 0x2           		; 	JBTS	STATUS,2                      	00002c 2503		
jmp	0x3e                		; 	JMP	_00123_DS_                     	00002d 103e		
;	.line	86; D:\DOC\DOC\云世\项目\电子烟\XC8P9520_DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\1_XC8P9520_PWM\XC8P9520-PWM.C	ISR    = 0xf7;				//ISR的bit3:T1IF清零
dw	0x8f7  ;unknown opcode		; 	MOV	A,@0xf7                        	00002e 08f7		
mov	0xf, a              		; 	MOV	_ISR,A                         	00002f 388f		
;	.line	87; D:\DOC\DOC\云世\项目\电子烟\XC8P9520_DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\1_XC8P9520_PWM\XC8P9520-PWM.C	PORT6_5 = !PORT6_5;			//P65口翻转
clr	0x12                		; 	CLR	r0x1000                        	000030 3992		
jbtc	0x6, 0x5           		; 	JBTC	_PORT6bits,5                  	000031 2286		
inc	0x12                		; 	INC	r0x1000                        	000032 3292		
mov	a, 0x12             		; 	MOV	A,r0x1000                      	000033 3012		
mov	a, @0               		; 	MOV	A,@0x00                        	000034 0800		
jbtc	0x3, 0x2           		; 	JBTC	STATUS,2                      	000035 2103		
mov	a, @0x1             		; 	MOV	A,@0x01                        	000036 0801		
mov	0x12, a             		; 	MOV	r0x1000,A                      	000037 3892		
mov	0x13, a             		; 	MOV	r0x1001,A                      	000038 3893		
rca	0x12                		; 	RCA	r0x1000                        	000039 3412		
jbts	0x3, 0             		; 	JBTS	STATUS,0                      	00003a 2403		
btc	0x6, 0x5            		; 	BTC	_PORT6bits,5                   	00003b 2a86		
jbtc	0x3, 0             		; 	JBTC	STATUS,0                      	00003c 2003		
bts	0x6, 0x5            		; 	BTS	_PORT6bits,5                   	00003d 2e86		
;	.line	90; D:\DOC\DOC\云世\项目\电子烟\XC8P9520_DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\1_XC8P9520_PWM\XC8P9520-PWM.C	POP(_A_BUFF,_R3_BUFF);			//中断出栈保护恢复
swapa	0x11              		; 	swapa	_R3_BUFF                     	00003e 3611		
mov	0x3, a              		; 	mov	STATUS,a                       	00003f 3883		
swapa	0x10              		; 	swapa	_A_BUFF                      	000040 3610		
;	.line	91; D:\DOC\DOC\云世\项目\电子烟\XC8P9520_DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\1_XC8P9520_PWM\XC8P9520-PWM.C	}
reti                    		; 	RETI	                              	000041 3823		
;	.line	98; D:\DOC\DOC\云世\项目\电子烟\XC8P9520_DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\1_XC8P9520_PWM\XC8P9520-PWM.C	file_clrRam();					//清RAM
call	0x62               		; 	CALL	_file_clrRam                  	00006d 1862		
;	.line	99; D:\DOC\DOC\云世\项目\电子烟\XC8P9520_DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\1_XC8P9520_PWM\XC8P9520-PWM.C	file_init();					//io寄存器初始化
call	0x42               		; 	CALL	_file_init                    	00006e 1842		
;	.line	100; D:\DOC\DOC\云世\项目\电子烟\XC8P9520_DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\1_XC8P9520_PWM\XC8P9520-PWM.C	file_project_init();			//程序所需功能设置
call	0x55               		; 	CALL	_file_project_init            	00006f 1855		
;	.line	101; D:\DOC\DOC\云世\项目\电子烟\XC8P9520_DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\1_XC8P9520_PWM\XC8P9520-PWM.C	EI();							//打开总中断
ei                      		; 	ei	                                	000070 3820		
;	.line	105; D:\DOC\DOC\云世\项目\电子烟\XC8P9520_DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\1_XC8P9520_PWM\XC8P9520-PWM.C	NOP();
nop                     		; 	nop	                               	000071 3800		
;	.line	106; D:\DOC\DOC\云世\项目\电子烟\XC8P9520_DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\1_XC8P9520_PWM\XC8P9520-PWM.C	NOP();
nop                     		; 	nop	                               	000072 3800		
;	.line	107; D:\DOC\DOC\云世\项目\电子烟\XC8P9520_DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\1_XC8P9520_PWM\XC8P9520-PWM.C	NOP();
nop                     		; 	nop	                               	000073 3800		
jmp	0x71                		; 	JMP	_00129_DS_                     	000074 1071		
;	.line	109; D:\DOC\DOC\云世\项目\电子烟\XC8P9520_DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\1_XC8P9520_PWM\XC8P9520-PWM.C	}
ret                     		; 	RET	                               	000075 3822		
;	.line	62; D:\DOC\DOC\云世\项目\电子烟\XC8P9520_DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\1_XC8P9520_PWM\XC8P9520-PWM.C	IOCP_W(IMR,0x09);		//TCC+PWM周期中断,根据需要调用	
mov	a, @0x9             		; 	mov	a,@0x09                        	000055 0809		
iw	0xf                  		; 	iw	IMR                             	000056 380f		
;	.line	63; D:\DOC\DOC\云世\项目\电子烟\XC8P9520_DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\1_XC8P9520_PWM\XC8P9520-PWM.C	PWMCON = 0xf8;			//使能3路pwm输出，pwm=1/8*2(分频)*4clock*100=100us
dw	0x8f8  ;unknown opcode		; 	MOV	A,@0xf8                        	000057 08f8		
mov	0x8, a              		; 	MOV	_PWMCON,A                      	000058 3888		
;	.line	64; D:\DOC\DOC\云世\项目\电子烟\XC8P9520_DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\1_XC8P9520_PWM\XC8P9520-PWM.C	PRD = 100;				//PWM周期寄存器
mov	a, @0x64            		; 	MOV	A,@0x64                        	000059 0864		
mov	0x9, a              		; 	MOV	_PRD,A                         	00005a 3889		
;	.line	65; D:\DOC\DOC\云世\项目\电子烟\XC8P9520_DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\1_XC8P9520_PWM\XC8P9520-PWM.C	PDC1 = 20;				//pwm1占空比
mov	a, @0x14            		; 	MOV	A,@0x14                        	00005b 0814		
mov	0xa, a              		; 	MOV	_PDC1,A                        	00005c 388a		
;	.line	66; D:\DOC\DOC\云世\项目\电子烟\XC8P9520_DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\1_XC8P9520_PWM\XC8P9520-PWM.C	PDC2 = 40;				//pwm2占空比
mov	a, @0x28            		; 	MOV	A,@0x28                        	00005d 0828		
mov	0xb, a              		; 	MOV	_PDC2,A                        	00005e 388b		
;	.line	67; D:\DOC\DOC\云世\项目\电子烟\XC8P9520_DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\1_XC8P9520_PWM\XC8P9520-PWM.C	PDC3 = 80;				//pwm3占空比
mov	a, @0x50            		; 	MOV	A,@0x50                        	00005f 0850		
mov	0xc, a              		; 	MOV	_PDC3,A                        	000060 388c		
;	.line	68; D:\DOC\DOC\云世\项目\电子烟\XC8P9520_DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\1_XC8P9520_PWM\XC8P9520-PWM.C	}
ret                     		; 	RET	                               	000061 3822		
;	.line	42; D:\DOC\DOC\云世\项目\电子烟\XC8P9520_DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\1_XC8P9520_PWM\XC8P9520-PWM.C	CONTW(0x02);			//TCC 8分频
mov	a, @0x2             		; 	mov	a,@0x02                        	000042 0802		
ctw                     		; 	ctw                                	000043 3802		
;	.line	43; D:\DOC\DOC\云世\项目\电子烟\XC8P9520_DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\1_XC8P9520_PWM\XC8P9520-PWM.C	TCC = 6;				//1/2 * 8 * (256-6) = 1000us	公式：1/IRC频率 * 预分频 * （256-初值）
mov	a, @0x6             		; 	MOV	A,@0x06                        	000044 0806		
mov	0x1, a              		; 	MOV	_TCC,A                         	000045 3881		
;	.line	44; D:\DOC\DOC\云世\项目\电子烟\XC8P9520_DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\1_XC8P9520_PWM\XC8P9520-PWM.C	PORT6 = 0;				//P6口输出低
clr	0x6                 		; 	CLR	_PORT6                         	000046 3986		
;	.line	45; D:\DOC\DOC\云世\项目\电子烟\XC8P9520_DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\1_XC8P9520_PWM\XC8P9520-PWM.C	IOCP_W(P6CR,0x08);		//P6口设为输出
mov	a, @0x8             		; 	mov	a,@0x08                        	000047 0808		
iw	0x6                  		; 	iw	P6CR                            	000048 3806		
;	.line	46; D:\DOC\DOC\云世\项目\电子烟\XC8P9520_DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\1_XC8P9520_PWM\XC8P9520-PWM.C	IOCP_W(PHDCR,0xff);		//端口上下拉控制寄存器，bit7-bit4对应P67-P64下拉;bit3-bit0对应P53-P50上拉 
dw	0x8ff  ;unknown opcode		; 	mov	a,@0xff                        	000049 08ff		
iw	0x9                  		; 	iw	PHDCR                           	00004a 3809		
;	.line	47; D:\DOC\DOC\云世\项目\电子烟\XC8P9520_DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\1_XC8P9520_PWM\XC8P9520-PWM.C	IOCP_W(PDCR,0xff);		//端口下拉控制寄存器，  bit6-bit4对应P62-P60,bit3-bit0对应P53-P50
dw	0x8ff  ;unknown opcode		; 	mov	a,@0xff                        	00004b 08ff		
iw	0xb                  		; 	iw	PDCR                            	00004c 380b		
;	.line	48; D:\DOC\DOC\云世\项目\电子烟\XC8P9520_DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\1_XC8P9520_PWM\XC8P9520-PWM.C	IOCP_W(PHCR,0xff);		//P6端口上拉控制寄存器  bit7-bit0对应P67-P60
dw	0x8ff  ;unknown opcode		; 	mov	a,@0xff                        	00004d 08ff		
iw	0xd                  		; 	iw	PHCR                            	00004e 380d		
;	.line	49; D:\DOC\DOC\云世\项目\电子烟\XC8P9520_DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\1_XC8P9520_PWM\XC8P9520-PWM.C	IOCP_W(WDTCR,0x00);		//WDT 使能控制寄存器
mov	a, @0               		; 	mov	a,@0x00                        	00004f 0800		
iw	0xe                  		; 	iw	WDTCR                           	000050 380e		
;	.line	50; D:\DOC\DOC\云世\项目\电子烟\XC8P9520_DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\1_XC8P9520_PWM\XC8P9520-PWM.C	IOCP_W(IMR,0x01);		//中断使能控制寄存器 
mov	a, @0x1             		; 	mov	a,@0x01                        	000051 0801		
iw	0xf                  		; 	iw	IMR                             	000052 380f		
;	.line	51; D:\DOC\DOC\云世\项目\电子烟\XC8P9520_DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\1_XC8P9520_PWM\XC8P9520-PWM.C	ISR = 0x0;				//清TC0中断标志位 
clr	0xf                 		; 	CLR	_ISR                           	000053 398f		
;	.line	52; D:\DOC\DOC\云世\项目\电子烟\XC8P9520_DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\1_XC8P9520_PWM\XC8P9520-PWM.C	}
ret                     		; 	RET	                               	000054 3822		
;	.line	32; D:\DOC\DOC\云世\项目\电子烟\XC8P9520_DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\1_XC8P9520_PWM\XC8P9520-PWM.C	for(RSR=0x90;RSR<0xFF;RSR++)	//清零 BANK0 RAM  IAR-R0,RSR-R4
dw	0x890  ;unknown opcode		; 	MOV	A,@0x90                        	000062 0890		
mov	0x4, a              		; 	MOV	_RSR,A                         	000063 3884		
dw	0x8ff  ;unknown opcode		; 	MOV	A,@0xff                        	000064 08ff		
sub	a, 0x4              		; 	SUB	A,_RSR                         	000065 3a04		
jbtc	0x3, 0             		; 	JBTC	STATUS,0                      	000066 2003		
jmp	0x6b                		; 	JMP	_00105_DS_                     	000067 106b		
;	.line	34; D:\DOC\DOC\云世\项目\电子烟\XC8P9520_DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\1_XC8P9520_PWM\XC8P9520-PWM.C	{IAR = 0;}
clr	0                   		; 	CLR	_IAR                           	000068 3980		
;	.line	32; D:\DOC\DOC\云世\项目\电子烟\XC8P9520_DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\1_XC8P9520_PWM\XC8P9520-PWM.C	for(RSR=0x90;RSR<0xFF;RSR++)	//清零 BANK0 RAM  IAR-R0,RSR-R4
inc	0x4                 		; 	INC	_RSR                           	000069 3284		
jmp	0x64                		; 	JMP	_00107_DS_                     	00006a 1064		
;	.line	35; D:\DOC\DOC\云世\项目\电子烟\XC8P9520_DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\1_XC8P9520_PWM\XC8P9520-PWM.C	IAR = 0;
clr	0                   		; 	CLR	_IAR                           	00006b 3980		
;	.line	36; D:\DOC\DOC\云世\项目\电子烟\XC8P9520_DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\1_XC8P9520_PWM\XC8P9520-PWM.C	}
ret                     		; 	RET	                               	00006c 3822		
