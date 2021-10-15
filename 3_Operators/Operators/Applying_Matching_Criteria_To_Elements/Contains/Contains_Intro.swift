  //
  //  Contains_Intro.swift
  //  Operators
  //
  //  Created by Yusuf Turan on 15.10.2021.
  //

import SwiftUI

struct Contains_Intro: View {
  @StateObject private var vm = Contains_IntroViewModel()
  var body: some View {
    VStack(spacing: 20) {
      HeaderView(title: "Contains", subtitle: "Introduction",
                 description: "The contains operator will publish a true and finish the pipeline when an item coming through matches its criteria.")
      
      Text("House Details").fontWeight(.bold)
      Group {
        Text(vm.description)
        Toggle("Air Conditioning", isOn: $vm.airConditioning)
        Toggle("Basement", isOn: $vm.basement)
        Toggle("Heating", isOn: $vm.heating)
      }
      .padding()
    }
    .font(.title2)
    .onAppear {
      vm.fetch()
    }
  }
}

struct Contains_Intro_Previews: PreviewProvider {
  static var previews: some View {
    Contains_Intro()
  }
}
