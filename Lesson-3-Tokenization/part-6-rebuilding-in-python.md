# Lesson 3 — Understanding Tokenization

## Part 6 — Rebuilding the experiment in Python

We rebuilt our tiny tokenizer in Python to test whether we understood the algorithm rather than just the Swift syntax.

The vocabulary is the same mapping:

```python
vocabulary = {
    "Pisica": 0,
    "doarme": 1,
    ".": 2,
    " ": 3,
}
```

Encoding still maps tokens to IDs, and decoding reverses the process. We kept unknown-token errors explicit:

```python
class TokenizerError(Exception):
    pass

class UnknownTokenError(TokenizerError):
    def __init__(self, token: str):
        super().__init__(f"Unknown token: {token!r}")

class UnknownTokenIdError(TokenizerError):
    def __init__(self, token_id: int):
        super().__init__(f"Unknown token ID: {token_id}")


def encode(tokens_list: list[str]) -> list[int]:
    encoded_ids = []
    for token in tokens_list:
        if token not in vocabulary:
            raise UnknownTokenError(token)
        encoded_ids.append(vocabulary[token])
    return encoded_ids


reverse_vocabulary = {value: key for key, value in vocabulary.items()}


def decode(ids_list: list[int]) -> list[str]:
    decoded_tokens = []
    for token_id in ids_list:
        if token_id not in reverse_vocabulary:
            raise UnknownTokenIdError(token_id)
        decoded_tokens.append(reverse_vocabulary[token_id])
    return decoded_tokens
```

For text splitting, we used the same simplified regular expression:

```python
import re


def tokenized(text_to_split: str) -> list[str]:
    pattern = r"[A-Za-z0-9ăâîșțĂÂÎȘȚ]+|\s|."
    return re.findall(pattern, text_to_split)


def run_tokenizer_pipeline(text_input: str) -> list[str]:
    tokens = tokenized(text_input)
    ids = encode(tokens)
    return decode(ids)


text = "Pisica   doarme."
final_tokens = run_tokenizer_pipeline(text)
assert "".join(final_tokens) == text
```

**AHA:** The syntax changed, but the algorithm did not. In both languages, we define a vocabulary, split text, encode, decode, and check the round-trip. The tokenizer's behavior comes from the rules we implement—not from the programming language.

**Next question:** What happens when we try a real tokenizer?
