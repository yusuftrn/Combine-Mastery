  //
  //  AssertNoFailure_Intro.swift
  //  ErrorHandlingDebugging
  //
  //  Created by Yusuf Turan on 17.10.2021.
  //

import SwiftUI

struct AssertNoFailure_Intro: View {
  @StateObject private var vm = AssertNoFailure_IntroViewModel()
  var body: some View {
    VStack(spacing: 20) {
      HeaderView(title: "AssertNoFailure", subtitle: "Introduction",
                 description: "The assertNoFailure operator will crash your app if there is a failure. This will make it very obvious while developing so you can easily find and fix the problem.")
      
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

struct AssertNoFailure_Intro_Previews: PreviewProvider {
  static var previews: some View {
    AssertNoFailure_Intro()
  }
}
