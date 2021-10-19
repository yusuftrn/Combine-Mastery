  //
  //  Print_Intro.swift
  //  ErrorHandlingDebugging
  //
  //  Created by Yusuf Turan on 20.10.2021.
  //

import SwiftUI

struct Print_Intro: View {
  @StateObject private var vm = Print_IntroViewModel()
  var body: some View {
    VStack(spacing: 20) {
      HeaderView(title: "Using Print", subtitle: "Introduction",
                 description: "The print operator can reveal everything that is happening with your pipeline, including how it is connected and what is going through it.")
      
      List(vm.dataToView, id: \.self) { item in
        Text(item)
      }
    }
    .font(.title2)
  }
}

struct Print_Intro_Previews: PreviewProvider {
  static var previews: some View {
    Print_Intro()
  }
}
