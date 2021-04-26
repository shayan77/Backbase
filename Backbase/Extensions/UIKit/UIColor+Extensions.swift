//
//  UIColor+Extensions.swift
//  Backbase
//
//  Created by Shayan Mehranpoor on 4/26/21.
//

import UIKit

extension UIColor {
    
    private enum CustomColor: String {
        
        case backgroundColor
        
        var color: UIColor {
            guard let color = UIColor(named: rawValue) else {
                assertionFailure("Color missing from asset catalogue")
                return .systemBackground
            }
            return color
        }
    }
    
    static var backgroundColor: UIColor = {
        CustomColor.backgroundColor.color
    }()
}
