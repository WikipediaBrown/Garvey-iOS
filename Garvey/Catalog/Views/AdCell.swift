//
//  AdCell.swift
//  Garvey
//
//  Created by Wikipedia Brown on 8/11/19.
//  Copyright © 2019 IamGoodBad. All rights reserved.
//

import UIKit

class AdCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func display(item: CatalogDisplayableItem?) {
    }
}
