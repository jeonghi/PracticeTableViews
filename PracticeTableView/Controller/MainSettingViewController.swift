//
//  MainSettingViewController.swift
//  PracticeTableView
//
//  Created by 쩡화니 on 1/7/24.
//

import UIKit

class MainSettingViewController: UIViewController {
  
  @IBOutlet var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = self // 셀과 테이블 간 동작에 대한 부분
    tableView.dataSource = self // 데이터를 이용한 셀 구성에 관한 설정
  }
}

// MARK: 델리게이트 설정
extension MainSettingViewController: UITableViewDelegate {
}

// MARK: 데이터 소스 설정 - cell 정의
extension MainSettingViewController: UITableViewDataSource {
  
  /// 섹션 갯수 지정
  func numberOfSections(in tableView: UITableView) -> Int {
    Section.allCases.count
  }
  
  /// 섹션 별 셀 갯수 지정
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    Section(section)?.numberOfRows ?? 0
  }
  
  /// 섹션 헤더 타이틀 설정
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    Section(section)?.rawValue
  }
  
  /// 각 셀 설정
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainSettingCell") as? MainSettingTableViewCell else {
      return .init()
    }
    
    cell.title.text = Section.cellLabel(forSection: indexPath.section, forRow: indexPath.row)

    return cell
  }
}


// MARK: 섹션 열거형 정의
extension MainSettingViewController {
  
  private enum Section: String, CaseIterable {
    
    case 전체설정
    case 개인설정
    case 기타
    
    /// 생성자
    init?(_ section: Int) {
      switch section {
      case 0:
        self = .전체설정
      case 1:
        self = .개인설정
      case 2:
        self = .기타
      default:
        return nil
      }
    }
    
    /// 섹션별 행 갯수
    var numberOfRows: Int {
      switch self {
      case .전체설정:
        return _전체설정.allCases.count
      case .개인설정:
        return _개인설정.allCases.count
      case .기타:
        return _기타.allCases.count
      }
    }
    
    enum _전체설정: String, CaseIterable {
      case 공지사항
      case 실험실
      case 버전정보 = "버전 정보"
    }
    
    enum _개인설정: String, CaseIterable {
      case 개인및보안 = "개인/보안"
      case 알림
      case 채팅
      case 멀티프로필
    }
    
    enum _기타: String, CaseIterable {
      case 고객센터및도움말 = "고객센터/도움말"
    }
    
    func cellLabel(forRow row: Int) -> String? {
      switch self {
      case .전체설정:
        return _전체설정.label(forRow: row)
      case .개인설정:
        return _개인설정.label(forRow: row)
      case .기타:
        return _기타.label(forRow: row)
      }
    }
    
    static func cellLabel(forSection section: Int, forRow row: Int) -> String? {
      Self(section)?.cellLabel(forRow: row)
    }
  }
}
