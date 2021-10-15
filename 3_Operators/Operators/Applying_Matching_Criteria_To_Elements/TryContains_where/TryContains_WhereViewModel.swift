  //
  //  TryContains_WhereViewModel.swift
  //  Operators
  //
  //  Created by Yusuf Turan on 15.10.2021.
  //

import Foundation
import Combine

struct InvalidSelectionError: Error, Identifiable {
  var id = UUID()
}

class TryContains_WhereViewModel: ObservableObject {
  @Published var place = "Nevada"
  @Published var result = ""
  @Published var invalidSelectionError: InvalidSelectionError?
  
  func search(){
    let incomingData = ["Places with Salt Water", "Utah", "California"]
    
    _ = incomingData.publisher
      .dropFirst()
      .tryContains(where: { [unowned self] (item) -> Bool in
        if place == "Mars" {
          throw InvalidSelectionError()
        }
        return item == place
      })
      .sink { [unowned self] (completion) in
        switch completion {
          case .failure(let err):
            self.invalidSelectionError = err as? InvalidSelectionError
          default:
            break
        }
      } receiveValue: { [unowned self] (result) in
        self.result = result ? "Found" : "Not Found"
      }
  }
}
