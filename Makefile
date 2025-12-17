SHELL := /bin/bash -o pipefail -o errexit

EXAMPLE_DOCKERFILES := conda.Dockerfile 

build:  # Build the example docker image
	$(foreach dockerfile,$(EXAMPLE_DOCKERFILES), \
	ANACONDA_AUTH_API_KEY=$${ANACONDA_AUTH_API_KEY:-$$(anaconda auth api-key)} \
	docker build \
		--secret id=ANACONDA_AUTH_API_KEY \
		--file ./examples/$(dockerfile) \
		. ; \
	)

up:  # Run the service using docker-compose
	ANACONDA_AUTH_API_KEY=$$(anaconda auth api-key) \
	docker compose up --build --detach

lock:  # Generate conda-lock file
	conda lock

TEST_DOCKERFILES := conda.Dockerfile conda-lock.Dockerfile

test:  # Build the test docker image
	$(foreach dockerfile,$(TEST_DOCKERFILES), \
	ANACONDA_AUTH_API_KEY=$${ANACONDA_AUTH_API_KEY:-$$(anaconda auth api-key)} \
	docker build \
		--secret id=ANACONDA_AUTH_API_KEY \
		--file ./testing/$(dockerfile) \
		. ; \
	)
