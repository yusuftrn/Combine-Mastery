  //
  //  Fail_Intro.swift
  //  Publishers
  //
  //  Created by Yusuf Turan on 5.10.2021.
  //

import SwiftUI

struct Fail_Intro: View {
  @StateObject private var vm = Fail_IntroViewModel()
  @State private var age = ""
  var body: some View {
    VStack(spacing: 20) {
      HeaderView(title: "Fail", subtitle: "Introduction", description: "The Fail publisher will simply publish a failure with your error and close the pipeline.")
      
      TextField("Enter Age", text: $age)
        .keyboardType(UIKeyboardType.numberPad)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .padding()
      
      Button("Save") {
        vm.save(age: Int(age) ?? -1)
      }
      
      Text("\(vm.age)")
    }
    .font(.title)
    .alert(item: $vm.error) { error in
      Alert(title: Text("Invalid Age"), message: Text(error.rawValue))
    }
  }
}

struct Fail_Intro_Previews: PreviewProvider {
  static var previews: some View {
    Fail_Intro()
  }
}
