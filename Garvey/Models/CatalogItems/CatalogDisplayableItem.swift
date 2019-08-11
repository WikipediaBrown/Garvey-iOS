//
//  CatalogDisplayableItem.swift
//  Garvey
//
//  Created by Wikipedia Brown on 8/11/19.
//  Copyright © 2019 IamGoodBad. All rights reserved.
//

import Foundation

protocol CatalogDisplayableItem {
    var name: String { get }
    var type: CatalogDisplayableType { get }
}
