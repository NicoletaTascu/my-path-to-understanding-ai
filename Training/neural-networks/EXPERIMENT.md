# Making Learning Visible — The Python Experiment

This document captures the practical part of Week 2: building a tiny learning process from scratch and understanding what changed after each mistake.

The runnable version is available in:

- [`practical-python/gradient-descent.ipynb`](practical-python/gradient-descent.ipynb) — step-by-step Jupyter Notebook
- [`practical-python/gradient-descent.py`](practical-python/gradient-descent.py) — standalone Python script

## Tools Used

- **Python**
- **Jupyter Notebook**
- No machine-learning framework

I deliberately did not use PyTorch, TensorFlow, or scikit-learn.

The goal was to make the learning mechanism visible before hiding it behind higher-level abstractions.

Otherwise I could have called something like `model.fit(...)`, watched it work, and stared at it like a refrigerator.

**The refrigerator can wait.** 🧊

---

## 1. The Smallest Useful Model

I intentionally reduced the experiment to one input and one weight:

```text
input         = 2
weight        = 0.5
bias          = 0
label         = 4
learning_rate = 0.1
```

The model:

```text
prediction = input × weight + bias
```

Initial prediction:

```text
prediction = 2 × 0.5 + 0 = 1
```

Squared error:

```text
Loss = (prediction - label)²
     = (1 - 4)²
     = 9
```

---

## 2. Before Gradient Descent: Which Way Should the Weight Move?

Before calculating the gradient, I changed the weight manually:

```text
weight = 0.6 → prediction = 1.2 → Loss = 7.84
weight = 0.4 → prediction = 0.8 → Loss = 10.24
```

This suggested that increasing the weight moves us toward a smaller Loss.

Then I calculated the gradient:

```text
gradient_weight = 2 × (1 - 4) × 2
                = -12
```

With a Learning Rate of `0.1`:

```text
new_weight = 0.5 - 0.1 × (-12)
           = 1.7
```

The new prediction:

```text
2 × 1.7 = 3.4
```

The new Loss:

```text
(3.4 - 4)² = 0.36
```

### AHA

One update reduced the Loss:

```text
9 → 0.36
```

For the first time, I could see the learning mechanism instead of only reading its definition.

---

## 3. The Hard Part Was Not the `for` Loop

I already had the pieces for prediction, Loss, gradient calculation, and one Gradient Descent update.

The missing connection was:

> **What has to survive from one epoch to the next?**

The answer was the updated parameter.

### Attempt 1 — Stop when the prediction is wrong

I initially wrote logic equivalent to:

```python
if prediction != label:
    return
```

That stops training exactly when the model needs to learn.

### AHA

A wrong prediction is not a reason to stop training. It provides the error information that allows training to continue:

```text
prediction
    ↓
Loss
    ↓
gradient
    ↓
parameter update
```

---

## 4. Resetting the Weight

Another attempt initialized the new weight again inside the loop.

That meant every epoch would start from the original value and discard the previous update.

### AHA

**What the model learns in one epoch must survive into the next epoch.**

The updated weight becomes the weight used by the next prediction.

---

## 5. Two Model States in the Same Epoch

At one point the code effectively did this:

```text
prediction       → old weight
Loss             → new weight
Gradient Descent → new weight
```

After the first update:

```text
old weight = 0.5
new weight = 1.7
```

Prediction and Loss were therefore describing different parameter states.

### AHA

**Prediction, Loss, and gradient calculation for one epoch must refer to the same current parameter state.**

Then Gradient Descent produces the state used by the next epoch.

---

## 6. The Training Loop Finally Clicked

The mental model became:

```text
current weight
      ↓
prediction
      ↓
Loss
      ↓
gradient
      ↓
Gradient Descent
      ↓
updated weight
      ↓
next epoch uses updated weight
      ↓
repeat
```

The output was:

| Epoch | Weight | Loss |
| ---: | ---: | ---: |
| 0 | 0.5000 | 9.0000 |
| 1 | 1.7000 | 0.3600 |
| 2 | 1.9400 | 0.0144 |
| 3 | 1.9880 | 0.0006 |
| 4 | 1.9976 | ~0.0000 |

The weight approaches `2`.

That makes sense because:

```text
input × weight = label
2 × weight     = 4
weight         = 2
```

### The biggest AHA

**I never gave the model `weight = 2`.**

It started at `0.5` and moved toward `2` through successive updates that reduced the Loss.

In this experiment, learning became concrete:

> **The model adjusts a parameter based on its error so that future predictions produce a smaller Loss.**

---

## 7. One Last Code-Review AHA

After the training loop worked, I noticed that `prediction()` was being calculated twice: once in the training loop and again inside `loss()`.

The original version was:

```python
def loss(input_val, weight, bias, label):
    pred = prediction(input_val, weight, bias)
    return (pred - label) ** 2
```

I refactored it to:

```python
def loss(pred, label):
    return (pred - label) ** 2
```

### AHA

**Loss does not need to know how the prediction was produced. It only needs the prediction and the label to measure the error.**

This removed a redundant calculation and gave the function a clearer responsibility.

Apparently, even an AI experiment eventually turns into an architecture discussion.

---

## What This Experiment Was — and Was Not

This is a deliberately simplified scalar linear model.

There is no multi-layer neural network here, and there is no activation function. Backpropagation through a network is not implemented; the gradient for one weight is calculated directly.

The purpose was not to build a useful ML model.

The purpose was to make this process visible:

```text
Prediction → Loss → Gradient → Parameter Update → New Prediction
```

Once that mechanism was visible, the phrase **"the model learns"** stopped feeling abstract.

> **Understand first. Build second.**
