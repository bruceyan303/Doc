
#ifndef _ADC_H_
#define _ADC_H_

extern	volatile	U8 	gu8v_Sample_Count ;	
extern	volatile	U16	gu16v_adc_buff[11];

volatile	static	__32_type	gu32v_adc_data		__attribute__ ((at(0x280)));	
volatile	static	__16_type	gu16v_adc_vtp		__attribute__ ((at(0x284)));	
volatile	static	__16_type	gu16v_adc_res		__attribute__ ((at(0x286)));	
//volatile	static	__16_type	gu16v_adc_res2		__attribute__ ((at(0x288)));	
//volatile	static	__16_type	gu16v_adc_res_buff	__attribute__ ((at(0x28a)));	
volatile	static	__16_type	gu16v_temp			__attribute__ ((at(0x28c)));	
volatile	static	__16_type	gu16v_vtp			__attribute__ ((at(0x28e)));
volatile	static	__16_type	gu16v_vtp_buff		__attribute__ ((at(0x290)));
//volatile	static	__16_type	vsen				__attribute__ ((at(0x292)));
volatile	static	__16_type	gu16v_current_temp	__attribute__ ((at(0x294)));
volatile	static	__16_type	gu16v_body_temp		__attribute__ ((at(0x2a0)));
volatile	static	__16_type	gu16v_adc_max		__attribute__ ((at(0x298)));
volatile	static	__16_type	gu16v_vtp_buff2		__attribute__ ((at(0x296)));
volatile	static	__16_type	gu16v_adc_min		__attribute__ ((at(0x29a)));
volatile	static	__32_type	gu32v_adc_sum		__attribute__ ((at(0x29c)));



void 	fun_ADC_Polling();
void 	fun_ADC_Enable();
void 	fun_ADC_Disable();
void 	fun_VTP_INIT();
void 	fun_TEMP1_INIT();
void 	fun_TEMP2_INIT();
void 	fun_BAT_INIT();
void 	fun_ADC_Power_Enable();
void 	fun_ADC_Power_Disable();

void	fun_ADC_NTC_Test();
void	fun_ADC_OP_Test();
//	|--------------------------------------------------------------------------|
//	|------------------------------_pwrc  -------------------------------------|
//	|BIT	|7		|6		|5		|4		|3		|2		|1		|0	   ----|		
//	---------------------------------------------------------------------------|
//	|Name	|ENLDO	|ENVCM	|��		|��		|��		|��		|TnRP1	|LDOVS0 ---|
//	Bit 7 ENLDO��LDO 
//		0������1��ʹ��
//	Bit 6~3 δ���x���x�顰0��
//	Bit 2 LDO Bypass
//	Bit 1~0 LDOVS1~LDOVS0��LDO ݔ��늉��x��λ
//		00��2.4V 01��2.6V 10��2.9V 11��3.3V	
#define		mac_SET_AVDD_2_4()			_ldovs1 = 0;_ldovs0 = 0;
#define		mac_SET_AVDD_2_6()			_ldovs1 = 0;_ldovs0 = 1;
#define		mac_SET_AVDD_2_9()			_ldovs1 = 1;_ldovs0 = 0;
#define		mac_SET_AVDD_3_3()			_ldovs1 = 1;_ldovs0 = 1;


//	|--------------------------------------------------------------------------|
//	|------------------------------_pgac0 -------------------------------------|
//	|BIT	|7		|6		|5		|4		|3		|2		|1		|0	   ----|		
//	---------------------------------------------------------------------------|
//	|Name	|��		|VGS1	|VGS0	|AGS1	|AGS0 	|PGS2	|PGS1	|PGS0 	---|
// Bit 7 δʹ�ã��x�顰0��
// Bit 6~5 VGS1~VGS0��VREF �����x��λ
// 	00��1	01��1/2	10��1/4	11������
// Bit 4~3 AGS1~AGS0��ADC �����x��λ
// 	00��1	01��2	10��4	11��8
// Bit 2~0 PGS2~PGS0��PGA �����x��λ
// 	000��1	001��2	010��4	011��8	
// 	100��16	101��32	110��64	111��128
#define		mac_SET_VGS_0()				_vgs1 = 0;_vgs0 = 0;
#define		mac_SET_VGS_1C2()			_vgs1 = 0;_vgs0 = 1;
#define		mac_SET_VGS_1C4()			_vgs1 = 1;_vgs0 = 0;

