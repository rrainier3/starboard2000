//
//  LoginViewController.swift
//  Example
//
//  Created by RayRainier on 4/12/17.
//  Copyright © 2017 RadiuSense. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import ColorMatchTabs
import Firebase

var verifyLoginAccess: Bool!
var user1: User!

class LoginJitterButton: UIButton, Jitterable {
    
}

class LoginViewController: UIViewController, UITextFieldDelegate, Jitterable {

    
    let emailTextField: SkyFloatingLabelTextField = {
        let emailLogin = SkyFloatingLabelTextField(frame: CGRect(x: 10, y: 10, width: 200, height: 45))
        emailLogin.placeholder = "Email Address"
        emailLogin.title = "Email Address"
        emailLogin.titleColor = .white
        emailLogin.errorColor = UIColor.orange
        
        emailLogin.selectedTitle = "Email Address"
        emailLogin.selectedTitleColor = .white
        emailLogin.selectedLineColor = .white
        emailLogin.font = UIFont.fontAvenirMedium(ofSize: 18)
        
        emailLogin.textColor = .white
        
        return emailLogin
    }()
    
    let passwordField: SkyFloatingLabelTextField = {
        let password = SkyFloatingLabelTextField(frame: CGRect(x: 10, y: 10, width: 200, height: 45))
        password.placeholder = "Password"
        password.title = "Password"
        password.titleColor = .white
        password.errorColor = UIColor.orange
        
        password.selectedTitle = "Password"
        password.selectedTitleColor = .white
        password.selectedLineColor = .white
        password.font = UIFont.fontAvenirMedium(ofSize: 18)
        
        password.textColor = .white
        password.isSecureTextEntry = true
        
        return password
    }()
    
    let loginRegisterButton: LoginJitterButton = {
        
        let button = LoginJitterButton(type: .system)
        //let button = UIButton(type: .system)
        button.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
        
        button.setTitle("L O G I N", for: .normal)
        button.setTitleColor(UIColor.white.withAlphaComponent(0.7), for: .normal)
        
        button.titleLabel?.font = UIFont(name: "GothamPro", size: 18)
        button.layer.cornerRadius = 25
        button.layer.masksToBounds = true
        button.layer.borderColor = UIColor.white.withAlphaComponent(0.7).cgColor
        button.layer.borderWidth = 1.4
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(self, action: #selector(handleLoginButton), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        
        let imageView = UIImageView(frame: self.view.bounds)
        imageView.image = UIImage(named: "bluegreen")
        self.view.addSubview(imageView)
        
        setupEmailTextField()
        setupPasswordField()
        setupLoginRegisterButton()
        
    }
    
    func handleLoginButton() {
        
        guard let email = emailTextField.text, let password = passwordField.text else {
            loginRegisterButton.jitter()
            return
        }
        
        guard let error = emailTextField.errorMessage, let error2 = passwordField.errorMessage else {
            loginRegisterButton.jitter()
            return
        }
        
        print(error, error2)
        
        print(emailTextField.text!)
        print(passwordField.text!)
        
/*
         insert Firebase Authentication here ...
*/
        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: {(user, error) in
            
            if error != nil {
                print(error!)
                return
            }
            
            print(user?.providerData as Any)
            print(user?.displayName as Any)
            
            // forcing user to be Admin!
            user1 = User(userid: self.emailTextField.text!, sessionid: "sessionID", type: .Admin)

            // successfully logged in our user! grant access
            verifyLoginAccess = true
            self.dismiss(animated: true, completion: nil)
            
        }) // end of FIRAuth
        
    } // end of function
    
    func setupLoginRegisterButton() {
        
        let width = self.view.bounds.width - 60
        
        self.view.addSubview(loginRegisterButton)
        _ = loginRegisterButton.anchor(self.view.bottomAnchor, left: self.view.leftAnchor, bottom: nil, right: nil, topConstant: -140, leftConstant: 30, bottomConstant: 0, rightConstant: 0, widthConstant: width, heightConstant: 50)
    }
    
    func setupEmailTextField() {
        
        self.emailTextField.delegate = self
        
        let width = self.view.bounds.width - 60
        
        self.view.addSubview(emailTextField)
        _ = emailTextField.anchor(self.view.centerYAnchor, left: self.view.leftAnchor, bottom: nil, right: nil, topConstant: -90, leftConstant: 30, bottomConstant: 0, rightConstant: 0, widthConstant: width, heightConstant: 60)
    }
    
    func setupPasswordField() {
        
        self.passwordField.delegate = self
        
        let width = self.view.bounds.width - 60
        
        self.view.addSubview(passwordField)
        
        _ = passwordField.anchor(self.view.centerYAnchor, left: self.view.leftAnchor, bottom: nil, right: nil, topConstant: -20, leftConstant: 30, bottomConstant: 0, rightConstant: 0, widthConstant: width, heightConstant: 60)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Implementing a method on the UITextFieldDelegate protocol. This will notify us when something has changed on the textfield
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if let floatingLabelTextField = textField as? SkyFloatingLabelTextField {
            
            if floatingLabelTextField.isSecureTextEntry == true {
                floatingLabelTextField.errorMessage = validateSkyPasswordTextField(skyFloatingTextField: floatingLabelTextField)
            } else {
                floatingLabelTextField.errorMessage = validateSkyFloatingTextField(skyFloatingTextField: floatingLabelTextField)
            }
            
        }
        return true
    }
    
    func validateSkyFloatingTextField(skyFloatingTextField: SkyFloatingLabelTextField) -> String {
        
        let text = skyFloatingTextField.text
        if ((text?.characters.count)! < 3 || !isValidEmailAddress(emailAddressString: text!)) {
            skyFloatingTextField.errorMessage = "Email is invalid"
        } else {
            // The error message will only disappear when we reset it to nil or empty string
            skyFloatingTextField.errorMessage = ""
        }
        
        return skyFloatingTextField.errorMessage!
    }
    
    func validateSkyPasswordTextField(skyFloatingTextField: SkyFloatingLabelTextField) -> String {
        
        let text = skyFloatingTextField.text
        if !isValidPassword(passwordString: text!) {
            skyFloatingTextField.errorMessage = "Password is invalid"
        } else {
            // The error message will only disappear when we reset it to nil or empty string
            skyFloatingTextField.errorMessage = ""
        }
        
        return skyFloatingTextField.errorMessage!
    }
    
    
    func isValidPassword(passwordString: String) -> Bool {
        var returnValue = true
        // must have 1 alpha and 1 number minimum of 8 char
        let passwordRegEx = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{7,}$"
        
        do {
            let regex = try NSRegularExpression(pattern: passwordRegEx)
            let nsString = passwordString as NSString
            let results = regex.matches(in: passwordString, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0
            {
                returnValue = false
            }
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        
        return returnValue
    }
    
    func isValidEmailAddress(emailAddressString: String) -> Bool {
        
        var returnValue = true
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = emailAddressString as NSString
            let results = regex.matches(in: emailAddressString, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0
            {
                returnValue = false
            }
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        
        return  returnValue
    }
/*
     Override keyboard to dismiss
*/
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        
        super.touchesBegan(touches, with: event)
    }
    
    
    
}
