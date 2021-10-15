  //
  //  Count_Intro.swift
  //  Operators
  //
  //  Created by Yusuf Turan on 15.10.2021.
  //

import SwiftUI

struct Count_Intro: View {
  @StateObject private var vm = Count_IntroViewModel()
  var body: some View {
    NavigationView {
      VStack(spacing: 20) {
        HeaderView(title: "", subtitle: "Introduction", description: "The count operator simply publishes the total number of items it receives from the upstream publisher.")
        
        Form {
          NavigationLink {
            CountDetailView(data: vm.data)
          } label: {
            Text(vm.title)
              .frame(maxWidth: .infinity, alignment: .leading)
            Text("\(vm.count)")
          }
        }
        
      }
      .navigationTitle("Count")
      .font(.title2)
      .onAppear {
        vm.fetch()
      }
    }
  }
}

struct CountDetailView: View {
  var data: [String]
  var body: some View {
    List(data, id: \.self) { dat in
      Text(dat)
    }
    .font(.title2)
  }
}

struct Count_Intro_Previews: PreviewProvider {
  static var previews: some View {
    Count_Intro()
  }
}
