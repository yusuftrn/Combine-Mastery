//
//  DataTaskPublisher_ForImagesViewModel.swift
//  Publishers
//
//  Created by Yusuf Turan on 15.10.2021.
//

import Foundation
import Combine
import UIKit
import SwiftUI

class DataTaskPublisher_ForImagesViewModel: ObservableObject {
  @Published var imageView: Image?
  @Published var errorForAlert: ErrorForAlert?
  var cancellables: Set<AnyCancellable> = []
  
  func fetch() {
    let url = URL(string: "https://picsum.photos/200/300")!
    URLSession.shared.dataTaskPublisher(for: url)
      .map { $0.data }
      .tryMap { data -> Image in
        guard let uiImage = UIImage(data: data) else {
          throw ErrorForAlert(message: "Didn't receive a valid image.")
        }
        return Image(uiImage: uiImage)
      }
      .receive(on: RunLoop.main)
      .sink { [unowned self] completion in
        if case .failure(let error) = completion {
          if error is ErrorForAlert {
            errorForAlert = error as? ErrorForAlert
          } else {
            errorForAlert = ErrorForAlert(message: "Details: \(error.localizedDescription)")
          }
        }
      } receiveValue: { [unowned self] image in
        imageView = image
      }
      .store(in: &cancellables)
  }
}



