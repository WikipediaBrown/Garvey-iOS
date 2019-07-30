//
//  CatalogInteractor.swift
//  Garvey
//
//  Created by Wikipedia Brown on 6/26/19.
//  Copyright © 2019 IamGoodBad. All rights reserved.
//

import RIBs
import RxSwift

protocol CatalogListener: class {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

protocol CatalogManaging: class {

}

protocol CatalogPresentable: Presentable {
    var listener: CatalogPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol CatalogRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

final class CatalogInteractor: PresentableInteractor<CatalogPresentable>, CatalogInteractable, CatalogPresentableListener {
    
    private let catalogManager: CatalogManaging?
    private let imageManager: ImageManager
    
    private var items: [Item] = []

    weak var router: CatalogRouting?
    weak var listener: CatalogListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    init(presenter: CatalogPresentable, imageManager: ImageManager, catalogManager: CatalogManaging) {
        self.imageManager = imageManager
        self.catalogManager = catalogManager
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
    
    func onCount() -> Int {
        return items.count
    }
    
    func returnItem(at indexPath: IndexPath) -> Item {
        return items[indexPath.item]
    }
    
    func onTap(at Index: IndexPath) {
        
    }
}
