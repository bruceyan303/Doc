
/*************************************************************************************/
//**	Copyright	:	2016 BY HOLTEK SEMICONDUCTOR INC                            **
//** 	File Name   :	main.c 	       	                                            **
//**	Description	: 																**
//**	MCU      	: 	HT67F5652													**
//**	Author   	: 	Leo															**
//**	Date     	: 	2016/10/28													**
//**	Version  	: 	V00															**
//**	History  	:																**
/*************************************************************************************/
#include "..\User\Config.h"


volatile	U8	gu8v_halt_time;
volatile	U8	gu8v_10ms_count;
volatile	U8	gu8v_10ms_count_2;
volatile	__byte_type	gu8v_sys_status;


/********************************************************************
Function:	main
INPUT	:
OUTPUT	:	
NOTE	:   �������
********************************************************************/

void main()
{
	//�Д��Ƿ�����늏�λ������������r�µķ�������λ
	//��������t������늳�ʼ����������֮�t����WDT�����ʼ��
	if(_to ==0 || _pdf ==0)									//WDT	Reset
	{	//��늏�λ������������r�µķ�������λ
		fun_Ram_Init();										//CLR RAM 		
		fun_Sys_Init();										//Sys & IO	
		fun_Reset_Init();									//Power On Reset
	}
	else													
	{	//WDT �����λ
		fun_Reset_Init();
	}	

	fun_Init_PowerOn();


	#if(mac_Test_Mode)
	fun_Test_Function();
	#endif


	while(1)
	{	
		
		GCC_CLRWDT();//������T��
		
		if(gu8v_halt_time<mac_Halt_Count)	//�Д��Ƿ�Ҫ�M��˯�����L�r�g�� 2min
		{
			if(gbv_10ms)					//10ms ѭ�h
			{
				gbv_10ms = 0;
				
				fun_SysTime_Count();		// ϵͳʱ��ɨ��				
				fun_Key_Scan();				//���I����
				fun_Work_mode();			//�������̿���
				fun_Beep_work_mode();		//���Q������

				//������Iλ ���ڹ������̿��ƿ�ʹ��gbv_500ms���ɴ˵ط��yһ���
				//------------------------------------------------------------
					gbv_500ms = 0;
					gu8v_KeyUp.U8 = 0;
				//------------------------------------------------------------

			}
			
			fun_ADC_Polling();	//ADC ݆ԃ����
		}
		else
		{
			fun_into_halt();	//�M�����ߠ�B
		}
	}
}



/********************************************************************
Function:	fun_into_halt
INPUT	:
OUTPUT	:	
NOTE	:   ˯�߳������
********************************************************************/
void	fun_into_halt()
{
//	U8 i;

	_wdtc = 0b10101111;			// disable WTC
	
	fun_ADC_Disable();			// disable ADC
	fun_ADC_Power_Disable();	// disable ADC Power	
	mac_TM0_OFF();				// disable TM0
	mac_Beep_Low();				// disable Beep
	fun_LCD_FULL(00);			// LCD ȫ��	
	mac_LCD_Disable();			// disable LCD
	mac_LED_DisLight();			// disable LED 

	GCC_HALT();					//�M��˯��	
	
	_wdtc = 0b01010111;			// enable WTC

//������Iλ 
//------------------------------------------------------------//
	gu8v_key_enable = 0;
	gu8v_key_old    = 0;
	gu8v_halt_time = 0;
	gu8_ntc_mode = 0;
	gu16v_current_temp.S16 = 0;	
	gu8v_display_mode_old = gu8v_dispaly_mode.U8;
	gu8v_EEprom_Count = 0;
//------------------------------------------------------------//

	fun_Reset_Init();
	mac_LED_G_Light();	
	fun_Beep_init(mac_beep_1);
	fun_LCD_FULL(0x0f);

}

/********************************************************************
Function:	fun_SysTime_Scan
INPUT	:
OUTPUT	:	
NOTE	:   ϵ�y�r�Ӌ����10msӋ�rһ�Σ�
********************************************************************/
void	fun_SysTime_Count()
{	
	// 500msӋ��
	gu8v_10ms_count ++;
	if(gu8v_10ms_count >=50)
	{
		gu8v_10ms_count = 0;
		gbv_500ms = 1;
		gbv_500ms_reversal = ~gbv_500ms_reversal;
		gu8v_halt_time ++;
	}
	// 1SӋ��
	gu8v_10ms_count_2++;
	if(gu8v_10ms_count_2 >= 100)
	{
		gu8v_10ms_count_2 = 0;
		gbv_1s = 1;
	}
}

/********************************************************************
Function:	fun_Test_Function
INPUT	:
OUTPUT	:	
NOTE	:   ���ܜyԇ
********************************************************************/
void	fun_Test_Function()
{	

	fun_LCD_Test();
//	fun_Uart_Test();
	//fun_ADC_NTC_Test();
	fun_ADC_OP_Test();
	//fun_Time_Test();

	

	while(1)
	{
		GCC_CLRWDT();	//������T��
		if(gbv_10ms)	//10ms ѭ�h
	    {
			gbv_10ms = 0;
	        if(fun_get_VTP())
	        {
	        	gu16v_adc_vtp.S16 = gu16v_adc_vtp.S16  + 100;
	        array_uart_txbuff[0] = 0x55;
	        array_uart_txbuff[1] = 0x55;
	        array_uart_txbuff[2] = 0x55;
	        array_uart_txbuff[3] = 0x55;
	        array_uart_txbuff[4] = 0x55;
	        array_uart_txbuff[5] = 0x55;
	        array_uart_txbuff[6] = 0x55;
	        array_uart_txbuff[7] = 0x55;
	        
	        
	        
		       	array_uart_txbuff[0] = 0x55;
		       	array_uart_txbuff[1] = 0x01;
		       	array_uart_txbuff[2] = 0x09;
		       	array_uart_txbuff[3] = 0x02;
		       	array_uart_txbuff[4] = gu16v_adc_vtp.byte.byte0;
				array_uart_txbuff[5] = gu16v_adc_vtp.byte.byte1;
				array_uart_txbuff[6] = 0; 
				array_uart_txbuff[7] = 0X55+0X01+0X09+0X02+0XAA+gu16v_adc_vtp.byte.byte0+ \
									gu16v_adc_vtp.byte.byte1+array_uart_txbuff[6];
		       	array_uart_txbuff[8] = 0XAA;
		       	gu8v_tx_guide=0;
		       	_txr_rxr = array_uart_txbuff[0];
		       //	GCC_DELAY(100000);GCC_DELAY(100000);GCC_DELAY(100000);GCC_DELAY(100000);GCC_DELAY(100000);
		       	// 	GCC_DELAY(100000);GCC_DELAY(100000);GCC_DELAY(100000);GCC_DELAY(100000);GCC_DELAY(100000);
	        }
		}
		fun_ADC_Polling();	//ADC ݆ԃ����
	}
}


