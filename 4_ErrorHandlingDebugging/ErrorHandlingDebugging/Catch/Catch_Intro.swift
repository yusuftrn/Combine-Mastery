  //
  //  Catch_Intro.swift
  //  ErrorHandlingDebugging
  //
  //  Created by Yusuf Turan on 17.10.2021.
  //

import SwiftUI

struct Catch_Intro: View {
  @StateObject private var vm = Catch_IntroViewModel()
  var body: some View {
    VStack(spacing: 20) {
      HeaderView(title: "Catch", subtitle: "Introduction",
                 description: "Use the catch operator to intercept errors thrown upstream and specify a publisher to publish new data from within the provided closure.")
        .layoutPriority(1)
      
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

struct Catch_Intro_Previews: PreviewProvider {
  static var previews: some View {
    Catch_Intro()
  }
}
