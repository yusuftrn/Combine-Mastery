  //
  //  BreakpointOnError_Intro.swift
  //  ErrorHandlingDebugging
  //
  //  Created by Yusuf Turan on 19.10.2021.
  //

import SwiftUI

struct BreakpointOnError_Intro: View {
  @StateObject private var vm = Breakpoint_IntroViewModel()
  var body: some View {
    VStack(spacing: 20) {
      HeaderView(title: "BreakpointOnError", subtitle: "Introduction",
                 description: "Use the breakpointOnError operator to have Xcode pause execution whenever an error is thrown from the pipeline.")
      
      List(vm.dataToView, id: \.self) { item in
        Text(item)
      }
    }
    .font(.title2)
    .onAppear {
      vm.fetch()
    }
  }
}

struct BreakpointOnError_Intro_Previews: PreviewProvider {
  static var previews: some View {
    BreakpointOnError_Intro()
  }
}
