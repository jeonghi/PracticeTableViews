//
//  Cellection+Extension.swift
//  PracticeTableView
//
//  Created by 쩡화니 on 1/7/24.
//

import Foundation

extension Collection {
  subscript(safe index: Index) -> Element? {
    return indices.contains(index) ? self[index] : nil
  }
}
