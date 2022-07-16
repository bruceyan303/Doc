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
 *   camera_yuv_para_GC0308.c
 *
 * Project:
 * --------
 *   MAUI
 *
 * Description:
 * ------------
 *   YUV sensor parameter definition
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

#include "drv_features.h"

#if (defined(DRV_ISP_6227_SERIES)||defined(DRV_ISP_6225_SERIES))

#if !defined(ISP_SUPPORT)
	// DO NOT delete this section!!!
	// When ISP_SUPPORT is not defined, NVRAM still need the dummy structure
	// and default value to initialize NVRAM_EF_CAMERA_PARA_LID.
	#include "camera_para.h"
	const nvram_camera_para_struct CAMERA_PARA_DEFAULT_VALUE={0};
#else

#if (defined(DRV_ISP_6225_SERIES)&&defined(__CAMERA_NVRAM_REDUCTION__))
nvram_camera_para_struct	camera_para;
const nvram_camera_para_struct CAMERA_PARA_DEFAULT_VALUE=
{CAMERA_NVRAM_REDUCTION_DEFAULT_VALUE};

#else


#include "drv_comm.h"
#include "stdio.h"
#include "isp_if.h"
#include "image_sensor.h"
#include "sccb.h"
#include "ae_awb.h"
#include "camera_para.h"

nvram_camera_para_struct	camera_para;
nvram_camera_gamma_struct	camera_gamma;
nvram_camera_defect_struct	camera_defect;

// _Camera_Parameter_Structure_START_
const nvram_camera_defect_struct CAMERA_DEFECT_DEFAULT_VALUE={0xFFFFFFFF};
/* STRUCT: nvram_camera_para_struct */
const nvram_camera_para_struct CAMERA_PARA_DEFAULT_VALUE=
{
	/* STRUCT: ISP */
	{
		/* ARRAY: ISP.reg[144] */
		{
			0xA3020074, 0x0FFF0FFF, 0x006302E6, 0x00310212,
			0x00000001, 0x80808080, 0x00000040, 0x0000000F,
			0x00000000, 0x00000000, 0x00000000, 0x00000000,
			0x88002104, 0x00C60080, 0x00900080, 0x03070BF8,
			0xFF000000, 0x00610940, 0x000D000A, 0x0D1A000A,
			0x1A27000A, 0x000D0A14, 0x0D1A0A14, 0x1A270A14,
			0x000D141E, 0x0D1A141E, 0x1A27141E, 0x05230519,
			0x00000001, 0x0A0A1910, 0x00000514, 0x061FC810, /*COREH=6,COREH2=1F,CORE_CON=10*/
			0x81080802, 0x08080002, 0x24108F0F, 0x101F8224, /*HA=1,HB=8,VB=8,VA=2,VC=2,HC=2,ETH3=24,E_TH1_V=10*/
			0x003F2F3C, 0x84131204, 0x1E1B0303, 0x003D9785,
			0x008A378E, 0x00859137, 0x00202020, 0x00000048,
			0x00888888, 0x008A8A8A, 0x00428030, 0x20200000,
			0x00FF91B8, 0x00018080, 0x284E6778, 0x91A8C0D7,
			0xE1EBF500, 0x00000000, 0x00000000, 0x00000000,
			0x00000000, 0x00000000, 0x00000000, 0x00000000,
			0x00000000, 0x00000000, 0x00000000, 0x00000000,
			0x00000000, 0x00000000, 0x00000000, 0x00000000,
			0x00000000, 0x00000000, 0x00000000, 0x00008000,
			0x245C5C24, 0x245C5C24, 0x12000200, 0x12800280,
			0x00325065, 0x7694AEC5, 0xDAE4EDF7, 0x32506576,
			0x94AEC5DA, 0xE4EDF700, 0x32506576, 0x94AEC5DA,
			0xE4EDF700, 0x00040000, 0x40045100, 0x00000000,
			0x32506576, 0x94AEC5DA, 0xE4EDF700, 0x00800080,
			0x00800080, 0x00000096, 0x000000C8, 0x00000000,
			0x00000000, 0x00000000, 0x00000000, 0x00000000,
			0x00000000, 0x00000000, 0x00000000, 0x00000000,
			0x00000000, 0x00000000, 0x00000000, 0xF8000000,
			0xA0A00000, 0x00000000, 0x00000000, 0x00000000,
			0x60708090, 0xA0B0C0D0, 0xE0F00000, 0x00000000,
			0x00000000, 0x00000000, 0x00000000, 0x00000000,
			0x00000000, 0x00000000, 0x00000000, 0x00000000,
			0x00000000, 0x1246731D, 0x6E645AFF, 0x02204163,
			0xAAAAD0E2, 0xFFFFFFFF, 0x204163AA, 0xAAD0E2FF,
			0xFFFFFF00, 0x204163AA, 0xAAD0E2FF, 0xFFFFFF00,
			0x00000000, 0x00000000, 0x00000000, 0x161B1015,
			0x00000000, 0x00000000, 0x00000000, 0x00000000
		}
	},

	/* STRUCT: PREDGAMMA */
	{
		/* PREDGAMMA.gamma_select */ 0x00, 		/* ARRAY: PREDGAMMA.gamma[9][11] */
		{
			/* ARRAY: PREDGAMMA.gamma[0][11] */
			{
				0x28, 0x4E, 0x67, 0x78, 0x91, 0xA8, 0xC0, 0xD7,
				0xE1, 0xEB, 0xF5
			},

			/* ARRAY: PREDGAMMA.gamma[1][11] */
			{
				0x20, 0x3C, 0x55, 0x69, 0x8D, 0xA8, 0xC0, 0xD7,
				0xE1, 0xEB, 0xF5
			},

			/* ARRAY: PREDGAMMA.gamma[2][11] */
			{
				0x14, 0x28, 0x46, 0x64, 0x91, 0xB4, 0xCE, 0xE0,
				0xE8, 0xF0, 0xF8
			},

			/* ARRAY: PREDGAMMA.gamma[3][11] */
			{
				0x49, 0x64, 0x78, 0x88, 0xA4, 0xBA, 0xCE, 0xE0,
				0xE8, 0xF0, 0xF8
			},

			/* ARRAY: PREDGAMMA.gamma[4][11] */
			{
				0x29, 0x59, 0x75, 0x88, 0xA4, 0xBA, 0xCE, 0xE0,
				0xE8, 0xF0, 0xF8
			},

			/* ARRAY: PREDGAMMA.gamma[5][11] */
			{
				0x14, 0x30, 0x50, 0x69, 0x87, 0xA5, 0xBE, 0xD7,
				0xE1, 0xEB, 0xF5
			},

			/* ARRAY: PREDGAMMA.gamma[6][11] */
			{
				0x17, 0x30, 0x53, 0x74, 0x99, 0xAB, 0xBE, 0xD7,
				0xE1, 0xEB, 0xF5
			},

			/* ARRAY: PREDGAMMA.gamma[7][11] */
			{
				0x30, 0x49, 0x5D, 0x6F, 0x8D, 0xA8, 0xC0, 0xD7,
				0xE1, 0xEB, 0xF5
			},

			/* ARRAY: PREDGAMMA.gamma[8][11] */
			{
				0x10, 0x20, 0x30, 0x40, 0x60, 0x80, 0xA0, 0xC0,
				0xD0, 0xE0, 0xF0
			}
		}
	},

	/* STRUCT: Comp */
	{
		/* STRUCT: shading_cap */
		{
				0x14846638, 0x6E645AFF, 0x02204163, 0x868DAABB,
				0xDAEEFFFF, 0x20416386, 0x8DAABBDA, 0xEEFFFF00,
				0x20416386, 0x8DAABBDA, 0xEEFFFF00
		},
		/* ARRAY: COMP.autodefect_pre_low[2] */
		{
			0xF8000000, 0x14142020
		},

		/* ARRAY: COMP.autodefect_cap_nor[2] */
		{
			0xF8000000, 0x64640000
		},

		/* ARRAY: COMP.autodefect_cap_low[2] */
		{
			0xF8000000, 0x14140000
		},
		/* STRUCT: shading_spare_1 */
		{
				0x00000000, 0x00000000, 0x00204060, 0x8090A0B0,
				0xC0D0E0F0, 0x20406080, 0x90A0B0C0, 0xD0E0F000,
				0x20406080, 0x90A0B0C0, 0xD0E0F000
		},
		/* STRUCT: shading_spare_2 */
		{
				0x00000000, 0x00000000, 0x00204060, 0x8090A0B0,
				0xC0D0E0F0, 0x20406080, 0x90A0B0C0, 0xD0E0F000,
				0x20406080, 0x90A0B0C0, 0xD0E0F000
		}
	},

	/* STRUCT: AE */
	{
		/* AE.iniShutter */ 0x0118, /* AE.TargetLum */ 0x5A, /* AE.StepperEV */ 0x02, 40
	},

	/* STRUCT: AWB */
	{
		/* ARRAY: AWB.LightSource[5][4] */
		{
			/* ARRAY: AWB.LightSource[0][4] */
			{
				0x1D4C, 0x00BC, 0x0080, 0x0080, 0x0080
			},

			/* ARRAY: AWB.LightSource[1][4] */
			{
				0x1964, 0x00BC, 0x0080, 0x0089, 0x0080
			},

			/* ARRAY: AWB.LightSource[2][4] */
			{
				0x0FA0, 0x009C, 0x0080, 0x00C0, 0x0080
			},

			/* ARRAY: AWB.LightSource[3][4] */
			{
				0x0ED8, 0x008C, 0x0080, 0x00BD, 0x0080
			},

			/* ARRAY: AWB.LightSource[4][4] */
			{
				0x0AF0, 0x0080, 0x0080, 0x00CC, 0x0080
			}
		},
		/* ARRAY: MAX AWB */
		0x009D, 0x00B2, 0x0120
	},
	/* STRUCT: SENSOR */
	{
		/* ARRAY: SENSOR.reg[34] */
		{
			 { 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 }
			,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 }
		},
		//------------------------CCT mode---------------------------------
		{
		   { 0x00, 0x00 } ,{ 0x69, 0x40 } ,{ 0x69, 0x40 }
		}
		//------------------------CCT mode---------------------------------
	},
	{
   	    {64, 64, 64},/* ISO gain */
	    {100, 100, 100}/* ISO value */
	}
};

