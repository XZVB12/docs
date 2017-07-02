REPO=maliceio/docs
ORG=maliceio
NAME=docs
VERSION=$(shell cat VERSION)

all: build size test

build:
	docker build -t $(ORG)/$(NAME):$(VERSION) .

size:
	sed -i.bu 's/docker%20image-.*-blue/docker%20image-$(shell docker images --format "{{.Size}}" $(ORG)/$(NAME):$(VERSION)| cut -d' ' -f1)-blue/' README.md

tags:
	docker images --format "table {{.Repository}}\t{{.Tag}}\t{{.Size}}" $(ORG)/$(NAME)

tar:
	docker save $(ORG)/$(NAME):$(VERSION) -o $(NAME).tar

test:
	# docker-compose -f ./docker-compose.ci.yml up -d
	# docker-compose -f docker-compose.ci.yml run httpie http://engine:3333/login username=admin password=admin

circle:
	http https://circleci.com/api/v1.1/project/github/${REPO} | jq '.[0].build_num' > .circleci/build_num
	http "$(shell http https://circleci.com/api/v1.1/project/github/${REPO}/$(shell cat .circleci/build_num)/artifacts${CIRCLE_TOKEN} | jq '.[].url')" > .circleci/SIZE
	sed -i.bu 's/docker%20image-.*-blue/docker%20image-$(shell cat .circleci/SIZE)-blue/' README.md

clean:
	docker-clean stop
	docker rmi maliceengine_httpie
	docker rmi $(ORG)/$(NAME)
	docker rmi $(ORG)/$(NAME):$(VERSION)

.PHONY: build size tags test clean circle
