//
//  AppComponent.swift
//  Garvey
//
//  Created by Wikipedia Brown on 6/26/19.
//  Copyright © 2019 IamGoodBad. All rights reserved.
//

import RIBs

class AppComponent: Component<EmptyDependency>, RootDependency, CartDependency, CatalogDependency, ProfileDependency, SingleItemDependency {
    
    let imageManager: ImageManager = ImageManager()
    
    lazy var catalogDependency: CatalogDependency = {
        return self
    }()
    
    lazy var profileDependency: ProfileDependency = {
        return self
    }()
    
    lazy var singleItemDependency: SingleItemDependency = {
        return self
    }()
    
    lazy var cartDependency: CartDependency = {
        return self
    }()
    
    init() {
        super.init(dependency: EmptyComponent())
    }
}
