  //
  //  Fail_IntroViewModel.swift
  //  Publishers
  //
  //  Created by Yusuf Turan on 5.10.2021.
  //

import Foundation
import Combine

enum InvalidAgeError: String, Error, Identifiable {
  var id: String { rawValue }
  case lessThanZero = "Cannot be less than zero"
  case moreThanOneHundred = "Cannot be more than 100"
}

class Validators {
  static func validAgePublisher(age: Int) -> AnyPublisher<Int, InvalidAgeError> {
    if age < 0 {
      return Fail(error: InvalidAgeError.lessThanZero).eraseToAnyPublisher()
    } else if age > 100 {
      return Fail(error: InvalidAgeError.moreThanOneHundred).eraseToAnyPublisher()
    }
    return Just(age)
      .setFailureType(to: InvalidAgeError.self)
      .eraseToAnyPublisher()
  }
}

class Fail_IntroViewModel: ObservableObject {
  @Published var age = 0
  @Published var error: InvalidAgeError?
  
  func save(age: Int) {
    _ = Validators.validAgePublisher(age: age)
      .sink { [unowned self] completion in
        if case .failure(let error) = completion {
          self.error = error
        }
      } receiveValue: { [unowned self] age in
        self.age = age
      }
  }
}
