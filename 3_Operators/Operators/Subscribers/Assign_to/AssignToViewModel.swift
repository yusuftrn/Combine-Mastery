//
//  AssignToViewModel.swift
//  Operators
//
//  Created by Yusuf Turan on 16.10.2021.
//

import Foundation
import Combine

class AssignToViewModel: ObservableObject {
  @Published var name = ""
  @Published var greeting = ""
  
  init() {
    $name
      .map { [unowned self] name in
        createGreeting(with: name)
      }
      .assign(to: &$greeting)
  }
  
  func fetch() {
    name = "Developer"
  }
  
  func createGreeting(with name: String) -> String {
    let hour = Calendar.current.component(.hour, from: Date())
    var prefix = ""
    switch hour {
      case 0..<12:
        prefix = "Good morning, "
      case 12..<18:
        prefix = "Good afternoon, "
      default:
        prefix = "Good evening, "
    }
    return prefix + name
  }
}
