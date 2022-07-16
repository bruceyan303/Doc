#define GOLFSETDATE_NAME "0:GOLFINFO.dat"	//��ʼ�趨�����ļ���

#define KEY_NO				0
#define KEY_OK				1		//KEY OK
#define KEY_PLUS			2		//KEY +
#define KEY_MINES			3		//KEY	-
#define KEY_RETURN		4		//���ؼ�
#define DISPLAY_OFF		5		//����Ļ���ſ���


#define AXLE_TIME			50	//��6�ᴫ�������ʱ�䣨ms��
#define ANG_RANGE			0.5	//�ǶȲ�������
#define ANG_TIME			2000//�ǶȲ���ʱ�䣨ms��
#define ANG_GRSPDTIME	2000//GR�ٶ�ͣ��ʱ�䣨Ԥ��1000��/�룩
#define PUTDISP_TIME	2.0	//�Ƹ˽��ٶ�Ϊ0ʱ���ж�ʱ��,��
#define JIAOSUDU			1.0	//���ٶ�Ϊ���жϷ�Χ
#define REDEYJAODU		1.0	//׼������ʱ�ĽǶȷ�Χ
#define DISPSTOPTIME	2000//�Ƹ˾�����ʾʱ�� 2��
#define	GRSTANDSPEAD	6.66//�����׼�ٶ�
#define	GRTESTDIST		2.5	//��������ٶȵľ���
#define FEET					3.28//1��=3.28feet
#define GRINISPEAD		8.0 //feet 1��=3.28feet
#define	FLAGH					2.4	//��˸�cm c��ʼֵ
#define CAMMSTOPTIME	1000//�����������ʱ�� 2��
#define	FLAGSTAND			2.0	//������ͷУ���߱�߶�
#define	FLAGDIST			2.0	//������ͷУ���߱�߶�
#define	BRIHT0				100	//������ͷУ���߱�߶�
#define	LENSBUFLEN		1036800	//��ͷ����

//ҵ���ʼ�趨���ݽṹ
typedef struct {
	float	Grspead;				//�����ٶ�
	float	FlagH;					//���,Ĭ��:2.4M
	float	ShoulderH;			//���
	float	CalAdj;					//���㲹����Ĭ��ֵ:1.0
	float	PuterHoleAdj;		//�Ƹ˷ŵ������ϲ���ʱ��ˮƽУ��
	float	PuterHoleAdjFlg;//�Ƹ˷ŵ������ϲ���ʱ��ˮƽУ����ЧFlag
	int		Hand;						//0 ���֣�1 ����
	float	LensHoleAdj;		//��ͷˮƽУ���Ƕ�
	float	LensAng;				//��ͷ����Ƕ�
} GL_SETDAT;

//6�ᴫ��������
typedef struct {
	float x;			//�����(����)ˮƽ�Ƕ�,
	float y;			//����(����)ˮƽ�Ƕ�
	float z;			//����(����)ˮƽ�Ƕ�
}GL_AXLES;

/*����ʱ������*/
typedef struct {
	GL_AXLES 		Acc;				//6�ᴫ�������ٶ�
	GL_AXLES 		Angl;				//6�ᴫ������̬��
	GL_AXLES 		Velo;				//6�ᴫ�������ٶ�

	float				Updw;				//���������½Ƕ�
	int					UpdwFlg;		//0:��Ч, 1:��Ч
	float				LtRt;				//���������½Ƕ�
	int					LtRtFlg;		//0:��Ч, 1:��Ч
	float				Distanc;		//��������(��)
	int					Ho;					//����-1����Ч��0��=(ͬ��)��1��˳��2����
	int					HoFlag;			//0:��Ч, 1:��Ч
	int					Key;				//����
	int					Bright;			//��Ļ���ƽ������
	int					BrightFlg;	//������ȡ��������
	char				lensbuf[LENSBUFLEN];	//����ͷ����

	float	Ratio;					//�Ŵ���
}WORK;

// ȫ�����ݽṹ
typedef struct {
	GL_SETDAT		Setdat;			//��ʼ�趨����
	WORK				wk;					//����ʱ������
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


