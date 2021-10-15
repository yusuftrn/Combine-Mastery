//
//  DropUntilOutputFrom_IntroViewModel.swift
//  Operators
//
//  Created by Yusuf Turan on 15.10.2021.
//

import Foundation
import Combine

class DropUntilOutputFrom_IntroViewModel: ObservableObject {
  @Published var data: [String] = []
  var startPipeline = PassthroughSubject<Bool, Never>()
  var cancellables: [AnyCancellable] = []
  let timeFormatter = DateFormatter()
  
  init() {
    timeFormatter.timeStyle = .medium
    Timer.publish(every: 0.5, on: .main, in: .common)
      .autoconnect()
      .drop(untilOutputFrom: startPipeline)
      .map { dat in
        return self.timeFormatter.string(from: dat)
      }
      .sink { [unowned self] dat in
        data.append(dat)
      }
      .store(in: &cancellables)
  }
}
