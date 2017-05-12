//
//  MocRestList.swift
//  ios-gurunavi-demo
//
//  Created by Eiji Kushida on 2017/05/12.
//  Copyright © 2017年 Eiji Kushida. All rights reserved.
//

import XCTest
import ObjectMapper
@testable import ios_gurunavi_demo

final class MocRestList {

    func feachTestData() -> Rest{

        let bundle = Bundle(for: type(of: self))
        let path = bundle.path(forResource: "rest", ofType: "json")
        if let path = path {

            let fileHandle = FileHandle(forReadingAtPath: path)
            let jsonData = fileHandle?.readDataToEndOfFile()

            if let jsonData = jsonData {

                let json = String(data: jsonData,
                                  encoding: String.Encoding.utf8)

                if let json = json {

                    if let searchResult = Mapper<Rest>().map(JSONString: json) {
                        return searchResult
                    }
                }
            }
        }
        fatalError("テストデータが読み込めない")
    }
}
