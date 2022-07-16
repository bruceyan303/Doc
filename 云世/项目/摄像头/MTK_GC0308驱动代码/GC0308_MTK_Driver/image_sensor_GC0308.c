/*****************************************************************************
 *  Copyright Statement:
 *  --------------------
 *  This software is protected by Copyright and the information contained
 *  herein is confidential. The software may not be copied and the information
 *  contained herein may not be used or disclosed except with the written
 *  permission of MediaTek Inc. (C) 2005
 *
 *  BY OPENING THIS FILE, BUYER HEREBY UNEQUIVOCALLY ACKNOWLEDGES AND AGREES
 *  THAT THE SOFTWARE/FIRMWARE AND ITS DOCUMENTATIONS ("MEDIATEK SOFTWARE")
 *  RECEIVED FROM MEDIATEK AND/OR ITS REPRESENTATIVES ARE PROVIDED TO BUYER ON
 *  AN "AS-IS" BASIS ONLY. MEDIATEK EXPRESSLY DISCLAIMS ANY AND ALL WARRANTIES,
 *  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF
 *  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE OR NONINFRINGEMENT.
 *  NEITHER DOES MEDIATEK PROVIDE ANY WARRANTY WHATSOEVER WITH RESPECT TO THE
 *  SOFTWARE OF ANY THIRD PARTY WHICH MAY BE USED BY, INCORPORATED IN, OR
 *  SUPPLIED WITH THE MEDIATEK SOFTWARE, AND BUYER AGREES TO LOOK ONLY TO SUCH
 *  THIRD PARTY FOR ANY WARRANTY CLAIM RELATING THERETO. MEDIATEK SHALL ALSO
 *  NOT BE RESPONSIBLE FOR ANY MEDIATEK SOFTWARE RELEASES MADE TO BUYER'S
 *  SPECIFICATION OR TO CONFORM TO A PARTICULAR STANDARD OR OPEN FORUM.
 *
 *  BUYER'S SOLE AND EXCLUSIVE REMEDY AND MEDIATEK'S ENTIRE AND CUMULATIVE
 *  LIABILITY WITH RESPECT TO THE MEDIATEK SOFTWARE RELEASED HEREUNDER WILL BE,
 *  AT MEDIATEK'S OPTION, TO REVISE OR REPLACE THE MEDIATEK SOFTWARE AT ISSUE,
 *  OR REFUND ANY SOFTWARE LICENSE FEES OR SERVICE CHARGE PAID BY BUYER TO
 *  MEDIATEK FOR SUCH MEDIATEK SOFTWARE AT ISSUE.
 *
 *  THE TRANSACTION CONTEMPLATED HEREUNDER SHALL BE CONSTRUED IN ACCORDANCE
 *  WITH THE LAWS OF THE STATE OF CALIFORNIA, USA, EXCLUDING ITS CONFLICT OF
 *  LAWS PRINCIPLES.  ANY DISPUTES, CONTROVERSIES OR CLAIMS ARISING THEREOF AND
 *  RELATED THERETO SHALL BE SETTLED BY ARBITRATION IN SAN FRANCISCO, CA, UNDER
 *  THE RULES OF THE INTERNATIONAL CHAMBER OF COMMERCE (ICC).
 *
 *****************************************************************************/

/*****************************************************************************
 *
 * Filename:
 * ---------
 *   image_sensor_GC0308.c
 *
 * Project:
 * --------
 *   MAUI
 *
 * Description:
 * ------------
 *   Image sensor driver function
 *
 * Author:
 * -------
 *   QH Geng (mtk70548)
 *
 *=============================================================
 *             HISTORY
 * Below this line, this part is controlled by PVCS VM. DO NOT MODIFY!!
 *------------------------------------------------------------------------------
 * 2011/03/16 Firsty Released By Mormo(using new driver structure).
 *
 * 2011/04/12 Updated by Mormo , change "GC0308_set_param_banding" function, change max exposure time for "//exp level 2".
 *
 *
 *------------------------------------------------------------------------------
 * Upper this line, this part is controlled by PVCS VM. DO NOT MODIFY!!
 *=============================================================
 ******************************************************************************/

#include "drv_features.h"
#include "drv_comm.h"
#include "gpio_sw.h"
#include "isp_if.h"
#include "camera_para.h"
#include "upll_ctrl.h"
#include "med_api.h"
#include "sensor_common.h"
#include "image_sensor.h"

#ifdef GC0308_HW_SCCB
#include "sccb_v2.h"
#else
#include "sccb.h"
#endif

#ifdef GC0308_LOAD_FROM_T_FLASH
#include "med_utility.h"
#include "fs_type.h"
#endif

static GC0308_FRAME_RATE_LUT GC0308_MJPEG_frame_rate_lut[] = 
{
/* Night Mode, Target Witdh, Target Height,  Normal Mode Frame Rate, Night Mode Frame Rate,  */
/* Frame rate: 150 means 15fps, 75 means 7.5fps */
#if (defined(DRV_ISP_6235_SERIES))

	#if (defined(DRV_ISP_YUV_BURST_MODE_SUPPORT))		/* MT6253 Series, always enable advance resizer */
		{KAL_FALSE,	320, 240, 200, 100},
		{KAL_FALSE,	172, 144, 200, 100},
	#else												/* MT6235 & MT6235B normal */
		{KAL_FALSE,	172, 144, 100, 50},
	#endif
	
#else

	/* Always set one default frame rate setting. */
	{KAL_FALSE,	320, 240, 150, 75},
	{KAL_FALSE,	172, 144, 150, 75},

#endif
};
static GC0308_FRAME_RATE_LUT GC0308_MPEG4_frame_rate_lut[] = 
{
/* Night Mode, Target Witdh, Target Height,  Normal Mode Frame Rate, Night Mode Frame Rate,  */
/* Frame rate: 150 means 15fps, 75 means 7.5fps */
#if (defined(DRV_ISP_6235_SERIES))

	#if (defined(__SW_VIDEO_ADV_RESIZER_SUPPORT__))		/* MT6235 & MT6235B with advance resizer */
		{KAL_FALSE,	320, 240, 300, 150},
		{KAL_FALSE,	172, 144, 300, 150},
	#elif (defined(DRV_ISP_YUV_BURST_MODE_SUPPORT))		/* MT6253 Series, always enable advance resizer */
		{KAL_FALSE,	320, 240, 200, 100},
		{KAL_FALSE,	172, 144, 300, 150},
	#else												/* MT6235 & MT6235B normal */
		{KAL_FALSE,	320, 240, 150, 75},
		{KAL_FALSE,	172, 144, 150, 75},
	#endif

#elif (defined(DRV_ISP_6238_SERIES)||defined(DRV_ISP_6276_SERIES))

	#if (defined(DRV_ISP_MT6236_HW_SUPPORT))			/* MT6236 Series video frame rate */
		{KAL_FALSE,	480, 320, 120, 75},
		{KAL_FALSE,	320, 240, 150, 75},
		{KAL_FALSE,	176, 144, 150, 75},
	#else												/* MT6238/39, MT6268 Series video frame rate */
		{KAL_FALSE,	640, 480, 300, 150},
		{KAL_FALSE,	480, 320, 300, 150},
		{KAL_FALSE,	320, 240, 300, 150},
		{KAL_FALSE,	176, 144, 300, 150},
	#endif

#else

	/* Always set one default frame rate setting. */
	{KAL_FALSE,	320, 240, 150, 75},

#endif
};
static GC0308_FRAME_RATE_LUT GC0308_FULLVIDEO_frame_rate_lut[] = /* MT6268 Series video frame rate */
{
	{KAL_FALSE,	640, 480, 300, 75},
	{KAL_FALSE,	480, 320, 300, 75},
	{KAL_FALSE,	320, 240, 300, 75},
	{KAL_FALSE,	176, 144, 300, 75},
};


static GC0308_SENSOR_INFO_ST GC0308_sensor;
static GC0308_OPERATION_STATE_ST GC0308_op_state;

static kal_uint8 GC0308_sccb_addr[] = 
{
	GC0308_WRITE_ID_0,			/* Slave address0, Write ID */
	GC0308_WRITE_ID_1,			/* Slave address1, Write ID */
	GC0308_WRITE_ID_2,			/* Slave address2, Write ID */
	GC0308_WRITE_ID_3,			/* Slave address3, Write ID */
};

#define GC0308_SET_PAGE0 	GC0308_write_cmos_sensor(0xfe, 0x00)
#define GC0308_SET_PAGE1 	GC0308_write_cmos_sensor(0xfe, 0x01)

kal_bool GC039_CAM_BANDING_50HZ = KAL_FALSE;

#ifdef GC0308_LOAD_FROM_T_FLASH
	GC0308_initial_set_struct GC0308_Init_Reg[1000];
	WCHAR GC0308_set_file_name[256] = {0};
#endif

#ifdef __GC0308_DEBUG_TRACE__
static kal_uint32 GC0308_t[] = 
{
	0
};
#endif


/*************************************************************************
* FUNCTION
*	GC0308_Enable_Output_MCLK
*
* DESCRIPTION
*	This function enable the MCLK (Master Clock) output to sensor. Only can select 26.0Mhz
*		or 24.0Mhz.
*
* PARAMETERS
*	1. kal_uint16 - Target master clock, 260 means 26.0MHz
*
* RETURNS
*	None
*
*************************************************************************/
static void GC0308_Enable_Output_MCLK(kal_uint16 master_clock)
{
	if (master_clock != 260 && master_clock != 240)
	{
		master_clock = 260;		/* Default output 26Mhz Master clock. */
	}
	
#if (defined(DRV_ISP_6238_SERIES)||defined(DRV_ISP_6276_SERIES))	/* MT6238/39, 6268, 6236, 6516 series... */

	if (master_clock == 260)
	{
		#if (defined(DRV_ISP_MT6268_HW_SUPPORT) || defined(DRV_ISP_6276_SERIES))	/* MT6268, MT6276 Series */
			setCameraCPLLOutputFreq(52000000);		/* 52Mhz Clock Base */
			ENABLE_CAMERA_TG_CLK_48M;
			/* Set MCLK Divider, The MCLK = 52 / (1+1) Mhz, or 48  / (1+1) Mhz based on the Clock Base above */
			SET_TG_OUTPUT_CLK_DIVIDER(1);
			SET_CMOS_RISING_EDGE(0);			/* Always set the Rising_Edge = 0 */
			SET_CMOS_FALLING_EDGE(1);			/* Set the Falling_Edge = ((TG_CLK_DIVIDER + 1) / 2) to get 50% duty of MCLK. */
		#else																		/* MT6238/38, 6236 Series */
			DISABLE_CAMERA_TG_CLK_48M;				/* 104Mhz Clock Base */
			/* Set MCLK Divider, The MCLK = 104 / (1+1) Mhz, or 48  / (1+1) Mhz based on the Clock Base above */
			SET_TG_OUTPUT_CLK_DIVIDER(3);
			SET_CMOS_RISING_EDGE(0);			/* Always set the Rising_Edge = 0 */
			SET_CMOS_FALLING_EDGE(2);			/* Set the Falling_Edge = ((TG_CLK_DIVIDER + 1) / 2) to get 50% duty of MCLK. */
		#endif
	}
	else
	{
		setCameraCPLLOutputFreq(48000000);		/* 48Mhz Clock Base */
		ENABLE_CAMERA_TG_CLK_48M;
		/* Set MCLK Divider, The MCLK = 52 / (1+1) Mhz, or 48  / (1+1) Mhz based on the Clock Base above */
		SET_TG_OUTPUT_CLK_DIVIDER(1);
		SET_CMOS_RISING_EDGE(0);			/* Always set the Rising_Edge = 0 */
		SET_CMOS_FALLING_EDGE(1);			/* Set the Falling_Edge = ((TG_CLK_DIVIDER + 1) / 2) to get 50% duty of MCLK. */
	}
	
#elif defined(DRV_ISP_6235_SERIES)									/* MT6235/35B, MT6253 series... */

	if (master_clock == 260)
	{
		#if (defined(DRV_ISP_YUV_BURST_MODE_SUPPORT))				/* MT6253 Series */
		
			DISABLE_CAMERA_TG_CLK_48M;				/* 52Mhz Clock Base */
			/* Set MCLK Divider, The MCLK = 52 / (1+1) Mhz, or 48  / (1+1) Mhz based on the Clock Base above */
			SET_TG_OUTPUT_CLK_DIVIDER(1);
			SET_CMOS_RISING_EDGE(0);			/* Always set the Rising_Edge = 0 */
			SET_CMOS_FALLING_EDGE(1);			/* Set the Falling_Edge = ((TG_CLK_DIVIDER + 1) / 2) to get 50% duty of MCLK. */
			
		#else														/* MT6235 Series */
		
			DISABLE_CAMERA_TG_CLK_48M;				/* 104Mhz Clock Base */
			/* Set MCLK Divider, The MCLK = 104 / (1+1) Mhz, or 48  / (1+1) Mhz based on the Clock Base above */
			SET_TG_OUTPUT_CLK_DIVIDER(3);
			SET_CMOS_RISING_EDGE(0);			/* Always set the Rising_Edge = 0 */
			SET_CMOS_FALLING_EDGE(2);			/* Set the Falling_Edge = ((TG_CLK_DIVIDER + 1) / 2) to get 50% duty of MCLK. */
		#endif
	}
	else
	{	
		ENABLE_CAMERA_TG_CLK_48M;				/* 48Mhz Clock Base */
		UPLL_Enable(UPLL_OWNER_ISP);
		/* Set MCLK Divider, The MCLK = 52 / (1+1) Mhz, or 48  / (1+1) Mhz based on the Clock Base above */
		SET_TG_OUTPUT_CLK_DIVIDER(1);
		SET_CMOS_RISING_EDGE(0);			/* Always set the Rising_Edge = 0 */
		SET_CMOS_FALLING_EDGE(1);			/* Set the Falling_Edge = ((TG_CLK_DIVIDER + 1) / 2) to get 50% duty of MCLK. */
	}
	
#else																/* Default, Other BB chip series... */

	if (master_clock == 260)
	{
		DISABLE_CAMERA_TG_CLK_48M;				/* 52Mhz Clock Base */
		/* Set MCLK Divider, The MCLK = 52 / (1+1) Mhz, or 48  / (1+1) Mhz based on the Clock Base above */
		SET_TG_OUTPUT_CLK_DIVIDER(1);
		SET_CMOS_RISING_EDGE(0);			/* Always set the Rising_Edge = 0 */
		SET_CMOS_FALLING_EDGE(1);			/* Set the Falling_Edge = ((TG_CLK_DIVIDER + 1) / 2) to get 50% duty of MCLK. */
	}
	else
	{
		ENABLE_CAMERA_TG_CLK_48M;				/* 48Mhz Clock Base */
		UPLL_Enable(UPLL_OWNER_ISP);
		/* Set MCLK Divider, The MCLK = 52 / (1+1) Mhz, or 48  / (1+1) Mhz based on the Clock Base above */
		SET_TG_OUTPUT_CLK_DIVIDER(1);
		SET_CMOS_RISING_EDGE(0);			/* Always set the Rising_Edge = 0 */
		SET_CMOS_FALLING_EDGE(1);			/* Set the Falling_Edge = ((TG_CLK_DIVIDER + 1) / 2) to get 50% duty of MCLK. */
	}
	
#endif

	ENABLE_CAMERA_PIXEL_CLKIN_ENABLE;	/* Must enble pixel in when use 48Mhz MCLK Base. */
	
	ENABLE_CAMERA_TG_PHASE_COUNTER;
	ENABLE_CAMERA_CLOCK_OUTPUT_TO_CMOS;
}

/*************************************************************************
* FUNCTION
*	GC0308_Disable_Output_MCLK
*
* DESCRIPTION
*	This function disable the MCLK (Master Clock) output to sensor, and set the MCLK to low.
*
* PARAMETERS
*	None
*
* RETURNS
*	None
*
*************************************************************************/
static void GC0308_Disable_Output_MCLK()
{
	SET_CMOS_FALLING_EDGE(0);	/* Set Low to MCLK */
	DISABLE_CAMERA_TG_PHASE_COUNTER;
	DISABLE_CAMERA_CLOCK_OUTPUT_TO_CMOS;
	
#if (defined(DRV_ISP_6238_SERIES)||defined(DRV_ISP_6276_SERIES))	/* MT6238/39, 6268, 6236, 6516 series... */

	setCameraCPLLPowerDown();

#else																/* Default, Other BB chip series... */
																	/* MT6235/35B, MT6253 series... */
		UPLL_Disable(UPLL_OWNER_ISP);

#endif

}


#ifndef GC0308_HW_SCCB
/*************************************************************************
* FUNCTION
*	GC0308_SCCB_send_one_byte
*
* DESCRIPTION
*	This function use GPIO to simulate the I2C and send one byte data to slave device.
*
* PARAMETERS
*	1. kal_uint8 : The data want to transfer to slave device.
*
* RETURNS
*	kal_uint8 : The ACK bit of slave device reponse.
*
*************************************************************************/
static kal_uint8 GC0308_SCCB_send_one_byte(kal_uint8 send_byte)
{
	volatile signed char i = 0;
	volatile kal_uint16 j = 0;
	kal_uint8 ack = 0;
	
	for (i = 7; i >= 0; i--)
	{
		if (send_byte&(1 << i))
		{
			SET_SCCB_DATA_HIGH;
		}
		else
		{
			SET_SCCB_DATA_LOW;
		}
		for (j = 0; j < GC0308_SENSOR_I2C_DELAY; j++);
		SET_SCCB_CLK_HIGH;
		for (j = 0; j < GC0308_SENSOR_I2C_DELAY; j++);
		SET_SCCB_DATA_OUTPUT; /* only for delay */
		for (j = 0; j < GC0308_SENSOR_I2C_DELAY; j++);
		SET_SCCB_CLK_LOW;
		for (j = 0; j < GC0308_SENSOR_I2C_DELAY; j++);
	}
	SET_SCCB_DATA_INPUT;
	for (j = 0; j < GC0308_SENSOR_I2C_DELAY; j++);
	SET_SCCB_CLK_HIGH;
	for (j = 0; j < GC0308_SENSOR_I2C_DELAY; j++);
	ack = GET_SCCB_DATA_BIT;
	for (j = 0; j < GC0308_SENSOR_I2C_DELAY; j++);
	SET_SCCB_CLK_LOW;
	for (j = 0; j < GC0308_SENSOR_I2C_DELAY; j++);
	SET_SCCB_DATA_OUTPUT;
	
	return ack;
}

