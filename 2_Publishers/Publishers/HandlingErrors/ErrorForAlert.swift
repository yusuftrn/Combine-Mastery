//
//  ErrorForAlert.swift
//  Publishers
//
//  Created by Yusuf Turan on 15.10.2021.
//

import Foundation

struct ErrorForAlert: Error, Identifiable {
  let id = UUID()
  let title = "Error"
  var message = "Please try again later."
}
