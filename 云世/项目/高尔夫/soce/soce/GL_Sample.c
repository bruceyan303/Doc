#include "sys.h"
#include "timer.h"
#include "string.h"
#include "math.h"
#include "usart.h"
#include "delay.h"

#include "GL_obj.h"
extern GL_GV GL_gv;

/*
云世科技有限公司独自完成函数--START
*/
/************************************************
 ************************************************
函数群
 ************************************************
*************************************************/

/************************************************
  读初始数据
	返回值：sizeof(GL_setdat) 成功
					NULL 文件不存在
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
  保存初始数据
	返回值：sizeof(GL_setdat) 成功
					NULL 失败
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
读取六轴传感器数据
加速度，倾角，角速度
************************************************/
/*KEY CallBack */
//例子
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
			GL_gv.wk.Key = KEY_RETURN;	//返回键
			break;
		case 5:
			
			//关屏幕，光电管控制
			//需要加逻辑
			//1 关屏
			//2 5分钟后关机
		break;
	}
}

/* 读镜头显示*/
void ReadLens( void ){
	/*
	镜头数据长度在GL_obj.h里定义
	#define	LENSBUFLEN		1036800	//镜头数据
	*/
	/*
		读镜头数据
	  1. 无需缩放可以设定镜头为240 x 240
	  2. 需要缩放可以设定镜头为120 x 720
	*/
	GL_gv.wk.lensbuf;
}

/* 缩放 */
void  Zoom(void){
	/*
	2 根据放大倍率 GL_gv.wk.Ratio 转换 240 x 240 的LUV数据
	输出至屏幕. 速度慢的话，可以只对中央部分进行运算(60,0),(179,239). 
	或者更窄一些
	*/
	GL_gv.wk.Ratio;   //放大倍率
}

/* 读取亮度值, 反回值为平均亮度值 */
int GetBright(void){
	/*
	读平均亮度, 读取输出至LCD的数据就可以.
	只要读取中央数据, 以及间隔读取就可以。(60, 60), (180,180)
	*/
}

/*
自动旗杆图形判断(高度)
		参数： y0, y1   读取到旗杆的顶部和底部的屏幕y值
		返回值: 0 成功
						-1失败
*/
int	PatternRecognition( int *y0, int *y1 ){
}

/*
void	GL_GetAxlesSensors()
{
	//当前的加速度
	GL_gv.wk.Acc.x =  gyroAccData.faccG[0];
	GL_gv.wk.Acc.y =  gyroAccData.faccG[1];
	GL_gv.wk.Acc.Z =  gyroAccData.faccG[2];
	
	//当前仰角，滚角
	GL_gv.wk.Angl.y = attitude.pitch;
	GL_gv.wk.Angl.x = attitude.roll;
	GL_gv.wk.Angl.Z = attitude.yaw;

	//当前的角速度
	GL_gv.wk.Velo.x = gyroAccData.fgyroD[0];
	GL_gv.wk.Velo.y = gyroAccData.fgyroD[1];
	GL_gv.wk.Velo.z = gyroAccData.fgyroD[2];
}
*/
/* 开机初始化*/

void	GL00(){
	int res;
	
	memset(&GL_gv, 0x00, sizeof(GL_gv));
	res = GL_RDsetdat();
	if( RESET == NULL ){
		// 系统ERROR
	}
}

/*
云世科技有限公司独自完成函数--END
*/

