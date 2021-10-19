//
//  Catch_IntroViewModel.swift
//  ErrorHandlingDebugging
//
//  Created by Yusuf Turan on 17.10.2021.
//

import Foundation
import Combine

struct BombDetectedError: Error, Identifiable {
  let id = UUID()
}

class Catch_IntroViewModel: ObservableObject {
  @Published var dataToView: [String] = []
  
  func fetch() {
    let dataIn = ["Value 1", "Value 2", "Value 3", "🧨", "Value 5", "Value 6"]
    _ = dataIn.publisher
      .tryMap { item in
        if item == "🧨" {
          throw BombDetectedError()
        }
        return item
      }
      .catch { error in
        Just("Error Found!")
      }
      .sink { [unowned self] (item) in
        dataToView.append(item)
      }
  }
}
