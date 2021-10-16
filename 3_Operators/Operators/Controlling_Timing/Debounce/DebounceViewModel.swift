//
//  DebounceViewModel.swift
//  Operators
//
//  Created by Yusuf Turan on 16.10.2021.
//

import Foundation

class DebounceViewModel: ObservableObject {
  @Published var name = ""
  @Published var nameEntered = ""
  
  init() {
    $name.debounce(for: 0.5, scheduler: RunLoop.main)
      .assign(to: &$nameEntered)
  }
}


