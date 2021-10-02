  //
  //  PublishedExample.swift
  //  CombineIntro
  //
  //  Created by Yusuf Turan on 22.09.2021.
  //

import SwiftUI

class PublishedVM: ObservableObject {
  @Published var name = ""
}

struct PublishedExample: View {
  
  @StateObject private var viewModel = PublishedVM()
  @State private var message = ""
  
  var body: some View {
    VStack(spacing: 20) {
      HeaderView(
        title: "@Published",
        subtitle: "Introduction",
        description: """
        You could use the onChange to validate data entry. While this works, you may want to move this logic to your view model.
        """
      )
      
      HStack {
        TextField("name", text: self.$viewModel.name)
          .textFieldStyle(RoundedBorderTextFieldStyle())
          .onChange(of: viewModel.name) { value in
            message = value.isEmpty ? "❌" : "✅"
          }
        Text(message)
      }
      .padding()
    }
    .font(.headline)
  }
}

struct PublishedExample_Previews: PreviewProvider {
  static var previews: some View {
    PublishedExample()
  }
}
