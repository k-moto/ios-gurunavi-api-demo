//
//  RestPageManagerTests.swift
//  ios-gurunavi-demo
//
//  Created by Eiji Kushida on 2017/03/18.
//  Copyright © 2017年 Eiji Kushida. All rights reserved.
//

import XCTest
@testable import ios_gurunavi_demo

class RestPageManagerTests: XCTestCase {
    
    let manger = RestPageManager.sharedInstance
    
    override func setUp() {
        super.setUp()
        manger.reset()
    }
    
    override func tearDown() {
        super.tearDown()
    }
        
    /// インスタンスがNil以外か確認する
    func testInstanceNotNil() {
        XCTAssertNotNil(RestPageManager.sharedInstance)
    }

    /// プロパティの初期値を確認する
    /// check : hitPerPage = 1
    func testDefaultHitPerPage() {
        XCTAssertEqual(manger.hitPerPage, 1)
    }
    
    /// プロパティの初期値を確認する
    /// check : pageOffset = 1
    func testDefaultPageOffset() {
        XCTAssertEqual(manger.pageOffset, 1)
    }

    /// プロパティの更新を確認する
    /// check : pageOffset = 10
    func testSetTotal() {        let manger = RestPageManager.sharedInstance
        manger.setTotal(hitPerPage: 10)
        
        XCTAssertEqual(manger.hitPerPage, 10)
    }
    
    /// Page番号の管理（ページ数10)
    /// check : pageOffset = 4
    func testNextPageNo() {
        manger.setTotal(hitPerPage: 10)
        
        _ = manger.next()
        _ = manger.next()
        let status = manger.next()
        
        switch status {
        case .next(let pageOffset):
            XCTAssertEqual(pageOffset, 4)
        case .end:
            XCTFail("ページ管理がNG")
        }
    }

    /// Page番号の管理（ページ数3)
    /// check : pageOffset = 3
    func testNextPageNoUpper() {
        manger.setTotal(hitPerPage: 3)
        
        _ = manger.next()
        _ = manger.next()
        let status = manger.next()
        
        switch status {
        case .next(_):
            XCTFail("ページ管理がNG")
        case .end:
            XCTAssertEqual(manger.pageOffset, 4)
        }
    }
}
