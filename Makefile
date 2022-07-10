#!make

CTR_REGISTRY ?= flomesh
CTR_TAG      ?= latest

ARCH_MAP_x86_64 := amd64
ARCH_MAP_arm64 := arm64
ARCH_MAP_aarch64 := arm64

DEMO_ARCH := $(ARCH_MAP_$(shell uname -m))
DEMO_OS := $(shell uname -s | tr '[:upper:]' '[:lower:]')
DEMO_OSM_CLI_VERSION := v1.1.0

check-env:
ifndef CTR_REGISTRY
	$(error CTR_REGISTRY environment variable is not defined; see the .env.example file for more information; then source .env)
endif
ifndef CTR_TAG
	$(error CTR_TAG environment variable is not defined; see the .env.example file for more information; then source .env)
endif

bin/osm:
	@./scripts/install-osm-cli.sh ${DEMO_ARCH} ${DEMO_OS} ${DEMO_OSM_CLI_VERSION}

.env:
	@cp .env.example .env

.PHONY: kind-install
kind-install:
	@./scripts/install-docker.sh
	@./scripts/install-k8s-tools.sh ${DEMO_ARCH} ${DEMO_OS}

.PHONY: kind-up
kind-up:
	@./scripts/kind-with-registry.sh

.PHONY: kind-demo
kind-demo: export CTR_REGISTRY=flomesh
kind-demo: .env bin/osm kind-up demo-up

.PHONY: kind-reset
kind-reset:
	@kind delete cluster --name osm

.PHONY: demo-up
demo-up: .env bin/osm
	@./demo/run-osm-demo.sh

.PHONY: demo-forward
demo-forward: .env bin/osm
	@./scripts/port-forward-all.sh

.PHONY: demo-reset
demo-reset: .env bin/osm
	@./demo/clean-kubernetes.sh