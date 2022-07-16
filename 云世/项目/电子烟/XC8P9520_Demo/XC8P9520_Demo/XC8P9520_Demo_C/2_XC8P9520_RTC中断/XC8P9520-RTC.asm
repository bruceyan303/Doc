jmp	0x45                		; 	jmp	_main                          	000000 1045		
;	.line	71; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\2_XC8P9520_RTC中断\XC8P9520-RTC.C	__asm__("org 0x08");			//中断入口地址			
;	.line	72; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\2_XC8P9520_RTC中断\XC8P9520-RTC.C	PUSH(_A_BUFF,_R3_BUFF);			//中断入栈保护
mov	0x10, a             		; 	mov	_A_BUFF,a                      	000008 3890		
swap	0x10               		; 	swap	_A_BUFF                       	000009 3690		
swapa	0x3               		; 	swapa	STATUS                       	00000a 3603		
mov	0x11, a             		; 	mov	_R3_BUFF,a                     	00000b 3891		
;	.line	74; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\2_XC8P9520_RTC中断\XC8P9520-RTC.C	if(TCIF == 1)					//判断TCIF是否为1
clr	0x12                		; 	CLR	r0x1000                        	00000c 3992		
jbtc	0xf, 0             		; 	JBTC	_ISRbits,0                    	00000d 200f		
inc	0x12                		; 	INC	r0x1000                        	00000e 3292		
mov	a, 0x12             		; 	MOV	A,r0x1000                      	00000f 3012		
mov	0x13, a             		; 	MOV	r0x1001,A                      	000010 3893		
xor	a, @0x1             		; 	XOR	A,@0x01                        	000011 0e01		
jbts	0x3, 0x2           		; 	JBTS	STATUS,2                      	000012 2503		
jmp	0x24                		; 	JMP	_00121_DS_                     	000013 1024		
;	.line	77; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\2_XC8P9520_RTC中断\XC8P9520-RTC.C	ISR    = 0xfe;				//清TC0中断标志位
dw	0x8fe  ;unknown opcode		; 	MOV	A,@0xfe                        	000014 08fe		
mov	0xf, a              		; 	MOV	_ISR,A                         	000015 388f		
;	.line	78; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\2_XC8P9520_RTC中断\XC8P9520-RTC.C	PORT6_1 = !PORT6_1;			//P61口翻转
clr	0x12                		; 	CLR	r0x1000                        	000016 3992		
jbtc	0x6, 0x1           		; 	JBTC	_PORT6bits,1                  	000017 2086		
inc	0x12                		; 	INC	r0x1000                        	000018 3292		
mov	a, 0x12             		; 	MOV	A,r0x1000                      	000019 3012		
mov	a, @0               		; 	MOV	A,@0x00                        	00001a 0800		
jbtc	0x3, 0x2           		; 	JBTC	STATUS,2                      	00001b 2103		
mov	a, @0x1             		; 	MOV	A,@0x01                        	00001c 0801		
mov	0x12, a             		; 	MOV	r0x1000,A                      	00001d 3892		
mov	0x13, a             		; 	MOV	r0x1001,A                      	00001e 3893		
rca	0x12                		; 	RCA	r0x1000                        	00001f 3412		
jbts	0x3, 0             		; 	JBTS	STATUS,0                      	000020 2403		
btc	0x6, 0x1            		; 	BTC	_PORT6bits,1                   	000021 2886		
jbtc	0x3, 0             		; 	JBTC	STATUS,0                      	000022 2003		
bts	0x6, 0x1            		; 	BTS	_PORT6bits,1                   	000023 2c86		
;	.line	81; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\2_XC8P9520_RTC中断\XC8P9520-RTC.C	POP(_A_BUFF,_R3_BUFF);			//中断出栈保护恢复
swapa	0x11              		; 	swapa	_R3_BUFF                     	000024 3611		
mov	0x3, a              		; 	mov	STATUS,a                       	000025 3883		
swapa	0x10              		; 	swapa	_A_BUFF                      	000026 3610		
;	.line	82; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\2_XC8P9520_RTC中断\XC8P9520-RTC.C	}
reti                    		; 	RETI	                              	000027 3823		
;	.line	89; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\2_XC8P9520_RTC中断\XC8P9520-RTC.C	file_clrRam();					//清RAM
call	0x3a               		; 	CALL	_file_clrRam                  	000045 183a		
;	.line	90; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\2_XC8P9520_RTC中断\XC8P9520-RTC.C	file_init();					//io寄存器初始化
call	0x28               		; 	CALL	_file_init                    	000046 1828		
;	.line	91; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\2_XC8P9520_RTC中断\XC8P9520-RTC.C	file_project_init();			//程序所需功能设置
call	0x1                		; 	CALL	_file_project_init            	000047 1801		
;	.line	92; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\2_XC8P9520_RTC中断\XC8P9520-RTC.C	EI();							//打开总中断
ei                      		; 	ei	                                	000048 3820		
;	.line	96; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\2_XC8P9520_RTC中断\XC8P9520-RTC.C	NOP();
nop                     		; 	nop	                               	000049 3800		
;	.line	97; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\2_XC8P9520_RTC中断\XC8P9520-RTC.C	NOP();
nop                     		; 	nop	                               	00004a 3800		
;	.line	98; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\2_XC8P9520_RTC中断\XC8P9520-RTC.C	NOP();
nop                     		; 	nop	                               	00004b 3800		
jmp	0x49                		; 	JMP	_00127_DS_                     	00004c 1049		
;	.line	100; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\2_XC8P9520_RTC中断\XC8P9520-RTC.C	}
ret                     		; 	RET	                               	00004d 3822		
;	.line	65; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\2_XC8P9520_RTC中断\XC8P9520-RTC.C	}
;	.line	65; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\2_XC8P9520_RTC中断\XC8P9520-RTC.C	}
ret                     		; 	RET	                               	000001 3822		
;	.line	41; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\2_XC8P9520_RTC中断\XC8P9520-RTC.C	CONTW(0x84);			//TCC 32分频,开RTC
dw	0x884  ;unknown opcode		; 	mov	a,@0x84                        	000028 0884		
ctw                     		; 	ctw                                	000029 3802		
;	.line	42; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\2_XC8P9520_RTC中断\XC8P9520-RTC.C	TCC = 0;
clr	0x1                 		; 	CLR	_TCC                           	00002a 3981		
;	.line	43; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\2_XC8P9520_RTC中断\XC8P9520-RTC.C	PORT6 = 0;				//P6口输出低
clr	0x6                 		; 	CLR	_PORT6                         	00002b 3986		
;	.line	44; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\2_XC8P9520_RTC中断\XC8P9520-RTC.C	IOCP_W(P6CR,0x08);		//P6口设为输出
mov	a, @0x8             		; 	mov	a,@0x08                        	00002c 0808		
iw	0x6                  		; 	iw	P6CR                            	00002d 3806		
;	.line	45; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\2_XC8P9520_RTC中断\XC8P9520-RTC.C	IOCP_W(PHDCR,0xff);		//端口上下拉控制寄存器，bit7-bit4对应P67-P64下拉;bit3-bit0对应P53-P50上拉 
dw	0x8ff  ;unknown opcode		; 	mov	a,@0xff                        	00002e 08ff		
iw	0x9                  		; 	iw	PHDCR                           	00002f 3809		
;	.line	46; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\2_XC8P9520_RTC中断\XC8P9520-RTC.C	IOCP_W(PDCR,0xff);		//端口下拉控制寄存器，  bit6-bit4对应P62-P60,bit3-bit0对应P53-P50
dw	0x8ff  ;unknown opcode		; 	mov	a,@0xff                        	000030 08ff		
iw	0xb                  		; 	iw	PDCR                            	000031 380b		
;	.line	47; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\2_XC8P9520_RTC中断\XC8P9520-RTC.C	IOCP_W(PHCR,0xff);		//P6端口上拉控制寄存器  bit7-bit0对应P67-P60
dw	0x8ff  ;unknown opcode		; 	mov	a,@0xff                        	000032 08ff		
iw	0xd                  		; 	iw	PHCR                            	000033 380d		
;	.line	48; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\2_XC8P9520_RTC中断\XC8P9520-RTC.C	IOCP_W(WDTCR,0x00);		//WDT 使能控制寄存器
mov	a, @0               		; 	mov	a,@0x00                        	000034 0800		
iw	0xe                  		; 	iw	WDTCR                           	000035 380e		
;	.line	49; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\2_XC8P9520_RTC中断\XC8P9520-RTC.C	IOCP_W(IMR,0x01);		//中断使能控制寄存器 
mov	a, @0x1             		; 	mov	a,@0x01                        	000036 0801		
iw	0xf                  		; 	iw	IMR                             	000037 380f		
;	.line	50; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\2_XC8P9520_RTC中断\XC8P9520-RTC.C	ISR = 0x0;				//清TC0中断标志位 
clr	0xf                 		; 	CLR	_ISR                           	000038 398f		
;	.line	51; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\2_XC8P9520_RTC中断\XC8P9520-RTC.C	}
ret                     		; 	RET	                               	000039 3822		
;	.line	31; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\2_XC8P9520_RTC中断\XC8P9520-RTC.C	for(RSR=0x90;RSR<0xFF;RSR++)	//清零 BANK0 RAM  IAR-R0,RSR-R4
dw	0x890  ;unknown opcode		; 	MOV	A,@0x90                        	00003a 0890		
mov	0x4, a              		; 	MOV	_RSR,A                         	00003b 3884		
dw	0x8ff  ;unknown opcode		; 	MOV	A,@0xff                        	00003c 08ff		
sub	a, 0x4              		; 	SUB	A,_RSR                         	00003d 3a04		
jbtc	0x3, 0             		; 	JBTC	STATUS,0                      	00003e 2003		
jmp	0x43                		; 	JMP	_00105_DS_                     	00003f 1043		
;	.line	33; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\2_XC8P9520_RTC中断\XC8P9520-RTC.C	{IAR = 0;}
clr	0                   		; 	CLR	_IAR                           	000040 3980		
;	.line	31; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\2_XC8P9520_RTC中断\XC8P9520-RTC.C	for(RSR=0x90;RSR<0xFF;RSR++)	//清零 BANK0 RAM  IAR-R0,RSR-R4
inc	0x4                 		; 	INC	_RSR                           	000041 3284		
jmp	0x3c                		; 	JMP	_00107_DS_                     	000042 103c		
;	.line	34; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\2_XC8P9520_RTC中断\XC8P9520-RTC.C	IAR = 0;
clr	0                   		; 	CLR	_IAR                           	000043 3980		
;	.line	35; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\2_XC8P9520_RTC中断\XC8P9520-RTC.C	}
ret                     		; 	RET	                               	000044 3822		
