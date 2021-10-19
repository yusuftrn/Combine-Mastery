//
//  ToDO.swift
//  ErrorHandlingDebugging
//
//  Created by Yusuf Turan on 17.10.2021.
//

import Foundation

struct ToDo: Identifiable, Decodable {
  var id: Int
  var title: String
  var completed: Bool
}
