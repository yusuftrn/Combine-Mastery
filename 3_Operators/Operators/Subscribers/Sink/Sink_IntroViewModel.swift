//
//  Sink_IntroViewModel.swift
//  Operators
//
//  Created by Yusuf Turan on 17.10.2021.
//

import Foundation
import Combine

class Sink_IntroViewModel: ObservableObject {
  let names = ["Joe", "Nick", "Ramona", "Brad", "Mark", "Paul", "Sean", "Alice", "Kaya", "Emily"]
  
  @Published var newName = ""
  @Published var aToM: [String] = []
  @Published var nToZ: [String] = []
  var cancellable: AnyCancellable?
  
  init() {
    cancellable = $newName
      .dropFirst()
      .sink { [unowned self] name in
        let firstLetter = name.prefix(1)
        if firstLetter < "M" {
          aToM.append(name)
        } else {
          nToZ.append(name)
        }
      }
  }
  
  func fetchRandomName() {
    newName = names.randomElement()!
  }
}
