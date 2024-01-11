//
//  PopularCityCollectionViewCell.swift
//  PracticeTableView
//
//  Created by 쩡화니 on 1/9/24.
//  Copyright © 2024 com.jeonghi. All rights reserved.
//

import UIKit

class PopularCityCollectionViewCell: UICollectionViewCell {
  @IBOutlet var cityImage: UIImageView!
  @IBOutlet var titleLabel: UILabel!
  @IBOutlet var subTitleLabel: UILabel!
}

extension PopularCityCollectionViewCell {
  
  override func layoutSubviews() {
    super.layoutSubviews()
    configUI()
  }
  
  /// 직접 호출하는 것은 최대한 지양 - 애플 공식문서
  override func draw(_ rect: CGRect) {
    /*
     configUI()
     */
  }
  
  func configUI() {
    self.cityImage.clipsToBounds = true
    self.cityImage.layer.cornerRadius = self.cityImage.bounds.width/2
  }
}
