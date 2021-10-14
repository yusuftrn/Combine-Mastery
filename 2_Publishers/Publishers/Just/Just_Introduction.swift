  //
  //  Just_Introduction.swift
  //  Publishers
  //
  //  Created by Yusuf Turan on 8.10.2021.
  //

import SwiftUI

struct Just_Introduction: View {
  @StateObject private var vm = Just_IntroductionViewModel()
  var body: some View {
    VStack(spacing: 20) {
      HeaderView(title: "Just", subtitle: "Introduction", description: "The Just publisher can turn any object into a publisher if it doesn't already have one built-in. This means you can attach pipelines to any property or value.")
        .layoutPriority(1)
      
      HStack {
        Text("This week's winner: ")
        Text(vm.data)
      }
      .padding(.horizontal)
      
      Form {
        Section(header: Text("Contest Participants").padding()) {
          List(vm.dataToView, id: \.self) { item in
            Text(item)
          }
        }
      }
    }
    .font(.title)
    .onAppear {
      vm.fetch()
    }
  }
}

struct Just_Introduction_Previews: PreviewProvider {
  static var previews: some View {
    Just_Introduction()
  }
}
