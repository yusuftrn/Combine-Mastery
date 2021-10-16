  //
  //  Sink_Completion.swift
  //  Operators
  //
  //  Created by Yusuf Turan on 17.10.2021.
  //

import SwiftUI

struct Sink_Completion: View {
  @StateObject private var vm = SinkCompletionViewModel()
  var body: some View {
    ZStack {
      VStack(spacing: 20) {
        HeaderView(title: "Sink", subtitle: "Receive Completion",
                   description: "The sink subscriber also has a parameter for a closure that will run when the pipeline completes publishing. One use might be to know when to stop showing an activity indicator.")
        
        Button("Start Processing") {
          vm.fetch()
        }
        Text(vm.data)
        Spacer()
      }
      .font(.title2)
      
      if vm.isProcessing { ProcessingView() }
    }
  }
}

struct Sink_Completion_Previews: PreviewProvider {
  static var previews: some View {
    Sink_Completion()
  }
}
