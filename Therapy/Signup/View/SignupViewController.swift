//
//  MainVC.swift
//  Therapy
//
//  Created by Ivan Myrza on 13/06/2020.
//  Copyright © 2020 Ivan Myrza. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SignupViewController: UIViewController {
    
    // INSTANCE
    let interface = SignupInterface()
    let signupVM = SignupViewModel()
    let bag = DisposeBag()
    
    var userImage = UIImage()
    
    let number = BehaviorRelay(value: 0)
    
    // SCROLL VIEW
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    // RESIZING VIEW
    let resizingView: UIView = {
        let testView = UIView()
        testView.translatesAutoresizingMaskIntoConstraints = false
        return testView
    }()
    
    // VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        self.settings()
    }
    
    // SETTINGS
    func settings() {
        
        // BACK COLOR
        self.view.backgroundColor = UIColor(red: 0.961, green: 0.981, blue: 0.900, alpha: 1)
        
        // SCROLL VIEW
        ScrollView.setup(view: self.view, scrollView: self.scrollView, resizingView: self.resizingView, resizingViewTopAnchor: 1000)
        
        // HIDE NAV BAR
        self.navigationController?.navigationBar.isHidden = true
        
        //
        self.interface.setts(superView: self.scrollView)
        
        // MAIN IMAGE
        self.mainImage(superView: self.scrollView, image: nil)
        
        // SAVE BUTTON
        self.interface.saveButton.addTarget(self, action: #selector(save), for: .touchUpInside)
    
        // FETCH
        self.fetch()
        
        // CLOSE BUTTON
        self.close()
        
        // VERIFICATION
        self.verification()
    }
    
    // FETCH
    func fetch() {
        
        // OBSERVABLE FETCH
        self.signupVM.fetch()
        
        Observable.from(self.signupVM.launchData).subscribe({(launchInfo) in
            
            switch launchInfo.element?.key {
            case "name":
                self.interface.nameTF.text = launchInfo.element?.value as? String
            case "surname":
                self.interface.surnameTF.text = launchInfo.element?.value as? String
            case "image":
                self.mainImage(superView: self.scrollView, image: launchInfo.element?.value as? UIImage)
            default:
                print("")
            }
        })
    .disposed(by: bag)
    }
    
    // CLOSE BUTTON
    func close() {
        let button = UIButton()
        guard let image = UIImage(named: "X_close") else { return }
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(pop), for: .touchUpInside)
        Constraints.widthHeightLeadingTop(superView: self.scrollView, view: button, widthAnchor: 23, heightAnchor: 23, leadingAnchor: 18, topAnchor: 20)
    }
    
    
    
    // MAIN IMAGE
    func mainImage(superView: UIView, image: UIImage?) {
        
        let mainImage = UIButton()
        mainImage.layer.borderWidth = 1
        mainImage.layer.cornerRadius = 20
        mainImage.clipsToBounds = true
        mainImage.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor
        mainImage.addTarget(self, action: #selector(openPickerController), for: .touchUpInside)
        
        superView.addSubview(mainImage)
        mainImage.translatesAutoresizingMaskIntoConstraints = false
        mainImage.widthAnchor.constraint(equalTo: superView.widthAnchor, constant: -32).isActive = true
        mainImage.heightAnchor.constraint(equalToConstant: 134).isActive = true
        mainImage.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: 16).isActive = true
        mainImage.topAnchor.constraint(equalTo: superView.topAnchor, constant: 180).isActive = true
        
        
        // IMAGE
        if let image = image {
            mainImage.setImage(image, for: .normal)
            self.userImage = image
        } else {
            // PHOTO ICON
            self.photoIcon(superView: mainImage)
        }
        
    }
    
    // PHOTO BUTTON
    func photoIcon(superView: UIView) {
        
        let photoButton = UIButton()
        guard let image = UIImage(named: "photo_icon") else { return }
        photoButton.setImage(image, for: .normal)
        photoButton.layer.opacity = 0.5
        photoButton.addTarget(self, action: #selector(openPickerController), for: .touchUpInside)
        
        superView.addSubview(photoButton)
        photoButton.translatesAutoresizingMaskIntoConstraints = false
        photoButton.topAnchor.constraint(equalTo: superView.topAnchor, constant: 42).isActive = true
        photoButton.centerXAnchor.constraint(equalTo: superView.centerXAnchor).isActive = true
        photoButton.widthAnchor.constraint(equalToConstant: 46).isActive = true
        photoButton.heightAnchor.constraint(equalToConstant: 36).isActive = true
    }
    
    
    // VERIFICATION
    func verification() {
       
        self.interface.nameTF.rx.text.map { $0 ?? "" }.bind(to: signupVM.nameText).disposed(by: bag)
        self.interface.surnameTF.rx.text.map { $0 ?? "" }.bind(to: signupVM.surnameText).disposed(by: bag)
        
        signupVM.notEmpty().bind(to: interface.saveButton.rx.isEnabled).disposed(by: bag)
        signupVM.notEmpty().map { $0 ? 1 : 0.4 }.bind(to: interface.saveButton.rx.alpha).disposed(by: bag)
        
//        signupVM.notEmpty().bind(onNext: { _ in self.save() }).disposed(by: bag)
    }
    
    // SAVE
    @objc func save() {
        self.interface.save(image: userImage)
        pop()
    }
}

    // IMAGE PICKER CONFIGURATIONS
extension SignupViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
   
    @objc func openPickerController() {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        picker.delegate = self
        self.present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.editedImage] as? UIImage {
            mainImage(superView: scrollView, image: image)
            picker.dismiss(animated: true)
        }
    }
}
