//
//  ErrorForView.swift
//  ErrorHandlingDebugging
//
//  Created by Yusuf Turan on 17.10.2021.
//

import Foundation

struct ErrorForView: Error, Identifiable {
  let id = UUID()
  var message = ""
}

enum UrlResponseErrors: String, Error {
  case unknown = "Response wasn't recognized"
  case clientError = "Problem getting the information"
  case serverError = "Problem with the server"
  case decodeError = "Problem reading the returned data"
}
