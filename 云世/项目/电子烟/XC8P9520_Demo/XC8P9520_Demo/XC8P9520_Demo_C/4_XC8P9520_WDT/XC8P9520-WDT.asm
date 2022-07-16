jmp	0x3d                		; 	jmp	_main                          	000000 103d		
;	.line	61; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\4_XC8P9520_WDT\XC8P9520-WDT.C	__asm__("org 0x08");			//中断入口地址			
;	.line	62; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\4_XC8P9520_WDT\XC8P9520-WDT.C	PUSH(_A_BUFF,_R3_BUFF);			//中断入栈保护
mov	0x10, a             		; 	mov	_A_BUFF,a                      	000008 3890		
swap	0x10               		; 	swap	_A_BUFF                       	000009 3690		
swapa	0x3               		; 	swapa	STATUS                       	00000a 3603		
mov	0x11, a             		; 	mov	_R3_BUFF,a                     	00000b 3891		
;	.line	64; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\4_XC8P9520_WDT\XC8P9520-WDT.C	if(TCIF == 1)					//判断TCIF是否为1
clr	0x12                		; 	CLR	r0x1003                        	00000c 3992		
jbtc	0xf, 0             		; 	JBTC	_ISRbits,0                    	00000d 200f		
inc	0x12                		; 	INC	r0x1003                        	00000e 3292		
mov	a, 0x12             		; 	MOV	A,r0x1003                      	00000f 3012		
mov	0x13, a             		; 	MOV	r0x1004,A                      	000010 3893		
xor	a, @0x1             		; 	XOR	A,@0x01                        	000011 0e01		
jbts	0x3, 0x2           		; 	JBTS	STATUS,2                      	000012 2503		
jmp	0x26                		; 	JMP	_00117_DS_                     	000013 1026		
;	.line	66; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\4_XC8P9520_WDT\XC8P9520-WDT.C	TCC	  += 0x06;				//1/2 * 8 * (256-6) = 1000us	公式：1/IRC频率 * 预分频 * （256-初值）
mov	a, @0x6             		; 	MOV	A,@0x06                        	000014 0806		
add	0x1, a              		; 	ADD	_TCC,A                         	000015 3f81		
;	.line	67; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\4_XC8P9520_WDT\XC8P9520-WDT.C	ISR    = 0xfe;				//清TC0中断标志位
dw	0x8fe  ;unknown opcode		; 	MOV	A,@0xfe                        	000016 08fe		
mov	0xf, a              		; 	MOV	_ISR,A                         	000017 388f		
;	.line	68; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\4_XC8P9520_WDT\XC8P9520-WDT.C	io_ledOut = !io_ledOut;			//P61口翻转
clr	0x12                		; 	CLR	r0x1003                        	000018 3992		
jbtc	0x6, 0             		; 	JBTC	_PORT6bits,0                  	000019 2006		
inc	0x12                		; 	INC	r0x1003                        	00001a 3292		
mov	a, 0x12             		; 	MOV	A,r0x1003                      	00001b 3012		
mov	a, @0               		; 	MOV	A,@0x00                        	00001c 0800		
jbtc	0x3, 0x2           		; 	JBTC	STATUS,2                      	00001d 2103		
mov	a, @0x1             		; 	MOV	A,@0x01                        	00001e 0801		
mov	0x12, a             		; 	MOV	r0x1003,A                      	00001f 3892		
mov	0x13, a             		; 	MOV	r0x1004,A                      	000020 3893		
rca	0x12                		; 	RCA	r0x1003                        	000021 3412		
jbts	0x3, 0             		; 	JBTS	STATUS,0                      	000022 2403		
btc	0x6, 0              		; 	BTC	_PORT6bits,0                   	000023 2806		
jbtc	0x3, 0             		; 	JBTC	STATUS,0                      	000024 2003		
bts	0x6, 0              		; 	BTS	_PORT6bits,0                   	000025 2c06		
;	.line	71; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\4_XC8P9520_WDT\XC8P9520-WDT.C	POP(_A_BUFF,_R3_BUFF);			//中断出栈保护恢复
swapa	0x11              		; 	swapa	_R3_BUFF                     	000026 3611		
mov	0x3, a              		; 	mov	STATUS,a                       	000027 3883		
swapa	0x10              		; 	swapa	_A_BUFF                      	000028 3610		
;	.line	72; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\4_XC8P9520_WDT\XC8P9520-WDT.C	}
reti                    		; 	RETI	                              	000029 3823		
;	.line	142; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\4_XC8P9520_WDT\XC8P9520-WDT.C	if(T==1)
clr	0x14                		; 	CLR	r0x1001                        	00003d 3994		
jbtc	0x3, 0x4           		; 	JBTC	_STATUSbits,4                 	00003e 2203		
inc	0x14                		; 	INC	r0x1001                        	00003f 3294		
mov	a, 0x14             		; 	MOV	A,r0x1001                      	000040 3014		
xor	a, @0x1             		; 	XOR	A,@0x01                        	000041 0e01		
jbts	0x3, 0x2           		; 	JBTS	STATUS,2                      	000042 2503		
jmp	0x45                		; 	JMP	_00134_DS_                     	000043 1045		
;	.line	144; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\4_XC8P9520_WDT\XC8P9520-WDT.C	file_clrRam();				//上电复位，反之WDT复位
call	0x69               		; 	CALL	_file_clrRam                  	000044 1869		
;	.line	146; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\4_XC8P9520_WDT\XC8P9520-WDT.C	file_init();					//io寄存器初始化
call	0x2a               		; 	CALL	_file_init                    	000045 182a		
;	.line	148; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\4_XC8P9520_WDT\XC8P9520-WDT.C	EI();							//打开总中断
ei                      		; 	ei	                                	000046 3820		
;	.line	152; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\4_XC8P9520_WDT\XC8P9520-WDT.C	file_WDTTime();				//WDT定时
call	0x5e               		; 	CALL	_file_WDTTime                 	000047 185e		
;	.line	153; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\4_XC8P9520_WDT\XC8P9520-WDT.C	file_WDTWake_slep();		//WDT唤醒睡眠
call	0x4e               		; 	CALL	_file_WDTWake_slep            	000048 184e		
;	.line	154; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\4_XC8P9520_WDT\XC8P9520-WDT.C	NOP();
nop                     		; 	nop	                               	000049 3800		
;	.line	155; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\4_XC8P9520_WDT\XC8P9520-WDT.C	NOP();
nop                     		; 	nop	                               	00004a 3800		
;	.line	156; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\4_XC8P9520_WDT\XC8P9520-WDT.C	NOP();
nop                     		; 	nop	                               	00004b 3800		
jmp	0x47                		; 	JMP	_00136_DS_                     	00004c 1047		
;	.line	158; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\4_XC8P9520_WDT\XC8P9520-WDT.C	}
ret                     		; 	RET	                               	00004d 3822		
;	.line	93; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\4_XC8P9520_WDT\XC8P9520-WDT.C	IOCP_W(WDTCR,0x00);		 //;如果分频是由TCC切换而来，需要先关WDT 
mov	a, @0               		; 	mov	a,@0x00                        	00004e 0800		
iw	0xe                  		; 	iw	WDTCR                           	00004f 380e		
;	.line	95; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\4_XC8P9520_WDT\XC8P9520-WDT.C	IOCP_W(IMR,0x00);
mov	a, @0               		; 	mov	a,@0x00                        	000050 0800		
iw	0xf                  		; 	iw	IMR                             	000051 380f		
;	.line	96; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\4_XC8P9520_WDT\XC8P9520-WDT.C	ISR=0;
clr	0xf                 		; 	CLR	_ISR                           	000052 398f		
;	.line	97; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\4_XC8P9520_WDT\XC8P9520-WDT.C	CWDT();
cwdt                    		; 	CWDT	                              	000053 3804		
;	.line	98; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\4_XC8P9520_WDT\XC8P9520-WDT.C	CONTW(0x09);			//预分频分给wdt,2分频 
mov	a, @0x9             		; 	mov	a,@0x09                        	000054 0809		
ctw                     		; 	ctw                                	000055 3802		
;	.line	99; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\4_XC8P9520_WDT\XC8P9520-WDT.C	IOCP_W(WDTCR,0x80);
dw	0x880  ;unknown opcode		; 	mov	a,@0x80                        	000056 0880		
iw	0xe                  		; 	iw	WDTCR                           	000057 380e		
;	.line	100; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\4_XC8P9520_WDT\XC8P9520-WDT.C	DI();
di                      		; 	di	                                	000058 3821		
;	.line	101; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\4_XC8P9520_WDT\XC8P9520-WDT.C	NOP();
nop                     		; 	nop	                               	000059 3800		
;	.line	102; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\4_XC8P9520_WDT\XC8P9520-WDT.C	SLEEP();
sleep                   		; 	sleep	                             	00005a 3803		
;	.line	103; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\4_XC8P9520_WDT\XC8P9520-WDT.C	NOP();
nop                     		; 	nop	                               	00005b 3800		
;	.line	104; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\4_XC8P9520_WDT\XC8P9520-WDT.C	NOP();
nop                     		; 	nop	                               	00005c 3800		
;	.line	105; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\4_XC8P9520_WDT\XC8P9520-WDT.C	}
ret                     		; 	RET	                               	00005d 3822		
;	.line	78; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\4_XC8P9520_WDT\XC8P9520-WDT.C	if(++reg_sleep_cnt>=10) // 
inc	0x15                		; 	INC	_reg_sleep_cnt                 	00005e 3295		
mov	a, @0xa             		; 	MOV	A,@0x0a                        	00005f 080a		
sub	a, 0x15             		; 	SUB	A,_reg_sleep_cnt               	000060 3a15		
jbts	0x3, 0             		; 	JBTS	STATUS,0                      	000061 2403		
jmp	0x68                		; 	JMP	_00124_DS_                     	000062 1068		
;	.line	80; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\4_XC8P9520_WDT\XC8P9520-WDT.C	reg_sleep_cnt=0;
clr	0x15                		; 	CLR	_reg_sleep_cnt                 	000063 3995		
;	.line	81; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\4_XC8P9520_WDT\XC8P9520-WDT.C	io_led2Out =1;
bts	0x6, 0x1            		; 	BTS	_PORT6bits,1                   	000064 2c86		
;	.line	82; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\4_XC8P9520_WDT\XC8P9520-WDT.C	NOP();
nop                     		; 	nop	                               	000065 3800		
;	.line	83; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\4_XC8P9520_WDT\XC8P9520-WDT.C	NOP();//delayUs(80);		//亮322us
nop                     		; 	nop	                               	000066 3800		
;	.line	84; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\4_XC8P9520_WDT\XC8P9520-WDT.C	io_led2Out =0;
btc	0x6, 0x1            		; 	BTC	_PORT6bits,1                   	000067 2886		
;	.line	86; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\4_XC8P9520_WDT\XC8P9520-WDT.C	}
ret                     		; 	RET	                               	000068 3822		
;	.line	39; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\4_XC8P9520_WDT\XC8P9520-WDT.C	CONTW(0x02);			//TCC 8分频
mov	a, @0x2             		; 	mov	a,@0x02                        	00002a 0802		
ctw                     		; 	ctw                                	00002b 3802		
;	.line	40; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\4_XC8P9520_WDT\XC8P9520-WDT.C	TCC = data_tcc;			//1/2 * 8 * (256-6) = 1000us	公式：1/IRC频率 * 预分频 * （256-初值）
mov	a, @0x6             		; 	MOV	A,@0x06                        	00002c 0806		
mov	0x1, a              		; 	MOV	_TCC,A                         	00002d 3881		
;	.line	41; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\4_XC8P9520_WDT\XC8P9520-WDT.C	PORT6 = 0;				//P6口输出低
clr	0x6                 		; 	CLR	_PORT6                         	00002e 3986		
;	.line	42; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\4_XC8P9520_WDT\XC8P9520-WDT.C	IOCP_W(P6CR,0x08);		//P6口设为输出
mov	a, @0x8             		; 	mov	a,@0x08                        	00002f 0808		
iw	0x6                  		; 	iw	P6CR                            	000030 3806		
;	.line	43; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\4_XC8P9520_WDT\XC8P9520-WDT.C	IOCP_W(PHDCR,0xff);		//端口上下拉控制寄存器，bit7-bit4对应P67-P64下拉;bit3-bit0对应P53-P50上拉 
dw	0x8ff  ;unknown opcode		; 	mov	a,@0xff                        	000031 08ff		
iw	0x9                  		; 	iw	PHDCR                           	000032 3809		
;	.line	44; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\4_XC8P9520_WDT\XC8P9520-WDT.C	IOCP_W(PDCR,0xff);		//端口下拉控制寄存器，  bit6-bit4对应P62-P60,bit3-bit0对应P53-P50
dw	0x8ff  ;unknown opcode		; 	mov	a,@0xff                        	000033 08ff		
iw	0xb                  		; 	iw	PDCR                            	000034 380b		
;	.line	45; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\4_XC8P9520_WDT\XC8P9520-WDT.C	IOCP_W(PHCR,0xff);		//P6端口上拉控制寄存器  bit7-bit0对应P67-P60
dw	0x8ff  ;unknown opcode		; 	mov	a,@0xff                        	000035 08ff		
iw	0xd                  		; 	iw	PHCR                            	000036 380d		
;	.line	46; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\4_XC8P9520_WDT\XC8P9520-WDT.C	IOCP_W(WDTCR,0x00);		//WDT 使能控制寄存器
mov	a, @0               		; 	mov	a,@0x00                        	000037 0800		
iw	0xe                  		; 	iw	WDTCR                           	000038 380e		
;	.line	47; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\4_XC8P9520_WDT\XC8P9520-WDT.C	IOCP_W(IMR,0x01);		//中断使能控制寄存器 
mov	a, @0x1             		; 	mov	a,@0x01                        	000039 0801		
iw	0xf                  		; 	iw	IMR                             	00003a 380f		
;	.line	48; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\4_XC8P9520_WDT\XC8P9520-WDT.C	ISR = 0x0;				//清TC0中断标志位 
clr	0xf                 		; 	CLR	_ISR                           	00003b 398f		
;	.line	49; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\4_XC8P9520_WDT\XC8P9520-WDT.C	}
ret                     		; 	RET	                               	00003c 3822		
;	.line	29; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\4_XC8P9520_WDT\XC8P9520-WDT.C	for(RSR=0x90;RSR<0xFF;RSR++)	//清零 BANK0 RAM  IAR-R0,RSR-R4
dw	0x890  ;unknown opcode		; 	MOV	A,@0x90                        	000069 0890		
mov	0x4, a              		; 	MOV	_RSR,A                         	00006a 3884		
dw	0x8ff  ;unknown opcode		; 	MOV	A,@0xff                        	00006b 08ff		
sub	a, 0x4              		; 	SUB	A,_RSR                         	00006c 3a04		
jbtc	0x3, 0             		; 	JBTC	STATUS,0                      	00006d 2003		
jmp	0x72                		; 	JMP	_00105_DS_                     	00006e 1072		
;	.line	31; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\4_XC8P9520_WDT\XC8P9520-WDT.C	{IAR = 0;}
clr	0                   		; 	CLR	_IAR                           	00006f 3980		
;	.line	29; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\4_XC8P9520_WDT\XC8P9520-WDT.C	for(RSR=0x90;RSR<0xFF;RSR++)	//清零 BANK0 RAM  IAR-R0,RSR-R4
inc	0x4                 		; 	INC	_RSR                           	000070 3284		
jmp	0x6b                		; 	JMP	_00107_DS_                     	000071 106b		
;	.line	32; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\4_XC8P9520_WDT\XC8P9520-WDT.C	IAR = 0;
clr	0                   		; 	CLR	_IAR                           	000072 3980		
;	.line	33; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\4_XC8P9520_WDT\XC8P9520-WDT.C	}
ret                     		; 	RET	                               	000073 3822		
