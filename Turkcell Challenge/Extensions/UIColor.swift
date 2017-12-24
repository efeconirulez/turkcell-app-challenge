//
//  UIColor.swift
//  Turkcell Challenge
//
//  Created by Efe Helvacı on 24.12.2017.
//  Copyright © 2017 Efe Helvaci. All rights reserved.
//

import UIKit

extension UIColor {
    
    class func with(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: alpha)
    }
    
    class func PrimaryBlueColor(withAlpha alpha: CGFloat) -> UIColor {
        return UIColor.with(red: 32.0, green: 135.0, blue: 200.0, alpha: alpha)
    }
    
}
