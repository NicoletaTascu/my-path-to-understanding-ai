# Part 3 — Training a Model

In the previous part, I created a simple Cats vs Dogs problem:

```text
🐱 → Cat
🐶 → Dog
```

I have data.

I have labels.

Now I want the model to learn from them.

This process is called **training**.

---

# Supervised Learning

Cats vs Dogs is an example of **Supervised Learning** because we already know the correct answer for each training example.

```text
Image       Label
------------------
🐱          Cat
🐶          Dog
🐱          Cat
🐶          Dog
```

The model receives examples together with their correct answers.

A simplified training process looks like this:

```text
Training Example
       +
Correct Label
       ↓
     Model
       ↓
  Prediction
       ↓
Compare with correct answer
       ↓
    Adjust
```

This process is repeated across many examples.

---

# What Is Training?

Imagine that we give the model a cat image.

The correct answer is:

```text
Cat
```

But the model predicts:

```text
Dog
```

The prediction is wrong.

During training, the model uses this error as feedback and adjusts its internal parameters.

Then it tries again with more examples.

```text
Example
   ↓
Model
   ↓
Prediction
   ↓
Compare with correct answer
   ↓
Error
   ↓
Adjust model
```

This happens repeatedly.

My simple way of remembering training is:

> **Training adjusts the model so that it makes fewer mistakes.**

For now, I don't need all the mathematics behind those adjustments.

First, I need to understand the process.

---

# Unsupervised Learning

Not every Machine Learning problem gives the model the correct answers.

In **Unsupervised Learning**, the data doesn't contain labels.

Imagine giving the model many animal images:

```text
🐱 🐶 🐺 🐱 🐶 🐱
```

but not telling it:

```text
Cat
Dog
Wolf
```

Instead, the model tries to discover patterns or structures in the data.

The distinction that helped me remember this is:

```text
Supervised Learning

Data + Correct Answers
         ↓
       Model


Unsupervised Learning

Data without Correct Answers
           ↓
         Model
           ↓
   Patterns / Structures
```

---

# Generalization

Training creates another important question.

Suppose our model learns from thousands of cat and dog images.

Then we show it:

```text
🐱
```

but this is a completely new cat image.

The model has never seen this exact image before.

If it still predicts:

```text
Cat
```

that's what we want.

A useful model shouldn't work only with examples it already saw.

It should learn patterns that also work with **new data**.

This ability is called **generalization**.

```text
Training Examples
🐱 🐶 🐱 🐶
      ↓
    Model
      ↓
New 🐱 it has never seen
      ↓
    "Cat"
```

---

# Training Data and Test Data

But how can I know whether the model actually generalizes?

Testing it only with the examples it already saw isn't enough.

So we can separate the data:

```text
Dataset
   │
   ├── Training Data
   │        ↓
   │    Model learns
   │
   └── Test Data
            ↓
       Evaluate model
```

The model learns from the training data.

The test data helps us see how the model performs on examples it didn't use during training.

---

# Overfitting

What if the model becomes extremely good at its training examples but performs poorly on new data?

That is a problem.

The model may have learned the training data too specifically instead of learning patterns that generalize well.

This is related to **overfitting**.

```text
Training Data
     ↓
   Model
     ↓
Very good on training examples

BUT

New Data
   ↓
Poor predictions
```

This gave me an important distinction:

> The goal isn't to create a model that is good at remembering the training dataset.

> The goal is to create a model that is good at the task.

---

# What I Understand

### Supervised Learning

The examples contain the correct answers.

### Unsupervised Learning

The data doesn't contain labels, and the model tries to discover patterns or structures.

### Training

> Adjust the model so that it makes fewer mistakes.

### Generalization

The model can work with new examples, not only the ones used during training.

### Test Data

Examples that can help evaluate the model on data it didn't use to learn.

### Overfitting

The model performs well on its training examples but doesn't generalize well to new data.

---

# Questions I Should Be Able to Answer

1. Why is Cats vs Dogs a supervised learning problem?
2. What happens when the model makes a wrong prediction during training?
3. What is the difference between supervised and unsupervised learning?
4. What does generalization mean?
5. Why do we need data that wasn't used during training?
6. What does overfitting look like?
7. Do we want the model to learn the dataset or learn the task?

---

# What's Next?

Our model has now been trained.

It has learned from many examples:

```text
🐱 → Cat
🐶 → Dog
```

But training isn't the final goal.

Eventually, we want to give the model something it has never seen before and ask:

> **What do you think this is?**

That is no longer training.

That is **inference**.

➡️ **Next: [Part 4 — From Training to Prediction](./part-4-from-training-to-prediction.md)**

⬅️ **Previous: [Part 2 — Learning From Data](./part-2-learning-from-data.md)**
