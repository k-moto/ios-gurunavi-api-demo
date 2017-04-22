//
//  Env.swift
//  ios-gurunavi-demo
//
//  Created by Eiji Kushida on 2017/03/23.
//  Copyright © 2017年 Eiji Kushida. All rights reserved.
//

import Foundation
import Keys

struct Env {
    
    /// APIキーを.envから取得する
    ///
    /// - Returns: APIキー
    static func apiKey() -> String {
        return IosGurunaviDemoKeys().keyid
    }    
}
