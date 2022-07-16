jmp	0x90                		; 	jmp	_main                          	000000 1090		
;	.line	78; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_各中断模块\XC9520-INTERRUPT.C	__asm__("org 0x08");			//中断入口地址			
;	.line	79; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_各中断模块\XC9520-INTERRUPT.C	PUSH(_A_BUFF,_R3_BUFF);			//中断入栈保护
mov	0x10, a             		; 	mov	_A_BUFF,a                      	000008 3890		
swap	0x10               		; 	swap	_A_BUFF                       	000009 3690		
swapa	0x3               		; 	swapa	STATUS                       	00000a 3603		
mov	0x11, a             		; 	mov	_R3_BUFF,a                     	00000b 3891		
;	.line	81; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_各中断模块\XC9520-INTERRUPT.C	if(TCIF == 1)					//判断TCIF是否为1
clr	0x12                		; 	CLR	r0x1000                        	00000c 3992		
jbtc	0xf, 0             		; 	JBTC	_ISRbits,0                    	00000d 200f		
inc	0x12                		; 	INC	r0x1000                        	00000e 3292		
mov	a, 0x12             		; 	MOV	A,r0x1000                      	00000f 3012		
mov	0x13, a             		; 	MOV	r0x1001,A                      	000010 3893		
xor	a, @0x1             		; 	XOR	A,@0x01                        	000011 0e01		
jbts	0x3, 0x2           		; 	JBTS	STATUS,2                      	000012 2503		
jmp	0x26                		; 	JMP	_00121_DS_                     	000013 1026		
;	.line	83; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_各中断模块\XC9520-INTERRUPT.C	TCC	  += 0x06;				//1/2 * 8 * (256-6) = 1000us	公式：1/IRC频率 * 预分频 * （256-初值）
mov	a, @0x6             		; 	MOV	A,@0x06                        	000014 0806		
add	0x1, a              		; 	ADD	_TCC,A                         	000015 3f81		
;	.line	84; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_各中断模块\XC9520-INTERRUPT.C	ISR    = 0xfe;				//清TC0中断标志位
dw	0x8fe  ;unknown opcode		; 	MOV	A,@0xfe                        	000016 08fe		
mov	0xf, a              		; 	MOV	_ISR,A                         	000017 388f		
;	.line	85; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_各中断模块\XC9520-INTERRUPT.C	io_ledOut = !io_ledOut;			//P61口翻转
clr	0x12                		; 	CLR	r0x1000                        	000018 3992		
jbtc	0x6, 0             		; 	JBTC	_PORT6bits,0                  	000019 2006		
inc	0x12                		; 	INC	r0x1000                        	00001a 3292		
mov	a, 0x12             		; 	MOV	A,r0x1000                      	00001b 3012		
mov	a, @0               		; 	MOV	A,@0x00                        	00001c 0800		
jbtc	0x3, 0x2           		; 	JBTC	STATUS,2                      	00001d 2103		
mov	a, @0x1             		; 	MOV	A,@0x01                        	00001e 0801		
mov	0x12, a             		; 	MOV	r0x1000,A                      	00001f 3892		
mov	0x13, a             		; 	MOV	r0x1001,A                      	000020 3893		
rca	0x12                		; 	RCA	r0x1000                        	000021 3412		
jbts	0x3, 0             		; 	JBTS	STATUS,0                      	000022 2403		
btc	0x6, 0              		; 	BTC	_PORT6bits,0                   	000023 2806		
jbtc	0x3, 0             		; 	JBTC	STATUS,0                      	000024 2003		
bts	0x6, 0              		; 	BTS	_PORT6bits,0                   	000025 2c06		
;	.line	87; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_各中断模块\XC9520-INTERRUPT.C	if(EXIF == 1)					//判断EXIF是否为1,外部中断
clr	0x12                		; 	CLR	r0x1000                        	000026 3992		
jbtc	0xf, 0x2           		; 	JBTC	_ISRbits,2                    	000027 210f		
inc	0x12                		; 	INC	r0x1000                        	000028 3292		
mov	a, 0x12             		; 	MOV	A,r0x1000                      	000029 3012		
mov	0x13, a             		; 	MOV	r0x1001,A                      	00002a 3893		
xor	a, @0x1             		; 	XOR	A,@0x01                        	00002b 0e01		
jbts	0x3, 0x2           		; 	JBTS	STATUS,2                      	00002c 2503		
jmp	0x3e                		; 	JMP	_00123_DS_                     	00002d 103e		
;	.line	89; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_各中断模块\XC9520-INTERRUPT.C	ISR    = 0xfb;				//清EXIF中断标志位
dw	0x8fb  ;unknown opcode		; 	MOV	A,@0xfb                        	00002e 08fb		
mov	0xf, a              		; 	MOV	_ISR,A                         	00002f 388f		
;	.line	90; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_各中断模块\XC9520-INTERRUPT.C	PORT6_4 = !PORT6_4;			//P64口翻转
clr	0x12                		; 	CLR	r0x1000                        	000030 3992		
jbtc	0x6, 0x4           		; 	JBTC	_PORT6bits,4                  	000031 2206		
inc	0x12                		; 	INC	r0x1000                        	000032 3292		
mov	a, 0x12             		; 	MOV	A,r0x1000                      	000033 3012		
mov	a, @0               		; 	MOV	A,@0x00                        	000034 0800		
jbtc	0x3, 0x2           		; 	JBTC	STATUS,2                      	000035 2103		
mov	a, @0x1             		; 	MOV	A,@0x01                        	000036 0801		
mov	0x12, a             		; 	MOV	r0x1000,A                      	000037 3892		
mov	0x13, a             		; 	MOV	r0x1001,A                      	000038 3893		
rca	0x12                		; 	RCA	r0x1000                        	000039 3412		
jbts	0x3, 0             		; 	JBTS	STATUS,0                      	00003a 2403		
btc	0x6, 0x4            		; 	BTC	_PORT6bits,4                   	00003b 2a06		
jbtc	0x3, 0             		; 	JBTC	STATUS,0                      	00003c 2003		
bts	0x6, 0x4            		; 	BTS	_PORT6bits,4                   	00003d 2e06		
;	.line	92; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_各中断模块\XC9520-INTERRUPT.C	if(ICIF == 1)					//判断ICIF是否为1,端口变化中断
clr	0x12                		; 	CLR	r0x1000                        	00003e 3992		
jbtc	0xf, 0x1           		; 	JBTC	_ISRbits,1                    	00003f 208f		
inc	0x12                		; 	INC	r0x1000                        	000040 3292		
mov	a, 0x12             		; 	MOV	A,r0x1000                      	000041 3012		
mov	0x13, a             		; 	MOV	r0x1001,A                      	000042 3893		
xor	a, @0x1             		; 	XOR	A,@0x01                        	000043 0e01		
jbts	0x3, 0x2           		; 	JBTS	STATUS,2                      	000044 2503		
jmp	0x56                		; 	JMP	_00125_DS_                     	000045 1056		
;	.line	94; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_各中断模块\XC9520-INTERRUPT.C	ISR    = 0xfd;				//清ICIF中断标志位
dw	0x8fd  ;unknown opcode		; 	MOV	A,@0xfd                        	000046 08fd		
mov	0xf, a              		; 	MOV	_ISR,A                         	000047 388f		
;	.line	95; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_各中断模块\XC9520-INTERRUPT.C	PORT6_4 = !PORT6_4;			//P64口翻转
clr	0x12                		; 	CLR	r0x1000                        	000048 3992		
jbtc	0x6, 0x4           		; 	JBTC	_PORT6bits,4                  	000049 2206		
inc	0x12                		; 	INC	r0x1000                        	00004a 3292		
mov	a, 0x12             		; 	MOV	A,r0x1000                      	00004b 3012		
mov	a, @0               		; 	MOV	A,@0x00                        	00004c 0800		
jbtc	0x3, 0x2           		; 	JBTC	STATUS,2                      	00004d 2103		
mov	a, @0x1             		; 	MOV	A,@0x01                        	00004e 0801		
mov	0x12, a             		; 	MOV	r0x1000,A                      	00004f 3892		
mov	0x13, a             		; 	MOV	r0x1001,A                      	000050 3893		
rca	0x12                		; 	RCA	r0x1000                        	000051 3412		
jbts	0x3, 0             		; 	JBTS	STATUS,0                      	000052 2403		
btc	0x6, 0x4            		; 	BTC	_PORT6bits,4                   	000053 2a06		
jbtc	0x3, 0             		; 	JBTC	STATUS,0                      	000054 2003		
bts	0x6, 0x4            		; 	BTS	_PORT6bits,4                   	000055 2e06		
;	.line	98; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_各中断模块\XC9520-INTERRUPT.C	if(T1IF == 1)					//判断T1IF是否为1,pwm周期中断
clr	0x12                		; 	CLR	r0x1000                        	000056 3992		
jbtc	0xf, 0x3           		; 	JBTC	_ISRbits,3                    	000057 218f		
inc	0x12                		; 	INC	r0x1000                        	000058 3292		
mov	a, 0x12             		; 	MOV	A,r0x1000                      	000059 3012		
mov	0x13, a             		; 	MOV	r0x1001,A                      	00005a 3893		
xor	a, @0x1             		; 	XOR	A,@0x01                        	00005b 0e01		
jbts	0x3, 0x2           		; 	JBTS	STATUS,2                      	00005c 2503		
jmp	0x6e                		; 	JMP	_00127_DS_                     	00005d 106e		
;	.line	100; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_各中断模块\XC9520-INTERRUPT.C	ISR    = 0xf7;				//ISR的bit3:T1IF清零
dw	0x8f7  ;unknown opcode		; 	MOV	A,@0xf7                        	00005e 08f7		
mov	0xf, a              		; 	MOV	_ISR,A                         	00005f 388f		
;	.line	101; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_各中断模块\XC9520-INTERRUPT.C	PORT6_4 = !PORT6_4;			//P64口翻转
clr	0x12                		; 	CLR	r0x1000                        	000060 3992		
jbtc	0x6, 0x4           		; 	JBTC	_PORT6bits,4                  	000061 2206		
inc	0x12                		; 	INC	r0x1000                        	000062 3292		
mov	a, 0x12             		; 	MOV	A,r0x1000                      	000063 3012		
mov	a, @0               		; 	MOV	A,@0x00                        	000064 0800		
jbtc	0x3, 0x2           		; 	JBTC	STATUS,2                      	000065 2103		
mov	a, @0x1             		; 	MOV	A,@0x01                        	000066 0801		
mov	0x12, a             		; 	MOV	r0x1000,A                      	000067 3892		
mov	0x13, a             		; 	MOV	r0x1001,A                      	000068 3893		
rca	0x12                		; 	RCA	r0x1000                        	000069 3412		
jbts	0x3, 0             		; 	JBTS	STATUS,0                      	00006a 2403		
btc	0x6, 0x4            		; 	BTC	_PORT6bits,4                   	00006b 2a06		
jbtc	0x3, 0             		; 	JBTC	STATUS,0                      	00006c 2003		
bts	0x6, 0x4            		; 	BTS	_PORT6bits,4                   	00006d 2e06		
;	.line	104; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_各中断模块\XC9520-INTERRUPT.C	POP(_A_BUFF,_R3_BUFF);			//中断出栈保护恢复
swapa	0x11              		; 	swapa	_R3_BUFF                     	00006e 3611		
mov	0x3, a              		; 	mov	STATUS,a                       	00006f 3883		
swapa	0x10              		; 	swapa	_A_BUFF                      	000070 3610		
;	.line	105; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_各中断模块\XC9520-INTERRUPT.C	}
reti                    		; 	RETI	                              	000071 3823		
;	.line	112; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_各中断模块\XC9520-INTERRUPT.C	file_clrRam();					//清RAM
call	0x85               		; 	CALL	_file_clrRam                  	000090 1885		
;	.line	113; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_各中断模块\XC9520-INTERRUPT.C	file_init();					//io寄存器初始化
call	0x72               		; 	CALL	_file_init                    	000091 1872		
;	.line	114; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_各中断模块\XC9520-INTERRUPT.C	file_project_init();			//程序所需功能设置
call	0x1                		; 	CALL	_file_project_init            	000092 1801		
;	.line	115; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_各中断模块\XC9520-INTERRUPT.C	EI();							//打开总中断
ei                      		; 	ei	                                	000093 3820		
;	.line	119; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_各中断模块\XC9520-INTERRUPT.C	NOP();
nop                     		; 	nop	                               	000094 3800		
;	.line	120; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_各中断模块\XC9520-INTERRUPT.C	NOP();
nop                     		; 	nop	                               	000095 3800		
;	.line	121; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_各中断模块\XC9520-INTERRUPT.C	NOP();
nop                     		; 	nop	                               	000096 3800		
jmp	0x94                		; 	JMP	_00133_DS_                     	000097 1094		
;	.line	123; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_各中断模块\XC9520-INTERRUPT.C	}
ret                     		; 	RET	                               	000098 3822		
;	.line	55; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_各中断模块\XC9520-INTERRUPT.C	IOCP_W(P6CR,0x01);		//P60输入口
mov	a, @0x1             		; 	mov	a,@0x01                        	000001 0801		
iw	0x6                  		; 	iw	P6CR                            	000002 3806		
;	.line	56; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_各中断模块\XC9520-INTERRUPT.C	IOCP_W(WDTCR,0x40);		//Bit<6>:EIS-P60 外部中断使能位,设置P60为中断脚
mov	a, @0x40            		; 	mov	a,@0x40                        	000003 0840		
iw	0xe                  		; 	iw	WDTCR                           	000004 380e		
;	.line	57; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_各中断模块\XC9520-INTERRUPT.C	IOCP_W(IMR,0x05);		//TCC+P60外部中断/* */ 			
mov	a, @0x5             		; 	mov	a,@0x05                        	000005 0805		
iw	0xf                  		; 	iw	IMR                             	000006 380f		
;	.line	71; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_各中断模块\XC9520-INTERRUPT.C	}
ret                     		; 	RET	                               	000007 3822		
;	.line	35; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_各中断模块\XC9520-INTERRUPT.C	CONTW(0x02);			//TCC 8分频
mov	a, @0x2             		; 	mov	a,@0x02                        	000072 0802		
ctw                     		; 	ctw                                	000073 3802		
;	.line	36; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_各中断模块\XC9520-INTERRUPT.C	TCC = data_tcc;			//1/2 * 8 * (256-6) = 1000us	公式：1/IRC频率 * 预分频 * （256-初值）
mov	a, @0x6             		; 	MOV	A,@0x06                        	000074 0806		
mov	0x1, a              		; 	MOV	_TCC,A                         	000075 3881		
;	.line	37; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_各中断模块\XC9520-INTERRUPT.C	PORT6 = 0;				//P6口输出低
clr	0x6                 		; 	CLR	_PORT6                         	000076 3986		
;	.line	38; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_各中断模块\XC9520-INTERRUPT.C	IOCP_W(P6CR,0x08);		//P6口设为输出
mov	a, @0x8             		; 	mov	a,@0x08                        	000077 0808		
iw	0x6                  		; 	iw	P6CR                            	000078 3806		
;	.line	39; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_各中断模块\XC9520-INTERRUPT.C	IOCP_W(PHDCR,0xff);		//端口上下拉控制寄存器，bit7-bit4对应P67-P64下拉;bit3-bit0对应P53-P50上拉 
dw	0x8ff  ;unknown opcode		; 	mov	a,@0xff                        	000079 08ff		
iw	0x9                  		; 	iw	PHDCR                           	00007a 3809		
;	.line	40; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_各中断模块\XC9520-INTERRUPT.C	IOCP_W(PDCR,0xff);		//端口下拉控制寄存器，  bit6-bit4对应P62-P60,bit3-bit0对应P53-P50
dw	0x8ff  ;unknown opcode		; 	mov	a,@0xff                        	00007b 08ff		
iw	0xb                  		; 	iw	PDCR                            	00007c 380b		
;	.line	41; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_各中断模块\XC9520-INTERRUPT.C	IOCP_W(PHCR,0xff);		//P6端口上拉控制寄存器  bit7-bit0对应P67-P60
dw	0x8ff  ;unknown opcode		; 	mov	a,@0xff                        	00007d 08ff		
iw	0xd                  		; 	iw	PHCR                            	00007e 380d		
;	.line	42; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_各中断模块\XC9520-INTERRUPT.C	IOCP_W(WDTCR,0x00);		//WDT 使能控制寄存器
mov	a, @0               		; 	mov	a,@0x00                        	00007f 0800		
iw	0xe                  		; 	iw	WDTCR                           	000080 380e		
;	.line	43; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_各中断模块\XC9520-INTERRUPT.C	IOCP_W(IMR,0x01);		//中断使能控制寄存器 
mov	a, @0x1             		; 	mov	a,@0x01                        	000081 0801		
iw	0xf                  		; 	iw	IMR                             	000082 380f		
;	.line	44; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_各中断模块\XC9520-INTERRUPT.C	ISR = 0x0;				//清TC0中断标志位 
clr	0xf                 		; 	CLR	_ISR                           	000083 398f		
;	.line	45; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_各中断模块\XC9520-INTERRUPT.C	}
ret                     		; 	RET	                               	000084 3822		
;	.line	26; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_各中断模块\XC9520-INTERRUPT.C	for(RSR=0x90;RSR<0xFF;RSR++)	//清零 BANK0 RAM  IAR-R0,RSR-R4
dw	0x890  ;unknown opcode		; 	MOV	A,@0x90                        	000085 0890		
mov	0x4, a              		; 	MOV	_RSR,A                         	000086 3884		
dw	0x8ff  ;unknown opcode		; 	MOV	A,@0xff                        	000087 08ff		
sub	a, 0x4              		; 	SUB	A,_RSR                         	000088 3a04		
jbtc	0x3, 0             		; 	JBTC	STATUS,0                      	000089 2003		
jmp	0x8e                		; 	JMP	_00105_DS_                     	00008a 108e		
;	.line	27; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_各中断模块\XC9520-INTERRUPT.C	{IAR = 0;}
clr	0                   		; 	CLR	_IAR                           	00008b 3980		
;	.line	26; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_各中断模块\XC9520-INTERRUPT.C	for(RSR=0x90;RSR<0xFF;RSR++)	//清零 BANK0 RAM  IAR-R0,RSR-R4
inc	0x4                 		; 	INC	_RSR                           	00008c 3284		
jmp	0x87                		; 	JMP	_00107_DS_                     	00008d 1087		
;	.line	28; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_各中断模块\XC9520-INTERRUPT.C	IAR = 0;
clr	0                   		; 	CLR	_IAR                           	00008e 3980		
;	.line	29; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\6_XC8P9520_各中断模块\XC9520-INTERRUPT.C	}
ret                     		; 	RET	                               	00008f 3822		
