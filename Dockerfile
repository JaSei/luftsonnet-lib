FROM ksonnet/ksonnet-lib:beta.2
COPY luft.libsonnet /usr/share/v0.9.4
ENTRYPOINT ["jsonnet"]
