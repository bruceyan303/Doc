#include "sys.h"
#include "timer.h"
#include "string.h"
#include "math.h"
#include "usart.h"
#include "delay.h"

#include "GL_obj.h"
extern GL_GV GL_gv;

/*
�����Ƽ����޹�˾������ɺ���--START
*/
/************************************************
 ************************************************
����Ⱥ
 ************************************************
*************************************************/

/************************************************
  ����ʼ����
	����ֵ��sizeof(GL_setdat) �ɹ�
					NULL �ļ�������
************************************************/
int GL_RDsetdat(){
	FILE *fd;
	int	res;
	
	fd = fopen( GOLFSETDATE_NAME, "r");
	if( fd == NULL ) {
		GL_gv.Setdat.FlagH = FLAGH;
		res = GL_WTsetdat();
		return(res);
	}
	
	res = fread( &GL_gv.Setdat, sizeof(GL_gv.Setdat), 1, fd );
	fclose(fd);
	return(res);
}
/************************************************
  �����ʼ����
	����ֵ��sizeof(GL_setdat) �ɹ�
					NULL ʧ��
************************************************/
int GL_WTsetdat(){
	FILE *fd;
	int	res;
	
	fd = fopen( GOLFSETDATE_NAME, "w+");
	if( fd == NULL ) {
		return(NULL);
	}
	res = fwrite( &GL_gv.Setdat, sizeof(GL_gv.Setdat), 1, fd );
	fclose(fd);
	return(res);
}


/************************************************
��ȡ���ᴫ��������
���ٶȣ���ǣ����ٶ�
************************************************/
/*KEY CallBack */
//����
void keycallback( int evnt ){
	if( GL_gv.wk.Key != KEY_NO ) {
		return;
	}
	
	switch(evnt) {
		case 1:
			GL_gv.wk.Key = KEY_OK;			//KEY OK
			break;
		case 2:
			GL_gv.wk.Key = KEY_PLUS;		//KEY +
			break;
		case 3:
			GL_gv.wk.Key = KEY_MINES;		//KEY	-
			break;
		case 4:
			GL_gv.wk.Key = KEY_RETURN;	//���ؼ�
			break;
		case 5:
			
			//����Ļ�����ܿ���
			//��Ҫ���߼�
			//1 ����
			//2 5���Ӻ�ػ�
		break;
	}
}

/* ����ͷ��ʾ*/
void ReadLens( void ){
	/*
	��ͷ���ݳ�����GL_obj.h�ﶨ��
	#define	LENSBUFLEN		1036800	//��ͷ����
	*/
	/*
		����ͷ����
	  1. �������ſ����趨��ͷΪ240 x 240
	  2. ��Ҫ���ſ����趨��ͷΪ120 x 720
	*/
	GL_gv.wk.lensbuf;
}

/* ���� */
void  Zoom(void){
	/*
	2 ���ݷŴ��� GL_gv.wk.Ratio ת�� 240 x 240 ��LUV����
	�������Ļ. �ٶ����Ļ�������ֻ�����벿�ֽ�������(60,0),(179,239). 
	���߸�խһЩ
	*/
	GL_gv.wk.Ratio;   //�Ŵ���
}

/* ��ȡ����ֵ, ����ֵΪƽ������ֵ */
int GetBright(void){
	/*
	��ƽ������, ��ȡ�����LCD�����ݾͿ���.
	ֻҪ��ȡ��������, �Լ������ȡ�Ϳ��ԡ�(60, 60), (180,180)
	*/
}

/*
�Զ����ͼ���ж�(�߶�)
		������ y0, y1   ��ȡ����˵Ķ����͵ײ�����Ļyֵ
		����ֵ: 0 �ɹ�
						-1ʧ��
*/
int	PatternRecognition( int *y0, int *y1 ){
}

/*
void	GL_GetAxlesSensors()
{
	//��ǰ�ļ��ٶ�
	GL_gv.wk.Acc.x =  gyroAccData.faccG[0];
	GL_gv.wk.Acc.y =  gyroAccData.faccG[1];
	GL_gv.wk.Acc.Z =  gyroAccData.faccG[2];
	
	//��ǰ���ǣ�����
	GL_gv.wk.Angl.y = attitude.pitch;
	GL_gv.wk.Angl.x = attitude.roll;
	GL_gv.wk.Angl.Z = attitude.yaw;

	//��ǰ�Ľ��ٶ�
	GL_gv.wk.Velo.x = gyroAccData.fgyroD[0];
	GL_gv.wk.Velo.y = gyroAccData.fgyroD[1];
	GL_gv.wk.Velo.z = gyroAccData.fgyroD[2];
}
*/
/* ������ʼ��*/