const nvram_camera_gamma_struct CAMERA_GAMMA_DEFAULT_VALUE=	{
			0x00000000, 0x01010101, 0x02020202, 0x03030303, 		// CAM+1000~100C,(27)0,0~15
			0x04040404, 0x05050505, 0x06060606, 0x07070707, 		// CAM+1010~101C,(27)4,16~31
			0x08080808, 0x09090909, 0x0A0A0A0A, 0x0B0B0B0B,  		// CAM+1020~102C,(27)8,32~47
			0x0C0C0C0C, 0x0D0D0D0D, 0x0E0E0E0E, 0x0F0F0F0F, 		// CAM+1030~103C,(27)12,48~63
			0x10101010, 0x11111111, 0x12121212, 0x13131313, 		// CAM+1040~104C,(27)16,64~79
			0x14141414, 0x15115151, 0x16161616, 0x17171717, 		// CAM+1050~105C,(27)20,80~95
			0x18181818, 0x19191919, 0x1A1A1A1A, 0x1B1B1B1B, 		// CAM+1060~106C,(27)24,96~111
			0x1C1C1C1C, 0x1D1D1D1D, 0x1E1E1E1E, 0x1F1F1F1F, 		// CAM+1070~107C,(27)28,112~127
			0x20202020, 0x21212121, 0x22222222, 0x23232323, 		// CAM+1080~108C,(27)32,128~143
			0x24242424, 0x25252525, 0x26262626, 0x27272727, 		// CAM+1090~109C,(27)36,144~159
			0x28282828, 0x29292929, 0x2A2A2A2A, 0x2B2B2B2B, 		// CAM+10A0~10AC,(27)40,160~175
			0x2C2C2C2C, 0x2D2D2D2D, 0x2E2E2E2E, 0x2F2F2F2F, 		// CAM+10B0~10BC,(27)44,176~191
			0x30303030, 0x31313131, 0x32323232, 0x33333333, 		// CAM+10C0~10CC,(27)48,192~207
			0x34343434, 0x35353535, 0x36363636, 0x37373737, 		// CAM+10D0~10DC,(27)52,208~223
			0x38383838, 0x39393939, 0x3A3A3A3A, 0x3B3B3B3B, 		// CAM+10E0~10EC,(27)56,224~239
			0x3C3C3C3C, 0x3D3D3D3D, 0x3E3E3E3E, 0x3F3F3F3F, 		// CAM+10F0~10FC,(27)60,240~255
			0x40404040, 0x41414141, 0x42424242, 0x43434343, 		// CAM+1100~110C,(27)64,256~271
			0x44444444, 0x45454545, 0x46464646, 0x47474747, 		// CAM+1110~111C,(27)68,272~287
			0x48484848, 0x49494949, 0x4A4A4A4A, 0x4B4B4B4B, 		// CAM+1120~112C,(27)72,288~303
			0x4C4C4C4C, 0x4D4D4D4D, 0x4E4E4E4E, 0x4F4F4F4F,			// CAM+1130~113C,(27)76,304~319
			0x50505050, 0x51515151, 0x52525252, 0x53535353, 		// CAM+1140~114C,(27)80,320~335
			0x54545454, 0x55555555, 0x56565656, 0x57575757, 		// CAM+1150~115C,(27)84,336~351
			0x58585858, 0x59595959, 0x5A5A5A5A, 0x5B5B5B5B, 		// CAM+1160~116C,(27)88,352~367
			0x5C5C5C5C, 0x5D5D5D5D, 0x5E5E5E5E, 0x5F5F5F5F, 		// CAM+1170~117C,(27)92,368~383
			0x60606060, 0x61616161, 0x62626262, 0x63636363, 		// CAM+1180~118C,(27)96,384~399
			0x64646464, 0x65656565, 0x66666666, 0x67676767, 		// CAM+1190~119C,(27)100,400~415
			0x68686868, 0x69696969, 0x6A6A6A6A, 0x6B6B6B6B, 		// CAM+11A0~11AC,(27)104,416~431
			0x6C6C6C6C, 0x6D6D6D6D, 0x6E6E6E6E, 0x6F6F6F6F, 		// CAM+11B0~11BC,(27)108,432~447
			0x70707070, 0x71717171, 0x72727272, 0x73737373, 		// CAM+11C0~11CC,(27)112,448~463
			0x74747474, 0x75757575, 0x76767676, 0x77777777, 		// CAM+11D0~11DC,(27)116,464~479
			0x78787878, 0x79797979, 0x7A7A7A7A, 0x7B7B7B7B, 		// CAM+11E0~11EC,(27)120,480~495
			0x7C7C7C7C, 0x7D7D7D7D, 0x7E7E7E7E, 0x7F7F7F7F, 		// CAM+11F0~11FC,(27)124,496~511
			0x80808080, 0x81818181, 0x82828282, 0x83838383, 		// CAM+1200~120C,(27)128,512~527
			0x84848484, 0x85858585, 0x86868686, 0x87878787, 		// CAM+1210~121C,(27)132,528~543
			0x88888888, 0x89898989, 0x8A8A8A8A, 0x8B8B8B8B, 		// CAM+1220~122C,(27)136,544~559
			0x8C8C8C8C, 0x8D8D8D8D, 0x8E8E8E8E, 0x8F8F8F8F, 		// CAM+1230~123C,(27)140,560~575
			0x90909090, 0x91919191, 0x92929292, 0x93939393, 		// CAM+1240~124C,(27)144,576~591
			0x94949494, 0x95959595, 0x96969696, 0x97979797, 		// CAM+1250~125C,(27)148,592~607
			0x98989898, 0x99999999, 0x9A9A9A9A, 0x9B9B9B9B,  		// CAM+1260~126C,(27)152,608~623
			0x9C9C9C9C, 0x9D9D9D9D, 0x9E9E9E9E, 0x9F9F9F9F, 		// CAM+1270~127C,(27)156,624~639
			0xA0A0A0A0, 0xA1A1A1A1, 0xA2A2A2A2, 0xA3A3A3A3, 		// CAM+1280~128C,(27)160,640~655
			0xA4A4A4A4, 0xA5A5A5A5, 0xA6A6A6A6, 0xA7A7A7A7, 		// CAM+1290~129C,(27)164,656~671
			0xA8A8A8A8, 0xA9A9A9A9, 0xAAAAAAAA, 0xABABABAB, 		// CAM+12A0~12AC,(27)168,672~687
			0xACACACAC, 0xADADADAD, 0xAEAEAEAE, 0xAFAFAFAF, 		// CAM+12B0~12BC,(27)172,688~703
			0xB0B0B0B0, 0xB1B1B1B1, 0xB2B2B2B2, 0xB3B3B3B3, 		// CAM+12C0~12CC,(27)176,704~719
			0xB4B4B4B4, 0xB5B5B5B5, 0xB6B6B6B6, 0xB7B7B7B7, 		// CAM+12D0~12DC,(27)180,720~735
			0xB8B8B8B8, 0xB9B9B9B9, 0xBABABABA, 0xBBBBBBBB, 		// CAM+12E0~12EC,(27)184,736~751
			0xBCBCBCBC, 0xBDBDBDBD, 0xBEBEBEBE, 0xBFBFBFBF, 		// CAM+12F0~12FC,(27)188,752~767
			0xC0C0C0C0, 0xC1C1C1C1, 0xC2C2C2C2, 0xC3C3C3C3, 		// CAM+1300~130C,(27)192,768~783
			0xC4C4C4C4, 0xC5C5C5C5, 0xC6C6C6C6, 0xC7C7C7C7, 		// CAM+1310~131C,(27)196,784~799
			0xC8C8C8C8, 0xC9C9C9C9, 0xCACACACA, 0xCBCBCBCB, 		// CAM+1320~132C,(27)200,800~815
			0xCCCCCCCC, 0xCDCDCDCD, 0xCECECECE, 0xCFCFCFCF,			// CAM+1330~133C,(27)204,816~831
			0xD0D0D0D0, 0xD1D1D1D1, 0xD2D2D2D2, 0xD3D3D3D3, 		// CAM+1340~134C,(27)208,832~847
			0xD4D4D4D4, 0xD5D5D5D5, 0xD6D6D6D6, 0xD7D7D7D7, 		// CAM+1350~135C,(27)212,848~863
			0xD8D8D8D8, 0xD9D9D9D9, 0xDADADADA, 0xDBDBDBDB, 		// CAM+1360~136C,(27)216,864~879
			0xDCDCDCDC, 0xDDDDDDDD, 0xDEDEDEDE, 0xDFDFDFDF, 		// CAM+1370~137C,(27)220,880~895
			0xE0E0E0E0, 0xE1E1E1E1, 0xE2E2E2E2, 0xE3E3E3E3, 		// CAM+1380~138C,(27)224,896~911
			0xE4E4E4E4, 0xE5E5E5E5, 0xE6E6E6E6, 0xE7E7E7E7, 		// CAM+1390~139C,(27)228,912~927
			0xE8E8E8E8, 0xE9E9E9E9, 0xEAEAEAEA, 0xEBEBEBEB, 		// CAM+13A0~13AC,(27)232,928~943
			0xECECECEC, 0xEDEDEDED, 0xEEEEEEEE, 0xEFEFEFEF, 		// CAM+13B0~13BC,(27)236,944~959
			0xF0F0F0F0, 0xF1F1F1F1, 0xF2F2F2F2, 0xF3F3F3F3, 		// CAM+13C0~13CC,(27)240,960~975
			0xF4F4F4F4, 0xF5F5F5F5, 0xF6F6F6F6, 0xF7F7F7F7, 		// CAM+13D0~13DC,(27)244,976~991
			0xF8F8F8F8, 0xF9F9F9F9, 0xFAFAFAFA, 0xFBFBFBFB, 		// CAM+13E0~13EC,(27)248,992~1007
			0xFCFCFCFC, 0xFDFDFDFD, 0xFEFEFEFE, 0xFFFFFFFF};       // CAM+13F0~13FC,(27)252,1008~1023
