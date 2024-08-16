FROM registry.access.redhat.com/ubi9/go-toolset AS builder

USER 1001

WORKDIR /opt/app-root/src

COPY main.go .

RUN go mod init com.martinmurphy.test
RUN go build -o doit main.go

FROM scratch

WORKDIR /app

COPY --from=builder /opt/app-root/src/doit .

ENTRYPOINT ["/app/doit"]



