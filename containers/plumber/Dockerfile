FROM rocker/r-base

RUN apt-get update -qq && apt-get install -y \
    git-core \
    libssl-dev \
    libcurl4-gnutls-dev

RUN install2.r plumber
RUN install2.r BCRA

WORKDIR /app

RUN rm -rf ./*

COPY app .

CMD ./run.sh $PORT

