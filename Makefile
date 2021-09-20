PREFIX=partos/ecs_toolbox
VERSION_TAG=${PREFIX}:${VERSION}
LATEST_TAG=${PREFIX}:latest

define check_variable
	if [[ -z "${$(1)}" ]] ; then printf "${RED}$(1) is not set${NO_COLOR}\n"; exit 1 ; fi
endef

check_version:
	$(call check_variable,VERSION)

build:
	docker build --build-arg ECS_HELPER_VERSION="-v ${VERSION}" . -t ${VERSION_TAG} -t ${LATEST_TAG}

push:
	docker push ${VERSION_TAG}

release: check_version build push

.SILENT: check_version