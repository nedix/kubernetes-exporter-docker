ARG TOOLS_VERSION=v0.67.0

FROM --platform=$BUILDPLATFORM ghcr.io/nedix/kubernetes-tools-docker:${TOOLS_VERSION}

RUN apk add \
        bash \
    && kubectl krew install \
        neat

COPY --chown=nobody rootfs /

WORKDIR /project

ENV ENV /etc/profile

ENTRYPOINT ["kubectl", "export"]
