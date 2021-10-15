  //
  //  TryContains_Where.swift
  //  Operators
  //
  //  Created by Yusuf Turan on 15.10.2021.
  //

import SwiftUI

struct TryContains_Where: View {
  @StateObject private var vm = TryContains_WhereViewModel()
  var body: some View {
    VStack(spacing: 20) {
      HeaderView(title: "TryContains", subtitle: "Introduction", description: "The tryContains(where: ) operator works like contains(where: ) except now the subscriber can also receive an error in addition to a true or false.")
      Text("Look for Salt Water in:")
      Picker("Place", selection: $vm.place) {
        Text("Nevada").tag("Nevada")
        Text("Utah").tag("Utah")
        Text("Mars").tag("Mars")
      }
      .pickerStyle(SegmentedPickerStyle())
      
      Button {
        vm.search()
      } label: {
        Text("Search")
      }
      
      Text("Result: \(vm.result)")
    }
    .font(.title2)
    .alert(item: $vm.invalidSelectionError) { alertData in
      Alert(title: Text("Invalid Selection"),message: Text("\(alertData.localizedDescription)"))
    }
  }
}

struct TryContains_Where_Previews: PreviewProvider {
  static var previews: some View {
    TryContains_Where()
  }
}
