//
//  UserCred.swift
//  TravelGo
//
//  Created by Никита on 14/01/2019.
//  Copyright © 2019 Никита. All rights reserved.
//

import Foundation

class UserCred {
    var social_slug: String = ""
    var external_id: String = ""
    var token: String = ""
    var first_name: String = ""
    
    init(social_slug: String="", external_id: String="", token: String="", first_name: String="") {
        self.social_slug = social_slug
        self.external_id = external_id
        self.token = token
        self.first_name = first_name
    }
}

