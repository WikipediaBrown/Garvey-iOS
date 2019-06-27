//
//  CartRouter.swift
//  Garvey
//
//  Created by Wikipedia Brown on 6/26/19.
//  Copyright © 2019 IamGoodBad. All rights reserved.
//

import RIBs

protocol CartInteractable: Interactable {
    var router: CartRouting? { get set }
    var listener: CartListener? { get set }
}

protocol CartViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class CartRouter: ViewableRouter<CartInteractable, CartViewControllable>, CartRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: CartInteractable, viewController: CartViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
