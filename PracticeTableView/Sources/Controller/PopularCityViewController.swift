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
  
  // MARK: Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // 셀 등록
    registerNib()
    
    // 델리게이트 연결
    connectDelegate()
    
    // 레이아웃 설정
    configLayout()
  }
  
  // MARK: IBAction
  @IBAction func selectSegment(_ tab: UISegmentedControl){
    guard let selectedTab = Tab(tab.selectedSegmentIndex) else {
      return
    }
    self.selectedTab = selectedTab
    updateCollectionView() // 뷰 업데이트
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
    
    cell.cityImage.layer.cornerRadius = cell.contentView.bounds.width/2
    
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
    let cellHeight: CGFloat = UIScreen.main.bounds.height / 2
    
    layout.itemSize = .init(width: cellWidth, height: cellHeight)
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
