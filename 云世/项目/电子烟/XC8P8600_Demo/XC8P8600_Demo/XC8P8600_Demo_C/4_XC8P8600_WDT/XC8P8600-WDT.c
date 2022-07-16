//*******************************************免责声明*******************************************//
/*无锡矽杰微电子有限公司（简称：无锡矽杰微）保留关于该例程可靠性、功能和设计方面的改进作进一步说明的权利。
由于使用本例程中的信息或内容而导致的直接，间接，特别附带结果的损害，无锡矽杰微没有义务负责。
本例程中代码的应用仅仅是用来做功能演示，本公司不保证这些代码没有更深入的测试就能适用。
本例程中使用的软件，都是依据授权或保密合约所合法提供的，并且只能在这些合约的许可条件下使用或者复制。
无锡矽杰微的产品不是专门设计来应用于生命维持的用具，装置或者系统。无锡矽杰微的产品不支持而且禁止在这些方面的应用。
本例程内容如有变动恕不另作通知，具体更新信息，请参考公司官方网站www.xjmcu.com。*/
//===================================================================================//
//主频：8M/4T  
//WDT-DEMO功能说明：
//睡眠393ms，唤醒323us
//=====================================================*/
//===================================================================================//
//==============================================================================//
//头文件	运用头文件	通用寄存器定义文件
//==============================================================================//
#include "XC8P8600.h"
#include "XJ_8600Define.h"
//===================================//
//void file_clrRam(void);
//void file_init(void);
void delayUs(unsigned char Time);
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
	if(TCIF)					//判断TCIF是否为1
	{
		TCC	  += 0x06;				//1/2 * 8 * (256-6) = 1000us	公式：1/IRC频率 * 预分频 * （256-初值）
		ISR    = 0xfe;				//清TC0中断标志位
		io_ledOut = !io_ledOut;		//P61口翻转
	}	 
//===============中断程序===============//
	POP(_A_BUFF,_R3_BUFF);			//中断出栈保护恢复
}	 
//================================================
//睡眠计时子程序 393ms唤醒一次
//================================================  
void 	file_WDTTime()
{
	if(++reg_sleep_cnt>=10) // 
	{
		reg_sleep_cnt=0;
		io_led2Out =1;
		
	NOP();
	NOP();
	//	delayUs(80);		//亮322us
		io_led2Out =0;
	}
}
//================================================
//睡眠子程序
//================================================ 			
void 	file_WDTWake_slep()
{
//-----------------------------------------			
	IOCP_W(WDTCR,0x00);		 //;如果分频是由TCC切换而来，需要先关WDT 
//-----------------------------------------		
	IOCP_W(IMR,0x00);
	ISR=0;
	CWDT();
	CONTW(0x09);			//预分频分给wdt,2分频 
	IOCP_W(WDTCR,0x80);
	DI();
	NOP();
	SLEEP();
	NOP();
	NOP();
}
/*--------------------------------------------------------------- 
* 函数名称:void DelayUs(unsigned char Time)
* 功	能:短延时函数 --8M-4T 
* 输入参数:Time   Time=1 10.5us/ Time=10 48.5us  /Time=80 343.5us
* 返回参数:无 
*--------------------------------------------------------------*/
/*void delayUs(unsigned char Time)
{
	unsigned char a;
	for(a=0;a<Time;a++)
	{
		NOP();
	}
} */ 
/*--------------------------------------------------------------- 
* 函数名称:void DelayMs(unsigned char Time)
* 功	能:最小延时单位1ms
* 输入参数:Time 
* 返回参数:无 
*--------------------------------------------------------------*/
/*void delayMs(unsigned char Time)
{
	unsigned char a,b;
	for(a=0;a<Time;a++)
	{
		for(b=0;b<5;b++)
		{
		 	delayUs(80); //快1%
		}
	}
}*/
//===================================//
//MAIN主程序
//===================================//
void main()
{
	if(T)
	{
		file_clrRam();				//上电复位，反之WDT复位
	}
	file_init();					//io寄存器初始化
	file_project_init();			//程序所需功能设置
	EI();							//打开总中断
	while(1)
	{	 
		//-----------WDT复位唤醒,关中断---------------------- 
		file_WDTTime();				//WDT定时
		file_WDTWake_slep();		//WDT唤醒睡眠
		NOP();
		NOP();
		NOP();
	}
}