red='\e[21;31m%s\e[0m\n'
green='\e[21;32m%s\e[0m\n'
yellow='\e[21;33m%s\e[0m\n'
blue='\e[21;34m%s\e[0m\n'
magenta='\e[21;35m%s\e[0m\n'
cyan='\e[21;36m%s\e[0m\n'
white='\e[21;97m%s\e[0m\n'

LOCAL_PORT=8080
DOCKER_PORT=80
DOCKER_TAG=vue-frontend-template
DOCKER_DEBUG=--quiet

.PHONY: setup-docker
setup:
	@echo $(shell printf "$(yellow)"  "removing node_modules/ folder")
	@echo $(shell printf "$(white)" "====================================")
	rm -rf node_modules/
	@echo $(shell printf "$(yellow)" "install dependencies via npm install")
	@echo $(shell printf "$(white)" "====================================")
	npm install --silent

.PHONY: mount-docker
mount-docker:
	@echo $(shell printf "$(yellow)" "build docker container with tag: $(DOCKER_TAG)")
	@echo $(shell printf "$(white)" "====================================")
	docker build $(DOCKER_DEBUG) -t $(DOCKER_TAG) .
	@echo $(shell printf "$(green)" "Starting HTTP Server on port $(LOCAL_PORT)")
	@echo $(shell printf "$(green)" "done: >> Navigate to http://localhost:$(LOCAL_PORT) to see your app running in Docker")
	@echo $(shell printf "$(white)" "====================================")
	docker run --rm -p${LOCAL_PORT}:${DOCKER_PORT} ${DOCKER_TAG}

.PHONY: run-prod
run-prod:
	make setup
	@echo $(shell printf "$(yellow)" "build static files, and copy them to dist/ folder")
	@echo $(shell printf "$(white)" "====================================")
	npm run build:prod
	make mount-docker

.PHONY: run-stg
run-stg:
	make setup
	@echo $(shell printf "$(yellow)" "build static files, and copy them to dist/ folder")
	@echo $(shell printf "$(white)" "====================================")
	npm run build:stg
	make mount-docker
