//
//  AreaTableViewCellTests.swift
//  ios-gurunavi-demo
//
//  Created by Eiji Kushida on 2017/05/12.
//  Copyright © 2017年 Eiji Kushida. All rights reserved.
//

import XCTest
@testable import ios_gurunavi_demo

class AreaTableViewCellTests: XCTestCase {

    var tableView: UITableView!
    let dataSource = FakeDataSource()
    var cell: UITableViewCell!

    override func setUp() {
        super.setUp()

        let storyboard = UIStoryboard(name: "AreaListViewController", bundle: nil)
        let controller = storyboard
            .instantiateViewController(
                withIdentifier: "AreaListViewController")
            as! AreaListViewController

        _ = controller.view

        tableView = controller.tableView
        tableView?.dataSource = dataSource

        cell = UITableViewCell(style: UITableViewCellStyle.subtitle,
                                   reuseIdentifier: "Cell")
    }

    override func tearDown() {
        super.tearDown()
    }

    /// エリア名格納用のLabelがnilでない
    func testHasAreaNameLabel() {
        XCTAssertNotNil(cell.textLabel)
    }

    /// エリア名が正しく設定される
    func testSetTableViewAreaNameLabel() {
        cell.textLabel?.text = "あいうえお"
        XCTAssertEqual(cell.textLabel?.text!, "あいうえお")
    }
}

extension AreaTableViewCellTests {

    class FakeDataSource: NSObject, UITableViewDataSource {

        func tableView(_ tableView: UITableView,
                       numberOfRowsInSection section: Int) -> Int {
            return 1
        }

        func tableView(_ tableView: UITableView,
                       cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            return UITableViewCell()
        }
    }
}
