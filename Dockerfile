FROM rust:1.59-alpine3.15 as builder
ARG VERSION
RUN apk add --no-cache --virtual .build-deps \
        git \
        make \
        musl-dev \
        openssl-dev \
        perl \
        pkgconfig \
    && git clone https://github.com/k4yt3x/simple-http-server-1.git /simple-http-server \
    && cd /simple-http-server \
    && cargo build --release --target x86_64-unknown-linux-musl

FROM gcr.io/distroless/static:nonroot
LABEL maintainer="K4YT3X <i@k4yt3x.com>" \
      org.opencontainers.image.source="https://github.com/k4yt3x/simple-http-server" \
      org.opencontainers.image.description="A minimal distroless container image for TheWaWaR/simple-http-server"
COPY --from=builder --chmod=755 /simple-http-server/target/x86_64-unknown-linux-musl/release/simple-http-server \
    /usr/local/bin/simple-http-server
USER nonroot:nonroot
ENTRYPOINT ["/usr/local/bin/simple-http-server"]
