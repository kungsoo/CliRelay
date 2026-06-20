FROM alpine:3.22.0

RUN apk add --no-cache tzdata ca-certificates

RUN mkdir -p /CLIProxyAPI/panel

COPY --from=backend-builder /app/CLIProxyAPI /CLIProxyAPI/CLIProxyAPI
COPY --from=backend-builder /app/clirelay-updater /CLIProxyAPI/clirelay-updater
COPY --from=frontend-builder /frontend/dist/ /CLIProxyAPI/panel/

COPY config.example.yaml /CLIProxyAPI/config.example.yaml

WORKDIR /CLIProxyAPI

EXPOSE 8317

ENV TZ=Asia/Shanghai \
    MANAGEMENT_PANEL_DIR=/CLIProxyAPI/panel \
    CLIRELAY_LOCALE=zh

CMD ["./CLIProxyAPI"]
