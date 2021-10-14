//
//  Future_OnlyRunsOnceViewModel.swift
//  Publishers
//
//  Created by Yusuf Turan on 6.10.2021.
//

import Foundation
import Combine

class Future_OnlyRunsOnceViewModel: ObservableObject {
  @Published var firstResult = ""
  @Published var secondResult = ""
  
  let futurePublisher = Future<String, Never> { promise in
    promise(.success("Future Publisher has run!"))
    print("Future Publisher has run!")
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

