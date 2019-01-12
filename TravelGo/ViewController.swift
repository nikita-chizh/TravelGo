//
//  ViewController.swift
//  TravelGo
//
//  Created by Никита on 11/01/2019.
//  Copyright © 2019 Никита. All rights reserved.
//

import UIKit

enum IntFieldError: Error {
    case runtimeError(String)
}

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var ageFrom: UITextField!
    @IBOutlet weak var ageTo: UITextField!
    @IBOutlet weak var query: UITextField!
    @IBOutlet weak var gChecker: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ageFrom.delegate = self
        ageTo.delegate = self
        query.delegate = self
        AllTravelsRequester.getMeetingsList()
    }

    @IBAction func checkGender(_ sender: Any) {
        switch gChecker.selectedSegmentIndex
        {
        case 0:
            AllTravelsRequester.getParams.gender = 0
        case 1:
            AllTravelsRequester.getParams.gender = 1
        default:
            break
        }
    }
    
    private func unpackIntText(field: UITextField!) throws -> Int{
        if let intText = field.text , let intVal = Int(intText){
            return intVal
        }
        throw IntFieldError.runtimeError("cannot convert text from int field")
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String,
                                     sender: Any?) -> Bool{
        if identifier ==  "AllTravels"
        {
        do {
            try AllTravelsRequester.getParams.ageFrom = unpackIntText(field: ageFrom)
            try AllTravelsRequester.getParams.ageTo = unpackIntText(field: ageTo)
        } catch is IntFieldError {
            return false
        }catch {
            return false
        }
        return true
        }
        return false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AllTravels"{
            AllTravelsRequester.getParams.query = query.text!
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    private func toAllTravelsController(){
        
    }
    
}

