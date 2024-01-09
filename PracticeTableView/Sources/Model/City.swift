//
//  City.swift
//  PracticeTableView
//
//  Created by 쩡화니 on 1/9/24.
//  Copyright © 2024 com.jeonghi. All rights reserved.
//

import Foundation

struct City: Identifiable {
  var id: UUID = UUID()
  var city_name: String
  var city_english_name: String
  var city_explain: String
  var city_image: URL?
  var domestic_travel: Bool
  
  init(city_name: String, city_english_name: String, city_explain: String, city_image: String, domestic_travel: Bool) {
    self.city_name = city_name
    self.city_english_name = city_english_name
    self.city_explain = city_explain
    self.city_image = city_image.toURL()
    self.domestic_travel = domestic_travel
  }
}
