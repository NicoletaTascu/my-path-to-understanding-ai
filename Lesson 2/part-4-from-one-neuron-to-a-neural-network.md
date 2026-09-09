# Part 4 --- From One Neuron to a Neural Network

A single perceptron can make a relatively simple decision.

For example:

> **Is this house large or not?**

But real-world problems are much more complex.

We need models that can combine many pieces of information and learn
more complicated relationships.

This is where we move from one neuron to **many connected neurons**.

------------------------------------------------------------------------

# 1. From a Perceptron to Layers

A simple neural network can be imagined as:

``` text
Input Layer
     ↓
Hidden Layer
     ↓
Output Layer
```

Instead of one neuron, we now have multiple neurons.

Each neuron still follows the mechanism we already learned:

``` text
Inputs
   ↓
Weights
   ↓
Weighted Sum
   ↓
Bias
   ↓
Activation
   ↓
Output
```

The mechanism didn't disappear.

We are repeating and connecting it.

------------------------------------------------------------------------

# 2. What Does a Layer Do?

A layer contains neurons that process information.

A simplified flow is:

``` text
Input
  ↓
Layer 1
  ↓
Layer 2
  ↓
Layer 3
  ↓
Output
```

Each layer receives information, transforms it, and passes results
forward.

One of the important things I had to understand was:

> **The output of a neuron in one layer can become input for neurons in
> the next layer.**

Not normally for another neuron in the same layer in the simple
feed-forward model I'm learning here.

So:

``` text
Layer 1                  Layer 2

[Neuron A] ───────────→ [Neuron D]
[Neuron B] ───────────→ [Neuron E]
[Neuron C] ───────────→ [Neuron F]
```

And a neuron in Layer 2 can receive outputs from several neurons in
Layer 1.

------------------------------------------------------------------------

# 3. Connections Have Weights

Suppose a neuron in Layer 1 produces:

``` text
output = 0.8
```

When this value reaches a neuron in the next layer, it becomes an input
to that neuron.

The connection has its own weight:

``` text
Layer 1 output = 0.8
        │
        └──× weight ──→ neuron in Layer 2
```

So weights live on the connections between neurons.

The next neuron then performs its own calculation:

``` text
Inputs
   ↓
× Weights
   ↓
Weighted Sum
   ↓
+ Bias
   ↓
Activation
   ↓
Output
```

That output can then continue to another layer.

------------------------------------------------------------------------

# 4. Hidden Layers

A **hidden layer** is a layer between the original input and the final
output.

``` text
Input Layer
     ↓
Hidden Layer
     ↓
Output Layer
```

It isn't "hidden" because it is secret.

It is simply not the original input layer or the final output layer.

A network can have:

-   one hidden layer;
-   multiple hidden layers.

These layers allow the network to repeatedly transform and combine
information.

------------------------------------------------------------------------

# 5. Back to Cats 🐱

Let's return to the image example from Lesson 1.

The model receives an image.

At the beginning, the input is numerical information representing the
image.

A very simplified intuition is:

``` text
Image
  ↓
Input Layer
  ↓
Hidden Layer 1
  ↓
Hidden Layer 2
  ↓
Output Layer
  ↓
Cat
```

Successive layers can build increasingly useful internal representations
from what previous layers produced.

An intuitive story might look like:

``` text
Image
  ↓
simple visual patterns
  ↓
combinations of patterns
  ↓
more complex representations
  ↓
Cat
```

But I need to be careful with this analogy.

It is tempting to say:

``` text
Neuron 1 = ear
Neuron 2 = eye
Neuron 3 = whiskers
```

That would be too literal.

> **The network learns mathematical representations. We should not
> assume that an individual neuron literally "knows" that it sees an ear
> or an eye.**

The example is useful for intuition, not as a literal map of what every
neuron represents.

------------------------------------------------------------------------

# 6. Information Moves Through the Network

The idea that helped me connect everything is:

``` text
Layer 1
   ↓
produces outputs
   ↓
Layer 2 receives them as inputs
   ↓
produces new outputs
   ↓
Layer 3 receives them
   ↓
...
```

So:

> **The output of one layer becomes input for the next layer.**

And each neuron in that next layer has its own weighted connections,
bias, and activation.

This means the same mechanism I learned with the perceptron appears
repeatedly throughout the network.

