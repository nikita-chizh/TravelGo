//
//  OneTripViewController.swift
//  TravelGo
//
//  Created by Никита on 20/01/2019.
//  Copyright © 2019 Никита. All rights reserved.
//

import UIKit

class OneTripViewController: UIViewController {

    var imgs = [UIImage]()
    // Type in the names of your images below
    let imageNames = ["","","","",""]
    var user = TravelGO_User()
    @IBOutlet weak var swipeImageView: UIImageView!
    
    
    var currentImage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        let swipeRight = UISwipeGestureRecognizer(target: self, action: Selector(("respondToSwipeGesture:")))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
        //
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: Selector(("respondToSwipeGesture:")))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
        //
        swipeImageView.image = AllTravelsRequester.getImageSynchrone(url: user.avatar.src_medium)
    }
    
    func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.left:
                if currentImage == imageNames.count - 1 {
                    currentImage = 0
                    
                }else{
                    currentImage += 1
                }
                swipeImageView.image = imgs[currentImage]
                
            case UISwipeGestureRecognizer.Direction.right:
                if currentImage == 0 {
                    currentImage = imageNames.count - 1
                }else{
                    currentImage -= 1
                }
                swipeImageView.image = imgs[currentImage]
            default:
                break
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
