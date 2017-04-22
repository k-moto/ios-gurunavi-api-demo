//
//  GAreaLarge.swift
//  ios-gurunavi-demo
//
//  Created by Eiji Kushida on 2017/03/17.
//  Copyright © 2017年 Eiji Kushida. All rights reserved.
//

import ObjectMapper

struct GAreaLarge: Mappable {
    
    var gareaLarge: [Area]?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        gareaLarge <- map["garea_large"]
    }
}

struct Area: Mappable {
    var areacodeL = ""
    var areanameL = ""
    var pref: Pref?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        areacodeL <- map["areacode_l"]
        areanameL <- map["areaname_l"]
        pref <- map["pref"]
    }
}

struct Pref: Mappable {
    var prefCode = ""
    var prefName = ""
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        prefCode <- map["pref_code"]
        prefName <- map["pref_name"]
    }
}
