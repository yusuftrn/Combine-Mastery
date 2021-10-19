//
//  MapError_IntroViewModel.swift
//  ErrorHandlingDebugging
//
//  Created by Yusuf Turan on 17.10.2021.
//

import Foundation
import Combine

class MapError_IntroViewModel: ObservableObject {
  @Published var todos: [ToDo] = []
  @Published var error: ErrorForView?
  
  private var cancellable: AnyCancellable?
  
  func fetch() {
    let url = URL(string: "https://jsonplaceholder.typicode.com/users/1/todos")!
    cancellable = URLSession.shared.dataTaskPublisher(for: url)
      .tryMap { (data: Data, response: URLResponse) -> Data in
        guard let httpResponse = response as? HTTPURLResponse else {
          throw UrlResponseErrors.unknown
        }
        if (400...499).contains(httpResponse.statusCode) {
          throw UrlResponseErrors.clientError
        }
        if (500...599).contains(httpResponse.statusCode) {
          throw UrlResponseErrors.serverError
        }
        
        return data
      }
      .decode(type: [ToDo].self, decoder: JSONDecoder())
      .mapError { error -> UrlResponseErrors in
        if let responseError = error as? UrlResponseErrors {
          return responseError
        } else {
          return UrlResponseErrors.decodeError
        }
      }
      .receive(on: RunLoop.main)
      .sink { [unowned self] completion in
        if case .failure(let error) = completion {
          self.error = ErrorForView(message: error.rawValue)
        }
      } receiveValue: { [unowned self] data in
        todos = data
      }
  }
}
