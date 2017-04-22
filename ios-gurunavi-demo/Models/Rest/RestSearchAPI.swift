//
//  RestSearchAPI.swift
//  ios-gurunavi-demo
//
//  Created by Eiji Kushida on 2017/03/17.
//  Copyright © 2017年 Eiji Kushida. All rights reserved.
//

import ObjectMapper

/// レストラン検索APIのステータス
///
/// - loading: ロード中
/// - loaded: ロード完了
/// - offline: オフライン
/// - error: APIエラー
enum RestSearchStatus {
    case loading
    case loaded(RestResponse)
    case offline
    case error(message: String)
}

/// レストラン検索API結果を通知するプロトコル
protocol RestSearchLoadable: class {
    func setResult(result: RestSearchStatus)
}

final class RestSearchAPI {

    weak var loadable: RestSearchLoadable?
    
    /// レストラン検索API
    ///
    /// - Parameters:
    ///   - areaCode: エリアコード
    ///   - offset: 検索開始位置
    func fetch(areaCode: String, offset: Int = 1) {
        
        self.loadable?.setResult(result: .loading)
                
        let router = Router.gourmetSearch(
            RestSearchParamsBuilder.create(areaCode: areaCode,
                                           offset: offset)
        )
        
        APIClient().request(router: router) { [weak self] (response) in
            switch response {
            case .success(let result):
                                
                if let result = Mapper<RestResponse>().map(JSONObject: result) {                    
                    self?.loadable?.setResult(result: .loaded(result))
                }
                
            case .failure(let error):
                self?.loadable?.setResult(result: .error(message: error.localizedDescription))
            }
        }
    }
}
