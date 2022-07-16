jmp	0x73                		; 	jmp	_main                          	000000 1073		
;	.line	60; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	__asm__("org 0x08");			//中断入口地址			
;	.line	61; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	PUSH(_A_BUFF,_R3_BUFF);			//中断入栈保护
mov	0x10, a             		; 	mov	_A_BUFF,a                      	000008 3890		
swap	0x10               		; 	swap	_A_BUFF                       	000009 3690		
swapa	0x3               		; 	swapa	STATUS                       	00000a 3603		
mov	0x11, a             		; 	mov	_R3_BUFF,a                     	00000b 3891		
;	.line	63; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	if(TCIF)					//判断TCIF是否为1
jbts	0xf, 0             		; 	JBTS	_ISRbits,0                    	00000c 240f		
jmp	0x12                		; 	JMP	_00121_DS_                     	00000d 1012		
;	.line	65; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	TCC	  += 0x06;				//1/2 * 8 * (256-6) = 1000us	公式：1/IRC频率 * 预分频 * （256-初值）
mov	a, @0x6             		; 	MOV	A,@0x06                        	00000e 0806		
add	0x1, a              		; 	ADD	_TCC,A                         	00000f 3f81		
;	.line	66; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	ISR    = 0xfe;				//清TC0中断标志位
dw	0x8fe  ;unknown opcode		; 	MOV	A,@0xfe                        	000010 08fe		
mov	0xf, a              		; 	MOV	_ISR,A                         	000011 388f		
;	.line	70; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	POP(_A_BUFF,_R3_BUFF);			//中断出栈保护恢复
swapa	0x11              		; 	swapa	_R3_BUFF                     	000012 3611		
mov	0x3, a              		; 	mov	STATUS,a                       	000013 3883		
swapa	0x10              		; 	swapa	_A_BUFF                      	000014 3610		
;	.line	71; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	}
reti                    		; 	RETI	                              	000015 3823		
;	.line	163; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	file_clrRam();					//清RAM
call	0x7f               		; 	CALL	_file_clrRam                  	000073 187f		
;	.line	164; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	file_init();					//io寄存器初始化
call	0x51               		; 	CALL	_file_init                    	000074 1851		
;	.line	165; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	file_project_init();			//程序所需功能设置
call	0x1                		; 	CALL	_file_project_init            	000075 1801		
;	.line	166; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	EI();							//打开总中断
ei                      		; 	ei	                                	000076 3820		
;	.line	171; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	file_scanKey();
call	0x3c               		; 	CALL	_file_scanKey                 	000077 183c		
;	.line	172; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	file_keyDeal();
call	0x64               		; 	CALL	_file_keyDeal                 	000078 1864		
;	.line	173; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	file_sleep();
call	0x16               		; 	CALL	_file_sleep                   	000079 1816		
;	.line	174; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	NOP();
nop                     		; 	nop	                               	00007a 3800		
;	.line	175; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	NOP();
nop                     		; 	nop	                               	00007b 3800		
;	.line	176; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	NOP();
nop                     		; 	nop	                               	00007c 3800		
jmp	0x77                		; 	JMP	_00166_DS_                     	00007d 1077		
;	.line	178; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	}
ret                     		; 	RET	                               	00007e 3822		
;	.line	125; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	if((io_key)&&(!bit_keyPress))
jbts	0x6, 0x3           		; 	JBTS	_PORT6bits,3                  	000016 2586		
jmp	0x3a                		; 	JMP	_00157_DS_                     	000017 103a		
jbtc	0x14, 0x3          		; 	JBTC	_flag_mode,3                  	000018 2194		
jmp	0x3a                		; 	JMP	_00157_DS_                     	000019 103a		
;	.line	127; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	reg_sleep_cnt++;
inc	0x13                		; 	INC	_reg_sleep_cnt                 	00001a 3293		
;	.line	128; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	if(reg_sleep_cnt>=100) //50ms
mov	a, @0x64            		; 	MOV	A,@0x64                        	00001b 0864		
sub	a, 0x13             		; 	SUB	A,_reg_sleep_cnt               	00001c 3a13		
jbts	0x3, 0             		; 	JBTS	STATUS,0                      	00001d 2403		
jmp	0x3b                		; 	JMP	_00160_DS_                     	00001e 103b		
;	.line	130; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	reg_sleep_cnt=0;
clr	0x13                		; 	CLR	_reg_sleep_cnt                 	00001f 3993		
;	.line	131; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	ICIECR=0X08;		//P63端口独立唤醒 //当 OPTION 选项【 P6 端口唤醒】 为【独立控制（寄存器为 0x0D）】 时有效
mov	a, @0x8             		; 	MOV	A,@0x08                        	000020 0808		
mov	0xd, a              		; 	MOV	_ICIECR,A                      	000021 388d		
;	.line	132; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	TCC=0;
clr	0x1                 		; 	CLR	_TCC                           	000022 3981		
;	.line	134; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	IOCP_W(WDTCR,0x00);	
mov	a, @0               		; 	mov	a,@0x00                        	000023 0800		
iw	0xe                  		; 	iw	WDTCR                           	000024 380e		
;	.line	135; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	ISR	=0;
clr	0xf                 		; 	CLR	_ISR                           	000025 398f		
;	.line	136; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	DI();				//禁止唤醒进入中断
di                      		; 	di	                                	000026 3821		
;	.line	137; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	IOCP_W(IMR,0x02);
mov	a, @0x2             		; 	mov	a,@0x02                        	000027 0802		
iw	0xf                  		; 	iw	IMR                             	000028 380f		
;	.line	138; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	SLEEP();
sleep                   		; 	sleep	                             	000029 3803		
;	.line	139; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	NOP(); 
nop                     		; 	nop	                               	00002a 3800		
;	.line	140; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	NOP();
nop                     		; 	nop	                               	00002b 3800		
;	.line	141; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	NOP();
nop                     		; 	nop	                               	00002c 3800		
;	.line	142; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	NOP();
nop                     		; 	nop	                               	00002d 3800		
;	.line	143; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	CWDT();
cwdt                    		; 	CWDT	                              	00002e 3804		
;	.line	145; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	CONTW(0x02);
mov	a, @0x2             		; 	mov	a,@0x02                        	00002f 0802		
ctw                     		; 	ctw                                	000030 3802		
;	.line	146; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	IOCP_W(WDTCR,0x00);
mov	a, @0               		; 	mov	a,@0x00                        	000031 0800		
iw	0xe                  		; 	iw	WDTCR                           	000032 380e		
;	.line	147; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	IOCP_W(IMR,0x01);
mov	a, @0x1             		; 	mov	a,@0x01                        	000033 0801		
iw	0xf                  		; 	iw	IMR                             	000034 380f		
;	.line	148; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	TCC = data_tcc;
mov	a, @0x6             		; 	MOV	A,@0x06                        	000035 0806		
mov	0x1, a              		; 	MOV	_TCC,A                         	000036 3881		
;	.line	149; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	EI();
ei                      		; 	ei	                                	000037 3820		
;	.line	150; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	ISR=0;
clr	0xf                 		; 	CLR	_ISR                           	000038 398f		
jmp	0x3b                		; 	JMP	_00160_DS_                     	000039 103b		
;	.line	155; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	reg_sleep_cnt=0;
clr	0x13                		; 	CLR	_reg_sleep_cnt                 	00003a 3993		
;	.line	157; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	}
ret                     		; 	RET	                               	00003b 3822		
;	.line	96; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	if(bit_keyPress)
jbts	0x14, 0x3          		; 	JBTS	_flag_mode,3                  	000064 2594		
jmp	0x71                		; 	JMP	_00147_DS_                     	000065 1071		
;	.line	98; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	if(!bit_keyPress_deal) //按键未处理
jbtc	0x14, 0x4          		; 	JBTC	_flag_mode,4                  	000066 2214		
jmp	0x72                		; 	JMP	_00149_DS_                     	000067 1072		
;	.line	100; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	bit_keyPress_deal=1;
bts	0x14, 0x4           		; 	BTS	_flag_mode,4                   	000068 2e14		
;	.line	101; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	if(bit_modeOpen)
jbts	0x14, 0            		; 	JBTS	_flag_mode,0                  	000069 2414		
jmp	0x6e                		; 	JMP	_00142_DS_                     	00006a 106e		
;	.line	103; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	bit_modeOpen=0;
btc	0x14, 0             		; 	BTC	_flag_mode,0                   	00006b 2814		
;	.line	104; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	io_led2Out=0;
btc	0x6, 0x1            		; 	BTC	_PORT6bits,1                   	00006c 2886		
jmp	0x72                		; 	JMP	_00149_DS_                     	00006d 1072		
;	.line	108; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	bit_modeOpen=1;
bts	0x14, 0             		; 	BTS	_flag_mode,0                   	00006e 2c14		
;	.line	109; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	io_led2Out=1;			
bts	0x6, 0x1            		; 	BTS	_PORT6bits,1                   	00006f 2c86		
jmp	0x72                		; 	JMP	_00149_DS_                     	000070 1072		
;	.line	116; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	bit_keyPress_deal=0;
btc	0x14, 0x4           		; 	BTC	_flag_mode,4                   	000071 2a14		
;	.line	119; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	}
ret                     		; 	RET	                               	000072 3822		
;	.line	75; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	if(((io_key)&&(!bit_keyPress))||((!io_key)&&(bit_keyPress)))
jbts	0x6, 0x3           		; 	JBTS	_PORT6bits,3                  	00003c 2586		
jmp	0x40                		; 	JMP	_00130_DS_                     	00003d 1040		
jbts	0x14, 0x3          		; 	JBTS	_flag_mode,3                  	00003e 2594		
jmp	0x44                		; 	JMP	_00126_DS_                     	00003f 1044		
jbtc	0x6, 0x3           		; 	JBTC	_PORT6bits,3                  	000040 2186		
jmp	0x45                		; 	JMP	_00127_DS_                     	000041 1045		
jbts	0x14, 0x3          		; 	JBTS	_flag_mode,3                  	000042 2594		
jmp	0x45                		; 	JMP	_00127_DS_                     	000043 1045		
;	.line	77; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	reg_keyCont=0;
clr	0x12                		; 	CLR	_reg_keyCont                   	000044 3992		
;	.line	79; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	if(++reg_keyCont>=10)
inc	0x12                		; 	INC	_reg_keyCont                   	000045 3292		
mov	a, @0xa             		; 	MOV	A,@0x0a                        	000046 080a		
sub	a, 0x12             		; 	SUB	A,_reg_keyCont                 	000047 3a12		
jbts	0x3, 0             		; 	JBTS	STATUS,0                      	000048 2403		
jmp	0x50                		; 	JMP	_00136_DS_                     	000049 1050		
;	.line	81; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	reg_keyCont=0;			//;滤波结束
clr	0x12                		; 	CLR	_reg_keyCont                   	00004a 3992		
;	.line	82; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	if(io_key==0)
jbtc	0x6, 0x3           		; 	JBTC	_PORT6bits,3                  	00004b 2186		
jmp	0x4f                		; 	JMP	_00132_DS_                     	00004c 104f		
;	.line	84; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	bit_keyPress=1;		//;置按键按下标志位
bts	0x14, 0x3           		; 	BTS	_flag_mode,3                   	00004d 2d94		
jmp	0x50                		; 	JMP	_00136_DS_                     	00004e 1050		
;	.line	87; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	bit_keyPress=0;		//;清按键按下标志位	    
btc	0x14, 0x3           		; 	BTC	_flag_mode,3                   	00004f 2994		
;	.line	89; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	}
ret                     		; 	RET	                               	000050 3822		
;	.line	54; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	}
;	.line	54; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	}
ret                     		; 	RET	                               	000001 3822		
;	.line	38; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	CONTW(0x02);			//TCC 8分频
mov	a, @0x2             		; 	mov	a,@0x02                        	000051 0802		
ctw                     		; 	ctw                                	000052 3802		
;	.line	39; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	TCC = data_tcc;			//1/2 * 8 * (256-6) = 1000us	公式：1/IRC频率 * 预分频 * （256-初值）
mov	a, @0x6             		; 	MOV	A,@0x06                        	000053 0806		
mov	0x1, a              		; 	MOV	_TCC,A                         	000054 3881		
;	.line	40; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	PORT6 = 0;				//P6口输出低
clr	0x6                 		; 	CLR	_PORT6                         	000055 3986		
;	.line	41; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	IOCP_W(P6CR,0x08);		//P6口设为输出
mov	a, @0x8             		; 	mov	a,@0x08                        	000056 0808		
iw	0x6                  		; 	iw	P6CR                            	000057 3806		
;	.line	42; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	IOCP_W(PHDCR,0xff);		//端口上下拉控制寄存器，bit7-bit4对应P67-P64下拉;bit3-bit0对应P53-P50上拉 
dw	0x8ff  ;unknown opcode		; 	mov	a,@0xff                        	000058 08ff		
iw	0x9                  		; 	iw	PHDCR                           	000059 3809		
;	.line	43; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	IOCP_W(PDCR,0xff);		//端口下拉控制寄存器，  bit6-bit4对应P62-P60,bit3-bit0对应P53-P50
dw	0x8ff  ;unknown opcode		; 	mov	a,@0xff                        	00005a 08ff		
iw	0xb                  		; 	iw	PDCR                            	00005b 380b		
;	.line	44; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	IOCP_W(PHCR,0xff);		//P6端口上拉控制寄存器  bit7-bit0对应P67-P60
dw	0x8ff  ;unknown opcode		; 	mov	a,@0xff                        	00005c 08ff		
iw	0xd                  		; 	iw	PHCR                            	00005d 380d		
;	.line	45; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	IOCP_W(WDTCR,0x00);		//WDT 使能控制寄存器
mov	a, @0               		; 	mov	a,@0x00                        	00005e 0800		
iw	0xe                  		; 	iw	WDTCR                           	00005f 380e		
;	.line	46; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	IOCP_W(IMR,0x01);		//中断使能控制寄存器 
mov	a, @0x1             		; 	mov	a,@0x01                        	000060 0801		
iw	0xf                  		; 	iw	IMR                             	000061 380f		
;	.line	47; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	ISR = 0x0;				//清TC0中断标志位 
clr	0xf                 		; 	CLR	_ISR                           	000062 398f		
;	.line	48; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	}
ret                     		; 	RET	                               	000063 3822		
;	.line	29; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	for(RSR=0x90;RSR<0xFF;RSR++)	//清零 BANK0 RAM  IAR-R0,RSR-R4
dw	0x890  ;unknown opcode		; 	MOV	A,@0x90                        	00007f 0890		
mov	0x4, a              		; 	MOV	_RSR,A                         	000080 3884		
dw	0x8ff  ;unknown opcode		; 	MOV	A,@0xff                        	000081 08ff		
sub	a, 0x4              		; 	SUB	A,_RSR                         	000082 3a04		
jbtc	0x3, 0             		; 	JBTC	STATUS,0                      	000083 2003		
jmp	0x88                		; 	JMP	_00105_DS_                     	000084 1088		
;	.line	30; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	{IAR = 0;}
clr	0                   		; 	CLR	_IAR                           	000085 3980		
;	.line	29; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	for(RSR=0x90;RSR<0xFF;RSR++)	//清零 BANK0 RAM  IAR-R0,RSR-R4
inc	0x4                 		; 	INC	_RSR                           	000086 3284		
jmp	0x81                		; 	JMP	_00107_DS_                     	000087 1081		
;	.line	31; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	IAR = 0;
clr	0                   		; 	CLR	_IAR                           	000088 3980		
;	.line	32; E:\360安全云盘-同步版\00矽杰单片机DEMO\XC8P8600_DEMO\XC8P8600_DEMO_C\5_XC8P8600_端口变化唤醒\XC8P8600-端口变化唤醒.C	}
ret                     		; 	RET	                               	000089 3822		
