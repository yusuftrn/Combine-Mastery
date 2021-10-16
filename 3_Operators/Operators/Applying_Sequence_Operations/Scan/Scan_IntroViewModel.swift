//
//  Scan_IntroViewModel.swift
//  Operators
//
//  Created by Yusuf Turan on 16.10.2021.
//

import Foundation
import Combine

class Scan_IntroViewModel: ObservableObject {
  @Published var dataToView: [String] = []
  var cancellable: AnyCancellable?
  
  func fetch() {
    let dataIn = ["1⃣", "2⃣", "3⃣", "4⃣", "5⃣", "6⃣", "7⃣"]
    cancellable = dataIn.publisher
      .scan("0⃣", { (prev, next) in
        return prev + " " + next
      })
      .sink { [unowned self] item in
        dataToView.append(item)
      }
  }
}
