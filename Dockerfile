FROM golang:alpine AS build

WORKDIR /app

COPY go.mod ./
COPY main.go ./

RUN go build -ldflags '-s -w' main.go

FROM scratch

WORKDIR /

COPY --from=build /app /

ENTRYPOINT [ "/main" ]