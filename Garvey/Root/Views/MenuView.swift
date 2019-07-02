//
//  MenuView.swift
//  Garvey
//
//  Created by Wikipedia Brown on 6/27/19.
//  Copyright © 2019 IamGoodBad. All rights reserved.
//

import UIKit

protocol MenuViewListener: class {
    func leftButtonTapped(menuHeight: CGFloat)
    func rightButtonTapped()
    func menuItemTapped(with type: SwappableType)
}

enum SwappableType: String {
    case cart = "cart"
    case catalog = "catalog"
    case profile = "profile"
}

class MenuView: UIView {
    
    private weak var listener: MenuViewListener?
    private let menuItems: [SwappableType] = [.cart, .catalog, .profile]
    private let menuButtonWidthAndHeight = Constants.Root.CGFloats.menuButtonWidthAndHeight
    
    private let leftButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(leftButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let rightButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(rightButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let menuCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = Constants.Root.CGSizes.menuCellSize
        layout.minimumLineSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isScrollEnabled = false
        collectionView.backgroundColor = .blue
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(MenuCollectionViewCell.self, forCellWithReuseIdentifier: MenuCollectionViewCell.description())
        return collectionView
    }()

    convenience init(listener: MenuViewListener) {
        self.init()
        self.listener = listener
        setupViews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        let statusBarHeight = UIApplication.shared.statusBarFrame.size.height
        
        addSubview(leftButton)
        addSubview(rightButton)
        addSubview(titleLabel)
        addSubview(menuCollectionView)
        
        menuCollectionView.dataSource = self
        menuCollectionView.delegate = self
        
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = Colors.menuColor
        
        NSLayoutConstraint.activate([
            leftButton.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            leftButton.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
            leftButton.widthAnchor.constraint(equalToConstant: Constants.Root.CGFloats.menuButtonWidthAndHeight),
            leftButton.heightAnchor.constraint(equalToConstant: Constants.Root.CGFloats.menuButtonWidthAndHeight)
            ])
        
        NSLayoutConstraint.activate([
            rightButton.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            rightButton.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
            rightButton.widthAnchor.constraint(equalToConstant: Constants.Root.CGFloats.menuButtonWidthAndHeight),
            rightButton.heightAnchor.constraint(equalToConstant: Constants.Root.CGFloats.menuButtonWidthAndHeight)
            ])
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leftButton.trailingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: rightButton.leadingAnchor, constant: -8),
            titleLabel.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: Constants.Root.CGFloats.menuButtonWidthAndHeight)
            ])
        
        NSLayoutConstraint.activate([
            menuCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            menuCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            menuCollectionView.heightAnchor.constraint(equalToConstant: Constants.Root.CGSizes.menuCellSize.height * CGFloat(menuItems.count)),
            menuCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -(Constants.Root.CGFloats.menuBarHeight + statusBarHeight))
            ])
    }
    
    @objc func leftButtonTapped() {
        let statusBarHeight = UIApplication.shared.statusBarFrame.size.height
        let height = Constants.Root.CGSizes.menuCellSize.height * CGFloat(menuItems.count) + statusBarHeight
        listener?.leftButtonTapped(menuHeight: height)
    }
    
    @objc func rightButtonTapped() {
        listener?.rightButtonTapped()
    }

}

extension MenuView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCollectionViewCell.description(), for: indexPath)
        if let cell = cell as? MenuCollectionViewCell, indexPath.row < menuItems.count {
            cell.setLabel(type: menuItems[indexPath.item])
        }
        return cell
    }
    
}

extension MenuView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard indexPath.row < menuItems.count else { return }
        listener?.menuItemTapped(with: menuItems[indexPath.item])
    }
}
