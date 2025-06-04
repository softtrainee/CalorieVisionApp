//
//  MainTabView.swift
//  CalorieVisionApp
//
//  Created by Mohit Gupta on 04/06/25.
//

import SwiftUI

struct MainTabView: View {
    @StateObject var cameraVM = CameraViewModel()
    @StateObject var historyVM = FoodHistoryViewModel()

    var body: some View {
        TabView {
            AnalyzeView(cameraVM: cameraVM, historyVM: historyVM)
                .tabItem {
                    Label("Analyze", systemImage: "camera")
                }
            HistoryView(viewModel: historyVM)
                .tabItem {
                    Label("History", systemImage: "calendar")
                }
        }
    }
}
