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
    internal var superView: UIView
    private var viewController: UIViewController
    
    // INIT
    public init(superView: UIView, viewController: UIViewController) {
        self.viewController = viewController
        self.superView = superView
        self.setup()
    }
    
    //INSTANCE
    private var loginTextField: PasswordTextField!
    private var passwordTextField: PasswordTextField!
    private var repeatTextField: PasswordTextField!
    private var childNameTextField: TextField!
    internal var signupVM: SignupViewModel? = SignupViewModel()
    
    // PICKER
    private var datePicker: DatePicker!
    
    // PARTICIPANT ARRAY
    private var participantTop: CGFloat = 390
    
    private var participant: [Participant] = []
    
    // PARTICIPANT's NAME
    internal var birthdayTFArray: [UITextField] = []
    internal var nameTF: [UITextField] = []
    internal var surnameTF: [UITextField] = []
    
    // DELETE BUTTON ARRAY
    private var deleteButtonArray: [UIButton] = []
    
    // PARTICIPANT BACK ARRAY
    private var participantBack: [UIView] = []
    
    // DISPOSE
    internal let bag = DisposeBag()
    
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
        
        // FETCH PARTICIPANT
        self.fetchParticipant()
        
        
        // SAVE BUTTON
        self.button = Button(button: saveButton!, superView: superView, top: 1200, title: "Save")
        
        
        var index = 0
        
        for button in deleteButtonArray {
            button.addTarget(self, action: #selector(deleteParticipant(sender:)), for: .touchUpInside)
            button.tag = index
            index += 1
        }
        
    }
    
    
    
    
    // SAVE CHILD
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
    

    // ADD PARTICIPANT
    @objc private func addParticipant() {
        
        // CONSTRUCT ARRAY
        signupVM!.constructArray()
        
        // TAG
        let tag = signupVM!.tag
        
        self.participant.append(Participant(surnameTF: self.signupVM!.surnameTF[tag],
                                            nameTF: self.signupVM!.nameTF[tag],
                                            birthdayPickerTF: self.signupVM!.birthdayTFArray[tag],
                                            superView: self.superView,
                                            top: self.participantTop,
                                            imageIndex: tag,
                                            viewController: self.viewController,
                                            deleteParticipantB: self.signupVM!.deleteButtonArray[tag],
                                            surname: "",
                                            name: "",
                                            birthday:  "",
                                            image: UIImage(),
                                            back: self.signupVM!.participantBack[tag]))
        
        participantTop += 132

    }
    
    
    // DELETE PARTICIPANT
    @objc private func deleteParticipant(sender: UIButton) {
        
        self.participantBack[sender.tag].removeFromSuperview()
        
        participant.remove(at: sender.tag)
        
        
        for item in participant {
            item.top = participantTop
            participantTop += 132
        }
    }
    
    // FETCH PARTICIPANTS
    private func fetchParticipant() {
        
        // TAG
        let tag = signupVM!.tag

                
        Observable
            .from(signupVM!.member)
            .subscribe(onNext: { member in
                
                 // CONSTRUCT ARRAY
                for _ in member { self.signupVM!.constructArray() }
                
                self.participant.append(Participant(surnameTF: self.signupVM!.surnameTF[tag],
                                                  nameTF: self.signupVM!.nameTF[tag],
                                                  birthdayPickerTF: self.signupVM!.birthdayTFArray[tag],
                                                  superView: self.superView,
                                                  top: self.participantTop,
                                                  imageIndex: tag,
                                                  viewController: self.viewController,
                                                  deleteParticipantB: self.signupVM!.deleteButtonArray[tag],
                                                  surname: member["surname"] as? String ?? "",
                                                  name: member["name"] as? String ?? "",
                                                  birthday: member["birthday"] as? String ?? "",
                                                  image: member["image"] as? UIImage ?? UIImage(),
                                                  back: self.signupVM!.participantBack[tag]))
 
                
            }).disposed(by: bag)
    }
}