/*************************************************************************
* FUNCTION
*	GC0308_SCCB_get_one_byte
*
* DESCRIPTION
*	This function use GPIO to simulate the I2C receive one byte data from slave device.
*
* PARAMETERS
*	None
*
* RETURNS
*	kal_uint8 : The received data from slave device.
*
*************************************************************************/
static kal_uint8 GC0308_SCCB_get_one_byte(void)
{
	volatile signed char i = 0;
	volatile kal_uint16 j = 0;
	kal_uint8 get_byte = 0;
	
	SET_SCCB_DATA_INPUT;
	
	for (j = 0; j < GC0308_SENSOR_I2C_DELAY; j++);
	
	for (i = 7; i >= 0; i--) {    // data bit 7~0
		SET_SCCB_CLK_HIGH;
		for (j = 0; j < GC0308_SENSOR_I2C_DELAY; j++);
		if (GET_SCCB_DATA_BIT) {
			get_byte |= (1 << i);
		}
		for (j = 0; j < GC0308_SENSOR_I2C_DELAY; j++);
		SET_SCCB_CLK_LOW;
		for (j = 0; j < GC0308_SENSOR_I2C_DELAY; j++);
	}
	
	// don't care bit, 9th bit
	SET_SCCB_DATA_OUTPUT;
	SET_SCCB_DATA_HIGH;
	for (j = 0; j < GC0308_SENSOR_I2C_DELAY; j++);
	SET_SCCB_CLK_HIGH;
	for (j = 0; j < GC0308_SENSOR_I2C_DELAY; j++);
	SET_SCCB_CLK_LOW;
	
	return get_byte;
}   /* GC0308_SCCB_get_one_byte */


/*************************************************************************
* FUNCTION
*    GC0308_SCCB_get_two_bytes
*
* DESCRIPTION
*    This function read 16bit data from I2C
*
* PARAMETERS
*    None
*
* RETURNS
*    kal_uint16 - 16bit data read from I2C
*
* GLOBALS AFFECTED
*
*************************************************************************/
static kal_uint16 GC0308_SCCB_get_two_bytes(void)
{
	volatile signed char i = 0;
	volatile kal_uint32 j = 0;
	kal_uint16 get_byte = 0;

	for (i = 15; i >= 8; i--)
	{
		SET_SCCB_DATA_INPUT;
		for (j = 0; j < GC0308_SENSOR_I2C_DELAY; j++);
		SET_SCCB_CLK_HIGH;
		for (j = 0; j < GC0308_SENSOR_I2C_DELAY; j++);
		if (GET_SCCB_DATA_BIT) get_byte |= (1 << i);
		for (j = 0; j < GC0308_SENSOR_I2C_DELAY; j++);
		SET_SCCB_CLK_LOW;
		for (j = 0; j < GC0308_SENSOR_I2C_DELAY; j++);
	}
	SET_SCCB_DATA_LOW;
	SET_SCCB_DATA_OUTPUT;
	for (j = 0;j < GC0308_SENSOR_I2C_DELAY; j++);
	SET_SCCB_CLK_HIGH;
	for (j = 0;j < GC0308_SENSOR_I2C_DELAY; j++);
	SET_SCCB_DATA_OUTPUT; /* just for delay */
	for (j = 0;j < GC0308_SENSOR_I2C_DELAY; j++);
	SET_SCCB_CLK_LOW;
	for (j = 0;j < GC0308_SENSOR_I2C_DELAY; j++);
	for (; i >= 0; i--)
	{
		SET_SCCB_DATA_INPUT;
		for (j = 0; j < GC0308_SENSOR_I2C_DELAY; j++);
		SET_SCCB_CLK_HIGH;
		for (j = 0; j < GC0308_SENSOR_I2C_DELAY; j++);
		if (GET_SCCB_DATA_BIT) get_byte |= (1 << i);
		for (j = 0; j < GC0308_SENSOR_I2C_DELAY; j++);
		SET_SCCB_CLK_LOW;
		for (j = 0; j < GC0308_SENSOR_I2C_DELAY; j++);
	}
	SET_SCCB_DATA_HIGH;
	SET_SCCB_DATA_OUTPUT;
	for (j = 0;j < GC0308_SENSOR_I2C_DELAY; j++);
	SET_SCCB_CLK_HIGH;
	for (j = 0;j < GC0308_SENSOR_I2C_DELAY; j++);
	SET_SCCB_DATA_OUTPUT; /* just for delay */
	for (j = 0;j < GC0308_SENSOR_I2C_DELAY; j++);
	SET_SCCB_CLK_LOW;
	for (j = 0;j < GC0308_SENSOR_I2C_DELAY; j++);

	return get_byte;
}

#endif

/*************************************************************************
* FUNCTION
*	GC0308_write_cmos_sensor
*
* DESCRIPTION
*	This function write the parameter to the specific register of slave device.
*
* PARAMETERS
*	1. kal_uint16 : The register address want to write.
*	2. kal_uint16 : The parameter need write.
*
* RETURNS
*	None
*
*************************************************************************/
static void GC0308_write_cmos_sensor(const kal_uint16 addr, const kal_uint16 para)
{
#ifdef GC0308_HW_SCCB
	SCCB_TRANSACTION_RESULT rt;
	kal_uint8 out_buff[4] = {0};	/* I2C max support 16 + 16 now. */
	kal_uint32 out_data_len = 0;

#if (defined(GC0308_I2C_8_8))
	out_buff[0] = addr & 0xFF;
	out_buff[1] = para & 0xFF;

	out_data_len = 2;
#elif (defined(GC0308_I2C_8_16))
	out_buff[0] = addr & 0xFF;
	out_buff[1] = (para >> 8) & 0xFF;
	out_buff[2] = para & 0xFF;
	
	out_data_len = 3;
#elif (defined(GC0308_I2C_16_8))
	out_buff[0] = (addr >> 8) & 0xFF;
	out_buff[1] = addr & 0xFF;
	out_buff[2] = para & 0xFF;
	
	out_data_len = 3;
#elif (defined(GC0308_I2C_16_16))
	out_buff[0] = (addr >> 8) & 0xFF;
	out_buff[1] = addr & 0xFF;
	out_buff[2] = (para >> 8) & 0xFF;
	out_buff[3] = para & 0xFF;

	out_data_len = 4;
#else
	/* This I2C type not support now */
	/* Plz at least define one of these macro GC0308_I2C_8_8, GC0308_I2C_8_16, GC0308_I2C_16_8, GC0308_I2C_16_16 */
	ASSERT(0);
#endif
	
	rt = i2c_write(SCCB_OWNER_CAMERA, out_buff, out_data_len);
#ifdef __GC0308_DEBUG_TRACE__
	if (rt == SCCB_TRANSACTION_FAIL)
		kal_prompt_trace(MOD_ENG, "HW I2C write error addr=%x para=%x", addr, para);
#endif

#else

	kal_uint8 fail_try_no = 4;
	
	while (--fail_try_no > 0)
	{
		GC0308_I2C_START_TRANSMISSION;
		if (GC0308_SCCB_send_one_byte(GC0308_sensor.sccb_write_id)) continue;
		#if (defined(GC0308_I2C_8_8))
			if (GC0308_SCCB_send_one_byte(addr)) continue;
			if (GC0308_SCCB_send_one_byte(para)) continue;
		#elif (defined(GC0308_I2C_8_16))
			if (GC0308_SCCB_send_one_byte(addr)) continue;
			if (GC0308_SCCB_send_one_byte(para >> 8)) continue;
			if (GC0308_SCCB_send_one_byte(para&0xFF)) continue;
		#elif (defined(GC0308_I2C_16_8))
			if (GC0308_SCCB_send_one_byte(addr >> 8)) continue;
			if (GC0308_SCCB_send_one_byte(addr&0xFF)) continue;
			if (GC0308_SCCB_send_one_byte(para)) continue;
		#elif (defined(GC0308_I2C_16_16))
			if (GC0308_SCCB_send_one_byte(addr >> 8)) continue;
			if (GC0308_SCCB_send_one_byte(addr&0xFF)) continue;
			if (GC0308_SCCB_send_one_byte(para >> 8)) continue;
			if (GC0308_SCCB_send_one_byte(para&0xFF)) continue;
		#else
			/* This I2C type not support now */
			/* Plz at least define one of these macro GC0308_I2C_8_8, GC0308_I2C_8_16, GC0308_I2C_16_8, GC0308_I2C_16_16 */
			ASSERT(0);
		#endif
		
		break;        
	}
	GC0308_I2C_STOP_TRANSMISSION;
	
#ifdef __GC0308_DEBUG_TRACE__
	if (!fail_try_no)
		kal_prompt_trace(MOD_ENG, "SW I2C write error addr=%x para=%x", addr, para);
#endif

#endif  /*  GC0308_HW_SCCB */
}   /*  GC0308_write_cmos_sensor()  */

/*************************************************************************
* FUNCTION
*	GC0308_read_cmos_sensor
*
* DESCRIPTION
*	This function write the parameter to the specific register of slave device.
*
* PARAMETERS
*	1. kal_uint16 : The register address want to read.
*
* RETURNS
*	kal_uint16 : The read data from the specific address.
*
*************************************************************************/
static kal_uint16 GC0308_read_cmos_sensor(const kal_uint16 addr)
{
#ifdef GC0308_HW_SCCB
	SCCB_TRANSACTION_RESULT rt1, rt2;
	kal_uint8 in_buff[2] = {0xFF, 0xFF};
	kal_uint8 out_buff[2];
	kal_uint32 out_data_len = 0, in_data_len = 0;
	kal_uint16 get_byte = 0xFFFF;

#if (defined(GC0308_I2C_8_8))
	out_buff[0] = addr & 0xFF;

	out_data_len = 1;
	in_data_len = 1;
#elif (defined(GC0308_I2C_8_16))
	out_buff[0] = addr & 0xFF;
	
	out_data_len = 1;
	in_data_len = 2;
#elif (defined(GC0308_I2C_16_8))
	out_buff[0] = addr>>8;
	out_buff[1] = addr&0xFF;
	
	out_data_len = 2;
	in_data_len = 1;
#elif (defined(GC0308_I2C_16_16))
	out_buff[0] = (addr >> 8) & 0xFF;
	out_buff[1] = addr & 0xFF;

	out_data_len = 2;
	in_data_len = 2;
#else
	/* This I2C type not support now */
	/* Plz at least define one of these macro GC0308_I2C_8_8, GC0308_I2C_8_16, GC0308_I2C_16_8, GC0308_I2C_16_16 */
	ASSERT(0);
#endif
	
	rt1 = i2c_write(SCCB_OWNER_CAMERA, out_buff, out_data_len);
	rt2 = i2c_read(SCCB_OWNER_CAMERA, in_buff, in_data_len);

#if (defined(GC0308_I2C_8_8) || defined(GC0308_I2C_16_8))
	get_byte = in_buff[0];
#elif (defined(GC0308_I2C_8_16) || defined(GC0308_I2C_16_16))
	get_byte = (in_buff[0] << 8) | in_buff[1];
#endif

#ifdef __GC0308_DEBUG_TRACE__
	if (rt1 == SCCB_TRANSACTION_FAIL || rt2 == SCCB_TRANSACTION_FAIL )
		kal_prompt_trace(MOD_ENG, "HW I2C read error addr=%x, val=%x", addr, get_byte);
#endif

	return get_byte;

#else

	kal_uint16 get_byte = 0xFFFF;
	kal_uint8 fail_try_no = 4;
	volatile kal_uint32 j = 0;
	
	while (--fail_try_no > 0)
	{
		GC0308_I2C_START_TRANSMISSION;
		
		if (GC0308_SCCB_send_one_byte(GC0308_sensor.sccb_write_id)) continue;
		#if (defined(GC0308_I2C_8_8) || defined(GC0308_I2C_8_16))
			if (GC0308_SCCB_send_one_byte(addr)) continue;
		#elif (defined(GC0308_I2C_16_8) || defined(GC0308_I2C_16_16))
			if (GC0308_SCCB_send_one_byte(addr >> 8)) continue;
			if (GC0308_SCCB_send_one_byte(addr&0xFF)) continue;
		#else
			/* This I2C type not support now */
			/* Plz at least define one of these macro GC0308_I2C_8_8, GC0308_I2C_8_16, GC0308_I2C_16_8, GC0308_I2C_16_16 */
			ASSERT(0);
		#endif
		
		GC0308_I2C_START_TRANSMISSION;
		if (GC0308_SCCB_send_one_byte(GC0308_sensor.sccb_read_id)) continue;
		#if (defined(GC0308_I2C_8_8) || defined(GC0308_I2C_16_8))
			get_byte = GC0308_SCCB_get_one_byte();
		#elif (defined(GC0308_I2C_8_16) || defined(GC0308_I2C_16_16))
			get_byte = GC0308_SCCB_get_two_bytes();
		#endif
		
		break;
	}
	GC0308_I2C_STOP_TRANSMISSION;
#ifdef __GC0308_DEBUG_TRACE__
	if (!fail_try_no)
		kal_prompt_trace(MOD_ENG, "SW I2C read error addr=%x, val=%x", addr, get_byte);
#endif
	return get_byte;
	
#endif
	
}   /*  GC0308_read_cmos_sensor()  */

/*************************************************************************
* FUNCTION
*	GC0308_write_shutter
*
* DESCRIPTION
*	This function used to write the shutter.
*
* PARAMETERS
*	1. kal_uint32 : The shutter want to apply to sensor.
*
* RETURNS
*	None
*
*************************************************************************/
static void GC0308_write_shutter(kal_uint32 shutter)
{
#if 0
	kal_uint32 extra_exposure_lines = 0;
	
	if (shutter < 1)
	{
		shutter = 1;
	}
	
	if (GC0308_op_state.is_PV_mode) 
	{
		if (shutter <= GC0308_PV_EXPOSURE_LIMITATION) 
		{
			extra_exposure_lines = 0;
		}
		else 
		{
			extra_exposure_lines = shutter - GC0308_PV_EXPOSURE_LIMITATION;
			shutter = GC0308_PV_EXPOSURE_LIMITATION;
		}
	}
	else 
	{
		if (shutter <= GC0308_FULL_EXPOSURE_LIMITATION) 
		{
			extra_exposure_lines = 0;
		}
		else 
		{
			extra_exposure_lines = shutter - GC0308_FULL_EXPOSURE_LIMITATION;
			shutter = GC0308_FULL_EXPOSURE_LIMITATION;
		}
	}
	
	// set extra exposure line
	
	/* Max exporsure time is 1 frmae period event if Tex is set longer than 1 frame period */
#endif
}    /* GC0308_write_shutter */

/*************************************************************************
* FUNCTION
*	GC0308_read_shutter
*
* DESCRIPTION
*	This function read current shutter for calculate the exposure.
*
* PARAMETERS
*	None
*
* RETURNS
*	kal_uint16 : The current shutter value.
*
*************************************************************************/
static kal_uint32 GC0308_read_shutter(void)
{
	kal_uint16 temp_reg1, temp_reg2;
	
	temp_reg1 = GC0308_read_cmos_sensor(0x04);    // AEC[b7~b0]
	temp_reg2 = GC0308_read_cmos_sensor(0x03);    // AEC[b15~b8]
	/* Backup the preview mode last shutter & sensor gain. */
	GC0308_sensor.pv_shutter = (temp_reg1 & 0xFF) | (temp_reg2 << 8);
	
	/* Backup the preview mode last shutter & sensor gain. */
	GC0308_sensor.pv_extra_shutter = 0;
	
	return GC0308_sensor.pv_shutter + GC0308_sensor.pv_extra_shutter;
}    /* GC0308_read_shutter */

/*************************************************************************
* FUNCTION
*	GC0308_write_sensor_gain
*
* DESCRIPTION
*	This function used to write the sensor gain.
*
* PARAMETERS
*	1. kal_uint32 : The sensor gain want to apply to sensor.
*
* RETURNS
*	None
*
*************************************************************************/
static void GC0308_write_sensor_gain(kal_uint32 gain)
{

	
}  /* GC0308_write_sensor_gain */

/*************************************************************************
* FUNCTION
*	GC0308_read_sensor_gain
*
* DESCRIPTION
*	This function read current sensor gain for calculate the exposure.
*
* PARAMETERS
*	None
*
* RETURNS
*	kal_uint16 : The current sensor gain value.
*
*************************************************************************/
static kal_uint32 GC0308_read_sensor_gain(void)
{
	kal_uint16 temp_reg = 0;
	kal_uint32 sensor_gain = 0;
	
	return sensor_gain;
}  /* GC0308_read_sensor_gain */

/*************************************************************************
* FUNCTION
*	GC0308_set_hb_shutter
*
* DESCRIPTION
*	This function set the dummy pixels(Horizontal Blanking) when capturing, it can be
*	used to adjust the frame rate  for back-end process.
*	
*	IMPORTANT NOTICE: the base shutter need re-calculate for some sensor, or else flicker may occur.
*
* PARAMETERS
*	1. kal_uint32 : Dummy Pixels (Horizontal Blanking)
*	2. kal_uint32 : shutter (Vertical Blanking)
*
* RETURNS
*	None
*
*************************************************************************/
static void GC0308_set_hb_shutter(kal_uint32 hb_add,  kal_uint32 shutter)
{
	kal_uint32 hb_ori, hb_total;
	kal_uint32 temp_reg, banding_step;

	/*Set HB start*/
	
	/*The HB must < 0xFFF*/
	temp_reg = GC0308_read_cmos_sensor(0x0f);
	hb_ori = ((temp_reg&0x0f)<<8 )|GC0308_read_cmos_sensor(0x01);
	hb_total = hb_ori + hb_add;
	
	if(hb_total > 0xfff)
	{
		GC0308_write_cmos_sensor(0x0f , temp_reg|0x0f);
		GC0308_write_cmos_sensor(0x01 , 0xff); 
		temp_reg = shutter * (694 + hb_ori ) / 4095;
	}
	else
	{
		GC0308_write_cmos_sensor(0x0f , temp_reg|((hb_total>>8)&0x0f));
		GC0308_write_cmos_sensor(0x01 , hb_total&0xff); 
		temp_reg = shutter * (694 + hb_ori ) / (694 + hb_ori + hb_add);
	}	
	/*Set HB end*/
	
	/*Set Shutter start*/
	if(temp_reg < 1) temp_reg = 1;
	GC0308_write_cmos_sensor(0x03 , (temp_reg>>8)&0xff);           
	GC0308_write_cmos_sensor(0x04 , temp_reg&0xff); 
	/*Set Shutter end*/

}    /* GC2015_set_dummy */

