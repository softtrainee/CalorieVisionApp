//
//  EditIngredientView.swift
//  CalorieVisionApp
//
//  Created by Mohit Gupta on 04/06/25.
//

import SwiftUI

struct EditIngredientView: View {
    @Binding var ingredients: [Ingredient]
    @Environment(\.presentationMode) private var presentationMode

    var body: some View {
        NavigationView {
            List {
                ForEach($ingredients) { $ingredient in
                    VStack(alignment: .leading) {
                        TextField("Ingredient", text: $ingredient.name)
                        HStack {
                            Text("Calories")
                            TextField("", value: $ingredient.calories, formatter: NumberFormatter())
                                .keyboardType(.decimalPad)
                        }
                        ForEach(Array(ingredient.nutrients.keys), id: \.self) { key in
                            HStack {
                                Text("\(key.capitalized)")
                                TextField("", value: Binding(
                                    get: { ingredient.nutrients[key] ?? 0 },
                                    set: { ingredient.nutrients[key] = $0 }
                                ), formatter: NumberFormatter())
                                    .keyboardType(.decimalPad)
                            }
                        }
                    }
                    .padding(.vertical, 4)
                }
                .onDelete { idx in
                    ingredients.remove(atOffsets: idx)
                }
            }
            .navigationTitle("Edit Ingredients")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") { presentationMode.wrappedValue.dismiss() }
                }
                ToolbarItem(placement: .destructiveAction) {
                    Button("Add") {
                        ingredients.append(Ingredient(name: "", calories: 0, nutrients: [:]))
                    }
                }
            }
        }
    }
}
