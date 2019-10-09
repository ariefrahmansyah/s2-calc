all: get-deps build-wasm run

get-deps:
	@GO111MODULE=on go mod tidy -v
	@GO111MODULE=on go mod vendor -v

build-wasm:
	@GO111MODULE=on GOOS=js GOARCH=wasm go build -o main.wasm

run:
	@goexec 'http.ListenAndServe(":8080", http.FileServer(http.Dir(".")))'
