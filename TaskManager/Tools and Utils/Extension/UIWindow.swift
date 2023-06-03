//
//  UIWindow.swift
//  TaskManager
//
//  Created by shndrs on 6/3/23.
//

import UIKit

extension UIWindow {
    
    /// - Note: Empty UIViewControllers stack and start with new one (UIViewController based object such as Navigation, TableView and etc...)

    func switchRootViewController(_ viewController: UIViewController,
                                  animated: Bool = true,
                                  duration: TimeInterval = 0.5,
                                  options: UIView.AnimationOptions = .transitionFlipFromRight,
                                  completion: Action? = nil) {
        guard animated else {
            rootViewController = viewController
            return
        }
        UIView.transition(with: self, duration: duration, options: options, animations: {
            let oldState = UIView.areAnimationsEnabled
            UIView.setAnimationsEnabled(false)
            self.rootViewController = viewController
            UIView.setAnimationsEnabled(oldState)
        }) { _ in
            self.makeKeyAndVisible()
            completion?()
        }
    }
    
}
