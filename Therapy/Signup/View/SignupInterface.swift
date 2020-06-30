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

class SignupInterface: NSObject {
    
    // SUPERVIEW
    private var superView: UIView
    private var viewController: UIViewController
    
    // INIT
    init(superView: UIView, viewController: UIViewController) {
        self.viewController = viewController
        self.superView = superView
        super.init()
        self.setup()
    }
    
    //INSTANCE
    private var loginTextField: PasswordTextField!
    private var passwordTextField: PasswordTextField!
    private var repeatTextField: PasswordTextField!
    private var childNameTextField: TextField!
    
    // PICKER
    private var datePicker: DatePicker!
    
    // PARTICIPANT
    private var participantTop: CGFloat = 386
    private var participant: [Participant] = []
    private var nameTF: [UITextField] = []
    private var surnameTF: [UITextField] = []
    
    // DELETE BUTTON ARRAY
    private var deleteButtonArray: [UIButton] = []
    
    
    
    // TF
    var loginTF: UITextField? = UITextField()
    var passwordTF: UITextField? = UITextField()
    var repeatPasswordTF: UITextField? = UITextField()
    var datePickerTF: UITextField? = UITextField()
    private var childNameTF: UITextField? = UITextField()
    
    
    // SAVE BUTTON
    var saveButton: UIButton? = UIButton()
    
    // INSTANCE
    private var button: Button!
    private var mainVM: SignupViewModel? = SignupViewModel()

    
    // SETTS
    func setup() {

        // CHILD'S NAME
        self.childNameTextField = TextField(superView: superView, text: "Child's name", textField: childNameTF!, top: 152)
        
        // CHILD'S BIRDAY TITLE
        self.title(title: "Child's birthday", top: 198)
        
        // DATE PICKER
        self.datePicker = DatePicker(superView: superView, textField: datePickerTF!, textFieldTitle: "", top: 198)
        
        // LOGIN TF
        self.loginTextField = PasswordTextField(superView: superView, text: "login", textField: loginTF!, top: 227)
        
        // PASSWORD TF
        self.passwordTextField = PasswordTextField(superView: superView, text: "password", textField: passwordTF!, top: 273)
        
        // REPEAD PASSWORD
        self.repeatTextField = PasswordTextField(superView: superView, text: "repeat password", textField: repeatPasswordTF!, top: 319)
        
        // LINE SEPARATOR
        self.lineSeparator(top: 370)
        
        // PARTICIPANTS TITLE
        self.title(title: "PARTICIPANTS", top: 386)
        
        
        
        
        
    
        // AVATAR
        self.avatar(nil)
        
        // SAVE BUTTON
        self.button = Button(button: saveButton!, superView: superView, top: 1200, title: "Save")
        
        var index = 0
        
        for button in deleteButtonArray {
            button.addTarget(self, action: #selector(deleteParticipant(sender:)), for: .touchUpInside)
            button.tag = index
            index += 1
        }
        
        
    }
    
    @objc func tester() {
        print("tester")
    }
    
    
    // SAVE
    func save(image: UIImage) {
//        mainVM?.save(name: self.nameTF?.text ?? "", surname: self.surnameTF?.text ?? "", image: image)
        
        
    }
    
    // TITLE
    private func title(title: String, top: CGFloat) {
        
        let label: UILabel? = UILabel()
        label?.font = UIFont(name: "Optima", size: 16)
        label?.text = title
        Constraints.leadingTopStretchableWidthHeight(superView: superView, view: label!, leadingAnchor: 24, topAnchor: top, widthAnchor: 10, heightAnchor: 19)
    }
    
    // AVATAR
    private func avatar(_ image: UIImage?) {
        
        let avatar: UIButton? = UIButton()
        avatar?.layer.cornerRadius = 15
        avatar?.layer.borderWidth = 0.1
        avatar?.layer.borderColor = UIColor(red: 0.222, green: 0.1, blue: 0.14, alpha: 1).cgColor
        avatar?.clipsToBounds = true
        if image != nil {
            avatar?.setImage(image, for: .normal)
        } else {
            let photoIcon: UIImageView? = UIImageView()
            guard let image = UIImage(named: "camera3") else {return}
            photoIcon?.image = image
            photoIcon?.alpha = 0.5
            Constraints.widthHeightLeadingTop(superView: avatar!, view: photoIcon!, widthAnchor: 31, heightAnchor: 25, leadingAnchor: 29, topAnchor: 31)
        }
        avatar?.addTarget(self, action: #selector(openPickerController), for: .touchUpInside)
        Constraints.widthHeightLeadingTop(superView: superView, view: avatar!, widthAnchor: 90, heightAnchor: 90, leadingAnchor: 16, topAnchor: 976)

    }
    
    // LINE SEPARATOR
    private func lineSeparator(top: CGFloat) {
        let line: UIView? = UIView()
        line?.backgroundColor = .lightGray
        Constraints.heightLeadingTrailingTop(superView: superView, view: line!, heightAnchor: 1, leadingAnchor: 16, trailingAnchor: -16, topAnchor: top)
    }
    
    // ADD PARTICIPANT BUTTON
    func addParticipantB() {
        
        let button = UIButton()
        guard let image = UIImage(named: "AddButton2") else {return}
        button.setImage(image, for: .normal)
        button.alpha = 0.8
        button.addTarget(self, action: #selector(addParticipant), for: .touchUpInside)
        Constraints.widthHeightTrailingTop(superView: superView, view: button, widthAnchor: 26, heightAnchor: 26, trailingAnchor: -16, topAnchor: 18)
    }
    
    
    
    
    
    @objc private func addParticipant() {
        
        self.nameTF.append(UITextField())
        self.surnameTF.append(UITextField())
        self.deleteButtonArray.append(UIButton())
        
    
        self.participant.append(Participant(superView: superView, top: participantTop, nameTF: nameTF[participant.count], surnameTF: surnameTF[participant.count], deleteParticipantB: deleteButtonArray[participant.count]))
            
        participantTop += 132
        
        self.deleteButtonArray[0].addTarget(self, action: #selector(deleteParticipant), for: .touchUpInside)

    }
    
    // DELETE PARTICIPANT
    @objc private func deleteParticipant(sender: UIButton) {
        self.participant.remove(at: sender.tag)
        print(participant)
    }
}

    // IMAGE PICKER CONFIGURATIONS
extension SignupInterface: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
   
    @objc func openPickerController() {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        picker.delegate = self
        viewController.present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.editedImage] as? UIImage {
            self.avatar(image)
            picker.dismiss(animated: true)
        }
    }
}
