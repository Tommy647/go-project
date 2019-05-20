all: test build-http build-lambda

BUILD_DIR=./build/
BINARY_NAME=go-package

test:
	go test ./... --cover

build-http:
	go build -o ${BUILD_DIR}${BINARY_NAME}-http ./cmd/http

build-lambda:
	go build -o ${BUILD_DIR}${BINARY_NAME}-lambda ./cmd/lambda
	zip ${BUILD_DIR}${BINARY_NAME}.zip ${BUILD_DIR}${BINARY_NAME}-lambda
	rm -f ${BUILD_DIR}${BINARY_NAME}-lambda

clean:
	rm -f ${BUILD_DIR}${BINARY_NAME}*