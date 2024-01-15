//
//  SesacWebView.swift
//  PracticeTableView
//
//  Created by 쩡화니 on 1/16/24.
//  Copyright © 2024 com.jeonghi. All rights reserved.
//
import UIKit
import WebKit

class SesacWebViewController: UIViewController {
  
  private var webView: WKWebView? = nil
  var url: URL?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configUI()
    connectToDelegate()
  }
}

extension SesacWebViewController: WKNavigationDelegate {
  
  /// 1. 웹 페이지의 탐색 허용 여부를 결정
//  func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
//    return
//  }
  
  /// 2. 웹 뷰가 콘텐츠 탐색을 시작할 때 호출
  func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
    return
  }
  
  /// 3. 웹 뷰가 콘텐츠를 받기 시작할때 호출
  func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
    return
  }
  
  /// 4. 웹 뷰가 콘텐츠 받기를 완료했을 때 호출
  func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
    return
  }
  
  /// 5. 웹 뷰가 콘텐츠 받기를 실패했을 때 호출
  func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
    return
  }
}

extension SesacWebViewController: WKUIDelegate {}

extension SesacWebViewController: UIViewControllerBaseConfiguration {
  func configUI() {
    /// 웹뷰 화면 크기 설정 (전체)
    let webView: WKWebView = WKWebView.init(frame: .init(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height))
    
    /// 여백 및 배경 부분 색 투명하게 변경
    webView.backgroundColor = .clear
    webView.isOpaque = false
    webView.loadHTMLString("<body style=\"background-color: transparent\">", baseURL: nil)
    
    /// 로딩할 URL 전달
    /// - 캐시 기본 정책 사용, 타임아웃 10초
    
    guard let url else {
      return
    }
    
    let request: URLRequest = .init(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
    
    webView.load(request)
    
    /// 화면에 웹 뷰 추가
    self.webView = webView
    
    guard let wv = self.webView else {
        return
    }
    
    self.view?.addSubview(self.webView!)
    
    return
  }
  func connectToDelegate() {
    self.webView?.uiDelegate = self
    self.webView?.navigationDelegate = self
  }
}