/*************************************************************************
* FUNCTION
*	GC0308_set_banding
*
* DESCRIPTION
*	This function set the hb,vb,step,exposure level, it can be
*	used to adjust the frame rate .
*	
*	IMPORTANT NOTICE: the base shutter need re-calculate for some sensor, or else flicker may occur.
*
* PARAMETERS
*
* RETURNS
*	None
*
*************************************************************************/
static void GC0308_set_banding(kal_uint32 clk_in, kal_uint32 light_fre, kal_uint32 HB_count, kal_uint32 VB_count, kal_uint32 Exp_L1, kal_uint32 Exp_L2, kal_uint32 Exp_L3, kal_uint32 Exp_L4)
{
	kal_uint32 HB, banding_step, VB;
	kal_uint32 i, temp_1, temp_2, counter;

	counter = 0;
	for(i = 1; i < 1024; i++)
	{
		temp_1 = clk_in * 10000000 / 2 / 2 / light_fre / (694 + i);
		temp_2 = (temp_1 + 50) / 100 * 100;
		
		if(temp_2 > temp_1)
		{
			if((temp_2 - temp_1) < 1)
			{
				counter = counter + 1;
			}
		}
		else
		{
			if((temp_1 - temp_2) < 1)
			{
				counter = counter + 1;
			}
		}
		
		if(counter == HB_count)
		{
			HB = i;
			banding_step = temp_2 / 100;
			break;
		}
	}
	
	if(488 % banding_step)
	{
		temp_1 = 488 / banding_step + 1;
	}
	else
	{
		temp_1 = 488 / banding_step;
	}
	temp_2 = temp_1 * banding_step - 488;
	VB = VB_count * banding_step + temp_2;

	GC0308_write_cmos_sensor(0x01  ,HB&0xFF); 	
	GC0308_write_cmos_sensor(0x02  ,VB&0xFF); 
	GC0308_write_cmos_sensor(0x0f  ,((VB&0xF00)>>8)|((HB&0xF00)>>8));

	GC0308_write_cmos_sensor(0xe2  ,(banding_step&0xF00)>>8); 	
	GC0308_write_cmos_sensor(0xe3  ,banding_step&0xFF); 	

	GC0308_write_cmos_sensor(0xe4  ,((banding_step * Exp_L1)&0xF00)>>8);   //exp level 0
	GC0308_write_cmos_sensor(0xe5  ,(banding_step * Exp_L1)&0xFF); 
	GC0308_write_cmos_sensor(0xe6  ,((banding_step * Exp_L2)&0xF00)>>8);   //exp level 1
	GC0308_write_cmos_sensor(0xe7  ,(banding_step * Exp_L2)&0xFF); 
	GC0308_write_cmos_sensor(0xe8  ,((banding_step * Exp_L3)&0xF00)>>8);   //exp level 2
	GC0308_write_cmos_sensor(0xe9  ,(banding_step * Exp_L3)&0xFF); 
	GC0308_write_cmos_sensor(0xea  ,((banding_step * Exp_L4)&0xF00)>>8);   //exp level 3
	GC0308_write_cmos_sensor(0xeb  ,(banding_step * Exp_L4)&0xFF); 	
		
}    /* GC0308_set_dummy */

/*************************************************************************
* FUNCTION
*	GC0308_set_mirror
*
* DESCRIPTION
*	This function mirror, flip or mirror & flip the sensor output image.
*
*	IMPORTANT NOTICE: For some sensor, it need re-set the output order Y1CbY2Cr after
*	mirror or flip.
*
* PARAMETERS
*	1. kal_uint16 : horizontal mirror or vertical flip direction.
*
* RETURNS
*	None
*
*************************************************************************/
static void GC0308_set_mirror(kal_uint16 image_mirror)
{
#ifdef __GC0308_DEBUG_TRACE__
	kal_wap_trace(MOD_ENG, TRACE_INFO, "Set image_mirror = %d", image_mirror);
#endif
	
	switch (image_mirror)
	{
	case IMAGE_NORMAL:
		GC0308_write_cmos_sensor(0x14, 0x10);     
		break;
	case IMAGE_H_MIRROR:
		GC0308_write_cmos_sensor(0x14, 0x11);     
		break;
	case IMAGE_V_MIRROR:
		GC0308_write_cmos_sensor(0x14, 0x12);     
		break;
	case IMAGE_HV_MIRROR:
		GC0308_write_cmos_sensor(0x14, 0x13);     
		break;
	default:
		ASSERT(0);
	}
}

/*************************************************************************
* FUNCTION
*	GC0308_awb_enable
*
* DESCRIPTION
*	This function enable or disable the awb (Auto White Balance).
*
* PARAMETERS
*	1. kal_bool : KAL_TRUE - enable awb, KAL_FALSE - disable awb.
*
* RETURNS
*	kal_bool : It means set awb right or not.
*
*************************************************************************/
static kal_bool GC0308_awb_enable(kal_bool enalbe)
{	 
	kal_uint16 temp_AWB_reg = 0;

	if (GC0308_op_state.is_panorama_capturing == KAL_TRUE && enalbe == KAL_TRUE) 
	{
		/* When capture mode is panorama capture, then sensor driver should not control it agian... */
		return KAL_FALSE;
	}
	
	temp_AWB_reg = GC0308_read_cmos_sensor(0x22);
	
	if (enalbe)
	{
		GC0308_write_cmos_sensor(0x22, (temp_AWB_reg |0x02));
	}
	else
	{
		GC0308_write_cmos_sensor(0x22, (temp_AWB_reg & (~0x02)));
	}

	return KAL_TRUE;
}

/*************************************************************************
* FUNCTION
*	GC0308_ae_enable
*
* DESCRIPTION
*	This function enable or disable the ae (Auto Exposure).
*
* PARAMETERS
*	1. kal_bool : KAL_TRUE - enable ae, KAL_FALSE - disable awb.
*
* RETURNS
*	kal_bool : It means set awb right or not.
*
*************************************************************************/
static kal_bool GC0308_ae_enable(kal_bool enalbe)
{	 
	kal_uint16 temp_AE_reg = 0;

	if (GC0308_op_state.is_panorama_capturing == KAL_TRUE && enalbe == KAL_TRUE)
	{
		/* When capture mode is panorama capture, then sensor driver should not control it agian... */
		return KAL_FALSE;
	}
	
	temp_AE_reg = GC0308_read_cmos_sensor(0xd2);
	
	if (enalbe)	  
	{
		GC0308_write_cmos_sensor(0xd2, (temp_AE_reg | 0x80));	/* Turn ON AEC/AGC*/
	}
	else
	{
		GC0308_write_cmos_sensor(0xd2, (temp_AE_reg & (~0x80))); /* Turn OFF AEC/AGC*/
	}

	return KAL_TRUE;
}

#ifdef GC0308_LOAD_FROM_T_FLASH
/*************************************************************************
* FUNCTION
*	GC0308_Initialize_from_T_Flash
*
* DESCRIPTION
*	Read the initialize setting from t-flash or user disk to speed up image quality tuning.
*
* PARAMETERS
*	None
*
* RETURNS
*	kal_uint8 - 0 : Load setting fail, 1 : Load setting successfully.
*
*************************************************************************/
static kal_uint8 GC0308_Initialize_from_T_Flash()
{
	FS_HANDLE fp = -1;				/* Default, no file opened. */
	kal_uint8 *data_buff = NULL;
	kal_uint8 *curr_ptr = NULL;
	kal_uint32 file_size = 0;
	kal_uint32 bytes_read = 0;
	kal_uint32 i = 0, j = 0;
	kal_uint8 func_ind[3] = {0};	/* REG or DLY */

	kal_mem_cpy(GC0308_set_file_name, L"C:\\GC0308_Initialize_Setting.Bin", sizeof(L"C:\\GC0308_Initialize_Setting.Bin"));

	/* Search the setting file in all of the user disk. */
	curr_ptr = (kal_uint8 *)GC0308_set_file_name;
	while (fp < 0)
	{
		if ((*curr_ptr >= 'c' && *curr_ptr <= 'z') || (*curr_ptr >= 'C' && *curr_ptr <= 'Z'))
		{
			fp = FS_Open(GC0308_set_file_name, FS_READ_ONLY);
			if (fp >= 0)
			{
				break;			/* Find the setting file. */
			}

			*curr_ptr = *curr_ptr + 1;
		}
		else
		{
			break ;
		}
	}
	

	if (fp < 0)		/* Error handle */
	{
	#ifdef __GC0308_DEBUG_TRACE__
		kal_wap_trace(MOD_ENG, TRACE_INFO, "!!! Warning, Can't find the initial setting file!!!");
	#endif
	
		return 0;
	}

	FS_GetFileSize(fp, &file_size);
	if (file_size < 20)
	{
	#ifdef __GC0308_DEBUG_TRACE__
		kal_wap_trace(MOD_ENG, TRACE_INFO, "!!! Warning, Invalid setting file!!!");
	#endif
	
		return 0;			/* Invalid setting file. */
	}

	data_buff = med_alloc_ext_mem(file_size);
	if (data_buff == NULL)
	{
	#ifdef __GC0308_DEBUG_TRACE__
		kal_wap_trace(MOD_ENG, TRACE_INFO, "!!! Warning, Memory not enoughed...");
	#endif
	
		return 0;				/* Memory not enough */
	}
	FS_Read(fp, data_buff, file_size, &bytes_read);

	/* Start parse the setting witch read from t-flash. */
	curr_ptr = data_buff;
	while (curr_ptr < (data_buff + file_size))
	{
		while ((*curr_ptr == ' ') || (*curr_ptr == '\t'))/* Skip the Space & TAB */
			curr_ptr++;				

		if (((*curr_ptr) == '/') && ((*(curr_ptr + 1)) == '*'))
		{
			while (!(((*curr_ptr) == '*') && ((*(curr_ptr + 1)) == '/')))
			{
				curr_ptr++;		/* Skip block comment code. */
			}

			while (!((*curr_ptr == 0x0D) && (*(curr_ptr+1) == 0x0A)))
			{
				curr_ptr++;
			}

			curr_ptr += 2;						/* Skip the enter line */
			
			continue ;
		}
		
		if (((*curr_ptr) == '/') || ((*curr_ptr) == '{') || ((*curr_ptr) == '}'))		/* Comment line, skip it. */
		{
			while (!((*curr_ptr == 0x0D) && (*(curr_ptr+1) == 0x0A)))
			{
				curr_ptr++;
			}

			curr_ptr += 2;						/* Skip the enter line */

			continue ;
		}
		/* This just content one enter line. */
		if (((*curr_ptr) == 0x0D) && ((*(curr_ptr + 1)) == 0x0A))
		{
			curr_ptr += 2;
			continue ;
		}

		kal_mem_cpy(func_ind, curr_ptr, 3);
		curr_ptr += 4;					/* Skip "REG(" or "DLY(" */
		if (strcmp((const char *)func_ind, "REG") == 0)		/* REG */
		{
			GC0308_Init_Reg[i].op_code = GC0308_OP_CODE_REG;
			
			GC0308_Init_Reg[i].init_reg = strtol((const char *)curr_ptr, NULL, 16);
			curr_ptr += GC0308_REG_SKIP;	/* Skip "0x0000, " */
			
			GC0308_Init_Reg[i].init_val = strtol((const char *)curr_ptr, NULL, 16);
			curr_ptr += GC0308_VAL_SKIP;	/* Skip "0x0000);" */
		}
		else									/* DLY */
		{
			/* Need add delay for this setting. */
			GC0308_Init_Reg[i].op_code = GC0308_OP_CODE_DLY;
			
			GC0308_Init_Reg[i].init_reg = 0xFF;
			GC0308_Init_Reg[i].init_val = strtol((const char *)curr_ptr, NULL, 10);	/* Get the delay ticks, the delay should less then 50 */
		}
		i++;
		

		/* Skip to next line directly. */
		while (!((*curr_ptr == 0x0D) && (*(curr_ptr+1) == 0x0A)))
		{
			curr_ptr++;
		}
		curr_ptr += 2;
	}

	/* (0xFFFF, 0xFFFF) means the end of initial setting. */
	GC0308_Init_Reg[i].op_code = GC0308_OP_CODE_END;
	GC0308_Init_Reg[i].init_reg = 0xFF;
	GC0308_Init_Reg[i].init_val = 0xFF;
	i++;
	
#ifdef __GC0308_DEBUG_TRACE__
	kal_wap_trace(MOD_ENG, TRACE_INFO, "%d register read...", i-1);
#endif

	med_free_ext_mem((void **)&data_buff);
	FS_Close(fp);

#ifdef __GC0308_DEBUG_TRACE__
	kal_wap_trace(MOD_ENG, TRACE_INFO, "Start apply initialize setting.");
#endif
	/* Start apply the initial setting to sensor. */
	for (j=0; j<i; j++)
	{
		if (GC0308_Init_Reg[j].op_code == GC0308_OP_CODE_END)	/* End of the setting. */
		{
			break ;
		}
		else if (GC0308_Init_Reg[j].op_code == GC0308_OP_CODE_DLY)
		{
			kal_sleep_task(GC0308_Init_Reg[j].init_val);		/* Delay */
		}
		else if (GC0308_Init_Reg[j].op_code == GC0308_OP_CODE_REG)
		{
			GC0308_write_cmos_sensor(GC0308_Init_Reg[j].init_reg, GC0308_Init_Reg[j].init_val);
		}
		else
		{
			ASSERT(0);
		}
	}

#ifdef __GC0308_DEBUG_TRACE__
	kal_wap_trace(MOD_ENG, TRACE_INFO, "%d register applied...", j);
#endif

	return 1;	
}
#endif



