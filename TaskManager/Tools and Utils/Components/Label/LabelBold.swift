//
//  LabelBold.swift
//  TaskManager
//
//  Created by shndrs on 6/3/23.
//

import UIKit

// MARK: - Label Bold

class LabelBold: BaseLabel {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        font = Font.bold.return(size: font.pointSize)
    }
    
}
