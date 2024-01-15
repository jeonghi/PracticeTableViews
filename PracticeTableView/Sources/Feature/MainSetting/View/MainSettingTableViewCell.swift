//
//  MainSettingTableViewCell.swift
//  PracticeTableView
//
//  Created by 쩡화니 on 1/7/24.
//

import UIKit

class MainSettingTableViewCell: UITableViewCell {
  
  @IBOutlet var title: UILabel!
  
  /* 
   xib 파일을 생성하든 안하든 실행함.
  스토리보드를 이용할 경우 사용함.
   재사용 메커니즘과 관련이..?
  */
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
}
