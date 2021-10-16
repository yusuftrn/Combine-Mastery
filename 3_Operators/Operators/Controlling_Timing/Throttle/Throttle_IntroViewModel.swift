//
//  Throttle_IntroViewModel.swift
//  Operators
//
//  Created by Yusuf Turan on 16.10.2021.
//

import Foundation
import Combine

class Throttle_IntroViewModel: ObservableObject {
  @Published var data: [String] = []
  var throttleValue: Double = 0.5
  private var cancellable: AnyCancellable?
  let timeFormatter = DateFormatter()
  
  init() {
    timeFormatter.dateFormat = "HH:mm:ss.SSS"
  }
  
  func start() {
    if cancellable != nil {
      cancellable = nil
    } else {
      cancellable = Timer
        .publish(every: 0.1, on: RunLoop.main, in: .common)
        .autoconnect()
        .throttle(for: .seconds(throttleValue), scheduler: RunLoop.main, latest: true)
        .map { [unowned self] upcomingData in
          timeFormatter.string(from: upcomingData)
        }
        .sink { [unowned self] upcomingData in
          data.append(upcomingData)
        }
    }
  }
  func reset() {
    data.removeAll()
  }
}
