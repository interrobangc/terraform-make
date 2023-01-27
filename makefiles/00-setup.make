DOCKER_IMAGE ?= interrobangc/terraform
TF_VER ?= 1.3.0

MY_PWD ?= $(shell git rev-parse --show-toplevel)

MY_ENV := $(shell basename $(CURDIR))
MY_RELATIVE_PATH := $(shell echo $(CURDIR) | sed -e "s|$(MY_PWD)||")
DIND_ARG = -v /var/run/docker.sock:/var/run/docker.sock

PWD_ARG = -v $(MY_PWD):/app -w /app$(MY_RELATIVE_PATH)
ENV_ARG = -e MY_ENV=$(MY_ENV) -e TF_LOG
SECRETS = -e AWS_DEFAULT_REGION -e AWS_SECRET_ACCESS_KEY -e AWS_ACCESS_KEY_ID -v ~/.aws:/root/.aws -e GITHUB_OWNER -e GITHUB_TOKEN

DEFAULT_ARGS = $(SECRETS) $(PWD_ARG) $(ENV_ARG) $(DIND_ARG)
