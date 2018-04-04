#!/bin/bash -x

DOCKER=docker

if [[ -e /usr/bin/nvidia-docker ]]; then
    DOCKER=nvidia-docker
fi

$DOCKER run --rm -it -v `pwd`:/allennlp-tutorial -w /allennlp-tutorial -e PYTHONPATH=/stage/allennlp allennlp/allennlp:latest $@

