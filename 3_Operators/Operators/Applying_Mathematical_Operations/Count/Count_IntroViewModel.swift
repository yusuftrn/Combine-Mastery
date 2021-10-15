//
//  Count_IntroViewModel.swift
//  Operators
//
//  Created by Yusuf Turan on 15.10.2021.
//

import Foundation

class Count_IntroViewModel: ObservableObject {
  @Published var title = ""
  @Published var data: [String] = []
  @Published var count = 0
  
  func fetch() {
    title = "Major Rivers"
    let dataIn = ["Mississippi", "Nile", "Yangtze", "Danube", "Ganges", "Amazon", "Volga", "Rhine"]
    data = dataIn
    dataIn.publisher
      .count()
      .assign(to: &$count)
  }
}
