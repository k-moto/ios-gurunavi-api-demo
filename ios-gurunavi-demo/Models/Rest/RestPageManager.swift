//
//  RestPageManager.swift
//  ios-gurunavi-demo
//
//  Created by Eiji Kushida on 2017/03/17.
//  Copyright © 2017年 Eiji Kushida. All rights reserved.
//

import Foundation

/// レストラン検索APIのページ番号を管理する
///
/// - next: 次のページ
/// - end: 最後のページ
enum RestPageStatus {
    case next(Int)
    case end
}

final class RestPageManager {    
    static let sharedInstance = RestPageManager()
    var hitPerPage = 1
    var pageOffset = 1
    
    private init() { }

    /// ヒット件数を設定する
    ///
    /// - Parameter hitPerPage: ヒット件数
    func setTotal(hitPerPage: Int) {
        self.hitPerPage = hitPerPage
    }
    
    /// 検索開始位置を初期化する
    func reset() {
        pageOffset = 1
    }
    
    /// 次のページ番号を取得する
    ///
    /// - Returns: 次のページ番号 or 最終ページ
    func next() -> RestPageStatus {
        pageOffset += 1
        
        if hitPerPage == 1 {
            return .next(pageOffset)
        }
        return hitPerPage >= pageOffset ? .next(pageOffset) : .end
    }
}
