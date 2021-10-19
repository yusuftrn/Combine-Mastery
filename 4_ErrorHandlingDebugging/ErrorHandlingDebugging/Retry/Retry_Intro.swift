  //
  //  Retry_Intro.swift
  //  ErrorHandlingDebugging
  //
  //  Created by Yusuf Turan on 17.10.2021.
  //

import SwiftUI

struct Retry_Intro: View {
  @StateObject private var vm = Retry_IntroViewModel()
  var body: some View {
    VStack(spacing: 20) {
      HeaderView(title: "Retry", subtitle: "Introduction",
                 description: "The retry operator will detect failures and attempt to run the publisher again the number of times you specify.")
      
      Text(vm.webPage)
        .padding()
      Spacer(minLength: 0)
    }
    .font(.title2)
    .onAppear {
      vm.fetch()
    }
  }
}

struct Retry_Intro_Previews: PreviewProvider {
  static var previews: some View {
    Retry_Intro()
  }
}
