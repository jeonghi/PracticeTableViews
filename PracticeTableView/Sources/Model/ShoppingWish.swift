//
//  Schdule.swift
//  PracticeTableView
//
//  Created by 쩡화니 on 1/7/24.
//

import Foundation

struct ShoppingWish: Identifiable, Codable {
  var id: UUID = .init()
  var isChecked: Bool = false
  var content: String
  var isFavorite: Bool = false
  var createdAt: Date = Date()
}
