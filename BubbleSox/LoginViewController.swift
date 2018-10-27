//
//  LoginViewController.swift
//  BubbleSox
//
//  Created by Zulwiyoza Putra on 27/10/18.
//  Copyright © 2018 Zulwiyoza Putra. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var contentViewBottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        setKeyboardObserver()
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
}


extension LoginViewController {
    private func setUpViews() {
        signInButton.layer.cornerRadius = 8.0
        signUpButton.layer.cornerRadius = 8.0
        signUpButton.layer.borderColor = #colorLiteral(red: 0, green: 0.4798666835, blue: 0.9984790683, alpha: 1)
        signUpButton.layer.borderWidth = 1.0
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return false
    }
}

extension LoginViewController: KeyboardObservable {
    func setKeyboardObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(LoginViewController.keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(LoginViewController.keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_ sender: Notification) {
        guard let userInfo = sender.userInfo else {
            return
        }
        
        guard let keyboardFrameValue = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {
            return
        }
        
        let keyboardFrame = keyboardFrameValue.cgRectValue
        let distance = keyboardFrame.size.height
        self.contentViewBottomConstraint.constant = -distance
    }
    
    @objc func keyboardWillHide(_ sender: Notification) {
        self.contentViewBottomConstraint.constant = 0
    }
}





