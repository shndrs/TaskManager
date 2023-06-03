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
        case .completed:
            return "Completato"
        case .inProgress:
            return "In corso"
        case .myTasks:
            return "I miei Compiti"
        case .noTaskHere:
            return "Non c'è compito qui"
        case .addSomeTasks:
            return "Vai ad aggiungerne un po'"
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
        case .completed:
            return "Completed"
        case .inProgress:
            return "In Progress"
        case .myTasks:
            return "My Tasks"
        case .noTaskHere:
            return "There's no task here"
        case .addSomeTasks:
            return "Go add some"
        }
    }
    
}
