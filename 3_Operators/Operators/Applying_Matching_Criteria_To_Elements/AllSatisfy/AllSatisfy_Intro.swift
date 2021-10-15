  //
  //  AllSatisfy_Intro.swift
  //  Operators
  //
  //  Created by Yusuf Turan on 15.10.2021.
  //

  /*
  The allSatisfy operator will check each number in the numbers array to see if they are in the Fibonacci sequence.
  */
import SwiftUI

struct AllSatisfy_Intro: View {
  @State private var number = ""
  @State private var resultVisible = false
  @StateObject private var vm = AllSatisfy_IntroViewModel()
  
  var body: some View {
    VStack(spacing: 20) {
      HeaderView(title: "AllSatisfy", subtitle: "Introduction",
                 description: "Use allSatisfy operator to test all items against a condition. If all items satisfy your criteria, a true is returned, else a false is returned.")
        .layoutPriority(1)
      
      HStack {
        TextField("add a number", text: $number)
          .textFieldStyle(RoundedBorderTextFieldStyle())
          .keyboardType(.numberPad)
        Button {
          vm.add(number: number)
          number = ""
        } label: {
          Image(systemName: "plus")
        }
      }.padding()
      
      List(vm.numbers, id: \.self) { number in
        Text("\(number)")
      }
      Spacer(minLength: 0)
      Button {
        vm.checkAllFibNumbers()
        resultVisible = true
      } label: {
        Text("Fibonacci Numbers?")
      }
      Text(vm.allFibNumbers ? "Yes" : "No")
        .opacity(resultVisible ? 1 : 0)
    }
    .padding(.bottom)
    .font(.title2)
  }
}

struct AllSatisfy_Intro_Previews: PreviewProvider {
  static var previews: some View {
    AllSatisfy_Intro()
  }
}
