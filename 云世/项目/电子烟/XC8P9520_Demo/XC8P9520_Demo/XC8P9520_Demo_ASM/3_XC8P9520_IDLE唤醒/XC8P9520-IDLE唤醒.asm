//*******************************************免责声明*******************************************//
/*无锡矽杰微电子有限公司（简称：无锡矽杰微）保留关于该例程可靠性、功能和设计方面的改进作进一步说明的权利。
由于使用本例程中的信息或内容而导致的直接，间接，特别附带结果的损害，无锡矽杰微没有义务负责。
本例程中代码的应用仅仅是用来做功能演示，本公司不保证这些代码没有更深入的测试就能适用。
本例程中使用的软件，都是依据授权或保密合约所合法提供的，并且只能在这些合约的许可条件下使用或者复制。
无锡矽杰微的产品不是专门设计来应用于生命维持的用具，装置或者系统。无锡矽杰微的产品不支持而且禁止在这些方面的应用。
本例程内容如有变动恕不另作通知，具体更新信息，请参考公司官方网站www.xjmcu.com。*/
//===================================================================================//
//主频：8M/4T 
;------------------------------------------------------------------
;低速模式的频率和电压的关系
;低速模式下,T1/PWM唤醒IDEL，
;T1/PWM定时唤醒时间=PRD*T1预分频*(1/低速RC时钟)=255*2*(1/低速RC时钟) f=(255*2)/时间
;5.0V,RC频率接近12.83k,Sleep:397.4ms+work1.5us,功耗5.9uA;
;4.5V,RC频率接近11.49k,Sleep:443.8ms+work1.5us,功耗5.0uA; 
;4.0V,RC频率接近10.08k,Sleep:505.6ms+work1.5us,功耗4.2uA; 
;3.5V,RC频率接近 8.62k,Sleep:591.9ms+work1.5us,功耗3.6uA;
;3.0V,RC频率接近 7.08k,Sleep:720.0ms+work1.5us,功耗3.0uA;
;-----------------------------------------------------------------
;低速模式下,TCC唤醒IDEL，
;TCC定时唤醒时间=TCC*TCC分频*(1/低速RC时钟)=256*2*(1/低速RC时钟) f=(256*2)/时间
;5.0V,RC频率接近12.22k,Sleep:419.0ms+work1us,功耗7.5-7.6uA 
;4.5V,RC频率接近10.95k,Sleep:467.6ms+work1us,功耗6.1-6.2uA; 
;4.0V,RC频率接近 9.62k,Sleep:532.0ms+work1us,功耗4.9-5.0uA; 
;3.5V,RC频率接近 8.23k,Sleep:622.0ms+work1us,功耗3.8-3.9uA;
;3.0V,RC频率接近 6.78k,Sleep:755.0ms+work1us,功耗2.9-3.0uA;
;注:sleep时间软件里扩大10倍，时间=sleep/10
//===================================================================================//
//==============================================================================
//头文件	运用头文件	通用寄存器定义文件
//==============================================================================
		include "XC8P9520.ASH"
		include "XJ_Define.h"
//==============================================================================
//入口地址	程序入口地址	中断入口地址
//==============================================================================
		org		0x00
		jmp		file_start			//程序入口地址
	//	org		0x08			
	//	jmp		file_Interrupt		//中断入口地址
;==============================================================================
;中断函数
;==============================================================================
/*file_Interrupt:
		mov		A_BUFF,A
		swap	A_BUFF
		swapa	R3
		mov		R3_BUFF,A		//中断入栈保护

		jbts	TCIF 
		jmp		file_Interrupt_ret
;---------TCC定时中断------------
;RTC-tcc定时中断1s,P60取反
file_intTCC:	
		mov		a,@0x0e				//ISR的bit0:TCIF清零
		mov		isr,a

		mov		a,@0x01				;P60口输出取反		 
		xor		port6,a				
	//	mov     a,@data_tcc			;定时器赋初值 
	//	add		tcc,a 				;
	//	jmp		file_Interrupt_ret	; 
file_Interrupt_ret:
		swapa	R3_BUFF
		mov		R3,A
		swapa	A_BUFF				//中断出栈保护恢复
		reti */
