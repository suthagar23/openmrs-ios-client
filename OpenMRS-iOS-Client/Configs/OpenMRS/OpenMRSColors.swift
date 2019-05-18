//
//  OpenMRSColors.swift
//  OpenMRS-iOS-Client
//
//  Created by Kailayapathy Suthagar on 5/18/19.
//  Copyright © 2019 OpenMRS. All rights reserved.
//

import Foundation
import UIKit

class OpenMRSColors {
    
    static var Orange: UIColor {
        return getUIColorFromRGB(r: 242, g: 101, b: 34)
    }
    
    static var Violet: UIColor {
        return getUIColorFromRGB(r: 91, g: 87, b: 166)
    }
    
    static var Gold: UIColor {
        return getUIColorFromRGB(r: 238, g: 166, b: 22)
    }
    
    static var Teal: UIColor {
        return getUIColorFromRGB(r: 0, g: 147, b: 132)
    }
    
    static var Black: UIColor {
        return getUIColorFromRGB(r: 35, g: 31, b: 32)
    }
    
    static func getUIColorFromRGB(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
        return UIColor.init(displayP3Red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1.0)
    }
}
