//
//  RestSearchParamsBuilder.swift
//  ios-gurunavi-demo
//
//  Created by Eiji Kushida on 2017/03/17.
//  Copyright © 2017年 Eiji Kushida. All rights reserved.
//

import Foundation

final class RestSearchParamsBuilder {
    
    static let perPage = 50
        
    /// レストラン検索APIのリクエストパラメタを作成する
    ///
    /// - Parameters:
    ///   - areaCode: エリアコード
    ///   - offset: 検索開始位置
    /// - Returns: リクエストパラメタ（Dictonary）
    static func create(areaCode: String,
                       offset: Int = 1) -> [String: Any] {
                
        let params = [
            "keyid": Env.apiKey(),
            "areacode_l": areaCode,
            "format": "json",
            "hit_per_page": "\(perPage)",
            "offset_page": "\(offset)"
        ]
        return params
    }
}
