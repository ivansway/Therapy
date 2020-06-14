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

class SiginViewController: UIViewController {

    // INSTANCE
    private var loginVM = LoginViewModel()
    let disposeBag = DisposeBag()
    
    // TF
    let userNameTF = UITextField()
    let passwordTF = UITextField()

    // BACK
    let userNameBack = UIView()
    let passwordBack = UIView()
    
    // BUTTON
    let loginButton = UIButton()
    
    // SCROLL VIEW
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    // RESIZING VIEW
    let resizingView: UIView = {
        let testView = UIView()
        testView.translatesAutoresizingMaskIntoConstraints = false
        return testView
    }()
    
    // VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        self.settings()
        self.binding()
    }
    
    // SETTINGS
    func settings() {
        
        // BACK COLOR
        self.view.backgroundColor = UIColor(red: 0.961, green: 0.981, blue: 0.900, alpha: 1)
        
        // SCROLL VIEW
        ScrollView.setup(view: self.view, scrollView: self.scrollView, resizingView: self.resizingView, resizingViewTopAnchor: 1000)
        
        // HIDE NAV BAR
        self.navigationController?.navigationBar.isHidden = true
        
        // CLOSE BUTTON
        self.close()
        
        // USER NAME BACK
        self.userNameBack.layer.borderWidth = 1
        self.userNameBack.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        self.userNameBack.layer.cornerRadius = 15
        Constraints.heightLeadingTrailingTop(superView: self.view, view: userNameBack, heightAnchor: 48, leadingAnchor: 16, trailingAnchor: -16, topAnchor: 60)

        // USER NAME TF
        self.userNameTF.placeholder = "username"
        Constraints.heightLeadingTrailingTop(superView: userNameBack, view: userNameTF, heightAnchor: 24, leadingAnchor: 16, trailingAnchor: -16, topAnchor: 12)
        
        
        // PASSWORD BACK
        self.passwordBack.layer.borderWidth = 1
        self.passwordBack.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        self.passwordBack.layer.cornerRadius = 15
        Constraints.heightLeadingTrailingTop(superView: self.view, view: passwordBack, heightAnchor: 48, leadingAnchor: 16, trailingAnchor: -16, topAnchor: 120)
        
        // PASSWORD TF
        self.passwordTF.placeholder = "password"
        Constraints.heightLeadingTrailingTop(superView: passwordBack, view: passwordTF, heightAnchor: 24, leadingAnchor: 16, trailingAnchor: -16, topAnchor: 12)
        
        // LOG IN BUTTON
        loginButton.setTitle("sign in", for: .normal)
        loginButton.titleLabel?.textAlignment = .center
        loginButton.layer.cornerRadius = 15
        loginButton.isEnabled = false
        loginButton.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        loginButton.backgroundColor = UIColor(red: 0.576, green: 0.602, blue: 0.520, alpha: 1)
        Constraints.heightLeadingTrailingTop(superView: self.view, view: loginButton, heightAnchor: 48, leadingAnchor: 16, trailingAnchor: -16, topAnchor: 180)
    }
    
    // CLOSE BUTTON
    func close() {
        let button = UIButton()
        guard let image = UIImage(named: "X_close") else { return }
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(popSiginVC), for: .touchUpInside)
        Constraints.widthHeightLeadingTop(superView: self.scrollView, view: button, widthAnchor: 23, heightAnchor: 23, leadingAnchor: 18, topAnchor: 20)
    }
    
    
    func binding() {
        
        userNameTF.becomeFirstResponder()
        
        userNameTF.rx.text.map { $0 ?? "" }.bind(to: loginVM.usernameText).disposed(by: disposeBag)
        passwordTF.rx.text.map { $0 ?? "" }.bind(to: loginVM.passwordText).disposed(by: disposeBag)
        
        loginVM.isValid().bind(to: loginButton.rx.isEnabled).disposed(by: disposeBag)
        loginVM.isValid().map { $0 ? 1 : 0.4 }.bind(to: loginButton.rx.alpha).disposed(by: disposeBag)
    }
}
