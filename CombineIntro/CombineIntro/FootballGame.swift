  //
  //  FootballGame.swift
  //  CombineIntro
  //
  //  This is presents how we use associatedtype
  //
  //  Created by Yusuf Turan on 22.09.2021.
  //

import SwiftUI

protocol GameScore {
  associatedtype TeamScore // This can be anything: String, Int, Array ..
  
  func calculateWinner(teamOne: TeamScore, teamTwo: TeamScore) -> String
}

struct Game: GameScore {
  typealias TeamScore = Int
  
  func calculateWinner(teamOne: Int, teamTwo: Int) -> String {
    if teamOne > teamTwo {
      return "Team one wins."
    } else if teamOne == teamTwo {
      return "This teams tied."
    } else {
      return "Team two wins."
    }
  }
}

struct FootballGame: View {
  var game = Game()
  private var team1 = Int.random(in: 1..<50)
  private var team2 = Int.random(in: 1..<50)
  @State private var winner = ""
  var body: some View {
    VStack(spacing: 20) {
      HeaderView(title: "AssociatedType",
                 subtitle: "Introduction",
                 description: """
                 When looking at Apple's documentation you see 'associatedtype' used a lot.
                 It's a placeholder for a type that YOU assign when you adopt the protocol.
                """)
      HStack(spacing: 40) {
        Text("Team One: \(team1)")
        Text("Team Two: \(team2)")
      }
      Button("Calculate Winner") {
        winner = game.calculateWinner(teamOne: team1, teamTwo: team2)
      }
      
      Text(winner)
      
      Spacer()
    }
    .font(.title	)
  }
}

struct FootballGame_Previews: PreviewProvider {
  static var previews: some View {
    FootballGame()
  }
}
