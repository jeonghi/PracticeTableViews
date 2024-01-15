//
//  UIViewController+Extension.swift
//  PracticeTableView
//
//  Created by 쩡화니 on 1/15/24.
//  Copyright © 2024 com.jeonghi. All rights reserved.
//

import UIKit

extension UIViewController: UIViewControllerIdentifiable {
  static var id: String {
    get {
      String(describing: self)
    }
  }
}
