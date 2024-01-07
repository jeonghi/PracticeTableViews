//
//  ShopingListViewController.swift
//  PracticeTableView
//
//  Created by 쩡화니 on 1/7/24.
//

import UIKit

class ShopingListViewController: UIViewController {
  @IBOutlet var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.tableView.dataSource = self
    self.tableView.delegate = self
  }
}

extension ShopingListViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    .init()
  }
}

extension ShopingListViewController: UITableViewDelegate {
  
}
