//
//  RootRouter.swift
//  Garvey
//
//  Created by Wikipedia Brown on 6/13/19.
//  Copyright © 2019 IamGoodBad. All rights reserved.
//

import RIBs

protocol RootInteractable: Interactable {
    var router: RootRouting? { get set }
    var listener: RootListener? { get set }
}

protocol RootViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
    func animateViewControllerReplacement(viewController: UIViewController)
}

final class RootRouter: ViewableRouter<RootInteractable, RootViewControllable>, RootRouting {
    
    var currentRIB: Routing?
    var component: RootComponent

    // TODO: Constructor inject child builder protocols to allow building children.
    init(interactor: RootInteractable, viewController: RootViewControllable, component: RootComponent) {
        self.component = component
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
