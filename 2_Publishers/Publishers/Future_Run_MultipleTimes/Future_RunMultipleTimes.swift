//
//  Future_RunMultipleTimes.swift
//  Publishers
//
//  Created by Yusuf Turan on 6.10.2021.
//

import SwiftUI

struct Future_RunMultipleTimes: View {
  @StateObject private var vm = Future_RunMultipleTimesViewModel()
  
  var body: some View {
    VStack(spacing: 20) {
      HeaderView(title: "Future", subtitle: "Run Multiple Times", description: "Future publishers execute one time and execute immediately. To change this behavior you can use the Deferred publisher which will wait until a subscriber is attached before letting the Future execute and publish.")
      
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

struct Future_RunMultipleTimes_Previews: PreviewProvider {
    static var previews: some View {
        Future_RunMultipleTimes()
    }
}
