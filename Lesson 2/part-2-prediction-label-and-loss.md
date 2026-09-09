# Part 2 --- Prediction, Label, and Loss

In Part 1, our perceptron produced an output:

``` text
Prediction = 1
```

For our example, we decided:

``` text
0 = house is NOT large
1 = house IS large
```

So:

``` text
Prediction = 1
```

means:

> **The model predicts that the house is large.**

But there is still a problem.

How do we know whether the model is right?

------------------------------------------------------------------------

# 1. Prediction vs Label

The **prediction** is what the model says.

The **label** is the correct answer available in the training data.

Suppose:

``` text
Prediction = 1
Label      = 1
```

The model is correct.

``` text
Prediction = 1
Label      = 1
       ↓
    Correct
```

But suppose:

``` text
Prediction = 1
Label      = 0
```

Now the model is wrong.

``` text
Prediction = 1
Label      = 0
       ↓
     Wrong
```

This comparison gives the model feedback about its prediction.

------------------------------------------------------------------------

# 2. Why Do We Need Loss?

Knowing only that a prediction is "wrong" isn't enough for training a
model.

We need a way to measure the error.

This is where **Loss** appears.

At this stage, I don't need the exact mathematical formula.

The intuition is more important:

> **Loss measures how bad the model's prediction is compared with the
> desired result.**

So I can separate the roles:

``` text
Prediction → What did the model decide?

Label      → What was the correct answer?

Loss       → How wrong was the prediction?
```

------------------------------------------------------------------------

# 3. A Wrong Prediction

Let's reuse the perceptron from Part 1:

``` text
x₁ = 2
x₂ = 5

w₁ = 0.5
w₂ = 0.4

bias = -2
```

The neuron calculates:

``` text
2 × 0.5 + 5 × 0.4
= 1 + 2
= 3
```

Add Bias:

``` text
3 + (-2) = 1
```

Activation:

``` text
1 ≥ 0 → Prediction = 1
```

But now suppose the correct answer is:

``` text
Label = 0
```

So:

``` text
Prediction = 1
Label      = 0

❌ Wrong
```

Loss tells us that the model's prediction does not match the desired
result.

------------------------------------------------------------------------

# 4. What Needs to Change?

The prediction came from this calculation:

``` text
Inputs
   ↓
Weights + Bias
   ↓
Weighted Sum
   ↓
Activation
   ↓
Prediction
```

If the prediction is wrong, the parameters that helped produce it need
to be adjusted.

For this simple perceptron, those trainable internal parameters are:

``` text
Weights + Bias
```

So training begins to look more concrete:

``` text
Input
  ↓
Weights + Bias
  ↓
Prediction
  ↓
Compare with Label
  ↓
Loss
  ↓
Adjust Weights + Bias
  ↓
Try again
```

This connects directly to the simple definition from Lesson 1:

> **Training adjusts the model so that it makes fewer mistakes.**

Now I can see what "adjust the model" means in a simple perceptron:

> **Adjust its weights and bias.**

------------------------------------------------------------------------

# 5. But Which Way Should We Adjust Them?

Our current intermediate value is:

``` text
Weighted Sum + Bias = 1
```

And our activation rule is:

``` text
result ≥ 0 → 1
result < 0 → 0
```

The model predicted:

``` text
1
```

but the label is:

``` text
0
```

So, for this example, we want the value before activation to move from:

``` text
1
```

to:

``` text
< 0
```

The calculation is:

``` text
2 × w₁ + 5 × w₂ + bias
```

With the current values:

``` text
2 × 0.5 + 5 × 0.4 + (-2) = 1
```

To change the decision, we need to adjust `w₁`, `w₂`, and/or `bias` so
that the final value moves in the desired direction.

But now we reach the important question:

> **How does the model know which parameter to change, in which
> direction, and by how much?**

We don't want to guess.

------------------------------------------------------------------------

# What I Understand

### Prediction

What the model decided.

### Label

The correct answer for a training example.

### Loss

A measure of how wrong the model's prediction is compared with the
desired result.

### Training

When the prediction is not good enough, the model needs to adjust the
parameters that contributed to it.

For our perceptron:

``` text
Weights + Bias
```

are those parameters.

The loop is becoming clearer:

``` text
Prediction
    ↓
Compare with Label
    ↓
Loss
    ↓
Adjust parameters
    ↓
New Prediction
```

------------------------------------------------------------------------

# Questions I Should Be Able to Answer

1.  What is the difference between prediction and label?
2.  If `Prediction = 1` and `Label = 1`, what does that tell me?
3.  If `Prediction = 1` and `Label = 0`, what does that tell me?
4.  What does Loss tell us?
5.  Which parameters can be adjusted in our simple perceptron?
6.  Why isn't "the prediction is wrong" enough to explain how the model
    should improve?
7.  If we want the step activation to output `0`, where must
    `Weighted Sum + Bias` move?

------------------------------------------------------------------------

# What's Next?

Loss tells us that there is an error.

But Loss doesn't simply say:

``` text
Change w₁ by this amount.
Change w₂ by that amount.
Change bias by another amount.
```

We need a method for determining how the parameters should move so that
the Loss becomes smaller.

This introduces several connected ideas:

**Gradient → Gradient Descent → Learning Rate → Backpropagation**

➡️ **Next: [Part 3 --- From Error to
Learning](./part-3-from-error-to-learning.md)**

⬅️ **Previous: [Part 1 --- Meet the
Perceptron](./part-1-meet-the-perceptron.md)**
