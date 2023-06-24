//
//  LoginViewController.swift
//  PruebaBbva
//
//  Created by Liset Areli Sanchez Martinez on 23/06/23.
//

import UIKit


class LoginViewController : UIViewController ,LoginViewProtocols {
   
    var presenter: LoginViewPresenterProtocols?
    
    internal var imageCheck : UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "ic_login")
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true 
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    internal var bbva : UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "logo")
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    internal lazy var textFUserName : UITextField = {
        let status = UITextField()
        status.placeholder = "Usuario"
        status.textColor = .white
        status.backgroundColor = .clear
        status.layer.borderColor = UIColor.gray.cgColor
        status.layer.borderWidth = 1
        status.layer.cornerRadius = 20
        status.setLeftPaddingPoints(10)
        status.heightAnchor.constraint(equalToConstant: 40).isActive = true
        status.translatesAutoresizingMaskIntoConstraints = false
        return status
    }()
    
    internal lazy var textFPassword : UITextField = {
        let status = UITextField()
        status.placeholder = "Contraseña"
        status.textColor = .white
        status.backgroundColor = .clear
        status.layer.borderColor = UIColor.gray.cgColor
        status.layer.borderWidth = 1
        status.layer.cornerRadius = 20
        status.setLeftPaddingPoints(10)
        status.isSecureTextEntry = true
        status.heightAnchor.constraint(equalToConstant: 40).isActive = true
        status.translatesAutoresizingMaskIntoConstraints = false
        return status
    }()
    
    internal lazy var btnLogin : UIButton = {
        let btnLogin = UIButton()
        btnLogin.backgroundColor = .blue_solid
        btnLogin.translatesAutoresizingMaskIntoConstraints = false
        btnLogin.setTitle("Ingresar", for: .normal)
        btnLogin.setDimensions(height: 55, width: 45)
        btnLogin.layer.cornerRadius = 20
        btnLogin.addTarget(self, action: #selector(actionLogin), for: .touchUpInside)
        return btnLogin
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.prepareUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter?.fetchData()
    }
    
    func getContext() -> LoginViewController {
        return self
    }
    
    
}
