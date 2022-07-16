//=================================================================//
//								IOC页寄存器						   //
//=================================================================//
	//	IOCP_W(P6CR ,0x00)
	//	IOCP_W(ADCVS,0x00)
	//	IOCP_W(ADATH,0x00)
	//	IOCP_W(PHDCR,0x08)
	//	IOCP_W(ADPS ,0x08)
	//	IOCP_W(PDCR ,0x08)
	//	IOCP_W(ADATL,0x08)
	//	IOCP_W(PHCR ,0x08)
	//	IOCP_W(WDTCR,0x08)
	//	IOCP_W(IMR  ,0x08)
//=================================================================//
//								端口定义						   //
//=================================================================//
#define IOKey1 PORT6_3

//=================================================================//
//								变量定义						   //
//=================================================================//


unsigned char RegADCDang;


                                                  

//=================================================================//
//								位定义								//
//=================================================================//
typedef union {
	struct {
		unsigned char Brm_0:1;
		unsigned char Brm_1:1;
		unsigned char Brm_2:1;
		unsigned char Brm_3:1;	
		unsigned char Brm_4:1;
		unsigned char Brm_5:1;
		unsigned char Brm_6:1;
		unsigned char Brm_7:1;		
	};
} Brm8;
//extern volatile __ISRbits_t __at(ISR_ADDR) ISRbits;
Brm8 BIT_FLAG;
#define BitTCCEnable    BIT_FLAG.Brm_0   		/* bit 0 */
#define BitADCEnable  	BIT_FLAG.Brm_1     		/* bit 1 */
#define BitLvBo         BIT_FLAG.Brm_2          /* bit 2 */
#define bitsleep        BIT_FLAG.Brm_3 			/* bit 3 */
#define BitKey1			BIT_FLAG.Brm_4    		/* bit 4 */
//#define EEE			BIT_FLAG.Brm_5    		/* bit 5 */
//#define TTT			BIT_FLAG.Brm_6    		/* bit 6 */          
//#define YYY			BIT_FLAG.Brm_7   		/* bit 7 */

//=================================================================//
//								中断保护定义		    			 //
//=================================================================//
#define PUSH(A_REG,R3_REG)	__asm__("mov "#A_REG",a\n swap "#A_REG"\n swapa STATUS\n mov "#R3_REG",a")	//中断入栈保护	
#define POP(A_REG,R3_REG)	__asm__("swapa "#R3_REG"\n mov STATUS,a\n swapa "#A_REG)					//中断出栈保护恢复

volatile __at(0x10) unsigned char A_BUFF;		//中断ACC保护RAM
volatile __at(0x11) unsigned char R3_BUFF;		//中断STATUS保护RAM
