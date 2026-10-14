import Playgrounds

#Playground {

    // Lesson 3 — Understanding Tokenization
    // A deliberately small, educational vocabulary.
    let vocabulary: [String: Int] = [
        "Pisica": 0,
        "doarme": 1,
        ".": 2,
        " ": 3
    ]

    let reverseVocabulary = Dictionary(
        uniqueKeysWithValues: vocabulary.map { ($0.value, $0.key) }
    )

    enum TokenizerError: Error {
        case unknownToken(String)
        case unknownTokenId(Int)
    }

    func tokenized(text: String) -> [String] {
        // Each whitespace character is its own token.
        // This is not a complete Unicode tokenizer.
        let pattern = "[A-Za-z0-9ăâîșțĂÂÎȘȚ]+|\\s|."
        guard let regex = try? NSRegularExpression(pattern: pattern) else {
            return []
        }
        let range = NSRange(text.startIndex..<text.endIndex, in: text)
        return regex.matches(in: text, range: range).compactMap { match in
            Range(match.range, in: text).map { String(text[$0]) }
        }
    }

    func encode(for tokens: [String]) throws -> [Int] {
        try tokens.map { token in
            guard let id = vocabulary[token] else {
                throw TokenizerError.unknownToken(token)
            }
            return id
        }
    }

    func decode(for ids: [Int]) throws -> [String] {
        try ids.map { id in
            guard let token = reverseVocabulary[id] else {
                throw TokenizerError.unknownTokenId(id)
            }
            return token
        }
    }

    func runTokenizerPipeline(for text: String) throws -> String {
        let tokens = tokenized(text: text)
        let ids = try encode(for: tokens)
        return try decode(for: ids).joined()
    }

    func runExperiments() {
        let text = "Pisica   doarme."
        let tokens = tokenized(text: text)
        print("Original:", String(reflecting: text))
        print("Tokens:", tokens)
        do {
            let ids = try encode(for: tokens)
            let decoded = try decode(for: ids)
            let reconstructed = decoded.joined()
            print("IDs:", ids)
            print("Reconstructed:", String(reflecting: reconstructed))
            assert(reconstructed == text, "Round-trip failed")
            let pipelineResult = try runTokenizerPipeline(for: text)
            assert(pipelineResult == text)
            print("Round-trip successful")
        } catch {
            print("Unexpected error:", error)
        }

        // Unknown words must not silently disappear.
        do {
            _ = try encode(for: tokenized(text: "Pisica alearga."))
            assertionFailure("Expected an unknown-token error")
        } catch TokenizerError.unknownToken(let token) {
            print("Expected unknown token:", token)
        } catch {
            print("Unexpected error:", error)
        }

        do {
            _ = try decode(for: [999])
            assertionFailure("Expected an unknown-token-ID error")
        } catch TokenizerError.unknownTokenId(let id) {
            print("Expected unknown token ID:", id)
        } catch {
            print("Unexpected error:", error)
        }
    }

    runExperiments()
}
