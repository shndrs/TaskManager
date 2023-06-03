//
//  BaseTextField.swift
//  TaskManager
//
//  Created by shndrs on 6/3/23.
//

import SkyFloatingLabelTextField

class BaseTextField: SkyFloatingLabelTextField {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
        self.addTarget(self,
                       action: #selector(clearErrorMessage),
                       for: .editingChanged)
    }
    
    @objc func clearErrorMessage() {
        self.errorMessage = Strings.empty
    }
    
}

// MARK: - Methods

extension BaseTextField {
    
    @objc func setup() {
        self.textColor = Colors.label
        self.font = Font.regular.return(size: 14)
        self.errorLabel.font = Font.light.return(size: 12)
        self.placeholderFont = Font.regular.return(size: 13)
        self.titleFont = Font.regular.return(size: 12)
        self.borderStyle = .none
        self.backgroundColor = Colors.clear
        self.selectedTitleColor = Colors.secondaryTint
        self.selectedLineColor = Colors.secondaryTint
        self.errorMessagePlacement = .bottom
        self.errorColor = Colors.cancel
    }
    
}
