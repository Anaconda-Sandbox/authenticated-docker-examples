# Stage 1: Use the miniconda base image to create a new conda environment for our runtime
FROM continuumio/miniconda3:25.3.1-1 AS builder

# Install a test plugin which will inject HTTP headers to trigger server-side behavior
COPY ./testing/conda-test-header-plugin ./conda-test-header-plugin
RUN conda run --name base --live-stream pip install --no-deps ./conda-test-header-plugin

# Install the required tools
RUN conda install \
    --name base \
    --channel https://repo.anaconda.cloud/repo/anaconda-tools \
    --override-channels \
    anaconda-registration

# Install conda-lock
RUN --mount=type=secret,id=ANACONDA_AUTH_API_KEY \
  conda install \
    --name base \
    conda-lock

# Copy lockfile(s) only, for better caching
COPY ./conda-lock.yml ./conda-lock.yml

# Create the conda environment via conda-lock
RUN --mount=type=secret,id=ANACONDA_AUTH_API_KEY \
  conda lock install --prefix /env
