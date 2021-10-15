  //
  //  Max_MaxBy.swift
  //  Operators
  //
  //  Created by Yusuf Turan on 15.10.2021.
  //

import Foundation

/*
 MAX:
 let dataInNumbers = [900, 245, 783]
 numbers = dataInNumbers
 dataInNumbers.publisher
 .max()
 .assign(to: &$maxNumber)
 */

struct Profile: Identifiable {
  let id = UUID()
  var name = ""
  var city = ""
}

class MaxBy_IntroViewModel: ObservableObject {
  @Published var profiles: [Profile] = []
  @Published var maxValue = ""
  
  func fetch() {
    let dataIn = [
      Profile(name: "Igor", city: "Moscow"),
      Profile(name: "Rebecca", city: "Atlanta"),
      Profile(name: "Christina", city: "Stuttgart"),
      Profile(name: "Lorenzo", city: "Rome"),
      Profile(name: "Oliver", city: "London")
    ]
    profiles = dataIn
    
    _ = dataIn.publisher
      .max { (currItem, nextItem) -> Bool in
        return currItem.city < nextItem.city
      }
      .sink { [unowned self] profile in
        maxValue = profile.city
      }
  }
}
