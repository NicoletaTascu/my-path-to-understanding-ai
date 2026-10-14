# Lesson 3 — Understanding Tokenization

## Part 4 — Can we reconstruct the original text?

Recovering a token list is not yet the same as recovering a sentence. We also need to concatenate the tokens **without adding or removing characters**:

```swift
let tokens = ["Pisica", " ", "doarme", "."]
let reconstructedText = tokens.joined()
// "Pisica doarme."
```

Then we tested a more interesting case:

```text
"Pisica   doarme."
```

There are **three spaces** between the words.

If a regular expression uses `\s+`, it groups consecutive whitespace characters into a single token: `"   "`. But our vocabulary contains only `" "`, not `"   "`.

We changed the whitespace branch to `\s`, so each space is captured separately:

```swift
let pattern = "[A-Za-z0-9ăâîșțĂÂÎȘȚ]+|\\s|."

func tokenized(text: String) -> [String] {
    let regex = try! NSRegularExpression(pattern: pattern)
    let range = NSRange(text.startIndex..<text.endIndex, in: text)
    return regex.matches(in: text, range: range).compactMap { match in
        Range(match.range, in: text).map { String(text[$0]) }
    }
}
```

This is a deliberately simplified expression for our experiment, **not** a complete Unicode tokenizer. Other whitespace characters and some Unicode text are outside our tiny vocabulary.

Our test now looks like this:

```text
Text:       "Pisica   doarme."
Tokens:     ["Pisica", " ", " ", " ", "doarme", "."]
Token IDs:  [0, 3, 3, 3, 1, 2]
Decoded:    ["Pisica", " ", " ", " ", "doarme", "."]
Rebuilt:    "Pisica   doarme."
```

And we can verify the complete **round-trip**:

```swift
let text = "Pisica   doarme."
let tokens = tokenized(text: text)
let ids = try encode(for: tokens)
let decodedTokens = try decode(for: ids)
let reconstructedText = decodedTokens.joined()

assert(reconstructedText == text)
```

**AHA:** A vocabulary assigns identities to tokens; a token sequence preserves **order and repetition**. We can use the same space ID three times instead of inventing a special ID for three spaces. For inputs our tokenizer can represent, we want a lossless round-trip.

**Next question:** Must we add every new word to the vocabulary?
