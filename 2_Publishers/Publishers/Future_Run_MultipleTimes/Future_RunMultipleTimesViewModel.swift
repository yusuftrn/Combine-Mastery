//
//  Future_RunMultipleTimesViewModel.swift
//  Publishers
//
//  Created by Yusuf Turan on 6.10.2021.
//

import Foundation
import Combine

class Future_RunMultipleTimesViewModel: ObservableObject {
  @Published var firstResult = ""
  @Published var secondResult = ""
  
  let futurePublisher = Deferred {
    Future<String, Never> { promise in
    promise(.success("Future Publisher has run!"))
    print("Future Publisher has run!")
    }
  }
  
  func fetch() {
    futurePublisher
      .assign(to: &$firstResult)
  }
  
  func runAgain() {
    futurePublisher
      .assign(to: &$secondResult)
  }
}

