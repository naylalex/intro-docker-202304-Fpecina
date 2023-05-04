FROM golang:latest AS compilado

WORKDIR /app

COPY dispatcher.go ./
COPY static ./static

RUN CGO_ENABLED=0 go build dispatcher.go
FROM alpine:latest AS production

WORKDIR /

COPY --from=compilado /app/dispatcher /dispatcher
COPY --from=compilado /app/static /static

ENTRYPOINT ["/dispatcher"]

EXPOSE 80