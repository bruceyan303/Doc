// Zalando specific example.
package main

import (
	"encoding/json"
	"fmt"
	"image/color"
	"strconv"

	//"github.com/shopspring/decimal"
	hbscolor "github.com/xyproto/color"
)

type ColorHSB struct {
	Hue        float64 `json:"hue"`
	Saturation float64 `json:"saturation"`
	Brightness float64 `json:"brightness"`
}

const (
	TYPE_BOOL_ID = iota
	TYPE_BYTE_ID
	TYPE_WORD_ID
	TYPE_DWORD_ID
	TYPE_BYTE_N_ID
	TYPE_BCD_N_ID
	TYPE_STRING_ID
	TYPE_float_ID
	TYPE_double_ID
	TYPE_Bitmap_ID
)
const (
	Brightness_CMD       = "460"
	RTCSession_CMD       = "450"
	WakeOnLAN_CMD        = "440"
	Toggle_CMD           = "430"
	TimeHold_CMD         = "420"
	Thermostat_CMD       = "410"
	SecurityPanel_CMD    = "400"
	Scene_CMD            = "3F0"
	Range_CMD            = "3E0"
	PowerLevel_CMD       = "3D0"
	Power_CMD            = "3C0"
	Percentage_CMD       = "3B0"
	Mode_CMD             = "3A0"
	Lock_CMD             = "390"
	Input_CMD            = "380"
	Equalizer_CMD        = "370"
	ColorTemperature_CMD = "360"
	Color_CMD            = "350"
	Channel_CMD          = "340"
	CameraStream_CMD     = "330"
)

func BytesToUint16(b []byte) uint16 {
	_ = b[1]
	return uint16(b[0]) | uint16(b[1])<<8
}

func BytesToUint32(b []byte) uint32 {
	_ = b[3] // bounds check hint to compiler; see golang.org/issue/14808
	return uint32(b[0]) | uint32(b[1])<<8 | uint32(b[2])<<16 | uint32(b[3])<<24
}

func BytesToUint64(b []byte) uint64 {
	_ = b[7]
	return uint64(b[0]) | uint64(b[1])<<8 | uint64(b[2])<<16 | uint64(b[3])<<24 | uint64(b[4])<<32 | uint64(b[5])<<40 | uint64(b[6])<<48 | uint64(b[7])<<56
}
func GetValueHandlerbybuf(datatype uint8, cmd string, cloudageval []byte) (awsval interface{}) {

	fmt.Printf("GetValueHandlerbybuf datatype=%d,data=%v", datatype, cloudageval)

	switch datatype {
	case TYPE_BOOL_ID:
		var val int

		if err := json.Unmarshal([]byte(cloudageval), &val); err != nil {
			fmt.Println(err)
		}

		fmt.Println("TYPE_BOOL=", val)

		if val != 0 {
			return "ON"
		} else {
			return "OFF"
		}
	case TYPE_BYTE_ID:
		var val uint8
		val = cloudageval[0]

		fmt.Println("GetValueHandler TYPE_BYTE=", val)

		return val

	case TYPE_WORD_ID:
		return BytesToUint16(cloudageval)
	case TYPE_DWORD_ID:
		return BytesToUint32(cloudageval)
	case TYPE_BYTE_N_ID:
		switch cmd {

		case Brightness_CMD, Color_CMD:
			// var buf []byte
			// if err := json.Unmarshal([]byte(cloudageval), &buf); err != nil {
			// 	fmt.Println(err)
			// }
			var str string
			for _, val := range []byte(cloudageval) {
				str = str + fmt.Sprintf("%s ", string(val))

			}
			var rgb color.RGBA
			rgb.R = cloudageval[0]
			rgb.G = cloudageval[1]
			rgb.B = cloudageval[2]
			rgb.A = cloudageval[3]
			rgb2 := hbscolor.NewFromFloats(60/360.0, 1, 1, 1).RGBA()
			hsb := hbscolor.New(rgb2)
			fmt.Println("GetValueHandler hsb=", hsb)
			//	h, _ := decimal.NewFromFloat(float64(hsb.H)).Div(decimal.NewFromFloat(360.0)).Float64()
			rgb3 := hsb.RGBA()

			fmt.Println("GetValueHandler ", rgb3, "=", rgb2)
			hsb2 := hbscolor.New(rgb2)
			fmt.Println("hbscolor =", hsb, hsb2)
			//	fmt.Println("GetValueHandler cloudageval=", str, rgb2)
			return ColorHSB{
				Hue:        float64(hsb.H),
				Saturation: hsb.S,
				Brightness: hsb.B,
			}
		default:

			fmt.Println("GetValueHandler TYPE_BYTE_N=", cloudageval)

			return cloudageval

		}

	case TYPE_BCD_N_ID:
	case TYPE_STRING_ID:
	case TYPE_float_ID:
	case TYPE_double_ID:
	case TYPE_Bitmap_ID:
	}
	return ""
}
func main() {

	var logbuf = []byte{1, 0, 16, 0, 60, 0, 0, 1, 0, 0, 67, 0, 0, 1, 1, 0, 62, 0, 4, 4, 0, 0, 0, 0, 0, 70, 0, 4, 4, 224, 128, 0, 255, 0, 53, 0, 4, 4, 224, 128, 0, 255}

	const (
		LOG_FLAG = iota
		LOG_SNH
		LOG_SNL
		LOG_CMDH
		LOG_CMDL
		LOG_PORT
		LOG_TYPE
		LOG_LEN
		LOG_DATA
	)

	fmt.Println(logbuf)
	state_machine := LOG_FLAG
	var protid, typeid, len, reclen uint8
	var cmd uint16
	databuf := make([]byte, 4)
	for _, hexval := range logbuf {

		//fmt.Println(i)

		//fmt.Println(state_machine)
		switch state_machine {
		case LOG_FLAG:
			if hexval == 1 {
				state_machine = LOG_SNH
			} else {
				fmt.Println("hexval != 1")
			}

		case LOG_SNH:
			state_machine = LOG_SNL
		case LOG_SNL:
			state_machine = LOG_CMDH
		case LOG_CMDH:
			fmt.Println("LOG_CMDH", hexval)
			cmd = uint16(uint16(hexval) << 8)
			fmt.Println("cmd", cmd)
			state_machine = LOG_CMDL
		case LOG_CMDL:
			fmt.Println("LOG_CMDL", hexval)
			cmd += uint16(hexval)
			fmt.Println("cmd", cmd)
			state_machine = LOG_PORT
		case LOG_PORT:
			protid = hexval
			state_machine = LOG_TYPE
		case LOG_TYPE:
			typeid = hexval
			state_machine = LOG_LEN
		case LOG_LEN:
			len = hexval
			reclen = 0
			databuf = databuf[0:0]
			state_machine = LOG_DATA
		case LOG_DATA:
			databuf = append(databuf, hexval)

			fmt.Println(hexval, "=?=", databuf[reclen])
			reclen++

			if reclen == len {

				cmdstr := strconv.FormatUint(uint64(cmd), 16) + strconv.FormatUint(uint64(protid), 16)
				//err, cmdstr := strconv.ParseUint(cmd*10 + uint16(protid))
				fmt.Println("cmdstr", cmdstr)
				fmt.Println("len", len)
				fmt.Println("cmd", cmd)
				fmt.Println("protid", protid)
				fmt.Println("typeid", typeid)
				fmt.Println("databuf", databuf)
				value := GetValueHandlerbybuf(typeid, cmdstr, databuf)
				fmt.Println("value", value)
				state_machine = LOG_CMDH
			}

		}

	}

}