// _Camera_Parameter_Structure_END_
#endif  /*(defined(DRV_ISP_6225_SERIES)&&defined(__CAMERA_NVRAM_REDUCTION__))*/

void init_camera_operation_para(camera_operation_para_struct *oper_data)
{
   oper_data->capture_delay_frame = 3;			/* Switch Preview to Capture */
   oper_data->preview_delay_frame = 3;			/* Wait Preview Stable */
}

void set_camera_mode_para(kal_uint8 mode)
{
}

/********************************************
   reduce_color_matrix
   reduce color matrix for reduece noise
   input :  sat_factor
            saturation factor
            uint: 0x20
                  0x20 mean keep saturation the same with ISP table
                  0x00 mean reduce saturation to bypass

*********************************************/

void reduce_color_matrix(kal_uint32 sat_factor)
{
}

void set_anti_low_light_para(kal_uint8 aeidx)
{
}

#endif  /*(ISP_SUPPORT)*/

#elif (defined(DRV_ISP_6229_SERIES))

#if !defined(ISP_SUPPORT)
	// DO NOT delete this section!!!
	// When ISP_SUPPORT is not defined, NVRAM still need the dummy structure
	// and default value to initialize NVRAM_EF_CAMERA_PARA_LID.
	#include "camera_para.h"
	const nvram_camera_para_struct CAMERA_PARA_DEFAULT_VALUE={0};
