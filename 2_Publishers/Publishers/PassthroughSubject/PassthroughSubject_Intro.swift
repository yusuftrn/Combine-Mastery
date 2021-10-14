  //
  //  PassthroughSubject_Intro.swift
  //  Publishers
  //
  //  Created by Yusuf Turan on 8.10.2021.
  //

import SwiftUI

struct PassthroughSubject_Intro: View {
  @StateObject private var vm = PassthroughSubjectViewModel()
  var body: some View {
    VStack(spacing: 20) {
      HeaderView(title: "PassthroughSubject", subtitle: "Introduction", description: "The PassthroughSubject publisher will send a value through a pipeline but not retain the value.")
      
      HStack {
        TextField("credit card number", text: $vm.creditCard)
        Group {
          switch (vm.status) {
            case .ok:
              Image(systemName: "checkmark.circle.fill")
                .foregroundColor(.green)
            case .invalid:
              Image(systemName: "x.circle.fill")
                .foregroundColor(.red)
            default:
              EmptyView()
          }
        }
      }
      .padding()
      
      Button("Verify CC Number") {
        vm.verifyCreditCard.send(vm.creditCard)
      }
    }
    .font(.title)
  }
}

struct PassthroughSubject_Intro_Previews: PreviewProvider {
  static var previews: some View {
    PassthroughSubject_Intro()
  }
}
