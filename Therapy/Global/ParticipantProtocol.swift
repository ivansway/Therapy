//
//  ParticipantProtocol.swift
//  Therapy
//
//  Created by Ivan Myrza on 05/07/2020.
//  Copyright © 2020 Ivan Myrza. All rights reserved.
//

import UIKit

protocol ParticipantProtocol {
    
    // TF
    var surnameTF: UITextField { get }
    var nameTF: UITextField { get }
    var birthdayPickerTF: UITextField { get }
    var nameTextField: TextField! { get }
    var surnameTextField: TextField! { get }
    
    
    var back: UIView { get }
    var superView: UIView { get }
    
    var top: CGFloat { get }
    
    var imageIndex: Int { get }
    
    // VIEW CONTROLLER
    var viewController: UIViewController { get }
    
    // BUTTON
    var deleteParticipantB: UIButton { get }
    
    // PICKER
    var birthdayPicker: DatePicker! { get }
    
    var surname: String { get set }
    var name: String { get set }
    var birthday: String { get set }
    var image: UIImage { get set }
    
    
    // INIT
    init(surnameTF: UITextField,
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
    
    func setup()
    func setupUserData()
    func title(title: String, top: CGFloat)
    func deleteParticipant()
    func avatar(_ image: UIImage?)
    func openPickerController()
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
}
