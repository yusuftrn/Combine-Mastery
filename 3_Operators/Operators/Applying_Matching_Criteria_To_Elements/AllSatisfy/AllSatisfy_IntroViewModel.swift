//
//  AllSatisfy_IntroViewModel.swift
//  Operators
//
//  Created by Yusuf Turan on 15.10.2021.
//

import Foundation
import Combine

class AllSatisfy_IntroViewModel: ObservableObject {
  @Published var numbers: [Int] = []
  @Published var allFibNumbers = false
  
  func checkAllFibNumbers() {
    let fibonacciNumbersTo144 = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144]
    
    numbers.publisher
      .allSatisfy { number in
        fibonacciNumbersTo144.contains(number)
      }
      .assign(to: &$allFibNumbers)
  }
  
  func add(number: String) {
    if number.isEmpty { return }
    numbers.append(Int(number) ?? 0)
  }
}
