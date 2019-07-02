//
//  RootBuilder.swift
//  Garvey
//
//  Created by Wikipedia Brown on 6/13/19.
//  Copyright © 2019 IamGoodBad. All rights reserved.
//

import RIBs

protocol RootDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
    var cartDependency: CartDependency { get }
    var catalogDependency: CatalogDependency { get }
    var profileDependency: ProfileDependency { get }
    var singleItemDependency: SingleItemDependency { get }
}

final class RootComponent: Component<RootDependency> {
    
    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
    lazy var cartBuilder: CartBuildable = {
        return CartBuilder(dependency: dependency.cartDependency)
    }()
    lazy var catalogBuilder: CatalogBuildable = {
        return CatalogBuilder(dependency: dependency.catalogDependency)
    }()
    lazy var profileBuilder: ProfileBuildable = {
        return ProfileBuilder(dependency: dependency.profileDependency)
    }()
    lazy var singleItemBuilder: SingleItemBuildable = {
        return SingleItemBuilder(dependency: dependency.singleItemDependency)
    }()
}

// MARK: - Builder

protocol RootBuildable: Buildable {
    func build() -> RootRouting
}

final class RootBuilder: Builder<RootDependency>, RootBuildable {

    override init(dependency: RootDependency) {
        super.init(dependency: dependency)
    }

    func build() -> RootRouting {
        let component = RootComponent(dependency: dependency)
        let viewController = RootViewController()
        
        let interactor = RootInteractor(presenter: viewController)
        return RootRouter(interactor: interactor, viewController: viewController, component: component)
    }
}
