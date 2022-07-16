//*******************************************免责声明*******************************************//
/*无锡矽杰微电子有限公司（简称：无锡矽杰微）保留关于该例程可靠性、功能和设计方面的改进作进一步说明的权利。
由于使用本例程中的信息或内容而导致的直接，间接，特别附带结果的损害，无锡矽杰微没有义务负责。
本例程中代码的应用仅仅是用来做功能演示，本公司不保证这些代码没有更深入的测试就能适用。
本例程中使用的软件，都是依据授权或保密合约所合法提供的，并且只能在这些合约的许可条件下使用或者复制。
无锡矽杰微的产品不是专门设计来应用于生命维持的用具，装置或者系统。无锡矽杰微的产品不支持而且禁止在这些方面的应用。
本例程内容如有变动恕不另作通知，具体更新信息，请参考公司官方网站www.xjmcu.com。*/
//===================================================================================//
//主频：8M/4T
;端口状态改版唤醒(P6口)-DEMO功能说明：
;P63接按键,低电平有效,外部上拉；P62接LED，高电平有效
;上电睡眠，P63按一下,LED亮;再按一下,LED灭,睡眠,如此循环
;可设置端口独立唤醒
;1ms进一次TCC中断,P60取反
;测试睡眠电流0.3uA@3.7v
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
		jbts	TCIF
		jmp		file_Interrupt_ret
;---------TCC定时中断------------
file_intTCC:	
		mov		a,@0x0e			//ISR的bit0:TCIF清零
		mov		isr,a
		
		mov		a,@0x01				;P60口输出取反		 
		xor		port6,a		
		
		bts		bit_end1ms		
		mov     a,@data_tcc			;定时器赋初值 
		add		tcc,a 				;
		jmp		file_Interrupt_ret	;
file_Interrupt_ret:
		swapa	R3_BUFF
		mov		R3,A
		swapa	A_BUFF				//中断出栈保护恢复
		reti 
;==============================================================================
;按键检测
;============================================================================== 
file_scanKey: 
		jbts	io_key				 
		jmp		file_keyLow		 
;------------------------------------------
file_keyHig:;按键弹起
		jbts	bit_keyPress
		clr		reg_keyCont
		jmp		file_key_lvbo		;去抖
file_keyLow:;按键按下
		jbtc	bit_keyPress
		clr		reg_keyCont
;------------------------------------------
file_key_lvbo:
		inc		reg_keyCont
		mov		a,@10
		sub		a,reg_keyCont
		jbts	c
		jmp		file_scanKey_ret
		clr		reg_keyCont			;滤波结束
		
		jbts	io_key
		bts		bit_keyPress		;置按键按下标志位
		jbtc	io_key
		btc		bit_keyPress		;清按键按下标志位
file_scanKey_ret:
		ret
;================================================ 
;按键处理
;按一下，led亮，再按一下led灭
;================================================ 
file_keyDeal:
		jbts	bit_keyPress
		jmp		file_keyPop_bc
;--------------------------------------------   
file_keyPress_do:	;按下执行		
		jbtc	bit_keyPress_deal	;执行标志位
		jmp		file_keyDeal_ret
		bts		bit_keyPress_deal 
		;---------------------------
		jbts	bit_modeOpen
		jmp		file_lastOff
file_lastOn:;上次开机，这次关机
		btc		bit_modeOpen
		btc		io_ledOut
		jmp		file_keyDeal_ret
file_lastOff:;上次关机，这次开机
		bts		bit_modeOpen
		bts		io_ledOut
		jmp		file_keyDeal_ret 
;--------------------------------------------   
file_keyPop_bc:		 
		btc		bit_keyPress_deal 
file_keyDeal_ret:
		ret	
;================================================		
;================================================
;睡眠子程序
;================================================ 			
file_sleep:		
;------------睡眠判断-------------------------		
		jbtc	bit_keyPress		;按键弹起
		jmp		file_sleep_qudou
		jbts	io_key				;按键端口为高电平
		jmp		file_sleep_qudou
		jbtc	bit_modeOpen		;关机状态
		jmp		file_sleep_qudou
;------------睡眠滤波------------------------
		inc		reg_timeSleep		;//	
       	mov		a,@250
       	sub		a,reg_timeSleep	  	;//
       	jbts	c
       	jmp		file_sleep_ret		;//
       	clr		reg_timeSleep		;//  

		mov		a,@0b00001000		//当 OPTION 选项【 P6 端口唤醒】 为【独立控制（寄存器为 0x0D）】 时有效
		mov		ICIECR,a  

		btc		port6,1
;------------睡眠执行------------------------
file_sleep_loop:
		cwdt					;清WDT
		clr		tcc				;clr TCC

		mov	 	a,@0X00			;关闭看门狗
		iw		ioce

		clr    	isr				;清中断标志位	
		di
		mov		a,@0X02			;Bit<1>:ICIE-P6 端口状态改变中断使能控制
		iw		iocf		  
	//	mov		port6,port6		;读PORT6口状态
		sleep					;进入睡眠
		nop
		nop
		nop
		nop
		cwdt					;清WDT
;------------睡眠唤醒-----------------------	
file_sleepWake:           
		mov		a,@data_contw	;设置TCC预分频 
		ctw		
		mov		a,@0x00			;
		iw		ioce		
		mov		a,@0x01			; 开启TCC中断    
		iw		iocf
		mov		a,@data_tcc		;初值 
		mov     tcc,a
		ei						;开总中断              
		clr     isr				;清中断标志位		
file_sleep_qudou:
		clr		reg_timeSleep	;
file_sleep_ret:
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
		call	file_scanKey	;按键扫描
		call	file_keyDeal	;按键处理
		call	file_sleep		;睡眠判断
		jmp		main			;进入主函数 






