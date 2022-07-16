# 协议

## -- 云世 mqtt 协议

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

## HTTP

#### 一、请求登录鉴权

1. 请求

- 主题 TOPIC
  ```
  /GET/UUID/confidence-uaa/user/login
  ```
- payload sha1 加密
  ```
  {
  "url": "?username=uername&password=password"
  }
  ```

2. 应答

- 主题 TOPIC
  ```
  /HTTP/UUID/confidence-uaa/user/login
  ```
- payload json sha1 加密
  ```json
  {
    "code": 20000,
    "message": "登录成功！",
    "data": {
      "accessToken": "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiY29uZmlkZW5jZS11c2VyIiwiY29uZmlkZW5jZS1kZWl2Y2UiXSwic2NvcGUiOlsiYXNkZmFzZiJdLCJuYW1lIjpudWxsLCJpZCI6bnVsbCwiZXhwIjoxNjE3MzAxMjcwLCJhdXRob3JpdGllcyI6WyJST0xFX0NPTU1PTiJdLCJqdGkiOiJiOTY0ZWQxMi1jODE0LTQ3OGMtYjE1Ni0wYWUwY2IwZjU2YjgiLCJjbGllbnRfaWQiOiJjb25maWRlbmNlIiwidXNlcm5hbWUiOiJicnVjZXlhbiJ9.FFRyMG6sWAykX0VQtSUc4YP9FKoUy67A7aMSP2X4y4--9o2HotEU_o88SBBeByOvE8ay68Hmmg0qk2bf39vT-JImCPxFGBb-SWRZsudodyVv_IKN3BKBqxJWmOFhR1Gxf8Abw1YgQ2ntdLi2z3Lp6855N5vKlW7GClz8kGxSKttzRO7RIJ_LL4pDBWDdpithrI-BObOWBNX9Qy6lHMSOfewy8GzhxTtadliMNS_5fU2fIklyXoafcCPGco-scjOnAydcZUShXEoxCWU-i4ApQobbpY6FOj8_j7nleBfSs1SchJlBYoug_GIgr1CPDViH3pqg0eP3TDYbEgFVwhqoJw",
      "refreshToken": "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiY29uZmlkZW5jZS11c2VyIiwiY29uZmlkZW5jZS1kZWl2Y2UiXSwic2NvcGUiOlsiYXNkZmFzZiJdLCJhdGkiOiJiOTY0ZWQxMi1jODE0LTQ3OGMtYjE1Ni0wYWUwY2IwZjU2YjgiLCJuYW1lIjpudWxsLCJpZCI6bnVsbCwiZXhwIjoxNjE5ODUwMDcwLCJhdXRob3JpdGllcyI6WyJST0xFX0NPTU1PTiJdLCJqdGkiOiI0ZmU0NmFlZi1mYTQ1LTRjYzgtYThkNy1hYWQ1ZDExZjg3ZjYiLCJjbGllbnRfaWQiOiJjb25maWRlbmNlIiwidXNlcm5hbWUiOiJicnVjZXlhbiJ9.lLnZntI5wtRs4B6Jykp1X4KG03ART3KlLx6wuxXpV7eQSwghJF3MH1S2a2bFiCrNVZNWZjFjZDQnPMAICaewu_Dl2Bi2ULVMlug4p0xtkqqlBeKO-M5ilYnJ-acKUM3xpubkxeqFn65iXHINpk4Gb6wCRdhLulYASXIKyKsmHXe9RViOiDHYXzZyjDS23bO-f7p8P55AapbYWCUginepN4tQiYrvDpSwYSMaGwox2mzM2dPA0P0lZJPjdRx0eCFxJhFZcKUUZdgQePdQL1Lv3CLQOWhKFa_JUWjHYLlVfLY5RYJGPXmipm8qBYQx3saVGhE-EbncNVPwFIGm8RTarA",
      "jti": "b964ed12-c814-478c-b156-0ae0cb0f56b8"
    }
  }
  ```

#### 二、请求注册

1. 请求

- 主题 TOPIC
  ```
  /POST/UUID/confidence-user/user/register
  ```
