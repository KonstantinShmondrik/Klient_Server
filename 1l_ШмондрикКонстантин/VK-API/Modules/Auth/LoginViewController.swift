//
//  LoginViewController.swift
//  VK_ШмондрикКонстантин
//
//  Created by Константин Шмондрик on 15.01.2022.
//

import UIKit
import Firebase
import RealmSwift

class LoginViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var loginImput: UITextField!
    @IBOutlet weak var paswordImput: UITextField!
    private let authServise = Auth.auth()
    private var token: AuthStateDidChangeListenerHandle!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        scrollView?.addGestureRecognizer(hideKeyboardGesture)
        
        token = authServise.addStateDidChangeListener({ auth, user in
            
            guard user != nil else {return}
            self.showAuthViewController()
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    //        override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
    //
    //            return true
    //        }
    
    @objc func keyboardWasShown (notification: Notification) {
        
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        
        self.scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    @objc func keyboardWillBeHidden(notification: Notification) {
        
        let contentInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
    }
    
    @objc func hideKeyboard() {
        
        self.scrollView?.endEditing(true)
    }
    
    @IBAction func logInButton(_ sender: Any?) {
        guard let logIn = loginImput.text, loginImput.hasText,
              let pasword = paswordImput.text, paswordImput.hasText
        else { showAlert(title: "Ошибка", messege: "Введите логин или пароль")
            return
        }
        authServise.signIn(withEmail: logIn, password: pasword) { AuthResult, error in
            if let error = error{
                self.showAlert(title: "Ошибка", messege: error.localizedDescription)
                return
            }
            self.showAuthViewController()
        }
    }
    
    @IBAction func SignUpButton(_ sender: Any) {
        guard let logIn = loginImput.text, loginImput.hasText,
              let pasword = paswordImput.text, paswordImput.hasText
        else { showAlert(title: "Ошибка", messege: "Введите логин или пароль")
            return
        }
        authServise.createUser(withEmail: logIn, password: pasword) {AuthResult, error in
            if let error = error{
                self.showAlert(title: "Ошибка", messege: error.localizedDescription)
                return
            }
            self.logInButton(nil)
        }
    }
    
    private func showAlert(title: String, messege: String){
        let alert = UIAlertController(title: title, message: messege, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true,completion: nil)
    }
    
    private func showAuthViewController(){
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "AuthNavigationController") else {return}
        guard let window = self.view.window else {return}
        window.rootViewController = vc
    }
    
}
