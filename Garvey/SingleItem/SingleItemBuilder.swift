//
//  SingleItemBuilder.swift
//  Garvey
//
//  Created by Wikipedia Brown on 6/26/19.
//  Copyright © 2019 IamGoodBad. All rights reserved.
//

import RIBs

protocol SingleItemDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class SingleItemComponent: Component<SingleItemDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol SingleItemBuildable: Buildable {
    func build(withListener listener: SingleItemListener) -> SingleItemRouting
}

final class SingleItemBuilder: Builder<SingleItemDependency>, SingleItemBuildable {

    override init(dependency: SingleItemDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: SingleItemListener) -> SingleItemRouting {
        let component = SingleItemComponent(dependency: dependency)
        let viewController = SingleItemViewController()
        let interactor = SingleItemInteractor(presenter: viewController)
        interactor.listener = listener
        return SingleItemRouter(interactor: interactor, viewController: viewController)
    }
}