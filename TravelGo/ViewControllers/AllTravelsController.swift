//
//  AllTravelsController.swift
//  TravelGo
//
//  Created by Никита on 11/01/2019.
//  Copyright © 2019 Никита. All rights reserved.
//

import Foundation
import UIKit

class AllTravelsController: UITableViewController, UITabBarDelegate {
    var lastRow = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AllTravelsRequester.users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "TravelerBriefViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? TravelerBriefViewCell  else {
            fatalError("The dequeued cell is not an instance of " + cellIdentifier)
        }
        let about = AllTravelsRequester.users[indexPath.row].owner.about
        cell.briefInfo.text = about
        cell.ava.image =  AllTravelsRequester.avas[indexPath.row]
        cell.id = AllTravelsRequester.users[indexPath.row].id
        
        return cell
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "ToOneMeeting"{
//        }
//    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "ToOneMeeting") {
            let uid = AllTravelsRequester.users[lastRow].owner.id
            let user = AllTravelsRequester.getMeeting(id: uid)
            let vc = segue.destination as! OneTripViewController
            vc.user = user
            print("pidor")
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        lastRow = indexPath.row
        performSegue(withIdentifier: "ToOneMeeting", sender: self)
    }

}

