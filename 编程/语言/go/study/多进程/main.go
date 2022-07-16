package main

import (
	"bufio"
	"bytes"
	"fmt"
	"io"
	"os"
	"os/exec"
	"time"
)

func runCMD1() {
	cmd := exec.Command("notepad")
	err := cmd.Run()
	if err != nil {
		fmt.Println("err!")
	}
}

func runCMD2() {
	cmd := exec.Command("taskkill", "/f", "/im", "notepad.exe")
	err := cmd.Run()
	if err != nil {
		fmt.Println("err!")
	}
}

//多进程使用于计算密集型，消耗CPU
//多线程IO密集

//tracert www.qq.com   跟踪路由
func runCMD() { //文件缓存区方法
	cmd := exec.Command("ping", "www.qq.com")
	outPipe, err := cmd.StdoutPipe()
	if err != nil {
		fmt.Println(err)
	} else {
		if err := cmd.Start(); err != nil {
			fmt.Println(err)

		} else {
			useBufferIO := false
			if !useBufferIO {
				var outputbuf bytes.Buffer
				for {
					readbuf := make([]byte, 256)
					len, err := outPipe.Read(readbuf)
					if err != nil {
						if err == io.EOF {
							break
						}
						fmt.Println(err)
						return
					}
					if len > 0 {
						outputbuf.Write(readbuf[:len])
					}
				}

				fmt.Print(outputbuf.String())
			} else {
				outpubuf0 := bufio.NewReader(outPipe)
				output0, _, err := outpubuf0.ReadLine()
				if err != nil {
					fmt.Println(err)
				} else {
					fmt.Println(string(output0))
				}
			}
		}
	}
}

//匿名管道
func RunCmdPipe() {
	cmd1 := exec.Command("tasklist")
	var outputbuf1 bytes.Buffer //输出
	cmd1.Stdout = &outputbuf1   //设置输入
	if err := cmd1.Start(); err != nil {
		fmt.Println(err)
		return
	}
	if err := cmd1.Wait(); err != nil {
		fmt.Println(err)
		return
	}
	fmt.Printf("%s", outputbuf1.Bytes())
}
func memPipe() {
	reader, writer := io.Pipe() //管道 在内存
	go func() {
		output := make([]byte, 100)
		n, err := reader.Read(output)
		if err != nil {
			fmt.Println(err)
		}
		fmt.Println(string(output))
		fmt.Println("read", n)
	}()
	input := make([]byte, 26)
	for i := 65; i < 90; i++ {
		input[i-65] = byte(i) //写入字母
	}
	n, err := writer.Write(input)
	if err != nil {
		fmt.Println(err)
	}
	fmt.Println("write", n)
	time.Sleep(time.Second * 3)

}
func SystemPipe() {
	reader, writer, err := os.Pipe() //管道 在系统
	if err != nil {
		fmt.Println(err)
		return
	}
	go func() {
		output := make([]byte, 100)
		n, err := reader.Read(output)
		if err != nil {
			fmt.Println(err)
		}
		fmt.Println(string(output))
		fmt.Println("read", n)
	}()
	input := make([]byte, 26)
	for i := 65; i < 90; i++ {
		input[i-65] = byte(i) //写入字母
	}
	n, err := writer.Write(input)
	if err != nil {
		fmt.Println(err)
		return
	}
	fmt.Println("write", n)
	time.Sleep(time.Second * 3)
}
func main() {
	//RunCmdPipe()
	//memPipe()
	SystemPipe()
}
