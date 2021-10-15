  //
  //  UrlDataTaskPublisher_Intro.swift
  //  Publishers
  //
  //  Created by Yusuf Turan on 15.10.2021.
  //

import SwiftUI

struct UrlDataTaskPublisher_Intro: View {
  
  @StateObject private var vm = UrlDataTaskPublisher_IntroViewModel()
  
  var body: some View {
    VStack(spacing: 20) {
      HeaderView(
        title: "DataTaskPublisher",
        subtitle: "Introduction",
        description: "URLSession has a dataTaskPublisher you can use to get data from a URL and run it through a pipeline."
      )
      
      List(vm.dataToView, id: \.id) { blogPost in
        Text(blogPost.title)
          .fontWeight(.bold)
        Text(blogPost.body)
          .font(.caption)
      }
    }
    .onAppear {
      vm.fetch()
    }
  }
}

struct UrlDataTaskPublisher_Intro_Previews: PreviewProvider {
  static var previews: some View {
    UrlDataTaskPublisher_Intro()
  }
}
