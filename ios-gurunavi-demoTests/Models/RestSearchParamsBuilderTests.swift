//
//  RestSearchParamsBuilderTests.swift
//  ios-gurunavi-demo
//
//  Created by Eiji Kushida on 2017/03/18.
//  Copyright © 2017年 Eiji Kushida. All rights reserved.
//

import XCTest
@testable import ios_gurunavi_demo

class RestSearchParamsBuilderTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    /// ページングの件数を確認する
    /// check : perPage = 50
    func testPerPage() {
        XCTAssertEqual(RestSearchParamsBuilder.perPage, 50)
    }
    
    /// リクエストパラメタを確認する
    /// check : areaCode = 1234
    func testParamsAreaCode1234() {
        
        let builder = RestSearchParamsBuilder.create(areaCode: "1234")
        
        XCTAssertEqual(builder["areacode_l"] as! String, "1234")
        XCTAssertEqual(builder["offset_page"] as! String, "1")
        XCTAssertEqual(builder["hit_per_page"] as! String, "50")
        XCTAssertEqual(builder["format"] as! String, "json")
    }
    
    /// リクエストパラメタを確認する
    /// check : areaCode = 1234
    func testParamsAreaCode1234AndOffsetPage2() {
        
        let builder = RestSearchParamsBuilder.create(areaCode: "1234",
                                                     offset: 2)
        
        XCTAssertEqual(builder["areacode_l"] as! String, "1234")
        XCTAssertEqual(builder["offset_page"] as! String, "2")
        XCTAssertEqual(builder["hit_per_page"] as! String, "50")
        XCTAssertEqual(builder["format"] as! String, "json")
    }
}
