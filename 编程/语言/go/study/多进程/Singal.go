package main

import (
	"bytes"
	"fmt"
	"io"
	"os"
	"os/exec"
	"os/signal"
	"strconv"
	"strings"
	"sync"
	"syscall"
	"time"
)

func getCmdText(cmd *exec.Cmd) string {
	var cmdbuf bytes.Buffer
	cmdbuf.WriteString(cmd.Path) //	写入路径
	for _, arg := range cmd.Args[1:] {
		cmdbuf.WriteRune(' ')
		cmdbuf.WriteString(arg)

	}
	return cmdbuf.String()
}
func RunCmds(cmds []*exec.Cmd) ([]string, error) {
	if cmds == nil || len(cmds) == 0 {
		return nil, fmt.Errorf("cmds is nil")
	}
	first := true
	var output []byte
	for _, cmd := range cmds {
		fmt.Println("执行命令", getCmdText(cmd))
		if cmd == nil {
			continue
		}
		if first {
			var stdinbuf bytes.Buffer
			stdinbuf.Write(output)
			cmd.Stdin = &stdinbuf //设置输入

		}
		var stdinbuf bytes.Buffer
		cmd.Stdout = &stdinbuf //	设置输出
		if err := cmd.Run(); err != nil {
			return nil, err

		}
		if err := cmd.Wait(); err != nil {
			return nil, err

		}

		output = stdinbuf.Bytes() //写入
		//第一个命令结果当作二次命令的输入
		if first {
			//first = false
		}
	}
	var lines []string
	var outpubuf bytes.Buffer
	outpubuf.Write(output)
	for { //分割输出
		line, err := outpubuf.ReadString('\n')
		if err != nil {
			if err == io.EOF {
				break

			}
			break
		}
		lines = append(lines, line)
	}
	return lines, nil

}

//pid str to int
func GetPids(strs []string) ([]int, error) {
	var pids []int
	for _, str := range strs {
		fmt.Println("获取pid", str)
		pid, err := strconv.Atoi(strings.TrimSpace(str))
		if err != nil {
			return nil, err
		}
		// pid, err := getPid(str)
		pids = append(pids, pid)
	}
	return pids, nil
}
func SendSingal() {
	cmds := []*exec.Cmd{
		exec.Command("tasklist"),
		exec.Command("ipconfig"),
	}
	output, err := RunCmds(cmds) //	执行命令
	if err != nil {
		fmt.Println(err)
		return
	}
	pids, err := GetPids(output)
	fmt.Println("pids", pids)
	if err != nil {
		fmt.Println(err)
		return //	返回
	}
	for _, pid := range pids {
		proc, err := os.FindProcess(pid)
		if err != nil {
			fmt.Println(err)
			return
		}

		sig := syscall.SIGINT //退出
		fmt.Println("发送信号", sig, pid)
		err = proc.Signal(sig)
		if err != nil {
			fmt.Println(err)
			return
		}

	}

}
func HandleSingal() {
	signalRecv := make(chan os.Signal, 1)                 // 创建一个信号通道
	sins1 := []os.Signal{syscall.SIGINT, syscall.SIGTERM} //信号列表
	fmt.Println("开始监听信号", sins1)                          //打印信号列表
	signal.Notify(signalRecv, sins1...)                   // 注册信号通道
	sinnalRecv2 := make(chan os.Signal, 1)                // 创建一个信号通道
	sins2 := []os.Signal{syscall.SIGINT, syscall.SIGTERM}
	fmt.Println("开始监听信号", sins2)
	signal.Notify(sinnalRecv2, sins2...) // 注册信号通道
	var wg sync.WaitGroup
	wg.Add(2)
	go func() {
		for sig := range signalRecv {
			fmt.Println("收到信号", sig)
		}
		fmt.Print("收到信号完成")
		wg.Done()
	}()
	fmt.Println("等待20秒")
	time.Sleep(time.Second * 20)
	signal.Stop(signalRecv) // 停止信号监听
	close(signalRecv)       //关闭信号通道
	fmt.Println("等待22秒")
	time.Sleep(time.Second * 22)
	signal.Stop(sinnalRecv2) // 停止信号监听
	close(sinnalRecv2)       //关闭信号通道
	fmt.Println("结束")
	wg.Wait()
}
func main() {
	go func() {
		time.Sleep(time.Second * 5)
		SendSingal()
	}()
	HandleSingal()
}
