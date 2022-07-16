//*******************************************��������*******************************************//
/*��������΢�������޹�˾����ƣ���������΢���������ڸ����̿ɿ��ԡ����ܺ���Ʒ���ĸĽ�����һ��˵����Ȩ����
����ʹ�ñ������е���Ϣ�����ݶ����µ�ֱ�ӣ���ӣ��ر𸽴�������𺦣���������΢û��������
�������д����Ӧ�ý�����������������ʾ������˾����֤��Щ����û�и�����Ĳ��Ծ������á�
��������ʹ�õ����������������Ȩ���ܺ�Լ���Ϸ��ṩ�ģ�����ֻ������Щ��Լ�����������ʹ�û��߸��ơ�
��������΢�Ĳ�Ʒ����ר�������Ӧ��������ά�ֵ��þߣ�װ�û���ϵͳ����������΢�Ĳ�Ʒ��֧�ֶ��ҽ�ֹ����Щ�����Ӧ�á�
�������������б䶯ˡ������֪ͨ�����������Ϣ����ο���˾�ٷ���վwww.xjmcu.com��*/
//===================================================================================//
//��Ƶ��8M/4T
;AD���� -DEMO����˵����
;ADC2(P64)��ΪAD�����ڣ���׼��ѹѡ��VDD
;����3.3V��P62-LED��������3.3V��P62-led��
;��ѯ��ʽ�����ӳ���
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
;========================================================
;ADC����ͨ������,ADC��ʼ��
;======================================================== 
file_adcSet:
		//mov		a,@(data_ioc6Set+0b00010000)
		//iw		ioc6				;P64�����

		mov		a,@0b00000000		;bit5=0,ʹ���ڲ���׼
		mov		ADCON,a				;ADC ���ƼĴ���
		mov		a,@0b00010000		;ʱ��ѡ��Fosc/16,ͨ��P64,��׼��ѹVDD(Bit<2:0>000-VDD/001-4V/010-3V/011-2V/100-1.5V)	
		iw		ADCVS				;AD ͨ����׼��ѹ����Ƶѡ��Ĵ���
		mov		a,@0b01000000		;ADC2(P64)��Ϊģ�������
		iw		ADPS				;AD ������ʹ�ܼ�AD��4λ�Ĵ���
		btc		VFOE				;0:�ڲ���׼��ѹ�����ֹ��P65 ��Ϊ��ͨ IO 	
		bts		ADPD				;1:ADCʹ��,����ADCģ���Դ		
		ret	
;========================================================
;AD������ʼ
;======================================================== 		
file_adcStart:		
		bts		ADPD	   			;ʹ��ADC
		nop				 
		nop						 
		nop							;
		bts		ADRUN  	   			;��ʼADת��	              	
		jbtc	ADRUN				;wait	
		jmp		$-1					;ת������  
;============������������ȡADֵ	=====================	
file_readAd:
		ir		ADPS				;��ȡAD��4λ
		and		a,@0x0f				;bit3-bit0
		mov		reg_adcBuff_H,a		;
		ir		ADATL				;��ȡAD��8λ
		mov		reg_adcBuff_L,a		;ȡ�õ�ADC��ֵ == RegADCBuff2 | reg_adcBuff_L (12Bit - ADC)
;===============================================;//	�ж��Ƿ���Ҫʹ��ADC���	
		jbtc	bit_adcDeal_Enable	;
		jmp		file_adcData_deal	;		
		bts		bit_adcDeal_Enable	;ʹ�����ݴ���
		clr		reg_adcData_L		;��һ�β�����ȷ�����мĴ������ǿյ�
		clr		reg_adcData_H		;16Bit���ݼĴ���			
		clr		reg_AdCnt			;�ۼӼĴ���	8Bit
		jmp		file_adcStart		;��ʼ����ADC	
;===========ADC�ۼ�����=====================;
file_adcData_deal:	
		mov		a,reg_adcBuff_L		;ADL
		ADD		reg_adcData_L,a		;reg_adcData_L + ADL--> reg_adcData_L
		jbtc	c					;C = 1/0	reg_adcData_L + ADL < 256	
		inc		reg_adcBuff_H		;reg_adcBuff_H+1 if= 0 -> goto $+1	16λ����ֻ����12λ
		mov		a,reg_adcBuff_H		;ADH - A		
		add		reg_adcData_H,a		;	
;===========ADC��16���ۼӺ�ȡƽ��===========;				
file_adcData_deal_lop:					;�洢16������
		inc		reg_AdCnt			;if(++reg_AdCnt < 256) return;
		mov		a,@16		
		sub		a,reg_AdCnt			;
		jbts	c					;
		jmp		file_adc_start_ret;file_adcStart;		 
		clr		reg_AdCnt			;�ۼ���16
			
		btc		c
		rcr		reg_adcData_H		;����4��
		rcr		reg_adcData_L		;
		btc		c
		rcr		reg_adcData_H		 
		rcr		reg_adcData_L		 
		btc		c
		rcr		reg_adcData_H		 
		rcr		reg_adcData_L		 
		btc		c
		rcr		reg_adcData_H		 
		rcr		reg_adcData_L		;ȡ16��ƽ��
		btc		bit_adcDeal_Enable	;ADC�������
;------------��ѹ���ж�-------------------- 
;if	adc <= 2730(0x0aaa)  2730*5V/4096=3.3V	С��3.3VǷѹ������3.3V���� 
file_adc_deal:
		mov		a,@0x0a				; 	
		sub		a,reg_adcData_H		; 
		jbts	z					; 
		jmp		file_jugde_adc 		; 
		mov		a,@0xaa 			; 
		sub		a,reg_adcData_L		; 
file_jugde_adc:										; 
		jbts	c					; 
		jmp		file_adcV_low		; <3.3v 
file_adcV_hig:;���ڵ���3.3V
		clr		reg_ad_low_cnt
		inc		reg_ad_hig_cnt
		mov		a,@50
		sub		a,reg_ad_hig_cnt
		jbts	c
		jmp		file_adc_start_ret
		clr		reg_ad_hig_cnt
		
		btc		bit_lowV			;��Ƿѹ��־λ
		btc		io_ledOut
		jmp		file_adc_start_ret
file_adcV_low:;����3.3V
		clr		reg_ad_hig_cnt
		inc		reg_ad_low_cnt
		mov		a,@50
		sub		a,reg_ad_low_cnt
		jbts	c
		jmp		file_adc_start_ret
		clr		reg_ad_low_cnt
		
		bts		bit_lowV			;��Ƿѹ��־λ
		bts		io_ledOut
		jmp		file_adc_start_ret 
file_adc_start_ret:
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
		mov		a,@0x18				;P6�ڷ���Ĵ�����P64��Ϊ����ڣ�AD����
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
		call	file_adcSet			;AD��������
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
		call	file_adcStart	;AD����
		jmp		main			;���������� 






