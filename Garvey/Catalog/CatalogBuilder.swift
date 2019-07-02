//
//  CatalogBuilder.swift
//  Garvey
//
//  Created by Wikipedia Brown on 6/26/19.
//  Copyright © 2019 IamGoodBad. All rights reserved.
//

import RIBs

protocol CatalogDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
    var imageManager: ImageManager { get }
}

final class CatalogComponent: Component<CatalogDependency>, SingleItemDependency {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
    var catalogManager = CatalogManager()
    var imageManager: ImageManager { return dependency.imageManager }
}

// MARK: - Builder

protocol CatalogBuildable: Buildable {
    func build(withListener listener: CatalogListener) -> CatalogRouting
}

final class CatalogBuilder: Builder<CatalogDependency>, CatalogBuildable {

    override init(dependency: CatalogDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: CatalogListener) -> CatalogRouting {
        let component = CatalogComponent(dependency: dependency)
        let viewController = CatalogViewController()
        let interactor = CatalogInteractor(presenter: viewController, imageManager: component.imageManager, catalogManager: component.catalogManager)
        interactor.listener = listener
        return CatalogRouter(interactor: interactor, viewController: viewController, component: component)
    }
}
