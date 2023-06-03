//
//  TintButton.swift
//  TaskManager
//
//  Created by shndrs on 6/3/23.
//

class TintButton: BaseButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
}

// MARK: - Methods

extension TintButton {
    
    override func setup() {
        super.setup()
        self.backgroundColor = Colors.clear
        self.titleLabel?.textColor = Colors.label
        self.titleLabel?.font = Font.light.return(size: 15)
    }
    
}

// MARK: - Light Tint Button

final class LightTintButton: TintButton {
    
    override func setup() {
        super.setup()
        self.backgroundColor = Colors.clear
        self.titleLabel?.textColor = Colors.secondaryTint
        self.titleLabel?.font = Font.light.return(size: 15)
    }
    
}
