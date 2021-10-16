  //
  //  Throttle_Intro.swift
  //  Operators
  //
  //  Created by Yusuf Turan on 16.10.2021.
  //

import SwiftUI

struct Throttle_Intro: View {
  @StateObject private var vm = Throttle_IntroViewModel()
  @State private var startStop = true
  
  var body: some View {
    VStack(spacing: 20) {
      HeaderView(title: "Throttle", subtitle: "Introduction",
                 description: "Set a time interval and specify if you want the first or last item received within that interval republished.")
        .layoutPriority(1)
      
      Text("Adjust Throttle")
      Slider(value: self.$vm.throttleValue, in: 0.1 ... 1,
             minimumValueLabel: Image(systemName: "hare"),
             maximumValueLabel: Image(systemName: "tortoise"),
             label: { Text("Throttle") })
        .padding()
      
      HStack {
        Button(startStop ? "Start" : "Stop") {
          startStop.toggle()
          vm.start()
        }
        Spacer()
        Button("Reset") {
          vm.reset()
        }
      }
      .padding(.horizontal)
      
      List(vm.data, id: \.self) { dataComing in
        Text(dataComing)
      }
    }
    .font(.title2)
  }
}

struct Throttle_Intro_Previews: PreviewProvider {
  static var previews: some View {
    Throttle_Intro()
  }
}