/*************************************************************************
* FUNCTION
*	GC0308_YUV_sensor_initial_setting
*
* DESCRIPTION
*	This function apply all of the initial setting to sensor.
*
* PARAMETERS
*	None
*
* RETURNS
*	None
*
*************************************************************************/
static void GC0308_YUV_sensor_initial_setting(void)
{
	GC0308_write_cmos_sensor(0xfe , 0x80);   	
		
	GC0308_SET_PAGE0;       // set page0

		
	GC0308_write_cmos_sensor(0xd2 , 0x10);   // close AEC
	GC0308_write_cmos_sensor(0x22 , 0x55);   // close AWB

	GC0308_write_cmos_sensor(0x5a , 0x56); 
	GC0308_write_cmos_sensor(0x5b , 0x40);
	GC0308_write_cmos_sensor(0x5c , 0x4a);			

	GC0308_write_cmos_sensor(0x22 , 0x57);  // Open AWB
				
	GC0308_write_cmos_sensor(0x01 , 0xfa); 
	GC0308_write_cmos_sensor(0x02 , 0x70); 
	GC0308_write_cmos_sensor(0x0f , 0x01); 

	GC0308_write_cmos_sensor(0x03 , 0x01); 
	GC0308_write_cmos_sensor(0x04 , 0x2c); 

	GC0308_write_cmos_sensor(0xe2 , 0x00); 	//anti-flicker step [11:8]
	GC0308_write_cmos_sensor(0xe3 , 0x64);   //anti-flicker step [7:0]
		
	GC0308_write_cmos_sensor(0xe4 , 0x02);   //exp level 0  16.67fps
	GC0308_write_cmos_sensor(0xe5 , 0x58); 
	GC0308_write_cmos_sensor(0xe6 , 0x03);   //exp level 1  12.5fps
	GC0308_write_cmos_sensor(0xe7 , 0x20); 
	GC0308_write_cmos_sensor(0xe8 , 0x04);   //exp level 2  8.33fps
	GC0308_write_cmos_sensor(0xe9 , 0xb0); 
	GC0308_write_cmos_sensor(0xea , 0x09);   //exp level 3  4.00fps
	GC0308_write_cmos_sensor(0xeb , 0xc4); 

	GC0308_write_cmos_sensor(0x05 , 0x00);
	GC0308_write_cmos_sensor(0x06 , 0x00);
	GC0308_write_cmos_sensor(0x07 , 0x00);
	GC0308_write_cmos_sensor(0x08 , 0x00);
	GC0308_write_cmos_sensor(0x09 , 0x01);
	GC0308_write_cmos_sensor(0x0a , 0xe8);
	GC0308_write_cmos_sensor(0x0b , 0x02);
	GC0308_write_cmos_sensor(0x0c , 0x88);
	GC0308_write_cmos_sensor(0x0d , 0x02);
	GC0308_write_cmos_sensor(0x0e , 0x02);
	GC0308_write_cmos_sensor(0x10 , 0x22);
	GC0308_write_cmos_sensor(0x11 , 0xfd);
	GC0308_write_cmos_sensor(0x12 , 0x2a);
	GC0308_write_cmos_sensor(0x13 , 0x00);
	GC0308_write_cmos_sensor(0x14 , 0x10);
	GC0308_write_cmos_sensor(0x15 , 0x0a);
	GC0308_write_cmos_sensor(0x16 , 0x05);
	GC0308_write_cmos_sensor(0x17 , 0x01);
	GC0308_write_cmos_sensor(0x18 , 0x44);
	GC0308_write_cmos_sensor(0x19 , 0x44);
	GC0308_write_cmos_sensor(0x1a , 0x1e);
	GC0308_write_cmos_sensor(0x1b , 0x00);
	GC0308_write_cmos_sensor(0x1c , 0xc1);
	GC0308_write_cmos_sensor(0x1d , 0x08);
	GC0308_write_cmos_sensor(0x1e , 0x60);
	GC0308_write_cmos_sensor(0x1f , 0x16);

	
	GC0308_write_cmos_sensor(0x20 , 0xff);
	GC0308_write_cmos_sensor(0x21 , 0xf8);
	GC0308_write_cmos_sensor(0x22 , 0x57);
	GC0308_write_cmos_sensor(0x24 , 0xa0);
	GC0308_write_cmos_sensor(0x25 , 0x0f);
	                         
	//output sync_mode       
	GC0308_write_cmos_sensor(0x26 , 0x03);
	GC0308_write_cmos_sensor(0x2f , 0x01);
	GC0308_write_cmos_sensor(0x30 , 0xf7);
	GC0308_write_cmos_sensor(0x31 , 0x50);
	GC0308_write_cmos_sensor(0x32 , 0x00);
	GC0308_write_cmos_sensor(0x39 , 0x04);
	GC0308_write_cmos_sensor(0x3a , 0x18);
	GC0308_write_cmos_sensor(0x3b , 0x20);
	GC0308_write_cmos_sensor(0x3c , 0x00);
	GC0308_write_cmos_sensor(0x3d , 0x00);
	GC0308_write_cmos_sensor(0x3e , 0x00);
	GC0308_write_cmos_sensor(0x3f , 0x00);
	GC0308_write_cmos_sensor(0x50 , 0x10);
	GC0308_write_cmos_sensor(0x53 , 0x82);
	GC0308_write_cmos_sensor(0x54 , 0x80);
	GC0308_write_cmos_sensor(0x55 , 0x80);
	GC0308_write_cmos_sensor(0x56 , 0x82);
	GC0308_write_cmos_sensor(0x8b , 0x40);
	GC0308_write_cmos_sensor(0x8c , 0x40);
	GC0308_write_cmos_sensor(0x8d , 0x40);
	GC0308_write_cmos_sensor(0x8e , 0x2e);
	GC0308_write_cmos_sensor(0x8f , 0x2e);
	GC0308_write_cmos_sensor(0x90 , 0x2e);
	GC0308_write_cmos_sensor(0x91 , 0x3c);
	GC0308_write_cmos_sensor(0x92 , 0x50);
	GC0308_write_cmos_sensor(0x5d , 0x12);
	GC0308_write_cmos_sensor(0x5e , 0x1a);
	GC0308_write_cmos_sensor(0x5f , 0x24);
	GC0308_write_cmos_sensor(0x60 , 0x07);
	GC0308_write_cmos_sensor(0x61 , 0x15);
	GC0308_write_cmos_sensor(0x62 , 0x08);
	GC0308_write_cmos_sensor(0x64 , 0x03);
	GC0308_write_cmos_sensor(0x66 , 0xe8);
	GC0308_write_cmos_sensor(0x67 , 0x86);
	GC0308_write_cmos_sensor(0x68 , 0xa2);
	GC0308_write_cmos_sensor(0x69 , 0x18);
	GC0308_write_cmos_sensor(0x6a , 0x0f);
	GC0308_write_cmos_sensor(0x6b , 0x00);
	GC0308_write_cmos_sensor(0x6c , 0x5f);
	GC0308_write_cmos_sensor(0x6d , 0x8f);
	GC0308_write_cmos_sensor(0x6e , 0x55);
	GC0308_write_cmos_sensor(0x6f , 0x38);
	GC0308_write_cmos_sensor(0x70 , 0x15);
	GC0308_write_cmos_sensor(0x71 , 0x33);
	GC0308_write_cmos_sensor(0x72 , 0xdc);
	GC0308_write_cmos_sensor(0x73 , 0x80);
	GC0308_write_cmos_sensor(0x74 , 0x02);
	GC0308_write_cmos_sensor(0x75 , 0x3f);
	GC0308_write_cmos_sensor(0x76 , 0x02);
	GC0308_write_cmos_sensor(0x77 , 0x36);
	GC0308_write_cmos_sensor(0x78 , 0x88);
	GC0308_write_cmos_sensor(0x79 , 0x81);
	GC0308_write_cmos_sensor(0x7a , 0x81);
	GC0308_write_cmos_sensor(0x7b , 0x22);
	GC0308_write_cmos_sensor(0x7c , 0xff);
	GC0308_write_cmos_sensor(0x93 , 0x48);
	GC0308_write_cmos_sensor(0x94 , 0x00);
	GC0308_write_cmos_sensor(0x95 , 0x05);
	GC0308_write_cmos_sensor(0x96 , 0xe8);
	GC0308_write_cmos_sensor(0x97 , 0x40);
	GC0308_write_cmos_sensor(0x98 , 0xf0);
	GC0308_write_cmos_sensor(0xb1 , 0x38);
	GC0308_write_cmos_sensor(0xb2 , 0x38);
	GC0308_write_cmos_sensor(0xbd , 0x38);
	GC0308_write_cmos_sensor(0xbe , 0x36);
	GC0308_write_cmos_sensor(0xd0 , 0xc9);
	GC0308_write_cmos_sensor(0xd1 , 0x10);
	//GC0308_write_cmos_sensor(0xd2 , 0x90);
	GC0308_write_cmos_sensor(0xd3 , 0x80);
	GC0308_write_cmos_sensor(0xd5 , 0xf2);
	GC0308_write_cmos_sensor(0xd6 , 0x16);
	GC0308_write_cmos_sensor(0xdb , 0x92);
	GC0308_write_cmos_sensor(0xdc , 0xa5);
	GC0308_write_cmos_sensor(0xdf , 0x23);
	GC0308_write_cmos_sensor(0xd9 , 0x00);
	GC0308_write_cmos_sensor(0xda , 0x00);
	GC0308_write_cmos_sensor(0xe0 , 0x09);
	GC0308_write_cmos_sensor(0xec , 0x20);
	GC0308_write_cmos_sensor(0xed , 0x04);
	GC0308_write_cmos_sensor(0xee , 0xa0);
	GC0308_write_cmos_sensor(0xef , 0x40);
	GC0308_write_cmos_sensor(0x80 , 0x03);
	GC0308_write_cmos_sensor(0x80 , 0x03);
	GC0308_write_cmos_sensor(0x9F , 0x10);
	GC0308_write_cmos_sensor(0xA0 , 0x20);
	GC0308_write_cmos_sensor(0xA1 , 0x38);
	GC0308_write_cmos_sensor(0xA2 , 0x4E);
	GC0308_write_cmos_sensor(0xA3 , 0x63);
	GC0308_write_cmos_sensor(0xA4 , 0x76);
	GC0308_write_cmos_sensor(0xA5 , 0x87);
	GC0308_write_cmos_sensor(0xA6 , 0xA2);
	GC0308_write_cmos_sensor(0xA7 , 0xB8);
	GC0308_write_cmos_sensor(0xA8 , 0xCA);
	GC0308_write_cmos_sensor(0xA9 , 0xD8);
	GC0308_write_cmos_sensor(0xAA , 0xE3);
	GC0308_write_cmos_sensor(0xAB , 0xEB);
	GC0308_write_cmos_sensor(0xAC , 0xF0);
	GC0308_write_cmos_sensor(0xAD , 0xF8);
	GC0308_write_cmos_sensor(0xAE , 0xFD);
	GC0308_write_cmos_sensor(0xAF , 0xFF);
	GC0308_write_cmos_sensor(0xc0 , 0x00);
	GC0308_write_cmos_sensor(0xc1 , 0x10);
	GC0308_write_cmos_sensor(0xc2 , 0x1C);
	GC0308_write_cmos_sensor(0xc3 , 0x30);
	GC0308_write_cmos_sensor(0xc4 , 0x43);
	GC0308_write_cmos_sensor(0xc5 , 0x54);
	GC0308_write_cmos_sensor(0xc6 , 0x65);
	GC0308_write_cmos_sensor(0xc7 , 0x75);
	GC0308_write_cmos_sensor(0xc8 , 0x93);
	GC0308_write_cmos_sensor(0xc9 , 0xB0);
	GC0308_write_cmos_sensor(0xca , 0xCB);
	GC0308_write_cmos_sensor(0xcb , 0xE6);
	GC0308_write_cmos_sensor(0xcc , 0xFF);
	GC0308_write_cmos_sensor(0xf0 , 0x02);
	GC0308_write_cmos_sensor(0xf1 , 0x01);
	GC0308_write_cmos_sensor(0xf2 , 0x01);
	GC0308_write_cmos_sensor(0xf3 , 0x30);
	GC0308_write_cmos_sensor(0xf9 , 0x9f);
	GC0308_write_cmos_sensor(0xfa , 0x78);

	//---------------------------------------------------------------
	GC0308_SET_PAGE1;

	GC0308_write_cmos_sensor(0x00 , 0xf5);
	GC0308_write_cmos_sensor(0x02 , 0x1a);
	GC0308_write_cmos_sensor(0x0a , 0xa0);
	GC0308_write_cmos_sensor(0x0b , 0x60);
	GC0308_write_cmos_sensor(0x0c , 0x08);
	GC0308_write_cmos_sensor(0x0e , 0x4c);
	GC0308_write_cmos_sensor(0x0f , 0x39);
	GC0308_write_cmos_sensor(0x11 , 0x3f);
	GC0308_write_cmos_sensor(0x12 , 0x72);
	GC0308_write_cmos_sensor(0x13 , 0x13);
	GC0308_write_cmos_sensor(0x14 , 0x42);
	GC0308_write_cmos_sensor(0x15 , 0x43);
	GC0308_write_cmos_sensor(0x16 , 0xc2);
	GC0308_write_cmos_sensor(0x17 , 0xa8);
	GC0308_write_cmos_sensor(0x18 , 0x18);
	GC0308_write_cmos_sensor(0x19 , 0x40);
	GC0308_write_cmos_sensor(0x1a , 0xd0);
	GC0308_write_cmos_sensor(0x1b , 0xf5);
	GC0308_write_cmos_sensor(0x70 , 0x40);
	GC0308_write_cmos_sensor(0x71 , 0x58);
	GC0308_write_cmos_sensor(0x72 , 0x30);
	GC0308_write_cmos_sensor(0x73 , 0x48);
	GC0308_write_cmos_sensor(0x74 , 0x20);
	GC0308_write_cmos_sensor(0x75 , 0x60);
	GC0308_write_cmos_sensor(0x77 , 0x20);
	GC0308_write_cmos_sensor(0x78 , 0x32);
	GC0308_write_cmos_sensor(0x30 , 0x03);
	GC0308_write_cmos_sensor(0x31 , 0x40);
	GC0308_write_cmos_sensor(0x32 , 0xe0);
	GC0308_write_cmos_sensor(0x33 , 0xe0);
	GC0308_write_cmos_sensor(0x34 , 0xe0);
	GC0308_write_cmos_sensor(0x35 , 0xb0);
	GC0308_write_cmos_sensor(0x36 , 0xc0);
	GC0308_write_cmos_sensor(0x37 , 0xc0);
	GC0308_write_cmos_sensor(0x38 , 0x04);
	GC0308_write_cmos_sensor(0x39 , 0x09);
	GC0308_write_cmos_sensor(0x3a , 0x12);
	GC0308_write_cmos_sensor(0x3b , 0x1C);
	GC0308_write_cmos_sensor(0x3c , 0x28);
	GC0308_write_cmos_sensor(0x3d , 0x31);
	GC0308_write_cmos_sensor(0x3e , 0x44);
	GC0308_write_cmos_sensor(0x3f , 0x57);
	GC0308_write_cmos_sensor(0x40 , 0x6C);
	GC0308_write_cmos_sensor(0x41 , 0x81);
	GC0308_write_cmos_sensor(0x42 , 0x94);
	GC0308_write_cmos_sensor(0x43 , 0xA7);
	GC0308_write_cmos_sensor(0x44 , 0xB8);
	GC0308_write_cmos_sensor(0x45 , 0xD6);
	GC0308_write_cmos_sensor(0x46 , 0xEE);
	GC0308_write_cmos_sensor(0x47 , 0x0d); 
	
	GC0308_SET_PAGE0;

    	GC0308_write_cmos_sensor(0xd2 , 0x90);  // Open AEC at last.  

	GC0308_sensor.preview_pclk = 240;

} /* GC0308_YUV_sensor_initial_setting */

/*************************************************************************
* FUNCTION
*	GC0308_GAMMA_Select
*
* DESCRIPTION
*	This function is served for FAE to select the appropriate GAMMA curve.
*
* PARAMETERS
*	None
*
* RETURNS
*	None
*
* GLOBALS AFFECTED
*
*************************************************************************/
void GC0308_GAMMA_Select(kal_uint32 GammaLvl)
{
	switch(GammaLvl)
	{
		case 1:                                             //smallest gamma curve
			GC0308_write_cmos_sensor( 0x9F, 0x0B ); 
			GC0308_write_cmos_sensor( 0xA0, 0x16 ); 
			GC0308_write_cmos_sensor( 0xA1, 0x29 ); 
			GC0308_write_cmos_sensor( 0xA2, 0x3C ); 
			GC0308_write_cmos_sensor( 0xA3, 0x4F ); 
			GC0308_write_cmos_sensor( 0xA4, 0x5F ); 
			GC0308_write_cmos_sensor( 0xA5, 0x6F ); 
			GC0308_write_cmos_sensor( 0xA6, 0x8A ); 
			GC0308_write_cmos_sensor( 0xA7, 0x9F ); 
			GC0308_write_cmos_sensor( 0xA8, 0xB4 ); 
			GC0308_write_cmos_sensor( 0xA9, 0xC6 ); 
			GC0308_write_cmos_sensor( 0xAA, 0xD3 ); 
			GC0308_write_cmos_sensor( 0xAB, 0xDD );  
			GC0308_write_cmos_sensor( 0xAC, 0xE5 );  
			GC0308_write_cmos_sensor( 0xAD, 0xF1 ); 
			GC0308_write_cmos_sensor( 0xAE, 0xFA ); 
			GC0308_write_cmos_sensor( 0xAF, 0xFF ); 	
			break;
		case 2:			
			GC0308_write_cmos_sensor( 0x9F, 0x0E ); 
			GC0308_write_cmos_sensor( 0xA0, 0x1C ); 
			GC0308_write_cmos_sensor( 0xA1, 0x34 ); 
			GC0308_write_cmos_sensor( 0xA2, 0x48 ); 
			GC0308_write_cmos_sensor( 0xA3, 0x5A ); 
			GC0308_write_cmos_sensor( 0xA4, 0x6B ); 
			GC0308_write_cmos_sensor( 0xA5, 0x7B ); 
			GC0308_write_cmos_sensor( 0xA6, 0x95 ); 
			GC0308_write_cmos_sensor( 0xA7, 0xAB ); 
			GC0308_write_cmos_sensor( 0xA8, 0xBF );
			GC0308_write_cmos_sensor( 0xA9, 0xCE ); 
			GC0308_write_cmos_sensor( 0xAA, 0xD9 ); 
			GC0308_write_cmos_sensor( 0xAB, 0xE4 );  
			GC0308_write_cmos_sensor( 0xAC, 0xEC ); 
			GC0308_write_cmos_sensor( 0xAD, 0xF7 ); 
			GC0308_write_cmos_sensor( 0xAE, 0xFD ); 
			GC0308_write_cmos_sensor( 0xAF, 0xFF ); 
		break;
		case 3:
			GC0308_write_cmos_sensor( 0x9F, 0x10 ); 
			GC0308_write_cmos_sensor( 0xA0, 0x20 ); 
			GC0308_write_cmos_sensor( 0xA1, 0x38 ); 
			GC0308_write_cmos_sensor( 0xA2, 0x4E ); 
			GC0308_write_cmos_sensor( 0xA3, 0x63 ); 
			GC0308_write_cmos_sensor( 0xA4, 0x76 ); 
			GC0308_write_cmos_sensor( 0xA5, 0x87 ); 
			GC0308_write_cmos_sensor( 0xA6, 0xA2 ); 
			GC0308_write_cmos_sensor( 0xA7, 0xB8 ); 
			GC0308_write_cmos_sensor( 0xA8, 0xCA ); 
			GC0308_write_cmos_sensor( 0xA9, 0xD8 ); 
			GC0308_write_cmos_sensor( 0xAA, 0xE3 ); 
			GC0308_write_cmos_sensor( 0xAB, 0xEB ); 
			GC0308_write_cmos_sensor( 0xAC, 0xF0 ); 
			GC0308_write_cmos_sensor( 0xAD, 0xF8 ); 
			GC0308_write_cmos_sensor( 0xAE, 0xFD ); 
			GC0308_write_cmos_sensor( 0xAF, 0xFF ); 

			break;
		case 4:
			GC0308_write_cmos_sensor( 0x9F, 0x14 ); 
			GC0308_write_cmos_sensor( 0xA0, 0x28 ); 
			GC0308_write_cmos_sensor( 0xA1, 0x44 ); 
			GC0308_write_cmos_sensor( 0xA2, 0x5D ); 
			GC0308_write_cmos_sensor( 0xA3, 0x72 ); 
			GC0308_write_cmos_sensor( 0xA4, 0x86 ); 
			GC0308_write_cmos_sensor( 0xA5, 0x95 ); 
			GC0308_write_cmos_sensor( 0xA6, 0xB1 ); 
			GC0308_write_cmos_sensor( 0xA7, 0xC6 ); 
			GC0308_write_cmos_sensor( 0xA8, 0xD5 ); 
			GC0308_write_cmos_sensor( 0xA9, 0xE1 ); 
			GC0308_write_cmos_sensor( 0xAA, 0xEA ); 
			GC0308_write_cmos_sensor( 0xAB, 0xF1 ); 
			GC0308_write_cmos_sensor( 0xAC, 0xF5 ); 
			GC0308_write_cmos_sensor( 0xAD, 0xFB ); 
			GC0308_write_cmos_sensor( 0xAE, 0xFE ); 
			GC0308_write_cmos_sensor( 0xAF, 0xFF );
		break;
		case 5:								// largest gamma curve
			GC0308_write_cmos_sensor( 0x9F, 0x15 ); 
			GC0308_write_cmos_sensor( 0xA0, 0x2A ); 
			GC0308_write_cmos_sensor( 0xA1, 0x4A ); 
			GC0308_write_cmos_sensor( 0xA2, 0x67 ); 
			GC0308_write_cmos_sensor( 0xA3, 0x79 ); 
			GC0308_write_cmos_sensor( 0xA4, 0x8C ); 
			GC0308_write_cmos_sensor( 0xA5, 0x9A ); 
			GC0308_write_cmos_sensor( 0xA6, 0xB3 ); 
			GC0308_write_cmos_sensor( 0xA7, 0xC5 ); 
			GC0308_write_cmos_sensor( 0xA8, 0xD5 ); 
			GC0308_write_cmos_sensor( 0xA9, 0xDF ); 
			GC0308_write_cmos_sensor( 0xAA, 0xE8 ); 
			GC0308_write_cmos_sensor( 0xAB, 0xEE ); 
			GC0308_write_cmos_sensor( 0xAC, 0xF3 ); 
			GC0308_write_cmos_sensor( 0xAD, 0xFA ); 
			GC0308_write_cmos_sensor( 0xAE, 0xFD ); 
			GC0308_write_cmos_sensor( 0xAF, 0xFF );
			break;
		default:
		break;
	}
}

