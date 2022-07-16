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
 *   camera_sensor_para_GC0308.h
 *
 * Project:
 * --------
 *   MAUI
 *
 * Description:
 * ------------
 *   Camera Operation Parameter for sensor driver related.
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


#ifndef _CAMERA_SENSOR_PARA_GC0308_H
	#define _CAMERA_SENSOR_PARA_GC0308_H

	#if defined(ISP_SUPPORT)

	/* STRUCT: SENSOR */
	#define GC0308_CAMERA_SENSOR_REG_DEFAULT_VALUE  \
		{   \
            {0xFFFFFFFF, 0x00}, {0xFFFFFFFF, 0x00}, {0xFFFFFFFF, 0x00}, {0xFFFFFFFF, 0x00}, \
            {0xFFFFFFFF, 0x00}, {0xFFFFFFFF, 0x00}, {0xFFFFFFFF, 0x00}, {0xFFFFFFFF, 0x00}, \
            {0xFFFFFFFF, 0x00}, {0xFFFFFFFF, 0x00}, {0xFFFFFFFF, 0x00}, {0xFFFFFFFF, 0x00}, \
            {0xFFFFFFFF, 0x00}, {0xFFFFFFFF, 0x00}, {0xFFFFFFFF, 0x00}, {0xFFFFFFFF, 0x00}, \
            {0xFFFFFFFF, 0x00}, {0xFFFFFFFF, 0x00}, {0xFFFFFFFF, 0x00}, {0xFFFFFFFF, 0x00}, \
            {0xFFFFFFFF, 0x00}, {0xFFFFFFFF, 0x00}, {0xFFFFFFFF, 0x00}, {0xFFFFFFFF, 0x00}, \
            {0xFFFFFFFF, 0x00}, {0xFFFFFFFF, 0x00}, {0xFFFFFFFF, 0x00}, {0xFFFFFFFF, 0x00}, \
            {0xFFFFFFFF, 0x00}, {0xFFFFFFFF, 0x00}, {0xFFFFFFFF, 0x00}, {0xFFFFFFFF, 0x00}, \
            {0xFFFFFFFF, 0x00}, {0xFFFFFFFF, 0x00}, {0xFFFFFFFF, 0x00}, {0xFFFFFFFF, 0x00}, \
            /*  Engineering mode    */  \
			{0xFFFFFFFF, 0x00}, {0xFFFFFFFF, 0x00}, {0xFFFFFFFF, 0x00}, {0xFFFFFFFF, ISP_DRIVING_8MA} \
		}

	#endif//#if defined(ISP_SUPPORT)		
#endif//#ifndef _CAMERA_SENSOR_PARA_GC0308_H		
