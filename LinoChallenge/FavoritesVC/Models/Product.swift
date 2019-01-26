//
//  Product.swift
//  LinoChallenge
//
//  Created by Alberto Gonzalez on 1/25/19.
//  Copyright © 2019 Alberto Josue Gonzalez Juarez. All rights reserved.
//

import Foundation
import ObjectMapper

class Product: Mappable {
    var id = Int()
    var name = String()
    var wishListPrice = Int()
    var slug = String()
    var url = String()
    var image = String()
    var linioPlusLevel = Int()
    var conditionType = String()
    var freeShipping = Bool()
    var imported = Bool()
    var active = Bool()
    
    init() { }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        wishListPrice <- map["wishListPrice"]
        slug <- map["slug"]
        url <- map["url"]
        image <- map["image"]
        linioPlusLevel <- map["linioPlusLevel"]
        conditionType <- map["conditionType"]
        freeShipping <- map["freeShipping"]
        imported <- map["imported"]
        active <- map["active"]
    }
}
