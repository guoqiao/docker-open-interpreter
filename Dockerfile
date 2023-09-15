FROM python:bookworm

RUN apt-get update && apt-get upgrade -y && apt-get install -y cmake

RUN python3 -m pip install -U \
        open-interpreter \
        requests \
        llama-cpp-python \
        numpy \
        matplotlib \
        pandas \
        pip

WORKDIR /root

CMD ["interpreter"]
