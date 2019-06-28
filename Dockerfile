FROM rocker/rstudio:latest

ARG REPO_URL="https://github.com/timtrice/twitter_api.git"
ARG DIR="twitter_api"

ENV ENV_REPO_URL=$REPO_URL
ENV ENV_DIR=$DIR

RUN apt-get update \
  && apt-get install -y \
    libxml2-dev \
    vim

RUN cd /home/rstudio \
  && git clone $ENV_REPO_URL \
  && cd $ENV_DIR \
  && Rscript --verbose code/01_install_packages.R
