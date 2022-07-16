mpcli - A command line tool for flash programming (RTL8763B)

Usage:
	Syntax:	
		mpcli [options...] [args...]
	Current supported options and args are:
		-f path_to_config.json
			Get information for programming from config file. You can specify the port number, the baud rate, the 
			path (relative to config file) to the directory of bin files to be programed and the bin filenames in 
			associated fields of config file. See file 'mptoolconfig.json' as a template, which you can use directly
			after some modification.
		-c comX(for Windows host) or /dev/ttyUSBX(for Linux host) 
			Assign a port manually. The tool will ignore the 'port' field in config file if this option is 
			combined with -f option.
		-b baudrate
			Assign a baud rate manually. The tool will ignore the 'baud' field in config file if this option is 
			combined with -f option. See 'Attention' below.
		-e
			erase, need to be used with -A and -S together.
		-p
			program, need to be used with -A and -F together.
		-v
			verify, like -p, need to be used with -A and -F together.
		-s
			savebin, need to be used with -A ,-F and -S together.
		-m
			modify bytes in sequence, following new values(in hex, separated by colon, maximum 32 bytes), need to be used with -A, e.g. -A 803000 -m 11:22:33:44
		-a
			programming binary files from config file automatically. It erase flash sectors, program and verify
			binary files in sequence. If -a is enable, -e -p -v -A -F will be ignored.
		-E
			chip erase.
		-F
			bin file pathname, e.g., -F D:\Some\Path\To\XXX.bin or /home/yourname/bin-dir/xxx.bin
		-A
			address in Hex, e.g., -A 0x802000.
		-S
			size to be erased in bytes, e.g., -S 4096.
		-D
			Debug password, 16 bytes in hex, separated by colon, e.g., "-D 00:11:22:33:44:55:66:77:88:99:AA:BB:CC:DD:EE:FF". See Attention below for details.
		-u
			programming eFuse.
			
		-r
			reboot.
		-x
			BT address, "AA:BB:CC:DD:EE:FF", merged into oem config.
		-n
			Product ID, "1234",4bytes. Need to be used with -x and -k together.
		-k
			Secret Key, "0102030405060708090A0B0C0D0E0F10",32bytes. Need to be used with -x and -n together.
		-d
			disable merge oem config image.
		-P
			Packed Image.
		-H
			equals to -M 0.
		-M
			Selection of program mode:
			0: HCI mode
			1: Vendor Write mode, for non-secure device
			2: Factory Image mode, for secure device
			3: RAM Patch mode
			4: Single Wire UART mode
			when -M is missing, the mode auto-detection mechanism will be triggered.
		-V, --version
			output version information and exit.

Programming Interface Selection:
	This tool supports multiple program modes.
	HCI mode (-M 0) is supported by all types of IC, though it is slow. For all other programming modes, you may have to choose the appropriate mode 
	explicitly by -M option according to your project.

Two mode support:
	This tool supports two programming mode, distributed mode and packed mode. In distributed mode, you have to
	specify a json config file by the -f option, see example[1] below. In packed mode, you have to specify the
	-P option, see example[2] below. These two modes cannot be used altogether.

Two JSON config file support:
	This tool supports 1 or 2 JSON config files for programming images by 1 or 2 -f options, like "-f cfg_1.json -f cfg_2.json".
	Note that each JSON	config file has to follow the rules mentioned in "Attention 1" section of this file. And if the "port" or "baud" field conflicts 
	between 2 JSON config files, the values in former JSON file will be overrided by the latter ones, which will be subsequently overrided by values 
	assigned explicitly in command line (e.g. -c comXX) if any.
	
Example[1]:
  For Windows host:
	mpcli.exe -f mptoolconfig.json -c com13 -b 1000000 -a -r -M 0
	mpcli.exe -f mptoolconfig.json -c com13 -b 1000000 -e -A 0x802000 -S 0x1000 -r -M 2
	mpcli.exe -f mptoolconfig.json -c com13 -b 1000000 -e -p -v -F D:\Some\Path\To\XXX.bin -A 0x802000 -S 0x1000 -r -M 2
  For Linux host:
	sudo mpcli -f mptoolconfig.json -c /dev/ttyUSB0 -a -r -M 0
	sudo mpcli -f mptoolconfig.json -c /dev/ttyUSB0 -e -A 0x802000 -S 0x1000 -r -M 2
	sudo mpcli -f mptoolconfig.json -c /dev/ttyUSB0 -e -p -v -F /home/yourname/bin-dir/xxx.bin -A 0x802000 -S 0x1000 -r -M 2
Example[2]:
  For Windows host:
	mpcli.exe -P ImgPackedFile.bin -c com13 -r -M 0
  For Linux host:
	sudo mpcli -P ImgPackedFile.bin -c /dev/ttyUSB0 -r -M 0

Attention:
1.  The -D option can only be used with -c option altogether. The mpcli will send a HCI command containing the password following -D,
	which will result a watchdog reset.
2.  The -m option only supports modifying maximum 32 bytes in one call. If you want to modify more than 32 bytes, please call the mpcli 
	several times with appropriate values followed by -m.
3.	For Windows host, the baudrate can only be set to 1Mbps, 2Mbps or 3Mbps, other values are not supported. 1Mbps is recommended for stability.
	For Linux host, the baudrate is limited to 115200 bps temporarily for stability.