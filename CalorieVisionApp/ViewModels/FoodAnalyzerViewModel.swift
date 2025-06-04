//
//  FoodAnalyzerViewModel.swift
//  CalorieVisionApp
//
//  Created by Mohit Gupta on 04/06/25.
//

import Foundation
import UIKit

@MainActor
class FoodAnalyzerViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var analyzedIngredients: [Ingredient] = []
    @Published var errorMessage: String?

    func analyzeFood(with image: UIImage) async {
        isLoading = true
        defer { isLoading = false }
        guard let imgData = image.jpegData(compressionQuality: 0.7) else {
            errorMessage = "Could not convert image."
            return
        }
        do {
            let result = try await OpenAIVisionAPI.analyzeFood(imageData: imgData)
            analyzedIngredients = result
        } catch {
            // Uncomment for UI testing without OpenAI:
//             analyzedIngredients = [Ingredient(name: "Apple", calories: 95, nutrients: ["carbs": 25, "protein": 0.5, "fat": 0.3])]
//            analyzedIngredients = [Ingredient(name: "Tomato", calories: 22, nutrients: ["carbs": 4.8,"protein": 1.1,"fat": 0.2])]
            analyzedIngredients = [Ingredient(name: "Carrot",calories: 41,nutrients: [ "carbs": 9.6,"protein": 0.9,"fat": 0.2])]
            errorMessage = error.localizedDescription
        }
    }
}
