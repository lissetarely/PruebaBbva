//
//  LoginViewInteractor.swift
//  PruebaBbva
//
//  Created by Liset Areli Sanchez Martinez on 23/06/23.
//

import UIKit

class LoginViewInteractor: LoginViewInputInteractorProtocols {
    var presenter: LoginViewOutputInteractorProtocols?
    
    func getUsers() {
        Service.fetchUsers(results: 10) { error, users in
            if let user = users.first {
                self.presenter?.getUsersComplete(userSelected: user, listUsers: users)
            }
        }
    }
    
    
}
