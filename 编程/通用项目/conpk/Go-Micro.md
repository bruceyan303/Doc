install
github.com/golang/protobuf
https://github.com/golang/protobuf.git --- protoc-gen-go

https://github.com/asim/go-micro.git ---cmd/protoc-gen-micro
go install go-micro.dev/v4/cmd/protoc-gen-micro@v4

后面关注 go install github.com/storyicon/powerproto/cmd/powerproto@latest
protoc --proto_path=. --micro_out=. --go_out=. userService.proto userModels.proto
protoc --proto_path=. --micro_out=. --go_out=. userService.proto userModels.proto

protoc --proto_path=. --micro_out=. --go_out=. taskModels.proto taskService.proto userModels.proto userService.proto

protoc --proto_path=. --micro_out=. --go_out=. taskModels.proto taskService.proto

protoc --proto_path=. --micro_out=. --go_out=. taskModels.proto taskService.proto userModels.proto userService.proto


protoc --proto_path=. --micro_out=. --go_out=. mqttSend.proto