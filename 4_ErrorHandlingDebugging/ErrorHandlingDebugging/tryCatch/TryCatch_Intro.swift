  //
  //  TryCatch_Intro.swift
  //  ErrorHandlingDebugging
  //
  //  Created by Yusuf Turan on 17.10.2021.
  //

import SwiftUI

struct TryCatch_Intro: View {
  @StateObject private var vm = TryCatch_IntroViewModel()
  var body: some View {
    VStack(spacing: 20) {
      HeaderView(title: "TryCatch", subtitle: "Introduction",
                 description: "The tryCatch operator will work just like catch but also allow you to throw an error within the closure.")
        .layoutPriority(1)
      
      List(vm.dataToView, id: \.self) { item in
        Text(item)
      }
    }
    .font(.title2)
    .alert(item: self.$vm.error) { error in
      Alert(title: Text("Error"), message: Text("Failed fetching alternate data!"))
    }
    .onAppear {
      vm.fetch()
    }
  }
}

struct TryCatch_Intro_Previews: PreviewProvider {
  static var previews: some View {
    TryCatch_Intro()
  }
}
