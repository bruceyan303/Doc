/**********************************************************************/
/**********************无锡矽杰微电子有限公司**************************/
/**********************项目: 各类定义头文件****************************/
/**********************编程: Tina          ****************************/
/**********************时间: 2022.01.07    ****************************/
/**********************************************************************/             
/*;          __________ 
;   VCC---|VCC   GND |---VSS
;   AD3---|P65   P60 |---AD0/PWM3/INT0  
;   AD2---|P64   P61 |---PWM2/VREF
;      ---|P63   P62 |---AD1/PWM1/TCC  
;         |__________|*/
//************************************/
//-----------指令定义---------------- 
//************************************/
#define EI()  __asm__(" ei ")
#define DI()  __asm__(" di ")
#define NOP() __asm__(" nop ")
#define CWDT() __asm__(" CWDT ")
#define SLEEP() __asm__(" sleep ")
/************************************/
//-----------寄存器读写示例----------  
/************************************/
#define CONTW(VAL)			__asm__("mov a,@"#VAL"\n ctw")			//CTW = VAL：CONT寄存器赋值
#define IOCP_W(REG,VAL)		__asm__("mov a,@"#VAL"\n iw "#REG)		//REG = VAL：IOC页寄存器赋值
#define IOCP_R(RAM,REG)		__asm__("ir "#REG"\n mov "#RAM",a")		//RAM = REG：IOC页寄存器读值
#define PUSH(A_REG,R3_REG)	__asm__("mov "#A_REG",a\n swap "#A_REG"\n swapa STATUS\n mov "#R3_REG",a")	//中断入栈保护	
#define POP(A_REG,R3_REG)	__asm__("swapa "#R3_REG"\n mov STATUS,a\n swapa "#A_REG)					//中断出栈保护恢复
/****************************************/
// ---------数据定义--------------------
/****************************************/ 
#define	data_tcc 6			//;加到256溢出,1ms进一次中断 
/****************************************/
// --------端口定义--------------------
/****************************************/ 
#define io_ledOut	 PORT6_0  
#define io_led2Out   PORT6_1  
#define io_key       PORT6_3  
/****************************************/
// ---------寄存器定义--------------------
/****************************************/ 
volatile __at(0x10) unsigned char A_BUFF;		//中断ACC保护RAM
volatile __at(0x11) unsigned char R3_BUFF;		//中断STATUS保护RAM

//volatile unsigned char reg_keyCont;	
//=================================================================//
//				寄存器定义						   //
//=================================================================//
unsigned char reg_sleep_cnt;
/*unsigned char reg_keyCont;
unsigned char ADCDATA_COUNT;		//采样次数
unsigned char ADATH_TEMP,ADATL_TEMP;//采样高低位暂存
unsigned int  ADCDATA_TEMP;			//采样值暂存		
unsigned int  ADCDATA;				//最终采样值，平均值
unsigned int  ADCDATA_SUM;			//8次采样值总和
unsigned int  reg_contTime;*/
//=================================================================//
//				位定义								//
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
        
}bit8; //只能位操作 ob8 flag;	define flag0 flag.b0 
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
}reg8; //可位操作，也可字节操作 reg8 flag_key; flag_key.allBit = 0;全清除
//=====================================================================================
//标志位定义
		bit8	flag_mode;
#define			bit_modeOpen		flag_mode.b0 
#define			bit_end10ms			flag_mode.b1
#define			bit_end500ms		flag_mode.b2

		reg8	flag_key;
#define			bit_keyPress		flag_key.oneBit.b0 	
#define			bit_keyPress_deal	flag_key.oneBit.b1 	*/
