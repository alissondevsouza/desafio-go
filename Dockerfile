FROM golang:1.20.5 AS build

WORKDIR /app

COPY go.mod ./
COPY main.go ./

RUN go build -o /server

FROM gcr.io/distroless/base-debian10

WORKDIR /

COPY --from=build /server /server

ENTRYPOINT [ "/server" ]