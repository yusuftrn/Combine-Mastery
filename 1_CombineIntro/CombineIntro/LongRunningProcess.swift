//
//  LongRunningProcess.swift
//  CombineIntro
//
//  Created by Yusuf Turan on 22.09.2021.
//

import SwiftUI
import Combine

class LongRunningProcessVM: ObservableObject {
  @Published var data = "Start Data"
  @Published var status = ""
  private var cancellablePipeline: AnyCancellable?
  
  init() {
    cancellablePipeline = $data
      .map { [unowned self] value -> String in
        status = "Processing..."
        return value
      }
      .delay(for: 5, scheduler: RunLoop.main)
      .sink { [unowned self] value in
        status = "Finished Process."
      }
  }
  
  func refreshData() {
    data = "Refreshed Data"
  }
  
  func cancel() {
    status = "Cancelled"
    cancellablePipeline?.cancel()
  }
}

struct LongRunningProcess: View {
  @StateObject private var vm = LongRunningProcessVM()
  
  var body: some View {
    VStack(spacing: 20) {
      HeaderView(title: "Cancellable Pipeline",
                 subtitle: "Long-Running Process",
                 description: "In this example we pretend we have a long-running process that we can cancel before it finishes.")
      
      Text(vm.data)
      
      Button("Refresh Data") {
        vm.refreshData()
      }
      Button("Cancel Subscription") {
        vm.cancel()
      }
      .opacity(vm.status == "Processing..." ? 1 : 0)
      
      Text(vm.status)
    }
    .font(.title)
  }
}

struct LongRunningProcess_Previews: PreviewProvider {
    static var previews: some View {
        LongRunningProcess()
    }
}
