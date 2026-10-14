# Lesson 3 — Understanding Tokenization

## Part 2 — Building our first vocabulary

So our initial vocabulary included them:

```swift
let vocabulary: [String: Int] = [
    "Pisica": 0,
    "doarme": 1,
    ".": 2,
    " ": 3
]
```

Now the sentence becomes:

```text
["Pisica", " ", "doarme", "."] → [0, 3, 1, 2]
```

**AHA:** A token is a piece of text defined by a tokenizer's rules. It may be a word, part of a word, punctuation, or whitespace. A token ID is an identifier within a specific vocabulary—not a semantic vector.

**Next question:** What happens when a piece is missing from the vocabulary?
