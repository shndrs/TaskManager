//
//  BaseButton.swift
//  TaskManager
//
//  Created by shndrs on 6/3/23.
//

import UIKit

class BaseButton: UIButton {
    
    override var isEnabled: Bool {
        didSet {
            alpha = isEnabled ? 1.0 : 0.4
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }
    
}

// MARK: - Methods

extension BaseButton {
    
    @objc func setup() {
        self.addCornerRadius(radius: 16)
        self.titleLabel?.textAlignment = .center
        self.titleLabel?.numberOfLines = 1
        self.titleLabel?.sizeToFit()
        self.titleLabel?.font = Font.medium.return(size: 17)
        self.setTitleColor(Colors.label, for: .normal)
        self.backgroundColor = Colors.primaryTint
    }
    
    func changeDisableButtonColor(button: UIButton, color: UIColor) {
        let rect = CGRect(x: 0.0, y: 0.0,
                          width: self.frame.width,
                          height: self.frame.height)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        let image: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        button.setBackgroundImage(image, for: .disabled)
    }
    
}
