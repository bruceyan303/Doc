#ifndef _Timer_H_
#define _Timer_H_

/********************************************************************
DEFINE:	
********************************************************************/
#define	Def_time0_is_count_mode
#ifdef	Def_time0_is_count_mode
	#define	LU8C_TM0C0	0b00101000	//ͨ�^��׃bit4-6�ɸ�׃Ӌ���r犣���ǰ�O�Þ�FH/16  enable	timer0 TnON = 1;
	#define	LU8C_TM0C1	0b11000001	//Ӌ��ģʽ���ñ��^��Aƥ��ģʽ����ͨ�^�O��_tm0al_tm0ah�M��timer�r�g���O��;
	#define	LU8C_TM0A	61			//timer �r�gӋ�� 16*LU8C_TM0A/FH
	#define	LU8C_TM0AL	LU8C_TM0A%256	
	#define	LU8C_TM0AH	LU8C_TM0A/256
#else


#endif

#define	Def_timer0_interrupt

/********************************************************************
Function:	volatile
********************************************************************/				

#define mac_TM0_ON()	{_t0on = 1;}
#define mac_TM0_OFF()	{_t0on = 0;}


extern	volatile			__byte_type	gu8v_time_flag;
#define gbv_10ms 			gu8v_time_flag.bits.b0
#define gbv_100ms			gu8v_time_flag.bits.b1
#define gbv_250ms 			gu8v_time_flag.bits.b2
#define gbv_500ms	 		gu8v_time_flag.bits.b3
#define gbv_1s				gu8v_time_flag.bits.b4
#define gbv_500ms_reversal	 	gu8v_time_flag.bits.b5
#define gu8v_time_flag6 	gu8v_time_flag.bits.b6
#define gu8v_time_flag7 	gu8v_time_flag.bits.b7

extern	volatile			U8	gu8v_250ms_count;
//extern volatile				U8	gu8v_10ms_count;
/********************************************************************
Function:	
********************************************************************/
void	fun_TIMER0_INIT();
void 	fun_Time_Test();
#endif