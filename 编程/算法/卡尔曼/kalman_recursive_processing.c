#include <stdio.h>
#include <stdlib.h>
#include "inttypes.h"
typedef struct
{
    double Gain_k;      //卡尔曼系数
    uint32_t Error_Est; //预测误差
    uint32_t Error_Eea; //测量误差
                        // uint32_t Est_K_1;//上次k-1预测结果值
    uint32_t Est_k;     // k预测结果值
    uint32_t Mea_k;     // k测试值

} Kalman_InitDef;
Kalman_InitDef kalmanInitDef;
void Generating_Random_Measurement()
{
}
/**
 * 计算卡尔曼系数
 * @param E_est 预测误差
 * @param E_mea 测量误差
 * @return 获取当前的卡尔曼系数
 */
double Kalman_Gain(double E_est, double E_mea)
{
    return E_est / (E_est + E_mea);
}
/**
 * 用于更新预测误差
 * @param gain_k 卡尔曼系数
 * @param previous_error_est 上一次的预测误差
 * @return 获取当前的预测误差
 */
uint32_t Kalman_Error_Est(double gain_k, uint32_t previous_error_est)
{
    return (1 - gain_k) * previous_error_est;
}
/**
 * 获取当前预测值
 * @param gain_k 卡尔曼系数
 * @param previous_est 上次预测值
 * @param cur_mea 当前测量值
 * @return 当地预测值
 */
uint32_t kalman_Get_Est(double gain_k, uint32_t previous_est, uint32_t cur_mea)
{
    return previous_est + gain_k * (cur_mea - previous_est);
}
void Kalman_Init()
{
    kalmanInitDef.Est_k = 2500;
    kalmanInitDef.Error_Est = 100; // 0.01为1

    kalmanInitDef.Error_Eea = 10;
    kalmanInitDef.Gain_k = Kalman_Gain(kalmanInitDef.Error_Est, kalmanInitDef.Error_Eea);
}