void	GL00(){
	int res;
	
	memset(&GL_gv, 0x00, sizeof(GL_gv));
	res = GL_RDsetdat();
	if( RESET == NULL ){
		// ϵͳERROR
	}
}

/*
�����Ƽ����޹�˾������ɺ���--END
*/

/*********************************************
�趨������ѡ����ʾ�ڿؼ��ϣ�OK����ѡ�������
����: 
			int		id��ʾ�ؼ�ID
			float ��ʼֵ
			float step  -/+ step
			char*	��λ�ַ�( m, cm, f ...��
����ֵ: < 0 ȡ��
				> 0 ��ֵ
**********************************************/
float	GL_NumSelect(int id, float orgdat,float step, char	*format, char *str){

	float count, counttmp;
	char	buf[8];
	
	count = orgdat;
	
	counttmp = 0;
	while(1){
		
		/* ��ʾspead, 99.9 */
		if ( count != counttmp ) {
			if( step == 1.0) {
				sprintf(buf, format, (int)count, str);
			}
			else {
				sprintf(buf, format, count, str);
			}
			
			counttmp = count;
			
			/* �ڿؼ�id�ϣ� ��ʾbuf*/
		}
		
		if( GL_gv.wk.Key == KEY_RETURN || GL_gv.wk.Key == KEY_OK ) {
			break;
		}

		/* -/+ step */
		if( GL_gv.wk.Key == KEY_PLUS ) {
			GL_gv.wk.Key = KEY_NO;
			count -= step;
		}
		if( GL_gv.wk.Key == KEY_MINES ) {
			GL_gv.wk.Key = KEY_NO;
			count += step;
		}
	}
	if( GL_gv.wk.Key == KEY_OK ) {
		GL_gv.wk.Key = KEY_NO;
		return(count);
	}
	GL_gv.wk.Key = KEY_NO;
	return(-9999.0);
}

/************************************************
*************************************************
�趨����Ⱥ
*************************************************
*************************************************/

/***************************
GR�ٶ��趨
****************************/
void GL13( ){
	float res, dat;
	int	id;

	GL_gv.wk.Key = KEY_NO;

	if ( GL_gv.Setdat.Grspead == 0.0 ) {
		dat = GRINISPEAD;
	}
	
	while(1){
		res = GL_NumSelect(id, dat,0.1, "%2.1f%s", "f");
		if( res > 0.0 || GL_gv.wk.Key == KEY_OK ){
			GL_gv.Setdat.Grspead = res / FEET;
			dat = res;

			//�����ʼ����
			int a = GL_WTsetdat();
			break;
		}
		if( GL_gv.wk.Key == KEY_RETURN ) {
			break;
		}
	}
	GL_gv.wk.Key = KEY_NO;
}

/***************************
��˸��趨
****************************/
void GL14( ){
	float res, dat;
	int	id;
	
	GL_gv.wk.Key = KEY_NO;
	if ( GL_gv.Setdat.FlagH == 0.0 ) {
		dat = FLAGH;
	}
	
	while(1){
		res = GL_NumSelect(id, dat, 1.0, "%3d%s", "cm");
		if( res > 0.0 || GL_gv.wk.Key == KEY_OK ){
			GL_gv.Setdat.FlagH = res;
			
			//�����ʼ����
			int a = GL_WTsetdat();
			break;
		}
		if( GL_gv.wk.Key == KEY_RETURN ) {
			break;
		}
	}
	GL_gv.wk.Key = KEY_NO;
}

/***************************
����趨
****************************/
void GL15( ){
	float res, dat;
	int	id;
	
	GL_gv.wk.Key = KEY_NO;
	if ( GL_gv.Setdat.ShoulderH== 0.0 ) {
		dat = FLAGH;
	}
	
	while(1){
		res = GL_NumSelect(id, dat, 1.0, "%3d%s", "cm");
		if( res > 0.0 || GL_gv.wk.Key == KEY_OK ){
			GL_gv.Setdat.ShoulderH = res;

			//�����ʼ����
			int a = GL_WTsetdat();
			break;
		}
		if( GL_gv.wk.Key == KEY_RETURN ) {
			break;
		}
	}
	GL_gv.wk.Key = KEY_NO;
}

