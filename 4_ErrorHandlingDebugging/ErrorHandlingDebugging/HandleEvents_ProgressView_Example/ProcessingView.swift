//
//  ProcessingView.swift
//  ErrorHandlingDebugging
//
//  Created by Yusuf Turan on 20.10.2021.
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
    .padding(20)
    .background(RoundedRectangle(cornerRadius: 15).fill(Color.black.opacity(0.9)))
  }
}
struct ProcessingView_Previews: PreviewProvider {
    static var previews: some View {
        ProcessingView()
    }
}
