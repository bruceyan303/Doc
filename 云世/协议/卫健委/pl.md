# 协议

## -- 卫健委 mqtt 协议

## 修改说明

## 总则

1.  UUID 名词解析
    - 在设备端表示设备 mac 等唯一标识符
    - 在 APP 端 APP 端 username 等唯一标识符
    - 源 UUID 动作发起者
    - 目标 UUID 动作接收者
2.  设备
    **控制设备**

           - 发送 TOPIC /DEV/自己 UUID
           - 订阅 TOPIC /SER2DEV/自己 UUID/#

    **透传设备**

        - 发送 TOPIC /DEVTUBE/自己 UUID
        - 订阅 TOPIC /TUBE2DEV/自己 UUID/#

    **音频设备**

         - 发送 TOPIC /ADFDEV/自己 UUID
         - 订阅 TOPIC /SER2ADF/自己 UUID/#

3.  APP

    - 控制模块 发送 TOPIC /APP/源 UUID/目标 UUID
    - 透传模块 发送 TOPIC /TUBE/源 UUID/目标 UUID
    - 音频模块 发送 TOPIC /ADF/源 UUID/目标 UUID

    - ~~发送 TOPIC /GET/源 UUID/目标 UUID~~
    - ~~发送 TOPIC /POST/源 UUID/目标 UUID~~
    - 订阅 TOPIC /SER2APP/自己 UUID
    - ~~订阅 TOPIC /HTTP/自己 UUID~~

4.  路由器

    - 发送 TOPIC /SER2APP/源 UUID/目标 UUID
    - 发送 TOPIC /SER2DEV/源 UUID/目标 UUID
    - 发送 TOPIC /TUBE2DEV/源 UUID/目标 UUID

    - 订阅 TOPIC /ADF/#
    - 订阅 TOPIC /ADFDEV/#
    - 订阅 TOPIC /TUBEDEV/#
    - 订阅 TOPIC /TUBE/#
    - 订阅 TOPIC /DEV/#
    - 订阅 TOPIC /APP/#
    - 订阅 TOPIC /POST/#
    - 订阅 TOPIC /GET/#

5.  服务器

- 发送 TOPIC /CLOUD_OTA/目标 UUID
