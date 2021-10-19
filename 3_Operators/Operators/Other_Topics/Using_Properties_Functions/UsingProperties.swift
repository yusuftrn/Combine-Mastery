  //
  //  UsingProperties.swift
  //  Operators
  //
  //  Created by Yusuf Turan on 17.10.2021.
  //

import SwiftUI

struct UsingProperties: View {
  @StateObject private var vm = UsingPropertiesViewModel()
  var body: some View {
    VStack(spacing: 20) {
      HeaderView(title: "Using Properties", subtitle: "Introduction",
                 description: "You can store publishers in properties to be used later. The publisher can also have operators connected to them too.")
      
      Text("\(vm.firstName), \(vm.lastName)")
      Text("Team")
        .bold()
      List(vm.team, id: \.self) { name in
        Text(name)
      }
    }
    .font(.title2)
    .onAppear {
      vm.fetch()
    }
  }
}

struct UsingProperties_Previews: PreviewProvider {
  static var previews: some View {
    UsingProperties()
  }
}
