# Part 1 — What Is AI?

## What Is Artificial Intelligence?

Artificial Intelligence is a broad field that aims to make computers capable of performing tasks that normally require human intelligence.

But this definition alone didn't help me very much.

The first thing that helped me understand AI was comparing two different ways of solving a problem:

**Traditional Programming** and **Machine Learning**.

---

## Traditional Programming

In traditional programming, we explicitly define the rules that the computer has to follow.

```text
Input + Rules → Output
```

For example:

```text
temperature = 32

if temperature > 30:
    print("It's hot")
else:
    print("It's not hot")
```

I know the rule.

I write the rule.

The computer executes it.

---

## Machine Learning

Machine Learning takes a different approach.

Instead of explicitly writing every rule, we provide data and allow a model to learn patterns from that data.

A simplified view is:

```text
Data
  ↓
Learning
  ↓
Model
```

Once the model has learned from the data, we can give it new data:

```text
New Data
    ↓
Model
    ↓
Prediction
```

This was one of the first important ideas for me:

> **Traditional Programming:** I write the rules.

> **Machine Learning:** I provide data and examples, and the model learns patterns from them.

---

## Symbolic AI

Machine Learning is not the only approach to AI.

Another approach is **Symbolic AI**.

With symbolic reasoning, knowledge can be represented using explicit symbols, logic, and rules.

For example:

```text
IF animal has feathers
AND animal has wings
THEN animal is probably a bird
```

The rules are explicitly defined.

This is very different from giving a Machine Learning model many examples and allowing it to learn patterns from them.

A simplified comparison:

```text
Symbolic AI

Rules + Symbols + Logic
          ↓
        Result


Machine Learning

Data + Examples
       ↓
    Learning
       ↓
      Model
```

---

## What I Understand

At this point, my mental model is simple:

### Artificial Intelligence

Making computers capable of performing tasks that would normally require some form of human intelligence.

### Traditional Programming

```text
Rules + Input → Output
```

I define the rules.

### Machine Learning

```text
Data → Learning → Model
```

The model learns patterns from data.

### Symbolic AI

Knowledge and reasoning can be represented using explicit rules, symbols, and logic.

---

## Questions I Should Be Able to Answer

Before continuing, I should be able to explain:

1. What is AI in my own words?
2. Who defines the rules in traditional programming?
3. What changes when we use Machine Learning?
4. What is the basic difference between Symbolic AI and learning from examples?

If I can explain these without memorizing the definitions, I'm ready to continue.

---

## What's Next?

Machine Learning learns patterns from **data**.

But that immediately raises another question:

> **What exactly is the data that a Machine Learning model learns from?**

To answer that, I first need to understand three concepts:

**Dataset, Features, and Labels.**

➡️ **Next: [Part 2 — Learning From Data](./part-2-learning-from-data.md)**

