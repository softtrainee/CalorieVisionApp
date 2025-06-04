//
//  HistoryView.swift
//  CalorieVisionApp
//
//  Created by Mohit Gupta on 04/06/25.
//

import SwiftUI

struct HistoryView: View {
    @ObservedObject var viewModel: FoodHistoryViewModel

    @State private var selectedDate: Date? = nil

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.records.sorted { $0.date > $1.date }) { record in
                    Button {
                        selectedDate = record.date
                    } label: {
                        HStack {
                            if let data = record.photoData, let uiImage = UIImage(data: data) {
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                            }
                            VStack(alignment: .leading) {
                                Text(record.date, style: .date)
                                Text("\(Int(record.totalCalories)) kcal")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                    .sheet(isPresented: Binding<Bool>(
                        get: { selectedDate == record.date },
                        set: { show in if !show { selectedDate = nil } }
                    )) {
                        HistoryDetailView(record: record)
                    }
                }
            }
            .navigationTitle("Food Log")
        }
    }
}

struct HistoryDetailView: View {
    let record: FoodRecord

    var body: some View {
        VStack(spacing: 16) {
            if let data = record.photoData, let uiImage = UIImage(data: data) {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 220)
            }
            Text(record.date, style: .date)
            List {
                ForEach(record.ingredients) { ingredient in
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
            Text("Total: \(Int(record.totalCalories)) kcal")
                .font(.title3)
        }
        .padding()
    }
}
