  //
  //  FirstPipeLine.swift
  //  CombineIntro
  //
  //  Created by Yusuf Turan on 22.09.2021.
  //

import SwiftUI

class YourFirstPipeLineModel: ObservableObject {
  @Published var name: String = ""
  @Published var validation: String = ""
  
  init() {
    $name
      .map {
        print("name property is now: \(self.name)")
        print("Value received is: \($0)")
        return $0.isEmpty ? "❌" : "✅"
      }
      .assign(to: &$validation)
  }
}

struct FirstPipeLine: View {
  @StateObject private var vm = YourFirstPipeLineModel()
  
  var body: some View {
    VStack(spacing: 20) {
      HeaderView(title: "First Pipeline",
                 subtitle: "Introduction",
                 description: "This is a simple pipeline you can create in Combine to validate a text field.")
      HStack {
        TextField("name", text: self.$vm.name)
          .textFieldStyle(RoundedBorderTextFieldStyle())
        Text(self.vm.validation)
      }
      .padding(.horizontal, 20)
    }
  }
}

struct FirstPipeLine_Previews: PreviewProvider {
  static var previews: some View {
    FirstPipeLine()
  }
}