/*************************************************************************
* FUNCTION
*	GC0308_Write_More_Registers
*
* DESCRIPTION
*	This function is served for FAE to modify the necessary Init Regs. Do not modify the regs
*     in init_GC0308() directly.
*
* PARAMETERS
*	None
*
* RETURNS
*	None
*
* GLOBALS AFFECTED
*
*************************************************************************/
void GC0308_Write_More_Registers(void)
{
	//  TODO: FAE Modify the Init Regs here!!! 

	//-----------Update the registers 2010/07/07-------------//

	//Registers of Page0
	GC0308_SET_PAGE0; 

	GC0308_write_cmos_sensor(0x10 , 0x26);                                 
	GC0308_write_cmos_sensor(0x11 , 0x0d);  	// fd,modified by mormo 2010/07/06                               
	GC0308_write_cmos_sensor(0x1a , 0x2a);  	// 1e,modified by mormo 2010/07/06                                  

	GC0308_write_cmos_sensor(0x1c , 0x49); 	// c1,modified by mormo 2010/07/06                                 
	GC0308_write_cmos_sensor(0x1d , 0x9a);	// 08,modified by mormo 2010/07/06                                 
	GC0308_write_cmos_sensor(0x1e , 0x61);	// 60,modified by mormo 2010/07/06                                 

	GC0308_write_cmos_sensor(0x3a , 0x20);

	GC0308_write_cmos_sensor(0x50 , 0x14);  	// 10,modified by mormo 2010/07/06                               
	GC0308_write_cmos_sensor(0x53 , 0x80);                                  
	GC0308_write_cmos_sensor(0x56 , 0x80);
	
	GC0308_write_cmos_sensor(0x8b , 0x20); 	//LSC                                 
	GC0308_write_cmos_sensor(0x8c , 0x20);                                  
	GC0308_write_cmos_sensor(0x8d , 0x20);                                  
	GC0308_write_cmos_sensor(0x8e , 0x14);                                  
	GC0308_write_cmos_sensor(0x8f , 0x10);                                  
	GC0308_write_cmos_sensor(0x90 , 0x14);                                  

	GC0308_write_cmos_sensor(0x94 , 0x02);                                  
	GC0308_write_cmos_sensor(0x95 , 0x07);                                  
	GC0308_write_cmos_sensor(0x96 , 0xe0);                                  

	GC0308_write_cmos_sensor(0xb1 , 0x40); // YCPT                                 
	GC0308_write_cmos_sensor(0xb2 , 0x40);                                  
	GC0308_write_cmos_sensor(0xb3 , 0x40);
	GC0308_write_cmos_sensor(0xb6 , 0xe0);

	GC0308_write_cmos_sensor(0xd0 , 0xcb); // AECT  c9,modifed by mormo 2010/07/06                                
	GC0308_write_cmos_sensor(0xd3 , 0x48); // 80,modified by mormor 2010/07/06                           

	GC0308_write_cmos_sensor(0xf2 , 0x02);                                  
	GC0308_write_cmos_sensor(0xf7 , 0x12);
	GC0308_write_cmos_sensor(0xf8 , 0x0a);

	//Registers of Page1
	GC0308_SET_PAGE1;

	GC0308_write_cmos_sensor(0x02 , 0x20);
	GC0308_write_cmos_sensor(0x04 , 0x10);
	GC0308_write_cmos_sensor(0x05 , 0x08);
	GC0308_write_cmos_sensor(0x06 , 0x20);
	GC0308_write_cmos_sensor(0x08 , 0x0a);

	GC0308_write_cmos_sensor(0x0e , 0x44);                                  
	GC0308_write_cmos_sensor(0x0f , 0x32);
	GC0308_write_cmos_sensor(0x10 , 0x41);                                  
	GC0308_write_cmos_sensor(0x11 , 0x37);                                  
	GC0308_write_cmos_sensor(0x12 , 0x22);                                  
	GC0308_write_cmos_sensor(0x13 , 0x19);                                  
	GC0308_write_cmos_sensor(0x14 , 0x44);                                  
	GC0308_write_cmos_sensor(0x15 , 0x44);  
	
	GC0308_write_cmos_sensor(0x19 , 0x50);                                  
	GC0308_write_cmos_sensor(0x1a , 0xd8); 
	
	GC0308_write_cmos_sensor(0x32 , 0x10); 
	
	GC0308_write_cmos_sensor(0x35 , 0x00);                                  
	GC0308_write_cmos_sensor(0x36 , 0x80);                                  
	GC0308_write_cmos_sensor(0x37 , 0x00); 
	//-----------Update the registers end---------//

    	GC0308_SET_PAGE0; 
    	/*Customer can adjust GAMMA, MIRROR & UPSIDEDOWN here!*/
	
    	GC0308_GAMMA_Select(2);
}

/*************************************************************************
* FUNCTION
*	GC0308_PV_setting
*
* DESCRIPTION
*	This function apply the preview mode setting, normal the preview size is 1/4 of full size.
*	Ex. VGA
*	Preview: 640 x 480 (Use sub-sample or binning to acheive it)
*	Full Size: 640 x 480 (Output every effective pixels.)
*
* PARAMETERS
*	1. image_sensor_exposure_window_struct : Set the grab start x,y and width,height.
*	2. image_sensor_config_struct : Current operation mode.
*
* RETURNS
*	None
*
*************************************************************************/
static void GC0308_PV_setting(image_sensor_exposure_window_struct *image_window, image_sensor_config_struct *sensor_config_data)
{
	GC0308_sensor.preview_pclk = 240;
	GC0308_op_state.is_PV_mode = KAL_TRUE;
} /* GC0308_PV_setting */

/*************************************************************************
* FUNCTION
*	GC0308_CAP_setting
*
* DESCRIPTION
*	This function apply the full size mode setting.
*	VGA
*	Preview: 640 x 480 (Use sub-sample or binning to acheive it)
*	Full Size: 640 x 480 (Output every effective pixels.)
*
* PARAMETERS
*	1. image_sensor_exposure_window_struct : Set the grab start x,y and width,height.
*	2. image_sensor_config_struct : Current operation mode.
*
* RETURNS
*	None
*
*************************************************************************/
static void GC0308_CAP_setting(image_sensor_exposure_window_struct *image_window, image_sensor_config_struct *sensor_config_data)
{
	kal_uint16 temp = 0;
	
	//calculator auto uv
	GC0308_sensor.capture_pclk = 240;
	GC0308_op_state.is_PV_mode = KAL_FALSE;
	
} /* GC0308_CAP_setting */

/*************************************************************************
* FUNCTION
*	GC0308_Get_Video_Frame_Rate
*
* DESCRIPTION
*	This function base on night mode or normal mode and video record resolution to 
*	get the required frame rate for each baseband and each encode mode from LUT.
*	This function will used only when video mode. Currently, three video mode is included:
*	MPEG4, MJPG, FULL_VIDEO(3G Video Call).
*
* PARAMETERS
*	1. kal_bool : KAL_TRUE - night mode, KAL_FALSE - normal mode.
*	2. kal_uint16 : Video target record width
*	3. kal_uint16 : Video target record height
*
* RETURNS
*	kal_uint32 : Return the target frame rate for current video mode.
*
*************************************************************************/
static kal_uint32 GC0308_Get_Video_Frame_Rate(kal_bool night_mode, kal_uint16 target_width, kal_uint16 target_height)
{
	kal_uint16 idx = 0;
	kal_uint32 video_frame_rate = 0;
	GC0308_FRAME_RATE_LUT *p_lut = NULL;
	kal_uint16 lut_items = 0;

	if (GC0308_op_state.MJPEG_encode_mode == KAL_TRUE)
	{
		p_lut = &(GC0308_MJPEG_frame_rate_lut[0]);
		lut_items = sizeof(GC0308_MJPEG_frame_rate_lut) / sizeof(GC0308_MJPEG_frame_rate_lut[0]);
	}
	else if (GC0308_op_state.MPEG4_encode_mode == KAL_TRUE)
	{
		p_lut = &(GC0308_MPEG4_frame_rate_lut[0]);
		lut_items = sizeof(GC0308_MPEG4_frame_rate_lut) / sizeof(GC0308_MPEG4_frame_rate_lut[0]);
	}
	else if (GC0308_op_state.FULLVIDEO_encode_mode == KAL_TRUE)
	{
		p_lut = &(GC0308_FULLVIDEO_frame_rate_lut[0]);
		lut_items = sizeof(GC0308_FULLVIDEO_frame_rate_lut) / sizeof(GC0308_FULLVIDEO_frame_rate_lut[0]);
	}
	else
	{
		/* Set one default, but it should not occur at all.  */
		if (night_mode == KAL_TRUE)
		{
			video_frame_rate = 75;
		}
		else
		{
			video_frame_rate = 150;
		}
		
		return video_frame_rate;
	}
	

	for (idx=0; idx<lut_items; idx++)
	{
		if (target_width == p_lut->TargetWidth \
			&& target_height == p_lut->TargetHeight)
		{
			if (night_mode == KAL_FALSE)
			{
				video_frame_rate = p_lut->NormalModeFrameRate;
			}
			else
			{
				video_frame_rate = p_lut->NightModeFrameRate;
			}
		}

		p_lut++;		/* Find next item. */
	}

	if (video_frame_rate == 0)
	{
		/* It means the target record width or height is not normal, need check with video guys. */
		/* Set one default frame rate when the record size can't find out. */
		if (night_mode == KAL_TRUE)
		{
			video_frame_rate = 75;
		}
		else
		{
			video_frame_rate = 150;
		}
	}

	return video_frame_rate;	
}

/*************************************************************************
* FUNCTION
*	GC0308_Set_Video_Frame_Rate
*
* DESCRIPTION
*	This function set the sensor output frmae to target frame and fix the frame rate for 
*	video encode.
*
* PARAMETERS
*	1. kal_uint32 : Target frame rate to fixed.
*
* RETURNS
*	None
*
*************************************************************************/
static void GC0308_Set_Video_Frame_Rate(kal_uint32 frame_rate)
{

}

/*************************************************************************
* FUNCTION
*	GC0308_power_on
*
* DESCRIPTION
*	This function apply the power on sequence and read the sensor ID to check if the I2C
*	communication can work or not?
*
* PARAMETERS
*	None
*
* RETURNS
*	kal_uint32 : The read sensor ID.
*
*************************************************************************/
kal_uint32 GC0308_power_on(void)
{
	volatile kal_uint32 i = 0;
	kal_uint8 temp_sccb_addr = 0;
	kal_uint32 sensor_id = 0;

	//4 <1>set polarity (to BB)
	SET_CMOS_CLOCK_POLARITY_LOW;
	SET_VSYNC_POLARITY_HIGH;
	SET_HSYNC_POLARITY_LOW;	/* Notice: the sensor ouput of HSYNC should set to high valid. */
	
	//4 <2>set data format to ISP (to BB)
	/* Enable - Connect to D2 ~ D9, Disable - D0 ~ D7, take effect for YUV type only. */
	ENABLE_CAMERA_INDATA_FORMAT;
	SET_CAMERA_INPUT_TYPE(INPUT_YUV422);
	SET_CAMERA_INPUT_ORDER(INPUT_ORDER_YCrY1Cb);		// Set the inpurt order.
	
	//4 <3>set ISP driving current (to BB)
	set_isp_driving_current(ISP_DRIVING_4MA);	/* 2MA, 4MA, 6MA, 8MA */
	
	//4 <4> power on (to sensor)
	cis_module_power_on(KAL_TRUE);      // Power On CIS Power
	kal_sleep_task(1);                  // To wait for Stable Power

	//4<5> hardware reset sensor (to BB)
	GC0308_Enable_Output_MCLK(240);	/* Enable the master clock. 240, 260 */
	kal_sleep_task(1);
	
	//4 <6> disable power down (to BB)
	GC0308_SET_PDN_LOW;
	kal_sleep_task(1);
	
	//4 <7> hardware reset sensor (to BB)
	GC0308_SET_RESET_HIGH; //Sensor RESET pin high
	kal_sleep_task(1);
	GC0308_SET_RESET_LOW; //Sensor RESET pin low
	kal_sleep_task(4);
	GC0308_SET_RESET_HIGH; //Sensor RESET pin high
	kal_sleep_task(2);

	//4 <8>check sensor ID (to sensor)
	for (i=0; i<(sizeof(GC0308_sccb_addr)/sizeof(GC0308_sccb_addr[0])); i++)
	{
		/* 0xFF is not a valid sensor write ID. */
		if (GC0308_sccb_addr[i] == 0xFF)	
		{
			continue;
		}
		
		GC0308_sensor.sccb_write_id		= GC0308_sccb_addr[i];
		GC0308_sensor.sccb_read_id		= (GC0308_sensor.sccb_write_id | 1);
	#ifdef GC0308_HW_SCCB
		i2c_set_get_handle_wait(SCCB_OWNER_CAMERA, KAL_TRUE);
		i2c_set_slave_address(SCCB_OWNER_CAMERA, GC0308_sensor.sccb_write_id);
		i2c_set_transaction_mode(SCCB_OWNER_CAMERA, SCCB_TRANSACTION_FAST_MODE, SCCB_400KB);
		kal_sleep_task(1);
	#endif

		//4 <9>software reset sensor and wait (to sensor)
		GC0308_write_cmos_sensor(0xfe, 0x80);
		kal_sleep_task(1);
		
		sensor_id = GC0308_read_cmos_sensor(0x00);
	#ifdef __GC0308_DEBUG_TRACE__
		kal_wap_trace(MOD_ENG, TRACE_INFO, "[GC0308_power_on], write_id=%x, sensor_id =%x", GC0308_sensor.sccb_write_id, sensor_id);
	#endif
		if (sensor_id == GC0308_SENSOR_ID)
		{
			/* Swap the correct i2c address to first one, it will speed up next time read sensor ID */
			temp_sccb_addr = GC0308_sccb_addr[0];
			GC0308_sccb_addr[0] = GC0308_sccb_addr[i];
			GC0308_sccb_addr[i] = temp_sccb_addr;
			break;
		}
	}
	
	GC0308_op_state.is_panorama_capturing = KAL_FALSE;
	
	return sensor_id;
}    /* GC0308_power_on */

/*************************************************************************
* FUNCTION
*	GC0308_power_on
*
* DESCRIPTION
*	This function apply the power off sequence and power off the BB's pll to avoid current leak.
*
* PARAMETERS
*	None
*
* RETURNS
*	None
*
*************************************************************************/
void GC0308_power_off(void)
{
#ifdef __GC0308_DEBUG_TRACE__
	kal_wap_trace(MOD_ENG, TRACE_INFO, "GC0308_Power off");
#endif

	//4 <1>check sensor ID (to sensor)
	GC0308_SET_RESET_LOW;
	kal_sleep_task(3);

	//4 <2>check sensor ID (to sensor)
	cis_module_power_on(KAL_FALSE);      // Power Off CIS Power

	//4 <3>check sensor ID (to sensor)
	GC0308_Disable_Output_MCLK();
}    /* GC0308_power_off */

/*************************************************************************
* FUNCTION
*	GC0308_init
*
* DESCRIPTION
*	This function power on the sensor and read sensor id.
*
* PARAMETERS
*	None
*
* RETURNS
*	kal_int8 : -1 - I2C communication problem, read sensor ID fail. 1 - I2C OK.
*
*************************************************************************/
kal_int8 GC0308_init(void)
{
	kal_uint32 sensor_id = 0;
	
	sensor_id = GC0308_power_on();
	
	if (sensor_id != GC0308_SENSOR_ID)
	{
		return -1;
	}

	GC0308_sensor.pv_shutter = 0;
	GC0308_sensor.pv_extra_shutter = 0;

	/* Initail Sequence Write In. */
#ifdef GC0308_LOAD_FROM_T_FLASH
	if (GC0308_Initialize_from_T_Flash()) 		/* For debug use. */
	{
		/* If load from t-flash success, then do nothing. */
	}
	else	/* Failed, load from the image load. */
#endif
	{
		GC0308_YUV_sensor_initial_setting();		/* Apply the sensor initial setting */
		GC0308_Write_More_Registers();
	}
	
	return 1;
}    /* GC0308_init */

/*************************************************************************
* FUNCTION
*	GC0308_detect_sensor_id
*
* DESCRIPTION
*	This function power on the sensor and detect the sensor id used for dual camera 
*	and	backup camera.
*
* PARAMETERS
*	None
*
* RETURNS
*	kal_uint32 : The detected sensor ID.
*
*************************************************************************/
kal_uint32 GC0308_detect_sensor_id(void)
{
	kal_uint32 sensor_id = 0;

	sensor_id = GC0308_power_on();
	
	if (sensor_id != GC0308_SENSOR_ID)
	{
		cis_module_power_on(KAL_FALSE);
	}
	
	return sensor_id;
}    /* GC0308_init */

/*************************************************************************
* FUNCTION
*	GC0308_GetID
*
* DESCRIPTION
*	This function used to get the slave address(Write ID & Read ID).
*
* PARAMETERS
*	kal_uint8 : Write ID
*	kal_uint8 : Read ID
*
* RETURNS
*	None
*
*************************************************************************/
void GC0308_GetID(kal_uint8 *sensor_write_id, kal_uint8 *sensor_read_id)
{
	*sensor_write_id 	= GC0308_sensor.sccb_write_id;
	*sensor_read_id 	= GC0308_sensor.sccb_read_id;
}    /* GC0308_GetID */

/*************************************************************************
* FUNCTION
*	GC0308_GetSize
*
* DESCRIPTION
*	This function used to get the full size resolution
*
* PARAMETERS
*	kal_uint16 : Sensor width, return the full size width & height is OK.
*	kal_uint16 : Sensor height
*
* RETURNS
*	None
*
*************************************************************************/
void GC0308_GetSize(kal_uint16 *sensor_width, kal_uint16 *sensor_height)
{
	*sensor_width 	= GC0308_IMAGE_SENSOR_FULL_WIDTH;        /* pixel numbers actually used in one frame */
	*sensor_height 	= GC0308_IMAGE_SENSOR_FULL_HEIGHT;        /* line numbers actually used in one frame */
}    /* GC0308_GetSize */

/*************************************************************************
* FUNCTION
*	GC0308_GetPeriod
*
* DESCRIPTION
*	This function used to get the full size default line length and frame length.
*
* PARAMETERS
*	kal_uint16 : Default full size line length (valid + horizontal blanking).
*	kal_uint16 : Default full size frame length (valid + vertical blanking).
*
* RETURNS
*	None
*
*************************************************************************/
void GC0308_GetPeriod(kal_uint16 *pixel_number, kal_uint16 *line_number)
{
	*pixel_number 	= GC0308_PV_PERIOD_PIXEL_NUMS;    /* pixel numbers in one period of HSYNC */
	*line_number 	= GC0308_PV_PERIOD_LINE_NUMS;        /* line numbers in one period of VSYNC */
}    /* GC0308_GetPeriod */

