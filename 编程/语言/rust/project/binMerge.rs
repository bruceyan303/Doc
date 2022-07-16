/*
 * @Author: bruceyan
 * @Date: 2021-08-27 11:39:21
 * @LastEditTime: 2021-08-28 08:19:10
 * @LastEditors: bruceyan
 * @Description:et con
 * @FilePath: \doc\编程\rust\project\binMerge.rs
 *
 */

use std::io::prelude::*;
use std::io::Read;
use std::io::SeekFrom;
use std::io::Write;
fn main() -> std::io::Result<()> {
    let mut command_line: std::env::Args = std::env::args();
    command_line.next().unwrap();
    // 跳过程序名
    // 原文件
    let bootsource = command_line.next().unwrap();
    let appsource = command_line.next().unwrap();
    // 新文件
    let destination = command_line.next().unwrap();

    let mut file_boot = std::fs::File::open(bootsource).unwrap();
    let mut file_app = std::fs::File::open(appsource).unwrap();
    let mut file_out = std::fs::File::create(destination).unwrap();
    let mut buffer = [0u8; 4096];
    let mut headboot = [0u8; 3];
    let mut headapp = [0u8; 3];
    let mut flgboot = false;
    let mut flgapp = false;
    loop {
        let nbytes = file_boot.read(&mut buffer).unwrap();
        if !flgboot {
            headboot[0] = buffer[0];
            headboot[1] = buffer[1];
            headboot[2] = buffer[2];
            flgboot = true;
            // println!("{:02X}{:02X}{:02X}", headboot[0], headboot[1], headboot[2]);
        }
        // println!("{:02X}{:02X}{:02X}", buffer[0], buffer[1], buffer[2]);
        file_out.write(&buffer[..nbytes]).unwrap();
        if nbytes < buffer.len() {
            break;
        }
    }
    file_out.seek(SeekFrom::Start(0))?;
    loop {
        let nbytes = file_app.read(&mut buffer).unwrap();
        if !flgapp {
            headapp[0] = buffer[0];
            headapp[1] = buffer[1];
            headapp[2] = buffer[2];
            flgapp = true;
            // println!("{:02X}{:02X}{:02X}", headapp[0], headapp[1], headapp[2]);
        }
        // println!("{:02X}{:02X}{:02X}", buffer[0], buffer[1], buffer[2]);

        file_out.write(&buffer[..nbytes]).unwrap();
        if nbytes < buffer.len() {
            break;
        }
    }
    let nbytes = 3;
    file_out.seek(SeekFrom::Start(0))?;
    file_out.write(&headboot[..nbytes]).unwrap();
    file_out.seek(SeekFrom::Start(0x7E00))?;
    file_out.write(&headapp[..3]).unwrap();
    println!("Binmerge finish");
    Ok(())
}
