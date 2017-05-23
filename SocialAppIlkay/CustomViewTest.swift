//
//  CustomViewTest.swift
//  SocialAppIlkay
//
//  Created by TAE experts on 23/05/2017.
//  Copyright © 2017 IlkayHamit. All rights reserved.
//

//Add Shadow to a view

import UIKit

class CustomViewTest: UIView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //Requires tweaking to fully understand
        //Set the shadow colour from constants
        layer.shadowColor = UIColor(red: SHADOW_GREY, green: SHADOW_GREY, blue: SHADOW_GREY, alpha: 0.6).cgColor
        layer.shadowOpacity = 2.8
        //How far the shadow spreads
        layer.shadowRadius = 5.0
        //How far out of the bounds before it applies and ends. Hard to explain
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
    }


}
