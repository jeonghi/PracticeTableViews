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
  var searchText: String?
  var cityList: [City] {
    var result = UserDefaultManager.popularCityList
    if let searchText, !searchText.isEmpty {
      result = result.filter{$0.hasKeyword(searchText)}
    }
    switch selectedTab {
    case .모두:
      return result
    case .국내:
      return result
        .filter({$0.domestic_travel})
    case .해외:
      return result
        .filter({!$0.domestic_travel})
    }
  }
  
  // MARK: IBOutlet
  @IBOutlet var tab: UISegmentedControl!
  @IBOutlet var cityCollectionView: UICollectionView!
  @IBOutlet weak var searchBar: UISearchBar!
  
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
    
    self.navigationItem.title = "인기도시"
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
  
  func showFilteredResult(){
    self.cityCollectionView.reloadData()
  }
}

extension City {
  func hasKeyword(_ word: String) -> Bool {
    
    let uppperedWord = word.uppercased()
    
    return self.city_english_name.uppercased().contains(uppperedWord) || self.city_name.uppercased().contains(uppperedWord) || self.city_explain.uppercased().contains(uppperedWord)
  }
}

extension PopularCityViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
    let id = String(describing: CityDetailInfoListViewController.self)
    
    let sb = UIStoryboard(name: id, bundle: nil)
    
    let vc = sb.instantiateViewController(identifier: id)
    
    let nc = self.navigationController?.pushViewController(vc, animated: true)
  }
}

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

extension PopularCityViewController: UISearchBarDelegate {
  
  /// 검색 버튼 클릭
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    searchText = searchBar.text
    showFilteredResult()
  }
  
  /// 취소 버튼 클릭
  func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    searchBar.text = nil
  }
  
  /// 서치바 텍스트필드 변경 전
  func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
    true
  }
}

extension PopularCityViewController {
  
  private func connectDelegate(){
    cityCollectionView.dataSource = self
    cityCollectionView.delegate = self
    
    searchBar.delegate = self
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
