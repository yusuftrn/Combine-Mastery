//
//  BreakpointOnError_IntroViewModel.swift
//  ErrorHandlingDebugging
//
//  Created by Yusuf Turan on 19.10.2021.
//

import Foundation

struct InvalidPlanetError: Error {}

class BreakpointOnError_IntroViewModel: ObservableObject {
  @Published var dataToView: [String] = []
  
  func fetch() {
    let dataIn = ["Mercury", "Venus", "Earth", "Pluto"]
    
    _ = dataIn.publisher
      .tryMap { item in
        if item == "Pluto" {
          throw InvalidPlanetError()
        }
        return item
      }
      .breakpointOnError()
      .sink(receiveCompletion: { completion in
        print("Pipeline completed.")
      }, receiveValue: { [unowned self] item in
        dataToView.append(item)
      })
  }
}
