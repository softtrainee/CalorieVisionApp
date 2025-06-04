//
//  CameraView.swift
//  CalorieVisionApp
//
//  Created by Mohit Gupta on 04/06/25.
//

import SwiftUI

struct CameraView: View {
    @ObservedObject var viewModel: CameraViewModel

    var body: some View {
        VStack {
            if let image = viewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 300)
            } else {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 300)
                    .overlay(Text("No Photo").foregroundColor(.gray))
            }

            Button(action: {
                viewModel.takePhoto()
            }) {
                Label("Take Photo", systemImage: "camera")
            }
            .padding()
        }
        .sheet(isPresented: $viewModel.isShowingImagePicker) {
            ImagePicker(image: $viewModel.image)
        }
    }
}
