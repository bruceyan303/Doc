/**********************************************************************/
/**********************��������΢�������޹�˾**************************/
/**********************��Ŀ: ���ඨ��ͷ�ļ�****************************/
/**********************���: Tina          ****************************/
/**********************ʱ��: 2022.01.07    ****************************/
/**********************************************************************/             
/*;        __________
;         |          |
; VCC  ---|VCC   GND |---  VSS
;      ---|P65   P60 |---  
;      ---|P64   P61 |---  
;      ---|P63   P62 |---  
;         |__________|*/
//************************************/
//-----------ָ���---------------- 
//************************************/
#define EI()  __asm__(" ei ")
#define DI()  __asm__(" di ")
#define NOP() __asm__(" nop ")
#define CWDT() __asm__(" CWDT ")
#define SLEEP() __asm__(" sleep ")
/************************************/
//-----------�Ĵ�����дʾ��----------  
/************************************/
#define CONTW(VAL)			__asm__("mov a,@"#VAL"\n ctw")			//CTW = VAL��CONT�Ĵ�����ֵ
#define IOCP_W(REG,VAL)		__asm__("mov a,@"#VAL"\n iw "#REG)		//REG = VAL��IOCҳ�Ĵ�����ֵ
#define IOCP_R(RAM,REG)		__asm__("ir "#REG"\n mov "#RAM",a")		//RAM = REG��IOCҳ�Ĵ�����ֵ

#define IOCP_W_AND(REG,VAL) __asm__("ir "#REG"\n and a,@"#VAL"\n iw "#REG)
#define IOCP_W_OR(REG,VAL)  __asm__("ir "#REG"\n or a,@"#VAL"\n iw "#REG)

#define PUSH(A_REG,R3_REG)	__asm__("mov "#A_REG",a\n swap "#A_REG"\n swapa STATUS\n mov "#R3_REG",a")	//�ж���ջ����	
#define POP(A_REG,R3_REG)	__asm__("swapa "#R3_REG"\n mov STATUS,a\n swapa "#A_REG)					//�жϳ�ջ�����ָ�
/****************************************/
// ---------���ݶ���--------------------
/****************************************/ 
#define	data_tcc 6			//;�ӵ�256���,1ms��һ���ж� 
/****************************************/
// --------�˿ڶ���--------------------
/****************************************/ 
#define io_ledOut	 PORT6_0  
#define io_led2Out   PORT6_1  
#define io_key       PORT6_3  
/****************************************/
// ---------�Ĵ�������--------------------
/****************************************/ 
volatile __at(0x10) unsigned char A_BUFF;		//�ж�ACC����RAM
volatile __at(0x11) unsigned char R3_BUFF;		//�ж�STATUS����RAM
//volatile unsigned char reg_keyCont;	
//=================================================================//
//				�Ĵ�������						   //
//=================================================================//
//unsigned char reg_keyCont;
unsigned char reg_sleep_cnt;
//=================================================================//
//				λ����								//
//=================================================================//
/*extern typedef union{
struct {    
        unsigned  b0         : 1; 
        unsigned  b1         : 1; 
        unsigned  b2         : 1; 
        unsigned  b3         : 1;
        unsigned  b4         : 1; 
        unsigned  b5         : 1;
        unsigned  b6         : 1; 
        unsigned  b7         : 1;
        }; 
        
}bit8; //ֻ��λ���� ob8 flag;	define flag0 flag.b0 
//=====================================================================================
extern typedef union{
struct {    
        unsigned  b0         : 1; 
        unsigned  b1         : 1; 
        unsigned  b2         : 1; 
        unsigned  b3         : 1;
        unsigned  b4         : 1; 
        unsigned  b5         : 1;
        unsigned  b6         : 1; 
        unsigned  b7         : 1;
        }oneBit;   
       unsigned char allBit;    
}reg8; //��λ������Ҳ���ֽڲ��� reg8 flag_key; flag_key.allBit = 0;ȫ���
//=====================================================================================
//��־λ����
		bit8	flag_mode;
#define			bit_modeOpen		flag_mode.b0 

		reg8	flag_key;
#define			bit_keyPress		flag_key.oneBit.b0 	
#define			bit_keyPress_deal	flag_key.oneBit.b1 	*/

