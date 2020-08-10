//
//  AddParticipant.swift
//  Therapy
//
//  Created by Ivan Myrza on 15/07/2020.
//  Copyright © 2020 Ivan Myrza. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class AddParticipant {
    
    private var superView: UIView
    private var viewController: UIViewController
    
    private var bag = DisposeBag()
    private var signupVM: SignupViewModel?
    
    // PARTICIPANT's NAME
    internal var nameTF = [UITextField]()
    internal var surnameTF = [UITextField]()
    internal var birthdayTFArray = [UITextField]()
    internal var participantImageArray = [ParticipantImage]()
    internal var deleteButtonArray = [UIButton]()
    
    
    private var participantInstance: Participant!
    
    // PARTICIPANT
    internal var participantArray = [Participant]()
    
    // PARTICIPANT BACK ARRAY
    internal var participantBack = [UIView]()
    
    // PARTICIPANT TOP
    private var participantTop: CGFloat = 390
    
    init(superView: UIView, viewController: UIViewController) {
        self.superView = superView
        self.viewController = viewController
    }
    
    // ADD PARTICIPANT
    @objc internal func addParticipant() {
        
        // CONSTRUCT ARRAY
        constructArrays()
        
        let tag = nameTF.count - 1
        
        self.participantInstance = Participant(surnameTF: self.surnameTF[tag],
                                               nameTF: self.nameTF[tag],
                                               birthdayPickerTF: self.birthdayTFArray[tag],
                                               superView: self.superView,
                                               top: self.participantTop,
                                               imageIndex: tag,
                                               viewController: self.viewController,
                                               deleteParticipantB: self.deleteButtonArray[tag],
                                               surname: "",
                                               name: "",
                                               birthday:  "",
                                               image: self.participantImageArray[tag],
                                               back: self.participantBack[tag])
        
        self.participantArray.append(participantInstance)
        
        
        
        participantTop += 132
        
        // ADD TO BUTTONs TARGETs
        self.addToButtonTarget()
        
    }
    
    
    internal func constructArrays() {
        
        nameTF.append(UITextField())
        let tag = nameTF.count - 1
        nameTF[tag].tag = tag
        
        
        surnameTF.append(UITextField())
        surnameTF[tag].tag = tag
        
        deleteButtonArray.append(UIButton())
        deleteButtonArray[tag].tag = tag
        
        participantBack.append(UIView())
        participantBack[tag].tag = tag
        
        birthdayTFArray.append(UITextField())
        birthdayTFArray[tag].tag = tag
        
        participantImageArray.append(ParticipantImage())
        participantImageArray[tag].tag = tag
        
        assignUserDataToVM()
        
    }
    
    private func assignUserDataToVM() {
        
        for item in nameTF {
            item.rx.text
                .subscribe(onNext: { text in
                    self.signupVM?.observers(value: text ?? "",
                                             tag: item.tag,
                                             itemName: "name") })
                .disposed(by: bag)
        }
        
        for item in surnameTF {
            item.rx.text
                .subscribe(onNext: { text in
                    self.signupVM?.observers(value: text ?? "",
                                             tag: item.tag,
                                             itemName: "surname")
                })
                .disposed(by: bag)
        }
        
        for item in birthdayTFArray {
            item.rx.text
                .subscribe(onNext: { text in
                    self.signupVM?.observers(value: text ?? "",
                                             tag: item.tag,
                                             itemName: "birthday")
                })
                .disposed(by: bag)
        }
        
        for image in participantImageArray {
            
            Observable
                .from(optional: self.participantArray[image.tag].image)
                .subscribe(onNext: { image in print(image) })
                .disposed(by: bag)
            
        }
    }
    
    // ADD TO BUTTON TARGET
    private func addToButtonTarget() {
        for (index, button) in self.deleteButtonArray.enumerated() {
//            button.addTarget(self, action: #selector(deleteParticipant(sender:)), for: .touchUpInside)
            if index >= 1 {
                button.tag = index - 1
            } else {
                button.tag = index
            }
        }
    }
    
    // DELETE PARTICIPANT RELATED ITEMS FROM ARRAYS
    internal func deleteFromArray(tag: Int) {
        nameTF.remove(at: tag)
        surnameTF.remove(at: tag)
        deleteButtonArray.remove(at: tag)
        participantBack.remove(at: tag)
        birthdayTFArray.remove(at: tag)
    }
}