------------------------------------------------------------------------

# 7. Deep Learning

If a neural network contains multiple layers of processing, we begin to
enter the idea of **Deep Learning**.

For now, I only need the high-level intuition:

``` text
Input
  ↓
Hidden Layer
  ↓
Hidden Layer
  ↓
Hidden Layer
  ↓
Output
```

More layers allow the network to build increasingly complex
transformations and representations.

I don't need to treat "deep" as mysterious.

It starts with the same building block:

``` text
Input → Weight → Weighted Sum → Bias → Activation → Output
```

repeated across many neurons and layers.

------------------------------------------------------------------------

# 8. But How Does the Whole Network Learn?

Now the scale of the problem has changed.

With one perceptron, we had only a few parameters:

``` text
w₁
w₂
bias
```

With many neurons and layers, we can have many weights and biases.

So if the final prediction is wrong, how does the network learn all of
them?

This is exactly where the ideas from Part 3 return:

``` text
Prediction
   ↓
Loss
   ↓
Backpropagation
   ↓
Gradients
   ↓
Gradient Descent
   ↓
Weights + Bias adjusted
```

Backpropagation lets the learning signal move backward through the
network so gradients can be computed for parameters across the layers.

Gradient Descent then uses those gradients to update the parameters.

The pieces are starting to connect.

------------------------------------------------------------------------

# 9. The Bigger Picture

At the beginning, my learning path looked like this:

``` text
AI
 ↓
Machine Learning
 ↓
Dataset
 ↓
Features + Labels
 ↓
Training
 ↓
Inference
```

Then I opened the model:

``` text
Neuron
 ↓
Inputs
 ↓
Weights
 ↓
Weighted Sum
 ↓
Bias
 ↓
Activation
 ↓
Prediction
```

Then I looked at learning:

``` text
Prediction
 ↓
Loss
 ↓
Backpropagation
 ↓
Gradients
 ↓
Gradient Descent
 ↓
Adjusted Weights + Bias
```

And now:

``` text
Perceptron
    ↓
Many Neurons
    ↓
Layers
    ↓
Neural Network
    ↓
More complex representations
```

What originally looked like many separate AI terms is becoming one
connected process.

------------------------------------------------------------------------

# What I Understand

### Neuron

Receives inputs, applies weights, combines them, adds bias, applies an
activation function, and produces an output.

### Layer

A group/stage of neurons processing information.

### Hidden Layer

A layer between the original input and final output.

### Connection

Carries an output from one neuron/layer as an input to a neuron in the
next layer, with its own weight.

### Neural Network

Many connected neurons organized into layers.

### Deep Learning

At this stage, I understand it as neural-network learning involving
multiple layers of processing that can build increasingly complex
representations.

And the key connection is:

> **The same basic mechanism I learned with one perceptron is repeated
> across many neurons and layers.**

------------------------------------------------------------------------

# Questions I Should Be Able to Answer

1.  Why is one perceptron limited?
2.  What is a layer?
3.  Where does the output of a neuron in Layer 1 normally go in this
    simple feed-forward picture?
4.  Can it become input for neurons in Layer 2?
5.  Do connections between neurons have weights?
6.  What is a hidden layer?
7.  Why is it called "hidden"?
8.  What happens to information as it moves through successive layers?
9.  Why is the cat/ear/eye example only an intuition?
10. How do Loss, Backpropagation, gradients, and Gradient Descent return
    when we train a whole network?

------------------------------------------------------------------------

# What's Next?

I now have a first mental model of a neural network:

``` text
Inputs
  ↓
Neurons
  ↓
Layers
  ↓
Representations
  ↓
Output
```

And I understand the basic learning loop that adjusts its parameters.

The next step is to connect these foundations to the kind of AI that
first made me curious about this journey:

**Generative AI and Large Language Models.**

That will bring new questions:

-   What does a language model actually predict?
-   What is a token?
-   What is context?
-   How does generation differ from our Cats vs Dogs classifier?
-   And where do neural networks fit into all of this?

➡️ **Next Lesson: Generative AI and Large Language Models**

⬅️ **Previous: [Part 3 --- From Error to
Learning](./part-3-from-error-to-learning.md)**

🏠 **[Back to Lesson 2](./README.md)**
