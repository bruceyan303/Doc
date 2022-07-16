/*
 * @Author: bruceyan
 * @Date: 2021-08-12 10:12:48
 * @LastEditTime: 2021-08-13 17:40:03
 * @LastEditors: bruceyan
 * @Description:
 * @FilePath: \doc\编程\rust\guess_game\src\main.rs
 *
 */
use rand::Rng; //trait
use std::cmp::Ordering;
use std::io; //prlude 默认导入的
fn main1() {
    println!("猜数游戏!");
    let secret_number = rand::thread_rng().gen_range(1, 101);
    //  println!("随机数是{}", secret_number);
    loop {
        println!("请猜测一个数");
        let mut guess = String::new();
        io::stdin().read_line(&mut guess).expect("无法读取行");
        // let guess: u32 = guess.trim().parse().expect("请输入数字");
        // io::result Ok,Err
        let guess: u32 = match guess.trim().parse() {
            Ok(num) => num,
            Err(_) => continue,
        };
        println!("你猜测的数据是：{}", guess);
        match guess.cmp(&secret_number) {
            Ordering::Less => println!("太小了"),
            Ordering::Greater => println!("太大了"),
            Ordering::Equal => {
                println!("正确");
                break;
            }
        }
    }
}

fn main() {
    let mut time = 5;
    while time != 0 {
        println!("{}", time);
        time -= 1;
    }
    println!("while end")
}
