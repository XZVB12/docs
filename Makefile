REPO=maliceio/docs
ORG=malice
NAME=docs
VERSION=$(shell cat VERSION)

all: build size test

.PHONY: build
build: ## Build docker image
	docker build -t $(ORG)/$(NAME):$(VERSION) .

.PHONY: size
size: tags ## Update docker image size in README.md
	sed -i.bu 's/docker%20image-.*-blue/docker%20image-$(shell docker images --format "{{.Size}}" $(ORG)/$(NAME):$(VERSION)| cut -d' ' -f1)-blue/' README.md

.PHONY: tags
tags: ## Show all docker image tags
	docker images --format "table {{.Repository}}\t{{.Tag}}\t{{.Size}}" $(ORG)/$(NAME)

.PHONY: tar
tar: ## Export tar of docker image
	docker save $(ORG)/$(NAME):$(VERSION) -o $(NAME).tar

.PHONY: ssh
ssh: ## SSH into docker image
	@docker run -it --rm -p 3993:3993 -p 9200:9200 --entrypoint=sh $(ORG)/$(NAME):$(VERSION)

.PHONY: test
test: ## Test hugo docs
	@open http://127.0.0.1
	@docker run --init -d -p 80:80 $(ORG)/$(NAME):$(VERSION)

.PHONY: dev
dev: ## Start dev server
	@open http://localhost:1313/
	@hugo server --theme=hugo-material-docs --buildDrafts

.PHONY: circle ## Get docker image size from CircleCI
circle:
	@sed -i.bu 's/docker%20image-.*-blue/docker%20image-$(shell cat .circleci/SIZE)-blue/' README.md
	@echo "===> Image size is: $(shell cat .circleci/SIZE)"

ci-build:
	@echo "===> Getting CircleCI build number"
	@http https://circleci.com/api/v1.1/project/github/${REPO} | jq '.[0].build_num' > .circleci/build_num

ci-size: ci-build
	@echo "===> Getting image build size from CircleCI"
	@http "$(shell http https://circleci.com/api/v1.1/project/github/${REPO}/$(shell cat .circleci/build_num)/artifacts circle-token==${CIRCLE_TOKEN} | jq '.[].url')" > .circleci/SIZE

.PHONY: clean
clean: ## Clean docker image and stop all running containers
	docker-clean stop
	docker rmi $(ORG)/$(NAME):$(VERSION) || true
	docker rmi $(ORG)/$(NAME):node || true

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help
