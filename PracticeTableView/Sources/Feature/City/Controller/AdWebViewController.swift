//
//  AdWebViewController.swift
//  PracticeTableView
//
//  Created by 쩡화니 on 1/15/24.
//  Copyright © 2024 com.jeonghi. All rights reserved.
//

import UIKit

class AdWebViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configUI()
  }
}

extension AdWebViewController {
  func configUI(){
    self.navigationItem.rightBarButtonItem = .init(title: "닫기", style: .plain, target: nil, action: #selector (tappedCloseModalButton))
  }
  
  @objc func tappedCloseModalButton(_ sender: UIBarButtonItem){
    self.dismiss(animated: true)
  }
}
