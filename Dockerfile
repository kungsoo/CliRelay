FROM alpine:3.22.0

RUN apk add --no-cache tzdata

RUN mkdir -p /CLIProxyAPI/static /CLIProxyAPI/data

COPY ./CLIProxyAPI /CLIProxyAPI/CLIProxyAPI
COPY ./static/management.html /CLIProxyAPI/static/management.html

COPY ./config.yaml /CLIProxyAPI/config.yaml

WORKDIR /CLIProxyAPI

EXPOSE 8317

ENV TZ=Asia/Shanghai
ENV MANAGEMENT_STATIC_PATH=/CLIProxyAPI/static/management.html

CMD ["./CLIProxyAPI"]
