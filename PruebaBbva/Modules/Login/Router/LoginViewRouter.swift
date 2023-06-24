//
//  LoginViewRouter.swift
//  PruebaBbva
//
//  Created by Liset Areli Sanchez Martinez on 23/06/23.
//

import UIKit

class LoginViewRouter : LoginViewRouterProtocols {
    
    static func getModule() -> UIViewController? {
        let controller = LoginViewController()
        if let viewC = controller as? LoginViewController {
            let presenter : LoginViewPresenterProtocols & LoginViewOutputInteractorProtocols = LoginViewPresenter()
            let router : LoginViewRouterProtocols = LoginViewRouter()
            let interactor : LoginViewInputInteractorProtocols = LoginViewInteractor()
            viewC.presenter = presenter
            presenter.interactor = interactor
            presenter.router = router
            presenter.view = viewC
            interactor.presenter = presenter
            return viewC 
        }
        return UIViewController()
    }
    
    func navHome(controller: UIViewController, users: [User]) {
        guard let newController = HomeViewRouter.getModule(users: users) else {return}
        newController.modalPresentationStyle = .overFullScreen
        newController.modalTransitionStyle = .crossDissolve
        controller.present(newController, animated: true)
    }
    
}
