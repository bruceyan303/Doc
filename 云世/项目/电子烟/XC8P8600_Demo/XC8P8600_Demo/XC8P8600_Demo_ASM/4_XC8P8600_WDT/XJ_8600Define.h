/**********************************************************************/
/**********************无锡矽杰微电子有限公司**************************/
/**********************项目: 各类定义头文件****************************/
/**********************编程: Tina          ****************************/
/**********************时间: 2022.01.07    ****************************/
/**********************************************************************/             
;          __________ 
;   VCC---|VCC   GND |---VSS
;   AD3---|P65   P60 |---AD0/PWM3/INT0  
;   AD2---|P64   P61 |---PWM2/VREF
;      ---|P63   P62 |---AD1/PWM1/TCC  
;         |__________|
;==================================================
;		端口寄存器定义
;		说明:端口定义，根据实际程序进行修改
;==================================================  
io_key		    	== 	p6.3   
io_ledOut			== 	p6.1 
;========================================================================
;数据定义
;========================================================================
tcc_2				==	0x00		;TCC预分频器使能，分频比1:2;
tcc_4				==	0x01		;TCC预分频器使能，分频比1:4;
tcc_8				==	0x02		;TCC预分频器使能，分频比1:8;
tcc_16				==	0x03		;TCC预分频器使能，分频比1:16;
tcc_32				==	0x04		;TCC预分频器使能，分频比1:32;
tcc_64				==	0x05		;TCC预分频器使能，分频比1:64;
tcc_128				==	0x06		;TCC预分频器使能，分频比1:128;
tcc_256				==	0x07		;TCC预分频器使能，分频比1:256;
;-------------------------------------------------------------------------
data_contw			==	0x02	 	;分频值，8分频  
data_tcc			==  6			;tcc初值 1ms中断一次
;-------------------------------------------------------------------------
;iopage寄存器配置
;-------------------------------------------------------------------------
;data_ioc5Set		==	0b00000000	;P5方向控制寄存器:1输入,0输出
;data_ioc6Set		==	0b00001000	;P6方向控制寄存器:1输入,0输出
;data_ioc9Set		==	0b11111111	;端口下拉控制寄存器1:0使能,1禁止 bit5-bit4对应P65-P64下拉
;data_iocbSet		==	0b11111111	;端口下拉控制寄存器2:0使能,1禁止 bit6-bit4对应P62-P60下拉
;data_iocdSet		==	0b11111111	;P6端口上拉控制寄存器:0使能,1禁止 bit5-bit0对应P65-P60
;data_ioceSet		==	0b00000000	;WDT控制寄存器:Bit7:WDTEN-WDT 0:禁止,1:使能;Bit6:EIS-P60 外部中断使能位 0:禁止,1:使能
;data_exInt_en		==	0b01000000	;外部中断使能位置1 
;data_iocfSet_tccInt	==	0b00000001	;中断使能控制,Bit0:TCC 溢出中断使能控制 
;data_iocfSet_p6Int	==	0b00000010	;中断使能控制,Bit1:P6 端口状态改变中断使能控制  
;data_iocfSet_exInt	==	0b00000100	;中断使能控制,Bit2:外部中断使能控制,
;data_iocfSet_pwmInt	==	0b00001000	;中断使能控制,Bit3:T1 中断使能位;
;data_iocfSet_adInt	==	0b00010000	;中断使能控制,Bit4:adc中断使能位;
;==============================================================
;==============================================================
;PWM模块功能设置
;PWMCON pwm控制寄存器		
;PRD	pwm周期寄存器
;PDC1	pwm1占空比寄存器
;PDC2	pwm2占空比寄存器
;PDC3	pwm3占空比寄存器  
;PWM1:P62,PWM2:P61,PWM3:P60
;高电平时间最小可以做到0.5us步进
;==============================================================
;data_pwmOff			==	0b00000000	;关闭pwm
;data_PWMCON_set     ==	0b10001000  ;pwm输出使能关闭 bit6-bit4,pwm=1/8M*4clock*8(分频)*250=1ms;
;data_PWMCON_setPwm  ==	0b11111000  ;pwm输出使能开启 pwm=1/8*2(分频)*4clock*100=100us
;data_PRD_set		==	100			;pwm周期寄存器	
;data_PDC1_set		==	20			;pwm1占空比寄存器,高电平时间=1/8*2(分频)*4clock*20=20us	 
;data_PDC2_set		==	30			;pwm2占空比寄存器
;data_PDC3_set		==	50			;pwm3占空比寄存器

;data_RE_set			==	0b10000000	;bit7=1 PWM1 输出取反
;=======================================
; 所有标志位定义，以bit开头
;=======================================
flag_mode			==	0X10  
bit_adcDeal_Enable	==	flag_mode.0	;使能ad采样数据处理
bit_lowV			==	flag_mode.1	;低电压标志位
bit_end1ms			==	flag_mode.2
bit_keyPress		==	flag_mode.3	;按键按下标志位
bit_keyPress_deal	==	flag_mode.4	;按键执行标志位
bit_modeOpen		==	flag_mode.5 ;开关机标志位
;=======================================
; 所有寄存器定义，以reg开头
;=======================================
reg_adcBuff_H		==	0x20		;adc采样暂存
reg_adcBuff_L		==	0x21			 
reg_adcData_H		==	0x22		;adc处理暂存
reg_adcData_L		==	0x23 
reg_AdCnt			==	0x24		;adc累加寄存器
reg_ad_low_cnt		==	0x25		;低电压计数器
reg_ad_hig_cnt		==	0x26		;高电压计数器
reg_timeSleep		==	0x26		;睡眠确认延时寄存器
reg_keyCont			==	0x27		;按键计数
;----------------------------------------------------
delay_a				==	0x3b
delay_b				==	0x3c
delay_c				==	0x3d
A_BUFF				==	0x3e
R3_BUFF				==	0x3f
;----------------------------------------------------

