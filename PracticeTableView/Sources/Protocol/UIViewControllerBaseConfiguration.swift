//
//  UIViewControllerBaseConfiguration.swift
//  PracticeTableView
//
//  Created by 쩡화니 on 1/11/24.
//  Copyright © 2024 com.jeonghi. All rights reserved.
//

import Foundation

@objc
protocol UIViewControllerBaseConfiguration: AnyObject {
  func configUI()
  @objc optional func configLabelUI()
  @objc optional func configViewUI()
  @objc optional func configTextFieldUI()
  //.. etc...
}

extension UIViewControllerBaseConfiguration {
  func configUI(){
    configLabelUI?() // 와 이게 옵셔널 체이닝이 된다고?,,,,, swift 폼 미쳤다...
    configViewUI?()
    configTextFieldUI?()
  }
}
