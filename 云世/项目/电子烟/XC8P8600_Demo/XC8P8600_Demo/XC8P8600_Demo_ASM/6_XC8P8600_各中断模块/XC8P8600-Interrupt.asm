//*******************************************免责声明*******************************************//
/*无锡矽杰微电子有限公司（简称：无锡矽杰微）保留关于该例程可靠性、功能和设计方面的改进作进一步说明的权利。
由于使用本例程中的信息或内容而导致的直接，间接，特别附带结果的损害，无锡矽杰微没有义务负责。
本例程中代码的应用仅仅是用来做功能演示，本公司不保证这些代码没有更深入的测试就能适用。
本例程中使用的软件，都是依据授权或保密合约所合法提供的，并且只能在这些合约的许可条件下使用或者复制。
无锡矽杰微的产品不是专门设计来应用于生命维持的用具，装置或者系统。无锡矽杰微的产品不支持而且禁止在这些方面的应用。
本例程内容如有变动恕不另作通知，具体更新信息，请参考公司官方网站www.xjmcu.com。*/
//===================================================================================//
//主频：8M/4T
;各中断模块 -DEMO功能说明：
;TCC中断1ms ,P61取反 
;P63输入变化中断，P62取反
;P60外部中断,P64取反
;pwm周期中断1ms,P65取反
//===================================================================================//
//==============================================================================
//头文件	运用头文件	通用寄存器定义文件
//==============================================================================
		include "XC8P8600.ASH"
		include "XJ_8600Define.h"
//==============================================================================
//入口地址	程序入口地址	中断入口地址
//==============================================================================
		org		0x00
		jmp		file_start			//程序入口地址
		org		0x08			
		jmp		file_Interrupt		//中断入口地址
;==============================================================================
;中断函数
;==============================================================================
file_Interrupt:
		mov		A_BUFF,A
		swap	A_BUFF
		swapa	R3
		mov		R3_BUFF,A		//中断入栈保护

		di 
		jbtc	TCIF 					;TCC 中断
		jmp		file_IntrruptTCC
		jbtc	ICIF 					;PORT6端口变化中断
		jmp		file_IntrruptP6  
		jbtc	EXIF					;P60外部中断
		jmp		file_IntrruptExternal 
		jbts	T1IF					;T1中断(pwm周期中断)判断 
		jmp		file_Interrupt_ret 			
;---------------PWM周期中断--------------------------- 
file_IntrruptPWM:	;PWM周期中断1ms
		mov		a,@0b00000111		;ISR的bit3:T1IF清零
		mov		isr,a 
									
		mov		a,@0x20
		xor		port6,a				;P65口输出取反/**/	
		jmp		file_Interrupt_ret
;--------------P60外部中断-------------------------------
file_IntrruptExternal:	
		mov		a,@0b00001011		;ISR的bit2:EXIF清零
		mov		isr,a
		mov		a,@0x10				;P64口输出取反		 
		xor		port6,a		 
		jmp		file_Interrupt_ret 
;--------------Port6端口变化中断--------------------
 file_IntrruptP6:  
		mov		a,@0b00001101		;ISR的bit1:ICIF清零
		mov		isr,a 
		mov		a,@0x04 			;P62口输出取反		 
		xor		port6,a		 
		jmp		file_Interrupt_ret 
;--------------TCC中断-------------------------------
file_IntrruptTCC:	;tcc定时中断1ms,P60取反 
		mov		a,@0b00001110		;ISR的bit0:TCIF清零
		mov		isr,a 
		mov		a,@0x02				;P61口输出取反		 
		xor		port6,a	
		bts		bit_end1ms
		jmp		file_Interrupt_ret	 
file_Interrupt_ret:
		swapa	R3_BUFF
		mov		R3,A
		swapa	A_BUFF				//中断出栈保护恢复
		reti  
;==============================================================================
;各中断模块功能设置 
;============================================================================== 
file_interruptSet:
		mov		a,@0b00001001	;P60设为输入口
		iw		ioc6
		mov		a,@0b01000000	;外部中断使能位置1 
		iw		ioce
		mov		a,@0b00001111	;中断使能控制,Bit3:T1 中断使能位;Bit2:外部中断使能控制,Bit1:端口状态改变,Bit0:TCC 溢出中断使能控制
		iw		iocf			;TCC、P60外部中断、输入口状态变化中断、PWM 周期溢出中断全部使能
;---------------------------------------------------------
;pwm中断设置
		mov		a,@0b11111000   ;pwm=1/8*2(分频)*4clock*100=100us	 
		mov		PWMCON,a		//pwm计数器，pwm1/2/3使能
		mov		a,@100
		mov		PRD,A			//PWM周期
;---------------------------------------------------------
;唤醒设置
		mov		a,@0b00001000	;P63端口独立唤醒
		mov		ICIECR,a
		ret 
;==============================================================================
;初始化函数
;==============================================================================		
file_init:
		mov		a,@data_tcc
		mov		tcc,a
		mov		a,@data_contw		;预分频器分配给TCC，bit5为0时P62才能做普通IO口
		ctw							;分频比为1:8
		clr		port6	 
		mov		a,@0x08				;P6口方向寄存器
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
;==============================================================================
; 初始化程序 
;==============================================================================  
file_start: 
    	M8600CLRRAMBANK				;上电复位,清RAM
     	call	file_init			;控制寄存器初始化
		call	file_interruptSet
     	jmp		main 
;==============================================================================
;主函数
;============================================================================== 
main:
		ei						;开总中断  
		cwdt  
		jbts	bit_end1ms
		jmp		main
		btc		bit_end1ms 
		jmp		main			;进入主函数 






