  //
  //  FlatMap_Intro.swift
  //  Operators
  //
  //  Created by Yusuf Turan on 17.10.2021.
  //

import SwiftUI

struct FlatMap_Intro: View {
  @StateObject private var vm = FlatMap_IntroViewModel()
  @State private var count = 1
  var body: some View {
    VStack(spacing: 20) {
      HeaderView(title: "FlatMap", subtitle: "Introduction",
                 description: "The flatMap operator can be used to create a new publisher for each item that comes through the pipeline.")

      Text(vm.names.joined(separator: ", "))
      Button("Find Gender Probability") {
        vm.fetchNameResults()
      }
      List(vm.nameResult, id:\.name) { nameResult in
        HStack {
          Text(nameResult.name)
            .frame(maxWidth: .infinity, alignment: .leading)
          Text(nameResult.gender + ": ")
          Text(getPercent(nameResult.probability))
        }
      }
    }
    .font(.title2)
  }
  
  func getPercent(_ number: Double) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .percent
    return formatter.string(from: NSNumber(value: number)) ?? "N/A"
  }
}

struct FlatMap_Intro_Previews: PreviewProvider {
  static var previews: some View {
    FlatMap_Intro()
  }
}
