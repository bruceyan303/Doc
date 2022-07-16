//*******************************************��������*******************************************//
/*��������΢�������޹�˾����ƣ���������΢���������ڸ����̿ɿ��ԡ����ܺ���Ʒ���ĸĽ�����һ��˵����Ȩ����
����ʹ�ñ������е���Ϣ�����ݶ����µ�ֱ�ӣ���ӣ��ر𸽴�������𺦣���������΢û��������
�������д����Ӧ�ý�����������������ʾ������˾����֤��Щ����û�и�����Ĳ��Ծ������á�
��������ʹ�õ����������������Ȩ���ܺ�Լ���Ϸ��ṩ�ģ�����ֻ������Щ��Լ�����������ʹ�û��߸��ơ�
��������΢�Ĳ�Ʒ����ר�������Ӧ��������ά�ֵ��þߣ�װ�û���ϵͳ����������΢�Ĳ�Ʒ��֧�ֶ��ҽ�ֹ����Щ�����Ӧ�á�
�������������б䶯ˡ������֪ͨ�����������Ϣ����ο���˾�ٷ���վwww.xjmcu.com��*/
//===================================================================================//
//��Ƶ��8M/4T
;�˿�״̬�İ滽��(P6��)-DEMO����˵����
;P63�Ӱ���,�͵�ƽ��Ч,�ⲿ������P62��LED���ߵ�ƽ��Ч
;�ϵ�˯�ߣ�P63��һ��,LED��;�ٰ�һ��,LED��,˯��,���ѭ��
;�����ö˿ڶ�������
;1ms��һ��TCC�ж�,P60ȡ��
;����˯�ߵ���0.3uA@3.7v
//===================================================================================//
//==============================================================================
//ͷ�ļ�	����ͷ�ļ�	ͨ�üĴ��������ļ�
//==============================================================================
		include "XC8P8600.ASH"
		include "XJ_8600Define.h"
//==============================================================================
//��ڵ�ַ	������ڵ�ַ	�ж���ڵ�ַ
//==============================================================================
		org		0x00
		jmp		file_start			//������ڵ�ַ
		org		0x08			
		jmp		file_Interrupt		//�ж���ڵ�ַ
;==============================================================================
;�жϺ���
;==============================================================================
file_Interrupt:
		mov		A_BUFF,A
		swap	A_BUFF
		swapa	R3
		mov		R3_BUFF,A		//�ж���ջ����

		di 
		jbts	TCIF
		jmp		file_Interrupt_ret
;---------TCC��ʱ�ж�------------
file_intTCC:	
		mov		a,@0x0e			//ISR��bit0:TCIF����
		mov		isr,a
		
		mov		a,@0x01				;P60�����ȡ��		 
		xor		port6,a		
		
		bts		bit_end1ms		
		mov     a,@data_tcc			;��ʱ������ֵ 
		add		tcc,a 				;
		jmp		file_Interrupt_ret	;
file_Interrupt_ret:
		swapa	R3_BUFF
		mov		R3,A
		swapa	A_BUFF				//�жϳ�ջ�����ָ�
		reti 
;==============================================================================
;�������
;============================================================================== 
file_scanKey: 
		jbts	io_key				 
		jmp		file_keyLow		 
;------------------------------------------
file_keyHig:;��������
		jbts	bit_keyPress
		clr		reg_keyCont
		jmp		file_key_lvbo		;ȥ��
file_keyLow:;��������
		jbtc	bit_keyPress
		clr		reg_keyCont
;------------------------------------------
file_key_lvbo:
		inc		reg_keyCont
		mov		a,@10
		sub		a,reg_keyCont
		jbts	c
		jmp		file_scanKey_ret
		clr		reg_keyCont			;�˲�����
		
		jbts	io_key
		bts		bit_keyPress		;�ð������±�־λ
		jbtc	io_key
		btc		bit_keyPress		;�尴�����±�־λ
file_scanKey_ret:
		ret
;================================================ 
;��������
;��һ�£�led�����ٰ�һ��led��
;================================================ 
file_keyDeal:
		jbts	bit_keyPress
		jmp		file_keyPop_bc
;--------------------------------------------   
file_keyPress_do:	;����ִ��		
		jbtc	bit_keyPress_deal	;ִ�б�־λ
		jmp		file_keyDeal_ret
		bts		bit_keyPress_deal 
		;---------------------------
		jbts	bit_modeOpen
		jmp		file_lastOff
