//
//  ImageButton.swift
//  TaskManager
//
//  Created by shndrs on 6/3/23.
//

import UIKit

final class ImageButton: UIButton {

    override func layoutSubviews() {
        super.layoutSubviews()
        self.tintColor = Colors.label
        self.setTitle(Strings.empty, for: .normal)
    }

}
