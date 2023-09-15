# Docker Open Interpreter

Run [open-interpreter](https://github.com/KillianLucas/open-interpreter) in Docker.

GitHub Repo: https://github.com/guoqiao/docker-open-interpreter

DockerHub Repo: https://hub.docker.com/r/guoqiao/open-interpreter

# Use Docker Image

You can try open-interpreter via this docker image directly with following commands.

## Run with default

```
docker run -it guoqiao/open-interpreter:latest
```

## Run with shell

Start a container with shell, then you can try different options yourself:

```
docker run -it guoqiao/open-interpreter:latest bash
interpreter -h
```

## Run with `gpt-4` model

In `.env`:

```
OPENAI_API_KEY=sk-xxx
```

Run:
```
docker run -it --env-file .env guoqiao/open-interpreter:latest
```

NOTE:
- your api key must have gpt-4 access
- subscription to chatgpt plus doesn't mean your api key has gpt-4 access


## Run with `gpt-3.5-turbo` model

In `.env`:

```
OPENAI_API_KEY=sk-xxx
INTERPRETER_CLI_FAST_MODE=True
```

Run:
```
docker run -it --env-file .env guoqiao/open-interpreter:latest
```

## Run with `code-llama` models

In `.env`:

```
INTERPRETER_CLI_LOCAL_RUN=True
OPEN_INTERPRETER_MODELS_DIR=/mnt/storage/open-interpreter-models
```

Run:
```
source .env && \
docker run -it \
    --env-file .env \
    -v ${OPEN_INTERPRETER_MODELS_DIR}:/root/.local/share/"Open Interpreter"/models  \
    guoqiao/open-interpreter:latest
```

NOTE:
- models are large(e.g.: 2.7G ~ 34G), here we define a folder to download and store them.
- ideally that folder is on your storage drive


## Run with `falcon` models

In `.env`:

```
OPEN_INTERPRETER_MODELS_DIR=/mnt/storage/open-interpreter-models
```

```
source .env && \
docker run -it \
    -v ${OPEN_INTERPRETER_MODELS_DIR}:/root/.local/share/"Open Interpreter"/models  \
    guoqiao/open-interpreter:latest \
    interpreter --falcon
```

# Use Git Repo

You can also clone this repo to try if you hate above long commands:

```
git clone https://github.com/guoqiao/docker-open-interpreter.git
cd docker-open-interpreter
```

Then you can use any of the following ways to try the container.

## `docker-run.sh` script

```
cp .env-example .env
# modify .env to meet your needs
./docker-run.sh
```

## docker-compose

Start the container via docker-compose:
```
docker-compose up
```
This will start a shell in the container. Then you can attach to it and have fun:

```
docker-compose exec app bash
```

## Makefile

You can also use `Makefile` as shortcuts. E.g.:
```
cp .env-example .env
# modify .env to meet your needs

make build
make shell
make run
make fast
make local
make falcon
# for docker-compose
make up
make attach
```

See `Makefile` for details.
