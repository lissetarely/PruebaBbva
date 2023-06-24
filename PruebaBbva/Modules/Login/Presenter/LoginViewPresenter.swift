//
//  LoginViewPresenter.swift
//  PruebaBbva
//
//  Created by Liset Areli Sanchez Martinez on 23/06/23.
//

import UIKit

class LoginViewPresenter: LoginViewPresenterProtocols, LoginViewOutputInteractorProtocols {
    var users: [User] = []
    
    var interactor: LoginViewInputInteractorProtocols?
    
    var router: LoginViewRouterProtocols?
    
    var view: LoginViewProtocols?
    
    var controller : LoginViewController {
        return view?.getContext() ?? LoginViewController()
    }
    
    func getUsersComplete(userSelected: User, listUsers: [User]) {
        self.users = listUsers
        controller.textFUserName.text = userSelected.email
        controller.textFPassword.text = userSelected.login.password
        
    }
   
    func prepareUI() {
        controller.view.backgroundColor = .btn_blue
        controller.view.addSubview(controller.imageCheck)
        controller.view.addSubview(controller.textFUserName)
        controller.view.addSubview(controller.textFPassword)
        controller.view.addSubview(controller.btnLogin)
        controller.view.addSubview(controller.bbva)
        
        controller.bbva.anchor(top: controller.view.safeAreaLayoutGuide.topAnchor, left: controller.view.leftAnchor,right: controller.view.rightAnchor,paddingTop: 30,width: 160,height: 100)
        controller.imageCheck.widthAnchor.constraint(equalTo: controller.view.widthAnchor, multiplier: 0.4).isActive = true
        controller.imageCheck.heightAnchor.constraint(equalTo: controller.imageCheck.widthAnchor, multiplier: 1.0).isActive = true 

        controller.imageCheck.centerXAnchor.constraint(equalTo: controller.view.centerXAnchor).isActive = true
        controller.textFUserName.anchor(top: controller.imageCheck.bottomAnchor, left: controller.view.leftAnchor, right: controller.view.rightAnchor, paddingTop: 20, paddingLeft: 30, paddingRight: 30)
        controller.textFPassword.anchor(top: controller.textFUserName.bottomAnchor, left: controller.view.leftAnchor, right: controller.view.rightAnchor, paddingTop: 10, paddingLeft: 30, paddingRight: 30)
        controller.textFPassword.centerYAnchor.constraint(equalTo: controller.view.centerYAnchor).isActive = true
        controller.btnLogin.anchor(top: controller.textFPassword.bottomAnchor, left: controller.view.leftAnchor, right: controller.view.rightAnchor, paddingTop: 30, paddingLeft: 20, paddingRight: 20)
        
    }
    
    func fetchData() {
        interactor?.getUsers()
    }
    
    func actionLogin() {
        validateLogin()
    }
    
    private func validateLogin() {
        controller.showLoader {
            let user =  self.controller.textFUserName.text?.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
            let password = self.controller.textFPassword.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            if let user = user, let password = password, RegexValidation.email(user) {
                self.controller.dismissLoader {
                    self.router?.navHome(controller: self.controller, users: self.users)
                }
            } else {
                self.controller.showAlert(message: "Usuario y/o contraseña incorrectos")
            }
        }
    }
}
