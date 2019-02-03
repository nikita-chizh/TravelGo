//
//  OneTripViewController.swift
//  TravelGo
//
//  Created by Никита on 20/01/2019.
//  Copyright © 2019 Никита. All rights reserved.
//

import UIKit

class OneTripViewController: UIViewController, UIGestureRecognizerDelegate {

    var imgs = [UIImage]()
    // Type in the names of your images below
    var photos = [TravelGO_Photo]()
    
    var user = TravelGO_User()
    @IBOutlet weak var swipeImageView: UIImageView!
    
    
    var currentImage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photos = user.photos
        loadPhoto(imageURL: photos[0].photo)

    }
    
    func loadPhoto(imageURL: URL){
        let queue = DispatchQueue.global(qos: .utility)
        queue.async{
            if let data = try? Data(contentsOf: imageURL){
                DispatchQueue.main.async {
                    self.swipeImageView.image = UIImage(data: data)
                }
            }
        }
    }
    
    @IBAction func respondToSwipeGesture(swipeGesture:UISwipeGestureRecognizer) {
        switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.left:
                if currentImage == self.photos.count - 1 {
                    currentImage = 0
                }else{
                    currentImage += 1
                }
            
            case UISwipeGestureRecognizer.Direction.right:
                if currentImage == 0 {
                    currentImage = self.photos.count - 1
                }else{
                    currentImage -= 1
                }
            default:
                break
            }
            loadPhoto(imageURL: photos[currentImage].photo)
        }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
