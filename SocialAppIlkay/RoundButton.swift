//
//  RoundButton.swift
//  SocialAppIlkay
//
//  Created by TAE experts on 23/05/2017.
//  Copyright © 2017 IlkayHamit. All rights reserved.
//

import UIKit

class RoundButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        //Requires tweaking to fully understand
        //Set the shadow colour from constants
        layer.shadowColor = UIColor(red: SHADOW_GREY, green: SHADOW_GREY, blue: SHADOW_GREY, alpha: 0.6).cgColor
        layer.shadowOpacity = 1.5
        //How far the shadow spreads
        layer.shadowRadius = 5.0
        //How far out of the bounds before it applies and ends. Hard to explain
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        
        imageView?.contentMode = .scaleAspectFit
        
    }
    
    //Create a circular button
    //Calculate the size of the button before making perfect circle edge
    //Do it in layout subviews cause at this point the button has been made
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = self.frame.width / 2
    }
    

}