#else
#include "drv_comm.h"
#include "stdio.h"
#include "isp_if.h"
#include "image_sensor.h"
#include "sccb.h"
#include "ae_awb.h"
#include "af.h"
#include "camera_para.h"
#include "med_api.h"

nvram_camera_para_struct	camera_para;
nvram_camera_gamma_struct	camera_gamma;
nvram_camera_defect_struct	camera_defect;

// _Camera_Parameter_Structure_START_
const nvram_camera_defect_struct CAMERA_DEFECT_DEFAULT_VALUE={0xFFFFFFFF};
/* STRUCT: nvram_camera_para_struct */
const nvram_camera_para_struct CAMERA_PARA_DEFAULT_VALUE=
{
	/* STRUCT: ISP */
	{
		/* ARRAY: ISP.reg[144+8] */
		{
            0xA3020074, 0x0FFF0FFF, 0x006302E6, 0x00310212,         // CAM+000h~00Ch ,0
			0x00000001, 0xA8A8A8A8, 0x00000040, 0x0000000F,         // CAM+010h~01Ch ,4
			0x00000000, 0x00000000, 0x00000000, 0x00000000,         // CAM+020h~02Ch ,8
			0x88A00100, 0x00C4008B, 0x0080008B, 0x03070BF8,         // CAM+030h~03Ch ,12
			0xFF000000, 0x00618940, 0x0010000C, 0x1020000C,         // CAM+040h~04Ch ,16
			0x2030000C, 0x00100C18, 0x10200C18, 0x20300C18,         // CAM+050h~05Ch ,20
			0x00101824, 0x10201824, 0x20301824, 0x082C0721,         // CAM+060h~06Ch ,24
			0x00000001, 0x0A0A1910, 0x00000514, 0x021FC805,         // CAM+070h~07Ch ,28
			0x00000002, 0x000A000A, 0x24FF8F0F, 0x021F8224,         // CAM+080h~08Ch ,32
			0x003F2F3C, 0x841E1B04, 0x33280605, 0x003B9388,
			0x0089358C, 0x00829436, 0x00202020, 0x00000040,
			0x00828282, 0x00858585, 0x00408090, 0x20200000,
			0x00FF91B8, 0x00018080, 0x29597588, 0xA4BACEE0,
			0xE8F0F800, 0x00000000, 0x00000000, 0x00000000,         // CAM+0D0h~0DCh ,52
			0x00000000, 0x00000000, 0x00000000, 0x00000000,         // CAM+0E0h~0ECh ,56
			0x00000000, 0x00000000, 0x00000000, 0x00000000,         // CAM+0F0h~0FCh ,60
			0x00000000, 0x00000000, 0x00000000, 0x00000000,         // CAM+100h~10Ch ,64
			0x00000000, 0x00000000, 0x00000000, 0x00000000,         // CAM+110h~11Ch ,68
			0x245C5C24, 0x245C5C24, 0x125801B8, 0x13200160,		    // CAM+120h~12Ch ,72
			0x00325065, 0x7694AEC5, 0xDAE4EDF7, 0x32506576, 		// CAM+130h~13Ch ,76
			0x94AEC5DA, 0xE4EDF700, 0x32506576, 0x94AEC5DA, 		// CAM+140h~14Ch ,80
			0xE4EDF700, 0x00000000, 0x00000000, 0x00000000, 		// CAM+150h~15Ch ,84
			0x32506576, 0x94AEC5DA, 0xE4EDF700, 0x00800080,         // CAM+160h~16Ch ,88
			0x00800080, 0x0000004B, 0x00000064, 0x00000000,         // CAM+170h~17Ch ,92
			0x00000000, 0x00000000, 0x00000000, 0x00000000,         // CAM+180h~18Ch ,96
			0x00000000, 0x00000000, 0x00000000, 0x00000000,         // CAM+190h~19Ch ,100
			0x00000000, 0x00000000, 0x11111111, 0x11111111, 		// CAM+1A0h~24Ch ,104
			0x11111111, 0x11111111, 0x11111111, 0x11111111, 		// CAM+1B0h~1BCh ,108
			0x11111111, 0x11111110, 0x00000000, 0xF8000000, 		// CAM+1C0h~1CCh ,112
			0xA0A00000, 0x00000000, 0x00000000, 0x00000000,         // CAM+1D0h~1DCh ,116
			0x60708090, 0xA0B0C0D0, 0xE0F00000, 0x00000000, 		// CAM+1E0h~1ECh ,104,(27)112,(29)120
			0x00000000, 0x00000000, 0x00000000, 0x00000000,         // CAM+1F0h~1FCh ,108,(27)116,(29)124
			0x00000000, 0x00000000, 0x00000000, 0x00000000,         // CAM+200h~20Ch ,112,(27)120,(29)128
			0x00000000, 0x124272F5, 0xB48C7800, 0x03204163,
			0x869AA9B7, 0xC6D4E3F1, 0x204163CD, 0xCDD4DBE3,
			0xEAF1F800, 0x204163D6, 0xD6DCE2E8, 0xEDF3F900, 		// CAM+230h~23Ch ,124,(27)132,(29)140
			0x00000000, 0x00000000, 0x00000000, 0x00000000, 		// CAM+240h~24Ch ,128,(27)136,(29)144
			0x00000000, 0x00000000, 0x00000000, 0x00000000   		// CAM+250h~25Ch ,(29)146


		}
	},

	/* STRUCT: PREDGAMMA */
	{
		/* PREDGAMMA.gamma_select */ 0x00, 		/* ARRAY: PREDGAMMA.gamma[9][11] */
		{
			/* ARRAY: PREDGAMMA.gamma[0][11] */
			{
				0x28, 0x4E, 0x67, 0x78, 0x91, 0xA8, 0xC0, 0xD7,
				0xE1, 0xEB, 0xF5
			},

			/* ARRAY: PREDGAMMA.gamma[1][11] */
			{
				0x20, 0x3C, 0x55, 0x69, 0x8D, 0xA8, 0xC0, 0xD7,
				0xE1, 0xEB, 0xF5
			},

			/* ARRAY: PREDGAMMA.gamma[2][11] */
			{
				0x14, 0x28, 0x46, 0x64, 0x91, 0xB4, 0xCE, 0xE0,
				0xE8, 0xF0, 0xF8
			},

			/* ARRAY: PREDGAMMA.gamma[3][11] */
			{
				0x49, 0x64, 0x78, 0x88, 0xA4, 0xBA, 0xCE, 0xE0,
				0xE8, 0xF0, 0xF8
			},

			/* ARRAY: PREDGAMMA.gamma[4][11] */
			{
				0x29, 0x59, 0x75, 0x88, 0xA4, 0xBA, 0xCE, 0xE0,
				0xE8, 0xF0, 0xF8
			},

			/* ARRAY: PREDGAMMA.gamma[5][11] */
			{
				0x14, 0x30, 0x50, 0x69, 0x87, 0xA5, 0xBE, 0xD7,
				0xE1, 0xEB, 0xF5
			},

			/* ARRAY: PREDGAMMA.gamma[6][11] */
			{
				0x17, 0x30, 0x53, 0x74, 0x99, 0xAB, 0xBE, 0xD7,
				0xE1, 0xEB, 0xF5
			},

			/* ARRAY: PREDGAMMA.gamma[7][11] */
			{
				0x30, 0x49, 0x5D, 0x6F, 0x8D, 0xA8, 0xC0, 0xD7,
				0xE1, 0xEB, 0xF5
			},

			/* ARRAY: PREDGAMMA.gamma[8][11] */
			{
				0x10, 0x20, 0x30, 0x40, 0x60, 0x80, 0xA0, 0xC0,
				0xD0, 0xE0, 0xF0
			}
		}
	},

	/* STRUCT: COMP */
	{
		/* ARRAY: COMP.shading_cap[11] */
		{
			0x148465E9, 0xB48C7800, 0x03204163, 0x8696A5B4,
			0xC4D3E2F1, 0x204189FF, 0xFFFFFFFF, 0xFFFFFF00,
			0x204163FF, 0xFFFFFFFF, 0xFFFFFF00
		},

		/* ARRAY: COMP.autodefect_pre_low[2] */
		{
			0xF8000000, 0x14140000
		},

		/* ARRAY: COMP.autodefect_cap_nor[2] */
		{
			0xF8000000, 0xA0A00000
		},

		/* ARRAY: COMP.autodefect_cap_low[2] */
		{
			0xF8000000, 0x14140000
		},

		/* ARRAY: COMP.shading_spare_1[11] */
		{
				0x00000000, 0x00000000, 0x00204060, 0x8090A0B0,
				0xC0D0E0F0, 0x20406080, 0x90A0B0C0, 0xD0E0F000,
				0x20406080, 0x90A0B0C0, 0xD0E0F000
		},

		/* ARRAY: COMP.shading_spare_2[11] */
		{
				0x00000000, 0x00000000, 0x00204060, 0x8090A0B0,
				0xC0D0E0F0, 0x20406080, 0x90A0B0C0, 0xD0E0F000,
				0x20406080, 0x90A0B0C0, 0xD0E0F000
		}
	},
	/* STRUCT: AE */
	{
		/* AE.iniShutter */ 0x0118, /* AE.TargetLum */ 0x50, /* AE.StepperEV */ 0x02, /* AE.iniExpoIdx */ 0x28
	},

	/* STRUCT: AWB */
	{
		/* ARRAY: AWB.LightSource[5][5] */
		{
			/* ARRAY: AWB.LightSource[0][5] */
			{
				0x1D4C, 0x00B9, 0x0080, 0x0080, 0x0080
			},

			/* ARRAY: AWB.LightSource[1][5] */
			{
				0x1964, 0x00B8, 0x0080, 0x0085, 0x0080
			},

			/* ARRAY: AWB.LightSource[2][5] */
			{
				0x0FA0, 0x009A, 0x0080, 0x00CB, 0x0080
			},

			/* ARRAY: AWB.LightSource[3][5] */
			{
				0x0ED8, 0x0087, 0x0080, 0x00C2, 0x0080
			},

			/* ARRAY: AWB.LightSource[4][5] */
			{
				0x0AF0, 0x0080, 0x0092, 0x00FD, 0x0092
			},

			/* ARRAY: AWB.LightSource[5][5] */
			{
				0x1130, 0x0080, 0x0080, 0x0080, 0x0080
		   }
		},

/* AWB.AWB_rgain_max */ 0x00B5, /* AWB.AWB_ggain_max */ 0x009C, /* AWB.AWB_bgain_max */ 0x00A5
	},
	/* STRUCT: SENSOR */
	{
		/* ARRAY: SENSOR.reg[34] */
		{
			 { 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 }
			,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 }
			,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 }
			,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 }
			,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 }
			,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 }
			,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 }
			,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 }
			,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 }
			,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 }         // 32~35
			,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 }
			,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 }
			,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 }
			,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 }
			,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 }
			,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 }
			,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 }
			,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 }                                               // 68~69
			//------------------------Engineer mode---------------------------------
			,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 }, { 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 }
			,{ 0xFFFFFFFF, ISP_DRIVING_8MA }
			//------------------------Engineer mode---------------------------------
		},
		//------------------------CCT mode---------------------------------
		{
		   { 0x00, 0x00 } ,{ 0x69, 0x40 } ,{ 0x69, 0x40 }
		}
		//------------------------CCT mode---------------------------------
	},
	{
   	    {64, 64, 64},/* ISO gain */
	    {100, 100, 100}/* ISO value */
	}
};

