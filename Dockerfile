FROM docker:26.1.0

RUN apk update \
  && apk add --no-cache \
    aws-cli \
    bash \
    curl \
    docker-compose \
    gcc \
    git \
    jq \
    ruby \
    ruby-dev \
    libc-dev \
    libffi-dev \
    make \
    openssh \
    openssl-dev \
    groff

ARG ECS_HELPER_VERSION

RUN gem install ecs_helper $ECS_HELPER_VERSION

RUN mkdir /app
WORKDIR /app
