SHELL := /bin/bash -o pipefail -o errexit

build:  # Build the docker image
	docker build .

up:  # Run the service using docker-compose
	docker compose up --build api -d
