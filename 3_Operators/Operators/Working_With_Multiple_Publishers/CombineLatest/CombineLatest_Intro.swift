  //
  //  CombineLatest_Intro.swift
  //  Operators
  //
  //  Created by Yusuf Turan on 17.10.2021.
  //

import SwiftUI

struct CombineLatest_Intro: View {
  @StateObject private var vm = CombineLatest_IntroViewModel()
  var body: some View {
    VStack(spacing: 20) {
      HeaderView(title: "CombineLatest", subtitle: "Introduction",
                 description: "You can combine multiple pipelines and pair up the last values from each one and do something with them using the combineLatest operator.")
      
      VStack {
        Image(systemName: "\(vm.artData.number).circle")
        Image(vm.artData.artist)
          .resizable()
          .aspectRatio(contentMode: .fit)
        Text(vm.artData.artist)
          .font(.body)
      }
      .padding()
      .background(vm.artData.color.opacity(0.3))
      .padding()
    }
    .font(.title2)
    .onAppear {
      vm.fetch()
    }
  }
}

struct CombineLatest_Intro_Previews: PreviewProvider {
  static var previews: some View {
    CombineLatest_Intro()
  }
}
