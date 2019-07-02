//
//  RootViewController.swift
//  Garvey
//
//  Created by Wikipedia Brown on 6/13/19.
//  Copyright © 2019 IamGoodBad. All rights reserved.
//

import RIBs
import RxSwift
import UIKit

protocol RootPresentableListener: class {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
    func onMenuTap(tappedType swappableType: SwappableType)
}

final class RootViewController: UIViewController, RootPresentable, RootViewControllable {

    weak var currentViewController: UIViewController?
    weak var listener: RootPresentableListener?
    private lazy var menuView = MenuView(listener: self)
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        switch currentViewController?.description {
        default:
            return .lightContent
        }
    }
    
    func setupViews() {
        view.backgroundColor = .lightGray
        view.addSubview(menuView)
        NSLayoutConstraint.activate([
            menuView.widthAnchor.constraint(equalTo: view.widthAnchor),
            menuView.heightAnchor.constraint(equalTo: view.heightAnchor),
            menuView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            menuView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            menuView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constants.Root.CGFloats.menuBarHeight)
            ])
    }
    
    private func closeMenu() {
        UIView.animate(withDuration: Constants.Root.TimeIntervals.menuSwapDuration, animations: {
            self.view.setNeedsLayout()
            self.menuView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: Constants.Root.CGFloats.menuBarHeight).isActive = true
            self.view.layoutIfNeeded()
        })
    }
    
    private func openMenu(menuHeight: CGFloat) {
        UIView.animate(withDuration: Constants.Root.TimeIntervals.menuOpenDuration, delay: 0, options: .curveEaseOut, animations: {
            self.menuView.center.y += menuHeight
        }, completion: nil)
    }

    func animateViewControllerReplacement(viewController: UIViewController){
        UIView.animate(withDuration: Constants.Root.TimeIntervals.menuSwapDuration, animations: {
            viewController.view.center.y = UIScreen.main.bounds.height/2
            self.currentViewController?.view.center.y = UIScreen.main.bounds.height*1.5
            self.setNeedsStatusBarAppearanceUpdate()
        }) { (true) in
            self.currentViewController?.willMove(toParent: nil)
            self.currentViewController?.view.removeFromSuperview()
            self.currentViewController?.removeFromParent()
            self.currentViewController = viewController
        }
    }
}

extension RootViewController: MenuViewListener {
    func leftButtonTapped(menuHeight: CGFloat) {
        ((menuView.frame.maxY - view.safeAreaInsets.top) > Constants.Root.CGFloats.menuBarHeight) ? closeMenu() : openMenu(menuHeight: menuHeight)
    }
    
    func rightButtonTapped() {
        print("right")
    }
    
    func menuItemTapped(with type: SwappableType) {
        closeMenu()
        listener?.onMenuTap(tappedType: type)
    }
}
