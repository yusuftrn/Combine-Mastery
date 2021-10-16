//
//  SinkCompletionErrorViewModel.swift
//  Operators
//
//  Created by Yusuf Turan on 17.10.2021.
//

import Foundation
import Combine

struct NumberFiveError: Error {
}

class SinkCompletionErrorViewModel: ObservableObject {
  @Published var data = ""
  @Published var showErrorAlert = false
  @Published var errorMessage = "Cannot process numbers greater than 5."
  
  var cancellable: AnyCancellable?
  
  func fetch() {
    cancellable = [1,2,3,4,5].publisher
      .tryMap { (value) -> String in
        if value >= 5 {
          throw NumberFiveError()
        }
        return String(value)
      }
      .sink { [unowned self] (completion) in
        switch completion {
          case .failure(_):
            showErrorAlert.toggle()
          case .finished:
            print(completion)
        }
        data = String(data.dropLast(2))
      } receiveValue: { [unowned self] (value) in
        data = data.appending("\(value), ")
      }
  }
}
