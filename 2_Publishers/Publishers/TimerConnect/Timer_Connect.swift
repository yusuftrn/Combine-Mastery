  //
  //  Timer_Connect.swift
  //  Publishers
  //
  //  Created by Yusuf Turan on 8.10.2021.
  //

import SwiftUI

struct Timer_Connect: View {
  @StateObject private var vm = Timer_ConnectViewModel()
  var body: some View {
    VStack(spacing: 20) {
      HeaderView(title: "Timer", subtitle: "Connect", description: "Instead of using autoconnect, you can manually connect the Timer publisher which is like turning on the flow of water.")
      
      HStack {
        Button("Connect") { vm.start() }
          .frame(maxWidth: .infinity)
        Button("Stop") { vm.stop() }
        .frame(maxWidth: .infinity)
      }
      
      List(vm.data, id:\.self) { data in
        Text(data)
          .font(.system(.title, design: .monospaced))
      }
    }
    .font(.title)
  }
}

struct Timer_Connect_Previews: PreviewProvider {
  static var previews: some View {
    Timer_Connect()
  }
}
