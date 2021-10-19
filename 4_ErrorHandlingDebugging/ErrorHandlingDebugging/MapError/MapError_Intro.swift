  //
  //  MapError_Intro.swift
  //  ErrorHandlingDebugging
  //
  //  Created by Yusuf Turan on 17.10.2021.
  //

import SwiftUI

struct MapError_Intro: View {
  @StateObject private var vm = MapError_IntroViewModel()
  var body: some View {
    VStack(spacing: 20) {
      HeaderView(title: "MapError", subtitle: "Introduction",
                 description: "The mapError operator provides a closure to receive an upstream error and then republish another error.")
      
      Button("Fetch Data") { vm.fetch() }
      List(vm.todos) { todo in
        Label(title: { Text(todo.title) },
              icon: { Image(systemName: todo.completed ? "checkmark.circle.fill" : "circle") })
      }
    }
    .font(.title2)
    .alert(item: self.$vm.error) { error in
      Alert(title: Text("Error"), message: Text(error.message))
    }
  }
}

struct MapError_Intro_Previews: PreviewProvider {
  static var previews: some View {
    MapError_Intro()
  }
}
