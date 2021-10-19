//
//  Print_IntroViewModel.swift
//  ErrorHandlingDebugging
//
//  Created by Yusuf Turan on 20.10.2021.
//

import Foundation
import Combine

class Print_IntroViewModel: ObservableObject {
  @Published var dataToView: [String] = []
  private var cancellable: AnyCancellable?
  
  init() {
    let dataIn = ["Bill", nil, nil, "Emma", nil, "Jayden"]
    cancellable = dataIn.publisher
      .print()
      .replaceNil(with: "<Needs ID>")
      .sink { [unowned self] item in
        self.dataToView.append(item)
      }
  }
}
