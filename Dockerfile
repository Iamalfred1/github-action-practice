# sample dockerfile for testing docker builds
FROM nginx:1.20-alpine AS base

RUN apk add --no-cache curl

WORKDIR /test

COPY . .

#########################
FROM base AS test

#layer test tools and assets on top as optional test stage
RUN apk add --no-cache apache2-utils


#########################
FROM base AS final

# this layer gets built by default unless you set target to test
