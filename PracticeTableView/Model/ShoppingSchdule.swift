//
//  Schdule.swift
//  PracticeTableView
//
//  Created by 쩡화니 on 1/7/24.
//

import Foundation

struct ShoppingSchdule: Identifiable {
  let id: UUID = .init()
  var isChecked: Bool
  var content: String
  var isImportant: Bool
}
