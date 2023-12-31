FROM golang:1.21.4 AS builder
RUN go version

WORKDIR /temp/
COPY . .
ENV CGO_ENABLED=0
RUN make build

FROM scratch
COPY --from=builder /temp/shorter_cli /shorter_cli

ENTRYPOINT ["/shorter_cli"]