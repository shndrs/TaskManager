//
//  ProfileImage.swift
//  TaskManager
//
//  Created by shndrs on 6/3/23.
//

import UIKit

final class ProfileImage: UIImageView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.addBorder(color: Colors.gold,
                       thickness: Border.light)
        self.addCornerRadius(radius: self.bounds.height / 2)
        self.clipsToBounds = true
    }

}
