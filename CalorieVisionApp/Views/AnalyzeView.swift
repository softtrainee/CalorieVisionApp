//
//  AnalyzeView.swift
//  CalorieVisionApp
//
//  Created by Mohit Gupta on 04/06/25.
//

import SwiftUI

struct AnalyzeView: View {
    @ObservedObject var cameraVM: CameraViewModel
    @StateObject var analyzerVM = FoodAnalyzerViewModel()
    @ObservedObject var historyVM: FoodHistoryViewModel

    @State private var showEdit = false

    var body: some View {
        VStack {
            CameraView(viewModel: cameraVM)

            if let image = cameraVM.image {
                if analyzerVM.isLoading {
                    ProgressView("Analyzing...")
                } else if !analyzerVM.analyzedIngredients.isEmpty {
                    List {
                        ForEach(analyzerVM.analyzedIngredients) { ingredient in
                            VStack(alignment: .leading) {
                                Text(ingredient.name).font(.headline)
                                Text("Calories: \(Int(ingredient.calories)) kcal")
                                if !ingredient.nutrients.isEmpty {
                                    Text("Nutrients: " + ingredient.nutrients.map { "\($0): \($1)" }.joined(separator: ", "))
                                        .font(.caption)
                                }
                            }
                        }
                    }
                    .frame(height: 220)
                    .onTapGesture {
                        showEdit = true
                    }
                    Text("Total: \(Int(analyzerVM.analyzedIngredients.reduce(0) { $0 + $1.calories })) kcal")
                        .font(.title3)
                        .padding(.bottom)

                    Button("Save to History") {
                        let record = FoodRecord(
                            id: UUID(), date: Date(),
                            photoData: image.jpegData(compressionQuality: 0.6),
                            ingredients: analyzerVM.analyzedIngredients
                        )
                        historyVM.add(record: record)
                        cameraVM.image = nil
                        analyzerVM.analyzedIngredients = []
                    }
                    .buttonStyle(.borderedProminent)
                } else {
                    Button("Analyze Photo") {
                        Task {
                            await analyzerVM.analyzeFood(with: image)
                        }
                    }
                    .buttonStyle(.bordered)
                }
            }
        }
        .sheet(isPresented: $showEdit) {
            EditIngredientView(ingredients: $analyzerVM.analyzedIngredients)
        }
        .alert(isPresented: Binding<Bool>(
            get: { analyzerVM.errorMessage != nil },
            set: { _ in analyzerVM.errorMessage = nil }
        )) {
            Alert(title: Text("Error"), message: Text(analyzerVM.errorMessage ?? ""), dismissButton: .default(Text("OK")))
        }
    }
}
