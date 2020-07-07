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
    private var datePicker: UIDatePicker? = UIDatePicker()
    private var arrow: UIImageView? = UIImageView()
    
    
    init(superView: UIView, textField: UITextField, textFieldTitle: String, top: CGFloat) {
        
        self.superView = superView
        self.textField = textField
        self.textFieldTitle = textFieldTitle
        self.top = top
        super.init()
        setup()
    }
    
    private func setup() {
        
        // ARROW
        guard let arrowImage = UIImage(named: "arrow2") else {return}
        arrow?.image = arrowImage
        arrow?.alpha = 0.4
        Constraints.widthHeightTrailingTop(superView: superView, view: arrow!, widthAnchor: 7, heightAnchor: 15, trailingAnchor: -92, topAnchor: top + 2)
        
        // TF
        textField.delegate = self
        textField.textAlignment = .left
        textField.textColor = UIColor(red: 0.188, green: 0.188, blue: 0.188, alpha: 1)
        textField.font = UIFont(name: "Optima", size: 16)
        Constraints.trailingTopStretchableWidthHeight(superView: superView, view: textField, trailing: -108, top: top, width: textField.intrinsicContentSize.width + 40, height: 19)
        
        // DATE PICKER
        self.showDatePicker(textField: textField, superView: superView)
    }
    
    private func showDatePicker(textField: UITextField, superView: UIView) {
        
        // LOCALE
        guard let localeID = Locale.preferredLanguages.first else { return }
        datePicker?.locale = Locale(identifier: localeID)
        
        // DATE PICKER MODE
        datePicker?.datePickerMode = .date
        
        // TOOLBAR
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        toolbar.backgroundColor = UIColor(red: 0.186, green: 0.146, blue: 0.044, alpha: 1)
    
        
        // ITEMS
        let cancelButton: UIBarButtonItem? = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancel))
        let flexSpace: UIBarButtonItem? = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let doneButton: UIBarButtonItem? = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(done))
        
        
        // DONE BUTTON COLOR
        doneButton?.setTitleTextAttributes([NSAttributedString.Key.foregroundColor :UIColor(red: 1, green: 1, blue: 1, alpha: 1),NSAttributedString.Key.font:UIFont.init(name: "Copperplate", size: 20) as Any], for: .normal)

        // CANCEL BUTTON COLOR
        cancelButton?.setTitleTextAttributes([NSAttributedString.Key.foregroundColor :UIColor(red: 0.186, green: 0.146, blue: 0.044, alpha: 1),NSAttributedString.Key.font:UIFont.init(name: "Copperplate", size: 20) as Any], for: .normal)
        
        
        toolbar.setItems([cancelButton!, flexSpace!, doneButton!], animated: false)
        
        textField.inputAccessoryView = toolbar
        textField.inputView = datePicker
    }
    
    // DONE
    @objc private func done() {
        
        let formatter: DateFormatter? = DateFormatter()
        formatter?.dateFormat = "d MMMM yyyy"
        let text: String? = formatter?.string(from: datePicker!.date)
        textField.text = text
        
        // DISMISS PICKER
        superView.endEditing(true)
    }
    
    // CANCEL
    @objc private func cancel() {
        // DISMISS PICKER
        self.superView.endEditing(true)
    }
    
    // TF DELEGATE
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return false
    }
}
