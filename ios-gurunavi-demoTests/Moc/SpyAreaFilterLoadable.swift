//
//  SpyAreaFilterLoadable.swift
//  ios-gurunavi-demo
//
//  Created by Eiji Kushida on 2017/04/22.
//  Copyright © 2017年 Eiji Kushida. All rights reserved.
//

import XCTest
@testable import ios_gurunavi_demo

final class SpyAreaFilterLoadable: AreaFilterLoadable {

    var areas: [Area] = []
    var asyncExpectation: XCTestExpectation?

    func complated(areas: [Area]) {

        guard let expectation = asyncExpectation else {
            XCTFail("AreaFilterLoadableが正しく設定されていない")
            return
        }

        self.areas = areas
        expectation.fulfill()
    }
}
