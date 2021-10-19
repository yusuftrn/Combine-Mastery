//
//  Breakpoint_IntroViewModel.swift
//  ErrorHandlingDebugging
//
//  Created by Yusuf Turan on 19.10.2021.
//

import SwiftUI
import Combine

class Breakpoint_IntroViewModel: ObservableObject {
  @Published var dataToView: [String] = []
  
  func fetch() {
    let dataIn = ["Mercury", "Venus", "%Haley's Comet%", "Earth"]
    
    _ = dataIn.publisher
      .breakpoint(
        receiveSubscription: { subscription in
          print("Subscriber has connected")
          return false
      },
        receiveOutput: { value in
          print("Value: \(value) came through pipeline.")
          return value.contains("%")
      },
        receiveCompletion: { completion in
          print("Pipeline is about to complete")
          return false
      })
      .sink(receiveCompletion: { completion in
        print("Pipeline completed")
      }, receiveValue: { [unowned self] item in
        dataToView.append(item)
      })
  }
}
