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
        case .titleIsEmpty:
            return "Il titolo è vuoto!"
        case .descriptionIsEmpty:
            return "La descrizione è vuota!"
        case .success:
            return "Successo"
        case .add:
            return "Aggiungere"
        case .cancel:
            return "Annulla"
        case .addedSuccessfully:
            return "Aggiunto con successo"
        case .title:
            return "Title"
        case .description:
            return "Description"
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
        case .titleIsEmpty:
            return "Title is empty!"
        case .descriptionIsEmpty:
            return "Description is empty!"
        case .success:
            return "Success"
        case .add:
            return "Add the Task"
        case .cancel:
            return "Cancel"
        case .addedSuccessfully:
            return "Added Successfully"
        case .title:
            return "Title"
        case .description:
            return "Description"
        }
    }
    
}
