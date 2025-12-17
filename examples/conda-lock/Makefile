SHELL := /bin/bash -o pipefail -o errexit

build:  # Build the docker image
	ANACONDA_AUTH_API_KEY=$$(anaconda auth api-key) \
	docker build --secret id=ANACONDA_AUTH_API_KEY .

lock:  # Generate conda-lock files
	conda lock
