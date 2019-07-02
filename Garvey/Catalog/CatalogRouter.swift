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

    let component: CatalogComponent

    // TODO: Constructor inject child builder protocols to allow building children.
    init(interactor: CatalogInteractable, viewController: CatalogViewControllable, component: CatalogComponent) {
        self.component = component
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    func routeToSingleItem(with identifier: String) {
        let router = SingleItemBuilder(dependency: component).build(withListener: interactor, singleItemIdentifier: identifier)
        attachChild(router)
        viewController.presentSingleItem(with: router.viewControllable.uiviewController)
    }
    
    func routeFromSingleItem() {
        if let currentSingleItem = children.first {
            detachChild(currentSingleItem)
        }
        viewController.uiviewController.dismiss(animated: true)
    }
}
