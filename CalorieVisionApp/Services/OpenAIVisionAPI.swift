//
//  OpenAIVisionAPI.swift
//  CalorieVisionApp
//
//  Created by Mohit Gupta on 04/06/25.
//

import Foundation

enum OpenAIVisionAPI {
    // Replace with your OpenAI test key
    static let apiKey = "YOUR_OPENAI_API_KEY"
    

    static let apiURL = "https://api.openai.com/v1/chat/completions"

    static func analyzeFood(imageData: Data) async throws -> [Ingredient] {
        var request = URLRequest(url: URL(string: apiURL)!)
        request.httpMethod = "POST"
        request.addValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let base64Image = imageData.base64EncodedString()
        let prompt = """
        Analyze the food in this image. List each ingredient with calories and common nutrients (fat, carbs, protein) per ingredient, in JSON array [{name,calories,nutrients:{...}}]. Be concise.
        """

        let payload: [String: Any] = [
            "model": "gpt-4.1",
            "messages": [
                [
                    "role": "user",
                    "content": [
                        ["type": "text", "text": prompt],
                        ["type": "image_url", "image_url": ["url": "data:image/jpeg;base64,\(base64Image)"]]
                    ]
                ]
            ],
            "max_tokens": 400
        ]

        request.httpBody = try JSONSerialization.data(withJSONObject: payload, options: [])

        let (data, _) = try await URLSession.shared.data(for: request)

        struct Response: Decodable {
            struct Choice: Decodable {
                struct Message: Decodable {
                    let content: String
                }
                let message: Message
            }
            let choices: [Choice]
        }

        let result = try JSONDecoder().decode(Response.self, from: data)
        guard let string = result.choices.first?.message.content else {
            throw NSError(domain: "OpenAI", code: 1, userInfo: [NSLocalizedDescriptionKey: "No response"])
        }

        // Try to extract JSON from the string response robustly
        if let arr = tryDecodeIngredients(from: string) {
            return arr
        } else if let arr = extractJSONAndDecodeIngredients(from: string) {
            return arr
        } else {
            throw NSError(domain: "OpenAI", code: 2, userInfo: [NSLocalizedDescriptionKey: "Could not parse ingredients"])
        }
    }

    /// Try to decode the entire string as a JSON array of Ingredient.
    private static func tryDecodeIngredients(from string: String) -> [Ingredient]? {
        guard let data = string.data(using: .utf8) else { return nil }
        return try? JSONDecoder().decode([Ingredient].self, from: data)
    }

    /// Extract the first [...] block and try to decode it as [Ingredient].
    private static func extractJSONAndDecodeIngredients(from string: String) -> [Ingredient]? {
        guard let start = string.firstIndex(of: "["),
              let end = string.lastIndex(of: "]"),
              start < end else {
            return nil
        }
        let jsonSubstring = String(string[start...end])
        guard let jsonData = jsonSubstring.data(using: .utf8) else { return nil }
        return try? JSONDecoder().decode([Ingredient].self, from: jsonData)
    }
}
