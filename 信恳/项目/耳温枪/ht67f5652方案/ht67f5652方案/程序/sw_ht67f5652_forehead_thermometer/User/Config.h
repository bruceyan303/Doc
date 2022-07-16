
#ifndef _CONFIG_H__
#define _CONFIG_H__




/********************************************************************
NOTE:	ϵ�y�궨�x
********************************************************************/

#define	mac_Test_On		1
#define	mac_Test_Off	0
#define mac_Test_Mode 	mac_Test_Off

#define	mac_MCU_P80		1
#define	mac_MCU_P64		0
#define	mac_MCU_pin		mac_MCU_P64

/********************************************************************
NOTE:	lib ���ļ��а������^�ļ�
********************************************************************/
//ϵ�y�^�ļ�
#include "HT67F5652.h"
//����^�ļ�,��Ҫ��ʹ��ǰ�ȱ�����

#include "..\User\typedef.h"
//
#include  "..\User\Ram_Init.h"
//
#include  "..\User\Timer.h"
//
#include  "..\User\EEPROM.h"
/********************************************************************
NOTE:	user �Ñ�������ʹ�õ��^�ļ�
********************************************************************/
#include "..\User\Main.h"
//#include "..\User\define.h"
#include "..\User\GPIO.h"
#include "..\User\Initial.h"
#include "..\User\Key_Scan.h"
#include "..\User\Uart.h"
#include "..\User\Lcd.h"
#include "..\User\Work_mode.h"
#include "..\User\ADC.h"
#include "..\User\Beep.h"
#include "..\User\calculate.h"





#endif


