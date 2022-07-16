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
 *   image_sensor_GC0308.h
 *
 * Project:
 * --------
 *   MAUI
 *
 * Description:
 * ------------
 *   Image sensor driver declare and macro define in the header file.
 *
 * Author:
 * -------
 *   QH Geng (mtk70548)
 *
 *=============================================================
 *             HISTORY
 * Below this line, this part is controlled by PVCS VM. DO NOT MODIFY!!
 *------------------------------------------------------------------------------
 * $Log$
 * 2011/03/16 Firsty Released By Mormo(using new driver structure)
 *
 *
 *------------------------------------------------------------------------------
 * Upper this line, this part is controlled by PVCS VM. DO NOT MODIFY!!
 *=============================================================
 ******************************************************************************/

#ifndef _IMAGE_SENSOR_GC0308_H
	#define _IMAGE_SENSOR_GC0308_H

	#include "isp_if.h"
	#include "drv_features.h"
	#include "sensor_struct.h"

	/* Debug use only. */
	//#define __GC0308_DEBUG_TRACE__

	/* This used for debug phase use only, to speed up the initial setting modify, 
		NOTICE: It need to be marked when MP release version, or else it will effect the enter
			camera time and waste some ram. */
	//#define GC0308_LOAD_FROM_T_FLASH

	/* HW Produce I2C Signal to Control Sensor Register. */
	//#define GC0308_HW_SCCB

	/* Sensor Read/Write ID */
	#define GC0308_WRITE_ID_0			(0x42)
	#define GC0308_WRITE_ID_1			(0xFF)
	#define GC0308_WRITE_ID_2			(0xFF)
	#define GC0308_WRITE_ID_3			(0xFF)
	
	#define GC0308_I2C_8_8			/* I2C Register Address 8bits, Register Values 8bits */
	//#define GC0308_I2C_8_16			/* I2C Register Address 8bits, Register Values 16bits */
	//#define GC0308_I2C_16_8				/* I2C Register Address 16bits, Register Values 8bits */
	//#define GC0308_I2C_16_16			/* I2C Register Address 16bits, Register Values 16bits */

	/*Important: If you use Nor Flash with Paging Mode PSRAM, you should use this Macro*/
	//#define GC0308_MCP_NOR_PAGING_MODE_PSRAM

	/* Sesnor Pixel/Line Numbers in One Period */	
	#define GC0308_PV_PERIOD_PIXEL_NUMS    		(640)  	/* Default preview line length */
	#define GC0308_PV_PERIOD_LINE_NUMS     			(480)   	/* Default preview frame length */
	#define GC0308_FULL_PERIOD_PIXEL_NUMS  		(640)  	/* Default full size line length */
	#define GC0308_FULL_PERIOD_LINE_NUMS   		(480)  	/* Default full size frame length */
	
	/* Sensor Exposure Line Limitation */
	#define GC0308_PV_EXPOSURE_LIMITATION      	
	#define GC0308_FULL_EXPOSURE_LIMITATION

	/* Sensor Preview Size (3M: 1024x768 or 640x480, 2M: 800x600, 1,3M: 640x512, VGA: 640x480, CIF: 352x288) */
	#define GC0308_IMAGE_SENSOR_PV_WIDTH   		(640)
	#define GC0308_IMAGE_SENSOR_PV_HEIGHT  		(480)
	/* Sensor Capture Size (3M: 2048x1536, 2M: 1600x1200, 1.3M: 1280x1024, VGA: 640x480, CIF: 352x288) */
	#define GC0308_IMAGE_SENSOR_FULL_WIDTH     	(640)
	#define GC0308_IMAGE_SENSOR_FULL_HEIGHT    	(480)

	/* Config the ISP grab start x & start y, Config the ISP grab width & height */
	#define GC0308_PV_GRAB_START_X 				(1)
	#define GC0308_PV_GRAB_START_Y  				(1)
	#define GC0308_PV_GRAB_WIDTH					(GC0308_IMAGE_SENSOR_PV_WIDTH - 8 )
	#define GC0308_PV_GRAB_HEIGHT					(GC0308_IMAGE_SENSOR_PV_HEIGHT - 6)

	#define GC0308_FULL_GRAB_START_X   			(1)
	#define GC0308_FULL_GRAB_START_Y	  			(1)
	#define GC0308_FULL_GRAB_WIDTH				(GC0308_IMAGE_SENSOR_FULL_WIDTH - 8)
	#define GC0308_FULL_GRAB_HEIGHT				(GC0308_IMAGE_SENSOR_FULL_HEIGHT - 6)

	/*===========================================================*/
	/*===========================================================*/
	/*		Important Notices: Please don't modify the macro or code below this line				 */
	/*===========================================================*/
	/*===========================================================*/

	#define GC0308_SET_RESET_LOW					(REG_ISP_CMOS_SENSOR_MODE_CONFIG &= ~REG_CMOS_SENSOR_RESET_BIT)
	#define GC0308_SET_RESET_HIGH					(REG_ISP_CMOS_SENSOR_MODE_CONFIG |= REG_CMOS_SENSOR_RESET_BIT)
	#define GC0308_SET_PDN_LOW					(REG_ISP_CMOS_SENSOR_MODE_CONFIG &= ~REG_CMOS_SENSOR_POWER_ON_BIT)
	#define GC0308_SET_PDN_HIGH					(REG_ISP_CMOS_SENSOR_MODE_CONFIG |= REG_CMOS_SENSOR_POWER_ON_BIT)
	
	#if (defined(MCU_312M))						/* MT6236 series. */
		#define GC0308_SENSOR_I2C_DELAY			(0xC0)
	#elif (defined(MCU_245_76M))				/* MT6268 series. */
		#define GC0308_SENSOR_I2C_DELAY			(0xA0)
	#elif (defined(MCU_208M))					/* MT6238/39, MT6235 series. */
		#define GC0308_SENSOR_I2C_DELAY			(0x80)
	#elif (defined(MCU_104M))					/* MT6225, MT6253 series. */
		#define GC0308_SENSOR_I2C_DELAY			(0x40)
	#else
		#define GC0308_SENSOR_I2C_DELAY			(0xFF)
	#endif
	
