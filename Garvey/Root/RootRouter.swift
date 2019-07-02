//
//  RootRouter.swift
//  Garvey
//
//  Created by Wikipedia Brown on 6/13/19.
//  Copyright © 2019 IamGoodBad. All rights reserved.
//

import RIBs

protocol RootInteractable: Interactable, CartListener, CatalogListener, ProfileListener {
    var router: RootRouting? { get set }
    var listener: RootListener? { get set }
}

protocol RootViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
    func animateViewControllerReplacement(viewController: UIViewController)
}

final class RootRouter: LaunchRouter<RootInteractable, RootViewControllable>, RootRouting {
    
    var currentRIB: Routing?
    var component: RootComponent

    // TODO: Constructor inject child builder protocols to allow building children.
    init(interactor: RootInteractable, viewController: RootViewControllable, component: RootComponent) {
        self.component = component
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    override func didLoad() {
        super.didLoad()
        routeToCatalog()
    }
    
    func routeToCart() {
        swapChildren(router: component.cartBuilder.build(withListener: interactor))
    }
    
    func routeToCatalog() {
        swapChildren(router: component.catalogBuilder.build(withListener: interactor))
    }
    
    func routeToProfile() {
        swapChildren(router: component.profileBuilder.build(withListener: interactor))
    }
    
    private func swapChildren(router: ViewableRouting) {
        if let currentRIB = currentRIB {
            detachChild(currentRIB)
        }
        attachChild(router)
        viewController.animateViewControllerReplacement(viewController: router.viewControllable.uiviewController)
        currentRIB = router
    }
}
