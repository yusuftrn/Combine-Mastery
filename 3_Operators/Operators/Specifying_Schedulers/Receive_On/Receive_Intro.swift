  //
  //  Receive_Intro.swift
  //  Operators
  //
  //  Created by Yusuf Turan on 16.10.2021.
  //

import SwiftUI

struct Receive_Intro: View {
  @State private var vm = Receive_IntroViewModel()
  var body: some View {
    VStack(spacing: 20) {
      HeaderView(title: "Receive", subtitle: "Introduction",
                 description: "The receive operator will move items coming down the pipeline to another pipeline (thread).")
      
      Button("Get Data from Internet") {
        vm.fetch()
      }
      vm.imageView
        .resizable()
        .scaledToFit()
      Spacer(minLength: 0)
    }
    .font(.title2)
  }
}

struct Receive_Intro_Previews: PreviewProvider {
  static var previews: some View {
    Receive_Intro()
  }
}
