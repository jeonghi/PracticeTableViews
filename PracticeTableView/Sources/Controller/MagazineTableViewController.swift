//
//  MagazineTableViewController.swift
//  PracticeTableView
//
//  Created by 쩡화니 on 1/9/24.
//  Copyright © 2024 com.jeonghi. All rights reserved.
//

import UIKit
import Kingfisher

class MagazineTableViewController: UITableViewController {
  
  var magazineList: [Magazine] {
    UserDefaultManager.magazineInfoList
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return magazineList.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MagazineTableViewCell.self), for: indexPath) as? MagazineTableViewCell, let magazine = magazineList[safe: indexPath.row] else {
      return .init()
    }
    
    cell.photoImage.kf.setImage(with: magazine.photo_image)
    cell.photoImage.layer.cornerRadius = 100
    cell.dateLabel.text = magazine.date?.toString()
    cell.subTitleLabel.text = magazine.subtitle
    cell.titleLabel.text = magazine.title
    
    return cell
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    400
  }
}
