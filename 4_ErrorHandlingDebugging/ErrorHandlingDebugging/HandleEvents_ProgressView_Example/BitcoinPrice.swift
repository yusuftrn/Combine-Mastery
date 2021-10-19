//
//  BitcoinPrice.swift
//  ErrorHandlingDebugging
//
//  Created by Yusuf Turan on 20.10.2021.
//

import Foundation

struct BitcoinPrice: Decodable {
  let bpi: Bpi
  
  struct Bpi: Decodable {
    let USD: Rate
    let GBP: Rate
    let EUR: Rate
    
    struct Rate: Decodable {
      let rate: String
    }
  }
}
