//
//  ShoppingListTableViewCell.swift
//  PracticeTableView
//
//  Created by 쩡화니 on 1/7/24.
//

import UIKit

class ShoppingListTableViewCell: UITableViewCell {
  
  // 모르겠숴요....
  // 어떻게 분리시킬지
  // 고민을 좀 더 해보는걸로
  var model: ShoppingWish?
  
  // MARK: IBOutlet
  @IBOutlet var leadingButton: UIButton!
  @IBOutlet var titleTextField: UITextField!
  @IBOutlet var trailingButton: UIButton!
  
  // MARK: Life cycle
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  // MARK: IBAction
  @IBAction func tappedLeadingButton(){
    model?.isChecked.toggle()
        
    if let model {
      UserDefaultManager.shoppingWishDict[model.id] = model
    }
    
    updateUI()
  }
  
  @IBAction func tappedTrailingButton(){
    model?.isFavorite.toggle()
    if let model {
      UserDefaultManager.shoppingWishDict[model.id] = model
    }
    updateUI()
  }
  
  func updateUI(){
    guard let model else { return }
    leadingButton.setImage(model.isChecked ? .checkmarkFilled : .checkmark , for: .normal)
    trailingButton.setImage(model.isFavorite ? .starFilled : .star , for: .normal)
    titleTextField.text = model.content
  }
}

extension UIImage {
  static let starFilled = UIImage(systemName: "star.fill")
  static let star = UIImage(systemName: "star")
  static let checkmarkFilled = UIImage(systemName: "checkmark.square.fill")
  static let checkmark = UIImage(systemName: "checkmark.square")
}
