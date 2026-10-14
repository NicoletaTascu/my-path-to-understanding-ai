# Lesson 3 — Understanding Tokenization: From Text to Token IDs

> **Understand first. Build second.**

A question-driven learning journey. Each part follows the same path: **question → experiment → AHA → next question**.

## Introduction — Why do LLMs need tokens?

How does text become something a neural network can process? Neural networks operate on numerical representations. A tokenizer turns text into token IDs, which the model later uses to obtain numerical vectors (embeddings).

For our *educational* tokenizer:

```text
Text:      "Pisica doarme."
Tokens:    ["Pisica", " ", "doarme", "."]
Token IDs: [0, 3, 1, 2]
```

These IDs are illustrative, not real LLM token IDs. They identify tokens; they do not themselves contain semantic meaning.

**Next question:** Is a token always a word?

## The eight parts

1. [What is a token?](part-1-what-is-a-token.md)
2. [Building our first vocabulary](part-2-building-our-first-vocabulary.md)
3. [Encoding and decoding](part-3-encoding-and-decoding.md)
4. [Can we reconstruct the original text?](part-4-reconstructing-original-text.md)
5. [What happens with unknown words? Why subword tokenization?](part-5-unknown-words-and-subwords.md)
6. [Rebuilding the experiment in Python](part-6-rebuilding-in-python.md)
7. [Exploring real tokenizers with `tiktoken`](part-7-exploring-real-tokenizers.md)
8. [Tokens and UTF-8 bytes](part-8-tokens-and-utf8-bytes.md)

## Hands-on experiments

- [Swift Playground](Tokenization.playground/contents.swift) — tiny tokenizer, error handling, and round-trip checks. Open `Tokenization.playground` in Xcode.
- [Swift modern Playground source](Tokenization.swift) — `#Playground` version for Xcode environments that support it.
- [Python Jupyter notebook](Tokenization_Experiments.ipynb) — tiny tokenizer, round-trip checks, `tiktoken` comparison, and UTF-8 bytes.

The `tiktoken` notebook cells require `tiktoken` (`%pip install tiktoken` is included). The Romanian-diacritics `tiktoken` experiment was deliberately not included as a measured result: it was not run in our original study.

## What we learned

We began with one sentence—`Pisica doarme.`—and gradually discovered that:

- A token is not necessarily a whole word.
- Whitespace and punctuation matter when preserving text.
- Unknown tokens must not be silently discarded in a lossless educational pipeline.
- Round-trip tests reveal whether our representation preserves the original input.
- Subword tokenization reuses smaller text pieces; these are not necessarily linguistic roots.
- The same conceptual tokenizer can be implemented in Swift or Python.
- Real tokenizers can produce different pieces, IDs, and token counts for the same text.
- Unicode characters, UTF-8 bytes, tokens, and token IDs are distinct concepts.

### The next question

We now understand how text becomes **token IDs**. But IDs are just identifiers.

**How does an LLM turn those IDs into numerical representations from which it can learn patterns and relationships?**

Next stop: **Embeddings — from token IDs to vectors.**

---

**Understand first. Build second.**

🚫🖊️💻 **NO PENS ON LAPTOP.**
