//
//  CatalogLayout.swift
//  Garvey
//
//  Created by Wikipedia Brown on 7/1/19.
//  Copyright © 2019 IamGoodBad. All rights reserved.
//

import UIKit

protocol CatalogLayoutDelegate: class {
    func onTypeRequest(at indexPath: IndexPath) -> CatalogDisplayableType?
}

class CatalogLayout: UICollectionViewFlowLayout {
    
    let delegate: CatalogLayoutDelegate?
    let columns = Constants.Catalog.Ints.columns
    
    init(delegate: CatalogLayoutDelegate?) {
        self.delegate = delegate
        super.init()
        estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        scrollDirection = .vertical
        minimumLineSpacing = 5
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
