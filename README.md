A simple example for how to build your own model using AllenNLP as a dependency.  An explanation
of all of the code in this repository is given in an [AllenNLP
tutorial](https://github.com/allenai/allennlp/blob/master/tutorials/getting_started/using_in_your_repo.md).

There are two main pieces of code you need to write in order to make a new model: a
`DatasetReader` and a `Model`.  In this repository, we constructed a `DatasetReader` for reading
academic papers formatted as a JSON lines file (you can see an example of the data in
[`tests/fixtures/s2_papers.jsonl`](tests/fixtures/s2_papers.jsonl)).  We then constructed a model
to classify the papers given some label (which we specified as the paper's venue in the
`DatasetReader`).  Finally, we added a script to use AllenNLP's training commands from a
third-party repository, and an experiment configuration for running a real model on real data.

To get the Glove embeddings and the training data once and for all run: `./get_data.sh`

To run within docker prepend `./run.sh`

```bash
python -m allennlp.run train experiments/venue_classifier.json -s experiment_output_dir --include-package my_library
```

To speed iteration, training and validation files are heavily reduced. You can switch to the full version modifying the `experiments/venue_classifier.json`

### Docs

To see a demo of some standard models: `http://demo.allennlp.org/`

To see what modules are available check: `https://allenai.github.io/allennlp-docs/`


### Tasks

1. Run it once, observe the logs

2. What is saved in the output directory?

3. Can you make the encoders bidirectional?

	*Hint:* check your sizes

4. Can you add a learning rate scheduler? (as in [SGDR: Stochastic Gradient Descent with Warm Restarts](https://arxiv.org/abs/1608.03983))

	*Hint:* this comes from PyTorch directy

5. Can you add a character embedding module in conjunction to the word one?

	*Hint:* you need a `token_indexer` and a `text_field_embedder`
