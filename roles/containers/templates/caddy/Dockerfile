FROM caddy:builder AS builder

RUN xcaddy build \
    --with github.com/dulli/caddy-wol \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.6

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
