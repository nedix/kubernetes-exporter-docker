setup:
	@docker build . -t kubernetes-exporter

run: config := $(HOME)/.kube/config
run:
	@docker run --rm -it \
		--entrypoint /bin/sh \
		--mount type=bind,source="$(config)",target=/mnt/kubeconfig.yaml,readonly \
		kubernetes-exporter