#define		mac_SET_AGS_1()				_ags1 = 0;_ags0 = 0;
#define		mac_SET_AGS_2()				_ags1 = 0;_ags0 = 1;
#define		mac_SET_AGS_4()				_ags1 = 1;_ags0 = 0;
#define		mac_SET_AGS_8()				_ags1 = 1;_ags0 = 1;

#define		mac_SET_PGA_x1()			_pgs2 = 0;_pgs1 = 0;_pgs0 = 0;
#define		mac_SET_PGA_x2()			_pgs2 = 0;_pgs1 = 0;_pgs0 = 1;
#define		mac_SET_PGA_x4()			_pgs2 = 0;_pgs1 = 1;_pgs0 = 0;
#define		mac_SET_PGA_x8()			_pgs2 = 0;_pgs1 = 1;_pgs0 = 1;
#define		mac_SET_PGA_x16()			_pgs2 = 1;_pgs1 = 0;_pgs0 = 0;
#define		mac_SET_PGA_x32()			_pgs2 = 1;_pgs1 = 0;_pgs0 = 1;
#define		mac_SET_PGA_x64()			_pgs2 = 1;_pgs1 = 1;_pgs0 = 0;
#define		mac_SET_PGA_x128()			_pgs2 = 1;_pgs1 = 1;_pgs0 = 1;



//	|--------------------------------------------------------------------------|
//	|------------------------------_pgac1 -------------------------------------|
//	|BIT	|7		|6		|5		|4		|3		|2		|1		|0	   ----|		
//	---------------------------------------------------------------------------|
//	|Name	|VCMS	|INIS	|��		|��		|DCSET2 |DCSET1	|DCSET0	|��	 	---|
//	Bit 7 VCMS��A/D�D�Q��ģ늉��x��λ
//		0��1.0V1��1.2V
//	Bit 6 INIS��IN1 ��IN2 ݔ����B�ӿ���λ
//	Bit 5~4 δʹ�ã��x�顰0��
//	Bit 3~1 DCSET2~DCSET0��DI+/DI- ���ݔ��ƫ���{��λ
//	Bit 0 δʹ�ã���0��
#ifndef		mac_Define_VCM

#define		mac_SET_VCM_1_0()			_vcms = 0;
#define		mac_SET_VCM_1_2()			_vcms = 1;

#endif

//	|--------------------------------------------------------------------------|
//	|------------------------------��_pgacs-------------------------------------|
//	|BIT	|7		|6		|5		|4		|3		|2		|1		|0	   ----|		
//	---------------------------------------------------------------------------|
//	|Name	|��		|��		|CHSN2	|CHSN1	|CHSN0	|CHSP2	|CHSP1	|CHSP0 	---|	  
//	Bit 7~6 δʹ�ã��x�顰0��
//	Bit 5~3 CHSN2~CHSN0��PGA ����ݔ����x��λ
//		000��AN1 001��AN3 010��AN5 011��AN7 100��DACO 101��OPO 110��VCM 111���ضȂ�����VTSOBit
//	Bit 2~0 CHSP2~CHSP0��PGA ����ݔ����x��λ
//		000��AN0 001��AN2 010��AN4 011��AN6 100��DACO 101��Unused 110��VCM 111���ضȂ�����VTSO+	
#define		mac_SET_ADC_AN0_VCM()		_pgacs = 0b00110000;
#define		mac_SET_ADC_AN2_VCM()		_pgacs = 0b00110001;
#define		mac_SET_ADC_AN1_VCM()		_pgacs = 0b00000110;
#define		mac_SET_ADC_AN4_VCM()		_pgacs = 0b00110010;
#define		mac_SET_ADC_AN5_VCM()		_pgacs = 0b00011110;


