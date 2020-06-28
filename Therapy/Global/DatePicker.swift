//
//  DatePicker.swift
//  Therapy
//
//  Created by Ivan Myrza on 14/06/2020.
//  Copyright © 2020 Ivan Myrza. All rights reserved.
//

import UIKit

class DatePicker: NSObject, UITextFieldDelegate {
    
    private var superView: UIView
    private var textField: UITextField
    private var textFieldTitle: String
    private var top: CGFloat
    private var datePicker = UIDatePicker()
    
    init(superView: UIView, textField: UITextField, textFieldTitle: String, top: CGFloat) {
        self.superView = superView
        self.textField = textField
        self.textFieldTitle = textFieldTitle
        self.top = top
        super.init()
        setup()
    }
    
    private func setup() {
        
        // NOT CHOOSED TF SIGN
        if textField.text == "" {
            textField.text = "not choosed"
        }
        
        // TF
        textField.delegate = self
        textField.textAlignment = .right
        textField.textColor = UIColor(red: 0.188, green: 0.188, blue: 0.188, alpha: 1)
        textField.font = UIFont(name: "Optima", size: 16)
        Constraints.widthHeightTrailingTop(superView: superView, view: textField, widthAnchor: 155, heightAnchor: 19, trailingAnchor: -24, topAnchor: top)
        
        // PICKER ARROW
        let arrow = UIButton()
        Constraints.widthHeightTrailingTop(superView: superView, view: arrow, widthAnchor: 6.5, heightAnchor: 13, trailingAnchor: -16, topAnchor: top + 3)
        
        // DATE PICKER
        self.showDatePicker(textField: textField, superView: superView)
    }
    
    private func showDatePicker(textField: UITextField, superView: UIView) {
        
        // LOCALE
        guard let localeID = Locale.preferredLanguages.first else { return }
        datePicker.locale = Locale(identifier: localeID)
        
        // DATE PICKER MODE
        datePicker.datePickerMode = .date
        
        // TOOLBAR
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        toolbar.backgroundColor = UIColor(red: 0.186, green: 0.146, blue: 0.044, alpha: 1)
    
        
        // ITEMS
        let cancelButton: BarButtonItem? = BarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelAction))
        let flexSpace: BarButtonItem? = BarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let doneButton: BarButtonItem? = BarButtonItem(title: "Done", style: .done, target: self, action: #selector(done))
        
        // SUPER VIEW TF INITs
        doneButton?.superView = superView
        doneButton?.textField = textField
        
        
        // DONE BUTTON COLOR
        doneButton?.setTitleTextAttributes([NSAttributedString.Key.foregroundColor :UIColor(red: 1, green: 1, blue: 1, alpha: 1),NSAttributedString.Key.font:UIFont.init(name: "Copperplate", size: 20) as Any], for: .normal)

        // CANCEL BUTTON COLOR
        cancelButton?.setTitleTextAttributes([NSAttributedString.Key.foregroundColor :UIColor(red: 0.186, green: 0.146, blue: 0.044, alpha: 1),NSAttributedString.Key.font:UIFont.init(name: "Copperplate", size: 20) as Any], for: .normal)
        
        
        toolbar.setItems([cancelButton!, flexSpace!, doneButton!], animated: false)
        
        textField.inputAccessoryView = toolbar
        textField.inputView = datePicker
    }
    
    // DONE
    @objc private func done(sender: BarButtonItem) {
        
        let formatter: DateFormatter? = DateFormatter()
        formatter?.dateFormat = "d MMMM yyyy"
        let text: String? = formatter?.string(from: datePicker.date)
        sender.textField?.text = text
        
        // DISMISS PICKER
        sender.superView?.endEditing(true)
    }
    
    // CANCEL
    @objc private func cancelAction(sender: BarButtonItem) {
        // DISMISS PICKER
        self.superView.endEditing(true)
    }
    
    // TF DELEGATE
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return false
    }
}

// HELPER
class BarButtonItem: UIBarButtonItem {
    var superView: UIView? = UIView()
    var textField: UITextField? = UITextField()
}
