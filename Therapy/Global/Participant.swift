//
//  Participant.swift
//  Therapy
//
//  Created by Ivan Myrza on 30/06/2020.
//  Copyright © 2020 Ivan Myrza. All rights reserved.
//

import UIKit

class Participant: NSObject, ParticipantProtocol {
    
    internal var surname: String
    internal var name: String
    internal var birthday: String
    internal var image: UIImage
    
    internal static var signupVM: SignupViewModel? = SignupViewModel()
    
    
    internal var surnameTF: UITextField
    internal var nameTF: UITextField
    internal var birthdayPickerTF: UITextField
    
    internal var nameTextField: TextField!
    internal var surnameTextField: TextField!
    internal var deleteParticipantB: UIButton
    internal var birthdayPicker: DatePicker!
    
    internal var back: UIView
    internal var superView: UIView
    internal var viewController: UIViewController
    
    internal var top: CGFloat
    internal var imageIndex: Int
    
    required init(surnameTF: UITextField,
                  nameTF: UITextField,
                  birthdayPickerTF: UITextField,
                  superView: UIView,
                  top: CGFloat,
                  imageIndex: Int,
                  viewController: UIViewController,
                  deleteParticipantB: UIButton,
                  surname: String,
                  name: String,
                  birthday: String,
                  image: UIImage,
                  back: UIView)
    {
        self.surnameTF = surnameTF
        self.nameTF = nameTF
        self.birthdayPickerTF = birthdayPickerTF
        self.superView = superView
        self.top = top
        self.imageIndex = imageIndex
        self.viewController = viewController
        self.deleteParticipantB = deleteParticipantB
        self.surname = surname
        self.name = name
        self.birthday = birthday
        self.image = image
        self.back = back
        super.init()
        setup()
    }
    
    
    internal func setup() {
        
        // BACK
        Constraints.heightLeadingTrailingTop(superView: superView, view: back, heightAnchor: 200, leadingAnchor: 16, trailingAnchor: -16, topAnchor: top)
        
        // NAME
        self.nameTextField = TextField(superView: back, text: "Name", textField: nameTF, top: 50)
        
        // SURNAME
        self.surnameTextField = TextField(superView: back, text: "Surname", textField: surnameTF, top: 96)
        
        // PARTICIPANT'S BIRTHDAY TITLE
        self.title(title: "Birthday", top: 25)
        
        // PARTICIPANT'S BIRTHDAY PICKER
        self.birthdayPicker = DatePicker(superView: back, textField: birthdayPickerTF, textFieldTitle: "", top: 25)
        
        // DELETE PARTICIPANT
        deleteParticipant()
        
        // SETUP USER LAUNCH DATA
        setupUserData()
    }
    
    // SETUP USER LAUNCH DATA
    internal func setupUserData() {
        self.surnameTF.text = surname
        self.nameTF.text = name
        self.birthdayPickerTF.text = birthday
        self.avatar(self.image)
    }
    
    // TITLE
    internal func title(title: String, top: CGFloat) {
        let label: UILabel? = UILabel()
        label?.font = UIFont(name: "Optima", size: 16)
        label?.text = title
        Constraints.leadingTopStretchableWidthHeight(superView: back, view: label!, leadingAnchor: 8, topAnchor: top, widthAnchor: 10, heightAnchor: 19)
    }
    
    // DELETE PARTICIPANT
    internal func deleteParticipant() {
        
        // MINUS
        let minus: UIView? = UIView()
        minus?.layer.borderWidth = 1
        minus?.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        minus?.layer.cornerRadius = 3
        Constraints.widthHeightTrailingTop(superView: back, view: minus!, widthAnchor: 25, heightAnchor: 6, trailingAnchor: -16, topAnchor: 29)
        
        // DELETE PARTICIPANT BUTTON
        Constraints.widthHeightTrailingTop(superView: back, view: deleteParticipantB, widthAnchor: 30, heightAnchor: 30, trailingAnchor: -16, topAnchor: 25)
    }
    
    // AVATAR
    internal func avatar(_ image: UIImage?) {
        
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
            Constraints.widthHeightLeadingTop(superView: avatar!, view: photoIcon!, widthAnchor: 31, heightAnchor: 25, leadingAnchor: 26, topAnchor: 27)
        }
        avatar?.addTarget(self, action: #selector(openPickerController), for: .touchUpInside)
        Constraints.widthHeightTrailingTop(superView: back, view: avatar!, widthAnchor: 82, heightAnchor: 82, trailingAnchor: 0, topAnchor: 50)
        
    }
}

// IMAGE PICKER CONFIGURATIONS
extension Participant: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @objc internal func openPickerController() {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        picker.delegate = self
        self.viewController.present(picker, animated: true)
    }
    
    internal func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.editedImage] as? UIImage {
            self.avatar(image)
            Participant.signupVM!.participantImage.append(Participant.signupVM!.imageToData(image: image))
            
            picker.dismiss(animated: true)
        }
    }
}
