//
//  ReplaceError_IntroViewModel.swift
//  ErrorHandlingDebugging
//
//  Created by Yusuf Turan on 17.10.2021.
//

import Foundation
import Combine

class ReplaceError_IntroViewModel: ObservableObject {
  @Published var dataToView: [String] = []
  var replacedValue = "Error Found"
  
  func fetch() {
    let dataIn = ["Value 1", "Value 2", "Value 3", "🧨", "Value 5", "Value 6"]
    _ = dataIn.publisher
      .tryMap { item in
        if item == "" {
          throw BombDetectedError()
        }
        return item
      }
      .replaceError(with: replacedValue)
      .sink { [unowned self] item in
        dataToView.append(item)
      }
  }
  
}
