  //
  //  AssignTo_Intro.swift
  //  Operators
  //
  //  Created by Yusuf Turan on 16.10.2021.
  //

import SwiftUI

struct AssignTo_Intro: View {
  @StateObject private var vm = AssignToViewModel()
  var body: some View {
    VStack(spacing: 20) {
      HeaderView(title: "Assign To", subtitle: "Introduction", description: "The assign(to:) subscriber is very specific to JUST @Published properties. It will easily allow you to add the value that come down the pipeline to your published properties which will then notify and update your views.")
      
      Text(vm.greeting)
    }
    .font(.title2)
    .onAppear {
      vm.fetch()
    }
  }
}

struct AssignTo_Intro_Previews: PreviewProvider {
  static var previews: some View {
    AssignTo_Intro()
  }
}
