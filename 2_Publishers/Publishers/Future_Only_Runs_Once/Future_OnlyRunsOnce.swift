  //
  //  Future_OnlyRunsOnce.swift
  //  Publishers
  //
  //  Created by Yusuf Turan on 6.10.2021.
  //

import SwiftUI

struct Future_OnlyRunsOnce: View {
  @StateObject private var vm = Future_OnlyRunsOnceViewModel()
  
  var body: some View {
    VStack(spacing: 20) {
      HeaderView(title: "Future", subtitle: "Only Runs Once", description: "Another thing that sets the Future publisher apart is that it only runs one time. It will store its value after being run and then never run again.")
      
      Text(vm.firstResult)
      
      Button("Run Again") {
        vm.runAgain()
      }
      Text(vm.secondResult)
    }
    .font(.title)
    .onAppear(perform: vm.fetch)
  }
}

struct Future_OnlyRunsOnce_Previews: PreviewProvider {
  static var previews: some View {
    Future_OnlyRunsOnce()
  }
}
