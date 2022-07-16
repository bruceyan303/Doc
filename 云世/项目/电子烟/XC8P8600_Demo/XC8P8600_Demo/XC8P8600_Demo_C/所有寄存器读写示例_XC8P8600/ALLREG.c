//===================================//
//��Ƶ��
//���ܽ��ܣ�
//���мĴ�����д����ʾ��
//===================================//
#include "XC8P8600.h"
#define EI()  __asm__(" ei ")
#define DI()  __asm__(" di ")
#define NOP() __asm__(" nop ")
#define CONTW(VAL)			__asm__("mov a,@"#VAL"\n ctw")			//CTW = VAL��CONT�Ĵ�����ֵ
#define IOCP_W(REG,VAL)		__asm__("mov a,@"#VAL"\n iw "#REG)		//REG = VAL��IOCҳ�Ĵ�����ֵ
#define IOCP_R(RAM,REG)		__asm__("ir "#REG"\n mov "#RAM",a")		//RAM = REG��IOCҳ�Ĵ�����ֵ
#define PUSH(A_REG,R3_REG)	__asm__("mov "#A_REG",a\n swap "#A_REG"\n swapa STATUS\n mov "#R3_REG",a")	//�ж���ջ����	
#define POP(A_REG,R3_REG)	__asm__("swapa "#R3_REG"\n mov STATUS,a\n swapa "#A_REG)					//�жϳ�ջ�����ָ�

volatile __at(0x10) unsigned char A_BUFF;		//�ж�ACC����RAM
volatile __at(0x11) unsigned char R3_BUFF;		//�ж�STATUS����RAM
volatile unsigned char Temp;	
//=====================================================//
//==================λ����I/O����=======================//
//=====================================================//
#define IOCP_W_AND(REG,VAL)  __asm__("ir "#REG"\n and a,@"#VAL"\n iw "#REG)
#define IOCP_W_OR(REG,VAL)  __asm__("ir "#REG"\n or a,@"#VAL"\n iw "#REG)
#define P61_OUTPUT          IOCP_W_AND(PORT6,0XFD)
#define P61_INPUT           IOCP_W_OR(PORT6,0X02)
//===================================//
//MAIN������
//===================================//
void main()
{
	
//======================================================//
// Operational Registers Define RPAGE0                  //
//======================================================//
	IAR = 0xAA;					//IAR��ֵ0xAA
	Temp = IAR;					//��IAR��Temp

	TCC = 0xAA;					//TCC��ֵ0xAA
	Temp = TCC;					//��TCC��Temp

	PCL = 0xAA;					//PCL��ֵ0xAA
	Temp = PCL;					//��PCL��Temp

	STATUS = 0xAA;				//STATUS��ֵ0xAA
	Temp = STATUS;				//��STATUS��Temp

	RSR = 0xAA;					//RSR��ֵ0xAA
	Temp = RSR;					//��RSR��Temp

	PORT6 = 0xAA;				//PORT6��ֵ0xAA
	Temp = PORT6;				//��PORT6��Temp

	ADCON = 0xAA;				//ADCON��ֵ0xAA
	Temp = ADCON;				//��ADCON��Temp

	PWMCON = 0xAA;				//PWMCON��ֵ0xAA
	Temp = PWMCON;				//��PWMCON��Temp

	PRD = 0xAA;					//PRD��ֵ0xAA
	Temp = PRD;					//��PRD��Temp

	PDC1 = 0xAA;				//PDC1��ֵ0xAA
	Temp = PDC1;				//��PDC1��Temp

	PDC2 = 0xAA;				//PDC2��ֵ0xAA
	Temp = PDC2;				//��PDC2��Temp

	PDC3 = 0xAA;				//PDC3��ֵ0xAA
	Temp = PDC3;				//��PDC3��Temp

	ICIECR = 0xAA;				//ICIECR��ֵ0xAA
	Temp = ICIECR;				//��ICIECR��Temp

	CPUCON = 0xAA;				//CPUCON��ֵ0xAA
	Temp = CPUCON;				//��CPUCON��Temp

	ISR = 0xAA;					//ISR��ֵ0xAA
	Temp = ISR;					//��ISR��Temp

//======================================================//
// Operational Registers Define IOPAGE0                 //
//======================================================//			
	CONTW(0x08);				//CONT��ֵ0x08
	
	IOCP_W(P6CR,0xAA);			//P6CR��ֵ0xAA
	IOCP_R(_Temp,P6CR);			//��P6CR��Temp
	
	IOCP_W(ADCVS,0xAA);			//ADCVS��ֵ0xAA
	IOCP_R(_Temp,ADCVS);		//��ADCVS��Temp
	
	IOCP_W(ADATH,0xAA);			//ADATH��ֵ0xAA
	IOCP_R(_Temp,ADATH);		//��ADATH��Temp
	
	IOCP_W(PHDCR,0xAA);			//PHDCR��ֵ0xAA
	IOCP_R(_Temp,PHDCR);		//��PHDCR��Temp

	IOCP_W(ADPS,0xAA);			//ADPS��ֵ0xAA
	IOCP_R(_Temp,ADPS);			//��ADPS��Temp

	IOCP_W(PDCR,0xAA);			//PDCR��ֵ0xAA
	IOCP_R(_Temp,PDCR);			//��PDCR��Temp

	IOCP_W(ADATL,0xAA);			//ADATL��ֵ0xAA
	IOCP_R(_Temp,ADATL);		//��ADATL��Temp

	IOCP_W(PHCR,0xAA);			//PHCR��ֵ0xAA
	IOCP_R(_Temp,PHCR);			//��PHCR��Temp

	IOCP_W(WDTCR,0xAA);			//WDTCR��ֵ0xAA
	IOCP_R(_Temp,WDTCR);		//��WDTCR��Temp

	IOCP_W(IMR,0xAA);			//IMR��ֵ0xAA
	IOCP_R(_Temp,IMR);			//��IMR��Temp

	IOCP_W_AND(P6CR,0X01);		//P6����0x01����P6��

	IOCP_W_OR(P6CR,0XFE);		//P6�ڻ�0xFE����P6��

	P61_INPUT;					//λ����i/o
	
	P61_OUTPUT;					//λ����i/o
	
}

//===================================//
//�жϷ������
//===================================//
void int_isr(void) __interrupt 
{    	
	__asm__("org 0x08");
	PUSH(_A_BUFF,_R3_BUFF);			//�ж���ջ����
	//===============�жϳ���===============//
	
	//===============�жϳ���===============//
	POP(_A_BUFF,_R3_BUFF);			//�жϳ�ջ�����ָ�
}
