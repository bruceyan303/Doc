/*
 * @Author: bruceyan
 * @Date: 2021-08-29 09:13:27
 * @LastEditTime: 2021-08-29 09:51:12
 * @LastEditors: bruceyan
 * @Description:
 * @FilePath: \doc\编程\语言\go\mqtt\main.go
 *
 */
package main

type Animaler interface {
	runer
	eater
}
type runer interface {
	run()
}
type eater interface {
	eat(string)
}
type Dog struct {
	name string
}

func (a *Dog) run() {
	println(" run")
}
func (a *Dog) eat(food string) {
	println(" eat", food)
}
func main() {
	dog := Dog{"ww"}
	var animal Animaler = &dog
	// animal = &dog
	animal.run()
	animal.eat("adfa")

}
