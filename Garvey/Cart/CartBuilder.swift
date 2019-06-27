//
//  CartBuilder.swift
//  Garvey
//
//  Created by Wikipedia Brown on 6/26/19.
//  Copyright © 2019 IamGoodBad. All rights reserved.
//

import RIBs

protocol CartDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class CartComponent: Component<CartDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol CartBuildable: Buildable {
    func build(withListener listener: CartListener) -> CartRouting
}

final class CartBuilder: Builder<CartDependency>, CartBuildable {

    override init(dependency: CartDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: CartListener) -> CartRouting {
        let component = CartComponent(dependency: dependency)
        let viewController = CartViewController()
        let interactor = CartInteractor(presenter: viewController)
        interactor.listener = listener
        return CartRouter(interactor: interactor, viewController: viewController)
    }
}
