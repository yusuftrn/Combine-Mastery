//
//  HandleEventsViewModel.swift
//  ErrorHandlingDebugging
//
//  Created by Yusuf Turan on 19.10.2021.
//

import Foundation
import Combine
import SwiftUI

class HandleEventsViewModel: ObservableObject {
  @Published var dataToView: [String] = []

  func fetch() {
    let dataIn = ["Mercury", "Venus", "Earth", "Pluto"]
    _ = dataIn.publisher
      .handleEvents(
        receiveSubscription: { subscription in
          print("Event: Received subscription")
        },
        receiveOutput: { item in
          if( item == "Pluto") {
            print("EVENT HANDLE: WE GOT: \(item)")
          }
          print("Event: Received output: \(item)")
        },
        receiveCompletion: { completion in
          print("Event: Pipeline completed")
        },
        receiveCancel: {
          print("Event: Pipeline cancelled")
        },
        receiveRequest: { demand in
          print("Event: Received request")
        })
      .tryMap { item in
        if item == "Pluto" {
          throw InvalidPlanetError()
        }
        return item
      }
      .sink(receiveCompletion: { completion in
        print("Pipeline completed.")
      }, receiveValue: { [unowned self] item in
        dataToView.append(item)
      })
  }
}
