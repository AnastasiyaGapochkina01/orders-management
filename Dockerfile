FROM golang:1.23 AS builder
WORKDIR /src
COPY . .
RUN go mod tidy
RUN go build -o orders ./cmd/server

FROM alpine
COPY --from=builder /src/orders ./
CMD ["/orders"]
