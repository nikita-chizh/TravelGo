//
//  AllTravelsController.swift
//  TravelGo
//
//  Created by Никита on 11/01/2019.
//  Copyright © 2019 Никита. All rights reserved.
//

import Foundation
import UIKit

class AllTravelsController: UITableViewController {
    
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
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

