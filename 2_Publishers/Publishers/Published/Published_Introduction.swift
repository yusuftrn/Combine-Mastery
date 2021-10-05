  //
  //  Published_Introduction.swift
  //  Publishers
  //
  //  Created by Yusuf Turan on 4.10.2021.
  //

import SwiftUI

struct Published_Introduction: View {
  @StateObject private var vm = Published_IntroductionViewModel()
  var body: some View {
    VStack(spacing: 20) {
      HeaderView(
        title: "Published",
        subtitle: "Introduction",
        description: "The @Published property wrapper has a built-in publisher that you can access with the dollar sign ($).")
      
      TextEditor(text: $vm.data)
        .border(Color.gray, width: 1)
        .frame(height: 200)
        .padding()
      
      Text("\(vm.characterCount)/\(vm.characterLimit)")
        .foregroundColor(vm.countColor)
    }
    .font(.title)
  }
}

struct Published_Introduction_Previews: PreviewProvider {
  static var previews: some View {
    Published_Introduction()
  }
}
