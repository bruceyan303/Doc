package main

import (
	"os"

	"github.com/sirupsen/logrus"
	"go-micro.dev/v4/logger"
	log "go-micro.dev/v4/logger"
)

func main() {
	l := logrus.New() // *logrus.Logger
	l.Out = os.Stdout
	logger.DefaultLogger = log.NewLogger(log.WithLogger(l))
	logger.Infof(logger.InfoLevel, "testing: %s", "Infof")
}
