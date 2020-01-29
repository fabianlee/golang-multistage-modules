OWNER := fabianlee
PROJECT := golang-multistage-modules
VERSION := 1.0.0
OPV := $(OWNER)/$(PROJECT):$(VERSION)

## builds docker image
docker-build:
	sudo docker build -f Dockerfile -t $(OPV) .

## builds docker image
docker-build-mybranch1:
	sudo docker build -f Dockerfile --build-arg BRANCH=mybranch1 -t $(OPV) .

## cleans docker image
clean:
	sudo docker image rm $(OPV) | true

## runs container in foreground, using default args
docker-test:
	sudo docker run -it --rm $(OPV)

## runs container in foreground, override entrypoint to use use shell
docker-test-cli:
	sudo docker run -it --rm --entrypoint "/bin/sh" $(OPV)

## pushes to docker hub
docker-push:
	sudo docker push $(OPV)

