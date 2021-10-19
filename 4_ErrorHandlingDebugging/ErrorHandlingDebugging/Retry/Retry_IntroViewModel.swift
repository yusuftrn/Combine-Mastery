//
//  Retry_IntroViewModel.swift
//  ErrorHandlingDebugging
//
//  Created by Yusuf Turan on 17.10.2021.
//

import Foundation
import Combine

class Retry_IntroViewModel: ObservableObject {
  @Published var webPage = ""
  private var cancellable: AnyCancellable?
  
  func fetch() {
    let url = URL(string: "https://RandomSiteBlahBlah.com/")!
    cancellable = URLSession.shared.dataTaskPublisher(for: url)
      .retry(2)
      .map { (data: Data, response: URLResponse) -> String in
        String(decoding: data, as: UTF8.self)
      }
      .receive(on: RunLoop.main)
      .sink(receiveCompletion: { [unowned self] completion in
        if case .failure(_) = completion {
          webPage = "We made 3 attempts to retrieve the webpage and failed."
        }
      }, receiveValue: { [unowned self] html in
        webPage = html
      })
  }
}
