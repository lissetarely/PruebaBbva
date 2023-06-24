//
//  HomeViewProtocols.swift
//  PruebaBbva
//
//  Created by Liset Areli Sanchez Martinez on 23/06/23.
//

import UIKit

protocol HomeViewProtocols : AnyObject {
    var presenter : HomeViewPresenterProtocols? {get set}
    
    func getContext() -> HomeViewController
}

protocol HomeViewPresenterProtocols : AnyObject {
    var view : HomeViewProtocols? {get set}
    var interactor : HomeViewInputInteractorProtocols? {get set}
    var router : HomeViewRouterProtocols? {get set}
    var usersCount : Int {
        get 
    }
    var users: [User] {get set}
    
    func prepareUI()
    func getUser(index: IndexPath) -> User?
}

protocol HomeViewInputInteractorProtocols : AnyObject {
    var presenter : HomeViewOutputInteractorProtocols? {get set}
   
    func getUsers()
}

protocol HomeViewOutputInteractorProtocols: AnyObject {}

protocol HomeViewRouterProtocols: AnyObject {
   
    
    static func getModule(users: [User]) -> UIViewController?
}
