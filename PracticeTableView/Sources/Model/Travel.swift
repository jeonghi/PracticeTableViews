//
//  Travel.swift
//  PracticeTableView
//
//  Created by 쩡화니 on 1/11/24.
//  Copyright © 2024 com.jeonghi. All rights reserved.
//

import Foundation

struct Travel: Codable {
  let title: String
  let description: String?
  let travel_image: URL?
  let grade: Double?
  let save: Int?
  let like: Bool?
  let ad: Bool
  
  init(title: String, description: String?, travel_image: String?, grade: Double?, save: Int?, like: Bool?, ad: Bool) {
    self.title = title
    self.description = description
    self.travel_image = travel_image?.toURL()
    self.grade = grade
    self.save = save
    self.like = like
    self.ad = ad
  }
}
