//
//  CatalogLayout.swift
//  Garvey
//
//  Created by Wikipedia Brown on 7/1/19.
//  Copyright © 2019 IamGoodBad. All rights reserved.
//

import UIKit

class CatalogLayout: UICollectionViewFlowLayout {
    override init() {
        super.init()
        estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        scrollDirection = .vertical
        minimumLineSpacing = 4
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
