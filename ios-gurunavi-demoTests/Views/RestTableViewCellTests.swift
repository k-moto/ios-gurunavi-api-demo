//
//  RestTableViewCellTests.swift
//  ios-gurunavi-demo
//
//  Created by Eiji Kushida on 2017/05/12.
//  Copyright © 2017年 Eiji Kushida. All rights reserved.
//

import XCTest
@testable import ios_gurunavi_demo

class RestTableViewCellTests: XCTestCase {

    var tableView: UITableView!
    let dataSource = FakeDataSource()
    var cell: RestTableViewCell!
    let rest = MocRestList().feachTestData()

    override func setUp() {
        super.setUp()

        let storyboard = UIStoryboard(name: "RestListViewController", bundle: nil)
        let controller = storyboard
            .instantiateViewController(
                withIdentifier: "RestListViewController")
            as! RestListViewController

        _ = controller.view

        tableView = controller.tableView
        tableView?.dataSource = dataSource

        cell = tableView?.dequeueReusableCell(
            withIdentifier: "RestTableViewCell",
            for: IndexPath(row: 0, section: 0)) as! RestTableViewCell

    }
    
    override func tearDown() {
        super.tearDown()
    }

    /// 駅から徒歩何分か？
    func testSetStationNameLabel() {

        cell.item = rest
        XCTAssertEqual(cell.stationNameLabel.text!, "池袋駅 3分")
    }

    /// 予算は？
    func testSetBudgetNameLabel() {

        cell.item = rest
        XCTAssertEqual(cell.budgetLabel.text!, "¥2,980")
    }
}

extension RestTableViewCellTests {

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
