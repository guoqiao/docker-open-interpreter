#!/bin/bash

dotenv=${1:-.env}

source ${dotenv}

docker run -it \
    --env-file ${dotenv} \
    -v ${OPEN_INTERPRETER_MODELS_DIR}:/root/.local/share/"Open Interpreter"/models  \
    guoqiao/open-interpreter:latest \
    interpreter "${OPEN_INTERPRETER_CLI_ARGS}"
