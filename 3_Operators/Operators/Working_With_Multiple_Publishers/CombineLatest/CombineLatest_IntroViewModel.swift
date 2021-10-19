//
//  CombineLatest_IntroViewModel.swift
//  Operators
//
//  Created by Yusuf Turan on 17.10.2021.
//

import SwiftUI
import Combine

class CombineLatest_IntroViewModel: ObservableObject {
  @Published var artData = ArtData()
  
  func fetch() {
    let artists = ["Picasso", "Michelangelo", "van Gogh", "da Vinci", "Monet"]
    let colors =  [Color.red, Color.orange, Color.blue, Color.purple, Color.green]
    let numbers = [1, 2, 3, 4]
    
    _ = artists.publisher
      .combineLatest(colors.publisher, numbers.publisher) { (artist, color, number) in
        return ArtData(artist: artist, color: color, number: number)
      }
      .sink { [unowned self] artData in
        self.artData = artData
      }
  }
}
