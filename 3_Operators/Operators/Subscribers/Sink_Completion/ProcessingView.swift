  //
  //  ProcessingView.swift
  //  Operators
  //
  //  Created by Yusuf Turan on 17.10.2021.
  //

import SwiftUI

struct ProcessingView: View {
  var body: some View {
    VStack {
      ProgressView()
        .progressViewStyle(CircularProgressViewStyle(tint: .white))
        .scaleEffect(2)
        .padding()
      Text("Processing...")
        .foregroundColor(.white)
    }
    .padding()
    .background(RoundedRectangle(cornerRadius: 15).fill(Color.black.opacity(0.8)))
  }
}

struct ProcessingView_Previews: PreviewProvider {
  static var previews: some View {
    ProcessingView()
  }
}
