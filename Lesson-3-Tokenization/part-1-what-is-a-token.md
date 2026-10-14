# Lesson 3 — Understanding Tokenization

## Part 1 — What is a token?

Our first instinct was to split the sentence into words:

```text
["Pisica", "doarme"]
```

But that loses the space and the period. If we want to reconstruct the original text, those characters matter too.

**Next question:** How can we assign numerical IDs to the pieces we identified?
