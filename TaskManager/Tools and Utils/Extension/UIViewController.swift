//
//  UIViewController.swift
//  TaskManager
//
//  Created by shndrs on 6/3/23.
//

import UIKit

// MARK: - Storyboard Instantiate

extension UIViewController {
    
    class func instantiate(from storyboard: UIStoryboard? = nil) -> Self {
        return get(storyboard: storyboard)
    }
    
    class func instantiate(storyboard: StoryboardId) -> Self {
        return instantiate(from: UIStoryboard(name: storyboard.rawValue, bundle: nil))
    }
       
    @discardableResult
    private class func get<T: UIViewController>(storyboard: UIStoryboard? = nil) -> T {
        let className = String(describing: self)
        var story = storyboard
        if story == nil {
            story = UIStoryboard(name: className, bundle: .main)
        }
        return story!.instantiateViewController(withIdentifier: className) as! T
    }
    
}

// MARK: - Toast View

extension UIViewController {
    
    func show(error message: String) {
        Toast.shared.show(failure: message)
    }
    
    func show(information message: String) {
        Toast.shared.show(information: message)
    }
    
}
