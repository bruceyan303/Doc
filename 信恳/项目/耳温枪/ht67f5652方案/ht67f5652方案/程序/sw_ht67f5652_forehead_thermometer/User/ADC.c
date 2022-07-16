/*************************************************************************************/
//**	Copyright	:	2016 BY HOLTEK SEMICONDUCTOR INC                            **
//** 	File Name   :	adc.c 	       	                                            **
//**	Description	: 																**
//**	MCU      	: 	HT67F5652													**
//**	Author   	: 	Leo														**
//**	Date     	: 	2016/10/28													**
//**	Version  	: 	V00															**
//**	History  	:																**
/*************************************************************************************/

#include "..\User\Config.h"

volatile	U8  gu8v_Sample_Count ;
volatile	U16	gu16v_adc_buff[11];	

/********************************************************************
Function:	fun_ADC_Enable
INPUT	:
OUTPUT	:	
NOTE	:   
********************************************************************/
void fun_VTP_INIT()
{
	mac_SET_PGA_x64();
	mac_SET_AGS_1();
	mac_SET_ADC_AN0_VCM();
	mac_SET_ADC_SPEED_20HZ();
	fun_ADC_Power_Enable();
	fun_ADC_Enable();
}

/********************************************************************
Function:	fun_ADC_Enable
INPUT	:
OUTPUT	:	
NOTE	:   
********************************************************************/
void fun_TEMP1_INIT()
{
	mac_SET_PGA_x1();
	mac_SET_AGS_1();
	mac_SET_ADC_AN2_VCM();
	mac_SET_ADC_SPEED_20HZ();
	fun_ADC_Power_Enable();
	fun_ADC_Enable();	
}

/********************************************************************
Function:	fun_ADC_Enable
INPUT	:
OUTPUT	:	
NOTE	:   
********************************************************************/
void fun_TEMP2_INIT()
{
	mac_SET_PGA_x1();
	mac_SET_AGS_1();
	mac_SET_ADC_AN1_VCM();
	mac_SET_ADC_SPEED_20HZ();
	fun_ADC_Power_Enable();
	fun_ADC_Enable();	
}

/********************************************************************
Function:	fun_ADC_Enable
INPUT	:
OUTPUT	:	
NOTE	:   
********************************************************************/
void fun_BAT_INIT()
{
	mac_SET_PGA_x1();
	mac_SET_AGS_1();
//	mac_SET_ADC_VCM_1_5VDD();
	mac_SET_ADC_SPEED_160HZ();
}


/********************************************************************
Function:	fun_ADC_Enable
INPUT	:
OUTPUT	:
NOTE	:  	
********************************************************************/
void fun_ADC_Power_Enable()
{

	mac_SET_AVDD_2_4();  
	//�����������m�����в���׃�������ڴ��M���O��
	mac_SET_VGS_0();
	mac_SET_AGS_1();
	mac_SET_VRBUFF_DIS();
	mac_SET_ADC_CLOCK_FSYS();
	_ldoen = 1;

}

/********************************************************************
Function:	fun_ADC_Enable
INPUT	:
OUTPUT	:	
NOTE	:   
********************************************************************/
void fun_ADC_Power_Disable()
{
	_ldoen = 0;
}



/********************************************************************
Function:	fun_ADC_Enable
INPUT	:
OUTPUT	:	
NOTE	:   
********************************************************************/
void fun_ADC_Enable()
{
	gu8v_Sample_Count = 0;
	gbv_adc_Sample_Mode = 0;
	gbv_adc_Sample_lock = 0;
	gbv_adc_success = 0;	
	_adoff=0;
	_adslp=0;
	_adrst=0;
	_adrst=1;
	_adrst=0;
	_eoc=0;

}

/********************************************************************
Function:	fun_ADC_Disable
INPUT	:
OUTPUT	:	
NOTE	:   
********************************************************************/
void fun_ADC_Disable()
{
	gu8v_Sample_Count = 0;
	gbv_adc_Sample_Mode = 0;
	_adslp=1;
	_adrst=0;
	_adoff=1;
//	fun_ADC_Power_Disable();	// ԓDemoʹ�õ�LCD��2.2V��LCD
								// �����ڹ����Ġ�B�����P�]AVDD
}

