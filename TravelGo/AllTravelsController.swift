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
        // #warning Incomplete implementation, return the number of sections
        return 1
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "TravelerBriefViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? TravelerBriefViewCell  else {
            fatalError("The dequeued cell is not an instance of " + cellIdentifier)
        }
        
        let testText = String(AllTravelsRequester.getParams.ageFrom) + " to " +
        String(AllTravelsRequester.getParams.ageTo) + " query=" + AllTravelsRequester.getParams.query +
        " INDEX=" + String(indexPath.row)
        
        cell.briefInfo.text = testText
        cell.ava.image =  UIImage(named: "defaultAvatar")
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

