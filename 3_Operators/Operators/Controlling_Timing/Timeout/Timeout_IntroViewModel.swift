//
//  Timeout_IntroViewModel.swift
//  Operators
//
//  Created by Yusuf Turan on 16.10.2021.
//

import Foundation
import Combine

struct TimeoutError: Identifiable, Error {
  let id = UUID()
  let title = "Timeout"
  let message = "Please try again later."
}

class Timeout_IntroViewModel: ObservableObject {
  @Published var dataToView: [String] = []
  @Published var isFetching = false
  @Published var timeoutError: TimeoutError?
  private var cancellable: AnyCancellable?
  
  func fetch() {
    isFetching = true
    let url = URL(string: "https://bigmountainstudio.com/nothing")!
    cancellable = URLSession.shared.dataTaskPublisher(for: url)
      .timeout(.seconds(0.3), scheduler: RunLoop.main, customError: { URLError(.timedOut) })
      .map { $0.data }
      .decode(type: String.self, decoder: JSONDecoder())
      .sink(receiveCompletion: { [unowned self] completion in
        isFetching = false
        if case .failure(URLError.timedOut) = completion {
          timeoutError = TimeoutError()
        }
      }, receiveValue: { [unowned self] value in
        dataToView.append(value)
      })
  }
}