- payload json sha1 加密
  ```json
  {
      "userEmail": "邮箱",
      "userGender": "MAN",
      "userName": "用户",
      "userPassword": "密码",
      "userPhone": "13312345678"
  };
  ```

2. 应答

- 主题 TOPIC
  ```
  /HTTP/UUID/confidence-user/user/register
  ```
- payload json sha1 加密
  ```json
  {
    "code": 20000,
    "message": "注册成功！",
    "data": null
  }
  ```

#### 三、添加设备

1. 请求

- 主题 TOPIC
  ```c
   /POST/UUID/confidence-device/device/registerDevice
  ```
- payload json sha1 加密
  ```json
  {
    "url": "?deviceMac=44237CBD76AA",
    "accessToken": "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiY29uZmlkZW5jZS11c2VyIiwiY29uZmlkZW5jZS1kZWl2Y2UiXSwic2NvcGUiOlsiYXNkZmFzZiJdLCJuYW1lIjpudWxsLCJpZCI6bnVsbCwiZXhwIjoxNjE3MzAxMjcwLCJhdXRob3JpdGllcyI6WyJST0xFX0NPTU1PTiJdLCJqdGkiOiJiOTY0ZWQxMi1jODE0LTQ3OGMtYjE1Ni0wYWUwY2IwZjU2YjgiLCJjbGllbnRfaWQiOiJjb25maWRlbmNlIiwidXNlcm5hbWUiOiJicnVjZXlhbiJ9.FFRyMG6sWAykX0VQtSUc4YP9FKoUy67A7aMSP2X4y4--9o2HotEU_o88SBBeByOvE8ay68Hmmg0qk2bf39vT-JImCPxFGBb-SWRZsudodyVv_IKN3BKBqxJWmOFhR1Gxf8Abw1YgQ2ntdLi2z3Lp6855N5vKlW7GClz8kGxSKttzRO7RIJ_LL4pDBWDdpithrI-BObOWBNX9Qy6lHMSOfewy8GzhxTtadliMNS_5fU2fIklyXoafcCPGco-scjOnAydcZUShXEoxCWU-i4ApQobbpY6FOj8_j7nleBfSs1SchJlBYoug_GIgr1CPDViH3pqg0eP3TDYbEgFVwhqoJw"
  }
  ```

2. 应答

- 主题 TOPIC
  ```
  /HTTP/UUID/confidence-device/device/registerDevice
  ```
- payload json sha1 加密
  ```json
  {
    "code": 20000,
    "message": "成功",
    "data": null
  }
  ```

#### 四、更新设备信息

1. 请求

- 主题 TOPIC
  ```
  /POST/UUID/confidence-device/device/updateDevice
  ```
- payload json sha1 加密
  ```json
  {
    "accessToken": "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiY29uZmlkZW5jZS11c2VyIiwiY29uZmlkZW5jZS1kZWl2Y2UiXSwic2NvcGUiOlsiYXNkZmFzZiJdLCJuYW1lIjpudWxsLCJpZCI6bnVsbCwiZXhwIjoxNjE3MzAxMjcwLCJhdXRob3JpdGllcyI6WyJST0xFX0NPTU1PTiJdLCJqdGkiOiJiOTY0ZWQxMi1jODE0LTQ3OGMtYjE1Ni0wYWUwY2IwZjU2YjgiLCJjbGllbnRfaWQiOiJjb25maWRlbmNlIiwidXNlcm5hbWUiOiJicnVjZXlhbiJ9.FFRyMG6sWAykX0VQtSUc4YP9FKoUy67A7aMSP2X4y4--9o2HotEU_o88SBBeByOvE8ay68Hmmg0qk2bf39vT-JImCPxFGBb-SWRZsudodyVv_IKN3BKBqxJWmOFhR1Gxf8Abw1YgQ2ntdLi2z3Lp6855N5vKlW7GClz8kGxSKttzRO7RIJ_LL4pDBWDdpithrI-BObOWBNX9Qy6lHMSOfewy8GzhxTtadliMNS_5fU2fIklyXoafcCPGco-scjOnAydcZUShXEoxCWU-i4ApQobbpY6FOj8_j7nleBfSs1SchJlBYoug_GIgr1CPDViH3pqg0eP3TDYbEgFVwhqoJw",
    "devId": 001,
    "devName": "devdesc"
  }
  ```

