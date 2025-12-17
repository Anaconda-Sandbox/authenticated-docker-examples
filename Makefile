SHELL := /bin/bash -o pipefail -o errexit

build:  # Build the docker image
	ANACONDA_AUTH_API_KEY=$$(anaconda auth api-key) docker build .

up:  # Run the service using docker-compose
	ANACONDA_AUTH_API_KEY=$$(anaconda auth api-key) docker compose up --build api -d
