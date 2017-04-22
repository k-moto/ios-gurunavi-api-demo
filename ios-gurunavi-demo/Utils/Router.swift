//
//  Router.swift
//  ios-gurunavi-demo
//
//  Created by Eiji Kushida on 2017/03/17.
//  Copyright © 2017年 Eiji Kushida. All rights reserved.
//

import Alamofire

enum Router: URLRequestConvertible {
    
    static let baseURLString = "https://api.gnavi.co.jp/"
    
    case gourmetSearch([String: Any])
        
    /// URLリクエストを作成する
    ///
    /// - Returns: URLリクエスト
    func asURLRequest() throws -> URLRequest {
        
        let (method, path, parameters): (HTTPMethod, String, [String: Any]) = {
            
            switch self {
            case .gourmetSearch(let params):
                return (.get, "RestSearchAPI/20150630/", params)
            }
        }()
        
        let url = URL(string: Router.baseURLString)
        var urlRequest = URLRequest(url: url!.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        return try Alamofire.URLEncoding.default.encode(urlRequest, with: parameters)
    }
}
