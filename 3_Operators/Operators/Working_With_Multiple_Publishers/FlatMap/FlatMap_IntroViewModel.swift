//
//  FlatMap_IntroViewModel.swift
//  Operators
//
//  Created by Yusuf Turan on 17.10.2021.
//

import Foundation
import Combine
import SwiftUI

struct NameResult: Decodable {
  var name = ""
  var gender = ""
  var probability = 0.0
}
class FlatMap_IntroViewModel: ObservableObject {
  @Published var names = ["Kelly", "Madison", "Pat", "Alexus", "Taylor", "Tracy"]
  @Published var nameResult: [NameResult] = []
  
  private var cancellables: Set<AnyCancellable> = []
  
  func fetchNameResults() {
    names.publisher
      .map { name -> (String, URL) in
        return (name, URL(string: "https://api.genderize.io/?name=\(name)")!)
      }
      .flatMap { (name, url) -> AnyPublisher<NameResult, Never> in
        URLSession.shared.dataTaskPublisher(for: url)
          .map { (data: Data, response: URLResponse) in
            return data
          }
          .decode(type: NameResult.self, decoder: JSONDecoder())
          .replaceError(with: NameResult(name: name, gender: "Undetermined"))
          .eraseToAnyPublisher()
      }
      .receive(on: RunLoop.main)
      .sink { [unowned self] name in
        nameResult.append(name)
      }
      .store(in: &cancellables)
  }
}