/*************************************************************************
* FUNCTION
*	GC0308_preview
*
* DESCRIPTION
*	This function is the most important functions of (Init, Preview & Capture). 
*	1. Apply preview setting, make sensor output preview resolution 800x600 for 2M sensor.
*	2. Record video resolution, and set mode based on the isp operation mode.
*	3. Configure the grab window.
*
* PARAMETERS
*	1. image_sensor_exposure_window_struct : Set the grab start x,y and width,height.
*	2. image_sensor_config_struct : Current operation mode.
*
* RETURNS
*	None
*
*************************************************************************/
void GC0308_preview(image_sensor_exposure_window_struct *image_window, image_sensor_config_struct *sensor_config_data)
{
#ifdef __GC0308_DEBUG_TRACE__
	kal_wap_trace(MOD_ENG, TRACE_INFO, "GC0308_review, isp_op_mode=%d, mirror=%d, Size=%d x %d", \
	sensor_config_data->isp_op_mode, sensor_config_data->image_mirror, \
	image_window->image_target_width, image_window->image_target_height);
#endif
	
	if (sensor_config_data->isp_op_mode == ISP_MJPEG_ENCODE_MODE
		|| sensor_config_data->isp_op_mode == ISP_MPEG4_ENCODE_MODE) 
	{
		// To avoid MJPEG record flash several black frames issue.
		return ;
	}

	GC0308_op_state.sensor_cap_state = KAL_FALSE;
	
	GC0308_PV_setting(image_window, sensor_config_data);
	/* After set exposure line, there should be delay for 2~4 frame time, then enable AEC */
	#if (defined(__DYNAMIC_SENSOR_DELAY__))
		camera_wait_sensor_vd_done();	
	#else
		kal_sleep_task(15);
	#endif

	GC0308_ae_enable(KAL_TRUE);
	GC0308_awb_enable(KAL_TRUE);

	GC0308_op_state.video_target_width = image_window->image_target_width;
	GC0308_op_state.video_target_height = image_window->image_target_height;
	
	/* Default set to video, then set to the each mode by isp_op_mode */
	GC0308_op_state.MJPEG_encode_mode = KAL_FALSE;
	GC0308_op_state.MPEG4_encode_mode = KAL_FALSE;
	GC0308_op_state.FULLVIDEO_encode_mode = KAL_FALSE;
	
	if ((sensor_config_data->isp_op_mode == ISP_MJPEG_ENCODE_MODE)		/* Motion JPEG */
		|| (sensor_config_data->isp_op_mode ==  ISP_MJPEG_PREVIEW_MODE))
	{
		GC0308_op_state.MJPEG_encode_mode = KAL_TRUE;
		
		GC0308_sensor.pv_dummy_pixels = 0;
		GC0308_sensor.pv_dummy_lines = 0;
		
		#if (defined(__DYNAMIC_SENSOR_DELAY__))
			image_window->wait_stable_frame = 3;
		#endif
	}
	else if ((sensor_config_data->isp_op_mode == ISP_MPEG4_ENCODE_MODE)	/* MPEG4 */
		|| (sensor_config_data->isp_op_mode == ISP_MPEG4_PREVIEW_MODE))
	{
		GC0308_op_state.MPEG4_encode_mode = KAL_TRUE;
		
		GC0308_sensor.pv_dummy_pixels = 0;
		GC0308_sensor.pv_dummy_lines = 0;

		#if (defined(__DYNAMIC_SENSOR_DELAY__))
			image_window->wait_stable_frame = 3;
		#endif
	}
#ifdef __MEDIA_VT__
	else if (sensor_config_data->isp_op_mode == ISP_FULLVIDEO_MODE)		/* 3G Video Call */
	{
		GC0308_op_state.FULLVIDEO_encode_mode = KAL_TRUE;
		
		GC0308_sensor.pv_dummy_pixels = 0;
		GC0308_sensor.pv_dummy_lines = 0;
		
		#if (defined(__DYNAMIC_SENSOR_DELAY__))
			image_window->wait_stable_frame = 3;
		#endif
	}
#endif	/* #ifdef __MEDIA_VT__ */
	else																/* Camera & Webcam */
	{
		GC0308_sensor.pv_dummy_pixels = 0;
		GC0308_sensor.pv_dummy_lines = 0;
		
		#if (defined(__DYNAMIC_SENSOR_DELAY__))
			image_window->wait_stable_frame = 3;
		#endif
	}
	
	GC0308_set_mirror(sensor_config_data->image_mirror);
	//GC0308_set_banding(GC0308_sensor.pv_dummy_pixels, GC0308_sensor.pv_dummy_lines);
	
	image_window->grab_start_x = GC0308_PV_GRAB_START_X;
	image_window->grab_start_y = GC0308_PV_GRAB_START_Y;
	image_window->exposure_window_width = GC0308_PV_GRAB_WIDTH;
	image_window->exposure_window_height = GC0308_PV_GRAB_HEIGHT;
}    /* GC0308_preview */

/*************************************************************************
* FUNCTION
*	GC0308_capture
*
* DESCRIPTION
*	This function is the most important functions of (Init, Preview & Capture). 
*	1. Apply capture setting when capture size greatter then preview size, make sensor output 
*		full size, 1600x1200 for 2M sensor.
*	2. Increase the dummy pixels or derease pixel clock based on the digital zoom factor and
*		interpolation times.
*	3. Re-Calculate the shutter and sensor gain, to make the exposure value is same with preview
*	4. Configure the grab window based on sensor output.
*
* PARAMETERS
*	1. image_sensor_exposure_window_struct : Set the grab start x,y and width,height.
*	2. image_sensor_config_struct : Current operation mode.
*
* RETURNS
*	None
*
*************************************************************************/
void GC0308_capture(image_sensor_exposure_window_struct *image_window, image_sensor_config_struct *sensor_config_data)
{
	volatile kal_uint32 shutter = 0, temp_reg = 0;
	kal_uint32 prev_line_len = 0;
	kal_uint32 cap_line_len = 0;
	
#ifdef __GC0308_DEBUG_TRACE__
	kal_wap_trace(MOD_ENG, TRACE_INFO, "GC0308_Capture, isp_op_mode=%d, mirror=%d, Size=%d x %d", \
		sensor_config_data->isp_op_mode, sensor_config_data->image_mirror, \
		image_window->image_target_width, image_window->image_target_height);
#endif
	
	GC0308_op_state.sensor_cap_state = KAL_TRUE;
	
	/* If not WEBCAM mode */
	if (sensor_config_data->frame_rate != 0xF0)
	{
		// turn off AEC/AGC
		GC0308_ae_enable(KAL_FALSE);
		GC0308_awb_enable(KAL_FALSE);
	}
		
	shutter = GC0308_read_shutter();
	GC0308_sensor.pv_sensor_gain = GC0308_read_sensor_gain();
	
#ifdef __GC0308_DEBUG_TRACE__
	kal_wap_trace(MOD_ENG, TRACE_INFO, "GC0308_Capture, GC0308_sensor.pv_sensor_gain=%d, shutter=%d", GC0308_sensor.pv_sensor_gain, shutter);
#endif
	
	if ((image_window->image_target_width <= GC0308_IMAGE_SENSOR_PV_WIDTH)
		&& (image_window->image_target_height <= GC0308_IMAGE_SENSOR_PV_HEIGHT))
	{		/* Capture Size Less than PV Size */
		
		if (sensor_config_data->frame_rate == 0xF0)			/* Webcam mode */
		{
		#if (defined(__DYNAMIC_SENSOR_DELAY__))
			image_window->wait_stable_frame = 0;	// For preview size capture, no need wait stable frame.
		#endif
			
			image_window->grab_start_x = GC0308_PV_GRAB_START_X;
			image_window->grab_start_y = GC0308_PV_GRAB_START_Y;
			image_window->exposure_window_width = GC0308_PV_GRAB_WIDTH;
			image_window->exposure_window_height = GC0308_PV_GRAB_HEIGHT;
			
			/* For web camera mode, the ae is enalbed always, so after apply the grab window. return it directly. */
			return ;
		}
		else												/* Preview Size Still mode */
		{
			if (image_window->digital_zoom_factor >= (ISP_DIGITAL_ZOOM_INTERVAL * 3)) // DZ >= 3x
			{
				GC0308_sensor.cap_dummy_pixels = 0;
				GC0308_sensor.cap_dummy_lines = 0;
			}
			else if (image_window->digital_zoom_factor >= (ISP_DIGITAL_ZOOM_INTERVAL * 2)) // DZ >= 2x
			{
				GC0308_sensor.cap_dummy_pixels = 0;
				GC0308_sensor.cap_dummy_lines = 0;
			}
			else
			{
				GC0308_sensor.cap_dummy_pixels = 0;
				GC0308_sensor.cap_dummy_lines = 0;
			}
			
			GC0308_sensor.capture_pclk = GC0308_sensor.preview_pclk;   //Don't need change the clk for pv capture
			GC0308_set_hb_shutter(GC0308_sensor.cap_dummy_pixels, shutter);

			//prev_line_len = GC0308_PV_PERIOD_PIXEL_NUMS + GC0308_sensor.pv_dummy_pixels;
			//cap_line_len = GC0308_PV_PERIOD_PIXEL_NUMS + GC0308_sensor.cap_dummy_pixels;
			//shutter = (shutter * GC0308_sensor.capture_pclk) / GC0308_sensor.preview_pclk;
			//shutter = (shutter * prev_line_len) / cap_line_len;
			//GC0308_write_shutter(shutter);
			
		#if (defined(__DYNAMIC_SENSOR_DELAY__))
			image_window->wait_stable_frame = 0;	// For preview size capture, no need wait stable frame.
		#endif
			
			image_window->grab_start_x = GC0308_PV_GRAB_START_X;
			image_window->grab_start_y = GC0308_PV_GRAB_START_Y;
			image_window->exposure_window_width = GC0308_PV_GRAB_WIDTH;
			image_window->exposure_window_height = GC0308_PV_GRAB_HEIGHT;
		}
		
	}
	else 
	{    /* FULL Size Capture Mode */
		#if (defined(__DYNAMIC_SENSOR_DELAY__))
			camera_wait_sensor_vd_done();	// Apply the switch size setting from VD. it's more safe.
		#endif
		
		GC0308_CAP_setting(image_window, sensor_config_data);
		
		/* Capture Size <= 2M */
		if ((image_window->image_target_width <= GC0308_IMAGE_SENSOR_FULL_WIDTH)
			&& (image_window->image_target_height <= GC0308_IMAGE_SENSOR_FULL_HEIGHT))
		{
		#if ((defined(DRV_ISP_6238_SERIES) || defined(DRV_ISP_6276_SERIES)))
			if (image_window->digital_zoom_factor >= 400)
			{  
				GC0308_sensor.capture_pclk = 240;
				
				GC0308_sensor.cap_dummy_pixels = 0;
				GC0308_sensor.cap_dummy_lines = 0;
			}
			else if (image_window->digital_zoom_factor >= 200)
			{ 
				GC0308_sensor.capture_pclk = 240;
				
				GC0308_sensor.cap_dummy_pixels = 0;  /*If Capture fail, you can add this dummy*/
				GC0308_sensor.cap_dummy_lines = 0;
			}
			else
			{
				GC0308_sensor.capture_pclk = 240;
				
				GC0308_sensor.cap_dummy_pixels =0;  /*If Capture fail, you can add this dummy*/
				GC0308_sensor.cap_dummy_lines = 0;
			}
		#elif (defined(DRV_ISP_6235_SERIES))
			if (image_window->digital_zoom_factor >= (ISP_DIGITAL_ZOOM_INTERVAL * 3))  // DZ >= 3X
			{   
				GC0308_sensor.capture_pclk = 240; 
				
				GC0308_sensor.cap_dummy_pixels = 0;
				GC0308_sensor.cap_dummy_lines = 0;
			}
			else if (image_window->digital_zoom_factor >= (ISP_DIGITAL_ZOOM_INTERVAL * 2))  // DZ >= 2X
			{
				GC0308_sensor.capture_pclk = 240;
				
				GC0308_sensor.cap_dummy_pixels = 0;
				GC0308_sensor.cap_dummy_lines = 0;
			}
			else 
			{  
				GC0308_sensor.capture_pclk = 240;
				
				GC0308_sensor.cap_dummy_pixels = 0;
			#ifdef DRV_ISP_YUV_BURST_MODE_SUPPORT 
				/* For MT6253 Series chip, limit the max capture frame rate to 8.5fps*/
				GC0308_sensor.cap_dummy_lines = 0;
			#else
				GC0308_sensor.cap_dummy_lines = 0;
			#endif
			}
		#endif
		}
		else    		/* When Capture Size Interpolate to 3M */
		{
		#if ((defined(DRV_ISP_6238_SERIES) || defined(DRV_ISP_6276_SERIES)))
			if (image_window->digital_zoom_factor >= 400)
			{
			 
				GC0308_sensor.capture_pclk = 240;
				
				GC0308_sensor.cap_dummy_pixels = 0;
				GC0308_sensor.cap_dummy_lines = 0;
			}
			else if (image_window->digital_zoom_factor >= 200)
			{
			
				GC0308_sensor.capture_pclk = 240;
				
				GC0308_sensor.cap_dummy_pixels = 0;  /*If Capture fail, you can add this dummy*/
				GC0308_sensor.cap_dummy_lines = 0;
			}
			else
			{ 
				GC0308_sensor.capture_pclk = 240;
				
				GC0308_sensor.cap_dummy_pixels =0;  /*If Capture fail, you can add this dummy*/
				GC0308_sensor.cap_dummy_lines = 0;
			}
		#elif (defined(DRV_ISP_6235_SERIES))
			/* If Capture fail or system hang when capture, you can add dummy pixels for each step.  */
			if (image_window->digital_zoom_factor >= (ISP_DIGITAL_ZOOM_INTERVAL * 3)) // DZ >= 3X
			{
				GC0308_sensor.capture_pclk = 240;
				
				GC0308_sensor.cap_dummy_pixels = 0;
				GC0308_sensor.cap_dummy_lines = 0;
			}
			else if (image_window->digital_zoom_factor >= (ISP_DIGITAL_ZOOM_INTERVAL * 2)) // DZ >= 2x
			{  
				GC0308_sensor.capture_pclk = 240; 
				
				GC0308_sensor.cap_dummy_pixels = 0;
				GC0308_sensor.cap_dummy_lines = 0;
			}
			else if (image_window->digital_zoom_factor > (ISP_DIGITAL_ZOOM_INTERVAL * 1)) // DZ > 1x
			{ 
				GC0308_sensor.capture_pclk = 240;   
				
				GC0308_sensor.cap_dummy_pixels = 0;
				GC0308_sensor.cap_dummy_lines = 0;
			}
			else 
			{
				GC0308_sensor.capture_pclk = 240;
				
				GC0308_sensor.cap_dummy_pixels = 0;
				GC0308_sensor.cap_dummy_lines = 0;
			}
		#endif
		}
		
		GC0308_set_hb_shutter(GC0308_sensor.cap_dummy_pixels, shutter);
		
		//prev_line_len = GC0308_PV_PERIOD_PIXEL_NUMS + GC0308_sensor.pv_dummy_pixels;
		//cap_line_len = GC0308_FULL_PERIOD_PIXEL_NUMS + GC0308_sensor.cap_dummy_pixels;
		//shutter = (shutter * GC0308_sensor.capture_pclk) / GC0308_sensor.preview_pclk;
		//shutter = (shutter * prev_line_len) / cap_line_len;
		//shutter *= 2;			/* By sensor design */
		//GC0308_write_shutter(shutter);

	#if (defined(__DYNAMIC_SENSOR_DELAY__))
		image_window->wait_stable_frame = 3;
	#endif

		image_window->grab_start_x = GC0308_FULL_GRAB_START_X;
		image_window->grab_start_y = GC0308_FULL_GRAB_START_Y;
		image_window->exposure_window_width = GC0308_FULL_GRAB_WIDTH;
		image_window->exposure_window_height = GC0308_FULL_GRAB_HEIGHT;
	}

#ifdef __GC0308_DEBUG_TRACE__
	kal_wap_trace(MOD_ENG, TRACE_INFO, "GC0308_Capture, preview_pclk=%d, capture_pclk=%d", \
		GC0308_sensor.preview_pclk, GC0308_sensor.capture_pclk);
	kal_wap_trace(MOD_ENG, TRACE_INFO, "GC0308_Capture, prev_line_len=%d, cap_line_len=%d, shutter=%d", \
		prev_line_len, cap_line_len, shutter);
#endif
}    /* GC0308_capture */

/*************************************************************************
* FUNCTION
*	GC0308_write_sensor_reg
*
* DESCRIPTION
*	This function write one register to sensor.
*
* PARAMETERS
*	1. kal_uint32 : Register address
*	2. kal_uint32 : Register value
*
* RETURNS
*	None
*
*************************************************************************/
void GC0308_write_sensor_reg(kal_uint32 addr, kal_uint32 para)
{
	GC0308_write_cmos_sensor(addr, para);
}    /* GC0308_write_sensor_reg */

/*************************************************************************
* FUNCTION
*	GC0308_read_sensor_reg
*
* DESCRIPTION
*	This function read one register to sensor.
*
* PARAMETERS
*	1. kal_uint32 : Register address to read.
*
* RETURNS
*	kal_uint32 : Register value
*
*************************************************************************/
kal_uint32 GC0308_read_sensor_reg(kal_uint32 addr)
{
	return (GC0308_read_cmos_sensor(addr));
}    /* GC0308_read_sensor_reg */


/*************************************************************************
* FUNCTION
*	GC0308_set_shutter
*
* DESCRIPTION
*	This function set the sensor shutter to do auto exposure, but for yuv sensor, it will not 
*		be used at all.
*
* PARAMETERS
*	1. kal_uint16 : Shutter for AE.
*
* RETURNS
*	None
*
*************************************************************************/
void GC0308_set_shutter(kal_uint16 shutter)
{
	// Not Support
} /* GC0308_set_shutter */

/*************************************************************************
* FUNCTION
*	GC0308_set_gain
*
* DESCRIPTION
*	This function set the sensor gain to do auto exposure, but for yuv sensor, it will not 
*		be used at all.
*
* PARAMETERS
*	1. kal_uint32 : gain for AE.
*
* RETURNS
*	1. kal_uint16 : the real gain set.
*
*************************************************************************/
kal_uint16 GC0308_set_gain(kal_uint16 gain)
{
	// Not Support
	return gain;
} /* GC0308_set_gain */

