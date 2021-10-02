//
//  SinkCancellable.swift
//  CombineIntro
//
//  Created by Yusuf Turan on 22.09.2021.
//


import SwiftUI
import Combine

class FirstPipeLineUsingSinkVM: ObservableObject {
  @Published var name: String = ""
  @Published var validation: String = ""
  var cancellable: AnyCancellable?
  
  init() {
    cancellable = $name
      .map { return $0.isEmpty ? "❌" : "✅" }
      .sink { [unowned self] value in
        self.validation = value
      }
  }
}

struct SinkCancellable: View {
  @StateObject private var vm = FirstPipeLineUsingSinkVM()
  
  var body: some View {
    VStack(spacing: 20) {
      HeaderView(title: "Sink Pipeline",
                 subtitle: "Introduction",
                 description: "This is a simple pipeline you can create in Combine to validate a text field.")
      HStack {
        TextField("name", text: self.$vm.name)
          .textFieldStyle(RoundedBorderTextFieldStyle())
        Text(self.vm.validation)
      }
      .padding(.horizontal, 20)
      
      Button("Cancel Subscription") {
        vm.validation = ""
        vm.cancellable?.cancel()
      }
    }
  }
}

struct SinkCancellable_Previews: PreviewProvider {
  static var previews: some View {
    SinkCancellable()
  }
}
