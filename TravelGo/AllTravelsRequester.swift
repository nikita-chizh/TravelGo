//
//  AllTravelsRequester.swift
//  TravelGo
//
//  Created by Никита on 12/01/2019.
//  Copyright © 2019 Никита. All rights reserved.
//

import Foundation

struct GetParams{
    var ageFrom: Int = 0
    var ageTo: Int = 0
    var query: String = ""
    var gender: Int = 0
    init() {
        
    }
}

class AllTravelsRequester{
    static var getParams = GetParams()

}
