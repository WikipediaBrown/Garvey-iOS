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
    
    weak var delegate: CatalogLayoutDelegate?
    private var cache = [IndexPath: UICollectionViewLayoutAttributes]()
    private var contentHeight: CGFloat = 0
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: contentWidth, height: contentHeight)
    }
    
    private var contentWidth: CGFloat {
        guard let collectionView = collectionView else { return 0 }
        let insets = collectionView.contentInset
        return collectionView.bounds.width - (insets.left + insets.right)
    }
    
    private let numberOfColumns = Constants.Catalog.Ints.columns
    private let cellPadding = Constants.Catalog.CGFloats.cellPadding

    init(delegate: CatalogLayoutDelegate?) {
        self.delegate = delegate
        super.init()
//        estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        scrollDirection = .vertical
        minimumLineSpacing = 5
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepare() {
        guard let collectionView = collectionView  else { return }
        
        let columnWidth = contentWidth / CGFloat(numberOfColumns)
        var xOffset = [CGFloat]()
        
        for column in 0 ..< numberOfColumns {
            xOffset.append(CGFloat(column) * columnWidth)
        }
        
        var column = 0
        var yOffset = [CGFloat](repeating: 0, count: numberOfColumns)
        
        for section in 0..<collectionView.numberOfSections {
            for item in 0..<collectionView.numberOfItems(inSection: section)
                {
                let indexPath = IndexPath(item: item, section: section)
                let itemHeight = getItemHeight(for: indexPath)
                let height = cellPadding * 2 + itemHeight
                let frame = CGRect(x: xOffset[column], y: yOffset[column], width: columnWidth, height: height)
                let insetFrame = frame.insetBy(dx: cellPadding, dy: cellPadding)
                let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
                attributes.frame = insetFrame
                
                cache[indexPath] = attributes
                
                contentHeight = max(contentHeight, frame.maxY)
//                yOffset[column] = yOffset[column] + height
                yOffset[column] += height
                
                column = (column + 1) % numberOfColumns
            }
        }

    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        var visibleLayoutAttributes = [UICollectionViewLayoutAttributes]()
        
        // Loop through the cache and look for items in the rect
        for attributes in cache.values {
            if attributes.frame.intersects(rect) {
                visibleLayoutAttributes.append(attributes)
            }
        }
        return visibleLayoutAttributes
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cache[indexPath]
    }
    
    private func getItemHeight(for indexPath: IndexPath) -> CGFloat {
        switch delegate?.onTypeRequest(at: indexPath) {
        case .some(.singleItem):
            return Constants.Catalog.CGFloats.singleItemCellHeight
        case .some(.itemList):
            return Constants.Catalog.CGFloats.itemListCellHeight
        case .some(.ad):
            return Constants.Catalog.CGFloats.adCellHeight
        case .some(.cta):
            return Constants.Catalog.CGFloats.ctaCellHeight
        case .none:
            return 0
        }
        
    }
    
    
    
}