/*************************************************************************
* FUNCTION
*	GC0308_night_mode
*
* DESCRIPTION
*	This function enable sensor night mode or normal mode. In low light condition, to preview
*	it need more sensor gain to make the image more brightness, and lower frame rate to get
*	more exposure value and get better image quality.
*
* PARAMETERS
*	1. kal_bool : KAL_TRUE - night mode, KAL_FALSE - normal mode.
*
* RETURNS
*	None
*
*************************************************************************/
void GC0308_night_mode(kal_bool enable)
{
	kal_uint32 video_frame_rate = 0;
	kal_uint16 night = GC0308_read_cmos_sensor(0x20); //bit[3], 0: disable, 1:enable

	/* Get the video frame rate from frame rate lut table. */
	video_frame_rate = GC0308_Get_Video_Frame_Rate( \
				enable, GC0308_op_state.video_target_width, GC0308_op_state.video_target_height);

#ifdef __GC0308_DEBUG_TRACE__
	kal_wap_trace(MOD_ENG, TRACE_INFO, "GC0308_night, enable=%d, video_frame_rate=%d, Size %d x %d", \
		enable, video_frame_rate, GC0308_op_state.video_target_width, GC0308_op_state.video_target_height);
#endif

	if (enable) 		/* Night Mode */
	{
		if (GC0308_op_state.MJPEG_encode_mode == KAL_TRUE
			|| GC0308_op_state.MPEG4_encode_mode == KAL_TRUE
			|| GC0308_op_state.FULLVIDEO_encode_mode == KAL_TRUE)	/* Video */
		{
			if(GC039_CAM_BANDING_50HZ == KAL_TRUE)
			{
				GC0308_write_cmos_sensor(0x01  ,0xe4); 	
				GC0308_write_cmos_sensor(0x02  ,0x88); 
				GC0308_write_cmos_sensor(0x0f  ,0x23);

				GC0308_write_cmos_sensor(0xe2  ,0x00); 	//anti-flicker step [11:8]
				GC0308_write_cmos_sensor(0xe3  ,0x47);   //anti-flicker step [7:0]

				GC0308_write_cmos_sensor(0xe4  ,0x04);   //exp level 0  6.5fps
				GC0308_write_cmos_sensor(0xe5  ,0x70); 

			}
			else
			{

				GC0308_write_cmos_sensor(0x01  ,0xe9); 	
				GC0308_write_cmos_sensor(0x02  ,0xb4); 
				GC0308_write_cmos_sensor(0x0f  ,0x23);

				GC0308_write_cmos_sensor(0xe2  ,0x00); 	//anti-flicker step [11:8]
				GC0308_write_cmos_sensor(0xe3  ,0x3b);   //anti-flicker step [7:0]

				GC0308_write_cmos_sensor(0xe4  ,0x04);   //exp level 0  6.00fps
				GC0308_write_cmos_sensor(0xe5  ,0x9c);
			}

			GC0308_write_cmos_sensor(0xec  ,0x00);
			//GC0308_Set_Video_Frame_Rate(video_frame_rate);
		}
		else 										/* Camera */
		{
			GC0308_write_cmos_sensor(0xec  ,0x30);	//exp level 3
			GC0308_write_cmos_sensor(0x20  ,night&0x5f);   // close cc
			GC0308_write_cmos_sensor(0x3c  ,0x08);
			GC0308_write_cmos_sensor(0x3d  ,0x08);
			GC0308_write_cmos_sensor(0x3e  ,0x08);
			GC0308_write_cmos_sensor(0x3f  ,0x08);/* Max gain 8X for video night mode *//* Max gain 8X for video night mode */
		}      
	}
	else  				/* Normal Mode */
	{
		if (GC0308_op_state.MJPEG_encode_mode == KAL_TRUE
			|| GC0308_op_state.MPEG4_encode_mode == KAL_TRUE
			|| GC0308_op_state.FULLVIDEO_encode_mode == KAL_TRUE)	/* Video */
		{
			if(GC039_CAM_BANDING_50HZ == KAL_TRUE)
			{
				GC0308_write_cmos_sensor(0x01  ,0x26); 	
				GC0308_write_cmos_sensor(0x02  ,0x98); 
				GC0308_write_cmos_sensor(0x0f  ,0x03);

				GC0308_write_cmos_sensor(0xe2  ,0x00); 	//anti-flicker step [11:8]
				GC0308_write_cmos_sensor(0xe3  ,0x50);   //anti-flicker step [7:0]

				GC0308_write_cmos_sensor(0xe4  ,0x02);   //exp level 0  12.5fps
				GC0308_write_cmos_sensor(0xe5  ,0x80); 

			}
			else
			{
				GC0308_write_cmos_sensor(0x01  ,0x97); 	
				GC0308_write_cmos_sensor(0x02  ,0x84); 
				GC0308_write_cmos_sensor(0x0f  ,0x03);

				GC0308_write_cmos_sensor(0xe2  ,0x00); 	//anti-flicker step [11:8]
				GC0308_write_cmos_sensor(0xe3  ,0x3e);   //anti-flicker step [7:0]

				GC0308_write_cmos_sensor(0xe4  ,0x02);   //exp level 0  12.00fps
				GC0308_write_cmos_sensor(0xe5  ,0x6c);
			}

			GC0308_write_cmos_sensor(0xec  ,0x00);
			//GC0308_Set_Video_Frame_Rate(video_frame_rate);
		}
		else										/* Camera */
		{
			GC0308_write_cmos_sensor(0xec ,0x20);	 //exp level 2
			GC0308_write_cmos_sensor(0x20 ,night|0x20);
			GC0308_write_cmos_sensor(0x3c ,0x02); 
			GC0308_write_cmos_sensor(0x3d ,0x02); 
			GC0308_write_cmos_sensor(0x3e ,0x02);
			GC0308_write_cmos_sensor(0x3f ,0x02); 	/* Max gain 8X for video night mode */
			/*Disable fix frame rate*/
		}
	}

	GC0308_op_state.night_mode = enable;
	
}    /* GC0308_night_mode */


/*************************************************************************
* FUNCTION
*	GC0308_set_flash_light
*
* DESCRIPTION
*	This function power on/off the flashlight.
*
* PARAMETERS
*	1. kal_bool : KAL_TRUE - flashlight on, KAL_FALSE - flashlight off.
*
* RETURNS
*	None
*
*************************************************************************/
void GC0308_set_flash_light(kal_bool enable)
{
	flashlight_power_on(enable);
} /* GC0308_set_flash_light */

/*************************************************************************
* FUNCTION
*	GC0308_set_param_zoom
*
* DESCRIPTION
*	This function set the zoom in/out factor.
*
* PARAMETERS
*	1. kal_uint32 : Zoom in/out factor..
*
* RETURNS
*	kal_uint32 : KAL_TURE - set para ok, KAL_FALSE - set para fail.
*
*************************************************************************/
kal_uint32 GC0308_set_param_zoom(kal_uint32 para)
{
	// Not Support, use TG + Resizer to acheive zoom in/out.
	return KAL_FALSE;
} /* GC0308_set_param_zoom */

/*************************************************************************
* FUNCTION
*	GC0308_set_param_contrast
*
* DESCRIPTION
*	This function set the contrast function.
*
* PARAMETERS
*	1. kal_uint32 : High, Medium, Low can support.
*
* RETURNS
*	kal_uint32 : KAL_TURE - set para ok, KAL_FALSE - set para fail.
*
*************************************************************************/
kal_uint32 GC0308_set_param_contrast(kal_uint32 para)
{
	// Not Support
	return KAL_FALSE;
} /* GC0308_set_param_contrast */

/*************************************************************************
* FUNCTION
*	GC0308_set_param_brightness
*
* DESCRIPTION
*	This function set the brightness level...
*
* PARAMETERS
*	1. kal_uint32 : brightness level.
*
* RETURNS
*	kal_uint32 : KAL_TURE - set para ok, KAL_FALSE - set para fail.
*
*************************************************************************/
kal_uint32 GC0308_set_param_brightness(kal_uint32 para)
{
	// Not Support
	return KAL_FALSE;
} /* GC0308_set_param_brightness */

/*************************************************************************
* FUNCTION
*	GC0308_set_param_hue
*
* DESCRIPTION
*	This function set hue
*
* PARAMETERS
*	1. kal_uint32 : hue level.
*
* RETURNS
*	kal_uint32 : KAL_TURE - set para ok, KAL_FALSE - set para fail.
*
*************************************************************************/
kal_uint32 GC0308_set_param_hue(kal_uint32 para)
{
	// Not Support
	return KAL_FALSE;
} /* GC0308_set_param_hue */

/*************************************************************************
* FUNCTION
*	GC0308_set_param_gamma
*
* DESCRIPTION
*	This function set gamma curve.
*
* PARAMETERS
*	1. kal_uint32 : gamma curve.
*
* RETURNS
*	kal_uint32 : KAL_TURE - set para ok, KAL_FALSE - set para fail.
*
*************************************************************************/
kal_uint32 GC0308_set_param_gamma(kal_uint32 para)
{
	// Not Support
	return KAL_FALSE;
} /* GC0308_set_param_gamma */

/*************************************************************************
* FUNCTION
*	GC0308_set_param_wb
*
* DESCRIPTION
*	This function set auto and white balance.
*
* PARAMETERS
*	1. kal_uint32 : wb - Auto, Daylight, Cloud, Incandescene, Tungsten.
*
* RETURNS
*	kal_uint32 : KAL_TURE - set para ok, KAL_FALSE - set para fail.
*
*************************************************************************/
kal_uint32 GC0308_set_param_wb(kal_uint32 para)
{
	kal_uint32 ret = KAL_TRUE;
	kal_uint16 temp_reg = 0;
	
	temp_reg=GC0308_read_cmos_sensor(0x22);

	switch (para)
	{
		case CAM_WB_AUTO:
			GC0308_write_cmos_sensor(0x5a,0x56); //for AWB can adjust back
			GC0308_write_cmos_sensor(0x5b,0x40);
			GC0308_write_cmos_sensor(0x5c,0x4a);			
			GC0308_write_cmos_sensor(0x22,temp_reg|0x02);	 // Enable AWB
			break;	
	  
		case CAM_WB_CLOUD:
			GC0308_write_cmos_sensor(0x22,temp_reg&~0x02);   // Disable AWB 
			GC0308_write_cmos_sensor(0x5a,0x8c); //WB_manual_gain 
			GC0308_write_cmos_sensor(0x5b,0x50);
			GC0308_write_cmos_sensor(0x5c,0x40);
			break;		

		case CAM_WB_DAYLIGHT:   // tai yang guang
			GC0308_write_cmos_sensor(0x22,temp_reg&~0x02);   
			GC0308_write_cmos_sensor(0x5a,0x74); 
			GC0308_write_cmos_sensor(0x5b,0x52);
			GC0308_write_cmos_sensor(0x5c,0x40);			
			break;		

		case CAM_WB_INCANDESCENCE:   // bai re guang
			GC0308_write_cmos_sensor(0x22,temp_reg&~0x02); 
			GC0308_write_cmos_sensor(0x5a,0x48);
			GC0308_write_cmos_sensor(0x5b,0x40);
			GC0308_write_cmos_sensor(0x5c,0x5c);
			break;		

		case CAM_WB_FLUORESCENT:   //ri guang deng
			GC0308_write_cmos_sensor(0x22,temp_reg&~0x02);   
			GC0308_write_cmos_sensor(0x5a,0x40);
			GC0308_write_cmos_sensor(0x5b,0x42);
			GC0308_write_cmos_sensor(0x5c,0x50);
			break;		

		case CAM_WB_TUNGSTEN:   // wu si deng
			GC0308_write_cmos_sensor(0x22,temp_reg&~0x02); 
			GC0308_write_cmos_sensor(0x5a,0x40);
			GC0308_write_cmos_sensor(0x5b,0x54);
			GC0308_write_cmos_sensor(0x5c,0x70);
			break;

		case CAM_WB_MANUAL: 	
			// TODO
			break;		
		default:
			return KAL_FALSE;			
	}
	
	return ret;
} /* GC0308_set_param_wb */

/*************************************************************************
* FUNCTION
*	GC0308_set_param_exposure
*
* DESCRIPTION
*	This function set exposure target value.
*
* PARAMETERS
*	1. kal_uint32 : ev (-2.0, -1.5, -1.0, -0.5, 0, 0.5, 1.0, 1.5, 2.0)
*
* RETURNS
*	kal_uint32 : KAL_TURE - set para ok, KAL_FALSE - set para fail.
*
*************************************************************************/
kal_uint32 GC0308_set_param_exposure(kal_uint32 para)
{
	kal_uint16  temp_reg;
	
	switch (para)
	{
		case CAM_EV_NEG_4_3:    
      			GC0308_write_cmos_sensor(0xb5, 0xc0);
			GC0308_write_cmos_sensor(0xd3, 0x30);
			break;		
		case CAM_EV_NEG_3_3:
      			GC0308_write_cmos_sensor(0xb5, 0xd0);
			GC0308_write_cmos_sensor(0xd3, 0x38);
			break;		
		case CAM_EV_NEG_2_3:
      			GC0308_write_cmos_sensor(0xb5, 0xe0);
			GC0308_write_cmos_sensor(0xd3, 0x40);
			break;				
		case CAM_EV_NEG_1_3:
     			GC0308_write_cmos_sensor(0xb5, 0xf0);
			GC0308_write_cmos_sensor(0xd3, 0x48);
			break;				
		case CAM_EV_ZERO:
      			GC0308_write_cmos_sensor(0xb5, 0x00);
			GC0308_write_cmos_sensor(0xd3, 0x50);
			break;				
		case CAM_EV_POS_1_3:
      			GC0308_write_cmos_sensor(0xb5, 0x10);
			GC0308_write_cmos_sensor(0xd3, 0x60);
			break;				
		case CAM_EV_POS_2_3:
      			GC0308_write_cmos_sensor(0xb5, 0x20);
			GC0308_write_cmos_sensor(0xd3, 0x70);
			break;				
		case CAM_EV_POS_3_3:
      			GC0308_write_cmos_sensor(0xb5, 0x30);
			GC0308_write_cmos_sensor(0xd3, 0x80);
			break;				
		case CAM_EV_POS_4_3:	
      			GC0308_write_cmos_sensor(0xb5, 0x40);
			GC0308_write_cmos_sensor(0xd3, 0x90);
			break;
		default:
			return KAL_FALSE;     
	}
	
	return KAL_TRUE;
} /* GC0308_set_param_exposure */

/*************************************************************************
* FUNCTION
*	GC0308_set_param_effect
*
* DESCRIPTION
*	This function set effect.
*
* PARAMETERS
*	1. kal_uint32 : effect, implement all of the effect which sensor supported.
*
* RETURNS
*	kal_uint32 : KAL_TURE - set para ok, KAL_FALSE - set para fail.
*
*************************************************************************/
kal_uint32 GC0308_set_param_effect(kal_uint32 para)
{
	kal_uint32 ret = KAL_TRUE;
	
	switch (para)
	{	
		case CAM_EFFECT_ENC_NORMAL:
			GC0308_write_cmos_sensor(0x23,0x00);
			GC0308_write_cmos_sensor(0x2d,0x0a); // 0x08
			GC0308_write_cmos_sensor(0x20,0xff);
			GC0308_write_cmos_sensor(0xd2,0x90);
			GC0308_write_cmos_sensor(0x73,0x00);
			GC0308_write_cmos_sensor(0x77,0x54);
			
			GC0308_write_cmos_sensor(0xb3,0x40);
			GC0308_write_cmos_sensor(0xb4,0x80);
			GC0308_write_cmos_sensor(0xba,0x00);
			GC0308_write_cmos_sensor(0xbb,0x00);
	
			break;		
		case CAM_EFFECT_ENC_GRAYSCALE:
			GC0308_write_cmos_sensor(0x23,0x02);	
			GC0308_write_cmos_sensor(0x2d,0x0a);
			GC0308_write_cmos_sensor(0x20,0xff);
			GC0308_write_cmos_sensor(0xd2,0x90);
			GC0308_write_cmos_sensor(0x73,0x00);

			GC0308_write_cmos_sensor(0xb3,0x40);
			GC0308_write_cmos_sensor(0xb4,0x80);
			GC0308_write_cmos_sensor(0xba,0x00);
			GC0308_write_cmos_sensor(0xbb,0x00);		
			break;		
			
		case CAM_EFFECT_ENC_SEPIA:
			GC0308_write_cmos_sensor(0x23,0x02);		
			GC0308_write_cmos_sensor(0x2d,0x0a);
			GC0308_write_cmos_sensor(0x20,0xff);
			GC0308_write_cmos_sensor(0xd2,0x90);
			GC0308_write_cmos_sensor(0x73,0x00);

			GC0308_write_cmos_sensor(0xb3,0x40);
			GC0308_write_cmos_sensor(0xb4,0x80);
			GC0308_write_cmos_sensor(0xba,0xd0);
			GC0308_write_cmos_sensor(0xbb,0x28);	
			break;		
			
		case CAM_EFFECT_ENC_COLORINV:	
			GC0308_write_cmos_sensor(0x23,0x01);		
			GC0308_write_cmos_sensor(0x2d,0x0a);
			GC0308_write_cmos_sensor(0x20,0xff);
			GC0308_write_cmos_sensor(0xd2,0x90);
			GC0308_write_cmos_sensor(0x73,0x00);

			GC0308_write_cmos_sensor(0xb3,0x40);
			GC0308_write_cmos_sensor(0xb4,0x80);
			GC0308_write_cmos_sensor(0xba,0x00);
			GC0308_write_cmos_sensor(0xbb,0x00);	
			break;	
			
		case CAM_EFFECT_ENC_SEPIAGREEN:
			GC0308_write_cmos_sensor(0x23,0x02);	
			GC0308_write_cmos_sensor(0x2d,0x0a);
			GC0308_write_cmos_sensor(0x20,0xff);
			GC0308_write_cmos_sensor(0xd2,0x90);
			GC0308_write_cmos_sensor(0x77,0x88);

			GC0308_write_cmos_sensor(0xb3,0x40);
			GC0308_write_cmos_sensor(0xb4,0x80);
			GC0308_write_cmos_sensor(0xba,0xc0);
			GC0308_write_cmos_sensor(0xbb,0xc0);	
			break;				
			
		case CAM_EFFECT_ENC_SEPIABLUE:
			GC0308_write_cmos_sensor(0x23,0x02);	
			GC0308_write_cmos_sensor(0x2d,0x0a);
			GC0308_write_cmos_sensor(0x20,0xff);
			GC0308_write_cmos_sensor(0xd2,0x90);
			GC0308_write_cmos_sensor(0x73,0x00);

			GC0308_write_cmos_sensor(0xb3,0x40);
			GC0308_write_cmos_sensor(0xb4,0x80);
			GC0308_write_cmos_sensor(0xba,0x50);
			GC0308_write_cmos_sensor(0xbb,0xe0);
			break;								

		case CAM_EFFECT_ENC_COPPERCARVING:
			GC0308_write_cmos_sensor(0x23,0x02);	
			GC0308_write_cmos_sensor(0x2d,0x0a);
			GC0308_write_cmos_sensor(0x20,0xbf);
			GC0308_write_cmos_sensor(0xd2,0x10);
			GC0308_write_cmos_sensor(0x73,0x01);

			GC0308_write_cmos_sensor(0x51,0x40);
			GC0308_write_cmos_sensor(0x52,0x40);

			GC0308_write_cmos_sensor(0xb3,0x40);
			GC0308_write_cmos_sensor(0xb4,0x80);
			GC0308_write_cmos_sensor(0xba,0xc0);
			GC0308_write_cmos_sensor(0xbb,0x20);	
			break;	
			
		case CAM_EFFECT_ENC_BLUECARVING:
			GC0308_write_cmos_sensor(0x23,0x02);		
			GC0308_write_cmos_sensor(0x2d,0x0a);
			GC0308_write_cmos_sensor(0x20,0xbf);
			GC0308_write_cmos_sensor(0xd2,0x10);
			GC0308_write_cmos_sensor(0x73,0x01);

			GC0308_write_cmos_sensor(0x51,0x40);
			GC0308_write_cmos_sensor(0x52,0x40);

			GC0308_write_cmos_sensor(0xb3,0x40);
			GC0308_write_cmos_sensor(0xb4,0x80);
			GC0308_write_cmos_sensor(0xba,0x60);
			GC0308_write_cmos_sensor(0xbb,0x00);	
			break;						
			
		case CAM_EFFECT_ENC_CONTRAST://not yet

			break;						
		case CAM_EFFECT_ENC_EMBOSSMENT:
			GC0308_write_cmos_sensor(0x23,0x02);		
			GC0308_write_cmos_sensor(0x2d,0x0a);
			GC0308_write_cmos_sensor(0x20,0xbf);
			GC0308_write_cmos_sensor(0xd2,0x10);
			GC0308_write_cmos_sensor(0x73,0x01);

			GC0308_write_cmos_sensor(0x51,0x40);
			GC0308_write_cmos_sensor(0x52,0x40);

			GC0308_write_cmos_sensor(0xb3,0x40);
			GC0308_write_cmos_sensor(0xb4,0x80);
			GC0308_write_cmos_sensor(0xba,0x00);
			GC0308_write_cmos_sensor(0xbb,0x00);	
			break;			
			
		case CAM_EFFECT_ENC_SKETCH:
			GC0308_write_cmos_sensor(0x23,0x02);		
			GC0308_write_cmos_sensor(0x2d,0x0a);
			GC0308_write_cmos_sensor(0x20,0xbf);
			GC0308_write_cmos_sensor(0xd2,0x10);
			GC0308_write_cmos_sensor(0x73,0x01);

			GC0308_write_cmos_sensor(0x51,0x40);
			GC0308_write_cmos_sensor(0x52,0x40);

			GC0308_write_cmos_sensor(0xb3,0x98);
			GC0308_write_cmos_sensor(0xb4,0x06);
			GC0308_write_cmos_sensor(0xba,0x00);
			GC0308_write_cmos_sensor(0xbb,0x00);
			break;	
			
		case CAM_EFFECT_ENC_GRAYINV:
			GC0308_write_cmos_sensor(0x23,0x03);	
			GC0308_write_cmos_sensor(0x2d,0x0a);
			GC0308_write_cmos_sensor(0x20,0xff);
			GC0308_write_cmos_sensor(0xd2,0x90);
			GC0308_write_cmos_sensor(0x73,0x00);

			GC0308_write_cmos_sensor(0xb3,0x40);
			GC0308_write_cmos_sensor(0xb4,0x80);
			GC0308_write_cmos_sensor(0xba,0x00);
			GC0308_write_cmos_sensor(0xbb,0x00);		
			break;		
			
		case CAM_EFFECT_ENC_BLACKBOARD:
			GC0308_write_cmos_sensor(0x23,0x02);	
			GC0308_write_cmos_sensor(0x2d,0x0a);
			GC0308_write_cmos_sensor(0x20,0xbf);
			GC0308_write_cmos_sensor(0xd2,0x10);
			GC0308_write_cmos_sensor(0x73,0x01);

			GC0308_write_cmos_sensor(0x51,0x40);
			GC0308_write_cmos_sensor(0x52,0x40);

			GC0308_write_cmos_sensor(0xb3,0x98);
			GC0308_write_cmos_sensor(0xb4,0xb0);
			GC0308_write_cmos_sensor(0xba,0x00);
			GC0308_write_cmos_sensor(0xbb,0x00);				
			break;	
			
		case CAM_EFFECT_ENC_JEAN:
		case CAM_EFFECT_ENC_OIL:			
		case CAM_EFFECT_ENC_WHITEBOARD:
			GC0308_write_cmos_sensor(0x23,0x02);		
			GC0308_write_cmos_sensor(0x2d,0x0a);
			GC0308_write_cmos_sensor(0x20,0xbf);
			GC0308_write_cmos_sensor(0xd2,0x10);
			GC0308_write_cmos_sensor(0x73,0x01);

			GC0308_write_cmos_sensor(0x51,0x40);
			GC0308_write_cmos_sensor(0x52,0x40);
			GC0308_write_cmos_sensor(0xb3,0x60);
			GC0308_write_cmos_sensor(0xb4,0x40);
			GC0308_write_cmos_sensor(0xba,0x00);
			GC0308_write_cmos_sensor(0xbb,0x00);			
			break;			
			
		default:
			ret = KAL_FALSE;
	}
	
	return ret;
	
} /* GC0308_set_param_effect */

