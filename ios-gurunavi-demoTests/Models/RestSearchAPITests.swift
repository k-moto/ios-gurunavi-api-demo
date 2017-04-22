//
//  RestSearchAPITests.swift
//  ios-gurunavi-demo
//
//  Created by Eiji Kushida on 2017/03/18.
//  Copyright © 2017年 Eiji Kushida. All rights reserved.
//

import XCTest
@testable import ios_gurunavi_demo

class RestSearchAPITests: XCTestCase {
    
    let api = RestSearchAPI()
    let loadable = SpyRestSearchAPILoadable()
    
    override func setUp() {
        super.setUp()
        api.loadable = loadable
    }
    
    override func tearDown() {
        super.tearDown()
        api.loadable = nil
    }
    
    func testSearchAreaCodeAREAL2169() {
        
        let exp = expectation(description: "「AREAL2169」で検索したときのテスト")
        loadable.asyncExpectation = exp
                
        api.fetch(areaCode: "AREAL2169")
        
        waitForExpectations(timeout: 5) { error in
            if let error = error {
                XCTFail("waitForExpectationsエラー: \(error)")
            }
            
            if let result = self.loadable.result {
                
                switch result {
                case .loaded(let result) :
                    XCTAssertNotNil(result)
                    XCTAssertTrue(result.rest.count > 0)
                    XCTAssertEqual(result.pageOffset, "1")
                    
                case .loading: break
                                        
                default:
                    XCTFail("バグです")
                }
            }
        }
    }
}
