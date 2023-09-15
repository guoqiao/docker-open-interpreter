SHELL := /bin/bash

build:
	docker build -t guoqiao/open-interpreter:latest .

push:
	docker push guoqiao/open-interpreter:latest

shell:
	source .env && docker run -it --env-file .env \
		guoqiao/open-interpreter:latest \
		bash

run:
	source .env && docker run -it --env-file .env \
		guoqiao/open-interpreter:latest \
		interpreter

fast:
	source .env && docker run -it --env-file .env \
		guoqiao/open-interpreter:latest \
		interpreter --fast

local:
	source .env && docker run -it --env-file .env \
		-v ${OPEN_INTERPRETER_MODELS_DIR}:/root/.local/share/"Open Interpreter"/models  \
		guoqiao/open-interpreter:latest \
		interpreter --local

falcon:
	source .env && docker run -it --env-file .env \
		-v ${OPEN_INTERPRETER_MODELS_DIR}:/root/.local/share/"Open Interpreter"/models  \
		guoqiao/open-interpreter:latest \
		interpreter --falcon

up:
	@echo "start container with docker-compose"
	docker-compose --verbose up --force-recreate --remove-orphans

attach:
	@echo "attach to container started by docker-compose"
	docker-compose --verbose exec app bash
