//
//  owner.swift
//  LinoChallenge
//
//  Created by Alberto Gonzalez on 1/25/19.
//  Copyright © 2019 Alberto Josue Gonzalez Juarez. All rights reserved.
//

import Foundation
import ObjectMapper
class Owner: Mappable {
    var name = String()
    var email = String()
    var linioID = String()
    
    init() { }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        email <- map["email"]
        linioID <- map["linioID"]
    }
}
