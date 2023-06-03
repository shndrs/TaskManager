//
//  KeyboardManager.swift
//  TaskManager
//
//  Created by shndrs on 6/3/23.
//

import IQKeyboardManager

struct KeyboardManager {
    
    public static func applyConfig() {
        let keyboardManager = IQKeyboardManager.shared()
        keyboardManager.isEnabled = true
        keyboardManager.toolbarTintColor = Colors.label
        keyboardManager.toolbarBarTintColor = Colors.primaryBack
//        keyboardManager.toolbarDoneBarButtonItemText = Strings.done.value()
        keyboardManager.isEnableAutoToolbar = true
    }
    
}
