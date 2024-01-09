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
  
  @UserDefaultWrapper(key:Key.매거진.rawValue, defaultValue: MagazineInfo.dummyMagazine)
  static var magazineInfoList: [Magazine]
  
  @UserDefaultWrapper(key: Key.여행인기도시.rawValue, defaultValue: CityInfo.city)
  static var popularCityList: [City]
}

extension UserDefaultManager {
  /// 키 정의
  enum Key: String {
    case 쇼핑위시리스트
    case 매거진
    case 여행인기도시
  }
}
