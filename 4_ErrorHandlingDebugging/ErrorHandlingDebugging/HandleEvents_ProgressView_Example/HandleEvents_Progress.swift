  //
  //  HandleEvents_Progress.swift
  //  ErrorHandlingDebugging
  //
  //  Created by Yusuf Turan on 20.10.2021.
  //

import SwiftUI

struct HandleEvents_Progress: View {
  @StateObject private var vm = HandleEvents_ProgressViewModel()
  var body: some View {
    ZStack {
      VStack(spacing: 20) {
        HeaderView(title: "HandleEvents", subtitle: "Showing Progress",
                   description: "You can also use handleEvents to hide and show views. In this example a ProgressView is shown while fetching data.")
        
        Form {
          Section(header: Text("Bitcoin Price").font(.title2)) {
            HStack {
              Text("USD")
                .frame(maxWidth: .infinity, alignment: .leading)
              Text(vm.usdBitcoinRate)
                .layoutPriority(1)
            }
          }
        }
      }
      if vm.isFetching {
        ProcessingView()
      }
    }
    .font(.title)
    .onAppear {
      vm.fetch()
    }
  }
}

struct HandleEvents_Progress_Previews: PreviewProvider {
  static var previews: some View {
    HandleEvents_Progress()
  }
}
