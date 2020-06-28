//
//  LoginViewController.swift
//  Therapy
//
//  Created by Ivan Myrza on 13/06/2020.
//  Copyright © 2020 Ivan Myrza. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SigninViewController: UIViewController {

    // INSTANCE
    private var loginVM: LoginViewModel?
    
    // TF
    private var userNameTF: UITextField?
    private var passwordTF: UITextField?
    
    // DISPOSE BAG
    private var bag: DisposeBag?

    // BACK
    private var userNameBack: UIView?
    private var passwordBack: UIView?
    
    // BUTTON
    private var loginB: UIButton?
    
    // SCROLL VIEW
    let scrollView: UIScrollView? = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    // RESIZING VIEW
    let resizingView: UIView? = {
        let testView = UIView()
        testView.translatesAutoresizingMaskIntoConstraints = false
        return testView
    }()
    
    // VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        self.settings()
    }
    
    // SETTINGS
    func settings() {
        
        // BACK COLOR
        self.view.backgroundColor = UIColor(red: 0.961, green: 0.981, blue: 0.900, alpha: 1)
        
        // SCROLL VIEW
        ScrollView.setup(view: self.view, scrollView: self.scrollView!, resizingView: self.resizingView!, resizingViewTopAnchor: 1000)
        
        // HIDE NAV BAR
        self.navigationController?.navigationBar.isHidden = true
        
        // CLOSE BUTTON
        self.closeButton()
        
        // USER NAME TF
        self.usernameTF()
        
        // PASSWORD TF
        self.passWordTF()
        
        // LOGIN BUTTON
        self.loginButton()
        
        // BINDING
        self.binding()
    }
    

    // CLOSE BUTTON
    func closeButton() {
        let button = UIButton()
        guard let image = UIImage(named: "X_close") else { return }
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(popSigninVC), for: .touchUpInside)
        Constraints.widthHeightLeadingTop(superView: self.scrollView!, view: button, widthAnchor: 23, heightAnchor: 23, leadingAnchor: 18, topAnchor: 20)
    }
    
    // USER NAME TF
    func usernameTF() {
        
        // USER NAME BACK
        self.userNameBack = UIView()
        self.userNameBack?.layer.borderWidth = 1
        self.userNameBack?.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        self.userNameBack?.layer.cornerRadius = 15
        Constraints.heightLeadingTrailingTop(superView: self.view, view: userNameBack!, heightAnchor: 48, leadingAnchor: 16, trailingAnchor: -16, topAnchor: 60)
        
        // USER NAME TF
        self.userNameTF = UITextField()
        self.userNameTF?.placeholder = "username"
        Constraints.heightLeadingTrailingTop(superView: userNameBack!, view: self.userNameTF!, heightAnchor: 24, leadingAnchor: 16, trailingAnchor: -16, topAnchor: 12)
    }
    
    // PASSWORD TF
    func passWordTF() {
        
        // PASSWORD BACK
        self.passwordBack = UIView()
        self.passwordBack?.layer.borderWidth = 1
        self.passwordBack?.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        self.passwordBack?.layer.cornerRadius = 15
        Constraints.heightLeadingTrailingTop(superView: self.view, view: passwordBack!, heightAnchor: 48, leadingAnchor: 16, trailingAnchor: -16, topAnchor: 120)
        
        // PASSWORD TF
        self.passwordTF = UITextField()
        self.passwordTF?.placeholder = "password"
        Constraints.heightLeadingTrailingTop(superView: passwordBack!, view: passwordTF!, heightAnchor: 24, leadingAnchor: 16, trailingAnchor: -16, topAnchor: 12)
    }
    
    // LOGIN BUTTON
    func loginButton() {
        
        // LOG IN BUTTON
        loginB = UIButton()
        loginB?.setTitle("sign in", for: .normal)
        loginB?.titleLabel?.textAlignment = .center
        loginB?.layer.cornerRadius = 15
        loginB?.isEnabled = false
        loginB?.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        loginB?.backgroundColor = UIColor(red: 0.576, green: 0.602, blue: 0.520, alpha: 1)
        Constraints.heightLeadingTrailingTop(superView: self.view, view: loginB!, heightAnchor: 48, leadingAnchor: 16, trailingAnchor: -16, topAnchor: 180)
    }
    
    // BINDING
    func binding() {
        
        bag = DisposeBag()
        loginB = UIButton()
        loginVM = LoginViewModel()
        
        userNameTF!.becomeFirstResponder()
        
        userNameTF!.rx.text.map { $0 ?? "" }.bind(to: loginVM!.usernameText).disposed(by: bag!)
        passwordTF!.rx.text.map { $0 ?? "" }.bind(to: loginVM!.passwordText).disposed(by: bag!)
        
        loginVM?.isValid().bind(to: loginB!.rx.isEnabled).disposed(by: bag!)
        loginVM?.isValid().map { $0 ? 1 : 0.4 }.bind(to: loginB!.rx.alpha).disposed(by: bag!)

    }
}
