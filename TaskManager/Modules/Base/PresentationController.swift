//
//  PresentationController.swift
//  TaskManager
//
//  Created by shndrs on 6/3/23.
//

import UIKit

class PresentationController: UIPresentationController {

    var presentedViewHeight: CGFloat = 300
    var backTransView: UIView! = {
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
        backTransView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        backTransView.isUserInteractionEnabled = true
        backTransView.addGestureRecognizer(tapGestureRecognizer)
    }
  
    override var frameOfPresentedViewInContainerView: CGRect {
        var frame: CGRect = .zero
        frame.size = CGSize(width: containerView!.bounds.width,
                            height: presentedViewHeight)
        frame.origin.y = containerView!.frame.height - presentedViewHeight
        return frame
    }

    override func presentationTransitionWillBegin() {
        self.backTransView.alpha = 0
        self.containerView?.addSubview(backTransView)
        self.presentedViewController.transitionCoordinator?
            .animate(alongsideTransition: { (UIViewControllerTransitionCoordinatorContext) in
            self.backTransView.alpha = 0.7
        }, completion: { (UIViewControllerTransitionCoordinatorContext) in })
    }
  
    override func dismissalTransitionWillBegin() {
        self.presentedViewController.transitionCoordinator?
            .animate(alongsideTransition: { (UIViewControllerTransitionCoordinatorContext) in
            self.backTransView.alpha = 0
        }, completion: { (UIViewControllerTransitionCoordinatorContext) in
            self.backTransView.removeFromSuperview()
        })
    }
  
    override func containerViewWillLayoutSubviews() {
        super.containerViewWillLayoutSubviews()
        presentedView!.roundCorners([.topLeft, .topRight], radius: 22)
    }

    override func containerViewDidLayoutSubviews() {
        super.containerViewDidLayoutSubviews()
        presentedView?.frame = frameOfPresentedViewInContainerView
        backTransView.frame = containerView!.bounds
    }

    @objc func dismissController(){
        self.presentedViewController.dismiss(animated: true, completion: nil)
    }
    
}
