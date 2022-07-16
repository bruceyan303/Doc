jmp	0x16                		; 	jmp	_main                          	000000 1016		
;	.line	108; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\7_XC8P8600_内置电压基准输出\SOURCEFILES2.C	__asm__("org 0x08");
;	.line	109; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\7_XC8P8600_内置电压基准输出\SOURCEFILES2.C	PUSH(_A_BUFF,_R3_BUFF);			//中断入栈保护
mov	0x10, a             		; 	mov	_A_BUFF,a                      	000008 3890		
swap	0x10               		; 	swap	_A_BUFF                       	000009 3690		
swapa	0x3               		; 	swapa	STATUS                       	00000a 3603		
mov	0x11, a             		; 	mov	_R3_BUFF,a                     	00000b 3891		
;	.line	111; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\7_XC8P8600_内置电压基准输出\SOURCEFILES2.C	if(TCIF)					//判断TCIF是否为1
jbts	0xf, 0             		; 	JBTS	_ISRbits,0                    	00000c 240f		
jmp	0x12                		; 	JMP	_00131_DS_                     	00000d 1012		
;	.line	113; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\7_XC8P8600_内置电压基准输出\SOURCEFILES2.C	ISR = 0x00;					//清TC0中断标志位
clr	0xf                 		; 	CLR	_ISR                           	00000e 398f		
;	.line	114; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\7_XC8P8600_内置电压基准输出\SOURCEFILES2.C	TCC += 0x06;				//1/2 * 8 * (256-6) = 1000us	公式：1/IRC频率 * 预分频 * （256-初值）		
mov	a, @0x6             		; 	MOV	A,@0x06                        	00000f 0806		
add	0x1, a              		; 	ADD	_TCC,A                         	000010 3f81		
;	.line	115; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\7_XC8P8600_内置电压基准输出\SOURCEFILES2.C	BitTCCEnable=1;
bts	0x13, 0             		; 	BTS	_BIT_FLAG,0                    	000011 2c13		
;	.line	118; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\7_XC8P8600_内置电压基准输出\SOURCEFILES2.C	POP(_A_BUFF,_R3_BUFF);			//中断出栈保护恢复
swapa	0x11              		; 	swapa	_R3_BUFF                     	000012 3611		
mov	0x3, a              		; 	mov	STATUS,a                       	000013 3883		
swapa	0x10              		; 	swapa	_A_BUFF                      	000014 3610		
;	.line	119; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\7_XC8P8600_内置电压基准输出\SOURCEFILES2.C	}
reti                    		; 	RETI	                              	000015 3823		
;	.line	83; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\7_XC8P8600_内置电压基准输出\SOURCEFILES2.C	CLR_RAM();
call	0x2d               		; 	CALL	_CLR_RAM                      	000016 182d		
;	.line	84; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\7_XC8P8600_内置电压基准输出\SOURCEFILES2.C	BitADCEnable=0;
btc	0x13, 0x1           		; 	BTC	_BIT_FLAG,1                    	000017 2893		
;	.line	85; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\7_XC8P8600_内置电压基准输出\SOURCEFILES2.C	RegADCDang=0;
clr	0x12                		; 	CLR	_RegADCDang                    	000018 3992		
;	.line	86; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\7_XC8P8600_内置电压基准输出\SOURCEFILES2.C	IO_Init();
call	0x38               		; 	CALL	_IO_Init                      	000019 1838		
;	.line	87; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\7_XC8P8600_内置电压基准输出\SOURCEFILES2.C	TCC_Init();
call	0x22               		; 	CALL	_TCC_Init                     	00001a 1822		
;	.line	88; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\7_XC8P8600_内置电压基准输出\SOURCEFILES2.C	ADC_Init();
call	0x1                		; 	CALL	_ADC_Init                     	00001b 1801		
;	.line	89; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\7_XC8P8600_内置电压基准输出\SOURCEFILES2.C	EI();										//打开总中断
ei                      		; 	ei	                                	00001c 3820		
;	.line	92; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\7_XC8P8600_内置电压基准输出\SOURCEFILES2.C	NOP();	
nop                     		; 	nop	                               	00001d 3800		
;	.line	93; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\7_XC8P8600_内置电压基准输出\SOURCEFILES2.C	PORT6_5 = 1; //adc内置基准电压
bts	0x6, 0x5            		; 	BTS	_PORT6bits,5                   	00001e 2e86		
;	.line	94; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\7_XC8P8600_内置电压基准输出\SOURCEFILES2.C	PORT6_4= 1;	 //vdd电压
bts	0x6, 0x4            		; 	BTS	_PORT6bits,4                   	00001f 2e06		
jmp	0x1d                		; 	JMP	_00125_DS_                     	000020 101d		
;	.line	101; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\7_XC8P8600_内置电压基准输出\SOURCEFILES2.C	}
ret                     		; 	RET	                               	000021 3822		
;	.line	72; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\7_XC8P8600_内置电压基准输出\SOURCEFILES2.C	IOCP_W(ADPS,0x10);				//AD0设置为模拟输入口
mov	a, @0x10            		; 	mov	a,@0x10                        	000001 0810		
iw	0xa                  		; 	iw	ADPS                            	000002 380a		
;	.line	73; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\7_XC8P8600_内置电压基准输出\SOURCEFILES2.C	IOCP_W(ADCVS,0x02);				//ADC时钟：Fosc/16; ADC通道：AD0(P60); 内部基准电压：3V
mov	a, @0x2             		; 	mov	a,@0x02                        	000003 0802		
iw	0x7                  		; 	iw	ADCVS                           	000004 3807		
;	.line	75; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\7_XC8P8600_内置电压基准输出\SOURCEFILES2.C	ADCON = 0x40;					//ADC使能
mov	a, @0x40            		; 	MOV	A,@0x40                        	000005 0840		
mov	0x7, a              		; 	MOV	_ADCON,A                       	000006 3887		
;	.line	76; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\7_XC8P8600_内置电压基准输出\SOURCEFILES2.C	}
ret                     		; 	RET	                               	000007 3822		
;	.line	59; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\7_XC8P8600_内置电压基准输出\SOURCEFILES2.C	CONTW(0x02);					//TCC 8分频
mov	a, @0x2             		; 	mov	a,@0x02                        	000022 0802		
ctw                     		; 	ctw                                	000023 3802		
;	.line	60; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\7_XC8P8600_内置电压基准输出\SOURCEFILES2.C	IOCP_W(WDTCR,0X10);				//P65输出基准电压使能
mov	a, @0x10            		; 	mov	a,@0X10                        	000024 0810		
iw	0xe                  		; 	iw	WDTCR                           	000025 380e		
;	.line	61; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\7_XC8P8600_内置电压基准输出\SOURCEFILES2.C	TCC = 0x06;						//1/2 * 8 * (256-6) = 1000us	公式：1/IRC频率 * 预分频 * （256-初值）
mov	a, @0x6             		; 	MOV	A,@0x06                        	000026 0806		
mov	0x1, a              		; 	MOV	_TCC,A                         	000027 3881		
;	.line	62; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\7_XC8P8600_内置电压基准输出\SOURCEFILES2.C	ISR = 0xfe;						//清TC0中断标志位
dw	0x8fe  ;unknown opcode		; 	MOV	A,@0xfe                        	000028 08fe		
mov	0xf, a              		; 	MOV	_ISR,A                         	000029 388f		
;	.line	63; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\7_XC8P8600_内置电压基准输出\SOURCEFILES2.C	IOCP_W(IMR,0x01);				//使能TCC
mov	a, @0x1             		; 	mov	a,@0x01                        	00002a 0801		
iw	0xf                  		; 	iw	IMR                             	00002b 380f		
;	.line	64; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\7_XC8P8600_内置电压基准输出\SOURCEFILES2.C	}
ret                     		; 	RET	                               	00002c 3822		
;	.line	48; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\7_XC8P8600_内置电压基准输出\SOURCEFILES2.C	PORT6 = 0x00;					//P6口输出低
clr	0x6                 		; 	CLR	_PORT6                         	000038 3986		
;	.line	49; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\7_XC8P8600_内置电压基准输出\SOURCEFILES2.C	IOCP_W(P6CR,0x00);				//P6口设为输出
mov	a, @0               		; 	mov	a,@0x00                        	000039 0800		
iw	0x6                  		; 	iw	P6CR                            	00003a 3806		
;	.line	50; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\7_XC8P8600_内置电压基准输出\SOURCEFILES2.C	IOCP_W(PDCR,0XFF);				//下拉关闭
dw	0x8ff  ;unknown opcode		; 	mov	a,@0XFF                        	00003b 08ff		
iw	0xb                  		; 	iw	PDCR                            	00003c 380b		
;	.line	51; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\7_XC8P8600_内置电压基准输出\SOURCEFILES2.C	IOCP_W(PHCR,0XFF);				//上拉关闭
dw	0x8ff  ;unknown opcode		; 	mov	a,@0XFF                        	00003d 08ff		
iw	0xd                  		; 	iw	PHCR                            	00003e 380d		
;	.line	52; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\7_XC8P8600_内置电压基准输出\SOURCEFILES2.C	}
ret                     		; 	RET	                               	00003f 3822		
;	.line	38; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\7_XC8P8600_内置电压基准输出\SOURCEFILES2.C	for(RSR=0x90;RSR<0xCF;RSR++)	//清零 BANK0 RAM
dw	0x890  ;unknown opcode		; 	MOV	A,@0x90                        	00002d 0890		
mov	0x4, a              		; 	MOV	_RSR,A                         	00002e 3884		
dw	0x8cf  ;unknown opcode		; 	MOV	A,@0xcf                        	00002f 08cf		
sub	a, 0x4              		; 	SUB	A,_RSR                         	000030 3a04		
jbtc	0x3, 0             		; 	JBTC	STATUS,0                      	000031 2003		
jmp	0x36                		; 	JMP	_00105_DS_                     	000032 1036		
;	.line	39; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\7_XC8P8600_内置电压基准输出\SOURCEFILES2.C	{IAR=0;}
clr	0                   		; 	CLR	_IAR                           	000033 3980		
;	.line	38; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\7_XC8P8600_内置电压基准输出\SOURCEFILES2.C	for(RSR=0x90;RSR<0xCF;RSR++)	//清零 BANK0 RAM
inc	0x4                 		; 	INC	_RSR                           	000034 3284		
jmp	0x2f                		; 	JMP	_00107_DS_                     	000035 102f		
;	.line	40; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\7_XC8P8600_内置电压基准输出\SOURCEFILES2.C	IAR	= 0;
clr	0                   		; 	CLR	_IAR                           	000036 3980		
;	.line	41; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\7_XC8P8600_内置电压基准输出\SOURCEFILES2.C	}
ret                     		; 	RET	                               	000037 3822		
