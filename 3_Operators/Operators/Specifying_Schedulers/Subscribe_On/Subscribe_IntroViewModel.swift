//
//  Subscribe_IntroViewModel.swift
//  Operators
//
//  Created by Yusuf Turan on 16.10.2021.
//

import Foundation
import Combine

class Subscribe_IntroViewModel: ObservableObject {
  @Published var dataToView: [String] = []
  
  func fetch() {
    let dataIn = ["Which", "thread", "is", "used?"]
    _ = dataIn.publisher
      .map { item in
        print("map: Main thread? \(Thread.isMainThread)")
        return item
      }
      .handleEvents(receiveSubscription: { subscription in
          print("receiveSubscription: Main thread? \(Thread.isMainThread)")
      }, receiveOutput: { item in
        print("\(item) - receiveOutput: Main thread? \(Thread.isMainThread)")
      }, receiveCompletion: { completion in
        print("receiveCompletion: Main thread? \(Thread.isMainThread)")
      }, receiveCancel: {
        print("receiveCancel: Main thread? \(Thread.isMainThread)")
      }, receiveRequest: { demand in
        print("receiveRequest: Main thread? \(Thread.isMainThread)")
      })
      .subscribe(on: DispatchQueue.global())
      .receive(on: DispatchQueue.main)
      .sink { [unowned self] item in
        dataToView.append(item)
      }
  }
}
