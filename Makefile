DOCKER_REGISTRY_ID=101090866516
region=ap-northeast-1
repo=narou
ECR=$(DOCKER_REGISTRY_ID).dkr.ecr.ap-northeast-1.amazonaws.com/$(repo)
TAG=latest

help:
	@echo  "Available targets: help, build, run"

build:
	docker build --build-arg amazon_eula=$(amazon_eula) -t amitsuka/narourb-docker .

push: login tag
	docker push $(ECR):$(TAG)

login:
	$$(aws ecr get-login --no-include-email --registry-ids $(DOCKER_REGISTRY_ID) --region $(region))

tag:
	docker tag amitsuka/narourb-docker $(ECR):$(TAG)

run:
	./narou help
