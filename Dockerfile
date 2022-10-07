# FROM scratch
FROM alpine

ARG ARCH
ARG V=2022.10.0

ADD https://github.com/cloudflare/cloudflared/releases/download/${V}/cloudflared-linux-${ARCH} /cloudflared
RUN chmod +x /cloudflared

RUN adduser -D nonroot
USER nonroot

ENTRYPOINT ["/cloudflared", "--no-autoupdate"]
CMD ["version"]
