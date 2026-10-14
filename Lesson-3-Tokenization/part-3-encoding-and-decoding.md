# Lesson 3 — Understanding Tokenization

## Part 3 — Encoding and decoding

Encoding maps tokens to IDs, while decoding maps those IDs back to tokens. What happens if one of the tokens cannot be found in our vocabulary?

### Handling an unknown token

Consider:

```text
Pisica alearga.
```

Our vocabulary has no entry for `"alearga"`.

An initial idea was to use `compactMap`:

```swift
let ids = tokens.compactMap { vocabulary[$0] }
```

But `compactMap` silently drops tokens that cannot be mapped. For the token sequence:

```text
["Pisica", " ", "alearga", "."]
```

we would get:

```text
[0, 3, 2]
```

Decoding would reconstruct `"Pisica ."`, not the original sentence. We have **lost information without noticing**.

Instead, we decided that an unknown token should produce an explicit error:

```swift
enum TokenizerError: Error {
    case unknownToken(String)
    case unknownTokenId(Int)
}

func encode(for tokens: [String]) throws -> [Int] {
    try tokens.map { token in
        guard let id = vocabulary[token] else {
            throw TokenizerError.unknownToken(token)
        }
        return id
    }
}
```

Decoding requires the reverse mapping:

```swift
let reverseVocabulary = Dictionary(
    uniqueKeysWithValues: vocabulary.map { ($0.value, $0.key) }
)

func decode(for ids: [Int]) throws -> [String] {
    try ids.map { id in
        guard let token = reverseVocabulary[id] else {
            throw TokenizerError.unknownTokenId(id)
        }
        return token
    }
}
```

The reverse mapping works because every token has a unique ID.

**AHA:** Silently discarding unknown tokens is not a valid strategy when we need to preserve the text. Our educational tokenizer either represents the input completely or reports what it cannot represent.

**Next question:** If we can recover all the tokens, can we reconstruct the exact original text?
