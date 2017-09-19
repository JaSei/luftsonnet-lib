ALL_JSONNET := $(shell find . -name "*.jsonnet")

build:
	docker build -t avastsoftware/luftsonnet:$$TRAVIS_COMMIT .

ci: build test clean

test:
	$(foreach var, $(ALL_JSONNET),docker run -it --rm -v $$PWD:/wd -w /wd luftsonnet $(var) >| $(var).json)

clean:
	find . -name "*.jsonnet.json" -delete

push:
	docker login -u $$DOCKER_USERNAME -p $$DOCKER_PASSWORD
	docker tag avastsoftware/luftsonnet:$$TRAVIS_COMMIT avastsoftware/luftsonnet:$$TRAVIS_TAG
	docker push avastsoftware/luftsonnet:$$TRAVIS_TAG
