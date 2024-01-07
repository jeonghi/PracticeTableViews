//
//  UserDefaultManager.swift
//  PracticeTableView
//
//  Created by 쩡화니 on 1/7/24.
//

import Foundation

final class UserDefaultManager {
  
  private init() {}
  
  @UserDefaultWrapper(key: Key.쇼핑위시리스트.rawValue, defaultValue: [ShoppingWish.ID: ShoppingWish]())
  static var shoppingWishDict: [ShoppingWish.ID: ShoppingWish]
}

extension UserDefaultManager {
  /// 키 정의
  enum Key: String {
    case 쇼핑위시리스트
  }
}
