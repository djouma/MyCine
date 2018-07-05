//
//  ViewController.swift
//  LoginAPP
//
//  Created by Gbaha Patrick Cazon on 19/01/2018.
//  Copyright © 2018 Ynov. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout",
                                                           style: .plain, target: self, action: #selector(handleLogout))
        
    }

    @objc func handleLogout() {
        let loginController = LoginController()
        present(loginController, animated: true, completion: nil)
        
    }


}

