//
//  RestTableViewProvider.swift
//  ios-gurunavi-demo
//
//  Created by Eiji Kushida on 2017/03/17.
//  Copyright © 2017年 Eiji Kushida. All rights reserved.
//

import UIKit

final class RestTableViewProvider: NSObject {
    fileprivate var rests: [Rest] = []
    
    /// レストラン一覧を登録する
    ///
    /// - Parameter rests: レストラン一覧
    func add(rests: [Rest]) {
        
        if rests.isEmpty {
            self.rests = rests
            return
        }
        
        _ = rests.map {
            self.rests.append($0)
        }
    }
    
    /// レストラン情報を取得する
    ///
    /// - Parameter indrowex: TableViewの行番号
    /// - Returns: レストラン情報
    func findRest(row: Int) -> Rest {
        return rests[row]
    }
}

//MARK : - UITableViewDataSource
extension RestTableViewProvider: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return rests.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(
            withIdentifier: RestTableViewCell.className,
            for: indexPath) as? RestTableViewCell
        cell?.item = findRest(row: indexPath.row)
        return cell!
    }
}
