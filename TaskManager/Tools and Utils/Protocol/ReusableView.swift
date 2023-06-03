//
//  ReusableView.swift
//  TaskManager
//
//  Created by shndrs on 6/3/23.
//

import UIKit

protocol ReusableView {}

extension ReusableView where Self: UIView {

    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
}