const nvram_camera_gamma_struct CAMERA_GAMMA_DEFAULT_VALUE=	{
			0x00000000, 0x01010101, 0x02020202, 0x03030303, 		// CAM+1000~100C,(27)0,0~15
			0x04040404, 0x05050505, 0x06060606, 0x07070707, 		// CAM+1010~101C,(27)4,16~31
			0x08080808, 0x09090909, 0x0A0A0A0A, 0x0B0B0B0B,  		// CAM+1020~102C,(27)8,32~47
			0x0C0C0C0C, 0x0D0D0D0D, 0x0E0E0E0E, 0x0F0F0F0F, 		// CAM+1030~103C,(27)12,48~63
			0x10101010, 0x11111111, 0x12121212, 0x13131313, 		// CAM+1040~104C,(27)16,64~79
			0x14141414, 0x15151515, 0x16161616, 0x17171717, 		// CAM+1050~105C,(27)20,80~95
			0x18181818, 0x19191919, 0x1A1A1A1A, 0x1B1B1B1B, 		// CAM+1060~106C,(27)24,96~111
			0x1C1C1C1C, 0x1D1D1D1D, 0x1E1E1E1E, 0x1F1F1F1F, 		// CAM+1070~107C,(27)28,112~127
			0x20202020, 0x21212121, 0x22222222, 0x23232323, 		// CAM+1080~108C,(27)32,128~143
			0x24242424, 0x25252525, 0x26262626, 0x27272727, 		// CAM+1090~109C,(27)36,144~159
			0x28282828, 0x29292929, 0x2A2A2A2A, 0x2B2B2B2B, 		// CAM+10A0~10AC,(27)40,160~175
			0x2C2C2C2C, 0x2D2D2D2D, 0x2E2E2E2E, 0x2F2F2F2F, 		// CAM+10B0~10BC,(27)44,176~191
			0x30303030, 0x31313131, 0x32323232, 0x33333333, 		// CAM+10C0~10CC,(27)48,192~207
			0x34343434, 0x35353535, 0x36363636, 0x37373737, 		// CAM+10D0~10DC,(27)52,208~223
			0x38383838, 0x39393939, 0x3A3A3A3A, 0x3B3B3B3B, 		// CAM+10E0~10EC,(27)56,224~239
			0x3C3C3C3C, 0x3D3D3D3D, 0x3E3E3E3E, 0x3F3F3F3F, 		// CAM+10F0~10FC,(27)60,240~255
			0x40404040, 0x41414141, 0x42424242, 0x43434343, 		// CAM+1100~110C,(27)64,256~271
			0x44444444, 0x45454545, 0x46464646, 0x47474747, 		// CAM+1110~111C,(27)68,272~287
			0x48484848, 0x49494949, 0x4A4A4A4A, 0x4B4B4B4B, 		// CAM+1120~112C,(27)72,288~303
			0x4C4C4C4C, 0x4D4D4D4D, 0x4E4E4E4E, 0x4F4F4F4F,		// CAM+1130~113C,(27)76,304~319
			0x50505050, 0x51515151, 0x52525252, 0x53535353, 		// CAM+1140~114C,(27)80,320~335
			0x54545454, 0x55555555, 0x56565656, 0x57575757, 		// CAM+1150~115C,(27)84,336~351
			0x58585858, 0x59595959, 0x5A5A5A5A, 0x5B5B5B5B, 		// CAM+1160~116C,(27)88,352~367
			0x5C5C5C5C, 0x5D5D5D5D, 0x5E5E5E5E, 0x5F5F5F5F, 		// CAM+1170~117C,(27)92,368~383
			0x60606060, 0x61616161, 0x62626262, 0x63636363, 		// CAM+1180~118C,(27)96,384~399
			0x64646464, 0x65656565, 0x66666666, 0x67676767, 		// CAM+1190~119C,(27)100,400~415
			0x68686868, 0x69696969, 0x6A6A6A6A, 0x6B6B6B6B, 		// CAM+11A0~11AC,(27)104,416~431
			0x6C6C6C6C, 0x6D6D6D6D, 0x6E6E6E6E, 0x6F6F6F6F, 		// CAM+11B0~11BC,(27)108,432~447
			0x70707070, 0x71717171, 0x72727272, 0x73737373, 		// CAM+11C0~11CC,(27)112,448~463
			0x74747474, 0x75757575, 0x76767676, 0x77777777, 		// CAM+11D0~11DC,(27)116,464~479
			0x78787878, 0x79797979, 0x7A7A7A7A, 0x7B7B7B7B, 		// CAM+11E0~11EC,(27)120,480~495
			0x7C7C7C7C, 0x7D7D7D7D, 0x7E7E7E7E, 0x7F7F7F7F, 		// CAM+11F0~11FC,(27)124,496~511
			0x80808080, 0x81818181, 0x82828282, 0x83838383, 		// CAM+1200~120C,(27)128,512~527
			0x84848484, 0x85858585, 0x86868686, 0x87878787, 		// CAM+1210~121C,(27)132,528~543
			0x88888888, 0x89898989, 0x8A8A8A8A, 0x8B8B8B8B, 		// CAM+1220~122C,(27)136,544~559
			0x8C8C8C8C, 0x8D8D8D8D, 0x8E8E8E8E, 0x8F8F8F8F, 		// CAM+1230~123C,(27)140,560~575
			0x90909090, 0x91919191, 0x92929292, 0x93939393, 		// CAM+1240~124C,(27)144,576~591
			0x94949494, 0x95959595, 0x96969696, 0x97979797, 		// CAM+1250~125C,(27)148,592~607
			0x98989898, 0x99999999, 0x9A9A9A9A, 0x9B9B9B9B,  		// CAM+1260~126C,(27)152,608~623
			0x9C9C9C9C, 0x9D9D9D9D, 0x9E9E9E9E, 0x9F9F9F9F, 		// CAM+1270~127C,(27)156,624~639
			0xA0A0A0A0, 0xA1A1A1A1, 0xA2A2A2A2, 0xA3A3A3A3, 		// CAM+1280~128C,(27)160,640~655
			0xA4A4A4A4, 0xA5A5A5A5, 0xA6A6A6A6, 0xA7A7A7A7, 		// CAM+1290~129C,(27)164,656~671
			0xA8A8A8A8, 0xA9A9A9A9, 0xAAAAAAAA, 0xABABABAB, 		// CAM+12A0~12AC,(27)168,672~687
			0xACACACAC, 0xADADADAD, 0xAEAEAEAE, 0xAFAFAFAF, 		// CAM+12B0~12BC,(27)172,688~703
			0xB0B0B0B0, 0xB1B1B1B1, 0xB2B2B2B2, 0xB3B3B3B3, 		// CAM+12C0~12CC,(27)176,704~719
			0xB4B4B4B4, 0xB5B5B5B5, 0xB6B6B6B6, 0xB7B7B7B7, 		// CAM+12D0~12DC,(27)180,720~735
			0xB8B8B8B8, 0xB9B9B9B9, 0xBABABABA, 0xBBBBBBBB, 		// CAM+12E0~12EC,(27)184,736~751
			0xBCBCBCBC, 0xBDBDBDBD, 0xBEBEBEBE, 0xBFBFBFBF, 		// CAM+12F0~12FC,(27)188,752~767
			0xC0C0C0C0, 0xC1C1C1C1, 0xC2C2C2C2, 0xC3C3C3C3, 		// CAM+1300~130C,(27)192,768~783
			0xC4C4C4C4, 0xC5C5C5C5, 0xC6C6C6C6, 0xC7C7C7C7, 		// CAM+1310~131C,(27)196,784~799
			0xC8C8C8C8, 0xC9C9C9C9, 0xCACACACA, 0xCBCBCBCB, 		// CAM+1320~132C,(27)200,800~815
			0xCCCCCCCC, 0xCDCDCDCD, 0xCECECECE, 0xCFCFCFCF,			// CAM+1330~133C,(27)204,816~831
			0xD0D0D0D0, 0xD1D1D1D1, 0xD2D2D2D2, 0xD3D3D3D3, 		// CAM+1340~134C,(27)208,832~847
			0xD4D4D4D4, 0xD5D5D5D5, 0xD6D6D6D6, 0xD7D7D7D7, 		// CAM+1350~135C,(27)212,848~863
			0xD8D8D8D8, 0xD9D9D9D9, 0xDADADADA, 0xDBDBDBDB, 		// CAM+1360~136C,(27)216,864~879
			0xDCDCDCDC, 0xDDDDDDDD, 0xDEDEDEDE, 0xDFDFDFDF, 		// CAM+1370~137C,(27)220,880~895
			0xE0E0E0E0, 0xE1E1E1E1, 0xE2E2E2E2, 0xE3E3E3E3, 		// CAM+1380~138C,(27)224,896~911
			0xE4E4E4E4, 0xE5E5E5E5, 0xE6E6E6E6, 0xE7E7E7E7, 		// CAM+1390~139C,(27)228,912~927
			0xE8E8E8E8, 0xE9E9E9E9, 0xEAEAEAEA, 0xEBEBEBEB, 		// CAM+13A0~13AC,(27)232,928~943
			0xECECECEC, 0xEDEDEDED, 0xEEEEEEEE, 0xEFEFEFEF, 		// CAM+13B0~13BC,(27)236,944~959
			0xF0F0F0F0, 0xF1F1F1F1, 0xF2F2F2F2, 0xF3F3F3F3, 		// CAM+13C0~13CC,(27)240,960~975
			0xF4F4F4F4, 0xF5F5F5F5, 0xF6F6F6F6, 0xF7F7F7F7, 		// CAM+13D0~13DC,(27)244,976~991
			0xF8F8F8F8, 0xF9F9F9F9, 0xFAFAFAFA, 0xFBFBFBFB, 		// CAM+13E0~13EC,(27)248,992~1007
			0xFCFCFCFC, 0xFDFDFDFD, 0xFEFEFEFE, 0xFFFFFFFF};       // CAM+13F0~13FC,(27)252,1008~1023
