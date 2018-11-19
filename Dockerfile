FROM ubuntu:16.04

# Install dependencies
RUN apt-get update --yes && apt-get upgrade --yes
RUN apt-get install git nodejs npm \
libcairo2-dev libjpeg8-dev libpango1.0-dev libgif-dev libpng-dev build-essential g++ \
ffmpeg \
redis-server --yes

RUN ln -s `which nodejs` /usr/bin/node

# setup the app dir
RUN mkdir /app
WORKDIR /app

# add node_modules/.bin to the PATH
ENV PATH /app/node_modules/.bin:$PATH

COPY package.json ./

# Install dependencies
RUN npm install

# Non-privileged user
# RUN useradd -m audiogram
# USER audiogram

# copy the source
COPY . /app
WORKDIR /app
