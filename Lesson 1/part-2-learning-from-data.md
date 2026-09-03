# Part 2 — Learning From Data

In the previous part, I learned one of the fundamental differences between traditional programming and Machine Learning:

```text
Traditional Programming
Rules + Input → Output

Machine Learning
Data → Learning → Model
```

But saying that a model "learns from data" raises an obvious question:

> **What does that data actually look like?**

This is where datasets, features, and labels appear.

---

# Dataset

A **dataset** is a collection of data used for a Machine Learning problem.

Let's imagine that we want to predict the price of a car.

Our dataset could contain:

| Engine |  Weight |   Price |
| ------ | ------: | ------: |
| 1.2    | 1100 kg | €12,000 |
| 1.6    | 1300 kg | €18,000 |
| 2.0    | 1500 kg | €25,000 |

Each row represents an example.

But the columns don't all have the same purpose.

---

# Features

A **feature** is a measurable property that we give to the model as input.

In our car example:

```text
Engine
Weight
```

are features.

They describe characteristics of the car that may be useful when predicting its price.

---

# Label

The **label** is the correct answer or target that we want the model to learn to predict.

In our example:

```text
Price
```

is the label.

So our problem can be simplified to:

```text
Engine ──┐
         ├──→ Model ──→ Price
Weight ──┘
```

or:

```text
Features → Model → Prediction
```

---

# Cats vs Dogs 🐱🐶

The car example makes features and labels relatively easy to see.

But images made me think about the problem differently.

Imagine that we want to build a model that can distinguish between:

```text
🐱 Cat
🐶 Dog
```

Our dataset could contain many examples:

```text
cat_01.jpg → Cat
cat_02.jpg → Cat

dog_01.jpg → Dog
dog_02.jpg → Dog
```

The images are our data.

And because we know the correct answer for every image, we also have labels:

```text
🐱 image → Cat
🐶 image → Dog
```

---

# But What Are the Features of an Image?

This was an important question for me.

With cars, it's easy:

```text
Engine
Weight
```

But an image doesn't arrive as:

```text
ears = yes
whiskers = yes
tail = yes
```

An image is represented numerically.

It contains measurable information such as:

* pixel values
* brightness
* colors

So a very simplified view is:

```text
Image
  ↓
Numbers
  ↓
Model
  ↓
Cat or Dog
```

The important idea is that we don't manually write a rule like:

```text
IF whiskers AND ears
THEN cat
```

The model receives examples and learns useful patterns from the data.

---

# What I Understand

### Dataset

A collection of examples used for a Machine Learning problem.

### Feature

A measurable property used as input.

For our cars:

```text
Engine
Weight
```

### Label

The correct answer or target.

For our cars:

```text
Price
```

For Cats vs Dogs:

```text
Cat
Dog
```

The basic flow is:

```text
Dataset
   ↓
Features + Labels
   ↓
Learning
```

---

# Questions I Should Be Able to Answer

1. What is a dataset?
2. What is a feature?
3. What is a label?
4. In the car example, what are the features?
5. What is the label?
6. In Cats vs Dogs, what are the labels?
7. Why can't I simply think of an image as a list of rules such as "has ears" and "has whiskers"?

---

# What's Next?

Now we have examples.

We have features.

And, in some problems, we also have the correct answers — the labels.

For Cats vs Dogs:

```text
🐱 → Cat
🐶 → Dog
```

But having examples doesn't automatically create a useful model.

So the next question is:

> **How does the model actually learn from these examples?**

That's where **training** begins.

➡️ **Next: [Part 3 — Training a Model](./part-3-training-a-model.md)**

⬅️ **Previous: [Part 1 — What Is AI?](./part-1-what-is-ai.md)**
