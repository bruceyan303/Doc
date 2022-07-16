![logo](http://www.szxinken.com/cn/images/logo.png "信恳logo")
###### 20201008 整理 第一版 
# http API（外接云接口）

## 1.智能开关

1. 接口主地址 confidenceint.synology.me
2. 接口端口18080
3. 接口操作地址 switch
4. 接口参数
	+ 操作设备的ID（mac地址）`devMac` 类型为字符串
	+ 操作设备时序流水号`devRunningNumber` 类型为整型
	+ 操作设备指令`Switch` 类型为整型 值为`0` 关闭  值为`1` 打开
	+ 操作设备的设备的产品类型ID `pdId` 类型为整型 产品产生时生的唯一编码
5. 接口操作例程
  发起 `http post`请求 地址是  `http://confidenceint.synology.me:18080/switch` 传递jison参数

```json
{
	"devMac" : "2PFbFM9R",
	"devRunningNumber" : 123,
	"Switch" : 1,
	"pdId" : 1

}
```
