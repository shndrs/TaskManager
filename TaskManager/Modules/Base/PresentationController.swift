//
//  PresentationController.swift
//  TaskManager
//
//  Created by shndrs on 6/3/23.
//

import UIKit

class PresentationController: UIPresentationController {

    var presentedViewHeight: CGFloat = 300
    var blurEffectView: UIView! = {
        let view = UIView()
        view.backgroundColor = Colors.black
        return view
    }()
    var tapGestureRecognizer: UITapGestureRecognizer = UITapGestureRecognizer()
  
    override init(presentedViewController: UIViewController,
                  presenting presentingViewController: UIViewController?) {
        super.init(presentedViewController: presentedViewController,
                   presenting: presentingViewController)
        tapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                      action: #selector(dismissController))
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.blurEffectView.isUserInteractionEnabled = true
        self.blurEffectView.addGestureRecognizer(tapGestureRecognizer)
    }
  
    override var frameOfPresentedViewInContainerView: CGRect {
        var frame: CGRect = .zero
        frame.size = CGSize(width: containerView!.bounds.width, height: presentedViewHeight)
        frame.origin.y = containerView!.frame.height - presentedViewHeight
        return frame
    }

    override func presentationTransitionWillBegin() {
        self.blurEffectView.alpha = 0
        self.containerView?.addSubview(blurEffectView)
        self.presentedViewController.transitionCoordinator?
            .animate(alongsideTransition: { (UIViewControllerTransitionCoordinatorContext) in
            self.blurEffectView.alpha = 0.7
        }, completion: { (UIViewControllerTransitionCoordinatorContext) in })
    }
  
    override func dismissalTransitionWillBegin() {
        self.presentedViewController.transitionCoordinator?
            .animate(alongsideTransition: { (UIViewControllerTransitionCoordinatorContext) in
            self.blurEffectView.alpha = 0
        }, completion: { (UIViewControllerTransitionCoordinatorContext) in
            self.blurEffectView.removeFromSuperview()
        })
    }
  
    override func containerViewWillLayoutSubviews() {
        super.containerViewWillLayoutSubviews()
        presentedView!.roundCorners([.topLeft, .topRight], radius: 22)
    }

    override func containerViewDidLayoutSubviews() {
        super.containerViewDidLayoutSubviews()
        presentedView?.frame = frameOfPresentedViewInContainerView
        blurEffectView.frame = containerView!.bounds
    }

    @objc func dismissController(){
        self.presentedViewController.dismiss(animated: true, completion: nil)
    }
    
}

