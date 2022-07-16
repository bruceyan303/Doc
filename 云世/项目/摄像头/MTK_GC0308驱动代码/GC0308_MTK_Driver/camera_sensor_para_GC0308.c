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
 *   camera_sensor_para_GC0308.c
 *
 * Project:
 * --------
 *   MAUI
 *
 * Description:
 * ------------
 *   Camera Operation Parameter for sensor driver related. It defines the query function when enable
 *	the camcorder. It defines the sensor capability, ex, the MWB, effect, EV and so on.
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

#include "kal_release.h"
#include "drv_features.h"

#if (defined(DRV_ISP_6238_SERIES)||defined(DRV_ISP_6276_SERIES))

#if defined(ISP_SUPPORT)


#include "camera_para.h"
#include "isp_flashlight.h"
#include "med_api.h"
#include "camera_info_GC0308.h"
#include "isp_if_6238_series_sw.h"

void GC0308_CameraDriverInitOperationPara(CameraDriverOperationParaStruct *p_oper_data)
{
	p_oper_data->capture_delay_frame = 2;			/* wait stable frame when sensor change mode (pre to cap) */
	p_oper_data->preview_delay_frame = 2;			/* wait stable frame when sensor change mode (cap to pre) */
}

void GC0308_get_capture_mode_ability(cam_fun_info *p_info){
	p_info->is_support = KAL_TRUE;
	p_info->item_count = 4;
	p_info->support_item[0] = CAM_MODE_NORMAL;
	p_info->support_item[1] = CAM_MODE_CONT_SHOT;
	p_info->support_item[2] = CAM_MODE_BURST_SHOT;
	p_info->support_item[3] = CAM_MODE_ADD_FRAME;	
}

void GC0308_get_camera_scene_ability(cam_fun_info *p_info){
    p_info->is_support = KAL_TRUE;
    p_info->item_count = 2;
    p_info->support_item[0] = CAM_AUTO_DSC; 
    p_info->support_item[1] = CAM_NIGHTSCENE;
}

void GC0308_get_capture_size_ability(cam_fun_info *p_info){
	p_info->is_support = KAL_TRUE;
	
#if (defined(__YUVCAM_INTERPOLATION_SW__)||defined(__YUVCAM_INTERPOLATION_HW__))
	p_info->item_count = 3;
	p_info->support_item[0] = CAM_SIZE_WALLPAPER;
	p_info->support_item[1] = CAM_SIZE_VGA;	
	p_info->support_item[2] = CAM_SIZE_1M;

	#if (defined(__IMAGE_SENSOR_1M__) || defined(__IMAGE_SENSOR_2M__))
		p_info->support_item[p_info->item_count] = CAM_SIZE_2M;	
		p_info->item_count++;
	#endif
	#if (defined(__IMAGE_SENSOR_2M__))
		p_info->support_item[p_info->item_count] = CAM_SIZE_3M;	
		p_info->item_count++;
	#endif
	
#else

	p_info->item_count = 2;
	p_info->support_item[0] = CAM_SIZE_WALLPAPER;
	p_info->support_item[1] = CAM_SIZE_VGA;	

	#if (defined(__IMAGE_SENSOR_1M__) || defined(__IMAGE_SENSOR_2M__) || defined(__IMAGE_SENSOR_3M__))
		p_info->support_item[p_info->item_count] = CAM_SIZE_1M;	
		p_info->item_count++;
	#endif
	#if (defined(__IMAGE_SENSOR_2M__) || defined(__IMAGE_SENSOR_3M__))
		p_info->support_item[p_info->item_count] = CAM_SIZE_2M;	
		p_info->item_count++;
	#endif
	#if (defined(__IMAGE_SENSOR_3M__))
		p_info->support_item[p_info->item_count] = CAM_SIZE_3M;	
		p_info->item_count++;
	#endif
#endif
	
}

void GC0308_get_flashlight_ability(cam_fun_info *p_info){
	p_info->is_support = KAL_FALSE;
	p_info->item_count = 0;
	
}

void GC0308_get_af_range_ability(cam_fun_info *p_info){
	p_info->is_support = KAL_FALSE;
	p_info->item_count = 0;	
}

void GC0308_get_iso_ability(cam_fun_info *p_info){
	p_info->is_support = KAL_FALSE;
	p_info->item_count = 0;
}

void GC0308_get_binning_ability(cam_fun_info *p_info){
	p_info->is_support = KAL_FALSE;
	p_info->item_count = 0;
}

