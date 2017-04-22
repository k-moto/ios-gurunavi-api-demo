//
//  AreaFilterTests.swift
//  ios-gurunavi-demo
//
//  Created by Eiji Kushida on 2017/03/18.
//  Copyright © 2017年 Eiji Kushida. All rights reserved.
//

import XCTest
@testable import ios_gurunavi_demo

class AreaFilterTests: XCTestCase {

    let areasFilter = AreaFilter()
    let loadable = SpyAreaFilterLoadable()
    
    override func setUp() {
        super.setUp()
        areasFilter.loadable = loadable
    }
    
    override func tearDown() {
        super.tearDown()
        areasFilter.loadable = nil
    }
    
    /// 東京都の一覧を取得する
    /// check : prefName = 東京都
    func testFilterTokyo() {

        let exp = expectation(description: "東京都の一覧を検索するときのテスト")
        loadable.asyncExpectation = exp
        areasFilter.findArea(prefName: "東京都")

        waitForExpectations(timeout: 1) { error in
            if let error = error {
                XCTFail("waitForExpectationsエラー: \(error)")
            }

            XCTAssertTrue(self.loadable.areas.count > 0)
            XCTAssertEqual(self.loadable.areas.first?.pref?.prefName, "東京都")
        }
    }
}
