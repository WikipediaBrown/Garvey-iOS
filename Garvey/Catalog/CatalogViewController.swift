//
//  CatalogViewController.swift
//  Garvey
//
//  Created by Wikipedia Brown on 6/26/19.
//  Copyright © 2019 IamGoodBad. All rights reserved.
//

import RIBs
import RxSwift
import UIKit

protocol CatalogPresentableListener: CatalogLayoutDelegate {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
    func onCountRequest() -> Int
    func onItemRequest(at indexPath: IndexPath) -> CatalogDisplayableItem?
    func onTap(at Index: IndexPath)
}

final class CatalogViewController: UIViewController, CatalogPresentable, CatalogViewControllable {
    
    private let collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: CatalogLayout(delegate: nil))
        collectionView.backgroundColor = .brown
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(SingleItemCell.self, forCellWithReuseIdentifier: SingleItemCell.description())
        collectionView.register(ItemListCell.self, forCellWithReuseIdentifier: ItemListCell.description())
        collectionView.register(AdCell.self, forCellWithReuseIdentifier: AdCell.description())
        collectionView.register(CTACell.self, forCellWithReuseIdentifier: CTACell.description())
        return collectionView
    }()

    weak var listener: CatalogPresentableListener?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func presentSingleItem(with viewController: UIViewController) {
        present(viewController, animated: true)
    }
    
    private func setupViews() {
        collectionView.collectionViewLayout = CatalogLayout(delegate: listener)
        view.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constants.Root.CGFloats.menuBarHeight),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor)
            ])
    }
    
    private func getReuseIdentifier(type: CatalogDisplayableType?) -> String {
        switch type {
        case .some(.singleItem):
            return SingleItemCell.description()
        case .some(.itemList):
            return ItemListCell.description()
        case .some(.ad):
            return AdCell.description()
        case .some(.cta):
            return CTACell.description()
        case .none:
            return ""
        }
    }
}

extension CatalogViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listener?.onCountRequest() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = listener?.onItemRequest(at: indexPath)
        let reuseIdentifier = getReuseIdentifier(type: item?.type)
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        if let cell = cell as? CatalogDisplayableCell {
            cell.display(item: listener?.onItemRequest(at: indexPath))
        }
        return cell
    }
}
extension CatalogViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        listener?.onTap(at: indexPath)
    }
}
