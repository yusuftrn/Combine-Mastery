  //
  //  Sink_Intro.swift
  //  Operators
  //
  //  Created by Yusuf Turan on 17.10.2021.
  //

import SwiftUI

struct Sink_Intro: View {
  @StateObject private var vm = Sink_IntroViewModel()
  var body: some View {
    VStack(spacing: 20) {
      HeaderView(title: "Sink", subtitle: "Introduction", description: "The sink subscriber allows you to access every value that comes down the pipeline and do something with it.")
      
      Button("Add Name") {
        vm.fetchRandomName()
      }
      HStack {
        Text("A to M")
          .frame(maxWidth: .infinity)
        Text("N to Z")
          .frame(maxWidth: .infinity)
      }
      HStack {
        List(vm.aToM, id:\.self) { name in
          Text(name)
        }
        List(vm.nToZ, id:\.self) { name in
          Text(name)
        }
      }
    }
    .font(.title2)
  }
}

struct Sink_Intro_Previews: PreviewProvider {
  static var previews: some View {
    Sink_Intro()
  }
}
