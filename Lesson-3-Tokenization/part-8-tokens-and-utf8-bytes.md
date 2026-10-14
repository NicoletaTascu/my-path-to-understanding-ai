# Lesson 3 — Understanding Tokenization

## Part 8 — Tokens and UTF-8 bytes

Our token inspection displayed values such as `b'P'` and `b'ica'`. In Python, the `b` prefix denotes a **bytes** object rather than a Unicode `str`.

```python
text = "Pisica"
encoded_text = text.encode("utf-8")

print(type(text))          # <class 'str'>
print(type(encoded_text))  # <class 'bytes'>
print(encoded_text)        # b'Pisica'
```

For ASCII characters, UTF-8 uses one byte per character. But not every character uses one byte.

For example:

```python
print("s".encode("utf-8"))  # b's'
print("ș".encode("utf-8"))  # b'\xc8\x99'
```

The Romanian letter `ș` (U+0219) is represented by **two UTF-8 bytes**, `C8 99` in hexadecimal.

What happens if we separate them?

```python
encoded = "ș".encode("utf-8")
first_part = encoded[:1]    # b'\xc8'
second_part = encoded[1:]   # b'\x99'

# Neither part can be decoded independently as valid UTF-8.
# But their concatenation can:
assert (first_part + second_part).decode("utf-8") == "ș"
```

**AHA:** A character, a byte, and a token are different units. A token's bytes are not guaranteed to form independently decodable UTF-8 text. That is why inspecting raw token bytes can be safer than assuming every token is a complete character or string.

This explains the usefulness of:

```python
tokenizer.decode_single_token_bytes(token_id)
```

For full-text reconstruction, we use:

```python
tokenizer.decode(token_ids)
```

We **did not run** a separate `tiktoken` experiment measuring how Romanian diacritics are split across tokens. Our UTF-8 example demonstrates the underlying byte-level principle, not a measured tokenization result for `ș`.
