//
//  Just_IntroductionViewModel.swift
//  Publishers
//
//  Created by Yusuf Turan on 8.10.2021.
//

import Foundation
import Combine

class Just_IntroductionViewModel: ObservableObject {
  @Published var data = ""
  @Published var dataToView: [String] = []
  func fetch() {
    let dataIn = ["Yusuf", "Ahmet", "Aslı", "Elif", "Emre"]
    _ = dataIn.publisher
      .sink { [unowned self] item in
        dataToView.append(item)
      }
    if dataIn.count > 0 {
      Just(dataIn[2])
        .map { item in
          item.uppercased()
        }
        .assign(to: &$data)
    }
  }
}

