  //
  //  DataTaskPublisher_Errors.swift
  //  Publishers
  //
  //  Created by Yusuf Turan on 15.10.2021.
  //

import SwiftUI

struct DataTaskPublisher_Errors: View {
  @StateObject private var vm = DataTaskPublisher_ErrorsViewModel()
  var body: some View {
    VStack(spacing: 20) {
      HeaderView(title: "DataTaskPublisher",
                 subtitle: "Handling Errors",
                 description: "Here is an example of displaying an alert with an error message if an error is thrown in the pipeline.")
      
      List(vm.dataToView, id:\.id) { blogPost in
        Text(blogPost.title)
          .fontWeight(.bold)
        Text(blogPost.body)
          .font(.caption)
      }
    }
    .onAppear {
      vm.fetch()
    }
    .alert(item: $vm.errorForAlert) { error in
      Alert(title: Text(error.title), message: Text(error.message), dismissButton: .default(Text("OKEY")))
    }
  }
}

struct DataTaskPublisher_Errors_Previews: PreviewProvider {
  static var previews: some View {
    DataTaskPublisher_Errors()
  }
}
