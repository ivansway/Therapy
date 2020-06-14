//
//  PresentationController.swift
//  Therapy
//
//  Created by Ivan Myrza on 14/06/2020.
//  Copyright © 2020 Ivan Myrza. All rights reserved.
//

import UIKit

class PresentationController: UIPresentationController {
    
    var heightVC: CGFloat!
    
    // GESTER RECOGNISER
    let recognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap))
    
    // INSTANCE
    private var dimmingView: UIView!
    private var direction: PresentationManager
    
    // PRESENTED PRESENTING VCs
    init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?, direction: PresentationManager, heightVC: CGFloat) {
        
        self.heightVC = heightVC
        
        self.direction = direction
        
        // DESIGNED INIT
        super.init(presentedViewController: presentedViewController,
                   presenting: presentingViewController)
        
        // SETUP DIMMING
        self.setupDimming()
    }
    
    // PRESENTATION WILL BEGIN
    override func presentationTransitionWillBegin() {
        
        guard let dimmingView = dimmingView else { return }
        
        containerView?.insertSubview(dimmingView, at: 0)
        
        
        NSLayoutConstraint.activate(
            NSLayoutConstraint.constraints(withVisualFormat: "V:|[dimmingView]|", options: [], metrics: nil, views: ["dimmingView": dimmingView]))
        NSLayoutConstraint.activate(
            NSLayoutConstraint.constraints(withVisualFormat: "H:|[dimmingView]|", options: [], metrics: nil, views: ["dimmingView": dimmingView]))
        
        
        guard let coordinator = presentedViewController.transitionCoordinator else { dimmingView.alpha = 1.0
            return
        }
        
        coordinator.animate(alongsideTransition: { _ in
            self.dimmingView.alpha = 1.0
        })
    }
    
    // DISMISS WILL BEGIN
    override func dismissalTransitionWillBegin() {
        guard let coordinator = presentedViewController.transitionCoordinator else { dimmingView.alpha = 0.0
        return }
        
        coordinator.animate(alongsideTransition: { _ in self.dimmingView.alpha = 0.0 })
    }
    
    // LAYOUT PRESENTED VIEW
    override func containerViewWillLayoutSubviews() {
        presentedView?.frame = frameOfPresentedViewInContainerView
    }
    
    // PRESENTED VC SIZE
    override func size(forChildContentContainer container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
        return CGSize(width: parentSize.width, height: parentSize.height)
    }

    // RETURN CHILD FRAIM
    override var frameOfPresentedViewInContainerView: CGRect {

        let bounds = containerView!.bounds
        let height = bounds.height / heightVC
        return CGRect(x: 0, y: height, width: bounds.width, height: bounds.height)
    }
}




extension PresentationController: UIViewControllerTransitioningDelegate {
    
    // DIMMING
    func setupDimming() {
        dimmingView = UIView()
        dimmingView.translatesAutoresizingMaskIntoConstraints = false
        dimmingView.backgroundColor = UIColor(white: 0.0, alpha: 0.5)
        dimmingView.alpha = 0.0
        
        // ADD RECOGNISER
        dimmingView.addGestureRecognizer(recognizer)
    }
    
    // DISMISS
    @objc func handleTap(recognizer: UITapGestureRecognizer) {
        presentingViewController.dismiss(animated: true)
    }
}
