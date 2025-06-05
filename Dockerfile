FROM golang:1.24.3
WORKDIR /app
COPY . .
RUN go build -o goapp main.go

FROM alpine:latest
RUN apk add --no-cache ca-certificates sqlite-libs
WORKDIR /root/
COPY --from=builder /app/goapp .
COPY tracker.db .
CMD ["./goapp"]
