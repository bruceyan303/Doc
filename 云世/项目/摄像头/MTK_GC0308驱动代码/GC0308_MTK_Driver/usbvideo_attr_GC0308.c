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
 *   usbvideo_attr_GC0308.c
 *
 * Project:
 * --------
 *   MAUI
 *
 * Description:
 * ------------
 *   Web cameera parameter for sensor driver related.
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
 *
 *
 *
 *------------------------------------------------------------------------------
 * Upper this line, this part is controlled by PVCS VM. DO NOT MODIFY!!
 *=============================================================
 ******************************************************************************/

#include "drv_comm.h"
#include "stdio.h"
#include "drv_features.h" 
#include "isp_if.h"
#include "med_api.h"
#include "image_sensor.h"
#include "camera_para.h"
#include "usbvideo_attr_GC0308.h"

#if (defined(WEBCAM_SUPPORT))

#include "usbvideo_cam_if.h"

/* supported feature list */
const USBVideo_Attr_Info GC0308_ATTR_INFO[3] =
{
	{USBVIDEO_ATTRIBUTE_POWER_LINE_FREQUENCY, KAL_TRUE, KAL_TRUE},						
	{USBVIDEO_ATTRIBUTE_WHITE_BALANCE_TMP, KAL_TRUE, KAL_TRUE},							
	{USBVIDEO_ATTRIBUTE_WHITE_BALANCE_TMP_AUTO, KAL_TRUE, KAL_TRUE},
};

/* supported video size list */
const USBVideo_Video_Size_Info GC0308_VIDEO_SIZE[3] =
{
	{USBVIDEO_VIDEO_SIZE_1, 160, 120, 0xC000, 912382, 38012, 500000, 500000, 500000, 0},
	{USBVIDEO_VIDEO_SIZE_2, 320, 240, 0xC000, 912384, 38016, 500000, 500000, 500000, 0},
#if (defined(DRV_ISP_6238_SERIES))	
	{USBVIDEO_VIDEO_SIZE_3, 640, 480, 0x18000, 912384, 38016, 500000, 500000, 500000, 0}	
#else
#if (!defined(MT6225))    
	{USBVIDEO_VIDEO_SIZE_3, 640, 480, 0xC000, 912384, 38016, 500000, 500000, 500000, 0}	
#else
	{USBVIDEO_VIDEO_SIZE_3, 640, 480, 0xC100, 912384, 38016, 500000, 500000, 500000, 0}	
#endif	
#endif
};

/* supported still image size list */
const USBVideo_Still_Size_Info GC0308_STILL_SIZE[] =
{
	{USBVIDEO_STILL_SIZE_1, 160, 120, 0xC000},
	{USBVIDEO_STILL_SIZE_2, 320, 240, 0xC000},
#if (defined(DRV_ISP_6238_SERIES))	
	{USBVIDEO_STILL_SIZE_3, 640, 480, 0x18000}
#else	
	{USBVIDEO_STILL_SIZE_3, 640, 480, 0xC000}
#endif	
};

/* supported compression type list*/
const USBVideo_Compression_Info GC0308_STILL_COMPRESSION[] =
{
	{USBVIDEO_COMPRESSION_1, JPEG_ENCODER_POOR_QUALITY},
	{USBVIDEO_COMPRESSION_2, JPEG_ENCODER_FAIR_QUALITY}
};
const USBVIDEO_VIDEO_SIZE_TYPE GC0308_g_default_video_size = USBVIDEO_VIDEO_SIZE_1;
const USBVIDEO_STILL_SIZE_TYPE GC0308_g_default_still_size = USBVIDEO_STILL_SIZE_1;
const USBVIDEO_COMPRESSION_TYPE GC0308_g_default_compression = USBVIDEO_COMPRESSION_1;

/*************************************************************************
* Customer Folder.. 
*************************************************************************/

const USBVideo_Attr_Info* GC0308_get_usbvideo_attr_info(kal_uint8 *p_size)
{
	*p_size = sizeof(GC0308_ATTR_INFO)/sizeof(USBVideo_Attr_Info);
	return GC0308_ATTR_INFO;
}

const USBVideo_Video_Size_Info* GC0308_get_usbvideo_video_size(kal_uint8 *p_size)
{
	*p_size = sizeof(GC0308_VIDEO_SIZE)/sizeof(USBVideo_Video_Size_Info);
	return GC0308_VIDEO_SIZE;
}

const USBVIDEO_VIDEO_SIZE_TYPE GC0308_get_usbvideo_default_video_index(void)
{
	return GC0308_g_default_video_size;
}

const USBVideo_Still_Size_Info* GC0308_get_usbvideo_still_size(kal_uint8 *p_size)
{
	*p_size = sizeof(GC0308_STILL_SIZE)/sizeof(USBVideo_Still_Size_Info);
	return GC0308_STILL_SIZE;
}

const USBVIDEO_STILL_SIZE_TYPE GC0308_get_usbvideo_default_still_index(void)
{
	return GC0308_g_default_still_size;
}

const USBVideo_Compression_Info* GC0308_get_usbvideo_compression(kal_uint8 *p_size)
{
	*p_size = sizeof(GC0308_STILL_COMPRESSION)/sizeof(USBVideo_Compression_Info);
	return GC0308_STILL_COMPRESSION;
}

const USBVIDEO_COMPRESSION_TYPE GC0308_get_usbvideo_default_compression_index(void)
{
	return GC0308_g_default_compression;
}

