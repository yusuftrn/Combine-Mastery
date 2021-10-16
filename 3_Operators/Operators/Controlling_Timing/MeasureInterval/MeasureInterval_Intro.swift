  //
  //  MeasureInterval_Intro.swift
  //  Operators
  //
  //  Created by Yusuf Turan on 16.10.2021.
  //

import SwiftUI

struct MeasureInterval_Intro: View {
  @StateObject private var vm = MeasureInterval_IntroViewModel()
  @State private var ready = false
  @State private var showSpeed = false
  
  var body: some View {
    VStack(spacing: 20) {
      HeaderView(title: "MeasureInterval", subtitle: "Introduction",
                 description: "The measureInterval operator can measure how much time has elapsed between items sent through a publisher.")
      VStack(spacing: 20) {
        Text("Tap Start and then tap the rectangle when it turns green")
        Button("Start") {
          DispatchQueue.main.asyncAfter(deadline: .now() + Double.random(in: 0.5 ... 2.0)) {
            ready = true
            vm.timeEvent.send()
          }
        }
        Button {
          vm.timeEvent.send()
          showSpeed = true
        } label: {
          RoundedRectangle(cornerRadius: 25.0).fill(ready ? Color.green : Color.secondary)
        }
        Text("Reaction Speed: \(vm.speed)")
          .opacity(showSpeed ? 1 : 0)
      }
      .padding()
    }
    .font(.title2)
  }
}

struct MeasureInterval_Intro_Previews: PreviewProvider {
  static var previews: some View {
    MeasureInterval_Intro()
  }
}
