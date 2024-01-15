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
  
  /// 매거진 목록
  var magazineList: [Magazine] {
    UserDefaultManager.magazineInfoList
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configUI()
  }
}

// MARK: 뷰컨 기본설정
extension MagazineTableViewController: UIViewControllerBaseConfiguration {
  func configUI() {
    return
  }
}

// MARK: 테이블 뷰 관련 정의 - 델리게이트 부분
extension MagazineTableViewController {
  
  /// 셀을 선택했을때 호출
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let idx = indexPath.row
    guard let magazine = magazineList[safe: idx], let url = magazine.link else {
      return
    }
    let vc = SesacWebViewController()
    vc.url = url
    self.navigationController?.pushViewController(vc, animated: true)
  }
}

// MARK: 테이블 뷰 관련 정의 - 데이터 소스 부분
extension MagazineTableViewController {
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
