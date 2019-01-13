//
//  LoginViewController.swift
//  TravelGo
//
//  Created by Никита on 13/01/2019.
//  Copyright © 2019 Никита. All rights reserved.
//

import UIKit


class LoginViewController: UIViewController {

    var handlerStarted = false
    
    @IBAction func loginVK(_ sender: UIButton) {
        APIWorker.authorize()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
