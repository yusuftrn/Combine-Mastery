  //
  //  Sink_Completion_Error.swift
  //  Operators
  //
  //  Created by Yusuf Turan on 17.10.2021.
  //

import SwiftUI

struct Sink_Completion_Error: View {
  @StateObject private var vm = SinkCompletionErrorViewModel()
  
  var body: some View {
    VStack(spacing: 20) {
      HeaderView(title: "Sink",
                 subtitle: "Receive Completion - Error",
                 description: "Sometimes your pipeline could have an error thrown that you want to catch and show. You can check for errors in the sink subscriber too.")
      
      Button("Start Processing") {
        vm.fetch()
      }
      Text(vm.data)
      Spacer()
    }
    .font(.title)
    .alert(isPresented: $vm.showErrorAlert) {
      Alert(title: Text("Error"), message: Text(vm.errorMessage))
    }
  }
}

struct Sink_Completion_Error_Previews: PreviewProvider {
  static var previews: some View {
    Sink_Completion_Error()
  }
}
