  //
  //  SetFailureType_Intro.swift
  //  Operators
  //
  //  Created by Yusuf Turan on 16.10.2021.
  //

import SwiftUI

struct SetFailureType_Intro: View {
  @StateObject private var vm = SetFailureType_IntroViewModel()
  var body: some View {
    VStack(spacing: 20) {
      HeaderView(title: "SetFailureType", subtitle: "Introduction",
                 description: "The setFailureType operator can change a type of a publisher by changing its failure type from Never to something else.")
      
      HStack(spacing: 50) {
        Button("Western") { vm.fetch(westernStates: true) }
        Button("Eastern") { vm.fetch(westernStates: false) }
      }
      
      Text("States").bold()
      
      List(vm.states, id: \.self) {state in
        Text(state)
      }
    }
    .font(.title2)
    .alert(item: self.$vm.error) { error in
      Alert(title: Text(error.title), message: Text(error.message))
    }
  }
}

struct SetFailureType_Intro_Previews: PreviewProvider {
  static var previews: some View {
    SetFailureType_Intro()
  }
}
