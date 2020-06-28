//
//  MainInterface.swift
//  Therapy
//
//  Created by Ivan Myrza on 13/06/2020.
//  Copyright © 2020 Ivan Myrza. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SignupInterface {
    
    // SUPERVIEW
    private var superView: UIView
    
    // INIT
    init(superView: UIView) {
        self.superView = superView
        self.setup()
    }
    
    //INSTANCE
    var nameTextField: TextField!
    var surnameTextField: TextField!
    var loginTextField: TextField!
    var passwordTextField: TextField!
    var repeatTextField: TextField!
    var datePicker: DatePicker!
    
    // TF
    var surnameTF: UITextField? = UITextField()
    var nameTF: UITextField?  = UITextField()
    var loginTF: UITextField?  = UITextField()
    var passwordTF: UITextField?  = UITextField()
    var repeatPasswordTF: UITextField?  = UITextField()
    var datePickerTF: UITextField?  = UITextField()
    
    // SAVE BUTTON
    let saveButton = UIButton()
    
    // INSTANCE
    var button: Button!
    var mainVM: SignupViewModel? = SignupViewModel()

    
    // SETTS
    func setup() {

        // NAME
        self.nameTextField = TextField(superView: superView, text: "Name", textField: nameTF!, top: 54)
        
        // SURNAME
        self.surnameTextField = TextField(superView: superView, text: "Surname", textField: surnameTF!, top: 100)
        
        // LOGIN TF
        self.loginTextField = TextField(superView: superView, text: "login", textField: loginTF!, top: 270)
        
        // PASSWORD TF
        self.passwordTextField = TextField(superView: superView, text: "password", textField: passwordTF!, top: 316)
        
        // REPEAD PASSWORD
        self.repeatTextField = TextField(superView: superView, text: "repeat password", textField: repeatPasswordTF!, top: 362)
        
        // DATE PICKER
        self.datePicker = DatePicker(superView: superView, textField: datePickerTF!, textFieldTitle: "", top: 242)
        
        // BIRDAY TITLE
        self.label(title: "Birthday", top: 242)
        
        // SAVE BUTTON
        self.button = Button(button: saveButton, superView: superView, top: 700, title: "Save")
    }
    
    // SAVE
    func save(image: UIImage) {
        mainVM?.save(name: self.nameTF?.text ?? "", surname: self.surnameTF?.text ?? "", image: image)
    }
    
    // TITLE
    private func label(title: String, top: CGFloat) {
        
        let label: UILabel? = UILabel()
        label?.font = UIFont(name: "Optima", size: 16)
        label?.text = title
        Constraints.leadingTopStretchableWidthHeight(superView: superView, view: label!, leadingAnchor: 24, topAnchor: top, widthAnchor: 10, heightAnchor: 19)
    }
}
