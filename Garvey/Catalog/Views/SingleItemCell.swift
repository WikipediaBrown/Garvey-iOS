//
//  SingleItemCell.swift
//  Garvey
//
//  Created by Wikipedia Brown on 7/1/19.
//  Copyright © 2019 IamGoodBad. All rights reserved.
//

import UIKit

class SingleItemCell: UICollectionViewCell, CatalogDisplayableCell {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .purple
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let headlineLabel: UILabel = {
        let label = UILabel()
        label.text = "TEST"
        label.backgroundColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .green
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func display(item: CatalogDisplayableItem?) {
        headlineLabel.text = item?.name
        //        imageDisposable = item?.image
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        let newAttributes = super.preferredLayoutAttributesFitting(layoutAttributes)
//        let indexPath = newAttributes.indexPath
//        if indexPath.item % 2 == 0 {
//            print(indexPath)
//            newAttributes.size.height = 50
//        } else {
//            print(indexPath)
//            newAttributes.size.height = 100
//        }
//        newAttributes.size.width = UIScreen.main.bounds.width/2 - 5

        
        return newAttributes
    }
    
    
    private func setupViews() {
        contentView.addSubview(imageView)
        contentView.addSubview(headlineLabel)
//        NSLayoutConstraint.activate([
//            imageView.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
//            imageView.leftAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leftAnchor),
//            imageView.rightAnchor.constraint(equalTo: contentView.layoutMarginsGuide.rightAnchor),
//            imageView.heightAnchor.constraint(equalToConstant: 240),
//            headlineLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: Constants.Catalog.CGFloats.standardMargin),
//            headlineLabel.leftAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leftAnchor),
//            headlineLabel.rightAnchor.constraint(equalTo: contentView.layoutMarginsGuide.rightAnchor),
//            headlineLabel.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor)
//            ])
    }
}
