//
//  Item.swift
//  Garvey
//
//  Created by Wikipedia Brown on 7/1/19.
//  Copyright © 2019 IamGoodBad. All rights reserved.
//

import UIKit

struct NetworkingStrings {
    static let https = "https"
    static let productionHost = "https"
}

struct Item {
    let identifier: String
    let imagePath: String
    let name: String
    
    var image: Result<UIImage, ImageError>?
    
    let url: URL? = {
        var components = URLComponents()
        components.scheme = NetworkingStrings.https
        
        return components.url
    }()
}

extension Item: Codable {
    enum CodingKeys:String,CodingKey {
        case identifier
        case imagePath
        case name
    }
}
