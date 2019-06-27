//
//  CatalogRouter.swift
//  Garvey
//
//  Created by Wikipedia Brown on 6/26/19.
//  Copyright © 2019 IamGoodBad. All rights reserved.
//

import RIBs

protocol CatalogInteractable: Interactable {
    var router: CatalogRouting? { get set }
    var listener: CatalogListener? { get set }
}

protocol CatalogViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class CatalogRouter: ViewableRouter<CatalogInteractable, CatalogViewControllable>, CatalogRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: CatalogInteractable, viewController: CatalogViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
