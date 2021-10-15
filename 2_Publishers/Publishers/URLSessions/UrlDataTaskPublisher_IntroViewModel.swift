//
//  UrlDataTaskPublisher_IntroViewModel.swift
//  Publishers
//
//  Created by Yusuf Turan on 15.10.2021.
//

import Foundation
import Combine

class UrlDataTaskPublisher_IntroViewModel: ObservableObject {
  @Published var dataToView: [BlogModel] = []
  var cancellables: Set<AnyCancellable> = []
  
  func fetch() {
    let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
    URLSession.shared.dataTaskPublisher(for: url)
      .map { (data: Data, response: URLResponse) in
        data
      }
      .decode(type: [BlogModel].self, decoder: JSONDecoder())
      .receive(on: RunLoop.main)
      .sink(receiveCompletion: { completion in
        print(completion)
      }, receiveValue: { [unowned self] blogPost in
        dataToView = blogPost
      })
      .store(in: &cancellables)
  }
}