/***************************
��˸��趨
****************************/
void GL16( ){
	float res, dat;
	int	id;
	
	GL_gv.wk.Key = KEY_NO;
	if ( GL_gv.Setdat.FlagH == 0.0 ) {
		dat = FLAGH;
	}
	
	while(1){
		res = GL_NumSelect(id, dat, 1.0, "%3d%s", "cm");
		if( res > 0.0 || GL_gv.wk.Key == KEY_OK ){
			GL_gv.Setdat.FlagH = res;
			
			//�����ʼ����
			int a = GL_WTsetdat();
			break;
		}
		if( GL_gv.wk.Key == KEY_RETURN ) {
			break;
		}
	}
	GL_gv.wk.Key = KEY_NO;
}

/***************************
���㸨���趨
****************************/
void GL17( ){
	float res, dat;
	int	id;
	
	GL_gv.wk.Key = KEY_NO;
	if ( GL_gv.Setdat.CalAdj == 0.0 ) {
		dat = 1;
	}
	
	while(1){
		res = GL_NumSelect(id, dat, 1.0, "%3d%s", "%");
		if( res > 0.0 || GL_gv.wk.Key == KEY_OK ){
			GL_gv.Setdat.CalAdj = res;

			//�����ʼ����
			int a = GL_WTsetdat();
			break;
		}
		if( GL_gv.wk.Key == KEY_RETURN ) {
			break;
		}
	}
	GL_gv.wk.Key = KEY_NO;
}

/***************************
�趨���Ƹ�ˮƽ��У��
****************************/
void GL18(){
	float	ang;
	GL_gv.wk.Key = KEY_NO;

	while(1){
		ang = GL_PuterHori();
		
		/*�ȴ�ȷ��*/
		while(1){
			if( GL_gv.wk.Key == KEY_OK || GL_gv.wk.Key == KEY_RETURN ) {
				break;
			}
		}
		/*����������*/
		if( GL_gv.wk.Key == KEY_OK ) {
			GL_gv.Setdat.PuterHoleAdj = ang;;
			GL_gv.Setdat.PuterHoleAdjFlg = 1;
			
			//�����ʼ����
			int res = GL_WTsetdat();
			break;
		}
		GL_gv.wk.Key = KEY_NO;
	}
	GL_gv.wk.Key = KEY_NO;
}

/***************************
�������趨
****************************/
void GL19(){
	GL_gv.wk.Key = KEY_NO;
	
	//��ʾ������
	if(	GL_gv.Setdat.Hand == 0 ){
		//��ʾ����
	}
	else{
		//��ʾ����
	}

	while(1){
		if( GL_gv.wk.Key == KEY_RETURN ) {
			if(GL_gv.Setdat.Hand == 0){
				GL_gv.Setdat.Hand = 1;
				//��ʾ����
			}
			else{
				GL_gv.Setdat.Hand = 0;
			//��ʾ����
			}
		}

		/*����������*/
		if( GL_gv.wk.Key == KEY_OK ) {

			break;
		}
	}

	//�����ʼ����
	int res = GL_WTsetdat();
	GL_gv.wk.Key = KEY_NO;
}

/************************************
���ˮƽ��У׼--�����趨
*************************************/
void	GL20( ){
	char buf[12];

	
	/*������ͷ*/
	
	/* ��ʾ���� */
	
	/* ͣ3�� */
	delay_ms(3000);
	GL_gv.wk.Key = KEY_NO;
	
	/* У��ˮƽ�Ƕ� */
	GL_HoleCameraFactryAdj(0);
	GL_gv.wk.Key = KEY_NO;
	
	/* ��ʾ У��ˮƽ�Ƕ� */
	//GL_gv.Setdat.LensHoleAdj
	sprintf( buf, "%2.1f", GL_gv.Setdat.LensHoleAdj);
	
	/* У����ͷ����Ƕ� */
	GL_HoleCameraFactryAdj(1);
	GL_gv.wk.Key = KEY_NO;
	
	/* ��ʾ У����ľ�ͷ����Ƕ� */
	//GL_gv.Setdat.LensAng
	sprintf( buf, "%2.1f", GL_gv.Setdat.LensAng);

	//�����ʼ����
	int res = GL_WTsetdat();

	/*�رվ�ͷ*/
}


