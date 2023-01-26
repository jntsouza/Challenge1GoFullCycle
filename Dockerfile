FROM golang:1.14.0-alpine as builder
WORKDIR /usr/src/app
COPY src/hello.go .
RUN go build -ldflags "-s -w" -o build/hello hello.go 

FROM scratch
WORKDIR /root/
COPY --from=builder /usr/src/app/build/hello .

CMD [ "./hello" ]
