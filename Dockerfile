FROM serjs/go-socks5-proxy as built

FROM debian:bookworm-20240513
COPY --from=built /socks5 /
RUN apt update && \
    apt install -y iproute2 socat
ENTRYPOINT ["/socks5"]
