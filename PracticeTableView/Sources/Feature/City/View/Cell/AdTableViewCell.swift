//
//  AdTableViewCell.swift
//  PracticeTableView
//
//  Created by 쩡화니 on 1/11/24.
//  Copyright © 2024 com.jeonghi. All rights reserved.
//

import UIKit

class AdTableViewCell: UITableViewCell {
  
  @IBOutlet weak var uiView: UIView! // view
  @IBOutlet weak var contentLabel: UILabel! // 콘텐츠 라벨
  @IBOutlet weak var adLabel: UILabel! // AD 태그 라벨
  
  static let backgroundColor: [UIColor] = [.systemPink, .systemBlue, .systemYellow, .systemRed, .systemGreen, .systemPurple]
  
  override func awakeFromNib() {
    super.awakeFromNib()
    DispatchQueue.main.async {
      self.configUI()
    }
  }
  
  func getRandomColor() -> UIColor {
    AdTableViewCell.backgroundColor.randomElement()?.withAlphaComponent(0.5) ?? UIColor.white
  }
}

extension AdTableViewCell: UITableViewCellBaseConfiguration {
  func configUI(){
    // superView
    self.backgroundColor = .clear
    self.selectionStyle = .none
    
    // uiView
    self.uiView.backgroundColor = getRandomColor()
    self.uiView.layer.cornerRadius = 6
    
    // contentLabel
    self.contentLabel.font = .systemFont(ofSize: 14, weight: .bold)
    self.contentLabel.textAlignment = .center
    
    // ad label
    self.adLabel.layoutMargins = .init(top: 5, left: 5, bottom: 5, right: 5)
    self.adLabel.layer.cornerRadius = 6
    self.adLabel.font = .systemFont(ofSize: 9, weight: .medium)
    self.adLabel.backgroundColor = .white
    self.adLabel.textColor = .black
  }
  
  func updateUI(_ model: Travel) {
    contentLabel.text = model.title
  }
}

extension AdTableViewCell: UITableViewCellIdentifiable {}
