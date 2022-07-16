//*******************************************免责声明*******************************************//
/*无锡矽杰微电子有限公司（简称：无锡矽杰微）保留关于该例程可靠性、功能和设计方面的改进作进一步说明的权利。
由于使用本例程中的信息或内容而导致的直接，间接，特别附带结果的损害，无锡矽杰微没有义务负责。
本例程中代码的应用仅仅是用来做功能演示，本公司不保证这些代码没有更深入的测试就能适用。
本例程中使用的软件，都是依据授权或保密合约所合法提供的，并且只能在这些合约的许可条件下使用或者复制。
无锡矽杰微的产品不是专门设计来应用于生命维持的用具，装置或者系统。无锡矽杰微的产品不支持而且禁止在这些方面的应用。
本例程内容如有变动恕不另作通知，具体更新信息，请参考公司官方网站www.xjmcu.com。*/
//===================================================================================//
//主频：8M/4T
;AD采样 -DEMO功能说明：
;ADC2(P64)作为AD采样口，基准电压选择VDD
;低于3.3V，P62-LED亮，高于3.3V，P62-led灭
;查询方式采样子程序
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
;========================================================
;ADC采样通道设置,ADC初始化
;======================================================== 
file_adcSet:
		//mov		a,@(data_ioc6Set+0b00010000)
		//iw		ioc6				;P64输入口

		mov		a,@0b00000000		;bit5=0,使用内部基准
		mov		ADCON,a				;ADC 控制寄存器
		mov		a,@0b00010000		;时钟选择Fosc/16,通道P64,基准电压VDD(Bit<2:0>000-VDD/001-4V/010-3V/011-2V/100-1.5V)	
		iw		ADCVS				;AD 通道基准电压及分频选择寄存器
		mov		a,@0b01000000		;ADC2(P64)作为模拟口输入
		iw		ADPS				;AD 采样口使能及AD高4位寄存器
		btc		VFOE				;0:内部基准电压输出禁止，P65 作为普通 IO 	
		bts		ADPD				;1:ADC使能,启动ADC模块电源		
		ret	
;========================================================
;AD采样开始
;======================================================== 		
file_adcStart:		
		bts		ADPD	   			;使能ADC
		nop				 
		nop						 
		nop							;
		bts		ADRUN  	   			;开始AD转换	              	
		jbtc	ADRUN				;wait	
		jmp		$-1					;转换结束  
;============采样结束，读取AD值	=====================	
file_readAd:
		ir		ADPS				;读取AD高4位
		and		a,@0x0f				;bit3-bit0
		mov		reg_adcBuff_H,a		;
		ir		ADATL				;读取AD低8位
		mov		reg_adcBuff_L,a		;取得的ADC的值 == RegADCBuff2 | reg_adcBuff_L (12Bit - ADC)
;===============================================;//	判断是否需要使能ADC检测	
		jbtc	bit_adcDeal_Enable	;
		jmp		file_adcData_deal	;		
		bts		bit_adcDeal_Enable	;使能数据处理
		clr		reg_adcData_L		;第一次采样，确保所有寄存器都是空的
		clr		reg_adcData_H		;16Bit数据寄存器			
		clr		reg_AdCnt			;累加寄存器	8Bit
		jmp		file_adcStart		;开始采样ADC	
;===========ADC累加运算=====================;
file_adcData_deal:	
		mov		a,reg_adcBuff_L		;ADL
		ADD		reg_adcData_L,a		;reg_adcData_L + ADL--> reg_adcData_L
		jbtc	c					;C = 1/0	reg_adcData_L + ADL < 256	
		inc		reg_adcBuff_H		;reg_adcBuff_H+1 if= 0 -> goto $+1	16位数据只用了12位
		mov		a,reg_adcBuff_H		;ADH - A		
		add		reg_adcData_H,a		;	
;===========ADC求16次累加后取平均===========;				
file_adcData_deal_lop:					;存储16个数据
		inc		reg_AdCnt			;if(++reg_AdCnt < 256) return;
		mov		a,@16		
		sub		a,reg_AdCnt			;
		jbts	c					;
		jmp		file_adc_start_ret;file_adcStart;		 
		clr		reg_AdCnt			;累加了16
			
		btc		c
		rcr		reg_adcData_H		;右移4次
		rcr		reg_adcData_L		;
		btc		c
		rcr		reg_adcData_H		 
		rcr		reg_adcData_L		 
		btc		c
		rcr		reg_adcData_H		 
		rcr		reg_adcData_L		 
		btc		c
		rcr		reg_adcData_H		 
		rcr		reg_adcData_L		;取16次平均
		btc		bit_adcDeal_Enable	;ADC采样完成
;------------电压点判断-------------------- 
;if	adc <= 2730(0x0aaa)  2730*5V/4096=3.3V	小于3.3V欠压，大于3.3V正常 
file_adc_deal:
		mov		a,@0x0a				; 	
		sub		a,reg_adcData_H		; 
		jbts	z					; 
		jmp		file_jugde_adc 		; 
		mov		a,@0xaa 			; 
		sub		a,reg_adcData_L		; 
file_jugde_adc:										; 
		jbts	c					; 
		jmp		file_adcV_low		; <3.3v 
file_adcV_hig:;大于等于3.3V
		clr		reg_ad_low_cnt
		inc		reg_ad_hig_cnt
		mov		a,@50
		sub		a,reg_ad_hig_cnt
		jbts	c
		jmp		file_adc_start_ret
		clr		reg_ad_hig_cnt
		
		btc		bit_lowV			;清欠压标志位
		btc		io_ledOut
		jmp		file_adc_start_ret
file_adcV_low:;低于3.3V
		clr		reg_ad_hig_cnt
		inc		reg_ad_low_cnt
		mov		a,@50
		sub		a,reg_ad_low_cnt
		jbts	c
		jmp		file_adc_start_ret
		clr		reg_ad_low_cnt
		
		bts		bit_lowV			;置欠压标志位
		bts		io_ledOut
		jmp		file_adc_start_ret 
file_adc_start_ret:
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
		mov		a,@0x18				;P6口方向寄存器，P64作为输入口，AD采样
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
		call	file_adcSet			;AD采样设置
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
		call	file_adcStart	;AD采样
		jmp		main			;进入主函数 






