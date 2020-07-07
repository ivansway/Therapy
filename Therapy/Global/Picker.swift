//
//  Picker.swift
//  Therapy
//
//  Created by Ivan Myrza on 17/06/2020.
//  Copyright © 2020 Ivan Myrza. All rights reserved.
//

import UIKit

class Picker: NSObject, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
        
    // VARIABLE TF
    private var textField: UITextField
    private var superView: UIView
    private var top: CGFloat
    private var array: [String]
    private var picker: UIPickerView? = UIPickerView()
    private var pickedNumber = ""
    
    public init(superView: UIView, textField: UITextField, array: [String], top: CGFloat) {
        self.superView = superView
        self.textField = textField
        self.array = array
        self.top = top
        super.init()
        settings()
    }
    
    // SETTINGS
    private func settings() {

        // DELEGATE
        self.picker?.delegate = self
        self.picker?.dataSource = self
        
        // TF
        textField.delegate = self
        textField.text = "Choose option"
        textField.textAlignment = .right
        textField.font = UIFont(name: "Optima", size: 18)
        superView.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.topAnchor.constraint(equalTo: superView.topAnchor, constant: top).isActive = true
        textField.trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: -16).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 20).isActive = true
        textField.widthAnchor.constraint(greaterThanOrEqualToConstant: 20).isActive = true
        Constraints.widthHeightTrailingTop(superView: superView, view: textField, widthAnchor: 170, heightAnchor: 20, trailingAnchor: -16, topAnchor: top)
        
        // TOOLBAR
        let toolbar: UIToolbar? = UIToolbar()
        toolbar?.backgroundColor = UIColor(red: 0.186, green: 0.146, blue: 0.044, alpha: 1)
        toolbar?.sizeToFit()
        
        
        // ITEMS
        let cancelButton: UIBarButtonItem? = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancel))
        let flexSpace: UIBarButtonItem? = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let doneButton: UIBarButtonItem? = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(done))
        
        
        // DONE BUTTON COLOR
        doneButton?.setTitleTextAttributes([NSAttributedString.Key.foregroundColor :UIColor(red: 1, green: 1, blue: 1, alpha: 1),NSAttributedString.Key.font:UIFont.init(name: "Copperplate", size: 20) as Any], for: .normal)

        // CANCEL BUTTON COLOR
        cancelButton?.setTitleTextAttributes([NSAttributedString.Key.foregroundColor :UIColor(red: 0.186, green: 0.146, blue: 0.044, alpha: 1),NSAttributedString.Key.font:UIFont.init(name: "Copperplate", size: 20) as Any], for: .normal)
        
        
        toolbar?.setItems([cancelButton!, flexSpace!, doneButton!], animated: false)
        
        
        textField.inputView = self.picker
        textField.inputAccessoryView = toolbar
    }

    // TF DELEGATEs
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.array.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(self.array[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.pickedNumber = String(array[row])
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return false
    }
    
    // DONE
    @objc private func done() {
        self.textField.text = self.pickedNumber
        self.superView.endEditing(true)
    }
    
    // CANCEL
    @objc private func cancel() {
        
        if self.pickedNumber == "" {
            self.textField.text = "Choose option"
            self.superView.endEditing(true)
            
        } else {
            self.textField.text = self.pickedNumber
            self.superView.endEditing(true)
        }
    }
}
