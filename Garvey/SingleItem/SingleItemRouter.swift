//
//  SingleItemRouter.swift
//  Garvey
//
//  Created by Wikipedia Brown on 6/26/19.
//  Copyright © 2019 IamGoodBad. All rights reserved.
//

import RIBs

protocol SingleItemInteractable: Interactable {
    var router: SingleItemRouting? { get set }
    var listener: SingleItemListener? { get set }
}

protocol SingleItemViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class SingleItemRouter: ViewableRouter<SingleItemInteractable, SingleItemViewControllable>, SingleItemRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: SingleItemInteractable, viewController: SingleItemViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
