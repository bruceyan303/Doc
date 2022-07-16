package main

import (
	"bytes"
	"fmt"
	"io"
	"math"
	"net"
	"strconv"
	"strings"
	"sync"
	"time"
)

const (
	SEVER_NETWORK = "tcp"
	SEVER_ADDRESS = "127.0.0.1:8848"
	DELIMITER     = "\t"
)

var wg sync.WaitGroup //批量等待
func printlog(log string, sn int, format string, args ...interface{}) {
	if strings.HasSuffix(format, "\r") {
		format += "\n"
	}

	fmt.Printf("%s[%d]:%s\n", log, sn, fmt.Sprintf(format, args...))

}
func PrintClientLog(format string, args ...interface{}) {
	printlog("client", 1, format, args...)
}
func PrintServerLog(format string, args ...interface{}) {
	printlog("server", 2, format, args...)
}
func strToInt32(str string) (int32, error) {
	num, err := strconv.Atoi(str) // strconv.ParseInt(str, 10, 0)
	if err != nil {
		return 0, err
	}
	if num > math.MaxInt32 || num < math.MinInt32 {
		return 0, err
	}

	return int32(num), nil
}
func CBrt(data int32) float64 {
	return math.Cbrt(float64(data))

}
func Read(conn net.Conn) (string, error) {
	buf := make([]byte, 1024)
	n, err := conn.Read(buf)
	if err != nil {
		return "", err
	}
	return string(buf[:n]), nil
}
func Write(conn net.Conn, content string) (int, error) {
	var buffer bytes.Buffer
	buffer.WriteString(content)
	//buffer.WriteString(DELIMITER)
	return conn.Write(buffer.Bytes())
}

//响应客户端请求
func HandLeConn(conn net.Conn) {
	defer func() {
		conn.Close()
		wg.Done()
	}()
	for {
		conn.SetReadDeadline(time.Now().Add(time.Second * 10)) //最多10秒读取一次
		msg, err := Read(conn)
		if err != nil {
			if err == io.EOF {
				PrintServerLog("client:%s close", conn.RemoteAddr().String())
			} else {
				PrintServerLog("read error:%s", err)
			}
			return
		}
		PrintServerLog("recv:%s", msg)
		int32, err := strToInt32(msg)
		if err != nil {
			n, err := Write(conn, err.Error())
			PrintServerLog("strToInt32 error:%s,%d", err, n)
			continue
		}
		floatdata := CBrt(int32) //计算
		resp := fmt.Sprintf("%f", floatdata)
		n, err := Write(conn, resp) //返回结果
		if err != nil {
			PrintServerLog("send error:%s", err)
		}
		PrintServerLog("send:%s,%d", resp, n)

	}
}

func SeverGo() {
	var listener net.Listener
	listener, err := net.Listen(SEVER_NETWORK, SEVER_ADDRESS)
	if err != nil {
		PrintServerLog("listen error:%s", err)
		return
	}
	defer listener.Close() //关闭监听 退出关闭
	PrintServerLog("sever start", listener.Addr())
	for {
		conn, err := listener.Accept() //接受连接
		if err != nil {
			PrintServerLog("accept error:%s", err)
			continue
		}
		PrintServerLog("accept client:%s", conn.RemoteAddr())
		go HandLeConn(conn) //处理连接 每个客户端一个协程

	}

}

func ClientGo(id int) {
	defer wg.Done()
	conn, err := net.DialTimeout(SEVER_NETWORK, SEVER_ADDRESS, time.Second*3)
	if err != nil {
		PrintClientLog("dial error:%s", err)
		return
	}
	defer conn.Close()
	PrintClientLog("connect server:%s->%s", conn.LocalAddr(), conn.RemoteAddr())
	time.Sleep(time.Second * 5)
	conn.SetDeadline(time.Now().Add(time.Second * 10))
	for i := 0; i < 5; i++ {
		n, err := Write(conn, fmt.Sprintf("%d", i))
		if err != nil {
			PrintClientLog("write error:%s", err)
		}
		PrintClientLog("send:%s", fmt.Sprintf("%d,%d", n, i))
		for i := 0; i < 5; i++ {
			msg, err := Read(conn)
			if err != nil {
				if err == io.EOF {
					PrintClientLog("%d close %s", id)

				} else {
					PrintClientLog("%d read error:%s", id, err)
				}
				break

			}
			PrintClientLog("%d recv:%s", id, msg)

		}

	}

}
func main() {
	wg.Add(3)
	go SeverGo()
	time.Sleep(time.Second * 2)
	go ClientGo(1)
	go ClientGo(2)
	wg.Wait()
}
