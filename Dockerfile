ARG TOOLS_VERSION=v2.0.1

FROM --platform=$BUILDPLATFORM ghcr.io/nedix/kubernetes-tools-docker:${TOOLS_VERSION}-scratch as tools

FROM --platform=$BUILDPLATFORM alpine:3.18

COPY --chown=nobody --from=tools / /

RUN apk add \
        bash \
    && kubectl krew install \
        neat

COPY --chown=nobody rootfs /

WORKDIR /project

ENV ENV /etc/profile

ENTRYPOINT ["kubectl", "export"]