void GC0308_get_wb_ability(cam_fun_info *p_info){
	p_info->is_support = KAL_TRUE;
	p_info->item_count = 5;
	p_info->support_item[0] = CAM_WB_AUTO;
	p_info->support_item[1] = CAM_WB_CLOUD;
	p_info->support_item[2] = CAM_WB_DAYLIGHT;
	p_info->support_item[3] = CAM_WB_INCANDESCENCE;
	p_info->support_item[4] = CAM_WB_TUNGSTEN;
}

void GC0308_get_effect_ability(cam_fun_info *p_info){
	p_info->is_support = KAL_TRUE;
	p_info->item_count = 6;
	p_info->support_item[0] = CAM_EFFECT_ENC_NORMAL; 
	p_info->support_item[1] = CAM_EFFECT_ENC_GRAYSCALE;
	p_info->support_item[2] = CAM_EFFECT_ENC_SEPIA;
	p_info->support_item[3] = CAM_EFFECT_ENC_SEPIAGREEN;
	p_info->support_item[4] = CAM_EFFECT_ENC_SEPIABLUE;
	p_info->support_item[5] = CAM_EFFECT_ENC_COLORINV;
}

void GC0308_get_af_mode_ability(cam_fun_info *p_info){
	p_info->is_support = KAL_FALSE;
	p_info->item_count = 0;
}

void GC0308_get_ae_meter_ability(cam_fun_info *p_info){
	p_info->is_support = KAL_FALSE;
	p_info->item_count = 0;
}

void GC0308_get_sharpness_ability(cam_fun_info *p_info){
	p_info->is_support = KAL_FALSE;
	p_info->item_count = 0;
}

void GC0308_get_contrast_ability(cam_fun_info *p_info){
	p_info->is_support = KAL_FALSE;
	p_info->item_count = 0;
}

void GC0308_get_saturation_ability(cam_fun_info *p_info){
	p_info->is_support = KAL_FALSE;
	p_info->item_count = 0;	
}

void GC0308_get_ev_ability(cam_fun_info *p_info){
	p_info->is_support = KAL_TRUE;
	p_info->item_count = 10;
	p_info->support_item[0] = CAM_EV_NEG_4_3;
	p_info->support_item[1] = CAM_EV_NEG_3_3;
	p_info->support_item[2] = CAM_EV_NEG_2_3;
	p_info->support_item[3] = CAM_EV_NEG_1_3;
	p_info->support_item[4] = CAM_EV_ZERO;
	p_info->support_item[5] = CAM_EV_POS_1_3;
	p_info->support_item[6] = CAM_EV_POS_2_3;
	p_info->support_item[7] = CAM_EV_POS_3_3;
	p_info->support_item[8] = CAM_EV_POS_4_3;
	p_info->support_item[9] = CAM_EV_NIGHT_SHOT;		
}

void GC0308_get_banding_ability(cam_fun_info *p_info){
	p_info->is_support = KAL_TRUE;
	p_info->item_count = 2;
	p_info->support_item[0] = CAM_BANDING_50HZ;
	p_info->support_item[1] = CAM_BANDING_60HZ;		
}

void GC0308_get_zoom_ability(cam_zoom_info *p_info){ //different structure
	p_info->is_support = KAL_TRUE;
	p_info->zoom_steps = 40;
	p_info->max_zoom_factor = 800;
}

void GC0308_get_video_scene_ability(cam_fun_info *p_info){
	p_info->is_support = KAL_TRUE;
	p_info->item_count = 2;
	p_info->support_item[0] = CAMERA_VIDEO_AUTO;
	p_info->support_item[1] = CAMERA_VIDEO_NIGHT;	
}

void GC0308_get_video_codec_ability(cam_fun_info *p_info){
	p_info->is_support = KAL_TRUE;
	p_info->item_count = 2;
	p_info->support_item[0] = CAM_VIDEO_CODEDEC_MPEG;
	p_info->support_item[1] = CAM_VIDEO_CODEDEV_H263;
}

