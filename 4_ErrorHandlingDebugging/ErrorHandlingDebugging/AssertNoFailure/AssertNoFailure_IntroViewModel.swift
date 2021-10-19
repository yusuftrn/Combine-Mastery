//
//  AssertNoFailure_IntroViewModel.swift
//  ErrorHandlingDebugging
//
//  Created by Yusuf Turan on 17.10.2021.
//

import Foundation
import Combine

struct InvalidValueError: Error {}

class AssertNoFailure_IntroViewModel: ObservableObject {
  @Published var dataToView: [String] = []
  
  func fetch() {
    let dataIn = ["Value 1", "Value 2", "🧨", "Value 3"]
    _ = dataIn.publisher
      .tryMap { item in
        if item == "🧨" {
          throw InvalidValueError()
        }
        return item
      }
      .assertNoFailure("This should never happen.")
      .sink { [unowned self] item in
        dataToView.append(item)
      }
  }
}
