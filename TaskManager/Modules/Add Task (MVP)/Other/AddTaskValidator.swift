//
//  AddTaskValidator.swift
//  TaskManager
//
//  Created by shndrs on 6/3/23.
//

import Foundation

final class AddTaskValidator: NSObject {}

// MARK: - Methods

extension AddTaskValidator {
    
    func validate(inputs: IMTaskBoard) -> CustomError? {
        if inputs.title.isEmpty {
            return CustomError(description: Strings.titleIsEmpty.value())
        } else if inputs.description.isEmpty {
            return CustomError(description: Strings.descriptionIsEmpty.value())
        } else {
            return nil
        }
    }
    
}
