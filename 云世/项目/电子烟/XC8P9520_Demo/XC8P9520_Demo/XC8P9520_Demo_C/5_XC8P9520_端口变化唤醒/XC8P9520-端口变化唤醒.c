//*******************************************免责声明*******************************************//
/*无锡矽杰微电子有限公司（简称：无锡矽杰微）保留关于该例程可靠性、功能和设计方面的改进作进一步说明的权利。
由于使用本例程中的信息或内容而导致的直接，间接，特别附带结果的损害，无锡矽杰微没有义务负责。
本例程中代码的应用仅仅是用来做功能演示，本公司不保证这些代码没有更深入的测试就能适用。
本例程中使用的软件，都是依据授权或保密合约所合法提供的，并且只能在这些合约的许可条件下使用或者复制。
无锡矽杰微的产品不是专门设计来应用于生命维持的用具，装置或者系统。无锡矽杰微的产品不支持而且禁止在这些方面的应用。
本例程内容如有变动恕不另作通知，具体更新信息，请参考公司官方网站www.xjmcu.com。*/
//===================================================================================//
//主频：8M/4T
//按键检测-DEMO功能说明：
//上电睡眠，功耗0.1uA@3v
//P63接按键,低电平有效,外部上拉,按一下,LED2亮;再按一下,LED2灭,如此循环  
//===================================================================================//
//==============================================================================//
//头文件	运用头文件	通用寄存器定义文件
//==============================================================================//
#include "XC8P9520.h"
#include "XJ_9520Define.h"
//===================================//
//void file_clrRam(void);
//void file_init(void);
//void file_project_init(void);
void delayUs(unsigned char Time);
void delayMs(unsigned char Time);
//===================================//
//初始化RAM:10H~3FH
//===================================//
void file_clrRam()
{
	for(RSR=0x90;RSR<0xFF;RSR++)	//清零 BANK0 RAM  IAR-R0,RSR-R4

	{IAR = 0;}
	 IAR = 0;
}
//===================================//
//端口初始化
//===================================//
void file_init(void)
{	
	CONTW(0x02);			//TCC 8分频
	TCC = data_tcc;			//1/2 * 8 * (256-6) = 1000us	公式：1/IRC频率 * 预分频 * （256-初值）
	PORT6 = 0;				//P6口输出低
	IOCP_W(P6CR,0x08);		//P6口设为输出
	IOCP_W(PHDCR,0xff);		//端口上下拉控制寄存器，bit7-bit4对应P67-P64下拉;bit3-bit0对应P53-P50上拉 
	IOCP_W(PDCR,0xff);		//端口下拉控制寄存器，  bit6-bit4对应P62-P60,bit3-bit0对应P53-P50
	IOCP_W(PHCR,0xff);		//P6端口上拉控制寄存器  bit7-bit0对应P67-P60
	IOCP_W(WDTCR,0x00);		//WDT 使能控制寄存器
	IOCP_W(IMR,0x01);		//中断使能控制寄存器 
	ISR = 0x0;				//清TC0中断标志位 
}
//===================================//
//TC0初始化
//===================================//
void file_project_init(void)
{
}
//===================================//
//中断服务程序
//===================================//
void int_isr(void) __interrupt 
{    	
	__asm__("org 0x08");			//中断入口地址			
	PUSH(_A_BUFF,_R3_BUFF);			//中断入栈保护
//=========Tcc中断程序===============//
	if(TCIF == 1)					//判断TCIF是否为1
	{
		TCC	  += 0x06;				//1/2 * 8 * (256-6) = 1000us	公式：1/IRC频率 * 预分频 * （256-初值）
		ISR    = 0xfe;				//清TC0中断标志位
		io_ledOut = !io_ledOut;			//P61口翻转
	}	 
//===============中断程序===============//
	POP(_A_BUFF,_R3_BUFF);			//中断出栈保护恢复
}
//--------------按键检测子程序-----------------------------
void file_scanKey()
{
  	if(((io_key==1)&&(bit_keyPress==0))||((io_key==0)&&(bit_keyPress==1)))
  	{
  		reg_keyCont=0;
  	}
	if(++reg_keyCont>=10)
  	{
    	reg_keyCont=0;			//;滤波结束
    	if(io_key==0)
    	{
			bit_keyPress=1;		//;置按键按下标志位
		}
		else
			bit_keyPress=0;		//;清按键按下标志位	    
  	}
} 
//;================================================ 
//;MIC检测到吸动作
//;吸加热，不吸停止
//;================================================ 
void file_keyDeal()
{
	if(bit_keyPress==1)
	{
		if(bit_keyPress_deal==0) //按键未处理
		{
			bit_keyPress_deal=1;
			if(bit_modeOpen==1)
			{
				bit_modeOpen=0;
				io_led2Out=0;
			}
			else
			{
				bit_modeOpen=1;
				io_led2Out=1;			
			}	
		}
	}
	else	//bit_keyPress=0
	{
		bit_keyPress_deal=0;
	}

} 	
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
//***************睡眠程序*****************
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
void 	file_sleep()
{
	if((io_key==1)&&(bit_keyPress==0))
	{
		reg_sleep_cnt++;
		if(reg_sleep_cnt>=100) //50ms
		{
			reg_sleep_cnt=0;
			ICIECR=0X08;		//P63端口独立唤醒
			TCC=0;
			//CONTW(0X0F);		//预分频，分配给WDT (PAB == 1)
			IOCP_W(WDTCR,0x00);	
			ISR	=0;
			DI();				//禁止唤醒进入中断
			IOCP_W(IMR,0x02);
			SLEEP();
			NOP(); 
			NOP();
			NOP();
			NOP();
			CWDT();
//------------睡眠唤醒----------------------
			CONTW(0x02);
			IOCP_W(WDTCR,0x00);
			IOCP_W(IMR,0x01);
			TCC = data_tcc;
			EI();
			ISR=0;
		}
	}
	else
	{
		reg_sleep_cnt=0;
	}
}
//===================================//
//MAIN主程序
//===================================//
void main()
{
	file_clrRam();					//清RAM
	file_init();					//io寄存器初始化
	file_project_init();			//程序所需功能设置
	EI();							//打开总中断
	while(1)
	{	
		//flag_key.allBit = 0xff;		//对定义了标志位的寄存器的操作示例
		//flag_key.allBit = 0x00;
		file_scanKey();
		file_keyDeal();
		file_sleep();
		NOP();
		NOP();
		NOP();
	}
}