void GC0308_get_video_size_ability(cam_fun_info *p_info){
#if(defined(__CAMCORDER_PACKAGE_SLIM__))
	p_info->is_support = KAL_TRUE;
	p_info->item_count = 3;
	#if defined(DRV_ISP_MT6236_HW_SUPPORT)
		#if (defined(__VIDEO_ENC_D1_SUPPORT__))
			p_info->support_item[0] = CAM_VIDEO_SIZE_QCIF;
			p_info->support_item[1] = CAM_VIDEO_SIZE_HVGA;
			p_info->support_item[2] = CAM_VIDEO_SIZE_D1;
		#else
			p_info->support_item[0] = CAM_VIDEO_SIZE_QCIF;
			p_info->support_item[1] = CAM_VIDEO_SIZE_QVGA;
			p_info->support_item[2] = CAM_VIDEO_SIZE_HVGA;
		#endif
	#else
		p_info->support_item[0] = CAM_VIDEO_SIZE_QCIF;
		p_info->support_item[1] = CAM_VIDEO_SIZE_QVGA;
		p_info->support_item[2] = CAM_VIDEO_SIZE_CIF;
	#endif
#else
	#if defined(DRV_ISP_MT6236_HW_SUPPORT)
		p_info->is_support = KAL_TRUE;
		p_info->item_count = 3;
		#if (defined(__VIDEO_ENC_D1_SUPPORT__))
			p_info->support_item[0] = CAM_VIDEO_SIZE_QCIF;
			p_info->support_item[1] = CAM_VIDEO_SIZE_HVGA;
			p_info->support_item[2] = CAM_VIDEO_SIZE_D1;
		#else
			p_info->support_item[0] = CAM_VIDEO_SIZE_QCIF;
			p_info->support_item[1] = CAM_VIDEO_SIZE_QVGA;
			p_info->support_item[2] = CAM_VIDEO_SIZE_HVGA;
		#endif
	#else
		p_info->is_support = KAL_TRUE;
		p_info->item_count = 3;
		p_info->support_item[0] = CAM_VIDEO_SIZE_QCIF;
		p_info->support_item[1] = CAM_VIDEO_SIZE_QVGA;
		p_info->support_item[2] = CAM_VIDEO_SIZE_VGA;
	#endif
#endif

	
}

#if defined(SENSOR_COMMON_INTERFACE_SUPPORT)
extern MM_ERROR_CODE_ENUM GC0308_feature_control(IMAGE_SENSOR_FEATURE_ENUM feature_id, void* p_feature_para_input,void* p_feature_para_output, kal_uint16 feature_para_output_length);
#endif
camera_capability_func_struct GC0308_camera_capability = {
	GC0308_get_capture_mode_ability,
	GC0308_get_camera_scene_ability,	
	GC0308_get_capture_size_ability,
	GC0308_get_flashlight_ability,
	GC0308_get_af_range_ability,
	GC0308_get_iso_ability,
	GC0308_get_binning_ability,
	GC0308_get_wb_ability,
	GC0308_get_effect_ability,
	GC0308_get_af_mode_ability,
	GC0308_get_ae_meter_ability,
	GC0308_get_sharpness_ability,
	GC0308_get_contrast_ability,
	GC0308_get_saturation_ability,
	GC0308_get_ev_ability,
	GC0308_get_banding_ability,
	GC0308_get_zoom_ability,
	GC0308_get_video_scene_ability,
	GC0308_get_video_codec_ability,
	GC0308_get_video_size_ability,
#if defined(SENSOR_COMMON_INTERFACE_SUPPORT)
//	GC0308_feature_control,
#endif
};	

CAP_SIZE GC0308_camera_iso_imgsize_upperbound(CAM_SCENE_MODE iso_value)
{
	switch (iso_value)
	{
	case CAM_ISO800:
		return CAM_SIZE_VGA;
		break;
	case CAM_ISO1600:
		return CAM_SIZE_VGA;
		break;
	default:
		return CAM_SIZE_VGA;
		break;
	}
}

CAMERA_INTERFACE_ENUM GC0308_camera_interface_support(void) {
    return CAM_YUV_SUPPORT;
}

camera_module_info_func_struct GC0308_camera_module_info = {
    GC0308_camera_interface_support
};
#endif//#if defined(ISP_SUPPORT)

#elif (defined(DRV_ISP_6235_SERIES))
#if defined(ISP_SUPPORT)


#include "camera_para.h"
#include "isp_flashlight.h"
#include "med_api.h"
#include "camera_info_GC0308.h"


void GC0308_get_capture_mode_ability(cam_fun_info *p_info){
	p_info->is_support = KAL_TRUE;
	p_info->item_count = 4;
	p_info->support_item[0] = CAM_MODE_NORMAL;
	p_info->support_item[1] = CAM_MODE_CONT_SHOT;
	p_info->support_item[2] = CAM_MODE_BURST_SHOT;
	p_info->support_item[3] = CAM_MODE_ADD_FRAME;	
}

