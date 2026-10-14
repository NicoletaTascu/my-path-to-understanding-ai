# Lesson 3 — Understanding Tokenization

## Part 7 — Exploring real tokenizers with `tiktoken`

We installed `tiktoken` and returned to the same sentence:

```python
import tiktoken

text = "Pisica doarme."
tokenizer = tiktoken.get_encoding("cl100k_base")
token_ids = tokenizer.encode(text)

print(token_ids)
for token_id in token_ids:
    print(token_id, repr(tokenizer.decode_single_token_bytes(token_id)))

assert tokenizer.decode(token_ids) == text
```

Our observed result for **`cl100k_base`** was:

```text
[47, 285, 3074, 656, 74960, 13]

47     b'P'
285    b'is'
3074   b'ica'
656    b' do'
74960  b'arme'
13     b'.'
```

**Six tokens**, even though the sentence contains only two words and a period!

Notice that `b' do'` **includes the preceding space**. Our tiny tokenizer treated spaces separately, but this tokenizer can include whitespace inside a token.

Then we changed only the encoding:

```python
tokenizer = tiktoken.get_encoding("o200k_base")
token_ids = tokenizer.encode(text)
```

Our observed result for **`o200k_base`** was:

```text
[192801, 1578, 621, 50627, 13]

192801  b'Pis'
1578    b'ica'
621     b' do'
50627   b'arme'
13      b'.'
```

This time, **five tokens**.

| Observation | `cl100k_base` | `o200k_base` |
|---|---|---|
| Token count for `Pisica doarme.` | 6 | 5 |
| Pieces for `Pisica` | `P` + `is` + `ica` | `Pis` + `ica` |
| ID for `ica` | `3074` | `1578` |
| ID for ` do` | `656` | `621` |
| ID for `.` | `13` | `13` |

The period happened to have ID `13` in both, but that **does not make token IDs universal**. IDs are defined within each tokenizer's vocabulary. Even identical-looking pieces can have different IDs.

**AHA:** The same text can have different token boundaries, IDs, and token counts depending on the tokenizer. That can matter for context-window usage and token-based pricing. One tokenizer producing fewer tokens for **this** sentence does not mean it is universally more efficient.

Both encodings passed the round-trip test:

```python
for encoding_name in ["cl100k_base", "o200k_base"]:
    tokenizer = tiktoken.get_encoding(encoding_name)
    ids = tokenizer.encode(text)
    assert tokenizer.decode(ids) == text
```

**Next question:** Why do we see `b'...'` rather than ordinary strings?
