//
//  SequenceIntroViewModel.swift
//  Publishers
//
//  Created by Yusuf Turan on 8.10.2021.
//

import Foundation
import Combine

class SequenceIntroViewModel: ObservableObject {
  @Published var dataToView: [String] = []
  var cancellables: Set<AnyCancellable> = []
  
  func fetch() {
    var dataIn = ["Yusuf", "Ahmet", "Melis", "Elif", "Mert"]
    
    dataIn.publisher
      .sink { completion in
        print(completion)
      } receiveValue: { [unowned self] thisValue in
        self.dataToView.append(thisValue)
        print(thisValue)
      }
      .store(in: &cancellables)
    
      // Burada dataIn'e append edilen isimler pipeline üzerinde publish edilmez.
      // Pipeline çalıştırıldıktan sonra yukarıda tamamlanmıştı çünkü.
    dataIn.append(contentsOf: ["Murat", "Nilüfer", "Aslı"])
  }
}

