# Part 4 — From Training to Prediction

So far, the model has learned from examples.

```text
🐱 → Cat
🐶 → Dog
🐱 → Cat
🐶 → Dog
```

After training, we have a **trained model**.

Now something changes.

We give it new data.

---

# Inference

Imagine giving our trained model a new image:

```text
🐱
```

This exact image wasn't part of its training data.

The model processes it and produces:

```text
Prediction → Cat
```

This process is called **inference**.

My simple way of remembering it is:

> **Inference means giving new data to the trained model and getting a prediction. That's it.**

The important difference is that the model isn't learning from this example in the same way it does during training.

It is using what it has already learned.

---

# Training vs Inference

This distinction became much clearer to me when I put the two processes next to each other.

## Training

```text
Examples + Correct Answers
          ↓
        Model
          ↓
      Prediction
          ↓
        Error
          ↓
   Adjust parameters
          ↓
     Better Model
```

The model is learning.

## Inference

```text
New Data
   ↓
Trained Model
   ↓
Prediction
```

The model is using what it learned.

So my shortest version is:

```text
TRAINING
Adjust the model to make fewer mistakes.

INFERENCE
Give the trained model new data and get a prediction.
```

---

# The Complete Cats vs Dogs Journey 🐱🐶

Now I can connect everything from this lesson.

## 1. Dataset

We start with examples:

```text
🐱 → Cat
🐶 → Dog
🐱 → Cat
🐶 → Dog
```

## 2. Data and Labels

The images are represented numerically.

Each training example also has a correct answer:

```text
Cat
Dog
```

## 3. Training

The model processes examples, makes predictions, compares them with the correct answers, and adjusts itself.

```text
Data + Labels
     ↓
Training
     ↓
Trained Model
```

## 4. New Data

Now we give it an image it hasn't seen before:

```text
🐱
```

## 5. Inference

The trained model processes the new image.

## 6. Prediction

```text
Prediction → Cat
```

So the entire journey looks like this:

```text
       DATASET
          │
          ↓
   Features + Labels
          │
          ↓
       TRAINING
          │
          ↓
    TRAINED MODEL
          │
          ↓
      New Image
          │
          ↓
      INFERENCE
          │
          ↓
     PREDICTION
          │
          ↓
        🐱 CAT
```

At this point, many terms that initially looked unrelated became parts of the same process.

---

# Where Do Neural Networks Fit?

A model can be built using different Machine Learning approaches.

One important approach is the **Neural Network**.

A very simplified neural network looks like:

```text
Input Layer
     ↓
Hidden Layer
     ↓
Hidden Layer
     ↓
Output Layer
```

For our example:

```text
Image
  ↓
Neural Network
  ↓
Cat / Dog
```

The network learns internal representations and patterns from the training examples.

But that raises a new set of questions.

What is actually inside one of these layers?

What is a neuron?

What are weights?

And how can changing numbers inside a network make its predictions better?

Those questions deserve their own lesson.

---

# What About Generative AI?

Our Cats vs Dogs model produces a classification:

```text
Cat
```

or:

```text
Dog
```

But some AI models can **generate new content**.

They can generate:

* text
* images
* audio
* code

This is where **Generative AI** enters the story.

Large Language Models are one example.

At a simplified level, an LLM generates text by predicting tokens based on patterns learned during training and the context it currently receives.

We'll explore that later.

For now, the important thing is that the foundation remains familiar:

```text
Data
 ↓
Training
 ↓
Model
 ↓
Inference
 ↓
Output
```

---

# What I Understand

After these four parts, I can finally connect the main concepts:

```text
Dataset
   ↓
Features + Labels
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

The terminology makes much more sense when I see it as one process instead of a collection of definitions.

---

# Questions I Should Be Able to Answer

1. What is the difference between training and inference?
2. Is the model adjusting itself during normal inference?
3. What happens when I give a trained model a new cat image?
4. How are Dataset → Training → Model → Inference → Prediction connected?
5. Where could a neural network fit into this process?
6. How is a classification model different from a Generative AI model?

---

# What's Next?

I now understand the journey from data to prediction.

But the model itself is still mostly a black box:

```text
Input
  ↓
[ MODEL ]
  ↓
Output
```

So the next step is to open that box.

I'll start with one of the simplest building blocks:

**the Perceptron.**

And that will introduce several new concepts:

```text
Input
  ↓
Weight
  ↓
Weighted Sum
  ↓
Bias
  ↓
Activation Function
  ↓
Output
```

➡️ **Next Lesson: The Perceptron — Inside a Simple Neuron**

⬅️ **Previous: [Part 3 — Training a Model](./part-3-training-a-model.md)**

🏠 **[Back to Lesson 1](./README.md)**
