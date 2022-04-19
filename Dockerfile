# FROM scratch
FROM alpine

ADD https://github.com/cloudflare/cloudflared/releases/download/2022.4.1/cloudflared-linux-${TARGETARCH} /cloudflared
RUN chmod 755 /cloudflared

RUN adduser -D nonroot
USER nonroot

ENTRYPOINT ["/cloudflared", "--no-autoupdate"]
CMD ["version"]