/************************************************
*************************************************
��������Ⱥ
*************************************************
*************************************************/
/***************************
�Ƹ˲������ҽǶ�
****************************/
void GL05( ){
	float	ang;
	GL_gv.wk.Key = KEY_NO;
	while(1){
		ang = GL_MeasurementAng();

		/*�ȴ�ȷ��*/
		while(1){
			/* �ٲ��� */
			if( GL_gv.wk.Key == KEY_RETURN ) {
				break;
			}
			
			if( GL_gv.wk.Key == KEY_PLUS	) {
				GL_gv.wk.Updw = ang;
				break;
			}
			if( GL_gv.wk.Key == KEY_MINES	) {
				GL_gv.wk.Updw = -1*ang;
				break;
			}
		}
		if( GL_gv.wk.Key == KEY_PLUS	||  GL_gv.wk.Key == KEY_MINES	) {
			break;
		}
		GL_gv.wk.Key = KEY_NO;
	}
	GL_gv.wk.Key = KEY_NO;
}

/***************************
�Ƹ˲������½Ƕ�
****************************/
void GL06( ){
	float	ang;
	GL_gv.wk.Key = KEY_NO;
	while(1){
		ang = GL_MeasurementAng();
		GL_gv.wk.Key = KEY_NO;

		/*�ȴ�ȷ��*/
		while(1){
			/* �ٲ��� */
			if( GL_gv.wk.Key == KEY_RETURN || GL_gv.wk.Key == KEY_OK	) {
				break;
			}
		}
		if( GL_gv.wk.Key == KEY_OK	) {
			break;
		}
		GL_gv.wk.Key = KEY_NO;
	}
	GL_gv.wk.LtRt = ang;
	GL_gv.wk.Key = KEY_NO;
}

/***************************
��ͷ�������ҽǶ�
****************************/
void	GL07(){
	float res, tmp;
	int	count;
	GL_gv.wk.Ratio = 1.0;
	
	/*������ͷ*/
	
	/* ��ʾ���� */
	
	tmp = -9999;
	count = 0;
	GL_gv.wk.Key = KEY_NO;
	while(1){
		res = GL_LensAng();
		if( res != tmp ){
			/* ���ݽǶ�ֵ����ʾˮƽ�� */
			tmp = res;
		}

		if( -ANG_RANGE < (res - tmp) && (res - tmp) < ANG_RANGE ){
			count ++;
		}
		if( count > CAMMSTOPTIME ){
			while(1){
				if( GL_gv.wk.Key == KEY_RETURN || GL_gv.wk.Key == KEY_OK	) {
					break;
				}
			}
		}
		if( GL_gv.wk.Key == KEY_OK ) {
				break;
		}
		count = 0;
		GL_gv.wk.Key = KEY_NO;
	}
	GL_gv.wk.LtRt = res;
	GL_gv.wk.Key = KEY_NO;

	/*�رվ�ͷ*/
}

/***************************
��ͷ�������½Ƕ�
****************************/
void	GL08(){
	float res, tmp;
	int	count;

	GL_gv.wk.Ratio = 1.0;
	
	/*������ͷ*/
	
	/* ��ʾ���� */
	
	tmp = -9999;
	count = 0;
	GL_gv.wk.Key = KEY_NO;
	while(1){
		res = GL_LensAng();
		if( res != tmp ){
			/* ���ݽǶ�ֵ����ʾˮƽ�� */
			tmp = res;
		}

		if( -ANG_RANGE < (res - tmp) && (res - tmp) < ANG_RANGE ){
			count ++;
		}
		if( count > CAMMSTOPTIME ){
			while(1){
				if( GL_gv.wk.Key == KEY_RETURN ||
						GL_gv.wk.Key == KEY_PLUS		||
						GL_gv.wk.Key == KEY_MINES ){
					break;
				}
			}
		}
		if( GL_gv.wk.Key == KEY_PLUS		||
				GL_gv.wk.Key == KEY_MINES ){
				break;
		}
		count = 0;
		GL_gv.wk.Key = KEY_NO;
	}
	if( GL_gv.wk.Key == KEY_PLUS	){
		GL_gv.wk.Updw = res;
	}
	else{
		GL_gv.wk.Updw = -1*res;
	}
	GL_gv.wk.Key = KEY_NO;

	/*�رվ�ͷ*/
}

/***************************
����������
****************************/
void GL09(){
	float dist;
	char buf[12];
	GL_gv.wk.Ratio = 2.0;
	
	/*������ͷ*/

	GL_gv.wk.Key = KEY_NO;
	dist = GL_DistanceMeasurement();
	/* ������ʾ���� */
	sprintf(buf, "%2.1f", dist);
	
	if( GL_gv.wk.Key == KEY_OK	) {
		GL_gv.wk.Distanc = dist;
	}
	GL_gv.wk.Key = KEY_NO;

	/*�رվ�ͷ*/
}

