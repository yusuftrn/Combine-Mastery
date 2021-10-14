  //
  //  Timer_Intro.swift
  //  Publishers
  //
  //  Created by Yusuf Turan on 8.10.2021.
  //

import SwiftUI

struct Timer_Intro: View {
  @StateObject var vm = TimerIntroViewModel()
  var body: some View {
    VStack(spacing: 20) {
      HeaderView(title: "Timer", subtitle: "Introduction", description: "The Timer continually publishes the updated date and time at an interval you specify.")
      
      Text("Adjust Interval")
      Slider(
        value: $vm.interval,
        in: 0.1 ... 1,
        minimumValueLabel: Image(systemName: "hare"),
        maximumValueLabel: Image(systemName: "tortoise"),
        label: { Text("Interval") })
        .padding()
      
      List(vm.data, id:\.self) { dat in
        Text(dat)
          .font(.system(.title, design: .monospaced))
      }
    }
    .font(.title)
    .onAppear {
      vm.start()
    }
  }
}

struct Timer_Intro_Previews: PreviewProvider {
  static var previews: some View {
    Timer_Intro()
  }
}
