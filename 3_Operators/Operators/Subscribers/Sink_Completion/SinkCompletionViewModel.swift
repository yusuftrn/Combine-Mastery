//
//  SinkCompletionViewModel.swift
//  Operators
//
//  Created by Yusuf Turan on 17.10.2021.
//

import Foundation
import Combine

class SinkCompletionViewModel: ObservableObject {
  @Published var data = ""
  @Published var isProcessing = false
  var cancellables: Set<AnyCancellable> = []
  
  func fetch() {
    isProcessing = true
    [1, 2, 3, 4, 5].publisher
      .delay(for: 1, scheduler: RunLoop.main)
      .sink { [unowned self] completion in
        isProcessing = false
      } receiveValue: { [unowned self] value in
        data = data.appending(String(value))
      }
      .store(in: &cancellables)
  }
}

