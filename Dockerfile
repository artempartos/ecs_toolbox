FROM docker:20.10.6

ENV CRYPTOGRAPHY_DONT_BUILD_RUST=1

RUN apk update \
  && apk add --no-cache \
    bash \
    curl \
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
    py3-pip \
    python3-dev \
    groff

RUN pip3 install awscli docker-compose

ARG ECS_HELPER_VERSION

RUN gem install ecs_helper $ECS_HELPER_VERSION

RUN mkdir /app
WORKDIR /app