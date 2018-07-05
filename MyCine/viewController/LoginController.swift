//
//  LoginController.swift
//  LoginAPP
//
//  Created by Gbaha Patrick Cazon on 19/01/2018.
//  Copyright © 2018 Ynov. All rights reserved.
//

import UIKit

class LoginController: UIViewController {

    let inputsContainerView: UIView = {
    let view = UIView()
    view.backgroundColor = UIColor.white
    view.translatesAutoresizingMaskIntoConstraints = false
    view.layer.cornerRadius = 5
    view.layer.masksToBounds = true
    return view
    }()
    
    let loginRegisterButton: UIButton = {
        let button = UIButton(type: .system)
        //button.backgroundColor = UIColor(r: 80, g: 101, b: 161)
        button.backgroundColor = UIColor(r: 90, g: 101, b: 161)
        button.setTitle("Register", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        return button
    }()
    
    let nameTextFiled: UITextField = {
        
        let tf = UITextField()
        tf.placeholder = "Name"
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    let nameSeparatorView: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(r: 220, g: 220, b: 220)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let emailTextFiled: UITextField = {
        
        let tf = UITextField()
        tf.placeholder = "Email"
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    let emailSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(r: 220, g: 220, b: 220)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let passwordTextFiled: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Pasword"
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.isSecureTextEntry = true
        return tf
    }()
    /* let passwordSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(r: 220, g: 220, b: 220)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }() */
    let profileImageView: UIImageView = {
      let imageView = UIImageView()
        imageView.image = UIImage(named: "twitter")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(r: 61, g: 91, b: 151)
        
        view.addSubview(inputsContainerView)
        view.addSubview(loginRegisterButton)
        view.addSubview(profileImageView)
        
        setupInputsContainerView()
        setupLoginRegisterButton()
        setupProfileImageView()
        
    }
        //view.backgroundColor = UIColor(red:61/255 , green: 91/255  , blue: 151/255 ,alpha: 1)
        
        //let inputsContainerView = UIView()
        //inputsContainerView.backgroundColor = UIColor.white
        //inputsContainerView.translatesAutoresizingMaskIntoConstraints = false
    
    func setupProfileImageView() {
        //need x, y, width, heignt constraints
        profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        profileImageView.bottomAnchor.constraint(equalTo: inputsContainerView.topAnchor, constant: -12).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 150).isActive=true

    }
        
        func setupInputsContainerView() {
        //need x, y, width, heignt constraints
        inputsContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inputsContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        inputsContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        inputsContainerView.heightAnchor.constraint(equalToConstant: 150).isActive = true
            
            inputsContainerView.addSubview(nameTextFiled)
            inputsContainerView.addSubview(nameSeparatorView)
            inputsContainerView.addSubview(emailTextFiled)
            inputsContainerView.addSubview(emailSeparatorView)
            inputsContainerView.addSubview(passwordTextFiled)
            
           //need x, y, width, heignt constraints
            nameTextFiled.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
            nameTextFiled.topAnchor.constraint(equalTo: inputsContainerView.topAnchor).isActive = true
            nameTextFiled.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
            nameTextFiled.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/3).isActive = true
            
            //need x, y, width, heignt constraints
            nameSeparatorView.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor).isActive = true
            nameSeparatorView.topAnchor.constraint(equalTo: nameTextFiled.bottomAnchor).isActive = true
            nameSeparatorView.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
            nameSeparatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
            
            //need x, y, width, heignt constraints
            emailTextFiled.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
            emailTextFiled.topAnchor.constraint(equalTo: nameTextFiled.bottomAnchor).isActive = true
            emailTextFiled.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
            emailTextFiled.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/3).isActive = true
            
            //need x, y, width, heignt constraints
            emailSeparatorView.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor).isActive = true
            emailSeparatorView.topAnchor.constraint(equalTo: emailTextFiled.bottomAnchor).isActive = true
            emailSeparatorView.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
            emailSeparatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
            //need x, y, width, heignt constraints
            passwordTextFiled.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
            passwordTextFiled.topAnchor.constraint(equalTo: emailTextFiled.bottomAnchor).isActive = true
            passwordTextFiled.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
            passwordTextFiled.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/3).isActive = true
            
        }
        
        func setupLoginRegisterButton() {
            loginRegisterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            loginRegisterButton.topAnchor.constraint(equalTo: inputsContainerView.bottomAnchor, constant: 12).isActive = true
            loginRegisterButton.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
            loginRegisterButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
        //view.backgroundColor = UIColor(red:61/255 , green: 91/255  , blue: 151/255 ,alpha: 1)
        //view.backgroundColor = UIColor(r: 61, g: 91, b: 151)
        
        /* let inputsContainerView = UIView()
        inputsContainerView.backgroundColor = UIColor.white
        inputsContainerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(inputsContainerView)
        //need x, y, width, heignt constraints
        inputsContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inputsContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        inputsContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        inputsContainerView.heightAnchor.constraint(equalToConstant: 150).isActive = true */
    
   
    //var preferredStatusBarStyle: UIStatusBarStyle? {get}
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}

extension UIColor{
    
    convenience init(r: CGFloat, g: CGFloat, b:CGFloat) {
        self.init(red: r/255, green:g/255, blue: b/255, alpha: 1)
        
        }
    
}
