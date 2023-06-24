//
//  LoginViewProtocols.swift
//  PruebaBbva
//
//  Created by Liset Areli Sanchez Martinez on 23/06/23.
//

import UIKit

protocol LoginViewProtocols : AnyObject {
    var presenter : LoginViewPresenterProtocols? {get set}
    
    func getContext() -> LoginViewController
}

protocol LoginViewPresenterProtocols : AnyObject {
    var view : LoginViewProtocols? {get set}
    var interactor : LoginViewInputInteractorProtocols? {get set}
    var router : LoginViewRouterProtocols? {get set}
    var users: [User] {get set}
    
    func prepareUI()
    func fetchData()
    func actionLogin()
}

protocol LoginViewInputInteractorProtocols : AnyObject {
    var presenter : LoginViewOutputInteractorProtocols? {get set}
   
    func getUsers()
}

protocol LoginViewOutputInteractorProtocols: AnyObject {
    func getUsersComplete(userSelected: User, listUsers: [User])
}

protocol LoginViewRouterProtocols: AnyObject {
    static func getModule() -> UIViewController?
    func navHome(controller: UIViewController, users: [User])
}

