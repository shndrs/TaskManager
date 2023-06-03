//
//  StringLocalized.swift
//  TaskManager
//
//  Created by shndrs on 6/3/23.
//

import Foundation

extension Strings {
    
    // MARK: - Italian
    
    @discardableResult
    func italian() -> String {
        switch self {
        case .appName:
            return "Gestore Attività"
        case .error:
            return "Errore"
        case .italian:
            return "Italiano"
        case .english:
            return "Inglese"
        case .selectLanguage:
            return "Seleziona la lingua"
        case .select:
            return "Selezionare"
        }
    }
    
    // MARK: - English
    
    @discardableResult
    func english() -> String {
        switch self {
        case .appName:
            return "Task Manager"
        case .error:
            return "Error"
        case .italian:
            return "Italian"
        case .english:
            return "English"
        case .selectLanguage:
            return "Select Language"
        case .select:
            return "Select"
        }
    }
    
}
