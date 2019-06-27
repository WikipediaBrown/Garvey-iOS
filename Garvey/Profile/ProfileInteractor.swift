//
//  ProfileInteractor.swift
//  Garvey
//
//  Created by Wikipedia Brown on 6/26/19.
//  Copyright © 2019 IamGoodBad. All rights reserved.
//

import RIBs
import RxSwift

protocol ProfileRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol ProfilePresentable: Presentable {
    var listener: ProfilePresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol ProfileListener: class {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class ProfileInteractor: PresentableInteractor<ProfilePresentable>, ProfileInteractable, ProfilePresentableListener {

    weak var router: ProfileRouting?
    weak var listener: ProfileListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: ProfilePresentable) {
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
