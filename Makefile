ALL_JSONNET := $(shell find . -name "*.jsonnet")
VERSION = test

build:
	docker build -t avastsoftware/luftsonnet:$(VERSION) .

ci: build test clean

test:
	$(foreach var, $(ALL_JSONNET),docker run -it --rm -v $$PWD:/wd -w /wd luftsonnet $(var) >| $(var).json)

clean:
	find . -name "*.jsonnet.json" -delete

push:
	docker login -u $$DOCKER_USERNAME -p $$DOCKER_PASSWORD
	docker push avastsoftware/luftsonnet:$(VERSION)
