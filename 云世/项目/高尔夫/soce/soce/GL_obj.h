#define GOLFSETDATE_NAME "0:GOLFINFO.dat"	//初始设定数据文件名

#define KEY_NO				0
#define KEY_OK				1		//KEY OK
#define KEY_PLUS			2		//KEY +
#define KEY_MINES			3		//KEY	-
#define KEY_RETURN		4		//返回键
#define DISPLAY_OFF		5		//关屏幕，磁开关


#define AXLE_TIME			50	//读6轴传感器间隔时间（ms）
#define ANG_RANGE			0.5	//角度测量精度
#define ANG_TIME			2000//角度测量时间（ms）
#define ANG_GRSPDTIME	2000//GR速度停留时间（预计1000次/秒）
#define PUTDISP_TIME	2.0	//推杆角速度为0时的判断时间,秒
#define JIAOSUDU			1.0	//角速度为零判断范围
#define REDEYJAODU		1.0	//准备击球时的角度范围
#define DISPSTOPTIME	2000//推杆距离显示时间 2秒
#define	GRSTANDSPEAD	6.66//果岭标准速度
#define	GRTESTDIST		2.5	//果岭测试速度的距离
#define FEET					3.28//1米=3.28feet
#define GRINISPEAD		8.0 //feet 1米=3.28feet
#define	FLAGH					2.4	//旗杆高cm c初始值
#define CAMMSTOPTIME	1000//相机测量安定时间 2秒
#define	FLAGSTAND			2.0	//出厂镜头校正尺标高度
#define	FLAGDIST			2.0	//出厂镜头校正尺标高度
#define	BRIHT0				100	//出厂镜头校正尺标高度
#define	LENSBUFLEN		1036800	//镜头数据

//业务初始设定数据结构
typedef struct {
	float	Grspead;				//果岭速度
	float	FlagH;					//旗高,默认:2.4M
	float	ShoulderH;			//肩高
	float	CalAdj;					//计算补正，默认值:1.0
	float	PuterHoleAdj;		//推杆放到地面上测量时的水平校正
	float	PuterHoleAdjFlg;//推杆放到地面上测量时的水平校正有效Flag
	int		Hand;						//0 右手，1 左手
	float	LensHoleAdj;		//镜头水平校正角度
	float	LensAng;				//镜头拍摄角度
} GL_SETDAT;

//6轴传感器数据
typedef struct {
	float x;			//测倾角(横向)水平角度,
	float y;			//仰角(竖向)水平角度
	float z;			//仰角(竖向)水平角度
}GL_AXLES;

/*运行时的数据*/
typedef struct {
	GL_AXLES 		Acc;				//6轴传感器加速度
	GL_AXLES 		Angl;				//6轴传感器姿态角
	GL_AXLES 		Velo;				//6轴传感器角速度

	float				Updw;				//测量上下坡角度
	int					UpdwFlg;		//0:无效, 1:有效
	float				LtRt;				//测量左右坡角度
	int					LtRtFlg;		//0:无效, 1:有效
	float				Distanc;		//测量距离(米)
	int					Ho;					//草向，-1：无效，0：=(同等)，1：顺，2：逆
	int					HoFlag;			//0:无效, 1:有效
	int					Key;				//按键
	int					Bright;			//屏幕点的平均亮度
	int					BrightFlg;	//启动读取画面亮度
	char				lensbuf[LENSBUFLEN];	//读镜头数据

	float	Ratio;					//放大倍率
}WORK;

// 全局数据结构
typedef struct {
	GL_SETDAT		Setdat;			//初始设定数据
	WORK				wk;					//运行时的数据
} GL_GV;

void GL_GetAxlesSensors(void);
int GL_RDsetdat(void);
int GL_WTsetdat(void);
float GL_Horizontal(char);
float	GL_PuterHori(void);
void	GL_HoleCameraFactryAdj(int);
float GL_MeasurementAng(void);
float GL_LensAng(void);
void	GL_Puter(float*,float*);
float	GL_CammGrspead(void);
float GL_DistanceMeasurement(void);
void GL_Ho(void);


