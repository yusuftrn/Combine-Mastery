//
//  DelayFor_IntroViewModel.swift
//  Operators
//
//  Created by Yusuf Turan on 16.10.2021.
//

import Foundation
import Combine

class DelayFor_IntroViewModel: ObservableObject {
  @Published var data = ""
  @Published var isFetching = false
  var delayForSeconds = 1
  var cancellable: AnyCancellable?
  
  func fetch() {
    isFetching = true
    let dataIn = ["Value 1", "Value 2", "Value 3"]
    cancellable = dataIn.publisher
      .delay(for: .seconds(delayForSeconds), scheduler: RunLoop.main)
      .first()
      .sink { [unowned self] completion in
        isFetching = false
      } receiveValue: { [unowned self] firstValue in
        data = firstValue
      }
  }
}

