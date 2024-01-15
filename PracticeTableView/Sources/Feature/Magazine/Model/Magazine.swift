//
//  Magazine.swift
//  PracticeTableView
//
//  Created by 쩡화니 on 1/9/24.
//  Copyright © 2024 com.jeonghi. All rights reserved.
//

import Foundation

struct Magazine: Codable {
  var title: String
  var subtitle: String
  var photo_image: URL?
  var date: Date?
  var link: URL?
  
  init(title: String, subtitle: String, photo_image: String, date: String, link: String) {
    self.title = title
    self.subtitle = subtitle
    self.photo_image = photo_image.toURL()
    self.date = date.toDate()
    self.link = link.toURL()
  }
}


