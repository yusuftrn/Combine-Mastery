//
//  Future_IntroViewModel.swift
//  Publishers
//
//  Created by Yusuf Turan on 5.10.2021.
//

import Foundation
import Combine

class Future_IntroViewModel: ObservableObject {
  @Published var hello = ""
  @Published var goodbye = ""
  
  var goodbyeCancellable: AnyCancellable?
  
  func sayHello() {
    Future<String, Never> { promise in
      promise(Result.success("Hello World!"))
    }
    .assign(to: &$hello)
  }
  
  func sayGoodbye() {
    let futurePublisher = Future<String, Never> { promise in
      DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
        promise(Result.success("Goodbyee, my friend!"))
      }
    }
    goodbyeCancellable = futurePublisher
      .sink { [unowned self] message in
        goodbye = message
      }
  }
}


