//
//  Constants.swift
//  Garvey
//
//  Created by Wikipedia Brown on 6/27/19.
//  Copyright © 2019 IamGoodBad. All rights reserved.
//

import UIKit

struct Constants {
    struct Catalog {
        struct CGFloats {
            static let standardMargin: CGFloat = {
                return 8
            }()
        }
        struct Ints {
            static let columns: Int = {
                return 2
            }()
        }
    }
    struct Root {
        struct CGSizes {
            static let menuCellSize: CGSize = {
                return CGSize(width: UIScreen.main.bounds.width, height: 64)
            }()
        }
        struct CGFloats {
            static let menuBarHeight: CGFloat = {
                return 44.0
            }()
            
            static let menuButtonWidthAndHeight: CGFloat = {
                return 32.0
            }()
            
            static let standardMargin: CGFloat = {
                return 8
            }()
        }
        struct Fonts {
            static let menuFont: UIFont = {
                return UIFont.boldSystemFont(ofSize: 35)
            }()
        }
        struct TimeIntervals {
            static let menuSwapDuration: TimeInterval = {
                return 0.3
            }()
            
            static let menuOpenDuration: TimeInterval = {
                return 0.2
            }()
        }
    }
}
