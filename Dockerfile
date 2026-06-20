FROM alpine:3.22.0

RUN apk add --no-cache tzdata ca-certificates

RUN mkdir -p /CLIProxyAPI/panel

COPY ./CLIProxyAPI /CLIProxyAPI/CLIProxyAPI
COPY ./panel/ /CLIProxyAPI/panel/

COPY ./config.yaml /CLIProxyAPI/config.yaml

WORKDIR /CLIProxyAPI

EXPOSE 8317

ENV TZ=Asia/Shanghai \
    MANAGEMENT_PANEL_DIR=/CLIProxyAPI/panel \
    CLIRELAY_LOCALE=zh

CMD ["./CLIProxyAPI"]
