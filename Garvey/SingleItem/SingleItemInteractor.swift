//
//  SingleItemInteractor.swift
//  Garvey
//
//  Created by Wikipedia Brown on 6/26/19.
//  Copyright © 2019 IamGoodBad. All rights reserved.
//

import RIBs
import RxSwift

protocol SingleItemListener: class {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}
protocol SingleItemManaging: class {
    func getSingleItem(with itemID: String)
}

protocol SingleItemPresentable: Presentable {
    var listener: SingleItemPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol SingleItemRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

final class SingleItemInteractor: PresentableInteractor<SingleItemPresentable>, SingleItemInteractable, SingleItemPresentableListener {

    weak var router: SingleItemRouting?
    weak var listener: SingleItemListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: SingleItemPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
}
