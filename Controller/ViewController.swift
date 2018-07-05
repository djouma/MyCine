//
//  ViewController.swift
//  LoginAPP
//
//  Created by Gbaha Patrick Cazon on 19/01/2018.
//  Copyright © 2018 Ynov. All rights reserved.
//

import UIKit
//import Firebase
class ViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
     navigationItem.leftBarButtonItem = UIBarButtonItem(title:"Logout", style: .plain, target: self, action: #selector(handleLogout))
//     if FIRAuth.auth()?.currentUser?.uid == nil {
//        perform(#selector(handleLogout), with: nil, afterDelay: 0)
//        }
    
    }
    @objc func handleLogout() {
        
//        do {
//            try FIRAuth.auth()?.signOut()
//        }catch let logoutError {
//            print(logoutError)
//        }
//        let loginController = LoginController()
//        presentingViewController(loginController, animated: true, completion: nil)
    }

    
}


/*class ViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout",
                                                           style: .plain, target: self, action: #selector(handleLogout))
    }
    
    @objc func handleLogout() {
        let loginController = LoginController()
        present(loginController, animated: true, completion: nil)
        
    }
    
    
}*/

