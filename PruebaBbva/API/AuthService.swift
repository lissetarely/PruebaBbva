//
//  AuthService.swift
//  PruebaBbva
//
//  Created by Liset Areli Sanchez Martinez on 23/06/23.
//

import UIKit
import Firebase

struct AuthCredentials {
    let name: String
    let surname: String
    let email: String
    let password: String
}

struct AuthService {
    static func loginUser(withEmail email: String, password: String, completion: @escaping(Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Error al registrar usuario: \(error.localizedDescription)")
                completion(error)
                return
            }
            guard let uid = result?.user.uid else { return }
            completion(nil)
        }
    }
}


