FROM golang:alpine AS build-env

RUN apk update && apk upgrade && \
    apk add --no-cache bash git gcc musl-dev

WORKDIR /bot
COPY . .

RUN go mod download

RUN CGO_ENABLED=1 GOOS=linux GOARCH=amd64 go build -o ./server main.go

CMD ["./server"]