//===================================//
//主频：
//功能介绍：
//所有寄存器读写操作示例
//===================================//
#include "XC8P8600.h"
#define EI()  __asm__(" ei ")
#define DI()  __asm__(" di ")
#define NOP() __asm__(" nop ")
#define CONTW(VAL)			__asm__("mov a,@"#VAL"\n ctw")			//CTW = VAL：CONT寄存器赋值
#define IOCP_W(REG,VAL)		__asm__("mov a,@"#VAL"\n iw "#REG)		//REG = VAL：IOC页寄存器赋值
#define IOCP_R(RAM,REG)		__asm__("ir "#REG"\n mov "#RAM",a")		//RAM = REG：IOC页寄存器读值
#define PUSH(A_REG,R3_REG)	__asm__("mov "#A_REG",a\n swap "#A_REG"\n swapa STATUS\n mov "#R3_REG",a")	//中断入栈保护	
#define POP(A_REG,R3_REG)	__asm__("swapa "#R3_REG"\n mov STATUS,a\n swapa "#A_REG)					//中断出栈保护恢复

volatile __at(0x10) unsigned char A_BUFF;		//中断ACC保护RAM
volatile __at(0x11) unsigned char R3_BUFF;		//中断STATUS保护RAM
volatile unsigned char Temp;	
//=====================================================//
//==================位操作I/O定义=======================//
//=====================================================//
#define IOCP_W_AND(REG,VAL)  __asm__("ir "#REG"\n and a,@"#VAL"\n iw "#REG)
#define IOCP_W_OR(REG,VAL)  __asm__("ir "#REG"\n or a,@"#VAL"\n iw "#REG)
#define P61_OUTPUT          IOCP_W_AND(PORT6,0XFD)
#define P61_INPUT           IOCP_W_OR(PORT6,0X02)
//===================================//
//MAIN主程序
//===================================//
void main()
{
	
//======================================================//
// Operational Registers Define RPAGE0                  //
//======================================================//
	IAR = 0xAA;					//IAR赋值0xAA
	Temp = IAR;					//读IAR到Temp

	TCC = 0xAA;					//TCC赋值0xAA
	Temp = TCC;					//读TCC到Temp

	PCL = 0xAA;					//PCL赋值0xAA
	Temp = PCL;					//读PCL到Temp

	STATUS = 0xAA;				//STATUS赋值0xAA
	Temp = STATUS;				//读STATUS到Temp

	RSR = 0xAA;					//RSR赋值0xAA
	Temp = RSR;					//读RSR到Temp

	PORT6 = 0xAA;				//PORT6赋值0xAA
	Temp = PORT6;				//读PORT6到Temp

	ADCON = 0xAA;				//ADCON赋值0xAA
	Temp = ADCON;				//读ADCON到Temp

	PWMCON = 0xAA;				//PWMCON赋值0xAA
	Temp = PWMCON;				//读PWMCON到Temp

	PRD = 0xAA;					//PRD赋值0xAA
	Temp = PRD;					//读PRD到Temp

	PDC1 = 0xAA;				//PDC1赋值0xAA
	Temp = PDC1;				//读PDC1到Temp

	PDC2 = 0xAA;				//PDC2赋值0xAA
	Temp = PDC2;				//读PDC2到Temp

	PDC3 = 0xAA;				//PDC3赋值0xAA
	Temp = PDC3;				//读PDC3到Temp

	ICIECR = 0xAA;				//ICIECR赋值0xAA
	Temp = ICIECR;				//读ICIECR到Temp

	CPUCON = 0xAA;				//CPUCON赋值0xAA
	Temp = CPUCON;				//读CPUCON到Temp

	ISR = 0xAA;					//ISR赋值0xAA
	Temp = ISR;					//读ISR到Temp

//======================================================//
// Operational Registers Define IOPAGE0                 //
//======================================================//			
	CONTW(0x08);				//CONT赋值0x08
	
	IOCP_W(P6CR,0xAA);			//P6CR赋值0xAA
	IOCP_R(_Temp,P6CR);			//读P6CR到Temp
	
	IOCP_W(ADCVS,0xAA);			//ADCVS赋值0xAA
	IOCP_R(_Temp,ADCVS);		//读ADCVS到Temp
	
	IOCP_W(ADATH,0xAA);			//ADATH赋值0xAA
	IOCP_R(_Temp,ADATH);		//读ADATH到Temp
	
	IOCP_W(PHDCR,0xAA);			//PHDCR赋值0xAA
	IOCP_R(_Temp,PHDCR);		//读PHDCR到Temp

	IOCP_W(ADPS,0xAA);			//ADPS赋值0xAA
	IOCP_R(_Temp,ADPS);			//读ADPS到Temp

	IOCP_W(PDCR,0xAA);			//PDCR赋值0xAA
	IOCP_R(_Temp,PDCR);			//读PDCR到Temp

	IOCP_W(ADATL,0xAA);			//ADATL赋值0xAA
	IOCP_R(_Temp,ADATL);		//读ADATL到Temp

	IOCP_W(PHCR,0xAA);			//PHCR赋值0xAA
	IOCP_R(_Temp,PHCR);			//读PHCR到Temp

	IOCP_W(WDTCR,0xAA);			//WDTCR赋值0xAA
	IOCP_R(_Temp,WDTCR);		//读WDTCR到Temp

	IOCP_W(IMR,0xAA);			//IMR赋值0xAA
	IOCP_R(_Temp,IMR);			//读IMR到Temp

	IOCP_W_AND(P6CR,0X01);		//P6口与0x01给到P6口

	IOCP_W_OR(P6CR,0XFE);		//P6口或0xFE给到P6口

	P61_INPUT;					//位操作i/o
	
	P61_OUTPUT;					//位操作i/o
	
}

//===================================//
//中断服务程序
//===================================//
void int_isr(void) __interrupt 
{    	
	__asm__("org 0x08");
	PUSH(_A_BUFF,_R3_BUFF);			//中断入栈保护
	//===============中断程序===============//
	
	//===============中断程序===============//
	POP(_A_BUFF,_R3_BUFF);			//中断出栈保护恢复
}