/*************************************************************************
* FUNCTION
*	GC0308_set_param_banding
*
* DESCRIPTION
*	This function set banding value, select corrent flicker by elect, or use auto anti-flicker.
*
* PARAMETERS
*	1. kal_uint32 : banding - 50/60Hz
*
* RETURNS
*	kal_uint32 : KAL_TURE - set para ok, KAL_FALSE - set para fail.
*
*************************************************************************/
kal_uint32 GC0308_set_param_banding(kal_uint32 para)
{
	kal_uint16 temp_reg = 0;
	/* Some sensor call base shutter as banding filter. */
	kal_uint32 base_shutter = 0, max_shutter_step = 0, exposure_limitation = 0;
	kal_uint32 line_length = 0, sensor_pixel_clock = 0;
	
	switch (para)
	{
	case CAM_BANDING_50HZ:
		GC0308_write_cmos_sensor(0x01  ,0x26); 	
		GC0308_write_cmos_sensor(0x02  ,0x98); 
		GC0308_write_cmos_sensor(0x0f  ,0x03);

		GC0308_write_cmos_sensor(0xe2  ,0x00); 	//anti-flicker step [11:8]
		GC0308_write_cmos_sensor(0xe3  ,0x50);   //anti-flicker step [7:0]
			
		GC0308_write_cmos_sensor(0xe4  ,0x02);   //exp level 0  12.5fps
		GC0308_write_cmos_sensor(0xe5  ,0x80); 
		GC0308_write_cmos_sensor(0xe6  ,0x03);   //exp level 1  10fps
		GC0308_write_cmos_sensor(0xe7  ,0x20); 
		GC0308_write_cmos_sensor(0xe8  ,0x04);   //exp level 2  7.69fps
		GC0308_write_cmos_sensor(0xe9  ,0x10); 
		GC0308_write_cmos_sensor(0xea  ,0x06);   //exp level 3  5.00fps
		GC0308_write_cmos_sensor(0xeb  ,0x40); 

		GC039_CAM_BANDING_50HZ = KAL_TRUE;
		break;
		
	case CAM_BANDING_60HZ:
		GC0308_write_cmos_sensor(0x01  ,0x97); 	
		GC0308_write_cmos_sensor(0x02  ,0x84); 
		GC0308_write_cmos_sensor(0x0f  ,0x03);

		GC0308_write_cmos_sensor(0xe2  ,0x00); 	//anti-flicker step [11:8]
		GC0308_write_cmos_sensor(0xe3  ,0x3e);   //anti-flicker step [7:0]
			
		GC0308_write_cmos_sensor(0xe4  ,0x02);   //exp level 0  12.00fps
		GC0308_write_cmos_sensor(0xe5  ,0x6c); 
		GC0308_write_cmos_sensor(0xe6  ,0x02);   //exp level 1  10.00fps
		GC0308_write_cmos_sensor(0xe7  ,0xe8); 
		GC0308_write_cmos_sensor(0xe8  ,0x03);   //exp level 2  7.50fps
		GC0308_write_cmos_sensor(0xe9  ,0xe0); 
		GC0308_write_cmos_sensor(0xea  ,0x05);   //exp level 3  5.00fps
		GC0308_write_cmos_sensor(0xeb  ,0xd0); 

		GC039_CAM_BANDING_50HZ = KAL_FALSE;
		break;
		
	default:
		/* Enable Auto Anti-Flicker if the sensor support it. */
		return KAL_FALSE;
	}
	
	return KAL_TRUE;
} /* GC0308_set_param_banding */

/*************************************************************************
* FUNCTION
*	GC0308_set_param_saturation
*
* DESCRIPTION
*	This function set the saturation
*
* PARAMETERS
*	1. kal_uint32 : saturation level, Hight, Medium, Low.
*
* RETURNS
*	kal_uint32 : KAL_TURE - set para ok, KAL_FALSE - set para fail.
*
*************************************************************************/
kal_uint32 GC0308_set_param_saturation(kal_uint32 para)
{
	// Not Support
	return KAL_FALSE;
} /* GC0308_set_param_saturation */

/*************************************************************************
* FUNCTION
*	GC0308_set_param_nightmode
*
* DESCRIPTION
*	This function set night mode function.
*
* PARAMETERS
*	1. kal_uint32 : night mode or normal mode.
*
* RETURNS
*	kal_uint32 : KAL_TURE - set para ok, KAL_FALSE - set para fail.
*
*************************************************************************/
kal_uint32 GC0308_set_param_nightmode(kal_uint32 para)
{
	GC0308_night_mode((kal_bool)para);
	
	return KAL_TRUE;
} /* GC0308_set_param_nightmode */

/*************************************************************************
* FUNCTION
*	GC0308_set_param_ev
*
* DESCRIPTION
*	This function set exposure target value.
*
* PARAMETERS
*	1. kal_uint32 : ev (-2.0, -1.5, -1.0, -0.5, 0, 0.5, 1.0, 1.5, 2.0)
*
* RETURNS
*	kal_uint32 : KAL_TURE - set para ok, KAL_FALSE - set para fail.
*
*************************************************************************/
kal_uint32 GC0308_set_param_ev(kal_uint32 para)
{
	return GC0308_set_param_exposure(para);
} /* GC0308_set_param_ev */

/*************************************************************************
* FUNCTION
*	GC0308_yuv_sensor_setting
*
* DESCRIPTION
*	This function dispatch each setting function, like ev, wb, contrast, effect, and so on.
*
* PARAMETERS
*	1. kal_uint32 : function enum
*	2. kal_uint32 : function parameter
*
* RETURNS
*	kal_uint32 : KAL_TURE - set para ok, KAL_FALSE - set para fail.
*
*************************************************************************/
kal_uint32 GC0308_yuv_sensor_setting(kal_uint32 cmd, kal_uint32 para)
{
	kal_uint32 ret = KAL_TRUE;

	if (GC0308_op_state.sensor_cap_state == KAL_TRUE)	/* Don't need it when capture mode. */
	{
		return KAL_TRUE;
	}
	
#ifdef __GC0308_DEBUG_TRACE__
	kal_wap_trace(MOD_ENG, TRACE_INFO, "GC0308_yuv_sensor_setting, cmd=%d, para=%d", cmd, para);
#endif

	switch (cmd)
	{
	case CAM_PARAM_ZOOM_FACTOR: 		// 1
		ret = GC0308_set_param_zoom(para);
		break;
	case CAM_PARAM_CONTRAST: 			// 2
		ret = GC0308_set_param_contrast(para);
		break;
	case CAM_PARAM_BRIGHTNESS: 			// 3
		ret = GC0308_set_param_brightness(para);
		break;
	case CAM_PARAM_HUE: 				// 4
		ret = GC0308_set_param_hue(para);
		break;
	case CAM_PARAM_GAMMA: 				// 5
		ret = GC0308_set_param_gamma(para);
		break;
	case CAM_PARAM_WB: 					// 6
		ret = GC0308_set_param_wb(para);
		break;
	case CAM_PARAM_EXPOSURE: 			// 7
		ret = GC0308_set_param_exposure(para);
		break;
	case CAM_PARAM_EFFECT: 				// 8
		ret = GC0308_set_param_effect(para);
		break;
	case CAM_PARAM_BANDING: 			// 9
		ret = GC0308_set_param_banding(para);
		break;
	case CAM_PARAM_SATURATION: 			// 10
		ret = GC0308_set_param_saturation(para);
		break;
	case CAM_PARAM_NIGHT_MODE: 			// 11
		ret = GC0308_set_param_nightmode(para);
		break;
	case CAM_PARAM_EV_VALUE: 			// 12
		ret = GC0308_set_param_ev(para);
		break;
#ifdef __PANORAMA_VIEW_SUPPORT__
	case CAM_PARAM_3A_ENABLE:
		if (para == KAL_FALSE)  // Disable
		{
			GC0308_op_state.is_panorama_capturing = KAL_TRUE;
		}
		else
		{
			GC0308_op_state.is_panorama_capturing = KAL_FALSE;
		}
		GC0308_ae_enable(para);
		GC0308_awb_enable(para);
		ret = KAL_TRUE;
		break;  
#endif
	default:
		ret = KAL_FALSE;
	}
		return ret;
} /* GC0308_yuv_sensor_setting */

#if (defined(DRV_ISP_6238_SERIES)||defined(DRV_ISP_6276_SERIES))
void GC0308_get_ae_info(sensor_ae_info *pInfo)
{
	//YUV do nothing, this func isn't used!
}
#endif

#if (defined(SENSOR_COMMON_INTERFACE_SUPPORT))
kal_uint32 GC0308_video_frame_rate_info(PSENSOR_FLEXIBLE_VIDEO_FRAMERATE_STRUCT video_frame_rate)
{
	video_frame_rate->current_video_frame_rate = GC0308_sensor.video_frame_rate;
	return ERROR_NONE;
}
void GC0308_get_zoom_info(PSENSOR_ZOOM_QUERY_STRUCT P_In, PSENSOR_ZOOM_INFO_STRUCT  P_Out)
{ 
	P_Out->capture_resolution= P_In->current_capture_size;
	P_Out->capture_sensor_type= SENSOR_DATA_FORMAT_YUV422_UYVY;
	P_Out->zoom_support_type = ZOOM_SUPPORT_NORMAL;
	P_Out->zoom_steps = 40;
	P_Out->max_zoom_factor = 800;
}
MM_ERROR_CODE_ENUM GC0308_feature_control(IMAGE_SENSOR_FEATURE_ENUM feature_id, void* p_feature_para_input,void* p_feature_para_output, kal_uint16 feature_para_output_length)
{
	MM_ERROR_CODE_ENUM value = ERROR_NONE;
	PSENSOR_FEATURE_CONTRL_STRUCT p_sensor_feature_in= (PSENSOR_FEATURE_CONTRL_STRUCT) p_feature_para_input;
	PSENSOR_FEATURE_CONTRL_STRUCT p_sensor_feature_out= (PSENSOR_FEATURE_CONTRL_STRUCT) p_feature_para_output;
	
	switch (feature_id)
	{
		
	case SENSOR_FEATURE_VIDEO_FRAME_RATE:
		GC0308_video_frame_rate_info(p_sensor_feature_out->p_sensor_flexible_video_framerate);
		break;
	case SENSOR_FEATURE_GET_ZOOM_INFO:
		GC0308_get_zoom_info(p_sensor_feature_in->p_sensor_zoom_query, p_sensor_feature_out->p_sensor_zoom_info);
		break;
	default:
		value = ERROR_SENSOR_FEATURE_NOT_SUPPORT;
		break;
	}
	return    value;
}

#endif

image_sensor_func_struct image_sensor_func_GC0308=
{
	GC0308_init,
	GC0308_GetID,
	GC0308_GetSize,
	GC0308_GetPeriod,
	GC0308_preview,
	GC0308_capture,
	GC0308_write_sensor_reg,
	GC0308_read_sensor_reg,
	GC0308_set_shutter,
	GC0308_night_mode,
	GC0308_power_off,
	GC0308_set_gain,
	GC0308_set_flash_light,
#if (defined(DRV_ISP_6238_SERIES)||defined(DRV_ISP_6276_SERIES))
	NULL,
	NULL,
#if (defined(MSHUTTER_SUPPORT))
	NULL,
	NULL,
#endif
#endif
#if (defined(SENSOR_COMMON_INTERFACE_SUPPORT))
	GC0308_feature_control,
#endif
	GC0308_yuv_sensor_setting,
};  /* image_sensor_func_GC0308 */

void GC0308_image_sensor_func_config(void)
{
	image_sensor_func = &image_sensor_func_GC0308;
}    /* GC0308_image_sensor_func_config */


// write camera_para to sensor register
void GC0308_camera_para_to_sensor(void)
{
} /* GC0308_camera_para_to_sensor */

// update camera_para from sensor register
void GC0308_sensor_to_camera_para(void)
{
} /* GC0308_sensor_to_camera_para */

void  GC0308_get_sensor_group_count(kal_int32* sensor_count_ptr)
{
} /* GC0308_get_sensor_group_count */

void GC0308_get_sensor_group_info(kal_uint16 group_idx, kal_int8* group_name_ptr, kal_int32* item_count_ptr)
{
} /* GC0308_get_sensor_group_info */

void GC0308_get_sensor_item_info(kal_uint16 group_idx,kal_uint16 item_idx, ENG_sensor_info* info_ptr)
{
} /* GC0308_get_sensor_item_info */

kal_bool GC0308_set_sensor_item_info(kal_uint16 group_idx, kal_uint16 item_idx, kal_int32 item_value)
{
	return KAL_FALSE;
} /* GC0308_set_sensor_item_info */


void GC0308_get_sensor_prefix_name(kal_char* buf){
	strcpy(buf, "GC0308");
}

#if (defined(DRV_ISP_6238_SERIES)||defined(DRV_ISP_6276_SERIES))
void  GC0308_dispatch_camera_info(void) {
#if defined(DRV_ISP_6238_SERIES)
	kal_mem_cpy(&dsc_support_info, &GC0308_dsc_support_info, sizeof(camcorder_info_struct));    
#endif   
}
#endif

kal_uint32 GC0308_get_valid_camera_type(void)
{
#if(defined(GC0308_YUV_MAIN))
	return  IMAGE_SENSOR_MAIN;            
#elif(defined(GC0308_YUV_SUB))
	return  IMAGE_SENSOR_SUB;            
#elif(defined(GC0308_YUV_BAK1))
	return  IMAGE_SENSOR_BAK1;            
#elif(defined(GC0308_YUV_SUB_BAK1))
	return  IMAGE_SENSOR_SUB_BAK1;
#endif                                    
}

#ifdef __GC0308_DEBUG_TRACE__

/*************************************************************************
* FUNCTION
*	GC0308_at_test_func
*
* DESCRIPTION
*	This function use the AT command to debug sensor. It's very useful.
*
* PARAMETERS
*	1. kal_uint32 : function value
*
* RETURNS
*	None
*
*************************************************************************/
void GC0308_at_test_func(kal_uint32 *d)
{
    kal_int32 i;
	
    switch (d[1])
    {
	case 0:
		break;
	case 1:
		break;
	case 2:
		kal_wap_trace(MOD_ENG, TRACE_INFO, "Read BB Reg %x = %x", d[2], DRV_Reg32((d[2])));
		break;
	case 3:
		DRV_Reg32((d[2])) = d[3];
		kal_wap_trace(MOD_ENG, TRACE_INFO, "Write BB Reg %x = %x", d[2], DRV_Reg32((d[2])));
		break;
	case 4:
		kal_wap_trace(MOD_ENG, TRACE_INFO, "Read Sensor %x = %x", d[2], GC0308_read_cmos_sensor(d[2]));
		break;
	case 5:
		GC0308_write_cmos_sensor(d[2], d[3]);
		kal_wap_trace(MOD_ENG, TRACE_INFO, "Write Sensor %x = %x", d[2], GC0308_read_cmos_sensor(d[2]));
		break;
	case 6:
		break;
	case 7:
		break;
	case 8:
		break;
	case 9:
		{
			kal_uint32 temp = GC0308_t[d[2]];
			GC0308_t[d[2]] = d[3];
			kal_wap_trace(MOD_ENG, TRACE_INFO, "Set:t[%d]=%d --> t[%d] = %d",d[2], temp, d[2], GC0308_t[d[2]]);
		}
		break;
	case 10:
		break;
	case 11:
		break;
	case 12:
		break;
	case 13:
		for (i = d[2]; i < d[3]; i++)
		{
			kal_wap_trace(MOD_ENG, TRACE_INFO, "Reg[%x] = %x", i, GC0308_read_cmos_sensor(i));
		}
		break;
	case 15:
		break;
    }
}
#endif	/* #ifdef __GC0308_DEBUG_TRACE__ */

