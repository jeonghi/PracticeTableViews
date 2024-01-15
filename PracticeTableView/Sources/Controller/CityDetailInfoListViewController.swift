//
//  CityDetailInfoViewController.swift
//  PracticeTableView
//
//  Created by 쩡화니 on 1/11/24.
//  Copyright © 2024 com.jeonghi. All rights reserved.
//

import UIKit

class CityDetailInfoListViewController: UIViewController {
  
  @IBOutlet weak var cityDetailInfoTableView: UITableView!
  
  // 연산 프로퍼티
  // 데이터를 가공!
  // 메모리를 차지하지 않음.
  // 공간을 차지하지 않으므로 초기화를 할 필요가 없음.
  // 다른 저장 프로퍼티의 값을 가지고 연산을 하기 때문에 저장 프로퍼티가 필요
  // 연산한 값을 간접적으로 제공한다!
  
  var travelInfoList = UserDefaultManager.travelInfoList
  
  override func viewDidLoad() {
    super.viewDidLoad()
    connectDelegate()
    configUI()
    self.navigationItem.title = "도시 상세 정보"
//    cityDetailInfoTableView.rowHeight = UITableView.automaticDimension
//    cityDetailInfoTableView.estimatedRowHeight = 120
  }
  
  @objc func tappedFavoriteButton(_ sender: UIButton){
    
    guard let _ = travelInfoList[sender.tag].like?.toggle() else{
      return
    }
    
    UserDefaultManager.travelInfoList = travelInfoList
    self.cityDetailInfoTableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .automatic)
  }
}

extension CityDetailInfoListViewController: UIViewControllerBaseConfiguration {
  func configUI() {
    
  }
}

extension CityDetailInfoListViewController: UITableViewDelegate, UITableViewDataSource {
  
  func connectDelegate(){
    cityDetailInfoTableView.delegate = self
    cityDetailInfoTableView.dataSource = self
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return travelInfoList.count
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    let idx = indexPath.row
    
    guard let travel: Travel = travelInfoList[safe: idx] else {
      return
    }
    
    /// 광고라면, WebView 띄우기
    if(travel.ad){
      let sb = UIStoryboard(name: AdWebViewController.id, bundle: nil)
      let vc = sb.instantiateViewController(identifier: AdWebViewController.id)
      vc.modalPresentationStyle = .fullScreen
      self.present(vc, animated: true)
    }else { /// 광고가 아니라면, 일반 뷰컨 띄우기
      let sb = UIStoryboard(name: CityDetailViewController.id, bundle: nil)
      let vc = sb.instantiateViewController(identifier: CityDetailViewController.id)
      navigationController?.pushViewController(vc, animated: true)
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let idx = indexPath.row
    
    guard let travel: Travel = travelInfoList[safe: idx] else {
      return .init()
    }
    
    if(travel.ad){
      tableView.register(UINib(nibName: AdTableViewCell.id, bundle: nil), forCellReuseIdentifier: AdTableViewCell.id)
      let cell = tableView.dequeueReusableCell(for: indexPath) as AdTableViewCell
      cell.updateUI(travel)
      return cell
    }else{
      tableView.register(UINib(nibName: CityDetailInfoTableViewCell.id, bundle: nil), forCellReuseIdentifier: CityDetailInfoTableViewCell.id)
      let cell = tableView.dequeueReusableCell(for: indexPath) as CityDetailInfoTableViewCell
      cell.favoriteButton.addTarget(self, action: #selector(tappedFavoriteButton), for: .touchUpInside)
      cell.favoriteButton.tag = idx
      cell.updateUI(travel)
      return cell
    }
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    120
  }
}
