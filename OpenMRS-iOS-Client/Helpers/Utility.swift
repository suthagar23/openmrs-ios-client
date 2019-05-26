//
//  Utility.swift
//  OpenMRS-iOS-Client
//
//  Created by Kailayapathy Suthagar on 5/26/19.
//  Copyright © 2019 OpenMRS. All rights reserved.
//

import Foundation

class Utility {
    
    static func isValidURL(url: String) -> Bool {
        guard url != "" else {
            return false
        }
        let regEx = "((https|http)://)((\\w|-)+)(([.]|[/])((\\w|-)+))+"
        let predicate = NSPredicate(format:"SELF MATCHES %@", argumentArray:[regEx])
        return predicate.evaluate(with: url)
    }
}
