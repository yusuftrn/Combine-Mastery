  //
  //  Future_Intro.swift
  //  Publishers
  //
  //  Created by Yusuf Turan on 5.10.2021.
  //

import SwiftUI

struct Future_Intro: View {
  @StateObject private var vm = Future_IntroViewModel()
  var body: some View {
    VStack(spacing: 20) {
      HeaderView(title: "Future", subtitle: "Introduction", description: "The future publisher will publish one value, either immediately or at some future time, from the closure provided to you.")
      
      Button("Say Hello") {
        vm.sayHello()
      }
      Text(vm.hello)
        .padding(.bottom)
    
      Button("Say GoodByee") {
        vm.sayGoodbye()
      }
      Text(vm.goodbye)
      
      Spacer()
    }
    .font(.title)
  }
}

struct Future_Intro_Previews: PreviewProvider {
  static var previews: some View {
    Future_Intro()
  }
}
