//
//  CurrentValueSubjectViewModel.swift
//  Publishers
//
//  Created by Yusuf Turan on 4.10.2021.
//

import Foundation
import Combine

class CurrentValueSubjectViewModel: ObservableObject {
  var selection = CurrentValueSubject<String, Never>("No Name Selected")
  var selectionSame = CurrentValueSubject<Bool, Never>(false)
  var cancellables = Array<AnyCancellable>()
  
  init() {
    selection
      .map { [unowned self] newValue -> Bool in
        guard newValue == selection.value else {
          return true
        }
        return false
      }
      .sink { [unowned self] value in
        selectionSame.value = value
        objectWillChange.send()
      }
      .store(in: &cancellables)
  }
}


