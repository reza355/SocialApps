//
//  RoundButton.swift
//  SocialApps
//
//  Created by Fathureza Januarza on 11/17/16.
//  Copyright © 2016 tedihouse. All rights reserved.
//

import UIKit

class RoundButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.shadowColor = UIColor(colorLiteralRed: Float(SHADOW_GRAY), green: Float(SHADOW_GRAY), blue: Float(SHADOW_GRAY), alpha: 0.6).cgColor
        self.layer.shadowOpacity = 0.8
        self.layer.shadowRadius = 5.0
        self.layer.shadowOffset = CGSize(width: 0.1, height: 0.1)
        imageView?.contentMode = .scaleAspectFit
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
    }
}
