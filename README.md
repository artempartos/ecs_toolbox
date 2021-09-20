# ECS Toolbox

## General Information
This is the docker image which could be used to help with some CI/CD process with AWS ECS service

## How to use
`docker build .`

`docker build --build-arg ECS_HELPER_VERSION="-v x.x.x" .` - if you want to specify gem version to work with ECS

If new version of gem was released, you can just do

`VERSION=x.x.x make release`




