# simple-http-server Minimal Distroless Container Image

A minimal distroless container image for simple [TheWaWaR/simple-http-server](https://github.com/TheWaWaR/simple-http-server).

## Usages

The image's `ENTRYPOINT` is set to simple-http-server's binary, so the `CMD` can be set to the arguments that should be passed to the binary. Below is an example:

```shell
docker run -it --rm ghcr.io/k4yt3x/simple-http-server:0.6.1 --upload
```