2. 应答

- 主题 TOPIC
  ```
  /HTTP/UUID/confidence-device/device/updateDevice
  ```
- payload json sha1 加密
  ```json
  {
    "code": 20000,
    "message": "成功",
    "data": null
  }
  ```

#### 五、获取用户信息

1. 请求

- 主题 TOPIC
  ```
  /GET/UUID/confidence-user/user/selectUserInfo
  ```
- payload json sha1 加密

  ```json
  {
    "url": "?userName=admin",
    "accessToken": "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiY29uZmlkZW5jZS11c2VyIiwiY29uZmlkZW5jZS1kZWl2Y2UiXSwic2NvcGUiOlsiYXNkZmFzZiJdLCJuYW1lIjpudWxsLCJpZCI6bnVsbCwiZXhwIjoxNjE3MzAxMjcwLCJhdXRob3JpdGllcyI6WyJST0xFX0NPTU1PTiJdLCJqdGkiOiJiOTY0ZWQxMi1jODE0LTQ3OGMtYjE1Ni0wYWUwY2IwZjU2YjgiLCJjbGllbnRfaWQiOiJjb25maWRlbmNlIiwidXNlcm5hbWUiOiJicnVjZXlhbiJ9.FFRyMG6sWAykX0VQtSUc4YP9FKoUy67A7aMSP2X4y4--9o2HotEU_o88SBBeByOvE8ay68Hmmg0qk2bf39vT-JImCPxFGBb-SWRZsudodyVv_IKN3BKBqxJWmOFhR1Gxf8Abw1YgQ2ntdLi2z3Lp6855N5vKlW7GClz8kGxSKttzRO7RIJ_LL4pDBWDdpithrI-BObOWBNX9Qy6lHMSOfewy8GzhxTtadliMNS_5fU2fIklyXoafcCPGco-scjOnAydcZUShXEoxCWU-i4ApQobbpY6FOj8_j7nleBfSs1SchJlBYoug_GIgr1CPDViH3pqg0eP3TDYbEgFVwhqoJw"
  }
  ```

2. 应答

- 主题 TOPIC
  ```
  /HTTP/UUID/confidence-user/user/selectUserInfo
  ```
- payload json sha1 加密
  ```json
  {
    "code": 20000,
    "message": "查询成功",
    "data": [
      {
        "devId": 25,
        "devName": "12",
        "devVendorName": null,
        "devVendorCode": null,
        "devMac": "1234",
        "devSerialNumber": null,
        "devSn": null,
        "devCreateTime": null,
        "devProtocol": null,
        "devAddress": null,
        "devStatus": null,
        "devFirmwareVersion": null,
        "devHardwareVersion": null,
        "devSdkVersion": null,
        "devRunningNumber": null,
        "devUpdateTime": null,
        "devPdId": 23,
        "devPdName": "插座",
        "devPdUrl": null,
        "devUserId": 245,
        "devUserName": "admin",
        "devFunction": {
          "functionCmdConut": 3,
          "function": [
            {
              "functionId": 23,
              "functionName": "9",
              "functionCmd": "9",
              "functionData": "9"
            },
            {
              "functionId": 24,
              "functionName": "power",
              "functionCmd": "1",
              "functionData": "75768634ED"
            },
            {
              "functionId": 25,
              "functionName": "timer",
              "functionCmd": "2",
              "functionData": "AE1224"
            }
          ]
        }
      }
    ]
  }
  ```

#### 五、通过手机号查找用户

1. 请求

- 主题 TOPIC
  ```
  /GET/UUID/confidence-user/user/selectUserByUserPhone
  ```
