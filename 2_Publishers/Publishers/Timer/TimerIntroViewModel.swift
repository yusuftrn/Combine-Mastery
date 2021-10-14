//
//  TimerIntroViewModel.swift
//  Publishers
//
//  Created by Yusuf Turan on 8.10.2021.
//

import Foundation
import Combine

class TimerIntroViewModel: ObservableObject {
  @Published var data: [String] = []
  @Published var interval: Double = 1.0
  
  private var timerCancellable: AnyCancellable?
  private var intervalCancellable: AnyCancellable?
  
  let timerFormatter = DateFormatter()
  
  init() {
    timerFormatter.dateFormat = "HH:mm:ss.SSS"
    
    intervalCancellable = $interval
      .dropFirst()
      .sink { [unowned self] interval in
        // Restart the timer pipeline
        timerCancellable?.cancel()
        data.removeAll()
        start()
      }
  }
  
  func start() {
    timerCancellable = Timer
      .publish(every: interval, on: .main, in: .common)
      .autoconnect()
      .sink { [unowned self] incomingData in
        data.append(timerFormatter.string(from: incomingData))
      }
  }
}
