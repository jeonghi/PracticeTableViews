//
//  PopularCityViewController.swift
//  PracticeTableView
//
//  Created by 쩡화니 on 1/9/24.
//  Copyright © 2024 com.jeonghi. All rights reserved.
//

import UIKit

class PopularCityViewController: UIViewController {
  
  let cellFileName = String(describing: PopularCityCollectionViewCell.self)
  var selectedTab: Tab = .모두
  var cityList: [City] {
    switch selectedTab {
    case .모두:
      return UserDefaultManager.popularCityList
    case .국내:
      return UserDefaultManager.popularCityList.filter({$0.domestic_travel})
    case .해외:
      return UserDefaultManager.popularCityList.filter({!$0.domestic_travel})
    }
  }
  
  // MARK: IBOutlet
  @IBOutlet var tab: UISegmentedControl!
  @IBOutlet var cityCollectionView: UICollectionView!
  
  // MARK: IBAction
  @IBAction func selectSegment(_ tab: UISegmentedControl){
    guard let selectedTab = Tab(tab.selectedSegmentIndex) else {
      return
    }
    self.selectedTab = selectedTab
    updateCollectionView() // 뷰 업데이트
  }
}

// MARK: View Lify cycle
extension PopularCityViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    
    print("\(#function) \(cityCollectionView.frame.width)")
    
    // 셀 등록
    registerNib()
    
    // 델리게이트 연결
    connectDelegate()
    
    // 레이아웃 설정
    configLayout()
  }
  
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    print(#function)
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    print(#function)
    self.view.layoutIfNeeded()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    print(#function)
  }
  
  override func viewWillAppear(_ animated: Bool) {
    print(#function)
  }
}

extension PopularCityViewController: UICollectionViewDelegate {}

extension PopularCityViewController: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    cityList.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    guard let cell = cityCollectionView.dequeueReusableCell(withReuseIdentifier: cellFileName, for: indexPath) as? PopularCityCollectionViewCell, let city = cityList[safe: indexPath.item] else {
      return .init()
    }
    
    // 이미지
    cell.cityImage.kf.setImage(with: city.city_image)
    cell.titleLabel.text = "\(city.city_name) | \(city.city_english_name)"
    cell.titleLabel.font = .systemFont(ofSize: 11, weight: .bold)
    
    cell.subTitleLabel.text = city.city_explain
    cell.subTitleLabel.font = .systemFont(ofSize: 9, weight: .regular)
    
    // 메인 쓰레드에서 마지막에 실행 (바로 반영됨)
//    DispatchQueue.main.async {
//      cell.cityImage.layer.cornerRadius = 0.5
//    }
    
    return cell
  }
}

extension PopularCityViewController {
  
  private func connectDelegate(){
    cityCollectionView.dataSource = self
    cityCollectionView.delegate = self
  }
  
  private func configLayout() {
    // 레이아웃 설정
    let layout = UICollectionViewFlowLayout()
    
    let cellSpacing: CGFloat = 20
    let cellWidth: CGFloat = UIScreen.main.bounds.width / 3 - cellSpacing/2
    let cellHeight: CGFloat = cellWidth / 3 * 4
    
    layout.itemSize = .init(width: cellWidth, height: cellHeight)
    layout.sectionInset = .init(top: 5, left: 5, bottom: 5, right: 5)
    layout.minimumLineSpacing = cellSpacing
    layout.minimumInteritemSpacing = cellSpacing
    layout.scrollDirection = .vertical // 수직 스크롤
    
    cityCollectionView.collectionViewLayout = layout // 레이아웃 설정
  }
  
  private func registerNib(){
    let xib = UINib(nibName: cellFileName, bundle: nil)
    cityCollectionView.register(xib, forCellWithReuseIdentifier: cellFileName)
  }
  
  private func updateCollectionView(){
    cityCollectionView.reloadData()
  }
}

extension PopularCityViewController {
  enum Tab: String {
    case 모두
    case 국내
    case 해외
    
    init?(_ rawValue: Int) {
      switch rawValue {
      case 0:
        self = .모두
      case 1:
        self = .국내
      case 2:
        self = .해외
      default:
        return nil
      }
    }
  }
}
