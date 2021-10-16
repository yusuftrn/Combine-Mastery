//
//  MeasureInterval_IntroViewModel.swift
//  Operators
//
//  Created by Yusuf Turan on 16.10.2021.
//

import Foundation
import Combine

class MeasureInterval_IntroViewModel: ObservableObject {
  @Published var speed: TimeInterval = 0.0
  var timeEvent = PassthroughSubject<Void, Never>()
  private var cancellable: AnyCancellable?
  
  init() {
    cancellable = timeEvent
      .measureInterval(using: RunLoop.main)
      .sink { [unowned self] stride in
        speed = stride.timeInterval
      }
  }
}

