#!/bin/bash -x

mkdir -p glove
wget https://s3-us-west-2.amazonaws.com/allennlp/datasets/glove/glove.6B.100d.txt.gz -O glove/glove.6B.100d.txt.gz

mkdir data
wget https://s3-us-west-2.amazonaws.com/allennlp/datasets/academic-papers-example/train.jsonl -O data/train.jsonl
wget https://s3-us-west-2.amazonaws.com/allennlp/datasets/academic-papers-example/dev.jsonl -O data/dev.jsonl
head -n 3000 data/train.jsonl > data/train_small.jsonl
head -n 500 data/dev.jsonl > data/dev_small.jsonl
