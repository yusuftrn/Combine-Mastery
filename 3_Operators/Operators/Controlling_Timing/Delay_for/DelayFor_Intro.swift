  //
  //  DelayFor_Intro.swift
  //  Operators
  //
  //  Created by Yusuf Turan on 16.10.2021.
  //

import SwiftUI

struct DelayFor_Intro: View {
  @StateObject private var vm = DelayFor_IntroViewModel()
  var body: some View {
    VStack(spacing: 20) {
      HeaderView(title: "Delay(for: )", subtitle: "Introduction",
                 description: "The delay(for: ) operator will prevent the first items from flowing through the pipeline.")
      Text("Delay for:")
      Picker(selection: self.$vm.delayForSeconds, label: Text("Delay Time")) {
        Text("0").tag(0)
        Text("1").tag(1)
        Text("2").tag(2)
      }
      .pickerStyle(SegmentedPickerStyle())
      .padding(.horizontal)
      
      Button("Fetch Data") {
        vm.fetch()
      }
      
      if vm.isFetching {
        ProgressView()
      } else {
        Text(vm.data)
      }
      
      Spacer()
    }
  }
}

struct DelayFor_Intro_Previews: PreviewProvider {
  static var previews: some View {
    DelayFor_Intro()
  }
}
