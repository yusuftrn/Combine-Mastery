  //
  //  HandleEvents.swift
  //  ErrorHandlingDebugging
  //
  //  Created by Yusuf Turan on 20.10.2021.
  //

import SwiftUI

struct HandleEvents: View {
  @StateObject private var vm = HandleEventsViewModel()
  var body: some View {
    VStack(spacing: 20) {
      HeaderView(title: "HandleEvents", subtitle: "Introduction",
                 description: "Use the handleEvents operator to get a closer look into what is happening at each stage of your pipeline.")
      
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

struct HandleEvents_Previews: PreviewProvider {
  static var previews: some View {
    HandleEvents()
  }
}
