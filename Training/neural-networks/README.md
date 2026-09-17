# Neural Networks — Theory Recap

This document contains the theory I revisited during Week 2.

It is intentionally focused on the concepts and the questions that helped me understand them. The practical implementation and debugging journey are documented separately in [`EXPERIMENT.md`](EXPERIMENT.md).

> **Understand first. Build second.**

## 1. Perceptron

A perceptron is a simple artificial neuron.

For one example, it receives inputs. Each input has a corresponding weight. The neuron combines them, adds a bias, applies an activation function, and produces an output.

```text
Inputs
  ↓
Weights
  ↓
Input × Weight
  ↓
Weighted Sum
  ↓
+ Bias
  ↓
Activation
  ↓
Output / Prediction
```

### What clicked

A **dataset** contains examples. One example provides the **inputs** used for a prediction.

**Bias** is not an input and it is not the threshold. It is an internal parameter added before the activation.

In the simplified step-function example I used, the threshold was `0`. This is not a universal rule for all activation functions.

---

## 2. Prediction, Label, and Loss

The model produces a **prediction**.

In supervised learning, we also know the expected answer: the **label**.

A loss function measures the error between them.

For the small experiment I used squared error:

```text
Loss = (prediction - label)²
```

### A question that mattered

> How small does the Loss have to be before the model makes a correct decision?

### What clicked

Loss is not a universal `correct / incorrect` threshold. It is the objective the training process tries to reduce.

In the tiny experiment, `Loss = 0` means the prediction exactly matches the label. In real problems, the meaning of a loss value depends on the problem, the loss function, the scale, and the data.

---

## 3. Gradient

Knowing that the model made an error is not enough. We also need information about how a parameter should change if we want to reduce that error.

For the experiment:

```text
prediction = input × weight + bias
Loss       = (prediction - label)²
```

The gradient of the Loss with respect to the weight is:

```text
gradient_weight = 2 × (prediction - label) × input
```

### What clicked

The gradient comes from the **derivative of the Loss**, not from simply reusing the Loss formula.

**Loss defines what we want to minimize. The derivative tells us how that Loss changes with respect to a parameter.**

---

## 4. Backpropagation vs. Gradient Descent

At the level I need right now:

**Backpropagation calculates the gradients. Gradient Descent uses those gradients to update the parameters.**

Backpropagation propagates information about the error backward through a neural network so gradients can be calculated for the parameters that contributed to the result.

Gradient Descent then uses those gradients to perform the updates.

They are related, but they are not the same thing.

---

## 5. Gradient Descent and Learning Rate

For the weight in the small experiment:

```text
new_weight = old_weight - learning_rate × gradient_weight
```

The **Learning Rate** controls the size of the update step.

A very large step can overshoot or make training unstable. A very small step can make learning unnecessarily slow.

### What clicked

Gradient Descent is not a value that is calculated.

**It is the optimization rule that uses the gradient and Learning Rate to update a parameter.**

---

## 6. From One Neuron to a Neural Network

One neuron can model relatively simple relationships.

A neural network connects many neurons in layers:

```text
Input Layer → Hidden Layer(s) → Output Layer
```

A useful correction to my initial mental model was that layers do not necessarily make increasingly complex "decisions."

A more accurate intuition is:

**Successive layers build increasingly complex representations of the information.**

For an image, an intuitive description might be:

```text
pixels
  ↓
simple patterns
  ↓
combinations of patterns
  ↓
more complex representations
  ↓
output
```

This is an intuition, not a literal description of neurons "knowing" what an edge, a nose, or an ear is.

A hidden layer is simply an intermediate layer that transforms and combines information between input and output.

---

## 7. Training vs. Inference

**Training** is when the model learns from data and updates its parameters.

```text
Prediction
  ↓
Compare with Label
  ↓
Loss
  ↓
Gradients
  ↓
Gradient Descent
  ↓
Update Parameters
  ↓
Repeat
```

**Inference** is when a trained model receives new input and uses the learned parameters to produce a prediction.

During ordinary inference, those parameters are not updated.

---

## Week 2 Theory Check

- [x] Perceptron
- [x] Weights and Bias
- [x] Activation — intuitive level
- [x] Prediction and Label
- [x] Loss
- [x] Gradient
- [x] Gradient Descent
- [x] Learning Rate
- [x] Backpropagation — current required level
- [x] Neural Networks and Hidden Layers
- [x] Training vs. Inference

The next step was to stop reading definitions and make the learning process visible in code.

→ [`EXPERIMENT.md`](EXPERIMENT.md)
