//
//  FieldStyle.swift
//  SocialApps
//
//  Created by Fathureza Januarza on 11/17/16.
//  Copyright © 2016 tedihouse. All rights reserved.
//

import UIKit

class FieldStyle: UITextField {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.borderColor = UIColor(colorLiteralRed: Float(SHADOW_GRAY), green: Float(SHADOW_GRAY), blue: Float(SHADOW_GRAY), alpha: 0.2).cgColor
        self.layer.borderWidth = 0.1
        self.layer.cornerRadius = 2.0
        self.clipsToBounds = true
    }
}
