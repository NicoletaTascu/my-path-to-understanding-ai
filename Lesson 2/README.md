# Lesson 2 --- Inside a Neural Network

In Lesson 1, I followed the journey from data to a prediction:

``` text
Dataset
   ↓
Training
   ↓
Model
   ↓
New Data
   ↓
Inference
   ↓
Prediction
```

But one part was still mostly a black box:

``` text
Input
  ↓
[ MODEL ]
  ↓
Output
```

In this lesson, I start opening that box.

The goal is not to jump directly into complex mathematics. I want to
understand, step by step, how a very simple neuron makes a decision, how
training improves that decision, and how many neurons can work together
as a neural network.

## Parts

### [Part 1 --- Meet the Perceptron](./part-1-meet-the-perceptron.md)

Inputs, weights, weighted sum, bias, activation function, and output.

### [Part 2 --- Prediction, Label, and Loss](./part-2-prediction-label-and-loss.md)

What happens when the perceptron makes a prediction, how we know whether
it was correct, and why we need Loss.

### [Part 3 --- From Error to Learning](./part-3-from-error-to-learning.md)

Gradient, Gradient Descent, Learning Rate, and Backpropagation --- the
pieces that help the model adjust its parameters.

### [Part 4 --- From One Neuron to a Neural Network](./part-4-from-one-neuron-to-a-neural-network.md)

Layers, hidden layers, connections between neurons, and the first
intuition behind Deep Learning.

------------------------------------------------------------------------

The question that starts this lesson is simple:

> **What actually happens inside a neural network?**

➡️ **Start here: [Part 1 --- Meet the
Perceptron](./part-1-meet-the-perceptron.md)**