/***************************
����жϲ���
****************************/
void GL10( ){
	int bright0, bright1, ho;
	int		flg;
	
	/* ������� */
	
	flg = 0;
	ho = 0;
	GL_gv.wk.Key = KEY_NO;
	while(1){
		GL_Ho();
		if( GL_gv.wk.Key == KEY_RETURN ) {
			break;
		}

		GL_gv.wk.Key = KEY_NO;
		if( flg == 0 ){
			bright0 = GL_gv.wk.Bright;
			flg = 1;
			continue;
		}
		
		flg = 0;
		bright1 =  GL_gv.wk.Bright - bright0;
		if( bright1 < 0 ){
			//ͬ��
			if( (-1 *bright1) < BRIHT0 ) {
				ho = 0;
			}
			else {
				ho = 2;
			}
		}
		else {
			//ͬ��
			if( bright1 < BRIHT0 ) {
				ho = 0;
			}
			else {
				ho = 1;
			}
		}
	}
	
	GL_gv.wk.Key = KEY_NO;
	if( GL_gv.wk.Key == KEY_RETURN ) {
		GL_gv.wk.Key = KEY_NO;
		return;
	}

	
	//������ʾ��������Ϣ
	GL_gv.wk.HoFlag = 1;
	if( GL_gv.wk.Ho == 0 ) {
		// ����
	}
	else if(GL_gv.wk.Ho == 1){
		// ˳
	}
	else if(GL_gv.wk.Ho == 2){
		//��
	}
}


/***************************
GR�ٶȲ���
****************************/
extern float Start_Angl;
void GL11( ){
	float spead,speadtmp;
	int		cont;
	char	buf[8];

	Start_Angl = 0;
	spead = 0;
	cont = 0;
	GL_gv.wk.Key = KEY_NO;
	while(1){
		speadtmp = GL_CammGrspead( );
		if(spead < 0){
			GL_gv.wk.Key = KEY_NO;
			continue;
		}
		
		/* ��ʾ�ٶ�
			speadtmp * FEET
		*/
		
		/*�ȴ�ȷ��*/
		cont = 0;
		GL_gv.wk.Key = KEY_NO;
		while(1){
			/*�ٲ�*/
			if( GL_gv.wk.Key == KEY_RETURN ) {
				if( spead == 0 ){
					spead = speadtmp;
				}
				else {
					/*��ȡƽ������*/
					spead = (speadtmp + spead) / 2;
				}
				break;
			}
			
			/* ������� */
			if( GL_gv.wk.Key == KEY_OK ) {
				/*�������˵�*/
				GL_gv.Setdat.Grspead = spead;
				GL_gv.wk.Key = KEY_NO;
				break;
			}
			cont++;
			if ( cont > ANG_GRSPDTIME){
				break;
			}
		}

		GL_gv.wk.Key = KEY_NO;
		if( GL_gv.wk.Key == KEY_OK ) {
			/*�������˵�*/
			break;
		}
	}
}

	
/***************************
�Ƹ�ָ��
****************************/
void GL03( ){
	float dist, result;
	
	/*
		������ʾ��������Ϣ
	*/
		if(GL_gv.wk.UpdwFlg ) {
			///��ʾ
			GL_gv.wk.Updw;				//���������½Ƕ�
		}
		else {
			///����ʾ
			GL_gv.wk.Updw;
		}
		
		if(GL_gv.wk.LtRtFlg ){
			///��ʾ
			GL_gv.wk.LtRt;				//���������½Ƕ�
		}
		else {
			///����ʾ
			GL_gv.wk.LtRt;
		}
		if(GL_gv.wk.Distanc !=0 ){
			GL_gv.wk.Distanc;		//��������(��)
		}
		else{
			///����ʾ
			GL_gv.wk.Distanc;
		}
		
		if(	GL_gv.wk.HoFlag ){					//����-1����Ч��0��=(ͬ��)��1��˳��2����
			///��ʾ
			GL_gv.wk.Ho;
		}
		else {
			///����ʾ
			GL_gv.wk.Ho;
		}
		
	Start_Angl = 0;
	GL_gv.wk.Key = KEY_NO;
	while(1){
		GL_Puter( &dist, &result);

		if( GL_gv.wk.Key == KEY_OK ) {
			/*�������˵�*/
			break;
		}

		/* ��ʾ����
			dist, 99.9
		*/
		/* ��ʾ�ж��Ƹ�Ч��
			result, 9.99
		*/

		delay_ms(DISPSTOPTIME);
		GL_gv.wk.Key = KEY_NO;
	}
	
	//�������������е�����
	memset(&GL_gv.wk, 0x00, sizeof(GL_gv.wk));
	GL_gv.wk.Key = KEY_NO;
}