void GC0308_get_camera_scene_ability(cam_fun_info *p_info){
	p_info->is_support = KAL_TRUE;
	p_info->item_count = 2;
	p_info->support_item[0] = CAM_AUTO_DSC; 
	p_info->support_item[1] = CAM_NIGHTSCENE;
}

void GC0308_get_capture_size_ability(cam_fun_info *p_info){
	p_info->is_support = KAL_TRUE;
	
#if (defined(__YUVCAM_INTERPOLATION_SW__)||defined(__YUVCAM_INTERPOLATION_HW__))
	p_info->item_count = 3;
	p_info->support_item[0] = CAM_SIZE_WALLPAPER;
	p_info->support_item[1] = CAM_SIZE_VGA;	
	p_info->support_item[2] = CAM_SIZE_1M;

	#if (defined(__IMAGE_SENSOR_1M__) || defined(__IMAGE_SENSOR_2M__))
		p_info->support_item[p_info->item_count] = CAM_SIZE_2M;	
		p_info->item_count++;
	#endif
	#if (defined(__IMAGE_SENSOR_2M__))
		p_info->support_item[p_info->item_count] = CAM_SIZE_3M;	
		p_info->item_count++;
	#endif
	
#else

	p_info->item_count = 2;
	p_info->support_item[0] = CAM_SIZE_WALLPAPER;
	p_info->support_item[1] = CAM_SIZE_VGA;	

	#if (defined(__IMAGE_SENSOR_1M__) || defined(__IMAGE_SENSOR_2M__) || defined(__IMAGE_SENSOR_3M__))
		p_info->support_item[p_info->item_count] = CAM_SIZE_1M;	
		p_info->item_count++;
	#endif
	#if (defined(__IMAGE_SENSOR_2M__) || defined(__IMAGE_SENSOR_3M__))
		p_info->support_item[p_info->item_count] = CAM_SIZE_2M;	
		p_info->item_count++;
	#endif
	#if (defined(__IMAGE_SENSOR_3M__))
		p_info->support_item[p_info->item_count] = CAM_SIZE_3M;	
		p_info->item_count++;
	#endif
#endif
	
}

void GC0308_get_flashlight_ability(cam_fun_info *p_info){
	p_info->is_support = KAL_FALSE;
	p_info->item_count = 0;
	
}

void GC0308_get_af_range_ability(cam_fun_info *p_info){
	p_info->is_support = KAL_FALSE;
	p_info->item_count = 0;	
}

void GC0308_get_iso_ability(cam_fun_info *p_info){
	p_info->is_support = KAL_FALSE;
	p_info->item_count = 0;
}

void GC0308_get_binning_ability(cam_fun_info *p_info){
	p_info->is_support = KAL_FALSE;
	p_info->item_count = 0;
}

void GC0308_get_wb_ability(cam_fun_info *p_info){
	p_info->is_support = KAL_TRUE;
	p_info->item_count = 5;
	p_info->support_item[0] = CAM_WB_AUTO;
	p_info->support_item[1] = CAM_WB_CLOUD;
	p_info->support_item[2] = CAM_WB_DAYLIGHT;
	p_info->support_item[3] = CAM_WB_INCANDESCENCE;
	p_info->support_item[4] = CAM_WB_TUNGSTEN;
}

void GC0308_get_effect_ability(cam_fun_info *p_info){
	p_info->is_support = KAL_TRUE;
	p_info->item_count = 6;
	p_info->support_item[0] = CAM_EFFECT_ENC_NORMAL; 
	p_info->support_item[1] = CAM_EFFECT_ENC_GRAYSCALE;
	p_info->support_item[2] = CAM_EFFECT_ENC_SEPIA;
	p_info->support_item[3] = CAM_EFFECT_ENC_SEPIAGREEN;
	p_info->support_item[4] = CAM_EFFECT_ENC_SEPIABLUE;
	p_info->support_item[5] = CAM_EFFECT_ENC_COLORINV;
}

void GC0308_get_af_mode_ability(cam_fun_info *p_info){
	p_info->is_support = KAL_FALSE;
	p_info->item_count = 0;
}

void GC0308_get_ae_meter_ability(cam_fun_info *p_info){
	p_info->is_support = KAL_FALSE;
	p_info->item_count = 0;
}

