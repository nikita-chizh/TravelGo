//
//  LoginViewController.swift
//  TravelGo
//
//  Created by Никита on 13/01/2019.
//  Copyright © 2019 Никита. All rights reserved.
//

import UIKit
import CoreData

class LoginViewController: UIViewController {
    var check = UserCred()
    
    @IBAction func loginVK(_ sender: UIButton) {
        APIWorker.authorize()
        APIWorker.logout()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
}
