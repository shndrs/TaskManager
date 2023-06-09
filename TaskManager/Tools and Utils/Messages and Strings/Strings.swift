//
//  Strings.swift
//  TaskManager
//
//  Created by shndrs on 6/3/23.
//

enum Strings: String {
    
    // MARK: - Common Constant
    
    static let empty = ""
    static let placeholderDash = "----"
    static let dash = "-"
    static let plus = "+"
    static let slash = "/"
    static let space = " "
    
    // MARK: - Common
    
    case appName
    case error
    case italian
    case english
    case select
    case success
    case add
    case cancel
    
    // MARK: - Language Selection
    
    case selectLanguage
    
    // MARK: - Task Board
    
    case completed
    case inProgress
    case myTasks
    case noTaskHere
    case addSomeTasks
    
    // MARK: - Add Task
    
    case titleIsEmpty
    case descriptionIsEmpty
    case addedSuccessfully
    case title
    case description
        
}

// MARK: - Methods

extension Strings {
    
    func value() -> String {
        let langString = Language.current().rawValue
        let lang = Language.getLang(with: langString)
        switch lang {
        case .english:
            return english()
        case .italian:
            return italian()
        }
    }
        
}

