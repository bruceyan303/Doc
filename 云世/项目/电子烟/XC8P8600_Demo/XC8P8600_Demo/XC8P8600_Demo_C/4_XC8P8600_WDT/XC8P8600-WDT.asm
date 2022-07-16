jmp	0x46                		; 	jmp	_main                          	000000 1046		
;	.line	59; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	__asm__("org 0x08");			//中断入口地址			
;	.line	60; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	PUSH(_A_BUFF,_R3_BUFF);			//中断入栈保护
mov	0x10, a             		; 	mov	_A_BUFF,a                      	000008 3890		
swap	0x10               		; 	swap	_A_BUFF                       	000009 3690		
swapa	0x3               		; 	swapa	STATUS                       	00000a 3603		
mov	0x11, a             		; 	mov	_R3_BUFF,a                     	00000b 3891		
;	.line	62; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	if(TCIF)					//判断TCIF是否为1
jbts	0xf, 0             		; 	JBTS	_ISRbits,0                    	00000c 240f		
jmp	0x1f                		; 	JMP	_00121_DS_                     	00000d 101f		
;	.line	64; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	TCC	  += 0x06;				//1/2 * 8 * (256-6) = 1000us	公式：1/IRC频率 * 预分频 * （256-初值）
mov	a, @0x6             		; 	MOV	A,@0x06                        	00000e 0806		
add	0x1, a              		; 	ADD	_TCC,A                         	00000f 3f81		
;	.line	65; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	ISR    = 0xfe;				//清TC0中断标志位
dw	0x8fe  ;unknown opcode		; 	MOV	A,@0xfe                        	000010 08fe		
mov	0xf, a              		; 	MOV	_ISR,A                         	000011 388f		
;	.line	66; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	io_ledOut = !io_ledOut;		//P61口翻转
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
;	.line	69; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	POP(_A_BUFF,_R3_BUFF);			//中断出栈保护恢复
swapa	0x11              		; 	swapa	_R3_BUFF                     	00001f 3611		
mov	0x3, a              		; 	mov	STATUS,a                       	000020 3883		
swapa	0x10              		; 	swapa	_A_BUFF                      	000021 3610		
;	.line	70; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	}
reti                    		; 	RETI	                              	000022 3823		
;	.line	142; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	if(T)
jbts	0x3, 0x4           		; 	JBTS	_STATUSbits,4                 	000046 2603		
jmp	0x49                		; 	JMP	_00138_DS_                     	000047 1049		
;	.line	144; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	file_clrRam();				//上电复位，反之WDT复位
call	0x5e               		; 	CALL	_file_clrRam                  	000048 185e		
;	.line	146; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	file_init();					//io寄存器初始化
call	0x23               		; 	CALL	_file_init                    	000049 1823		
;	.line	147; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	file_project_init();			//程序所需功能设置
call	0x1                		; 	CALL	_file_project_init            	00004a 1801		
;	.line	148; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	EI();							//打开总中断
ei                      		; 	ei	                                	00004b 3820		
;	.line	152; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	file_WDTTime();				//WDT定时
call	0x53               		; 	CALL	_file_WDTTime                 	00004c 1853		
;	.line	153; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	file_WDTWake_slep();		//WDT唤醒睡眠
call	0x36               		; 	CALL	_file_WDTWake_slep            	00004d 1836		
;	.line	154; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	NOP();
nop                     		; 	nop	                               	00004e 3800		
;	.line	155; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	NOP();
nop                     		; 	nop	                               	00004f 3800		
;	.line	156; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	NOP();
nop                     		; 	nop	                               	000050 3800		
jmp	0x4c                		; 	JMP	_00140_DS_                     	000051 104c		
;	.line	158; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	}
ret                     		; 	RET	                               	000052 3822		
;	.line	93; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	IOCP_W(WDTCR,0x00);		 //;如果分频是由TCC切换而来，需要先关WDT 
mov	a, @0               		; 	mov	a,@0x00                        	000036 0800		
iw	0xe                  		; 	iw	WDTCR                           	000037 380e		
;	.line	95; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	IOCP_W(IMR,0x00);
mov	a, @0               		; 	mov	a,@0x00                        	000038 0800		
iw	0xf                  		; 	iw	IMR                             	000039 380f		
;	.line	96; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	ISR=0;
clr	0xf                 		; 	CLR	_ISR                           	00003a 398f		
;	.line	97; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	CWDT();
cwdt                    		; 	CWDT	                              	00003b 3804		
;	.line	98; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	CONTW(0x09);			//预分频分给wdt,2分频 
mov	a, @0x9             		; 	mov	a,@0x09                        	00003c 0809		
ctw                     		; 	ctw                                	00003d 3802		
;	.line	99; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	IOCP_W(WDTCR,0x80);
dw	0x880  ;unknown opcode		; 	mov	a,@0x80                        	00003e 0880		
iw	0xe                  		; 	iw	WDTCR                           	00003f 380e		
;	.line	100; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	DI();
di                      		; 	di	                                	000040 3821		
;	.line	101; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	NOP();
nop                     		; 	nop	                               	000041 3800		
;	.line	102; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	SLEEP();
sleep                   		; 	sleep	                             	000042 3803		
;	.line	103; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	NOP();
nop                     		; 	nop	                               	000043 3800		
;	.line	104; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	NOP();
nop                     		; 	nop	                               	000044 3800		
;	.line	105; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	}
ret                     		; 	RET	                               	000045 3822		
;	.line	76; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	if(++reg_sleep_cnt>=10) // 
inc	0x12                		; 	INC	_reg_sleep_cnt                 	000053 3292		
mov	a, @0xa             		; 	MOV	A,@0x0a                        	000054 080a		
sub	a, 0x12             		; 	SUB	A,_reg_sleep_cnt               	000055 3a12		
jbts	0x3, 0             		; 	JBTS	STATUS,0                      	000056 2403		
jmp	0x5d                		; 	JMP	_00128_DS_                     	000057 105d		
;	.line	78; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	reg_sleep_cnt=0;
clr	0x12                		; 	CLR	_reg_sleep_cnt                 	000058 3992		
;	.line	79; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	io_led2Out =1;
bts	0x6, 0x1            		; 	BTS	_PORT6bits,1                   	000059 2c86		
;	.line	81; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	NOP();
nop                     		; 	nop	                               	00005a 3800		
;	.line	82; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	NOP();
nop                     		; 	nop	                               	00005b 3800		
;	.line	84; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	io_led2Out =0;
btc	0x6, 0x1            		; 	BTC	_PORT6bits,1                   	00005c 2886		
;	.line	86; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	}
ret                     		; 	RET	                               	00005d 3822		
;	.line	53; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	}
;	.line	53; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	}
ret                     		; 	RET	                               	000001 3822		
;	.line	37; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	CONTW(0x02);			//TCC 8分频
mov	a, @0x2             		; 	mov	a,@0x02                        	000023 0802		
ctw                     		; 	ctw                                	000024 3802		
;	.line	38; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	TCC = data_tcc;			//1/2 * 8 * (256-6) = 1000us	公式：1/IRC频率 * 预分频 * （256-初值）
mov	a, @0x6             		; 	MOV	A,@0x06                        	000025 0806		
mov	0x1, a              		; 	MOV	_TCC,A                         	000026 3881		
;	.line	39; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	PORT6 = 0;				//P6口输出低
clr	0x6                 		; 	CLR	_PORT6                         	000027 3986		
;	.line	40; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	IOCP_W(P6CR,0x08);		//P6口设为输出
mov	a, @0x8             		; 	mov	a,@0x08                        	000028 0808		
iw	0x6                  		; 	iw	P6CR                            	000029 3806		
;	.line	41; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	IOCP_W(PHDCR,0xff);		//端口上下拉控制寄存器，bit7-bit4对应P67-P64下拉;bit3-bit0对应P53-P50上拉 
dw	0x8ff  ;unknown opcode		; 	mov	a,@0xff                        	00002a 08ff		
iw	0x9                  		; 	iw	PHDCR                           	00002b 3809		
;	.line	42; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	IOCP_W(PDCR,0xff);		//端口下拉控制寄存器，  bit6-bit4对应P62-P60,bit3-bit0对应P53-P50
dw	0x8ff  ;unknown opcode		; 	mov	a,@0xff                        	00002c 08ff		
iw	0xb                  		; 	iw	PDCR                            	00002d 380b		
;	.line	43; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	IOCP_W(PHCR,0xff);		//P6端口上拉控制寄存器  bit7-bit0对应P67-P60
dw	0x8ff  ;unknown opcode		; 	mov	a,@0xff                        	00002e 08ff		
iw	0xd                  		; 	iw	PHCR                            	00002f 380d		
;	.line	44; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	IOCP_W(WDTCR,0x00);		//WDT 使能控制寄存器
mov	a, @0               		; 	mov	a,@0x00                        	000030 0800		
iw	0xe                  		; 	iw	WDTCR                           	000031 380e		
;	.line	45; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	IOCP_W(IMR,0x01);		//中断使能控制寄存器 
mov	a, @0x1             		; 	mov	a,@0x01                        	000032 0801		
iw	0xf                  		; 	iw	IMR                             	000033 380f		
;	.line	46; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	ISR = 0x0;				//清TC0中断标志位 
clr	0xf                 		; 	CLR	_ISR                           	000034 398f		
;	.line	47; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	}
ret                     		; 	RET	                               	000035 3822		
;	.line	28; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	for(RSR=0x90;RSR<0xFF;RSR++)	//清零 BANK0 RAM  IAR-R0,RSR-R4
dw	0x890  ;unknown opcode		; 	MOV	A,@0x90                        	00005e 0890		
mov	0x4, a              		; 	MOV	_RSR,A                         	00005f 3884		
dw	0x8ff  ;unknown opcode		; 	MOV	A,@0xff                        	000060 08ff		
sub	a, 0x4              		; 	SUB	A,_RSR                         	000061 3a04		
jbtc	0x3, 0             		; 	JBTC	STATUS,0                      	000062 2003		
jmp	0x67                		; 	JMP	_00105_DS_                     	000063 1067		
;	.line	29; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	{IAR = 0;}
clr	0                   		; 	CLR	_IAR                           	000064 3980		
;	.line	28; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	for(RSR=0x90;RSR<0xFF;RSR++)	//清零 BANK0 RAM  IAR-R0,RSR-R4
inc	0x4                 		; 	INC	_RSR                           	000065 3284		
jmp	0x60                		; 	JMP	_00107_DS_                     	000066 1060		
;	.line	30; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	IAR = 0;
clr	0                   		; 	CLR	_IAR                           	000067 3980		
;	.line	31; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\4_XC8P8600_WDT\XC8P8600-WDT.C	}
ret                     		; 	RET	                               	000068 3822		
