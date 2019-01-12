//
//  Models.swift
//  TravelGo
//
//  Created by Никита on 12/01/2019.
//  Copyright © 2019 Никита. All rights reserved.
//

import Foundation

struct TravelGO_Coord: Decodable{
    var lat: Double
    var lng: Double
}

struct TravelGO_Ava: Decodable{
    var src_medium: URL
    var src_small: URL
}

struct TravelGO_User: Decodable {
    var about: String
    var avatar: TravelGO_Ava
    var birth_date: Date?
    var href: URL

}

struct TravelGO_Meeting: Decodable {
    var category: Int
    //var confirms: {}
    var coordinates: TravelGO_Coord
    var description: String
    var group_type: Int
    // var href: URL
    var id: Int
    var meeting_date: Date?
    var owner: TravelGO_User
    var subway: String?
    var title: String
}
