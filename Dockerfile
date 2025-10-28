FROM docker:27-cli

RUN apk update && apk upgrade \
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
    openssl-dev \
    py3-pip \
    python3-dev \
    groff \
    aws-cli \
    docker-cli-compose

# Install any additional Python packages if needed
# RUN pip3 install --no-cache-dir --break-system-packages <package>

ARG ECS_HELPER_VERSION

RUN gem install ecs_helper $ECS_HELPER_VERSION

RUN mkdir /app
WORKDIR /app