//	|--------------------------------------------------------------------------|
//	|------------------------------��_adcr0-------------------------------------|
//	|BIT	|7		|6		|5		|4		|3		|2		|1		|0	   ----|		
//	---------------------------------------------------------------------------|
//	|Name	|ADRST	|ADSLP	|ADOFF	|ADOR2	|ADOR1	|ADOR0	|��		|_vrefs ---|	     
//fmclk=4.1952MHz
//����=fmclk/(30*2*2048)=40Hz����25ms
// Bit 7 ADRST��ADC ܛ����λ����
// 	0������1��ʹ��
// Bit 6 ADSLP��ADC ����ģʽ����λ
// 	0������ģʽ	1������ģʽ
// Bit 5 ADOFF��ADC 
// 	0��ADC on 	1��ADC off
// Bit 4~2 ADOR2~ADOR0��ݔ��������ݔ�ʿ���
// 	000��OSR=16384
// 	001��OSR=8192
// 	010��OSR=4096
// 	011��OSR=2048
// 	100��OSR=1024
// 	101��OSR=512
// 	110��OSR=256
// 	111��OSR=128
// Bit 1 δ���x���x�顰0��
// Bit 0 VREFS���x��ADC ����늉�
// 	0���Ȳ�(VCM, AVSS)	1���ⲿ����늉�ݔ��(VREFP, VREFN)		
//4.9152MHz / (30��2��8192) = 10Hz��

#define	mac_SysClock	4




//======================================================================
#if(mac_SysClock == 4)

#define		mac_SET_ADC_SPEED_5HZ()		_ador2 = 0;_ador1 = 0;_ador0 = 0;\
										_flms2 = 0;_flms1 = 0;_flms0 = 0;
#define		mac_SET_ADC_SPEED_10HZ()	_ador2 = 0;_ador1 = 0;_ador0 = 1;\
										_flms2 = 0;_flms1 = 0;_flms0 = 0;
#define		mac_SET_ADC_SPEED_20HZ()	_ador2 = 0;_ador1 = 1;_ador0 = 0;\
										_flms2 = 0;_flms1 = 0;_flms0 = 0;
#define		mac_SET_ADC_SPEED_40HZ()	_ador2 = 0;_ador1 = 1;_ador0 = 1;\
										_flms2 = 0;_flms1 = 0;_flms0 = 0;
#define		mac_SET_ADC_SPEED_80HZ()	_ador2 = 1;_ador1 = 0;_ador0 = 0;\
										_flms2 = 0;_flms1 = 0;_flms0 = 0;
#define		mac_SET_ADC_SPEED_160HZ()	_ador2 = 1;_ador1 = 0;_ador0 = 1;\
										_flms2 = 0;_flms1 = 0;_flms0 = 0;
#define		mac_SET_ADC_SPEED_320HZ()	_ador2 = 1;_ador1 = 1;_ador0 = 0;\
										_flms2 = 0;_flms1 = 0;_flms0 = 0;
#define		mac_SET_ADC_SPEED_640HZ()	_ador2 = 1;_ador1 = 1;_ador0 = 1;\
										_flms2 = 0;_flms1 = 0;_flms0 = 0;

#endif
//======================================================================

//======================================================================
#if (mac_SysClock == 8)

#define		mac_SET_ADC_SPEED_10HZ()	_ador2 = 0;_ador1 = 0;_ador0 = 0;\
										_flms2 = 0;_flms1 = 0;_flms0 = 0;
#define		mac_SET_ADC_SPEED_20HZ()	_ador2 = 0;_ador1 = 0;_ador0 = 1;\
										_flms2 = 0;_flms1 = 0;_flms0 = 0;
#define		mac_SET_ADC_SPEED_40HZ()	_ador2 = 0;_ador1 = 1;_ador0 = 0;\
										_flms2 = 0;_flms1 = 0;_flms0 = 0;
#define		mac_SET_ADC_SPEED_80HZ()	_ador2 = 0;_ador1 = 1;_ador0 = 1;\
										_flms2 = 0;_flms1 = 0;_flms0 = 0;
#define		mac_SET_ADC_SPEED_160HZ()	_ador2 = 1;_ador1 = 0;_ador0 = 0;\
										_flms2 = 0;_flms1 = 0;_flms0 = 0;
#define		mac_SET_ADC_SPEED_320HZ()	_ador2 = 1;_ador1 = 0;_ador0 = 1;\
										_flms2 = 0;_flms1 = 0;_flms0 = 0;
#define		mac_SET_ADC_SPEED_640HZ()	_ador2 = 1;_ador1 = 1;_ador0 = 0;\
										_flms2 = 0;_flms1 = 0;_flms0 = 0;
