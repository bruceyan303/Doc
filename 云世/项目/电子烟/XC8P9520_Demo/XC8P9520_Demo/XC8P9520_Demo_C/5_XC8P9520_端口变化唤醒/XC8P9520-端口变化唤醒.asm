jmp	0xa4                		; 	jmp	_main                          	000000 10a4		
;	.line	62; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	__asm__("org 0x08");			//中断入口地址			
;	.line	63; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	PUSH(_A_BUFF,_R3_BUFF);			//中断入栈保护
mov	0x10, a             		; 	mov	_A_BUFF,a                      	000008 3890		
swap	0x10               		; 	swap	_A_BUFF                       	000009 3690		
swapa	0x3               		; 	swapa	STATUS                       	00000a 3603		
mov	0x11, a             		; 	mov	_R3_BUFF,a                     	00000b 3891		
;	.line	65; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	if(TCIF == 1)					//判断TCIF是否为1
clr	0x12                		; 	CLR	r0x1005                        	00000c 3992		
jbtc	0xf, 0             		; 	JBTC	_ISRbits,0                    	00000d 200f		
inc	0x12                		; 	INC	r0x1005                        	00000e 3292		
mov	a, 0x12             		; 	MOV	A,r0x1005                      	00000f 3012		
mov	0x13, a             		; 	MOV	r0x1006,A                      	000010 3893		
xor	a, @0x1             		; 	XOR	A,@0x01                        	000011 0e01		
jbts	0x3, 0x2           		; 	JBTS	STATUS,2                      	000012 2503		
jmp	0x26                		; 	JMP	_00121_DS_                     	000013 1026		
;	.line	67; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	TCC	  += 0x06;				//1/2 * 8 * (256-6) = 1000us	公式：1/IRC频率 * 预分频 * （256-初值）
mov	a, @0x6             		; 	MOV	A,@0x06                        	000014 0806		
add	0x1, a              		; 	ADD	_TCC,A                         	000015 3f81		
;	.line	68; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	ISR    = 0xfe;				//清TC0中断标志位
dw	0x8fe  ;unknown opcode		; 	MOV	A,@0xfe                        	000016 08fe		
mov	0xf, a              		; 	MOV	_ISR,A                         	000017 388f		
;	.line	69; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	io_ledOut = !io_ledOut;			//P61口翻转
clr	0x12                		; 	CLR	r0x1005                        	000018 3992		
jbtc	0x6, 0             		; 	JBTC	_PORT6bits,0                  	000019 2006		
inc	0x12                		; 	INC	r0x1005                        	00001a 3292		
mov	a, 0x12             		; 	MOV	A,r0x1005                      	00001b 3012		
mov	a, @0               		; 	MOV	A,@0x00                        	00001c 0800		
jbtc	0x3, 0x2           		; 	JBTC	STATUS,2                      	00001d 2103		
mov	a, @0x1             		; 	MOV	A,@0x01                        	00001e 0801		
mov	0x12, a             		; 	MOV	r0x1005,A                      	00001f 3892		
mov	0x13, a             		; 	MOV	r0x1006,A                      	000020 3893		
rca	0x12                		; 	RCA	r0x1005                        	000021 3412		
jbts	0x3, 0             		; 	JBTS	STATUS,0                      	000022 2403		
btc	0x6, 0              		; 	BTC	_PORT6bits,0                   	000023 2806		
jbtc	0x3, 0             		; 	JBTC	STATUS,0                      	000024 2003		
bts	0x6, 0              		; 	BTS	_PORT6bits,0                   	000025 2c06		
;	.line	72; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	POP(_A_BUFF,_R3_BUFF);			//中断出栈保护恢复
swapa	0x11              		; 	swapa	_R3_BUFF                     	000026 3611		
mov	0x3, a              		; 	mov	STATUS,a                       	000027 3883		
swapa	0x10              		; 	swapa	_A_BUFF                      	000028 3610		
;	.line	73; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	}
reti                    		; 	RETI	                              	000029 3823		
;	.line	164; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	file_clrRam();					//清RAM
call	0xb0               		; 	CALL	_file_clrRam                  	0000a4 18b0		
;	.line	165; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	file_init();					//io寄存器初始化
call	0x91               		; 	CALL	_file_init                    	0000a5 1891		
;	.line	166; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	file_project_init();			//程序所需功能设置
call	0x1                		; 	CALL	_file_project_init            	0000a6 1801		
;	.line	167; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	EI();							//打开总中断
ei                      		; 	ei	                                	0000a7 3820		
;	.line	172; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	file_scanKey();
call	0x55               		; 	CALL	_file_scanKey                 	0000a8 1855		
;	.line	173; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	file_keyDeal();
call	0x76               		; 	CALL	_file_keyDeal                 	0000a9 1876		
;	.line	174; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	file_sleep();
call	0x2a               		; 	CALL	_file_sleep                   	0000aa 182a		
;	.line	175; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	NOP();
nop                     		; 	nop	                               	0000ab 3800		
;	.line	176; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	NOP();
nop                     		; 	nop	                               	0000ac 3800		
;	.line	177; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	NOP();
nop                     		; 	nop	                               	0000ad 3800		
jmp	0xa8                		; 	JMP	_00166_DS_                     	0000ae 10a8		
;	.line	179; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	}
ret                     		; 	RET	                               	0000af 3822		
;	.line	126; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	if((io_key==1)&&(bit_keyPress==0))
clr	0x14                		; 	CLR	r0x1003                        	00002a 3994		
jbtc	0x6, 0x3           		; 	JBTC	_PORT6bits,3                  	00002b 2186		
inc	0x14                		; 	INC	r0x1003                        	00002c 3294		
mov	a, 0x14             		; 	MOV	A,r0x1003                      	00002d 3014		
xor	a, @0x1             		; 	XOR	A,@0x01                        	00002e 0e01		
jbts	0x3, 0x2           		; 	JBTS	STATUS,2                      	00002f 2503		
jmp	0x53                		; 	JMP	_00157_DS_                     	000030 1053		
jbtc	0x18, 0x1          		; 	JBTC	_flag_mode,1                  	000031 2098		
jmp	0x53                		; 	JMP	_00157_DS_                     	000032 1053		
;	.line	128; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	reg_sleep_cnt++;
inc	0x17                		; 	INC	_reg_sleep_cnt                 	000033 3297		
;	.line	129; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	if(reg_sleep_cnt>=100) //50ms
mov	a, @0x64            		; 	MOV	A,@0x64                        	000034 0864		
sub	a, 0x17             		; 	SUB	A,_reg_sleep_cnt               	000035 3a17		
jbts	0x3, 0             		; 	JBTS	STATUS,0                      	000036 2403		
jmp	0x54                		; 	JMP	_00160_DS_                     	000037 1054		
;	.line	131; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	reg_sleep_cnt=0;
clr	0x17                		; 	CLR	_reg_sleep_cnt                 	000038 3997		
;	.line	132; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	ICIECR=0X08;		//P63端口独立唤醒
mov	a, @0x8             		; 	MOV	A,@0x08                        	000039 0808		
mov	0xd, a              		; 	MOV	_ICIECR,A                      	00003a 388d		
;	.line	133; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	TCC=0;
clr	0x1                 		; 	CLR	_TCC                           	00003b 3981		
;	.line	135; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	IOCP_W(WDTCR,0x00);	
mov	a, @0               		; 	mov	a,@0x00                        	00003c 0800		
iw	0xe                  		; 	iw	WDTCR                           	00003d 380e		
;	.line	136; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	ISR	=0;
clr	0xf                 		; 	CLR	_ISR                           	00003e 398f		
;	.line	137; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	DI();				//禁止唤醒进入中断
di                      		; 	di	                                	00003f 3821		
;	.line	138; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	IOCP_W(IMR,0x02);
mov	a, @0x2             		; 	mov	a,@0x02                        	000040 0802		
iw	0xf                  		; 	iw	IMR                             	000041 380f		
;	.line	139; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	SLEEP();
sleep                   		; 	sleep	                             	000042 3803		
;	.line	140; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	NOP(); 
nop                     		; 	nop	                               	000043 3800		
;	.line	141; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	NOP();
nop                     		; 	nop	                               	000044 3800		
;	.line	142; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	NOP();
nop                     		; 	nop	                               	000045 3800		
;	.line	143; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	NOP();
nop                     		; 	nop	                               	000046 3800		
;	.line	144; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	CWDT();
cwdt                    		; 	CWDT	                              	000047 3804		
;	.line	146; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	CONTW(0x02);
mov	a, @0x2             		; 	mov	a,@0x02                        	000048 0802		
ctw                     		; 	ctw                                	000049 3802		
;	.line	147; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	IOCP_W(WDTCR,0x00);
mov	a, @0               		; 	mov	a,@0x00                        	00004a 0800		
iw	0xe                  		; 	iw	WDTCR                           	00004b 380e		
;	.line	148; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	IOCP_W(IMR,0x01);
mov	a, @0x1             		; 	mov	a,@0x01                        	00004c 0801		
iw	0xf                  		; 	iw	IMR                             	00004d 380f		
;	.line	149; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	TCC = data_tcc;
mov	a, @0x6             		; 	MOV	A,@0x06                        	00004e 0806		
mov	0x1, a              		; 	MOV	_TCC,A                         	00004f 3881		
;	.line	150; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	EI();
ei                      		; 	ei	                                	000050 3820		
;	.line	151; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	ISR=0;
clr	0xf                 		; 	CLR	_ISR                           	000051 398f		
jmp	0x54                		; 	JMP	_00160_DS_                     	000052 1054		
;	.line	156; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	reg_sleep_cnt=0;
clr	0x17                		; 	CLR	_reg_sleep_cnt                 	000053 3997		
;	.line	158; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	}
ret                     		; 	RET	                               	000054 3822		
;	.line	98; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	if(bit_keyPress==1)
clr	0x14                		; 	CLR	r0x1003                        	000076 3994		
jbtc	0x18, 0x1          		; 	JBTC	_flag_mode,1                  	000077 2098		
inc	0x14                		; 	INC	r0x1003                        	000078 3294		
mov	a, 0x14             		; 	MOV	A,r0x1003                      	000079 3014		
mov	0x15, a             		; 	MOV	r0x1004,A                      	00007a 3895		
xor	a, @0x1             		; 	XOR	A,@0x01                        	00007b 0e01		
jbts	0x3, 0x2           		; 	JBTS	STATUS,2                      	00007c 2503		
jmp	0x8f                		; 	JMP	_00147_DS_                     	00007d 108f		
;	.line	100; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	if(bit_keyPress_deal==0) //按键未处理
jbtc	0x18, 0x2          		; 	JBTC	_flag_mode,2                  	00007e 2118		
jmp	0x90                		; 	JMP	_00149_DS_                     	00007f 1090		
;	.line	102; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	bit_keyPress_deal=1;
bts	0x18, 0x2           		; 	BTS	_flag_mode,2                   	000080 2d18		
;	.line	103; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	if(bit_modeOpen==1)
clr	0x14                		; 	CLR	r0x1003                        	000081 3994		
jbtc	0x18, 0            		; 	JBTC	_flag_mode,0                  	000082 2018		
inc	0x14                		; 	INC	r0x1003                        	000083 3294		
mov	a, 0x14             		; 	MOV	A,r0x1003                      	000084 3014		
mov	0x15, a             		; 	MOV	r0x1004,A                      	000085 3895		
xor	a, @0x1             		; 	XOR	A,@0x01                        	000086 0e01		
jbts	0x3, 0x2           		; 	JBTS	STATUS,2                      	000087 2503		
jmp	0x8c                		; 	JMP	_00142_DS_                     	000088 108c		
;	.line	105; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	bit_modeOpen=0;
btc	0x18, 0             		; 	BTC	_flag_mode,0                   	000089 2818		
;	.line	106; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	io_led2Out=0;
btc	0x6, 0x1            		; 	BTC	_PORT6bits,1                   	00008a 2886		
jmp	0x90                		; 	JMP	_00149_DS_                     	00008b 1090		
;	.line	110; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	bit_modeOpen=1;
bts	0x18, 0             		; 	BTS	_flag_mode,0                   	00008c 2c18		
;	.line	111; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	io_led2Out=1;			
bts	0x6, 0x1            		; 	BTS	_PORT6bits,1                   	00008d 2c86		
jmp	0x90                		; 	JMP	_00149_DS_                     	00008e 1090		
;	.line	117; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	bit_keyPress_deal=0;
btc	0x18, 0x2           		; 	BTC	_flag_mode,2                   	00008f 2918		
;	.line	120; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	}
ret                     		; 	RET	                               	000090 3822		
;	.line	77; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	if(((io_key==1)&&(bit_keyPress==0))||((io_key==0)&&(bit_keyPress==1)))
clr	0x14                		; 	CLR	r0x1003                        	000055 3994		
jbtc	0x6, 0x3           		; 	JBTC	_PORT6bits,3                  	000056 2186		
inc	0x14                		; 	INC	r0x1003                        	000057 3294		
mov	a, 0x14             		; 	MOV	A,r0x1003                      	000058 3014		
mov	0x15, a             		; 	MOV	r0x1004,A                      	000059 3895		
xor	a, @0x1             		; 	XOR	A,@0x01                        	00005a 0e01		
jbts	0x3, 0x2           		; 	JBTS	STATUS,2                      	00005b 2503		
jmp	0x5f                		; 	JMP	_00130_DS_                     	00005c 105f		
jbts	0x18, 0x1          		; 	JBTS	_flag_mode,1                  	00005d 2498		
jmp	0x69                		; 	JMP	_00126_DS_                     	00005e 1069		
jbtc	0x6, 0x3           		; 	JBTC	_PORT6bits,3                  	00005f 2186		
jmp	0x6a                		; 	JMP	_00127_DS_                     	000060 106a		
clr	0x14                		; 	CLR	r0x1003                        	000061 3994		
jbtc	0x18, 0x1          		; 	JBTC	_flag_mode,1                  	000062 2098		
inc	0x14                		; 	INC	r0x1003                        	000063 3294		
mov	a, 0x14             		; 	MOV	A,r0x1003                      	000064 3014		
mov	0x15, a             		; 	MOV	r0x1004,A                      	000065 3895		
xor	a, @0x1             		; 	XOR	A,@0x01                        	000066 0e01		
jbts	0x3, 0x2           		; 	JBTS	STATUS,2                      	000067 2503		
jmp	0x6a                		; 	JMP	_00127_DS_                     	000068 106a		
;	.line	79; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	reg_keyCont=0;
clr	0x16                		; 	CLR	_reg_keyCont                   	000069 3996		
;	.line	81; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	if(++reg_keyCont>=10)
inc	0x16                		; 	INC	_reg_keyCont                   	00006a 3296		
mov	a, @0xa             		; 	MOV	A,@0x0a                        	00006b 080a		
sub	a, 0x16             		; 	SUB	A,_reg_keyCont                 	00006c 3a16		
jbts	0x3, 0             		; 	JBTS	STATUS,0                      	00006d 2403		
jmp	0x75                		; 	JMP	_00136_DS_                     	00006e 1075		
;	.line	83; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	reg_keyCont=0;			//;滤波结束
clr	0x16                		; 	CLR	_reg_keyCont                   	00006f 3996		
;	.line	84; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	if(io_key==0)
jbtc	0x6, 0x3           		; 	JBTC	_PORT6bits,3                  	000070 2186		
jmp	0x74                		; 	JMP	_00132_DS_                     	000071 1074		
;	.line	86; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	bit_keyPress=1;		//;置按键按下标志位
bts	0x18, 0x1           		; 	BTS	_flag_mode,1                   	000072 2c98		
jmp	0x75                		; 	JMP	_00136_DS_                     	000073 1075		
;	.line	89; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	bit_keyPress=0;		//;清按键按下标志位	    
btc	0x18, 0x1           		; 	BTC	_flag_mode,1                   	000074 2898		
;	.line	91; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	}
ret                     		; 	RET	                               	000075 3822		
;	.line	56; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	}
;	.line	56; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	}
ret                     		; 	RET	                               	000001 3822		
;	.line	40; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	CONTW(0x02);			//TCC 8分频
mov	a, @0x2             		; 	mov	a,@0x02                        	000091 0802		
ctw                     		; 	ctw                                	000092 3802		
;	.line	41; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	TCC = data_tcc;			//1/2 * 8 * (256-6) = 1000us	公式：1/IRC频率 * 预分频 * （256-初值）
mov	a, @0x6             		; 	MOV	A,@0x06                        	000093 0806		
mov	0x1, a              		; 	MOV	_TCC,A                         	000094 3881		
;	.line	42; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	PORT6 = 0;				//P6口输出低
clr	0x6                 		; 	CLR	_PORT6                         	000095 3986		
;	.line	43; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	IOCP_W(P6CR,0x08);		//P6口设为输出
mov	a, @0x8             		; 	mov	a,@0x08                        	000096 0808		
iw	0x6                  		; 	iw	P6CR                            	000097 3806		
;	.line	44; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	IOCP_W(PHDCR,0xff);		//端口上下拉控制寄存器，bit7-bit4对应P67-P64下拉;bit3-bit0对应P53-P50上拉 
dw	0x8ff  ;unknown opcode		; 	mov	a,@0xff                        	000098 08ff		
iw	0x9                  		; 	iw	PHDCR                           	000099 3809		
;	.line	45; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	IOCP_W(PDCR,0xff);		//端口下拉控制寄存器，  bit6-bit4对应P62-P60,bit3-bit0对应P53-P50
dw	0x8ff  ;unknown opcode		; 	mov	a,@0xff                        	00009a 08ff		
iw	0xb                  		; 	iw	PDCR                            	00009b 380b		
;	.line	46; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	IOCP_W(PHCR,0xff);		//P6端口上拉控制寄存器  bit7-bit0对应P67-P60
dw	0x8ff  ;unknown opcode		; 	mov	a,@0xff                        	00009c 08ff		
iw	0xd                  		; 	iw	PHCR                            	00009d 380d		
;	.line	47; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	IOCP_W(WDTCR,0x00);		//WDT 使能控制寄存器
mov	a, @0               		; 	mov	a,@0x00                        	00009e 0800		
iw	0xe                  		; 	iw	WDTCR                           	00009f 380e		
;	.line	48; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	IOCP_W(IMR,0x01);		//中断使能控制寄存器 
mov	a, @0x1             		; 	mov	a,@0x01                        	0000a0 0801		
iw	0xf                  		; 	iw	IMR                             	0000a1 380f		
;	.line	49; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	ISR = 0x0;				//清TC0中断标志位 
clr	0xf                 		; 	CLR	_ISR                           	0000a2 398f		
;	.line	50; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	}
ret                     		; 	RET	                               	0000a3 3822		
;	.line	30; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	for(RSR=0x90;RSR<0xFF;RSR++)	//清零 BANK0 RAM  IAR-R0,RSR-R4
dw	0x890  ;unknown opcode		; 	MOV	A,@0x90                        	0000b0 0890		
mov	0x4, a              		; 	MOV	_RSR,A                         	0000b1 3884		
dw	0x8ff  ;unknown opcode		; 	MOV	A,@0xff                        	0000b2 08ff		
sub	a, 0x4              		; 	SUB	A,_RSR                         	0000b3 3a04		
jbtc	0x3, 0             		; 	JBTC	STATUS,0                      	0000b4 2003		
jmp	0xb9                		; 	JMP	_00105_DS_                     	0000b5 10b9		
;	.line	32; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	{IAR = 0;}
clr	0                   		; 	CLR	_IAR                           	0000b6 3980		
;	.line	30; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	for(RSR=0x90;RSR<0xFF;RSR++)	//清零 BANK0 RAM  IAR-R0,RSR-R4
inc	0x4                 		; 	INC	_RSR                           	0000b7 3284		
jmp	0xb2                		; 	JMP	_00107_DS_                     	0000b8 10b2		
;	.line	33; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	IAR = 0;
clr	0                   		; 	CLR	_IAR                           	0000b9 3980		
;	.line	34; E:\00矽杰单片机DEMO\XC8P9520_DEMO\XC8P9520_DEMO_C\5_XC8P9520_端口变化唤醒\XC8P9520-端口变化唤醒.C	}
ret                     		; 	RET	                               	0000ba 3822		
