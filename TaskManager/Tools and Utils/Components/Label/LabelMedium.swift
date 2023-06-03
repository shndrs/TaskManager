//
//  LabelMedium.swift
//  TaskManager
//
//  Created by shndrs on 6/3/23.
//

import UIKit

// MARK: - Label Medium

final class LabelMedium: BaseLabel {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        font = Font.medium.return(size: font.pointSize)
    }
    
}
