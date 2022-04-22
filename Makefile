all: bindata fmt ui

ui:
	go install .

bindata: bindata-deps
	-rm assets/assets.go
	go run "${HOME}"/go/src/github.com/jteeuwen/go-bindata/go-bindata -o assets/assets.go -pkg assets assets/...

bindata-deps:
	go get -u github.com/jteeuwen/go-bindata/...

fmt:
	go fmt ./...

.PNONY: all ui bindata bindata-deps fmt
