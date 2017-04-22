//
//  AreaTableViewProvider.swift
//  ios-gurunavi-demo
//
//  Created by Eiji Kushida on 2017/03/17.
//  Copyright © 2017年 Eiji Kushida. All rights reserved.
//

import UIKit

final class AreaTableViewProvider: NSObject {
    fileprivate var areas: [Area] = []
    
    /// エリア一覧を登録する
    ///
    /// - Parameter areas: エリア一覧
    func add(areas: [Area]) {
        self.areas = areas
    }
        
    /// エリア情報を取得する
    ///
    /// - Parameter row: TableViewの行番号
    /// - Returns: エリア情報
    func findArea(row: Int) -> Area {
        return areas[row]
    }
}

//MARK : -UITableViewDataSource
extension AreaTableViewProvider: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return areas.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle,
                                                    reuseIdentifier: "Cell")
        
        cell.textLabel?.text = areas[indexPath.row].areanameL
        return cell
    }
}
