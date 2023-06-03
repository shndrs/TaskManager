//
//  LabelLight.swift
//  TaskManager
//
//  Created by shndrs on 6/3/23.
//

import UIKit

// MARK: - Label Light

class LabelLight: BaseLabel {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        font = Font.regular.return(size: font.pointSize)
    }
    
}