#ifndef GC0308_HW_SCCB

	#define GC0308_I2C_START_TRANSMISSION \
	{ \
		volatile kal_uint8 idx; \
		SET_SCCB_CLK_OUTPUT; \
		SET_SCCB_DATA_OUTPUT; \
		SET_SCCB_DATA_HIGH; \
		for (idx = 0; idx < GC0308_SENSOR_I2C_DELAY; idx++); \
		SET_SCCB_CLK_HIGH; \
		for (idx = 0; idx < GC0308_SENSOR_I2C_DELAY; idx++); \
		SET_SCCB_DATA_LOW; \
		for (idx = 0; idx < GC0308_SENSOR_I2C_DELAY; idx++); \
		SET_SCCB_CLK_LOW; \
	}

	#define GC0308_I2C_STOP_TRANSMISSION \
	{ \
		volatile kal_uint8 idx; \
		SET_SCCB_CLK_OUTPUT; \
		SET_SCCB_DATA_OUTPUT; \
		SET_SCCB_CLK_LOW; \
		SET_SCCB_DATA_LOW; \
		for (idx = 0; idx < GC0308_SENSOR_I2C_DELAY; idx++); \
		SET_SCCB_CLK_HIGH; \
		for (idx = 0; idx < GC0308_SENSOR_I2C_DELAY; idx++); \
		SET_SCCB_DATA_HIGH; \
	}
#endif	/* #ifndef GC0308_HW_SCCB */

#ifdef GC0308_LOAD_FROM_T_FLASH
	#if (defined(GC0308_I2C_8_8))
		#define GC0308_REG_SKIP		0x06
		#define GC0308_VAL_SKIP		0x06
	#elif (defined(GC0308_I2C_8_16))
		#define GC0308_REG_SKIP		0x06
		#define GC0308_VAL_SKIP		0x08
	#elif (defined(GC0308_I2C_16_8))
		#define GC0308_REG_SKIP		0x08
		#define GC0308_VAL_SKIP		0x06
	#elif (defined(GC0308_I2C_16_16))
		#define GC0308_REG_SKIP		0x08
		#define GC0308_VAL_SKIP		0x08
	#endif

	/* 0 - Initial value, 1 - Register, 2 - Delay, 3 - End of setting. */
	#define GC0308_OP_CODE_INI		0x00		/* Initial value. */
	#define GC0308_OP_CODE_REG		0x01		/* Register */
	#define GC0308_OP_CODE_DLY		0x02		/* Delay */
	#define GC0308_OP_CODE_END		0x03		/* End of initial setting. */
