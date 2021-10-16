//
//  Receive_IntroViewModel.swift
//  Operators
//
//  Created by Yusuf Turan on 16.10.2021.
//

import SwiftUI
import Combine

struct ReceiveError: Identifiable, Error {
  let id = UUID()
  let title = "Error"
  let message: String
}
class Receive_IntroViewModel: ObservableObject {
  @Published var imageView = Image("blank_image")
  @Published var receiveError: ReceiveError?
  var cancellables: Set<AnyCancellable> = []
  
  func fetch() {
    let url = URL(string: "https://picsum.photos/200/300")!
    URLSession.shared.dataTaskPublisher(for: url)
      .map { $0.data }
      .tryMap { data in
        guard let uiImage = UIImage(data: data) else {
          throw ReceiveError(message: "Did not receive a valid image.")
        }
        return Image(uiImage: uiImage)
      }
      .receive(on: RunLoop.main)
      .sink(receiveCompletion: { [unowned self] completion in
        if case .failure(let error) = completion {
          if error is ErrorForAlert {
            receiveError = (error as! ReceiveError)
          } else {
            receiveError = ReceiveError(message: "Details: \(error.localizedDescription)")
          }
        }
      }, receiveValue: { [unowned self] image in
        imageView = image
      })
    .store(in: &cancellables)  }
}
