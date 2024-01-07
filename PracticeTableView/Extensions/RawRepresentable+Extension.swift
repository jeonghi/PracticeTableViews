//
//  RawRepresentable+Extension.swift
//  PracticeTableView
//
//  Created by 쩡화니 on 1/7/24.
//

import Foundation

extension RawRepresentable where Self: CaseIterable, RawValue == String {
  static func label(forRow row: Int) -> String? {
    return Self.allCases.map { $0.rawValue }[safe: row]
  }
}
