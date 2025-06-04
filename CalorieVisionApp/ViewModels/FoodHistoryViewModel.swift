//
//  FoodHistoryViewModel.swift
//  CalorieVisionApp
//
//  Created by Mohit Gupta on 04/06/25.
//

import Foundation

class FoodHistoryViewModel: ObservableObject {
    @Published var records: [FoodRecord] = []

    private let storageKey = "food_records"

    init() {
        load()
    }

    func add(record: FoodRecord) {
        records.append(record)
        save()
    }

    func update(record: FoodRecord) {
        if let idx = records.firstIndex(where: { $0.id == record.id }) {
            records[idx] = record
            save()
        }
    }

    private func save() {
        if let data = try? JSONEncoder().encode(records) {
            UserDefaults.standard.set(data, forKey: storageKey)
        }
    }

    private func load() {
        if let data = UserDefaults.standard.data(forKey: storageKey),
            let decoded = try? JSONDecoder().decode([FoodRecord].self, from: data) {
            self.records = decoded
        }
    }
}
