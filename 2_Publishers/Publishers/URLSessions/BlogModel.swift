//
//  BlogModel.swift
//  Publishers
//
//  Created by Yusuf Turan on 15.10.2021.
//

import Foundation

struct BlogModel: Decodable {
  let id: Int
  let title: String
  let body: String
}
