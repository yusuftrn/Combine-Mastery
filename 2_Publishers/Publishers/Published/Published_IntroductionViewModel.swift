//
//  Published_IntroductionViewModel.swift
//  Publishers
//
//  Created by Yusuf Turan on 4.10.2021.
//

import Foundation
import SwiftUI

class Published_IntroductionViewModel: ObservableObject {
  var characterLimit: Int = 30
  @Published var data: String = ""
  @Published var characterCount: Int = 0
  @Published var countColor: Color = Color.gray
  
  init() {
    $data
      .map { data -> Int in
        return data.count
      }
      .assign(to: &$characterCount)
    
    $characterCount
      .map { [unowned self] count -> Color in
        let eightyPercent = Int(Double(characterLimit) * 0.8)
        if (eightyPercent...characterLimit).contains(count) {
          return Color.yellow
        } else if count > characterLimit {
          return Color.red
        } else {
          return Color.gray
        }
      }
      .assign(to: &$countColor)
  }
}



