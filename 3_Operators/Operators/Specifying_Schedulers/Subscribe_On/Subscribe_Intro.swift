  //
  //  Subscribe_Intro.swift
  //  Operators
  //
  //  Created by Yusuf Turan on 16.10.2021.
  //

import SwiftUI

struct Subscribe_Intro: View {
  @StateObject private var vm = Subscribe_IntroViewModel()
  var body: some View {
    VStack(spacing: 20) {
      HeaderView(title: "Subscribe", subtitle: "Introduction", description: "The subscribe operator will schedule operations to be done in the background for all upstream publishers and operators")
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

struct Subscribe_Intro_Previews: PreviewProvider {
  static var previews: some View {
    Subscribe_Intro()
  }
}
