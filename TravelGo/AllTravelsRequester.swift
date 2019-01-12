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
    
    static func getMeetingsList() {
        let urlString = "http://russian-friends.com/meetings-list?lat=0&lng=0&r=100000000"
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            print(String(data: data, encoding: .utf8)!)
        }
        task.resume()
    }
}
