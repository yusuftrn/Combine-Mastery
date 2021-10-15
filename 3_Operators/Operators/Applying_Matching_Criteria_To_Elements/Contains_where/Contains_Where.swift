  //
  //  Contains_Where.swift
  //  Operators
  //
  //  Created by Yusuf Turan on 15.10.2021.
  //

import SwiftUI

struct Contains_Where: View {
  @StateObject private var vm = Contains_WhereViewModel()
  var body: some View {
    VStack(spacing: 20) {
      HeaderView(title: "Contains", subtitle: "Where",
                 description: "The contains(where:) operator will publish a true and finish the pipeline when an item coming through matches the criteria you specify within the closure it provides.")
      Group {
        Text(vm.fruitName)
        Toggle("Vitamin A", isOn: $vm.vitaminA)
        Toggle("Vitamin B", isOn: $vm.vitaminB)
        Toggle("Vitamin C", isOn: $vm.vitaminC)
      }
      .padding()
    }
    .font(.title2)
    .onAppear {
      vm.fetch()
    }
  }
}

struct Contains_Where_Previews: PreviewProvider {
  static var previews: some View {
    Contains_Where()
  }
}
