//
//  RoundedButton.swift
//  TaskManager
//
//  Created by shndrs on 6/3/23.
//

class RoundedButton: BaseButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
}

// MARK: - Methods

extension RoundedButton {
    
    override func setup() {
        super.setup()
        self.addBorder(color: Colors.label,
                       thickness: Border.normal)
        self.titleLabel?.textColor = Colors.white
    }
    
}