#define		mac_SET_ADC_SPEED_1280HZ()	_ador2 = 1;_ador1 = 1;_ador0 = 1;\
										_flms2 = 0;_flms1 = 0;_flms0 = 0;
#endif										
//======================================================================
#if (mac_SysClock == 12)
//======================================================================
#define		mac_SET_ADC_SPEED_20HZ()	_ador2 = 0;_ador1 = 0;_ador0 = 0;\
										_flms2 = 0;_flms1 = 0;_flms0 = 0;
#define		mac_SET_ADC_SPEED_40HZ()	_ador2 = 0;_ador1 = 0;_ador0 = 1;\
										_flms2 = 0;_flms1 = 0;_flms0 = 0;
#define		mac_SET_ADC_SPEED_80HZ()	_ador2 = 0;_ador1 = 1;_ador0 = 0;\
										_flms2 = 0;_flms1 = 0;_flms0 = 0;
#define		mac_SET_ADC_SPEED_160HZ()	_ador2 = 0;_ador1 = 1;_ador0 = 1;\
										_flms2 = 0;_flms1 = 0;_flms0 = 0;
#define		mac_SET_ADC_SPEED_320HZ()	_ador2 = 1;_ador1 = 0;_ador0 = 0;\
										_flms2 = 0;_flms1 = 0;_flms0 = 0;
#define		mac_SET_ADC_SPEED_640HZ()	_ador2 = 1;_ador1 = 0;_ador0 = 1;\
										_flms2 = 0;_flms1 = 0;_flms0 = 0;
#define		mac_SET_ADC_SPEED_1280HZ()	_ador2 = 1;_ador1 = 1;_ador0 = 0;\
										_flms2 = 0;_flms1 = 0;_flms0 = 0;
#define		mac_SET_ADC_SPEED_2560HZ()	_ador2 = 1;_ador1 = 1;_ador0 = 1;\
										_flms2 = 0;_flms1 = 0;_flms0 = 0;
#endif
//======================================================================



#define		mac_SET_VRBUFF_EN()			_vrbufp = 1;_vrbufn = 1;
#define		mac_SET_VRBUFF_DIS()		_vrbufp = 0;_vrbufn = 0;										

//	|--------------------------------------------------------------------------|
//	|------------------------------_adcs --------------------------------------|
//	|BIT	|7		|6		|5		|4		|3		|2		|1		|0	   ----|		
//	---------------------------------------------------------------------------|
//	|Name	|�� 		|�� 		|�� 		|ADCK4	|ADCK3	|ADCK2	|ADCK1	|ADCK0	---|	
// Bit 7~5 δ���x���x�顰0��4~0 ADCK4~ADCK0���x��ADC�r�Դ(FMCLK)
// 	00000~11110��fSYS/2/(ADCK[4:0]+1)	11111��fSYS
// 
#define		mac_SET_ADC_CLOCK_FSYS()	_adcs = 0X1f;


//=====================
//		OP�O��
//=====================

//	|--------------------------------------------------------------------------|
//	|------------------------------_dsopc -------------------------------------|
//	|BIT	|7		|6		|5		|4		|3		|2		|1		|0	   ----|		
//	---------------------------------------------------------------------------|
//	|Name	|DSOPEN	|DSOPO	|DSOPBW	|---	|OPN1	|OPN0	|OPP1	|OPP0	---|

//	Bit 7 DSOPEN�� OPA ʹ�ܻ���ܿ���λ
//		0�� ����
//		1�� ʹ��
//	Bit 6 DSOPO�� OPA ���״̬λ ( ���߼���ƽ )
//	Bit 5 DSOPBW�� OPA �������λ
//		0�� 600kHz
//		1�� 2MHz
//	Bit 4 δ���壬 ��Ϊ��0��
//	Bit 3~2 OPN1~OPN0�� ��������� OPI- �����ź�ѡ��λ
//		00�� OPO
//		01�� AN3
//		10�� AN5
//		11�� AN7
//	Bit 1~0 OPP1~OPP0�� ��������� OPI+ �����ź�ѡ��λ
//		00�� AN0
//		01�� AN2
//		10�� AN4
//		11�� AN6
//

#define mac_OPA_AN7_AN6()	_dsopc = 0b10001111;
#define mac_OPA_AN7_AN4()	_dsopc = 0b10001110;






	

#endif

