  //
  //  Sequence_Intro.swift
  //  Publishers
  //
  //  Created by Yusuf Turan on 8.10.2021.
  //

import SwiftUI

struct Sequence_Intro: View {
  @StateObject private var vm = SequenceIntroViewModel()
  var body: some View {
    VStack(spacing: 20) {
      HeaderView(title: "Sequence", subtitle: "Introduction", description: "Arrays have a built-in sequence publisher property. This means a pipeline can be constructed right on the array.")
      
      List(vm.dataToView, id: \.self) { data in
        Text(data)
      }
    }
    .font(.title)
    .onAppear {
      vm.fetch()
    }
  }
}

struct Sequence_Intro_Previews: PreviewProvider {
  static var previews: some View {
    Sequence_Intro()
  }
}
