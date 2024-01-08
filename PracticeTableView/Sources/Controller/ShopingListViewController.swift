//
//  ShopingListViewController.swift
//  PracticeTableView
//
//  Created by 쩡화니 on 1/7/24.
//

import UIKit

class ShopingListViewController: UIViewController {
  
  // MARK: IBOutlet
  @IBOutlet var tableView: UITableView!
  @IBOutlet var textField: UITextField!
  @IBOutlet weak var addButton: UIButton!
  
  var shoppingWishList: [ShoppingWish] {
    UserDefaultManager.shoppingWishDict.values.sorted(by: {$0.createdAt > $1.createdAt})
  }
  
  // MARK: View Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    self.tableView.dataSource = self
    self.tableView.delegate = self
  }
  
  // MARK: IBAction
  @IBAction func tappedAddButton(_ sender: UIButton) {
    guard let inputText = textField.text else {
      return
    }
    let newShoppingWish = ShoppingWish(content: inputText)
    UserDefaultManager.shoppingWishDict[newShoppingWish.id] = newShoppingWish
    
    textField.text = ""
    reloadTable()
  }
  
  @IBAction func tappedAroundView(_ sender: Any) {
    self.textField.endEditing(true)
  }
  
  func reloadTable(){
    self.tableView.reloadData()
  }
}

extension ShopingListViewController {
  
  func configUI(){
    configButtonUI()
  }
  
  func configButtonUI(){
    addButton.layer.cornerRadius = 6
    addButton.titleLabel?.textColor = .black
  }
}

extension ShopingListViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    shoppingWishList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "shoppingListTableViewCell", for: indexPath) as? ShoppingListTableViewCell, let currShoppingWish = shoppingWishList[safe: indexPath.row] else {
      return .init()
    }
    
    // 모델 상태에 따라 이미지 바뀌도록 변경필요
    cell.leadingButton.setImage(.checkmark, for: .normal)
    cell.trailingButton.setImage(.checkmark, for: .normal)
    cell.titleTextField.text = currShoppingWish.content
    
    // 선택됐을때 별도 스타일 지정 안함
    cell.selectionStyle = .none
    cell.backgroundView?.backgroundColor = .lightGray
    
    // 셀의 엑션 지정c
    return cell
  }
}

extension ShopingListViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
    return .none
  }
}

extension ShopingListViewController {
  
}