/********************************************************************
Function:	fun_ADC_Polling
INPUT	:
OUTPUT	:	
NOTE	:   �@ȡ���P��������ȥ�����Сֵ��ƽ��
********************************************************************/
void fun_filter_adc()
{	
	volatile U8 i;
	volatile U32 lu32v_adc_result = 0;
	volatile U16 lu16_adc_max;
	volatile U16 lu16_adc_min;
	
	lu16_adc_max = gu16v_adc_buff[0];
	lu16_adc_min = gu16v_adc_buff[0];
	
	for(i=0;i<6;i++)
	{
		lu32v_adc_result += gu16v_adc_buff[i];
		lu16_adc_max = (lu16_adc_max > gu16v_adc_buff[i]) ?  lu16_adc_max : gu16v_adc_buff[i] ; 
		lu16_adc_min = (lu16_adc_min < gu16v_adc_buff[i]) ?  lu16_adc_min : gu16v_adc_buff[i] ; 
	}
		
	gu32v_adc_data.S32 = (U16)((lu32v_adc_result - lu16_adc_min - lu16_adc_max) >> 2);
}

/********************************************************************
Function:	fun_filter_adc1
INPUT	:
OUTPUT	:	
NOTE	:   �@ȡ���gֵ
********************************************************************/

void fun_filter_adc1()
{	
	volatile U8 i,j;
	volatile U16 lu16_adc_max;	
	lu16_adc_max = gu16v_adc_buff[0];
	
	for(i=0;i<12;i++)
	{
		for(j=i;j<11;j++)
		{
			if(gu16v_adc_buff[i]>gu16v_adc_buff[j+1])
			{
				lu16_adc_max=gu16v_adc_buff[i] ;
				gu16v_adc_buff[i]=gu16v_adc_buff[j+1] ;
				gu16v_adc_buff[j+1] = lu16_adc_max;
				
			}
		}
	}
			
	gu32v_adc_data.S32 = gu16v_adc_buff[5];
}


/********************************************************************
Function:	fun_ADC_Polling
INPUT	:
OUTPUT	:	
NOTE	:   
********************************************************************/
void fun_ADC_Polling()
{

	if(_eoc!=0)
	{
		//�i�攵��
		_adcdl=1;
		//�������D�Q��32bit ���з�̖����
		gu32v_adc_data.U32 = 0;
		gu32v_adc_data.byte.byte0	= _adrl;
		gu32v_adc_data.byte.byte1	= _adrm;				
		gu32v_adc_data.byte.byte2	= _adrh;
		if(gu32v_adc_data.bits.b23)
		{
			gu32v_adc_data.byte.byte3 = 0xff;
		}

		#if(mac_Test_Mode==mac_Test_On)
		// �yԇģʽ 
		#else
		// ȡ 24bit adc �е� 16bit ����������Ч����
		gu32v_adc_data.S32 >>= 8;
		#endif
		_adcdl=0;
		_eoc =0;
		
		//���Ӌ��
		gu8v_Sample_Count++;
		if(gbv_adc_Sample_Mode==0)
		{
			//�G��ǰ���P����
			if(gu8v_Sample_Count>3)
			{
				gu8v_Sample_Count=0;
				gbv_adc_Sample_Mode = 1;

			}
		}
		else if(gbv_adc_Sample_Mode==1)
		{	
			
		/*	#if(mac_Test_Mode)

			array_uart_txbuff[0] = 0x55;
			array_uart_txbuff[1] = 0x01;
			array_uart_txbuff[2] = 0x09;
			array_uart_txbuff[3] = 0x02;
			array_uart_txbuff[4] = gu32v_adc_data.byte.byte0;
			array_uart_txbuff[5] = gu32v_adc_data.byte.byte1;
			array_uart_txbuff[6] = gu32v_adc_data.byte.byte2;
			array_uart_txbuff[7] = 0X55+0X01+0X09+0X02+0XAA+gu32v_adc_data.byte.byte0+ \
									gu32v_adc_data.byte.byte1+gu32v_adc_data.byte.byte2;
			array_uart_txbuff[8] = 0XAA;
			gu8v_tx_guide=0;
			_txrrxr = array_uart_txbuff[0];

			#endif*/

			gbv_adc_success	= 1;
			gu8v_Sample_Count = 0;
			gbv_adc_Sample_Mode = 0;
				
		}	 
	}		
}

/********************************************************************
Function:	fun_ADC_NTC_Test
INPUT	:
OUTPUT	:	
NOTE	:   
********************************************************************/
void fun_ADC_NTC_Test()
{
	fun_TEMP1_INIT();
	while(1)
	{
		GCC_CLRWDT();//������T��	
		fun_ADC_Polling();
		
	}

}

/********************************************************************
Function:	fun_ADC_OP_Test
INPUT	:
OUTPUT	:	
NOTE	:   
********************************************************************/
void fun_ADC_OP_Test()
{
	fun_VTP_INIT();
//	mac_OPA_AN7_AN6();
	mac_OPA_AN7_AN4();
	while(1)
	{
		GCC_CLRWDT();//������T��	
		fun_ADC_Polling();
		
	}

}

