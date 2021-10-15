  //
  //  DataTaskPublisher_ForImages.swift
  //  Publishers
  //
  //  Created by Yusuf Turan on 15.10.2021.
  //

import SwiftUI

struct DataTaskPublisher_ForImages: View {
  @StateObject private var vm = DataTaskPublisher_ForImagesViewModel()

  var body: some View {
    VStack(spacing: 20) {
      HeaderView(title: "DataTaskPublisher", subtitle: "For Images", description: "You can use the dataTaskPublisher operator to download images with a URL.")
      
      let image = self.vm.imageView
      image?.frame(width: 200, height: 300, alignment: .center)
      
      Button {
        vm.fetch()
      } label: {
        Text("Fetch New Image")
      }
      Spacer()
    }
    .font(.title)
    .onAppear {
      vm.fetch()
    }
    .alert(item: $vm.errorForAlert) { error in
      Alert(title: Text(error.title), message: Text(error.message))
    }
  }
}

struct DataTaskPublisher_ForImages_Previews: PreviewProvider {
  static var previews: some View {
    DataTaskPublisher_ForImages()
  }
}
