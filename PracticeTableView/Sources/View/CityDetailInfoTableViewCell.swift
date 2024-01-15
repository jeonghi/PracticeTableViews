//
//  CityDetailInfoTableViewCell.swift
//  PracticeTableView
//
//  Created by 쩡화니 on 1/11/24.
//  Copyright © 2024 com.jeonghi. All rights reserved.
//

import UIKit
import Cosmos
import Kingfisher

class CityDetailInfoTableViewCell: UITableViewCell {
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
  @IBOutlet weak var reviewCountLabel: UILabel!
  @IBOutlet weak var cityImageView: UIImageView!
  @IBOutlet weak var favoriteButton: UIButton!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    configUI()
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
}

extension CityDetailInfoTableViewCell: UITableViewCellBaseConfiguration {
  
  func configUI() {
    titleLabel.font = .systemFont(ofSize: 20, weight: .bold)
    titleLabel.textColor = .black
    
    descriptionLabel.font = .systemFont(ofSize: 14, weight: .light)
    descriptionLabel.textColor = .darkGray
    
    reviewCountLabel.font = .systemFont(ofSize: 12, weight: .regular)
    reviewCountLabel.textColor = .lightGray
  }
  
  func updateUI(_ model: Travel){
    titleLabel.text = model.title
    descriptionLabel.text = model.description
//    ratingView.rating = model.grade ?? 0
    reviewCountLabel.text = String(model.save ?? 0)
    cityImageView.kf.setImage(with: model.travel_image)
    cityImageView.layer.cornerRadius = 6
    cityImageView.layer.masksToBounds = true
    
    favoriteButton.imageView?.contentMode = .scaleAspectFit
    favoriteButton.tintColor = .white
    favoriteButton.setImage(model.like ?? false ? .heartFilled : .heart, for: .normal)
    favoriteButton.translatesAutoresizingMaskIntoConstraints = false
  }
}

extension CityDetailInfoTableViewCell: UITableViewCellIdentifiable {}
