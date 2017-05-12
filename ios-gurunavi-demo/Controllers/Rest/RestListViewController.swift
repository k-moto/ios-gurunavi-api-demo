//
//  RestListViewController.swift
//  ios-gurunavi-demo
//
//  Created by Eiji Kushida on 2017/03/17.
//  Copyright © 2017年 Eiji Kushida. All rights reserved.
//

import STV_Extensions
import UIKit

final class RestListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet fileprivate weak var indicatorView: UIActivityIndicatorView!
    @IBOutlet var continueFooter: RestTableFooter!
    fileprivate let api = RestSearchAPI()
    fileprivate let provider = RestTableViewProvider()
    fileprivate let pageManager = RestPageManager.sharedInstance
    fileprivate var lastAreaCode = ""
    fileprivate var area: Area?
    
    //MARK : - Factorys
    class func create(area: Area) -> RestListViewController {
        
        if let vc = UIStoryboard
            .viewController(storyboardName: RestListViewController.className,
                            identifier: RestListViewController.className) as? RestListViewController {
            vc.area = area
            return vc
        }
        fatalError("unwap RestListViewController")
    }
    
    //MARK : - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
        if let area = self.area {
            loadRest(areaCode: area.areacodeL)
        }
    }
    
    /// 初期化
    private func setup() {
        tableView.dataSource = provider
        tableView.delegate = self
        indicatorView.isHidden = true
        renderTitle()
    }
    
    /// エリア名を表示する
    private func renderTitle() {
        
        if let area = self.area {
            self.title = String(format: "REST_TITLE".localized(),
            area.areanameL)
        }
    }
    
    /// レストラン情報を取得する
    ///
    /// - Parameter areaCode: エリアコード
    private func loadRest(areaCode: String) {        
        pageManager.reset()
        api.loadable = self
        api.fetch(areaCode: areaCode)
        lastAreaCode = areaCode
    }
}

//MARK : -RestSearchLoadable
extension RestListViewController: RestSearchLoadable {
    
    /// レストラン検索APIの結果を設定する
    ///
    /// - Parameter result: レストラン検索結果
    func setResult(result: RestSearchStatus) {
        
        switch result {            
        case .loading:
            loading()

        case .loaded(let result):
            loaded(result: result)

        case .offline:
            //TODOs : オフライン
            break
        case .error(let message) :
            fatalError(message.description)
        }
    }
    
    /// ローディング中の処理
    private func loading() {
        showIndicatorView()
    }
    
    /// ロード完了時の処理
    ///
    /// - Parameter result: レストラン検索結果
    private func loaded(result: RestResponse) {
        
        hideIndicatorView()
        provider.add(rests: result.rest)
        updateTitle(count: Int(result.totalHitCount)!)
        pageManager.setTotal(hitPerPage: Int(result.hitPerPage)!)        
        tableView.reloadData()
    }
    
    /// インジケーターを表示する
    private func showIndicatorView() {
        indicatorView.isHidden = false
        indicatorView.startAnimating()
    }
    
    /// インジケーターを消す
    private func hideIndicatorView() {
        
        indicatorView.isHidden = true
        
        if indicatorView.isAnimating {
            indicatorView.stopAnimating()
        }
    }
    
    /// エリア名とヒット件数を表示する
    ///
    /// - Parameter count: ヒット件数
    private func updateTitle(count: Int) {
        
        if let area = self.area {
            self.title = String(format: "REST_COUNT".localized(),
                                 area.areanameL,
                                 count.decimalStr)
        }
    }
}

//MARK : -UITableViewDelegate
extension RestListViewController: UITableViewDelegate {}

//MARK : -UIScrollViewDelegate
extension RestListViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
     
        guard tableView.isScrollEnd() && !indicatorView.isAnimating else {
            return
        }
        
        switch pageManager.next() {
        case .next(let offset):
            next(offset: offset)
        case .end:
            end()
        }
    }
    
    /// 次のページを読み出す
    ///
    /// - Parameter offset: オフセット
    private func next(offset: Int) {
        tableView.tableFooterView = continueFooter
        continueFooter.start()
        api.fetch(areaCode: lastAreaCode, offset: offset)
    }
    
    /// 最終ページの場合の処理
    private func end() {
        continueFooter.stop()
        tableView.removeTableFooterView()
    }
}
