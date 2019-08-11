//
//  Item.swift
//  Garvey
//
//  Created by Wikipedia Brown on 7/1/19.
//  Copyright © 2019 IamGoodBad. All rights reserved.
//

import UIKit

struct Item: CatalogDisplayableItem {
    let identifier: String
    let imagePath: String
    let name: String
    let type: CatalogDisplayableType
    
    var image: Result<UIImage, ImageError>?
    
    let url: URL? = {
        var components = URLComponents()
        components.scheme = NetworkingStrings.gs
        
        return components.url
    }()
}

extension Item: Codable {
    enum CodingKeys:String,CodingKey {
        case identifier
        case imagePath
        case name
        case type
    }
}
