help:
	@echo  "Available targets: help, build, run"

build:
	docker build --build-arg amazon_eula=$(amazon_eula) -t amitsuka/narourb-docker .

run:
	./narou help
