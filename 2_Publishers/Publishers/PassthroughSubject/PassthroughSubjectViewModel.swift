//
//  PassthroughSubjectViewModel.swift
//  Publishers
//
//  Created by Yusuf Turan on 8.10.2021.
//

import Foundation
import Combine

enum CreditCardStatus {
  case ok
  case invalid
  case notEvaluated
}

class PassthroughSubjectViewModel: ObservableObject {
  @Published var creditCard = ""
  @Published var status = CreditCardStatus.notEvaluated
  let verifyCreditCard = PassthroughSubject<String, Never>()
  
  init() {
    verifyCreditCard
      .map{ creditCard -> CreditCardStatus in
        if creditCard.count == 16 {
          return CreditCardStatus.ok
        } else {
          return CreditCardStatus.invalid
        }
      }
      .assign(to: &$status)
  }
}


