  //
  //  DropUntilOutputFrom_Intro.swift
  //  Operators
  //
  //  Created by Yusuf Turan on 15.10.2021.
  //

import SwiftUI

struct DropUntilOutputFrom_Intro: View {
  @StateObject private var vm = DropUntilOutputFrom_IntroViewModel()
  var body: some View {
    VStack(spacing: 20) {
      HeaderView(title: "Drop(untilOutputFrom: )", subtitle: "Introduction", description: "This operator will prevent items from being published until it gets data from another publisher.")
      Button("Open Pipeline") {
        vm.startPipeline.send(true)
      }
      List(vm.data, id:\.self) { data in
        Text(data)
      }
      Spacer(minLength: 0)
      Button("Close Pipeline") {
        vm.cancellables.removeAll()
      }
    }
    .font(.title2)
  }
}

struct DropUntilOutputFrom_Intro_Previews: PreviewProvider {
  static var previews: some View {
    DropUntilOutputFrom_Intro()
  }
}
