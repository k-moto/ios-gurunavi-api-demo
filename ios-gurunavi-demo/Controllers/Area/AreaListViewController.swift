//
//  AreaListViewController.swift
//  ios-gurunavi-demo
//
//  Created by Eiji Kushida on 2017/03/17.
//  Copyright © 2017年 Eiji Kushida. All rights reserved.
//

import UIKit

final class AreaListViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    fileprivate let provider = AreaTableViewProvider()
    private let prefName = "東京都"
    private let areaFilter = AreaFilter()
    
    //MARK : - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        loadArea(prefName: prefName)
    }
    
    //MARK : - Privates
    /// 初期化処理
    private func setup() {
        tableView.dataSource = provider
        tableView.delegate = self
        hideBackButtonText()
    }
    
    /// 東京都のエリア情報の取得
    private func loadArea(prefName: String) {
        areaFilter.loadable = self
        areaFilter.findArea(prefName: prefName)
    }
}

//MARK : - UITableViewDelegate
extension AreaListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        transitionRestListViewController(indexPath: indexPath)
    }
    
    /// レストラン一覧画面へ遷移する
    ///
    /// - Parameter indexPath: TableViewの行番号
    private func transitionRestListViewController(indexPath: IndexPath) {
        
        let vc = RestListViewController
            .create(area: provider.findArea(row: indexPath.row))
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - AreaFilterLoadable
extension AreaListViewController: AreaFilterLoadable {

    func complated(areas: [Area]) {
        provider.add(areas: areas)
    }
}
