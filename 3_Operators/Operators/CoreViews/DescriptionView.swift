//
//  DescriptionView.swift
//  Operators
//
//  Created by Yusuf Turan on 15.10.2021.
//

import SwiftUI

struct DescriptionView: View {
  var desc = "Use this to..."
  
  init(_ desc: String) {
    self.desc = desc
  }
  var body: some View {
    Text(desc)
      .frame(maxWidth: .infinity)
      .padding()
      .background(Color.yellow)
      .foregroundColor(.white)
  }
}

struct DescriptionView_Previews: PreviewProvider {
  static var previews: some View {
    DescriptionView("Use this to...")
  }
}