file_lastOn:;�ϴο�������ιػ�
		btc		bit_modeOpen
		btc		io_ledOut
		jmp		file_keyDeal_ret
file_lastOff:;�ϴιػ�����ο���
		bts		bit_modeOpen
		bts		io_ledOut
		jmp		file_keyDeal_ret 
;--------------------------------------------   
file_keyPop_bc:		 
		btc		bit_keyPress_deal 
file_keyDeal_ret:
		ret	
;================================================		
;================================================
;˯���ӳ���
;================================================ 			
file_sleep:		
;------------˯���ж�-------------------------		
		jbtc	bit_keyPress		;��������
		jmp		file_sleep_qudou
		jbts	io_key				;�����˿�Ϊ�ߵ�ƽ
		jmp		file_sleep_qudou
		jbtc	bit_modeOpen		;�ػ�״̬
		jmp		file_sleep_qudou
;------------˯���˲�------------------------
		inc		reg_timeSleep		;//	
       	mov		a,@250
       	sub		a,reg_timeSleep	  	;//
       	jbts	c
       	jmp		file_sleep_ret		;//
       	clr		reg_timeSleep		;//  

		mov		a,@0b00001000		//�� OPTION ѡ� P6 �˿ڻ��ѡ� Ϊ���������ƣ��Ĵ���Ϊ 0x0D���� ʱ��Ч
		mov		ICIECR,a  

		btc		port6,1
;------------˯��ִ��------------------------
file_sleep_loop:
		cwdt					;��WDT
		clr		tcc				;clr TCC

		mov	 	a,@0X00			;�رտ��Ź�
		iw		ioce

		clr    	isr				;���жϱ�־λ	
		di
		mov		a,@0X02			;Bit<1>:ICIE-P6 �˿�״̬�ı��ж�ʹ�ܿ���
		iw		iocf		  
	//	mov		port6,port6		;��PORT6��״̬
		sleep					;����˯��
		nop
		nop
		nop
		nop
		cwdt					;��WDT
;------------˯�߻���-----------------------	
file_sleepWake:           
		mov		a,@data_contw	;����TCCԤ��Ƶ 
		ctw		
		mov		a,@0x00			;
		iw		ioce		
		mov		a,@0x01			; ����TCC�ж�    
		iw		iocf
		mov		a,@data_tcc		;��ֵ 
		mov     tcc,a
		ei						;�����ж�              
		clr     isr				;���жϱ�־λ		
file_sleep_qudou:
		clr		reg_timeSleep	;
file_sleep_ret:
		ret	
;==============================================================================
;��ʼ������
;==============================================================================		
file_init:
		mov		a,@data_tcc
		mov		tcc,a
		mov		a,@data_contw		;Ԥ��Ƶ�������TCC��bit5Ϊ0ʱP62��������ͨIO��
		ctw							;��Ƶ��Ϊ1:8
		clr		port6	 
		mov		a,@0x08				;P6�ڷ���Ĵ���
		iw		ioc6				;1:���룬0:���  
		mov		a,@0xff				;bit4~bit6��ӦP60~P62	
		iw		iocb				;�����Ĵ�����0ʹ��
		mov		a,@0xff				;bit0~bit7��ӦP60~P67
		iw		iocd				;�����Ĵ�����0ʹ��
		mov		a,@0x00				;bit7�����Ź�ʹ��λ��1ʹ��
		iw		ioce				;bit6��P60���ܿ���λ��0:��ͨIO�ڡ�1:�ⲿ�жϿ�
		mov		a,@0x01				;�ж����μĴ�����1ʹ��Tcc�ж�
		iw		iocf				;bit0��ӦTCC�жϣ�bit1��Ӧ�����ƽ�仯�жϣ�bit2��Ӧ�ⲿ�ж�			
		clr		isr					;�жϱ�־�Ĵ���
		ret	 	
;==============================================================================
; ��ʼ������ 
;==============================================================================  
file_start: 
    	M8600CLRRAMBANK				;�ϵ縴λ,��RAM
     	call	file_init			;���ƼĴ�����ʼ��
     	jmp		main  

;==============================================================================
;������
;============================================================================== 
main:
		ei						;�����ж�  
		cwdt  
		jbts	bit_end1ms
		jmp		main
		btc		bit_end1ms
		call	file_scanKey	;����ɨ��
		call	file_keyDeal	;��������
		call	file_sleep		;˯���ж�
		jmp		main			;���������� 






