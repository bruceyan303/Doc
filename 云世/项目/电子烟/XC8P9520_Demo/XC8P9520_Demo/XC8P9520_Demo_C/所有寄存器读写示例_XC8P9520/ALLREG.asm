jmp	0x10                		; 	jmp	_main                          	000000 1010		
;	.line	138; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	__asm__("org 0x08");
;	.line	139; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	PUSH(_A_BUFF,_R3_BUFF);			//中断入栈保护
mov	0x10, a             		; 	mov	_A_BUFF,a                      	000008 3890		
swap	0x10               		; 	swap	_A_BUFF                       	000009 3690		
swapa	0x3               		; 	swapa	STATUS                       	00000a 3603		
mov	0x11, a             		; 	mov	_R3_BUFF,a                     	00000b 3891		
;	.line	143; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	POP(_A_BUFF,_R3_BUFF);			//中断出栈保护恢复
swapa	0x11              		; 	swapa	_R3_BUFF                     	00000c 3611		
mov	0x3, a              		; 	mov	STATUS,a                       	00000d 3883		
swapa	0x10              		; 	swapa	_A_BUFF                      	00000e 3610		
;	.line	144; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	}
reti                    		; 	RETI	                              	00000f 3823		
;	.line	60; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	IAR = 0xAA;					//IAR赋值0xAA
dw	0x8aa  ;unknown opcode		; 	MOV	A,@0xaa                        	000010 08aa		
mov	0, a                		; 	MOV	_IAR,A                         	000011 3880		
;	.line	61; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	Temp = IAR;					//读IAR到Temp
mov	a, 0                		; 	MOV	A,_IAR                         	000012 3000		
mov	0x13, a             		; 	MOV	_Temp,A                        	000013 3893		
;	.line	63; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	TCC = 0xAA;					//TCC赋值0xAA
dw	0x8aa  ;unknown opcode		; 	MOV	A,@0xaa                        	000014 08aa		
mov	0x1, a              		; 	MOV	_TCC,A                         	000015 3881		
;	.line	64; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	Temp = TCC;					//读TCC到Temp
mov	a, 0x1              		; 	MOV	A,_TCC                         	000016 3001		
mov	0x13, a             		; 	MOV	_Temp,A                        	000017 3893		
;	.line	66; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	PCL = 0xAA;					//PCL赋值0xAA
dw	0x8aa  ;unknown opcode		; 	MOV	A,@0xaa                        	000018 08aa		
mov	0x2, a              		; 	MOV	_PCL,A                         	000019 3882		
;	.line	67; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	Temp = PCL;					//读PCL到Temp
mov	a, 0x2              		; 	MOV	A,_PCL                         	00001a 3002		
mov	0x13, a             		; 	MOV	_Temp,A                        	00001b 3893		
;	.line	69; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	STATUS = 0xAA;				//STATUS赋值0xAA
dw	0x8aa  ;unknown opcode		; 	MOV	A,@0xaa                        	00001c 08aa		
mov	0x3, a              		; 	MOV	_STATUS,A                      	00001d 3883		
;	.line	70; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	Temp = STATUS;				//读STATUS到Temp
mov	a, 0x3              		; 	MOV	A,_STATUS                      	00001e 3003		
mov	0x13, a             		; 	MOV	_Temp,A                        	00001f 3893		
;	.line	72; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	RSR = 0xAA;					//RSR赋值0xAA
dw	0x8aa  ;unknown opcode		; 	MOV	A,@0xaa                        	000020 08aa		
mov	0x4, a              		; 	MOV	_RSR,A                         	000021 3884		
;	.line	73; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	Temp = RSR;					//读RSR到Temp
mov	a, 0x4              		; 	MOV	A,_RSR                         	000022 3004		
mov	0x13, a             		; 	MOV	_Temp,A                        	000023 3893		
;	.line	75; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	PORT6 = 0xAA;				//PORT6赋值0xAA
dw	0x8aa  ;unknown opcode		; 	MOV	A,@0xaa                        	000024 08aa		
mov	0x6, a              		; 	MOV	_PORT6,A                       	000025 3886		
;	.line	76; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	Temp = PORT6;				//读PORT6到Temp
mov	a, 0x6              		; 	MOV	A,_PORT6                       	000026 3006		
mov	0x13, a             		; 	MOV	_Temp,A                        	000027 3893		
;	.line	78; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	PWMCON = 0xAA;				//PWMCON赋值0xAA
dw	0x8aa  ;unknown opcode		; 	MOV	A,@0xaa                        	000028 08aa		
mov	0x8, a              		; 	MOV	_PWMCON,A                      	000029 3888		
;	.line	79; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	Temp = PWMCON;				//读PWMCON到Temp
mov	a, 0x8              		; 	MOV	A,_PWMCON                      	00002a 3008		
mov	0x13, a             		; 	MOV	_Temp,A                        	00002b 3893		
;	.line	81; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	PRD = 0xAA;					//PRD赋值0xAA
dw	0x8aa  ;unknown opcode		; 	MOV	A,@0xaa                        	00002c 08aa		
mov	0x9, a              		; 	MOV	_PRD,A                         	00002d 3889		
;	.line	82; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	Temp = PRD;					//读PRD到Temp
mov	a, 0x9              		; 	MOV	A,_PRD                         	00002e 3009		
mov	0x13, a             		; 	MOV	_Temp,A                        	00002f 3893		
;	.line	84; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	PDC1 = 0xAA;				//PDC1赋值0xAA
dw	0x8aa  ;unknown opcode		; 	MOV	A,@0xaa                        	000030 08aa		
mov	0xa, a              		; 	MOV	_PDC1,A                        	000031 388a		
;	.line	85; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	Temp = PDC1;				//读PDC1到Temp
mov	a, 0xa              		; 	MOV	A,_PDC1                        	000032 300a		
mov	0x13, a             		; 	MOV	_Temp,A                        	000033 3893		
;	.line	87; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	PDC2 = 0xAA;				//PDC2赋值0xAA
dw	0x8aa  ;unknown opcode		; 	MOV	A,@0xaa                        	000034 08aa		
mov	0xb, a              		; 	MOV	_PDC2,A                        	000035 388b		
;	.line	88; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	Temp = PDC2;				//读PDC2到Temp
mov	a, 0xb              		; 	MOV	A,_PDC2                        	000036 300b		
mov	0x13, a             		; 	MOV	_Temp,A                        	000037 3893		
;	.line	90; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	PDC3 = 0xAA;				//PDC3赋值0xAA
dw	0x8aa  ;unknown opcode		; 	MOV	A,@0xaa                        	000038 08aa		
mov	0xc, a              		; 	MOV	_PDC3,A                        	000039 388c		
;	.line	91; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	Temp = PDC3;				//读PDC3到Temp
mov	a, 0xc              		; 	MOV	A,_PDC3                        	00003a 300c		
mov	0x13, a             		; 	MOV	_Temp,A                        	00003b 3893		
;	.line	93; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	ICIECR = 0xAA;				//ICIECR赋值0xAA
dw	0x8aa  ;unknown opcode		; 	MOV	A,@0xaa                        	00003c 08aa		
mov	0xd, a              		; 	MOV	_ICIECR,A                      	00003d 388d		
;	.line	94; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	Temp = ICIECR;				//读ICIECR到Temp
mov	a, 0xd              		; 	MOV	A,_ICIECR                      	00003e 300d		
mov	0x13, a             		; 	MOV	_Temp,A                        	00003f 3893		
;	.line	96; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	CPUCON = 0xAA;				//CPUCON赋值0xAA
dw	0x8aa  ;unknown opcode		; 	MOV	A,@0xaa                        	000040 08aa		
mov	0xe, a              		; 	MOV	_CPUCON,A                      	000041 388e		
;	.line	97; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	Temp = CPUCON;				//读CPUCON到Temp
mov	a, 0xe              		; 	MOV	A,_CPUCON                      	000042 300e		
mov	0x13, a             		; 	MOV	_Temp,A                        	000043 3893		
;	.line	99; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	ISR = 0xAA;					//ISR赋值0xAA
dw	0x8aa  ;unknown opcode		; 	MOV	A,@0xaa                        	000044 08aa		
mov	0xf, a              		; 	MOV	_ISR,A                         	000045 388f		
;	.line	100; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	Temp = ISR;					//读ISR到Temp
mov	a, 0xf              		; 	MOV	A,_ISR                         	000046 300f		
mov	0x13, a             		; 	MOV	_Temp,A                        	000047 3893		
;	.line	105; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	CONTW(0x08);				//CONT赋值0x08
mov	a, @0x8             		; 	mov	a,@0x08                        	000048 0808		
ctw                     		; 	ctw                                	000049 3802		
;	.line	107; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	IOCP_W(P6CR,0xAA);			//P6CR赋值0xAA
dw	0x8aa  ;unknown opcode		; 	mov	a,@0xAA                        	00004a 08aa		
iw	0x6                  		; 	iw	P6CR                            	00004b 3806		
;	.line	108; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	IOCP_R(_Temp,P6CR);			//读P6CR到Temp
ir	0x6                  		; 	ir	P6CR                            	00004c 3826		
mov	0x13, a             		; 	mov	_Temp,a                        	00004d 3893		
;	.line	110; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	IOCP_W(PHDCR,0xAA);			//PHDCR赋值0xAA
dw	0x8aa  ;unknown opcode		; 	mov	a,@0xAA                        	00004e 08aa		
iw	0x9                  		; 	iw	PHDCR                           	00004f 3809		
;	.line	111; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	IOCP_R(_Temp,PHDCR);		//读PHDCR到Temp
ir	0x9                  		; 	ir	PHDCR                           	000050 3829		
mov	0x13, a             		; 	mov	_Temp,a                        	000051 3893		
;	.line	113; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	IOCP_W(PDCR,0xAA);			//PDCR赋值0xAA
dw	0x8aa  ;unknown opcode		; 	mov	a,@0xAA                        	000052 08aa		
iw	0xb                  		; 	iw	PDCR                            	000053 380b		
;	.line	114; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	IOCP_R(_Temp,PDCR);			//读PDCR到Temp
ir	0xb                  		; 	ir	PDCR                            	000054 382b		
mov	0x13, a             		; 	mov	_Temp,a                        	000055 3893		
;	.line	116; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	IOCP_W(PHCR,0xAA);			//PHCR赋值0xAA
dw	0x8aa  ;unknown opcode		; 	mov	a,@0xAA                        	000056 08aa		
iw	0xd                  		; 	iw	PHCR                            	000057 380d		
;	.line	117; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	IOCP_R(_Temp,PHCR);			//读PHCR到Temp
ir	0xd                  		; 	ir	PHCR                            	000058 382d		
mov	0x13, a             		; 	mov	_Temp,a                        	000059 3893		
;	.line	119; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	IOCP_W(WDTCR,0xAA);			//WDTCR赋值0xAA
dw	0x8aa  ;unknown opcode		; 	mov	a,@0xAA                        	00005a 08aa		
iw	0xe                  		; 	iw	WDTCR                           	00005b 380e		
;	.line	120; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	IOCP_R(_Temp,WDTCR);		//读WDTCR到Temp
ir	0xe                  		; 	ir	WDTCR                           	00005c 382e		
mov	0x13, a             		; 	mov	_Temp,a                        	00005d 3893		
;	.line	122; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	IOCP_W(IMR,0xAA);			//IMR赋值0xAA
dw	0x8aa  ;unknown opcode		; 	mov	a,@0xAA                        	00005e 08aa		
iw	0xf                  		; 	iw	IMR                             	00005f 380f		
;	.line	123; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	IOCP_R(_Temp,IMR);			//读IMR到Temp
ir	0xf                  		; 	ir	IMR                             	000060 382f		
mov	0x13, a             		; 	mov	_Temp,a                        	000061 3893		
;	.line	125; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	IOCP_W_AND(P6CR,0X01);		//P6口与0x01给到P6口
ir	0x6                  		; 	ir	P6CR                            	000062 3826		
and	a, @0x1             		; 	and	a,@0X01                        	000063 0c01		
iw	0x6                  		; 	iw	P6CR                            	000064 3806		
;	.line	127; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	IOCP_W_OR(P6CR,0XFE);		//P6口或0xFE给到P6口
ir	0x6                  		; 	ir	P6CR                            	000065 3826		
dw	0xafe  ;unknown opcode		; 	or	a,@0XFE                         	000066 0afe		
iw	0x6                  		; 	iw	P6CR                            	000067 3806		
;	.line	129; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	P61_INPUT;					//位操作i/o
ir	0x6                  		; 	ir	PORT6                           	000068 3826		
or	a, @0x2              		; 	or	a,@0X02                         	000069 0a02		
iw	0x6                  		; 	iw	PORT6                           	00006a 3806		
;	.line	130; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	P61_OUTPUT;					//位操作i/o
ir	0x6                  		; 	ir	PORT6                           	00006b 3826		
dw	0xcfd  ;unknown opcode		; 	and	a,@0XFD                        	00006c 0cfd		
iw	0x6                  		; 	iw	PORT6                           	00006d 3806		
;	.line	131; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\所有寄存器读写示例_XC8P9520\ALLREG.C	}
ret                     		; 	RET	                               	00006e 3822		
