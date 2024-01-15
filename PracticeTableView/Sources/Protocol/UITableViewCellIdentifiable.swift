//
//  UITableViewCellIdentifiable.swift
//  PracticeTableView
//
//  Created by 쩡화니 on 1/12/24.
//  Copyright © 2024 com.jeonghi. All rights reserved.
//

import UIKit

protocol UITableViewCellIdentifiable: UITableViewCell {
  static var id: String { get }
  static var type: UITableViewCell.Type { get }
}

extension UITableViewCellIdentifiable {
  static var type: UITableViewCell.Type {
    Self.self
  }
  
  static var id: String {
    String(describing: Self.type)
  }
}
