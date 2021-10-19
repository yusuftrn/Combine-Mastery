//
//  TryCatch_IntroViewModel.swift
//  ErrorHandlingDebugging
//
//  Created by Yusuf Turan on 17.10.2021.
//

import SwiftUI
import Combine

class TryCatch_IntroViewModel: ObservableObject {
  @Published var dataToView: [String] = []
  @Published var error: BombDetectedError?
  
  func fetch() {
    let dataIn = ["Value 1", "Value 2", "Value 3", "🧨", "Value 5", "Value 6"]
    _ = dataIn.publisher
      .tryMap { item in
        if item == "🧨" {
          throw BombDetectedError()
        }
        return item
      }
      .tryCatch { [unowned self] (error) in
        fetchAlternativeData()
      }
      .sink { [unowned self] completion in
        if case .failure(let error) = completion {
          self.error = error as? BombDetectedError
        }
      } receiveValue: { [unowned self] item in
        dataToView.append(item)
      }
  }
  
  func fetchAlternativeData() -> AnyPublisher<String, Error> {
    let sampleData = ["Alternate Value 1", "Alternate Value 2", "🧨", "Alternate Value 3"]
    
    return sampleData.publisher
      .tryMap { item -> String in
        if item == "🧨" { throw BombDetectedError() }
        return item
      }
      .eraseToAnyPublisher()
  }
}
