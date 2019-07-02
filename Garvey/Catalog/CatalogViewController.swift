//
//  CatalogViewController.swift
//  Garvey
//
//  Created by Wikipedia Brown on 6/26/19.
//  Copyright © 2019 IamGoodBad. All rights reserved.
//

import RIBs
import RxSwift
import UIKit

protocol CatalogPresentableListener: class {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class CatalogViewController: UIViewController, CatalogPresentable, CatalogViewControllable {

    weak var listener: CatalogPresentableListener?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
    
    func presentSingleItem(with viewController: UIViewController) {
        present(viewController, animated: true)
    }
}
