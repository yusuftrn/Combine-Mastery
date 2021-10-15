//
//  Contains_WhereViewModel.swift
//  Operators
//
//  Created by Yusuf Turan on 15.10.2021.
//

import Foundation

struct Fruit: Identifiable {
  let id = UUID()
  var name = ""
  var nutritionalInformation = ""
}

class Contains_WhereViewModel: ObservableObject {
  @Published var fruitName = ""
  @Published var vitaminA = false
  @Published var vitaminB = false
  @Published var vitaminC = false
  
  func fetch() {
    let incomingData = [Fruit(name: "Apples", nutritionalInformation: "Vitamin A, Vitamin C")]
    
    _ = incomingData.publisher
      .sink { [unowned self] fruit in
        fruitName = fruit.name
      }
    
    incomingData.publisher
      .contains(where: { (fruit) -> Bool in
        fruit.nutritionalInformation.contains("Vitamin A")
      })
      .assign(to: &$vitaminA)
    
    incomingData.publisher
      .contains(where: { (fruit) -> Bool in
        fruit.nutritionalInformation.contains("Vitamin B")
      })
      .assign(to: &$vitaminB)
    
    incomingData.publisher
      .contains { fruit -> Bool in
        fruit.nutritionalInformation.contains("Vitamin C")
      }
      .assign(to: &$vitaminC)
  }
}
