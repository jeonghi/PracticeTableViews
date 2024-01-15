//
//  UITableViewCell+Extension.swift
//  PracticeTableView
//
//  Created by 쩡화니 on 1/12/24.
//  Copyright © 2024 com.jeonghi. All rights reserved.
//

import UIKit

extension UITableView {
    // 셀 재사용 메서드
    func dequeueReusableCell<T: UITableViewCellIdentifiable>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.id, for: indexPath) as? T else {
            fatalError("Cannot dequeue cell with identifier: \(T.id)")
        }
        return cell
    }
}
