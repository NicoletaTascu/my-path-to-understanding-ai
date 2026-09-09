# Part 1 --- Meet the Perceptron

In Lesson 1, I kept using a simple idea:

``` text
New Data
   ↓
[ MODEL ]
   ↓
Prediction
```

Now I want to look inside `[ MODEL ]`.

One of the simplest places to start is the **perceptron**.

A perceptron is a very simple model that:

> **receives inputs → weights them → combines them → makes a decision**

------------------------------------------------------------------------

# 1. Inputs

Imagine a simple system that must decide:

> **Is this house large?**

We give it two pieces of information:

``` text
x₁ = number of rooms
x₂ = surface
```

These are the **inputs**.

They are values coming into the neuron.

``` text
x₁ ────────┐
            ├──→ Neuron
x₂ ────────┘
```

But should both inputs contribute equally to the decision?

Not necessarily.

------------------------------------------------------------------------

# 2. Weights

Each input can have a **weight**.

For example:

``` text
surface → weight = 0.8
rooms   → weight = 0.3
```

A weight controls how strongly an input contributes to the neuron's
calculation.

My way of understanding it is:

> **If an input has a larger weight, its contribution to the decision is
> larger.**

So:

``` text
Surface ──× 0.8 ──┐
                   ├──→ Neuron
Rooms ─────× 0.3 ──┘
```

The weights are not fixed rules that we permanently choose ourselves.

They are internal parameters that can be adjusted during training.

------------------------------------------------------------------------

# 3. Weighted Sum

The neuron needs to combine its inputs.

Suppose:

``` text
surface = 120
rooms   = 4

w₁ = 0.8
w₂ = 0.3
```

First, each input is multiplied by its weight:

``` text
120 × 0.8 = 96
4 × 0.3   = 1.2
```

Then we add the results:

``` text
96 + 1.2 = 97.2
```

`97.2` is the **weighted sum**.

In general:

``` text
(x₁ × w₁) + (x₂ × w₂)
```

or, with more inputs:

``` text
(x₁ × w₁) + (x₂ × w₂) + ... + (xₙ × wₙ)
```

The important idea is:

> **Each input × its weight → then combine the contributions.**

------------------------------------------------------------------------

## Why Not Just Add the Inputs?

This question helped me understand why weights matter.

Why don't we simply calculate:

``` text
120 + 4
```

Surface and number of rooms represent different things and may also use
very different scales.

My first reaction was:

> **You can't simply add rooms and surface. It's like adding apples and
> pears and expecting to get plums.**

That intuition helped.

But I also had to correct another assumption.

A weight such as `0.8` does **not** necessarily mean:

> "Surface represents 80% of the house."

The weighted result is not automatically a price, percentage, or final
prediction.

It is an **intermediate contribution** to the neuron's calculation.

I find it more useful to think of a weight as a kind of
**importance/control knob** for that connection.

------------------------------------------------------------------------

# 4. Bias

After the weighted sum, another parameter appears:

**Bias**.

Suppose the neuron calculated:

``` text
Weighted Sum = 5
```

and has:

``` text
Bias = 3
```

Then:

``` text
5 + 3 = 8
```

At first, bias confused me because it doesn't come from the dataset.

So where does it come from?

The answer that helped me is:

> **Bias is already inside the neuron as an internal parameter.**

It is not:

-   an input;
-   a feature;
-   information about the house.

Like the weights, bias can be adjusted during training.

The flow is now:

``` text
Inputs
   ↓
× Weights
   ↓
Weighted Sum
   ↓
+ Bias
   ↓
Intermediate value
```

Bias gives the neuron an additional adjustment independent of the input
values.

One important correction:

> **Bias is not itself the decision threshold.**

It shifts the value that will be passed to the activation function.

------------------------------------------------------------------------

# 5. Activation Function

We now have:

``` text
Weighted Sum + Bias
```

But we still need an output.

This is where the **activation function** appears.

It takes the value after `Weighted Sum + Bias` and transforms it into
the neuron's output.

For a very simple perceptron, we can use a step-like rule:

``` text
result ≥ 0 → 1
result < 0 → 0
```

So the neuron can make a binary decision.

For example:

``` text
1 = house is large
0 = house is not large
```

------------------------------------------------------------------------

# 6. A Complete Perceptron

Let's put everything together.

We have:

``` text
x₁ = 4   # rooms
x₂ = 8   # tens of m²

w₁ = 0.5
w₂ = 0.2

bias = -2
```

### Step 1 --- Multiply inputs by weights

``` text
4 × 0.5 = 2
8 × 0.2 = 1.6
```

### Step 2 --- Weighted Sum

``` text
2 + 1.6 = 3.6
```

### Step 3 --- Add Bias

``` text
3.6 + (-2) = 1.6
```

### Step 4 --- Activation Function

Our rule is:

``` text
result ≥ 0 → 1
result < 0 → 0
```

Since:

``` text
1.6 ≥ 0
```

the output is:

``` text
Output = 1
```

So the perceptron predicts:

> **The house is large.**

The complete flow is:

``` text
x₁ = 4 ──× 0.5 ──┐
                   ├──→ 3.6 ──→ + (-2) ──→ 1.6 ──→ Activation ──→ 1
x₂ = 8 ──× 0.2 ──┘
```

Or conceptually:

``` text
Features
   ↓
Inputs
   ↓
Weights
   ↓
Weighted Sum
   ↓
Bias
   ↓
Activation Function
   ↓
Output
```

------------------------------------------------------------------------

# 7. Try It Again

Suppose:

``` text
x₁ = 2
x₂ = 5

w₁ = 0.5
w₂ = 0.4

bias = -2
```

Weighted Sum:

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
1 ≥ 0 → Output = 1
```

The neuron has made another prediction.

But this raises a much more interesting question.

Who gave it:

``` text
w₁ = 0.5
w₂ = 0.4
bias = -2
```

And how do we know whether `Prediction = 1` is actually correct?

That is where training comes back into the story.

------------------------------------------------------------------------

# What I Understand

### Input

A value received by the neuron.

### Weight

An internal parameter controlling how strongly an input contributes to
the calculation.

### Weighted Sum

The sum of the weighted input contributions.

### Bias

An internal parameter added after the weighted sum, allowing the neuron
to shift the value passed to the activation function.

### Activation Function

Transforms the intermediate value into the neuron's output.

### Perceptron

A simple model that:

``` text
receives inputs
      ↓
weights them
      ↓
combines them
      ↓
adds bias
      ↓
applies activation
      ↓
produces an output
```

------------------------------------------------------------------------

# Questions I Should Be Able to Answer

1.  What is an input?
2.  What does a weight control?
3.  If one input has a larger weight, what does that mean intuitively?
4.  What is a weighted sum?
5.  Why isn't a weight automatically a percentage of the final result?
6.  Is bias an input from the dataset?
7.  What does bias do?
8.  Is bias itself the decision threshold?
9.  What does the activation function do?
10. Can I follow the calculation from inputs all the way to output?

------------------------------------------------------------------------

# What's Next?

The perceptron has produced:

``` text
Prediction = 1
```

But that alone tells us only what the model decided.

It does **not** tell us whether the decision was correct.

For that, we need something we already met in Lesson 1:

**the label.**

And once we compare prediction with label, a new concept becomes
important:

**Loss.**

➡️ **Next: [Part 2 --- Prediction, Label, and
Loss](./part-2-prediction-label-and-loss.md)**

⬅️ **[Back to Lesson 2](./README.md)**
