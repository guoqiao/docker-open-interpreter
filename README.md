# Docker Open Interpreter

Run [open-interpreter](https://github.com/KillianLucas/open-interpreter) in Docker.

DockerHub Image Repo: https://hub.docker.com/r/guoqiao/open-interpreter

GitHub Code Repo: https://github.com/guoqiao/docker-open-interpreter


# Run Open Interpreter with Docker Image

## Run with `gpt-4` model

```
OPENAI_API_KEY=sk-xxx
docker run -it -e OPENAI_API_KEY=${OPENAI_API_KEY} guoqiao/open-interpreter:latest
```

NOTE:
- your api key must have gpt-4 access
- subscription to chatgpt plus doesn't mean your api key has gpt-4 access


## Run with `gpt-3.5-turbo` model

```
OPENAI_API_KEY=sk-xxx
docker run -it -e OPENAI_API_KEY=${OPENAI_API_KEY} guoqiao/open-interpreter:latest interpreter --fast
```

## Run with `code-llama` models

```
OPEN_INTERPRETER_MODELS_DIR=/mnt/storage/open-interpreter-models

docker run -it \
    -v ${OPEN_INTERPRETER_MODELS_DIR}:/root/.local/share/"Open Interpreter"/models  \
    guoqiao/open-interpreter:latest \
    interpreter --local
```

NOTE:
- models are large(e.g.: 2.7G ~ 34G), here we define a folder to download and store them.
- ideally that folder is on your storage drive

## Run with `falcon` models

```
OPEN_INTERPRETER_MODELS_DIR=/mnt/storage/open-interpreter-models

docker run -it \
    -v ${OPEN_INTERPRETER_MODELS_DIR}:/root/.local/share/"Open Interpreter"/models  \
    guoqiao/open-interpreter:latest \
    interpreter --falcon
```
