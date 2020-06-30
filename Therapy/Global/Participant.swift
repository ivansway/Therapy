//
//  Participant.swift
//  Therapy
//
//  Created by Ivan Myrza on 30/06/2020.
//  Copyright © 2020 Ivan Myrza. All rights reserved.
//

import UIKit

class Participant {
    
    // TF
    private var surnameTF: UITextField
    private var nameTF: UITextField
    private var birthdayPickerTF: UITextField? = UITextField()
    private var nameTextField: TextField!
    private var surnameTextField: TextField!
    
    private var back: UIView? = UIView()
    private var superView: UIView
    
    private var top: CGFloat
    
    // BUTTON
    let deleteParticipantB: UIButton
    
    // PICKER
    private var birthdayPicker: DatePicker!
    
    init(superView: UIView, top: CGFloat, nameTF: UITextField, surnameTF: UITextField, deleteParticipantB: UIButton) {
        self.superView = superView
        self.top = top
        self.nameTF = nameTF
        self.surnameTF = surnameTF
        self.deleteParticipantB = deleteParticipantB
        self.setup()
    }
    
    private func setup() {
        
        // BACK
        Constraints.heightLeadingTrailingTop(superView: superView, view: back!, heightAnchor: 200, leadingAnchor: 16, trailingAnchor: -16, topAnchor: top)
        
        // NAME
        self.nameTextField = TextField(superView: back!, text: "Name", textField: nameTF, top: 25)
        
        // SURNAME
        self.surnameTextField = TextField(superView: back!, text: "Surname", textField: surnameTF, top: 71)
        
        // PARTICIPANT'S BIRTHDAY TITLE
        self.title(title: "Birthday", top: 117)
        
        // PARTICIPANT'S BIRTHDAY PICKER
        self.birthdayPicker = DatePicker(superView: back!, textField: birthdayPickerTF!, textFieldTitle: "", top: 117)
        
        // DELETE PARTICIPANT
        deleteParticipant()
    }
    
    // TITLE
    private func title(title: String, top: CGFloat) {
        let label: UILabel? = UILabel()
        label?.font = UIFont(name: "Optima", size: 16)
        label?.text = title
        Constraints.leadingTopStretchableWidthHeight(superView: back!, view: label!, leadingAnchor: 24, topAnchor: top, widthAnchor: 10, heightAnchor: 19)
    }
    
    // DELETE PARTICIPANT
    private func deleteParticipant() {
        deleteParticipantB.layer.borderWidth = 1
        deleteParticipantB.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        deleteParticipantB.layer.cornerRadius = 3
        Constraints.widthHeightTrailingTop(superView: back!, view: deleteParticipantB, widthAnchor: 25, heightAnchor: 6, trailingAnchor: -16, topAnchor: 5)
    }
}

