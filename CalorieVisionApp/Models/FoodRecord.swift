//
//  FoodRecord.swift
//  CalorieVisionApp
//
//  Created by Mohit Gupta on 04/06/25.
//

import Foundation

struct Ingredient: Identifiable, Codable, Equatable {
    let id: UUID
    var name: String
    var calories: Double
    var nutrients: [String: Double] // e.g., ["fat": 9.2, "protein": 5.1]

    init(id: UUID = UUID(), name: String, calories: Double, nutrients: [String: Double] = [:]) {
        self.id = id
        self.name = name
        self.calories = calories
        self.nutrients = nutrients
    }
}

struct FoodRecord: Identifiable, Codable, Equatable {
    let id: UUID
    var date: Date
    var photoData: Data?
    var ingredients: [Ingredient]
    var totalCalories: Double {
        ingredients.reduce(0) { $0 + $1.calories }
    }
}
