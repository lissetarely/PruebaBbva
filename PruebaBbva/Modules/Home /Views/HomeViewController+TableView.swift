//
//  HomeViewController+TableView.swift
//  PruebaBbva
//
//  Created by Liset Areli Sanchez Martinez on 23/06/23.
//

import UIKit

extension HomeViewController : UITableViewDelegate, UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.usersCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? UserTableViewCell else {return UITableViewCell()
        }
        guard let user = presenter?.getUser(index: indexPath) else {return UITableViewCell()}
        cell.setUp(user: user)
        return cell
    }
    
    
}
