//
//  SpyRestSearchAPILoadable.swift
//  ios-gurunavi-demo
//
//  Created by Eiji Kushida on 2017/03/18.
//  Copyright © 2017年 Eiji Kushida. All rights reserved.
//

import XCTest
@testable import ios_gurunavi_demo

final class SpyRestSearchAPILoadable: RestSearchLoadable {
    
    var result: RestSearchStatus?
    var asyncExpectation: XCTestExpectation?
    
    func setResult(result: RestSearchStatus) {
        
        guard let expectation = asyncExpectation else {
            XCTFail("RestSearchLoadableが正しく設定されていない")
            return
        }
        
        self.result = result
        expectation.fulfill()
    }
}
