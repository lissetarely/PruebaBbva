//
//  HomeViewController.swift
//  PruebaBbva
//
//  Created by Liset Areli Sanchez Martinez on 23/06/23.
//

import UIKit

class HomeViewController: UIViewController, HomeViewProtocols {
    
    var presenter: HomeViewPresenterProtocols?
    
    lazy var tableView : UITableView = {
       let table = UITableView()
        table.estimatedRowHeight = 150
        table.register(UserTableViewCell.self, forCellReuseIdentifier: "cell")
        table.delegate = self
        table.dataSource = self
        return table
    }()
    
    internal lazy var btnExit : UIButton = {
        let btnExit = UIButton()
        btnExit.backgroundColor = .btn_blue
        btnExit.translatesAutoresizingMaskIntoConstraints = false
        btnExit.setTitle("Salir", for: .normal)
        btnExit.setDimensions(height: 45, width: 45)
        btnExit.layer.cornerRadius = 20
        btnExit.addTarget(self, action: #selector(actionExit), for: .touchUpInside)
        return btnExit
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.prepareUI()
    }
    
    func getContext() -> HomeViewController {
        return self
    }
    
   
}