;==============================================================================
;初始化函数
;==============================================================================		
file_init:
		mov		a,@data_tcc
		mov		tcc,a
		mov		a,@data_contw		;预分频器分配给TCC，bit5为0时P62才能做普通IO口
		ctw							;分频比为1:8
		clr		port6	 
		mov		a,@0x0				;P6口方向寄存器
		iw		ioc6				;1:输入，0:输出  
		mov		a,@0xff				;bit4~bit6对应P60~P62	
		iw		iocb				;下拉寄存器，0使能
		mov		a,@0xff				;bit0~bit7对应P60~P67
		iw		iocd				;上拉寄存器，0使能
		mov		a,@0x00				;bit7，看门狗使能位，1使能
		iw		ioce				;bit6，P60功能控制位，0:普通IO口。1:外部中断口
		mov		a,@0x01				;中断屏蔽寄存器，1使能Tcc中断
		iw		iocf				;bit0对应TCC中断，bit1对应输入电平变化中断，bit2对应外部中断			
		clr		isr					;中断标志寄存器
		ret	 
;------------------------------------------------------------------
;低速模式下,TCC唤醒IDEL
;TCC定时唤醒时间=TCC*TCC分频*(1/低速RC时钟)=256*2*(1/低速RC时钟)
;------------------------------------------------------------------
file_tcc_wakeIDEL_set:
		mov		a,@0X00		;预分频器分给TCC 07;预分频器分给WDT  32.768ms	
		ctw
		nop
		nop
		clr		tcc			;TCC定时唤醒时间=TCC*TCC分频*(1/低速RC时钟)=256*2*(1/低速RC时钟)
		bts		IDLE		;1:系统执行 SLEEP 指令时进入空闲模式，系统时钟正常工作
		bts		TCCCKS		;TCC 时钟源选择,1:选择系统时钟
		bts		TCCWE		;1:TCC唤醒使能,可唤醒空闲模式,RTC 模式下可唤醒睡眠以及空闲模式
		bts		CLKMD		;1:系统时钟使用低速 RC 振荡器时钟
		bts		STPHX		;1:停止高速时钟，包括 IRC 和晶振振荡器时钟（不包括 RTC 时钟） 
		ret
file_tcc_exitIDEL_set:			;退出IDEL设置
		btc		IDLE		;0:系统执行 SLEEP 指令时进入睡眠模式	
		btc		TCCCKS		;TCC 时钟源选择,0:选择指令周期时钟
		btc		TCCWE		;0:TCC 唤醒禁止	
		btc		STPHX		;0:高速时钟正常工作
		btc		CLKMD		;0:系统时钟使用高速 IRC 或者晶振振荡器时钟 
		ret
;------------------------------------------------------------------
;低速模式下,T1/PWM唤醒IDEL
;T1/PWM定时唤醒时间=PRD*T1预分频*(1/低速RC时钟)=255*2*(1/低速RC时钟)
;------------------------------------------------------------------
file_pwm_wakeIDEL_set:
		mov		a,@0b10001000  ;pwm输出使能关闭 bit6-bit4,pwm=255*2(分频)*(1/低速RC时钟)=38ms
		mov		PWMCON,a			;PWM控制寄存器 T1EN PWM3EN PWM2EN PWM1EN T1PTEN T1PSR<2> T1PSR<1> T1PSR<0> 	
		mov		a,@255;data_PRD_set
		mov		PRD,a			
		nop
		nop
		bts		IDLE		;1:系统执行 SLEEP 指令时进入空闲模式，系统时钟正常工作
		bts		PWMWE		;1:PWM 唤醒使能，可唤醒空闲模式 
		bts		PWMCKS		;1:选择系统时钟Fosc
		bts		CLKMD		;1:系统时钟使用低速 RC 振荡器时钟
		bts		STPHX		;1:停止高速时钟，包括 IRC 和晶振振荡器时钟（不包括 RTC 时钟） 
		ret
