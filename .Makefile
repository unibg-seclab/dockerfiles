.PHONY: build run push

ORG    :=  unibgseclab
TAG    :=  $(notdir $(PWD))
NAME   :=  $(shell basename $(dir $(PWD)))
IMAGE  :=  $(ORG)/$(NAME):$(TAG)

build:
	docker build -t $(IMAGE) .

run:
	docker run -it $(IMAGE) /bin/bash

push:
	docker push $(IMAGE)
