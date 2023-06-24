//
//  HomeViewPresenter.swift
//  PruebaBbva
//
//  Created by Liset Areli Sanchez Martinez on 23/06/23.
//

import UIKit


class HomeViewPresenter: HomeViewPresenterProtocols, HomeViewOutputInteractorProtocols {
    
    var view: HomeViewProtocols?
    
    var interactor: HomeViewInputInteractorProtocols?
    
    var router: HomeViewRouterProtocols?
    
    var controller : HomeViewController {
        return view?.getContext() ?? HomeViewController()
    }
    
    var users : [User] = []
    
    var usersCount : Int {
        return users.count
    }
    
    func prepareUI() {
        self.controller.view.backgroundColor = .white
        self.controller.view.addSubview(self.controller.tableView)
        self.controller.view.addSubview(self.controller.btnExit)
        self.controller.btnExit.anchor(left: self.controller.view.leftAnchor, bottom: self.controller.view.safeAreaLayoutGuide.bottomAnchor, right: self.controller.view.rightAnchor, paddingLeft: 20, paddingRight: 20)
        self.controller.tableView.anchor(top: self.controller.view.topAnchor, left: self.controller.view.leftAnchor, bottom: self.controller.btnExit.topAnchor, right: self.controller.view.rightAnchor)
    }
    
    func getUser(index: IndexPath) -> User? {
        return index.row < usersCount ? users[index.row] : nil
    }
}
