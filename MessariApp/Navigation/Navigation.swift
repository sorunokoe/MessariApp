//
//  Navigation.swift
//  MessariApp
//
//  Created by Yeskendir Salgara on 25.12.2020.
//

import UIKit

enum NavigationRoutePath {
    case main
    case detail
}
class Navigation {

    static var shared = Navigation()
    var window: UIWindow?

    func start() {
        open(.main)
    }

    func open(_ path: NavigationRoutePath) {
        switch path {
        case .main:
            let vc = MainRouter.generate()
            window?.rootViewController = vc
        case .detail:
            break
        }
    }

}
