//
//  Stirng+Extensions.swift
//  PracticeTableView
//
//  Created by 쩡화니 on 1/9/24.
//  Copyright © 2024 com.jeonghi. All rights reserved.
//

import Foundation

extension String {
  func toURL() -> URL? {
    URL(string: self)
  }
  
  func toDate() -> Date? {
    let dateFormatter = DateFormatter()
    dateFormatter.locale = .current
    dateFormatter.dateFormat = "yyMMdd"
    if let date = dateFormatter.date(from: self) {
      return date
    } else {
      return nil
    }
  }
}