// _Camera_Parameter_Structure_END_

void init_camera_operation_para(camera_operation_para_struct *oper_data)
{
   oper_data->capture_delay_frame = 3;			/* Switch Preview to Capture */
   oper_data->preview_delay_frame = 3;			/* Wait Preview Stable */
}

#ifdef AF_SUPPORT
void init_af_operation_para(af_operation_para_struct *oper_data)
{
}
#endif

void set_camera_mode_para(kal_uint8 mode)
{
}

/********************************************
   reduce_color_matrix
   reduce color matrix for reduece noise
   input :  sat_factor
            saturation factor
            uint: 0x20
                  0x20 mean keep saturation the same with ISP table
                  0x00 mean reduce saturation to bypass

*********************************************/


void reduce_color_matrix(kal_uint32 sat_factor)
{
}

void set_anti_low_light_para(kal_uint8 aeidx)
{
}

#endif

#elif (defined(DRV_ISP_6228_SERIES))

#if !defined(ISP_SUPPORT)
	// DO NOT delete this section!!!
	// When ISP_SUPPORT is not defined, NVRAM still need the dummy structure
	// and default value to initialize NVRAM_EF_CAMERA_PARA_LID.
	#include "camera_para.h"
	const nvram_camera_para_struct CAMERA_PARA_DEFAULT_VALUE={0};
