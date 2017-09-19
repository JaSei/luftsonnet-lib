ALL_JSONNET := $(shell find . -name "*.jsonnet")
IMAGE_NAME := avastsoftware/luftsonnet
ACTUAL_IMAGE := $(IMAGE_NAME):$$TRAVIS_COMMIT

build:
	docker build -t $(ACTUAL_IMAGE) .

ci: build test clean

test:
	$(foreach var, $(ALL_JSONNET),docker run -it --rm -v $$PWD:/wd -w /wd $(ACTUAL_IMAGE) $(var) >| $(var).json)

clean:
	find . -name "*.jsonnet.json" -delete

push:
	docker login -u $$DOCKER_USERNAME -p $$DOCKER_PASSWORD
	docker tag $(ACTUAL_IMAGE) $(IMAGE_NAME):$$TRAVIS_TAG
	docker push $(IMAGE_NAME):$$TRAVIS_TAG
