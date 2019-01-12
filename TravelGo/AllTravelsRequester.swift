//
//  AllTravelsRequester.swift
//  TravelGo
//
//  Created by Никита on 12/01/2019.
//  Copyright © 2019 Никита. All rights reserved.
//

import Foundation

struct MeetingsListGetParams{
    var age_from: Int = 18
    var age_to: Int = 100
    var gender: Int = 0
    var lat: Double?
    var lng: Double?
    var r: Double?
    var query: String?
    var category: Int?
    var only_my: Bool? //если параметр присутствует, то отдаются все события пользователя
    var countries: [String]?
    init() {}
}

struct TestStruct: Decodable{
    let id: Int
}

class AllTravelsRequester{
    static var users : [TravelGO_Meeting] = []
    static var getParams = MeetingsListGetParams.init()
    
    static func composeUrl(getparams: MeetingsListGetParams)->URL{
        var urlString = "http://russian-friends.com/meetings-list/?age_from=\(getparams.age_from)&age_to=\(getparams.age_to)&gender=\(getparams.gender)"
        //
        if let lat = getparams.lat {urlString += "&lat=" + String(lat)} else {}
        if let lng = getparams.lng {urlString += "&lng=" + String(lng)} else {}
        if let r = getparams.r {urlString += "&r=" + String(r)} else {}
        if let query = getparams.query, query != ""  {urlString += "&query=" + query} else {}
        if let category = getparams.category {urlString += "&category=" + String(category)} else {}
        if let _ = getparams.only_my {urlString += "&only_my"} else{}
        if let countries = getparams.countries {
            for country in countries{
                urlString += "&country=" + country
            }
        }else{}
        return URL(string: urlString)!
    }
    
    static func getMeetingsList(params: MeetingsListGetParams, completion: @escaping (_ ready: Bool?)->()){
        // URL(fileURLWithPath: "http://russian-friends.com/meetings-list/?age_from=18&age_to=55&gender=0")
        let url = composeUrl(getparams:params)
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            do{
                let decoder = JSONDecoder()
                let dateFormatter = DateFormatter()
                dateFormatter.locale = Locale(identifier: "en_US_POSIX")
                dateFormatter.dateFormat = "yyyy-MM-dd"
                decoder.dateDecodingStrategy = .formatted(dateFormatter)
                AllTravelsRequester.users = try decoder.decode([TravelGO_Meeting].self, from: data)
                let ready = true
                completion(ready)
            }catch let jsonErr{
                print(jsonErr)
            }
        }
        task.resume()
    }
}
