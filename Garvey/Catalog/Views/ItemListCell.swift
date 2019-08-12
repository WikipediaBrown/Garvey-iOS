//
//  ItemListCell.swift
//  Garvey
//
//  Created by Wikipedia Brown on 8/11/19.
//  Copyright © 2019 IamGoodBad. All rights reserved.
//

import UIKit

class ItemListCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .blue
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func display(item: CatalogDisplayableItem?) {
    }
}
