//
//  AreaFilter.swift
//  ios-gurunavi-demo
//
//  Created by Eiji Kushida on 2017/03/17.
//  Copyright © 2017年 Eiji Kushida. All rights reserved.
//

import ObjectMapper

protocol AreaFilterLoadable: class {
    func complated(areas: [Area])
}

final class AreaFilter {

    weak var loadable: AreaFilterLoadable?
    var gareaLarge: [Area] = []
    
    /// 該当エリアの一覧を取得する
    ///
    /// - Parameter prefName: 都道府県名
    /// - Returns: 都道府県情報一覧
    func findArea(prefName: String) {
        
        let area = Bundle.loadJson(fileName: "area")
        
        if let result = Mapper<GAreaLarge>().map(JSONString: area) {
            gareaLarge = result.gareaLarge!
        }
        
        let areas = gareaLarge.filter { (area: Area) -> Bool in
            area.pref?.prefName == prefName
        }        
        loadable?.complated(areas: areas)
    }
}