#else
#include "drv_comm.h"
#include "stdio.h"
#include "isp_if.h"
#include "image_sensor.h"
#include "sccb.h"
#include "ae_awb.h"
#include "af.h"
#include "camera_para.h"
#include "med_api.h"

extern kal_uint32	eShutter;

nvram_camera_para_struct	camera_para;
nvram_camera_defect_struct	camera_defect;

// _Camera Parameter Structure START_
const nvram_camera_defect_struct CAMERA_DEFECT_DEFAULT_VALUE={0xFFFFFFFF};
const nvram_camera_para_struct CAMERA_PARA_DEFAULT_VALUE=
{
	/* STRUCT: ISP */
	{
		/* ARRAY: ISP.reg[132] */
		{
			0xA3020074, 0x0FFF0FFF, 0x006302E6, 0x00310212, 		//CAM+000h,0
			0x00000001, 0xA8A8A8A8, 0x00000040, 0x0000000F,			//CAM+010h,4
			0x00000000, 0x00000000, 0x00000000, 0x00000000, 		//CAM+020h,8
			0x85A00100, 0x00F00098, 0x00800098, 0x10203040,			//CAM+030h,12
			0x80000000, 0x00410040, 0x0010000C, 0x1020000C, 		//CAM+040h,16
			0x2030000C, 0x00100C18, 0x10200C18, 0x20300C18, 		//CAM+050h,20
			0x00101824, 0x10201824, 0x20301824, 0x082C0721, 		//CAM+060h,24
			0x00000000, 0x0A041910, 0x00000514, 0x061FC810, 		//CAM+070h,28
			0x01060612, 0x00000002, 0x24800F0F, 0x101F8224,
			0x0039373F, 0x84151204, 0x301B0504, 0x00328D85,
			0x00872E87, 0x00828E30, 0x00202020, 0x00000048,
			0x00808080, 0x00000000, 0x00408030, 0x20200000, 		//CAM+0B0h,44
			0x00FF91B8, 0x00018080, 0x3C5B6B7B, 0x96ADC4D7,
			0xE1EBF500, 0x00000000, 0x00000000, 0x00000000,			//CAM+0D0h,52
			0x00000000, 0x00000000, 0x00000000, 0x00000000, 		//CAM+0E0h,56
			0x00000000, 0x00000000, 0x00000000, 0x00000000, 		//CAM+0F0h,60
			0x00000000, 0x00000000, 0x00000000, 0x00000000, 		//CAM+100h,64
			0x00000000, 0x00000000, 0x00000000, 0x00000000,			// CAM+110h~11Ch ,68

			0x245C5C24, 0x245C5C24, 0x00000000, 0x00000000,			// CAM+120h~12Ch ,72
			0x00325065, 0x7694AEC5, 0xDAE4EDF7, 0x32506576, 		// CAM+130h~13Ch ,76
			0x94AEC5DA, 0xE4EDF700, 0x32506576, 0x94AEC5DA, 		// CAM+140h~15Ch ,80
			0xE4EDF700, 0x00000000, 0x00000000, 0x00000000, 		// CAM+150h~15Ch ,84

			0x00000000, 0x00000000, 0x11111111, 0x11111111, 		// CAM+1A0h~24Ch ,88
			0x11111111, 0x11111111, 0x11111111, 0x11111111, 		// CAM+1B0h~1BC ,92
			0x11111111, 0x11111110, 0x00000000, 0x00000200, 		// CAM+1C0~1CC ,96
			0x00000000, 0x00000000, 0x00000000, 0x00000000, 		// CAM+1D0~1DC ,100
			0x60708090, 0xA0B0C0D0, 0xE0F00000, 0x00000000, 		// CAM+1E0~1EC ,104
			0x00000000, 0x00000000, 0x00000000, 0x00000000, 		// CAM+1F0~1FC ,108
			0x00000000, 0x00000000, 0x00000000, 0x00000000, 		// CAM+200~20C ,112
			0x00000000, 0x12573339, 0x8C8C8C00, 0x02204163, 		// CAM+210~21C ,116
			0x869DDDFF, 0xFFFFFFFF, 0x20416386, 0x9DDDFFFF, 		// CAM+220~22C ,120
			0xFFFFFF00, 0x20416386, 0x9DDDFFFF, 0xFFFFFF00, 		// CAM+230~23C ,124
			0x00000000, 0x00000000, 0x00000000, 0x00000000			// CAM+240~24C ,128
		}
	},
	/* STRUCT: PREDGAMMA */
	{
		/* PREDGAMMA.gamma_select */ 0x00, 		/* ARRAY: PREDGAMMA.gamma[9][11] */
		{
			/* ARRAY: PREDGAMMA.gamma[0][11] */
			{
				0x28, 0x4E, 0x67, 0x78, 0x91, 0xA8, 0xC0, 0xD7,
				0xE1, 0xEB, 0xF5
			},

			/* ARRAY: PREDGAMMA.gamma[1][11] */
			{
				0x20, 0x3C, 0x55, 0x69, 0x8D, 0xA8, 0xC0, 0xD7,
				0xE1, 0xEB, 0xF5
			},

			/* ARRAY: PREDGAMMA.gamma[2][11] */
			{
				0x14, 0x28, 0x46, 0x64, 0x91, 0xB4, 0xCE, 0xE0,
				0xE8, 0xF0, 0xF8
			},

			/* ARRAY: PREDGAMMA.gamma[3][11] */
			{
				0x49, 0x64, 0x78, 0x88, 0xA4, 0xBA, 0xCE, 0xE0,
				0xE8, 0xF0, 0xF8
			},

			/* ARRAY: PREDGAMMA.gamma[4][11] */
			{
				0x29, 0x59, 0x75, 0x88, 0xA4, 0xBA, 0xCE, 0xE0,
				0xE8, 0xF0, 0xF8
			},

			/* ARRAY: PREDGAMMA.gamma[5][11] */
			{
				0x14, 0x30, 0x50, 0x69, 0x87, 0xA5, 0xBE, 0xD7,
				0xE1, 0xEB, 0xF5
			},

			/* ARRAY: PREDGAMMA.gamma[6][11] */
			{
				0x17, 0x30, 0x53, 0x74, 0x99, 0xAB, 0xBE, 0xD7,
				0xE1, 0xEB, 0xF5
			},

			/* ARRAY: PREDGAMMA.gamma[7][11] */
			{
				0x30, 0x49, 0x5D, 0x6F, 0x8D, 0xA8, 0xC0, 0xD7,
				0xE1, 0xEB, 0xF5
			},

			/* ARRAY: PREDGAMMA.gamma[8][11] */
			{
				0x10, 0x20, 0x30, 0x40, 0x60, 0x80, 0xA0, 0xC0,
				0xD0, 0xE0, 0xF0
			}
		}
	},

	/* STRUCT: Comp */
	{
		/* STRUCT: shading_cap */
		{
			0x14AF2671, 0x8C8C8C00, 0x02204163, 0x869AA3E3,
			0xFFFFFFFF, 0x20416386, 0x9AA3E3FF, 0xFFFFFF00,
			0x20416386, 0x9AA3E3FF, 0xFFFFFF00
		},
		/* STRUCT: autodefect_pre_low */
		{
				0x00000000, 0x00002020
		},
		/* STRUCT: autodefect_cap_nor */
		{
				0x00000000, 0x00002020
		},
		/* STRUCT: autodefect_cap_low */
		{
				0x00000000, 0x00002020
		},
		/* STRUCT: shading_spare_1 */
		{
				0x00000000, 0x00000000, 0x00204060, 0x8090A0B0,
				0xC0D0E0F0, 0x20406080, 0x90A0B0C0, 0xD0E0F000,
				0x20406080, 0x90A0B0C0, 0xD0E0F000
		},
		/* STRUCT: shading_spare_2 */
		{
				0x00000000, 0x00000000, 0x00204060, 0x8090A0B0,
				0xC0D0E0F0, 0x20406080, 0x90A0B0C0, 0xD0E0F000,
				0x20406080, 0x90A0B0C0, 0xD0E0F000
		}
	},

	/* STRUCT: AE */
	{
		/* AE.iniShutter */ 0x0118, /* AE.TargetLum */ 0x5A, /* AE.StepperEV */ 0x02, /* AE.iniExpoIdx */ 0x28
	},

	/* STRUCT: AWB */
	{
		{
			{
				0x1D4C, 0x009D, 0x008C, 0x0080, 0x008C
			},
			{
				0x1964, 0x009D, 0x008C, 0x0080, 0x008C
			},
			{
				0x0FA0, 0x0080, 0x0085, 0x00A8, 0x0085
			},
			{
				0x0ED8, 0x0080, 0x0094, 0x00B5, 0x0094
			},
			{
				0x0ED8, 0x0080, 0x00A9, 0x00E4, 0x00A9
			},
			{
				0x1130, 0x0087, 0x0080, 0x00D0, 0x0080
			}
		},
		0x00B5, 0x009C, 0x00A5},
	/* STRUCT: SENSOR */
	{
		/* ARRAY: SENSOR.reg[34] */
		{
			 { 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 }
			,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 }
			,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 }
			,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 }
			,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 }
			,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 }
			,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 }
			,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 }
			,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 }
			,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 }         // 32~35
			,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 }
			,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 }
			,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 }
			,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 }
			,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 }
			,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 }
			,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 }
			,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 }                                               // 68~69
			//------------------------Engineer mode---------------------------------
			,{ 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 }, { 0xFFFFFFFF, 0x00 } ,{ 0xFFFFFFFF, 0x00 }
			,{ 0xFFFFFFFF, ISP_DRIVING_8MA }
			//------------------------Engineer mode---------------------------------
		},
		//------------------------CCT mode---------------------------------
		{
		   { 0x00, 0x00 } ,{ 0x69, 0x40 } ,{ 0x69, 0x40 }
		}
		//------------------------CCT mode---------------------------------
	},
	{
   	    {64, 64, 64},/* ISO gain */
	    {100, 100, 100}/* ISO value */
	}
};
// _Camera_Parameter_Structure_END_


