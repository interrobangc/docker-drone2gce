.PHONY: build run

IMAGE_BASE = interrobangc
IMAGE = drone2gce
MY_PWD = $(shell pwd)

all: build

build:
	docker build -t $(IMAGE_BASE)/$(IMAGE) -f $(MY_PWD)/Dockerfile $(MY_PWD)

test:
	docker run -it --rm -v $(MY_PWD)/.env:/app/.env --name $(IMAGE_BASE)-$(IMAGE)-test $(IMAGE_BASE)/$(IMAGE)

run:
	docker run -it --rm -v $(MY_PWD):/app --name $(IMAGE_BASE)-$(IMAGE) $(IMAGE_BASE)/$(IMAGE)

shell:
	docker run -it --rm -v $(MY_PWD):/app --name $(IMAGE_BASE)-$(IMAGE)-shell $(IMAGE_BASE)/$(IMAGE) bash