  //
  //  Empty_IntroViewModel.swift
  //  Publishers
  //
  //  Created by Yusuf Turan on 4.10.2021.
  //

import Foundation
import Combine

struct BombDetectedError: Error, Identifiable {
  let id = UUID()
}

class Empty_IntroViewModel: ObservableObject {
  @Published var dataToView: [String] = []
  
  func fetch() {
    let dataIn = ["Value 1", "Value 2", "Value 3", "🧨 ", "Value 5", "Value 6"]
    
    _ = dataIn.publisher
      .tryMap { item in
        if item == "🧨" {
          throw BombDetectedError()
        }
        return item
      }
      .catch { (error) in
        Empty(completeImmediately: true)
      }
      .sink { [unowned self] item in
        dataToView.append(item)
      }
  }
}
