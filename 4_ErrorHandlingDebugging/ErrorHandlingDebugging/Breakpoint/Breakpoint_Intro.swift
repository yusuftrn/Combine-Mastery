  //
  //  Breakpoint_Intro.swift
  //  ErrorHandlingDebugging
  //
  //  Created by Yusuf Turan on 19.10.2021.
  //

import SwiftUI

struct Breakpoint_Intro: View {
  @StateObject private var vm = Breakpoint_IntroViewModel()
  var body: some View {
    VStack(spacing: 20) {
      HeaderView(title: "Breakpoint", subtitle: "Introduction",
                 description: "The breakpoint operator allows you to set conditions on different events so Xcode will pause when those conditions are satisfied.")
      
      List(vm.dataToView, id:\.self) { item in
        Text(item)
      }
    }
    .font(.title2)
    .onAppear {
      vm.fetch()
    }
  }
}

struct Breakpoint_Intro_Previews: PreviewProvider {
  static var previews: some View {
    Breakpoint_Intro()
  }
}
