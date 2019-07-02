//
//  RootInteractor.swift
//  Garvey
//
//  Created by Wikipedia Brown on 6/13/19.
//  Copyright © 2019 IamGoodBad. All rights reserved.
//

import RIBs
import RxSwift

protocol RootRouting: LaunchRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
    var currentRIB: Routing? { get set }
    func routeToCart()
    func routeToCatalog()
    func routeToProfile()
}

protocol RootPresentable: Presentable {
    // TODO: Declare methods the interactor can invoke the presenter to present data.
    var listener: RootPresentableListener? { get set }
    func setupViews()
}

protocol RootListener: class {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class RootInteractor: PresentableInteractor<RootPresentable>, RootInteractable, RootPresentableListener {

    weak var router: RootRouting?
    weak var listener: RootListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: RootPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
        presenter.setupViews()
    }
    
    func onMenuTap(tappedType swappableType: SwappableType) {
        switch swappableType {
        case .catalog:
            if !(router?.currentRIB is CatalogRouting)  { router?.routeToCatalog() }
        case .cart:
            if !(router?.currentRIB is CartRouting)  { router?.routeToCart() }
        case .profile:
            if !(router?.currentRIB is ProfileRouting)  { router?.routeToProfile() }
        }
    }

}