file_pwm_exitIDEL_set:		;退出IDEL设置
		btc		IDLE		;0:系统执行 SLEEP 指令时进入睡眠模式	
		btc		PWMCKS		;0:选择指令周期时钟
		btc		PWMWE		;0:PWM 唤醒禁止	
		btc		STPHX		;0:高速时钟正常工作
		btc		CLKMD		;0:系统时钟使用高速 IRC 或者晶振振荡器时钟 
		ret		
;------------------------------------------------------------------
;RTC定时唤醒(不受选型里clock的影响）
;RTC定时唤醒时间T = (1/32.768KHz)*4Clock*32*256 = 1S 
;选项里使能RTC，并且外接32.768kHz晶振
;------------------------------------------------------------------
file_RTC_wakeIDEL_set:
			mov	   	A,@0X84		;设置TCC预分频1:32,bit7:RTCS使0x84;能
			ctw					;bit7=1:选择外部晶振时钟（LXT 的 4 分频）
			clr		tcc			;定时中断设置T = (1/32.768KHz)*4Clock*32*256 = 1S 
			nop
			bts		IDLE		;1:系统执行 SLEEP 指令时进入空闲模式，系统时钟正常工作
			bts		TCCCKS		;TCC 时钟源选择,1:选择系统时钟
			bts		TCCWE		;1:TCC唤醒使能,可唤醒空闲模式,RTC 模式下可唤醒睡眠以及空闲模式
			ret
file_RTC_exitIDEL_set:
			btc		IDLE		;0:系统执行 SLEEP 指令时进入睡眠模式	
			btc		TCCCKS		;TCC 时钟源选择,0:选择指令周期时钟
			btc		TCCWE		;0:TCC 唤醒禁止	 
			ret
;================================================
;睡眠子程序
;================================================ 			
file_IDLEWake_slep:
		di 
	 	cwdt
		;----------------------------------------------------------
		;call	file_tcc_wakeIDEL_set  ;低速模式下，tcc唤醒IDEL
		;call	file_pwm_wakeIDEL_set  ;低速模式下,T1/PWM唤醒IDEL
		call	file_RTC_wakeIDEL_set  ;RTC唤醒IDEL
		;----------------------------------------------------------
Slep_Star:
		sleep
		nop
		nop		
	
		;----------------------------------------------------------
		;call	file_tcc_exitIDEL_set  ;低速模式下，tcc唤醒IDEL
		;call	file_pwm_exitIDEL_set  ;低速模式下,T1/PWM唤醒IDEL
		call	file_RTC_exitIDEL_set  ;RTC唤醒IDEL 
		;----------------------------------------------------------
Slep_Init:
		inc		reg_timeSleep 	 
		mov		A,@1;0 			 
		sub		A,reg_timeSleep 
		jbts	c				 
		jmp		file_IDLEWake_slep		 
		clr		reg_timeSleep	 	/**/
	 
		bts		io_ledOut	
		nop
		nop 
		call	delay_10ms
		btc		io_ledOut 
file_IDLEWake_slep_ret:
		ret 


;============延时10ms============
delay_10ms:
      		mov 		a,@1       ;改此处可改变延时时间
      		mov			delay_a,a 
cc:
      		mov  		a,@33
     		mov  		delay_b,a
bb:
      		mov 		a,@196
      		mov  		delay_c,a
aa:
      		dj  		delay_c
      		jmp 		aa     
      		dj 			delay_b
      		jmp 		bb
      		dj	 		delay_a
      		jmp 		cc
      		ret 	
;==============================================================================
; 初始化程序 
;==============================================================================  
file_start: 
    	M9520CLRRAMBANK				;上电复位,清RAM
     	call	file_init			;控制寄存器初始化 
     	jmp		main  

;==============================================================================
;主函数
;============================================================================== 
main:	
	//	cwdt   
		;-----------空闲模式唤醒,关中断---------------------
		call	file_IDLEWake_slep	;空闲模式唤醒
		jmp		main				;进入主函数  







