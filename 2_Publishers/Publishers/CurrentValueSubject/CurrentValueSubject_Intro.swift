  //
  //  CurrentValueSubject_Intro.swift
  //  Publishers
  //
  //  Created by Yusuf Turan on 4.10.2021.
  //

import SwiftUI

struct CurrentValueSubject_Intro: View {
  
  @StateObject private var vm = CurrentValueSubjectViewModel()
  
  var body: some View {
    VStack(spacing: 20) {
      HeaderView(
        title: "CurrentValueSubject",
        subtitle: "Introduction",
        description: "The CurrentValueSubject publisher will publish its existing value and also new values when it gets them.")
      
      /// Using the send function or setting value directly are both valid.
      Button("Select Yusuf") {
        vm.selection.send("Yusuf")
      }
      Button("Select Joseph") {
        vm.selection.value = "Joseph"
      }
      Text(vm.selection.value)
        .foregroundColor(vm.selectionSame.value ? .red : .green)
    }
    .font(.title)
  }
}

struct CurrentValueSubject_Intro_Previews: PreviewProvider {
  static var previews: some View {
    CurrentValueSubject_Intro()
  }
}
