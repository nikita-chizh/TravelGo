//
//  VKDelegate.swift
//  TravelGo
//
//  Created by Никита on 13/01/2019.
//  Copyright © 2019 Никита. All rights reserved.
//

import Foundation
import SwiftyVK
import UIKit

final class VKDelegate: SwiftyVKDelegate {
    
    let scopes: Scopes = [.messages,.offline,.friends,.wall,.photos,.audio,.video,.docs,.market,.email]
    let appId = SecretData.appId
    init() {
        VK.setUp(appId: appId, delegate: self)
    }
    
    func vkNeedsScopes(for sessionId: String) -> Scopes {
        return scopes
    }
    
    func vkNeedToPresent(viewController: VKViewController) {
        if let rootController = UIApplication.shared.keyWindow?.rootViewController {
            rootController.present(viewController, animated: true)
        }
    }
    
    func vkTokenCreated(for sessionId: String, info: [String : String]) {
        print("token created in session \(sessionId) with info \(info)")
        var res = CredController.fetch()
        if !res {print("vkTokenCreated fetch error")}
        CredController.fillFromVk(info: info)
        res = CredController.save()
        if !res {print("vkTokenCreated save error")}
    }
    
    func vkTokenUpdated(for sessionId: String, info: [String : String]) {
        print("token updated in session \(sessionId) with info \(info)")
    }
    
    func vkTokenRemoved(for sessionId: String) {
        print("token removed in session \(sessionId)")
    }
}
