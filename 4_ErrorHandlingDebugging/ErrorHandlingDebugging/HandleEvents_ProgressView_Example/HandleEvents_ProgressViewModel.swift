//
//  HandleEvents_ProgressViewModel.swift
//  ErrorHandlingDebugging
//
//  Created by Yusuf Turan on 20.10.2021.
//

import Foundation
import Combine

class HandleEvents_ProgressViewModel: ObservableObject {
  @Published var usdBitcoinRate = ""
  @Published var isFetching = false
  
  func fetch() {
    let url = URL(string: "https://api.coindesk.com/v1/bpi/currentprice.json")!
    
    URLSession.shared.dataTaskPublisher(for: url)
      .map { (data: Data, response: URLResponse) in
        return data
      }
      .decode(type: BitcoinPrice.self, decoder: JSONDecoder())
      .receive(on: RunLoop.main)
      .handleEvents(
        receiveCompletion: { [unowned self] _ in
          isFetching = false
        }, receiveCancel: { [unowned self] in
          isFetching = false
        }, receiveRequest: { [unowned self] _ in
          isFetching = true
        })
      .map { btcPrice in
        return btcPrice.bpi.USD.rate //Return just USD rate
      }
      .catch { _ in
        Just("N/A")
      }
      .assign(to: &$usdBitcoinRate)
  }
}
