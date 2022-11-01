//
//  TestViewModel.swift
//  ParallelAsyncAwait
//
//  Created by Roberto Rojo Sahuquillo on 1/11/22.
//

import Foundation
import SwiftUI

final class TestViewModel: ObservableObject {
    func loadImage(index: Int) async throws -> Image {
        let imageURL = URL(string: "https://i.blogs.es/f7b0ed/steve-jobs/1366_2000.jpg")!
        //Create request
        let request = URLRequest(url: imageURL)
        //AsyncAwait from request
        let (data, _) = try await URLSession.shared.data(for: request)
        print("Load image finished \(index)")
        //Create Image from UIImage -> data
        return Image(uiImage: UIImage(data: data)!)
    }
    //Call parallel 3 images
    func loadImages() {
        Task{ //Need to call asyncronous functions
            async let firstImage = loadImage(index: 1)
            async let secondImage = loadImage(index: 2)
            async let thirdImage = loadImage(index: 3)
            
            let _ = try await [firstImage, secondImage, thirdImage]
            
            print("Here we have three images")
        }
    }
}
