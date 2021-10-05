  //
  //  CancellingMultiplePipeLine.swift
  //  CombineIntro
  //
  //  Created by Yusuf Turan on 22.09.2021.
  //

import SwiftUI
import Combine

class CancellableMultiplePipeLinesVM: ObservableObject {
  @Published var firstName: String = ""
  @Published var firstNameValidation: String = ""
  @Published var lastName: String = ""
  @Published var lastNameValidation: String = ""
  
  private var validationCancellables: Set<AnyCancellable> = []
  
  init() {
    $firstName
      .map { $0.isEmpty ? "❌" : "✅"}
      .sink { [unowned self] value in self.firstNameValidation = value }
      .store(in: &validationCancellables)
    $lastName
      .map { $0.isEmpty ? "❌" : "✅"}
      .sink { [unowned self] value in self.lastNameValidation = value }
      .store(in: &validationCancellables)
  }
  
  func cancelAllValidations() {
    validationCancellables.removeAll()
  }
}

struct CancellingMultiplePipeLine: View {
  
  @StateObject private var vm = CancellableMultiplePipeLinesVM()
  
  var body: some View {
    VStack(spacing: 20) {
      HeaderView(title: "Cancellable All Pipelines",
                 subtitle: "RemoveAll",
                 description: """
                You learned earlier that you can cancel one pipeline by calling the cancel() function of the AnyCancellable.
                When everything is in a Set, an easy way to cancel all pipelines is to simply remove all of them from the Set
                """)
      Group {
        HStack {
          TextField("first name", text: $vm.firstName)
            .textFieldStyle(RoundedBorderTextFieldStyle())
          Text(vm.firstNameValidation)
        }
        HStack {
          TextField("last name", text: $vm.lastName)
            .textFieldStyle(RoundedBorderTextFieldStyle())
          Text(vm.lastNameValidation)
        }
      }
      .padding()
      
      Button("Cancel All Validations") {
        vm.cancelAllValidations()
      }
    }
    .font(.title)
  }
}

struct CancellingMultiplePipeLine_Previews: PreviewProvider {
  static var previews: some View {
    CancellingMultiplePipeLine()
  }
}