- payload string sha1 加密

  ```json
  {
    "url": "?userPhone=13200001110",
    "accessToken": "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiY29uZmlkZW5jZS11c2VyIiwiY29uZmlkZW5jZS1kZWl2Y2UiXSwic2NvcGUiOlsiYXNkZmFzZiJdLCJuYW1lIjpudWxsLCJpZCI6bnVsbCwiZXhwIjoxNjE3MzAxMjcwLCJhdXRob3JpdGllcyI6WyJST0xFX0NPTU1PTiJdLCJqdGkiOiJiOTY0ZWQxMi1jODE0LTQ3OGMtYjE1Ni0wYWUwY2IwZjU2YjgiLCJjbGllbnRfaWQiOiJjb25maWRlbmNlIiwidXNlcm5hbWUiOiJicnVjZXlhbiJ9.FFRyMG6sWAykX0VQtSUc4YP9FKoUy67A7aMSP2X4y4--9o2HotEU_o88SBBeByOvE8ay68Hmmg0qk2bf39vT-JImCPxFGBb-SWRZsudodyVv_IKN3BKBqxJWmOFhR1Gxf8Abw1YgQ2ntdLi2z3Lp6855N5vKlW7GClz8kGxSKttzRO7RIJ_LL4pDBWDdpithrI-BObOWBNX9Qy6lHMSOfewy8GzhxTtadliMNS_5fU2fIklyXoafcCPGco-scjOnAydcZUShXEoxCWU-i4ApQobbpY6FOj8_j7nleBfSs1SchJlBYoug_GIgr1CPDViH3pqg0eP3TDYbEgFVwhqoJw"
  }
  ```

2. 应答

- 主题 TOPIC
  ```
  /HTTP/UUID/confidence-user/user/selectUserByUserPhone
  ```
- payload json sha1 加密
  ```json
  {
    "code": 20000,
    "message": "查询成功！",
    "data": {
      "userId": 245,
      "userName": "admin",
      "userPhone": "13200001110",
      "userGender": "MAN",
      "userEmail": "0303@qq.com",
      "userRoleId": null,
      "userRoleName": null,
      "userCreateTime": "2021-03-27",
      "userUpdateTime": "2021-04-01",
      "userStatus": "ENABLE"
    }
  }
  ```

#### 六、分享设备

1. 请求

- 主题 TOPIC
  ```
  /GET/UUID/confidence-device/devShared/insertDevShared
  ```
- payload json sha1 加密
  ```json
  {
    "accessToken": "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiY29uZmlkZW5jZS11c2VyIiwiY29uZmlkZW5jZS1kZWl2Y2UiXSwic2NvcGUiOlsiYXNkZmFzZiJdLCJuYW1lIjpudWxsLCJpZCI6bnVsbCwiZXhwIjoxNjE3MzAxMjcwLCJhdXRob3JpdGllcyI6WyJST0xFX0NPTU1PTiJdLCJqdGkiOiJiOTY0ZWQxMi1jODE0LTQ3OGMtYjE1Ni0wYWUwY2IwZjU2YjgiLCJjbGllbnRfaWQiOiJjb25maWRlbmNlIiwidXNlcm5hbWUiOiJicnVjZXlhbiJ9.FFRyMG6sWAykX0VQtSUc4YP9FKoUy67A7aMSP2X4y4--9o2HotEU_o88SBBeByOvE8ay68Hmmg0qk2bf39vT-JImCPxFGBb-SWRZsudodyVv_IKN3BKBqxJWmOFhR1Gxf8Abw1YgQ2ntdLi2z3Lp6855N5vKlW7GClz8kGxSKttzRO7RIJ_LL4pDBWDdpithrI-BObOWBNX9Qy6lHMSOfewy8GzhxTtadliMNS_5fU2fIklyXoafcCPGco-scjOnAydcZUShXEoxCWU-i4ApQobbpY6FOj8_j7nleBfSs1SchJlBYoug_GIgr1CPDViH3pqg0eP3TDYbEgFVwhqoJw",
    "sharedDeviceId": 0,
    "sharedUserId": 0,
    "userName": "string"
  }
  ```

2. 应答

- 主题 TOPIC
  ```
  /HTTP/UUID/confidence-device/devShared/insertDevShared
  ```
- payload json sha1 加密
  ```json
  {
    "code": 20000,
    "message": "成功！",
    "data": null
  }
  ```

## 控制
