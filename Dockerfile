ARG ARCH
ARG V=2022.4.1

# FROM scratch
FROM alpine

ADD https://github.com/cloudflare/cloudflared/releases/download/${V}/cloudflared-linux-${ARCH} /cloudflared
RUN chmod +x /cloudflared

RUN adduser -D nonroot
USER nonroot

ENTRYPOINT ["/cloudflared", "--no-autoupdate"]
CMD ["version"]
