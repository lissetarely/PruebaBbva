//
//  HomeViewRouter.swift
//  PruebaBbva
//
//  Created by Liset Areli Sanchez Martinez on 23/06/23.
//

import UIKit

class HomeViewRouter: HomeViewRouterProtocols {
    static func getModule(users: [User]) -> UIViewController? {
        let controller = HomeViewController()
        if let viewC = controller as? HomeViewController {
            let presenter : HomeViewPresenterProtocols & HomeViewOutputInteractorProtocols = HomeViewPresenter()
            let router : HomeViewRouterProtocols = HomeViewRouter()
            let interactor : HomeViewInputInteractorProtocols = HomeViewInteractor()
            viewC.presenter = presenter
            presenter.users = users
            presenter.interactor = interactor
            presenter.router = router
            presenter.view = viewC
            interactor.presenter = presenter
            return viewC
        }
        return UIViewController()
    }
}

