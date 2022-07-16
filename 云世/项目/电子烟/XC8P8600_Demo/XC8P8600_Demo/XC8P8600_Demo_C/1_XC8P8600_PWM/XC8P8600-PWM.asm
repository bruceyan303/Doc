jmp	0x4c                		; 	jmp	_main                          	000000 104c		
;	.line	70; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\1_XC8P8600_PWM\XC8P8600-PWM.C	__asm__("org 0x08");			//中断入口地址			
;	.line	71; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\1_XC8P8600_PWM\XC8P8600-PWM.C	PUSH(_A_BUFF,_R3_BUFF);			//中断入栈保护
mov	0x10, a             		; 	mov	_A_BUFF,a                      	000008 3890		
swap	0x10               		; 	swap	_A_BUFF                       	000009 3690		
swapa	0x3               		; 	swapa	STATUS                       	00000a 3603		
mov	0x11, a             		; 	mov	_R3_BUFF,a                     	00000b 3891		
;	.line	73; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\1_XC8P8600_PWM\XC8P8600-PWM.C	if(TCIF)					//判断TCIF是否为1
jbts	0xf, 0             		; 	JBTS	_ISRbits,0                    	00000c 240f		
jmp	0x1f                		; 	JMP	_00121_DS_                     	00000d 101f		
;	.line	75; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\1_XC8P8600_PWM\XC8P8600-PWM.C	TCC	  += data_tcc;			//1/2 * 8 * (256-6) = 1000us	公式：1/IRC频率 * 预分频 * （256-初值）
mov	a, @0x6             		; 	MOV	A,@0x06                        	00000e 0806		
add	0x1, a              		; 	ADD	_TCC,A                         	00000f 3f81		
;	.line	76; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\1_XC8P8600_PWM\XC8P8600-PWM.C	ISR    = 0xfe;				//清TC0中断标志位
dw	0x8fe  ;unknown opcode		; 	MOV	A,@0xfe                        	000010 08fe		
mov	0xf, a              		; 	MOV	_ISR,A                         	000011 388f		
;	.line	77; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\1_XC8P8600_PWM\XC8P8600-PWM.C	io_ledOut = !io_ledOut;			//P61口翻转
clr	0x12                		; 	CLR	r0x1000                        	000012 3992		
jbtc	0x6, 0             		; 	JBTC	_PORT6bits,0                  	000013 2006		
inc	0x12                		; 	INC	r0x1000                        	000014 3292		
mov	a, 0x12             		; 	MOV	A,r0x1000                      	000015 3012		
mov	a, @0               		; 	MOV	A,@0x00                        	000016 0800		
jbtc	0x3, 0x2           		; 	JBTC	STATUS,2                      	000017 2103		
mov	a, @0x1             		; 	MOV	A,@0x01                        	000018 0801		
mov	0x12, a             		; 	MOV	r0x1000,A                      	000019 3892		
rca	0x12                		; 	RCA	r0x1000                        	00001a 3412		
jbts	0x3, 0             		; 	JBTS	STATUS,0                      	00001b 2403		
btc	0x6, 0              		; 	BTC	_PORT6bits,0                   	00001c 2806		
jbtc	0x3, 0             		; 	JBTC	STATUS,0                      	00001d 2003		
bts	0x6, 0              		; 	BTS	_PORT6bits,0                   	00001e 2c06		
;	.line	80; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\1_XC8P8600_PWM\XC8P8600-PWM.C	POP(_A_BUFF,_R3_BUFF);			//中断出栈保护恢复
swapa	0x11              		; 	swapa	_R3_BUFF                     	00001f 3611		
mov	0x3, a              		; 	mov	STATUS,a                       	000020 3883		
swapa	0x10              		; 	swapa	_A_BUFF                      	000021 3610		
;	.line	81; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\1_XC8P8600_PWM\XC8P8600-PWM.C	}
reti                    		; 	RETI	                              	000022 3823		
;	.line	88; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\1_XC8P8600_PWM\XC8P8600-PWM.C	file_clrRam();					//清RAM
call	0x41               		; 	CALL	_file_clrRam                  	00004c 1841		
;	.line	89; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\1_XC8P8600_PWM\XC8P8600-PWM.C	file_init();					//io寄存器初始化
call	0x23               		; 	CALL	_file_init                    	00004d 1823		
;	.line	90; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\1_XC8P8600_PWM\XC8P8600-PWM.C	file_project_init();			//程序所需功能设置
call	0x36               		; 	CALL	_file_project_init            	00004e 1836		
;	.line	91; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\1_XC8P8600_PWM\XC8P8600-PWM.C	EI();							//打开总中断
ei                      		; 	ei	                                	00004f 3820		
;	.line	95; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\1_XC8P8600_PWM\XC8P8600-PWM.C	NOP();
nop                     		; 	nop	                               	000050 3800		
;	.line	96; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\1_XC8P8600_PWM\XC8P8600-PWM.C	NOP();
nop                     		; 	nop	                               	000051 3800		
;	.line	97; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\1_XC8P8600_PWM\XC8P8600-PWM.C	NOP();
nop                     		; 	nop	                               	000052 3800		
jmp	0x50                		; 	JMP	_00127_DS_                     	000053 1050		
;	.line	99; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\1_XC8P8600_PWM\XC8P8600-PWM.C	}
ret                     		; 	RET	                               	000054 3822		
;	.line	59; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\1_XC8P8600_PWM\XC8P8600-PWM.C	PWMCON = 0xf8;			//使能3路pwm输出，pwm=1/8*2(分频)*4clock*100=100us
dw	0x8f8  ;unknown opcode		; 	MOV	A,@0xf8                        	000036 08f8		
mov	0x8, a              		; 	MOV	_PWMCON,A                      	000037 3888		
;	.line	60; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\1_XC8P8600_PWM\XC8P8600-PWM.C	PRD = 100;				//PWM周期寄存器
mov	a, @0x64            		; 	MOV	A,@0x64                        	000038 0864		
mov	0x9, a              		; 	MOV	_PRD,A                         	000039 3889		
;	.line	61; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\1_XC8P8600_PWM\XC8P8600-PWM.C	PDC1 = 20;				//pwm1占空比
mov	a, @0x14            		; 	MOV	A,@0x14                        	00003a 0814		
mov	0xa, a              		; 	MOV	_PDC1,A                        	00003b 388a		
;	.line	62; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\1_XC8P8600_PWM\XC8P8600-PWM.C	PDC2 = 40;				//pwm1占空比
mov	a, @0x28            		; 	MOV	A,@0x28                        	00003c 0828		
mov	0xb, a              		; 	MOV	_PDC2,A                        	00003d 388b		
;	.line	63; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\1_XC8P8600_PWM\XC8P8600-PWM.C	PDC3 = 60;				//pwm1占空比
mov	a, @0x3c            		; 	MOV	A,@0x3c                        	00003e 083c		
mov	0xc, a              		; 	MOV	_PDC3,A                        	00003f 388c		
;	.line	64; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\1_XC8P8600_PWM\XC8P8600-PWM.C	}
ret                     		; 	RET	                               	000040 3822		
;	.line	39; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\1_XC8P8600_PWM\XC8P8600-PWM.C	CONTW(0x02);			//TCC 8分频
mov	a, @0x2             		; 	mov	a,@0x02                        	000023 0802		
ctw                     		; 	ctw                                	000024 3802		
;	.line	40; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\1_XC8P8600_PWM\XC8P8600-PWM.C	TCC = data_tcc;			//1/2 * 8 * (256-6) = 1000us	公式：1/IRC频率 * 预分频 * （256-初值）
mov	a, @0x6             		; 	MOV	A,@0x06                        	000025 0806		
mov	0x1, a              		; 	MOV	_TCC,A                         	000026 3881		
;	.line	41; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\1_XC8P8600_PWM\XC8P8600-PWM.C	PORT6 = 0;				//P6口输出低
clr	0x6                 		; 	CLR	_PORT6                         	000027 3986		
;	.line	42; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\1_XC8P8600_PWM\XC8P8600-PWM.C	IOCP_W(P6CR,0x08);		//P6口设为输出
mov	a, @0x8             		; 	mov	a,@0x08                        	000028 0808		
iw	0x6                  		; 	iw	P6CR                            	000029 3806		
;	.line	43; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\1_XC8P8600_PWM\XC8P8600-PWM.C	IOCP_W(PHDCR,0xff);		//端口上下拉控制寄存器，bit7-bit4对应P67-P64下拉;bit3-bit0对应P53-P50上拉 
dw	0x8ff  ;unknown opcode		; 	mov	a,@0xff                        	00002a 08ff		
iw	0x9                  		; 	iw	PHDCR                           	00002b 3809		
;	.line	44; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\1_XC8P8600_PWM\XC8P8600-PWM.C	IOCP_W(PDCR,0xff);		//端口下拉控制寄存器，  bit6-bit4对应P62-P60,bit3-bit0对应P53-P50
dw	0x8ff  ;unknown opcode		; 	mov	a,@0xff                        	00002c 08ff		
iw	0xb                  		; 	iw	PDCR                            	00002d 380b		
;	.line	45; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\1_XC8P8600_PWM\XC8P8600-PWM.C	IOCP_W(PHCR,0xff);		//P6端口上拉控制寄存器  bit7-bit0对应P67-P60
dw	0x8ff  ;unknown opcode		; 	mov	a,@0xff                        	00002e 08ff		
iw	0xd                  		; 	iw	PHCR                            	00002f 380d		
;	.line	46; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\1_XC8P8600_PWM\XC8P8600-PWM.C	IOCP_W(WDTCR,0x00);		//WDT 使能控制寄存器
mov	a, @0               		; 	mov	a,@0x00                        	000030 0800		
iw	0xe                  		; 	iw	WDTCR                           	000031 380e		
;	.line	47; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\1_XC8P8600_PWM\XC8P8600-PWM.C	IOCP_W(IMR,0x01);		//中断使能控制寄存器 
mov	a, @0x1             		; 	mov	a,@0x01                        	000032 0801		
iw	0xf                  		; 	iw	IMR                             	000033 380f		
;	.line	48; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\1_XC8P8600_PWM\XC8P8600-PWM.C	ISR = 0x0;				//清TC0中断标志位 
clr	0xf                 		; 	CLR	_ISR                           	000034 398f		
;	.line	49; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\1_XC8P8600_PWM\XC8P8600-PWM.C	}
ret                     		; 	RET	                               	000035 3822		
;	.line	30; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\1_XC8P8600_PWM\XC8P8600-PWM.C	for(RSR=0x90;RSR<0xFF;RSR++)	//清零 BANK0 RAM  IAR-R0,RSR-R4
dw	0x890  ;unknown opcode		; 	MOV	A,@0x90                        	000041 0890		
mov	0x4, a              		; 	MOV	_RSR,A                         	000042 3884		
dw	0x8ff  ;unknown opcode		; 	MOV	A,@0xff                        	000043 08ff		
sub	a, 0x4              		; 	SUB	A,_RSR                         	000044 3a04		
jbtc	0x3, 0             		; 	JBTC	STATUS,0                      	000045 2003		
jmp	0x4a                		; 	JMP	_00105_DS_                     	000046 104a		
;	.line	31; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\1_XC8P8600_PWM\XC8P8600-PWM.C	{IAR = 0;}
clr	0                   		; 	CLR	_IAR                           	000047 3980		
;	.line	30; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\1_XC8P8600_PWM\XC8P8600-PWM.C	for(RSR=0x90;RSR<0xFF;RSR++)	//清零 BANK0 RAM  IAR-R0,RSR-R4
inc	0x4                 		; 	INC	_RSR                           	000048 3284		
jmp	0x43                		; 	JMP	_00107_DS_                     	000049 1043		
;	.line	32; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\1_XC8P8600_PWM\XC8P8600-PWM.C	IAR = 0;
clr	0                   		; 	CLR	_IAR                           	00004a 3980		
;	.line	33; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\1_XC8P8600_PWM\XC8P8600-PWM.C	}
ret                     		; 	RET	                               	00004b 3822		
