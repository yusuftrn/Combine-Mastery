  //
  //  Empty_Intro.swift
  //  Publishers
  //
  //  Created by Yusuf Turan on 4.10.2021.
  //

import SwiftUI

struct Empty_Intro: View {
  @StateObject private var vm = Empty_IntroViewModel()
  var body: some View {
    VStack(spacing: 20) {
      HeaderView(title: "Empty", subtitle: "Introduction", description: "The Empty publisher will send nothing down the pipeline.")
      List(vm.dataToView, id: \.self) { item in
        Text(item)
      }
      DescriptionView("The item after Value 3 caused an error. The Empty publisher was then used and the pipeline finished immediately.")
    }
    .font(.title)
    .onAppear {
      vm.fetch()
    }
  }
}

struct Empty_Intro_Previews: PreviewProvider {
  static var previews: some View {
    Empty_Intro()
  }
}
