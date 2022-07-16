![logo](http://www.szxinken.com/cn/images/logo.png "信恳logo")

# 信恳终端协议


| 主命令 | 子命令 | 参数1（管脚） | 参数2(时间) |
| ------ | ------ | ------------- | ----------- |


[主命令]

CMD_IDLE,//查询、握手
CMD_CFG,//配置
CMD_IO_CTRL,//io 控制
CMD_ALARM,//报警
CMD_UPDATE,//终端升级 [Http File Server url]

[io 控制子命令]

STATUS_NC,查询在线状况 [管脚输出] [输入管脚]

STATUS_OFF,拉低[管脚] [无效]
STATUS_ON,拉高[管脚] [无效]
STATUS_FLASH,开关闪动[管脚] [间隔时间]
STATUS_OFF_ON, 定时开关[管脚] [开时间,关时间]
STATUS_PWM, /*5*/ 调光[管脚] [占空比]

STATUS_RGB_PWM,调色[管脚R，管脚G，管脚B] [R占空比,G占空比，B占空比] //ESP8266 只能 12 13 14 15管脚 ESP32 全部管脚

STATUS_BREATHE_PWM,呼吸灯 [管脚] [占空比,间隔时间]
STATUS_BREATHE_RGB_PWM, 呼吸彩灯[管脚R，管脚G，管脚B] [R最高占空比,G最高占空比,B最高占空比,间隔时间]
STATUS_BREATHE_MULTI_RGB,多盏彩灯呼吸[管脚R1，管脚G1，管脚B1，管脚R2，管脚G2，管脚B2...管脚Rn，管脚Gn，管脚Bn] [R1最高占空比,G1最高占空比,B1最高占空比,间隔时间1，R2最高占空比,G2最高占空比,B2最高占空比...Rn最高占空比,Gn最高占空比,Bn最高占空比,间隔时间n]
STATUS_RESET,恢复出厂设置
[管脚]
