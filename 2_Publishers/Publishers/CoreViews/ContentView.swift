  //
  //  ContentView.swift
  //  Publishers
  //
  //  Created by Yusuf Turan on 4.10.2021.
  //

import SwiftUI

struct ContentView: View {
  var body: some View {
    VStack(spacing: 20) {
      HeaderView(
        title: "Using iOS",
        subtitle: "Introduction",
        description: "Lets use iOS as the view that will consume data.")
      
      Text("<Insert Example Here.>")
      
      Spacer()
    }
    .font(.title)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
