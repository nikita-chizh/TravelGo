//
//  CredController.swift
//  TravelGo
//
//  Created by Никита on 15/01/2019.
//  Copyright © 2019 Никита. All rights reserved.
//

import Foundation
import UIKit
import CoreData
import os.log


class CredController{
    
    static var cred = UserCred()

    //SwiftyVK: success authorize with [
    //"user_id": "42851500",
    //"expires_in": "0",
    //"access_token": "aeac0ed19dfda3e86b1c4631e183c9e0cb7169da3e292525c7a2e20894f9d5ea7722845e0f7ac933d9952", "email": "NIKITA-CHIZH@YANDEX.ru"]

    static func fillFromVk(info: [String: String]){
        cred.social_slug = "vk"
        cred.external_id = info["user_id"]!
        cred.token = info["access_token"]!
        cred.first_name = "Nikita"
        
    }
    
    static func fetch()-> Bool {
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else { return false }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        //2
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "UserCredentials")
        
        //3
        do {
            let checkobj = try managedContext.fetch(fetchRequest)
            if checkobj.count != 1{
                return false
            }
            cred.first_name = checkobj[0].value(forKeyPath: "first_name") as! String
            cred.social_slug = checkobj[0].value(forKeyPath: "social_slug") as! String
            cred.external_id = checkobj[0].value(forKeyPath: "external_id") as! String
            cred.token = checkobj[0].value(forKeyPath: "token") as! String
            return true
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            return false
        }
    }
    
    static func save()->Bool {
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else { return false }
        // 1
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        // 2
        let entity =
            NSEntityDescription.entity(forEntityName: "UserCredentials",
                                       in: managedContext)!
        let credObj = NSManagedObject(entity: entity,
                                      insertInto: managedContext)
        // 3
        credObj.setValue(cred.first_name, forKeyPath: "first_name")
        credObj.setValue(cred.external_id, forKeyPath: "external_id")
        credObj.setValue(cred.social_slug, forKeyPath: "social_slug")
        credObj.setValue(cred.token, forKeyPath: "token")
        // 4
        do {
            try managedContext.save()
            return true
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
            return false
        }
    }

}
