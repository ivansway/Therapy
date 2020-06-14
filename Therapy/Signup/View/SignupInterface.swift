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
    
    //INSTANCE
    var nameTextField: TextField!
    var surnameTextField: TextField!
    var loginTextField: TextField!
    var passwordTextField: TextField!
    var repeatTextField: TextField!
    var datePicker: DatePicker!
    
    // TF
    let surnameTF = UITextField()
    let nameTF = UITextField()
    let loginTF = UITextField()
    let passwordTF = UITextField()
    let repeatPasswordTF = UITextField()
    let datePickerTF = UITextField()
    
    
    let saveButton = UIButton()
    
    // INSTANCE
    var button: Button!
    let mainVM = SignupViewModel()

    
    // SETTS
    func setts(superView: UIView) { 

        // NAME
        self.nameTextField = TextField(superView: superView, text: "Name", textField: nameTF, top: 60)
        
        // SURNAME
        self.surnameTextField = TextField(superView: superView, text: "Surname", textField: surnameTF, top: 120)
        
        // LOGIN TF
        self.loginTextField = TextField(superView: superView, text: "login", textField: loginTF, top: 400)
        
        // PASSWORD TF
        self.passwordTextField = TextField(superView: superView, text: "password", textField: passwordTF, top: 460)
        
        // REPEAD PASSWORD
        self.repeatTextField = TextField(superView: superView, text: "repeat password", textField: repeatPasswordTF, top: 520)
        
        // DATE PICKER
        self.datePicker = DatePicker(superView: superView, textField: datePickerTF, textFieldTitle: "", top: 330)
        
        // SAVE BUTTON
        self.button = Button(button: saveButton, superView: superView, top: 700, title: "Save")
    }
    
    // SAVE
    func save(image: UIImage) {
        mainVM.save(name: self.nameTF.text ?? "", surname: self.surnameTF.text ?? "", image: image)
    }
    
    func setup() {
        
    }
}