/* function tables for USB driver*/
USBVideo_Camera_Param GC0308_usbvideo_cam_get_param_ISP =
{
	GC0308_get_usbvideo_attr_info,
	GC0308_get_usbvideo_video_size,
	GC0308_get_usbvideo_default_video_index,
	GC0308_get_usbvideo_still_size,
	GC0308_get_usbvideo_default_still_index,
	GC0308_get_usbvideo_compression,
	GC0308_get_usbvideo_default_compression_index,
	usbvideo_camera_get_attr
};

const USBVideo_Camera_Param* GC0308_USBVideo_Get_Camera_Param(void)
{
	return(&GC0308_usbvideo_cam_get_param_ISP);
}

/*************************************************************************
* Customer Folder.. (Webcam Function Map)
*************************************************************************/
/* translate the preivious infomrations into functions */
void GC0308_usbvideo_cmd_mapping(void)
{
	/* PU Part */
	kal_uint32 i;
	for(i=0;i<(sizeof(GC0308_ATTR_INFO)/sizeof(USBVideo_Attr_Info));i++)
	{
		usbvideo_cam_command_PU_map[GET_ATTR_PU_IDX(GC0308_ATTR_INFO[i].type)] = USBVIDEO_CAM_ATTR_SENSOR;
	}
}

void GC0308_usbvideo_get_attr(USBVideo_Attr_Value *attr)
{
	/* Sensor Attributes Get */	
    usbvideo_camera_effect_getting_attr(attr);    
}

void GC0308_usbvideo_set_attr(USBVideo_Attr_Value *attr)
{
	USBVIDEO_ATTRIBUTE_TYPE attr_type = attr->type;
	kal_uint32 attr_value = attr->value;
	/* Sensor Attributes Set */	
	// update attr PU current value
    usbvideo_attr_PU_value_list[GET_ATTR_PU_IDX(attr_type)] = attr_value;	
	switch(attr_type)
	{
	case USBVIDEO_ATTRIBUTE_POWER_LINE_FREQUENCY:
		if(attr_value==0)	/* 50Hz */
			image_sensor_func->yuv_sensor_setting(CAM_PARAM_BANDING,CAM_BANDING_50HZ);
		else					/* 60Hz or Disable */
			image_sensor_func->yuv_sensor_setting(CAM_PARAM_BANDING,CAM_BANDING_60HZ);
		break;		
	case USBVIDEO_ATTRIBUTE_BACKLIGHT_COMPENSATION:
		image_sensor_func->yuv_sensor_setting(CAM_PARAM_EXPOSURE,attr_value);
        break;
	case USBVIDEO_ATTRIBUTE_WHITE_BALANCE_TMP_AUTO:                        
		if(attr_value>0)    /* AUTO */
			image_sensor_func->yuv_sensor_setting(CAM_PARAM_WB,CAM_WB_AUTO);
	case USBVIDEO_ATTRIBUTE_WHITE_BALANCE_TMP:            
		if(usbvideo_attr_PU_value_list[GET_ATTR_PU_IDX(USBVIDEO_ATTRIBUTE_WHITE_BALANCE_TMP_AUTO)] == 0 )
		{
			if(usbvideo_attr_PU_value_list[GET_ATTR_PU_IDX(USBVIDEO_ATTRIBUTE_WHITE_BALANCE_TMP)]>5800)
				image_sensor_func->yuv_sensor_setting(CAM_PARAM_WB,CAM_WB_DAYLIGHT);
			else if(usbvideo_attr_PU_value_list[GET_ATTR_PU_IDX(USBVIDEO_ATTRIBUTE_WHITE_BALANCE_TMP)]>=4800)					
				image_sensor_func->yuv_sensor_setting(CAM_PARAM_WB,CAM_WB_INCANDESCENCE);											
			else if(usbvideo_attr_PU_value_list[GET_ATTR_PU_IDX(USBVIDEO_ATTRIBUTE_WHITE_BALANCE_TMP)]>=3800)											
				image_sensor_func->yuv_sensor_setting(CAM_PARAM_WB,CAM_WB_FLUORESCENT);																
			else if(usbvideo_attr_PU_value_list[GET_ATTR_PU_IDX(USBVIDEO_ATTRIBUTE_WHITE_BALANCE_TMP)]>=2800)					
				image_sensor_func->yuv_sensor_setting(CAM_PARAM_WB,CAM_WB_TUNGSTEN);						
		}
        break;            
    }														
	
	return;
}

/* function tables for media task */
usbvideo_sensor_func_struct GC0308_usbvideo_func=
{
	GC0308_usbvideo_cmd_mapping,
	GC0308_usbvideo_get_attr,
	GC0308_usbvideo_set_attr
};

void GC0308_usbvideo_camera_func_config(void)
{
	usbvideo_image_sensor_func = &GC0308_usbvideo_func;
}

void GC0308_dispatch_usbvideo_info(void) 
{
	kal_mem_cpy(VIDEO_SIZE, GC0308_VIDEO_SIZE, sizeof(GC0308_VIDEO_SIZE));
	kal_mem_cpy(STILL_SIZE, GC0308_STILL_SIZE, sizeof(GC0308_STILL_SIZE));
	kal_mem_cpy(STILL_COMPRESSION, GC0308_STILL_COMPRESSION, sizeof(GC0308_STILL_COMPRESSION));
	
	g_default_video_size = GC0308_g_default_video_size;
	g_default_still_size = GC0308_g_default_still_size;
	g_default_compression = GC0308_g_default_compression;
}

#else

	const USBVideo_Camera_Param* GC0308_USBVideo_Get_Camera_Param(void){}
	void GC0308_usbvideo_camera_func_config(void){}
	void GC0308_dispatch_usbvideo_info(void){}

#endif	/* #if (defined(WEBCAM_SUPPORT)) */