/*********************************************
设定：数字选择，显示在控件上，OK返回选择的数字
参数: 
			int		id显示控件ID
			float 开始值
			float step  -/+ step
			char*	单位字符( m, cm, f ...）
返回值: < 0 取消
				> 0 数值
**********************************************/
float	GL_NumSelect(int id, float orgdat,float step, char	*format, char *str){

	float count, counttmp;
	char	buf[8];
	
	count = orgdat;
	
	counttmp = 0;
	while(1){
		
		/* 显示spead, 99.9 */
		if ( count != counttmp ) {
			if( step == 1.0) {
				sprintf(buf, format, (int)count, str);
			}
			else {
				sprintf(buf, format, count, str);
			}
			
			counttmp = count;
			
			/* 在控件id上， 显示buf*/
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
设定函数群
*************************************************
*************************************************/

/***************************
GR速度设定
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

			//保存初始数据
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
旗杆高设定
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
			
			//保存初始数据
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
肩高设定
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

			//保存初始数据
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
旗杆高设定
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
			
			//保存初始数据
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
计算辅正设定
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

			//保存初始数据
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
设定：推杆水平角校正
****************************/
void GL18(){
	float	ang;
	GL_gv.wk.Key = KEY_NO;

	while(1){
		ang = GL_PuterHori();
		
		/*等待确认*/
		while(1){
			if( GL_gv.wk.Key == KEY_OK || GL_gv.wk.Key == KEY_RETURN ) {
				break;
			}
		}
		/*返回主画面*/
		if( GL_gv.wk.Key == KEY_OK ) {
			GL_gv.Setdat.PuterHoleAdj = ang;;
			GL_gv.Setdat.PuterHoleAdjFlg = 1;
			
			//保存初始数据
			int res = GL_WTsetdat();
			break;
		}
		GL_gv.wk.Key = KEY_NO;
	}
	GL_gv.wk.Key = KEY_NO;
}

/***************************
左右手设定
****************************/
void GL19(){
	GL_gv.wk.Key = KEY_NO;
	
	//显示左，右手
	if(	GL_gv.Setdat.Hand == 0 ){
		//显示右手
	}
	else{
		//显示左手
	}

	while(1){
		if( GL_gv.wk.Key == KEY_RETURN ) {
			if(GL_gv.Setdat.Hand == 0){
				GL_gv.Setdat.Hand = 1;
				//显示左手
			}
			else{
				GL_gv.Setdat.Hand = 0;
			//显示右手
			}
		}

		/*返回主画面*/
		if( GL_gv.wk.Key == KEY_OK ) {

			break;
		}
	}

	//保存初始数据
	int res = GL_WTsetdat();
	GL_gv.wk.Key = KEY_NO;
}

/************************************
相机水平角校准--出厂设定
*************************************/
void	GL20( ){
	char buf[12];

	
	/*开启镜头*/
	
	/* 显示画面 */
	
	/* 停3秒 */
	delay_ms(3000);
	GL_gv.wk.Key = KEY_NO;
	
	/* 校正水平角度 */
	GL_HoleCameraFactryAdj(0);
	GL_gv.wk.Key = KEY_NO;
	
	/* 显示 校正水平角度 */
	//GL_gv.Setdat.LensHoleAdj
	sprintf( buf, "%2.1f", GL_gv.Setdat.LensHoleAdj);
	
	/* 校正镜头拍摄角度 */
	GL_HoleCameraFactryAdj(1);
	GL_gv.wk.Key = KEY_NO;
	
	/* 显示 校正后的镜头拍摄角度 */
	//GL_gv.Setdat.LensAng
	sprintf( buf, "%2.1f", GL_gv.Setdat.LensAng);

	//保存初始数据
	int res = GL_WTsetdat();

	/*关闭镜头*/
}


/************************************************
*************************************************
测量函数群
*************************************************
*************************************************/
/***************************
推杆测量左右角度
****************************/
void GL05( ){
	float	ang;
	GL_gv.wk.Key = KEY_NO;
	while(1){
		ang = GL_MeasurementAng();

		/*等待确认*/
		while(1){
			/* 再测量 */
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
推杆测量上下角度
****************************/
void GL06( ){
	float	ang;
	GL_gv.wk.Key = KEY_NO;
	while(1){
		ang = GL_MeasurementAng();
		GL_gv.wk.Key = KEY_NO;

		/*等待确认*/
		while(1){
			/* 再测量 */
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
镜头测量左右角度
****************************/
void	GL07(){
	float res, tmp;
	int	count;
	GL_gv.wk.Ratio = 1.0;
	
	/*开启镜头*/
	
	/* 显示画面 */
	
	tmp = -9999;
	count = 0;
	GL_gv.wk.Key = KEY_NO;
	while(1){
		res = GL_LensAng();
		if( res != tmp ){
			/* 根据角度值，显示水平线 */
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

	/*关闭镜头*/
}

/***************************
镜头测量上下角度
****************************/
void	GL08(){
	float res, tmp;
	int	count;

	GL_gv.wk.Ratio = 1.0;
	
	/*开启镜头*/
	
	/* 显示画面 */
	
	tmp = -9999;
	count = 0;
	GL_gv.wk.Key = KEY_NO;
	while(1){
		res = GL_LensAng();
		if( res != tmp ){
			/* 根据角度值，显示水平线 */
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

	/*关闭镜头*/
}

/***************************
相机距离测量
****************************/
void GL09(){
	float dist;
	char buf[12];
	GL_gv.wk.Ratio = 2.0;
	
	/*开启镜头*/

	GL_gv.wk.Key = KEY_NO;
	dist = GL_DistanceMeasurement();
	/* 画面显示距离 */
	sprintf(buf, "%2.1f", dist);
	
	if( GL_gv.wk.Key == KEY_OK	) {
		GL_gv.wk.Distanc = dist;
	}
	GL_gv.wk.Key = KEY_NO;

	/*关闭镜头*/
}

/***************************
相机判断草向导
****************************/
void GL10( ){
	int bright0, bright1, ho;
	int		flg;
	
	/* 启动相机 */
	
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
			//同等
			if( (-1 *bright1) < BRIHT0 ) {
				ho = 0;
			}
			else {
				ho = 2;
			}
		}
		else {
			//同等
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

	
	//画面显示测量的信息
	GL_gv.wk.HoFlag = 1;
	if( GL_gv.wk.Ho == 0 ) {
		// 方形
	}
	else if(GL_gv.wk.Ho == 1){
		// 顺
	}
	else if(GL_gv.wk.Ho == 2){
		//逆
	}
}


/***************************
GR速度测量
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
		
		/* 显示速度
			speadtmp * FEET
		*/
		
		/*等待确认*/
		cont = 0;
		GL_gv.wk.Key = KEY_NO;
		while(1){
			/*再测*/
			if( GL_gv.wk.Key == KEY_RETURN ) {
				if( spead == 0 ){
					spead = speadtmp;
				}
				else {
					/*获取平均距离*/
					spead = (speadtmp + spead) / 2;
				}
				break;
			}
			
			/* 测量完成 */
			if( GL_gv.wk.Key == KEY_OK ) {
				/*返回主菜单*/
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
			/*返回主菜单*/
			break;
		}
	}
}

	
/***************************
推杆指导
****************************/
void GL03( ){
	float dist, result;
	
	/*
		画面显示测量的信息
	*/
		if(GL_gv.wk.UpdwFlg ) {
			///显示
			GL_gv.wk.Updw;				//测量上下坡角度
		}
		else {
			///不显示
			GL_gv.wk.Updw;
		}
		
		if(GL_gv.wk.LtRtFlg ){
			///显示
			GL_gv.wk.LtRt;				//测量左右坡角度
		}
		else {
			///不显示
			GL_gv.wk.LtRt;
		}
		if(GL_gv.wk.Distanc !=0 ){
			GL_gv.wk.Distanc;		//测量距离(米)
		}
		else{
			///不显示
			GL_gv.wk.Distanc;
		}
		
		if(	GL_gv.wk.HoFlag ){					//草向，-1：无效，0：=(同等)，1：顺，2：逆
			///显示
			GL_gv.wk.Ho;
		}
		else {
			///不显示
			GL_gv.wk.Ho;
		}
		
	Start_Angl = 0;
	GL_gv.wk.Key = KEY_NO;
	while(1){
		GL_Puter( &dist, &result);

		if( GL_gv.wk.Key == KEY_OK ) {
			/*返回主菜单*/
			break;
		}

		/* 显示距离
			dist, 99.9
		*/
		/* 显示判断推杆效果
			result, 9.99
		*/

		delay_ms(DISPSTOPTIME);
		GL_gv.wk.Key = KEY_NO;
	}
	
	//清零所有运行中的数据
	memset(&GL_gv.wk, 0x00, sizeof(GL_gv.wk));
	GL_gv.wk.Key = KEY_NO;
}