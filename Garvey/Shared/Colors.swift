//
//  Colors.swift
//  Garvey
//
//  Created by Wikipedia Brown on 6/27/19.
//  Copyright © 2019 IamGoodBad. All rights reserved.
//

import UIKit

struct Colors {
    static let menuColor: UIColor = {
        return UIColor(displayP3Red: 23/255, green: 23/255, blue: 33/255, alpha: 1)
    }()
    
    static let menuTextColor: UIColor = {
        return UIColor(displayP3Red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
    }()
    
    static let primaryGray: UIColor = {
        return UIColor(displayP3Red: 203/255, green: 203/255, blue: 203/255, alpha: 1)
    }()
    
    static let garveyBlue: UIColor = {
        return UIColor(displayP3Red: 12/255, green: 30/255, blue: 71/255, alpha: 1)
    }()
    
    static let primaryRed: UIColor = {
        return UIColor(displayP3Red: 227/255, green: 66/255, blue: 52/255, alpha: 1)
    }()
    
    static let primaryGreen: UIColor = {
        return UIColor(displayP3Red: 85/255, green: 212/255, blue: 63/255, alpha: 1)
    }()
    
    static var random: UIColor {
        return UIColor(displayP3Red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1)
    }
}
