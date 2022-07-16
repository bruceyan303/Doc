jmp	0x40                		; 	jmp	_main                          	000000 1040		
;	.line	81; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	__asm__("org 0x08");			//中断入口地址			
;	.line	82; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	PUSH(_A_BUFF,_R3_BUFF);			//中断入栈保护
mov	0x10, a             		; 	mov	_A_BUFF,a                      	000008 3890		
swap	0x10               		; 	swap	_A_BUFF                       	000009 3690		
swapa	0x3               		; 	swapa	STATUS                       	00000a 3603		
mov	0x11, a             		; 	mov	_R3_BUFF,a                     	00000b 3891		
;	.line	84; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	if(TCIF )					//判断TCIF是否为1
jbts	0xf, 0             		; 	JBTS	_ISRbits,0                    	00000c 240f		
jmp	0x12                		; 	JMP	_00121_DS_                     	00000d 1012		
;	.line	86; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	TCC	  += 0x06;				//1/2 * 8 * (256-6) = 1000us	公式：1/IRC频率 * 预分频 * （256-初值）
mov	a, @0x6             		; 	MOV	A,@0x06                        	00000e 0806		
add	0x1, a              		; 	ADD	_TCC,A                         	00000f 3f81		
;	.line	87; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	ISR    = 0xfe;				//清TC0中断标志位
dw	0x8fe  ;unknown opcode		; 	MOV	A,@0xfe                        	000010 08fe		
mov	0xf, a              		; 	MOV	_ISR,A                         	000011 388f		
;	.line	90; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	if(EXIF)					//判断EXIF是否为1,外部中断
jbts	0xf, 0x2           		; 	JBTS	_ISRbits,2                    	000012 250f		
jmp	0x16                		; 	JMP	_00123_DS_                     	000013 1016		
;	.line	92; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	ISR    = 0xfb;				//清EXIF中断标志位
dw	0x8fb  ;unknown opcode		; 	MOV	A,@0xfb                        	000014 08fb		
mov	0xf, a              		; 	MOV	_ISR,A                         	000015 388f		
;	.line	95; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	if(ICIF)					//判断ICIF是否为1,端口变化中断
jbts	0xf, 0x1           		; 	JBTS	_ISRbits,1                    	000016 248f		
jmp	0x1a                		; 	JMP	_00125_DS_                     	000017 101a		
;	.line	97; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	ISR    = 0xfd;				//清ICIF中断标志位
dw	0x8fd  ;unknown opcode		; 	MOV	A,@0xfd                        	000018 08fd		
mov	0xf, a              		; 	MOV	_ISR,A                         	000019 388f		
;	.line	101; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	if(T1IF)					//判断T1IF是否为1,pwm周期中断
jbts	0xf, 0x3           		; 	JBTS	_ISRbits,3                    	00001a 258f		
jmp	0x1e                		; 	JMP	_00127_DS_                     	00001b 101e		
;	.line	103; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	ISR    = 0xf7;				//ISR的bit3:T1IF清零
dw	0x8f7  ;unknown opcode		; 	MOV	A,@0xf7                        	00001c 08f7		
mov	0xf, a              		; 	MOV	_ISR,A                         	00001d 388f		
;	.line	107; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	POP(_A_BUFF,_R3_BUFF);			//中断出栈保护恢复
swapa	0x11              		; 	swapa	_R3_BUFF                     	00001e 3611		
mov	0x3, a              		; 	mov	STATUS,a                       	00001f 3883		
swapa	0x10              		; 	swapa	_A_BUFF                      	000020 3610		
;	.line	108; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	}
reti                    		; 	RETI	                              	000021 3823		
;	.line	115; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	file_clrRam();					//清RAM
call	0x35               		; 	CALL	_file_clrRam                  	000040 1835		
;	.line	116; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	file_init();					//io寄存器初始化
call	0x22               		; 	CALL	_file_init                    	000041 1822		
;	.line	117; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	file_project_init();			//程序所需功能设置
call	0x1                		; 	CALL	_file_project_init            	000042 1801		
;	.line	118; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	EI();							//打开总中断
ei                      		; 	ei	                                	000043 3820		
;	.line	122; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	NOP();
nop                     		; 	nop	                               	000044 3800		
;	.line	123; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	NOP();
nop                     		; 	nop	                               	000045 3800		
;	.line	124; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	NOP();
nop                     		; 	nop	                               	000046 3800		
jmp	0x44                		; 	JMP	_00133_DS_                     	000047 1044		
;	.line	126; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	}
ret                     		; 	RET	                               	000048 3822		
;	.line	71; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	IOCP_W(IMR,0x09);		//TCC+PWM周期中断 	
mov	a, @0x9             		; 	mov	a,@0x09                        	000001 0809		
iw	0xf                  		; 	iw	IMR                             	000002 380f		
;	.line	72; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	PWMCON = 0x88;			//pwm=1/8*2(分频)*4clock*100=100us
dw	0x888  ;unknown opcode		; 	MOV	A,@0x88                        	000003 0888		
mov	0x8, a              		; 	MOV	_PWMCON,A                      	000004 3888		
;	.line	73; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	PRD = 100;				//PWM周期寄存器
mov	a, @0x64            		; 	MOV	A,@0x64                        	000005 0864		
mov	0x9, a              		; 	MOV	_PRD,A                         	000006 3889		
;	.line	74; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	}
ret                     		; 	RET	                               	000007 3822		
;	.line	38; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	CONTW(0x02);			//TCC 8分频
mov	a, @0x2             		; 	mov	a,@0x02                        	000022 0802		
ctw                     		; 	ctw                                	000023 3802		
;	.line	39; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	TCC = data_tcc;			//1/2 * 8 * (256-6) = 1000us	公式：1/IRC频率 * 预分频 * （256-初值）
mov	a, @0x6             		; 	MOV	A,@0x06                        	000024 0806		
mov	0x1, a              		; 	MOV	_TCC,A                         	000025 3881		
;	.line	40; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	PORT6 = 0;				//P6口输出低
clr	0x6                 		; 	CLR	_PORT6                         	000026 3986		
;	.line	41; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	IOCP_W(P6CR,0x08);		//P6口设为输出
mov	a, @0x8             		; 	mov	a,@0x08                        	000027 0808		
iw	0x6                  		; 	iw	P6CR                            	000028 3806		
;	.line	42; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	IOCP_W(PHDCR,0xff);		//端口上下拉控制寄存器，bit7-bit4对应P67-P64下拉;bit3-bit0对应P53-P50上拉 
dw	0x8ff  ;unknown opcode		; 	mov	a,@0xff                        	000029 08ff		
iw	0x9                  		; 	iw	PHDCR                           	00002a 3809		
;	.line	43; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	IOCP_W(PDCR,0xff);		//端口下拉控制寄存器，  bit6-bit4对应P62-P60,bit3-bit0对应P53-P50
dw	0x8ff  ;unknown opcode		; 	mov	a,@0xff                        	00002b 08ff		
iw	0xb                  		; 	iw	PDCR                            	00002c 380b		
;	.line	44; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	IOCP_W(PHCR,0xff);		//P6端口上拉控制寄存器  bit7-bit0对应P67-P60
dw	0x8ff  ;unknown opcode		; 	mov	a,@0xff                        	00002d 08ff		
iw	0xd                  		; 	iw	PHCR                            	00002e 380d		
;	.line	45; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	IOCP_W(WDTCR,0x00);		//WDT 使能控制寄存器
mov	a, @0               		; 	mov	a,@0x00                        	00002f 0800		
iw	0xe                  		; 	iw	WDTCR                           	000030 380e		
;	.line	46; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	IOCP_W(IMR,0x01);		//中断使能控制寄存器 
mov	a, @0x1             		; 	mov	a,@0x01                        	000031 0801		
iw	0xf                  		; 	iw	IMR                             	000032 380f		
;	.line	47; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	ISR = 0x0;				//清TC0中断标志位 
clr	0xf                 		; 	CLR	_ISR                           	000033 398f		
;	.line	48; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	}
ret                     		; 	RET	                               	000034 3822		
;	.line	29; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	for(RSR=0x90;RSR<0xFF;RSR++)	//清零 BANK0 RAM  IAR-R0,RSR-R4
dw	0x890  ;unknown opcode		; 	MOV	A,@0x90                        	000035 0890		
mov	0x4, a              		; 	MOV	_RSR,A                         	000036 3884		
dw	0x8ff  ;unknown opcode		; 	MOV	A,@0xff                        	000037 08ff		
sub	a, 0x4              		; 	SUB	A,_RSR                         	000038 3a04		
jbtc	0x3, 0             		; 	JBTC	STATUS,0                      	000039 2003		
jmp	0x3e                		; 	JMP	_00105_DS_                     	00003a 103e		
;	.line	30; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	{IAR = 0;}
clr	0                   		; 	CLR	_IAR                           	00003b 3980		
;	.line	29; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	for(RSR=0x90;RSR<0xFF;RSR++)	//清零 BANK0 RAM  IAR-R0,RSR-R4
inc	0x4                 		; 	INC	_RSR                           	00003c 3284		
jmp	0x37                		; 	JMP	_00107_DS_                     	00003d 1037		
;	.line	31; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	IAR = 0;
clr	0                   		; 	CLR	_IAR                           	00003e 3980		
;	.line	32; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\6_XC8P8600_各中断模块\XC8P8600-INTERRUPT.C	}
ret                     		; 	RET	                               	00003f 3822		
