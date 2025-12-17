SHELL := /bin/bash -o pipefail -o errexit

build:  # Build the docker image
	docker build .
