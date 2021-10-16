  //
  //  Debounce_Intro.swift
  //  Operators
  //
  //  Created by Yusuf Turan on 16.10.2021.
  //

import SwiftUI

struct Debounce_Intro: View {
  @StateObject private var vm = DebounceViewModel()
  var body: some View {
    VStack(spacing: 20) {
      HeaderView(title: "Debounce", subtitle: "Introduction",
                 description: "The debounce operator can pause items going through your pipeline for a specified amount of time.")
      TextField("name", text: $vm.name)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .padding()
      Text(vm.nameEntered)
      Spacer()
    }
    .font(.title2)
  }
}

struct Debounce_Intro_Previews: PreviewProvider {
  static var previews: some View {
    Debounce_Intro()
  }
}
