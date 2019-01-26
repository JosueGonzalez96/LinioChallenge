//
//  Collection.swift
//  LinoChallenge
//
//  Created by Alberto Gonzalez on 1/25/19.
//  Copyright © 2019 Alberto Josue Gonzalez Juarez. All rights reserved.
//

import Foundation
import ObjectMapper

class Wishlist: Mappable {
    var id = Int()
    var name = String()
    var description = String()
    var isDefault = Bool()
    var owner = Owner()
    var createdAt = NSDate()
    var visibility = String()
    var products = [String:Product]()
    
    init() { }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        description <- map["description"]
        isDefault <- map["isDefault"]
        owner <- map["owner"]
        createdAt <- map["createdAt"]
        visibility <- map["visibility"]
        products <- map["products"]
    }
}
