//
//  Contains_IntroViewModel.swift
//  Operators
//
//  Created by Yusuf Turan on 15.10.2021.
//

/*
 The contains operator has just one purpose - to let you know if an item coming through your pipeline matches the criteria you specify.
 It will publish a true when a match is found and then finishes the pipeline, meaning it stops the flow of any remaining data.
 If no values match the criteria then a false is published and the pipeline finishes/closes.
 */

import Foundation
import Combine

class Contains_IntroViewModel: ObservableObject {
  @Published var description = ""
  @Published var airConditioning = false
  @Published var heating = false
  @Published var basement = false
  
  private var cancellables: [AnyCancellable] = []
  
  func fetch() {
    let incomingData = ["3 bedrooms", "2 bathrooms", "Air conditioning", "Basement"]
    
    incomingData.publisher
      .prefix(2)
      .sink { [unowned self] item in
        description += item + "\n"
      }
      .store(in: &cancellables)
    
    incomingData.publisher
      .contains("Air conditioning")
      .assign(to: &$airConditioning)
    
    incomingData.publisher
      .contains("Heating")
      .assign(to: &$heating)
    
    incomingData.publisher
      .contains("Basement")
      .assign(to: &$basement)
  }
}
