  //
  //  Timeout_Intro.swift
  //  Operators
  //
  //  Created by Yusuf Turan on 16.10.2021.
  //

import SwiftUI

struct Timeout_Intro: View {
  @StateObject private var vm = Timeout_IntroViewModel()
  var body: some View {
    VStack(spacing: 20) {
      HeaderView(title: "Timeout", subtitle: "Introduction",
                 description: "You can specify a time limit for the timeout operator. If no item comes down the pipeline before that time limit then pipeline is finished.")
      Button("Fetch Data") {
        vm.fetch()
      }
      
      if vm.isFetching {
        ProgressView("Fetching...")
      }
      Spacer()
      DescriptionView("You can also set a custom error when the time limit is exceeded.")
      Spacer()
    }
    .font(.title2)
    .alert(item: self.$vm.timeoutError) { timeoutError in
      Alert(title: Text(timeoutError.title), message: Text(timeoutError.message))
    }
  }
}

struct Timeout_Intro_Previews: PreviewProvider {
  static var previews: some View {
    Timeout_Intro()
  }
}
