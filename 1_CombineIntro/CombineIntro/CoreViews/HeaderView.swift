  //
  //  HeaderView.swift
  //  CombineIntro
  //
  //  Created by Yusuf Turan on 21.09.2021.
  //

import SwiftUI

struct HeaderView: View {
  var title = "Title"
  var subtitle = "Subtitle"
  var description = "Use this to.."
  
  init(title: String, subtitle: String, description: String) {
    self.title = title
    self.subtitle = subtitle
    self.description = description
  }
  
  var body: some View {
    VStack(spacing: 15) {
      if !title.isEmpty {
        Text(title)
          .font(.largeTitle)
      }
      
      Text(subtitle)
        .foregroundColor(.gray)
      
      DescriptionView(description)
    }
  }
}

struct HeaderView_Previews: PreviewProvider {
  static var previews: some View {
    HeaderView(title: "Title", subtitle: "Subtitle", description: "Use this to...")
  }
}