#endif

/************************ Engineer Mode Use it *************************************/
#if (!(defined(DRV_ISP_6238_SERIES) || defined(DRV_ISP_6276_SERIES) || defined(DRV_ISP_6235_SERIES) ))	
	#if (!(defined(__CAMERA_NVRAM_REDUCTION__) && defined(DRV_ISP_6225_SERIES)))
		typedef struct {
			kal_uint32 addr;
			kal_uint32 para;
		} sensor_reg_struct;

		typedef struct {
			sensor_reg_struct reg[FACTORY_END_ADDR];
			sensor_reg_struct cct[CCT_END_ADDR];
		} sensor_data_struct;
	#endif
#endif

	typedef struct
	{
		kal_uint16 NightmodeEnable; 		/* NOTICE: Not used now */
		kal_uint16 TargetWidth;
		kal_uint16 TargetHeight;
		kal_uint16 NormalModeFrameRate; 	/* frame rate * 10 */
		kal_uint16 NightModeFrameRate;		/* frame rate * 10 */
	} GC0308_FRAME_RATE_LUT, *P_GC0308_FRAME_RATE_LUT;

	typedef struct
	{
		kal_uint16 init_reg;
		kal_uint16 init_val;	/* Save the register value and delay tick */
		kal_uint8 op_code;		/* 0 - Initial value, 1 - Register, 2 - Delay, 3 - End of setting. */
	} GC0308_initial_set_struct;
		
	typedef struct
	{
		kal_uint16	video_target_width;
		kal_uint16	video_target_height;

		kal_bool	MJPEG_encode_mode;			/* Motion JPEG */
		kal_bool	MPEG4_encode_mode;			/* MJPEG4 JPEG */
		kal_bool	FULLVIDEO_encode_mode;		/* 3G Video Call */

		kal_bool	sensor_cap_state;			/* Preview or Capture mode */
		kal_bool	is_PV_mode; 				/* PV size or Full size */
		kal_bool	is_panorama_capturing;		/* 3G Video Call */

		kal_uint32	curr_banding;				/* 50Hz/60Hz */
		kal_bool	night_mode;
	} GC0308_OPERATION_STATE_ST;
	
	typedef struct
	{
		kal_uint8	sccb_write_id;
		kal_uint8	sccb_read_id;

		kal_uint32	pv_shutter;
		kal_uint32	pv_extra_shutter;
		kal_uint32	pv_sensor_gain;

		kal_uint32	pv_dummy_pixels;
		kal_uint32	pv_dummy_lines;
		kal_uint32	cap_dummy_pixels;
		kal_uint32	cap_dummy_lines;

		/* Preview & Capture Pixel Clock, 360 means 36.0MHz. Unit Multiple 10. */
		kal_uint32	preview_pclk;
		kal_uint32	capture_pclk;

		/* Video frame rate 300 means 30.0fps. Unit Multiple 10. */
		kal_uint32	video_frame_rate;	
	}GC0308_SENSOR_INFO_ST;

	/* API FOR ENGINEER FACTORY MODE */
	void GC0308_get_sensor_group_count(kal_int32* sensor_count_ptr);
	void GC0308_get_sensor_group_info(kal_uint16 group_idx, kal_int8* group_name_ptr, kal_int32* item_count_ptr);
	void GC0308_get_sensor_item_info(kal_uint16 group_idx, kal_uint16 item_idx, ENG_sensor_info* info_ptr);
	kal_bool GC0308_set_sensor_item_info(kal_uint16 group_idx, kal_uint16 item_idx, kal_int32 item_value);

	/* write camera_para to sensor register */
	void GC0308_camera_para_to_sensor(void);
	/* update camera_para from sensor register */
	void GC0308_sensor_to_camera_para(void);
	/* config sensor callback function */
	void GC0308_image_sensor_func_config(void);
	/* detect sensor id */
	kal_uint32 GC0308_detect_sensor_id(void);
	void GC0308_get_sensor_prefix_name(kal_char* buf);
	void  GC0308_dispatch_camera_info(void);
	kal_uint32 GC0308_get_valid_camera_type(void);	
	extern void cis_module_power_on(kal_bool on);
	extern void flashlight_power_on(kal_bool on);


#endif	/* _IMAGE_SENSOR_GC0308_H */
