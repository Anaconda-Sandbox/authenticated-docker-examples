# Anaconda Docker Examples

This repository contains examples for using `conda` to build Docker images.
Specifically, the examples are targed towards best practice usage when using Anaconda's repositories.

## Example application

The example provided is a simple "Hello World" application using FastAPI.

The following files define the application and its dependencies:

* [`app.py`](./app.py): The application code
* [`environment.yml`](./environment.yml): The conda environment dependency specification

## Local dependencies

The example requires a local installation of `conda` with the `anaconda-auth` package installed:

```shell
conda install --name base anaconda-auth
```

## Building the images

The commands to build the images are stored in [`Makefile`](./Makefile).
By default all of the images in the [`./examples`](.examples) directory.

To build the images:

```shell
make build
```

## Running the service

You ran also build and run the services locally using `docker-compose` (if that is installed):

```shell
make up
```

You can then access the services by visiting e.g. http://localhost:8000 in your web browser.

You can also check with a tool like `curl`:

```shell
❯ curl http://localhost:8000
{"hello":"world"}%
```