void init_camera_operation_para(camera_operation_para_struct *oper_data)
{
   oper_data->capture_delay_frame = 3;			/* Switch Preview to Capture */
   oper_data->preview_delay_frame = 3;			/* Wait Preview Stable */
}

#ifdef AF_SUPPORT
void init_af_operation_para(af_operation_para_struct *oper_data)
{
}
#endif

void set_camera_mode_para(kal_uint8 mode)
{
}

void set_anti_low_light_para(kal_uint8 aeidx)
{
}

#endif

#elif(defined(DRV_ISP_6235_SERIES))

#include "camera_para.h"

void GC0308_init_camera_operation_para(camera_operation_para_struct *oper_data)
{
	/* Wait 3 frames for preview stable, or else black or green image may be captured. */
	oper_data->preview_delay_frame = 3;
#if (defined(__DYNAMIC_SENSOR_DELAY__))
	oper_data->capture_delay_frame = 0; 		/* Use the wait_stable_frame instead. */
#else
	oper_data->capture_delay_frame = 2; 		/* Delay frame from switch preview to capture */
#endif
	
#if (defined(__DYNAMIC_SENSOR_DELAY__))
	oper_data->preview_ae_stable_frame = 14;	/* It's for the Cont's shot & first enter preview from idle. */
#endif
}

#endif

