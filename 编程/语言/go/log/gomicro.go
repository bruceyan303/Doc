package main

import (
	"os"

	"github.com/sirupsen/logrus"
	"go-micro.dev/v4/logger"
)

func ExampleWithOutput() {
	logger.DefaultLogger = NewLogger(logger.WithOutput(os.Stdout))
	logger.Infof(logger.InfoLevel, "testing: %s", "Infof")
}

func ExampleWithLogger() {
	l := logrus.New() // *logrus.Logger
	logger.DefaultLogger = NewLogger(WithLogger(l))
	logger.Infof(logger.InfoLevel, "testing: %s", "Infof")
}