void GC0308_get_sharpness_ability(cam_fun_info *p_info){
	p_info->is_support = KAL_FALSE;
	p_info->item_count = 0;
}

void GC0308_get_contrast_ability(cam_fun_info *p_info){
	p_info->is_support = KAL_FALSE;
	p_info->item_count = 0;
}

void GC0308_get_saturation_ability(cam_fun_info *p_info){
	p_info->is_support = KAL_FALSE;
	p_info->item_count = 0;	
}

void GC0308_get_ev_ability(cam_fun_info *p_info){
	p_info->is_support = KAL_TRUE;
	p_info->item_count = 10;
	p_info->support_item[0] = CAM_EV_NEG_4_3;
	p_info->support_item[1] = CAM_EV_NEG_3_3;
	p_info->support_item[2] = CAM_EV_NEG_2_3;
	p_info->support_item[3] = CAM_EV_NEG_1_3;
	p_info->support_item[4] = CAM_EV_ZERO;
	p_info->support_item[5] = CAM_EV_POS_1_3;
	p_info->support_item[6] = CAM_EV_POS_2_3;
	p_info->support_item[7] = CAM_EV_POS_3_3;
	p_info->support_item[8] = CAM_EV_POS_4_3;
	p_info->support_item[9] = CAM_EV_NIGHT_SHOT;		
}

void GC0308_get_banding_ability(cam_fun_info *p_info){
	p_info->is_support = KAL_TRUE;
	p_info->item_count = 2;
	p_info->support_item[0] = CAM_BANDING_50HZ;
	p_info->support_item[1] = CAM_BANDING_60HZ;		
}

void GC0308_get_zoom_ability(cam_zoom_info *p_info){ //different structure
	p_info->is_support = KAL_TRUE;
#if (defined(MT6253D) || defined(MT6253DV))
	p_info->zoom_steps = 20;
	p_info->max_zoom_factor = 20;
#else
	p_info->zoom_steps = 40;
	p_info->max_zoom_factor = 40;
#endif

}

void GC0308_get_video_scene_ability(cam_fun_info *p_info){
	p_info->is_support = KAL_TRUE;
	p_info->item_count = 2;
	p_info->support_item[0] = CAM_AUTO_DSC;
	p_info->support_item[1] = CAM_NIGHTSCENE;	
}

void GC0308_get_video_codec_ability(cam_fun_info *p_info){
	p_info->is_support = KAL_TRUE;
	p_info->item_count = 1;
	p_info->support_item[0] = CAM_VIDEO_CODEDEC_MPEG;
}

void GC0308_get_video_size_ability(cam_fun_info *p_info){
	p_info->is_support = KAL_TRUE;
#if (defined(MP4_ENCODE))
	p_info->item_count = 2;
	p_info->support_item[0] = CAM_VIDEO_SIZE_QCIF;
	p_info->support_item[1] = CAM_VIDEO_SIZE_QVGA;
#else
	p_info->item_count = 1;
	p_info->support_item[0] = CAM_VIDEO_SIZE_QCIF;
#endif		
}

camera_capability_func_struct GC0308_camera_capability = {
	GC0308_get_capture_mode_ability,
	GC0308_get_camera_scene_ability,	
	GC0308_get_capture_size_ability,
	GC0308_get_flashlight_ability,
	GC0308_get_af_range_ability,
	GC0308_get_iso_ability,
	GC0308_get_binning_ability,
	GC0308_get_wb_ability,
	GC0308_get_effect_ability,
	GC0308_get_af_mode_ability,
	GC0308_get_ae_meter_ability,
	GC0308_get_sharpness_ability,
	GC0308_get_contrast_ability,
	GC0308_get_saturation_ability,
	GC0308_get_ev_ability,
	GC0308_get_banding_ability,
	GC0308_get_zoom_ability,
	GC0308_get_video_scene_ability,
	GC0308_get_video_codec_ability,
	GC0308_get_video_size_ability
};	


CAP_SIZE GC0308_camera_iso_imgsize_upperbound(CAM_SCENE_MODE iso_value)
{
	switch (iso_value)
	{
	case CAM_ISO800:
		return CAM_SIZE_VGA;
		break;
	case CAM_ISO1600:
		return CAM_SIZE_VGA;
		break;
	default:
		return CAM_SIZE_VGA;
		break;
	}
}

#endif //#if defined(ISP_SUPPORT)
#endif //#if (defined(DRV_ISP_6238_SERIES))
