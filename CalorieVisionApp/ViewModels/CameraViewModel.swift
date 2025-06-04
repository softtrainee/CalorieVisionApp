//
//  CameraViewModel.swift
//  CalorieVisionApp
//
//  Created by Mohit Gupta on 04/06/25.
//

import SwiftUI
import AVFoundation

class CameraViewModel: NSObject, ObservableObject, AVCapturePhotoCaptureDelegate {
    @Published var image: UIImage? = nil
    @Published var isShowingImagePicker = false

    func takePhoto() {
        isShowingImagePicker = true
    }
}
