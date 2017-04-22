//
//  RestResponse.swift
//  ios-gurunavi-demo
//
//  Created by Eiji Kushida on 2017/03/17.
//  Copyright © 2017年 Eiji Kushida. All rights reserved.
//

import ObjectMapper

struct RestResponse: Mappable {
    
    var totalHitCount = ""
    var hitPerPage = ""
    var pageOffset = ""
    var rest: [Rest] = []
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        totalHitCount <- map["total_hit_count"]
        hitPerPage <- map["hit_per_page"]
        pageOffset <- map["page_offset"]
        rest <- map["rest"]
    }
}

struct Rest: Mappable {
    var line = ""
    var station = ""
    var stationExit = ""
    var walk = ""
    var address = ""
    var budget = ""
    var holiday = ""
    var imageUrl = ""
    var name = ""
    var openTime = ""
    var prShort = ""
    var tel = ""
    var url = ""
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        line <- map["access.line"]
        station <- map["access.station"]
        stationExit <- map["access.station_exit"]
        walk <- map["access.walk"]
        address <- map["address"]
        budget <- map["budget"]
        holiday <- map["holiday"]
        imageUrl <- map["image_url.shop_image1"]
        name <- map["name"]
        openTime <- map["opentime"]
        prShort <- map["pr.pr_short"]
        tel <- map["tel"]
        url <- map["url"]
    }
}
