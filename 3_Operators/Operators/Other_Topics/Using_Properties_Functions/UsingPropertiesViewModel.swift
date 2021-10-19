//
//  UsingPropertiesViewModel.swift
//  Operators
//
//  Created by Yusuf Turan on 17.10.2021.
//

import Foundation
import Combine

class UsingPropertiesViewModel: ObservableObject {
  @Published var firstName = ""
  @Published var lastName = ""
  @Published var team: [String] = []
  
  var firstNamePublisher = Just("Mark")
  var lastNameUppercased: Just<String> {
    Just("Moeykens")
      .map { $0.uppercased() }
  }
  
  func teamPipeline(uppercased: Bool) -> AnyCancellable {
    ["Lisandro", "Denise", "Daniel"].publisher
      .map { uppercased ? $0.uppercased() : $0 }
      .sink { [unowned self] name in
        team.append(name)
      }
  }
  func fetch() {
    firstNamePublisher
      .map { $0.uppercased() }
      .assign(to: &$firstName)
    lastNameUppercased
      .assign(to: &$lastName)
    
    _ = teamPipeline(uppercased: true)
  }
}
