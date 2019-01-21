//
//  TravelerBriefViewCell.swift
//  TravelGo
//
//  Created by Никита on 12/01/2019.
//  Copyright © 2019 Никита. All rights reserved.
//

import UIKit

class TravelerBriefViewCell: UITableViewCell {

    @IBOutlet weak var ava: UIImageView!
    @IBOutlet weak var briefInfo: UITextView!
    var id = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        ava.layer.cornerRadius = ava.frame.size.width/2
        ava.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
