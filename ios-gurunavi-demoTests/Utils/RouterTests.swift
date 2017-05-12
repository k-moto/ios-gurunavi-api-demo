//
//  RouterTests.swift
//  ios-gurunavi-demo
//
//  Created by Eiji Kushida on 2017/05/12.
//  Copyright © 2017年 Eiji Kushida. All rights reserved.
//

import XCTest
@testable import ios_gurunavi_demo

class RouterTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    /// HTTP Methodが正しいか？
    /// check : GET
    func testRouterHTTPMethodGet() {

        let router = Router.gourmetSearch(
            RestSearchParamsBuilder.create(areaCode: "1234",
                                           offset: 1)
        )

        let request = try! router.asURLRequest()
        XCTAssertEqual(request.httpMethod!, "GET")
    }

    /// Host名が正しいか？
    /// check : api.gnavi.co.jp
    func testRouterHostGurunavi() {

        let router = Router.gourmetSearch(
            RestSearchParamsBuilder.create(areaCode: "1234",
                                           offset: 1)
        )

        let request = try! router.asURLRequest()
        XCTAssertEqual(request.url?.host, "api.gnavi.co.jp")
    }

    /// リクエストのクエリが正しいか？
    func testRouterQuery() {

        let router = Router.gourmetSearch(
            RestSearchParamsBuilder.create(areaCode: "1234",
                                           offset: 1)
        )

        let request = try! router.asURLRequest()
        let querys = request.url?.query?.components(separatedBy: "&")

        if let areacode = (querys?.contains("areacode_l=1234")) {
            XCTAssertTrue(areacode)
        }

        if let json = (querys?.contains("format=json")) {
            XCTAssertTrue(json)
        }

        if let hitPerPage = (querys?.contains("hit_per_page=50")) {
            XCTAssertTrue(hitPerPage)
        }

        if let offset_page = (querys?.contains("offset_page=1")) {
            XCTAssertTrue(offset_page)
        }
    }
}
