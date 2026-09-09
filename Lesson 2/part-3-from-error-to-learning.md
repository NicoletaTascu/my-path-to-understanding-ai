# Part 3 --- From Error to Learning

In Part 2, the model made a wrong prediction.

``` text
Prediction = 1
Label      = 0
```

Loss told us that the prediction was not what we wanted.

We also identified the parameters that can change:

``` text
Weights + Bias
```

Now we reach the next question:

> **How does the model know how to change them?**

------------------------------------------------------------------------

# 1. Gradient

Imagine that changing a parameter changes the Loss.

We want to know:

> In which direction should this parameter move if we want the Loss to
> decrease?

This is the intuition behind a **gradient**.

For now, my simple mental model is:

> **Gradient tells us how the Loss changes with respect to a parameter
> and therefore which direction can reduce it.**

Different parameters can need different adjustments.

A weight may need to increase.

Another may need to decrease.

Bias may need its own adjustment.

So the idea is **not**:

``` text
Loss is high
   ↓
Decrease every weight
```

Instead, each parameter has information about how changing it affects
the Loss.

------------------------------------------------------------------------

# 2. Gradient Descent --- Walking Down a Hill

The analogy that helped me understand Gradient Descent was a hill.

Imagine that I'm standing somewhere on a hill and I want to reach a
lower point.

I don't need to see the entire landscape.

I can repeatedly ask:

> **Which direction goes downhill from here?**

Then:

``` text
Check direction
      ↓
Take a step
      ↓
Check again
      ↓
Take another step
      ↓
...
```

In Machine Learning, replace the hill with **Loss**.

``` text
Hill height
    ↓
   Loss
```

The goal is to find parameter values that produce a smaller Loss.

The "position" on this landscape is determined by the model's
parameters:

``` text
Weights + Bias
      ↓
    Model
      ↓
     Loss
```

So:

> **Gradient Descent uses gradient information to adjust the parameters
> in a direction that reduces Loss.**

------------------------------------------------------------------------

# 3. Learning Rate

Knowing the direction isn't enough.

We also need to decide how large each update step should be.

This introduces the **Learning Rate**.

My mental model:

``` text
Gradient      → Which direction?
Learning Rate → How large is the step?
```

If the learning rate is very small:

``` text
👣 👣 👣 👣 👣
```

the model may move toward a better solution slowly.

If the learning rate is too large:

``` text
🚶       🚶       🚶
```

the updates may jump over a useful region.

So the learning rate controls the scale of the parameter update.

------------------------------------------------------------------------

# 4. The Training Loop Is Getting More Concrete

We can now extend our training loop:

``` text
Input
  ↓
Weights + Bias
  ↓
Prediction
  ↓
Loss
  ↓
Gradient
  ↓
Gradient Descent
  ↓
Adjust Weights + Bias
  ↓
New Prediction
  ↓
New Loss
  ↺
```

The goal is:

``` text
Loss
 ↓
smaller
 ↓
smaller
 ↓
...
```

This gives me a more concrete interpretation of:

> **The model learns.**

It means its trainable parameters are repeatedly updated in ways
intended to improve its predictions.

------------------------------------------------------------------------

# 5. Loss, Gradient, Learning Rate, Gradient Descent

These concepts are easy to mix up, so I want to keep their jobs
separate.

  -----------------------------------------------------------------------
  Concept                             Question it helps answer
  ----------------------------------- -----------------------------------
  **Loss**                            How wrong is the prediction?

  **Gradient**                        How does changing a parameter
                                      affect the Loss / which direction
                                      can reduce it?

  **Learning Rate**                   How large should the update step
                                      be?

  **Gradient Descent**                How do we use this information to
                                      update parameters toward lower
                                      Loss?
  -----------------------------------------------------------------------

This distinction is more useful to me than memorizing four separate
definitions.

------------------------------------------------------------------------

# 6. Where Does Backpropagation Fit?

So far, a perceptron has only a few parameters.

But a neural network can contain many neurons and many connections.

That means many weights and biases can contribute to one final
prediction.

If the final prediction is wrong, we need to determine how the error
relates to parameters throughout the network.

This is where **Backpropagation** enters the story.

My current intuitive understanding is:

> **Backpropagation works backward through the network to compute the
> gradients needed for its parameters.**

Then Gradient Descent uses those gradients to update the parameters.

So:

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

This distinction matters:

> **Backpropagation and Gradient Descent are not the same thing.**

Backpropagation helps compute the gradients.

Gradient Descent uses gradient information to update the parameters.

------------------------------------------------------------------------

# 7. Putting the Learning Process Together

At the beginning of Lesson 1, I had a very simple description:

> Training adjusts the model so that it makes fewer mistakes.

Now I can expand that idea:

``` text
Input
  ↓
Model parameters
  ↓
Prediction
  ↓
Compare with correct answer
  ↓
Loss
  ↓
Backpropagation
  ↓
Gradients
  ↓
Gradient Descent
  ↓
Update parameters
  ↓
Try again
```

I still don't need every formula to understand the purpose of each
piece.

The mathematics can come later.

First, I want the process to make sense.

------------------------------------------------------------------------

# What I Understand

### Loss

Measures the error between the model's prediction and the desired
result.

### Gradient

Tells us how the Loss changes with respect to a parameter and gives the
direction needed for reducing it.

### Learning Rate

Controls the size of the update step.

### Gradient Descent

Uses gradient information to adjust parameters toward a smaller Loss.

### Backpropagation

Works backward through the network to compute the gradients for the
parameters that contributed to the final error.

The key distinction:

``` text
Backpropagation → computes gradients

Gradient Descent → uses gradients to update parameters
```

------------------------------------------------------------------------

# Questions I Should Be Able to Answer

1.  What does Loss tell me?
2.  What does a gradient tell me?
3.  Does Gradient Descent simply decrease every weight?
4.  What does the Learning Rate control?
5.  What can happen if the Learning Rate is too large?
6.  What can happen if it is very small?
7.  What is the role of Backpropagation?
8.  Are Backpropagation and Gradient Descent the same thing?
9.  Which one computes gradients?
10. Which one uses gradients to update parameters?
11. Can I explain the full training loop without memorizing a textbook
    definition?

------------------------------------------------------------------------

# What's Next?

So far, most of the examples have focused on one simple neuron.

But real problems are much more complex than:

> **Is this house large?**

One perceptron is limited.

So what happens if we connect many neurons together?

We get **layers**.

And when those layers start passing information to one another, we begin
to see a **Neural Network**.

➡️ **Next: [Part 4 --- From One Neuron to a Neural
Network](./part-4-from-one-neuron-to-a-neural-network.md)**

⬅️ **Previous: [Part 2 --- Prediction, Label, and
Loss](./part-2-prediction-label-and-loss.md)**
