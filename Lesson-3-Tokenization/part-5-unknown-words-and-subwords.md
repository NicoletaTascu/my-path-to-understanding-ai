# Lesson 3 — Understanding Tokenization

## Part 5 — What happens with unknown words? Why subword tokenization?

Our vocabulary works for `"Pisica doarme."` but fails for `"Câinele doarme."` because `"Câinele"` is unknown.

We could add every new word, but natural languages contain many word forms, names, and new terms. A word-only vocabulary would remain limited.

So we asked: **What if we reuse smaller pieces?**

Conceptually, we could represent:

```text
"Câinele" → ["Câine", "le"]
"Pisica"  → ["Pis", "ica"]
"doarme"  → ["do", "arme"]
```

These are **illustrations**, not outputs measured from a real tokenizer.

This is the basic idea of **subword tokenization**: words can be represented through smaller, reusable units.

One subtle point matters: **a subword is not necessarily a linguistic root or suffix**. Methods such as Byte Pair Encoding (BPE) learn useful recurring sequences; their boundaries need not match linguistic morphology. A tokenizer might split `"Pisica"` into `"P"`, `"is"`, and `"ica"`.

Subword vocabularies alone do not guarantee that every possible character can be represented. Some tokenizers use byte-level representations or byte fallback to handle otherwise unknown text.

**AHA:** Tokenization is about **representing text**, not understanding its meaning. The model learns useful numerical representations later.

**Next question:** Does the same conceptual tokenizer behave the same way in Swift and Python?
