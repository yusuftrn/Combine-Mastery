//
//  DataTaskPublisher_ErrorsViewModel.swift
//  Publishers
//
//  Created by Yusuf Turan on 15.10.2021.
//

import Foundation
import Combine
import UIKit

class DataTaskPublisher_ErrorsViewModel: ObservableObject {
  @Published var dataToView: [BlogModel] = []
  @Published var errorForAlert: ErrorForAlert?
  
  var cancellables: Set<AnyCancellable> = []
  
  func fetch() {
    //we made an error because our jsonData & model not matching.
    let url = URL(string: "https://jsonplaceholder.typicode.com/todos")!
    URLSession.shared.dataTaskPublisher(for: url)
      .map { (data: Data, response: URLResponse) in
        return data
      }
      .decode(type: [BlogModel].self, decoder: JSONDecoder())
      .receive(on: RunLoop.main)
      .sink { [unowned self] completion in
        if case .failure(let error) = completion {
          errorForAlert = ErrorForAlert(message: "Details: \(error.localizedDescription)")
        }
      } receiveValue: { [unowned self] blogPost in
        dataToView = blogPost
      }
      .store(in: &cancellables)
  }
}


