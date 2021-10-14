//
//  Timer_ConnectViewModel.swift
//  Publishers
//
//  Created by Yusuf Turan on 8.10.2021.
//

import Foundation
import Combine

class Timer_ConnectViewModel: ObservableObject {
  @Published var data: [String] = []
  private var timerPublisher = Timer.publish(every: 0.2, on: RunLoop.main, in: .common)
  private var timerCancellable: Cancellable?
  private var cancellables: Set<AnyCancellable> = []
  
  let timeFormatter = DateFormatter()
  
  init() {
    timeFormatter.dateFormat = "HH:mm:ss.SS"
    timerPublisher
      .sink { [unowned self] incomingData in
        data.append(timeFormatter.string(from: incomingData))
      }
      .store(in: &cancellables)
  }
  func start() {
    timerCancellable = timerPublisher.connect()
  }
  func stop() {
    timerCancellable?.cancel()
    data.removeAll()
  }
}
