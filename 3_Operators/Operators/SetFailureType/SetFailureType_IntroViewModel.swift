//
//  SetFailureType_IntroViewModel.swift
//  Operators
//
//  Created by Yusuf Turan on 16.10.2021.
//

import Foundation
import Combine

struct ErrorForAlert: Error, Identifiable {
  let id = UUID()
  let title = "Error"
  var message = "Please try again later."
}
class SetFailureType_IntroViewModel: ObservableObject {
  @Published var states: [String] = []
  @Published var error: ErrorForAlert?
  let westernData = ["Utah", "Nevada", "Colorado", "🧨", "Idaho"]
  let easternData = ["Vermont", "New Hampshire", "Maine", "🧨", "Rhode Island"]
  
  func getPipeline(westernStates: Bool) -> AnyPublisher<String, Error> {
    if westernStates {
      return westernData.publisher
        .tryMap { item -> String in
          if item == "🧨" { throw ErrorForAlert() }
          return item
        }
        .eraseToAnyPublisher()
    } else {
      return easternData.publisher
        .map { item -> String in
          if item == "🧨" { return "Massachussetts" }
          return item
        }
        .setFailureType(to: Error.self)
        .eraseToAnyPublisher()
    }
  }
  
  func fetch(westernStates: Bool) {
    states.removeAll()
    _ = getPipeline(westernStates: westernStates)
      .sink { [unowned self] completion in
        if case .failure(let error) = completion {
          self.error = error as? ErrorForAlert
        }
      } receiveValue: { [unowned self] state in
        states.append(state)
      }
  }
}
