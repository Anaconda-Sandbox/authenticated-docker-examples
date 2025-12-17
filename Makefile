SHELL := /bin/bash -o pipefail -o errexit

build:  # Build the docker image
	ANACONDA_AUTH_API_KEY=$$(anaconda auth api-key) \
	docker build --secret id=ANACONDA_AUTH_API_KEY .

up:  # Run the service using docker-compose
	ANACONDA_AUTH_API_KEY=$$(anaconda auth api-key) \
	docker compose up --build --detach

lock:  # Generate conda-lock file
	conda lock

test:  # Build the test docker image
	ANACONDA_AUTH_API_KEY=$${ANACONDA_AUTH_API_KEY:-$$(anaconda auth api-key)} \
	docker build \
	  --secret id=ANACONDA_AUTH_API_KEY \
	  --file ./testing/conda.Dockerfile \
	  .

test-conda-lock:  # Build the test docker image using conda-lock
	ANACONDA_AUTH_API_KEY=$${ANACONDA_AUTH_API_KEY:-$$(anaconda auth api-key)} \
	docker build \
	  --secret id=ANACONDA_AUTH_API_KEY \
	  --file ./testing/conda-lock.Dockerfile \
	  .
