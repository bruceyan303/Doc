jmp	0xe2                		; 	jmp	_main                          	000000 10e2		
;	.line	33; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	__asm__("org 0x08");			//中断入口地址			
;	.line	34; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	PUSH(_A_BUFF,_R3_BUFF);			//中断入栈保护
mov	0x10, a             		; 	mov	_A_BUFF,a                      	000008 3890		
swap	0x10               		; 	swap	_A_BUFF                       	000009 3690		
swapa	0x3               		; 	swapa	STATUS                       	00000a 3603		
mov	0x11, a             		; 	mov	_R3_BUFF,a                     	00000b 3891		
;	.line	36; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	if(TCIF)					//判断TCIF是否为1
jbts	0xf, 0             		; 	JBTS	_ISRbits,0                    	00000c 240f		
jmp	0x3e                		; 	JMP	_00110_DS_                     	00000d 103e		
;	.line	38; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	TCC	  += data_tcc;			//1/2 * 8 * (256-6) = 1000us	公式：1/IRC频率 * 预分频 * （256-初值）
mov	a, @0x6             		; 	MOV	A,@0x06                        	00000e 0806		
add	0x1, a              		; 	ADD	_TCC,A                         	00000f 3f81		
;	.line	39; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	ISR    = 0xfe;				//清TC0中断标志位
dw	0x8fe  ;unknown opcode		; 	MOV	A,@0xfe                        	000010 08fe		
mov	0xf, a              		; 	MOV	_ISR,A                         	000011 388f		
;	.line	40; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	io_ledOut = !io_ledOut;			//P61口翻转
clr	0x12                		; 	CLR	r0x1010                        	000012 3992		
jbtc	0x6, 0             		; 	JBTC	_PORT6bits,0                  	000013 2006		
inc	0x12                		; 	INC	r0x1010                        	000014 3292		
mov	a, 0x12             		; 	MOV	A,r0x1010                      	000015 3012		
mov	a, @0               		; 	MOV	A,@0x00                        	000016 0800		
jbtc	0x3, 0x2           		; 	JBTC	STATUS,2                      	000017 2103		
mov	a, @0x1             		; 	MOV	A,@0x01                        	000018 0801		
mov	0x12, a             		; 	MOV	r0x1010,A                      	000019 3892		
mov	0x13, a             		; 	MOV	r0x1011,A                      	00001a 3893		
rca	0x12                		; 	RCA	r0x1010                        	00001b 3412		
jbts	0x3, 0             		; 	JBTS	STATUS,0                      	00001c 2403		
btc	0x6, 0              		; 	BTC	_PORT6bits,0                   	00001d 2806		
jbtc	0x3, 0             		; 	JBTC	STATUS,0                      	00001e 2003		
bts	0x6, 0              		; 	BTS	_PORT6bits,0                   	00001f 2c06		
;	.line	42; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	reg_contTime++;
inc	0x30                		; 	INC	_reg_contTime                  	000020 32b0		
jbtc	0x3, 0x2           		; 	JBTC	STATUS,2                      	000021 2103		
inc	0x31                		; 	INC	(_reg_contTime + 1)            	000022 32b1		
;	.line	43; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	if((reg_contTime % 10) == 0)//每10ms,reg_contTime个位数为0成立			
mov	a, @0xa             		; 	MOV	A,@0x0a                        	000023 080a		
mov	0x29, a             		; 	MOV	STK02,A                        	000024 38a9		
mov	a, @0               		; 	MOV	A,@0x00                        	000025 0800		
mov	0x2a, a             		; 	MOV	STK01,A                        	000026 38aa		
mov	a, 0x30             		; 	MOV	A,_reg_contTime                	000027 3030		
mov	0x2b, a             		; 	MOV	STK00,A                        	000028 38ab		
mov	a, 0x31             		; 	MOV	A,(_reg_contTime + 1)          	000029 3031		
call	0x8d               		; 	CALL	__moduint                     	00002a 188d		
mov	0x13, a             		; 	MOV	r0x1011,A                      	00002b 3893		
mov	a, 0x2b             		; 	MOV	A,STK00                        	00002c 302b		
mov	0x12, a             		; 	MOV	r0x1010,A                      	00002d 3892		
mov	a, 0x12             		; 	MOV	A,r0x1010                      	00002e 3012		
or	a, 0x13              		; 	OR	A,r0x1011                       	00002f 3c13		
jbts	0x3, 0x2           		; 	JBTS	STATUS,2                      	000030 2503		
jmp	0x33                		; 	JMP	_00106_DS_                     	000031 1033		
;	.line	45; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	bit_end10ms = 1;			
bts	0x35, 0x1           		; 	BTS	_flag_mode,1                   	000032 2cb5		
;	.line	48; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	if(reg_contTime >= 500)		//每0.5s
mov	a, @0x1             		; 	MOV	A,@0x01                        	000033 0801		
sub	a, 0x31             		; 	SUB	A,(_reg_contTime + 1)          	000034 3a31		
jbts	0x3, 0x2           		; 	JBTS	STATUS,2                      	000035 2503		
jmp	0x39                		; 	JMP	_00127_DS_                     	000036 1039		
dw	0x8f4  ;unknown opcode		; 	MOV	A,@0xf4                        	000037 08f4		
sub	a, 0x30             		; 	SUB	A,_reg_contTime                	000038 3a30		
jbts	0x3, 0             		; 	JBTS	STATUS,0                      	000039 2403		
jmp	0x3e                		; 	JMP	_00110_DS_                     	00003a 103e		
;	.line	50; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	reg_contTime = 0;
clr	0x30                		; 	CLR	_reg_contTime                  	00003b 39b0		
clr	0x31                		; 	CLR	(_reg_contTime + 1)            	00003c 39b1		
;	.line	51; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	bit_end500ms = 1;
bts	0x35, 0x2           		; 	BTS	_flag_mode,2                   	00003d 2d35		
;	.line	55; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	if(ADIF)					//AD采样中断
jbts	0xf, 0x4           		; 	JBTS	_ISRbits,4                    	00003e 260f		
jmp	0x50                		; 	JMP	_00112_DS_                     	00003f 1050		
;	.line	57; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	ISR    = 0x0f;	
mov	a, @0xf             		; 	MOV	A,@0x0f                        	000040 080f		
mov	0xf, a              		; 	MOV	_ISR,A                         	000041 388f		
;	.line	59; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	PORT6_4 = !PORT6_4;	
clr	0x12                		; 	CLR	r0x1010                        	000042 3992		
jbtc	0x6, 0x4           		; 	JBTC	_PORT6bits,4                  	000043 2206		
inc	0x12                		; 	INC	r0x1010                        	000044 3292		
mov	a, 0x12             		; 	MOV	A,r0x1010                      	000045 3012		
mov	a, @0               		; 	MOV	A,@0x00                        	000046 0800		
jbtc	0x3, 0x2           		; 	JBTC	STATUS,2                      	000047 2103		
mov	a, @0x1             		; 	MOV	A,@0x01                        	000048 0801		
mov	0x12, a             		; 	MOV	r0x1010,A                      	000049 3892		
mov	0x13, a             		; 	MOV	r0x1011,A                      	00004a 3893		
rca	0x12                		; 	RCA	r0x1010                        	00004b 3412		
jbts	0x3, 0             		; 	JBTS	STATUS,0                      	00004c 2403		
btc	0x6, 0x4            		; 	BTC	_PORT6bits,4                   	00004d 2a06		
jbtc	0x3, 0             		; 	JBTC	STATUS,0                      	00004e 2003		
bts	0x6, 0x4            		; 	BTS	_PORT6bits,4                   	00004f 2e06		
;	.line	62; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	POP(_A_BUFF,_R3_BUFF);			//中断出栈保护恢复
swapa	0x11              		; 	swapa	_R3_BUFF                     	000050 3611		
mov	0x3, a              		; 	mov	STATUS,a                       	000051 3883		
swapa	0x10              		; 	swapa	_A_BUFF                      	000052 3610		
;	.line	63; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	}
reti                    		; 	RETI	                              	000053 3823		
;	.line	147; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	file_clrRam();					//清RAM
call	0xd7               		; 	CALL	_file_clrRam                  	0000e2 18d7		
;	.line	148; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	file_init();					//io寄存器初始化
call	0xc4               		; 	CALL	_file_init                    	0000e3 18c4		
;	.line	149; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	file_project_init();			//程序所需功能设置
call	0x1                		; 	CALL	_file_project_init            	0000e4 1801		
;	.line	150; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	EI();							//打开总中断
ei                      		; 	ei	                                	0000e5 3820		
;	.line	153; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	if(bit_end10ms)
jbts	0x35, 0x1          		; 	JBTS	_flag_mode,1                  	0000e6 24b5		
jmp	0xe6                		; 	JMP	_00162_DS_                     	0000e7 10e6		
;	.line	155; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	bit_end10ms = 0;
btc	0x35, 0x1           		; 	BTC	_flag_mode,1                   	0000e8 28b5		
;	.line	156; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	file_adc_start();		//每10ms，采集一次AD
call	0xec               		; 	CALL	_file_adc_start               	0000e9 18ec		
jmp	0xe6                		; 	JMP	_00162_DS_                     	0000ea 10e6		
;	.line	198; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	}
ret                     		; 	RET	                               	0000eb 3822		
;	.line	137; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	IOCP_W(ADPS,0x80);		//AD3设置为模拟输入口
dw	0x880  ;unknown opcode		; 	mov	a,@0x80                        	000001 0880		
iw	0xa                  		; 	iw	ADPS                            	000002 380a		
;	.line	138; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	IOCP_W(ADCVS,0x19);		//ADC时钟：Fosc/16; ADC通道：AD3(P65); 内部基准电压：4V
mov	a, @0x19            		; 	mov	a,@0x19                        	000003 0819		
iw	0x7                  		; 	iw	ADCVS                           	000004 3807		
;	.line	139; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	ADCON = 0x40;			//ADC使能
mov	a, @0x40            		; 	MOV	A,@0x40                        	000005 0840		
mov	0x7, a              		; 	MOV	_ADCON,A                       	000006 3887		
;	.line	140; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	}
ret                     		; 	RET	                               	000007 3822		
;	.line	120; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	CONTW(0x02);			//TCC 8分频
mov	a, @0x2             		; 	mov	a,@0x02                        	0000c4 0802		
ctw                     		; 	ctw                                	0000c5 3802		
;	.line	121; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	TCC = data_tcc;			//1/2 * 8 * (256-6) = 1000us	公式：1/IRC频率 * 预分频 * （256-初值）
mov	a, @0x6             		; 	MOV	A,@0x06                        	0000c6 0806		
mov	0x1, a              		; 	MOV	_TCC,A                         	0000c7 3881		
;	.line	122; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	PORT6 = 0;				//P6口输出低
clr	0x6                 		; 	CLR	_PORT6                         	0000c8 3986		
;	.line	123; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	IOCP_W(P6CR,0x20);		//P65输入，其他口设为输出
mov	a, @0x20            		; 	mov	a,@0x20                        	0000c9 0820		
iw	0x6                  		; 	iw	P6CR                            	0000ca 3806		
;	.line	124; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	IOCP_W(PHDCR,0xff);		//端口上下拉控制寄存器，bit7-bit4对应P67-P64下拉;bit3-bit0对应P53-P50上拉 
dw	0x8ff  ;unknown opcode		; 	mov	a,@0xff                        	0000cb 08ff		
iw	0x9                  		; 	iw	PHDCR                           	0000cc 3809		
;	.line	125; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	IOCP_W(PDCR,0xff);		//端口下拉控制寄存器，  bit6-bit4对应P62-P60,bit3-bit0对应P53-P50
dw	0x8ff  ;unknown opcode		; 	mov	a,@0xff                        	0000cd 08ff		
iw	0xb                  		; 	iw	PDCR                            	0000ce 380b		
;	.line	126; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	IOCP_W(PHCR,0xff);		//P6端口上拉控制寄存器  bit7-bit0对应P67-P60
dw	0x8ff  ;unknown opcode		; 	mov	a,@0xff                        	0000cf 08ff		
iw	0xd                  		; 	iw	PHCR                            	0000d0 380d		
;	.line	127; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	IOCP_W(WDTCR,0x00);		//WDT 使能控制寄存器
mov	a, @0               		; 	mov	a,@0x00                        	0000d1 0800		
iw	0xe                  		; 	iw	WDTCR                           	0000d2 380e		
;	.line	128; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	IOCP_W(IMR,0x01);		//中断使能控制寄存器 
mov	a, @0x1             		; 	mov	a,@0x01                        	0000d3 0801		
iw	0xf                  		; 	iw	IMR                             	0000d4 380f		
;	.line	129; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	ISR = 0x0;				//清TC0中断标志位 
clr	0xf                 		; 	CLR	_ISR                           	0000d5 398f		
;	.line	130; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	}
ret                     		; 	RET	                               	0000d6 3822		
;	.line	111; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	for(RSR=0x90;RSR<0xCF;RSR++)	//清零 BANK0 RAM  IAR-R0,RSR-R4
dw	0x890  ;unknown opcode		; 	MOV	A,@0x90                        	0000d7 0890		
mov	0x4, a              		; 	MOV	_RSR,A                         	0000d8 3884		
dw	0x8cf  ;unknown opcode		; 	MOV	A,@0xcf                        	0000d9 08cf		
sub	a, 0x4              		; 	SUB	A,_RSR                         	0000da 3a04		
jbtc	0x3, 0             		; 	JBTC	STATUS,0                      	0000db 2003		
jmp	0xe0                		; 	JMP	_00144_DS_                     	0000dc 10e0		
;	.line	112; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	{IAR = 0;}
clr	0                   		; 	CLR	_IAR                           	0000dd 3980		
;	.line	111; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	for(RSR=0x90;RSR<0xCF;RSR++)	//清零 BANK0 RAM  IAR-R0,RSR-R4
inc	0x4                 		; 	INC	_RSR                           	0000de 3284		
jmp	0xd9                		; 	JMP	_00146_DS_                     	0000df 10d9		
;	.line	113; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	IAR = 0;
clr	0                   		; 	CLR	_IAR                           	0000e0 3980		
;	.line	114; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	}
ret                     		; 	RET	                               	0000e1 3822		
;	.line	98; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	ADRUN = 1;												//使能AD转换
bts	0x7, 0x7            		; 	BTS	_ADCONbits,7                   	0000ec 2f87		
;	.line	99; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	while(ADRUN);											//等待转换完成
jbtc	0x7, 0x7           		; 	JBTC	_ADCONbits,7                  	0000ed 2387		
jmp	0xed                		; 	JMP	_00139_DS_                     	0000ee 10ed		
;	.line	100; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	file_adc_read();
call	0x54               		; 	CALL	_file_adc_read                	0000ef 1854		
;	.line	105; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	}
ret                     		; 	RET	                               	0000f0 3822		
;	.line	80; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	IOCP_R(_ADATH_TEMP,ADATH);								//取AD转换值高8位
ir	0x8                  		; 	ir	ADATH                           	000054 3828		
mov	0x33, a             		; 	mov	_ADATH_TEMP,a                  	000055 38b3		
;	.line	81; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	IOCP_R(_ADATL_TEMP,ADATL);								//取AD转换值低8位
ir	0xc                  		; 	ir	ADATL                           	000056 382c		
mov	0x34, a             		; 	mov	_ADATL_TEMP,a                  	000057 38b4		
;	.line	82; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	ADCDATA_TEMP = ((ADATH_TEMP & 0xf0) << 4) + ADATL_TEMP;	//存放AD采集结果	
dw	0x8f0  ;unknown opcode		; 	MOV	A,@0xf0                        	000058 08f0		
and	a, 0x33             		; 	AND	A,_ADATH_TEMP                  	000059 3d33		
mov	0x15, a             		; 	MOV	r0x100D,A                      	00005a 3895		
mov	0x14, a             		; 	MOV	r0x100C,A                      	00005b 3894		
clr	0x16                		; 	CLR	r0x100E                        	00005c 3996		
swapa	0x16              		; 	SWAPA	r0x100E                      	00005d 3616		
dw	0xcf0  ;unknown opcode		; 	AND	A,@0xf0                        	00005e 0cf0		
mov	0x17, a             		; 	MOV	r0x100F,A                      	00005f 3897		
swapa	0x15              		; 	SWAPA	r0x100D                      	000060 3615		
mov	0x14, a             		; 	MOV	r0x100C,A                      	000061 3894		
and	a, @0xf             		; 	AND	A,@0x0f                        	000062 0c0f		
or	0x17, a              		; 	OR	r0x100F,A                       	000063 3c97		
xor	0x14, a             		; 	XOR	r0x100C,A                      	000064 3e94		
mov	a, 0x34             		; 	MOV	A,_ADATL_TEMP                  	000065 3034		
mov	0x15, a             		; 	MOV	r0x100D,A                      	000066 3895		
clr	0x16                		; 	CLR	r0x100E                        	000067 3996		
mov	a, 0x15             		; 	MOV	A,r0x100D                      	000068 3015		
add	a, 0x14             		; 	ADD	A,r0x100C                      	000069 3f14		
mov	0x1e, a             		; 	MOV	_ADCDATA_TEMP,A                	00006a 389e		
mov	a, 0x17             		; 	MOV	A,r0x100F                      	00006b 3017		
mov	0x1f, a             		; 	MOV	(_ADCDATA_TEMP + 1),A          	00006c 389f		
mov	a, @0               		; 	MOV	A,@0x00                        	00006d 0800		
mov	a, @0               		; 	MOV	A,@0x00                        	00006e 0800		
jbtc	0x3, 0             		; 	JBTC	STATUS,0                      	00006f 2003		
ija	0x16                		; 	IJA	r0x100E                        	000070 3716		
add	0x1f, a             		; 	ADD	(_ADCDATA_TEMP + 1),A          	000071 3f9f		
;	.line	83; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	ADCDATA_SUM += ADCDATA_TEMP;							//累加8次求平均
mov	a, 0x1e             		; 	MOV	A,_ADCDATA_TEMP                	000072 301e		
add	0x2e, a             		; 	ADD	_ADCDATA_SUM,A                 	000073 3fae		
mov	a, 0x1f             		; 	MOV	A,(_ADCDATA_TEMP + 1)          	000074 301f		
mov	a, 0x1f             		; 	MOV	A,(_ADCDATA_TEMP + 1)          	000075 301f		
jbtc	0x3, 0             		; 	JBTC	STATUS,0                      	000076 2003		
ija	0x1f                		; 	IJA	(_ADCDATA_TEMP + 1)            	000077 371f		
add	0x2f, a             		; 	ADD	(_ADCDATA_SUM + 1),A           	000078 3faf		
;	.line	84; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	ADCDATA_COUNT ++;
inc	0x32                		; 	INC	_ADCDATA_COUNT                 	000079 32b2		
;	.line	85; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	if(ADCDATA_COUNT >= 8)
mov	a, @0x8             		; 	MOV	A,@0x08                        	00007a 0808		
sub	a, 0x32             		; 	SUB	A,_ADCDATA_COUNT               	00007b 3a32		
jbts	0x3, 0             		; 	JBTS	STATUS,0                      	00007c 2403		
jmp	0x8c                		; 	JMP	_00134_DS_                     	00007d 108c		
;	.line	87; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	ADCDATA_COUNT = 0;		
clr	0x32                		; 	CLR	_ADCDATA_COUNT                 	00007e 39b2		
;	.line	88; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	ADCDATA = ADCDATA_SUM / 8;
btc	0x3, 0              		; 	BTC	STATUS,0                       	00007f 2803		
rca	0x2f                		; 	RCA	(_ADCDATA_SUM + 1)             	000080 342f		
mov	0x2d, a             		; 	MOV	(_ADCDATA + 1),A               	000081 38ad		
rca	0x2e                		; 	RCA	_ADCDATA_SUM                   	000082 342e		
mov	0x2c, a             		; 	MOV	_ADCDATA,A                     	000083 38ac		
btc	0x3, 0              		; 	BTC	STATUS,0                       	000084 2803		
rcr	0x2d                		; 	RCR	(_ADCDATA + 1)                 	000085 34ad		
rcr	0x2c                		; 	RCR	_ADCDATA                       	000086 34ac		
btc	0x3, 0              		; 	BTC	STATUS,0                       	000087 2803		
rcr	0x2d                		; 	RCR	(_ADCDATA + 1)                 	000088 34ad		
rcr	0x2c                		; 	RCR	_ADCDATA                       	000089 34ac		
;	.line	89; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	ADCDATA_SUM = 0;
clr	0x2e                		; 	CLR	_ADCDATA_SUM                   	00008a 39ae		
clr	0x2f                		; 	CLR	(_ADCDATA_SUM + 1)             	00008b 39af		
;	.line	91; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\0_XC8P8600_ADC\XC8P8600-ADC.C	}
ret                     		; 	RET	                               	00008c 3822		
