FROM golang:1.18-alpine AS builder

WORKDIR /app

COPY go.mod ./

COPY go.sum ./

RUN go mod download

COPY . .

RUN go build -o /golang

FROM nginx:alpine

COPY --from=builder /golang /usr/bin/golang

EXPOSE 80

CMD ["sh", "-c", "/usr/bin/golang & nginx -g 'daemon off;'"]
